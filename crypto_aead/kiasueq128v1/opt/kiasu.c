/*
 * Kiasu==-128 Optimized AES-NI C Implementation
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


    /*
** Mix function used in XLS
*/
void mix(const unsigned char* A, const unsigned char* B, const unsigned int s, unsigned char* Out1, unsigned char* Out2) {

  unsigned int i;
  unsigned char S[16];
  unsigned char rotS[16];

  for(i=0; i<s; i++) S[i] = A[i] ^ B[i];
  for(i=0; i<s; i++) {rotS[i] = S[i]<<1; rotS[i] ^= (S[(i+1)%s]>>7) & 0x1;}
  for(i=0; i<s; i++) {Out1[i] = A[i] ^ rotS[i]; Out2[i] = B[i] ^ rotS[i]; }
}


/*
** XLS function used for padding, when message input has a length not a multiple of the block size
*/
void XLS(int Direction, __m128i Tweak,
	__m128i subkeys[11],
        unsigned char message[], 
         const unsigned int s, 
          const unsigned int l, 
         unsigned char* cipher) {

  unsigned char M1[16];
  unsigned char M2[16];
  unsigned char X1[16];
  unsigned char X1ns[16];
  unsigned char X1s[16];
  unsigned char Xp1ns[16];
  unsigned char Xp1s[16];
  unsigned char X2[16];
  unsigned char Xp1[16];
  unsigned char Y1[16];
  unsigned char Y1ns[16];
  unsigned char Y1s[16];
  unsigned char Yp1ns[16];
  unsigned char Yp1s[16];
  unsigned char Yp1[16];
  unsigned char C1[16];
  unsigned char C2[16];
  const __m128i STAGE_MASK   		= constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
  const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0xff,0xff, 0x00,0x00,0xff,0xf );    
  const __m128i MSB_XLS1 		= constant8( (0x8<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
  const __m128i MSB_XLS2 		= constant8( (0x9<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
  __m128i State,tmp;
  __m128i dTweak;
  int j;
  
  /* Prepare the inputs */
  memcpy (M1, message, 16);
  memcpy (M2, message+16, s);
  

  /* First round */
  SET_STAGE_IN_TWEAK(Tweak,MSB_XLS1);
  SET_BLOCK_NO_IN_TWEAK( Tweak, l );  
  dTweak = mc_inv(Tweak);
  State = load( (__m128i *) ( M1 ) );
  if( Direction){    AES( State , subkeys , Tweak ); }
  else {  AES_DEC( State , subkeys , Tweak ,dTweak ); }
  store ( X1 , State );	       
  
  memcpy (X1ns, X1  , 16-s);
  memcpy (X1s, X1+16-s, s);
  memcpy (Xp1ns, X1ns, 16-s);
  Xp1ns[16-s-1] ^= 1; 
  mix (X1s, M2, s, Xp1s, X2); 
  memcpy (Xp1, Xp1ns, 16-s);
  memcpy (Xp1+16-s, Xp1s, s);

  
  /* Second round */
  SET_STAGE_IN_TWEAK(Tweak,MSB_XLS2);
  dTweak = mc_inv(Tweak);
  State = load( (__m128i *) ( Xp1 ) );  
  if( Direction){    AES( State , subkeys , Tweak ); }
  else {  AES_DEC( State , subkeys , Tweak ,dTweak ); }
  store( Y1 , State );       
  
  memcpy (Y1ns, Y1, 16-s);
  memcpy (Y1s, Y1+16-s, s);
  memcpy (Yp1ns, Y1ns, 16-s);
  Yp1ns[16-s-1] ^= 1;
  mix (Y1s, X2, s, Yp1s, C2);
  memcpy (Yp1, Yp1ns, 16-s);
  memcpy (Yp1+16-s, Yp1s, s);

  /* Third round */
  SET_STAGE_IN_TWEAK(Tweak,MSB_XLS1);
  dTweak = mc_inv(Tweak);
  State = load( (__m128i *) ( Yp1 ) ); 
  if( Direction){    AES( State , subkeys , Tweak ); }
  else {  AES_DEC( State , subkeys , Tweak ,dTweak ); }
  store( C1 , State );

  /* Write the outputs */
  memcpy (cipher, C1, 16);
  memcpy (cipher+16, C2, s);

}


void kiasu_aead_encrypt(const unsigned char *ass_data, unsigned long long int ass_data_len, const unsigned char *message, unsigned long long int m_len, const unsigned char *key, const unsigned char *nonce, unsigned char *ciphertext, unsigned long long int *c_len)
{

    unsigned int i,j;
    unsigned char last_block[16];    
    const __m128i ONE 			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,1,0,0);
    const __m128i EIGHT 		= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,8,0,0);
    const __m128i SEIGHT 		= constant8( 8,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0);
    const __m128i STAGE_MASK   		= constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0xff,0xff, 0x00,0x00,0xff,0xf );    
    const __m128i MSB_AD  	 	= constant8( (0x2<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST_FULL 	= constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST_PARTIAL 	= constant8( (0x7<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_TAG_SPLIT_AUTH 	= constant8( (0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_TAG_SPLIT 	= constant8( (0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_CP	 	= constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_UP  	 	= constant8( (0x0<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_DOWN  	 	= constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_CHKSUM 		= constant8( (0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );  
    const __m128i MSB_M_FINAL 		= constant8( (0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );  
    const __m128i MSB_M_LAST_ZERO 	= constant8( (0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_NONZERO 	= constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i PERM_MASK		= constant8( 13,12,9,8, 5,4,1,0, 2,3,6,7, 10,11,14,15 ); 
    const __m128i PERM_MASK_INVERSE	= constant8( 7,6,8,9, 5,4,10,11, 3,2,12,13, 1,0,14,15 ); 
    __m128i tmp;
    __m128i subkeys[11];
    __m128i Final;
    __m128i Pad;
    __m128i States[8];
    __m128i Tweaks[8];
    __m128i State;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 4) 			, (nonce[0]&0xf) << 4 ^ (nonce[1] >> 4) , 0 , 0 , 
							(nonce[1]&0xf) << 4 ^ (nonce[2] >> 4)   , (nonce[2]&0xf) << 4 ^ (nonce[3] >> 4) , 0 , 0 , 
							(nonce[3]&0xf) << 4                     ,      0                              , 0 , 0 , 
										0               ,      1                              , 0 , 0 );
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Cp;
    						
    
    // Set up the round keys for AES
    set_encryption_key( key , subkeys );
    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;       
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    
    GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );      
    
    // Absorb all 128-byte blocks           
    while (16*(i+7) + 16 <= ass_data_len   ) {
      
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
    // Absorb all 16-byte blocks
    i = 1 + (((ass_data_len-16*(ass_data_len>=128))/128)*128/16); 
    while (16*i + 16 <= ass_data_len  ) {			 
   	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak );
	  Auth = xor( Auth , State );
	  i++;	  

    }        
    // Absorb the last block
    if( 16 * i == ass_data_len ){       
     	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );
	  Auth = xor ( Auth , State );
	  SET_STAGE_IN_TWEAK(Tweak, MSB_AD_LAST_FULL); 	  
    }
    else{
      
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
      SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
      
      if( ass_data_len >= 16) {
	memcpy( last_block , ass_data + 16 * (i-1), 16 );
	State = load( (__m128i *) ( last_block ) );	  
	AES( State, subkeys, Tweak );	  
	Auth = xor( Auth , State );
      }
      else 
	i = 0;
      
      memset(last_block, 0, 16);
      memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
      last_block[ass_data_len-16*i]=0x80;
      State = load( (__m128i *) ( last_block ) );      
      Auth = xor( Auth , State );      
      SET_STAGE_IN_TWEAK(Tweak, MSB_AD_LAST_PARTIAL);      
    }
    i = ass_data_len/16;
    SET_BLOCK_NO_IN_TWEAK( Tweak, i );	    
    AES( Auth, subkeys, Tweak );     
   
    
    /*
     *
     *
     * 			Message 
     *
     *
     */
    
    // Tag splitting
    if( m_len < 16 ){
      memset(last_block, 0, 16);
      memcpy(last_block, message, m_len );
      last_block[m_len]=0x80;
      State = load( (__m128i *) ( last_block ) );		
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);
      SET_BLOCK_NO_IN_TWEAK( Tweak, 0);    
      AES( State , subkeys, Tweak );      
      Auth = xor(Auth, State);
      
      Cp = Auth;
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_CP);
      AES( Cp, subkeys, Tweak );
      
      State = load( (__m128i *) ( last_block ) );		
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT_AUTH);
      AES( State , subkeys, Tweak );
      Auth = xor(Auth , State );
      
      Final = Auth;      
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT);
      AES( Final , subkeys, Tweak );   
      
      store( last_block , Final );      
      store( ciphertext , Cp );    
      memcpy( ciphertext + 16 , last_block , m_len );
              
      *c_len=m_len+16;
    
      return ;
    }
        
    
    i=1;    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);          
    GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );  
    
    // Absorb all 128-byte blocks 
    i = 1 ;      
    while (16*(i+7) <= m_len) {
	PROCESS_8_MESSAGE_BLOCKS( States, message + 16 * (i-1) , ciphertext + 16 * (i-1 )  , Checksum , Auth ); 
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
        SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);	
	AES( State, subkeys, Tweak );
	Auth = xor(Auth , State );
	State = Auth;
	SET_STAGE_IN_TWEAK(Tweak, MSB_M_DOWN);
	AES( State, subkeys, Tweak );
	store( ciphertext+16*(i-1) , State );      
	i++;	
    }
    
    i = m_len / 16;;
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_CHKSUM);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);
    AES( Checksum , subkeys, Tweak );
    Auth = xor( Auth , Checksum );
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_FINAL);
    Final = Auth;
    AES( Final , subkeys, Tweak );
	    
    i++;
    if (m_len> 16*(i-1)) {        
        
      unsigned int s;
      unsigned char XLSin[32];
      unsigned char XLSout[32];
      
      /* s denotes the number of bytes in the last partial block */
      s=m_len-16*(i-1);

      /* Prepare the input to XLS */
      memcpy(XLSin, message+16*(i-1), s);
      store( last_block, Final );
      memcpy(XLSin+s, last_block, 16);

      /* Call XLS */
      XLS (1, Tweak, subkeys, XLSin, s, i-1, XLSout);
            
      /* Write the ciphertext */
      memcpy (ciphertext+16*(i-1), XLSout, s);

      /* and append the tag to it */
      memcpy (ciphertext+m_len, XLSout+s, 16);
    }
    else {

      /* Append the tag to the ciphertext */
      store( last_block, Final );      
      memcpy (ciphertext+m_len, last_block, 16);
    }

    /* Update the size of the ciphertext (incl. tag) */
    *c_len=16+m_len;

}


int kiasu_aead_decrypt(const unsigned char *ass_data, unsigned long long ass_data_len, unsigned char *message, unsigned long long int *m_len, const unsigned char *key, const unsigned char *nonce, const unsigned char *c, unsigned long long c_len)
{

    unsigned int i,j;
    unsigned char last_block[16];    
    const __m128i ONE 			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,1,0,0);
    const __m128i EIGHT 		= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,8,0,0);
    const __m128i SEIGHT 		= constant8( 8,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0);
    const __m128i STAGE_MASK   		= constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0xff,0xff, 0x00,0x00,0xff,0xf );    
    const __m128i MSB_AD  	 	= constant8( (0x2<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST_FULL 	= constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_AD_LAST_PARTIAL 	= constant8( (0x7<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_TAG_SPLIT_AUTH 	= constant8( (0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_TAG_SPLIT 	= constant8( (0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_CP	 	= constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_UP  	 	= constant8( (0x0<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_DOWN  	 	= constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_CHKSUM 		= constant8( (0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );  
    const __m128i MSB_M_FINAL 		= constant8( (0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );  
    const __m128i MSB_M_LAST_ZERO 	= constant8( (0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i MSB_M_LAST_NONZERO 	= constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
    const __m128i PERM_MASK		= constant8( 13,12,9,8, 5,4,1,0, 2,3,6,7, 10,11,14,15 ); 
    const __m128i PERM_MASK_INVERSE	= constant8( 7,6,8,9, 5,4,10,11, 3,2,12,13, 1,0,14,15 ); 
    __m128i tmp;
    __m128i subkeys[11], dsubkeys[11];
    __m128i Final;
    __m128i Pad;
    __m128i States[8];
    __m128i Tweaks[8],dTweaks[8];
    __m128i State;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 4) 			, (nonce[0]&0xf) << 4 ^ (nonce[1] >> 4) , 0 , 0 , 
							(nonce[1]&0xf) << 4 ^ (nonce[2] >> 4)   , (nonce[2]&0xf) << 4 ^ (nonce[3] >> 4) , 0 , 0 , 
							(nonce[3]&0xf) << 4                     ,      0                              , 0 , 0 , 
										0               ,      1                              , 0 , 0 );
    __m128i dTweak;
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Cp;
    						
    
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
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);    
    GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );      
    
    // Absorb all 128-byte blocks           
    while (16*(i+7) + 16 <= ass_data_len   ) {
      
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
    // Absorb all 16-byte blocks
    i = 1 + (((ass_data_len-16*(ass_data_len>=128))/128)*128/16); 
    while (16*i + 16 <= ass_data_len  ) {			 
   	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
	  AES( State, subkeys, Tweak );
	  Auth = xor( Auth , State );
	  i++;	
    }        
    // Absorb the last block
    if( 16 * i == ass_data_len ){       
     	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );
	  Auth = xor ( Auth , State );
	  SET_STAGE_IN_TWEAK(Tweak, MSB_AD_LAST_FULL); 	  
    }
    else{      
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
      SET_STAGE_IN_TWEAK(Tweak, MSB_AD);      
      if( ass_data_len >= 16) {
	memcpy( last_block , ass_data + 16 * (i-1), 16 );	
	State = load( (__m128i *) ( last_block ) );	  
	AES( State, subkeys, Tweak );		
	Auth = xor( Auth , State );
      }
      else 
	i = 0;
      
      memset(last_block, 0, 16);
      memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
      last_block[ass_data_len-16*i]=0x80;
      State = load( (__m128i *) ( last_block ) );      
      Auth = xor( Auth , State );      
      SET_STAGE_IN_TWEAK(Tweak, MSB_AD_LAST_PARTIAL);      
    }
    i = ass_data_len/16;
    SET_BLOCK_NO_IN_TWEAK( Tweak, i );	    
    AES( Auth, subkeys, Tweak );     
    
    
   

    /*
     *
     *
     * 			Message 
     *
     *
     */    

    c_len -= 16;
    if( c_len < 0 )
      return -1;
    
    // Tag splitting
    if( c_len  < 16 ){
      memset(last_block, 0, 16);
      memcpy(last_block, c, c_len );
      memcpy(last_block+c_len, c+c_len, 16 - c_len);
      State = load( (__m128i *) ( last_block ) );		
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_CP);
      SET_BLOCK_NO_IN_TWEAK( Tweak, 0);    
      dTweak = mc_inv(Tweak);
      AES_DEC( State , dsubkeys, Tweak , dTweak );      
      
      Cp = xor(Auth, State);
      Auth = State;
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);
      dTweak = mc_inv(Tweak);
      AES_DEC( Cp, dsubkeys, Tweak , dTweak );      
     
      store( last_block, Cp);
      memcpy( message, last_block, c_len);
      Checksum = Cp;
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT_AUTH);
      AES( Checksum , subkeys, Tweak );
      
      Auth = xor(Auth , Checksum );    
      Final = Auth;      
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT);
      AES( Final , subkeys, Tweak );      
      store( last_block , Final );      
      
      if(0 != memcmp(c+16, last_block, c_len)) return -1;
      
      *m_len=c_len;
      return 0;      
    }
    
    i=1;    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);        
    GET_TWEAKS_FROM_SINGLE_TWEAK (Tweaks, Tweak );  
    
    // Absorb all 128-byte blocks 
    i = 1 ;      
    while (16*(i+7) <= c_len) {
      
      PROCESS_8_CIPHERTEXT_BLOCKS( States, dsubkeys, Tweaks, dTweaks, c + 16 * (i-1 ) , message + 16 * (i-1) , Checksum , Auth );
      
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
    i = 1 + ((c_len/128)*128/16);      
    while (16*i <= c_len) {			  
	State = load( (__m128i *) ( c + 16 * (i-1) ) );		
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
        SET_STAGE_IN_TWEAK(Tweak, MSB_M_DOWN);
	dTweak = mc_inv(Tweak);
	AES_DEC( State, dsubkeys, Tweak, dTweak );
	tmp = State;
	State = xor( State , Auth);
	Auth = tmp;
	SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);	
	dTweak = mc_inv(Tweak);
	AES_DEC( State, dsubkeys, Tweak, dTweak );
	Checksum = xor(Checksum, State );
	store( message+16*(i-1) , State );      
	i++;		
    }    
    
    i = c_len / 16;;
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_CHKSUM);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);
    AES( Checksum , subkeys, Tweak );    
    Auth = xor( Auth , Checksum );    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_FINAL);
    Final = Auth;
    AES( Final , subkeys, Tweak );
        
    i++;
    if (c_len> 16*(i-1)) {        
        
      unsigned int s;
      unsigned char XLSin[32];
      unsigned char XLSout[32];
      
      /* s denotes the number of bytes in the last partial block */
      s=c_len-16*(i-1);
      
      /* Prepare the input to XLS */
      memcpy(XLSin  , c+16*(i-1), s);
      memcpy(XLSin+s, c+c_len   , 16);
      
      /* Call XLS */
      XLS (0,Tweak,dsubkeys, XLSin, s, i-1, XLSout);

      store(last_block, Final);
            
      /* Check the Final value */
      if(0!=memcmp(last_block, XLSout+s, 16)) return -1;

      /* Write the remaining s bytes in the plaintext */
      memcpy(message+c_len-s, XLSout, s);      
      
    }
    else {
      /* Append the tag to the ciphertext */
      store( last_block, Final );      
      /* If the tag does not match, return error */
      if(0!=memcmp(last_block, c+c_len, 16)) return -1;
    }

    /* Update the size of the ciphertext (incl. tag) */
    *m_len=c_len;
    
    return 0;
    
}

