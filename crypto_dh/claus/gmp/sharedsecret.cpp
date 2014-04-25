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
  mpz_class a;
  mpz_class base;
  mpz_class result;
  mpz_import(a.get_mpz_t(),SECRETKEY_BYTES - PUBLICKEY_BYTES,-1,1,0,0,sk + PUBLICKEY_BYTES);
  mpz_import(base.get_mpz_t(),PUBLICKEY_BYTES,-1,1,0,0,pk);
  p = "106711310550942323238863446954494903303206603796265590798875260590060843568007841918927773348877395895791048832517368787533445258799160241834659776192282820736018472427221910874308833884006430888272214561307777629540843737689598751552666502301405808925850579645658786877473119117134988654123934303586903124139";
  mpz_powm(result.get_mpz_t(),base.get_mpz_t(),a.get_mpz_t(),p.get_mpz_t());
  if (mpz_sizeinbase(result.get_mpz_t(),256) > SHAREDSECRET_BYTES) return -1;
  long long i;
  for (i = 0;i < SHAREDSECRET_BYTES;++i) s[i] = 0;
  mpz_export(s,0,-1,1,0,0,result.get_mpz_t());
  return 0;
}
