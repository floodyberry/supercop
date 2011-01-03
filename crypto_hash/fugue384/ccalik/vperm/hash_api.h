/*
 * file        : hash_api.h
 * version     : 1.0.208
 * date        : 14.12.2010
 * 
 * Fugue vperm implementation Hash API
 *
 * Cagdas Calik
 * ccalik@metu.edu.tr
 * Institute of Applied Mathematics, Middle East Technical University, Turkey.
 *
 */

#ifndef HASH_API_H
#define HASH_API_H


#ifdef AES_NI
#define HASH_IMPL_STR	"Fugue-aesni"
#else
#define HASH_IMPL_STR	"Fugue-vperm"
#endif

#include "sha3_common.h"

#ifdef AES_NI
#include <wmmintrin.h>
#else
#include <tmmintrin.h>
#endif


typedef struct
{
	__m128i			state[12];
	unsigned int	base;

	unsigned int	uHashSize;
	unsigned int	uBlockLength;
	unsigned int	uBufferBytes;
	DataLength		processed_bits;
	BitSequence		buffer[4];

} hashState;

HashReturn Init(hashState *state, int hashbitlen);

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);

HashReturn Final(hashState *state, BitSequence *hashval);

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);


#endif // HASH_API_H

