/*
 * Tiaoxin-346 Reference C Implementation
 * 
 * Copyright 2014: 
 *     Ivica Nikolic <cube444@gmail.com>
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
 */

#include <string.h>
#include "tiaoxin-reference.h"
#include "aes_round.h"

/*
 * The two constants used in the cipher
 */
unsigned char Z0[16] = {0x42,0x8a,0x2f,0x98,0xd7,0x28,0xae,0x22,0x71,0x37,0x44,0x91,0x23,0xef,0x65,0xcd};
unsigned char Z1[16] = {0xb5,0xc0,0xfb,0xcf,0xec,0x4d,0x3b,0x2f,0xe9,0xb5,0xdb,0xa5,0x81,0x89,0xdb,0xbc};

/*
 * XOR and AND of two words 
 */
void XOR( word res , word S1, word S2 ){ int i; for(i=0; i<sizeof( word ); i++) res[i] = S1[i] ^ S2[i]; }
void AND( word res , word S1, word S2 ){ int i; for(i=0; i<sizeof( word ); i++) res[i] = S1[i] & S2[i]; }

  
/*
 * The Update transformation used in Tiaoxin
 */
void Update( word T3[], word T4[], word T6[], word M0, word M1, word M2 )
{
  word T3_new[3], T4_new[4], T6_new[6];
  
  // Update T3
  AES_round( T3[2] , T3[0] , T3_new[0] ); XOR ( T3_new[0] , T3_new[0] , M0 );
  AES_round( T3[0] , Z0    , T3_new[1] );
  memcpy( T3_new[2], T3[1], sizeof( word ) );
  
  // Update T4
  AES_round( T4[3] , T4[0] , T4_new[0] ); XOR ( T4_new[0] , T4_new[0] , M1 );
  AES_round( T4[0] , Z0    , T4_new[1] );
  memcpy( T4_new[2], T4[1], sizeof( word ) );
  memcpy( T4_new[3], T4[2], sizeof( word ) );
  
  // Update T6
  AES_round( T6[5] , T6[0] , T6_new[0] ); XOR ( T6_new[0] , T6_new[0] , M2 );
  AES_round( T6[0] , Z0    , T6_new[1] );
  memcpy( T6_new[2], T6[1], sizeof( word ) );
  memcpy( T6_new[3], T6[2], sizeof( word ) );
  memcpy( T6_new[4], T6[3], sizeof( word ) );
  memcpy( T6_new[5], T6[4], sizeof( word ) );
  
  memcpy( T3, T3_new, 3* sizeof( word ) );
  memcpy( T4, T4_new, 4* sizeof( word ) );
  memcpy( T6, T6_new, 6* sizeof( word ) );    
}

/*
 * 
 * The encryption and authentication
 * 
 */
int tiaoxin_reference_encrypt(const unsigned char *ad,unsigned long long adlen,const unsigned char *m,unsigned long long mlen,const unsigned char *nsec,const unsigned char *npub,const unsigned char *k,unsigned char *c,unsigned long long *clen)     
{
  unsigned long long i;
  word T3[3], T4[4], T6[6]; 
  word AD0, AD1, AD01;
  word M0 , M1 , M01 ;
  word C0 , C1;  
  word ADlength,Mlength, ADlMl;
  word Tag;
  unsigned char incomplete_block[32];
  
  /*
   * Initialization
   */
  memcpy( T3[0],  k, sizeof( word ) ); memcpy( T3[1], k, sizeof( word ) ); memcpy( T3[2], npub, sizeof( word ) );  
  memcpy( T4[0],  k, sizeof( word ) ); memcpy( T4[1], k, sizeof( word ) ); memcpy( T4[2], npub, sizeof( word ) ); memcpy( T4[3], Z0, sizeof( word ) );
  memcpy( T6[0],  k, sizeof( word ) ); memcpy( T6[1], k, sizeof( word ) ); memcpy( T6[2], npub, sizeof( word ) ); 
  memcpy( T6[3], Z1, sizeof( word ) ); memset( T6[4], 0, sizeof( word ) ); memset( T6[5],    0, sizeof( word ) );  
  for( i = 0; i < 15 ; i++ ){
    Update( T3, T4 , T6 , Z0 , Z1 , Z0 );        
  }
  
  
  /*
   * Process associated data blocks
   */
  for( i = 0; i+32 <= adlen; i += 32 ){
    memcpy ( AD0 , ad + i +  0 , sizeof(word) );
    memcpy ( AD1 , ad + i + 16 , sizeof(word) );
    XOR( AD01, AD0, AD1 );
    Update( T3, T4 , T6 , AD0 , AD1, AD01 );
  }
  // Process the incomplete associated data block
  if ( adlen > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , ad + i , adlen - i );
    memcpy ( AD0 , incomplete_block +  0 , sizeof(word) );
    memcpy ( AD1 , incomplete_block + 16 , sizeof(word) );
    XOR( AD01, AD0, AD1 );
    Update( T3, T4 , T6 , AD0 , AD1, AD01 );
  }
  
  
  /*
   * Encryption of message blocks
   */
  for( i = 0; i+32 <= mlen; i += 32 ){
    memcpy ( M0 , m + i +  0 , sizeof(word) );
    memcpy ( M1 , m + i + 16 , sizeof(word) );
    XOR( M01, M0, M1 );
    Update( T3, T4 , T6 , M0 , M1, M01 );
    AND( C0, T6[3], T4[3]); XOR( C0, C0, T4[1]); XOR( C0, C0, T3[2]); XOR( C0, C0 , T3[0]);
    AND( C1, T6[5], T3[2]); XOR( C1, C1, T3[1]); XOR( C1, C1, T4[2]); XOR( C1, C1 , T6[0]);
    memcpy( c + i +  0 , C0, sizeof(word) ); 
    memcpy( c + i + 16 , C1, sizeof(word) );
  }  
  // Process the incomplete message block  
  if ( mlen > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , m + i , mlen - i );
    memcpy( M0 , incomplete_block +  0 , sizeof(word) );
    memcpy( M1 , incomplete_block + 16 , sizeof(word) );
    XOR( M01, M0, M1 );
    Update( T3, T4 , T6 , M0 , M1, M01 );
    AND( C0, T6[3], T4[3]); XOR( C0, C0, T4[1]); XOR( C0, C0, T3[2]); XOR( C0, C0 , T3[0]);
    AND( C1, T6[5], T3[2]); XOR( C1, C1, T3[1]); XOR( C1, C1, T4[2]); XOR( C1, C1 , T6[0]);
    memcpy( incomplete_block +  0 , C0 , sizeof(word));
    memcpy( incomplete_block + 16 , C1 , sizeof(word) );     
    memcpy( c + i +  0 , incomplete_block, mlen - i );
  }
  
  
  /*
   * Finalization
   */
  for(i=0; i<16; i++){
    ADlength[i] = (adlen>>(120 - 8*i)) & 0xff;
    Mlength[i]  = (mlen >>(120 - 8*i)) & 0xff;
  }
  XOR( ADlMl, ADlength, Mlength );
  Update( T3, T4 , T6 , ADlength , Mlength, ADlMl );
  for(i=0; i<20; i++)
    Update( T3, T4 , T6 , Z1, Z0, Z1 );
  
  /*
   * The tag production as an XOR of all state words 
   */
  XOR(Tag,T3[0],T3[1]);XOR(Tag,Tag,T3[2]);XOR(Tag,Tag,T4[0]);XOR(Tag,Tag,T4[1]);XOR(Tag,Tag,T4[2]);XOR(Tag,Tag,T4[3]);
  XOR(Tag,Tag,T6[0]);XOR(Tag,Tag,T6[1]);XOR(Tag,Tag,T6[2]);XOR(Tag,Tag,T6[3]);XOR(Tag,Tag,T6[4]);XOR(Tag,Tag,T6[5]);
  memcpy( c + mlen , Tag, sizeof(word) );
    
  // Set the length of the ciphertext
  *clen = mlen + 16;
    
  return 0;
}



/*
 * 
 * The decryption and veryfication
 * 
 */
int tiaoxin_reference_decrypt(unsigned char *m,unsigned long long *mlen,unsigned char *nsec,const unsigned char *c,unsigned long long clen,const unsigned char *ad,unsigned long long adlen,const unsigned char *npub,const unsigned char *k)
{
  unsigned long long i;
  word T3[3], T4[4], T6[6]; 
  word AD0, AD1, AD01;
  word M0 , M1;
  word C0 , C1;  
  word ADlength,Mlength, ADlMl;
  word Tag;
  word zero_block ;
  unsigned char incomplete_block[32];
  
  memset(zero_block , 0, sizeof(word) );
  
  
  /*
   * Initialization
   */
  memcpy( T3[0],  k, sizeof( word ) ); memcpy( T3[1], k, sizeof( word ) ); memcpy( T3[2], npub, sizeof( word ) );  
  memcpy( T4[0],  k, sizeof( word ) ); memcpy( T4[1], k, sizeof( word ) ); memcpy( T4[2], npub, sizeof( word ) ); memcpy( T4[3], Z0, sizeof( word ) );
  memcpy( T6[0],  k, sizeof( word ) ); memcpy( T6[1], k, sizeof( word ) ); memcpy( T6[2], npub, sizeof( word ) ); 
  memcpy( T6[3], Z1, sizeof( word ) ); memset( T6[4], 0, sizeof( word ) ); memset( T6[5],    0, sizeof( word ) );  
  for( i = 0; i < 15 ; i++ ){
    Update( T3, T4 , T6 , Z0 , Z1 , Z0 );        
  }
  
  
  /*
   * Process associated data blocks
   */
  for( i = 0; i+32 <= adlen; i += 32 ){
    memcpy ( AD0 , ad + i +  0 , sizeof(word) );
    memcpy ( AD1 , ad + i + 16 , sizeof(word) );
    XOR( AD01, AD0, AD1 );
    Update( T3, T4 , T6 , AD0 , AD1, AD01 );
  }
  // Process the incomplete associated data block
  if ( adlen > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , ad + i , adlen - i );
    memcpy ( AD0 , incomplete_block +  0 , sizeof(word) );
    memcpy ( AD1 , incomplete_block + 16 , sizeof(word) );
    XOR( AD01, AD0, AD1 );
    Update( T3, T4 , T6 , AD0 , AD1, AD01 );
  }
    
  
  /*
   * Encryption of message blocks
   */
  for( i = 0; i+32 <= clen - 16; i += 32 ){
    memcpy ( C0 , c + i +  0 , sizeof(word) );
    memcpy ( C1 , c + i + 16 , sizeof(word) );    
    Update( T3, T4 , T6 , zero_block, zero_block, zero_block );
    AND( M0, T6[3], T4[3] ); XOR( M0, M0, C0); XOR( M0 , M0, T3[0]); XOR( M0, M0, T3[2]); XOR( M0, M0, T4[1]); 
    AND( M1, T6[5], T3[2] ); XOR( M1, M1, C1); XOR( M1 , M1, T6[0]); XOR( M1, M1, T4[2]); XOR( M1, M1, T3[1]); XOR( M1, M1, M0);
    XOR( T3[0], T3[0] , M0 );
    XOR( T4[0], T4[0] , M1 );
    XOR( T6[0], T6[0] , M0 ); XOR( T6[0] , T6[0], M1 );
    memcpy( m + i +  0 , M0, sizeof(word) ); 
    memcpy( m + i + 16 , M1, sizeof(word) );
  }  
  // Process the incomplete message block
  if ( clen -16 > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , c + i , clen - 16 - i );
    memcpy ( C0 , incomplete_block +  0 , sizeof(word) );
    memcpy ( C1 , incomplete_block + 16 , sizeof(word) );
    Update( T3, T4 , T6 , zero_block, zero_block, zero_block );
    AND( M0, T6[3], T4[3] ); XOR( M0, M0, C0); XOR( M0 , M0, T3[0]); XOR( M0, M0, T3[2]); XOR( M0, M0, T4[1]); 
    AND( M1, T6[5], T3[2] ); XOR( M1, M1, C1); XOR( M1 , M1, T6[0]); XOR( M1, M1, T4[2]); XOR( M1, M1, T3[1]); XOR( M1, M1, M0);    
    if( clen - 16 - i <= 16 ){  memset( M0 + (clen - 16 - i), 0, 16 - (clen - 16 - i)); memset(M1, 0, 16 ); }
    else { memset( M1 + (clen - 16 - i - 16 ), 0, 16 - (clen - 16 - i - 16 ) ); }      
    XOR( T3[0], T3[0] , M0 );
    XOR( T4[0], T4[0] , M1 );
    XOR( T6[0], T6[0] , M0 ); XOR( T6[0] , T6[0], M1 );
    memcpy( incomplete_block +  0 , M0 , sizeof(word));
    memcpy( incomplete_block + 16 , M1 , sizeof(word) );     
    memcpy( m + i +  0 , incomplete_block, clen - 16 - i );    
  }
    
  
  /*
   * Finalization
   */  
  for(i=0; i<16; i++){
    ADlength[i] = (adlen>>(120 - 8*i)) & 0xff;
    Mlength[i]  = ((clen-16) >>(120 - 8*i)) & 0xff;
  }
  XOR( ADlMl, ADlength, Mlength );
  Update( T3, T4 , T6 , ADlength , Mlength, ADlMl );
  for(i=0; i<20; i++)
    Update( T3, T4 , T6 , Z1, Z0, Z1 );
  XOR(Tag,T3[0],T3[1]);XOR(Tag,Tag,T3[2]);XOR(Tag,Tag,T4[0]);XOR(Tag,Tag,T4[1]);XOR(Tag,Tag,T4[2]);XOR(Tag,Tag,T4[3]);
  XOR(Tag,Tag,T6[0]);XOR(Tag,Tag,T6[1]);XOR(Tag,Tag,T6[2]);XOR(Tag,Tag,T6[3]);XOR(Tag,Tag,T6[4]);XOR(Tag,Tag,T6[5]);
    
  
  /*
   * Check if the tag is correct
   */
  for(i=0 ; i<16; i ++)
    if( Tag[i] ^ *(c + clen-16 + i ) )
      return -1; 
    
  // Set the length of the plaintext
  *mlen = clen-16;
      
  return 0;
}
