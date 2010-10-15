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

  x0 = _mm_set_epi32(0xc8237df7,0x992b7520,0x18f45926,0x781f814f);
  x1 = _mm_set_epi32(0x947c6147,0x51916982,0x7b0075ff,0xe4e3ba88);
  x2 = _mm_set_epi32(0x912e1aca,0xb6e17224,0x4d197eb5,0x9dc06f0a);
  x3 = _mm_set_epi32(0x20d4074f,0xf0fcf7c8,0xd9efd0ec,0x5270f5e1);
  x4 = _mm_set_epi32(0xaf1c332a,0x017c189c,0xf4839313,0x15547fee);
  x5 = _mm_set_epi32(0xb6d3d055,0x5bd87a43,0x84997eec,0xde4d7c8c);
  x6 = _mm_set_epi32(0x4bf12b94,0xd9d6ca35,0x2b8cb0a6,0x3ae247b0);
  x7 = _mm_set_epi32(0x520c709b,0x7e70e613,0x62fb84ad,0x97f33a51);

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
    r = 32;
    finalization = 2;
    goto morerounds;
  }

  _mm_storeu_si128((__m128i *) out,x0);
  _mm_storeu_si128((__m128i *) (out + 16),x1);
  _mm_storeu_si128((__m128i *) (out + 32),x2);
  _mm_storeu_si128((__m128i *) (out + 48),x3);

  return 0;
}
