#include "crypto_hash.h"
#include "sph_shabal.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_shabal512_context mc;
  sph_shabal512_init(&mc);
  sph_shabal512(&mc, in, inlen);
  sph_shabal512_close(&mc,out);
  return 0;
}
      
