#include "crypto_hash.h"
#include "sph_luffa.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_luffa256_context mc;
  sph_luffa256_init(&mc);
  sph_luffa256(&mc, in, inlen);
  sph_luffa256_close(&mc,out);
  return 0;
}
      
