
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

# qhasm: int128 x0

# qhasm: int128 x1

# qhasm: int128 x2

# qhasm: int128 x3

# qhasm: int128 x4

# qhasm: int128 x5

# qhasm: int128 x6

# qhasm: int128 x7

# qhasm: int128 r0

# qhasm: int128 r1

# qhasm: int128 r2

# qhasm: int128 r3

# qhasm: int128 r4

# qhasm: int128 r5

# qhasm: int128 r6

# qhasm: int128 r7

# qhasm: int128 temp0

# qhasm: int128 temp1

# qhasm: int32 r

# qhasm: int128 cf

# qhasm: int128 c33

# qhasm: int128 c55

# qhasm: qpushenter F8
.align 2
.global _F8
.global F8
.type _F8 STT_FUNC
.type F8 STT_FUNC
_F8:
F8:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#0
and sp,sp,#0xffffffe0

# qhasm: x0 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x0=reg128#1%bot->x0=reg128#1%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x0=d0->x0=d1},[<input_0=r0]!
vld1.8 {d0-d1},[r0]!

# qhasm: x1 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x1=reg128#2%bot->x1=reg128#2%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x1=d2->x1=d3},[<input_0=r0]!
vld1.8 {d2-d3},[r0]!

# qhasm: x2 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x2=reg128#3%bot->x2=reg128#3%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x2=d4->x2=d5},[<input_0=r0]!
vld1.8 {d4-d5},[r0]!

# qhasm: x3 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x3=reg128#4%bot->x3=reg128#4%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x3=d6->x3=d7},[<input_0=r0]!
vld1.8 {d6-d7},[r0]!

# qhasm: r0 = mem128[input_1];input_1 += 16
# asm 1: vld1.8 {>r0=reg128#5%bot->r0=reg128#5%top},[<input_1=int32#2]!
# asm 2: vld1.8 {>r0=d8->r0=d9},[<input_1=r1]!
vld1.8 {d8-d9},[r1]!

# qhasm: r1 = mem128[input_1];input_1 += 16
# asm 1: vld1.8 {>r1=reg128#6%bot->r1=reg128#6%top},[<input_1=int32#2]!
# asm 2: vld1.8 {>r1=d10->r1=d11},[<input_1=r1]!
vld1.8 {d10-d11},[r1]!

# qhasm: r2 = mem128[input_1];input_1 += 16
# asm 1: vld1.8 {>r2=reg128#7%bot->r2=reg128#7%top},[<input_1=int32#2]!
# asm 2: vld1.8 {>r2=d12->r2=d13},[<input_1=r1]!
vld1.8 {d12-d13},[r1]!

# qhasm: r3 = mem128[input_1]
# asm 1: vld1.8 {>r3=reg128#8%bot->r3=reg128#8%top},[<input_1=int32#2]
# asm 2: vld1.8 {>r3=d14->r3=d15},[<input_1=r1]
vld1.8 {d14-d15},[r1]

# qhasm: input_1 -= 48
# asm 1: sub >input_1=int32#2,<input_1=int32#2,#48
# asm 2: sub >input_1=r1,<input_1=r1,#48
sub r1,r1,#48

# qhasm: x0 ^= r0
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#5
# asm 2: veor >x0=q0,<x0=q0,<r0=q4
veor q0,q0,q4

# qhasm:   x4 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x4=reg128#5%bot->x4=reg128#5%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x4=d8->x4=d9},[<input_0=r0]!
vld1.8 {d8-d9},[r0]!

# qhasm:     cf = 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
# asm 1: vmov.i8 >cf=reg128#9,#15
# asm 2: vmov.i8 >cf=q8,#15
vmov.i8 q8,#15

# qhasm: x1 ^= r1
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r1=reg128#6
# asm 2: veor >x1=q1,<x1=q1,<r1=q5
veor q1,q1,q5

# qhasm:   x5 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x5=reg128#6%bot->x5=reg128#6%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x5=d10->x5=d11},[<input_0=r0]!
vld1.8 {d10-d11},[r0]!

# qhasm:     c33 = 51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51
# asm 1: vmov.i8 >c33=reg128#10,#51
# asm 2: vmov.i8 >c33=q9,#51
vmov.i8 q9,#51

# qhasm: x2 ^= r2
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r2=reg128#7
# asm 2: veor >x2=q2,<x2=q2,<r2=q6
veor q2,q2,q6

# qhasm:   x6 = mem128[input_0];input_0 += 16
# asm 1: vld1.8 {>x6=reg128#7%bot->x6=reg128#7%top},[<input_0=int32#1]!
# asm 2: vld1.8 {>x6=d12->x6=d13},[<input_0=r0]!
vld1.8 {d12-d13},[r0]!

# qhasm:     c55 = 85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85
# asm 1: vmov.i8 >c55=reg128#11,#85
# asm 2: vmov.i8 >c55=q10,#85
vmov.i8 q10,#85

# qhasm: x3 ^= r3
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r3=reg128#8
# asm 2: veor >x3=q3,<x3=q3,<r3=q7
veor q3,q3,q7

# qhasm:   x7 = mem128[input_0]
# asm 1: vld1.8 {>x7=reg128#8%bot->x7=reg128#8%top},[<input_0=int32#1]
# asm 2: vld1.8 {>x7=d14->x7=d15},[<input_0=r0]
vld1.8 {d14-d15},[r0]

# qhasm:   input_0 -= 112
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#112
# asm 2: sub >input_0=r0,<input_0=r0,#112
sub r0,r0,#112

# qhasm: r = 42
# asm 1: ldr >r=int32#4,=42
# asm 2: ldr >r=r3,=42
ldr r3,=42

# qhasm: mainloop:
._mainloop:

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:   x5 ^= x6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:   x1 ^= x2 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:   x3 ^= x4 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:   x5 ^= x0 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:   x7 ^= x0 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:   x0 ^= x3 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:   x2 ^= x5 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x4 ^= x7 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x6 ^= x1 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x4 ^= x1 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   2x r1 = x1 << 1
# asm 1: vshl.i64 >r1=reg128#12,<x1=reg128#2,#1
# asm 2: vshl.i64 >r1=q11,<x1=q1,#1
vshl.i64 q11,q1,#1

# qhasm:   2x x1 unsigned>>= 1
# asm 1: vshr.u64 >x1=reg128#2,<x1=reg128#2,#1
# asm 2: vshr.u64 >x1=q1,<x1=q1,#1
vshr.u64 q1,q1,#1

# qhasm:     2x r3 = x3 << 1
# asm 1: vshl.i64 >r3=reg128#13,<x3=reg128#4,#1
# asm 2: vshl.i64 >r3=q12,<x3=q3,#1
vshl.i64 q12,q3,#1

# qhasm:     2x x3 unsigned>>= 1
# asm 1: vshr.u64 >x3=reg128#4,<x3=reg128#4,#1
# asm 2: vshr.u64 >x3=q3,<x3=q3,#1
vshr.u64 q3,q3,#1

# qhasm:   x1 = (c55 & x1) | (~c55 & r1)
# asm 1: vbif <x1=reg128#2,<r1=reg128#12,<c55=reg128#11
# asm 2: vbif <x1=q1,<r1=q11,<c55=q10
vbif q1,q11,q10

# qhasm:     x3 = (c55 & x3) | (~c55 & r3)
# asm 1: vbif <x3=reg128#4,<r3=reg128#13,<c55=reg128#11
# asm 2: vbif <x3=q3,<r3=q12,<c55=q10
vbif q3,q12,q10

# qhasm:       2x r5 = x5 << 1
# asm 1: vshl.i64 >r5=reg128#12,<x5=reg128#6,#1
# asm 2: vshl.i64 >r5=q11,<x5=q5,#1
vshl.i64 q11,q5,#1

# qhasm:       2x x5 unsigned>>= 1
# asm 1: vshr.u64 >x5=reg128#6,<x5=reg128#6,#1
# asm 2: vshr.u64 >x5=q5,<x5=q5,#1
vshr.u64 q5,q5,#1

# qhasm:         2x r7 = x7 << 1
# asm 1: vshl.i64 >r7=reg128#13,<x7=reg128#8,#1
# asm 2: vshl.i64 >r7=q12,<x7=q7,#1
vshl.i64 q12,q7,#1

# qhasm:         2x x7 unsigned>>= 1
# asm 1: vshr.u64 >x7=reg128#8,<x7=reg128#8,#1
# asm 2: vshr.u64 >x7=q7,<x7=q7,#1
vshr.u64 q7,q7,#1

# qhasm:       x5 = (c55 & x5) | (~c55 & r5)
# asm 1: vbif <x5=reg128#6,<r5=reg128#12,<c55=reg128#11
# asm 2: vbif <x5=q5,<r5=q11,<c55=q10
vbif q5,q11,q10

# qhasm:         x7 = (c55 & x7) | (~c55 & r7)
# asm 1: vbif <x7=reg128#8,<r7=reg128#13,<c55=reg128#11
# asm 2: vbif <x7=q7,<r7=q12,<c55=q10
vbif q7,q12,q10

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:   x5 ^= x6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:   x1 ^= x2 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:   x3 ^= x4 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:   x5 ^= x0 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:   x7 ^= x0 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:   x0 ^= x3 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:   x2 ^= x5 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x4 ^= x7 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x6 ^= x1 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x4 ^= x1 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   2x r1 = x1 << 2
# asm 1: vshl.i64 >r1=reg128#12,<x1=reg128#2,#2
# asm 2: vshl.i64 >r1=q11,<x1=q1,#2
vshl.i64 q11,q1,#2

# qhasm:   2x x1 unsigned>>= 2
# asm 1: vshr.u64 >x1=reg128#2,<x1=reg128#2,#2
# asm 2: vshr.u64 >x1=q1,<x1=q1,#2
vshr.u64 q1,q1,#2

# qhasm:     2x r3 = x3 << 2
# asm 1: vshl.i64 >r3=reg128#13,<x3=reg128#4,#2
# asm 2: vshl.i64 >r3=q12,<x3=q3,#2
vshl.i64 q12,q3,#2

# qhasm:     2x x3 unsigned>>= 2
# asm 1: vshr.u64 >x3=reg128#4,<x3=reg128#4,#2
# asm 2: vshr.u64 >x3=q3,<x3=q3,#2
vshr.u64 q3,q3,#2

# qhasm:   x1 = (c33 & x1) | (~c33 & r1)
# asm 1: vbif <x1=reg128#2,<r1=reg128#12,<c33=reg128#10
# asm 2: vbif <x1=q1,<r1=q11,<c33=q9
vbif q1,q11,q9

# qhasm:     x3 = (c33 & x3) | (~c33 & r3)
# asm 1: vbif <x3=reg128#4,<r3=reg128#13,<c33=reg128#10
# asm 2: vbif <x3=q3,<r3=q12,<c33=q9
vbif q3,q12,q9

# qhasm:       2x r5 = x5 << 2
# asm 1: vshl.i64 >r5=reg128#12,<x5=reg128#6,#2
# asm 2: vshl.i64 >r5=q11,<x5=q5,#2
vshl.i64 q11,q5,#2

# qhasm:       2x x5 unsigned>>= 2
# asm 1: vshr.u64 >x5=reg128#6,<x5=reg128#6,#2
# asm 2: vshr.u64 >x5=q5,<x5=q5,#2
vshr.u64 q5,q5,#2

# qhasm:         2x r7 = x7 << 2
# asm 1: vshl.i64 >r7=reg128#13,<x7=reg128#8,#2
# asm 2: vshl.i64 >r7=q12,<x7=q7,#2
vshl.i64 q12,q7,#2

# qhasm:         2x x7 unsigned>>= 2
# asm 1: vshr.u64 >x7=reg128#8,<x7=reg128#8,#2
# asm 2: vshr.u64 >x7=q7,<x7=q7,#2
vshr.u64 q7,q7,#2

# qhasm:       x5 = (c33 & x5) | (~c33 & r5)
# asm 1: vbif <x5=reg128#6,<r5=reg128#12,<c33=reg128#10
# asm 2: vbif <x5=q5,<r5=q11,<c33=q9
vbif q5,q11,q9

# qhasm:         x7 = (c33 & x7) | (~c33 & r7)
# asm 1: vbif <x7=reg128#8,<r7=reg128#13,<c33=reg128#10
# asm 2: vbif <x7=q7,<r7=q12,<c33=q9
vbif q7,q12,q9

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:   x5 ^= x6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:   x1 ^= x2 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:   x3 ^= x4 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:   x5 ^= x0 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:   x7 ^= x0 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:   x0 ^= x3 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:   x2 ^= x5 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x4 ^= x7 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x6 ^= x1 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x4 ^= x1 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   2x r1 = x1 << 4
# asm 1: vshl.i64 >r1=reg128#12,<x1=reg128#2,#4
# asm 2: vshl.i64 >r1=q11,<x1=q1,#4
vshl.i64 q11,q1,#4

# qhasm:   2x x1 unsigned>>= 4
# asm 1: vshr.u64 >x1=reg128#2,<x1=reg128#2,#4
# asm 2: vshr.u64 >x1=q1,<x1=q1,#4
vshr.u64 q1,q1,#4

# qhasm:     2x r3 = x3 << 4
# asm 1: vshl.i64 >r3=reg128#13,<x3=reg128#4,#4
# asm 2: vshl.i64 >r3=q12,<x3=q3,#4
vshl.i64 q12,q3,#4

# qhasm:     2x x3 unsigned>>= 4
# asm 1: vshr.u64 >x3=reg128#4,<x3=reg128#4,#4
# asm 2: vshr.u64 >x3=q3,<x3=q3,#4
vshr.u64 q3,q3,#4

# qhasm:   x1 = (cf & x1) | (~cf & r1)
# asm 1: vbif <x1=reg128#2,<r1=reg128#12,<cf=reg128#9
# asm 2: vbif <x1=q1,<r1=q11,<cf=q8
vbif q1,q11,q8

# qhasm:     x3 = (cf & x3) | (~cf & r3)
# asm 1: vbif <x3=reg128#4,<r3=reg128#13,<cf=reg128#9
# asm 2: vbif <x3=q3,<r3=q12,<cf=q8
vbif q3,q12,q8

# qhasm:       2x r5 = x5 << 4
# asm 1: vshl.i64 >r5=reg128#12,<x5=reg128#6,#4
# asm 2: vshl.i64 >r5=q11,<x5=q5,#4
vshl.i64 q11,q5,#4

# qhasm:       2x x5 unsigned>>= 4
# asm 1: vshr.u64 >x5=reg128#6,<x5=reg128#6,#4
# asm 2: vshr.u64 >x5=q5,<x5=q5,#4
vshr.u64 q5,q5,#4

# qhasm:         2x r7 = x7 << 4
# asm 1: vshl.i64 >r7=reg128#13,<x7=reg128#8,#4
# asm 2: vshl.i64 >r7=q12,<x7=q7,#4
vshl.i64 q12,q7,#4

# qhasm:         2x x7 unsigned>>= 4
# asm 1: vshr.u64 >x7=reg128#8,<x7=reg128#8,#4
# asm 2: vshr.u64 >x7=q7,<x7=q7,#4
vshr.u64 q7,q7,#4

# qhasm:       x5 = (cf & x5) | (~cf & r5)
# asm 1: vbif <x5=reg128#6,<r5=reg128#12,<cf=reg128#9
# asm 2: vbif <x5=q5,<r5=q11,<cf=q8
vbif q5,q11,q8

# qhasm:         x7 = (cf & x7) | (~cf & r7)
# asm 1: vbif <x7=reg128#8,<r7=reg128#13,<cf=reg128#9
# asm 2: vbif <x7=q7,<r7=q12,<cf=q8
vbif q7,q12,q8

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:     x5 ^= x6
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:     x1 ^= x2
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:     x3 ^= x4
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:     x5 ^= x0
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:     x7 ^= x0
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:     x0 ^= x3
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:     x2 ^= x5
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x3 = x3[1] x3[0] x3[3] x3[2] x3[5] x3[4] x3[7] x3[6] x3[9] x3[8] x3[11] x3[10] x3[13] x3[12] x3[15] x3[14]
# asm 1: vrev16.i8 >x3=reg128#4,<x3=reg128#4
# asm 2: vrev16.i8 >x3=q3,<x3=q3
vrev16.i8 q3,q3

# qhasm:     x4 ^= x7
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x5 = x5[1] x5[0] x5[3] x5[2] x5[5] x5[4] x5[7] x5[6] x5[9] x5[8] x5[11] x5[10] x5[13] x5[12] x5[15] x5[14]
# asm 1: vrev16.i8 >x5=reg128#6,<x5=reg128#6
# asm 2: vrev16.i8 >x5=q5,<x5=q5
vrev16.i8 q5,q5

# qhasm:     x6 ^= x1
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x7 = x7[1] x7[0] x7[3] x7[2] x7[5] x7[4] x7[7] x7[6] x7[9] x7[8] x7[11] x7[10] x7[13] x7[12] x7[15] x7[14]
# asm 1: vrev16.i8 >x7=reg128#8,<x7=reg128#8
# asm 2: vrev16.i8 >x7=q7,<x7=q7
vrev16.i8 q7,q7

# qhasm:     x4 ^= x1
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   x1 = x1[1] x1[0] x1[3] x1[2] x1[5] x1[4] x1[7] x1[6] x1[9] x1[8] x1[11] x1[10] x1[13] x1[12] x1[15] x1[14]
# asm 1: vrev16.i8 >x1=reg128#2,<x1=reg128#2
# asm 2: vrev16.i8 >x1=q1,<x1=q1
vrev16.i8 q1,q1

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:     x5 ^= x6
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:     x1 ^= x2
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:     x3 ^= x4
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:     x5 ^= x0
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:     x7 ^= x0
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:     x0 ^= x3
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:     x2 ^= x5
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x3 = x3[1] x3[0] x3[3] x3[2] x3[5] x3[4] x3[7] x3[6]
# asm 1: vrev32.i16 >x3=reg128#4,<x3=reg128#4
# asm 2: vrev32.i16 >x3=q3,<x3=q3
vrev32.i16 q3,q3

# qhasm:     x4 ^= x7
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x5 = x5[1] x5[0] x5[3] x5[2] x5[5] x5[4] x5[7] x5[6]
# asm 1: vrev32.i16 >x5=reg128#6,<x5=reg128#6
# asm 2: vrev32.i16 >x5=q5,<x5=q5
vrev32.i16 q5,q5

# qhasm:     x6 ^= x1
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x7 = x7[1] x7[0] x7[3] x7[2] x7[5] x7[4] x7[7] x7[6]
# asm 1: vrev32.i16 >x7=reg128#8,<x7=reg128#8
# asm 2: vrev32.i16 >x7=q7,<x7=q7
vrev32.i16 q7,q7

# qhasm:     x4 ^= x1
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   x1 = x1[1] x1[0] x1[3] x1[2] x1[5] x1[4] x1[7] x1[6]
# asm 1: vrev32.i16 >x1=reg128#2,<x1=reg128#2
# asm 2: vrev32.i16 >x1=q1,<x1=q1
vrev32.i16 q1,q1

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:     x5 ^= x6
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:     x1 ^= x2
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:     x3 ^= x4
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:     x5 ^= x0
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:     x7 ^= x0
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:     x0 ^= x3
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:     x2 ^= x5
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x3 = x3[1] x3[0] x3[3] x3[2]
# asm 1: vrev64.i32 >x3=reg128#4,<x3=reg128#4
# asm 2: vrev64.i32 >x3=q3,<x3=q3
vrev64.i32 q3,q3

# qhasm:     x4 ^= x7
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x5 = x5[1] x5[0] x5[3] x5[2]
# asm 1: vrev64.i32 >x5=reg128#6,<x5=reg128#6
# asm 2: vrev64.i32 >x5=q5,<x5=q5
vrev64.i32 q5,q5

# qhasm:     x6 ^= x1
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x7 = x7[1] x7[0] x7[3] x7[2]
# asm 1: vrev64.i32 >x7=reg128#8,<x7=reg128#8
# asm 2: vrev64.i32 >x7=q7,<x7=q7
vrev64.i32 q7,q7

# qhasm:     x4 ^= x1
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   x1 = x1[1] x1[0] x1[3] x1[2]
# asm 1: vrev64.i32 >x1=reg128#2,<x1=reg128#2
# asm 2: vrev64.i32 >x1=q1,<x1=q1
vrev64.i32 q1,q1

# qhasm:   temp0 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp0=reg128#12%bot->temp0=reg128#12%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp0=d22->temp0=d23},[<input_2=r2,: 128]!
vld1.8 {d22-d23},[r2,: 128]!

# qhasm:   r0 = temp0 & ~x4 
# asm 1: vbic >r0=reg128#13,<temp0=reg128#12,<x4=reg128#5
# asm 2: vbic >r0=q12,<temp0=q11,<x4=q4
vbic q12,q11,q4

# qhasm:   temp1 aligned= mem128[input_2];input_2 += 16 
# asm 1: vld1.8 {>temp1=reg128#14%bot->temp1=reg128#14%top},[<input_2=int32#3,: 128]!
# asm 2: vld1.8 {>temp1=d26->temp1=d27},[<input_2=r2,: 128]!
vld1.8 {d26-d27},[r2,: 128]!

# qhasm:   r4 = temp1 & ~x5 
# asm 1: vbic >r4=reg128#15,<temp1=reg128#14,<x5=reg128#6
# asm 2: vbic >r4=q14,<temp1=q13,<x5=q5
vbic q14,q13,q5

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#13
# asm 2: veor >x0=q0,<x0=q0,<r0=q12
veor q0,q0,q12

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r1 = x0 & x2 
# asm 1: vand >r1=reg128#13,<x0=reg128#1,<x2=reg128#3
# asm 2: vand >r1=q12,<x0=q0,<x2=q2
vand q12,q0,q2

# qhasm:   r5 = x1 & x3 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x3=reg128#4
# asm 2: vand >r5=q14,<x1=q1,<x3=q3
vand q14,q1,q3

# qhasm:   temp0 ^= r1 
# asm 1: veor >temp0=reg128#12,<temp0=reg128#12,<r1=reg128#13
# asm 2: veor >temp0=q11,<temp0=q11,<r1=q12
veor q11,q11,q12

# qhasm:   temp1 ^= r5 
# asm 1: veor >temp1=reg128#13,<temp1=reg128#14,<r5=reg128#15
# asm 2: veor >temp1=q12,<temp1=q13,<r5=q14
veor q12,q13,q14

# qhasm:   r0 = x4 & ~x6 
# asm 1: vbic >r0=reg128#14,<x4=reg128#5,<x6=reg128#7
# asm 2: vbic >r0=q13,<x4=q4,<x6=q6
vbic q13,q4,q6

# qhasm:   r4 = x5 & ~x7 
# asm 1: vbic >r4=reg128#15,<x5=reg128#6,<x7=reg128#8
# asm 2: vbic >r4=q14,<x5=q5,<x7=q7
vbic q14,q5,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 | ~x4 
# asm 1: vorn >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vorn >r3=q13,<x2=q2,<x4=q4
vorn q13,q2,q4

# qhasm:   r7 = x3 | ~x5 
# asm 1: vorn >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vorn >r7=q14,<x3=q3,<x5=q5
vorn q14,q3,q5

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = x0 & x4 
# asm 1: vand >r1=reg128#14,<x0=reg128#1,<x4=reg128#5
# asm 2: vand >r1=q13,<x0=q0,<x4=q4
vand q13,q0,q4

# qhasm:   r5 = x1 & x5 
# asm 1: vand >r5=reg128#15,<x1=reg128#2,<x5=reg128#6
# asm 2: vand >r5=q14,<x1=q1,<x5=q5
vand q14,q1,q5

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#14
# asm 2: veor >x2=q2,<x2=q2,<r1=q13
veor q2,q2,q13

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#15
# asm 2: veor >x3=q3,<x3=q3,<r5=q14
veor q3,q3,q14

# qhasm:   r2 = x0 & ~x6 
# asm 1: vbic >r2=reg128#14,<x0=reg128#1,<x6=reg128#7
# asm 2: vbic >r2=q13,<x0=q0,<x6=q6
vbic q13,q0,q6

# qhasm:   r6 = x1 & ~x7 
# asm 1: vbic >r6=reg128#15,<x1=reg128#2,<x7=reg128#8
# asm 2: vbic >r6=q14,<x1=q1,<x7=q7
vbic q14,q1,q7

# qhasm:   x4 ^= r2 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r2=reg128#14
# asm 2: veor >x4=q4,<x4=q4,<r2=q13
veor q4,q4,q13

# qhasm:   x5 ^= r6 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<r6=reg128#15
# asm 2: veor >x5=q5,<x5=q5,<r6=q14
veor q5,q5,q14

# qhasm:   r0 = x2 | x6 
# asm 1: vorr >r0=reg128#14,<x2=reg128#3,<x6=reg128#7
# asm 2: vorr >r0=q13,<x2=q2,<x6=q6
vorr q13,q2,q6

# qhasm:   r4 = x3 | x7 
# asm 1: vorr >r4=reg128#15,<x3=reg128#4,<x7=reg128#8
# asm 2: vorr >r4=q14,<x3=q3,<x7=q7
vorr q14,q3,q7

# qhasm:   x0 ^= r0 
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<r0=reg128#14
# asm 2: veor >x0=q0,<x0=q0,<r0=q13
veor q0,q0,q13

# qhasm:   x1 ^= r4 
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<r4=reg128#15
# asm 2: veor >x1=q1,<x1=q1,<r4=q14
veor q1,q1,q14

# qhasm:   r3 = x2 & x4 
# asm 1: vand >r3=reg128#14,<x2=reg128#3,<x4=reg128#5
# asm 2: vand >r3=q13,<x2=q2,<x4=q4
vand q13,q2,q4

# qhasm:   x4 ^= temp0 
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<temp0=reg128#12
# asm 2: veor >x4=q4,<x4=q4,<temp0=q11
veor q4,q4,q11

# qhasm:   r7 = x3 & x5 
# asm 1: vand >r7=reg128#15,<x3=reg128#4,<x5=reg128#6
# asm 2: vand >r7=q14,<x3=q3,<x5=q5
vand q14,q3,q5

# qhasm:   x5 ^= temp1 
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<temp1=reg128#13
# asm 2: veor >x5=q5,<x5=q5,<temp1=q12
veor q5,q5,q12

# qhasm:   x6 ^= r3 
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<r3=reg128#14
# asm 2: veor >x6=q6,<x6=q6,<r3=q13
veor q6,q6,q13

# qhasm:   x7 ^= r7 
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<r7=reg128#15
# asm 2: veor >x7=q7,<x7=q7,<r7=q14
veor q7,q7,q14

# qhasm:   r1 = temp0 & x0 
# asm 1: vand >r1=reg128#12,<temp0=reg128#12,<x0=reg128#1
# asm 2: vand >r1=q11,<temp0=q11,<x0=q0
vand q11,q11,q0

# qhasm:   r5 = temp1 & x1 
# asm 1: vand >r5=reg128#13,<temp1=reg128#13,<x1=reg128#2
# asm 2: vand >r5=q12,<temp1=q12,<x1=q1
vand q12,q12,q1

# qhasm:   x2 ^= r1 
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<r1=reg128#12
# asm 2: veor >x2=q2,<x2=q2,<r1=q11
veor q2,q2,q11

# qhasm:   x3 ^= r5 
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<r5=reg128#13
# asm 2: veor >x3=q3,<x3=q3,<r5=q12
veor q3,q3,q12

# qhasm:     x5 ^= x6
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x6=reg128#7
# asm 2: veor >x5=q5,<x5=q5,<x6=q6
veor q5,q5,q6

# qhasm:     x1 ^= x2
# asm 1: veor >x1=reg128#2,<x1=reg128#2,<x2=reg128#3
# asm 2: veor >x1=q1,<x1=q1,<x2=q2
veor q1,q1,q2

# qhasm:     x3 ^= x4
# asm 1: veor >x3=reg128#4,<x3=reg128#4,<x4=reg128#5
# asm 2: veor >x3=q3,<x3=q3,<x4=q4
veor q3,q3,q4

# qhasm:     x5 ^= x0
# asm 1: veor >x5=reg128#6,<x5=reg128#6,<x0=reg128#1
# asm 2: veor >x5=q5,<x5=q5,<x0=q0
veor q5,q5,q0

# qhasm:     x7 ^= x0
# asm 1: veor >x7=reg128#8,<x7=reg128#8,<x0=reg128#1
# asm 2: veor >x7=q7,<x7=q7,<x0=q0
veor q7,q7,q0

# qhasm:     x0 ^= x3
# asm 1: veor >x0=reg128#1,<x0=reg128#1,<x3=reg128#4
# asm 2: veor >x0=q0,<x0=q0,<x3=q3
veor q0,q0,q3

# qhasm:     x2 ^= x5
# asm 1: veor >x2=reg128#3,<x2=reg128#3,<x5=reg128#6
# asm 2: veor >x2=q2,<x2=q2,<x5=q5
veor q2,q2,q5

# qhasm:   x3 = x3[1] x3[0]
# asm 1: vswp <x3=reg128#4%bot,<x3=reg128#4%top
# asm 2: vswp <x3=d6,<x3=d7
vswp d6,d7

# qhasm:     x4 ^= x7
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x7=reg128#8
# asm 2: veor >x4=q4,<x4=q4,<x7=q7
veor q4,q4,q7

# qhasm:   x5 = x5[1] x5[0]
# asm 1: vswp <x5=reg128#6%bot,<x5=reg128#6%top
# asm 2: vswp <x5=d10,<x5=d11
vswp d10,d11

# qhasm:     x6 ^= x1
# asm 1: veor >x6=reg128#7,<x6=reg128#7,<x1=reg128#2
# asm 2: veor >x6=q6,<x6=q6,<x1=q1
veor q6,q6,q1

# qhasm:   x7 = x7[1] x7[0]
# asm 1: vswp <x7=reg128#8%bot,<x7=reg128#8%top
# asm 2: vswp <x7=d14,<x7=d15
vswp d14,d15

# qhasm:     x4 ^= x1
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<x1=reg128#2
# asm 2: veor >x4=q4,<x4=q4,<x1=q1
veor q4,q4,q1

# qhasm:   x1 = x1[1] x1[0]
# asm 1: vswp <x1=reg128#2%bot,<x1=reg128#2%top
# asm 2: vswp <x1=d2,<x1=d3
vswp d2,d3

# qhasm:                  unsigned>? r -= 7
# asm 1: subs >r=int32#4,<r=int32#4,#7
# asm 2: subs >r=r3,<r=r3,#7
subs r3,r3,#7

# qhasm: goto mainloop if unsigned>
bhi ._mainloop

# qhasm: r0 = mem128[input_1];input_1 += 16
# asm 1: vld1.8 {>r0=reg128#9%bot->r0=reg128#9%top},[<input_1=int32#2]!
# asm 2: vld1.8 {>r0=d16->r0=d17},[<input_1=r1]!
vld1.8 {d16-d17},[r1]!

# qhasm: r1 = mem128[input_1];input_1 += 16
# asm 1: vld1.8 {>r1=reg128#10%bot->r1=reg128#10%top},[<input_1=int32#2]!
# asm 2: vld1.8 {>r1=d18->r1=d19},[<input_1=r1]!
vld1.8 {d18-d19},[r1]!

# qhasm: r2 = mem128[input_1];input_1 += 16
# asm 1: vld1.8 {>r2=reg128#11%bot->r2=reg128#11%top},[<input_1=int32#2]!
# asm 2: vld1.8 {>r2=d20->r2=d21},[<input_1=r1]!
vld1.8 {d20-d21},[r1]!

# qhasm: r3 = mem128[input_1]
# asm 1: vld1.8 {>r3=reg128#12%bot->r3=reg128#12%top},[<input_1=int32#2]
# asm 2: vld1.8 {>r3=d22->r3=d23},[<input_1=r1]
vld1.8 {d22-d23},[r1]

# qhasm: x4 ^= r0
# asm 1: veor >x4=reg128#5,<x4=reg128#5,<r0=reg128#9
# asm 2: veor >x4=q4,<x4=q4,<r0=q8
veor q4,q4,q8

# qhasm:   mem128[input_0] = x0;input_0 += 16
# asm 1: vst1.8 {<x0=reg128#1%bot-<x0=reg128#1%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x0=d0-<x0=d1},[<input_0=r0]!
vst1.8 {d0-d1},[r0]!

# qhasm: x5 ^= r1
# asm 1: veor >x5=reg128#1,<x5=reg128#6,<r1=reg128#10
# asm 2: veor >x5=q0,<x5=q5,<r1=q9
veor q0,q5,q9

# qhasm:   mem128[input_0] = x1;input_0 += 16
# asm 1: vst1.8 {<x1=reg128#2%bot-<x1=reg128#2%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x1=d2-<x1=d3},[<input_0=r0]!
vst1.8 {d2-d3},[r0]!

# qhasm: x6 ^= r2
# asm 1: veor >x6=reg128#2,<x6=reg128#7,<r2=reg128#11
# asm 2: veor >x6=q1,<x6=q6,<r2=q10
veor q1,q6,q10

# qhasm:   mem128[input_0] = x2;input_0 += 16
# asm 1: vst1.8 {<x2=reg128#3%bot-<x2=reg128#3%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x2=d4-<x2=d5},[<input_0=r0]!
vst1.8 {d4-d5},[r0]!

# qhasm: x7 ^= r3
# asm 1: veor >x7=reg128#3,<x7=reg128#8,<r3=reg128#12
# asm 2: veor >x7=q2,<x7=q7,<r3=q11
veor q2,q7,q11

# qhasm:   mem128[input_0] = x3;input_0 += 16
# asm 1: vst1.8 {<x3=reg128#4%bot-<x3=reg128#4%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x3=d6-<x3=d7},[<input_0=r0]!
vst1.8 {d6-d7},[r0]!

# qhasm: mem128[input_0] = x4;input_0 += 16
# asm 1: vst1.8 {<x4=reg128#5%bot-<x4=reg128#5%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x4=d8-<x4=d9},[<input_0=r0]!
vst1.8 {d8-d9},[r0]!

# qhasm: mem128[input_0] = x5;input_0 += 16
# asm 1: vst1.8 {<x5=reg128#1%bot-<x5=reg128#1%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x5=d0-<x5=d1},[<input_0=r0]!
vst1.8 {d0-d1},[r0]!

# qhasm: mem128[input_0] = x6;input_0 += 16
# asm 1: vst1.8 {<x6=reg128#2%bot-<x6=reg128#2%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<x6=d2-<x6=d3},[<input_0=r0]!
vst1.8 {d2-d3},[r0]!

# qhasm: mem128[input_0] = x7
# asm 1: vst1.8 {<x7=reg128#3%bot-<x7=reg128#3%top},[<input_0=int32#1]
# asm 2: vst1.8 {<x7=d4-<x7=d5},[<input_0=r0]
vst1.8 {d4-d5},[r0]

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
