#include "crypto_hash.h"
#include "sph_cubehash.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_cubehash512_context mc;
  sph_cubehash512_init(&mc);
  sph_cubehash512(&mc, in, inlen);
  sph_cubehash512_close(&mc,out);
  return 0;
}
      
