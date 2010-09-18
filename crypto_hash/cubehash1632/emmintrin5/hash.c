#define CUBEHASH_ROUNDS 16
#include <emmintrin.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  __m128i x0;
  __m128i x1;
  __m128i x2;
  __m128i x3;
  __m128i x4;
  __m128i x5;
  __m128i x6;
  __m128i x7;
  __m128i y0;
  __m128i y1;
  __m128i y2;
  __m128i y3;
  int i;
  int r;
  int finalization = 0;

  x0 = _mm_set_epi32(0x4167d83e,0x2d538b8b,0x50f494d4,0x2aea2a61);
  x1 = _mm_set_epi32(0x50ac5695,0xcc39968e,0xc701cf8c,0x3fee2313);
  x2 = _mm_set_epi32(0x825b4537,0x97cf0bef,0xa647a8b3,0x4d42c787);
  x3 = _mm_set_epi32(0xa23911ae,0xd0e5cd33,0xf22090c4,0xeef864d2);
  x4 = _mm_set_epi32(0xb6444532,0x1b017bef,0x148fe485,0xfcd398d9);
  x5 = _mm_set_epi32(0x0dbadea9,0x91fa7934,0x2ff5781c,0x6a536159);
  x6 = _mm_set_epi32(0xbc796576,0xb1c62456,0xa5a70e75,0xd65c8a2b);
  x7 = _mm_set_epi32(0xd43e3b44,0x7795d246,0xe7989af1,0x1921c8f7);

  if (inlen < 32) goto inlenbelow32;

  mainloop:

    x0 = _mm_xor_si128(x0,_mm_loadu_si128((__m128i *) in));
    x1 = _mm_xor_si128(x1,_mm_loadu_si128((__m128i *) (in + 16)));
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;--r) {
      x4 = _mm_add_epi32(x0,x4);
      x5 = _mm_add_epi32(x1,x5);
      x6 = _mm_add_epi32(x2,x6);
      x7 = _mm_add_epi32(x3,x7);
      y0 = x2;
      y1 = x3;
      y2 = x0;
      y3 = x1;
      x0 = _mm_xor_si128(_mm_slli_epi32(y0,7),_mm_srli_epi32(y0,25));
      x1 = _mm_xor_si128(_mm_slli_epi32(y1,7),_mm_srli_epi32(y1,25));
      x2 = _mm_xor_si128(_mm_slli_epi32(y2,7),_mm_srli_epi32(y2,25));
      x3 = _mm_xor_si128(_mm_slli_epi32(y3,7),_mm_srli_epi32(y3,25));
      x0 = _mm_xor_si128(x0,x4);
      x1 = _mm_xor_si128(x1,x5);
      x2 = _mm_xor_si128(x2,x6);
      x3 = _mm_xor_si128(x3,x7);
      x4 = _mm_shuffle_epi32(x4,0x4e);
      x5 = _mm_shuffle_epi32(x5,0x4e);
      x6 = _mm_shuffle_epi32(x6,0x4e);
      x7 = _mm_shuffle_epi32(x7,0x4e);
      x4 = _mm_add_epi32(x0,x4);
      x5 = _mm_add_epi32(x1,x5);
      x6 = _mm_add_epi32(x2,x6);
      x7 = _mm_add_epi32(x3,x7);
      y0 = x1;
      y1 = x0;
      y2 = x3;
      y3 = x2;
      x0 = _mm_xor_si128(_mm_slli_epi32(y0,11),_mm_srli_epi32(y0,21));
      x1 = _mm_xor_si128(_mm_slli_epi32(y1,11),_mm_srli_epi32(y1,21));
      x2 = _mm_xor_si128(_mm_slli_epi32(y2,11),_mm_srli_epi32(y2,21));
      x3 = _mm_xor_si128(_mm_slli_epi32(y3,11),_mm_srli_epi32(y3,21));
      x0 = _mm_xor_si128(x0,x4);
      x1 = _mm_xor_si128(x1,x5);
      x2 = _mm_xor_si128(x2,x6);
      x3 = _mm_xor_si128(x3,x7);
      x4 = _mm_shuffle_epi32(x4,0xb1);
      x5 = _mm_shuffle_epi32(x5,0xb1);
      x6 = _mm_shuffle_epi32(x6,0xb1);
      x7 = _mm_shuffle_epi32(x7,0xb1);
    }

  if (inlen >= 32) goto mainloop;

  inlenbelow32:

  if (finalization == 0) {
    if (inlen >= 16) {
      x0 = _mm_xor_si128(x0,_mm_loadu_si128((__m128i *) in));
      y1 ^= y1;
      for (i = 0;i < inlen - 16;++i) ((unsigned char *) &y1)[i] = in[16 + i];
      ((unsigned char *) &y1)[i] = 128;
      x1 = _mm_xor_si128(x1,y1);
    } else {
      y0 ^= y0;
      for (i = 0;i < inlen;++i) ((unsigned char *) &y0)[i] = in[i];
      ((unsigned char *) &y0)[i] = 128;
      x0 = _mm_xor_si128(x0,y0);
    }
    r = CUBEHASH_ROUNDS;
    finalization = 1;
    goto morerounds;
  }

  if (finalization == 1) {
    x7 = _mm_xor_si128(x7,_mm_set_epi32(1,0,0,0));
    r = 10 * CUBEHASH_ROUNDS;
    finalization = 2;
    goto morerounds;
  }

  _mm_storeu_si128((__m128i *) out,x0);
  _mm_storeu_si128((__m128i *) (out + 16),x1);
  _mm_storeu_si128((__m128i *) (out + 32),x2);
  _mm_storeu_si128((__m128i *) (out + 48),x3);

  return 0;
}
