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
  crypto_uint32 x00 = 0x2aea2a61;
  crypto_uint32 x01 = 0x50f494d4;
  crypto_uint32 x02 = 0x2d538b8b;
  crypto_uint32 x03 = 0x4167d83e;
  crypto_uint32 x04 = 0x3fee2313;
  crypto_uint32 x05 = 0xc701cf8c;
  crypto_uint32 x06 = 0xcc39968e;
  crypto_uint32 x07 = 0x50ac5695;
  crypto_uint32 x08 = 0x4d42c787;
  crypto_uint32 x09 = 0xa647a8b3;
  crypto_uint32 x0a = 0x97cf0bef;
  crypto_uint32 x0b = 0x825b4537;
  crypto_uint32 x0c = 0xeef864d2;
  crypto_uint32 x0d = 0xf22090c4;
  crypto_uint32 x0e = 0xd0e5cd33;
  crypto_uint32 x0f = 0xa23911ae;
  crypto_uint32 x10 = 0xfcd398d9;
  crypto_uint32 x11 = 0x148fe485;
  crypto_uint32 x12 = 0x1b017bef;
  crypto_uint32 x13 = 0xb6444532;
  crypto_uint32 x14 = 0x6a536159;
  crypto_uint32 x15 = 0x2ff5781c;
  crypto_uint32 x16 = 0x91fa7934;
  crypto_uint32 x17 = 0x0dbadea9;
  crypto_uint32 x18 = 0xd65c8a2b;
  crypto_uint32 x19 = 0xa5a70e75;
  crypto_uint32 x1a = 0xb1c62456;
  crypto_uint32 x1b = 0xbc796576;
  crypto_uint32 x1c = 0x1921c8f7;
  crypto_uint32 x1d = 0xe7989af1;
  crypto_uint32 x1e = 0x7795d246;
  crypto_uint32 x1f = 0xd43e3b44;
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
      x10 += x00; x18 += x08; ROL(x00,7); ROL(x08,7); x00 ^= x18; x08 ^= x10;
      x14 += x04; x1c += x0c; ROL(x04,7); ROL(x0c,7); x04 ^= x1c; x0c ^= x14;
      x12 += x02; x1a += x0a; ROL(x02,7); ROL(x0a,7); x02 ^= x1a; x0a ^= x12;
      x16 += x06; x1e += x0e; ROL(x06,7); ROL(x0e,7); x06 ^= x1e; x0e ^= x16;

      x10 += x0a; x14 += x0e; ROL(x0a,11); ROL(x0e,11); x0a ^= x14; x0e ^= x10;
      x18 += x02; x1c += x06; ROL(x02,11); ROL(x06,11); x02 ^= x1c; x06 ^= x18;
      x12 += x08; x16 += x0c; ROL(x08,11); ROL(x0c,11); x08 ^= x16; x0c ^= x12;
      x1a += x00; x1e += x04; ROL(x00,11); ROL(x04,11); x00 ^= x1e; x04 ^= x1a;

      x11 += x01; x19 += x09; ROL(x01,7); ROL(x09,7); x01 ^= x19; x09 ^= x11;
      x15 += x05; x1d += x0d; ROL(x05,7); ROL(x0d,7); x05 ^= x1d; x0d ^= x15;
      x13 += x03; x1b += x0b; ROL(x03,7); ROL(x0b,7); x03 ^= x1b; x0b ^= x13;
      x17 += x07; x1f += x0f; ROL(x07,7); ROL(x0f,7); x07 ^= x1f; x0f ^= x17;

      x11 += x0b; x15 += x0f; ROL(x0b,11); ROL(x0f,11); x0b ^= x15; x0f ^= x11;
      x19 += x03; x1d += x07; ROL(x03,11); ROL(x07,11); x03 ^= x1d; x07 ^= x19;
      x13 += x09; x17 += x0d; ROL(x09,11); ROL(x0d,11); x09 ^= x17; x0d ^= x13;
      x1b += x01; x1f += x05; ROL(x01,11); ROL(x05,11); x01 ^= x1f; x05 ^= x1b;

      x1f += x00; x17 += x08; ROL(x00,7); ROL(x08,7); x00 ^= x17; x08 ^= x1f;
      x1b += x04; x13 += x0c; ROL(x04,7); ROL(x0c,7); x04 ^= x13; x0c ^= x1b;
      x1d += x02; x15 += x0a; ROL(x02,7); ROL(x0a,7); x02 ^= x15; x0a ^= x1d;
      x19 += x06; x11 += x0e; ROL(x06,7); ROL(x0e,7); x06 ^= x11; x0e ^= x19;

      x17 += x02; x13 += x06; ROL(x02,11); ROL(x06,11); x02 ^= x13; x06 ^= x17; 
      x1f += x0a; x1b += x0e; ROL(x0a,11); ROL(x0e,11); x0a ^= x1b; x0e ^= x1f; 
      x15 += x00; x11 += x04; ROL(x00,11); ROL(x04,11); x00 ^= x11; x04 ^= x15;
      x1d += x08; x19 += x0c; ROL(x08,11); ROL(x0c,11); x08 ^= x19; x0c ^= x1d;

      x1e += x01; x16 += x09; ROL(x01,7); ROL(x09,7); x01 ^= x16; x09 ^= x1e; 
      x1a += x05; x12 += x0d; ROL(x05,7); ROL(x0d,7); x05 ^= x12; x0d ^= x1a;
      x1c += x03; x14 += x0b; ROL(x03,7); ROL(x0b,7); x03 ^= x14; x0b ^= x1c; 
      x18 += x07; x10 += x0f; ROL(x07,7); ROL(x0f,7); x07 ^= x10; x0f ^= x18;

      x16 += x03; x12 += x07; ROL(x03,11); ROL(x07,11); x03 ^= x12; x07 ^= x16;
      x1e += x0b; x1a += x0f; ROL(x0b,11); ROL(x0f,11); x0b ^= x1a; x0f ^= x1e;
      x14 += x01; x10 += x05; ROL(x01,11); ROL(x05,11); x01 ^= x10; x05 ^= x14;
      x1c += x09; x18 += x0d; ROL(x09,11); ROL(x0d,11); x09 ^= x18; x0d ^= x1c;
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
    r = 10 * CUBEHASH_ROUNDS;
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
