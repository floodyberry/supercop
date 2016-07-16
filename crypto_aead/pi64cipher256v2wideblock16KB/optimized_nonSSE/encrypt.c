// Lightly optimized non-SSE version of the algorithm with wide block (N=1024)
// It uses precomputed values for the round constants;
// Reuses values of mu(IS) in the rounds
//
// 64-bit version of Pi64Cipher256 with padding rule: always append 10* to the message and AD
// implementation of the algorithm with 64-bit registers and security of 256-bits
// bitrate is 16KB, capacity is 16KB -> state of the permutation function is 32KB long
// key is 256 bits, PMN is 512 bits, SMN is 256 bits and the tag is 256 bits
/*
 *
 * This code was developed by: Hristina Mihajloska and Danilo Gligoroski
 *
 */

#include "crypto_aead.h"
#include <stdio.h>
#include "api.h"

// defining width of variables
typedef unsigned char         u_int8_t;
typedef unsigned short        u_int16_t;
typedef unsigned int          u_int32_t;
typedef unsigned long long    u_int64_t;

#define RATE 16384     // Rate of the Internal State in Bytes
#define W 8			   // Length of the binary words in bytes
#define N 1024         // Number of chunks of the Internal State
#define WORDS_CHUNK 4  // Number of w-bit words in one chunk
#define IS_SIZE (N*4)  // Size of the Internal State
#define R 2 		   // Tweakable parameter R, that represents the number of rounds in pi-function
#define bSMN CRYPTO_NSECBYTES/W // Offset for storing ciphertext after encrypted SMN
#define NTag 1		   // Rate for producing the tag
#define RATE_OUT WORDS_CHUNK*W

// **ATTENTION** word_size is in a correlation with data type of InternalState (u_int64_t)
u_int64_t IS[ IS_SIZE ];
u_int64_t preCompIS[ IS_SIZE ];

// initialization of the constants, used for the rounds  
const u_int64_t Constant[] = { 
  0x271E1D1B170FF0E8, 0xE4E2E1D8D4D2D1CC, 0xCAC9C6C5C3B8B4B2, 0xB1ACAAA9A6A5A39C, 0x9A999695938E8D8B, 0x87787472716C6A69, 0x6665635C5A595655, 0x534E4D4B473C3A39, 
  0x3635332E2D2B271E, 0x1D1B170FF0E8E4E2, 0xE1D8D4D2D1CCCAC9, 0xC6C5C3B8B4B2B1AC, 0xAAA9A6A5A39C9A99, 0x9695938E8D8B8778, 0x7472716C6A696665, 0x635C5A595655534E, 
  0x4D4B473C3A393635, 0x332E2D2B271E1D1B, 0x170FF0E8E4E2E1D8, 0xD4D2D1CCCAC9C6C5, 0xC3B8B4B2B1ACAAA9, 0xA6A5A39C9A999695, 0x938E8D8B87787472, 0x716C6A696665635C, 
  0x5A595655534E4D4B, 0x473C3A393635332E, 0x2D2B271E1D1B170F, 0xF0E8E4E2E1D8D4D2, 0xD1CCCAC9C6C5C3B8, 0xB4B2B1ACAAA9A6A5, 0xA39C9A999695938E, 0x8D8B87787472716C 
};

// precalculated values for the * operation when the constants are used.
// For the left constants of the rounds are calculated mu(C) and for the right constants nu(C)
const u_int64_t preCompConst[] = {
  0xcfef1a845658df67, 0xece473d44641c7ab, 0x8031a321405d631f, 0xfade2718aa3f04af, 0xe93553e53236d66a, 0x90fbd1832e1f33a1, 0xbcb24e125fd2cf31, 0xea3c32ddc5b1d39e,
  0x53a81f4591532d3b, 0xe02f10909e31ac36, 0x7583c3b10445de1b, 0xba86f63dd3b74c9e, 0x91b7835a5766e62b, 0x52a04ed1fb274049, 0x95e16bddb994fb76, 0xd88e3bca2c9e7bbf,
  0x9612db13a8a06987, 0xf48d4c19111d9843, 0xe570003c57d4c90c, 0x5bba8e9eb0390c80, 0xf2fa6ba9b962eeaa, 0xf02e82d200f6f11b, 0x2a64f6bcd6bad13f, 0x23eb74f131d33a95,
  0x86b6cb48e9d478d3, 0xab62393c653d0504, 0x2c0d636444f25f8d, 0xf91ab5b0b75f5088, 0x1a760223d2cde990, 0x0bd827132f353f09, 0xb3dc04e1dd3056de, 0xbba681c0f3d59d53

};

// macro for left rotation
#define rotl64(x,n)   (((x) << n) | ((x) >> (64 - n)))

// macro for * operation
// definition of the mu-transformation
#define mu64(x0, x1, x2, x3, t4, t5, t6, t7)\
{\
	t10 = x0; t11 = x1; t12 = x2; t13 = x3; \
	t8 = (t10  + t11); \
	t9 = (t12  + t13); \
	t0 = (0xF0E8E4E2E1D8D4D2 + t8 +  t12); \
	t0 = rotl64((t0), 7);\
	t1 = (0xD1CCCAC9C6C5C3B8 + t8 +  t13); \
	t1 = rotl64((t1), 19); \
	t2 = (0xB4B2B1ACAAA9A6A5 + t10 +  t9); \
	t2 = rotl64((t2), 31); \
	t3 = (0xA39C9A999695938E + t11 +  t9); \
	t3 = rotl64((t3), 53); \
\
	t8 = t0 ^ t1;\
	t9 = t2 ^ t3;\
\
    t4 = t8 ^ t3;\
    t5 = t8 ^ t2;\
    t6 = t1 ^ t9;\
    t7 = t0 ^ t9;\
}

// definition of the nu-transformation
#define nu64(y0, y1, y2, y3, t8, t9, t10, t11)\
{\
    t4 = y0; t5 = y1; t6 = y2; t7 = y3; \
    t8 = (t6  + t7);\
    t9 = (t4  + t5);\
    t0 = (0x8D8B87787472716C + t4 +  t8);\
    t0 = rotl64((t0), 11);\
    t1 = (0x6A696665635C5A59 + t5 +  t8);\
    t1 = rotl64((t1), 23);\
    t2 = (0x5655534E4D4B473C + t9 +  t6);\
	t2 = rotl64((t2), 37);\
    t3 = (0x3A393635332E2D2B + t9 +  t7);\
    t3 = rotl64((t3), 59);\
\
    t12 = t2  ^ t3; \
    t13 = t0  ^ t1; \
\
    t8  = t12 ^ t1; \
    t9  = t12 ^ t0; \
    t10 = t3 ^ t13; \
    t11 = t2 ^ t13; \
}

// definition of the sigma-transformation
#define sigma64(t4, t5, t6, t7, t8, t9, t10, t11, z0, z1, z2, z3) \
{ \
	t0 = t4; \
	t1 = t8; \
	z0 = (t5 + t9);  \
	z1 = (t6 + t10); \
	z2 = (t7 + t11); \
	z3 = (t0 + t1);  \
}

// The pi-function
#define pi() \
{ \
/* 1st round */ \
       nu64(IS[0], IS[1], IS[2], IS[3], \
	        IS[0], IS[1], IS[2], IS[3]);\
	sigma64(preCompConst[0], preCompConst[1], preCompConst[2], preCompConst[3], \
			IS[0], IS[1], IS[2], IS[3], \
		    IS[0], IS[1], IS[2], IS[3]); \
	for ( i = 0; i < N-1; i++ ) { \
			  mu64(IS[4*i], IS[4*i+1], IS[4*i+2], IS[4*i+3], \
				   preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3]);\
			  nu64(IS[4*(i+1)], IS[4*(i+1)+1], IS[4*(i+1)+2], IS[4*(i+1)+3], \
				   IS[4*(i+1)], IS[4*(i+1)+1], IS[4*(i+1)+2], IS[4*(i+1)+3]); \
		   sigma64(preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3], \
				   IS[4*(i+1)], IS[4*(i+1)+1], IS[4*(i+1)+2], IS[4*(i+1)+3], \
				   IS[4*(i+1)], IS[4*(i+1)+1], IS[4*(i+1)+2], IS[4*(i+1)+3]); \
	} \
	\
		mu64(IS[4*(N-1)], IS[4*(N-1)+1], IS[4*(N-1)+2], IS[4*(N-1)+3], \
			 preCompIS[4*(N-1)], preCompIS[4*(N-1)+1], preCompIS[4*(N-1)+2], preCompIS[4*(N-1)+3]); \
	sigma64(preCompIS[4*(N-1)], preCompIS[4*(N-1)+1], preCompIS[4*(N-1)+2], preCompIS[4*(N-1)+3], \
			preCompConst[4], preCompConst[5], preCompConst[6], preCompConst[7], \
			IS[4*(N-1)], IS[4*(N-1)+1], IS[4*(N-1)+2], IS[4*(N-1)+3]); \
	for ( i = N-1; i >= 1; i-- ) { \
			  nu64(IS[4*i], IS[4*i+1], IS[4*i+2], IS[4*i+3], \
			       preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3]); \
		   sigma64(preCompIS[4*(i-1)], preCompIS[4*(i-1)+1], preCompIS[4*(i-1)+2], preCompIS[4*(i-1)+3], \
			   	   preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3], \
				   IS[4*(i-1)], IS[4*(i-1)+1], IS[4*(i-1)+2], IS[4*(i-1)+3]); \
	} \
/* 2nd round */ \
		nu64(IS[0], IS[1], IS[2], IS[3], \
	         preCompIS[0], preCompIS[1], preCompIS[2], preCompIS[3]);\
	 sigma64(preCompConst[8], preCompConst[9], preCompConst[10], preCompConst[11], \
			preCompIS[0], preCompIS[1], preCompIS[2], preCompIS[3], \
		    IS[0], IS[1], IS[2], IS[3]); \
	for ( i = 0; i < N-1; i++ ) { \
			  mu64(IS[4*i], IS[4*i+1], IS[4*i+2], IS[4*i+3], \
				   preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3]);\
		   sigma64(preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3], \
				   preCompIS[4*(i+1)], preCompIS[4*(i+1)+1], preCompIS[4*(i+1)+2], preCompIS[4*(i+1)+3], \
				   IS[4*(i+1)], IS[4*(i+1)+1], IS[4*(i+1)+2], IS[4*(i+1)+3]); \
	} \
	\
	   mu64(IS[4*(N-1)], IS[4*(N-1)+1], IS[4*(N-1)+2], IS[4*(N-1)+3], \
		    preCompIS[4*(N-1)], preCompIS[4*(N-1)+1], preCompIS[4*(N-1)+2], preCompIS[4*(N-1)+3]); \
	sigma64(preCompIS[4*(N-1)], preCompIS[4*(N-1)+1], preCompIS[4*(N-1)+2], preCompIS[4*(N-1)+3], \
		    preCompConst[12], preCompConst[13], preCompConst[14], preCompConst[15], \
		    IS[4*(N-1)], IS[4*(N-1)+1], IS[4*(N-1)+2], IS[4*(N-1)+3]); \
	for ( i = N-1; i >= 1; i-- ) { \
			  nu64(IS[4*i], IS[4*i+1], IS[4*i+2], IS[4*i+3], \
				   preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3]); \
		   sigma64(preCompIS[4*(i-1)], preCompIS[4*(i-1)+1], preCompIS[4*(i-1)+2], preCompIS[4*(i-1)+3], \
				   preCompIS[4*i], preCompIS[4*i+1], preCompIS[4*i+2], preCompIS[4*i+3], \
				   IS[4*(i-1)], IS[4*(i-1)+1], IS[4*(i-1)+2], IS[4*(i-1)+3]); \
	} \
}

// Encryption and authentication procedure
int crypto_aead_encrypt(
unsigned char *c,unsigned long long *clen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *nsec,
const unsigned char *npub,
const unsigned char *k
)
{
 //...
 //... the code for the cipher implementation goes here,
 //... generating a ciphertext c[0],c[1],...,c[*clen-1]
 //... from a plaintext m[0],m[1],...,m[mlen-1]
 //... and associated data ad[0],ad[1],...,ad[adlen-1]
 //... and secret message number nsec[0],nsec[1],...
 //... and public message number npub[0],npub[1],...
 //... and secret key k[0],k[1],...
 //...

 // some 64-bit temp variables
 u_int64_t  t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13;
 // more 64-bit temp variables
 u_int64_t  x0, x1, x2, x3, y0, y1, y2, y3, z0, z1, z2, z3;
 // pointers to 64-bit variables
 u_int64_t  *c64, *m64, *ad64, *nsec64, *npub64, *k64;
 // counter ctr is a 64-bit variable in all variants of PiCipher
 u_int64_t  ctr = 0x0000000000000000ull;
 // an array for storing some temporal values for the Tag computation
 u_int64_t  tempTag[CRYPTO_ABYTES/W] = {0};
 // an array for the Common Internal State
 u_int64_t  CIS[IS_SIZE] = {0};
 // pointers that look at the used data arrays as arrays of bytes
 u_int8_t   *InternalState8, *CommonInternalState8, *tempTag8;
 // variables for dealing with various lengths of the plaintext and associated data
 int        LastMessageChunkLength, LastADChunkLength;
 // different iterator variables
 unsigned long long i, j, jj, ii, b, i1, j1, a;

 c64    = (u_int64_t *) c;
 m64    = (u_int64_t *) m;
 ad64   = (u_int64_t *) ad;
 nsec64 = (u_int64_t *) nsec;
 npub64 = (u_int64_t *) npub;
 k64    = (u_int64_t *) k;
 InternalState8       = (u_int8_t *) IS;
 CommonInternalState8 = (u_int8_t *) CIS;
 tempTag8             = (u_int8_t *) tempTag;

 // phase 1: Initialization
 for (i = 0; i < IS_SIZE; i++ ) {
	 IS[i] = 0;
 }
 // injection of the key
	IS[0] = k64[0];
	IS[1] = k64[1];
	IS[2] = k64[2];
	IS[3] = k64[3];
	
 // injection of the nonce (public message number - PMN)
	IS[4]  = npub64[0];
	IS[5]  = npub64[1];
	IS[6]  = npub64[2];
	IS[7]  = npub64[3];
	IS[8]  = npub64[4];
	IS[9]  = npub64[5];
	IS[10] = npub64[6];
	IS[11] = npub64[7];
	
 // appending a single 1 to the concatenated value of the key and PMN
	InternalState8[96] = 0x01;

 // applying the permutation function pi
	pi();

 // initialization of the Common Internal State (CIS), common for all parallel invocations of pi() with different ctrs
 for ( i = 0; i < IS_SIZE; i++ ) {
	CIS[i] = IS[i];
 }

 // initialization of the ctr obtained from the first 64 bits of the capacity of CIS
 ctr = CIS[4];

 // phase 2: Processing the associated data
 b = 0;
 a = adlen/RATE;
 for ( j = 0; j < a; j ++ ) {
	 // IS for the triplex component is initialized by the CIS for every AD block
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr ++;
	// Inject ctr + j in IS
	IS[0] = IS[0] ^ ctr;
	pi();
	// process the AD block
	// Inject the AD block
	for ( i = 0; i < N; i += 2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			IS[i*WORDS_CHUNK+i1] = IS[i*WORDS_CHUNK+i1] ^ ad64[b];
			b++;
		}
	}
	pi();
	// Collect the tag for this block
	// Sum of the tags componentwise, where the length of one component is W
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }
 // if the last AD block is not the full block, we process it byte by byte
 LastADChunkLength = adlen % RATE;
 if ( LastADChunkLength ) {
	 b = b * W;
	 i1 = 0;
	 for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	 }
	 ctr++;
	 IS[0] = IS[0] ^ ctr;
	 pi();
	 for ( i = 0; i < LastADChunkLength; i++ ) {
		 InternalState8[i1] = InternalState8[i1] ^ ad[b+i];
		 i1++;
		 if( i1 % (RATE_OUT) == 0 ) i1 += RATE_OUT;
	 }
	 // padding with 10*
	 InternalState8[i1] = InternalState8[i1] ^ 0x01;
	 pi();
	 //updating the tag
	 jj = 0;
	 for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	 }
 }
 // if the AD is full blocks we still need to append 10* and it is done in an additional block
 else{
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// padding with 10*
	InternalState8[0] = InternalState8[0] ^ 0x01;
	pi();
	//updating the tag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }

 // updating the Common Internal State by injection of the tag (tempTag) obtained from the associated data
 jj = 0;
 for ( i = 0; i < NTag; i+=2 ) {
	for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
		IS[i*WORDS_CHUNK+i1] = CIS[i*WORDS_CHUNK+i1] ^ tempTag[jj];
		IS[(i+1)*WORDS_CHUNK+i1] = CIS[(i+1)*WORDS_CHUNK+i1];
		jj++;
	}
 }
 pi();
 for ( i = 0; i < IS_SIZE; i++ ) {
	CIS[i] = IS[i];
 }

 // phase 3: Processing the secret message number
 if ( CRYPTO_NSECBYTES > 0 ) {
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// encrypt the SMN
	// Inject the SMN
	i1 = 0;
	for ( i = 0; i < CRYPTO_NSECBYTES; i++ ) {
		 c[i] = InternalState8[i1] = InternalState8[i1] ^ nsec[i];
		 i1++;
		 if( i1 % (RATE_OUT) == 0 ) i1 += RATE_OUT;
	 }
	 // padding with 10*
	 InternalState8[CRYPTO_NSECBYTES] = InternalState8[CRYPTO_NSECBYTES] ^ 0x01;
	 pi();
	 
	// updating the Common Internal State from the encrypted SMN
	for ( i = 0; i < IS_SIZE; i++ ) {
		CIS[i] = IS[i];
	}
	// Collect the tag from this encryption and update the tempTag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }

 //phase 4: Processing the message
 b = 0;
 for ( j = 0; j < mlen/RATE ; j ++ ) {
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// encrypt the message m
	// Inject a block of m
	for ( i = 0; i < N; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			c64[bSMN+b] = IS[i*WORDS_CHUNK+i1] = IS[i*WORDS_CHUNK+i1] ^ m64[b];
			b++;
		}
	}
	pi();
	// Collect the tag from this encryption and update the tempTag
	jj = 0;
	for ( i = 0; i < NTag; i += 2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }
 // if the last message block is not the full block, we process it byte by byte
 LastMessageChunkLength = mlen % RATE;
 if ( LastMessageChunkLength ) {
	 b = b * W;
	 i1 = 0;
	 for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	 }
	 ctr++;
	 IS[0] = IS[0] ^ ctr;
	 pi();
	 for ( i = 0; i < LastMessageChunkLength; i++ ) {
		 c[CRYPTO_NSECBYTES+b+i] = InternalState8[i1] = InternalState8[i1] ^ m[b+i];
		 i1++;
		 if( i1 % (RATE_OUT) == 0 ) i1 += RATE_OUT;
	 }
	 // padding with 10*
	 InternalState8[i1] = InternalState8[i1] ^ 0x01;
	 pi();
	 // updating the tag
	 jj = 0;
	 for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	 }
 }
 // if the message is full blocks we still need to append 10* and it is done in an additional block
 else{
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// padding with 10*
	InternalState8[0] = InternalState8[0] ^ 0x01;
	pi();
	//updating the tag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }

 // concatenation of the tag T to the ciphertext c
 for ( jj = 0; jj < CRYPTO_ABYTES; jj++ ) {
	c[CRYPTO_NSECBYTES+mlen+jj] = tempTag8[jj];
 }

 //updating the length of the ciphertext
 *clen = mlen + CRYPTO_ABYTES + CRYPTO_NSECBYTES;

  return 0;
}

// Decryption and Verification procedure
int crypto_aead_decrypt(
unsigned char *m,unsigned long long *mlen,
unsigned char *nsec,
const unsigned char *c,unsigned long long clen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *npub,
const unsigned char *k
)
{
 //...
 //... the code for the cipher implementation goes here,
 //... generating a plaintext m[0],m[1],...,m[*mlen-1]
 //... and secret message number nsec[0],nsec[1],...
 //... from a ciphertext c[0],c[1],...,c[clen-1]
 //... and associated data ad[0],ad[1],...,ad[adlen-1]
 //... and public message number npub[0],npub[1],...
 //... and secret key k[0],k[1],...
 //...

 // some 64-bit temp variables
 u_int64_t  t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13;
 // more 64-bit temp variables
 u_int64_t  x0, x1, x2, x3, y0, y1, y2, y3, z0, z1, z2, z3;
 // pointers to 64-bit variables
 u_int64_t  *c64, *m64, *ad64, *nsec64, *npub64, *k64;
 // an array for storing some temporal values for the Tag computation
 u_int64_t  tempTag[CRYPTO_ABYTES/W] = {0};
 // counter ctr is a 64-bit variable in all variants of PiCipher
 u_int64_t  ctr = 0x0000000000000000ull;
 // an array for the Common Internal State
 u_int64_t  CIS[IS_SIZE]={0};
 // pointers that look at the used data arrays as arrays of bytes
 u_int8_t   *InternalState8, *CommonInternalState8, *tempTag8;
 // variables for dealing with various lengths of the plaintext and associated data
 int LastMessageChunkLength, LastADChunkLength;
 // different iterator variables
 unsigned long long i, j, jj, ii, b, i1, j1, a;

 c64    = (u_int64_t *) c;
 m64    = (u_int64_t *) m;
 ad64   = (u_int64_t *) ad;
 nsec64 = (u_int64_t *) nsec;
 npub64 = (u_int64_t *) npub;
 k64    = (u_int64_t *) k;
 InternalState8 = (u_int8_t *) IS;
 CommonInternalState8 = (u_int8_t *) CIS;
 tempTag8 = (u_int8_t *) tempTag;

 // phase 1: Initialization
 for (i = 0; i < IS_SIZE; i++ ) {
	 IS[i] = 0;
 }
 // injection of the key
	IS[0] = k64[0];
	IS[1] = k64[1];
	IS[2] = k64[2];
	IS[3] = k64[3];
	
 // injection of the nonce (public message number - PMN)
	IS[4]  = npub64[0];
	IS[5]  = npub64[1];
	IS[6]  = npub64[2];
	IS[7]  = npub64[3];
	IS[8]  = npub64[4];
	IS[9]  = npub64[5];
	IS[10] = npub64[6];
	IS[11] = npub64[7];
	
 // appending a single 1 to the concatenated value of the key and PMN
	InternalState8[96] = 0x01;

 // applying the permutation function pi
	pi();

 // initialization of the Common Internal State (CIS), common for all parallel invocations of pi() with different ctrs
 for ( i = 0; i < IS_SIZE; i++ ) {
	CIS[i] = IS[i];
 }

 // initialization of the ctr obtained from the first 64 bits of the capacity of CIS
	ctr = CIS[4];

 // phase 2: Processing the associated data
 b = 0;
 a = adlen/RATE;
 for ( j = 0; j < a; j ++ ) {
	 // IS for the triplex component is initialized by the CIS for every AD block
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr ++;
	// Inject ctr + j in IS
	IS[0] = IS[0] ^ ctr;
	pi();
	// process the AD block
	// Inject the AD block
	for ( i = 0; i < N; i += 2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			IS[i*WORDS_CHUNK+i1] = IS[i*WORDS_CHUNK+i1] ^ ad64[b];
			b++;
		}
	}
	pi();
	// Collect the tag for this block
	// Sum of the tags componentwise, where the length of one component is W
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }
 // if the last AD block is not the full block, we process it byte by byte
 LastADChunkLength = adlen % RATE;
 if ( LastADChunkLength ) {
	 b = b * W;
	 i1 = 0;
	 for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	 }
	 ctr++;
	 IS[0] = IS[0] ^ ctr;
	 pi();
	 for ( i = 0; i < LastADChunkLength; i++ ) {
		 InternalState8[i1] = InternalState8[i1] ^ ad[b+i];
		 i1++;
		 if( i1 % (RATE_OUT) == 0 ) i1 += RATE_OUT;
	 }
	 // padding with 10*
	 InternalState8[i1] = InternalState8[i1] ^ 0x01;
	 pi();
	 //updating the tag
	 jj = 0;
	 for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	 }
 }
 // if the AD is full blocks we still need to append 10* and it is done in an additional block
 else{
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// padding with 10*
	InternalState8[0] = InternalState8[0] ^ 0x01;
	pi();
	//updating the tag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }

 // updating the Common Internal State by injection of the tag (tempTag) obtained from the associated data
 jj = 0;
 for ( i = 0; i < NTag; i+=2 ) {
	for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
		IS[i*WORDS_CHUNK+i1] = CIS[i*WORDS_CHUNK+i1] ^ tempTag[jj];
		IS[(i+1)*WORDS_CHUNK+i1] = CIS[(i+1)*WORDS_CHUNK+i1];
		jj++;
	}
 }
 pi();
 for ( i = 0; i < IS_SIZE; i++ ) {
	CIS[i] = IS[i];
 }


 // phase 3: Processing the secret message number
 if ( CRYPTO_NSECBYTES > 0 ) {
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// decrypt the SMN
	// Inject the SMN
	i1 = 0;
	for ( i = 0; i < CRYPTO_NSECBYTES; i++ ) {
		 nsec[i] = InternalState8[i1] ^ c[i];
	 	 InternalState8[i1] = c[i];
		 i1++;
		 if( i1 % (RATE_OUT) == 0 ) i1 += RATE_OUT;
	 }
	 // padding with 10*
	 InternalState8[CRYPTO_NSECBYTES] = InternalState8[CRYPTO_NSECBYTES] ^ 0x01;
	 pi();
	 
	// updating the Common Internal State from the encrypted SMN
	for ( i = 0; i < IS_SIZE; i++ ) {
		CIS[i] = IS[i];
	}
	// Collect the tag from this encryption and update the tempTag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }

 //phase 4: Processing the ciphertext
 b = 0;
 for ( j = 0; j < (clen-CRYPTO_ABYTES-CRYPTO_NSECBYTES)/RATE; j ++ ) {
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr ++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// decrypt the ciphertext c
	for ( i = 0; i < N; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
	        // XOR the IS_bitrate (InternalState[0], InternalSate[2], ...) with the c to obtain m
			m64[b] = IS[i*WORDS_CHUNK+i1] ^ c64[bSMN+b];
			// in order to proceed for tag computation, put the ciphertext data in the InternalState
			IS[i*WORDS_CHUNK+i1] = c64[bSMN+b];
			b++;
		}
	}
	pi();
	// Collect the tag from this decryption and update the tempTag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }
 // if the last ciphertext block is not the full block, we process it byte by byte
 LastMessageChunkLength = (clen-CRYPTO_ABYTES-CRYPTO_NSECBYTES) % RATE;
 if ( LastMessageChunkLength ) {
	 b = b * W;
	 i1 = 0;
	 for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	 }
	 ctr ++;
	 IS[0] = IS[0] ^ ctr;
	 pi();

	 for ( i = 0; i < LastMessageChunkLength; i++ ) {
	 	 m[b+i] = InternalState8[i1] ^ c[CRYPTO_NSECBYTES+b+i];
	 	 InternalState8[i1] = c[CRYPTO_NSECBYTES+b+i];
		 i1++;
		 if( i1 % (RATE_OUT) == 0 ) i1 += RATE_OUT;
	 }
	 // padding with 10*
	 InternalState8[i1] = InternalState8[i1] ^ 0x01;
	 pi();
	 // updating the tag
	 jj = 0;
	 for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	 }
 }
 // if the message is full blocks we still need to append 10* and it is done in to an additional block
 else{
	for ( i = 0; i < IS_SIZE; i++ ) {
		IS[i] = CIS[i];
	}
	ctr++;
	IS[0] = IS[0] ^ ctr;
	pi();
	// padding with 10*
	InternalState8[0] = InternalState8[0] ^ 0x01;
	pi();
	//updating the tag
	jj = 0;
	for ( i = 0; i < NTag; i+=2 ) {
		for ( i1 = 0; i1 < WORDS_CHUNK; i1++ ) {
			tempTag[jj] = tempTag[jj] + IS[i*WORDS_CHUNK+i1];
			jj++;
		}
	}
 }

 //updating the length of the message
 *mlen = clen-CRYPTO_ABYTES-CRYPTO_NSECBYTES;

 // tag verification
 for ( ii = (*mlen + CRYPTO_NSECBYTES); ii < clen; ii ++ ) {
	 if ( c[ii] != tempTag8[ii-(*mlen + CRYPTO_NSECBYTES)] )
		return -1;
 }

 return 0;
}
