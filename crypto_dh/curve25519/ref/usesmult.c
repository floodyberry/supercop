#include "randombytes.h"
#include "crypto_smult_curve25519.h"
#include "crypto_dh.h"

int crypto_dh_keypair(unsigned char *pk,unsigned char *sk)
{
  randombytes(sk,crypto_smult_curve25519_SCALARBYTES);
  crypto_smult_curve25519_base(pk,sk);
  return 0;
}

int crypto_dh(unsigned char *s,const unsigned char *pk,const unsigned char *sk)
{
  crypto_smult_curve25519(s,sk,pk);
  return 0;
}
