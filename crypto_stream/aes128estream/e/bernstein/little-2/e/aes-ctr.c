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
    q3 = x3 << 3;
    q0 = x3 >> 5;
    q1 = x3 >> 13;
    q2 = x3 >> 21;
    q0 &= 2040;
    q1 &= 2040;
    q2 &= 2040;
    q3 &= 2040;
    q0 = *(u32 *) (table2 + q0);
    q1 = *(u32 *) (table3 + q1);
    q2 = *(u32 *) (table0 + q2);
    q3 = *(u32 *) (table1 + q3);
    q0 &= 0x000000ff;
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
      z0 = x[i * 4 + 0];
      z1 = x[i * 4 + 1];
      z2 = x[i * 4 + 2];
      z3 = x[i * 4 + 3];

      p00 = y0 << 3;
      p01 = y0 >> 5;
      p02 = y0 >> 13;
      p03 = y0 >> 21;
      p00 &= 2040;
      p01 &= 2040;
      p02 &= 2040;
      p03 &= 2040;
      p00 = *(u32 *) (table0 + p00);
      p01 = *(u32 *) (table1 + p01);
      p02 = *(u32 *) (table2 + p02);
      p03 = *(u32 *) (table3 + p03);
      z0 ^= p00;
      z3 ^= p01;
      z2 ^= p02;
      z1 ^= p03;
  
      p10 = y1 << 3;
      p11 = y1 >> 5;
      p12 = y1 >> 13;
      p13 = y1 >> 21;
      p10 &= 2040;
      p11 &= 2040;
      p12 &= 2040;
      p13 &= 2040;
      p10 = *(u32 *) (table0 + p10);
      p11 = *(u32 *) (table1 + p11);
      p12 = *(u32 *) (table2 + p12);
      p13 = *(u32 *) (table3 + p13);
      z1 ^= p10;
      z0 ^= p11;
      z3 ^= p12;
      z2 ^= p13;
    
      p20 = y2 << 3;
      p21 = y2 >> 5;
      p22 = y2 >> 13;
      p23 = y2 >> 21;
      p20 &= 2040;
      p21 &= 2040;
      p22 &= 2040;
      p23 &= 2040;
      p20 = *(u32 *) (table0 + p20);
      p21 = *(u32 *) (table1 + p21);
      p22 = *(u32 *) (table2 + p22);
      p23 = *(u32 *) (table3 + p23);
      z2 ^= p20;
      z1 ^= p21;
      z0 ^= p22;
      z3 ^= p23;
  
      p30 = y3 << 3;
      p31 = y3 >> 5;
      p32 = y3 >> 13;
      p33 = y3 >> 21;
      p31 &= 2040;
      p32 &= 2040;
      p33 &= 2040;
      p30 &= 2040;
      p31 = *(u32 *) (table1 + p31);
      p32 = *(u32 *) (table2 + p32);
      p33 = *(u32 *) (table3 + p33);
      p30 = *(u32 *) (table0 + p30);
      y2 = z2 ^ p31;
      y1 = z1 ^ p32;
      y0 = z0 ^ p33;
      y3 = z3 ^ p30;
    }

    z0 = x[i * 4 + 0];
    z1 = x[i * 4 + 1];
    z2 = x[i * 4 + 2];
    z3 = x[i * 4 + 3];

    p00 = y0 << 3;
    p01 = y0 >> 5;
    p02 = y0 >> 13;
    p03 = y0 >> 21;
    p00 &= 2040;
    p01 &= 2040;
    p02 &= 2040;
    p03 &= 2040;
    p00 = *(u32 *) (table2 + p00);
    p01 = *(u32 *) (table3 + p01);
    p02 = *(u32 *) (table0 + p02);
    p03 = *(u32 *) (table1 + p03);
    p00 &= 0x000000ff;
    p01 &= 0x0000ff00;
    p02 &= 0x00ff0000;
    p03 &= 0xff000000;
    z0 ^= p00;
    z3 ^= p01;
    z2 ^= p02;
    z1 ^= p03;

    p10 = y1 << 3;
    p11 = y1 >> 5;
    p12 = y1 >> 13;
    p13 = y1 >> 21;
    p10 &= 2040;
    p11 &= 2040;
    p12 &= 2040;
    p13 &= 2040;
    p10 = *(u32 *) (table2 + p10);
    p11 = *(u32 *) (table3 + p11);
    p12 = *(u32 *) (table0 + p12);
    p13 = *(u32 *) (table1 + p13);
    p10 &= 0x000000ff;
    p11 &= 0x0000ff00;
    p12 &= 0x00ff0000;
    p13 &= 0xff000000;
    z1 ^= p10;
    z0 ^= p11;
    z3 ^= p12;
    z2 ^= p13;
  
    p20 = y2 << 3;
    p21 = y2 >> 5;
    p22 = y2 >> 13;
    p23 = y2 >> 21;
    p20 &= 2040;
    p21 &= 2040;
    p22 &= 2040;
    p23 &= 2040;
    p20 = *(u32 *) (table2 + p20);
    p21 = *(u32 *) (table3 + p21);
    p22 = *(u32 *) (table0 + p22);
    p23 = *(u32 *) (table1 + p23);
    p20 &= 0x000000ff;
    p21 &= 0x0000ff00;
    p22 &= 0x00ff0000;
    p23 &= 0xff000000;
    z2 ^= p20;
    z1 ^= p21;
    z0 ^= p22;
    z3 ^= p23;
  
    p30 = y3 << 3;
    p31 = y3 >> 5;
    p32 = y3 >> 13;
    p33 = y3 >> 21;
    p31 &= 2040;
    p32 &= 2040;
    p33 &= 2040;
    p30 &= 2040;
    p30 = *(u32 *) (table2 + p30);
    p31 = *(u32 *) (table3 + p31);
    p32 = *(u32 *) (table0 + p32);
    p33 = *(u32 *) (table1 + p33);
    p30 &= 0x000000ff;
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
