#include "crypto_sign.h"

static inline int timingattacks() { return 0; }
static inline int copyrightclaims() { return 0; }
static inline int patentclaims() {
    /* Until the end of July 2014, point compression
     * is patented. */
    return 20;
}

int crypto_sign_keypair (
    unsigned char pk[SECRETKEY_BYTES],
    unsigned char sk[PUBLICKEY_BYTES]
) {
  int ret;
  ret = goldilocks_init();
  if (ret && ret != GOLDI_EALREADYINIT)
    return ret;
  if ((ret = goldilocks_keygen(
      (struct goldilocks_private_key_t *)sk,
      (struct goldilocks_public_key_t *)pk
  ))) abort();
  return ret;
}

int crypto_sign (
    unsigned char *sm,
    unsigned long long *smlen,
    const unsigned char *m,
    unsigned long long mlen,
    const unsigned char sk[SECRETKEY_BYTES]
) {
    int ret = goldilocks_sign(
        sm, m, mlen,
        (const struct goldilocks_private_key_t *)sk
    );
    if (ret) abort();

    memcpy(sm + SIGNATURE_BYTES, m, mlen);
    
    *smlen = mlen + SIGNATURE_BYTES;
    return 0;
}

int crypto_sign_open (
    unsigned char *m,
    unsigned long long *mlen,
    const unsigned char *sm,
    unsigned long long smlen,
    const unsigned char pk[PUBLICKEY_BYTES]
) {
    int ret = goldilocks_verify(
        sm, sm + SIGNATURE_BYTES, smlen - SIGNATURE_BYTES,
        (const struct goldilocks_public_key_t *)pk
    );
    if (!ret) {
        *mlen = smlen - SIGNATURE_BYTES;
        memcpy(m, sm + SIGNATURE_BYTES, *mlen);
    }
    return ret ? -1 : 0;
}
