// encrypt.c
// 07-Feb-14  Markku-Juhani O. Saarinen <mjos@iki.fi>
// CAESAR Round 1 API Interface for STRIBOBr1

#include "stribob.h"
#include "api.h"
#include "crypto_aead.h"

// MAC Size is determined by how many extra bytes are left..
#if (CRYPTO_ABYTES < CRYPTO_NSECBYTES)
#error "CRYPTO_ABYTES < CRYPTO_NSECBYTES"
#endif
#define SBOB_MACSIZE (CRYPTO_ABYTES - CRYPTO_NSECBYTES)

// Encryption
int crypto_aead_encrypt(
    unsigned char *c, unsigned long long *clen,         // Ciphertext out
    const unsigned char *m, unsigned long long mlen,    // Plaintext in
    const unsigned char *ad, unsigned long long adlen,  // AAD in
    const unsigned char *nsec,                          // Secret Nonce in
    const unsigned char *npub,                          // Public Nonce in
    const unsigned char *k)                             // Secret Key in
{
    sbob_t  cb;                         // Local state

    sbob_clr(&cb);                      // Clear state

#if (CRYPTO_KEYBYTES > 0)
    // Secret Key
    sbob_put(&cb, BLNK_KEY, k, CRYPTO_KEYBYTES);
    sbob_fin(&cb, BLNK_KEY);
#endif

#if (CRYPTO_NPUBBYTES > 0)
    // Mix the public seq. number
    sbob_put(&cb, BLNK_NPUB, npub, CRYPTO_NPUBBYTES);
    sbob_fin(&cb, BLNK_NPUB);
#endif

#if (CRYPTO_NSECBYTES > 0)
    // Secret Sequence Number, store at start of c
    sbob_enc(&cb, BLNK_NSEC, c, nsec, CRYPTO_NSECBYTES);
    sbob_fin(&cb, BLNK_NSEC);
    c += CRYPTO_NSEC_BYTES:
#endif

    // Associated Data
    sbob_put(&cb, BLNK_AAD, ad, (size_t) adlen);
    sbob_fin(&cb, BLNK_AAD);

    // Encrypt Message
    sbob_enc(&cb, BLNK_MSG, c, m, (size_t) mlen);
    sbob_fin(&cb, BLNK_MSG);
    c += mlen;

#if (SBOB_MACSIZE > 0)
    sbob_get(&cb, BLNK_MAC, c, SBOB_MACSIZE);
    //sbob_fin(&cb, BLNK_MAC);          // Required if MAC-and-Continue
#endif
    sbob_clr(&cb);                      // Clear sensitive data

    *clen = mlen + CRYPTO_ABYTES;       // store length

    return 0;                           // Success.
}


// Decryption

int crypto_aead_decrypt(
    unsigned char *m, unsigned long long *outputmlen,   // Plaintext out
    unsigned char *nsec,                                // Secret Nonce out
    const unsigned char *c, unsigned long long clen,    // Ciphertext in
    const unsigned char *ad, unsigned long long adlen,  // AAD in
    const unsigned char *npub,                          // Public Nonce in
    const unsigned char *k)                             // Secret Key in
{
    sbob_t  cb;                         // Local state

    if (clen < CRYPTO_ABYTES)
        return -1;
    clen -= CRYPTO_ABYTES;

    sbob_clr(&cb);                      // Clear state

#if (CRYPTO_KEYBYTES > 0)
    // Secret Key
    sbob_put(&cb, BLNK_KEY, k, CRYPTO_KEYBYTES);
    sbob_fin(&cb, BLNK_KEY);
#endif

#if (CRYPTO_NPUBBYTES > 0)
    // Mix the public seq. number
    sbob_put(&cb, BLNK_NPUB, npub, CRYPTO_NPUBBYTES);
    sbob_fin(&cb, BLNK_NPUB);
#endif

#if (CRYPTO_NSECBYTES > 0)
    // Decrypt Secret Sequence Number, store at start of c
    sbob_dec(&cb, BLNK_NSEC, nsec, c, CRYPTO_NSECBYTES);
    sbob_fin(&cb, BLNK_NSEC);
    c += CRYPTO_NSEC_BYTES:
#endif

    // Associated Data
    sbob_put(&cb, BLNK_AAD, ad, (size_t) adlen);
    sbob_fin(&cb, BLNK_AAD);

    // Decrypt Message
    sbob_dec(&cb, BLNK_MSG, m, c, (size_t) clen);
    sbob_fin(&cb, BLNK_MSG);
    c += clen;

#if (SBOB_MACSIZE > 0)
    if (sbob_cmp(&cb, BLNK_MAC, c, SBOB_MACSIZE) != 0)
        return -1;                      // Authentication Failure
    //sbob_fin(&cb, BLNK_MAC);          // Required if MAC-and-Continue
#endif

    sbob_clr(&cb);                      // Clear sensitive data
    *outputmlen = clen;

    return 0;       // Success.
}

