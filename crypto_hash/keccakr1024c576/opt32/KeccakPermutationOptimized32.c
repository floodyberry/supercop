/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
Date: October 27, 2008

This code, originally by Guido Bertoni, Joan Daemen, Michaël Peeters and
Gilles Van Assche as a part of the SHA-3 submission, is hereby put in the
public domain. It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

#include <stdio.h>
#include <string.h>
#include "brg_endian.h"
#include "KeccakNISTInterface.h"
#include "KeccakPermutationInterface.h"

typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef unsigned long int UINT32;

#define nrRounds 18
const UINT32 KeccakRoundConstants0[nrRounds] = {
    0x00000001UL,
    0x00000000UL,
    0x00000000UL,
    0x00000000UL,
    0x00000001UL,
    0x00000001UL,
    0x00000001UL,
    0x00000001UL,
    0x00000000UL,
    0x00000000UL,
    0x00000001UL,
    0x00000000UL,
    0x00000001UL,
    0x00000001UL,
    0x00000001UL,
    0x00000001UL,
    0x00000000UL,
    0x00000000UL };

const UINT32 KeccakRoundConstants1[nrRounds] = {
    0x00000000UL,
    0x00000089UL,
    0x8000008BUL,
    0x80008080UL,
    0x0000008BUL,
    0x00008000UL,
    0x80008088UL,
    0x80000082UL,
    0x0000000BUL,
    0x0000000AUL,
    0x00008082UL,
    0x00008003UL,
    0x0000808BUL,
    0x8000000BUL,
    0x8000008AUL,
    0x80000081UL,
    0x80000081UL,
    0x80000008UL };

int interleaveTablesBuilt = 0;
UINT16 interleaveTable[65536];
UINT16 deinterleaveTable[65536];

void buildInterleaveTables()
{
    UINT32 i, j;
    UINT16 x;

    if (!interleaveTablesBuilt) {
        for(i=0; i<65536; i++) {
            x = 0;
            for(j=0; j<16; j++) {
                if (i & (1 << j))
                    x |= (1 << (j/2 + 8*(j%2)));
            }
            interleaveTable[i] = x;
            deinterleaveTable[x] = (UINT16)i;
        }
        interleaveTablesBuilt = 1;
    }
}

#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)

#define xor2bytesIntoInterleavedWords(even, odd, source, j) \
    i##j = interleaveTable[((const UINT16*)source)[j]]; \
    ((UINT8*)even)[j] ^= i##j & 0xFF; \
    ((UINT8*)odd)[j] ^= i##j >> 8;

#define setInterleavedWordsInto2bytes(dest, even, odd, j) \
    d##j = deinterleaveTable[((even >> (j*8)) & 0xFF) ^ (((odd >> (j*8)) & 0xFF) << 8)]; \
    ((UINT16*)dest)[j] = d##j;

#else

#define xor2bytesIntoInterleavedWords(even, odd, source, j) \
    i##j = interleaveTable[source[2*j] ^ ((UINT16)source[2*j+1] << 8)]; \
    *even ^= (i##j & 0xFF) << (j*8); \
    *odd ^= ((i##j >> 8) & 0xFF) << (j*8);

#define setInterleavedWordsInto2bytes(dest, even, odd, j) \
    d##j = deinterleaveTable[((even >> (j*8)) & 0xFF) ^ (((odd >> (j*8)) & 0xFF) << 8)]; \
    dest[2*j] = d##j & 0xFF; \
    dest[2*j+1] = d##j >> 8;

#endif

void xor8bytesIntoInterleavedWords(UINT32 *even, UINT32 *odd, const UINT8* source)
{
    UINT16 i0, i1, i2, i3;

    xor2bytesIntoInterleavedWords(even, odd, source, 0)
    xor2bytesIntoInterleavedWords(even, odd, source, 1)
    xor2bytesIntoInterleavedWords(even, odd, source, 2)
    xor2bytesIntoInterleavedWords(even, odd, source, 3)
}

void setInterleavedWordsInto8bytes(UINT8* dest, UINT32 even, UINT32 odd)
{
    UINT16 d0, d1, d2, d3;

    setInterleavedWordsInto2bytes(dest, even, odd, 0)
    setInterleavedWordsInto2bytes(dest, even, odd, 1)
    setInterleavedWordsInto2bytes(dest, even, odd, 2)
    setInterleavedWordsInto2bytes(dest, even, odd, 3)
}

#if defined(_MSC_VER)
#define ROL32(a, offset) _rotl(a, offset)
#else
#define ROL32(a, offset) ((((UINT32)a) << offset) ^ (((UINT32)a) >> (32-offset)))
#endif

#define UseBebigokimisa

#include "KeccakPermutationOptimized32.macros"

void KeccakPermutationOnWords(UINT32 *state)
{
    declareABCDE
    unsigned int i;

    copyFromState(A, state)
    prepareTheta
    for(i=0; i<18; i+=9) {
        middleRound(i)
        middleRound(i+1)
        middleRound(i+2)
        middleRound(i+3)
        middleRound(i+4)
        middleRound(i+5)
        middleRound(i+6)
        middleRound(i+7)
        middleRound(i+8)
    }
    copyToState(state, A)
}

void KeccakPermutationOnWordsAfterXoring512bits(UINT32 *state, const UINT8 *input)
{
    declareABCDE
    unsigned int i;

    for(i=0; i<8; i++)
        xor8bytesIntoInterleavedWords(state+i*2, state+i*2+1, input+i*8);
    copyFromState(A, state)
    prepareTheta
    for(i=0; i<18; i+=9) {
        middleRound(i)
        middleRound(i+1)
        middleRound(i+2)
        middleRound(i+3)
        middleRound(i+4)
        middleRound(i+5)
        middleRound(i+6)
        middleRound(i+7)
        middleRound(i+8)
    }
    copyToState(state, A)
}

void KeccakPermutationOnWordsAfterXoring1024bits(UINT32 *state, const UINT8 *input)
{
    declareABCDE
    unsigned int i;

    for(i=0; i<16; i++)
        xor8bytesIntoInterleavedWords(state+i*2, state+i*2+1, input+i*8);
    copyFromState(A, state)
    prepareTheta
    for(i=0; i<18; i+=9) {
        middleRound(i)
        middleRound(i+1)
        middleRound(i+2)
        middleRound(i+3)
        middleRound(i+4)
        middleRound(i+5)
        middleRound(i+6)
        middleRound(i+7)
        middleRound(i+8)
    }
    copyToState(state, A)
}

void KeccakInitialize()
{
    buildInterleaveTables();
}

void KeccakInitializeState(unsigned char *state)
{
    memset(state, 0, KeccakPermutationSizeInBytes);
#ifdef UseBebigokimisa
    ((UINT32*)state)[ 2] = ~(UINT32)0;
    ((UINT32*)state)[ 3] = ~(UINT32)0;
    ((UINT32*)state)[ 4] = ~(UINT32)0;
    ((UINT32*)state)[ 5] = ~(UINT32)0;
    ((UINT32*)state)[16] = ~(UINT32)0;
    ((UINT32*)state)[17] = ~(UINT32)0;
    ((UINT32*)state)[24] = ~(UINT32)0;
    ((UINT32*)state)[25] = ~(UINT32)0;
    ((UINT32*)state)[34] = ~(UINT32)0;
    ((UINT32*)state)[35] = ~(UINT32)0;
    ((UINT32*)state)[40] = ~(UINT32)0;
    ((UINT32*)state)[41] = ~(UINT32)0;
#endif
}

void KeccakPermutation(unsigned char *state)
{
    // We assume the state is always stored as interleaved 32-bit words
    KeccakPermutationOnWords((UINT32*)state);
}

void KeccakAbsorb1024bits(unsigned char *state, const unsigned char *data)
{
    KeccakPermutationOnWordsAfterXoring1024bits((UINT32*)state, data);
}

void KeccakAbsorb512bits(unsigned char *state, const unsigned char *data)
{
    KeccakPermutationOnWordsAfterXoring512bits((UINT32*)state, data);
}

void KeccakExtract1024bits(const unsigned char *state, unsigned char *data)
{
    unsigned int i;

    for(i=0; i<16; i++)
        setInterleavedWordsInto8bytes(data+i*8, ((UINT32*)state)[i*2], ((UINT32*)state)[i*2+1]);
#ifdef UseBebigokimisa
    ((UINT32*)data)[ 2] = ~((UINT32*)data)[ 2];
    ((UINT32*)data)[ 3] = ~((UINT32*)data)[ 3];
    ((UINT32*)data)[ 4] = ~((UINT32*)data)[ 4];
    ((UINT32*)data)[ 5] = ~((UINT32*)data)[ 5];
    ((UINT32*)data)[16] = ~((UINT32*)data)[16];
    ((UINT32*)data)[17] = ~((UINT32*)data)[17];
    ((UINT32*)data)[24] = ~((UINT32*)data)[24];
    ((UINT32*)data)[25] = ~((UINT32*)data)[25];
#endif
}

void KeccakExtract512bits(const unsigned char *state, unsigned char *data)
{
    unsigned int i;

    for(i=0; i<8; i++)
        setInterleavedWordsInto8bytes(data+i*8, ((UINT32*)state)[i*2], ((UINT32*)state)[i*2+1]);
#ifdef UseBebigokimisa
    ((UINT32*)data)[ 2] = ~((UINT32*)data)[ 2];
    ((UINT32*)data)[ 3] = ~((UINT32*)data)[ 3];
    ((UINT32*)data)[ 4] = ~((UINT32*)data)[ 4];
    ((UINT32*)data)[ 5] = ~((UINT32*)data)[ 5];
#endif
}
