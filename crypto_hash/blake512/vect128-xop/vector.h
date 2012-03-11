#ifndef __VECTOR_H__
#define __VECTOR_H__



#include "compat.h"
#define CAT(x, y) x##y
#define XCAT(x,y) CAT(x,y)

/***********************************************************************

 *  implementation for XOP (using vprotd for rotations)
 */


/***********************************************************************
 * Support for x86/x86_64 with SSE2
 */

/***********************************************************************
 * SSE2 version using MSVC/ICC vector intrinsics
 * (Note that this implementation is also supported by GCC)
 */

#include <emmintrin.h>

#ifdef __SSSE3__
#include <tmmintrin.h>
#include <x86intrin.h>
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

// #define vector_shuffle(x,s) _mm_shuffle_epi8(x, s)

#define vector_shuffle(x,s) _mm_perm_epi8(x,x, s)

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


/* XOP rotation */
#define v64_rotate(x,n)                                 \
  _mm_roti_epi64( x, (int)(n) ) 


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
