/* Copyright (c) 2014 Cryptography Research, Inc.
 * Released under the MIT License.  See LICENSE.txt for license information.
 */

/**
 * @file "neon_emulation.h"
 * @brief NEON intrinsic emulation using clang's vector extensions.
 *
 * This lets you test and debug NEON code on x86.
 */

#ifndef __NEON_EMULATION_H__
#define __NEON_EMULATION_H__ 1

/** @cond internal */

#include "word.h"

#include <stdint.h>
#include <assert.h>

static __inline__ int64x2_t vaddw_s32 (int64x2_t a, int32x2_t b) {
    a.x += b.x;
    a.y += b.y;
    return a;
}

static __inline__ int64x2_t __attribute__((gnu_inline,always_inline))
xx_vaddup_s64(int64x2_t x) {
    x.y += x.x;
    return x;
}

typedef struct { int32x2_t val[2]; } int32x2x2_t;
static inline int32x2x2_t vtrn_s32 (int32x2_t x, int32x2_t y) {
    int32x2x2_t out = {{{ x.x, y.x }, {x.y, y.y}}};
    return out;
}

static __inline__ void __attribute__((gnu_inline,always_inline))
xx_vtrnq_s64 (
    int64x2_t *x,
    int64x2_t *y
) {
    int64_t tmp = (*x).y;
    (*x).y = (*y).x;
    (*y).x = tmp;
}

int64x2_t vsraq_n_s64 (
    int64x2_t a,
    int64x2_t v,
    const int x
) {
    return a + (v >> x);
}

int64x2_t vshrq_n_s64 (
    int64x2_t v,
    const int x
) {
    return v >> x;
}

static inline int64_t vgetq_lane_s64 (
    int64x2_t acc,
    const int lane
) {
    return lane ? acc.y : acc.x;
}

static inline int32_t vget_lane_s32 (
    int32x2_t acc,
    const int lane
) {
    return lane ? acc.y : acc.x;
}

static inline int64x2_t vmlal_lane_s32 (
    int64x2_t acc,
    int32x2_t x,
    int32x2_t y,
    int lane
) {
    int64x2_t xx = { x.x, x.y }, yy = { y.x, y.y };
    return acc + xx*(lane?yy.yy:yy.xx);
}

static inline int64x2_t vmlsl_lane_s32 (
    int64x2_t acc,
    int32x2_t x,
    int32x2_t y,
    int lane
) {
    int64x2_t xx = { x.x, x.y }, yy = { y.x, y.y };
    return acc - xx*(lane?yy.yy:yy.xx);
}

static inline int64x2_t vqdmlsl_lane_s32 (
    int64x2_t acc,
    int32x2_t x,
    int32x2_t y,
    int lane
) {
    int64x2_t xx = { x.x, x.y }, yy = { y.x, y.y };
    int64x2_t tmp = xx*(lane?yy.yy:yy.xx);
    assert(tmp.x >> 63 == tmp.x>>62);
    assert(tmp.y >> 63 == tmp.y>>62);
    return acc - 2*tmp;
}

static inline int64x2_t vqdmlal_lane_s32 (
    int64x2_t acc,
    int32x2_t x,
    int32x2_t y,
    int lane
) {
    int64x2_t xx = { x.x, x.y }, yy = { y.x, y.y };
    int64x2_t tmp = xx*(lane?yy.yy:yy.xx);
    assert(tmp.x >> 63 == tmp.x>>62);
    assert(tmp.y >> 63 == tmp.y>>62);
    return acc + 2*tmp;
}

static inline int64x2_t vqdmull_lane_s32 (
    int32x2_t x,
    int32x2_t y,
    int lane
) {
    int64x2_t xx = { x.x, x.y }, yy = { y.x, y.y };
    int64x2_t tmp = xx*(lane?yy.yy:yy.xx);
    assert(tmp.x >> 63 == tmp.x>>62);
    assert(tmp.y >> 63 == tmp.y>>62);
    return 2*tmp;
}

static inline int32x2_t vmovn_s64(
    int64x2_t x
) {
    int32x2_t y = {x.x,x.y};
    return y;
}

static inline int64x2_t vmull_lane_s32 (
    int32x2_t x,
    int32x2_t y,
    int lane
) {
    int64x2_t xx = { x.x, x.y }, yy = { y.x, y.y };
    return xx*(lane?yy.yy:yy.xx);
}

/** @endcond */

#endif /* __NEON_EMULATION_H__ */
