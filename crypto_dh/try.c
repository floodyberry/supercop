/*
 * crypto_dh/try.c version 20110504
 * D. J. Bernstein
 * Public domain.
 */

#include <stdlib.h>
#include "crypto_dh.h"

extern unsigned char *alignedcalloc(unsigned long long);

const char *primitiveimplementation = crypto_dh_IMPLEMENTATION;

static unsigned char *pk1;
static unsigned char *sk1;
static unsigned char *pk2;
static unsigned char *sk2;
static unsigned char *s1;
static unsigned char *s2;

void preallocate(void)
{
#ifdef RAND_R_PRNG_NOT_SEEDED
  RAND_status();
#endif
}

void allocate(void)
{
  pk1 = alignedcalloc(crypto_dh_PUBLICKEYBYTES);
  pk2 = alignedcalloc(crypto_dh_PUBLICKEYBYTES);
  sk1 = alignedcalloc(crypto_dh_SECRETKEYBYTES);
  sk2 = alignedcalloc(crypto_dh_SECRETKEYBYTES);
  s1 = alignedcalloc(crypto_dh_BYTES);
  s2 = alignedcalloc(crypto_dh_BYTES);
}

void predoit(void)
{
}

void doit(void)
{
  crypto_dh_keypair(pk1,sk1);
  crypto_dh_keypair(pk2,sk2);
  crypto_dh(s1,pk2,sk1);
  crypto_dh(s2,pk1,sk2);
}

char checksum[crypto_dh_BYTES * 2 + 1];

const char *checksum_compute(void)
{
  long long loop;
  long long i;

  for (loop = 0;loop < 10;++loop) {
    if (crypto_dh_keypair(pk1,sk1) != 0) return "crypto_dh_keypair returns nonzero";
    if (crypto_dh_keypair(pk2,sk2) != 0) return "crypto_dh_keypair returns nonzero";
    if (crypto_dh(s1,pk2,sk1) != 0) return "crypto_dh returns nonzero";
    if (crypto_dh(s2,pk1,sk2) != 0) return "crypto_dh returns nonzero";
    for (i = 0;i < crypto_dh_BYTES;++i)
      if (s1[i] != s2[i])
        return "crypto_dh does not match";
  }

  /* XXX: do some long-term checksum */
  checksum[0] = 0;
  return 0;
}
