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

#include "KeccakF-800-interface.h"

/** Macro to map KeccakF_Initialize() to KeccakF800_Initialize().
 */
#define KeccakF_Initialize KeccakF800_Initialize

/** Macro to map KeccakF_StateInitialize() to KeccakF800_StateInitialize().
 */
#define KeccakF_StateInitialize KeccakF800_StateInitialize

/** Macro to map KeccakF_StateXORBytesInLane() to KeccakF800_StateXORBytesInLane().
 */
#define KeccakF_StateXORBytesInLane KeccakF800_StateXORBytesInLane

/** Macro to map KeccakF_StateXORLanes() to KeccakF800_StateXORLanes().
 */
#define KeccakF_StateXORLanes KeccakF800_StateXORLanes

/** Macro to map KeccakF_StateOverwriteBytesInLane() to KeccakF800_StateOverwriteBytesInLane().
 */
#define KeccakF_StateOverwriteBytesInLane KeccakF800_StateOverwriteBytesInLane

/** Macro to map KeccakF_StateOverwriteLanes() to KeccakF800_StateOverwriteLanes().
 */
#define KeccakF_StateOverwriteLanes KeccakF800_StateOverwriteLanes

/** Macro to map KeccakF_StateOverwriteWithZeroes() to KeccakF800_StateOverwriteWithZeroes().
 */
#define KeccakF_StateOverwriteWithZeroes KeccakF800_StateOverwriteWithZeroes

/** Macro to map KeccakF_StateComplementBit() to KeccakF800_StateComplementBit().
 */
#define KeccakF_StateComplementBit KeccakF800_StateComplementBit

/** Macro to map KeccakF_StatePermute() to KeccakP800_12_StatePermute().
 */
#define KeccakF_StatePermute KeccakP800_12_StatePermute

/** Macro to map KeccakF_StateExtractBytesInLane() to KeccakF800_StateExtractBytesInLane().
 */
#define KeccakF_StateExtractBytesInLane KeccakF800_StateExtractBytesInLane

/** Macro to map KeccakF_StateExtractLanes() to KeccakF800_StateExtractLanes().
 */
#define KeccakF_StateExtractLanes KeccakF800_StateExtractLanes

/** Macro to map KeccakF_StateExtractAndXORBytesInLane() to KeccakF800_StateExtractAndXORBytesInLane().
 */
#define KeccakF_StateExtractAndXORBytesInLane KeccakF800_StateExtractAndXORBytesInLane

/** Macro to map KeccakF_StateExtractAndXORLanes() to KeccakF800_StateExtractAndXORLanes().
 */
#define KeccakF_StateExtractAndXORLanes KeccakF800_StateExtractAndXORLanes

/** Macro to map KeccakF_StateXORPermuteExtract() to KeccakP800_12_StateXORPermuteExtract().
 */
#define KeccakF_StateXORPermuteExtract KeccakP800_12_StateXORPermuteExtract

#endif
