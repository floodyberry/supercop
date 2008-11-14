#ifndef SHIP32_MPFQ_2_113_H_
#define SHIP32_MPFQ_2_113_H_

/* MPFQ generated file -- do not edit */

#include "mpfq.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "dump_poly.h"
#include <stdint.h>
#include <emmintrin.h>

#ifdef	MPFQ_
#undef	MPFQ_
#endif
#define MPFQ_(X)	mpfq_2_113_ ## X

#ifndef GMP_LIMB_BITS
#error "Please arrange so that GMP_LIMB_BITS is defined before including this file"
#endif

#if GMP_LIMB_BITS == 32
/* Active handler: field */
/* Automatically generated code for GF(2^113) */
/* Definition polynomial P = X^113 + X^9 + 1 */
/* Active handler: trivialities */
/* Active handler: io */
/* Active handler: linearops */
/* Active handler: inversion */
/* Active handler: reduction */
/* Active handler: plain_c */
/* Options used: sqrslice=8 mul_ur=sb_aligned_sse2 slice=4 favor_sse2=1 machine=core2 */

typedef void * mpfq_2_113_field;
typedef void * mpfq_2_113_field_ptr;

typedef unsigned long mpfq_2_113_elt[4];
typedef unsigned long * mpfq_2_113_dst_elt;
typedef const unsigned long * mpfq_2_113_src_elt;

typedef unsigned long mpfq_2_113_elt_ur[8];
typedef unsigned long * mpfq_2_113_dst_elt_ur;
typedef const unsigned long * mpfq_2_113_src_elt_ur;


/* Functions operating on the field structure */
#define mpfq_2_113_field_degree(f)	113
#define mpfq_2_113_field_init(f)	/**/
#define mpfq_2_113_field_clear(f)	/**/
#define mpfq_2_113_field_specify(f, x, y)	/**/
#define mpfq_2_113_field_setopt(f, x, y)	/**/

/* Element allocation functions */
#define mpfq_2_113_init(f, px)	/**/
#define mpfq_2_113_clear(f, px)	/**/

/* Elementary assignment functions */
static inline
void mpfq_2_113_set(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_set_ui(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, unsigned long);
static inline
unsigned long mpfq_2_113_get_ui(mpfq_2_113_field_ptr, mpfq_2_113_src_elt);
/* missing set_mpn */
/* missing set_mpz */
/* missing get_mpn */
/* missing get_mpz */
static inline
void mpfq_2_113_set_uipoly(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, unsigned long);
static inline
void mpfq_2_113_set_uipoly_wide(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, const unsigned long *, unsigned int);
static inline
unsigned long mpfq_2_113_get_uipoly(mpfq_2_113_field_ptr, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_get_uipoly_wide(mpfq_2_113_field_ptr, unsigned long *, unsigned int, mpfq_2_113_src_elt);

/* Assignment of random values */
static inline
void mpfq_2_113_random(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt);
static inline
void mpfq_2_113_random2(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt);

/* Arithmetic operations on elements */
static inline
void mpfq_2_113_add(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt, mpfq_2_113_src_elt);
#define mpfq_2_113_sub(K, r, s1, s2)	mpfq_2_113_add(K,r,s1,s2)
static inline
void mpfq_2_113_mul(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_sqr(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_sqrt(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt);
#define mpfq_2_113_frobenius(K, r, s)	mpfq_2_113_sqr(K,r,s)
static inline
void mpfq_2_113_add_ui(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt, unsigned long);
#define mpfq_2_113_sub_ui(K, r, s1, s2)	mpfq_2_113_add_ui(K,r,s1,s2)
static inline
void mpfq_2_113_mul_ui(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt, unsigned long);
static inline
int mpfq_2_113_inv(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_longaddshift_left(unsigned long *, const unsigned long *, int, int);
static inline
void mpfq_2_113_longshift_left(unsigned long *, const unsigned long *, int, int);
static inline
void mpfq_2_113_as_solve(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_src_elt);
static inline
unsigned long mpfq_2_113_trace(mpfq_2_113_field_ptr, mpfq_2_113_src_elt);

/* Operations involving unreduced elements */
/* missing elt_ur_init */
/* missing elt_ur_clear */
static inline
void mpfq_2_113_mul_ur(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt_ur, mpfq_2_113_src_elt, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_sqr_ur(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt_ur, mpfq_2_113_src_elt);
static inline
void mpfq_2_113_reduce(mpfq_2_113_field_ptr, mpfq_2_113_dst_elt, mpfq_2_113_dst_elt_ur);

/* Comparison functions */
static inline
int mpfq_2_113_cmp(mpfq_2_113_field_ptr, mpfq_2_113_src_elt, mpfq_2_113_src_elt);
static inline
int mpfq_2_113_cmp_ui(mpfq_2_113_field_ptr, mpfq_2_113_src_elt, unsigned long);

/* Vector allocation functions */
#define mpfq_2_113_vec_init(f, px, n)	/**/
#define mpfq_2_113_vec_clear(f, px, n)	/**/

/* Input/output functions */
void mpfq_2_113_print(mpfq_2_113_field_ptr, FILE *, mpfq_2_113_src_elt);

/* Implementations for inlines */
static inline
void mpfq_2_113_set(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s)
{
	memcpy(r, s, sizeof(mpfq_2_113_elt));
}

static inline
void mpfq_2_113_set_ui(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, unsigned long x)
{
	mpfq_2_113_set_uipoly(K, r, x & 1UL);
}

static inline
unsigned long mpfq_2_113_get_ui(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_src_elt r)
{
	return r[0] & 1UL;
}

static inline
void mpfq_2_113_set_uipoly(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, unsigned long x)
{
	memset(r, 0, sizeof(mpfq_2_113_elt));
	r[0] = x & 0x1ffffUL;
}

static inline
void mpfq_2_113_set_uipoly_wide(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, const unsigned long * x, unsigned int n)
{
	unsigned int i;
	memset(r, 0, sizeof(mpfq_2_113_elt));
	for (i = 0 ; i < n && i < 4 ; i++)
		r[i] = x[i];
	r[3] &= 0x1ffffUL;
}

static inline
unsigned long mpfq_2_113_get_uipoly(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_src_elt r)
{
	return r[0];
}

static inline
void mpfq_2_113_get_uipoly_wide(mpfq_2_113_field_ptr K UNUSED_VARIABLE, unsigned long * r, unsigned int n, mpfq_2_113_src_elt x)
{
	unsigned int i;
	for(i = 0 ; i < 4 && i < n; i++) r[i] = x[i];
	for(      ; i < n ; i++) r[i] = 0;
}

static inline
void mpfq_2_113_random(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r)
{
	mpn_random(r, 4);
	r[3] &= 0x1ffffUL;
}

static inline
void mpfq_2_113_random2(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r)
{
	mpn_random2(r, 4);
	r[3] &= 0x1ffffUL;
}

static inline
void mpfq_2_113_add(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s1, mpfq_2_113_src_elt s2)
{
	int i;
	for(i = 0 ; i < 4 ; i++)
		r[i] = s1[i] ^ s2[i];
}

static inline
void mpfq_2_113_mul(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s1, mpfq_2_113_src_elt s2)
{
	mpfq_2_113_elt_ur t;
	mpfq_2_113_mul_ur(K, t, s1, s2);
	mpfq_2_113_reduce(K, r, t);
}

static inline
void mpfq_2_113_sqr(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s)
{
	mpfq_2_113_elt_ur t;
	mpfq_2_113_sqr_ur(K, t, s);
	mpfq_2_113_reduce(K, r, t);
}

static inline
void mpfq_2_113_sqrt(mpfq_2_113_field_ptr K, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s)
{
	static const mp_limb_t shuffle_table[256] = {
		0, 1, 16, 17, 2, 3, 18, 19,
		32, 33, 48, 49, 34, 35, 50, 51,
		4, 5, 20, 21, 6, 7, 22, 23,
		36, 37, 52, 53, 38, 39, 54, 55,
		64, 65, 80, 81, 66, 67, 82, 83,
		96, 97, 112, 113, 98, 99, 114, 115,
		68, 69, 84, 85, 70, 71, 86, 87,
		100, 101, 116, 117, 102, 103, 118, 119,
		8, 9, 24, 25, 10, 11, 26, 27,
		40, 41, 56, 57, 42, 43, 58, 59,
		12, 13, 28, 29, 14, 15, 30, 31,
		44, 45, 60, 61, 46, 47, 62, 63,
		72, 73, 88, 89, 74, 75, 90, 91,
		104, 105, 120, 121, 106, 107, 122, 123,
		76, 77, 92, 93, 78, 79, 94, 95,
		108, 109, 124, 125, 110, 111, 126, 127,
		128, 129, 144, 145, 130, 131, 146, 147,
		160, 161, 176, 177, 162, 163, 178, 179,
		132, 133, 148, 149, 134, 135, 150, 151,
		164, 165, 180, 181, 166, 167, 182, 183,
		192, 193, 208, 209, 194, 195, 210, 211,
		224, 225, 240, 241, 226, 227, 242, 243,
		196, 197, 212, 213, 198, 199, 214, 215,
		228, 229, 244, 245, 230, 231, 246, 247,
		136, 137, 152, 153, 138, 139, 154, 155,
		168, 169, 184, 185, 170, 171, 186, 187,
		140, 141, 156, 157, 142, 143, 158, 159,
		172, 173, 188, 189, 174, 175, 190, 191,
		200, 201, 216, 217, 202, 203, 218, 219,
		232, 233, 248, 249, 234, 235, 250, 251,
		204, 205, 220, 221, 206, 207, 222, 223,
		236, 237, 252, 253, 238, 239, 254, 255,
	};
	
	mpfq_2_113_elt sqrt_t ={ 0x20UL, 0x2000000UL, 0x0UL, 0x0UL, }
	;
	
	mpfq_2_113_elt odd, even;
	mpfq_2_113_elt_ur odd_t;
	mp_limb_t t;
#define	EVEN_MASK	(((mp_limb_t)-1)/3UL)
#define	ODD_MASK	((EVEN_MASK)<<1)
	unsigned int i;
	for(i = 0 ; i < 4 ; i++) {
		even[i] = s[i] & EVEN_MASK;
	}
	for(i = 0 ; i < 2 ; i++) {
		t = even[2*i];   t |= t >> 7;
			  even[i]  = shuffle_table[t & 255];
		t >>= 16; even[i] |= shuffle_table[t & 255] << 8;
		t = even[2*i+1]; t |= t >> 7;
			  even[i] |= shuffle_table[t & 255] << 16;
		t >>= 16; even[i] |= shuffle_table[t & 255] << 24;
	}
	memset(even + 2, 0, 2 * sizeof(mp_limb_t));
	for(i = 0 ; i < 4 ; i++) {
		odd[i] = (s[i] & ODD_MASK) >> 1;
	}
	for(i = 0 ; i < 2 ; i++) {
		t = odd[2*i];   t |= t >> 7;
			  odd[i]  = shuffle_table[t & 255];
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 8;
		t = odd[2*i+1]; t |= t >> 7;
			  odd[i] |= shuffle_table[t & 255] << 16;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 24;
	}
	memset(odd + 2, 0, 2 * sizeof(mp_limb_t));
	mpfq_2_113_mul_ur(K, odd_t, odd, sqrt_t);
	for(i = 0 ; i < (4+1)/2 ; i++) {
		odd_t[i] ^= even[i];
	}
	/* mpfq_2_113_print(K, stdout, odd_t); */
	mpfq_2_113_reduce(K, r, odd_t);
	/* mpfq_2_113_print(K, stdout, r); */
	/* fprintf(stdout, "\n"); */
	/* fflush(stdout); */
}

static inline
void mpfq_2_113_add_ui(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s, unsigned long x)
{
	mpfq_2_113_set(K, r, s);
	r[0] ^= (x & 1UL);
}

static inline
void mpfq_2_113_mul_ui(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s, unsigned long x)
{
	if (x & 1UL) {
		mpfq_2_113_set(K, r, s);
	} else {
		memset(r, 0, sizeof(mpfq_2_113_elt));
	}
}

static inline
int mpfq_2_113_inv(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s)
{
	mp_limb_t a[4] = { 0x804000UL, 0x0UL, 0x0UL, 0x80000000UL, };
	mp_limb_t b[4];
	mp_limb_t u[4] = { 0, };
	mp_limb_t v[4] = { 1, 0, };
	mp_limb_t x;
	mp_size_t ia, ib;
	int i,d;
	
	if (mpfq_2_113_cmp_ui(K, s, 0UL) == 0)
	    return 0;
	{
		mp_limb_t z;
		z = s[0] << 14;
		b[0] = z;
		z = s[0] >> 18 ^ s[1] << 14;
		b[1] = z;
		z = s[1] >> 18 ^ s[2] << 14;
		b[2] = z;
		z = s[2] >> 18 ^ s[3] << 14;
		b[3] = z;
	}
	ib = clzlx(b, 4);
	ia = 0;
	
	mpfq_2_113_longshift_left(b,b,4,ib);
	
	for(d = ib - ia ; ; ) {
	        if (d == 0) {
	                // dump_poly("a",128,32,a);
	                // dump_poly("b",128,32,b);
	                // dump_poly("u",128,32,u);
	                // dump_poly("v",128,32,v);
	                // printf("(z^%ld*u*s-a) mod P;\n", 128 - 113 - 1 + ia);
	                // printf("(z^%ld*v*s-b) mod P;\n", 128 - 113 - 1 + ib);
	                for(i = 0 ; i < 4 ; i++) v[i] ^= u[i];
			b[0] ^= a[0]; x = b[0];
			b[1] ^= a[1]; x |= b[1];
			b[2] ^= a[2]; x |= b[2];
			b[3] ^= a[3]; x |= b[3];
	                if (!x) { memcpy(r,u,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(b,4);
	                ib += t;
	                d += t;
	                mpfq_2_113_longshift_left(b,b,4,t);
	        }
	        for(;d > 0;) {
	                // dump_poly("a",128,32,a);
	                // dump_poly("b",128,32,b);
	                // dump_poly("u",128,32,u);
	                // dump_poly("v",128,32,v);
	                // printf("(z^%ld*u*s-a) mod P;\n", 128 - 113 - 1 + ia);
	                // printf("(z^%ld*v*s-b) mod P;\n", 128 - 113 - 1 + ib);
	                mpfq_2_113_longaddshift_left(u,v,4,d);
			a[0] ^= b[0]; x = a[0];
			a[1] ^= b[1]; x |= a[1];
			a[2] ^= b[2]; x |= a[2];
			a[3] ^= b[3]; x |= a[3];
	                if (!x) { memcpy(r,v,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(a,4);
	                ia += t;
	                d -= t;
	                mpfq_2_113_longshift_left(a,a,4,t);
	        } 
	        if (d == 0) {
	                // dump_poly("a",128,32,a);
	                // dump_poly("b",128,32,b);
	                // dump_poly("u",128,32,u);
	                // dump_poly("v",128,32,v);
	                // printf("(z^%ld*u*s-a) mod P;\n", 128 - 113 - 1 + ia);
	                // printf("(z^%ld*v*s-b) mod P;\n", 128 - 113 - 1 + ib);
	                for(i = 0 ; i < 4 ; i++) u[i] ^= v[i];
			a[0] ^= b[0]; x = a[0];
			a[1] ^= b[1]; x |= a[1];
			a[2] ^= b[2]; x |= a[2];
			a[3] ^= b[3]; x |= a[3];
	                if (!x) { memcpy(r,v,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(a,4);
	                ia += t;
	                d -= t;
	                mpfq_2_113_longshift_left(a,a,4,t);
	        }
	        for(;d < 0;) {
	                // dump_poly("a",128,32,a);
	                // dump_poly("b",128,32,b);
	                // dump_poly("u",128,32,u);
	                // dump_poly("v",128,32,v);
	                // printf("(z^%ld*u*s-a) mod P;\n", 128 - 113 - 1 + ia);
	                // printf("(z^%ld*v*s-b) mod P;\n", 128 - 113 - 1 + ib);
	                mpfq_2_113_longaddshift_left(v,u,4,-d);
			b[0] ^= a[0]; x = b[0];
			b[1] ^= a[1]; x |= b[1];
			b[2] ^= a[2]; x |= b[2];
			b[3] ^= a[3]; x |= b[3];
	                if (!x) { memcpy(r,u,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(b,4);
	                ib += t;
	                d += t;
	                mpfq_2_113_longshift_left(b,b,4,t);
	        }
	}
}

static inline
void mpfq_2_113_longaddshift_left(unsigned long * dst, const unsigned long * src, int n, int s)
{
	int m = s / 32;
	int i;
	s %= 32;
	dst[m] ^= src[0] << s;
	for(i = 1 ; i < n-m ; i++) {
	    dst[m+i] ^= src[i] << s ^ src[i-1] >> (32-s);
	}
}

static inline
void mpfq_2_113_longshift_left(unsigned long * dst, const unsigned long * src, int n, int s)
{
	int m = s / 32;
	int i;
	s %= 32;
	for(i = n-m-1 ; i > 0 ; i--) {
	    dst[m+i] = src[i] << s ^ src[i-1] >> (32-s);
	}
	dst[m] = src[0] << s;
	for(i = m-1 ; i>= 0 ; i--) {
	    dst[i] = 0UL;
	}
}

static inline
void mpfq_2_113_as_solve(mpfq_2_113_field_ptr K, mpfq_2_113_dst_elt r, mpfq_2_113_src_elt s)
{
	static const mpfq_2_113_elt t[113] = {
		{ 0x0UL, 0x0UL, 0x0UL, 0x0UL, },
		{ 0xa85849deUL, 0x5548c43aUL, 0x70050fc4UL, 0x1080UL, },
		{ 0xa85849dcUL, 0x5548c43aUL, 0x70050fc4UL, 0x1080UL, },
		{ 0x1cf0f468UL, 0x8801adb9UL, 0x4541dc59UL, 0x1UL, },
		{ 0xa85849d8UL, 0x5548c43aUL, 0x70050fc4UL, 0x1080UL, },
		{ 0x1e816f5eUL, 0xf52a6a14UL, 0x898ee070UL, 0x1a357UL, },
		{ 0x1cf0f460UL, 0x8801adb9UL, 0x4541dc59UL, 0x1UL, },
		{ 0x5cf16420UL, 0x9801adb8UL, 0x4541dc58UL, 0x1UL, },
		{ 0xa85849c8UL, 0x5548c43aUL, 0x70050fc4UL, 0x1080UL, },
		{ 0xcd8cee20UL, 0xc9489debUL, 0x61455f55UL, 0x1080UL, },
		{ 0x1e816f7eUL, 0xf52a6a14UL, 0x898ee070UL, 0x1a357UL, },
		{ 0x4d98ec20UL, 0x89489dfbUL, 0x61455e55UL, 0x1080UL, },
		{ 0x1cf0f420UL, 0x8801adb9UL, 0x4541dc59UL, 0x1UL, },
		{ 0xcdc8ec20UL, 0x49488dfbUL, 0x60455f55UL, 0x1080UL, },
		{ 0x5cf164a0UL, 0x9801adb8UL, 0x4541dc58UL, 0x1UL, },
		{ 0xb4a9ace8UL, 0xdd496982UL, 0x3544d39cUL, 0x1081UL, },
		{ 0xa85848c8UL, 0x5548c43aUL, 0x70050fc4UL, 0x1080UL, },
		{ 0x905065deUL, 0x93285422UL, 0x632c0b02UL, 0x5cacUL, },
		{ 0xcd8cec20UL, 0xc9489debUL, 0x61455f55UL, 0x1080UL, },
		{ 0x6124620UL, 0x374abb08UL, 0x8aa7e426UL, 0x1ef7bUL, },
		{ 0x1e816b7eUL, 0xf52a6a14UL, 0x898ee070UL, 0x1a357UL, },
		{ 0x95d0e5deUL, 0x8d225881UL, 0x54a5119UL, 0x1a206UL, },
		{ 0x4d98e420UL, 0x89489dfbUL, 0x61455e55UL, 0x1080UL, },
		{ 0x380b2d16UL, 0xc660901cUL, 0x132904d6UL, 0x4c2cUL, },
		{ 0x1cf0e420UL, 0x8801adb9UL, 0x4541dc59UL, 0x1UL, },
		{ 0xad338516UL, 0x725ba5bUL, 0xbe29e7ebUL, 0x5dedUL, },
		{ 0xcdc8cc20UL, 0x49488dfbUL, 0x60455f55UL, 0x1080UL, },
		{ 0x7f4b8f16UL, 0x66698a09UL, 0x9aad64a7UL, 0x4d7cUL, },
		{ 0x5cf124a0UL, 0x9801adb8UL, 0x4541dc58UL, 0x1UL, },
		{ 0x20000048UL, 0x4000000UL, 0x0UL, 0x0UL, },
		{ 0xb4a92ce8UL, 0xdd496982UL, 0x3544d39cUL, 0x1081UL, },
		{ 0xd319875eUL, 0x3c62f7efUL, 0xe8cbbe25UL, 0x1b3d7UL, },
		{ 0xa85948c8UL, 0x5548c43aUL, 0x70050fc4UL, 0x1080UL, },
		{ 0x5ae36280UL, 0xaf4b16b2UL, 0xcfe6387aUL, 0x1ef7aUL, },
		{ 0x905265deUL, 0x93285422UL, 0x632c0b02UL, 0x5cacUL, },
		{ 0xb2c36336UL, 0xaf2117eaUL, 0xfbe83bb2UL, 0x5dfcUL, },
		{ 0xcd88ec20UL, 0xc9489debUL, 0x61455f55UL, 0x1080UL, },
		{ 0xff1b8716UL, 0x26698a31UL, 0x9aad61e7UL, 0x4d7cUL, },
		{ 0x61a4620UL, 0x374abb08UL, 0x8aa7e426UL, 0x1ef7bUL, },
		{ 0x1beaa200UL, 0xbf4b16f1UL, 0xcfe6287fUL, 0x1ef7aUL, },
		{ 0x1e916b7eUL, 0xf52a6a14UL, 0x898ee070UL, 0x1a357UL, },
		{ 0x7d11eb36UL, 0xf12629d1UL, 0x918af0c1UL, 0x1a317UL, },
		{ 0x95f0e5deUL, 0x8d225881UL, 0x54a5119UL, 0x1a206UL, },
		{ 0xd2226e20UL, 0xf6039b8aUL, 0xafa3372aUL, 0x1fffaUL, },
		{ 0x4dd8e420UL, 0x89489dfbUL, 0x61455e55UL, 0x1080UL, },
		{ 0x27638f16UL, 0x6721aa4bUL, 0xbea966abUL, 0x5dfcUL, },
		{ 0x388b2d16UL, 0xc660901cUL, 0x132904d6UL, 0x4c2cUL, },
		{ 0x52604fdeUL, 0x6d2bc6acUL, 0xccce3c28UL, 0x1a356UL, },
		{ 0x1df0e420UL, 0x8801adb9UL, 0x4541dc59UL, 0x1UL, },
		{ 0xa2832ea0UL, 0xfc0b53c8UL, 0x9bc435b2UL, 0x4970UL, },
		{ 0xaf338516UL, 0x725ba5bUL, 0xbe29e7ebUL, 0x5dedUL, },
		{ 0x89b8c7deUL, 0x2c6f4253UL, 0xa4ca235dUL, 0x1b396UL, },
		{ 0xc9c8cc20UL, 0x49488dfbUL, 0x60455f55UL, 0x1080UL, },
		{ 0xc91184e8UL, 0x60b743bUL, 0x602e8f41UL, 0x1b68fUL, },
		{ 0x774b8f16UL, 0x66698a09UL, 0x9aad64a7UL, 0x4d7cUL, },
		{ 0x3da9ad16UL, 0xd86a98baUL, 0x755f5eddUL, 0x1b286UL, },
		{ 0x4cf124a0UL, 0x9801adb8UL, 0x4541dc58UL, 0x1UL, },
		{ 0xb6d926a0UL, 0xa262ae2eUL, 0xf98befb4UL, 0x1b3d7UL, },
		{ 0x48UL, 0x4000000UL, 0x0UL, 0x0UL, },
		{ 0x42700bfeUL, 0x652bc7acUL, 0xcccf3c28UL, 0x1a356UL, },
		{ 0xf4a92ce8UL, 0xdd496982UL, 0x3544d39cUL, 0x1081UL, },
		{ 0x200UL, 0x20000000UL, 0x0UL, 0x0UL, },
		{ 0x5319875eUL, 0x3c62f7efUL, 0xe8cbbe25UL, 0x1b3d7UL, },
		{ 0x80500800UL, 0x40001000UL, 0x1000100UL, 0x0UL, },
		{ 0xa85948c8UL, 0x5548c43bUL, 0x70050fc4UL, 0x1080UL, },
		{ 0x5d98a9feUL, 0xda60d9d9UL, 0x3695455UL, 0x4c2cUL, },
		{ 0x5ae36280UL, 0xaf4b16b0UL, 0xcfe6387aUL, 0x1ef7aUL, },
		{ 0x2179c936UL, 0x506b3103UL, 0x300e828dUL, 0x1b287UL, },
		{ 0x905265deUL, 0x93285426UL, 0x632c0b02UL, 0x5cacUL, },
		{ 0x3d61e0c8UL, 0x940dee79UL, 0xdd05ecc9UL, 0x141UL, },
		{ 0xb2c36336UL, 0xaf2117e2UL, 0xfbe83bb2UL, 0x5dfcUL, },
		{ 0x261a4668UL, 0x334abb08UL, 0x8aa7e4a6UL, 0x1ef7bUL, },
		{ 0xcd88ec20UL, 0xc9489dfbUL, 0x61455f55UL, 0x1080UL, },
		{ 0xcf13875eUL, 0x22694e33UL, 0xcaac6b63UL, 0x4d7cUL, },
		{ 0xff1b8716UL, 0x26698a11UL, 0x9aad61e7UL, 0x4d7cUL, },
		{ 0xc790aa00UL, 0xe0091a2dUL, 0x89846d31UL, 0x150UL, },
		{ 0x61a4620UL, 0x374abb48UL, 0x8aa7e426UL, 0x1ef7bUL, },
		{ 0xd2226e20UL, 0xf603938aUL, 0x2fa3372aUL, 0x1fefaUL, },
		{ 0x1beaa200UL, 0xbf4b1671UL, 0xcfe6287fUL, 0x1ef7aUL, },
		{ 0x50280000UL, 0x1482042UL, 0x2404820cUL, 0x1080UL, },
		{ 0x1e916b7eUL, 0xf52a6b14UL, 0x898ee070UL, 0x1a357UL, },
		{ 0xa2832ee8UL, 0xf80b53c8UL, 0x9bc635b2UL, 0x4970UL, },
		{ 0x7d11eb36UL, 0xf1262bd1UL, 0x918af0c1UL, 0x1a317UL, },
		{ 0x9a0803b6UL, 0x3a6983d4UL, 0x88ed3164UL, 0x558UL, },
		{ 0x95f0e5deUL, 0x8d225c81UL, 0x54a5119UL, 0x1a206UL, },
		{ 0xec3a4420UL, 0xd29b89eUL, 0x364dd7ceUL, 0x5cadUL, },
		{ 0xd2226e20UL, 0xf603938aUL, 0xafa3372aUL, 0x1fffaUL, },
		{ 0xb2c36136UL, 0x8f2117e2UL, 0xfb683bb2UL, 0x5dfcUL, },
		{ 0x4dd8e420UL, 0x89488dfbUL, 0x61455e55UL, 0x1080UL, },
		{ 0xa2832ee8UL, 0xfc0953c8UL, 0x9bc435b2UL, 0x150UL, },
		{ 0x27638f16UL, 0x67218a4bUL, 0xbea966abUL, 0x5dfcUL, },
		{ 0x268b42c8UL, 0x2b46f808UL, 0x1ae3c4b6UL, 0x1ee3bUL, },
		{ 0x388b2d16UL, 0xc660d01cUL, 0x132904d6UL, 0x4c2cUL, },
		{ 0xb2026c68UL, 0xd34f65e2UL, 0x7b269ba2UL, 0x1ee6bUL, },
		{ 0x52604fdeUL, 0x6d2b46acUL, 0xccce3c28UL, 0x1a356UL, },
		{ 0x0UL, 0x0UL, 0x0UL, 0x100UL, },
		{ 0x1df0e420UL, 0x8800adb9UL, 0x4541dc59UL, 0x1UL, },
		{ 0x85e0a1feUL, 0x9f2ad983UL, 0x256f5319UL, 0x148eUL, },
		{ 0xa2832ea0UL, 0xfc0953c8UL, 0x9bc435b2UL, 0x4970UL, },
		{ 0xbe5a0bfeUL, 0x6002fe32UL, 0xfa83ebe6UL, 0x1fff3UL, },
		{ 0xaf338516UL, 0x721ba5bUL, 0xbe29e7ebUL, 0x5dedUL, },
		{ 0x48UL, 0x0UL, 0x0UL, 0x4800UL, },
		{ 0x89b8c7deUL, 0x2c674253UL, 0xa4ca235dUL, 0x1b396UL, },
		{ 0x3bbaabb6UL, 0xff2827b1UL, 0xdfecb8ffUL, 0x5d7dUL, },
		{ 0xc9c8cc20UL, 0x49588dfbUL, 0x60455f55UL, 0x1080UL, },
		{ 0x4cf12516UL, 0x9901adb8UL, 0x4541dc58UL, 0x1a001UL, },
		{ 0xc91184e8UL, 0x62b743bUL, 0x602e8f41UL, 0x1b68fUL, },
		{ 0x3da9ad5eUL, 0xd8ea98baUL, 0x755f5eddUL, 0x1f286UL, },
		{ 0x774b8f16UL, 0x66298a09UL, 0x9aad64a7UL, 0x4d7cUL, },
		{ 0xfa2803b6UL, 0x39630396UL, 0xbcca33ecUL, 0x33d6UL, },
		{ 0x3da9ad16UL, 0xd8ea98baUL, 0x755f5eddUL, 0x1b286UL, },
		{ 0xb8580848UL, 0x5448c43aUL, 0x70050fc4UL, 0x11080UL, },
		{ 0x4cf124a0UL, 0x9901adb8UL, 0x4541dc58UL, 0x1UL, },
	};
	const mpfq_2_113_elt * ptr = t;
	unsigned int i,j;
	memset(r, 0, sizeof(mpfq_2_113_elt));
	for(i = 0 ; i < 4 ; i++) {
		mp_limb_t a = s[i];
		for(j = 0 ; j < 32 && ptr != &t[113]; j++, ptr++) {
			if (a & 1UL) {
				mpfq_2_113_add(K, r, r, *ptr);
			}
			a >>= 1;
		}
	}
}

static inline
unsigned long mpfq_2_113_trace(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_src_elt s)
{
	return s[0] & 1;
}

static inline
void mpfq_2_113_mul_ur(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt_ur t, mpfq_2_113_src_elt s1, mpfq_2_113_src_elt s2)
{
	/* basecase e1=113 e2=113 slice=4 sse2=64x2 */
	typedef uint64_t v2di __attribute__ ((vector_size (16)));
	typedef long long gcc43bugfix __attribute__ ((vector_size (16)));
	typedef union { v2di s; mp_limb_t x[4]; } v2di_proxy;
	typedef uint32_t v4si __attribute__ ((vector_size (16)));
#define SHL(x,r) (v2di)__builtin_ia32_psllqi128   ((gcc43bugfix) (x),(r))
#define SHR(x,r) (v2di)__builtin_ia32_psrlqi128   ((gcc43bugfix) (x),(r))
#define SHLD(x,r) (v2di)__builtin_ia32_pslldqi128 ((gcc43bugfix) (x),(r))
#define SHRD(x,r) (v2di)__builtin_ia32_psrldqi128 ((gcc43bugfix) (x),(r))
	v2di u;
	v2di t0;
	v2di t1;
	v2di t2;
	
	v2di g[16];
	/* gray code walk */
	v2di b0 = (v2di) (v4si) { s2[0], s2[1], s2[2], s2[3], };
	v2di b1 = SHL(b0, 1);
	v2di b2 = SHL(b0, 2);
	v2di b3 = SHL(b0, 3);
	v2di y = (v2di) { 0, };
	g[ 0] = y; y  = b0;
	g[ 1] = y; y ^= b1;
	g[ 3] = y; y  = b1;
	g[ 2] = y; y ^= b2;
	g[ 6] = y; y ^= b0;
	g[ 7] = y; y ^= b1;
	g[ 5] = y; y  = b2;
	g[ 4] = y; y ^= b3;
	g[12] = y; y ^= b0;
	g[13] = y; y ^= b1;
	g[15] = y; y ^= b0;
	g[14] = y; y ^= b2;
	g[10] = y; y ^= b0;
	g[11] = y; y ^= b1;
	g[ 9] = y; y  = b3;
	g[ 8] = y;
	
	/* round 0 */
	/* writing 64 at 0+0 from 64 */
	u = g[s1[0]       & 15];
	t0  = u;
	/* writing 64 at 0+4 from 64 */
	u = g[s1[0] >>  4 & 15];
	t0 ^= SHL(u,  4); t1  = SHR(u, 60);
	/* writing 64 at 0+8 from 64 */
	u = g[s1[0] >>  8 & 15];
	t0 ^= SHL(u,  8); t1 ^= SHR(u, 56);
	/* writing 64 at 0+12 from 64 */
	u = g[s1[0] >> 12 & 15];
	t0 ^= SHL(u, 12); t1 ^= SHR(u, 52);
	/* writing 64 at 0+16 from 64 */
	u = g[s1[0] >> 16 & 15];
	t0 ^= SHL(u, 16); t1 ^= SHR(u, 48);
	/* writing 64 at 0+20 from 64 */
	u = g[s1[0] >> 20 & 15];
	t0 ^= SHL(u, 20); t1 ^= SHR(u, 44);
	/* writing 64 at 0+24 from 64 */
	u = g[s1[0] >> 24 & 15];
	t0 ^= SHL(u, 24); t1 ^= SHR(u, 40);
	/* writing 64 at 0+28 from 64 */
	u = g[s1[0] >> 28 & 15];
	t0 ^= SHL(u, 28); t1 ^= SHR(u, 36);
	/* writing 64 at 0+32 from 64 */
	u = g[s1[1]       & 15];
	t0 ^= SHL(u, 32); t1 ^= SHR(u, 32);
	/* writing 64 at 0+36 from 64 */
	u = g[s1[1] >>  4 & 15];
	t0 ^= SHL(u, 36); t1 ^= SHR(u, 28);
	/* writing 64 at 0+40 from 64 */
	u = g[s1[1] >>  8 & 15];
	t0 ^= SHL(u, 40); t1 ^= SHR(u, 24);
	/* writing 64 at 0+44 from 64 */
	u = g[s1[1] >> 12 & 15];
	t0 ^= SHL(u, 44); t1 ^= SHR(u, 20);
	/* writing 64 at 0+48 from 64 */
	u = g[s1[1] >> 16 & 15];
	t0 ^= SHL(u, 48); t1 ^= SHR(u, 16);
	/* writing 64 at 0+52 from 64 */
	u = g[s1[1] >> 20 & 15];
	t0 ^= SHL(u, 52); t1 ^= SHR(u, 12);
	/* writing 64 at 0+56 from 64 */
	u = g[s1[1] >> 24 & 15];
	t0 ^= SHL(u, 56); t1 ^= SHR(u,  8);
	/* writing 64 at 0+60 from 64 */
	u = g[s1[1] >> 28 & 15];
	t0 ^= SHL(u, 60); t1 ^= SHR(u,  4);
	
	/* round 1 */
	/* writing 64 at 64+0 from 64 */
	u = g[s1[2]       & 15];
	t1 ^= u;
	/* writing 64 at 64+4 from 64 */
	u = g[s1[2] >>  4 & 15];
	t1 ^= SHL(u,  4); t2  = SHR(u, 60);
	/* writing 64 at 64+8 from 64 */
	u = g[s1[2] >>  8 & 15];
	t1 ^= SHL(u,  8); t2 ^= SHR(u, 56);
	/* writing 64 at 64+12 from 64 */
	u = g[s1[2] >> 12 & 15];
	t1 ^= SHL(u, 12); t2 ^= SHR(u, 52);
	/* writing 64 at 64+16 from 64 */
	u = g[s1[2] >> 16 & 15];
	t1 ^= SHL(u, 16); t2 ^= SHR(u, 48);
	/* writing 64 at 64+20 from 64 */
	u = g[s1[2] >> 20 & 15];
	t1 ^= SHL(u, 20); t2 ^= SHR(u, 44);
	/* writing 64 at 64+24 from 64 */
	u = g[s1[2] >> 24 & 15];
	t1 ^= SHL(u, 24); t2 ^= SHR(u, 40);
	/* writing 64 at 64+28 from 64 */
	u = g[s1[2] >> 28 & 15];
	t1 ^= SHL(u, 28); t2 ^= SHR(u, 36);
	/* writing 64 at 64+32 from 64 */
	u = g[s1[3]       & 15];
	t1 ^= SHL(u, 32); t2 ^= SHR(u, 32);
	/* writing 64 at 64+36 from 64 */
	u = g[s1[3] >>  4 & 15];
	t1 ^= SHL(u, 36); t2 ^= SHR(u, 28);
	/* writing 64 at 64+40 from 64 */
	u = g[s1[3] >>  8 & 15];
	t1 ^= SHL(u, 40); t2 ^= SHR(u, 24);
	/* writing 64 at 64+44 from 64 */
	u = g[s1[3] >> 12 & 15];
	t1 ^= SHL(u, 44); t2 ^= SHR(u, 20);
	/* writing 64 at 64+48 from 64 */
	u = g[s1[3] >> 16 & 1];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* end */
	
	/* repair steps */
	v2di v1 = (v2di) (v4si) { s1[0], s1[1], s1[0], s1[1], };
	v2di v2 = (v2di) (v4si) { s1[2], s1[3], s1[2], s1[3], };
	v2di w;
	v2di m = (v2di) (v4si) { 0xeeeeeeeeUL, 0xeeeeeeeeUL, 0xeeeeeeeeUL, 0xeeeeeeeeUL, };
	w = (v2di) m & -SHR(b0,63);
	t1 ^= SHR(v1 & w, 1);
	t2 ^= SHR(v2 & w, 1);
	m = SHL(m, 1) & m;
	w = (v2di) m & -SHR(b1,63);
	t1 ^= SHR(v1 & w, 2);
	t2 ^= SHR(v2 & w, 2);
	m = SHL(m, 1) & m;
	w = (v2di) m & -SHR(b2,63);
	t1 ^= SHR(v1 & w, 3);
	t2 ^= SHR(v2 & w, 3);
	
	/* store result */
	{
		v2di_proxy r;
		r.s = t0 ^ SHLD(t1, 64);
		t[0] = r.x[0];
		t[1] = r.x[1];
		t[2] = r.x[2];
		t[3] = r.x[3];
	}
	
	{
		v2di_proxy r;
		r.s = t2 ^ SHRD(t1, 64);
		t[4] = r.x[0];
		t[5] = r.x[1];
		t[6] = r.x[2];
		t[7] = r.x[3];
	}
#undef SHL
#undef SHR
#undef SHLD
#undef SHRD
}

static inline
void mpfq_2_113_sqr_ur(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt_ur t, mpfq_2_113_src_elt s)
{
	static const mp_limb_t g[256] = {
		0, 1, 4, 5, 16, 17, 20, 21,
		64, 65, 68, 69, 80, 81, 84, 85,
		256, 257, 260, 261, 272, 273, 276, 277,
		320, 321, 324, 325, 336, 337, 340, 341,
		1024, 1025, 1028, 1029, 1040, 1041, 1044, 1045,
		1088, 1089, 1092, 1093, 1104, 1105, 1108, 1109,
		1280, 1281, 1284, 1285, 1296, 1297, 1300, 1301,
		1344, 1345, 1348, 1349, 1360, 1361, 1364, 1365,
		4096, 4097, 4100, 4101, 4112, 4113, 4116, 4117,
		4160, 4161, 4164, 4165, 4176, 4177, 4180, 4181,
		4352, 4353, 4356, 4357, 4368, 4369, 4372, 4373,
		4416, 4417, 4420, 4421, 4432, 4433, 4436, 4437,
		5120, 5121, 5124, 5125, 5136, 5137, 5140, 5141,
		5184, 5185, 5188, 5189, 5200, 5201, 5204, 5205,
		5376, 5377, 5380, 5381, 5392, 5393, 5396, 5397,
		5440, 5441, 5444, 5445, 5456, 5457, 5460, 5461,
		16384, 16385, 16388, 16389, 16400, 16401, 16404, 16405,
		16448, 16449, 16452, 16453, 16464, 16465, 16468, 16469,
		16640, 16641, 16644, 16645, 16656, 16657, 16660, 16661,
		16704, 16705, 16708, 16709, 16720, 16721, 16724, 16725,
		17408, 17409, 17412, 17413, 17424, 17425, 17428, 17429,
		17472, 17473, 17476, 17477, 17488, 17489, 17492, 17493,
		17664, 17665, 17668, 17669, 17680, 17681, 17684, 17685,
		17728, 17729, 17732, 17733, 17744, 17745, 17748, 17749,
		20480, 20481, 20484, 20485, 20496, 20497, 20500, 20501,
		20544, 20545, 20548, 20549, 20560, 20561, 20564, 20565,
		20736, 20737, 20740, 20741, 20752, 20753, 20756, 20757,
		20800, 20801, 20804, 20805, 20816, 20817, 20820, 20821,
		21504, 21505, 21508, 21509, 21520, 21521, 21524, 21525,
		21568, 21569, 21572, 21573, 21584, 21585, 21588, 21589,
		21760, 21761, 21764, 21765, 21776, 21777, 21780, 21781,
		21824, 21825, 21828, 21829, 21840, 21841, 21844, 21845,
	};
	{
		mp_limb_t u;
		u = g[s[0]       & 255];
	t[0]  = u;
		u = g[s[0] >>  8 & 255];
	t[0] ^= u << 16;
		u = g[s[0] >> 16 & 255];
	t[1]  = u;
		u = g[s[0] >> 24 & 255];
	t[1] ^= u << 16;
		u = g[s[1]       & 255];
	t[2]  = u;
		u = g[s[1] >>  8 & 255];
	t[2] ^= u << 16;
		u = g[s[1] >> 16 & 255];
	t[3]  = u;
		u = g[s[1] >> 24 & 255];
	t[3] ^= u << 16;
		u = g[s[2]       & 255];
	t[4]  = u;
		u = g[s[2] >>  8 & 255];
	t[4] ^= u << 16;
		u = g[s[2] >> 16 & 255];
	t[5]  = u;
		u = g[s[2] >> 24 & 255];
	t[5] ^= u << 16;
		u = g[s[3]       & 255];
	t[6]  = u;
		u = g[s[3] >>  8 & 255];
	t[6] ^= u << 16;
		u = g[s[3] >> 16 & 1];
	t[7]  = u;
	}
}

static inline
void mpfq_2_113_reduce(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_dst_elt r, mpfq_2_113_dst_elt_ur t)
{
	{
		mp_limb_t s[4];
		/* 112 excess bits */
		{
			mp_limb_t z;
			z = t[0];
			s[0] = z;
			z = t[1];
			s[1] = z;
			z = t[2];
			s[2] = z;
			z = (t[3]) & 0x1ffffUL;
			s[3] = z;
		}
		{
			mp_limb_t z;
			z = t[3] >> 17 ^ t[4] << 15;
			s[0]^= z <<  9;
			s[0]^= z;
			z >>= 23;
			z^= t[4] >> 17 <<  9 ^ t[5] << 24;
			s[1]^= z;
			z >>= 9;
			z^= t[5] >>  8 << 23;
			s[1]^= z;
			z >>= 23;
			z^= t[5] >> 17 <<  9 ^ t[6] << 24;
			s[2]^= z;
			z >>= 9;
			z^= t[6] >>  8 << 23;
			s[2]^= z;
			z >>= 23;
			z^= t[6] >> 17 <<  9 ^ t[7] << 24;
			s[3]^= z;
			z >>= 9;
			s[3]^= z;
		}
		/* 8 excess bits */
		{
			mp_limb_t z;
			z = s[0];
			r[0] = z;
			z = s[1];
			r[1] = z;
			z = s[2];
			r[2] = z;
			z = (s[3]) & 0x1ffffUL;
			r[3] = z;
		}
		{
			mp_limb_t z;
			z = s[3] >> 17;
			r[0]^= z <<  9;
			r[0]^= z;
		}
	}
}

static inline
int mpfq_2_113_cmp(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_src_elt a, mpfq_2_113_src_elt b)
{
	return mpn_cmp(a, b, 4);
}

static inline
int mpfq_2_113_cmp_ui(mpfq_2_113_field_ptr K UNUSED_VARIABLE, mpfq_2_113_src_elt r, unsigned long x)
{
	int i;
	if (r[0] < (x & 1UL)) return -1;
	if (r[0] > (x & 1UL)) return 1;
	for(i = 1 ; i < 4 ; i++) {
		if (r[i]) return 1;
	}
	return 0;
}

#endif      /* GMP_LIMB_BITS == 32 */


#endif  /* SHIP32_MPFQ_2_113_H_ */

/* vim:set ft=cpp: */
