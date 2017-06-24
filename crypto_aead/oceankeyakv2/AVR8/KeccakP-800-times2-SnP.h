/*
Implementation by the Keccak, Keyak and Ketje Teams, namely, Guido Bertoni,
Joan Daemen, Michaël Peeters, Gilles Van Assche and Ronny Van Keer, hereby
denoted as "the implementer".

For more information, feedback or questions, please refer to our websites:
http://keccak.noekeon.org/
http://keyak.noekeon.org/
http://ketje.noekeon.org/

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#ifndef _KeccakP_800_times2_SnP_h_
#define _KeccakP_800_times2_SnP_h_

/** For the documentation, see PlSnP-documentation.h.
 */

#include "KeccakP-800-SnP.h"

#define KeccakP800times2_implementation         "fallback on serial implementation (" KeccakP800_implementation ")"
#define KeccakP800times2_statesSizeInBytes      (((KeccakP800_stateSizeInBytes+(KeccakP800_stateAlignment-1))/KeccakP800_stateAlignment)*KeccakP800_stateAlignment*2)
#define KeccakP800times2_statesAlignment        KeccakP800_stateAlignment

void KeccakP800times2_StaticInitialize( void );
void KeccakP800times2_InitializeAll(void *states);
void KeccakP800times2_AddByte(void *states, unsigned int instanceIndex, unsigned char data, unsigned int offset);
void KeccakP800times2_AddBytes(void *states, unsigned int instanceIndex, const unsigned char *data, unsigned int offset, unsigned int length);
void KeccakP800times2_AddLanesAll(void *states, const unsigned char *data, unsigned int laneCount, unsigned int laneOffset);
void KeccakP800times2_OverwriteBytes(void *states, unsigned int instanceIndex, const unsigned char *data, unsigned int offset, unsigned int length);
void KeccakP800times2_OverwriteLanesAll(void *states, const unsigned char *data, unsigned int laneCount, unsigned int laneOffset);
void KeccakP800times2_OverwriteWithZeroes(void *states, unsigned int instanceIndex, unsigned int byteCount);
void KeccakP800times2_PermuteAll_12rounds(void *states);
void KeccakP800times2_PermuteAll_22rounds(void *states);
void KeccakP800times2_ExtractBytes(const void *states, unsigned int instanceIndex, unsigned char *data, unsigned int offset, unsigned int length);
void KeccakP800times2_ExtractLanesAll(const void *states, unsigned char *data, unsigned int laneCount, unsigned int laneOffset);
void KeccakP800times2_ExtractAndAddBytes(const void *states, unsigned int instanceIndex,  const unsigned char *input, unsigned char *output, unsigned int offset, unsigned int length);
void KeccakP800times2_ExtractAndAddLanesAll(const void *states, const unsigned char *input, unsigned char *output, unsigned int laneCount, unsigned int laneOffset);

#endif
