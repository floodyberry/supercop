/*
// HS1-SIV Draft v2.0 x86-64-only code.
//
// Note: This implements HS1-SIV Draft v2, and not v1.
//
// ** This version might be susceptible to side-channel attacks. **
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified 15 May 2014.
// Modified with x86-64/SSE* intrinsics  by Romain Dolbeau (romain@dolbeau.org)
// Current version : $Date: 2016/01/31 08:22:25 $
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
#define HS1_SIV     0
#define HS1_SIV_HI  1

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     I n c l u d e s   a n d   u t i l i t i e s
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "api.h"
#include "crypto_aead.h"

#include <arm_neon.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#if HS1_SIV_LO
#error "This code only supports HS1_SIV_HI"
#elif HS1_SIV
#error "This code only supports HS1_SIV_HI"
#elif HS1_SIV_HI
// beware, the four macros are assumed to 64/6/20/32 in some places
#define HS1_SIV_NH_LEN      64
#define HS1_SIV_HASH_RNDS    6
#define HS1_SIV_CHACHA_RNDS 20
#define HS1_SIV_SIV_LEN     CRYPTO_ABYTES
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
    unsigned char asu_key[HS1_SIV_HASH_RNDS*24]; // HS1_SIV_HASH_RNDS == 6
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

/* custom version of chacha/20rnds generating 32 bytes, with no input message to XOR in */
static inline void chacha_noxor368(chacha_ctx_t *x_, unsigned char *c_)
{
  unsigned i;

#define u8 unsigned char
#define u32 unsigned int
#define u64 unsigned long long

  u32* x = (u32*)&x_->input;
  u8* out = c_;

  {
#include "c256.h"
  }
  {
#include "c112.h"
  }

#undef u64
#undef u32
#undef u8
}

/* custom version of chacha/20rnds generating 32 bytes, with no input message to XOR in */
static inline void chacha_noxor32(chacha_ctx_t *x_, unsigned char *c_)
{
  unsigned i;

#define u8 unsigned char
#define u32 unsigned int
#define u64 unsigned long long

  u32* x = (u32*)&x_->input;
  u8* out = c_;

#include "c32.h"

#undef u64
#undef u32
#undef u8
}

/* standard chacha/20 rnds, arbitrary lenght & XOR with a message */
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
    chacha_noxor368(&ctx,out);
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

static inline uint32_t asu_hash(const uint64_t x, const uint64_t *k) {
    uint64_t t = k[0] + k[1] * (uint32_t)x + k[2] * (uint32_t)(x >> 32);
    return (uint32_t)(t >> 32);
}

static inline void prf_hash2_3_finalize(uint64_t *h, const uint64_t s[6], const uint64_t *asukey) {
    uint64_t s0_1, s1_1;
    uint64_t s0_2, s1_2;
    uint64_t s0_3, s1_3;
    s0_1 = poly_finalize(s[0]);
    s1_1 = poly_finalize(s[1]);
    s0_2 = poly_finalize(s[2]);
    s1_2 = poly_finalize(s[3]);
    s0_3 = poly_finalize(s[4]);
    s1_3 = poly_finalize(s[5]);
    write64le(h+0, (uint64_t)asu_hash(s1_1, asukey+3) << 32 | asu_hash(s0_1, asukey+0));
    write64le(h+1, (uint64_t)asu_hash(s1_2, asukey+9) << 32 | asu_hash(s0_2, asukey+6));
    write64le(h+2, (uint64_t)asu_hash(s1_3, asukey+15) << 32 | asu_hash(s0_3, asukey+12));
}

/* does all 3 hashes at once */
static inline void prf_hash2_3(uint64_t s[6], const uint32_t *in,  unsigned inbytes, const uint32_t *nhkey, const uint64_t *polykey) {
    uint64_t s0_1 = 1, s1_1 = 1;
    uint64_t s0_2 = 1, s1_2 = 1;
    uint64_t s0_3 = 1, s1_3 = 1;
    unsigned i=0, j;
    s0_1 = s[0];
    s1_1 = s[1];
    s0_2 = s[2];
    s1_2 = s[3];
    s0_3 = s[4];
    s1_3 = s[5];

    /* do the 32 bits addition then do the 32x32->64 multiplications */
#define BLOCKADD(s, I, X, A, B, H)                                      \
    uint32x4_t av00##I##X##s##H = vaddq_u32(inv##X##H, kv##A##H);      \
    uint32x4_t av04##I##X##s##H = vaddq_u32(inv##X##H, kv##B##H)
#define BLOCKUNPACK(s, I, X, H)
#define BLOCKMUL(s, I, X, H)      \
    uint32x4_t p0##I##X##s##H = (uint32x4_t)vmull_u32(vget_low_u32(av00##I##X##s##H),vget_high_u32(av00##I##X##s##H)); \
    uint32x4_t p1##I##X##s##H = (uint32x4_t)vmull_u32(vget_low_u32(av04##I##X##s##H),vget_high_u32(av04##I##X##s##H))
    
#define BLOCK(s, I, X, A, B)                                            \
    BLOCKADD(s, I, X, A, B, l);                                         \
    BLOCKADD(s, I, X, A, B, h);                                         \
    BLOCKUNPACK(s, I, X, l);                                            \
    BLOCKUNPACK(s, I, X, h);                                            \
    BLOCKMUL(s, I, X, l);                                               \
    BLOCKMUL(s, I, X, h)
    
    /* accumulate the 64 bits products */
#define SUM(s, I)                                               \
    uint64x2_t p0##I##s##l = vaddq_u64((uint64x2_t)p0##I##a##s##l,(uint64x2_t)p0##I##b##s##l); \
    uint64x2_t p0##I##s##h = vaddq_u64((uint64x2_t)p0##I##a##s##h,(uint64x2_t)p0##I##b##s##h); \
    uint64x2_t p1##I##s##l = vaddq_u64((uint64x2_t)p1##I##a##s##l,(uint64x2_t)p1##I##b##s##l); \
    uint64x2_t p1##I##s##h = vaddq_u64((uint64x2_t)p1##I##a##s##h,(uint64x2_t)p1##I##b##s##h)
    
    /* do the final (horizontal) accumulation, and compute the
       poly_step()s for the block ; multiple variants */
#define ACCANDSTORE(s, I)                                               \
    uint64x2_t p01##I##lo64##s##l = vtrn1q_u64(p0##I##s##l,p1##I##s##l); \
    uint64x2_t p01##I##lo64##s##h = vtrn1q_u64(p0##I##s##h,p1##I##s##h); \
    uint64x2_t p01##I##hi64##s##l = vtrn2q_u64(p0##I##s##l,p1##I##s##l); \
    uint64x2_t p01##I##hi64##s##h = vtrn2q_u64(p0##I##s##h,p1##I##s##h); \
    uint64x2_t ps01##I##s##l = vaddq_u64(p01##I##lo64##s##l, p01##I##hi64##s##l); \
    uint64x2_t ps01##I##s##h = vaddq_u64(p01##I##lo64##s##h, p01##I##hi64##s##h); \
                                                                        \
    uint64x2_t s01##I##s = vaddq_u64(ps01##I##s##l,ps01##I##s##h);      \
    uint64x2_t s01##I##s##m60 = vandq_u64(s01##I##s, vdupq_n_u64(m60)); \
    vst1q_u32((unsigned int*)ia0,(uint32x4_t)s01##I##s##m60);           \
    s0_##I = poly_step(s0_##I, ia0[0], polykey[(2*I)-2]);               \
    s1_##I = poly_step(s1_##I, ia0[1], polykey[(2*I)-1])
    
#define ACCANDSTORENOPOLY(s, I)                                               \
    uint64x2_t p01##I##lo64##s##l = vtrn1q_u64(p0##I##s##l,p1##I##s##l); \
    uint64x2_t p01##I##lo64##s##h = vtrn1q_u64(p0##I##s##h,p1##I##s##h); \
    uint64x2_t p01##I##hi64##s##l = vtrn2q_u64(p0##I##s##l,p1##I##s##l); \
    uint64x2_t p01##I##hi64##s##h = vtrn2q_u64(p0##I##s##h,p1##I##s##h); \
    uint64x2_t ps01##I##s##l = vaddq_u64(p01##I##lo64##s##l, p01##I##hi64##s##l); \
    uint64x2_t ps01##I##s##h = vaddq_u64(p01##I##lo64##s##h, p01##I##hi64##s##h); \
                                                                        \
    uint64x2_t s01##I##s = vaddq_u64(ps01##I##s##l,ps01##I##s##h);      \
    uint64x2_t s01##I##s##m60 = vandq_u64(s01##I##s, vdupq_n_u64(m60)); \
    vst1q_u32((unsigned int*)ia0,(uint32x4_t)s01##I##s##m60)
    
#define POLYONLY(s, I)                                                  \
    s0_##I = poly_step(s0_##I, ia##I[s][0], polykey[(2*I)-2]);        \
    s1_##I = poly_step(s1_##I, ia##I[s][1], polykey[(2*I)-1])
    
    /* do all steps for all 3 hashes */
#define ALL3HASH_SEQ(s)                             \
    BLOCK(s, 1, a,  0,  4);                         \
    BLOCK(s, 1, b,  8, 12);                         \
    SUM(s, 1);                                      \
    ACCANDSTORE(s, 1);                              \
    BLOCK(s, 2, a,  8, 12);                         \
    BLOCK(s, 2, b, 16, 20);                         \
    SUM(s, 2);                                      \
    ACCANDSTORE(s, 2);                              \
    BLOCK(s, 3, a, 16, 20);                         \
    BLOCK(s, 3, b, 24, 28);                         \
    SUM(s, 3);                                      \
    ACCANDSTORE(s, 3)
    
#define ALL3HASH_INTER(s)                           \
    BLOCK(s, 1, a,  0,  4);                         \
    BLOCK(s, 2, a,  8, 12);                         \
    BLOCK(s, 3, a, 16, 20);                         \
    BLOCK(s, 1, b,  8, 12);                         \
    BLOCK(s, 2, b, 16, 20);                         \
    BLOCK(s, 3, b, 24, 28);                         \
    SUM(s, 1);                                      \
    SUM(s, 2);                                      \
    SUM(s, 3);                                      \
    ACCANDSTORE(s, 1);                              \
    ACCANDSTORE(s, 2);                              \
    ACCANDSTORE(s, 3)

#define ALL3HASHNOPOLY(s)                           \
    BLOCK(s, 1, a,  0,  4);                         \
    BLOCK(s, 1, b,  8, 12);                         \
    SUM(s, 1);                                      \
    ACCANDSTORENOPOLY(s, 1);                        \
    BLOCK(s, 2, a,  8, 12);                         \
    BLOCK(s, 2, b, 16, 20);                         \
    SUM(s, 2);                                      \
    ACCANDSTORENOPOLY(s, 2);                        \
    BLOCK(s, 3, a, 16, 20);                         \
    BLOCK(s, 3, b, 24, 28);                         \
    SUM(s, 3);                                      \
    ACCANDSTORENOPOLY(s, 3)

#define ALL3HASHPOLYONLY(s)                     \
    POLYONLY(s, 1);                             \
    POLYONLY(s, 2);                             \
    POLYONLY(s, 3)

#define ALL3HASH_PINTER(s)                      \
    ALL3HASHNOPOLY(s);ALL3HASHPOLYONLY(s)

    /* pick between ALL3HASH_SEQ, ALL3HASH_INTER, ALL3HASH_PINTER */
#define ALL3HASH(s) ALL3HASH_INTER(s)
      
    /* Hash full blocks of HS1_SIV_NH_LEN bytes */
    for ( ; inbytes >= HS1_SIV_NH_LEN; inbytes -= HS1_SIV_NH_LEN, in += HS1_SIV_NH_LEN/4) {
      ALIGN32 uint64_t ia0[4];
      ALIGN32 uint64_t ia1[4];

        // assume HS1_SIV_NH_LEN == 64 -> 2 iterations -> full unroll, less scalar reduction
          uint32x4_t kv0l  = vld1q_u32((const unsigned int*)(nhkey+ 0)); // 1
          uint32x4_t kv0h  = vld1q_u32((const unsigned int*)(nhkey+ 4)); // 1
          uint32x4_t kv4l  = kv0h; // 1
          uint32x4_t kv4h  = vld1q_u32((const unsigned int*)(nhkey+ 8)); // 1
          uint32x4_t kv8l  = kv4h; // 1, 2
          uint32x4_t kv8h  = vld1q_u32((const unsigned int*)(nhkey+12)); // 1, 2
          uint32x4_t kv12l = kv8h; // 1, 2
          uint32x4_t kv12h = vld1q_u32((const unsigned int*)(nhkey+16)); // 1, 2
          uint32x4_t kv16l = kv12h; // 2, 3
          uint32x4_t kv16h = vld1q_u32((const unsigned int*)(nhkey+20)); // 2, 3
          uint32x4_t kv20l = kv16h; // 2, 3
          uint32x4_t kv20h = vld1q_u32((const unsigned int*)(nhkey+24)); // 2, 3
          uint32x4_t kv24l = kv20h; // 3
          uint32x4_t kv24h = vld1q_u32((const unsigned int*)(nhkey+28)); // 3
          uint32x4_t kv28l = kv24h; // 3
          uint32x4_t kv28h = vld1q_u32((const unsigned int*)(nhkey+32)); // 3

          uint32x4_t inval = vld1q_u32((const unsigned int*)(in+ 0));
          uint32x4_t invah = vld1q_u32((const unsigned int*)(in+ 4));
          uint32x4_t invbl = vld1q_u32((const unsigned int*)(in+ 8));
          uint32x4_t invbh = vld1q_u32((const unsigned int*)(in+12));

          ALL3HASH(0);
    }
    /* If partial block remains, hash it */
    i=0;
    if (inbytes != 0) {
        uint64_t a0_1 = 0, a1_1 = 0;
        uint64_t a0_2 = 0, a1_2 = 0;
        uint64_t a0_3 = 0, a1_3 = 0;
        while (inbytes >= 16) {
          ALIGN32 uint64_t ia[4];
          uint32x4_t inv0 = vld1q_u32((const unsigned int*)(in+i));

          uint32x4_t kv0l  = vld1q_u32((const unsigned int*)(nhkey+i+ 0));
          uint32x4_t kv0h  = vld1q_u32((const unsigned int*)(nhkey+i+ 4));
          uint32x4_t kv8l  = vld1q_u32((const unsigned int*)(nhkey+i+ 8));
          uint32x4_t kv8h  = vld1q_u32((const unsigned int*)(nhkey+i+12));
          uint32x4_t kv16l = vld1q_u32((const unsigned int*)(nhkey+i+16));
          uint32x4_t kv16h = vld1q_u32((const unsigned int*)(nhkey+i+20));

          uint32x4_t av0l  = vaddq_u32(inv0, kv0l); /* A, B, C, D, E, F, G, H */
          uint32x4_t av0h  = vaddq_u32(inv0, kv0h); /* A, B, C, D, E, F, G, H */
          uint32x4_t av8l  = vaddq_u32(inv0, kv8l);
          uint32x4_t av8h  = vaddq_u32(inv0, kv8h);
          uint32x4_t av16l = vaddq_u32(inv0, kv16l);
          uint32x4_t av16h = vaddq_u32(inv0, kv16h);

          uint32x4_t p1l = (uint32x4_t)vmull_u32(vget_low_u32(av0l),vget_high_u32(av0l));
          uint32x4_t p1h = (uint32x4_t)vmull_u32(vget_low_u32(av0h),vget_high_u32(av0h));
          uint32x4_t p2l = (uint32x4_t)vmull_u32(vget_low_u32(av8l),vget_high_u32(av8l));
          uint32x4_t p2h = (uint32x4_t)vmull_u32(vget_low_u32(av8h),vget_high_u32(av8h));
          uint32x4_t p3l = (uint32x4_t)vmull_u32(vget_low_u32(av16l),vget_high_u32(av16l));
          uint32x4_t p3h = (uint32x4_t)vmull_u32(vget_low_u32(av16h),vget_high_u32(av16h));
          vst1q_u32((unsigned int*)(ia+0), p1l);
          vst1q_u32((unsigned int*)(ia+2), p1h);
          a0_1 += ia[0]+ia[1];
          a1_1 += ia[2]+ia[3];
          vst1q_u32((unsigned int*)(ia+0), p2l);
          vst1q_u32((unsigned int*)(ia+2), p2h);
          a0_2 += ia[0]+ia[1];
          a1_2 += ia[2]+ia[3];
          vst1q_u32((unsigned int*)(ia+0), p3l);
          vst1q_u32((unsigned int*)(ia+2), p3h);
          a0_3 += ia[0]+ia[1];
          a1_3 += ia[2]+ia[3];

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

            a0_3 += (uint64_t)(tail[0] + nhkey[i+16]) * (tail[2] + nhkey[i+18]);
            a0_3 += (uint64_t)(tail[1] + nhkey[i+17]) * (tail[3] + nhkey[i+19]);
            a1_3 += (uint64_t)(tail[0] + nhkey[i+20]) * (tail[2] + nhkey[i+22]);
            a1_3 += (uint64_t)(tail[1] + nhkey[i+21]) * (tail[3] + nhkey[i+23]);

            a0_1 += inbytes;
            a1_1 += inbytes;
            a0_2 += inbytes;
            a1_2 += inbytes;
            a0_3 += inbytes;
            a1_3 += inbytes;
        }
#endif
        s0_1 = poly_step(s0_1, a0_1&m60, polykey[0]);
        s1_1 = poly_step(s1_1, a1_1&m60, polykey[1]);
        s0_2 = poly_step(s0_2, a0_2&m60, polykey[2]);
        s1_2 = poly_step(s1_2, a1_2&m60, polykey[3]);
        s0_3 = poly_step(s0_3, a0_3&m60, polykey[4]);
        s1_3 = poly_step(s1_3, a1_3&m60, polykey[5]);
    }
    s[0] = s0_1;
    s[1] = s1_1;
    s[2] = s0_2;
    s[3] = s1_2;
    s[4] = s0_3;
    s[5] = s1_3;
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
                       uint64_t h[HS1_SIV_HASH_RNDS/2],
                       uint64_t s[HS1_SIV_HASH_RNDS],
                       const hs1siv_ctx_t *hs1_ctx,
                       const unsigned char* a, const unsigned abytes, const unsigned char* m, const unsigned mbytes) {
  unsigned char tmp_h[HS1_SIV_NH_LEN];
  unsigned i, j, k;
  unsigned atot, mtot, arnd64, mrnd64;
  unsigned donesizes;
  s[0] = s[1] = s[2] = s[3] = s[4] = s[5] = 1;
  atot = ((abytes+HS1_SIV_NH_LEN-1)&~(HS1_SIV_NH_LEN-1));
  mtot = ((mbytes+15)&~15);
  arnd64 = abytes & ~(HS1_SIV_NH_LEN-1);
  /* hash all HS1_SIV_NH_LEN blocks from A */
  if (arnd64 > 0)
    prf_hash2_3(s, (uint32_t *)a, arnd64, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  /* last one if needed */
  if (abytes > arnd64) {
    memset(tmp_h,0,HS1_SIV_NH_LEN);
    for (i = 0 ; i < (abytes-arnd64) ; i++)
      tmp_h[i] = ((unsigned char*)a)[arnd64+i];
    prf_hash2_3(s, (uint32_t *)tmp_h, HS1_SIV_NH_LEN, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  }
  donesizes = 0;
  /* hash message M */
  if (mbytes > 0) {
    /* hash all HS1_SIV_NH_LEN blocks from M */
    mrnd64 = mbytes&~(HS1_SIV_NH_LEN-1);
    if (mrnd64 > 0)
      prf_hash2_3(s, (uint32_t *)((unsigned char*)m), mrnd64, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
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
    prf_hash2_3(s, (uint32_t *)tmp_h, k, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  }
  /* if we haven't hashed the sizes yet, need to do an extra block */
  if (!donesizes) {
    memset(tmp_h,0,HS1_SIV_NH_LEN);
    (( uint64_t*)tmp_h)[0] = abytes;
    (( uint64_t*)tmp_h)[1] = mbytes;
    donesizes = 1;
    prf_hash2_3(s, (uint32_t *)tmp_h, 16, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
  }
  prf_hash2_3_finalize(h,s, (uint64_t *)hs1_ctx->asu_key);
}

static inline void hs1siv_encrypt(hs1siv_ctx_t *hs1_ctx, void *m, unsigned mbytes, void *a, unsigned abytes, void *n, void *t, void *c)
{
    unsigned i;
    unsigned char tmp_t[HS1_SIV_SIV_LEN];
    unsigned char key[32];
    chacha_ctx_t chacha_ctx;
    uint64_t s[HS1_SIV_HASH_RNDS];
    uint64_t h[HS1_SIV_HASH_RNDS/2]; // HS1_SIV_CHACHA_RNDS == 6
    hs1_data(tmp_t, h, s, hs1_ctx, a, abytes, m, mbytes);
    memcpy(key, hs1_ctx->chacha_key, 32);
    for (i=0; i<sizeof(h)/8;i++)
      ((uint64_t *)key)[i] ^= h[i];
    chacha_keysetup(&chacha_ctx, key, 256);
    chacha_ivsetup(&chacha_ctx,(unsigned char *)n);
    /* hardwire the non-xor & HS1_SIV_SIV_LEN == 32 */
    chacha_noxor32(&chacha_ctx, (unsigned char *)tmp_t);
    s[0] = s[1] = s[2] = s[3] = s[4] = s[5] = 1;
    prf_hash2_3(s, (uint32_t *)tmp_t, HS1_SIV_SIV_LEN, (uint32_t *)hs1_ctx->nh_key, (uint64_t *)hs1_ctx->poly_key);
    prf_hash2_3_finalize(h,s, (uint64_t *)hs1_ctx->asu_key);
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
    uint64_t h[HS1_SIV_HASH_RNDS/2]; // HS1_SIV_CHACHA_RNDS == 6
    uint64_t s[HS1_SIV_HASH_RNDS];
    unsigned char key[32];
    chacha_ctx_t chacha_ctx;
    int r;
    s[0] = s[1] = s[2] = s[3] = s[4] = s[5] = 1;
    prf_hash2_3(s, (uint32_t *)t, HS1_SIV_SIV_LEN, (uint32_t *)ctx->nh_key, (uint64_t *)ctx->poly_key);
    prf_hash2_3_finalize(h,s,(uint64_t *)ctx->asu_key);
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
    /* hardwire the non-xor & HS1_SIV_SIV_LEN == 32 */
    chacha_noxor32(&chacha_ctx, (unsigned char *)maybe_t);
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
    assert(sizeof(hs1siv_ctx_t) == 368);
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
    assert(sizeof(hs1siv_ctx_t) == 368);
    (void)nsec;
    if (mlen) *mlen = clen-CRYPTO_ABYTES;
    hs1siv_subkeygen(&ctx, (void *)k, CRYPTO_KEYBYTES);
    return hs1siv_decrypt(&ctx, (void *)(c), clen-CRYPTO_ABYTES, (void *)ad, adlen, (void *)npub, (void *)(c+clen-CRYPTO_ABYTES), m);
}
