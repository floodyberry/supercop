#include "crypto_hash.h"
#include "sph_groestl.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_groestl512_context mc;
  sph_groestl512_init(&mc);
  sph_groestl512(&mc, in, inlen);
  sph_groestl512_close(&mc,out);
  return 0;
}
      
