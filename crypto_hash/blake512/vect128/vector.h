#ifndef __VECTOR_H__
#define __VECTOR_H__

#include "compat.h"
#define CAT(x, y) x##y
#define XCAT(x,y) CAT(x,y)

/***********************************************************************
 * This files defines a set of macros which implements the vector
 * instructions used to implement the SIMD hash function.
 *
 * The macros are defined for three different architectures:
 *
 * - x86/x86_64 with SSE2
 *     either using GCC extensions,
 *     or using the standard emmintrin.h file (GCC/ICC/MSVC)
 * - PowerPC with AltiVec
 *     using the standard altivec.h file
 * - ARM with NEON
 *     either using GCC extensions and inline assembly,
 *     or using the standard arm_neon.h file
 */


#if   defined(__SSE2__)

/***********************************************************************
 * Support for x86/x86_64 with SSE2
 */


#if defined(__GNUC__) && !defined(__INTEL_COMPILER)

/***********************************************************************
 * SSE2 version using GCC vector extensions 
 */


/* Definintion of vector types, and converstion macros
 */

typedef char          v16qi __attribute__ ((vector_size (16)));
typedef short          v8hi __attribute__ ((vector_size (16)));
typedef int            v4si __attribute__ ((vector_size (16)));
typedef long long      v2di __attribute__ ((vector_size (16)));
typedef float          v4sf __attribute__ ((vector_size (16)));

typedef short          v4hi __attribute__ ((vector_size (8)));
typedef unsigned char  v8qi __attribute__ ((vector_size (8)));

typedef v16qi v8;
typedef v8hi v16;
typedef v4si v32;
typedef v2di v64;

#define V6432(x) ((v32) (x))
#define V3264(x) ((v64) (x))
#define V3216(x) ((v16) (x))
#define V1632(x) ((v32) (x))
#define  V168(x) ( (v8) (x))
#define  V816(x) ((v16) (x))


/* Simple arithmetic and Boolean operations
 */

#define vec_and(x,y) ((x)&(y))
#define vec_or(x,y)  ((x)|(y))
#define vec_xor(x,y) ((x)^(y))

#define v16_and vec_and
#define v16_or  vec_or
#define v16_xor vec_xor

#define v32_and vec_and
#define v32_or  vec_or
#define v32_xor vec_xor

#define v64_and vec_and
#define v64_or  vec_or
#define v64_xor vec_xor

#define vector_shuffle(x,s) __builtin_ia32_pshufb128(x, s)

#define v64_add(x,y) ((x)+(y))

#define v32_add(x,y) ((x)+(y))

#define v16_add(x,y) ((x)+(y))
#define v16_sub(x,y) ((x)-(y))
#define v16_mul(x,y) ((x)*(y))
#define v16_neg(x)   (-(x))
#define v16_shift_l  __builtin_ia32_psllwi128
#define v16_shift_r  __builtin_ia32_psrawi128
#define v16_cmp      __builtin_ia32_pcmpgtw128

#define v64_interleavel   __builtin_ia32_punpcklqdq128
#define v64_interleaveh   __builtin_ia32_punpckhqdq128

#define v32_interleavel   __builtin_ia32_punpckldq128
#define v32_interleaveh   __builtin_ia32_punpckhdq128

#define v16_interleavel   __builtin_ia32_punpcklwd128
#define v16_interleaveh   __builtin_ia32_punpckhwd128

#define v16_mergel(a,b)   V1632(__builtin_ia32_punpcklwd128(a,b))
#define v16_mergeh(a,b)   V1632(__builtin_ia32_punpckhwd128(a,b))

#define v8_mergel(a,b) V816(__builtin_ia32_punpcklbw128(a,b))
#define v8_mergeh(a,b) V816(__builtin_ia32_punpckhbw128(a,b))

#define v32_shift_l  __builtin_ia32_pslldi128
#define v32_shift_r  __builtin_ia32_psrldi128

#define v32_rotate(x,n)                                 \
  vec_or(v32_shift_l(x,n), v32_shift_r(x,32-(n)))

#define v64_shift_l  __builtin_ia32_psllqi128
#define v64_shift_r  __builtin_ia32_psrlqi128

#define v64_rotate(x,n)                                 \
  vec_or(v64_shift_l(x,n), v64_shift_r(x,64-(n)))

#define v64_rotate_2(x,n) ({                            \
      u64 t__, u__;                                     \
      v64 y__, z1__, z2__;                              \
      __asm("movq\t%1, %0": "=r"(t__): "x"(x));         \
      t__ = (t__ << (n)) | (t__ >> (64-(n)));           \
      __asm("movq\t%1, %0": "=x"(z1__): "r"(t__));      \
      y__ = v64_swp(x);                                 \
      __asm("movq\t%1, %0": "=r"(u__): "x"(y__));       \
      u__ = (u__ << (n)) | (u__ >> (64-(n)));           \
      __asm("movq\t%1, %0": "=x"(z2__): "r"(u__));      \
      v64_interleavel(z1__, z2__);                      \
    })

/* XOR-based permutations used in the Feistel strucure
 */

#define v32_shuf __builtin_ia32_pshufd

#define SHUFXOR_1 0xb1          /* 0b10110001 */
#define SHUFXOR_2 0x4e          /* 0b01001110 */
#define SHUFXOR_3 0x1b          /* 0b00011011 */

#define SHUFROT_3 0x93          /* 0b10010011 */
#define SHUFROT_2 0x4e          /* 0b01001110 */
#define SHUFROT_1 0x39          /* 0b00111001 */

#define v32_shufxor(x,s) v32_shuf(x,XCAT(SHUFXOR_,s))
#define v32_shufrot(x,s) v32_shuf(x,XCAT(SHUFROT_,s))

#define v64_shufrot_inplace_3(X, Y) do {                \
    v64 t__ = __builtin_ia32_palignr128(X, Y, 8*8);       \
    v64 u__ = __builtin_ia32_palignr128(Y, X, 8*8);       \
    X = t__;                                            \
    Y = u__;                                            \
  } while(0)

#define v64_shufrot_inplace_2(X, Y) do {        \
  v64 t__ = X;                                  \
  X = Y;                                        \
  Y = t__;                                      \
  } while(0)

#define v64_shufrot_inplace_1(X, Y) do {                \
    v64 t__ = __builtin_ia32_palignr128(X, Y, 8*8);       \
    v64 u__ = __builtin_ia32_palignr128(Y, X, 8*8);       \
    Y = t__;                                            \
    X = u__;                                            \
  } while(0)

#define v64_shufrot_inplace(x,y,s) XCAT(v64_shufrot_inplace_,s)(x,y)

#define v64_swp(x) V3264(v32_shuf(V6432(x),0x4e))  /* 0b01001110 */

/* bswap swaps the endiannes if needed
 */

#define v32_bswap(x) (x)

static const v8 v64_swap_endianness =
  {7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8};

#define v64_lswap(x) V864(vector_shuffle(V648(x), v64_swap_endianness))

static const v8 v32_swap_endianness =
  {3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12};

#define v32_lswap(x) V832(vector_shuffle(V328(x), v32_swap_endianness))

#define v16_broadcast(x) ({                     \
      union u32 u;                              \
      u32 xx = (x) & 0xffff;			\
      u.u[0] = xx | (xx << 16);			\
      V3216(v32_shuf(u.v,0)); })

/* Macro to define fixed constants
 */

#define CV(x) {{x, x, x, x, x, x, x, x}}

#else // #if defined(__GNUC__) && !defined(__INTEL_COMPILER)

/***********************************************************************
 * SSE2 version using MSVC/ICC vector intrinsics
 * (Note that this implementation is also supported by GCC)
 */

#include <emmintrin.h>

#ifdef __SSSE3__
#include <tmmintrin.h>
#endif

typedef __m128i  v8;
typedef __m128i v16;
typedef __m128i v32;
typedef __m128i v64;

#define V6432(x) (x)
#define V3264(x) (x)
#define V3216(x) (x)
#define V1632(x) (x)
#define  V168(x) (x)
#define  V816(x) (x)

#define CV(x) {{x, x, x, x, x, x, x, x}}

#define vec_and      _mm_and_si128
#define vec_or       _mm_or_si128
#define vec_xor      _mm_xor_si128

#define v16_and vec_and
#define v16_or  vec_or
#define v16_xor vec_xor

#define v32_and vec_and
#define v32_or  vec_or
#define v32_xor vec_xor

#define v64_and vec_and
#define v64_or  vec_or
#define v64_xor vec_xor

#define vector_shuffle(x,s) _mm_shuffle_epi8(x, s)

#define v64_add      _mm_add_epi64

#define v32_add      _mm_add_epi32

#define v16_add      _mm_add_epi16
#define v16_sub      _mm_sub_epi16
#define v16_mul      _mm_mullo_epi16
#define v16_neg(x)   (-(x))
#define v16_shift_l  _mm_slli_epi16
#define v16_shift_r  _mm_srai_epi16
#define v16_cmp      _mm_cmpgt_epi16

#define v64_interleavel   _mm_unpacklo_epi64
#define v64_interleaveh   _mm_unpackhi_epi64

#define v32_interleavel   _mm_unpacklo_epi32
#define v32_interleaveh   _mm_unpackhi_epi32

#define v16_interleavel   _mm_unpacklo_epi16
#define v16_interleaveh   _mm_unpackhi_epi16

#define v16_mergel   _mm_unpacklo_epi16
#define v16_mergeh   _mm_unpackhi_epi16

#define v8_mergel    _mm_unpacklo_epi8
#define v8_mergeh    _mm_unpackhi_epi8

#define v32_shift_l  _mm_slli_epi32
#define v32_shift_r  _mm_srli_epi32

#define v32_rotate(x,n)                                 \
  vec_or(v32_shift_l(x,n), v32_shift_r(x,32-(n)))

#define v64_shift_l  _mm_slli_epi64
#define v64_shift_r  _mm_srli_epi64

#define v64_rotate(x,n)                                 \
  vec_or(v64_shift_l(x,n), v64_shift_r(x,64-(n)))

#define v32_shuf     _mm_shuffle_epi32

#define SHUFXOR_1 0xb1          /* 0b10110001 */
#define SHUFXOR_2 0x4e          /* 0b01001110 */
#define SHUFXOR_3 0x1b          /* 0b00011011 */

#define SHUFROT_3 0x93          /* 0b10010011 */
#define SHUFROT_2 0x4e          /* 0b01001110 */
#define SHUFROT_1 0x39          /* 0b00111001 */

#define v32_shufxor(x,s) v32_shuf(x,XCAT(SHUFXOR_,s))
#define v32_shufrot(x,s) v32_shuf(x,XCAT(SHUFROT_,s))

#define v64_shufrot_inplace_3(X, Y) do {                \
    v64 t__ = _mm_alignr_epi8(X, Y, 8);                 \
    v64 u__ = _mm_alignr_epi8(Y, X, 8);                 \
    X = t__;                                            \
    Y = u__;                                            \
  } while(0)

#define v64_shufrot_inplace_2(X, Y) do {        \
  v64 t__ = X;                                  \
  X = Y;                                        \
  Y = t__;                                      \
  } while(0)

#define v64_shufrot_inplace_1(X, Y) do {                \
    v64 t__ = _mm_alignr_epi8(X, Y, 8);                 \
    v64 u__ = _mm_alignr_epi8(Y, X, 8);                 \
    Y = t__;                                            \
    X = u__;                                            \
  } while(0)

#define v64_shufrot_inplace(x,y,s) XCAT(v64_shufrot_inplace_,s)(x,y)

#define v64_swp(x) V3264(v32_shuf(V6432(x),0x4e))  /* 0b01001110 */

#define v32_bswap(x) (x)

static const union {
  unsigned char u8[16];
  v8 v8;
} v64_swap_endianness =
  {{7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8}};

#define v64_lswap(x) V864(vector_shuffle(V648(x), v64_swap_endianness.v8))

static const union {
  unsigned char u8[16];
  v8 v8;
} v32_swap_endianness =
  {{3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12}};

#define v32_lswap(x) V832(vector_shuffle(V328(x), v32_swap_endianness.v8))

#endif // #if defined(__GNUC__) && !defined(__INTEL_COMPILER)

#elif defined(__ALTIVEC__)    // #if   defined(__SSE2__)

/***********************************************************************
 * Support for PowerPC with AltiVec
 */

#include <altivec.h>

typedef vector unsigned char  v8;
typedef vector signed   short v16;
typedef vector unsigned int   v32;

#define V3216(x) ((v16) (x))
#define V1632(x) ((v32) (x))
#define  V168(x) ( (v8) (x))
#define  V816(x) ((v16) (x))

#define MAKE_VECT(x, ...) {{x, __VA_ARGS__}}

#define CV(x) MAKE_VECT(x, x, x, x, x, x, x, x)
#define CV16(x)  ((vector   signed short) {x,x,x,x,x,x,x,x})
#define CVU16(x) ((vector unsigned short) {x,x,x,x,x,x,x,x})
#define CV32(x)  ((vector unsigned int  ) {x,x,x,x})


#if defined(__GNUC__)
/* altivec.h is broken with Gcc 3.3 is C99 mode
 */

#if defined __STDC__ && __STDC_VERSION__ >= 199901L
#define typeof __typeof
#endif // #if defined __STDC__ && __STDC_VERSION__ >= 199901L


/* Nasty hack to avoid macro expansion madness.
 * We redefine vec_and/vec_ar/vec_xor
 */

MAYBE_INLINE v16 vec_and_fun (v16 x, v16 y) {
  return vec_and (x, y);
}

MAYBE_INLINE v16 vec_or_fun (v16 x, v16 y) {
  return vec_or (x, y);
}

MAYBE_INLINE v16 vec_xor_fun (v16 x, v16 y) {
  return vec_xor (x, y);
}

#undef vec_and
#undef vec_or
#undef vec_xor

#define vec_and(x,y) ((__typeof(x)) vec_and_fun((v16) x, (v16) y))
#define vec_or(x,y)  ((__typeof(x)) vec_or_fun((v16) x, (v16) y))
#define vec_xor(x,y) ((__typeof(x)) vec_xor_fun((v16) x, (v16) y))
#endif // #if defined(__GNUC__)


#define v16_and vec_and
#define v16_or  vec_or
#define v16_xor vec_xor

#define v32_and vec_and
#define v32_or  vec_or
#define v32_xor vec_xor


#define v32_add vec_add

#define v16_add vec_add
#define v16_sub vec_sub
#define v16_mul(a,b) vec_mladd(a,b,CV16(0))

#define v16_shift_l(x,s)  vec_sl (x,CVU16(s))
#define v16_shift_r(x,s)  vec_sra(x,CVU16(s))
#define v16_cmp      vec_cmpgt

#define v16_mergel(a,b)   V1632(vec_mergeh(b,a))
#define v16_mergeh(a,b)   V1632(vec_mergel(b,a))

#define v16_interleavel(a,b)   vec_mergeh(a,b)
#define v16_interleaveh(a,b)   vec_mergel(a,b)

#define v8_mergel(a,b) V816(vec_mergeh(b,a))
#define v8_mergeh(a,b) V816(vec_mergel(b,a))

#define v32_rotate(x,s)  vec_rl(x,CV32(s))

#define vector_shuffle(x,s) vec_perm(x,x,s)

static const v8 SHUFXOR_1 = {4,5,6,7,0,1,2,3,12,13,14,15,8,9,10,11};
static const v8 SHUFXOR_2 = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
static const v8 SHUFXOR_3 = {12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3};

#define v32_shufxor(x,s) vector_shuffle(x,SHUFXOR_##s)

static const v8 SHUFSWAP = {3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12};

#define v32_bswap(x) vector_shuffle(x,SHUFSWAP)

#elif defined(__ARM_NEON__)    // #if   defined(__SSE2__)

/***********************************************************************
 * Support for ARM with NEON
 */

#define BROADCAST_BETTER_THAN_LOAD

#define V64_USE_HALF


#if defined(__llvm__) && !defined(USE_INLINE_ASSEMBLY)

/***********************************************************************
 * NEON version using ARM vector intrinsics
 *
 * This implementation results in better code with llvm-gcc, but both
 * implementation support gcc and llvm-gcc
 *
 * Additionally, the assembly produced by llvm-ggc can be slightly
 * optimised with:
 * perl -pi -e 's/vldmia	([a-z0-9]+), (\{[^,]*,[^,]*\})/vld1.16	\2, [\1, :128]/'
 * perl -pi -e 's/vstmia	([a-z0-9]+), (\{[^,]*,[^,]*\})/vst1.16	\2, [\1, :128]/'
 * perl -pi -e 's/vext.32	q([0-9]+), q\1, q\1, #2/"vswp d".($$1*2).", d".($$1*2+1)/e'
 */

#include <arm_neon.h>

typedef int8x16_t v8  __attribute__ ((aligned (16)));
typedef int16x8_t v16 __attribute__ ((aligned (16)));
typedef int32x4_t v32 __attribute__ ((aligned (16)));
typedef int64x2_t v64 __attribute__ ((aligned (16)));

typedef int64x1_t vv64 __attribute__ ((aligned (16)));

#define v16_and vandq_s16
#define v16_or  vorrq_s16
#define v16_xor veorq_s16

#define v32_and vandq_s32
#define v32_or  vorrq_s32
#define v32_xor veorq_s32

#define v64_and vandq_s64
#define v64_or  vorrq_s64
#define v64_xor veorq_s64

#define v64_add vaddq_s64

#define v32_add vaddq_s32

#define v16_add vaddq_s16
#define v16_sub vsubq_s16
#define v16_mul vmulq_s16

#define V6432 vreinterpretq_s32_s64
#define V3264 vreinterpretq_s64_s32
#define V3216 vreinterpretq_s16_s32
#define V1632 vreinterpretq_s32_s16
#define  V168 vreinterpretq_s8_s16
#define  V816 vreinterpretq_s16_s8

#define v16_shift_r  vshrq_n_s16
#define v16_shift_l  vshlq_n_s16
#define v16_cmp(a,b) vreinterpretq_s16_u16(vcgtq_s16(a,b))

#define vec_if(a,b,c) vbslq_s32(vreinterpretq_u32_s32(a),b,c)

#define vec_maj(a,b,c) vec_if(v32_xor(b,c),a,b)

#define  v8_interleave_inplace(a__,b__) ({		\
      int8x16x2_t c__ = vzipq_s8 (a__, b__);		\
      a__ = c__.val[0];					\
      b__ = c__.val[1];					\
    })

#define  v16_interleave_inplace(a__,b__) ({		\
      int16x8x2_t c__ = vzipq_s16 (a__, b__);		\
      a__ = c__.val[0];					\
      b__ = c__.val[1];					\
    })

#define  v32_interleave_inplace(a__,b__) ({		\
      int32x4x2_t c__ = vzipq_s32 (a__, b__);		\
      a__ = c__.val[0];					\
      b__ = c__.val[1];					\
    })

// FIXME: try to use vswap
#define v64_interleave_inplace(a__, b__) ({		\
      int64x1_t u__ = vget_low_s64 (V3264(a__));	\
      int64x1_t v__ = vget_high_s64(V3264(a__));	\
      int64x1_t w__ = vget_low_s64 (V3264(b__));	\
      int64x1_t x__ = vget_high_s64(V3264(b__));	\
      a__ = V6432(vcombine_s64(u__, w__));		\
      b__ = V6432(vcombine_s64(v__, x__));		\
    })

#define v64_shufrot_inplace_1(x, y) ({			\
      v64 t__, u__;					\
      t__ = vextq_s64(x, y, 1);				\
      u__ = vextq_s64(y, x, 1);				\
      x = t__;						\
      y = u__;						\
    })

#define v64_shufrot_inplace_2(X, Y) do {        \
  v64 t__ = X;                                  \
  X = Y;                                        \
  Y = t__;                                      \
  } while(0)

#define v64_shufrot_inplace_3(x, y) ({			\
      v64 t__, u__;					\
      t__ = vextq_s64(x, y, 1);				\
      u__ = vextq_s64(y, x, 1);				\
      y = t__;						\
      x = u__;						\
    })

#define v64_shufrot_inplace(x,y,s) XCAT(v64_shufrot_inplace_,s)(x,y)

#define  v8_merge_inplace(a__,b__) ({				\
      int8x16x2_t c__ = vzipq_s8 (V168(a__), V168(b__));	\
      a__ = V816(c__.val[0]);					\
      b__ = V816(c__.val[1]);					\
    })

#define  v16_merge_inplace(a__,b__) ({				\
      int16x8x2_t c__ = vzipq_s16 (V3216(a__), V3216(b__));	\
      a__ = V1632(c__.val[0]);					\
      b__ = V1632(c__.val[1]);					\
    })

#define v8_merge_zero_l(a) vaddl_s8(vget_low_s8 (a), vdup_n_s8(0))
#define v8_merge_zero_h(a) vaddl_s8(vget_high_s8(a), vdup_n_s8(0))

#define v32_rotate(x,n) ({				\
      v32 t__ __attribute__ ((unused));			\
      t__ = vsliq_n_s32(t__, x, n);			\
      t__ = vsriq_n_s32(t__, x, 32-(n));		\
      t__;						\
    })

#define v64_rotate(x,n) ({				\
      v64 t__ __attribute__ ((unused));			\
      t__ = vsliq_n_s64(t__, x, n);			\
      t__ = vsriq_n_s64(t__, x, 64-(n));		\
      t__;						\
    })

#define v64_merge vcombine_s64

#define vector_shuffle(x,s) ({					\
      int8x8x2_t x__;						\
      x__.val[0] = vget_low_s8(x);				\
      x__.val[1] = vget_high_s8(x);				\
      vcombine_s8(vtbl2_s8(x__,vget_low_s8(s)),			\
		  vtbl2_s8(x__,vget_high_s8(s)));			\
    })


#define v32_shufxor_1 vrev64q_s32

#define v32_shufxor_2(x) vextq_s32(x,x,2)

#define v32_shufxor_3(x) v32_shufxor_2(v32_shufxor_1(x))

#define v32_shufxor(x,s) XCAT(v32_shufxor_,s)(x)

#define v32_shufrot(x,s) vextq_s32(x, x, s)

#define v64_lswap(x) vextq_s64(x,x,1)

#define v16_broadcast vdupq_n_s16
#define  v8_broadcast vdupq_n_s8

#else // #if defined(__llvm__) && !defined(USE_INLINE_ASSEMBLY)

/***********************************************************************
 * NEON version using GCC vector extensions 
 */


/* Politely ask llvm-gcc to behave more GCC-like
 */
#define ARM_NEON_GCC_COMPATIBILITY

#include <arm_neon.h>


typedef int8x16_t v8;
typedef int16x8_t v16;
typedef int32x4_t v32;
typedef int64x2_t v64;

typedef int64x1_t vv64;

#define vec_and(x,y) ((x)&(y))
#define vec_or(x,y)  ((x)|(y))
#define vec_xor(x,y) ((x)^(y))

#define V6432(x) ((v32) (x))
#define V3264(x) ((v64) (x))
#define V3216(x) ((v16) (x))
#define V1632(x) ((v32) (x))
#define  V168(x) ( (v8) (x))
#define  V816(x) ((v16) (x))

#define v16_and vec_and
#define v16_or  vec_or
#define v16_xor vec_xor

#define v32_and vec_and
#define v32_or  vec_or
#define v32_xor vec_xor
#define v64_xor vec_xor

#define v32_add(x,y) ((x)+(y))
#define v64_add(x,y) ((x)+(y))

#define v16_add(x,y) ((x)+(y))
#define v16_sub(x,y) ((x)-(y))
#define v16_mul(x,y) ((x)*(y))
#define v16_neg(x)   (-(x))


#define v16_shift_l(x,n) ({					\
      v16 t__;							\
      __asm ("vshl.i16\t%q0,%q1,#" #n: "=w"(t__): "w"(x));	\
      t__;							\
    })

#define v16_shift_r(x,n) ({					\
      v16 t__;							\
      __asm ("vshr.s16\t%q0,%q1,#" #n: "=w"(t__): "w"(x));	\
      t__;							\
    })

#define v16_cmp(a,b) ({							\
      v16 t__;								\
      __asm ("vcgt.s16\t%q0, %q1, %q2": "=w"(t__): "w"(a), "w"(b));	\
      t__;								\
    })

#define vec_if(a,b,c) ({						\
      v32 t__ = c;							\
      __asm ("vbit\t%q0, %q1, %q2": "+w"(t__): "w"(b), "w"(a));		\
      t__;								\
    })

#define vec_maj(a,b,c) ({						\
      v32 t__ = v32_xor(b,c);						\
      __asm ("vbsl\t%q0, %q1, %q2": "+w"(t__): "w"(a), "w"(b));		\
      t__;								\
    })


#define v64_merge(a,b)	({				\
      v64 x;						\
      __asm ("vmov\t%e0, %1\n\t"			\
	     "vmov\t%f0, %2":				\
	     "=w"(x): "w"(a), "w" (b));			\
      x;						\
    })

/* Inplace merge and interleave.
 * This output both parts of the merge.
 */

#define v64_interleave_inplace(a,b)		\
  __asm ("vswp\t%f0, %e1":"+w"(a), "+w" (b))

#define v32_interleave_inplace(a,b)		\
  __asm ("vzip.32\t%q0, %q1":"+w"(a), "+w" (b))

#define v16_interleave_inplace(a,b)		\
  __asm ("vzip.16\t%q0, %q1":"+w"(a), "+w" (b))

#define v16_merge_inplace(a,b)			\
  __asm ("vzip.16\t%q0, %q1":"+w"(a), "+w" (b))

#define v8_merge_inplace(a,b)			\
  __asm ("vzip.8\t%q0, %q1":"+w"(a), "+w" (b))

/* Transpose operations.
 * Not used in the current implementation of SIMD.
 */

#define v8_trn_inplace(a,b)			\
  __asm ("vtrn.8  %q0, %q1":"+w"(a), "+w" (b))

#define v16_trn_inplace(a,b)			\
  __asm ("vtrn.16 %q0, %q1":"+w"(a), "+w" (b))

#define v32_trn_inplace(a,b)			\
  __asm ("vtrn.32 %q0, %q1":"+w"(a), "+w" (b))

#define v64_trn_inplace(a,b)			\
  __asm ("vswp %f0, %e1":"+w"(a), "+w" (b))


#define v8_merge_zero_l(a) ({				\
      v16 t__;						\
      __asm ("vaddl.u8\t%q0, %e1, %e2":			\
	     "=w"(t__): "w" (a), "w"(V0));		\
      t__;						\
    })

#define v8_merge_zero_h(a) ({				\
      v16 t__;						\
      __asm ("vaddl.u8\t%q0, %f1, %f2":			\
	     "=w"(t__): "w" (a), "w"(V0));	\
      t__;						\
    })

#define v32_rotate(x,n) ({				\
      v32 t__;						\
      __asm ("vsli.32\t%q0, %q1, #" #n "\n\t"		\
	     "vsri.32\t%q0, %q1, #32-(" #n ")"		\
	     : "=&w"(t__): "w"(x));			\
      t__;						\
    })

#define v64_rotate(x,n) ({				\
      v64 t__;						\
      __asm ("vsli.64\t%q0, %q1, #" #n "\n\t"		\
	     "vsri.64\t%q0, %q1, #64-(" #n ")"		\
	     : "=&w"(t__): "w"(x));			\
      t__;						\
    })

#define vector_shuffle(x,s) ({				\
      v8 t__;						\
      __asm("vtbl.8\t%e0, %h1, %e2\n\t"			\
	    "vtbl.8\t%f0, %h1, %f2"			\
	    : "=&w" (t__): "w"(x), "w"(s));		\
      t__;						\
    })


#define v32_shufxor_1(x) ({				\
      v32 t__;						\
      __asm("vrev64.32\t%q0, %q1": "=w"(t__): "w"(x));	\
      t__;						\
    })

#define v32_shufxor_2(x) ({				\
      v32 t__=x;						\
      __asm("vswp\t%e0, %f0": "+w"(t__));	\
      t__;						\
    })

#define v32_shufxor_3(x) ({				\
      v32 t__;						\
      __asm("vrev64.32\t%q0, %q1\n\t"			\
	    "vswp\t%e0, %f0"				\
	    : "=w"(t__): "w"(x));				\
      t__;						\
    })

#define v32_shufrot_1(x) ({				\
      v32 t__;						\
      __asm("vext.32\t%q0, %q1, %q1, #1":\
	    "=w"(t__): "w"(x));				\
      t__;						\
    })

#define v32_shufrot_2(x) ({				\
      v32 t__=x;						\
      __asm("vswp\t%e0, %f0": "+w"(t__));	\
      t__;						\
    })

#define v32_shufrot_3(x) ({				\
      v32 t__;						\
      __asm("vext.32\t%q0, %q1, %q1, #3":		\
	    "=w"(t__): "w"(x));				\
      t__;						\
    })

#define v32_shufxor(x,s) XCAT(v32_shufxor_,s)(x)
#define v32_shufrot(x,s) XCAT(v32_shufrot_,s)(x)


#define v64_shufrot_inplace_1(x, y) ({			\
      v64 t__, u__;					\
      __asm("vext.32\t%q0, %q1, %q2, #2":		\
	    "=w"(t__): "w"(x), "w"(y));			\
      __asm("vext.32\t%q0, %q2, %q1, #2":		\
	    "=w"(u__): "w"(x), "w"(y));			\
      x = t__;						\
      y = u__;						\
    })

#define v64_shufrot_inplace_2(X, Y) do {        \
  v64 t__ = X;                                  \
  X = Y;                                        \
  Y = t__;                                      \
  } while(0)

#define v64_shufrot_inplace_3(x, y) ({			\
      v64 t__, u__;					\
      __asm("vext.32\t%q0, %q1, %q2, #2":		\
	    "=w"(t__): "w"(x), "w"(y));			\
      __asm("vext.32\t%q0, %q2, %q1, #2":		\
	    "=w"(u__): "w"(x), "w"(y));			\
      y = t__;						\
      x = u__;						\
    })

#define v64_shufrot_inplace(x,y,s) XCAT(v64_shufrot_inplace_,s)(x,y)


#define v64_lswap(a) ({				\
      v64 x = a;				\
      __asm ("vswp\t%f0, %e0":"+w"(x));		\
      x;					\
    })

#define v16_broadcast(i) ({				\
      v16 t__;						\
      __asm("vdup.16\t%q0,%1": "=w"(t__): "r"(i));	\
      t__;						\
    })

#define v8_broadcast(i) ({				\
      v8 t__;						\
      __asm("vdup.8\t%q0,%1": "=w"(t__): "r"(i));	\
      t__;						\
    })

#define v16_broadcast_cst(i) ({				\
      v16 t__;						\
      __asm("vmov.u16\t%q0, #" #i: "=w"(t__));	\
      t__;						\
    })

#define v8_broadcast_cst(i) ({				\
      v8 t__;						\
      __asm("vmov.u8\t%q0, #" #i: "=w"(t__));	\
      t__;						\
    })

#define CV(x) {{x, x, x, x, x, x, x, x}}

/* Force GCC to use load/store with maximal alignement.
 */

#define load_v8(x)  ({						\
      v8 t__;							\
      __asm("vld1.8\t%h0, [%1,:128]": "=w"(t__): "r"(&(x)), "m"(x));	\
      t__;							\
    })

#define load_v16(x)  ({						\
      v16 t__;							\
      __asm("vld1.16\t%h0, [%1,:128]": "=w"(t__): "r"(&(x)), "m"(x));	\
      t__;							\
    })

#define load_v32(x)  ({						\
      v32 t__;							\
      __asm("vld1.32\t%h0, [%1,:128]": "=w"(t__): "r"(&(x)), "m"(x));	\
      t__;							\
    })

#define load_v8_next(x)  ({					\
      v8 t__;							\
      __asm("vld1.8\t%h0, [%1,:128]!": "=w"(t__), "+r"(x));	\
      t__;							\
    })

#define load_v16_next(x)  ({					\
      v16 t__;							\
      __asm("vld1.16\t%h0, [%1,:128]!": "=w"(t__), "+r"(x)); \
      t__;							\
    })

#define load_v32_next(x)  ({					\
      v32 t__;							\
      __asm("vld1.32\t%h0, [%1,:128]!": "=w"(t__), "+r"(x));	\
      t__;							\
    })

#define store_v8(p,x)						\
  __asm("vst1.8\t%h2, [%1,:128]": "=m"(*(p)): "r"(p), "w"(x))

#define store_v16(p,x)						\
  __asm("vst1.16\t%h2, [%1,:128]": "=m"(*(p)): "r"(p), "w"(x))

#define store_v32(p,x)						\
  __asm("vst1.32\t%h2, [%1,:128]": "=m"(*(p)): "r"(p), "w"(x))


#define store_v8_next(p,m,x)						\
  __asm("vst1.8\t%h2, [%0,:128]! @ unused: %1": "+r"(p), "=o"(*(m)): "w"(x))

#define store_v16_next(p,m,x)						\
  __asm("vst1.16\t%h2, [%0,:128]! @ unused: %1": "+r"(p), "=o"(*(m)): "w"(x))

#define store_v32_next(p,m,x)						\
  __asm("vst1.32\t%h2, [%0,:128]! @ unused: %1": "+r"(p), "=o"(*(m)): "w"(x))

#endif // #if defined(__llvm__) && !defined(USE_INLINE_ASSEMBLY)

#define v16_mergel(a,b) ({			\
      v32 t__=V1632(a), u__=V1632(b);		\
      v16_merge_inplace(t__,u__);		\
      t__;					\
    })

#define v16_mergeh(a,b) ({			\
      v32 t__=V1632(a), u__=V1632(b);		\
      v16_merge_inplace(t__,u__);		\
      u__;					\
    })

#define v32_bswap(x) (x)

#else // #if   defined(__SSE2__)

#error "I don't know how to vectorize on this architecture."

#endif // #if   defined(__SSE2__)

/***********************************************************************
 * Definitions common to all architectures
 */


/* Unions to convert vector types to scalar types
 */

union cv {
  unsigned short u16[8];
  v16 v16;
};

union cv8 {
  unsigned char u8[16];
  v8 v8;
};

union u32 {
  u32 u[4];
  v32 v;
};

union u64 {
  u64 u[2];
  v64 v;
};


/* Generic implementations of some macros
 * Specific implementations are provided on some architectures
 */

#ifndef V832
#define  V832(x) V1632(V816(x))
#endif
#ifndef V328
#define  V328(x) V168(V3216(x))
#endif

#ifndef V864
#define  V864(x) V3264((V1632(V816(x))))
#endif
#ifndef V648
#define  V648(x) V168(V3216(V6432(x)))
#endif

#ifndef v8_merge_inplace
#define  v8_merge_inplace(a__,b__) do {				\
      v16 c__ = v8_mergel (V168(a__), V168(b__));               \
      v16 d__ = v8_mergeh (V168(a__), V168(b__));               \
      a__ = c__;                                                \
      b__ = d__;                                                \
  } while (0)
#endif
#ifndef v16_merge_inplace
#define  v16_merge_inplace(a__,b__) do {                        \
      v32 c__ = v16_mergel (V3216(a__), V3216(b__));            \
      v32 d__ = v16_mergeh (V3216(a__), V3216(b__));            \
      a__ = c__;                                                \
      b__ = d__;                                                \
  } while(0)
#endif

#ifndef v32_interleave_inplace
#define  v32_interleave_inplace(a__,b__) do {                   \
      v32 c__ = v32_interleavel (a__, b__);                     \
      v32 d__ = v32_interleaveh (a__, b__);                     \
      a__ = c__;                                                \
      b__ = d__;                                                \
  } while (0)
#endif
#ifndef v64_interleave_inplace
#define  v64_interleave_inplace(a__,b__) do {                   \
      v64 c__ = v64_interleavel (V3264(a__), V3264(b__));       \
      v64 d__ = v64_interleaveh (V3264(a__), V3264(b__));       \
      a__ = V6432(c__);                                         \
      b__ = V6432(d__);                                         \
  } while(0)
#endif

#ifndef v8_merge_inplace_32
#define v8_merge_inplace_32(e__, f__)  do {     \
      v16 g__ = V3216(e__);                     \
      v16 h__ = V3216(f__);                     \
      v8_merge_inplace(g__, h__);               \
      e__ = V1632(g__);                         \
      f__ = V1632(h__);                         \
  } while (0)
#endif

#ifndef  load_v8
#define  load_v8(p) (p)
#endif // #ifndef  load_v8
#ifndef load_v16
#define load_v16(p) (p)
#endif // #ifndef load_v16
#ifndef load_v32
#define load_v32(p) (p)
#endif // #ifndef load_v32

#ifndef  load_v8_next
#define  load_v8_next(p) load_v8 (*((p)++))
#endif // #ifndef  load_v8_next
#ifndef load_v16_next
#define load_v16_next(p) load_v16(*((p)++))
#endif // #ifndef load_v16_next
#ifndef load_v32_next
#define load_v32_next(p) load_v32(*((p)++))
#endif // #ifndef load_v32_next

#ifndef  store_v8
#define  store_v8(p,x) (*(p) = (x))
#endif // #ifndef  store_v8
#ifndef store_v16
#define store_v16(p,x) (*(p) = (x))
#endif // #ifndef store_v16
#ifndef store_v32
#define store_v32(p,x) (*(p) = (x))
#endif // #ifndef store_v32

#ifndef  store_v8_next
#define  store_v8_next(p,m,x) store_v8 (((v8*)p)++,x)
#endif // #ifndef  store_v8_next
#ifndef store_v16_next
#define store_v16_next(p,m,x) store_v16(((v16*)p)++,x)
#endif // #ifndef store_v16_next
#ifndef store_v32_next
#define store_v32_next(p,m,x) store_v32(((v32*)p)++,x)
#endif // #ifndef store_v32_next

#ifndef v8_merge_zero_l
#define v8_merge_zero_l(x) (v8_mergel(x,V0))
#endif // #ifndef v8_merge_zero_l

#ifndef v8_merge_zero_h
#define v8_merge_zero_h(x) (v8_mergeh(x,V0))
#endif // #ifndef v8_merge_zero_h

#ifndef v16_broadcast_cst
#define v16_broadcast_cst v16_broadcast
#endif // #ifndef v16_broadcast_cst

#ifndef v8_broadcast_cst
#define v8_broadcast_cst v8_broadcast
#endif // #ifndef v8_broadcast_cst

/* Boolean functions used in the Feistel rounds
 */

#ifndef vec_if
#define vec_if(B, C, D) v32_xor(v32_and(v32_xor(C,D), B), D)
#endif

#ifndef vec_maj
#define vec_maj(B, C, D) v32_or(v32_and(D, C), v32_and( v32_or(D,C), B))
#endif


/* Tables used for the FFT.
 * The tables are in a seperate object file to ensure maximal alignement.
 * On some architectures, better performances can be obtained by
 * defining the tables inside the function where they are used.
 */

extern const union cv FFT64_Twiddle[];
extern const union cv FFT128_Twiddle[];
extern const union cv FFT256_Twiddle[];
extern const union cv FFT128_Final_Table[];
extern const union cv Tweak;
extern const union cv FinalTweak;

#endif // #ifndef __VECTOR_H__
