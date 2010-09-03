#include "crypto_hash.h"
#include "sph_keccak.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_keccak512_context mc;
  sph_keccak512_init(&mc);
  sph_keccak512(&mc, in, inlen);
  sph_keccak512_close(&mc,out);
  return 0;
}
      
