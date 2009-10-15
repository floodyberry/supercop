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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "brg_endian.h"
#include "KeccakNISTInterface.h"
#include "KeccakOpt32-settings.h"
#include "KeccakPermutationInterface.h"

typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef unsigned int UINT32;
typedef unsigned long long int UINT64;

#ifdef UseInterleaveTables
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

#else

// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
UINT64 toInterleaving(UINT64 x) 
{
   UINT64 t;

   t = (x ^ (x >>  1)) & 0x2222222222222222ULL;  x = x ^ t ^ (t <<  1);
   t = (x ^ (x >>  2)) & 0x0C0C0C0C0C0C0C0CULL;  x = x ^ t ^ (t <<  2);
   t = (x ^ (x >>  4)) & 0x00F000F000F000F0ULL;  x = x ^ t ^ (t <<  4);
   t = (x ^ (x >>  8)) & 0x0000FF000000FF00ULL;  x = x ^ t ^ (t <<  8);
   t = (x ^ (x >> 16)) & 0x00000000FFFF0000ULL;  x = x ^ t ^ (t << 16);

   return x;
}

// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
UINT64 fromInterleaving(UINT64 x)
{
   UINT64 t;

   t = (x ^ (x >> 16)) & 0x00000000FFFF0000ULL;  x = x ^ t ^ (t << 16);
   t = (x ^ (x >>  8)) & 0x0000FF000000FF00ULL;  x = x ^ t ^ (t <<  8);
   t = (x ^ (x >>  4)) & 0x00F000F000F000F0ULL;  x = x ^ t ^ (t <<  4);
   t = (x ^ (x >>  2)) & 0x0C0C0C0C0C0C0C0CULL;  x = x ^ t ^ (t <<  2);
   t = (x ^ (x >>  1)) & 0x2222222222222222ULL;  x = x ^ t ^ (t <<  1);

   return x;
}

void xor8bytesIntoInterleavedWords(UINT32* evenAndOdd, const UINT8* source)
{
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    *((UINT64*)evenAndOdd) ^= toInterleaving(((const UINT64*)source)[0]);
#else
    // This can be optimized
    UINT64 sourceWord =
        (UINT64)source[0]
        ^ (((UINT64)source[1]) <<  8)
        ^ (((UINT64)source[2]) << 16)
        ^ (((UINT64)source[3]) << 24)
        ^ (((UINT64)source[4]) << 32)
        ^ (((UINT64)source[5]) << 40)
        ^ (((UINT64)source[6]) << 48)
        ^ (((UINT64)source[7]) << 56);
    UINT64 evenAndOddWord = toInterleaving(sourceWord);
    evenAndOdd[0] ^= (UINT32)evenAndOddWord;
    evenAndOdd[1] ^= (UINT32)(evenAndOddWord >> 32);
#endif
}

void setInterleavedWordsInto8bytes(UINT8* dest, UINT32* evenAndOdd)
{
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    ((UINT64*)dest)[0] = fromInterleaving(*(UINT64*)evenAndOdd);
#else
    // This can be optimized
    UINT64 evenAndOddWord = (UINT64)evenAndOdd[0] ^ ((UINT64)evenAndOdd[1] << 32);
    UINT64 destWord = fromInterleaving(evenAndOddWord);
    dest[0] = destWord & 0xFF;
    dest[1] = (destWord >> 8) & 0xFF;
    dest[2] = (destWord >> 16) & 0xFF;
    dest[3] = (destWord >> 24) & 0xFF;
    dest[4] = (destWord >> 32) & 0xFF;
    dest[5] = (destWord >> 40) & 0xFF;
    dest[6] = (destWord >> 48) & 0xFF;
    dest[7] = (destWord >> 56) & 0xFF;
#endif
}

#endif

#if defined(_MSC_VER)
#define ROL32(a, offset) _rotl(a, offset)
#else
#define ROL32(a, offset) ((((UINT32)a) << offset) ^ (((UINT32)a) >> (32-offset)))
#endif

#include "KeccakF-1600-32.macros"
#include "KeccakPermutationOptimized.macros"

void KeccakPermutationOnWords(UINT32 *state)
{
    declareABCDE
#if (Unrolling != 24)
    unsigned int i;
#endif

    copyFromState(A, state)
    rounds
}

void KeccakPermutationOnWordsAfterXoring(UINT32 *state, const UINT8 *input, unsigned int laneCount)
{
    declareABCDE
    unsigned int i;

#ifdef UseInterleaveTables
    for(i=0; i<laneCount; i++)
        xor8bytesIntoInterleavedWords(state+i*2, state+i*2+1, input+i*8);
#else
    for(i=0; i<laneCount; i++)
        xor8bytesIntoInterleavedWords(state+i*2, input+i*8);
#endif
    copyFromState(A, state)
    rounds
}

void KeccakPermutationOnWordsAfterXoring1024bits(UINT32 *state, const UINT8 *input)
{
    declareABCDE
    unsigned int i;

#ifdef UseInterleaveTables
    for(i=0; i<16; i++)
        xor8bytesIntoInterleavedWords(state+i*2, state+i*2+1, input+i*8);
#else
    for(i=0; i<16; i++)
        xor8bytesIntoInterleavedWords(state+i*2, input+i*8);
#endif
    copyFromState(A, state)
    rounds
}

void KeccakInitialize()
{
#ifdef UseInterleaveTables
    buildInterleaveTables();
#endif
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

void KeccakAbsorb(unsigned char *state, const unsigned char *data, unsigned int laneCount)
{
    KeccakPermutationOnWordsAfterXoring((UINT32*)state, data, laneCount);
}

void KeccakExtract1024bits(const unsigned char *state, unsigned char *data)
{
    unsigned int i;

#ifdef UseInterleaveTables
    for(i=0; i<16; i++)
        setInterleavedWordsInto8bytes(data+i*8, ((UINT32*)state)[i*2], ((UINT32*)state)[i*2+1]);
#else
    for(i=0; i<16; i++)
        setInterleavedWordsInto8bytes(data+i*8, (UINT32*)state+i*2);
#endif
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

void KeccakExtract(const unsigned char *state, unsigned char *data, unsigned int laneCount)
{
    unsigned int i;

#ifdef UseInterleaveTables
    for(i=0; i<laneCount; i++)
        setInterleavedWordsInto8bytes(data+i*8, ((UINT32*)state)[i*2], ((UINT32*)state)[i*2+1]);
#else
    for(i=0; i<laneCount; i++)
        setInterleavedWordsInto8bytes(data+i*8, (UINT32*)state+i*2);
#endif
#ifdef UseBebigokimisa
    if (laneCount > 1) {
        ((UINT32*)data)[ 2] = ~((UINT32*)data)[ 2];
        ((UINT32*)data)[ 3] = ~((UINT32*)data)[ 3];
        if (laneCount > 2) {
            ((UINT32*)data)[ 4] = ~((UINT32*)data)[ 4];
            ((UINT32*)data)[ 5] = ~((UINT32*)data)[ 5];
            if (laneCount > 8) {
                ((UINT32*)data)[16] = ~((UINT32*)data)[16];
                ((UINT32*)data)[17] = ~((UINT32*)data)[17];
                if (laneCount > 12) {
                    ((UINT32*)data)[24] = ~((UINT32*)data)[24];
                    ((UINT32*)data)[25] = ~((UINT32*)data)[25];
                }
            }
        }
    }
#endif
}
