/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by the designers,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include "brg_endian.h"
#include "displayIntermediateValues.h"
#include "KeccakP-800-12-reference.h"

typedef unsigned char UINT8;
typedef unsigned int UINT32;
typedef UINT32 tKeccakLane;

void fromBytesToWords(tKeccakLane *stateAsWords, const unsigned char *state); // From KeccakF-800/Reference
void fromWordsToBytes(unsigned char *state, const tKeccakLane *stateAsWords); // From KeccakF-800/Reference
void KeccakP800_12_OnWords(tKeccakLane *state);
void KeccakF800Round(tKeccakLane *state, unsigned int indexRound); // From KeccakF-800/Reference

void KeccakP800_12_StatePermute(void *state)
{
#if (PLATFORM_BYTE_ORDER != IS_LITTLE_ENDIAN)
    tKeccakLane stateAsWords[KeccakF_width/32];
#endif

    displayStateAsBytes(1, "Input of permutation", (const unsigned char *)state);
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    KeccakP800_12_OnWords((tKeccakLane*)state);
#else
    fromBytesToWords(stateAsWords, (const unsigned char *)state);
    KeccakP800_12_OnWords(stateAsWords);
    fromWordsToBytes((unsigned char *)state, stateAsWords);
#endif
    displayStateAsBytes(1, "State after permutation", (const unsigned char *)state);
}

void KeccakP800_12_OnWords(tKeccakLane *state)
{
    unsigned int i;

    displayStateAsLanes(3, "Same, with lanes as 32-bit words", state);

    for(i=10; i<22; i++)
        KeccakF800Round(state, i);
}

/* ---------------------------------------------------------------- */

void KeccakP800_12_StateXORPermuteExtract(void *state, const unsigned char *inData, unsigned int inLaneCount, unsigned char *outData, unsigned int outLaneCount)
{
    KeccakF800_StateXORLanes(state, inData, inLaneCount);
    KeccakP800_12_StatePermute(state);
    KeccakF800_StateExtractLanes(state, outData, outLaneCount);
}
