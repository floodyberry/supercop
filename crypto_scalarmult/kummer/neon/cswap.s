
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

# qhasm: int128 t

# qhasm: int128 c

# qhasm: int32 bit

# qhasm: int32 adr0

# qhasm: int32 adr1

# qhasm: int32 adr2

# qhasm: int32 count

# qhasm: stack128 caller_q4_stack

# qhasm: stack128 caller_q5_stack

# qhasm: stack128 caller_q6_stack

# qhasm: stack128 caller_q7_stack

# qhasm: qpushenter cswap
.align 4
.global _cswap
.global cswap
.type _cswap STT_FUNC
.type cswap STT_FUNC
_cswap:
cswap:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#0
and sp,sp,#0xffffffe0

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#4,<input_0=int32#1
# asm 2: mov >adr0=r3,<input_0=r0
mov r3,r0

# qhasm: a0 = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a0=reg128#1%bot->a0=reg128#1%top},[<adr0=int32#4]!
# asm 2: vld1.8 {>a0=d0->a0=d1},[<adr0=r3]!
vld1.8 {d0-d1},[r3]!

# qhasm: a1 = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a1=reg128#2%bot->a1=reg128#2%top},[<adr0=int32#4]!
# asm 2: vld1.8 {>a1=d2->a1=d3},[<adr0=r3]!
vld1.8 {d2-d3},[r3]!

# qhasm: a2 = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a2=reg128#3%bot->a2=reg128#3%top},[<adr0=int32#4]!
# asm 2: vld1.8 {>a2=d4->a2=d5},[<adr0=r3]!
vld1.8 {d4-d5},[r3]!

# qhasm: a3 = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a3=reg128#4%bot->a3=reg128#4%top},[<adr0=int32#4]!
# asm 2: vld1.8 {>a3=d6->a3=d7},[<adr0=r3]!
vld1.8 {d6-d7},[r3]!

# qhasm: a4 = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a4=reg128#5%bot->a4=reg128#5%top},[<adr0=int32#4]!
# asm 2: vld1.8 {>a4=d8->a4=d9},[<adr0=r3]!
vld1.8 {d8-d9},[r3]!

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#4,<input_1=int32#2
# asm 2: mov >adr1=r3,<input_1=r1
mov r3,r1

# qhasm: b0 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b0=reg128#6%bot->b0=reg128#6%top},[<adr1=int32#4]!
# asm 2: vld1.8 {>b0=d10->b0=d11},[<adr1=r3]!
vld1.8 {d10-d11},[r3]!

# qhasm: b1 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b1=reg128#7%bot->b1=reg128#7%top},[<adr1=int32#4]!
# asm 2: vld1.8 {>b1=d12->b1=d13},[<adr1=r3]!
vld1.8 {d12-d13},[r3]!

# qhasm: b2 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b2=reg128#8%bot->b2=reg128#8%top},[<adr1=int32#4]!
# asm 2: vld1.8 {>b2=d14->b2=d15},[<adr1=r3]!
vld1.8 {d14-d15},[r3]!

# qhasm: b3 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b3=reg128#9%bot->b3=reg128#9%top},[<adr1=int32#4]!
# asm 2: vld1.8 {>b3=d16->b3=d17},[<adr1=r3]!
vld1.8 {d16-d17},[r3]!

# qhasm: b4 = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b4=reg128#10%bot->b4=reg128#10%top},[<adr1=int32#4]!
# asm 2: vld1.8 {>b4=d18->b4=d19},[<adr1=r3]!
vld1.8 {d18-d19},[r3]!

# qhasm: bit = input_2
# asm 1: mov >bit=int32#3,<input_2=int32#3
# asm 2: mov >bit=r2,<input_2=r2
mov r2,r2

# qhasm: bit -= 1
# asm 1: sub >bit=int32#3,<bit=int32#3,#1
# asm 2: sub >bit=r2,<bit=r2,#1
sub r2,r2,#1

# qhasm: 4x c = bit
# asm 1: vdup.i32 >c=reg128#11,<bit=int32#3
# asm 2: vdup.i32 >c=q10,<bit=r2
vdup.i32 q10,r2

# qhasm: t  = a0 ^ b0
# asm 1: veor >t=reg128#12,<a0=reg128#1,<b0=reg128#6
# asm 2: veor >t=q11,<a0=q0,<b0=q5
veor q11,q0,q5

# qhasm: t  &= c
# asm 1: vand >t=reg128#12,<t=reg128#12,<c=reg128#11
# asm 2: vand >t=q11,<t=q11,<c=q10
vand q11,q11,q10

# qhasm: a0 ^= t
# asm 1: veor >a0=reg128#1,<a0=reg128#1,<t=reg128#12
# asm 2: veor >a0=q0,<a0=q0,<t=q11
veor q0,q0,q11

# qhasm: b0 ^= t
# asm 1: veor >b0=reg128#6,<b0=reg128#6,<t=reg128#12
# asm 2: veor >b0=q5,<b0=q5,<t=q11
veor q5,q5,q11

# qhasm: t  = a1 ^ b1
# asm 1: veor >t=reg128#12,<a1=reg128#2,<b1=reg128#7
# asm 2: veor >t=q11,<a1=q1,<b1=q6
veor q11,q1,q6

# qhasm: t  &= c
# asm 1: vand >t=reg128#12,<t=reg128#12,<c=reg128#11
# asm 2: vand >t=q11,<t=q11,<c=q10
vand q11,q11,q10

# qhasm: a1 ^= t
# asm 1: veor >a1=reg128#2,<a1=reg128#2,<t=reg128#12
# asm 2: veor >a1=q1,<a1=q1,<t=q11
veor q1,q1,q11

# qhasm: b1 ^= t
# asm 1: veor >b1=reg128#7,<b1=reg128#7,<t=reg128#12
# asm 2: veor >b1=q6,<b1=q6,<t=q11
veor q6,q6,q11

# qhasm: t  = a2 ^ b2
# asm 1: veor >t=reg128#12,<a2=reg128#3,<b2=reg128#8
# asm 2: veor >t=q11,<a2=q2,<b2=q7
veor q11,q2,q7

# qhasm: t  &= c
# asm 1: vand >t=reg128#12,<t=reg128#12,<c=reg128#11
# asm 2: vand >t=q11,<t=q11,<c=q10
vand q11,q11,q10

# qhasm: a2 ^= t
# asm 1: veor >a2=reg128#3,<a2=reg128#3,<t=reg128#12
# asm 2: veor >a2=q2,<a2=q2,<t=q11
veor q2,q2,q11

# qhasm: b2 ^= t
# asm 1: veor >b2=reg128#8,<b2=reg128#8,<t=reg128#12
# asm 2: veor >b2=q7,<b2=q7,<t=q11
veor q7,q7,q11

# qhasm: t  = a3 ^ b3
# asm 1: veor >t=reg128#12,<a3=reg128#4,<b3=reg128#9
# asm 2: veor >t=q11,<a3=q3,<b3=q8
veor q11,q3,q8

# qhasm: t  &= c
# asm 1: vand >t=reg128#12,<t=reg128#12,<c=reg128#11
# asm 2: vand >t=q11,<t=q11,<c=q10
vand q11,q11,q10

# qhasm: a3 ^= t
# asm 1: veor >a3=reg128#4,<a3=reg128#4,<t=reg128#12
# asm 2: veor >a3=q3,<a3=q3,<t=q11
veor q3,q3,q11

# qhasm: b3 ^= t
# asm 1: veor >b3=reg128#9,<b3=reg128#9,<t=reg128#12
# asm 2: veor >b3=q8,<b3=q8,<t=q11
veor q8,q8,q11

# qhasm: t  = a4 ^ b4
# asm 1: veor >t=reg128#12,<a4=reg128#5,<b4=reg128#10
# asm 2: veor >t=q11,<a4=q4,<b4=q9
veor q11,q4,q9

# qhasm: t  &= c
# asm 1: vand >t=reg128#11,<t=reg128#12,<c=reg128#11
# asm 2: vand >t=q10,<t=q11,<c=q10
vand q10,q11,q10

# qhasm: a4 ^= t
# asm 1: veor >a4=reg128#5,<a4=reg128#5,<t=reg128#11
# asm 2: veor >a4=q4,<a4=q4,<t=q10
veor q4,q4,q10

# qhasm: b4 ^= t
# asm 1: veor >b4=reg128#10,<b4=reg128#10,<t=reg128#11
# asm 2: veor >b4=q9,<b4=q9,<t=q10
veor q9,q9,q10

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#1,<input_0=int32#1
# asm 2: mov >adr0=r0,<input_0=r0
mov r0,r0

# qhasm: mem128[adr0] = a0; adr0+=16
# asm 1: vst1.8 {<a0=reg128#1%bot-<a0=reg128#1%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<a0=d0-<a0=d1},[<adr0=r0]!
vst1.8 {d0-d1},[r0]!

# qhasm: mem128[adr0] = a1; adr0+=16
# asm 1: vst1.8 {<a1=reg128#2%bot-<a1=reg128#2%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<a1=d2-<a1=d3},[<adr0=r0]!
vst1.8 {d2-d3},[r0]!

# qhasm: mem128[adr0] = a2; adr0+=16
# asm 1: vst1.8 {<a2=reg128#3%bot-<a2=reg128#3%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<a2=d4-<a2=d5},[<adr0=r0]!
vst1.8 {d4-d5},[r0]!

# qhasm: mem128[adr0] = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#4%bot-<a3=reg128#4%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<a3=d6-<a3=d7},[<adr0=r0]!
vst1.8 {d6-d7},[r0]!

# qhasm: mem128[adr0] = a4; adr0+=16
# asm 1: vst1.8 {<a4=reg128#5%bot-<a4=reg128#5%top},[<adr0=int32#1]!
# asm 2: vst1.8 {<a4=d8-<a4=d9},[<adr0=r0]!
vst1.8 {d8-d9},[r0]!

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#1,<input_1=int32#2
# asm 2: mov >adr1=r0,<input_1=r1
mov r0,r1

# qhasm: mem128[adr1] = b0; adr1+=16
# asm 1: vst1.8 {<b0=reg128#6%bot-<b0=reg128#6%top},[<adr1=int32#1]!
# asm 2: vst1.8 {<b0=d10-<b0=d11},[<adr1=r0]!
vst1.8 {d10-d11},[r0]!

# qhasm: mem128[adr1] = b1; adr1+=16
# asm 1: vst1.8 {<b1=reg128#7%bot-<b1=reg128#7%top},[<adr1=int32#1]!
# asm 2: vst1.8 {<b1=d12-<b1=d13},[<adr1=r0]!
vst1.8 {d12-d13},[r0]!

# qhasm: mem128[adr1] = b2; adr1+=16
# asm 1: vst1.8 {<b2=reg128#8%bot-<b2=reg128#8%top},[<adr1=int32#1]!
# asm 2: vst1.8 {<b2=d14-<b2=d15},[<adr1=r0]!
vst1.8 {d14-d15},[r0]!

# qhasm: mem128[adr1] = b3; adr1+=16
# asm 1: vst1.8 {<b3=reg128#9%bot-<b3=reg128#9%top},[<adr1=int32#1]!
# asm 2: vst1.8 {<b3=d16-<b3=d17},[<adr1=r0]!
vst1.8 {d16-d17},[r0]!

# qhasm: mem128[adr1] = b4; adr1+=16
# asm 1: vst1.8 {<b4=reg128#10%bot-<b4=reg128#10%top},[<adr1=int32#1]!
# asm 2: vst1.8 {<b4=d18-<b4=d19},[<adr1=r0]!
vst1.8 {d18-d19},[r0]!

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
