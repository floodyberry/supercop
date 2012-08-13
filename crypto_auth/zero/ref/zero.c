#include "crypto_auth.h"

int crypto_auth(unsigned char *out,const unsigned char *in,unsigned long long inlen,const unsigned char *k)
{
  int i;
  for (i = 0;i < crypto_auth_BYTES;++i) out[i] = 0;
  return 0;
}

int crypto_auth_verify(const unsigned char *h,const unsigned char *in,unsigned long long inlen,const unsigned char *k)
{
  int i;
  unsigned int differentbits = 0;
  for (i = 0;i < crypto_auth_BYTES;++i) differentbits |= h[i];
  return (1 & ((differentbits - 1) >> 8)) - 1;
}
