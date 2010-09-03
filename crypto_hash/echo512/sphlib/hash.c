#include "crypto_hash.h"
#include "sph_echo.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_echo512_context mc;
  sph_echo512_init(&mc);
  sph_echo512(&mc, in, inlen);
  sph_echo512_close(&mc,out);
  return 0;
}
      
