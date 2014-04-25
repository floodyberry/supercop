/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by the designers and Ronny Van Keer,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#ifndef _KeccakP400Interface_h_
#define _KeccakP400Interface_h_

#define KeccakF_width 400
#define KeccakF_laneInBytes 2
#define KeccakF_stateSizeInBytes (KeccakF_width/8)

/** Function to apply Keccak-p[400,nr] on the state.
  * @param  state   Pointer to the state.
  * @param  nr      Number of rounds.
  */
void KeccakP400_StatePermute(void *state, unsigned int nr);

#endif
