/*
 * file        : hash_api.h
 * version     : 1.0.208
 * date        : 14.12.2010
 * 
 * Grostl vperm implementation Hash API
 *
 * Cagdas Calik
 * ccalik@metu.edu.tr
 * Institute of Applied Mathematics, Middle East Technical University, Turkey.
 *
 */

#ifndef HASH_API_H
#define HASH_API_H


#ifdef AES_NI
#define HASH_IMPL_STR	"Grostl-aesni"
#else
#define HASH_IMPL_STR	"Grostl-vperm"
#endif

#include "sha3_common.h"
#include <emmintrin.h>


typedef struct
{
	__m128i			state[8];
	__m128i			shift[8];
	__m128i			addconstP[14];
	__m128i			addconstQ[14];

	unsigned int	uRounds;
	unsigned int	uHashSize;
	unsigned int	uBlockLength;
	unsigned int	uBufferBytes;
	unsigned int	bFinalBlock;
	DataLength		processed_blocks;
	BitSequence		buffer[128];

} hashState;

HashReturn Init(hashState *state, int hashbitlen);

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);

HashReturn Final(hashState *state, BitSequence *hashval);

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);


#endif // HASH_API_H

