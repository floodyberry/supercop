/*
 * crypto_hashblocks/try.c version 20080724
 * D. J. Bernstein
 * Public domain.
 */

#include <stdlib.h>
#include "crypto_hashblocks.h"

extern unsigned char *alignedcalloc(unsigned long long);

const char *primitiveimplementation = crypto_hashblocks_IMPLEMENTATION;

#define MAXTEST_BYTES 10000
#define CHECKSUM_BYTES 4096
#define TUNE_BYTES 1536

static unsigned char *h;
static unsigned char *m;

void allocate(void)
{
  h = alignedcalloc(crypto_hashblocks_STATEBYTES);
  m = alignedcalloc(MAXTEST_BYTES);
}

void predoit(void)
{
}

void doit(void)
{
  crypto_hashblocks(h,m,TUNE_BYTES);
}

char checksum[crypto_hashblocks_STATEBYTES * 2 + 1];

const char *checksum_compute(void)
{
  long long i;
  long long j;

  for (i = 0;i < CHECKSUM_BYTES;++i) {
    if (crypto_hashblocks(h,m,i) != 0) return "returns nonzero";
    for (j = 0;j < i;++j)
      m[j] ^= h[j % crypto_hashblocks_STATEBYTES];
    m[i] = h[0];
  }
  if (crypto_hashblocks(h,m,CHECKSUM_BYTES) != 0) return "returns nonzero";

  for (i = 0;i < crypto_hashblocks_STATEBYTES;++i) {
    checksum[2 * i] = "0123456789abcdef"[15 & (h[i] >> 4)];
    checksum[2 * i + 1] = "0123456789abcdef"[15 & h[i]];
  }
  checksum[2 * i] = 0;
  return 0;
}
