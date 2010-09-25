/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche

This code, originally by Guido Bertoni, Joan Daemen, Michaël Peeters and
Gilles Van Assche as a part of the SHA-3 submission, is hereby put in the
public domain. It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

#ifndef _KeccakPermutationInterface_h_
#define _KeccakPermutationInterface_h_

#include "KeccakF-1600-int-set.h"

void KeccakInitialize( void );
void KeccakInitializeState(unsigned char *state);
void KeccakPermutation(unsigned char *state);
#ifdef ProvideFast576
void KeccakAbsorb576bits(unsigned char *state, const unsigned char *data);
#endif
#ifdef ProvideFast832
void KeccakAbsorb832bits(unsigned char *state, const unsigned char *data);
#endif
#ifdef ProvideFast1024
void KeccakAbsorb1024bits(unsigned char *state, const unsigned char *data);
#endif
#ifdef ProvideFast1088
void KeccakAbsorb1088bits(unsigned char *state, const unsigned char *data);
#endif
#ifdef ProvideFast1152
void KeccakAbsorb1152bits(unsigned char *state, const unsigned char *data);
#endif
#ifdef ProvideFast1344
void KeccakAbsorb1344bits(unsigned char *state, const unsigned char *data);
#endif
void KeccakAbsorb(unsigned char *state, const unsigned char *data, unsigned int laneCount);
#ifdef ProvideFast1024
void KeccakExtract1024bits(const unsigned char *state, unsigned char *data);
#endif
void KeccakExtract(const unsigned char *state, unsigned char *data, unsigned int laneCount);

#endif
