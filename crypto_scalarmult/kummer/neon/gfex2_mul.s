
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

# qhasm: int128 f0

# qhasm: int128 f1

# qhasm: int128 f2

# qhasm: int128 _2f1

# qhasm: int128 _2f2

# qhasm: int128 g0

# qhasm: int128 g1

# qhasm: int128 g2

# qhasm: int128 h0

# qhasm: int128 h1

# qhasm: int128 h2

# qhasm: int128 h3

# qhasm: int128 h4

# qhasm: int128 t

# qhasm: int128 mask25

# qhasm: int128 mask26

# qhasm: int32 adr0

# qhasm: int32 adr1

# qhasm: int32 adr2

# qhasm: int32 count

# qhasm: stack128 caller_q4_stack

# qhasm: stack128 caller_q5_stack

# qhasm: stack128 caller_q6_stack

# qhasm: stack128 caller_q7_stack

# qhasm: qpushenter gfex2_mul
.align 4
.global _gfex2_mul
.global gfex2_mul
.type _gfex2_mul STT_FUNC
.type gfex2_mul STT_FUNC
_gfex2_mul:
gfex2_mul:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#0
and sp,sp,#0xffffffe0

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#1,<input_0=int32#1
# asm 2: mov >adr0=r0,<input_0=r0
mov r0,r0

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#2,<input_1=int32#2
# asm 2: mov >adr1=r1,<input_1=r1
mov r1,r1

# qhasm: adr2 = input_2
# asm 1: mov >adr2=int32#3,<input_2=int32#3
# asm 2: mov >adr2=r2,<input_2=r2
mov r2,r2

# qhasm: 2x mask25 = 0xffffffff
# asm 1: vmov.i64 >mask25=reg128#1,#0xffffffff
# asm 2: vmov.i64 >mask25=q0,#0xffffffff
vmov.i64 q0,#0xffffffff

# qhasm: 4x mask25 <<= 7
# asm 1: vshl.u32 >mask25=reg128#1,<mask25=reg128#1,#7
# asm 2: vshl.u32 >mask25=q0,<mask25=q0,#7
vshl.u32 q0,q0,#7

# qhasm: 2x mask25 unsigned>> = 7
# asm 1: vshr.u64 >mask25=reg128#1,<mask25=reg128#1,#7
# asm 2: vshr.u64 >mask25=q0,<mask25=q0,#7
vshr.u64 q0,q0,#7

# qhasm: 2x mask26 = 0xffffffff
# asm 1: vmov.i64 >mask26=reg128#2,#0xffffffff
# asm 2: vmov.i64 >mask26=q1,#0xffffffff
vmov.i64 q1,#0xffffffff

# qhasm: 4x mask26 <<= 6
# asm 1: vshl.u32 >mask26=reg128#2,<mask26=reg128#2,#6
# asm 2: vshl.u32 >mask26=q1,<mask26=q1,#6
vshl.u32 q1,q1,#6

# qhasm: 2x mask26 unsigned>> = 6
# asm 1: vshr.u64 >mask26=reg128#2,<mask26=reg128#2,#6
# asm 2: vshr.u64 >mask26=q1,<mask26=q1,#6
vshr.u64 q1,q1,#6

# qhasm: f0 = mem128[adr1]
# asm 1: vld1.8 {>f0=reg128#3%bot->f0=reg128#3%top},[<adr1=int32#2]
# asm 2: vld1.8 {>f0=d4->f0=d5},[<adr1=r1]
vld1.8 {d4-d5},[r1]

# qhasm: adr1+=8
# asm 1: add >adr1=int32#2,<adr1=int32#2,#8
# asm 2: add >adr1=r1,<adr1=r1,#8
add r1,r1,#8

# qhasm: f1 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>f1=reg128#4%bot->f1=reg128#4%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>f1=d6->f1=d7},[<adr1=r1]!
vld1.8 {d6-d7},[r1]!

# qhasm: f2 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>f2=reg128#5%bot->f2=reg128#5%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>f2=d8->f2=d9},[<adr1=r1]!
vld1.8 {d8-d9},[r1]!

# qhasm: 2x _2f1 = f1 << 1
# asm 1: vshl.i64 >_2f1=reg128#6,<f1=reg128#4,#1
# asm 2: vshl.i64 >_2f1=q5,<f1=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2f2 = f2 << 1
# asm 1: vshl.i64 >_2f2=reg128#7,<f2=reg128#5,#1
# asm 2: vshl.i64 >_2f2=q6,<f2=q4,#1
vshl.i64 q6,q4,#1

# qhasm: g0 = mem128[adr2]
# asm 1: vld1.8 {>g0=reg128#8%bot->g0=reg128#8%top},[<adr2=int32#3]
# asm 2: vld1.8 {>g0=d14->g0=d15},[<adr2=r2]
vld1.8 {d14-d15},[r2]

# qhasm: adr2+=8
# asm 1: add >adr2=int32#2,<adr2=int32#3,#8
# asm 2: add >adr2=r1,<adr2=r2,#8
add r1,r2,#8

# qhasm: g1 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>g1=reg128#9%bot->g1=reg128#9%top},[<adr2=int32#2]!
# asm 2: vld1.8 {>g1=d16->g1=d17},[<adr2=r1]!
vld1.8 {d16-d17},[r1]!

# qhasm: g2 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>g2=reg128#10%bot->g2=reg128#10%top},[<adr2=int32#2]!
# asm 2: vld1.8 {>g2=d18->g2=d19},[<adr2=r1]!
vld1.8 {d18-d19},[r1]!

# qhasm: h0[0,1]  =   f0[0] unsigned* g0[0]; h0[2,3]  =   f0[1] unsigned* g0[1]
# asm 1: vmull.u32 >h0=reg128#11,<f0=reg128#3%bot,<g0=reg128#8%bot
# asm 2: vmull.u32 >h0=q10,<f0=d4,<g0=d14
vmull.u32 q10,d4,d14

# qhasm: h1[0,1]  =   f1[0] unsigned* g0[0]; h1[2,3]  =   f1[1] unsigned* g0[1]
# asm 1: vmull.u32 >h1=reg128#12,<f1=reg128#4%bot,<g0=reg128#8%bot
# asm 2: vmull.u32 >h1=q11,<f1=d6,<g0=d14
vmull.u32 q11,d6,d14

# qhasm: h2[0,1]  =   f1[2] unsigned* g0[0]; h2[2,3]  =   f1[3] unsigned* g0[1]
# asm 1: vmull.u32 >h2=reg128#13,<f1=reg128#4%top,<g0=reg128#8%bot
# asm 2: vmull.u32 >h2=q12,<f1=d7,<g0=d14
vmull.u32 q12,d7,d14

# qhasm: h3[0,1]  =   f2[0] unsigned* g0[0]; h3[2,3]  =   f2[1] unsigned* g0[1]
# asm 1: vmull.u32 >h3=reg128#14,<f2=reg128#5%bot,<g0=reg128#8%bot
# asm 2: vmull.u32 >h3=q13,<f2=d8,<g0=d14
vmull.u32 q13,d8,d14

# qhasm: h4[0,1]  =   f2[2] unsigned* g0[0]; h4[2,3]  =   f2[3] unsigned* g0[1]
# asm 1: vmull.u32 >h4=reg128#8,<f2=reg128#5%top,<g0=reg128#8%bot
# asm 2: vmull.u32 >h4=q7,<f2=d9,<g0=d14
vmull.u32 q7,d9,d14

# qhasm: h0[0,1] += _2f2[0] unsigned* g1[2]; h0[2,3] += _2f2[1] unsigned* g1[3]
# asm 1: vmlal.u32 <h0=reg128#11,<_2f2=reg128#7%bot,<g1=reg128#9%top
# asm 2: vmlal.u32 <h0=q10,<_2f2=d12,<g1=d17
vmlal.u32 q10,d12,d17

# qhasm: h0[0,1] += _2f2[2] unsigned* g1[0]; h0[2,3] += _2f2[3] unsigned* g1[1]
# asm 1: vmlal.u32 <h0=reg128#11,<_2f2=reg128#7%top,<g1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2f2=d13,<g1=d16
vmlal.u32 q10,d13,d16

# qhasm: h1[0,1] +=   f0[0] unsigned* g1[0]; h1[2,3] +=   f0[1] unsigned* g1[1]
# asm 1: vmlal.u32 <h1=reg128#12,<f0=reg128#3%bot,<g1=reg128#9%bot
# asm 2: vmlal.u32 <h1=q11,<f0=d4,<g1=d16
vmlal.u32 q11,d4,d16

# qhasm: h1[0,1] +=   f2[2] unsigned* g1[2]; h1[2,3] +=   f2[3] unsigned* g1[3]
# asm 1: vmlal.u32 <h1=reg128#12,<f2=reg128#5%top,<g1=reg128#9%top
# asm 2: vmlal.u32 <h1=q11,<f2=d9,<g1=d17
vmlal.u32 q11,d9,d17

# qhasm: h2[0,1] +=   f0[0] unsigned* g1[2]; h2[2,3] +=   f0[1] unsigned* g1[3]
# asm 1: vmlal.u32 <h2=reg128#13,<f0=reg128#3%bot,<g1=reg128#9%top
# asm 2: vmlal.u32 <h2=q12,<f0=d4,<g1=d17
vmlal.u32 q12,d4,d17

# qhasm: h2[0,1] += _2f1[0] unsigned* g1[0]; h2[2,3] += _2f1[1] unsigned* g1[1]
# asm 1: vmlal.u32 <h2=reg128#13,<_2f1=reg128#6%bot,<g1=reg128#9%bot
# asm 2: vmlal.u32 <h2=q12,<_2f1=d10,<g1=d16
vmlal.u32 q12,d10,d16

# qhasm: h3[0,1] +=   f1[2] unsigned* g1[0]; h3[2,3] +=   f1[3] unsigned* g1[1]
# asm 1: vmlal.u32 <h3=reg128#14,<f1=reg128#4%top,<g1=reg128#9%bot
# asm 2: vmlal.u32 <h3=q13,<f1=d7,<g1=d16
vmlal.u32 q13,d7,d16

# qhasm: h3[0,1] +=   f1[0] unsigned* g1[2]; h3[2,3] +=   f1[1] unsigned* g1[3]
# asm 1: vmlal.u32 <h3=reg128#14,<f1=reg128#4%bot,<g1=reg128#9%top
# asm 2: vmlal.u32 <h3=q13,<f1=d6,<g1=d17
vmlal.u32 q13,d6,d17

# qhasm: h4[0,1] +=   f1[2] unsigned* g1[2]; h4[2,3] +=   f1[3] unsigned* g1[3]
# asm 1: vmlal.u32 <h4=reg128#8,<f1=reg128#4%top,<g1=reg128#9%top
# asm 2: vmlal.u32 <h4=q7,<f1=d7,<g1=d17
vmlal.u32 q7,d7,d17

# qhasm: h4[0,1] += _2f2[0] unsigned* g1[0]; h4[2,3] += _2f2[1] unsigned* g1[1]
# asm 1: vmlal.u32 <h4=reg128#8,<_2f2=reg128#7%bot,<g1=reg128#9%bot
# asm 2: vmlal.u32 <h4=q7,<_2f2=d12,<g1=d16
vmlal.u32 q7,d12,d16

# qhasm: h0[0,1] += _2f1[0] unsigned* g2[2]; h0[2,3] += _2f1[1] unsigned* g2[3]
# asm 1: vmlal.u32 <h0=reg128#11,<_2f1=reg128#6%bot,<g2=reg128#10%top
# asm 2: vmlal.u32 <h0=q10,<_2f1=d10,<g2=d19
vmlal.u32 q10,d10,d19

# qhasm: h0[0,1] += _2f1[2] unsigned* g2[0]; h0[2,3] += _2f1[3] unsigned* g2[1]
# asm 1: vmlal.u32 <h0=reg128#11,<_2f1=reg128#6%top,<g2=reg128#10%bot
# asm 2: vmlal.u32 <h0=q10,<_2f1=d11,<g2=d18
vmlal.u32 q10,d11,d18

# qhasm: h1[0,1] += _2f2[0] unsigned* g2[0]; h1[2,3] += _2f2[1] unsigned* g2[1]
# asm 1: vmlal.u32 <h1=reg128#12,<_2f2=reg128#7%bot,<g2=reg128#10%bot
# asm 2: vmlal.u32 <h1=q11,<_2f2=d12,<g2=d18
vmlal.u32 q11,d12,d18

# qhasm: h1[0,1] +=   f1[2] unsigned* g2[2]; h1[2,3] +=   f1[3] unsigned* g2[3]
# asm 1: vmlal.u32 <h1=reg128#12,<f1=reg128#4%top,<g2=reg128#10%top
# asm 2: vmlal.u32 <h1=q11,<f1=d7,<g2=d19
vmlal.u32 q11,d7,d19

# qhasm: h2[0,1] += _2f2[0] unsigned* g2[2]; h2[2,3] += _2f2[1] unsigned* g2[3]
# asm 1: vmlal.u32 <h2=reg128#13,<_2f2=reg128#7%bot,<g2=reg128#10%top
# asm 2: vmlal.u32 <h2=q12,<_2f2=d12,<g2=d19
vmlal.u32 q12,d12,d19

# qhasm: h2[0,1] += _2f2[2] unsigned* g2[0]; h2[2,3] += _2f2[3] unsigned* g2[1]
# asm 1: vmlal.u32 <h2=reg128#13,<_2f2=reg128#7%top,<g2=reg128#10%bot
# asm 2: vmlal.u32 <h2=q12,<_2f2=d13,<g2=d18
vmlal.u32 q12,d13,d18

# qhasm: h3[0,1] +=   f0[0] unsigned* g2[0]; h3[2,3] +=   f0[1] unsigned* g2[1]
# asm 1: vmlal.u32 <h3=reg128#14,<f0=reg128#3%bot,<g2=reg128#10%bot
# asm 2: vmlal.u32 <h3=q13,<f0=d4,<g2=d18
vmlal.u32 q13,d4,d18

# qhasm: h3[0,1] +=   f2[2] unsigned* g2[2]; h3[2,3] +=   f2[3] unsigned* g2[3]
# asm 1: vmlal.u32 <h3=reg128#14,<f2=reg128#5%top,<g2=reg128#10%top
# asm 2: vmlal.u32 <h3=q13,<f2=d9,<g2=d19
vmlal.u32 q13,d9,d19

# qhasm: h4[0,1] +=   f0[0] unsigned* g2[2]; h4[2,3] +=   f0[1] unsigned* g2[3]
# asm 1: vmlal.u32 <h4=reg128#8,<f0=reg128#3%bot,<g2=reg128#10%top
# asm 2: vmlal.u32 <h4=q7,<f0=d4,<g2=d19
vmlal.u32 q7,d4,d19

# qhasm: h4[0,1] += _2f1[0] unsigned* g2[0]; h4[2,3] += _2f1[1] unsigned* g2[1]
# asm 1: vmlal.u32 <h4=reg128#8,<_2f1=reg128#6%bot,<g2=reg128#10%bot
# asm 2: vmlal.u32 <h4=q7,<_2f1=d10,<g2=d18
vmlal.u32 q7,d10,d18

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q2,<h0=q10,#26
vshr.u64 q2,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#12,<t=reg128#3
# asm 2: vadd.i64 >h1=q2,<h1=q11,<t=q2
vadd.i64 q2,q11,q2

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q10,<mask26=q1
vand q3,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<h1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<h1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#5,<h2=reg128#13,<t=reg128#5
# asm 2: vadd.i64 >h2=q4,<h2=q12,<t=q4
vadd.i64 q4,q12,q4

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#3,<h1=reg128#3,<mask25=reg128#1
# asm 2: vand >h1=q2,<h1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<h2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<h2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#6,<h3=reg128#14,<t=reg128#6
# asm 2: vadd.i64 >h3=q5,<h3=q13,<t=q5
vadd.i64 q5,q13,q5

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#5,<h2=reg128#5,<mask26=reg128#2
# asm 2: vand >h2=q4,<h2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<h3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<h3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#7,<h4=reg128#8,<t=reg128#7
# asm 2: vadd.i64 >h4=q6,<h4=q7,<t=q6
vadd.i64 q6,q7,q6

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#6,<h3=reg128#6,<mask25=reg128#1
# asm 2: vand >h3=q5,<h3=q5,<mask25=q0
vand q5,q5,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h4=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<h4=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#4,<h0=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >h0=q3,<h0=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#1,<h4=reg128#7,<mask25=reg128#1
# asm 2: vand >h4=q0,<h4=q6,<mask25=q0
vand q0,q6,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<h0=reg128#4,#26
# asm 2: vshr.u64 >t=q6,<h0=q3,#26
vshr.u64 q6,q3,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#3,<t=reg128#7
# asm 2: vadd.i64 >h1=q2,<h1=q2,<t=q6
vadd.i64 q2,q2,q6

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#2,<h0=reg128#4,<mask26=reg128#2
# asm 2: vand >h0=q1,<h0=q3,<mask26=q1
vand q1,q3,q1

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#2%bot,<h0=reg128#2%top
# asm 2: vtrn.32 <h0=d2,<h0=d3
vtrn.32 d2,d3

# qhasm: h1 h2 = h1[0]h2[0]h1[2]h2[2] h1[1]h2[1]h1[3]h2[3]
# asm 1: vtrn.32 <h1=reg128#3,<h2=reg128#5
# asm 2: vtrn.32 <h1=q2,<h2=q4
vtrn.32 q2,q4

# qhasm: h1 = h1[0,2,1,3]
# asm 1: vtrn.32 <h1=reg128#3%bot,<h1=reg128#3%top
# asm 2: vtrn.32 <h1=d4,<h1=d5
vtrn.32 d4,d5

# qhasm: h3 h4 = h3[0]h4[0]h3[2]h4[2] h3[1]h4[1]h3[3]h4[3]
# asm 1: vtrn.32 <h3=reg128#6,<h4=reg128#1
# asm 2: vtrn.32 <h3=q5,<h4=q0
vtrn.32 q5,q0

# qhasm: h3 = h3[0,2,1,3]
# asm 1: vtrn.32 <h3=reg128#6%bot,<h3=reg128#6%top
# asm 2: vtrn.32 <h3=d10,<h3=d11
vtrn.32 d10,d11

# qhasm: mem128[adr0] = h0
# asm 1: vst1.8 {<h0=reg128#2%bot-<h0=reg128#2%top},[<adr0=int32#1]
# asm 2: vst1.8 {<h0=d2-<h0=d3},[<adr0=r0]
vst1.8 {d2-d3},[r0]

# qhasm: adr0+=8
# asm 1: add >adr0=int32#1,<adr0=int32#1,#8
# asm 2: add >adr0=r0,<adr0=r0,#8
add r0,r0,#8

# qhasm: mem128[adr0] = h1; adr0+=16
# asm 1: vst1.8 {<h1=reg128#3%bot-<h1=reg128#3%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<h1=d4-<h1=d5},[<adr0=r0]!
vst1.8 {d4-d5},[r0]!

# qhasm: mem128[adr0] = h3; adr0+=16
# asm 1: vst1.8 {<h3=reg128#6%bot-<h3=reg128#6%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<h3=d10-<h3=d11},[<adr0=r0]!
vst1.8 {d10-d11},[r0]!

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
