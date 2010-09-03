#include "crypto_hash.h"
#include "sph_jh.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_jh512_context mc;
  sph_jh512_init(&mc);
  sph_jh512(&mc, in, inlen);
  sph_jh512_close(&mc,out);
  return 0;
}
      
