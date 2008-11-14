#ifndef MPFQ_2_251_H_
#define MPFQ_2_251_H_

/* MPFQ generated file -- do not edit */

#include "mpfq.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdint.h>
#include <emmintrin.h>

#ifdef	MPFQ_
#undef	MPFQ_
#endif
#define MPFQ_(X)	mpfq_2_251_ ## X

#ifndef GMP_LIMB_BITS
#error "Please arrange so that GMP_LIMB_BITS is defined before including this file"
#endif

#if GMP_LIMB_BITS == 32
/* Active handler: field */
/* Automatically generated code for GF(2^251) */
/* Definition polynomial P = X^251 + X^7 + X^4 + X^2 + 1 */
/* Active handler: trivialities */
/* Active handler: io */
/* Active handler: linearops */
/* Active handler: inversion */
/* Active handler: reduction */
/* Active handler: plain_c */
/* Options used: sqrslice=4 mul_ur=sb_aligned_sse2 slice=4 */

typedef void * mpfq_2_251_field;
typedef void * mpfq_2_251_field_ptr;

typedef unsigned long mpfq_2_251_elt[8];
typedef unsigned long * mpfq_2_251_dst_elt;
typedef const unsigned long * mpfq_2_251_src_elt;

typedef unsigned long mpfq_2_251_elt_ur[16];
typedef unsigned long * mpfq_2_251_dst_elt_ur;
typedef const unsigned long * mpfq_2_251_src_elt_ur;


/* Functions operating on the field structure */
#define mpfq_2_251_field_degree(f)	251
#define mpfq_2_251_field_init(f)	/**/
#define mpfq_2_251_field_clear(f)	/**/
#define mpfq_2_251_field_specify(f, x, y)	/**/
#define mpfq_2_251_field_setopt(f, x, y)	/**/

/* Element allocation functions */
#define mpfq_2_251_init(f, px)	/**/
#define mpfq_2_251_clear(f, px)	/**/

/* Elementary assignment functions */
static inline
void mpfq_2_251_set(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_set_ui(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, unsigned long);
static inline
unsigned long mpfq_2_251_get_ui(mpfq_2_251_field_ptr, mpfq_2_251_src_elt);
/* missing set_mpn */
/* missing set_mpz */
/* missing get_mpn */
/* missing get_mpz */
static inline
void mpfq_2_251_set_uipoly(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, unsigned long);
static inline
void mpfq_2_251_set_uipoly_wide(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, const unsigned long *, unsigned int);
static inline
unsigned long mpfq_2_251_get_uipoly(mpfq_2_251_field_ptr, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_get_uipoly_wide(mpfq_2_251_field_ptr, unsigned long *, unsigned int, mpfq_2_251_src_elt);

/* Assignment of random values */
static inline
void mpfq_2_251_random(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt);
static inline
void mpfq_2_251_random2(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt);

/* Arithmetic operations on elements */
static inline
void mpfq_2_251_add(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
#define mpfq_2_251_sub(K, r, s1, s2)	mpfq_2_251_add(K,r,s1,s2)
static inline
void mpfq_2_251_mul(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_sqr(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_sqrt(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt);
#define mpfq_2_251_frobenius(K, r, s)	mpfq_2_251_sqr(K,r,s)
static inline
void mpfq_2_251_add_ui(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt, unsigned long);
#define mpfq_2_251_sub_ui(K, r, s1, s2)	mpfq_2_251_add_ui(K,r,s1,s2)
static inline
void mpfq_2_251_mul_ui(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt, unsigned long);
static inline
int mpfq_2_251_inv(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_longaddshift_left(unsigned long *, const unsigned long *, int, int);
static inline
void mpfq_2_251_longshift_left(unsigned long *, const unsigned long *, int, int);
static inline
void mpfq_2_251_as_solve(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_src_elt);
static inline
unsigned long mpfq_2_251_trace(mpfq_2_251_field_ptr, mpfq_2_251_src_elt);

/* Operations involving unreduced elements */
/* missing elt_ur_init */
/* missing elt_ur_clear */
static inline
void mpfq_2_251_mul_ur(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt_ur, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_mul_basecase128x128s4X64x2(mpfq_2_251_dst_elt, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_mul_basecase123x123s4X64x2(mpfq_2_251_dst_elt, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_addmul_basecase128x128s4X64x2(mpfq_2_251_dst_elt, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_sqr_ur(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt_ur, mpfq_2_251_src_elt);
static inline
void mpfq_2_251_reduce(mpfq_2_251_field_ptr, mpfq_2_251_dst_elt, mpfq_2_251_dst_elt_ur);

/* Comparison functions */
static inline
int mpfq_2_251_cmp(mpfq_2_251_field_ptr, mpfq_2_251_src_elt, mpfq_2_251_src_elt);
static inline
int mpfq_2_251_cmp_ui(mpfq_2_251_field_ptr, mpfq_2_251_src_elt, unsigned long);

/* Vector allocation functions */
#define mpfq_2_251_vec_init(f, px, n)	/**/
#define mpfq_2_251_vec_clear(f, px, n)	/**/

/* Input/output functions */
void mpfq_2_251_print(mpfq_2_251_field_ptr, FILE *, mpfq_2_251_src_elt);

/* Implementations for inlines */
static inline
void mpfq_2_251_set(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s)
{
	memcpy(r, s, sizeof(mpfq_2_251_elt));
}

static inline
void mpfq_2_251_set_ui(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, unsigned long x)
{
	mpfq_2_251_set_uipoly(K, r, x & 1UL);
}

static inline
unsigned long mpfq_2_251_get_ui(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_src_elt r)
{
	return r[0] & 1UL;
}

static inline
void mpfq_2_251_set_uipoly(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, unsigned long x)
{
	memset(r, 0, sizeof(mpfq_2_251_elt));
	r[0] = x & 0x7ffffffUL;
}

static inline
void mpfq_2_251_set_uipoly_wide(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, const unsigned long * x, unsigned int n)
{
	unsigned int i;
	memset(r, 0, sizeof(mpfq_2_251_elt));
	for (i = 0 ; i < n && i < 8 ; i++)
		r[i] = x[i];
	r[7] &= 0x7ffffffUL;
}

static inline
unsigned long mpfq_2_251_get_uipoly(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_src_elt r)
{
	return r[0];
}

static inline
void mpfq_2_251_get_uipoly_wide(mpfq_2_251_field_ptr K UNUSED_VARIABLE, unsigned long * r, unsigned int n, mpfq_2_251_src_elt x)
{
	unsigned int i;
	for(i = 0 ; i < 8 && i < n; i++) r[i] = x[i];
	for(      ; i < n ; i++) r[i] = 0;
}

static inline
void mpfq_2_251_random(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r)
{
	mpn_random(r, 8);
	r[7] &= 0x7ffffffUL;
}

static inline
void mpfq_2_251_random2(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r)
{
	mpn_random2(r, 8);
	r[7] &= 0x7ffffffUL;
}

static inline
void mpfq_2_251_add(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	int i;
	for(i = 0 ; i < 8 ; i++)
		r[i] = s1[i] ^ s2[i];
}

static inline
void mpfq_2_251_mul(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	mpfq_2_251_elt_ur t;
	mpfq_2_251_mul_ur(K, t, s1, s2);
	mpfq_2_251_reduce(K, r, t);
}

static inline
void mpfq_2_251_sqr(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s)
{
	mpfq_2_251_elt_ur t;
	mpfq_2_251_sqr_ur(K, t, s);
	mpfq_2_251_reduce(K, r, t);
}

static inline
void mpfq_2_251_sqrt(mpfq_2_251_field_ptr K, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s)
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
	
	mpfq_2_251_elt sqrt_t ={ 0x6db6db39UL, 0xdb6db6dbUL, 0xb6db6db6UL, 0xadb6db6dUL, 0x6db6db6dUL, 0xdb6db6dbUL, 0xb6db6db6UL, 0x5b6db6dUL, }
	;
	
	mpfq_2_251_elt odd, even;
	mpfq_2_251_elt_ur odd_t;
	mp_limb_t t;
#define	EVEN_MASK	(((mp_limb_t)-1)/3UL)
#define	ODD_MASK	((EVEN_MASK)<<1)
	unsigned int i;
	for(i = 0 ; i < 8 ; i++) {
		even[i] = s[i] & EVEN_MASK;
	}
	for(i = 0 ; i < 4 ; i++) {
		t = even[2*i];   t |= t >> 7;
			  even[i]  = shuffle_table[t & 255];
		t >>= 16; even[i] |= shuffle_table[t & 255] << 8;
		t = even[2*i+1]; t |= t >> 7;
			  even[i] |= shuffle_table[t & 255] << 16;
		t >>= 16; even[i] |= shuffle_table[t & 255] << 24;
	}
	memset(even + 4, 0, 4 * sizeof(mp_limb_t));
	for(i = 0 ; i < 8 ; i++) {
		odd[i] = (s[i] & ODD_MASK) >> 1;
	}
	for(i = 0 ; i < 4 ; i++) {
		t = odd[2*i];   t |= t >> 7;
			  odd[i]  = shuffle_table[t & 255];
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 8;
		t = odd[2*i+1]; t |= t >> 7;
			  odd[i] |= shuffle_table[t & 255] << 16;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 24;
	}
	memset(odd + 4, 0, 4 * sizeof(mp_limb_t));
	mpfq_2_251_mul_ur(K, odd_t, odd, sqrt_t);
	for(i = 0 ; i < (8+1)/2 ; i++) {
		odd_t[i] ^= even[i];
	}
	/* mpfq_2_251_print(K, stdout, odd_t); */
	mpfq_2_251_reduce(K, r, odd_t);
	/* mpfq_2_251_print(K, stdout, r); */
	/* fprintf(stdout, "\n"); */
	/* fflush(stdout); */
}

static inline
void mpfq_2_251_add_ui(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s, unsigned long x)
{
	mpfq_2_251_set(K, r, s);
	r[0] ^= (x & 1UL);
}

static inline
void mpfq_2_251_mul_ui(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s, unsigned long x)
{
	if (x & 1UL) {
		mpfq_2_251_set(K, r, s);
	} else {
		memset(r, 0, sizeof(mpfq_2_251_elt));
	}
}

static inline
int mpfq_2_251_inv(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s)
{
	mp_limb_t a[8] = { 0x950UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x80000000UL, };
	mp_limb_t b[8];
	mp_limb_t u[8] = { 0, };
	mp_limb_t v[8] = { 1, 0, };
	mp_limb_t x;
	mp_size_t ia, ib;
	int i,d;
	
	if (mpfq_2_251_cmp_ui(K, s, 0UL) == 0)
	    return 0;
	{
		mp_limb_t z;
		z = s[0] <<  4;
		b[0] = z;
		z = s[0] >> 28 ^ s[1] <<  4;
		b[1] = z;
		z = s[1] >> 28 ^ s[2] <<  4;
		b[2] = z;
		z = s[2] >> 28 ^ s[3] <<  4;
		b[3] = z;
		z = s[3] >> 28 ^ s[4] <<  4;
		b[4] = z;
		z = s[4] >> 28 ^ s[5] <<  4;
		b[5] = z;
		z = s[5] >> 28 ^ s[6] <<  4;
		b[6] = z;
		z = s[6] >> 28 ^ s[7] <<  4;
		b[7] = z;
	}
	ib = clzlx(b, 8);
	ia = 0;
	
	mpfq_2_251_longshift_left(b,b,8,ib);
	
	for(d = ib - ia ; ; ) {
	        if (d == 0) {
	                for(i = 0 ; i < 8 ; i++) v[i] ^= u[i];
			b[0] ^= a[0]; x = b[0];
			b[1] ^= a[1]; x |= b[1];
			b[2] ^= a[2]; x |= b[2];
			b[3] ^= a[3]; x |= b[3];
			b[4] ^= a[4]; x |= b[4];
			b[5] ^= a[5]; x |= b[5];
			b[6] ^= a[6]; x |= b[6];
			b[7] ^= a[7]; x |= b[7];
	                if (!x) { memcpy(r,u,8 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(b,8);
	                ib += t;
	                d += t;
	                mpfq_2_251_longshift_left(b,b,8,t);
	        }
	        for(;d > 0;) {
	                mpfq_2_251_longaddshift_left(u,v,8,d);
			a[0] ^= b[0]; x = a[0];
			a[1] ^= b[1]; x |= a[1];
			a[2] ^= b[2]; x |= a[2];
			a[3] ^= b[3]; x |= a[3];
			a[4] ^= b[4]; x |= a[4];
			a[5] ^= b[5]; x |= a[5];
			a[6] ^= b[6]; x |= a[6];
			a[7] ^= b[7]; x |= a[7];
	                if (!x) { memcpy(r,v,8 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(a,8);
	                ia += t;
	                d -= t;
	                mpfq_2_251_longshift_left(a,a,8,t);
	        } 
	        if (d == 0) {
	                for(i = 0 ; i < 8 ; i++) u[i] ^= v[i];
			a[0] ^= b[0]; x = a[0];
			a[1] ^= b[1]; x |= a[1];
			a[2] ^= b[2]; x |= a[2];
			a[3] ^= b[3]; x |= a[3];
			a[4] ^= b[4]; x |= a[4];
			a[5] ^= b[5]; x |= a[5];
			a[6] ^= b[6]; x |= a[6];
			a[7] ^= b[7]; x |= a[7];
	                if (!x) { memcpy(r,v,8 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(a,8);
	                ia += t;
	                d -= t;
	                mpfq_2_251_longshift_left(a,a,8,t);
	        }
	        for(;d < 0;) {
	                mpfq_2_251_longaddshift_left(v,u,8,-d);
			b[0] ^= a[0]; x = b[0];
			b[1] ^= a[1]; x |= b[1];
			b[2] ^= a[2]; x |= b[2];
			b[3] ^= a[3]; x |= b[3];
			b[4] ^= a[4]; x |= b[4];
			b[5] ^= a[5]; x |= b[5];
			b[6] ^= a[6]; x |= b[6];
			b[7] ^= a[7]; x |= b[7];
	                if (!x) { memcpy(r,u,8 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(b,8);
	                ib += t;
	                d += t;
	                mpfq_2_251_longshift_left(b,b,8,t);
	        }
	}
}

static inline
void mpfq_2_251_longaddshift_left(unsigned long * dst, const unsigned long * src, int n, int s)
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
void mpfq_2_251_longshift_left(unsigned long * dst, const unsigned long * src, int n, int s)
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
void mpfq_2_251_as_solve(mpfq_2_251_field_ptr K, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s)
{
	static const mpfq_2_251_elt t[251] = {
		{ 0x6640aa5aUL, 0x259f299dUL, 0xf1bfcdeeUL, 0xb125487bUL, 0x9d455c09UL, 0x3dd84bf8UL, 0x5e348ed8UL, 0x38c82b9UL, },
		{ 0x83894700UL, 0x2ad8f181UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0x83894702UL, 0x2ad8f181UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0xcfd738baUL, 0x8a28f7f7UL, 0xa0ee14baUL, 0x2bef7664UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0x83894706UL, 0x2ad8f181UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0xba6aec0cUL, 0xead4a6f6UL, 0xb8c1f675UL, 0x433bb982UL, 0x64d11293UL, 0xc1fe13bcUL, 0xe09a5d6cUL, 0x7fbd0f5UL, },
		{ 0xcfd738b2UL, 0x8a28f7f7UL, 0xa0ee14baUL, 0x2bef7664UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0x36a14cbaUL, 0x9ed154b6UL, 0x50e4d48UL, 0xba03e1eeUL, 0x396d1cb5UL, 0xbf7d2d98UL, 0x89e8e858UL, 0x72a63e5UL, },
		{ 0x83894716UL, 0x2ad8f181UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0xc094de52UL, 0xd4f5f437UL, 0x37cdff7fUL, 0x13dad55fUL, 0x20bdcd63UL, 0x1a202a3fUL, 0x19df2be3UL, 0x789ee29UL, },
		{ 0xba6aec2cUL, 0xead4a6f6UL, 0xb8c1f675UL, 0x433bb982UL, 0x64d11293UL, 0xc1fe13bcUL, 0xe09a5d6cUL, 0x7fbd0f5UL, },
		{ 0xa7702648UL, 0x24c8b3f5UL, 0x9afe5f10UL, 0xb96e93efUL, 0x63cbc69UL, 0xe5fa4ff4UL, 0xd09901e5UL, 0xc34d5bUL, },
		{ 0xcfd738f2UL, 0x8a28f7f7UL, 0xa0ee14baUL, 0x2bef7664UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0x46571e7eUL, 0x257958a9UL, 0x58fc07fcUL, 0x508e2106UL, 0x5dee5ac4UL, 0xdb9dae5aUL, 0x623f43f4UL, 0x722a9aUL, },
		{ 0x36a14c3aUL, 0x9ed154b6UL, 0x50e4d48UL, 0xba03e1eeUL, 0x396d1cb5UL, 0xbf7d2d98UL, 0x89e8e858UL, 0x72a63e5UL, },
		{ 0x5bc35ca0UL, 0xa8972c8dUL, 0xc27ca3b0UL, 0x3ac93369UL, 0x65738215UL, 0xdf873a8aUL, 0x94c4f07aUL, 0xd5cd66UL, },
		{ 0x83894616UL, 0x2ad8f181UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0x96e5f4d2UL, 0x4b5ec7c7UL, 0x29464d6eUL, 0x3b7cd18cUL, 0xf4217a7dUL, 0x84563375UL, 0xa01c66b2UL, 0x7398b5cUL, },
		{ 0xc094dc52UL, 0xd4f5f437UL, 0x37cdff7fUL, 0x13dad55fUL, 0x20bdcd63UL, 0x1a202a3fUL, 0x19df2be3UL, 0x789ee29UL, },
		{ 0xda50ae48UL, 0x6748e5d4UL, 0x30600368UL, 0xbaf372c1UL, 0x318bb989UL, 0xe4aa06b7UL, 0xe6411d48UL, 0xc7276eUL, },
		{ 0xba6ae82cUL, 0xead4a6f6UL, 0xb8c1f675UL, 0x433bb982UL, 0x64d11293UL, 0xc1fe13bcUL, 0xe09a5d6cUL, 0x7fbd0f5UL, },
		{ 0x250d243aUL, 0x589dbb83UL, 0xdfaa46adUL, 0xaa934a27UL, 0x8389705dUL, 0x8974792cUL, 0xe305e15dUL, 0x74aa766UL, },
		{ 0xa7702e48UL, 0x24c8b3f5UL, 0x9afe5f10UL, 0xb96e93efUL, 0x63cbc69UL, 0xe5fa4ff4UL, 0xd09901e5UL, 0xc34d5bUL, },
		{ 0xe93adc20UL, 0x51d0c4a5UL, 0xafefbf1bUL, 0x38640fd5UL, 0x40d66523UL, 0xa86fbfffUL, 0x7e9240c6UL, 0xc25fadUL, },
		{ 0xcfd728f2UL, 0x8a28f7f7UL, 0xa0ee14baUL, 0x2bef7664UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0x6c7100f2UL, 0xdcc2ec53UL, 0x5c0df980UL, 0x13887590UL, 0xe1372b6UL, 0x1a30d83eUL, 0xb4632f71UL, 0x79b1072UL, },
		{ 0x46573e7eUL, 0x257958a9UL, 0x58fc07fcUL, 0x508e2106UL, 0x5dee5ac4UL, 0xdb9dae5aUL, 0x623f43f4UL, 0x722a9aUL, },
		{ 0x2dc6be8cUL, 0xaf7ed33fUL, 0xc8d77c14UL, 0x418f69cfUL, 0x644c4612UL, 0xc0f39573UL, 0x4d16ab5aUL, 0x7ec437fUL, },
		{ 0x36a10c3aUL, 0x9ed154b6UL, 0x50e4d48UL, 0xba03e1eeUL, 0x396d1cb5UL, 0xbf7d2d98UL, 0x89e8e858UL, 0x72a63e5UL, },
		{ 0xfa4e76d2UL, 0x2af0571cUL, 0x21ec18cdUL, 0x19f4835UL, 0x5fdae2f1UL, 0xf5dd35UL, 0xb86f91UL, 0x7fead32UL, },
		{ 0x5bc3dca0UL, 0xa8972c8dUL, 0xc27ca3b0UL, 0x3ac93369UL, 0x65738215UL, 0xdf873a8aUL, 0x94c4f07aUL, 0xd5cd66UL, },
		{ 0xd66a22f2UL, 0x3986e9bfUL, 0x1dfc3ae0UL, 0x1a2a473UL, 0xde13f72aUL, 0x40a6ae5fUL, 0x367f4f7cUL, 0x7ec472fUL, },
		{ 0x83884616UL, 0x2ad8f181UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0x311b5e20UL, 0x2c641517UL, 0xb071f53UL, 0x12007a61UL, 0xa86db02fUL, 0x41b2b419UL, 0xb67d8850UL, 0x65bc55UL, },
		{ 0x96e7f4d2UL, 0x4b5ec7c7UL, 0x29464d6eUL, 0x3b7cd18cUL, 0xf4217a7dUL, 0x84563375UL, 0xa01c66b2UL, 0x7398b5cUL, },
		{ 0xddafd652UL, 0xebe75f8bUL, 0xdac241UL, 0x1e74378UL, 0x9197897UL, 0x1bc1ed4cUL, 0x9965835eUL, 0x7feb861UL, },
		{ 0xc090dc52UL, 0xd4f5f437UL, 0x37cdff7fUL, 0x13dad55fUL, 0x20bdcd63UL, 0x1a202a3fUL, 0x19df2be3UL, 0x789ee29UL, },
		{ 0x60eaacbaUL, 0x55e1a39eUL, 0x108d192dUL, 0x914cf73dUL, 0x3667f093UL, 0xa03c5b83UL, 0x905971cbUL, 0x78c96ebUL, },
		{ 0xda58ae48UL, 0x6748e5d4UL, 0x30600368UL, 0xbaf372c1UL, 0x318bb989UL, 0xe4aa06b7UL, 0xe6411d48UL, 0xc7276eUL, },
		{ 0x7f8709aUL, 0xb9d4b540UL, 0xb7311161UL, 0x93839bdbUL, 0x65660130UL, 0xd7a22700UL, 0xe11c06adUL, 0x79b1037UL, },
		{ 0xba7ae82cUL, 0xead4a6f6UL, 0xb8c1f675UL, 0x433bb982UL, 0x64d11293UL, 0xc1fe13bcUL, 0xe09a5d6cUL, 0x7fbd0f5UL, },
		{ 0xb22e3aUL, 0x1c08510cUL, 0xa8fa923UL, 0xa87b2a56UL, 0x758180a9UL, 0x88441948UL, 0xb8035d60UL, 0x75d25aeUL, },
		{ 0x252d243aUL, 0x589dbb83UL, 0xdfaa46adUL, 0xaa934a27UL, 0x8389705dUL, 0x8974792cUL, 0xe305e15dUL, 0x74aa766UL, },
		{ 0x1321fe20UL, 0x7a182b95UL, 0xb792f08cUL, 0x14c5972UL, 0x5f5cdabfUL, 0x2d83117dUL, 0x5e1b3439UL, 0x102f0UL, },
		{ 0xa7302e48UL, 0x24c8b3f5UL, 0x9afe5f10UL, 0xb96e93efUL, 0x63cbc69UL, 0xe5fa4ff4UL, 0xd09901e5UL, 0xc34d5bUL, },
		{ 0xb333fcd2UL, 0x6a861909UL, 0xa9184542UL, 0x28151698UL, 0xc4c58aa5UL, 0x5b78836UL, 0x36787bb9UL, 0x75d31e9UL, },
		{ 0xe9badc20UL, 0x51d0c4a5UL, 0xafefbf1bUL, 0x38640fd5UL, 0x40d66523UL, 0xa86fbfffUL, 0x7e9240c6UL, 0xc25fadUL, },
		{ 0x73a3948cUL, 0x7ebfefdUL, 0xaaadd51UL, 0x7b465aa2UL, 0x1293116UL, 0x1f74aff8UL, 0xd9d25b30UL, 0x7398e19UL, },
		{ 0xced728f2UL, 0x8a28f7f7UL, 0xa0ee14baUL, 0x2bef7664UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0xe22dfa9aUL, 0x1df51ce3UL, 0xebc382c2UL, 0x92919a01UL, 0xae7511e4UL, 0x6162d217UL, 0x1dcc12b6UL, 0x79a0381UL, },
		{ 0x6e7100f2UL, 0xdcc2ec53UL, 0x5c0df980UL, 0x13887590UL, 0xe1372b6UL, 0x1a30d83eUL, 0xb4632f71UL, 0x79b1072UL, },
		{ 0x36a898c4UL, 0x7f399ac9UL, 0x898ffb7cUL, 0xd17d59ccUL, 0x5f0f87e3UL, 0x16838e24UL, 0xb7a2b421UL, 0x79e7ca6UL, },
		{ 0x42573e7eUL, 0x257958a9UL, 0x58fc07fcUL, 0x508e2106UL, 0x5dee5ac4UL, 0xdb9dae5aUL, 0x623f43f4UL, 0x722a9aUL, },
		{ 0xff022cbaUL, 0x72bce0d9UL, 0xaf1d76d4UL, 0xa87a9185UL, 0xdce63f73UL, 0xa5fbbf5cUL, 0xa6498e72UL, 0x74fcae2UL, },
		{ 0x25c6be8cUL, 0xaf7ed33fUL, 0xc8d77c14UL, 0x418f69cfUL, 0x644c4612UL, 0xc0f39573UL, 0x4d16ab5aUL, 0x7ec437fUL, },
		{ 0xc8eadeUL, 0xd1d68076UL, 0xdc55a06aUL, 0x52733b87UL, 0xfb7b1b89UL, 0xec7215bdUL, 0x65c089f4UL, 0x77460eUL, },
		{ 0x26a10c3aUL, 0x9ed154b6UL, 0x50e4d48UL, 0xba03e1eeUL, 0x396d1cb5UL, 0xbf7d2d98UL, 0x89e8e858UL, 0x72a63e5UL, },
		{ 0x3e51b48cUL, 0x6cb5a9b6UL, 0x81546666UL, 0x7a33ebaaUL, 0x72651f66UL, 0x72a496dcUL, 0xb10ceab4UL, 0x72a66e4UL, },
		{ 0xda4e76d2UL, 0x2af0571cUL, 0x21ec18cdUL, 0x19f4835UL, 0x5fdae2f1UL, 0xf5dd35UL, 0xb86f91UL, 0x7fead32UL, },
		{ 0x90b66ce4UL, 0xdd0d9f7eUL, 0xd0dbb9f9UL, 0xfa27d15eUL, 0x8d8f20a8UL, 0xe47b4d48UL, 0xfdf58e2bUL, 0x73888b9UL, },
		{ 0x1bc3dca0UL, 0xa8972c8dUL, 0xc27ca3b0UL, 0x3ac93369UL, 0x65738215UL, 0xdf873a8aUL, 0x94c4f07aUL, 0xd5cd66UL, },
		{ 0x4698f09aUL, 0xedeacde8UL, 0x597b09a8UL, 0xbb1c1950UL, 0xe3f88150UL, 0xd2eed843UL, 0x7a4eca56UL, 0x7399f4fUL, },
		{ 0x566a22f2UL, 0x3986e9bfUL, 0x1dfc3ae0UL, 0x1a2a473UL, 0xde13f72aUL, 0x40a6ae5fUL, 0x367f4f7cUL, 0x7ec472fUL, },
		{ 0x75bdd4a0UL, 0xe0fc5101UL, 0x182fe2cfUL, 0x28d4cfe6UL, 0x2bedb08dUL, 0x33b9184aUL, 0x71359fe6UL, 0xb07062UL, },
		{ 0x83884616UL, 0x2ad8f180UL, 0x2aec50f9UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0xa23aa072UL, 0xff9ceeeaUL, 0xdf23f768UL, 0x3b379ce1UL, 0x49524a90UL, 0xb2a3d47cUL, 0x4a7b35afUL, 0x72b7446UL, },
		{ 0x311b5e20UL, 0x2c641515UL, 0xb071f53UL, 0x12007a61UL, 0xa86db02fUL, 0x41b2b419UL, 0xb67d8850UL, 0x65bc55UL, },
		{ 0xa66f5652UL, 0xfea36e67UL, 0x66621c19UL, 0xf39f0eUL, 0x91f11f7UL, 0x1bcf4718UL, 0x34f7582dUL, 0x7ffabc3UL, },
		{ 0x96e7f4d2UL, 0x4b5ec7c3UL, 0x29464d6eUL, 0x3b7cd18cUL, 0xf4217a7dUL, 0x84563375UL, 0xa01c66b2UL, 0x7398b5cUL, },
		{ 0x38718ebaUL, 0x739499f1UL, 0x9fdacd80UL, 0x9295af3dUL, 0x7b8b30fUL, 0x4cd28f95UL, 0x18cfb7e7UL, 0x79a0391UL, },
		{ 0xddafd652UL, 0xebe75f83UL, 0xdac241UL, 0x1e74378UL, 0x9197897UL, 0x1bc1ed4cUL, 0x9965835eUL, 0x7feb861UL, },
		{ 0x3624cce4UL, 0x78b64ff4UL, 0xa39132caUL, 0xc19077a6UL, 0xf3c26ab8UL, 0x3bb1116aUL, 0x5fdb27a9UL, 0x7ec422aUL, },
		{ 0xc090dc52UL, 0xd4f5f427UL, 0x37cdff7fUL, 0x13dad55fUL, 0x20bdcd63UL, 0x1a202a3fUL, 0x19df2be3UL, 0x789ee29UL, },
		{ 0x6e77043aUL, 0x86be9467UL, 0xb4eb0a57UL, 0xaacd13d8UL, 0xa12072adUL, 0x52378bf5UL, 0x41cfd06aUL, 0x74ab620UL, },
		{ 0x60eaacbaUL, 0x55e1a3beUL, 0x108d192dUL, 0x914cf73dUL, 0x3667f093UL, 0xa03c5b83UL, 0x905971cbUL, 0x78c96ebUL, },
		{ 0xd2642deUL, 0x8ea13245UL, 0xc85f4a22UL, 0x5195b3a6UL, 0x14b1b5c1UL, 0x6d67cef7UL, 0x85cfc0bdUL, 0x61d620UL, },
		{ 0xda58ae48UL, 0x6748e594UL, 0x30600368UL, 0xbaf372c1UL, 0x318bb989UL, 0xe4aa06b7UL, 0xe6411d48UL, 0xc7276eUL, },
		{ 0x6bf76ee4UL, 0x768a0aa0UL, 0x2218a6ceUL, 0xfa05d8f3UL, 0x2a2fdfc4UL, 0xd2d51c3aUL, 0xd7b5f294UL, 0x7388cbcUL, },
		{ 0x7f8709aUL, 0xb9d4b5c0UL, 0xb7311161UL, 0x93839bdbUL, 0x65660130UL, 0xd7a22700UL, 0xe11c06adUL, 0x79b1037UL, },
		{ 0xfcb4a4c8UL, 0xa65eed5bUL, 0x1156598eUL, 0xba8b798dUL, 0x2748250bUL, 0xff9e36ceUL, 0x7f9cf186UL, 0xc7323dUL, },
		{ 0xba7ae82cUL, 0xead4a7f6UL, 0xb8c1f675UL, 0x433bb982UL, 0x64d11293UL, 0xc1fe13bcUL, 0xe09a5d6cUL, 0x7fbd0f5UL, },
		{ 0xb2dcc02cUL, 0x94410b74UL, 0xe66f10ceUL, 0x4266c10fUL, 0xfb6f0a3bUL, 0x2c7b4a80UL, 0xf32fbf2fUL, 0x7e83c49UL, },
		{ 0xb22e3aUL, 0x1c08530cUL, 0xa8fa923UL, 0xa87b2a56UL, 0x758180a9UL, 0x88441948UL, 0xb8035d60UL, 0x75d25aeUL, },
		{ 0xc9d9c8deUL, 0x85bfdcd0UL, 0x5dbe24feUL, 0x6b633d63UL, 0xfbf8d555UL, 0x47318abUL, 0x6dc3ffe0UL, 0xb41e12UL, },
		{ 0x252d243aUL, 0x589dbf83UL, 0xdfaa46adUL, 0xaa934a27UL, 0x8389705dUL, 0x8974792cUL, 0xe305e15dUL, 0x74aa766UL, },
		{ 0x15ecee64UL, 0xb089a881UL, 0x7c994fdeUL, 0xfb0852e0UL, 0xfd53b652UL, 0xc9810534UL, 0x23b6becaUL, 0x72b7112UL, },
		{ 0x1321fe20UL, 0x7a182395UL, 0xb792f08cUL, 0x14c5972UL, 0x5f5cdabfUL, 0x2d83117dUL, 0x5e1b3439UL, 0x102f0UL, },
		{ 0x6253501aUL, 0xb8a9922eUL, 0x35d0f7aUL, 0xb8f184d7UL, 0x488c4776UL, 0x13d61a34UL, 0xc1746e37UL, 0x73de069UL, },
		{ 0xa7302e48UL, 0x24c8a3f5UL, 0x9afe5f10UL, 0xb96e93efUL, 0x63cbc69UL, 0xe5fa4ff4UL, 0xd09901e5UL, 0xc34d5bUL, },
		{ 0xbb284664UL, 0x16d0189UL, 0xf91b912UL, 0xd10e93c5UL, 0x7680e45aUL, 0xfb4cd8d3UL, 0x7f557166UL, 0x79e69b0UL, },
		{ 0xb333fcd2UL, 0x6a863909UL, 0xa9184542UL, 0x28151698UL, 0xc4c58aa5UL, 0x5b78836UL, 0x36787bb9UL, 0x75d31e9UL, },
		{ 0x626b9ac4UL, 0xcbff507aUL, 0x7f3f2063UL, 0xd136159bUL, 0xcff69c4fUL, 0x20762a9dUL, 0x5dc4e278UL, 0x78c83bcUL, },
		{ 0xe9badc20UL, 0x51d084a5UL, 0xafefbf1bUL, 0x38640fd5UL, 0x40d66523UL, 0xa86fbfffUL, 0x7e9240c6UL, 0xc25fadUL, },
		{ 0x2781a36UL, 0xf0320e85UL, 0xacf9c215UL, 0xd0dfa2daUL, 0xb196c59UL, 0xe0fcf88cUL, 0x9088ef5eUL, 0x723b89UL, },
		{ 0x73a3948cUL, 0x7eb7efdUL, 0xaaadd51UL, 0x7b465aa2UL, 0x1293116UL, 0x1f74aff8UL, 0xd9d25b30UL, 0x7398e19UL, },
		{ 0x3b759cfeUL, 0x66f90e8cUL, 0x72625b94UL, 0x5313c028UL, 0x6a595f0eUL, 0x9acde719UL, 0x54e75f59UL, 0x7640afUL, },
		{ 0xced728f2UL, 0x8a29f7f7UL, 0xa0ee14baUL, 0x2bef7664UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0x445d781aUL, 0x3015cfcfUL, 0x3544908dUL, 0x91084e10UL, 0x300f9b5eUL, 0x4d82c6d6UL, 0x2e17ab4fUL, 0x79e69a4UL, },
		{ 0xe22dfa9aUL, 0x1df71ce3UL, 0xebc382c2UL, 0x92919a01UL, 0xae7511e4UL, 0x6162d217UL, 0x1dcc12b6UL, 0x79a0381UL, },
		{ 0x18a90c3aUL, 0xe8b26532UL, 0x7dbfad59UL, 0x8091059bUL, 0x3e707535UL, 0xbbb61e48UL, 0xa4af5f06UL, 0x7ed5099UL, },
		{ 0x6e7100f2UL, 0xdcc6ec53UL, 0x5c0df980UL, 0x13887590UL, 0xe1372b6UL, 0x1a30d83eUL, 0xb4632f71UL, 0x79b1072UL, },
		{ 0x7cf01a44UL, 0x4567607aUL, 0x13da3552UL, 0xf9e6ee5aUL, 0x1b1df3d9UL, 0x3e7f2cf0UL, 0x29f3d98aUL, 0x73cf3ceUL, },
		{ 0x36a898c4UL, 0x7f319ac9UL, 0x898ffb7cUL, 0xd17d59ccUL, 0x5f0f87e3UL, 0x16838e24UL, 0xb7a2b421UL, 0x79e7ca6UL, },
		{ 0x79e72a72UL, 0x1e257c4dUL, 0x5b25a400UL, 0x287ae2b9UL, 0xb46833c4UL, 0x684a82bdUL, 0xb34c8b31UL, 0x74fcae2UL, },
		{ 0x42573e7eUL, 0x256958a9UL, 0x58fc07fcUL, 0x508e2106UL, 0x5dee5ac4UL, 0xdb9dae5aUL, 0x623f43f4UL, 0x722a9aUL, },
		{ 0x87e1a0f2UL, 0xd0b46cfdUL, 0x1bd6b256UL, 0x297df6c3UL, 0xcd053a66UL, 0x733d74caUL, 0x730f804UL, 0x75c3708UL, },
		{ 0xff022cbaUL, 0x729ce0d9UL, 0xaf1d76d4UL, 0xa87a9185UL, 0xdce63f73UL, 0xa5fbbf5cUL, 0xa6498e72UL, 0x74fcae2UL, },
		{ 0x16ad09aUL, 0x7deee72UL, 0xb7e85249UL, 0xb99be672UL, 0xecff1b20UL, 0x6549ca5aUL, 0xb03993f4UL, 0x73ce68cUL, },
		{ 0x25c6be8cUL, 0xaf3ed33fUL, 0xc8d77c14UL, 0x418f69cfUL, 0x644c4612UL, 0xc0f39573UL, 0x4d16ab5aUL, 0x7ec437fUL, },
		{ 0x1b023a36UL, 0x49d6d7b0UL, 0xa4a11445UL, 0xfbeb629aUL, 0x6e17d9a9UL, 0x52414bdbUL, 0x41b4f2ceUL, 0xd4dbd1UL, },
		{ 0xc8eadeUL, 0xd1568076UL, 0xdc55a06aUL, 0x52733b87UL, 0xfb7b1b89UL, 0xec7215bdUL, 0x65c089f4UL, 0x77460eUL, },
		{ 0x38edb2c4UL, 0xb1067d23UL, 0xa91767f2UL, 0xea917cd7UL, 0x7da873e7UL, 0xa4d3a5aaUL, 0xe6109e5cUL, 0x74aa762UL, },
		{ 0x26a10c3aUL, 0x9fd154b6UL, 0x50e4d48UL, 0xba03e1eeUL, 0x396d1cb5UL, 0xbf7d2d98UL, 0x89e8e858UL, 0x72a63e5UL, },
		{ 0x4a9202f2UL, 0xbca6c486UL, 0x81422e38UL, 0x38f040e0UL, 0x88a0c21aUL, 0xf3c0bb72UL, 0x916478baUL, 0x73de068UL, },
		{ 0x3e51b48cUL, 0x6eb5a9b6UL, 0x81546666UL, 0x7a33ebaaUL, 0x72651f66UL, 0x72a496dcUL, 0xb10ceab4UL, 0x72a66e4UL, },
		{ 0xe9698c48UL, 0x701dfefUL, 0xe0cdbe8cUL, 0x9184d6d4UL, 0x37624855UL, 0xd57bd52UL, 0x837ec718UL, 0x61d721UL, },
		{ 0xda4e76d2UL, 0x2ef0571cUL, 0x21ec18cdUL, 0x19f4835UL, 0x5fdae2f1UL, 0xf5dd35UL, 0xb86f91UL, 0x7fead32UL, },
		{ 0xda53c8deUL, 0xc8cf679eUL, 0xd4cc1367UL, 0x428bb0c6UL, 0x15479415UL, 0x1261637UL, 0xdb1aada0UL, 0x57993UL, },
		{ 0x90b66ce4UL, 0xd50d9f7eUL, 0xd0dbb9f9UL, 0xfa27d15eUL, 0x8d8f20a8UL, 0xe47b4d48UL, 0xfdf58e2bUL, 0x73888b9UL, },
		{ 0x81d7f620UL, 0x16c3c741UL, 0x5cafe878UL, 0x10085813UL, 0x37a1bba7UL, 0xad581893UL, 0x6583aa64UL, 0x726ba4UL, },
		{ 0x1bc3dca0UL, 0xb8972c8dUL, 0xc27ca3b0UL, 0x3ac93369UL, 0x65738215UL, 0xdf873a8aUL, 0x94c4f07aUL, 0xd5cd66UL, },
		{ 0xe454c02cUL, 0xf65acdc5UL, 0x2a707ee4UL, 0x6b454373UL, 0xbc23bdbbUL, 0x45b71f04UL, 0xf674087eUL, 0x7590ab5UL, },
		{ 0x4698f09aUL, 0xcdeacde8UL, 0x597b09a8UL, 0xbb1c1950UL, 0xe3f88150UL, 0xd2eed843UL, 0x7a4eca56UL, 0x7399f4fUL, },
		{ 0xb98eda1aUL, 0xe3fbbdabUL, 0xc51bd792UL, 0xa889eb07UL, 0x7c93fe22UL, 0xcb89a021UL, 0x395068c9UL, 0x74f9edeUL, },
		{ 0x566a22f2UL, 0x7986e9bfUL, 0x1dfc3ae0UL, 0x1a2a473UL, 0xde13f72aUL, 0x40a6ae5fUL, 0x367f4f7cUL, 0x7ec472fUL, },
		{ 0xdc2a4616UL, 0xcf4b8f6bUL, 0x497e3b9bUL, 0xd21ef1f9UL, 0xf9944e9aUL, 0xfc265844UL, 0xbeaed3b4UL, 0x77524cUL, },
		{ 0x75bdd4a0UL, 0x60fc5101UL, 0x182fe2cfUL, 0x28d4cfe6UL, 0x2bedb08dUL, 0x33b9184aUL, 0x71359fe6UL, 0xb07062UL, },
		{ 0xf9767420UL, 0x14f9a341UL, 0xa5e059f2UL, 0x11ec978aUL, 0x7651beabUL, 0x4d3a266eUL, 0x18472ad2UL, 0x61c372UL, },
		{ 0x83884616UL, 0x2ad8f180UL, 0x2aec50f8UL, 0xc10dfb57UL, 0x323d615aUL, 0x96e41fedUL, 0xe1025c5dUL, 0x13fdaeUL, },
		{ 0x67e4f89aUL, 0xf03d47c2UL, 0xad33a06fUL, 0xaab446b0UL, 0x26817108UL, 0xffda65cbUL, 0xc9462a06UL, 0x74aa372UL, },
		{ 0xa23aa072UL, 0xff9ceeeaUL, 0xdf23f76aUL, 0x3b379ce1UL, 0x49524a90UL, 0xb2a3d47cUL, 0x4a7b35afUL, 0x72b7446UL, },
		{ 0x7a70b8c4UL, 0x7dd333e6UL, 0x37b30423UL, 0xc0f354dfUL, 0x1e1ca9d3UL, 0xfbc0f11bUL, 0x3fbd9988UL, 0x7ed448eUL, },
		{ 0x311b5e20UL, 0x2c641515UL, 0xb071f57UL, 0x12007a61UL, 0xa86db02fUL, 0x41b2b419UL, 0xb67d8850UL, 0x65bc55UL, },
		{ 0xb0062872UL, 0xa049bd6bUL, 0x41a4b2a6UL, 0x22803cbUL, 0xa6e5fda8UL, 0x5a8140bcUL, 0x2008a65UL, 0x7e82c0fUL, },
		{ 0xa66f5652UL, 0xfea36e67UL, 0x66621c11UL, 0xf39f0eUL, 0x91f11f7UL, 0x1bcf4718UL, 0x34f7582dUL, 0x7ffabc3UL, },
		{ 0x5030682cUL, 0x4b7cc25bUL, 0x18d9fd22UL, 0x788a1635UL, 0xaf3af6b3UL, 0x1e2c6e3eUL, 0x19e9ff27UL, 0x73df53fUL, },
		{ 0x96e7f4d2UL, 0x4b5ec7c3UL, 0x29464d7eUL, 0x3b7cd18cUL, 0xf4217a7dUL, 0x84563375UL, 0xa01c66b2UL, 0x7398b5cUL, },
		{ 0xf34ebefeUL, 0x8afbd744UL, 0xf949993fUL, 0x50aa20e3UL, 0x4ffad192UL, 0xad2bc838UL, 0x13233497UL, 0x60c1c6UL, },
		{ 0x38718ebaUL, 0x739499f1UL, 0x9fdacda0UL, 0x9295af3dUL, 0x7b8b30fUL, 0x4cd28f95UL, 0x18cfb7e7UL, 0x79a0391UL, },
		{ 0x97051e7eUL, 0xf756aa5bUL, 0xdd811357UL, 0x7ace5405UL, 0x11a421b4UL, 0x4f6d56cUL, 0xdbcded05UL, 0xc7223eUL, },
		{ 0xddafd652UL, 0xebe75f83UL, 0xdac201UL, 0x1e74378UL, 0x9197897UL, 0x1bc1ed4cUL, 0x9965835eUL, 0x7feb861UL, },
		{ 0xe08604c8UL, 0x994d46f7UL, 0x2641e49aUL, 0xa8b6efabUL, 0x4eeca61bUL, 0xfe7ff1bdUL, 0xff26593aUL, 0xb06475UL, },
		{ 0x3624cce4UL, 0x78b64ff4UL, 0xa391324aUL, 0xc19077a6UL, 0xf3c26ab8UL, 0x3bb1116aUL, 0x5fdb27a9UL, 0x7ec422aUL, },
		{ 0x9f902e48UL, 0x5f4ff2d6UL, 0x78cc8ca0UL, 0xa9bb65b9UL, 0xd9917969UL, 0xe52be8e3UL, 0xb251565UL, 0xa399dbUL, },
		{ 0xc090dc52UL, 0xd4f5f427UL, 0x37cdfe7fUL, 0x13dad55fUL, 0x20bdcd63UL, 0x1a202a3fUL, 0x19df2be3UL, 0x789ee29UL, },
		{ 0xfdd17ca0UL, 0x8e140b7cUL, 0xa5c3f7d5UL, 0x2d0e72aUL, 0xf6f3e05UL, 0xda0a90caUL, 0x79962f32UL, 0x568c4UL, },
		{ 0x6e77043aUL, 0x86be9467UL, 0xb4eb0857UL, 0xaacd13d8UL, 0xa12072adUL, 0x52378bf5UL, 0x41cfd06aUL, 0x74ab620UL, },
		{ 0xbdc0968cUL, 0xcbb72032UL, 0x482d911fUL, 0x419760d8UL, 0x94ab13baUL, 0x2d70ee8dUL, 0x5d23bc1UL, 0x7fead72UL, },
		{ 0x60eaacbaUL, 0x55e1a3beUL, 0x108d1d2dUL, 0x914cf73dUL, 0x3667f093UL, 0xa03c5b83UL, 0x905971cbUL, 0x78c96ebUL, },
		{ 0x82e0485eUL, 0xca59abe8UL, 0xa031d8fbUL, 0x7925f0a0UL, 0x943fe103UL, 0xa86666b8UL, 0x3eaa56fdUL, 0xd1b241UL, },
		{ 0xd2642deUL, 0x8ea13245UL, 0xc85f4222UL, 0x5195b3a6UL, 0x14b1b5c1UL, 0x6d67cef7UL, 0x85cfc0bdUL, 0x61d620UL, },
		{ 0x132c2872UL, 0xf6a3ad7aUL, 0xdb2b350fUL, 0x2aebbbfbUL, 0x27c841e8UL, 0x5ffff9f0UL, 0x7493dc36UL, 0x7585d78UL, },
		{ 0xda58ae48UL, 0x6748e594UL, 0x30601368UL, 0xbaf372c1UL, 0x318bb989UL, 0xe4aa06b7UL, 0xe6411d48UL, 0xc7276eUL, },
		{ 0xf8451044UL, 0x59e85f01UL, 0x90264515UL, 0xd3c5a500UL, 0xd882d36dUL, 0x3a0b6076UL, 0x1f46a217UL, 0x789ef7cUL, },
		{ 0x6bf76ee4UL, 0x768a0aa0UL, 0x221886ceUL, 0xfa05d8f3UL, 0x2a2fdfc4UL, 0xd2d51c3aUL, 0xd7b5f294UL, 0x7388cbcUL, },
		{ 0x928816feUL, 0xfc7f1682UL, 0x9a884dcdUL, 0x7bef7d89UL, 0xe5f7a15aUL, 0x449e3958UL, 0x40f353cbUL, 0xd4dbc1UL, },
		{ 0x7f8709aUL, 0xb9d4b5c0UL, 0xb7315161UL, 0x93839bdbUL, 0x65660130UL, 0xd7a22700UL, 0xe11c06adUL, 0x79b1037UL, },
		{ 0xac47f4d2UL, 0xa248e0fUL, 0xa1b4cbffUL, 0x12f78f71UL, 0x42b9937dUL, 0x81146662UL, 0x96dc713aUL, 0x79a1786UL, },
		{ 0xfcb4a4c8UL, 0xa65eed5bUL, 0x1156d98eUL, 0xba8b798dUL, 0x2748250bUL, 0xff9e36ceUL, 0x7f9cf186UL, 0xc7323dUL, },
		{ 0xc8d0b8b6UL, 0xa0601bdcUL, 0x4aa4fa7eUL, 0xc2bab0a8UL, 0x4b0238d3UL, 0xcc908264UL, 0xe3bab9a8UL, 0x57c93UL, },
		{ 0xba7ae82cUL, 0xead4a7f6UL, 0xb8c0f675UL, 0x433bb982UL, 0x64d11293UL, 0xc1fe13bcUL, 0xe09a5d6cUL, 0x7fbd0f5UL, },
		{ 0x528dfa9aUL, 0xc97d5c16UL, 0x681463deUL, 0xa94b4c03UL, 0x2335ace4UL, 0xd343736aUL, 0x7ac731d3UL, 0x75c321dUL, },
		{ 0xb2dcc02cUL, 0x94410b74UL, 0xe66d10ceUL, 0x4266c10fUL, 0xfb6f0a3bUL, 0x2c7b4a80UL, 0xf32fbf2fUL, 0x7e83c49UL, },
		{ 0x9ad7a6c8UL, 0x427d86b2UL, 0xf19e1c41UL, 0xb960388eUL, 0x6c57cfa7UL, 0xc868fd43UL, 0x95e59ecfUL, 0xc34d0fUL, },
		{ 0xb22e3aUL, 0x1c08530cUL, 0xa8ba923UL, 0xa87b2a56UL, 0x758180a9UL, 0x88441948UL, 0xb8035d60UL, 0x75d25aeUL, },
		{ 0x9490521aUL, 0xcdb8196aUL, 0x1d159d32UL, 0x92c2dc93UL, 0x788320daUL, 0xfa1575b8UL, 0xbf6b8570UL, 0x79a1296UL, },
		{ 0xc9d9c8deUL, 0x85bfdcd0UL, 0x5db624feUL, 0x6b633d63UL, 0xfbf8d555UL, 0x47318abUL, 0x6dc3ffe0UL, 0xb41e12UL, },
		{ 0xd558a72UL, 0xe719df76UL, 0x8b622118UL, 0x8ffdccUL, 0x8ae2aed4UL, 0xdb938f1dUL, 0xb97954a4UL, 0x7ffbe80UL, },
		{ 0x252d243aUL, 0x589dbf83UL, 0xdfba46adUL, 0xaa934a27UL, 0x8389705dUL, 0x8974792cUL, 0xe305e15dUL, 0x74aa766UL, },
		{ 0xc8b31836UL, 0x75d0bd20UL, 0x79594b5aUL, 0xc38f582bUL, 0xf0d30e75UL, 0xd7984582UL, 0x3a37a619UL, 0x16847cUL, },
		{ 0x15ecee64UL, 0xb089a881UL, 0x7cb94fdeUL, 0xfb0852e0UL, 0xfd53b652UL, 0xc9810534UL, 0x23b6becaUL, 0x72b7112UL, },
		{ 0xb94be696UL, 0x40c34c90UL, 0x4a673b20UL, 0xc06bed68UL, 0xc3befcUL, 0x3b25ef1fUL, 0x846740c9UL, 0x12fb1bUL, },
		{ 0x1321fe20UL, 0x7a182395UL, 0xb7d2f08cUL, 0x14c5972UL, 0x5f5cdabfUL, 0x2d83117dUL, 0x5e1b3439UL, 0x102f0UL, },
		{ 0x5129701aUL, 0xc16f3eb8UL, 0xb3169d3cUL, 0x93f7d26fUL, 0x3b293686UL, 0x7a7a91a3UL, 0x69fd1f31UL, 0x79b0534UL, },
		{ 0x6253501aUL, 0xb8a9922eUL, 0x3dd0f7aUL, 0xb8f184d7UL, 0x488c4776UL, 0x13d61a34UL, 0xc1746e37UL, 0x73de069UL, },
		{ 0xe2bc10b6UL, 0xc16c99dcUL, 0x9a5d4adfUL, 0xf97798fdUL, 0x4de38a5bUL, 0x48788f59UL, 0x985983cfUL, 0xd1a357UL, },
		{ 0xa7302e48UL, 0x24c8a3f5UL, 0x9bfe5f10UL, 0xb96e93efUL, 0x63cbc69UL, 0xe5fa4ff4UL, 0xd09901e5UL, 0xc34d5bUL, },
		{ 0xffa4b0c4UL, 0x18197eb4UL, 0x2b4ee475UL, 0xeaefc98fUL, 0x6ee9090bUL, 0x924e2990UL, 0x61856935UL, 0x7585d68UL, },
		{ 0xbb284664UL, 0x16d0189UL, 0xd91b912UL, 0xd10e93c5UL, 0x7680e45aUL, 0xfb4cd8d3UL, 0x7f557166UL, 0x79e69b0UL, },
		{ 0x1cd4ece4UL, 0x91bbed57UL, 0x3b0a4798UL, 0xd2d21395UL, 0x8d25ae08UL, 0xe177b2f7UL, 0xa69115d2UL, 0x788fcdbUL, },
		{ 0xb333fcd2UL, 0x6a863909UL, 0xad184542UL, 0x28151698UL, 0xc4c58aa5UL, 0x5b78836UL, 0x36787bb9UL, 0x75d31e9UL, },
		{ 0xba0509aUL, 0xdfacf934UL, 0x18434ebfUL, 0xb9c23bbdUL, 0x4fe5d900UL, 0xbe1feec2UL, 0x9ffafd5UL, 0x72e1892UL, },
		{ 0x626b9ac4UL, 0xcbff507aUL, 0x773f2063UL, 0xd136159bUL, 0xcff69c4fUL, 0x20762a9dUL, 0x5dc4e278UL, 0x78c83bcUL, },
		{ 0xf475422cUL, 0x14e7b2d8UL, 0x31d54c3bUL, 0x781b2751UL, 0xf67ce6b7UL, 0x73476bb5UL, 0x47a90a8aUL, 0x72f5a59UL, },
		{ 0xe9badc20UL, 0x51d084a5UL, 0xbfefbf1bUL, 0x38640fd5UL, 0x40d66523UL, 0xa86fbfffUL, 0x7e9240c6UL, 0xc25fadUL, },
		{ 0xa9b038b6UL, 0x639ee62eUL, 0xabeba3c1UL, 0xfb103f81UL, 0xdcfc48b3UL, 0x12dfbffcUL, 0xdb925535UL, 0xd48fadUL, },
		{ 0x2781a36UL, 0xf0320e85UL, 0x8cf9c215UL, 0xd0dfa2daUL, 0xb196c59UL, 0xe0fcf88cUL, 0x9088ef5eUL, 0x723b89UL, },
		{ 0x3ee8485eUL, 0xc7d57f6bUL, 0xf6a64291UL, 0x504c1195UL, 0xba044483UL, 0xc0360a77UL, 0xd5c2a400UL, 0x727ba6UL, },
		{ 0x73a3948cUL, 0x7eb7efdUL, 0x4aaadd51UL, 0x7b465aa2UL, 0x1293116UL, 0x1f74aff8UL, 0xd9d25b30UL, 0x7398e19UL, },
		{ 0x428d622cUL, 0x67b4b902UL, 0x5902e1afUL, 0x7b581aebUL, 0x47d37787UL, 0x72eff5a6UL, 0xda4bc171UL, 0x7398f4dUL, },
		{ 0x3b759cfeUL, 0x66f90e8cUL, 0xf2625b94UL, 0x5313c028UL, 0x6a595f0eUL, 0x9acde719UL, 0x54e75f59UL, 0x7640afUL, },
		{ 0xa2377620UL, 0xe572d527UL, 0xf1148607UL, 0x28c4ee1cUL, 0x107b11c7UL, 0x73bf500cUL, 0x3c9b5b2dUL, 0xa29e2fUL, },
		{ 0xced728f2UL, 0x8a29f7f7UL, 0xa0ee14baUL, 0x2bef7665UL, 0x4f3ca21eUL, 0xf2470bf6UL, 0x91afc28aUL, 0x74ba097UL, },
		{ 0x25f0448UL, 0x4e67f0b0UL, 0x9f804500UL, 0x937e1575UL, 0x2a66c2dUL, 0x8c406200UL, 0x8edc011eUL, 0x7654edUL, },
		{ 0x445d781aUL, 0x3015cfcfUL, 0x3544908dUL, 0x91084e12UL, 0x300f9b5eUL, 0x4d82c6d6UL, 0x2e17ab4fUL, 0x79e69a4UL, },
		{ 0x866430c4UL, 0xb7ea8a1dUL, 0x37e7733aUL, 0xd10ecdcfUL, 0x27f98c6bUL, 0x4d9547c7UL, 0x6e017138UL, 0x79e69b0UL, },
		{ 0xe22dfa9aUL, 0x1df71ce3UL, 0xebc382c2UL, 0x92919a05UL, 0xae7511e4UL, 0x6162d217UL, 0x1dcc12b6UL, 0x79a0381UL, },
		{ 0xd2a786baUL, 0x944debddUL, 0x5d7da848UL, 0xbb6951edUL, 0x56e4e117UL, 0x7f365853UL, 0xf2aec10bUL, 0x7398a4dUL, },
		{ 0x18a90c3aUL, 0xe8b26532UL, 0x7dbfad59UL, 0x80910593UL, 0x3e707535UL, 0xbbb61e48UL, 0xa4af5f06UL, 0x7ed5099UL, },
		{ 0x47fb9844UL, 0x81c72c00UL, 0x112ffa25UL, 0xe85cf370UL, 0xd736c95UL, 0x83c6dffUL, 0x985e431eUL, 0x74fcef7UL, },
		{ 0x6e7100f2UL, 0xdcc6ec53UL, 0x5c0df980UL, 0x13887580UL, 0xe1372b6UL, 0x1a30d83eUL, 0xb4632f71UL, 0x79b1072UL, },
		{ 0x85558a00UL, 0xf56a09a2UL, 0xc0d3e459UL, 0x384a1affUL, 0x3df516d4UL, 0xdef49610UL, 0x54bade6cUL, 0xc25bf8UL, },
		{ 0x7cf01a44UL, 0x4567607aUL, 0x13da3552UL, 0xf9e6ee7aUL, 0x1b1df3d9UL, 0x3e7f2cf0UL, 0x29f3d98aUL, 0x73cf3ceUL, },
		{ 0x44c39ab6UL, 0xc27a8825UL, 0x97f56c82UL, 0xe9c4835fUL, 0x172300cfUL, 0x256197deUL, 0xc6ba2c76UL, 0xa38c9dUL, },
		{ 0x36a898c4UL, 0x7f319ac9UL, 0x898ffb7cUL, 0xd17d598cUL, 0x5f0f87e3UL, 0x16838e24UL, 0xb7a2b421UL, 0x79e7ca6UL, },
		{ 0xc9532c3aUL, 0xaedf1da8UL, 0x8e98a11fUL, 0xb9f2f946UL, 0xff988ec5UL, 0xd3c814e6UL, 0x615bc954UL, 0x72e1d93UL, },
		{ 0x79e72a72UL, 0x1e257c4dUL, 0x5b25a400UL, 0x287ae239UL, 0xb46833c4UL, 0x684a82bdUL, 0xb34c8b31UL, 0x74fcae2UL, },
		{ 0x16fe90c4UL, 0xd855e82fUL, 0x1b50efb5UL, 0xd0254b31UL, 0x6365f7fbUL, 0x206f02d2UL, 0xb04171d1UL, 0x78d900bUL, },
		{ 0x42573e7eUL, 0x256958a9UL, 0x58fc07fcUL, 0x508e2006UL, 0x5dee5ac4UL, 0xdb9dae5aUL, 0x623f43f4UL, 0x722a9aUL, },
		{ 0x1efe24c8UL, 0x6aa3bce8UL, 0xbb815e18UL, 0xbb9acc58UL, 0x327e592bUL, 0x24f83fb4UL, 0xc65fdc43UL, 0xc6218eUL, },
		{ 0x87e1a0f2UL, 0xd0b46cfdUL, 0x1bd6b256UL, 0x297df4c3UL, 0xcd053a66UL, 0x733d74caUL, 0x730f804UL, 0x75c3708UL, },
		{ 0xb1f6c05eUL, 0x41adea7dUL, 0x6ebd55d1UL, 0x7be5343fUL, 0x89e67bUL, 0xf26b2936UL, 0xa9ead51UL, 0xc634c8UL, },
		{ 0xff022cbaUL, 0x729ce0d9UL, 0xaf1d76d4UL, 0xa87a9585UL, 0xdce63f73UL, 0xa5fbbf5cUL, 0xa6498e72UL, 0x74fcae2UL, },
		{ 0x63a7d652UL, 0x83315a45UL, 0xfd26c951UL, 0x107c577cUL, 0x61d9b117UL, 0x1b373ea3UL, 0x2a91d50UL, 0x78d8158UL, },
		{ 0x16ad09aUL, 0x7deee72UL, 0xb7e85249UL, 0xb99bee72UL, 0xecff1b20UL, 0x6549ca5aUL, 0xb03993f4UL, 0x73ce68cUL, },
		{ 0xe179e464UL, 0xaac2a83eUL, 0x9e658709UL, 0xc3d4ada3UL, 0x3fa5fde6UL, 0xccd3cf0cUL, 0x78cf5fd3UL, 0x7fb8599UL, },
		{ 0x25c6be8cUL, 0xaf3ed33fUL, 0xc8d77c14UL, 0x418f79cfUL, 0x644c4612UL, 0xc0f39573UL, 0x4d16ab5aUL, 0x7ec437fUL, },
		{ 0x5858ae3aUL, 0xd6552511UL, 0x9efaf6ffUL, 0x8054c96dUL, 0xfaddb589UL, 0x3b633927UL, 0x1f1ea4e6UL, 0x7ffeefdUL, },
		{ 0x1b023a36UL, 0x49d6d7b0UL, 0xa4a11445UL, 0xfbeb429aUL, 0x6e17d9a9UL, 0x52414bdbUL, 0x41b4f2ceUL, 0xd4dbd1UL, },
		{ 0x9a0f2448UL, 0x7506dc81UL, 0x6bf4b5b4UL, 0x92d8ab70UL, 0xdda3b99dUL, 0x8ce4690bUL, 0x15059513UL, 0x770360UL, },
		{ 0xc8eadeUL, 0xd1568076UL, 0xdc55a06aUL, 0x52737b87UL, 0xfb7b1b89UL, 0xec7215bdUL, 0x65c089f4UL, 0x77460eUL, },
		{ 0x3ea54e96UL, 0xf44dcab8UL, 0x24cc1d64UL, 0xea253335UL, 0xb5484b4UL, 0x9dc6b83UL, 0x58e9740dUL, 0xa7f3ebUL, },
		{ 0x38edb2c4UL, 0xb1067d23UL, 0xa91767f2UL, 0xea91fcd7UL, 0x7da873e7UL, 0xa4d3a5aaUL, 0xe6109e5cUL, 0x74aa762UL, },
		{ 0x6fc8347eUL, 0xe7072dbaUL, 0x686f1405UL, 0x7bdd8128UL, 0x6773f230UL, 0x4e05e9bUL, 0xad022aa7UL, 0xd4dec4UL, },
		{ 0x26a10c3aUL, 0x9fd154b6UL, 0x50e4d48UL, 0xba02e1eeUL, 0x396d1cb5UL, 0xbf7d2d98UL, 0x89e8e858UL, 0x72a63e5UL, },
		{ 0xff8aa280UL, 0xa8f2d1caUL, 0x1d2cd6feUL, 0x11a888e9UL, 0x93cd494aUL, 0x9be3ee8cUL, 0xb9123a35UL, 0x61d372UL, },
		{ 0x4a9202f2UL, 0xbca6c486UL, 0x81422e38UL, 0x38f240e0UL, 0x88a0c21aUL, 0xf3c0bb72UL, 0x916478baUL, 0x73de068UL, },
		{ 0x1c8f86baUL, 0x6444115fUL, 0x19eb907eUL, 0xa96ec5ebUL, 0x46db4397UL, 0xa5fbf520UL, 0x10906cf7UL, 0x75c3605UL, },
		{ 0x3e51b48cUL, 0x6eb5a9b6UL, 0x81546666UL, 0x7a37ebaaUL, 0x72651f66UL, 0x72a496dcUL, 0xb10ceab4UL, 0x72a66e4UL, },
		{ 0xb89ca4c8UL, 0xf48550c8UL, 0x7984b635UL, 0xa9c15d24UL, 0xbd6d538bUL, 0x93b5de0aUL, 0xccb99337UL, 0xb163e1UL, },
		{ 0xe9698c48UL, 0x701dfefUL, 0xe0cdbe8cUL, 0x918cd6d4UL, 0x37624855UL, 0xd57bd52UL, 0x837ec718UL, 0x61d721UL, },
		{ 0x282ac85eUL, 0x2188cfb6UL, 0xa95f0fccUL, 0x53a68c7aUL, 0x30e27323UL, 0x77ce9342UL, 0x314c1d1cUL, 0x64eb58UL, },
		{ 0xda4e76d2UL, 0x2ef0571cUL, 0x21ec18cdUL, 0x18f4835UL, 0x5fdae2f1UL, 0xf5dd35UL, 0xb86f91UL, 0x7fead32UL, },
		{ 0x1bc3dcd2UL, 0xb8972c8dUL, 0xc27ca3b0UL, 0x3bc93369UL, 0x65738215UL, 0xdf873a8aUL, 0x94c4f07aUL, 0x739cd66UL, },
		{ 0xda53c8deUL, 0xc8cf679eUL, 0xd4cc1367UL, 0x42abb0c6UL, 0x15479415UL, 0x1261637UL, 0xdb1aada0UL, 0x57993UL, },
		{ 0x81f05c52UL, 0xdaeaff05UL, 0xa61592edUL, 0x3bd2598dUL, 0x39240d03UL, 0x7218e761UL, 0x718ab303UL, 0x739c627UL, },
		{ 0x90b66ce4UL, 0xd50d9f7eUL, 0xd0dbb9f9UL, 0xfa67d15eUL, 0x8d8f20a8UL, 0xe47b4d48UL, 0xfdf58e2bUL, 0x73888b9UL, },
		{ 0x65a49c0cUL, 0x2cb032c0UL, 0x8c65ec09UL, 0x52971afeUL, 0x8507b0b8UL, 0x37aff865UL, 0x87febb7dUL, 0x788cc92UL, },
		{ 0x81d7f620UL, 0x16c3c741UL, 0x5cafe878UL, 0x10885813UL, 0x37a1bba7UL, 0xad581893UL, 0x6583aa64UL, 0x726ba4UL, },
		{ 0x566a22f2UL, 0x7986e9bfUL, 0x1dfc3ae0UL, 0x11a2a473UL, 0xde13f72aUL, 0x40a6ae5fUL, 0x367f4f7cUL, 0x78c472fUL, },
		{ 0x1bc3dca0UL, 0xb8972c8dUL, 0xc27ca3b0UL, 0x3bc93369UL, 0x65738215UL, 0xdf873a8aUL, 0x94c4f07aUL, 0xd5cd66UL, },
		{ 0x33cebefeUL, 0x5536db7fUL, 0x9199d6e9UL, 0x4335be8dUL, 0x5b144792UL, 0x7709563aUL, 0xb181f401UL, 0x148bbdUL, },
		{ 0xe454c02cUL, 0xf65acdc5UL, 0x2a707ee4UL, 0x69454373UL, 0xbc23bdbbUL, 0x45b71f04UL, 0xf674087eUL, 0x7590ab5UL, },
		{ 0x566a2280UL, 0x7986e9bfUL, 0x1dfc3ae0UL, 0x11a2a473UL, 0xde13f72aUL, 0x40a6ae5fUL, 0x367f4f7cUL, 0x6c472fUL, },
		{ 0x4698f09aUL, 0xcdeacde8UL, 0x597b09a8UL, 0xbf1c1950UL, 0xe3f88150UL, 0xd2eed843UL, 0x7a4eca56UL, 0x7399f4fUL, },
		{ 0x8a406496UL, 0xb6cd66d4UL, 0x5482017bUL, 0xe3bc558aUL, 0x2787b9b0UL, 0xbc80f61bUL, 0x88d19cc8UL, 0x9b1563UL, },
		{ 0xb98eda1aUL, 0xe3fbbdabUL, 0xc51bd792UL, 0xa089eb07UL, 0x7c93fe22UL, 0xcb89a021UL, 0x395068c9UL, 0x74f9edeUL, },
		{ 0xa99792c4UL, 0xafb7de6aUL, 0x5151d954UL, 0x9aca3e1fUL, 0xd279fe17UL, 0xcf9f400eUL, 0xcf9b4c52UL, 0x6c7222eUL, },
		{ 0x566a22f2UL, 0x7986e9bfUL, 0x1dfc3ae0UL, 0x11a2a473UL, 0xde13f72aUL, 0x40a6ae5fUL, 0x367f4f7cUL, 0x7ec472fUL, },
		{ 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, 0x0UL, },
		{ 0xdc2a4616UL, 0xcf4b8f6bUL, 0x497e3b9bUL, 0xf21ef1f9UL, 0xf9944e9aUL, 0xfc265844UL, 0xbeaed3b4UL, 0x77524cUL, },
	};
	const mpfq_2_251_elt * ptr = t;
	unsigned int i,j;
	memset(r, 0, sizeof(mpfq_2_251_elt));
	for(i = 0 ; i < 8 ; i++) {
		mp_limb_t a = s[i];
		for(j = 0 ; j < 32 && ptr != &t[251]; j++, ptr++) {
			if (a & 1UL) {
				mpfq_2_251_add(K, r, r, *ptr);
			}
			a >>= 1;
		}
	}
}

static inline
unsigned long mpfq_2_251_trace(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_src_elt s)
{
	return ((s[7]>>25) ^ (s[7]>>23) ^ s[0]) & 1;
}

static inline
void mpfq_2_251_mul_ur(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt_ur t, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	/* kara e1=251 e2=251 slice=4 split=128 */
	mp_limb_t x1[4];
	mp_limb_t x2[4];
	x1[0] = s1[0] ^ s1[4];
	x2[0] = s2[0] ^ s2[4];
	x1[1] = s1[1] ^ s1[5];
	x2[1] = s2[1] ^ s2[5];
	x1[2] = s1[2] ^ s1[6];
	x2[2] = s2[2] ^ s2[6];
	x1[3] = s1[3] ^ s1[7];
	x2[3] = s2[3] ^ s2[7];
	mpfq_2_251_mul_basecase128x128s4X64x2(t,s1,s2);
	mpfq_2_251_mul_basecase123x123s4X64x2(t+2*4,s1+4,s2+4);
	t[4]  = t[8] = t[4] ^ t[8];
	t[4] ^= t[0];
	t[8] ^= t[12];
	t[5]  = t[9] = t[5] ^ t[9];
	t[5] ^= t[1];
	t[9] ^= t[13];
	t[6]  = t[10] = t[6] ^ t[10];
	t[6] ^= t[2];
	t[10] ^= t[14];
	t[7]  = t[11] = t[7] ^ t[11];
	t[7] ^= t[3];
	t[11] ^= t[15];
	mpfq_2_251_addmul_basecase128x128s4X64x2(t+4,x1,x2);
}

static inline
void mpfq_2_251_mul_basecase128x128s4X64x2(mpfq_2_251_dst_elt t, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	/* basecase e1=128 e2=128 slice=4 sse2=64x2 */
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
	u = g[s1[3] >> 16 & 15];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* writing 64 at 64+52 from 64 */
	u = g[s1[3] >> 20 & 15];
	t1 ^= SHL(u, 52); t2 ^= SHR(u, 12);
	/* writing 64 at 64+56 from 64 */
	u = g[s1[3] >> 24 & 15];
	t1 ^= SHL(u, 56); t2 ^= SHR(u,  8);
	/* writing 64 at 64+60 from 64 */
	u = g[s1[3] >> 28 & 15];
	t1 ^= SHL(u, 60); t2 ^= SHR(u,  4);
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
void mpfq_2_251_mul_basecase123x123s4X64x2(mpfq_2_251_dst_elt t, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	/* basecase e1=123 e2=123 slice=4 sse2=64x2 */
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
	u = g[s1[3] >> 16 & 15];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* writing 64 at 64+52 from 64 */
	u = g[s1[3] >> 20 & 15];
	t1 ^= SHL(u, 52); t2 ^= SHR(u, 12);
	/* writing 64 at 64+56 from 64 */
	u = g[s1[3] >> 24 & 7];
	t1 ^= SHL(u, 56); t2 ^= SHR(u,  8);
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
void mpfq_2_251_addmul_basecase128x128s4X64x2(mpfq_2_251_dst_elt t, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	/* basecase e1=128 e2=128 slice=4 add sse2=64x2 */
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
	u = g[s1[3] >> 16 & 15];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* writing 64 at 64+52 from 64 */
	u = g[s1[3] >> 20 & 15];
	t1 ^= SHL(u, 52); t2 ^= SHR(u, 12);
	/* writing 64 at 64+56 from 64 */
	u = g[s1[3] >> 24 & 15];
	t1 ^= SHL(u, 56); t2 ^= SHR(u,  8);
	/* writing 64 at 64+60 from 64 */
	u = g[s1[3] >> 28 & 15];
	t1 ^= SHL(u, 60); t2 ^= SHR(u,  4);
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
		t[0] ^= r.x[0];
		t[1] ^= r.x[1];
		t[2] ^= r.x[2];
		t[3] ^= r.x[3];
	}
	
	{
		v2di_proxy r;
		r.s = t2 ^ SHRD(t1, 64);
		t[4] ^= r.x[0];
		t[5] ^= r.x[1];
		t[6] ^= r.x[2];
		t[7] ^= r.x[3];
	}
#undef SHL
#undef SHR
#undef SHLD
#undef SHRD
}

static inline
void mpfq_2_251_sqr_ur(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt_ur t, mpfq_2_251_src_elt s)
{
	static const mp_limb_t g[16] = {
		0, 1, 4, 5, 16, 17, 20, 21,
		64, 65, 68, 69, 80, 81, 84, 85,
	};
	{
		mp_limb_t u;
		u = g[s[0]       & 15];
	t[0]  = u;
		u = g[s[0] >>  4 & 15];
	t[0] ^= u <<  8;
		u = g[s[0] >>  8 & 15];
	t[0] ^= u << 16;
		u = g[s[0] >> 12 & 15];
	t[0] ^= u << 24;
		u = g[s[0] >> 16 & 15];
	t[1]  = u;
		u = g[s[0] >> 20 & 15];
	t[1] ^= u <<  8;
		u = g[s[0] >> 24 & 15];
	t[1] ^= u << 16;
		u = g[s[0] >> 28 & 15];
	t[1] ^= u << 24;
		u = g[s[1]       & 15];
	t[2]  = u;
		u = g[s[1] >>  4 & 15];
	t[2] ^= u <<  8;
		u = g[s[1] >>  8 & 15];
	t[2] ^= u << 16;
		u = g[s[1] >> 12 & 15];
	t[2] ^= u << 24;
		u = g[s[1] >> 16 & 15];
	t[3]  = u;
		u = g[s[1] >> 20 & 15];
	t[3] ^= u <<  8;
		u = g[s[1] >> 24 & 15];
	t[3] ^= u << 16;
		u = g[s[1] >> 28 & 15];
	t[3] ^= u << 24;
		u = g[s[2]       & 15];
	t[4]  = u;
		u = g[s[2] >>  4 & 15];
	t[4] ^= u <<  8;
		u = g[s[2] >>  8 & 15];
	t[4] ^= u << 16;
		u = g[s[2] >> 12 & 15];
	t[4] ^= u << 24;
		u = g[s[2] >> 16 & 15];
	t[5]  = u;
		u = g[s[2] >> 20 & 15];
	t[5] ^= u <<  8;
		u = g[s[2] >> 24 & 15];
	t[5] ^= u << 16;
		u = g[s[2] >> 28 & 15];
	t[5] ^= u << 24;
		u = g[s[3]       & 15];
	t[6]  = u;
		u = g[s[3] >>  4 & 15];
	t[6] ^= u <<  8;
		u = g[s[3] >>  8 & 15];
	t[6] ^= u << 16;
		u = g[s[3] >> 12 & 15];
	t[6] ^= u << 24;
		u = g[s[3] >> 16 & 15];
	t[7]  = u;
		u = g[s[3] >> 20 & 15];
	t[7] ^= u <<  8;
		u = g[s[3] >> 24 & 15];
	t[7] ^= u << 16;
		u = g[s[3] >> 28 & 15];
	t[7] ^= u << 24;
		u = g[s[4]       & 15];
	t[8]  = u;
		u = g[s[4] >>  4 & 15];
	t[8] ^= u <<  8;
		u = g[s[4] >>  8 & 15];
	t[8] ^= u << 16;
		u = g[s[4] >> 12 & 15];
	t[8] ^= u << 24;
		u = g[s[4] >> 16 & 15];
	t[9]  = u;
		u = g[s[4] >> 20 & 15];
	t[9] ^= u <<  8;
		u = g[s[4] >> 24 & 15];
	t[9] ^= u << 16;
		u = g[s[4] >> 28 & 15];
	t[9] ^= u << 24;
		u = g[s[5]       & 15];
	t[10]  = u;
		u = g[s[5] >>  4 & 15];
	t[10] ^= u <<  8;
		u = g[s[5] >>  8 & 15];
	t[10] ^= u << 16;
		u = g[s[5] >> 12 & 15];
	t[10] ^= u << 24;
		u = g[s[5] >> 16 & 15];
	t[11]  = u;
		u = g[s[5] >> 20 & 15];
	t[11] ^= u <<  8;
		u = g[s[5] >> 24 & 15];
	t[11] ^= u << 16;
		u = g[s[5] >> 28 & 15];
	t[11] ^= u << 24;
		u = g[s[6]       & 15];
	t[12]  = u;
		u = g[s[6] >>  4 & 15];
	t[12] ^= u <<  8;
		u = g[s[6] >>  8 & 15];
	t[12] ^= u << 16;
		u = g[s[6] >> 12 & 15];
	t[12] ^= u << 24;
		u = g[s[6] >> 16 & 15];
	t[13]  = u;
		u = g[s[6] >> 20 & 15];
	t[13] ^= u <<  8;
		u = g[s[6] >> 24 & 15];
	t[13] ^= u << 16;
		u = g[s[6] >> 28 & 15];
	t[13] ^= u << 24;
		u = g[s[7]       & 15];
	t[14]  = u;
		u = g[s[7] >>  4 & 15];
	t[14] ^= u <<  8;
		u = g[s[7] >>  8 & 15];
	t[14] ^= u << 16;
		u = g[s[7] >> 12 & 15];
	t[14] ^= u << 24;
		u = g[s[7] >> 16 & 15];
	t[15]  = u;
		u = g[s[7] >> 20 & 15];
	t[15] ^= u <<  8;
		u = g[s[7] >> 24 & 7];
	t[15] ^= u << 16;
	}
}

static inline
void mpfq_2_251_reduce(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_dst_elt_ur t)
{
	{
		mp_limb_t s[9];
		/* 250 excess bits */
		{
			mp_limb_t z;
			z = t[0];
			s[0] = z;
			z = t[1];
			s[1] = z;
			z = t[2];
			s[2] = z;
			z = t[3];
			s[3] = z;
			z = t[4];
			s[4] = z;
			z = t[5];
			s[5] = z;
			z = t[6];
			s[6] = z;
			z = (t[7]) & 0x7ffffffUL;
			s[7] = z;
		}
		memset(s + 8, 0, 1 * sizeof(mp_limb_t));
		{
			mp_limb_t z;
			z = t[7] >> 27 ^ t[8] <<  5;
			s[0]^= z <<  7;
			s[0]^= z <<  4;
			s[0]^= z <<  2;
			s[0]^= z;
			z >>= 25;
			z^= t[8] >> 27 <<  7 ^ t[9] << 12;
			s[1]^= z;
			z >>= 3;
			z^= t[9] >> 20 << 29;
			s[1]^= z;
			z >>= 2;
			z^= t[9] >> 23 << 30;
			s[1]^= z;
			z >>= 2;
			z^= t[9] >> 25 << 30;
			s[1]^= z;
			z >>= 25;
			z^= t[9] >> 27 <<  7 ^ t[10] << 12;
			s[2]^= z;
			z >>= 3;
			z^= t[10] >> 20 << 29;
			s[2]^= z;
			z >>= 2;
			z^= t[10] >> 23 << 30;
			s[2]^= z;
			z >>= 2;
			z^= t[10] >> 25 << 30;
			s[2]^= z;
			z >>= 25;
			z^= t[10] >> 27 <<  7 ^ t[11] << 12;
			s[3]^= z;
			z >>= 3;
			z^= t[11] >> 20 << 29;
			s[3]^= z;
			z >>= 2;
			z^= t[11] >> 23 << 30;
			s[3]^= z;
			z >>= 2;
			z^= t[11] >> 25 << 30;
			s[3]^= z;
			z >>= 25;
			z^= t[11] >> 27 <<  7 ^ t[12] << 12;
			s[4]^= z;
			z >>= 3;
			z^= t[12] >> 20 << 29;
			s[4]^= z;
			z >>= 2;
			z^= t[12] >> 23 << 30;
			s[4]^= z;
			z >>= 2;
			z^= t[12] >> 25 << 30;
			s[4]^= z;
			z >>= 25;
			z^= t[12] >> 27 <<  7 ^ t[13] << 12;
			s[5]^= z;
			z >>= 3;
			z^= t[13] >> 20 << 29;
			s[5]^= z;
			z >>= 2;
			z^= t[13] >> 23 << 30;
			s[5]^= z;
			z >>= 2;
			z^= t[13] >> 25 << 30;
			s[5]^= z;
			z >>= 25;
			z^= t[13] >> 27 <<  7 ^ t[14] << 12;
			s[6]^= z;
			z >>= 3;
			z^= t[14] >> 20 << 29;
			s[6]^= z;
			z >>= 2;
			z^= t[14] >> 23 << 30;
			s[6]^= z;
			z >>= 2;
			z^= t[14] >> 25 << 30;
			s[6]^= z;
			z >>= 25;
			z^= t[14] >> 27 <<  7 ^ t[15] << 12;
			s[7]^= z;
			z >>= 3;
			z^= t[15] >> 20 << 29;
			s[7]^= z;
			z >>= 2;
			s[7]^= z;
			z >>= 2;
			s[7]^= z;
			z >>= 25;
			s[8]^= z;
		}
		/* 6 excess bits */
		{
			mp_limb_t z;
			z = s[0];
			r[0] = z;
			z = s[1];
			r[1] = z;
			z = s[2];
			r[2] = z;
			z = s[3];
			r[3] = z;
			z = s[4];
			r[4] = z;
			z = s[5];
			r[5] = z;
			z = s[6];
			r[6] = z;
			z = (s[7]) & 0x7ffffffUL;
			r[7] = z;
		}
		{
			mp_limb_t z;
			z = s[7] >> 27 ^ s[8] <<  5;
			r[0]^= z <<  7;
			r[0]^= z <<  4;
			r[0]^= z <<  2;
			r[0]^= z;
		}
	}
}

static inline
int mpfq_2_251_cmp(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_src_elt a, mpfq_2_251_src_elt b)
{
	return mpn_cmp(a, b, 8);
}

static inline
int mpfq_2_251_cmp_ui(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_src_elt r, unsigned long x)
{
	int i;
	if (r[0] < (x & 1UL)) return -1;
	if (r[0] > (x & 1UL)) return 1;
	for(i = 1 ; i < 8 ; i++) {
		if (r[i]) return 1;
	}
	return 0;
}

#endif      /* GMP_LIMB_BITS == 32 */


#endif  /* MPFQ_2_251_H_ */

/* vim:set ft=cpp: */
