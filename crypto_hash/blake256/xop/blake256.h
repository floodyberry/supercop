
#ifndef __BLAKE256_X86_H__
#define __BLAKE256_X86_H__

#include <string.h>
#include <stdio.h>
#include <x86intrin.h> /* gcc specific, also works for icc */

/*
 * Available switches:
 *  - HAVE_SSSE3
 *  - HAVE_SSE41
 *  - HAVE_XOP
 *  - CACHE_MESSAGE 
 *  - NOT_SUPERCOP
 */

#include "config.h"

#ifdef HAVE_AVX2
#ifndef HAVE_SSE41
#define HAVE_SSE41
#endif
#endif

#ifdef HAVE_XOP
#ifndef HAVE_SSE41
#define HAVE_SSE41
#endif
#endif

#ifdef HAVE_SSE41
#ifndef HAVE_SSSE3
#define HAVE_SSSE3
#endif
#endif

#ifdef HAVE_SSSE3
#endif


#ifndef NOT_SUPERCOP
#include "crypto_hash.h"
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8;
#else
typedef unsigned long long u64; 
typedef unsigned int u32; 
typedef unsigned char u8;
#endif

/* Generic macros*/

#define U8TO32(p)         \
  (((u32)((p)[0]) << 24) | ((u32)((p)[1]) << 16) |  \
   ((u32)((p)[2]) <<  8) | ((u32)((p)[3])      ))
#define U32TO8(p, v)          \
  (p)[0] = (u8)((v) >> 24); (p)[1] = (u8)((v) >> 16); \
  (p)[2] = (u8)((v) >>  8); (p)[3] = (u8)((v)      );

#define LOAD(p)  _mm_load_si128( (__m128i *)(p) )
#define STORE(p,r) _mm_store_si128((__m128i *)(p), r)

#define LOADU(p)  _mm_loadu_si128( (__m128i *)(p) )
#define STOREU(p,r) _mm_storeu_si128((__m128i *)(p), r)

#define TOF(reg) _mm_castsi128_ps((reg))
#define TOI(reg) _mm_castps_si128((reg))

#define LIKELY(x) __builtin_expect((x),1)

/* Microarchitecture-specific macros */

#ifdef HAVE_XOP // vpperm is 1 cycle faster than pshufb
#define BYTE_SHUFFLE(r,m)  \
do \
{ \
    (r) = _mm_perm_epi8((r),(r),(m)); \
} while(0) 
#elif defined(HAVE_SSSE3)
#define BYTE_SHUFFLE(r,m)  \
    (r) = _mm_shuffle_epi8((r),(m)); 
#else
#error "I should not be here!"
#endif

#ifdef HAVE_SSSE3
#define BSWAP32(r) \
    BYTE_SHUFFLE(r,u8to32); 
#else
#define BSWAP32(r) do { \
   r = _mm_shufflehi_epi16(r, _MM_SHUFFLE(2, 3, 0, 1)); \
   r = _mm_shufflelo_epi16(r, _MM_SHUFFLE(2, 3, 0, 1)); \
   r = _mm_xor_si128(_mm_slli_epi16(r, 8), _mm_srli_epi16(r, 8)); \
} while(0)
#endif

#ifndef HAVE_XOP
  #ifdef HAVE_SSSE3
      #define _mm_roti_epi32(r, c) ((8==-c) ? _mm_shuffle_epi8(r,r8) : ( (16==-c) ? _mm_shuffle_epi8(r,r16) :  _mm_xor_si128(_mm_srli_epi32( (r), -(c) ),_mm_slli_epi32( (r), 32-(-c) )) ) )
  #else
      #define _mm_roti_epi32(r, c) _mm_xor_si128(_mm_srli_epi32( (r), -(c) ),_mm_slli_epi32( (r), 32-(-c) ))
  #endif
#endif

//#include "permute.h"


#define SET_INITIAL_STATE(row1,row2,row3,row4) \
  row1 = LOAD(&state->h[0]); \
  row2 = LOAD(&state->h[4]); \
  row3 = _mm_set_epi32(0x03707344, 0x13198A2E, 0x85A308D3, 0x243F6A88); \
  row4 = _mm_set_epi32(0xEC4E6C89, 0x082EFA98, 0x299F31D0, 0xA4093822); \
  s1 = _mm_shuffle_epi32(_mm_cvtsi32_si128(state->nullt), 0); \
  s2 = _mm_cmpeq_epi32(s1, _mm_setzero_si128()); \
  t0 = _mm_cvtsi32_si128(state->t[0]); \
  t1 = _mm_cvtsi32_si128(state->t[1]); \
  s0 = TOI(_mm_shuffle_ps(TOF(t0), TOF(t1), _MM_SHUFFLE(0,0,0,0))); \
  row4 = _mm_xor_si128(row4, _mm_and_si128(s0, s2)); \


#include "rounds.h"

//
//#define G(r,row1,row2,row3,row4,buf1,buf2) \
//do \
//{ \
//  row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); \
//  row4 = _mm_xor_si128( row4, row1 ); \
//  row4 = _mm_roti_epi32(row4, -16); \
//  row3 = _mm_add_epi32( row3, row4 );   \
//  row2 = _mm_xor_si128( row2, row3 ); \
//  row2 = _mm_roti_epi32(row2, -12); \
//  row1 = _mm_add_epi32( _mm_add_epi32( row1, buf2), row2 ); \
//  row4 = _mm_xor_si128( row4, row1 ); \
//  row4 = _mm_roti_epi32(row4, -8); \
//  row3 = _mm_add_epi32( row3, row4 );   \
//  row2 = _mm_xor_si128( row2, row3 ); \
//  row2 = _mm_roti_epi32(row2, -7); \
//} while(0)
//
//#define DIAGONALIZE(r,row1,row2,row3,row4) \
//do \
//{ \
//  row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); \
//  row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); \
//  row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); \
//} while(0)
//
//#define UNDIAGONALIZE(r,row1,row2,row3,row4) \
//do \
//{ \
//  row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); \
//  row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); \
//  row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); \
//} while(0)
//
//#define ROUND(r) \
//do \
//{ \
//  /*LOAD_MSG(r);*/ LOAD_MSG##r; \
//  G(r,row1,row2,row3,row4,buf1,buf2); \
//  DIAGONALIZE(r,row1,row2,row3,row4); \
//  G(r,row1,row2,row3,row4,buf3,buf4); \
//  UNDIAGONALIZE(r,row1,row2,row3,row4); \
//} while(0)


#define DEBUG(r) print_xmm((r))

static void print_xmm(const __m128i xmm)
{
    printf("%08X %08X %08X %08X\n", 
            _mm_extract_epi32(xmm, 3), 
            _mm_extract_epi32(xmm, 2), 
            _mm_extract_epi32(xmm, 1), 
            _mm_extract_epi32(xmm, 0));
}

#endif



