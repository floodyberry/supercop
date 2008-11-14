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

#if GMP_LIMB_BITS == 64
/* Active handler: field */
/* Automatically generated code for GF(2^251) */
/* Definition polynomial P = X^251 + X^7 + X^4 + X^2 + 1 */
/* Active handler: trivialities */
/* Active handler: io */
/* Active handler: linearops */
/* Active handler: inversion */
/* Active handler: reduction */
/* Active handler: plain_c */
/* Options used: sqrslice=8 mul_ur=sb_aligned_sse2 slice=4 favor_sse2=1 machine=core2 */

typedef void * mpfq_2_251_field;
typedef void * mpfq_2_251_field_ptr;

typedef unsigned long mpfq_2_251_elt[4];
typedef unsigned long * mpfq_2_251_dst_elt;
typedef const unsigned long * mpfq_2_251_src_elt;

typedef unsigned long mpfq_2_251_elt_ur[8];
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
	r[0] = x & 0x7ffffffffffffffUL;
}

static inline
void mpfq_2_251_set_uipoly_wide(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, const unsigned long * x, unsigned int n)
{
	unsigned int i;
	memset(r, 0, sizeof(mpfq_2_251_elt));
	for (i = 0 ; i < n && i < 4 ; i++)
		r[i] = x[i];
	r[3] &= 0x7ffffffffffffffUL;
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
	for(i = 0 ; i < 4 && i < n; i++) r[i] = x[i];
	for(      ; i < n ; i++) r[i] = 0;
}

static inline
void mpfq_2_251_random(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r)
{
	mpn_random(r, 4);
	r[3] &= 0x7ffffffffffffffUL;
}

static inline
void mpfq_2_251_random2(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r)
{
	mpn_random2(r, 4);
	r[3] &= 0x7ffffffffffffffUL;
}

static inline
void mpfq_2_251_add(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	int i;
	for(i = 0 ; i < 4 ; i++)
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
	
	mpfq_2_251_elt sqrt_t ={ 0xdb6db6db6db6db39UL, 0xadb6db6db6db6db6UL, 0xdb6db6db6db6db6dUL, 0x5b6db6db6db6db6UL, }
	;
	
	mpfq_2_251_elt odd, even;
	mpfq_2_251_elt_ur odd_t;
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
		t >>= 16; even[i] |= shuffle_table[t & 255] << 16;
		t >>= 16; even[i] |= shuffle_table[t & 255] << 24;
		t = even[2*i+1]; t |= t >> 7;
			  even[i] |= shuffle_table[t & 255] << 32;
		t >>= 16; even[i] |= shuffle_table[t & 255] << 40;
		t >>= 16; even[i] |= shuffle_table[t & 255] << 48;
		t >>= 16; even[i] |= shuffle_table[t & 255] << 56;
	}
	memset(even + 2, 0, 2 * sizeof(mp_limb_t));
	for(i = 0 ; i < 4 ; i++) {
		odd[i] = (s[i] & ODD_MASK) >> 1;
	}
	for(i = 0 ; i < 2 ; i++) {
		t = odd[2*i];   t |= t >> 7;
			  odd[i]  = shuffle_table[t & 255];
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 8;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 16;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 24;
		t = odd[2*i+1]; t |= t >> 7;
			  odd[i] |= shuffle_table[t & 255] << 32;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 40;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 48;
		t >>= 16; odd[i] |= shuffle_table[t & 255] << 56;
	}
	memset(odd + 2, 0, 2 * sizeof(mp_limb_t));
	mpfq_2_251_mul_ur(K, odd_t, odd, sqrt_t);
	for(i = 0 ; i < (4+1)/2 ; i++) {
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
	mp_limb_t a[4] = { 0x950UL, 0x0UL, 0x0UL, 0x8000000000000000UL, };
	mp_limb_t b[4];
	mp_limb_t u[4] = { 0, };
	mp_limb_t v[4] = { 1, 0, };
	mp_limb_t x;
	mp_size_t ia, ib;
	int i,d;
	
	if (mpfq_2_251_cmp_ui(K, s, 0UL) == 0)
	    return 0;
	{
		mp_limb_t z;
		z = s[0] <<  4;
		b[0] = z;
		z = s[0] >> 60 ^ s[1] <<  4;
		b[1] = z;
		z = s[1] >> 60 ^ s[2] <<  4;
		b[2] = z;
		z = s[2] >> 60 ^ s[3] <<  4;
		b[3] = z;
	}
	ib = clzlx(b, 4);
	ia = 0;
	
	mpfq_2_251_longshift_left(b,b,4,ib);
	
	for(d = ib - ia ; ; ) {
	        if (d == 0) {
	                for(i = 0 ; i < 4 ; i++) v[i] ^= u[i];
			b[0] ^= a[0]; x = b[0];
			b[1] ^= a[1]; x |= b[1];
			b[2] ^= a[2]; x |= b[2];
			b[3] ^= a[3]; x |= b[3];
	                if (!x) { memcpy(r,u,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(b,4);
	                ib += t;
	                d += t;
	                mpfq_2_251_longshift_left(b,b,4,t);
	        }
	        for(;d > 0;) {
	                mpfq_2_251_longaddshift_left(u,v,4,d);
			a[0] ^= b[0]; x = a[0];
			a[1] ^= b[1]; x |= a[1];
			a[2] ^= b[2]; x |= a[2];
			a[3] ^= b[3]; x |= a[3];
	                if (!x) { memcpy(r,v,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(a,4);
	                ia += t;
	                d -= t;
	                mpfq_2_251_longshift_left(a,a,4,t);
	        } 
	        if (d == 0) {
	                for(i = 0 ; i < 4 ; i++) u[i] ^= v[i];
			a[0] ^= b[0]; x = a[0];
			a[1] ^= b[1]; x |= a[1];
			a[2] ^= b[2]; x |= a[2];
			a[3] ^= b[3]; x |= a[3];
	                if (!x) { memcpy(r,v,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(a,4);
	                ia += t;
	                d -= t;
	                mpfq_2_251_longshift_left(a,a,4,t);
	        }
	        for(;d < 0;) {
	                mpfq_2_251_longaddshift_left(v,u,4,-d);
			b[0] ^= a[0]; x = b[0];
			b[1] ^= a[1]; x |= b[1];
			b[2] ^= a[2]; x |= b[2];
			b[3] ^= a[3]; x |= b[3];
	                if (!x) { memcpy(r,u,4 * sizeof(mp_limb_t)); return 1; }
	                mp_limb_t t = clzlx(b,4);
	                ib += t;
	                d += t;
	                mpfq_2_251_longshift_left(b,b,4,t);
	        }
	}
}

static inline
void mpfq_2_251_longaddshift_left(unsigned long * dst, const unsigned long * src, int n, int s)
{
	int m = s / 64;
	int i;
	s %= 64;
	dst[m] ^= src[0] << s;
	for(i = 1 ; i < n-m ; i++) {
	    dst[m+i] ^= src[i] << s ^ src[i-1] >> (64-s);
	}
}

static inline
void mpfq_2_251_longshift_left(unsigned long * dst, const unsigned long * src, int n, int s)
{
	int m = s / 64;
	int i;
	s %= 64;
	for(i = n-m-1 ; i > 0 ; i--) {
	    dst[m+i] = src[i] << s ^ src[i-1] >> (64-s);
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
		{ 0x259f299d6640aa5aUL, 0xb125487bf1bfcdeeUL, 0x3dd84bf89d455c09UL, 0x38c82b95e348ed8UL, },
		{ 0x2ad8f18183894700UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0x2ad8f18183894702UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0x8a28f7f7cfd738baUL, 0x2bef7664a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0x2ad8f18183894706UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0xead4a6f6ba6aec0cUL, 0x433bb982b8c1f675UL, 0xc1fe13bc64d11293UL, 0x7fbd0f5e09a5d6cUL, },
		{ 0x8a28f7f7cfd738b2UL, 0x2bef7664a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0x9ed154b636a14cbaUL, 0xba03e1ee050e4d48UL, 0xbf7d2d98396d1cb5UL, 0x72a63e589e8e858UL, },
		{ 0x2ad8f18183894716UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0xd4f5f437c094de52UL, 0x13dad55f37cdff7fUL, 0x1a202a3f20bdcd63UL, 0x789ee2919df2be3UL, },
		{ 0xead4a6f6ba6aec2cUL, 0x433bb982b8c1f675UL, 0xc1fe13bc64d11293UL, 0x7fbd0f5e09a5d6cUL, },
		{ 0x24c8b3f5a7702648UL, 0xb96e93ef9afe5f10UL, 0xe5fa4ff4063cbc69UL, 0xc34d5bd09901e5UL, },
		{ 0x8a28f7f7cfd738f2UL, 0x2bef7664a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0x257958a946571e7eUL, 0x508e210658fc07fcUL, 0xdb9dae5a5dee5ac4UL, 0x722a9a623f43f4UL, },
		{ 0x9ed154b636a14c3aUL, 0xba03e1ee050e4d48UL, 0xbf7d2d98396d1cb5UL, 0x72a63e589e8e858UL, },
		{ 0xa8972c8d5bc35ca0UL, 0x3ac93369c27ca3b0UL, 0xdf873a8a65738215UL, 0xd5cd6694c4f07aUL, },
		{ 0x2ad8f18183894616UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0x4b5ec7c796e5f4d2UL, 0x3b7cd18c29464d6eUL, 0x84563375f4217a7dUL, 0x7398b5ca01c66b2UL, },
		{ 0xd4f5f437c094dc52UL, 0x13dad55f37cdff7fUL, 0x1a202a3f20bdcd63UL, 0x789ee2919df2be3UL, },
		{ 0x6748e5d4da50ae48UL, 0xbaf372c130600368UL, 0xe4aa06b7318bb989UL, 0xc7276ee6411d48UL, },
		{ 0xead4a6f6ba6ae82cUL, 0x433bb982b8c1f675UL, 0xc1fe13bc64d11293UL, 0x7fbd0f5e09a5d6cUL, },
		{ 0x589dbb83250d243aUL, 0xaa934a27dfaa46adUL, 0x8974792c8389705dUL, 0x74aa766e305e15dUL, },
		{ 0x24c8b3f5a7702e48UL, 0xb96e93ef9afe5f10UL, 0xe5fa4ff4063cbc69UL, 0xc34d5bd09901e5UL, },
		{ 0x51d0c4a5e93adc20UL, 0x38640fd5afefbf1bUL, 0xa86fbfff40d66523UL, 0xc25fad7e9240c6UL, },
		{ 0x8a28f7f7cfd728f2UL, 0x2bef7664a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0xdcc2ec536c7100f2UL, 0x138875905c0df980UL, 0x1a30d83e0e1372b6UL, 0x79b1072b4632f71UL, },
		{ 0x257958a946573e7eUL, 0x508e210658fc07fcUL, 0xdb9dae5a5dee5ac4UL, 0x722a9a623f43f4UL, },
		{ 0xaf7ed33f2dc6be8cUL, 0x418f69cfc8d77c14UL, 0xc0f39573644c4612UL, 0x7ec437f4d16ab5aUL, },
		{ 0x9ed154b636a10c3aUL, 0xba03e1ee050e4d48UL, 0xbf7d2d98396d1cb5UL, 0x72a63e589e8e858UL, },
		{ 0x2af0571cfa4e76d2UL, 0x19f483521ec18cdUL, 0xf5dd355fdae2f1UL, 0x7fead3200b86f91UL, },
		{ 0xa8972c8d5bc3dca0UL, 0x3ac93369c27ca3b0UL, 0xdf873a8a65738215UL, 0xd5cd6694c4f07aUL, },
		{ 0x3986e9bfd66a22f2UL, 0x1a2a4731dfc3ae0UL, 0x40a6ae5fde13f72aUL, 0x7ec472f367f4f7cUL, },
		{ 0x2ad8f18183884616UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0x2c641517311b5e20UL, 0x12007a610b071f53UL, 0x41b2b419a86db02fUL, 0x65bc55b67d8850UL, },
		{ 0x4b5ec7c796e7f4d2UL, 0x3b7cd18c29464d6eUL, 0x84563375f4217a7dUL, 0x7398b5ca01c66b2UL, },
		{ 0xebe75f8bddafd652UL, 0x1e7437800dac241UL, 0x1bc1ed4c09197897UL, 0x7feb8619965835eUL, },
		{ 0xd4f5f437c090dc52UL, 0x13dad55f37cdff7fUL, 0x1a202a3f20bdcd63UL, 0x789ee2919df2be3UL, },
		{ 0x55e1a39e60eaacbaUL, 0x914cf73d108d192dUL, 0xa03c5b833667f093UL, 0x78c96eb905971cbUL, },
		{ 0x6748e5d4da58ae48UL, 0xbaf372c130600368UL, 0xe4aa06b7318bb989UL, 0xc7276ee6411d48UL, },
		{ 0xb9d4b54007f8709aUL, 0x93839bdbb7311161UL, 0xd7a2270065660130UL, 0x79b1037e11c06adUL, },
		{ 0xead4a6f6ba7ae82cUL, 0x433bb982b8c1f675UL, 0xc1fe13bc64d11293UL, 0x7fbd0f5e09a5d6cUL, },
		{ 0x1c08510c00b22e3aUL, 0xa87b2a560a8fa923UL, 0x88441948758180a9UL, 0x75d25aeb8035d60UL, },
		{ 0x589dbb83252d243aUL, 0xaa934a27dfaa46adUL, 0x8974792c8389705dUL, 0x74aa766e305e15dUL, },
		{ 0x7a182b951321fe20UL, 0x14c5972b792f08cUL, 0x2d83117d5f5cdabfUL, 0x102f05e1b3439UL, },
		{ 0x24c8b3f5a7302e48UL, 0xb96e93ef9afe5f10UL, 0xe5fa4ff4063cbc69UL, 0xc34d5bd09901e5UL, },
		{ 0x6a861909b333fcd2UL, 0x28151698a9184542UL, 0x5b78836c4c58aa5UL, 0x75d31e936787bb9UL, },
		{ 0x51d0c4a5e9badc20UL, 0x38640fd5afefbf1bUL, 0xa86fbfff40d66523UL, 0xc25fad7e9240c6UL, },
		{ 0x7ebfefd73a3948cUL, 0x7b465aa20aaadd51UL, 0x1f74aff801293116UL, 0x7398e19d9d25b30UL, },
		{ 0x8a28f7f7ced728f2UL, 0x2bef7664a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0x1df51ce3e22dfa9aUL, 0x92919a01ebc382c2UL, 0x6162d217ae7511e4UL, 0x79a03811dcc12b6UL, },
		{ 0xdcc2ec536e7100f2UL, 0x138875905c0df980UL, 0x1a30d83e0e1372b6UL, 0x79b1072b4632f71UL, },
		{ 0x7f399ac936a898c4UL, 0xd17d59cc898ffb7cUL, 0x16838e245f0f87e3UL, 0x79e7ca6b7a2b421UL, },
		{ 0x257958a942573e7eUL, 0x508e210658fc07fcUL, 0xdb9dae5a5dee5ac4UL, 0x722a9a623f43f4UL, },
		{ 0x72bce0d9ff022cbaUL, 0xa87a9185af1d76d4UL, 0xa5fbbf5cdce63f73UL, 0x74fcae2a6498e72UL, },
		{ 0xaf7ed33f25c6be8cUL, 0x418f69cfc8d77c14UL, 0xc0f39573644c4612UL, 0x7ec437f4d16ab5aUL, },
		{ 0xd1d6807600c8eadeUL, 0x52733b87dc55a06aUL, 0xec7215bdfb7b1b89UL, 0x77460e65c089f4UL, },
		{ 0x9ed154b626a10c3aUL, 0xba03e1ee050e4d48UL, 0xbf7d2d98396d1cb5UL, 0x72a63e589e8e858UL, },
		{ 0x6cb5a9b63e51b48cUL, 0x7a33ebaa81546666UL, 0x72a496dc72651f66UL, 0x72a66e4b10ceab4UL, },
		{ 0x2af0571cda4e76d2UL, 0x19f483521ec18cdUL, 0xf5dd355fdae2f1UL, 0x7fead3200b86f91UL, },
		{ 0xdd0d9f7e90b66ce4UL, 0xfa27d15ed0dbb9f9UL, 0xe47b4d488d8f20a8UL, 0x73888b9fdf58e2bUL, },
		{ 0xa8972c8d1bc3dca0UL, 0x3ac93369c27ca3b0UL, 0xdf873a8a65738215UL, 0xd5cd6694c4f07aUL, },
		{ 0xedeacde84698f09aUL, 0xbb1c1950597b09a8UL, 0xd2eed843e3f88150UL, 0x7399f4f7a4eca56UL, },
		{ 0x3986e9bf566a22f2UL, 0x1a2a4731dfc3ae0UL, 0x40a6ae5fde13f72aUL, 0x7ec472f367f4f7cUL, },
		{ 0xe0fc510175bdd4a0UL, 0x28d4cfe6182fe2cfUL, 0x33b9184a2bedb08dUL, 0xb0706271359fe6UL, },
		{ 0x2ad8f18083884616UL, 0xc10dfb572aec50f9UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0xff9ceeeaa23aa072UL, 0x3b379ce1df23f768UL, 0xb2a3d47c49524a90UL, 0x72b74464a7b35afUL, },
		{ 0x2c641515311b5e20UL, 0x12007a610b071f53UL, 0x41b2b419a86db02fUL, 0x65bc55b67d8850UL, },
		{ 0xfea36e67a66f5652UL, 0xf39f0e66621c19UL, 0x1bcf4718091f11f7UL, 0x7ffabc334f7582dUL, },
		{ 0x4b5ec7c396e7f4d2UL, 0x3b7cd18c29464d6eUL, 0x84563375f4217a7dUL, 0x7398b5ca01c66b2UL, },
		{ 0x739499f138718ebaUL, 0x9295af3d9fdacd80UL, 0x4cd28f9507b8b30fUL, 0x79a039118cfb7e7UL, },
		{ 0xebe75f83ddafd652UL, 0x1e7437800dac241UL, 0x1bc1ed4c09197897UL, 0x7feb8619965835eUL, },
		{ 0x78b64ff43624cce4UL, 0xc19077a6a39132caUL, 0x3bb1116af3c26ab8UL, 0x7ec422a5fdb27a9UL, },
		{ 0xd4f5f427c090dc52UL, 0x13dad55f37cdff7fUL, 0x1a202a3f20bdcd63UL, 0x789ee2919df2be3UL, },
		{ 0x86be94676e77043aUL, 0xaacd13d8b4eb0a57UL, 0x52378bf5a12072adUL, 0x74ab62041cfd06aUL, },
		{ 0x55e1a3be60eaacbaUL, 0x914cf73d108d192dUL, 0xa03c5b833667f093UL, 0x78c96eb905971cbUL, },
		{ 0x8ea132450d2642deUL, 0x5195b3a6c85f4a22UL, 0x6d67cef714b1b5c1UL, 0x61d62085cfc0bdUL, },
		{ 0x6748e594da58ae48UL, 0xbaf372c130600368UL, 0xe4aa06b7318bb989UL, 0xc7276ee6411d48UL, },
		{ 0x768a0aa06bf76ee4UL, 0xfa05d8f32218a6ceUL, 0xd2d51c3a2a2fdfc4UL, 0x7388cbcd7b5f294UL, },
		{ 0xb9d4b5c007f8709aUL, 0x93839bdbb7311161UL, 0xd7a2270065660130UL, 0x79b1037e11c06adUL, },
		{ 0xa65eed5bfcb4a4c8UL, 0xba8b798d1156598eUL, 0xff9e36ce2748250bUL, 0xc7323d7f9cf186UL, },
		{ 0xead4a7f6ba7ae82cUL, 0x433bb982b8c1f675UL, 0xc1fe13bc64d11293UL, 0x7fbd0f5e09a5d6cUL, },
		{ 0x94410b74b2dcc02cUL, 0x4266c10fe66f10ceUL, 0x2c7b4a80fb6f0a3bUL, 0x7e83c49f32fbf2fUL, },
		{ 0x1c08530c00b22e3aUL, 0xa87b2a560a8fa923UL, 0x88441948758180a9UL, 0x75d25aeb8035d60UL, },
		{ 0x85bfdcd0c9d9c8deUL, 0x6b633d635dbe24feUL, 0x47318abfbf8d555UL, 0xb41e126dc3ffe0UL, },
		{ 0x589dbf83252d243aUL, 0xaa934a27dfaa46adUL, 0x8974792c8389705dUL, 0x74aa766e305e15dUL, },
		{ 0xb089a88115ecee64UL, 0xfb0852e07c994fdeUL, 0xc9810534fd53b652UL, 0x72b711223b6becaUL, },
		{ 0x7a1823951321fe20UL, 0x14c5972b792f08cUL, 0x2d83117d5f5cdabfUL, 0x102f05e1b3439UL, },
		{ 0xb8a9922e6253501aUL, 0xb8f184d7035d0f7aUL, 0x13d61a34488c4776UL, 0x73de069c1746e37UL, },
		{ 0x24c8a3f5a7302e48UL, 0xb96e93ef9afe5f10UL, 0xe5fa4ff4063cbc69UL, 0xc34d5bd09901e5UL, },
		{ 0x16d0189bb284664UL, 0xd10e93c50f91b912UL, 0xfb4cd8d37680e45aUL, 0x79e69b07f557166UL, },
		{ 0x6a863909b333fcd2UL, 0x28151698a9184542UL, 0x5b78836c4c58aa5UL, 0x75d31e936787bb9UL, },
		{ 0xcbff507a626b9ac4UL, 0xd136159b7f3f2063UL, 0x20762a9dcff69c4fUL, 0x78c83bc5dc4e278UL, },
		{ 0x51d084a5e9badc20UL, 0x38640fd5afefbf1bUL, 0xa86fbfff40d66523UL, 0xc25fad7e9240c6UL, },
		{ 0xf0320e8502781a36UL, 0xd0dfa2daacf9c215UL, 0xe0fcf88c0b196c59UL, 0x723b899088ef5eUL, },
		{ 0x7eb7efd73a3948cUL, 0x7b465aa20aaadd51UL, 0x1f74aff801293116UL, 0x7398e19d9d25b30UL, },
		{ 0x66f90e8c3b759cfeUL, 0x5313c02872625b94UL, 0x9acde7196a595f0eUL, 0x7640af54e75f59UL, },
		{ 0x8a29f7f7ced728f2UL, 0x2bef7664a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0x3015cfcf445d781aUL, 0x91084e103544908dUL, 0x4d82c6d6300f9b5eUL, 0x79e69a42e17ab4fUL, },
		{ 0x1df71ce3e22dfa9aUL, 0x92919a01ebc382c2UL, 0x6162d217ae7511e4UL, 0x79a03811dcc12b6UL, },
		{ 0xe8b2653218a90c3aUL, 0x8091059b7dbfad59UL, 0xbbb61e483e707535UL, 0x7ed5099a4af5f06UL, },
		{ 0xdcc6ec536e7100f2UL, 0x138875905c0df980UL, 0x1a30d83e0e1372b6UL, 0x79b1072b4632f71UL, },
		{ 0x4567607a7cf01a44UL, 0xf9e6ee5a13da3552UL, 0x3e7f2cf01b1df3d9UL, 0x73cf3ce29f3d98aUL, },
		{ 0x7f319ac936a898c4UL, 0xd17d59cc898ffb7cUL, 0x16838e245f0f87e3UL, 0x79e7ca6b7a2b421UL, },
		{ 0x1e257c4d79e72a72UL, 0x287ae2b95b25a400UL, 0x684a82bdb46833c4UL, 0x74fcae2b34c8b31UL, },
		{ 0x256958a942573e7eUL, 0x508e210658fc07fcUL, 0xdb9dae5a5dee5ac4UL, 0x722a9a623f43f4UL, },
		{ 0xd0b46cfd87e1a0f2UL, 0x297df6c31bd6b256UL, 0x733d74cacd053a66UL, 0x75c37080730f804UL, },
		{ 0x729ce0d9ff022cbaUL, 0xa87a9185af1d76d4UL, 0xa5fbbf5cdce63f73UL, 0x74fcae2a6498e72UL, },
		{ 0x7deee72016ad09aUL, 0xb99be672b7e85249UL, 0x6549ca5aecff1b20UL, 0x73ce68cb03993f4UL, },
		{ 0xaf3ed33f25c6be8cUL, 0x418f69cfc8d77c14UL, 0xc0f39573644c4612UL, 0x7ec437f4d16ab5aUL, },
		{ 0x49d6d7b01b023a36UL, 0xfbeb629aa4a11445UL, 0x52414bdb6e17d9a9UL, 0xd4dbd141b4f2ceUL, },
		{ 0xd156807600c8eadeUL, 0x52733b87dc55a06aUL, 0xec7215bdfb7b1b89UL, 0x77460e65c089f4UL, },
		{ 0xb1067d2338edb2c4UL, 0xea917cd7a91767f2UL, 0xa4d3a5aa7da873e7UL, 0x74aa762e6109e5cUL, },
		{ 0x9fd154b626a10c3aUL, 0xba03e1ee050e4d48UL, 0xbf7d2d98396d1cb5UL, 0x72a63e589e8e858UL, },
		{ 0xbca6c4864a9202f2UL, 0x38f040e081422e38UL, 0xf3c0bb7288a0c21aUL, 0x73de068916478baUL, },
		{ 0x6eb5a9b63e51b48cUL, 0x7a33ebaa81546666UL, 0x72a496dc72651f66UL, 0x72a66e4b10ceab4UL, },
		{ 0x701dfefe9698c48UL, 0x9184d6d4e0cdbe8cUL, 0xd57bd5237624855UL, 0x61d721837ec718UL, },
		{ 0x2ef0571cda4e76d2UL, 0x19f483521ec18cdUL, 0xf5dd355fdae2f1UL, 0x7fead3200b86f91UL, },
		{ 0xc8cf679eda53c8deUL, 0x428bb0c6d4cc1367UL, 0x126163715479415UL, 0x57993db1aada0UL, },
		{ 0xd50d9f7e90b66ce4UL, 0xfa27d15ed0dbb9f9UL, 0xe47b4d488d8f20a8UL, 0x73888b9fdf58e2bUL, },
		{ 0x16c3c74181d7f620UL, 0x100858135cafe878UL, 0xad58189337a1bba7UL, 0x726ba46583aa64UL, },
		{ 0xb8972c8d1bc3dca0UL, 0x3ac93369c27ca3b0UL, 0xdf873a8a65738215UL, 0xd5cd6694c4f07aUL, },
		{ 0xf65acdc5e454c02cUL, 0x6b4543732a707ee4UL, 0x45b71f04bc23bdbbUL, 0x7590ab5f674087eUL, },
		{ 0xcdeacde84698f09aUL, 0xbb1c1950597b09a8UL, 0xd2eed843e3f88150UL, 0x7399f4f7a4eca56UL, },
		{ 0xe3fbbdabb98eda1aUL, 0xa889eb07c51bd792UL, 0xcb89a0217c93fe22UL, 0x74f9ede395068c9UL, },
		{ 0x7986e9bf566a22f2UL, 0x1a2a4731dfc3ae0UL, 0x40a6ae5fde13f72aUL, 0x7ec472f367f4f7cUL, },
		{ 0xcf4b8f6bdc2a4616UL, 0xd21ef1f9497e3b9bUL, 0xfc265844f9944e9aUL, 0x77524cbeaed3b4UL, },
		{ 0x60fc510175bdd4a0UL, 0x28d4cfe6182fe2cfUL, 0x33b9184a2bedb08dUL, 0xb0706271359fe6UL, },
		{ 0x14f9a341f9767420UL, 0x11ec978aa5e059f2UL, 0x4d3a266e7651beabUL, 0x61c37218472ad2UL, },
		{ 0x2ad8f18083884616UL, 0xc10dfb572aec50f8UL, 0x96e41fed323d615aUL, 0x13fdaee1025c5dUL, },
		{ 0xf03d47c267e4f89aUL, 0xaab446b0ad33a06fUL, 0xffda65cb26817108UL, 0x74aa372c9462a06UL, },
		{ 0xff9ceeeaa23aa072UL, 0x3b379ce1df23f76aUL, 0xb2a3d47c49524a90UL, 0x72b74464a7b35afUL, },
		{ 0x7dd333e67a70b8c4UL, 0xc0f354df37b30423UL, 0xfbc0f11b1e1ca9d3UL, 0x7ed448e3fbd9988UL, },
		{ 0x2c641515311b5e20UL, 0x12007a610b071f57UL, 0x41b2b419a86db02fUL, 0x65bc55b67d8850UL, },
		{ 0xa049bd6bb0062872UL, 0x22803cb41a4b2a6UL, 0x5a8140bca6e5fda8UL, 0x7e82c0f02008a65UL, },
		{ 0xfea36e67a66f5652UL, 0xf39f0e66621c11UL, 0x1bcf4718091f11f7UL, 0x7ffabc334f7582dUL, },
		{ 0x4b7cc25b5030682cUL, 0x788a163518d9fd22UL, 0x1e2c6e3eaf3af6b3UL, 0x73df53f19e9ff27UL, },
		{ 0x4b5ec7c396e7f4d2UL, 0x3b7cd18c29464d7eUL, 0x84563375f4217a7dUL, 0x7398b5ca01c66b2UL, },
		{ 0x8afbd744f34ebefeUL, 0x50aa20e3f949993fUL, 0xad2bc8384ffad192UL, 0x60c1c613233497UL, },
		{ 0x739499f138718ebaUL, 0x9295af3d9fdacda0UL, 0x4cd28f9507b8b30fUL, 0x79a039118cfb7e7UL, },
		{ 0xf756aa5b97051e7eUL, 0x7ace5405dd811357UL, 0x4f6d56c11a421b4UL, 0xc7223edbcded05UL, },
		{ 0xebe75f83ddafd652UL, 0x1e7437800dac201UL, 0x1bc1ed4c09197897UL, 0x7feb8619965835eUL, },
		{ 0x994d46f7e08604c8UL, 0xa8b6efab2641e49aUL, 0xfe7ff1bd4eeca61bUL, 0xb06475ff26593aUL, },
		{ 0x78b64ff43624cce4UL, 0xc19077a6a391324aUL, 0x3bb1116af3c26ab8UL, 0x7ec422a5fdb27a9UL, },
		{ 0x5f4ff2d69f902e48UL, 0xa9bb65b978cc8ca0UL, 0xe52be8e3d9917969UL, 0xa399db0b251565UL, },
		{ 0xd4f5f427c090dc52UL, 0x13dad55f37cdfe7fUL, 0x1a202a3f20bdcd63UL, 0x789ee2919df2be3UL, },
		{ 0x8e140b7cfdd17ca0UL, 0x2d0e72aa5c3f7d5UL, 0xda0a90ca0f6f3e05UL, 0x568c479962f32UL, },
		{ 0x86be94676e77043aUL, 0xaacd13d8b4eb0857UL, 0x52378bf5a12072adUL, 0x74ab62041cfd06aUL, },
		{ 0xcbb72032bdc0968cUL, 0x419760d8482d911fUL, 0x2d70ee8d94ab13baUL, 0x7fead7205d23bc1UL, },
		{ 0x55e1a3be60eaacbaUL, 0x914cf73d108d1d2dUL, 0xa03c5b833667f093UL, 0x78c96eb905971cbUL, },
		{ 0xca59abe882e0485eUL, 0x7925f0a0a031d8fbUL, 0xa86666b8943fe103UL, 0xd1b2413eaa56fdUL, },
		{ 0x8ea132450d2642deUL, 0x5195b3a6c85f4222UL, 0x6d67cef714b1b5c1UL, 0x61d62085cfc0bdUL, },
		{ 0xf6a3ad7a132c2872UL, 0x2aebbbfbdb2b350fUL, 0x5ffff9f027c841e8UL, 0x7585d787493dc36UL, },
		{ 0x6748e594da58ae48UL, 0xbaf372c130601368UL, 0xe4aa06b7318bb989UL, 0xc7276ee6411d48UL, },
		{ 0x59e85f01f8451044UL, 0xd3c5a50090264515UL, 0x3a0b6076d882d36dUL, 0x789ef7c1f46a217UL, },
		{ 0x768a0aa06bf76ee4UL, 0xfa05d8f3221886ceUL, 0xd2d51c3a2a2fdfc4UL, 0x7388cbcd7b5f294UL, },
		{ 0xfc7f1682928816feUL, 0x7bef7d899a884dcdUL, 0x449e3958e5f7a15aUL, 0xd4dbc140f353cbUL, },
		{ 0xb9d4b5c007f8709aUL, 0x93839bdbb7315161UL, 0xd7a2270065660130UL, 0x79b1037e11c06adUL, },
		{ 0xa248e0fac47f4d2UL, 0x12f78f71a1b4cbffUL, 0x8114666242b9937dUL, 0x79a178696dc713aUL, },
		{ 0xa65eed5bfcb4a4c8UL, 0xba8b798d1156d98eUL, 0xff9e36ce2748250bUL, 0xc7323d7f9cf186UL, },
		{ 0xa0601bdcc8d0b8b6UL, 0xc2bab0a84aa4fa7eUL, 0xcc9082644b0238d3UL, 0x57c93e3bab9a8UL, },
		{ 0xead4a7f6ba7ae82cUL, 0x433bb982b8c0f675UL, 0xc1fe13bc64d11293UL, 0x7fbd0f5e09a5d6cUL, },
		{ 0xc97d5c16528dfa9aUL, 0xa94b4c03681463deUL, 0xd343736a2335ace4UL, 0x75c321d7ac731d3UL, },
		{ 0x94410b74b2dcc02cUL, 0x4266c10fe66d10ceUL, 0x2c7b4a80fb6f0a3bUL, 0x7e83c49f32fbf2fUL, },
		{ 0x427d86b29ad7a6c8UL, 0xb960388ef19e1c41UL, 0xc868fd436c57cfa7UL, 0xc34d0f95e59ecfUL, },
		{ 0x1c08530c00b22e3aUL, 0xa87b2a560a8ba923UL, 0x88441948758180a9UL, 0x75d25aeb8035d60UL, },
		{ 0xcdb8196a9490521aUL, 0x92c2dc931d159d32UL, 0xfa1575b8788320daUL, 0x79a1296bf6b8570UL, },
		{ 0x85bfdcd0c9d9c8deUL, 0x6b633d635db624feUL, 0x47318abfbf8d555UL, 0xb41e126dc3ffe0UL, },
		{ 0xe719df760d558a72UL, 0x8ffdcc8b622118UL, 0xdb938f1d8ae2aed4UL, 0x7ffbe80b97954a4UL, },
		{ 0x589dbf83252d243aUL, 0xaa934a27dfba46adUL, 0x8974792c8389705dUL, 0x74aa766e305e15dUL, },
		{ 0x75d0bd20c8b31836UL, 0xc38f582b79594b5aUL, 0xd7984582f0d30e75UL, 0x16847c3a37a619UL, },
		{ 0xb089a88115ecee64UL, 0xfb0852e07cb94fdeUL, 0xc9810534fd53b652UL, 0x72b711223b6becaUL, },
		{ 0x40c34c90b94be696UL, 0xc06bed684a673b20UL, 0x3b25ef1f00c3befcUL, 0x12fb1b846740c9UL, },
		{ 0x7a1823951321fe20UL, 0x14c5972b7d2f08cUL, 0x2d83117d5f5cdabfUL, 0x102f05e1b3439UL, },
		{ 0xc16f3eb85129701aUL, 0x93f7d26fb3169d3cUL, 0x7a7a91a33b293686UL, 0x79b053469fd1f31UL, },
		{ 0xb8a9922e6253501aUL, 0xb8f184d703dd0f7aUL, 0x13d61a34488c4776UL, 0x73de069c1746e37UL, },
		{ 0xc16c99dce2bc10b6UL, 0xf97798fd9a5d4adfUL, 0x48788f594de38a5bUL, 0xd1a357985983cfUL, },
		{ 0x24c8a3f5a7302e48UL, 0xb96e93ef9bfe5f10UL, 0xe5fa4ff4063cbc69UL, 0xc34d5bd09901e5UL, },
		{ 0x18197eb4ffa4b0c4UL, 0xeaefc98f2b4ee475UL, 0x924e29906ee9090bUL, 0x7585d6861856935UL, },
		{ 0x16d0189bb284664UL, 0xd10e93c50d91b912UL, 0xfb4cd8d37680e45aUL, 0x79e69b07f557166UL, },
		{ 0x91bbed571cd4ece4UL, 0xd2d213953b0a4798UL, 0xe177b2f78d25ae08UL, 0x788fcdba69115d2UL, },
		{ 0x6a863909b333fcd2UL, 0x28151698ad184542UL, 0x5b78836c4c58aa5UL, 0x75d31e936787bb9UL, },
		{ 0xdfacf9340ba0509aUL, 0xb9c23bbd18434ebfUL, 0xbe1feec24fe5d900UL, 0x72e189209ffafd5UL, },
		{ 0xcbff507a626b9ac4UL, 0xd136159b773f2063UL, 0x20762a9dcff69c4fUL, 0x78c83bc5dc4e278UL, },
		{ 0x14e7b2d8f475422cUL, 0x781b275131d54c3bUL, 0x73476bb5f67ce6b7UL, 0x72f5a5947a90a8aUL, },
		{ 0x51d084a5e9badc20UL, 0x38640fd5bfefbf1bUL, 0xa86fbfff40d66523UL, 0xc25fad7e9240c6UL, },
		{ 0x639ee62ea9b038b6UL, 0xfb103f81abeba3c1UL, 0x12dfbffcdcfc48b3UL, 0xd48faddb925535UL, },
		{ 0xf0320e8502781a36UL, 0xd0dfa2da8cf9c215UL, 0xe0fcf88c0b196c59UL, 0x723b899088ef5eUL, },
		{ 0xc7d57f6b3ee8485eUL, 0x504c1195f6a64291UL, 0xc0360a77ba044483UL, 0x727ba6d5c2a400UL, },
		{ 0x7eb7efd73a3948cUL, 0x7b465aa24aaadd51UL, 0x1f74aff801293116UL, 0x7398e19d9d25b30UL, },
		{ 0x67b4b902428d622cUL, 0x7b581aeb5902e1afUL, 0x72eff5a647d37787UL, 0x7398f4dda4bc171UL, },
		{ 0x66f90e8c3b759cfeUL, 0x5313c028f2625b94UL, 0x9acde7196a595f0eUL, 0x7640af54e75f59UL, },
		{ 0xe572d527a2377620UL, 0x28c4ee1cf1148607UL, 0x73bf500c107b11c7UL, 0xa29e2f3c9b5b2dUL, },
		{ 0x8a29f7f7ced728f2UL, 0x2bef7665a0ee14baUL, 0xf2470bf64f3ca21eUL, 0x74ba09791afc28aUL, },
		{ 0x4e67f0b0025f0448UL, 0x937e15759f804500UL, 0x8c40620002a66c2dUL, 0x7654ed8edc011eUL, },
		{ 0x3015cfcf445d781aUL, 0x91084e123544908dUL, 0x4d82c6d6300f9b5eUL, 0x79e69a42e17ab4fUL, },
		{ 0xb7ea8a1d866430c4UL, 0xd10ecdcf37e7733aUL, 0x4d9547c727f98c6bUL, 0x79e69b06e017138UL, },
		{ 0x1df71ce3e22dfa9aUL, 0x92919a05ebc382c2UL, 0x6162d217ae7511e4UL, 0x79a03811dcc12b6UL, },
		{ 0x944debddd2a786baUL, 0xbb6951ed5d7da848UL, 0x7f36585356e4e117UL, 0x7398a4df2aec10bUL, },
		{ 0xe8b2653218a90c3aUL, 0x809105937dbfad59UL, 0xbbb61e483e707535UL, 0x7ed5099a4af5f06UL, },
		{ 0x81c72c0047fb9844UL, 0xe85cf370112ffa25UL, 0x83c6dff0d736c95UL, 0x74fcef7985e431eUL, },
		{ 0xdcc6ec536e7100f2UL, 0x138875805c0df980UL, 0x1a30d83e0e1372b6UL, 0x79b1072b4632f71UL, },
		{ 0xf56a09a285558a00UL, 0x384a1affc0d3e459UL, 0xdef496103df516d4UL, 0xc25bf854bade6cUL, },
		{ 0x4567607a7cf01a44UL, 0xf9e6ee7a13da3552UL, 0x3e7f2cf01b1df3d9UL, 0x73cf3ce29f3d98aUL, },
		{ 0xc27a882544c39ab6UL, 0xe9c4835f97f56c82UL, 0x256197de172300cfUL, 0xa38c9dc6ba2c76UL, },
		{ 0x7f319ac936a898c4UL, 0xd17d598c898ffb7cUL, 0x16838e245f0f87e3UL, 0x79e7ca6b7a2b421UL, },
		{ 0xaedf1da8c9532c3aUL, 0xb9f2f9468e98a11fUL, 0xd3c814e6ff988ec5UL, 0x72e1d93615bc954UL, },
		{ 0x1e257c4d79e72a72UL, 0x287ae2395b25a400UL, 0x684a82bdb46833c4UL, 0x74fcae2b34c8b31UL, },
		{ 0xd855e82f16fe90c4UL, 0xd0254b311b50efb5UL, 0x206f02d26365f7fbUL, 0x78d900bb04171d1UL, },
		{ 0x256958a942573e7eUL, 0x508e200658fc07fcUL, 0xdb9dae5a5dee5ac4UL, 0x722a9a623f43f4UL, },
		{ 0x6aa3bce81efe24c8UL, 0xbb9acc58bb815e18UL, 0x24f83fb4327e592bUL, 0xc6218ec65fdc43UL, },
		{ 0xd0b46cfd87e1a0f2UL, 0x297df4c31bd6b256UL, 0x733d74cacd053a66UL, 0x75c37080730f804UL, },
		{ 0x41adea7db1f6c05eUL, 0x7be5343f6ebd55d1UL, 0xf26b29360089e67bUL, 0xc634c80a9ead51UL, },
		{ 0x729ce0d9ff022cbaUL, 0xa87a9585af1d76d4UL, 0xa5fbbf5cdce63f73UL, 0x74fcae2a6498e72UL, },
		{ 0x83315a4563a7d652UL, 0x107c577cfd26c951UL, 0x1b373ea361d9b117UL, 0x78d815802a91d50UL, },
		{ 0x7deee72016ad09aUL, 0xb99bee72b7e85249UL, 0x6549ca5aecff1b20UL, 0x73ce68cb03993f4UL, },
		{ 0xaac2a83ee179e464UL, 0xc3d4ada39e658709UL, 0xccd3cf0c3fa5fde6UL, 0x7fb859978cf5fd3UL, },
		{ 0xaf3ed33f25c6be8cUL, 0x418f79cfc8d77c14UL, 0xc0f39573644c4612UL, 0x7ec437f4d16ab5aUL, },
		{ 0xd65525115858ae3aUL, 0x8054c96d9efaf6ffUL, 0x3b633927faddb589UL, 0x7ffeefd1f1ea4e6UL, },
		{ 0x49d6d7b01b023a36UL, 0xfbeb429aa4a11445UL, 0x52414bdb6e17d9a9UL, 0xd4dbd141b4f2ceUL, },
		{ 0x7506dc819a0f2448UL, 0x92d8ab706bf4b5b4UL, 0x8ce4690bdda3b99dUL, 0x77036015059513UL, },
		{ 0xd156807600c8eadeUL, 0x52737b87dc55a06aUL, 0xec7215bdfb7b1b89UL, 0x77460e65c089f4UL, },
		{ 0xf44dcab83ea54e96UL, 0xea25333524cc1d64UL, 0x9dc6b830b5484b4UL, 0xa7f3eb58e9740dUL, },
		{ 0xb1067d2338edb2c4UL, 0xea91fcd7a91767f2UL, 0xa4d3a5aa7da873e7UL, 0x74aa762e6109e5cUL, },
		{ 0xe7072dba6fc8347eUL, 0x7bdd8128686f1405UL, 0x4e05e9b6773f230UL, 0xd4dec4ad022aa7UL, },
		{ 0x9fd154b626a10c3aUL, 0xba02e1ee050e4d48UL, 0xbf7d2d98396d1cb5UL, 0x72a63e589e8e858UL, },
		{ 0xa8f2d1caff8aa280UL, 0x11a888e91d2cd6feUL, 0x9be3ee8c93cd494aUL, 0x61d372b9123a35UL, },
		{ 0xbca6c4864a9202f2UL, 0x38f240e081422e38UL, 0xf3c0bb7288a0c21aUL, 0x73de068916478baUL, },
		{ 0x6444115f1c8f86baUL, 0xa96ec5eb19eb907eUL, 0xa5fbf52046db4397UL, 0x75c360510906cf7UL, },
		{ 0x6eb5a9b63e51b48cUL, 0x7a37ebaa81546666UL, 0x72a496dc72651f66UL, 0x72a66e4b10ceab4UL, },
		{ 0xf48550c8b89ca4c8UL, 0xa9c15d247984b635UL, 0x93b5de0abd6d538bUL, 0xb163e1ccb99337UL, },
		{ 0x701dfefe9698c48UL, 0x918cd6d4e0cdbe8cUL, 0xd57bd5237624855UL, 0x61d721837ec718UL, },
		{ 0x2188cfb6282ac85eUL, 0x53a68c7aa95f0fccUL, 0x77ce934230e27323UL, 0x64eb58314c1d1cUL, },
		{ 0x2ef0571cda4e76d2UL, 0x18f483521ec18cdUL, 0xf5dd355fdae2f1UL, 0x7fead3200b86f91UL, },
		{ 0xb8972c8d1bc3dcd2UL, 0x3bc93369c27ca3b0UL, 0xdf873a8a65738215UL, 0x739cd6694c4f07aUL, },
		{ 0xc8cf679eda53c8deUL, 0x42abb0c6d4cc1367UL, 0x126163715479415UL, 0x57993db1aada0UL, },
		{ 0xdaeaff0581f05c52UL, 0x3bd2598da61592edUL, 0x7218e76139240d03UL, 0x739c627718ab303UL, },
		{ 0xd50d9f7e90b66ce4UL, 0xfa67d15ed0dbb9f9UL, 0xe47b4d488d8f20a8UL, 0x73888b9fdf58e2bUL, },
		{ 0x2cb032c065a49c0cUL, 0x52971afe8c65ec09UL, 0x37aff8658507b0b8UL, 0x788cc9287febb7dUL, },
		{ 0x16c3c74181d7f620UL, 0x108858135cafe878UL, 0xad58189337a1bba7UL, 0x726ba46583aa64UL, },
		{ 0x7986e9bf566a22f2UL, 0x11a2a4731dfc3ae0UL, 0x40a6ae5fde13f72aUL, 0x78c472f367f4f7cUL, },
		{ 0xb8972c8d1bc3dca0UL, 0x3bc93369c27ca3b0UL, 0xdf873a8a65738215UL, 0xd5cd6694c4f07aUL, },
		{ 0x5536db7f33cebefeUL, 0x4335be8d9199d6e9UL, 0x7709563a5b144792UL, 0x148bbdb181f401UL, },
		{ 0xf65acdc5e454c02cUL, 0x694543732a707ee4UL, 0x45b71f04bc23bdbbUL, 0x7590ab5f674087eUL, },
		{ 0x7986e9bf566a2280UL, 0x11a2a4731dfc3ae0UL, 0x40a6ae5fde13f72aUL, 0x6c472f367f4f7cUL, },
		{ 0xcdeacde84698f09aUL, 0xbf1c1950597b09a8UL, 0xd2eed843e3f88150UL, 0x7399f4f7a4eca56UL, },
		{ 0xb6cd66d48a406496UL, 0xe3bc558a5482017bUL, 0xbc80f61b2787b9b0UL, 0x9b156388d19cc8UL, },
		{ 0xe3fbbdabb98eda1aUL, 0xa089eb07c51bd792UL, 0xcb89a0217c93fe22UL, 0x74f9ede395068c9UL, },
		{ 0xafb7de6aa99792c4UL, 0x9aca3e1f5151d954UL, 0xcf9f400ed279fe17UL, 0x6c7222ecf9b4c52UL, },
		{ 0x7986e9bf566a22f2UL, 0x11a2a4731dfc3ae0UL, 0x40a6ae5fde13f72aUL, 0x7ec472f367f4f7cUL, },
		{ 0x0UL, 0x0UL, 0x0UL, 0x0UL, },
		{ 0xcf4b8f6bdc2a4616UL, 0xf21ef1f9497e3b9bUL, 0xfc265844f9944e9aUL, 0x77524cbeaed3b4UL, },
	};
	const mpfq_2_251_elt * ptr = t;
	unsigned int i,j;
	memset(r, 0, sizeof(mpfq_2_251_elt));
	for(i = 0 ; i < 4 ; i++) {
		mp_limb_t a = s[i];
		for(j = 0 ; j < 64 && ptr != &t[251]; j++, ptr++) {
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
	return ((s[3]>>57) ^ (s[3]>>55) ^ s[0]) & 1;
}

static inline
void mpfq_2_251_mul_ur(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt_ur t, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	/* kara e1=251 e2=251 slice=4 split=128 */
	mp_limb_t x1[2];
	mp_limb_t x2[2];
	x1[0] = s1[0] ^ s1[2];
	x2[0] = s2[0] ^ s2[2];
	x1[1] = s1[1] ^ s1[3];
	x2[1] = s2[1] ^ s2[3];
	mpfq_2_251_mul_basecase128x128s4X64x2(t,s1,s2);
	mpfq_2_251_mul_basecase123x123s4X64x2(t+2*2,s1+2,s2+2);
	t[2]  = t[4] = t[2] ^ t[4];
	t[2] ^= t[0];
	t[4] ^= t[6];
	t[3]  = t[5] = t[3] ^ t[5];
	t[3] ^= t[1];
	t[5] ^= t[7];
	mpfq_2_251_addmul_basecase128x128s4X64x2(t+2,x1,x2);
}

static inline
void mpfq_2_251_mul_basecase128x128s4X64x2(mpfq_2_251_dst_elt t, mpfq_2_251_src_elt s1, mpfq_2_251_src_elt s2)
{
	/* basecase e1=128 e2=128 slice=4 sse2=64x2 */
	typedef uint64_t v2di __attribute__ ((vector_size (16)));
	typedef long long gcc43bugfix __attribute__ ((vector_size (16)));
	typedef union { v2di s; mp_limb_t x[2]; } v2di_proxy;
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
	v2di b0 = (v2di) { s2[0], s2[1], };
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
	u = g[s1[0] >> 32 & 15];
	t0 ^= SHL(u, 32); t1 ^= SHR(u, 32);
	/* writing 64 at 0+36 from 64 */
	u = g[s1[0] >> 36 & 15];
	t0 ^= SHL(u, 36); t1 ^= SHR(u, 28);
	/* writing 64 at 0+40 from 64 */
	u = g[s1[0] >> 40 & 15];
	t0 ^= SHL(u, 40); t1 ^= SHR(u, 24);
	/* writing 64 at 0+44 from 64 */
	u = g[s1[0] >> 44 & 15];
	t0 ^= SHL(u, 44); t1 ^= SHR(u, 20);
	/* writing 64 at 0+48 from 64 */
	u = g[s1[0] >> 48 & 15];
	t0 ^= SHL(u, 48); t1 ^= SHR(u, 16);
	/* writing 64 at 0+52 from 64 */
	u = g[s1[0] >> 52 & 15];
	t0 ^= SHL(u, 52); t1 ^= SHR(u, 12);
	/* writing 64 at 0+56 from 64 */
	u = g[s1[0] >> 56 & 15];
	t0 ^= SHL(u, 56); t1 ^= SHR(u,  8);
	/* writing 64 at 0+60 from 64 */
	u = g[s1[0] >> 60 & 15];
	t0 ^= SHL(u, 60); t1 ^= SHR(u,  4);
	
	/* round 1 */
	/* writing 64 at 64+0 from 64 */
	u = g[s1[1]       & 15];
	t1 ^= u;
	/* writing 64 at 64+4 from 64 */
	u = g[s1[1] >>  4 & 15];
	t1 ^= SHL(u,  4); t2  = SHR(u, 60);
	/* writing 64 at 64+8 from 64 */
	u = g[s1[1] >>  8 & 15];
	t1 ^= SHL(u,  8); t2 ^= SHR(u, 56);
	/* writing 64 at 64+12 from 64 */
	u = g[s1[1] >> 12 & 15];
	t1 ^= SHL(u, 12); t2 ^= SHR(u, 52);
	/* writing 64 at 64+16 from 64 */
	u = g[s1[1] >> 16 & 15];
	t1 ^= SHL(u, 16); t2 ^= SHR(u, 48);
	/* writing 64 at 64+20 from 64 */
	u = g[s1[1] >> 20 & 15];
	t1 ^= SHL(u, 20); t2 ^= SHR(u, 44);
	/* writing 64 at 64+24 from 64 */
	u = g[s1[1] >> 24 & 15];
	t1 ^= SHL(u, 24); t2 ^= SHR(u, 40);
	/* writing 64 at 64+28 from 64 */
	u = g[s1[1] >> 28 & 15];
	t1 ^= SHL(u, 28); t2 ^= SHR(u, 36);
	/* writing 64 at 64+32 from 64 */
	u = g[s1[1] >> 32 & 15];
	t1 ^= SHL(u, 32); t2 ^= SHR(u, 32);
	/* writing 64 at 64+36 from 64 */
	u = g[s1[1] >> 36 & 15];
	t1 ^= SHL(u, 36); t2 ^= SHR(u, 28);
	/* writing 64 at 64+40 from 64 */
	u = g[s1[1] >> 40 & 15];
	t1 ^= SHL(u, 40); t2 ^= SHR(u, 24);
	/* writing 64 at 64+44 from 64 */
	u = g[s1[1] >> 44 & 15];
	t1 ^= SHL(u, 44); t2 ^= SHR(u, 20);
	/* writing 64 at 64+48 from 64 */
	u = g[s1[1] >> 48 & 15];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* writing 64 at 64+52 from 64 */
	u = g[s1[1] >> 52 & 15];
	t1 ^= SHL(u, 52); t2 ^= SHR(u, 12);
	/* writing 64 at 64+56 from 64 */
	u = g[s1[1] >> 56 & 15];
	t1 ^= SHL(u, 56); t2 ^= SHR(u,  8);
	/* writing 64 at 64+60 from 64 */
	u = g[s1[1] >> 60 & 15];
	t1 ^= SHL(u, 60); t2 ^= SHR(u,  4);
	/* end */
	
	/* repair steps */
	v2di v1 = (v2di) { s1[0], s1[0], };
	v2di v2 = (v2di) { s1[1], s1[1], };
	v2di w;
	v2di m = (v2di) { 0xeeeeeeeeeeeeeeeeUL, 0xeeeeeeeeeeeeeeeeUL, };
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
	}
	
	{
		v2di_proxy r;
		r.s = t2 ^ SHRD(t1, 64);
		t[2] = r.x[0];
		t[3] = r.x[1];
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
	typedef union { v2di s; mp_limb_t x[2]; } v2di_proxy;
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
	v2di b0 = (v2di) { s2[0], s2[1], };
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
	u = g[s1[0] >> 32 & 15];
	t0 ^= SHL(u, 32); t1 ^= SHR(u, 32);
	/* writing 64 at 0+36 from 64 */
	u = g[s1[0] >> 36 & 15];
	t0 ^= SHL(u, 36); t1 ^= SHR(u, 28);
	/* writing 64 at 0+40 from 64 */
	u = g[s1[0] >> 40 & 15];
	t0 ^= SHL(u, 40); t1 ^= SHR(u, 24);
	/* writing 64 at 0+44 from 64 */
	u = g[s1[0] >> 44 & 15];
	t0 ^= SHL(u, 44); t1 ^= SHR(u, 20);
	/* writing 64 at 0+48 from 64 */
	u = g[s1[0] >> 48 & 15];
	t0 ^= SHL(u, 48); t1 ^= SHR(u, 16);
	/* writing 64 at 0+52 from 64 */
	u = g[s1[0] >> 52 & 15];
	t0 ^= SHL(u, 52); t1 ^= SHR(u, 12);
	/* writing 64 at 0+56 from 64 */
	u = g[s1[0] >> 56 & 15];
	t0 ^= SHL(u, 56); t1 ^= SHR(u,  8);
	/* writing 64 at 0+60 from 64 */
	u = g[s1[0] >> 60 & 15];
	t0 ^= SHL(u, 60); t1 ^= SHR(u,  4);
	
	/* round 1 */
	/* writing 64 at 64+0 from 64 */
	u = g[s1[1]       & 15];
	t1 ^= u;
	/* writing 64 at 64+4 from 64 */
	u = g[s1[1] >>  4 & 15];
	t1 ^= SHL(u,  4); t2  = SHR(u, 60);
	/* writing 64 at 64+8 from 64 */
	u = g[s1[1] >>  8 & 15];
	t1 ^= SHL(u,  8); t2 ^= SHR(u, 56);
	/* writing 64 at 64+12 from 64 */
	u = g[s1[1] >> 12 & 15];
	t1 ^= SHL(u, 12); t2 ^= SHR(u, 52);
	/* writing 64 at 64+16 from 64 */
	u = g[s1[1] >> 16 & 15];
	t1 ^= SHL(u, 16); t2 ^= SHR(u, 48);
	/* writing 64 at 64+20 from 64 */
	u = g[s1[1] >> 20 & 15];
	t1 ^= SHL(u, 20); t2 ^= SHR(u, 44);
	/* writing 64 at 64+24 from 64 */
	u = g[s1[1] >> 24 & 15];
	t1 ^= SHL(u, 24); t2 ^= SHR(u, 40);
	/* writing 64 at 64+28 from 64 */
	u = g[s1[1] >> 28 & 15];
	t1 ^= SHL(u, 28); t2 ^= SHR(u, 36);
	/* writing 64 at 64+32 from 64 */
	u = g[s1[1] >> 32 & 15];
	t1 ^= SHL(u, 32); t2 ^= SHR(u, 32);
	/* writing 64 at 64+36 from 64 */
	u = g[s1[1] >> 36 & 15];
	t1 ^= SHL(u, 36); t2 ^= SHR(u, 28);
	/* writing 64 at 64+40 from 64 */
	u = g[s1[1] >> 40 & 15];
	t1 ^= SHL(u, 40); t2 ^= SHR(u, 24);
	/* writing 64 at 64+44 from 64 */
	u = g[s1[1] >> 44 & 15];
	t1 ^= SHL(u, 44); t2 ^= SHR(u, 20);
	/* writing 64 at 64+48 from 64 */
	u = g[s1[1] >> 48 & 15];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* writing 64 at 64+52 from 64 */
	u = g[s1[1] >> 52 & 15];
	t1 ^= SHL(u, 52); t2 ^= SHR(u, 12);
	/* writing 64 at 64+56 from 64 */
	u = g[s1[1] >> 56 & 7];
	t1 ^= SHL(u, 56); t2 ^= SHR(u,  8);
	/* end */
	
	/* repair steps */
	v2di v1 = (v2di) { s1[0], s1[0], };
	v2di v2 = (v2di) { s1[1], s1[1], };
	v2di w;
	v2di m = (v2di) { 0xeeeeeeeeeeeeeeeeUL, 0xeeeeeeeeeeeeeeeeUL, };
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
	}
	
	{
		v2di_proxy r;
		r.s = t2 ^ SHRD(t1, 64);
		t[2] = r.x[0];
		t[3] = r.x[1];
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
	typedef union { v2di s; mp_limb_t x[2]; } v2di_proxy;
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
	v2di b0 = (v2di) { s2[0], s2[1], };
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
	u = g[s1[0] >> 32 & 15];
	t0 ^= SHL(u, 32); t1 ^= SHR(u, 32);
	/* writing 64 at 0+36 from 64 */
	u = g[s1[0] >> 36 & 15];
	t0 ^= SHL(u, 36); t1 ^= SHR(u, 28);
	/* writing 64 at 0+40 from 64 */
	u = g[s1[0] >> 40 & 15];
	t0 ^= SHL(u, 40); t1 ^= SHR(u, 24);
	/* writing 64 at 0+44 from 64 */
	u = g[s1[0] >> 44 & 15];
	t0 ^= SHL(u, 44); t1 ^= SHR(u, 20);
	/* writing 64 at 0+48 from 64 */
	u = g[s1[0] >> 48 & 15];
	t0 ^= SHL(u, 48); t1 ^= SHR(u, 16);
	/* writing 64 at 0+52 from 64 */
	u = g[s1[0] >> 52 & 15];
	t0 ^= SHL(u, 52); t1 ^= SHR(u, 12);
	/* writing 64 at 0+56 from 64 */
	u = g[s1[0] >> 56 & 15];
	t0 ^= SHL(u, 56); t1 ^= SHR(u,  8);
	/* writing 64 at 0+60 from 64 */
	u = g[s1[0] >> 60 & 15];
	t0 ^= SHL(u, 60); t1 ^= SHR(u,  4);
	
	/* round 1 */
	/* writing 64 at 64+0 from 64 */
	u = g[s1[1]       & 15];
	t1 ^= u;
	/* writing 64 at 64+4 from 64 */
	u = g[s1[1] >>  4 & 15];
	t1 ^= SHL(u,  4); t2  = SHR(u, 60);
	/* writing 64 at 64+8 from 64 */
	u = g[s1[1] >>  8 & 15];
	t1 ^= SHL(u,  8); t2 ^= SHR(u, 56);
	/* writing 64 at 64+12 from 64 */
	u = g[s1[1] >> 12 & 15];
	t1 ^= SHL(u, 12); t2 ^= SHR(u, 52);
	/* writing 64 at 64+16 from 64 */
	u = g[s1[1] >> 16 & 15];
	t1 ^= SHL(u, 16); t2 ^= SHR(u, 48);
	/* writing 64 at 64+20 from 64 */
	u = g[s1[1] >> 20 & 15];
	t1 ^= SHL(u, 20); t2 ^= SHR(u, 44);
	/* writing 64 at 64+24 from 64 */
	u = g[s1[1] >> 24 & 15];
	t1 ^= SHL(u, 24); t2 ^= SHR(u, 40);
	/* writing 64 at 64+28 from 64 */
	u = g[s1[1] >> 28 & 15];
	t1 ^= SHL(u, 28); t2 ^= SHR(u, 36);
	/* writing 64 at 64+32 from 64 */
	u = g[s1[1] >> 32 & 15];
	t1 ^= SHL(u, 32); t2 ^= SHR(u, 32);
	/* writing 64 at 64+36 from 64 */
	u = g[s1[1] >> 36 & 15];
	t1 ^= SHL(u, 36); t2 ^= SHR(u, 28);
	/* writing 64 at 64+40 from 64 */
	u = g[s1[1] >> 40 & 15];
	t1 ^= SHL(u, 40); t2 ^= SHR(u, 24);
	/* writing 64 at 64+44 from 64 */
	u = g[s1[1] >> 44 & 15];
	t1 ^= SHL(u, 44); t2 ^= SHR(u, 20);
	/* writing 64 at 64+48 from 64 */
	u = g[s1[1] >> 48 & 15];
	t1 ^= SHL(u, 48); t2 ^= SHR(u, 16);
	/* writing 64 at 64+52 from 64 */
	u = g[s1[1] >> 52 & 15];
	t1 ^= SHL(u, 52); t2 ^= SHR(u, 12);
	/* writing 64 at 64+56 from 64 */
	u = g[s1[1] >> 56 & 15];
	t1 ^= SHL(u, 56); t2 ^= SHR(u,  8);
	/* writing 64 at 64+60 from 64 */
	u = g[s1[1] >> 60 & 15];
	t1 ^= SHL(u, 60); t2 ^= SHR(u,  4);
	/* end */
	
	/* repair steps */
	v2di v1 = (v2di) { s1[0], s1[0], };
	v2di v2 = (v2di) { s1[1], s1[1], };
	v2di w;
	v2di m = (v2di) { 0xeeeeeeeeeeeeeeeeUL, 0xeeeeeeeeeeeeeeeeUL, };
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
	}
	
	{
		v2di_proxy r;
		r.s = t2 ^ SHRD(t1, 64);
		t[2] ^= r.x[0];
		t[3] ^= r.x[1];
	}
#undef SHL
#undef SHR
#undef SHLD
#undef SHRD
}

static inline
void mpfq_2_251_sqr_ur(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt_ur t, mpfq_2_251_src_elt s)
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
	t[0] ^= u << 32;
		u = g[s[0] >> 24 & 255];
	t[0] ^= u << 48;
		u = g[s[0] >> 32 & 255];
	t[1]  = u;
		u = g[s[0] >> 40 & 255];
	t[1] ^= u << 16;
		u = g[s[0] >> 48 & 255];
	t[1] ^= u << 32;
		u = g[s[0] >> 56 & 255];
	t[1] ^= u << 48;
		u = g[s[1]       & 255];
	t[2]  = u;
		u = g[s[1] >>  8 & 255];
	t[2] ^= u << 16;
		u = g[s[1] >> 16 & 255];
	t[2] ^= u << 32;
		u = g[s[1] >> 24 & 255];
	t[2] ^= u << 48;
		u = g[s[1] >> 32 & 255];
	t[3]  = u;
		u = g[s[1] >> 40 & 255];
	t[3] ^= u << 16;
		u = g[s[1] >> 48 & 255];
	t[3] ^= u << 32;
		u = g[s[1] >> 56 & 255];
	t[3] ^= u << 48;
		u = g[s[2]       & 255];
	t[4]  = u;
		u = g[s[2] >>  8 & 255];
	t[4] ^= u << 16;
		u = g[s[2] >> 16 & 255];
	t[4] ^= u << 32;
		u = g[s[2] >> 24 & 255];
	t[4] ^= u << 48;
		u = g[s[2] >> 32 & 255];
	t[5]  = u;
		u = g[s[2] >> 40 & 255];
	t[5] ^= u << 16;
		u = g[s[2] >> 48 & 255];
	t[5] ^= u << 32;
		u = g[s[2] >> 56 & 255];
	t[5] ^= u << 48;
		u = g[s[3]       & 255];
	t[6]  = u;
		u = g[s[3] >>  8 & 255];
	t[6] ^= u << 16;
		u = g[s[3] >> 16 & 255];
	t[6] ^= u << 32;
		u = g[s[3] >> 24 & 255];
	t[6] ^= u << 48;
		u = g[s[3] >> 32 & 255];
	t[7]  = u;
		u = g[s[3] >> 40 & 255];
	t[7] ^= u << 16;
		u = g[s[3] >> 48 & 255];
	t[7] ^= u << 32;
		u = g[s[3] >> 56 & 7];
	t[7] ^= u << 48;
	}
}

static inline
void mpfq_2_251_reduce(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_dst_elt r, mpfq_2_251_dst_elt_ur t)
{
	{
		mp_limb_t s[5];
		/* 250 excess bits */
		{
			mp_limb_t z;
			z = t[0];
			s[0] = z;
			z = t[1];
			s[1] = z;
			z = t[2];
			s[2] = z;
			z = (t[3]) & 0x7ffffffffffffffUL;
			s[3] = z;
		}
		memset(s + 4, 0, 1 * sizeof(mp_limb_t));
		{
			mp_limb_t z;
			z = t[3] >> 59 ^ t[4] <<  5;
			s[0]^= z <<  7;
			s[0]^= z <<  4;
			s[0]^= z <<  2;
			s[0]^= z;
			z >>= 57;
			z^= t[4] >> 59 <<  7 ^ t[5] << 12;
			s[1]^= z;
			z >>= 3;
			z^= t[5] >> 52 << 61;
			s[1]^= z;
			z >>= 2;
			z^= t[5] >> 55 << 62;
			s[1]^= z;
			z >>= 2;
			z^= t[5] >> 57 << 62;
			s[1]^= z;
			z >>= 57;
			z^= t[5] >> 59 <<  7 ^ t[6] << 12;
			s[2]^= z;
			z >>= 3;
			z^= t[6] >> 52 << 61;
			s[2]^= z;
			z >>= 2;
			z^= t[6] >> 55 << 62;
			s[2]^= z;
			z >>= 2;
			z^= t[6] >> 57 << 62;
			s[2]^= z;
			z >>= 57;
			z^= t[6] >> 59 <<  7 ^ t[7] << 12;
			s[3]^= z;
			z >>= 3;
			z^= t[7] >> 52 << 61;
			s[3]^= z;
			z >>= 2;
			s[3]^= z;
			z >>= 2;
			s[3]^= z;
			z >>= 57;
			s[4]^= z;
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
			z = (s[3]) & 0x7ffffffffffffffUL;
			r[3] = z;
		}
		{
			mp_limb_t z;
			z = s[3] >> 59 ^ s[4] <<  5;
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
	return mpn_cmp(a, b, 4);
}

static inline
int mpfq_2_251_cmp_ui(mpfq_2_251_field_ptr K UNUSED_VARIABLE, mpfq_2_251_src_elt r, unsigned long x)
{
	int i;
	if (r[0] < (x & 1UL)) return -1;
	if (r[0] > (x & 1UL)) return 1;
	for(i = 1 ; i < 4 ; i++) {
		if (r[i]) return 1;
	}
	return 0;
}

#endif      /* GMP_LIMB_BITS == 64 */


#endif  /* MPFQ_2_251_H_ */

/* vim:set ft=cpp: */
