/*
20090307
D. J. Bernstein
Public domain.
Note: This code assumes that CUBEHASH_BLOCKBYTES is 1.
*/

#include "parameters.h"
#include "cubehash.h"

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
    state->x[0] = _mm_set_epi32(0xe626160f,0x60948910,0xfb0930c7,0x6998f35d);
    state->x[1] = _mm_set_epi32(0x3341e7b8,0x57cf193d,0xb58b0d0c,0x36077cf3);
    state->x[2] = _mm_set_epi32(0x2aef3850,0x31ffc414,0x2089f9ef,0xa334805b);
    state->x[3] = _mm_set_epi32(0x7045ca12,0x7d5293a2,0xe940a452,0xfe121839);
    state->x[4] = _mm_set_epi32(0x93c33edb,0x9a90a44a,0x81bf7034,0x9358096e);
    state->x[5] = _mm_set_epi32(0x5212b3ac,0xbc451df2,0x4a87dbd0,0x14c3e984);
    state->x[6] = _mm_set_epi32(0xfad3cf0f,0xddbb8ae8,0x5df0f63b,0x6aabe51c);
    state->x[7] = _mm_set_epi32(0x21a23d5c,0x094025a5,0xad2e2446,0xd52582fb);
  } else if (hashbitlen == 256) {
    state->x[0] = _mm_set_epi32(0x4a500218,0xd785876a,0x273d616f,0x830b2bd5);
    state->x[1] = _mm_set_epi32(0x459f8d89,0x47547842,0xeeb702fb,0xa5388963);
    state->x[2] = _mm_set_epi32(0x2543c273,0xcef47fe8,0xba40bd48,0x8727a1c8);
    state->x[3] = _mm_set_epi32(0xe6b6cb0d,0x2d4541bd,0xae9fcd63,0x5c033052);
    state->x[4] = _mm_set_epi32(0x8180af6e,0xb2ae0096,0x579f5b67,0xcb8a9cdf);
    state->x[5] = _mm_set_epi32(0x7ab29a62,0xf91f981f,0xa597cd2b,0x51ebdf0c);
    state->x[6] = _mm_set_epi32(0x0a293d6f,0xc6d1337e,0x46e6c075,0x01ad72d9);
    state->x[7] = _mm_set_epi32(0xfc5eca8a,0x32aa288f,0x38be153f,0x90c438ac);
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

  x0 = state->x[0];
  x1 = state->x[1];
  x2 = state->x[2];
  x3 = state->x[3];
  x4 = state->x[4];
  x5 = state->x[5];
  x6 = state->x[6];
  x7 = state->x[7];
    
  while (databitlen >= 8) {
    x0 = _mm_xor_si128(x0,_mm_set_epi32(0,0,0,(int) (unsigned int) *data));
    data += 1;
    databitlen -= 8;
    
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
