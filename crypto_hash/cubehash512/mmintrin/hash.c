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

  x00 = _mm_set_pi32(0x18f45926,0x781f814f);
  x02 = _mm_set_pi32(0xc8237df7,0x992b7520);
  x04 = _mm_set_pi32(0x7b0075ff,0xe4e3ba88);
  x06 = _mm_set_pi32(0x947c6147,0x51916982);
  x08 = _mm_set_pi32(0x4d197eb5,0x9dc06f0a);
  x0a = _mm_set_pi32(0x912e1aca,0xb6e17224);
  x0c = _mm_set_pi32(0xd9efd0ec,0x5270f5e1);
  x0e = _mm_set_pi32(0x20d4074f,0xf0fcf7c8);
  x10 = _mm_set_pi32(0xf4839313,0x15547fee);
  x12 = _mm_set_pi32(0xaf1c332a,0x017c189c);
  x14 = _mm_set_pi32(0x84997eec,0xde4d7c8c);
  x16 = _mm_set_pi32(0xb6d3d055,0x5bd87a43);
  x18 = _mm_set_pi32(0x2b8cb0a6,0x3ae247b0);
  x1a = _mm_set_pi32(0x4bf12b94,0xd9d6ca35);
  x1c = _mm_set_pi32(0x62fb84ad,0x97f33a51);
  x1e = _mm_set_pi32(0x520c709b,0x7e70e613);

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
    r = 32;
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
