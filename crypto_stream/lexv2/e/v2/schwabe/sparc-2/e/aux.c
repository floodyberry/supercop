#include "ecrypt-sync.h"
#include "table.h"

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

  x0 = U8TO32_LITTLE(k + 0);
  x1 = U8TO32_LITTLE(k + 4);
  x2 = U8TO32_LITTLE(k + 8);
  x3 = U8TO32_LITTLE(k + 12);
	/*
  c->data[0] = SWAP32(x0);
  c->data[1] = SWAP32(x1);
  c->data[2] = SWAP32(x2);
  c->data[3] = SWAP32(x3);
	*/
  c->data[0] = x0;
  c->data[1] = x1;
  c->data[2] = x2;
  c->data[3] = x3;

  for (i = 0;i < 10;++i) {
    x0 ^= aes_little_constants[i];
    q3 = x3 << 4;
    q0 = x3 >> 4;
    q1 = x3 >> 12;
    q2 = x3 >> 20;
    q0 &= 4080;
    q1 &= 4080;
    q2 &= 4080;
    q3 &= 4080;
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
    c->data[i + 4] = x0;
  }
}

