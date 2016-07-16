/*
  core.c version $Date: 2016/04/01 17:05:23 $
  aes128encrypt
  Romain Dolbeau
  Public Domain
*/

#include "crypto_core.h"
#include <immintrin.h>

static inline void aes128ni_setkey_encrypt(const unsigned char* key, __m128i rkeys[11]) {
  __m128i key0 = _mm_loadu_si128((const unsigned int *)(key+0));
  __m128i temp0, temp1, temp2, temp4;
  int idx = 0;

  temp0 = key0;

  /* blockshift-based block by Cedric Bourrasset */
#define BLOCK1(IMM)                                     \
  temp1 = _mm_aeskeygenassist_si128(temp0, IMM);        \
  rkeys[idx++] = temp0;                                 \
  temp4 = _mm_slli_si128(temp0,4);                      \
  temp0 = _mm_xor_si128(temp0,temp4);                   \
  temp4 = _mm_slli_si128(temp0,8);                      \
  temp0 = _mm_xor_si128(temp0,temp4);                   \
  temp1 = _mm_shuffle_epi32(temp1,0xff);                \
  temp0 = _mm_xor_si128(temp0,temp1)

  BLOCK1(0x01);
  BLOCK1(0x02);
  BLOCK1(0x04);
  BLOCK1(0x08);
  BLOCK1(0x10);
  BLOCK1(0x20);
  BLOCK1(0x40);
  BLOCK1(0x80);
  BLOCK1(0x1b);
  BLOCK1(0x36);
  rkeys[idx++] = temp0;
}

static inline void aes128ni_encrypt(const __m128i rkeys[11], const unsigned char *n, unsigned char *out) {
  __m128i nv = _mm_load_si128((const __m128i *)n);
  int i;
  __m128i temp = _mm_xor_si128(nv, rkeys[0]);
#pragma unroll(9)
  for (i = 1 ; i < 10 ; i++) {
    temp = _mm_aesenc_si128(temp, rkeys[i]);
  }
  temp = _mm_aesenclast_si128(temp, rkeys[10]);
  _mm_store_si128((__m128i*)(out), temp);
}

int crypto_core(
        unsigned char *out,
  const unsigned char *in,
  const unsigned char *k,
  const unsigned char *c
)
{
  __m128i rkeys[11];
  aes128ni_setkey_encrypt(k,rkeys);
  aes128ni_encrypt(rkeys, in, out);
  return 0;
}

