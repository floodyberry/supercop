#include "crypto_hash.h"
#include "sph_shavite.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_shavite512_context mc;
  sph_shavite512_init(&mc);
  sph_shavite512(&mc, in, inlen);
  sph_shavite512_close(&mc,out);
  return 0;
}
      
