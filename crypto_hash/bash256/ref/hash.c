#include "crypto_hash.h"
#include "bash.h"

int crypto_hash(
  unsigned char *out,
  const unsigned char *in,
  unsigned long long inlen
)
{
  return bash256Hash(out, in, inlen);
}

