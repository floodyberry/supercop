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

#ifndef _KeccakParallelDuplex_h_
#define _KeccakParallelDuplex_h_

#include "KeccakF-interface.h"
#include "NumberOfParallelInstances.h"

#ifdef ALIGN
#undef ALIGN
#endif

#if defined(__GNUC__)
#define ALIGN __attribute__ ((aligned(32)))
#elif defined(_MSC_VER)
#define ALIGN __declspec(align(32))
#else
#define ALIGN
#endif

/**
  * Structure that contains several parallel duplex instances for use with the
  * Keccak_ParallelDuplex* functions.
  * It gathers the states processed by the permutation as well as
  * the rate and input/output queue indexes.
  */
ALIGN typedef struct Keccak_ParallelDuplexInstancesStruct {
    /** The states processed by the permutation. */
    ALIGN unsigned char states[NumberOfParallelInstances*KeccakF_stateSizeInBytes];
    /** The value of the rate in bits.*/
    unsigned int rate;
    /** The position in the state of the next byte to be input for each instance. */
    unsigned int byteInputIndex[NumberOfParallelInstances];
    /** The position in the state of the next byte to be output for each instance. */
    unsigned int byteOutputIndex[NumberOfParallelInstances];
} Keccak_ParallelDuplexInstances;

/**
  * Function to initialize parallel duplex objects Duplex[Keccak-f[r+c], pad10*1, r].
  * @param  instances   Pointer to the duplex objects to be initialized.
  * @param  rate        The value of the rate r.
  * @param  capacity    The value of the capacity c.
  * @pre    One must have r+c equal to the supported width of this implementation.
  * @pre    3 ≤ @a rate ≤ width, and otherwise the value of the rate is unrestricted.
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexInitializeAll(Keccak_ParallelDuplexInstances *instances, unsigned int rate, unsigned int capacity);

/**
  * Function to make a duplexing call to one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  delimitedSigmaEnd   Byte containing from 0 to 7 trailing bits that must be
  *                     appended to the input data already fed.
  *                     These <i>n</i>=|σ| mod 8 bits must be in the least significant bit positions.
  *                     These bits must be delimited with a bit 1 at position <i>n</i>
  *                     (counting from 0=LSB to 7=MSB) and followed by bits 0
  *                     from position <i>n</i>+1 to position 7.
  * @note   The input bits σ are the result of the concatenation of
  *                     the bytes given in Keccak_ParallelDuplexingFeed*()
  *                     and Keccak_ParallelDuplexingOverwrite*()
  *                     calls since the last call to Keccak_ParallelDuplexing*(),
  *                     and the bits in @a delimitedSigmaEnd before the delimiter.
  * @pre    @a delimitedSigmaEnd ≠ 0x00
  * @pre    <i>n</i> + length of previously queued data ≤ (r-2)
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexing(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned char delimitedSigmaEnd);

/**
  * Function to make a duplexing call to all the duplex objects in parallel.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  delimitedSigmaEnd   Byte containing from 0 to 7 trailing bits that must be
  *                     appended to the input data already fed.
  *                     These <i>n</i>=|σ| mod 8 bits must be in the least significant bit positions.
  *                     These bits must be delimited with a bit 1 at position <i>n</i>
  *                     (counting from 0=LSB to 7=MSB) and followed by bits 0
  *                     from position <i>n</i>+1 to position 7.
  * @note   The input bits σ are the result of the concatenation of
  *                     the bytes given in Keccak_ParallelDuplexingFeed*()
  *                     and Keccak_ParallelDuplexingOverwrite*()
  *                     calls since the last call to Keccak_ParallelDuplexing*(),
  *                     and the bits in @a delimitedSigmaEnd before the delimiter.
  * @pre    @a delimitedSigmaEnd ≠ 0x00
  * @pre    <i>n</i> + length of previously queued data ≤ (r-2)
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingAll(Keccak_ParallelDuplexInstances *instances, unsigned char delimitedSigmaEnd);

/**
  * Function to queue input data that will subsequently used in the next
  * call to Keccak_ParallelDuplexing*(), in an interleaved fashion.
  * For a ρ = 8*floor((rate-2)/8),
  * it spreads the first bytes onto the first instance until ρ/8 bytes are queued,
  * then the next bytes onto the second instance until ρ/8 bytes are queued,
  * and so on.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  in  Pointer to the bytes to queue.
  * @param  inByteLen   The number of input bytes provided in @a in.
  * @pre    For each instance, the total number of input bytes since the last
  *         Keccak_ParallelDuplexing*() call must not be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingFeedPartialInterleavedInput(Keccak_ParallelDuplexInstances *instances, const unsigned char *in, unsigned int inByteLen);

/**
  * Function to queue input data that will subsequently used in the next
  * call to Keccak_ParallelDuplexing*(), for one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @param  in  Pointer to the bytes to queue.
  * @param  inByteLen   The number of input bytes provided in @a in.
  * @pre    The total number of input bytes since the last
  *         Keccak_ParallelDuplexing*() call must not be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingFeedPartialSingleInput(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, const unsigned char *in, unsigned int inByteLen);

/**
  * Function to queue input data that will subsequently used in the next
  * call to Keccak_ParallelDuplexing*(), for one of the duplex objects,
  * where the data here consist of all-zero bytes.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @param  inByteLen   The number of input bytes 0x00 to feed.
  * @pre    The total number of input bytes since the last
  *         Keccak_ParallelDuplexing*() call must not be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingFeedZeroes(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned int inByteLen);

/**
  * Function to queue input data that will subsequently used in the next
  * call to Keccak_ParallelDuplexing*(), with the additional pre-processing that
  * the input data is first XORed with the output data of the previous duplexing
  * call at the same offset.
  * In practice, this comes down to overwriting the input data in the state
  * of the duplex object.
  * This is done in an interleaved fashion for all duplex objects.
  * For a ρ = 8*floor((rate-2)/8),
  * it spreads the first bytes onto the first instance until ρ/8 bytes are queued,
  * then the next bytes onto the second instance until ρ/8 bytes are queued,
  * and so on.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  in  Pointer to the bytes to queue, before they are XORed.
  * @param  inByteLen   The number of input bytes provided in @a in.
  * @pre    For each instance, the total number of input bytes since the last
  *         Keccak_ParallelDuplexing*() call must not be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingOverwritePartialInterleavedInput(Keccak_ParallelDuplexInstances *instances, const unsigned char *in, unsigned int inByteLen);

/**
  * Function to queue input data that will subsequently used in the next
  * call to Keccak_ParallelDuplexing*(), with the additional pre-processing that
  * the input data is first XORed with the output data of the previous duplexing
  * call at the same offset.
  * In practice, this comes down to overwriting the input data in the state
  * of the duplex object.
  * This is done for one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @param  in  Pointer to the bytes to queue, before they are XORed.
  * @param  inByteLen   The number of input bytes provided in @a in.
  * @pre    The total number of input bytes since the last
  *         Keccak_ParallelDuplexing*() call must not be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingOverwritePartialSingleInput(Keccak_ParallelDuplexInstances *instances,  unsigned int instanceIndex, const unsigned char *in, unsigned int inByteLen);

/**
  * Function to queue input data for the next call to Keccak_ParallelDuplexing*()
  * that is equal to the output data of the previous duplexing call at the same offset.
  * In practice, this comes down to overwriting with zeroes the state
  * of the duplex object.
  * This is done for one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @param  inByteLen   The number of bytes to overwrite with zeroes.
  * @pre    The total number of input bytes since the last
  *         Keccak_ParallelDuplexing*() call must not be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingOverwriteWithZeroes(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned int inByteLen);

/**
  * Function to fetch output data beyond those that were already output since
  * the last call to Keccak_ParallelDuplexing*() for all the duplex objects
  * in an interleaved fashion.
  * For a ρ = 8*floor((rate-2)/8),
  * it takes the first bytes from the first instance until ρ/8 bytes are fetched,
  * then the next bytes from the second instance until ρ/8 bytes are fetched,
  * and so on.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  out             Pointer to the buffer where to store the output data.
  * @param  outByteLen      The number of output bytes desired.
  * @pre    For each instance, the total number of output bytes, taken since
  *         the last call to Keccak_ParallelDuplexing() cannot be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingGetFurtherInterleavedOutput(Keccak_ParallelDuplexInstances *instances, unsigned char *out, unsigned int outByteLen);

/**
  * Function to fetch output data beyond those that were already output since
  * the last call to Keccak_ParallelDuplexing*() for one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @param  out             Pointer to the buffer where to store the output data.
  * @param  outByteLen      The number of output bytes desired.
  * @pre    The total number of output bytes, taken since
  *         the last call to Keccak_ParallelDuplexing() cannot be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingGetFurtherSingleOutput(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned char *out, unsigned int outByteLen);

/**
  * Function to fetch output data beyond those that were already output since
  * the last call to Keccak_ParallelDuplexing*() for all the duplex objects
  * in an interleaved fashion, with the additional post-processing that this data
  * is XORed into the given buffer.
  * For a ρ = 8*floor((rate-2)/8),
  * it takes the first bytes from the first instance until ρ/8 bytes are fetched,
  * then the next bytes from the second instance until ρ/8 bytes are fetched,
  * and so on.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  out             Pointer to the buffer where to XOR the output data.
  * @param  outByteLen      The number of output bytes desired.
  * @pre    For each instance, the total number of output bytes, taken since
  *         the last call to Keccak_ParallelDuplexing() cannot be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingGetFurtherInterleavedOutputAndXOR(Keccak_ParallelDuplexInstances *instances, unsigned char *out, unsigned int outByteLen);

/**
  * Function to fetch output data beyond those that were already output since
  * the last call to Keccak_ParallelDuplexing*() for one of the duplex objects,
  * with the additional post-processing that this data is XORed into the given buffer.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @param  out             Pointer to the buffer where to XOR the output data.
  * @param  outByteLen      The number of output bytes desired.
  * @pre    The total number of output bytes, taken since
  *         the last call to Keccak_ParallelDuplexing() cannot be higher than floor((rate-2)/8).
  * @return Zero if successful, 1 otherwise.
  */
int Keccak_ParallelDuplexingGetFurtherSingleOutputAndXOR(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned char *out, unsigned int outByteLen);

/**
  * Function that returns the number of bytes queued for the next call
  * to Keccak_ParallelDuplexing*() for all the duplex objects,
  * so summing over all objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @return The number of bytes queued.
  */
unsigned int Keccak_ParallelDuplexGetTotalInputIndex(Keccak_ParallelDuplexInstances *instances);

/**
  * Function that returns the number of bytes queued for the next call
  * to Keccak_ParallelDuplexing*() for one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @return The number of bytes queued.
  */
unsigned int Keccak_ParallelDuplexGetInputIndex(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex);

/**
  * Function that returns the number of bytes already returned since the previous
  * call to Keccak_ParallelDuplexing*() for one of the duplex objects.
  * @param  instances   Pointer to the duplex objects initialized
  *                     by Keccak_ParallelDuplexInitializeAll().
  * @param  instanceIndex   Index of the duplex object from 0 to P-1
  *                         if there are P parallel objects.
  * @return The number of bytes already returned.
  */
unsigned int Keccak_ParallelDuplexGetOutputIndex(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex);

#endif
