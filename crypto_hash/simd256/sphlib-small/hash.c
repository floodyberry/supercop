#include "crypto_hash.h"
#include "sph_simd.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_simd256_context mc;
  sph_simd256_init(&mc);
  sph_simd256(&mc, in, inlen);
  sph_simd256_close(&mc,out);
  return 0;
}
      
