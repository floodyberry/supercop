/*
 * Kiasu=/=-128 Optimized AES-NI C Implementation
 * 
 * Copyright 2014:
 *     Ivica Nikolic <INikolic@ntu.edu.sg>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 * 
 */

#include <string.h>
#include <time.h>
#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include <wmmintrin.h>              /* SSSE3 instructions              */
#include <tmmintrin.h>              /* SSSE3 instructions              */
#include "aes_ni.macros"
#include "ae.macros"

	  

static __m128i assist128(__m128i a, __m128i b)
{
    __m128i tmp = _mm_slli_si128 (a, 0x04);
    a = _mm_xor_si128 (a, tmp);
    tmp = _mm_slli_si128 (tmp, 0x04);
    a = _mm_xor_si128 (_mm_xor_si128 (a, tmp), _mm_slli_si128 (tmp, 0x04));
    return _mm_xor_si128 (a, _mm_shuffle_epi32 (b ,0xff));
}
static void set_encryption_key( const unsigned char *key, __m128i *subkeys)
{
    subkeys[ 0] = _mm_loadu_si128((__m128i*)key);
    subkeys[ 1] = assist128(subkeys[0], _mm_aeskeygenassist_si128(subkeys[0],0x1));
    subkeys[ 2] = assist128(subkeys[1], _mm_aeskeygenassist_si128(subkeys[1],0x2));
    subkeys[ 3] = assist128(subkeys[2], _mm_aeskeygenassist_si128(subkeys[2],0x4));
    subkeys[ 4] = assist128(subkeys[3], _mm_aeskeygenassist_si128(subkeys[3],0x8));
    subkeys[ 5] = assist128(subkeys[4], _mm_aeskeygenassist_si128(subkeys[4],0x10));
    subkeys[ 6] = assist128(subkeys[5], _mm_aeskeygenassist_si128(subkeys[5],0x20));
    subkeys[ 7] = assist128(subkeys[6], _mm_aeskeygenassist_si128(subkeys[6],0x40));
    subkeys[ 8] = assist128(subkeys[7], _mm_aeskeygenassist_si128(subkeys[7],0x80));
    subkeys[ 9] = assist128(subkeys[8], _mm_aeskeygenassist_si128(subkeys[8],0x1b));
    subkeys[10] = assist128(subkeys[9], _mm_aeskeygenassist_si128(subkeys[9],0x36));
}

static void set_decryption_key( const unsigned char *key, __m128i *subkeys)
{
    __m128i tmp = _mm_loadu_si128((__m128i*)key);
    
    subkeys[10] = tmp;
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x1 )); subkeys[9] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x2 )); subkeys[8] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x4 )); subkeys[7] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x8 )); subkeys[6] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x10)); subkeys[5] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x20)); subkeys[4] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x40)); subkeys[3] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x80)); subkeys[2] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x1b)); subkeys[1] = mc_inv(tmp);
    tmp = assist128(tmp, _mm_aeskeygenassist_si128(tmp,0x36)); subkeys[0] = tmp;  
}

    

int kiasu_aead_encrypt(const unsigned char *ass_data, unsigned long long int ass_data_len, 
		       const unsigned char *message, unsigned long long int m_len, 
		       const unsigned char *key, const unsigned char *nonce, 
		       unsigned char *ciphertext, unsigned long long int *c_len)
{

    unsigned int i,j;
    unsigned char last_block[16];    
    const __m128i ONE 			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,1,0,0);
    const __m128i EIGHT 		= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,8,0,0);
    const __m128i SEIGHT 		= constant8( 8,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0);
    const __m128i STAGE_MASK   		= constant8( 0x1f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xe0,0x00,0xff,0xff, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD  	 	= constant8( (0x2<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST	 	= constant8( (0x6<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M  	 	= constant8( (0x0<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_ZERO 	= constant8( (0x1<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_NONZERO 	= constant8( (0x4<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_CHKSUM 		= constant8( (0x5<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i PERM_MASK		= constant8( 13,12,9,8, 5,4,1,0, 2,3,6,7, 10,11,14,15 ); 
    const __m128i PERM_MASK_INVERSE	= constant8( 7,6,8,9, 5,4,10,11, 3,2,12,13, 1,0,14,15 ); 
    __m128i tmp;
    __m128i subkeys[11];
    __m128i Final;
    __m128i Pad;
    __m128i States[8];
    __m128i Tweaks[8];
    __m128i State;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 3) 			, (nonce[0]&7) << 5 ^ (nonce[1] >> 3) , 0 , 0 , 
							(nonce[1]&7) << 5 ^ (nonce[2] >> 3)   	, (nonce[2]&7) << 5 ^ (nonce[3] >> 3) , 0 , 0 , 
							(nonce[3]&7) << 5                     	,      0                              , 0 , 0 , 
										0               ,      1                              , 0 , 0 );
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    							
    
    // Set up the round keys for AES
    set_encryption_key( key , subkeys );
    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;        
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    
    // If associated data length < 128, do no try to optimize
    if( ass_data_len < 128 ){
      while (16*i <= ass_data_len) {
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  AES( State, subkeys, Tweak );
	  Auth = xor ( Auth, State );  	
	  i++;
      } 
    }
    // Else process 8 blocks in parallel
    else{
	
      GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );      

      // Absorb all 128-byte blocks       
      i = 1;
      while (16*(i+7) <= ass_data_len) {
	  PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * (i-1) , Auth );
	  if( 30 == ( (i>>3) % 32) ){ 
	    Tweaks[0] = add8( Tweaks[0] , EIGHT );
	    Tweaks[1] = add8( Tweaks[1] , EIGHT );
	    Tweaks[2] = add8( Tweaks[2] , EIGHT );
	    Tweaks[3] = add8( Tweaks[3] , EIGHT );
	    Tweaks[4] = add8( Tweaks[4] , EIGHT );
	    Tweaks[5] = add8( Tweaks[5] , EIGHT );
	    Tweaks[6] = add8( Tweaks[6] , EIGHT );
	    ADD_TO_TWEAK( Tweaks[7] , SEIGHT );
	  }
	  else if ( 31 == ( (i>>3) % 32) ){
	    ADD_TO_TWEAK( Tweaks[0] , SEIGHT );	
	    ADD_TO_TWEAK( Tweaks[1] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[2] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[3] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[4] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[5] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[6] , SEIGHT );
	    Tweaks[7] = add8( Tweaks[7] , EIGHT );	  
	  }
	  else {	  
	    INCREASE_8_TWEAKS_SIMPLE( Tweaks );
	  }
	  i += 8;	
      }
      
      // Absorb the remaining full 16-byte blocks
      i = 1 + ((ass_data_len/128)*128/16);      
      while (16*i <= ass_data_len) {			  
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak );
	  Auth = xor( Auth , State );
	  i++;	
      }      
    }
        
    /* Last block if incomplete */
    i =  (ass_data_len/16);
    if ( (ass_data_len==0) || (ass_data_len > 16*i) ) {

        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
        last_block[ass_data_len-16*i]=0x80;

        /* Encrypt the last block */
	SET_STAGE_IN_TWEAK(Tweak, MSB_AD_LAST);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	State = load( (__m128i *) ( last_block ) );			
	AES( State, subkeys, Tweak );

        /* Update the Auth value */
        Auth = xor ( Auth, State );  
    }
    
    
    
    /*
     *
     *
     * 			Message 
     *
     *
     */
    i=1;    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);    
    
    // If message length < 128 bytes, do not try to optimize
    if( m_len < 128 ){
      while (16*i <= m_len) {			
	  State = load( (__m128i *) ( message + 16 * (i-1) ) );		
	  Checksum = xor( Checksum , State );
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak );
	  store( ciphertext+16*(i-1) , State );      
	  i++;	
      }
      i = m_len / 16;;      
    }
    // Else proccess 8 blocks in parallel 
    else{
    
      GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );      
      
      // Absorb all 128-byte blocks 
      i = 1 ;      
      while (16*(i+7) <= m_len) {
	  PROCESS_8_MESSAGE_BLOCKS( States, message + 16 * (i-1) , ciphertext + 16 * (i-1 )  , Checksum ); 
	  if( 30 == ( (i>>3) % 32) ){ 
	    Tweaks[0] = add8( Tweaks[0] , EIGHT );
	    Tweaks[1] = add8( Tweaks[1] , EIGHT );
	    Tweaks[2] = add8( Tweaks[2] , EIGHT );
	    Tweaks[3] = add8( Tweaks[3] , EIGHT );
	    Tweaks[4] = add8( Tweaks[4] , EIGHT );
	    Tweaks[5] = add8( Tweaks[5] , EIGHT );
	    Tweaks[6] = add8( Tweaks[6] , EIGHT );
	    ADD_TO_TWEAK( Tweaks[7] , SEIGHT );
	  }
	  else if ( 31 == ( (i>>3) % 32) ){
	    ADD_TO_TWEAK( Tweaks[0] , SEIGHT );	
	    ADD_TO_TWEAK( Tweaks[1] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[2] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[3] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[4] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[5] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[6] , SEIGHT );
	    Tweaks[7] = add8( Tweaks[7] , EIGHT );	  
	  }
	  else {	  
	    INCREASE_8_TWEAKS_SIMPLE( Tweaks );
	  }
	  i += 8;	
      }            
      
      // Absorb the remaining full 16-byte blocks 
      i = 1 + ((m_len/128)*128/16);      
      while (16*i <= m_len) {			  
	  State = load( (__m128i *) ( message + 16 * (i-1) ) );		
	  Checksum = xor( Checksum , State );
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak );
	  store( ciphertext+16*(i-1) , State );      
	  i++;	
      }
    }
    
    i = m_len / 16;;
    // Process last block 
    // If the block is full, i.e. M_last=epsilon 
    if (m_len == 16*i) {
	SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_ZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Final = Checksum;
	AES( Final , subkeys, Tweak );
    } 
    // If the block is partial 
    else { 
        
        SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_NONZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Pad = constant32( 0,0,0,0 );
	AES( Pad , subkeys, Tweak )
        
	memset(last_block, 0, 16);
        memcpy(last_block, message +16*i, m_len-16*i);
        last_block[m_len-16*i]=0x80;
	tmp = load( (__m128i *) ( last_block ) );		
	Checksum = xor( Checksum, tmp );
	
	Pad = xor ( Pad , tmp );
	store( last_block, Pad);
	for(j=0; j<m_len-16*i; j++)
	  ciphertext[16*i+j] = last_block[j] ;      
        
	SET_STAGE_IN_TWEAK(Tweak, MSB_CHKSUM);
	Final = Checksum; 
	AES( Final , subkeys, Tweak );
    }
    
    Final = xor( Final , Auth );
    store( last_block , Final );
    memcpy( ciphertext+m_len , last_block , 16 );
        
    *c_len=m_len+16;

    return 0;
    
}


int kiasu_aead_decrypt(const unsigned char *ass_data, unsigned long long ass_data_len, 
			unsigned char *message, unsigned long long int *m_len, 
			const unsigned char *key, const unsigned char *nonce, 
		       const unsigned char *c, unsigned long long c_len
			)
{

    unsigned int i,j;
    unsigned char last_block[16];    
    const __m128i ONE 			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,1,0,0);
    const __m128i EIGHT 		= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,8,0,0);
    const __m128i SEIGHT 		= constant8( 8,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0);
    const __m128i STAGE_MASK   		= constant8( 0x1f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xe0,0x00,0xff,0xff, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD  	 	= constant8( (0x2<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST	 	= constant8( (0x6<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M  	 	= constant8( (0x0<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_ZERO 	= constant8( (0x1<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_NONZERO 	= constant8( (0x4<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_CHKSUM 		= constant8( (0x5<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i PERM_MASK		= constant8( 13,12,9,8, 5,4,1,0, 2,3,6,7, 10,11,14,15 ); 
    const __m128i PERM_MASK_INVERSE	= constant8( 7,6,8,9, 5,4,10,11, 3,2,12,13, 1,0,14,15 ); 
    __m128i tmp;
    __m128i subkeys[11], dsubkeys[11];
    __m128i Final;
    __m128i Pad;
    __m128i States[8];
    __m128i Tweaks[8], dTweaks[8];
    __m128i State;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 3) 			, (nonce[0]&7) << 5 ^ (nonce[1] >> 3) , 0 , 0 , 
							(nonce[1]&7) << 5 ^ (nonce[2] >> 3)   	, (nonce[2]&7) << 5 ^ (nonce[3] >> 3) , 0 , 0 , 
							(nonce[3]&7) << 5                     	,      0                              , 0 , 0 , 
										0               ,      1                              , 0 , 0 );
    __m128i dTweak;
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    							
    
    // Set up the round keys for AES
    set_encryption_key( key , subkeys );
    set_decryption_key( key , dsubkeys );
    

    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;        
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    
    // If associated data length < 128, do no try to optimize
    if( ass_data_len < 128 ){
      while (16*i <= ass_data_len) {
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  AES( State, subkeys, Tweak );
	  Auth = xor ( Auth, State );  	
	  i++;
      } 
    }
    // Else process 8 blocks in parallel
    else{
	
      GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );      

      // Absorb all 128-byte blocks       
      i = 1;
      while (16*(i+7) <= ass_data_len) {
	  PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * (i-1) , Auth );
	  if( 30 == ( (i>>3) % 32) ){ 
	    Tweaks[0] = add8( Tweaks[0] , EIGHT );
	    Tweaks[1] = add8( Tweaks[1] , EIGHT );
	    Tweaks[2] = add8( Tweaks[2] , EIGHT );
	    Tweaks[3] = add8( Tweaks[3] , EIGHT );
	    Tweaks[4] = add8( Tweaks[4] , EIGHT );
	    Tweaks[5] = add8( Tweaks[5] , EIGHT );
	    Tweaks[6] = add8( Tweaks[6] , EIGHT );
	    ADD_TO_TWEAK( Tweaks[7] , SEIGHT );
	  }
	  else if ( 31 == ( (i>>3) % 32) ){
	    ADD_TO_TWEAK( Tweaks[0] , SEIGHT );	
	    ADD_TO_TWEAK( Tweaks[1] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[2] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[3] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[4] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[5] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[6] , SEIGHT );
	    Tweaks[7] = add8( Tweaks[7] , EIGHT );	  
	  }
	  else {	  
	    INCREASE_8_TWEAKS_SIMPLE( Tweaks );
	  }
	  i += 8;	
	  
      }
      
      // Absorb the remaining full 16-byte blocks
      i = 1 + ((ass_data_len/128)*128/16);      
      while (16*i <= ass_data_len) {			  
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak );
	  Auth = xor( Auth , State );
	  i++;	
      }      
    }       
        

    /* Last block if incomplete */
    i =  (ass_data_len/16);
    if ( (ass_data_len==0) || (ass_data_len > 16*i) ) {

        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
        last_block[ass_data_len-16*i]=0x80;

        /* Encrypt the last block */
	SET_STAGE_IN_TWEAK(Tweak, MSB_AD_LAST);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	State = load( (__m128i *) ( last_block ) );			
	AES( State, subkeys, Tweak );

        /* Update the Auth value */
        Auth = xor ( Auth, State );  
	
    }
    
    
    
    
    
    /*
     *
     *
     * 			Ciphertext 
     *
     *
     */
    i=1;    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);    
    
    // If ciphertext length < 128 bytes, do not try to optimize
    if( c_len-16 < 128 ){
      while (16*i <= c_len-16) {			
	  State = load( (__m128i *) ( c + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  dTweak = mc_inv(Tweak);
	  AES_DEC( State, dsubkeys, Tweak , dTweak );
	  store( message+16*(i-1) , State );      
	  Checksum = xor( Checksum , State );
	  i++;	
	  
      }
      i = (c_len-16) / 16;;      
    }
    // Else proccess 8 blocks in parallel 
    else{
    
      GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );     
      
      // Absorb all 128-byte blocks 
      i = 1 ;      
      while (16*(i+7) <= c_len-16) {
	  GET_MC_INV_TWEAKS( Tweaks, dTweaks);	  
	  PROCESS_8_CIPHERTEXT_BLOCKS( States, dsubkeys, Tweaks, dTweaks, c + 16 * (i-1) , message + 16 * (i-1 )  , Checksum ); 
	  if( 30 == ( (i>>3) % 32) ){ 
	    Tweaks[0] = add8( Tweaks[0] , EIGHT ); 
	    Tweaks[1] = add8( Tweaks[1] , EIGHT );
	    Tweaks[2] = add8( Tweaks[2] , EIGHT );
	    Tweaks[3] = add8( Tweaks[3] , EIGHT );
	    Tweaks[4] = add8( Tweaks[4] , EIGHT );
	    Tweaks[5] = add8( Tweaks[5] , EIGHT );
	    Tweaks[6] = add8( Tweaks[6] , EIGHT );
	    ADD_TO_TWEAK( Tweaks[7] , SEIGHT );
	  }
	  else if ( 31 == ( (i>>3) % 32) ){
	    ADD_TO_TWEAK( Tweaks[0] , SEIGHT );	
	    ADD_TO_TWEAK( Tweaks[1] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[2] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[3] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[4] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[5] , SEIGHT );
	    ADD_TO_TWEAK( Tweaks[6] , SEIGHT );
	    Tweaks[7] = add8( Tweaks[7] , EIGHT );	  
	  }
	  else {	  
	    INCREASE_8_TWEAKS_SIMPLE( Tweaks );
	  }
	  
	  i += 8;	
      }            
      
      // Absorb the remaining full 16-byte blocks 
      i = 1 + (((c_len-16)/128)*128/16);      
      while (16*i <= c_len-16) {			  
	  State = load( (__m128i *) ( c + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  dTweak = mc_inv(Tweak);
	  AES_DEC( State, dsubkeys, Tweak, dTweak );
	  Checksum = xor( Checksum , State );
	  store( message+16*(i-1) , State );      
	  i++;	
	  
      }
    }
    
      
    i = (c_len-16) / 16;;
    // Process last block 
    // If the block is full, i.e. M_last=epsilon 
    if ((c_len-16) == 16*i) {
	SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_ZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Final = Checksum;
	AES( Final , subkeys, Tweak );
    } 
    // If the block is partial 
    else {         
        SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_NONZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Pad = constant32( 0,0,0,0 );
	AES( Pad , subkeys, Tweak );
	
	store( last_block, Pad );	
	for(j=0; j<c_len-16-16*i; j++)last_block[j] ^= c[16*i+j]; 
	memcpy( message + 16*i, last_block, c_len-16-16*i);
	
	memset( last_block + c_len-16-16*i, 0 , 16 - (c_len-16-16*i) );
	last_block[c_len-16-16*i]=0x80;
	tmp = load( (__m128i *) ( last_block ) );	
	Checksum = xor( Checksum, tmp );
	
	Final = Checksum; 
	SET_STAGE_IN_TWEAK(Tweak, MSB_CHKSUM);
	AES( Final , subkeys, Tweak );
	
    }
    
    Final = xor( Final , Auth );
    
    
    store( last_block , Final );
    for(j=0; j<16; j++)
      if( last_block[j] ^ c[c_len-16+j] )
	return -1;
      
        
    *m_len=c_len-16;
    
    return 0;
}


