/*
 *  This file is part of Binary-library.
 *
 *  Binary-library is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  Foobar is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <wmmintrin.h>
#include <emmintrin.h>
#include <immintrin.h>
#include <string.h>

//// FIELD 
typedef unsigned char u8;
typedef long i64;
typedef unsigned long ui64;
typedef unsigned int uint128_t __attribute__((mode(TI)));

//#define align __attribute__ ((aligned (32)))

#define WSIZE 64

// Field F(2^127)
typedef ui64 elt[2];
typedef ui64 elt_x2[4];
typedef ui64 *elt_pt;

#define DEGREE 127

#define types_comp(a, b) (memcmp(a, b, sizeof(ui64)*2)==0)

#define types_setzero(a) memset(a, 0, sizeof(ui64)*2);
	
#define types_setzero_2x(a) memset(a, 0, sizeof(ui64)*4);

#define types_setone(a) memset(a, 0, sizeof(ui64)*2); a[0] = 0x1;

#define types_isone(a)	(a[0]==1 && a[1]==0) 

#define types_iszero(a)	(!(a[0] || a[1])) 

#define types_isnotzero(a) ((a[0] || a[1])) 

#define types_iszero_2x(a) (!(a[0] || a[1] || a[2] || a[3]))

#define types_copy(Y,X) memcpy(Y, X, sizeof(ui64)*2);

#define types_copy_2x(Y,X) memcpy(Y, X, sizeof(ui64)*4);

// Field F(2^127)^2
typedef ui64 elt254[4];
typedef ui64 elt254_x2[8];

#define DEGREE254 254

#define types_comp254(a, b) (memcmp(a, b, sizeof(ui64)*4)==0)

#define types_isone254(a) (a[0]==1 && a[1]==0 && a[2]==0 && a[3]==0)

#define types_iszero254(a) (!(a[0] || a[1] || a[2] || a[3]))

#define types_isnotzero254(a) ((a[0] || a[1] || a[2] || a[3]))

#define types_iszero_2x254(a) (!(a[0] || a[1] || a[2] || a[3] || a[4] || a[5] || a[6] || a[7]))

#define types_setzero254(a) memset(a, 0, sizeof(ui64)*4);

#define types_setone254(a) a[0] = 0x1; a[1] = 0x0; a[2] = 0x0; a[3] = 0x0;

#define types_copy254(Y,X) memcpy(Y, X, sizeof(ui64)*4);

#define types_copy254_2x(Y,X) memcpy(Y, X, sizeof(ui64)*8);

//// CURVE
typedef enum{GLS254} curve_type;

typedef struct curve {
	elt254 Gx, Gy, Qx, Qy, a, b, bsqrt;
	int deg;
	curve_type type;
} Curve;

//// FIELD ARITHMETIC

//#ADDITION_127#
#define low_add(c, a, b)\
	*(__m128i*)(c) = _mm_xor_si128( *(__m128i*)(a), *(__m128i*)(b) );

//#ADDITION_254#
#define low_add254(c, a, b)\
	*(__m128i*)(c) = _mm_xor_si128( *(__m128i*)(a), *(__m128i*)(b) );\
	*(__m128i*)(c+0x2) = _mm_xor_si128( *(__m128i*)(a+0x2),	*(__m128i*)(b+0x2) );

//#ADDITION_512 (254x2)#
#define low_addx2_254(c, a, b)\
	*(__m128i*)(c) = _mm_xor_si128( *(__m128i*)(a), *(__m128i*)(b) );\
	*(__m128i*)(c+0x2) = _mm_xor_si128( *(__m128i*)(a+0x2),	*(__m128i*)(b+0x2) );\
	*(__m128i*)(c+0x4) = _mm_xor_si128( *(__m128i*)(a+0x4),	*(__m128i*)(b+0x4) );\
	*(__m128i*)(c+0x6) = _mm_xor_si128( *(__m128i*)(a+0x6),	*(__m128i*)(b+0x6) );

//#ADDITION OF 256 and 512#
//a has 512, b, 256 and c, 512 bits, respectively
#define low_add_nr254(c, a, b)\
	*(__m128i*)(c) = _mm_xor_si128( *(__m128i*)(a), *(__m128i*)(b) );\
	*(__m128i*)(c+0x4) = _mm_xor_si128( *(__m128i*)(a+0x4),	*(__m128i*)(b+0x2) );\
	*(__m128i*)(c+0x2) = *(__m128i*)(a+0x2);\
	*(__m128i*)(c+0x6) = *(__m128i*)(a+0x6);\

//#TRACE_127#
//f(x) = x^127 + x^63 + 1
#define low_tr(a) (a[0] & 0x1);
//#INVERTED TRACE_127 FOR OPTIMIZED HALF_TRACE FUNCTION#
#define low_trHTR(a) !(a[0] & 0x1);

//#TRACE_254#
//g(x) = u^2 + u + 1
#define low_tr254(a) (a[2] & 0x1);

//#REDUCTION_127#
//f(x) = x^127 + x^63 + 1
#define REDUCE(t0, m1, m0)\
   t0 = _mm_alignr_epi8(m1,m0,8);\
   t0 = _mm_xor_si128(t0, m1);\
   m1 =  _mm_slli_epi64(m1, 1);\
   m0 = _mm_xor_si128(m0,m1);\
   m1 = _mm_unpackhi_epi64(m1, t0);\
   m0 = _mm_xor_si128(m0,m1);\
   t0 = _mm_srli_epi64(t0, 63);\
   m0 = _mm_xor_si128(m0, t0);\
   m1 = _mm_unpacklo_epi64(t0, t0);\
   m0 = _mm_xor_si128(m0, _mm_slli_epi64(m1, 63));\

//#REDUCTION_127 FOR SQUARING#
#define REDUCESQUARE(t0, m1, m0)\
   	t0 = _mm_alignr_epi8(m1, m0, 8);\
   	t0 = _mm_xor_si128(t0, m1);\
   	m1 = _mm_slli_epi64(m1, 1);\
   	m0 = _mm_xor_si128(m0, m1);\
   	t0 = _mm_unpackhi_epi64(m1, t0);\
   	m0 = _mm_xor_si128(m0, t0);

//#MULTIPLICATION_127#
#define MUL4(r1,r0,ma,mb)\
	t0 = _mm_xor_si128(_mm_unpacklo_epi64(ma,mb), _mm_unpackhi_epi64(ma,mb));\
	r0 = _mm_clmulepi64_si128(ma, mb, 0x00);\
	r1 = _mm_clmulepi64_si128(ma, mb, 0x11);\
	t0 = _mm_clmulepi64_si128(t0, t0, 0x10);\
	t0 = _mm_xor_si128(t0, _mm_xor_si128(r0,r1));\
	r0 = _mm_xor_si128(r0, _mm_slli_si128(t0, 8));\
	r1 = _mm_xor_si128(r1, _mm_srli_si128(t0, 8));

//#SQUARE_127#
#define SQUARE(a0, a1, sq, mask)\
	a1 = _mm_and_si128(a0, mask);\
	a1 = _mm_shuffle_epi8(sq, a1);\
	t0 = _mm_srli_epi64(a0, 4);\
	t0 = _mm_and_si128(t0, mask);\
	t0 = _mm_shuffle_epi8(sq, t0);\
	a0 = _mm_unpacklo_epi8(a1, t0);\
	a1 = _mm_unpackhi_epi8(a1, t0);

//// CURVE ARITHMETIC
#define ec_pro2aff_lambda( ax, ay, px, py, pz )\
	low_inv254(ax, pz);\
	low_mul254(ay, py, ax); low_mul254(ax, px, ax);

#define ec_lmb2aff( ax, ay, lx, ly )\
	types_copy254(ax, lx); low_add254(ay, lx, ly); low_mul254(ay, ay, lx);

#define ec_aff2lmb( lx, ly, ax, ay )\
	low_inv254(lx, ax); low_mul254(ly, ay, lx); low_add254(ly, ly, ax);\
	types_copy254(lx, ax);

//// SCALAR MULTIPLICATION
#define SUM64(c,a,b,cr)\
	c = a + b + cr;\
	if (!cr) { cr = (c < a); }\
	else { cr = (c <= a); }

#define SUB64(c,a,b,bw)\
	c = a - b - bw;\
	if (!bw) { bw = (c > a); }\
	else { bw = (c >= a); }

#define SUMX64(c,a,b,cr)\
	c = a + b + cr;\
	cr = (c < a);	

#define SUBX64(c,a,b,bw)\
	c = a - b - bw;\
	bw = (c > a);	

//schoolbook multiplication (4 x 1) 64bit words
#define SCHBOOKFULLh(h,c,a,b)\
	h = ((uint128_t) a*b[0]);\
	c[0] = h; c[1] = h >> 64;\
	h = ((uint128_t) a*b[1]);\
	c[2] = h; c[3] = h >> 64;\
	h = ((uint128_t) a*b[2]);\
	c[4] = h; c[5] = h >> 64;\
	h = ((uint128_t) a*b[3]);\
	c[6] = h; c[7] = h >> 64;

//schoolbook sum optimized (4 x 1)
#define SCHBOOKSUMh(c,r,cr,tmp)\
	cr = 0;\
	SUM64(tmp, c[1], c[2], cr);\
	SUM64(tmp, c[3], c[4], cr);\
	SUM64(r[0], c[5], c[6], cr);\
	r[1] = c[7] + cr;

//optimized schoolbook multiplication (4 x 2) 64bit words
#define SCHBOOK(h,c,a,b)\
	h = ((uint128_t) a[0]*b[0]);\
	c[0] = h; c[1] = h >> 64;\
	h = ((uint128_t) a[0]*b[1]);\
	c[2] = h; c[3] = h >> 64;\
	h = ((uint128_t) a[0]*b[2]);\
	c[4] = h; c[5] = h >> 64;\
	c[6] = a[0]*b[3];\
	h = ((uint128_t) a[1]*b[0]);\
	c[8] = h; c[9] = h >> 64;\
	h = ((uint128_t) a[1]*b[1]);\
	c[10] = h; c[11] = h >> 64;\
	c[12] = a[1]*b[2];

#define SCHBOOKSUM(c,r,cr)\
	c[0] = r[0];\
	cr = 0;\
	SUM64(c[1], r[1], r[2], cr);\
	SUM64(c[2], r[3], r[4], cr);\
	SUM64(c[3], r[5], r[6], cr);\
	cr = 0;\
	SUM64(c[1], r[8], c[1], cr);\
	SUM64(c[2], r[9], c[2], cr);\
	SUM64(c[3], r[12], c[3], cr);\
	cr = 0;\
	SUM64(c[2], r[10], c[2], cr);\
	SUM64(c[3], r[11], c[3], cr);

//#ENDOMORPHISM#
#define PSI_LAMBDA_ORG_SIGNED(x,y,a,b,s)\
	x[2] = a[2]; x[3] = a[3];\
	low_add(&x[0], &a[0], &a[2]);\
	y[2] = b[2]; y[3] = b[3];\
	low_add(&y[0], &b[0], &y[2]);\
	y[2] = y[2] ^ 0x1;\
	y[0] = y[0] ^ s;

//#AES#
#define EXP(k, t, t0)\
	t = _mm_shuffle_epi32(t, 0xff);\
	t0 = _mm_slli_si128(k, 4);\
	k = _mm_xor_si128(k, t0);\
	t0 = _mm_slli_si128(t0, 4);\
	k = _mm_xor_si128(k, t0);\
	t0 = _mm_slli_si128(t0, 4);\
	k = _mm_xor_si128(k, t0);\
	k = _mm_xor_si128(k, t)

#define STEP(k, t, t0, offset, rcon)\
	t = _mm_aeskeygenassist_si128(k, rcon);\
	EXP(k, t, t0);\
	_mm_storeu_si128((__m128i *) &expKey[offset], k);

