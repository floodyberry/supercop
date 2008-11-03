#include "crypto_verify_16.h"
#include "crypto_auth1.h"

int crypto_auth1_verify(const unsigned char *h,const unsigned char *in,unsigned long long inlen,const unsigned char *k)
{
  unsigned char correct[16];
  crypto_auth1(correct,in,inlen,k);
  return crypto_verify_16(h,correct);
}
