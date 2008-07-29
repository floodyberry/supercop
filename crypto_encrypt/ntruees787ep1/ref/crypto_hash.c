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
 * File: crypto_hash.c
 *
 * Contents: Routines implementing the hash object abstraction.
 *
 *****************************************************************************/


#include <stdlib.h>
#include "crypto_config.h"

#if defined(HASH)
#include "crypto_hash.h"


typedef uint32_t (*CRYPTO_HASH_INIT_FN)(
    void        *c);
typedef uint32_t (*CRYPTO_HASH_UPDATE_FN)(
    void        *c,
    void const  *data,
    uint32_t     len);
typedef uint32_t (*CRYPTO_HASH_FINAL_FN)(
    void        *c,
    void        *md);

typedef struct _CRYPTO_HASH_ALG_PARAMS {
    uint8_t                 algid;
    uint16_t                block_length;
    uint16_t                digest_length;
    CRYPTO_HASH_INIT_FN     init;
    CRYPTO_HASH_UPDATE_FN   update;
    CRYPTO_HASH_FINAL_FN    final;
    CRYPTO_HASH_FINAL_FN    final_zero_pad;
} CRYPTO_HASH_ALG_PARAMS;

static CRYPTO_HASH_ALG_PARAMS const algs_params[] = {
#if defined(SHA_1)
    {
        CRYPTO_HASH_ALGID_SHA1,
        SHA_1_BLK_LEN,
        SHA_1_MD_LEN,
        (CRYPTO_HASH_INIT_FN) SHA_1_INIT_FN,
        (CRYPTO_HASH_UPDATE_FN) SHA_1_UPDATE_FN,
        (CRYPTO_HASH_FINAL_FN) SHA_1_FINAL_FN,
        (CRYPTO_HASH_FINAL_FN) SHA_1_FINAL_ZERO_PAD_FN
    },
#endif
#if defined(SHA_256)
    {
        CRYPTO_HASH_ALGID_SHA256,
        SHA_256_BLK_LEN,
        SHA_256_MD_LEN,
        (CRYPTO_HASH_INIT_FN) SHA_256_INIT_FN,
        (CRYPTO_HASH_UPDATE_FN) SHA_256_UPDATE_FN,
        (CRYPTO_HASH_FINAL_FN) SHA_256_FINAL_FN,
        (CRYPTO_HASH_FINAL_FN) SHA_256_FINAL_ZERO_PAD_FN
    },
#endif
};

static int const numalgs = (sizeof(algs_params)/sizeof(algs_params[0]));


/* get_alg_params
 *
 * Return a pointer to the hash algorithm parameters for the hash algorithm
 * specified, by looking for algid in the global algs_params table.
 * If not found, return NULL.
 */
static CRYPTO_HASH_ALG_PARAMS const *
get_alg_params(
    CRYPTO_HASH_ALGID algid)        //  in - the hash algorithm to find
{
    int i;

    for (i = 0; i < numalgs; i++)
        if (algs_params[i].algid == algid)
            return &algs_params[i];

    return NULL;
}


/* crypto_hash_set_alg
 *
 * Sets the hash algorithm for the hash context.  This must be called before
 * any calls to crypto_hash_block_length(), crypto_hash_digest_length(), or
 * crypto_hash_init() are made.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_BAD_ALG if the specified algorithm is not supported.
 */

uint32_t
crypto_hash_set_alg(
    CRYPTO_HASH_ALGID   algid,      //      in - hash algoirithm to be used
    CRYPTO_HASH_CTX    *c)          //  in/out - pointer to the hash context
{
    if (!c)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!(c->alg_params = get_alg_params(algid)))
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    HASH_RET(CRYPTO_HASH_OK);
}


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

uint32_t
crypto_hash_block_length(
   CRYPTO_HASH_CTX *c,              //  in - pointer to the hash context
   uint16_t        *blk_len)        // out - address for block length in bytes
{
    if (!c || !blk_len)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!c->alg_params)
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    *blk_len = c->alg_params->block_length;
    HASH_RET(CRYPTO_HASH_OK);
}


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

uint32_t
crypto_hash_digest_length(
   CRYPTO_HASH_CTX *c,              //  in - pointer to the hash context
   uint16_t        *md_len)         // out - address for digest length in bytes
{
    if (!c || !md_len)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!c->alg_params)
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    *md_len = c->alg_params->digest_length;
    HASH_RET(CRYPTO_HASH_OK);
}


/* crypto_hash_init
 *
 * This routine performs standard initialization of the hash state.
 *
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

uint32_t
crypto_hash_init(
   CRYPTO_HASH_CTX *c)              // in/out - pointer to hash context
{
    if (!c)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!c->alg_params)
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    return c->alg_params->init(&c->alg_ctx);
}


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

uint32_t
crypto_hash_update(
   CRYPTO_HASH_CTX *c,              // in/out - pointer to hash context
   uint8_t const   *data,           //     in - pointer to input data
   uint32_t         data_len)       //     in - number of bytes of input data
{
    if (!c)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!c->alg_params)
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    return c->alg_params->update(&c->alg_ctx, data, data_len);
}


/* crypto_hash_final
 *
 * This routine completes the hash calculation and returns the message digest.
 * 
 * Returns CRYPTO_HASH_OK on success.
 * Returns CRYPTO_HASH_FAIL with corrupted context.
 * Returns CRYPTO_HASH_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns CRYPTO_HASH_BAD_ALG if the algorithm has not been set.
 */

uint32_t
crypto_hash_final(
   CRYPTO_HASH_CTX *c,              // in/out - pointer to hash context
   uint8_t         *md)             //   out  - address for message digest
{
    if (!c)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!c->alg_params)
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    return c->alg_params->final(&c->alg_ctx, md);
}


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

uint32_t
crypto_hash_final_zero_pad(
   CRYPTO_HASH_CTX *c,              // in/out - pointer to hash context
   uint8_t         *md)             //   out  - address for message digest
{
    if (!c)
        HASH_RET(CRYPTO_HASH_BAD_PARAMETER);

    if (!c->alg_params)
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    return c->alg_params->final_zero_pad(&c->alg_ctx, md);
}


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

uint32_t
crypto_hash_digest(
   CRYPTO_HASH_ALGID    algid,      //  in - the hash algorithm to use
   uint8_t const       *data,       //  in - pointer to input data
   uint32_t             data_len,   //  in - number of bytes of input data
   uint8_t             *md)         // out - address for message digest
{
    CRYPTO_HASH_CTX c;
    uint32_t        result;

    /* set hash algorithm */

    if (!(c.alg_params = get_alg_params(algid)))
        HASH_RET(CRYPTO_HASH_BAD_ALG);

    /* perform each step in sequence, aborting if there is an error. */

    if ((result = c.alg_params->init(&c.alg_ctx))                   ||
        (result = c.alg_params->update(&c.alg_ctx, data, data_len)) ||
        (result = c.alg_params->final(&c.alg_ctx, md)))
        return result;

    HASH_RET(CRYPTO_HASH_OK);
}


#endif /* HASH */
