/*
 * Tiaoxin-346 Optimized C Implementation for AES-NI
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
#include <stdlib.h>
#include <xmmintrin.h>              
#include <emmintrin.h>              
#include <wmmintrin.h>              

/* 
 * Macros for SSE instructions
 */
#define xor(a,b) 	_mm_xor_si128(a,b) 
#define and(a,b) 	_mm_and_si128(a,b)
#define enc(a,b) 	_mm_aesenc_si128(a,b) 
#define load(p)       	_mm_load_si128((__m128i *)(p))
#define store(p,x)    	_mm_store_si128((__m128i *)(p), (x))
#define constant8(b15,b14,b13,b12,b11,b10,b9,b8,b7,b6,b5,b4,b3,b2,b1,b0)   _mm_set_epi8 ((b0),(b1),(b2),(b3),(b4),(b5),(b6),(b7),(b8),(b9),(b10),(b11),(b12),(b13),(b14),(b15))



/*
 * The transformations R(T_s,M)
 */
#define RT3( T , M ) tmp  = T[0];T[0] = enc(T[2],tmp);T[0] = xor(T[0], M);T[2] = T[1];T[1] = enc(tmp,Z0);
#define RT4( T , M ) tmp  = T[0];T[0] = enc(T[3],tmp);T[0] = xor(T[0], M);T[3] = T[2];T[2] = T[1];T[1] = enc(tmp,Z0);
#define RT6( T , M ) tmp  = T[0];T[0] = enc(T[5],tmp);T[0] = xor(T[0], M);T[5] = T[4];T[4] = T[3];T[3] = T[2];T[2] = T[1];T[1] = enc(tmp,Z0);

/*
 * The transformation Update
 */
#define UPDATE( T3 , T4 , T6 , M0 , M1 , M2 )\
RT3( T3, M0 );\
RT4( T4, M1 );\
RT6( T6, M2 );

/*
 * The output functions for the ciphertext 
 */
#define OUTPUT1( T3 , T4 , T6 , cipher, offset )\
	tmp = and( T6[3], T4[3] );\
	tc  = xor( T3[0] , xor( T3[2] , xor( T4[1] , tmp ) ) ) ; \
	store( (__m128 *)(cipher+offset), tc );
#define OUTPUT2( T3 , T4 , T6 , cipher, offset )\
	tmp = and( T6[5] , T3[2] );\
	tc  = xor( T6[0] , xor( T4[2] , xor( T3[1] , tmp ) ) ); 	\
	store( (__m128 *)(cipher+offset), tc );

/*
 * Fast round of decryption of ciphertext block
 */
#define DECRYPTION_ROUND( T3 , T4 , T6 , C0 , C1 , storeM0, storeM1)\
	tc    = enc( T4[0], Z0    );\
	tmpM0 = enc( T3[2], T3[0] );\
	tmpM1 = enc( T6[5], T6[0] );\
	tmp   = enc( T4[3], T4[0] );\
	T3[2] = T3[1]; T3[1] = enc( T3[0] , Z0);\
	T3[0] = xor(C0,T3[2]); \
	T6[5] = T6[4]; T6[4] = T6[3]; T6[3] = T6[2]; T6[2] = T6[1]; T6[1] = enc( T6[0] , Z0);\
	T4[3] = T4[2]; T4[2] = T4[1]; T4[1] = tc;\
	T6[0] = xor(C1,T4[2]); \
	T3[0] = xor( T3[0], and(T6[3],T4[3])); \
        T6[0] = xor( T6[0], and(T6[5],T3[2])); \
        T3[0] = xor( T3[0] , T4[1]);\
        T6[0] = xor( T6[0] , T3[1]);\
        tmpM0 = xor( tmpM0 , T3[0] );\
        tmpM1 = xor( tmpM1 , T6[0] ); tmpM1 = xor(tmpM1 , tmpM0);\
	T4[0] = xor(tmp,tmpM1);\
	store( (__m128 *)(storeM0), tmpM0 );\
	store( (__m128 *)(storeM1), tmpM1 );

	

/*
 * 
 * The encryption and authenticationd
 * 
 */
int tiaoxin_optimized_encrypt( const unsigned char *ad,unsigned long long adlen,
			       const unsigned char *m,unsigned long long mlen,
			       const unsigned char *nsec,const unsigned char *npub,const unsigned char *k,
			       unsigned char *c,unsigned long long *clen)
{
	unsigned long long i;
	unsigned char incomplete_block[32];
	unsigned char ADlength[16];
	unsigned char Mlength [16];
	__m128i T3[3];	
	__m128i T4[4];	
	__m128i T6[6];	
	__m128i W0, W1;		
	__m128i tmp,tc;	
	__m128i Z0 	= constant8( 0x42,0x8a,0x2f,0x98,0xd7,0x28,0xae,0x22,0x71,0x37,0x44,0x91,0x23,0xef,0x65,0xcd );
	__m128i Z1 	= constant8( 0xb5,0xc0,0xfb,0xcf,0xec,0x4d,0x3b,0x2f,0xe9,0xb5,0xdb,0xa5,0x81,0x89,0xdb,0xbc );
	__m128i K;
	__m128i IV;
	__m128i Tag;
	__m128i M[8];	
	
	/*
	 * Get the key and the nonce
	 */
	K  = load( (__m128i *) ( k ) );
	IV = load( (__m128i *) ( npub ) );	
	
	
	/* 
	 * Initialization
	 */
	T3[0] = T4[0] = T6[0] = K;
	T3[1] = T4[1] = T6[1] = K;
	T3[2] = T4[2] = T6[2] = IV;
	T4[3] = Z0; T6[3] = Z1;
	T6[4] = T6[5] = constant8( 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 );	
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );	
	
	
	/*
	 * Process associated data blocks
	 */
	for( i = 0; i + 128 <= adlen; i+=128 ){	  
	      M[0] = load( (__m128i *) (ad + i +  0) );  
	      M[1] = load( (__m128i *) (ad + i + 16) );  
	      M[2] = load( (__m128i *) (ad + i + 32) );  
	      M[3] = load( (__m128i *) (ad + i + 48) );  
	      M[4] = load( (__m128i *) (ad + i + 64) );  
	      M[5] = load( (__m128i *) (ad + i + 80) );  
	      M[6] = load( (__m128i *) (ad + i + 96) );  
	      M[7] = load( (__m128i *) (ad + i +112) );  	    	            	      
	      UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      UPDATE( T3 , T4 , T6, M[2] , M[3] , xor(M[2],M[3]) );
	      UPDATE( T3 , T4 , T6, M[4] , M[5] , xor(M[4],M[5]) );
	      UPDATE( T3 , T4 , T6, M[6] , M[7] , xor(M[6],M[7]) );	  
	}  
	for( ; i+32 <= adlen; i+=32 ){	  
	      W0 = load( (__m128i *) (ad + i +  0) );  
	      W1 = load( (__m128i *) (ad + i + 16) );  	            	      
	      UPDATE( T3 , T4 , T6, W0 , W1 , xor(W0,W1) );
	}
	// Incomplete block
	if( adlen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , ad + i, adlen - i );
	  W0 = load( (__m128i *) (incomplete_block +  0) );  
	  W1 = load( (__m128i *) (incomplete_block + 16) );  	            	      
	  UPDATE( T3 , T4 , T6, W0 , W1 , xor(W0,W1) );	  
	}	
	
	
	/*
	 * Encryption of message blocks
	 */
	for( i = 0; i + 128 <= mlen; i+=128 ){	  
	      M[0] = load( (__m128i *) (m + i +  0) );  
	      M[1] = load( (__m128i *) (m + i + 16) );  
	      M[2] = load( (__m128i *) (m + i + 32) );  
	      M[3] = load( (__m128i *) (m + i + 48) );  
	      M[4] = load( (__m128i *) (m + i + 64) );  
	      M[5] = load( (__m128i *) (m + i + 80) );  
	      M[6] = load( (__m128i *) (m + i + 96) );  
	      M[7] = load( (__m128i *) (m + i +112) );  
	      UPDATE ( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      OUTPUT1( T3 , T4 , T6 , c , i +  0); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 16);	 
	      UPDATE ( T3 , T4 , T6, M[2] , M[3] , xor(M[2],M[3]) );
	      OUTPUT1( T3 , T4 , T6 , c , i + 32); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 48);	 
	      UPDATE ( T3 , T4 , T6, M[4] , M[5] , xor(M[4],M[5]) );
	      OUTPUT1( T3 , T4 , T6 , c , i + 64); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 80);	 
	      UPDATE ( T3 , T4 , T6, M[6] , M[7] , xor(M[6],M[7]) );
	      OUTPUT1( T3 , T4 , T6 , c , i + 96); 
	      OUTPUT2( T3 , T4 , T6 , c , i +112);  
	}    
	for( ; i + 32 <= mlen; i+=32 ){	  
	      W0 = load( (__m128i *) (m + i +  0) );  
	      W1 = load( (__m128i *) (m + i + 16) );  	            	      
	      UPDATE( T3 , T4 , T6, W0 , W1 , xor(W0,W1) );
	      OUTPUT1( T3 , T4 , T6 , c , i +  0); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 16);	        
	}
	// Incomplete block
	if( mlen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , m + i, mlen - i );
	  W0 = load( (__m128i *) (incomplete_block +  0) );  
	  W1 = load( (__m128i *) (incomplete_block + 16) );  	            	      
	  UPDATE( T3 , T4 , T6, W0 , W1 , xor(W0,W1) );	  
	  OUTPUT1( T3 , T4 , T6 , incomplete_block ,   0); 
	  OUTPUT2( T3 , T4 , T6 , incomplete_block ,  16);	      
	  memcpy( c + i, incomplete_block, mlen - i);   
	}	
	
	/*
	 * Finalization
	 */
	// Lengths
	for(i=0; i<16; i++){
	  ADlength[i] = (adlen>>(120 - 8*i)) & 0xff;
	  Mlength[i]  = (mlen >>(120 - 8*i)) & 0xff;
	}
	W0 = load( (__m128i *) ( ADlength) );  
	W1 = load( (__m128i *) ( Mlength ) );
	UPDATE( T3 , T4 , T6 , W0 , W1 , xor(W0,W1) );
	// 20 additional rounds
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
		
		
	/*
	 * Tag as XOR of all state words 
	 */
	Tag  = xor(T3[0], xor(T3[1], xor(T3[2], xor(T4[0], xor(T4[1], xor(T4[2], xor(T4[3], 
	       xor(T6[0], xor(T6[1], xor(T6[2], xor(T6[3], xor(T6[4], T6[5] ) ) ) ) ) ) ) ) ) ) ) ) ;
	store( (__m128 *)( incomplete_block ), Tag );
	memcpy( c + mlen, incomplete_block , 16 );
	
	// Set the length of the ciphertext
	*clen = mlen + 16;	
	
	return 0;
}



/*
 * 
 * The decryption and verification
 * 
 */
int tiaoxin_optimized_decrypt(unsigned char *m,unsigned long long *mlen,
			      unsigned char *nsec,
			      const unsigned char *c,unsigned long long clen,
			      const unsigned char *ad,unsigned long long adlen,
			      const unsigned char *npub,const unsigned char *k)
{	
  	
	unsigned long long i;
	unsigned char *incomplete_block;
	unsigned char one_block[16];
	unsigned char ADlength[16];
	unsigned char Mlength [16];
	__m128i T3[3];	
	__m128i T4[4];	
	__m128i T6[6];	
	__m128i W0, W1;		
	__m128i tmp,tc,tmpM0,tmpM1;	
	__m128i Z0 	= constant8( 0x42,0x8a,0x2f,0x98,0xd7,0x28,0xae,0x22,0x71,0x37,0x44,0x91,0x23,0xef,0x65,0xcd );
	__m128i Z1 	= constant8( 0xb5,0xc0,0xfb,0xcf,0xec,0x4d,0x3b,0x2f,0xe9,0xb5,0xdb,0xa5,0x81,0x89,0xdb,0xbc );
	__m128i zero    = constant8( 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 );	
	__m128i K;
	__m128i IV;
	__m128i Tag;
	__m128i M[2], C[8];
	
	if( posix_memalign((void **)&incomplete_block, 16, 32) ) 
	  return -2;
	
	/*
	 * Get the key and the nonce
	 */
	K  = load( (__m128i *) ( k ) );
	IV = load( (__m128i *) ( npub ) );	
	
	
	/*
	 * Initialization
	 */
	T3[0] = T4[0] = T6[0] = K;
	T3[1] = T4[1] = T6[1] = K;
	T3[2] = T4[2] = T6[2] = IV;
	T4[3] = Z0; T6[3] = Z1;
	T6[4] = T6[5] = constant8( 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 );	
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );
	UPDATE( T3 , T4 , T6, Z0 , Z1 , Z0 );	

	
	/*
	 * Process associated data blocks
	 */
	for( i = 0; i + 128 <= adlen; i+=128 ){	  
	      C[0] = load( (__m128i *) (ad + i +  0) );  
	      C[1] = load( (__m128i *) (ad + i + 16) );  
	      C[2] = load( (__m128i *) (ad + i + 32) );  
	      C[3] = load( (__m128i *) (ad + i + 48) );  
	      C[4] = load( (__m128i *) (ad + i + 64) );  
	      C[5] = load( (__m128i *) (ad + i + 80) );  
	      C[6] = load( (__m128i *) (ad + i + 96) );  
	      C[7] = load( (__m128i *) (ad + i +112) );  	    	            	      
	      UPDATE( T3 , T4 , T6, C[0] , C[1] , xor(C[0],C[1]) );
	      UPDATE( T3 , T4 , T6, C[2] , C[3] , xor(C[2],C[3]) );
	      UPDATE( T3 , T4 , T6, C[4] , C[5] , xor(C[4],C[5]) );
	      UPDATE( T3 , T4 , T6, C[6] , C[7] , xor(C[6],C[7]) );	  
	}  
	for( ; i+32 <= adlen; i+=32 ){	  
	      W0 = load( (__m128i *) (ad + i +  0) );  
	      W1 = load( (__m128i *) (ad + i + 16) );  	            	      
	      UPDATE( T3 , T4 , T6, W0 , W1 , xor(W0,W1) );
	}
	// Incomplete block
	if( adlen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , ad + i, adlen - i );
	  W0 = load( (__m128i *) (incomplete_block +  0) );  
	  W1 = load( (__m128i *) (incomplete_block + 16) );  	            	      
	  UPDATE( T3 , T4 , T6, W0 , W1 , xor(W0,W1) );	  
	}	
	
	
	/*
	 * Decryption
	 */
	if( clen < 16 )
	  return -1;
	
	for( i = 0; i + 128 + 16 <= clen; i+=128 ){	  
	      C[0] = load( (__m128i *) (c + i +  0) );  
	      C[1] = load( (__m128i *) (c + i + 16) );  
	      DECRYPTION_ROUND( T3 , T4 , T6, C[0] , C[1] , m + i +  0 , m + i +  16 );
	      C[2] = load( (__m128i *) (c + i + 32) );  
	      C[3] = load( (__m128i *) (c + i + 48) );  
	      DECRYPTION_ROUND( T3 , T4 , T6, C[2] , C[3] , m + i + 32 , m + i +  48 );
	      C[4] = load( (__m128i *) (c + i + 64) );  
	      C[5] = load( (__m128i *) (c + i + 80) );  
	      DECRYPTION_ROUND( T3 , T4 , T6, C[4] , C[5] , m + i + 64 , m + i +  80 );
	      C[6] = load( (__m128i *) (c + i + 96) );  
	      C[7] = load( (__m128i *) (c + i +112) ); 
	      DECRYPTION_ROUND( T3 , T4 , T6, C[6] , C[7] , m + i + 96 , m + i + 112 );	      
	}    
	for( ; i + 32 + 16 <= clen; i+=32 ){	  
	      W0 = load( (__m128i *) (c + i +  0) );  
	      W1 = load( (__m128i *) (c + i + 16) );  	            	      
	      DECRYPTION_ROUND( T3 , T4 , T6, W0 , W1 , m + i +  0 , m + i +  16 );	      	
	}     	
	// Incomplete block
	if( clen-16 > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , c + i, clen - 16 - i );
	  W0 = load( (__m128i *) (incomplete_block +  0) );  
	  W1 = load( (__m128i *) (incomplete_block + 16) );  	
	  UPDATE( T3 , T4 , T6 , zero, zero, zero );
	  tmp = and( T6[3], T4[3] ); M[0]  = xor( W0 , xor( T3[0] , xor( T3[2] , xor( T4[1] , tmp ) ) ) ) ; 
	  if( clen - 16 - i <= 16 ){ 
	    store((__m128 *)incomplete_block, M[0]); 
	    memset( incomplete_block + ((unsigned int)(clen - 16 - i) ), 0, 16 - ((unsigned int)(clen - 16 - i) ) );       
	    M[0] = load( incomplete_block);
	    memcpy(one_block, incomplete_block, 16);
	  }
	  tmp = and( T6[5], T3[2] ); M[1]  = xor(xor( W1 , xor( T6[0] , xor( T4[2] , xor( T3[1] , tmp ) ) ) ),M[0]); 	
	  if( clen - 16 - i > 16 ){ 
	    store((__m128 *)incomplete_block, M[1]); 
	    memset( incomplete_block + (clen - 16 - i - 16 ), 0, 32 - (clen - 16 - i ) );
	    M[1] =  load( incomplete_block);
	  }
	  else{
	    M[1] = zero;
	  }
	  T3[0] = xor(T3[0],M[0]);
	  T4[0] = xor(T4[0],M[1]);
	  T6[0] = xor(T6[0],xor(M[0],M[1]));	  
	  store((__m128 *)(incomplete_block+  0), M[0]);
	  store((__m128 *)(incomplete_block+ 16), M[1]);
	  memcpy( m + i +  0 , incomplete_block, clen - 16 - i );    	     
	}
	

	/*
	 * Finalization
	 */
	// Lengths
	for(i=0; i<16; i++){
	  ADlength[i] = (adlen>>(120 - 8*i)) & 0xff;
	  Mlength[i]  = ((clen-16) >>(120 - 8*i)) & 0xff;
	}
	W0 = load( (__m128i *) ( ADlength) );  
	W1 = load( (__m128i *) ( Mlength ) );
	UPDATE( T3 , T4 , T6 , W0 , W1 , xor(W0,W1) );
	// 20 additional rounds
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	
	UPDATE( T3 , T4 , T6 , Z1 , Z0 , Z1);	

	
	
	/*
	 * Produce the tag as XOR of all state words
	 */
	Tag  = xor(T3[0], xor(T3[1], xor(T3[2], xor(T4[0], xor(T4[1], xor(T4[2], xor(T4[3], 
	       xor(T6[0], xor(T6[1], xor(T6[2], xor(T6[3], xor(T6[4], T6[5] ) ) ) ) ) ) ) ) ) ) ) ) ;
	store( (__m128 *)( incomplete_block ), Tag );
	      
	/*
	 * Check if the tag is correct
	 */
	for(i=0 ; i<16; i ++)
	  if( incomplete_block[i] ^ *(c + clen-16 + i ) ){
	    return -1; 
	  }
      
	
	// Set the length of the plaintext
	*mlen = clen-16;	
	
	return 0;
}

