
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

# qhasm: int128 a0

# qhasm: int128 a1

# qhasm: int128 a2

# qhasm: int128 a3

# qhasm: int128 a4

# qhasm: int128 b0

# qhasm: int128 b1

# qhasm: int128 b2

# qhasm: int128 b3

# qhasm: int128 b4

# qhasm: int128 _2a0

# qhasm: int128 _2a1

# qhasm: int128 _2a2

# qhasm: int128 _2a3

# qhasm: int128 _2a4

# qhasm: int128 r0

# qhasm: int128 r1

# qhasm: int128 r2

# qhasm: int128 r3

# qhasm: int128 r4

# qhasm: int128 r5

# qhasm: int128 t

# qhasm: int128 mask25

# qhasm: int128 mask26

# qhasm: int32 adr0

# qhasm: int32 adr1

# qhasm: int32 adr2

# qhasm: int32 count

# qhasm: stack128 mask25_stack

# qhasm: int32 ptr25

# qhasm: stack128 caller_q4_stack

# qhasm: stack128 caller_q5_stack

# qhasm: stack128 caller_q6_stack

# qhasm: stack128 caller_q7_stack

# qhasm: qpushenter mul
.align 4
.global _mul
.global mul
.type _mul STT_FUNC
.type mul STT_FUNC
_mul:
mul:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#32
and sp,sp,#0xffffffe0

# qhasm: ptr25 = &mask25_stack
# asm 1: lea >ptr25=int32#4,<mask25_stack=stack128#1
# asm 2: lea >ptr25=r3,<mask25_stack=[sp,#0]
add r3,sp,#0

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

# qhasm: mem128[ptr25] = mask25
# asm 1: vst1.8 {<mask25=reg128#1%bot-<mask25=reg128#1%top},[<ptr25=int32#4]
# asm 2: vst1.8 {<mask25=d0-<mask25=d1},[<ptr25=r3]
vst1.8 {d0-d1},[r3]

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#2,<input_1=int32#2
# asm 2: mov >adr1=r1,<input_1=r1
mov r1,r1

# qhasm: a0 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a0=reg128#3%bot->a0=reg128#3%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>a0=d4->a0=d5},[<adr1=r1]!
vld1.8 {d4-d5},[r1]!

# qhasm: a1 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a1=reg128#4%bot->a1=reg128#4%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>a1=d6->a1=d7},[<adr1=r1]!
vld1.8 {d6-d7},[r1]!

# qhasm: a2 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a2=reg128#5%bot->a2=reg128#5%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>a2=d8->a2=d9},[<adr1=r1]!
vld1.8 {d8-d9},[r1]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#6,<a0=reg128#3,#1
# asm 2: vshl.i64 >_2a0=q5,<a0=q2,#1
vshl.i64 q5,q2,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#7,<a1=reg128#4,#1
# asm 2: vshl.i64 >_2a1=q6,<a1=q3,#1
vshl.i64 q6,q3,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#5,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q4,#1
vshl.i64 q7,q4,#1

# qhasm: adr2 = input_2
# asm 1: mov >adr2=int32#3,<input_2=int32#3
# asm 2: mov >adr2=r2,<input_2=r2
mov r2,r2

# qhasm: b0 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<adr2=int32#3]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<adr2=r2]!
vld1.8 {d16-d17},[r2]!

# qhasm: b1 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<adr2=int32#3]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<adr2=r2]!
vld1.8 {d18-d19},[r2]!

# qhasm: b2 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<adr2=int32#3]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<adr2=r2]!
vld1.8 {d20-d21},[r2]!

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a0=reg128#3%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a0=d4,<b0=d16
vmull.u32 q11,d4,d16

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a0=reg128#3%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a0=d5,<b0=d16
vmull.u32 q12,d5,d16

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a1=reg128#4%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a1=d6,<b0=d16
vmull.u32 q13,d6,d16

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a1=reg128#4%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a1=d7,<b0=d16
vmull.u32 q14,d7,d16

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#16,<a2=reg128#5%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r4=q15,<a2=d8,<b0=d16
vmull.u32 q15,d8,d16

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d14,<b0=d17
vmlal.u32 q11,d14,d17

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a0=reg128#3%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a0=d4,<b0=d17
vmlal.u32 q12,d4,d17

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a0=reg128#6%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a0=d11,<b0=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a1=reg128#4%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a1=d6,<b0=d17
vmlal.u32 q14,d6,d17

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a1=reg128#7%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r4=q15,<_2a1=d13,<b0=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#7%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a1=d13,<b1=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#5%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d8,<b1=d18
vmlal.u32 q12,d8,d18

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a0=reg128#3%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a0=d4,<b1=d18
vmlal.u32 q13,d4,d18

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#3%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a0=d5,<b1=d18
vmlal.u32 q14,d5,d18

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a1=reg128#4%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r4=q15,<a1=d6,<b1=d18
vmlal.u32 q15,d6,d18

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#7%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a1=d12,<b1=d19
vmlal.u32 q11,d12,d19

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a1=reg128#7%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a1=d13,<b1=d19
vmlal.u32 q12,d13,d19

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d14,<b1=d19
vmlal.u32 q13,d14,d19

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#3%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a0=d4,<b1=d19
vmlal.u32 q14,d4,d19

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a0=reg128#6%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r4=q15,<_2a0=d11,<b1=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a0=reg128#6%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r0=q11,<_2a0=d11,<b2=d20
vmlal.u32 q11,d11,d20

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a1=reg128#4%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r1=q12,<a1=d6,<b2=d20
vmlal.u32 q12,d6,d20

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a1=reg128#7%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r2=q13,<_2a1=d13,<b2=d20
vmlal.u32 q13,d13,d20

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#5%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r3=q14,<a2=d8,<b2=d20
vmlal.u32 q14,d8,d20

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a0=reg128#3%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r4=q15,<a0=d4,<b2=d20
vmlal.u32 q15,d4,d20

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<r0=reg128#12,#26
# asm 2: vshr.u64 >t=q2,<r0=q11,#26
vshr.u64 q2,q11,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#3,<r1=reg128#13,<t=reg128#3
# asm 2: vadd.i64 >r1=q2,<r1=q12,<t=q2
vadd.i64 q2,q12,q2

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#4,<r0=reg128#12,<mask26=reg128#2
# asm 2: vand >r0=q3,<r0=q11,<mask26=q1
vand q3,q11,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<r1=reg128#3,#25
# asm 2: vshr.u64 >t=q5,<r1=q2,#25
vshr.u64 q5,q2,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#6,<r2=reg128#14,<t=reg128#6
# asm 2: vadd.i64 >r2=q5,<r2=q13,<t=q5
vadd.i64 q5,q13,q5

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#3,<r1=reg128#3,<mask25=reg128#1
# asm 2: vand >r1=q2,<r1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<r2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<r2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#7,<r3=reg128#15,<t=reg128#7
# asm 2: vadd.i64 >r3=q6,<r3=q14,<t=q6
vadd.i64 q6,q14,q6

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#6,<r2=reg128#6,<mask26=reg128#2
# asm 2: vand >r2=q5,<r2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q8,<r3=q6,#25
vshr.u64 q8,q6,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#16,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q15,<t=q8
vadd.i64 q8,q15,q8

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#1
# asm 2: vand >r3=q6,<r3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<r4=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<r4=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#4,<r0=reg128#4,<t=reg128#10
# asm 2: vadd.i64 >r0=q3,<r0=q3,<t=q9
vadd.i64 q3,q3,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#1,<r4=reg128#9,<mask25=reg128#1
# asm 2: vand >r4=q0,<r4=q8,<mask25=q0
vand q0,q8,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#4,#26
# asm 2: vshr.u64 >t=q8,<r0=q3,#26
vshr.u64 q8,q3,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#3,<r1=reg128#3,<t=reg128#9
# asm 2: vadd.i64 >r1=q2,<r1=q2,<t=q8
vadd.i64 q2,q2,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#4,<r0=reg128#4,<mask26=reg128#2
# asm 2: vand >r0=q3,<r0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#4,<r1=reg128#3
# asm 2: vtrn.32 <r0=q3,<r1=q2
vtrn.32 q3,q2

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#4%bot,<r0=reg128#4%top
# asm 2: vtrn.32 <r0=d6,<r0=d7
vtrn.32 d6,d7

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#1,<input_0=int32#1
# asm 2: mov >adr0=r0,<input_0=r0
mov r0,r0

# qhasm: mem128[adr0] = r0; adr0+=16
# asm 1: vst1.8 {<r0=reg128#4%bot-<r0=reg128#4%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<r0=d6-<r0=d7},[<adr0=r0]!
vst1.8 {d6-d7},[r0]!

# qhasm: mem128[adr0] = r2; adr0+=16
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<adr0=r0]!
vst1.8 {d10-d11},[r0]!

# qhasm: a3 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#3%bot->a3=reg128#3%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>a3=d4->a3=d5},[<adr1=r1]!
vld1.8 {d4-d5},[r1]!

# qhasm: a4 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#4%bot->a4=reg128#4%top},[<adr1=int32#2]!
# asm 2: vld1.8 {>a4=d6->a4=d7},[<adr1=r1]!
vld1.8 {d6-d7},[r1]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#3,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q2,#1
vshl.i64 q5,q2,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#4,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q3,#1
vshl.i64 q6,q3,#1

# qhasm: b3 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<adr2=int32#3]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<adr2=r2]!
vld1.8 {d16-d17},[r2]!

# qhasm: b4 = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<adr2=int32#3]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<adr2=r2]!
vld1.8 {d18-d19},[r2]!

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#3%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a3=d4,<b3=d16
vmull.u32 q11,d4,d16

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#3%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a3=d5,<b3=d16
vmull.u32 q12,d5,d16

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#4%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a4=d6,<b3=d16
vmull.u32 q13,d6,d16

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#4%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a4=d7,<b3=d16
vmull.u32 q14,d7,d16

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#5%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r5=q15,<a2=d9,<b3=d16
vmull.u32 q15,d9,d16

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d15,<b3=d17
vmlal.u32 q11,d15,d17

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#3%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a3=d4,<b3=d17
vmlal.u32 q12,d4,d17

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#6%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d11,<b3=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#4%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a4=d6,<b3=d17
vmlal.u32 q14,d6,d17

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#7%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d13,<b3=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d13,<b4=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#5%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d9,<b4=d18
vmlal.u32 q12,d9,d18

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#3%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d4,<b4=d18
vmlal.u32 q13,d4,d18

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#3%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d5,<b4=d18
vmlal.u32 q14,d5,d18

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#4%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d6,<b4=d18
vmlal.u32 q15,d6,d18

# qhasm: r0[0,1] += _2a4[0] unsigned* b4[2]; r0[2,3] += _2a4[1] unsigned* b4[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a4=d12,<b4=d19
vmlal.u32 q11,d12,d19

# qhasm: r1[0,1] += _2a4[2] unsigned* b4[2]; r1[2,3] += _2a4[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a4=reg128#7%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a4=d13,<b4=d19
vmlal.u32 q12,d13,d19

# qhasm: r2[0,1] += _2a2[2] unsigned* b4[2]; r2[2,3] += _2a2[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d15,<b4=d19
vmlal.u32 q13,d15,d19

# qhasm: r3[0,1] +=   a3[0] unsigned* b4[2]; r3[2,3] +=   a3[1] unsigned* b4[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#3%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a3=d4,<b4=d19
vmlal.u32 q14,d4,d19

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#6%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d11,<b4=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#6%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d11,<b2=d21
vmlal.u32 q11,d11,d21

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#4%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r1=q12,<a4=d6,<b2=d21
vmlal.u32 q12,d6,d21

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#7%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d13,<b2=d21
vmlal.u32 q13,d13,d21

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#5%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r3=q14,<a2=d9,<b2=d21
vmlal.u32 q14,d9,d21

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#3%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r5=q15,<a3=d4,<b2=d21
vmlal.u32 q15,d4,d21

# qhasm: mask25 = mem128[ptr25]
# asm 1: vld1.8 {>mask25=reg128#3%bot->mask25=reg128#3%top},[<ptr25=int32#4]
# asm 2: vld1.8 {>mask25=d4->mask25=d5},[<ptr25=r3]
vld1.8 {d4-d5},[r3]

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<r0=reg128#12,#26
# asm 2: vshr.u64 >t=q3,<r0=q11,#26
vshr.u64 q3,q11,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >r1=q3,<r1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#12,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q11,<mask26=q1
vand q4,q11,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<r1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<r1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#6,<r2=reg128#14,<t=reg128#6
# asm 2: vadd.i64 >r2=q5,<r2=q13,<t=q5
vadd.i64 q5,q13,q5

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#3
# asm 2: vand >r1=q3,<r1=q3,<mask25=q2
vand q3,q3,q2

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<r2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<r2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#7,<r3=reg128#15,<t=reg128#7
# asm 2: vadd.i64 >r3=q6,<r3=q14,<t=q6
vadd.i64 q6,q14,q6

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#6,<r2=reg128#6,<mask26=reg128#2
# asm 2: vand >r2=q5,<r2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<r3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x r5 += t
# asm 1: vadd.i64 >r5=reg128#8,<r5=reg128#16,<t=reg128#8
# asm 2: vadd.i64 >r5=q7,<r5=q15,<t=q7
vadd.i64 q7,q15,q7

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#3
# asm 2: vand >r3=q6,<r3=q6,<mask25=q2
vand q6,q6,q2

# qhasm: 2x t = r5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r5=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<r5=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: r5 &= mask25
# asm 1: vand >r5=reg128#3,<r5=reg128#8,<mask25=reg128#3
# asm 2: vand >r5=q2,<r5=q7,<mask25=q2
vand q2,q7,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q7,<r0=q4,#26
vshr.u64 q7,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#2,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q1,<r0=q4,<mask26=q1
vand q1,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#2,<r1=reg128#4
# asm 2: vtrn.32 <r0=q1,<r1=q3
vtrn.32 q1,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#2%bot,<r0=reg128#2%top
# asm 2: vtrn.32 <r0=d2,<r0=d3
vtrn.32 d2,d3

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#1,<r5=reg128#3
# asm 2: vtrn.32 <r4=q0,<r5=q2
vtrn.32 q0,q2

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#1%bot,<r4=reg128#1%top
# asm 2: vtrn.32 <r4=d0,<r4=d1
vtrn.32 d0,d1

# qhasm: mem128[adr0] = r4; adr0+=16
# asm 1: vst1.8 {<r4=reg128#1%bot-<r4=reg128#1%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<r4=d0-<r4=d1},[<adr0=r0]!
vst1.8 {d0-d1},[r0]!

# qhasm: mem128[adr0] = r0; adr0+=16
# asm 1: vst1.8 {<r0=reg128#2%bot-<r0=reg128#2%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<r0=d2-<r0=d3},[<adr0=r0]!
vst1.8 {d2-d3},[r0]!

# qhasm: mem128[adr0] = r2; adr0+=16
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<adr0=r0]!
vst1.8 {d10-d11},[r0]!

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
