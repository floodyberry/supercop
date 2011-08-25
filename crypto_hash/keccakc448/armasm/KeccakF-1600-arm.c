/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by Ronny Van Keer,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include "KeccakF-1600-interface.h"
#include "KeccakSponge.h"
#include <string.h>

typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef unsigned int UINT32;
typedef unsigned long long int UINT64;

void KeccakPermutationOnWordsAfterXoring_ARM_asm(UINT32 *state, const UINT8 *input, int laneCount);

void KeccakInitialize( void )
{
}

void KeccakInitializeState(unsigned char *state)
{
    memset(state, 0, KeccakPermutationSizeInBytes);
}

void KeccakPermutation(unsigned char *state)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, 0, 0);
}

#ifdef ProvideFast576
void KeccakAbsorb576bits(unsigned char *state, const unsigned char *data)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, 9);
}
#endif

#ifdef ProvideFast832
void KeccakAbsorb832bits(unsigned char *state, const unsigned char *data)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, 13);
}
#endif

#ifdef ProvideFast1024
void KeccakAbsorb1024bits(unsigned char *state, const unsigned char *data)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, 16);
}
#endif

#ifdef ProvideFast1088
void KeccakAbsorb1088bits(unsigned char *state, const unsigned char *data)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, 17);
}
#endif

#ifdef ProvideFast1152
void KeccakAbsorb1152bits(unsigned char *state, const unsigned char *data)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, 18);
}
#endif

#ifdef ProvideFast1344
void KeccakAbsorb1344bits(unsigned char *state, const unsigned char *data)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, 21);
}
#endif


void KeccakAbsorb(unsigned char *state, const unsigned char *data, unsigned int laneCount)
{
	KeccakPermutationOnWordsAfterXoring_ARM_asm((UINT32*)state, data, laneCount);
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

void setInterleavedWordsInto8bytes(UINT8* dest, UINT32* evenAndOdd)
{
    ((UINT64*)dest)[0] = fromInterleaving(*(UINT64*)evenAndOdd);
}

#define extractLanes(laneCount, state, data) \
    { \
        int i; \
        for(i=0; i<(laneCount); i++) \
            setInterleavedWordsInto8bytes(data+i*8, (UINT32*)state+i*2); \
    }

#ifdef ProvideFast1024
void KeccakExtract1024bits(const unsigned char *state, unsigned char *data)
{
	extractLanes(16, state, data)
}
#endif

void KeccakExtract(const unsigned char *state, unsigned char *data, unsigned int laneCount)
{
    extractLanes(laneCount, state, data)
}
