#include "crypto_hash.h"
#include "sph_shabal.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_shabal256_context mc;
  sph_shabal256_init(&mc);
  sph_shabal256(&mc, in, inlen);
  sph_shabal256_close(&mc,out);
  return 0;
}
      
