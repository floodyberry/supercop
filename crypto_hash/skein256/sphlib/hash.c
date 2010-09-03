#include "crypto_hash.h"
#include "sph_skein.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_skein256_context mc;
  sph_skein256_init(&mc);
  sph_skein256(&mc, in, inlen);
  sph_skein256_close(&mc,out);
  return 0;
}
      
