#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <alloca.h>

#include "nist.h"
#include "vector.h"
#include "config.h"

#if !defined(COMPILE_256) && !defined(COMPILE_512)
#define COMPILE_256
#define COMPILE_512
#endif

// #define MMX_HACK

char* VERSION(void) {
  return "OPTIMIZED, VECTORIZED";
}

int SupportedLength(int hashbitlen) {
  if (hashbitlen != 224 && hashbitlen != 256 &&
      hashbitlen != 384 && hashbitlen != 512)
    return 0;
#ifndef COMPILE_256
  if (hashbitlen <= 256)
    return 0;
#endif
#ifndef COMPILE_512
  if (hashbitlen > 256)
    return 0;
#endif
  return 1;
}

int RequiredAlignment(void) {
  return 16;
}


/*
 * Define constant vectors used later.
 */

#ifdef BROADCAST_BETTER_THAN_LOAD

v16 v16_broadcast_cst_128 () __attribute__ ((const));
v16 v16_broadcast_cst_255 () __attribute__ ((const));
v16 v16_broadcast_cst_257 () __attribute__ ((const));
v8   v8_broadcast_cst_0   () __attribute__ ((const));

v16 v16_broadcast_cst_128 () { return v16_broadcast_cst(128); }
v16 v16_broadcast_cst_255 () { return v16_broadcast_cst(255); }
v16 v16_broadcast_cst_257 () { return v16_broadcast_cst(257); }
v8   v8_broadcast_cst_0   () { return  v8_broadcast_cst(0); }

#define V128 v16_broadcast_cst_128()
#define V255 v16_broadcast_cst_255()
#define V257 v16_broadcast_cst_257()
#define V0    v8_broadcast_cst_0()
#else
static const union cv v128 = CV(128);
static const union cv v255 = CV(255);
static const union cv v257 = CV(257);
static const union cv8  v0 = CV(0);
#define V128 v128.v16
#define V255 v255.v16
#define V257 v257.v16
#define V0    v0.v8
#endif

#ifdef PRINT_HARDER
void print_v32(v32 x) {
  union u32 u;
  u.v = x;
  printf ("%08x %08x %08x %08x\n", u.u[0], u.u[1], u.u[2], u.u[3]);
}

void print_v64(v64 x) {
  union u64 u;
  u.v = x;
  printf ("%016llx %016llx ", u.u[0], u.u[1]);
}

#define print_vv64(x) do{                       \
    printf ("|");                               \
    print_v64(x##0);                            \
    print_v64(x##1);                            \
    println();                                  \
  } while(0)

#define print_s64(x) do {                       \
    printf("State:\n");                         \
    print_v64(A0);                              \
    print_v64(A1);                              \
    println();                                  \
    print_v64(B0);                              \
    print_v64(B1);                              \
    println();                                  \
    print_v64(C0);                              \
    print_v64(C1);                              \
    println();                                  \
    print_v64(D0);                              \
    print_v64(D1);                              \
    println();                                  \
    println();                                  \
  } while(0)

#define print_m64(x) do {                       \
    printf("Message:\n");                       \
    print_v64(m0);                              \
    print_v64(m1);                              \
    println();                                  \
    print_v64(m2);                              \
    print_v64(m3);                              \
    println();                                  \
    print_v64(m4);                              \
    print_v64(m5);                              \
    println();                                  \
    print_v64(m6);                              \
    print_v64(m7);                              \
    println();                                  \
    println();                                  \
  } while(0)

#define println() printf("\n")
#else
#define print_v32(x)
#define print_v64(x)
#define print_vv64(x)
#define print_s32(x)
#define print_s64(x)
#define println(x)
void print_m32() {}
void print_m64() {}
#endif

#ifdef COMPILE_256
#ifdef MMX_HACK
#include <mmintrin.h>
#include <emmintrin.h>
#endif

void round256(v32* MM, v32* H,
#ifdef HAS_64
              u64 count
#else
              u32 count_low, u32 count_high
#endif
              );

void round256(v32* MM, v32* H,
#ifdef HAS_64
              u64 count
#else
              u32 count_low, u32 count_high
#endif
              ) {
  v32 A, B, C, D;

#ifdef MMX_HACK
  v32 M0 = v32_lswap(MM[0]), M1 = v32_lswap(MM[1]),
    M2 = v32_lswap(MM[2]), M3 = v32_lswap(MM[3]);

#ifdef __INTEL_COMPILER
  register __m64 mx0 __asm("%mm0"), mx1 __asm("%mm1"), mx2 __asm("%mm2"), mx3 __asm("%mm3"), mx4 __asm("%mm4"), mx5 __asm("%mm5"), mx6 __asm("%mm6"), mx7;
  u32 mx8, mx9, mx10, mx11, mx12, mx13, mx14, mx15;

#define sse_to_mmx _mm_movepi64_pi64
#define mmx_to_sse _mm_movpi64_epi64
#define sse_to_u32 _mm_cvtsi128_si32
#define u32_to_sse _mm_cvtsi32_si128
#else
  register volatile __m64 mx0 __asm("%mm0"), mx1 __asm("%mm1"), mx2 __asm("%mm2"), mx3 __asm("%mm3"), mx4 __asm("%mm4"), mx5 __asm("%mm5"), mx6 __asm("%mm6"), mx7 __asm("%mm7");
#ifdef __x86_64__
  register volatile u32 mx8 __asm("%r8"), mx9 __asm("%r9"), mx10 __asm("%r10"), mx11 __asm("%r11"), mx12 __asm("%r12"), mx13 __asm("%r13"), mx14 __asm("%r14"), mx15 __asm("%r15");
#else
  u32 mx8, mx9, mx10, mx11, mx12, mx13, mx14, mx15;
#endif
#define sse_to_mmx(x)  ({                                       \
      __m64 t__;                                                \
      __asm("movdq2q\t%1, %0": "=y"(t__): "x"(x));              \
      t__;							\
    })
#define mmx_to_sse(x)  ({                                       \
      v32 t__;                                                  \
      __asm("movq2dq\t%1, %0": "=x"(t__): "y"(x));              \
      t__;							\
    })
#define sse_to_u32(x)  ({                                       \
      u32 t__;                                                  \
      __asm("movd\t%1, %0": "=r"(t__): "x"(x));                 \
      t__;							\
    })
#define u32_to_sse(x)  ({                                       \
      v32 t__;                                                  \
      __asm("movd\t%1, %0": "=x"(t__): "r"(x));                 \
      t__;							\
    })
#endif

  mx0 = sse_to_mmx(M0);
  M0 = v32_shufrot(M0,1);
  mx1 = sse_to_mmx(M0);
  M0 = v32_shufrot(M0,1);
  mx2 = sse_to_mmx(M0);
  M0 = v32_shufrot(M0,1);
  mx3 = sse_to_mmx(M0);

  mx4 = sse_to_mmx(M1);
  M1 = v32_shufrot(M1,1);
  mx5 = sse_to_mmx(M1);
  M1 = v32_shufrot(M1,1);
  mx6 = sse_to_mmx(M1);
  M1 = v32_shufrot(M1,1);
  mx7 = sse_to_mmx(M1);

  mx8 = sse_to_u32(M2);
  M2 = v32_shufrot(M2,1);
  mx9 = sse_to_u32(M2);
  M2 = v32_shufrot(M2,1);
  mx10 = sse_to_u32(M2);
  M2 = v32_shufrot(M2,1);
  mx11 = sse_to_u32(M2);

  mx12 = sse_to_u32(M3);
  M3 = v32_shufrot(M3,1);
  mx13 = sse_to_u32(M3);
  M3 = v32_shufrot(M3,1);
  mx14 = sse_to_u32(M3);
  M3 = v32_shufrot(M3,1);
  mx15 = sse_to_u32(M3);

#define MX(i) MX_##i

#define MX_0 mmx_to_sse(mx0)
#define MX_1 mmx_to_sse(mx1)
#define MX_2 mmx_to_sse(mx2)
#define MX_3 mmx_to_sse(mx3)
#define MX_4 mmx_to_sse(mx4)
#define MX_5 mmx_to_sse(mx5)
#define MX_6 mmx_to_sse(mx6)
#define MX_7 mmx_to_sse(mx7)

#define MX_8  u32_to_sse(mx8)
#define MX_9  u32_to_sse(mx9)
#define MX_10 u32_to_sse(mx10)
#define MX_11 u32_to_sse(mx11)
#define MX_12 u32_to_sse(mx12)
#define MX_13 u32_to_sse(mx13)
#define MX_14 u32_to_sse(mx14)
#define MX_15 u32_to_sse(mx15)


#include "perm256.h"

#else
  v32 M0 = MM[0], M1 = MM[2], M2 = MM[1], M3 = MM[3]; // revlex order

#define PERM(i) do {                                            \
    m0 = V832(vector_shuffle(V328(M0), Sigma[i%10].v8));        \
    m2 = V832(vector_shuffle(V328(M1), Sigma[i%10].v8));        \
    m1 = V832(vector_shuffle(V328(M2), Sigma[i%10].v8));        \
    m3 = V832(vector_shuffle(V328(M3), Sigma[i%10].v8));        \
    v8_merge_inplace_32(m0,m2);                                 \
    v8_merge_inplace_32(m1,m3);                                 \
    v16_merge_inplace(m0,m1);                                   \
    v16_merge_inplace(m2,m3);                                   \
  } while(0)
#endif

  v32 m0, m1, m2, m3;

  print_v32(MM[0]);
  print_v32(MM[1]);
  print_v32(MM[2]);
  print_v32(MM[3]);
  println(); println();

#ifdef SIMD_BIG_ENDIAN
  /* This permutation interleave bytes */
  static const union cv8 interleave_bytes = {{
      0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15
    }};

#elif defined(SIMD_LITTLE_ENDIAN)
  /* This permutation swap endianess, and interleave bytes */
  static const union cv8 interleave_bytes = {{
      3, 7, 11, 15, 2, 6, 10, 14, 1, 5, 9, 13, 0, 4, 8, 12
    }};
#else
#error "Unkown endianness!  Unable to compile."
#endif

  static const union cv8 rot16 = {{
      2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13
    }};

  static const union cv8 rot8 = {{
      1, 2, 3, 0, 5, 6, 7, 4, 9, 10, 11, 8, 13, 14, 15, 12
    }};

  static const union cv8 Sigma[] = {
    {{  0,  2,  4,  6,  1,  3,  5,  7,  8, 10, 12, 14,  9, 11, 13, 15}},
    {{ 14,  4,  9, 13, 10,  8, 15,  6,  1,  0, 11,  5, 12,  2,  7,  3}},
    {{ 11, 12,  5, 15,  8,  0,  2, 13, 10,  3,  7,  9, 14,  6,  1,  4}},
    {{  7,  3, 13, 11,  9,  1, 12, 14,  2,  5,  4, 15,  6, 10,  0,  8}},
    {{  9,  5,  2, 10,  0,  7,  4, 15, 14, 11,  6,  3,  1, 12,  8, 13}},
    {{  2,  6,  0,  8, 12, 10, 11,  3,  4,  7, 15,  1, 13,  5, 14,  9}},
    {{ 12,  1, 14,  4,  5, 15, 13, 10,  0,  6,  9,  8,  7,  3,  2, 11}},
    {{ 13,  7, 12,  3, 11, 14,  1,  9,  5, 15,  8,  2,  0,  4,  6, 10}},
    {{  6, 14, 11,  0, 15,  9,  3,  8, 12, 13,  1, 10,  2,  7,  4,  5}},
    {{ 10,  8,  7,  1,  2,  4,  6,  5, 15,  9,  3, 13, 11, 14, 12,  0}},
    {{  0,  2,  4,  6,  1,  3,  5,  7,  8, 10, 12, 14,  9, 11, 13, 15}},
    {{ 14,  4,  9, 13, 10,  8, 15,  6,  1,  0, 11,  5, 12,  2,  7,  3}},
    {{ 11, 12,  5, 15,  8,  0,  2, 13, 10,  3,  7,  9, 14,  6,  1,  4}},
    {{  7,  3, 13, 11,  9,  1, 12, 14,  2,  5,  4, 15,  6, 10,  0,  8}},
  };

  static const union u32 Const[] = {
    {{0x243f6a88, 0x85a308d3, 0x13198a2e, 0x03707344}},
    {{0xa4093822, 0x299f31d0, 0x082efa98, 0xec4e6c89}},
  };

  static const union u32 SConst[] = {
    {{0x85a308d3, 0x03707344, 0x299f31d0, 0xec4e6c89}},
    {{0x243f6a88, 0x13198a2e, 0xa4093822, 0x082efa98}},
    {{0x38d01377, 0x34e90c6c, 0xc97c50dd, 0xb5470917}},
    {{0x452821e6, 0xbe5466cf, 0xc0ac29b7, 0x3f84d5b5}},
    {{0xbe5466cf, 0x452821e6, 0xb5470917, 0x082efa98}},
    {{0x3f84d5b5, 0xa4093822, 0x38d01377, 0xc97c50dd}},
    {{0xc0ac29b7, 0x13198a2e, 0xec4e6c89, 0x03707344}},
    {{0x85a308d3, 0x243f6a88, 0x34e90c6c, 0x299f31d0}},
    {{0x452821e6, 0x243f6a88, 0x13198a2e, 0xc97c50dd}},
    {{0x34e90c6c, 0xc0ac29b7, 0x299f31d0, 0xb5470917}},
    {{0x3f84d5b5, 0x082efa98, 0x85a308d3, 0xa4093822}},
    {{0xbe5466cf, 0x03707344, 0xec4e6c89, 0x38d01377}},
    {{0x38d01377, 0x85a308d3, 0xc0ac29b7, 0x3f84d5b5}},
    {{0xec4e6c89, 0x03707344, 0xc97c50dd, 0x34e90c6c}},
    {{0x082efa98, 0xbe5466cf, 0x243f6a88, 0x452821e6}},
    {{0x13198a2e, 0x299f31d0, 0xa4093822, 0xb5470917}},
    {{0x243f6a88, 0xec4e6c89, 0xa4093822, 0xb5470917}},
    {{0x38d01377, 0x299f31d0, 0x13198a2e, 0xbe5466cf}},
    {{0x85a308d3, 0xc0ac29b7, 0x452821e6, 0xc97c50dd}},
    {{0x3f84d5b5, 0x34e90c6c, 0x082efa98, 0x03707344}},
    {{0xc0ac29b7, 0xbe5466cf, 0x34e90c6c, 0x03707344}},
    {{0x13198a2e, 0x082efa98, 0x243f6a88, 0x452821e6}},
    {{0xc97c50dd, 0x299f31d0, 0x3f84d5b5, 0x38d01377}},
    {{0xa4093822, 0xec4e6c89, 0xb5470917, 0x85a308d3}},
    {{0x299f31d0, 0xb5470917, 0xc97c50dd, 0xbe5466cf}},
    {{0xc0ac29b7, 0x85a308d3, 0x3f84d5b5, 0xa4093822}},
    {{0xec4e6c89, 0x03707344, 0x13198a2e, 0x34e90c6c}},
    {{0x243f6a88, 0x082efa98, 0x38d01377, 0x452821e6}},
    {{0x34e90c6c, 0x3f84d5b5, 0x85a308d3, 0x38d01377}},
    {{0xc97c50dd, 0xec4e6c89, 0xc0ac29b7, 0x03707344}},
    {{0x243f6a88, 0xa4093822, 0x082efa98, 0xbe5466cf}},
    {{0x299f31d0, 0xb5470917, 0x452821e6, 0x13198a2e}},
    {{0xb5470917, 0x38d01377, 0x03707344, 0x452821e6}},
    {{0x082efa98, 0x3f84d5b5, 0x34e90c6c, 0x243f6a88}},
    {{0x13198a2e, 0xec4e6c89, 0xa4093822, 0x299f31d0}},
    {{0xc0ac29b7, 0xc97c50dd, 0x85a308d3, 0xbe5466cf}},
    {{0x13198a2e, 0xa4093822, 0x082efa98, 0x299f31d0}},
    {{0xbe5466cf, 0x452821e6, 0xec4e6c89, 0x85a308d3}},
    {{0x34e90c6c, 0x3f84d5b5, 0xc0ac29b7, 0x243f6a88}},
    {{0xb5470917, 0x38d01377, 0x03707344, 0xc97c50dd}},
  };

  union u32 cnt;
#ifdef HAS_64
  cnt.u[0] = cnt.u[1] = count & 0xffffffff;
  cnt.u[2] = cnt.u[3] = count >> 32;
#else
  cnt.u[0] = cnt.u[1] = count_low;
  cnt.u[2] = cnt.u[3] = count_high;
#endif

  //  print_v32(cnt.v);

  A = H[0];
  B = H[1];
  C = Const[0].v;
  D = v32_xor(Const[1].v, cnt.v);

  M0 = V832(vector_shuffle(V328(M0), interleave_bytes.v8));
  M1 = V832(vector_shuffle(V328(M1), interleave_bytes.v8));
  M2 = V832(vector_shuffle(V328(M2), interleave_bytes.v8));
  M3 = V832(vector_shuffle(V328(M3), interleave_bytes.v8));

  v32_interleave_inplace(M0,M2);
  v32_interleave_inplace(M1,M3);
  v64_interleave_inplace(M0,M1);
  v64_interleave_inplace(M2,M3);

#define ROUND(i) do {                                           \
    PERM(i);                                                    \
    println();                                                  \
    print_v32(A);                                               \
    print_v32(B);                                               \
    print_v32(C);                                               \
    print_v32(D);                                               \
    println();                                                  \
    print_v32(m0);                                              \
    print_v32(m1);                                              \
    print_v32(m2);                                              \
    print_v32(m3);                                              \
    println();                                                  \
                                                                \
    m0= v32_xor(m0,SConst[4*(i%10)+0].v);                       \
    A = v32_add(v32_add(A,m0),B);                               \
    print_v32(A);                                               \
    D = v32_xor(A,D);                                           \
    D = V832(vector_shuffle(V328(D), rot16.v8));                \
    print_v32(D);                                               \
    C = v32_add(C, D);                                          \
    print_v32(C);                                               \
    B = v32_xor(B,C);                                           \
    B = v32_rotate(B, 32-12);                                   \
    print_v32(B);                                               \
    m1= v32_xor(m1,SConst[4*(i%10)+1].v);                       \
    A = v32_add(v32_add(A,m1),B);                               \
    print_v32(A);                                               \
    D = v32_xor(D, A);                                          \
    D = V832(vector_shuffle(V328(D), rot8.v8));                 \
    print_v32(D);                                               \
    C = v32_add(C, D);                                          \
    print_v32(C);                                               \
    B = v32_xor(B,C);                                           \
    B = v32_rotate(B, 32-7);                                    \
    print_v32(B);                                               \
                                                                \
    println();                                                  \
    print_v32(A);                                               \
    print_v32(B);                                               \
    print_v32(C);                                               \
    print_v32(D);                                               \
    println();                                                  \
                                                                \
    D = v32_shufrot (D, 3);                                     \
    C = v32_shufrot (C, 2);                                     \
    B = v32_shufrot (B, 1);                                     \
                                                                \
    m2= v32_xor(m2,SConst[4*(i%10)+2].v);                       \
    A = v32_add(v32_add(A,m2),B);                               \
    D = v32_xor(A,D);                                           \
    D = V832(vector_shuffle(V328(D), rot16.v8));                \
    C = v32_add(C, D);                                          \
    B = v32_xor(B,C);                                           \
    B = v32_rotate(B, 32-12);                                   \
    m3= v32_xor(m3,SConst[4*(i%10)+3].v);                       \
    A = v32_add(v32_add(A,m3),B);                               \
    D = v32_xor(D, A);                                          \
    D = V832(vector_shuffle(V328(D), rot8.v8));                 \
    C = v32_add(C, D);                                          \
    B = v32_xor(B,C);                                           \
    B = v32_rotate(B, 32-7);                                    \
                                                                \
    D = v32_shufrot (D, 1);                                     \
    C = v32_shufrot (C, 2);                                     \
    B = v32_shufrot (B, 3);                                     \
  } while(0)


#if 1
  ROUND( 0); ROUND( 1); ROUND( 2); ROUND( 3);
  ROUND( 4); ROUND( 5); ROUND( 6); ROUND( 7);
  ROUND( 8); ROUND( 9); ROUND(10); ROUND(11);
  ROUND(12); ROUND(13);
#else
  for (int i=0; i<14; i++)
    ROUND(i);
#endif

  H[0] = v32_xor(H[0], v32_xor(A,C));
  H[1] = v32_xor(H[1], v32_xor(B,D));
#undef ROUND
#undef PERM

#ifdef MMX_HACK
  _mm_empty();
#endif
}
#endif

#ifdef COMPILE_512
void round512(hashState *MAYBE_RESTRICT state, v64* MM) {

  v64 A0, A1, B0, B1, C0, C1, D0, D1;

  static const union cv8 rot16 = {{
      2, 3, 4, 5, 6, 7, 0, 1, 10, 11, 12, 13, 14, 15, 8, 9
    }};

  static const union u64 Const[] = {
    {{0x243f6a8885a308d3ULL,0x13198a2e03707344ULL}},
    {{0xa4093822299f31d0ULL,0x082efa98ec4e6c89ULL}},
    {{0x452821e638d01377ULL,0xbe5466cf34e90c6cULL}},
    {{0xc0ac29b7c97c50ddULL,0x3f84d5b5b5470917ULL}},
  };

  static const union u64 SConst[] = {
    {{0x13198a2e03707344ULL, 0x082efa98ec4e6c89ULL}},
    {{0xbe5466cf34e90c6cULL, 0x3f84d5b5b5470917ULL}},
    {{0x243f6a8885a308d3ULL, 0xa4093822299f31d0ULL}},
    {{0x452821e638d01377ULL, 0xc0ac29b7c97c50ddULL}},
    {{0xd1310ba698dfb5acULL, 0xb8e1afed6a267e96ULL}},
    {{0x24a19947b3916cf7ULL, 0x636920d871574e69ULL}},
    {{0x9216d5d98979fb1bULL, 0x2ffd72dbd01adfb7ULL}},
    {{0xba7c9045f12c7f99ULL, 0x0801f2e2858efc16ULL}},
    {{0x2ffd72dbd01adfb7ULL, 0x9216d5d98979fb1bULL}},
    {{0x636920d871574e69ULL, 0xc0ac29b7c97c50ddULL}},
    {{0x0801f2e2858efc16ULL, 0x452821e638d01377ULL}},
    {{0xd1310ba698dfb5acULL, 0x24a19947b3916cf7ULL}},
    {{0xba7c9045f12c7f99ULL, 0xa4093822299f31d0ULL}},
    {{0x3f84d5b5b5470917ULL, 0x082efa98ec4e6c89ULL}},
    {{0x13198a2e03707344ULL, 0x243f6a8885a308d3ULL}},
    {{0xb8e1afed6a267e96ULL, 0xbe5466cf34e90c6cULL}},
    {{0x9216d5d98979fb1bULL, 0x243f6a8885a308d3ULL}},
    {{0xa4093822299f31d0ULL, 0x24a19947b3916cf7ULL}},
    {{0xb8e1afed6a267e96ULL, 0xba7c9045f12c7f99ULL}},
    {{0xbe5466cf34e90c6cULL, 0x636920d871574e69ULL}},
    {{0x0801f2e2858efc16ULL, 0xc0ac29b7c97c50ddULL}},
    {{0x13198a2e03707344ULL, 0x452821e638d01377ULL}},
    {{0x2ffd72dbd01adfb7ULL, 0x082efa98ec4e6c89ULL}},
    {{0x3f84d5b5b5470917ULL, 0xd1310ba698dfb5acULL}},
    {{0xd1310ba698dfb5acULL, 0x13198a2e03707344ULL}},
    {{0xba7c9045f12c7f99ULL, 0x0801f2e2858efc16ULL}},
    {{0x3f84d5b5b5470917ULL, 0x082efa98ec4e6c89ULL}},
    {{0x24a19947b3916cf7ULL, 0xb8e1afed6a267e96ULL}},
    {{0xc0ac29b7c97c50ddULL, 0x2ffd72dbd01adfb7ULL}},
    {{0x243f6a8885a308d3ULL, 0x9216d5d98979fb1bULL}},
    {{0xa4093822299f31d0ULL, 0xbe5466cf34e90c6cULL}},
    {{0x452821e638d01377ULL, 0x636920d871574e69ULL}},
    {{0x243f6a8885a308d3ULL, 0x3f84d5b5b5470917ULL}},
    {{0x452821e638d01377ULL, 0x636920d871574e69ULL}},
    {{0xd1310ba698dfb5acULL, 0xbe5466cf34e90c6cULL}},
    {{0xa4093822299f31d0ULL, 0x2ffd72dbd01adfb7ULL}},
    {{0x13198a2e03707344ULL, 0xba7c9045f12c7f99ULL}},
    {{0x9216d5d98979fb1bULL, 0x24a19947b3916cf7ULL}},
    {{0x0801f2e2858efc16ULL, 0xb8e1afed6a267e96ULL}},
    {{0xc0ac29b7c97c50ddULL, 0x082efa98ec4e6c89ULL}},
    {{0xba7c9045f12c7f99ULL, 0x2ffd72dbd01adfb7ULL}},
    {{0xb8e1afed6a267e96ULL, 0x082efa98ec4e6c89ULL}},
    {{0xa4093822299f31d0ULL, 0xc0ac29b7c97c50ddULL}},
    {{0x243f6a8885a308d3ULL, 0x9216d5d98979fb1bULL}},
    {{0x24a19947b3916cf7ULL, 0xbe5466cf34e90c6cULL}},
    {{0x0801f2e2858efc16ULL, 0xd1310ba698dfb5acULL}},
    {{0x452821e638d01377ULL, 0x3f84d5b5b5470917ULL}},
    {{0x636920d871574e69ULL, 0x13198a2e03707344ULL}},
    {{0xbe5466cf34e90c6cULL, 0x636920d871574e69ULL}},
    {{0x24a19947b3916cf7ULL, 0x2ffd72dbd01adfb7ULL}},
    {{0xba7c9045f12c7f99ULL, 0x13198a2e03707344ULL}},
    {{0x0801f2e2858efc16ULL, 0x452821e638d01377ULL}},
    {{0x3f84d5b5b5470917ULL, 0x082efa98ec4e6c89ULL}},
    {{0xa4093822299f31d0ULL, 0xb8e1afed6a267e96ULL}},
    {{0x243f6a8885a308d3ULL, 0xc0ac29b7c97c50ddULL}},
    {{0xd1310ba698dfb5acULL, 0x9216d5d98979fb1bULL}},
    {{0xb8e1afed6a267e96ULL, 0x0801f2e2858efc16ULL}},
    {{0x13198a2e03707344ULL, 0xd1310ba698dfb5acULL}},
    {{0x24a19947b3916cf7ULL, 0x3f84d5b5b5470917ULL}},
    {{0xba7c9045f12c7f99ULL, 0x082efa98ec4e6c89ULL}},
    {{0x243f6a8885a308d3ULL, 0x452821e638d01377ULL}},
    {{0xc0ac29b7c97c50ddULL, 0x2ffd72dbd01adfb7ULL}},
    {{0xbe5466cf34e90c6cULL, 0x636920d871574e69ULL}},
    {{0x9216d5d98979fb1bULL, 0xa4093822299f31d0ULL}},
    {{0x636920d871574e69ULL, 0xd1310ba698dfb5acULL}},
    {{0x082efa98ec4e6c89ULL, 0x9216d5d98979fb1bULL}},
    {{0xc0ac29b7c97c50ddULL, 0x0801f2e2858efc16ULL}},
    {{0xb8e1afed6a267e96ULL, 0x243f6a8885a308d3ULL}},
    {{0xa4093822299f31d0ULL, 0x3f84d5b5b5470917ULL}},
    {{0x452821e638d01377ULL, 0xbe5466cf34e90c6cULL}},
    {{0xba7c9045f12c7f99ULL, 0x24a19947b3916cf7ULL}},
    {{0x13198a2e03707344ULL, 0x2ffd72dbd01adfb7ULL}},
    {{0xa4093822299f31d0ULL, 0x452821e638d01377ULL}},
    {{0xc0ac29b7c97c50ddULL, 0xbe5466cf34e90c6cULL}},
    {{0x2ffd72dbd01adfb7ULL, 0x9216d5d98979fb1bULL}},
    {{0x3f84d5b5b5470917ULL, 0x13198a2e03707344ULL}},
    {{0xb8e1afed6a267e96ULL, 0x0801f2e2858efc16ULL}},
    {{0xba7c9045f12c7f99ULL, 0x243f6a8885a308d3ULL}},
    {{0x636920d871574e69ULL, 0xd1310ba698dfb5acULL}},
    {{0x082efa98ec4e6c89ULL, 0x24a19947b3916cf7ULL}},
  };

  union u32 cnt;
  v64 *H = (void*) state->H;
  v64 t0, t1;

#ifdef PERM_INPLACE
#include "perm512.h"

  v64 m0 = v64_lswap(MM[0]), m1 = v64_lswap(MM[1]),
    m2 = v64_lswap(MM[2]), m3 = v64_lswap(MM[3]),
    m4 = v64_lswap(MM[4]), m5 = v64_lswap(MM[5]),
    m6 = v64_lswap(MM[6]), m7 = v64_lswap(MM[7]);

#elif defined(V64_USE_HALF)
  v64 m0, m1, m2, m3, m4, m5, m6, m7;
  vv64 *mm = (vv64*) MM;

  for (int i=0; i<8; i++)
    MM[i] = v64_lswap(MM[i]);

const unsigned char sigma[][16] = {
  { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15 },
  {14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3 },
  {11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4 },
  { 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8 },
  { 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13 },
  { 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9 },
  {12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11 },
  {13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10 },
  { 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5 },
  {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 },
  { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15 },
  {14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3 },
  {11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4 },
  { 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8 },
  { 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13 },
  { 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9 },
  {12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11 },
  {13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10 },
  { 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5 },
  {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 }};

#define PERM(i) do {						\
    m0 = v64_merge(mm[sigma[i%10][ 0]], mm[sigma[i%10][ 1]]);	\
    m1 = v64_merge(mm[sigma[i%10][ 2]], mm[sigma[i%10][ 3]]);	\
    m2 = v64_merge(mm[sigma[i%10][ 4]], mm[sigma[i%10][ 5]]);	\
    m3 = v64_merge(mm[sigma[i%10][ 6]], mm[sigma[i%10][ 7]]);	\
    m4 = v64_merge(mm[sigma[i%10][ 8]], mm[sigma[i%10][ 9]]);	\
    m5 = v64_merge(mm[sigma[i%10][10]], mm[sigma[i%10][11]]);	\
    m6 = v64_merge(mm[sigma[i%10][12]], mm[sigma[i%10][13]]);	\
    m7 = v64_merge(mm[sigma[i%10][14]], mm[sigma[i%10][15]]);	\
  } while (0)

#define message_xor(m,c) ({			\
      v64 x = c;				\
      v64_xorl(x,XCAT(m,l));			\
      v64_xorh(x,XCAT(m,h));			\
      x;					\
    })

#else
#include "perm512-m.h"

  v64 m0, m1, m2, m3, m4, m5, m6, m7;
  v64 mm0 = v64_lswap(MM[0]), mm1 = v64_lswap(MM[1]);
  v64 mm2 = v64_lswap(MM[2]), mm3 = v64_lswap(MM[3]);
  v64 mm4 = v64_lswap(MM[4]), mm5 = v64_lswap(MM[5]);
  v64 mm6 = v64_lswap(MM[6]), mm7 = v64_lswap(MM[7]);

#endif

#ifdef HAS_64
  cnt.u[0] = cnt.u[2] = state->count & 0xffffffff;
  cnt.u[1] = cnt.u[3] = state->count >> 32;
#else
  cnt.u[0] = cnt.u[2] = state->count_low;
  cnt.u[1] = cnt.u[3] = state->count_high;
#endif

  A0 = H[0];  A1 = H[1];
  B0 = H[2];  B1 = H[3];
  C0 = Const[0].v;  C1 = Const[1].v;
  D0 = v64_xor(Const[2].v, V3264(cnt.v));
  D1 = Const[3].v;


#define ROUND(i) do {                                           \
    print_s64();                                                \
    PERM(i);                                                    \
    print_m64();                                                \
    t0 = v64_xor(m0,SConst[8*(i%10)+0].v);                      \
    t1 = v64_xor(m1,SConst[8*(i%10)+1].v);                      \
    A0 = v64_add(v64_add(A0,t0),B0);                            \
    A1 = v64_add(v64_add(A1,t1),B1);                            \
    print_vv64(A);                                              \
    D0 = v64_xor(A0,D0);                                        \
    D1 = v64_xor(A1,D1);                                        \
    D0 = V3264(v32_shufxor(V6432(D0),1));                       \
    D1 = V3264(v32_shufxor(V6432(D1),1));                       \
    print_vv64(D);                                              \
    C0 = v64_add(C0, D0);                                       \
    C1 = v64_add(C1, D1);                                       \
    print_vv64(C);                                              \
    B0 = v64_xor(B0,C0);                                        \
    B1 = v64_xor(B1,C1);                                        \
    B0 = v64_rotate(B0, 64-25);                                 \
    B1 = v64_rotate(B1, 64-25);                                 \
    print_vv64(B);                                              \
    println();                                                  \
    t0 = v64_xor(m2,SConst[8*(i%10)+2].v);                      \
    t1 = v64_xor(m3,SConst[8*(i%10)+3].v);                      \
    A0 = v64_add(v64_add(A0,t0),B0);                            \
    A1 = v64_add(v64_add(A1,t1),B1);                            \
    D0 = v64_xor(D0, A0);                                       \
    D1 = v64_xor(D1, A1);                                       \
    D0 = V864(vector_shuffle(V648(D0), rot16.v8));              \
    D1 = V864(vector_shuffle(V648(D1), rot16.v8));              \
    C0 = v64_add(C0, D0);                                       \
    C1 = v64_add(C1, D1);                                       \
    B0 = v64_xor(B0,C0);                                        \
    B1 = v64_xor(B1,C1);                                        \
    B0 = v64_rotate(B0, 64-11);                                 \
    B1 = v64_rotate(B1, 64-11);                                 \
                                                                \
    print_s64();                                                \
                                                                \
    v64_shufrot_inplace (D0, D1, 3);                            \
    v64_shufrot_inplace (C0, C1, 2);                            \
    v64_shufrot_inplace (B0, B1, 1);                            \
                                                                \
    print_s64();                                                \
                                                                \
    t0 = v64_xor(m4,SConst[8*(i%10)+4].v);                      \
    t1 = v64_xor(m5,SConst[8*(i%10)+5].v);                      \
    A0 = v64_add(v64_add(A0,t0),B0);                            \
    A1 = v64_add(v64_add(A1,t1),B1);                            \
    print_vv64(A);                                              \
    D0 = v64_xor(A0,D0);                                        \
    D1 = v64_xor(A1,D1);                                        \
    D0 = V3264(v32_shufxor(V6432(D0),1));                       \
    D1 = V3264(v32_shufxor(V6432(D1),1));                       \
    print_vv64(D);                                              \
    C0 = v64_add(C0, D0);                                       \
    C1 = v64_add(C1, D1);                                       \
    print_vv64(C);                                              \
    B0 = v64_xor(B0,C0);                                        \
    B1 = v64_xor(B1,C1);                                        \
    B0 = v64_rotate(B0, 64-25);                                 \
    B1 = v64_rotate(B1, 64-25);                                 \
    print_vv64(B);                                              \
    t0 = v64_xor(m6,SConst[8*(i%10)+6].v);                      \
    t1 = v64_xor(m7,SConst[8*(i%10)+7].v);                      \
    A0 = v64_add(v64_add(A0,t0),B0);                            \
    A1 = v64_add(v64_add(A1,t1),B1);                            \
    D0 = v64_xor(D0, A0);                                       \
    D1 = v64_xor(D1, A1);                                       \
    D0 = V864(vector_shuffle(V648(D0), rot16.v8));              \
    D1 = V864(vector_shuffle(V648(D1), rot16.v8));              \
    C0 = v64_add(C0, D0);                                       \
    C1 = v64_add(C1, D1);                                       \
    B0 = v64_xor(B0,C0);                                        \
    B1 = v64_xor(B1,C1);                                        \
    B0 = v64_rotate(B0, 64-11);                                 \
    B1 = v64_rotate(B1, 64-11);                                 \
                                                                \
    v64_shufrot_inplace (D0, D1, 1);                            \
    v64_shufrot_inplace (C0, C1, 2);                            \
    v64_shufrot_inplace (B0, B1, 3);                            \
  } while(0)

#if 1
  ROUND( 0); ROUND( 1); ROUND( 2); ROUND( 3);
  ROUND( 4); ROUND( 5); ROUND( 6); ROUND( 7);
  ROUND( 8); ROUND( 9); ROUND(10); ROUND(11);
  ROUND(12); ROUND(13); ROUND(14); ROUND(15);
#else
  for (int i=0; i<14; i++)
    ROUND(i);
#endif

  H[0] = v64_xor(H[0], v64_xor(A0,C0));
  H[1] = v64_xor(H[1], v64_xor(A1,C1));
  H[2] = v64_xor(H[2], v64_xor(B0,D0));
  H[3] = v64_xor(H[3], v64_xor(B1,D1));
#undef ROUND
}
#endif

void Blake_Compress(hashState *MAYBE_RESTRICT state, const unsigned char *MAYBE_RESTRICT m) {

#ifdef __llvm__
  /* Ugly hack to force stack alignement with LLVM */
  int offt = (alloca(16)-NULL)&15;
  while (offt) {
    void *p = alloca(1);
    offt = (p-NULL)&15;
  }
#endif

  if (state->hashbitlen <= 256) {
#ifdef COMPILE_256
    round256((v32*)m, (v32*)state->H, 
#ifdef HAS_64
             state->count
#else
             state->count_low, state->count_high
#endif
             );
#endif
  } else {
#ifdef COMPILE_512
    round512(state, (v64*)m);
#endif
  }
}


#ifdef COMPILE_256
/* Padding and API from reference code. */

typedef unsigned char u8; 

#define U8TO32(p)					\
  (((u32)((p)[0]) << 24) | ((u32)((p)[1]) << 16) |	\
   ((u32)((p)[2]) <<  8) | ((u32)((p)[3])      ))
#define U32TO8(p, v)					\
  (p)[0] = (u8)((v) >> 24); (p)[1] = (u8)((v) >> 16);	\
  (p)[2] = (u8)((v) >>  8); (p)[3] = (u8)((v)      ); 

#define LOADU(p)  _mm_loadu_si128( (__m128i *)(p) )
#define BSWAP32(r) do { \
   r = _mm_shufflehi_epi16(r, _MM_SHUFFLE(2, 3, 0, 1)); \
   r = _mm_shufflelo_epi16(r, _MM_SHUFFLE(2, 3, 0, 1)); \
   r = _mm_xor_si128(_mm_slli_epi16(r, 8), _mm_srli_epi16(r, 8)); \
} while(0)

typedef struct  { 
  u32 *h, s[4], t[2];
  int buflen, nullt;
  u8* buf;
  u8  buffer[64+32+16];
} state;

const u8 sigma[][16] = {
  { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15 },
  {14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3 },
  {11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4 },
  { 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8 },
  { 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13 },
  { 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9 },
  {12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11 },
  {13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10 },
  { 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5 },
  {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 },
  { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15 },
  {14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3 },
  {11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4 },
  { 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8 },
  { 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13 },
  { 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9 },
  {12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11 },
  {13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10 },
  { 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5 },
  {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 }};

const u32 cst[16] = {
  0x243F6A88,0x85A308D3,0x13198A2E,0x03707344,
  0xA4093822,0x299F31D0,0x082EFA98,0xEC4E6C89,
  0x452821E6,0x38D01377,0xBE5466CF,0x34E90C6C,
  0xC0AC29B7,0xC97C50DD,0x3F84D5B5,0xB5470917};

const u8 padding[] =
  {0x80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

void blake256_init( state *S ) {
  /*
   * Align the buffers to a 128 bit boundary.
   */
  S->buf = S->buffer;
  S->buf += ((unsigned char*)0 - S->buf)&15;
  S->h   = (u32*)(S->buf+64);

  S->h[0]=0x6A09E667;
  S->h[1]=0xBB67AE85;
  S->h[2]=0x3C6EF372;
  S->h[3]=0xA54FF53A;
  S->h[4]=0x510E527F;
  S->h[5]=0x9B05688C;
  S->h[6]=0x1F83D9AB;
  S->h[7]=0x5BE0CD19;
  S->t[0]=S->t[1]=S->buflen=S->nullt=0;
  S->s[0]=S->s[1]=S->s[2]=S->s[3] =0;
}


void blake256_update( state *S, const u8 *data, u64 datalen ) {

  int left=S->buflen >> 3; 
  unsigned int fill=64 - left;
   
  if( left && ( ((datalen >> 3) & 0x3F) >= fill ) ) {
    memcpy( (void*) (S->buf + left), (void*) data, fill );
    S->t[0] += 512;
    if (S->t[0] == 0) S->t[1]++;      
    round256((v32*)S->buf, (v32*)S->h, 
#ifdef HAS_64
             S->nullt? 0: S->t[0] + ((u64)S->t[1] << 32)
#else
             S->nullt? 0: S->t[0], S->nullt? 0: S->t[1]
#endif
             );
    data += fill;
    datalen  -= (fill << 3);       
    left = 0;
  }

  while( datalen >= 512 ) {
    S->t[0] += 512;
    if (S->t[0] == 0) S->t[1]++;
    round256((v32*)data, (v32*)S->h, 
#ifdef HAS_64
             S->nullt? 0: S->t[0] + ((u64)S->t[1] << 32)
#else
             S->nullt? 0: S->t[0], S->nullt? 0: S->t[1]
#endif
             );
    data += 64;
    datalen  -= 512;
  }
  
  if( datalen > 0 ) {
    memcpy( (void*) (S->buf + left), (void*) data, datalen>>3 );
    S->buflen = (left<<3) + datalen;
  }
  else S->buflen=0;
}


void blake256_final( state *S, u8 *digest ) {
  
  u8 msglen[8], zo=0x01, oo=0x81;
  u32 lo=S->t[0] + S->buflen, hi=S->t[1];
  if ( lo < S->buflen ) hi++;
  U32TO8(  msglen + 0, hi );
  U32TO8(  msglen + 4, lo );

  if ( S->buflen == 440 ) { /* one padding byte */
    S->t[0] -= 8;
    blake256_update( S, &oo, 8 );
  }
  else {
    if ( S->buflen < 440 ) { /* enough space to fill the block  */
      if ( !S->buflen ) S->nullt=1;
      S->t[0] -= 440 - S->buflen;
      blake256_update( S, padding, 440 - S->buflen );
    }
    else { /* need 2 compressions */
      S->t[0] -= 512 - S->buflen; 
      blake256_update( S, padding, 512 - S->buflen );
      S->t[0] -= 440;
      blake256_update( S, padding+1, 440 );
      S->nullt = 1;
    }
    blake256_update( S, &zo, 8 );
    S->t[0] -= 8;
  }
  S->t[0] -= 64;
  blake256_update( S, msglen, 64 );    
  
  U32TO8( digest + 0, S->h[0]);
  U32TO8( digest + 4, S->h[1]);
  U32TO8( digest + 8, S->h[2]);
  U32TO8( digest +12, S->h[3]);
  U32TO8( digest +16, S->h[4]);
  U32TO8( digest +20, S->h[5]);
  U32TO8( digest +24, S->h[6]);
  U32TO8( digest +28, S->h[7]);
}


int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen ) {

  state S;  
  blake256_init( &S );
  blake256_update( &S, in, inlen*8 );
  blake256_final( &S, out );
  return 0;
}

#endif
