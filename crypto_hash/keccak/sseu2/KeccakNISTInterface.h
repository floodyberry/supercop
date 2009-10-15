/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
Date: September 14, 2009

This code, originally by Guido Bertoni, Joan Daemen, Michaël Peeters and
Gilles Van Assche as a part of the SHA-3 submission, is hereby put in the
public domain. It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

#ifndef _KeccakNISTInterface_h_
#define _KeccakNISTInterface_h_

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHLEN = 2 } HashReturn;

#define KeccakPermutationSize 1600
#define KeccakPermutationSizeInBytes (KeccakPermutationSize/8)
#define KeccakMaximumRate 1152
#define KeccakMaximumRateInBytes (KeccakMaximumRate/8)

#if defined(__GNUC__)
#define ALIGN __attribute__ ((aligned(32)))
#elif defined(_MSC_VER)
#define ALIGN __declspec(align(32))
#else
#define ALIGN
#endif

ALIGN typedef struct {
    ALIGN unsigned char state[KeccakPermutationSizeInBytes];
    ALIGN BitSequence dataQueue[KeccakMaximumRateInBytes];
    unsigned int rate;
    unsigned int capacity;
    unsigned char diversifier;
    unsigned int hashbitlen;
    unsigned int bitsInQueue;
    int squeezing;
    unsigned int bitsAvailableForSqueezing;
} hashState;

HashReturn Init(hashState *state, int hashbitlen);
HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *state, BitSequence *hashval);
HashReturn Squeeze(hashState *state, BitSequence *output, DataLength outputLength);

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

#endif
