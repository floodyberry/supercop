/*
20090307
D. J. Bernstein
Public domain.
Note: This code assumes that CUBEHASH_BLOCKBYTES is 4.
*/

#include "parameters.h"
#include "cubehash.h"
#include "crypto_uint32.h"

static void transform(hashState *state,int r)
{
  __m128i x0;
  __m128i x1;
  __m128i x2;
  __m128i x3;
  __m128i x4;
  __m128i x5;
  __m128i x6;
  __m128i x7;
  __m128i y0;
  __m128i y1;
  __m128i y2;
  __m128i y3;

  x0 = state->x[0];
  x1 = state->x[1];
  x2 = state->x[2];
  x3 = state->x[3];
  x4 = state->x[4];
  x5 = state->x[5];
  x6 = state->x[6];
  x7 = state->x[7];

  for (;r > 0;--r) {
    x4 = _mm_add_epi32(x0,x4);
    x5 = _mm_add_epi32(x1,x5);
    x6 = _mm_add_epi32(x2,x6);
    x7 = _mm_add_epi32(x3,x7);
    y0 = x2;
    y1 = x3;
    y2 = x0;
    y3 = x1;
    x0 = _mm_xor_si128(_mm_slli_epi32(y0,7),_mm_srli_epi32(y0,25));
    x1 = _mm_xor_si128(_mm_slli_epi32(y1,7),_mm_srli_epi32(y1,25));
    x2 = _mm_xor_si128(_mm_slli_epi32(y2,7),_mm_srli_epi32(y2,25));
    x3 = _mm_xor_si128(_mm_slli_epi32(y3,7),_mm_srli_epi32(y3,25));
    x0 = _mm_xor_si128(x0,x4);
    x1 = _mm_xor_si128(x1,x5);
    x2 = _mm_xor_si128(x2,x6);
    x3 = _mm_xor_si128(x3,x7);
    x4 = _mm_shuffle_epi32(x4,0x4e);
    x5 = _mm_shuffle_epi32(x5,0x4e);
    x6 = _mm_shuffle_epi32(x6,0x4e);
    x7 = _mm_shuffle_epi32(x7,0x4e);
    x4 = _mm_add_epi32(x0,x4);
    x5 = _mm_add_epi32(x1,x5);
    x6 = _mm_add_epi32(x2,x6);
    x7 = _mm_add_epi32(x3,x7);
    y0 = x1;
    y1 = x0;
    y2 = x3;
    y3 = x2;
    x0 = _mm_xor_si128(_mm_slli_epi32(y0,11),_mm_srli_epi32(y0,21));
    x1 = _mm_xor_si128(_mm_slli_epi32(y1,11),_mm_srli_epi32(y1,21));
    x2 = _mm_xor_si128(_mm_slli_epi32(y2,11),_mm_srli_epi32(y2,21));
    x3 = _mm_xor_si128(_mm_slli_epi32(y3,11),_mm_srli_epi32(y3,21));
    x0 = _mm_xor_si128(x0,x4);
    x1 = _mm_xor_si128(x1,x5);
    x2 = _mm_xor_si128(x2,x6);
    x3 = _mm_xor_si128(x3,x7);
    x4 = _mm_shuffle_epi32(x4,0xb1);
    x5 = _mm_shuffle_epi32(x5,0xb1);
    x6 = _mm_shuffle_epi32(x6,0xb1);
    x7 = _mm_shuffle_epi32(x7,0xb1);
  }

  state->x[0] = x0;
  state->x[1] = x1;
  state->x[2] = x2;
  state->x[3] = x3;
  state->x[4] = x4;
  state->x[5] = x5;
  state->x[6] = x6;
  state->x[7] = x7;
}

HashReturn Init(hashState *state, int hashbitlen)
{
  int i;

  if (hashbitlen < 8) return BAD_HASHBITLEN;
  if (hashbitlen > 512) return BAD_HASHBITLEN;
  if (hashbitlen != 8 * (hashbitlen / 8)) return BAD_HASHBITLEN;

  state->hashbitlen = hashbitlen;
  state->pos = 0;
  
  if (hashbitlen == 512) {
    state->x[0] = _mm_set_epi32(0x6931ef47,0x2f3dfdd5,0xf4fc67b8,0x2613452b);
    state->x[1] = _mm_set_epi32(0xaf5625d7,0xd6dcf424,0xb2e49cab,0xe5231fa6);
    state->x[2] = _mm_set_epi32(0x080209ed,0xaa91f2a0,0xff5b4a7b,0x2bc8140e);
    state->x[3] = _mm_set_epi32(0xfc3ae686,0x42167a81,0x3222f234,0x468c150f);
    state->x[4] = _mm_set_epi32(0xc05e5f59,0x56717ca1,0x6ce48c09,0xdc8126a5);
    state->x[5] = _mm_set_epi32(0x77fcfdc3,0xa27fee7b,0x2681acbb,0x354aabec);
    state->x[6] = _mm_set_epi32(0x738fedee,0x404b4060,0xd39891fc,0x5da14b8e);
    state->x[7] = _mm_set_epi32(0xb6a09262,0x21f9d925,0x3200ac77,0x1076e54a);
  } else if (hashbitlen == 256) {
    state->x[0] = _mm_set_epi32(0x9bd5a90c,0xefc18e20,0x10d20142,0x92c7774b);
    state->x[1] = _mm_set_epi32(0x3f36b3dc,0xda8d3830,0xe59c4255,0xa6e234ec);
    state->x[2] = _mm_set_epi32(0x9fd3d639,0x864ac8dc,0x88ba255b,0x8d147371);
    state->x[3] = _mm_set_epi32(0x671da95e,0x84eafc51,0x0894513f,0x05288767);
    state->x[4] = _mm_set_epi32(0x39c4dc72,0x51e5825e,0x80bb1b69,0xddae28f5);
    state->x[5] = _mm_set_epi32(0x98d31605,0xfe34be65,0x071959d9,0x643818c3);
    state->x[6] = _mm_set_epi32(0x95638c58,0x0a8b2976,0x268e758d,0xd526014a);
    state->x[7] = _mm_set_epi32(0x8e11d45f,0x2c1d5956,0xcddb84b0,0xf63e19b2);
  } else {
    for (i = 0;i < 8;++i) state->x[i] = _mm_set_epi32(0,0,0,0);
    state->x[0] = _mm_set_epi32(0,CUBEHASH_ROUNDS,CUBEHASH_BLOCKBYTES,hashbitlen / 8);
    transform(state,10 * CUBEHASH_ROUNDS);
  }
  return SUCCESS;
}

HashReturn Update(hashState *state, const BitSequence *data,
                  DataLength databitlen)
{
  int r;
  __m128i x0;
  __m128i x1;
  __m128i x2;
  __m128i x3;
  __m128i x4;
  __m128i x5;
  __m128i x6;
  __m128i x7;
  __m128i y0;
  __m128i y1;
  __m128i y2;
  __m128i y3;

  while (databitlen >= 8 && state->pos != 0) {
    ((unsigned char *) state->x)[state->pos / 8] ^= *data;
    data += 1;
    databitlen -= 8;
    state->pos += 8;
    if (state->pos == 8 * CUBEHASH_BLOCKBYTES) {
      transform(state,CUBEHASH_ROUNDS);
      state->pos = 0;
    }
  }

  x0 = state->x[0];
  x1 = state->x[1];
  x2 = state->x[2];
  x3 = state->x[3];
  x4 = state->x[4];
  x5 = state->x[5];
  x6 = state->x[6];
  x7 = state->x[7];
    
  while (databitlen >= 8 * CUBEHASH_BLOCKBYTES) {
    x0 = _mm_xor_si128(x0,_mm_set_epi32(0,0,0,*(crypto_uint32 *) data));
    data += CUBEHASH_BLOCKBYTES;
    databitlen -= 8 * CUBEHASH_BLOCKBYTES;
    
    for (r = 0;r < CUBEHASH_ROUNDS;++r) {
      x4 = _mm_add_epi32(x0,x4);
      x5 = _mm_add_epi32(x1,x5);
      x6 = _mm_add_epi32(x2,x6);
      x7 = _mm_add_epi32(x3,x7);
      y0 = x2;
      y1 = x3;
      y2 = x0;
      y3 = x1;
      x0 = _mm_xor_si128(_mm_slli_epi32(y0,7),_mm_srli_epi32(y0,25));
      x1 = _mm_xor_si128(_mm_slli_epi32(y1,7),_mm_srli_epi32(y1,25));
      x2 = _mm_xor_si128(_mm_slli_epi32(y2,7),_mm_srli_epi32(y2,25));
      x3 = _mm_xor_si128(_mm_slli_epi32(y3,7),_mm_srli_epi32(y3,25));
      x0 = _mm_xor_si128(x0,x4);
      x1 = _mm_xor_si128(x1,x5);
      x2 = _mm_xor_si128(x2,x6);
      x3 = _mm_xor_si128(x3,x7);
      x4 = _mm_shuffle_epi32(x4,0x4e);
      x5 = _mm_shuffle_epi32(x5,0x4e);
      x6 = _mm_shuffle_epi32(x6,0x4e);
      x7 = _mm_shuffle_epi32(x7,0x4e);
      x4 = _mm_add_epi32(x0,x4);
      x5 = _mm_add_epi32(x1,x5);
      x6 = _mm_add_epi32(x2,x6);
      x7 = _mm_add_epi32(x3,x7);
      y0 = x1;
      y1 = x0;
      y2 = x3;
      y3 = x2;
      x0 = _mm_xor_si128(_mm_slli_epi32(y0,11),_mm_srli_epi32(y0,21));
      x1 = _mm_xor_si128(_mm_slli_epi32(y1,11),_mm_srli_epi32(y1,21));
      x2 = _mm_xor_si128(_mm_slli_epi32(y2,11),_mm_srli_epi32(y2,21));
      x3 = _mm_xor_si128(_mm_slli_epi32(y3,11),_mm_srli_epi32(y3,21));
      x0 = _mm_xor_si128(x0,x4);
      x1 = _mm_xor_si128(x1,x5);
      x2 = _mm_xor_si128(x2,x6);
      x3 = _mm_xor_si128(x3,x7);
      x4 = _mm_shuffle_epi32(x4,0xb1);
      x5 = _mm_shuffle_epi32(x5,0xb1);
      x6 = _mm_shuffle_epi32(x6,0xb1);
      x7 = _mm_shuffle_epi32(x7,0xb1);
    }
  }
  
  state->x[0] = x0;
  state->x[1] = x1;
  state->x[2] = x2;
  state->x[3] = x3;
  state->x[4] = x4;
  state->x[5] = x5;
  state->x[6] = x6;
  state->x[7] = x7;

  while (databitlen >= 8) {
    ((unsigned char *) state->x)[state->pos / 8] ^= *data;
    data += 1;
    databitlen -= 8;
    state->pos += 8;
    if (state->pos == 8 * CUBEHASH_BLOCKBYTES) {
      transform(state,CUBEHASH_ROUNDS);
      state->pos = 0;
    }
  }
  if (databitlen > 0) {
    ((unsigned char *) state->x)[state->pos / 8] ^= *data;
    state->pos += databitlen;
  }
  return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval)
{
  int i;

  ((unsigned char *) state->x)[state->pos / 8] ^= (128 >> (state->pos % 8));
  transform(state,CUBEHASH_ROUNDS);
  state->x[7] = _mm_xor_si128(state->x[7],_mm_set_epi32(1,0,0,0));
  transform(state,10 * CUBEHASH_ROUNDS);
  for (i = 0;i < state->hashbitlen / 8;++i)
    hashval[i] = ((unsigned char *) state->x)[i];

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
