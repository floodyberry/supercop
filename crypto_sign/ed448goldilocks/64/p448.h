/* Copyright (c) 2014 Cryptography Research, Inc.
 * Released under the MIT License.  See LICENSE.txt for license information.
 */
#ifndef __P448_H__
#define __P448_H__ 1

#include <stdint.h>
#include <assert.h>
#include <string.h>

#include "word.h"

typedef struct p448_t {
  uint64_t limb[8];
} __attribute__((aligned(32))) p448_t;

#ifdef __cplusplus
extern "C" {
#endif

static __inline__ void
p448_set_ui (
    p448_t *out,
    uint64_t x
) __attribute__((unused));
           
static __inline__ void
p448_cond_swap (
    p448_t *a,
    p448_t *b,
    mask_t do_swap
) __attribute__((unused));

static __inline__ void
p448_add (
    p448_t *out,
    const p448_t *a,
    const p448_t *b
) __attribute__((unused));
             
static __inline__ void
p448_sub (
    p448_t *out,
    const p448_t *a,
    const p448_t *b
) __attribute__((unused));
             
static __inline__ void
p448_neg (
    p448_t *out,
    const p448_t *a
) __attribute__((unused));
            
static __inline__ void
p448_cond_neg (
    p448_t *a,
    mask_t doNegate
) __attribute__((unused));

static __inline__ void
p448_addw (
    p448_t *a,
    uint64_t x
) __attribute__((unused));
             
static __inline__ void
p448_subw (
    p448_t *a,
    uint64_t x
) __attribute__((unused));
             
static __inline__ void
p448_copy (
    p448_t *out,
    const p448_t *a
) __attribute__((unused));
             
static __inline__ void
p448_weak_reduce (
    p448_t *inout
) __attribute__((unused));
             
void
p448_strong_reduce (
    p448_t *inout
);

mask_t
p448_is_zero (
    const p448_t *in
);

static __inline__ void
p448_bias (
    p448_t *inout,
    int amount
) __attribute__((unused));

static __inline__ void
p448_really_bias (
    p448_t *inout,
    int amount
) __attribute__((unused));
         
void
p448_mul (
    p448_t *__restrict__ out,
    const p448_t *a,
    const p448_t *b
);

void
p448_mulw (
    p448_t *__restrict__ out,
    const p448_t *a,
    uint64_t b
);

void
p448_sqr (
    p448_t *__restrict__ out,
    const p448_t *a
);
         
static __inline__ void
p448_sqrn (
    p448_t *__restrict__ y,
    const p448_t *x,
    int n
) __attribute__((unused));

void
p448_serialize (
    uint8_t *serial,
    const struct p448_t *x
);

mask_t
p448_deserialize (
    p448_t *x,
    const uint8_t serial[56]
);
    
static __inline__ void
p448_mask(
    struct p448_t *a,
    const struct p448_t *b,
    mask_t mask
) __attribute__((unused));

/**
* Returns 1/x.
* 
* If x=0, returns 0.
*/
void
p448_inverse (
   struct p448_t*       a,
   const struct p448_t* x
);
       
void
simultaneous_invert_p448 (
    struct p448_t *__restrict__ out,
    const struct p448_t *in,
    unsigned int n
);

static inline mask_t
p448_eq (
    const struct p448_t *a,
    const struct p448_t *b
) __attribute__((always_inline,unused));

/* -------------- Inline functions begin here -------------- */

void
p448_set_ui (
    p448_t *out,
    uint64_t x
) {
    int i;
    out->limb[0] = x;
    for (i=1; i<8; i++) {
      out->limb[i] = 0;
    }
}
            
void
p448_cond_swap (
    p448_t *a,
    p448_t *b,
    mask_t doswap
) {
    unsigned int i;
    for (i=0; i<8; i++) {
        uint64_t x = doswap & (a->limb[i]^b->limb[i]);
        a->limb[i] ^= x;
        b->limb[i] ^= x;
    }
}

void
p448_add (
    p448_t *out,
    const p448_t *a,
    const p448_t *b
) {
    unsigned int i;
    for (i=0; i<8; i++) {
        out->limb[i] = a->limb[i] + b->limb[i];
    }
    p448_weak_reduce(out);
}

void
p448_sub (
    p448_t *out,
    const p448_t *a,
    const p448_t *b
) {
    unsigned int i;
    uint64_t co1 = ((1ull<<56)-1)*2, co2 = co1-2;
    for (i=0; i<8; i++) {
        out->limb[i] = a->limb[i] - b->limb[i] + ((i==4) ? co2 : co1);
    }
    p448_weak_reduce(out);
}

void
p448_neg (
    struct p448_t *out,
    const p448_t *a
) {
    unsigned int i;
    uint64_t co1 = ((1ull<<56)-1)*2, co2 = co1-2;
    for (i=0; i<8; i++) {
        out->limb[i] = ((i==4) ? co2 : co1) - a->limb[i];
    }
    p448_weak_reduce(out);
}

void
p448_cond_neg(
    struct p448_t *a,
    mask_t doNegate
) {
    unsigned int i;
    struct p448_t negated;
    
    p448_neg(&negated, a);
    p448_bias(&negated, 2);
    
    for (i=0; i<8; i++) {
        a->limb[i] = ( a->limb[i]      & ~doNegate )
                   | ( negated.limb[i] &  doNegate );
    }
}

void
p448_addw (
    p448_t *a,
    uint64_t x
) {
  a->limb[0] += x;
  a->limb[1] += a->limb[0]>>56;
  a->limb[0] &= (1ull<<56)-1;
}
             
void
p448_subw (
    p448_t *a,
    uint64_t x
) {
  a->limb[0] -= x;
  p448_really_bias(a, 1);
  p448_weak_reduce(a);
}

void
p448_copy (
    p448_t *out,
    const p448_t *a
) {
    memcpy(out,a,sizeof(*a));
}

void
p448_really_bias (
    p448_t *a,
    int amt
) {
    uint64_t co1 = ((1ull<<56)-1)*amt, co2 = co1-amt;
    int i;
    for (i=0; i<8; i++) {
        a->limb[i] += (i==4) ? co2 : co1;
    }
}

void
p448_bias (
    p448_t *a,
    int amt
) {
    (void) a;
    (void) amt;
}

void
p448_weak_reduce (
    p448_t *a
) {
    uint64_t mask = (1ull<<56) - 1;
    uint64_t tmp = a->limb[7] >> 56;
    int i;
    a->limb[4] += tmp;
    for (i=7; i>0; i--) {
        a->limb[i] = (a->limb[i] & mask) + (a->limb[i-1]>>56);
    }
    a->limb[0] = (a->limb[0] & mask) + tmp;
}

void
p448_sqrn (
    p448_t *__restrict__ y,
    const p448_t *x,
    int n
) {
    p448_t tmp;
    assert(n>0);
    if (n&1) {
        p448_sqr(y,x);
        n--;
    } else {
        p448_sqr(&tmp,x);
        p448_sqr(y,&tmp);
        n-=2;
    }
    for (; n; n-=2) {
        p448_sqr(&tmp,y);
        p448_sqr(y,&tmp);
    }
}

mask_t
p448_eq (
    const struct p448_t *a,
    const struct p448_t *b
) {
    struct p448_t ra, rb;
    p448_copy(&ra, a);
    p448_copy(&rb, b);
    p448_sub(&ra, &ra, &rb);
    return p448_is_zero(&ra);
}

void
p448_mask (
    struct p448_t *a,
    const struct p448_t *b,
    mask_t mask
) {
    unsigned int i;
    for (i=0; i<8; i++) {
        a->limb[i] = b->limb[i] & mask;
    }
}

#ifdef __cplusplus
}; /* extern "C" */
#endif

#endif /* __P448_H__ */
