#define CUBEHASH_ROUNDS 16
#include "crypto_hash.h"
#include "crypto_uint8.h"
#include "crypto_uint16.h"
#include "crypto_uint32.h"

typedef crypto_uint8 crypto_uint1;
typedef crypto_uint16 crypto_uint9;
typedef crypto_uint16 crypto_uint11;

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  crypto_uint8 newx00[4]; crypto_uint8 x00[4] = {512 / 8,0,0,0};
  crypto_uint8 newx01[4]; crypto_uint8 x01[4] = {32,0,0,0};
  crypto_uint8 newx02[4]; crypto_uint8 x02[4] = {CUBEHASH_ROUNDS,0,0,0};
  crypto_uint8 newx03[4]; crypto_uint8 x03[4] = {0,0,0,0};
  crypto_uint8 newx04[4]; crypto_uint8 x04[4] = {0,0,0,0};
  crypto_uint8 newx05[4]; crypto_uint8 x05[4] = {0,0,0,0};
  crypto_uint8 newx06[4]; crypto_uint8 x06[4] = {0,0,0,0};
  crypto_uint8 newx07[4]; crypto_uint8 x07[4] = {0,0,0,0};
  crypto_uint8 newx08[4]; crypto_uint8 x08[4] = {0,0,0,0};
  crypto_uint8 newx09[4]; crypto_uint8 x09[4] = {0,0,0,0};
  crypto_uint8 newx0a[4]; crypto_uint8 x0a[4] = {0,0,0,0};
  crypto_uint8 newx0b[4]; crypto_uint8 x0b[4] = {0,0,0,0};
  crypto_uint8 newx0c[4]; crypto_uint8 x0c[4] = {0,0,0,0};
  crypto_uint8 newx0d[4]; crypto_uint8 x0d[4] = {0,0,0,0};
  crypto_uint8 newx0e[4]; crypto_uint8 x0e[4] = {0,0,0,0};
  crypto_uint8 newx0f[4]; crypto_uint8 x0f[4] = {0,0,0,0};
  crypto_uint8 newx10[4]; crypto_uint8 x10[4] = {0,0,0,0};
  crypto_uint8 newx11[4]; crypto_uint8 x11[4] = {0,0,0,0};
  crypto_uint8 newx12[4]; crypto_uint8 x12[4] = {0,0,0,0};
  crypto_uint8 newx13[4]; crypto_uint8 x13[4] = {0,0,0,0};
  crypto_uint8 newx14[4]; crypto_uint8 x14[4] = {0,0,0,0};
  crypto_uint8 newx15[4]; crypto_uint8 x15[4] = {0,0,0,0};
  crypto_uint8 newx16[4]; crypto_uint8 x16[4] = {0,0,0,0};
  crypto_uint8 newx17[4]; crypto_uint8 x17[4] = {0,0,0,0};
  crypto_uint8 newx18[4]; crypto_uint8 x18[4] = {0,0,0,0};
  crypto_uint8 newx19[4]; crypto_uint8 x19[4] = {0,0,0,0};
  crypto_uint8 newx1a[4]; crypto_uint8 x1a[4] = {0,0,0,0};
  crypto_uint8 newx1b[4]; crypto_uint8 x1b[4] = {0,0,0,0};
  crypto_uint8 newx1c[4]; crypto_uint8 x1c[4] = {0,0,0,0};
  crypto_uint8 newx1d[4]; crypto_uint8 x1d[4] = {0,0,0,0};
  crypto_uint8 newx1e[4]; crypto_uint8 x1e[4] = {0,0,0,0};
  crypto_uint8 newx1f[4]; crypto_uint8 x1f[4] = {0,0,0,0};
  crypto_uint11 newq0; crypto_uint11 q0;
  crypto_uint11 newq1; crypto_uint11 q1;
  crypto_uint11 newq2; crypto_uint11 q2;
  crypto_uint11 newq3; crypto_uint11 q3;
  crypto_uint11 newq4; crypto_uint11 q4;
  crypto_uint11 newq5; crypto_uint11 q5;
  crypto_uint11 newq6; crypto_uint11 q6;
  crypto_uint11 newq7; crypto_uint11 q7;
  crypto_uint11 newq8; crypto_uint11 q8;
  crypto_uint11 newq9; crypto_uint11 q9;
  crypto_uint11 newqa; crypto_uint11 qa;
  crypto_uint11 newqb; crypto_uint11 qb;
  crypto_uint11 newqc; crypto_uint11 qc;
  crypto_uint11 newqd; crypto_uint11 qd;
  crypto_uint11 newqe; crypto_uint11 qe;
  crypto_uint11 newqf; crypto_uint11 qf;
  crypto_uint1 newcarry0; crypto_uint1 carry0;
  crypto_uint1 newcarry1; crypto_uint1 carry1;
  crypto_uint1 newcarry2; crypto_uint1 carry2;
  crypto_uint1 newcarry3; crypto_uint1 carry3;
  crypto_uint1 newcarry4; crypto_uint1 carry4;
  crypto_uint1 newcarry5; crypto_uint1 carry5;
  crypto_uint1 newcarry6; crypto_uint1 carry6;
  crypto_uint1 newcarry7; crypto_uint1 carry7;
  crypto_uint1 newcarry8; crypto_uint1 carry8;
  crypto_uint1 newcarry9; crypto_uint1 carry9;
  crypto_uint1 newcarrya; crypto_uint1 carrya;
  crypto_uint1 newcarryb; crypto_uint1 carryb;
  crypto_uint1 newcarryc; crypto_uint1 carryc;
  crypto_uint1 newcarryd; crypto_uint1 carryd;
  crypto_uint1 newcarrye; crypto_uint1 carrye;
  crypto_uint1 newcarryf; crypto_uint1 carryf;
  crypto_uint9 sum0;
  crypto_uint9 sum1;
  crypto_uint9 sum2;
  crypto_uint9 sum3;
  crypto_uint9 sum4;
  crypto_uint9 sum5;
  crypto_uint9 sum6;
  crypto_uint9 sum7;
  crypto_uint9 sum8;
  crypto_uint9 sum9;
  crypto_uint9 suma;
  crypto_uint9 sumb;
  crypto_uint9 sumc;
  crypto_uint9 sumd;
  crypto_uint9 sume;
  crypto_uint9 sumf;
  crypto_uint8 s0; crypto_uint8 t0;
  crypto_uint8 s1; crypto_uint8 t1;
  crypto_uint8 s2; crypto_uint8 t2;
  crypto_uint8 s3; crypto_uint8 t3;
  crypto_uint8 s4; crypto_uint8 t4;
  crypto_uint8 s5; crypto_uint8 t5;
  crypto_uint8 s6; crypto_uint8 t6;
  crypto_uint8 s7; crypto_uint8 t7;
  crypto_uint8 s8; crypto_uint8 t8;
  crypto_uint8 s9; crypto_uint8 t9;
  crypto_uint8 sa; crypto_uint8 ta;
  crypto_uint8 sb; crypto_uint8 tb;
  crypto_uint8 sc; crypto_uint8 tc;
  crypto_uint8 sd; crypto_uint8 td;
  crypto_uint8 se; crypto_uint8 te;
  crypto_uint8 sf; crypto_uint8 tf;
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

    for (i = 0;i < 4;++i) {
      x00[i] ^= in[i];
      x01[i] ^= in[i + 4];
      x02[i] ^= in[i + 8];
      x03[i] ^= in[i + 12];
      x04[i] ^= in[i + 16];
      x05[i] ^= in[i + 20];
      x06[i] ^= in[i + 24];
      x07[i] ^= in[i + 28];
    }
    in += 32;
    inlen -= 32;
    r = CUBEHASH_ROUNDS;

    morerounds:

    for (;r > 0;--r) {
      for (bigcycle = 0;bigcycle < 2;++bigcycle) {
	carry0 = 0;
	carry1 = 0;
	carry2 = 0;
	carry3 = 0;
	carry4 = 0;
	carry5 = 0;
	carry6 = 0;
	carry7 = 0;
	carry8 = 0;
	carry9 = 0;
	carrya = 0;
	carryb = 0;
	carryc = 0;
	carryd = 0;
	carrye = 0;
	carryf = 0;
        q0 = (x00[2] >> 5) | ((crypto_uint11) x00[3] << 3);
        q1 = (x01[2] >> 5) | ((crypto_uint11) x01[3] << 3);
        q2 = (x02[2] >> 5) | ((crypto_uint11) x02[3] << 3);
        q3 = (x03[2] >> 5) | ((crypto_uint11) x03[3] << 3);
        q4 = (x04[2] >> 5) | ((crypto_uint11) x04[3] << 3);
        q5 = (x05[2] >> 5) | ((crypto_uint11) x05[3] << 3);
        q6 = (x06[2] >> 5) | ((crypto_uint11) x06[3] << 3);
        q7 = (x07[2] >> 5) | ((crypto_uint11) x07[3] << 3);
        q8 = (x08[2] >> 5) | ((crypto_uint11) x08[3] << 3);
        q9 = (x09[2] >> 5) | ((crypto_uint11) x09[3] << 3);
        qa = (x0a[2] >> 5) | ((crypto_uint11) x0a[3] << 3);
        qb = (x0b[2] >> 5) | ((crypto_uint11) x0b[3] << 3);
        qc = (x0c[2] >> 5) | ((crypto_uint11) x0c[3] << 3);
        qd = (x0d[2] >> 5) | ((crypto_uint11) x0d[3] << 3);
        qe = (x0e[2] >> 5) | ((crypto_uint11) x0e[3] << 3);
        qf = (x0f[2] >> 5) | ((crypto_uint11) x0f[3] << 3);
        for (cycle = 0;cycle < 4;++cycle) {
	  sum0 = x10[0] + (crypto_uint9) x00[0] + carry0;
          sum1 = x11[0] + (crypto_uint9) x01[0] + carry1;
          sum2 = x12[0] + (crypto_uint9) x02[0] + carry2;
          sum3 = x13[0] + (crypto_uint9) x03[0] + carry3;
	  sum4 = x14[0] + (crypto_uint9) x04[0] + carry4;
          sum5 = x15[0] + (crypto_uint9) x05[0] + carry5;
          sum6 = x16[0] + (crypto_uint9) x06[0] + carry6;
          sum7 = x17[0] + (crypto_uint9) x07[0] + carry7;
	  sum8 = x18[0] + (crypto_uint9) x08[0] + carry8;
          sum9 = x19[0] + (crypto_uint9) x09[0] + carry9;
          suma = x1a[0] + (crypto_uint9) x0a[0] + carrya;
          sumb = x1b[0] + (crypto_uint9) x0b[0] + carryb;
	  sumc = x1c[0] + (crypto_uint9) x0c[0] + carryc;
          sumd = x1d[0] + (crypto_uint9) x0d[0] + carryd;
          sume = x1e[0] + (crypto_uint9) x0e[0] + carrye;
          sumf = x1f[0] + (crypto_uint9) x0f[0] + carryf;
	  s0 = sum0;
	  s1 = sum1;
	  s2 = sum2;
	  s3 = sum3;
	  s4 = sum4;
	  s5 = sum5;
	  s6 = sum6;
	  s7 = sum7;
	  s8 = sum8;
	  s9 = sum9;
	  sa = suma;
	  sb = sumb;
	  sc = sumc;
	  sd = sumd;
	  se = sume;
	  sf = sumf;
	  newcarry0 = sum0 >> 8;
	  newcarry1 = sum1 >> 8;
	  newcarry2 = sum2 >> 8;
	  newcarry3 = sum3 >> 8;
	  newcarry4 = sum4 >> 8;
	  newcarry5 = sum5 >> 8;
	  newcarry6 = sum6 >> 8;
	  newcarry7 = sum7 >> 8;
	  newcarry8 = sum8 >> 8;
	  newcarry9 = sum9 >> 8;
	  newcarrya = suma >> 8;
	  newcarryb = sumb >> 8;
	  newcarryc = sumc >> 8;
	  newcarryd = sumd >> 8;
	  newcarrye = sume >> 8;
	  newcarryf = sumf >> 8;
	  t0 = bigcycle ? q4 : ((x08[0] << 7) | (q8 >> 4));
	  t1 = bigcycle ? q5 : ((x09[0] << 7) | (q9 >> 4));
	  t2 = bigcycle ? q6 : ((x0a[0] << 7) | (qa >> 4));
	  t3 = bigcycle ? q7 : ((x0b[0] << 7) | (qb >> 4));
	  t4 = bigcycle ? q0 : ((x0c[0] << 7) | (qc >> 4));
	  t5 = bigcycle ? q1 : ((x0d[0] << 7) | (qd >> 4));
	  t6 = bigcycle ? q2 : ((x0e[0] << 7) | (qe >> 4));
	  t7 = bigcycle ? q3 : ((x0f[0] << 7) | (qf >> 4));
	  t8 = bigcycle ? qc : ((x00[0] << 7) | (q0 >> 4));
	  t9 = bigcycle ? qd : ((x01[0] << 7) | (q1 >> 4));
	  ta = bigcycle ? qe : ((x02[0] << 7) | (q2 >> 4));
	  tb = bigcycle ? qf : ((x03[0] << 7) | (q3 >> 4));
	  tc = bigcycle ? q8 : ((x04[0] << 7) | (q4 >> 4));
	  td = bigcycle ? q9 : ((x05[0] << 7) | (q5 >> 4));
	  te = bigcycle ? qa : ((x06[0] << 7) | (q6 >> 4));
	  tf = bigcycle ? qb : ((x07[0] << 7) | (q7 >> 4));
	  newq0 = (q0 >> 8) | ((crypto_uint11) x00[0] << 3);
	  newq1 = (q1 >> 8) | ((crypto_uint11) x01[0] << 3);
	  newq2 = (q2 >> 8) | ((crypto_uint11) x02[0] << 3);
	  newq3 = (q3 >> 8) | ((crypto_uint11) x03[0] << 3);
	  newq4 = (q4 >> 8) | ((crypto_uint11) x04[0] << 3);
	  newq5 = (q5 >> 8) | ((crypto_uint11) x05[0] << 3);
	  newq6 = (q6 >> 8) | ((crypto_uint11) x06[0] << 3);
	  newq7 = (q7 >> 8) | ((crypto_uint11) x07[0] << 3);
	  newq8 = (q8 >> 8) | ((crypto_uint11) x08[0] << 3);
	  newq9 = (q9 >> 8) | ((crypto_uint11) x09[0] << 3);
	  newqa = (qa >> 8) | ((crypto_uint11) x0a[0] << 3);
	  newqb = (qb >> 8) | ((crypto_uint11) x0b[0] << 3);
	  newqc = (qc >> 8) | ((crypto_uint11) x0c[0] << 3);
	  newqd = (qd >> 8) | ((crypto_uint11) x0d[0] << 3);
	  newqe = (qe >> 8) | ((crypto_uint11) x0e[0] << 3);
	  newqf = (qf >> 8) | ((crypto_uint11) x0f[0] << 3);
	  newx00[3] = s0 ^ t0;
	  newx01[3] = s1 ^ t1;
	  newx02[3] = s2 ^ t2;
	  newx03[3] = s3 ^ t3;
	  newx04[3] = s4 ^ t4;
          newx05[3] = s5 ^ t5;
          newx06[3] = s6 ^ t6;
          newx07[3] = s7 ^ t7;
	  newx08[3] = s8 ^ t8;
          newx09[3] = s9 ^ t9;
          newx0a[3] = sa ^ ta;
          newx0b[3] = sb ^ tb;
	  newx0c[3] = sc ^ tc;
          newx0d[3] = sd ^ td;
          newx0e[3] = se ^ te;
          newx0f[3] = sf ^ tf;
	  newx10[3] = bigcycle ? s1 : s2;
	  newx11[3] = bigcycle ? s0 : s3;
	  newx12[3] = bigcycle ? s3 : s0;
	  newx13[3] = bigcycle ? s2 : s1;
	  newx14[3] = bigcycle ? s5 : s6;
	  newx15[3] = bigcycle ? s4 : s7;
	  newx16[3] = bigcycle ? s7 : s4;
	  newx17[3] = bigcycle ? s6 : s5;
	  newx18[3] = bigcycle ? s9 : sa;
	  newx19[3] = bigcycle ? s8 : sb;
	  newx1a[3] = bigcycle ? sb : s8;
	  newx1b[3] = bigcycle ? sa : s9;
	  newx1c[3] = bigcycle ? sd : se;
	  newx1d[3] = bigcycle ? sc : sf;
	  newx1e[3] = bigcycle ? sf : sc;
	  newx1f[3] = bigcycle ? se : sd;
	  for (i = 1;i < 4;++i) { /* shift registers */
	    newx00[i - 1] = x00[i];
	    newx01[i - 1] = x01[i];
	    newx02[i - 1] = x02[i];
	    newx03[i - 1] = x03[i];
	    newx04[i - 1] = x04[i];
	    newx05[i - 1] = x05[i];
	    newx06[i - 1] = x06[i];
	    newx07[i - 1] = x07[i];
	    newx08[i - 1] = x08[i];
	    newx09[i - 1] = x09[i];
	    newx0a[i - 1] = x0a[i];
	    newx0b[i - 1] = x0b[i];
	    newx0c[i - 1] = x0c[i];
	    newx0d[i - 1] = x0d[i];
	    newx0e[i - 1] = x0e[i];
	    newx0f[i - 1] = x0f[i];
	    newx10[i - 1] = x10[i];
	    newx11[i - 1] = x11[i];
	    newx12[i - 1] = x12[i];
	    newx13[i - 1] = x13[i];
	    newx14[i - 1] = x14[i];
	    newx15[i - 1] = x15[i];
	    newx16[i - 1] = x16[i];
	    newx17[i - 1] = x17[i];
	    newx18[i - 1] = x18[i];
	    newx19[i - 1] = x19[i];
	    newx1a[i - 1] = x1a[i];
	    newx1b[i - 1] = x1b[i];
	    newx1c[i - 1] = x1c[i];
	    newx1d[i - 1] = x1d[i];
	    newx1e[i - 1] = x1e[i];
	    newx1f[i - 1] = x1f[i];
	  }

	  q0 = newq0;
	  q1 = newq1;
	  q2 = newq2;
	  q3 = newq3;
	  q4 = newq4;
	  q5 = newq5;
	  q6 = newq6;
	  q7 = newq7;
	  q8 = newq8;
	  q9 = newq9;
	  qa = newqa;
	  qb = newqb;
	  qc = newqc;
	  qd = newqd;
	  qe = newqe;
	  qf = newqf;
	  carry0 = newcarry0;
	  carry1 = newcarry1;
	  carry2 = newcarry2;
	  carry3 = newcarry3;
	  carry4 = newcarry4;
	  carry5 = newcarry5;
	  carry6 = newcarry6;
	  carry7 = newcarry7;
	  carry8 = newcarry8;
	  carry9 = newcarry9;
	  carrya = newcarrya;
	  carryb = newcarryb;
	  carryc = newcarryc;
	  carryd = newcarryd;
	  carrye = newcarrye;
	  carryf = newcarryf;
	  for (i = 0;i < 4;++i) {
            x00[i] = newx00[i]; x01[i] = newx01[i]; x02[i] = newx02[i]; x03[i] = newx03[i];
            x04[i] = newx04[i]; x05[i] = newx05[i]; x06[i] = newx06[i]; x07[i] = newx07[i];
            x08[i] = newx08[i]; x09[i] = newx09[i]; x0a[i] = newx0a[i]; x0b[i] = newx0b[i];
            x0c[i] = newx0c[i]; x0d[i] = newx0d[i]; x0e[i] = newx0e[i]; x0f[i] = newx0f[i];
            x10[i] = newx10[i]; x11[i] = newx11[i]; x12[i] = newx12[i]; x13[i] = newx13[i];
            x14[i] = newx14[i]; x15[i] = newx15[i]; x16[i] = newx16[i]; x17[i] = newx17[i];
            x18[i] = newx18[i]; x19[i] = newx19[i]; x1a[i] = newx1a[i]; x1b[i] = newx1b[i];
            x1c[i] = newx1c[i]; x1d[i] = newx1d[i]; x1e[i] = newx1e[i]; x1f[i] = newx1f[i];
	  }
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
    x1f[0] ^= 1;
    r = 10 * CUBEHASH_ROUNDS;
    finalization = 2;
    goto morerounds;
  }

  for (i = 0;i < 4;++i) {
    out[i] = x00[i];
    out[i + 4] = x01[i];
    out[i + 8] = x02[i];
    out[i + 12] = x03[i];
    out[i + 16] = x04[i];
    out[i + 20] = x05[i];
    out[i + 24] = x06[i];
    out[i + 28] = x07[i];
    out[i + 32] = x08[i];
    out[i + 36] = x09[i];
    out[i + 40] = x0a[i];
    out[i + 44] = x0b[i];
    out[i + 48] = x0c[i];
    out[i + 52] = x0d[i];
    out[i + 56] = x0e[i];
    out[i + 60] = x0f[i];
  }

  return 0;
}
