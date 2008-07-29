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
 * File: crypto_sha256.h
 *
 * Contents: Definitions and declarations for the SHA-256 implementation.
 *
 *****************************************************************************/

#ifndef CRYPTO_SHA256_H
#define CRYPTO_SHA256_H


#include "crypto_platform.h"
#include "crypto_sha2.h"


/******************************************
 * macros needed for generic hash objects * 
 ******************************************/

#define SHA_256_CTX_LEN     sizeof(SHA2_CTX)        // no. bytes in SHA-2 ctx
#define SHA_256_BLK_LEN     64                      // 64 bytes in input block
#define SHA_256_MD_LEN      32                      // 32 bytes in msg digest
#define SHA_256_INIT_FN     &crypto_sha256_init     // init function
#define SHA_256_UPDATE_FN   &crypto_sha256_update   // update function
#define SHA_256_FINAL_FN    &crypto_sha256_final    // final function
#define SHA_256_FINAL_ZERO_PAD_FN                                           \
                            &crypto_sha256_final_zero_pad
                                                    // final function using
                                                    //  zero padding


/*************************
 * function declarations *
 *************************/

/* crypto_sha256_init
 *
 * This routine performs standard initialization of the SHA-256 state.
 *
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 */

extern uint32_t
crypto_sha256_init(
    SHA2_CTX   *c);                 // in/out - pointer to SHA-2 context


/* crypto_sha256_update
 *
 * This routine processes input data and updates the SHA-256 hash calculation.
 *
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns SHA_OVERFLOW if more than 2^64 - 1 bytes are hashed.
 */

extern uint32_t
crypto_sha256_update(
    SHA2_CTX       *c,              // in/out - pointer to SHA-2 context
    uint8_t const  *data,           //     in - pointer to input data
    uint32_t        data_len);      //     in - number of bytes of input data


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

extern uint32_t
crypto_sha256_final(
    SHA2_CTX   *c,                  // in/out - pointer to SHA-2 context
    uint8_t    *md);                //    out - address for message digest


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

extern uint32_t
crypto_sha256_final_zero_pad(
    SHA2_CTX   *c,                  // in/out - pointer to SHA-2 context
    uint8_t    *md);                //    out - address for message digest


/* crypto_sha256_digest
 *
 * This routine computes a SHA-256 message digest.
 *
 * Returns SHA_OK on success.
 * Returns SHA_FAIL with corrupted context.
 * Returns SHA_BAD_PARAMETER if inappropriate NULL pointers are passed.
 * Returns SHA_OVERFLOW if more than 2^64 - 1 bytes are hashed.
 */

extern uint32_t
crypto_sha256_digest(
    uint8_t const  *data,           //  in - pointer to input data
    uint32_t        data_len,       //  in - number of bytes of input data
    uint8_t        *md);            // out - address for message digest


#endif /* CRYPTO_SHA256_H */
