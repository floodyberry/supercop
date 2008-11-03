#include "crypto_smult_curve25519.h"
#include "crypto_box.h"
#include "randombytes.h"

int crypto_box_keypair(
  unsigned char *pk,
  unsigned char *sk
)
{
  randombytes(sk,32);
  return crypto_smult_curve25519_base(pk,sk);
}
