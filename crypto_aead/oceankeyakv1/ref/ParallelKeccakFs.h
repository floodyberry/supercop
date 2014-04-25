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

#ifndef _ParallelKeccakFs_h_
#define _ParallelKeccakFs_h_

#include "KeccakF-interface.h"
#include "NumberOfParallelInstances.h"

/** Function called at least once before any use of the other KeccakF_*
  * functions, possibly to initialize global variables.
  */
void KeccakF_ParallelInitialize( void );

/** Function to initialize the state to the logical value 0^width for all parallel state instances.
  * @param  states  Pointer to the states to initialize.
  */
void KeccakF_ParallelStateInitializeAll(void *states);

/** Function to XOR data given as bytes into one of the states.
  * The bits to modify are restricted to be consecutive and to be in the same lane.
  * The bit positions that are affected by this function are
  * from @a lanePosition*(lane size in bits) + @a offset*8
  * to @a lanePosition*(lane size in bits) + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  lanePosition    Index of the lane to be modified (x+5*y,
  *                         or bit position divided by the lane size).
  * @param  data    Pointer to the input data.
  * @param  offset  Offset in bytes within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < (lane size in bytes)
  * @pre    0 ≤ @a offset + @a length ≤ (lane size in bytes)
  */
void KeccakF_ParallelStateXORBytesInLane(void *states, unsigned int instanceIndex, unsigned int lanePosition, const unsigned char *data, unsigned int offset, unsigned int length);

/** Function to XOR data given as bytes into one of the states.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  data    Pointer to the input data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by the lane size.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateXORLanes(void *states, unsigned int instanceIndex, const unsigned char *data, unsigned int laneCount);

/** Function to XOR data given as bytes into all the parallel states in an interleaved fashion.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * The first @a laneCount lanes from @a data are processed in the first state instance,
  * then the next @a laneCount lanes from @a data are processed in the second state instance,
  * and so on.
  * @param  states  Pointer to the states.
  * @param  data    Pointer to the input data.
  * @param  laneCount   The number of lanes per state, i.e., the length of the data
  *                     divided by the lane size and by the number of parallel state instances.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateXORLanesAll(void *states, const unsigned char *data, unsigned int laneCount);

/** Function to overwrite data given as bytes into one of the states.
  * The bits to modify are restricted to be consecutive and to be in the same lane.
  * The bit positions that are affected by this function are
  * from @a lanePosition*(lane size in bits) + @a offset*8
  * to @a lanePosition*(lane size in bits) + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  lanePosition    Index of the lane to be modified (x+5*y,
  *                         or bit position divided by the lane size).
  * @param  data    Pointer to the input data.
  * @param  offset  Offset in bytes within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < (lane size in bytes)
  * @pre    0 ≤ @a offset + @a length ≤ (lane size in bytes)
  */
void KeccakF_ParallelStateOverwriteBytesInLane(void *states, unsigned int instanceIndex, unsigned int lanePosition, const unsigned char *data, unsigned int offset, unsigned int length);

/** Function to overwrite data given as bytes into one of the states.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  data    Pointer to the input data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by the lane size.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateOverwriteLanes(void *states, unsigned int instanceIndex, const unsigned char *data, unsigned int laneCount);

/** Function to overwrite data given as bytes into all the parallel states in an interleaved fashion.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * The first @a laneCount lanes from @a data are processed in the first state instance,
  * then the next @a laneCount lanes from @a data are processed in the second state instance,
  * and so on.
  * @param  states  Pointer to the states.
  * @param  data    Pointer to the input data.
  * @param  laneCount   The number of lanes per state, i.e., the length of the data
  *                     divided by the lane size and by the number of parallel state instances.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateOverwriteLanesAll(void *states, const unsigned char *data, unsigned int laneCount);

/** Function to overwrite bytes in the one of the states with zeroes.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of bytes.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  byteCount   The number of bytes, i.e., the length of the data
  *                     divided by 8 bits.
  * @pre    0 ≤ @a byteCount ≤ (width in bytes)
  */
void KeccakF_ParallelStateOverwriteWithZeroes(void *states, unsigned int instanceIndex, unsigned int byteCount);

/** Function to complement the value of a given bit in one of the states.
  * This function is typically used to XOR the second bit of the multi-rate
  * padding into the state.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  position    The position of the bit to complement.
  * @pre    0 ≤ @a position < (width in bits)
  */
void KeccakF_ParallelStateComplementBit(void *states, unsigned int instanceIndex, unsigned int position);

/** Function to complement the value of a given bit in all the states.
  * This function is typically used to XOR the second bit of the multi-rate
  * padding into the state.
  * @param  states  Pointer to the states.
  * @param  position    The position of the bit to complement.
  * @pre    0 ≤ @a position < (width in bits)
  */
void KeccakF_ParallelStateComplementBitAll(void *states, unsigned int position);

/** Function to apply Keccak-f on one of the states.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  */
void KeccakF_ParallelStatePermute(void *states, unsigned int instanceIndex);

/** Function to apply Keccak-f on all the states in parallel.
  * @param  states  Pointer to the states.
  */
void KeccakF_ParallelStatePermuteAll(void *states);

/** Function to retrieve data from one of the states into bytes.
  * The bits to output are restricted to be consecutive and to be in the same lane.
  * The bit positions that are retrieved by this function are
  * from @a lanePosition*(lane size in bits) + @a offset*8
  * to @a lanePosition*(lane size in bits) + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  lanePosition    Index of the lane to be read (x+5*y,
  *                         or bit position divided by the lane size).
  * @param  data    Pointer to the area where to store output data.
  * @param  offset  Offset in byte within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < (lane size in bytes)
  * @pre    0 ≤ @a offset + @a length ≤ (lane size in bytes)
  */
void KeccakF_ParallelStateExtractBytesInLane(const void *states, unsigned int instanceIndex, unsigned int lanePosition, unsigned char *data, unsigned int offset, unsigned int length);

/** Function to retrieve data from one of the states into bytes.
  * The bits to output are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  data    Pointer to the area where to store output data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by the lane size.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateExtractLanes(const void *states, unsigned int instanceIndex, unsigned char *data, unsigned int laneCount);

/** Function to retrieve data from all the parallel states in an interleaved fashion.
  * The bits to output are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * The first @a laneCount lanes from the first state instance are stored in @a data,
  * followed by the first @a laneCount lanes the second state instance,
  * and so on.
  * @param  states  Pointer to the states.
  * @param  data    Pointer to the area where to store output data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by the lane size and by the number of parallel state instances.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateExtractLanesAll(const void *states, unsigned char *data, unsigned int laneCount);

/** Function to retrieve data from one of the states and
  * to XOR them into the output buffer.
  * The bits to output are restricted to be consecutive and to be in the same lane.
  * The bit positions that are retrieved by this function are
  * from @a lanePosition*(lane size in bits) + @a offset*8
  * to @a lanePosition*(lane size in bits) + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  lanePosition    Index of the lane to be read (x+5*y,
  *                         or bit position divided by the lane size).
  * @param  data    Pointer to the area where to XOR output data.
  * @param  offset  Offset in byte within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < (lane size in bytes)
  * @pre    0 ≤ @a offset + @a length ≤ (lane size in bytes)
  */
void KeccakF_ParallelStateExtractAndXORBytesInLane(const void *states, unsigned int instanceIndex, unsigned int lanePosition, unsigned char *data, unsigned int offset, unsigned int length);

/** Function to retrieve data from one of the states and
  * to XOR them into the output buffer.
  * The bits to output are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * @param  states  Pointer to the states.
  * @param  instanceIndex   Index of the state instance from 0 to P-1
  *                         if there are P parallel instances.
  * @param  data    Pointer to the area where to XOR output data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by the lane size.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateExtractAndXORLanes(const void *states, unsigned int instanceIndex, unsigned char *data, unsigned int laneCount);

/** Function to retrieve data from all the parallel states in an interleaved fashion and
  * to XOR them into the output buffer.
  * The bits to output are restricted to start from the bit position 0 and
  * to span a whole number of lanes.
  * The first @a laneCount lanes from the first state instance are stored in @a data,
  * followed by the first @a laneCount lanes the second state instance,
  * and so on.
  * @param  states  Pointer to the states.
  * @param  data    Pointer to the area where to XOR output data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by the lane size and by the number of parallel state instances.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF_ParallelStateExtractAndXORLanesAll(const void *states, unsigned char *data, unsigned int laneCount);

#endif
