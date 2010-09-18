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

  x0 = (vector unsigned int){0x2aea2a61,0x50f494d4,0x2d538b8b,0x4167d83e};
  x1 = (vector unsigned int){0x3fee2313,0xc701cf8c,0xcc39968e,0x50ac5695};
  x2 = (vector unsigned int){0x4d42c787,0xa647a8b3,0x97cf0bef,0x825b4537};
  x3 = (vector unsigned int){0xeef864d2,0xf22090c4,0xd0e5cd33,0xa23911ae};
  x4 = (vector unsigned int){0xfcd398d9,0x148fe485,0x1b017bef,0xb6444532};
  x5 = (vector unsigned int){0x6a536159,0x2ff5781c,0x91fa7934,0x0dbadea9};
  x6 = (vector unsigned int){0xd65c8a2b,0xa5a70e75,0xb1c62456,0xbc796576};
  x7 = (vector unsigned int){0x1921c8f7,0xe7989af1,0x7795d246,0xd43e3b44};

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
    r = 10 * CUBEHASH_ROUNDS;
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
