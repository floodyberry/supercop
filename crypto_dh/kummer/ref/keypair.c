#include "randombytes.h"
#include "crypto_scalarmult_kummer.h"
#include "crypto_dh.h"

int crypto_dh_keypair(unsigned char *pk,unsigned char *sk)
{
  randombytes(sk,32);
  crypto_scalarmult_kummer_base(pk,sk);
  return 0;
}
