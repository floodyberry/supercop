#define CUBEHASH_ROUNDS 16
#include <altivec.h>
#include "crypto_hash.h"

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
  vector unsigned char align = vec_lvsl(0,in);
  vector unsigned char littleendian = {3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12};
  vector unsigned char alignswap = vec_perm(align,align,littleendian);
  vector unsigned int rol7 = vec_splat_u32(7);
  vector unsigned int rol11 = vec_splat_u32(11);
  vector unsigned char swap2301 = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
  vector unsigned char swap1032 = {4,5,6,7,0,1,2,3,12,13,14,15,8,9,10,11};
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

    y0 = vec_ld(0,(vector unsigned int *) in);
    y1 = vec_ld(16,(vector unsigned int *) in);
    y2 = vec_ld(31,(vector unsigned int *) in);
    x0 ^= vec_perm(y0,y1,(vector unsigned char) alignswap);
    x1 ^= vec_perm(y1,y2,(vector unsigned char) alignswap);
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;r -= 2) {
      x4 += x0;
      x5 += x1;
      x6 += x2;
      x7 += x3;
      x2 = vec_rl(x2,rol7) ^ x4;
      x3 = vec_rl(x3,rol7) ^ x5;
      x0 = vec_rl(x0,rol7) ^ x6;
      x1 = vec_rl(x1,rol7) ^ x7;
      x4 = vec_perm(x4,x4,swap2301);
      x5 = vec_perm(x5,x5,swap2301);
      x6 = vec_perm(x6,x6,swap2301);
      x7 = vec_perm(x7,x7,swap2301);
      x4 += x2;
      x5 += x3;
      x6 += x0;
      x7 += x1;
      x3 = vec_rl(x3,rol11) ^ x4;
      x2 = vec_rl(x2,rol11) ^ x5;
      x1 = vec_rl(x1,rol11) ^ x6;
      x0 = vec_rl(x0,rol11) ^ x7;
      x4 = vec_perm(x4,x4,swap1032);
      x5 = vec_perm(x5,x5,swap1032);
      x6 = vec_perm(x6,x6,swap1032);
      x7 = vec_perm(x7,x7,swap1032);
      x4 += x3;
      x5 += x2;
      x6 += x1;
      x7 += x0;
      x1 = vec_rl(x1,rol7) ^ x4;
      x0 = vec_rl(x0,rol7) ^ x5;
      x3 = vec_rl(x3,rol7) ^ x6;
      x2 = vec_rl(x2,rol7) ^ x7;
      x4 = vec_perm(x4,x4,swap2301);
      x5 = vec_perm(x5,x5,swap2301);
      x6 = vec_perm(x6,x6,swap2301);
      x7 = vec_perm(x7,x7,swap2301);
      x4 += x1;
      x5 += x0;
      x6 += x3;
      x7 += x2;
      x0 = vec_rl(x0,rol11) ^ x4;
      x1 = vec_rl(x1,rol11) ^ x5;
      x2 = vec_rl(x2,rol11) ^ x6;
      x3 = vec_rl(x3,rol11) ^ x7;
      x4 = vec_perm(x4,x4,swap1032);
      x5 = vec_perm(x5,x5,swap1032);
      x6 = vec_perm(x6,x6,swap1032);
      x7 = vec_perm(x7,x7,swap1032);
    }

  if (inlen >= 32) goto mainloop;

  endofloop:

  if (finalization == 0) {
    for (i = 0;i < inlen;++i) tmp[i] = in[i];
    tmp[i] = 128;
    for (++i;i < 32;++i) tmp[i] = 0;
    in = tmp;
    align = vec_lvsl(0,in);
    alignswap = vec_perm(align,align,littleendian);
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

  x0 = vec_perm(x0,x0,littleendian);
  x1 = vec_perm(x1,x1,littleendian);
  x2 = vec_perm(x2,x2,littleendian);
  x3 = vec_perm(x3,x3,littleendian);

  y0 = vec_ld(0,(vector unsigned int *) out);
  y1 = vec_ld(16,(vector unsigned int *) out);
  y2 = vec_ld(32,(vector unsigned int *) out);
  y3 = vec_ld(48,(vector unsigned int *) out);
  y4 = vec_ld(63,(vector unsigned int *) out);

  align = vec_lvsl(0,out);
  edges = vec_perm(y4,y0,align);

  align = vec_lvsr(0,out);
  y0 = vec_perm(edges,x0,align);
  y1 = vec_perm(x0,x1,align);
  y2 = vec_perm(x1,x2,align);
  y3 = vec_perm(x2,x3,align);
  y4 = vec_perm(x3,edges,align);
  vec_st(y4,63,(vector unsigned int *) out);
  vec_st(y3,48,(vector unsigned int *) out);
  vec_st(y2,32,(vector unsigned int *) out);
  vec_st(y1,16,(vector unsigned int *) out);
  vec_st(y0,0,(vector unsigned int *) out);

  return 0;
}
