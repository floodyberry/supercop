#include "crypto_stream_salsa20.h"
#include "crypto_hash_sha256.h"
#include "randombytes.h"
#include "sizes.h"

extern int shortplaintext(unsigned char *,unsigned long long *,
  const unsigned char *,unsigned long long,const unsigned char *,unsigned long long);
extern int shortciphertext(unsigned char *,unsigned long long *,
  const unsigned char *,unsigned long long,const unsigned char *,unsigned long long);

static const unsigned char nonce[16]; /* one-time key doesn't need variable nonce */

int crypto_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,const unsigned long long mlen,
  const unsigned char *pk
)
{
  unsigned char h[SHORTPLAINTEXT_BYTES];
  int i;

  if (mlen < SHORTPLAINTEXT_BYTES) return shortciphertext(c,clen,m,mlen,pk,PUBLICKEY_BYTES);
  if (SHORTPLAINTEXT_BYTES < 32 + 32) return -1;

  randombytes(h,32);
  crypto_stream_salsa20_xor(c + ENCRYPTION_BYTES - (SHORTPLAINTEXT_BYTES - 64),m,mlen,nonce,h);
  crypto_hash_sha256(h + 32,c + ENCRYPTION_BYTES - (SHORTPLAINTEXT_BYTES - 64),mlen);
  for (i = 0;i < SHORTPLAINTEXT_BYTES - 64;++i)
    h[i + 64] = c[i + ENCRYPTION_BYTES - (SHORTPLAINTEXT_BYTES - 64)];

  if (shortciphertext(c,clen,h,SHORTPLAINTEXT_BYTES,pk,PUBLICKEY_BYTES) < 0) return -1;
  if (*clen != ENCRYPTION_BYTES) return -1;
  *clen = mlen + ENCRYPTION_BYTES - (SHORTPLAINTEXT_BYTES - 64);
  return 0;
}

int crypto_encrypt_open(
  unsigned char *m,unsigned long long *mlen,
  const unsigned char *c,const unsigned long long clen,
  const unsigned char *sk
)
{
  unsigned char h[SHORTPLAINTEXT_BYTES];
  unsigned long long hlen;
  unsigned char hcheck[32];
  int i;
  unsigned char hchecksum;

  if (clen < ENCRYPTION_BYTES) return -100;
  i = shortplaintext(h,&hlen,c,ENCRYPTION_BYTES,sk,SECRETKEY_BYTES);
  if (i < 0) return i;

  if (hlen < SHORTPLAINTEXT_BYTES) {
    for (i = 0;i < hlen;++i) m[i] = h[i];
    *mlen = hlen;
    return 0;
  }

  for (i = 64;i < SHORTPLAINTEXT_BYTES;++i) m[i - 64] = h[i];
  for (i = ENCRYPTION_BYTES;i < clen;++i)
    m[i - ENCRYPTION_BYTES + SHORTPLAINTEXT_BYTES - 64] = c[i];
  *mlen = clen - ENCRYPTION_BYTES + SHORTPLAINTEXT_BYTES - 64;
  crypto_hash_sha256(hcheck,m,*mlen);
  hchecksum = 0;
  for (i = 0;i < 32;++i) hchecksum |= (hcheck[i] ^ h[i + 32]);
  if (hchecksum) return -100;

  crypto_stream_salsa20_xor(m,m,*mlen,nonce,h);
  return 0;
}
