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

#include "KeccakF-400-interface.h"

/** Macro to map KeccakF_Initialize() to KeccakF400_Initialize().
 */
#define KeccakF_Initialize KeccakF400_Initialize

/** Macro to map KeccakF_StateInitialize() to KeccakF400_StateInitialize().
 */
#define KeccakF_StateInitialize KeccakF400_StateInitialize

/** Macro to map KeccakF_StateXORBytesInLane() to KeccakF400_StateXORBytesInLane().
 */
#define KeccakF_StateXORBytesInLane KeccakF400_StateXORBytesInLane

/** Macro to map KeccakF_StateXORLanes() to KeccakF400_StateXORLanes().
 */
#define KeccakF_StateXORLanes KeccakF400_StateXORLanes

/** Macro to map KeccakF_StateOverwriteBytesInLane() to KeccakF400_StateOverwriteBytesInLane().
 */
#define KeccakF_StateOverwriteBytesInLane KeccakF400_StateOverwriteBytesInLane

/** Macro to map KeccakF_StateOverwriteLanes() to KeccakF400_StateOverwriteLanes().
 */
#define KeccakF_StateOverwriteLanes KeccakF400_StateOverwriteLanes

/** Macro to map KeccakF_StateOverwriteWithZeroes() to KeccakF400_StateOverwriteWithZeroes().
 */
#define KeccakF_StateOverwriteWithZeroes KeccakF400_StateOverwriteWithZeroes

/** Macro to map KeccakF_StateComplementBit() to KeccakF400_StateComplementBit().
 */
#define KeccakF_StateComplementBit KeccakF400_StateComplementBit

/** Macro to map KeccakF_StatePermute() to KeccakF400_StatePermute().
 */
#define KeccakF_StatePermute KeccakF400_StatePermute

/** Macro to map KeccakF_StateExtractBytesInLane() to KeccakF400_StateExtractBytesInLane().
 */
#define KeccakF_StateExtractBytesInLane KeccakF400_StateExtractBytesInLane

/** Macro to map KeccakF_StateExtractLanes() to KeccakF400_StateExtractLanes().
 */
#define KeccakF_StateExtractLanes KeccakF400_StateExtractLanes

/** Macro to map KeccakF_StateExtractAndXORBytesInLane() to KeccakF400_StateExtractAndXORBytesInLane().
 */
#define KeccakF_StateExtractAndXORBytesInLane KeccakF400_StateExtractAndXORBytesInLane

/** Macro to map KeccakF_StateExtractAndXORLanes() to KeccakF400_StateExtractAndXORLanes().
 */
#define KeccakF_StateExtractAndXORLanes KeccakF400_StateExtractAndXORLanes

/** Macro to map KeccakF_StateXORPermuteExtract() to KeccakF400_StateXORPermuteExtract().
 */
#define KeccakF_StateXORPermuteExtract KeccakF400_StateXORPermuteExtract

#endif
