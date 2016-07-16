/*
  aesenc-int.c version $Date: 2016/04/01 17:05:23 $
  AES-GCM.
  Romain Dolbeau
  Public Domain
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <immintrin.h>
#include "crypto_aead.h"

#include <openssl/evp.h>

#define ACCBY8

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

#define print16c(s,A)                           \
  do {                                          \
    int k;                                      \
    printf("%s: %s = ", s, ""#A);               \
    for (k = 0 ; k < 16 ; k++) {                \
      printf("%02hhx", A[k]);                   \
      if ((k%4)==3) printf(" ");                \
    }                                           \
    printf("\n");                               \
  }while (0)

static inline void aesni_key256_expand(const unsigned char* key, __m128i rkeys[16]) {
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

/** single, by-the-book AES encryption with AES-NI */
static inline void aesni_encrypt1(unsigned char *out, unsigned char *n, __m128i rkeys[16]) {
  __m128i nv = _mm_load_si128((const __m128i *)n);
  int i;
  __m128i temp = _mm_xor_si128(nv, rkeys[0]);
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    temp = _mm_aesenc_si128(temp, rkeys[i]);
  }
  temp = _mm_aesenclast_si128(temp, rkeys[14]);
  _mm_store_si128((__m128i*)(out), temp);
}

/** multiple-blocks-at-once AES encryption with AES-NI ;
    on Haswell, aesenc as a latency of 7 and a througput of 1
    so the sequence of aesenc should be bubble-free, if you
    have at least 8 blocks. Let's build an arbitratry-sized
    function */
/* Step 1 : loading the nonce */
/* load & increment the n vector (non-vectorized, unused for now) */
#define NVx(a)                                                  \
  __m128i nv##a = _mm_shuffle_epi8(_mm_load_si128((const __m128i *)n), pt);n[3]++

/* Step 2 : define value in round one (xor with subkey #0, aka key) */
#define TEMPx(a)                                        \
  __m128i temp##a = _mm_xor_si128(nv##a, rkeys[0])

/* Step 3: one round of AES */
#define AESENCx(a)                                      \
  temp##a =  _mm_aesenc_si128(temp##a, rkeys[i])

/* Step 4: last round of AES */
#define AESENCLASTx(a)                                  \
  temp##a = _mm_aesenclast_si128(temp##a, rkeys[14])

/* Step 5: store result */
#define STOREx(a)                                       \
  _mm_store_si128((__m128i*)(out+(a*16)), temp##a)

/* all the MAKE* macros are for automatic explicit unrolling */
#define MAKE2(X)                                \
  X(0);X(1)

#define MAKE4(X)                                \
  X(0);X(1);X(2);X(3)

#define MAKE6(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5)

#define MAKE7(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6)

#define MAKE8(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7)

#define MAKE10(X)                               \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7);                          \
  X(8);X(9)

#define MAKE12(X)                               \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7);                          \
  X(8);X(9);X(10);X(11)

static inline void inc(unsigned char *n) {
  (*(unsigned int*)&n[12]) = _bswap(1+(_bswap((*(unsigned int*)&n[12]))));
}
static inline void incle(unsigned char *n) {
  (*(unsigned int*)&n[12]) = (1+(((*(unsigned int*)&n[12]))));
}

/* create a function of unrolling N ; the MAKEN is the unrolling
   macro, defined above. The N in MAKEN must match N, obviously. */
#define FUNC(N, MAKEN)                          \
  static inline void aesni_encrypt##N(unsigned char *out, unsigned int *n, const __m128i rkeys[16]) { \
    const __m128i pt = _mm_set_epi8(12,13,14,15,11,10,9,8,7,6,5,4,3,2,1,0); \
    MAKEN(NVx);                                                         \
    int i;                                                              \
    MAKEN(TEMPx);                                                       \
    for (i = 1 ; i < 14 ; i++) {                                        \
      MAKEN(AESENCx);                                                   \
    }                                                                   \
    MAKEN(AESENCLASTx);                                                 \
    MAKEN(STOREx);                                                      \
  }

/* and now building our unrolled function is trivial */
FUNC(2, MAKE2)
FUNC(4, MAKE4)
FUNC(6, MAKE6)
FUNC(7, MAKE7)
FUNC(8, MAKE8)
FUNC(10, MAKE10)
FUNC(12, MAKE12)
  
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
  

/* all GF(2^128) fnctions are by the book, meaning this one:
   <https://software.intel.com/sites/default/files/managed/72/cc/clmul-wp-rev-2.02-2014-04-20.pdf>
*/
static inline void addmul(unsigned char *c,
                          const unsigned char *a, int xlen,
                          const unsigned char *b) {
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  const __m128i ff = _mm_set1_epi32(0xFFFFFFFF);
  __m128i A = _mm_loadu_si128((const __m128i*)a);
  A = _mm_shuffle_epi8(A, rev);
  if (xlen < 16) { // less than 16 useful bytes - insert zeroes where needed
    unsigned long long mask = -1ull ^ (1ull<<(((16-xlen)%8)*8))-1ull;
    __m128i vm;
    if (xlen>8) {
      vm = _mm_insert_epi64(ff, mask, 0);
    } else {
      vm = _mm_insert_epi64(_mm_setzero_si128(),mask,1);
    }
    A = _mm_and_si128(vm, A);
  }
  __m128i B = _mm_loadu_si128((const __m128i*)b);
  __m128i C = _mm_loadu_si128((const __m128i*)c);
  A = _mm_xor_si128(A,C);
  __m128i tmp3 = _mm_clmulepi64_si128(A, B, 0x00);
  __m128i tmp4 = _mm_clmulepi64_si128(A, B, 0x10);
  __m128i tmp5 = _mm_clmulepi64_si128(A, B, 0x01);
  __m128i tmp6 = _mm_clmulepi64_si128(A, B, 0x11);
  __m128i tmp10 = _mm_xor_si128(tmp4, tmp5);
  __m128i tmp13 = _mm_slli_si128(tmp10, 8);
  __m128i tmp11 = _mm_srli_si128(tmp10, 8);
  __m128i tmp15 = _mm_xor_si128(tmp3, tmp13);
  __m128i tmp17 = _mm_xor_si128(tmp6, tmp11);
  __m128i tmp7 = _mm_srli_epi32(tmp15, 31);
  __m128i tmp8 = _mm_srli_epi32(tmp17, 31);
  __m128i tmp16 = _mm_slli_epi32(tmp15, 1);
  __m128i tmp18 = _mm_slli_epi32(tmp17, 1);
  __m128i tmp9 = _mm_srli_si128(tmp7, 12);
  __m128i tmp22 = _mm_slli_si128(tmp8, 4);
  __m128i tmp25 = _mm_slli_si128(tmp7, 4);
  __m128i tmp29 =_mm_or_si128(tmp16, tmp25);
  __m128i tmp19 = _mm_or_si128(tmp18, tmp22);
  __m128i tmp20 = _mm_or_si128(tmp19, tmp9);
  __m128i tmp26 = _mm_slli_epi32(tmp29, 31);
  __m128i tmp23 = _mm_slli_epi32(tmp29, 30);
  __m128i tmp32 = _mm_slli_epi32(tmp29, 25);
  __m128i tmp27 = _mm_xor_si128(tmp26, tmp23);
  __m128i tmp28 = _mm_xor_si128(tmp27, tmp32);
  __m128i tmp24 = _mm_srli_si128(tmp28, 4);
  __m128i tmp33 = _mm_slli_si128(tmp28, 12);
  __m128i tmp30 = _mm_xor_si128(tmp29, tmp33);
  __m128i tmp2 = _mm_srli_epi32(tmp30, 1);
  __m128i tmp12 = _mm_srli_epi32(tmp30, 2);
  __m128i tmp14 = _mm_srli_epi32(tmp30, 7);
  __m128i tmp34 = _mm_xor_si128(tmp2, tmp12);
  __m128i tmp35 = _mm_xor_si128(tmp34, tmp14);
  __m128i tmp36 = _mm_xor_si128(tmp35, tmp24);
  __m128i tmp31 = _mm_xor_si128(tmp30, tmp36);
  __m128i tmp21 = _mm_xor_si128(tmp20, tmp31);
  _mm_storeu_si128((__m128i*)c, tmp21);
}

/* pure multiplication, for pre-computing  powers of H */
static inline __m128i mulv(__m128i A,
                           __m128i B) {
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  __m128i tmp3 = _mm_clmulepi64_si128(A, B, 0x00);
  __m128i tmp4 = _mm_clmulepi64_si128(A, B, 0x10);
  __m128i tmp5 = _mm_clmulepi64_si128(A, B, 0x01);
  __m128i tmp6 = _mm_clmulepi64_si128(A, B, 0x11);
  __m128i tmp10 = _mm_xor_si128(tmp4, tmp5);
  __m128i tmp13 = _mm_slli_si128(tmp10, 8);
  __m128i tmp11 = _mm_srli_si128(tmp10, 8);
  __m128i tmp15 = _mm_xor_si128(tmp3, tmp13);
  __m128i tmp17 = _mm_xor_si128(tmp6, tmp11);
  __m128i tmp7 = _mm_srli_epi32(tmp15, 31);
  __m128i tmp8 = _mm_srli_epi32(tmp17, 31);
  __m128i tmp16 = _mm_slli_epi32(tmp15, 1);
  __m128i tmp18 = _mm_slli_epi32(tmp17, 1);
  __m128i tmp9 = _mm_srli_si128(tmp7, 12);
  __m128i tmp22 = _mm_slli_si128(tmp8, 4);
  __m128i tmp25 = _mm_slli_si128(tmp7, 4);
  __m128i tmp29 =_mm_or_si128(tmp16, tmp25);
  __m128i tmp19 = _mm_or_si128(tmp18, tmp22);
  __m128i tmp20 = _mm_or_si128(tmp19, tmp9);
  __m128i tmp26 = _mm_slli_epi32(tmp29, 31);
  __m128i tmp23 = _mm_slli_epi32(tmp29, 30);
  __m128i tmp32 = _mm_slli_epi32(tmp29, 25);
  __m128i tmp27 = _mm_xor_si128(tmp26, tmp23);
  __m128i tmp28 = _mm_xor_si128(tmp27, tmp32);
  __m128i tmp24 = _mm_srli_si128(tmp28, 4);
  __m128i tmp33 = _mm_slli_si128(tmp28, 12);
  __m128i tmp30 = _mm_xor_si128(tmp29, tmp33);
  __m128i tmp2 = _mm_srli_epi32(tmp30, 1);
  __m128i tmp12 = _mm_srli_epi32(tmp30, 2);
  __m128i tmp14 = _mm_srli_epi32(tmp30, 7);
  __m128i tmp34 = _mm_xor_si128(tmp2, tmp12);
  __m128i tmp35 = _mm_xor_si128(tmp34, tmp14);
  __m128i tmp36 = _mm_xor_si128(tmp35, tmp24);
  __m128i tmp31 = _mm_xor_si128(tmp30, tmp36);
  __m128i C = _mm_xor_si128(tmp20, tmp31);
  return C;
}

/* vector-only version */
static inline __m128i addmulv(__m128i C,
                              __m128i A,
                              __m128i B) {
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  A = _mm_shuffle_epi8(A, rev);
  A = _mm_xor_si128(A,C);
  __m128i tmp3 = _mm_clmulepi64_si128(A, B, 0x00);
  __m128i tmp4 = _mm_clmulepi64_si128(A, B, 0x10);
  __m128i tmp5 = _mm_clmulepi64_si128(A, B, 0x01);
  __m128i tmp6 = _mm_clmulepi64_si128(A, B, 0x11);
  __m128i tmp10 = _mm_xor_si128(tmp4, tmp5);
  __m128i tmp13 = _mm_slli_si128(tmp10, 8);
  __m128i tmp11 = _mm_srli_si128(tmp10, 8);
  __m128i tmp15 = _mm_xor_si128(tmp3, tmp13);
  __m128i tmp17 = _mm_xor_si128(tmp6, tmp11);
  __m128i tmp7 = _mm_srli_epi32(tmp15, 31);
  __m128i tmp8 = _mm_srli_epi32(tmp17, 31);
  __m128i tmp16 = _mm_slli_epi32(tmp15, 1);
  __m128i tmp18 = _mm_slli_epi32(tmp17, 1);
  __m128i tmp9 = _mm_srli_si128(tmp7, 12);
  __m128i tmp22 = _mm_slli_si128(tmp8, 4);
  __m128i tmp25 = _mm_slli_si128(tmp7, 4);
  __m128i tmp29 =_mm_or_si128(tmp16, tmp25);
  __m128i tmp19 = _mm_or_si128(tmp18, tmp22);
  __m128i tmp20 = _mm_or_si128(tmp19, tmp9);
  __m128i tmp26 = _mm_slli_epi32(tmp29, 31);
  __m128i tmp23 = _mm_slli_epi32(tmp29, 30);
  __m128i tmp32 = _mm_slli_epi32(tmp29, 25);
  __m128i tmp27 = _mm_xor_si128(tmp26, tmp23);
  __m128i tmp28 = _mm_xor_si128(tmp27, tmp32);
  __m128i tmp24 = _mm_srli_si128(tmp28, 4);
  __m128i tmp33 = _mm_slli_si128(tmp28, 12);
  __m128i tmp30 = _mm_xor_si128(tmp29, tmp33);
  __m128i tmp2 = _mm_srli_epi32(tmp30, 1);
  __m128i tmp12 = _mm_srli_epi32(tmp30, 2);
  __m128i tmp14 = _mm_srli_epi32(tmp30, 7);
  __m128i tmp34 = _mm_xor_si128(tmp2, tmp12);
  __m128i tmp35 = _mm_xor_si128(tmp34, tmp14);
  __m128i tmp36 = _mm_xor_si128(tmp35, tmp24);
  __m128i tmp31 = _mm_xor_si128(tmp30, tmp36);
  C = _mm_xor_si128(tmp20, tmp31);
  return C;
}

/* 4 multiply-accumulate at once; again
   <https://software.intel.com/sites/default/files/managed/72/cc/clmul-wp-rev-2.02-2014-04-20.pdf>
   for the Aggregated Reduction Method & sample code.
*/
static inline __m128i reduce4(__m128i H0, __m128i H1, __m128i H2, __m128i H3,
                              __m128i X0, __m128i X1, __m128i X2, __m128i X3, __m128i acc)
{
  /*algorithm by Krzysztof Jankowski, Pierre Laurent - Intel*/
#define RED_DECL(a) __m128i H##a##_X##a##_lo, H##a##_X##a##_hi, tmp##a, tmp##a##B
  MAKE4(RED_DECL);
  __m128i lo, tmplo, hi, tmphi;
  __m128i tmp8, tmp9;
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  /* byte-revert the inputs & xor the first one into the accumulator */
#define RED_SHUFFLE(a) X##a = _mm_shuffle_epi8(X##a, rev)
  MAKE4(RED_SHUFFLE);
  X3 = _mm_xor_si128(X3,acc);

  /* 4 low H*X (x0*h0) */
#define RED_MUL_LOW(a) H##a##_X##a##_lo = _mm_clmulepi64_si128(H##a, X##a, 0x00)
  MAKE4(RED_MUL_LOW);
  lo = _mm_xor_si128(H0_X0_lo, H1_X1_lo);
  lo = _mm_xor_si128(lo, H2_X2_lo);
  lo = _mm_xor_si128(lo, H3_X3_lo);

  /* 4 high H*X (x1*h1) */
#define RED_MUL_HIGH(a) H##a##_X##a##_hi = _mm_clmulepi64_si128(H##a, X##a, 0x11)
  MAKE4(RED_MUL_HIGH);
  hi = _mm_xor_si128(H0_X0_hi, H1_X1_hi);
  hi = _mm_xor_si128(hi, H2_X2_hi);
  hi = _mm_xor_si128(hi, H3_X3_hi);

  /* 4 middle H*X, using Karatsuba, i.e.
     x1*h0+x0*h1 =(x1+x0)*(h1+h0)-x1*h1-x0*h0
     we already have all x1y1 & x0y0 (accumulated in hi & lo)
     (0 is low half and 1 is high half)
  */
  /* permute the high and low 64 bits in H1 & X1,
     so create (h0,h1) from (h1,h0) and (x0,x1) from (x1,x0),
     then compute (h0+h1,h1+h0) and (x0+x1,x1+x0),
     and finally multiply
  */
#define RED_MUL_MID(a)                                \
  tmp##a    = _mm_shuffle_epi32(H##a, 0x4e);          \
  tmp##a##B = _mm_shuffle_epi32(X##a, 0x4e);          \
  tmp##a    = _mm_xor_si128(tmp##a, H##a);            \
  tmp##a##B = _mm_xor_si128(tmp##a##B, X##a);         \
  tmp##a    = _mm_clmulepi64_si128(tmp##a, tmp##a##B, 0x00)
  MAKE4(RED_MUL_MID);

  /* substracts x1*h1 and x0*h0 */
#if 1
  tmp0 = _mm_xor_si128(tmp0, lo);
  tmp0 = _mm_xor_si128(tmp0, hi);
  tmp0 = _mm_xor_si128(tmp1, tmp0);
  tmp0 = _mm_xor_si128(tmp2, tmp0);
  tmp0 = _mm_xor_si128(tmp3, tmp0);
#else
  tmp0 = _mm_xor_si128(tmp0, lo);
  tmp1 = _mm_xor_si128(tmp1, hi);
  tmp2 = _mm_xor_si128(tmp2, tmp3);
  tmp1 = _mm_xor_si128(tmp0, tmp1);
  tmp0 = _mm_xor_si128(tmp1,tmp2);
#endif

  /* reduction */
  tmp0B = _mm_slli_si128(tmp0, 8);
  tmp0  = _mm_srli_si128(tmp0, 8);
  lo    = _mm_xor_si128(tmp0B, lo);
  hi    = _mm_xor_si128(tmp0, hi);
  tmp3  = lo;
  tmp2B = hi;
  tmp3B = _mm_srli_epi32(tmp3, 31);
  tmp8  = _mm_srli_epi32(tmp2B, 31);
  tmp3  = _mm_slli_epi32(tmp3, 1);
  tmp2B = _mm_slli_epi32(tmp2B, 1);
  tmp9  = _mm_srli_si128(tmp3B, 12);
  tmp8  = _mm_slli_si128(tmp8, 4);
  tmp3B = _mm_slli_si128(tmp3B, 4);
  tmp3  = _mm_or_si128(tmp3, tmp3B);
  tmp2B = _mm_or_si128(tmp2B, tmp8);
  tmp2B = _mm_or_si128(tmp2B, tmp9);
  tmp3B = _mm_slli_epi32(tmp3, 31);
  tmp8  = _mm_slli_epi32(tmp3, 30);
  tmp9  = _mm_slli_epi32(tmp3, 25);
  tmp3B = _mm_xor_si128(tmp3B, tmp8);
  tmp3B = _mm_xor_si128(tmp3B, tmp9);
  tmp8  = _mm_srli_si128(tmp3B, 4);
  tmp3B = _mm_slli_si128(tmp3B, 12);
  tmp3  = _mm_xor_si128(tmp3, tmp3B);
  tmp2  = _mm_srli_epi32(tmp3, 1);
  tmp0B = _mm_srli_epi32(tmp3, 2);
  tmp1B = _mm_srli_epi32(tmp3, 7);
  tmp2  = _mm_xor_si128(tmp2, tmp0B);
  tmp2  = _mm_xor_si128(tmp2, tmp1B);
  tmp2  = _mm_xor_si128(tmp2, tmp8);
  tmp3  = _mm_xor_si128(tmp3, tmp2);
  tmp2B = _mm_xor_si128(tmp2B, tmp3);
  return tmp2B;
}


/* 8 multiply-accumulate at once; again
   <https://software.intel.com/sites/default/files/managed/72/cc/clmul-wp-rev-2.02-2014-04-20.pdf>
   for the Aggregated Reduction Method & sample code.
*/
#ifdef ACCBY8
static inline __m128i reduce8(__m128i H0, __m128i H1, __m128i H2, __m128i H3,
                              __m128i H4, __m128i H5, __m128i H6, __m128i H7,
                              __m128i X0, __m128i X1, __m128i X2, __m128i X3,
                              __m128i X4, __m128i X5, __m128i X6, __m128i X7, __m128i acc)
{
  /*algorithm by Krzysztof Jankowski, Pierre Laurent - Intel*/
  MAKE8(RED_DECL);
  __m128i lo, tmplo, hi, tmphi;
  __m128i tmp8, tmp9;
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  /* byte-revert the inputs & xor the first one into the accumulator */
  MAKE8(RED_SHUFFLE);
  X7 = _mm_xor_si128(X7,acc);

  /* 8 low H*X (x0*h0) */
  MAKE8(RED_MUL_LOW);
  lo = _mm_xor_si128(H0_X0_lo, H1_X1_lo);
  lo = _mm_xor_si128(lo, H2_X2_lo);
  lo = _mm_xor_si128(lo, H3_X3_lo);
  lo = _mm_xor_si128(lo, H4_X4_lo);
  lo = _mm_xor_si128(lo, H5_X5_lo);
  lo = _mm_xor_si128(lo, H6_X6_lo);
  lo = _mm_xor_si128(lo, H7_X7_lo);

  /* 8 high H*X (x1*h1) */
#define RED_MUL_HIGH(a) H##a##_X##a##_hi = _mm_clmulepi64_si128(H##a, X##a, 0x11)
  MAKE8(RED_MUL_HIGH);
  hi = _mm_xor_si128(H0_X0_hi, H1_X1_hi);
  hi = _mm_xor_si128(hi, H2_X2_hi);
  hi = _mm_xor_si128(hi, H3_X3_hi);
  hi = _mm_xor_si128(hi, H4_X4_hi);
  hi = _mm_xor_si128(hi, H5_X5_hi);
  hi = _mm_xor_si128(hi, H6_X6_hi);
  hi = _mm_xor_si128(hi, H7_X7_hi);

  /* 8 middle H*X, using Karatsuba, i.e.
     x1*h0+x0*h1 =(x1+x0)*(h1+h0)-x1*h1-x0*h0
     we already have all x1y1 & x0y0 (accumulated in hi & lo)
     (0 is low half and 1 is high half)
  */
  /* permute the high and low 64 bits in H1 & X1,
     so create (h0,h1) from (h1,h0) and (x0,x1) from (x1,x0),
     then compute (h0+h1,h1+h0) and (x0+x1,x1+x0),
     and finally multiply
  */
#define RED_MUL_MID(a)                                \
  tmp##a    = _mm_shuffle_epi32(H##a, 0x4e);          \
  tmp##a##B = _mm_shuffle_epi32(X##a, 0x4e);          \
  tmp##a    = _mm_xor_si128(tmp##a, H##a);            \
  tmp##a##B = _mm_xor_si128(tmp##a##B, X##a);         \
  tmp##a    = _mm_clmulepi64_si128(tmp##a, tmp##a##B, 0x00)
  MAKE8(RED_MUL_MID);

  /* substracts x1*h1 and x0*h0 */
  tmp0 = _mm_xor_si128(tmp0, lo);
  tmp0 = _mm_xor_si128(tmp0, hi);
  tmp0 = _mm_xor_si128(tmp1, tmp0);
  tmp0 = _mm_xor_si128(tmp2, tmp0);
  tmp0 = _mm_xor_si128(tmp3, tmp0);
  tmp0 = _mm_xor_si128(tmp4, tmp0);
  tmp0 = _mm_xor_si128(tmp5, tmp0);
  tmp0 = _mm_xor_si128(tmp6, tmp0);
  tmp0 = _mm_xor_si128(tmp7, tmp0);

  /* reduction */
  tmp0B = _mm_slli_si128(tmp0, 8);
  tmp0  = _mm_srli_si128(tmp0, 8);
  lo    = _mm_xor_si128(tmp0B, lo);
  hi    = _mm_xor_si128(tmp0, hi);
  tmp3  = lo;
  tmp2B = hi;
  tmp3B = _mm_srli_epi32(tmp3, 31);
  tmp8  = _mm_srli_epi32(tmp2B, 31);
  tmp3  = _mm_slli_epi32(tmp3, 1);
  tmp2B = _mm_slli_epi32(tmp2B, 1);
  tmp9  = _mm_srli_si128(tmp3B, 12);
  tmp8  = _mm_slli_si128(tmp8, 4);
  tmp3B = _mm_slli_si128(tmp3B, 4);
  tmp3  = _mm_or_si128(tmp3, tmp3B);
  tmp2B = _mm_or_si128(tmp2B, tmp8);
  tmp2B = _mm_or_si128(tmp2B, tmp9);
  tmp3B = _mm_slli_epi32(tmp3, 31);
  tmp8  = _mm_slli_epi32(tmp3, 30);
  tmp9  = _mm_slli_epi32(tmp3, 25);
  tmp3B = _mm_xor_si128(tmp3B, tmp8);
  tmp3B = _mm_xor_si128(tmp3B, tmp9);
  tmp8  = _mm_srli_si128(tmp3B, 4);
  tmp3B = _mm_slli_si128(tmp3B, 12);
  tmp3  = _mm_xor_si128(tmp3, tmp3B);
  tmp2  = _mm_srli_epi32(tmp3, 1);
  tmp0B = _mm_srli_epi32(tmp3, 2);
  tmp1B = _mm_srli_epi32(tmp3, 7);
  tmp2  = _mm_xor_si128(tmp2, tmp0B);
  tmp2  = _mm_xor_si128(tmp2, tmp1B);
  tmp2  = _mm_xor_si128(tmp2, tmp8);
  tmp3  = _mm_xor_si128(tmp3, tmp2);
  tmp2B = _mm_xor_si128(tmp2B, tmp3);
  return tmp2B;
}
#endif

#define XORx(a)                                         \
  __m128i in##a = _mm_load_si128((__m128i*)(in+a*16));  \
  temp##a = _mm_xor_si128(temp##a, in##a)

/* unused ; can be used with the MAKEN() macro, but the reduce4()
   solution is faster (no surprise, as it's the point :-) */
#define GMULx(a) accv = addmulv(accv, temp##a, hv)

/* full encrypt & checksum 8 blocks at once */
static inline void aesni_encrypt8full(const unsigned char *out, unsigned int *n, const __m128i rkeys[16],
                                      const unsigned char *in, unsigned char* accum,
                                      const __m128i hv, const __m128i h2v, const __m128i h3v, const __m128i h4v
#ifdef ACCBY8
, const __m128i h5v, const __m128i h6v, const __m128i h7v, const __m128i h8v
#endif
) { 
  const __m128i pt = _mm_set_epi8(12,13,14,15,11,10,9,8,7,6,5,4,3,2,1,0);
  __m128i accv = _mm_loadu_si128((const __m128i*)accum);
  MAKE8(NVx);
  int i;
  MAKE8(TEMPx);
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    MAKE8(AESENCx);
  }
  MAKE8(AESENCLASTx);
  MAKE8(XORx);
  MAKE8(STOREx);
#ifdef ACCBY8
  accv = reduce8(hv, h2v, h3v, h4v, h5v, h6v, h7v, h8v,
                 temp7, temp6, temp5, temp4, temp3, temp2, temp1, temp0, accv);
#else
  accv = reduce4(hv, h2v, h3v, h4v, temp3, temp2, temp1, temp0, accv);
  accv = reduce4(hv, h2v, h3v, h4v, temp7, temp6, temp5, temp4, accv);
#endif
  _mm_storeu_si128((__m128i*)accum, accv);
}

/* full decrypt & checksum 8 blocks at once */
static inline void aesni_decrypt8full(const unsigned char *out, unsigned int *n, __m128i rkeys[16],
                                      const unsigned char *in, unsigned char* accum,
                                      const __m128i hv, const __m128i h2v, const __m128i h3v, const __m128i h4v
#ifdef ACCBY8
, const __m128i h5v, const __m128i h6v, const __m128i h7v, const __m128i h8v
#endif
) { 
  const __m128i pt = _mm_set_epi8(12,13,14,15,11,10,9,8,7,6,5,4,3,2,1,0);
  __m128i accv = _mm_loadu_si128((const __m128i*)accum);
  int i;
  MAKE8(NVx);
  MAKE8(TEMPx);
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    MAKE8(AESENCx);
  }
  MAKE8(AESENCLASTx);
  MAKE8(XORx);
#ifdef ACCBY8
  accv = reduce8(hv, h2v, h3v, h4v, h5v, h6v, h7v, h8v,
                in7, in6, in5, in4, in3, in2, in1, in0, accv);
#else
  accv = reduce4(hv, h2v, h3v, h4v, in3, in2, in1, in0, accv);
  accv = reduce4(hv, h2v, h3v, h4v, in7, in6, in5, in4, accv);
#endif
  _mm_storeu_si128((__m128i*)accum, accv);
  MAKE8(STOREx);
}

/* full AES-GCM encryption function */
int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen_,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  __m128i rkeys[16];
  unsigned long long i, j;
  unsigned long long adlen = adlen_;
  ALIGN16 unsigned char n2[16];
  ALIGN16 unsigned char H[16];
  ALIGN16 unsigned char T[16];
  ALIGN16 unsigned char accum[16];
  ALIGN16 unsigned char fb[16];
  aesni_key256_expand(k, rkeys);
  for (i = 0;i < 12;i++) n2[i] = npub[i];
  for (i = 12; i < 16;i++) n2[i] = 0;
  memset(accum, 0, 16);

  *clen = mlen + 16;

  aesni_encrypt1(H, accum /* only because it's zero */, rkeys);
  n2[15]++;
  aesni_encrypt1(T, n2, rkeys);
  
  (*(unsigned long long*)&fb[0]) = _bswap64((unsigned long long)(8*adlen));
  (*(unsigned long long*)&fb[8]) = _bswap64((unsigned long long)(8*mlen));
  
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

  /* we store H (and it's power) byte-reverted once and for all */
  __m128i Hv = _mm_shuffle_epi8(_mm_load_si128((const __m128i*)H), rev);
  _mm_store_si128((__m128i*)H,Hv);
  __m128i H2v = mulv(Hv, Hv);
  __m128i H3v = mulv(H2v, Hv);
  __m128i H4v = mulv(H3v, Hv);
#ifdef ACCBY8
  __m128i H5v = mulv(H4v, Hv);
  __m128i H6v = mulv(H5v, Hv);
  __m128i H7v = mulv(H6v, Hv);
  __m128i H8v = mulv(H7v, Hv);
#endif

  __m128i accv = _mm_loadu_si128((const __m128i*)accum);

#ifdef ACCBY8
  /* unrolled by 8 GCM */
  unsigned long long adlen_rnd128 = adlen & ~127ull;
  for (i = 0 ; i < adlen_rnd128 ; i+= 128) {
    __m128i X8 = _mm_loadu_si128((const __m128i*)(ad+i+ 0));
    __m128i X7 = _mm_loadu_si128((const __m128i*)(ad+i+16));
    __m128i X6 = _mm_loadu_si128((const __m128i*)(ad+i+32));
    __m128i X5 = _mm_loadu_si128((const __m128i*)(ad+i+48));
    __m128i X4 = _mm_loadu_si128((const __m128i*)(ad+i+64));
    __m128i X3 = _mm_loadu_si128((const __m128i*)(ad+i+80));
    __m128i X2 = _mm_loadu_si128((const __m128i*)(ad+i+96));
    __m128i X1 = _mm_loadu_si128((const __m128i*)(ad+i+112));
    accv = reduce8(Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v,
                   X1, X2, X3, X4, X5, X6, X7, X8, accv);
  }
  _mm_storeu_si128((__m128i*)accum, accv);

  /* GCM remainder loop */
  for (i = adlen_rnd128 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#else
  /* unrolled by 4 GCM (by 8 doesn't improve using reduce4) */
  unsigned long long adlen_rnd64 = adlen & ~63ull;
  for (i = 0 ; i < adlen_rnd64 ; i+= 64) {
    __m128i X4 = _mm_loadu_si128((const __m128i*)(ad+i+ 0));
    __m128i X3 = _mm_loadu_si128((const __m128i*)(ad+i+16));
    __m128i X2 = _mm_loadu_si128((const __m128i*)(ad+i+32));
    __m128i X1 = _mm_loadu_si128((const __m128i*)(ad+i+48));
    accv = reduce4(Hv, H2v, H3v, H4v, X1, X2, X3, X4, accv);
  }
  _mm_storeu_si128((__m128i*)accum, accv);

  /* GCM remainder loop */
  for (i = adlen_rnd64 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#endif

  unsigned long long mlen_rnd128  = mlen & ~127ull;

  /* this only does 8 full blocks, so no fancy bounds
     checking is necessary*/
#ifdef ACCBY8
#define LOOPRND128                                                      \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aesni_encrypt8full(c+i, (unsigned int*)n2, rkeys, m+i, accum, Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v); \
    }}
#else
#define LOOPRND128                                                      \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aesni_encrypt8full(c+i, (unsigned int*)n2, rkeys, m+i, accum, Hv, H2v, H3v, H4v); \
    }}
#endif
  
  /* remainder loop, with the slower GCM update to accomodate
     partial blocks */
#define LOOPRMD128                                       \
  {const int iter = 8;                                   \
    const int lb = iter * 16;                            \
  for (i = mlen_rnd128 ; i < mlen ; i+= lb) {            \
    ALIGN16 unsigned char outni[lb];                     \
    aesni_encrypt8(outni, (unsigned int*)n2, rkeys);                    \
    unsigned long long mj = lb;                          \
    if ((i+mj)>=mlen)                                    \
      mj = mlen-i;                                       \
    for (j = 0 ; j < mj ; j++)                           \
      c[i+j] = m[i+j] ^ outni[j];                        \
    for (j = 0 ; j < mj ; j+=16) {                       \
      unsigned long long bl = 16;                        \
      if (j+bl>=mj) {                                    \
        bl = mj-j;                                       \
      }                                                  \
      addmul(accum,c+i+j,bl,H);                          \
    }                                                    \
  }}
  
#define LOOP(iter)                                       \
  const int lb = iter * 16;                              \
  for (i = 0 ; i < mlen ; i+= lb) {                      \
    ALIGN16 unsigned char outni[lb];       \
    aesni_encrypt##iter(outni, (unsigned int*)n2, rkeys);               \
    unsigned long long mj = lb;                          \
    if ((i+mj)>=mlen)                                    \
      mj = mlen-i;                                       \
    for (j = 0 ; j < mj ; j++)                           \
      c[i+j] = m[i+j] ^ outni[j];                        \
    for (j = 0 ; j < mj ; j+=16) {                       \
      unsigned long long bl = 16;                        \
      if (j+bl>=mj) {                                    \
        bl = mj-j;                                       \
      }                                                  \
      addmul(accum,c+i+j,bl,H);                          \
    }                                                    \
  }
  
  n2[15]=0;
  incle(n2);
  incle(n2);
  LOOPRND128;
  LOOPRMD128;

  addmul(accum,fb,16,H);

  for (i = 0;i < 16;++i) c[i+mlen] = T[i] ^ accum[15-i];

  return 0;
}

/* full AES-GCM decryption function
   basically the same as encrypt, but the checksuming
   is done _before_ the decryption. And checksum is
   checked at the end.
 */
int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *mlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen_,
  const unsigned char *npub,
  const unsigned char *k
)
{
  __m128i rkeys[16];
  unsigned long long i, j;
  unsigned long long adlen = adlen_;
  ALIGN16 unsigned char n2[16];
  ALIGN16 unsigned char H[16];
  ALIGN16 unsigned char T[16];
  ALIGN16 unsigned char accum[16];
  ALIGN16 unsigned char fb[16];
  aesni_key256_expand(k, rkeys);
  for (i = 0;i < 12;i++) n2[i] = npub[i];
  for (i = 12; i < 16;i++) n2[i] = 0;
  memset(accum, 0, 16);

  *mlen = clen - 16;

  aesni_encrypt1(H, accum /* only because it's zero */, rkeys);
  n2[15]++;
  aesni_encrypt1(T, n2, rkeys);
  
  (*(unsigned long long*)&fb[0]) = _bswap64((unsigned long long)(8*adlen));
  (*(unsigned long long*)&fb[8]) = _bswap64((unsigned long long)(8*(*mlen)));
  
  const __m128i rev = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

  __m128i Hv = _mm_shuffle_epi8(_mm_load_si128((const __m128i*)H), rev);
  _mm_store_si128((__m128i*)H,Hv);
  __m128i H2v = mulv(Hv, Hv);
  __m128i H3v = mulv(H2v, Hv);
  __m128i H4v = mulv(H3v, Hv);
#ifdef ACCBY8
  __m128i H5v = mulv(H4v, Hv);
  __m128i H6v = mulv(H5v, Hv);
  __m128i H7v = mulv(H6v, Hv);
  __m128i H8v = mulv(H7v, Hv);
#endif
  __m128i accv = _mm_loadu_si128((const __m128i*)accum);

#ifdef ACCBY8
  /* unrolled by 8 GCM */
  unsigned long long adlen_rnd128 = adlen & ~127ull;
  for (i = 0 ; i < adlen_rnd128 ; i+= 128) {
    __m128i X8 = _mm_loadu_si128((const __m128i*)(ad+i+ 0));
    __m128i X7 = _mm_loadu_si128((const __m128i*)(ad+i+16));
    __m128i X6 = _mm_loadu_si128((const __m128i*)(ad+i+32));
    __m128i X5 = _mm_loadu_si128((const __m128i*)(ad+i+48));
    __m128i X4 = _mm_loadu_si128((const __m128i*)(ad+i+64));
    __m128i X3 = _mm_loadu_si128((const __m128i*)(ad+i+80));
    __m128i X2 = _mm_loadu_si128((const __m128i*)(ad+i+96));
    __m128i X1 = _mm_loadu_si128((const __m128i*)(ad+i+112));
    accv = reduce8(Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v,
                   X1, X2, X3, X4, X5, X6, X7, X8, accv);
  }
  _mm_storeu_si128((__m128i*)accum, accv);

  /* GCM remainder loop */
  for (i = adlen_rnd128 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#else
  unsigned long long adlen_rnd64 = adlen & ~63ull;
  for (i = 0 ; i < adlen_rnd64 ; i+= 64) {
    __m128i X4 = _mm_loadu_si128((const __m128i*)(ad+i+ 0));
    __m128i X3 = _mm_loadu_si128((const __m128i*)(ad+i+16));
    __m128i X2 = _mm_loadu_si128((const __m128i*)(ad+i+32));
    __m128i X1 = _mm_loadu_si128((const __m128i*)(ad+i+48));
    accv = reduce4(Hv, H2v, H3v, H4v, X1, X2, X3, X4, accv);
  }
  _mm_storeu_si128((__m128i*)accum, accv);

  for (i = adlen_rnd64 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#endif

  unsigned long long mlen_rnd128  = *mlen & ~127ull;

#ifdef ACCBY8
#define LOOPDRND128                                                     \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aesni_decrypt8full(m+i, (unsigned int*)n2, rkeys, c+i, accum, Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v); \
    }}
#else
#define LOOPDRND128                                                     \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aesni_decrypt8full(m+i, (unsigned int*)n2, rkeys, c+i, accum, Hv, H2v, H3v, H4v); \
    }}
#endif
  
#define LOOPDRMD128                                       \
  {const int iter = 8;                                    \
    const int lb = iter * 16;                             \
    for (i = mlen_rnd128 ; i < *mlen ; i+= lb) {          \
    ALIGN16 unsigned char outni[lb];                      \
    unsigned long long mj = lb;                           \
    if ((i+mj)>=*mlen)                                    \
      mj = *mlen-i;                                       \
    for (j = 0 ; j < mj ; j+=16) {                        \
      unsigned long long bl = 16;                         \
      if (j+bl>=mj) {                                     \
        bl = mj-j;                                        \
      }                                                   \
      addmul(accum,c+i+j,bl,H);                           \
    }                                                     \
    aesni_encrypt8(outni, (unsigned int*)n2, rkeys);      \
    for (j = 0 ; j < mj ; j++)                            \
      m[i+j] = c[i+j] ^ outni[j];                         \
  }}
  
#define LOOPD(iter)                                       \
  const int lb = iter * 16;                               \
  for (i = 0 ; i < *mlen ; i+= lb) {                      \
    ALIGN16 unsigned char outni[lb];                      \
    unsigned long long mj = lb;                           \
    if ((i+mj)>=*mlen)                                    \
      mj = *mlen-i;                                       \
    for (j = 0 ; j < mj ; j+=16) {                        \
      unsigned long long bl = 16;                         \
      if (j+bl>=mj) {                                     \
        bl = mj-j;                                        \
      }                                                   \
      addmul(accum,c+i+j,bl,H);                           \
    }                                                     \
    aesni_encrypt##iter(outni, (unsigned int*)n2, rkeys);                \
    for (j = 0 ; j < mj ; j++)                            \
      m[i+j] = c[i+j] ^ outni[j];                         \
  }
  
  n2[15]=0;
  incle(n2);
  incle(n2);
  LOOPDRND128;
  LOOPDRMD128;
/*   LOOPD(8); */

  addmul(accum,fb,16,H);

  unsigned char F = 0;

  for (i = 0;i < 16;++i) F |= (c[i+(*mlen)] != (T[i] ^ accum[15-i]));
  if (F)
    return -111;

  return 0; 
}
