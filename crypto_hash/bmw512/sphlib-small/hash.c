#include "crypto_hash.h"
#include "sph_bmw.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_bmw512_context mc;
  sph_bmw512_init(&mc);
  sph_bmw512(&mc, in, inlen);
  sph_bmw512_close(&mc,out);
  return 0;
}
      
