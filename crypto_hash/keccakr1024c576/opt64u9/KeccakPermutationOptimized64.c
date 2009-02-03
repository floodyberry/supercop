/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
Date: January 9, 2009

This code, originally by Guido Bertoni, Joan Daemen, Michaël Peeters and
Gilles Van Assche as a part of the SHA-3 submission, is hereby put in the
public domain. It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

#include <string.h>
#include "brg_endian.h"
#include "KeccakNISTInterface.h"
#include "KeccakOpt64-settings.h"
#include "KeccakPermutationInterface.h"

typedef unsigned char UINT8;
typedef unsigned long long int UINT64;

#define nrRounds 18
const UINT64 KeccakRoundConstants[nrRounds] = {
    0x0000000000000001ULL,
    0x0000000000008082ULL,
    0x800000000000808AULL,
    0x8000000080008000ULL,
    0x000000000000808BULL,
    0x0000000080000001ULL,
    0x8000000080008081ULL,
    0x8000000000008009ULL,
    0x000000000000008AULL,
    0x0000000000000088ULL,
    0x0000000080008009ULL,
    0x000000008000000AULL,
    0x000000008000808BULL,
    0x800000000000008BULL,
    0x8000000000008089ULL,
    0x8000000000008003ULL,
    0x8000000000008002ULL,
    0x8000000000000080ULL };

#if defined(_MSC_VER)
#define ROL64(a, offset) _rotl64(a, offset)
#else
#define ROL64(a, offset) ((((UINT64)a) << offset) ^ (((UINT64)a) >> (64-offset)))
#endif

#include "KeccakPermutationOptimized64.macros"
#include "KeccakPermutationOptimized.macros"

void KeccakPermutationOnWords(UINT64 *state)
{
    declareABCDE
#if (Unrolling != 18)
    unsigned int i;
#endif

    copyFromState(A, state)
    rounds
}

void KeccakPermutationOnWordsAfterXoring8words(UINT64 *state, const UINT64 *input)
{
    declareABCDE
#if (Unrolling != 18)
    unsigned int i;
#endif

    copyFromStateAndXor8words(A, state, input)
    rounds
}

void KeccakPermutationOnWordsAfterXoring16words(UINT64 *state, const UINT64 *input)
{
    declareABCDE
#if (Unrolling != 18)
    unsigned int i;
#endif

    copyFromStateAndXor16words(A, state, input)
    rounds
}

void KeccakInitialize()
{
}

void KeccakInitializeState(unsigned char *state)
{
    memset(state, 0, KeccakPermutationSizeInBytes);
#ifdef UseBebigokimisa
    ((UINT64*)state)[ 1] = ~(UINT64)0;
    ((UINT64*)state)[ 2] = ~(UINT64)0;
    ((UINT64*)state)[ 8] = ~(UINT64)0;
    ((UINT64*)state)[12] = ~(UINT64)0;
    ((UINT64*)state)[17] = ~(UINT64)0;
    ((UINT64*)state)[20] = ~(UINT64)0;
#endif
}

void KeccakPermutation(unsigned char *state)
{
    // We assume the state is always stored as words
    KeccakPermutationOnWords((UINT64*)state);
}

void fromBytesToWord(UINT64 *word, const UINT8 *bytes)
{
    unsigned int i;

    *word = 0;
    for(i=0; i<(64/8); i++)
        *word |= (UINT64)(bytes[i]) << (8*i);
}

void KeccakAbsorb1024bits(unsigned char *state, const unsigned char *data)
{
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    KeccakPermutationOnWordsAfterXoring16words((UINT64*)state, (const UINT64*)data);
#else
    UINT64 dataAsWords[16];
    unsigned int i;

    for(i=0; i<16; i++)
        fromBytesToWord(dataAsWords+i, data+(i*8));
    KeccakPermutationOnWordsAfterXoring16words((UINT64*)state, dataAsWords);
#endif
}

void KeccakAbsorb512bits(unsigned char *state, const unsigned char *data)
{
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    KeccakPermutationOnWordsAfterXoring8words((UINT64*)state, (const UINT64*)data);
#else
    UINT64 dataAsWords[8];
    unsigned int i;

    for(i=0; i<8; i++)
        fromBytesToWord(dataAsWords+i, data+(i*8));
    KeccakPermutationOnWordsAfterXoring8words((UINT64*)state, dataAsWords);
#endif
}

void fromWordToBytes(UINT8 *bytes, const UINT64 word)
{
    unsigned int i;

    for(i=0; i<(64/8); i++)
        bytes[i] = (word >> (8*i)) & 0xFF;
}

void KeccakExtract1024bits(const unsigned char *state, unsigned char *data)
{
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    memcpy(data, state, 128);
#else
    unsigned int i;

    for(i=0; i<16; i++)
        fromWordToBytes(data+(i*8), ((const UINT64*)state)[i]);
#endif
#ifdef UseBebigokimisa
    ((UINT64*)data)[ 1] = ~((UINT64*)data)[ 1];
    ((UINT64*)data)[ 2] = ~((UINT64*)data)[ 2];
    ((UINT64*)data)[ 8] = ~((UINT64*)data)[ 8];
    ((UINT64*)data)[12] = ~((UINT64*)data)[12];
#endif
}

void KeccakExtract512bits(const unsigned char *state, unsigned char *data)
{
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    memcpy(data, state, 64);
#else
    unsigned int i;

    for(i=0; i<8; i++)
        fromWordToBytes(data+(i*8), ((const UINT64*)state)[i]);
#endif
#ifdef UseBebigokimisa
    ((UINT64*)data)[ 1] = ~((UINT64*)data)[ 1];
    ((UINT64*)data)[ 2] = ~((UINT64*)data)[ 2];
#endif
}
