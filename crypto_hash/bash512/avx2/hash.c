#include "crypto_hash.h"
#include "bash_avx2.h"

int crypto_hash(
  unsigned char *out,
  const unsigned char *in,
  unsigned long long inlen
)
{
  return bashavx2_512Hash(out, in, inlen);
}

