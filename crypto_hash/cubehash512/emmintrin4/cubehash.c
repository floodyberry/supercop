/*
20090702
D. J. Bernstein
Public domain.
Note: This code assumes that CUBEHASH_BLOCKBYTES is 32.
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
    state->x[0] = _mm_set_epi32(0xc8237df7,0x992b7520,0x18f45926,0x781f814f);
    state->x[1] = _mm_set_epi32(0x947c6147,0x51916982,0x7b0075ff,0xe4e3ba88);
    state->x[2] = _mm_set_epi32(0x912e1aca,0xb6e17224,0x4d197eb5,0x9dc06f0a);
    state->x[3] = _mm_set_epi32(0x20d4074f,0xf0fcf7c8,0xd9efd0ec,0x5270f5e1);
    state->x[4] = _mm_set_epi32(0xaf1c332a,0x017c189c,0xf4839313,0x15547fee);
    state->x[5] = _mm_set_epi32(0xb6d3d055,0x5bd87a43,0x84997eec,0xde4d7c8c);
    state->x[6] = _mm_set_epi32(0x4bf12b94,0xd9d6ca35,0x2b8cb0a6,0x3ae247b0);
    state->x[7] = _mm_set_epi32(0x520c709b,0x7e70e613,0x62fb84ad,0x97f33a51);
  } else if (hashbitlen == 256) {
    state->x[0] = _mm_set_epi32(0x74194e45,0x18264142,0xb70808d3,0x17b1fd69);
    state->x[1] = _mm_set_epi32(0x31e026ad,0x4715df6a,0x098d19ff,0xc34ee08c);
    state->x[2] = _mm_set_epi32(0x4a84c9d5,0xa6adf786,0x8e6799a9,0x40ebe90d);
    state->x[3] = _mm_set_epi32(0xa28c6161,0xcfdd3a43,0x5e93dbf6,0x24e86f58);
    state->x[4] = _mm_set_epi32(0x84ba87ae,0x58f6380d,0xd58779d5,0x1b82fcce);
    state->x[5] = _mm_set_epi32(0xea657017,0x14cd80e2,0x63fbc998,0x8fa7b687);
    state->x[6] = _mm_set_epi32(0x881bf45f,0x988d7de1,0xe315dd65,0x301b3714);
    state->x[7] = _mm_set_epi32(0xb25a7b48,0x3d0b8f1e,0x2333f4b6,0x4206936e);
  } else {
    for (i = 0;i < 8;++i) state->x[i] = _mm_set_epi32(0,0,0,0);
    state->x[0] = _mm_set_epi32(0,CUBEHASH_ROUNDS,CUBEHASH_BLOCKBYTES,hashbitlen / 8);
    transform(state,16);
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
    x1 = _mm_xor_si128(x1,_mm_loadu_si128((__m128i *) (data + 16)));
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
  transform(state,32);
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
