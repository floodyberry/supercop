#include "crypto_scalarmult_kummer.h"
#include "crypto_dh.h"

int crypto_dh(unsigned char *s,const unsigned char *pk,const unsigned char *sk)
{
  crypto_scalarmult_kummer(s,sk,pk);
  return 0;
}
