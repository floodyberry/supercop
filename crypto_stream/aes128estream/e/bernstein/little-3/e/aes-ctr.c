#include "ecrypt-sync.h"
#include "table.h"

#if (defined(__alpha) || defined(__sparc) || defined(__hppa))
#error this code manipulates unaligned words
#endif

void ECRYPT_init(void)
{ 
  ;
}

void ECRYPT_keysetup(ECRYPT_ctx *c,const u8 *k,u32 keysize,u32 ivsize)
{ 
  register u32 x0;
  register u32 x1;
  register u32 x2;
  register u32 x3;
  register u32 q0;
  register u32 q1;
  register u32 q2;
  register u32 q3;
  register u32 i;

  x0 = *(u32 *) (k + 0);
  x1 = *(u32 *) (k + 4);
  x2 = *(u32 *) (k + 8);
  x3 = *(u32 *) (k + 12);
  c->key[0] = x0;
  c->key[1] = x1;
  c->key[2] = x2;
  c->key[3] = x3;

  for (i = 0;i < 10;++i) {
    x0 ^= aes_little_constants[i];
    q3 = x3 & 255;
    q0 = (x3 >> 8) & 255;
    q1 = (x3 >> 16) & 255;
    q2 = x3 >> 24;
    q0 = *(u8 *) (table2 + q0 * 8);
    q1 = *(u32 *) (table3 + q1 * 8);
    q2 = *(u32 *) (table0 + q2 * 8);
    q3 = *(u32 *) (table1 + q3 * 8);
    q1 &= 0x0000ff00;
    q2 &= 0x00ff0000;
    q3 &= 0xff000000;
    x0 ^= q0;
    x0 ^= q1;
    x0 ^= q2;
    x0 ^= q3;
    x1 ^= x0;
    x2 ^= x1;
    x3 ^= x2;
    c->key[i + 4] = x0;
  }
}

void ECRYPT_ivsetup(ECRYPT_ctx *c,const u8 *iv)
{
  c->ctr[0] = *(u32 *) (iv);
  c->ctr[1] = *(u32 *) (iv + 4);
  c->ctr[2] = *(u32 *) (iv + 8);
  c->ctr[3] = *(u32 *) (iv + 12);
}

void ECRYPT_process_bytes(int action,ECRYPT_ctx *c,const u8 *input,u8 *output,u32 len)
{
  u32 x[44];
  u32 n[4];
  u8 tmp[16];
  register u32 x0;
  register u32 x1;
  register u32 x2;
  register u32 x3;
  register u32 i;
  register u32 y0;
  register u32 y1;
  register u32 y2;
  register u32 y3;
  register u32 z0;
  register u32 z1;
  register u32 z2;
  register u32 z3;
  register u32 p00;
  register u32 p01;
  register u32 p02;
  register u32 p03;
  register u32 p10;
  register u32 p11;
  register u32 p12;
  register u32 p13;
  register u32 p20;
  register u32 p21;
  register u32 p22;
  register u32 p23;
  register u32 p30;
  register u32 p31;
  register u32 p32;
  register u32 p33;

  x0 = c->key[0];
  x1 = c->key[1];
  x2 = c->key[2];
  x3 = c->key[3];
  x[0] = x0;
  x[1] = x1;
  x[2] = x2;
  x[3] = x3;
  for (i = 0;i < 10;++i) {
    x0 = c->key[i + 4];
    x1 ^= x0;
    x2 ^= x1;
    x3 ^= x2;
    x[i * 4 + 4] = x0;
    x[i * 4 + 5] = x1;
    x[i * 4 + 6] = x2;
    x[i * 4 + 7] = x3;
  }
  n[0] = c->ctr[0];
  n[1] = c->ctr[1];
  n[2] = c->ctr[2];
  n[3] = c->ctr[3];

  while (len > 0) {
    y0 = n[0];
    y1 = n[1];
    y2 = n[2];
    y3 = n[3];
    n[0] = y0 + 1;
    y0 ^= x[0];
    y1 ^= x[1];
    y2 ^= x[2];
    y3 ^= x[3];

    for (i = 1;i < 10;++i) {
      z0 = y0 & 255;
      z3 = (y0 >> 8) & 255;
      z2 = (y0 >> 16) & 255;
      z1 = y0 >> 24;
      z0 = *(u32 *) (table0 + z0 * 8);
      z3 = *(u32 *) (table1 + z3 * 8);
      z2 = *(u32 *) (table2 + z2 * 8);
      z1 = *(u32 *) (table3 + z1 * 8);
      z0 ^= x[i * 4 + 0];
      z1 ^= x[i * 4 + 1];
      z2 ^= x[i * 4 + 2];
      z3 ^= x[i * 4 + 3];
  
      p10 = y1 & 255;
      p11 = (y1 >> 8) & 255;
      p12 = (y1 >> 16) & 255;
      p13 = y1 >> 24;
      p10 = *(u32 *) (table0 + p10 * 8);
      p11 = *(u32 *) (table1 + p11 * 8);
      p12 = *(u32 *) (table2 + p12 * 8);
      p13 = *(u32 *) (table3 + p13 * 8);
      z1 ^= p10;
      z0 ^= p11;
      z3 ^= p12;
      z2 ^= p13;
    
      p20 = y2 & 255;
      p21 = (y2 >> 8) & 255;
      p22 = (y2 >> 16) & 255;
      p23 = y2 >> 24;
      p20 = *(u32 *) (table0 + p20 * 8);
      p21 = *(u32 *) (table1 + p21 * 8);
      p22 = *(u32 *) (table2 + p22 * 8);
      p23 = *(u32 *) (table3 + p23 * 8);
      z2 ^= p20;
      z1 ^= p21;
      z0 ^= p22;
      z3 ^= p23;
  
      p30 = y3 & 255;
      p31 = (y3 >> 8) & 255;
      p32 = (y3 >> 16) & 255;
      p33 = y3 >> 24;
      p31 = *(u32 *) (table1 + p31 * 8);
      p32 = *(u32 *) (table2 + p32 * 8);
      p33 = *(u32 *) (table3 + p33 * 8);
      p30 = *(u32 *) (table0 + p30 * 8);
      y2 = z2 ^ p31;
      y1 = z1 ^ p32;
      y0 = z0 ^ p33;
      y3 = z3 ^ p30;
    }

    z0 = y0 & 255;
    z3 = (y0 >> 8) & 255;
    z2 = (y0 >> 16) & 255;
    z1 = y0 >> 24;
    z0 = *(u8 *) (table2 + z0 * 8);
    z3 = *(u32 *) (table3 + z3 * 8);
    z2 = *(u32 *) (table0 + z2 * 8);
    z1 = *(u32 *) (table1 + z1 * 8);
    z3 &= 0x0000ff00;
    z2 &= 0x00ff0000;
    z1 &= 0xff000000;
    z0 ^= x[i * 4 + 0];
    z1 ^= x[i * 4 + 1];
    z2 ^= x[i * 4 + 2];
    z3 ^= x[i * 4 + 3];

    p10 = y1 & 255;
    p11 = (y1 >> 8) & 255;
    p12 = (y1 >> 16) & 255;
    p13 = y1 >> 24;
    p10 = *(u8 *) (table2 + p10 * 8);
    p11 = *(u32 *) (table3 + p11 * 8);
    p12 = *(u32 *) (table0 + p12 * 8);
    p13 = *(u32 *) (table1 + p13 * 8);
    p11 &= 0x0000ff00;
    p12 &= 0x00ff0000;
    p13 &= 0xff000000;
    z1 ^= p10;
    z0 ^= p11;
    z3 ^= p12;
    z2 ^= p13;
  
    p20 = y2 & 255;
    p21 = (y2 >> 8) & 255;
    p22 = (y2 >> 16) & 255;
    p23 = y2 >> 24;
    p20 = *(u8 *) (table2 + p20 * 8);
    p21 = *(u32 *) (table3 + p21 * 8);
    p22 = *(u32 *) (table0 + p22 * 8);
    p23 = *(u32 *) (table1 + p23 * 8);
    p21 &= 0x0000ff00;
    p22 &= 0x00ff0000;
    p23 &= 0xff000000;
    z2 ^= p20;
    z1 ^= p21;
    z0 ^= p22;
    z3 ^= p23;
  
    p30 = y3 & 255;
    p31 = (y3 >> 8) & 255;
    p32 = (y3 >> 16) & 255;
    p33 = y3 >> 24;
    p30 = *(u8 *) (table2 + p30 * 8);
    p31 = *(u32 *) (table3 + p31 * 8);
    p32 = *(u32 *) (table0 + p32 * 8);
    p33 = *(u32 *) (table1 + p33 * 8);
    p31 &= 0x0000ff00;
    p32 &= 0x00ff0000;
    p33 &= 0xff000000;
    y3 = z3 ^ p30;
    y2 = z2 ^ p31;
    y1 = z1 ^ p32;
    y0 = z0 ^ p33;

    if (len < 16) {
      *(u32 *) (tmp + 0) = y0;
      *(u32 *) (tmp + 4) = y1;
      *(u32 *) (tmp + 8) = y2;
      *(u32 *) (tmp + 12) = y3;
      for (i = 0;i < len;++i) output[i] = input[i] ^ tmp[i];
      break;
    }

    y0 ^= *(u32 *) (input + 0);
    y1 ^= *(u32 *) (input + 4);
    y2 ^= *(u32 *) (input + 8);
    y3 ^= *(u32 *) (input + 12);

    *(u32 *) (output + 0) = y0;
    *(u32 *) (output + 4) = y1;
    *(u32 *) (output + 8) = y2;
    *(u32 *) (output + 12) = y3;

    len -= 16;
    input += 16;
    output += 16;
  }
  
  c->ctr[0] = n[0];
  c->ctr[1] = n[1];
  c->ctr[2] = n[2];
  c->ctr[3] = n[3];
}
