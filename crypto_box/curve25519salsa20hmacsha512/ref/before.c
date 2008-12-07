#include "crypto_hash_sha512.h"
#include "crypto_scalarmult_curve25519.h"
#include "crypto_box.h"

int crypto_box_beforenm(
  unsigned char *k,
  const unsigned char *pk,
  const unsigned char *sk
)
{
  unsigned char s[32];
  unsigned char h[64];
  int i;
  crypto_scalarmult_curve25519(s,sk,pk);
  crypto_hash_sha512(h,s,32);
  for (i = 0;i < 32;++i) k[i] = h[i];
  return 0;
}
