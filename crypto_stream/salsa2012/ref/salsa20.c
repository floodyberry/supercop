/*
salsa2012/ref/salsa2012.c version 20080712
D. J. Bernstein
Public domain.
*/

#include "crypto_stream.h"

typedef unsigned char uint8;
typedef unsigned int uint32;

static uint32 rotate(uint32 u,int c)
{
  return (u << c) | (u >> (32 - c));
}

static uint32 load_littleendian(const unsigned char *x)
{
  return
      (uint32) (x[0]) \
  | (((uint32) (x[1])) << 8) \
  | (((uint32) (x[2])) << 16) \
  | (((uint32) (x[3])) << 24)
  ;
}

static void store_littleendian(unsigned char *x,uint32 u)
{
  x[0] = u; u >>= 8;
  x[1] = u; u >>= 8;
  x[2] = u; u >>= 8;
  x[3] = u;
}

static const char sigma[16] = "expand 32-byte k";

int crypto_stream_xor(
        unsigned char *c,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *n,
  const unsigned char *k
)
{
  uint32 x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15;
  uint32 j0, j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15;
  uint8 *ctarget;
  uint8 tmp[64];
  int i;

  if (!mlen) return 0;

  j0 = load_littleendian(sigma + 0);
  j1 = load_littleendian(k + 0);
  j2 = load_littleendian(k + 4);
  j3 = load_littleendian(k + 8);
  j4 = load_littleendian(k + 12);
  j5 = load_littleendian(sigma + 4);
  j6 = load_littleendian(n + 0);
  j7 = load_littleendian(n + 4);
  j8 = 0;
  j9 = 0;
  j10 = load_littleendian(sigma + 8);
  j11 = load_littleendian(k + 16);
  j12 = load_littleendian(k + 20);
  j13 = load_littleendian(k + 24);
  j14 = load_littleendian(k + 28);
  j15 = load_littleendian(sigma + 12);

  for (;;) {
    if (mlen < 64) {
      for (i = 0;i < mlen;++i) tmp[i] = m[i];
      m = tmp;
      ctarget = c;
      c = tmp;
    }
    x0 = j0;
    x1 = j1;
    x2 = j2;
    x3 = j3;
    x4 = j4;
    x5 = j5;
    x6 = j6;
    x7 = j7;
    x8 = j8;
    x9 = j9;
    x10 = j10;
    x11 = j11;
    x12 = j12;
    x13 = j13;
    x14 = j14;
    x15 = j15;
    for (i = 12;i > 0;i -= 2) {
       x4 ^= rotate( x0+x12, 7);
       x8 ^= rotate( x4+ x0, 9);
      x12 ^= rotate( x8+ x4,13);
       x0 ^= rotate(x12+ x8,18);
       x9 ^= rotate( x5+ x1, 7);
      x13 ^= rotate( x9+ x5, 9);
       x1 ^= rotate(x13+ x9,13);
       x5 ^= rotate( x1+x13,18);
      x14 ^= rotate(x10+ x6, 7);
       x2 ^= rotate(x14+x10, 9);
       x6 ^= rotate( x2+x14,13);
      x10 ^= rotate( x6+ x2,18);
       x3 ^= rotate(x15+x11, 7);
       x7 ^= rotate( x3+x15, 9);
      x11 ^= rotate( x7+ x3,13);
      x15 ^= rotate(x11+ x7,18);
       x1 ^= rotate( x0+ x3, 7);
       x2 ^= rotate( x1+ x0, 9);
       x3 ^= rotate( x2+ x1,13);
       x0 ^= rotate( x3+ x2,18);
       x6 ^= rotate( x5+ x4, 7);
       x7 ^= rotate( x6+ x5, 9);
       x4 ^= rotate( x7+ x6,13);
       x5 ^= rotate( x4+ x7,18);
      x11 ^= rotate(x10+ x9, 7);
       x8 ^= rotate(x11+x10, 9);
       x9 ^= rotate( x8+x11,13);
      x10 ^= rotate( x9+ x8,18);
      x12 ^= rotate(x15+x14, 7);
      x13 ^= rotate(x12+x15, 9);
      x14 ^= rotate(x13+x12,13);
      x15 ^= rotate(x14+x13,18);
    }
    x0 += j0;
    x1 += j1;
    x2 += j2;
    x3 += j3;
    x4 += j4;
    x5 += j5;
    x6 += j6;
    x7 += j7;
    x8 += j8;
    x9 += j9;
    x10 += j10;
    x11 += j11;
    x12 += j12;
    x13 += j13;
    x14 += j14;
    x15 += j15;

    x0 ^= load_littleendian(m + 0);
    x1 ^= load_littleendian(m + 4);
    x2 ^= load_littleendian(m + 8);
    x3 ^= load_littleendian(m + 12);
    x4 ^= load_littleendian(m + 16);
    x5 ^= load_littleendian(m + 20);
    x6 ^= load_littleendian(m + 24);
    x7 ^= load_littleendian(m + 28);
    x8 ^= load_littleendian(m + 32);
    x9 ^= load_littleendian(m + 36);
    x10 ^= load_littleendian(m + 40);
    x11 ^= load_littleendian(m + 44);
    x12 ^= load_littleendian(m + 48);
    x13 ^= load_littleendian(m + 52);
    x14 ^= load_littleendian(m + 56);
    x15 ^= load_littleendian(m + 60);

    if (!++j8) ++j9;

    store_littleendian(c + 0,x0);
    store_littleendian(c + 4,x1);
    store_littleendian(c + 8,x2);
    store_littleendian(c + 12,x3);
    store_littleendian(c + 16,x4);
    store_littleendian(c + 20,x5);
    store_littleendian(c + 24,x6);
    store_littleendian(c + 28,x7);
    store_littleendian(c + 32,x8);
    store_littleendian(c + 36,x9);
    store_littleendian(c + 40,x10);
    store_littleendian(c + 44,x11);
    store_littleendian(c + 48,x12);
    store_littleendian(c + 52,x13);
    store_littleendian(c + 56,x14);
    store_littleendian(c + 60,x15);

    if (mlen <= 64) {
      if (mlen < 64) {
        for (i = 0;i < mlen;++i) ctarget[i] = c[i];
      }
      return 0;
    }
    mlen -= 64;
    c += 64;
    m += 64;
  }
}

int crypto_stream(
        unsigned char *c,unsigned long long clen,
  const unsigned char *n,
  const unsigned char *k
)
{
  unsigned long long i;
  for (i = 0;i < clen;++i) c[i] = 0;
  return crypto_stream_xor(c,c,clen,n,k);
}
