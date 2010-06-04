/* Blue Midnight Wish hash function as it will be submitted to 
   NIST for the second round of SHA-3 competition.
   Changes in this version (compared to the version submitted for the Round 1):

   1. Corrected IV for 224 and 384 version.

   2. Tweaked f0() and f1()

   3. Use of final compression function invocation.

*/													

/* 
   This is an optimized C/asm version for Blue Midnight Wish hash function.

   Supercop version programmed by Rune E. Jensen, May 2010.
*/

#include <string.h> 
#include "crypto_hash.h"
#include "BlueMidnightWish.h"

// SSSE3 version test
#ifndef __SSSE3__
#error "This version need SSSE3"
#endif

#ifdef __SSE__
#include <xmmintrin.h>
#endif
#define crypto_hash_BYTES 32

extern Compress256(u_int32_t *data32, u_int32_t *data32_end, hashState *state);
//extern void FinalCompress256(hashState *state);

/* BlueMidnightWish256 initial double chaining pipe */
#if defined ( _MSC_VER )
const static u_int32_t __declspec(align(16)) i256p2[16] = 
#else
const static u_int32_t __attribute__ ((aligned (16))) i256p2[16] =
#endif
{   0x40414243ul, 0x44454647ul, 0x48494a4bul, 0x4c4d4e4ful,
    0x50515253ul, 0x54555657ul, 0x58595a5bul, 0x5c5d5e5ful,
    0x60616263ul, 0x64656667ul, 0x68696a6bul, 0x6c6d6e6ful,
    0x70717273ul, 0x74757677ul, 0x78797a7bul, 0x7c7d7e7ful,
};

#define hashState256(x)  ((x)->pipe->p256)
#define hashState256_(x)  ((x).pipe[0].p256[0])

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	return crypto_hash(hashval, data, databitlen >> 3);
}

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
	hashState state;
	u_int32_t *data32, *data32_end;
	u_int64_t *data64;
	unsigned char *lastPartP, *data8_end;

	#ifdef __x86_64__
	u_int64_t i, iterations, counter, databyteLength;
	#else
	int i, iterations, counter, databyteLength;
	#endif
	// This might be a static check
	if (crypto_hash_BYTES != 32)
		return -1;
	
	databyteLength = inlen; // Want it to be the native data size, and not bigger.

	#ifdef __SSE__
	// Use SSE here, if it is available
	_mm_store_si128((__m128i *) &hashState256_(state).DoublePipe[0], _mm_load_si128((__m128i *) &i256p2[0]));
	_mm_store_si128((__m128i *) &hashState256_(state).DoublePipe[4], _mm_load_si128((__m128i *) &i256p2[4]));
	_mm_store_si128((__m128i *) &hashState256_(state).DoublePipe[8], _mm_load_si128((__m128i *) &i256p2[8]));
	_mm_store_si128((__m128i *) &hashState256_(state).DoublePipe[12], _mm_load_si128((__m128i *) &i256p2[12]));
	#elif defined ( __x86_64__ )
	// Or 64-bit writes if on 64 bit system (not really possible on x86)
	hashState256_(state).DoublePipe[0] = i256p2[0];
	hashState256_(state).DoublePipe[2] = i256p2[2];
	hashState256_(state).DoublePipe[4] = i256p2[4];
	hashState256_(state).DoublePipe[6] = i256p2[6];
	hashState256_(state).DoublePipe[8] = i256p2[8];
	hashState256_(state).DoublePipe[10] = i256p2[10];
	hashState256_(state).DoublePipe[12] = i256p2[12];
	hashState256_(state).DoublePipe[14] = i256p2[14];
	#else
	// Fallback
	memcpy(hashState256_(state).DoublePipe, i256p2,  16 * sizeof(u_int32_t));
	#endif
	
	data32 = (u_int32_t *) in;
	iterations = databyteLength / BlueMidnightWish256_BLOCK_SIZE;
	data32_end = data32 + iterations*16;
	if(iterations > 0)
		Compress256(data32, data32_end, &state);
	
	databyteLength -= BlueMidnightWish256_BLOCK_SIZE * iterations;
	data64 = (u_int64_t *)hashState256_(state).LastPart;
	
	if (databyteLength < 56) {
		#ifdef __SSE__
		// Use SSE here, if it is available
		__m128i zero = _mm_setzero_si128();
		_mm_store_si128((__m128i *) &data64[0], zero);
		_mm_store_si128((__m128i *) &data64[2], zero);
		_mm_store_si128((__m128i *) &data64[4], zero);
		_mm_store_si128((__m128i *) &data64[6], zero);
		#elif defined ( __x86_64__ )
		// Or 64-bit writes if on 64 bit system (not really possible on x86)
		data64[0] = 0;
		data64[1] = 0;
		data64[2] = 0;
		data64[3] = 0;
		data64[4] = 0;
		data64[5] = 0;
		data64[6] = 0;
		data64[7] = 0;
		#else
		// Fallback
		memset( data64 + (databyteLength >> 4), 0x00, BlueMidnightWish256_BLOCK_SIZE - ((databyteLength >> 4) << 3));
		#endif
		
		
	}
	else {
		#ifdef __SSE__
		// Use SSE here, if it is available
		__m128i zero = _mm_setzero_si128();
		_mm_store_si128((__m128i *) &data64[6], zero);
		_mm_store_si128((__m128i *) &data64[8], zero);
		_mm_store_si128((__m128i *) &data64[10], zero);
		_mm_store_si128((__m128i *) &data64[12], zero);
		_mm_store_si128((__m128i *) &data64[14], zero);
		#elif defined ( __x86_64__ )
		// Or 64-bit writes if on 64 bit system (not really possible on x86)
		data64[6] = 0;
		data64[7] = 0;
		data64[8] = 0;
		data64[9] = 0;
		data64[10] = 0;
		data64[11] = 0;
		data64[12] = 0;
		data64[13] = 0;
		data64[14] = 0;
		data64[15] = 0;
		#else
		// Fallback
		memset( data64 + (databyteLength >> 4) , 0x00, BlueMidnightWish256_BLOCK_SIZE * 2 - ((databyteLength >> 4) << 3));
		#endif
	}

	if (databyteLength > 0)
	{
		// Byte correct:
		counter = databyteLength;
		#ifdef __SSE__
		i = 0;
		lastPartP = (unsigned char *) hashState256_(state).LastPart;
		data8_end = (unsigned char *) data32_end;
		
		while(counter & 0xff0){
			// Move 16 bytes at a time
			_mm_store_si128((__m128i *) &lastPartP[i], _mm_load_si128((__m128i *) &data8_end[i]));
			counter -= 16;
			i += 16;
		}
		if(counter & 0x8){
			// Move 8 byte at a time (1 times or less)
			((u_int64_t *) &lastPartP[i])[0] = ((u_int64_t *) &data8_end[i])[0];
			counter -= 8;
			i += 8;
		}/*
		if(counter & 0x4){
			// Move 4 byte at a time (1 times or less)
			((u_int32_t *) &lastPartP[i])[0] = ((u_int32_t *) &data8_end[i])[0];
			//counter -= 4;
			i += 4;
		}
		if(counter & 0x2){
			// Move 2 byte at a time (1 times or less)
			((unsigned short *) &lastPartP[i])[0] = ((unsigned short *) &data8_end[i])[0];
			//counter -= 2;
			i += 2;
		}
		if(counter & 0x1){
			// Move 1 byte at a time (15 times or less)
			lastPartP[i] = data8_end[i];
			//counter -= 1;
			i += 1;
		}*/
		while(counter){
			// Move 1 byte at a time (15 times or less)
			lastPartP[i] = data8_end[i];
			counter -= 1;
			i += 1;
		}
		#else
		// Fallback
		memcpy(hashState256_(state).LastPart, data32_end, databyteLength );
		#endif
	}
	// Byte correct pad
	hashState256_(state).LastPart[databyteLength] = 128;
	
	data32   = (u_int32_t *)hashState256_(state).LastPart;
	if (databyteLength < 56)
	{
		data64[7] = inlen << 3;
		Compress256(data32, data32 + 16, &state);
	}
	else
	{
		data64[15] = inlen << 3;
		Compress256(data32, data32 + 32, &state);
	}

	//FinalCompress256(&state);
	u_int32_t __attribute__ ((aligned (16))) CONST32final[16] =
	{
		0xaaaaaaa0ul,  0xaaaaaaa1ul,  0xaaaaaaa2ul, 0xaaaaaaa3ul,
		0xaaaaaaa4ul,  0xaaaaaaa5ul,  0xaaaaaaa6ul, 0xaaaaaaa7ul,
		0xaaaaaaa8ul,  0xaaaaaaa9ul,  0xaaaaaaaaul, 0xaaaaaaabul,
		0xaaaaaaacul,  0xaaaaaaadul,  0xaaaaaaaeul, 0xaaaaaaaful
	};
	
	
	data32   = (u_int32_t *)hashState256_(state).DoublePipe;
	Compress256(data32, data32 +16, CONST32final-4); // TODO: This is a HACK...
	//FinalCompress256(&state);
	
	#ifdef __SSE__
	// Use SSE here, if it is available
	// TODO: Need to check if out (hashval) is aligned
	_mm_store_si128((__m128i *) &out[0], _mm_load_si128((__m128i *) &CONST32final[8]));
	_mm_store_si128((__m128i *) &out[16], _mm_load_si128((__m128i *) &CONST32final[12]));
	#else
	// Fallback
	memcpy(out, &CONST32final[8], BlueMidnightWish256_DIGEST_SIZE );
	#endif
	
	return 0;
	//return -1;
}
