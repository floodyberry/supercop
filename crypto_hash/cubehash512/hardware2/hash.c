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
  crypto_uint32 newx00; crypto_uint32 x00 = 512 / 8;
  crypto_uint32 newx01; crypto_uint32 x01 = 32;
  crypto_uint32 newx02; crypto_uint32 x02 = CUBEHASH_ROUNDS;
  crypto_uint32 newx03; crypto_uint32 x03 = 0;
  crypto_uint32 newx04; crypto_uint32 x04 = 0;
  crypto_uint32 newx05; crypto_uint32 x05 = 0;
  crypto_uint32 newx06; crypto_uint32 x06 = 0;
  crypto_uint32 newx07; crypto_uint32 x07 = 0;
  crypto_uint32 newx08; crypto_uint32 x08 = 0;
  crypto_uint32 newx09; crypto_uint32 x09 = 0;
  crypto_uint32 newx0a; crypto_uint32 x0a = 0;
  crypto_uint32 newx0b; crypto_uint32 x0b = 0;
  crypto_uint32 newx0c; crypto_uint32 x0c = 0;
  crypto_uint32 newx0d; crypto_uint32 x0d = 0;
  crypto_uint32 newx0e; crypto_uint32 x0e = 0;
  crypto_uint32 newx0f; crypto_uint32 x0f = 0;
  crypto_uint32 newx10; crypto_uint32 x10 = 0;
  crypto_uint32 newx11; crypto_uint32 x11 = 0;
  crypto_uint32 newx12; crypto_uint32 x12 = 0;
  crypto_uint32 newx13; crypto_uint32 x13 = 0;
  crypto_uint32 newx14; crypto_uint32 x14 = 0;
  crypto_uint32 newx15; crypto_uint32 x15 = 0;
  crypto_uint32 newx16; crypto_uint32 x16 = 0;
  crypto_uint32 newx17; crypto_uint32 x17 = 0;
  crypto_uint32 newx18; crypto_uint32 x18 = 0;
  crypto_uint32 newx19; crypto_uint32 x19 = 0;
  crypto_uint32 newx1a; crypto_uint32 x1a = 0;
  crypto_uint32 newx1b; crypto_uint32 x1b = 0;
  crypto_uint32 newx1c; crypto_uint32 x1c = 0;
  crypto_uint32 newx1d; crypto_uint32 x1d = 0;
  crypto_uint32 newx1e; crypto_uint32 x1e = 0;
  crypto_uint32 newx1f; crypto_uint32 x1f = 0;
  crypto_uint32 s0; crypto_uint32 t0;
  crypto_uint32 s1; crypto_uint32 t1;
  crypto_uint32 s2; crypto_uint32 t2;
  crypto_uint32 s3; crypto_uint32 t3;
  crypto_uint32 s4; crypto_uint32 t4;
  crypto_uint32 s5; crypto_uint32 t5;
  crypto_uint32 s6; crypto_uint32 t6;
  crypto_uint32 s7; crypto_uint32 t7;
  crypto_uint32 s8; crypto_uint32 t8;
  crypto_uint32 s9; crypto_uint32 t9;
  crypto_uint32 sa; crypto_uint32 ta;
  crypto_uint32 sb; crypto_uint32 tb;
  crypto_uint32 sc; crypto_uint32 tc;
  crypto_uint32 sd; crypto_uint32 td;
  crypto_uint32 se; crypto_uint32 te;
  crypto_uint32 sf; crypto_uint32 tf;
  int i;
  int r;
  int cycle;
  int finalization = 0;
  unsigned char tmp[32];

  r = 16;
  goto morerounds;

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

    for (;r > 0;--r) {
      for (cycle = 0;cycle < 2;++cycle) {
	s0 = x10 + x00; s1 = x11 + x01; s2 = x12 + x02; s3 = x13 + x03;
	s4 = x14 + x04; s5 = x15 + x05; s6 = x16 + x06; s7 = x17 + x07;
	s8 = x18 + x08; s9 = x19 + x09; sa = x1a + x0a; sb = x1b + x0b;
	sc = x1c + x0c; sd = x1d + x0d; se = x1e + x0e; sf = x1f + x0f;
	t0 = cycle ? ROL(x04,11) : ROL(x08,7);
	t1 = cycle ? ROL(x05,11) : ROL(x09,7);
	t2 = cycle ? ROL(x06,11) : ROL(x0a,7);
	t3 = cycle ? ROL(x07,11) : ROL(x0b,7);
	t4 = cycle ? ROL(x00,11) : ROL(x0c,7);
	t5 = cycle ? ROL(x01,11) : ROL(x0d,7);
	t6 = cycle ? ROL(x02,11) : ROL(x0e,7);
	t7 = cycle ? ROL(x03,11) : ROL(x0f,7);
	t8 = cycle ? ROL(x0c,11) : ROL(x00,7);
	t9 = cycle ? ROL(x0d,11) : ROL(x01,7);
	ta = cycle ? ROL(x0e,11) : ROL(x02,7);
	tb = cycle ? ROL(x0f,11) : ROL(x03,7);
	tc = cycle ? ROL(x08,11) : ROL(x04,7);
	td = cycle ? ROL(x09,11) : ROL(x05,7);
	te = cycle ? ROL(x0a,11) : ROL(x06,7);
	tf = cycle ? ROL(x0b,11) : ROL(x07,7);
	newx00 = s0 ^ t0; newx01 = s1 ^ t1; newx02 = s2 ^ t2; newx03 = s3 ^ t3;
	newx04 = s4 ^ t4; newx05 = s5 ^ t5; newx06 = s6 ^ t6; newx07 = s7 ^ t7;
	newx08 = s8 ^ t8; newx09 = s9 ^ t9; newx0a = sa ^ ta; newx0b = sb ^ tb;
	newx0c = sc ^ tc; newx0d = sd ^ td; newx0e = se ^ te; newx0f = sf ^ tf;
	newx10 = cycle ? s1 : s2;
	newx11 = cycle ? s0 : s3;
	newx12 = cycle ? s3 : s0;
	newx13 = cycle ? s2 : s1;
	newx14 = cycle ? s5 : s6;
	newx15 = cycle ? s4 : s7;
	newx16 = cycle ? s7 : s4;
	newx17 = cycle ? s6 : s5;
	newx18 = cycle ? s9 : sa;
	newx19 = cycle ? s8 : sb;
	newx1a = cycle ? sb : s8;
	newx1b = cycle ? sa : s9;
	newx1c = cycle ? sd : se;
	newx1d = cycle ? sc : sf;
	newx1e = cycle ? sf : sc;
	newx1f = cycle ? se : sd;
        x00 = newx00; x01 = newx01; x02 = newx02; x03 = newx03;
        x04 = newx04; x05 = newx05; x06 = newx06; x07 = newx07;
        x08 = newx08; x09 = newx09; x0a = newx0a; x0b = newx0b;
        x0c = newx0c; x0d = newx0d; x0e = newx0e; x0f = newx0f;
        x10 = newx10; x11 = newx11; x12 = newx12; x13 = newx13;
        x14 = newx14; x15 = newx15; x16 = newx16; x17 = newx17;
        x18 = newx18; x19 = newx19; x1a = newx1a; x1b = newx1b;
        x1c = newx1c; x1d = newx1d; x1e = newx1e; x1f = newx1f;
      }
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
