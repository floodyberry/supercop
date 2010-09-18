#define CUBEHASH_ROUNDS 16
#include <arm_neon.h>
#include "crypto_hash.h"

const uint32_t constants[36] = {
  0x2aea2a61, 0x50f494d4, 0x2d538b8b, 0x4167d83e,
  0x3fee2313, 0xc701cf8c, 0xcc39968e, 0x50ac5695,
  0x4d42c787, 0xa647a8b3, 0x97cf0bef, 0x825b4537,
  0xeef864d2, 0xf22090c4, 0xd0e5cd33, 0xa23911ae,
  0xfcd398d9, 0x148fe485, 0x1b017bef, 0xb6444532,
  0x6a536159, 0x2ff5781c, 0x91fa7934, 0x0dbadea9,
  0xd65c8a2b, 0xa5a70e75, 0xb1c62456, 0xbc796576,
  0x1921c8f7, 0xe7989af1, 0x7795d246, 0xd43e3b44,
  0,0,0,1
} ;

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  uint32x4_t x0;
  uint32x4_t x1;
  uint32x4_t x2;
  uint32x4_t x3;
  uint32x4_t x4;
  uint32x4_t x5;
  uint32x4_t x6;
  uint32x4_t x7;
  uint32x4_t y0;
  uint32x4_t y1;
  int i;
  int r;
  int finalization = 0;

  x0 = vld1q_u32(constants);
  x1 = vld1q_u32(constants + 4);
  x2 = vld1q_u32(constants + 8);
  x3 = vld1q_u32(constants + 12);
  x4 = vld1q_u32(constants + 16);
  x5 = vld1q_u32(constants + 20);
  x6 = vld1q_u32(constants + 24);
  x7 = vld1q_u32(constants + 28);

  if (inlen < 32) goto inlenbelow32;

  mainloop:

    x0 = veorq_u32(x0,vld1q_u32((uint32_t *) in));
    x1 = veorq_u32(x1,vld1q_u32((uint32_t *) (in + 16)));
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;r -= 2) {
      x4 = vaddq_u32(x0,x4);
      x5 = vaddq_u32(x1,x5);
      x6 = vaddq_u32(x2,x6);
      x7 = vaddq_u32(x3,x7);
      x2 = vsriq_n_u32(vshlq_n_u32(x2,7),x2,25);
      x3 = vsriq_n_u32(vshlq_n_u32(x3,7),x3,25);
      x0 = vsriq_n_u32(vshlq_n_u32(x0,7),x0,25);
      x1 = vsriq_n_u32(vshlq_n_u32(x1,7),x1,25);
      x2 = veorq_u32(x2,x4);
      x3 = veorq_u32(x3,x5);
      x0 = veorq_u32(x0,x6);
      x1 = veorq_u32(x1,x7);
      x4 = vcombine_u32(vget_high_u32(x4),vget_low_u32(x4));
      x5 = vcombine_u32(vget_high_u32(x5),vget_low_u32(x5));
      x6 = vcombine_u32(vget_high_u32(x6),vget_low_u32(x6));
      x7 = vcombine_u32(vget_high_u32(x7),vget_low_u32(x7));
      x4 = vaddq_u32(x2,x4);
      x5 = vaddq_u32(x3,x5);
      x6 = vaddq_u32(x0,x6);
      x7 = vaddq_u32(x1,x7);
      x3 = vsriq_n_u32(vshlq_n_u32(x3,11),x3,21);
      x2 = vsriq_n_u32(vshlq_n_u32(x2,11),x2,21);
      x1 = vsriq_n_u32(vshlq_n_u32(x1,11),x1,21);
      x0 = vsriq_n_u32(vshlq_n_u32(x0,11),x0,21);
      x3 = veorq_u32(x3,x4);
      x2 = veorq_u32(x2,x5);
      x1 = veorq_u32(x1,x6);
      x0 = veorq_u32(x0,x7);
      x4 = vrev64q_u32(x4);
      x5 = vrev64q_u32(x5);
      x6 = vrev64q_u32(x6);
      x7 = vrev64q_u32(x7);

      x4 = vaddq_u32(x3,x4);
      x5 = vaddq_u32(x2,x5);
      x6 = vaddq_u32(x1,x6);
      x7 = vaddq_u32(x0,x7);
      x1 = vsriq_n_u32(vshlq_n_u32(x1,7),x1,25);
      x0 = vsriq_n_u32(vshlq_n_u32(x0,7),x0,25);
      x3 = vsriq_n_u32(vshlq_n_u32(x3,7),x3,25);
      x2 = vsriq_n_u32(vshlq_n_u32(x2,7),x2,25);
      x1 = veorq_u32(x1,x4);
      x0 = veorq_u32(x0,x5);
      x3 = veorq_u32(x3,x6);
      x2 = veorq_u32(x2,x7);
      x4 = vcombine_u32(vget_high_u32(x4),vget_low_u32(x4));
      x5 = vcombine_u32(vget_high_u32(x5),vget_low_u32(x5));
      x6 = vcombine_u32(vget_high_u32(x6),vget_low_u32(x6));
      x7 = vcombine_u32(vget_high_u32(x7),vget_low_u32(x7));
      x4 = vaddq_u32(x1,x4);
      x5 = vaddq_u32(x0,x5);
      x6 = vaddq_u32(x3,x6);
      x7 = vaddq_u32(x2,x7);
      x0 = vsriq_n_u32(vshlq_n_u32(x0,11),x0,21);
      x1 = vsriq_n_u32(vshlq_n_u32(x1,11),x1,21);
      x2 = vsriq_n_u32(vshlq_n_u32(x2,11),x2,21);
      x3 = vsriq_n_u32(vshlq_n_u32(x3,11),x3,21);
      x0 = veorq_u32(x0,x4);
      x1 = veorq_u32(x1,x5);
      x2 = veorq_u32(x2,x6);
      x3 = veorq_u32(x3,x7);
      x4 = vrev64q_u32(x4);
      x5 = vrev64q_u32(x5);
      x6 = vrev64q_u32(x6);
      x7 = vrev64q_u32(x7);
    }

  if (inlen >= 32) goto mainloop;

  inlenbelow32:

  if (finalization == 0) {
    if (inlen >= 16) {
      x0 = veorq_u32(x0,vld1q_u32((uint32_t *) in));
      y1 ^= y1;
      for (i = 0;i < inlen - 16;++i) ((unsigned char *) &y1)[i] = in[16 + i];
      ((unsigned char *) &y1)[i] = 128;
      x1 = veorq_u32(x1,y1);
    } else {
      y0 ^= y0;
      for (i = 0;i < inlen;++i) ((unsigned char *) &y0)[i] = in[i];
      ((unsigned char *) &y0)[i] = 128;
      x0 = veorq_u32(x0,y0);
    }
    r = CUBEHASH_ROUNDS;
    finalization = 1;
    goto morerounds;
  }

  if (finalization == 1) {
    x7 = veorq_u32(x7,vld1q_u32((uint32_t *) (constants + 32)));
    r = 10 * CUBEHASH_ROUNDS;
    finalization = 2;
    goto morerounds;
  }

  vst1q_u32((uint32_t *) out,x0);
  vst1q_u32((uint32_t *) (out + 16),x1);
  vst1q_u32((uint32_t *) (out + 32),x2);
  vst1q_u32((uint32_t *) (out + 48),x3);

  return 0;
}
