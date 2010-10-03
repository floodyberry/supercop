/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
Implementation by Ronny Van Keer, STMicroelectronics

This code, originally by Ronny Van Keer, is hereby put in the public domain.
It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

#ifndef _Keccak_compact_h_
#define _Keccak_compact_h_

#include "Keccak-compact-settings.h"

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen );

/*
** API with message queue (inspired from NIST's API)
*/

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHLEN = 2 } HashReturn;

#if defined(__GNUC__)
#define ALIGN __attribute__ ((aligned(32)))
#elif defined(_MSC_VER)
#define ALIGN __declspec(align(32))
#else
#define ALIGN
#endif

ALIGN typedef struct hashStateStruct 
{
	ALIGN unsigned char state[cKeccakB / 8];
	int bitsInQueue;
} hashState;


HashReturn Init(hashState *state);

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);

HashReturn Final(hashState *state, BitSequence *hashval, int hashbytelen);

#endif
