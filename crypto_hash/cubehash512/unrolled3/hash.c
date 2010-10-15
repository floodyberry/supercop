/*
20100917
D. J. Bernstein
Public domain.

Compressed version of unrolled2, plus better locality in inner loop.
*/

#define CUBEHASH_ROUNDS 16
#include "crypto_hash.h"
#include "crypto_uint32.h"

#define ROL(a,b) (a = (((a) << (b)) | ((a) >> (32 - b))))

static void store_littleendian(unsigned char *out,crypto_uint32 u)
{
  out[0] = u;
  out[1] = u >> 8;
  out[2] = u >> 16;
  out[3] = u >> 24;
}

static crypto_uint32 load_littleendian(const unsigned char *in)
{
  crypto_uint32 result;
  result = (crypto_uint32) in[0];
  result ^= ((crypto_uint32) in[1]) << 8;
  result ^= ((crypto_uint32) in[2]) << 16;
  result ^= ((crypto_uint32) in[3]) << 24;
  return result;
}

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  crypto_uint32 x00 = 0x781f814f;
  crypto_uint32 x01 = 0x18f45926;
  crypto_uint32 x02 = 0x992b7520;
  crypto_uint32 x03 = 0xc8237df7;
  crypto_uint32 x04 = 0xe4e3ba88;
  crypto_uint32 x05 = 0x7b0075ff;
  crypto_uint32 x06 = 0x51916982;
  crypto_uint32 x07 = 0x947c6147;
  crypto_uint32 x08 = 0x9dc06f0a;
  crypto_uint32 x09 = 0x4d197eb5;
  crypto_uint32 x0a = 0xb6e17224;
  crypto_uint32 x0b = 0x912e1aca;
  crypto_uint32 x0c = 0x5270f5e1;
  crypto_uint32 x0d = 0xd9efd0ec;
  crypto_uint32 x0e = 0xf0fcf7c8;
  crypto_uint32 x0f = 0x20d4074f;
  crypto_uint32 x10 = 0x15547fee;
  crypto_uint32 x11 = 0xf4839313;
  crypto_uint32 x12 = 0x017c189c;
  crypto_uint32 x13 = 0xaf1c332a;
  crypto_uint32 x14 = 0xde4d7c8c;
  crypto_uint32 x15 = 0x84997eec;
  crypto_uint32 x16 = 0x5bd87a43;
  crypto_uint32 x17 = 0xb6d3d055;
  crypto_uint32 x18 = 0x3ae247b0;
  crypto_uint32 x19 = 0x2b8cb0a6;
  crypto_uint32 x1a = 0xd9d6ca35;
  crypto_uint32 x1b = 0x4bf12b94;
  crypto_uint32 x1c = 0x97f33a51;
  crypto_uint32 x1d = 0x62fb84ad;
  crypto_uint32 x1e = 0x7e70e613;
  crypto_uint32 x1f = 0x520c709b;
  int i;
  int r;
  unsigned char tmp[32];
  int finalization = 0;

  if (inlen < 32) goto inlenbelow32;

  mainloop:

    x00 ^= load_littleendian(in);
    x01 ^= load_littleendian(in + 4);
    x02 ^= load_littleendian(in + 8);
    x03 ^= load_littleendian(in + 12);
    x04 ^= load_littleendian(in + 16);
    x05 ^= load_littleendian(in + 20);
    x06 ^= load_littleendian(in + 24);
    x07 ^= load_littleendian(in + 28);
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;r -= 2) {
      x10 += x00; x12 += x02; x18 += x08; x1a += x0a;
      ROL(x00,7); ROL(x02,7); ROL(x08,7); ROL(x0a,7);
      x00 ^= x18; x02 ^= x1a; x08 ^= x10; x0a ^= x12;
      x1a += x00; x18 += x02; x12 += x08; x10 += x0a;

      x14 += x04; x16 += x06; x1c += x0c; x1e += x0e;
      ROL(x04,7); ROL(x06,7); ROL(x0c,7); ROL(x0e,7);
      x04 ^= x1c; x06 ^= x1e; x0c ^= x14; x0e ^= x16;
      x1e += x04; x1c += x06; x16 += x0c; x14 += x0e;

      x11 += x01; x13 += x03; x19 += x09; x1b += x0b;
      ROL(x01,7); ROL(x03,7); ROL(x09,7); ROL(x0b,7);
      x01 ^= x19; x03 ^= x1b; x09 ^= x11; x0b ^= x13;
      x1b += x01; x19 += x03; x13 += x09; x11 += x0b;

      x15 += x05; x17 += x07; x1d += x0d; x1f += x0f;
      ROL(x05,7); ROL(x07,7); ROL(x0d,7); ROL(x0f,7);
      x05 ^= x1d; x07 ^= x1f; x0d ^= x15; x0f ^= x17;
      x1f += x05; x1d += x07; x17 += x0d; x15 += x0f;

      ROL(x00,11); ROL(x01,11); ROL(x08,11); ROL(x09,11);
      x00 ^= x1e; x01 ^= x1f; x08 ^= x16; x09 ^= x17;
      x1f += x00; x1e += x01; x17 += x08; x16 += x09;
      ROL(x00,7); ROL(x01,7); ROL(x08,7); ROL(x09,7);
      x00 ^= x17; x01 ^= x16; x08 ^= x1f; x09 ^= x1e;

      ROL(x02,11); ROL(x03,11); ROL(x0a,11); ROL(x0b,11);
      x02 ^= x1c; x03 ^= x1d; x0a ^= x14; x0b ^= x15;
      x1d += x02; x1c += x03; x15 += x0a; x14 += x0b;
      ROL(x02,7); ROL(x03,7); ROL(x0a,7); ROL(x0b,7);
      x02 ^= x15; x03 ^= x14; x0a ^= x1d; x0b ^= x1c;
      
      ROL(x04,11); ROL(x05,11); ROL(x0c,11); ROL(x0d,11);
      x04 ^= x1a; x05 ^= x1b; x0c ^= x12; x0d ^= x13;
      x1b += x04; x1a += x05; x13 += x0c; x12 += x0d;
      ROL(x04,7); ROL(x05,7); ROL(x0c,7); ROL(x0d,7);
      x04 ^= x13; x05 ^= x12; x0c ^= x1b; x0d ^= x1a;

      ROL(x06,11); ROL(x07,11); ROL(x0e,11); ROL(x0f,11);
      x06 ^= x18; x07 ^= x19; x0e ^= x10; x0f ^= x11;
      x19 += x06; x18 += x07; x11 += x0e; x10 += x0f;
      ROL(x06,7); ROL(x07,7); ROL(x0e,7); ROL(x0f,7);
      x06 ^= x11; x07 ^= x10; x0e ^= x19; x0f ^= x18;

      x11 += x04; x10 += x05; x19 += x0c; x18 += x0d;
      x15 += x00; x14 += x01; x1d += x08; x1c += x09;
      ROL(x04,11); ROL(x05,11); ROL(x0c,11); ROL(x0d,11);
      x04 ^= x15; x05 ^= x14; x0c ^= x1d; x0d ^= x1c;
      ROL(x00,11); ROL(x01,11); ROL(x08,11); ROL(x09,11);
      x00 ^= x11; x01 ^= x10; x08 ^= x19; x09 ^= x18;

      x13 += x06; x12 += x07; x1b += x0e; x1a += x0f;
      x17 += x02; x16 += x03; x1f += x0a; x1e += x0b;
      ROL(x06,11); ROL(x07,11); ROL(x0e,11); ROL(x0f,11);
      x06 ^= x17; x07 ^= x16; x0e ^= x1f; x0f ^= x1e;
      ROL(x02,11); ROL(x03,11); ROL(x0a,11); ROL(x0b,11);
      x02 ^= x13; x03 ^= x12; x0a ^= x1b; x0b ^= x1a;
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
    x1f ^= 1;
    r = 32;
    finalization = 2;
    goto morerounds;
  }

  store_littleendian(out,x00);
  store_littleendian(out + 4,x01);
  store_littleendian(out + 8,x02);
  store_littleendian(out + 12,x03);
  store_littleendian(out + 16,x04);
  store_littleendian(out + 20,x05);
  store_littleendian(out + 24,x06);
  store_littleendian(out + 28,x07);
  store_littleendian(out + 32,x08);
  store_littleendian(out + 36,x09);
  store_littleendian(out + 40,x0a);
  store_littleendian(out + 44,x0b);
  store_littleendian(out + 48,x0c);
  store_littleendian(out + 52,x0d);
  store_littleendian(out + 56,x0e);
  store_littleendian(out + 60,x0f);

  return 0;
}
