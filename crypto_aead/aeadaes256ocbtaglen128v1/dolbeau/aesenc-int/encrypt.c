/* 
// CAESAR OCB v1 somewhat optimised code
// Info: http://www.cs.ucdavis.edu/~rogaway/ocb
//
// Written by Romain Dolbeau (romain@dolbeau.org),
// based on the reference implementation by Ted Krovetz (ted@krovetz.net).
//
// Phillip Rogaway holds patents relevant to OCB. See the following for
// his free patent grant: http://www.cs.ucdavis.edu/~rogaway/ocb/grant.htm
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
*/

#include <string.h>

#include "api.h"
#include "crypto_aead.h"
#define KEYBYTES   CRYPTO_KEYBYTES
#define NONCEBYTES CRYPTO_NPUBBYTES
#define TAGBYTES   CRYPTO_ABYTES

#include <immintrin.h>

#ifdef __INTEL_COMPILER
#define ALIGN16 __declspec(align(16))
#define ALIGN32 __declspec(align(32))
#define ALIGN64 __declspec(align(64))
#else // assume GCC
#define ALIGN16  __attribute__((aligned(16)))
#define ALIGN32  __attribute__((aligned(32)))
#define ALIGN64  __attribute__((aligned(64)))
#define _bswap64(a) __builtin_bswap64(a)
#define _bswap(a) __builtin_bswap32(a)
#endif

#define printv16c(p,v)                                                  \
  {                                                                     \
    ALIGN16 unsigned char temp[16];                       \
    _mm_store_si128(temp, v);                                           \
    int z;                                                              \
    printf("%8s:%8s = ",p,#v);                                          \
    for (z = 15 ; z >= 0 ; z--) {                                       \
      printf("%02hhx", temp[z]);                                        \
      if ((z%4)==0) printf(" ");                                        \
    }                                                                   \
    printf("\n");                                                       \
  }


static inline void aes256ni_setkey_encrypt(const unsigned char* key, __m128i rkeys[15]) {
  __m128i key0 = _mm_loadu_si128((const unsigned int *)(key+0));
  __m128i key1 = _mm_loadu_si128((const unsigned int *)(key+16));
  __m128i temp0, temp1, temp2, temp4;
  int idx = 0;

  rkeys[idx++] = key0;
  temp0 = key0;
  temp2 = key1;

  /* blockshift-based block by Cedric Bourrasset & Romain Dolbeau */
#define BLOCK1(IMM)                              \
  temp1 = _mm_aeskeygenassist_si128(temp2, IMM); \
  rkeys[idx++] = temp2;                          \
  temp4 = _mm_slli_si128(temp0,4);               \
  temp0 = _mm_xor_si128(temp0,temp4);            \
  temp4 = _mm_slli_si128(temp0,8);               \
  temp0 = _mm_xor_si128(temp0,temp4);            \
  temp1 = _mm_shuffle_epi32(temp1,0xff);         \
  temp0 = _mm_xor_si128(temp0,temp1)

#define BLOCK2(IMM)                              \
  temp1 = _mm_aeskeygenassist_si128(temp0, IMM); \
  rkeys[idx++] = temp0;                          \
  temp4 = _mm_slli_si128(temp2,4);               \
  temp2 = _mm_xor_si128(temp2,temp4);            \
  temp4 = _mm_slli_si128(temp2,8);               \
  temp2 = _mm_xor_si128(temp2,temp4);            \
  temp1 = _mm_shuffle_epi32(temp1,0xaa);         \
  temp2 = _mm_xor_si128(temp2,temp1)

  BLOCK1(0x01);
  BLOCK2(0x01);

  BLOCK1(0x02);
  BLOCK2(0x02);

  BLOCK1(0x04);
  BLOCK2(0x04);

  BLOCK1(0x08);
  BLOCK2(0x08);

  BLOCK1(0x10);
  BLOCK2(0x10);

  BLOCK1(0x20);
  BLOCK2(0x20);

  BLOCK1(0x40);
  rkeys[idx++] = temp0;
}
static inline void aes256ni_setkey_decrypt(const unsigned char* key, __m128i rkeys[15]) {
  __m128i tkeys[15];
  int i;
  aes256ni_setkey_encrypt(key, tkeys);
  rkeys[0] = tkeys[14];
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    rkeys[i] = _mm_aesimc_si128(tkeys[14-i]);
  }
  rkeys[14] = tkeys[0];
}
static inline void aes256ni_setkey_e2d(const __m128i ekeys[15], __m128i dkeys[15]) {
  int i;
  dkeys[0] = ekeys[14];
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    dkeys[i] = _mm_aesimc_si128(ekeys[14-i]);
  }
  dkeys[14] = ekeys[0];
}

/** single, by-the-book AES encryption with AES-NI */
static inline __m128i aes256ni_encrypt1_si128(const __m128i nv, const __m128i rkeys[15]) {
  int i;
  __m128i temp = _mm_xor_si128(nv, rkeys[0]);
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    temp = _mm_aesenc_si128(temp, rkeys[i]);
  }
  temp = _mm_aesenclast_si128(temp, rkeys[14]);
  return temp;
}
static inline void aes256ni_encrypt1(unsigned char *out, const unsigned char *n, __m128i rkeys[15]) {
  __m128i nv = _mm_loadu_si128((const __m128i *)n);
  __m128i temp = aes256ni_encrypt1_si128(nv, rkeys);
  _mm_storeu_si128((__m128i*)(out), temp);
}
static inline __m128i aes256ni_decrypt1_si128(const __m128i nv, const __m128i rkeys[15]) {
  int i;
  __m128i temp = _mm_xor_si128(nv, rkeys[0]);
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    temp = _mm_aesdec_si128(temp, rkeys[i]);
  }
  temp = _mm_aesdeclast_si128(temp, rkeys[14]);
  return temp;
}
static inline void aes256ni_decrypt1(const unsigned char *n, unsigned char *out, const __m128i rkeys[15]) {
  __m128i nv = _mm_loadu_si128((const __m128i *)n);
  __m128i temp = aes256ni_decrypt1_si128(nv, rkeys);
  _mm_storeu_si128((__m128i*)(out), temp);
}


/** multiple-blocks-at-once AES encryption with AES-NI ;
    on Haswell, aesenc as a latency of 7 and a througput of 1
    so the sequence of aesenc should be bubble-free, if you
    have at least 8 blocks. Let's build an arbitratry-sized
    function */
/* Step 1 : loading the input */
#define NVx(a)                                                  \
  __m128i nv##a = _mm_loadu_si128((const __m128i *)(n+a*16));

/* Step 2 : define value in round one (xor with subkey #0, aka key) */
#define TEMPx(a)                                        \
  __m128i temp##a = _mm_xor_si128(nv##a, rkeys[0])

/* Step 3: one round of AES */
#define AESENCx(a)                                      \
  temp##a =  _mm_aesenc_si128(temp##a, rkeys[i])

/* Step 3b: one round of AES */
#define AESDECx(a)                                      \
  temp##a =  _mm_aesdec_si128(temp##a, rkeys[i])

/* Step 4: last round of AES */
#define AESENCLASTx(a)                                  \
  temp##a = _mm_aesenclast_si128(temp##a, rkeys[14])

/* Step 4b: last round of AES */
#define AESDECLASTx(a)                                  \
  temp##a = _mm_aesdeclast_si128(temp##a, rkeys[14])

/* Step XOR: xor with offset */
#define XORx(a)                                 \
  temp##a = _mm_xor_si128(offset##a, temp##a)

/* Step 5: store result */
#define STOREx(a)                                       \
  _mm_storeu_si128((__m128i*)(out+(a*16)), temp##a)

/* all the MAKE* macros are for automatic explicit unrolling */
#define MAKE4(X)                                \
  X(0);X(1);X(2);X(3)

#define MAKE8(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7)

#define MAKE4COMMA(X)				\
  X(0),X(1),X(2),X(3)

#define MAKE8COMMA(X)                           \
  X(0),X(1),X(2),X(3),                          \
  X(4),X(5),X(6),X(7)


static inline void inc(unsigned char *n) {
  (*(unsigned int*)&n[12]) = _bswap(1+(_bswap((*(unsigned int*)&n[12]))));
}
static inline void incle(unsigned char *n) {
  (*(unsigned int*)&n[12]) = (1+(((*(unsigned int*)&n[12]))));
}

#define PARAMNV(x)	const __m128i nv##x
#define PARAMOFF(x)	const __m128i offset##x
/* create a function of unrolling N ; the MAKEN is the unrolling
   macro, defined above. The N in MAKEN must match N, obviously. */
#define FUNC(N, MAKEN, MAKENCOMMA)                          \
  static inline void aes256ni_encrypt##N(unsigned char *out, unsigned char *n, const __m128i rkeys[15]) { \
    MAKEN(NVx);                                                         \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 1 ; i < 14 ; i++) {                                        \
      MAKEN(AESENCx);                                                   \
    }                                                                   \
    MAKEN(AESENCLASTx);                                                 \
    MAKEN(STOREx);                                                      \
  }                                                                     \
  static inline void aes256ni_decrypt##N(unsigned char *out, unsigned char *n, const __m128i rkeys[15]) { \
    MAKEN(NVx);                                                         \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 1 ; i < 14 ; i++) {                                        \
      MAKEN(AESDECx);                                                   \
    }                                                                   \
    MAKEN(AESDECLASTx);                                                 \
    MAKEN(STOREx);                                                      \
  }                                                                     \
  static inline void aes256ni_encrypt##N##_xor_si128(unsigned char *out, \
							MAKENCOMMA(PARAMNV), \
							MAKENCOMMA(PARAMOFF), \
                                                     const __m128i rkeys[15]) { \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 1 ; i < 14 ; i++) {                                        \
      MAKEN(AESENCx);                                                   \
    }                                                                   \
    MAKEN(AESENCLASTx);                                                 \
    MAKEN(XORx);                                                        \
    MAKEN(STOREx);                                                      \
  }                                                                     \
  static inline void aes256ni_decrypt##N##_xor_si128(unsigned char *out, \
                                                        MAKENCOMMA(PARAMNV), \
                                                        MAKENCOMMA(PARAMOFF), \
                                                     const __m128i rkeys[15]) { \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 1 ; i < 14 ; i++) {                                        \
      MAKEN(AESDECx);                                                   \
    }                                                                   \
    MAKEN(AESDECLASTx);                                                 \
    MAKEN(XORx);                                                        \
    MAKEN(STOREx);                                                      \
  }


/* and now building our unrolled function is trivial */
/* FUNC(2, MAKE2) */
FUNC(4, MAKE4, MAKE4COMMA)
/* FUNC(6, MAKE6) */
/* FUNC(7, MAKE7) */
FUNC(8, MAKE8, MAKE8COMMA)
/* FUNC(10, MAKE10) */
/* FUNC(12, MAKE12) */


typedef unsigned char block[16];

/* ------------------------------------------------------------------------- */

#if 0
static inline void xor_block(block d, block s1, block s2) {
    unsigned i;
    for (i=0; i<16; i++)
        d[i] = s1[i] ^ s2[i];
}
#else
/* 128 bits SSE doubling */
static inline void xor_block(unsigned char* d, const unsigned char* s1, const unsigned char* s2) {
  __m128i dv = _mm_xor_si128(_mm_loadu_si128((const __m128i*)s1), _mm_loadu_si128((const __m128i*)s2));
  _mm_storeu_si128((__m128i*)d,dv);
}
#endif

/* ------------------------------------------------------------------------- */

#if 0
static inline void double_block(block d, block s) {
    unsigned i;
    unsigned char tmp = s[0];
    for (i=0; i<15; i++)
        d[i] = (s[i] << 1) | (s[i+1] >> 7);
    d[15] = (s[15] << 1) ^ ((tmp >> 7) * 135);
}
#else
#if 0
/* 64 bits little-endian doubling, faster */
static inline void double_block(unsigned long long *d, const unsigned long long* s) {
  unsigned long long sl = _bswap64(s[1]), sh = _bswap64(s[0]);
  unsigned long long sl1 = sl << 1;
  unsigned long long sh1 = sh << 1;
  sh1 |= sl>>63;
  sl1 ^= (((long long)sh>>63) & 135);
  d[1]=_bswap64(sl1);
  d[0]=_bswap64(sh1);
}
#else
/* 128 bits SSE, much faster */
static inline __m128i double_block_si128_norev(const __m128i sv) {
  const __m128i mask = _mm_set_epi32(135,1,1,1);
  __m128i sv31 = _mm_srai_epi32(sv, 31);
  __m128i sv31m = _mm_and_si128(sv31, mask);
  __m128i sv31ms = _mm_shuffle_epi32(sv31m, _MM_SHUFFLE(2,1,0,3));
  __m128i sv1 = _mm_slli_epi32(sv, 1);
  __m128i dv = _mm_xor_si128(sv31ms,sv1);
  return dv;
}
static inline __m128i double_block_si128(const __m128i svr) {
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  __m128i sv = _mm_shuffle_epi8(svr, rev);
  __m128i dv = double_block_si128_norev(sv);
  return  _mm_shuffle_epi8(dv, rev);
}
static inline void double_block(unsigned char *d, const unsigned char* s) {
	__m128i sv = _mm_loadu_si128((const __m128i*)s);
	__m128i dv = double_block_si128(sv);
	_mm_storeu_si128((__m128i*)d,dv);
}
/* 128 bits SSE times 4 */
static const short lk4[64] = {
0x0000, 0x0086, 0x010c, 0x018a, 0x0218, 0x029e, 0x0314, 0x0392,
0x0430, 0x04b6, 0x053c, 0x05ba, 0x0628, 0x06ae, 0x0724, 0x07a2,
0x0860, 0x08e6, 0x096c, 0x09ea, 0x0a78, 0x0afe, 0x0b74, 0x0bf2,
0x0c50, 0x0cd6, 0x0d5c, 0x0dda, 0x0e48, 0x0ece, 0x0f44, 0x0fc2,
0x10c0, 0x1046, 0x11cc, 0x114a, 0x12d8, 0x125e, 0x13d4, 0x1352,
0x14f0, 0x1476, 0x15fc, 0x157a, 0x16e8, 0x166e, 0x17e4, 0x1762,
0x18a0, 0x1826, 0x19ac, 0x192a, 0x1ab8, 0x1a3e, 0x1bb4, 0x1b32,
0x1c90, 0x1c16, 0x1d9c, 0x1d1a, 0x1e88, 0x1e0e, 0x1f84, 0x1f02
};
static inline __m128i double_block_2_si128_norev(const __m128i sv) {
  const __m128i mask = _mm_set_epi32(3,3,3,3);
  const int idx = _mm_extract_epi8(sv,15);
  __m128i sv30x = _mm_insert_epi16(_mm_setzero_si128(),lk4[(idx&0xC0)>>6],0);

  __m128i sv30 = _mm_srli_epi32(sv, 30);
  __m128i sv30m = _mm_and_si128(sv30, mask);
  __m128i sv30ms = _mm_shuffle_epi32(sv30m, _MM_SHUFFLE(2,1,0,3));
  __m128i sv2 = _mm_slli_epi32(sv, 2);
  __m128i dv = _mm_xor_si128(sv30ms,sv2);
  __m128i final =  _mm_xor_si128(dv, sv30x);
  return final;
}
static inline __m128i double_block_3_si128_norev(const __m128i sv) {
  const __m128i mask = _mm_set_epi32(7,7,7,7);
  const int idx = _mm_extract_epi8(sv,15);
  __m128i sv29x = _mm_insert_epi16(_mm_setzero_si128(),lk4[(idx&0xE0)>>5],0);

  __m128i sv29 = _mm_srli_epi32(sv, 29);
  __m128i sv29m = _mm_and_si128(sv29, mask);
  __m128i sv29ms = _mm_shuffle_epi32(sv29m, _MM_SHUFFLE(2,1,0,3));
  __m128i sv3 = _mm_slli_epi32(sv, 3);
  __m128i dv = _mm_xor_si128(sv29ms,sv3);
  __m128i final =  _mm_xor_si128(dv, sv29x);
  return final;
}
static inline __m128i double_block_4_si128_norev(const __m128i sv) {
  const __m128i mask = _mm_set_epi32(15,15,15,15);
  const int idx = _mm_extract_epi8(sv,15);
  __m128i sv28x = _mm_insert_epi16(_mm_setzero_si128(),lk4[(idx&0xF0)>>4],0);

  __m128i sv28 = _mm_srli_epi32(sv, 28);
  __m128i sv28m = _mm_and_si128(sv28, mask);
  __m128i sv28ms = _mm_shuffle_epi32(sv28m, _MM_SHUFFLE(2,1,0,3));
  __m128i sv4 = _mm_slli_epi32(sv, 4);
  __m128i dv = _mm_xor_si128(sv28ms,sv4);
  __m128i final =  _mm_xor_si128(dv, sv28x);
  return final;
}
static inline __m128i double_block_5_si128_norev(const __m128i sv) {
  const __m128i mask = _mm_set_epi32(31,31,31,31);
  const int idx = _mm_extract_epi8(sv,15);
  __m128i sv27x = _mm_insert_epi16(_mm_setzero_si128(),lk4[(idx&0xF8)>>3],0);

  __m128i sv27 = _mm_srli_epi32(sv, 27);
  __m128i sv27m = _mm_and_si128(sv27, mask);
  __m128i sv27ms = _mm_shuffle_epi32(sv27m, _MM_SHUFFLE(2,1,0,3));
  __m128i sv5 = _mm_slli_epi32(sv, 5);
  __m128i dv = _mm_xor_si128(sv27ms,sv5);
  __m128i final =  _mm_xor_si128(dv, sv27x);
  return final;
}
static inline __m128i double_block_6_si128_norev(const __m128i sv) {
  const __m128i mask = _mm_set_epi32(63,63,63,63);
  const int idx = _mm_extract_epi8(sv,15);
  __m128i sv26x = _mm_insert_epi16(_mm_setzero_si128(),lk4[(idx&0xFC)>>2],0);

  __m128i sv26 = _mm_srli_epi32(sv, 26);
  __m128i sv26m = _mm_and_si128(sv26, mask);
  __m128i sv26ms = _mm_shuffle_epi32(sv26m, _MM_SHUFFLE(2,1,0,3));
  __m128i sv6 = _mm_slli_epi32(sv, 6);
  __m128i dv = _mm_xor_si128(sv26ms,sv6);
  __m128i final =  _mm_xor_si128(dv, sv26x);
  return final;
}
#endif
#endif

/* ------------------------------------------------------------------------- */
static inline __m128i calc_L_i_si128(const __m128i ldollarvr, const unsigned j) {
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  __m128i ldollarv = _mm_shuffle_epi8(ldollarvr, rev);
  unsigned i;
  __m128i lv;
  unsigned ntz = __builtin_ctz(j);/* printf("ntz = %u\n", ntz); */
  switch(ntz) {
	case 0:
      lv = double_block_si128_norev(ldollarv);
	break;
	case 1:
      lv = double_block_2_si128_norev(ldollarv);
	break;
	case 2:
      lv = double_block_3_si128_norev(ldollarv);
	break;
	case 3:
      lv = double_block_4_si128_norev(ldollarv);
	break;
	case 4:
      lv = double_block_5_si128_norev(ldollarv);
	break;
 	default:
      lv = double_block_6_si128_norev(ldollarv);
      for (i = 5; i < ntz ; i++)
        lv = double_block_si128_norev(lv);
	break;
      }
  return _mm_shuffle_epi8(lv, rev);
}
static inline void calc_L_i(block l, const block ldollar, const unsigned i) {
  __m128i ldollarv = _mm_loadu_si128((const __m128i*)ldollar);
  __m128i lv = calc_L_i_si128(ldollarv, i);
  _mm_storeu_si128((__m128i*)l,lv);
}
static inline void precompute_lv(__m128i prelv[32], const __m128i ldollarvr, const unsigned max) {
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  __m128i ldollarv = _mm_shuffle_epi8(ldollarvr, rev);
  unsigned i;
  __m128i lv = double_block_si128_norev(ldollarv);
  for (i = 0 ; i < max-1 ; i++) {
	prelv[i] = _mm_shuffle_epi8(lv, rev);
	lv = double_block_si128_norev(lv);
  }
  prelv[i] = _mm_shuffle_epi8(lv, rev);
}

/* ------------------------------------------------------------------------- */

static void hash(block result, const unsigned char *k,
                 unsigned char *a, unsigned abytes,
		 const __m128i lstar,
		 const __m128i prelv[32], const __m128i aes_key[15]) {
    __m128i  offset, sum, tmp;
    unsigned i;
    
    /* Process any whole blocks */
    /* Sum_0 = zeros(128) */
    sum = _mm_setzero_si128();
    /* Offset_0 = zeros(128) */
    offset = _mm_setzero_si128();
    i=1;
#if !defined(DONTUNROLL)
    if (abytes>=64)
      for (; i<=(abytes/16)-3; i+= 4, a+=64) {
          __m128i offsetu0, tmpu0;
          __m128i offsetu1, tmpu1;
          __m128i offsetu2, tmpu2;
          __m128i offsetu3, tmpu3;

	tmpu0 = prelv[__builtin_ctz(i+0)];
	tmpu1 = prelv[__builtin_ctz(i+1)];
	tmpu2 = prelv[__builtin_ctz(i+2)];
	tmpu3 = prelv[__builtin_ctz(i+3)];

        offsetu0 = _mm_xor_si128(offset, tmpu0);
        offsetu1 = _mm_xor_si128(offsetu0, tmpu1);
        offsetu2 = _mm_xor_si128(offsetu1, tmpu2);
        offsetu3 = _mm_xor_si128(offsetu2, tmpu3);
        offset = offsetu3;

        tmpu0 = _mm_xor_si128(offsetu0, _mm_loadu_si128((const __m128i*)(a+0)));
        tmpu1 = _mm_xor_si128(offsetu1, _mm_loadu_si128((const __m128i*)(a+16)));
        tmpu2 = _mm_xor_si128(offsetu2, _mm_loadu_si128((const __m128i*)(a+32)));
        tmpu3 = _mm_xor_si128(offsetu3, _mm_loadu_si128((const __m128i*)(a+48)));

        tmpu0 = aes256ni_encrypt1_si128(tmpu0, aes_key);
        tmpu1 = aes256ni_encrypt1_si128(tmpu1, aes_key);
        tmpu2 = aes256ni_encrypt1_si128(tmpu2, aes_key);
        tmpu3 = aes256ni_encrypt1_si128(tmpu3, aes_key);

        sum = _mm_xor_si128(sum, tmpu0);
        sum = _mm_xor_si128(sum, tmpu1);
        sum = _mm_xor_si128(sum, tmpu2);
        sum = _mm_xor_si128(sum, tmpu3);
      }
#endif
    for (; i<=abytes/16; i++, a = a + 16) {
        /* Offset_i = Offset_{i-1} xor L_{ntz(i)} */
	tmp = prelv[__builtin_ctz(i)];
        offset = _mm_xor_si128(offset, tmp);
        /* Sum_i = Sum_{i-1} xor ENCIPHER(K, A_i xor Offset_i) */
        tmp = _mm_xor_si128(offset, _mm_loadu_si128((const __m128i*)a));
        tmp = aes256ni_encrypt1_si128(tmp, aes_key);
        sum = _mm_xor_si128(sum, tmp);
    }

    /* Process any final partial block; compute final hash value */

    abytes = abytes % 16;  /* Bytes in final block */
    if (abytes > 0) {
        /* Offset_* = Offset_m xor L_* */
        offset = _mm_xor_si128(offset, lstar);
        /* tmp = (A_* || 1 || zeros(127-bitlen(A_*))) xor Offset_* */
        unsigned char pad[16];
        memset(pad, 0, 16);
        memcpy(pad, a, abytes);
        pad[abytes] = 0x80;
        tmp = _mm_loadu_si128((const __m128i*)pad);
        tmp = _mm_xor_si128(offset, tmp);
        /* Sum = Sum_m xor ENCIPHER(K, tmp) */
        tmp = aes256ni_encrypt1_si128(tmp, aes_key);
        sum = _mm_xor_si128(tmp, sum);
    }
    
    _mm_storeu_si128((__m128i*)result,sum);
}

/* ------------------------------------------------------------------------- */

static int ocb_crypt(unsigned char *out, unsigned char *k, unsigned char *n,
                     unsigned char *a, unsigned abytes,
                     unsigned char *in, unsigned inbytes, int encrypting) {
    __m128i prelv[32];
    __m128i aes_decrypt_key[15];
    __m128i aes_encrypt_key[15];
    block ad_hash;
    __m128i lstar, ldollar, sum, offset, ktop, pad, nonce, tag, tmp, outv;
    block nonce_b, offset_b;
    unsigned char stretch[24];
    unsigned bottom, byteshift, bitshift, i, max;
    
    /* Setup AES and strip ciphertext of its tag */
    if ( ! encrypting ) {
         if (inbytes < TAGBYTES) return -1;
         inbytes -= TAGBYTES;
    }
    aes256ni_setkey_encrypt(k, aes_encrypt_key);
    if ( ! encrypting ) {
	aes256ni_setkey_e2d(aes_encrypt_key, aes_decrypt_key);
    }
     
    /* Key-dependent variables */

    /* L_* = ENCIPHER(K, zeros(128)) */
    tmp = _mm_setzero_si128();
    lstar = aes256ni_encrypt1_si128(tmp, aes_encrypt_key);
    /* L_$ = double(L_*) */
    ldollar = double_block_si128(lstar); 
    max = abytes >= inbytes ? abytes/4 : inbytes/4;
    max = (max < 2 ? 2 : max);
    /* only precompute what's really needed;
       look at the number of leading zero (to find the leftmost bit set to one)
       all trailing zero will be at the right of it so we have an upper bound
    */
    precompute_lv(prelv,ldollar,31-__builtin_clz(max));

    /* Nonce-dependent and per-encryption variables */

    /* Nonce = zeros(127-bitlen(N)) || 1 || N */
    memset(nonce_b, 0, 16);
    memcpy(&nonce_b[16-NONCEBYTES],n,NONCEBYTES);
    nonce_b[0] = (unsigned char)(((TAGBYTES * 8) % 128) << 1);
    nonce_b[16-NONCEBYTES-1] |= 0x01;
    /* bottom = str2num(Nonce[123..128]) */
    bottom = nonce_b[15] & 0x3F;
    /* Ktop = ENCIPHER(K, Nonce[1..122] || zeros(6)) */
    nonce_b[15] &= 0xC0;
    nonce = _mm_loadu_si128((const __m128i*)nonce_b);
    ktop = aes256ni_encrypt1_si128(nonce, aes_encrypt_key);
    /* Stretch = Ktop || (Ktop[1..64] xor Ktop[9..72]) */
    _mm_storeu_si128((__m128i*)stretch, ktop);
    _mm_storel_epi64((__m128i*)(stretch+16), _mm_xor_si128(_mm_srli_si128(ktop,1), ktop));
    /* Offset_0 = Stretch[1+bottom..128+bottom] */
    byteshift = bottom/8;
    bitshift  = bottom%8;
    if (bitshift != 0)
        for (i=0; i<16; i++)
            offset_b[i] = (stretch[i+byteshift] << bitshift) |
                        (stretch[i+byteshift+1] >> (8-bitshift));
    else
        for (i=0; i<16; i++)
            offset_b[i] = stretch[i+byteshift];
    offset = _mm_loadu_si128((const __m128i*)offset_b);
    /* Checksum_0 = zeros(128) */
    sum = _mm_xor_si128(sum,sum);

    /* Hash associated data */
    hash(ad_hash, k, a, abytes, lstar, prelv, aes_encrypt_key);

    /* Process any whole blocks */
    i=1;
    if (encrypting) {
#if !defined(DONTUNROLL)
      if (inbytes>=128) {
        for (; i<=(inbytes/16)-7; i+=8, in+=128, out+=128) {
          __m128i offsetu0, tmpu0, inv0;
          __m128i offsetu1, tmpu1, inv1;
          __m128i offsetu2, tmpu2, inv2;
          __m128i offsetu3, tmpu3, inv3;
          __m128i offsetu4, tmpu4, inv4;
          __m128i offsetu5, tmpu5, inv5;
          __m128i offsetu6, tmpu6, inv6;
          __m128i offsetu7, tmpu7, inv7;


 	  inv0 = _mm_loadu_si128((const __m128i*)(in+0));
          inv1 = _mm_loadu_si128((const __m128i*)(in+16));
          inv2 = _mm_loadu_si128((const __m128i*)(in+32));
          inv3 = _mm_loadu_si128((const __m128i*)(in+48));
          inv4 = _mm_loadu_si128((const __m128i*)(in+64));
          inv5 = _mm_loadu_si128((const __m128i*)(in+80));
          inv6 = _mm_loadu_si128((const __m128i*)(in+96));
          inv7 = _mm_loadu_si128((const __m128i*)(in+112));


          tmpu0 = prelv[__builtin_ctz(i+0)];
          offset = _mm_xor_si128(offset, tmpu0);
          tmpu0 = _mm_xor_si128(offset, inv0);
          sum = _mm_xor_si128(inv0, sum);
          offsetu0 = offset;

          tmpu1 = prelv[__builtin_ctz(i+1)];
          offset = _mm_xor_si128(offset, tmpu1);
          tmpu1 = _mm_xor_si128(offset, inv1);
          sum = _mm_xor_si128(inv1, sum);
          offsetu1 = offset;

          tmpu2 = prelv[__builtin_ctz(i+2)];
          offset = _mm_xor_si128(offset, tmpu2);
          tmpu2 = _mm_xor_si128(offset, inv2);
          sum = _mm_xor_si128(inv2, sum);
          offsetu2 = offset;

          tmpu3 = prelv[__builtin_ctz(i+3)];
          offset = _mm_xor_si128(offset, tmpu3);
          tmpu3 = _mm_xor_si128(offset, inv3);
          sum = _mm_xor_si128(inv3, sum);
          offsetu3 = offset;

          tmpu4 = prelv[__builtin_ctz(i+4)];
          offset = _mm_xor_si128(offset, tmpu4);
          tmpu4 = _mm_xor_si128(offset, inv4);
          sum = _mm_xor_si128(inv4, sum);
          offsetu4 = offset;

          tmpu5 = prelv[__builtin_ctz(i+5)];
          offset = _mm_xor_si128(offset, tmpu5);
          tmpu5 = _mm_xor_si128(offset, inv5);
          sum = _mm_xor_si128(inv5, sum);
          offsetu5 = offset;

          tmpu6 = prelv[__builtin_ctz(i+6)];
          offset = _mm_xor_si128(offset, tmpu6);
          tmpu6 = _mm_xor_si128(offset, inv6);
          sum = _mm_xor_si128(inv6, sum);
          offsetu6 = offset;

          tmpu7 = prelv[__builtin_ctz(i+7)];
          offset = _mm_xor_si128(offset, tmpu7);
          tmpu7 = _mm_xor_si128(offset, inv7);
          sum = _mm_xor_si128(inv7, sum);
          offsetu7 = offset;

          aes256ni_encrypt8_xor_si128(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      tmpu4,tmpu5,tmpu6,tmpu7,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      offsetu4,offsetu5,offsetu6,offsetu7,
                                      aes_encrypt_key);
       }
     }
     if (inbytes>=64) {
        for (; i<=(inbytes/16)-3; i+=4, in+=64, out+=64) {
          __m128i offsetu0, tmpu0, inv0;
          __m128i offsetu1, tmpu1, inv1;
          __m128i offsetu2, tmpu2, inv2;
          __m128i offsetu3, tmpu3, inv3;

          inv0 = _mm_loadu_si128((const __m128i*)(in+0));
          inv1 = _mm_loadu_si128((const __m128i*)(in+16));
          inv2 = _mm_loadu_si128((const __m128i*)(in+32));
          inv3 = _mm_loadu_si128((const __m128i*)(in+48));

	  tmpu0 = prelv[__builtin_ctz(i+0)];
          offset = _mm_xor_si128(offset, tmpu0);
          tmpu0 = _mm_xor_si128(offset, inv0);
          sum = _mm_xor_si128(inv0, sum);
          offsetu0 = offset;

	  tmpu1 = prelv[__builtin_ctz(i+1)];
          offset = _mm_xor_si128(offset, tmpu1);
          tmpu1 = _mm_xor_si128(offset, inv1);
          sum = _mm_xor_si128(inv1, sum);
          offsetu1 = offset;

	  tmpu2 = prelv[__builtin_ctz(i+2)];
          offset = _mm_xor_si128(offset, tmpu2);
          tmpu2 = _mm_xor_si128(offset, inv2);
          sum = _mm_xor_si128(inv2, sum);
          offsetu2 = offset;

	  tmpu3 = prelv[__builtin_ctz(i+3)];
          offset = _mm_xor_si128(offset, tmpu3);
          tmpu3 = _mm_xor_si128(offset, inv3);
          sum = _mm_xor_si128(inv3, sum);
          offsetu3 = offset;

          aes256ni_encrypt4_xor_si128(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      aes_encrypt_key);
        }
      }
#endif
      for (; i<=inbytes/16; i++, in=in+16, out=out+16) {
        /* Offset_i = Offset_{i-1} xor L_{ntz(i)} */
        tmp = prelv[__builtin_ctz(i)];
 
        offset = _mm_xor_si128(offset, tmp);
        tmp = _mm_xor_si128(offset, _mm_loadu_si128((const __m128i*)in));
        
        /* Checksum_i = Checksum_{i-1} xor P_i */
        sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)in), sum);
        /* C_i = Offset_i xor ENCIPHER(K, P_i xor Offset_i) */
        tmp = aes256ni_encrypt1_si128(tmp, aes_encrypt_key);
        outv = _mm_xor_si128(offset, tmp);
        _mm_storeu_si128((__m128i*)out, outv);
      }
    } else {
#if  !defined(DONTUNROLL)
      if (inbytes>=128) {
        for (; i<=(inbytes/16)-7; i+=8, in+=128, out+=128) {
          __m128i offsetu0, tmpu0, inv0;
          __m128i offsetu1, tmpu1, inv1;
          __m128i offsetu2, tmpu2, inv2;
          __m128i offsetu3, tmpu3, inv3;
          __m128i offsetu4, tmpu4, inv4;
          __m128i offsetu5, tmpu5, inv5;
          __m128i offsetu6, tmpu6, inv6;
          __m128i offsetu7, tmpu7, inv7;

          inv0 = _mm_loadu_si128((const __m128i*)(in+0));
          inv1 = _mm_loadu_si128((const __m128i*)(in+16));
          inv2 = _mm_loadu_si128((const __m128i*)(in+32));
          inv3 = _mm_loadu_si128((const __m128i*)(in+48));
          inv4 = _mm_loadu_si128((const __m128i*)(in+64));
          inv5 = _mm_loadu_si128((const __m128i*)(in+80));
          inv6 = _mm_loadu_si128((const __m128i*)(in+96));
          inv7 = _mm_loadu_si128((const __m128i*)(in+112));


          tmpu0= prelv[__builtin_ctz(i+0)];
          offset = _mm_xor_si128(offset, tmpu0);
          tmpu0 = _mm_xor_si128(offset, inv0);
          offsetu0 = offset;

          tmpu1= prelv[__builtin_ctz(i+1)];
          offset = _mm_xor_si128(offset, tmpu1);
          tmpu1 = _mm_xor_si128(offset, inv1);
          offsetu1 = offset;

          tmpu2= prelv[__builtin_ctz(i+2)];
          offset = _mm_xor_si128(offset, tmpu2);
          tmpu2 = _mm_xor_si128(offset, inv2);
          offsetu2 = offset;

          tmpu3= prelv[__builtin_ctz(i+3)];
          offset = _mm_xor_si128(offset, tmpu3);
          tmpu3 = _mm_xor_si128(offset, inv3);
          offsetu3 = offset;

          tmpu4= prelv[__builtin_ctz(i+4)];
          offset = _mm_xor_si128(offset, tmpu4);
          tmpu4 = _mm_xor_si128(offset, inv4);
          offsetu4 = offset;

          tmpu5= prelv[__builtin_ctz(i+5)];
          offset = _mm_xor_si128(offset, tmpu5);
          tmpu5 = _mm_xor_si128(offset, inv5);
          offsetu5 = offset;

          tmpu6= prelv[__builtin_ctz(i+6)];
          offset = _mm_xor_si128(offset, tmpu6);
          tmpu6 = _mm_xor_si128(offset, inv6);
          offsetu6 = offset;

          tmpu7= prelv[__builtin_ctz(i+7)];
          offset = _mm_xor_si128(offset, tmpu7);
          tmpu7 = _mm_xor_si128(offset, inv7);
          offsetu7 = offset;

          aes256ni_decrypt8_xor_si128(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      tmpu4,tmpu5,tmpu6,tmpu7,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      offsetu4,offsetu5,offsetu6,offsetu7,
                                      aes_decrypt_key);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+0)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+16)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+32)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+48)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+64)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+80)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+96)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+112)), sum);
        }
      }

      if (inbytes>=64) {
        for (; i<=(inbytes/16)-3; i+=4, in+=64, out+=64) {
          __m128i offsetu0, tmpu0, inv0;
          __m128i offsetu1, tmpu1, inv1;
          __m128i offsetu2, tmpu2, inv2;
          __m128i offsetu3, tmpu3, inv3;

          inv0 = _mm_loadu_si128((const __m128i*)(in+0));
          inv1 = _mm_loadu_si128((const __m128i*)(in+16));
          inv2 = _mm_loadu_si128((const __m128i*)(in+32));
          inv3 = _mm_loadu_si128((const __m128i*)(in+48));

          tmpu0= prelv[__builtin_ctz(i+0)];
          offset = _mm_xor_si128(offset, tmpu0);
          tmpu0 = _mm_xor_si128(offset, inv0);
          offsetu0 = offset;

          tmpu1= prelv[__builtin_ctz(i+1)];
          offset = _mm_xor_si128(offset, tmpu1);
          tmpu1 = _mm_xor_si128(offset, inv1);
          offsetu1 = offset;

          tmpu2= prelv[__builtin_ctz(i+2)];
          offset = _mm_xor_si128(offset, tmpu2);
          tmpu2 = _mm_xor_si128(offset, inv2);
          offsetu2 = offset;

          tmpu3= prelv[__builtin_ctz(i+3)];
          offset = _mm_xor_si128(offset, tmpu3);
          tmpu3 = _mm_xor_si128(offset, inv3);
          offsetu3 = offset;

          aes256ni_decrypt4_xor_si128(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      aes_decrypt_key);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+0)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+16)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+32)), sum);
          sum = _mm_xor_si128(_mm_loadu_si128((const __m128i*)(out+48)), sum);
        }
      }
#endif
      for (; i<=inbytes/16; i++, in=in+16, out=out+16) {
        /* Offset_i = Offset_{i-1} xor L_{ntz(i)} */
        tmp= prelv[__builtin_ctz(i)];
        offset = _mm_xor_si128(offset, tmp);        
        tmp = _mm_xor_si128(offset, _mm_loadu_si128((const __m128i*)in));

        /* P_i = Offset_i xor DECIPHER(K, C_i xor Offset_i) */
        tmp = aes256ni_decrypt1_si128(tmp, aes_decrypt_key);
        outv = _mm_xor_si128(offset, tmp);
        _mm_storeu_si128((__m128i*)out, outv);
        /* Checksum_i = Checksum_{i-1} xor P_i */
        sum = _mm_xor_si128(outv, sum);
      }
    }

    /* Process any final partial block and compute raw tag */

    inbytes = inbytes % 16;  /* Bytes in final block */
    if (inbytes > 0) {
        /* Offset_* = Offset_m xor L_* */
        offset = _mm_xor_si128(offset, lstar);
        /* Pad = ENCIPHER(K, Offset_*) */
        pad = aes256ni_encrypt1_si128(offset, aes_encrypt_key);
        
        if (encrypting) {
            /* Checksum_* = Checksum_m xor (P_* || 1 || zeros(127-bitlen(P_*))) */
            unsigned char tmp_b[16];
            unsigned char pad_b[16];
            memset(tmp_b, 0, 16);
            memcpy(tmp_b, in, inbytes);
            tmp_b[inbytes] = 0x80;
            tmp = _mm_loadu_si128((const __m128i*)tmp_b);
            sum = _mm_xor_si128(tmp, sum);
            /* C_* = P_* xor Pad[1..bitlen(P_*)] */
            pad = _mm_xor_si128(tmp, pad);
            _mm_storeu_si128((__m128i*)pad_b, pad);
            memcpy(out, pad_b, inbytes);
            out = out + inbytes;
        } else {
            /* P_* = C_* xor Pad[1..bitlen(C_*)] */
            unsigned char tmp_b[16];
            unsigned char pad_b[16];
            _mm_storeu_si128((__m128i*)pad_b, pad);
            memcpy(tmp_b, pad_b, 16);
            memcpy(tmp_b, in, inbytes);
            xor_block(tmp_b,pad_b,tmp_b);
            tmp_b[inbytes] = 0x80;
            memcpy(out, tmp_b, inbytes);
            tmp = _mm_loadu_si128((const __m128i*)tmp_b);
            /* Checksum_* = Checksum_m xor (P_* || 1 || zeros(127-bitlen(P_*))) */
            sum = _mm_xor_si128(tmp, sum);
            in = in + inbytes;
        }
    }
    
    /* Tag = ENCIPHER(K, Checksum xor Offset xor L_$) xor HASH(K,A) */
    tmp = _mm_xor_si128(sum, offset);
    tmp = _mm_xor_si128(tmp, ldollar);
    tag = aes256ni_encrypt1_si128(tmp, aes_encrypt_key);
    tag = _mm_xor_si128(_mm_loadu_si128((const __m128i*)ad_hash), tag);
    
    if (encrypting) {
        unsigned char tag_b[16];
        _mm_storeu_si128((__m128i*)tag_b, tag);
        memcpy(out, tag_b, TAGBYTES);
        return 0;
    } else {
        unsigned char tag_b[16];
        _mm_storeu_si128((__m128i*)tag_b, tag);
        return (memcmp(in,tag_b,TAGBYTES) ? -1 : 0);     /* Check for validity */
    }
}

/* ------------------------------------------------------------------------- */

#define OCB_ENCRYPT 1
#define OCB_DECRYPT 0

void ocb_encrypt(unsigned char *c, unsigned char *k, unsigned char *n,
                 unsigned char *a, unsigned abytes,
                 unsigned char *p, unsigned pbytes) {
    ocb_crypt(c, k, n, a, abytes, p, pbytes, OCB_ENCRYPT);
}

/* ------------------------------------------------------------------------- */

int ocb_decrypt(unsigned char *p, unsigned char *k, unsigned char *n,
                unsigned char *a, unsigned abytes,
                unsigned char *c, unsigned cbytes) {
    return ocb_crypt(p, k, n, a, abytes, c, cbytes, OCB_DECRYPT);
}

/* ------------------------------------------------------------------------- */

int crypto_aead_encrypt(
unsigned char *c,unsigned long long *clen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *nsec,
const unsigned char *npub,
const unsigned char *k
)
{
    *clen = mlen + TAGBYTES;
    ocb_crypt(c, (unsigned char *)k, (unsigned char *)npub, (unsigned char *)ad,
            adlen, (unsigned char *)m, mlen, OCB_ENCRYPT);
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
    *mlen = clen - TAGBYTES;
    return ocb_crypt(m, (unsigned char *)k, (unsigned char *)npub,
            (unsigned char *)ad, adlen, (unsigned char *)c, clen, OCB_DECRYPT);
}

