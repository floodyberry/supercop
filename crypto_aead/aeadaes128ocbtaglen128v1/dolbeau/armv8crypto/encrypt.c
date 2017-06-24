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

#include "stdaes-common.h"

#include <arm_neon.h>

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
    vst1q_u8(temp, v);                                           \
    int z;                                                              \
    printf("%8s:%8s = ",p,#v);                                          \
    for (z = 15 ; z >= 0 ; z--) {                                       \
      printf("%02hhx", temp[z]);                                        \
      if ((z%4)==0) printf(" ");                                        \
    }                                                                   \
    printf("\n");                                                       \
  }

#define AES_USE_ASM

static inline void aes128ni_setkey_e2d(const uint8x16_t ekeys[11], uint8x16_t dkeys[11]) {
  int i;
  dkeys[0] = ekeys[10];
#pragma unroll(9)
  for (i = 1 ; i < 10 ; i++) {
    dkeys[i] = vaesimcq_u8(ekeys[10-i]);
  }
  dkeys[10] = ekeys[0];
}


/** single, by-the-book AES encryption with AES-NI */
static inline uint8x16_t aes128armv8_encrypt1_neon(const uint8x16_t nv, const unsigned char *rkeys) {
  uint8x16_t temp = nv;
  int i;
/* 
   In ARMv8+crypto, the AESE instruction does the 'AddRoundKey' first then SubBytes and ShiftRows.
   The AESMC instruction does the MixColumns.
   So instead of a single XOR of the first round key before the rounds,
   we end up having a single XOR of the last round key after the rounds.
*/
#if 1
#pragma unroll(9)
  for (i = 0 ; i < 9 ; i++) {
#ifdef AES_USE_ASM
    uint8x16_t t;
    t = vld1q_u8(rkeys+i*16);\
    asm("aese %0.16b, %1.16b\naesmc %0.16b, %0.16b\n" : "+w"(temp) : "w"(t));
#else
    temp = vaeseq_u8(temp, vld1q_u8(rkeys+i*16));
    temp = vaesmcq_u8(temp);
#endif
  }
#else
#define ROUND(i) \
	temp = vaeseq_u8(temp, vld1q_u8(rkeys + i*16));temp = vaesmcq_u8(temp)
#define MAKE9(X)\
X(0);X(1);X(2);X(3);X(4);X(5);X(6);X(7);X(8)
MAKE9(ROUND);
#undef ROUND
#undef MAKE9
#endif
  temp = vaeseq_u8(temp, vld1q_u8((rkeys+144)));
  temp = veorq_u8(temp,  vld1q_u8((rkeys+160)));

  return temp;
}
static inline void aes128armv8_encrypt1(unsigned char *out, const unsigned char *n, const unsigned char *rkeys) {
  uint8x16_t temp = vld1q_u8(n);
  temp = aes128armv8_encrypt1_neon(temp, rkeys);
  vst1q_u8(out, temp);
}
static inline uint8x16_t aes128armv8_decrypt1_neon(const uint8x16_t nv, const unsigned char *rkeys) {
  uint8x16_t temp = nv;
  int i;
/* 
   In ARMv8+crypto, the AESE instruction does the 'AddRoundKey' first then SubBytes and ShiftRows.
   The AESMC instruction does the MixColumns.
   So instead of a single XOR of the first round key before the rounds,
   we end up having a single XOR of the last round key after the rounds.
*/
#if 1
#pragma unroll(9)
  for (i = 0 ; i < 9 ; i++) {
#ifdef AES_USE_ASM
    uint8x16_t t;
    t = vld1q_u8((rkeys+i*16));\
    asm("aesd %0.16b, %1.16b\naesimc %0.16b, %0.16b\n" : "+w"(temp) : "w"(t));
#else
    temp = vaesdq_u8(temp, vld1q_u8(rkeys+i*16));
    temp = vaesimcq_u8(temp);
#endif
  }
#else
#define ROUND(i) \
	temp = vaesdq_u8(temp, vld1q_u8(rkeys + i*16));temp = vaesimcq_u8(temp)
#define MAKE9(X)\
X(0);X(1);X(2);X(3);X(4);X(5);X(6);X(7);X(8)
MAKE9(ROUND);
#undef ROUND
#undef MAKE9
#endif
  temp = vaesdq_u8(temp, vld1q_u8((rkeys+144)));
  temp = veorq_u8(temp,  vld1q_u8((rkeys+160)));

  return temp;
}
static inline void aes128armv8_decrypt1(const unsigned char *n, unsigned char *out, const unsigned char *rkeys) {
  uint8x16_t nv = vld1q_u8(n);
  uint8x16_t temp = aes128armv8_decrypt1_neon(nv, rkeys);
  vst1q_u8((out), temp);
}

/** multiple-blocks-at-once AES encryption with ARMv8+crypto */
/* Step 1 : loading the nonce */
/* load & increment the n vector (non-vectorized, unused for now) */
#define NVx(a)                                                  \
  uint8x16_t nv##a = vld1q_u8((n+a*16));

/* Step XOR: xor with offset */
#define TEMPx(a)                                 \
  uint8x16_t temp##a = nv##a

#ifdef AES_USE_ASM
#define AESENCx(a)\
  { uint8x16_t t;\
  t = vld1q_u8((rkeys+i*16));\
  asm("aese %0.16b, %1.16b\naesmc %0.16b, %0.16b\n" : "+w"(temp##a) : "w"(t));\
  }
#define AESDECx(a)\
  { uint8x16_t t;\
  t = vld1q_u8((rkeys+i*16));\
  asm("aesd %0.16b, %1.16b\naesimc %0.16b, %0.16b\n" : "+w"(temp##a) : "w"(t));\
  }
#else
#define AESENCx(a)                                      \
  temp##a = vaeseq_u8(temp##a, vld1q_u8(rkeys+i*16)); temp##a = vaesmcq_u8(temp##a)
#define AESDECx(a)                                      \
  temp##a = vaesdq_u8(temp##a, vld1q_u8(rkeys+i*16)); temp##a = vaesimcq_u8(temp##a)
#endif

/* Step 3: last round of AES */
#define AESENCLASTx(a)                                  \
  temp##a = vaeseq_u8(temp##a, vld1q_u8((rkeys+144))); temp##a = veorq_u8(temp##a, vld1q_u8((rkeys+160)))
#define AESDECLASTx(a)                                  \
  temp##a = vaesdq_u8(temp##a, vld1q_u8((rkeys+144))); temp##a = veorq_u8(temp##a, vld1q_u8((rkeys+160)))

/* Step XOR: xor with offset */
#define XORx(a)                                 \
  temp##a = veorq_u8(offset##a, temp##a)

/* Step 4: store result */
#define STOREx(a)                                       \
  vst1q_u8((out+(a*16)), temp##a)

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

#define PARAMNV(x)	const uint8x16_t nv##x
#define PARAMOFF(x)	const uint8x16_t offset##x
/* create a function of unrolling N ; the MAKEN is the unrolling
   macro, defined above. The N in MAKEN must match N, obviously. */
#define FUNC(N, MAKEN, MAKENCOMMA)                          \
  static inline void aes128armv8_encrypt##N(unsigned char *out, unsigned char *n, const unsigned char *rkeys) { \
    MAKEN(NVx);                                                         \
    MAKEN(TEMPx);                                                       \
    int i;                                                              \
    for (i = 0 ; i < 9 ; i++) {                                        \
      MAKEN(AESENCx);                                                   \
    }                                                                   \
    MAKEN(AESENCLASTx);                                                 \
    MAKEN(STOREx);                                                      \
  }                                                                     \
  static inline void aes128armv8_decrypt##N(unsigned char *out, unsigned char *n, const unsigned char *rkeys) { \
    MAKEN(NVx);                                                         \
    MAKEN(TEMPx);                                                       \
    int i;                                                              \
    for (i = 0 ; i < 9 ; i++) {                                        \
      MAKEN(AESDECx);                                                   \
    }                                                                   \
    MAKEN(AESDECLASTx);                                                 \
    MAKEN(STOREx);                                                      \
  }                                                                     \
  static inline void aes128armv8_encrypt##N##_xor_neon(unsigned char *out, \
							MAKENCOMMA(PARAMNV), \
							MAKENCOMMA(PARAMOFF), \
                                                     const unsigned char *rkeys) { \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 0 ; i < 9 ; i++) {                                        \
      MAKEN(AESENCx);                                                   \
    }                                                                   \
    MAKEN(AESENCLASTx);                                                 \
    MAKEN(XORx);                                                        \
    MAKEN(STOREx);                                                      \
  }                                                                     \
  static inline void aes128armv8_decrypt##N##_xor_neon(unsigned char *out, \
                                                        MAKENCOMMA(PARAMNV), \
                                                        MAKENCOMMA(PARAMOFF), \
                                                     const unsigned char *rkeys) { \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 0 ; i < 9 ; i++) {                                        \
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

/* naive */
/* Reverse byte (8 bits) in a quadwords (128 bits) vector */
static inline uint8x16_t vreversebyteq_u128(const uint8x16_t x) {
	uint8x16_t x2pbr = vrev64q_u8(x);
	uint8x16_t x2r = vextq_u8(x2pbr,x2pbr,8);
	return x2r;
}

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
  uint8x16_t dv = veorq_u8(vld1q_u8(s1), vld1q_u8(s2));
  vst1q_u8(d,dv);
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
static inline uint8x16_t double_block_neon_norev(const uint8x16_t sv) {
  const uint8x16_t mask = (uint8x16_t)vsetq_lane_u32(135,vdupq_n_u32(1),3);
  uint8x16_t sv31 = (uint8x16_t)vshrq_n_s32((int32x4_t)sv, 31);
  uint8x16_t sv31m = vandq_u8(sv31, mask);
  uint8x16_t sv31ms = vextq_u8(sv31m,sv31m,12); /* shuffle */
  uint8x16_t sv1 = (uint8x16_t)vshlq_n_u32((uint32x4_t)sv, 1);
  uint8x16_t dv = veorq_u8(sv31ms,sv1);
  return dv;
}
static inline uint8x16_t double_block_neon(const uint8x16_t svr) {
  uint8x16_t sv = vreversebyteq_u128(svr);
  uint8x16_t dv = double_block_neon_norev(sv);
  return vreversebyteq_u128(dv);
}
#endif
#endif

/* ------------------------------------------------------------------------- */
static inline void precompute_lv(uint8x16_t prelv[32], const uint8x16_t ldollarvr, const unsigned max) {
  uint8x16_t ldollarv = vreversebyteq_u128(ldollarvr);
  unsigned i;
  uint8x16_t lv = double_block_neon_norev(ldollarv);
  for (i = 0 ; i < max-1 ; i++) {
	prelv[i] = vreversebyteq_u128(lv);
	lv = double_block_neon_norev(lv);
  }
  prelv[i] = vreversebyteq_u128(lv);
}

/* ------------------------------------------------------------------------- */

static void hash(block result, const unsigned char *k,
                 unsigned char *a, unsigned abytes,
		 const uint8x16_t lstar,
		 const uint8x16_t prelv[32], const unsigned char* aes_key) {
    uint8x16_t  offset, sum, tmp;
    unsigned i;
    
    /* Process any whole blocks */
    /* Sum_0 = zeros(128) */
    sum = vdupq_n_u8(0);
    /* Offset_0 = zeros(128) */
    offset = vdupq_n_u8(0);
    i=1;
#if !defined(DONTUNROLL)
    if (abytes>=64)
      for (; i<=(abytes/16)-3; i+= 4, a+=64) {
          uint8x16_t offsetu0, tmpu0;
          uint8x16_t offsetu1, tmpu1;
          uint8x16_t offsetu2, tmpu2;
          uint8x16_t offsetu3, tmpu3;

	tmpu0 = prelv[__builtin_ctz(i+0)];
	tmpu1 = prelv[__builtin_ctz(i+1)];
	tmpu2 = prelv[__builtin_ctz(i+2)];
	tmpu3 = prelv[__builtin_ctz(i+3)];

        offsetu0 = veorq_u8(offset, tmpu0);
        offsetu1 = veorq_u8(offsetu0, tmpu1);
        offsetu2 = veorq_u8(offsetu1, tmpu2);
        offsetu3 = veorq_u8(offsetu2, tmpu3);
        offset = offsetu3;

        tmpu0 = veorq_u8(offsetu0, vld1q_u8((a+0)));
        tmpu1 = veorq_u8(offsetu1, vld1q_u8((a+16)));
        tmpu2 = veorq_u8(offsetu2, vld1q_u8((a+32)));
        tmpu3 = veorq_u8(offsetu3, vld1q_u8((a+48)));

        tmpu0 = aes128armv8_encrypt1_neon(tmpu0, aes_key);
        tmpu1 = aes128armv8_encrypt1_neon(tmpu1, aes_key);
        tmpu2 = aes128armv8_encrypt1_neon(tmpu2, aes_key);
        tmpu3 = aes128armv8_encrypt1_neon(tmpu3, aes_key);

        sum = veorq_u8(sum, tmpu0);
        sum = veorq_u8(sum, tmpu1);
        sum = veorq_u8(sum, tmpu2);
        sum = veorq_u8(sum, tmpu3);
      }
#endif
    for (; i<=abytes/16; i++, a = a + 16) {
        /* Offset_i = Offset_{i-1} xor L_{ntz(i)} */
	tmp = prelv[__builtin_ctz(i)];
        offset = veorq_u8(offset, tmp);
        /* Sum_i = Sum_{i-1} xor ENCIPHER(K, A_i xor Offset_i) */
        tmp = veorq_u8(offset, vld1q_u8(a));
        tmp = aes128armv8_encrypt1_neon(tmp, aes_key);
        sum = veorq_u8(sum, tmp);
    }

    /* Process any final partial block; compute final hash value */

    abytes = abytes % 16;  /* Bytes in final block */
    if (abytes > 0) {
        /* Offset_* = Offset_m xor L_* */
        offset = veorq_u8(offset, lstar);
        /* tmp = (A_* || 1 || zeros(127-bitlen(A_*))) xor Offset_* */
        unsigned char pad[16];
        memset(pad, 0, 16);
        memcpy(pad, a, abytes);
        pad[abytes] = 0x80;
        tmp = vld1q_u8(pad);
        tmp = veorq_u8(offset, tmp);
        /* Sum = Sum_m xor ENCIPHER(K, tmp) */
        tmp = aes128armv8_encrypt1_neon(tmp, aes_key);
        sum = veorq_u8(tmp, sum);
    }
    
    vst1q_u8(result,sum);
}

/* ------------------------------------------------------------------------- */

static int ocb_crypt(unsigned char *out, unsigned char *k, unsigned char *n,
                     unsigned char *a, unsigned abytes,
                     unsigned char *in, unsigned inbytes, int encrypting) {
    uint8x16_t prelv[32];
    unsigned char aes_decrypt_key[176] ALIGN16;
    unsigned char aes_encrypt_key[176] ALIGN16;
    block ad_hash;
    uint8x16_t lstar, ldollar, sum, offset, ktop, pad, nonce, tag, tmp, outv;
    block nonce_b, offset_b;
    unsigned char stretch[24];
    unsigned bottom, byteshift, bitshift, i, max;
    
    /* Setup AES and strip ciphertext of its tag */
    if ( ! encrypting ) {
         if (inbytes < TAGBYTES) return -1;
         inbytes -= TAGBYTES;
    }
    aes128_setkey_encrypt((unsigned int*)k, (unsigned int*)aes_encrypt_key);
    if ( ! encrypting ) {
	aes128ni_setkey_e2d((const uint8x16_t*)aes_encrypt_key, (uint8x16_t*)aes_decrypt_key);
    }
     
    /* Key-dependent variables */

    /* L_* = ENCIPHER(K, zeros(128)) */
    tmp = vdupq_n_u8(0);
    lstar = aes128armv8_encrypt1_neon(tmp, aes_encrypt_key);
    /* L_$ = double(L_*) */
    ldollar = double_block_neon(lstar); 
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
    nonce = vld1q_u8(nonce_b);
    ktop = aes128armv8_encrypt1_neon(nonce, aes_encrypt_key);
    /* Stretch = Ktop || (Ktop[1..64] xor Ktop[9..72]) */
    vst1q_u8(stretch, ktop);
    vst1_u8((stretch+16),
            vget_low_u8(veorq_u8(vextq_u8(ktop,ktop,1), ktop)));
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
    offset = vld1q_u8(offset_b);

    /* Checksum_0 = zeros(128) */
    sum = veorq_u8(sum,sum);

    /* Hash associated data */
    hash(ad_hash, k, a, abytes, lstar, prelv, aes_encrypt_key);

    /* Process any whole blocks */
    i=1;
    if (encrypting) {
#if !defined(DONTUNROLL)
#if 0
      if (inbytes>=128) {
        for (; i<=(inbytes/16)-7; i+=8, in+=128, out+=128) {
          uint8x16_t offsetu0, tmpu0, inv0;
          uint8x16_t offsetu1, tmpu1, inv1;
          uint8x16_t offsetu2, tmpu2, inv2;
          uint8x16_t offsetu3, tmpu3, inv3;
          uint8x16_t offsetu4, tmpu4, inv4;
          uint8x16_t offsetu5, tmpu5, inv5;
          uint8x16_t offsetu6, tmpu6, inv6;
          uint8x16_t offsetu7, tmpu7, inv7;


 	  inv0 = vld1q_u8((in+0));
          inv1 = vld1q_u8((in+16));
          inv2 = vld1q_u8((in+32));
          inv3 = vld1q_u8((in+48));
          inv4 = vld1q_u8((in+64));
          inv5 = vld1q_u8((in+80));
          inv6 = vld1q_u8((in+96));
          inv7 = vld1q_u8((in+112));


          tmpu0 = prelv[__builtin_ctz(i+0)];
          offset = veorq_u8(offset, tmpu0);
          tmpu0 = veorq_u8(offset, inv0);
          sum = veorq_u8(inv0, sum);
          offsetu0 = offset;

          tmpu1 = prelv[__builtin_ctz(i+1)];
          offset = veorq_u8(offset, tmpu1);
          tmpu1 = veorq_u8(offset, inv1);
          sum = veorq_u8(inv1, sum);
          offsetu1 = offset;

          tmpu2 = prelv[__builtin_ctz(i+2)];
          offset = veorq_u8(offset, tmpu2);
          tmpu2 = veorq_u8(offset, inv2);
          sum = veorq_u8(inv2, sum);
          offsetu2 = offset;

          tmpu3 = prelv[__builtin_ctz(i+3)];
          offset = veorq_u8(offset, tmpu3);
          tmpu3 = veorq_u8(offset, inv3);
          sum = veorq_u8(inv3, sum);
          offsetu3 = offset;

          tmpu4 = prelv[__builtin_ctz(i+4)];
          offset = veorq_u8(offset, tmpu4);
          tmpu4 = veorq_u8(offset, inv4);
          sum = veorq_u8(inv4, sum);
          offsetu4 = offset;

          tmpu5 = prelv[__builtin_ctz(i+5)];
          offset = veorq_u8(offset, tmpu5);
          tmpu5 = veorq_u8(offset, inv5);
          sum = veorq_u8(inv5, sum);
          offsetu5 = offset;

          tmpu6 = prelv[__builtin_ctz(i+6)];
          offset = veorq_u8(offset, tmpu6);
          tmpu6 = veorq_u8(offset, inv6);
          sum = veorq_u8(inv6, sum);
          offsetu6 = offset;

          tmpu7 = prelv[__builtin_ctz(i+7)];
          offset = veorq_u8(offset, tmpu7);
          tmpu7 = veorq_u8(offset, inv7);
          sum = veorq_u8(inv7, sum);
          offsetu7 = offset;

          aes128armv8_encrypt8_xor_neon(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      tmpu4,tmpu5,tmpu6,tmpu7,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      offsetu4,offsetu5,offsetu6,offsetu7,
                                      aes_encrypt_key);
       }
     }
#endif
     if (inbytes>=64) {
        for (; i<=(inbytes/16)-3; i+=4, in+=64, out+=64) {
          uint8x16_t offsetu0, tmpu0, inv0;
          uint8x16_t offsetu1, tmpu1, inv1;
          uint8x16_t offsetu2, tmpu2, inv2;
          uint8x16_t offsetu3, tmpu3, inv3;

          inv0 = vld1q_u8((in+0));
          inv1 = vld1q_u8((in+16));
          inv2 = vld1q_u8((in+32));
          inv3 = vld1q_u8((in+48));

	  tmpu0 = prelv[__builtin_ctz(i+0)];
          offset = veorq_u8(offset, tmpu0);
          tmpu0 = veorq_u8(offset, inv0);
          sum = veorq_u8(inv0, sum);
          offsetu0 = offset;

	  tmpu1 = prelv[__builtin_ctz(i+1)];
          offset = veorq_u8(offset, tmpu1);
          tmpu1 = veorq_u8(offset, inv1);
          sum = veorq_u8(inv1, sum);
          offsetu1 = offset;

	  tmpu2 = prelv[__builtin_ctz(i+2)];
          offset = veorq_u8(offset, tmpu2);
          tmpu2 = veorq_u8(offset, inv2);
          sum = veorq_u8(inv2, sum);
          offsetu2 = offset;

	  tmpu3 = prelv[__builtin_ctz(i+3)];
          offset = veorq_u8(offset, tmpu3);
          tmpu3 = veorq_u8(offset, inv3);
          sum = veorq_u8(inv3, sum);
          offsetu3 = offset;

          aes128armv8_encrypt4_xor_neon(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      aes_encrypt_key);
        }
      }
#endif
      for (; i<=inbytes/16; i++, in=in+16, out=out+16) {
        /* Offset_i = Offset_{i-1} xor L_{ntz(i)} */
        tmp = prelv[__builtin_ctz(i)];
 
        offset = veorq_u8(offset, tmp);
        tmp = veorq_u8(offset, vld1q_u8(in));
        
        /* Checksum_i = Checksum_{i-1} xor P_i */
        sum = veorq_u8(vld1q_u8(in), sum);
        /* C_i = Offset_i xor ENCIPHER(K, P_i xor Offset_i) */
        tmp = aes128armv8_encrypt1_neon(tmp, aes_encrypt_key);
        outv = veorq_u8(offset, tmp);
        vst1q_u8(out, outv);
      }
    } else {
#if  !defined(DONTUNROLL)
      if (inbytes>=128) {
        for (; i<=(inbytes/16)-7; i+=8, in+=128, out+=128) {
          uint8x16_t offsetu0, tmpu0, inv0;
          uint8x16_t offsetu1, tmpu1, inv1;
          uint8x16_t offsetu2, tmpu2, inv2;
          uint8x16_t offsetu3, tmpu3, inv3;
          uint8x16_t offsetu4, tmpu4, inv4;
          uint8x16_t offsetu5, tmpu5, inv5;
          uint8x16_t offsetu6, tmpu6, inv6;
          uint8x16_t offsetu7, tmpu7, inv7;

          inv0 = vld1q_u8((in+0));
          inv1 = vld1q_u8((in+16));
          inv2 = vld1q_u8((in+32));
          inv3 = vld1q_u8((in+48));
          inv4 = vld1q_u8((in+64));
          inv5 = vld1q_u8((in+80));
          inv6 = vld1q_u8((in+96));
          inv7 = vld1q_u8((in+112));


          tmpu0= prelv[__builtin_ctz(i+0)];
          offset = veorq_u8(offset, tmpu0);
          tmpu0 = veorq_u8(offset, inv0);
          offsetu0 = offset;

          tmpu1= prelv[__builtin_ctz(i+1)];
          offset = veorq_u8(offset, tmpu1);
          tmpu1 = veorq_u8(offset, inv1);
          offsetu1 = offset;

          tmpu2= prelv[__builtin_ctz(i+2)];
          offset = veorq_u8(offset, tmpu2);
          tmpu2 = veorq_u8(offset, inv2);
          offsetu2 = offset;

          tmpu3= prelv[__builtin_ctz(i+3)];
          offset = veorq_u8(offset, tmpu3);
          tmpu3 = veorq_u8(offset, inv3);
          offsetu3 = offset;

          tmpu4= prelv[__builtin_ctz(i+4)];
          offset = veorq_u8(offset, tmpu4);
          tmpu4 = veorq_u8(offset, inv4);
          offsetu4 = offset;

          tmpu5= prelv[__builtin_ctz(i+5)];
          offset = veorq_u8(offset, tmpu5);
          tmpu5 = veorq_u8(offset, inv5);
          offsetu5 = offset;

          tmpu6= prelv[__builtin_ctz(i+6)];
          offset = veorq_u8(offset, tmpu6);
          tmpu6 = veorq_u8(offset, inv6);
          offsetu6 = offset;

          tmpu7= prelv[__builtin_ctz(i+7)];
          offset = veorq_u8(offset, tmpu7);
          tmpu7 = veorq_u8(offset, inv7);
          offsetu7 = offset;

          aes128armv8_decrypt8_xor_neon(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      tmpu4,tmpu5,tmpu6,tmpu7,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      offsetu4,offsetu5,offsetu6,offsetu7,
                                      aes_decrypt_key);
          sum = veorq_u8(vld1q_u8((out+0)), sum);
          sum = veorq_u8(vld1q_u8((out+16)), sum);
          sum = veorq_u8(vld1q_u8((out+32)), sum);
          sum = veorq_u8(vld1q_u8((out+48)), sum);
          sum = veorq_u8(vld1q_u8((out+64)), sum);
          sum = veorq_u8(vld1q_u8((out+80)), sum);
          sum = veorq_u8(vld1q_u8((out+96)), sum);
          sum = veorq_u8(vld1q_u8((out+112)), sum);
        }
      }

      if (inbytes>=64) {
        for (; i<=(inbytes/16)-3; i+=4, in+=64, out+=64) {
          uint8x16_t offsetu0, tmpu0, inv0;
          uint8x16_t offsetu1, tmpu1, inv1;
          uint8x16_t offsetu2, tmpu2, inv2;
          uint8x16_t offsetu3, tmpu3, inv3;

          inv0 = vld1q_u8((in+0));
          inv1 = vld1q_u8((in+16));
          inv2 = vld1q_u8((in+32));
          inv3 = vld1q_u8((in+48));

          tmpu0= prelv[__builtin_ctz(i+0)];
          offset = veorq_u8(offset, tmpu0);
          tmpu0 = veorq_u8(offset, inv0);
          offsetu0 = offset;

          tmpu1= prelv[__builtin_ctz(i+1)];
          offset = veorq_u8(offset, tmpu1);
          tmpu1 = veorq_u8(offset, inv1);
          offsetu1 = offset;

          tmpu2= prelv[__builtin_ctz(i+2)];
          offset = veorq_u8(offset, tmpu2);
          tmpu2 = veorq_u8(offset, inv2);
          offsetu2 = offset;

          tmpu3= prelv[__builtin_ctz(i+3)];
          offset = veorq_u8(offset, tmpu3);
          tmpu3 = veorq_u8(offset, inv3);
          offsetu3 = offset;

          aes128armv8_decrypt4_xor_neon(out,tmpu0,tmpu1,tmpu2,tmpu3,
                                      offsetu0,offsetu1,offsetu2,offsetu3,
                                      aes_decrypt_key);
          sum = veorq_u8(vld1q_u8((out+0)), sum);
          sum = veorq_u8(vld1q_u8((out+16)), sum);
          sum = veorq_u8(vld1q_u8((out+32)), sum);
          sum = veorq_u8(vld1q_u8((out+48)), sum);
        }
      }
#endif
      for (; i<=inbytes/16; i++, in=in+16, out=out+16) {
        /* Offset_i = Offset_{i-1} xor L_{ntz(i)} */
        tmp= prelv[__builtin_ctz(i)];
        offset = veorq_u8(offset, tmp);        
        tmp = veorq_u8(offset, vld1q_u8(in));

        /* P_i = Offset_i xor DECIPHER(K, C_i xor Offset_i) */
        tmp = aes128armv8_decrypt1_neon(tmp, aes_decrypt_key);
        outv = veorq_u8(offset, tmp);
        vst1q_u8(out, outv);
        /* Checksum_i = Checksum_{i-1} xor P_i */
        sum = veorq_u8(outv, sum);
      }
    }

    /* Process any final partial block and compute raw tag */

    inbytes = inbytes % 16;  /* Bytes in final block */
    if (inbytes > 0) {
        /* Offset_* = Offset_m xor L_* */
        offset = veorq_u8(offset, lstar);
        /* Pad = ENCIPHER(K, Offset_*) */
        pad = aes128armv8_encrypt1_neon(offset, aes_encrypt_key);
        
        if (encrypting) {
            /* Checksum_* = Checksum_m xor (P_* || 1 || zeros(127-bitlen(P_*))) */
            unsigned char tmp_b[16];
            unsigned char pad_b[16];
            memset(tmp_b, 0, 16);
            memcpy(tmp_b, in, inbytes);
            tmp_b[inbytes] = 0x80;
            tmp = vld1q_u8(tmp_b);
            sum = veorq_u8(tmp, sum);
            /* C_* = P_* xor Pad[1..bitlen(P_*)] */
            pad = veorq_u8(tmp, pad);
            vst1q_u8(pad_b, pad);
            memcpy(out, pad_b, inbytes);
            out = out + inbytes;
        } else {
            /* P_* = C_* xor Pad[1..bitlen(C_*)] */
            unsigned char tmp_b[16];
            unsigned char pad_b[16];
            vst1q_u8(pad_b, pad);
            memcpy(tmp_b, pad_b, 16);
            memcpy(tmp_b, in, inbytes);
            xor_block(tmp_b,pad_b,tmp_b);
            tmp_b[inbytes] = 0x80;
            memcpy(out, tmp_b, inbytes);
            tmp = vld1q_u8(tmp_b);
            /* Checksum_* = Checksum_m xor (P_* || 1 || zeros(127-bitlen(P_*))) */
            sum = veorq_u8(tmp, sum);
            in = in + inbytes;
        }
    }
    
    /* Tag = ENCIPHER(K, Checksum xor Offset xor L_$) xor HASH(K,A) */
    tmp = veorq_u8(sum, offset);
    tmp = veorq_u8(tmp, ldollar);
    tag = aes128armv8_encrypt1_neon(tmp, aes_encrypt_key);
    tag = veorq_u8(vld1q_u8(ad_hash), tag);
    
    if (encrypting) {
        unsigned char tag_b[16];
        vst1q_u8(tag_b, tag);
        memcpy(out, tag_b, TAGBYTES);
        return 0;
    } else {
        unsigned char tag_b[16];
        vst1q_u8(tag_b, tag);
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

