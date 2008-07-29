#include <stddef.h>
#include <openssl/ripemd.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  RIPEMD160(in,inlen,out);
  return 0;
}
