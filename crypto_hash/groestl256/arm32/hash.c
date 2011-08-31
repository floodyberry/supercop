#include "crypto_hash.h"
#include "groestl.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_groestl256_context mc;
  sph_groestl256_init(&mc);
  sph_groestl256(&mc, in, inlen);
  sph_groestl256_close(&mc,out);
  return 0;
}
