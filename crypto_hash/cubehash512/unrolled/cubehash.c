/*
20100623
D. J. Bernstein
Public domain.

Implementation strategy suggested by Scott McMurray.
*/

#include "parameters.h"
#include "cubehash.h"

#define ROTATE(a,b) (((a) << (b)) | ((a) >> (32 - b)))

static void transform(hashState *state)
{
  int r;
  crypto_uint32 x00 = state->x[0];
  crypto_uint32 x01 = state->x[1];
  crypto_uint32 x02 = state->x[2];
  crypto_uint32 x03 = state->x[3];
  crypto_uint32 x04 = state->x[4];
  crypto_uint32 x05 = state->x[5];
  crypto_uint32 x06 = state->x[6];
  crypto_uint32 x07 = state->x[7];
  crypto_uint32 x08 = state->x[8];
  crypto_uint32 x09 = state->x[9];
  crypto_uint32 x0a = state->x[10];
  crypto_uint32 x0b = state->x[11];
  crypto_uint32 x0c = state->x[12];
  crypto_uint32 x0d = state->x[13];
  crypto_uint32 x0e = state->x[14];
  crypto_uint32 x0f = state->x[15];
  crypto_uint32 x10 = state->x[16];
  crypto_uint32 x11 = state->x[17];
  crypto_uint32 x12 = state->x[18];
  crypto_uint32 x13 = state->x[19];
  crypto_uint32 x14 = state->x[20];
  crypto_uint32 x15 = state->x[21];
  crypto_uint32 x16 = state->x[22];
  crypto_uint32 x17 = state->x[23];
  crypto_uint32 x18 = state->x[24];
  crypto_uint32 x19 = state->x[25];
  crypto_uint32 x1a = state->x[26];
  crypto_uint32 x1b = state->x[27];
  crypto_uint32 x1c = state->x[28];
  crypto_uint32 x1d = state->x[29];
  crypto_uint32 x1e = state->x[30];
  crypto_uint32 x1f = state->x[31];
  crypto_uint32 y0;
  crypto_uint32 y1;
  crypto_uint32 y2;
  crypto_uint32 y3;
  crypto_uint32 y4;
  crypto_uint32 y5;
  crypto_uint32 y6;
  crypto_uint32 y7;
  crypto_uint32 y8;
  crypto_uint32 y9;
  crypto_uint32 ya;
  crypto_uint32 yb;
  crypto_uint32 yc;
  crypto_uint32 yd;
  crypto_uint32 ye;
  crypto_uint32 yf;

  for (r = 0;r < CUBEHASH_ROUNDS;++r) {
    x10 += x00; x11 += x01; x12 += x02; x13 += x03;
    x14 += x04; x15 += x05; x16 += x06; x17 += x07;
    x18 += x08; x19 += x09; x1a += x0a; x1b += x0b;
    x1c += x0c; x1d += x0d; x1e += x0e; x1f += x0f;
    y8 = x00; y9 = x01; ya = x02; yb = x03;
    yc = x04; yd = x05; ye = x06; yf = x07;
    y0 = x08; y1 = x09; y2 = x0a; y3 = x0b;
    y4 = x0c; y5 = x0d; y6 = x0e; y7 = x0f;
    x00 = ROTATE(y0,7); x01 = ROTATE(y1,7); x02 = ROTATE(y2,7); x03 = ROTATE(y3,7);
    x04 = ROTATE(y4,7); x05 = ROTATE(y5,7); x06 = ROTATE(y6,7); x07 = ROTATE(y7,7);
    x08 = ROTATE(y8,7); x09 = ROTATE(y9,7); x0a = ROTATE(ya,7); x0b = ROTATE(yb,7);
    x0c = ROTATE(yc,7); x0d = ROTATE(yd,7); x0e = ROTATE(ye,7); x0f = ROTATE(yf,7);
    x00 ^= x10; x01 ^= x11; x02 ^= x12; x03 ^= x13;
    x04 ^= x14; x05 ^= x15; x06 ^= x16; x07 ^= x17;
    x08 ^= x18; x09 ^= x19; x0a ^= x1a; x0b ^= x1b;
    x0c ^= x1c; x0d ^= x1d; x0e ^= x1e; x0f ^= x1f;
    y2 = x10; y3 = x11; y0 = x12; y1 = x13;
    y6 = x14; y7 = x15; y4 = x16; y5 = x17;
    ya = x18; yb = x19; y8 = x1a; y9 = x1b;
    ye = x1c; yf = x1d; yc = x1e; yd = x1f;
    x10 = y0; x11 = y1; x12 = y2; x13 = y3;
    x14 = y4; x15 = y5; x16 = y6; x17 = y7;
    x18 = y8; x19 = y9; x1a = ya; x1b = yb;
    x1c = yc; x1d = yd; x1e = ye; x1f = yf;
    x10 += x00; x11 += x01; x12 += x02; x13 += x03;
    x14 += x04; x15 += x05; x16 += x06; x17 += x07;
    x18 += x08; x19 += x09; x1a += x0a; x1b += x0b;
    x1c += x0c; x1d += x0d; x1e += x0e; x1f += x0f;
    y4 = x00; y5 = x01; y6 = x02; y7 = x03;
    y0 = x04; y1 = x05; y2 = x06; y3 = x07;
    yc = x08; yd = x09; ye = x0a; yf = x0b;
    y8 = x0c; y9 = x0d; ya = x0e; yb = x0f;
    x00 = ROTATE(y0,11); x01 = ROTATE(y1,11); x02 = ROTATE(y2,11); x03 = ROTATE(y3,11);
    x04 = ROTATE(y4,11); x05 = ROTATE(y5,11); x06 = ROTATE(y6,11); x07 = ROTATE(y7,11);
    x08 = ROTATE(y8,11); x09 = ROTATE(y9,11); x0a = ROTATE(ya,11); x0b = ROTATE(yb,11);
    x0c = ROTATE(yc,11); x0d = ROTATE(yd,11); x0e = ROTATE(ye,11); x0f = ROTATE(yf,11);
    x00 ^= x10; x01 ^= x11; x02 ^= x12; x03 ^= x13;
    x04 ^= x14; x05 ^= x15; x06 ^= x16; x07 ^= x17;
    x08 ^= x18; x09 ^= x19; x0a ^= x1a; x0b ^= x1b;
    x0c ^= x1c; x0d ^= x1d; x0e ^= x1e; x0f ^= x1f;
    y1 = x10; y0 = x11; y3 = x12; y2 = x13;
    y5 = x14; y4 = x15; y7 = x16; y6 = x17;
    y9 = x18; y8 = x19; yb = x1a; ya = x1b;
    yd = x1c; yc = x1d; yf = x1e; ye = x1f;
    x10 = y0; x11 = y1; x12 = y2; x13 = y3;
    x14 = y4; x15 = y5; x16 = y6; x17 = y7;
    x18 = y8; x19 = y9; x1a = ya; x1b = yb;
    x1c = yc; x1d = yd; x1e = ye; x1f = yf;
  }

  state->x[0] = x00;
  state->x[1] = x01;
  state->x[2] = x02;
  state->x[3] = x03;
  state->x[4] = x04;
  state->x[5] = x05;
  state->x[6] = x06;
  state->x[7] = x07;
  state->x[8] = x08;
  state->x[9] = x09;
  state->x[10] = x0a;
  state->x[11] = x0b;
  state->x[12] = x0c;
  state->x[13] = x0d;
  state->x[14] = x0e;
  state->x[15] = x0f;
  state->x[16] = x10;
  state->x[17] = x11;
  state->x[18] = x12;
  state->x[19] = x13;
  state->x[20] = x14;
  state->x[21] = x15;
  state->x[22] = x16;
  state->x[23] = x17;
  state->x[24] = x18;
  state->x[25] = x19;
  state->x[26] = x1a;
  state->x[27] = x1b;
  state->x[28] = x1c;
  state->x[29] = x1d;
  state->x[30] = x1e;
  state->x[31] = x1f;
}

HashReturn Init(hashState *state, int hashbitlen)
{
  int i;
  int j;

  if (hashbitlen < 8) return BAD_HASHBITLEN;
  if (hashbitlen > 512) return BAD_HASHBITLEN;
  if (hashbitlen != 8 * (hashbitlen / 8)) return BAD_HASHBITLEN;

  state->hashbitlen = hashbitlen;
  for (i = 0;i < 32;++i) state->x[i] = 0;
  state->x[0] = hashbitlen / 8;
  state->x[1] = CUBEHASH_BLOCKBYTES;
  state->x[2] = CUBEHASH_ROUNDS;
  transform(state);
  state->pos = 0;
  return SUCCESS;
}

HashReturn Update(hashState *state, const BitSequence *data,
                  DataLength databitlen)
{
  /* caller promises us that previous data had integral number of bytes */
  /* so state->pos is a multiple of 8 */

  while (databitlen >= 8) {
    crypto_uint32 u = *data;
    u <<= 8 * ((state->pos / 8) % 4);
    state->x[state->pos / 32] ^= u;
    data += 1;
    databitlen -= 8;
    state->pos += 8;
    if (state->pos == 8 * CUBEHASH_BLOCKBYTES) {
      transform(state);
      state->pos = 0;
    }
  }
  if (databitlen > 0) {
    crypto_uint32 u = *data;
    u <<= 8 * ((state->pos / 8) % 4);
    state->x[state->pos / 32] ^= u;
    state->pos += databitlen;
  }
  return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval)
{
  int i;
  crypto_uint32 u;

  u = (128 >> (state->pos % 8));
  u <<= 8 * ((state->pos / 8) % 4);
  state->x[state->pos / 32] ^= u;
  transform(state);
  state->x[31] ^= 1;
  transform(state);
  transform(state);
  for (i = 0;i < state->hashbitlen / 8;++i) hashval[i] = state->x[i / 4] >> (8 * (i % 4));

  return SUCCESS;
}

HashReturn Hash(int hashbitlen, const BitSequence *data,
                DataLength databitlen, BitSequence *hashval)
{
  hashState state;
  if (Init(&state,hashbitlen) != SUCCESS) return BAD_HASHBITLEN;
  Update(&state,data,databitlen);
  return Final(&state,hashval);
}
