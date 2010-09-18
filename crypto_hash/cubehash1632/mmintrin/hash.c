#define CUBEHASH_ROUNDS 16
#include <mmintrin.h>
#include <xmmintrin.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  __m64 x00;
  __m64 x02;
  __m64 x04;
  __m64 x06;
  __m64 x08;
  __m64 x0a;
  __m64 x0c;
  __m64 x0e;
  __m64 x10;
  __m64 x12;
  __m64 x14;
  __m64 x16;
  __m64 x18;
  __m64 x1a;
  __m64 x1c;
  __m64 x1e;
  __m64 y0;
  __m64 y2;
  __m64 y4;
  __m64 y6;
  __m64 y8;
  __m64 ya;
  __m64 yc;
  __m64 ye;
  unsigned char tmp[32];
  int i;
  int r;
  int finalization = 0;

  x00 = _mm_set_pi32(0x50f494d4,0x2aea2a61);
  x02 = _mm_set_pi32(0x4167d83e,0x2d538b8b);
  x04 = _mm_set_pi32(0xc701cf8c,0x3fee2313);
  x06 = _mm_set_pi32(0x50ac5695,0xcc39968e);
  x08 = _mm_set_pi32(0xa647a8b3,0x4d42c787);
  x0a = _mm_set_pi32(0x825b4537,0x97cf0bef);
  x0c = _mm_set_pi32(0xf22090c4,0xeef864d2);
  x0e = _mm_set_pi32(0xa23911ae,0xd0e5cd33);
  x10 = _mm_set_pi32(0x148fe485,0xfcd398d9);
  x12 = _mm_set_pi32(0xb6444532,0x1b017bef);
  x14 = _mm_set_pi32(0x2ff5781c,0x6a536159);
  x16 = _mm_set_pi32(0x0dbadea9,0x91fa7934);
  x18 = _mm_set_pi32(0xa5a70e75,0xd65c8a2b);
  x1a = _mm_set_pi32(0xbc796576,0xb1c62456);
  x1c = _mm_set_pi32(0xe7989af1,0x1921c8f7);
  x1e = _mm_set_pi32(0xd43e3b44,0x7795d246);

  if (inlen < 32) goto inlenbelow32;

  mainloop:

    x00 = _mm_xor_si64(x00,*(__m64 *) (in + 0));
    x02 = _mm_xor_si64(x02,*(__m64 *) (in + 8));
    x04 = _mm_xor_si64(x04,*(__m64 *) (in + 16));
    x06 = _mm_xor_si64(x06,*(__m64 *) (in + 24));
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;--r) {
      x10 = _mm_add_pi32(x00,x10);
      x12 = _mm_add_pi32(x02,x12);
      x14 = _mm_add_pi32(x04,x14);
      x16 = _mm_add_pi32(x06,x16);
      x18 = _mm_add_pi32(x08,x18);
      x1a = _mm_add_pi32(x0a,x1a);
      x1c = _mm_add_pi32(x0c,x1c);
      x1e = _mm_add_pi32(x0e,x1e);

      y8 = x00;
      ya = x02;
      yc = x04;
      ye = x06;
      y0 = x08;
      y2 = x0a;
      y4 = x0c;
      y6 = x0e;
      x00 = _mm_xor_si64(_mm_slli_pi32(y0,7),_mm_srli_pi32(y0,25));
      x02 = _mm_xor_si64(_mm_slli_pi32(y2,7),_mm_srli_pi32(y2,25));
      x04 = _mm_xor_si64(_mm_slli_pi32(y4,7),_mm_srli_pi32(y4,25));
      x06 = _mm_xor_si64(_mm_slli_pi32(y6,7),_mm_srli_pi32(y6,25));
      x08 = _mm_xor_si64(_mm_slli_pi32(y8,7),_mm_srli_pi32(y8,25));
      x0a = _mm_xor_si64(_mm_slli_pi32(ya,7),_mm_srli_pi32(ya,25));
      x0c = _mm_xor_si64(_mm_slli_pi32(yc,7),_mm_srli_pi32(yc,25));
      x0e = _mm_xor_si64(_mm_slli_pi32(ye,7),_mm_srli_pi32(ye,25));

      x00 = _mm_xor_si64(x00,x10);
      x02 = _mm_xor_si64(x02,x12);
      x04 = _mm_xor_si64(x04,x14);
      x06 = _mm_xor_si64(x06,x16);
      x08 = _mm_xor_si64(x08,x18);
      x0a = _mm_xor_si64(x0a,x1a);
      x0c = _mm_xor_si64(x0c,x1c);
      x0e = _mm_xor_si64(x0e,x1e);

      y2 = x10; y0 = x12;
      y6 = x14; y4 = x16;
      ya = x18; y8 = x1a;
      ye = x1c; yc = x1e;
      x10 = y0; x12 = y2;
      x14 = y4; x16 = y6;
      x18 = y8; x1a = ya;
      x1c = yc; x1e = ye;

      x10 = _mm_add_pi32(x00,x10);
      x12 = _mm_add_pi32(x02,x12);
      x14 = _mm_add_pi32(x04,x14);
      x16 = _mm_add_pi32(x06,x16);
      x18 = _mm_add_pi32(x08,x18);
      x1a = _mm_add_pi32(x0a,x1a);
      x1c = _mm_add_pi32(x0c,x1c);
      x1e = _mm_add_pi32(x0e,x1e);

      y4 = x00;
      y6 = x02;
      y0 = x04;
      y2 = x06;
      yc = x08;
      ye = x0a;
      y8 = x0c;
      ya = x0e;
      x00 = _mm_xor_si64(_mm_slli_pi32(y0,11),_mm_srli_pi32(y0,21));
      x02 = _mm_xor_si64(_mm_slli_pi32(y2,11),_mm_srli_pi32(y2,21));
      x04 = _mm_xor_si64(_mm_slli_pi32(y4,11),_mm_srli_pi32(y4,21));
      x06 = _mm_xor_si64(_mm_slli_pi32(y6,11),_mm_srli_pi32(y6,21));
      x08 = _mm_xor_si64(_mm_slli_pi32(y8,11),_mm_srli_pi32(y8,21));
      x0a = _mm_xor_si64(_mm_slli_pi32(ya,11),_mm_srli_pi32(ya,21));
      x0c = _mm_xor_si64(_mm_slli_pi32(yc,11),_mm_srli_pi32(yc,21));
      x0e = _mm_xor_si64(_mm_slli_pi32(ye,11),_mm_srli_pi32(ye,21));

      x00 = _mm_xor_si64(x00,x10);
      x02 = _mm_xor_si64(x02,x12);
      x04 = _mm_xor_si64(x04,x14);
      x06 = _mm_xor_si64(x06,x16);
      x08 = _mm_xor_si64(x08,x18);
      x0a = _mm_xor_si64(x0a,x1a);
      x0c = _mm_xor_si64(x0c,x1c);
      x0e = _mm_xor_si64(x0e,x1e);

      x10 = _mm_shuffle_pi16(x10,0x4e);
      x12 = _mm_shuffle_pi16(x12,0x4e);
      x14 = _mm_shuffle_pi16(x14,0x4e);
      x16 = _mm_shuffle_pi16(x16,0x4e);
      x18 = _mm_shuffle_pi16(x18,0x4e);
      x1a = _mm_shuffle_pi16(x1a,0x4e);
      x1c = _mm_shuffle_pi16(x1c,0x4e);
      x1e = _mm_shuffle_pi16(x1e,0x4e);
    }

  if (inlen >= 32) goto mainloop;

  inlenbelow32:

  if (finalization == 0) {
    for (i = 0;i < inlen;++i) tmp[i] = in[i];
    tmp[i] = 128;
    for (++i;i < 32;++i) tmp[i] = 0;
    in = tmp;
    inlen = 32;
    finalization = 1;
    goto mainloop;
  }

  if (finalization == 1) {
    x1e = _mm_xor_si64(x1e,_mm_set_pi32(1,0));
    r = 10 * CUBEHASH_ROUNDS;
    finalization = 2;
    goto morerounds;
  }

  *(__m64 *) (out + 0) = x00;
  *(__m64 *) (out + 8) = x02;
  *(__m64 *) (out + 16) = x04;
  *(__m64 *) (out + 24) = x06;
  *(__m64 *) (out + 32) = x08;
  *(__m64 *) (out + 40) = x0a;
  *(__m64 *) (out + 48) = x0c;
  *(__m64 *) (out + 56) = x0e;

  _mm_empty();

  return 0;
}
