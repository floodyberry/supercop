#include "crypto_hash.h"
#include "sph_blake.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_blake512_context mc;
  sph_blake512_init(&mc);
  sph_blake512(&mc, in, inlen);
  sph_blake512_close(&mc,out);
  return 0;
}
      
