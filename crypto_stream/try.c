/*
 * crypto_stream/try.c version 20080724
 * D. J. Bernstein
 * Public domain.
 */

#include <stdlib.h>
#include "crypto_stream.h"

extern unsigned char *alignedcalloc(unsigned long long);

const char *primitiveimplementation = crypto_stream_IMPLEMENTATION;

#define MAXTEST_BYTES 10000
#define CHECKSUM_BYTES 4096
#define TUNE_BYTES 1536

static unsigned char *k;
static unsigned char *n;
static unsigned char *m;
static unsigned char *c;
static unsigned char *s;

void allocate(void)
{
  k = alignedcalloc(crypto_stream_KEYBYTES);
  n = alignedcalloc(crypto_stream_NONCEBYTES);
  m = alignedcalloc(MAXTEST_BYTES);
  c = alignedcalloc(MAXTEST_BYTES);
  s = alignedcalloc(MAXTEST_BYTES);
}

void predoit(void)
{
}

void doit(void)
{
  crypto_stream_xor(c,m,TUNE_BYTES,n,k);
}

char checksum[crypto_stream_KEYBYTES * 2 + 1];

const char *checksum_compute(void)
{
  long long i;
  long long j;

  for (i = 0;i < CHECKSUM_BYTES;++i) {
    crypto_stream_xor(c,m,i,n,k);
    crypto_stream(s,i,n,k);
    for (j = 0;j < i;++j)
      if ((s[j] ^ m[j]) != c[j]) return ("crypto_stream_xor does not match crypto_stream");
    for (j = 0;j < i;++j)
      k[j % crypto_stream_KEYBYTES] ^= c[j];
    crypto_stream_xor(m,c,i,n,k);
    crypto_stream(s,i,n,k);
    for (j = 0;j < i;++j)
      if ((s[j] ^ m[j]) != c[j]) return ("crypto_stream_xor does not match crypto_stream");
    for (j = 0;j < i;++j)
      n[j % crypto_stream_KEYBYTES] ^= m[j];
  }

  for (i = 0;i < crypto_stream_KEYBYTES;++i) {
    checksum[2 * i] = "0123456789abcdef"[15 & (k[i] >> 4)];
    checksum[2 * i + 1] = "0123456789abcdef"[15 & k[i]];
  }
  checksum[2 * i] = 0;

  return 0;
}
