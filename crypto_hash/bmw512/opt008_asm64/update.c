/* Blue Midnight Wish hash function as it will be submitted to 
   NIST for the second round of SHA-3 competition.
   Changes in this version (compared to the version submitted for the Round 1):

   1. Corrected IV for 224 and 384 version.

   2. Tweaked f0() and f1()

   3. Use of final compression function invocation.

*/													

/* 
   This is an optimized C code for Blue Midnight Wish hash function 
   as it will be submitted to NIST for the second round of SHA-3 competition.

   Programmed by Rune E. Jensen, July 2010.
*/

#include <stdio.h>
#include <string.h> 
#include "BlueMidnightWish.h"

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

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	hashState state;
	u_int64_t *data64, *data64_end, iterations;
	int LastByte, LastBytes, PadOnePosition;

	//if(hashbitlen != 512)
	//	return(BAD_HASHLEN);	
	
	//state.hashbitlen = 512;
	state.bits_processed = 0;
	state.unprocessed_bits = 0;
	
	memcpy(hashState512_(state).DoublePipe, i512p2,  16 * sizeof(u_int64_t));
	
	data64 = (u_int64_t *)data;
	
	iterations = databitlen / (BlueMidnightWish512_BLOCK_SIZE * 8);
	data64_end = data64 + iterations*16;
	if(iterations > 0)
		Compress512(data64, data64_end, &state);
		
	databitlen -= (BlueMidnightWish512_BLOCK_SIZE * 8) * iterations;
	state.bits_processed += (BlueMidnightWish512_BLOCK_SIZE * 8) *  iterations;
	//state->unprocessed_bits = (int)databitlen;
	
	state.unprocessed_bits = (int)databitlen;

	if (databitlen > 0)
	{
		LastBytes = ((~(((- (int)databitlen)>>3) & 0x03ff)) + 1) & 0x03ff; // LastBytes = Ceil(databitlen / 8)
		memcpy(hashState512_(state).LastPart, data64_end, LastBytes );
	}


	LastByte = (int)state.unprocessed_bits >> 3;
	PadOnePosition = 7 - (state.unprocessed_bits & 0x07);
	hashState512_(state).LastPart[LastByte] = hashState512_(state).LastPart[LastByte] & (0xff << (PadOnePosition + 1) )\
		                                    ^ (0x01 << PadOnePosition);
	data64 = (u_int64_t *)hashState512_(state).LastPart;

	if (state.unprocessed_bits < 960)
	{
		memset( (hashState512_(state).LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE - LastByte - 9 );
		databitlen = BlueMidnightWish512_BLOCK_SIZE * 8;
		data64[15] = state.bits_processed + state.unprocessed_bits;
	}
	else
	{
		memset( (hashState512_(state).LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE * 2 - LastByte - 9 );
		databitlen = BlueMidnightWish512_BLOCK_SIZE * 16;
		data64[31] = state.bits_processed + state.unprocessed_bits;
	}
	
	iterations = databitlen / (BlueMidnightWish512_BLOCK_SIZE * 8);
	data64_end = data64 + iterations*16;
	if(iterations > 0)
		Compress512(data64, data64_end, &state);
	databitlen -= (BlueMidnightWish512_BLOCK_SIZE * 8) * iterations;
	state.bits_processed += (BlueMidnightWish512_BLOCK_SIZE * 8) *  iterations;
	state.unprocessed_bits = (int)databitlen;


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

	memcpy(hashval, &CONST64final[8], BlueMidnightWish512_DIGEST_SIZE );

	return(SUCCESS);
}

