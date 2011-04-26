#include "crypto_hash.h"
#include "sph_blake.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_blake256_context mc;
  sph_blake256_init(&mc);
  sph_blake256(&mc, in, inlen);
  sph_blake256_close(&mc,out);
  return 0;
}
      
