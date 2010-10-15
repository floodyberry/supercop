#define CUBEHASH_ROUNDS 16
#include <spu_intrinsics.h>
#include "crypto_hash.h"

static const vector unsigned short leftoffset = {0x0001,0x0203,0x0405,0x0607,0x0809,0x0A0B,0x0C0D,0x0E0F};
static const vector unsigned short rightoffset = {0x1011,0x1213,0x1415,0x1617,0x1819,0x1A1B,0x1C1D,0x1E1F};
static const vector unsigned char littleendian = {3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12};
static const vector unsigned char swap2301 = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
static const vector unsigned char swap1032 = {4,5,6,7,0,1,2,3,12,13,14,15,8,9,10,11};

static inline vec_uchar16 mylvsl(unsigned char *b)
{
  return (vec_uchar16)spu_add((vector unsigned short)(spu_splats((unsigned char)(((int)(b)) & 0xF))), 
                               ((vector unsigned short) leftoffset));
}

static inline vec_uchar16 mylvsr(unsigned char *b)
{
  return (vec_uchar16)spu_sub((vector unsigned short) rightoffset,
                                (vector unsigned short)(spu_splats((unsigned char)(((int)(b)) & 0xF))));
}

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  vector unsigned int x0;
  vector unsigned int x1;
  vector unsigned int x2;
  vector unsigned int x3;
  vector unsigned int x4;
  vector unsigned int x5;
  vector unsigned int x6;
  vector unsigned int x7;
  vector unsigned int y0;
  vector unsigned int y1;
  vector unsigned int y2;
  vector unsigned int y3;
  vector unsigned int y4;
  vector unsigned char align = mylvsl((unsigned char *) in);
  vector unsigned char alignswap = spu_shuffle(align,align,littleendian);
  vector signed int rol7 = spu_splats(7);
  vector signed int rol11 = spu_splats(11);
  vector unsigned int edges;
  unsigned char tmp[32];
  int i;
  int r;
  int finalization = 0;

  x0 = (vector unsigned int){0x781f814f,0x18f45926,0x992b7520,0xc8237df7};
  x1 = (vector unsigned int){0xe4e3ba88,0x7b0075ff,0x51916982,0x947c6147};
  x2 = (vector unsigned int){0x9dc06f0a,0x4d197eb5,0xb6e17224,0x912e1aca};
  x3 = (vector unsigned int){0x5270f5e1,0xd9efd0ec,0xf0fcf7c8,0x20d4074f};
  x4 = (vector unsigned int){0x15547fee,0xf4839313,0x017c189c,0xaf1c332a};
  x5 = (vector unsigned int){0xde4d7c8c,0x84997eec,0x5bd87a43,0xb6d3d055};
  x6 = (vector unsigned int){0x3ae247b0,0x2b8cb0a6,0xd9d6ca35,0x4bf12b94};
  x7 = (vector unsigned int){0x97f33a51,0x62fb84ad,0x7e70e613,0x520c709b};

  if (inlen < 32) goto endofloop;

  mainloop:

    y0 = *(vector unsigned int *) (in + 0);
    y1 = *(vector unsigned int *) (in + 16);
    y2 = *(vector unsigned int *) (in + 31);
    x0 ^= spu_shuffle(y0,y1,(vector unsigned char) alignswap);
    x1 ^= spu_shuffle(y1,y2,(vector unsigned char) alignswap);
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;r -= 2) {
      x4 += x0;
      x5 += x1;
      x6 += x2;
      x7 += x3;
      x2 = spu_rl(x2,rol7) ^ x4;
      x3 = spu_rl(x3,rol7) ^ x5;
      x0 = spu_rl(x0,rol7) ^ x6;
      x1 = spu_rl(x1,rol7) ^ x7;
      x4 = spu_shuffle(x4,x4,swap2301);
      x5 = spu_shuffle(x5,x5,swap2301);
      x6 = spu_shuffle(x6,x6,swap2301);
      x7 = spu_shuffle(x7,x7,swap2301);
      x4 += x2;
      x5 += x3;
      x6 += x0;
      x7 += x1;
      x3 = spu_rl(x3,rol11) ^ x4;
      x2 = spu_rl(x2,rol11) ^ x5;
      x1 = spu_rl(x1,rol11) ^ x6;
      x0 = spu_rl(x0,rol11) ^ x7;
      x4 = spu_shuffle(x4,x4,swap1032);
      x5 = spu_shuffle(x5,x5,swap1032);
      x6 = spu_shuffle(x6,x6,swap1032);
      x7 = spu_shuffle(x7,x7,swap1032);
      x4 += x3;
      x5 += x2;
      x6 += x1;
      x7 += x0;
      x1 = spu_rl(x1,rol7) ^ x4;
      x0 = spu_rl(x0,rol7) ^ x5;
      x3 = spu_rl(x3,rol7) ^ x6;
      x2 = spu_rl(x2,rol7) ^ x7;
      x4 = spu_shuffle(x4,x4,swap2301);
      x5 = spu_shuffle(x5,x5,swap2301);
      x6 = spu_shuffle(x6,x6,swap2301);
      x7 = spu_shuffle(x7,x7,swap2301);
      x4 += x1;
      x5 += x0;
      x6 += x3;
      x7 += x2;
      x0 = spu_rl(x0,rol11) ^ x4;
      x1 = spu_rl(x1,rol11) ^ x5;
      x2 = spu_rl(x2,rol11) ^ x6;
      x3 = spu_rl(x3,rol11) ^ x7;
      x4 = spu_shuffle(x4,x4,swap1032);
      x5 = spu_shuffle(x5,x5,swap1032);
      x6 = spu_shuffle(x6,x6,swap1032);
      x7 = spu_shuffle(x7,x7,swap1032);
    }

  if (inlen >= 32) goto mainloop;

  endofloop:

  if (finalization == 0) {
    for (i = 0;i < inlen;++i) tmp[i] = in[i];
    tmp[i] = 128;
    for (++i;i < 32;++i) tmp[i] = 0;
    in = tmp;
    align = mylvsl((unsigned char *) in);
    alignswap = spu_shuffle(align,align,littleendian);
    inlen = 32;
    finalization = 1;
    goto mainloop;
  }

  if (finalization == 1) {
    x7 ^= (vector unsigned int){0,0,0,1};
    r = 32;
    finalization = 2;
    goto morerounds;
  }

  x0 = spu_shuffle(x0,x0,littleendian);
  x1 = spu_shuffle(x1,x1,littleendian);
  x2 = spu_shuffle(x2,x2,littleendian);
  x3 = spu_shuffle(x3,x3,littleendian);

  y0 = *(vector unsigned int *) (out + 0);
  y1 = *(vector unsigned int *) (out + 16);
  y2 = *(vector unsigned int *) (out + 32);
  y3 = *(vector unsigned int *) (out + 48);
  y4 = *(vector unsigned int *) (out + 63);

  align = mylvsl(out);
  edges = spu_shuffle(y4,y0,align);

  align = mylvsr(out);
  y0 = spu_shuffle(edges,x0,align);
  y1 = spu_shuffle(x0,x1,align);
  y2 = spu_shuffle(x1,x2,align);
  y3 = spu_shuffle(x2,x3,align);
  y4 = spu_shuffle(x3,edges,align);
  *(vector unsigned int *) (out + 63) = y4;
  *(vector unsigned int *) (out + 48) = y3;
  *(vector unsigned int *) (out + 32) = y2;
  *(vector unsigned int *) (out + 16) = y1;
  *(vector unsigned int *) (out + 0) = y0;

  return 0;
}
