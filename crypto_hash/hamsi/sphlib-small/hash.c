#include "crypto_hash.h"
#include "sph_hamsi.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_hamsi256_context mc;
  sph_hamsi256_init(&mc);
  sph_hamsi256(&mc, in, inlen);
  sph_hamsi256_close(&mc,out);
  return 0;
}
      
