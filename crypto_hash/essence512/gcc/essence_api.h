/* FILE: essence_api.h
 *
 * AUTHOR: Jason Worth Martin <jason.worth.martin@gmail.com>
 *
 * DESCRIPTION: This file provides the declarations of the NIST API
 * and contains the configuration information for the algorithm
 * parameters and implementation parameters.
 *
 * COPYRIGHT (2008) Jason Worth Martin
 *
 * LICENSE: Please see the file LICENSE.TXT for license details.
 */
#ifndef _ESSENCE_API_H_
#define _ESSENCE_H_API_


/* *********************************************************************
 * *********************************************************************
 *
 *        ESSENCE Algorithm Parameters.
 *
 *
 * ESSENCE_COMPRESS_NUM_STEPS
 * --------------------------
 *
 * ESSENCE_COMPRESS_NUM_STEPS is the security parameter of the
 * algorithm.  It defines the number of iterations of the update logic
 * in the ESSENCE compression function.  The minimal secure value is
 * 24, and the value used should be a multiple of 8.  The maximum
 * value for this parameter is restricted to 128.  For the NIST
 * competition the value of this constant will be 24.
 *
 *
 * ESSENCE_MD_BLOCK_SIZE_IN_BYTES
 * ------------------------------
 *
 * A block is the largest unit of data that is hashed in strictly
 * serial Merkle-Damgaard fashion.  Block sizes must be multiples of
 * 64 to ensure that the resulting blocks have a data size in bits
 * that is divisible by 512.  This constant must be specified as a
 * "Long Long" data type to ensure correction compilation.  For the
 * NIST competition the value of this constant will be 1048576 which
 * is equal to 2^20.
 * 
 *
 *
 * ESSENCE_HASH_TREE_LEVEL
 * -----------------------
 *
 * The ESSENCE_HASH_TREE_LEVEL defines the "level" or "height" of the
 * Merkle hash trees used in the given implementation.  There is a
 * trade-off between serial and parallel performance.  Larger hash
 * trees allow for greater parallelism at the cost of a slower serial
 * implementation.  Likewise, smaller hash trees result in faster
 * serial implementations, but less parallelism.  The
 * ESSENCE_HASH_TREE_LEVEL changes the resulting value of the hash, so
 * it must be a fixed standard agreed upon for the given use.  The
 * number of blocks hashed within a given tree is
 * 2^ESSENCE_HASH_TREE_LEVEL (where the ^ symbol represents
 * exponentiation).  A tree height of zero has only one block per
 * tree.  This parameter is restricted to values between 0 and 255
 * inclusive.  (However, values greater than 2 have little practical
 * value for the computational power available to the average desktop
 * PC in 2008.)  For the NIST competition the value of this constant
 * will be 0.
 *
 *
 * ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT
 *                and
 * ESSENCE_ORGANIZATIONAL_BIG_CONSTANT
 * -------------------------------------
 *
 * The point of these two parameters is give an organization the
 * flexibility to produce implementations of the algorithm that are
 * unique to the organization, project, network, server etc.  The
 * choices of values for these to constants is arbitrary.  There are
 * no known "weak" choices.  NOTE: These values can not be considered
 * secret, proprietary, or otherwise protected since they can be
 * easily recovered from knowledge of the data and hash value.
 *
 * ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT is an unsigned 32-bit
 * integer.  For the NIST competition, the value for this constant
 * shall be 0xb7e15162 which is the first 8 hexadecimal digits of the
 * fractional part of the base-16 expansion of the Euler constant e.
 *
 * ESSENCE_ORGANIZATIONAL_BIG_CONSTANT is an unsigned 64-bit integer.
 * For the NIST competition, the value for this constant shall be
 * 0x8aed2a6abf715880 which is the next 16 hexadecimal digits of the
 * fractional part of the base-16 expansion of e.
 * 
 * *********************************************************************
 * ********************************************************************/
#define ESSENCE_COMPRESS_NUM_STEPS 32
#define ESSENCE_MD_BLOCK_SIZE_IN_BYTES 1048576LL
#define ESSENCE_HASH_TREE_LEVEL 0
#define ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT 0xb7e15162
#define ESSENCE_ORGANIZATIONAL_BIG_CONSTANT 0x8aed2a6abf715880LL






/* *********************************************************************
 * *********************************************************************
 *
 *        ESSENCE Implementation Options
 *
 *
 * ESSENCE_DEBUG_LEVEL
 * -------------------
 *
 * This controls the level of debugging code that is compiled in.  Level
 * zero prevents any debug code from being compiled, and does not require
 * that "stdio.h" and the corresponsing C libraries be available.  Each
 * bit of ESSENCE_DEBUG_LEVEL controls a different type of debugging
 * output.  The bits are given below in Little Endian order (i.e. bit 0
 * is the least significant bit).
 *
 *      ESSENCE_DEBUG_VALUE bit         Output/Notes
 *      -----------------------         ------------
 *                    0                 The hash "state" variable is
 *                                      printed at the end of every call
 *                                      to Init, Update, or Final.
 *
 *                    1                 The hash state is printed at the
 *                                      end of every call to
 *                                      Merge_Tree_256 or
 *                                      Merge_Tree_512.
 *
 *                    2                 The hash state is printed at the
 *                                      end of every call to Join_256 or
 *                                      Join_512.
 *
 *                    3                 The values of all intermediate
 *                                      computations are printed within
 *                                      the compression functions.  NOTE:
 *                                      this level of output is only
 *                                      available with basic C language
 *                                      versions of the compression
 *                                      functions.  It is not supported in
 *                                      the constant time versions or in
 *                                      the assembly language versions.
 *                                      Also note that this will generate
 *                                      a tremendous amount of output!
 *                                      If you select this option, then
 *                                      it will override all the other
 *                                      constants.
 *
 *
 *
 * ESSENCE_USE_PARALLEL_CODE
 * -------------------------
 *
 * If ESSENCE_USE_PARALLEL_CODE is set to 1, the we will assume that
 * the code is being compiled using OpenMP for a target with large
 * memory and CPU resources.  This will enable options that optimize
 * for speed on large, highly-parallel platforms.  However, these
 * options are much slower on resource-limited platforms, so the
 * default option is 0.
 *
 *
 * ESSENCE_ASSUME_LITTLE_ENDIAN
 * ----------------------------
 *
 * If this option is set to 1, then we assume that we are on a Little
 * Endian platform and optimize accordingly.
 *
 * *********************************************************************
 * ********************************************************************/
#define ESSENCE_DEBUG_LEVEL 0x00
#define ESSENCE_USE_PARALLEL_CODE 0
#define ESSENCE_ASSUME_LITTLE_ENDIAN 0


/* *********************************************************************
 *
 * The following macros will replace the calls to the compression
 * functions with implementation specific versions.
 *
 * ********************************************************************/
#define ESSENCE_COMPRESS_512(a,b,c,d) \
  essence_compress_512((a),(b),(c),(d))

#define ESSENCE_COMPRESS_256(a,b,c,d) \
  essence_compress_256((a),(b),(c),(d))

#define ESSENCE_COMPRESS_256_DUAL(a,b,c,d,e,f)	\
  essence_compress_256_dual((a),(b),(c),(d),(e),(f))



/* *********************************************************************
 *
 *        Data definitions required for the NIST API
 *
 *
 * The NIST API is using 0-based big-endian indexing within each byte,
 * so BIT 0 is the MOST SIGNIFICANT bit of the byte.  For example, if
 * we have the following array of bits:
 *
 * byte 0    |  byte 1   |  byte 2   |  byte 3   |
 *     |           |           |           |
 *     V           V           V           V
 * 0000 0001 | 0010 0011 | 0100 0101 | 0110 0111 |
 *                    ^                  ^
 *                    |                  |
 *                 bit 14             bit 26
 * 
 * bit 14 is bit number 6 of byte number 1
 * bit 26 is bit number 2 of byte number 3
 *
 * ********************************************************************/


/*
 * Here we include stdint.h to get uint64_t and friends defined.
 *
 * If we are working on a system that doesn't support stdint.h, then
 * we'll need to manually define types of the correct size right here.
 */
#include <stdint.h>


/*
 * BitSequence is just a byte
 */
typedef unsigned char BitSequence;
typedef unsigned char byte;




/*
 * DataLength is just an unsigned 64-bit integer
 */
typedef uint64_t DataLength;




/*
 * Hash Return values are our error codes
 *
 * SUCCESS:  No errors detected.
 *
 * FAIL: An error occured.  (This is an ambiguous return value and
 * will be avoided in favor of more specific failure conditions.
 * However, it may be used as a catch-all return code when the exact
 * cause of the failure cannot be determined.)
 *
 * BAD_HASHBITLEN: The calling function has requested an invalid bit
 * length for the hash.  Valid hashbitlen values are integers between
 * 128 and 512 inclusive (hashbitlen is not required to be a multiple
 * of 8).
 *
 * DATA_ALIGNMENT_ERROR: The NIST API specifies that the data bit
 * length given to the Update function will be a multiple of 8, except
 * perhaps, for the last chunck of data to be hashed.  In other words,
 * if Update received a call with data bit length not a multiple of 8,
 * then it cannot receive another call in that hashing session.  A
 * call to Final and then Init must preceed any other calls to Update.
 */
typedef enum {
  SUCCESS = 0,
  FAIL = 1,
  BAD_HASHBITLEN = 2,
  DATA_ALIGNMENT_ERROR = 3
} HashReturn;


/*
 * The Hash State structure holds all the intermediate
 * values we need.  It consists of:
 *
 * running_hash -- An array of 8 64-bit unsigned integers used to hold
 *                 the running hash value.  All we really need here is
 *                 an array of 64 bytes, but we use an array of 64-bit
 *                 integers to force the compiler to align the array
 *                 to an 8-byte boundary.  This gives us faster memory
 *                 access.  THIS MUST BE INITIALIZED TO DIGITS OF PI.
 *
 * chain_vars -- An array of 8 64-bit unsigned integers used to hold
 *               the chaining variables.  All we really need here is
 *               an array of 64 bytes, but we use an array of 64-bit
 *               integers to force the compiler to align the array to
 *               an 8-byte boundary.  This gives us faster memory
 *               access.  Does NOT need to be intialized.
 *
 * MDBIV_init -- An array of 8 64-bit unsigned integers used to hold
 *               the Merkle-Damgaard Block Initialization Vector
 *               (MDBIV).  This could actually be an array of 64 bytes
 *               but we want to force alignment for speed.
 *               THIS MUST BE INITIALIZED AS DESCRIBED BELOW.
 *
 *       The MDBIV has the following format:
 *
 *       Bytes 0-7: An unsigned 64-bit integer representing the block
 *                  number in LITTLE ENDIAN format.  Initialize to
 *                  zero.
 *
 *       Bytes 8-15: An unsigned 64-bit integer representing the
 *                   number of bytes used in each MD block.  This
 *                   integer is in LITTLE ENDIAN format.  This is the
 *                   ESSENCE_MD_BLOCK_SIZE_IN_BYTES constant.
 * 
 *       Byte 16-17: An unsigned 16-bit integer representing the size,
 *                   in bits, of the hash requested.  This integer is
 *                   in LITTLE ENDIAN format.  This value is taken
 *                   from the hashbitlen value.
 *
 *       Byte 18: An unsigned 8-bit integer representing the number of
 *                steps the update logic in the compression function
 *                will use.  This is the ESSENCE_COMPRESS_NUM_STEPS
 *                constant.
 *
 *       Byte 19: An unsigned 8-bit integer representing the level of
 *                the Merkle hash trees to be used.  This is the
 *                ESSENCE_HASH_TREE_LEVEL constant.
 *
 *       Bytes 20-23: An unsigned 32-bit integer.  This integer is in
 *                    LITTLE ENDIAN format.  This value is take from
 *                    the ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT
 *                    constant.
 *      
 *       Bytes 24-31: An unsigned 64-bit integer.  This integer is in
 *                    LITTLE ENDIAN format.  This value is take from
 *                    the ESSENCE_ORGANIZATIONAL_BIG_CONSTANT
 *                    constant.
 *
 *               Bytes 32-63
 *               -----------
 *
 *               These bytes are only used for the 512-bit compression
 *               function.  In which case, they are initialized from
 *               the hexadecimal expansion of the fractional part of
 *               pi.  They are as follows:
 *
 *       Bytes 32-39: The unsigned 64-bit integer constant
 *                    0x452821e638d01377 in LITTLE ENDIAN.
 *
 *       Bytes 40-47: The unsigned 64-bit integer constant
 *                    0xbe5466cf34e90c6c in LITTLE ENDIAN.
 *
 *       Bytes 48-55: The unsigned 64-bit integer constant
 *                    0xc0ac29b7c97c50dd in LITTLE ENDIAN.
 *
 *       Bytes 56-63: The unsigned 64-bit integer constant
 *                    0x3f84d5b5b5470917 in LITTLE ENDIAN.
 *
 *                      
 *
 *
 * merkle_tree_hashes -- This is the storage location for our
 *                       intermediate hash results used in the hash
 *                       trees.  This could just be an array of bytes,
 *                       but we force it to to be an array of 64-bit
 *                       integers for optimal memory alignment.  NOTE:
 *                       If ESSENCE_HASH_TREE_LEVEL is set to zero,
 *                       then this space is not actually needed, so we
 *                       make it conditionally compiled.  Does NOT
 *                       need to be initialized.
 *
 * last_md_block_number -- This 64-bit unsigned integer is the block
 *                         number of the last block that was hashed
 *                         completely.  MUST BE INITIALIZED TO ALL
 *                         ONES.
 *
 * current_md_block_datalen -- The length, in bits, of the data that
 *                             hash been hashed so far in the current
 *                             Merkle-Damgaard block.  MUST BE
 *                             INITIALIZED TO ZERO.
 *
 * residual_data -- Data remaining from the last call to Update which
 *                  wasn't processed and is being saved for the next
 *                  call to Update.  Again, this need only be an array
 *                  of bytes, but we force the alignment with 64-bit
 *                  integers.  Does NOT need to be initialized.
 *
 * residual_data_bitlen -- The length, in bits, of the residual_data.
 *                         We are in the middle of hashing a block if
 *                         and only if this is non-zero.  MUST BE
 *                         INITIALIZED TO ZERO.
 *
 * hashbitlen -- The size, in bits, of the hash to be returned.  MUST
 *               BE INITIALIZED TO THE HASH BIT LENGTH.
 *
 * within_md_block -- An integer used as a boolean flag to indicate if
 *                    the hashing is currently within a
 *                    Merkle-Damgaard block or not.  (A value of 1
 *                    indicates that the current hash state is within
 *                    a MD block.  A value of zero indicates
 *                    otherwise.)  MUST BE INITIALIZED TO ZERO.
 *
 * NOTE: The order of the variables declared in the struct is very
 *       important.  Since some compilers allocate space in the same
 *       order that the variables are declared, we need to list the
 *       larger data items first to maintain 64-bit alignment.
 *       Otherwise, we pay a speed penalty for unaligned memory
 *       accesses.
 *
 */
typedef struct{
  uint64_t running_hash[8];
  uint64_t chain_vars[8];
  uint64_t MDBIV_init[8];
#if ESSENCE_HASH_TREE_LEVEL > 0
  uint64_t merkle_tree_hashes[8*(ESSENCE_HASH_TREE_LEVEL)];
#endif
  uint64_t last_md_block_number;
  uint64_t current_md_block_datalen;
  uint64_t residual_data[8];
  int residual_data_bitlen;
  int hashbitlen;
  int within_md_block;
} hashState;



/* *********************************************************************
 *
 *          Function declarations required for NIST API
 *
 * ********************************************************************/

/*
 * HashReturn Init(hashState *state,
 *                 int hashbitlen)
 *
 * state -- a structure that holds the hashState information
 *
 * hashbitlen -- an integer value that indicates the length of the
 *               hash output in bits.
 *
 * Initializes the hash state structure.
 *
 */
HashReturn Init(hashState *,
		int);


/*
 * HashReturn Update(hashState *state,
 *                   const BitSequence *data,
 *                   DataLength databitlen)
 *
 * state -- a structure that holds the hashState information
 *
 * data -- the data to be hashed
 *
 * databitlen -- the length, in bits, of the data to be hashed
 *
 * Updates the hash state structure with the given data.
 */
HashReturn Update(hashState *,
		  const BitSequence *,
		  DataLength);



/*
 * HashReturn Final(hashState *state,
 *                  BitSequence *hashval)
 *
 * state -- a structure that holds the hashState information
 *
 * hashval -- the storage for the final hash value to be returned
 *
 * Completes the hashing algorithm and returns the final hash
 * value to hashval
 */
HashReturn Final(hashState *,
		 BitSequence *);



/*
 * HashReturn Hash(int hashbitlen,
 *                 const BitSequence *data,
 *                 DataLength databitlen,
 *                 BitSequence *hashval)
 *
 * hashbitlen -- an integer value that indicates the length of the
 *               hash output in bits.
 *
 * data -- the data to be hashed
 *
 * databitlen -- the length, in bits, of the data to be hashed
 *
 * hashval -- the storage for the final hash value to be returned
 *
 */
HashReturn Hash(int,
		const BitSequence*,
		DataLength,
		BitSequence *);


/*
 * PrintState(hashState *state)
 *
 * state -- the hash state
 *
 * DESCRIPTION: Print the hash state information to stdout.  All of
 * the arrays are treated as arrays of bytes, and they are printed
 * sequentially.  This function is provided for debugging purposes.
 *
 */
void PrintState(hashState *);





#endif /* _ESSENCE_H_API_ */
