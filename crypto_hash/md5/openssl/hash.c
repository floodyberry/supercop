#include <stddef.h>
#include <openssl/md5.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  MD5(in,inlen,out);
  return 0;
}
