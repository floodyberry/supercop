#include "crypto_hash.h"
#include "sph_hamsi.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_hamsi512_context mc;
  sph_hamsi512_init(&mc);
  sph_hamsi512(&mc, in, inlen);
  sph_hamsi512_close(&mc,out);
  return 0;
}
      
