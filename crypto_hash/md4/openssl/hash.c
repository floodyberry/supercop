#include <stddef.h>
#include <openssl/md4.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  MD4(in,inlen,out);
  return 0;
}
