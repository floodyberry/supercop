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

#include <string.h>
#include "crypto_hash.h"
#include "DoublePermutation.h"
#include "Keccakc256TreeD2.h"

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
    ALIGN unsigned char state[KeccakPermutationSizeInBytes*2];
    ALIGN unsigned char buffer[rateInBytes*2];
    ALIGN unsigned char finalNode[rateInBytes*2];
    unsigned int padLeftBranch, padRightBranch;
    unsigned int i;

    KeccakInitializeDoubleState((V128*)state);

    while(inlen >= rateInBytes*2) {
        KeccakDoublePermutationOnWordsAfterXoring2x1344bits((V128*)state, (const V128*)in);
        in += rateInBytes*2;
        inlen -= rateInBytes*2;
    }

    memset(finalNode, 0, rateInBytes*2);
    memset(buffer, 0, rateInBytes*2);
    memcpy(buffer, in, inlen);
    if (inlen % 16 < 8) {
        padLeftBranch = inlen;
        padRightBranch = (inlen/16)*16+8;
    }
    else {
        padLeftBranch = ((inlen+15)/16)*16;
        padRightBranch = inlen;
    }
    buffer[padRightBranch] = 0x02; //non-final bit and first bit of padding
    buffer[rateInBytes*2-1] |= 0x80; // second bit of padding
    if (padLeftBranch < rateInBytes*2) {
        buffer[padLeftBranch] = 0x02; //non-final bit and first bit of padding
        buffer[rateInBytes*2-8-1] |= 0x80; // second bit of padding
        KeccakDoublePermutationOnWordsAfterXoring2x1344bits((V128*)state, (const V128*)buffer);
        for(i=0; i<CinBytes/8; i++) {
            memcpy(finalNode+i*16, state+i*16, 8);
            memcpy(finalNode+CinBytes*2+i*16, state+i*16+8, 8);
        }
    }
    else {
        KeccakDoublePermutationOnWordsAfterXoring2x1344bits((V128*)state, (const V128*)buffer);
        for(i=0; i<CinBytes/8; i++)
            memcpy(finalNode+CinBytes*2+i*16, state+i*16+8, 8);
        memset(buffer, 0, rateInBytes*2);
        buffer[0] = 0x02; //non-final bit and first bit of padding
        buffer[rateInBytes*2-8-1] |= 0x80; // second bit of padding
        KeccakDoublePermutationOnWordsAfterXoring2x1344bits((V128*)state, (const V128*)buffer);
        for(i=0; i<CinBytes/8; i++)
            memcpy(finalNode+i*16, state+i*16, 8);
    }
    finalNode[CinBytes*4+0] = 0x40; // B=64 bits
    finalNode[CinBytes*4+1] = 0x00; // B=64 bits
    finalNode[CinBytes*4+2] = 0x00; // B=64 bits
    finalNode[CinBytes*4+3] = 0x00; // B=64 bits
    finalNode[CinBytes*4+4] = 0x00 | 0x20 | 0x40; // 5 bits set to zero (reserved for future use, for other layouts), plus final bit, plus first bit of padding
    finalNode[rateInBytes*2-8-1] |= 0x80; // second bit of padding

    KeccakInitializeDoubleState((V128*)state);
    KeccakDoublePermutationOnWordsAfterXoring2x1344bits((V128*)state, (const V128*)finalNode);
    for(i=0; i<rateInBytes/8; i++)
        memcpy(out+i*8, state+i*16, 8);

    return 0;
}
