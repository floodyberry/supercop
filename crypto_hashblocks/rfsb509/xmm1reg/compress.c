#include <emmintrin.h>
#include "crypto_hashblocks.h"

#define matrix crypto_hashblocks_rfsb509_xmm1reg_matrix
extern const unsigned char matrix[16384];

int crypto_hashblocks(unsigned char *r,const unsigned char *b,unsigned long long blen)
{
  unsigned char state[64];
  unsigned long long in[14];
  unsigned char pos[112];
  __m128i carry0;
  __m128i carry1;
  __m128i carry2;
  __m128i carry3;
  __m128i ci;
  __m128i u;
  int i;

  for (i = 0;i < 64;++i) state[i] = r[i];

  while (blen >= 48) {
    for (i = 0;i < 8;++i) in[i] = *(unsigned long long *) (state + 8 * i);
    for (i = 0;i < 6;++i) in[8 + i] = *(unsigned long long *) (b + 8 * i);
  
    for (i = 0;i < 14;++i) {
      pos[8 * i + 0] = in[i];
      pos[8 * i + 1] = in[i] >> 8;
      pos[8 * i + 2] = in[i] >> 16;
      pos[8 * i + 3] = in[i] >> 24;
      pos[8 * i + 4] = in[i] >> 32;
      pos[8 * i + 5] = in[i] >> 40;
      pos[8 * i + 6] = in[i] >> 48;
      pos[8 * i + 7] = in[i] >> 56;
    }
  
    ci = *(__m128i *) (matrix + pos[0] * 64 + 48);
    u = _mm_srli_epi64(ci,61);
    carry0 = _mm_shuffle_epi32(u,0x45);
    carry0 ^= _mm_slli_epi64(ci,3);
    carry3 = _mm_srli_si128(u,8); /* XXX: always 0... */
  
    ci = *(__m128i *) (matrix + pos[1] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[0] * 64 + 32);
    u = _mm_srli_epi64(ci,61);
    carry1 = _mm_shuffle_epi32(u,0x45);
    carry1 ^= _mm_slli_epi64(ci,3);
    carry0 ^= _mm_srli_si128(u,8);
  
    ci = *(__m128i *) (matrix + pos[2] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[1] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[0] * 64 + 16);
    u = _mm_srli_epi64(ci,61);
    carry2 = _mm_shuffle_epi32(u,0x45);
    carry2 ^= _mm_slli_epi64(ci,3);
    carry1 ^= _mm_srli_si128(u,8);
  
    ci = *(__m128i *) (matrix + pos[3] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[2] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[1] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[0] * 64);
    ci ^= carry3;
    u = _mm_srli_epi64(ci,61);
    carry3 = _mm_shuffle_epi32(u,0x45);
    carry3 ^= _mm_slli_epi64(ci,3);
    carry2 ^= _mm_srli_si128(u,8);

    for (i = 4;i < 108;i += 4) {
      ci = *(__m128i *) (matrix + pos[i] * 64 + 48);
      ci ^= *(__m128i *) (matrix + pos[i - 1] * 64 + 32);
      ci ^= *(__m128i *) (matrix + pos[i - 2] * 64 + 16);
      ci ^= *(__m128i *) (matrix + pos[i - 3] * 64);
      ci ^= carry0;
      u = _mm_srli_epi64(ci,61);
      carry0 = _mm_shuffle_epi32(u,0x45);
      carry0 ^= _mm_slli_epi64(ci,3);
      carry3 ^= _mm_srli_si128(u,8);

      ci = *(__m128i *) (matrix + pos[i + 1] * 64 + 48);
      ci ^= *(__m128i *) (matrix + pos[i + 0] * 64 + 32);
      ci ^= *(__m128i *) (matrix + pos[i - 1] * 64 + 16);
      ci ^= *(__m128i *) (matrix + pos[i - 2] * 64);
      ci ^= carry1;
      u = _mm_srli_epi64(ci,61);
      carry1 = _mm_shuffle_epi32(u,0x45);
      carry1 ^= _mm_slli_epi64(ci,3);
      carry0 ^= _mm_srli_si128(u,8);

      ci = *(__m128i *) (matrix + pos[i + 2] * 64 + 48);
      ci ^= *(__m128i *) (matrix + pos[i + 1] * 64 + 32);
      ci ^= *(__m128i *) (matrix + pos[i + 0] * 64 + 16);
      ci ^= *(__m128i *) (matrix + pos[i - 1] * 64);
      ci ^= carry2;
      u = _mm_srli_epi64(ci,61);
      carry2 = _mm_shuffle_epi32(u,0x45);
      carry2 ^= _mm_slli_epi64(ci,3);
      carry1 ^= _mm_srli_si128(u,8);

      ci = *(__m128i *) (matrix + pos[i + 3] * 64 + 48);
      ci ^= *(__m128i *) (matrix + pos[i + 2] * 64 + 32);
      ci ^= *(__m128i *) (matrix + pos[i + 1] * 64 + 16);
      ci ^= *(__m128i *) (matrix + pos[i + 0] * 64);
      ci ^= carry3;
      u = _mm_srli_epi64(ci,61);
      carry3 = _mm_shuffle_epi32(u,0x45);
      carry3 ^= _mm_slli_epi64(ci,3);
      carry2 ^= _mm_srli_si128(u,8);

    }

    ci = *(__m128i *) (matrix + pos[108] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[107] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[106] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[105] * 64);
    ci ^= carry0;
    u = _mm_srli_epi64(ci,61);
    carry0 = _mm_shuffle_epi32(u,0x45);
    carry0 ^= _mm_slli_epi64(ci,3);
    carry3 ^= _mm_srli_si128(u,8);

    ci = *(__m128i *) (matrix + pos[109] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[108] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[107] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[106] * 64);
    ci ^= carry1;
    u = _mm_srli_epi64(ci,61);
    carry1 = _mm_shuffle_epi32(u,0x45);
    carry1 ^= _mm_slli_epi64(ci,3);
    carry0 ^= _mm_srli_si128(u,8);

    ci = *(__m128i *) (matrix + pos[110] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[109] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[108] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[107] * 64);
    ci ^= carry2;
    u = _mm_srli_epi64(ci,61);
    carry2 = _mm_shuffle_epi32(u,0x45);
    carry2 ^= _mm_slli_epi64(ci,3);
    carry1 ^= _mm_srli_si128(u,8);

    ci = *(__m128i *) (matrix + pos[111] * 64 + 48);
    ci ^= *(__m128i *) (matrix + pos[110] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[109] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[108] * 64);
    ci ^= carry3;
    u = _mm_srli_epi64(ci,61);
    carry2 ^= _mm_srli_si128(u,8);
    ci &= _mm_set_epi32(536870911,-1,-1,-1);
    _mm_storeu_si128((__m128i *) (state + 48),ci);

    ci = *(__m128i *) (matrix + pos[111] * 64 + 32);
    ci ^= *(__m128i *) (matrix + pos[110] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[109] * 64);
    ci ^= carry0;
    _mm_storeu_si128((__m128i *) (state + 32),ci);

    ci = *(__m128i *) (matrix + pos[111] * 64 + 16);
    ci ^= *(__m128i *) (matrix + pos[110] * 64);
    ci ^= carry1;
    _mm_storeu_si128((__m128i *) (state + 16),ci);
  
    ci = *(__m128i *) (matrix + pos[111] * 64);
    ci ^= carry2;
    _mm_storeu_si128((__m128i *) (state + 0),ci);

    b += 48;
    blen -= 48;
  }

  for (i = 0;i < 64;++i) r[i] = state[i];
  return blen;
}
