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

#ifndef _DoublePermutation_h_
#define _DoublePermutation_h_

#include <x86intrin.h>
typedef __m128i V128;

void KeccakDoublePermutationOnWords(V128 *state);
void KeccakDoublePermutationOnWordsAfterXoring2x512bits(V128 *state, const V128 *input);
void KeccakDoublePermutationOnWordsAfterXoring2x1024bits(V128 *state, const V128 *input);
void KeccakDoublePermutationOnWordsAfterXoring2x1088bits(V128 *state, const V128 *input);
void KeccakDoublePermutationOnWordsAfterXoring2x1344bits(V128 *state, const V128 *input);
void KeccakInitializeDoubleState(V128 *state);

#define KeccakPermutationSize 1600
#define KeccakPermutationSizeInBytes (KeccakPermutationSize/8)

#if defined(__GNUC__)
#define ALIGN __attribute__ ((aligned(32)))
#elif defined(_MSC_VER)
#define ALIGN __declspec(align(32))
#else
#define ALIGN
#endif

#endif
