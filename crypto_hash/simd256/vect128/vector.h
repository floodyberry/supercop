#ifndef __VECTOR_H__
#define __VECTOR_H__


#if defined(__GNUC__) && !defined(__INTEL_COMPILER)

/******************************* 
 * Using GCC vector extensions * 
 *******************************/

#if   defined(__SSE2__)

//typedef unsigned char v16qi __attribute__ ((vector_size (16)));
typedef char          v16qi __attribute__ ((vector_size (16)));
typedef short          v8hi __attribute__ ((vector_size (16)));
typedef int            v4si __attribute__ ((vector_size (16)));
typedef float          v4sf __attribute__ ((vector_size (16)));

typedef short          v4hi __attribute__ ((vector_size (8)));
typedef unsigned char  v8qi __attribute__ ((vector_size (8)));

typedef v16qi v8;
typedef v8hi v16;
typedef v4si v32;
#define V16_SIZE 8

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

#define V3216(x) ((v16) (x))
#define V1632(x) ((v32) (x))
#define  V168(x) ( (v8) (x))
#define  V816(x) ((v16) (x))


#define vec_and(x,y) ((x)&(y))
#define vec_or(x,y)  ((x)|(y))
#define vec_xor(x,y) ((x)^(y))

#define v16_and vec_and
#define v16_or  vec_or
#define v16_xor vec_xor

#define v32_and vec_and
#define v32_or  vec_or
#define v32_xor vec_xor

#define v32_add(x,y) ((x)+(y))

#define v16_add(x,y) ((x)+(y))
#define v16_sub(x,y) ((x)-(y))
#define v16_mul(x,y) ((x)*(y))
#define v16_neg(x)   (-(x))
#define v16_shift_l  __builtin_ia32_psllwi128
#define v16_shift_r  __builtin_ia32_psrawi128
#define v16_cmp      __builtin_ia32_pcmpgtw128

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

#define v32_shuf __builtin_ia32_pshufd

#define SHUFROT_1 0x39          /* 0b00111001 */
#define SHUFROT_2 0x4e          /* 0b01001110 */

#define v32_shufrot(x,s) v32_shuf(x,SHUFROT_##s)

#define v32_bswap(x) (x)

#define CV(x) {{x, x, x, x, x, x, x, x}}

#elif defined(__ALTIVEC__)

#include <altivec.h>

typedef vector unsigned char  v8;
typedef vector signed   short v16;
typedef vector unsigned int   v32;

#define V3216(x) ((v16) (x))
#define V1632(x) ((v32) (x))
#define  V168(x) ( (v8) (x))
#define  V816(x) ((v16) (x))

#define V16_SIZE 8
#define print_vec print_sse

#define MAKE_VECT(x, ...) {{x, __VA_ARGS__}}

#define CV(x) MAKE_VECT(x, x, x, x, x, x, x, x)
#define CV16(x)  ((vector   signed short) {x,x,x,x,x,x,x,x})
#define CVU16(x) ((vector unsigned short) {x,x,x,x,x,x,x,x})
#define CV32(x)  ((vector unsigned int  ) {x,x,x,x})

union cv {
  uint16_t u16[8];
  v16 v16;
};

union cv8 {
  unsigned char u8[16];
  v8 v8;
};

union ucv {
  uint16_t u16[8];
  vector unsigned char v16;
};

// Nasty hack to avoid macro expansion madness

v16 vec_and_fun (v16 x, v16 y) {
  return vec_and (x, y);
}

v16 vec_or_fun (v16 x, v16 y) {
  return vec_and (x, y);
}

v16 vec_xor_fun (v16 x, v16 y) {
  return vec_and (x, y);
}

#undef vec_and
#undef vec_or
#undef vec_xor

#define vec_and(x,y) ((__typeof(x)) vec_and_fun((v16) x, (v16) y))
#define vec_or(x,y)  ((__typeof(x)) vec_or_fun((v16) x, (v16) y))
#define vec_xor(x,y) ((__typeof(x)) vec_xor_fun((v16) x, (v16) y))


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

vector unsigned   short ZZ = {0,0,0,0,0,0,0,0};

v16 v16_shift_l(v16 x,int s) {
  vector unsigned short shift = {s,s,s,s,s,s,s,s};
  v16 y = vec_sl (x, shift);
  return y;
}
#define v16_shift_l(x,s)  vec_sl (x,CVU16(s))
#define v16_shift_r(x,s)  vec_sra(x,CVU16(s))
#define v16_cmp      vec_cmpgt

#define v16_mergel(a,b)   vec_mergeh(b,a)
#define v16_mergeh(a,b)   vec_mergel(b,a)

#define v16_interleavel(a,b)   vec_mergeh(a,b)
#define v16_interleaveh(a,b)   vec_mergel(a,b)

#define v8_mergel(a,b) vec_mergeh(b,a)
#define v8_mergeh(a,b) vec_mergel(b,a)

#define v32_rotate(x,s)  vec_rl(x,CV32(s))

// #define v32_unpckl   vec_mergel
// #define v32_unpckh   vec_mergeh

#define vector_shuffle(x,s) vec_perm(x,x,s)

static const v8 SHUFROT_1 = {4,5,6,7,8,9,10,11,12,13,14,15,0,1,2,3};
static const v8 SHUFROT_2 = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};

#define v32_shufrot(x,s) vector_shuffle(x,SHUFROT_##s)

static const v8 SHUFSWAP = {15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0};

#define v32_bswap(x) vector_shuffle(x,SHUFSWAP)

#else

#error "I don't know how to vectorize on this architecture."

#endif

#else

/******************************** 
 * Using MSVC/ICC vector instrinsics * 
 ********************************/

#include <emmintrin.h>

typedef __m128i  v8;
typedef __m128i v16;
typedef __m128i v32;

#define V3216(x) (x)
#define V1632(x) (x)
#define  V168(x) (x)
#define  V816(x) (x)

#define V16_SIZE 8

union cv {
  unsigned short u16[8];
  v16 v16;
};

union cv8 {
  unsigned char u8[16];
  v8 v8;
};

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

#define vector_shuffle(x,s) _mm_shuffle_epi8(x, s)

#define v32_add      _mm_add_epi32

#define v16_add      _mm_add_epi16
#define v16_sub      _mm_sub_epi16
#define v16_mul      _mm_mullo_epi16
#define v16_neg(x)   (-(x))
#define v16_shift_l  _mm_slli_epi16
#define v16_shift_r  _mm_srai_epi16
#define v16_cmp      _mm_cmpgt_epi16

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

#define v32_shuf     _mm_shuffle_epi32

#define SHUFROT_1 0x39          /* 0b00111001 */
#define SHUFROT_2 0x4e          /* 0b01001110 */

#define v32_shufrot(x,s) v32_shuf(x,SHUFROT_##s)

#define v32_bswap(x) (x)

#endif

#endif
