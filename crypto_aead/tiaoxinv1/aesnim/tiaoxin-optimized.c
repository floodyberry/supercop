/*
 * Tiaoxin-346 Optimized C Implementation for AES-NI (additional optimizations included)
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
#include <tmmintrin.h>

/* 
 * Macros for SSE instructions
 */
#define xor(a,b) 	_mm_xor_si128(a,b) 
#define and(a,b) 	_mm_and_si128(a,b)
#define enc(a,b) 	_mm_aesenc_si128(a,b) 
#define load(p)       	_mm_load_si128((__m128i *)(p))
#define store(p,x)    	_mm_storeu_si128((__m128i *)(p), (x))
#define constant8(b15,b14,b13,b12,b11,b10,b9,b8,b7,b6,b5,b4,b3,b2,b1,b0)   _mm_set_epi8 ((b0),(b1),(b2),(b3),(b4),(b5),(b6),(b7),(b8),(b9),(b10),(b11),(b12),(b13),(b14),(b15))



/*
 * The transformations R(T_s,M)
 */
#define RT3( T , M ) tmp  = T[0];T[0] = enc(T[2],M);T[2] = T[1];T[1] = enc(tmp,Z0);T[0] = xor(T[0], tmp);
#define RT4( T , M ) tmp  = T[0];T[0] = enc(T[3],M);T[3] = T[2];T[2] = T[1];T[1] = enc(tmp,Z0);T[0] = xor(T[0], tmp);
#define RT6( T , M ) tmp  = T[0];T[0] = enc(T[5],M);T[5] = T[4];T[4] = T[3];T[3] = T[2];T[2] = T[1];T[1] = enc(tmp,Z0);T[0] = xor(T[0], tmp);

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
	store( (__m128 *)(cipher+offset), xor( T4[1] , xor( T3[0] , xor( T3[2] , and( T6[3] , T4[3] ) ) ) ) );
#define OUTPUT2( T3 , T4 , T6 , cipher, offset )\
	store( (__m128 *)(cipher+offset), xor( T3[1] , xor( T6[0] , xor( T4[2] , and( T6[5] , T3[2] ) ) ) ) );

/*
 * Fast round of decryption of ciphertext block
 */

#define DECRYPTION_ROUND( T3 , T4 , T6 , C0 , C1 , storeM0, storeM1)\
	\
	C0 = xor( T3[1] , xor ( and(T6[2],T4[2]) , C0 ) );\
        C1 = xor( T4[1] , xor ( and(T6[4],T3[1]) , C1 ) );\
        \
	tmpM1 = enc( T6[5], T6[0] );\
	tmpM0 = enc( T3[2], T3[0] );\
        \
       	tmp = T4[1];\
       	T4[1] = enc( T4[0], Z0    );\
	T4[0] = enc( T4[3], T4[0] );\
        T4[3] = T4[2]; \
        T4[2] = tmp; \
        \
	T3[2] = T3[1];\
        T3[1] = enc( T3[0] , Z0);\
        \
	T6[5] = T6[4]; T6[4] = T6[3]; T6[3] = T6[2]; T6[2] = T6[1]; T6[1] = enc( T6[0] , Z0);\
	\
	T3[0] = xor( T4[1] , C0 ); \
        T6[0] = xor( T3[1] , C1 ); \
	tmpM0 = xor( tmpM0 , T3[0] );\
	tmpM1 = xor( tmpM0 , xor( T6[0] , tmpM1) );\
	T4[0] = xor( T4[0],tmpM1);\
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
	__m128i T3[3];	
	__m128i T4[4];	
	__m128i T6[6];	
	__m128i tmp;	
	__m128i Z0 	= constant8( 0x42,0x8a,0x2f,0x98,0xd7,0x28,0xae,0x22,0x71,0x37,0x44,0x91,0x23,0xef,0x65,0xcd );
	__m128i Z1 	= constant8( 0xb5,0xc0,0xfb,0xcf,0xec,0x4d,0x3b,0x2f,0xe9,0xb5,0xdb,0xa5,0x81,0x89,0xdb,0xbc );
	__m128i perm    = constant8( 7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8 );
	__m128i K;
	__m128i IV;
	__m128i Tag;
	__m128i M[4];	
	__m128i W0,W1;	
	
	/*
	 * Get the key and the nonce
	 */
	K  = load( (__m128i *) ( k ) );
	IV = load( (__m128i *) ( npub ) );	
	
		
	W0 = _mm_set_epi64x( adlen, adlen );
	W1 = _mm_set_epi64x( mlen , mlen  );	
	W0 = _mm_shuffle_epi8( W0 , perm  );
	W1 = _mm_shuffle_epi8( W1 , perm  );
		
	/* 
	 * Initialization
	 */
	T3[0] = T4[0] = T6[0] = K;
	T3[1] = T4[1] = T6[1] = K;
	T3[2] = T4[2] = T6[2] = IV;
	T4[3] = Z0; T6[3] = Z1;
	T6[4] = T6[5] = xor(Z0,Z0);
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
	      UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      M[2] = load( (__m128i *) (ad + i + 32) );  
	      M[3] = load( (__m128i *) (ad + i + 48) );  
	      UPDATE( T3 , T4 , T6, M[2] , M[3] , xor(M[2],M[3]) );
	      M[0] = load( (__m128i *) (ad + i + 64) );  
	      M[1] = load( (__m128i *) (ad + i + 80) );  
	      UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      M[2] = load( (__m128i *) (ad + i + 96) );  
	      M[3] = load( (__m128i *) (ad + i +112) );  	    	            	      
	      UPDATE( T3 , T4 , T6, M[2] , M[3] , xor(M[2],M[3]) );	  
	} 
	for( ; i+32 <= adlen; i+=32 ){	  
	      M[0] = load( (__m128i *) (ad + i +  0) );  
	      M[1] = load( (__m128i *) (ad + i + 16) );  	            	      
	      UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	}
	// Incomplete block
	if( adlen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , ad + i, adlen - i );
	  M[0] = load( (__m128i *) (incomplete_block +  0) );  
	  M[1] = load( (__m128i *) (incomplete_block + 16) );  	            	      
	  UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );	  
	}	
	
	
	/*
	 * Encryption of message blocks
	 */
	for( i = 0; i + 128 <= mlen; i+=128 ){	  
	      M[0] = load( (__m128i *) (m + i +  0) );  
	      M[1] = load( (__m128i *) (m + i + 16) );  
	      UPDATE ( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      OUTPUT1( T3 , T4 , T6 , c , i +  0); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 16);	 
	      M[2] = load( (__m128i *) (m + i + 32) );  
	      M[3] = load( (__m128i *) (m + i + 48) );  
	      UPDATE ( T3 , T4 , T6, M[2] , M[3] , xor(M[2],M[3]) );
	      OUTPUT1( T3 , T4 , T6 , c , i + 32); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 48);	 
	      M[0] = load( (__m128i *) (m + i + 64) );  
	      M[1] = load( (__m128i *) (m + i + 80) );  
	      UPDATE ( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      OUTPUT1( T3 , T4 , T6 , c , i + 64); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 80);	 
	      M[2] = load( (__m128i *) (m + i + 96) );  
	      M[3] = load( (__m128i *) (m + i +112) );  
	      UPDATE ( T3 , T4 , T6, M[2] , M[3] , xor(M[2],M[3]) );
	      OUTPUT1( T3 , T4 , T6 , c , i + 96); 
	      OUTPUT2( T3 , T4 , T6 , c , i +112);  
	}    
	for( ; i + 32 <= mlen; i+=32 ){	  
	      M[0] = load( (__m128i *) (m + i +  0) );  
	      M[1] = load( (__m128i *) (m + i + 16) );  	            	      
	      UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );
	      OUTPUT1( T3 , T4 , T6 , c , i +  0); 
	      OUTPUT2( T3 , T4 , T6 , c , i + 16);	        
	}
	// Incomplete block
	if( mlen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , m + i, mlen - i );
	  M[0] = load( (__m128i *) (incomplete_block +  0) );  
	  M[1] = load( (__m128i *) (incomplete_block + 16) );  	            	      
	  UPDATE( T3 , T4 , T6, M[0] , M[1] , xor(M[0],M[1]) );	  
	  OUTPUT1( T3 , T4 , T6 , incomplete_block ,   0); 
	  OUTPUT2( T3 , T4 , T6 , incomplete_block ,  16);	      
	  memcpy( c + i, incomplete_block, mlen - i);   
	}	
	
	/*
	 * Finalization
	 */
	// Lengths	
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
  	
	unsigned char incomplete_block[32];
	unsigned long long i;
	__m128i T3[3];	
	__m128i T4[4];	
	__m128i T6[6];	
	__m128i W0, W1;		
	__m128i tmp;
	__m128i tmpM0,tmpM1;	
	__m128i Z0 	= constant8( 0x42,0x8a,0x2f,0x98,0xd7,0x28,0xae,0x22,0x71,0x37,0x44,0x91,0x23,0xef,0x65,0xcd );
	__m128i Z1 	= constant8( 0xb5,0xc0,0xfb,0xcf,0xec,0x4d,0x3b,0x2f,0xe9,0xb5,0xdb,0xa5,0x81,0x89,0xdb,0xbc );
	__m128i perm    = constant8( 7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8 );
	__m128i K;
	__m128i IV;
	__m128i Tag;
	__m128i C[4];
	
	/*
	 * Get the key and the nonce
	 */
	K  = load( (__m128i *) ( k ) );
	IV = load( (__m128i *) ( npub ) );	
	
	W0 = _mm_set_epi64x( adlen, adlen );
	W1 = _mm_set_epi64x( clen -16, clen-16  );	
	W0 = _mm_shuffle_epi8( W0 , perm  );
	W1 = _mm_shuffle_epi8( W1 , perm  );
	
	
	/*
	 * Initialization
	 */
	T3[0] = T4[0] = T6[0] = K;
	T3[1] = T4[1] = T6[1] = K;
	T3[2] = T4[2] = T6[2] = IV;
	T4[3] = Z0; T6[3] = Z1;
	T6[4] = T6[5] = xor(Z0,Z0);
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
	      UPDATE( T3 , T4 , T6, C[0] , C[1] , xor(C[0],C[1]) );
	      C[2] = load( (__m128i *) (ad + i + 32) );  
	      C[3] = load( (__m128i *) (ad + i + 48) );  
	      UPDATE( T3 , T4 , T6, C[2] , C[3] , xor(C[2],C[3]) );
	      C[0] = load( (__m128i *) (ad + i + 64) );  
	      C[1] = load( (__m128i *) (ad + i + 80) );  
	      UPDATE( T3 , T4 , T6, C[0] , C[1] , xor(C[0],C[1]) );
	      C[2] = load( (__m128i *) (ad + i + 96) );  
	      C[3] = load( (__m128i *) (ad + i +112) );  	    	            	      
	      UPDATE( T3 , T4 , T6, C[2] , C[3] , xor(C[2],C[3]) );	  
	}  
	for( ; i+32 <= adlen; i+=32 ){	  
	      C[0] = load( (__m128i *) (ad + i +  0) );  
	      C[1] = load( (__m128i *) (ad + i + 16) );  	            	      
	      UPDATE( T3 , T4 , T6, C[0] , C[1] , xor(C[0],C[1]) );
	}
	// Incomplete block
	if( adlen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , ad + i, adlen - i );
	  C[2] = load( (__m128i *) (incomplete_block +  0) );  
	  C[3] = load( (__m128i *) (incomplete_block + 16) );  	            	      
	  UPDATE( T3 , T4 , T6, C[2] , C[3] , xor(C[2],C[3]) );	  
	}	
	
	
	/*
	 * Decryption
	 */
	clen -= 16;
	if( clen < 0 )
	  return -1;
	
	for( i = 0; i + 128 <= clen; i+=128 ){	  
	      C[0] = load( (__m128i *) (c + i +  0) );  
	      C[1] = load( (__m128i *) (c + i + 16) );  
	      DECRYPTION_ROUND( T3 , T4 , T6, C[0] , C[1] , m + i +  0 , m + i +  16 );
	      C[2] = load( (__m128i *) (c + i + 32) );  
	      C[3] = load( (__m128i *) (c + i + 48) );  
	      DECRYPTION_ROUND( T3 , T4 , T6, C[2] , C[3] , m + i + 32 , m + i +  48 );
	      C[0] = load( (__m128i *) (c + i + 64) );  
	      C[1] = load( (__m128i *) (c + i + 80) );  
	      DECRYPTION_ROUND( T3 , T4 , T6, C[0] , C[1] , m + i + 64 , m + i +  80 );
	      C[2] = load( (__m128i *) (c + i + 96) );  
	      C[3] = load( (__m128i *) (c + i +112) ); 
	      DECRYPTION_ROUND( T3 , T4 , T6, C[2] , C[3] , m + i + 96 , m + i + 112 );	      
	}	
	for( ; i + 32 <= clen; i+=32 ){	  
	      C[0] = load( (__m128i *) (c + i +  0) );  
	      C[1] = load( (__m128i *) (c + i + 16) );  	            	      
	      DECRYPTION_ROUND( T3 , T4 , T6, C[0] , C[1] , m + i +  0 , m + i +  16 );	      		      
	}     	
	// Incomplete block
	if( clen > i ){
	  memset( incomplete_block , 0, 32 );
	  memcpy( incomplete_block , c + i, clen - i );
	  C[0] = load( (__m128i *) (incomplete_block +  0) );  
	  C[1] = load( (__m128i *) (incomplete_block + 16) );  	
	  UPDATE( T3 , T4 , T6 , xor(Z0,Z0), xor(Z0,Z0), xor(Z0,Z0) );
	  tmpM0  = xor( C[0] , xor( T3[0] , xor( T3[2] , xor( T4[1] , and( T6[3], T4[3] ) ) ) ) ) ; 
	  if( clen  - i <= 16 ){ 
	    store((__m128 *)incomplete_block, tmpM0); 
	    memset( incomplete_block + ((unsigned int)(clen  - i) ), 0, 16 - ((unsigned int)(clen  - i) ) );       
	    tmpM0 = load( incomplete_block);
	  }
	  tmpM1  = xor(xor( C[1] , xor( T6[0] , xor( T4[2] , xor( T3[1] , and( T6[5], T3[2] ) ) ) ) ),tmpM0); 	
	  if( clen - i > 16 ){ 
	    store((__m128 *)incomplete_block, tmpM1); 
	    memset( incomplete_block + (clen - i - 16 ), 0, 32 - (clen - i ) );
	    tmpM1 =  load( incomplete_block);
	  }
	  else{
	    tmpM1 = xor(Z0,Z0);
	  }
	  T3[0] = xor(T3[0],tmpM0);
	  T4[0] = xor(T4[0],tmpM1);
	  T6[0] = xor(T6[0],xor(tmpM0,tmpM1));	  
	  store((__m128 *)(incomplete_block+  0), tmpM0);
	  store((__m128 *)(incomplete_block+ 16), tmpM1);
	  memcpy( m + i +  0 , incomplete_block, clen - i );    	     
	}
	
	/*
	 * Finalization
	 */
	// Lengths
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
	if(0!=memcmp(incomplete_block, c + clen , 16)) return -1;      
    
	
	
	// Set the length of the plaintext
	*mlen = clen;	
	
	return 0;
}

