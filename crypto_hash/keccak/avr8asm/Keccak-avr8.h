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

#include "Keccak-avr8-settings.h"

/*	Only Keccak-F1600 is supported	*/
#define	cKeccakB	1600


int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen );

/*
** API with a message queue
*/

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHLEN = 2 } HashReturn;

typedef struct hashStateStruct 
{
	unsigned char	state[cKeccakB / 8];
	unsigned char bytesInQueue;
	unsigned char	trailingBitsInQueue;
} hashState;


HashReturn Init(hashState *state);

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);

HashReturn Final(hashState *state, BitSequence *hashval, int hashbytelen);

#endif
