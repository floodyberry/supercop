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
#include "KeccakP-400-reference.h"

typedef unsigned short UINT16;
typedef UINT16 tKeccakLane;

#define nrRounds 20

void KeccakF400Round(tKeccakLane *state, unsigned int indexRound); // From KeccakF-400/Reference

void KeccakP400_StatePermute(void *state, unsigned int nr)
{
#if (PLATFORM_BYTE_ORDER != IS_LITTLE_ENDIAN)
    tKeccakLane stateAsWords[KeccakF_width/sizeof(tKeccakLane)];
#endif

    displayStateAsBytes(1, "Input of permutation", (const unsigned char *)state);
#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
    displayStateAsLanes(3, "Same, with lanes as 16-bit words", (tKeccakLane*)state);
    for(nr=nrRounds-nr; nr<nrRounds; nr++)
		KeccakF400Round((tKeccakLane*)state, nr);
#else
    fromBytesToWords(stateAsWords, (const unsigned char *)state);
    displayStateAsLanes(3, "Same, with lanes as 16-bit words", stateAsWords);
    for(nr=nrRounds-nr; nr<nrRounds; nr++)
		KeccakF400Round(stateAsWords, nr);
    fromWordsToBytes((unsigned char *)state, stateAsWords);
#endif
    displayStateAsBytes(1, "State after permutation", (const unsigned char *)state);
}
