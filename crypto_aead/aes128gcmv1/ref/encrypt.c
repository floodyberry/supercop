#include "crypto_aead.h"
#include "crypto_verify_16.h"
#include "crypto_core_aes128encrypt.h"
#define AES(out,in,k) crypto_core_aes128encrypt(out,in,k,0)

static void store32(unsigned char *x,unsigned long long u)
{
  int i;
  for (i = 3;i >= 0;--i) { x[i] = u; u >>= 8; }
}

static void store64(unsigned char *x,unsigned long long u)
{
  int i;
  for (i = 7;i >= 0;--i) { x[i] = u; u >>= 8; }
}

/*
a = (a + x) * y in the finite field
16 bytes in a
xlen bytes in x; xlen <= 16; x is implicitly 0-padded
16 bytes in y
*/
static void addmul(unsigned char *a,
  const unsigned char *x,unsigned long long xlen,
  const unsigned char *y)
{
  int i;
  int j;
  unsigned char abits[128];
  unsigned char ybits[128];
  unsigned char prodbits[256];
  for (i = 0;i < xlen;++i) a[i] ^= x[i];
  for (i = 0;i < 128;++i) abits[i] = (a[i / 8] >> (7 - (i % 8))) & 1;
  for (i = 0;i < 128;++i) ybits[i] = (y[i / 8] >> (7 - (i % 8))) & 1;
  for (i = 0;i < 256;++i) prodbits[i] = 0;
  for (i = 0;i < 128;++i)
    for (j = 0;j < 128;++j)
      prodbits[i + j] ^= abits[i] & ybits[j];
  for (i = 127;i >= 0;--i) {
    prodbits[i] ^= prodbits[i + 128];
    prodbits[i + 1] ^= prodbits[i + 128];
    prodbits[i + 2] ^= prodbits[i + 128];
    prodbits[i + 7] ^= prodbits[i + 128];
    prodbits[i + 128] ^= prodbits[i + 128];
  }
  for (i = 0;i < 16;++i) a[i] = 0;
  for (i = 0;i < 128;++i) a[i / 8] |= (prodbits[i] << (7 - (i % 8)));
}

static unsigned char zero[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  unsigned char kcopy[16];
  unsigned char H[16];
  unsigned char J[16];
  unsigned char T[16];
  unsigned char accum[16];
  unsigned char stream[16];
  unsigned char finalblock[16];
  unsigned long long i;
  unsigned long long index;

  for (i = 0;i < 16;++i) kcopy[i] = k[i];

  *clen = mlen + 16;
  store64(finalblock,8 * adlen);
  store64(finalblock + 8,8 * mlen);

  AES(H,zero,kcopy);

  for (i = 0;i < 12;++i) J[i] = npub[i];
  index = 1;
  store32(J + 12,index);
  AES(T,J,kcopy);

  for (i = 0;i < 16;++i) accum[i] = 0;

  while (adlen > 0) {
    unsigned long long blocklen = 16;
    if (adlen < blocklen) blocklen = adlen;
    addmul(accum,ad,blocklen,H);
    ad += blocklen;
    adlen -= blocklen;
  }

  while (mlen > 0) {
    unsigned long long blocklen = 16;
    if (mlen < blocklen) blocklen = mlen;
    ++index;
    store32(J + 12,index);
    AES(stream,J,kcopy);
    for (i = 0;i < blocklen;++i) c[i] = m[i] ^ stream[i];
    addmul(accum,c,blocklen,H);
    c += blocklen;
    m += blocklen;
    mlen -= blocklen;
  }

  addmul(accum,finalblock,16,H);
  for (i = 0;i < 16;++i) c[i] = T[i] ^ accum[i];
  return 0;
}

int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *outputmlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
)
{
  unsigned char kcopy[16];
  unsigned char H[16];
  unsigned char J[16];
  unsigned char T[16];
  unsigned char accum[16];
  unsigned char stream[16];
  unsigned char finalblock[16];
  unsigned long long mlen;
  unsigned long long origmlen;
  unsigned long long index;
  unsigned long long i;
  const unsigned char *origc;

  for (i = 0;i < 16;++i) kcopy[i] = k[i];

  if (clen < 16) return -1;
  mlen = clen - 16;

  store64(finalblock,8 * adlen);
  store64(finalblock + 8,8 * mlen);

  AES(H,zero,kcopy);

  for (i = 0;i < 12;++i) J[i] = npub[i];
  index = 1;
  store32(J + 12,index);
  AES(T,J,kcopy);

  for (i = 0;i < 16;++i) accum[i] = 0;

  while (adlen > 0) {
    unsigned long long blocklen = 16;
    if (adlen < blocklen) blocklen = adlen;
    addmul(accum,ad,blocklen,H);
    ad += blocklen;
    adlen -= blocklen;
  }

  origc = c;
  origmlen = mlen;
  while (mlen > 0) {
    unsigned long long blocklen = 16;
    if (mlen < blocklen) blocklen = mlen;
    addmul(accum,c,blocklen,H);
    c += blocklen;
    mlen -= blocklen;
  }

  addmul(accum,finalblock,16,H);
  for (i = 0;i < 16;++i) accum[i] ^= T[i];
  if (crypto_verify_16(accum,c) != 0) return -1;

  c = origc;
  mlen = origmlen;
  *outputmlen = mlen;

  while (mlen > 0) {
    unsigned long long blocklen = 16;
    if (mlen < blocklen) blocklen = mlen;
    ++index;
    store32(J + 12,index);
    AES(stream,J,kcopy);
    for (i = 0;i < blocklen;++i) m[i] = c[i] ^ stream[i];
    c += blocklen;
    m += blocklen;
    mlen -= blocklen;
  }

  return 0;
}
