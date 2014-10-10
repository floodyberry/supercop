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

#include "KeccakF-1600-interface.h"

/** Macro to map KeccakF_Initialize() to KeccakF1600_Initialize().
 */
#define KeccakF_Initialize KeccakF1600_Initialize

/** Macro to map KeccakF_StateInitialize() to KeccakF1600_StateInitialize().
 */
#define KeccakF_StateInitialize KeccakF1600_StateInitialize

/** Macro to map KeccakF_StateXORBytesInLane() to KeccakF1600_StateXORBytesInLane().
 */
#define KeccakF_StateXORBytesInLane KeccakF1600_StateXORBytesInLane

/** Macro to map KeccakF_StateXORLanes() to KeccakF1600_StateXORLanes().
 */
#define KeccakF_StateXORLanes KeccakF1600_StateXORLanes

/** Macro to map KeccakF_StateOverwriteBytesInLane() to KeccakF1600_StateOverwriteBytesInLane().
 */
#define KeccakF_StateOverwriteBytesInLane KeccakF1600_StateOverwriteBytesInLane

/** Macro to map KeccakF_StateOverwriteLanes() to KeccakF1600_StateOverwriteLanes().
 */
#define KeccakF_StateOverwriteLanes KeccakF1600_StateOverwriteLanes

/** Macro to map KeccakF_StateOverwriteWithZeroes() to KeccakF1600_StateOverwriteWithZeroes().
 */
#define KeccakF_StateOverwriteWithZeroes KeccakF1600_StateOverwriteWithZeroes

/** Macro to map KeccakF_StateComplementBit() to KeccakF1600_StateComplementBit().
 */
#define KeccakF_StateComplementBit KeccakF1600_StateComplementBit

/** Macro to map KeccakF_StatePermute() to KeccakP1600_12_StatePermute().
 */
#define KeccakF_StatePermute KeccakP1600_12_StatePermute

/** Macro to map KeccakF_StateExtractBytesInLane() to KeccakF1600_StateExtractBytesInLane().
 */
#define KeccakF_StateExtractBytesInLane KeccakF1600_StateExtractBytesInLane

/** Macro to map KeccakF_StateExtractLanes() to KeccakF1600_StateExtractLanes().
 */
#define KeccakF_StateExtractLanes KeccakF1600_StateExtractLanes

/** Macro to map KeccakF_StateExtractAndXORBytesInLane() to KeccakF1600_StateExtractAndXORBytesInLane().
 */
#define KeccakF_StateExtractAndXORBytesInLane KeccakF1600_StateExtractAndXORBytesInLane

/** Macro to map KeccakF_StateExtractAndXORLanes() to KeccakF1600_StateExtractAndXORLanes().
 */
#define KeccakF_StateExtractAndXORLanes KeccakF1600_StateExtractAndXORLanes

/** Macro to map KeccakF_StateXORPermuteExtract() to KeccakP1600_12_StateXORPermuteExtract().
 */
#define KeccakF_StateXORPermuteExtract KeccakP1600_12_StateXORPermuteExtract

#endif
