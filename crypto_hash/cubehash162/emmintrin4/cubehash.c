/*
20090702
D. J. Bernstein
Public domain.
Note: This code assumes that CUBEHASH_BLOCKBYTES is 2.
*/

#include "parameters.h"
#include "cubehash.h"
#include "crypto_uint32.h"
#include "crypto_uint16.h"

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
    state->x[0] = _mm_set_epi32(0x0636ff65,0xe425b169,0x5e42fed8,0xa69300f4);
    state->x[1] = _mm_set_epi32(0x76bafe8c,0x3a0548c8,0xbbc9878b,0x945a950a);
    state->x[2] = _mm_set_epi32(0xab8e50b7,0x58ae39b5,0x1a935de0,0xc0b94068);
    state->x[3] = _mm_set_epi32(0xb6aeeb17,0xf015c87f,0x096a8cd4,0x04a918c4);
    state->x[4] = _mm_set_epi32(0x11a81ee3,0x6c8b69f8,0x891deb37,0xb5d0eca2);
    state->x[5] = _mm_set_epi32(0xd05da460,0x8b622996,0xf87b77d2,0xfe6d86ba);
    state->x[6] = _mm_set_epi32(0x79d446be,0x9b8dfbf8,0x068aa5ec,0xfb6f1976);
    state->x[7] = _mm_set_epi32(0x51f1b9d5,0xa4dc1cc1,0xa127e308,0x118f293c);
  } else if (hashbitlen == 256) {
    state->x[0] = _mm_set_epi32(0xe7233544,0x7616a2dd,0xd52fc30c,0x4c51b878);
    state->x[1] = _mm_set_epi32(0x3de662e3,0xc5293121,0x820ce6c7,0xb2130f46);
    state->x[2] = _mm_set_epi32(0xb0fd4ee2,0x7445428b,0x743e4499,0xe168c0e5);
    state->x[3] = _mm_set_epi32(0x8eef0e00,0x494e65a5,0xd1d6f073,0x6a6b2907);
    state->x[4] = _mm_set_epi32(0xc7cc41eb,0x34372ed7,0x7904bc0c,0xb5572780);
    state->x[5] = _mm_set_epi32(0xcf66e9ca,0x9913c1e9,0x74c99773,0xcc5cd67c);
    state->x[6] = _mm_set_epi32(0x639baf6e,0x6e76e3e1,0x99c88821,0x122ffa6c);
    state->x[7] = _mm_set_epi32(0x6bc563ba,0x0cf74f2c,0xe93c9589,0xc7f2c392);
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
    x0 = _mm_xor_si128(x0,_mm_set_epi32(0,0,0,(crypto_uint32) *(crypto_uint16 *) data));
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
