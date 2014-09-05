/* Copyright (c) 2014 Cryptography Research, Inc.
 * Released under the MIT License.  See LICENSE.txt for license information.
 */

#include "word.h"
#include "p448.h"

static inline mask_t __attribute__((always_inline))
is_zero (
    word_t x
) {
    dword_t xx = x;
    xx--;
    return xx >> WORD_BITS;
}

static uint64_t widemul_32 (
    const uint32_t a,
    const uint32_t b
) {
    return ((uint64_t)a)* b;
}

#ifdef __ARM_NEON__
static __inline__ void __attribute__((gnu_inline,always_inline))
xx_vtrnq_s64 (
    int64x2_t *x,
    int64x2_t *y
) {
    __asm__ __volatile__ ("vswp %f0, %e1" : "+w"(*x), "+w"(*y));
}

static __inline__ int64x2_t __attribute__((gnu_inline,always_inline))
xx_vaddup_s64(int64x2_t x) {
    __asm__ ("vadd.s64 %f0, %e0" : "+w"(x));
    return x;
}
#else
#include "neon_emulation.h"
#endif /* ARM_NEON */

static inline void __attribute__((gnu_inline,always_inline))
smlal (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc += (int64_t)(int32_t)a * (int64_t)(int32_t)b;
}

static inline void __attribute__((gnu_inline,always_inline))
smlal2 (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc += (int64_t)(int32_t)a * (int64_t)(int32_t)b * 2;
}

static inline void __attribute__((gnu_inline,always_inline))
smull (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc = (int64_t)(int32_t)a * (int64_t)(int32_t)b;
}

static inline void __attribute__((gnu_inline,always_inline))
smull2 (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc = (int64_t)(int32_t)a * (int64_t)(int32_t)b * 2;
}

void
p448_mul (
    p448_t *__restrict__ cs,
    const p448_t *as,
    const p448_t *bs
) {
    const uint32_t *a = as->limb, *b = bs->limb;
    uint32_t *c = cs->limb;
    
    const int32x2_t
        *val = (const int32x2_t *)a,
        *vbl = (const int32x2_t *)b,
        *vah = (const int32x2_t *)(&a[8]),
        *vbh = (const int32x2_t *)(&b[8]);
    
    int32x2_t
        *vcl = (int32x2_t *)c,
        *vch = (int32x2_t *)(&c[8]),
        vmask = {(1<<28) - 1, (1<<28)-1};

    int64x2_t accumx0a, accumx0b;
    int64x2_t accumx1a, accumx1b;
    int64x2_t accumx2a, accumx2b;
    int64x2_t accumx3a, accumx3b;
    int64x2_t accumx4a, accumx4b;
    int64x2_t accumx5a, accumx5b;
    int64x2_t accumx6a, accumx6b;
    int64x2_t accumx7a, accumx7b;
    int64x2_t carry;
    int32x2x2_t trn_res;
    int32x2_t delta;
    
    accumx0a = vmull_lane_s32(          delta = val[1] + vah[1], vbh[3], 0);
    accumx1a = vmull_lane_s32(          delta, vbh[3], 1);
    accumx2a = vmull_lane_s32(          delta = val[2] + vah[2], vbh[3], 0);
    accumx3a = vmull_lane_s32(          delta, vbh[3], 1);
    accumx0a = vmlal_lane_s32(accumx0a, delta, vbh[2], 0);
    accumx1a = vmlal_lane_s32(accumx1a, delta, vbh[2], 1);
    accumx2a = vmlal_lane_s32(accumx2a, delta = val[3] + vah[3], vbh[2], 0);
    accumx3a = vmlal_lane_s32(accumx3a, delta, vbh[2], 1);
    accumx0a = vmlal_lane_s32(accumx0a, delta, vbh[1], 0);
    accumx1a = vmlal_lane_s32(accumx1a, delta, vbh[1], 1);
    accumx2b = vmull_lane_s32(          delta = val[0] + vah[0], vbh[1], 0);
    accumx3b = vmull_lane_s32(          delta, vbh[1], 1);
    accumx0b = vmull_lane_s32(          delta, vbh[0], 0);
    accumx1b = vmull_lane_s32(          delta, vbh[0], 1);
    accumx2b = vmlal_lane_s32(accumx2b, delta = val[1] + vah[1], vbh[0], 0);
    accumx3b = vmlal_lane_s32(accumx3b, delta, vbh[0], 1);
    accumx0b = vmlal_lane_s32(accumx0b, vah[1], vbl[3], 0);
    accumx1b = vmlal_lane_s32(accumx1b, vah[1], vbl[3], 1);
    accumx2b = vmlal_lane_s32(accumx2b, vah[2], vbl[3], 0);
    accumx3b = vmlal_lane_s32(accumx3b, vah[2], vbl[3], 1);
    accumx0b = vmlal_lane_s32(accumx0b, vah[2], vbl[2], 0);
    accumx1b = vmlal_lane_s32(accumx1b, vah[2], vbl[2], 1);
    accumx2b = vmlal_lane_s32(accumx2b, vah[3], vbl[2], 0);
    accumx3b = vmlal_lane_s32(accumx3b, vah[3], vbl[2], 1);
    accumx0b = vmlal_lane_s32(accumx0b, vah[3], vbl[1], 0);
    accumx1b = vmlal_lane_s32(accumx1b, vah[3], vbl[1], 1);
    accumx2b += accumx2a;
    accumx3b += accumx3a;
    accumx2a = vmlal_lane_s32(accumx2a, vah[0], vbl[1], 0);
    accumx3a = vmlal_lane_s32(accumx3a, vah[0], vbl[1], 1);
    accumx0b += accumx0a;
    accumx1b += accumx1a;
    accumx0a = vmlal_lane_s32(accumx0a, vah[0], vbl[0], 0);
    accumx1a = vmlal_lane_s32(accumx1a, vah[0], vbl[0], 1);
    accumx2a = vmlal_lane_s32(accumx2a, vah[1], vbl[0], 0);
    accumx3a = vmlal_lane_s32(accumx3a, vah[1], vbl[0], 1);
    accumx0a = vmlal_lane_s32(accumx0a, val[1], delta = vbl[3] - vbh[3], 0);
    accumx1a = vmlal_lane_s32(accumx1a, val[1], delta, 1);
    accumx2a = vmlal_lane_s32(accumx2a, val[2], delta, 0);
    accumx3a = vmlal_lane_s32(accumx3a, val[2], delta, 1);
    accumx0a = vmlal_lane_s32(accumx0a, val[2], delta = vbl[2] - vbh[2], 0);
    accumx1a = vmlal_lane_s32(accumx1a, val[2], delta, 1);
    accumx2a = vmlal_lane_s32(accumx2a, val[3], delta, 0);
    accumx3a = vmlal_lane_s32(accumx3a, val[3], delta, 1);
    accumx0a = vmlal_lane_s32(accumx0a, val[3], delta = vbl[1] - vbh[1], 0);
    accumx1a = vmlal_lane_s32(accumx1a, val[3], delta, 1);
    accumx2a += accumx2b;
    accumx3a += accumx3b;
    accumx2b = vmlal_lane_s32(accumx2b, val[0], delta, 0);
    accumx3b = vmlal_lane_s32(accumx3b, val[0], delta, 1);
    accumx0a += accumx0b;
    accumx1a += accumx1b;
    accumx0b = vmlal_lane_s32(accumx0b, val[0], delta = vbl[0] - vbh[0], 0);
    accumx1b = vmlal_lane_s32(accumx1b, val[0], delta, 1);
    accumx2b = vmlal_lane_s32(accumx2b, val[1], delta, 0);
    accumx3b = vmlal_lane_s32(accumx3b, val[1], delta, 1);
    xx_vtrnq_s64(&accumx0a, &accumx0b);
    xx_vtrnq_s64(&accumx1a, &accumx1b);
    xx_vtrnq_s64(&accumx2a, &accumx2b);
    xx_vtrnq_s64(&accumx3a, &accumx3b);
    accumx0b += accumx1a;
    accumx0b = vsraq_n_s64(accumx0b,accumx0a,28);
    accumx1b = vsraq_n_s64(accumx1b,accumx0b,28);
    accumx2a += accumx1b;
    accumx2b += accumx3a;
    accumx2b = vsraq_n_s64(accumx2b,accumx2a,28);
    accumx3b = vsraq_n_s64(accumx3b,accumx2b,28);
    trn_res = vtrn_s32(vmovn_s64(accumx0a), vmovn_s64(accumx0b));
    vcl[0] = trn_res.val[1] & vmask;
    vch[0] = trn_res.val[0] & vmask;
    trn_res = vtrn_s32(vmovn_s64(accumx2a), vmovn_s64(accumx2b));
    vcl[1] = trn_res.val[1] & vmask;
    vch[1] = trn_res.val[0] & vmask;
    carry = accumx3b;
    
    accumx4a = vmull_lane_s32(          delta = val[3] + vah[3], vbh[3], 0);
    accumx5a = vmull_lane_s32(          delta, vbh[3], 1);
    accumx6b = vmull_lane_s32(          delta = val[0] + vah[0], vbh[3], 0);
    accumx7b = vmull_lane_s32(          delta, vbh[3], 1);
    accumx4b = accumx4a;
    accumx5b = accumx5a;
    accumx4b = vmlal_lane_s32(accumx4b, delta, vbh[2], 0);
    accumx5b = vmlal_lane_s32(accumx5b, delta, vbh[2], 1);
    accumx6b = vmlal_lane_s32(accumx6b, delta = val[1] + vah[1], vbh[2], 0);
    accumx7b = vmlal_lane_s32(accumx7b, delta, vbh[2], 1);
    accumx4b = vmlal_lane_s32(accumx4b, delta, vbh[1], 0);
    accumx5b = vmlal_lane_s32(accumx5b, delta, vbh[1], 1);
    accumx6b = vmlal_lane_s32(accumx6b, delta = val[2] + vah[2], vbh[1], 0);
    accumx7b = vmlal_lane_s32(accumx7b, delta, vbh[1], 1);
    accumx4b = vmlal_lane_s32(accumx4b, delta, vbh[0], 0);
    accumx5b = vmlal_lane_s32(accumx5b, delta, vbh[0], 1);
    accumx6b = vmlal_lane_s32(accumx6b, delta = val[3] + vah[3], vbh[0], 0);
    accumx7b = vmlal_lane_s32(accumx7b, delta, vbh[0], 1);
    accumx4b = vmlal_lane_s32(accumx4b, vah[3], vbl[3], 0);
    accumx5b = vmlal_lane_s32(accumx5b, vah[3], vbl[3], 1);
    accumx6a = accumx6b;
    accumx7a = accumx7b;
    accumx6a = vmlal_lane_s32(accumx6a, vah[0], vbl[3], 0);
    accumx7a = vmlal_lane_s32(accumx7a, vah[0], vbl[3], 1);
    accumx4a += accumx4b;
    accumx5a += accumx5b;
    accumx4a = vmlal_lane_s32(accumx4a, vah[0], vbl[2], 0);
    accumx5a = vmlal_lane_s32(accumx5a, vah[0], vbl[2], 1);
    accumx6a = vmlal_lane_s32(accumx6a, vah[1], vbl[2], 0);
    accumx7a = vmlal_lane_s32(accumx7a, vah[1], vbl[2], 1);
    accumx4a = vmlal_lane_s32(accumx4a, vah[1], vbl[1], 0);
    accumx5a = vmlal_lane_s32(accumx5a, vah[1], vbl[1], 1);
    accumx6a = vmlal_lane_s32(accumx6a, vah[2], vbl[1], 0);
    accumx7a = vmlal_lane_s32(accumx7a, vah[2], vbl[1], 1);
    accumx4a = vmlal_lane_s32(accumx4a, vah[2], vbl[0], 0);
    accumx5a = vmlal_lane_s32(accumx5a, vah[2], vbl[0], 1);
    accumx6a = vmlal_lane_s32(accumx6a, vah[3], vbl[0], 0);
    accumx7a = vmlal_lane_s32(accumx7a, vah[3], vbl[0], 1);
    accumx4a = vmlal_lane_s32(accumx4a, val[3], delta = vbl[3] - vbh[3], 0);
    accumx5a = vmlal_lane_s32(accumx5a, val[3], delta, 1);
    /**/
    accumx6b = vmlal_lane_s32(accumx6b, val[0], delta, 0);
    accumx7b = vmlal_lane_s32(accumx7b, val[0], delta, 1);
    accumx4b = vmlal_lane_s32(accumx4b, val[0], delta = vbl[2] - vbh[2], 0);
    accumx5b = vmlal_lane_s32(accumx5b, val[0], delta, 1);
    accumx6b = vmlal_lane_s32(accumx6b, val[1], delta, 0);
    accumx7b = vmlal_lane_s32(accumx7b, val[1], delta, 1);
    accumx4b = vmlal_lane_s32(accumx4b, val[1], delta = vbl[1] - vbh[1], 0);
    accumx5b = vmlal_lane_s32(accumx5b, val[1], delta, 1);
    accumx6b = vmlal_lane_s32(accumx6b, val[2], delta, 0);
    accumx7b = vmlal_lane_s32(accumx7b, val[2], delta, 1);
    accumx4b = vmlal_lane_s32(accumx4b, val[2], delta = vbl[0] - vbh[0], 0);
    accumx5b = vmlal_lane_s32(accumx5b, val[2], delta, 1);
    accumx6b = vmlal_lane_s32(accumx6b, val[3], delta, 0);
    accumx7b = vmlal_lane_s32(accumx7b, val[3], delta, 1);
    
    xx_vtrnq_s64(&accumx4a, &accumx4b);
    xx_vtrnq_s64(&accumx5a, &accumx5b);
    xx_vtrnq_s64(&accumx6a, &accumx6b);
    xx_vtrnq_s64(&accumx7a, &accumx7b);
    accumx4a += carry;
    accumx4b += accumx5a;
    accumx4b = vsraq_n_s64(accumx4b,accumx4a,28);
    accumx5b = vsraq_n_s64(accumx5b,accumx4b,28);
    accumx6a += accumx5b;
    accumx6b += accumx7a;
    
    trn_res = vtrn_s32(vmovn_s64(accumx4a), vmovn_s64(accumx4b));
    vcl[2] = trn_res.val[1] & vmask;
    vch[2] = trn_res.val[0] & vmask;
    accumx6b = vsraq_n_s64(accumx6b,accumx6a,28);
    accumx7b = vsraq_n_s64(accumx7b,accumx6b,28);
    trn_res = vtrn_s32(vmovn_s64(accumx6a), vmovn_s64(accumx6b));
    vcl[3] = trn_res.val[1] & vmask;
    vch[3] = trn_res.val[0] & vmask;
    
    accumx7b = xx_vaddup_s64(accumx7b);

    int32x2_t t0 = vcl[0], t1 = vch[0];
    trn_res = vtrn_s32(t0,t1);
    t0 = trn_res.val[0]; t1 = trn_res.val[1];
    
    accumx7b = vaddw_s32(accumx7b, t0);
    t0 = vmovn_s64(accumx7b) & vmask;
    
    accumx7b = vshrq_n_s64(accumx7b,28);
    accumx7b = vaddw_s32(accumx7b, t1);
    t1 = vmovn_s64(accumx7b) & vmask;
    trn_res = vtrn_s32(t0,t1);
    vcl[0] = trn_res.val[0];
    vch[0] = trn_res.val[1];
    accumx7b = vshrq_n_s64(accumx7b,28);

    t0 = vmovn_s64(accumx7b);
    
    uint32_t
        c0 = vget_lane_s32(t0,0),
        c1 = vget_lane_s32(t0,1);
    c[2]  += c0;
    c[10] += c1;
}

void
p448_sqr (
    p448_t *__restrict__ cs,
    const p448_t *as
) {
    /* FUTURE possible improvements:
     *    don't use nega-phi algorithm, so as to avoid extra phi-twiddle at end
     *        or use phi/nega-phi for everything, montgomery style
     *        or find some sort of phi algorithm which doesn't have this problem
     *    break up lanemuls so that only diags get 1mul'd instead of diag 2x2 blocks
     *
     * These improvements are all pretty minor, but I guess together they might matter?
     */
    
    const uint32_t *b = as->limb;
    uint32_t *c = cs->limb;

    int32x2_t vbm[4];
    
    const int32x2_t
        *vbl = (const int32x2_t *)b,
        *vbh = (const int32x2_t *)(&b[8]);
        
    int i;
    for (i=0; i<4; i++) {
        vbm[i] = vbl[i] - vbh[i];
    }
    
    int32x2_t
        *vcl = (int32x2_t *)c,
        *vch = (int32x2_t *)(&c[8]),
        vmask = {(1<<28) - 1, (1<<28)-1};

    int64x2_t accumx0a, accumx0b;
    int64x2_t accumx1a, accumx1b;
    int64x2_t accumx2a, accumx2b;
    int64x2_t accumx3a, accumx3b;
    int64x2_t accumx4a, accumx4b;
    int64x2_t accumx5a, accumx5b;
    int64x2_t accumx6a, accumx6b;
    int64x2_t accumx7a, accumx7b;
    int64x2_t carry;
    int32x2x2_t trn_res;
    
    accumx0a = vqdmull_lane_s32(          vbh[1], vbh[3], 0);
    accumx1a = vqdmull_lane_s32(          vbh[1], vbh[3], 1);
    accumx2a = vqdmull_lane_s32(          vbh[2], vbh[3], 0);
    accumx3a = vqdmull_lane_s32(          vbh[2], vbh[3], 1);
    accumx0a =   vmlal_lane_s32(accumx0a, vbh[2], vbh[2], 0);
    accumx1a =   vmlal_lane_s32(accumx1a, vbh[2], vbh[2], 1);
    accumx2b = accumx2a;
    accumx3b = accumx3a;
    accumx2b = vqdmlal_lane_s32(accumx2b, vbh[0], vbh[1], 0);
    accumx3b = vqdmlal_lane_s32(accumx3b, vbh[0], vbh[1], 1);
    accumx0b = accumx0a;
    accumx1b = accumx1a;
    accumx0b =   vmlal_lane_s32(accumx0b, vbh[0], vbh[0], 0);
    accumx1b =   vmlal_lane_s32(accumx1b, vbh[0], vbh[0], 1);
    accumx0b = vqdmlal_lane_s32(accumx0b, vbl[1], vbl[3], 0);
    accumx1b = vqdmlal_lane_s32(accumx1b, vbl[1], vbl[3], 1);
    accumx2b = vqdmlal_lane_s32(accumx2b, vbl[2], vbl[3], 0);
    accumx3b = vqdmlal_lane_s32(accumx3b, vbl[2], vbl[3], 1);
    accumx0b =   vmlal_lane_s32(accumx0b, vbl[2], vbl[2], 0);
    accumx1b =   vmlal_lane_s32(accumx1b, vbl[2], vbl[2], 1);
    accumx2a += accumx2b;
    accumx3a += accumx3b;
    accumx2a = vqdmlal_lane_s32(accumx2a, vbl[0], vbl[1], 0);
    accumx3a = vqdmlal_lane_s32(accumx3a, vbl[0], vbl[1], 1);
    accumx0a += accumx0b;
    accumx1a += accumx1b;
    accumx0a =   vmlal_lane_s32(accumx0a, vbl[0], vbl[0], 0);
    accumx1a =   vmlal_lane_s32(accumx1a, vbl[0], vbl[0], 1);
    accumx0a = vqdmlsl_lane_s32(accumx0a, vbm[1], vbm[3], 0);
    accumx1a = vqdmlsl_lane_s32(accumx1a, vbm[1], vbm[3], 1);
    accumx0a =   vmlsl_lane_s32(accumx0a, vbm[2], vbm[2], 0);
    accumx1a =   vmlsl_lane_s32(accumx1a, vbm[2], vbm[2], 1);
    accumx2a = vqdmlsl_lane_s32(accumx2a, vbm[2], vbm[3], 0);
    accumx3a = vqdmlsl_lane_s32(accumx3a, vbm[2], vbm[3], 1);
    accumx0b += accumx0a;
    accumx1b += accumx1a;
    accumx0b =   vmlsl_lane_s32(accumx0b, vbm[0], vbm[0], 0);
    accumx1b =   vmlsl_lane_s32(accumx1b, vbm[0], vbm[0], 1);
    accumx2b += accumx2a;
    accumx3b += accumx3a;
    accumx2b = vqdmlsl_lane_s32(accumx2b, vbm[0], vbm[1], 0);
    accumx3b = vqdmlsl_lane_s32(accumx3b, vbm[0], vbm[1], 1);
    xx_vtrnq_s64(&accumx0b, &accumx0a);
    xx_vtrnq_s64(&accumx1b, &accumx1a);
    xx_vtrnq_s64(&accumx2b, &accumx2a);
    xx_vtrnq_s64(&accumx3b, &accumx3a);
    accumx0a += accumx1b;
    accumx0a = vsraq_n_s64(accumx0a,accumx0b,28);
    accumx1a = vsraq_n_s64(accumx1a,accumx0a,28);
    accumx2b += accumx1a;
    accumx2a += accumx3b;
    accumx2a = vsraq_n_s64(accumx2a,accumx2b,28);
    accumx3a = vsraq_n_s64(accumx3a,accumx2a,28);
    trn_res = vtrn_s32(vmovn_s64(accumx0b), vmovn_s64(accumx0a));
    vcl[0] = trn_res.val[1] & vmask;
    vch[0] = trn_res.val[0] & vmask;
    trn_res = vtrn_s32(vmovn_s64(accumx2b), vmovn_s64(accumx2a));
    vcl[1] = trn_res.val[1] & vmask;
    vch[1] = trn_res.val[0] & vmask;
    carry = accumx3a;
    
    accumx4a =   vmull_lane_s32(          vbh[3], vbh[3], 0);
    accumx5a =   vmull_lane_s32(          vbh[3], vbh[3], 1);
    accumx6b = vqdmull_lane_s32(          vbh[0], vbh[3], 0);
    accumx7b = vqdmull_lane_s32(          vbh[0], vbh[3], 1);
    accumx4b = accumx4a;
    accumx5b = accumx5a;
    accumx4b = vqdmlal_lane_s32(accumx4b, vbh[0], vbh[2], 0);
    accumx5b = vqdmlal_lane_s32(accumx5b, vbh[0], vbh[2], 1);
    accumx6b = vqdmlal_lane_s32(accumx6b, vbh[1], vbh[2], 0);
    accumx7b = vqdmlal_lane_s32(accumx7b, vbh[1], vbh[2], 1);
    accumx4b =   vmlal_lane_s32(accumx4b, vbh[1], vbh[1], 0);
    accumx5b =   vmlal_lane_s32(accumx5b, vbh[1], vbh[1], 1);
    accumx4b =   vmlal_lane_s32(accumx4b, vbl[3], vbl[3], 0);
    accumx5b =   vmlal_lane_s32(accumx5b, vbl[3], vbl[3], 1);
    accumx6a = accumx6b;
    accumx7a = accumx7b;
    accumx6a = vqdmlal_lane_s32(accumx6a, vbl[0], vbl[3], 0);
    accumx7a = vqdmlal_lane_s32(accumx7a, vbl[0], vbl[3], 1);
    accumx4a += accumx4b;
    accumx5a += accumx5b;
    accumx4a = vqdmlal_lane_s32(accumx4a, vbl[0], vbl[2], 0);
    accumx5a = vqdmlal_lane_s32(accumx5a, vbl[0], vbl[2], 1);
    accumx6a = vqdmlal_lane_s32(accumx6a, vbl[1], vbl[2], 0);
    accumx7a = vqdmlal_lane_s32(accumx7a, vbl[1], vbl[2], 1);
    accumx4a =   vmlal_lane_s32(accumx4a, vbl[1], vbl[1], 0);
    accumx5a =   vmlal_lane_s32(accumx5a, vbl[1], vbl[1], 1);
    accumx4a =   vmlsl_lane_s32(accumx4a, vbm[3], vbm[3], 0);
    accumx5a =   vmlsl_lane_s32(accumx5a, vbm[3], vbm[3], 1);
    accumx6b += accumx6a;
    accumx7b += accumx7a;
    accumx6b = vqdmlsl_lane_s32(accumx6b, vbm[0], vbm[3], 0);
    accumx7b = vqdmlsl_lane_s32(accumx7b, vbm[0], vbm[3], 1);
    accumx4b += accumx4a;
    accumx5b += accumx5a;
    accumx4b = vqdmlsl_lane_s32(accumx4b, vbm[0], vbm[2], 0);
    accumx5b = vqdmlsl_lane_s32(accumx5b, vbm[0], vbm[2], 1);
    accumx4b =   vmlsl_lane_s32(accumx4b, vbm[1], vbm[1], 0);
    accumx5b =   vmlsl_lane_s32(accumx5b, vbm[1], vbm[1], 1);
    accumx6b = vqdmlsl_lane_s32(accumx6b, vbm[1], vbm[2], 0);
    accumx7b = vqdmlsl_lane_s32(accumx7b, vbm[1], vbm[2], 1);
    
    xx_vtrnq_s64(&accumx4b, &accumx4a);
    xx_vtrnq_s64(&accumx5b, &accumx5a);
    xx_vtrnq_s64(&accumx6b, &accumx6a);
    xx_vtrnq_s64(&accumx7b, &accumx7a);
    accumx4b += carry;
    accumx4a += accumx5b;
    accumx4a = vsraq_n_s64(accumx4a,accumx4b,28);
    accumx5a = vsraq_n_s64(accumx5a,accumx4a,28);
    accumx6b += accumx5a;
    accumx6a += accumx7b;
    
    trn_res = vtrn_s32(vmovn_s64(accumx4b), vmovn_s64(accumx4a));
    vcl[2] = trn_res.val[1] & vmask;
    vch[2] = trn_res.val[0] & vmask;
    accumx6a = vsraq_n_s64(accumx6a,accumx6b,28);
    accumx7a = vsraq_n_s64(accumx7a,accumx6a,28);
    trn_res = vtrn_s32(vmovn_s64(accumx6b), vmovn_s64(accumx6a));
    vcl[3] = trn_res.val[1] & vmask;
    vch[3] = trn_res.val[0] & vmask;
    
    accumx7a = xx_vaddup_s64(accumx7a);

    int32x2_t t0 = vcl[0], t1 = vch[0];
    trn_res = vtrn_s32(t0,t1);
    t0 = trn_res.val[0]; t1 = trn_res.val[1];
    
    accumx7a = vaddw_s32(accumx7a, t0);
    t0 = vmovn_s64(accumx7a) & vmask;
    
    accumx7a = vshrq_n_s64(accumx7a,28);
    accumx7a = vaddw_s32(accumx7a, t1);
    t1 = vmovn_s64(accumx7a) & vmask;
    trn_res = vtrn_s32(t0,t1);
    vcl[0] = trn_res.val[0];
    vch[0] = trn_res.val[1];
    accumx7a = vshrq_n_s64(accumx7a,28);

    t0 = vmovn_s64(accumx7a);
    
    uint32_t
        c0 = vget_lane_s32(t0,0),
        c1 = vget_lane_s32(t0,1);
    c[2]  += c0;
    c[10] += c1;
}

void
p448_mulw (
    p448_t *__restrict__ cs,
    const p448_t *as,
    uint64_t b
) {
    const uint32_t bhi = b>>28, blo = b & ((1<<28)-1);
    
    const uint32_t *a = as->limb;
    uint32_t *c = cs->limb;

    uint64_t accum0, accum8;
    uint32_t mask = (1ull<<28)-1;  

    int i;

    uint32_t c0, c8, n0, n8;
    accum0 = widemul_32(bhi, a[15]);
    accum8 = widemul_32(bhi, a[15] + a[7]);
    c0 = a[0]; c8 = a[8];
    smlal(&accum0, blo, c0);
    smlal(&accum8, blo, c8);

    c[0] = accum0 & mask; accum0 >>= 28;
    c[8] = accum8 & mask; accum8 >>= 28;
    
    i=1;
    {
        n0 = a[i]; n8 = a[i+8];
        smlal(&accum0, bhi, c0);
        smlal(&accum8, bhi, c8);
        smlal(&accum0, blo, n0);
        smlal(&accum8, blo, n8);
        
        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }
    {
        c0 = a[i]; c8 = a[i+8];
        smlal(&accum0, bhi, n0);
        smlal(&accum8, bhi, n8);
        smlal(&accum0, blo, c0);
        smlal(&accum8, blo, c8);

        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }
    {
        n0 = a[i]; n8 = a[i+8];
        smlal(&accum0, bhi, c0);
        smlal(&accum8, bhi, c8);
        smlal(&accum0, blo, n0);
        smlal(&accum8, blo, n8);

        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }
    {
        c0 = a[i]; c8 = a[i+8];
        smlal(&accum0, bhi, n0);
        smlal(&accum8, bhi, n8);
        smlal(&accum0, blo, c0);
        smlal(&accum8, blo, c8);

        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }
    {
        n0 = a[i]; n8 = a[i+8];
        smlal(&accum0, bhi, c0);
        smlal(&accum8, bhi, c8);
        smlal(&accum0, blo, n0);
        smlal(&accum8, blo, n8);

        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }
    {
        c0 = a[i]; c8 = a[i+8];
        smlal(&accum0, bhi, n0);
        smlal(&accum8, bhi, n8);
        smlal(&accum0, blo, c0);
        smlal(&accum8, blo, c8);
        
        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }
    {
        n0 = a[i]; n8 = a[i+8];
        smlal(&accum0, bhi, c0);
        smlal(&accum8, bhi, c8);
        smlal(&accum0, blo, n0);
        smlal(&accum8, blo, n8);

        c[i] = accum0 & mask; accum0 >>= 28;
        c[i+8] = accum8 & mask; accum8 >>= 28;
        i++;
    }

    accum0 += accum8 + c[8];
    c[8] = accum0 & mask;
    c[9] += accum0 >> 28;

    accum8 += c[0];
    c[0] = accum8 & mask;
    c[1] += accum8 >> 28;
}

void
p448_strong_reduce (
    p448_t *a
) {
    word_t mask = (1ull<<28)-1;

    /* first, clear high */
    a->limb[8] += a->limb[15]>>28;
    a->limb[0] += a->limb[15]>>28;
    a->limb[15] &= mask;

    /* now the total is less than 2^448 - 2^(448-56) + 2^(448-56+8) < 2p */

    /* compute total_value - p.  No need to reduce mod p. */

    dsword_t scarry = 0;
    int i;
    for (i=0; i<16; i++) {
        scarry = scarry + a->limb[i] - ((i==8)?mask-1:mask);
        a->limb[i] = scarry & mask;
        scarry >>= 28;
    }

    /* uncommon case: it was >= p, so now scarry = 0 and this = x
    * common case: it was < p, so now scarry = -1 and this = x - p + 2^448
    * so let's add back in p.  will carry back off the top for 2^448.
    */

    assert(is_zero(scarry) | is_zero(scarry+1));

    word_t scarry_mask = scarry & mask;
    dword_t carry = 0;

    /* add it back */
    for (i=0; i<16; i++) {
        carry = carry + a->limb[i] + ((i==8)?(scarry_mask&~1):scarry_mask);
        a->limb[i] = carry & mask;
        carry >>= 28;
    }

    assert(is_zero(carry + scarry));
}

mask_t
p448_is_zero (
    const struct p448_t *a
) {
    struct p448_t b;
    p448_copy(&b,a);
    p448_strong_reduce(&b);

    uint32_t any = 0;
    int i;
    for (i=0; i<16; i++) {
        any |= b.limb[i];
    }
    return is_zero(any);
}

void
p448_serialize (
    uint8_t *serial,
    const struct p448_t *x
) {
    int i,j;
    p448_t red;
    p448_copy(&red, x);
    p448_strong_reduce(&red);
    for (i=0; i<8; i++) {
        uint64_t limb = red.limb[2*i] + (((uint64_t)red.limb[2*i+1])<<28);
        for (j=0; j<7; j++) {
            serial[7*i+j] = limb;
            limb >>= 8;
        }
        assert(limb == 0);
    }
}

mask_t
p448_deserialize (
    p448_t *x,
    const uint8_t serial[56]
) {
    int i,j;
    for (i=0; i<8; i++) {
        uint64_t out = 0;
        for (j=0; j<7; j++) {
            out |= ((uint64_t)serial[7*i+j])<<(8*j);
        }
        x->limb[2*i] = out & ((1ull<<28)-1);
        x->limb[2*i+1] = out >> 28;
    }
    
    /* Check for reduction.
     *
     * The idea is to create a variable ge which is all ones (rather, 56 ones)
     * if and only if the low $i$ words of $x$ are >= those of p.
     *
     * Remember p = little_endian(1111,1111,1111,1111,1110,1111,1111,1111)
     */
    uint32_t ge = -1, mask = (1ull<<28)-1;
    for (i=0; i<8; i++) {
        ge &= x->limb[i];
    }
    
    /* At this point, ge = 1111 iff bottom are all 1111.  Now propagate if 1110, or set if 1111 */
    ge = (ge & (x->limb[8] + 1)) | is_zero(x->limb[8] ^ mask);
    
    /* Propagate the rest */
    for (i=9; i<16; i++) {
        ge &= x->limb[i];
    }
    
    return ~is_zero(ge ^ mask);
}

void
simultaneous_invert_p448(
    struct p448_t *__restrict__ out,
    const struct p448_t *in,
    unsigned int n
) {
  if (n==0) {
      return;
  } else if (n==1) {
      p448_inverse(out,in);
      return;
  }
  
  p448_copy(&out[1], &in[0]);
  int i;
  for (i=1; i<(int) (n-1); i++) {
      p448_mul(&out[i+1], &out[i], &in[i]);
  }
  p448_mul(&out[0], &out[n-1], &in[n-1]);
  
  struct p448_t tmp;
  p448_inverse(&tmp, &out[0]);
  p448_copy(&out[0], &tmp);
  
  /* at this point, out[0] = product(in[i]) ^ -1
   * out[i] = product(in[0]..in[i-1]) if i != 0
   */
  for (i=n-1; i>0; i--) {
      p448_mul(&tmp, &out[i], &out[0]);
      p448_copy(&out[i], &tmp);
      
      p448_mul(&tmp, &out[0], &in[i]);
      p448_copy(&out[0], &tmp);
  }
}
