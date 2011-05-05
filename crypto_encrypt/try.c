/*
 * crypto_encrypt/try.c version 20110504
 * D. J. Bernstein
 * Public domain.
 */

#include <stdlib.h>
#include "randombytes.h"
#include "crypto_encrypt.h"

#define MAXTEST_BYTES 10000
#define TUNE_BYTES 1536

extern unsigned char *alignedcalloc(unsigned long long);

const char *primitiveimplementation = crypto_encrypt_IMPLEMENTATION;

static unsigned char *pk;
static unsigned char *sk;
static unsigned char *m; unsigned long long mlen;
static unsigned char *c; unsigned long long clen;
static unsigned char *t; unsigned long long tlen;

void preallocate(void)
{
#ifdef RAND_R_PRNG_NOT_SEEDED
  RAND_status();
#endif
}

void allocate(void)
{
  pk = alignedcalloc(crypto_encrypt_PUBLICKEYBYTES);
  sk = alignedcalloc(crypto_encrypt_SECRETKEYBYTES);
  m = alignedcalloc(MAXTEST_BYTES + crypto_encrypt_BYTES);
  c = alignedcalloc(MAXTEST_BYTES + crypto_encrypt_BYTES);
  t = alignedcalloc(MAXTEST_BYTES + crypto_encrypt_BYTES);
}

void predoit(void)
{
  crypto_encrypt_keypair(pk,sk);
  mlen = TUNE_BYTES;
  clen = 0;
}

void doit(void)
{
  randombytes(m,mlen);
  crypto_encrypt(c,&clen,m,mlen,pk);
  crypto_encrypt_open(t,&tlen,c,clen,sk);
}

char checksum[crypto_encrypt_BYTES * 2 + 1];

const char *checksum_compute(void)
{
  long long mlen;
  long long i;

  if (crypto_encrypt_keypair(pk,sk) != 0) return "crypto_encrypt_keypair returns nonzero";
  for (mlen = 0;mlen < MAXTEST_BYTES;mlen += 1 + (mlen / 16)) {
    if (crypto_encrypt(c,&clen,m,mlen,pk) != 0) return "crypto_encrypt returns nonzero";
    if (crypto_encrypt_open(t,&tlen,c,clen,sk) != 0) return "crypto_encrypt_open returns nonzero";
    if (tlen != mlen) return "crypto_encrypt_open does not match length";
    for (i = 0;i < tlen;++i)
      if (t[i] != m[i])
        return "crypto_encrypt_open does not match contents";
  }

  /* do some long-term checksum */
  checksum[0] = 0;
  return 0;
}
