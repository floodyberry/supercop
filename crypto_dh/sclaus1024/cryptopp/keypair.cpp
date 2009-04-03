#include <cryptopp/dh.h>
#include "crypto_dh.h"
#include "randombytes.h"

#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES

using namespace CryptoPP;

int crypto_dh_keypair(
  unsigned char *pk,
  unsigned char *sk
)
{
  randombytes(sk, SECRETKEY_BYTES);
  static Integer p(MODULUS);
  static Integer base = 2;
  Integer a(sk, SECRETKEY_BYTES);
  Integer result = a_exp_b_mod_c(base, a, p);
  result.Encode(pk, PUBLICKEY_BYTES);
  return 0;
}

