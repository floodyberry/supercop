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
  long long i;
  for (i = 0;i < SECRETKEY_BYTES;++i) sk[i] = 0;
  for (i = 0;i < PUBLICKEY_BYTES;++i) pk[i] = 0;
  randombytes(sk + PUBLICKEY_BYTES,SECRETKEY_BYTES - PUBLICKEY_BYTES);
  mpz_class p;
  mpz_class a;
  mpz_class base;
  mpz_class result;
  mpz_import(a.get_mpz_t(),SECRETKEY_BYTES - PUBLICKEY_BYTES,-1,1,0,0,sk + PUBLICKEY_BYTES);
  p = "106711310550942323238863446954494903303206603796265590798875260590060843568007841918927773348877395895791048832517368787533445258799160241834659776192282820736018472427221910874308833884006430888272214561307777629540843737689598751552666502301405808925850579645658786877473119117134988654123934303586903124139";
  base = 2;
  mpz_powm(result.get_mpz_t(),base.get_mpz_t(),a.get_mpz_t(),p.get_mpz_t());
  if (mpz_sizeinbase(result.get_mpz_t(),256) > PUBLICKEY_BYTES) return -1;
  mpz_export(pk,0,-1,1,0,0,result.get_mpz_t());
  mpz_export(sk,0,-1,1,0,0,result.get_mpz_t());
  return 0;
}
