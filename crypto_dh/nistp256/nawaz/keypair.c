#include "bpoint.h"
#include "crypto_dh.h"
#include "randombytes.h"

int crypto_dh_keypair(
  unsigned char *pk,
  unsigned char *sk
)
{
  int i;

  memset(sk,0,crypto_dh_SECRETKEYBYTES);
  memset(pk,0,crypto_dh_PUBLICKEYBYTES);

  /*compute secret key */
  randombytes(sk,crypto_dh_SECRETKEYBYTES);

  nistp256(pk, pk+32, BPx, BPy, sk);
  return 0;
}
