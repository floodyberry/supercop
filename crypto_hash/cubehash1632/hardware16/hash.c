#define CUBEHASH_ROUNDS 16
#include "crypto_hash.h"
#include "crypto_uint8.h"
#include "crypto_uint16.h"
#include "crypto_uint32.h"

typedef crypto_uint8 crypto_uint1;
typedef crypto_uint8 crypto_uint4;
typedef crypto_uint8 crypto_uint5;
typedef crypto_uint16 crypto_uint11;

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  crypto_uint4 newx00[8]; crypto_uint4 x00[8] = {(512 / 8) % 16,(512 / 8) / 16,0,0,0,0,0,0};
  crypto_uint4 newx01[8]; crypto_uint4 x01[8] = {32 % 16,32 / 16,0,0,0,0,0,0};
  crypto_uint4 newx02[8]; crypto_uint4 x02[8] = {CUBEHASH_ROUNDS % 16,CUBEHASH_ROUNDS / 16,0,0,0,0,0,0};
  crypto_uint4 newx03[8]; crypto_uint4 x03[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx04[8]; crypto_uint4 x04[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx05[8]; crypto_uint4 x05[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx06[8]; crypto_uint4 x06[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx07[8]; crypto_uint4 x07[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx08[8]; crypto_uint4 x08[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx09[8]; crypto_uint4 x09[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx0a[8]; crypto_uint4 x0a[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx0b[8]; crypto_uint4 x0b[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx0c[8]; crypto_uint4 x0c[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx0d[8]; crypto_uint4 x0d[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx0e[8]; crypto_uint4 x0e[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx0f[8]; crypto_uint4 x0f[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx10[8]; crypto_uint4 x10[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx11[8]; crypto_uint4 x11[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx12[8]; crypto_uint4 x12[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx13[8]; crypto_uint4 x13[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx14[8]; crypto_uint4 x14[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx15[8]; crypto_uint4 x15[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx16[8]; crypto_uint4 x16[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx17[8]; crypto_uint4 x17[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx18[8]; crypto_uint4 x18[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx19[8]; crypto_uint4 x19[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx1a[8]; crypto_uint4 x1a[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx1b[8]; crypto_uint4 x1b[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx1c[8]; crypto_uint4 x1c[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx1d[8]; crypto_uint4 x1d[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx1e[8]; crypto_uint4 x1e[8] = {0,0,0,0,0,0,0,0};
  crypto_uint4 newx1f[8]; crypto_uint4 x1f[8] = {0,0,0,0,0,0,0,0};
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
  crypto_uint5 sum0;
  crypto_uint5 sum1;
  crypto_uint5 sum2;
  crypto_uint5 sum3;
  crypto_uint5 sum4;
  crypto_uint5 sum5;
  crypto_uint5 sum6;
  crypto_uint5 sum7;
  crypto_uint5 sum8;
  crypto_uint5 sum9;
  crypto_uint5 suma;
  crypto_uint5 sumb;
  crypto_uint5 sumc;
  crypto_uint5 sumd;
  crypto_uint5 sume;
  crypto_uint5 sumf;
  crypto_uint4 s0; crypto_uint4 t0;
  crypto_uint4 s1; crypto_uint4 t1;
  crypto_uint4 s2; crypto_uint4 t2;
  crypto_uint4 s3; crypto_uint4 t3;
  crypto_uint4 s4; crypto_uint4 t4;
  crypto_uint4 s5; crypto_uint4 t5;
  crypto_uint4 s6; crypto_uint4 t6;
  crypto_uint4 s7; crypto_uint4 t7;
  crypto_uint4 s8; crypto_uint4 t8;
  crypto_uint4 s9; crypto_uint4 t9;
  crypto_uint4 sa; crypto_uint4 ta;
  crypto_uint4 sb; crypto_uint4 tb;
  crypto_uint4 sc; crypto_uint4 tc;
  crypto_uint4 sd; crypto_uint4 td;
  crypto_uint4 se; crypto_uint4 te;
  crypto_uint4 sf; crypto_uint4 tf;
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
      x00[2*i] ^= in[i] & 15;
      x01[2*i] ^= in[i + 4] & 15;
      x02[2*i] ^= in[i + 8] & 15;
      x03[2*i] ^= in[i + 12] & 15;
      x04[2*i] ^= in[i + 16] & 15;
      x05[2*i] ^= in[i + 20] & 15;
      x06[2*i] ^= in[i + 24] & 15;
      x07[2*i] ^= in[i + 28] & 15;
      x00[2*i+1] ^= in[i] >> 4;
      x01[2*i+1] ^= in[i + 4] >> 4;
      x02[2*i+1] ^= in[i + 8] >> 4;
      x03[2*i+1] ^= in[i + 12] >> 4;
      x04[2*i+1] ^= in[i + 16] >> 4;
      x05[2*i+1] ^= in[i + 20] >> 4;
      x06[2*i+1] ^= in[i + 24] >> 4;
      x07[2*i+1] ^= in[i + 28] >> 4;
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
        q0 = (x00[5] >> 1) | ((crypto_uint11) x00[6] << 3) | ((crypto_uint11) x00[7] << 7);
        q1 = (x01[5] >> 1) | ((crypto_uint11) x01[6] << 3) | ((crypto_uint11) x01[7] << 7);
        q2 = (x02[5] >> 1) | ((crypto_uint11) x02[6] << 3) | ((crypto_uint11) x02[7] << 7);
        q3 = (x03[5] >> 1) | ((crypto_uint11) x03[6] << 3) | ((crypto_uint11) x03[7] << 7);
        q4 = (x04[5] >> 1) | ((crypto_uint11) x04[6] << 3) | ((crypto_uint11) x04[7] << 7);
        q5 = (x05[5] >> 1) | ((crypto_uint11) x05[6] << 3) | ((crypto_uint11) x05[7] << 7);
        q6 = (x06[5] >> 1) | ((crypto_uint11) x06[6] << 3) | ((crypto_uint11) x06[7] << 7);
        q7 = (x07[5] >> 1) | ((crypto_uint11) x07[6] << 3) | ((crypto_uint11) x07[7] << 7);
        q8 = (x08[5] >> 1) | ((crypto_uint11) x08[6] << 3) | ((crypto_uint11) x08[7] << 7);
        q9 = (x09[5] >> 1) | ((crypto_uint11) x09[6] << 3) | ((crypto_uint11) x09[7] << 7);
        qa = (x0a[5] >> 1) | ((crypto_uint11) x0a[6] << 3) | ((crypto_uint11) x0a[7] << 7);
        qb = (x0b[5] >> 1) | ((crypto_uint11) x0b[6] << 3) | ((crypto_uint11) x0b[7] << 7);
        qc = (x0c[5] >> 1) | ((crypto_uint11) x0c[6] << 3) | ((crypto_uint11) x0c[7] << 7);
        qd = (x0d[5] >> 1) | ((crypto_uint11) x0d[6] << 3) | ((crypto_uint11) x0d[7] << 7);
        qe = (x0e[5] >> 1) | ((crypto_uint11) x0e[6] << 3) | ((crypto_uint11) x0e[7] << 7);
        qf = (x0f[5] >> 1) | ((crypto_uint11) x0f[6] << 3) | ((crypto_uint11) x0f[7] << 7);
        for (cycle = 0;cycle < 8;++cycle) {
	  sum0 = x10[0] + (crypto_uint5) x00[0] + carry0;
          sum1 = x11[0] + (crypto_uint5) x01[0] + carry1;
          sum2 = x12[0] + (crypto_uint5) x02[0] + carry2;
          sum3 = x13[0] + (crypto_uint5) x03[0] + carry3;
	  sum4 = x14[0] + (crypto_uint5) x04[0] + carry4;
          sum5 = x15[0] + (crypto_uint5) x05[0] + carry5;
          sum6 = x16[0] + (crypto_uint5) x06[0] + carry6;
          sum7 = x17[0] + (crypto_uint5) x07[0] + carry7;
	  sum8 = x18[0] + (crypto_uint5) x08[0] + carry8;
          sum9 = x19[0] + (crypto_uint5) x09[0] + carry9;
          suma = x1a[0] + (crypto_uint5) x0a[0] + carrya;
          sumb = x1b[0] + (crypto_uint5) x0b[0] + carryb;
	  sumc = x1c[0] + (crypto_uint5) x0c[0] + carryc;
          sumd = x1d[0] + (crypto_uint5) x0d[0] + carryd;
          sume = x1e[0] + (crypto_uint5) x0e[0] + carrye;
          sumf = x1f[0] + (crypto_uint5) x0f[0] + carryf;
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
	  newcarry0 = sum0 >> 4;
	  newcarry1 = sum1 >> 4;
	  newcarry2 = sum2 >> 4;
	  newcarry3 = sum3 >> 4;
	  newcarry4 = sum4 >> 4;
	  newcarry5 = sum5 >> 4;
	  newcarry6 = sum6 >> 4;
	  newcarry7 = sum7 >> 4;
	  newcarry8 = sum8 >> 4;
	  newcarry9 = sum9 >> 4;
	  newcarrya = suma >> 4;
	  newcarryb = sumb >> 4;
	  newcarryc = sumc >> 4;
	  newcarryd = sumd >> 4;
	  newcarrye = sume >> 4;
	  newcarryf = sumf >> 4;
	  t0 = bigcycle ? q4 : (q8 >> 4);
	  t1 = bigcycle ? q5 : (q9 >> 4);
	  t2 = bigcycle ? q6 : (qa >> 4);
	  t3 = bigcycle ? q7 : (qb >> 4);
	  t4 = bigcycle ? q0 : (qc >> 4);
	  t5 = bigcycle ? q1 : (qd >> 4);
	  t6 = bigcycle ? q2 : (qe >> 4);
	  t7 = bigcycle ? q3 : (qf >> 4);
	  t8 = bigcycle ? qc : (q0 >> 4);
	  t9 = bigcycle ? qd : (q1 >> 4);
	  ta = bigcycle ? qe : (q2 >> 4);
	  tb = bigcycle ? qf : (q3 >> 4);
	  tc = bigcycle ? q8 : (q4 >> 4);
	  td = bigcycle ? q9 : (q5 >> 4);
	  te = bigcycle ? qa : (q6 >> 4);
	  tf = bigcycle ? qb : (q7 >> 4);
	  newq0 = (q0 >> 4) | ((crypto_uint11) x00[0] << 7);
	  newq1 = (q1 >> 4) | ((crypto_uint11) x01[0] << 7);
	  newq2 = (q2 >> 4) | ((crypto_uint11) x02[0] << 7);
	  newq3 = (q3 >> 4) | ((crypto_uint11) x03[0] << 7);
	  newq4 = (q4 >> 4) | ((crypto_uint11) x04[0] << 7);
	  newq5 = (q5 >> 4) | ((crypto_uint11) x05[0] << 7);
	  newq6 = (q6 >> 4) | ((crypto_uint11) x06[0] << 7);
	  newq7 = (q7 >> 4) | ((crypto_uint11) x07[0] << 7);
	  newq8 = (q8 >> 4) | ((crypto_uint11) x08[0] << 7);
	  newq9 = (q9 >> 4) | ((crypto_uint11) x09[0] << 7);
	  newqa = (qa >> 4) | ((crypto_uint11) x0a[0] << 7);
	  newqb = (qb >> 4) | ((crypto_uint11) x0b[0] << 7);
	  newqc = (qc >> 4) | ((crypto_uint11) x0c[0] << 7);
	  newqd = (qd >> 4) | ((crypto_uint11) x0d[0] << 7);
	  newqe = (qe >> 4) | ((crypto_uint11) x0e[0] << 7);
	  newqf = (qf >> 4) | ((crypto_uint11) x0f[0] << 7);
	  newx00[7] = s0 ^ t0;
	  newx01[7] = s1 ^ t1;
	  newx02[7] = s2 ^ t2;
	  newx03[7] = s3 ^ t3;
	  newx04[7] = s4 ^ t4;
          newx05[7] = s5 ^ t5;
          newx06[7] = s6 ^ t6;
          newx07[7] = s7 ^ t7;
	  newx08[7] = s8 ^ t8;
          newx09[7] = s9 ^ t9;
          newx0a[7] = sa ^ ta;
          newx0b[7] = sb ^ tb;
	  newx0c[7] = sc ^ tc;
          newx0d[7] = sd ^ td;
          newx0e[7] = se ^ te;
          newx0f[7] = sf ^ tf;
	  newx10[7] = bigcycle ? s1 : s2;
	  newx11[7] = bigcycle ? s0 : s3;
	  newx12[7] = bigcycle ? s3 : s0;
	  newx13[7] = bigcycle ? s2 : s1;
	  newx14[7] = bigcycle ? s5 : s6;
	  newx15[7] = bigcycle ? s4 : s7;
	  newx16[7] = bigcycle ? s7 : s4;
	  newx17[7] = bigcycle ? s6 : s5;
	  newx18[7] = bigcycle ? s9 : sa;
	  newx19[7] = bigcycle ? s8 : sb;
	  newx1a[7] = bigcycle ? sb : s8;
	  newx1b[7] = bigcycle ? sa : s9;
	  newx1c[7] = bigcycle ? sd : se;
	  newx1d[7] = bigcycle ? sc : sf;
	  newx1e[7] = bigcycle ? sf : sc;
	  newx1f[7] = bigcycle ? se : sd;
	  for (i = 1;i < 8;++i) { /* shift registers */
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
	  for (i = 0;i < 8;++i) {
            x00[i] = 15&newx00[i]; x01[i] = 15&newx01[i]; x02[i] = 15&newx02[i]; x03[i] = 15&newx03[i];
            x04[i] = 15&newx04[i]; x05[i] = 15&newx05[i]; x06[i] = 15&newx06[i]; x07[i] = 15&newx07[i];
            x08[i] = 15&newx08[i]; x09[i] = 15&newx09[i]; x0a[i] = 15&newx0a[i]; x0b[i] = 15&newx0b[i];
            x0c[i] = 15&newx0c[i]; x0d[i] = 15&newx0d[i]; x0e[i] = 15&newx0e[i]; x0f[i] = 15&newx0f[i];
            x10[i] = 15&newx10[i]; x11[i] = 15&newx11[i]; x12[i] = 15&newx12[i]; x13[i] = 15&newx13[i];
            x14[i] = 15&newx14[i]; x15[i] = 15&newx15[i]; x16[i] = 15&newx16[i]; x17[i] = 15&newx17[i];
            x18[i] = 15&newx18[i]; x19[i] = 15&newx19[i]; x1a[i] = 15&newx1a[i]; x1b[i] = 15&newx1b[i];
            x1c[i] = 15&newx1c[i]; x1d[i] = 15&newx1d[i]; x1e[i] = 15&newx1e[i]; x1f[i] = 15&newx1f[i];
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
    out[i     ] = x00[2*i] + (x00[2*i+1] << 4);
    out[i +  4] = x01[2*i] + (x01[2*i+1] << 4);
    out[i +  8] = x02[2*i] + (x02[2*i+1] << 4);
    out[i + 12] = x03[2*i] + (x03[2*i+1] << 4);
    out[i + 16] = x04[2*i] + (x04[2*i+1] << 4);
    out[i + 20] = x05[2*i] + (x05[2*i+1] << 4);
    out[i + 24] = x06[2*i] + (x06[2*i+1] << 4);
    out[i + 28] = x07[2*i] + (x07[2*i+1] << 4);
    out[i + 32] = x08[2*i] + (x08[2*i+1] << 4);
    out[i + 36] = x09[2*i] + (x09[2*i+1] << 4);
    out[i + 40] = x0a[2*i] + (x0a[2*i+1] << 4);
    out[i + 44] = x0b[2*i] + (x0b[2*i+1] << 4);
    out[i + 48] = x0c[2*i] + (x0c[2*i+1] << 4);
    out[i + 52] = x0d[2*i] + (x0d[2*i+1] << 4);
    out[i + 56] = x0e[2*i] + (x0e[2*i+1] << 4);
    out[i + 60] = x0f[2*i] + (x0f[2*i+1] << 4);
  }

  return 0;
}
