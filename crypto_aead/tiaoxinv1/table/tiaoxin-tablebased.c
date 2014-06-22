/*
 * Tiaoxin-346 Optimized table-based AES C Implementation
 * 
 * Copyright 2014: 
 *     Ivica Nikolic <cube444@gmail.com>
 * 
 */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "sboxes.h"

typedef unsigned char word[16];
typedef unsigned long long hw;
typedef unsigned int  col;

word Z0 = {0x42,0x8a,0x2f,0x98,0xd7,0x28,0xae,0x22,0x71,0x37,0x44,0x91,0x23,0xef,0x65,0xcd};
word Z1 = {0xb5,0xc0,0xfb,0xcf,0xec,0x4d,0x3b,0x2f,0xe9,0xb5,0xdb,0xa5,0x81,0x89,0xdb,0xbc};


#define AES_ROUND( c , p , k )\
      ((col*)(c))[0] = ((col*)Te0)[*(p + 0)]  ^ ((col*)Te1)[*(p + 5)]  ^ ((col*)Te2)[*(p +10)]  ^ ((col*)Te3)[*(p +15)]  ^ ((col*)k)[0]; \
      ((col*)(c))[1] = ((col*)Te0)[*(p + 4)]  ^ ((col*)Te1)[*(p + 9)]  ^ ((col*)Te2)[*(p +14)]  ^ ((col*)Te3)[*(p + 3)]  ^ ((col*)k)[1]; \
      ((col*)(c))[2] = ((col*)Te0)[*(p + 8)]  ^ ((col*)Te1)[*(p +13)]  ^ ((col*)Te2)[*(p + 2)]  ^ ((col*)Te3)[*(p + 7)]  ^ ((col*)k)[2]; \
      ((col*)(c))[3] = ((col*)Te0)[*(p +12)]  ^ ((col*)Te1)[*(p + 1)]  ^ ((col*)Te2)[*(p + 6)]  ^ ((col*)Te3)[*(p +11)]  ^ ((col*)k)[3];

      
#define AES_ROUND2( c , p , k1, k2 )\
      ((col*)(c))[0] = ((col*)Te0)[*(p + 0)]  ^ ((col*)Te1)[*(p + 5)]  ^ ((col*)Te2)[*(p +10)]  ^ ((col*)Te3)[*(p +15)]  ^ ((col*)k1)[0]  ^ ((col*)k2)[0]; \
      ((col*)(c))[1] = ((col*)Te0)[*(p + 4)]  ^ ((col*)Te1)[*(p + 9)]  ^ ((col*)Te2)[*(p +14)]  ^ ((col*)Te3)[*(p + 3)]  ^ ((col*)k1)[1]  ^ ((col*)k2)[1]; \
      ((col*)(c))[2] = ((col*)Te0)[*(p + 8)]  ^ ((col*)Te1)[*(p +13)]  ^ ((col*)Te2)[*(p + 2)]  ^ ((col*)Te3)[*(p + 7)]  ^ ((col*)k1)[2]  ^ ((col*)k2)[2]; \
      ((col*)(c))[3] = ((col*)Te0)[*(p +12)]  ^ ((col*)Te1)[*(p + 1)]  ^ ((col*)Te2)[*(p + 6)]  ^ ((col*)Te3)[*(p +11)]  ^ ((col*)k1)[3]  ^ ((col*)k2)[3];

            
#define AES_ROUND3( c , p , k1, k2 , k3 )\
      ((col*)(c))[0] = ((col*)Te0)[*(p + 0)]  ^ ((col*)Te1)[*(p + 5)]  ^ ((col*)Te2)[*(p +10)]  ^ ((col*)Te3)[*(p +15)]  ^ ((col*)k1)[0]  ^ ((col*)k2)[0]  ^ ((col*)k3)[0]; \
      ((col*)(c))[1] = ((col*)Te0)[*(p + 4)]  ^ ((col*)Te1)[*(p + 9)]  ^ ((col*)Te2)[*(p +14)]  ^ ((col*)Te3)[*(p + 3)]  ^ ((col*)k1)[1]  ^ ((col*)k2)[1]  ^ ((col*)k3)[1]; \
      ((col*)(c))[2] = ((col*)Te0)[*(p + 8)]  ^ ((col*)Te1)[*(p +13)]  ^ ((col*)Te2)[*(p + 2)]  ^ ((col*)Te3)[*(p + 7)]  ^ ((col*)k1)[2]  ^ ((col*)k2)[2]  ^ ((col*)k3)[2]; \
      ((col*)(c))[3] = ((col*)Te0)[*(p +12)]  ^ ((col*)Te1)[*(p + 1)]  ^ ((col*)Te2)[*(p + 6)]  ^ ((col*)Te3)[*(p +11)]  ^ ((col*)k1)[3]  ^ ((col*)k2)[3]  ^ ((col*)k3)[3];

      
#define UPDATE_ROUND( T3 , T4 , T6 , m , tmp ) \
	memcpy(     tmp   , T3[0] , 16 );\
	AES_ROUND2( T3[0] , T3[2] , tmp , (m) ); \
	memcpy(     T3[2] , T3[1] , 16 );\
	AES_ROUND ( T3[1] , tmp   , Z0 );\
					  \
	memcpy(     tmp   , T4[0] , 16 );\
	AES_ROUND2( T4[0] , T4[3] , tmp , (m+16) ); \
	memcpy(     T4[3] , T4[2] , 16 );\
	memcpy(     T4[2] , T4[1] , 16 );\
	AES_ROUND ( T4[1] , tmp   , Z0 ); \
					  \
	memcpy(     tmp   , T6[0] , 16 );\
	AES_ROUND3( T6[0] , T6[5] , tmp , (m) , (m+16) );\
	memcpy(     T6[5] , T6[4] , 16 );\
	memcpy(     T6[4] , T6[3] , 16 );\
	memcpy(     T6[3] , T6[2] , 16 );\
	memcpy(     T6[2] , T6[1] , 16 );\
	AES_ROUND ( T6[1] , tmp   , Z0 );

#define UPDATE_ROUND_SIMPLE( T3 , T4 , T6 , M0 , M1 , M2 , tmp ) \
	memcpy(     tmp   , T3[0] , 16 );\
	AES_ROUND2( T3[0] , T3[2] , tmp , (M0) ); \
	memcpy(     T3[2] , T3[1] , 16 );\
	AES_ROUND ( T3[1] , tmp   , Z0 ); \
					  \
	memcpy(     tmp   , T4[0] , 16 );\
	AES_ROUND2( T4[0] , T4[3] , tmp , (M1) ); \
	memcpy(     T4[3] , T4[2] , 16 );\
	memcpy(     T4[2] , T4[1] , 16 );\
	AES_ROUND ( T4[1] , tmp   , Z0 ); \
					  \
	memcpy(     tmp   , T6[0] , 16 );\
	AES_ROUND2( T6[0] , T6[5] , tmp , (M2)   );\
	memcpy(     T6[5] , T6[4] , 16 );\
	memcpy(     T6[4] , T6[3] , 16 );\
	memcpy(     T6[3] , T6[2] , 16 );\
	memcpy(     T6[2] , T6[1] , 16 );\
	AES_ROUND ( T6[1] , tmp   , Z0 );

#define DECRYPTION_ROUND( T3 , T4 , T6 , c , m)\
        AES_ROUND( tc    , T4[0] , Z0 ); \
        AES_ROUND( m     , T3[2] , T3[0] ); \
        AES_ROUND( m+16  , T6[5] , T6[0] );\
        AES_ROUND( tmp   , T4[3] , T4[0] );\
        memcpy(    T3[2] , T3[1] , 16 );\
	AES_ROUND( T3[1] , T3[0] , Z0 );\
	memcpy(    T6[5] , T6[4] , 16 );\
	memcpy(    T6[4] , T6[3] , 16 );\
	memcpy(    T6[3] , T6[2] , 16 );\
	memcpy(    T6[2] , T6[1] , 16 );\
	AES_ROUND( T6[1] , T6[0] , Z0 );\
	memcpy(    T4[3] , T4[2] , 16 );\
	memcpy(    T4[2] , T4[1] , 16 );\
	memcpy(    T4[1] , tc    , 16 );\
	((hw*)(T6[0]))[0] = ((hw*)(c+16))[0] ^ ((hw*)(T4[2]))[0] ^ ( ((hw*)(T6[5]))[0] & ((hw*)(T3[2]))[0] ) ^ ((hw*)(T3[1]))[0] ; \
	((hw*)(T6[0]))[1] = ((hw*)(c+16))[1] ^ ((hw*)(T4[2]))[1] ^ ( ((hw*)(T6[5]))[1] & ((hw*)(T3[2]))[1] ) ^ ((hw*)(T3[1]))[1] ; \
	((hw*)(T3[0]))[0] = ((hw*)(c+ 0))[0] ^ ((hw*)(T3[2]))[0] ^ ( ((hw*)(T6[3]))[0] & ((hw*)(T4[3]))[0] ) ^ ((hw*)(T4[1]))[0] ; \
	((hw*)(T3[0]))[1] = ((hw*)(c+ 0))[1] ^ ((hw*)(T3[2]))[1] ^ ( ((hw*)(T6[3]))[1] & ((hw*)(T4[3]))[1] ) ^ ((hw*)(T4[1]))[1] ; \
	((hw*)(m))[0] ^= ((hw*)(T3[0]))[0]; ((hw*)(m))[1] ^= ((hw*)(T3[0]))[1]; \
	((hw*)(m+16))[0] ^= ((hw*)(T6[0]))[0] ^ ((hw*)(m))[0]; ((hw*)(m+16))[1] ^= ((hw*)(T6[0]))[1] ^ ((hw*)(m))[1]; \
	((hw*)(T4[0]))[0] = ((hw*)(tmp))[0] ^ ((hw*)(m+16))[0];((hw*)(T4[0]))[1] = ((hw*)(tmp))[1] ^ ((hw*)(m+16))[1];

	
#define OUTPUT( C , T3 , T4 , T6 ) \
    ((hw*)(C))[0] = ((hw*)(T3[0]))[0] ^ ((hw*)(T3[2]))[0] ^ ((hw*)(T4[1]))[0] ^ ( ((hw*)(T6[3]))[0] & ((hw*)(T4[3]))[0] ) ;\
    ((hw*)(C))[1] = ((hw*)(T3[0]))[1] ^ ((hw*)(T3[2]))[1] ^ ((hw*)(T4[1]))[1] ^ ( ((hw*)(T6[3]))[1] & ((hw*)(T4[3]))[1] ) ;\
    ((hw*)(C))[2] = ((hw*)(T6[0]))[0] ^ ((hw*)(T4[2]))[0] ^ ((hw*)(T3[1]))[0] ^ ( ((hw*)(T6[5]))[0] & ((hw*)(T3[2]))[0] ) ;\
    ((hw*)(C))[3] = ((hw*)(T6[0]))[1] ^ ((hw*)(T4[2]))[1] ^ ((hw*)(T3[1]))[1] ^ ( ((hw*)(T6[5]))[1] & ((hw*)(T3[2]))[1] ) ;
    
    
 
/*
 * 
 * Encryptiona and authentication
 * 
 */
int tiaoxin_tablebased_encrypt( const unsigned char *ad,unsigned long long adlen,const unsigned char *m,unsigned long long mlen,const unsigned char *nsec,const unsigned char *npub,const unsigned char *k,unsigned char *c,unsigned long long *clen)
{
  int i;
  word T3[3], T4[4], T6[6];
  word tmp;
  unsigned char incomplete_block[32];
    
  /*
   *
   * Initialization
   * 
   */ 
  memcpy(T3[0],k,16); memcpy(T3[1],k,16); memcpy(T3[2],npub,16); 
  memcpy(T4[0],k,16); memcpy(T4[1],k,16); memcpy(T4[2],npub,16); memcpy(T4[3],Z0,16);
  memcpy(T6[0],k,16); memcpy(T6[1],k,16); memcpy(T6[2],npub,16); memcpy(T6[3],Z1,16); memset(T6[4],0,16); memset(T6[5],0,16);  
  for( i = 0; i < 15; i++){
    UPDATE_ROUND_SIMPLE( T3 , T4 , T6 , Z0 , Z1 , Z0 , tmp ) ;
  }
  
  
  /*
   *
   * Processing associated data
   * 
   */
  for(i = 0 ; i+32 <= adlen; i += 32 ){
    UPDATE_ROUND( T3 , T4 , T6 , ad + i , tmp );
  }
  // Process the incomplete associated data block
  if ( adlen > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , ad + i , adlen - i );    
    UPDATE_ROUND( T3 , T4 , T6 , incomplete_block , tmp );
  }
    
  
  /*
   *
   * Encryption  
   * 
   */
  for( i=0 ; i+32 <= mlen; i += 32 ){
    UPDATE_ROUND( T3 , T4 , T6 , m + i , tmp );
    OUTPUT( c + i , T3 , T4 , T6 );   
  }  
  // Process the incomplete message block
  if ( mlen > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , m + i , mlen - i );
    UPDATE_ROUND( T3 , T4 , T6 , incomplete_block , tmp );
    OUTPUT( incomplete_block , T3 , T4 , T6 );   
    memcpy( c + i , incomplete_block, mlen - i );
  }  
  
  
  /*
   *
   * Finalization
   * 
   */
  for(i=0; i<16; i++){
    incomplete_block[i + 0]  = (adlen>>(120 - 8*i)) & 0xff;
    incomplete_block[i +16]  = (mlen >>(120 - 8*i)) & 0xff;
  }  
  UPDATE_ROUND( T3 , T4 , T6 , incomplete_block, tmp ); 
  for( i = 0; i < 20; i++){
    UPDATE_ROUND_SIMPLE( T3 , T4 , T6 , Z1 , Z0 , Z1 , tmp ) ;
  }
  
  
  /*
   *
   * Set the tag and the length of the ciphertext
   * 
   */
  ((hw*)(c + mlen))[0] =  ((hw*)(T3[0]))[0] ^ ((hw*)(T3[1]))[0] ^ ((hw*)(T3[2]))[0] ^ 
			  ((hw*)(T4[0]))[0] ^ ((hw*)(T4[1]))[0] ^ ((hw*)(T4[2]))[0] ^ ((hw*)(T4[3]))[0] ^  
			  ((hw*)(T6[0]))[0] ^ ((hw*)(T6[1]))[0] ^ ((hw*)(T6[2]))[0] ^ ((hw*)(T6[3]))[0] ^ ((hw*)(T6[4]))[0] ^ ((hw*)(T6[5]))[0] ;
  ((hw*)(c + mlen))[1] =  ((hw*)(T3[0]))[1] ^ ((hw*)(T3[1]))[1] ^ ((hw*)(T3[2]))[1] ^ 
			  ((hw*)(T4[0]))[1] ^ ((hw*)(T4[1]))[1] ^ ((hw*)(T4[2]))[1] ^ ((hw*)(T4[3]))[1] ^  
			  ((hw*)(T6[0]))[1] ^ ((hw*)(T6[1]))[1] ^ ((hw*)(T6[2]))[1] ^ ((hw*)(T6[3]))[1] ^ ((hw*)(T6[4]))[1] ^ ((hw*)(T6[5]))[1] ;
  *clen = mlen + 16;  
  
  
  return 0;
  
}

/*
 * 
 * The decryption and veryfication
 * 
 */
int tiaoxin_tablebased_decrypt(unsigned char *m,unsigned long long *mlen,unsigned char *nsec,const unsigned char *c,unsigned long long clen,const unsigned char *ad,unsigned long long adlen,const unsigned char *npub,const unsigned char *k)
{
 int i;
  word T3[3], T4[4], T6[6];
  word tmp,tc;
  unsigned char incomplete_block[32];
  
  
  
  /*
   *
   * Initialization
   * 
   */ 
  memcpy(T3[0],k,16); memcpy(T3[1],k,16); memcpy(T3[2],npub,16); 
  memcpy(T4[0],k,16); memcpy(T4[1],k,16); memcpy(T4[2],npub,16); memcpy(T4[3],Z0,16);
  memcpy(T6[0],k,16); memcpy(T6[1],k,16); memcpy(T6[2],npub,16); memcpy(T6[3],Z1,16); memset(T6[4],0,16); memset(T6[5],0,16);  
  for( i = 0; i < 15; i++){
    UPDATE_ROUND_SIMPLE( T3 , T4 , T6 , Z0 , Z1 , Z0 , tmp ) ;
  }
  
  
  /*
   *
   * Processing associated data
   * 
   */
  for(i = 0 ; i+32 <= adlen; i += 32 ){
    UPDATE_ROUND( T3 , T4 , T6 , ad + i , tmp );
  }
  // Process the incomplete associated data block
  if ( adlen > i ){
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , ad + i , adlen - i );    
    UPDATE_ROUND( T3 , T4 , T6 , incomplete_block , tmp );
  }
  
  
  /*
   * 
   * Decryption
   * 
   */
  clen -= 16;
  if( clen < 0 )
    return 1;
  for( i=0 ; i+32 <= clen; i += 32 ){
    DECRYPTION_ROUND( T3 , T4 , T6 , c + i , m + i);
  }
  // Process the incomplete ciphertext block
  if ( clen > i ){
    memset( incomplete_block , 0 , 32 );
    UPDATE_ROUND( T3 , T4 , T6 , incomplete_block , tmp );
    memset( incomplete_block , 0 , 32 );
    memcpy( incomplete_block , c + i , clen - i );
    ((hw*)(tmp))[0] = ((hw*)(incomplete_block))[0] ^ ((hw*)(T3[0]))[0] ^ ((hw*)(T3[2]))[0] ^ ((hw*)(T4[1]))[0] ^ ( ((hw*)(T6[3]))[0] & ((hw*)(T4[3]))[0] )  ; \
    ((hw*)(tmp))[1] = ((hw*)(incomplete_block))[1] ^ ((hw*)(T3[0]))[1] ^ ((hw*)(T3[2]))[1] ^ ((hw*)(T4[1]))[1] ^ ( ((hw*)(T6[3]))[1] & ((hw*)(T4[3]))[1] )  ; \
    if( clen - i <= 16 ) {      
      memset( tmp+clen-i  , 0   , 16 - (clen - i ) );
      memcpy( m + i , tmp , clen - i );
      memset( tc , 0 , 16 );
    }
    else 
    {
      ((hw*)(tc))[0] = ((hw*)(incomplete_block+16))[0] ^ ((hw*)(T6[0]))[0] ^ ((hw*)(T4[2]))[0] ^ ((hw*)(T3[1]))[0] ^ 
		      ( ((hw*)(T6[5]))[0] & ((hw*)(T3[2]))[0] ) ^ ((hw*)(tmp))[0] ; 
      ((hw*)(tc))[1] = ((hw*)(incomplete_block+16))[1] ^ ((hw*)(T6[0]))[1] ^ ((hw*)(T4[2]))[1] ^ ((hw*)(T3[1]))[1] ^ 
		      ( ((hw*)(T6[5]))[1] & ((hw*)(T3[2]))[1] ) ^ ((hw*)(tmp))[1] ; 
      memcpy( m + i , tmp , 16 );
      memset( tc + clen - i - 16 , 0 , 32 - (clen - i) );
      memcpy( m + i + 16 , tc , (clen - i) - 16 );      
    }
    ((hw*)(T3[0]))[0] ^= ((hw*)(tmp))[0]; ((hw*)(T3[0]))[1] ^= ((hw*)(tmp))[1]; 
    ((hw*)(T4[0]))[0] ^= ((hw*)(tc ))[0]; ((hw*)(T4[0]))[1] ^= ((hw*)(tc ))[1]; 
    ((hw*)(T6[0]))[0] ^= ((hw*)(tmp))[0] ^ ((hw*)(tc))[0]; ((hw*)(T6[0]))[1] ^= ((hw*)(tmp))[1] ^ ((hw*)(tc))[1];     
  } 
    
  
  
  /*
   *
   * Finalization
   * 
   */
  for(i=0; i<16; i++){
    incomplete_block[i + 0]  = (adlen>>(120 - 8*i)) & 0xff;
    incomplete_block[i +16]  = (clen >>(120 - 8*i)) & 0xff;
  }  
  UPDATE_ROUND( T3 , T4 , T6 , incomplete_block, tmp ); 
  for( i = 0; i < 20; i++){
    UPDATE_ROUND_SIMPLE( T3 , T4 , T6 , Z1 , Z0 , Z1 , tmp ) ;
  }
    
  /*
   *
   * Compute the tag, check if they match and set the length of the plaintext
   * 
   */
  ((hw*)(tmp))[0] =  ((hw*)(T3[0]))[0] ^ ((hw*)(T3[1]))[0] ^ ((hw*)(T3[2]))[0] ^ 
		     ((hw*)(T4[0]))[0] ^ ((hw*)(T4[1]))[0] ^ ((hw*)(T4[2]))[0] ^ ((hw*)(T4[3]))[0] ^  
		     ((hw*)(T6[0]))[0] ^ ((hw*)(T6[1]))[0] ^ ((hw*)(T6[2]))[0] ^ ((hw*)(T6[3]))[0] ^ ((hw*)(T6[4]))[0] ^ ((hw*)(T6[5]))[0] ;
  ((hw*)(tmp))[1] =  ((hw*)(T3[0]))[1] ^ ((hw*)(T3[1]))[1] ^ ((hw*)(T3[2]))[1] ^ 
		     ((hw*)(T4[0]))[1] ^ ((hw*)(T4[1]))[1] ^ ((hw*)(T4[2]))[1] ^ ((hw*)(T4[3]))[1] ^  
		     ((hw*)(T6[0]))[1] ^ ((hw*)(T6[1]))[1] ^ ((hw*)(T6[2]))[1] ^ ((hw*)(T6[3]))[1] ^ ((hw*)(T6[4]))[1] ^ ((hw*)(T6[5]))[1] ;
				  
  for(i=0; i<16; i++)
    if( tmp[i] ^ c[clen + i] )
      return 1;
    
  *mlen = clen;    
  
  return 0;  
 
}
