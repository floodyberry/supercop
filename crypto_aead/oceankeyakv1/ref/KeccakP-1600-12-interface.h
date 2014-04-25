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

#ifndef _KeccakP_1600_12_Interface_h_
#define _KeccakP_1600_12_Interface_h_

#include "KeccakF-1600-interface.h"

/** Function to apply Keccak-p[1600, 12] on the state.
  * @param  state   Pointer to the state.
  */
void KeccakP1600_12_StatePermute(void *state);

/** Function to sequentially XOR data bytes, apply the Keccak-p[1600, 12]
  * permutation and retrieve data bytes from the state.
  * @see    KeccakF1600_StateXORPermuteExtract()
  */
void KeccakP1600_12_StateXORPermuteExtract(void *state, const unsigned char *inData, unsigned int inLaneCount, unsigned char *outData, unsigned int outLaneCount);

#endif
