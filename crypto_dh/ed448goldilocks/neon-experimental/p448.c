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

static __inline__ void __attribute__((gnu_inline,always_inline,unused))
xx_vtrnq_s64 (
    int64x2_t *x,
    int64x2_t *y
) {
    __asm__ __volatile__ ("vswp %f0, %e1" : "+w"(*x), "+w"(*y));
}

static __inline__ int64x2_t __attribute__((gnu_inline,always_inline,unused))
xx_vaddup_s64(int64x2_t x) {
    __asm__ ("vadd.s64 %f0, %e0" : "+w"(x));
    return x;
}

static __inline__ uint64x2_t __attribute__((gnu_inline,always_inline,unused))
xx_vaddup_u64(uint64x2_t x) {
    __asm__ ("vadd.s64 %f0, %e0" : "+w"(x));
    return x;
}

static __inline__ int64x2_t __attribute__((gnu_inline,always_inline,unused))
vrev128_s64(int64x2_t x) {
    __asm__ ("vswp.s64 %e0, %f0" : "+w"(x));
    return x;
}

static __inline__ uint64x2_t __attribute__((gnu_inline,always_inline))
vrev128_u64(uint64x2_t x) {
    __asm__ ("vswp.s64 %e0, %f0" : "+w"(x));
    return x;
}

static inline void __attribute__((gnu_inline,always_inline,unused))
smlal (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc += (int64_t)(int32_t)a * (int64_t)(int32_t)b;
}

static inline void __attribute__((gnu_inline,always_inline,unused))
smlal2 (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc += (int64_t)(int32_t)a * (int64_t)(int32_t)b * 2;
}

static inline void __attribute__((gnu_inline,always_inline,unused))
smull (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc = (int64_t)(int32_t)a * (int64_t)(int32_t)b;
}

static inline void __attribute__((gnu_inline,always_inline,unused))
smull2 (
    uint64_t *acc,
    const uint32_t a,
    const uint32_t b
) {
    *acc = (int64_t)(int32_t)a * (int64_t)(int32_t)b * 2;
}

static inline int64x2_t __attribute__((always_inline,unused))
SER(int64x2_t x) {
    __asm__ __volatile__("" : "+w"(x));
    return x;
}
#define svmull_lane_s32(a,b,c) SER(vmull_lane_s32(a,b,c))
#define svmlal_s32(a,b,c) SER(vmlal_s32(a,b,c))
#define svmlal_lane_s32(a,b,c,d) SER(vmlal_lane_s32(a,b,c,d))


// static inline int64x2_t __attribute__((always_inline,unused))
// xvmlal_lane_s32(int64x2_t acc, int32x2_t a, int32x2_t b, const int lane) {
//     __asm__ volatile (
//         "vmlal.s32 %0, %1, %2[%c3]"
//             : "+w"(acc)
//             : "w"(a), "w"(b), "i"(lane)
//     );
//     return acc;
// }

void
p448_mul (
    p448_t *__restrict__ cs,
    const p448_t *as,
    const p448_t *bs
) {
    register int32x4_t al0 __asm__("q6");
    register int32x4_t ah0 __asm__("q7");
    register int32x4_t as0 __asm__("q8");
    register int32x4_t al2 __asm__("q9");
    register int32x4_t ah2 __asm__("q10");
    register int32x4_t as2 __asm__("q11");
    
    register int32x4_t bl0 __asm__("q0");
    register int32x4_t bh0 __asm__("q1");
    register int32x4_t bs0 __asm__("q2");
    register int32x4_t bl2 __asm__("q3");
    register int32x4_t bh2 __asm__("q4");
    register int32x4_t bs2 __asm__("q5");

    int32x2_t *vc = (int32x2_t*) cs->limb, *vcasm = vc;

    register int64x2_t acc0a __asm__("q12");
    register int64x2_t acc0b __asm__("q13");
    register int64x2_t acc1a __asm__("q14");
    register int64x2_t acc1b __asm__("q15");
    
    __asm__ __volatile__(
        
        "vld2.32 {%e[al0],%f[al0],%e[ah0],%f[ah0]}, [%[a],:128]!" "\n\t"
        "vadd.i32 %[as0], %[al0], %[ah0]" "\n\t"
        
        "vld2.32 {%e[bl0],%f[bl0],%e[bh0],%f[bh0]}, [%[b],:128]!" "\n\t"
        "vadd.i32 %f[bs0], %f[bl0], %f[bh0]" "\n\t"
        "vsub.i32 %e[bs0], %e[bl0], %e[bh0]" "\n\t"
            
        "vld2.32 {%e[bl2],%f[bl2],%e[bh2],%f[bh2]}, [%[b],:128]!" "\n\t"
        "vadd.i32 %[bs2], %[bl2], %[bh2]" "\n\t"
            
        "vld2.32 {%e[al2],%f[al2],%e[ah2],%f[ah2]}, [%[a],:128]!" "\n\t"
        "vadd.i32 %[as2], %[al2], %[ah2]" "\n\t"
        
        "vmull.s32 %[a0b], %f[as0], %f[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[as2], %e[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %f[as2], %f[bs0][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[as0], %e[bh0][0]" "\n\t"
            
        "vmull.s32 %[a1b], %f[as0], %f[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as2], %e[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as2], %f[bs0][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as0], %e[bh0][1]" "\n\t"
            
        "vmov %[a0a], %[a0b]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah0], %f[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah2], %e[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah2], %f[bh0][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah0], %e[bl0][0]" "\n\t"
            
        "vmlsl.s32 %[a0b], %f[al0], %f[bl2][0]" "\n\t"
        "vmlsl.s32 %[a0b], %e[al2], %e[bl2][0]" "\n\t"
        "vmlsl.s32 %[a0b], %f[al2], %f[bl0][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[al0], %e[bs0][0]" "\n\t"
            
        "vmov %[a1a], %[a1b]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah0], %f[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah2], %e[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah2], %f[bh0][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah0], %e[bl0][1]" "\n\t"
            
            "vswp %f[a0b], %e[a0a]" "\n\t"
            
        "vmlsl.s32 %[a1b], %f[al0], %f[bl2][1]" "\n\t"
        "vmlsl.s32 %[a1b], %e[al2], %e[bl2][1]" "\n\t"
        "vmlsl.s32 %[a1b], %f[al2], %f[bl0][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[al0], %e[bs0][1]" "\n\t"
                
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vsub.i32 %f[bs0], %f[bl0], %f[bh0]" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a1b], %[a0a], %[a1b]" "\n\t"
                    
                    
        "vmull.s32 %[a0a], %e[as2], %f[bs2][0]" "\n\t"
            "vmovn.i64 %f[a0b], %[a1b]" "\n\t"
        "vmlal.s32 %[a0a], %f[as2], %e[bs2][0]" "\n\t"
            "vsra.s64 %[a1a], %[a1b], #28" "\n\t"
        "vmlal.s32 %[a0a], %e[as0], %f[bh0][0]" "\n\t"
            "vbic.i32 %[a0b], #0xf0000000" "\n\t"
        "vmlal.s32 %[a0a], %f[as0], %e[bh0][0]" "\n\t"
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"
                    
        "vmull.s32 %[a1b], %e[as2], %f[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as2], %e[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as0], %f[bh0][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as0], %e[bh0][1]" "\n\t"

        "vmov %f[a0b], %f[a0a]" "\n\t"
        "vadd.i64 %e[a0b], %e[a0a], %e[a1a]" "\n\t"
        "vadd.i64 %e[a0a], %e[a0a], %f[a1a]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah2], %f[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah2], %e[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah0], %f[bl0][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah0], %e[bl0][0]" "\n\t"

        "vmlsl.s32 %[a0b], %e[al2], %f[bl2][0]" "\n\t"
        "vmlsl.s32 %[a0b], %f[al2], %e[bl2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[al0], %f[bs0][0]" "\n\t"
        "vmlal.s32 %[a0b], %f[al0], %e[bs0][0]" "\n\t"

        "vmov %[a1a], %[a1b]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah2], %f[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah2], %e[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah0], %f[bl0][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah0], %e[bl0][1]" "\n\t"

            "vswp %f[a0b], %e[a0a]" "\n\t"

        "vmlsl.s32 %[a1b], %e[al2], %f[bl2][1]" "\n\t"
        "vmlsl.s32 %[a1b], %f[al2], %e[bl2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[al0], %f[bs0][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[al0], %e[bs0][1]" "\n\t"
                                        
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vsub.i32 %e[bs2], %e[bl2], %e[bh2]" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                        
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a1b], %[a0a], %[a1b]" "\n\t"

        "vmull.s32 %[a0a], %f[as2], %f[bs2][0]" "\n\t"
            "vmovn.i64 %f[a0b], %[a1b]" "\n\t"
        "vmlal.s32 %[a0a], %e[as0], %e[bh2][0]" "\n\t"
            "vsra.s64 %[a1a], %[a1b], #28" "\n\t"
        "vmlal.s32 %[a0a], %f[as0], %f[bh0][0]" "\n\t"
            "vbic.i32 %[a0b], #0xf0000000" "\n\t"
        "vmlal.s32 %[a0a], %e[as2], %e[bh0][0]" "\n\t"
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"

        "vmull.s32 %[a1b], %f[as2], %f[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as0], %e[bh2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as0], %f[bh0][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as2], %e[bh0][1]" "\n\t"

        "vmov %f[a0b], %f[a0a]" "\n\t"
        "vadd.i64 %e[a0b], %e[a0a], %e[a1a]" "\n\t"
        "vadd.i64 %e[a0a], %e[a0a], %f[a1a]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah2], %f[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah0], %e[bl2][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah0], %f[bl0][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah2], %e[bl0][0]" "\n\t"

        "vmlsl.s32 %[a0b], %f[al2], %f[bl2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[al0], %e[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %f[al0], %f[bs0][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[al2], %e[bs0][0]" "\n\t"

        "vmov %[a1a], %[a1b]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah2], %f[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah0], %e[bl2][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah0], %f[bl0][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah2], %e[bl0][1]" "\n\t"

            "vswp %f[a0b], %e[a0a]" "\n\t"

        "vmlsl.s32 %[a1b], %f[al2], %f[bl2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[al0], %e[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[al0], %f[bs0][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[al2], %e[bs0][1]" "\n\t"
                                                                
            "vsub.i32 %f[bs2], %f[bl2], %f[bh2]" "\n\t"
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                        
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a1b], %[a0a], %[a1b]" "\n\t"

        "vmull.s32 %[a0a], %e[as0], %f[bh2][0]" "\n\t"
            "vmovn.i64 %f[a0b], %[a1b]" "\n\t"
        "vmlal.s32 %[a0a], %f[as0], %e[bh2][0]" "\n\t"
            "vsra.s64 %[a1a], %[a1b], #28" "\n\t"
        "vmlal.s32 %[a0a], %e[as2], %f[bh0][0]" "\n\t"
            "vbic.i32 %[a0b], #0xf0000000" "\n\t"
        "vmlal.s32 %[a0a], %f[as2], %e[bh0][0]" "\n\t"
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"

        "vmull.s32 %[a1b], %e[as0], %f[bh2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as0], %e[bh2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as2], %f[bh0][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as2], %e[bh0][1]" "\n\t"

        "vmov %f[a0b], %f[a0a]" "\n\t"
        "vadd.i64 %e[a0b], %e[a0a], %e[a1a]" "\n\t"
        "vadd.i64 %e[a0a], %e[a0a], %f[a1a]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah0], %f[bl2][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah0], %e[bl2][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[ah2], %f[bl0][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[ah2], %e[bl0][0]" "\n\t"

        "vmlal.s32 %[a0b], %e[al0], %f[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %f[al0], %e[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[al2], %f[bs0][0]" "\n\t"
        "vmlal.s32 %[a0b], %f[al2], %e[bs0][0]" "\n\t"

        "vmov %[a1a], %[a1b]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah0], %f[bl2][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah0], %e[bl2][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[ah2], %f[bl0][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[ah2], %e[bl0][1]" "\n\t"

            "vswp %f[a0b], %e[a0a]" "\n\t"

        "vmlal.s32 %[a1b], %e[al0], %f[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[al0], %e[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[al2], %f[bs0][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[al2], %e[bs0][1]" "\n\t"
                        
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                                                                                            
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a0a], %[a0a], %[a1b]" "\n\t"

            "vmovn.i64 %f[a0b], %[a0a]" "\n\t"
            "vsra.s64 %[a1a], %[a0a], #28" "\n\t"
                                                                                            
            "vbic.i32 %[a0b], #0xf0000000" "\n\t" 
                                                                                            
        "vswp %e[a1a], %f[a1a]" "\n\t"
                                                                                            
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"  
            "sub %[c], #64" "\n\t"
                                                                                                
        "vadd.i64 %f[a1a], %f[a1a], %e[a1a]" "\n\t"
        
            "vldmia %[c], {%e[a0a], %f[a0a], %e[a0b]}" "\n\t"
            "vaddw.s32 %[a1a], %e[a0a]" "\n\t"
            "vmovn.i64 %e[a0a], %[a1a]" "\n\t"
            "vshr.s64 %[a1a], #28" "\n\t"
                                                
            "vaddw.s32 %[a1a], %f[a0a]" "\n\t"
            "vmovn.i64 %f[a0a], %[a1a]" "\n\t"
            "vshr.s64 %[a1a], #28" "\n\t"
                                                                                                    
            "vbic.i32 %[a0a], #0xf0000000" "\n\t"
                                                
            "vaddw.s32 %[a1a], %e[a0b]" "\n\t" 
            "vmovn.i64 %e[a0b], %[a1a]" "\n\t"
            
            "vstmia %[c], {%e[a0a], %f[a0a], %e[a0b]}" "\n\t"
        
        : [a0a]"=w"(acc0a)
        , [a0b]"=w"(acc0b)
        , [a1a]"=w"(acc1a)
        , [a1b]"=w"(acc1b)
        , [a]"+r"(as)
        , [b]"+r"(bs)
        , [c]"+r"(vcasm)
        
        , [al0]"=w"(al0)
        , [ah0]"=w"(ah0)
        , [as0]"=w"(as0)
        , [al2]"=w"(al2)
        , [ah2]"=w"(ah2)
        , [as2]"=w"(as2)
        
        , [bh0]"=w"(bh0)
        , [bh2]"=w"(bh2)
        
        , [bl0]"=w"(bl0)
        , [bl2]"=w"(bl2)
        
        , [bs0]"=w"(bs0)
        , [bs2]"=w"(bs2)
                            
        :: "memory"
    );
    
    /*
    acc0b = vmull_lane_s32(       as1, bs3, 0);
    acc0b = vmlal_lane_s32(acc0b, as2, bs2, 0);
    acc0b = vmlal_lane_s32(acc0b, as3, bs1, 0);
    acc0b = vmlal_lane_s32(acc0b, as0, bh0, 0);
    
    acc1b = vmull_lane_s32(       as1, bs3, 1);
    acc1b = vmlal_lane_s32(acc1b, as2, bs2, 1);
    acc1b = vmlal_lane_s32(acc1b, as3, bs1, 1);
    acc1b = vmlal_lane_s32(acc1b, as0, bh0, 1);
    
    acc0a = acc0b;
    acc0a = vmlal_lane_s32(acc0a, ah1, bh3, 0);
    acc0a = vmlal_lane_s32(acc0a, ah2, bh2, 0);
    acc0a = vmlal_lane_s32(acc0a, ah3, bh1, 0);
    acc0a = vmlal_lane_s32(acc0a, ah0, bl0, 0);
    
    acc1a = acc1b;
    acc1a = vmlal_lane_s32(acc1a, ah1, bh3, 1);
    acc1a = vmlal_lane_s32(acc1a, ah2, bh2, 1);
    acc1a = vmlal_lane_s32(acc1a, ah3, bh1, 1);
    acc1a = vmlal_lane_s32(acc1a, ah0, bl0, 1);
    
    acc0b = vmlsl_lane_s32(acc0b, al1, bl3, 0);
    acc0b = vmlsl_lane_s32(acc0b, al2, bl2, 0);
    acc0b = vmlsl_lane_s32(acc0b, al3, bl1, 0);
    acc0b = vmlal_lane_s32(acc0b, al0, bs0, 0);
    
    acc1b = vmlsl_lane_s32(acc1b, al1, bl3, 1);
    acc1b = vmlsl_lane_s32(acc1b, al2, bl2, 1);
    acc1b = vmlsl_lane_s32(acc1b, al3, bl1, 1);
    acc1b = vmlal_lane_s32(acc1b, al0, bs0, 1);
    
    xx_vtrnq_s64(&acc0b, &acc0a);
    xx_vtrnq_s64(&acc1b, &acc1a);
    
    acc0a += acc1b;
    vc[0] = vmovn_s64(acc0b) & vmask;
    
    acc0a = vsraq_n_s64(acc0a,acc0b,28);
    vc[1] = vmovn_s64(acc0a) & vmask;
    bs1 = bl1 - bh1;
    carry = vsraq_n_s64(acc1a,acc0a,28);

    
    acc0b = vmull_lane_s32(       as2, bs3, 0);
    acc0b = vmlal_lane_s32(acc0b, as3, bs2, 0);
    acc0b = vmlal_lane_s32(acc0b, as0, bh1, 0);
    acc0b = vmlal_lane_s32(acc0b, as1, bh0, 0);
    
    acc1b = vmull_lane_s32(       as2, bs3, 1);
    acc1b = vmlal_lane_s32(acc1b, as3, bs2, 1);
    acc1b = vmlal_lane_s32(acc1b, as0, bh1, 1);
    acc1b = vmlal_lane_s32(acc1b, as1, bh0, 1);
    
    //acc0a = acc0b;
    acc0a = vcombine_s64(vget_low_s64(acc0b) + vget_high_s64(carry), vget_high_s64(acc0b));
    acc0b = vcombine_s64(vget_low_s64(acc0b) + vget_low_s64(carry), vget_high_s64(acc0b));
    acc0a = vmlal_lane_s32(acc0a, ah2, bh3, 0);
    acc0a = vmlal_lane_s32(acc0a, ah3, bh2, 0);
    acc0a = vmlal_lane_s32(acc0a, ah0, bl1, 0);
    acc0a = vmlal_lane_s32(acc0a, ah1, bl0, 0);
    
    acc1a = acc1b;
    acc1a = vmlal_lane_s32(acc1a, ah2, bh3, 1);
    acc1a = vmlal_lane_s32(acc1a, ah3, bh2, 1);
    acc1a = vmlal_lane_s32(acc1a, ah0, bl1, 1);
    acc1a = vmlal_lane_s32(acc1a, ah1, bl0, 1);
    
    acc0b = vmlsl_lane_s32(acc0b, al2, bl3, 0);
    acc0b = vmlsl_lane_s32(acc0b, al3, bl2, 0);
    acc0b = vmlal_lane_s32(acc0b, al0, bs1, 0);
    acc0b = vmlal_lane_s32(acc0b, al1, bs0, 0);
    
    acc1b = vmlsl_lane_s32(acc1b, al2, bl3, 1);
    acc1b = vmlsl_lane_s32(acc1b, al3, bl2, 1);
    acc1b = vmlal_lane_s32(acc1b, al0, bs1, 1);
    acc1b = vmlal_lane_s32(acc1b, al1, bs0, 1);
    
    xx_vtrnq_s64(&acc0b, &acc0a);
    xx_vtrnq_s64(&acc1b, &acc1a);
    //acc0b += carry;
    
    acc0a += acc1b;
    acc0a = vsraq_n_s64(acc0a,acc0b,28);
    
    vc[2] = vmovn_s64(acc0b) & vmask;
    vc[3] = vmovn_s64(acc0a) & vmask;
    carry = vsraq_n_s64(acc1a,acc0a,28);

    bs2 = bl2 - bh2;
    
    acc0b = vmull_lane_s32(       as0, bh2, 0);
    acc0b = vmlal_lane_s32(acc0b, as1, bh1, 0);
    acc0b = vmlal_lane_s32(acc0b, as2, bh0, 0);
    acc0b = vmlal_lane_s32(acc0b, as3, bs3, 0);
    
    acc1b = vmull_lane_s32(       as0, bh2, 1);
    acc1b = vmlal_lane_s32(acc1b, as1, bh1, 1);
    acc1b = vmlal_lane_s32(acc1b, as2, bh0, 1);
    acc1b = vmlal_lane_s32(acc1b, as3, bs3, 1);
    
    //acc0a = acc0b;
    acc0a = vcombine_s64(vget_low_s64(acc0b) + vget_high_s64(acc1a), vget_high_s64(acc0b));
    acc0b = vcombine_s64(vget_low_s64(acc0b) + vget_low_s64(acc1a), vget_high_s64(acc0b));
    acc0a = vmlal_lane_s32(acc0a, ah3, bh3, 0);
    acc0a = vmlal_lane_s32(acc0a, ah0, bl2, 0);
    acc0a = vmlal_lane_s32(acc0a, ah1, bl1, 0);
    acc0a = vmlal_lane_s32(acc0a, ah2, bl0, 0);
    
    acc1a = acc1b;
    acc1a = vmlal_lane_s32(acc1a, ah3, bh3, 1);
    acc1a = vmlal_lane_s32(acc1a, ah0, bl2, 1);
    acc1a = vmlal_lane_s32(acc1a, ah1, bl1, 1);
    acc1a = vmlal_lane_s32(acc1a, ah2, bl0, 1);
    
    acc0b = vmlsl_lane_s32(acc0b, al3, bl3, 0);
    acc0b = vmlal_lane_s32(acc0b, al0, bs2, 0);
    acc0b = vmlal_lane_s32(acc0b, al1, bs1, 0);
    acc0b = vmlal_lane_s32(acc0b, al2, bs0, 0);
    
    acc1b = vmlsl_lane_s32(acc1b, al3, bl3, 1);
    acc1b = vmlal_lane_s32(acc1b, al0, bs2, 1);
    acc1b = vmlal_lane_s32(acc1b, al1, bs1, 1);
    acc1b = vmlal_lane_s32(acc1b, al2, bs0, 1);
    

    __asm__ __volatile__ ("vswp %f0, %e1" : "+w"(acc0b), "+w"(acc0a));
    __asm__ __volatile__ ("vswp %f0, %e1" : "+w"(acc1b), "+w"(acc1a));
    //xx_vtrnq_s64_(acc0b, acc0a);
    //xx_vtrnq_s64_(acc1b, acc1a);
    
    //acc0b += acc1a;
    acc0a += acc1b;
    acc0a = vsraq_n_s64(acc0a,acc0b,28);
    
    
    vc[4] = vmovn_s64(acc0b) & vmask;
    vc[5] = vmovn_s64(acc0a) & vmask;
    
    bs3 = bl3 - bh3;
    acc1a = vsraq_n_s64(acc1a,acc0a,28);
    
    
    acc0b = vmull_lane_s32(       as0, bh3, 0);
    acc0b = vmlal_lane_s32(acc0b, as1, bh2, 0);
    acc0b = vmlal_lane_s32(acc0b, as2, bh1, 0);
    acc0b = vmlal_lane_s32(acc0b, as3, bh0, 0);
    
    acc1b = vmull_lane_s32(       as0, bh3, 1);
    acc1b = vmlal_lane_s32(acc1b, as1, bh2, 1);
    acc1b = vmlal_lane_s32(acc1b, as2, bh1, 1);
    acc1b = vmlal_lane_s32(acc1b, as3, bh0, 1);
    
    //acc0a = acc0b;
    acc0a = vcombine_s64(vget_low_s64(acc0b) + vget_high_s64(acc1a), vget_high_s64(acc0b));
    acc0b = vcombine_s64(vget_low_s64(acc0b) + vget_low_s64(acc1a), vget_high_s64(acc0b));
    acc0a = vmlal_lane_s32(acc0a, ah0, bl3, 0);
    acc0a = vmlal_lane_s32(acc0a, ah1, bl2, 0);
    acc0a = vmlal_lane_s32(acc0a, ah2, bl1, 0);
    acc0a = vmlal_lane_s32(acc0a, ah3, bl0, 0);
    
    acc1a = acc1b;
    acc1a = vmlal_lane_s32(acc1a, ah0, bl3, 1);
    acc1a = vmlal_lane_s32(acc1a, ah1, bl2, 1);
    acc1a = vmlal_lane_s32(acc1a, ah2, bl1, 1);
    acc1a = vmlal_lane_s32(acc1a, ah3, bl0, 1);
    
    acc0b = vmlal_lane_s32(acc0b, al0, bs3, 0);
    acc0b = vmlal_lane_s32(acc0b, al1, bs2, 0);
    acc0b = vmlal_lane_s32(acc0b, al2, bs1, 0);
    acc0b = vmlal_lane_s32(acc0b, al3, bs0, 0);
    
    acc1b = vmlal_lane_s32(acc1b, al0, bs3, 1);
    acc1b = vmlal_lane_s32(acc1b, al1, bs2, 1);
    acc1b = vmlal_lane_s32(acc1b, al2, bs1, 1);
    acc1b = vmlal_lane_s32(acc1b, al3, bs0, 1);

    __asm__ __volatile__ ("vswp %f0, %e1" : "+w"(acc0b), "+w"(acc0a));
    __asm__ __volatile__ ("vswp %f0, %e1" : "+w"(acc1b), "+w"(acc1a));
    //xx_vtrnq_s64_(acc0b, acc0a);
    //xx_vtrnq_s64_(acc1b, acc1a);
    //acc0b += acc1a;
    acc0a += acc1b;
    
    acc0a = vsraq_n_s64(acc0a,acc0b,28);
    
    vc[6] = vmovn_s64(acc0b) & vmask;
    vc[7] = vmovn_s64(acc0a) & vmask;
    
    acc1a = vsraq_n_s64(acc1a,acc0a,28);
    
    acc1a = xx_vaddup_s64(vrev128_s64(acc1a));
    
    acc1a = vaddw_s32(acc1a, vc[0]);
    vc[0] = vmovn_s64(acc1a) & vmask;
    
    acc1a = vshrq_n_s64(acc1a,28);
    acc1a = vaddw_s32(acc1a, vc[1]);
    vc[1] = vmovn_s64(acc1a) & vmask;
    
    acc1a = vshrq_n_s64(acc1a,28);
    vc[2] += vmovn_s64(acc1a);;
    */
}

void
p448_sqr (
    p448_t *__restrict__ cs,
    const p448_t *bs
) {
    const p448_t *as = bs;
    register int32x4_t as0 __asm__("q6");
    register int32x4_t as2 __asm__("q7");
    
    register int32x4_t bl0 __asm__("q0");
    register int32x4_t bh0 __asm__("q1");
    register int32x4_t bs0 __asm__("q2");
    register int32x4_t bl2 __asm__("q3");
    register int32x4_t bh2 __asm__("q4");
    register int32x4_t bs2 __asm__("q5");

    int32x2_t *vc = (int32x2_t*) cs->limb, *vcasm = vc;

    register int64x2_t acc0a __asm__("q12");
    register int64x2_t acc0b __asm__("q13");
    register int64x2_t acc1a __asm__("q14");
    register int64x2_t acc1b __asm__("q15");
    
    __asm__ __volatile__ (
        "vld2.32 {%e[bl0],%f[bl0],%e[bh0],%f[bh0]}, [%[b],:128]!" "\n\t"
        "vadd.i32 %f[bs0], %f[bl0], %f[bh0]" "\n\t"
        "vsub.i32 %e[bs0], %e[bl0], %e[bh0]" "\n\t"
        "vadd.i32 %[as0], %[bl0], %[bh0]" "\n\t"
            
        "vld2.32 {%e[bl2],%f[bl2],%e[bh2],%f[bh2]}, [%[b],:128]!" "\n\t"
        "vadd.i32 %[bs2], %[bl2], %[bh2]" "\n\t"
        "vmov %[as2], %[bs2]" "\n\t"
        
        "vqdmull.s32 %[a0b], %f[as0], %f[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[as2], %e[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[as0], %e[bh0][0]" "\n\t"
            
        "vqdmull.s32 %[a1b], %f[as0], %f[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as2], %e[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[as0], %e[bh0][1]" "\n\t"
            
        "vmov %[a0a], %[a0b]" "\n\t"
        "vqdmlal.s32 %[a0a], %f[bh0], %f[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[bh2], %e[bh2][0]" "\n\t"
        "vmlal.s32 %[a0a], %e[bh0], %e[bl0][0]" "\n\t"
            
        "vqdmlsl.s32 %[a0b], %f[bl0], %f[bl2][0]" "\n\t"
        "vmlsl.s32 %[a0b], %e[bl2], %e[bl2][0]" "\n\t"
        "vmlal.s32 %[a0b], %e[bl0], %e[bs0][0]" "\n\t"
            
        "vmov %[a1a], %[a1b]" "\n\t"
        "vqdmlal.s32 %[a1a], %f[bh0], %f[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[bh2], %e[bh2][1]" "\n\t"
        "vmlal.s32 %[a1a], %e[bh0], %e[bl0][1]" "\n\t"
            
            "vswp %f[a0b], %e[a0a]" "\n\t"
            
        "vqdmlsl.s32 %[a1b], %f[bl0], %f[bl2][1]" "\n\t"
        "vmlsl.s32 %[a1b], %e[bl2], %e[bl2][1]" "\n\t"
        "vmlal.s32 %[a1b], %e[bl0], %e[bs0][1]" "\n\t"
                
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vsub.i32 %f[bs0], %f[bl0], %f[bh0]" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a1b], %[a0a], %[a1b]" "\n\t"
                    
                    
        "vqdmull.s32 %[a0a], %e[as2], %f[bs2][0]" "\n\t"
            "vmovn.i64 %f[a0b], %[a1b]" "\n\t"
            "vsra.s64 %[a1a], %[a1b], #28" "\n\t"
        "vqdmlal.s32 %[a0a], %e[as0], %f[bh0][0]" "\n\t"
            "vbic.i32 %[a0b], #0xf0000000" "\n\t"
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"
                    
        "vqdmull.s32 %[a1b], %e[as2], %f[bs2][1]" "\n\t"
        "vqdmlal.s32 %[a1b], %e[as0], %f[bh0][1]" "\n\t"

        "vmov %f[a0b], %f[a0a]" "\n\t"
        "vadd.i64 %e[a0b], %e[a0a], %e[a1a]" "\n\t"
        "vadd.i64 %e[a0a], %e[a0a], %f[a1a]" "\n\t"
        "vqdmlal.s32 %[a0a], %e[bh2], %f[bh2][0]" "\n\t"
        "vqdmlal.s32 %[a0a], %e[bh0], %f[bl0][0]" "\n\t"

        "vqdmlsl.s32 %[a0b], %e[bl2], %f[bl2][0]" "\n\t"
        "vqdmlal.s32 %[a0b], %e[bl0], %f[bs0][0]" "\n\t"

        "vmov %[a1a], %[a1b]" "\n\t"
        "vqdmlal.s32 %[a1a], %e[bh2], %f[bh2][1]" "\n\t"
        "vqdmlal.s32 %[a1a], %e[bh0], %f[bl0][1]" "\n\t"

            "vswp %f[a0b], %e[a0a]" "\n\t"

        "vqdmlsl.s32 %[a1b], %e[bl2], %f[bl2][1]" "\n\t"
        "vqdmlal.s32 %[a1b], %e[bl0], %f[bs0][1]" "\n\t"
                                        
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vsub.i32 %e[bs2], %e[bl2], %e[bh2]" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                        
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a1b], %[a0a], %[a1b]" "\n\t"

        "vmull.s32 %[a0a], %f[as2], %f[bs2][0]" "\n\t"
            "vmovn.i64 %f[a0b], %[a1b]" "\n\t"
        "vqdmlal.s32 %[a0a], %e[as0], %e[bh2][0]" "\n\t"
            "vsra.s64 %[a1a], %[a1b], #28" "\n\t"
        "vmlal.s32 %[a0a], %f[as0], %f[bh0][0]" "\n\t"
            "vbic.i32 %[a0b], #0xf0000000" "\n\t"
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"

        "vmull.s32 %[a1b], %f[as2], %f[bs2][1]" "\n\t"
        "vqdmlal.s32 %[a1b], %e[as0], %e[bh2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[as0], %f[bh0][1]" "\n\t"

        "vmov %f[a0b], %f[a0a]" "\n\t"
        "vadd.i64 %e[a0b], %e[a0a], %e[a1a]" "\n\t"
        "vadd.i64 %e[a0a], %e[a0a], %f[a1a]" "\n\t"
        "vmlal.s32 %[a0a], %f[bh2], %f[bh2][0]" "\n\t"
        "vqdmlal.s32 %[a0a], %e[bh0], %e[bl2][0]" "\n\t"
        "vmlal.s32 %[a0a], %f[bh0], %f[bl0][0]" "\n\t"

        "vmlsl.s32 %[a0b], %f[bl2], %f[bl2][0]" "\n\t"
        "vqdmlal.s32 %[a0b], %e[bl0], %e[bs2][0]" "\n\t"
        "vmlal.s32 %[a0b], %f[bl0], %f[bs0][0]" "\n\t"

        "vmov %[a1a], %[a1b]" "\n\t"
        "vmlal.s32 %[a1a], %f[bh2], %f[bh2][1]" "\n\t"
        "vqdmlal.s32 %[a1a], %e[bh0], %e[bl2][1]" "\n\t"
        "vmlal.s32 %[a1a], %f[bh0], %f[bl0][1]" "\n\t"

            "vswp %f[a0b], %e[a0a]" "\n\t"

        "vmlsl.s32 %[a1b], %f[bl2], %f[bl2][1]" "\n\t"
        "vqdmlal.s32 %[a1b], %e[bl0], %e[bs2][1]" "\n\t"
        "vmlal.s32 %[a1b], %f[bl0], %f[bs0][1]" "\n\t"
                                                                
            "vsub.i32 %f[bs2], %f[bl2], %f[bh2]" "\n\t"
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                        
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a1b], %[a0a], %[a1b]" "\n\t"

        "vqdmull.s32 %[a0a], %e[as0], %f[bh2][0]" "\n\t"
            "vmovn.i64 %f[a0b], %[a1b]" "\n\t"
            "vsra.s64 %[a1a], %[a1b], #28" "\n\t"
        "vqdmlal.s32 %[a0a], %e[as2], %f[bh0][0]" "\n\t"
            "vbic.i32 %[a0b], #0xf0000000" "\n\t"
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"

        "vqdmull.s32 %[a1b], %e[as0], %f[bh2][1]" "\n\t"
        "vqdmlal.s32 %[a1b], %e[as2], %f[bh0][1]" "\n\t"

        "vmov %f[a0b], %f[a0a]" "\n\t"
        "vadd.i64 %e[a0b], %e[a0a], %e[a1a]" "\n\t"
        "vadd.i64 %e[a0a], %e[a0a], %f[a1a]" "\n\t"
        "vqdmlal.s32 %[a0a], %e[bh0], %f[bl2][0]" "\n\t"
        "vqdmlal.s32 %[a0a], %e[bh2], %f[bl0][0]" "\n\t"

        "vqdmlal.s32 %[a0b], %e[bl0], %f[bs2][0]" "\n\t"
        "vqdmlal.s32 %[a0b], %e[bl2], %f[bs0][0]" "\n\t"

        "vmov %[a1a], %[a1b]" "\n\t"
        "vqdmlal.s32 %[a1a], %e[bh0], %f[bl2][1]" "\n\t"
        "vqdmlal.s32 %[a1a], %e[bh2], %f[bl0][1]" "\n\t"

            "vswp %f[a0b], %e[a0a]" "\n\t"

        "vqdmlal.s32 %[a1b], %e[bl0], %f[bs2][1]" "\n\t"
        "vqdmlal.s32 %[a1b], %e[bl2], %f[bs0][1]" "\n\t"
                        
            "vsra.s64 %[a0a], %[a0b], #28" "\n\t"
            "vmovn.i64 %e[a0b], %[a0b]" "\n\t"
                                                                                            
            "vswp %f[a1b], %e[a1a]" "\n\t"
            "vadd.i64 %[a0a], %[a0a], %[a1b]" "\n\t"

            "vmovn.i64 %f[a0b], %[a0a]" "\n\t"
            "vsra.s64 %[a1a], %[a0a], #28" "\n\t"
                                                                                            
            "vbic.i32 %[a0b], #0xf0000000" "\n\t" 
                                                                                            
        "vswp %e[a1a], %f[a1a]" "\n\t"
                                                                                            
            "vstmia %[c]!, {%e[a0b], %f[a0b]}" "\n\t"  
            "sub %[c], #64" "\n\t"
                                                                                                
        "vadd.i64 %f[a1a], %f[a1a], %e[a1a]" "\n\t"
        
            "vldmia %[c], {%e[a0a], %f[a0a], %e[a0b]}" "\n\t"
            "vaddw.s32 %[a1a], %e[a0a]" "\n\t"
            "vmovn.i64 %e[a0a], %[a1a]" "\n\t"
            "vshr.s64 %[a1a], #28" "\n\t"
                                                
            "vaddw.s32 %[a1a], %f[a0a]" "\n\t"
            "vmovn.i64 %f[a0a], %[a1a]" "\n\t"
            "vshr.s64 %[a1a], #28" "\n\t"
                                                                                                    
            "vbic.i32 %[a0a], #0xf0000000" "\n\t"
                                                
            "vaddw.s32 %[a1a], %e[a0b]" "\n\t" 
            "vmovn.i64 %e[a0b], %[a1a]" "\n\t"
            
            "vstmia %[c], {%e[a0a], %f[a0a], %e[a0b]}" "\n\t"
        
        : [a0a]"=w"(acc0a)
        , [a0b]"=w"(acc0b)
        , [a1a]"=w"(acc1a)
        , [a1b]"=w"(acc1b)
        , [a]"+r"(as)
        , [b]"+r"(bs)
        , [c]"+r"(vcasm)
        
        , [as0]"=w"(as0)
        , [as2]"=w"(as2)
        
        , [bh0]"=w"(bh0)
        , [bh2]"=w"(bh2)
        
        , [bl0]"=w"(bl0)
        , [bl2]"=w"(bl2)
        
        , [bs0]"=w"(bs0)
        , [bs2]"=w"(bs2)
                            
        :: "memory"
    );
    
    
    /*
    const int32x2x2_t b0 = vld2_s32((const int32_t *) &bs->limb[0]);
    const int32x2x2_t b1 = vld2_s32((const int32_t *) &bs->limb[4]);
    const int32x2x2_t b2 = vld2_s32((const int32_t *) &bs->limb[8]);
    const int32x2x2_t b3 = vld2_s32((const int32_t *) &bs->limb[12]);
    const int32x2_t vbl[4] = { b0.val[0],  b1.val[0],  b2.val[0],  b3.val[0] };
    const int32x2_t vbh[4] = { b0.val[1],  b1.val[1],  b2.val[1],  b3.val[1] };
    int32x2_t vbm[4];
    
    int i;
    for (i=0; i<4; i++) {
        vbm[i] = vbl[i] - vbh[i];
    }

    int32x2_t *vc = (int32x2_t*) cs->limb;
    */
    
    /* FUTURE possible improvements:
     *    don't use nega-phi algorithm, so as to avoid extra phi-twiddle at end
     *        or use phi/nega-phi for everything, montgomery style
     *        or find some sort of phi algorithm which doesn't have this problem
     *    break up lanemuls so that only diags get 1mul'd instead of diag 2x2 blocks
     *
     * These improvements are all pretty minor, but I guess together they might matter?
     */
    

        
    /*
    int32x2_t vmask = {(1<<28) - 1, (1<<28)-1};

    int64x2_t acc0a, acc0b;
    int64x2_t acc1a, acc1b;
    int64x2_t acc2a, acc2b;
    int64x2_t acc3a, acc3b;
    int64x2_t acc4a, acc4b;
    int64x2_t acc5a, acc5b;
    int64x2_t acc6a, acc6b;
    int64x2_t acc7a, acc7b;
    int64x2_t carry;
    
    acc0a = vqdmull_lane_s32(          vbh[1], vbh[3], 0);
    acc1a = vqdmull_lane_s32(          vbh[1], vbh[3], 1);
    acc2a = vqdmull_lane_s32(          vbh[2], vbh[3], 0);
    acc3a = vqdmull_lane_s32(          vbh[2], vbh[3], 1);
    acc0a =   vmlal_lane_s32(acc0a, vbh[2], vbh[2], 0);
    acc1a =   vmlal_lane_s32(acc1a, vbh[2], vbh[2], 1);
    acc2b = acc2a;
    acc3b = acc3a;
    acc2b = vqdmlal_lane_s32(acc2b, vbh[0], vbh[1], 0);
    acc3b = vqdmlal_lane_s32(acc3b, vbh[0], vbh[1], 1);
    acc0b = acc0a;
    acc1b = acc1a;
    acc0b =   vmlal_lane_s32(acc0b, vbh[0], vbh[0], 0);
    acc1b =   vmlal_lane_s32(acc1b, vbh[0], vbh[0], 1);
    acc0b = vqdmlal_lane_s32(acc0b, vbl[1], vbl[3], 0);
    acc1b = vqdmlal_lane_s32(acc1b, vbl[1], vbl[3], 1);
    acc2b = vqdmlal_lane_s32(acc2b, vbl[2], vbl[3], 0);
    acc3b = vqdmlal_lane_s32(acc3b, vbl[2], vbl[3], 1);
    acc0b =   vmlal_lane_s32(acc0b, vbl[2], vbl[2], 0);
    acc1b =   vmlal_lane_s32(acc1b, vbl[2], vbl[2], 1);
    acc2a += acc2b;
    acc3a += acc3b;
    acc2a = vqdmlal_lane_s32(acc2a, vbl[0], vbl[1], 0);
    acc3a = vqdmlal_lane_s32(acc3a, vbl[0], vbl[1], 1);
    acc0a += acc0b;
    acc1a += acc1b;
    acc0a =   vmlal_lane_s32(acc0a, vbl[0], vbl[0], 0);
    acc1a =   vmlal_lane_s32(acc1a, vbl[0], vbl[0], 1);
    acc0a = vqdmlsl_lane_s32(acc0a, vbm[1], vbm[3], 0);
    acc1a = vqdmlsl_lane_s32(acc1a, vbm[1], vbm[3], 1);
    acc0a =   vmlsl_lane_s32(acc0a, vbm[2], vbm[2], 0);
    acc1a =   vmlsl_lane_s32(acc1a, vbm[2], vbm[2], 1);
    acc2a = vqdmlsl_lane_s32(acc2a, vbm[2], vbm[3], 0);
    acc3a = vqdmlsl_lane_s32(acc3a, vbm[2], vbm[3], 1);
    acc0b += acc0a;
    acc1b += acc1a;
    acc0b =   vmlsl_lane_s32(acc0b, vbm[0], vbm[0], 0);
    acc1b =   vmlsl_lane_s32(acc1b, vbm[0], vbm[0], 1);
    acc2b += acc2a;
    acc3b += acc3a;
    acc2b = vqdmlsl_lane_s32(acc2b, vbm[0], vbm[1], 0);
    acc3b = vqdmlsl_lane_s32(acc3b, vbm[0], vbm[1], 1);
    
    xx_vtrnq_s64(&acc0a, &acc0b);
    xx_vtrnq_s64(&acc1a, &acc1b);
    xx_vtrnq_s64(&acc2a, &acc2b);
    xx_vtrnq_s64(&acc3a, &acc3b);
    
    acc0b += acc1a;
    acc0b = vsraq_n_s64(acc0b,acc0a,28);
    acc1b = vsraq_n_s64(acc1b,acc0b,28);
    acc2a += acc1b;
    acc2b += acc3a;
    acc2b = vsraq_n_s64(acc2b,acc2a,28);
    acc3b = vsraq_n_s64(acc3b,acc2b,28);
    
    vc[0] = (vmovn_s64(acc0a)) & vmask;
    vc[1] = (vmovn_s64(acc0b)) & vmask;
    
    vc[2] = (vmovn_s64(acc2a)) & vmask;
    vc[3] = (vmovn_s64(acc2b)) & vmask;
    carry = acc3b;
    
    acc4a =   vmull_lane_s32(          vbh[3], vbh[3], 0);
    acc5a =   vmull_lane_s32(          vbh[3], vbh[3], 1);
    acc6b = vqdmull_lane_s32(          vbh[0], vbh[3], 0);
    acc7b = vqdmull_lane_s32(          vbh[0], vbh[3], 1);
    acc4b = acc4a;
    acc5b = acc5a;
    acc4b = vqdmlal_lane_s32(acc4b, vbh[0], vbh[2], 0);
    acc5b = vqdmlal_lane_s32(acc5b, vbh[0], vbh[2], 1);
    acc6b = vqdmlal_lane_s32(acc6b, vbh[1], vbh[2], 0);
    acc7b = vqdmlal_lane_s32(acc7b, vbh[1], vbh[2], 1);
    acc4b =   vmlal_lane_s32(acc4b, vbh[1], vbh[1], 0);
    acc5b =   vmlal_lane_s32(acc5b, vbh[1], vbh[1], 1);
    acc4b =   vmlal_lane_s32(acc4b, vbl[3], vbl[3], 0);
    acc5b =   vmlal_lane_s32(acc5b, vbl[3], vbl[3], 1);
    acc6a = acc6b;
    acc7a = acc7b;
    acc6a = vqdmlal_lane_s32(acc6a, vbl[0], vbl[3], 0);
    acc7a = vqdmlal_lane_s32(acc7a, vbl[0], vbl[3], 1);
    acc4a += acc4b;
    acc5a += acc5b;
    acc4a = vqdmlal_lane_s32(acc4a, vbl[0], vbl[2], 0);
    acc5a = vqdmlal_lane_s32(acc5a, vbl[0], vbl[2], 1);
    acc6a = vqdmlal_lane_s32(acc6a, vbl[1], vbl[2], 0);
    acc7a = vqdmlal_lane_s32(acc7a, vbl[1], vbl[2], 1);
    acc4a =   vmlal_lane_s32(acc4a, vbl[1], vbl[1], 0);
    acc5a =   vmlal_lane_s32(acc5a, vbl[1], vbl[1], 1);
    acc4a =   vmlsl_lane_s32(acc4a, vbm[3], vbm[3], 0);
    acc5a =   vmlsl_lane_s32(acc5a, vbm[3], vbm[3], 1);
    acc6b += acc6a;
    acc7b += acc7a;
    acc6b = vqdmlsl_lane_s32(acc6b, vbm[0], vbm[3], 0);
    acc7b = vqdmlsl_lane_s32(acc7b, vbm[0], vbm[3], 1);
    acc4b += acc4a;
    acc5b += acc5a;
    acc4b = vqdmlsl_lane_s32(acc4b, vbm[0], vbm[2], 0);
    acc5b = vqdmlsl_lane_s32(acc5b, vbm[0], vbm[2], 1);
    acc4b =   vmlsl_lane_s32(acc4b, vbm[1], vbm[1], 0);
    acc5b =   vmlsl_lane_s32(acc5b, vbm[1], vbm[1], 1);
    acc6b = vqdmlsl_lane_s32(acc6b, vbm[1], vbm[2], 0);
    acc7b = vqdmlsl_lane_s32(acc7b, vbm[1], vbm[2], 1);
    
    xx_vtrnq_s64(&acc4a, &acc4b);
    xx_vtrnq_s64(&acc5a, &acc5b);
    xx_vtrnq_s64(&acc6a, &acc6b);
    xx_vtrnq_s64(&acc7a, &acc7b);
    
    acc4a += carry;
    acc4b += acc5a;
    acc4b = vsraq_n_s64(acc4b,acc4a,28);
    acc5b = vsraq_n_s64(acc5b,acc4b,28);
    acc6a += acc5b;
    acc6b += acc7a;
    
    
    vc[4] = (vmovn_s64(acc4a)) & vmask;
    vc[5] = (vmovn_s64(acc4b)) & vmask;
    
    acc6b = vsraq_n_s64(acc6b,acc6a,28);
    acc7b = vsraq_n_s64(acc7b,acc6b,28);
    
    vc[6] = (vmovn_s64(acc6a)) & vmask;
    vc[7] = (vmovn_s64(acc6b)) & vmask;
    
    acc7a = xx_vaddup_s64(vrev128_s64(acc7b));

    int32x2_t t0 = vc[0], t1 = vc[1];
    
    acc7a = vaddw_s32(acc7a, t0);
    t0 = vmovn_s64(acc7a) & vmask;
    acc7a = vshrq_n_s64(acc7a,28);
    acc7a = vaddw_s32(acc7a, t1);
    t1 = vmovn_s64(acc7a) & vmask;
    vc[0] = t0;
    vc[1] = t1;
    acc7a = vshrq_n_s64(acc7a,28);

    vc[2] += vmovn_s64(acc7a);
    */
}

void
p448_mulw (
    p448_t *__restrict__ cs,
    const p448_t *as,
    uint64_t b
) { 
    uint32x2_t vmask = {(1<<28) - 1, (1<<28)-1};
    
    uint64x2_t accum;
    const uint32x2_t *va = (const uint32x2_t *) as->limb;
    uint32x2_t *vo = (uint32x2_t *) cs->limb;
    uint32x2_t vc, vn;
    uint32x2_t vb = {b & ((1<<28)-1), b>>28};
    
    accum = vmull_lane_u32(va[7], vb, 1);
    accum = xx_vaddup_u64(vrev128_u64(accum));
    
    vc = va[0];
    accum = vmlal_lane_u32(accum, vc, vb, 0);
    vo[0] = vmovn_u64(accum) & vmask;
    accum = vshrq_n_u64(accum,28);
    
    /* PERF: the right way to do this is to reduce behind, i.e.
     * vmull + vmlal round 0
     * vmull + vmlal round 1
     * vmull + vmlal round 2
     * vsraq round 0, 1
     * vmull + vmlal round 3
     * vsraq round 1, 2
     * ...
     */
    
    int i;
    for (i=1; i<8; i++) {
        vn = va[i];
        accum = vmlal_lane_u32(accum, vc, vb, 1);
        accum = vmlal_lane_u32(accum, vn, vb, 0);
        vo[i] = vmovn_u64(accum) & vmask;
        accum = vshrq_n_u64(accum,28);
        vc = vn;
    }
        
    accum = xx_vaddup_u64(vrev128_u64(accum));
    accum = vaddw_u32(accum, vo[0]);
    vo[0] = vmovn_u64(accum) & vmask;
    
    accum = vshrq_n_u64(accum,28);
    vo[1] += vmovn_u64(accum);
}

/* TODO: vectorize? */
void
p448_strong_reduce (
    p448_t *a
) { 
    word_t mask = (1ull<<28)-1;

    /* first, clear high */
    a->limb[1] += a->limb[15]>>28;
    a->limb[0] += a->limb[15]>>28;
    a->limb[15] &= mask;

    /* now the total is less than 2^448 - 2^(448-56) + 2^(448-56+8) < 2p */

    /* compute total_value - p.  No need to reduce mod p. */

    dsword_t scarry = 0;
    int i;
    for (i=0; i<16; i++) {
        scarry = scarry + a->limb[LIMBPERM(i)] - ((i==8)?mask-1:mask);
        a->limb[LIMBPERM(i)] = scarry & mask;
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
        carry = carry + a->limb[LIMBPERM(i)] + ((i==8)?(scarry_mask&~1):scarry_mask);
        a->limb[LIMBPERM(i)] = carry & mask;
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
        uint64_t limb = red.limb[LIMBPERM(2*i)] + (((uint64_t)red.limb[LIMBPERM(2*i+1)])<<28);
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
        x->limb[LIMBPERM(2*i)] = out & ((1ull<<28)-1);
        x->limb[LIMBPERM(2*i+1)] = out >> 28;
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
        ge &= x->limb[LIMBPERM(i)];
    }
    
    /* At this point, ge = 1111 iff bottom are all 1111.  Now propagate if 1110, or set if 1111 */
    ge = (ge & (x->limb[LIMBPERM(8)] + 1)) | is_zero(x->limb[LIMBPERM(8)] ^ mask);
    
    /* Propagate the rest */
    for (i=9; i<16; i++) {
        ge &= x->limb[LIMBPERM(i)];
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
