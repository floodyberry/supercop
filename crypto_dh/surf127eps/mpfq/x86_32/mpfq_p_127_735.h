/*
 * This file has been automatically generated, do not edit directly.
 * Calling function: FpGen::gen_gfp_k(127_735,4,9,735)
 */

#ifndef __MPFQ_P_127_735_H__ 
#define __MPFQ_P_127_735_H__ 
 
#include <gmp.h> 
#include "fixmp.h" 
#include "mpfq_p_common.h" 

/**** Typedefs ****/ 
 
// fields 
typedef mpfq_p_field mpfq_p_127_735_field; 
typedef mpfq_p_src_field mpfq_p_127_735_src_field; 
typedef mpfq_p_dst_field mpfq_p_127_735_dst_field; 
 
// elements 
typedef mp_limb_t mpfq_p_127_735_elt[4]; 
typedef mp_limb_t * mpfq_p_127_735_dst_elt; 
typedef const mp_limb_t * mpfq_p_127_735_src_elt; 
 
// unreduced elements 
typedef mp_limb_t mpfq_p_127_735_elt_ur[9]; 
typedef mp_limb_t * mpfq_p_127_735_dst_elt_ur; 
typedef const mp_limb_t * mpfq_p_127_735_src_elt_ur; 

/**** Prototypes ****/ 

// External --- functions for which a function call does not hurt 


void mpfq_p_127_735_field_tricks(mpfq_p_127_735_dst_field k, mp_limb_t flags);
void mpfq_p_127_735_field_clear(mpfq_p_127_735_dst_field k);
void mpfq_p_127_735_write(mpfq_p_127_735_src_field k, char *str, mpfq_p_127_735_src_elt x, int base);
int mpfq_p_127_735_read(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt x, const char *str, int base);
void mpfq_p_127_735_print(mpfq_p_127_735_src_field k, mpfq_p_127_735_src_elt x);
int mpfq_p_127_735_inv(mpfq_p_127_735_dst_field k, mpfq_p_127_735_dst_elt z, mpfq_p_127_735_src_elt x);
void mpfq_p_127_735_random(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r);
void mpfq_p_127_735_random2(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r);
void mpfq_p_127_735_field_init(mpfq_p_127_735_dst_field k, mp_limb_t *p);

// Inlined 


static inline void mpfq_p_127_735_init(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt * x);
static inline void mpfq_p_127_735_clear(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt * x);
static inline int mpfq_p_127_735_cmp(mpfq_p_127_735_src_field k, mpfq_p_127_735_src_elt x, mpfq_p_127_735_src_elt y);
static inline void mpfq_p_127_735_copy(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt x);
static inline void mpfq_p_127_735_add(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2);
static inline void mpfq_p_127_735_sub(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2);
static inline void mpfq_p_127_735_normalize(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt x);
static inline void mpfq_p_127_735_elt_ur_init(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt_ur * x);
static inline void mpfq_p_127_735_elt_ur_clear(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt_ur * x);
static inline void mpfq_p_127_735_elt_ur_copy(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt_ur x);
static inline void mpfq_p_127_735_mul_ur(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2);
static inline void mpfq_p_127_735_sqr_ur(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt s1);
static inline void mpfq_p_127_735_elt_ur_add(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt_ur s1, mpfq_p_127_735_src_elt_ur s2);
static inline void mpfq_p_127_735_elt_ur_sub(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt_ur s1, mpfq_p_127_735_src_elt_ur s2);
static inline void mpfq_p_127_735_mul(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2);
static inline void mpfq_p_127_735_sqr(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1);
static inline void mpfq_p_127_735_reduce(mpfq_p_127_735_src_field k, mp_limb_t *z, mp_limb_t *x);
static inline void mpfq_p_127_735_elt_ur_reduce(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_dst_elt_ur x);
#if defined(__x86_64__)
static inline void mpfq_p_127_735_hadamard(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt x, mpfq_p_127_735_dst_elt y, mpfq_p_127_735_dst_elt z, mpfq_p_127_735_dst_elt t);
#endif


/**** Definitions of inlined functions ****/ 


static inline void mpfq_p_127_735_init(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt * x) {
  assert (k); assert (k->p); assert (*x);
}

static inline void mpfq_p_127_735_clear(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt * x) {
  assert (*x);
}

static inline int mpfq_p_127_735_cmp(mpfq_p_127_735_src_field k, mpfq_p_127_735_src_elt x, mpfq_p_127_735_src_elt y) {
  return cmp_4(x, y);
}

static inline void mpfq_p_127_735_copy(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt x) {
  int i; 
  assert (r);
  assert (x);
  for (i = 0; i < 4; ++i)
    r[i] = x[i];
}

static inline void mpfq_p_127_735_add(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2) {
  add_4(r, s1, s2);
  if (cmp_4(r,k->p)>=0)
    sub_4(r, r, k->p);
} 

static inline void mpfq_p_127_735_sub(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2) {
  sub_4(r, s1, s2);
  if (r[4-1]>>(GMP_LIMB_BITS-1)) // negative result
    add_4(r, r, k->p);
}

static inline void mpfq_p_127_735_normalize(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt x) {
  if (cmp_4(x,k->p)>=0) {
    mp_limb_t q[4+1];
    mpfq_p_127_735_elt r;

    mpn_tdiv_qr(q, r, 0, x, 4, k->p, 4);
    mpfq_p_127_735_copy(k, x, r);
  }
}

static inline void mpfq_p_127_735_elt_ur_init(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt_ur * x) {
  assert (k); assert (k->p); assert (*x);
}

static inline void mpfq_p_127_735_elt_ur_clear(mpfq_p_127_735_src_field k, mpfq_p_127_735_elt_ur * x) {
  assert (*x);
}

static inline void mpfq_p_127_735_elt_ur_copy(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt_ur x) {
  int i; 
  assert (r);
  assert (x);
  for (i = 0; i < 9; ++i)
    r[i] = x[i];
}

static inline void mpfq_p_127_735_mul_ur(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2) {
  mul_4(r, s1, s2);
  r[9-1] = 0UL;
}

static inline void mpfq_p_127_735_sqr_ur(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt s1) {
  sqr_4(r, s1);
  r[9-1] = 0UL;
}

static inline void mpfq_p_127_735_elt_ur_add(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt_ur s1, mpfq_p_127_735_src_elt_ur s2) {
  mpn_add_n(r, s1, s2, 9);
} 

static inline void mpfq_p_127_735_elt_ur_sub(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt_ur r, mpfq_p_127_735_src_elt_ur s1, mpfq_p_127_735_src_elt_ur s2) {
  mpn_sub_n(r, s1, s2, 9);
}

static inline void mpfq_p_127_735_mul(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1, mpfq_p_127_735_src_elt s2){
#ifndef __x86_64__
  mp_limb_t tmp[2*4];
  mul_4(tmp, s1, s2);
  mpfq_p_127_735_reduce(k, r, tmp);
#else
    __asm__ volatile (
      "	### MUL_2 of s1 and s2\n"
      "	movq	%1, %%rax\n"
      "	movq	%2, %%rdx\n"
      "	movq	(%%rax), %%r12\n"
      "	movq	8(%%rax), %%r13\n"
      "	movq	%%r12, %%rax\n"
      "	movq	(%%rdx), %%r14\n"
      "	movq	8(%%rdx), %%r15\n"
      "	### x*y[0]\n"
      " mulq	%%r14\n"
      "	movq	%%rax, %%r8\n"
      "	movq	%%r13, %%rax\n"
      "	movq	%%rdx, %%rcx\n"
      "	mulq	%%r14\n"
      "	addq	%%rax, %%rcx\n"
      "	movq	%%r12, %%rax\n"
      "	adcq	$0, %%rdx\n"
      "	movq	%%rcx, %%r9\n"
      " movq	%%rdx, %%r10\n"
      "	### x*y[1]\n"
      " mulq	%%r15\n"
      "	addq	%%rax, %%r9\n"
      "	movq	%%r13, %%rax\n"
      "	adcq	$0, %%rdx\n"
      "	movq	%%rdx, %%rcx\n"
      "	mulq	%%r15\n"
      "	addq	%%rax, %%rcx\n"
   "	movq	$1470, %%r15\n"
      "	adcq	$0, %%rdx\n"
      "	addq	%%rcx, %%r10\n"
      " adcq	$0, %%rdx\n"
      "	movq	%%rdx, %%r11\n"

      " ### Start of reduction. z is in [r8,r9,r10,r11].\n"
      "	### Copy x into [r8,r9,rdx] and do addmul1_2\n"
   "	movq	%%r10, %%rax\n"
   "	mulq	%%r15\n"
   "	addq	%%rax, %%r8\n"
   "	movq	%%r11, %%rax\n"
   "	adcq	$0, %%rdx\n"
   "	movq	%%rdx, %%r14\n"
   "	mulq	%%r15\n"
   "	addq	%%rax, %%r14\n"
   "	adcq	$0, %%rdx\n"
   "	addq	%%r14, %%r9\n"
   "	movq	$9223372036854775807, %%r11\n"
   "	adcq	$0, %%rdx\n"
   
   "	### At this point [r8,r9,rdx] contains (semireduced) x\n"
   "	movq	%%r9, %%r13\n"
   "	movq	$735, %%rax\n"
   "	shlq	$1, %%rdx\n"
   "	shrq	$63, %%r9\n"
   "	orq 	%%r9, %%rdx\n"
   "	andq	%%r11, %%r13\n"
   "	movq	%0, %%r9\n"
   "	mulq	%%rdx\n"
   "	addq	%%rax, %%r8\n"
   "	movq	%%r8, (%%r9)\n"
   "	adcq	$0, %%r13\n"
   "	movq	%%r13, 8(%%r9)\n"
      : "+m" (r)
      : "m" (s1), "m" (s2)
      : "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "memory");
#endif
}

static inline void mpfq_p_127_735_sqr(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_src_elt s1){
#ifndef __x86_64__
  mp_limb_t tmp[2*4];
  sqr_4(tmp, s1);
  mpfq_p_127_735_reduce(k, r, tmp);
#else
   __asm__ volatile (
      "	### SQR_2 of s1\n"
      "	movq	%1, %%rdx\n"
      "	movq	(%%rdx), %%r12\n"
      "	movq	%%r12, %%rax\n"
      "	movq	8(%%rdx), %%r13\n"
      "	mulq	%%rax\n"
      "	movq	%%rax, %%r8\n"
      "	movq	%%r13, %%rax\n"
      "	movq	%%rdx, %%r9\n"
      "	mulq	%%rax\n"
      "	movq	%%rax, %%r10\n"
      "	movq	%%r12, %%rax\n"
      "	movq	%%rdx, %%r11\n"
      "	mulq	%%r13\n"
      "	addq	%%rax, %%r9\n"
      "	adcq	%%rdx, %%r10\n"
      "	adcq	$0, %%r11\n"
      "	addq	%%rax, %%r9\n"
      "	adcq	%%rdx, %%r10\n"
      "	adcq	$0, %%r11\n"

      " ### Start of reduction. z is in [r8,r9,r10,r11].\n"
      "	### Copy x into [r8,r9,rdx] and do addmul1_2\n"
   "	movq	%%r10, %%rax\n"
   "	mulq	%%r12\n"
   "	addq	%%rax, %%r8\n"
   "	movq	%%r11, %%rax\n"
   "	adcq	$0, %%rdx\n"
   "	movq	%%rdx, %%r12\n"
   "	mulq	%%r13\n"
   "	addq	%%rax, %%r12\n"
   "	adcq	$0, %%rdx\n"
   "	addq	%%r12, %%r9\n"
   "	movq	$9223372036854775807, %%r11\n"
   "	adcq	$0, %%rdx\n"
   
   "	### At this point [r8,r9,rdx] contains (semireduced) x\n"
   "	movq	%%r9, %%r13\n"
   "	movq	$735, %%rax\n"
   "	shlq	$1, %%rdx\n"
   "	shrq	$63, %%r9\n"
   "	orq 	%%r9, %%rdx\n"
   "	andq	%%r11, %%r13\n"
   "	movq	%0, %%r9\n"
   "	mulq	%%rdx\n"
   "	addq	%%rax, %%r8\n"
   "	movq	%%r8, (%%r9)\n"
   "	adcq	$0, %%r13\n"
   "	movq	%%r13, 8(%%r9)\n"
      : "+m" (r)
      : "m" (s1)
      : "%rax", "%rdx", "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "memory");


#endif

}

static inline void mpfq_p_127_735_reduce(mpfq_p_127_735_src_field k, mp_limb_t *z, mp_limb_t *x){
#ifndef __x86_64__
  mp_limb_t tmp[4+1];
  mp_limb_t c;
  int i;
  for (i = 0; i < 4; ++i)
    tmp[i] = x[i];
  tmp[4] = 0UL;
  addmul1_4(tmp, x+4, (735UL)<<1);
  
  c = (tmp[4] << 1) | (tmp[4-1] >> (GMP_LIMB_BITS-1));
  c *= 735UL;

  tmp[4-1] &= ((-1UL) >> 1);  // kill last bit.
  c = mpn_add_1(z, tmp, 4, c);
  assert (c == 0UL);
#else
  __asm__ volatile (
   "	### Copy x into [r8,r9,rdx] and do addmul1_2\n"
   "	movq	%1, %%r13\n"
   "	movq	(%%r13), %%r8\n"
   "	movq	8(%%r13), %%r9\n"
   "	movq	16(%%r13), %%rax\n"
   "	movq	$1470, %%r11\n"
   "	mulq	%%r11\n"
   "	addq	%%rax, %%r8\n"
   "	movq	24(%%r13), %%rax\n"
   "	adcq	$0, %%rdx\n"
   "	movq	%%rdx, %%r13\n"
   "	mulq	%%r11\n"
   "	addq	%%rax, %%r13\n"
   "	adcq	$0, %%rdx\n"
   "	addq	%%r13, %%r9\n"
   "	movq	$9223372036854775807, %%r11\n"
   "	adcq	$0, %%rdx\n"
   
   "	### At this point [r8,r9,rdx] contains (semireduced) x\n"
   "	movq	%%r9, %%r13\n"
   "	movq	$735, %%rax\n"
   "	shlq	$1, %%rdx\n"
   "	shrq	$63, %%r9\n"
   "	orq 	%%r9, %%rdx\n"
   "	andq	%%r11, %%r13\n"
   "	movq	%0, %%r9\n"
   "	mulq	%%rdx\n"
   "	addq	%%rax, %%r8\n"
   "	movq	%%r8, (%%r9)\n"
   "	adcq	$0, %%r13\n"
   "	movq	%%r13, 8(%%r9)\n"
  : "+m" (z)
  : "m" (x)
  : "%rax", "%rdx", "%r8", "%r9", "%r11", "%r13", "memory");
#endif
  if (cmp_4(z,k->p)>=0)
    sub_4(z, z, k->p);
}

static inline void mpfq_p_127_735_elt_ur_reduce(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt r, mpfq_p_127_735_dst_elt_ur x) {
  mp_limb_t q[9+1];
  // TODO: That one can be very much optimized!
  if (x[9-1]>>(GMP_LIMB_BITS-1)) {
    // negative number, add bigmul_p to make it positive before reduction
    mpn_add_n(x, x, k->bigmul_p, 9);
  }
  mpn_tdiv_qr(q, r, 0, x, 9, k->p, 4);
}

#if defined(__x86_64__)
static inline void mpfq_p_127_735_hadamard(mpfq_p_127_735_src_field k, mpfq_p_127_735_dst_elt x, mpfq_p_127_735_dst_elt y, mpfq_p_127_735_dst_elt z, mpfq_p_127_735_dst_elt t)
#define HAS_NATIVE_HADAMARD
{
  __asm__ volatile (
   "	movq	%0, %%rcx\n"
   "	movq	(%%rcx), %%r8\n"
   "	movq	8(%%rcx), %%r9\n"
   "	movq	%1, %%rcx\n"
   "	movq	(%%rcx), %%r10\n"
   "	movq	8(%%rcx), %%r11\n"
   "	movq	%2, %%rcx\n"
   "	movq	(%%rcx), %%r12\n"
   "	movq	8(%%rcx), %%r13\n"
   "	movq	%3, %%rcx\n"
   "	movq	(%%rcx), %%r14\n"
   "	movq	8(%%rcx), %%r15\n"
   "	movq	%4, %%rcx\n"
   "	movq	(%%rcx), %%rax\n"
   "	movq	8(%%rcx), %%rbx\n"
   "	######## Begining of SubAdd\n"
   "	movq	%%r8, %%rcx\n"
   "	movq	%%r9, %%rdx\n"
   "	xorq	%%rsi, %%rsi\n"
   "	xorq	%%rdi, %%rdi\n"
   "	### Subtract B to A\n"
   "	subq	%%r10, %%r8\n"
   "	sbbq	%%r11, %%r9\n"
   "	cmovc	%%rax, %%rsi\n"
   "	cmovc	%%rbx, %%rdi\n"
   "	### Add P or 0 according to carry\n"
   "	addq	%%rsi, %%r8\n"
   "	adcq	%%rdi, %%r9\n"
   "	### End of sub.\n"
   "	### Add A to B\n"
   "	addq	%%rcx, %%r10\n"
   "	adcq	%%rdx, %%r11\n"
   "	movq	%%r10, %%rsi\n"
   "	movq	%%r11, %%rdi\n"
   "	### Subtract P\n"
   "	subq	%%rax, %%r10\n"
   "	sbbq	%%rbx, %%r11\n"
   "	### Choose output according to carry\n"
   "	cmovc	%%rsi, %%r10\n"
   "	cmovc	%%rdi, %%r11\n"
   "	######## Begining of SubAdd\n"
   "	movq	%%r12, %%rcx\n"
   "	movq	%%r13, %%rdx\n"
   "	xorq	%%rsi, %%rsi\n"
   "	xorq	%%rdi, %%rdi\n"
   "	### Subtract B to A\n"
   "	subq	%%r14, %%r12\n"
   "	sbbq	%%r15, %%r13\n"
   "	cmovc	%%rax, %%rsi\n"
   "	cmovc	%%rbx, %%rdi\n"
   "	### Add P or 0 according to carry\n"
   "	addq	%%rsi, %%r12\n"
   "	adcq	%%rdi, %%r13\n"
   "	### End of sub.\n"
   "	### Add A to B\n"
   "	addq	%%rcx, %%r14\n"
   "	adcq	%%rdx, %%r15\n"
   "	movq	%%r14, %%rsi\n"
   "	movq	%%r15, %%rdi\n"
   "	### Subtract P\n"
   "	subq	%%rax, %%r14\n"
   "	sbbq	%%rbx, %%r15\n"
   "	### Choose output according to carry\n"
   "	cmovc	%%rsi, %%r14\n"
   "	cmovc	%%rdi, %%r15\n"
   "	######## Begining of SubAdd\n"
   "	movq	%%r10, %%rcx\n"
   "	movq	%%r11, %%rdx\n"
   "	xorq	%%rsi, %%rsi\n"
   "	xorq	%%rdi, %%rdi\n"
   "	### Subtract B to A\n"
   "	subq	%%r14, %%r10\n"
   "	sbbq	%%r15, %%r11\n"
   "	cmovc	%%rax, %%rsi\n"
   "	cmovc	%%rbx, %%rdi\n"
   "	### Add P or 0 according to carry\n"
   "	addq	%%rsi, %%r10\n"
   "	adcq	%%rdi, %%r11\n"
   "	### End of sub.\n"
   "	### Add A to B\n"
   "	addq	%%rcx, %%r14\n"
   "	adcq	%%rdx, %%r15\n"
   "	movq	%%r14, %%rsi\n"
   "	movq	%%r15, %%rdi\n"
   "	### Subtract P\n"
   "	subq	%%rax, %%r14\n"
   "	sbbq	%%rbx, %%r15\n"
   "	### Choose output according to carry\n"
   "	cmovc	%%rsi, %%r14\n"
   "	cmovc	%%rdi, %%r15\n"
   "	######## Begining of SubAdd\n"
   "	movq	%%r8, %%rcx\n"
   "	movq	%%r9, %%rdx\n"
   "	xorq	%%rsi, %%rsi\n"
   "	xorq	%%rdi, %%rdi\n"
   "	### Subtract B to A\n"
   "	subq	%%r12, %%r8\n"
   "	sbbq	%%r13, %%r9\n"
   "	cmovc	%%rax, %%rsi\n"
   "	cmovc	%%rbx, %%rdi\n"
   "	### Add P or 0 according to carry\n"
   "	addq	%%rsi, %%r8\n"
   "	adcq	%%rdi, %%r9\n"
   "	### End of sub.\n"
   "	### Add A to B\n"
   "	addq	%%rcx, %%r12\n"
   "	adcq	%%rdx, %%r13\n"
   "	movq	%%r12, %%rsi\n"
   "	movq	%%r13, %%rdi\n"
   "	### Subtract P\n"
   "	subq	%%rax, %%r12\n"
   "	sbbq	%%rbx, %%r13\n"
   "	### Choose output according to carry\n"
   "	cmovc	%%rsi, %%r12\n"
   "	cmovc	%%rdi, %%r13\n"
   "	movq	%3, %%rcx\n"
   "	movq	%%r8, (%%rcx)\n"
   "	movq	%%r9, 8(%%rcx)\n"
   "	movq	%1, %%rcx\n"
   "	movq	%%r10, (%%rcx)\n"
   "	movq	%%r11, 8(%%rcx)\n"
   "	movq	%2, %%rcx\n"
   "	movq	%%r12, (%%rcx)\n"
   "	movq	%%r13, 8(%%rcx)\n"
   "	movq	%0, %%rcx\n"
   "	movq	%%r14, (%%rcx)\n"
   "	movq	%%r15, 8(%%rcx)\n"
  : "+m" (x), "+m" (y), "+m" (z), "+m" (t)
  : "m" (k->p)
  : "%rax", "%rbx", "%rcx", "%rdx", "%rsi", "%rdi", "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "memory");
}

#endif


#endif /* __MPFQ_P_127_735_H__ */ 
