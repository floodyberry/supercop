/******************************************************************************
 *
 * File: ebats.c
 *
 * Contents: API for eBAT public-key encryption software.
 *
 *****************************************************************************/

#include "ntru_encrypt_keygen.h"
#include "ntru_encrypt.h"
#include "sizes.h"

#if defined(EES251EP6)
#define EBATS_PARAM_SET_ID    NTRU_EES251EP6
#elif defined(EES251EP7)
#define EBATS_PARAM_SET_ID    NTRU_EES251EP7
#elif defined(EES347EP2)
#define EBATS_PARAM_SET_ID    NTRU_EES347EP2
#elif defined(EES347EP3)
#define EBATS_PARAM_SET_ID    NTRU_EES347EP3
#elif defined(EES397EP1)
#define EBATS_PARAM_SET_ID    NTRU_EES397EP1
#elif defined(EES397EP2)
#define EBATS_PARAM_SET_ID    NTRU_EES397EP2
#elif defined(EES491EP1)
#define EBATS_PARAM_SET_ID    NTRU_EES491EP1
#elif defined(EES491EP2)
#define EBATS_PARAM_SET_ID    NTRU_EES491EP2
#elif defined(EES587EP1)
#define EBATS_PARAM_SET_ID    NTRU_EES587EP1
#elif defined(EES587EP2)
#define EBATS_PARAM_SET_ID    NTRU_EES587EP2
#elif defined(EES787EP1)
#define EBATS_PARAM_SET_ID    NTRU_EES787EP1
#elif defined(EES787EP2)
#define EBATS_PARAM_SET_ID    NTRU_EES787EP2
#endif

/* copyrightclaims
 *
 * Reports copyright claims on this software for eBATS submission.
 *
 * Returns that the author has financial connections to a copyright
 * restricting distribution of this software.
 */

int
copyrightclaims(void)
{
    return 30;
}


/* patentclaims
 *
 * Reports patent claims on this software for eBATS submission.
 *
 * Returns that the author has financial connections to a patent
 * restricting use of this software.
 */

int
patentclaims(void)
{
    return 30;
}


/* keypair
 *
 * Generates an encryption key pair consisting of a private key and a public
 * key.  For NTRU, the secret key contains both the private and public keys.
 *
 * Returns 0 if successful,
 *        -1 if key generation fails.
 */

int
crypto_encrypt_keypair(
    uint8_t    *pk,             /* out - addr for public key */
    uint8_t    *sk)             /* out - addr for secret key */
{
    NTRU_ENCRYPT_PARAM_SET_ID   param_set_id = EBATS_PARAM_SET_ID;
    uint32_t                    priv_key_len;
    uint32_t                    pub_key_len;

    if (!sk || !pk)
        return -1;
    if (ntru_encrypt_keygen(param_set_id, &priv_key_len, sk, &pub_key_len, pk))
        return -1;

    return 0;
}


/* shortciphertext
 *
 * Encrypts a message using a public key.
 *
 * Returns 0 if successful,
 *        -1 if encryption fails (e.g. if the message is too long).
 */

int
shortciphertext(
    uint8_t       *c,           /* out - addr for ciphertext */
    uint64_t      *clen,        /* out - addr for no. of bytes in ciphertext */
    uint8_t const *m,           /*  in - pointer to message */
    uint64_t       mlen,        /*  in - no. of bytes in message */
    uint8_t const *pk,          /*  in - pointer to public key */
    uint64_t       pklen        /*  in - no. of bytes in public key */
    )       
{
    NTRU_ENCRYPT_PARAM_SET_ID   param_set_id = EBATS_PARAM_SET_ID;
    uint32_t                    ct_len;

    if (!pk || !m || !c || !clen)
        return -1;
    if ((pklen > 0xffffffff ) || (mlen > 0xffffffff))
        return -1;
    if (ntru_encrypt(param_set_id, (uint32_t) pklen, pk, (uint32_t) mlen, m,
                     &ct_len, c))
        return -1;
    *clen = (uint64_t) ct_len;

    return 0;
}


/* shortplaintext
 *
 * Decrypts ciphertext using a secret key.  For NTRU, the secret key contains
 * both the private and public keys.
 *
 * Returns 0 if successful,
 *        -1 if decryption fails.
 */

int
shortplaintext(
    uint8_t       *m,           /* out - addr for plaintext */
    uint64_t      *mlen,        /* out - addr for no. of bytes in plaintext */
    uint8_t const *c,           /*  in - pointer to ciphertext */
    uint64_t       clen,        /*  in - no. of bytes in ciphertext */
    uint8_t const *sk,          /*  in - pointer to secret key */
    uint64_t       sklen        /*  in - no. of bytes in secret key */
    )
{
    NTRU_ENCRYPT_PARAM_SET_ID   param_set_id = EBATS_PARAM_SET_ID;
    uint32_t                    pt_len;

    if (!sk || !c || !m || !mlen)
        return -1;
    if ((sklen > 0xffffffff) || (clen > 0xffffffff))
        return -1;
    if (ntru_decrypt(param_set_id, (uint32_t) sklen, sk, (uint32_t) clen, c,
                     &pt_len, m))
        return -1;
    *mlen = (uint64_t) pt_len;

    return 0;
}


