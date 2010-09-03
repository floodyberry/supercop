#include "crypto_hash.h"
#include "sph_simd.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_simd512_context mc;
  sph_simd512_init(&mc);
  sph_simd512(&mc, in, inlen);
  sph_simd512_close(&mc,out);
  return 0;
}
      
