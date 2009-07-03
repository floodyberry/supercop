/*
20090702
D. J. Bernstein
Public domain.
Note: This code assumes that CUBEHASH_BLOCKBYTES is 16.
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
    state->x[0] = _mm_set_epi32(0x81df9d06,0xc0801aff,0x5425f481,0x61185768);
    state->x[1] = _mm_set_epi32(0x1066b277,0xbee1175c,0x2a0db7d5,0x52460279);
    state->x[2] = _mm_set_epi32(0x5eafe9bb,0x029e6bd4,0x81f0fe94,0x50956d5e);
    state->x[3] = _mm_set_epi32(0x00731d1c,0xa0ea5c09,0x75886928,0xbfb54ab1);
    state->x[4] = _mm_set_epi32(0x4df9f995,0xd51db04f,0x3a149e1b,0x6ee968ba);
    state->x[5] = _mm_set_epi32(0xdfd9324d,0xadbd761a,0x829c3003,0x59131e6f);
    state->x[6] = _mm_set_epi32(0x8d6bf904,0x07ea0c64,0x855f01c0,0xb596f9ee);
    state->x[7] = _mm_set_epi32(0xd956372c,0x8a71aec0,0x29db17b1,0x07722667);
  } else if (hashbitlen == 256) {
    state->x[0] = _mm_set_epi32(0xfe121dde,0xa8d3fc7d,0xfb233825,0x4f0ed733);
    state->x[1] = _mm_set_epi32(0xa0eafab2,0x88d96e04,0x01d8e95e,0x79c3f48c);
    state->x[2] = _mm_set_epi32(0x0838e707,0x31a49724,0x8b980d56,0xf3b36724);
    state->x[3] = _mm_set_epi32(0x2319de61,0x42994cb6,0x6312fbb7,0x3327245f);
    state->x[4] = _mm_set_epi32(0x4c0e72d7,0x4e0a70d6,0x5e8371b7,0x60617bc8);
    state->x[5] = _mm_set_epi32(0x0a6b5de3,0xd4c5cb34,0x31fb1a84,0x7e585bac);
    state->x[6] = _mm_set_epi32(0x913b7e1a,0x49bc141d,0x1343fee2,0xcc1bd68d);
    state->x[7] = _mm_set_epi32(0x1ef447e5,0x349ce8ef,0x62193738,0xd40326fb);
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
    x0 = _mm_xor_si128(x0,_mm_loadu_si128((__m128i *) data));
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
