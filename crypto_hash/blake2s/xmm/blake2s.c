/*
   BLAKE2 reference source code package - optimized C implementations

   Written in 2012 by Samuel Neves <sneves@dei.uc.pt>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/

#include "crypto_hash.h"
#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "blake2.h"

#include "blake2-config.h"


#include <emmintrin.h>
#if defined(HAVE_SSSE3)
#include <tmmintrin.h>
#endif
#if defined(HAVE_SSE41)
#include <smmintrin.h>
#endif
#if defined(HAVE_AVX)
#include <immintrin.h>
#endif
#if defined(HAVE_XOP)
#include <x86intrin.h>
#endif

#include "blake2s-round.h"

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
#if defined(HAVE_SSSE3) && !defined(HAVE_XOP)
  const __m128i r8 = _mm_set_epi8( 12, 15, 14, 13, 8, 11, 10, 9, 4, 7, 6, 5, 0, 3, 2, 1 );
  const __m128i r16 = _mm_set_epi8( 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 );
#endif
  __m128i row1, row2, row3, row4;
  __m128i buf1, buf2, buf3, buf4;
#if defined(HAVE_SSE41)
  __m128i t0, t1;
#if !defined(HAVE_XOP)
  __m128i t2;
#endif
#endif

  uint64_t ctr = 0;

  row1 = _mm_setr_epi32(0x6A09E667UL ^ 0x01010020UL, 0xBB67AE85UL, 0x3C6EF372UL, 0xA54FF53AUL);
  row2 = _mm_setr_epi32(0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL);

  while(inlen > 64)
  {
    const __m128i iv0 = row1;
    const __m128i iv1 = row2;
#if defined(HAVE_SSE41)
    const __m128i m0 = LOADU( in +  00 );
    const __m128i m1 = LOADU( in +  16 );
    const __m128i m2 = LOADU( in +  32 );
    const __m128i m3 = LOADU( in +  48 );
#else
    const uint32_t  m0 = ( ( uint32_t * )in )[ 0];
    const uint32_t  m1 = ( ( uint32_t * )in )[ 1];
    const uint32_t  m2 = ( ( uint32_t * )in )[ 2];
    const uint32_t  m3 = ( ( uint32_t * )in )[ 3];
    const uint32_t  m4 = ( ( uint32_t * )in )[ 4];
    const uint32_t  m5 = ( ( uint32_t * )in )[ 5];
    const uint32_t  m6 = ( ( uint32_t * )in )[ 6];
    const uint32_t  m7 = ( ( uint32_t * )in )[ 7];
    const uint32_t  m8 = ( ( uint32_t * )in )[ 8];
    const uint32_t  m9 = ( ( uint32_t * )in )[ 9];
    const uint32_t m10 = ( ( uint32_t * )in )[10];
    const uint32_t m11 = ( ( uint32_t * )in )[11];
    const uint32_t m12 = ( ( uint32_t * )in )[12];
    const uint32_t m13 = ( ( uint32_t * )in )[13];
    const uint32_t m14 = ( ( uint32_t * )in )[14];
    const uint32_t m15 = ( ( uint32_t * )in )[15];
#endif
    ctr += 64; inlen -= 64; in += 64;
    row3 = _mm_setr_epi32(0x6A09E667UL, 0xBB67AE85UL, 0x3C6EF372UL, 0xA54FF53AUL);
#if defined(__x86_64__)
    row4 = _mm_xor_si128(_mm_cvtsi64_si128(ctr), _mm_setr_epi32(0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL));
#else
    row4 = _mm_xor_si128(_mm_set_epi64x(0, ctr), _mm_setr_epi32(0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL));
#endif

    
    ROUND( 0 );
    ROUND( 1 );
    ROUND( 2 );
    ROUND( 3 );
    ROUND( 4 );
    ROUND( 5 );
    ROUND( 6 );
    ROUND( 7 );
    ROUND( 8 );
    ROUND( 9 );

    row1 = _mm_xor_si128( iv0, _mm_xor_si128( row1, row3 ) );
    row2 = _mm_xor_si128( iv1, _mm_xor_si128( row2, row4 ) );
  }

  do
  {
#if defined(HAVE_SSE41)
    __m128i m0, m1, m2, m3;
#else
    uint32_t m0, m1, m2, m3, m4, m5, m6, m7;
    uint32_t m8, m9, m10, m11, m12, m13, m14, m15;
#endif

    const __m128i iv0 = row1;
    const __m128i iv1 = row2;

    ctr += inlen;
  
    if(inlen & 64) 
    {
#if defined(HAVE_SSE41)
      m0 = LOADU( in +  00 );
      m1 = LOADU( in +  16 );
      m2 = LOADU( in +  32 );
      m3 = LOADU( in +  48 );
#else
      m0 = ( ( uint32_t * )in )[ 0];
      m1 = ( ( uint32_t * )in )[ 1];
      m2 = ( ( uint32_t * )in )[ 2];
      m3 = ( ( uint32_t * )in )[ 3];
      m4 = ( ( uint32_t * )in )[ 4];
      m5 = ( ( uint32_t * )in )[ 5];
      m6 = ( ( uint32_t * )in )[ 6];
      m7 = ( ( uint32_t * )in )[ 7];
      m8 = ( ( uint32_t * )in )[ 8];
      m9 = ( ( uint32_t * )in )[ 9];
      m10 = ( ( uint32_t * )in )[10];
      m11 = ( ( uint32_t * )in )[11];
      m12 = ( ( uint32_t * )in )[12];
      m13 = ( ( uint32_t * )in )[13];
      m14 = ( ( uint32_t * )in )[14];
      m15 = ( ( uint32_t * )in )[15];
#endif
    }
    else
    {
      ALIGN(16) uint8_t buffer[64]  = {0};
      uint8_t *p = buffer;
      if(inlen & 32)
      {
        STORE(p + 00, LOADU(in + 00));
        STORE(p + 16, LOADU(in + 16));
        p += 32; in += 32;
      }
      if(inlen & 16)
      {
        STORE(p + 00, LOADU(in + 00));
        p += 16; in += 16;
      }
      if(inlen & 8)
      {
        *(uint64_t*)p = *(uint64_t*)in; p += 8; in += 8; 
      }
      if(inlen & 4)
      {
        *(uint32_t*)p = *(uint32_t*)in; p += 4; in += 4; 
      }
      if(inlen & 2)
      {
        *(uint16_t*)p = *(uint16_t*)in; p += 2; in += 2; 
      }
      if(inlen & 1)
      {
        *p = *in;
      }
#if defined(HAVE_SSE41)
      m0 = LOADU( buffer +  00 );
      m1 = LOADU( buffer +  16 );
      m2 = LOADU( buffer +  32 );
      m3 = LOADU( buffer +  48 );
#else
      m0 = ( ( uint32_t * )buffer )[ 0];
      m1 = ( ( uint32_t * )buffer )[ 1];
      m2 = ( ( uint32_t * )buffer )[ 2];
      m3 = ( ( uint32_t * )buffer )[ 3];
      m4 = ( ( uint32_t * )buffer )[ 4];
      m5 = ( ( uint32_t * )buffer )[ 5];
      m6 = ( ( uint32_t * )buffer )[ 6];
      m7 = ( ( uint32_t * )buffer )[ 7];
      m8 = ( ( uint32_t * )buffer )[ 8];
      m9 = ( ( uint32_t * )buffer )[ 9];
      m10 = ( ( uint32_t * )buffer )[10];
      m11 = ( ( uint32_t * )buffer )[11];
      m12 = ( ( uint32_t * )buffer )[12];
      m13 = ( ( uint32_t * )buffer )[13];
      m14 = ( ( uint32_t * )buffer )[14];
      m15 = ( ( uint32_t * )buffer )[15];
#endif
    }

    row3 = _mm_setr_epi32(0x6A09E667UL, 0xBB67AE85UL, 0x3C6EF372UL, 0xA54FF53AUL);
    row4 = _mm_xor_si128(_mm_set_epi64x(0xFFFFFFFFULL, ctr), 
                         _mm_setr_epi32(0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL));

    ROUND( 0 );
    ROUND( 1 );
    ROUND( 2 );
    ROUND( 3 );
    ROUND( 4 );
    ROUND( 5 );
    ROUND( 6 );
    ROUND( 7 );
    ROUND( 8 );
    ROUND( 9 );

    row1 = _mm_xor_si128( iv0, _mm_xor_si128( row1, row3 ) );
    row2 = _mm_xor_si128( iv1, _mm_xor_si128( row2, row4 ) );

    STOREU(out + 00, row1);
    STOREU(out + 16, row2);
  } while(0);
  return 0;
}

#if defined(BLAKE2S_SELFTEST)
#include <string.h>
#include "blake2-kat.h"
int main( int argc, char **argv )
{
  uint8_t key[BLAKE2S_KEYBYTES];
  uint8_t buf[KAT_LENGTH];

  for( size_t i = 0; i < BLAKE2S_KEYBYTES; ++i )
    key[i] = ( uint8_t )i;

  for( size_t i = 0; i < KAT_LENGTH; ++i )
    buf[i] = ( uint8_t )i;

  for( size_t i = 0; i < KAT_LENGTH; ++i )
  {
    uint8_t hash[BLAKE2S_OUTBYTES];
    crypto_hash(hash, buf, i);

    if( 0 != memcmp( hash, blake2s_kat[i], BLAKE2S_OUTBYTES ) )
    {
      puts( "error" );
      return -1;
    }
  }

  puts( "ok" );
  return 0;
}
#endif


