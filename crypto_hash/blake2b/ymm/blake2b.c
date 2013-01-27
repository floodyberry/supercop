
#include "crypto_hash.h"
#include <stdio.h>
#include <string.h>
#include "blake2.h"
#include "blake2-config.h"

#if defined(HAVE_XOP)
#include <x86intrin.h>
#else 
#include <immintrin.h>
#endif

#if !defined(HAVE_AVX)
#error "This code requires at least AVX."
#endif

#define LOAD(p)  _mm_load_si128( (__m128i *)(p) )
#define STORE(p,r) _mm_store_si128((__m128i *)(p), r)

#define LOADU(p)  _mm_loadu_si128( (__m128i *)(p) )
#define STOREU(p,r) _mm_storeu_si128((__m128i *)(p), r)

#if defined(HAVE_XOP)
#else // AVX
#define _mm_roti_epi64(x, c) \
    (-(c) == 32) ? _mm_shuffle_epi32((x), _MM_SHUFFLE(2,3,0,1))  \
    : (-(c) == 24) ? _mm_shuffle_epi8((x), r24) \
    : (-(c) == 16) ? _mm_shuffle_epi8((x), r16) \
    : (-(c) == 63) ? _mm_xor_si128(_mm_srli_epi64((x), -(c)), _mm_add_epi64((x), (x)))  \
    : _mm_xor_si128(_mm_srli_epi64((x), -(c)), _mm_slli_epi64((x), 64-(-(c))))
#endif

#define G1(row1l,row2l,row3l,row4l,row1h,row2h,row3h,row4h,b0,b1) \
  row1l = _mm_add_epi64(_mm_add_epi64(row1l, b0), row2l); \
  row1h = _mm_add_epi64(_mm_add_epi64(row1h, b1), row2h); \
  \
  row4l = _mm_xor_si128(row4l, row1l); \
  row4h = _mm_xor_si128(row4h, row1h); \
  \
  row4l = _mm_roti_epi64(row4l, -32); \
  row4h = _mm_roti_epi64(row4h, -32); \
  \
  row3l = _mm_add_epi64(row3l, row4l); \
  row3h = _mm_add_epi64(row3h, row4h); \
  \
  row2l = _mm_xor_si128(row2l, row3l); \
  row2h = _mm_xor_si128(row2h, row3h); \
  \
  row2l = _mm_roti_epi64(row2l, -24); \
  row2h = _mm_roti_epi64(row2h, -24); \
 
#define G2(row1l,row2l,row3l,row4l,row1h,row2h,row3h,row4h,b0,b1) \
  row1l = _mm_add_epi64(_mm_add_epi64(row1l, b0), row2l); \
  row1h = _mm_add_epi64(_mm_add_epi64(row1h, b1), row2h); \
  \
  row4l = _mm_xor_si128(row4l, row1l); \
  row4h = _mm_xor_si128(row4h, row1h); \
  \
  row4l = _mm_roti_epi64(row4l, -16); \
  row4h = _mm_roti_epi64(row4h, -16); \
  \
  row3l = _mm_add_epi64(row3l, row4l); \
  row3h = _mm_add_epi64(row3h, row4h); \
  \
  row2l = _mm_xor_si128(row2l, row3l); \
  row2h = _mm_xor_si128(row2h, row3h); \
  \
  row2l = _mm_roti_epi64(row2l, -63); \
  row2h = _mm_roti_epi64(row2h, -63); \

#define DIAGONALIZE(row1l,row2l,row3l,row4l,row1h,row2h,row3h,row4h) \
  t0 = _mm_alignr_epi8(row2h, row2l, 8); \
  t1 = _mm_alignr_epi8(row2l, row2h, 8); \
  row2l = t0; \
  row2h = t1; \
  \
  t0 = row3l; \
  row3l = row3h; \
  row3h = t0;    \
  \
  t0 = _mm_alignr_epi8(row4h, row4l, 8); \
  t1 = _mm_alignr_epi8(row4l, row4h, 8); \
  row4l = t1; \
  row4h = t0;

#define UNDIAGONALIZE(row1l,row2l,row3l,row4l,row1h,row2h,row3h,row4h) \
  t0 = _mm_alignr_epi8(row2l, row2h, 8); \
  t1 = _mm_alignr_epi8(row2h, row2l, 8); \
  row2l = t0; \
  row2h = t1; \
  \
  t0 = row3l; \
  row3l = row3h; \
  row3h = t0; \
  \
  t0 = _mm_alignr_epi8(row4l, row4h, 8); \
  t1 = _mm_alignr_epi8(row4h, row4l, 8); \
  row4l = t1; \
  row4h = t0;

#include "blake2b-load-avx.h"

#define ROUND(r) \
  LOAD_MSG_ ##r ##_1(b0, b1); \
  G1(xmm0,xmm2,xmm4,xmm6,xmm1,xmm3,xmm5,xmm7,b0,b1); \
  LOAD_MSG_ ##r ##_2(b0, b1); \
  G2(xmm0,xmm2,xmm4,xmm6,xmm1,xmm3,xmm5,xmm7,b0,b1); \
  DIAGONALIZE(xmm0,xmm2,xmm4,xmm6,xmm1,xmm3,xmm5,xmm7); \
  LOAD_MSG_ ##r ##_3(b0, b1); \
  G1(xmm0,xmm2,xmm4,xmm6,xmm1,xmm3,xmm5,xmm7,b0,b1); \
  LOAD_MSG_ ##r ##_4(b0, b1); \
  G2(xmm0,xmm2,xmm4,xmm6,xmm1,xmm3,xmm5,xmm7,b0,b1); \
  UNDIAGONALIZE(xmm0,xmm2,xmm4,xmm6,xmm1,xmm3,xmm5,xmm7);


int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  const __m128i r16 = _mm_setr_epi8( 2, 3, 4, 5, 6, 7, 0, 1, 10, 11, 12, 13, 14, 15, 8, 9 );
  const __m128i r24 = _mm_setr_epi8( 3, 4, 5, 6, 7, 0, 1, 2, 11, 12, 13, 14, 15, 8, 9, 10 );
  register __m128i xmm0;
  register __m128i xmm1;
  register __m128i xmm2;
  register __m128i xmm3;
  register __m128i xmm4;
  register __m128i xmm5;
  register __m128i xmm6;
  register __m128i xmm7;

  __m128i b0, b1, t0, t1;
  uint64_t ctr = 0;

  xmm0 = _mm_set_epi64x(0xBB67AE8584CAA73BULL, 0x6a09e667f3bcc908ULL ^ 0x0000000001010040ULL);
  xmm1 = _mm_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL);
  xmm2 = _mm_set_epi64x(0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL);
  xmm3 = _mm_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL);

  while(inlen > 128)
  {
    const __m256i m0 = _mm256_loadu_si256((__m256i*)(in + 00));
    const __m256i m1 = _mm256_loadu_si256((__m256i*)(in + 32));
    const __m256i m2 = _mm256_loadu_si256((__m256i*)(in + 64));
    const __m256i m3 = _mm256_loadu_si256((__m256i*)(in + 96));

    const __m128i iv0 = xmm0;
    const __m128i iv1 = xmm1;
    const __m128i iv2 = xmm2;
    const __m128i iv3 = xmm3;

    ctr += 128;

    xmm4 = _mm_set_epi64x(0xBB67AE8584CAA73BULL, 0x6a09e667f3bcc908ULL);
    xmm5 = _mm_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL);
#if defined(__x86_64__)
    xmm6 = _mm_xor_si128(_mm_cvtsi64_si128(ctr), _mm_set_epi64x(0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL));
#else
    xmm6 = _mm_xor_si128(_mm_set_epi64x(0, ctr), _mm_set_epi64x(0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL));
#endif
    xmm7 = _mm_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL);

    ROUND(0);
    ROUND(1);
    ROUND(2);
    ROUND(3);
    ROUND(4);
    ROUND(5);
    ROUND(6);
    ROUND(7);
    ROUND(8);
    ROUND(9);
    ROUND(10);
    ROUND(11);

    xmm0 = _mm_xor_si128(xmm0, xmm4);
    xmm1 = _mm_xor_si128(xmm1, xmm5);
    xmm2 = _mm_xor_si128(xmm2, xmm6);
    xmm3 = _mm_xor_si128(xmm3, xmm7);

    xmm0 = _mm_xor_si128(xmm0, iv0);
    xmm1 = _mm_xor_si128(xmm1, iv1);
    xmm2 = _mm_xor_si128(xmm2, iv2);
    xmm3 = _mm_xor_si128(xmm3, iv3);

    in += 128;
    inlen -= 128;
  }

  do
  {
    __m128i m0, m1, m2, m3;
    ALIGN(16) uint8_t buffer[128]  = {0};
    uint8_t *p = buffer;

    const __m128i iv0 = xmm0;
    const __m128i iv1 = xmm1;
    const __m128i iv2 = xmm2;
    const __m128i iv3 = xmm3;

    ctr += inlen;
    
    if(inlen & 128) 
    {
      m0 = _mm256_loadu_si256((__m256i*)(in + 00));
      m1 = _mm256_loadu_si256((__m256i*)(in + 32));
      m2 = _mm256_loadu_si256((__m256i*)(in + 64));
      m3 = _mm256_loadu_si256((__m256i*)(in + 96));
    }
    else
    {
      if(inlen & 64) 
      {
        STORE(p + 00, LOADU(in + 00)); 
        STORE(p + 16, LOADU(in + 16));  
        STORE(p + 32, LOADU(in + 32));
        STORE(p + 48, LOADU(in + 48));
        in += 64; p += 64;
      }
      if(inlen & 32) { STORE(p + 00, LOADU(in + 00)); STORE(p + 16, LOADU(in + 16)); in += 32; p += 32; }
      if(inlen & 16) { STORE(p + 00, LOADU(in + 00)); in += 16; p += 16; }
      if(inlen &  8) { *(uint64_t*)p = *(uint64_t*)in; p += 8; in += 8; }
      if(inlen &  4) { *(uint32_t*)p = *(uint32_t*)in; p += 4; in += 4; }
      if(inlen &  2) { *(uint16_t*)p = *(uint16_t*)in; p += 2; in += 2; }
      if(inlen &  1) { *p = *in; }

      m0 = _mm256_loadu_si256((__m256i*)(buffer + 00));
      m1 = _mm256_loadu_si256((__m256i*)(buffer + 32));
      m2 = _mm256_loadu_si256((__m256i*)(buffer + 64));
      m3 = _mm256_loadu_si256((__m256i*)(buffer + 96));
    }

    xmm4 = _mm_set_epi64x(0xBB67AE8584CAA73BULL, 0x6a09e667f3bcc908ULL);
    xmm5 = _mm_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL);
#if defined(__x86_64__)
    xmm6 = _mm_xor_si128(_mm_cvtsi64_si128(ctr), _mm_set_epi64x(0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL));
    xmm7 = _mm_xor_si128(_mm_cvtsi64_si128(-1ULL), _mm_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL));
#else
    xmm6 = _mm_xor_si128(_mm_set_epi64x(0, ctr), _mm_set_epi64x(0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL));
    xmm7 = _mm_xor_si128(_mm_set_epi64x(0, -1ULL), _mm_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL));
#endif

    ROUND(0);
    ROUND(1);
    ROUND(2);
    ROUND(3);
    ROUND(4);
    ROUND(5);
    ROUND(6);
    ROUND(7);
    ROUND(8);
    ROUND(9);
    ROUND(10);
    ROUND(11);

    xmm0 = _mm_xor_si128(xmm0, xmm4);
    xmm1 = _mm_xor_si128(xmm1, xmm5);
    xmm2 = _mm_xor_si128(xmm2, xmm6);
    xmm3 = _mm_xor_si128(xmm3, xmm7);

    xmm0 = _mm_xor_si128(xmm0, iv0);
    xmm1 = _mm_xor_si128(xmm1, iv1);
    xmm2 = _mm_xor_si128(xmm2, iv2);
    xmm3 = _mm_xor_si128(xmm3, iv3);

    STOREU(out + 00, xmm0);
    STOREU(out + 16, xmm1);
    STOREU(out + 32, xmm2);
    STOREU(out + 48, xmm3);
  } while(0);
  return 0;
}


#if defined(BLAKE2B_SELFTEST)
#include <string.h>
#include "blake2-kat.h"
int main( int argc, char **argv )
{
  uint8_t key[BLAKE2B_KEYBYTES];
  uint8_t buf[KAT_LENGTH];

  for( size_t i = 0; i < BLAKE2B_KEYBYTES; ++i )
    key[i] = i;

  for( size_t i = 0; i < KAT_LENGTH; ++i )
    buf[i] = i;

  for( size_t i = 0; i < KAT_LENGTH; ++i )
  {
    uint8_t hash[BLAKE2B_OUTBYTES];
    crypto_hash( hash, buf, i );

    if( 0 != memcmp( hash, blake2b_kat[i], BLAKE2B_OUTBYTES ) )
    {
      puts("error");
      return -1;
    }
  }

  puts( "ok" );
  return 0;
}
#endif

