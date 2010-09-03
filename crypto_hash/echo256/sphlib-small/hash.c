#include "crypto_hash.h"
#include "sph_echo.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_echo256_context mc;
  sph_echo256_init(&mc);
  sph_echo256(&mc, in, inlen);
  sph_echo256_close(&mc,out);
  return 0;
}
      
