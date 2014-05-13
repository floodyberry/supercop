/*
 * Deoxys=/=-256 Optimized AES-NI C Implementation
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
#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include <wmmintrin.h>              /* SSSE3 instructions              */
#include <tmmintrin.h>              /* SSSE3 instructions              */
#include "tweakable-cipher.macros"
#include "ae.macros"
    

int deoxys_aead_encrypt(const unsigned char *ass_data, unsigned long long int ass_data_len, 
			 const unsigned char *message, unsigned long long int m_len, 
			 const unsigned char *key, const unsigned char *nonce, 
			 unsigned char *ciphertext, unsigned long long int *c_len)
{

    unsigned long long int  i;
    unsigned char last_block[16];    
    const __m128i EIGHT			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i SEIGHT		= constant8( 0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);    
    const __m128i STAGE_MASK   		= constant8( 0x1f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xe0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );      
    const __m128i MSB_AD  	 	= constant8( (0x2<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST	 	= constant8( (0x6<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M  	 	= constant8( (0x0<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_ZERO 	= constant8( (0x1<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_NONZERO 	= constant8( (0x4<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_CHKSUM 		= constant8( (0x5<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i PERM_MASK		= constant8( 0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8 ); 
    const __m128i H_PERMUTATION  	= constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );   	
    __m128i ADD_ONE			= constant8( 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1 );   	
    __m128i RCONS[17];
    __m128i tmp;
    __m128i subkeys[17], tsubkeys1[17], tsubkeys2[17];
    __m128i Final;
    __m128i Pad;
    __m128i States[8];
    __m128i State;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 3) 		    , 
							(nonce[0]&7) << 5 ^ (nonce[1] >> 3) ,  
							(nonce[1]&7) << 5 ^ (nonce[2] >> 3) , 
							(nonce[2]&7) << 5 ^ (nonce[3] >> 3) , 
							(nonce[3]&7) << 5 ^ (nonce[4] >> 3) , 
							(nonce[4]&7) << 5 ^ (nonce[5] >> 3) ,  
							(nonce[5]&7) << 5 ^ (nonce[6] >> 3) ,  
							(nonce[6]&7) << 5 ^ (nonce[7] >> 3) ,  
							(nonce[7]&7) << 5                   , 
							0 , 0 , 0 , 0 , 0 , 0 , 0);
    __m128i tTweak;
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    // Required for the multiplication in the key schedule
    __m128i msb_mask 			= constant8( 0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80);
    __m128i trivial_permutation 	= constant8( 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
    __m128i simply_1b  			= constant8( 0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b);
    __m128i kill_shift			= constant8( 0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe);
    __m128i msbits, multi_mask, rot_cons; 
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};
    __m128i tw_c[8][8];
    
    // Set up tweak constants
    tmp = ADD_ONE;
    for(i=0; i<8; i++){
      tw_c[i][0] = constant8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      tw_c[i][1] = add8(tw_c[i][0], tmp );
      tw_c[i][2] = add8(tw_c[i][1], tmp );
      tw_c[i][3] = add8(tw_c[i][2], tmp );
      tw_c[i][4] = add8(tw_c[i][3], tmp );
      tw_c[i][5] = add8(tw_c[i][4], tmp );
      tw_c[i][6] = add8(tw_c[i][5], tmp );
      tw_c[i][7] = add8(tw_c[i][6], tmp );
      
      tmp = permute( tmp, H_PERMUTATION );
      
    }
    
    // Set up the round keys for AES
    for(i=0; i<17;i++){
      RCONS[i] = constant8( 1,2,4,8, rcon[i], rcon[i], rcon[i], rcon[i],  0,0,0,0,  0,0,0,0);
    }
    TWEAKEY_SCHEDULE3( tsubkeys1,tsubkeys2,subkeys, key);
    
    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;        
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    // If associated data length < 128, do no try to optimize
    if( ass_data_len < 112 ){
      while (16*i <= ass_data_len) {
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  AES( State, subkeys, Tweak, tTweak );
	  Auth = xor ( Auth, State );  	
	  i++;
      } 
    }
    // Else process 8 blocks in parallel
    else{
      
      // First absorb the next 7 blocks to make the counter multiple of 8
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	       
      tTweak = Tweak;
      PROCESS_7_ASS_DATA_BLOCKS( States, ass_data , Auth , tTweak );    
   
      i = 8;
      Tweak = add8( Tweak, EIGHT);      
      // Absorb all 128-byte blocks (8 in parallel)
      while (16*(i+7) <= ass_data_len) {
	
	  tTweak = Tweak ;	
	  PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * (i-1) , Auth , tTweak );
	  
	  if(!( (i+8)%256)){
	    ADD_TO_TWEAK( Tweak, SEIGHT);
	  }
	  else 
	    Tweak = add8 (Tweak, EIGHT );
	  
	  i += 8;
      }      
      // Absorb the remaining full 16-byte blocks
      while (16*i <= ass_data_len) {			  
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak, tTweak );
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
	AES( State, subkeys, Tweak, tTweak );

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
    if( m_len < 112 ){
      while (16*i <= m_len) {			
	  State = load( (__m128i *) ( message + 16 * (i-1) ) );		
	  Checksum = xor( Checksum , State );
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak, tTweak );
	  store( ciphertext+16*(i-1) , State );      
	  i++;	
      }
      i = m_len / 16;;      
    }
    // Else proccess 8 blocks in parallel 
    else{
    
      // First absorb the next 7 blocks to make the counter multiple of 8
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	       
      tTweak = Tweak;
      PROCESS_7_MESSAGE_BLOCKS( States, message  , ciphertext  , Checksum , tTweak ); 	  
      
      i = 8;
      Tweak = add8( Tweak, EIGHT);      
      // Absorb all 128-byte blocks (8 in parallel)
      while (16*(i+7) <= m_len) {
	
	  tTweak = Tweak ;	
	  PROCESS_8_MESSAGE_BLOCKS( States, message + 16 * (i-1) , ciphertext + 16 * (i-1 )  , Checksum , tTweak ); 	  
	  
	  if(!( (i+8)%256)){
	    ADD_TO_TWEAK( Tweak, SEIGHT);
	  }
	  else 
	    Tweak = add8 (Tweak, EIGHT );

	  i += 8;
      }
      // Absorb the remaining full 16-byte blocks 
      while (16*i <= m_len) {			  
	  State = load( (__m128i *) ( message + 16 * (i-1) ) );		
	  Checksum = xor( Checksum , State );
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak, tTweak );
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
	AES( Final , subkeys, Tweak, tTweak );
    } 
    // If the block is partial 
    else { 
        
        SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_NONZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Pad = constant32( 0,0,0,0 );
	AES( Pad , subkeys, Tweak, tTweak );
        
	memset(last_block, 0, 16);
        memcpy(last_block, message +16*i, m_len-16*i);
        last_block[m_len-16*i]=0x80;
	tmp = load( (__m128i *) ( last_block ) );		
	Checksum = xor( Checksum, tmp );
	
	Pad = xor ( Pad , tmp );
	store( ciphertext+16*i , Pad );      
        
	SET_STAGE_IN_TWEAK(Tweak, MSB_CHKSUM);
	Final = Checksum; 
	AES( Final , subkeys, Tweak, tTweak );
    }
    
    Final = xor( Final , Auth );
    store( last_block , Final );
    memcpy( ciphertext+m_len , last_block , 16 );
        
    *c_len=m_len+16;

    return 0;
}



int deoxys_aead_decrypt(const unsigned char *ass_data, unsigned long long ass_data_len, 
			unsigned char *message, unsigned long long int *m_len, 
			const unsigned char *key, const unsigned char *nonce, 
		        const unsigned char *c, unsigned long long c_len
			)
{

    unsigned long long int i,j;
    unsigned char last_block[16];    
    const __m128i EIGHT			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i SEIGHT		= constant8( 0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);    
    const __m128i STAGE_MASK   		= constant8( 0x1f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xe0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );      
    const __m128i MSB_AD  	 	= constant8( (0x2<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST	 	= constant8( (0x6<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M  	 	= constant8( (0x0<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_ZERO 	= constant8( (0x1<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_NONZERO 	= constant8( (0x4<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_CHKSUM 		= constant8( (0x5<<5),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i PERM_MASK		= constant8( 0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8 ); 
    const __m128i H_PERMUTATION  	= constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );   	
    const __m128i H_PERMUTATION_INV  	= constant8( 1,6,11,12,5,10,15,0,9,14,3,4,13,2,7,8);   	
    __m128i ADD_ONE			= constant8( 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1 );   	
    __m128i RCONS[17];
    __m128i tmp;
    __m128i subkeys[17], tsubkeys1[17], tsubkeys2[17], dsubkeys[17];
    __m128i Final;
    __m128i Pad;
    __m128i States[8];
    __m128i State;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 3) 		    , 
							(nonce[0]&7) << 5 ^ (nonce[1] >> 3) ,  
							(nonce[1]&7) << 5 ^ (nonce[2] >> 3) , 
							(nonce[2]&7) << 5 ^ (nonce[3] >> 3) , 
							(nonce[3]&7) << 5 ^ (nonce[4] >> 3) , 
							(nonce[4]&7) << 5 ^ (nonce[5] >> 3) ,  
							(nonce[5]&7) << 5 ^ (nonce[6] >> 3) ,  
							(nonce[6]&7) << 5 ^ (nonce[7] >> 3) ,  
							(nonce[7]&7) << 5                   , 
							0 , 0 , 0 , 0 , 0 , 0 , 0);
    __m128i tTweak;
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    // Required for the multiplication in the key schedule
    __m128i msb_mask 			= constant8( 0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80);
    __m128i trivial_permutation 	= constant8( 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
    __m128i simply_1b  			= constant8( 0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b);
    __m128i kill_shift			= constant8( 0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe);
    __m128i msbits, multi_mask, rot_cons; 
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};
    __m128i tw_c[8][8], tw_c_inv[8][8],tmp_tweak, Tweaks[8];
    
    // Set up tweak constants
    tmp = ADD_ONE;
    for(i=0; i<8; i++){
      tw_c[i][0] = constant8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      tw_c[i][1] = add8(tw_c[i][0], tmp );tw_c_inv[i][1] = mc_inv(tw_c[i][1]);
      tw_c[i][2] = add8(tw_c[i][1], tmp );tw_c_inv[i][2] = mc_inv(tw_c[i][2]);
      tw_c[i][3] = add8(tw_c[i][2], tmp );tw_c_inv[i][3] = mc_inv(tw_c[i][3]);
      tw_c[i][4] = add8(tw_c[i][3], tmp );tw_c_inv[i][4] = mc_inv(tw_c[i][4]);
      tw_c[i][5] = add8(tw_c[i][4], tmp );tw_c_inv[i][5] = mc_inv(tw_c[i][5]);
      tw_c[i][6] = add8(tw_c[i][5], tmp );tw_c_inv[i][6] = mc_inv(tw_c[i][6]);
      tw_c[i][7] = add8(tw_c[i][6], tmp );tw_c_inv[i][7] = mc_inv(tw_c[i][7]);      
      tmp = permute( tmp, H_PERMUTATION );      
    }

    
    // Set up the round keys for AES
    for(i=0; i<17;i++){
      RCONS[i] = constant8( 1,2,4,8, rcon[i], rcon[i], rcon[i], rcon[i],  0,0,0,0,  0,0,0,0);
    }
    TWEAKEY_SCHEDULE3( tsubkeys1,tsubkeys2,subkeys, key);
    TWEAKEY_SCHEDULE3_INVERSE( subkeys, dsubkeys );

    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;        
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    // If associated data length < 128, do no try to optimize
    if( ass_data_len < 112 ){
      while (16*i <= ass_data_len) {
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  AES( State, subkeys, Tweak, tTweak );
	  Auth = xor ( Auth, State );  	
	  i++;	  
      } 
    }
    // Else process 8 blocks in parallel
    else{
      
      // First absorb the next 7 blocks to make the counter multiple of 8
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	       
      tTweak = Tweak;
      PROCESS_7_ASS_DATA_BLOCKS( States, ass_data , Auth , tTweak );    
   
      i = 8;
      Tweak = add8( Tweak, EIGHT);      
      // Absorb all 128-byte blocks (8 in parallel)
      while (16*(i+7) <= ass_data_len) {
	
	  tTweak = Tweak ;	
	  PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * (i-1) , Auth , tTweak );
	  
	  if(!( (i+8)%256)){
	    ADD_TO_TWEAK( Tweak, SEIGHT);
	  }
	  else 
	    Tweak = add8 (Tweak, EIGHT );
	  
	  i += 8;
      }      
      // Absorb the remaining full 16-byte blocks
      while (16*i <= ass_data_len) {			  
	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak, tTweak );
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
	AES( State, subkeys, Tweak, tTweak );

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
        
    c_len -=16;
    if( c_len < 0 )
      return -1;
    
    // If ciphertext length < 128 bytes, do not try to optimize
    if( c_len < 112 ){
      while (16*i <= c_len) {			
	  State = load( (__m128i *) ( c + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES_DEC( State, dsubkeys, Tweak, tTweak );
	  Checksum = xor( Checksum , State );
	  store( message +16*(i-1) , State );      
	  i++;	
      }
      i = c_len / 16;;      
    }
    // Else proccess 8 blocks in parallel 
    else{

      // First absorb the next 7 blocks to make the counter multiple of 8
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	             
      tTweak = Tweak; 
      PROCESS_7_CIPHERTEXT_BLOCKS( States, dsubkeys, c , message  , Checksum , tTweak ); 	  
      
      i = 8;
      Tweak = add8( Tweak, EIGHT);      
      // Absorb all 128-byte blocks (8 in parallel)
      while (16*(i+7) <= c_len) {
	
	  tTweak = Tweak; 
	  PROCESS_8_CIPHERTEXT_BLOCKS( States, dsubkeys, c + 16 * (i-1) , message + 16 * (i-1 )  , Checksum , tTweak ); 	  
	
	  if(!( (i+8)%256)){
	    ADD_TO_TWEAK( Tweak, SEIGHT);
	  }
	  else 
	    Tweak = add8 (Tweak, EIGHT );
	  
	  i += 8;
	  
      }
      
      // Absorb the remaining full 16-byte blocks 
      while (16*i <= c_len) {			  
	
	  State = load( (__m128i *) ( c + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES_DEC( State, dsubkeys, Tweak, tTweak );
	  Checksum = xor( Checksum , State );
	  store( message+16*(i-1) , State );      
	  i++;	  
      }
    }
    
    i = c_len / 16;;
    // Process last block 
    // If the block is full, i.e. M_last=epsilon 
    if (c_len == 16*i) {
	SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_ZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Final = Checksum;
	AES( Final , subkeys, Tweak, tTweak );
    }    
    // If the block is partial 
    else { 

	SET_STAGE_IN_TWEAK(Tweak, MSB_M_LAST_NONZERO);
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
	Pad = constant32( 0,0,0,0 );
	AES( Pad , subkeys, Tweak , tTweak );
	store( last_block, Pad );	
	for(j=0; j<c_len-16*i; j++)last_block[j] ^= c[16*i+j]; 
	memcpy( message + 16*i, last_block, c_len-16*i);
	
	memset( last_block + c_len-16*i, 0 , 16 - (c_len-16*i) );
	last_block[c_len-16*i]=0x80;
	tmp = load( (__m128i *) ( last_block ) );	
	Checksum = xor( Checksum, tmp );
	Final = Checksum; 
	SET_STAGE_IN_TWEAK(Tweak, MSB_CHKSUM);
	AES( Final , subkeys, Tweak , tTweak );
		
    }
    Final = xor( Final , Auth );
    
    store( last_block , Final );
    for(j=0; j<16; j++)
      if( last_block[j] ^ c[c_len+j] )
	return -1;
        
    *m_len=c_len;
    
    return 0;
    
}

