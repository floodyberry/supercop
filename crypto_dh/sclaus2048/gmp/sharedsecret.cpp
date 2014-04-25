#include <gmpxx.h>
#include "crypto_dh.h"

#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES
#define SHAREDSECRET_BYTES crypto_dh_BYTES

int crypto_dh(
  unsigned char *s,
  const unsigned char *pk,
  const unsigned char *sk
)
{
  mpz_class p;
  p = MODULUS;
  mpz_class a;
  mpz_class base;
  mpz_class result;
  mpz_import(a.get_mpz_t(),SECRETKEY_BYTES,-1,1,0,0,sk);
  mpz_import(base.get_mpz_t(),PUBLICKEY_BYTES,-1,1,0,0,pk);
  mpz_powm(result.get_mpz_t(),base.get_mpz_t(),a.get_mpz_t(),p.get_mpz_t());
  if (mpz_sizeinbase(result.get_mpz_t(),256) > SHAREDSECRET_BYTES) return -1;
  long long i;
  for (i = 0;i < SHAREDSECRET_BYTES;++i) s[i] = 0;
  mpz_export(s,0,-1,1,0,0,result.get_mpz_t());
  return 0;
}
