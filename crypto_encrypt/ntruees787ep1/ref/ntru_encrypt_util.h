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
 * File: ntru_encrypt_util.h
 *
 * Contents: Definitions and declarations for the common utilities for
 *           NTRUEncrypt encryption and decryption, and NTRUEncrypt key
 *           generation.
 *
 *****************************************************************************/

#ifndef NTRU_ENCRYPT_UTIL_H
#define NTRU_ENCRYPT_UTIL_H

#include "crypto_platform.h"
#include "crypto_hash.h"


/**************
 * STRUCTURES *
 **************/

/* NTRU_SEF_CTX
 *
 * SEF object context information.
 */

typedef struct {
    uint8_t     ctr[4];                 /* counter */
    uint32_t    unused_len;             /* no. of unused octets */
    uint8_t     out[MAX_DIGEST_LEN];    /* holds pseudo-random octets */
} NTRU_SEF_CTX;


/*************************
 * FUNCTION DECLARATIONS *
 *************************/

/* ntru_ring_mult
 *
 * Multiplies polynomial "a" by polynomial "b" to produce polynomial "c"
 * in (Z/qZ)[X]/(X^N - 1).  This is a convolution operation.
 *
 * The binary flag determines whether polynomial "b" is in binary or product
 * form.
 *
 * For binary form, polynomial "b" is a sparse binary polynomial specified
 * by a list of indices for the nonzero coefficients.  The indices are in
 * the range [0,N).
 *
 * For product form, polynomial "b" is in product form (b1 * b2 + b3) where
 * each bi is a sparse binary polynomial specified by a list of indices for
 * the nonzero coefficients.  The indices are in the range [0,N).
 * It is assumed that the number of nonzero coefficients for b1, b2, b3,
 * is the same.
 *
 * A 32-bit array is used to allow accumulation of convolution results with
 * one reduction mod q at the end.
 *
 * The result array "c" may share the same memory space as input array "a".
 */

extern void
ntru_ring_mult(
    uint16_t const *a,          /*  in - pointer to polynomial a */
    uint16_t const *bi,         /*  in - pointer to list of indices for
                                         binary polynomial b */
    uint16_t        bi_len,     /*  in - no. of nonzero coefficients in b */
    boolean         binary,     /*  in - form of polynomial "b" */
    uint16_t        N,          /*  in - no. of coefficients in a, b, c */
    uint16_t        q,          /*  in - large modulus */
    uint16_t       *c);         /* out - address for polynomial c */


/* ntru_sef_init
 *
 * Initializes the seed exapnsion function by resetting the counter
 * and discarding any previously generated octets.
 */

extern uint32_t
ntru_sef_init(
    NTRU_SEF_CTX  *c);          /*  in - pointer to SEF context */


/* ntru_sef
 *
 * A seed expansion function that generates pseudo-random octets returning
 * any previously unused octets first, and then generating more using the seed.
 *
 * Although SEF-MGF1 allows outputs up to hLen * 2^32, use of it in NTRU
 * will never exceed 2^32 octets, so the bound is not checked.
 * Similarly, use of NTRU will never exceed the maximum input length of
 * the approved core hash functions used, so the bound is not checked.
 *
 * Returns 0 on success, 1 otherwise.
 */

extern uint32_t
ntru_sef(
    NTRU_SEF_CTX    *c,         /*  in - pointer to SEF context */
    uint8_t const   *seed,      /*  in - pointer to the seed */
    uint32_t         seed_len,  /*  in - no. of octets in the seed */
    CRYPTO_HASH_CTX *h,         /*  in - hash context with algorithm set */
    uint32_t         out_len,   /*  in - no. of octets requested */
    uint8_t         *out);      /* out - address for output octets */


/* ntru_bvgm
 *
 * Generates a either a type 1 or type 2 blinding value r, represented as
 * a list of indices of the nonzero coefficients of polynomials.
 * The list is generated through use of the SEF.
 *
 * For r in binary form, the list represents unique indices in a single
 * polynomial r.
 *
 * For r in product form, the list represents unique indices for the
 * polynomial r1, followed by unique indices for the polynomial r2, followed
 * by unique indices for the polynomial r3.  It is assumed that the number
 * of nonzero indices is the same for r1, r2, and r3.
 *
 * Returns 0 on success, 1 otherwise.
 */

extern uint32_t
ntru_bvgm(
    uint8_t const   *seed,        /*  in - pointer to the seed */
    uint32_t         seed_len,    /*  in - no. of octets in the seed */
    CRYPTO_HASH_CTX *h,           /*  in - hash context with algorithm set */
    uint16_t         N,           /*  in - dimension */
    uint16_t         mask,        /*  in - pre-modulo mask, c */
    boolean          binary,      /*  in - form of r */
    uint16_t         r_len,       /*  in - binary form: number of nonzero
                                   *        coefficients in r
                                   *       product form: number of nonzero
                                   *        coefficients in r1 (or r2 or r3) */
    uint16_t         limit,       /*  in - random >= limit are discarded */
    uint16_t         min_out_len, /*  in - min. no. of SEF octets generated */
    uint16_t        *r);          /* out - address for blinding value indices */


#endif /* NTRU_ENCRYPT_UTIL_H */


