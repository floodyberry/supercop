#include <stddef.h>
#include <openssl/md2.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  MD2(in,inlen,out);
  return 0;
}
