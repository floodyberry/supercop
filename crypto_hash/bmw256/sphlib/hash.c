#include "crypto_hash.h"
#include "sph_bmw.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_bmw256_context mc;
  sph_bmw256_init(&mc);
  sph_bmw256(&mc, in, inlen);
  sph_bmw256_close(&mc,out);
  return 0;
}
      
