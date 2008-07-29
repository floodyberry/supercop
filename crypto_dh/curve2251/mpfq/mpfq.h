#ifndef MPFQ_H_
#define MPFQ_H_

/* This header contains common declarations used by mpfq modules */

#include <gmp.h>

#ifdef __cplusplus
extern "C" {
#endif

#define BUILD_BITMASK(x) ((x) == GMP_LIMB_BITS ? ((mp_limb_t) - 1) : (~ - ((mp_limb_t) 1 << (x))))

/* typedef unsigned long ulong; */

#ifdef  __GNUC__

#define clzl(x)         __builtin_clzl(x)
#define ctzl(x)         __builtin_ctzl(x)
#define parityl(x)      __builtin_parityl(x)
#ifndef	UNUSED_VARIABLE
#define	UNUSED_VARIABLE	__attribute__((unused))
#endif

#ifndef __cplusplus
#ifndef max
#define max(a,b) \
       ({ typeof (a) _a = (a); \
           typeof (b) _b = (b); \
         _a > _b ? _a : _b; })
#endif

#ifndef min
#define min(a,b) \
       ({ typeof (a) _a = (a); \
           typeof (b) _b = (b); \
         _a > _b ? _b : _a; })
#endif
#endif	/* __cplusplus */

#ifndef	EXPECT_FALSE
#define	EXPECT_FALSE(x)	__builtin_expect(x, 0)
#endif
#ifndef	EXPECT_TRUE
#define	EXPECT_TRUE(x)	__builtin_expect(x, 1)
#endif

#else

#ifndef	UNUSED_VARIABLE
#define	UNUSED_VARIABLE	/**/
#endif

/* provide slow fallbacks */
static inline int clzl(unsigned long x)
{
        static const int t[4] = { 2, 1, 0, 0 };
        int a = 0;
        int res;
#if (GMP_LIMB_BITS == 64)
        if (x >> 32) { a += 32; x >>= 32; }
#endif  
        if (x >> 16) { a += 16; x >>= 16; }
        if (x >>  8) { a +=  8; x >>=  8; }
        if (x >>  4) { a +=  4; x >>=  4; }
        if (x >>  2) { a +=  2; x >>=  2; }
        res = GMP_LIMB_BITS - 2 - a + t[x];
        return res;
}
static inline int ctzl(unsigned long x)
{
	return GMP_LIMB_BITS - clzl(x & - x);
}
static inline int parityl(unsigned long x)
{
	static const int t[4] = { 0, 1, 1, 0, };
#if (GMP_LIMB_BITS == 64)
	x ^= (x >> 32);
#endif
	x ^= (x >> 16);
	x ^= (x >>  8);
	x ^= (x >>  4);
	x ^= (x >>  2);
	return t[x & 3UL];
}

#ifndef __cplusplus
#ifndef max
#define max(a,b) ((a) > (b) ? (a) : (b))
#endif
#ifndef min
#define min(a,b) ((a) < (b) ? (a) : (b))
#endif
#endif	/* __cplusplus */

#ifndef	EXPECT_FALSE
#define	EXPECT_FALSE(x)	(x)
#endif
#ifndef	EXPECT_TRUE
#define	EXPECT_TRUE(x)	(x)
#endif

#endif	/* __GNUC__ */

static inline int clzlx(unsigned long * x, int n)
{
	int r = 0;
	for( ; n > 0 && EXPECT_FALSE(!x[n-1]) ; --n) r+=GMP_LIMB_BITS;
	if (n == 0) return r;
	r += clzl(x[n-1]);
	return r;
}
static inline int ctzlx(unsigned long * x, int n)
{
	int r = 0;
	for( ; n > 0 && EXPECT_FALSE(!*x) ; --n,++x) r+=GMP_LIMB_BITS;
	if (n == 0) return r;
	r += ctzl(*x);
	return r;
}


#ifdef __cplusplus
}
#endif

#endif	/* MPFQ_H_ */
