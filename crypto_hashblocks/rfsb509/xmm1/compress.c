#include <emmintrin.h>
#include "crypto_hashblocks.h"

#define matrix crypto_hashblocks_rfsb509_xmm1_matrix
extern const unsigned char matrix[16384];

int crypto_hashblocks(unsigned char *r,const unsigned char *b,unsigned long long blen)
{
  unsigned char state[64];
  unsigned long long in[14];
  unsigned char pos[112];
  __m128i c[115];
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
  
    c[0] = *(__m128i *) (matrix + pos[0] * 64 + 48);
  
    c[1] = *(__m128i *) (matrix + pos[1] * 64 + 48);
    c[1] ^= *(__m128i *) (matrix + pos[0] * 64 + 32);
  
    c[2] = *(__m128i *) (matrix + pos[2] * 64 + 48);
    c[2] ^= *(__m128i *) (matrix + pos[1] * 64 + 32);
    c[2] ^= *(__m128i *) (matrix + pos[0] * 64 + 16);
  
    for (i = 3;i < 112;++i) {
      c[i] = *(__m128i *) (matrix + pos[i] * 64 + 48);
      c[i] ^= *(__m128i *) (matrix + pos[i - 1] * 64 + 32);
      c[i] ^= *(__m128i *) (matrix + pos[i - 2] * 64 + 16);
      c[i] ^= *(__m128i *) (matrix + pos[i - 3] * 64);
    }
  
    c[112] = *(__m128i *) (matrix + pos[109] * 64);
    c[112] ^= *(__m128i *) (matrix + pos[110] * 64 + 16);
    c[112] ^= *(__m128i *) (matrix + pos[111] * 64 + 32);
  
    c[113] = *(__m128i *) (matrix + pos[110] * 64);
    c[113] ^= *(__m128i *) (matrix + pos[111] * 64 + 16);
  
    c[114] = *(__m128i *) (matrix + pos[111] * 64);
  
    for (i = 0;i < 111;++i) {
      /* c[i] has ABCD */
      u = _mm_srli_epi64(c[i],61); /* B0D0 */
      c[i + 4] ^= _mm_slli_epi64(c[i],3); /* 0A0C */
      c[i + 4] ^= _mm_shuffle_epi32(u,0x45); /* 00B0 */
      c[i + 3] ^= _mm_srli_si128(u,8); /* D000 */
    }
  
    /* c[111] has ABCD */
    u = _mm_srli_epi64(c[111],61); /* B0D0 */
    c[114] ^= _mm_srli_si128(u,8); /* D000 */
    c[111] &= _mm_set_epi32(536870911,-1,-1,-1);
  
    for (i = 0;i < 16;++i) state[0 + i] = i[(unsigned char *) &c[114]];
    for (i = 0;i < 16;++i) state[16 + i] = i[(unsigned char *) &c[113]];
    for (i = 0;i < 16;++i) state[32 + i] = i[(unsigned char *) &c[112]];
    for (i = 0;i < 16;++i) state[48 + i] = i[(unsigned char *) &c[111]];

    b += 48;
    blen -= 48;
  }

  for (i = 0;i < 64;++i) r[i] = state[i];
  return blen;
}
