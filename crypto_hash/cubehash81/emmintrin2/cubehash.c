/*
20081106
D. J. Bernstein
Public domain.
*/

#include "parameters.h"
#include "cubehash.h"

static void transform(hashState *state)
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
  __m128i y4;
  __m128i y5;
  __m128i y6;
  __m128i y7;

  x0 = _mm_load_si128(0 + state->x);
  x1 = _mm_load_si128(1 + state->x);
  x2 = _mm_load_si128(2 + state->x);
  x3 = _mm_load_si128(3 + state->x);
  x4 = _mm_load_si128(4 + state->x);
  x5 = _mm_load_si128(5 + state->x);
  x6 = _mm_load_si128(6 + state->x);
  x7 = _mm_load_si128(7 + state->x);

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

  _mm_store_si128(0 + state->x,x0);
  _mm_store_si128(1 + state->x,x1);
  _mm_store_si128(2 + state->x,x2);
  _mm_store_si128(3 + state->x,x3);
  _mm_store_si128(4 + state->x,x4);
  _mm_store_si128(5 + state->x,x5);
  _mm_store_si128(6 + state->x,x6);
  _mm_store_si128(7 + state->x,x7);
}

HashReturn Init(hashState *state, int hashbitlen)
{
  int i;
  int j;

  if (hashbitlen < 8) return BAD_HASHBITLEN;
  if (hashbitlen > 512) return BAD_HASHBITLEN;
  if (hashbitlen != 8 * (hashbitlen / 8)) return BAD_HASHBITLEN;

  state->hashbitlen = hashbitlen;
  for (i = 0;i < 8;++i) state->x[i] = _mm_set_epi32(0,0,0,0);
  state->x[0] = _mm_set_epi32(0,CUBEHASH_ROUNDS,CUBEHASH_BLOCKBYTES,hashbitlen / 8);
  for (i = 0;i < 10;++i) transform(state);
  state->pos = 0;
  return SUCCESS;
}

HashReturn Update(hashState *state, const BitSequence *data,
                  DataLength databitlen)
{
  /* caller promises us that previous data had integral number of bytes */
  /* so state->pos is a multiple of 8 */

  while (databitlen >= 8) {
    ((unsigned char *) state->x)[state->pos / 8] ^= *data;
    data += 1;
    databitlen -= 8;
    state->pos += 8;
    if (state->pos == 8 * CUBEHASH_BLOCKBYTES) {
      transform(state);
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
  transform(state);
  state->x[7] = _mm_xor_si128(state->x[7],_mm_set_epi32(1,0,0,0));
  for (i = 0;i < 10;++i) transform(state);
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
