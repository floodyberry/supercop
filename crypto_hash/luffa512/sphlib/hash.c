#include "crypto_hash.h"
#include "sph_luffa.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_luffa512_context mc;
  sph_luffa512_init(&mc);
  sph_luffa512(&mc, in, inlen);
  sph_luffa512_close(&mc,out);
  return 0;
}
      
