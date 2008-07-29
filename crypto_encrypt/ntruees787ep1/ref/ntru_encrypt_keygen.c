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
 * File: ntru_encrypt_keygen.c
 *
 * Contents: Routines implementing NTRUEncrypt key generation.
 *
 *****************************************************************************/


#if defined(PRINT_DEBUG)
#include <stdio.h>
#endif /* PRINT_DEBUG */

#include <stdlib.h>
#include "crypto_platform.h"
#include "ntru_encrypt_param_sets.h"
#include "ntru_encrypt_keygen.h"
#include "ntru_encrypt_util.h"
#include "randombytes.h"

#if defined(NTRU_TEST)
#include "test_ntru_enc_vectors.h"
#endif /* NTRU_TEST */


/* mod_inv
 *
 * Finds the inverse of a number modulo a prime, p, using the Extended
 * Euclidean Algorithm.
 * It is assumed that 0 < a < p.
 *
 * Returns the inverse of a mod p.
 */

static uint16_t
mod_inv(
    uint16_t    a,              /*  in - number to invert */
    uint16_t    p)              /*  in - prime modulus */
{
    int16_t  u = (int16_t) a;
    int16_t  v = (int16_t) p;
    int16_t u1 = 1;
    int16_t u3 = u;
    int16_t v1 = v;
    int16_t v3 = v;
    int16_t t1, t3;

    if (u & 1) {
        t1 = 0;
        t3 = -v;
    } else {
        t1 = 1;
        t3 = u;
    }
    while (t3 != 0) {
        while (!(t3 & 1)) {
            if (t1 & 1)
                t1 = (t1 + v) >> 1;
            else
                t1 >>= 1;
            t3 >>= 1;
        }
        if (t3 > 0) {
            u1 = t1;
            u3 = t3;
        } else {
            v1 = v - t1;
            v3 = -t3;
        }
        t1 = u1 - v1;
        t3 = u3 - v3;
        if (t1 < 0)
            t1 += v;
    }
    return (uint16_t) u1;
}


/* mod_poly_mult
 *
 * Multiplies two polynomials in (Z/pZ)[X].
 *
 * Note that the size of a polynomial array is one larger than its degree.
 */

static void
mod_poly_mult(
    uint16_t        p,          /*  in - modulus */
    uint16_t        deg_a,      /*  in - degree of polynomial a */
    uint16_t const *a,          /*  in - pointer to polynomial a */
    uint16_t        deg_b,      /*  in - degree of polynomial b */
    uint16_t const *b,          /*  in - pointer to polynomial b */
    uint16_t       *c)          /* out - addr for polynomial c */
{
    uint16_t    deg_c = deg_a + deg_b;
    uint32_t    t[MAX_N+1];
    uint16_t    i, j;

    for (i = 0; i <= deg_c; i++)
        t[i] = 0;
    for (i = 0; i <= deg_a; i++)
        for (j = 0; j <= deg_b; j++)
            t[i+j] += a[i] * b[j];
    for (i = 0; i <= deg_c; i++)
        c[i] = (uint16_t)(t[i] % p);
}


/* mod_poly_divide
 *
 * Divides a dividend polynomial a by a divisor polynomial b, returning the
 * quotient polynomial q and remainder polynomial r, in (Z/pZ)[X].
 *
 * The remainder polynomial is returned in a.
 */

static void
mod_poly_divide(
    uint16_t        p,          /*     in - modulus */
    uint16_t       *deg_a,      /* in/out - addr of degree of dividend
                                 *            polynomial on input;
                                 *          addr for degree of remainder
                                 *            polynomial on output */
    uint16_t       *a,          /*     in - pointer to dividend polynomial */
    uint16_t        deg_b,      /*     in - degree of divisor polynomial */
    uint16_t const *b,          /*     in - pointer to divisor polynomial */
    uint16_t       *deg_q,      /*    out - addr for degree of quotient
                                 *            polynomial */
    uint16_t       *q)          /*    out - addr for quotient polynomial */
{
    uint32_t    b_inv;
    int16_t     i, j, k;

    /* check for b > a */

    *deg_q = 0;
    q[0] = 0;
    if (*deg_a < deg_b)
        return;

    /* initialize */

    *deg_q = *deg_a - deg_b;
    b_inv = (uint32_t) mod_inv(b[deg_b], p);

    /* find each quotient digit, multiply by b, and subtract from a */

    for (k = (int16_t) *deg_q; k >= 0; k--) {
        if (a[*deg_a] == 0) {
            q[k] = 0;
        } else {
            q[k] = (uint16_t) ((b_inv * a[*deg_a]) % p);
            a[*deg_a] = 0;
            for (i = (int16_t) (*deg_a) - 1, j = (int16_t) deg_b - 1;
                    j >= 0; i--, j--) {
                a[i] -= (uint16_t) ((q[k] * (uint32_t) b[j]) % p);
                if (a[i] & 0x8000)
                    a[i] += p;
            }
        }
        (*deg_a)--;
    }
    if (*deg_a == 65535)
        *deg_a = 0;
    else
        for (i = (int16_t) *deg_a; (a[i] == 0) && (i > 0); i--)
            (*deg_a)--;
}


/* mod_ring_inv
 *
 * Finds the inverse, if it exists, of a polynomial a in the ring
 * (Z/pZ)[X]/(X^N - 1), by using the Extended Euclidean Algorithm.
 *
 * This assumes a is not the zero polynomial.
 *
 * The polynomial b may occupy the same memory as polynomial a.
 *
 * Returns TRUE if inverse was found,
 *         FALSE if no inverse exists.
 */

static boolean
mod_ring_inv(
    uint16_t        p,          /*  in - modulus */
    uint16_t        N,          /*  in - dimension of ring */
    uint16_t const *a,          /*  in - pointer to polynomial a */
    uint16_t       *b)          /* out - addr for inverse of polynomial a */
{
    uint16_t    poly1a[MAX_N];
    uint16_t    poly1b[MAX_N];
    uint16_t    poly3a[MAX_N + 1];
    uint16_t    poly3b[MAX_N];
    uint16_t         q[MAX_N];
    uint16_t   *u1 = poly1a;
    uint16_t   *v1 = poly1b;
    uint16_t   *u3 = poly3a;
    uint16_t   *v3 = poly3b;
    uint16_t   *t;
    uint16_t    deg_u3 = N;
    uint16_t    deg_v3 = N - 1;
    uint16_t    deg_q;
    uint32_t    d_inv;
    uint16_t    i;

    /* initialize for calculating the GCD of a and X^N - 1 */

    u1[0] = p;
    v1[0] = 1;
    u3[0] = p - 1;
    u3[N] = 1;
    for (i = 1; i < N; i++) {
        u1[i] = p;
        v1[i] = 0;
        u3[i] = 0;
    }
    for (i = 0; i < N; i++)
        v3[i] = a[i];
    for (--i; (v3[i] == 0) && (i > 0); i--)
        deg_v3--;

    /* find the GCD of a and X^N - 1 */

    while ((deg_v3 != 0) || (v3[0] != 0)) {
        mod_poly_divide(p, &deg_u3, u3, deg_v3, v3, &deg_q, q);
        mod_poly_mult(p, deg_q, q, (uint16_t) (N - 1 - deg_q), v1, q);
        for (i = 0; i < N; i++) {
            u1[i] -= q[i];
            if (u1[i] & 0x8000)
                u1[i] += p;
        }

        /* swap u and v */

        t = u1;
        u1 = v1;
        v1 = t;
        t = u3;
        u3 = v3;
        v3 = t;
        deg_u3 ^= deg_v3;
        deg_v3 ^= deg_u3;
        deg_u3 ^= deg_v3;
    }

    /* check if inverse exists */

    if (deg_u3 != 0)
        return FALSE;

    /* return the inverse */

    d_inv = (uint32_t) mod_inv(u3[0], p);
    for (i = 0; i < N; i++)
        b[i] = (uint16_t) ((d_inv * u1[i]) % p);

    return TRUE;
}


/* ntru_encrypt_keygen
 *
 * Computes an NTRUEncrypt keypair, returning the private and public keys.
 * The private key contains F (or f1, f2, f3 if product form) followed by h,
 * since h is also needed for decryption and is thus considered part of the
 * "private key" in this case.
 *
 * Returns 0 if successful, nonzero otherwise.
 */

uint32_t
ntru_encrypt_keygen(
    NTRU_ENCRYPT_PARAM_SET_ID  param_set_id, /*  in - parameter set */
    uint32_t                  *priv_key_len, /* out - no. of octets in private
                                                      key */
    uint8_t                   *priv_key,     /* out - addr for the private
                                                      key */
    uint32_t                  *pub_key_len,  /* out - no. of octets in public
                                                      key */
    uint8_t                   *pub_key)      /* out - addr for the public key */
{
    NTRU_ENCRYPT_PARAM_SET *params = NULL;
    CRYPTO_HASH_CTX         hash_ctx;
    boolean                 poly_exists;
#if !defined(NTRU_TEST)
    uint8_t                 seed[20];
#endif /* !NTRU_TEST */
    uint16_t                g[MAX_G];
    uint16_t                F[MAX_F];
    uint16_t                poly[MAX_N];
    uint16_t                len;
    uint16_t                i;

    /* check arguments */

    if (!priv_key_len || !priv_key || !pub_key_len || !pub_key)
        return 1;

    /* get parameters for given parameter set */

    if ((params = get_params(param_set_id)) == NULL)
        return 2;

    /* init the hash context */

    if (crypto_hash_set_alg(params->hash_id, &hash_ctx))
        return 3;

    /* get random seed for SEF */

#if !defined(NTRU_TEST)
        randombytes(seed, sizeof(seed));
#endif

    /* generate random binary polynomial g, invertible in (Z/qZ)[X]/(X^N - 1) */

    poly_exists = FALSE;
    while (!poly_exists) {

        /* generate random g as list of nonzero indices */

#if !defined(NTRU_TEST)
        if (ntru_bvgm(seed, sizeof(seed), &hash_ctx, params->N, params->mask,
                      TRUE, params->gLen, params->limit,
                      params->min_outLen, g))
            return 4;
#else
        ntru_encrypt_get_fixed_g(param_set_id, g);
#endif

        /* convert list of indices to coefficients */

        for (i = 0; i < params->N; i++)
            poly[i] = 0;
        for (i = 0; i < params->gLen; i++)
            poly[g[i]] = 1;

        /* check that g is invertible */

        if (mod_ring_inv(params->q, params->N, poly, poly))
            poly_exists = TRUE;
    }

    /* generate random binary polynomial f, invertible in (Z/qZ)[X]/(X^N - 1) */

    poly_exists = FALSE;
    while (!poly_exists) {

        /* generate random f as list of nonzero indices */

#if !defined(NTRU_TEST)
        if (ntru_bvgm(seed, sizeof(seed), &hash_ctx, params->N, params->mask,
                      params->binary, params->FLen, params->limit,
                      params->min_outLen, F))
            return 5;
#else
        ntru_encrypt_get_fixed_F(param_set_id, F);
#endif

        /* convert list of indices to coefficients */

        for (i = 0; i < params->N; i++)
            poly[i] = 0;

        if (params->binary) {                   /* BINARY FORM */

            /* f =  (2 * F) + 1 */

            for (i = 0; i < params->FLen; i++)
                poly[F[i]] = 2;
            poly[0]++;

        } else {                                /* PRODUCT FORM */
            uint16_t   *f1 = F;
            uint16_t   *f2 = f1 + params->FLen;
            uint16_t   *f3 = f2 + params->FLen;
            uint16_t    j, k;

            /* F = (f1 * f2) + f3 */

            for (i = 0; i < params->FLen; i++)
                for (j = 0; j < params->FLen; j++) {
                    if ((k = f1[i] + f2[j]) >= params->N)
                        k -= params->N;
                    poly[k]++;
                }
            for (i = 0; i < params->FLen; i++)
                poly[f3[i]]++;

            /* f = (2 * F) + 1 */

            for (i = 0; i < params->N; i++)
                poly[i] <<= 1;
            poly[0]++;
        }

        /* check that f is invertible */

        if (mod_ring_inv(params->q, params->N, poly, poly))
            poly_exists = TRUE;
    }

    /* compute public key h = f^-1 * g * p, p = 2
     *  Note: f^-1 is stored in the poly array
     *        h will replace it in the poly array
     */

    ntru_ring_mult(poly, g, params->gLen, params->binary, params->N,
                   params->q, poly);
    for (i = 0; i < params->N; i++)
        if ((poly[i] <<= 1) >= params->q)
            poly[i] -= params->q;

    /* output secret part of priv_key = RE2OSP(F) */

    if (params->binary)
        len = params->FLen;
    else
        len = 3 * params->FLen;

    if (params->N < 256) {

        /* one octet per index */

        for (i = 0; i < len; i++)
            *priv_key++ = (uint8_t) F[i];
        *priv_key_len = (uint32_t) i;

    } else {

        /* two octets per index */

        for (i = 0; i < len; i++) {
            *priv_key++ = (uint8_t) (F[i] >> 8);
            *priv_key++ = (uint8_t) (F[i] & 0xff);
        }
        *priv_key_len = (uint32_t) i << 1;
    }

    /* output pub_key and public part of priv_key = RE2OSP(poly)
     *  Note: h is stored in the poly array
     */

    if (params->q < 256 ) {

        /* one octet per ring element */

        for (i = 0; i < params->N; i++) {
            *pub_key = (uint8_t) poly[i];
            *priv_key++ = *pub_key++;
        }
        *pub_key_len = (uint32_t) i;

    } else {

        /* two octets per ring element */

        for (i = 0; i < params->N; i++) {
            *pub_key = (uint8_t) (poly[i] >> 8);
            *priv_key++ = *pub_key++;
            *pub_key = (uint8_t) (poly[i] & 0xff);
            *priv_key++ = *pub_key++;
        }
        *pub_key_len = (uint32_t) i << 1;
    }
    *priv_key_len += *pub_key_len;

    return 0;
}


