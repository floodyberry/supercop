#include <cryptopp/dh.h>
#include "crypto_dh.h"

#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES
#define SHAREDSECRET_BYTES crypto_dh_BYTES

using namespace CryptoPP;

int crypto_dh(
  unsigned char *s,
  const unsigned char *pk,
  const unsigned char *sk
)
{
  Integer base(pk, PUBLICKEY_BYTES);
  Integer a(sk, SECRETKEY_BYTES);
  static Integer p(MODULUS);
  Integer result = a_exp_b_mod_c(base, a, p);
  result.Encode(s, SHAREDSECRET_BYTES);
  return 0;
}

