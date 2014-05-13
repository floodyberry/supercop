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

static uint8_t get_entropy(ENTROPY_CMD cmd, uint8_t *out)
{
    static uint8_t seed[SEED_LENGTH];
    static size_t index;
    
    if (cmd == INIT) {
        randombytes(seed, sizeof(seed));
        index = 0;
        return 1;
    }
    
    if (out == NULL)
        return 0;
    
    if (cmd == GET_NUM_BYTES_PER_BYTE_OF_ENTROPY) {
        *out = 1;
        return 1;
    }
    
    if (cmd == GET_BYTE_OF_ENTROPY) {
        if (index == sizeof(seed))
        {
            randombytes(seed, sizeof(seed));
            index = 0;
        }
        
        *out = seed[index++];
        return 1;
    }
    return 0;
}

int crypto_encrypt_keypair(uint8_t *pk, uint8_t *sk) {
    
    NTRU_ENCRYPT_PARAM_SET_ID param_set_id = EBATS_PARAM_SET_ID;
    uint16_t pk_len = 0;
    uint16_t sk_len = 0;
    DRBG_HANDLE drbg;
    
    if (!sk || !pk) {
        return -1;
    }
    
    if (ntru_crypto_drbg_instantiate(SEC_STRENGTH, NULL, 0, (ENTROPY_FN) &get_entropy, &drbg) != DRBG_OK) {
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
    
    if (ntru_crypto_drbg_instantiate(SEC_STRENGTH, NULL, 0, (ENTROPY_FN) &get_entropy, &drbg) != DRBG_OK) {
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

