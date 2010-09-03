#include "crypto_hash.h"
#include "sph_fugue.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_fugue512_context mc;
  sph_fugue512_init(&mc);
  sph_fugue512(&mc, in, inlen);
  sph_fugue512_close(&mc,out);
  return 0;
}
      
