/*
  Prototypes for mp.h
  The functions are implemented in a separate .h file that depends on the architecture.

  NB: For all these functions, overlaps are not allowed, but pointer aliasing is ok.
  (i.e. x == z, or even x==y==z)
*/

#ifndef _MP_H_
#define _MP_H_

#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include <gmp-impl.h>
#include <longlong.h>
#include <assert.h>

/*
FUNCTION: void addmul1_k(mp_limb_t *z, mp_limb_t *x, mp_limb_t c)
  Multiplies the limb c to x and adds the result in z.
  x has k limbs,
  z has k+1 limbs.
  The potential carry is lost (better have z[k]=0 !!!)
*/
static void addmul1_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);
static void addmul1_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c);

/*
FUNCTION: void add_k(mp_limb_t *z, mp_limb_t *x, mp_limb_t *y)
  Adds y to x and put the result in z.
  x,y and z have k limbs.
  The potential carry is lost.
*/
static void add_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void add_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);

#if 0
/*
FUNCTION: void add_inplace_k(mp_limb_t *z, mp_limb_t *x)
  Adds z to x, and put the result in z.
  x and z have k limbs.
  The potential carry is lost.
*/
static void add_inplace_1(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_2(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_3(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_4(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_5(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_6(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_7(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_8(mp_limb_t *z, const mp_limb_t *x);
static void add_inplace_9(mp_limb_t *z, const mp_limb_t *x);
#endif

/*
FUNCTION: void sub_k(mp_limb_t *z, mp_limb_t *x, mp_limb_t *y)
  Subtracts y to x and put the result in z.
  x,y and z have k limbs.
  The potential carry is lost (hence, be sure that x>=y).
*/
static void sub_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void sub_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);

/*
FUNCTION: void mul_k(mp_limb_t *z, mp_limb_t *x, mp_limb_t *y)
  Multiply x and y and put the result in z.
  x and y  have k limbs.
  z has 2*k limbs.
*/
static void mul_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void mul_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);

/*
FUNCTION: void sqr_k(mp_limb_t *z, mp_limb_t *x)
  Square x and put the result in z.
  x has k limbs.
  z has 2*k limbs.
*/
static void sqr_1(mp_limb_t *z, const mp_limb_t *x);
static void sqr_2(mp_limb_t *z, const mp_limb_t *x);
static void sqr_3(mp_limb_t *z, const mp_limb_t *x);
static void sqr_4(mp_limb_t *z, const mp_limb_t *x);
static void sqr_5(mp_limb_t *z, const mp_limb_t *x);
static void sqr_6(mp_limb_t *z, const mp_limb_t *x);
static void sqr_7(mp_limb_t *z, const mp_limb_t *x);
static void sqr_8(mp_limb_t *z, const mp_limb_t *x);
static void sqr_9(mp_limb_t *z, const mp_limb_t *x);

/*
FUNCTION: void shortmul_k(mp_limb_t *z, mp_limb_t *x, mp_limb_t *y)
  Multiply x and y and put the truncated result in z.
  x and y  have k limbs.
  z has k limbs.
*/
static void shortmul_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);
static void shortmul_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y);

/*
FUNCTION: void mod_k(mp_limb_t *z, mp_limb_t *x, mp_limb_t *p)
  Reduce x modulo p and put the result in z.
  p has k limbs, and x has 2*k limbs. Furthermore, p[k-1]!=0.
  z has k limbs.
*/
static void mod_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mod_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);

/*
FUNCTION: int cmp_k(mp_limb_t *x, mp_limb_t *y)
  Compares x and y and returns the result:
    0   if x==y
    1   if x>y
    -1  if x<y
  x and y have k limbs. 
*/
static int cmp_1(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_2(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_3(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_4(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_5(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_6(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_7(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_8(const mp_limb_t *x, const mp_limb_t *y);
static int cmp_9(const mp_limb_t *x, const mp_limb_t *y);

/*
FUNCTIONS:
  void lshift_k(mp_limb_t *z, int cnt)
  void rshift_k(mp_limb_t *z, int cnt)
  void long_lshift_k(mp_limb_t *z, int offset, int cnt)
  void long_rshift_k(mp_limb_t *z, int offset, int cnt)
  z has k limbs. cnt is in [0, GMP_NUMB_BITS[.
  shifts z by (offset*GMP_NUMB_BITS)+cnt bits, in place.
  The result is put in the k limbs of z, and the bits that are shifted out are lost.
*/
static void lshift_1(mp_limb_t *z, int cnt);
static void lshift_2(mp_limb_t *z, int cnt);
static void lshift_3(mp_limb_t *z, int cnt);
static void lshift_4(mp_limb_t *z, int cnt);
static void lshift_5(mp_limb_t *z, int cnt);
static void lshift_6(mp_limb_t *z, int cnt);
static void lshift_7(mp_limb_t *z, int cnt);
static void lshift_8(mp_limb_t *z, int cnt);
static void lshift_9(mp_limb_t *z, int cnt);

static void rshift_1(mp_limb_t *z, int cnt);
static void rshift_2(mp_limb_t *z, int cnt);
static void rshift_3(mp_limb_t *z, int cnt);
static void rshift_4(mp_limb_t *z, int cnt);
static void rshift_5(mp_limb_t *z, int cnt);
static void rshift_6(mp_limb_t *z, int cnt);
static void rshift_7(mp_limb_t *z, int cnt);
static void rshift_8(mp_limb_t *z, int cnt);
static void rshift_9(mp_limb_t *z, int cnt);

static void long_lshift_1(mp_limb_t *z, int offset, int cnt);
static void long_lshift_2(mp_limb_t *z, int offset, int cnt);
static void long_lshift_3(mp_limb_t *z, int offset, int cnt);
static void long_lshift_4(mp_limb_t *z, int offset, int cnt);
static void long_lshift_5(mp_limb_t *z, int offset, int cnt);
static void long_lshift_6(mp_limb_t *z, int offset, int cnt);
static void long_lshift_7(mp_limb_t *z, int offset, int cnt);
static void long_lshift_8(mp_limb_t *z, int offset, int cnt);
static void long_lshift_9(mp_limb_t *z, int offset, int cnt);

static void long_rshift_1(mp_limb_t *z, int offset, int cnt);
static void long_rshift_2(mp_limb_t *z, int offset, int cnt);
static void long_rshift_3(mp_limb_t *z, int offset, int cnt);
static void long_rshift_4(mp_limb_t *z, int offset, int cnt);
static void long_rshift_5(mp_limb_t *z, int offset, int cnt);
static void long_rshift_6(mp_limb_t *z, int offset, int cnt);
static void long_rshift_7(mp_limb_t *z, int offset, int cnt);
static void long_rshift_8(mp_limb_t *z, int offset, int cnt);
static void long_rshift_9(mp_limb_t *z, int offset, int cnt);

/*
FUNCTION: void redc_k(mp_limb_t *z, mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p)
  REDC computation: divide x by R modulo p, where R is 2^(k*GMP_LIMB_BITS).
  p has k limbs, and x has 2*k limbs. Furthermore, p[k-1]!=0.
  z has k limbs.
  mip has k limbs and is -1/p mod R.
*/
static void redc_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);
static void redc_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p);

/* 
FUNCTION: void mgy_encode_k(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
  Put in z the encoded representation of x mod p:
    z := x*R mod p, where R is 2^(k*GMP_LIMB_BITS)
  z, x and p have k limbs.
*/
static void mgy_encode_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);
static void mgy_encode_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p);

/* 
FUNCTION: void mgy_decode_k(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p)
  Put in z the decoded representation of x mod p:
    z := x/R mod p, where R is 2^(k*GMP_LIMB_BITS)
  z, x, invR and p have k limbs.
  invR should contain 1/R mod p.
*/
static void mgy_decode_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);
static void mgy_decode_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p);



/* Load architecture-specific definitions */
#ifdef __x86_64__
# include "fixmp_x86_64.h"
#endif

#if (defined (__i386__) || defined (__i486__))
# include "fixmp_x86_32.h"
#endif

/* Complete missing definitions with generic functions based on longlong.h */

#include "fixmp_longlong.h"

#endif /* _MP_H_ */
