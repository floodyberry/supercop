/*
// HS1-SIV Draft v2.0 x86-64-only code.
//
// Note: This implements HS1-SIV Draft v2, and not v1.
//
// ** This version might be susceptible to side-channel attacks. **
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified 15 May 2014.
// Modified with x86-64/SSE* intrinsics  by Romain Dolbeau (romain@dolbeau.org)
// Current version : $Date$
//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
//
// The authors knows of no intellectual property claims relevant to this work.
*/

/* Exactly one of the following should be set */
#define HS1_SIV_LO  0
#define HS1_SIV     1
#define HS1_SIV_HI  0

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     I n c l u d e s   a n d   u t i l i t i e s
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "api.h"
#include "crypto_aead.h"

#include <smmintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#if HS1_SIV_LO
#error "This code only supports HS1_SIV"
#elif HS1_SIV
// beware, the four macros are assumed to 64/4/12/16 in some places
#define HS1_SIV_NH_LEN      64
#define HS1_SIV_HASH_RNDS    4
#define HS1_SIV_CHACHA_RNDS 12
#define HS1_SIV_SIV_LEN     16
#elif HS1_SIV_HI
#error "This code only supports HS1_SIV"
#endif

#define __STDC_LIMIT_MACROS
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#if defined(__INTEL_COMPILER) || defined(_MSC_VER)
#define ALIGN16 __declspec(align(16))
#define ALIGN32 __declspec(align(32))
#define ALIGN64 __declspec(align(64))
#else // assume GCC
#define ALIGN16  __attribute__((aligned(16)))
#define ALIGN32  __attribute__((aligned(32)))
#define ALIGN64  __attribute__((aligned(64)))
#define _bswap64(a) __builtin_bswap64(a)
#define _bswap(a) __builtin_bswap(a)
#endif

ALIGN16
typedef struct {
    unsigned char chacha_key[32];
    unsigned char nh_key[HS1_SIV_NH_LEN+16*(HS1_SIV_HASH_RNDS-1)];
    unsigned char poly_key[HS1_SIV_HASH_RNDS*8];
} hs1siv_ctx_t;

/* Little-endian reads and writes. */
// we're on x86-64, so always LE
static inline uint32_t read32le(const uint32_t *p) {return *p; };
static inline uint64_t read64le(const uint64_t *p) {return *p; };
static inline void write32le(uint32_t *p, const uint32_t w) { *p = w; }
static inline void write64le(uint64_t *p, const uint64_t w) { *p = w; }

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     C h a c h a   S e c t i o n -- Implementation borrowed from R. Dolbeau
 *                       itself based on the implementation by D.J. Bernstein
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

typedef struct { uint32_t input[16]; } chacha_ctx_t;

#ifndef __INTEL_COMPILER
static uint32_t rotl(const uint32_t x, const unsigned n) { return (x<<n) | (x>>(32-n)); }
#else
#define rotl(x,n) _rotl(x,n)
#endif

#define QUARTERROUND(a,b,c,d) \
  x[a] += x[b]; x[d] = rotl(x[d] ^ x[a],16); \
  x[c] += x[d]; x[b] = rotl(x[b] ^ x[c],12); \
  x[a] += x[b]; x[d] = rotl(x[d] ^ x[a], 8); \
  x[c] += x[d]; x[b] = rotl(x[b] ^ x[c], 7);

static inline void salsa20_wordtobyte(unsigned char output[64],const uint32_t input[16])
{
  uint32_t i, x[16];

  for (i = 0;i < 16;++i) x[i] = input[i];
  for (i = HS1_SIV_CHACHA_RNDS;i != 0;i -= 2) {
    QUARTERROUND( 0, 4, 8,12)
    QUARTERROUND( 1, 5, 9,13)
    QUARTERROUND( 2, 6,10,14)
    QUARTERROUND( 3, 7,11,15)
    QUARTERROUND( 0, 5,10,15)
    QUARTERROUND( 1, 6,11,12)
    QUARTERROUND( 2, 7, 8,13)
    QUARTERROUND( 3, 4, 9,14)
  }
  for (i = 0;i < 16;++i) x[i] += input[i];
  for (i = 0;i < 16;++i) write32le((uint32_t *)(output + 4 * i),x[i]);
}

static const char sigma[] = "expand 32-byte k";
static const char tau[] = "expand 16-byte k";

static inline void chacha_keysetup(chacha_ctx_t *x, const unsigned char *k, const unsigned kbits)
{
  const char *constants;

  x->input[4] = read32le((uint32_t *)(k + 0));
  x->input[5] = read32le((uint32_t *)(k + 4));
  x->input[6] = read32le((uint32_t *)(k + 8));
  x->input[7] = read32le((uint32_t *)(k + 12));
  if (kbits == 256) { /* recommended */
    k += 16;
    constants = sigma;
  } else { /* kbits == 128 */
    constants = tau;
  }
  x->input[8] = read32le((uint32_t *)(k + 0));
  x->input[9] = read32le((uint32_t *)(k + 4));
  x->input[10] = read32le((uint32_t *)(k + 8));
  x->input[11] = read32le((uint32_t *)(k + 12));
  x->input[0] = read32le((uint32_t *)(constants + 0));
  x->input[1] = read32le((uint32_t *)(constants + 4));
  x->input[2] = read32le((uint32_t *)(constants + 8));
  x->input[3] = read32le((uint32_t *)(constants + 12));
}

static inline void chacha_ivsetup(chacha_ctx_t *x,const unsigned char *iv)
{
  x->input[12] = 0;
  x->input[13] = read32le((uint32_t *)(iv + 0)); /* Modified for 12-byte iv */
  x->input[14] = read32le((uint32_t *)(iv + 4));
  x->input[15] = read32le((uint32_t *)(iv + 8));
}

/* custom version of chacha/12rnds generating 176 bytes, with no input message to XOR in */
static inline void chacha_noxor176(chacha_ctx_t *x_, unsigned char *c_)
{
  unsigned i;

#define u8 unsigned char
#define u32 unsigned int
#define u64 unsigned long long

  u32* x = (u32*)&x_->input;
  u8* out = c_;

#include "c176.h"

#undef u64
#undef u32
#undef u8
}

/* custom version of chacha/12rnds generating 16 bytes, with no input message to XOR in */
static inline void chacha_noxor16(chacha_ctx_t *x_, unsigned char *c_)
{
  unsigned i;

#define u8 unsigned char
#define u32 unsigned int
#define u64 unsigned long long

  u32* x = (u32*)&x_->input;
  u8* out = c_;

#include "c16.h"

#undef u64
#undef u32
#undef u8
}

/* standard chacha/12 rnds, arbitrary lenght & XOR with a message */
static inline void chacha_xor(chacha_ctx_t *x_,const unsigned char *m,unsigned char *c_,unsigned bytes)
{
  unsigned char output[64];
  unsigned i;

#define u8 unsigned char
#define u32 unsigned int
#define u64 unsigned long long

  u32* x = (u32*)&x_->input;
  u8* out = c_;

#if 1
#include "u4.h"
#endif

#if 1
#include "u1.h"
#endif

#undef u64
#undef u32
#undef u8

  if (!bytes) return;
  for (;;) {
    salsa20_wordtobyte(output,x);
    x[12]++;
    if (bytes <= 64) {
#ifndef CHACHA_NO_XOR
      for (i = 0;i < bytes;++i) out[i] = m[i] ^ output[i];
#else
      for (i = 0;i < bytes;++i) out[i] = output[i];
#endif
      return;
    }
#ifndef CHACHA_NO_XOR
    for (i = 0;i < 64;++i) out[i] = m[i] ^ output[i];
#else
    for (i = 0;i < 64;++i) out[i] = output[i];
#endif
    bytes -= 64;
    out += 64;
    m += 64;
  }
}

static inline void hs1siv_chacha256(void *out, const unsigned outbytes, const unsigned char *iv, const void *user_key)
{
    chacha_ctx_t ctx;
    chacha_keysetup(&ctx, user_key, 256);
    chacha_ivsetup(&ctx,iv);
    chacha_noxor176(&ctx,out);
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     H S 1 - H a s h   S e c t i o n
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

static const uint64_t m60 = ((uint64_t)1 << 60) - 1;
static const uint64_t m61 = ((uint64_t)1 << 61) - 1;

/* Return 62 bits congruent to ak+m mod (2^61-1). Assumes 60-bit k, m; 62-bit a */
static inline uint64_t poly_step(const uint64_t a, const uint64_t m, const uint64_t k) {
  __uint128_t tmp = (const __uint128_t)a * (const __uint128_t)k;
  return ((uint64_t)tmp & m61) + (uint64_t)(tmp >> 61) + m;
}

static inline uint64_t poly_finalize(const uint64_t b) {
    uint64_t a = b;
    a = (a & m61) + (a >> 61);   /* a may be 62 bits, so one final reduction */
    if (a == m61) a = 0;
    return a;
}

static inline void prf_hash2_2_finalize(uint64_t *h, const uint64_t s[4]) {
    uint64_t s0_1, s1_1;
    uint64_t s0_2, s1_2;
    s0_1 = poly_finalize(s[0]);
    s1_1 = poly_finalize(s[1]);
    s0_2 = poly_finalize(s[2]);
    s1_2 = poly_finalize(s[3]);
    write64le(h+0, s0_1);
    write64le(h+1, s1_1);
    write64le(h+2, s0_2);
    write64le(h+3, s1_2);
}

/* does all 2 hashes at once */
static inline void prf_hash2_2(uint64_t s[4], const uint32_t *in,  unsigned inbytes, const uint32_t *nhkey, const uint64_t *polykey) {
    uint64_t s0_1 = 1, s1_1 = 1;
    uint64_t s0_2 = 1, s1_2 = 1;
    unsigned i=0, j;
    s0_1 = s[0];
    s1_1 = s[1];
    s0_2 = s[2];
    s1_2 = s[3];

    /* do the 32 bits addition, then unpack to 64 bits value
       (high 32 bits are zero) then do the 32x32->64 multiplications */
#define BLOCKADD(s, I, X, A, B, H)                                      \
    __m128i av00##I##X##s##H = _mm_add_epi32(inv##X##H, kv##A##H);      \
    __m128i av04##I##X##s##H = _mm_add_epi32(inv##X##H, kv##B##H)
#define BLOCKUNPACK(s, I, X, H)                                         \
    __m128i av00lo64##I##X##s##H = _mm_unpacklo_epi32(av00##I##X##s##H, _mm_setzero_si128()); \
    __m128i av00hi64##I##X##s##H = _mm_unpackhi_epi32(av00##I##X##s##H, _mm_setzero_si128()); \
    __m128i av04lo64##I##X##s##H = _mm_unpacklo_epi32(av04##I##X##s##H, _mm_setzero_si128()); \
    __m128i av04hi64##I##X##s##H = _mm_unpackhi_epi32(av04##I##X##s##H, _mm_setzero_si128())
#define BLOCKMUL(s, I, X, H)                                              \
    __m128i p0##I##X##s##H = _mm_mul_epu32(av00lo64##I##X##s##H, av00hi64##I##X##s##H); \
    __m128i p1##I##X##s##H = _mm_mul_epu32(av04lo64##I##X##s##H, av04hi64##I##X##s##H)
    
#define BLOCK(s, I, X, A, B)                                            \
    BLOCKADD(s, I, X, A, B, l);                                         \
    BLOCKADD(s, I, X, A, B, h);                                         \
    BLOCKUNPACK(s, I, X, l);                                            \
    BLOCKUNPACK(s, I, X, h);                                            \
    BLOCKMUL(s, I, X, l);                                                 \
    BLOCKMUL(s, I, X, h)
    
    /* accumulate the 64 bits products */
#define SUM(s, I)                                               \
    __m128i p0##I##s##l = _mm_add_epi64(p0##I##a##s##l,p0##I##b##s##l); \
    __m128i p0##I##s##h = _mm_add_epi64(p0##I##a##s##h,p0##I##b##s##h); \
    __m128i p1##I##s##l = _mm_add_epi64(p1##I##a##s##l,p1##I##b##s##l); \
    __m128i p1##I##s##h = _mm_add_epi64(p1##I##a##s##h,p1##I##b##s##h)
    
    /* do the final (horizontal) accumulation, and compute the
       poly_step()s for the block ; multiple variants */
#define ACCANDSTORE(s, I)                                               \
    __m128i p01##I##lo64##s##l = _mm_unpacklo_epi64(p0##I##s##l,p1##I##s##l); \
    __m128i p01##I##lo64##s##h = _mm_unpacklo_epi64(p0##I##s##h,p1##I##s##h); \
    __m128i p01##I##hi64##s##l = _mm_unpackhi_epi64(p0##I##s##l,p1##I##s##l); \
    __m128i p01##I##hi64##s##h = _mm_unpackhi_epi64(p0##I##s##h,p1##I##s##h); \
    __m128i ps01##I##s##l = _mm_add_epi64(p01##I##lo64##s##l, p01##I##hi64##s##l); \
    __m128i ps01##I##s##h = _mm_add_epi64(p01##I##lo64##s##h, p01##I##hi64##s##h); \
                                                                        \
    __m128i s01##I##s = _mm_add_epi64(ps01##I##s##l,ps01##I##s##h);     \
    __m128i s01##I##s##m60 = _mm_and_si128(s01##I##s, _mm_set1_epi64x(m60)); \
    _mm_store_si128((__m128i*)ia0,s01##I##s##m60);                      \
    s0_##I = poly_step(s0_##I, ia0[0], polykey[(2*I)-2]);               \
    s1_##I = poly_step(s1_##I, ia0[1], polykey[(2*I)-1])
    
#define ACCANDSTORENOPOLY(s, I)                                               \
    __m128i p01##I##lo64##s##l = _mm_unpacklo_epi64(p0##I##s##l,p1##I##s##l); \
    __m128i p01##I##lo64##s##h = _mm_unpacklo_epi64(p0##I##s##h,p1##I##s##h); \
    __m128i p01##I##hi64##s##l = _mm_unpackhi_epi64(p0##I##s##l,p1##I##s##l); \
    __m128i p01##I##hi64##s##h = _mm_unpackhi_epi64(p0##I##s##h,p1##I##s##h); \
    __m128i ps01##I##s##l = _mm_add_epi64(p01##I##lo64##s##l, p01##I##hi64##s##l); \
    __m128i ps01##I##s##h = _mm_add_epi64(p01##I##lo64##s##h, p01##I##hi64##s##h); \
                                                                        \
    __m128i s01##I##s = _mm_add_epi64(ps01##I##s##l,ps01##I##s##h);     \
    __m128i s01##I##s##m60 = _mm_and_si128(s01##I##s, _mm_set1_epi64x(m60)); \
    _mm_store_si128((__m128i*)ia0,s01##I##s##m60)
    
#define POLYONLY(s, I)                                                  \
    s0_##I = poly_step(s0_##I, ia##I[s][0], polykey[(2*I)-2]);        \
    s1_##I = poly_step(s1_##I, ia##I[s][1], polykey[(2*I)-1])
    
    /* do all steps for all 3 hashes */
#define ALL2HASH_SEQ(s)                             \
    BLOCK(s, 1, a,  0,  4);                         \
    BLOCK(s, 1, b,  8, 12);                         \
    SUM(s, 1);                                      \
    ACCANDSTORE(s, 1);                              \
    BLOCK(s, 2, a,  8, 12);                         \
    BLOCK(s, 2, b, 16, 20);                         \
    SUM(s, 2);                                      \
    ACCANDSTORE(s, 2)
    
#define ALL2HASH_INTER(s)                           \
    BLOCK(s, 1, a,  0,  4);                         \
    BLOCK(s, 2, a,  8, 12);                         \
    BLOCK(s, 1, b,  8, 12);                         \
    BLOCK(s, 2, b, 16, 20);                         \
    SUM(s, 1);                                      \
    SUM(s, 2);                                      \
    ACCANDSTORE(s, 1);                              \
    ACCANDSTORE(s, 2)

#define ALL2HASH(s) ALL2HASH_SEQ(s)

#define ALL2HASHNOPOLY(s)                           \
    BLOCK(s, 1, a,  0,  4);                         \
    BLOCK(s, 1, b,  8, 12);                         \
    SUM(s, 1);                                      \
    ACCANDSTORENOPOLY(s, 1);                        \
    BLOCK(s, 2, a,  8, 12);                         \
    BLOCK(s, 2, b, 16, 20);                         \
    SUM(s, 2);                                      \
    ACCANDSTORENOPOLY(s, 2)

#define ALL2HASHPOLYONLY(s)                     \
    POLYONLY(s, 1);                             \
    POLYONLY(s, 2)
      
    /* Hash full blocks of HS1_SIV_NH_LEN bytes */
    for ( ; inbytes >= HS1_SIV_NH_LEN; inbytes -= HS1_SIV_NH_LEN, in += HS1_SIV_NH_LEN/4) {
      ALIGN32 uint64_t ia0[4];
      ALIGN32 uint64_t ia1[4];

        // assume HS1_SIV_NH_LEN == 64 -> 2 iterations -> full unroll, less scalar reduction
          __m128i kv0l  = _mm_loadu_si128((const __m128i*)(nhkey+ 0)); // 1
          __m128i kv0h  = _mm_loadu_si128((const __m128i*)(nhkey+ 4)); // 1
          __m128i kv4l  = kv0h; // 1
          __m128i kv4h  = _mm_loadu_si128((const __m128i*)(nhkey+ 8)); // 1
          __m128i kv8l  = kv4h; // 1, 2
          __m128i kv8h  = _mm_loadu_si128((const __m128i*)(nhkey+12)); // 1, 2
          __m128i kv12l = kv8h; // 1, 2
          __m128i kv12h = _mm_loadu_si128((const __m128i*)(nhkey+16)); // 1, 2
          __m128i kv16l = kv12h; // 2
          __m128i kv16h = _mm_loadu_si128((const __m128i*)(nhkey+20)); // 2
          __m128i kv20l = kv16h; // 2
          __m128i kv20h = _mm_loadu_si128((const __m128i*)(nhkey+24)); // 2

          __m128i inval = _mm_loadu_si128((const __m128i*)(in+ 0));
          __m128i invah = _mm_loadu_si128((const __m128i*)(in+ 4));
          __m128i invbl = _mm_loadu_si128((const __m128i*)(in+ 8));
          __m128i invbh = _mm_loadu_si128((const __m128i*)(in+12));

          ALL2HASH(0);
    }
    /* If partial block remains, hash it */
    i=0;
    if (inbytes != 0) {
        uint64_t a0_1 = 0, a1_1 = 0;
        uint64_t a0_2 = 0, a1_2 = 0;
        while (inbytes >= 16) {
          ALIGN32 uint64_t ia[4];
          __m128i inv0 = _mm_loadu_si128((const __m128i*)(in+i));

          __m128i kv0l  = _mm_loadu_si128((const __m128i*)(nhkey+i+ 0));
          __m128i kv0h  = _mm_loadu_si128((const __m128i*)(nhkey+i+ 4));
          __m128i kv8l  = _mm_loadu_si128((const __m128i*)(nhkey+i+ 8));
          __m128i kv8h  = _mm_loadu_si128((const __m128i*)(nhkey+i+12));

          __m128i av0l  = _mm_add_epi32(inv0, kv0l); /* A, B, C, D, E, F, G, H */
          __m128i av0h  = _mm_add_epi32(inv0, kv0h); /* A, B, C, D, E, F, G, H */
          __m128i av8l  = _mm_add_epi32(inv0, kv8l);
          __m128i av8h  = _mm_add_epi32(inv0, kv8h);
          
          __m128i av0lo64l = _mm_unpacklo_epi32(av0l, _mm_setzero_si128()); /* 0A, 0B, 0E, 0F */
          __m128i av0lo64h = _mm_unpacklo_epi32(av0h, _mm_setzero_si128()); /* 0A, 0B, 0E, 0F */
          __m128i av0hi64l = _mm_unpackhi_epi32(av0l, _mm_setzero_si128()); /* 0C, 0D, 0G, 0H */
          __m128i av0hi64h = _mm_unpackhi_epi32(av0h, _mm_setzero_si128()); /* 0C, 0D, 0G, 0H */
          __m128i av8lo64l = _mm_unpacklo_epi32(av8l, _mm_setzero_si128());
          __m128i av8lo64h = _mm_unpacklo_epi32(av8h, _mm_setzero_si128());
          __m128i av8hi64l = _mm_unpackhi_epi32(av8l, _mm_setzero_si128());
          __m128i av8hi64h = _mm_unpackhi_epi32(av8h, _mm_setzero_si128());

          __m128i p1l = _mm_mul_epu32(av0lo64l, av0hi64l);
          __m128i p1h = _mm_mul_epu32(av0lo64h, av0hi64h);
          __m128i p2l = _mm_mul_epu32(av8lo64l, av8hi64l);
          __m128i p2h = _mm_mul_epu32(av8lo64h, av8hi64h);
          _mm_store_si128((__m128i*)(ia+0), p1l);
          _mm_store_si128((__m128i*)(ia+2), p1h);
          a0_1 += ia[0]+ia[1];
          a1_1 += ia[2]+ia[3];
          _mm_store_si128((__m128i*)(ia+0), p2l);
          _mm_store_si128((__m128i*)(ia+2), p2h);
          a0_2 += ia[0]+ia[1];
          a1_2 += ia[2]+ia[3];

          i += 4; inbytes -= 16;
        }
#ifdef FULL_HS1
        if (inbytes) {
          /* will never be touched in HS1-SIV, as all values are multiple of 16 */
          /* but defined for HS1 itself */
            uint32_t tail[4] = {0,0,0,0};
            for (j=0;j<inbytes;j++)
                ((unsigned char *)tail)[j] = ((unsigned char *)(in+i))[j];
            a0_1 += (uint64_t)(tail[0] + nhkey[i+0]) * (tail[2] + nhkey[i+2]);
            a0_1 += (uint64_t)(tail[1] + nhkey[i+1]) * (tail[3] + nhkey[i+3]);
            a1_1 += (uint64_t)(tail[0] + nhkey[i+4]) * (tail[2] + nhkey[i+6]);
            a1_1 += (uint64_t)(tail[1] + nhkey[i+5]) * (tail[3] + nhkey[i+7]);

            a0_2 += (uint64_t)(tail[0] + nhkey[i+8]) * (tail[2] + nhkey[i+10]);
            a0_2 += (uint64_t)(tail[1] + nhkey[i+9]) * (tail[3] + nhkey[i+11]);
            a1_2 += (uint64_t)(tail[0] + nhkey[i+12]) * (tail[2] + nhkey[i+14]);
            a1_2 += (uint64_t)(tail[1] + nhkey[i+13]) * (tail[3] + nhkey[i+15]);

            a0_1 += inbytes;
            a1_1 += inbytes;
            a0_2 += inbytes;
            a1_2 += inbytes;
        }
#endif
        s0_1 = poly_step(s0_1, a0_1&m60, polykey[0]);
        s1_1 = poly_step(s1_1, a1_1&m60, polykey[1]);
        s0_2 = poly_step(s0_2, a0_2&m60, polykey[2]);
        s1_2 = poly_step(s1_2, a1_2&m60, polykey[3]);
    }
    s[0] = s0_1;
    s[1] = s1_1;
    s[2] = s0_2;
    s[3] = s1_2;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     P R F   S e c t i o n
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

static inline void hs1siv_subkeygen(hs1siv_ctx_t *ctx, void *user_key, unsigned key_bytes)
{
    unsigned char chacha_key[32];
    unsigned char iv[12] = {0};
    unsigned i=0;

    /* Copy user_key as many times as needed to fill 32 byte chacha key */
    while (i < 32) {
        unsigned nbytes = 32-i;
        if (nbytes > key_bytes) nbytes = key_bytes;
        memcpy(chacha_key+i,user_key,nbytes);
        i += nbytes;
    }

    /* Build key-derivation nonce and fill context */
    iv[0] = key_bytes;
    iv[2] = HS1_SIV_SIV_LEN;
    iv[4] = HS1_SIV_CHACHA_RNDS;
    iv[5] = HS1_SIV_HASH_RNDS;
    iv[6] = HS1_SIV_NH_LEN;
    hs1siv_chacha256(ctx, sizeof(hs1siv_ctx_t), iv, chacha_key);

    for (i=0; i<sizeof(ctx->poly_key)/8; i++)
      ((uint64_t *)ctx->poly_key)[i] = read64le(((uint64_t *)ctx->poly_key)+i) & m60;
}

/* hash the data (associated data & encrypted data) */
static inline void hs1_data(unsigned char tmp_t[HS1_SIV_SIV_LEN], 
                       uint64_t h[HS1_SIV_HASH_RNDS],
                       uint64_t s[HS1_SIV_HASH_RNDS],
                       const hs1siv_ctx_t *hs1_ctx,
                       const unsigned char* a, const unsigned abytes, const unsigned char* m, const unsigned mbytes) {
  unsigned char tmp_h[HS1_SIV_NH_LEN];
  unsigned i, j, k;
  unsigned atot, mtot, arnd64, mrnd64;
  unsigned donesizes;
  s[0] = s[1] = s[2] = s[3] = 1;
  atot = ((abytes+HS1_SIV_NH_LEN-1)&~(HS1_SIV_NH_LEN-1));
  mtot = ((mbytes+15)&~15);
  arnd64 = abytes & ~(HS1_SIV_NH_LEN-1);
  /* hash all HS1_SIV_NH_LEN blocks from A */
  if (arnd64 > 0)
    prf_hash2_2(s, (uint32_t *)a, arnd64, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  /* last one if needed */
  if (abytes > arnd64) {
    memset(tmp_h,0,HS1_SIV_NH_LEN);
    for (i = 0 ; i < (abytes-arnd64) ; i++)
      tmp_h[i] = ((unsigned char*)a)[arnd64+i];
    prf_hash2_2(s, (uint32_t *)tmp_h, HS1_SIV_NH_LEN, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  }
  donesizes = 0;
  /* hash message M */
  if (mbytes > 0) {
    /* hash all HS1_SIV_NH_LEN blocks from M */
    mrnd64 = mbytes&~(HS1_SIV_NH_LEN-1);
    if (mrnd64 > 0)
      prf_hash2_2(s, (uint32_t *)((unsigned char*)m), mrnd64, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
    /* hash last block of M, perhaps with sizes */
    memset(tmp_h,0,HS1_SIV_NH_LEN);
    j = mbytes - mrnd64;
    for (i = 0 ; i < j ; i++)
      tmp_h[i] = ((unsigned char*)m)[mrnd64+i];
    k = (j+15)&~15; /* 0,16,32,48,64 */
    if (k < HS1_SIV_NH_LEN) {
      (( uint64_t*)tmp_h)[2*(k/16)] = abytes;
      (( uint64_t*)tmp_h)[2*(k/16)+1] = mbytes;
      donesizes = 1;
      k += 16;
    }
    prf_hash2_2(s, (uint32_t *)tmp_h, k, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  }
  /* if we haven't hashed the sizes yet, need to do an extra block */
  if (!donesizes) {
    memset(tmp_h,0,HS1_SIV_NH_LEN);
    (( uint64_t*)tmp_h)[0] = abytes;
    (( uint64_t*)tmp_h)[1] = mbytes;
    donesizes = 1;
    prf_hash2_2(s, (uint32_t *)tmp_h, 16, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  }
  prf_hash2_2_finalize(h,s);
}

static inline void hs1siv_encrypt(hs1siv_ctx_t *hs1_ctx, void *m, unsigned mbytes, void *a, unsigned abytes, void *n, void *t, void *c)
{
    unsigned i;
    unsigned char tmp_t[HS1_SIV_SIV_LEN];
    unsigned char key[32];
    chacha_ctx_t chacha_ctx;
    uint64_t s[HS1_SIV_HASH_RNDS];
    uint64_t h[HS1_SIV_HASH_RNDS];
    hs1_data(tmp_t, h, s, hs1_ctx, a, abytes, m, mbytes);
    memcpy(key, hs1_ctx->chacha_key, 32);
    for (i=0; i<sizeof(h)/8;i++)
      ((uint64_t *)key)[i] ^= h[i];
    chacha_keysetup(&chacha_ctx, key, 256);
    chacha_ivsetup(&chacha_ctx,(unsigned char *)n);
    /* hardwire the non-xor & HS1_SIV_SIV_LEN == 16 */
    chacha_noxor16(&chacha_ctx, (unsigned char *)tmp_t);
    s[0] = s[1] = s[2] = s[3] = 1;
    prf_hash2_2(s, (uint32_t *)tmp_t, HS1_SIV_SIV_LEN, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
    prf_hash2_2_finalize(h,s);
    memcpy(key, hs1_ctx->chacha_key, 32);
    for (i=0; i<sizeof(h)/8;i++)
       ((uint64_t *)key)[i] ^= h[i];
    chacha_keysetup(&chacha_ctx, key, 256);
    chacha_ivsetup(&chacha_ctx,(unsigned char *)n);
    chacha_ctx.input[12] = 1;
    chacha_xor(&chacha_ctx, (unsigned char *)m, (unsigned char *)c, mbytes);
    memcpy(t,tmp_t,HS1_SIV_SIV_LEN);
}

static inline int hs1siv_decrypt(hs1siv_ctx_t *ctx, void *c, unsigned cbytes, void *a, unsigned abytes, void *n, void *t, void *m)
{
    unsigned i;
    unsigned char maybe_t[HS1_SIV_SIV_LEN];
    unsigned char *maybe_m = (unsigned char*)malloc(cbytes);
    uint64_t h[HS1_SIV_HASH_RNDS];
    uint64_t s[HS1_SIV_HASH_RNDS];
    unsigned char key[32];
    chacha_ctx_t chacha_ctx;
    int r;
    s[0] = s[1] = s[2] = s[3] = 1;
    prf_hash2_2(s, (uint32_t *)t, HS1_SIV_SIV_LEN, (uint32_t *)ctx->nh_key, (uint64_t *)ctx->poly_key);
    prf_hash2_2_finalize(h,s);
    memcpy(key, ctx->chacha_key, 32);
    for (i=0; i<sizeof(h)/8;i++)
       ((uint64_t *)key)[i] ^= h[i];
    chacha_keysetup(&chacha_ctx, key, 256);
    chacha_ivsetup(&chacha_ctx,(unsigned char *)n);
    chacha_ctx.input[12] = 1;
    chacha_xor(&chacha_ctx, (unsigned char *)c, (unsigned char *)maybe_m, cbytes);
    hs1_data(maybe_t, h, s, ctx, a, abytes, maybe_m, cbytes);
    memcpy(key, ctx->chacha_key, 32);
    for (i=0; i<sizeof(h)/8;i++)
      ((uint64_t *)key)[i] ^= h[i];
    chacha_keysetup(&chacha_ctx, key, 256);
    chacha_ivsetup(&chacha_ctx,(unsigned char *)n);
    /* hardwire the non-xor & HS1_SIV_SIV_LEN == 16 */
    chacha_noxor16(&chacha_ctx, (unsigned char *)maybe_t);
    if (memcmp(t,maybe_t,HS1_SIV_SIV_LEN) == 0) {
        memcpy(m,maybe_m,cbytes);
        free(maybe_m);
        r = 0;
    } else {
        free(maybe_m);
        r = -1;
    }
    return r;
}

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
)
{
    hs1siv_ctx_t ctx;
    /* the size of hs1siv_ctx_t is hardwired above */
    assert(sizeof(hs1siv_ctx_t) == 176);
    (void)nsec;
    hs1siv_subkeygen(&ctx, (void *)k, CRYPTO_KEYBYTES);
    if (clen) *clen = mlen+CRYPTO_ABYTES;
    hs1siv_encrypt(&ctx, (void *)m, mlen, (void *)ad, adlen, (void *)npub, c+mlen, c);
    return 0;
}

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
)
{
    hs1siv_ctx_t ctx;
    /* the size of hs1siv_ctx_t is hardwired above */
    assert(sizeof(hs1siv_ctx_t) == 176);
    (void)nsec;
    if (mlen) *mlen = clen-CRYPTO_ABYTES;
    hs1siv_subkeygen(&ctx, (void *)k, CRYPTO_KEYBYTES);
    return hs1siv_decrypt(&ctx, (void *)(c), clen-CRYPTO_ABYTES, (void *)ad, adlen, (void *)npub, (void *)(c+clen-CRYPTO_ABYTES), m);
}
