/*
 * Deoxys==-128 Optimized AES-NI C Implementation
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
#include "tweakable-cipher.macros"
#include "ae.macros"


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
	__m128i subkeys[15],
         unsigned char message[], 
         const unsigned int s, 
         const unsigned long long int l, 
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
  const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );      
  const __m128i MSB_XLS1 		= constant8( (0x8<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
  const __m128i MSB_XLS2 		= constant8( (0x9<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );    
  const __m128i H_PERMUTATION  		= constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );   	
  const __m128i H_PERMUTATION_14  	= constant8( 0x06,0x0f,0x04,0x0d,0x0a,0x03,0x08,0x01,0x0e,0x07,0x0c,0x05,0x02,0x0b,0x00,0x09);   	
  const __m128i H_PERMUTATION_INV  	= constant8( 1,6,11,12,5,10,15,0,9,14,3,4,13,2,7,8);   	
  __m128i State,tmp;
  __m128i dTweak,tTweak;
    
  /* Prepare the inputs */
  memcpy (M1, message, 16);
  memcpy (M2, message+16, s);
  
  /* First round */
  SET_STAGE_IN_TWEAK(Tweak,MSB_XLS1);
  SET_BLOCK_NO_IN_TWEAK( Tweak, l ); 
  dTweak = mc_inv(Tweak);
  State = load( (__m128i *) ( M1 ) );
  if( Direction){   AES( State , subkeys , Tweak , tTweak ); }
  else { AES_DEC( State , subkeys , Tweak ,dTweak ); }
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
  if( Direction){    AES( State , subkeys , Tweak, tTweak ); }
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
  if( Direction){    AES( State , subkeys , Tweak , tTweak ); }
  else {  AES_DEC( State , subkeys , Tweak ,dTweak ); }
  store( C1 , State );
  
  
  /* Write the outputs */
  memcpy (cipher, C1, 16);
  memcpy (cipher+16, C2, s);

}


int deoxys_aead_encrypt(const unsigned char *ass_data, unsigned long long int ass_data_len, 
			 const unsigned char *message, unsigned long long int m_len, 
			 const unsigned char *key, const unsigned char *nonce, 
			 unsigned char *ciphertext, unsigned long long int *c_len)
{

    unsigned long long int i;
    unsigned char last_block[16];    
    const __m128i EIGHT			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i SEIGHT		= constant8( 0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);    
    const __m128i STAGE_MASK   		= constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );      
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
    const __m128i PERM_MASK		= constant8( 0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8 ); 
    const __m128i H_PERMUTATION  	= constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );   	
    __m128i ADD_ONE			= constant8( 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1 );   	
    __m128i RCONS[15];    
    __m128i tmp;
    __m128i subkeys[15], tsubkeys[15];
    __m128i Final;
    __m128i States[8];
    __m128i State;
    __m128i tTweak;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 4) 		    , 
							(nonce[0]&0xf) << 4 ^ (nonce[1] >> 4) ,  
							(nonce[1]&0xf) << 4 ^ (nonce[2] >> 4) , 
							(nonce[2]&0xf) << 4 ^ (nonce[3] >> 4) , 
							(nonce[3]&0xf) << 4 ^ (nonce[4] >> 4) , 
							(nonce[4]&0xf) << 4 ^ (nonce[5] >> 4) ,  
							(nonce[5]&0xf) << 4 ^ (nonce[6] >> 4) ,  
							(nonce[6]&0xf) << 4 ^ (nonce[7] >> 4) ,  
							(nonce[7]&0xf) << 4                   , 
							0 , 0 , 0 , 0 , 0 , 0 , 0);
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Cp;
    // Required for the multiplication in the key schedule
    __m128i msb_mask 			= constant8( 0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80);
    __m128i trivial_permutation 	= constant8( 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
    __m128i simply_1b  			= constant8( 0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b);
    __m128i kill_shift			= constant8( 0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe);
    __m128i msbits, multi_mask, rot_cons; 
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};
    __m128i tw_c[15][8];
   
    // Set up tweak constants
    tmp = ADD_ONE;
    for(i=0; i<15; i++){
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
    
    // Set up the round keys 
    for(i=0; i<15;i++){
      RCONS[i] = constant8( 1,2,4,8, rcon[i], rcon[i], rcon[i], rcon[i],  0,0,0,0,  0,0,0,0);
    }
    TWEAKEY_SCHEDULE2( tsubkeys,subkeys, key);
    
    
    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;       
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    
    // Absorb 112-byte block
    if( 112+16 <= ass_data_len ){
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	       
      tTweak = Tweak;
      PROCESS_7_ASS_DATA_BLOCKS( States, ass_data , Auth , tTweak );          
      i = 8;
      Tweak = add8( Tweak, EIGHT);               
    }          
    // Absorb all 128-byte blocks (8 in parallel)
    while ( 16*(i+7) + 16 <= ass_data_len) {
      
	tTweak = Tweak ;	
	PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * (i-1) , Auth , tTweak );

	if(!( (i+8)%256)){  	ADD_TO_TWEAK( Tweak, SEIGHT); }
	else 			Tweak = add8 (Tweak, EIGHT );
	
	i += 8;
    }    
    // Absorb all 16-byte blocks
    while (16*i + 16 <= ass_data_len  ) {			 
   	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	  
	  AES( State, subkeys, Tweak , tTweak );
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
	AES( State, subkeys, Tweak , tTweak );	  
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
    AES( Auth, subkeys, Tweak , tTweak );     
   
    
    
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
      SET_BLOCK_NO_IN_TWEAK( Tweak, (unsigned long long int)0);    
      AES( State , subkeys, Tweak , tTweak );      
      Auth = xor(Auth, State);
      
      Cp = Auth;
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_CP);
      AES( Cp, subkeys, Tweak , tTweak );
      
      State = load( (__m128i *) ( last_block ) );		
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT_AUTH);
      AES( State , subkeys, Tweak , tTweak );
      Auth = xor(Auth , State );
      
      Final = Auth;      
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT);
      AES( Final , subkeys, Tweak , tTweak );   
      
      store( last_block , Final );      
      store( ciphertext , Cp );    
      memcpy( ciphertext + 16 , last_block , m_len );
              
      *c_len=m_len+16;
    
      return 0;
    }
    
    
    i=1;    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);        
  
    // Absorb 112-byte block
    if( 112 <= m_len ){
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	       
      
      PROCESS_7_MESSAGE_BLOCKS( States, message, ciphertext, Checksum , Auth , Tweak , tTweak );          
      i = 8;
      Tweak = add8( Tweak, EIGHT);               
    }    
    // Absorb all 128-byte blocks (8 in parallel)
    while ( 16*(i+7)  <= m_len) {
      
	PROCESS_8_MESSAGE_BLOCKS( States, message + 16 * (i-1) , ciphertext + 16 * (i-1) , Checksum , Auth , Tweak, tTweak );          
      

	if(!( (i+8)%256)){  	ADD_TO_TWEAK( Tweak, SEIGHT); }
	else 			Tweak = add8 (Tweak, EIGHT );
	
	i += 8;
    }    
    // Absorb remaining 16-byte blocks
    while (16*i <= m_len  ) {			 
   	State = load( (__m128i *) ( message + 16 * (i-1) ) );		
	Checksum = xor( Checksum , State );
	SET_BLOCK_NO_IN_TWEAK( Tweak, i);
        SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);	
	AES( State, subkeys, Tweak , tTweak );
	Auth = xor(Auth , State );
	
	State = Auth;
	SET_STAGE_IN_TWEAK(Tweak, MSB_M_DOWN);
	AES( State, subkeys, Tweak , tTweak );
	store( ciphertext+16*(i-1) , State );      
	i++;	
    }    
    
    i = m_len / 16;;
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_CHKSUM);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);
    AES( Checksum , subkeys, Tweak , tTweak );
    Auth = xor( Auth , Checksum );
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_FINAL);
    Final = Auth;
    AES( Final , subkeys, Tweak , tTweak );
    
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

    
    return 0;
}

int deoxys_aead_decrypt(const unsigned char *ass_data, unsigned long long ass_data_len, 
			unsigned char *message, unsigned long long *m_len, 
			const unsigned char *key, const unsigned char *nonce, 
		       const unsigned char *c, unsigned long long c_len
			)
{

    unsigned long long int i;
    unsigned char last_block[16];    
    const __m128i EIGHT			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i SEIGHT		= constant8( 0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);    
    const __m128i STAGE_MASK   		= constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );    
    const __m128i BLOCK_MASK   		= constant8( 0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 );      
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
    const __m128i PERM_MASK		= constant8( 0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8 ); 
    const __m128i H_PERMUTATION  	= constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );   
    const __m128i H_PERMUTATION_14  	= constant8( 0x06,0x0f,0x04,0x0d,0x0a,0x03,0x08,0x01,0x0e,0x07,0x0c,0x05,0x02,0x0b,0x00,0x09);   	
    const __m128i H_PERMUTATION_INV  	= constant8( 1,6,11,12,5,10,15,0,9,14,3,4,13,2,7,8);   	
    __m128i ADD_ONE			= constant8( 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1 );   	
    __m128i RCONS[15];    
    __m128i tmp;
    __m128i subkeys[15], tsubkeys[15], dsubkeys[15];
    __m128i Final;
    __m128i States[8];
    //__m128i Tweaks[8];
    __m128i State;
    __m128i tTweak, dTweak;
    __m128i Tweak 			= constant8(   	(nonce[0] >> 4) 		    , 
							(nonce[0]&0xf) << 4 ^ (nonce[1] >> 4) ,  
							(nonce[1]&0xf) << 4 ^ (nonce[2] >> 4) , 
							(nonce[2]&0xf) << 4 ^ (nonce[3] >> 4) , 
							(nonce[3]&0xf) << 4 ^ (nonce[4] >> 4) , 
							(nonce[4]&0xf) << 4 ^ (nonce[5] >> 4) ,  
							(nonce[5]&0xf) << 4 ^ (nonce[6] >> 4) ,  
							(nonce[6]&0xf) << 4 ^ (nonce[7] >> 4) ,  
							(nonce[7]&0xf) << 4                   , 
							0 , 0 , 0 , 0 , 0 , 0 , 0);
    __m128i Auth  	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Checksum	 		= constant32( 0 , 0 , 0 , 0 );
    __m128i Cp;
    // Required for the multiplication in the key schedule
    __m128i msb_mask 			= constant8( 0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80);
    __m128i trivial_permutation 	= constant8( 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
    __m128i simply_1b  			= constant8( 0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b,0x1b);
    __m128i kill_shift			= constant8( 0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe);
    __m128i msbits, multi_mask, rot_cons; 
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};
    __m128i tw_c[15][8], tw_c_inv[15][8],tmp_tweak;
    
    // Set up tweak constants
    tmp = ADD_ONE;
    for(i=0; i<15; i++){
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
    
    
    // Set up the round keys 
    for(i=0; i<15;i++){
      RCONS[i] = constant8( 1,2,4,8, rcon[i], rcon[i], rcon[i], rcon[i],  0,0,0,0,  0,0,0,0);
    }
    TWEAKEY_SCHEDULE2( tsubkeys,subkeys, key);
    TWEAKEY_SCHEDULE2_INVERSE( subkeys, dsubkeys );
    
    
    
    /*
     *
     *			 Associated data 
     *
     *
     */
    i=1;       
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);	
    SET_STAGE_IN_TWEAK(Tweak, MSB_AD);
    
    // Absorb 112-byte block
    if( 112+16 <= ass_data_len ){
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	       
      tTweak = Tweak;
      PROCESS_7_ASS_DATA_BLOCKS( States, ass_data , Auth , tTweak );          
      i = 8;
      Tweak = add8( Tweak, EIGHT);               
    }      
    
    // Absorb all 128-byte blocks (8 in parallel)
    while ( 16*(i+7) + 16 <= ass_data_len) {
      
	tTweak = Tweak ;	
	PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * (i-1) , Auth , tTweak );

	if(!( (i+8)%256)){  	ADD_TO_TWEAK( Tweak, SEIGHT); }
	else 			Tweak = add8 (Tweak, EIGHT );
	
	i += 8;
    }
    
    // Absorb all 16-byte blocks
    while (16*i + 16 <= ass_data_len  ) {			 
   	  State = load( (__m128i *) ( ass_data + 16 * (i-1) ) );		
	  SET_BLOCK_NO_IN_TWEAK( Tweak, i);	  
	  AES( State, subkeys, Tweak , tTweak );
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
	AES( State, subkeys, Tweak , tTweak );	  
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
    AES( Auth, subkeys, Tweak , tTweak );     
   
    
    /*
     *
     *
     * 			Ciphertext
     *
     *
     */
    
    c_len -= 16;
    if( c_len < 0)
      return -1;
    
    // Tag splitting
    if( c_len  < 16 ){      
      memset(last_block, 0, 16);
      memcpy(last_block, c, c_len );
      memcpy(last_block+c_len, c+c_len, 16 - c_len);
      State = load( (__m128i *) ( last_block ) );		
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_CP);
      SET_BLOCK_NO_IN_TWEAK( Tweak, (unsigned long long int)0);    
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
      AES( Checksum , subkeys, Tweak , tTweak );
      
      Auth = xor(Auth , Checksum );    
      Final = Auth;      
      SET_STAGE_IN_TWEAK(Tweak, MSB_M_TAG_SPLIT);
      AES( Final , subkeys, Tweak , tTweak );      
      store( last_block , Final );      
      
      if(0 != memcmp(c+16, last_block, c_len)) return -1;
      
      *m_len=c_len;
      return 0;      
    }    
    
    
    i=1;    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_UP);
    SET_BLOCK_NO_IN_TWEAK( Tweak, i);        
  
    // Absorb 112-byte block
    if( 112 <= c_len ){
  
      i = 0;
      SET_BLOCK_NO_IN_TWEAK( Tweak, i);	             
      PROCESS_7_CIPHERTEXT_BLOCKS( States, dsubkeys, Tweak , tTweak, c , message, Checksum , Auth );
      
      i = 8;
      Tweak = add8( Tweak, EIGHT);                 
      
    }    
    // Absorb all 128-byte blocks (8 in parallel)
    while ( 16*(i+7)  <= c_len) {
      
	PROCESS_8_CIPHERTEXT_BLOCKS( States, dsubkeys, Tweak , tTweak, c + 16 * (i-1) , message + 16 * (i-1), Checksum , Auth );
      
	if(!( (i+8)%256)){  	ADD_TO_TWEAK( Tweak, SEIGHT); }
	else 			Tweak = add8 (Tweak, EIGHT );
	
	i += 8;	
    }    
    // Absorb remaining 16-byte blocks
    while (16*i <= c_len  ) {			 
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
    AES( Checksum , subkeys, Tweak , tTweak );    
    Auth = xor( Auth , Checksum );    
    SET_STAGE_IN_TWEAK(Tweak, MSB_M_FINAL);
    Final = Auth;
    AES( Final , subkeys, Tweak , tTweak );
      
  
    i++;
    if (c_len> 16*(i-1)) {        
        
      unsigned long long int s;
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
