#include "crypto_hash.h"
#include "sph_keccak.h"
  
int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  sph_keccak256_context mc;
  sph_keccak256_init(&mc);
  sph_keccak256(&mc, in, inlen);
  sph_keccak256_close(&mc,out);
  return 0;
}
      
