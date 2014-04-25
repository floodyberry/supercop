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

#ifndef _KeccakF_Interface_h_
#define _KeccakF_Interface_h_

#include "KeccakF-200-interface.h"

/** Macro to map KeccakF_Initialize() to KeccakF200_Initialize().
 */
#define KeccakF_Initialize KeccakF200_Initialize

/** Macro to map KeccakF_StateInitialize() to KeccakF200_StateInitialize().
 */
#define KeccakF_StateInitialize KeccakF200_StateInitialize

/** Macro to map KeccakF_StateXORBytesInLane() to KeccakF200_StateXORBytesInLane().
 */
#define KeccakF_StateXORBytesInLane KeccakF200_StateXORBytesInLane

/** Macro to map KeccakF_StateXORLanes() to KeccakF200_StateXORLanes().
 */
#define KeccakF_StateXORLanes KeccakF200_StateXORLanes

/** Macro to map KeccakF_StateOverwriteBytesInLane() to KeccakF200_StateOverwriteBytesInLane().
 */
#define KeccakF_StateOverwriteBytesInLane KeccakF200_StateOverwriteBytesInLane

/** Macro to map KeccakF_StateOverwriteLanes() to KeccakF200_StateOverwriteLanes().
 */
#define KeccakF_StateOverwriteLanes KeccakF200_StateOverwriteLanes

/** Macro to map KeccakF_StateOverwriteWithZeroes() to KeccakF200_StateOverwriteWithZeroes().
 */
#define KeccakF_StateOverwriteWithZeroes KeccakF200_StateOverwriteWithZeroes

/** Macro to map KeccakF_StateComplementBit() to KeccakF200_StateComplementBit().
 */
#define KeccakF_StateComplementBit KeccakF200_StateComplementBit

/** Macro to map KeccakF_StatePermute() to KeccakF200_StatePermute().
 */
#define KeccakF_StatePermute KeccakF200_StatePermute

/** Macro to map KeccakF_StateExtractBytesInLane() to KeccakF200_StateExtractBytesInLane().
 */
#define KeccakF_StateExtractBytesInLane KeccakF200_StateExtractBytesInLane

/** Macro to map KeccakF_StateExtractLanes() to KeccakF200_StateExtractLanes().
 */
#define KeccakF_StateExtractLanes KeccakF200_StateExtractLanes

/** Macro to map KeccakF_StateExtractAndXORBytesInLane() to KeccakF200_StateExtractAndXORBytesInLane().
 */
#define KeccakF_StateExtractAndXORBytesInLane KeccakF200_StateExtractAndXORBytesInLane

/** Macro to map KeccakF_StateExtractAndXORLanes() to KeccakF200_StateExtractAndXORLanes().
 */
#define KeccakF_StateExtractAndXORLanes KeccakF200_StateExtractAndXORLanes

/** Macro to map KeccakF_StateXORPermuteExtract() to KeccakF200_StateXORPermuteExtract().
 */
#define KeccakF_StateXORPermuteExtract KeccakF200_StateXORPermuteExtract

#endif
