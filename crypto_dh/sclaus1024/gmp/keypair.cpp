#include <gmpxx.h>
#include "crypto_dh.h"
#include "randombytes.h"

#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES

int crypto_dh_keypair(
  unsigned char *pk,
  unsigned char *sk
)
{
  randombytes(sk, SECRETKEY_BYTES);
  mpz_class p;
  p = MODULUS;
  mpz_class a;
  static mpz_class base = 2;
  mpz_class result;
  mpz_import(a.get_mpz_t(),SECRETKEY_BYTES,-1,1,0,0,sk);
  mpz_powm(result.get_mpz_t(),base.get_mpz_t(),a.get_mpz_t(),p.get_mpz_t());
  if (mpz_sizeinbase(result.get_mpz_t(),256) > PUBLICKEY_BYTES) return -1;
  long long i;
  for (i = 0;i < PUBLICKEY_BYTES;++i) pk[i] = 0;
  mpz_export(pk,0,-1,1,0,0,result.get_mpz_t());
  return 0;
}
