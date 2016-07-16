#include "crypto_aead.h"
#include "api.h"
#include "tiaoxin-optimized.h"


int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  return tiaoxin_optimized_encrypt( ad , adlen, m, mlen, nsec, npub, k, c, clen );
}

int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *mlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
)
{
  return tiaoxin_optimized_decrypt( m , mlen, nsec, c, clen, ad, adlen, npub, k);  
}
