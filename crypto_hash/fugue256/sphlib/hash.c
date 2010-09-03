#include "crypto_hash.h"
#include "sph_fugue.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_fugue256_context mc;
  sph_fugue256_init(&mc);
  sph_fugue256(&mc, in, inlen);
  sph_fugue256_close(&mc,out);
  return 0;
}
      
