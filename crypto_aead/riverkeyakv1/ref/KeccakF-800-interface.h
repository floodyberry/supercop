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

#ifndef _KeccakF800Interface_h_
#define _KeccakF800Interface_h_

#define KeccakF_width 800
#define KeccakF_laneInBytes 4
#define KeccakF_stateSizeInBytes (KeccakF_width/8)

/** Function called at least once before any use of the other KeccakF800_* 
  * functions, possibly to initialize global variables.
  */
void KeccakF800_Initialize( void );

/** Function to initialize the state to the logical value 0^800.
  * @param  state   Pointer to the state to initialize.
  */
void KeccakF800_StateInitialize(void *state);

/** Function to XOR data given as bytes into the state. 
  * The bits to modify are restricted to be consecutive and to be in the same lane.
  * The bit positions that are affected by this function are 
  * from @a lanePosition*32 + @a offset*8
  * to @a lanePosition*32 + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  state   Pointer to the state.
  * @param  lanePosition    Index of the lane to be modified (x+5*y, 
  *                         or bit position divided by 32).
  * @param  data    Pointer to the input data.
  * @param  offset  Offset in bytes within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < 4
  * @pre    0 ≤ @a offset + @a length ≤ 4
  */
void KeccakF800_StateXORBytesInLane(void *state, unsigned int lanePosition, const unsigned char *data, unsigned int offset, unsigned int length);

/** Function to XOR data given as bytes into the state.
  * The bits to modify are restricted to start from the bit position 0 and 
  * to span a whole number of lanes (i.e., multiple of 4 bytes).
  * @param  state   Pointer to the state.
  * @param  data    Pointer to the input data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by 32 bits.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF800_StateXORLanes(void *state, const unsigned char *data, unsigned int laneCount);

/** Function to overwrite data given as bytes into the state.
  * The bits to modify are restricted to be consecutive and to be in the same lane.
  * The bit positions that are affected by this function are
  * from @a lanePosition*32 + @a offset*8
  * to @a lanePosition*32 + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  state   Pointer to the state.
  * @param  lanePosition    Index of the lane to be modified (x+5*y,
  *                         or bit position divided by 32).
  * @param  data    Pointer to the input data.
  * @param  offset  Offset in bytes within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < 4
  * @pre    0 ≤ @a offset + @a length ≤ 4
  */
void KeccakF800_StateOverwriteBytesInLane(void *state, unsigned int lanePosition, const unsigned char *data, unsigned int offset, unsigned int length);

/** Function to overwrite data given as bytes into the state.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of lanes (i.e., multiple of 4 bytes).
  * @param  state   Pointer to the state.
  * @param  data    Pointer to the input data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by 32 bits.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF800_StateOverwriteLanes(void *state, const unsigned char *data, unsigned int laneCount);

/** Function to overwrite bytes in the state with zeroes.
  * The bits to modify are restricted to start from the bit position 0 and
  * to span a whole number of bytes.
  * @param  state   Pointer to the state.
  * @param  byteCount   The number of bytes, i.e., the length of the data
  *                     divided by 8 bits.
  * @pre    0 ≤ @a byteCount ≤ 100
  */
void KeccakF800_StateOverwriteWithZeroes(void *state, unsigned int byteCount);

/** Function to complement the value of a given bit in the state.
  * This function is typically used to XOR the second bit of the multi-rate
  * padding into the state.
  * @param  state   Pointer to the state.
  * @param  position    The position of the bit to complement.
  * @pre    0 ≤ @a position < 800
  */
void KeccakF800_StateComplementBit(void *state, unsigned int position);

/** Function to apply Keccak-f[800] on the state.
  * @param  state   Pointer to the state.
  */
void KeccakF800_StatePermute(void *state);

/** Function to retrieve data from the state into bytes.
  * The bits to output are restricted to be consecutive and to be in the same lane.
  * The bit positions that are retrieved by this function are 
  * from @a lanePosition*32 + @a offset*8 
  * to @a lanePosition*32 + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  state   Pointer to the state.
  * @param  lanePosition    Index of the lane to be read (x+5*y, 
  *                         or bit position divided by 32).
  * @param  data    Pointer to the area where to store output data.
  * @param  offset  Offset in byte within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < 4
  * @pre    0 ≤ @a offset + @a length ≤ 4
  */
void KeccakF800_StateExtractBytesInLane(const void *state, unsigned int lanePosition, unsigned char *data, unsigned int offset, unsigned int length);

/** Function to retrieve data from the state into bytes.
  * The bits to output are restricted to start from the bit position 0 and 
  * to span a whole number of lanes (i.e., multiple of 4 bytes).
  * @param  state   Pointer to the state.
  * @param  data    Pointer to the area where to store output data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by 32 bits.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF800_StateExtractLanes(const void *state, unsigned char *data, unsigned int laneCount);

/** Function to retrieve data from the state into bytes and
  * to XOR them into the output buffer.
  * The bits to output are restricted to be consecutive and to be in the same lane.
  * The bit positions that are retrieved by this function are
  * from @a lanePosition*32 + @a offset*8
  * to @a lanePosition*32 + @a offset*8 + @a length*8.
  * (The bit positions, the x,y,z coordinates and their link are defined in the "Keccak reference".)
  * @param  state   Pointer to the state.
  * @param  lanePosition    Index of the lane to be read (x+5*y,
  *                         or bit position divided by 32).
  * @param  data    Pointer to the area where to XOR output data.
  * @param  offset  Offset in byte within the lane.
  * @param  length  Number of bytes.
  * @pre    0 ≤ @a lanePosition < 25
  * @pre    0 ≤ @a offset < 4
  * @pre    0 ≤ @a offset + @a length ≤ 4
  */
void KeccakF800_StateExtractAndXORBytesInLane(const void *state, unsigned int lanePosition, unsigned char *data, unsigned int offset, unsigned int length);

/** Function to retrieve data from the state into bytes and
  * to XOR them into the output buffer.
  * The bits to output are restricted to start from the bit position 0 and
  * to span a whole number of lanes (i.e., multiple of 4 bytes).
  * @param  state   Pointer to the state.
  * @param  data    Pointer to the area where to XOR output data.
  * @param  laneCount   The number of lanes, i.e., the length of the data
  *                     divided by 32 bits.
  * @pre    0 ≤ @a laneCount ≤ 25
  */
void KeccakF800_StateExtractAndXORLanes(const void *state, unsigned char *data, unsigned int laneCount);

/** Function to sequentially XOR data bytes, apply the Keccak-f[800] 
  * permutation and retrieve data bytes from the state.
  * The bits to modify and to output are restricted to start from the bit 
  * position 0 and  to span a whole number of lanes (i.e., multiple of 4 bytes).
  * Its effect should be functionally identical to calling in order:
  * - KeccakF800_StateXORLanes(state, inData, inLaneCount);
  * - KeccakF800_StatePermute(state);
  * - KeccakF800_StateExtractLanes(state, outData, outLaneCount);
  * @param  state   Pointer to the state.
  * @param  inData  Pointer to the input data.
  * @param  inLaneCount The number of lanes, i.e., the length of the input data
  *                     divided by 32 bits.
  * @param  outData Pointer to the area where to store output data.
  * @param  outLaneCount    The number of lanes, i.e., the length of the output data
  *                     divided by 32 bits.
  * @pre    0 ≤ @a inLaneCount ≤ 25
  * @pre    0 ≤ @a outLaneCount ≤ 25
  */
void KeccakF800_StateXORPermuteExtract(void *state, const unsigned char *inData, unsigned int inLaneCount, unsigned char *outData, unsigned int outLaneCount);

#endif
