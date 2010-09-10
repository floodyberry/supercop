#define CUBEHASH_ROUNDS 16
#include "crypto_hash.h"

/*
Bitsliced approach suggested (for hardware) by Bruce J. Strackbein.
Layout for 0<=j<16, 0<=i<32:
Bit j of a[i] is bit i of x[j].
Bit j of b[i] is bit i of x[16+j].
*/

static void rounds(unsigned short *a,unsigned short *b,unsigned int r)
{
  unsigned short carry;
  unsigned short axorb;
  unsigned short aandb;
  unsigned short ai;
  unsigned short bi;
  unsigned short z;
  int i;

  while (r > 0) {
    /* add x[0....] into x[1....]: */
    carry = 0;
    for (i = 0;i < 32;++i) {
      ai = a[i];
      bi = b[i];
      aandb = ai & bi;
      axorb = ai ^ bi;
      b[i] = axorb ^ carry;
      carry &= axorb;
      carry |= aandb;
    }

    /* rotate x[0....] upwards by 7 bits, and swap 00... with 01...: */
    i = 0;
    ai = a[i];
    do {
      z = (ai >> 8) | (ai << 8);
      i = (i + 7) & 31;
      ai = a[i];
      a[i] = z;
    } while (i != 0);

    /* xor x[1....] into x[0....], and swap 1..0. with 1..1.: */
    for (i = 0;i < 32;++i) {
      bi = b[i];
      a[i] ^= bi;
      b[i] = ((bi >> 2) & 0x3333) | ((bi & 0x3333) << 2);
    }

    /* add x[0....] into x[1....]: */
    carry = 0;
    for (i = 0;i < 32;++i) {
      ai = a[i];
      bi = b[i];
      aandb = ai & bi;
      axorb = ai ^ bi;
      b[i] = axorb ^ carry;
      carry &= axorb;
      carry |= aandb;
    }

    /* rotate x[0....] upwards by 11 bits, and swap 0.0.. with 0.1..: */
    i = 0;
    ai = a[i];
    do {
      z = ((ai >> 4) & 0x0f0f) | ((ai & 0x0f0f) << 4);
      i = (i + 11) & 31;
      ai = a[i];
      a[i] = z;
    } while (i != 0);

    /* xor x[1....] into x[0....], and swap 1...0 with 1...1: */
    for (i = 0;i < 32;++i) {
      bi = b[i];
      a[i] ^= bi;
      b[i] = ((bi >> 1) & 0x5555) | ((bi & 0x5555) << 1);
    }

    --r;
  }
}

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  unsigned short a[32];
  unsigned short b[32];
  unsigned char lastblock[32];
  int i;
  int j;
  int k;

  for (i = 0;i < 32;++i) a[i] = b[i] = 0;
  a[6] = 1; // x[0] = 64
  a[5] = 2; // x[1] = 32
  a[4] = 4; // x[2] = 16

  rounds(a,b,10 * CUBEHASH_ROUNDS);

  for (;;) {
    if (inlen < 32) {
      for (i = 0;i < inlen;++i) lastblock[i] = in[i];
      lastblock[inlen] = 128;
      for (i = inlen + 1;i < 32;++i) lastblock[i] = 0;
      in = lastblock;
    }
    for (k = 0;k < 4;++k) {
      for (j = 0;j < 8;++j) {
        unsigned short u = 0;
	for (i = 0;i < 8;++i)
	  u |= ((in[i * 4 + k] >> j) & 1) << i;
        a[(k << 3) + j] ^= u;
      }
    }
    rounds(a,b,CUBEHASH_ROUNDS);
    if (inlen < 32) break;
    in += 32;
    inlen -= 32;
  }

  b[0] ^= 0x8000;
  rounds(a,b,10 * CUBEHASH_ROUNDS);

  for (i = 0;i < 64;++i) out[i] = 0;

  for (k = 0;k < 4;++k) {
    for (j = 0;j < 8;++j) {
      unsigned short u = a[(k << 3) + j];
      for (i = 0;i < 16;++i)
        out[i * 4 + k] |= ((u >> i) & 1) << j;
    }
  }

  return 0;
}
