
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

# qhasm: int32 adr0

# qhasm: int32 adr1

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

# qhasm: int128 h0

# qhasm: int128 h1

# qhasm: int128 h2

# qhasm: int128 h3

# qhasm: int128 h4

# qhasm: int128 h5

# qhasm: int128 r0

# qhasm: int128 r1

# qhasm: int128 r2

# qhasm: int128 r3

# qhasm: int128 r4

# qhasm: int128 r5

# qhasm: int128 _2h0

# qhasm: int128 _2h1

# qhasm: int128 _2h2

# qhasm: int128 _2h3

# qhasm: int128 _2h4

# qhasm: int128 k0

# qhasm: int128 k1

# qhasm: int128 k2

# qhasm: int128 k3

# qhasm: int128 k4

# qhasm: int128 _2k0

# qhasm: int128 _2k1

# qhasm: int128 _2k2

# qhasm: int128 _2k3

# qhasm: int128 _2k4

# qhasm: int128 s4

# qhasm: int128 t

# qhasm: int128 mask25

# qhasm: int128 mask26

# qhasm: int32 ptr0

# qhasm: int32 ptr1

# qhasm: int32 ctr

# qhasm: stack3072 ptr_stack

# qhasm: qpushenter invert 
.align 4
.global _invert
.global invert
.type _invert STT_FUNC
.type invert STT_FUNC
_invert:
invert:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#448
and sp,sp,#0xffffffe0

# qhasm: stack32 stack_r4

# qhasm: stack32 stack_r5

# qhasm: stack32 stack_r6

# qhasm: stack32 stack_r7

# qhasm: stack32 stack_r8

# qhasm: stack32 stack_r9

# qhasm: stack32 stack_r10

# qhasm: stack32 stack_r11

# qhasm: stack32 stack_r12

# qhasm: stack32 stack_r14

# qhasm: stack_r4 = caller_r4
# asm 1: str <caller_r4=int32#5,>stack_r4=stack32#1
# asm 2: str <caller_r4=r4,>stack_r4=[sp,#0]
str r4,[sp,#0]

# qhasm: stack_r5 = caller_r5
# asm 1: str <caller_r5=int32#6,>stack_r5=stack32#2
# asm 2: str <caller_r5=r5,>stack_r5=[sp,#4]
str r5,[sp,#4]

# qhasm: stack_r6 = caller_r6
# asm 1: str <caller_r6=int32#7,>stack_r6=stack32#3
# asm 2: str <caller_r6=r6,>stack_r6=[sp,#8]
str r6,[sp,#8]

# qhasm: stack_r7 = caller_r7
# asm 1: str <caller_r7=int32#8,>stack_r7=stack32#4
# asm 2: str <caller_r7=r7,>stack_r7=[sp,#12]
str r7,[sp,#12]

# qhasm: stack_r8 = caller_r8
# asm 1: str <caller_r8=int32#9,>stack_r8=stack32#5
# asm 2: str <caller_r8=r8,>stack_r8=[sp,#16]
str r8,[sp,#16]

# qhasm: stack_r9 = caller_r9
# asm 1: str <caller_r9=int32#10,>stack_r9=stack32#6
# asm 2: str <caller_r9=r9,>stack_r9=[sp,#20]
str r9,[sp,#20]

# qhasm: stack_r10 = caller_r10
# asm 1: str <caller_r10=int32#11,>stack_r10=stack32#7
# asm 2: str <caller_r10=r10,>stack_r10=[sp,#24]
str r10,[sp,#24]

# qhasm: stack_r11 = caller_r11
# asm 1: str <caller_r11=int32#12,>stack_r11=stack32#8
# asm 2: str <caller_r11=r11,>stack_r11=[sp,#28]
str r11,[sp,#28]

# qhasm: stack_r12 = caller_r12
# asm 1: str <caller_r12=int32#13,>stack_r12=stack32#9
# asm 2: str <caller_r12=r12,>stack_r12=[sp,#32]
str r12,[sp,#32]

# qhasm: stack_r14 = caller_r14
# asm 1: str <caller_r14=int32#14,>stack_r14=stack32#10
# asm 2: str <caller_r14=r14,>stack_r14=[sp,#36]
str r14,[sp,#36]

# qhasm: stack128 caller_q4_stack

# qhasm: stack128 caller_q5_stack

# qhasm: stack128 caller_q6_stack

# qhasm: stack128 caller_q7_stack

# qhasm: ptr0 = &ptr_stack
# asm 1: lea >ptr0=int32#3,<ptr_stack=stack3072#1
# asm 2: lea >ptr0=r2,<ptr_stack=[sp,#64]
add r2,sp,#64

# qhasm: ptr1 = ptr0
# asm 1: mov >ptr1=int32#3,<ptr0=int32#3
# asm 2: mov >ptr1=r2,<ptr0=r2
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

# qhasm: mem128[ptr1] aligned = mask25; ptr1+=16		
# asm 1: vst1.8 {<mask25=reg128#1%bot-<mask25=reg128#1%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<mask25=d0-<mask25=d1},[<ptr1=r2,: 128]!
vst1.8 {d0-d1},[r2,: 128]!

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#4,<input_1=int32#2
# asm 2: mov >adr1=r3,<input_1=r1
mov r3,r1

# qhasm: a0 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a0=reg128#3%bot->a0=reg128#3%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a0=d4->a0=d5},[<adr1=r3,: 128]!
vld1.8 {d4-d5},[r3,: 128]!

# qhasm: a1 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a1=reg128#4%bot->a1=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a1=d6->a1=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a2 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a2=reg128#5%bot->a2=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a2=d8->a2=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

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

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#9,<a0=reg128#3%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h0=q8,<a0=d4,<a0=d4
vmull.u32 q8,d4,d4

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#10,<_2a0=reg128#6%top,<a0=reg128#3%top
# asm 2: vmull.u32 >h2=q9,<_2a0=d11,<a0=d5
vmull.u32 q9,d11,d5

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#11,<a1=reg128#4%bot,<a1=reg128#4%bot
# asm 2: vmull.u32 >h4=q10,<a1=d6,<a1=d6
vmull.u32 q10,d6,d6

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#12,<_2a1=reg128#7%top,<a1=reg128#4%top
# asm 2: vmull.u32 >h1=q11,<_2a1=d13,<a1=d7
vmull.u32 q11,d13,d7

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#13,<a2=reg128#5%bot,<a2=reg128#5%bot
# asm 2: vmull.u32 >h3=q12,<a2=d8,<a2=d8
vmull.u32 q12,d8,d8

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#12,<_2a0=reg128#6%top,<a0=reg128#3%bot
# asm 2: vmlal.u32 <h1=q11,<_2a0=d11,<a0=d4
vmlal.u32 q11,d11,d4

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#10,<_2a1=reg128#7%bot,<a0=reg128#3%bot
# asm 2: vmlal.u32 <h2=q9,<_2a1=d12,<a0=d4
vmlal.u32 q9,d12,d4

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#13,<_2a1=reg128#7%top,<a0=reg128#3%bot
# asm 2: vmlal.u32 <h3=q12,<_2a1=d13,<a0=d4
vmlal.u32 q12,d13,d4

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#11,<_2a2=reg128#8%bot,<a0=reg128#3%bot
# asm 2: vmlal.u32 <h4=q10,<_2a2=d14,<a0=d4
vmlal.u32 q10,d14,d4

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#9,<_2a2=reg128#8%bot,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <h0=q8,<_2a2=d14,<_2a0=d11
vmlal.u32 q8,d14,d11

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#11,<_2a1=reg128#7%top,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <h4=q10,<_2a1=d13,<_2a0=d11
vmlal.u32 q10,d13,d11

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#13,<_2a1=reg128#7%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <h3=q12,<_2a1=d12,<a0=d5
vmlal.u32 q12,d12,d5

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#9,<_2a1=reg128#7%top,<_2a1=reg128#7%bot
# asm 2: vmlal.u32 <h0=q8,<_2a1=d13,<_2a1=d12
vmlal.u32 q8,d13,d12

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#12,<_2a2=reg128#8%bot,<a1=reg128#4%bot
# asm 2: vmlal.u32 <h1=q11,<_2a2=d14,<a1=d6
vmlal.u32 q11,d14,d6

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#10,<_2a2=reg128#8%bot,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <h2=q9,<_2a2=d14,<_2a1=d13
vmlal.u32 q9,d14,d13

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#14,<h0=reg128#9,#26
# asm 2: vshr.u64 >t=q13,<h0=q8,#26
vshr.u64 q13,q8,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#12,<h1=reg128#12,<t=reg128#14
# asm 2: vadd.i64 >h1=q11,<h1=q11,<t=q13
vadd.i64 q11,q11,q13

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#9,<h0=reg128#9,<mask26=reg128#2
# asm 2: vand >h0=q8,<h0=q8,<mask26=q1
vand q8,q8,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#14,<h1=reg128#12,#25
# asm 2: vshr.u64 >t=q13,<h1=q11,#25
vshr.u64 q13,q11,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#10,<h2=reg128#10,<t=reg128#14
# asm 2: vadd.i64 >h2=q9,<h2=q9,<t=q13
vadd.i64 q9,q9,q13

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#12,<h1=reg128#12,<mask25=reg128#1
# asm 2: vand >h1=q11,<h1=q11,<mask25=q0
vand q11,q11,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#14,<h2=reg128#10,#26
# asm 2: vshr.u64 >t=q13,<h2=q9,#26
vshr.u64 q13,q9,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#13,<h3=reg128#13,<t=reg128#14
# asm 2: vadd.i64 >h3=q12,<h3=q12,<t=q13
vadd.i64 q12,q12,q13

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#10,<h2=reg128#10,<mask26=reg128#2
# asm 2: vand >h2=q9,<h2=q9,<mask26=q1
vand q9,q9,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#14,<h3=reg128#13,#25
# asm 2: vshr.u64 >t=q13,<h3=q12,#25
vshr.u64 q13,q12,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#11,<t=reg128#14
# asm 2: vadd.i64 >h4=q10,<h4=q10,<t=q13
vadd.i64 q10,q10,q13

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#13,<h3=reg128#13,<mask25=reg128#1
# asm 2: vand >h3=q12,<h3=q12,<mask25=q0
vand q12,q12,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#14,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q13,<h4=q10,#25
vshr.u64 q13,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#9,<h0=reg128#9,<t=reg128#14
# asm 2: vadd.i64 >h0=q8,<h0=q8,<t=q13
vadd.i64 q8,q8,q13

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#1
# asm 2: vand >h4=q10,<h4=q10,<mask25=q0
vand q10,q10,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#14,<h0=reg128#9,#26
# asm 2: vshr.u64 >t=q13,<h0=q8,#26
vshr.u64 q13,q8,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#12,<h1=reg128#12,<t=reg128#14
# asm 2: vadd.i64 >h1=q11,<h1=q11,<t=q13
vadd.i64 q11,q11,q13

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#9,<h0=reg128#9,<mask26=reg128#2
# asm 2: vand >h0=q8,<h0=q8,<mask26=q1
vand q8,q8,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#9,<h1=reg128#12
# asm 2: vtrn.32 <h0=q8,<h1=q11
vtrn.32 q8,q11

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#9%bot,<h0=reg128#9%top
# asm 2: vtrn.32 <h0=d16,<h0=d17
vtrn.32 d16,d17

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#10,<h3=reg128#13
# asm 2: vtrn.32 <h2=q9,<h3=q12
vtrn.32 q9,q12

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#10%bot,<h2=reg128#10%top
# asm 2: vtrn.32 <h2=d18,<h2=d19
vtrn.32 d18,d19

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: k0[0,1]  = h0[0] unsigned*   a0[0]; k0[2,3]  = h0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >k0=reg128#12,<h0=reg128#9%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >k0=q11,<h0=d16,<a0=d4
vmull.u32 q11,d16,d4

# qhasm: k1[0,1]  = h0[2] unsigned*   a0[0]; k1[2,3]  = h0[3] unsigned*   a0[1]		
# asm 1: vmull.u32 >k1=reg128#13,<h0=reg128#9%top,<a0=reg128#3%bot
# asm 2: vmull.u32 >k1=q12,<h0=d17,<a0=d4
vmull.u32 q12,d17,d4

# qhasm: k2[0,1]  = h2[0] unsigned*   a0[0]; k2[2,3]  = h2[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >k2=reg128#14,<h2=reg128#10%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >k2=q13,<h2=d18,<a0=d4
vmull.u32 q13,d18,d4

# qhasm: k3[0,1]  = h2[2] unsigned*   a0[0]; k3[2,3]  = h2[3] unsigned*   a0[1]		
# asm 1: vmull.u32 >k3=reg128#15,<h2=reg128#10%top,<a0=reg128#3%bot
# asm 2: vmull.u32 >k3=q14,<h2=d19,<a0=d4
vmull.u32 q14,d19,d4

# qhasm: k4[0,1]  = h4[0] unsigned*   a0[0]; k4[2,3]  = h4[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >k4=reg128#16,<h4=reg128#11%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >k4=q15,<h4=d20,<a0=d4
vmull.u32 q15,d20,d4

# qhasm: k0[0,1] += h4[0] unsigned* _2a0[2]; k0[2,3] += h4[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <k0=reg128#12,<h4=reg128#11%bot,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <k0=q11,<h4=d20,<_2a0=d11
vmlal.u32 q11,d20,d11

# qhasm: k1[0,1] += h0[0] unsigned*   a0[2]; k1[2,3] += h0[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <k1=reg128#13,<h0=reg128#9%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <k1=q12,<h0=d16,<a0=d5
vmlal.u32 q12,d16,d5

# qhasm: k2[0,1] += h0[2] unsigned* _2a0[2]; k2[2,3] += h0[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <k2=reg128#14,<h0=reg128#9%top,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <k2=q13,<h0=d17,<_2a0=d11
vmlal.u32 q13,d17,d11

# qhasm: k3[0,1] += h2[0] unsigned*   a0[2]; k3[2,3] += h2[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <k3=reg128#15,<h2=reg128#10%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <k3=q14,<h2=d18,<a0=d5
vmlal.u32 q14,d18,d5

# qhasm: k4[0,1] += h2[2] unsigned* _2a0[2]; k4[2,3] += h2[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <k4=reg128#16,<h2=reg128#10%top,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <k4=q15,<h2=d19,<_2a0=d11
vmlal.u32 q15,d19,d11

# qhasm: k0[0,1] += h2[2] unsigned* _2a1[0]; k0[2,3] += h2[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <k0=reg128#12,<h2=reg128#10%top,<_2a1=reg128#7%bot
# asm 2: vmlal.u32 <k0=q11,<h2=d19,<_2a1=d12
vmlal.u32 q11,d19,d12

# qhasm: k1[0,1] += h4[0] unsigned*   a1[0]; k1[2,3] += h4[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<h4=reg128#11%bot,<a1=reg128#4%bot
# asm 2: vmlal.u32 <k1=q12,<h4=d20,<a1=d6
vmlal.u32 q12,d20,d6

# qhasm: k2[0,1] += h0[0] unsigned*   a1[0]; k2[2,3] += h0[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <k2=reg128#14,<h0=reg128#9%bot,<a1=reg128#4%bot
# asm 2: vmlal.u32 <k2=q13,<h0=d16,<a1=d6
vmlal.u32 q13,d16,d6

# qhasm: k3[0,1] += h0[2] unsigned*   a1[0]; k3[2,3] += h0[3] unsigned*   a1[1]		
# asm 1: vmlal.u32 <k3=reg128#15,<h0=reg128#9%top,<a1=reg128#4%bot
# asm 2: vmlal.u32 <k3=q14,<h0=d17,<a1=d6
vmlal.u32 q14,d17,d6

# qhasm: k4[0,1] += h2[0] unsigned*   a1[0]; k4[2,3] += h2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <k4=reg128#16,<h2=reg128#10%bot,<a1=reg128#4%bot
# asm 2: vmlal.u32 <k4=q15,<h2=d18,<a1=d6
vmlal.u32 q15,d18,d6

# qhasm: k0[0,1] += h2[0] unsigned* _2a1[2]; k0[2,3] += h2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <k0=reg128#12,<h2=reg128#10%bot,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <k0=q11,<h2=d18,<_2a1=d13
vmlal.u32 q11,d18,d13

# qhasm: k1[0,1] += h2[2] unsigned* _2a1[2]; k1[2,3] += h2[3] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <k1=reg128#13,<h2=reg128#10%top,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <k1=q12,<h2=d19,<_2a1=d13
vmlal.u32 q12,d19,d13

# qhasm: k2[0,1] += h4[0] unsigned* _2a1[2]; k2[2,3] += h4[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <k2=reg128#14,<h4=reg128#11%bot,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <k2=q13,<h4=d20,<_2a1=d13
vmlal.u32 q13,d20,d13

# qhasm: k3[0,1] += h0[0] unsigned*   a1[2]; k3[2,3] += h0[1] unsigned*   a1[3]		
# asm 1: vmlal.u32 <k3=reg128#15,<h0=reg128#9%bot,<a1=reg128#4%top
# asm 2: vmlal.u32 <k3=q14,<h0=d16,<a1=d7
vmlal.u32 q14,d16,d7

# qhasm: k4[0,1] += h0[2] unsigned* _2a1[2]; k4[2,3] += h0[3] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <k4=reg128#16,<h0=reg128#9%top,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <k4=q15,<h0=d17,<_2a1=d13
vmlal.u32 q15,d17,d13

# qhasm: k0[0,1] += h0[2] unsigned* _2a2[0]; k0[2,3] += h0[3] unsigned* _2a2[1]		
# asm 1: vmlal.u32 <k0=reg128#12,<h0=reg128#9%top,<_2a2=reg128#8%bot
# asm 2: vmlal.u32 <k0=q11,<h0=d17,<_2a2=d14
vmlal.u32 q11,d17,d14

# qhasm: k1[0,1] += h2[0] unsigned*   a2[0]; k1[2,3] += h2[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<h2=reg128#10%bot,<a2=reg128#5%bot
# asm 2: vmlal.u32 <k1=q12,<h2=d18,<a2=d8
vmlal.u32 q12,d18,d8

# qhasm: k2[0,1] += h2[2] unsigned* _2a2[0]; k2[2,3] += h2[3] unsigned* _2a2[1]		
# asm 1: vmlal.u32 <k2=reg128#14,<h2=reg128#10%top,<_2a2=reg128#8%bot
# asm 2: vmlal.u32 <k2=q13,<h2=d19,<_2a2=d14
vmlal.u32 q13,d19,d14

# qhasm: k3[0,1] += h4[0] unsigned*   a2[0]; k3[2,3] += h4[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <k3=reg128#15,<h4=reg128#11%bot,<a2=reg128#5%bot
# asm 2: vmlal.u32 <k3=q14,<h4=d20,<a2=d8
vmlal.u32 q14,d20,d8

# qhasm: k4[0,1] += h0[0] unsigned*   a2[0]; k4[2,3] += h0[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <k4=reg128#16,<h0=reg128#9%bot,<a2=reg128#5%bot
# asm 2: vmlal.u32 <k4=q15,<h0=d16,<a2=d8
vmlal.u32 q15,d16,d8

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<k0=reg128#12,#26
# asm 2: vshr.u64 >t=q2,<k0=q11,#26
vshr.u64 q2,q11,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#3,<k1=reg128#13,<t=reg128#3
# asm 2: vadd.i64 >k1=q2,<k1=q12,<t=q2
vadd.i64 q2,q12,q2

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#12,<mask26=reg128#2
# asm 2: vand >k0=q3,<k0=q11,<mask26=q1
vand q3,q11,q1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<k1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<k1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#5,<k2=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >k2=q4,<k2=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#3,<k1=reg128#3,<mask25=reg128#1
# asm 2: vand >k1=q2,<k1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<k2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<k2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#6,<k3=reg128#15,<t=reg128#6
# asm 2: vadd.i64 >k3=q5,<k3=q14,<t=q5
vadd.i64 q5,q14,q5

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#5,<k2=reg128#5,<mask26=reg128#2
# asm 2: vand >k2=q4,<k2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<k3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<k3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#7,<k4=reg128#16,<t=reg128#7
# asm 2: vadd.i64 >k4=q6,<k4=q15,<t=q6
vadd.i64 q6,q15,q6

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#6,<k3=reg128#6,<mask25=reg128#1
# asm 2: vand >k3=q5,<k3=q5,<mask25=q0
vand q5,q5,q0

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k4=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<k4=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >k0=q3,<k0=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#7,<k4=reg128#7,<mask25=reg128#1
# asm 2: vand >k4=q6,<k4=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<k0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<k0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#3,<k1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >k1=q2,<k1=q2,<t=q7
vadd.i64 q2,q2,q7

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#4,<mask26=reg128#2
# asm 2: vand >k0=q3,<k0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#4,<k1=reg128#3
# asm 2: vtrn.32 <k0=q3,<k1=q2
vtrn.32 q3,q2

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#4%bot,<k0=reg128#4%top
# asm 2: vtrn.32 <k0=d6,<k0=d7
vtrn.32 d6,d7

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#5,<k3=reg128#6
# asm 2: vtrn.32 <k2=q4,<k3=q5
vtrn.32 q4,q5

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#5%bot,<k2=reg128#5%top
# asm 2: vtrn.32 <k2=d8,<k2=d9
vtrn.32 d8,d9

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#7%bot,<k4=reg128#7%top
# asm 2: vtrn.32 <k4=d12,<k4=d13
vtrn.32 d12,d13

# qhasm: mem128[ptr1] aligned = k0; ptr1+=16	
# asm 1: vst1.8 {<k0=reg128#4%bot-<k0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<k0=d6-<k0=d7},[<ptr1=r2,: 128]!
vst1.8 {d6-d7},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = k2; ptr1+=16	
# asm 1: vst1.8 {<k2=reg128#5%bot-<k2=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<k2=d8-<k2=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = k4; ptr1+=16	
# asm 1: vst1.8 {<k4=reg128#7%bot-<k4=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<k4=d12-<k4=d13},[<ptr1=r2,: 128]!
vst1.8 {d12-d13},[r2,: 128]!

# qhasm: 2x _2k0 = k0 << 1
# asm 1: vshl.i64 >_2k0=reg128#3,<k0=reg128#4,#1
# asm 2: vshl.i64 >_2k0=q2,<k0=q3,#1
vshl.i64 q2,q3,#1

# qhasm: 2x _2k2 = k2 << 1
# asm 1: vshl.i64 >_2k2=reg128#6,<k2=reg128#5,#1
# asm 2: vshl.i64 >_2k2=q5,<k2=q4,#1
vshl.i64 q5,q4,#1

# qhasm: 2x _2k4 = k4 << 1
# asm 1: vshl.i64 >_2k4=reg128#8,<k4=reg128#7,#1
# asm 2: vshl.i64 >_2k4=q7,<k4=q6,#1
vshl.i64 q7,q6,#1

# qhasm: h0[0,1]  =   k0[0] unsigned*   k0[0]; h0[2,3]  =   k0[1] unsigned*   k0[1]		
# asm 1: vmull.u32 >h0=reg128#9,<k0=reg128#4%bot,<k0=reg128#4%bot
# asm 2: vmull.u32 >h0=q8,<k0=d6,<k0=d6
vmull.u32 q8,d6,d6

# qhasm: h2[0,1]  = _2k0[2] unsigned*   k0[2]; h2[2,3]  = _2k0[3] unsigned*   k0[3]		
# asm 1: vmull.u32 >h2=reg128#10,<_2k0=reg128#3%top,<k0=reg128#4%top
# asm 2: vmull.u32 >h2=q9,<_2k0=d5,<k0=d7
vmull.u32 q9,d5,d7

# qhasm: h4[0,1]  =   k2[0] unsigned*   k2[0]; h4[2,3]  =   k2[1] unsigned*   k2[1]		
# asm 1: vmull.u32 >h4=reg128#11,<k2=reg128#5%bot,<k2=reg128#5%bot
# asm 2: vmull.u32 >h4=q10,<k2=d8,<k2=d8
vmull.u32 q10,d8,d8

# qhasm: h1[0,1]  = _2k2[2] unsigned*   k2[2]; h1[2,3]  = _2k2[3] unsigned*   k2[3]		
# asm 1: vmull.u32 >h1=reg128#12,<_2k2=reg128#6%top,<k2=reg128#5%top
# asm 2: vmull.u32 >h1=q11,<_2k2=d11,<k2=d9
vmull.u32 q11,d11,d9

# qhasm: h3[0,1]  =   k4[0] unsigned*   k4[0]; h3[2,3]  =   k4[1] unsigned*   k4[1]		
# asm 1: vmull.u32 >h3=reg128#7,<k4=reg128#7%bot,<k4=reg128#7%bot
# asm 2: vmull.u32 >h3=q6,<k4=d12,<k4=d12
vmull.u32 q6,d12,d12

# qhasm: h1[0,1] += _2k0[2] unsigned*   k0[0]; h1[2,3] += _2k0[3] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h1=reg128#12,<_2k0=reg128#3%top,<k0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q11,<_2k0=d5,<k0=d6
vmlal.u32 q11,d5,d6

# qhasm: h2[0,1] += _2k2[0] unsigned*   k0[0]; h2[2,3] += _2k2[1] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h2=reg128#10,<_2k2=reg128#6%bot,<k0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q9,<_2k2=d10,<k0=d6
vmlal.u32 q9,d10,d6

# qhasm: h3[0,1] += _2k2[2] unsigned*   k0[0]; h3[2,3] += _2k2[3] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h3=reg128#7,<_2k2=reg128#6%top,<k0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q6,<_2k2=d11,<k0=d6
vmlal.u32 q6,d11,d6

# qhasm: h4[0,1] += _2k4[0] unsigned*   k0[0]; h4[2,3] += _2k4[1] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h4=reg128#11,<_2k4=reg128#8%bot,<k0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q10,<_2k4=d14,<k0=d6
vmlal.u32 q10,d14,d6

# qhasm: h0[0,1] += _2k4[0] unsigned* _2k0[2]; h0[2,3] += _2k4[1] unsigned* _2k0[3]		
# asm 1: vmlal.u32 <h0=reg128#9,<_2k4=reg128#8%bot,<_2k0=reg128#3%top
# asm 2: vmlal.u32 <h0=q8,<_2k4=d14,<_2k0=d5
vmlal.u32 q8,d14,d5

# qhasm: h4[0,1] += _2k2[2] unsigned* _2k0[2]; h4[2,3] += _2k2[3] unsigned* _2k0[3]		
# asm 1: vmlal.u32 <h4=reg128#11,<_2k2=reg128#6%top,<_2k0=reg128#3%top
# asm 2: vmlal.u32 <h4=q10,<_2k2=d11,<_2k0=d5
vmlal.u32 q10,d11,d5

# qhasm: h3[0,1] += _2k2[0] unsigned*   k0[2]; h3[2,3] += _2k2[1] unsigned*   k0[3]		
# asm 1: vmlal.u32 <h3=reg128#7,<_2k2=reg128#6%bot,<k0=reg128#4%top
# asm 2: vmlal.u32 <h3=q6,<_2k2=d10,<k0=d7
vmlal.u32 q6,d10,d7

# qhasm: h0[0,1] += _2k2[2] unsigned* _2k2[0]; h0[2,3] += _2k2[3] unsigned* _2k2[1]		
# asm 1: vmlal.u32 <h0=reg128#9,<_2k2=reg128#6%top,<_2k2=reg128#6%bot
# asm 2: vmlal.u32 <h0=q8,<_2k2=d11,<_2k2=d10
vmlal.u32 q8,d11,d10

# qhasm: h1[0,1] += _2k4[0] unsigned*   k2[0]; h1[2,3] += _2k4[1] unsigned*   k2[1]		
# asm 1: vmlal.u32 <h1=reg128#12,<_2k4=reg128#8%bot,<k2=reg128#5%bot
# asm 2: vmlal.u32 <h1=q11,<_2k4=d14,<k2=d8
vmlal.u32 q11,d14,d8

# qhasm: h2[0,1] += _2k4[0] unsigned* _2k2[2]; h2[2,3] += _2k4[1] unsigned* _2k2[3]		
# asm 1: vmlal.u32 <h2=reg128#10,<_2k4=reg128#8%bot,<_2k2=reg128#6%top
# asm 2: vmlal.u32 <h2=q9,<_2k4=d14,<_2k2=d11
vmlal.u32 q9,d14,d11

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<h0=reg128#9,#26
# asm 2: vshr.u64 >t=q2,<h0=q8,#26
vshr.u64 q2,q8,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#12,<t=reg128#3
# asm 2: vadd.i64 >h1=q2,<h1=q11,<t=q2
vadd.i64 q2,q11,q2

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#9,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q8,<mask26=q1
vand q3,q8,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<h1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<h1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#5,<h2=reg128#10,<t=reg128#5
# asm 2: vadd.i64 >h2=q4,<h2=q9,<t=q4
vadd.i64 q4,q9,q4

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#3,<h1=reg128#3,<mask25=reg128#1
# asm 2: vand >h1=q2,<h1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<h2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<h2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#6,<h3=reg128#7,<t=reg128#6
# asm 2: vadd.i64 >h3=q5,<h3=q6,<t=q5
vadd.i64 q5,q6,q5

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#5,<h2=reg128#5,<mask26=reg128#2
# asm 2: vand >h2=q4,<h2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<h3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<h3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#7,<h4=reg128#11,<t=reg128#7
# asm 2: vadd.i64 >h4=q6,<h4=q10,<t=q6
vadd.i64 q6,q10,q6

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
# asm 1: vand >h4=reg128#7,<h4=reg128#7,<mask25=reg128#1
# asm 2: vand >h4=q6,<h4=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<h0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<h0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >h1=q2,<h1=q2,<t=q7
vadd.i64 q2,q2,q7

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#4,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#4,<h1=reg128#3
# asm 2: vtrn.32 <h0=q3,<h1=q2
vtrn.32 q3,q2

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#4%bot,<h0=reg128#4%top
# asm 2: vtrn.32 <h0=d6,<h0=d7
vtrn.32 d6,d7

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#5,<h3=reg128#6
# asm 2: vtrn.32 <h2=q4,<h3=q5
vtrn.32 q4,q5

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#5%bot,<h2=reg128#5%top
# asm 2: vtrn.32 <h2=d8,<h2=d9
vtrn.32 d8,d9

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#7%bot,<h4=reg128#7%top
# asm 2: vtrn.32 <h4=d12,<h4=d13
vtrn.32 d12,d13

# qhasm: 2x _2h0 = h0 << 1
# asm 1: vshl.i64 >_2h0=reg128#3,<h0=reg128#4,#1
# asm 2: vshl.i64 >_2h0=q2,<h0=q3,#1
vshl.i64 q2,q3,#1

# qhasm: 2x _2h2 = h2 << 1
# asm 1: vshl.i64 >_2h2=reg128#6,<h2=reg128#5,#1
# asm 2: vshl.i64 >_2h2=q5,<h2=q4,#1
vshl.i64 q5,q4,#1

# qhasm: 2x _2h4 = h4 << 1
# asm 1: vshl.i64 >_2h4=reg128#8,<h4=reg128#7,#1
# asm 2: vshl.i64 >_2h4=q7,<h4=q6,#1
vshl.i64 q7,q6,#1

# qhasm: k0[0,1]  =   h0[0] unsigned*   h0[0]; k0[2,3]  =   h0[1] unsigned*   h0[1]		
# asm 1: vmull.u32 >k0=reg128#9,<h0=reg128#4%bot,<h0=reg128#4%bot
# asm 2: vmull.u32 >k0=q8,<h0=d6,<h0=d6
vmull.u32 q8,d6,d6

# qhasm: k2[0,1]  = _2h0[2] unsigned*   h0[2]; k2[2,3]  = _2h0[3] unsigned*   h0[3]		
# asm 1: vmull.u32 >k2=reg128#10,<_2h0=reg128#3%top,<h0=reg128#4%top
# asm 2: vmull.u32 >k2=q9,<_2h0=d5,<h0=d7
vmull.u32 q9,d5,d7

# qhasm: k4[0,1]  =   h2[0] unsigned*   h2[0]; k4[2,3]  =   h2[1] unsigned*   h2[1]		
# asm 1: vmull.u32 >k4=reg128#11,<h2=reg128#5%bot,<h2=reg128#5%bot
# asm 2: vmull.u32 >k4=q10,<h2=d8,<h2=d8
vmull.u32 q10,d8,d8

# qhasm: k1[0,1]  = _2h2[2] unsigned*   h2[2]; k1[2,3]  = _2h2[3] unsigned*   h2[3]		
# asm 1: vmull.u32 >k1=reg128#12,<_2h2=reg128#6%top,<h2=reg128#5%top
# asm 2: vmull.u32 >k1=q11,<_2h2=d11,<h2=d9
vmull.u32 q11,d11,d9

# qhasm: k3[0,1]  =   h4[0] unsigned*   h4[0]; k3[2,3]  =   h4[1] unsigned*   h4[1]		
# asm 1: vmull.u32 >k3=reg128#7,<h4=reg128#7%bot,<h4=reg128#7%bot
# asm 2: vmull.u32 >k3=q6,<h4=d12,<h4=d12
vmull.u32 q6,d12,d12

# qhasm: k1[0,1] += _2h0[2] unsigned*   h0[0]; k1[2,3] += _2h0[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k1=reg128#12,<_2h0=reg128#3%top,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k1=q11,<_2h0=d5,<h0=d6
vmlal.u32 q11,d5,d6

# qhasm: k2[0,1] += _2h2[0] unsigned*   h0[0]; k2[2,3] += _2h2[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k2=reg128#10,<_2h2=reg128#6%bot,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k2=q9,<_2h2=d10,<h0=d6
vmlal.u32 q9,d10,d6

# qhasm: k3[0,1] += _2h2[2] unsigned*   h0[0]; k3[2,3] += _2h2[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k3=reg128#7,<_2h2=reg128#6%top,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k3=q6,<_2h2=d11,<h0=d6
vmlal.u32 q6,d11,d6

# qhasm: k4[0,1] += _2h4[0] unsigned*   h0[0]; k4[2,3] += _2h4[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k4=reg128#11,<_2h4=reg128#8%bot,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k4=q10,<_2h4=d14,<h0=d6
vmlal.u32 q10,d14,d6

# qhasm: k0[0,1] += _2h4[0] unsigned* _2h0[2]; k0[2,3] += _2h4[1] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k0=reg128#9,<_2h4=reg128#8%bot,<_2h0=reg128#3%top
# asm 2: vmlal.u32 <k0=q8,<_2h4=d14,<_2h0=d5
vmlal.u32 q8,d14,d5

# qhasm: k4[0,1] += _2h2[2] unsigned* _2h0[2]; k4[2,3] += _2h2[3] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k4=reg128#11,<_2h2=reg128#6%top,<_2h0=reg128#3%top
# asm 2: vmlal.u32 <k4=q10,<_2h2=d11,<_2h0=d5
vmlal.u32 q10,d11,d5

# qhasm: k3[0,1] += _2h2[0] unsigned*   h0[2]; k3[2,3] += _2h2[1] unsigned*   h0[3]		
# asm 1: vmlal.u32 <k3=reg128#7,<_2h2=reg128#6%bot,<h0=reg128#4%top
# asm 2: vmlal.u32 <k3=q6,<_2h2=d10,<h0=d7
vmlal.u32 q6,d10,d7

# qhasm: k0[0,1] += _2h2[2] unsigned* _2h2[0]; k0[2,3] += _2h2[3] unsigned* _2h2[1]		
# asm 1: vmlal.u32 <k0=reg128#9,<_2h2=reg128#6%top,<_2h2=reg128#6%bot
# asm 2: vmlal.u32 <k0=q8,<_2h2=d11,<_2h2=d10
vmlal.u32 q8,d11,d10

# qhasm: k1[0,1] += _2h4[0] unsigned*   h2[0]; k1[2,3] += _2h4[1] unsigned*   h2[1]		
# asm 1: vmlal.u32 <k1=reg128#12,<_2h4=reg128#8%bot,<h2=reg128#5%bot
# asm 2: vmlal.u32 <k1=q11,<_2h4=d14,<h2=d8
vmlal.u32 q11,d14,d8

# qhasm: k2[0,1] += _2h4[0] unsigned* _2h2[2]; k2[2,3] += _2h4[1] unsigned* _2h2[3]		
# asm 1: vmlal.u32 <k2=reg128#10,<_2h4=reg128#8%bot,<_2h2=reg128#6%top
# asm 2: vmlal.u32 <k2=q9,<_2h4=d14,<_2h2=d11
vmlal.u32 q9,d14,d11

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<k0=reg128#9,#26
# asm 2: vshr.u64 >t=q2,<k0=q8,#26
vshr.u64 q2,q8,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#3,<k1=reg128#12,<t=reg128#3
# asm 2: vadd.i64 >k1=q2,<k1=q11,<t=q2
vadd.i64 q2,q11,q2

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#9,<mask26=reg128#2
# asm 2: vand >k0=q3,<k0=q8,<mask26=q1
vand q3,q8,q1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<k1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<k1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#5,<k2=reg128#10,<t=reg128#5
# asm 2: vadd.i64 >k2=q4,<k2=q9,<t=q4
vadd.i64 q4,q9,q4

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#3,<k1=reg128#3,<mask25=reg128#1
# asm 2: vand >k1=q2,<k1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<k2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<k2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#6,<k3=reg128#7,<t=reg128#6
# asm 2: vadd.i64 >k3=q5,<k3=q6,<t=q5
vadd.i64 q5,q6,q5

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#5,<k2=reg128#5,<mask26=reg128#2
# asm 2: vand >k2=q4,<k2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<k3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<k3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#7,<k4=reg128#11,<t=reg128#7
# asm 2: vadd.i64 >k4=q6,<k4=q10,<t=q6
vadd.i64 q6,q10,q6

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#6,<k3=reg128#6,<mask25=reg128#1
# asm 2: vand >k3=q5,<k3=q5,<mask25=q0
vand q5,q5,q0

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k4=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<k4=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >k0=q3,<k0=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#7,<k4=reg128#7,<mask25=reg128#1
# asm 2: vand >k4=q6,<k4=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<k0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<k0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#3,<k1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >k1=q2,<k1=q2,<t=q7
vadd.i64 q2,q2,q7

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#4,<mask26=reg128#2
# asm 2: vand >k0=q3,<k0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#4,<k1=reg128#3
# asm 2: vtrn.32 <k0=q3,<k1=q2
vtrn.32 q3,q2

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#4%bot,<k0=reg128#4%top
# asm 2: vtrn.32 <k0=d6,<k0=d7
vtrn.32 d6,d7

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#5,<k3=reg128#6
# asm 2: vtrn.32 <k2=q4,<k3=q5
vtrn.32 q4,q5

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#5%bot,<k2=reg128#5%top
# asm 2: vtrn.32 <k2=d8,<k2=d9
vtrn.32 d8,d9

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#7%bot,<k4=reg128#7%top
# asm 2: vtrn.32 <k4=d12,<k4=d13
vtrn.32 d12,d13

# qhasm: ptr1 -= 48				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#48
# asm 2: sub >ptr1=r2,<ptr1=r2,#48
sub r2,r2,#48

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#3%bot->a0=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d4->a0=d5},[<ptr1=r2,: 128]!
vld1.8 {d4-d5},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#6%bot->a1=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d10->a1=d11},[<ptr1=r2,: 128]!
vld1.8 {d10-d11},[r2,: 128]!

# qhasm: a2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a2=reg128#8%bot->a2=reg128#8%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a2=d14->a2=d15},[<ptr1=r2,: 128]!
vld1.8 {d14-d15},[r2,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#9,<a0=reg128#3,#1
# asm 2: vshl.i64 >_2a0=q8,<a0=q2,#1
vshl.i64 q8,q2,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#10,<a1=reg128#6,#1
# asm 2: vshl.i64 >_2a1=q9,<a1=q5,#1
vshl.i64 q9,q5,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#11,<a2=reg128#8,#1
# asm 2: vshl.i64 >_2a2=q10,<a2=q7,#1
vshl.i64 q10,q7,#1

# qhasm: h0[0,1]  = k0[0] unsigned*   a0[0]; h0[2,3]  = k0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#12,<k0=reg128#4%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h0=q11,<k0=d6,<a0=d4
vmull.u32 q11,d6,d4

# qhasm: h1[0,1]  = k0[2] unsigned*   a0[0]; h1[2,3]  = k0[3] unsigned*   a0[1]		
# asm 1: vmull.u32 >h1=reg128#13,<k0=reg128#4%top,<a0=reg128#3%bot
# asm 2: vmull.u32 >h1=q12,<k0=d7,<a0=d4
vmull.u32 q12,d7,d4

# qhasm: h2[0,1]  = k2[0] unsigned*   a0[0]; h2[2,3]  = k2[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h2=reg128#14,<k2=reg128#5%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h2=q13,<k2=d8,<a0=d4
vmull.u32 q13,d8,d4

# qhasm: h3[0,1]  = k2[2] unsigned*   a0[0]; h3[2,3]  = k2[3] unsigned*   a0[1]		
# asm 1: vmull.u32 >h3=reg128#15,<k2=reg128#5%top,<a0=reg128#3%bot
# asm 2: vmull.u32 >h3=q14,<k2=d9,<a0=d4
vmull.u32 q14,d9,d4

# qhasm: h4[0,1]  = k4[0] unsigned*   a0[0]; h4[2,3]  = k4[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h4=reg128#16,<k4=reg128#7%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h4=q15,<k4=d12,<a0=d4
vmull.u32 q15,d12,d4

# qhasm: h0[0,1] += k4[0] unsigned* _2a0[2]; h0[2,3] += k4[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k4=reg128#7%bot,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <h0=q11,<k4=d12,<_2a0=d17
vmlal.u32 q11,d12,d17

# qhasm: h1[0,1] += k0[0] unsigned*   a0[2]; h1[2,3] += k0[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k0=reg128#4%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <h1=q12,<k0=d6,<a0=d5
vmlal.u32 q12,d6,d5

# qhasm: h2[0,1] += k0[2] unsigned* _2a0[2]; h2[2,3] += k0[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#4%top,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <h2=q13,<k0=d7,<_2a0=d17
vmlal.u32 q13,d7,d17

# qhasm: h3[0,1] += k2[0] unsigned*   a0[2]; h3[2,3] += k2[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k2=reg128#5%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <h3=q14,<k2=d8,<a0=d5
vmlal.u32 q14,d8,d5

# qhasm: h4[0,1] += k2[2] unsigned* _2a0[2]; h4[2,3] += k2[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#5%top,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <h4=q15,<k2=d9,<_2a0=d17
vmlal.u32 q15,d9,d17

# qhasm: h0[0,1] += k2[2] unsigned* _2a1[0]; h0[2,3] += k2[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#5%top,<_2a1=reg128#10%bot
# asm 2: vmlal.u32 <h0=q11,<k2=d9,<_2a1=d18
vmlal.u32 q11,d9,d18

# qhasm: h1[0,1] += k4[0] unsigned*   a1[0]; h1[2,3] += k4[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<k4=reg128#7%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h1=q12,<k4=d12,<a1=d10
vmlal.u32 q12,d12,d10

# qhasm: h2[0,1] += k0[0] unsigned*   a1[0]; h2[2,3] += k0[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#4%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h2=q13,<k0=d6,<a1=d10
vmlal.u32 q13,d6,d10

# qhasm: h3[0,1] += k0[2] unsigned*   a1[0]; h3[2,3] += k0[3] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#4%top,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h3=q14,<k0=d7,<a1=d10
vmlal.u32 q14,d7,d10

# qhasm: h4[0,1] += k2[0] unsigned*   a1[0]; h4[2,3] += k2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#5%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h4=q15,<k2=d8,<a1=d10
vmlal.u32 q15,d8,d10

# qhasm: h0[0,1] += k2[0] unsigned* _2a1[2]; h0[2,3] += k2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#5%bot,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h0=q11,<k2=d8,<_2a1=d19
vmlal.u32 q11,d8,d19

# qhasm: h1[0,1] += k2[2] unsigned* _2a1[2]; h1[2,3] += k2[3] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#5%top,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h1=q12,<k2=d9,<_2a1=d19
vmlal.u32 q12,d9,d19

# qhasm: h2[0,1] += k4[0] unsigned* _2a1[2]; h2[2,3] += k4[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k4=reg128#7%bot,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h2=q13,<k4=d12,<_2a1=d19
vmlal.u32 q13,d12,d19

# qhasm: h3[0,1] += k0[0] unsigned*   a1[2]; h3[2,3] += k0[1] unsigned*   a1[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#4%bot,<a1=reg128#6%top
# asm 2: vmlal.u32 <h3=q14,<k0=d6,<a1=d11
vmlal.u32 q14,d6,d11

# qhasm: h4[0,1] += k0[2] unsigned* _2a1[2]; h4[2,3] += k0[3] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#4%top,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h4=q15,<k0=d7,<_2a1=d19
vmlal.u32 q15,d7,d19

# qhasm: h0[0,1] += k0[2] unsigned* _2a2[0]; h0[2,3] += k0[3] unsigned* _2a2[1]		
# asm 1: vmlal.u32 <h0=reg128#12,<k0=reg128#4%top,<_2a2=reg128#11%bot
# asm 2: vmlal.u32 <h0=q11,<k0=d7,<_2a2=d20
vmlal.u32 q11,d7,d20

# qhasm: h1[0,1] += k2[0] unsigned*   a2[0]; h1[2,3] += k2[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#5%bot,<a2=reg128#8%bot
# asm 2: vmlal.u32 <h1=q12,<k2=d8,<a2=d14
vmlal.u32 q12,d8,d14

# qhasm: h2[0,1] += k2[2] unsigned* _2a2[0]; h2[2,3] += k2[3] unsigned* _2a2[1]		
# asm 1: vmlal.u32 <h2=reg128#14,<k2=reg128#5%top,<_2a2=reg128#11%bot
# asm 2: vmlal.u32 <h2=q13,<k2=d9,<_2a2=d20
vmlal.u32 q13,d9,d20

# qhasm: h3[0,1] += k4[0] unsigned*   a2[0]; h3[2,3] += k4[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<k4=reg128#7%bot,<a2=reg128#8%bot
# asm 2: vmlal.u32 <h3=q14,<k4=d12,<a2=d14
vmlal.u32 q14,d12,d14

# qhasm: h4[0,1] += k0[0] unsigned*   a2[0]; h4[2,3] += k0[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#4%bot,<a2=reg128#8%bot
# asm 2: vmlal.u32 <h4=q15,<k0=d6,<a2=d14
vmlal.u32 q15,d6,d14

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<h0=reg128#12,#26
# asm 2: vshr.u64 >t=q2,<h0=q11,#26
vshr.u64 q2,q11,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#13,<t=reg128#3
# asm 2: vadd.i64 >h1=q2,<h1=q12,<t=q2
vadd.i64 q2,q12,q2

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#12,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q11,<mask26=q1
vand q3,q11,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<h1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<h1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#5,<h2=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h2=q4,<h2=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#3,<h1=reg128#3,<mask25=reg128#1
# asm 2: vand >h1=q2,<h1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<h2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<h2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#6,<h3=reg128#15,<t=reg128#6
# asm 2: vadd.i64 >h3=q5,<h3=q14,<t=q5
vadd.i64 q5,q14,q5

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#5,<h2=reg128#5,<mask26=reg128#2
# asm 2: vand >h2=q4,<h2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<h3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<h3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#7,<h4=reg128#16,<t=reg128#7
# asm 2: vadd.i64 >h4=q6,<h4=q15,<t=q6
vadd.i64 q6,q15,q6

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
# asm 1: vand >h4=reg128#7,<h4=reg128#7,<mask25=reg128#1
# asm 2: vand >h4=q6,<h4=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<h0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<h0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >h1=q2,<h1=q2,<t=q7
vadd.i64 q2,q2,q7

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#4,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#4,<h1=reg128#3
# asm 2: vtrn.32 <h0=q3,<h1=q2
vtrn.32 q3,q2

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#4%bot,<h0=reg128#4%top
# asm 2: vtrn.32 <h0=d6,<h0=d7
vtrn.32 d6,d7

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#5,<h3=reg128#6
# asm 2: vtrn.32 <h2=q4,<h3=q5
vtrn.32 q4,q5

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#5%bot,<h2=reg128#5%top
# asm 2: vtrn.32 <h2=d8,<h2=d9
vtrn.32 d8,d9

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#7%bot,<h4=reg128#7%top
# asm 2: vtrn.32 <h4=d12,<h4=d13
vtrn.32 d12,d13

# qhasm: 2x _2h0 = h0 << 1
# asm 1: vshl.i64 >_2h0=reg128#3,<h0=reg128#4,#1
# asm 2: vshl.i64 >_2h0=q2,<h0=q3,#1
vshl.i64 q2,q3,#1

# qhasm: 2x _2h2 = h2 << 1
# asm 1: vshl.i64 >_2h2=reg128#6,<h2=reg128#5,#1
# asm 2: vshl.i64 >_2h2=q5,<h2=q4,#1
vshl.i64 q5,q4,#1

# qhasm: 2x _2h4 = h4 << 1
# asm 1: vshl.i64 >_2h4=reg128#8,<h4=reg128#7,#1
# asm 2: vshl.i64 >_2h4=q7,<h4=q6,#1
vshl.i64 q7,q6,#1

# qhasm: k0[0,1]  =   h0[0] unsigned*   h0[0]; k0[2,3]  =   h0[1] unsigned*   h0[1]		
# asm 1: vmull.u32 >k0=reg128#9,<h0=reg128#4%bot,<h0=reg128#4%bot
# asm 2: vmull.u32 >k0=q8,<h0=d6,<h0=d6
vmull.u32 q8,d6,d6

# qhasm: k2[0,1]  = _2h0[2] unsigned*   h0[2]; k2[2,3]  = _2h0[3] unsigned*   h0[3]		
# asm 1: vmull.u32 >k2=reg128#10,<_2h0=reg128#3%top,<h0=reg128#4%top
# asm 2: vmull.u32 >k2=q9,<_2h0=d5,<h0=d7
vmull.u32 q9,d5,d7

# qhasm: k4[0,1]  =   h2[0] unsigned*   h2[0]; k4[2,3]  =   h2[1] unsigned*   h2[1]		
# asm 1: vmull.u32 >k4=reg128#11,<h2=reg128#5%bot,<h2=reg128#5%bot
# asm 2: vmull.u32 >k4=q10,<h2=d8,<h2=d8
vmull.u32 q10,d8,d8

# qhasm: k1[0,1]  = _2h2[2] unsigned*   h2[2]; k1[2,3]  = _2h2[3] unsigned*   h2[3]		
# asm 1: vmull.u32 >k1=reg128#12,<_2h2=reg128#6%top,<h2=reg128#5%top
# asm 2: vmull.u32 >k1=q11,<_2h2=d11,<h2=d9
vmull.u32 q11,d11,d9

# qhasm: k3[0,1]  =   h4[0] unsigned*   h4[0]; k3[2,3]  =   h4[1] unsigned*   h4[1]		
# asm 1: vmull.u32 >k3=reg128#7,<h4=reg128#7%bot,<h4=reg128#7%bot
# asm 2: vmull.u32 >k3=q6,<h4=d12,<h4=d12
vmull.u32 q6,d12,d12

# qhasm: k1[0,1] += _2h0[2] unsigned*   h0[0]; k1[2,3] += _2h0[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k1=reg128#12,<_2h0=reg128#3%top,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k1=q11,<_2h0=d5,<h0=d6
vmlal.u32 q11,d5,d6

# qhasm: k2[0,1] += _2h2[0] unsigned*   h0[0]; k2[2,3] += _2h2[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k2=reg128#10,<_2h2=reg128#6%bot,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k2=q9,<_2h2=d10,<h0=d6
vmlal.u32 q9,d10,d6

# qhasm: k3[0,1] += _2h2[2] unsigned*   h0[0]; k3[2,3] += _2h2[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k3=reg128#7,<_2h2=reg128#6%top,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k3=q6,<_2h2=d11,<h0=d6
vmlal.u32 q6,d11,d6

# qhasm: k4[0,1] += _2h4[0] unsigned*   h0[0]; k4[2,3] += _2h4[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k4=reg128#11,<_2h4=reg128#8%bot,<h0=reg128#4%bot
# asm 2: vmlal.u32 <k4=q10,<_2h4=d14,<h0=d6
vmlal.u32 q10,d14,d6

# qhasm: k0[0,1] += _2h4[0] unsigned* _2h0[2]; k0[2,3] += _2h4[1] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k0=reg128#9,<_2h4=reg128#8%bot,<_2h0=reg128#3%top
# asm 2: vmlal.u32 <k0=q8,<_2h4=d14,<_2h0=d5
vmlal.u32 q8,d14,d5

# qhasm: k4[0,1] += _2h2[2] unsigned* _2h0[2]; k4[2,3] += _2h2[3] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k4=reg128#11,<_2h2=reg128#6%top,<_2h0=reg128#3%top
# asm 2: vmlal.u32 <k4=q10,<_2h2=d11,<_2h0=d5
vmlal.u32 q10,d11,d5

# qhasm: k3[0,1] += _2h2[0] unsigned*   h0[2]; k3[2,3] += _2h2[1] unsigned*   h0[3]		
# asm 1: vmlal.u32 <k3=reg128#7,<_2h2=reg128#6%bot,<h0=reg128#4%top
# asm 2: vmlal.u32 <k3=q6,<_2h2=d10,<h0=d7
vmlal.u32 q6,d10,d7

# qhasm: k0[0,1] += _2h2[2] unsigned* _2h2[0]; k0[2,3] += _2h2[3] unsigned* _2h2[1]		
# asm 1: vmlal.u32 <k0=reg128#9,<_2h2=reg128#6%top,<_2h2=reg128#6%bot
# asm 2: vmlal.u32 <k0=q8,<_2h2=d11,<_2h2=d10
vmlal.u32 q8,d11,d10

# qhasm: k1[0,1] += _2h4[0] unsigned*   h2[0]; k1[2,3] += _2h4[1] unsigned*   h2[1]		
# asm 1: vmlal.u32 <k1=reg128#12,<_2h4=reg128#8%bot,<h2=reg128#5%bot
# asm 2: vmlal.u32 <k1=q11,<_2h4=d14,<h2=d8
vmlal.u32 q11,d14,d8

# qhasm: k2[0,1] += _2h4[0] unsigned* _2h2[2]; k2[2,3] += _2h4[1] unsigned* _2h2[3]		
# asm 1: vmlal.u32 <k2=reg128#10,<_2h4=reg128#8%bot,<_2h2=reg128#6%top
# asm 2: vmlal.u32 <k2=q9,<_2h4=d14,<_2h2=d11
vmlal.u32 q9,d14,d11

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<k0=reg128#9,#26
# asm 2: vshr.u64 >t=q2,<k0=q8,#26
vshr.u64 q2,q8,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#3,<k1=reg128#12,<t=reg128#3
# asm 2: vadd.i64 >k1=q2,<k1=q11,<t=q2
vadd.i64 q2,q11,q2

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#9,<mask26=reg128#2
# asm 2: vand >k0=q3,<k0=q8,<mask26=q1
vand q3,q8,q1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<k1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<k1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#5,<k2=reg128#10,<t=reg128#5
# asm 2: vadd.i64 >k2=q4,<k2=q9,<t=q4
vadd.i64 q4,q9,q4

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#3,<k1=reg128#3,<mask25=reg128#1
# asm 2: vand >k1=q2,<k1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<k2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<k2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#6,<k3=reg128#7,<t=reg128#6
# asm 2: vadd.i64 >k3=q5,<k3=q6,<t=q5
vadd.i64 q5,q6,q5

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#5,<k2=reg128#5,<mask26=reg128#2
# asm 2: vand >k2=q4,<k2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<k3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<k3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#7,<k4=reg128#11,<t=reg128#7
# asm 2: vadd.i64 >k4=q6,<k4=q10,<t=q6
vadd.i64 q6,q10,q6

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#6,<k3=reg128#6,<mask25=reg128#1
# asm 2: vand >k3=q5,<k3=q5,<mask25=q0
vand q5,q5,q0

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k4=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<k4=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >k0=q3,<k0=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#7,<k4=reg128#7,<mask25=reg128#1
# asm 2: vand >k4=q6,<k4=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<k0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<k0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#3,<k1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >k1=q2,<k1=q2,<t=q7
vadd.i64 q2,q2,q7

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#4,<mask26=reg128#2
# asm 2: vand >k0=q3,<k0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#4,<k1=reg128#3
# asm 2: vtrn.32 <k0=q3,<k1=q2
vtrn.32 q3,q2

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#4%bot,<k0=reg128#4%top
# asm 2: vtrn.32 <k0=d6,<k0=d7
vtrn.32 d6,d7

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#5,<k3=reg128#6
# asm 2: vtrn.32 <k2=q4,<k3=q5
vtrn.32 q4,q5

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#5%bot,<k2=reg128#5%top
# asm 2: vtrn.32 <k2=d8,<k2=d9
vtrn.32 d8,d9

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#7%bot,<k4=reg128#7%top
# asm 2: vtrn.32 <k4=d12,<k4=d13
vtrn.32 d12,d13

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#4,<input_1=int32#2
# asm 2: mov >adr1=r3,<input_1=r1
mov r3,r1

# qhasm: a0 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a0=reg128#3%bot->a0=reg128#3%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a0=d4->a0=d5},[<adr1=r3,: 128]!
vld1.8 {d4-d5},[r3,: 128]!

# qhasm: a1 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a1=reg128#6%bot->a1=reg128#6%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a1=d10->a1=d11},[<adr1=r3,: 128]!
vld1.8 {d10-d11},[r3,: 128]!

# qhasm: a2 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a2=reg128#8%bot->a2=reg128#8%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a2=d14->a2=d15},[<adr1=r3,: 128]!
vld1.8 {d14-d15},[r3,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#9,<a0=reg128#3,#1
# asm 2: vshl.i64 >_2a0=q8,<a0=q2,#1
vshl.i64 q8,q2,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#10,<a1=reg128#6,#1
# asm 2: vshl.i64 >_2a1=q9,<a1=q5,#1
vshl.i64 q9,q5,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#11,<a2=reg128#8,#1
# asm 2: vshl.i64 >_2a2=q10,<a2=q7,#1
vshl.i64 q10,q7,#1

# qhasm: h0[0,1]  = k0[0] unsigned*   a0[0]; h0[2,3]  = k0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#12,<k0=reg128#4%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h0=q11,<k0=d6,<a0=d4
vmull.u32 q11,d6,d4

# qhasm: h1[0,1]  = k0[2] unsigned*   a0[0]; h1[2,3]  = k0[3] unsigned*   a0[1]		
# asm 1: vmull.u32 >h1=reg128#13,<k0=reg128#4%top,<a0=reg128#3%bot
# asm 2: vmull.u32 >h1=q12,<k0=d7,<a0=d4
vmull.u32 q12,d7,d4

# qhasm: h2[0,1]  = k2[0] unsigned*   a0[0]; h2[2,3]  = k2[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h2=reg128#14,<k2=reg128#5%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h2=q13,<k2=d8,<a0=d4
vmull.u32 q13,d8,d4

# qhasm: h3[0,1]  = k2[2] unsigned*   a0[0]; h3[2,3]  = k2[3] unsigned*   a0[1]		
# asm 1: vmull.u32 >h3=reg128#15,<k2=reg128#5%top,<a0=reg128#3%bot
# asm 2: vmull.u32 >h3=q14,<k2=d9,<a0=d4
vmull.u32 q14,d9,d4

# qhasm: h4[0,1]  = k4[0] unsigned*   a0[0]; h4[2,3]  = k4[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h4=reg128#16,<k4=reg128#7%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >h4=q15,<k4=d12,<a0=d4
vmull.u32 q15,d12,d4

# qhasm: h0[0,1] += k4[0] unsigned* _2a0[2]; h0[2,3] += k4[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k4=reg128#7%bot,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <h0=q11,<k4=d12,<_2a0=d17
vmlal.u32 q11,d12,d17

# qhasm: h1[0,1] += k0[0] unsigned*   a0[2]; h1[2,3] += k0[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k0=reg128#4%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <h1=q12,<k0=d6,<a0=d5
vmlal.u32 q12,d6,d5

# qhasm: h2[0,1] += k0[2] unsigned* _2a0[2]; h2[2,3] += k0[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#4%top,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <h2=q13,<k0=d7,<_2a0=d17
vmlal.u32 q13,d7,d17

# qhasm: h3[0,1] += k2[0] unsigned*   a0[2]; h3[2,3] += k2[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k2=reg128#5%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <h3=q14,<k2=d8,<a0=d5
vmlal.u32 q14,d8,d5

# qhasm: h4[0,1] += k2[2] unsigned* _2a0[2]; h4[2,3] += k2[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#5%top,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <h4=q15,<k2=d9,<_2a0=d17
vmlal.u32 q15,d9,d17

# qhasm: h0[0,1] += k2[2] unsigned* _2a1[0]; h0[2,3] += k2[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#5%top,<_2a1=reg128#10%bot
# asm 2: vmlal.u32 <h0=q11,<k2=d9,<_2a1=d18
vmlal.u32 q11,d9,d18

# qhasm: h1[0,1] += k4[0] unsigned*   a1[0]; h1[2,3] += k4[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<k4=reg128#7%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h1=q12,<k4=d12,<a1=d10
vmlal.u32 q12,d12,d10

# qhasm: h2[0,1] += k0[0] unsigned*   a1[0]; h2[2,3] += k0[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#4%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h2=q13,<k0=d6,<a1=d10
vmlal.u32 q13,d6,d10

# qhasm: h3[0,1] += k0[2] unsigned*   a1[0]; h3[2,3] += k0[3] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#4%top,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h3=q14,<k0=d7,<a1=d10
vmlal.u32 q14,d7,d10

# qhasm: h4[0,1] += k2[0] unsigned*   a1[0]; h4[2,3] += k2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#5%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h4=q15,<k2=d8,<a1=d10
vmlal.u32 q15,d8,d10

# qhasm: h0[0,1] += k2[0] unsigned* _2a1[2]; h0[2,3] += k2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#5%bot,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h0=q11,<k2=d8,<_2a1=d19
vmlal.u32 q11,d8,d19

# qhasm: h1[0,1] += k2[2] unsigned* _2a1[2]; h1[2,3] += k2[3] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#5%top,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h1=q12,<k2=d9,<_2a1=d19
vmlal.u32 q12,d9,d19

# qhasm: h2[0,1] += k4[0] unsigned* _2a1[2]; h2[2,3] += k4[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k4=reg128#7%bot,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h2=q13,<k4=d12,<_2a1=d19
vmlal.u32 q13,d12,d19

# qhasm: h3[0,1] += k0[0] unsigned*   a1[2]; h3[2,3] += k0[1] unsigned*   a1[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#4%bot,<a1=reg128#6%top
# asm 2: vmlal.u32 <h3=q14,<k0=d6,<a1=d11
vmlal.u32 q14,d6,d11

# qhasm: h4[0,1] += k0[2] unsigned* _2a1[2]; h4[2,3] += k0[3] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#4%top,<_2a1=reg128#10%top
# asm 2: vmlal.u32 <h4=q15,<k0=d7,<_2a1=d19
vmlal.u32 q15,d7,d19

# qhasm: h0[0,1] += k0[2] unsigned* _2a2[0]; h0[2,3] += k0[3] unsigned* _2a2[1]		
# asm 1: vmlal.u32 <h0=reg128#12,<k0=reg128#4%top,<_2a2=reg128#11%bot
# asm 2: vmlal.u32 <h0=q11,<k0=d7,<_2a2=d20
vmlal.u32 q11,d7,d20

# qhasm: h1[0,1] += k2[0] unsigned*   a2[0]; h1[2,3] += k2[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#5%bot,<a2=reg128#8%bot
# asm 2: vmlal.u32 <h1=q12,<k2=d8,<a2=d14
vmlal.u32 q12,d8,d14

# qhasm: h2[0,1] += k2[2] unsigned* _2a2[0]; h2[2,3] += k2[3] unsigned* _2a2[1]		
# asm 1: vmlal.u32 <h2=reg128#14,<k2=reg128#5%top,<_2a2=reg128#11%bot
# asm 2: vmlal.u32 <h2=q13,<k2=d9,<_2a2=d20
vmlal.u32 q13,d9,d20

# qhasm: h3[0,1] += k4[0] unsigned*   a2[0]; h3[2,3] += k4[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<k4=reg128#7%bot,<a2=reg128#8%bot
# asm 2: vmlal.u32 <h3=q14,<k4=d12,<a2=d14
vmlal.u32 q14,d12,d14

# qhasm: h4[0,1] += k0[0] unsigned*   a2[0]; h4[2,3] += k0[1] unsigned*   a2[1]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#4%bot,<a2=reg128#8%bot
# asm 2: vmlal.u32 <h4=q15,<k0=d6,<a2=d14
vmlal.u32 q15,d6,d14

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<h0=reg128#12,#26
# asm 2: vshr.u64 >t=q2,<h0=q11,#26
vshr.u64 q2,q11,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#13,<t=reg128#3
# asm 2: vadd.i64 >h1=q2,<h1=q12,<t=q2
vadd.i64 q2,q12,q2

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#12,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q11,<mask26=q1
vand q3,q11,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#5,<h1=reg128#3,#25
# asm 2: vshr.u64 >t=q4,<h1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#5,<h2=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h2=q4,<h2=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#3,<h1=reg128#3,<mask25=reg128#1
# asm 2: vand >h1=q2,<h1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<h2=reg128#5,#26
# asm 2: vshr.u64 >t=q5,<h2=q4,#26
vshr.u64 q5,q4,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#6,<h3=reg128#15,<t=reg128#6
# asm 2: vadd.i64 >h3=q5,<h3=q14,<t=q5
vadd.i64 q5,q14,q5

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#5,<h2=reg128#5,<mask26=reg128#2
# asm 2: vand >h2=q4,<h2=q4,<mask26=q1
vand q4,q4,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<h3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<h3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#7,<h4=reg128#16,<t=reg128#7
# asm 2: vadd.i64 >h4=q6,<h4=q15,<t=q6
vadd.i64 q6,q15,q6

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
# asm 1: vand >h4=reg128#7,<h4=reg128#7,<mask25=reg128#1
# asm 2: vand >h4=q6,<h4=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<h0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<h0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >h1=q2,<h1=q2,<t=q7
vadd.i64 q2,q2,q7

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#4,<h0=reg128#4,<mask26=reg128#2
# asm 2: vand >h0=q3,<h0=q3,<mask26=q1
vand q3,q3,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#4,<h1=reg128#3
# asm 2: vtrn.32 <h0=q3,<h1=q2
vtrn.32 q3,q2

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#4%bot,<h0=reg128#4%top
# asm 2: vtrn.32 <h0=d6,<h0=d7
vtrn.32 d6,d7

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#5,<h3=reg128#6
# asm 2: vtrn.32 <h2=q4,<h3=q5
vtrn.32 q4,q5

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#5%bot,<h2=reg128#5%top
# asm 2: vtrn.32 <h2=d8,<h2=d9
vtrn.32 d8,d9

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#7%bot,<h4=reg128#7%top
# asm 2: vtrn.32 <h4=d12,<h4=d13
vtrn.32 d12,d13

# qhasm: ptr1 -= 48				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#48
# asm 2: sub >ptr1=r2,<ptr1=r2,#48
sub r2,r2,#48

# qhasm: mem128[ptr1] aligned = h0; ptr1+=16	
# asm 1: vst1.8 {<h0=reg128#4%bot-<h0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<h0=d6-<h0=d7},[<ptr1=r2,: 128]!
vst1.8 {d6-d7},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = h2; ptr1+=16	
# asm 1: vst1.8 {<h2=reg128#5%bot-<h2=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<h2=d8-<h2=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = h4; ptr1+=16	
# asm 1: vst1.8 {<h4=reg128#7%bot-<h4=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<h4=d12-<h4=d13},[<ptr1=r2,: 128]!
vst1.8 {d12-d13},[r2,: 128]!

# qhasm: s4 = h4
# asm 1: vmov >s4=reg128#3,<h4=reg128#7
# asm 2: vmov >s4=q2,<h4=q6
vmov q2,q6

# qhasm: adr1 = input_1 + 32
# asm 1: add >adr1=int32#4,<input_1=int32#2,#32
# asm 2: add >adr1=r3,<input_1=r1,#32
add r3,r1,#32

# qhasm: a2 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a2=reg128#4%bot->a2=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a2=d6->a2=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#5%bot->a3=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d8->a3=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#6%bot->a4=reg128#6%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d10->a4=d11},[<adr1=r3,: 128]!
vld1.8 {d10-d11},[r3,: 128]!

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#7,<a2=reg128#4,#1
# asm 2: vshl.i64 >_2a2=q6,<a2=q3,#1
vshl.i64 q6,q3,#1

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#10,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q9,<a3=d8,<a3=d8
vmull.u32 q9,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#11,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q10,<_2a3=d15,<a3=d9
vmull.u32 q10,d15,d9

# qhasm: h4[0,1]  =   a4[0] unsigned*   a4[0]; h4[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h4=reg128#12,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h4=q11,<a4=d10,<a4=d10
vmull.u32 q11,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#13,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q12,<_2a4=d17,<a4=d11
vmull.u32 q12,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#14,<a2=reg128#4%top,<a2=reg128#4%top
# asm 2: vmull.u32 >h3=q13,<a2=d7,<a2=d7
vmull.u32 q13,d7,d7

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q12,<_2a3=d15,<a3=d8
vmlal.u32 q12,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#11,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q10,<_2a4=d16,<a3=d8
vmlal.u32 q10,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#14,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q13,<_2a4=d17,<a3=d8
vmlal.u32 q13,d17,d8

# qhasm: h4[0,1] += _2a2[2] unsigned*   a3[0]; h4[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h4=reg128#12,<_2a2=reg128#7%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h4=q11,<_2a2=d13,<a3=d8
vmlal.u32 q11,d13,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#10,<_2a2=reg128#7%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q9,<_2a2=d13,<_2a3=d15
vmlal.u32 q9,d13,d15

# qhasm: h4[0,1] += _2a4[2] unsigned* _2a3[2]; h4[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h4=reg128#12,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h4=q11,<_2a4=d17,<_2a3=d15
vmlal.u32 q11,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#14,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q13,<_2a4=d16,<a3=d9
vmlal.u32 q13,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#10,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q9,<_2a4=d17,<_2a4=d16
vmlal.u32 q9,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<_2a2=reg128#7%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q12,<_2a2=d13,<a4=d10
vmlal.u32 q12,d13,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#11,<_2a2=reg128#7%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q10,<_2a2=d13,<_2a4=d17
vmlal.u32 q10,d13,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#15,<h0=reg128#10,#26
# asm 2: vshr.u64 >t=q14,<h0=q9,#26
vshr.u64 q14,q9,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#13,<h1=reg128#13,<t=reg128#15
# asm 2: vadd.i64 >h1=q12,<h1=q12,<t=q14
vadd.i64 q12,q12,q14

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#10,<h0=reg128#10,<mask26=reg128#2
# asm 2: vand >h0=q9,<h0=q9,<mask26=q1
vand q9,q9,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#15,<h1=reg128#13,#25
# asm 2: vshr.u64 >t=q14,<h1=q12,#25
vshr.u64 q14,q12,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#11,<h2=reg128#11,<t=reg128#15
# asm 2: vadd.i64 >h2=q10,<h2=q10,<t=q14
vadd.i64 q10,q10,q14

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#13,<h1=reg128#13,<mask25=reg128#1
# asm 2: vand >h1=q12,<h1=q12,<mask25=q0
vand q12,q12,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#15,<h2=reg128#11,#26
# asm 2: vshr.u64 >t=q14,<h2=q10,#26
vshr.u64 q14,q10,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#14,<h3=reg128#14,<t=reg128#15
# asm 2: vadd.i64 >h3=q13,<h3=q13,<t=q14
vadd.i64 q13,q13,q14

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#11,<h2=reg128#11,<mask26=reg128#2
# asm 2: vand >h2=q10,<h2=q10,<mask26=q1
vand q10,q10,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#15,<h3=reg128#14,#25
# asm 2: vshr.u64 >t=q14,<h3=q13,#25
vshr.u64 q14,q13,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#12,<h4=reg128#12,<t=reg128#15
# asm 2: vadd.i64 >h4=q11,<h4=q11,<t=q14
vadd.i64 q11,q11,q14

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#14,<h3=reg128#14,<mask25=reg128#1
# asm 2: vand >h3=q13,<h3=q13,<mask25=q0
vand q13,q13,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#15,<h4=reg128#12,#25
# asm 2: vshr.u64 >t=q14,<h4=q11,#25
vshr.u64 q14,q11,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#10,<h0=reg128#10,<t=reg128#15
# asm 2: vadd.i64 >h0=q9,<h0=q9,<t=q14
vadd.i64 q9,q9,q14

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#1,<h4=reg128#12,<mask25=reg128#1
# asm 2: vand >h4=q0,<h4=q11,<mask25=q0
vand q0,q11,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#10,#26
# asm 2: vshr.u64 >t=q11,<h0=q9,#26
vshr.u64 q11,q9,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#12,<h1=reg128#13,<t=reg128#12
# asm 2: vadd.i64 >h1=q11,<h1=q12,<t=q11
vadd.i64 q11,q12,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#10,<h0=reg128#10,<mask26=reg128#2
# asm 2: vand >h0=q9,<h0=q9,<mask26=q1
vand q9,q9,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#10,<h1=reg128#12
# asm 2: vtrn.32 <h0=q9,<h1=q11
vtrn.32 q9,q11

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#10%bot,<h0=reg128#10%top
# asm 2: vtrn.32 <h0=d18,<h0=d19
vtrn.32 d18,d19

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#11,<h3=reg128#14
# asm 2: vtrn.32 <h2=q10,<h3=q13
vtrn.32 q10,q13

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#11%bot,<h2=reg128#11%top
# asm 2: vtrn.32 <h2=d20,<h2=d21
vtrn.32 d20,d21

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#1%bot,<h4=reg128#1%top
# asm 2: vtrn.32 <h4=d0,<h4=d1
vtrn.32 d0,d1

# qhasm: k0[0,1]  = h0[0] unsigned*   a3[0]; k0[2,3]  = h0[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >k0=reg128#12,<h0=reg128#10%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >k0=q11,<h0=d18,<a3=d8
vmull.u32 q11,d18,d8

# qhasm: k1[0,1]  = h0[2] unsigned*   a3[0]; k1[2,3]  = h0[3] unsigned*   a3[1]		
# asm 1: vmull.u32 >k1=reg128#13,<h0=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmull.u32 >k1=q12,<h0=d19,<a3=d8
vmull.u32 q12,d19,d8

# qhasm: k2[0,1]  = h2[0] unsigned*   a3[0]; k2[2,3]  = h2[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >k2=reg128#14,<h2=reg128#11%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >k2=q13,<h2=d20,<a3=d8
vmull.u32 q13,d20,d8

# qhasm: k3[0,1]  = h2[2] unsigned*   a3[0]; k3[2,3]  = h2[3] unsigned*   a3[1]		
# asm 1: vmull.u32 >k3=reg128#15,<h2=reg128#11%top,<a3=reg128#5%bot
# asm 2: vmull.u32 >k3=q14,<h2=d21,<a3=d8
vmull.u32 q14,d21,d8

# qhasm: k4[0,1]  = h4[0] unsigned*   a3[0]; k4[2,3]  = h4[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >k4=reg128#16,<h4=reg128#1%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >k4=q15,<h4=d0,<a3=d8
vmull.u32 q15,d0,d8

# qhasm: k0[0,1] += h4[0] unsigned* _2a3[2]; k0[2,3] += h4[1] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <k0=reg128#12,<h4=reg128#1%bot,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <k0=q11,<h4=d0,<_2a3=d15
vmlal.u32 q11,d0,d15

# qhasm: k1[0,1] += h0[0] unsigned*   a3[2]; k1[2,3] += h0[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <k1=reg128#13,<h0=reg128#10%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <k1=q12,<h0=d18,<a3=d9
vmlal.u32 q12,d18,d9

# qhasm: k2[0,1] += h0[2] unsigned* _2a3[2]; k2[2,3] += h0[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <k2=reg128#14,<h0=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <k2=q13,<h0=d19,<_2a3=d15
vmlal.u32 q13,d19,d15

# qhasm: k3[0,1] += h2[0] unsigned*   a3[2]; k3[2,3] += h2[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <k3=reg128#15,<h2=reg128#11%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <k3=q14,<h2=d20,<a3=d9
vmlal.u32 q14,d20,d9

# qhasm: k4[0,1] += h2[2] unsigned* _2a3[2]; k4[2,3] += h2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <k4=reg128#16,<h2=reg128#11%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <k4=q15,<h2=d21,<_2a3=d15
vmlal.u32 q15,d21,d15

# qhasm: k0[0,1] += h2[2] unsigned* _2a4[0]; k0[2,3] += h2[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <k0=reg128#12,<h2=reg128#11%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <k0=q11,<h2=d21,<_2a4=d16
vmlal.u32 q11,d21,d16

# qhasm: k1[0,1] += h4[0] unsigned*   a4[0]; k1[2,3] += h4[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<h4=reg128#1%bot,<a4=reg128#6%bot
# asm 2: vmlal.u32 <k1=q12,<h4=d0,<a4=d10
vmlal.u32 q12,d0,d10

# qhasm: k2[0,1] += h0[0] unsigned*   a4[0]; k2[2,3] += h0[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <k2=reg128#14,<h0=reg128#10%bot,<a4=reg128#6%bot
# asm 2: vmlal.u32 <k2=q13,<h0=d18,<a4=d10
vmlal.u32 q13,d18,d10

# qhasm: k3[0,1] += h0[2] unsigned*   a4[0]; k3[2,3] += h0[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <k3=reg128#15,<h0=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <k3=q14,<h0=d19,<a4=d10
vmlal.u32 q14,d19,d10

# qhasm: k4[0,1] += h2[0] unsigned*   a4[0]; k4[2,3] += h2[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <k4=reg128#16,<h2=reg128#11%bot,<a4=reg128#6%bot
# asm 2: vmlal.u32 <k4=q15,<h2=d20,<a4=d10
vmlal.u32 q15,d20,d10

# qhasm: k0[0,1] += h2[0] unsigned* _2a4[2]; k0[2,3] += h2[1] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <k0=reg128#12,<h2=reg128#11%bot,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <k0=q11,<h2=d20,<_2a4=d17
vmlal.u32 q11,d20,d17

# qhasm: k1[0,1] += h2[2] unsigned* _2a4[2]; k1[2,3] += h2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <k1=reg128#13,<h2=reg128#11%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <k1=q12,<h2=d21,<_2a4=d17
vmlal.u32 q12,d21,d17

# qhasm: k2[0,1] += h4[0] unsigned* _2a4[2]; k2[2,3] += h4[1] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <k2=reg128#14,<h4=reg128#1%bot,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <k2=q13,<h4=d0,<_2a4=d17
vmlal.u32 q13,d0,d17

# qhasm: k3[0,1] += h0[0] unsigned*   a4[2]; k3[2,3] += h0[1] unsigned*   a4[3]		
# asm 1: vmlal.u32 <k3=reg128#15,<h0=reg128#10%bot,<a4=reg128#6%top
# asm 2: vmlal.u32 <k3=q14,<h0=d18,<a4=d11
vmlal.u32 q14,d18,d11

# qhasm: k4[0,1] += h0[2] unsigned* _2a4[2]; k4[2,3] += h0[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <k4=reg128#16,<h0=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <k4=q15,<h0=d19,<_2a4=d17
vmlal.u32 q15,d19,d17

# qhasm: k0[0,1] += h0[2] unsigned* _2a2[2]; k0[2,3] += h0[3] unsigned* _2a2[3]		
# asm 1: vmlal.u32 <k0=reg128#12,<h0=reg128#10%top,<_2a2=reg128#7%top
# asm 2: vmlal.u32 <k0=q11,<h0=d19,<_2a2=d13
vmlal.u32 q11,d19,d13

# qhasm: k1[0,1] += h2[0] unsigned*   a2[2]; k1[2,3] += h2[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <k1=reg128#13,<h2=reg128#11%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <k1=q12,<h2=d20,<a2=d7
vmlal.u32 q12,d20,d7

# qhasm: k2[0,1] += h2[2] unsigned* _2a2[2]; k2[2,3] += h2[3] unsigned* _2a2[3]		
# asm 1: vmlal.u32 <k2=reg128#14,<h2=reg128#11%top,<_2a2=reg128#7%top
# asm 2: vmlal.u32 <k2=q13,<h2=d21,<_2a2=d13
vmlal.u32 q13,d21,d13

# qhasm: k3[0,1] += h4[0] unsigned*   a2[2]; k3[2,3] += h4[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <k3=reg128#15,<h4=reg128#1%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <k3=q14,<h4=d0,<a2=d7
vmlal.u32 q14,d0,d7

# qhasm: k4[0,1] += h0[0] unsigned*   a2[2]; k4[2,3] += h0[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <k4=reg128#16,<h0=reg128#10%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <k4=q15,<h0=d18,<a2=d7
vmlal.u32 q15,d18,d7

# qhasm: ptr1 -= 64			
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#64
# asm 2: sub >ptr1=r2,<ptr1=r2,#64
sub r2,r2,#64

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<k0=reg128#12,#26
# asm 2: vshr.u64 >t=q3,<k0=q11,#26
vshr.u64 q3,q11,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >k1=q3,<k1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#12,<mask26=reg128#2
# asm 2: vand >k0=q4,<k0=q11,<mask26=q1
vand q4,q11,q1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<k1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<k1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#6,<k2=reg128#14,<t=reg128#6
# asm 2: vadd.i64 >k2=q5,<k2=q13,<t=q5
vadd.i64 q5,q13,q5

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#4,<k1=reg128#4,<mask25=reg128#1
# asm 2: vand >k1=q3,<k1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<k2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<k2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#7,<k3=reg128#15,<t=reg128#7
# asm 2: vadd.i64 >k3=q6,<k3=q14,<t=q6
vadd.i64 q6,q14,q6

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#6,<k2=reg128#6,<mask26=reg128#2
# asm 2: vand >k2=q5,<k2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<k3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#8,<k4=reg128#16,<t=reg128#8
# asm 2: vadd.i64 >k4=q7,<k4=q15,<t=q7
vadd.i64 q7,q15,q7

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#7,<k3=reg128#7,<mask25=reg128#1
# asm 2: vand >k3=q6,<k3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<k4=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<k4=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#5,<k0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >k0=q4,<k0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#8,<k4=reg128#8,<mask25=reg128#1
# asm 2: vand >k4=q7,<k4=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<k0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<k0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >k1=q3,<k1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#5,<mask26=reg128#2
# asm 2: vand >k0=q4,<k0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#5,<k1=reg128#4
# asm 2: vtrn.32 <k0=q4,<k1=q3
vtrn.32 q4,q3

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#5%bot,<k0=reg128#5%top
# asm 2: vtrn.32 <k0=d8,<k0=d9
vtrn.32 d8,d9

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#6,<k3=reg128#7
# asm 2: vtrn.32 <k2=q5,<k3=q6
vtrn.32 q5,q6

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#6%bot,<k2=reg128#6%top
# asm 2: vtrn.32 <k2=d10,<k2=d11
vtrn.32 d10,d11

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#8%bot,<k4=reg128#8%top
# asm 2: vtrn.32 <k4=d14,<k4=d15
vtrn.32 d14,d15

# qhasm: ptr1 += 96				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#96
# asm 2: add >ptr1=r2,<ptr1=r2,#96
add r2,r2,#96

# qhasm: mem128[ptr1] aligned = k0; ptr1+=16	
# asm 1: vst1.8 {<k0=reg128#5%bot-<k0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<k0=d8-<k0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = k2; ptr1+=16	
# asm 1: vst1.8 {<k2=reg128#6%bot-<k2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<k2=d10-<k2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: k1 aligned = mem128[ptr1]
# asm 1: vld1.8 {>k1=reg128#4%bot->k1=reg128#4%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>k1=d6->k1=d7},[<ptr1=r2,: 128]
vld1.8 {d6-d7},[r2,: 128]

# qhasm: k1 = k1[0]k4[0]
# asm 1: vmov <k1=reg128#4%top,<k4=reg128#8%bot
# asm 2: vmov <k1=d7,<k4=d14
vmov d7,d14

# qhasm: ptr1 += 80				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: add >ptr1=r2,<ptr1=r2,#80
add r2,r2,#80

# qhasm: mem128[ptr1] aligned = k1
# asm 1: vst1.8 {<k1=reg128#4%bot-<k1=reg128#4%top},[<ptr1=int32#3,: 128]
# asm 2: vst1.8 {<k1=d6-<k1=d7},[<ptr1=r2,: 128]
vst1.8 {d6-d7},[r2,: 128]

# qhasm: 2x _2k0 = k0 << 1
# asm 1: vshl.i64 >_2k0=reg128#4,<k0=reg128#5,#1
# asm 2: vshl.i64 >_2k0=q3,<k0=q4,#1
vshl.i64 q3,q4,#1

# qhasm: 2x _2k2 = k2 << 1
# asm 1: vshl.i64 >_2k2=reg128#7,<k2=reg128#6,#1
# asm 2: vshl.i64 >_2k2=q6,<k2=q5,#1
vshl.i64 q6,q5,#1

# qhasm: 2x _2k4 = k4 << 1
# asm 1: vshl.i64 >_2k4=reg128#9,<k4=reg128#8,#1
# asm 2: vshl.i64 >_2k4=q8,<k4=q7,#1
vshl.i64 q8,q7,#1

# qhasm: h0[0,1]  =   k0[0] unsigned*   k0[0]; h0[2,3]  =   k0[1] unsigned*   k0[1]		
# asm 1: vmull.u32 >h0=reg128#10,<k0=reg128#5%bot,<k0=reg128#5%bot
# asm 2: vmull.u32 >h0=q9,<k0=d8,<k0=d8
vmull.u32 q9,d8,d8

# qhasm: h2[0,1]  = _2k0[2] unsigned*   k0[2]; h2[2,3]  = _2k0[3] unsigned*   k0[3]		
# asm 1: vmull.u32 >h2=reg128#11,<_2k0=reg128#4%top,<k0=reg128#5%top
# asm 2: vmull.u32 >h2=q10,<_2k0=d7,<k0=d9
vmull.u32 q10,d7,d9

# qhasm: h4[0,1]  =   k2[0] unsigned*   k2[0]; h4[2,3]  =   k2[1] unsigned*   k2[1]		
# asm 1: vmull.u32 >h4=reg128#12,<k2=reg128#6%bot,<k2=reg128#6%bot
# asm 2: vmull.u32 >h4=q11,<k2=d10,<k2=d10
vmull.u32 q11,d10,d10

# qhasm: h1[0,1]  = _2k2[2] unsigned*   k2[2]; h1[2,3]  = _2k2[3] unsigned*   k2[3]		
# asm 1: vmull.u32 >h1=reg128#13,<_2k2=reg128#7%top,<k2=reg128#6%top
# asm 2: vmull.u32 >h1=q12,<_2k2=d13,<k2=d11
vmull.u32 q12,d13,d11

# qhasm: h3[0,1]  =   k4[0] unsigned*   k4[0]; h3[2,3]  =   k4[1] unsigned*   k4[1]		
# asm 1: vmull.u32 >h3=reg128#8,<k4=reg128#8%bot,<k4=reg128#8%bot
# asm 2: vmull.u32 >h3=q7,<k4=d14,<k4=d14
vmull.u32 q7,d14,d14

# qhasm: h1[0,1] += _2k0[2] unsigned*   k0[0]; h1[2,3] += _2k0[3] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<_2k0=reg128#4%top,<k0=reg128#5%bot
# asm 2: vmlal.u32 <h1=q12,<_2k0=d7,<k0=d8
vmlal.u32 q12,d7,d8

# qhasm: h2[0,1] += _2k2[0] unsigned*   k0[0]; h2[2,3] += _2k2[1] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h2=reg128#11,<_2k2=reg128#7%bot,<k0=reg128#5%bot
# asm 2: vmlal.u32 <h2=q10,<_2k2=d12,<k0=d8
vmlal.u32 q10,d12,d8

# qhasm: h3[0,1] += _2k2[2] unsigned*   k0[0]; h3[2,3] += _2k2[3] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h3=reg128#8,<_2k2=reg128#7%top,<k0=reg128#5%bot
# asm 2: vmlal.u32 <h3=q7,<_2k2=d13,<k0=d8
vmlal.u32 q7,d13,d8

# qhasm: h4[0,1] += _2k4[0] unsigned*   k0[0]; h4[2,3] += _2k4[1] unsigned*   k0[1]		
# asm 1: vmlal.u32 <h4=reg128#12,<_2k4=reg128#9%bot,<k0=reg128#5%bot
# asm 2: vmlal.u32 <h4=q11,<_2k4=d16,<k0=d8
vmlal.u32 q11,d16,d8

# qhasm: h0[0,1] += _2k4[0] unsigned* _2k0[2]; h0[2,3] += _2k4[1] unsigned* _2k0[3]		
# asm 1: vmlal.u32 <h0=reg128#10,<_2k4=reg128#9%bot,<_2k0=reg128#4%top
# asm 2: vmlal.u32 <h0=q9,<_2k4=d16,<_2k0=d7
vmlal.u32 q9,d16,d7

# qhasm: h4[0,1] += _2k2[2] unsigned* _2k0[2]; h4[2,3] += _2k2[3] unsigned* _2k0[3]		
# asm 1: vmlal.u32 <h4=reg128#12,<_2k2=reg128#7%top,<_2k0=reg128#4%top
# asm 2: vmlal.u32 <h4=q11,<_2k2=d13,<_2k0=d7
vmlal.u32 q11,d13,d7

# qhasm: h3[0,1] += _2k2[0] unsigned*   k0[2]; h3[2,3] += _2k2[1] unsigned*   k0[3]		
# asm 1: vmlal.u32 <h3=reg128#8,<_2k2=reg128#7%bot,<k0=reg128#5%top
# asm 2: vmlal.u32 <h3=q7,<_2k2=d12,<k0=d9
vmlal.u32 q7,d12,d9

# qhasm: h0[0,1] += _2k2[2] unsigned* _2k2[0]; h0[2,3] += _2k2[3] unsigned* _2k2[1]		
# asm 1: vmlal.u32 <h0=reg128#10,<_2k2=reg128#7%top,<_2k2=reg128#7%bot
# asm 2: vmlal.u32 <h0=q9,<_2k2=d13,<_2k2=d12
vmlal.u32 q9,d13,d12

# qhasm: h1[0,1] += _2k4[0] unsigned*   k2[0]; h1[2,3] += _2k4[1] unsigned*   k2[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<_2k4=reg128#9%bot,<k2=reg128#6%bot
# asm 2: vmlal.u32 <h1=q12,<_2k4=d16,<k2=d10
vmlal.u32 q12,d16,d10

# qhasm: h2[0,1] += _2k4[0] unsigned* _2k2[2]; h2[2,3] += _2k4[1] unsigned* _2k2[3]		
# asm 1: vmlal.u32 <h2=reg128#11,<_2k4=reg128#9%bot,<_2k2=reg128#7%top
# asm 2: vmlal.u32 <h2=q10,<_2k4=d16,<_2k2=d13
vmlal.u32 q10,d16,d13

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#10,#26
# asm 2: vshr.u64 >t=q3,<h0=q9,#26
vshr.u64 q3,q9,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#10,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q9,<mask26=q1
vand q4,q9,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<h1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#6,<h2=reg128#11,<t=reg128#6
# asm 2: vadd.i64 >h2=q5,<h2=q10,<t=q5
vadd.i64 q5,q10,q5

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#1
# asm 2: vand >h1=q3,<h1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<h2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<h2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#7,<h3=reg128#8,<t=reg128#7
# asm 2: vadd.i64 >h3=q6,<h3=q7,<t=q6
vadd.i64 q6,q7,q6

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#6,<h2=reg128#6,<mask26=reg128#2
# asm 2: vand >h2=q5,<h2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<h3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#8,<h4=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h4=q7,<h4=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#7,<h3=reg128#7,<mask25=reg128#1
# asm 2: vand >h3=q6,<h3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<h4=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<h4=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#5,<h0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >h0=q4,<h0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#8,<h4=reg128#8,<mask25=reg128#1
# asm 2: vand >h4=q7,<h4=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<h0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#5,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#5,<h1=reg128#4
# asm 2: vtrn.32 <h0=q4,<h1=q3
vtrn.32 q4,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#5%bot,<h0=reg128#5%top
# asm 2: vtrn.32 <h0=d8,<h0=d9
vtrn.32 d8,d9

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#6,<h3=reg128#7
# asm 2: vtrn.32 <h2=q5,<h3=q6
vtrn.32 q5,q6

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#6%bot,<h2=reg128#6%top
# asm 2: vtrn.32 <h2=d10,<h2=d11
vtrn.32 d10,d11

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#8%bot,<h4=reg128#8%top
# asm 2: vtrn.32 <h4=d14,<h4=d15
vtrn.32 d14,d15

# qhasm: 2x _2h0 = h0 << 1
# asm 1: vshl.i64 >_2h0=reg128#4,<h0=reg128#5,#1
# asm 2: vshl.i64 >_2h0=q3,<h0=q4,#1
vshl.i64 q3,q4,#1

# qhasm: 2x _2h2 = h2 << 1
# asm 1: vshl.i64 >_2h2=reg128#7,<h2=reg128#6,#1
# asm 2: vshl.i64 >_2h2=q6,<h2=q5,#1
vshl.i64 q6,q5,#1

# qhasm: 2x _2h4 = h4 << 1
# asm 1: vshl.i64 >_2h4=reg128#9,<h4=reg128#8,#1
# asm 2: vshl.i64 >_2h4=q8,<h4=q7,#1
vshl.i64 q8,q7,#1

# qhasm: k0[0,1]  =   h0[0] unsigned*   h0[0]; k0[2,3]  =   h0[1] unsigned*   h0[1]		
# asm 1: vmull.u32 >k0=reg128#10,<h0=reg128#5%bot,<h0=reg128#5%bot
# asm 2: vmull.u32 >k0=q9,<h0=d8,<h0=d8
vmull.u32 q9,d8,d8

# qhasm: k2[0,1]  = _2h0[2] unsigned*   h0[2]; k2[2,3]  = _2h0[3] unsigned*   h0[3]		
# asm 1: vmull.u32 >k2=reg128#11,<_2h0=reg128#4%top,<h0=reg128#5%top
# asm 2: vmull.u32 >k2=q10,<_2h0=d7,<h0=d9
vmull.u32 q10,d7,d9

# qhasm: k4[0,1]  =   h2[0] unsigned*   h2[0]; k4[2,3]  =   h2[1] unsigned*   h2[1]		
# asm 1: vmull.u32 >k4=reg128#12,<h2=reg128#6%bot,<h2=reg128#6%bot
# asm 2: vmull.u32 >k4=q11,<h2=d10,<h2=d10
vmull.u32 q11,d10,d10

# qhasm: k1[0,1]  = _2h2[2] unsigned*   h2[2]; k1[2,3]  = _2h2[3] unsigned*   h2[3]		
# asm 1: vmull.u32 >k1=reg128#13,<_2h2=reg128#7%top,<h2=reg128#6%top
# asm 2: vmull.u32 >k1=q12,<_2h2=d13,<h2=d11
vmull.u32 q12,d13,d11

# qhasm: k3[0,1]  =   h4[0] unsigned*   h4[0]; k3[2,3]  =   h4[1] unsigned*   h4[1]		
# asm 1: vmull.u32 >k3=reg128#8,<h4=reg128#8%bot,<h4=reg128#8%bot
# asm 2: vmull.u32 >k3=q7,<h4=d14,<h4=d14
vmull.u32 q7,d14,d14

# qhasm: k1[0,1] += _2h0[2] unsigned*   h0[0]; k1[2,3] += _2h0[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<_2h0=reg128#4%top,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k1=q12,<_2h0=d7,<h0=d8
vmlal.u32 q12,d7,d8

# qhasm: k2[0,1] += _2h2[0] unsigned*   h0[0]; k2[2,3] += _2h2[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k2=reg128#11,<_2h2=reg128#7%bot,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k2=q10,<_2h2=d12,<h0=d8
vmlal.u32 q10,d12,d8

# qhasm: k3[0,1] += _2h2[2] unsigned*   h0[0]; k3[2,3] += _2h2[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k3=reg128#8,<_2h2=reg128#7%top,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k3=q7,<_2h2=d13,<h0=d8
vmlal.u32 q7,d13,d8

# qhasm: k4[0,1] += _2h4[0] unsigned*   h0[0]; k4[2,3] += _2h4[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k4=reg128#12,<_2h4=reg128#9%bot,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k4=q11,<_2h4=d16,<h0=d8
vmlal.u32 q11,d16,d8

# qhasm: k0[0,1] += _2h4[0] unsigned* _2h0[2]; k0[2,3] += _2h4[1] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k0=reg128#10,<_2h4=reg128#9%bot,<_2h0=reg128#4%top
# asm 2: vmlal.u32 <k0=q9,<_2h4=d16,<_2h0=d7
vmlal.u32 q9,d16,d7

# qhasm: k4[0,1] += _2h2[2] unsigned* _2h0[2]; k4[2,3] += _2h2[3] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k4=reg128#12,<_2h2=reg128#7%top,<_2h0=reg128#4%top
# asm 2: vmlal.u32 <k4=q11,<_2h2=d13,<_2h0=d7
vmlal.u32 q11,d13,d7

# qhasm: k3[0,1] += _2h2[0] unsigned*   h0[2]; k3[2,3] += _2h2[1] unsigned*   h0[3]		
# asm 1: vmlal.u32 <k3=reg128#8,<_2h2=reg128#7%bot,<h0=reg128#5%top
# asm 2: vmlal.u32 <k3=q7,<_2h2=d12,<h0=d9
vmlal.u32 q7,d12,d9

# qhasm: k0[0,1] += _2h2[2] unsigned* _2h2[0]; k0[2,3] += _2h2[3] unsigned* _2h2[1]		
# asm 1: vmlal.u32 <k0=reg128#10,<_2h2=reg128#7%top,<_2h2=reg128#7%bot
# asm 2: vmlal.u32 <k0=q9,<_2h2=d13,<_2h2=d12
vmlal.u32 q9,d13,d12

# qhasm: k1[0,1] += _2h4[0] unsigned*   h2[0]; k1[2,3] += _2h4[1] unsigned*   h2[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<_2h4=reg128#9%bot,<h2=reg128#6%bot
# asm 2: vmlal.u32 <k1=q12,<_2h4=d16,<h2=d10
vmlal.u32 q12,d16,d10

# qhasm: k2[0,1] += _2h4[0] unsigned* _2h2[2]; k2[2,3] += _2h4[1] unsigned* _2h2[3]		
# asm 1: vmlal.u32 <k2=reg128#11,<_2h4=reg128#9%bot,<_2h2=reg128#7%top
# asm 2: vmlal.u32 <k2=q10,<_2h4=d16,<_2h2=d13
vmlal.u32 q10,d16,d13

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<k0=reg128#10,#26
# asm 2: vshr.u64 >t=q3,<k0=q9,#26
vshr.u64 q3,q9,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >k1=q3,<k1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#10,<mask26=reg128#2
# asm 2: vand >k0=q4,<k0=q9,<mask26=q1
vand q4,q9,q1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<k1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<k1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#6,<k2=reg128#11,<t=reg128#6
# asm 2: vadd.i64 >k2=q5,<k2=q10,<t=q5
vadd.i64 q5,q10,q5

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#4,<k1=reg128#4,<mask25=reg128#1
# asm 2: vand >k1=q3,<k1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<k2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<k2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#7,<k3=reg128#8,<t=reg128#7
# asm 2: vadd.i64 >k3=q6,<k3=q7,<t=q6
vadd.i64 q6,q7,q6

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#6,<k2=reg128#6,<mask26=reg128#2
# asm 2: vand >k2=q5,<k2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<k3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#8,<k4=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >k4=q7,<k4=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#7,<k3=reg128#7,<mask25=reg128#1
# asm 2: vand >k3=q6,<k3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<k4=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<k4=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#5,<k0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >k0=q4,<k0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#1,<k4=reg128#8,<mask25=reg128#1
# asm 2: vand >k4=q0,<k4=q7,<mask25=q0
vand q0,q7,q0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<k0=reg128#5,#26
# asm 2: vshr.u64 >t=q7,<k0=q4,#26
vshr.u64 q7,q4,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >k1=q3,<k1=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#5,<mask26=reg128#2
# asm 2: vand >k0=q4,<k0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#5,<k1=reg128#4
# asm 2: vtrn.32 <k0=q4,<k1=q3
vtrn.32 q4,q3

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#5%bot,<k0=reg128#5%top
# asm 2: vtrn.32 <k0=d8,<k0=d9
vtrn.32 d8,d9

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#6,<k3=reg128#7
# asm 2: vtrn.32 <k2=q5,<k3=q6
vtrn.32 q5,q6

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#6%bot,<k2=reg128#6%top
# asm 2: vtrn.32 <k2=d10,<k2=d11
vtrn.32 d10,d11

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#1%bot,<k4=reg128#1%top
# asm 2: vtrn.32 <k4=d0,<k4=d1
vtrn.32 d0,d1

# qhasm: a2 aligned = mem128[ptr1]
# asm 1: vld1.8 {>a2=reg128#4%bot->a2=reg128#4%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>a2=d6->a2=d7},[<ptr1=r2,: 128]
vld1.8 {d6-d7},[r2,: 128]

# qhasm: ptr1 -= 32				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: sub >ptr1=r2,<ptr1=r2,#32
sub r2,r2,#32

# qhasm: a3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a3=reg128#7%bot->a3=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a3=d12->a3=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a4=reg128#8%bot->a4=reg128#8%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a4=d14->a4=d15},[<ptr1=r2,: 128]!
vld1.8 {d14-d15},[r2,: 128]!

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#9,<a2=reg128#4,#1
# asm 2: vshl.i64 >_2a2=q8,<a2=q3,#1
vshl.i64 q8,q3,#1

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#10,<a3=reg128#7,#1
# asm 2: vshl.i64 >_2a3=q9,<a3=q6,#1
vshl.i64 q9,q6,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#11,<a4=reg128#8,#1
# asm 2: vshl.i64 >_2a4=q10,<a4=q7,#1
vshl.i64 q10,q7,#1

# qhasm: h0[0,1]  = k0[0] unsigned*   a3[0]; h0[2,3]  = k0[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#12,<k0=reg128#5%bot,<a3=reg128#7%bot
# asm 2: vmull.u32 >h0=q11,<k0=d8,<a3=d12
vmull.u32 q11,d8,d12

# qhasm: h1[0,1]  = k0[2] unsigned*   a3[0]; h1[2,3]  = k0[3] unsigned*   a3[1]		
# asm 1: vmull.u32 >h1=reg128#13,<k0=reg128#5%top,<a3=reg128#7%bot
# asm 2: vmull.u32 >h1=q12,<k0=d9,<a3=d12
vmull.u32 q12,d9,d12

# qhasm: h2[0,1]  = k2[0] unsigned*   a3[0]; h2[2,3]  = k2[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h2=reg128#14,<k2=reg128#6%bot,<a3=reg128#7%bot
# asm 2: vmull.u32 >h2=q13,<k2=d10,<a3=d12
vmull.u32 q13,d10,d12

# qhasm: h3[0,1]  = k2[2] unsigned*   a3[0]; h3[2,3]  = k2[3] unsigned*   a3[1]		
# asm 1: vmull.u32 >h3=reg128#15,<k2=reg128#6%top,<a3=reg128#7%bot
# asm 2: vmull.u32 >h3=q14,<k2=d11,<a3=d12
vmull.u32 q14,d11,d12

# qhasm: h4[0,1]  = k4[0] unsigned*   a3[0]; h4[2,3]  = k4[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h4=reg128#16,<k4=reg128#1%bot,<a3=reg128#7%bot
# asm 2: vmull.u32 >h4=q15,<k4=d0,<a3=d12
vmull.u32 q15,d0,d12

# qhasm: h0[0,1] += k4[0] unsigned* _2a3[2]; h0[2,3] += k4[1] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k4=reg128#1%bot,<_2a3=reg128#10%top
# asm 2: vmlal.u32 <h0=q11,<k4=d0,<_2a3=d19
vmlal.u32 q11,d0,d19

# qhasm: h1[0,1] += k0[0] unsigned*   a3[2]; h1[2,3] += k0[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k0=reg128#5%bot,<a3=reg128#7%top
# asm 2: vmlal.u32 <h1=q12,<k0=d8,<a3=d13
vmlal.u32 q12,d8,d13

# qhasm: h2[0,1] += k0[2] unsigned* _2a3[2]; h2[2,3] += k0[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#5%top,<_2a3=reg128#10%top
# asm 2: vmlal.u32 <h2=q13,<k0=d9,<_2a3=d19
vmlal.u32 q13,d9,d19

# qhasm: h3[0,1] += k2[0] unsigned*   a3[2]; h3[2,3] += k2[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k2=reg128#6%bot,<a3=reg128#7%top
# asm 2: vmlal.u32 <h3=q14,<k2=d10,<a3=d13
vmlal.u32 q14,d10,d13

# qhasm: h4[0,1] += k2[2] unsigned* _2a3[2]; h4[2,3] += k2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#6%top,<_2a3=reg128#10%top
# asm 2: vmlal.u32 <h4=q15,<k2=d11,<_2a3=d19
vmlal.u32 q15,d11,d19

# qhasm: h0[0,1] += k2[2] unsigned* _2a4[0]; h0[2,3] += k2[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#6%top,<_2a4=reg128#11%bot
# asm 2: vmlal.u32 <h0=q11,<k2=d11,<_2a4=d20
vmlal.u32 q11,d11,d20

# qhasm: h1[0,1] += k4[0] unsigned*   a4[0]; h1[2,3] += k4[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<k4=reg128#1%bot,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h1=q12,<k4=d0,<a4=d14
vmlal.u32 q12,d0,d14

# qhasm: h2[0,1] += k0[0] unsigned*   a4[0]; h2[2,3] += k0[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#5%bot,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h2=q13,<k0=d8,<a4=d14
vmlal.u32 q13,d8,d14

# qhasm: h3[0,1] += k0[2] unsigned*   a4[0]; h3[2,3] += k0[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#5%top,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h3=q14,<k0=d9,<a4=d14
vmlal.u32 q14,d9,d14

# qhasm: h4[0,1] += k2[0] unsigned*   a4[0]; h4[2,3] += k2[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#6%bot,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h4=q15,<k2=d10,<a4=d14
vmlal.u32 q15,d10,d14

# qhasm: h0[0,1] += k2[0] unsigned* _2a4[2]; h0[2,3] += k2[1] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#6%bot,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h0=q11,<k2=d10,<_2a4=d21
vmlal.u32 q11,d10,d21

# qhasm: h1[0,1] += k2[2] unsigned* _2a4[2]; h1[2,3] += k2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#6%top,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h1=q12,<k2=d11,<_2a4=d21
vmlal.u32 q12,d11,d21

# qhasm: h2[0,1] += k4[0] unsigned* _2a4[2]; h2[2,3] += k4[1] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k4=reg128#1%bot,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h2=q13,<k4=d0,<_2a4=d21
vmlal.u32 q13,d0,d21

# qhasm: h3[0,1] += k0[0] unsigned*   a4[2]; h3[2,3] += k0[1] unsigned*   a4[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#5%bot,<a4=reg128#8%top
# asm 2: vmlal.u32 <h3=q14,<k0=d8,<a4=d15
vmlal.u32 q14,d8,d15

# qhasm: h4[0,1] += k0[2] unsigned* _2a4[2]; h4[2,3] += k0[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#5%top,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h4=q15,<k0=d9,<_2a4=d21
vmlal.u32 q15,d9,d21

# qhasm: h0[0,1] += k0[2] unsigned* _2a2[2]; h0[2,3] += k0[3] unsigned* _2a2[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k0=reg128#5%top,<_2a2=reg128#9%top
# asm 2: vmlal.u32 <h0=q11,<k0=d9,<_2a2=d17
vmlal.u32 q11,d9,d17

# qhasm: h1[0,1] += k2[0] unsigned*   a2[2]; h1[2,3] += k2[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#6%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <h1=q12,<k2=d10,<a2=d7
vmlal.u32 q12,d10,d7

# qhasm: h2[0,1] += k2[2] unsigned* _2a2[2]; h2[2,3] += k2[3] unsigned* _2a2[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k2=reg128#6%top,<_2a2=reg128#9%top
# asm 2: vmlal.u32 <h2=q13,<k2=d11,<_2a2=d17
vmlal.u32 q13,d11,d17

# qhasm: h3[0,1] += k4[0] unsigned*   a2[2]; h3[2,3] += k4[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k4=reg128#1%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<k4=d0,<a2=d7
vmlal.u32 q14,d0,d7

# qhasm: h4[0,1] += k0[0] unsigned*   a2[2]; h4[2,3] += k0[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#5%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <h4=q15,<k0=d8,<a2=d7
vmlal.u32 q15,d8,d7

# qhasm: ptr1 -= 128			
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#128
# asm 2: sub >ptr1=r2,<ptr1=r2,#128
sub r2,r2,#128

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#12,#26
# asm 2: vshr.u64 >t=q3,<h0=q11,#26
vshr.u64 q3,q11,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#12,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q11,<mask26=q1
vand q4,q11,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<h1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#6,<h2=reg128#14,<t=reg128#6
# asm 2: vadd.i64 >h2=q5,<h2=q13,<t=q5
vadd.i64 q5,q13,q5

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#1
# asm 2: vand >h1=q3,<h1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<h2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<h2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#7,<h3=reg128#15,<t=reg128#7
# asm 2: vadd.i64 >h3=q6,<h3=q14,<t=q6
vadd.i64 q6,q14,q6

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#6,<h2=reg128#6,<mask26=reg128#2
# asm 2: vand >h2=q5,<h2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<h3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#8,<h4=reg128#16,<t=reg128#8
# asm 2: vadd.i64 >h4=q7,<h4=q15,<t=q7
vadd.i64 q7,q15,q7

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#7,<h3=reg128#7,<mask25=reg128#1
# asm 2: vand >h3=q6,<h3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<h4=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<h4=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#5,<h0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >h0=q4,<h0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#8,<h4=reg128#8,<mask25=reg128#1
# asm 2: vand >h4=q7,<h4=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<h0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#5,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#5,<h1=reg128#4
# asm 2: vtrn.32 <h0=q4,<h1=q3
vtrn.32 q4,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#5%bot,<h0=reg128#5%top
# asm 2: vtrn.32 <h0=d8,<h0=d9
vtrn.32 d8,d9

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#6,<h3=reg128#7
# asm 2: vtrn.32 <h2=q5,<h3=q6
vtrn.32 q5,q6

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#6%bot,<h2=reg128#6%top
# asm 2: vtrn.32 <h2=d10,<h2=d11
vtrn.32 d10,d11

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#8%bot,<h4=reg128#8%top
# asm 2: vtrn.32 <h4=d14,<h4=d15
vtrn.32 d14,d15

# qhasm: 2x _2h0 = h0 << 1
# asm 1: vshl.i64 >_2h0=reg128#4,<h0=reg128#5,#1
# asm 2: vshl.i64 >_2h0=q3,<h0=q4,#1
vshl.i64 q3,q4,#1

# qhasm: 2x _2h2 = h2 << 1
# asm 1: vshl.i64 >_2h2=reg128#7,<h2=reg128#6,#1
# asm 2: vshl.i64 >_2h2=q6,<h2=q5,#1
vshl.i64 q6,q5,#1

# qhasm: 2x _2h4 = h4 << 1
# asm 1: vshl.i64 >_2h4=reg128#9,<h4=reg128#8,#1
# asm 2: vshl.i64 >_2h4=q8,<h4=q7,#1
vshl.i64 q8,q7,#1

# qhasm: k0[0,1]  =   h0[0] unsigned*   h0[0]; k0[2,3]  =   h0[1] unsigned*   h0[1]		
# asm 1: vmull.u32 >k0=reg128#10,<h0=reg128#5%bot,<h0=reg128#5%bot
# asm 2: vmull.u32 >k0=q9,<h0=d8,<h0=d8
vmull.u32 q9,d8,d8

# qhasm: k2[0,1]  = _2h0[2] unsigned*   h0[2]; k2[2,3]  = _2h0[3] unsigned*   h0[3]		
# asm 1: vmull.u32 >k2=reg128#11,<_2h0=reg128#4%top,<h0=reg128#5%top
# asm 2: vmull.u32 >k2=q10,<_2h0=d7,<h0=d9
vmull.u32 q10,d7,d9

# qhasm: k4[0,1]  =   h2[0] unsigned*   h2[0]; k4[2,3]  =   h2[1] unsigned*   h2[1]		
# asm 1: vmull.u32 >k4=reg128#12,<h2=reg128#6%bot,<h2=reg128#6%bot
# asm 2: vmull.u32 >k4=q11,<h2=d10,<h2=d10
vmull.u32 q11,d10,d10

# qhasm: k1[0,1]  = _2h2[2] unsigned*   h2[2]; k1[2,3]  = _2h2[3] unsigned*   h2[3]		
# asm 1: vmull.u32 >k1=reg128#13,<_2h2=reg128#7%top,<h2=reg128#6%top
# asm 2: vmull.u32 >k1=q12,<_2h2=d13,<h2=d11
vmull.u32 q12,d13,d11

# qhasm: k3[0,1]  =   h4[0] unsigned*   h4[0]; k3[2,3]  =   h4[1] unsigned*   h4[1]		
# asm 1: vmull.u32 >k3=reg128#8,<h4=reg128#8%bot,<h4=reg128#8%bot
# asm 2: vmull.u32 >k3=q7,<h4=d14,<h4=d14
vmull.u32 q7,d14,d14

# qhasm: k1[0,1] += _2h0[2] unsigned*   h0[0]; k1[2,3] += _2h0[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<_2h0=reg128#4%top,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k1=q12,<_2h0=d7,<h0=d8
vmlal.u32 q12,d7,d8

# qhasm: k2[0,1] += _2h2[0] unsigned*   h0[0]; k2[2,3] += _2h2[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k2=reg128#11,<_2h2=reg128#7%bot,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k2=q10,<_2h2=d12,<h0=d8
vmlal.u32 q10,d12,d8

# qhasm: k3[0,1] += _2h2[2] unsigned*   h0[0]; k3[2,3] += _2h2[3] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k3=reg128#8,<_2h2=reg128#7%top,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k3=q7,<_2h2=d13,<h0=d8
vmlal.u32 q7,d13,d8

# qhasm: k4[0,1] += _2h4[0] unsigned*   h0[0]; k4[2,3] += _2h4[1] unsigned*   h0[1]		
# asm 1: vmlal.u32 <k4=reg128#12,<_2h4=reg128#9%bot,<h0=reg128#5%bot
# asm 2: vmlal.u32 <k4=q11,<_2h4=d16,<h0=d8
vmlal.u32 q11,d16,d8

# qhasm: k0[0,1] += _2h4[0] unsigned* _2h0[2]; k0[2,3] += _2h4[1] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k0=reg128#10,<_2h4=reg128#9%bot,<_2h0=reg128#4%top
# asm 2: vmlal.u32 <k0=q9,<_2h4=d16,<_2h0=d7
vmlal.u32 q9,d16,d7

# qhasm: k4[0,1] += _2h2[2] unsigned* _2h0[2]; k4[2,3] += _2h2[3] unsigned* _2h0[3]		
# asm 1: vmlal.u32 <k4=reg128#12,<_2h2=reg128#7%top,<_2h0=reg128#4%top
# asm 2: vmlal.u32 <k4=q11,<_2h2=d13,<_2h0=d7
vmlal.u32 q11,d13,d7

# qhasm: k3[0,1] += _2h2[0] unsigned*   h0[2]; k3[2,3] += _2h2[1] unsigned*   h0[3]		
# asm 1: vmlal.u32 <k3=reg128#8,<_2h2=reg128#7%bot,<h0=reg128#5%top
# asm 2: vmlal.u32 <k3=q7,<_2h2=d12,<h0=d9
vmlal.u32 q7,d12,d9

# qhasm: k0[0,1] += _2h2[2] unsigned* _2h2[0]; k0[2,3] += _2h2[3] unsigned* _2h2[1]		
# asm 1: vmlal.u32 <k0=reg128#10,<_2h2=reg128#7%top,<_2h2=reg128#7%bot
# asm 2: vmlal.u32 <k0=q9,<_2h2=d13,<_2h2=d12
vmlal.u32 q9,d13,d12

# qhasm: k1[0,1] += _2h4[0] unsigned*   h2[0]; k1[2,3] += _2h4[1] unsigned*   h2[1]		
# asm 1: vmlal.u32 <k1=reg128#13,<_2h4=reg128#9%bot,<h2=reg128#6%bot
# asm 2: vmlal.u32 <k1=q12,<_2h4=d16,<h2=d10
vmlal.u32 q12,d16,d10

# qhasm: k2[0,1] += _2h4[0] unsigned* _2h2[2]; k2[2,3] += _2h4[1] unsigned* _2h2[3]		
# asm 1: vmlal.u32 <k2=reg128#11,<_2h4=reg128#9%bot,<_2h2=reg128#7%top
# asm 2: vmlal.u32 <k2=q10,<_2h4=d16,<_2h2=d13
vmlal.u32 q10,d16,d13

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<k0=reg128#10,#26
# asm 2: vshr.u64 >t=q3,<k0=q9,#26
vshr.u64 q3,q9,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >k1=q3,<k1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#10,<mask26=reg128#2
# asm 2: vand >k0=q4,<k0=q9,<mask26=q1
vand q4,q9,q1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<k1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<k1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#6,<k2=reg128#11,<t=reg128#6
# asm 2: vadd.i64 >k2=q5,<k2=q10,<t=q5
vadd.i64 q5,q10,q5

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#4,<k1=reg128#4,<mask25=reg128#1
# asm 2: vand >k1=q3,<k1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<k2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<k2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#7,<k3=reg128#8,<t=reg128#7
# asm 2: vadd.i64 >k3=q6,<k3=q7,<t=q6
vadd.i64 q6,q7,q6

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#6,<k2=reg128#6,<mask26=reg128#2
# asm 2: vand >k2=q5,<k2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<k3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#8,<k4=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >k4=q7,<k4=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#7,<k3=reg128#7,<mask25=reg128#1
# asm 2: vand >k3=q6,<k3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<k4=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<k4=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#5,<k0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >k0=q4,<k0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#1,<k4=reg128#8,<mask25=reg128#1
# asm 2: vand >k4=q0,<k4=q7,<mask25=q0
vand q0,q7,q0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<k0=reg128#5,#26
# asm 2: vshr.u64 >t=q7,<k0=q4,#26
vshr.u64 q7,q4,#26

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >k1=q3,<k1=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#5,<mask26=reg128#2
# asm 2: vand >k0=q4,<k0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#5,<k1=reg128#4
# asm 2: vtrn.32 <k0=q4,<k1=q3
vtrn.32 q4,q3

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#5%bot,<k0=reg128#5%top
# asm 2: vtrn.32 <k0=d8,<k0=d9
vtrn.32 d8,d9

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#6,<k3=reg128#7
# asm 2: vtrn.32 <k2=q5,<k3=q6
vtrn.32 q5,q6

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#6%bot,<k2=reg128#6%top
# asm 2: vtrn.32 <k2=d10,<k2=d11
vtrn.32 d10,d11

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#1%bot,<k4=reg128#1%top
# asm 2: vtrn.32 <k4=d0,<k4=d1
vtrn.32 d0,d1

# qhasm: adr1 = input_1 + 32
# asm 1: add >adr1=int32#4,<input_1=int32#2,#32
# asm 2: add >adr1=r3,<input_1=r1,#32
add r3,r1,#32

# qhasm: a2 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a2=reg128#4%bot->a2=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a2=d6->a2=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#7%bot->a3=reg128#7%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d12->a3=d13},[<adr1=r3,: 128]!
vld1.8 {d12-d13},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#8%bot->a4=reg128#8%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d14->a4=d15},[<adr1=r3,: 128]!
vld1.8 {d14-d15},[r3,: 128]!

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#9,<a2=reg128#4,#1
# asm 2: vshl.i64 >_2a2=q8,<a2=q3,#1
vshl.i64 q8,q3,#1

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#10,<a3=reg128#7,#1
# asm 2: vshl.i64 >_2a3=q9,<a3=q6,#1
vshl.i64 q9,q6,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#11,<a4=reg128#8,#1
# asm 2: vshl.i64 >_2a4=q10,<a4=q7,#1
vshl.i64 q10,q7,#1

# qhasm: h0[0,1]  = k0[0] unsigned*   a3[0]; h0[2,3]  = k0[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#12,<k0=reg128#5%bot,<a3=reg128#7%bot
# asm 2: vmull.u32 >h0=q11,<k0=d8,<a3=d12
vmull.u32 q11,d8,d12

# qhasm: h1[0,1]  = k0[2] unsigned*   a3[0]; h1[2,3]  = k0[3] unsigned*   a3[1]		
# asm 1: vmull.u32 >h1=reg128#13,<k0=reg128#5%top,<a3=reg128#7%bot
# asm 2: vmull.u32 >h1=q12,<k0=d9,<a3=d12
vmull.u32 q12,d9,d12

# qhasm: h2[0,1]  = k2[0] unsigned*   a3[0]; h2[2,3]  = k2[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h2=reg128#14,<k2=reg128#6%bot,<a3=reg128#7%bot
# asm 2: vmull.u32 >h2=q13,<k2=d10,<a3=d12
vmull.u32 q13,d10,d12

# qhasm: h3[0,1]  = k2[2] unsigned*   a3[0]; h3[2,3]  = k2[3] unsigned*   a3[1]		
# asm 1: vmull.u32 >h3=reg128#15,<k2=reg128#6%top,<a3=reg128#7%bot
# asm 2: vmull.u32 >h3=q14,<k2=d11,<a3=d12
vmull.u32 q14,d11,d12

# qhasm: h4[0,1]  = k4[0] unsigned*   a3[0]; h4[2,3]  = k4[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h4=reg128#16,<k4=reg128#1%bot,<a3=reg128#7%bot
# asm 2: vmull.u32 >h4=q15,<k4=d0,<a3=d12
vmull.u32 q15,d0,d12

# qhasm: h0[0,1] += k4[0] unsigned* _2a3[2]; h0[2,3] += k4[1] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k4=reg128#1%bot,<_2a3=reg128#10%top
# asm 2: vmlal.u32 <h0=q11,<k4=d0,<_2a3=d19
vmlal.u32 q11,d0,d19

# qhasm: h1[0,1] += k0[0] unsigned*   a3[2]; h1[2,3] += k0[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k0=reg128#5%bot,<a3=reg128#7%top
# asm 2: vmlal.u32 <h1=q12,<k0=d8,<a3=d13
vmlal.u32 q12,d8,d13

# qhasm: h2[0,1] += k0[2] unsigned* _2a3[2]; h2[2,3] += k0[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#5%top,<_2a3=reg128#10%top
# asm 2: vmlal.u32 <h2=q13,<k0=d9,<_2a3=d19
vmlal.u32 q13,d9,d19

# qhasm: h3[0,1] += k2[0] unsigned*   a3[2]; h3[2,3] += k2[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k2=reg128#6%bot,<a3=reg128#7%top
# asm 2: vmlal.u32 <h3=q14,<k2=d10,<a3=d13
vmlal.u32 q14,d10,d13

# qhasm: h4[0,1] += k2[2] unsigned* _2a3[2]; h4[2,3] += k2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#6%top,<_2a3=reg128#10%top
# asm 2: vmlal.u32 <h4=q15,<k2=d11,<_2a3=d19
vmlal.u32 q15,d11,d19

# qhasm: h0[0,1] += k2[2] unsigned* _2a4[0]; h0[2,3] += k2[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#6%top,<_2a4=reg128#11%bot
# asm 2: vmlal.u32 <h0=q11,<k2=d11,<_2a4=d20
vmlal.u32 q11,d11,d20

# qhasm: h1[0,1] += k4[0] unsigned*   a4[0]; h1[2,3] += k4[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#13,<k4=reg128#1%bot,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h1=q12,<k4=d0,<a4=d14
vmlal.u32 q12,d0,d14

# qhasm: h2[0,1] += k0[0] unsigned*   a4[0]; h2[2,3] += k0[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h2=reg128#14,<k0=reg128#5%bot,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h2=q13,<k0=d8,<a4=d14
vmlal.u32 q13,d8,d14

# qhasm: h3[0,1] += k0[2] unsigned*   a4[0]; h3[2,3] += k0[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#5%top,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h3=q14,<k0=d9,<a4=d14
vmlal.u32 q14,d9,d14

# qhasm: h4[0,1] += k2[0] unsigned*   a4[0]; h4[2,3] += k2[1] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h4=reg128#16,<k2=reg128#6%bot,<a4=reg128#8%bot
# asm 2: vmlal.u32 <h4=q15,<k2=d10,<a4=d14
vmlal.u32 q15,d10,d14

# qhasm: h0[0,1] += k2[0] unsigned* _2a4[2]; h0[2,3] += k2[1] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k2=reg128#6%bot,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h0=q11,<k2=d10,<_2a4=d21
vmlal.u32 q11,d10,d21

# qhasm: h1[0,1] += k2[2] unsigned* _2a4[2]; h1[2,3] += k2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#6%top,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h1=q12,<k2=d11,<_2a4=d21
vmlal.u32 q12,d11,d21

# qhasm: h2[0,1] += k4[0] unsigned* _2a4[2]; h2[2,3] += k4[1] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k4=reg128#1%bot,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h2=q13,<k4=d0,<_2a4=d21
vmlal.u32 q13,d0,d21

# qhasm: h3[0,1] += k0[0] unsigned*   a4[2]; h3[2,3] += k0[1] unsigned*   a4[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k0=reg128#5%bot,<a4=reg128#8%top
# asm 2: vmlal.u32 <h3=q14,<k0=d8,<a4=d15
vmlal.u32 q14,d8,d15

# qhasm: h4[0,1] += k0[2] unsigned* _2a4[2]; h4[2,3] += k0[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#5%top,<_2a4=reg128#11%top
# asm 2: vmlal.u32 <h4=q15,<k0=d9,<_2a4=d21
vmlal.u32 q15,d9,d21

# qhasm: h0[0,1] += k0[2] unsigned* _2a2[2]; h0[2,3] += k0[3] unsigned* _2a2[3]		
# asm 1: vmlal.u32 <h0=reg128#12,<k0=reg128#5%top,<_2a2=reg128#9%top
# asm 2: vmlal.u32 <h0=q11,<k0=d9,<_2a2=d17
vmlal.u32 q11,d9,d17

# qhasm: h1[0,1] += k2[0] unsigned*   a2[2]; h1[2,3] += k2[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <h1=reg128#13,<k2=reg128#6%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <h1=q12,<k2=d10,<a2=d7
vmlal.u32 q12,d10,d7

# qhasm: h2[0,1] += k2[2] unsigned* _2a2[2]; h2[2,3] += k2[3] unsigned* _2a2[3]		
# asm 1: vmlal.u32 <h2=reg128#14,<k2=reg128#6%top,<_2a2=reg128#9%top
# asm 2: vmlal.u32 <h2=q13,<k2=d11,<_2a2=d17
vmlal.u32 q13,d11,d17

# qhasm: h3[0,1] += k4[0] unsigned*   a2[2]; h3[2,3] += k4[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<k4=reg128#1%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<k4=d0,<a2=d7
vmlal.u32 q14,d0,d7

# qhasm: h4[0,1] += k0[0] unsigned*   a2[2]; h4[2,3] += k0[1] unsigned*   a2[3]		
# asm 1: vmlal.u32 <h4=reg128#16,<k0=reg128#5%bot,<a2=reg128#4%top
# asm 2: vmlal.u32 <h4=q15,<k0=d8,<a2=d7
vmlal.u32 q15,d8,d7

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#12,#26
# asm 2: vshr.u64 >t=q3,<h0=q11,#26
vshr.u64 q3,q11,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#12,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q11,<mask26=q1
vand q4,q11,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<h1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#6,<h2=reg128#14,<t=reg128#6
# asm 2: vadd.i64 >h2=q5,<h2=q13,<t=q5
vadd.i64 q5,q13,q5

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#1
# asm 2: vand >h1=q3,<h1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<h2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<h2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#7,<h3=reg128#15,<t=reg128#7
# asm 2: vadd.i64 >h3=q6,<h3=q14,<t=q6
vadd.i64 q6,q14,q6

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#6,<h2=reg128#6,<mask26=reg128#2
# asm 2: vand >h2=q5,<h2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h3=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<h3=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#8,<h4=reg128#16,<t=reg128#8
# asm 2: vadd.i64 >h4=q7,<h4=q15,<t=q7
vadd.i64 q7,q15,q7

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#7,<h3=reg128#7,<mask25=reg128#1
# asm 2: vand >h3=q6,<h3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<h4=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<h4=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#5,<h0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >h0=q4,<h0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#8,<h4=reg128#8,<mask25=reg128#1
# asm 2: vand >h4=q7,<h4=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<h0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#5,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#5,<h1=reg128#4
# asm 2: vtrn.32 <h0=q4,<h1=q3
vtrn.32 q4,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#5%bot,<h0=reg128#5%top
# asm 2: vtrn.32 <h0=d8,<h0=d9
vtrn.32 d8,d9

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#6,<h3=reg128#7
# asm 2: vtrn.32 <h2=q5,<h3=q6
vtrn.32 q5,q6

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#6%bot,<h2=reg128#6%top
# asm 2: vtrn.32 <h2=d10,<h2=d11
vtrn.32 d10,d11

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#8%bot,<h4=reg128#8%top
# asm 2: vtrn.32 <h4=d14,<h4=d15
vtrn.32 d14,d15

# qhasm: s4 = s4[0]h4[0]
# asm 1: vmov <s4=reg128#3%top,<h4=reg128#8%bot
# asm 2: vmov <s4=d5,<h4=d14
vmov d5,d14

# qhasm: ptr1 += 48				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#48
# asm 2: add >ptr1=r2,<ptr1=r2,#48
add r2,r2,#48

# qhasm: mem128[ptr1] aligned = s4; ptr1+=16	
# asm 1: vst1.8 {<s4=reg128#3%bot-<s4=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<s4=d4-<s4=d5},[<ptr1=r2,: 128]!
vst1.8 {d4-d5},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = h0; ptr1+=16	
# asm 1: vst1.8 {<h0=reg128#5%bot-<h0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<h0=d8-<h0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = h2; ptr1+=16	
# asm 1: vst1.8 {<h2=reg128#6%bot-<h2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<h2=d10-<h2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#7%bot->a1=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d12->a1=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a2 = s4
# asm 1: vmov >a2=reg128#3,<s4=reg128#3
# asm 2: vmov >a2=q2,<s4=q2
vmov q2,q2

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#5
# asm 2: vmov >a3=q4,<h0=q4
vmov q4,q4

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#6
# asm 2: vmov >a4=q5,<h2=q5
vmov q5,q5

# qhasm: ctr = 5
# asm 1: ldr >ctr=int32#4,=5
# asm 2: ldr >ctr=r3,=5
ldr r3,=5

# qhasm: loop5:
._loop5:

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q2,#1
vshl.i64 q9,q2,#1

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q10,<a0=d6,<a0=d6
vmull.u32 q10,d6,d6

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a0=reg128#8%top,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q11,<_2a0=d15,<a0=d7
vmull.u32 q11,d15,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#7%bot,<a1=reg128#7%bot
# asm 2: vmull.u32 >h4=q12,<a1=d12,<a1=d12
vmull.u32 q12,d12,d12

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a1=reg128#9%top,<a1=reg128#7%top
# asm 2: vmull.u32 >h1=q13,<_2a1=d17,<a1=d13
vmull.u32 q13,d17,d13

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#3%bot,<a2=reg128#3%bot
# asm 2: vmull.u32 >h3=q14,<a2=d4,<a2=d4
vmull.u32 q14,d4,d4

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q13,<_2a0=d15,<a0=d6
vmlal.u32 q13,d15,d6

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a1=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q11,<_2a1=d16,<a0=d6
vmlal.u32 q11,d16,d6

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q14,<_2a1=d17,<a0=d6
vmlal.u32 q14,d17,d6

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#10%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d18,<a0=d6
vmlal.u32 q12,d18,d6

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%bot,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d18,<_2a0=d15
vmlal.u32 q10,d18,d15

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#9%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h4=q12,<_2a1=d17,<_2a0=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<_2a1=d16,<a0=d7
vmlal.u32 q14,d16,d7

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a1=reg128#9%top,<_2a1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a1=d17,<_2a1=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%bot,<a1=reg128#7%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d18,<a1=d12
vmlal.u32 q13,d18,d12

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%bot,<_2a1=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d18,<_2a1=d17
vmlal.u32 q11,d18,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<h0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#14,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q13,<t=q3
vadd.i64 q3,q13,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q10,<mask26=q1
vand q6,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q7,<h1=q3,#25
vshr.u64 q7,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#1
# asm 2: vand >h1=q3,<h1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<h3=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#1
# asm 2: vand >h3=q8,<h3=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q11,<h4=q10,#25
vshr.u64 q11,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#7,<h0=reg128#7,<t=reg128#12
# asm 2: vadd.i64 >h0=q6,<h0=q6,<t=q11
vadd.i64 q6,q6,q11

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#1
# asm 2: vand >h4=q10,<h4=q10,<mask25=q0
vand q10,q10,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#7,#26
# asm 2: vshr.u64 >t=q11,<h0=q6,#26
vshr.u64 q11,q6,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#12
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q11
vadd.i64 q3,q3,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#7,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q6,<mask26=q1
vand q6,q6,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#7,<h1=reg128#4
# asm 2: vtrn.32 <h0=q6,<h1=q3
vtrn.32 q6,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#7%bot,<h0=reg128#7%top
# asm 2: vtrn.32 <h0=d12,<h0=d13
vtrn.32 d12,d13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: a0 = h0
# asm 1: vmov >a0=reg128#4,<h0=reg128#7
# asm 2: vmov >a0=q3,<h0=q6
vmov q3,q6

# qhasm: a1 = h2
# asm 1: vmov >a1=reg128#7,<h2=reg128#8
# asm 2: vmov >a1=q6,<h2=q7
vmov q6,q7

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#3%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d4,<h4=d20
vmov d4,d20

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q10,<a3=d8,<a3=d8
vmull.u32 q10,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q11,<_2a3=d15,<a3=d9
vmull.u32 q11,d15,d9

# qhasm: h5[0,1]  =   a4[0] unsigned*   a4[0]; h5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h5=reg128#13,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h5=q12,<a4=d10,<a4=d10
vmull.u32 q12,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q13,<_2a4=d17,<a4=d11
vmull.u32 q13,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#3%top,<a2=reg128#3%top
# asm 2: vmull.u32 >h3=q14,<a2=d5,<a2=d5
vmull.u32 q14,d5,d5

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q13,<_2a3=d15,<a3=d8
vmlal.u32 q13,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q11,<_2a4=d16,<a3=d8
vmlal.u32 q11,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q14,<_2a4=d17,<a3=d8
vmlal.u32 q14,d17,d8

# qhasm: h5[0,1] += _2a2[2] unsigned*   a3[0]; h5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a2=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h5=q12,<_2a2=d19,<a3=d8
vmlal.u32 q12,d19,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d19,<_2a3=d15
vmlal.u32 q10,d19,d15

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a3[2]; h5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h5=q12,<_2a4=d17,<_2a3=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q14,<_2a4=d16,<a3=d9
vmlal.u32 q14,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a4=d17,<_2a4=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d19,<a4=d10
vmlal.u32 q13,d19,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d19,<_2a4=d17
vmlal.u32 q11,d19,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#5,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q4,<h0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h1=q4,<h1=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q10,<mask26=q1
vand q5,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#1
# asm 2: vand >h1=q4,<h1=q4,<mask25=q0
vand q4,q4,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<h3=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#10,<h5=reg128#13,<t=reg128#10
# asm 2: vadd.i64 >h5=q9,<h5=q12,<t=q9
vadd.i64 q9,q12,q9

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#1
# asm 2: vand >h3=q8,<h3=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h5=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h5=q9,#25
vshr.u64 q10,q9,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#6,<t=reg128#11
# asm 2: vadd.i64 >h0=q5,<h0=q5,<t=q10
vadd.i64 q5,q5,q10

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#10,<h5=reg128#10,<mask25=reg128#1
# asm 2: vand >h5=q9,<h5=q9,<mask25=q0
vand q9,q9,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#11,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q10,<h0=q5,#26
vshr.u64 q10,q5,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#6,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q5,<mask26=q1
vand q5,q5,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#6,<h1=reg128#5
# asm 2: vtrn.32 <h0=q5,<h1=q4
vtrn.32 q5,q4

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#6%bot,<h0=reg128#6%top
# asm 2: vtrn.32 <h0=d10,<h0=d11
vtrn.32 d10,d11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#10%bot,<h5=reg128#10%top
# asm 2: vtrn.32 <h5=d18,<h5=d19
vtrn.32 d18,d19

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#6
# asm 2: vmov >a3=q4,<h0=q5
vmov q4,q5

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#8
# asm 2: vmov >a4=q5,<h2=q7
vmov q5,q7

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#3%top,<h5=reg128#10%bot
# asm 2: vmov <a2=d5,<h5=d18
vmov d5,d18

# qhasm: ctr -= 1
# asm 1: sub >ctr=int32#4,<ctr=int32#4,#1
# asm 2: sub >ctr=r3,<ctr=r3,#1
sub r3,r3,#1

# qhasm: unsigned>? ctr - 0
# asm 1: cmp <ctr=int32#4,#0
# asm 2: cmp <ctr=r3,#0
cmp r3,#0

# qhasm: goto loop5 if unsigned>
bhi ._loop5

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#4,<input_0=int32#1,#48
# asm 2: add >adr0=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#5%bot-<a3=reg128#5%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a3=d8-<a3=d9},[<adr0=r3,: 128]!
vst1.8 {d8-d9},[r3,: 128]!

# qhasm: mem128[adr0] aligned = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#6%bot-<a4=reg128#6%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a4=d10-<a4=d11},[<adr0=r3,: 128]!
vst1.8 {d10-d11},[r3,: 128]!

# qhasm: ptr1 -= 32				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: sub >ptr1=r2,<ptr1=r2,#32
sub r2,r2,#32

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#1%bot->b0=reg128#1%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d0->b0=d1},[<ptr1=r2,: 128]!
vld1.8 {d0-d1},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#5%bot->b1=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d8->b1=d9},[<ptr1=r2,: 128]!
vld1.8 {d8-d9},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#6%bot->b2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d10->b2=d11},[<ptr1=r2,: 128]!
vld1.8 {d10-d11},[r2,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q2,#1
vshl.i64 q9,q2,#1

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#11,<a0=reg128#4%bot,<b0=reg128#1%bot
# asm 2: vmull.u32 >r0=q10,<a0=d6,<b0=d0
vmull.u32 q10,d6,d0

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#12,<a0=reg128#4%top,<b0=reg128#1%bot
# asm 2: vmull.u32 >r1=q11,<a0=d7,<b0=d0
vmull.u32 q11,d7,d0

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#13,<a1=reg128#7%bot,<b0=reg128#1%bot
# asm 2: vmull.u32 >r2=q12,<a1=d12,<b0=d0
vmull.u32 q12,d12,d0

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#14,<a1=reg128#7%top,<b0=reg128#1%bot
# asm 2: vmull.u32 >r3=q13,<a1=d13,<b0=d0
vmull.u32 q13,d13,d0

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#15,<a2=reg128#3%bot,<b0=reg128#1%bot
# asm 2: vmull.u32 >r4=q14,<a2=d4,<b0=d0
vmull.u32 q14,d4,d0

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#11,<_2a2=reg128#10%bot,<b0=reg128#1%top
# asm 2: vmlal.u32 <r0=q10,<_2a2=d18,<b0=d1
vmlal.u32 q10,d18,d1

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#12,<a0=reg128#4%bot,<b0=reg128#1%top
# asm 2: vmlal.u32 <r1=q11,<a0=d6,<b0=d1
vmlal.u32 q11,d6,d1

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#13,<_2a0=reg128#8%top,<b0=reg128#1%top
# asm 2: vmlal.u32 <r2=q12,<_2a0=d15,<b0=d1
vmlal.u32 q12,d15,d1

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#14,<a1=reg128#7%bot,<b0=reg128#1%top
# asm 2: vmlal.u32 <r3=q13,<a1=d12,<b0=d1
vmlal.u32 q13,d12,d1

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#15,<_2a1=reg128#9%top,<b0=reg128#1%top
# asm 2: vmlal.u32 <r4=q14,<_2a1=d17,<b0=d1
vmlal.u32 q14,d17,d1

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#11,<_2a1=reg128#9%top,<b1=reg128#5%bot
# asm 2: vmlal.u32 <r0=q10,<_2a1=d17,<b1=d8
vmlal.u32 q10,d17,d8

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#12,<a2=reg128#3%bot,<b1=reg128#5%bot
# asm 2: vmlal.u32 <r1=q11,<a2=d4,<b1=d8
vmlal.u32 q11,d4,d8

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#13,<a0=reg128#4%bot,<b1=reg128#5%bot
# asm 2: vmlal.u32 <r2=q12,<a0=d6,<b1=d8
vmlal.u32 q12,d6,d8

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#14,<a0=reg128#4%top,<b1=reg128#5%bot
# asm 2: vmlal.u32 <r3=q13,<a0=d7,<b1=d8
vmlal.u32 q13,d7,d8

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#15,<a1=reg128#7%bot,<b1=reg128#5%bot
# asm 2: vmlal.u32 <r4=q14,<a1=d12,<b1=d8
vmlal.u32 q14,d12,d8

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#11,<_2a1=reg128#9%bot,<b1=reg128#5%top
# asm 2: vmlal.u32 <r0=q10,<_2a1=d16,<b1=d9
vmlal.u32 q10,d16,d9

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#12,<_2a1=reg128#9%top,<b1=reg128#5%top
# asm 2: vmlal.u32 <r1=q11,<_2a1=d17,<b1=d9
vmlal.u32 q11,d17,d9

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#13,<_2a2=reg128#10%bot,<b1=reg128#5%top
# asm 2: vmlal.u32 <r2=q12,<_2a2=d18,<b1=d9
vmlal.u32 q12,d18,d9

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#14,<a0=reg128#4%bot,<b1=reg128#5%top
# asm 2: vmlal.u32 <r3=q13,<a0=d6,<b1=d9
vmlal.u32 q13,d6,d9

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#15,<_2a0=reg128#8%top,<b1=reg128#5%top
# asm 2: vmlal.u32 <r4=q14,<_2a0=d15,<b1=d9
vmlal.u32 q14,d15,d9

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#11,<_2a0=reg128#8%top,<b2=reg128#6%bot
# asm 2: vmlal.u32 <r0=q10,<_2a0=d15,<b2=d10
vmlal.u32 q10,d15,d10

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#12,<a1=reg128#7%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <r1=q11,<a1=d12,<b2=d10
vmlal.u32 q11,d12,d10

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#13,<_2a1=reg128#9%top,<b2=reg128#6%bot
# asm 2: vmlal.u32 <r2=q12,<_2a1=d17,<b2=d10
vmlal.u32 q12,d17,d10

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#14,<a2=reg128#3%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <r3=q13,<a2=d4,<b2=d10
vmlal.u32 q13,d4,d10

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#15,<a0=reg128#4%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <r4=q14,<a0=d6,<b2=d10
vmlal.u32 q14,d6,d10

# qhasm: ptr1 -= 64					
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#64
# asm 2: sub >ptr1=r2,<ptr1=r2,#64
sub r2,r2,#64

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<r0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<r0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#12,<t=reg128#4
# asm 2: vadd.i64 >r1=q3,<r1=q11,<t=q3
vadd.i64 q3,q11,q3

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#11,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q10,<mask26=q1
vand q4,q10,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<r1=reg128#4,#25
# asm 2: vshr.u64 >t=q6,<r1=q3,#25
vshr.u64 q6,q3,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#7,<r2=reg128#13,<t=reg128#7
# asm 2: vadd.i64 >r2=q6,<r2=q12,<t=q6
vadd.i64 q6,q12,q6

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<r2=reg128#7,#26
# asm 2: vshr.u64 >t=q7,<r2=q6,#26
vshr.u64 q7,q6,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#8,<r3=reg128#14,<t=reg128#8
# asm 2: vadd.i64 >r3=q7,<r3=q13,<t=q7
vadd.i64 q7,q13,q7

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#7,<r2=reg128#7,<mask26=reg128#2
# asm 2: vand >r2=q6,<r2=q6,<mask26=q1
vand q6,q6,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<r3=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#8,<r3=reg128#8,<mask25=reg128#1
# asm 2: vand >r3=q7,<r3=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = r4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<r4=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<r4=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#1,<r4=reg128#9,<mask25=reg128#1
# asm 2: vand >r4=q0,<r4=q8,<mask25=q0
vand q0,q8,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#7,<r3=reg128#8
# asm 2: vtrn.32 <r2=q6,<r3=q7
vtrn.32 q6,q7

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#7%bot,<r2=reg128#7%top
# asm 2: vtrn.32 <r2=d12,<r2=d13
vtrn.32 d12,d13

# qhasm: ptr1 += 96				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#96
# asm 2: add >ptr1=r2,<ptr1=r2,#96
add r2,r2,#96

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#7%bot-<r2=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d12-<r2=d13},[<ptr1=r2,: 128]!
vst1.8 {d12-d13},[r2,: 128]!

# qhasm: adr1 = input_0 +48
# asm 1: add >adr1=int32#4,<input_0=int32#1,#48
# asm 2: add >adr1=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: ptr1 -= 64				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#64
# asm 2: sub >ptr1=r2,<ptr1=r2,#64
sub r2,r2,#64

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#7%bot->b3=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d12->b3=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#8%bot->b4=reg128#8%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d14->b4=d15},[<ptr1=r2,: 128]!
vld1.8 {d14-d15},[r2,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#9,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q8,<a3=q3,#1
vshl.i64 q8,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#11,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q10,<a4=q4,#1
vshl.i64 q10,q4,#1

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#4%bot,<b3=reg128#7%bot
# asm 2: vmull.u32 >r0=q11,<a3=d6,<b3=d12
vmull.u32 q11,d6,d12

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#4%top,<b3=reg128#7%bot
# asm 2: vmull.u32 >r1=q12,<a3=d7,<b3=d12
vmull.u32 q12,d7,d12

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#5%bot,<b3=reg128#7%bot
# asm 2: vmull.u32 >r2=q13,<a4=d8,<b3=d12
vmull.u32 q13,d8,d12

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#5%top,<b3=reg128#7%bot
# asm 2: vmull.u32 >r3=q14,<a4=d9,<b3=d12
vmull.u32 q14,d9,d12

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#3%top,<b3=reg128#7%bot
# asm 2: vmull.u32 >r5=q15,<a2=d5,<b3=d12
vmull.u32 q15,d5,d12

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#10%top,<b3=reg128#7%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d19,<b3=d13
vmlal.u32 q11,d19,d13

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#4%bot,<b3=reg128#7%top
# asm 2: vmlal.u32 <r1=q12,<a3=d6,<b3=d13
vmlal.u32 q12,d6,d13

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#9%top,<b3=reg128#7%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d17,<b3=d13
vmlal.u32 q13,d17,d13

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#5%bot,<b3=reg128#7%top
# asm 2: vmlal.u32 <r3=q14,<a4=d8,<b3=d13
vmlal.u32 q14,d8,d13

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#11%top,<b3=reg128#7%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d21,<b3=d13
vmlal.u32 q15,d21,d13

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#11%top,<b4=reg128#8%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d21,<b4=d14
vmlal.u32 q11,d21,d14

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#3%top,<b4=reg128#8%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d5,<b4=d14
vmlal.u32 q12,d5,d14

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#4%bot,<b4=reg128#8%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d6,<b4=d14
vmlal.u32 q13,d6,d14

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%top,<b4=reg128#8%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d7,<b4=d14
vmlal.u32 q14,d7,d14

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#5%bot,<b4=reg128#8%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d8,<b4=d14
vmlal.u32 q15,d8,d14

# qhasm: r0[0,1] += _2a4[0] unsigned* b4[2]; r0[2,3] += _2a4[1] unsigned* b4[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#11%bot,<b4=reg128#8%top
# asm 2: vmlal.u32 <r0=q11,<_2a4=d20,<b4=d15
vmlal.u32 q11,d20,d15

# qhasm: r1[0,1] += _2a4[2] unsigned* b4[2]; r1[2,3] += _2a4[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a4=reg128#11%top,<b4=reg128#8%top
# asm 2: vmlal.u32 <r1=q12,<_2a4=d21,<b4=d15
vmlal.u32 q12,d21,d15

# qhasm: r2[0,1] += _2a2[2] unsigned* b4[2]; r2[2,3] += _2a2[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#10%top,<b4=reg128#8%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d19,<b4=d15
vmlal.u32 q13,d19,d15

# qhasm: r3[0,1] +=   a3[0] unsigned* b4[2]; r3[2,3] +=   a3[1] unsigned* b4[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%bot,<b4=reg128#8%top
# asm 2: vmlal.u32 <r3=q14,<a3=d6,<b4=d15
vmlal.u32 q14,d6,d15

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#9%top,<b4=reg128#8%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d17,<b4=d15
vmlal.u32 q15,d17,d15

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#9%top,<b2=reg128#6%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d17,<b2=d11
vmlal.u32 q11,d17,d11

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#5%bot,<b2=reg128#6%top
# asm 2: vmlal.u32 <r1=q12,<a4=d8,<b2=d11
vmlal.u32 q12,d8,d11

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#11%top,<b2=reg128#6%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d21,<b2=d11
vmlal.u32 q13,d21,d11

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#3%top,<b2=reg128#6%top
# asm 2: vmlal.u32 <r3=q14,<a2=d5,<b2=d11
vmlal.u32 q14,d5,d11

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#4%bot,<b2=reg128#6%top
# asm 2: vmlal.u32 <r5=q15,<a3=d6,<b2=d11
vmlal.u32 q15,d6,d11

# qhasm: ptr1 -= 96					
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#96
# asm 2: sub >ptr1=r2,<ptr1=r2,#96
sub r2,r2,#96

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#3%bot->mask25=reg128#3%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d4->mask25=d5},[<ptr1=r2,: 128]
vld1.8 {d4-d5},[r2,: 128]

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
# asm 1: vand >r5=reg128#8,<r5=reg128#8,<mask25=reg128#3
# asm 2: vand >r5=q7,<r5=q7,<mask25=q2
vand q7,q7,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#1,<r5=reg128#8
# asm 2: vtrn.32 <r4=q0,<r5=q7
vtrn.32 q0,q7

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#1%bot,<r4=reg128#1%top
# asm 2: vtrn.32 <r4=d0,<r4=d1
vtrn.32 d0,d1

# qhasm: ptr1 += 128				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#128
# asm 2: add >ptr1=r2,<ptr1=r2,#128
add r2,r2,#128

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#1%bot-<r4=reg128#1%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d0-<r4=d1},[<ptr1=r2,: 128]!
vst1.8 {d0-d1},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#7%bot->a1=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d12->a1=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a2 = r4
# asm 1: vmov >a2=reg128#1,<r4=reg128#1
# asm 2: vmov >a2=q0,<r4=q0
vmov q0,q0

# qhasm: a3 = r0
# asm 1: vmov >a3=reg128#5,<r0=reg128#5
# asm 2: vmov >a3=q4,<r0=q4
vmov q4,q4

# qhasm: a4 = r2
# asm 1: vmov >a4=reg128#6,<r2=reg128#6
# asm 2: vmov >a4=q5,<r2=q5
vmov q5,q5

# qhasm: ctr = 10
# asm 1: ldr >ctr=int32#4,=10
# asm 2: ldr >ctr=r3,=10
ldr r3,=10

# qhasm: loop10:
._loop10:

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#1,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q0,#1
vshl.i64 q9,q0,#1

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q10,<a0=d6,<a0=d6
vmull.u32 q10,d6,d6

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a0=reg128#8%top,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q11,<_2a0=d15,<a0=d7
vmull.u32 q11,d15,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#7%bot,<a1=reg128#7%bot
# asm 2: vmull.u32 >h4=q12,<a1=d12,<a1=d12
vmull.u32 q12,d12,d12

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a1=reg128#9%top,<a1=reg128#7%top
# asm 2: vmull.u32 >h1=q13,<_2a1=d17,<a1=d13
vmull.u32 q13,d17,d13

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#1%bot,<a2=reg128#1%bot
# asm 2: vmull.u32 >h3=q14,<a2=d0,<a2=d0
vmull.u32 q14,d0,d0

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q13,<_2a0=d15,<a0=d6
vmlal.u32 q13,d15,d6

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a1=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q11,<_2a1=d16,<a0=d6
vmlal.u32 q11,d16,d6

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q14,<_2a1=d17,<a0=d6
vmlal.u32 q14,d17,d6

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#10%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d18,<a0=d6
vmlal.u32 q12,d18,d6

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%bot,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d18,<_2a0=d15
vmlal.u32 q10,d18,d15

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#9%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h4=q12,<_2a1=d17,<_2a0=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<_2a1=d16,<a0=d7
vmlal.u32 q14,d16,d7

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a1=reg128#9%top,<_2a1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a1=d17,<_2a1=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%bot,<a1=reg128#7%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d18,<a1=d12
vmlal.u32 q13,d18,d12

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%bot,<_2a1=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d18,<_2a1=d17
vmlal.u32 q11,d18,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<h0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#14,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q13,<t=q3
vadd.i64 q3,q13,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q10,<mask26=q1
vand q6,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q7,<h1=q3,#25
vshr.u64 q7,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#3
# asm 2: vand >h1=q3,<h1=q3,<mask25=q2
vand q3,q3,q2

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<h3=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#3
# asm 2: vand >h3=q8,<h3=q8,<mask25=q2
vand q8,q8,q2

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q11,<h4=q10,#25
vshr.u64 q11,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#7,<h0=reg128#7,<t=reg128#12
# asm 2: vadd.i64 >h0=q6,<h0=q6,<t=q11
vadd.i64 q6,q6,q11

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#3
# asm 2: vand >h4=q10,<h4=q10,<mask25=q2
vand q10,q10,q2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#7,#26
# asm 2: vshr.u64 >t=q11,<h0=q6,#26
vshr.u64 q11,q6,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#12
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q11
vadd.i64 q3,q3,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#7,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q6,<mask26=q1
vand q6,q6,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#7,<h1=reg128#4
# asm 2: vtrn.32 <h0=q6,<h1=q3
vtrn.32 q6,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#7%bot,<h0=reg128#7%top
# asm 2: vtrn.32 <h0=d12,<h0=d13
vtrn.32 d12,d13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: a0 = h0
# asm 1: vmov >a0=reg128#4,<h0=reg128#7
# asm 2: vmov >a0=q3,<h0=q6
vmov q3,q6

# qhasm: a1 = h2
# asm 1: vmov >a1=reg128#7,<h2=reg128#8
# asm 2: vmov >a1=q6,<h2=q7
vmov q6,q7

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#1%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d0,<h4=d20
vmov d0,d20

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q10,<a3=d8,<a3=d8
vmull.u32 q10,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q11,<_2a3=d15,<a3=d9
vmull.u32 q11,d15,d9

# qhasm: h5[0,1]  =   a4[0] unsigned*   a4[0]; h5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h5=reg128#13,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h5=q12,<a4=d10,<a4=d10
vmull.u32 q12,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q13,<_2a4=d17,<a4=d11
vmull.u32 q13,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#1%top,<a2=reg128#1%top
# asm 2: vmull.u32 >h3=q14,<a2=d1,<a2=d1
vmull.u32 q14,d1,d1

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q13,<_2a3=d15,<a3=d8
vmlal.u32 q13,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q11,<_2a4=d16,<a3=d8
vmlal.u32 q11,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q14,<_2a4=d17,<a3=d8
vmlal.u32 q14,d17,d8

# qhasm: h5[0,1] += _2a2[2] unsigned*   a3[0]; h5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a2=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h5=q12,<_2a2=d19,<a3=d8
vmlal.u32 q12,d19,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d19,<_2a3=d15
vmlal.u32 q10,d19,d15

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a3[2]; h5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h5=q12,<_2a4=d17,<_2a3=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q14,<_2a4=d16,<a3=d9
vmlal.u32 q14,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a4=d17,<_2a4=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d19,<a4=d10
vmlal.u32 q13,d19,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d19,<_2a4=d17
vmlal.u32 q11,d19,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#5,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q4,<h0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h1=q4,<h1=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q10,<mask26=q1
vand q5,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#3
# asm 2: vand >h1=q4,<h1=q4,<mask25=q2
vand q4,q4,q2

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<h3=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#10,<h5=reg128#13,<t=reg128#10
# asm 2: vadd.i64 >h5=q9,<h5=q12,<t=q9
vadd.i64 q9,q12,q9

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#3
# asm 2: vand >h3=q8,<h3=q8,<mask25=q2
vand q8,q8,q2

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h5=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h5=q9,#25
vshr.u64 q10,q9,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#6,<t=reg128#11
# asm 2: vadd.i64 >h0=q5,<h0=q5,<t=q10
vadd.i64 q5,q5,q10

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#10,<h5=reg128#10,<mask25=reg128#3
# asm 2: vand >h5=q9,<h5=q9,<mask25=q2
vand q9,q9,q2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#11,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q10,<h0=q5,#26
vshr.u64 q10,q5,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#6,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q5,<mask26=q1
vand q5,q5,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#6,<h1=reg128#5
# asm 2: vtrn.32 <h0=q5,<h1=q4
vtrn.32 q5,q4

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#6%bot,<h0=reg128#6%top
# asm 2: vtrn.32 <h0=d10,<h0=d11
vtrn.32 d10,d11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#10%bot,<h5=reg128#10%top
# asm 2: vtrn.32 <h5=d18,<h5=d19
vtrn.32 d18,d19

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#6
# asm 2: vmov >a3=q4,<h0=q5
vmov q4,q5

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#8
# asm 2: vmov >a4=q5,<h2=q7
vmov q5,q7

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#1%top,<h5=reg128#10%bot
# asm 2: vmov <a2=d1,<h5=d18
vmov d1,d18

# qhasm: ctr -= 1
# asm 1: sub >ctr=int32#4,<ctr=int32#4,#1
# asm 2: sub >ctr=r3,<ctr=r3,#1
sub r3,r3,#1

# qhasm: unsigned>? ctr - 0
# asm 1: cmp <ctr=int32#4,#0
# asm 2: cmp <ctr=r3,#0
cmp r3,#0

# qhasm: goto loop10 if unsigned>
bhi ._loop10

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#4,<input_0=int32#1,#48
# asm 2: add >adr0=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#5%bot-<a3=reg128#5%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a3=d8-<a3=d9},[<adr0=r3,: 128]!
vst1.8 {d8-d9},[r3,: 128]!

# qhasm: mem128[adr0] aligned = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#6%bot-<a4=reg128#6%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a4=d10-<a4=d11},[<adr0=r3,: 128]!
vst1.8 {d10-d11},[r3,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#5,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q4,<a0=q3,#1
vshl.i64 q4,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#6,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q5,<a1=q6,#1
vshl.i64 q5,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#1,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q0,#1
vshl.i64 q7,q0,#1

# qhasm: ptr1 -= 32				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: sub >ptr1=r2,<ptr1=r2,#32
sub r2,r2,#32

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<ptr1=r2,: 128]!
vld1.8 {d20-d21},[r2,: 128]!

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a0=reg128#4%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a0=d6,<b0=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a0=reg128#4%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a0=d7,<b0=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a1=reg128#7%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a1=d12,<b0=d16
vmull.u32 q13,d12,d16

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a1=reg128#7%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a1=d13,<b0=d16
vmull.u32 q14,d13,d16

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#16,<a2=reg128#1%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r4=q15,<a2=d0,<b0=d16
vmull.u32 q15,d0,d16

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d14,<b0=d17
vmlal.u32 q11,d14,d17

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a0=reg128#4%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a0=d6,<b0=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a0=reg128#5%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a0=d9,<b0=d17
vmlal.u32 q13,d9,d17

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a1=reg128#7%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a1=d12,<b0=d17
vmlal.u32 q14,d12,d17

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a1=reg128#6%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r4=q15,<_2a1=d11,<b0=d17
vmlal.u32 q15,d11,d17

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a1=d11,<b1=d18
vmlal.u32 q11,d11,d18

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#1%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d0,<b1=d18
vmlal.u32 q12,d0,d18

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a0=reg128#4%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a0=d6,<b1=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a0=d7,<b1=d18
vmlal.u32 q14,d7,d18

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a1=reg128#7%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r4=q15,<a1=d12,<b1=d18
vmlal.u32 q15,d12,d18

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a1=d10,<b1=d19
vmlal.u32 q11,d10,d19

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a1=reg128#6%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a1=d11,<b1=d19
vmlal.u32 q12,d11,d19

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d14,<b1=d19
vmlal.u32 q13,d14,d19

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a0=d6,<b1=d19
vmlal.u32 q14,d6,d19

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a0=reg128#5%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r4=q15,<_2a0=d9,<b1=d19
vmlal.u32 q15,d9,d19

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a0=reg128#5%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r0=q11,<_2a0=d9,<b2=d20
vmlal.u32 q11,d9,d20

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a1=reg128#7%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r1=q12,<a1=d12,<b2=d20
vmlal.u32 q12,d12,d20

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a1=reg128#6%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r2=q13,<_2a1=d11,<b2=d20
vmlal.u32 q13,d11,d20

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#1%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r3=q14,<a2=d0,<b2=d20
vmlal.u32 q14,d0,d20

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a0=reg128#4%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r4=q15,<a0=d6,<b2=d20
vmlal.u32 q15,d6,d20

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
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q8,<r3=q6,#25
vshr.u64 q8,q6,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#16,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q15,<t=q8
vadd.i64 q8,q15,q8

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#3
# asm 2: vand >r3=q6,<r3=q6,<mask25=q2
vand q6,q6,q2

# qhasm: 2x t = r4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<r4=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<r4=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#3,<r4=reg128#9,<mask25=reg128#3
# asm 2: vand >r4=q2,<r4=q8,<mask25=q2
vand q2,q8,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: ptr1 += 32				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: add >ptr1=r2,<ptr1=r2,#32
add r2,r2,#32

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: adr1 = input_0 + 48
# asm 1: add >adr1=int32#4,<input_0=int32#1,#48
# asm 2: add >adr1=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q4,#1
vshl.i64 q6,q4,#1

# qhasm: ptr1 -= 64				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#64
# asm 2: sub >ptr1=r2,<ptr1=r2,#64
sub r2,r2,#64

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#4%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a3=d6,<b3=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#4%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a3=d7,<b3=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#5%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a4=d8,<b3=d16
vmull.u32 q13,d8,d16

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#5%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a4=d9,<b3=d16
vmull.u32 q14,d9,d16

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#1%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r5=q15,<a2=d1,<b3=d16
vmull.u32 q15,d1,d16

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d15,<b3=d17
vmlal.u32 q11,d15,d17

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#4%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a3=d6,<b3=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#6%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d11,<b3=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#5%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a4=d8,<b3=d17
vmlal.u32 q14,d8,d17

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#7%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d13,<b3=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d13,<b4=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#1%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d1,<b4=d18
vmlal.u32 q12,d1,d18

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#4%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d6,<b4=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d7,<b4=d18
vmlal.u32 q14,d7,d18

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#5%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d8,<b4=d18
vmlal.u32 q15,d8,d18

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
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a3=d6,<b4=d19
vmlal.u32 q14,d6,d19

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#6%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d11,<b4=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#6%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d11,<b2=d21
vmlal.u32 q11,d11,d21

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#5%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r1=q12,<a4=d8,<b2=d21
vmlal.u32 q12,d8,d21

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#7%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d13,<b2=d21
vmlal.u32 q13,d13,d21

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#1%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r3=q14,<a2=d1,<b2=d21
vmlal.u32 q14,d1,d21

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#4%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r5=q15,<a3=d6,<b2=d21
vmlal.u32 q15,d6,d21

# qhasm: ptr1 -= 176				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#176
# asm 2: sub >ptr1=r2,<ptr1=r2,#176
sub r2,r2,#176

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

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
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

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
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#1
# asm 2: vand >r3=q6,<r3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r5=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<r5=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: r5 &= mask25
# asm 1: vand >r5=reg128#8,<r5=reg128#8,<mask25=reg128#1
# asm 2: vand >r5=q7,<r5=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#3,<r5=reg128#8
# asm 2: vtrn.32 <r4=q2,<r5=q7
vtrn.32 q2,q7

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#3%bot,<r4=reg128#3%top
# asm 2: vtrn.32 <r4=d4,<r4=d5
vtrn.32 d4,d5

# qhasm: ptr1 += 208				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#208
# asm 2: add >ptr1=r2,<ptr1=r2,#208
add r2,r2,#208

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#3%bot-<r4=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d4-<r4=d5},[<ptr1=r2,: 128]!
vst1.8 {d4-d5},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#7%bot->a1=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d12->a1=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a2 = r4
# asm 1: vmov >a2=reg128#3,<r4=reg128#3
# asm 2: vmov >a2=q2,<r4=q2
vmov q2,q2

# qhasm: a3 = r0
# asm 1: vmov >a3=reg128#5,<r0=reg128#5
# asm 2: vmov >a3=q4,<r0=q4
vmov q4,q4

# qhasm: a4 = r2
# asm 1: vmov >a4=reg128#6,<r2=reg128#6
# asm 2: vmov >a4=q5,<r2=q5
vmov q5,q5

# qhasm: ctr = 20
# asm 1: ldr >ctr=int32#4,=20
# asm 2: ldr >ctr=r3,=20
ldr r3,=20

# qhasm: loop20:
._loop20:

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q2,#1
vshl.i64 q9,q2,#1

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q10,<a0=d6,<a0=d6
vmull.u32 q10,d6,d6

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a0=reg128#8%top,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q11,<_2a0=d15,<a0=d7
vmull.u32 q11,d15,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#7%bot,<a1=reg128#7%bot
# asm 2: vmull.u32 >h4=q12,<a1=d12,<a1=d12
vmull.u32 q12,d12,d12

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a1=reg128#9%top,<a1=reg128#7%top
# asm 2: vmull.u32 >h1=q13,<_2a1=d17,<a1=d13
vmull.u32 q13,d17,d13

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#3%bot,<a2=reg128#3%bot
# asm 2: vmull.u32 >h3=q14,<a2=d4,<a2=d4
vmull.u32 q14,d4,d4

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q13,<_2a0=d15,<a0=d6
vmlal.u32 q13,d15,d6

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a1=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q11,<_2a1=d16,<a0=d6
vmlal.u32 q11,d16,d6

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q14,<_2a1=d17,<a0=d6
vmlal.u32 q14,d17,d6

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#10%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d18,<a0=d6
vmlal.u32 q12,d18,d6

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%bot,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d18,<_2a0=d15
vmlal.u32 q10,d18,d15

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#9%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h4=q12,<_2a1=d17,<_2a0=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<_2a1=d16,<a0=d7
vmlal.u32 q14,d16,d7

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a1=reg128#9%top,<_2a1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a1=d17,<_2a1=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%bot,<a1=reg128#7%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d18,<a1=d12
vmlal.u32 q13,d18,d12

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%bot,<_2a1=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d18,<_2a1=d17
vmlal.u32 q11,d18,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<h0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#14,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q13,<t=q3
vadd.i64 q3,q13,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q10,<mask26=q1
vand q6,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q7,<h1=q3,#25
vshr.u64 q7,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#1
# asm 2: vand >h1=q3,<h1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<h3=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#1
# asm 2: vand >h3=q8,<h3=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q11,<h4=q10,#25
vshr.u64 q11,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#7,<h0=reg128#7,<t=reg128#12
# asm 2: vadd.i64 >h0=q6,<h0=q6,<t=q11
vadd.i64 q6,q6,q11

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#1
# asm 2: vand >h4=q10,<h4=q10,<mask25=q0
vand q10,q10,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#7,#26
# asm 2: vshr.u64 >t=q11,<h0=q6,#26
vshr.u64 q11,q6,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#12
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q11
vadd.i64 q3,q3,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#7,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q6,<mask26=q1
vand q6,q6,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#7,<h1=reg128#4
# asm 2: vtrn.32 <h0=q6,<h1=q3
vtrn.32 q6,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#7%bot,<h0=reg128#7%top
# asm 2: vtrn.32 <h0=d12,<h0=d13
vtrn.32 d12,d13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: a0 = h0
# asm 1: vmov >a0=reg128#4,<h0=reg128#7
# asm 2: vmov >a0=q3,<h0=q6
vmov q3,q6

# qhasm: a1 = h2
# asm 1: vmov >a1=reg128#7,<h2=reg128#8
# asm 2: vmov >a1=q6,<h2=q7
vmov q6,q7

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#3%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d4,<h4=d20
vmov d4,d20

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q10,<a3=d8,<a3=d8
vmull.u32 q10,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q11,<_2a3=d15,<a3=d9
vmull.u32 q11,d15,d9

# qhasm: h5[0,1]  =   a4[0] unsigned*   a4[0]; h5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h5=reg128#13,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h5=q12,<a4=d10,<a4=d10
vmull.u32 q12,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q13,<_2a4=d17,<a4=d11
vmull.u32 q13,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#3%top,<a2=reg128#3%top
# asm 2: vmull.u32 >h3=q14,<a2=d5,<a2=d5
vmull.u32 q14,d5,d5

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q13,<_2a3=d15,<a3=d8
vmlal.u32 q13,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q11,<_2a4=d16,<a3=d8
vmlal.u32 q11,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q14,<_2a4=d17,<a3=d8
vmlal.u32 q14,d17,d8

# qhasm: h5[0,1] += _2a2[2] unsigned*   a3[0]; h5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a2=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h5=q12,<_2a2=d19,<a3=d8
vmlal.u32 q12,d19,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d19,<_2a3=d15
vmlal.u32 q10,d19,d15

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a3[2]; h5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h5=q12,<_2a4=d17,<_2a3=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q14,<_2a4=d16,<a3=d9
vmlal.u32 q14,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a4=d17,<_2a4=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d19,<a4=d10
vmlal.u32 q13,d19,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d19,<_2a4=d17
vmlal.u32 q11,d19,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#5,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q4,<h0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h1=q4,<h1=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q10,<mask26=q1
vand q5,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#1
# asm 2: vand >h1=q4,<h1=q4,<mask25=q0
vand q4,q4,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<h3=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#10,<h5=reg128#13,<t=reg128#10
# asm 2: vadd.i64 >h5=q9,<h5=q12,<t=q9
vadd.i64 q9,q12,q9

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#1
# asm 2: vand >h3=q8,<h3=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h5=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h5=q9,#25
vshr.u64 q10,q9,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#6,<t=reg128#11
# asm 2: vadd.i64 >h0=q5,<h0=q5,<t=q10
vadd.i64 q5,q5,q10

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#10,<h5=reg128#10,<mask25=reg128#1
# asm 2: vand >h5=q9,<h5=q9,<mask25=q0
vand q9,q9,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#11,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q10,<h0=q5,#26
vshr.u64 q10,q5,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#6,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q5,<mask26=q1
vand q5,q5,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#6,<h1=reg128#5
# asm 2: vtrn.32 <h0=q5,<h1=q4
vtrn.32 q5,q4

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#6%bot,<h0=reg128#6%top
# asm 2: vtrn.32 <h0=d10,<h0=d11
vtrn.32 d10,d11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#10%bot,<h5=reg128#10%top
# asm 2: vtrn.32 <h5=d18,<h5=d19
vtrn.32 d18,d19

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#6
# asm 2: vmov >a3=q4,<h0=q5
vmov q4,q5

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#8
# asm 2: vmov >a4=q5,<h2=q7
vmov q5,q7

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#3%top,<h5=reg128#10%bot
# asm 2: vmov <a2=d5,<h5=d18
vmov d5,d18

# qhasm: ctr -= 1
# asm 1: sub >ctr=int32#4,<ctr=int32#4,#1
# asm 2: sub >ctr=r3,<ctr=r3,#1
sub r3,r3,#1

# qhasm: unsigned>? ctr - 0
# asm 1: cmp <ctr=int32#4,#0
# asm 2: cmp <ctr=r3,#0
cmp r3,#0

# qhasm: goto loop20 if unsigned>
bhi ._loop20

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#4,<input_0=int32#1,#48
# asm 2: add >adr0=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#5%bot-<a3=reg128#5%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a3=d8-<a3=d9},[<adr0=r3,: 128]!
vst1.8 {d8-d9},[r3,: 128]!

# qhasm: mem128[adr0] aligned = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#6%bot-<a4=reg128#6%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a4=d10-<a4=d11},[<adr0=r3,: 128]!
vst1.8 {d10-d11},[r3,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#5,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q4,<a0=q3,#1
vshl.i64 q4,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#6,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q5,<a1=q6,#1
vshl.i64 q5,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q2,#1
vshl.i64 q7,q2,#1

# qhasm: ptr1 -= 32				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: sub >ptr1=r2,<ptr1=r2,#32
sub r2,r2,#32

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<ptr1=r2,: 128]!
vld1.8 {d20-d21},[r2,: 128]!

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a0=reg128#4%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a0=d6,<b0=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a0=reg128#4%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a0=d7,<b0=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a1=reg128#7%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a1=d12,<b0=d16
vmull.u32 q13,d12,d16

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a1=reg128#7%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a1=d13,<b0=d16
vmull.u32 q14,d13,d16

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#16,<a2=reg128#3%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r4=q15,<a2=d4,<b0=d16
vmull.u32 q15,d4,d16

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d14,<b0=d17
vmlal.u32 q11,d14,d17

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a0=reg128#4%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a0=d6,<b0=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a0=reg128#5%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a0=d9,<b0=d17
vmlal.u32 q13,d9,d17

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a1=reg128#7%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a1=d12,<b0=d17
vmlal.u32 q14,d12,d17

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a1=reg128#6%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r4=q15,<_2a1=d11,<b0=d17
vmlal.u32 q15,d11,d17

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a1=d11,<b1=d18
vmlal.u32 q11,d11,d18

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#3%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d4,<b1=d18
vmlal.u32 q12,d4,d18

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a0=reg128#4%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a0=d6,<b1=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a0=d7,<b1=d18
vmlal.u32 q14,d7,d18

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a1=reg128#7%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r4=q15,<a1=d12,<b1=d18
vmlal.u32 q15,d12,d18

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a1=d10,<b1=d19
vmlal.u32 q11,d10,d19

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a1=reg128#6%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a1=d11,<b1=d19
vmlal.u32 q12,d11,d19

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d14,<b1=d19
vmlal.u32 q13,d14,d19

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a0=d6,<b1=d19
vmlal.u32 q14,d6,d19

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a0=reg128#5%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r4=q15,<_2a0=d9,<b1=d19
vmlal.u32 q15,d9,d19

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a0=reg128#5%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r0=q11,<_2a0=d9,<b2=d20
vmlal.u32 q11,d9,d20

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a1=reg128#7%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r1=q12,<a1=d12,<b2=d20
vmlal.u32 q12,d12,d20

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a1=reg128#6%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r2=q13,<_2a1=d11,<b2=d20
vmlal.u32 q13,d11,d20

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#3%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r3=q14,<a2=d4,<b2=d20
vmlal.u32 q14,d4,d20

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a0=reg128#4%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r4=q15,<a0=d6,<b2=d20
vmlal.u32 q15,d6,d20

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
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

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
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#1,<r4=reg128#9,<mask25=reg128#1
# asm 2: vand >r4=q0,<r4=q8,<mask25=q0
vand q0,q8,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: ptr1 -= 128				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#128
# asm 2: sub >ptr1=r2,<ptr1=r2,#128
sub r2,r2,#128

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: adr1 = input_0 + 48
# asm 1: add >adr1=int32#4,<input_0=int32#1,#48
# asm 2: add >adr1=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q4,#1
vshl.i64 q6,q4,#1

# qhasm: ptr1 += 96				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#96
# asm 2: add >ptr1=r2,<ptr1=r2,#96
add r2,r2,#96

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#4%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a3=d6,<b3=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#4%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a3=d7,<b3=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#5%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a4=d8,<b3=d16
vmull.u32 q13,d8,d16

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#5%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a4=d9,<b3=d16
vmull.u32 q14,d9,d16

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#3%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r5=q15,<a2=d5,<b3=d16
vmull.u32 q15,d5,d16

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d15,<b3=d17
vmlal.u32 q11,d15,d17

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#4%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a3=d6,<b3=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#6%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d11,<b3=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#5%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a4=d8,<b3=d17
vmlal.u32 q14,d8,d17

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#7%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d13,<b3=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d13,<b4=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#3%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d5,<b4=d18
vmlal.u32 q12,d5,d18

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#4%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d6,<b4=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d7,<b4=d18
vmlal.u32 q14,d7,d18

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#5%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d8,<b4=d18
vmlal.u32 q15,d8,d18

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
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a3=d6,<b4=d19
vmlal.u32 q14,d6,d19

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#6%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d11,<b4=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#6%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d11,<b2=d21
vmlal.u32 q11,d11,d21

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#5%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r1=q12,<a4=d8,<b2=d21
vmlal.u32 q12,d8,d21

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#7%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d13,<b2=d21
vmlal.u32 q13,d13,d21

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#3%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r3=q14,<a2=d5,<b2=d21
vmlal.u32 q14,d5,d21

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#4%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r5=q15,<a3=d6,<b2=d21
vmlal.u32 q15,d6,d21

# qhasm: ptr1 -= 256			
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#256
# asm 2: sub >ptr1=r2,<ptr1=r2,#256
sub r2,r2,#256

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#3%bot->mask25=reg128#3%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d4->mask25=d5},[<ptr1=r2,: 128]
vld1.8 {d4-d5},[r2,: 128]

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
# asm 1: vand >r5=reg128#8,<r5=reg128#8,<mask25=reg128#3
# asm 2: vand >r5=q7,<r5=q7,<mask25=q2
vand q7,q7,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#1,<r5=reg128#8
# asm 2: vtrn.32 <r4=q0,<r5=q7
vtrn.32 q0,q7

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#1%bot,<r4=reg128#1%top
# asm 2: vtrn.32 <r4=d0,<r4=d1
vtrn.32 d0,d1

# qhasm: ptr1 += 128				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#128
# asm 2: add >ptr1=r2,<ptr1=r2,#128
add r2,r2,#128

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#1%bot-<r4=reg128#1%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d0-<r4=d1},[<ptr1=r2,: 128]!
vst1.8 {d0-d1},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#7%bot->a1=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d12->a1=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a2 = r4
# asm 1: vmov >a2=reg128#1,<r4=reg128#1
# asm 2: vmov >a2=q0,<r4=q0
vmov q0,q0

# qhasm: a3 = r0
# asm 1: vmov >a3=reg128#5,<r0=reg128#5
# asm 2: vmov >a3=q4,<r0=q4
vmov q4,q4

# qhasm: a4 = r2
# asm 1: vmov >a4=reg128#6,<r2=reg128#6
# asm 2: vmov >a4=q5,<r2=q5
vmov q5,q5

# qhasm: ctr = 40
# asm 1: ldr >ctr=int32#4,=40
# asm 2: ldr >ctr=r3,=40
ldr r3,=40

# qhasm: loop40:
._loop40:

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#1,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q0,#1
vshl.i64 q9,q0,#1

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q10,<a0=d6,<a0=d6
vmull.u32 q10,d6,d6

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a0=reg128#8%top,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q11,<_2a0=d15,<a0=d7
vmull.u32 q11,d15,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#7%bot,<a1=reg128#7%bot
# asm 2: vmull.u32 >h4=q12,<a1=d12,<a1=d12
vmull.u32 q12,d12,d12

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a1=reg128#9%top,<a1=reg128#7%top
# asm 2: vmull.u32 >h1=q13,<_2a1=d17,<a1=d13
vmull.u32 q13,d17,d13

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#1%bot,<a2=reg128#1%bot
# asm 2: vmull.u32 >h3=q14,<a2=d0,<a2=d0
vmull.u32 q14,d0,d0

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q13,<_2a0=d15,<a0=d6
vmlal.u32 q13,d15,d6

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a1=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q11,<_2a1=d16,<a0=d6
vmlal.u32 q11,d16,d6

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q14,<_2a1=d17,<a0=d6
vmlal.u32 q14,d17,d6

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#10%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d18,<a0=d6
vmlal.u32 q12,d18,d6

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%bot,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d18,<_2a0=d15
vmlal.u32 q10,d18,d15

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#9%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h4=q12,<_2a1=d17,<_2a0=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<_2a1=d16,<a0=d7
vmlal.u32 q14,d16,d7

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a1=reg128#9%top,<_2a1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a1=d17,<_2a1=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%bot,<a1=reg128#7%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d18,<a1=d12
vmlal.u32 q13,d18,d12

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%bot,<_2a1=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d18,<_2a1=d17
vmlal.u32 q11,d18,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<h0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#14,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q13,<t=q3
vadd.i64 q3,q13,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q10,<mask26=q1
vand q6,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q7,<h1=q3,#25
vshr.u64 q7,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#3
# asm 2: vand >h1=q3,<h1=q3,<mask25=q2
vand q3,q3,q2

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<h3=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#3
# asm 2: vand >h3=q8,<h3=q8,<mask25=q2
vand q8,q8,q2

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q11,<h4=q10,#25
vshr.u64 q11,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#7,<h0=reg128#7,<t=reg128#12
# asm 2: vadd.i64 >h0=q6,<h0=q6,<t=q11
vadd.i64 q6,q6,q11

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#3
# asm 2: vand >h4=q10,<h4=q10,<mask25=q2
vand q10,q10,q2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#7,#26
# asm 2: vshr.u64 >t=q11,<h0=q6,#26
vshr.u64 q11,q6,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#12
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q11
vadd.i64 q3,q3,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#7,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q6,<mask26=q1
vand q6,q6,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#7,<h1=reg128#4
# asm 2: vtrn.32 <h0=q6,<h1=q3
vtrn.32 q6,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#7%bot,<h0=reg128#7%top
# asm 2: vtrn.32 <h0=d12,<h0=d13
vtrn.32 d12,d13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: a0 = h0
# asm 1: vmov >a0=reg128#4,<h0=reg128#7
# asm 2: vmov >a0=q3,<h0=q6
vmov q3,q6

# qhasm: a1 = h2
# asm 1: vmov >a1=reg128#7,<h2=reg128#8
# asm 2: vmov >a1=q6,<h2=q7
vmov q6,q7

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#1%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d0,<h4=d20
vmov d0,d20

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q10,<a3=d8,<a3=d8
vmull.u32 q10,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q11,<_2a3=d15,<a3=d9
vmull.u32 q11,d15,d9

# qhasm: h5[0,1]  =   a4[0] unsigned*   a4[0]; h5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h5=reg128#13,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h5=q12,<a4=d10,<a4=d10
vmull.u32 q12,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q13,<_2a4=d17,<a4=d11
vmull.u32 q13,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#1%top,<a2=reg128#1%top
# asm 2: vmull.u32 >h3=q14,<a2=d1,<a2=d1
vmull.u32 q14,d1,d1

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q13,<_2a3=d15,<a3=d8
vmlal.u32 q13,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q11,<_2a4=d16,<a3=d8
vmlal.u32 q11,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q14,<_2a4=d17,<a3=d8
vmlal.u32 q14,d17,d8

# qhasm: h5[0,1] += _2a2[2] unsigned*   a3[0]; h5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a2=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h5=q12,<_2a2=d19,<a3=d8
vmlal.u32 q12,d19,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d19,<_2a3=d15
vmlal.u32 q10,d19,d15

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a3[2]; h5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h5=q12,<_2a4=d17,<_2a3=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q14,<_2a4=d16,<a3=d9
vmlal.u32 q14,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a4=d17,<_2a4=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d19,<a4=d10
vmlal.u32 q13,d19,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d19,<_2a4=d17
vmlal.u32 q11,d19,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#5,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q4,<h0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h1=q4,<h1=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q10,<mask26=q1
vand q5,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#3
# asm 2: vand >h1=q4,<h1=q4,<mask25=q2
vand q4,q4,q2

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<h3=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#10,<h5=reg128#13,<t=reg128#10
# asm 2: vadd.i64 >h5=q9,<h5=q12,<t=q9
vadd.i64 q9,q12,q9

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#3
# asm 2: vand >h3=q8,<h3=q8,<mask25=q2
vand q8,q8,q2

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h5=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h5=q9,#25
vshr.u64 q10,q9,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#6,<t=reg128#11
# asm 2: vadd.i64 >h0=q5,<h0=q5,<t=q10
vadd.i64 q5,q5,q10

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#10,<h5=reg128#10,<mask25=reg128#3
# asm 2: vand >h5=q9,<h5=q9,<mask25=q2
vand q9,q9,q2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#11,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q10,<h0=q5,#26
vshr.u64 q10,q5,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#6,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q5,<mask26=q1
vand q5,q5,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#6,<h1=reg128#5
# asm 2: vtrn.32 <h0=q5,<h1=q4
vtrn.32 q5,q4

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#6%bot,<h0=reg128#6%top
# asm 2: vtrn.32 <h0=d10,<h0=d11
vtrn.32 d10,d11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#10%bot,<h5=reg128#10%top
# asm 2: vtrn.32 <h5=d18,<h5=d19
vtrn.32 d18,d19

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#6
# asm 2: vmov >a3=q4,<h0=q5
vmov q4,q5

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#8
# asm 2: vmov >a4=q5,<h2=q7
vmov q5,q7

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#1%top,<h5=reg128#10%bot
# asm 2: vmov <a2=d1,<h5=d18
vmov d1,d18

# qhasm: ctr -= 1
# asm 1: sub >ctr=int32#4,<ctr=int32#4,#1
# asm 2: sub >ctr=r3,<ctr=r3,#1
sub r3,r3,#1

# qhasm: unsigned>? ctr - 0
# asm 1: cmp <ctr=int32#4,#0
# asm 2: cmp <ctr=r3,#0
cmp r3,#0

# qhasm: goto loop40 if unsigned>
bhi ._loop40

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#4,<input_0=int32#1,#48
# asm 2: add >adr0=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#5%bot-<a3=reg128#5%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a3=d8-<a3=d9},[<adr0=r3,: 128]!
vst1.8 {d8-d9},[r3,: 128]!

# qhasm: mem128[adr0] aligned = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#6%bot-<a4=reg128#6%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a4=d10-<a4=d11},[<adr0=r3,: 128]!
vst1.8 {d10-d11},[r3,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#5,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q4,<a0=q3,#1
vshl.i64 q4,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#6,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q5,<a1=q6,#1
vshl.i64 q5,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#1,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q0,#1
vshl.i64 q7,q0,#1

# qhasm: ptr1 -= 32				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: sub >ptr1=r2,<ptr1=r2,#32
sub r2,r2,#32

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<ptr1=r2,: 128]!
vld1.8 {d20-d21},[r2,: 128]!

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a0=reg128#4%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a0=d6,<b0=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a0=reg128#4%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a0=d7,<b0=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a1=reg128#7%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a1=d12,<b0=d16
vmull.u32 q13,d12,d16

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a1=reg128#7%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a1=d13,<b0=d16
vmull.u32 q14,d13,d16

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#16,<a2=reg128#1%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r4=q15,<a2=d0,<b0=d16
vmull.u32 q15,d0,d16

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d14,<b0=d17
vmlal.u32 q11,d14,d17

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a0=reg128#4%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a0=d6,<b0=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a0=reg128#5%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a0=d9,<b0=d17
vmlal.u32 q13,d9,d17

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a1=reg128#7%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a1=d12,<b0=d17
vmlal.u32 q14,d12,d17

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a1=reg128#6%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r4=q15,<_2a1=d11,<b0=d17
vmlal.u32 q15,d11,d17

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a1=d11,<b1=d18
vmlal.u32 q11,d11,d18

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#1%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d0,<b1=d18
vmlal.u32 q12,d0,d18

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a0=reg128#4%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a0=d6,<b1=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a0=d7,<b1=d18
vmlal.u32 q14,d7,d18

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a1=reg128#7%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r4=q15,<a1=d12,<b1=d18
vmlal.u32 q15,d12,d18

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a1=d10,<b1=d19
vmlal.u32 q11,d10,d19

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a1=reg128#6%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a1=d11,<b1=d19
vmlal.u32 q12,d11,d19

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d14,<b1=d19
vmlal.u32 q13,d14,d19

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a0=d6,<b1=d19
vmlal.u32 q14,d6,d19

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a0=reg128#5%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r4=q15,<_2a0=d9,<b1=d19
vmlal.u32 q15,d9,d19

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a0=reg128#5%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r0=q11,<_2a0=d9,<b2=d20
vmlal.u32 q11,d9,d20

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a1=reg128#7%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r1=q12,<a1=d12,<b2=d20
vmlal.u32 q12,d12,d20

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a1=reg128#6%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r2=q13,<_2a1=d11,<b2=d20
vmlal.u32 q13,d11,d20

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#1%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r3=q14,<a2=d0,<b2=d20
vmlal.u32 q14,d0,d20

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a0=reg128#4%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r4=q15,<a0=d6,<b2=d20
vmlal.u32 q15,d6,d20

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
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q8,<r3=q6,#25
vshr.u64 q8,q6,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#16,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q15,<t=q8
vadd.i64 q8,q15,q8

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#3
# asm 2: vand >r3=q6,<r3=q6,<mask25=q2
vand q6,q6,q2

# qhasm: 2x t = r4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<r4=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<r4=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#3,<r4=reg128#9,<mask25=reg128#3
# asm 2: vand >r4=q2,<r4=q8,<mask25=q2
vand q2,q8,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: ptr1 += 32				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: add >ptr1=r2,<ptr1=r2,#32
add r2,r2,#32

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: adr1 = input_0 + 48
# asm 1: add >adr1=int32#4,<input_0=int32#1,#48
# asm 2: add >adr1=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q4,#1
vshl.i64 q6,q4,#1

# qhasm: ptr1 -= 64				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#64
# asm 2: sub >ptr1=r2,<ptr1=r2,#64
sub r2,r2,#64

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#4%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a3=d6,<b3=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#4%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a3=d7,<b3=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#5%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a4=d8,<b3=d16
vmull.u32 q13,d8,d16

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#5%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a4=d9,<b3=d16
vmull.u32 q14,d9,d16

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#1%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r5=q15,<a2=d1,<b3=d16
vmull.u32 q15,d1,d16

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d15,<b3=d17
vmlal.u32 q11,d15,d17

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#4%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a3=d6,<b3=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#6%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d11,<b3=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#5%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a4=d8,<b3=d17
vmlal.u32 q14,d8,d17

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#7%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d13,<b3=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d13,<b4=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#1%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d1,<b4=d18
vmlal.u32 q12,d1,d18

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#4%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d6,<b4=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d7,<b4=d18
vmlal.u32 q14,d7,d18

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#5%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d8,<b4=d18
vmlal.u32 q15,d8,d18

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
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a3=d6,<b4=d19
vmlal.u32 q14,d6,d19

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#6%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d11,<b4=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#6%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d11,<b2=d21
vmlal.u32 q11,d11,d21

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#5%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r1=q12,<a4=d8,<b2=d21
vmlal.u32 q12,d8,d21

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#7%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d13,<b2=d21
vmlal.u32 q13,d13,d21

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#1%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r3=q14,<a2=d1,<b2=d21
vmlal.u32 q14,d1,d21

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#4%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r5=q15,<a3=d6,<b2=d21
vmlal.u32 q15,d6,d21

# qhasm: ptr1 -= 176				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#176
# asm 2: sub >ptr1=r2,<ptr1=r2,#176
sub r2,r2,#176

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

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
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

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
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#1
# asm 2: vand >r3=q6,<r3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r5=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<r5=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: r5 &= mask25
# asm 1: vand >r5=reg128#8,<r5=reg128#8,<mask25=reg128#1
# asm 2: vand >r5=q7,<r5=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#3,<r5=reg128#8
# asm 2: vtrn.32 <r4=q2,<r5=q7
vtrn.32 q2,q7

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#3%bot,<r4=reg128#3%top
# asm 2: vtrn.32 <r4=d4,<r4=d5
vtrn.32 d4,d5

# qhasm: ptr1 += 208				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#208
# asm 2: add >ptr1=r2,<ptr1=r2,#208
add r2,r2,#208

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#3%bot-<r4=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d4-<r4=d5},[<ptr1=r2,: 128]!
vst1.8 {d4-d5},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#7%bot->a1=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d12->a1=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a2 = r4
# asm 1: vmov >a2=reg128#3,<r4=reg128#3
# asm 2: vmov >a2=q2,<r4=q2
vmov q2,q2

# qhasm: a3 = r0
# asm 1: vmov >a3=reg128#5,<r0=reg128#5
# asm 2: vmov >a3=q4,<r0=q4
vmov q4,q4

# qhasm: a4 = r2
# asm 1: vmov >a4=reg128#6,<r2=reg128#6
# asm 2: vmov >a4=q5,<r2=q5
vmov q5,q5

# qhasm: ctr = 40
# asm 1: ldr >ctr=int32#4,=40
# asm 2: ldr >ctr=r3,=40
ldr r3,=40

# qhasm: loop40_:
._loop40_:

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q2,#1
vshl.i64 q9,q2,#1

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q10,<a0=d6,<a0=d6
vmull.u32 q10,d6,d6

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a0=reg128#8%top,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q11,<_2a0=d15,<a0=d7
vmull.u32 q11,d15,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#7%bot,<a1=reg128#7%bot
# asm 2: vmull.u32 >h4=q12,<a1=d12,<a1=d12
vmull.u32 q12,d12,d12

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a1=reg128#9%top,<a1=reg128#7%top
# asm 2: vmull.u32 >h1=q13,<_2a1=d17,<a1=d13
vmull.u32 q13,d17,d13

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#3%bot,<a2=reg128#3%bot
# asm 2: vmull.u32 >h3=q14,<a2=d4,<a2=d4
vmull.u32 q14,d4,d4

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q13,<_2a0=d15,<a0=d6
vmlal.u32 q13,d15,d6

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a1=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q11,<_2a1=d16,<a0=d6
vmlal.u32 q11,d16,d6

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q14,<_2a1=d17,<a0=d6
vmlal.u32 q14,d17,d6

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#10%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d18,<a0=d6
vmlal.u32 q12,d18,d6

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%bot,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d18,<_2a0=d15
vmlal.u32 q10,d18,d15

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#9%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h4=q12,<_2a1=d17,<_2a0=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<_2a1=d16,<a0=d7
vmlal.u32 q14,d16,d7

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a1=reg128#9%top,<_2a1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a1=d17,<_2a1=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%bot,<a1=reg128#7%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d18,<a1=d12
vmlal.u32 q13,d18,d12

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%bot,<_2a1=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d18,<_2a1=d17
vmlal.u32 q11,d18,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<h0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#14,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q13,<t=q3
vadd.i64 q3,q13,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q10,<mask26=q1
vand q6,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q7,<h1=q3,#25
vshr.u64 q7,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#1
# asm 2: vand >h1=q3,<h1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<h3=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#1
# asm 2: vand >h3=q8,<h3=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q11,<h4=q10,#25
vshr.u64 q11,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#7,<h0=reg128#7,<t=reg128#12
# asm 2: vadd.i64 >h0=q6,<h0=q6,<t=q11
vadd.i64 q6,q6,q11

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#1
# asm 2: vand >h4=q10,<h4=q10,<mask25=q0
vand q10,q10,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#7,#26
# asm 2: vshr.u64 >t=q11,<h0=q6,#26
vshr.u64 q11,q6,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#12
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q11
vadd.i64 q3,q3,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#7,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q6,<mask26=q1
vand q6,q6,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#7,<h1=reg128#4
# asm 2: vtrn.32 <h0=q6,<h1=q3
vtrn.32 q6,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#7%bot,<h0=reg128#7%top
# asm 2: vtrn.32 <h0=d12,<h0=d13
vtrn.32 d12,d13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: a0 = h0
# asm 1: vmov >a0=reg128#4,<h0=reg128#7
# asm 2: vmov >a0=q3,<h0=q6
vmov q3,q6

# qhasm: a1 = h2
# asm 1: vmov >a1=reg128#7,<h2=reg128#8
# asm 2: vmov >a1=q6,<h2=q7
vmov q6,q7

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#3%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d4,<h4=d20
vmov d4,d20

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q10,<a3=d8,<a3=d8
vmull.u32 q10,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q11,<_2a3=d15,<a3=d9
vmull.u32 q11,d15,d9

# qhasm: h5[0,1]  =   a4[0] unsigned*   a4[0]; h5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h5=reg128#13,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h5=q12,<a4=d10,<a4=d10
vmull.u32 q12,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q13,<_2a4=d17,<a4=d11
vmull.u32 q13,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#3%top,<a2=reg128#3%top
# asm 2: vmull.u32 >h3=q14,<a2=d5,<a2=d5
vmull.u32 q14,d5,d5

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q13,<_2a3=d15,<a3=d8
vmlal.u32 q13,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q11,<_2a4=d16,<a3=d8
vmlal.u32 q11,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q14,<_2a4=d17,<a3=d8
vmlal.u32 q14,d17,d8

# qhasm: h5[0,1] += _2a2[2] unsigned*   a3[0]; h5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a2=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h5=q12,<_2a2=d19,<a3=d8
vmlal.u32 q12,d19,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d19,<_2a3=d15
vmlal.u32 q10,d19,d15

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a3[2]; h5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h5=q12,<_2a4=d17,<_2a3=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q14,<_2a4=d16,<a3=d9
vmlal.u32 q14,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a4=d17,<_2a4=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d19,<a4=d10
vmlal.u32 q13,d19,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d19,<_2a4=d17
vmlal.u32 q11,d19,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#5,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q4,<h0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h1=q4,<h1=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q10,<mask26=q1
vand q5,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#1
# asm 2: vand >h1=q4,<h1=q4,<mask25=q0
vand q4,q4,q0

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<h3=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#10,<h5=reg128#13,<t=reg128#10
# asm 2: vadd.i64 >h5=q9,<h5=q12,<t=q9
vadd.i64 q9,q12,q9

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#1
# asm 2: vand >h3=q8,<h3=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h5=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h5=q9,#25
vshr.u64 q10,q9,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#6,<t=reg128#11
# asm 2: vadd.i64 >h0=q5,<h0=q5,<t=q10
vadd.i64 q5,q5,q10

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#10,<h5=reg128#10,<mask25=reg128#1
# asm 2: vand >h5=q9,<h5=q9,<mask25=q0
vand q9,q9,q0

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#11,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q10,<h0=q5,#26
vshr.u64 q10,q5,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#6,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q5,<mask26=q1
vand q5,q5,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#6,<h1=reg128#5
# asm 2: vtrn.32 <h0=q5,<h1=q4
vtrn.32 q5,q4

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#6%bot,<h0=reg128#6%top
# asm 2: vtrn.32 <h0=d10,<h0=d11
vtrn.32 d10,d11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#10%bot,<h5=reg128#10%top
# asm 2: vtrn.32 <h5=d18,<h5=d19
vtrn.32 d18,d19

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#6
# asm 2: vmov >a3=q4,<h0=q5
vmov q4,q5

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#8
# asm 2: vmov >a4=q5,<h2=q7
vmov q5,q7

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#3%top,<h5=reg128#10%bot
# asm 2: vmov <a2=d5,<h5=d18
vmov d5,d18

# qhasm: ctr -= 1
# asm 1: sub >ctr=int32#4,<ctr=int32#4,#1
# asm 2: sub >ctr=r3,<ctr=r3,#1
sub r3,r3,#1

# qhasm: unsigned>? ctr - 0
# asm 1: cmp <ctr=int32#4,#0
# asm 2: cmp <ctr=r3,#0
cmp r3,#0

# qhasm: goto loop40_ if unsigned>
bhi ._loop40_

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#4,<input_0=int32#1,#48
# asm 2: add >adr0=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#5%bot-<a3=reg128#5%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a3=d8-<a3=d9},[<adr0=r3,: 128]!
vst1.8 {d8-d9},[r3,: 128]!

# qhasm: mem128[adr0] aligned = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#6%bot-<a4=reg128#6%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a4=d10-<a4=d11},[<adr0=r3,: 128]!
vst1.8 {d10-d11},[r3,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#5,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q4,<a0=q3,#1
vshl.i64 q4,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#6,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q5,<a1=q6,#1
vshl.i64 q5,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q2,#1
vshl.i64 q7,q2,#1

# qhasm: ptr1 -= 112				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#112
# asm 2: sub >ptr1=r2,<ptr1=r2,#112
sub r2,r2,#112

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<ptr1=r2,: 128]!
vld1.8 {d20-d21},[r2,: 128]!

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a0=reg128#4%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a0=d6,<b0=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a0=reg128#4%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a0=d7,<b0=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a1=reg128#7%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a1=d12,<b0=d16
vmull.u32 q13,d12,d16

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a1=reg128#7%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a1=d13,<b0=d16
vmull.u32 q14,d13,d16

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#16,<a2=reg128#3%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r4=q15,<a2=d4,<b0=d16
vmull.u32 q15,d4,d16

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d14,<b0=d17
vmlal.u32 q11,d14,d17

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a0=reg128#4%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a0=d6,<b0=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a0=reg128#5%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a0=d9,<b0=d17
vmlal.u32 q13,d9,d17

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a1=reg128#7%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a1=d12,<b0=d17
vmlal.u32 q14,d12,d17

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a1=reg128#6%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r4=q15,<_2a1=d11,<b0=d17
vmlal.u32 q15,d11,d17

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a1=d11,<b1=d18
vmlal.u32 q11,d11,d18

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#3%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d4,<b1=d18
vmlal.u32 q12,d4,d18

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a0=reg128#4%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a0=d6,<b1=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a0=d7,<b1=d18
vmlal.u32 q14,d7,d18

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a1=reg128#7%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r4=q15,<a1=d12,<b1=d18
vmlal.u32 q15,d12,d18

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a1=d10,<b1=d19
vmlal.u32 q11,d10,d19

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a1=reg128#6%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a1=d11,<b1=d19
vmlal.u32 q12,d11,d19

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d14,<b1=d19
vmlal.u32 q13,d14,d19

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a0=d6,<b1=d19
vmlal.u32 q14,d6,d19

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a0=reg128#5%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r4=q15,<_2a0=d9,<b1=d19
vmlal.u32 q15,d9,d19

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a0=reg128#5%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r0=q11,<_2a0=d9,<b2=d20
vmlal.u32 q11,d9,d20

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a1=reg128#7%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r1=q12,<a1=d12,<b2=d20
vmlal.u32 q12,d12,d20

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a1=reg128#6%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r2=q13,<_2a1=d11,<b2=d20
vmlal.u32 q13,d11,d20

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#3%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r3=q14,<a2=d4,<b2=d20
vmlal.u32 q14,d4,d20

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a0=reg128#4%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r4=q15,<a0=d6,<b2=d20
vmlal.u32 q15,d6,d20

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
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

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
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#1,<r4=reg128#9,<mask25=reg128#1
# asm 2: vand >r4=q0,<r4=q8,<mask25=q0
vand q0,q8,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: ptr1 += 112				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#112
# asm 2: add >ptr1=r2,<ptr1=r2,#112
add r2,r2,#112

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: adr1 = input_0 + 48
# asm 1: add >adr1=int32#4,<input_0=int32#1,#48
# asm 2: add >adr1=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q4,#1
vshl.i64 q6,q4,#1

# qhasm: ptr1 -= 144				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#144
# asm 2: sub >ptr1=r2,<ptr1=r2,#144
sub r2,r2,#144

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#4%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a3=d6,<b3=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#4%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a3=d7,<b3=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#5%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a4=d8,<b3=d16
vmull.u32 q13,d8,d16

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#5%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a4=d9,<b3=d16
vmull.u32 q14,d9,d16

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#3%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r5=q15,<a2=d5,<b3=d16
vmull.u32 q15,d5,d16

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d15,<b3=d17
vmlal.u32 q11,d15,d17

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#4%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a3=d6,<b3=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#6%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d11,<b3=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#5%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a4=d8,<b3=d17
vmlal.u32 q14,d8,d17

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#7%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d13,<b3=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d13,<b4=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#3%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d5,<b4=d18
vmlal.u32 q12,d5,d18

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#4%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d6,<b4=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d7,<b4=d18
vmlal.u32 q14,d7,d18

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#5%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d8,<b4=d18
vmlal.u32 q15,d8,d18

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
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a3=d6,<b4=d19
vmlal.u32 q14,d6,d19

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#6%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d11,<b4=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#6%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d11,<b2=d21
vmlal.u32 q11,d11,d21

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#5%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r1=q12,<a4=d8,<b2=d21
vmlal.u32 q12,d8,d21

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#7%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d13,<b2=d21
vmlal.u32 q13,d13,d21

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#3%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r3=q14,<a2=d5,<b2=d21
vmlal.u32 q14,d5,d21

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#4%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r5=q15,<a3=d6,<b2=d21
vmlal.u32 q15,d6,d21

# qhasm: ptr1 -= 176				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#176
# asm 2: sub >ptr1=r2,<ptr1=r2,#176
sub r2,r2,#176

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#3%bot->mask25=reg128#3%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d4->mask25=d5},[<ptr1=r2,: 128]
vld1.8 {d4-d5},[r2,: 128]

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
# asm 1: vand >r5=reg128#8,<r5=reg128#8,<mask25=reg128#3
# asm 2: vand >r5=q7,<r5=q7,<mask25=q2
vand q7,q7,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#1,<r5=reg128#8
# asm 2: vtrn.32 <r4=q0,<r5=q7
vtrn.32 q0,q7

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#1%bot,<r4=reg128#1%top
# asm 2: vtrn.32 <r4=d0,<r4=d1
vtrn.32 d0,d1

# qhasm: ptr1 += 288				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#288
# asm 2: add >ptr1=r2,<ptr1=r2,#288
add r2,r2,#288

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#1%bot-<r4=reg128#1%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d0-<r4=d1},[<ptr1=r2,: 128]!
vst1.8 {d0-d1},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#7%bot->a1=reg128#7%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d12->a1=d13},[<ptr1=r2,: 128]!
vld1.8 {d12-d13},[r2,: 128]!

# qhasm: a2 = r4
# asm 1: vmov >a2=reg128#1,<r4=reg128#1
# asm 2: vmov >a2=q0,<r4=q0
vmov q0,q0

# qhasm: a3 = r0
# asm 1: vmov >a3=reg128#5,<r0=reg128#5
# asm 2: vmov >a3=q4,<r0=q4
vmov q4,q4

# qhasm: a4 = r2
# asm 1: vmov >a4=reg128#6,<r2=reg128#6
# asm 2: vmov >a4=q5,<r2=q5
vmov q5,q5

# qhasm: ctr = 5
# asm 1: ldr >ctr=int32#4,=5
# asm 2: ldr >ctr=r3,=5
ldr r3,=5

# qhasm: loop5_:
._loop5_:

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#8,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q7,<a0=q3,#1
vshl.i64 q7,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#9,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q8,<a1=q6,#1
vshl.i64 q8,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#10,<a2=reg128#1,#1
# asm 2: vshl.i64 >_2a2=q9,<a2=q0,#1
vshl.i64 q9,q0,#1

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q10,<a0=d6,<a0=d6
vmull.u32 q10,d6,d6

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a0[2]; h2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a0=reg128#8%top,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q11,<_2a0=d15,<a0=d7
vmull.u32 q11,d15,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#7%bot,<a1=reg128#7%bot
# asm 2: vmull.u32 >h4=q12,<a1=d12,<a1=d12
vmull.u32 q12,d12,d12

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a1=reg128#9%top,<a1=reg128#7%top
# asm 2: vmull.u32 >h1=q13,<_2a1=d17,<a1=d13
vmull.u32 q13,d17,d13

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#1%bot,<a2=reg128#1%bot
# asm 2: vmull.u32 >h3=q14,<a2=d0,<a2=d0
vmull.u32 q14,d0,d0

# qhasm: h1[0,1] += _2a0[2] unsigned*   a0[0]; h1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q13,<_2a0=d15,<a0=d6
vmlal.u32 q13,d15,d6

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a1=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q11,<_2a1=d16,<a0=d6
vmlal.u32 q11,d16,d6

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q14,<_2a1=d17,<a0=d6
vmlal.u32 q14,d17,d6

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#10%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d18,<a0=d6
vmlal.u32 q12,d18,d6

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[2]; h0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%bot,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d18,<_2a0=d15
vmlal.u32 q10,d18,d15

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[2]; h4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#9%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h4=q12,<_2a1=d17,<_2a0=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a1=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q14,<_2a1=d16,<a0=d7
vmlal.u32 q14,d16,d7

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a1=reg128#9%top,<_2a1=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a1=d17,<_2a1=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%bot,<a1=reg128#7%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d18,<a1=d12
vmlal.u32 q13,d18,d12

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%bot,<_2a1=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d18,<_2a1=d17
vmlal.u32 q11,d18,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q3,<h0=q10,#26
vshr.u64 q3,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#14,<t=reg128#4
# asm 2: vadd.i64 >h1=q3,<h1=q13,<t=q3
vadd.i64 q3,q13,q3

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q10,<mask26=q1
vand q6,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#4,#25
# asm 2: vshr.u64 >t=q7,<h1=q3,#25
vshr.u64 q7,q3,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#4,<h1=reg128#4,<mask25=reg128#3
# asm 2: vand >h1=q3,<h1=q3,<mask25=q2
vand q3,q3,q2

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q10,<h3=q8,#25
vshr.u64 q10,q8,#25

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#3
# asm 2: vand >h3=q8,<h3=q8,<mask25=q2
vand q8,q8,q2

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q11,<h4=q10,#25
vshr.u64 q11,q10,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#7,<h0=reg128#7,<t=reg128#12
# asm 2: vadd.i64 >h0=q6,<h0=q6,<t=q11
vadd.i64 q6,q6,q11

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#3
# asm 2: vand >h4=q10,<h4=q10,<mask25=q2
vand q10,q10,q2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#7,#26
# asm 2: vshr.u64 >t=q11,<h0=q6,#26
vshr.u64 q11,q6,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#4,<h1=reg128#4,<t=reg128#12
# asm 2: vadd.i64 >h1=q3,<h1=q3,<t=q11
vadd.i64 q3,q3,q11

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#7,<h0=reg128#7,<mask26=reg128#2
# asm 2: vand >h0=q6,<h0=q6,<mask26=q1
vand q6,q6,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#7,<h1=reg128#4
# asm 2: vtrn.32 <h0=q6,<h1=q3
vtrn.32 q6,q3

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#7%bot,<h0=reg128#7%top
# asm 2: vtrn.32 <h0=d12,<h0=d13
vtrn.32 d12,d13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: a0 = h0
# asm 1: vmov >a0=reg128#4,<h0=reg128#7
# asm 2: vmov >a0=q3,<h0=q6
vmov q3,q6

# qhasm: a1 = h2
# asm 1: vmov >a1=reg128#7,<h2=reg128#8
# asm 2: vmov >a1=q6,<h2=q7
vmov q6,q7

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#1%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d0,<h4=d20
vmov d0,d20

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#8,<a3=reg128#5,#1
# asm 2: vshl.i64 >_2a3=q7,<a3=q4,#1
vshl.i64 q7,q4,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#9,<a4=reg128#6,#1
# asm 2: vshl.i64 >_2a4=q8,<a4=q5,#1
vshl.i64 q8,q5,#1

# qhasm: h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >h0=reg128#11,<a3=reg128#5%bot,<a3=reg128#5%bot
# asm 2: vmull.u32 >h0=q10,<a3=d8,<a3=d8
vmull.u32 q10,d8,d8

# qhasm: h2[0,1]  = _2a3[2] unsigned*   a3[2]; h2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >h2=reg128#12,<_2a3=reg128#8%top,<a3=reg128#5%top
# asm 2: vmull.u32 >h2=q11,<_2a3=d15,<a3=d9
vmull.u32 q11,d15,d9

# qhasm: h5[0,1]  =   a4[0] unsigned*   a4[0]; h5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >h5=reg128#13,<a4=reg128#6%bot,<a4=reg128#6%bot
# asm 2: vmull.u32 >h5=q12,<a4=d10,<a4=d10
vmull.u32 q12,d10,d10

# qhasm: h1[0,1]  = _2a4[2] unsigned*   a4[2]; h1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >h1=reg128#14,<_2a4=reg128#9%top,<a4=reg128#6%top
# asm 2: vmull.u32 >h1=q13,<_2a4=d17,<a4=d11
vmull.u32 q13,d17,d11

# qhasm: h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >h3=reg128#15,<a2=reg128#1%top,<a2=reg128#1%top
# asm 2: vmull.u32 >h3=q14,<a2=d1,<a2=d1
vmull.u32 q14,d1,d1

# qhasm: h1[0,1] += _2a3[2] unsigned*   a3[0]; h1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a3=reg128#8%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h1=q13,<_2a3=d15,<a3=d8
vmlal.u32 q13,d15,d8

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a4=reg128#9%bot,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h2=q11,<_2a4=d16,<a3=d8
vmlal.u32 q11,d16,d8

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h3=q14,<_2a4=d17,<a3=d8
vmlal.u32 q14,d17,d8

# qhasm: h5[0,1] += _2a2[2] unsigned*   a3[0]; h5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a2=reg128#10%top,<a3=reg128#5%bot
# asm 2: vmlal.u32 <h5=q12,<_2a2=d19,<a3=d8
vmlal.u32 q12,d19,d8

# qhasm: h0[0,1] += _2a2[2] unsigned* _2a3[2]; h0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a2=reg128#10%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h0=q10,<_2a2=d19,<_2a3=d15
vmlal.u32 q10,d19,d15

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a3[2]; h5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <h5=reg128#13,<_2a4=reg128#9%top,<_2a3=reg128#8%top
# asm 2: vmlal.u32 <h5=q12,<_2a4=d17,<_2a3=d15
vmlal.u32 q12,d17,d15

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <h3=reg128#15,<_2a4=reg128#9%bot,<a3=reg128#5%top
# asm 2: vmlal.u32 <h3=q14,<_2a4=d16,<a3=d9
vmlal.u32 q14,d16,d9

# qhasm: h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <h0=reg128#11,<_2a4=reg128#9%top,<_2a4=reg128#9%bot
# asm 2: vmlal.u32 <h0=q10,<_2a4=d17,<_2a4=d16
vmlal.u32 q10,d17,d16

# qhasm: h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <h1=reg128#14,<_2a2=reg128#10%top,<a4=reg128#6%bot
# asm 2: vmlal.u32 <h1=q13,<_2a2=d19,<a4=d10
vmlal.u32 q13,d19,d10

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <h2=reg128#12,<_2a2=reg128#10%top,<_2a4=reg128#9%top
# asm 2: vmlal.u32 <h2=q11,<_2a2=d19,<_2a4=d17
vmlal.u32 q11,d19,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#5,<h0=reg128#11,#26
# asm 2: vshr.u64 >t=q4,<h0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#14,<t=reg128#5
# asm 2: vadd.i64 >h1=q4,<h1=q13,<t=q4
vadd.i64 q4,q13,q4

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#11,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q10,<mask26=q1
vand q5,q10,q1

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#12,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q11,<t=q7
vadd.i64 q7,q11,q7

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#3
# asm 2: vand >h1=q4,<h1=q4,<mask25=q2
vand q4,q4,q2

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q8,<h2=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#15,<t=reg128#9
# asm 2: vadd.i64 >h3=q8,<h3=q14,<t=q8
vadd.i64 q8,q14,q8

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#2
# asm 2: vand >h2=q7,<h2=q7,<mask26=q1
vand q7,q7,q1

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<h3=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#10,<h5=reg128#13,<t=reg128#10
# asm 2: vadd.i64 >h5=q9,<h5=q12,<t=q9
vadd.i64 q9,q12,q9

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#3
# asm 2: vand >h3=q8,<h3=q8,<mask25=q2
vand q8,q8,q2

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h5=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h5=q9,#25
vshr.u64 q10,q9,#25

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#6,<t=reg128#11
# asm 2: vadd.i64 >h0=q5,<h0=q5,<t=q10
vadd.i64 q5,q5,q10

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#10,<h5=reg128#10,<mask25=reg128#3
# asm 2: vand >h5=q9,<h5=q9,<mask25=q2
vand q9,q9,q2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#11,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q10,<h0=q5,#26
vshr.u64 q10,q5,#26

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#11
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q10
vadd.i64 q4,q4,q10

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#6,<h0=reg128#6,<mask26=reg128#2
# asm 2: vand >h0=q5,<h0=q5,<mask26=q1
vand q5,q5,q1

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#6,<h1=reg128#5
# asm 2: vtrn.32 <h0=q5,<h1=q4
vtrn.32 q5,q4

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#6%bot,<h0=reg128#6%top
# asm 2: vtrn.32 <h0=d10,<h0=d11
vtrn.32 d10,d11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#9
# asm 2: vtrn.32 <h2=q7,<h3=q8
vtrn.32 q7,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#10%bot,<h5=reg128#10%top
# asm 2: vtrn.32 <h5=d18,<h5=d19
vtrn.32 d18,d19

# qhasm: a3 = h0
# asm 1: vmov >a3=reg128#5,<h0=reg128#6
# asm 2: vmov >a3=q4,<h0=q5
vmov q4,q5

# qhasm: a4 = h2
# asm 1: vmov >a4=reg128#6,<h2=reg128#8
# asm 2: vmov >a4=q5,<h2=q7
vmov q5,q7

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#1%top,<h5=reg128#10%bot
# asm 2: vmov <a2=d1,<h5=d18
vmov d1,d18

# qhasm: ctr -= 1
# asm 1: sub >ctr=int32#4,<ctr=int32#4,#1
# asm 2: sub >ctr=r3,<ctr=r3,#1
sub r3,r3,#1

# qhasm: unsigned>? ctr - 0
# asm 1: cmp <ctr=int32#4,#0
# asm 2: cmp <ctr=r3,#0
cmp r3,#0

# qhasm: goto loop5_ if unsigned>
bhi ._loop5_

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#4,<input_0=int32#1,#48
# asm 2: add >adr0=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#5%bot-<a3=reg128#5%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a3=d8-<a3=d9},[<adr0=r3,: 128]!
vst1.8 {d8-d9},[r3,: 128]!

# qhasm: mem128[adr0] aligned = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#6%bot-<a4=reg128#6%top},[<adr0=int32#4,: 128]!
# asm 2: vst1.8 {<a4=d10-<a4=d11},[<adr0=r3,: 128]!
vst1.8 {d10-d11},[r3,: 128]!

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#5,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q4,<a0=q3,#1
vshl.i64 q4,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#6,<a1=reg128#7,#1
# asm 2: vshl.i64 >_2a1=q5,<a1=q6,#1
vshl.i64 q5,q6,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#1,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q0,#1
vshl.i64 q7,q0,#1

# qhasm: ptr1 -= 272				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#272
# asm 2: sub >ptr1=r2,<ptr1=r2,#272
sub r2,r2,#272

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<ptr1=r2,: 128]!
vld1.8 {d20-d21},[r2,: 128]!

# qhasm: r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a0=reg128#4%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a0=d6,<b0=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a0=reg128#4%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a0=d7,<b0=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a1=reg128#7%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a1=d12,<b0=d16
vmull.u32 q13,d12,d16

# qhasm: r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a1=reg128#7%top,<b0=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a1=d13,<b0=d16
vmull.u32 q14,d13,d16

# qhasm: r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		
# asm 1: vmull.u32 >r4=reg128#16,<a2=reg128#1%bot,<b0=reg128#9%bot
# asm 2: vmull.u32 >r4=q15,<a2=d0,<b0=d16
vmull.u32 q15,d0,d16

# qhasm: r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d14,<b0=d17
vmlal.u32 q11,d14,d17

# qhasm: r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a0=reg128#4%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a0=d6,<b0=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a0=reg128#5%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a0=d9,<b0=d17
vmlal.u32 q13,d9,d17

# qhasm: r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a1=reg128#7%bot,<b0=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a1=d12,<b0=d17
vmlal.u32 q14,d12,d17

# qhasm: r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a1=reg128#6%top,<b0=reg128#9%top
# asm 2: vmlal.u32 <r4=q15,<_2a1=d11,<b0=d17
vmlal.u32 q15,d11,d17

# qhasm: r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a1=d11,<b1=d18
vmlal.u32 q11,d11,d18

# qhasm: r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#1%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d0,<b1=d18
vmlal.u32 q12,d0,d18

# qhasm: r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a0=reg128#4%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a0=d6,<b1=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%top,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a0=d7,<b1=d18
vmlal.u32 q14,d7,d18

# qhasm: r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a1=reg128#7%bot,<b1=reg128#10%bot
# asm 2: vmlal.u32 <r4=q15,<a1=d12,<b1=d18
vmlal.u32 q15,d12,d18

# qhasm: r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a1=reg128#6%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r0=q11,<_2a1=d10,<b1=d19
vmlal.u32 q11,d10,d19

# qhasm: r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a1=reg128#6%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r1=q12,<_2a1=d11,<b1=d19
vmlal.u32 q12,d11,d19

# qhasm: r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a2=reg128#8%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r2=q13,<_2a2=d14,<b1=d19
vmlal.u32 q13,d14,d19

# qhasm: r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a0=reg128#4%bot,<b1=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a0=d6,<b1=d19
vmlal.u32 q14,d6,d19

# qhasm: r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		
# asm 1: vmlal.u32 <r4=reg128#16,<_2a0=reg128#5%top,<b1=reg128#10%top
# asm 2: vmlal.u32 <r4=q15,<_2a0=d9,<b1=d19
vmlal.u32 q15,d9,d19

# qhasm: r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a0=reg128#5%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r0=q11,<_2a0=d9,<b2=d20
vmlal.u32 q11,d9,d20

# qhasm: r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a1=reg128#7%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r1=q12,<a1=d12,<b2=d20
vmlal.u32 q12,d12,d20

# qhasm: r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a1=reg128#6%top,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r2=q13,<_2a1=d11,<b2=d20
vmlal.u32 q13,d11,d20

# qhasm: r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#1%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r3=q14,<a2=d0,<b2=d20
vmlal.u32 q14,d0,d20

# qhasm: r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		
# asm 1: vmlal.u32 <r4=reg128#16,<a0=reg128#4%bot,<b2=reg128#11%bot
# asm 2: vmlal.u32 <r4=q15,<a0=d6,<b2=d20
vmlal.u32 q15,d6,d20

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
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q8,<r3=q6,#25
vshr.u64 q8,q6,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#16,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q15,<t=q8
vadd.i64 q8,q15,q8

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#3
# asm 2: vand >r3=q6,<r3=q6,<mask25=q2
vand q6,q6,q2

# qhasm: 2x t = r4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<r4=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<r4=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#3,<r4=reg128#9,<mask25=reg128#3
# asm 2: vand >r4=q2,<r4=q8,<mask25=q2
vand q2,q8,q2

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: ptr1 += 112				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#112
# asm 2: add >ptr1=r2,<ptr1=r2,#112
add r2,r2,#112

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: adr1 = input_0 + 48
# asm 1: add >adr1=int32#4,<input_0=int32#1,#48
# asm 2: add >adr1=r3,<input_0=r0,#48
add r3,r0,#48

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr1=r3,: 128]!
vld1.8 {d6-d7},[r3,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr1=int32#4,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr1=r3,: 128]!
vld1.8 {d8-d9},[r3,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q4,#1
vshl.i64 q6,q4,#1

# qhasm: ptr1 -= 144				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#144
# asm 2: sub >ptr1=r2,<ptr1=r2,#144
sub r2,r2,#144

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r0=reg128#12,<a3=reg128#4%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r0=q11,<a3=d6,<b3=d16
vmull.u32 q11,d6,d16

# qhasm: r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r1=reg128#13,<a3=reg128#4%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r1=q12,<a3=d7,<b3=d16
vmull.u32 q12,d7,d16

# qhasm: r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		
# asm 1: vmull.u32 >r2=reg128#14,<a4=reg128#5%bot,<b3=reg128#9%bot
# asm 2: vmull.u32 >r2=q13,<a4=d8,<b3=d16
vmull.u32 q13,d8,d16

# qhasm: r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r3=reg128#15,<a4=reg128#5%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r3=q14,<a4=d9,<b3=d16
vmull.u32 q14,d9,d16

# qhasm: r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		
# asm 1: vmull.u32 >r5=reg128#16,<a2=reg128#1%top,<b3=reg128#9%bot
# asm 2: vmull.u32 >r5=q15,<a2=d1,<b3=d16
vmull.u32 q15,d1,d16

# qhasm: r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a2=reg128#8%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r0=q11,<_2a2=d15,<b3=d17
vmlal.u32 q11,d15,d17

# qhasm: r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a3=reg128#4%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r1=q12,<a3=d6,<b3=d17
vmlal.u32 q12,d6,d17

# qhasm: r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a3=reg128#6%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r2=q13,<_2a3=d11,<b3=d17
vmlal.u32 q13,d11,d17

# qhasm: r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a4=reg128#5%bot,<b3=reg128#9%top
# asm 2: vmlal.u32 <r3=q14,<a4=d8,<b3=d17
vmlal.u32 q14,d8,d17

# qhasm: r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a4=reg128#7%top,<b3=reg128#9%top
# asm 2: vmlal.u32 <r5=q15,<_2a4=d13,<b3=d17
vmlal.u32 q15,d13,d17

# qhasm: r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a4=reg128#7%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r0=q11,<_2a4=d13,<b4=d18
vmlal.u32 q11,d13,d18

# qhasm: r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<a2=reg128#1%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r1=q12,<a2=d1,<b4=d18
vmlal.u32 q12,d1,d18

# qhasm: r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r2=reg128#14,<a3=reg128#4%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r2=q13,<a3=d6,<b4=d18
vmlal.u32 q13,d6,d18

# qhasm: r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%top,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r3=q14,<a3=d7,<b4=d18
vmlal.u32 q14,d7,d18

# qhasm: r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		
# asm 1: vmlal.u32 <r5=reg128#16,<a4=reg128#5%bot,<b4=reg128#10%bot
# asm 2: vmlal.u32 <r5=q15,<a4=d8,<b4=d18
vmlal.u32 q15,d8,d18

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
# asm 1: vmlal.u32 <r3=reg128#15,<a3=reg128#4%bot,<b4=reg128#10%top
# asm 2: vmlal.u32 <r3=q14,<a3=d6,<b4=d19
vmlal.u32 q14,d6,d19

# qhasm: r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<_2a3=reg128#6%top,<b4=reg128#10%top
# asm 2: vmlal.u32 <r5=q15,<_2a3=d11,<b4=d19
vmlal.u32 q15,d11,d19

# qhasm: r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r0=reg128#12,<_2a3=reg128#6%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r0=q11,<_2a3=d11,<b2=d21
vmlal.u32 q11,d11,d21

# qhasm: r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r1=reg128#13,<a4=reg128#5%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r1=q12,<a4=d8,<b2=d21
vmlal.u32 q12,d8,d21

# qhasm: r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r2=reg128#14,<_2a4=reg128#7%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r2=q13,<_2a4=d13,<b2=d21
vmlal.u32 q13,d13,d21

# qhasm: r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		
# asm 1: vmlal.u32 <r3=reg128#15,<a2=reg128#1%top,<b2=reg128#11%top
# asm 2: vmlal.u32 <r3=q14,<a2=d1,<b2=d21
vmlal.u32 q14,d1,d21

# qhasm: r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		
# asm 1: vmlal.u32 <r5=reg128#16,<a3=reg128#4%bot,<b2=reg128#11%top
# asm 2: vmlal.u32 <r5=q15,<a3=d6,<b2=d21
vmlal.u32 q15,d6,d21

# qhasm: ptr1 -= 96				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#96
# asm 2: sub >ptr1=r2,<ptr1=r2,#96
sub r2,r2,#96

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#1%bot->mask25=reg128#1%top},[<ptr1=int32#3,: 128]
# asm 2: vld1.8 {>mask25=d0->mask25=d1},[<ptr1=r2,: 128]
vld1.8 {d0-d1},[r2,: 128]

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
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

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
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#1
# asm 2: vand >r3=q6,<r3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r5=reg128#8,#25
# asm 2: vshr.u64 >t=q8,<r5=q7,#25
vshr.u64 q8,q7,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#9
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q8
vadd.i64 q4,q4,q8

# qhasm: r5 &= mask25
# asm 1: vand >r5=reg128#8,<r5=reg128#8,<mask25=reg128#1
# asm 2: vand >r5=q7,<r5=q7,<mask25=q0
vand q7,q7,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q8,<r0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#9
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q8
vadd.i64 q3,q3,q8

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#3,<r5=reg128#8
# asm 2: vtrn.32 <r4=q2,<r5=q7
vtrn.32 q2,q7

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#3%bot,<r4=reg128#3%top
# asm 2: vtrn.32 <r4=d4,<r4=d5
vtrn.32 d4,d5

# qhasm: ptr1 += 208				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#208
# asm 2: add >ptr1=r2,<ptr1=r2,#208
add r2,r2,#208

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#3%bot-<r4=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d4-<r4=d5},[<ptr1=r2,: 128]!
vst1.8 {d4-d5},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#4%bot->a0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d6->a0=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#5%bot->a1=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d8->a1=d9},[<ptr1=r2,: 128]!
vld1.8 {d8-d9},[r2,: 128]!

# qhasm: a2 = r4
# asm 1: vmov >a2=reg128#3,<r4=reg128#3
# asm 2: vmov >a2=q2,<r4=q2
vmov q2,q2

# qhasm: 2x _2a0 = a0 << 1
# asm 1: vshl.i64 >_2a0=reg128#6,<a0=reg128#4,#1
# asm 2: vshl.i64 >_2a0=q5,<a0=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a1 = a1 << 1
# asm 1: vshl.i64 >_2a1=reg128#7,<a1=reg128#5,#1
# asm 2: vshl.i64 >_2a1=q6,<a1=q4,#1
vshl.i64 q6,q4,#1

# qhasm: 2x _2a2 = a2 << 1
# asm 1: vshl.i64 >_2a2=reg128#8,<a2=reg128#3,#1
# asm 2: vshl.i64 >_2a2=q7,<a2=q2,#1
vshl.i64 q7,q2,#1

# qhasm: r0[0,1]  =   a0[0] unsigned*   a0[0]; r0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >r0=reg128#9,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >r0=q8,<a0=d6,<a0=d6
vmull.u32 q8,d6,d6

# qhasm: r2[0,1]  = _2a0[2] unsigned*   a0[2]; r2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >r2=reg128#10,<_2a0=reg128#6%top,<a0=reg128#4%top
# asm 2: vmull.u32 >r2=q9,<_2a0=d11,<a0=d7
vmull.u32 q9,d11,d7

# qhasm: r4[0,1]  =   a1[0] unsigned*   a1[0]; r4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >r4=reg128#11,<a1=reg128#5%bot,<a1=reg128#5%bot
# asm 2: vmull.u32 >r4=q10,<a1=d8,<a1=d8
vmull.u32 q10,d8,d8

# qhasm: r1[0,1]  = _2a1[2] unsigned*   a1[2]; r1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >r1=reg128#12,<_2a1=reg128#7%top,<a1=reg128#5%top
# asm 2: vmull.u32 >r1=q11,<_2a1=d13,<a1=d9
vmull.u32 q11,d13,d9

# qhasm: r3[0,1]  =   a2[0] unsigned*   a2[0]; r3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >r3=reg128#13,<a2=reg128#3%bot,<a2=reg128#3%bot
# asm 2: vmull.u32 >r3=q12,<a2=d4,<a2=d4
vmull.u32 q12,d4,d4

# qhasm: r1[0,1] += _2a0[2] unsigned*   a0[0]; r1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r1=reg128#12,<_2a0=reg128#6%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <r1=q11,<_2a0=d11,<a0=d6
vmlal.u32 q11,d11,d6

# qhasm: r2[0,1] += _2a1[0] unsigned*   a0[0]; r2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r2=reg128#10,<_2a1=reg128#7%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <r2=q9,<_2a1=d12,<a0=d6
vmlal.u32 q9,d12,d6

# qhasm: r3[0,1] += _2a1[2] unsigned*   a0[0]; r3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r3=reg128#13,<_2a1=reg128#7%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <r3=q12,<_2a1=d13,<a0=d6
vmlal.u32 q12,d13,d6

# qhasm: r4[0,1] += _2a2[0] unsigned*   a0[0]; r4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r4=reg128#11,<_2a2=reg128#8%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <r4=q10,<_2a2=d14,<a0=d6
vmlal.u32 q10,d14,d6

# qhasm: r0[0,1] += _2a2[0] unsigned* _2a0[2]; r0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <r0=reg128#9,<_2a2=reg128#8%bot,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <r0=q8,<_2a2=d14,<_2a0=d11
vmlal.u32 q8,d14,d11

# qhasm: r4[0,1] += _2a1[2] unsigned* _2a0[2]; r4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <r4=reg128#11,<_2a1=reg128#7%top,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <r4=q10,<_2a1=d13,<_2a0=d11
vmlal.u32 q10,d13,d11

# qhasm: r3[0,1] += _2a1[0] unsigned*   a0[2]; r3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <r3=reg128#13,<_2a1=reg128#7%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <r3=q12,<_2a1=d12,<a0=d7
vmlal.u32 q12,d12,d7

# qhasm: r0[0,1] += _2a1[2] unsigned* _2a1[0]; r0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <r0=reg128#9,<_2a1=reg128#7%top,<_2a1=reg128#7%bot
# asm 2: vmlal.u32 <r0=q8,<_2a1=d13,<_2a1=d12
vmlal.u32 q8,d13,d12

# qhasm: r1[0,1] += _2a2[0] unsigned*   a1[0]; r1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <r1=reg128#12,<_2a2=reg128#8%bot,<a1=reg128#5%bot
# asm 2: vmlal.u32 <r1=q11,<_2a2=d14,<a1=d8
vmlal.u32 q11,d14,d8

# qhasm: r2[0,1] += _2a2[0] unsigned* _2a1[2]; r2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <r2=reg128#10,<_2a2=reg128#8%bot,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <r2=q9,<_2a2=d14,<_2a1=d13
vmlal.u32 q9,d14,d13

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<r0=reg128#9,#26
# asm 2: vshr.u64 >t=q3,<r0=q8,#26
vshr.u64 q3,q8,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#12,<t=reg128#4
# asm 2: vadd.i64 >r1=q3,<r1=q11,<t=q3
vadd.i64 q3,q11,q3

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#9,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q8,<mask26=q1
vand q4,q8,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<r1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<r1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#6,<r2=reg128#10,<t=reg128#6
# asm 2: vadd.i64 >r2=q5,<r2=q9,<t=q5
vadd.i64 q5,q9,q5

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<r2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<r2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#7,<r3=reg128#13,<t=reg128#7
# asm 2: vadd.i64 >r3=q6,<r3=q12,<t=q6
vadd.i64 q6,q12,q6

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#6,<r2=reg128#6,<mask26=reg128#2
# asm 2: vand >r2=q5,<r2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q8,<r3=q6,#25
vshr.u64 q8,q6,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#11,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q10,<t=q8
vadd.i64 q8,q10,q8

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#7,<r3=reg128#7,<mask25=reg128#1
# asm 2: vand >r3=q6,<r3=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<r4=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<r4=q8,#25
vshr.u64 q9,q8,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: r4 &= mask25
# asm 1: vand >r4=reg128#9,<r4=reg128#9,<mask25=reg128#1
# asm 2: vand >r4=q8,<r4=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#10,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q9,<r0=q4,#26
vshr.u64 q9,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#10
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q9
vadd.i64 q3,q3,q9

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#7
# asm 2: vtrn.32 <r2=q5,<r3=q6
vtrn.32 q5,q6

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: ptr1 -=192				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#192
# asm 2: sub >ptr1=r2,<ptr1=r2,#192
sub r2,r2,#192

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 += 176				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#176
# asm 2: add >ptr1=r2,<ptr1=r2,#176
add r2,r2,#176

# qhasm: a3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<ptr1=r2,: 128]!
vld1.8 {d8-d9},[r2,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#4,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q3,#1
vshl.i64 q5,q3,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#5,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q4,#1
vshl.i64 q6,q4,#1

# qhasm: r0[0,1]  =   a3[0] unsigned*   a3[0]; r0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >r0=reg128#10,<a3=reg128#4%bot,<a3=reg128#4%bot
# asm 2: vmull.u32 >r0=q9,<a3=d6,<a3=d6
vmull.u32 q9,d6,d6

# qhasm: r2[0,1]  = _2a3[2] unsigned*   a3[2]; r2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >r2=reg128#11,<_2a3=reg128#6%top,<a3=reg128#4%top
# asm 2: vmull.u32 >r2=q10,<_2a3=d11,<a3=d7
vmull.u32 q10,d11,d7

# qhasm: r5[0,1]  =   a4[0] unsigned*   a4[0]; r5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >r5=reg128#12,<a4=reg128#5%bot,<a4=reg128#5%bot
# asm 2: vmull.u32 >r5=q11,<a4=d8,<a4=d8
vmull.u32 q11,d8,d8

# qhasm: r1[0,1]  = _2a4[2] unsigned*   a4[2]; r1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >r1=reg128#13,<_2a4=reg128#7%top,<a4=reg128#5%top
# asm 2: vmull.u32 >r1=q12,<_2a4=d13,<a4=d9
vmull.u32 q12,d13,d9

# qhasm: r3[0,1]  =   a2[2] unsigned*   a2[2]; r3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >r3=reg128#3,<a2=reg128#3%top,<a2=reg128#3%top
# asm 2: vmull.u32 >r3=q2,<a2=d5,<a2=d5
vmull.u32 q2,d5,d5

# qhasm: r1[0,1] += _2a3[2] unsigned*   a3[0]; r1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a3=reg128#6%top,<a3=reg128#4%bot
# asm 2: vmlal.u32 <r1=q12,<_2a3=d11,<a3=d6
vmlal.u32 q12,d11,d6

# qhasm: r2[0,1] += _2a4[0] unsigned*   a3[0]; r2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r2=reg128#11,<_2a4=reg128#7%bot,<a3=reg128#4%bot
# asm 2: vmlal.u32 <r2=q10,<_2a4=d12,<a3=d6
vmlal.u32 q10,d12,d6

# qhasm: r3[0,1] += _2a4[2] unsigned*   a3[0]; r3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r3=reg128#3,<_2a4=reg128#7%top,<a3=reg128#4%bot
# asm 2: vmlal.u32 <r3=q2,<_2a4=d13,<a3=d6
vmlal.u32 q2,d13,d6

# qhasm: r5[0,1] += _2a2[2] unsigned*   a3[0]; r5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r5=reg128#12,<_2a2=reg128#8%top,<a3=reg128#4%bot
# asm 2: vmlal.u32 <r5=q11,<_2a2=d15,<a3=d6
vmlal.u32 q11,d15,d6

# qhasm: r0[0,1] += _2a2[2] unsigned* _2a3[2]; r0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <r0=reg128#10,<_2a2=reg128#8%top,<_2a3=reg128#6%top
# asm 2: vmlal.u32 <r0=q9,<_2a2=d15,<_2a3=d11
vmlal.u32 q9,d15,d11

# qhasm: r5[0,1] += _2a4[2] unsigned* _2a3[2]; r5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <r5=reg128#12,<_2a4=reg128#7%top,<_2a3=reg128#6%top
# asm 2: vmlal.u32 <r5=q11,<_2a4=d13,<_2a3=d11
vmlal.u32 q11,d13,d11

# qhasm: r3[0,1] += _2a4[0] unsigned*   a3[2]; r3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <r3=reg128#3,<_2a4=reg128#7%bot,<a3=reg128#4%top
# asm 2: vmlal.u32 <r3=q2,<_2a4=d12,<a3=d7
vmlal.u32 q2,d12,d7

# qhasm: r0[0,1] += _2a4[2] unsigned* _2a4[0]; r0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <r0=reg128#10,<_2a4=reg128#7%top,<_2a4=reg128#7%bot
# asm 2: vmlal.u32 <r0=q9,<_2a4=d13,<_2a4=d12
vmlal.u32 q9,d13,d12

# qhasm: r1[0,1] += _2a2[2] unsigned*   a4[0]; r1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a2=reg128#8%top,<a4=reg128#5%bot
# asm 2: vmlal.u32 <r1=q12,<_2a2=d15,<a4=d8
vmlal.u32 q12,d15,d8

# qhasm: r2[0,1] += _2a2[2] unsigned* _2a4[2]; r2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <r2=reg128#11,<_2a2=reg128#8%top,<_2a4=reg128#7%top
# asm 2: vmlal.u32 <r2=q10,<_2a2=d15,<_2a4=d13
vmlal.u32 q10,d15,d13

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#4,<r0=reg128#10,#26
# asm 2: vshr.u64 >t=q3,<r0=q9,#26
vshr.u64 q3,q9,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#13,<t=reg128#4
# asm 2: vadd.i64 >r1=q3,<r1=q12,<t=q3
vadd.i64 q3,q12,q3

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#10,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q9,<mask26=q1
vand q4,q9,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<r1=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<r1=q3,#25
vshr.u64 q5,q3,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#6,<r2=reg128#11,<t=reg128#6
# asm 2: vadd.i64 >r2=q5,<r2=q10,<t=q5
vadd.i64 q5,q10,q5

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#4,<r1=reg128#4,<mask25=reg128#1
# asm 2: vand >r1=q3,<r1=q3,<mask25=q0
vand q3,q3,q0

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<r2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<r2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#3,<r3=reg128#3,<t=reg128#7
# asm 2: vadd.i64 >r3=q2,<r3=q2,<t=q6
vadd.i64 q2,q2,q6

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#6,<r2=reg128#6,<mask26=reg128#2
# asm 2: vand >r2=q5,<r2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<r3=reg128#3,#25
# asm 2: vshr.u64 >t=q6,<r3=q2,#25
vshr.u64 q6,q2,#25

# qhasm: 2x r5 += t
# asm 1: vadd.i64 >r5=reg128#7,<r5=reg128#12,<t=reg128#7
# asm 2: vadd.i64 >r5=q6,<r5=q11,<t=q6
vadd.i64 q6,q11,q6

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#3,<r3=reg128#3,<mask25=reg128#1
# asm 2: vand >r3=q2,<r3=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = r5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<r5=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<r5=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#5,<r0=reg128#5,<t=reg128#8
# asm 2: vadd.i64 >r0=q4,<r0=q4,<t=q7
vadd.i64 q4,q4,q7

# qhasm: r5 &= mask25
# asm 1: vand >r5=reg128#7,<r5=reg128#7,<mask25=reg128#1
# asm 2: vand >r5=q6,<r5=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<r0=reg128#5,#26
# asm 2: vshr.u64 >t=q7,<r0=q4,#26
vshr.u64 q7,q4,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#4,<r1=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >r1=q3,<r1=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#5,<r0=reg128#5,<mask26=reg128#2
# asm 2: vand >r0=q4,<r0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
# asm 1: vtrn.32 <r0=reg128#5,<r1=reg128#4
# asm 2: vtrn.32 <r0=q4,<r1=q3
vtrn.32 q4,q3

# qhasm: r0 = r0[0,2,1,3]
# asm 1: vtrn.32 <r0=reg128#5%bot,<r0=reg128#5%top
# asm 2: vtrn.32 <r0=d8,<r0=d9
vtrn.32 d8,d9

# qhasm: r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#3
# asm 2: vtrn.32 <r2=q5,<r3=q2
vtrn.32 q5,q2

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#9,<r5=reg128#7
# asm 2: vtrn.32 <r4=q8,<r5=q6
vtrn.32 q8,q6

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#9%bot,<r4=reg128#9%top
# asm 2: vtrn.32 <r4=d16,<r4=d17
vtrn.32 d16,d17

# qhasm: ptr1 -= 208				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#208
# asm 2: sub >ptr1=r2,<ptr1=r2,#208
sub r2,r2,#208

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#9%bot-<r4=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d16-<r4=d17},[<ptr1=r2,: 128]!
vst1.8 {d16-d17},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#5%bot-<r0=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d8-<r0=d9},[<ptr1=r2,: 128]!
vst1.8 {d8-d9},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: a0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a0=reg128#3%bot->a0=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a0=d4->a0=d5},[<ptr1=r2,: 128]!
vld1.8 {d4-d5},[r2,: 128]!

# qhasm: a1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a1=reg128#4%bot->a1=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a1=d6->a1=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: a2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a2=reg128#5%bot->a2=reg128#5%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a2=d8->a2=d9},[<ptr1=r2,: 128]!
vld1.8 {d8-d9},[r2,: 128]!

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

# qhasm: r0[0,1]  =   a0[0] unsigned*   a0[0]; r0[2,3]  =   a0[1] unsigned*   a0[1]		
# asm 1: vmull.u32 >r0=reg128#9,<a0=reg128#3%bot,<a0=reg128#3%bot
# asm 2: vmull.u32 >r0=q8,<a0=d4,<a0=d4
vmull.u32 q8,d4,d4

# qhasm: r2[0,1]  = _2a0[2] unsigned*   a0[2]; r2[2,3]  = _2a0[3] unsigned*   a0[3]		
# asm 1: vmull.u32 >r2=reg128#10,<_2a0=reg128#6%top,<a0=reg128#3%top
# asm 2: vmull.u32 >r2=q9,<_2a0=d11,<a0=d5
vmull.u32 q9,d11,d5

# qhasm: r4[0,1]  =   a1[0] unsigned*   a1[0]; r4[2,3]  =   a1[1] unsigned*   a1[1]		
# asm 1: vmull.u32 >r4=reg128#11,<a1=reg128#4%bot,<a1=reg128#4%bot
# asm 2: vmull.u32 >r4=q10,<a1=d6,<a1=d6
vmull.u32 q10,d6,d6

# qhasm: r1[0,1]  = _2a1[2] unsigned*   a1[2]; r1[2,3]  = _2a1[3] unsigned*   a1[3]		
# asm 1: vmull.u32 >r1=reg128#12,<_2a1=reg128#7%top,<a1=reg128#4%top
# asm 2: vmull.u32 >r1=q11,<_2a1=d13,<a1=d7
vmull.u32 q11,d13,d7

# qhasm: r3[0,1]  =   a2[0] unsigned*   a2[0]; r3[2,3]  =   a2[1] unsigned*   a2[1]		
# asm 1: vmull.u32 >r3=reg128#13,<a2=reg128#5%bot,<a2=reg128#5%bot
# asm 2: vmull.u32 >r3=q12,<a2=d8,<a2=d8
vmull.u32 q12,d8,d8

# qhasm: r1[0,1] += _2a0[2] unsigned*   a0[0]; r1[2,3] += _2a0[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r1=reg128#12,<_2a0=reg128#6%top,<a0=reg128#3%bot
# asm 2: vmlal.u32 <r1=q11,<_2a0=d11,<a0=d4
vmlal.u32 q11,d11,d4

# qhasm: r2[0,1] += _2a1[0] unsigned*   a0[0]; r2[2,3] += _2a1[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r2=reg128#10,<_2a1=reg128#7%bot,<a0=reg128#3%bot
# asm 2: vmlal.u32 <r2=q9,<_2a1=d12,<a0=d4
vmlal.u32 q9,d12,d4

# qhasm: r3[0,1] += _2a1[2] unsigned*   a0[0]; r3[2,3] += _2a1[3] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r3=reg128#13,<_2a1=reg128#7%top,<a0=reg128#3%bot
# asm 2: vmlal.u32 <r3=q12,<_2a1=d13,<a0=d4
vmlal.u32 q12,d13,d4

# qhasm: r4[0,1] += _2a2[0] unsigned*   a0[0]; r4[2,3] += _2a2[1] unsigned*   a0[1]		
# asm 1: vmlal.u32 <r4=reg128#11,<_2a2=reg128#8%bot,<a0=reg128#3%bot
# asm 2: vmlal.u32 <r4=q10,<_2a2=d14,<a0=d4
vmlal.u32 q10,d14,d4

# qhasm: r0[0,1] += _2a2[0] unsigned* _2a0[2]; r0[2,3] += _2a2[1] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <r0=reg128#9,<_2a2=reg128#8%bot,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <r0=q8,<_2a2=d14,<_2a0=d11
vmlal.u32 q8,d14,d11

# qhasm: r4[0,1] += _2a1[2] unsigned* _2a0[2]; r4[2,3] += _2a1[3] unsigned* _2a0[3]		
# asm 1: vmlal.u32 <r4=reg128#11,<_2a1=reg128#7%top,<_2a0=reg128#6%top
# asm 2: vmlal.u32 <r4=q10,<_2a1=d13,<_2a0=d11
vmlal.u32 q10,d13,d11

# qhasm: r3[0,1] += _2a1[0] unsigned*   a0[2]; r3[2,3] += _2a1[1] unsigned*   a0[3]		
# asm 1: vmlal.u32 <r3=reg128#13,<_2a1=reg128#7%bot,<a0=reg128#3%top
# asm 2: vmlal.u32 <r3=q12,<_2a1=d12,<a0=d5
vmlal.u32 q12,d12,d5

# qhasm: r0[0,1] += _2a1[2] unsigned* _2a1[0]; r0[2,3] += _2a1[3] unsigned* _2a1[1]		
# asm 1: vmlal.u32 <r0=reg128#9,<_2a1=reg128#7%top,<_2a1=reg128#7%bot
# asm 2: vmlal.u32 <r0=q8,<_2a1=d13,<_2a1=d12
vmlal.u32 q8,d13,d12

# qhasm: r1[0,1] += _2a2[0] unsigned*   a1[0]; r1[2,3] += _2a2[1] unsigned*   a1[1]		
# asm 1: vmlal.u32 <r1=reg128#12,<_2a2=reg128#8%bot,<a1=reg128#4%bot
# asm 2: vmlal.u32 <r1=q11,<_2a2=d14,<a1=d6
vmlal.u32 q11,d14,d6

# qhasm: r2[0,1] += _2a2[0] unsigned* _2a1[2]; r2[2,3] += _2a2[1] unsigned* _2a1[3]		
# asm 1: vmlal.u32 <r2=reg128#10,<_2a2=reg128#8%bot,<_2a1=reg128#7%top
# asm 2: vmlal.u32 <r2=q9,<_2a2=d14,<_2a1=d13
vmlal.u32 q9,d14,d13

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<r0=reg128#9,#26
# asm 2: vshr.u64 >t=q2,<r0=q8,#26
vshr.u64 q2,q8,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#3,<r1=reg128#12,<t=reg128#3
# asm 2: vadd.i64 >r1=q2,<r1=q11,<t=q2
vadd.i64 q2,q11,q2

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#4,<r0=reg128#9,<mask26=reg128#2
# asm 2: vand >r0=q3,<r0=q8,<mask26=q1
vand q3,q8,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<r1=reg128#3,#25
# asm 2: vshr.u64 >t=q5,<r1=q2,#25
vshr.u64 q5,q2,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#6,<r2=reg128#10,<t=reg128#6
# asm 2: vadd.i64 >r2=q5,<r2=q9,<t=q5
vadd.i64 q5,q9,q5

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#3,<r1=reg128#3,<mask25=reg128#1
# asm 2: vand >r1=q2,<r1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<r2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<r2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#7,<r3=reg128#13,<t=reg128#7
# asm 2: vadd.i64 >r3=q6,<r3=q12,<t=q6
vadd.i64 q6,q12,q6

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#6,<r2=reg128#6,<mask26=reg128#2
# asm 2: vand >r2=q5,<r2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#9,<r3=reg128#7,#25
# asm 2: vshr.u64 >t=q8,<r3=q6,#25
vshr.u64 q8,q6,#25

# qhasm: 2x r4 += t
# asm 1: vadd.i64 >r4=reg128#9,<r4=reg128#11,<t=reg128#9
# asm 2: vadd.i64 >r4=q8,<r4=q10,<t=q8
vadd.i64 q8,q10,q8

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
# asm 1: vand >r4=reg128#9,<r4=reg128#9,<mask25=reg128#1
# asm 2: vand >r4=q8,<r4=q8,<mask25=q0
vand q8,q8,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#10,<r0=reg128#4,#26
# asm 2: vshr.u64 >t=q9,<r0=q3,#26
vshr.u64 q9,q3,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#3,<r1=reg128#3,<t=reg128#10
# asm 2: vadd.i64 >r1=q2,<r1=q2,<t=q9
vadd.i64 q2,q2,q9

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

# qhasm: ptr1 += 32				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: add >ptr1=r2,<ptr1=r2,#32
add r2,r2,#32

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#4%bot-<r0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d6-<r0=d7},[<ptr1=r2,: 128]!
vst1.8 {d6-d7},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

# qhasm: ptr1 -= 64				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#64
# asm 2: sub >ptr1=r2,<ptr1=r2,#64
sub r2,r2,#64

# qhasm: a3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a3=reg128#3%bot->a3=reg128#3%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a3=d4->a3=d5},[<ptr1=r2,: 128]!
vld1.8 {d4-d5},[r2,: 128]!

# qhasm: a4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>a4=reg128#4%bot->a4=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>a4=d6->a4=d7},[<ptr1=r2,: 128]!
vld1.8 {d6-d7},[r2,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#3,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q2,#1
vshl.i64 q5,q2,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#4,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q3,#1
vshl.i64 q6,q3,#1

# qhasm: r0[0,1]  =   a3[0] unsigned*   a3[0]; r0[2,3]  =   a3[1] unsigned*   a3[1]		
# asm 1: vmull.u32 >r0=reg128#10,<a3=reg128#3%bot,<a3=reg128#3%bot
# asm 2: vmull.u32 >r0=q9,<a3=d4,<a3=d4
vmull.u32 q9,d4,d4

# qhasm: r2[0,1]  = _2a3[2] unsigned*   a3[2]; r2[2,3]  = _2a3[3] unsigned*   a3[3]		
# asm 1: vmull.u32 >r2=reg128#11,<_2a3=reg128#6%top,<a3=reg128#3%top
# asm 2: vmull.u32 >r2=q10,<_2a3=d11,<a3=d5
vmull.u32 q10,d11,d5

# qhasm: r5[0,1]  =   a4[0] unsigned*   a4[0]; r5[2,3]  =   a4[1] unsigned*   a4[1]		
# asm 1: vmull.u32 >r5=reg128#12,<a4=reg128#4%bot,<a4=reg128#4%bot
# asm 2: vmull.u32 >r5=q11,<a4=d6,<a4=d6
vmull.u32 q11,d6,d6

# qhasm: r1[0,1]  = _2a4[2] unsigned*   a4[2]; r1[2,3]  = _2a4[3] unsigned*   a4[3]		
# asm 1: vmull.u32 >r1=reg128#13,<_2a4=reg128#7%top,<a4=reg128#4%top
# asm 2: vmull.u32 >r1=q12,<_2a4=d13,<a4=d7
vmull.u32 q12,d13,d7

# qhasm: r3[0,1]  =   a2[2] unsigned*   a2[2]; r3[2,3]  =   a2[3] unsigned*   a2[3]		
# asm 1: vmull.u32 >r3=reg128#5,<a2=reg128#5%top,<a2=reg128#5%top
# asm 2: vmull.u32 >r3=q4,<a2=d9,<a2=d9
vmull.u32 q4,d9,d9

# qhasm: r1[0,1] += _2a3[2] unsigned*   a3[0]; r1[2,3] += _2a3[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a3=reg128#6%top,<a3=reg128#3%bot
# asm 2: vmlal.u32 <r1=q12,<_2a3=d11,<a3=d4
vmlal.u32 q12,d11,d4

# qhasm: r2[0,1] += _2a4[0] unsigned*   a3[0]; r2[2,3] += _2a4[1] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r2=reg128#11,<_2a4=reg128#7%bot,<a3=reg128#3%bot
# asm 2: vmlal.u32 <r2=q10,<_2a4=d12,<a3=d4
vmlal.u32 q10,d12,d4

# qhasm: r3[0,1] += _2a4[2] unsigned*   a3[0]; r3[2,3] += _2a4[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r3=reg128#5,<_2a4=reg128#7%top,<a3=reg128#3%bot
# asm 2: vmlal.u32 <r3=q4,<_2a4=d13,<a3=d4
vmlal.u32 q4,d13,d4

# qhasm: r5[0,1] += _2a2[2] unsigned*   a3[0]; r5[2,3] += _2a2[3] unsigned*   a3[1]		
# asm 1: vmlal.u32 <r5=reg128#12,<_2a2=reg128#8%top,<a3=reg128#3%bot
# asm 2: vmlal.u32 <r5=q11,<_2a2=d15,<a3=d4
vmlal.u32 q11,d15,d4

# qhasm: r0[0,1] += _2a2[2] unsigned* _2a3[2]; r0[2,3] += _2a2[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <r0=reg128#10,<_2a2=reg128#8%top,<_2a3=reg128#6%top
# asm 2: vmlal.u32 <r0=q9,<_2a2=d15,<_2a3=d11
vmlal.u32 q9,d15,d11

# qhasm: r5[0,1] += _2a4[2] unsigned* _2a3[2]; r5[2,3] += _2a4[3] unsigned* _2a3[3]		
# asm 1: vmlal.u32 <r5=reg128#12,<_2a4=reg128#7%top,<_2a3=reg128#6%top
# asm 2: vmlal.u32 <r5=q11,<_2a4=d13,<_2a3=d11
vmlal.u32 q11,d13,d11

# qhasm: r3[0,1] += _2a4[0] unsigned*   a3[2]; r3[2,3] += _2a4[1] unsigned*   a3[3]		
# asm 1: vmlal.u32 <r3=reg128#5,<_2a4=reg128#7%bot,<a3=reg128#3%top
# asm 2: vmlal.u32 <r3=q4,<_2a4=d12,<a3=d5
vmlal.u32 q4,d12,d5

# qhasm: r0[0,1] += _2a4[2] unsigned* _2a4[0]; r0[2,3] += _2a4[3] unsigned* _2a4[1]		
# asm 1: vmlal.u32 <r0=reg128#10,<_2a4=reg128#7%top,<_2a4=reg128#7%bot
# asm 2: vmlal.u32 <r0=q9,<_2a4=d13,<_2a4=d12
vmlal.u32 q9,d13,d12

# qhasm: r1[0,1] += _2a2[2] unsigned*   a4[0]; r1[2,3] += _2a2[3] unsigned*   a4[1]		
# asm 1: vmlal.u32 <r1=reg128#13,<_2a2=reg128#8%top,<a4=reg128#4%bot
# asm 2: vmlal.u32 <r1=q12,<_2a2=d15,<a4=d6
vmlal.u32 q12,d15,d6

# qhasm: r2[0,1] += _2a2[2] unsigned* _2a4[2]; r2[2,3] += _2a2[3] unsigned* _2a4[3]		
# asm 1: vmlal.u32 <r2=reg128#11,<_2a2=reg128#8%top,<_2a4=reg128#7%top
# asm 2: vmlal.u32 <r2=q10,<_2a2=d15,<_2a4=d13
vmlal.u32 q10,d15,d13

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#3,<r0=reg128#10,#26
# asm 2: vshr.u64 >t=q2,<r0=q9,#26
vshr.u64 q2,q9,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#3,<r1=reg128#13,<t=reg128#3
# asm 2: vadd.i64 >r1=q2,<r1=q12,<t=q2
vadd.i64 q2,q12,q2

# qhasm: r0 &= mask26
# asm 1: vand >r0=reg128#4,<r0=reg128#10,<mask26=reg128#2
# asm 2: vand >r0=q3,<r0=q9,<mask26=q1
vand q3,q9,q1

# qhasm: 2x t = r1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<r1=reg128#3,#25
# asm 2: vshr.u64 >t=q5,<r1=q2,#25
vshr.u64 q5,q2,#25

# qhasm: 2x r2 += t
# asm 1: vadd.i64 >r2=reg128#6,<r2=reg128#11,<t=reg128#6
# asm 2: vadd.i64 >r2=q5,<r2=q10,<t=q5
vadd.i64 q5,q10,q5

# qhasm: r1 &= mask25
# asm 1: vand >r1=reg128#3,<r1=reg128#3,<mask25=reg128#1
# asm 2: vand >r1=q2,<r1=q2,<mask25=q0
vand q2,q2,q0

# qhasm: 2x t = r2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<r2=reg128#6,#26
# asm 2: vshr.u64 >t=q6,<r2=q5,#26
vshr.u64 q6,q5,#26

# qhasm: 2x r3 += t
# asm 1: vadd.i64 >r3=reg128#5,<r3=reg128#5,<t=reg128#7
# asm 2: vadd.i64 >r3=q4,<r3=q4,<t=q6
vadd.i64 q4,q4,q6

# qhasm: r2 &= mask26
# asm 1: vand >r2=reg128#6,<r2=reg128#6,<mask26=reg128#2
# asm 2: vand >r2=q5,<r2=q5,<mask26=q1
vand q5,q5,q1

# qhasm: 2x t = r3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<r3=reg128#5,#25
# asm 2: vshr.u64 >t=q6,<r3=q4,#25
vshr.u64 q6,q4,#25

# qhasm: 2x r5 += t
# asm 1: vadd.i64 >r5=reg128#7,<r5=reg128#12,<t=reg128#7
# asm 2: vadd.i64 >r5=q6,<r5=q11,<t=q6
vadd.i64 q6,q11,q6

# qhasm: r3 &= mask25
# asm 1: vand >r3=reg128#5,<r3=reg128#5,<mask25=reg128#1
# asm 2: vand >r3=q4,<r3=q4,<mask25=q0
vand q4,q4,q0

# qhasm: 2x t = r5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<r5=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<r5=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 2x r0 += t
# asm 1: vadd.i64 >r0=reg128#4,<r0=reg128#4,<t=reg128#8
# asm 2: vadd.i64 >r0=q3,<r0=q3,<t=q7
vadd.i64 q3,q3,q7

# qhasm: r5 &= mask25
# asm 1: vand >r5=reg128#7,<r5=reg128#7,<mask25=reg128#1
# asm 2: vand >r5=q6,<r5=q6,<mask25=q0
vand q6,q6,q0

# qhasm: 2x t = r0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#8,<r0=reg128#4,#26
# asm 2: vshr.u64 >t=q7,<r0=q3,#26
vshr.u64 q7,q3,#26

# qhasm: 2x r1 += t
# asm 1: vadd.i64 >r1=reg128#3,<r1=reg128#3,<t=reg128#8
# asm 2: vadd.i64 >r1=q2,<r1=q2,<t=q7
vadd.i64 q2,q2,q7

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
# asm 1: vtrn.32 <r2=reg128#6,<r3=reg128#5
# asm 2: vtrn.32 <r2=q5,<r3=q4
vtrn.32 q5,q4

# qhasm: r2 = r2[0,2,1,3]
# asm 1: vtrn.32 <r2=reg128#6%bot,<r2=reg128#6%top
# asm 2: vtrn.32 <r2=d10,<r2=d11
vtrn.32 d10,d11

# qhasm: r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
# asm 1: vtrn.32 <r4=reg128#9,<r5=reg128#7
# asm 2: vtrn.32 <r4=q8,<r5=q6
vtrn.32 q8,q6

# qhasm: r4 = r4[0,2,1,3]
# asm 1: vtrn.32 <r4=reg128#9%bot,<r4=reg128#9%top
# asm 2: vtrn.32 <r4=d16,<r4=d17
vtrn.32 d16,d17

# qhasm: ptr1 += 32				
# asm 1: add >ptr1=int32#3,<ptr1=int32#3,#32
# asm 2: add >ptr1=r2,<ptr1=r2,#32
add r2,r2,#32

# qhasm: mem128[ptr1] aligned = r4; ptr1+=16	
# asm 1: vst1.8 {<r4=reg128#9%bot-<r4=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r4=d16-<r4=d17},[<ptr1=r2,: 128]!
vst1.8 {d16-d17},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r0; ptr1+=16	
# asm 1: vst1.8 {<r0=reg128#4%bot-<r0=reg128#4%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r0=d6-<r0=d7},[<ptr1=r2,: 128]!
vst1.8 {d6-d7},[r2,: 128]!

# qhasm: mem128[ptr1] aligned = r2; ptr1+=16	
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<ptr1=int32#3,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<ptr1=r2,: 128]!
vst1.8 {d10-d11},[r2,: 128]!

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

# qhasm: ptr1 -= 80				
# asm 1: sub >ptr1=int32#3,<ptr1=int32#3,#80
# asm 2: sub >ptr1=r2,<ptr1=r2,#80
sub r2,r2,#80

# qhasm: b0 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b0=reg128#9%bot->b0=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b0=d16->b0=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b1 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

# qhasm: b2 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b2=reg128#11%bot->b2=reg128#11%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b2=d20->b2=d21},[<ptr1=r2,: 128]!
vld1.8 {d20-d21},[r2,: 128]!

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

# qhasm: mem128[adr0] aligned = r0; adr0+=16
# asm 1: vst1.8 {<r0=reg128#4%bot-<r0=reg128#4%top},[<adr0=int32#1,: 128]!
# asm 2: vst1.8 {<r0=d6-<r0=d7},[<adr0=r0,: 128]!
vst1.8 {d6-d7},[r0,: 128]!

# qhasm: mem128[adr0] aligned = r2; adr0+=16
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<adr0=int32#1,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<adr0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm: a3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a3=reg128#3%bot->a3=reg128#3%top},[<adr1=int32#2,: 128]!
# asm 2: vld1.8 {>a3=d4->a3=d5},[<adr1=r1,: 128]!
vld1.8 {d4-d5},[r1,: 128]!

# qhasm: a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#4%bot->a4=reg128#4%top},[<adr1=int32#2,: 128]!
# asm 2: vld1.8 {>a4=d6->a4=d7},[<adr1=r1,: 128]!
vld1.8 {d6-d7},[r1,: 128]!

# qhasm: 2x _2a3 = a3 << 1
# asm 1: vshl.i64 >_2a3=reg128#6,<a3=reg128#3,#1
# asm 2: vshl.i64 >_2a3=q5,<a3=q2,#1
vshl.i64 q5,q2,#1

# qhasm: 2x _2a4 = a4 << 1
# asm 1: vshl.i64 >_2a4=reg128#7,<a4=reg128#4,#1
# asm 2: vshl.i64 >_2a4=q6,<a4=q3,#1
vshl.i64 q6,q3,#1

# qhasm: b3 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<ptr1=r2,: 128]!
vld1.8 {d16-d17},[r2,: 128]!

# qhasm: b4 aligned = mem128[ptr1]; ptr1+=16	
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<ptr1=int32#3,: 128]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<ptr1=r2,: 128]!
vld1.8 {d18-d19},[r2,: 128]!

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

# qhasm: ptr1 -= 176			
# asm 1: sub >ptr1=int32#2,<ptr1=int32#3,#176
# asm 2: sub >ptr1=r1,<ptr1=r2,#176
sub r1,r2,#176

# qhasm: mask25 aligned = mem128[ptr1]
# asm 1: vld1.8 {>mask25=reg128#3%bot->mask25=reg128#3%top},[<ptr1=int32#2,: 128]
# asm 2: vld1.8 {>mask25=d4->mask25=d5},[<ptr1=r1,: 128]
vld1.8 {d4-d5},[r1,: 128]

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

# qhasm: mem128[adr0] aligned = r4; adr0+=16
# asm 1: vst1.8 {<r4=reg128#1%bot-<r4=reg128#1%top},[<adr0=int32#1,: 128]!
# asm 2: vst1.8 {<r4=d0-<r4=d1},[<adr0=r0,: 128]!
vst1.8 {d0-d1},[r0,: 128]!

# qhasm: mem128[adr0] aligned = r0; adr0+=16
# asm 1: vst1.8 {<r0=reg128#2%bot-<r0=reg128#2%top},[<adr0=int32#1,: 128]!
# asm 2: vst1.8 {<r0=d2-<r0=d3},[<adr0=r0,: 128]!
vst1.8 {d2-d3},[r0,: 128]!

# qhasm: mem128[adr0] aligned = r2; adr0+=16
# asm 1: vst1.8 {<r2=reg128#6%bot-<r2=reg128#6%top},[<adr0=int32#1,: 128]!
# asm 2: vst1.8 {<r2=d10-<r2=d11},[<adr0=r0,: 128]!
vst1.8 {d10-d11},[r0,: 128]!

# qhasm: caller_r4 = stack_r4
# asm 1: ldr >caller_r4=int32#5,<stack_r4=stack32#1
# asm 2: ldr >caller_r4=r4,<stack_r4=[sp,#0]
ldr r4,[sp,#0]

# qhasm: caller_r5 = stack_r5
# asm 1: ldr >caller_r5=int32#6,<stack_r5=stack32#2
# asm 2: ldr >caller_r5=r5,<stack_r5=[sp,#4]
ldr r5,[sp,#4]

# qhasm: caller_r6 = stack_r6
# asm 1: ldr >caller_r6=int32#7,<stack_r6=stack32#3
# asm 2: ldr >caller_r6=r6,<stack_r6=[sp,#8]
ldr r6,[sp,#8]

# qhasm: caller_r7 = stack_r7
# asm 1: ldr >caller_r7=int32#8,<stack_r7=stack32#4
# asm 2: ldr >caller_r7=r7,<stack_r7=[sp,#12]
ldr r7,[sp,#12]

# qhasm: caller_r8 = stack_r8
# asm 1: ldr >caller_r8=int32#9,<stack_r8=stack32#5
# asm 2: ldr >caller_r8=r8,<stack_r8=[sp,#16]
ldr r8,[sp,#16]

# qhasm: caller_r9 = stack_r9
# asm 1: ldr >caller_r9=int32#10,<stack_r9=stack32#6
# asm 2: ldr >caller_r9=r9,<stack_r9=[sp,#20]
ldr r9,[sp,#20]

# qhasm: caller_r10 = stack_r10
# asm 1: ldr >caller_r10=int32#11,<stack_r10=stack32#7
# asm 2: ldr >caller_r10=r10,<stack_r10=[sp,#24]
ldr r10,[sp,#24]

# qhasm: caller_r11 = stack_r11
# asm 1: ldr >caller_r11=int32#12,<stack_r11=stack32#8
# asm 2: ldr >caller_r11=r11,<stack_r11=[sp,#28]
ldr r11,[sp,#28]

# qhasm: caller_r12 = stack_r12
# asm 1: ldr >caller_r12=int32#13,<stack_r12=stack32#9
# asm 2: ldr >caller_r12=r12,<stack_r12=[sp,#32]
ldr r12,[sp,#32]

# qhasm: caller_r14 = stack_r14
# asm 1: ldr >caller_r14=int32#14,<stack_r14=stack32#10
# asm 2: ldr >caller_r14=r14,<stack_r14=[sp,#36]
ldr r14,[sp,#36]

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
