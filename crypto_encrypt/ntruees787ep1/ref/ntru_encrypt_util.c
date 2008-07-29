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
 * File: ntru_encrypt_util.c
 *
 * Contents: Common utilities for NTRUEncrypt encryption and decryption, and
 *           NTRUEncrypt key generation.
 *
 *****************************************************************************/


#if defined(PRINT_DEBUG)
#include <stdio.h>
#endif /* PRINT_DEBUG */

#include <stdlib.h>
#include "crypto_platform.h"
#include "ntru_encrypt_param_sets.h"
#include "ntru_encrypt_util.h"
#include "crypto_hash.h"


/* ntru_ring_mult
 *
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

void
ntru_ring_mult(
    uint16_t const *a,          /*  in - pointer to polynomial a */
    uint16_t const *bi,         /*  in - pointer to list of indices for
                                         binary polynomial b */
    uint16_t        bi_len,     /*  in - no. of nonzero coefficients in b */
    boolean         binary,     /*  in - form of polynomial "b" */
    uint16_t        N,          /*  in - no. of coefficients in a, b, c */
    uint16_t        q,          /*  in - large modulus */
    uint16_t       *c)          /* out - address for polynomial c */
{
    if (binary) {                           /* BINARY FORM */
        uint32_t    t[MAX_N];
        uint16_t    i, j, k;

        for (k = 0; k < N; k++)             /* t[] = 0 */
            t[k] = 0;
        for (j = 0; j < bi_len; j++) {      /* t = a * b */
            i = 0;
            k = bi[j];
            while (k < N)
                t[k++] += a[i++];
            k = 0;
            while (i < N)
                t[k++] += a[i++];
        }
        for (k = 0; k < N; k++)             /* c = t mod q */
            c[k] = (uint16_t)(t[k] % q);

    } else {                                /* PRODUCT FORM */
        uint32_t    t1[MAX_N], t2[MAX_N];
        uint16_t    i, j, k;

        for (k = 0; k < N; k++) {           /* t1[] = t2[] = 0 */
            t1[k] = 0;
            t2[k] = 0;
        }
        for (j = 0; j < bi_len; j++) {      /* t1 = a * b1 */
            i = 0;
            k = *bi++;
            while (k < N)
                t1[k++] += a[i++];
            k = 0;
            while (i < N)
                t1[k++] += a[i++];
        }
        for (j = 0; j < bi_len; j++) {      /* t2 = t1 * b2, t1[] = 0 */
            i = 0;
            k = *bi++;
            while (k < N) {
                t2[k++] += t1[i];
                t1[i++] = 0;
            }
            k = 0;
            while (i < N) {
                t2[k++] += t1[i];
                t1[i++] = 0;
            }
        }
        for (j = 0; j < bi_len; j++) {      /* t1 = a * b3 */
            i = 0;
            k = *bi++;
            while (k < N)
                t1[k++] += a[i++];
            k = 0;
            while (i < N)
                t1[k++] += a[i++];
        }
        for (k = 0; k < N; k++)             /* c = t1 + t2 mod q */
            c[k] = (uint16_t)((t1[k] + t2[k]) % q);
    }
}


/* ntru_sef_init
 *
 * Initializes the seed exapnsion function by resetting the counter
 * and discarding any previously generated octets.
 */

uint32_t
ntru_sef_init(
    NTRU_SEF_CTX  *c)
{
    /* check parameters */

    if (!c)
        return 1;

    /* initialization */

    c->ctr[0] = c->ctr[1] = c->ctr[2] = c->ctr[3] = 0;
    c->unused_len = 0;

    return 0;
}


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

uint32_t
ntru_sef(
    NTRU_SEF_CTX    *c,         /*  in - pointer to sef context */
    uint8_t const   *seed,      /*  in - pointer to the seed */
    uint32_t         seed_len,  /*  in - no. of octets in the seed */
    CRYPTO_HASH_CTX *h,         /*  in - hash context with algorithm set */
    uint32_t         out_len,   /*  in - no. of octets requested */
    uint8_t         *out)       /* out - address for output octets */
{
    uint8_t    *ctr;
    uint32_t    unused_len;
    uint8_t    *md;
    uint16_t    digest_len;

    /* check parameters */

    if (!c || !seed || !h || !out)
        return 1;

    /* initialization */

    ctr = c->ctr;
    unused_len = c->unused_len;
    md = c->out;
    if (crypto_hash_digest_length(h, &digest_len))
        return 1;

    /* use any unused octets first */

    if (unused_len) {
        uint8_t *unused = md + (digest_len - unused_len);

        if (unused_len >= out_len) {
            /* requested same or fewer than the no. of unused octets */

            unused_len -= out_len;
            while (out_len--)
                *out++ = *unused++;
            return 0;
        }

        /* requested more than the no. of unused octets */

        out_len -= unused_len;
        while (unused_len--)
            *out++ = *unused++;
    }

    /* hash seed and counter, producing groups of digest_len octets,
     * until the required number of octets has been produced
     */

    while (out_len) {
        if (crypto_hash_init(h)                     ||
            crypto_hash_update(h, seed, seed_len)   ||
            crypto_hash_update(h, ctr, 4)           ||
            crypto_hash_final(h, md))
            return 1;

        /* increment counter for any subsequent hash */

        if (++ctr[3] == 0)
            if (++ctr[2] == 0)
                if (++ctr[1] == 0)
                    ++ctr[0];

        if (out_len <= digest_len) {
            /* no subsequent hash is needed:
             * output no. of octets still needed, save the rest, and return
             */

            uint8_t *unused = md;

            unused_len = digest_len - out_len;
            while (out_len--)
                *out++ = *unused++;
            return 0;
        }

        /* another hash is required: output all unused octets */

        {
            uint16_t i;

            out_len -= digest_len;
            for (i = 0; i < digest_len; i++)
                *out++ = md[i];
        }
    }
    return 0;                   /* to satisfy compiler */
}


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

uint32_t
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
    uint16_t        *r)           /* out - address for blinding value indices */
{
    NTRU_SEF_CTX    c;
    uint16_t        digest_len;
    uint8_t         out[MAX_DIGEST_LEN];
    uint16_t        out_len = 0;
    boolean         used[MAX_N];
    uint16_t        r_cnt;
    uint16_t        ri_cnt;
    boolean         r_done = FALSE;
    uint16_t        i;

    /* check parameters */

    if (!seed || !h || !r)
        return 1;

    /* initialization */

    if (crypto_hash_digest_length(h, &digest_len))
        return 1;

    if (ntru_sef_init(&c))
        return 1;

    /* set total number of indices needed */

    if (binary)
        r_cnt = r_len;
    else
        r_cnt = r_len * 3;

    /* init record of uniqueness */

    ri_cnt = 0;
    for (i = 0; i < MAX_N; i++)
        used[i] = FALSE;

    /* generate octets and derive unique indices from them */

    if (N < 256) {

        /* 1 octet per candidate index */

        while (!r_done || (out_len < min_out_len)) {
            if (ntru_sef(&c, seed, seed_len, h, digest_len, out))
                return 1;
            if (!r_done)
                for (i = 0; i < digest_len; i++) {
                    uint16_t j;

                    /* OS2IP */

                    j = (uint16_t)(out[i]);

                    /* check within limit */

                    if (j < limit) {
                        j %= N;

                        /* check for unique */

                        if (!used[j]) {
                            used[j] = TRUE;
                            *r++ = j;

                            /* check if r is complete */

                            if (--r_cnt == 0) {
                                r_done = TRUE;
                                break;
                            }

                            /* check product-form component is complete
                             * if so, reset for next one
                             */

                            if (++ri_cnt == r_len) {
                                ri_cnt = 0;
                                for (i = 0; i < MAX_N; i++)
                                    used[i] = FALSE;
                            }
                        }
                    }
                }
            out_len += digest_len;
        }

    } else {

        /* 2 octets per candidate index
         * Note: This assumes digest_len is even, which is true for all
         *       hash functions used for SEF.
         */

        while (!r_done || (out_len < min_out_len)) {
            if (ntru_sef(&c, seed, seed_len, h, digest_len, out))
                return 1;
            if (!r_done)
                for (i = 0; i < digest_len; i += 2) {
                    uint16_t j;

                    /* OS2IP */

                    j = ((((uint16_t)(out[i]) << 8) |
                           (uint16_t)(out[i+1])) & mask);

                    /* check within limit */

                    if (j < limit) {
                        j %= N;

                        /* check for unique */

                        if (!used[j]) {
                            used[j] = 1;
                            *r++ = j;

                            /* check if r is complete */

                            if (--r_cnt == 0) {
                                r_done = TRUE;
                                break;
                            }

                            /* check if product-form component is complete
                             * if so, reset for next one
                             */

                            if (++ri_cnt == r_len) {
                                ri_cnt = 0;
                                for (i = 0; i < MAX_N; i++)
                                    used[i] = FALSE;
                            }
                        }
                    }
                }
            out_len += digest_len;
        }
    }
    return 0;
}


