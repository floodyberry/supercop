/******************************************************************************
 *
 * File: ebats.c
 *
 * Contents: API for eBAT public-key encryption software.
 *
 *****************************************************************************/

#include <stdio.h>
#include "ntru_crypto.h"
#include "randombytes.h"
#include "sizes.h"

#if defined(EES401EP2)
#define EBATS_PARAM_SET_ID NTRU_EES401EP2
#elif defined(EES439EP1)
#define EBATS_PARAM_SET_ID NTRU_EES439EP1
#elif defined(EES593EP1)
#define EBATS_PARAM_SET_ID NTRU_EES593EP1
#elif defined(EES743EP1)
#define EBATS_PARAM_SET_ID NTRU_EES743EP1
#endif

int copyrightclaims(void)
{
    return 0;
}

int patentclaims(void)
{
    return 30;
}

int
randombytesfn(unsigned char*x, unsigned long long xlen)
{
    randombytes(x,xlen);
    DRBG_RET(DRBG_OK);
}

int crypto_encrypt_keypair(uint8_t *pk, uint8_t *sk) {
    
    NTRU_ENCRYPT_PARAM_SET_ID param_set_id = EBATS_PARAM_SET_ID;
    uint16_t pk_len = 0;
    uint16_t sk_len = 0;
    DRBG_HANDLE drbg;
    
    if (!sk || !pk) {
        return -1;
    }
    
    if (ntru_crypto_external_drbg_instantiate((RANDOM_BYTES_FN) &randombytesfn, &drbg) != DRBG_OK) {
        return -2;
    }
    
    if (ntru_crypto_ntru_encrypt_keygen(drbg, param_set_id, &pk_len, NULL, &sk_len, NULL) != NTRU_OK) {
        return -3;
    }
    
    if (ntru_crypto_ntru_encrypt_keygen(drbg, param_set_id, &pk_len, pk, &sk_len, sk) != NTRU_OK) {
        return -4;
    }
    
    if (ntru_crypto_drbg_uninstantiate(drbg) != DRBG_OK) {
        return -5;
    }
    
    return 0;
}

int shortciphertext(uint8_t *c, uint64_t *clen, const uint8_t *m, uint64_t mlen, const uint8_t *pk, uint64_t pklen) {
    
    uint16_t ct_len = 0;
    DRBG_HANDLE drbg;
    
    if (!pk || !m || !c || !clen) {
        return -1;
    }

    if ((pklen > 0xffff ) || (mlen > 0xffff)) {
        return -2;
    }
    
    if (ntru_crypto_external_drbg_instantiate((RANDOM_BYTES_FN) &randombytesfn, &drbg) != DRBG_OK) {
        return -3;
    }
    
    if (ntru_crypto_ntru_encrypt(drbg, (uint16_t) pklen, pk, (uint16_t) mlen, m, &ct_len, NULL) != NTRU_OK) {
        return -4;
    }
    
    if (ntru_crypto_ntru_encrypt(drbg, (uint16_t) pklen, pk, (uint16_t) mlen, m, &ct_len, c) != NTRU_OK) {
        return -5;
    }
    
    *clen = (uint64_t)ct_len;
    
    if (ntru_crypto_drbg_uninstantiate(drbg) != DRBG_OK) {
        return -6;
    }
    
    return 0;
}

int shortplaintext(uint8_t *m, uint64_t *mlen, const uint8_t *c, uint64_t clen, const uint8_t *sk, uint64_t sklen) {
    
    uint16_t pt_len = 0;
    
    if (!sk || !c || !m || !mlen) {
        return -1;
    }
    
    if ((sklen > 0xffff) || (clen > 0xffff)) {
        return -2;
    }
    
    if (ntru_crypto_ntru_decrypt((uint16_t) sklen, sk, (uint16_t) clen, c, &pt_len, NULL) != NTRU_OK) {
        return -3;
    }
    
    if (ntru_crypto_ntru_decrypt((uint16_t) sklen, sk, (uint16_t) clen, c, &pt_len, m) != NTRU_OK)
    {
        return -4;
    }
  
    *mlen = (uint64_t) pt_len;
    
    return 0;
}

