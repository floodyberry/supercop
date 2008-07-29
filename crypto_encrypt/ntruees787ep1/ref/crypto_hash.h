/******************************************************************************
 * Copyright (C) 2006 by                             NTRU Cryptosystems, Inc. *
 *                        ---ALL RIGHTS RESERVED---                           *
 *                                                                            *
 * This software is proprietary and confidential to NTRU Cryptosystems, Inc., *
 * is furnished under a license and may be used and copied only in accordance *
 * with the terms of such license and with the inclusion of the above         *
 * copyright notice. This software or any other copies thereof may not be     *
 * provided or otherwise made available to any other person. No title to and  *
 * ownership of the software is hereby transferred.                           *
 *                                                                            *
 * The information in this software is subject to change without notice       *
 * and should not be construed as a commitment by NTRU Cryptosystems, Inc.    *
 *                                                                            *
 ******************************************************************************/
/******************************************************************************
 *
 * File: crypto_hash.h
 *
 * Contents: Definitions and declarations for the hash object abstraction.
 *
 *****************************************************************************/

#ifndef CRYPTO_HASH_H
#define CRYPTO_HASH_H

#include "crypto_platform.h"
#include "crypto_config.h"
#include "crypto_error.h"
#include "crypto_hash_basics.h"

#if defined(SHA_1)
#include "crypto_sha1.h"
#endif

#if defined(SHA_256)
#include "crypto_sha256.h"
#endif


/***************
 * error macro *
 ***************/

#define HASH_RET(r)      return ((r) ? HASH_ERROR_BASE + (r) : (r))


/*************************
 * structure definitions *
 *************************/

/* _CRYPTO_HASH_ALG_PARAMS
 *
 * An opaque forward declaration for a private structure used
 * internally by the hash object interface.
 */

struct _CRYPTO_HASH_ALG_PARAMS;


/* CRYPTO_HASH_CTX
 *
 * Hash object context information.
 */

typedef struct {
    struct _CRYPTO_HASH_ALG_PARAMS const *alg_params;
    union {
#if defined(SHA_1)
        SHA1_CTX    sha1;
#endif
#if defined(SHA_256)
        SHA2_CTX    sha256;
#endif
    } alg_ctx;
} CRYPTO_HASH_CTX;


/*************************
 * function declarations *
 *************************/

/* crypto_hash_set_alg
 *
 * Sets the hash algorithm for the hash context.  This must be called before
 * any calls to crypto_hash_block_length(), crypto_hash_digest_length(), or
 * crypto_hash_init() are made.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the specified algorithm is not supported.
 */

extern uint32_t
crypto_hash_set_alg(
    CRYPTO_HASH_ALGID   algid,      //      in - hash algoirithm to be used
    CRYPTO_HASH_CTX    *c);         //  in/out - pointer to the hash context


/* crypto_hash_block_length
 *
 * Gets the number of bytes in an input block for the hash algorithm
 * specified in the hash context.  The hash algorithm must have been set
 * in the hash context with a call to crypto_hash_set_alg() prior to
 * calling this function.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

extern uint32_t
crypto_hash_block_length(
   CRYPTO_HASH_CTX *c,              //  in - pointer to the hash context
   uint16_t        *blk_len);       // out - address for block length in bytes
    

/* crypto_hash_digest_length
 *
 * Gets the number of bytes needed to hold the message digest for the
 * hash algorithm specified in the hash context.  The algorithm must have
 * been set in the hash context with a call to crypto_hash_set_alg() prior
 * to calling this function.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

extern uint32_t
crypto_hash_digest_length(
   CRYPTO_HASH_CTX *c,              //  in - pointer to the hash context
   uint16_t        *md_len);        // out - address for digest length in bytes
    

/* crypto_hash_init
 *
 * This routine initializes the hash state.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

extern uint32_t
crypto_hash_init(
   CRYPTO_HASH_CTX *c);             // in/out - pointer to hash context


/* crypto_hash_update
 *
 * This routine processes input data and updates the hash calculation.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_OVERFLOW if too much text has been fed to the
 *         hash algorithm. The size limit is dependent on the hash algorithm,
 *         and not all algorithms have this limit.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

extern uint32_t
crypto_hash_update(
   CRYPTO_HASH_CTX *c,              // in/out - pointer to hash context
   uint8_t const   *data,           //     in - pointer to input data
   uint32_t         data_len);      //     in - number of bytes of input data


/* crypto_hash_final
 *
 * This routine completes the hash calculation and returns the message digest.
 * 
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

extern uint32_t
crypto_hash_final(
   CRYPTO_HASH_CTX *c,              // in/out - pointer to hash context
   uint8_t         *md);            //   out  - address for message digest


/* crypto_hash_final_zero_pad
 *
 * This routine completes the hash calculation using zero padding and
 * returns the message digest.
 * 
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

extern uint32_t
crypto_hash_final_zero_pad(
   CRYPTO_HASH_CTX *c,              // in/out - pointer to hash context
   uint8_t         *md);            //   out  - address for message digest


/* crypto_hash_digest
 *
 * This routine computes a message digest. It is assumed that the
 * output buffer md is large enough to hold the output (see
 * crypto_hash_digest_length)
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_OVERFLOW if too much text has been fed to the
 *         hash algorithm. The size limit is dependent on the hash algorithm,
 *         and not all algorithms have this limit.
 * Returns CRYPTO_HASH_BAD_ALG if the specified algorithm is not supported.
 */

extern uint32_t
crypto_hash_digest(
   CRYPTO_HASH_ALGID    algid,      //  in - the hash algorithm to use
   uint8_t const       *data,       //  in - pointer to input data
   uint32_t             data_len,   //  in - number of bytes of input data
   uint8_t             *md);        // out - address for message digest


#endif /* CRYPTO_HASH_H */
