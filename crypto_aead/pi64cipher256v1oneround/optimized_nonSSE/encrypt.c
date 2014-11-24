// Lightly optimized non-SSE version of the algorithm with 1 round
// It uses precomputed values for the round constants;
// Reuses values of mu(IS) in the rounds
//
// 64-bit version of Pi64Cipher256
// implementation of the algorithm with 64-bit registers and security of 256-bits
// bitrate is 512-bits, capacity is 512-bits -> state of the permutation function is 1024 bits long
// key is 256 bits, PMN is 128 bits, SMN is 512 bits and the tag is 512 bits
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

#define RATE 64       // Rate of the Internal State in Bytes 
#define W 8	      // Length of the binary words in Bytes
#define N 4           // Number of chunks of the Internal State
#define WORDS_CHUNK 4 // Number of w-bit words in one chunk
#define IS_SIZE (N*4) // Size of the Internal State
#define R 1			  // Tweakable parameter R, that represents the number of rounds in pi-function
#define bSMN CRYPTO_NSECBYTES/W // Offset for storing ciphertext after encrypted SMN
#define RATE_OUT WORDS_CHUNK*W  // bitrate part of the Internal State in Bytes

// **ATTENTION** word_size is in a correlation with data type of InternalState (u_int64_t)
u_int64_t IS[IS_SIZE];

// precalculated values for the * operation when the constants are used.
// For the left constants of the rounds are calculated mu(C) and for the right constants nu(C)
const u_int64_t preCompConst0 = 0xcfef1a845658df67, preCompConst1 = 0xece473d44641c7ab, preCompConst2 = 0x8031a321405d631f, preCompConst3 = 0xfade2718aa3f04af;
const u_int64_t preCompConst4 = 0xe93553e53236d66a, preCompConst5 = 0x90fbd1832e1f33a1, preCompConst6 = 0xbcb24e125fd2cf31, preCompConst7 = 0xea3c32ddc5b1d39e;
const u_int64_t	preCompConst8 = 0x53a81f4591532d3b, preCompConst9 = 0xe02f10909e31ac36, preCompConst10 = 0x7583c3b10445de1b, preCompConst11 = 0xba86f63dd3b74c9e;
const u_int64_t	preCompConst12 = 0x91b7835a5766e62b, preCompConst13 = 0x52a04ed1fb274049, preCompConst14 = 0x95e16bddb994fb76, preCompConst15 = 0xd88e3bca2c9e7bbf;
const u_int64_t	preCompConst16 = 0x9612db13a8a06987, preCompConst17 = 0xf48d4c19111d9843, preCompConst18 = 0xe570003c57d4c90c, preCompConst19 = 0x5bba8e9eb0390c80;
const u_int64_t	preCompConst20 = 0xf2fa6ba9b962eeaa, preCompConst21 = 0xf02e82d200f6f11b, preCompConst22 = 0x2a64f6bcd6bad13f, preCompConst23 = 0x23eb74f131d33a95;
const u_int64_t	preCompConst24 = 0x86b6cb48e9d478d3, preCompConst25 = 0xab62393c653d0504, preCompConst26 = 0x2c0d636444f25f8d, preCompConst27 = 0xf91ab5b0b75f5088;
const u_int64_t	preCompConst28 = 0x1a760223d2cde990, preCompConst29 = 0x0bd827132f353f09, preCompConst30 = 0xb3dc04e1dd3056de, preCompConst31 = 0xbba681c0f3d59d53;

// macro for left rotation
#define rotl64(x,n)   (((x) << n) | ((x) >> (64 - n)))

// macro for * operation
// definition of the mu-transformation
#define mu64(x0, x1, x2, x3, t4, t5, t6, t7)\
{\
	t8 = (x0 + x1); \
	t9 = (x2 + x3); \
	t0 = (0xF0E8E4E2E1D8D4D2 + t8 + x2); \
	t0 = rotl64((t0), 7); \
	t1 = (0xD1CCCAC9C6C5C3B8 + t8 + x3); \
	t1 = rotl64((t1), 19); \
	t2 = (0xB4B2B1ACAAA9A6A5 + x0 + t9); \
	t2 = rotl64((t2), 31); \
	t3 = (0xA39C9A999695938E + x1 + t9); \
	t3 = rotl64((t3), 53); \
	\
	t8 = t0 ^ t1; \
	t9 = t2 ^ t3; \
	\
	t4 = t8 ^ t3; \
	t5 = t8 ^ t2; \
	t6 = t1 ^ t9; \
	t7 = t0 ^ t9; \
}

// definition of the nu-transformation
#define nu64(y0, y1, y2, y3, t8, t9, t10, t11)\
{\
	t12 = (y2 + y3); \
	t13 = (y0 + y1); \
	t0 = (0x8D8B87787472716C + y0 + t12); \
	t0 = rotl64((t0), 11); \
	t1 = (0x6A696665635C5A59 + y1 + t12); \
	t1 = rotl64((t1), 23); \
	t2 = (0x5655534E4D4B473C + t13 + y2); \
	t2 = rotl64((t2), 37); \
	t3 = (0x3A393635332E2D2B + t13 + y3); \
	t3 = rotl64((t3), 59); \
	\
	t12 = t2  ^ t3; \
	t13 = t0  ^ t1; \
	\
	t8 = t12 ^ t1; \
	t9 = t12 ^ t0; \
	t10 = t3 ^ t13; \
	t11 = t2 ^ t13; \
}

// definition of the nu-transformation optimized
#define nu64_opt(y0, t0, t1, t2, t3, t8, t9, t10, t11)\
{\
	t4 = t0 + y0; \
	t4 = rotl64((t4), 11); \
	t5 = t2 + y0; \
	t5 = rotl64((t5), 37); \
	t6 = t3 + y0; \
	t6 = rotl64((t6), 59); \
	\
	t12 = t5  ^ t6; \
	t13 = t4  ^ t1; \
	\
	t8 = t12 ^ t1; \
	t9 = t12 ^ t4; \
	t10 = t6 ^ t13; \
	t11 = t5 ^ t13; \
}

// definition of the sigma-transformation
#define sigma64(t4, t5, t6, t7, t8, t9, t10, t11, z0, z1, z2, z3) \
{ \
	t0 = t11; \
	z3 = (t4 + t8);  \
	z0 = (t5 + t9);  \
	z1 = (t6 + t10); \
	z2 = (t7 + t0);  \
}

// The pi-function
#define pi(IS0, IS1, IS2, IS3, IS4, IS5, IS6, IS7, IS8, IS9, IS10, IS11, IS12, IS13, IS14, IS15) \
{ \
	/* 1st round */ \
	/* 1st chunk */ \
	nu64(IS0, IS1, IS2, IS3, \
		 IS0, IS1, IS2, IS3); \
	sigma64(preCompConst0, preCompConst1, preCompConst2, preCompConst3, \
			IS0, IS1, IS2, IS3, \
			IS0, IS1, IS2, IS3); \
	/* 2nd chunk */ \
	mu64(IS0, IS1, IS2, IS3, \
		 preCompIS0, preCompIS1, preCompIS2, preCompIS3); \
	nu64(IS4, IS5, IS6, IS7, \
		 IS4, IS5, IS6, IS7); \
	sigma64(preCompIS0, preCompIS1, preCompIS2, preCompIS3, \
			IS4, IS5, IS6, IS7, \
			IS4, IS5, IS6, IS7); \
	/* 3rd chunk */ \
	mu64(IS4, IS5, IS6, IS7, \
		 preCompIS4, preCompIS5, preCompIS6, preCompIS7); \
	nu64(IS8, IS9, IS10, IS11, \
		 IS8, IS9, IS10, IS11); \
	sigma64(preCompIS4, preCompIS5, preCompIS6, preCompIS7, \
			IS8, IS9, IS10, IS11, \
			IS8, IS9, IS10, IS11); \
	/* 4th chunk */ \
	mu64(IS8, IS9, IS10, IS11, \
		 preCompIS8, preCompIS9, preCompIS10, preCompIS11); \
	nu64(IS12, IS13, IS14, IS15, \
		 IS12, IS13, IS14, IS15); \
	sigma64(preCompIS8, preCompIS9, preCompIS10, preCompIS11, \
			IS12, IS13, IS14, IS15, \
			IS12, IS13, IS14, IS15); \
	/* 4th chunk */ \
	mu64(IS12, IS13, IS14, IS15, \
		 preCompIS12, preCompIS13, preCompIS14, preCompIS15); \
	sigma64(preCompIS12, preCompIS13, preCompIS14, preCompIS15, \
			preCompConst4, preCompConst5, preCompConst6, preCompConst7, \
			IS12, IS13, IS14, IS15); \
	/* 3rd chunk */ \
	nu64(IS12, IS13, IS14, IS15, \
		 preCompIS12, preCompIS13, preCompIS14, preCompIS15); \
	sigma64(preCompIS8, preCompIS9, preCompIS10, preCompIS11, \
			preCompIS12, preCompIS13, preCompIS14, preCompIS15, \
			IS8, IS9, IS10, IS11); \
	/* 2nd chunk */ \
	nu64(IS8, IS9, IS10, IS11, \
		 preCompIS8, preCompIS9, preCompIS10, preCompIS11); \
	sigma64(preCompIS4, preCompIS5, preCompIS6, preCompIS7, \
			preCompIS8, preCompIS9, preCompIS10, preCompIS11, \
			IS4, IS5, IS6, IS7); \
	/* 1st chunk */ \
	nu64(IS4, IS5, IS6, IS7, \
		 preCompIS4, preCompIS5, preCompIS6, preCompIS7); \
	sigma64(preCompIS0, preCompIS1, preCompIS2, preCompIS3, \
			preCompIS4, preCompIS5, preCompIS6, preCompIS7, \
			IS0, IS1, IS2, IS3); \
}

// The pi-function
#define pi1(IS0, IS1, IS2, IS3, IS4, IS5, IS6, IS7, IS8, IS9, IS10, IS11, IS12, IS13, IS14, IS15, pom1, pom2, pom3, pom4) \
{ \
	/* 1st round */ \
	/* 1st chunk */ \
	nu64_opt(IS0, pom1, pom2, pom3, pom4, \
			 IS0, IS1, IS2, IS3); \
	sigma64(preCompConst0, preCompConst1, preCompConst2, preCompConst3, \
			IS0, IS1, IS2, IS3, \
			IS0, IS1, IS2, IS3); \
	/* 2nd chunk */ \
	mu64(IS0, IS1, IS2, IS3, \
		 preCompIS0, preCompIS1, preCompIS2, preCompIS3); \
	sigma64(preCompIS0, preCompIS1, preCompIS2, preCompIS3, \
			IS4, IS5, IS6, IS7, \
			IS4, IS5, IS6, IS7); \
	/* 3rd chunk */ \
	mu64(IS4, IS5, IS6, IS7, \
		 preCompIS4, preCompIS5, preCompIS6, preCompIS7); \
	sigma64(preCompIS4, preCompIS5, preCompIS6, preCompIS7, \
			IS8, IS9, IS10, IS11, \
			IS8, IS9, IS10, IS11); \
	/* 4th chunk */ \
	mu64(IS8, IS9, IS10, IS11, \
		 preCompIS8, preCompIS9, preCompIS10, preCompIS11); \
	sigma64(preCompIS8, preCompIS9, preCompIS10, preCompIS11, \
			IS12, IS13, IS14, IS15, \
			IS12, IS13, IS14, IS15); \
	/* 4th chunk */ \
	mu64(IS12, IS13, IS14, IS15, \
		 preCompIS12, preCompIS13, preCompIS14, preCompIS15); \
	sigma64(preCompIS12, preCompIS13, preCompIS14, preCompIS15, \
			preCompConst4, preCompConst5, preCompConst6, preCompConst7, \
			IS12, IS13, IS14, IS15); \
	/* 3rd chunk */ \
	nu64(IS12, IS13, IS14, IS15, \
		 preCompIS12, preCompIS13, preCompIS14, preCompIS15); \
	sigma64(preCompIS8, preCompIS9, preCompIS10, preCompIS11, \
			preCompIS12, preCompIS13, preCompIS14, preCompIS15, \
			IS8, IS9, IS10, IS11); \
	/* 2nd chunk */ \
	nu64(IS8, IS9, IS10, IS11, \
		 preCompIS8, preCompIS9, preCompIS10, preCompIS11); \
	sigma64(preCompIS4, preCompIS5, preCompIS6, preCompIS7, \
			preCompIS8, preCompIS9, preCompIS10, preCompIS11, \
			IS4, IS5, IS6, IS7); \
	/* 1st chunk */ \
	nu64(IS4, IS5, IS6, IS7, \
		 preCompIS4, preCompIS5, preCompIS6, preCompIS7); \
	sigma64(preCompIS0, preCompIS1, preCompIS2, preCompIS3, \
			preCompIS4, preCompIS5, preCompIS6, preCompIS7, \
			IS0, IS1, IS2, IS3); \
}

// Encryption and authentication procedure
int crypto_aead_encrypt(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
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
	// more 64-bit temp variables
	u_int64_t  pom1, pom2, pom3, pom4, nu1, nu2, nu3, nu4;
	// more 64-bit temp variables
	u_int64_t IS0, IS1, IS2, IS3, IS4, IS5, IS6, IS7, IS8, IS9, IS10, IS11, IS12, IS13, IS14, IS15;
	// more 64-bit temp variables
	u_int64_t preCompIS0, preCompIS1, preCompIS2, preCompIS3, preCompIS4, preCompIS5, preCompIS6, preCompIS7, preCompIS8, preCompIS9, preCompIS10, preCompIS11, preCompIS12, preCompIS13, preCompIS14, preCompIS15;
	// pointers to 64-bit variables
	u_int64_t  *c64, *m64, *ad64, *nsec64, *npub64, *k64;
	// counter ctr is a 64-bit variable in all variants of PiCipher
	u_int64_t  ctr = 0x0000000000000000ull;
	// an array for storing some temporal values for the Tag computation
	u_int64_t  tempTag[CRYPTO_ABYTES / W] = { 0 };
	// an array for the Common Internal State
	u_int64_t  CIS[IS_SIZE] = { 0 };
	u_int64_t  CIS1[IS_SIZE] = { 0 };
	// pointers that look at the used data arrays as arrays of bytes
	u_int8_t   *InternalState8, *CommonInternalState8, *tempTag8;
	// variables for dealing with various lengths of the plaintext and associated data
	int        LastMessageChunkLength, LastADChunkLength;
	// different iterator variables
	unsigned long long i, j, jj, ii, b, i1, j1, a, mblocks, b1, ii1, ii2;

	c64 = (u_int64_t *)c;
	m64 = (u_int64_t *)m;
	ad64 = (u_int64_t *)ad;
	nsec64 = (u_int64_t *)nsec;
	npub64 = (u_int64_t *)npub;
	k64 = (u_int64_t *)k;
	InternalState8 = (u_int8_t *)IS;
	CommonInternalState8 = (u_int8_t *)CIS;
	tempTag8 = (u_int8_t *)tempTag;

	// phase 1: Initialization
	/* for (i = 0; i < IS_SIZE; i++) {
	IS[i] = 0;
	} */
	IS[0] = 0;
	IS[1] = 0;
	IS[2] = 0;
	IS[3] = 0;
	IS[4] = 0;
	IS[5] = 0;
	IS[6] = 0;
	IS[7] = 0;
	IS[8] = 0;
	IS[9] = 0;
	IS[10] = 0;
	IS[11] = 0;
	IS[12] = 0;
	IS[13] = 0;
	IS[14] = 0;
	IS[15] = 0;

	// injection of the key
	/*for (i = 0; i < CRYPTO_KEYBYTES; i++) {
	InternalState8[i] = k[i];
	}*/
	IS[0] = k64[0];
	IS[1] = k64[1];
	IS[2] = k64[2];
	IS[3] = k64[3];

	// injection of the nonce (public message number - PMN)
	/*for (j = 0; j < CRYPTO_NPUBBYTES; j++) {
	InternalState8[i++] = npub[j];
	}*/
	IS[4] = npub64[0];
	IS[5] = npub64[1];
	// appending a single 1 to the concatenated value of the key and PMN
	InternalState8[48] = 0x01;

	// applying the permutation function pi
	pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);

	// initialization of the Common Internal State (CIS), common for all parallel invocations of pi() with different ctrs
	/* for (i = 0; i < IS_SIZE; i++) {
	CIS[i] = IS[i];
	} */
	CIS[0] = IS[0];
	CIS[1] = IS[1];
	CIS[2] = IS[2];
	CIS[3] = IS[3];
	CIS[4] = IS[4];
	CIS[5] = IS[5];
	CIS[6] = IS[6];
	CIS[7] = IS[7];
	CIS[8] = IS[8];
	CIS[9] = IS[9];
	CIS[10] = IS[10];
	CIS[11] = IS[11];
	CIS[12] = IS[12];
	CIS[13] = IS[13];
	CIS[14] = IS[14];
	CIS[15] = IS[15];

	// initialization of the ctr obtained from the first 64 bits of the capacity of CIS
	ctr = CIS[4];

	// phase 2: Processing the associated data
	nu64(CIS[4], CIS[5], CIS[6], CIS[7], CIS1[4], CIS1[5], CIS1[6], CIS1[7]);
	nu64(CIS[8], CIS[9], CIS[10], CIS[11], CIS1[8], CIS1[9], CIS1[10], CIS1[11]);
	nu64(CIS[12], CIS[13], CIS[14], CIS[15], CIS1[12], CIS1[13], CIS1[14], CIS1[15]);
	nu1 = 0x8D8B87787472716C + CIS[2] + CIS[3];
	nu2 = 0x6A696665635C5A59 + CIS[1] + CIS[2] + CIS[3];
	nu2 = rotl64((nu2), 23);
	nu3 = 0x5655534E4D4B473C + CIS[1] + CIS[2];
	nu4 = 0x3A393635332E2D2B + CIS[1] + CIS[3];
	b = 0;
	a = adlen / RATE;
	for (j = 0; j < a; j++) {
		// IS for the triplex component is initialized by the CIS for every AD block
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] =  CIS[0];
		IS[1] =  CIS[1];
		IS[2] =  CIS[2];
		IS[3] =  CIS[3];
		IS[4] =  CIS1[4];
		IS[5] =  CIS1[5];
		IS[6] =  CIS1[6];
		IS[7] =  CIS1[7];
		IS[8] =  CIS1[8];
		IS[9] =  CIS1[9];
		IS[10] = CIS1[10];
		IS[11] = CIS1[11];
		IS[12] = CIS1[12];
		IS[13] = CIS1[13];
		IS[14] = CIS1[14];
		IS[15] = CIS1[15];
		ctr++;
		// Inject ctr + j in IS
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// process the AD block
		// Inject the AD block
		/* for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		IS[ii1] = IS[ii1] ^ ad64[b];
		b++;
		ii1++;
		}
		} */
		IS[0] = IS[0] ^ ad64[b];
		b++;
		IS[1] = IS[1] ^ ad64[b];
		b++;
		IS[2] = IS[2] ^ ad64[b];
		b++;
		IS[3] = IS[3] ^ ad64[b];
		b++;
		IS[8] = IS[8] ^ ad64[b];
		b++;
		IS[9] = IS[9] ^ ad64[b];
		b++;
		IS[10] = IS[10] ^ ad64[b];
		b++;
		IS[11] = IS[11] ^ ad64[b];
		b++;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// Collect the tag for this block
		// Sum of the tags componentwise, where the length of one component is W
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}
	// if the last AD block is not the full block, we process it byte by byte
	LastADChunkLength = adlen % RATE;
	if (LastADChunkLength) {
		b = b * W;
		i1 = 0;
		IS[0] =  CIS[0];
		IS[1] =  CIS[1];
		IS[2] =  CIS[2];
		IS[3] =  CIS[3];
		IS[4] =  CIS1[4];
		IS[5] =  CIS1[5];
		IS[6] =  CIS1[6];
		IS[7] =  CIS1[7];
		IS[8] =  CIS1[8];
		IS[9] =  CIS1[9];
		IS[10] = CIS1[10];
		IS[11] = CIS1[11];
		IS[12] = CIS1[12];
		IS[13] = CIS1[13];
		IS[14] = CIS1[14];
		IS[15] = CIS1[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		for (i = 0; i < LastADChunkLength; i++) {
			InternalState8[i1] = InternalState8[i1] ^ ad[b];
			i1++;
			if (i1 % (RATE_OUT) == 0) i1 += RATE_OUT;
			b++;
		}
		// padding with 10*
		InternalState8[LastADChunkLength] = InternalState8[LastADChunkLength] ^ 0x01;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		//updating the tag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}

	// updating the Common Internal State by injection of the tag (tempTag) obtained from the associated data
	/* jj = 0;
	for (i = 0; i < N; i += 2) {
	ii1 = i * WORDS_CHUNK;
	ii2 = (i + 1) * WORDS_CHUNK;
	for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
	IS[ii1] = CIS[ii1] ^ tempTag[jj];
	IS[ii2] = CIS[ii2];
	jj++;
	ii1++;
	ii2++;
	}
	} */
	IS[0] = CIS[0] ^ tempTag[0];
	IS[1] = CIS[1] ^ tempTag[1];
	IS[2] = CIS[2] ^ tempTag[2];
	IS[3] = CIS[3] ^ tempTag[3];
	IS[4] = CIS[4];
	IS[5] = CIS[5];
	IS[6] = CIS[6];
	IS[7] = CIS[7];
	IS[8] = CIS[8] ^ tempTag[4];
	IS[9] = CIS[9] ^ tempTag[5];
	IS[10] = CIS[10] ^ tempTag[6];
	IS[11] = CIS[11] ^ tempTag[7];
	IS[12] = CIS[12];
	IS[13] = CIS[13];
	IS[14] = CIS[14];
	IS[15] = CIS[15];
	pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
	/* for (i = 0; i < IS_SIZE; i++) {
	CIS[i] = IS[i];
	} */
	CIS[0] = IS[0];
	CIS[1] = IS[1];
	CIS[2] = IS[2];
	CIS[3] = IS[3];
	CIS[4] = IS[4];
	CIS[5] = IS[5];
	CIS[6] = IS[6];
	CIS[7] = IS[7];
	CIS[8] = IS[8];
	CIS[9] = IS[9];
	CIS[10] = IS[10];
	CIS[11] = IS[11];
	CIS[12] = IS[12];
	CIS[13] = IS[13];
	CIS[14] = IS[14];
	CIS[15] = IS[15];

	// phase 3: Processing the secret messge number
	if (CRYPTO_NSECBYTES > 0) {
		nu64(CIS[4], CIS[5], CIS[6], CIS[7], CIS[4], CIS[5], CIS[6], CIS[7]);
		nu64(CIS[8], CIS[9], CIS[10], CIS[11], CIS[8], CIS[9], CIS[10], CIS[11]);
		nu64(CIS[12], CIS[13], CIS[14], CIS[15], CIS[12], CIS[13], CIS[14], CIS[15]);
		nu1 = 0x8D8B87787472716C + CIS[2] + CIS[3];
		nu2 = 0x6A696665635C5A59 + CIS[1] + CIS[2] + CIS[3];
		nu2 = rotl64((nu2), 23);
		nu3 = 0x5655534E4D4B473C + CIS[1] + CIS[2];
		nu4 = 0x3A393635332E2D2B + CIS[1] + CIS[3];
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] = CIS[0];
		IS[1] = CIS[1];
		IS[2] = CIS[2];
		IS[3] = CIS[3];
		IS[4] = CIS[4];
		IS[5] = CIS[5];
		IS[6] = CIS[6];
		IS[7] = CIS[7];
		IS[8] = CIS[8];
		IS[9] = CIS[9];
		IS[10] = CIS[10];
		IS[11] = CIS[11];
		IS[12] = CIS[12];
		IS[13] = CIS[13];
		IS[14] = CIS[14];
		IS[15] = CIS[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// encrypt the SMN
		// Inject the SMN
		b = 0;
		/* for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		c64[b] = IS[ii1] = IS[ii1] ^ nsec64[b];
		b++;
		ii1++;
		}
		} */
		c64[b] = IS[0] = IS[0] ^ nsec64[b];
		b++;
		c64[b] = IS[1] = IS[1] ^ nsec64[b];
		b++;
		c64[b] = IS[2] = IS[2] ^ nsec64[b];
		b++;
		c64[b] = IS[3] = IS[3] ^ nsec64[b];
		b++;
		c64[b] = IS[8] = IS[8] ^ nsec64[b];
		b++;
		c64[b] = IS[9] = IS[9] ^ nsec64[b];
		b++;
		c64[b] = IS[10] = IS[10] ^ nsec64[b];
		b++;
		c64[b] = IS[11] = IS[11] ^ nsec64[b];
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);

		// updating the Common Internal State from the encrypted SMN
		/* for (i = 0; i < IS_SIZE; i++) {
		CIS[i] = IS[i];
		} */
		CIS[0] = IS[0];
		CIS[1] = IS[1];
		CIS[2] = IS[2];
		CIS[3] = IS[3];
		CIS[4] = IS[4];
		CIS[5] = IS[5];
		CIS[6] = IS[6];
		CIS[7] = IS[7];
		CIS[8] = IS[8];
		CIS[9] = IS[9];
		CIS[10] = IS[10];
		CIS[11] = IS[11];
		CIS[12] = IS[12];
		CIS[13] = IS[13];
		CIS[14] = IS[14];
		CIS[15] = IS[15];
		// Collect the tag from this encryption and update the tempTag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}

	//phase 4: Processing the message
	nu64(CIS[4], CIS[5], CIS[6], CIS[7], CIS[4], CIS[5], CIS[6], CIS[7]);
	nu64(CIS[8], CIS[9], CIS[10], CIS[11], CIS[8], CIS[9], CIS[10], CIS[11]);
	nu64(CIS[12], CIS[13], CIS[14], CIS[15], CIS[12], CIS[13], CIS[14], CIS[15]);
	nu1 = 0x8D8B87787472716C + CIS[2] + CIS[3];
	nu2 = 0x6A696665635C5A59 + CIS[1] + CIS[2] + CIS[3];
	nu2 = rotl64((nu2), 23);
	nu3 = 0x5655534E4D4B473C + CIS[1] + CIS[2];
	nu4 = 0x3A393635332E2D2B + CIS[1] + CIS[3];
	mblocks = mlen / RATE;
	b = 0;
	b1 = bSMN;
	for (j = 0; j < mblocks; j++) {
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] = CIS[0];
		IS[1] = CIS[1];
		IS[2] = CIS[2];
		IS[3] = CIS[3];
		IS[4] = CIS[4];
		IS[5] = CIS[5];
		IS[6] = CIS[6];
		IS[7] = CIS[7];
		IS[8] = CIS[8];
		IS[9] = CIS[9];
		IS[10] = CIS[10];
		IS[11] = CIS[11];
		IS[12] = CIS[12];
		IS[13] = CIS[13];
		IS[14] = CIS[14];
		IS[15] = CIS[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// encrypt the message m
		// Inject a block of m
		/* for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		c64[b1] = IS[ii1] = IS[ii1] ^ m64[b];
		b++;
		b1++;
		ii1++;
		}
		} */
		c64[b1] = IS[0] = IS[0] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[1] = IS[1] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[2] = IS[2] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[3] = IS[3] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[8] = IS[8] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[9] = IS[9] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[10] = IS[10] ^ m64[b];
		b++;
		b1++;
		c64[b1] = IS[11] = IS[11] ^ m64[b];
		b++;
		b1++;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// Collect the tag from this encryption and update the tempTag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}
	// if the last message block is not the full block, we process it byte by byte
	LastMessageChunkLength = mlen % RATE;
	if (LastMessageChunkLength) {
		b = b * W;
		b1 = CRYPTO_NSECBYTES + b;
		i1 = 0;
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] = CIS[0];
		IS[1] = CIS[1];
		IS[2] = CIS[2];
		IS[3] = CIS[3];
		IS[4] = CIS[4];
		IS[5] = CIS[5];
		IS[6] = CIS[6];
		IS[7] = CIS[7];
		IS[8] = CIS[8];
		IS[9] = CIS[9];
		IS[10] = CIS[10];
		IS[11] = CIS[11];
		IS[12] = CIS[12];
		IS[13] = CIS[13];
		IS[14] = CIS[14];
		IS[15] = CIS[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		for (i = 0; i < LastMessageChunkLength; i++) {
			c[b1] = InternalState8[i1] = InternalState8[i1] ^ m[b];
			i1++;
			if (i1 % (RATE_OUT) == 0) i1 += RATE_OUT;
			b++;
			b1++;
		}
		// padding with 10*
		InternalState8[LastMessageChunkLength] = InternalState8[LastMessageChunkLength] ^ 0x01;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// updating the tag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}

	// concatenation of the tag T to the ciphertext c
	b = CRYPTO_NSECBYTES + mlen;
	for (jj = 0; jj < CRYPTO_ABYTES; jj++) {
		c[b] = tempTag8[jj];
		b++;
	}

	//updating the lenght of the ciphertext
	*clen = mlen + CRYPTO_ABYTES + CRYPTO_NSECBYTES;

	return 0;
}

// Decryption and Verification procedure
int crypto_aead_decrypt(
	unsigned char *m, unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c, unsigned long long clen,
	const unsigned char *ad, unsigned long long adlen,
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
	// more 64-bit temp variables
	u_int64_t  pom1, pom2, pom3, pom4, nu1, nu2, nu3, nu4;
	// more 64-bit temp variables
	u_int64_t IS0, IS1, IS2, IS3, IS4, IS5, IS6, IS7, IS8, IS9, IS10, IS11, IS12, IS13, IS14, IS15;
	// more 64-bit temp variables
	u_int64_t preCompIS0, preCompIS1, preCompIS2, preCompIS3, preCompIS4, preCompIS5, preCompIS6, preCompIS7, preCompIS8, preCompIS9, preCompIS10, preCompIS11, preCompIS12, preCompIS13, preCompIS14, preCompIS15;
	// pointers to 64-bit variables
	u_int64_t  *c64, *m64, *ad64, *nsec64, *npub64, *k64;
	// an array for storing some temporal values for the Tag computation
	u_int64_t  tempTag[CRYPTO_ABYTES / W] = { 0 };
	// counter ctr is a 64-bit variable in all variants of PiCipher
	u_int64_t  ctr = 0x0000000000000000ull;
	// an array for the Common Internal State
	u_int64_t  CIS[IS_SIZE] = { 0 };
	u_int64_t  CIS1[IS_SIZE] = { 0 };
	// pointers that look at the used data arrays as arrays of bytes
	u_int8_t   *InternalState8, *CommonInternalState8, *tempTag8;
	// variables for dealing with various lengths of the plaintext and associated data
	int LastMessageChunkLength, LastADChunkLength;
	// different iterator variables
	unsigned long long i, j, jj, ii, b, i1, j1, a, cblocks, ii1, ii2, b1;

	c64 = (u_int64_t *)c;
	m64 = (u_int64_t *)m;
	ad64 = (u_int64_t *)ad;
	nsec64 = (u_int64_t *)nsec;
	npub64 = (u_int64_t *)npub;
	k64 = (u_int64_t *)k;
	InternalState8 = (u_int8_t *)IS;
	CommonInternalState8 = (u_int8_t *)CIS;
	tempTag8 = (u_int8_t *)tempTag;

	// phase 1: Initialization
	/* for (i = 0; i < IS_SIZE; i++) {
	IS[i] = 0;
	} */
	IS[0] = 0;
	IS[1] = 0;
	IS[2] = 0;
	IS[3] = 0;
	IS[4] = 0;
	IS[5] = 0;
	IS[6] = 0;
	IS[7] = 0;
	IS[8] = 0;
	IS[9] = 0;
	IS[10] = 0;
	IS[11] = 0;
	IS[12] = 0;
	IS[13] = 0;
	IS[14] = 0;
	IS[15] = 0;

	// injection of the key
	/*for (i = 0; i < CRYPTO_KEYBYTES; i++) {
	InternalState8[i] = k[i];
	}*/
	IS[0] = k64[0];
	IS[1] = k64[1];
	IS[2] = k64[2];
	IS[3] = k64[3];

	// injection of the nonce (public message number - PMN)
	/*for (j = 0; j < CRYPTO_NPUBBYTES; j++) {
	InternalState8[i++] = npub[j];
	}*/
	IS[4] = npub64[0];
	IS[5] = npub64[1];
	// appending a single 1 to the concatenated value of the key and PMN
	InternalState8[48] = 0x01;

	// applying the permutation function pi
	pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);

	// initialization of the Common Internal State (CIS), common for all parallel invocations of pi() with different ctrs
	/* for (i = 0; i < IS_SIZE; i++) {
	CIS[i] = IS[i];
	} */
	CIS[0] = IS[0];
	CIS[1] = IS[1];
	CIS[2] = IS[2];
	CIS[3] = IS[3];
	CIS[4] = IS[4];
	CIS[5] = IS[5];
	CIS[6] = IS[6];
	CIS[7] = IS[7];
	CIS[8] = IS[8];
	CIS[9] = IS[9];
	CIS[10] = IS[10];
	CIS[11] = IS[11];
	CIS[12] = IS[12];
	CIS[13] = IS[13];
	CIS[14] = IS[14];
	CIS[15] = IS[15];

	// initialization of the ctr obtained from the first 64 bits of the capacity of CIS
	ctr = CIS[4];

	// phase 2: Processing the associated data
	nu64(CIS[4], CIS[5], CIS[6], CIS[7], CIS1[4], CIS1[5], CIS1[6], CIS1[7]);
	nu64(CIS[8], CIS[9], CIS[10], CIS[11], CIS1[8], CIS1[9], CIS1[10], CIS1[11]);
	nu64(CIS[12], CIS[13], CIS[14], CIS[15], CIS1[12], CIS1[13], CIS1[14], CIS1[15]);
	nu1 = 0x8D8B87787472716C + CIS[2] + CIS[3];
	nu2 = 0x6A696665635C5A59 + CIS[1] + CIS[2] + CIS[3];
	nu2 = rotl64((nu2), 23);
	nu3 = 0x5655534E4D4B473C + CIS[1] + CIS[2];
	nu4 = 0x3A393635332E2D2B + CIS[1] + CIS[3];
	b = 0;
	a = adlen / RATE;
	for (j = 0; j < a; j++) {
		// IS for the triplex component is initialized by the CIS for every AD block
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] =  CIS[0];
		IS[1] =  CIS[1];
		IS[2] =  CIS[2];
		IS[3] =  CIS[3];
		IS[4] =  CIS1[4];
		IS[5] =  CIS1[5];
		IS[6] =  CIS1[6];
		IS[7] =  CIS1[7];
		IS[8] =  CIS1[8];
		IS[9] =  CIS1[9];
		IS[10] = CIS1[10];
		IS[11] = CIS1[11];
		IS[12] = CIS1[12];
		IS[13] = CIS1[13];
		IS[14] = CIS1[14];
		IS[15] = CIS1[15];
		ctr++;
		// Inject ctr + j in IS
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// process the AD block
		// Inject the AD block
		/* for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		IS[ii1] = IS[ii1] ^ ad64[b];
		b++;
		ii1++;
		}
		} */
		IS[0] = IS[0] ^ ad64[b];
		b++;
		IS[1] = IS[1] ^ ad64[b];
		b++;
		IS[2] = IS[2] ^ ad64[b];
		b++;
		IS[3] = IS[3] ^ ad64[b];
		b++;
		IS[8] = IS[8] ^ ad64[b];
		b++;
		IS[9] = IS[9] ^ ad64[b];
		b++;
		IS[10] = IS[10] ^ ad64[b];
		b++;
		IS[11] = IS[11] ^ ad64[b];
		b++;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// Collect the tag for this block
		// Sum of the tags componentwise, where the length of one component is W
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}
	// if the last AD block is not the full block, we process it byte by byte
	LastADChunkLength = adlen % RATE;
	if (LastADChunkLength) {
		b = b * W;
		i1 = 0;
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] =  CIS[0];
		IS[1] =  CIS[1];
		IS[2] =  CIS[2];
		IS[3] =  CIS[3];
		IS[4] =  CIS1[4];
		IS[5] =  CIS1[5];
		IS[6] =  CIS1[6];
		IS[7] =  CIS1[7];
		IS[8] =  CIS1[8];
		IS[9] =  CIS1[9];
		IS[10] = CIS1[10];
		IS[11] = CIS1[11];
		IS[12] = CIS1[12];
		IS[13] = CIS1[13];
		IS[14] = CIS1[14];
		IS[15] = CIS1[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		for (i = 0; i < LastADChunkLength; i++) {
			InternalState8[i1] = InternalState8[i1] ^ ad[b];
			i1++;
			if (i1 % (RATE_OUT) == 0) i1 += RATE_OUT;
			b++;
		}
		// padding with 10*
		InternalState8[LastADChunkLength] = InternalState8[LastADChunkLength] ^ 0x01;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		//updating the tag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}

	// updating the Common Internal State by injection of the tag (tempTag) obtained from the associated data
	/* jj = 0;
	for (i = 0; i < N; i += 2) {
	ii1 = i * WORDS_CHUNK;
	ii2 = (i + 1) * WORDS_CHUNK;
	for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
	IS[ii1] = CIS[ii1] ^ tempTag[jj];
	IS[ii2] = CIS[ii2];
	jj++;
	ii1++;
	ii2++;
	}
	} */
	IS[0] = CIS[0] ^ tempTag[0];
	IS[1] = CIS[1] ^ tempTag[1];
	IS[2] = CIS[2] ^ tempTag[2];
	IS[3] = CIS[3] ^ tempTag[3];
	IS[4] = CIS[4];
	IS[5] = CIS[5];
	IS[6] = CIS[6];
	IS[7] = CIS[7];
	IS[8] = CIS[8] ^ tempTag[4];
	IS[9] = CIS[9] ^ tempTag[5];
	IS[10] = CIS[10] ^ tempTag[6];
	IS[11] = CIS[11] ^ tempTag[7];
	IS[12] = CIS[12];
	IS[13] = CIS[13];
	IS[14] = CIS[14];
	IS[15] = CIS[15];
	pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
	/* for (i = 0; i < IS_SIZE; i++) {
	CIS[i] = IS[i];
	} */
	CIS[0] = IS[0];
	CIS[1] = IS[1];
	CIS[2] = IS[2];
	CIS[3] = IS[3];
	CIS[4] = IS[4];
	CIS[5] = IS[5];
	CIS[6] = IS[6];
	CIS[7] = IS[7];
	CIS[8] = IS[8];
	CIS[9] = IS[9];
	CIS[10] = IS[10];
	CIS[11] = IS[11];
	CIS[12] = IS[12];
	CIS[13] = IS[13];
	CIS[14] = IS[14];
	CIS[15] = IS[15];

	// phase 3: Processing the secret messge number
	if (CRYPTO_NSECBYTES > 0) {
		nu64(CIS[4], CIS[5], CIS[6], CIS[7], CIS[4], CIS[5], CIS[6], CIS[7]);
		nu64(CIS[8], CIS[9], CIS[10], CIS[11], CIS[8], CIS[9], CIS[10], CIS[11]);
		nu64(CIS[12], CIS[13], CIS[14], CIS[15], CIS[12], CIS[13], CIS[14], CIS[15]);
		nu1 = 0x8D8B87787472716C + CIS[2] + CIS[3];
		nu2 = 0x6A696665635C5A59 + CIS[1] + CIS[2] + CIS[3];
		nu2 = rotl64((nu2), 23);
		nu3 = 0x5655534E4D4B473C + CIS[1] + CIS[2];
		nu4 = 0x3A393635332E2D2B + CIS[1] + CIS[3];
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] = CIS[0];
		IS[1] = CIS[1];
		IS[2] = CIS[2];
		IS[3] = CIS[3];
		IS[4] = CIS[4];
		IS[5] = CIS[5];
		IS[6] = CIS[6];
		IS[7] = CIS[7];
		IS[8] = CIS[8];
		IS[9] = CIS[9];
		IS[10] = CIS[10];
		IS[11] = CIS[11];
		IS[12] = CIS[12];
		IS[13] = CIS[13];
		IS[14] = CIS[14];
		IS[15] = CIS[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// decrypt the SMN
		// Inject the SMN
		b = 0;
		/* for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		nsec64[b] = IS[ii1] ^ c64[b];
		IS[ii1] = c64[b];
		b++;
		ii1++;
		}
		} */
		nsec64[b] = IS[0] ^ c64[b];
		IS[0] = c64[b];
		b++;
		nsec64[b] = IS[1] ^ c64[b];
		IS[1] = c64[b];
		b++;
		nsec64[b] = IS[2] ^ c64[b];
		IS[2] = c64[b];
		b++;
		nsec64[b] = IS[3] ^ c64[b];
		IS[3] = c64[b];
		b++;
		nsec64[b] = IS[8] ^ c64[b];
		IS[8] = c64[b];
		b++;
		nsec64[b] = IS[9] ^ c64[b];
		IS[9] = c64[b];
		b++;
		nsec64[b] = IS[10] ^ c64[b];
		IS[10] = c64[b];
		b++;
		nsec64[b] = IS[11] ^ c64[b];
		IS[11] = c64[b];
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);

		// updating the Common Internal State after decrypting the SMN
		/* for (i = 0; i < IS_SIZE; i++) {
		CIS[i] = IS[i];
		} */
		CIS[0] = IS[0];
		CIS[1] = IS[1];
		CIS[2] = IS[2];
		CIS[3] = IS[3];
		CIS[4] = IS[4];
		CIS[5] = IS[5];
		CIS[6] = IS[6];
		CIS[7] = IS[7];
		CIS[8] = IS[8];
		CIS[9] = IS[9];
		CIS[10] = IS[10];
		CIS[11] = IS[11];
		CIS[12] = IS[12];
		CIS[13] = IS[13];
		CIS[14] = IS[14];
		CIS[15] = IS[15];
		// Collect the tag from this encryption and update the tempTag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}

	//phase 4: Processing the ciphertext
	nu64(CIS[4], CIS[5], CIS[6], CIS[7], CIS[4], CIS[5], CIS[6], CIS[7]);
	nu64(CIS[8], CIS[9], CIS[10], CIS[11], CIS[8], CIS[9], CIS[10], CIS[11]);
	nu64(CIS[12], CIS[13], CIS[14], CIS[15], CIS[12], CIS[13], CIS[14], CIS[15]);
	nu1 = 0x8D8B87787472716C + CIS[2] + CIS[3];
	nu2 = 0x6A696665635C5A59 + CIS[1] + CIS[2] + CIS[3];
	nu2 = rotl64((nu2), 23);
	nu3 = 0x5655534E4D4B473C + CIS[1] + CIS[2];
	nu4 = 0x3A393635332E2D2B + CIS[1] + CIS[3];
	cblocks = (clen - CRYPTO_ABYTES - CRYPTO_NSECBYTES) / RATE;
	b = 0;
	b1 = bSMN;
	for (j = 0; j < cblocks; j++) {
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] = CIS[0];
		IS[1] = CIS[1];
		IS[2] = CIS[2];
		IS[3] = CIS[3];
		IS[4] = CIS[4];
		IS[5] = CIS[5];
		IS[6] = CIS[6];
		IS[7] = CIS[7];
		IS[8] = CIS[8];
		IS[9] = CIS[9];
		IS[10] = CIS[10];
		IS[11] = CIS[11];
		IS[12] = CIS[12];
		IS[13] = CIS[13];
		IS[14] = CIS[14];
		IS[15] = CIS[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// decrypt the ciphertext c
		/* for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		// XOR the IS_bitrate (InternalState[0], InternalSate[2], ...) with the c to obtain m
		m64[b] = IS[ii1] ^ c64[b1];
		// in order to proceed for tag computation, put the ciphertext data in the InternalState
		IS[ii1] = c64[b1];
		b++;
		b1++;
		ii1++;
		}
		} */
		m64[b] = IS[0] ^ c64[b1];
		IS[0] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[1] ^ c64[b1];
		IS[1] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[2] ^ c64[b1];
		IS[2] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[3] ^ c64[b1];
		IS[3] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[8] ^ c64[b1];
		IS[8] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[9] ^ c64[b1];
		IS[9] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[10] ^ c64[b1];
		IS[10] = c64[b1];
		b++;
		b1++;
		m64[b] = IS[11] ^ c64[b1];
		IS[11] = c64[b1];
		b++;
		b1++;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// Collect the tag from this decryption and update the tempTag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}
	// if the last ciphertext block is not the full block, we process it byte by byte
	LastMessageChunkLength = (clen - CRYPTO_ABYTES - CRYPTO_NSECBYTES) % RATE;
	if (LastMessageChunkLength) {
		b = b * W;
		b1 = CRYPTO_NSECBYTES + b;
		i1 = 0;
		/* for (i = 0; i < IS_SIZE; i++) {
		IS[i] = CIS[i];
		} */
		IS[0] = CIS[0];
		IS[1] = CIS[1];
		IS[2] = CIS[2];
		IS[3] = CIS[3];
		IS[4] = CIS[4];
		IS[5] = CIS[5];
		IS[6] = CIS[6];
		IS[7] = CIS[7];
		IS[8] = CIS[8];
		IS[9] = CIS[9];
		IS[10] = CIS[10];
		IS[11] = CIS[11];
		IS[12] = CIS[12];
		IS[13] = CIS[13];
		IS[14] = CIS[14];
		IS[15] = CIS[15];
		ctr++;
		IS[0] = IS[0] ^ ctr;
		pi1(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15], nu1, nu2, nu3, nu4);
		//pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		for (i = 0; i < LastMessageChunkLength; i++) {
			m[b] = InternalState8[i1] ^ c[b1];
			InternalState8[i1] = c[b1];
			i1++;
			if (i1 % (RATE_OUT) == 0) i1 += RATE_OUT;
			b++;
			b1++;
		}
		// padding with 10*
		InternalState8[LastMessageChunkLength] = InternalState8[LastMessageChunkLength] ^ 0x01;
		pi(IS[0], IS[1], IS[2], IS[3], IS[4], IS[5], IS[6], IS[7], IS[8], IS[9], IS[10], IS[11], IS[12], IS[13], IS[14], IS[15]);
		// updating the tag
		/* jj = 0;
		for (i = 0; i < N; i += 2) {
		ii1 = i * WORDS_CHUNK;
		for (i1 = 0; i1 < WORDS_CHUNK; i1++) {
		tempTag[jj] = tempTag[jj] + IS[ii1];
		jj++;
		ii1++;
		}
		} */
		tempTag[0] = tempTag[0] + IS[0];
		tempTag[1] = tempTag[1] + IS[1];
		tempTag[2] = tempTag[2] + IS[2];
		tempTag[3] = tempTag[3] + IS[3];
		tempTag[4] = tempTag[4] + IS[8];
		tempTag[5] = tempTag[5] + IS[9];
		tempTag[6] = tempTag[6] + IS[10];
		tempTag[7] = tempTag[7] + IS[11];
	}

	//updating the lenght of the message
	*mlen = clen - CRYPTO_ABYTES - CRYPTO_NSECBYTES;

	// tag verification
	b = (*mlen + CRYPTO_NSECBYTES);
	for (ii = b; ii < clen; ii++) {
		if (c[ii] != tempTag8[ii - b])
			return -1;
	}

	return 0;
}
