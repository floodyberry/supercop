#include "crypto_hash_sha256.h"
#include "crypto_sign.h"
#include "sizes.h"

extern int signedshortmessage(unsigned char *,unsigned long long *,
  const unsigned char *,unsigned long long,const unsigned char *,unsigned long long);
extern int shortmessagesigned(unsigned char *,unsigned long long *,
  const unsigned char *,unsigned long long,const unsigned char *,unsigned long long);

int crypto_sign(
  unsigned char *sm,unsigned long long *smlen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *sk
)
{
  unsigned char h[SHORTMESSAGE_BYTES];
  int i;

  if (mlen < SHORTMESSAGE_BYTES) return signedshortmessage(sm,smlen,m,mlen,sk,SECRETKEY_BYTES);

  if (SHORTMESSAGE_BYTES < 32) return -1;
  crypto_hash_sha256(h,m,mlen);
  for (i = 32;i < SHORTMESSAGE_BYTES;++i) h[i] = m[i - 32];

  if (signedshortmessage(sm,smlen,h,SHORTMESSAGE_BYTES,sk,SECRETKEY_BYTES) < 0) return -1;
  for (i = SHORTMESSAGE_BYTES - 32;i < mlen;++i) {
    sm[*smlen] = m[i];
    ++*smlen;
  }
  return 0;
}

int crypto_sign_open(
  unsigned char *m,unsigned long long *mlen,
  const unsigned char *sm,unsigned long long smlen,
  const unsigned char *pk
)
{
  unsigned char h[SHORTMESSAGE_BYTES];
  unsigned long long hlen;
  int i;
  unsigned char hcheck[32];
  unsigned char hchecksum;

  if (smlen < SIGNATURE_BYTES) return -100;
  i = shortmessagesigned(h,&hlen,sm,SIGNATURE_BYTES,pk,PUBLICKEY_BYTES);
  if (i < 0) return i;

  if (hlen < SHORTMESSAGE_BYTES) {
    for (i = 0;i < hlen;++i) m[i] = h[i];
    *mlen = hlen;
    return 0;
  }

  for (i = 32;i < SHORTMESSAGE_BYTES;++i) m[i - 32] = h[i];
  for (i = SIGNATURE_BYTES;i < smlen;++i) m[i - SIGNATURE_BYTES + SHORTMESSAGE_BYTES - 32] = sm[i];
  *mlen = smlen - SIGNATURE_BYTES + SHORTMESSAGE_BYTES - 32;
  crypto_hash_sha256(hcheck,m,*mlen);
  hchecksum = 0;
  for (i = 0;i < 32;++i) hchecksum |= (hcheck[i] ^ h[i]);
  if (hchecksum) return -100;
  return 0;
}
