/* Blue Midnight Wish hash function as it will be submitted to 
   NIST for the second round of SHA-3 competition.
   Changes in this version (compared to the version submitted for the Round 1):

   1. Corrected IV for 224 and 384 version.

   2. Tweaked f0() and f1()

   3. Use of final compression function invocation.

*/													

/* 
   This is an optimized C/asm version for Blue Midnight Wish hash function.

   Supercop version programmed by Rune E. Jensen, Aug 2010.
*/

#include <string.h> 
#include "crypto_hash.h"
#include "BlueMidnightWish.h"

#ifdef __SSE__
#include <xmmintrin.h>
#endif

#ifndef crypto_hash_BYTES
#define crypto_hash_BYTES 64
#endif

extern void Compress512(u_int64_t *data64, u_int64_t *data64_end, hashState *state);

/* BlueMidnightWish512 initial double chaining pipe */
#if defined ( _MSC_VER )
const static u_int64_t __declspec(align(16)) i512p2[16] = 
#else
const static u_int64_t __attribute__ ((aligned (16))) i512p2[16] =
#endif
{
    0x8081828384858687ull, 0x88898a8b8c8d8e8full,
    0x9091929394959697ull, 0x98999a9b9c9d9e9full,
    0xa0a1a2a3a4a5a6a7ull, 0xa8a9aaabacadaeafull,
    0xb0b1b2b3b4b5b6b7ull, 0xb8b9babbbcbdbebfull,
    0xc0c1c2c3c4c5c6c7ull, 0xc8c9cacbcccdcecfull,
    0xd0d1d2d3d4d5d6d7ull, 0xd8d9dadbdcdddedfull,
    0xe0e1e2e3e4e5e6e7ull, 0xe8e9eaebecedeeefull,
    0xf0f1f2f3f4f5f6f7ull, 0xf8f9fafbfcfdfeffull
};

#define hashState512(x)  ((x)->pipe->p512)
#define hashState512_(x)  ((x).pipe[0].p512[0])

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
	hashState state;
	u_int64_t *data64, *data64_end;
	int LastByte, LastBytes, PadOnePosition;
	
	#ifdef __x86_64__
	u_int64_t iterations, databyteLength;
	#else
	int iterations, databyteLength;
	#endif
	// This might be a static check
	if (crypto_hash_BYTES != 64)
		return -1;
	
	databyteLength = inlen; // Want it to be the native data size, and not bigger.

	//if(hashbitlen != 512)
	//	return(BAD_HASHLEN);
	
	#ifdef __SSE__
	// Use SSE here, if it is available
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[0], _mm_load_si128((__m128i *) &i512p2[0]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[2], _mm_load_si128((__m128i *) &i512p2[2]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[4], _mm_load_si128((__m128i *) &i512p2[4]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[6], _mm_load_si128((__m128i *) &i512p2[6]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[8], _mm_load_si128((__m128i *) &i512p2[8]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[10], _mm_load_si128((__m128i *) &i512p2[10]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[12], _mm_load_si128((__m128i *) &i512p2[12]));
	_mm_store_si128((__m128i *) &hashState512_(state).DoublePipe[14], _mm_load_si128((__m128i *) &i512p2[14]));
	#else
	// Fallback
	memcpy(hashState512_(state).DoublePipe, i512p2,  16 * sizeof(u_int64_t));
	#endif
	
	data64 = (u_int64_t *) in;
	iterations = databyteLength / BlueMidnightWish512_BLOCK_SIZE ;
	data64_end = data64 + iterations*16;
	if(iterations > 0)
		Compress512(data64, data64_end, &state);
		
	databyteLength -= BlueMidnightWish512_BLOCK_SIZE * iterations;
	data64 = (u_int64_t *)hashState512_(state).LastPart;
	
	//memset( data64, 0xff, BlueMidnightWish512_BLOCK_SIZE *2); // Debug test
	
	if (databyteLength < 120) {
		#ifdef __SSE__
		// Use SSE here, if it is available
		__m128i zero = _mm_setzero_si128();
		_mm_store_si128((__m128i *) &data64[0], zero);
		_mm_store_si128((__m128i *) &data64[2], zero);
		_mm_store_si128((__m128i *) &data64[4], zero);
		_mm_store_si128((__m128i *) &data64[6], zero);
		_mm_store_si128((__m128i *) &data64[8], zero);
		_mm_store_si128((__m128i *) &data64[10], zero);
		_mm_store_si128((__m128i *) &data64[12], zero);
		_mm_store_si128((__m128i *) &data64[14], zero);
		#else
		// Fallback
		memset( data64 + (databyteLength >> 4), 0x00, BlueMidnightWish512_BLOCK_SIZE - ((databyteLength >> 4) << 3));
		#endif
		
		
	}
	else {
		#ifdef __SSE__
		// Use SSE here, if it is available
		__m128i zero = _mm_setzero_si128();
		_mm_store_si128((__m128i *) &data64[14], zero);
		_mm_store_si128((__m128i *) &data64[16], zero);
		_mm_store_si128((__m128i *) &data64[18], zero);
		_mm_store_si128((__m128i *) &data64[20], zero);
		_mm_store_si128((__m128i *) &data64[22], zero);
		_mm_store_si128((__m128i *) &data64[24], zero);
		_mm_store_si128((__m128i *) &data64[26], zero);
		_mm_store_si128((__m128i *) &data64[28], zero);
		_mm_store_si128((__m128i *) &data64[30], zero);
		#else
		// Fallback
		memset( data64 + (databyteLength >> 4) , 0x00, BlueMidnightWish512_BLOCK_SIZE * 2 - ((databyteLength >> 4) << 3));
		#endif
	}

	if (databyteLength > 0)
	{
		
		#ifdef __SSE__
		unsigned char *lastPartP = (unsigned char *) hashState512_(state).LastPart;
		unsigned char *data8_end = (unsigned char *) data64_end;
		int counter = databyteLength;
		int i = 0;
		// Byte correct:
		
		
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
		}
		while(counter){
			// Move 1 byte at a time (7 times or less)
			lastPartP[i] = data8_end[i];
			counter -= 1;
			i += 1;
		}
		#else
		// Fallback
		memcpy(hashState512_(state).LastPart, data64_end, databyteLength );
		#endif
	}

	// Byte correct pad
	hashState512_(state).LastPart[databyteLength] = 128;

	if (databyteLength < 120)
	{
		data64[15] = inlen << 3;
		Compress512(data64, data64 + 16, &state);
	}
	else
	{
		data64[31] = inlen << 3;
		Compress512(data64, data64 + 32, &state);
	}
	#if defined ( _MSC_VER )
	u_int64_t __declspec(align(16)) CONST64final[16] = 
	#else
	u_int64_t __attribute__ ((aligned (16))) CONST64final[16] =
	#endif
	{
		0xaaaaaaaaaaaaaaa0ull,0xaaaaaaaaaaaaaaa1ull,
		0xaaaaaaaaaaaaaaa2ull,0xaaaaaaaaaaaaaaa3ull,
		0xaaaaaaaaaaaaaaa4ull,0xaaaaaaaaaaaaaaa5ull,
		0xaaaaaaaaaaaaaaa6ull,0xaaaaaaaaaaaaaaa7ull,
		0xaaaaaaaaaaaaaaa8ull,0xaaaaaaaaaaaaaaa9ull,
		0xaaaaaaaaaaaaaaaaull,0xaaaaaaaaaaaaaaabull,
		0xaaaaaaaaaaaaaaacull,0xaaaaaaaaaaaaaaadull,
		0xaaaaaaaaaaaaaaaeull,0xaaaaaaaaaaaaaaafull
	};
	
	data64   = (u_int64_t *)hashState512_(state).DoublePipe;
	Compress512(data64, data64 +16, (hashState *) (CONST64final-2)); // TODO: This is a HACK...
	
	#ifdef __SSE__
	// Use SSE here, if it is available
	// TODO: Need to check if out (hashval) is aligned
	_mm_store_si128((__m128i *) &out[0], _mm_load_si128((__m128i *) &CONST64final[8]));
	_mm_store_si128((__m128i *) &out[16], _mm_load_si128((__m128i *) &CONST64final[10]));
	_mm_store_si128((__m128i *) &out[32], _mm_load_si128((__m128i *) &CONST64final[12]));
	_mm_store_si128((__m128i *) &out[48], _mm_load_si128((__m128i *) &CONST64final[14]));
	#else
	// Fallback
	memcpy(out, &CONST64final[8], BlueMidnightWish512_DIGEST_SIZE );
	#endif
	return(SUCCESS);
}

// Unused support function
HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	return crypto_hash(hashval, data, databitlen >> 3);
}

