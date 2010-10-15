/*
20100726
D. J. Bernstein
Public domain.

Starts from unrolled, unrolls again by a factor of 2, and eliminates moves.
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

  for (r = CUBEHASH_ROUNDS / 2;r > 0;--r) {
    x10 += x00; x11 += x01; x12 += x02; x13 += x03;
    x14 += x04; x15 += x05; x16 += x06; x17 += x07;
    x18 += x08; x19 += x09; x1a += x0a; x1b += x0b;
    x1c += x0c; x1d += x0d; x1e += x0e; x1f += x0f;
    x00 = ROTATE(x00,7); x01 = ROTATE(x01,7); x02 = ROTATE(x02,7); x03 = ROTATE(x03,7);
    x04 = ROTATE(x04,7); x05 = ROTATE(x05,7); x06 = ROTATE(x06,7); x07 = ROTATE(x07,7);
    x08 = ROTATE(x08,7); x09 = ROTATE(x09,7); x0a = ROTATE(x0a,7); x0b = ROTATE(x0b,7);
    x0c = ROTATE(x0c,7); x0d = ROTATE(x0d,7); x0e = ROTATE(x0e,7); x0f = ROTATE(x0f,7);
    x08 ^= x10; x09 ^= x11; x0a ^= x12; x0b ^= x13;
    x0c ^= x14; x0d ^= x15; x0e ^= x16; x0f ^= x17;
    x00 ^= x18; x01 ^= x19; x02 ^= x1a; x03 ^= x1b;
    x04 ^= x1c; x05 ^= x1d; x06 ^= x1e; x07 ^= x1f;
    x12 += x08; x13 += x09; x10 += x0a; x11 += x0b;
    x16 += x0c; x17 += x0d; x14 += x0e; x15 += x0f;
    x1a += x00; x1b += x01; x18 += x02; x19 += x03;
    x1e += x04; x1f += x05; x1c += x06; x1d += x07;
    x00 = ROTATE(x00,11); x01 = ROTATE(x01,11); x02 = ROTATE(x02,11); x03 = ROTATE(x03,11);
    x04 = ROTATE(x04,11); x05 = ROTATE(x05,11); x06 = ROTATE(x06,11); x07 = ROTATE(x07,11);
    x08 = ROTATE(x08,11); x09 = ROTATE(x09,11); x0a = ROTATE(x0a,11); x0b = ROTATE(x0b,11);
    x0c = ROTATE(x0c,11); x0d = ROTATE(x0d,11); x0e = ROTATE(x0e,11); x0f = ROTATE(x0f,11);
    x0c ^= x12; x0d ^= x13; x0e ^= x10; x0f ^= x11;
    x08 ^= x16; x09 ^= x17; x0a ^= x14; x0b ^= x15;
    x04 ^= x1a; x05 ^= x1b; x06 ^= x18; x07 ^= x19;
    x00 ^= x1e; x01 ^= x1f; x02 ^= x1c; x03 ^= x1d;
    x13 += x0c; x12 += x0d; x11 += x0e; x10 += x0f;
    x17 += x08; x16 += x09; x15 += x0a; x14 += x0b;
    x1b += x04; x1a += x05; x19 += x06; x18 += x07;
    x1f += x00; x1e += x01; x1d += x02; x1c += x03;
    x00 = ROTATE(x00,7); x01 = ROTATE(x01,7); x02 = ROTATE(x02,7); x03 = ROTATE(x03,7);
    x04 = ROTATE(x04,7); x05 = ROTATE(x05,7); x06 = ROTATE(x06,7); x07 = ROTATE(x07,7);
    x08 = ROTATE(x08,7); x09 = ROTATE(x09,7); x0a = ROTATE(x0a,7); x0b = ROTATE(x0b,7);
    x0c = ROTATE(x0c,7); x0d = ROTATE(x0d,7); x0e = ROTATE(x0e,7); x0f = ROTATE(x0f,7);
    x0c ^= x1b; x0d ^= x1a; x0e ^= x19; x0f ^= x18;
    x08 ^= x1f; x09 ^= x1e; x0a ^= x1d; x0b ^= x1c;
    x04 ^= x13; x05 ^= x12; x06 ^= x11; x07 ^= x10;
    x00 ^= x17; x01 ^= x16; x02 ^= x15; x03 ^= x14;
    x1b += x0e; x1a += x0f; x19 += x0c; x18 += x0d;
    x1f += x0a; x1e += x0b; x1d += x08; x1c += x09;
    x13 += x06; x12 += x07; x11 += x04; x10 += x05;
    x17 += x02; x16 += x03; x15 += x00; x14 += x01;
    x00 = ROTATE(x00,11); x01 = ROTATE(x01,11); x02 = ROTATE(x02,11); x03 = ROTATE(x03,11);
    x04 = ROTATE(x04,11); x05 = ROTATE(x05,11); x06 = ROTATE(x06,11); x07 = ROTATE(x07,11);
    x08 = ROTATE(x08,11); x09 = ROTATE(x09,11); x0a = ROTATE(x0a,11); x0b = ROTATE(x0b,11);
    x0c = ROTATE(x0c,11); x0d = ROTATE(x0d,11); x0e = ROTATE(x0e,11); x0f = ROTATE(x0f,11);
    x02 ^= x13; x03 ^= x12; x00 ^= x11; x01 ^= x10;
    x06 ^= x17; x07 ^= x16; x04 ^= x15; x05 ^= x14;
    x0a ^= x1b; x0b ^= x1a; x08 ^= x19; x09 ^= x18;
    x0e ^= x1f; x0f ^= x1e; x0c ^= x1d; x0d ^= x1c;
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
