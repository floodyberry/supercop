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
 * File: crypto_sha256.c
 *
 * Contents: Routines implementing the SHA-256 hash calculations.
 *
 *****************************************************************************/


#include <stdlib.h>
#include "crypto_config.h"

#if defined(SHA_256)
#include "crypto_sha2.h"


/* crypto_sha256_init
 *
 * This routine performs standard initialization of the SHA-256 state.
 *
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 */

uint32_t
crypto_sha256_init(
    SHA2_CTX   *c)                  // in/out - pointer to SHA-2 context
{
    return crypto_sha2(CRYPTO_HASH_ALGID_SHA256, c, NULL, NULL, 0,
                       SHA_INIT, NULL);
}


/* crypto_sha256_update
 *
 * This routine processes input data and updates the SHA-256 hash calculation.
 *
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns SHA_OVERFLOW if more than 2^64 - 1 bytes are hashed.
 */

uint32_t
crypto_sha256_update(
    SHA2_CTX       *c,              // in/out - pointer to SHA-2 context
    uint8_t const  *data,           //     in - pointer to input data
    uint32_t        data_len)       //     in - number of bytes of input data
{
    return crypto_sha2(CRYPTO_HASH_ALGID_SHA256, c, NULL, data, data_len,
                       SHA_DATA_ONLY, NULL);
}


/* crypto_sha256_final
 *
 * This routine completes the SHA-256 hash calculation and returns the
 * message digest.
 * 
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns SHA_OVERFLOW if more than 2^64 - 1 bytes are hashed.
 */

uint32_t
crypto_sha256_final(
    SHA2_CTX   *c,                  // in/out - pointer to SHA-2 context
    uint8_t    *md)                 //    out - address for message digest
{
    return crypto_sha2(CRYPTO_HASH_ALGID_SHA256, c, NULL, NULL, 0,
                       SHA_FINISH, md);
}


/* crypto_sha256_final_zero_pad
 *
 * This routine completes the SHA-256 hash calculation using zero padding
 * and returns the message digest.
 * 
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns SHA_OVERFLOW if more than 2^64 - 1 bytes are hashed.
 */

uint32_t
crypto_sha256_final_zero_pad(
    SHA2_CTX   *c,                  // in/out - pointer to SHA-2 context
    uint8_t    *md)                 //    out - address for message digest
{
    return crypto_sha2(CRYPTO_HASH_ALGID_SHA256, c, NULL, NULL, 0,
                       SHA_FINISH | SHA_ZERO_PAD, md);
}


/* crypto_sha256_digest
 *
 * This routine computes a SHA-256 message digest.
 *
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns SHA_OVERFLOW if more than 2^64 - 1 bytes are hashed.
 */

uint32_t
crypto_sha256_digest(
    uint8_t const  *data,           //  in - pointer to input data
    uint32_t        data_len,       //  in - number of bytes of input data
    uint8_t        *md)             // out - address for message digest
{
    SHA2_CTX    c;

    return crypto_sha2(CRYPTO_HASH_ALGID_SHA256, &c, NULL, data, data_len,
                       SHA_INIT | SHA_FINISH, md);
}


#endif /* SHA_256 */
