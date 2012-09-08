@include "common.pq"
@define c input_0
@define k input_1
 
reg128 xmm0
reg128 xmm1
reg128 xmm2
reg128 xmm3
reg128 xmm4
reg128 xmm5
reg128 xmm6
reg128 xmm7
reg128 xmm8
reg128 xmm9
reg128 xmm10
reg128 xmm11
reg128 xmm12
reg128 xmm13
reg128 xmm14
reg128 xmm15
reg128 t
reg128 tt
reg128 t0
reg128 t1
reg128 t2
reg128 t3
reg128 t4
reg128 t5
reg128 t6
reg128 t7
reg128 u
reg128 u0
reg128 u1
reg128 u2
reg128 u3
reg128 u4
reg128 u5
reg128 u6
reg128 u7

qpushenter crypto_stream_aes128ctr_neon_beforenm

bitslicekey0(k, c)

keyexpbs1(xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0 ^= u, c)
keyexpbs(xmm0, xmm1, xmm4, xmm6, xmm3, xmm7, xmm2, xmm5, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm1 ^= u, c)
keyexpbs(xmm0, xmm1, xmm3, xmm2, xmm6, xmm5, xmm4, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm6 ^= u, c)
keyexpbs(xmm0, xmm1, xmm6, xmm4, xmm2, xmm7, xmm3, xmm5, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm3 ^= u, c)

keyexpbs(xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm3 ^= u, c)
keyexpbs(xmm0, xmm1, xmm4, xmm6, xmm3, xmm7, xmm2, xmm5, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm5 ^= u, c)
keyexpbs(xmm0, xmm1, xmm3, xmm2, xmm6, xmm5, xmm4, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm3 ^= u, c)
keyexpbs(xmm0, xmm1, xmm6, xmm4, xmm2, xmm7, xmm3, xmm5, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm7 ^= u, c)

keyexpbs(xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0 ^= u;\xmm1 ^= u;\xmm6 ^= u;\xmm3 ^= u, c)
keyexpbs10(xmm0, xmm1, xmm4, xmm6, xmm3, xmm7, xmm2, xmm5, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15,c)

qpopreturn
