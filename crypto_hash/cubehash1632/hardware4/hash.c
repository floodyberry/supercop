#define CUBEHASH_ROUNDS 16
#include "crypto_hash.h"
#include "crypto_uint16.h"
#include "crypto_uint32.h"

typedef crypto_uint16 crypto_uint1;
typedef crypto_uint16 crypto_uint11;
typedef crypto_uint32 crypto_uint17;

static void store_littleendian(unsigned char *out,crypto_uint16 u)
{
  out[0] = u;
  out[1] = u >> 8;
}

static crypto_uint16 load_littleendian(const unsigned char *in)
{
  crypto_uint16 result;
  result = (crypto_uint16) in[0];
  result ^= ((crypto_uint16) in[1]) << 8;
  return result;
}

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  crypto_uint16 newx00; crypto_uint16 x00 = 512 / 8;
  crypto_uint16 newx01; crypto_uint16 x01 = 32;
  crypto_uint16 newx02; crypto_uint16 x02 = CUBEHASH_ROUNDS;
  crypto_uint16 newx03; crypto_uint16 x03 = 0;
  crypto_uint16 newx04; crypto_uint16 x04 = 0;
  crypto_uint16 newx05; crypto_uint16 x05 = 0;
  crypto_uint16 newx06; crypto_uint16 x06 = 0;
  crypto_uint16 newx07; crypto_uint16 x07 = 0;
  crypto_uint16 newx08; crypto_uint16 x08 = 0;
  crypto_uint16 newx09; crypto_uint16 x09 = 0;
  crypto_uint16 newx0a; crypto_uint16 x0a = 0;
  crypto_uint16 newx0b; crypto_uint16 x0b = 0;
  crypto_uint16 newx0c; crypto_uint16 x0c = 0;
  crypto_uint16 newx0d; crypto_uint16 x0d = 0;
  crypto_uint16 newx0e; crypto_uint16 x0e = 0;
  crypto_uint16 newx0f; crypto_uint16 x0f = 0;
  crypto_uint16 newx10; crypto_uint16 x10 = 0;
  crypto_uint16 newx11; crypto_uint16 x11 = 0;
  crypto_uint16 newx12; crypto_uint16 x12 = 0;
  crypto_uint16 newx13; crypto_uint16 x13 = 0;
  crypto_uint16 newx14; crypto_uint16 x14 = 0;
  crypto_uint16 newx15; crypto_uint16 x15 = 0;
  crypto_uint16 newx16; crypto_uint16 x16 = 0;
  crypto_uint16 newx17; crypto_uint16 x17 = 0;
  crypto_uint16 newx18; crypto_uint16 x18 = 0;
  crypto_uint16 newx19; crypto_uint16 x19 = 0;
  crypto_uint16 newx1a; crypto_uint16 x1a = 0;
  crypto_uint16 newx1b; crypto_uint16 x1b = 0;
  crypto_uint16 newx1c; crypto_uint16 x1c = 0;
  crypto_uint16 newx1d; crypto_uint16 x1d = 0;
  crypto_uint16 newx1e; crypto_uint16 x1e = 0;
  crypto_uint16 newx1f; crypto_uint16 x1f = 0;
  crypto_uint16 newy00; crypto_uint16 y00 = 0;
  crypto_uint16 newy01; crypto_uint16 y01 = 0;
  crypto_uint16 newy02; crypto_uint16 y02 = 0;
  crypto_uint16 newy03; crypto_uint16 y03 = 0;
  crypto_uint16 newy04; crypto_uint16 y04 = 0;
  crypto_uint16 newy05; crypto_uint16 y05 = 0;
  crypto_uint16 newy06; crypto_uint16 y06 = 0;
  crypto_uint16 newy07; crypto_uint16 y07 = 0;
  crypto_uint16 newy08; crypto_uint16 y08 = 0;
  crypto_uint16 newy09; crypto_uint16 y09 = 0;
  crypto_uint16 newy0a; crypto_uint16 y0a = 0;
  crypto_uint16 newy0b; crypto_uint16 y0b = 0;
  crypto_uint16 newy0c; crypto_uint16 y0c = 0;
  crypto_uint16 newy0d; crypto_uint16 y0d = 0;
  crypto_uint16 newy0e; crypto_uint16 y0e = 0;
  crypto_uint16 newy0f; crypto_uint16 y0f = 0;
  crypto_uint16 newy10; crypto_uint16 y10 = 0;
  crypto_uint16 newy11; crypto_uint16 y11 = 0;
  crypto_uint16 newy12; crypto_uint16 y12 = 0;
  crypto_uint16 newy13; crypto_uint16 y13 = 0;
  crypto_uint16 newy14; crypto_uint16 y14 = 0;
  crypto_uint16 newy15; crypto_uint16 y15 = 0;
  crypto_uint16 newy16; crypto_uint16 y16 = 0;
  crypto_uint16 newy17; crypto_uint16 y17 = 0;
  crypto_uint16 newy18; crypto_uint16 y18 = 0;
  crypto_uint16 newy19; crypto_uint16 y19 = 0;
  crypto_uint16 newy1a; crypto_uint16 y1a = 0;
  crypto_uint16 newy1b; crypto_uint16 y1b = 0;
  crypto_uint16 newy1c; crypto_uint16 y1c = 0;
  crypto_uint16 newy1d; crypto_uint16 y1d = 0;
  crypto_uint16 newy1e; crypto_uint16 y1e = 0;
  crypto_uint16 newy1f; crypto_uint16 y1f = 0;
  crypto_uint1 newcarry0; crypto_uint1 carry0 = 0;
  crypto_uint1 newcarry1; crypto_uint1 carry1 = 0;
  crypto_uint1 newcarry2; crypto_uint1 carry2 = 0;
  crypto_uint1 newcarry3; crypto_uint1 carry3 = 0;
  crypto_uint1 newcarry4; crypto_uint1 carry4 = 0;
  crypto_uint1 newcarry5; crypto_uint1 carry5 = 0;
  crypto_uint1 newcarry6; crypto_uint1 carry6 = 0;
  crypto_uint1 newcarry7; crypto_uint1 carry7 = 0;
  crypto_uint1 newcarry8; crypto_uint1 carry8 = 0;
  crypto_uint1 newcarry9; crypto_uint1 carry9 = 0;
  crypto_uint1 newcarrya; crypto_uint1 carrya = 0;
  crypto_uint1 newcarryb; crypto_uint1 carryb = 0;
  crypto_uint1 newcarryc; crypto_uint1 carryc = 0;
  crypto_uint1 newcarryd; crypto_uint1 carryd = 0;
  crypto_uint1 newcarrye; crypto_uint1 carrye = 0;
  crypto_uint1 newcarryf; crypto_uint1 carryf = 0;
  crypto_uint11 newsave0; crypto_uint11 save0 = 0;
  crypto_uint11 newsave1; crypto_uint11 save1 = 0;
  crypto_uint11 newsave2; crypto_uint11 save2 = 0;
  crypto_uint11 newsave3; crypto_uint11 save3 = 0;
  crypto_uint11 newsave4; crypto_uint11 save4 = 0;
  crypto_uint11 newsave5; crypto_uint11 save5 = 0;
  crypto_uint11 newsave6; crypto_uint11 save6 = 0;
  crypto_uint11 newsave7; crypto_uint11 save7 = 0;
  crypto_uint11 newsave8; crypto_uint11 save8 = 0;
  crypto_uint11 newsave9; crypto_uint11 save9 = 0;
  crypto_uint11 newsavea; crypto_uint11 savea = 0;
  crypto_uint11 newsaveb; crypto_uint11 saveb = 0;
  crypto_uint11 newsavec; crypto_uint11 savec = 0;
  crypto_uint11 newsaved; crypto_uint11 saved = 0;
  crypto_uint11 newsavee; crypto_uint11 savee = 0;
  crypto_uint11 newsavef; crypto_uint11 savef = 0;
  crypto_uint17 q0;
  crypto_uint17 q1;
  crypto_uint17 q2;
  crypto_uint17 q3;
  crypto_uint17 q4;
  crypto_uint17 q5;
  crypto_uint17 q6;
  crypto_uint17 q7;
  crypto_uint17 q8;
  crypto_uint17 q9;
  crypto_uint17 qa;
  crypto_uint17 qb;
  crypto_uint17 qc;
  crypto_uint17 qd;
  crypto_uint17 qe;
  crypto_uint17 qf;
  crypto_uint16 s0;
  crypto_uint16 s1;
  crypto_uint16 s2;
  crypto_uint16 s3;
  crypto_uint16 s4;
  crypto_uint16 s5;
  crypto_uint16 s6;
  crypto_uint16 s7;
  crypto_uint16 s8;
  crypto_uint16 s9;
  crypto_uint16 sa;
  crypto_uint16 sb;
  crypto_uint16 sc;
  crypto_uint16 sd;
  crypto_uint16 se;
  crypto_uint16 sf;
  crypto_uint16 u0;
  crypto_uint16 u1;
  crypto_uint16 u2;
  crypto_uint16 u3;
  crypto_uint16 u4;
  crypto_uint16 u5;
  crypto_uint16 u6;
  crypto_uint16 u7;
  crypto_uint16 u8;
  crypto_uint16 u9;
  crypto_uint16 ua;
  crypto_uint16 ub;
  crypto_uint16 uc;
  crypto_uint16 ud;
  crypto_uint16 ue;
  crypto_uint16 uf;
  crypto_uint11 r0;
  crypto_uint11 r1;
  crypto_uint11 r2;
  crypto_uint11 r3;
  crypto_uint11 r4;
  crypto_uint11 r5;
  crypto_uint11 r6;
  crypto_uint11 r7;
  crypto_uint11 r8;
  crypto_uint11 r9;
  crypto_uint11 ra;
  crypto_uint11 rb;
  crypto_uint11 rc;
  crypto_uint11 rd;
  crypto_uint11 re;
  crypto_uint11 rf;
  int i;
  int r;
  int cycle;
  int bigcycle;
  int finalization = 0;
  unsigned char tmp[32];

  r = 10 * CUBEHASH_ROUNDS;
  goto morerounds;

  if (inlen < 32) goto inlenbelow32;

  mainloop:

    x00 ^= load_littleendian(in + 0);
    y00 ^= load_littleendian(in + 2);
    x01 ^= load_littleendian(in + 4);
    y01 ^= load_littleendian(in + 6);
    x02 ^= load_littleendian(in + 8);
    y02 ^= load_littleendian(in + 10);
    x03 ^= load_littleendian(in + 12);
    y03 ^= load_littleendian(in + 14);
    x04 ^= load_littleendian(in + 16);
    y04 ^= load_littleendian(in + 18);
    x05 ^= load_littleendian(in + 20);
    y05 ^= load_littleendian(in + 22);
    x06 ^= load_littleendian(in + 24);
    y06 ^= load_littleendian(in + 26);
    x07 ^= load_littleendian(in + 28);
    y07 ^= load_littleendian(in + 30);
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;--r) {
      for (bigcycle = 0;bigcycle < 2;++bigcycle) {
        for (cycle = 1;cycle >= 0;--cycle) {
	  newsave0 = x00 >> 5;
	  newsave1 = x01 >> 5;
	  newsave2 = x02 >> 5;
	  newsave3 = x03 >> 5;
	  newsave4 = x04 >> 5;
	  newsave5 = x05 >> 5;
	  newsave6 = x06 >> 5;
	  newsave7 = x07 >> 5;
	  newsave8 = x08 >> 5;
	  newsave9 = x09 >> 5;
	  newsavea = x0a >> 5;
	  newsaveb = x0b >> 5;
	  newsavec = x0c >> 5;
	  newsaved = x0d >> 5;
	  newsavee = x0e >> 5;
	  newsavef = x0f >> 5;
          q0 = x10 + (crypto_uint17) x00 + carry0;
          q1 = x11 + (crypto_uint17) x01 + carry1;
          q2 = x12 + (crypto_uint17) x02 + carry2;
          q3 = x13 + (crypto_uint17) x03 + carry3;
          q4 = x14 + (crypto_uint17) x04 + carry4;
          q5 = x15 + (crypto_uint17) x05 + carry5;
          q6 = x16 + (crypto_uint17) x06 + carry6;
          q7 = x17 + (crypto_uint17) x07 + carry7;
          q8 = x18 + (crypto_uint17) x08 + carry8;
          q9 = x19 + (crypto_uint17) x09 + carry9;
          qa = x1a + (crypto_uint17) x0a + carrya;
          qb = x1b + (crypto_uint17) x0b + carryb;
          qc = x1c + (crypto_uint17) x0c + carryc;
          qd = x1d + (crypto_uint17) x0d + carryd;
          qe = x1e + (crypto_uint17) x0e + carrye;
          qf = x1f + (crypto_uint17) x0f + carryf;
	  s0 = q0;
	  s1 = q1;
	  s2 = q2;
	  s3 = q3;
	  s4 = q4;
	  s5 = q5;
	  s6 = q6;
	  s7 = q7;
	  s8 = q8;
	  s9 = q9;
	  sa = qa;
	  sb = qb;
	  sc = qc;
	  sd = qd;
	  se = qe;
	  sf = qf;
          newcarry0 = cycle & (q0 >> 16);
          newcarry1 = cycle & (q1 >> 16);
          newcarry2 = cycle & (q2 >> 16);
          newcarry3 = cycle & (q3 >> 16);
          newcarry4 = cycle & (q4 >> 16);
          newcarry5 = cycle & (q5 >> 16);
          newcarry6 = cycle & (q6 >> 16);
          newcarry7 = cycle & (q7 >> 16);
          newcarry8 = cycle & (q8 >> 16);
          newcarry9 = cycle & (q9 >> 16);
          newcarrya = cycle & (qa >> 16);
          newcarryb = cycle & (qb >> 16);
          newcarryc = cycle & (qc >> 16);
          newcarryd = cycle & (qd >> 16);
          newcarrye = cycle & (qe >> 16);
          newcarryf = cycle & (qf >> 16);
	  r0 = cycle ? (y00 >> 5) : save0;
	  r1 = cycle ? (y01 >> 5) : save1;
	  r2 = cycle ? (y02 >> 5) : save2;
	  r3 = cycle ? (y03 >> 5) : save3;
	  r4 = cycle ? (y04 >> 5) : save4;
	  r5 = cycle ? (y05 >> 5) : save5;
	  r6 = cycle ? (y06 >> 5) : save6;
	  r7 = cycle ? (y07 >> 5) : save7;
	  r8 = cycle ? (y08 >> 5) : save8;
	  r9 = cycle ? (y09 >> 5) : save9;
	  ra = cycle ? (y0a >> 5) : savea;
	  rb = cycle ? (y0b >> 5) : saveb;
	  rc = cycle ? (y0c >> 5) : savec;
	  rd = cycle ? (y0d >> 5) : saved;
	  re = cycle ? (y0e >> 5) : savee;
	  rf = cycle ? (y0f >> 5) : savef;
          u0 = bigcycle ? ((x04 << 11) | (r4)) : ((x08 << 7) | (r8 >> 4));
          u1 = bigcycle ? ((x05 << 11) | (r5)) : ((x09 << 7) | (r9 >> 4));
          u2 = bigcycle ? ((x06 << 11) | (r6)) : ((x0a << 7) | (ra >> 4));
          u3 = bigcycle ? ((x07 << 11) | (r7)) : ((x0b << 7) | (rb >> 4));
          u4 = bigcycle ? ((x00 << 11) | (r0)) : ((x0c << 7) | (rc >> 4));
          u5 = bigcycle ? ((x01 << 11) | (r1)) : ((x0d << 7) | (rd >> 4));
          u6 = bigcycle ? ((x02 << 11) | (r2)) : ((x0e << 7) | (re >> 4));
          u7 = bigcycle ? ((x03 << 11) | (r3)) : ((x0f << 7) | (rf >> 4));
          u8 = bigcycle ? ((x0c << 11) | (rc)) : ((x00 << 7) | (r0 >> 4));
          u9 = bigcycle ? ((x0d << 11) | (rd)) : ((x01 << 7) | (r1 >> 4));
          ua = bigcycle ? ((x0e << 11) | (re)) : ((x02 << 7) | (r2 >> 4));
          ub = bigcycle ? ((x0f << 11) | (rf)) : ((x03 << 7) | (r3 >> 4));
          uc = bigcycle ? ((x08 << 11) | (r8)) : ((x04 << 7) | (r4 >> 4));
          ud = bigcycle ? ((x09 << 11) | (r9)) : ((x05 << 7) | (r5 >> 4));
          ue = bigcycle ? ((x0a << 11) | (ra)) : ((x06 << 7) | (r6 >> 4));
          uf = bigcycle ? ((x0b << 11) | (rb)) : ((x07 << 7) | (r7 >> 4));

          newx00 = y00; newx01 = y01; newx02 = y02; newx03 = y03;
          newx04 = y04; newx05 = y05; newx06 = y06; newx07 = y07;
          newx08 = y08; newx09 = y09; newx0a = y0a; newx0b = y0b;
          newx0c = y0c; newx0d = y0d; newx0e = y0e; newx0f = y0f;
          newx10 = y10; newx11 = y11; newx12 = y12; newx13 = y13;
          newx14 = y14; newx15 = y15; newx16 = y16; newx17 = y17;
          newx18 = y18; newx19 = y19; newx1a = y1a; newx1b = y1b;
          newx1c = y1c; newx1d = y1d; newx1e = y1e; newx1f = y1f;
          newy00 = s0 ^ u0; newy01 = s1 ^ u1; newy02 = s2 ^ u2; newy03 = s3 ^ u3;
          newy04 = s4 ^ u4; newy05 = s5 ^ u5; newy06 = s6 ^ u6; newy07 = s7 ^ u7;
          newy08 = s8 ^ u8; newy09 = s9 ^ u9; newy0a = sa ^ ua; newy0b = sb ^ ub;
          newy0c = sc ^ uc; newy0d = sd ^ ud; newy0e = se ^ ue; newy0f = sf ^ uf;
          newy10 = bigcycle ? s1 : s2;
          newy11 = bigcycle ? s0 : s3;
          newy12 = bigcycle ? s3 : s0;
          newy13 = bigcycle ? s2 : s1;
          newy14 = bigcycle ? s5 : s6;
          newy15 = bigcycle ? s4 : s7;
          newy16 = bigcycle ? s7 : s4;
          newy17 = bigcycle ? s6 : s5;
          newy18 = bigcycle ? s9 : sa;
          newy19 = bigcycle ? s8 : sb;
          newy1a = bigcycle ? sb : s8;
          newy1b = bigcycle ? sa : s9;
          newy1c = bigcycle ? sd : se;
          newy1d = bigcycle ? sc : sf;
          newy1e = bigcycle ? sf : sc;
          newy1f = bigcycle ? se : sd;
  
          save0 = newsave0; save1 = newsave1; save2 = newsave2; save3 = newsave3;
          save4 = newsave4; save5 = newsave5; save6 = newsave6; save7 = newsave7;
          save8 = newsave8; save9 = newsave9; savea = newsavea; saveb = newsaveb;
          savec = newsavec; saved = newsaved; savee = newsavee; savef = newsavef;
          carry0 = newcarry0; carry1 = newcarry1; carry2 = newcarry2; carry3 = newcarry3;
          carry4 = newcarry4; carry5 = newcarry5; carry6 = newcarry6; carry7 = newcarry7;
          carry8 = newcarry8; carry9 = newcarry9; carrya = newcarrya; carryb = newcarryb;
          carryc = newcarryc; carryd = newcarryd; carrye = newcarrye; carryf = newcarryf;
          x00 = newx00; x01 = newx01; x02 = newx02; x03 = newx03;
          x04 = newx04; x05 = newx05; x06 = newx06; x07 = newx07;
          x08 = newx08; x09 = newx09; x0a = newx0a; x0b = newx0b;
          x0c = newx0c; x0d = newx0d; x0e = newx0e; x0f = newx0f;
          x10 = newx10; x11 = newx11; x12 = newx12; x13 = newx13;
          x14 = newx14; x15 = newx15; x16 = newx16; x17 = newx17;
          x18 = newx18; x19 = newx19; x1a = newx1a; x1b = newx1b;
          x1c = newx1c; x1d = newx1d; x1e = newx1e; x1f = newx1f;
          y00 = newy00; y01 = newy01; y02 = newy02; y03 = newy03;
          y04 = newy04; y05 = newy05; y06 = newy06; y07 = newy07;
          y08 = newy08; y09 = newy09; y0a = newy0a; y0b = newy0b;
          y0c = newy0c; y0d = newy0d; y0e = newy0e; y0f = newy0f;
          y10 = newy10; y11 = newy11; y12 = newy12; y13 = newy13;
          y14 = newy14; y15 = newy15; y16 = newy16; y17 = newy17;
          y18 = newy18; y19 = newy19; y1a = newy1a; y1b = newy1b;
          y1c = newy1c; y1d = newy1d; y1e = newy1e; y1f = newy1f;
        }
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
    r = 10 * CUBEHASH_ROUNDS;
    finalization = 2;
    goto morerounds;
  }

  store_littleendian(out + 0,x00);
  store_littleendian(out + 2,y00);
  store_littleendian(out + 4,x01);
  store_littleendian(out + 6,y01);
  store_littleendian(out + 8,x02);
  store_littleendian(out + 10,y02);
  store_littleendian(out + 12,x03);
  store_littleendian(out + 14,y03);
  store_littleendian(out + 16,x04);
  store_littleendian(out + 18,y04);
  store_littleendian(out + 20,x05);
  store_littleendian(out + 22,y05);
  store_littleendian(out + 24,x06);
  store_littleendian(out + 26,y06);
  store_littleendian(out + 28,x07);
  store_littleendian(out + 30,y07);
  store_littleendian(out + 32,x08);
  store_littleendian(out + 34,y08);
  store_littleendian(out + 36,x09);
  store_littleendian(out + 38,y09);
  store_littleendian(out + 40,x0a);
  store_littleendian(out + 42,y0a);
  store_littleendian(out + 44,x0b);
  store_littleendian(out + 46,y0b);
  store_littleendian(out + 48,x0c);
  store_littleendian(out + 50,y0c);
  store_littleendian(out + 52,x0d);
  store_littleendian(out + 54,y0d);
  store_littleendian(out + 56,x0e);
  store_littleendian(out + 58,y0e);
  store_littleendian(out + 60,x0f);
  store_littleendian(out + 62,y0f);

  return 0;
}
