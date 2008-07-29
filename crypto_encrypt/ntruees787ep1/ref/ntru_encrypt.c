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
 * File: ntru_encrypt.c
 *
 * Contents: Routines implementing NTRUEncrypt encryption and decryption.
 *
 *****************************************************************************/


#if defined(PRINT_DEBUG)
#include <stdio.h>
#endif /* PRINT_DEBUG */

#include <stdlib.h>
#include "crypto_platform.h"
#include "ntru_encrypt_param_sets.h"
#include "ntru_encrypt.h"
#include "ntru_encrypt_util.h"
#include "randombytes.h"
#include "crypto_hash.h"

#if defined(NTRU_TEST)
#include "test_ntru_enc_vectors.h"
#endif /* NTRU_TEST */


/* ntru_mgf1_xor
 *
 * Generates a mask and XORs it in place with an octet string.
 * The mask is generated from an input seed with a mask-generation
 * function (MGF1) that uses a hash function.
 *
 * Although MGF1 allows outputs up to hLen * 2^32, use of it in NTRU will
 * never exceed 2^32 octets so the bound is not checked.
 * Similarly, use of NTRU will never exceed the maximum input length of
 * the approved core hash functions used, so the bound is not checked.
 *
 * Returns 0 on success, 1 otherwise.
 */

static uint32_t
ntru_mgf1_xor(
    uint8_t const   *seed,      /*     in - pointer to input seed */
    uint32_t         seed_len,  /*     in - no. of octets in input seed */
    CRYPTO_HASH_CTX *h,         /*     in - hash context with algorithm set */
    uint32_t         str_len,   /*     in - no. of octets in the string */
    uint8_t         *str)       /* in/out - pointer to string */
{
    uint16_t    digest_len;
    uint8_t     ctr[4];
    uint8_t     md[MAX_DIGEST_LEN];

    /* check parameters */

    if (!seed || !h || !str)
        return 1;

    /* initialization */

    ctr[0] = ctr[1] = ctr[2] = ctr[3] = 0;
    if (crypto_hash_digest_length(h, &digest_len))
        return 1;

    /* hash seed and counter, producing groups of digest_len octets,
     * until the required number of mask octets has been produced */

    while (str_len) {
        if (crypto_hash_init(h)                     ||
            crypto_hash_update(h, seed, seed_len)   ||
            crypto_hash_update(h, ctr, 4)           ||
            crypto_hash_final(h, md))
            return 1;

        if (str_len <= digest_len) {
            uint16_t i;

            /* no subsequent hash is required:
             * output no. of octets still needed and return
             */

            for (i = 0;  str_len--; i++)
                *str++ ^= md[i];
            return 0;
        }

        /* another hash is required: output all unused octets */

        {
            uint16_t i;

            str_len -= digest_len;
            for (i = 0; i < digest_len; i++)
                *str++ ^= md[i];

            /* increment counter */

            if (++ctr[3] == 0)
                if (++ctr[2] == 0)
                    if (++ctr[1] == 0)
                        ++ctr[0];
        }
    }
    return 0;                   /* to satisfy compiler */
}


/* ntru_encrypt
 *
 * Implements NTRU encryption (SVES) for the given parameter set.
 *
 * Returns 0 on success, nonzero otherwise.
 */

uint32_t
ntru_encrypt(
    NTRU_ENCRYPT_PARAM_SET_ID  param_set_id, /*  in - parameter set */
    uint32_t                   pub_key_len,  /*  in - no. of octets in public
                                                      key */
    uint8_t const             *pub_key,      /*  in - pointer to public key */
    uint32_t                   pt_len,       /*  in - no. of octets in
                                                      plaintext */
    uint8_t const             *pt,           /*  in - pointer to plaintext */
    uint32_t                  *ct_len,       /* out - addr for no. of octets
                                                      in ciphertext */
    uint8_t                   *ct)           /* out - addr for ciphertext */
{
    NTRU_ENCRYPT_PARAM_SET *params = NULL;
    CRYPTO_HASH_CTX         hash_ctx;
    uint8_t                 sData[((MAX_N + 7) >> 3) + 1];
    uint8_t                 M[(MAX_N + 7) >> 3];
    uint16_t                R[MAX_N];
    uint16_t                r[MAX_R];
    uint8_t                *s_ptr;
    uint8_t                *M_ptr;
    uint16_t               *R_ptr;
    uint32_t                i;
    int                     j;

    /* check arguments */

    if (!pub_key || !pt || !ct_len || !ct)
        return 1;

    /* get parameters for given parameter set */

    if ((params = get_params(param_set_id)) == NULL)
        return 2;

    /* check public-key length
     *  If q < 256, h is stored as one octet per ring element; two octets
     *   otherwise.
     */

    if (params->q < 256) {
        if (pub_key_len != (uint32_t) params->N)
            return 3;
    } else {
        if (pub_key_len != (uint32_t) 2 * params->N)
            return 3;
    }

    /* check plaintext length */

    if (pt_len > params->max_mLen)
        return 4;

    /* init the hash context */

    if (crypto_hash_set_alg(params->hash_id, &hash_ctx))
        return 5;

    /* form M and sData (hTrunc is assumed to be zero length) */

    s_ptr = sData;
    for (i = 0; i < 3; i++)
        *s_ptr++ = params->OID[i];                 /* put OID in sData */

    M_ptr = M + params->bLen;
    *M_ptr++ = (uint8_t) pt_len;                   /* put octL in M */
    for (i = 0; i < pt_len; i++) {
        *s_ptr++ = pt[i];                          /* put m in sData */
        *M_ptr++ = pt[i];                          /* put m in M */
    }

#if !defined(NTRU_TEST)
    randombytes(s_ptr, params->bLen);          /* put b in sData */
#else
    ntru_encrypt_get_fixed_b(param_set_id, s_ptr); /* put fixed b in sData */
#endif /* NTRU_TEST */

    for (i = 0; i < params->bLen; i++)
        M[i] = *s_ptr++;                           /* put b in M */

    while (M_ptr < M + params->nLen)
        *M_ptr++ = 0;                              /* put p0 in M */

    /* generate the blinding value r = LBP-BVGM(sData) */

    if (ntru_bvgm(sData, 3 + pt_len + params->bLen, &hash_ctx, params->N,
                  params->mask, params->binary, params->rLen, params->limit,
                  params->min_outLen, r))
        return 6;

    /* h = OS2REP(pub_key)
     *  Note: h is stored in the R array
     */

    if (params->q < 256) {

        /* one octet per ring element */

        for (i = 0; i < params->N; i++)
            R[i] = (uint16_t) *pub_key++;

    } else {

        /* two octets per ring element */

        for (i = 0; i < params->N; i++) {
            R[i] = ((uint16_t) *pub_key++) << 8;
            R[i] |= (uint16_t) *pub_key++;
        }
    }

    /* R = h * r mod q */

    ntru_ring_mult(R, r, params->rLen, params->binary, params->N, params->q, R);

    /* oR2 = BRE2OSP(R2 = R mod 2)
     *  Note: oR2 is stored in the sData array
     *
     * N is never even so there is always at least one coefficient
     * at the end of R2 to pack into a partially filled octet.
     */

    R_ptr = R;
    for (i = 0; i < (uint32_t) params->nLen - 1; i++) {
        sData[i] = *R_ptr++ & 0x0001;
        for (j = 1; j < 8; j++)
            sData[i] |= (*R_ptr++ & 0x0001) << j; 
    }
    sData[i] = *R_ptr++ & 0x0001;
    for (j = 1; j < (params->N & 0x7); j++)
        sData[i] |= (*R_ptr++ & 0x0001) << j;

    /* m' = MGF1(oR2) ^ M
     *  Note: m' is stored in the M array
     */

    if (ntru_mgf1_xor(sData, params->nLen, &hash_ctx, params->nLen, M))
        return 7;

    /* e = R + OS2BREP(m') *  Note: e is stored in the R array
     *
     * N is never even so there is always one partially filled octet
     * at the end of m'.
     */

    R_ptr = R;
    M_ptr = M;
    for (i = 0; i < (uint32_t) params->nLen - 1; i++)
        for (j = 0; j < 8; j++, R_ptr++)
            if (M_ptr[i] & (1 << j))
                if (++(*R_ptr) == params->q)
                    *R_ptr = 0;
    for (j = 0; j < (params->N & 0x7); j++, R_ptr++)
        if (M_ptr[i] & (1 << j))
            if (++(*R_ptr) == params->q)
                *R_ptr = 0;

    /* ct = RE2OSP(e) */

    if (params->q < 256) {

        /* one octet per ring element */

        for (i = 0; i < params->N; i++)
            *ct++ = (uint8_t) R[i];
        *ct_len = i;

    } else {

        /* two octets per ring element */

        for (i = 0; i < params->N; i++) {
            *ct++ = (uint8_t) (R[i] >> 8);
            *ct++ = (uint8_t) (R[i] & 0xff);
        }
        *ct_len = i << 1;
    }

    return 0;
}


/* ntru_decrypt
 *
 * Implements NTRU decryption (SVES) for the given parameter set.
 *
 * priv_key includes the private key followed by the public key.
 *
 * Returns 0 on success, nonzero otherwise.
 */

uint32_t
ntru_decrypt(
    NTRU_ENCRYPT_PARAM_SET_ID  param_set_id, /*  in - parameter set */
    uint32_t                   priv_key_len, /*  in - no. of octets in private
                                                      key */
    uint8_t const             *priv_key,     /*  in - pointer to private key */
    uint32_t                   ct_len,       /*  in - no. of octets in
                                                      ciphertext */
    uint8_t const             *ct,           /*  in - pointer to ciphertext */
    uint32_t                  *pt_len,       /* out - addr for no. of octets in
                                                      plaintext */
    uint8_t                   *pt)           /* out - addr for plaintext */
{
    NTRU_ENCRYPT_PARAM_SET *params = NULL;
    uint16_t                F_len;
    CRYPTO_HASH_CTX         hash_ctx;
    uint8_t                 sData[((MAX_N + 7) >> 3) + 1];
    uint8_t                 cM[(MAX_N + 7) >> 3];
    uint16_t                cR[MAX_N];
    uint16_t                chkR[MAX_N];
    uint16_t                cr[MAX_R];
    uint8_t                *s_ptr;
    uint8_t                *cM_ptr;
    uint16_t               *cR_ptr;
    uint16_t               *chkR_ptr;
    uint8_t                 cm_len;
    uint16_t                i;
    uint16_t                j;

    /* check arguments */

    if (!priv_key || !ct || !pt_len || !pt)
        return 1;

    /* get parameters for given parameter set */

    if ((params = get_params(param_set_id)) == NULL)
        return 2;

    /* check private-key length
     *  For binary: private key is dF followed by h.
     *  For product: private key is 3 * (df1 = df2 = df3) followed by h.
     *  If N < 256, dF is stored as one octet per index; two octets otherwise.
     *  If q < 256, h is stored as one octet per ring element; two octets
     *   otherwise.
     */

    if (params->binary)
        F_len = params->FLen;
    else
        F_len = 3 * params->FLen;
    if (params->N >= 256)
        F_len <<= 1;
    if (params->q < 256)
        F_len += params->N;
    else
        F_len += params->N << 1;
    if (priv_key_len != (uint32_t) F_len)
        return 3;

    /* check ciphertext length
     *  If q < 256, ct is stored as one octet per ring element; two octets
     *   otherwise.
     */

    if (params->q < 256) {
        if (ct_len != (uint32_t) params->N)
            return 4;
    } else {
        if (ct_len != (uint32_t) params->N << 1)
            return 4;
    }

    /* init the hash context */

    if (crypto_hash_set_alg(params->hash_id, &hash_ctx))
        return 5;

    /* init plaintext length */

    *pt_len = 0;

    /* e = OS2REP(ct)
     *  Note: e is stored in the cR array
     */

    if (params->q < 256) {

        /* one octet per ring element */

        for (i = 0; i < params->N; i++)
            cR[i] = (uint16_t) *ct++;

    } else {

        /* two octets per ring element */

        for (i = 0; i < params->N; i++) {
            cR[i] = ((uint16_t) *ct++) << 8;
            cR[i] |= (uint16_t) *ct++;
        }
    }

    /* F = OS2REP(priv_key)
     *  Note: F is stored in the chkR array
     */

    if (params->binary)
        F_len = params->FLen;
    else
        F_len = 3 * params->FLen;

    if (params->N < 256) {

        /* one octet per index */

        for (i = 0; i < F_len; i++)
            chkR[i] = (uint16_t) *priv_key++;

    } else {

        /* two octets per index */

        for (i = 0; i < F_len; i++) {
            chkR[i] = ((uint16_t) *priv_key++) << 8;
            chkR[i] |= (uint16_t) *priv_key++;
        }
    }

    /* a = (1 + 2F) * e = eF * 2 + e
     *  Note: a is stored in the chkR array
     */

    ntru_ring_mult(cR, chkR, params->FLen, params->binary, params->N,
                   params->q, chkR);
    for (i = 0; i < params->N; i++)
        chkR[i] = ((chkR[i] << 1) + cR[i]) % params->q;

    /* cm' = BRE2OSP(ci = a mod 2)
     * cR = e - (ci = a mod 2)
     *  Note: cm' is stored in the cM array
     *
     * N is never even so there is always at least one coefficient
     * at the end of ci to pack into a partially filled octet.
     */

    chkR_ptr = chkR;
    cR_ptr = cR;
    for (i = 0; i < params->nLen - 1; i++) {
        cM[i] = *chkR_ptr++ & 0x0001;
        if (cM[i])
            if (--(*cR_ptr) == 0xffff)
                *cR_ptr += params->q;
        cR_ptr++;
        for (j = 1; j < 8; j++) {
            uint16_t ci_coeff;

            if (ci_coeff = *chkR_ptr++ & 0x0001) { 
                cM[i] |= ci_coeff << j; 
                if (--(*cR_ptr) == 0xffff)
                    *cR_ptr += params->q;
            }
            cR_ptr++;
        }
    }
    cM[i] = *chkR_ptr++ & 0x0001;
    if (cM[i])
        if (--(*cR_ptr) == 0xffff)
            *cR_ptr += params->q;
    cR_ptr++;
    for (j = 1; j < (params->N & 0x7); j++) {
        uint16_t ci_coeff;

        if (ci_coeff = *chkR_ptr++ & 0x0001) { 
            cM[i] |= ci_coeff << j; 
            if (--(*cR_ptr) == 0xffff)
                *cR_ptr += params->q;
        }
        cR_ptr++;
    }

    /* coR2 = BRE2OSP(cR2 = cR mod 2)
     *  Note: coR2 is stored in the sData array
     *
     * N is never even so there is always at least one coefficient
     * at the end of cR2 to pack into a partially filled octet.
     */

    cR_ptr = cR;
    for (i = 0; i < params->nLen - 1; i++) {
        sData[i] = *cR_ptr++ & 0x0001;
        for (j = 1; j < 8; j++)
            sData[i] |= (*cR_ptr++ & 0x0001) << j; 
    }
    sData[i] = *cR_ptr++ & 0x0001;
    for (j = 1; j < (params->N & 0x7); j++)
        sData[i] |= (*cR_ptr++ & 0x0001) << j;

    /* cm' = MGF1(coR2) ^ cM
     *  Note: cm' is stored in the cM array
     */

    if (ntru_mgf1_xor(sData, params->nLen, &hash_ctx, params->nLen, cM))
        return 6;
    cM[params->nLen - 1] &= params->cM_mask;

    /* parse and verify cm' */

    cm_len = cM[params->bLen];
    if (cm_len > params->max_mLen)
        return 7;
    for (i = params->bLen + 1 + cm_len; i < params->nLen; i++)
        if (cM[i] != 0)
            return 8;

    /* form sData */

    s_ptr = sData;
    for (i = 0; i < 3; i++)
        *s_ptr++ = params->OID[i];          /* put OID in sData */
    cM_ptr = cM + params->bLen + 1;
    for (i = 0; i < cm_len; i++)
        *s_ptr++ = *cM_ptr++;               /* put cm in sData */
    for (i = 0; i < params->bLen; i++)
        *s_ptr++ = cM[i];                   /* put cb in sData */

    /* generate the blinding value cr = LBP-BVGM(sData) */

    if (ntru_bvgm(sData, 3 + cm_len + params->bLen, &hash_ctx, params->N,
                  params->mask, params->binary, params->rLen, params->limit,
                  params->min_outLen, cr))
        return 9;

    /* h = OS2REP(pub_key)
     *  Note: h is stored in the chkR array
     */

    if (params->q < 256) {

        /* one octet per ring element */

        for (i = 0; i < params->N; i++)
            chkR[i] = (uint16_t) *priv_key++;

    } else {

        /* two octets per ring element */

        for (i = 0; i < params->N; i++) {
            chkR[i] = ((uint16_t) *priv_key++) << 8;
            chkR[i] |= (uint16_t) *priv_key++;
        }
    }

    /* cR' = h * cr mod q */

    ntru_ring_mult(chkR, cr, params->rLen, params->binary, params->N,
                   params->q, chkR);

    /* compare cR' to cR */

    for (j = 0; j < params->N; j++)
        if (cR[j] != chkR[j]) /* XXX: silly [i] in original */
            return 10;

    /* output plaintext */

    cM_ptr = cM + params->bLen + 1;
    for (i = 0; i < cm_len; i++)
        *pt++ = *cM_ptr++;
    *pt_len = cm_len;

    return 0;
}


