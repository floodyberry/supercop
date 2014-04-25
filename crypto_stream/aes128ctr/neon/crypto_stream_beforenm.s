
# qhasm: int32 input_0

# qhasm: int32 input_1

# qhasm: int32 input_2

# qhasm: int32 input_3

# qhasm: stack32 input_4

# qhasm: stack32 input_5

# qhasm: stack32 input_6

# qhasm: stack32 input_7

# qhasm: int32 caller_r4

# qhasm: int32 caller_r5

# qhasm: int32 caller_r6

# qhasm: int32 caller_r7

# qhasm: int32 caller_r8

# qhasm: int32 caller_r9

# qhasm: int32 caller_r10

# qhasm: int32 caller_r11

# qhasm: int32 caller_r12

# qhasm: int32 caller_r14

# qhasm: reg128 caller_q4

# qhasm: reg128 caller_q5

# qhasm: reg128 caller_q6

# qhasm: reg128 caller_q7

# qhasm: startcode
.fpu neon
.text

# qhasm: reg128 xmm0

# qhasm: reg128 xmm1

# qhasm: reg128 xmm2

# qhasm: reg128 xmm3

# qhasm: reg128 xmm4

# qhasm: reg128 xmm5

# qhasm: reg128 xmm6

# qhasm: reg128 xmm7

# qhasm: reg128 xmm8

# qhasm: reg128 xmm9

# qhasm: reg128 xmm10

# qhasm: reg128 xmm11

# qhasm: reg128 xmm12

# qhasm: reg128 xmm13

# qhasm: reg128 xmm14

# qhasm: reg128 xmm15

# qhasm: reg128 t

# qhasm: reg128 tt

# qhasm: reg128 t0

# qhasm: reg128 t1

# qhasm: reg128 t2

# qhasm: reg128 t3

# qhasm: reg128 t4

# qhasm: reg128 t5

# qhasm: reg128 t6

# qhasm: reg128 t7

# qhasm: reg128 u

# qhasm: reg128 u0

# qhasm: reg128 u1

# qhasm: reg128 u2

# qhasm: reg128 u3

# qhasm: reg128 u4

# qhasm: reg128 u5

# qhasm: reg128 u6

# qhasm: reg128 u7

# qhasm: qpushenter crypto_stream_aes128ctr_neon_beforenm
.align 2
.global _crypto_stream_aes128ctr_neon_beforenm
.global crypto_stream_aes128ctr_neon_beforenm
.type _crypto_stream_aes128ctr_neon_beforenm STT_FUNC
.type crypto_stream_aes128ctr_neon_beforenm STT_FUNC
_crypto_stream_aes128ctr_neon_beforenm:
crypto_stream_aes128ctr_neon_beforenm:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#0
and sp,sp,#0xffffffe0

# qhasm:   xmm0 = mem128[input_1]
# asm 1: vld1.8 {>xmm0=reg128#1%bot->xmm0=reg128#1%top},[<input_1=int32#2]
# asm 2: vld1.8 {>xmm0=d0->xmm0=d1},[<input_1=r1]
vld1.8 {d0-d1},[r1]

# qhasm:     xmm0 = xmm0[0,2,1,3]
# asm 1: vtrn.32 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.32 <xmm0=d0,<xmm0=d1
vtrn.32 d0,d1

# qhasm:     xmm0 = xmm0[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.8 <xmm0=d0,<xmm0=d1
vtrn.8 d0,d1

# qhasm:     xmm0 = xmm0[0,2,1,3]
# asm 1: vtrn.32 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.32 <xmm0=d0,<xmm0=d1
vtrn.32 d0,d1

# qhasm:     xmm0 = xmm0[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.16 <xmm0=d0,<xmm0=d1
vtrn.16 d0,d1

# qhasm:     xmm0 = xmm0[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vrev64.i8 >xmm0=q0,<xmm0=q0
vrev64.i8 q0,q0

# qhasm:     xmm0 = xmm0[1,0]
# asm 1: vswp <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vswp <xmm0=d0,<xmm0=d1
vswp d0,d1

# qhasm:   xmm1 = xmm0
# asm 1: vmov >xmm1=reg128#2,<xmm0=reg128#1
# asm 2: vmov >xmm1=q1,<xmm0=q0
vmov q1,q0

# qhasm:   xmm2 = xmm0
# asm 1: vmov >xmm2=reg128#3,<xmm0=reg128#1
# asm 2: vmov >xmm2=q2,<xmm0=q0
vmov q2,q0

# qhasm:   xmm3 = xmm0
# asm 1: vmov >xmm3=reg128#4,<xmm0=reg128#1
# asm 2: vmov >xmm3=q3,<xmm0=q0
vmov q3,q0

# qhasm:   xmm4 = xmm0
# asm 1: vmov >xmm4=reg128#5,<xmm0=reg128#1
# asm 2: vmov >xmm4=q4,<xmm0=q0
vmov q4,q0

# qhasm:   xmm5 = xmm0
# asm 1: vmov >xmm5=reg128#6,<xmm0=reg128#1
# asm 2: vmov >xmm5=q5,<xmm0=q0
vmov q5,q0

# qhasm:   xmm6 = xmm0
# asm 1: vmov >xmm6=reg128#7,<xmm0=reg128#1
# asm 2: vmov >xmm6=q6,<xmm0=q0
vmov q6,q0

# qhasm:   xmm7 = xmm0
# asm 1: vmov >xmm7=reg128#8,<xmm0=reg128#1
# asm 2: vmov >xmm7=q7,<xmm0=q0
vmov q7,q0

# qhasm:     u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
# asm 1: vmov.i8 >u=reg128#9,#0x55
# asm 2: vmov.i8 >u=q8,#0x55
vmov.i8 q8,#0x55

# qhasm:       2x t0 = xmm6 unsigned>> 1
# asm 1: vshr.u64 >t0=reg128#10,<xmm6=reg128#7,#1
# asm 2: vshr.u64 >t0=q9,<xmm6=q6,#1
vshr.u64 q9,q6,#1

# qhasm:       2x t2 = xmm4 unsigned>> 1
# asm 1: vshr.u64 >t2=reg128#11,<xmm4=reg128#5,#1
# asm 2: vshr.u64 >t2=q10,<xmm4=q4,#1
vshr.u64 q10,q4,#1

# qhasm:       2x t4 = xmm2 unsigned>> 1
# asm 1: vshr.u64 >t4=reg128#12,<xmm2=reg128#3,#1
# asm 2: vshr.u64 >t4=q11,<xmm2=q2,#1
vshr.u64 q11,q2,#1

# qhasm:       2x t6 = xmm0 unsigned>> 1
# asm 1: vshr.u64 >t6=reg128#13,<xmm0=reg128#1,#1
# asm 2: vshr.u64 >t6=q12,<xmm0=q0,#1
vshr.u64 q12,q0,#1

# qhasm:       t0 ^= xmm7
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<xmm7=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<xmm7=q7
veor q9,q9,q7

# qhasm:       t2 ^= xmm5
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<xmm5=reg128#6
# asm 2: veor >t2=q10,<t2=q10,<xmm5=q5
veor q10,q10,q5

# qhasm:       t4 ^= xmm3
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<xmm3=reg128#4
# asm 2: veor >t4=q11,<t4=q11,<xmm3=q3
veor q11,q11,q3

# qhasm:       t6 ^= xmm1
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<xmm1=reg128#2
# asm 2: veor >t6=q12,<t6=q12,<xmm1=q1
veor q12,q12,q1

# qhasm:       t0 &= u
# asm 1: vand >t0=reg128#10,<t0=reg128#10,<u=reg128#9
# asm 2: vand >t0=q9,<t0=q9,<u=q8
vand q9,q9,q8

# qhasm:       t2 &= u
# asm 1: vand >t2=reg128#11,<t2=reg128#11,<u=reg128#9
# asm 2: vand >t2=q10,<t2=q10,<u=q8
vand q10,q10,q8

# qhasm:       t4 &= u
# asm 1: vand >t4=reg128#12,<t4=reg128#12,<u=reg128#9
# asm 2: vand >t4=q11,<t4=q11,<u=q8
vand q11,q11,q8

# qhasm:       t6 &= u
# asm 1: vand >t6=reg128#9,<t6=reg128#13,<u=reg128#9
# asm 2: vand >t6=q8,<t6=q12,<u=q8
vand q8,q12,q8

# qhasm:       xmm7 ^= t0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<t0=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<t0=q9
veor q7,q7,q9

# qhasm:       xmm5 ^= t2
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<t2=reg128#11
# asm 2: veor >xmm5=q5,<xmm5=q5,<t2=q10
veor q5,q5,q10

# qhasm:       xmm3 ^= t4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<t4=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<t4=q11
veor q3,q3,q11

# qhasm:       xmm1 ^= t6
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<t6=reg128#9
# asm 2: veor >xmm1=q1,<xmm1=q1,<t6=q8
veor q1,q1,q8

# qhasm:       2x t0 <<= 1
# asm 1: vshl.i64 >t0=reg128#10,<t0=reg128#10,#1
# asm 2: vshl.i64 >t0=q9,<t0=q9,#1
vshl.i64 q9,q9,#1

# qhasm:       2x t2 <<= 1
# asm 1: vshl.i64 >t2=reg128#11,<t2=reg128#11,#1
# asm 2: vshl.i64 >t2=q10,<t2=q10,#1
vshl.i64 q10,q10,#1

# qhasm:       2x t4 <<= 1
# asm 1: vshl.i64 >t4=reg128#12,<t4=reg128#12,#1
# asm 2: vshl.i64 >t4=q11,<t4=q11,#1
vshl.i64 q11,q11,#1

# qhasm:       2x t6 <<= 1
# asm 1: vshl.i64 >t6=reg128#9,<t6=reg128#9,#1
# asm 2: vshl.i64 >t6=q8,<t6=q8,#1
vshl.i64 q8,q8,#1

# qhasm:       xmm6 ^= t0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<t0=reg128#10
# asm 2: veor >xmm6=q6,<xmm6=q6,<t0=q9
veor q6,q6,q9

# qhasm:       xmm4 ^= t2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<t2=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<t2=q10
veor q4,q4,q10

# qhasm:       xmm2 ^= t4
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<t4=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<t4=q11
veor q2,q2,q11

# qhasm:       xmm0 ^= t6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<t6=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<t6=q8
veor q0,q0,q8

# qhasm:     u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33
# asm 1: vmov.i8 >u=reg128#9,#0x33
# asm 2: vmov.i8 >u=q8,#0x33
vmov.i8 q8,#0x33

# qhasm:       2x t0 = xmm5 unsigned>> 2
# asm 1: vshr.u64 >t0=reg128#10,<xmm5=reg128#6,#2
# asm 2: vshr.u64 >t0=q9,<xmm5=q5,#2
vshr.u64 q9,q5,#2

# qhasm:       2x t2 = xmm4 unsigned>> 2
# asm 1: vshr.u64 >t2=reg128#11,<xmm4=reg128#5,#2
# asm 2: vshr.u64 >t2=q10,<xmm4=q4,#2
vshr.u64 q10,q4,#2

# qhasm:       2x t4 = xmm1 unsigned>> 2
# asm 1: vshr.u64 >t4=reg128#12,<xmm1=reg128#2,#2
# asm 2: vshr.u64 >t4=q11,<xmm1=q1,#2
vshr.u64 q11,q1,#2

# qhasm:       2x t6 = xmm0 unsigned>> 2
# asm 1: vshr.u64 >t6=reg128#13,<xmm0=reg128#1,#2
# asm 2: vshr.u64 >t6=q12,<xmm0=q0,#2
vshr.u64 q12,q0,#2

# qhasm:       t0 ^= xmm7
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<xmm7=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<xmm7=q7
veor q9,q9,q7

# qhasm:       t2 ^= xmm6
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<xmm6=reg128#7
# asm 2: veor >t2=q10,<t2=q10,<xmm6=q6
veor q10,q10,q6

# qhasm:       t4 ^= xmm3
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<xmm3=reg128#4
# asm 2: veor >t4=q11,<t4=q11,<xmm3=q3
veor q11,q11,q3

# qhasm:       t6 ^= xmm2
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<xmm2=reg128#3
# asm 2: veor >t6=q12,<t6=q12,<xmm2=q2
veor q12,q12,q2

# qhasm:       t0 &= u
# asm 1: vand >t0=reg128#10,<t0=reg128#10,<u=reg128#9
# asm 2: vand >t0=q9,<t0=q9,<u=q8
vand q9,q9,q8

# qhasm:       t2 &= u
# asm 1: vand >t2=reg128#11,<t2=reg128#11,<u=reg128#9
# asm 2: vand >t2=q10,<t2=q10,<u=q8
vand q10,q10,q8

# qhasm:       t4 &= u
# asm 1: vand >t4=reg128#12,<t4=reg128#12,<u=reg128#9
# asm 2: vand >t4=q11,<t4=q11,<u=q8
vand q11,q11,q8

# qhasm:       t6 &= u
# asm 1: vand >t6=reg128#9,<t6=reg128#13,<u=reg128#9
# asm 2: vand >t6=q8,<t6=q12,<u=q8
vand q8,q12,q8

# qhasm:       xmm7 ^= t0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<t0=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<t0=q9
veor q7,q7,q9

# qhasm:       xmm6 ^= t2
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<t2=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<t2=q10
veor q6,q6,q10

# qhasm:       xmm3 ^= t4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<t4=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<t4=q11
veor q3,q3,q11

# qhasm:       xmm2 ^= t6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<t6=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<t6=q8
veor q2,q2,q8

# qhasm:       2x t0 <<= 2
# asm 1: vshl.i64 >t0=reg128#10,<t0=reg128#10,#2
# asm 2: vshl.i64 >t0=q9,<t0=q9,#2
vshl.i64 q9,q9,#2

# qhasm:       2x t2 <<= 2
# asm 1: vshl.i64 >t2=reg128#11,<t2=reg128#11,#2
# asm 2: vshl.i64 >t2=q10,<t2=q10,#2
vshl.i64 q10,q10,#2

# qhasm:       2x t4 <<= 2
# asm 1: vshl.i64 >t4=reg128#12,<t4=reg128#12,#2
# asm 2: vshl.i64 >t4=q11,<t4=q11,#2
vshl.i64 q11,q11,#2

# qhasm:       2x t6 <<= 2
# asm 1: vshl.i64 >t6=reg128#9,<t6=reg128#9,#2
# asm 2: vshl.i64 >t6=q8,<t6=q8,#2
vshl.i64 q8,q8,#2

# qhasm:       xmm5 ^= t0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<t0=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<t0=q9
veor q5,q5,q9

# qhasm:       xmm4 ^= t2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<t2=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<t2=q10
veor q4,q4,q10

# qhasm:       xmm1 ^= t4
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<t4=reg128#12
# asm 2: veor >xmm1=q1,<xmm1=q1,<t4=q11
veor q1,q1,q11

# qhasm:       xmm0 ^= t6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<t6=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<t6=q8
veor q0,q0,q8

# qhasm:     u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
# asm 1: vmov.i8 >u=reg128#9,#0x0f
# asm 2: vmov.i8 >u=q8,#0x0f
vmov.i8 q8,#0x0f

# qhasm:       2x t0 = xmm3 unsigned>> 4
# asm 1: vshr.u64 >t0=reg128#10,<xmm3=reg128#4,#4
# asm 2: vshr.u64 >t0=q9,<xmm3=q3,#4
vshr.u64 q9,q3,#4

# qhasm:       2x t2 = xmm2 unsigned>> 4
# asm 1: vshr.u64 >t2=reg128#11,<xmm2=reg128#3,#4
# asm 2: vshr.u64 >t2=q10,<xmm2=q2,#4
vshr.u64 q10,q2,#4

# qhasm:       2x t4 = xmm1 unsigned>> 4
# asm 1: vshr.u64 >t4=reg128#12,<xmm1=reg128#2,#4
# asm 2: vshr.u64 >t4=q11,<xmm1=q1,#4
vshr.u64 q11,q1,#4

# qhasm:       2x t6 = xmm0 unsigned>> 4
# asm 1: vshr.u64 >t6=reg128#13,<xmm0=reg128#1,#4
# asm 2: vshr.u64 >t6=q12,<xmm0=q0,#4
vshr.u64 q12,q0,#4

# qhasm:       t0 ^= xmm7
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<xmm7=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<xmm7=q7
veor q9,q9,q7

# qhasm:       t2 ^= xmm6
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<xmm6=reg128#7
# asm 2: veor >t2=q10,<t2=q10,<xmm6=q6
veor q10,q10,q6

# qhasm:       t4 ^= xmm5
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<xmm5=reg128#6
# asm 2: veor >t4=q11,<t4=q11,<xmm5=q5
veor q11,q11,q5

# qhasm:       t6 ^= xmm4
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<xmm4=reg128#5
# asm 2: veor >t6=q12,<t6=q12,<xmm4=q4
veor q12,q12,q4

# qhasm:       t0 &= u
# asm 1: vand >t0=reg128#10,<t0=reg128#10,<u=reg128#9
# asm 2: vand >t0=q9,<t0=q9,<u=q8
vand q9,q9,q8

# qhasm:       t2 &= u
# asm 1: vand >t2=reg128#11,<t2=reg128#11,<u=reg128#9
# asm 2: vand >t2=q10,<t2=q10,<u=q8
vand q10,q10,q8

# qhasm:       t4 &= u
# asm 1: vand >t4=reg128#12,<t4=reg128#12,<u=reg128#9
# asm 2: vand >t4=q11,<t4=q11,<u=q8
vand q11,q11,q8

# qhasm:       t6 &= u
# asm 1: vand >t6=reg128#9,<t6=reg128#13,<u=reg128#9
# asm 2: vand >t6=q8,<t6=q12,<u=q8
vand q8,q12,q8

# qhasm:       xmm7 ^= t0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<t0=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<t0=q9
veor q7,q7,q9

# qhasm:       xmm6 ^= t2
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<t2=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<t2=q10
veor q6,q6,q10

# qhasm:       xmm5 ^= t4
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<t4=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<t4=q11
veor q5,q5,q11

# qhasm:       xmm4 ^= t6
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<t6=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<t6=q8
veor q4,q4,q8

# qhasm:       2x t0 <<= 4
# asm 1: vshl.i64 >t0=reg128#10,<t0=reg128#10,#4
# asm 2: vshl.i64 >t0=q9,<t0=q9,#4
vshl.i64 q9,q9,#4

# qhasm:       2x t2 <<= 4
# asm 1: vshl.i64 >t2=reg128#11,<t2=reg128#11,#4
# asm 2: vshl.i64 >t2=q10,<t2=q10,#4
vshl.i64 q10,q10,#4

# qhasm:       2x t4 <<= 4
# asm 1: vshl.i64 >t4=reg128#12,<t4=reg128#12,#4
# asm 2: vshl.i64 >t4=q11,<t4=q11,#4
vshl.i64 q11,q11,#4

# qhasm:       2x t6 <<= 4
# asm 1: vshl.i64 >t6=reg128#9,<t6=reg128#9,#4
# asm 2: vshl.i64 >t6=q8,<t6=q8,#4
vshl.i64 q8,q8,#4

# qhasm:       xmm3 ^= t0
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<t0=reg128#10
# asm 2: veor >xmm3=q3,<xmm3=q3,<t0=q9
veor q3,q3,q9

# qhasm:       xmm2 ^= t2
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<t2=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<t2=q10
veor q2,q2,q10

# qhasm:       xmm1 ^= t4
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<t4=reg128#12
# asm 2: veor >xmm1=q1,<xmm1=q1,<t4=q11
veor q1,q1,q11

# qhasm:       xmm0 ^= t6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<t6=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<t6=q8
veor q0,q0,q8

# qhasm:   mem128[input_0] aligned= xmm0;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm1;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm2;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm3;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm4;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm6;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     xmm5 ^= xmm6
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm6=reg128#7
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm6=q6
veor q5,q5,q6

# qhasm:     xmm2 ^= xmm1
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm1=reg128#2
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm1=q1
veor q2,q2,q1

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm6 ^= xmm2
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm2=reg128#3
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm2=q2
veor q6,q6,q2

# qhasm:     xmm3 ^= xmm0
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm0=q0
veor q3,q3,q0

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm7 ^= xmm5
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm5=reg128#6
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm5=q5
veor q7,q7,q5

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm3 ^= xmm1
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm1=reg128#2
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm1=q1
veor q3,q3,q1

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:       xmm11 = xmm7 ^ xmm4
# asm 1: veor >xmm11=reg128#9,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm11=q8,<xmm7=q7,<xmm4=q4
veor q8,q7,q4

# qhasm:       xmm10 = xmm1 ^ xmm2
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm2=q2
veor q9,q1,q2

# qhasm:       xmm9 = xmm5 ^ xmm3
# asm 1: veor >xmm9=reg128#11,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm9=q10,<xmm5=q5,<xmm3=q3
veor q10,q5,q3

# qhasm:       xmm13 = xmm2 ^ xmm4
# asm 1: veor >xmm13=reg128#12,<xmm2=reg128#3,<xmm4=reg128#5
# asm 2: veor >xmm13=q11,<xmm2=q2,<xmm4=q4
veor q11,q2,q4

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm6=q6,<xmm0=q0
veor q12,q6,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm3=q3,<xmm0=q0
veor q12,q3,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm7 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm7=q7,<xmm1=q1
veor q11,q7,q1

# qhasm:       xmm12 = xmm5 ^ xmm6
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm6=reg128#7
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm6=q6
veor q12,q5,q6

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm2 & xmm3
# asm 1: vand >xmm12=reg128#13,<xmm2=reg128#3,<xmm3=reg128#4
# asm 2: vand >xmm12=q12,<xmm2=q2,<xmm3=q3
vand q12,q2,q3

# qhasm:       xmm13 = xmm4 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm4=q4,<xmm0=q0
vand q13,q4,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm5
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm5=q5
vand q12,q1,q5

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm7 | xmm6
# asm 1: vorr >xmm15=reg128#15,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: vorr >xmm15=q14,<xmm7=q7,<xmm6=q6
vorr q14,q7,q6

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm5 ^ xmm3
# asm 1: veor >xmm8=reg128#13,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm8=q12,<xmm5=q5,<xmm3=q3
veor q12,q5,q3

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm6=q6,<xmm0=q0
veor q13,q6,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm6
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm6=reg128#7
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm6=q6
vand q14,q14,q6

# qhasm:       xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:       xmm5 &= xmm15
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm15=q9
vand q5,q5,q9

# qhasm:       xmm6 &= xmm14
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#12
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm14=q11
vand q6,q6,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm5 ^= xmm10
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm10=reg128#15
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm10=q14
veor q5,q5,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm3
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm3=reg128#4
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm3=q3
veor q0,q0,q3

# qhasm:       xmm3 &= xmm13
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm13=reg128#9
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm13=q8
vand q3,q3,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#14
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q13
veor q6,q6,q13

# qhasm:       xmm0 ^= xmm3
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm3=reg128#4
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm3=q3
veor q0,q0,q3

# qhasm:       xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#15
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q14
veor q3,q3,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm5 ^= xmm8
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm8=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm8=q12
veor q5,q5,q12

# qhasm:       xmm3 ^= xmm8
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm8=reg128#13
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm8=q12
veor q3,q3,q12

# qhasm:       xmm12 = xmm7 ^ xmm4
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm4=q4
veor q12,q7,q4

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm2
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm2=q2
veor q14,q1,q2

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm4
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm4=reg128#5
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm4=q4
vand q13,q15,q4

# qhasm:       xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:       xmm2 &= xmm13
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm13=reg128#9
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm13=q8
vand q2,q2,q8

# qhasm:       xmm4 &= xmm9
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm9=reg128#11
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm9=q10
vand q4,q4,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#14
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q13
veor q2,q2,q13

# qhasm:       xmm11 &= xmm7
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm7=reg128#8
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm7=q7
vand q10,q10,q7

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm7 &= xmm14
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm14=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm14=q9
vand q7,q7,q9

# qhasm:       xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#13
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q12
veor q4,q4,q12

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm7 ^= xmm12
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm12=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm12=q12
veor q7,q7,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm2 ^= xmm8
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm8=reg128#15
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm8=q14
veor q2,q2,q14

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm1 ^= xmm6
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm6=q6
veor q1,q1,q6

# qhasm:     xmm4 ^= xmm7
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm7=reg128#8
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm7=q7
veor q4,q4,q7

# qhasm:     xmm6 ^= xmm0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm0=q0
veor q6,q6,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:     xmm5 ^= xmm2
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm2=q2
veor q5,q5,q2

# qhasm:     xmm2 ^= xmm3
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm3=reg128#4
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm3=q3
veor q2,q2,q3

# qhasm:     xmm3 ^= xmm5
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm5=reg128#6
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm5=q5
veor q3,q3,q5

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm0 ^= u
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<u=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<u=q8
veor q0,q0,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm4 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u2=q10,<xmm4=q4,#8
vshl.i32 q10,q4,#8

# qhasm:     4x u3 = xmm6 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u3=q11,<xmm6=q6,#8
vshl.i32 q11,q6,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm4 |= u2
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u2=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u2=q10
vorr q4,q4,q10

# qhasm:     xmm6 |= u3
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u3=reg128#12
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u3=q11
vorr q6,q6,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm4 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u2=q10,<xmm4=q4,#16
vshl.i32 q10,q4,#16

# qhasm:     4x u3 = xmm6 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u3=q11,<xmm6=q6,#16
vshl.i32 q11,q6,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm4 |= u2
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u2=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u2=q10
vorr q4,q4,q10

# qhasm:     xmm6 |= u3
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u3=reg128#12
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u3=q11
vorr q6,q6,q11

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x u4 = xmm3 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u4=q8,<xmm3=q3,#8
vshl.i32 q8,q3,#8

# qhasm:     4x u5 = xmm7 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#8
vshl.i32 q9,q7,#8

# qhasm:     4x u6 = xmm2 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u6=q10,<xmm2=q2,#8
vshl.i32 q10,q2,#8

# qhasm:     4x u7 = xmm5 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#8
vshl.i32 q11,q5,#8

# qhasm:     xmm3 |= u4
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u4=reg128#9
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u4=q8
vorr q3,q3,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm2 |= u6
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u6=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u6=q10
vorr q2,q2,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:     4x u4 = xmm3 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u4=q8,<xmm3=q3,#16
vshl.i32 q8,q3,#16

# qhasm:     4x u5 = xmm7 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#16
vshl.i32 q9,q7,#16

# qhasm:     4x u6 = xmm2 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u6=q10,<xmm2=q2,#16
vshl.i32 q10,q2,#16

# qhasm:     4x u7 = xmm5 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#16
vshl.i32 q11,q5,#16

# qhasm:     xmm3 |= u4
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u4=reg128#9
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u4=q8
vorr q3,q3,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm2 |= u6
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u6=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u6=q10
vorr q2,q2,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm7 = ~xmm7
# asm 1: vmvn >xmm7=reg128#8,<xmm7=reg128#8
# asm 2: vmvn >xmm7=q7,<xmm7=q7
vmvn q7,q7

# qhasm:   xmm2 = ~xmm2
# asm 1: vmvn >xmm2=reg128#3,<xmm2=reg128#3
# asm 2: vmvn >xmm2=q2,<xmm2=q2
vmvn q2,q2

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     xmm7 ^= xmm2
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm2=reg128#3
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm2=q2
veor q7,q7,q2

# qhasm:     xmm4 ^= xmm1
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm1=reg128#2
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm1=q1
veor q4,q4,q1

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm2 ^= xmm4
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm4=reg128#5
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm4=q4
veor q2,q2,q4

# qhasm:     xmm6 ^= xmm0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm0=q0
veor q6,q6,q0

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm5 ^= xmm7
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm7=reg128#8
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm7=q7
veor q5,q5,q7

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm6 ^= xmm1
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm1=reg128#2
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm1=q1
veor q6,q6,q1

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:       xmm11 = xmm5 ^ xmm3
# asm 1: veor >xmm11=reg128#9,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm11=q8,<xmm5=q5,<xmm3=q3
veor q8,q5,q3

# qhasm:       xmm10 = xmm1 ^ xmm4
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm4=q4
veor q9,q1,q4

# qhasm:       xmm9 = xmm7 ^ xmm6
# asm 1: veor >xmm9=reg128#11,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm9=q10,<xmm7=q7,<xmm6=q6
veor q10,q7,q6

# qhasm:       xmm13 = xmm4 ^ xmm3
# asm 1: veor >xmm13=reg128#12,<xmm4=reg128#5,<xmm3=reg128#4
# asm 2: veor >xmm13=q11,<xmm4=q4,<xmm3=q3
veor q11,q4,q3

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm2=q2,<xmm0=q0
veor q12,q2,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm6=q6,<xmm0=q0
veor q12,q6,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm5 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm5=q5,<xmm1=q1
veor q11,q5,q1

# qhasm:       xmm12 = xmm7 ^ xmm2
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm2=reg128#3
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm2=q2
veor q12,q7,q2

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm4 & xmm6
# asm 1: vand >xmm12=reg128#13,<xmm4=reg128#5,<xmm6=reg128#7
# asm 2: vand >xmm12=q12,<xmm4=q4,<xmm6=q6
vand q12,q4,q6

# qhasm:       xmm13 = xmm3 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm3=q3,<xmm0=q0
vand q13,q3,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm7
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm7=q7
vand q12,q1,q7

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm5 | xmm2
# asm 1: vorr >xmm15=reg128#15,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: vorr >xmm15=q14,<xmm5=q5,<xmm2=q2
vorr q14,q5,q2

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm7 ^ xmm6
# asm 1: veor >xmm8=reg128#13,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm8=q12,<xmm7=q7,<xmm6=q6
veor q12,q7,q6

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm2=q2,<xmm0=q0
veor q13,q2,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm2
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm2=reg128#3
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm2=q2
vand q14,q14,q2

# qhasm:       xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:       xmm7 &= xmm15
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm15=q9
vand q7,q7,q9

# qhasm:       xmm2 &= xmm14
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#12
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm14=q11
vand q2,q2,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm7 ^= xmm10
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm10=reg128#15
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm10=q14
veor q7,q7,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm6=reg128#7
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm6=q6
veor q0,q0,q6

# qhasm:       xmm6 &= xmm13
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm13=reg128#9
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm13=q8
vand q6,q6,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#14
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q13
veor q2,q2,q13

# qhasm:       xmm0 ^= xmm6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm6=reg128#7
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm6=q6
veor q0,q0,q6

# qhasm:       xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#15
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q14
veor q6,q6,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm7 ^= xmm8
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm8=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm8=q12
veor q7,q7,q12

# qhasm:       xmm6 ^= xmm8
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm8=reg128#13
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm8=q12
veor q6,q6,q12

# qhasm:       xmm12 = xmm5 ^ xmm3
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm3=q3
veor q12,q5,q3

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm4
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm4=q4
veor q14,q1,q4

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm3
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm3=reg128#4
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm3=q3
vand q13,q15,q3

# qhasm:       xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:       xmm4 &= xmm13
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm13=reg128#9
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm13=q8
vand q4,q4,q8

# qhasm:       xmm3 &= xmm9
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm9=reg128#11
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm9=q10
vand q3,q3,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#14
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q13
veor q4,q4,q13

# qhasm:       xmm11 &= xmm5
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm5=reg128#6
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm5=q5
vand q10,q10,q5

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm5 &= xmm14
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm14=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm14=q9
vand q5,q5,q9

# qhasm:       xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#13
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q12
veor q3,q3,q12

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm5 ^= xmm12
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm12=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm12=q12
veor q5,q5,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm4 ^= xmm8
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm8=reg128#15
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm8=q14
veor q4,q4,q14

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm1 ^= xmm2
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm2=q2
veor q1,q1,q2

# qhasm:     xmm3 ^= xmm5
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm5=reg128#6
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm5=q5
veor q3,q3,q5

# qhasm:     xmm2 ^= xmm0
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm0=q0
veor q2,q2,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:     xmm7 ^= xmm4
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm4=q4
veor q7,q7,q4

# qhasm:     xmm4 ^= xmm6
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm6=reg128#7
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm6=q6
veor q4,q4,q6

# qhasm:     xmm6 ^= xmm7
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm7=reg128#8
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm7=q7
veor q6,q6,q7

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm1 ^= u
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<u=reg128#9
# asm 2: veor >xmm1=q1,<xmm1=q1,<u=q8
veor q1,q1,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm3 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u2=q10,<xmm3=q3,#8
vshl.i32 q10,q3,#8

# qhasm:     4x u3 = xmm2 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u3=q11,<xmm2=q2,#8
vshl.i32 q11,q2,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm3 |= u2
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u2=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u2=q10
vorr q3,q3,q10

# qhasm:     xmm2 |= u3
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u3=reg128#12
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u3=q11
vorr q2,q2,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm3 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u2=q10,<xmm3=q3,#16
vshl.i32 q10,q3,#16

# qhasm:     4x u3 = xmm2 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u3=q11,<xmm2=q2,#16
vshl.i32 q11,q2,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm3 |= u2
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u2=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u2=q10
vorr q3,q3,q10

# qhasm:     xmm2 |= u3
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u3=reg128#12
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u3=q11
vorr q2,q2,q11

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x u4 = xmm6 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u4=q8,<xmm6=q6,#8
vshl.i32 q8,q6,#8

# qhasm:     4x u5 = xmm5 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#8
vshl.i32 q9,q5,#8

# qhasm:     4x u6 = xmm4 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u6=q10,<xmm4=q4,#8
vshl.i32 q10,q4,#8

# qhasm:     4x u7 = xmm7 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#8
vshl.i32 q11,q7,#8

# qhasm:     xmm6 |= u4
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u4=reg128#9
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u4=q8
vorr q6,q6,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm4 |= u6
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u6=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u6=q10
vorr q4,q4,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:     4x u4 = xmm6 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u4=q8,<xmm6=q6,#16
vshl.i32 q8,q6,#16

# qhasm:     4x u5 = xmm5 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#16
vshl.i32 q9,q5,#16

# qhasm:     4x u6 = xmm4 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u6=q10,<xmm4=q4,#16
vshl.i32 q10,q4,#16

# qhasm:     4x u7 = xmm7 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#16
vshl.i32 q11,q7,#16

# qhasm:     xmm6 |= u4
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u4=reg128#9
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u4=q8
vorr q6,q6,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm4 |= u6
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u6=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u6=q10
vorr q4,q4,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm5 = ~xmm5
# asm 1: vmvn >xmm5=reg128#6,<xmm5=reg128#6
# asm 2: vmvn >xmm5=q5,<xmm5=q5
vmvn q5,q5

# qhasm:   xmm4 = ~xmm4
# asm 1: vmvn >xmm4=reg128#5,<xmm4=reg128#5
# asm 2: vmvn >xmm4=q4,<xmm4=q4
vmvn q4,q4

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     xmm5 ^= xmm4
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm4=reg128#5
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm4=q4
veor q5,q5,q4

# qhasm:     xmm3 ^= xmm1
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm1=reg128#2
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm1=q1
veor q3,q3,q1

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm4 ^= xmm3
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm3=reg128#4
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm3=q3
veor q4,q4,q3

# qhasm:     xmm2 ^= xmm0
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm0=q0
veor q2,q2,q0

# qhasm:     xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm7 ^= xmm5
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm5=reg128#6
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm5=q5
veor q7,q7,q5

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm2 ^= xmm1
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm1=reg128#2
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm1=q1
veor q2,q2,q1

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:       xmm11 = xmm7 ^ xmm6
# asm 1: veor >xmm11=reg128#9,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm11=q8,<xmm7=q7,<xmm6=q6
veor q8,q7,q6

# qhasm:       xmm10 = xmm1 ^ xmm3
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm3=reg128#4
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm3=q3
veor q9,q1,q3

# qhasm:       xmm9 = xmm5 ^ xmm2
# asm 1: veor >xmm9=reg128#11,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm9=q10,<xmm5=q5,<xmm2=q2
veor q10,q5,q2

# qhasm:       xmm13 = xmm3 ^ xmm6
# asm 1: veor >xmm13=reg128#12,<xmm3=reg128#4,<xmm6=reg128#7
# asm 2: veor >xmm13=q11,<xmm3=q3,<xmm6=q6
veor q11,q3,q6

# qhasm:       xmm12 = xmm4 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm4=q4,<xmm0=q0
veor q12,q4,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm2=q2,<xmm0=q0
veor q12,q2,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm7 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm7=q7,<xmm1=q1
veor q11,q7,q1

# qhasm:       xmm12 = xmm5 ^ xmm4
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm4=reg128#5
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm4=q4
veor q12,q5,q4

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm3 & xmm2
# asm 1: vand >xmm12=reg128#13,<xmm3=reg128#4,<xmm2=reg128#3
# asm 2: vand >xmm12=q12,<xmm3=q3,<xmm2=q2
vand q12,q3,q2

# qhasm:       xmm13 = xmm6 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm6=q6,<xmm0=q0
vand q13,q6,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm5
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm5=q5
vand q12,q1,q5

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm7 | xmm4
# asm 1: vorr >xmm15=reg128#15,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: vorr >xmm15=q14,<xmm7=q7,<xmm4=q4
vorr q14,q7,q4

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm5 ^ xmm2
# asm 1: veor >xmm8=reg128#13,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm8=q12,<xmm5=q5,<xmm2=q2
veor q12,q5,q2

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm4 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm4=q4,<xmm0=q0
veor q13,q4,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm4
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm4=reg128#5
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm4=q4
vand q14,q14,q4

# qhasm:       xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:       xmm5 &= xmm15
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm15=q9
vand q5,q5,q9

# qhasm:       xmm4 &= xmm14
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#12
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm14=q11
vand q4,q4,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm5 ^= xmm10
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm10=reg128#15
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm10=q14
veor q5,q5,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm2
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm2=reg128#3
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm2=q2
veor q0,q0,q2

# qhasm:       xmm2 &= xmm13
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm13=reg128#9
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm13=q8
vand q2,q2,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#14
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q13
veor q4,q4,q13

# qhasm:       xmm0 ^= xmm2
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm2=reg128#3
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm2=q2
veor q0,q0,q2

# qhasm:       xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#15
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q14
veor q2,q2,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm5 ^= xmm8
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm8=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm8=q12
veor q5,q5,q12

# qhasm:       xmm2 ^= xmm8
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm8=reg128#13
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm8=q12
veor q2,q2,q12

# qhasm:       xmm12 = xmm7 ^ xmm6
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm6=q6
veor q12,q7,q6

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm3
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm3=reg128#4
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm3=q3
veor q14,q1,q3

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm6
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm6=reg128#7
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm6=q6
vand q13,q15,q6

# qhasm:       xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:       xmm3 &= xmm13
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm13=reg128#9
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm13=q8
vand q3,q3,q8

# qhasm:       xmm6 &= xmm9
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm9=reg128#11
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm9=q10
vand q6,q6,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#14
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q13
veor q3,q3,q13

# qhasm:       xmm11 &= xmm7
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm7=reg128#8
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm7=q7
vand q10,q10,q7

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm7 &= xmm14
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm14=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm14=q9
vand q7,q7,q9

# qhasm:       xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#13
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q12
veor q6,q6,q12

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm7 ^= xmm12
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm12=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm12=q12
veor q7,q7,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm3 ^= xmm8
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm8=reg128#15
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm8=q14
veor q3,q3,q14

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm1 ^= xmm4
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm4=q4
veor q1,q1,q4

# qhasm:     xmm6 ^= xmm7
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm7=reg128#8
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm7=q7
veor q6,q6,q7

# qhasm:     xmm4 ^= xmm0
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm0=q0
veor q4,q4,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:     xmm5 ^= xmm3
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm3=q3
veor q5,q5,q3

# qhasm:     xmm3 ^= xmm2
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm2=reg128#3
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm2=q2
veor q3,q3,q2

# qhasm:     xmm2 ^= xmm5
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm5=reg128#6
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm5=q5
veor q2,q2,q5

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm6 ^= u
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<u=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<u=q8
veor q6,q6,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm6 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u2=q10,<xmm6=q6,#8
vshl.i32 q10,q6,#8

# qhasm:     4x u3 = xmm4 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u3=q11,<xmm4=q4,#8
vshl.i32 q11,q4,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm6 |= u2
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u2=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u2=q10
vorr q6,q6,q10

# qhasm:     xmm4 |= u3
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u3=reg128#12
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u3=q11
vorr q4,q4,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm6 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u2=q10,<xmm6=q6,#16
vshl.i32 q10,q6,#16

# qhasm:     4x u3 = xmm4 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u3=q11,<xmm4=q4,#16
vshl.i32 q11,q4,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm6 |= u2
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u2=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u2=q10
vorr q6,q6,q10

# qhasm:     xmm4 |= u3
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u3=reg128#12
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u3=q11
vorr q4,q4,q11

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x u4 = xmm2 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u4=q8,<xmm2=q2,#8
vshl.i32 q8,q2,#8

# qhasm:     4x u5 = xmm7 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#8
vshl.i32 q9,q7,#8

# qhasm:     4x u6 = xmm3 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u6=q10,<xmm3=q3,#8
vshl.i32 q10,q3,#8

# qhasm:     4x u7 = xmm5 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#8
vshl.i32 q11,q5,#8

# qhasm:     xmm2 |= u4
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u4=reg128#9
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u4=q8
vorr q2,q2,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm3 |= u6
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u6=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u6=q10
vorr q3,q3,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:     4x u4 = xmm2 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u4=q8,<xmm2=q2,#16
vshl.i32 q8,q2,#16

# qhasm:     4x u5 = xmm7 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#16
vshl.i32 q9,q7,#16

# qhasm:     4x u6 = xmm3 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u6=q10,<xmm3=q3,#16
vshl.i32 q10,q3,#16

# qhasm:     4x u7 = xmm5 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#16
vshl.i32 q11,q5,#16

# qhasm:     xmm2 |= u4
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u4=reg128#9
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u4=q8
vorr q2,q2,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm3 |= u6
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u6=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u6=q10
vorr q3,q3,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm7 = ~xmm7
# asm 1: vmvn >xmm7=reg128#8,<xmm7=reg128#8
# asm 2: vmvn >xmm7=q7,<xmm7=q7
vmvn q7,q7

# qhasm:   xmm3 = ~xmm3
# asm 1: vmvn >xmm3=reg128#4,<xmm3=reg128#4
# asm 2: vmvn >xmm3=q3,<xmm3=q3
vmvn q3,q3

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     xmm7 ^= xmm3
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm3=reg128#4
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm3=q3
veor q7,q7,q3

# qhasm:     xmm6 ^= xmm1
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm1=reg128#2
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm1=q1
veor q6,q6,q1

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm3 ^= xmm6
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm6=reg128#7
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm6=q6
veor q3,q3,q6

# qhasm:     xmm4 ^= xmm0
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm0=q0
veor q4,q4,q0

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm5 ^= xmm7
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm7=reg128#8
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm7=q7
veor q5,q5,q7

# qhasm:     xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm4 ^= xmm1
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm1=reg128#2
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm1=q1
veor q4,q4,q1

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:       xmm11 = xmm5 ^ xmm2
# asm 1: veor >xmm11=reg128#9,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm11=q8,<xmm5=q5,<xmm2=q2
veor q8,q5,q2

# qhasm:       xmm10 = xmm1 ^ xmm6
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm6=q6
veor q9,q1,q6

# qhasm:       xmm9 = xmm7 ^ xmm4
# asm 1: veor >xmm9=reg128#11,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm9=q10,<xmm7=q7,<xmm4=q4
veor q10,q7,q4

# qhasm:       xmm13 = xmm6 ^ xmm2
# asm 1: veor >xmm13=reg128#12,<xmm6=reg128#7,<xmm2=reg128#3
# asm 2: veor >xmm13=q11,<xmm6=q6,<xmm2=q2
veor q11,q6,q2

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm3=q3,<xmm0=q0
veor q12,q3,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm4 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm4=q4,<xmm0=q0
veor q12,q4,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm5 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm5=q5,<xmm1=q1
veor q11,q5,q1

# qhasm:       xmm12 = xmm7 ^ xmm3
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm3=reg128#4
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm3=q3
veor q12,q7,q3

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm6 & xmm4
# asm 1: vand >xmm12=reg128#13,<xmm6=reg128#7,<xmm4=reg128#5
# asm 2: vand >xmm12=q12,<xmm6=q6,<xmm4=q4
vand q12,q6,q4

# qhasm:       xmm13 = xmm2 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm2=q2,<xmm0=q0
vand q13,q2,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm7
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm7=q7
vand q12,q1,q7

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm5 | xmm3
# asm 1: vorr >xmm15=reg128#15,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: vorr >xmm15=q14,<xmm5=q5,<xmm3=q3
vorr q14,q5,q3

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm7 ^ xmm4
# asm 1: veor >xmm8=reg128#13,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm8=q12,<xmm7=q7,<xmm4=q4
veor q12,q7,q4

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm3=q3,<xmm0=q0
veor q13,q3,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm3
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm3=reg128#4
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm3=q3
vand q14,q14,q3

# qhasm:       xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:       xmm7 &= xmm15
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm15=q9
vand q7,q7,q9

# qhasm:       xmm3 &= xmm14
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#12
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm14=q11
vand q3,q3,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm7 ^= xmm10
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm10=reg128#15
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm10=q14
veor q7,q7,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm4
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm4=reg128#5
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm4=q4
veor q0,q0,q4

# qhasm:       xmm4 &= xmm13
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm13=reg128#9
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm13=q8
vand q4,q4,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#14
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q13
veor q3,q3,q13

# qhasm:       xmm0 ^= xmm4
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm4=reg128#5
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm4=q4
veor q0,q0,q4

# qhasm:       xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#15
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q14
veor q4,q4,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm7 ^= xmm8
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm8=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm8=q12
veor q7,q7,q12

# qhasm:       xmm4 ^= xmm8
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm8=reg128#13
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm8=q12
veor q4,q4,q12

# qhasm:       xmm12 = xmm5 ^ xmm2
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm2=q2
veor q12,q5,q2

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm6
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm6=q6
veor q14,q1,q6

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm2
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm2=reg128#3
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm2=q2
vand q13,q15,q2

# qhasm:       xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:       xmm6 &= xmm13
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm13=reg128#9
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm13=q8
vand q6,q6,q8

# qhasm:       xmm2 &= xmm9
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm9=reg128#11
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm9=q10
vand q2,q2,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#14
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q13
veor q6,q6,q13

# qhasm:       xmm11 &= xmm5
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm5=reg128#6
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm5=q5
vand q10,q10,q5

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm5 &= xmm14
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm14=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm14=q9
vand q5,q5,q9

# qhasm:       xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#13
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q12
veor q2,q2,q12

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm5 ^= xmm12
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm12=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm12=q12
veor q5,q5,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm6 ^= xmm8
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm8=reg128#15
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm8=q14
veor q6,q6,q14

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm1 ^= xmm3
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm3=reg128#4
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm3=q3
veor q1,q1,q3

# qhasm:     xmm2 ^= xmm5
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm5=reg128#6
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm5=q5
veor q2,q2,q5

# qhasm:     xmm3 ^= xmm0
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm0=q0
veor q3,q3,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:     xmm7 ^= xmm6
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm6=q6
veor q7,q7,q6

# qhasm:     xmm6 ^= xmm4
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm4=reg128#5
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm4=q4
veor q6,q6,q4

# qhasm:     xmm4 ^= xmm7
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm7=reg128#8
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm7=q7
veor q4,q4,q7

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm3 ^= u
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<u=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<u=q8
veor q3,q3,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm2 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u2=q10,<xmm2=q2,#8
vshl.i32 q10,q2,#8

# qhasm:     4x u3 = xmm3 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u3=q11,<xmm3=q3,#8
vshl.i32 q11,q3,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm2 |= u2
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u2=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u2=q10
vorr q2,q2,q10

# qhasm:     xmm3 |= u3
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u3=reg128#12
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u3=q11
vorr q3,q3,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm2 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u2=q10,<xmm2=q2,#16
vshl.i32 q10,q2,#16

# qhasm:     4x u3 = xmm3 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u3=q11,<xmm3=q3,#16
vshl.i32 q11,q3,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm2 |= u2
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u2=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u2=q10
vorr q2,q2,q10

# qhasm:     xmm3 |= u3
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u3=reg128#12
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u3=q11
vorr q3,q3,q11

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x u4 = xmm4 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u4=q8,<xmm4=q4,#8
vshl.i32 q8,q4,#8

# qhasm:     4x u5 = xmm5 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#8
vshl.i32 q9,q5,#8

# qhasm:     4x u6 = xmm6 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u6=q10,<xmm6=q6,#8
vshl.i32 q10,q6,#8

# qhasm:     4x u7 = xmm7 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#8
vshl.i32 q11,q7,#8

# qhasm:     xmm4 |= u4
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u4=reg128#9
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u4=q8
vorr q4,q4,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm6 |= u6
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u6=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u6=q10
vorr q6,q6,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:     4x u4 = xmm4 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u4=q8,<xmm4=q4,#16
vshl.i32 q8,q4,#16

# qhasm:     4x u5 = xmm5 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#16
vshl.i32 q9,q5,#16

# qhasm:     4x u6 = xmm6 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u6=q10,<xmm6=q6,#16
vshl.i32 q10,q6,#16

# qhasm:     4x u7 = xmm7 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#16
vshl.i32 q11,q7,#16

# qhasm:     xmm4 |= u4
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u4=reg128#9
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u4=q8
vorr q4,q4,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm6 |= u6
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u6=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u6=q10
vorr q6,q6,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm5 = ~xmm5
# asm 1: vmvn >xmm5=reg128#6,<xmm5=reg128#6
# asm 2: vmvn >xmm5=q5,<xmm5=q5
vmvn q5,q5

# qhasm:   xmm6 = ~xmm6
# asm 1: vmvn >xmm6=reg128#7,<xmm6=reg128#7
# asm 2: vmvn >xmm6=q6,<xmm6=q6
vmvn q6,q6

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     xmm5 ^= xmm6
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm6=reg128#7
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm6=q6
veor q5,q5,q6

# qhasm:     xmm2 ^= xmm1
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm1=reg128#2
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm1=q1
veor q2,q2,q1

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm6 ^= xmm2
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm2=reg128#3
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm2=q2
veor q6,q6,q2

# qhasm:     xmm3 ^= xmm0
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm0=q0
veor q3,q3,q0

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm7 ^= xmm5
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm5=reg128#6
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm5=q5
veor q7,q7,q5

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm3 ^= xmm1
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm1=reg128#2
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm1=q1
veor q3,q3,q1

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:       xmm11 = xmm7 ^ xmm4
# asm 1: veor >xmm11=reg128#9,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm11=q8,<xmm7=q7,<xmm4=q4
veor q8,q7,q4

# qhasm:       xmm10 = xmm1 ^ xmm2
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm2=q2
veor q9,q1,q2

# qhasm:       xmm9 = xmm5 ^ xmm3
# asm 1: veor >xmm9=reg128#11,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm9=q10,<xmm5=q5,<xmm3=q3
veor q10,q5,q3

# qhasm:       xmm13 = xmm2 ^ xmm4
# asm 1: veor >xmm13=reg128#12,<xmm2=reg128#3,<xmm4=reg128#5
# asm 2: veor >xmm13=q11,<xmm2=q2,<xmm4=q4
veor q11,q2,q4

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm6=q6,<xmm0=q0
veor q12,q6,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm3=q3,<xmm0=q0
veor q12,q3,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm7 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm7=q7,<xmm1=q1
veor q11,q7,q1

# qhasm:       xmm12 = xmm5 ^ xmm6
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm6=reg128#7
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm6=q6
veor q12,q5,q6

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm2 & xmm3
# asm 1: vand >xmm12=reg128#13,<xmm2=reg128#3,<xmm3=reg128#4
# asm 2: vand >xmm12=q12,<xmm2=q2,<xmm3=q3
vand q12,q2,q3

# qhasm:       xmm13 = xmm4 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm4=q4,<xmm0=q0
vand q13,q4,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm5
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm5=q5
vand q12,q1,q5

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm7 | xmm6
# asm 1: vorr >xmm15=reg128#15,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: vorr >xmm15=q14,<xmm7=q7,<xmm6=q6
vorr q14,q7,q6

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm5 ^ xmm3
# asm 1: veor >xmm8=reg128#13,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm8=q12,<xmm5=q5,<xmm3=q3
veor q12,q5,q3

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm6=q6,<xmm0=q0
veor q13,q6,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm6
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm6=reg128#7
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm6=q6
vand q14,q14,q6

# qhasm:       xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:       xmm5 &= xmm15
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm15=q9
vand q5,q5,q9

# qhasm:       xmm6 &= xmm14
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#12
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm14=q11
vand q6,q6,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm5 ^= xmm10
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm10=reg128#15
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm10=q14
veor q5,q5,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm3
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm3=reg128#4
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm3=q3
veor q0,q0,q3

# qhasm:       xmm3 &= xmm13
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm13=reg128#9
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm13=q8
vand q3,q3,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#14
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q13
veor q6,q6,q13

# qhasm:       xmm0 ^= xmm3
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm3=reg128#4
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm3=q3
veor q0,q0,q3

# qhasm:       xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#15
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q14
veor q3,q3,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm5 ^= xmm8
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm8=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm8=q12
veor q5,q5,q12

# qhasm:       xmm3 ^= xmm8
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm8=reg128#13
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm8=q12
veor q3,q3,q12

# qhasm:       xmm12 = xmm7 ^ xmm4
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm4=q4
veor q12,q7,q4

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm2
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm2=q2
veor q14,q1,q2

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm4
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm4=reg128#5
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm4=q4
vand q13,q15,q4

# qhasm:       xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:       xmm2 &= xmm13
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm13=reg128#9
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm13=q8
vand q2,q2,q8

# qhasm:       xmm4 &= xmm9
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm9=reg128#11
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm9=q10
vand q4,q4,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#14
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q13
veor q2,q2,q13

# qhasm:       xmm11 &= xmm7
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm7=reg128#8
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm7=q7
vand q10,q10,q7

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm7 &= xmm14
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm14=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm14=q9
vand q7,q7,q9

# qhasm:       xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#13
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q12
veor q4,q4,q12

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm7 ^= xmm12
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm12=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm12=q12
veor q7,q7,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm2 ^= xmm8
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm8=reg128#15
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm8=q14
veor q2,q2,q14

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm1 ^= xmm6
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm6=q6
veor q1,q1,q6

# qhasm:     xmm4 ^= xmm7
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm7=reg128#8
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm7=q7
veor q4,q4,q7

# qhasm:     xmm6 ^= xmm0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm0=q0
veor q6,q6,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:     xmm5 ^= xmm2
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm2=q2
veor q5,q5,q2

# qhasm:     xmm2 ^= xmm3
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm3=reg128#4
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm3=q3
veor q2,q2,q3

# qhasm:     xmm3 ^= xmm5
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm5=reg128#6
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm5=q5
veor q3,q3,q5

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm3 ^= u
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<u=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<u=q8
veor q3,q3,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm4 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u2=q10,<xmm4=q4,#8
vshl.i32 q10,q4,#8

# qhasm:     4x u3 = xmm6 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u3=q11,<xmm6=q6,#8
vshl.i32 q11,q6,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm4 |= u2
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u2=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u2=q10
vorr q4,q4,q10

# qhasm:     xmm6 |= u3
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u3=reg128#12
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u3=q11
vorr q6,q6,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm4 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u2=q10,<xmm4=q4,#16
vshl.i32 q10,q4,#16

# qhasm:     4x u3 = xmm6 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u3=q11,<xmm6=q6,#16
vshl.i32 q11,q6,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm4 |= u2
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u2=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u2=q10
vorr q4,q4,q10

# qhasm:     xmm6 |= u3
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u3=reg128#12
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u3=q11
vorr q6,q6,q11

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x u4 = xmm3 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u4=q8,<xmm3=q3,#8
vshl.i32 q8,q3,#8

# qhasm:     4x u5 = xmm7 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#8
vshl.i32 q9,q7,#8

# qhasm:     4x u6 = xmm2 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u6=q10,<xmm2=q2,#8
vshl.i32 q10,q2,#8

# qhasm:     4x u7 = xmm5 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#8
vshl.i32 q11,q5,#8

# qhasm:     xmm3 |= u4
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u4=reg128#9
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u4=q8
vorr q3,q3,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm2 |= u6
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u6=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u6=q10
vorr q2,q2,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:     4x u4 = xmm3 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u4=q8,<xmm3=q3,#16
vshl.i32 q8,q3,#16

# qhasm:     4x u5 = xmm7 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#16
vshl.i32 q9,q7,#16

# qhasm:     4x u6 = xmm2 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u6=q10,<xmm2=q2,#16
vshl.i32 q10,q2,#16

# qhasm:     4x u7 = xmm5 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#16
vshl.i32 q11,q5,#16

# qhasm:     xmm3 |= u4
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u4=reg128#9
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u4=q8
vorr q3,q3,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm2 |= u6
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u6=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u6=q10
vorr q2,q2,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm7 = ~xmm7
# asm 1: vmvn >xmm7=reg128#8,<xmm7=reg128#8
# asm 2: vmvn >xmm7=q7,<xmm7=q7
vmvn q7,q7

# qhasm:   xmm2 = ~xmm2
# asm 1: vmvn >xmm2=reg128#3,<xmm2=reg128#3
# asm 2: vmvn >xmm2=q2,<xmm2=q2
vmvn q2,q2

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     xmm7 ^= xmm2
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm2=reg128#3
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm2=q2
veor q7,q7,q2

# qhasm:     xmm4 ^= xmm1
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm1=reg128#2
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm1=q1
veor q4,q4,q1

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm2 ^= xmm4
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm4=reg128#5
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm4=q4
veor q2,q2,q4

# qhasm:     xmm6 ^= xmm0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm0=q0
veor q6,q6,q0

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm5 ^= xmm7
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm7=reg128#8
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm7=q7
veor q5,q5,q7

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm6 ^= xmm1
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm1=reg128#2
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm1=q1
veor q6,q6,q1

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:       xmm11 = xmm5 ^ xmm3
# asm 1: veor >xmm11=reg128#9,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm11=q8,<xmm5=q5,<xmm3=q3
veor q8,q5,q3

# qhasm:       xmm10 = xmm1 ^ xmm4
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm4=q4
veor q9,q1,q4

# qhasm:       xmm9 = xmm7 ^ xmm6
# asm 1: veor >xmm9=reg128#11,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm9=q10,<xmm7=q7,<xmm6=q6
veor q10,q7,q6

# qhasm:       xmm13 = xmm4 ^ xmm3
# asm 1: veor >xmm13=reg128#12,<xmm4=reg128#5,<xmm3=reg128#4
# asm 2: veor >xmm13=q11,<xmm4=q4,<xmm3=q3
veor q11,q4,q3

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm2=q2,<xmm0=q0
veor q12,q2,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm6=q6,<xmm0=q0
veor q12,q6,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm5 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm5=q5,<xmm1=q1
veor q11,q5,q1

# qhasm:       xmm12 = xmm7 ^ xmm2
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm2=reg128#3
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm2=q2
veor q12,q7,q2

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm4 & xmm6
# asm 1: vand >xmm12=reg128#13,<xmm4=reg128#5,<xmm6=reg128#7
# asm 2: vand >xmm12=q12,<xmm4=q4,<xmm6=q6
vand q12,q4,q6

# qhasm:       xmm13 = xmm3 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm3=q3,<xmm0=q0
vand q13,q3,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm7
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm7=q7
vand q12,q1,q7

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm5 | xmm2
# asm 1: vorr >xmm15=reg128#15,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: vorr >xmm15=q14,<xmm5=q5,<xmm2=q2
vorr q14,q5,q2

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm7 ^ xmm6
# asm 1: veor >xmm8=reg128#13,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm8=q12,<xmm7=q7,<xmm6=q6
veor q12,q7,q6

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm2=q2,<xmm0=q0
veor q13,q2,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm2
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm2=reg128#3
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm2=q2
vand q14,q14,q2

# qhasm:       xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:       xmm7 &= xmm15
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm15=q9
vand q7,q7,q9

# qhasm:       xmm2 &= xmm14
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#12
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm14=q11
vand q2,q2,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm7 ^= xmm10
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm10=reg128#15
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm10=q14
veor q7,q7,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm6=reg128#7
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm6=q6
veor q0,q0,q6

# qhasm:       xmm6 &= xmm13
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm13=reg128#9
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm13=q8
vand q6,q6,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#14
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q13
veor q2,q2,q13

# qhasm:       xmm0 ^= xmm6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm6=reg128#7
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm6=q6
veor q0,q0,q6

# qhasm:       xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#15
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q14
veor q6,q6,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm7 ^= xmm8
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm8=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm8=q12
veor q7,q7,q12

# qhasm:       xmm6 ^= xmm8
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm8=reg128#13
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm8=q12
veor q6,q6,q12

# qhasm:       xmm12 = xmm5 ^ xmm3
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm3=q3
veor q12,q5,q3

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm4
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm4=q4
veor q14,q1,q4

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm3
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm3=reg128#4
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm3=q3
vand q13,q15,q3

# qhasm:       xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:       xmm4 &= xmm13
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm13=reg128#9
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm13=q8
vand q4,q4,q8

# qhasm:       xmm3 &= xmm9
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm9=reg128#11
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm9=q10
vand q3,q3,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#14
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q13
veor q4,q4,q13

# qhasm:       xmm11 &= xmm5
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm5=reg128#6
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm5=q5
vand q10,q10,q5

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm5 &= xmm14
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm14=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm14=q9
vand q5,q5,q9

# qhasm:       xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#13
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q12
veor q3,q3,q12

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm5 ^= xmm12
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm12=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm12=q12
veor q5,q5,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm4 ^= xmm8
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm8=reg128#15
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm8=q14
veor q4,q4,q14

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm1 ^= xmm2
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm2=q2
veor q1,q1,q2

# qhasm:     xmm3 ^= xmm5
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm5=reg128#6
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm5=q5
veor q3,q3,q5

# qhasm:     xmm2 ^= xmm0
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm0=q0
veor q2,q2,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:     xmm7 ^= xmm4
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm4=q4
veor q7,q7,q4

# qhasm:     xmm4 ^= xmm6
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm6=reg128#7
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm6=q6
veor q4,q4,q6

# qhasm:     xmm6 ^= xmm7
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm7=reg128#8
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm7=q7
veor q6,q6,q7

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm5 ^= u
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<u=reg128#9
# asm 2: veor >xmm5=q5,<xmm5=q5,<u=q8
veor q5,q5,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm3 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u2=q10,<xmm3=q3,#8
vshl.i32 q10,q3,#8

# qhasm:     4x u3 = xmm2 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u3=q11,<xmm2=q2,#8
vshl.i32 q11,q2,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm3 |= u2
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u2=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u2=q10
vorr q3,q3,q10

# qhasm:     xmm2 |= u3
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u3=reg128#12
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u3=q11
vorr q2,q2,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm3 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u2=q10,<xmm3=q3,#16
vshl.i32 q10,q3,#16

# qhasm:     4x u3 = xmm2 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u3=q11,<xmm2=q2,#16
vshl.i32 q11,q2,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm3 |= u2
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u2=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u2=q10
vorr q3,q3,q10

# qhasm:     xmm2 |= u3
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u3=reg128#12
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u3=q11
vorr q2,q2,q11

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x u4 = xmm6 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u4=q8,<xmm6=q6,#8
vshl.i32 q8,q6,#8

# qhasm:     4x u5 = xmm5 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#8
vshl.i32 q9,q5,#8

# qhasm:     4x u6 = xmm4 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u6=q10,<xmm4=q4,#8
vshl.i32 q10,q4,#8

# qhasm:     4x u7 = xmm7 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#8
vshl.i32 q11,q7,#8

# qhasm:     xmm6 |= u4
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u4=reg128#9
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u4=q8
vorr q6,q6,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm4 |= u6
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u6=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u6=q10
vorr q4,q4,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:     4x u4 = xmm6 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u4=q8,<xmm6=q6,#16
vshl.i32 q8,q6,#16

# qhasm:     4x u5 = xmm5 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#16
vshl.i32 q9,q5,#16

# qhasm:     4x u6 = xmm4 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u6=q10,<xmm4=q4,#16
vshl.i32 q10,q4,#16

# qhasm:     4x u7 = xmm7 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#16
vshl.i32 q11,q7,#16

# qhasm:     xmm6 |= u4
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u4=reg128#9
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u4=q8
vorr q6,q6,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm4 |= u6
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u6=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u6=q10
vorr q4,q4,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm5 = ~xmm5
# asm 1: vmvn >xmm5=reg128#6,<xmm5=reg128#6
# asm 2: vmvn >xmm5=q5,<xmm5=q5
vmvn q5,q5

# qhasm:   xmm4 = ~xmm4
# asm 1: vmvn >xmm4=reg128#5,<xmm4=reg128#5
# asm 2: vmvn >xmm4=q4,<xmm4=q4
vmvn q4,q4

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     xmm5 ^= xmm4
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm4=reg128#5
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm4=q4
veor q5,q5,q4

# qhasm:     xmm3 ^= xmm1
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm1=reg128#2
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm1=q1
veor q3,q3,q1

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm4 ^= xmm3
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm3=reg128#4
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm3=q3
veor q4,q4,q3

# qhasm:     xmm2 ^= xmm0
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm0=q0
veor q2,q2,q0

# qhasm:     xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm7 ^= xmm5
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm5=reg128#6
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm5=q5
veor q7,q7,q5

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm2 ^= xmm1
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm1=reg128#2
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm1=q1
veor q2,q2,q1

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:       xmm11 = xmm7 ^ xmm6
# asm 1: veor >xmm11=reg128#9,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm11=q8,<xmm7=q7,<xmm6=q6
veor q8,q7,q6

# qhasm:       xmm10 = xmm1 ^ xmm3
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm3=reg128#4
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm3=q3
veor q9,q1,q3

# qhasm:       xmm9 = xmm5 ^ xmm2
# asm 1: veor >xmm9=reg128#11,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm9=q10,<xmm5=q5,<xmm2=q2
veor q10,q5,q2

# qhasm:       xmm13 = xmm3 ^ xmm6
# asm 1: veor >xmm13=reg128#12,<xmm3=reg128#4,<xmm6=reg128#7
# asm 2: veor >xmm13=q11,<xmm3=q3,<xmm6=q6
veor q11,q3,q6

# qhasm:       xmm12 = xmm4 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm4=q4,<xmm0=q0
veor q12,q4,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm2=q2,<xmm0=q0
veor q12,q2,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm7 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm7=q7,<xmm1=q1
veor q11,q7,q1

# qhasm:       xmm12 = xmm5 ^ xmm4
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm4=reg128#5
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm4=q4
veor q12,q5,q4

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm3 & xmm2
# asm 1: vand >xmm12=reg128#13,<xmm3=reg128#4,<xmm2=reg128#3
# asm 2: vand >xmm12=q12,<xmm3=q3,<xmm2=q2
vand q12,q3,q2

# qhasm:       xmm13 = xmm6 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm6=q6,<xmm0=q0
vand q13,q6,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm5
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm5=q5
vand q12,q1,q5

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm7 | xmm4
# asm 1: vorr >xmm15=reg128#15,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: vorr >xmm15=q14,<xmm7=q7,<xmm4=q4
vorr q14,q7,q4

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm5 ^ xmm2
# asm 1: veor >xmm8=reg128#13,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm8=q12,<xmm5=q5,<xmm2=q2
veor q12,q5,q2

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm4 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm4=q4,<xmm0=q0
veor q13,q4,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm4
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm4=reg128#5
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm4=q4
vand q14,q14,q4

# qhasm:       xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:       xmm5 &= xmm15
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm15=q9
vand q5,q5,q9

# qhasm:       xmm4 &= xmm14
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#12
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm14=q11
vand q4,q4,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm5 ^= xmm10
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm10=reg128#15
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm10=q14
veor q5,q5,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm2
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm2=reg128#3
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm2=q2
veor q0,q0,q2

# qhasm:       xmm2 &= xmm13
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm13=reg128#9
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm13=q8
vand q2,q2,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#14
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q13
veor q4,q4,q13

# qhasm:       xmm0 ^= xmm2
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm2=reg128#3
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm2=q2
veor q0,q0,q2

# qhasm:       xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#15
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q14
veor q2,q2,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm5 ^= xmm8
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm8=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm8=q12
veor q5,q5,q12

# qhasm:       xmm2 ^= xmm8
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm8=reg128#13
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm8=q12
veor q2,q2,q12

# qhasm:       xmm12 = xmm7 ^ xmm6
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm6=q6
veor q12,q7,q6

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm3
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm3=reg128#4
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm3=q3
veor q14,q1,q3

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm6
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm6=reg128#7
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm6=q6
vand q13,q15,q6

# qhasm:       xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:       xmm3 &= xmm13
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm13=reg128#9
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm13=q8
vand q3,q3,q8

# qhasm:       xmm6 &= xmm9
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm9=reg128#11
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm9=q10
vand q6,q6,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#14
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q13
veor q3,q3,q13

# qhasm:       xmm11 &= xmm7
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm7=reg128#8
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm7=q7
vand q10,q10,q7

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm7 &= xmm14
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm14=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm14=q9
vand q7,q7,q9

# qhasm:       xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#13
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q12
veor q6,q6,q12

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm7 ^= xmm12
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm12=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm12=q12
veor q7,q7,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm3 ^= xmm8
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm8=reg128#15
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm8=q14
veor q3,q3,q14

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm1 ^= xmm4
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm4=q4
veor q1,q1,q4

# qhasm:     xmm6 ^= xmm7
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm7=reg128#8
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm7=q7
veor q6,q6,q7

# qhasm:     xmm4 ^= xmm0
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm0=q0
veor q4,q4,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:     xmm5 ^= xmm3
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm3=q3
veor q5,q5,q3

# qhasm:     xmm3 ^= xmm2
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm2=reg128#3
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm2=q2
veor q3,q3,q2

# qhasm:     xmm2 ^= xmm5
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm5=reg128#6
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm5=q5
veor q2,q2,q5

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm3 ^= u
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<u=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<u=q8
veor q3,q3,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm6 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u2=q10,<xmm6=q6,#8
vshl.i32 q10,q6,#8

# qhasm:     4x u3 = xmm4 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u3=q11,<xmm4=q4,#8
vshl.i32 q11,q4,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm6 |= u2
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u2=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u2=q10
vorr q6,q6,q10

# qhasm:     xmm4 |= u3
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u3=reg128#12
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u3=q11
vorr q4,q4,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm6 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u2=q10,<xmm6=q6,#16
vshl.i32 q10,q6,#16

# qhasm:     4x u3 = xmm4 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u3=q11,<xmm4=q4,#16
vshl.i32 q11,q4,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm6 |= u2
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u2=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u2=q10
vorr q6,q6,q10

# qhasm:     xmm4 |= u3
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u3=reg128#12
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u3=q11
vorr q4,q4,q11

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x u4 = xmm2 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u4=q8,<xmm2=q2,#8
vshl.i32 q8,q2,#8

# qhasm:     4x u5 = xmm7 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#8
vshl.i32 q9,q7,#8

# qhasm:     4x u6 = xmm3 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u6=q10,<xmm3=q3,#8
vshl.i32 q10,q3,#8

# qhasm:     4x u7 = xmm5 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#8
vshl.i32 q11,q5,#8

# qhasm:     xmm2 |= u4
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u4=reg128#9
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u4=q8
vorr q2,q2,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm3 |= u6
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u6=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u6=q10
vorr q3,q3,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:     4x u4 = xmm2 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u4=q8,<xmm2=q2,#16
vshl.i32 q8,q2,#16

# qhasm:     4x u5 = xmm7 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#16
vshl.i32 q9,q7,#16

# qhasm:     4x u6 = xmm3 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u6=q10,<xmm3=q3,#16
vshl.i32 q10,q3,#16

# qhasm:     4x u7 = xmm5 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#16
vshl.i32 q11,q5,#16

# qhasm:     xmm2 |= u4
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u4=reg128#9
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u4=q8
vorr q2,q2,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm3 |= u6
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u6=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u6=q10
vorr q3,q3,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q10
veor q6,q6,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm4 ^= xmm11
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm11=reg128#12
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm11=q11
veor q4,q4,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#9
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q8
veor q2,q2,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm3 ^= xmm14
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm14=q10
veor q3,q3,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm7 = ~xmm7
# asm 1: vmvn >xmm7=reg128#8,<xmm7=reg128#8
# asm 2: vmvn >xmm7=q7,<xmm7=q7
vmvn q7,q7

# qhasm:   xmm3 = ~xmm3
# asm 1: vmvn >xmm3=reg128#4,<xmm3=reg128#4
# asm 2: vmvn >xmm3=q3,<xmm3=q3
vmvn q3,q3

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     xmm7 ^= xmm3
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm3=reg128#4
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm3=q3
veor q7,q7,q3

# qhasm:     xmm6 ^= xmm1
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm1=reg128#2
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm1=q1
veor q6,q6,q1

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm3 ^= xmm6
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm6=reg128#7
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm6=q6
veor q3,q3,q6

# qhasm:     xmm4 ^= xmm0
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm0=q0
veor q4,q4,q0

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm5 ^= xmm7
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm7=reg128#8
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm7=q7
veor q5,q5,q7

# qhasm:     xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm4 ^= xmm1
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm1=reg128#2
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm1=q1
veor q4,q4,q1

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:       xmm11 = xmm5 ^ xmm2
# asm 1: veor >xmm11=reg128#9,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm11=q8,<xmm5=q5,<xmm2=q2
veor q8,q5,q2

# qhasm:       xmm10 = xmm1 ^ xmm6
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm6=q6
veor q9,q1,q6

# qhasm:       xmm9 = xmm7 ^ xmm4
# asm 1: veor >xmm9=reg128#11,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm9=q10,<xmm7=q7,<xmm4=q4
veor q10,q7,q4

# qhasm:       xmm13 = xmm6 ^ xmm2
# asm 1: veor >xmm13=reg128#12,<xmm6=reg128#7,<xmm2=reg128#3
# asm 2: veor >xmm13=q11,<xmm6=q6,<xmm2=q2
veor q11,q6,q2

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm3=q3,<xmm0=q0
veor q12,q3,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm4 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm4=q4,<xmm0=q0
veor q12,q4,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm5 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm5=q5,<xmm1=q1
veor q11,q5,q1

# qhasm:       xmm12 = xmm7 ^ xmm3
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm3=reg128#4
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm3=q3
veor q12,q7,q3

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm6 & xmm4
# asm 1: vand >xmm12=reg128#13,<xmm6=reg128#7,<xmm4=reg128#5
# asm 2: vand >xmm12=q12,<xmm6=q6,<xmm4=q4
vand q12,q6,q4

# qhasm:       xmm13 = xmm2 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm2=q2,<xmm0=q0
vand q13,q2,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm7
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm7=q7
vand q12,q1,q7

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm5 | xmm3
# asm 1: vorr >xmm15=reg128#15,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: vorr >xmm15=q14,<xmm5=q5,<xmm3=q3
vorr q14,q5,q3

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm7 ^ xmm4
# asm 1: veor >xmm8=reg128#13,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm8=q12,<xmm7=q7,<xmm4=q4
veor q12,q7,q4

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm3=q3,<xmm0=q0
veor q13,q3,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm3
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm3=reg128#4
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm3=q3
vand q14,q14,q3

# qhasm:       xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:       xmm7 &= xmm15
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm15=q9
vand q7,q7,q9

# qhasm:       xmm3 &= xmm14
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm14=reg128#12
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm14=q11
vand q3,q3,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm7 ^= xmm10
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm10=reg128#15
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm10=q14
veor q7,q7,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm4
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm4=reg128#5
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm4=q4
veor q0,q0,q4

# qhasm:       xmm4 &= xmm13
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm13=reg128#9
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm13=q8
vand q4,q4,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#14
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q13
veor q3,q3,q13

# qhasm:       xmm0 ^= xmm4
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm4=reg128#5
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm4=q4
veor q0,q0,q4

# qhasm:       xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#15
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q14
veor q4,q4,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm7 ^= xmm8
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm8=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm8=q12
veor q7,q7,q12

# qhasm:       xmm4 ^= xmm8
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm8=reg128#13
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm8=q12
veor q4,q4,q12

# qhasm:       xmm12 = xmm5 ^ xmm2
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm2=q2
veor q12,q5,q2

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm6
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm6=q6
veor q14,q1,q6

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm2
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm2=reg128#3
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm2=q2
vand q13,q15,q2

# qhasm:       xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:       xmm6 &= xmm13
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm13=reg128#9
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm13=q8
vand q6,q6,q8

# qhasm:       xmm2 &= xmm9
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm9=reg128#11
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm9=q10
vand q2,q2,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#14
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q13
veor q6,q6,q13

# qhasm:       xmm11 &= xmm5
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm5=reg128#6
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm5=q5
vand q10,q10,q5

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm5 &= xmm14
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm14=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm14=q9
vand q5,q5,q9

# qhasm:       xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#13
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q12
veor q2,q2,q12

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm5 ^= xmm12
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm12=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm12=q12
veor q5,q5,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm6 ^= xmm8
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm8=reg128#15
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm8=q14
veor q6,q6,q14

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm1 ^= xmm3
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm3=reg128#4
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm3=q3
veor q1,q1,q3

# qhasm:     xmm2 ^= xmm5
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm5=reg128#6
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm5=q5
veor q2,q2,q5

# qhasm:     xmm3 ^= xmm0
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm0=q0
veor q3,q3,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:     xmm7 ^= xmm6
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm6=q6
veor q7,q7,q6

# qhasm:     xmm6 ^= xmm4
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm4=reg128#5
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm4=q4
veor q6,q6,q4

# qhasm:     xmm4 ^= xmm7
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm7=reg128#8
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm7=q7
veor q4,q4,q7

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm7 ^= u
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<u=reg128#9
# asm 2: veor >xmm7=q7,<xmm7=q7,<u=q8
veor q7,q7,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm2 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u2=q10,<xmm2=q2,#8
vshl.i32 q10,q2,#8

# qhasm:     4x u3 = xmm3 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u3=q11,<xmm3=q3,#8
vshl.i32 q11,q3,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm2 |= u2
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u2=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u2=q10
vorr q2,q2,q10

# qhasm:     xmm3 |= u3
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u3=reg128#12
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u3=q11
vorr q3,q3,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm2 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u2=q10,<xmm2=q2,#16
vshl.i32 q10,q2,#16

# qhasm:     4x u3 = xmm3 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u3=q11,<xmm3=q3,#16
vshl.i32 q11,q3,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm2 |= u2
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u2=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u2=q10
vorr q2,q2,q10

# qhasm:     xmm3 |= u3
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u3=reg128#12
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u3=q11
vorr q3,q3,q11

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x u4 = xmm4 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u4=q8,<xmm4=q4,#8
vshl.i32 q8,q4,#8

# qhasm:     4x u5 = xmm5 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#8
vshl.i32 q9,q5,#8

# qhasm:     4x u6 = xmm6 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u6=q10,<xmm6=q6,#8
vshl.i32 q10,q6,#8

# qhasm:     4x u7 = xmm7 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#8
vshl.i32 q11,q7,#8

# qhasm:     xmm4 |= u4
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u4=reg128#9
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u4=q8
vorr q4,q4,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm6 |= u6
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u6=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u6=q10
vorr q6,q6,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:     4x u4 = xmm4 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u4=q8,<xmm4=q4,#16
vshl.i32 q8,q4,#16

# qhasm:     4x u5 = xmm5 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#16
vshl.i32 q9,q5,#16

# qhasm:     4x u6 = xmm6 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u6=q10,<xmm6=q6,#16
vshl.i32 q10,q6,#16

# qhasm:     4x u7 = xmm7 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#16
vshl.i32 q11,q7,#16

# qhasm:     xmm4 |= u4
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u4=reg128#9
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u4=q8
vorr q4,q4,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm6 |= u6
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u6=reg128#11
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u6=q10
vorr q6,q6,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q10
veor q2,q2,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm3 ^= xmm11
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm11=reg128#12
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm11=q11
veor q3,q3,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#9
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q8
veor q4,q4,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:   xmm6 ^= xmm14
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#11
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm14=q10
veor q6,q6,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm5 = ~xmm5
# asm 1: vmvn >xmm5=reg128#6,<xmm5=reg128#6
# asm 2: vmvn >xmm5=q5,<xmm5=q5
vmvn q5,q5

# qhasm:   xmm6 = ~xmm6
# asm 1: vmvn >xmm6=reg128#7,<xmm6=reg128#7
# asm 2: vmvn >xmm6=q6,<xmm6=q6
vmvn q6,q6

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     xmm5 ^= xmm6
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm6=reg128#7
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm6=q6
veor q5,q5,q6

# qhasm:     xmm2 ^= xmm1
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm1=reg128#2
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm1=q1
veor q2,q2,q1

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm6 ^= xmm2
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm2=reg128#3
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm2=q2
veor q6,q6,q2

# qhasm:     xmm3 ^= xmm0
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm0=q0
veor q3,q3,q0

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm7 ^= xmm5
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm5=reg128#6
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm5=q5
veor q7,q7,q5

# qhasm:     xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm3 ^= xmm1
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm1=reg128#2
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm1=q1
veor q3,q3,q1

# qhasm:     xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:       xmm11 = xmm7 ^ xmm4
# asm 1: veor >xmm11=reg128#9,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm11=q8,<xmm7=q7,<xmm4=q4
veor q8,q7,q4

# qhasm:       xmm10 = xmm1 ^ xmm2
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm2=q2
veor q9,q1,q2

# qhasm:       xmm9 = xmm5 ^ xmm3
# asm 1: veor >xmm9=reg128#11,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm9=q10,<xmm5=q5,<xmm3=q3
veor q10,q5,q3

# qhasm:       xmm13 = xmm2 ^ xmm4
# asm 1: veor >xmm13=reg128#12,<xmm2=reg128#3,<xmm4=reg128#5
# asm 2: veor >xmm13=q11,<xmm2=q2,<xmm4=q4
veor q11,q2,q4

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm6=q6,<xmm0=q0
veor q12,q6,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm3 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm3=q3,<xmm0=q0
veor q12,q3,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm7 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm7=q7,<xmm1=q1
veor q11,q7,q1

# qhasm:       xmm12 = xmm5 ^ xmm6
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm6=reg128#7
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm6=q6
veor q12,q5,q6

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm2 & xmm3
# asm 1: vand >xmm12=reg128#13,<xmm2=reg128#3,<xmm3=reg128#4
# asm 2: vand >xmm12=q12,<xmm2=q2,<xmm3=q3
vand q12,q2,q3

# qhasm:       xmm13 = xmm4 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm4=reg128#5,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm4=q4,<xmm0=q0
vand q13,q4,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm5
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm5=q5
vand q12,q1,q5

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm7 | xmm6
# asm 1: vorr >xmm15=reg128#15,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: vorr >xmm15=q14,<xmm7=q7,<xmm6=q6
vorr q14,q7,q6

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm5 ^ xmm3
# asm 1: veor >xmm8=reg128#13,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm8=q12,<xmm5=q5,<xmm3=q3
veor q12,q5,q3

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm6=q6,<xmm0=q0
veor q13,q6,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm6
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm6=reg128#7
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm6=q6
vand q14,q14,q6

# qhasm:       xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:       xmm5 &= xmm15
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm15=q9
vand q5,q5,q9

# qhasm:       xmm6 &= xmm14
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm14=reg128#12
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm14=q11
vand q6,q6,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm5 ^= xmm10
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm10=reg128#15
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm10=q14
veor q5,q5,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm3
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm3=reg128#4
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm3=q3
veor q0,q0,q3

# qhasm:       xmm3 &= xmm13
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm13=reg128#9
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm13=q8
vand q3,q3,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#14
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q13
veor q6,q6,q13

# qhasm:       xmm0 ^= xmm3
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm3=reg128#4
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm3=q3
veor q0,q0,q3

# qhasm:       xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#15
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q14
veor q3,q3,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm5 ^= xmm8
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm8=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm8=q12
veor q5,q5,q12

# qhasm:       xmm3 ^= xmm8
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm8=reg128#13
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm8=q12
veor q3,q3,q12

# qhasm:       xmm12 = xmm7 ^ xmm4
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm4=q4
veor q12,q7,q4

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm2
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm2=q2
veor q14,q1,q2

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm4
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm4=reg128#5
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm4=q4
vand q13,q15,q4

# qhasm:       xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:       xmm2 &= xmm13
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm13=reg128#9
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm13=q8
vand q2,q2,q8

# qhasm:       xmm4 &= xmm9
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm9=reg128#11
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm9=q10
vand q4,q4,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm4 ^= xmm2
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm2=reg128#3
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm2=q2
veor q4,q4,q2

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm2 ^= xmm10
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm10=reg128#14
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm10=q13
veor q2,q2,q13

# qhasm:       xmm11 &= xmm7
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm7=reg128#8
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm7=q7
vand q10,q10,q7

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm7 &= xmm14
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm14=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm14=q9
vand q7,q7,q9

# qhasm:       xmm4 ^= xmm12
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm12=reg128#13
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm12=q12
veor q4,q4,q12

# qhasm:       xmm7 ^= xmm1
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm1=reg128#2
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm1=q1
veor q7,q7,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm7 ^= xmm12
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm12=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm12=q12
veor q7,q7,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm2 ^= xmm8
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm8=reg128#15
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm8=q14
veor q2,q2,q14

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm1 ^= xmm6
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm6=reg128#7
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm6=q6
veor q1,q1,q6

# qhasm:     xmm4 ^= xmm7
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm7=reg128#8
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm7=q7
veor q4,q4,q7

# qhasm:     xmm6 ^= xmm0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm0=q0
veor q6,q6,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm5
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm5=reg128#6
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm5=q5
veor q1,q1,q5

# qhasm:     xmm5 ^= xmm2
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm2=q2
veor q5,q5,q2

# qhasm:     xmm2 ^= xmm3
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm3=reg128#4
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm3=q3
veor q2,q2,q3

# qhasm:     xmm3 ^= xmm5
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm5=reg128#6
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm5=q5
veor q3,q3,q5

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm0 ^= u
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<u=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<u=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= u
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<u=reg128#9
# asm 2: veor >xmm1=q1,<xmm1=q1,<u=q8
veor q1,q1,q8

# qhasm:   xmm6 ^= u
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<u=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<u=q8
veor q6,q6,q8

# qhasm:   xmm3 ^= u
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<u=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<u=q8
veor q3,q3,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm4 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u2=q10,<xmm4=q4,#8
vshl.i32 q10,q4,#8

# qhasm:     4x u3 = xmm6 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u3=q11,<xmm6=q6,#8
vshl.i32 q11,q6,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm4 |= u2
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u2=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u2=q10
vorr q4,q4,q10

# qhasm:     xmm6 |= u3
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u3=reg128#12
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u3=q11
vorr q6,q6,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm4 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u2=q10,<xmm4=q4,#16
vshl.i32 q10,q4,#16

# qhasm:     4x u3 = xmm6 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u3=q11,<xmm6=q6,#16
vshl.i32 q11,q6,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm4 |= u2
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u2=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u2=q10
vorr q4,q4,q10

# qhasm:     xmm6 |= u3
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u3=reg128#12
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u3=q11
vorr q6,q6,q11

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x u4 = xmm3 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u4=q8,<xmm3=q3,#8
vshl.i32 q8,q3,#8

# qhasm:     4x u5 = xmm7 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#8
vshl.i32 q9,q7,#8

# qhasm:     4x u6 = xmm2 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u6=q10,<xmm2=q2,#8
vshl.i32 q10,q2,#8

# qhasm:     4x u7 = xmm5 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#8
vshl.i32 q11,q5,#8

# qhasm:     xmm3 |= u4
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u4=reg128#9
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u4=q8
vorr q3,q3,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm2 |= u6
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u6=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u6=q10
vorr q2,q2,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:     4x u4 = xmm3 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u4=q8,<xmm3=q3,#16
vshl.i32 q8,q3,#16

# qhasm:     4x u5 = xmm7 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u5=q9,<xmm7=q7,#16
vshl.i32 q9,q7,#16

# qhasm:     4x u6 = xmm2 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u6=q10,<xmm2=q2,#16
vshl.i32 q10,q2,#16

# qhasm:     4x u7 = xmm5 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u7=q11,<xmm5=q5,#16
vshl.i32 q11,q5,#16

# qhasm:     xmm3 |= u4
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u4=reg128#9
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u4=q8
vorr q3,q3,q8

# qhasm:     xmm7 |= u5
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u5=reg128#10
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u5=q9
vorr q7,q7,q9

# qhasm:     xmm2 |= u6
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u6=reg128#11
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u6=q10
vorr q2,q2,q10

# qhasm:     xmm5 |= u7
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u7=reg128#12
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u7=q11
vorr q5,q5,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q10
veor q4,q4,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm6 ^= xmm11
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm11=reg128#12
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm11=q11
veor q6,q6,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#5%bot-<xmm4=reg128#5%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d8-<xmm4=d9},[<input_0=r0,: 128]!
vst1.8 {d8-d9},[r0,: 128]!

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#7%bot-<xmm6=reg128#7%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d12-<xmm6=d13},[<input_0=r0,: 128]!
vst1.8 {d12-d13},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#9,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q8,<xmm12=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#10,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q9,<xmm13=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#11,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q10,<xmm14=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#12,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q11,<xmm15=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q8
veor q3,q3,q8

# qhasm:   xmm7 ^= xmm13
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm13=reg128#10
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm13=q9
veor q7,q7,q9

# qhasm:   xmm2 ^= xmm14
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#11
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm14=q10
veor q2,q2,q10

# qhasm:   xmm5 ^= xmm15
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm15=reg128#12
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm15=q11
veor q5,q5,q11

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#8%bot-<xmm7=reg128#8%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d14-<xmm7=d15},[<input_0=r0,: 128]!
vst1.8 {d14-d15},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#6%bot-<xmm5=reg128#6%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d10-<xmm5=d11},[<input_0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm:   xmm0 = ~xmm0
# asm 1: vmvn >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vmvn >xmm0=q0,<xmm0=q0
vmvn q0,q0

# qhasm:   xmm1 = ~xmm1
# asm 1: vmvn >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vmvn >xmm1=q1,<xmm1=q1
vmvn q1,q1

# qhasm:   xmm7 = ~xmm7
# asm 1: vmvn >xmm7=reg128#8,<xmm7=reg128#8
# asm 2: vmvn >xmm7=q7,<xmm7=q7
vmvn q7,q7

# qhasm:   xmm2 = ~xmm2
# asm 1: vmvn >xmm2=reg128#3,<xmm2=reg128#3
# asm 2: vmvn >xmm2=q2,<xmm2=q2
vmvn q2,q2

# qhasm:     xmm0 = xmm0[3]xmm0[0,1,2] 
# asm 1: vext.32 >xmm0=reg128#1,<xmm0=reg128#1,<xmm0=reg128#1,#3
# asm 2: vext.32 >xmm0=q0,<xmm0=q0,<xmm0=q0,#3
vext.32 q0,q0,q0,#3

# qhasm:     xmm1 = xmm1[3]xmm1[0,1,2] 
# asm 1: vext.32 >xmm1=reg128#2,<xmm1=reg128#2,<xmm1=reg128#2,#3
# asm 2: vext.32 >xmm1=q1,<xmm1=q1,<xmm1=q1,#3
vext.32 q1,q1,q1,#3

# qhasm:     xmm4 = xmm4[3]xmm4[0,1,2] 
# asm 1: vext.32 >xmm4=reg128#5,<xmm4=reg128#5,<xmm4=reg128#5,#3
# asm 2: vext.32 >xmm4=q4,<xmm4=q4,<xmm4=q4,#3
vext.32 q4,q4,q4,#3

# qhasm:     4x xmm0 <<= 24 
# asm 1: vshl.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshl.u32 >xmm0=q0,<xmm0=q0,#24
vshl.u32 q0,q0,#24

# qhasm:     xmm6 = xmm6[3]xmm6[0,1,2] 
# asm 1: vext.32 >xmm6=reg128#7,<xmm6=reg128#7,<xmm6=reg128#7,#3
# asm 2: vext.32 >xmm6=q6,<xmm6=q6,<xmm6=q6,#3
vext.32 q6,q6,q6,#3

# qhasm:     4x xmm1 <<= 24 
# asm 1: vshl.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshl.u32 >xmm1=q1,<xmm1=q1,#24
vshl.u32 q1,q1,#24

# qhasm:     xmm3 = xmm3[3]xmm3[0,1,2] 
# asm 1: vext.32 >xmm3=reg128#4,<xmm3=reg128#4,<xmm3=reg128#4,#3
# asm 2: vext.32 >xmm3=q3,<xmm3=q3,<xmm3=q3,#3
vext.32 q3,q3,q3,#3

# qhasm:     4x xmm4 <<= 24 
# asm 1: vshl.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshl.u32 >xmm4=q4,<xmm4=q4,#24
vshl.u32 q4,q4,#24

# qhasm:     xmm7 = xmm7[3]xmm7[0,1,2] 
# asm 1: vext.32 >xmm7=reg128#8,<xmm7=reg128#8,<xmm7=reg128#8,#3
# asm 2: vext.32 >xmm7=q7,<xmm7=q7,<xmm7=q7,#3
vext.32 q7,q7,q7,#3

# qhasm:     4x xmm6 <<= 24 
# asm 1: vshl.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshl.u32 >xmm6=q6,<xmm6=q6,#24
vshl.u32 q6,q6,#24

# qhasm:     xmm2 = xmm2[3]xmm2[0,1,2] 
# asm 1: vext.32 >xmm2=reg128#3,<xmm2=reg128#3,<xmm2=reg128#3,#3
# asm 2: vext.32 >xmm2=q2,<xmm2=q2,<xmm2=q2,#3
vext.32 q2,q2,q2,#3

# qhasm:     4x xmm3 <<= 24 
# asm 1: vshl.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshl.u32 >xmm3=q3,<xmm3=q3,#24
vshl.u32 q3,q3,#24

# qhasm:     xmm5 = xmm5[3]xmm5[0,1,2] 
# asm 1: vext.32 >xmm5=reg128#6,<xmm5=reg128#6,<xmm5=reg128#6,#3
# asm 2: vext.32 >xmm5=q5,<xmm5=q5,<xmm5=q5,#3
vext.32 q5,q5,q5,#3

# qhasm:     4x xmm7 <<= 24 
# asm 1: vshl.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshl.u32 >xmm7=q7,<xmm7=q7,#24
vshl.u32 q7,q7,#24

# qhasm:     4x xmm2 <<= 24 
# asm 1: vshl.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshl.u32 >xmm2=q2,<xmm2=q2,#24
vshl.u32 q2,q2,#24

# qhasm:     4x xmm5 <<= 24 
# asm 1: vshl.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshl.u32 >xmm5=q5,<xmm5=q5,#24
vshl.u32 q5,q5,#24

# qhasm:     xmm7 ^= xmm2
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm2=reg128#3
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm2=q2
veor q7,q7,q2

# qhasm:     xmm4 ^= xmm1
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm1=reg128#2
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm1=q1
veor q4,q4,q1

# qhasm:     xmm7 ^= xmm0
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm0=reg128#1
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm0=q0
veor q7,q7,q0

# qhasm:     xmm2 ^= xmm4
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm4=reg128#5
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm4=q4
veor q2,q2,q4

# qhasm:     xmm6 ^= xmm0
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm0=q0
veor q6,q6,q0

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     xmm6 ^= xmm5
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm5=reg128#6
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm5=q5
veor q6,q6,q5

# qhasm:     xmm5 ^= xmm7
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm7=reg128#8
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm7=q7
veor q5,q5,q7

# qhasm:     xmm6 ^= xmm3
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm3=reg128#4
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm3=q3
veor q6,q6,q3

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm6 ^= xmm1
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm1=reg128#2
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm1=q1
veor q6,q6,q1

# qhasm:     xmm4 ^= xmm5
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm5=reg128#6
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm5=q5
veor q4,q4,q5

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:       xmm11 = xmm5 ^ xmm3
# asm 1: veor >xmm11=reg128#9,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm11=q8,<xmm5=q5,<xmm3=q3
veor q8,q5,q3

# qhasm:       xmm10 = xmm1 ^ xmm4
# asm 1: veor >xmm10=reg128#10,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm10=q9,<xmm1=q1,<xmm4=q4
veor q9,q1,q4

# qhasm:       xmm9 = xmm7 ^ xmm6
# asm 1: veor >xmm9=reg128#11,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm9=q10,<xmm7=q7,<xmm6=q6
veor q10,q7,q6

# qhasm:       xmm13 = xmm4 ^ xmm3
# asm 1: veor >xmm13=reg128#12,<xmm4=reg128#5,<xmm3=reg128#4
# asm 2: veor >xmm13=q11,<xmm4=q4,<xmm3=q3
veor q11,q4,q3

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm2=q2,<xmm0=q0
veor q12,q2,q0

# qhasm:       xmm8 = xmm10 & xmm9
# asm 1: vand >xmm8=reg128#14,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vand >xmm8=q13,<xmm10=q9,<xmm9=q10
vand q13,q9,q10

# qhasm:       xmm14 = xmm11 & xmm12
# asm 1: vand >xmm14=reg128#15,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vand >xmm14=q14,<xmm11=q8,<xmm12=q12
vand q14,q8,q12

# qhasm:       xmm15 = xmm11 ^ xmm10
# asm 1: veor >xmm15=reg128#16,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm15=q15,<xmm11=q8,<xmm10=q9
veor q15,q8,q9

# qhasm:       xmm11 |= xmm12
# asm 1: vorr >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: vorr >xmm11=q8,<xmm11=q8,<xmm12=q12
vorr q8,q8,q12

# qhasm:       xmm12 ^= xmm9
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm9=reg128#11
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm9=q10
veor q12,q12,q10

# qhasm:       xmm10 |= xmm9
# asm 1: vorr >xmm10=reg128#10,<xmm10=reg128#10,<xmm9=reg128#11
# asm 2: vorr >xmm10=q9,<xmm10=q9,<xmm9=q10
vorr q9,q9,q10

# qhasm:       xmm15 &= xmm12
# asm 1: vand >xmm15=reg128#11,<xmm15=reg128#16,<xmm12=reg128#13
# asm 2: vand >xmm15=q10,<xmm15=q15,<xmm12=q12
vand q10,q15,q12

# qhasm:       xmm12 = xmm6 ^ xmm0
# asm 1: veor >xmm12=reg128#13,<xmm6=reg128#7,<xmm0=reg128#1
# asm 2: veor >xmm12=q12,<xmm6=q6,<xmm0=q0
veor q12,q6,q0

# qhasm:       xmm11 ^= xmm15
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm15=reg128#11
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm15=q10
veor q8,q8,q10

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm10 ^= xmm14
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm14=reg128#15
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm14=q14
veor q9,q9,q14

# qhasm:       xmm11 ^= xmm13
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm13=reg128#12
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm13=q11
veor q8,q8,q11

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#12
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q11
veor q9,q9,q11

# qhasm:       xmm13 = xmm5 ^ xmm1
# asm 1: veor >xmm13=reg128#12,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm13=q11,<xmm5=q5,<xmm1=q1
veor q11,q5,q1

# qhasm:       xmm12 = xmm7 ^ xmm2
# asm 1: veor >xmm12=reg128#13,<xmm7=reg128#8,<xmm2=reg128#3
# asm 2: veor >xmm12=q12,<xmm7=q7,<xmm2=q2
veor q12,q7,q2

# qhasm:       xmm8 ^= xmm14
# asm 1: veor >xmm8=reg128#14,<xmm8=reg128#14,<xmm14=reg128#15
# asm 2: veor >xmm8=q13,<xmm8=q13,<xmm14=q14
veor q13,q13,q14

# qhasm:       xmm9 = xmm13 | xmm12
# asm 1: vorr >xmm9=reg128#16,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vorr >xmm9=q15,<xmm13=q11,<xmm12=q12
vorr q15,q11,q12

# qhasm:       xmm13 &= xmm12
# asm 1: vand >xmm13=reg128#12,<xmm13=reg128#12,<xmm12=reg128#13
# asm 2: vand >xmm13=q11,<xmm13=q11,<xmm12=q12
vand q11,q11,q12

# qhasm:       xmm9 ^= xmm15
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#16,<xmm15=reg128#11
# asm 2: veor >xmm9=q10,<xmm9=q15,<xmm15=q10
veor q10,q15,q10

# qhasm:       xmm8 ^= xmm13
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#14,<xmm13=reg128#12
# asm 2: veor >xmm8=q11,<xmm8=q13,<xmm13=q11
veor q11,q13,q11

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#15
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q14
veor q10,q10,q14

# qhasm:       xmm12 = xmm4 & xmm6
# asm 1: vand >xmm12=reg128#13,<xmm4=reg128#5,<xmm6=reg128#7
# asm 2: vand >xmm12=q12,<xmm4=q4,<xmm6=q6
vand q12,q4,q6

# qhasm:       xmm13 = xmm3 & xmm0
# asm 1: vand >xmm13=reg128#14,<xmm3=reg128#4,<xmm0=reg128#1
# asm 2: vand >xmm13=q13,<xmm3=q3,<xmm0=q0
vand q13,q3,q0

# qhasm:       xmm11 ^= xmm12
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm12=reg128#13
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm12=q12
veor q8,q8,q12

# qhasm:       xmm10 ^= xmm13
# asm 1: veor >xmm10=reg128#10,<xmm10=reg128#10,<xmm13=reg128#14
# asm 2: veor >xmm10=q9,<xmm10=q9,<xmm13=q13
veor q9,q9,q13

# qhasm:       xmm14 = xmm1 & xmm7
# asm 1: vand >xmm14=reg128#13,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: vand >xmm14=q12,<xmm1=q1,<xmm7=q7
vand q12,q1,q7

# qhasm:       xmm12 = xmm11 ^ xmm10
# asm 1: veor >xmm12=reg128#14,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm12=q13,<xmm11=q8,<xmm10=q9
veor q13,q8,q9

# qhasm:       xmm15 = xmm5 | xmm2
# asm 1: vorr >xmm15=reg128#15,<xmm5=reg128#6,<xmm2=reg128#3
# asm 2: vorr >xmm15=q14,<xmm5=q5,<xmm2=q2
vorr q14,q5,q2

# qhasm:       xmm9 ^= xmm14
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm14=reg128#13
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm14=q12
veor q10,q10,q12

# qhasm:       xmm8 ^= xmm15
# asm 1: veor >xmm8=reg128#12,<xmm8=reg128#12,<xmm15=reg128#15
# asm 2: veor >xmm8=q11,<xmm8=q11,<xmm15=q14
veor q11,q11,q14

# qhasm:       xmm11 &= xmm9
# asm 1: vand >xmm11=reg128#9,<xmm11=reg128#9,<xmm9=reg128#11
# asm 2: vand >xmm11=q8,<xmm11=q8,<xmm9=q10
vand q8,q8,q10

# qhasm:       xmm13 = xmm9 ^ xmm8
# asm 1: veor >xmm13=reg128#13,<xmm9=reg128#11,<xmm8=reg128#12
# asm 2: veor >xmm13=q12,<xmm9=q10,<xmm8=q11
veor q12,q10,q11

# qhasm:       xmm14 = xmm8 ^ xmm11
# asm 1: veor >xmm14=reg128#15,<xmm8=reg128#12,<xmm11=reg128#9
# asm 2: veor >xmm14=q14,<xmm8=q11,<xmm11=q8
veor q14,q11,q8

# qhasm:       xmm11 ^= xmm10
# asm 1: veor >xmm11=reg128#9,<xmm11=reg128#9,<xmm10=reg128#10
# asm 2: veor >xmm11=q8,<xmm11=q8,<xmm10=q9
veor q8,q8,q9

# qhasm:       xmm15 = xmm12 & xmm14
# asm 1: vand >xmm15=reg128#16,<xmm12=reg128#14,<xmm14=reg128#15
# asm 2: vand >xmm15=q15,<xmm12=q13,<xmm14=q14
vand q15,q13,q14

# qhasm:       xmm13 &= xmm11
# asm 1: vand >xmm13=reg128#9,<xmm13=reg128#13,<xmm11=reg128#9
# asm 2: vand >xmm13=q8,<xmm13=q12,<xmm11=q8
vand q8,q12,q8

# qhasm:       xmm15 ^= xmm10
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#16,<xmm10=reg128#10
# asm 2: veor >xmm15=q9,<xmm15=q15,<xmm10=q9
veor q9,q15,q9

# qhasm:       xmm13 ^= xmm8
# asm 1: veor >xmm13=reg128#9,<xmm13=reg128#9,<xmm8=reg128#12
# asm 2: veor >xmm13=q8,<xmm13=q8,<xmm8=q11
veor q8,q8,q11

# qhasm:       xmm10 = xmm14 ^ xmm13
# asm 1: veor >xmm10=reg128#13,<xmm14=reg128#15,<xmm13=reg128#9
# asm 2: veor >xmm10=q12,<xmm14=q14,<xmm13=q8
veor q12,q14,q8

# qhasm:       xmm9 ^= xmm13
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm13=reg128#9
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm13=q8
veor q10,q10,q8

# qhasm:       xmm10 &= xmm8
# asm 1: vand >xmm10=reg128#12,<xmm10=reg128#13,<xmm8=reg128#12
# asm 2: vand >xmm10=q11,<xmm10=q12,<xmm8=q11
vand q11,q12,q11

# qhasm:       xmm8 = xmm7 ^ xmm6
# asm 1: veor >xmm8=reg128#13,<xmm7=reg128#8,<xmm6=reg128#7
# asm 2: veor >xmm8=q12,<xmm7=q7,<xmm6=q6
veor q12,q7,q6

# qhasm:       xmm14 ^= xmm10
# asm 1: veor >xmm14=reg128#15,<xmm14=reg128#15,<xmm10=reg128#12
# asm 2: veor >xmm14=q14,<xmm14=q14,<xmm10=q11
veor q14,q14,q11

# qhasm:       xmm9 ^= xmm10
# asm 1: veor >xmm9=reg128#11,<xmm9=reg128#11,<xmm10=reg128#12
# asm 2: veor >xmm9=q10,<xmm9=q10,<xmm10=q11
veor q10,q10,q11

# qhasm:       xmm14 &= xmm15
# asm 1: vand >xmm14=reg128#12,<xmm14=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm14=q11,<xmm14=q14,<xmm15=q9
vand q11,q14,q9

# qhasm:       xmm14 ^= xmm12
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm12=reg128#14
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm12=q13
veor q11,q11,q13

# qhasm:       xmm12 = xmm2 ^ xmm0
# asm 1: veor >xmm12=reg128#14,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm12=q13,<xmm2=q2,<xmm0=q0
veor q13,q2,q0

# qhasm:       xmm10 = xmm15 ^ xmm14
# asm 1: veor >xmm10=reg128#15,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm10=q14,<xmm15=q9,<xmm14=q11
veor q14,q9,q11

# qhasm:       xmm10 &= xmm2
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#15,<xmm2=reg128#3
# asm 2: vand >xmm10=q14,<xmm10=q14,<xmm2=q2
vand q14,q14,q2

# qhasm:       xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:       xmm7 &= xmm15
# asm 1: vand >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#10
# asm 2: vand >xmm7=q7,<xmm7=q7,<xmm15=q9
vand q7,q7,q9

# qhasm:       xmm2 &= xmm14
# asm 1: vand >xmm2=reg128#3,<xmm2=reg128#3,<xmm14=reg128#12
# asm 2: vand >xmm2=q2,<xmm2=q2,<xmm14=q11
vand q2,q2,q11

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#12,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q11,<xmm14=q11,<xmm9=q10
veor q11,q11,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#10,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q9,<xmm15=q9,<xmm13=q8
veor q9,q9,q8

# qhasm:       xmm2 ^= xmm7
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm7=reg128#8
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm7=q7
veor q2,q2,q7

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#16,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q15,<xmm15=q9,<xmm14=q11
veor q15,q9,q11

# qhasm:       xmm7 ^= xmm10
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm10=reg128#15
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm10=q14
veor q7,q7,q14

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#15,<xmm11=reg128#16,<xmm12=reg128#14
# asm 2: vand >xmm11=q14,<xmm11=q15,<xmm12=q13
vand q14,q15,q13

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm8=reg128#13
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm8=q12
veor q13,q13,q12

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#13,<xmm8=reg128#13,<xmm15=reg128#10
# asm 2: vand >xmm8=q12,<xmm8=q12,<xmm15=q9
vand q12,q12,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#14,<xmm12=reg128#14,<xmm14=reg128#12
# asm 2: vand >xmm12=q13,<xmm12=q13,<xmm14=q11
vand q13,q13,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#13,<xmm8=reg128#13,<xmm12=reg128#14
# asm 2: veor >xmm8=q12,<xmm8=q12,<xmm12=q13
veor q12,q12,q13

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#14,<xmm12=reg128#14,<xmm11=reg128#15
# asm 2: veor >xmm12=q13,<xmm12=q13,<xmm11=q14
veor q13,q13,q14

# qhasm:       xmm10 &= xmm0
# asm 1: vand >xmm10=reg128#15,<xmm10=reg128#16,<xmm0=reg128#1
# asm 2: vand >xmm10=q14,<xmm10=q15,<xmm0=q0
vand q14,q15,q0

# qhasm:       xmm0 ^= xmm6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm6=reg128#7
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm6=q6
veor q0,q0,q6

# qhasm:       xmm6 &= xmm13
# asm 1: vand >xmm6=reg128#7,<xmm6=reg128#7,<xmm13=reg128#9
# asm 2: vand >xmm6=q6,<xmm6=q6,<xmm13=q8
vand q6,q6,q8

# qhasm:       xmm0 &= xmm9
# asm 1: vand >xmm0=reg128#1,<xmm0=reg128#1,<xmm9=reg128#11
# asm 2: vand >xmm0=q0,<xmm0=q0,<xmm9=q10
vand q0,q0,q10

# qhasm:       xmm2 ^= xmm12
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm12=reg128#14
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm12=q13
veor q2,q2,q13

# qhasm:       xmm0 ^= xmm6
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm6=reg128#7
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm6=q6
veor q0,q0,q6

# qhasm:       xmm6 ^= xmm10
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm10=reg128#15
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm10=q14
veor q6,q6,q14

# qhasm:       xmm0 ^= xmm12
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm12=reg128#14
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm12=q13
veor q0,q0,q13

# qhasm:       xmm7 ^= xmm8
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm8=reg128#13
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm8=q12
veor q7,q7,q12

# qhasm:       xmm6 ^= xmm8
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm8=reg128#13
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm8=q12
veor q6,q6,q12

# qhasm:       xmm12 = xmm5 ^ xmm3
# asm 1: veor >xmm12=reg128#13,<xmm5=reg128#6,<xmm3=reg128#4
# asm 2: veor >xmm12=q12,<xmm5=q5,<xmm3=q3
veor q12,q5,q3

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#14,<xmm15=reg128#10,<xmm14=reg128#12
# asm 2: veor >xmm11=q13,<xmm15=q9,<xmm14=q11
veor q13,q9,q11

# qhasm:       xmm8 = xmm1 ^ xmm4
# asm 1: veor >xmm8=reg128#15,<xmm1=reg128#2,<xmm4=reg128#5
# asm 2: veor >xmm8=q14,<xmm1=q1,<xmm4=q4
veor q14,q1,q4

# qhasm:       xmm11 &= xmm12
# asm 1: vand >xmm11=reg128#14,<xmm11=reg128#14,<xmm12=reg128#13
# asm 2: vand >xmm11=q13,<xmm11=q13,<xmm12=q12
vand q13,q13,q12

# qhasm:       xmm12 ^= xmm8
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm8=reg128#15
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm8=q14
veor q12,q12,q14

# qhasm:       xmm8 &= xmm15
# asm 1: vand >xmm8=reg128#15,<xmm8=reg128#15,<xmm15=reg128#10
# asm 2: vand >xmm8=q14,<xmm8=q14,<xmm15=q9
vand q14,q14,q9

# qhasm:       xmm12 &= xmm14
# asm 1: vand >xmm12=reg128#13,<xmm12=reg128#13,<xmm14=reg128#12
# asm 2: vand >xmm12=q12,<xmm12=q12,<xmm14=q11
vand q12,q12,q11

# qhasm:       xmm10 = xmm13 ^ xmm9
# asm 1: veor >xmm10=reg128#16,<xmm13=reg128#9,<xmm9=reg128#11
# asm 2: veor >xmm10=q15,<xmm13=q8,<xmm9=q10
veor q15,q8,q10

# qhasm:       xmm8 ^= xmm12
# asm 1: veor >xmm8=reg128#15,<xmm8=reg128#15,<xmm12=reg128#13
# asm 2: veor >xmm8=q14,<xmm8=q14,<xmm12=q12
veor q14,q14,q12

# qhasm:       xmm12 ^= xmm11
# asm 1: veor >xmm12=reg128#13,<xmm12=reg128#13,<xmm11=reg128#14
# asm 2: veor >xmm12=q12,<xmm12=q12,<xmm11=q13
veor q12,q12,q13

# qhasm:       xmm10 &= xmm3
# asm 1: vand >xmm10=reg128#14,<xmm10=reg128#16,<xmm3=reg128#4
# asm 2: vand >xmm10=q13,<xmm10=q15,<xmm3=q3
vand q13,q15,q3

# qhasm:       xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:       xmm4 &= xmm13
# asm 1: vand >xmm4=reg128#5,<xmm4=reg128#5,<xmm13=reg128#9
# asm 2: vand >xmm4=q4,<xmm4=q4,<xmm13=q8
vand q4,q4,q8

# qhasm:       xmm3 &= xmm9
# asm 1: vand >xmm3=reg128#4,<xmm3=reg128#4,<xmm9=reg128#11
# asm 2: vand >xmm3=q3,<xmm3=q3,<xmm9=q10
vand q3,q3,q10

# qhasm:       xmm15 ^= xmm13
# asm 1: veor >xmm15=reg128#9,<xmm15=reg128#10,<xmm13=reg128#9
# asm 2: veor >xmm15=q8,<xmm15=q9,<xmm13=q8
veor q8,q9,q8

# qhasm:       xmm14 ^= xmm9
# asm 1: veor >xmm14=reg128#10,<xmm14=reg128#12,<xmm9=reg128#11
# asm 2: veor >xmm14=q9,<xmm14=q11,<xmm9=q10
veor q9,q11,q10

# qhasm:       xmm3 ^= xmm4
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm4=reg128#5
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm4=q4
veor q3,q3,q4

# qhasm:       xmm11 = xmm15 ^ xmm14
# asm 1: veor >xmm11=reg128#11,<xmm15=reg128#9,<xmm14=reg128#10
# asm 2: veor >xmm11=q10,<xmm15=q8,<xmm14=q9
veor q10,q8,q9

# qhasm:       xmm4 ^= xmm10
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm10=reg128#14
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm10=q13
veor q4,q4,q13

# qhasm:       xmm11 &= xmm5
# asm 1: vand >xmm11=reg128#11,<xmm11=reg128#11,<xmm5=reg128#6
# asm 2: vand >xmm11=q10,<xmm11=q10,<xmm5=q5
vand q10,q10,q5

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 &= xmm15
# asm 1: vand >xmm1=reg128#2,<xmm1=reg128#2,<xmm15=reg128#9
# asm 2: vand >xmm1=q1,<xmm1=q1,<xmm15=q8
vand q1,q1,q8

# qhasm:       xmm5 &= xmm14
# asm 1: vand >xmm5=reg128#6,<xmm5=reg128#6,<xmm14=reg128#10
# asm 2: vand >xmm5=q5,<xmm5=q5,<xmm14=q9
vand q5,q5,q9

# qhasm:       xmm3 ^= xmm12
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm12=reg128#13
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm12=q12
veor q3,q3,q12

# qhasm:       xmm5 ^= xmm1
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm1=reg128#2
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm1=q1
veor q5,q5,q1

# qhasm:       xmm1 ^= xmm11
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm11=reg128#11
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm11=q10
veor q1,q1,q10

# qhasm:       xmm5 ^= xmm12
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm12=reg128#13
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm12=q12
veor q5,q5,q12

# qhasm:       xmm1 ^= xmm8
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm8=reg128#15
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm8=q14
veor q1,q1,q14

# qhasm:       xmm4 ^= xmm8
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm8=reg128#15
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm8=q14
veor q4,q4,q14

# qhasm:     xmm5 ^= xmm0
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm0=reg128#1
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm0=q0
veor q5,q5,q0

# qhasm:     xmm1 ^= xmm2
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm2=reg128#3
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm2=q2
veor q1,q1,q2

# qhasm:     xmm3 ^= xmm5
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm5=reg128#6
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm5=q5
veor q3,q3,q5

# qhasm:     xmm2 ^= xmm0
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm0=reg128#1
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm0=q0
veor q2,q2,q0

# qhasm:     xmm0 ^= xmm1
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm1=reg128#2
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm1=q1
veor q0,q0,q1

# qhasm:     xmm1 ^= xmm7
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm7=reg128#8
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm7=q7
veor q1,q1,q7

# qhasm:     xmm7 ^= xmm4
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm4=reg128#5
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm4=q4
veor q7,q7,q4

# qhasm:     xmm4 ^= xmm6
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm6=reg128#7
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm6=q6
veor q4,q4,q6

# qhasm:     xmm6 ^= xmm7
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm7=reg128#8
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm7=q7
veor q6,q6,q7

# qhasm:     xmm3 ^= xmm7
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm7=reg128#8
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm7=q7
veor q3,q3,q7

# qhasm:     xmm2 ^= xmm6
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm6=reg128#7
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm6=q6
veor q2,q2,q6

# qhasm:     2x u = 0
# asm 1: vmov.i64 >u=reg128#9,#0
# asm 2: vmov.i64 >u=q8,#0
vmov.i64 q8,#0

# qhasm:     u = u[0],0xffffffff00000000
# asm 1: vmov.i64 <u=reg128#9%top,#0xffffffff00000000
# asm 2: vmov.i64 <u=d17,#0xffffffff00000000
vmov.i64 d17,#0xffffffff00000000

# qhasm:   xmm1 ^= u
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<u=reg128#9
# asm 2: veor >xmm1=q1,<xmm1=q1,<u=q8
veor q1,q1,q8

# qhasm:   xmm3 ^= u
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<u=reg128#9
# asm 2: veor >xmm3=q3,<xmm3=q3,<u=q8
veor q3,q3,q8

# qhasm:   xmm6 ^= u
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<u=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<u=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= u
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<u=reg128#9
# asm 2: veor >xmm5=q5,<xmm5=q5,<u=q8
veor q5,q5,q8

# qhasm:     4x xmm0 unsigned>>= 24
# asm 1: vshr.u32 >xmm0=reg128#1,<xmm0=reg128#1,#24
# asm 2: vshr.u32 >xmm0=q0,<xmm0=q0,#24
vshr.u32 q0,q0,#24

# qhasm:     4x xmm1 unsigned>>= 24
# asm 1: vshr.u32 >xmm1=reg128#2,<xmm1=reg128#2,#24
# asm 2: vshr.u32 >xmm1=q1,<xmm1=q1,#24
vshr.u32 q1,q1,#24

# qhasm:     4x xmm3 unsigned>>= 24
# asm 1: vshr.u32 >xmm3=reg128#4,<xmm3=reg128#4,#24
# asm 2: vshr.u32 >xmm3=q3,<xmm3=q3,#24
vshr.u32 q3,q3,#24

# qhasm:     4x xmm2 unsigned>>= 24
# asm 1: vshr.u32 >xmm2=reg128#3,<xmm2=reg128#3,#24
# asm 2: vshr.u32 >xmm2=q2,<xmm2=q2,#24
vshr.u32 q2,q2,#24

# qhasm:     4x u0 = xmm0 << 8
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#8
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#8
vshl.i32 q8,q0,#8

# qhasm:     4x u1 = xmm1 << 8
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#8
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#8
vshl.i32 q9,q1,#8

# qhasm:     4x u2 = xmm3 << 8
# asm 1: vshl.i32 >u2=reg128#11,<xmm3=reg128#4,#8
# asm 2: vshl.i32 >u2=q10,<xmm3=q3,#8
vshl.i32 q10,q3,#8

# qhasm:     4x u3 = xmm2 << 8
# asm 1: vshl.i32 >u3=reg128#12,<xmm2=reg128#3,#8
# asm 2: vshl.i32 >u3=q11,<xmm2=q2,#8
vshl.i32 q11,q2,#8

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm3 |= u2
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u2=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u2=q10
vorr q3,q3,q10

# qhasm:     xmm2 |= u3
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u3=reg128#12
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u3=q11
vorr q2,q2,q11

# qhasm:     4x u0 = xmm0 << 16
# asm 1: vshl.i32 >u0=reg128#9,<xmm0=reg128#1,#16
# asm 2: vshl.i32 >u0=q8,<xmm0=q0,#16
vshl.i32 q8,q0,#16

# qhasm:     4x u1 = xmm1 << 16
# asm 1: vshl.i32 >u1=reg128#10,<xmm1=reg128#2,#16
# asm 2: vshl.i32 >u1=q9,<xmm1=q1,#16
vshl.i32 q9,q1,#16

# qhasm:     4x u2 = xmm3 << 16
# asm 1: vshl.i32 >u2=reg128#11,<xmm3=reg128#4,#16
# asm 2: vshl.i32 >u2=q10,<xmm3=q3,#16
vshl.i32 q10,q3,#16

# qhasm:     4x u3 = xmm2 << 16
# asm 1: vshl.i32 >u3=reg128#12,<xmm2=reg128#3,#16
# asm 2: vshl.i32 >u3=q11,<xmm2=q2,#16
vshl.i32 q11,q2,#16

# qhasm:     xmm0 |= u0
# asm 1: vorr >xmm0=reg128#1,<xmm0=reg128#1,<u0=reg128#9
# asm 2: vorr >xmm0=q0,<xmm0=q0,<u0=q8
vorr q0,q0,q8

# qhasm:     xmm1 |= u1
# asm 1: vorr >xmm1=reg128#2,<xmm1=reg128#2,<u1=reg128#10
# asm 2: vorr >xmm1=q1,<xmm1=q1,<u1=q9
vorr q1,q1,q9

# qhasm:     xmm3 |= u2
# asm 1: vorr >xmm3=reg128#4,<xmm3=reg128#4,<u2=reg128#11
# asm 2: vorr >xmm3=q3,<xmm3=q3,<u2=q10
vorr q3,q3,q10

# qhasm:     xmm2 |= u3
# asm 1: vorr >xmm2=reg128#3,<xmm2=reg128#3,<u3=reg128#12
# asm 2: vorr >xmm2=q2,<xmm2=q2,<u3=q11
vorr q2,q2,q11

# qhasm:     4x xmm6 unsigned>>= 24
# asm 1: vshr.u32 >xmm6=reg128#7,<xmm6=reg128#7,#24
# asm 2: vshr.u32 >xmm6=q6,<xmm6=q6,#24
vshr.u32 q6,q6,#24

# qhasm:     4x xmm5 unsigned>>= 24
# asm 1: vshr.u32 >xmm5=reg128#6,<xmm5=reg128#6,#24
# asm 2: vshr.u32 >xmm5=q5,<xmm5=q5,#24
vshr.u32 q5,q5,#24

# qhasm:     4x xmm4 unsigned>>= 24
# asm 1: vshr.u32 >xmm4=reg128#5,<xmm4=reg128#5,#24
# asm 2: vshr.u32 >xmm4=q4,<xmm4=q4,#24
vshr.u32 q4,q4,#24

# qhasm:     4x xmm7 unsigned>>= 24
# asm 1: vshr.u32 >xmm7=reg128#8,<xmm7=reg128#8,#24
# asm 2: vshr.u32 >xmm7=q7,<xmm7=q7,#24
vshr.u32 q7,q7,#24

# qhasm:     4x u4 = xmm6 << 8
# asm 1: vshl.i32 >u4=reg128#9,<xmm6=reg128#7,#8
# asm 2: vshl.i32 >u4=q8,<xmm6=q6,#8
vshl.i32 q8,q6,#8

# qhasm:     4x u5 = xmm5 << 8
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#8
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#8
vshl.i32 q9,q5,#8

# qhasm:     4x u6 = xmm4 << 8
# asm 1: vshl.i32 >u6=reg128#11,<xmm4=reg128#5,#8
# asm 2: vshl.i32 >u6=q10,<xmm4=q4,#8
vshl.i32 q10,q4,#8

# qhasm:     4x u7 = xmm7 << 8
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#8
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#8
vshl.i32 q11,q7,#8

# qhasm:     xmm6 |= u4
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u4=reg128#9
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u4=q8
vorr q6,q6,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm4 |= u6
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u6=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u6=q10
vorr q4,q4,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:     4x u4 = xmm6 << 16
# asm 1: vshl.i32 >u4=reg128#9,<xmm6=reg128#7,#16
# asm 2: vshl.i32 >u4=q8,<xmm6=q6,#16
vshl.i32 q8,q6,#16

# qhasm:     4x u5 = xmm5 << 16
# asm 1: vshl.i32 >u5=reg128#10,<xmm5=reg128#6,#16
# asm 2: vshl.i32 >u5=q9,<xmm5=q5,#16
vshl.i32 q9,q5,#16

# qhasm:     4x u6 = xmm4 << 16
# asm 1: vshl.i32 >u6=reg128#11,<xmm4=reg128#5,#16
# asm 2: vshl.i32 >u6=q10,<xmm4=q4,#16
vshl.i32 q10,q4,#16

# qhasm:     4x u7 = xmm7 << 16
# asm 1: vshl.i32 >u7=reg128#12,<xmm7=reg128#8,#16
# asm 2: vshl.i32 >u7=q11,<xmm7=q7,#16
vshl.i32 q11,q7,#16

# qhasm:     xmm6 |= u4
# asm 1: vorr >xmm6=reg128#7,<xmm6=reg128#7,<u4=reg128#9
# asm 2: vorr >xmm6=q6,<xmm6=q6,<u4=q8
vorr q6,q6,q8

# qhasm:     xmm5 |= u5
# asm 1: vorr >xmm5=reg128#6,<xmm5=reg128#6,<u5=reg128#10
# asm 2: vorr >xmm5=q5,<xmm5=q5,<u5=q9
vorr q5,q5,q9

# qhasm:     xmm4 |= u6
# asm 1: vorr >xmm4=reg128#5,<xmm4=reg128#5,<u6=reg128#11
# asm 2: vorr >xmm4=q4,<xmm4=q4,<u6=q10
vorr q4,q4,q10

# qhasm:     xmm7 |= u7
# asm 1: vorr >xmm7=reg128#8,<xmm7=reg128#8,<u7=reg128#12
# asm 2: vorr >xmm7=q7,<xmm7=q7,<u7=q11
vorr q7,q7,q11

# qhasm:   xmm8 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm8=reg128#9%bot->xmm8=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm8=d16->xmm8=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm8 = ~xmm8
# asm 1: vmvn >xmm8=reg128#9,<xmm8=reg128#9
# asm 2: vmvn >xmm8=q8,<xmm8=q8
vmvn q8,q8

# qhasm:   xmm9 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm9=reg128#10%bot->xmm9=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm9=d18->xmm9=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm9 = ~xmm9
# asm 1: vmvn >xmm9=reg128#10,<xmm9=reg128#10
# asm 2: vmvn >xmm9=q9,<xmm9=q9
vmvn q9,q9

# qhasm:   xmm10 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm10=reg128#11%bot->xmm10=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm10=d20->xmm10=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm11 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm11=reg128#12%bot->xmm11=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm11=d22->xmm11=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   4x xmm8 unsigned>>= 8
# asm 1: vshr.u32 >xmm8=reg128#9,<xmm8=reg128#9,#8
# asm 2: vshr.u32 >xmm8=q8,<xmm8=q8,#8
vshr.u32 q8,q8,#8

# qhasm:   4x xmm9 unsigned>>= 8
# asm 1: vshr.u32 >xmm9=reg128#10,<xmm9=reg128#10,#8
# asm 2: vshr.u32 >xmm9=q9,<xmm9=q9,#8
vshr.u32 q9,q9,#8

# qhasm:   4x xmm10 unsigned>>= 8
# asm 1: vshr.u32 >xmm10=reg128#11,<xmm10=reg128#11,#8
# asm 2: vshr.u32 >xmm10=q10,<xmm10=q10,#8
vshr.u32 q10,q10,#8

# qhasm:   4x xmm11 unsigned>>= 8
# asm 1: vshr.u32 >xmm11=reg128#12,<xmm11=reg128#12,#8
# asm 2: vshr.u32 >xmm11=q11,<xmm11=q11,#8
vshr.u32 q11,q11,#8

# qhasm:   xmm0 ^= xmm8
# asm 1: veor >xmm0=reg128#1,<xmm0=reg128#1,<xmm8=reg128#9
# asm 2: veor >xmm0=q0,<xmm0=q0,<xmm8=q8
veor q0,q0,q8

# qhasm:   xmm1 ^= xmm9
# asm 1: veor >xmm1=reg128#2,<xmm1=reg128#2,<xmm9=reg128#10
# asm 2: veor >xmm1=q1,<xmm1=q1,<xmm9=q9
veor q1,q1,q9

# qhasm:   xmm3 ^= xmm10
# asm 1: veor >xmm3=reg128#4,<xmm3=reg128#4,<xmm10=reg128#11
# asm 2: veor >xmm3=q3,<xmm3=q3,<xmm10=q10
veor q3,q3,q10

# qhasm:   xmm12 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm12=reg128#9%bot->xmm12=reg128#9%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm12=d16->xmm12=d17},[<input_0=r0,: 128]!
vld1.8 {d16-d17},[r0,: 128]!

# qhasm:   xmm2 ^= xmm11
# asm 1: veor >xmm2=reg128#3,<xmm2=reg128#3,<xmm11=reg128#12
# asm 2: veor >xmm2=q2,<xmm2=q2,<xmm11=q11
veor q2,q2,q11

# qhasm:   xmm13 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm13=reg128#10%bot->xmm13=reg128#10%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm13=d18->xmm13=d19},[<input_0=r0,: 128]!
vld1.8 {d18-d19},[r0,: 128]!

# qhasm:   xmm13 = ~xmm13
# asm 1: vmvn >xmm13=reg128#10,<xmm13=reg128#10
# asm 2: vmvn >xmm13=q9,<xmm13=q9
vmvn q9,q9

# qhasm:   xmm14 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm14=reg128#11%bot->xmm14=reg128#11%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm14=d20->xmm14=d21},[<input_0=r0,: 128]!
vld1.8 {d20-d21},[r0,: 128]!

# qhasm:   xmm14 = ~xmm14
# asm 1: vmvn >xmm14=reg128#11,<xmm14=reg128#11
# asm 2: vmvn >xmm14=q10,<xmm14=q10
vmvn q10,q10

# qhasm:   xmm15 aligned= mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>xmm15=reg128#12%bot->xmm15=reg128#12%top},[<input_0=int32#1,: 128]!
# asm 2: vld1.8 {>xmm15=d22->xmm15=d23},[<input_0=r0,: 128]!
vld1.8 {d22-d23},[r0,: 128]!

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#7,<xmm6=reg128#7,<xmm12=reg128#9
# asm 2: veor >xmm6=q6,<xmm6=q6,<xmm12=q8
veor q6,q6,q8

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#10
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q9
veor q5,q5,q9

# qhasm:     xmm0 = xmm0[0,2,1,3]
# asm 1: vtrn.32 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.32 <xmm0=d0,<xmm0=d1
vtrn.32 d0,d1

# qhasm:     xmm0 = xmm0[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.8 <xmm0=d0,<xmm0=d1
vtrn.8 d0,d1

# qhasm:     xmm0 = xmm0[0,2,1,3]
# asm 1: vtrn.32 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.32 <xmm0=d0,<xmm0=d1
vtrn.32 d0,d1

# qhasm:     xmm0 = xmm0[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vtrn.16 <xmm0=d0,<xmm0=d1
vtrn.16 d0,d1

# qhasm:     xmm0 = xmm0[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm0=reg128#1,<xmm0=reg128#1
# asm 2: vrev64.i8 >xmm0=q0,<xmm0=q0
vrev64.i8 q0,q0

# qhasm:     xmm0 = xmm0[1,0]
# asm 1: vswp <xmm0=reg128#1%bot,<xmm0=reg128#1%top
# asm 2: vswp <xmm0=d0,<xmm0=d1
vswp d0,d1

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#11
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q10
veor q4,q4,q10

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#8,<xmm7=reg128#8,<xmm15=reg128#12
# asm 2: veor >xmm7=q7,<xmm7=q7,<xmm15=q11
veor q7,q7,q11

# qhasm:   mem128[input_0] aligned= xmm0 ;input_0 += 16
# asm 1: vst1.8 {<xmm0=reg128#1%bot-<xmm0=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm0=d0-<xmm0=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#1,<xmm12=reg128#9,#8
# asm 2: vshr.u32 >xmm12=q0,<xmm12=q8,#8
vshr.u32 q0,q8,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#9,<xmm13=reg128#10,#8
# asm 2: vshr.u32 >xmm13=q8,<xmm13=q9,#8
vshr.u32 q8,q9,#8

# qhasm:     xmm1 = xmm1[0,2,1,3]
# asm 1: vtrn.32 <xmm1=reg128#2%bot,<xmm1=reg128#2%top
# asm 2: vtrn.32 <xmm1=d2,<xmm1=d3
vtrn.32 d2,d3

# qhasm:     xmm1 = xmm1[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm1=reg128#2%bot,<xmm1=reg128#2%top
# asm 2: vtrn.8 <xmm1=d2,<xmm1=d3
vtrn.8 d2,d3

# qhasm:     xmm1 = xmm1[0,2,1,3]
# asm 1: vtrn.32 <xmm1=reg128#2%bot,<xmm1=reg128#2%top
# asm 2: vtrn.32 <xmm1=d2,<xmm1=d3
vtrn.32 d2,d3

# qhasm:     xmm1 = xmm1[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm1=reg128#2%bot,<xmm1=reg128#2%top
# asm 2: vtrn.16 <xmm1=d2,<xmm1=d3
vtrn.16 d2,d3

# qhasm:     xmm1 = xmm1[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm1=reg128#2,<xmm1=reg128#2
# asm 2: vrev64.i8 >xmm1=q1,<xmm1=q1
vrev64.i8 q1,q1

# qhasm:     xmm1 = xmm1[1,0]
# asm 1: vswp <xmm1=reg128#2%bot,<xmm1=reg128#2%top
# asm 2: vswp <xmm1=d2,<xmm1=d3
vswp d2,d3

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#10,<xmm14=reg128#11,#8
# asm 2: vshr.u32 >xmm14=q9,<xmm14=q10,#8
vshr.u32 q9,q10,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#11,<xmm15=reg128#12,#8
# asm 2: vshr.u32 >xmm15=q10,<xmm15=q11,#8
vshr.u32 q10,q11,#8

# qhasm:   mem128[input_0] aligned= xmm1 ;input_0 += 16
# asm 1: vst1.8 {<xmm1=reg128#2%bot-<xmm1=reg128#2%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm1=d2-<xmm1=d3},[<input_0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#2,<xmm6=reg128#7,<xmm12=reg128#1
# asm 2: veor >xmm6=q1,<xmm6=q6,<xmm12=q0
veor q1,q6,q0

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#6,<xmm5=reg128#6,<xmm13=reg128#9
# asm 2: veor >xmm5=q5,<xmm5=q5,<xmm13=q8
veor q5,q5,q8

# qhasm:     xmm3 = xmm3[0,2,1,3]
# asm 1: vtrn.32 <xmm3=reg128#4%bot,<xmm3=reg128#4%top
# asm 2: vtrn.32 <xmm3=d6,<xmm3=d7
vtrn.32 d6,d7

# qhasm:     xmm3 = xmm3[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm3=reg128#4%bot,<xmm3=reg128#4%top
# asm 2: vtrn.8 <xmm3=d6,<xmm3=d7
vtrn.8 d6,d7

# qhasm:     xmm3 = xmm3[0,2,1,3]
# asm 1: vtrn.32 <xmm3=reg128#4%bot,<xmm3=reg128#4%top
# asm 2: vtrn.32 <xmm3=d6,<xmm3=d7
vtrn.32 d6,d7

# qhasm:     xmm3 = xmm3[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm3=reg128#4%bot,<xmm3=reg128#4%top
# asm 2: vtrn.16 <xmm3=d6,<xmm3=d7
vtrn.16 d6,d7

# qhasm:     xmm3 = xmm3[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm3=reg128#4,<xmm3=reg128#4
# asm 2: vrev64.i8 >xmm3=q3,<xmm3=q3
vrev64.i8 q3,q3

# qhasm:     xmm3 = xmm3[1,0]
# asm 1: vswp <xmm3=reg128#4%bot,<xmm3=reg128#4%top
# asm 2: vswp <xmm3=d6,<xmm3=d7
vswp d6,d7

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#10
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q9
veor q4,q4,q9

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#7,<xmm7=reg128#8,<xmm15=reg128#11
# asm 2: veor >xmm7=q6,<xmm7=q7,<xmm15=q10
veor q6,q7,q10

# qhasm:   mem128[input_0] aligned= xmm3 ;input_0 += 16
# asm 1: vst1.8 {<xmm3=reg128#4%bot-<xmm3=reg128#4%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm3=d6-<xmm3=d7},[<input_0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#1,<xmm12=reg128#1,#8
# asm 2: vshr.u32 >xmm12=q0,<xmm12=q0,#8
vshr.u32 q0,q0,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#4,<xmm13=reg128#9,#8
# asm 2: vshr.u32 >xmm13=q3,<xmm13=q8,#8
vshr.u32 q3,q8,#8

# qhasm:     xmm2 = xmm2[0,2,1,3]
# asm 1: vtrn.32 <xmm2=reg128#3%bot,<xmm2=reg128#3%top
# asm 2: vtrn.32 <xmm2=d4,<xmm2=d5
vtrn.32 d4,d5

# qhasm:     xmm2 = xmm2[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm2=reg128#3%bot,<xmm2=reg128#3%top
# asm 2: vtrn.8 <xmm2=d4,<xmm2=d5
vtrn.8 d4,d5

# qhasm:     xmm2 = xmm2[0,2,1,3]
# asm 1: vtrn.32 <xmm2=reg128#3%bot,<xmm2=reg128#3%top
# asm 2: vtrn.32 <xmm2=d4,<xmm2=d5
vtrn.32 d4,d5

# qhasm:     xmm2 = xmm2[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm2=reg128#3%bot,<xmm2=reg128#3%top
# asm 2: vtrn.16 <xmm2=d4,<xmm2=d5
vtrn.16 d4,d5

# qhasm:     xmm2 = xmm2[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm2=reg128#3,<xmm2=reg128#3
# asm 2: vrev64.i8 >xmm2=q2,<xmm2=q2
vrev64.i8 q2,q2

# qhasm:     xmm2 = xmm2[1,0]
# asm 1: vswp <xmm2=reg128#3%bot,<xmm2=reg128#3%top
# asm 2: vswp <xmm2=d4,<xmm2=d5
vswp d4,d5

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#8,<xmm14=reg128#10,#8
# asm 2: vshr.u32 >xmm14=q7,<xmm14=q9,#8
vshr.u32 q7,q9,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#9,<xmm15=reg128#11,#8
# asm 2: vshr.u32 >xmm15=q8,<xmm15=q10,#8
vshr.u32 q8,q10,#8

# qhasm:   mem128[input_0] aligned= xmm2 ;input_0 += 16
# asm 1: vst1.8 {<xmm2=reg128#3%bot-<xmm2=reg128#3%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm2=d4-<xmm2=d5},[<input_0=r0,: 128]!
vst1.8 {d4-d5},[r0,: 128]!

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#2,<xmm6=reg128#2,<xmm12=reg128#1
# asm 2: veor >xmm6=q1,<xmm6=q1,<xmm12=q0
veor q1,q1,q0

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#3,<xmm5=reg128#6,<xmm13=reg128#4
# asm 2: veor >xmm5=q2,<xmm5=q5,<xmm13=q3
veor q2,q5,q3

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#5,<xmm4=reg128#5,<xmm14=reg128#8
# asm 2: veor >xmm4=q4,<xmm4=q4,<xmm14=q7
veor q4,q4,q7

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#6,<xmm7=reg128#7,<xmm15=reg128#9
# asm 2: veor >xmm7=q5,<xmm7=q6,<xmm15=q8
veor q5,q6,q8

# qhasm:   4x xmm12 unsigned>>= 8
# asm 1: vshr.u32 >xmm12=reg128#1,<xmm12=reg128#1,#8
# asm 2: vshr.u32 >xmm12=q0,<xmm12=q0,#8
vshr.u32 q0,q0,#8

# qhasm:   4x xmm13 unsigned>>= 8
# asm 1: vshr.u32 >xmm13=reg128#4,<xmm13=reg128#4,#8
# asm 2: vshr.u32 >xmm13=q3,<xmm13=q3,#8
vshr.u32 q3,q3,#8

# qhasm:   4x xmm14 unsigned>>= 8
# asm 1: vshr.u32 >xmm14=reg128#7,<xmm14=reg128#8,#8
# asm 2: vshr.u32 >xmm14=q6,<xmm14=q7,#8
vshr.u32 q6,q7,#8

# qhasm:   4x xmm15 unsigned>>= 8
# asm 1: vshr.u32 >xmm15=reg128#8,<xmm15=reg128#9,#8
# asm 2: vshr.u32 >xmm15=q7,<xmm15=q8,#8
vshr.u32 q7,q8,#8

# qhasm:   xmm6 ^= xmm12
# asm 1: veor >xmm6=reg128#1,<xmm6=reg128#2,<xmm12=reg128#1
# asm 2: veor >xmm6=q0,<xmm6=q1,<xmm12=q0
veor q0,q1,q0

# qhasm:   xmm5 ^= xmm13
# asm 1: veor >xmm5=reg128#2,<xmm5=reg128#3,<xmm13=reg128#4
# asm 2: veor >xmm5=q1,<xmm5=q2,<xmm13=q3
veor q1,q2,q3

# qhasm:   xmm4 ^= xmm14
# asm 1: veor >xmm4=reg128#3,<xmm4=reg128#5,<xmm14=reg128#7
# asm 2: veor >xmm4=q2,<xmm4=q4,<xmm14=q6
veor q2,q4,q6

# qhasm:   xmm7 ^= xmm15
# asm 1: veor >xmm7=reg128#4,<xmm7=reg128#6,<xmm15=reg128#8
# asm 2: veor >xmm7=q3,<xmm7=q5,<xmm15=q7
veor q3,q5,q7

# qhasm:     xmm6 = xmm6[0,2,1,3]
# asm 1: vtrn.32 <xmm6=reg128#1%bot,<xmm6=reg128#1%top
# asm 2: vtrn.32 <xmm6=d0,<xmm6=d1
vtrn.32 d0,d1

# qhasm:     xmm6 = xmm6[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm6=reg128#1%bot,<xmm6=reg128#1%top
# asm 2: vtrn.8 <xmm6=d0,<xmm6=d1
vtrn.8 d0,d1

# qhasm:     xmm6 = xmm6[0,2,1,3]
# asm 1: vtrn.32 <xmm6=reg128#1%bot,<xmm6=reg128#1%top
# asm 2: vtrn.32 <xmm6=d0,<xmm6=d1
vtrn.32 d0,d1

# qhasm:     xmm6 = xmm6[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm6=reg128#1%bot,<xmm6=reg128#1%top
# asm 2: vtrn.16 <xmm6=d0,<xmm6=d1
vtrn.16 d0,d1

# qhasm:     xmm6 = xmm6[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm6=reg128#1,<xmm6=reg128#1
# asm 2: vrev64.i8 >xmm6=q0,<xmm6=q0
vrev64.i8 q0,q0

# qhasm:     xmm6 = xmm6[1,0]
# asm 1: vswp <xmm6=reg128#1%bot,<xmm6=reg128#1%top
# asm 2: vswp <xmm6=d0,<xmm6=d1
vswp d0,d1

# qhasm:   mem128[input_0] aligned= xmm6 ;input_0 += 16
# asm 1: vst1.8 {<xmm6=reg128#1%bot-<xmm6=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm6=d0-<xmm6=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:     xmm5 = xmm5[0,2,1,3]
# asm 1: vtrn.32 <xmm5=reg128#2%bot,<xmm5=reg128#2%top
# asm 2: vtrn.32 <xmm5=d2,<xmm5=d3
vtrn.32 d2,d3

# qhasm:     xmm5 = xmm5[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm5=reg128#2%bot,<xmm5=reg128#2%top
# asm 2: vtrn.8 <xmm5=d2,<xmm5=d3
vtrn.8 d2,d3

# qhasm:     xmm5 = xmm5[0,2,1,3]
# asm 1: vtrn.32 <xmm5=reg128#2%bot,<xmm5=reg128#2%top
# asm 2: vtrn.32 <xmm5=d2,<xmm5=d3
vtrn.32 d2,d3

# qhasm:     xmm5 = xmm5[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm5=reg128#2%bot,<xmm5=reg128#2%top
# asm 2: vtrn.16 <xmm5=d2,<xmm5=d3
vtrn.16 d2,d3

# qhasm:     xmm5 = xmm5[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm5=reg128#1,<xmm5=reg128#2
# asm 2: vrev64.i8 >xmm5=q0,<xmm5=q1
vrev64.i8 q0,q1

# qhasm:     xmm5 = xmm5[1,0]
# asm 1: vswp <xmm5=reg128#1%bot,<xmm5=reg128#1%top
# asm 2: vswp <xmm5=d0,<xmm5=d1
vswp d0,d1

# qhasm:   mem128[input_0] aligned= xmm5 ;input_0 += 16
# asm 1: vst1.8 {<xmm5=reg128#1%bot-<xmm5=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm5=d0-<xmm5=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:     xmm4 = xmm4[0,2,1,3]
# asm 1: vtrn.32 <xmm4=reg128#3%bot,<xmm4=reg128#3%top
# asm 2: vtrn.32 <xmm4=d4,<xmm4=d5
vtrn.32 d4,d5

# qhasm:     xmm4 = xmm4[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm4=reg128#3%bot,<xmm4=reg128#3%top
# asm 2: vtrn.8 <xmm4=d4,<xmm4=d5
vtrn.8 d4,d5

# qhasm:     xmm4 = xmm4[0,2,1,3]
# asm 1: vtrn.32 <xmm4=reg128#3%bot,<xmm4=reg128#3%top
# asm 2: vtrn.32 <xmm4=d4,<xmm4=d5
vtrn.32 d4,d5

# qhasm:     xmm4 = xmm4[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm4=reg128#3%bot,<xmm4=reg128#3%top
# asm 2: vtrn.16 <xmm4=d4,<xmm4=d5
vtrn.16 d4,d5

# qhasm:     xmm4 = xmm4[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm4=reg128#1,<xmm4=reg128#3
# asm 2: vrev64.i8 >xmm4=q0,<xmm4=q2
vrev64.i8 q0,q2

# qhasm:     xmm4 = xmm4[1,0]
# asm 1: vswp <xmm4=reg128#1%bot,<xmm4=reg128#1%top
# asm 2: vswp <xmm4=d0,<xmm4=d1
vswp d0,d1

# qhasm:   mem128[input_0] aligned= xmm4 ;input_0 += 16
# asm 1: vst1.8 {<xmm4=reg128#1%bot-<xmm4=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm4=d0-<xmm4=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:     xmm7 = xmm7[0,2,1,3]
# asm 1: vtrn.32 <xmm7=reg128#4%bot,<xmm7=reg128#4%top
# asm 2: vtrn.32 <xmm7=d6,<xmm7=d7
vtrn.32 d6,d7

# qhasm:     xmm7 = xmm7[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <xmm7=reg128#4%bot,<xmm7=reg128#4%top
# asm 2: vtrn.8 <xmm7=d6,<xmm7=d7
vtrn.8 d6,d7

# qhasm:     xmm7 = xmm7[0,2,1,3]
# asm 1: vtrn.32 <xmm7=reg128#4%bot,<xmm7=reg128#4%top
# asm 2: vtrn.32 <xmm7=d6,<xmm7=d7
vtrn.32 d6,d7

# qhasm:     xmm7 = xmm7[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <xmm7=reg128#4%bot,<xmm7=reg128#4%top
# asm 2: vtrn.16 <xmm7=d6,<xmm7=d7
vtrn.16 d6,d7

# qhasm:     xmm7 = xmm7[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >xmm7=reg128#1,<xmm7=reg128#4
# asm 2: vrev64.i8 >xmm7=q0,<xmm7=q3
vrev64.i8 q0,q3

# qhasm:     xmm7 = xmm7[1,0]
# asm 1: vswp <xmm7=reg128#1%bot,<xmm7=reg128#1%top
# asm 2: vswp <xmm7=d0,<xmm7=d1
vswp d0,d1

# qhasm:   mem128[input_0] aligned= xmm7 ;input_0 += 16
# asm 1: vst1.8 {<xmm7=reg128#1%bot-<xmm7=reg128#1%top},[<input_0=int32#1,: 128]!
# asm 2: vst1.8 {<xmm7=d0-<xmm7=d1},[<input_0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm:   input_0 -= 128
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#128
# asm 2: sub >input_0=r0,<input_0=r0,#128
sub r0,r0,#128

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
