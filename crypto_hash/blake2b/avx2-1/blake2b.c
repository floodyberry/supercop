
#if defined(SUPERCOP)
#include "crypto_hash.h"
#endif

#if defined(BLAKE2B_SELFTEST)
#include <stdio.h>
#endif
#include <string.h>

#include <immintrin.h>

#include "blake2-config.h"
#include "blake2.h"
#include "blake2b-round.h"

#if defined(PERMUTE_WITH_GATHER)
ALIGN( 64 ) static const uint32_t indices[12*16] = 
{
   0,  2,  4,  6, 1,  3,  5,  7, 8, 10, 12, 14, 9, 11, 13, 15,
  14,  4,  9, 13,10,  8, 15,  6, 1,  0, 11,  5,12,  2,  7,  3,
  11, 12,  5, 15, 8,  0,  2, 13,10,  3,  7,  9,14,  6,  1,  4,
   7,  3, 13, 11, 9,  1, 12, 14, 2,  5,  4, 15, 6, 10,  0,  8,
   9,  5,  2, 10, 0,  7,  4, 15,14, 11,  6,  3, 1, 12,  8, 13,
   2,  6,  0,  8,12, 10, 11,  3, 4,  7, 15,  1,13,  5, 14,  9,
  12,  1, 14,  4, 5, 15, 13, 10, 0,  6,  9,  8, 7,  3,  2, 11,
  13,  7, 12,  3,11, 14,  1,  9, 5, 15,  8,  2, 0,  4,  6, 10,
   6, 14, 11,  0,15,  9,  3,  8,12, 13,  1, 10, 2,  7,  4,  5,
  10,  8,  7,  1, 2,  4,  6,  5,15,  9,  3, 13,11, 14, 12,  0,
   0,  2,  4,  6, 1,  3,  5,  7, 8, 10, 12, 14, 9, 11, 13, 15,
  14,  4,  9, 13,10,  8, 15,  6, 1,  0, 11,  5,12,  2,  7,  3,
};
#endif

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
  const __m256i r16 = _mm256_setr_epi8( 2, 3, 4, 5, 6, 7, 0, 1, 10, 11, 12, 13, 14, 15, 8, 9, 
                                        2, 3, 4, 5, 6, 7, 0, 1, 10, 11, 12, 13, 14, 15, 8, 9 );
  const __m256i r24 = _mm256_setr_epi8( 3, 4, 5, 6, 7, 0, 1, 2, 11, 12, 13, 14, 15, 8, 9, 10,
                                        3, 4, 5, 6, 7, 0, 1, 2, 11, 12, 13, 14, 15, 8, 9, 10 );

  __m256i ymm0;
  __m256i ymm1;
  __m256i ymm2;
  __m256i ymm3;

#if defined(PERMUTE_WITH_SHUFFLES)
  __m256i t0, t1;
#endif
  __m256i b0;
  uint64_t ctr = 0;
#if defined(PERMUTE_WITH_GATHER)
    int i;
#endif

  ymm0 = _mm256_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL, 0xBB67AE8584CAA73BULL, 0x6A09E667F3BCC908ULL ^ 0x0000000001010040ULL);
  ymm1 = _mm256_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL, 0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL);

  while( inlen > 128 )
  {
#if defined(PERMUTE_WITH_GATHER)
#elif defined(PERMUTE_WITH_SHUFFLES)
    const __m256i m0 = _mm256_broadcastsi128_si256(LOADU128( in + 00 ));
    const __m256i m1 = _mm256_broadcastsi128_si256(LOADU128( in + 16 ));
    const __m256i m2 = _mm256_broadcastsi128_si256(LOADU128( in + 32 ));
    const __m256i m3 = _mm256_broadcastsi128_si256(LOADU128( in + 48 ));
    const __m256i m4 = _mm256_broadcastsi128_si256(LOADU128( in + 64 ));
    const __m256i m5 = _mm256_broadcastsi128_si256(LOADU128( in + 80 ));
    const __m256i m6 = _mm256_broadcastsi128_si256(LOADU128( in + 96 ));
    const __m256i m7 = _mm256_broadcastsi128_si256(LOADU128( in + 112 ));
#else
    const uint64_t  m0 = ( ( uint64_t * )in )[ 0];
    const uint64_t  m1 = ( ( uint64_t * )in )[ 1];
    const uint64_t  m2 = ( ( uint64_t * )in )[ 2];
    const uint64_t  m3 = ( ( uint64_t * )in )[ 3];
    const uint64_t  m4 = ( ( uint64_t * )in )[ 4];
    const uint64_t  m5 = ( ( uint64_t * )in )[ 5];
    const uint64_t  m6 = ( ( uint64_t * )in )[ 6];
    const uint64_t  m7 = ( ( uint64_t * )in )[ 7];
    const uint64_t  m8 = ( ( uint64_t * )in )[ 8];
    const uint64_t  m9 = ( ( uint64_t * )in )[ 9];
    const uint64_t m10 = ( ( uint64_t * )in )[10];
    const uint64_t m11 = ( ( uint64_t * )in )[11];
    const uint64_t m12 = ( ( uint64_t * )in )[12];
    const uint64_t m13 = ( ( uint64_t * )in )[13];
    const uint64_t m14 = ( ( uint64_t * )in )[14];
    const uint64_t m15 = ( ( uint64_t * )in )[15];
#endif

    const __m256i iv0 = ymm0;
    const __m256i iv1 = ymm1;

    ctr += 128;
    
    ymm2 = _mm256_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL, 0xBB67AE8584CAA73BULL, 0x6a09e667f3bcc908ULL);
    ymm3 = _mm256_xor_si256
           (
             _mm256_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL, 0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL),
#if defined(__x86_64__)
             _mm256_blend_epi32(_mm256_castsi128_si256(_mm_cvtsi64_si128(ctr)), 
                                _mm256_setzero_si256(),
                                0xF0
                               )
#else
             _mm256_set_epi64x(0x0000000000000000ULL, 0x0000000000000000ULL, 0x0000000000000000ULL,                   ctr)
#endif
           );

    ROUNDS(in);

    ymm0 = _mm256_xor_si256(ymm0, ymm2);
    ymm1 = _mm256_xor_si256(ymm1, ymm3);
    ymm0 = _mm256_xor_si256(ymm0, iv0);
    ymm1 = _mm256_xor_si256(ymm1, iv1);
   
    in += 128;
    inlen -= 128;
  }

  ctr += inlen;

  do
  {
#if defined(PERMUTE_WITH_GATHER)
#elif defined(PERMUTE_WITH_SHUFFLES)
    __m256i m0, m1, m2, m3, m4, m5, m6, m7;
#else
    uint64_t m0, m1, m2, m3, m4, m5, m6, m7;
    uint64_t m8, m9, m10, m11, m12, m13, m14, m15;
#endif
    ALIGN( 64 ) uint8_t buffer[128];
    uint8_t *p = NULL;
   
    const __m256i iv0 = ymm0;
    const __m256i iv1 = ymm1;

    if( inlen & 128 )
    {
      p = (uint8_t *)in;
    }
    else
    {
      memset(buffer, 0, sizeof(buffer));
      p = buffer;

      if( inlen & 64 )
      {
        STORE( p + 00, LOADU( in + 00 ) );
        STORE( p + 32, LOADU( in + 32 ) );
        in += 64; p += 64;
      }

      if( inlen & 32 ) { STORE( p + 00, LOADU( in + 00 ) ); in += 32; p += 32; }

      if( inlen & 16 ) { STORE128( p + 00, LOADU128( in + 00 ) ); in += 16; p += 16; }

      if( inlen &  8 ) { *( uint64_t * )p = *( uint64_t * )in; p += 8; in += 8; }

      if( inlen &  4 ) { *( uint32_t * )p = *( uint32_t * )in; p += 4; in += 4; }

      if( inlen &  2 ) { *( uint16_t * )p = *( uint16_t * )in; p += 2; in += 2; }

      if( inlen &  1 ) { *p = *in; }

      p = buffer;
    }

#if defined(PERMUTE_WITH_GATHER)
#elif defined(PERMUTE_WITH_SHUFFLES)
    m0 = _mm256_broadcastsi128_si256(LOADU128( p + 00 ));
    m1 = _mm256_broadcastsi128_si256(LOADU128( p + 16 ));
    m2 = _mm256_broadcastsi128_si256(LOADU128( p + 32 ));
    m3 = _mm256_broadcastsi128_si256(LOADU128( p + 48 ));
    m4 = _mm256_broadcastsi128_si256(LOADU128( p + 64 ));
    m5 = _mm256_broadcastsi128_si256(LOADU128( p + 80 ));
    m6 = _mm256_broadcastsi128_si256(LOADU128( p + 96 ));
    m7 = _mm256_broadcastsi128_si256(LOADU128( p + 112 ));
#else
     m0 = ( ( uint64_t * )p )[ 0];
     m1 = ( ( uint64_t * )p )[ 1];
     m2 = ( ( uint64_t * )p )[ 2];
     m3 = ( ( uint64_t * )p )[ 3];
     m4 = ( ( uint64_t * )p )[ 4];
     m5 = ( ( uint64_t * )p )[ 5];
     m6 = ( ( uint64_t * )p )[ 6];
     m7 = ( ( uint64_t * )p )[ 7];
     m8 = ( ( uint64_t * )p )[ 8];
     m9 = ( ( uint64_t * )p )[ 9];
    m10 = ( ( uint64_t * )p )[10];
    m11 = ( ( uint64_t * )p )[11];
    m12 = ( ( uint64_t * )p )[12];
    m13 = ( ( uint64_t * )p )[13];
    m14 = ( ( uint64_t * )p )[14];
    m15 = ( ( uint64_t * )p )[15];
#endif

    ymm2 = _mm256_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL, 0xBB67AE8584CAA73BULL, 0x6a09e667f3bcc908ULL);
    ymm3 = _mm256_xor_si256
           (
             _mm256_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL, 0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL),
#if defined(__x86_64__)
             _mm256_blend_epi32(_mm256_castsi128_si256(_mm_cvtsi64_si128(ctr)), 
                                _mm256_set_epi64x(0x0000000000000000ULL, 0xFFFFFFFFFFFFFFFFULL, 0x0000000000000000ULL, 0x0000000000000000ULL),
                                0xF0
                               )
#else
             _mm256_set_epi64x(0x0000000000000000ULL, 0xFFFFFFFFFFFFFFFFULL, 0x0000000000000000ULL,                   ctr)
#endif
           );

    ROUNDS(p);

    ymm0 = _mm256_xor_si256(ymm0, ymm2);
    ymm1 = _mm256_xor_si256(ymm1, ymm3);
    ymm0 = _mm256_xor_si256(ymm0, iv0);
    ymm1 = _mm256_xor_si256(ymm1, iv1);
  }
  while( 0 );

  STOREU( out + 00, ymm0 );
  STOREU( out + 32, ymm1 );
  return 0;
}


#if defined(BLAKE2B_SELFTEST)
#include <string.h>
#include "blake2-kat.h"
int main( int argc, char **argv )
{
  uint8_t buf[KAT_LENGTH];
  size_t i;

  for( i = 0; i < KAT_LENGTH; ++i )
    buf[i] = i;

  for( i = 0; i < KAT_LENGTH; ++i )
  {
    uint8_t hash[BLAKE2B_OUTBYTES];
    crypto_hash( hash, buf, i );

    if( 0 != memcmp( hash, blake2b_kat[i], BLAKE2B_OUTBYTES ) )
    {
      printf( "error at %lu", i );
      return -1;
    }
  }

  puts( "ok" );
  return 0;
}
#endif

