#include "crypto_hash.h"
#include "sph_jh.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_jh256_context mc;
  sph_jh256_init(&mc);
  sph_jh256(&mc, in, inlen);
  sph_jh256_close(&mc,out);
  return 0;
}
      
