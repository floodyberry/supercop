
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

# qhasm: int32 caller_r14

# qhasm: reg128 caller_q4

# qhasm: reg128 caller_q5

# qhasm: reg128 caller_q6

# qhasm: reg128 caller_q7

# qhasm: startcode
.fpu neon
.text

# qhasm: int32 b0

# qhasm: int32 b1

# qhasm: int32 b2

# qhasm: int32 b3

# qhasm: int32 b4

# qhasm: int32 b5

# qhasm: int32 b6

# qhasm: int32 b7

# qhasm: int32 t00

# qhasm: int32 t01

# qhasm: int32 t10

# qhasm: int32 t11

# qhasm: int32 t20

# qhasm: int32 t21

# qhasm: int32 t30

# qhasm: int32 t31

# qhasm: int32 t40

# qhasm: int32 t41

# qhasm: int32 t50

# qhasm: int32 t51

# qhasm: int32 t60

# qhasm: int32 t61

# qhasm: int32 t70

# qhasm: int32 t71

# qhasm: int32 x0

# qhasm: int32 x1

# qhasm: int32 x2

# qhasm: int32 x3

# qhasm: int32 x4

# qhasm: int32 x5

# qhasm: int32 x6

# qhasm: int32 x7

# qhasm: int32 x8

# qhasm: int32 x9

# qhasm: int32 x10

# qhasm: int32 x11

# qhasm: int32 x12

# qhasm: int32 x13

# qhasm: int32 x14

# qhasm: int32 x15

# qhasm: int32 y0

# qhasm: int32 y1

# qhasm: int32 y2

# qhasm: int32 y3

# qhasm: int32 y4

# qhasm: int32 y5

# qhasm: int32 y6

# qhasm: int32 y7

# qhasm: int32 y8

# qhasm: int32 y9

# qhasm: int32 y10

# qhasm: int32 y11

# qhasm: int32 y12

# qhasm: int32 y13

# qhasm: int32 y14

# qhasm: int32 y15

# qhasm: int32 t

# qhasm: int32 c

# qhasm: stack512 y

# qhasm: int32 yp

# qhasm: stack32 caller_r4_stack

# qhasm: stack32 caller_r5_stack

# qhasm: stack32 caller_r6_stack

# qhasm: stack32 caller_r7_stack

# qhasm: stack32 caller_r8_stack

# qhasm: stack32 caller_r9_stack

# qhasm: stack32 caller_r10_stack

# qhasm: stack32 caller_r11_stack

# qhasm: stack32 caller_r14_stack

# qhasm: enter ploop
.align 2
.global _ploop
.global ploop
_ploop:
ploop:
sub sp,sp,#128

# qhasm: caller_r4_stack = caller_r4
# asm 1: str <caller_r4=int32#5,>caller_r4_stack=stack32#1
# asm 2: str <caller_r4=r4,>caller_r4_stack=[sp,#0]
str r4,[sp,#0]

# qhasm: caller_r5_stack = caller_r5
# asm 1: str <caller_r5=int32#6,>caller_r5_stack=stack32#2
# asm 2: str <caller_r5=r5,>caller_r5_stack=[sp,#4]
str r5,[sp,#4]

# qhasm: caller_r6_stack = caller_r6
# asm 1: str <caller_r6=int32#7,>caller_r6_stack=stack32#3
# asm 2: str <caller_r6=r6,>caller_r6_stack=[sp,#8]
str r6,[sp,#8]

# qhasm: caller_r7_stack = caller_r7
# asm 1: str <caller_r7=int32#8,>caller_r7_stack=stack32#4
# asm 2: str <caller_r7=r7,>caller_r7_stack=[sp,#12]
str r7,[sp,#12]

# qhasm: caller_r8_stack = caller_r8
# asm 1: str <caller_r8=int32#9,>caller_r8_stack=stack32#5
# asm 2: str <caller_r8=r8,>caller_r8_stack=[sp,#16]
str r8,[sp,#16]

# qhasm: caller_r9_stack = caller_r9
# asm 1: str <caller_r9=int32#10,>caller_r9_stack=stack32#6
# asm 2: str <caller_r9=r9,>caller_r9_stack=[sp,#20]
str r9,[sp,#20]

# qhasm: caller_r10_stack = caller_r10
# asm 1: str <caller_r10=int32#11,>caller_r10_stack=stack32#7
# asm 2: str <caller_r10=r10,>caller_r10_stack=[sp,#24]
str r10,[sp,#24]

# qhasm: caller_r11_stack = caller_r11
# asm 1: str <caller_r11=int32#12,>caller_r11_stack=stack32#8
# asm 2: str <caller_r11=r11,>caller_r11_stack=[sp,#28]
str r11,[sp,#28]

# qhasm: caller_r14_stack = caller_r14
# asm 1: str <caller_r14=int32#14,>caller_r14_stack=stack32#9
# asm 2: str <caller_r14=r14,>caller_r14_stack=[sp,#32]
str r14,[sp,#32]

# qhasm: c = 0
# asm 1: ldr >c=int32#3,=0
# asm 2: ldr >c=r2,=0
ldr r2,=0

# qhasm: yp = &y
# asm 1: lea >yp=int32#4,<y=stack512#1
# asm 2: lea >yp=r3,<y=[sp,#64]
add r3,sp,#64

# qhasm: ploop:
._ploop:

# qhasm:   b0 = mem8[input_0 +0]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#0]
# asm 2: ldrb >b0=r4,[<input_0=r0,#0]
ldrb r4,[r0,#0]

# qhasm:   b4 = mem8[input_0 +36]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#36]
# asm 2: ldrb >b4=r5,[<input_0=r0,#36]
ldrb r5,[r0,#36]

# qhasm:   b1 = mem8[input_0 +9]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#9]
# asm 2: ldrb >b1=r10,[<input_0=r0,#9]
ldrb r10,[r0,#9]

# qhasm:   b5 = mem8[input_0 +45]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#45]
# asm 2: ldrb >b5=r11,[<input_0=r0,#45]
ldrb r11,[r0,#45]

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y0 y1 = mem64[b0 + 0]
# asm 1: ldrd >y0=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y0=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y0 ^= t41
# asm 1: eor >y0=int32#9,<y0=int32#9,<t41=int32#8
# asm 2: eor >y0=r8,<y0=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y1 ^= t40
# asm 1: eor >y1=int32#10,<y1=int32#10,<t40=int32#7
# asm 2: eor >y1=r9,<y1=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +18]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#18]
# asm 2: ldrb >b2=r10,[<input_0=r0,#18]
ldrb r10,[r0,#18]

# qhasm:   b6 = mem8[input_0 +54]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#54]
# asm 2: ldrb >b6=r11,[<input_0=r0,#54]
ldrb r11,[r0,#54]

# qhasm:   y0 ^= t10
# asm 1: eor >y0=int32#5,<y0=int32#9,<t10=int32#5
# asm 2: eor >y0=r4,<y0=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y1 ^= t11
# asm 1: eor >y1=int32#6,<y1=int32#10,<t11=int32#6
# asm 2: eor >y1=r5,<y1=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y0 ^= t51
# asm 1: eor >y0=int32#9,<y0=int32#5,<t51=int32#8
# asm 2: eor >y0=r8,<y0=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y1 ^= t50
# asm 1: eor >y1=int32#10,<y1=int32#6,<t50=int32#7
# asm 2: eor >y1=r9,<y1=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +27]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#27]
# asm 2: ldrb >b3=r12,[<input_0=r0,#27]
ldrb r12,[r0,#27]

# qhasm:   b7 = mem8[input_0 +63]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#63]
# asm 2: ldrb >b7=r14,[<input_0=r0,#63]
ldrb r14,[r0,#63]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y0 ^= t20
# asm 1: eor >y0=int32#9,<y0=int32#9,<t20=int32#5
# asm 2: eor >y0=r8,<y0=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y1 ^= t21
# asm 1: eor >y1=int32#10,<y1=int32#10,<t21=int32#6
# asm 2: eor >y1=r9,<y1=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y0 ^= t61
# asm 1: eor >y0=int32#9,<y0=int32#9,<t61=int32#8
# asm 2: eor >y0=r8,<y0=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y1 ^= t60
# asm 1: eor >y1=int32#10,<y1=int32#10,<t60=int32#7
# asm 2: eor >y1=r9,<y1=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y0 ^= t30
# asm 1: eor >y0=int32#5,<y0=int32#9,<t30=int32#5
# asm 2: eor >y0=r4,<y0=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y1 ^= t31
# asm 1: eor >y1=int32#6,<y1=int32#10,<t31=int32#6
# asm 2: eor >y1=r5,<y1=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y0 ^= t71
# asm 1: eor >y0=int32#9,<y0=int32#5,<t71=int32#8
# asm 2: eor >y0=r8,<y0=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y1 ^= t70
# asm 1: eor >y1=int32#10,<y1=int32#6,<t70=int32#7
# asm 2: eor >y1=r9,<y1=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y0 y1;mem64[yp + 0] = y0 y1
# asm 1: strd <y0=int32#9,[<yp=int32#4,#0]
# asm 2: strd <y0=r8,[<yp=r3,#0]
strd r8,[r3,#0]

# qhasm:   b0 = mem8[input_0 +8]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#8]
# asm 2: ldrb >b0=r4,[<input_0=r0,#8]
ldrb r4,[r0,#8]

# qhasm:   b4 = mem8[input_0 +44]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#44]
# asm 2: ldrb >b4=r5,[<input_0=r0,#44]
ldrb r5,[r0,#44]

# qhasm:   b1 = mem8[input_0 +17]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#17]
# asm 2: ldrb >b1=r10,[<input_0=r0,#17]
ldrb r10,[r0,#17]

# qhasm:   b5 = mem8[input_0 +53]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#53]
# asm 2: ldrb >b5=r11,[<input_0=r0,#53]
ldrb r11,[r0,#53]

# qhasm:   b0 ^= 0x10
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x10
# asm 2: eor >b0=r4,<b0=r4,#0x10
eor r4,r4,#0x10

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y2 y3 = mem64[b0 + 0]
# asm 1: ldrd >y2=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y2=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y2 ^= t41
# asm 1: eor >y2=int32#9,<y2=int32#9,<t41=int32#8
# asm 2: eor >y2=r8,<y2=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y3 ^= t40
# asm 1: eor >y3=int32#10,<y3=int32#10,<t40=int32#7
# asm 2: eor >y3=r9,<y3=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +26]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#26]
# asm 2: ldrb >b2=r10,[<input_0=r0,#26]
ldrb r10,[r0,#26]

# qhasm:   b6 = mem8[input_0 +62]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#62]
# asm 2: ldrb >b6=r11,[<input_0=r0,#62]
ldrb r11,[r0,#62]

# qhasm:   y2 ^= t10
# asm 1: eor >y2=int32#5,<y2=int32#9,<t10=int32#5
# asm 2: eor >y2=r4,<y2=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y3 ^= t11
# asm 1: eor >y3=int32#6,<y3=int32#10,<t11=int32#6
# asm 2: eor >y3=r5,<y3=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y2 ^= t51
# asm 1: eor >y2=int32#9,<y2=int32#5,<t51=int32#8
# asm 2: eor >y2=r8,<y2=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y3 ^= t50
# asm 1: eor >y3=int32#10,<y3=int32#6,<t50=int32#7
# asm 2: eor >y3=r9,<y3=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +35]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#35]
# asm 2: ldrb >b3=r12,[<input_0=r0,#35]
ldrb r12,[r0,#35]

# qhasm:   b7 = mem8[input_0 +7]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#7]
# asm 2: ldrb >b7=r14,[<input_0=r0,#7]
ldrb r14,[r0,#7]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y2 ^= t20
# asm 1: eor >y2=int32#9,<y2=int32#9,<t20=int32#5
# asm 2: eor >y2=r8,<y2=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y3 ^= t21
# asm 1: eor >y3=int32#10,<y3=int32#10,<t21=int32#6
# asm 2: eor >y3=r9,<y3=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y2 ^= t61
# asm 1: eor >y2=int32#9,<y2=int32#9,<t61=int32#8
# asm 2: eor >y2=r8,<y2=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y3 ^= t60
# asm 1: eor >y3=int32#10,<y3=int32#10,<t60=int32#7
# asm 2: eor >y3=r9,<y3=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y2 ^= t30
# asm 1: eor >y2=int32#5,<y2=int32#9,<t30=int32#5
# asm 2: eor >y2=r4,<y2=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y3 ^= t31
# asm 1: eor >y3=int32#6,<y3=int32#10,<t31=int32#6
# asm 2: eor >y3=r5,<y3=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y2 ^= t71
# asm 1: eor >y2=int32#9,<y2=int32#5,<t71=int32#8
# asm 2: eor >y2=r8,<y2=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y3 ^= t70
# asm 1: eor >y3=int32#10,<y3=int32#6,<t70=int32#7
# asm 2: eor >y3=r9,<y3=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y2 y3;mem64[yp + 8] = y2 y3
# asm 1: strd <y2=int32#9,[<yp=int32#4,#8]
# asm 2: strd <y2=r8,[<yp=r3,#8]
strd r8,[r3,#8]

# qhasm:   b0 = mem8[input_0 +16]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#16]
# asm 2: ldrb >b0=r4,[<input_0=r0,#16]
ldrb r4,[r0,#16]

# qhasm:   b4 = mem8[input_0 +52]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#52]
# asm 2: ldrb >b4=r5,[<input_0=r0,#52]
ldrb r5,[r0,#52]

# qhasm:   b1 = mem8[input_0 +25]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#25]
# asm 2: ldrb >b1=r10,[<input_0=r0,#25]
ldrb r10,[r0,#25]

# qhasm:   b5 = mem8[input_0 +61]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#61]
# asm 2: ldrb >b5=r11,[<input_0=r0,#61]
ldrb r11,[r0,#61]

# qhasm:   b0 ^= 0x20
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x20
# asm 2: eor >b0=r4,<b0=r4,#0x20
eor r4,r4,#0x20

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y4 y5 = mem64[b0 + 0]
# asm 1: ldrd >y4=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y4=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y4 ^= t41
# asm 1: eor >y4=int32#9,<y4=int32#9,<t41=int32#8
# asm 2: eor >y4=r8,<y4=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y5 ^= t40
# asm 1: eor >y5=int32#10,<y5=int32#10,<t40=int32#7
# asm 2: eor >y5=r9,<y5=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +34]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#34]
# asm 2: ldrb >b2=r10,[<input_0=r0,#34]
ldrb r10,[r0,#34]

# qhasm:   b6 = mem8[input_0 +6]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#6]
# asm 2: ldrb >b6=r11,[<input_0=r0,#6]
ldrb r11,[r0,#6]

# qhasm:   y4 ^= t10
# asm 1: eor >y4=int32#5,<y4=int32#9,<t10=int32#5
# asm 2: eor >y4=r4,<y4=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y5 ^= t11
# asm 1: eor >y5=int32#6,<y5=int32#10,<t11=int32#6
# asm 2: eor >y5=r5,<y5=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y4 ^= t51
# asm 1: eor >y4=int32#9,<y4=int32#5,<t51=int32#8
# asm 2: eor >y4=r8,<y4=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y5 ^= t50
# asm 1: eor >y5=int32#10,<y5=int32#6,<t50=int32#7
# asm 2: eor >y5=r9,<y5=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +43]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#43]
# asm 2: ldrb >b3=r12,[<input_0=r0,#43]
ldrb r12,[r0,#43]

# qhasm:   b7 = mem8[input_0 +15]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#15]
# asm 2: ldrb >b7=r14,[<input_0=r0,#15]
ldrb r14,[r0,#15]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y4 ^= t20
# asm 1: eor >y4=int32#9,<y4=int32#9,<t20=int32#5
# asm 2: eor >y4=r8,<y4=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y5 ^= t21
# asm 1: eor >y5=int32#10,<y5=int32#10,<t21=int32#6
# asm 2: eor >y5=r9,<y5=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y4 ^= t61
# asm 1: eor >y4=int32#9,<y4=int32#9,<t61=int32#8
# asm 2: eor >y4=r8,<y4=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y5 ^= t60
# asm 1: eor >y5=int32#10,<y5=int32#10,<t60=int32#7
# asm 2: eor >y5=r9,<y5=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y4 ^= t30
# asm 1: eor >y4=int32#5,<y4=int32#9,<t30=int32#5
# asm 2: eor >y4=r4,<y4=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y5 ^= t31
# asm 1: eor >y5=int32#6,<y5=int32#10,<t31=int32#6
# asm 2: eor >y5=r5,<y5=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y4 ^= t71
# asm 1: eor >y4=int32#9,<y4=int32#5,<t71=int32#8
# asm 2: eor >y4=r8,<y4=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y5 ^= t70
# asm 1: eor >y5=int32#10,<y5=int32#6,<t70=int32#7
# asm 2: eor >y5=r9,<y5=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y4 y5;mem64[yp + 16] = y4 y5
# asm 1: strd <y4=int32#9,[<yp=int32#4,#16]
# asm 2: strd <y4=r8,[<yp=r3,#16]
strd r8,[r3,#16]

# qhasm:   b0 = mem8[input_0 +24]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#24]
# asm 2: ldrb >b0=r4,[<input_0=r0,#24]
ldrb r4,[r0,#24]

# qhasm:   b4 = mem8[input_0 +60]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#60]
# asm 2: ldrb >b4=r5,[<input_0=r0,#60]
ldrb r5,[r0,#60]

# qhasm:   b1 = mem8[input_0 +33]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#33]
# asm 2: ldrb >b1=r10,[<input_0=r0,#33]
ldrb r10,[r0,#33]

# qhasm:   b5 = mem8[input_0 +5]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#5]
# asm 2: ldrb >b5=r11,[<input_0=r0,#5]
ldrb r11,[r0,#5]

# qhasm:   b0 ^= 0x30
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x30
# asm 2: eor >b0=r4,<b0=r4,#0x30
eor r4,r4,#0x30

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y6 y7 = mem64[b0 + 0]
# asm 1: ldrd >y6=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y6=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y6 ^= t41
# asm 1: eor >y6=int32#9,<y6=int32#9,<t41=int32#8
# asm 2: eor >y6=r8,<y6=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y7 ^= t40
# asm 1: eor >y7=int32#10,<y7=int32#10,<t40=int32#7
# asm 2: eor >y7=r9,<y7=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +42]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#42]
# asm 2: ldrb >b2=r10,[<input_0=r0,#42]
ldrb r10,[r0,#42]

# qhasm:   b6 = mem8[input_0 +14]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#14]
# asm 2: ldrb >b6=r11,[<input_0=r0,#14]
ldrb r11,[r0,#14]

# qhasm:   y6 ^= t10
# asm 1: eor >y6=int32#5,<y6=int32#9,<t10=int32#5
# asm 2: eor >y6=r4,<y6=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y7 ^= t11
# asm 1: eor >y7=int32#6,<y7=int32#10,<t11=int32#6
# asm 2: eor >y7=r5,<y7=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y6 ^= t51
# asm 1: eor >y6=int32#9,<y6=int32#5,<t51=int32#8
# asm 2: eor >y6=r8,<y6=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y7 ^= t50
# asm 1: eor >y7=int32#10,<y7=int32#6,<t50=int32#7
# asm 2: eor >y7=r9,<y7=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +51]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#51]
# asm 2: ldrb >b3=r12,[<input_0=r0,#51]
ldrb r12,[r0,#51]

# qhasm:   b7 = mem8[input_0 +23]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#23]
# asm 2: ldrb >b7=r14,[<input_0=r0,#23]
ldrb r14,[r0,#23]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y6 ^= t20
# asm 1: eor >y6=int32#9,<y6=int32#9,<t20=int32#5
# asm 2: eor >y6=r8,<y6=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y7 ^= t21
# asm 1: eor >y7=int32#10,<y7=int32#10,<t21=int32#6
# asm 2: eor >y7=r9,<y7=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y6 ^= t61
# asm 1: eor >y6=int32#9,<y6=int32#9,<t61=int32#8
# asm 2: eor >y6=r8,<y6=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y7 ^= t60
# asm 1: eor >y7=int32#10,<y7=int32#10,<t60=int32#7
# asm 2: eor >y7=r9,<y7=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y6 ^= t30
# asm 1: eor >y6=int32#5,<y6=int32#9,<t30=int32#5
# asm 2: eor >y6=r4,<y6=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y7 ^= t31
# asm 1: eor >y7=int32#6,<y7=int32#10,<t31=int32#6
# asm 2: eor >y7=r5,<y7=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y6 ^= t71
# asm 1: eor >y6=int32#9,<y6=int32#5,<t71=int32#8
# asm 2: eor >y6=r8,<y6=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y7 ^= t70
# asm 1: eor >y7=int32#10,<y7=int32#6,<t70=int32#7
# asm 2: eor >y7=r9,<y7=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y6 y7;mem64[yp + 24] = y6 y7
# asm 1: strd <y6=int32#9,[<yp=int32#4,#24]
# asm 2: strd <y6=r8,[<yp=r3,#24]
strd r8,[r3,#24]

# qhasm:   b0 = mem8[input_0 +32]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#32]
# asm 2: ldrb >b0=r4,[<input_0=r0,#32]
ldrb r4,[r0,#32]

# qhasm:   b4 = mem8[input_0 +4]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#4]
# asm 2: ldrb >b4=r5,[<input_0=r0,#4]
ldrb r5,[r0,#4]

# qhasm:   b1 = mem8[input_0 +41]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#41]
# asm 2: ldrb >b1=r10,[<input_0=r0,#41]
ldrb r10,[r0,#41]

# qhasm:   b5 = mem8[input_0 +13]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#13]
# asm 2: ldrb >b5=r11,[<input_0=r0,#13]
ldrb r11,[r0,#13]

# qhasm:   b0 ^= 0x40
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x40
# asm 2: eor >b0=r4,<b0=r4,#0x40
eor r4,r4,#0x40

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y8 y9 = mem64[b0 + 0]
# asm 1: ldrd >y8=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y8=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y8 ^= t41
# asm 1: eor >y8=int32#9,<y8=int32#9,<t41=int32#8
# asm 2: eor >y8=r8,<y8=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y9 ^= t40
# asm 1: eor >y9=int32#10,<y9=int32#10,<t40=int32#7
# asm 2: eor >y9=r9,<y9=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +50]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#50]
# asm 2: ldrb >b2=r10,[<input_0=r0,#50]
ldrb r10,[r0,#50]

# qhasm:   b6 = mem8[input_0 +22]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#22]
# asm 2: ldrb >b6=r11,[<input_0=r0,#22]
ldrb r11,[r0,#22]

# qhasm:   y8 ^= t10
# asm 1: eor >y8=int32#5,<y8=int32#9,<t10=int32#5
# asm 2: eor >y8=r4,<y8=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y9 ^= t11
# asm 1: eor >y9=int32#6,<y9=int32#10,<t11=int32#6
# asm 2: eor >y9=r5,<y9=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y8 ^= t51
# asm 1: eor >y8=int32#9,<y8=int32#5,<t51=int32#8
# asm 2: eor >y8=r8,<y8=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y9 ^= t50
# asm 1: eor >y9=int32#10,<y9=int32#6,<t50=int32#7
# asm 2: eor >y9=r9,<y9=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +59]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#59]
# asm 2: ldrb >b3=r12,[<input_0=r0,#59]
ldrb r12,[r0,#59]

# qhasm:   b7 = mem8[input_0 +31]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#31]
# asm 2: ldrb >b7=r14,[<input_0=r0,#31]
ldrb r14,[r0,#31]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y8 ^= t20
# asm 1: eor >y8=int32#9,<y8=int32#9,<t20=int32#5
# asm 2: eor >y8=r8,<y8=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y9 ^= t21
# asm 1: eor >y9=int32#10,<y9=int32#10,<t21=int32#6
# asm 2: eor >y9=r9,<y9=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y8 ^= t61
# asm 1: eor >y8=int32#9,<y8=int32#9,<t61=int32#8
# asm 2: eor >y8=r8,<y8=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y9 ^= t60
# asm 1: eor >y9=int32#10,<y9=int32#10,<t60=int32#7
# asm 2: eor >y9=r9,<y9=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y8 ^= t30
# asm 1: eor >y8=int32#5,<y8=int32#9,<t30=int32#5
# asm 2: eor >y8=r4,<y8=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y9 ^= t31
# asm 1: eor >y9=int32#6,<y9=int32#10,<t31=int32#6
# asm 2: eor >y9=r5,<y9=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y8 ^= t71
# asm 1: eor >y8=int32#9,<y8=int32#5,<t71=int32#8
# asm 2: eor >y8=r8,<y8=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y9 ^= t70
# asm 1: eor >y9=int32#10,<y9=int32#6,<t70=int32#7
# asm 2: eor >y9=r9,<y9=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y8 y9;mem64[yp + 32] = y8 y9
# asm 1: strd <y8=int32#9,[<yp=int32#4,#32]
# asm 2: strd <y8=r8,[<yp=r3,#32]
strd r8,[r3,#32]

# qhasm:   b0 = mem8[input_0 +40]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#40]
# asm 2: ldrb >b0=r4,[<input_0=r0,#40]
ldrb r4,[r0,#40]

# qhasm:   b4 = mem8[input_0 +12]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#12]
# asm 2: ldrb >b4=r5,[<input_0=r0,#12]
ldrb r5,[r0,#12]

# qhasm:   b1 = mem8[input_0 +49]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#49]
# asm 2: ldrb >b1=r10,[<input_0=r0,#49]
ldrb r10,[r0,#49]

# qhasm:   b5 = mem8[input_0 +21]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#21]
# asm 2: ldrb >b5=r11,[<input_0=r0,#21]
ldrb r11,[r0,#21]

# qhasm:   b0 ^= 0x50
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x50
# asm 2: eor >b0=r4,<b0=r4,#0x50
eor r4,r4,#0x50

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y10 y11 = mem64[b0 + 0]
# asm 1: ldrd >y10=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y10=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y10 ^= t41
# asm 1: eor >y10=int32#9,<y10=int32#9,<t41=int32#8
# asm 2: eor >y10=r8,<y10=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y11 ^= t40
# asm 1: eor >y11=int32#10,<y11=int32#10,<t40=int32#7
# asm 2: eor >y11=r9,<y11=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +58]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#58]
# asm 2: ldrb >b2=r10,[<input_0=r0,#58]
ldrb r10,[r0,#58]

# qhasm:   b6 = mem8[input_0 +30]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#30]
# asm 2: ldrb >b6=r11,[<input_0=r0,#30]
ldrb r11,[r0,#30]

# qhasm:   y10 ^= t10
# asm 1: eor >y10=int32#5,<y10=int32#9,<t10=int32#5
# asm 2: eor >y10=r4,<y10=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y11 ^= t11
# asm 1: eor >y11=int32#6,<y11=int32#10,<t11=int32#6
# asm 2: eor >y11=r5,<y11=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y10 ^= t51
# asm 1: eor >y10=int32#9,<y10=int32#5,<t51=int32#8
# asm 2: eor >y10=r8,<y10=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y11 ^= t50
# asm 1: eor >y11=int32#10,<y11=int32#6,<t50=int32#7
# asm 2: eor >y11=r9,<y11=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +3]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#3]
# asm 2: ldrb >b3=r12,[<input_0=r0,#3]
ldrb r12,[r0,#3]

# qhasm:   b7 = mem8[input_0 +39]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#39]
# asm 2: ldrb >b7=r14,[<input_0=r0,#39]
ldrb r14,[r0,#39]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y10 ^= t20
# asm 1: eor >y10=int32#9,<y10=int32#9,<t20=int32#5
# asm 2: eor >y10=r8,<y10=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y11 ^= t21
# asm 1: eor >y11=int32#10,<y11=int32#10,<t21=int32#6
# asm 2: eor >y11=r9,<y11=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y10 ^= t61
# asm 1: eor >y10=int32#9,<y10=int32#9,<t61=int32#8
# asm 2: eor >y10=r8,<y10=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y11 ^= t60
# asm 1: eor >y11=int32#10,<y11=int32#10,<t60=int32#7
# asm 2: eor >y11=r9,<y11=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y10 ^= t30
# asm 1: eor >y10=int32#5,<y10=int32#9,<t30=int32#5
# asm 2: eor >y10=r4,<y10=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y11 ^= t31
# asm 1: eor >y11=int32#6,<y11=int32#10,<t31=int32#6
# asm 2: eor >y11=r5,<y11=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y10 ^= t71
# asm 1: eor >y10=int32#9,<y10=int32#5,<t71=int32#8
# asm 2: eor >y10=r8,<y10=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y11 ^= t70
# asm 1: eor >y11=int32#10,<y11=int32#6,<t70=int32#7
# asm 2: eor >y11=r9,<y11=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y10 y11;mem64[yp + 40] = y10 y11
# asm 1: strd <y10=int32#9,[<yp=int32#4,#40]
# asm 2: strd <y10=r8,[<yp=r3,#40]
strd r8,[r3,#40]

# qhasm:   b0 = mem8[input_0 +48]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#48]
# asm 2: ldrb >b0=r4,[<input_0=r0,#48]
ldrb r4,[r0,#48]

# qhasm:   b4 = mem8[input_0 +20]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#20]
# asm 2: ldrb >b4=r5,[<input_0=r0,#20]
ldrb r5,[r0,#20]

# qhasm:   b1 = mem8[input_0 +57]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#57]
# asm 2: ldrb >b1=r10,[<input_0=r0,#57]
ldrb r10,[r0,#57]

# qhasm:   b5 = mem8[input_0 +29]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#29]
# asm 2: ldrb >b5=r11,[<input_0=r0,#29]
ldrb r11,[r0,#29]

# qhasm:   b0 ^= 0x60
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x60
# asm 2: eor >b0=r4,<b0=r4,#0x60
eor r4,r4,#0x60

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y12 y13 = mem64[b0 + 0]
# asm 1: ldrd >y12=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y12=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y12 ^= t41
# asm 1: eor >y12=int32#9,<y12=int32#9,<t41=int32#8
# asm 2: eor >y12=r8,<y12=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y13 ^= t40
# asm 1: eor >y13=int32#10,<y13=int32#10,<t40=int32#7
# asm 2: eor >y13=r9,<y13=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +2]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#2]
# asm 2: ldrb >b2=r10,[<input_0=r0,#2]
ldrb r10,[r0,#2]

# qhasm:   b6 = mem8[input_0 +38]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#38]
# asm 2: ldrb >b6=r11,[<input_0=r0,#38]
ldrb r11,[r0,#38]

# qhasm:   y12 ^= t10
# asm 1: eor >y12=int32#5,<y12=int32#9,<t10=int32#5
# asm 2: eor >y12=r4,<y12=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y13 ^= t11
# asm 1: eor >y13=int32#6,<y13=int32#10,<t11=int32#6
# asm 2: eor >y13=r5,<y13=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y12 ^= t51
# asm 1: eor >y12=int32#9,<y12=int32#5,<t51=int32#8
# asm 2: eor >y12=r8,<y12=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y13 ^= t50
# asm 1: eor >y13=int32#10,<y13=int32#6,<t50=int32#7
# asm 2: eor >y13=r9,<y13=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +11]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#11]
# asm 2: ldrb >b3=r12,[<input_0=r0,#11]
ldrb r12,[r0,#11]

# qhasm:   b7 = mem8[input_0 +47]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#47]
# asm 2: ldrb >b7=r14,[<input_0=r0,#47]
ldrb r14,[r0,#47]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y12 ^= t20
# asm 1: eor >y12=int32#9,<y12=int32#9,<t20=int32#5
# asm 2: eor >y12=r8,<y12=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y13 ^= t21
# asm 1: eor >y13=int32#10,<y13=int32#10,<t21=int32#6
# asm 2: eor >y13=r9,<y13=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y12 ^= t61
# asm 1: eor >y12=int32#9,<y12=int32#9,<t61=int32#8
# asm 2: eor >y12=r8,<y12=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y13 ^= t60
# asm 1: eor >y13=int32#10,<y13=int32#10,<t60=int32#7
# asm 2: eor >y13=r9,<y13=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y12 ^= t30
# asm 1: eor >y12=int32#5,<y12=int32#9,<t30=int32#5
# asm 2: eor >y12=r4,<y12=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y13 ^= t31
# asm 1: eor >y13=int32#6,<y13=int32#10,<t31=int32#6
# asm 2: eor >y13=r5,<y13=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y12 ^= t71
# asm 1: eor >y12=int32#9,<y12=int32#5,<t71=int32#8
# asm 2: eor >y12=r8,<y12=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y13 ^= t70
# asm 1: eor >y13=int32#10,<y13=int32#6,<t70=int32#7
# asm 2: eor >y13=r9,<y13=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y12 y13;mem64[yp + 48] = y12 y13
# asm 1: strd <y12=int32#9,[<yp=int32#4,#48]
# asm 2: strd <y12=r8,[<yp=r3,#48]
strd r8,[r3,#48]

# qhasm:   b0 = mem8[input_0 +56]
# asm 1: ldrb >b0=int32#5,[<input_0=int32#1,#56]
# asm 2: ldrb >b0=r4,[<input_0=r0,#56]
ldrb r4,[r0,#56]

# qhasm:   b4 = mem8[input_0 +28]
# asm 1: ldrb >b4=int32#6,[<input_0=int32#1,#28]
# asm 2: ldrb >b4=r5,[<input_0=r0,#28]
ldrb r5,[r0,#28]

# qhasm:   b1 = mem8[input_0 +1]
# asm 1: ldrb >b1=int32#11,[<input_0=int32#1,#1]
# asm 2: ldrb >b1=r10,[<input_0=r0,#1]
ldrb r10,[r0,#1]

# qhasm:   b5 = mem8[input_0 +37]
# asm 1: ldrb >b5=int32#12,[<input_0=int32#1,#37]
# asm 2: ldrb >b5=r11,[<input_0=r0,#37]
ldrb r11,[r0,#37]

# qhasm:   b0 ^= 0x70
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x70
# asm 2: eor >b0=r4,<b0=r4,#0x70
eor r4,r4,#0x70

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y14 y15 = mem64[b0 + 0]
# asm 1: ldrd >y14=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y14=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y14 ^= t41
# asm 1: eor >y14=int32#9,<y14=int32#9,<t41=int32#8
# asm 2: eor >y14=r8,<y14=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y15 ^= t40
# asm 1: eor >y15=int32#10,<y15=int32#10,<t40=int32#7
# asm 2: eor >y15=r9,<y15=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[input_0 +10]
# asm 1: ldrb >b2=int32#11,[<input_0=int32#1,#10]
# asm 2: ldrb >b2=r10,[<input_0=r0,#10]
ldrb r10,[r0,#10]

# qhasm:   b6 = mem8[input_0 +46]
# asm 1: ldrb >b6=int32#12,[<input_0=int32#1,#46]
# asm 2: ldrb >b6=r11,[<input_0=r0,#46]
ldrb r11,[r0,#46]

# qhasm:   y14 ^= t10
# asm 1: eor >y14=int32#5,<y14=int32#9,<t10=int32#5
# asm 2: eor >y14=r4,<y14=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y15 ^= t11
# asm 1: eor >y15=int32#6,<y15=int32#10,<t11=int32#6
# asm 2: eor >y15=r5,<y15=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y14 ^= t51
# asm 1: eor >y14=int32#9,<y14=int32#5,<t51=int32#8
# asm 2: eor >y14=r8,<y14=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y15 ^= t50
# asm 1: eor >y15=int32#10,<y15=int32#6,<t50=int32#7
# asm 2: eor >y15=r9,<y15=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[input_0 +19]
# asm 1: ldrb >b3=int32#13,[<input_0=int32#1,#19]
# asm 2: ldrb >b3=r12,[<input_0=r0,#19]
ldrb r12,[r0,#19]

# qhasm:   b7 = mem8[input_0 +55]
# asm 1: ldrb >b7=int32#14,[<input_0=int32#1,#55]
# asm 2: ldrb >b7=r14,[<input_0=r0,#55]
ldrb r14,[r0,#55]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y14 ^= t20
# asm 1: eor >y14=int32#9,<y14=int32#9,<t20=int32#5
# asm 2: eor >y14=r8,<y14=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y15 ^= t21
# asm 1: eor >y15=int32#10,<y15=int32#10,<t21=int32#6
# asm 2: eor >y15=r9,<y15=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y14 ^= t61
# asm 1: eor >y14=int32#9,<y14=int32#9,<t61=int32#8
# asm 2: eor >y14=r8,<y14=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y15 ^= t60
# asm 1: eor >y15=int32#10,<y15=int32#10,<t60=int32#7
# asm 2: eor >y15=r9,<y15=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y14 ^= t30
# asm 1: eor >y14=int32#5,<y14=int32#9,<t30=int32#5
# asm 2: eor >y14=r4,<y14=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y15 ^= t31
# asm 1: eor >y15=int32#6,<y15=int32#10,<t31=int32#6
# asm 2: eor >y15=r5,<y15=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y14 ^= t71
# asm 1: eor >y14=int32#9,<y14=int32#5,<t71=int32#8
# asm 2: eor >y14=r8,<y14=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y15 ^= t70
# asm 1: eor >y15=int32#10,<y15=int32#6,<t70=int32#7
# asm 2: eor >y15=r9,<y15=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y14 y15;mem64[yp + 56] = y14 y15
# asm 1: strd <y14=int32#9,[<yp=int32#4,#56]
# asm 2: strd <y14=r8,[<yp=r3,#56]
strd r8,[r3,#56]

# qhasm: c += 1
# asm 1: add >c=int32#3,<c=int32#3,#1
# asm 2: add >c=r2,<c=r2,#1
add r2,r2,#1

# qhasm:   b0 = mem8[yp +0]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#0]
# asm 2: ldrb >b0=r4,[<yp=r3,#0]
ldrb r4,[r3,#0]

# qhasm:   b4 = mem8[yp +36]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#36]
# asm 2: ldrb >b4=r5,[<yp=r3,#36]
ldrb r5,[r3,#36]

# qhasm:   b1 = mem8[yp +9]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#9]
# asm 2: ldrb >b1=r10,[<yp=r3,#9]
ldrb r10,[r3,#9]

# qhasm:   b5 = mem8[yp +45]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#45]
# asm 2: ldrb >b5=r11,[<yp=r3,#45]
ldrb r11,[r3,#45]

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y0 y1 = mem64[b0 + 0]
# asm 1: ldrd >y0=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y0=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y0 ^= t41
# asm 1: eor >y0=int32#9,<y0=int32#9,<t41=int32#8
# asm 2: eor >y0=r8,<y0=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y1 ^= t40
# asm 1: eor >y1=int32#10,<y1=int32#10,<t40=int32#7
# asm 2: eor >y1=r9,<y1=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +18]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#18]
# asm 2: ldrb >b2=r10,[<yp=r3,#18]
ldrb r10,[r3,#18]

# qhasm:   b6 = mem8[yp +54]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#54]
# asm 2: ldrb >b6=r11,[<yp=r3,#54]
ldrb r11,[r3,#54]

# qhasm:   y0 ^= t10
# asm 1: eor >y0=int32#5,<y0=int32#9,<t10=int32#5
# asm 2: eor >y0=r4,<y0=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y1 ^= t11
# asm 1: eor >y1=int32#6,<y1=int32#10,<t11=int32#6
# asm 2: eor >y1=r5,<y1=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y0 ^= t51
# asm 1: eor >y0=int32#9,<y0=int32#5,<t51=int32#8
# asm 2: eor >y0=r8,<y0=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y1 ^= t50
# asm 1: eor >y1=int32#10,<y1=int32#6,<t50=int32#7
# asm 2: eor >y1=r9,<y1=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +27]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#27]
# asm 2: ldrb >b3=r12,[<yp=r3,#27]
ldrb r12,[r3,#27]

# qhasm:   b7 = mem8[yp +63]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#63]
# asm 2: ldrb >b7=r14,[<yp=r3,#63]
ldrb r14,[r3,#63]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y0 ^= t20
# asm 1: eor >y0=int32#9,<y0=int32#9,<t20=int32#5
# asm 2: eor >y0=r8,<y0=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y1 ^= t21
# asm 1: eor >y1=int32#10,<y1=int32#10,<t21=int32#6
# asm 2: eor >y1=r9,<y1=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y0 ^= t61
# asm 1: eor >y0=int32#9,<y0=int32#9,<t61=int32#8
# asm 2: eor >y0=r8,<y0=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y1 ^= t60
# asm 1: eor >y1=int32#10,<y1=int32#10,<t60=int32#7
# asm 2: eor >y1=r9,<y1=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y0 ^= t30
# asm 1: eor >y0=int32#5,<y0=int32#9,<t30=int32#5
# asm 2: eor >y0=r4,<y0=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y1 ^= t31
# asm 1: eor >y1=int32#6,<y1=int32#10,<t31=int32#6
# asm 2: eor >y1=r5,<y1=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y0 ^= t71
# asm 1: eor >y0=int32#9,<y0=int32#5,<t71=int32#8
# asm 2: eor >y0=r8,<y0=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y1 ^= t70
# asm 1: eor >y1=int32#10,<y1=int32#6,<t70=int32#7
# asm 2: eor >y1=r9,<y1=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y0 y1;mem64[input_0 + 0] = y0 y1
# asm 1: strd <y0=int32#9,[<input_0=int32#1,#0]
# asm 2: strd <y0=r8,[<input_0=r0,#0]
strd r8,[r0,#0]

# qhasm:   b0 = mem8[yp +8]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#8]
# asm 2: ldrb >b0=r4,[<yp=r3,#8]
ldrb r4,[r3,#8]

# qhasm:   b4 = mem8[yp +44]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#44]
# asm 2: ldrb >b4=r5,[<yp=r3,#44]
ldrb r5,[r3,#44]

# qhasm:   b1 = mem8[yp +17]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#17]
# asm 2: ldrb >b1=r10,[<yp=r3,#17]
ldrb r10,[r3,#17]

# qhasm:   b5 = mem8[yp +53]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#53]
# asm 2: ldrb >b5=r11,[<yp=r3,#53]
ldrb r11,[r3,#53]

# qhasm:   b0 ^= 0x10
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x10
# asm 2: eor >b0=r4,<b0=r4,#0x10
eor r4,r4,#0x10

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y2 y3 = mem64[b0 + 0]
# asm 1: ldrd >y2=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y2=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y2 ^= t41
# asm 1: eor >y2=int32#9,<y2=int32#9,<t41=int32#8
# asm 2: eor >y2=r8,<y2=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y3 ^= t40
# asm 1: eor >y3=int32#10,<y3=int32#10,<t40=int32#7
# asm 2: eor >y3=r9,<y3=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +26]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#26]
# asm 2: ldrb >b2=r10,[<yp=r3,#26]
ldrb r10,[r3,#26]

# qhasm:   b6 = mem8[yp +62]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#62]
# asm 2: ldrb >b6=r11,[<yp=r3,#62]
ldrb r11,[r3,#62]

# qhasm:   y2 ^= t10
# asm 1: eor >y2=int32#5,<y2=int32#9,<t10=int32#5
# asm 2: eor >y2=r4,<y2=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y3 ^= t11
# asm 1: eor >y3=int32#6,<y3=int32#10,<t11=int32#6
# asm 2: eor >y3=r5,<y3=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y2 ^= t51
# asm 1: eor >y2=int32#9,<y2=int32#5,<t51=int32#8
# asm 2: eor >y2=r8,<y2=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y3 ^= t50
# asm 1: eor >y3=int32#10,<y3=int32#6,<t50=int32#7
# asm 2: eor >y3=r9,<y3=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +35]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#35]
# asm 2: ldrb >b3=r12,[<yp=r3,#35]
ldrb r12,[r3,#35]

# qhasm:   b7 = mem8[yp +7]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#7]
# asm 2: ldrb >b7=r14,[<yp=r3,#7]
ldrb r14,[r3,#7]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y2 ^= t20
# asm 1: eor >y2=int32#9,<y2=int32#9,<t20=int32#5
# asm 2: eor >y2=r8,<y2=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y3 ^= t21
# asm 1: eor >y3=int32#10,<y3=int32#10,<t21=int32#6
# asm 2: eor >y3=r9,<y3=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y2 ^= t61
# asm 1: eor >y2=int32#9,<y2=int32#9,<t61=int32#8
# asm 2: eor >y2=r8,<y2=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y3 ^= t60
# asm 1: eor >y3=int32#10,<y3=int32#10,<t60=int32#7
# asm 2: eor >y3=r9,<y3=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y2 ^= t30
# asm 1: eor >y2=int32#5,<y2=int32#9,<t30=int32#5
# asm 2: eor >y2=r4,<y2=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y3 ^= t31
# asm 1: eor >y3=int32#6,<y3=int32#10,<t31=int32#6
# asm 2: eor >y3=r5,<y3=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y2 ^= t71
# asm 1: eor >y2=int32#9,<y2=int32#5,<t71=int32#8
# asm 2: eor >y2=r8,<y2=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y3 ^= t70
# asm 1: eor >y3=int32#10,<y3=int32#6,<t70=int32#7
# asm 2: eor >y3=r9,<y3=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y2 y3;mem64[input_0 + 8] = y2 y3
# asm 1: strd <y2=int32#9,[<input_0=int32#1,#8]
# asm 2: strd <y2=r8,[<input_0=r0,#8]
strd r8,[r0,#8]

# qhasm:   b0 = mem8[yp +16]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#16]
# asm 2: ldrb >b0=r4,[<yp=r3,#16]
ldrb r4,[r3,#16]

# qhasm:   b4 = mem8[yp +52]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#52]
# asm 2: ldrb >b4=r5,[<yp=r3,#52]
ldrb r5,[r3,#52]

# qhasm:   b1 = mem8[yp +25]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#25]
# asm 2: ldrb >b1=r10,[<yp=r3,#25]
ldrb r10,[r3,#25]

# qhasm:   b5 = mem8[yp +61]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#61]
# asm 2: ldrb >b5=r11,[<yp=r3,#61]
ldrb r11,[r3,#61]

# qhasm:   b0 ^= 0x20
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x20
# asm 2: eor >b0=r4,<b0=r4,#0x20
eor r4,r4,#0x20

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y4 y5 = mem64[b0 + 0]
# asm 1: ldrd >y4=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y4=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y4 ^= t41
# asm 1: eor >y4=int32#9,<y4=int32#9,<t41=int32#8
# asm 2: eor >y4=r8,<y4=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y5 ^= t40
# asm 1: eor >y5=int32#10,<y5=int32#10,<t40=int32#7
# asm 2: eor >y5=r9,<y5=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +34]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#34]
# asm 2: ldrb >b2=r10,[<yp=r3,#34]
ldrb r10,[r3,#34]

# qhasm:   b6 = mem8[yp +6]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#6]
# asm 2: ldrb >b6=r11,[<yp=r3,#6]
ldrb r11,[r3,#6]

# qhasm:   y4 ^= t10
# asm 1: eor >y4=int32#5,<y4=int32#9,<t10=int32#5
# asm 2: eor >y4=r4,<y4=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y5 ^= t11
# asm 1: eor >y5=int32#6,<y5=int32#10,<t11=int32#6
# asm 2: eor >y5=r5,<y5=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y4 ^= t51
# asm 1: eor >y4=int32#9,<y4=int32#5,<t51=int32#8
# asm 2: eor >y4=r8,<y4=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y5 ^= t50
# asm 1: eor >y5=int32#10,<y5=int32#6,<t50=int32#7
# asm 2: eor >y5=r9,<y5=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +43]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#43]
# asm 2: ldrb >b3=r12,[<yp=r3,#43]
ldrb r12,[r3,#43]

# qhasm:   b7 = mem8[yp +15]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#15]
# asm 2: ldrb >b7=r14,[<yp=r3,#15]
ldrb r14,[r3,#15]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y4 ^= t20
# asm 1: eor >y4=int32#9,<y4=int32#9,<t20=int32#5
# asm 2: eor >y4=r8,<y4=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y5 ^= t21
# asm 1: eor >y5=int32#10,<y5=int32#10,<t21=int32#6
# asm 2: eor >y5=r9,<y5=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y4 ^= t61
# asm 1: eor >y4=int32#9,<y4=int32#9,<t61=int32#8
# asm 2: eor >y4=r8,<y4=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y5 ^= t60
# asm 1: eor >y5=int32#10,<y5=int32#10,<t60=int32#7
# asm 2: eor >y5=r9,<y5=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y4 ^= t30
# asm 1: eor >y4=int32#5,<y4=int32#9,<t30=int32#5
# asm 2: eor >y4=r4,<y4=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y5 ^= t31
# asm 1: eor >y5=int32#6,<y5=int32#10,<t31=int32#6
# asm 2: eor >y5=r5,<y5=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y4 ^= t71
# asm 1: eor >y4=int32#9,<y4=int32#5,<t71=int32#8
# asm 2: eor >y4=r8,<y4=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y5 ^= t70
# asm 1: eor >y5=int32#10,<y5=int32#6,<t70=int32#7
# asm 2: eor >y5=r9,<y5=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y4 y5;mem64[input_0 + 16] = y4 y5
# asm 1: strd <y4=int32#9,[<input_0=int32#1,#16]
# asm 2: strd <y4=r8,[<input_0=r0,#16]
strd r8,[r0,#16]

# qhasm:   b0 = mem8[yp +24]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#24]
# asm 2: ldrb >b0=r4,[<yp=r3,#24]
ldrb r4,[r3,#24]

# qhasm:   b4 = mem8[yp +60]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#60]
# asm 2: ldrb >b4=r5,[<yp=r3,#60]
ldrb r5,[r3,#60]

# qhasm:   b1 = mem8[yp +33]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#33]
# asm 2: ldrb >b1=r10,[<yp=r3,#33]
ldrb r10,[r3,#33]

# qhasm:   b5 = mem8[yp +5]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#5]
# asm 2: ldrb >b5=r11,[<yp=r3,#5]
ldrb r11,[r3,#5]

# qhasm:   b0 ^= 0x30
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x30
# asm 2: eor >b0=r4,<b0=r4,#0x30
eor r4,r4,#0x30

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y6 y7 = mem64[b0 + 0]
# asm 1: ldrd >y6=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y6=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y6 ^= t41
# asm 1: eor >y6=int32#9,<y6=int32#9,<t41=int32#8
# asm 2: eor >y6=r8,<y6=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y7 ^= t40
# asm 1: eor >y7=int32#10,<y7=int32#10,<t40=int32#7
# asm 2: eor >y7=r9,<y7=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +42]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#42]
# asm 2: ldrb >b2=r10,[<yp=r3,#42]
ldrb r10,[r3,#42]

# qhasm:   b6 = mem8[yp +14]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#14]
# asm 2: ldrb >b6=r11,[<yp=r3,#14]
ldrb r11,[r3,#14]

# qhasm:   y6 ^= t10
# asm 1: eor >y6=int32#5,<y6=int32#9,<t10=int32#5
# asm 2: eor >y6=r4,<y6=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y7 ^= t11
# asm 1: eor >y7=int32#6,<y7=int32#10,<t11=int32#6
# asm 2: eor >y7=r5,<y7=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y6 ^= t51
# asm 1: eor >y6=int32#9,<y6=int32#5,<t51=int32#8
# asm 2: eor >y6=r8,<y6=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y7 ^= t50
# asm 1: eor >y7=int32#10,<y7=int32#6,<t50=int32#7
# asm 2: eor >y7=r9,<y7=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +51]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#51]
# asm 2: ldrb >b3=r12,[<yp=r3,#51]
ldrb r12,[r3,#51]

# qhasm:   b7 = mem8[yp +23]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#23]
# asm 2: ldrb >b7=r14,[<yp=r3,#23]
ldrb r14,[r3,#23]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y6 ^= t20
# asm 1: eor >y6=int32#9,<y6=int32#9,<t20=int32#5
# asm 2: eor >y6=r8,<y6=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y7 ^= t21
# asm 1: eor >y7=int32#10,<y7=int32#10,<t21=int32#6
# asm 2: eor >y7=r9,<y7=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y6 ^= t61
# asm 1: eor >y6=int32#9,<y6=int32#9,<t61=int32#8
# asm 2: eor >y6=r8,<y6=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y7 ^= t60
# asm 1: eor >y7=int32#10,<y7=int32#10,<t60=int32#7
# asm 2: eor >y7=r9,<y7=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y6 ^= t30
# asm 1: eor >y6=int32#5,<y6=int32#9,<t30=int32#5
# asm 2: eor >y6=r4,<y6=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y7 ^= t31
# asm 1: eor >y7=int32#6,<y7=int32#10,<t31=int32#6
# asm 2: eor >y7=r5,<y7=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y6 ^= t71
# asm 1: eor >y6=int32#9,<y6=int32#5,<t71=int32#8
# asm 2: eor >y6=r8,<y6=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y7 ^= t70
# asm 1: eor >y7=int32#10,<y7=int32#6,<t70=int32#7
# asm 2: eor >y7=r9,<y7=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y6 y7;mem64[input_0 + 24] = y6 y7
# asm 1: strd <y6=int32#9,[<input_0=int32#1,#24]
# asm 2: strd <y6=r8,[<input_0=r0,#24]
strd r8,[r0,#24]

# qhasm:   b0 = mem8[yp +32]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#32]
# asm 2: ldrb >b0=r4,[<yp=r3,#32]
ldrb r4,[r3,#32]

# qhasm:   b4 = mem8[yp +4]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#4]
# asm 2: ldrb >b4=r5,[<yp=r3,#4]
ldrb r5,[r3,#4]

# qhasm:   b1 = mem8[yp +41]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#41]
# asm 2: ldrb >b1=r10,[<yp=r3,#41]
ldrb r10,[r3,#41]

# qhasm:   b5 = mem8[yp +13]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#13]
# asm 2: ldrb >b5=r11,[<yp=r3,#13]
ldrb r11,[r3,#13]

# qhasm:   b0 ^= 0x40
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x40
# asm 2: eor >b0=r4,<b0=r4,#0x40
eor r4,r4,#0x40

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y8 y9 = mem64[b0 + 0]
# asm 1: ldrd >y8=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y8=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y8 ^= t41
# asm 1: eor >y8=int32#9,<y8=int32#9,<t41=int32#8
# asm 2: eor >y8=r8,<y8=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y9 ^= t40
# asm 1: eor >y9=int32#10,<y9=int32#10,<t40=int32#7
# asm 2: eor >y9=r9,<y9=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +50]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#50]
# asm 2: ldrb >b2=r10,[<yp=r3,#50]
ldrb r10,[r3,#50]

# qhasm:   b6 = mem8[yp +22]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#22]
# asm 2: ldrb >b6=r11,[<yp=r3,#22]
ldrb r11,[r3,#22]

# qhasm:   y8 ^= t10
# asm 1: eor >y8=int32#5,<y8=int32#9,<t10=int32#5
# asm 2: eor >y8=r4,<y8=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y9 ^= t11
# asm 1: eor >y9=int32#6,<y9=int32#10,<t11=int32#6
# asm 2: eor >y9=r5,<y9=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y8 ^= t51
# asm 1: eor >y8=int32#9,<y8=int32#5,<t51=int32#8
# asm 2: eor >y8=r8,<y8=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y9 ^= t50
# asm 1: eor >y9=int32#10,<y9=int32#6,<t50=int32#7
# asm 2: eor >y9=r9,<y9=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +59]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#59]
# asm 2: ldrb >b3=r12,[<yp=r3,#59]
ldrb r12,[r3,#59]

# qhasm:   b7 = mem8[yp +31]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#31]
# asm 2: ldrb >b7=r14,[<yp=r3,#31]
ldrb r14,[r3,#31]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y8 ^= t20
# asm 1: eor >y8=int32#9,<y8=int32#9,<t20=int32#5
# asm 2: eor >y8=r8,<y8=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y9 ^= t21
# asm 1: eor >y9=int32#10,<y9=int32#10,<t21=int32#6
# asm 2: eor >y9=r9,<y9=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y8 ^= t61
# asm 1: eor >y8=int32#9,<y8=int32#9,<t61=int32#8
# asm 2: eor >y8=r8,<y8=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y9 ^= t60
# asm 1: eor >y9=int32#10,<y9=int32#10,<t60=int32#7
# asm 2: eor >y9=r9,<y9=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y8 ^= t30
# asm 1: eor >y8=int32#5,<y8=int32#9,<t30=int32#5
# asm 2: eor >y8=r4,<y8=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y9 ^= t31
# asm 1: eor >y9=int32#6,<y9=int32#10,<t31=int32#6
# asm 2: eor >y9=r5,<y9=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y8 ^= t71
# asm 1: eor >y8=int32#9,<y8=int32#5,<t71=int32#8
# asm 2: eor >y8=r8,<y8=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y9 ^= t70
# asm 1: eor >y9=int32#10,<y9=int32#6,<t70=int32#7
# asm 2: eor >y9=r9,<y9=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y8 y9;mem64[input_0 + 32] = y8 y9
# asm 1: strd <y8=int32#9,[<input_0=int32#1,#32]
# asm 2: strd <y8=r8,[<input_0=r0,#32]
strd r8,[r0,#32]

# qhasm:   b0 = mem8[yp +40]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#40]
# asm 2: ldrb >b0=r4,[<yp=r3,#40]
ldrb r4,[r3,#40]

# qhasm:   b4 = mem8[yp +12]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#12]
# asm 2: ldrb >b4=r5,[<yp=r3,#12]
ldrb r5,[r3,#12]

# qhasm:   b1 = mem8[yp +49]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#49]
# asm 2: ldrb >b1=r10,[<yp=r3,#49]
ldrb r10,[r3,#49]

# qhasm:   b5 = mem8[yp +21]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#21]
# asm 2: ldrb >b5=r11,[<yp=r3,#21]
ldrb r11,[r3,#21]

# qhasm:   b0 ^= 0x50
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x50
# asm 2: eor >b0=r4,<b0=r4,#0x50
eor r4,r4,#0x50

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y10 y11 = mem64[b0 + 0]
# asm 1: ldrd >y10=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y10=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y10 ^= t41
# asm 1: eor >y10=int32#9,<y10=int32#9,<t41=int32#8
# asm 2: eor >y10=r8,<y10=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y11 ^= t40
# asm 1: eor >y11=int32#10,<y11=int32#10,<t40=int32#7
# asm 2: eor >y11=r9,<y11=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +58]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#58]
# asm 2: ldrb >b2=r10,[<yp=r3,#58]
ldrb r10,[r3,#58]

# qhasm:   b6 = mem8[yp +30]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#30]
# asm 2: ldrb >b6=r11,[<yp=r3,#30]
ldrb r11,[r3,#30]

# qhasm:   y10 ^= t10
# asm 1: eor >y10=int32#5,<y10=int32#9,<t10=int32#5
# asm 2: eor >y10=r4,<y10=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y11 ^= t11
# asm 1: eor >y11=int32#6,<y11=int32#10,<t11=int32#6
# asm 2: eor >y11=r5,<y11=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y10 ^= t51
# asm 1: eor >y10=int32#9,<y10=int32#5,<t51=int32#8
# asm 2: eor >y10=r8,<y10=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y11 ^= t50
# asm 1: eor >y11=int32#10,<y11=int32#6,<t50=int32#7
# asm 2: eor >y11=r9,<y11=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +3]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#3]
# asm 2: ldrb >b3=r12,[<yp=r3,#3]
ldrb r12,[r3,#3]

# qhasm:   b7 = mem8[yp +39]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#39]
# asm 2: ldrb >b7=r14,[<yp=r3,#39]
ldrb r14,[r3,#39]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y10 ^= t20
# asm 1: eor >y10=int32#9,<y10=int32#9,<t20=int32#5
# asm 2: eor >y10=r8,<y10=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y11 ^= t21
# asm 1: eor >y11=int32#10,<y11=int32#10,<t21=int32#6
# asm 2: eor >y11=r9,<y11=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y10 ^= t61
# asm 1: eor >y10=int32#9,<y10=int32#9,<t61=int32#8
# asm 2: eor >y10=r8,<y10=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y11 ^= t60
# asm 1: eor >y11=int32#10,<y11=int32#10,<t60=int32#7
# asm 2: eor >y11=r9,<y11=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y10 ^= t30
# asm 1: eor >y10=int32#5,<y10=int32#9,<t30=int32#5
# asm 2: eor >y10=r4,<y10=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y11 ^= t31
# asm 1: eor >y11=int32#6,<y11=int32#10,<t31=int32#6
# asm 2: eor >y11=r5,<y11=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y10 ^= t71
# asm 1: eor >y10=int32#9,<y10=int32#5,<t71=int32#8
# asm 2: eor >y10=r8,<y10=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y11 ^= t70
# asm 1: eor >y11=int32#10,<y11=int32#6,<t70=int32#7
# asm 2: eor >y11=r9,<y11=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y10 y11;mem64[input_0 + 40] = y10 y11
# asm 1: strd <y10=int32#9,[<input_0=int32#1,#40]
# asm 2: strd <y10=r8,[<input_0=r0,#40]
strd r8,[r0,#40]

# qhasm:   b0 = mem8[yp +48]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#48]
# asm 2: ldrb >b0=r4,[<yp=r3,#48]
ldrb r4,[r3,#48]

# qhasm:   b4 = mem8[yp +20]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#20]
# asm 2: ldrb >b4=r5,[<yp=r3,#20]
ldrb r5,[r3,#20]

# qhasm:   b1 = mem8[yp +57]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#57]
# asm 2: ldrb >b1=r10,[<yp=r3,#57]
ldrb r10,[r3,#57]

# qhasm:   b5 = mem8[yp +29]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#29]
# asm 2: ldrb >b5=r11,[<yp=r3,#29]
ldrb r11,[r3,#29]

# qhasm:   b0 ^= 0x60
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x60
# asm 2: eor >b0=r4,<b0=r4,#0x60
eor r4,r4,#0x60

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y12 y13 = mem64[b0 + 0]
# asm 1: ldrd >y12=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y12=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y12 ^= t41
# asm 1: eor >y12=int32#9,<y12=int32#9,<t41=int32#8
# asm 2: eor >y12=r8,<y12=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y13 ^= t40
# asm 1: eor >y13=int32#10,<y13=int32#10,<t40=int32#7
# asm 2: eor >y13=r9,<y13=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +2]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#2]
# asm 2: ldrb >b2=r10,[<yp=r3,#2]
ldrb r10,[r3,#2]

# qhasm:   b6 = mem8[yp +38]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#38]
# asm 2: ldrb >b6=r11,[<yp=r3,#38]
ldrb r11,[r3,#38]

# qhasm:   y12 ^= t10
# asm 1: eor >y12=int32#5,<y12=int32#9,<t10=int32#5
# asm 2: eor >y12=r4,<y12=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y13 ^= t11
# asm 1: eor >y13=int32#6,<y13=int32#10,<t11=int32#6
# asm 2: eor >y13=r5,<y13=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y12 ^= t51
# asm 1: eor >y12=int32#9,<y12=int32#5,<t51=int32#8
# asm 2: eor >y12=r8,<y12=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y13 ^= t50
# asm 1: eor >y13=int32#10,<y13=int32#6,<t50=int32#7
# asm 2: eor >y13=r9,<y13=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +11]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#11]
# asm 2: ldrb >b3=r12,[<yp=r3,#11]
ldrb r12,[r3,#11]

# qhasm:   b7 = mem8[yp +47]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#47]
# asm 2: ldrb >b7=r14,[<yp=r3,#47]
ldrb r14,[r3,#47]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y12 ^= t20
# asm 1: eor >y12=int32#9,<y12=int32#9,<t20=int32#5
# asm 2: eor >y12=r8,<y12=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y13 ^= t21
# asm 1: eor >y13=int32#10,<y13=int32#10,<t21=int32#6
# asm 2: eor >y13=r9,<y13=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y12 ^= t61
# asm 1: eor >y12=int32#9,<y12=int32#9,<t61=int32#8
# asm 2: eor >y12=r8,<y12=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y13 ^= t60
# asm 1: eor >y13=int32#10,<y13=int32#10,<t60=int32#7
# asm 2: eor >y13=r9,<y13=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y12 ^= t30
# asm 1: eor >y12=int32#5,<y12=int32#9,<t30=int32#5
# asm 2: eor >y12=r4,<y12=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y13 ^= t31
# asm 1: eor >y13=int32#6,<y13=int32#10,<t31=int32#6
# asm 2: eor >y13=r5,<y13=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y12 ^= t71
# asm 1: eor >y12=int32#9,<y12=int32#5,<t71=int32#8
# asm 2: eor >y12=r8,<y12=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y13 ^= t70
# asm 1: eor >y13=int32#10,<y13=int32#6,<t70=int32#7
# asm 2: eor >y13=r9,<y13=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y12 y13;mem64[input_0 + 48] = y12 y13
# asm 1: strd <y12=int32#9,[<input_0=int32#1,#48]
# asm 2: strd <y12=r8,[<input_0=r0,#48]
strd r8,[r0,#48]

# qhasm:   b0 = mem8[yp +56]
# asm 1: ldrb >b0=int32#5,[<yp=int32#4,#56]
# asm 2: ldrb >b0=r4,[<yp=r3,#56]
ldrb r4,[r3,#56]

# qhasm:   b4 = mem8[yp +28]
# asm 1: ldrb >b4=int32#6,[<yp=int32#4,#28]
# asm 2: ldrb >b4=r5,[<yp=r3,#28]
ldrb r5,[r3,#28]

# qhasm:   b1 = mem8[yp +1]
# asm 1: ldrb >b1=int32#11,[<yp=int32#4,#1]
# asm 2: ldrb >b1=r10,[<yp=r3,#1]
ldrb r10,[r3,#1]

# qhasm:   b5 = mem8[yp +37]
# asm 1: ldrb >b5=int32#12,[<yp=int32#4,#37]
# asm 2: ldrb >b5=r11,[<yp=r3,#37]
ldrb r11,[r3,#37]

# qhasm:   b0 ^= 0x70
# asm 1: eor >b0=int32#5,<b0=int32#5,#0x70
# asm 2: eor >b0=r4,<b0=r4,#0x70
eor r4,r4,#0x70

# qhasm:   b0 ^= c
# asm 1: eor >b0=int32#5,<b0=int32#5,<c=int32#3
# asm 2: eor >b0=r4,<b0=r4,<c=r2
eor r4,r4,r2

# qhasm:   b0 = input_1 + (b0 << 5)
# asm 1: add >b0=int32#5,<input_1=int32#2,<b0=int32#5,LSL #5
# asm 2: add >b0=r4,<input_1=r1,<b0=r4,LSL #5
add r4,r1,r4,LSL #5

# qhasm:   b4 = input_1 + (b4 << 5)
# asm 1: add >b4=int32#6,<input_1=int32#2,<b4=int32#6,LSL #5
# asm 2: add >b4=r5,<input_1=r1,<b4=r5,LSL #5
add r5,r1,r5,LSL #5

# qhasm:   assign r8 r9 to y14 y15 = mem64[b0 + 0]
# asm 1: ldrd >y14=int32#9,[<b0=int32#5,#0]
# asm 2: ldrd >y14=r8,[<b0=r4,#0]
ldrd r8,[r4,#0]

# qhasm:   assign r6 r7 to t40 t41 = mem64[b4 + 0]
# asm 1: ldrd >t40=int32#7,[<b4=int32#6,#0]
# asm 2: ldrd >t40=r6,[<b4=r5,#0]
ldrd r6,[r5,#0]

# qhasm:   b1 = input_1 + (b1 << 5)
# asm 1: add >b1=int32#5,<input_1=int32#2,<b1=int32#11,LSL #5
# asm 2: add >b1=r4,<input_1=r1,<b1=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b5 = input_1 + (b5 << 5)
# asm 1: add >b5=int32#11,<input_1=int32#2,<b5=int32#12,LSL #5
# asm 2: add >b5=r10,<input_1=r1,<b5=r11,LSL #5
add r10,r1,r11,LSL #5

# qhasm:   y14 ^= t41
# asm 1: eor >y14=int32#9,<y14=int32#9,<t41=int32#8
# asm 2: eor >y14=r8,<y14=r8,<t41=r7
eor r8,r8,r7

# qhasm:   y15 ^= t40
# asm 1: eor >y15=int32#10,<y15=int32#10,<t40=int32#7
# asm 2: eor >y15=r9,<y15=r9,<t40=r6
eor r9,r9,r6

# qhasm:   assign r4 r5 to t10 t11 = mem64[b1 + 8]
# asm 1: ldrd >t10=int32#5,[<b1=int32#5,#8]
# asm 2: ldrd >t10=r4,[<b1=r4,#8]
ldrd r4,[r4,#8]

# qhasm:   assign r6 r7 to t50 t51 = mem64[b5 + 8]
# asm 1: ldrd >t50=int32#7,[<b5=int32#11,#8]
# asm 2: ldrd >t50=r6,[<b5=r10,#8]
ldrd r6,[r10,#8]

# qhasm:   b2 = mem8[yp +10]
# asm 1: ldrb >b2=int32#11,[<yp=int32#4,#10]
# asm 2: ldrb >b2=r10,[<yp=r3,#10]
ldrb r10,[r3,#10]

# qhasm:   b6 = mem8[yp +46]
# asm 1: ldrb >b6=int32#12,[<yp=int32#4,#46]
# asm 2: ldrb >b6=r11,[<yp=r3,#46]
ldrb r11,[r3,#46]

# qhasm:   y14 ^= t10
# asm 1: eor >y14=int32#5,<y14=int32#9,<t10=int32#5
# asm 2: eor >y14=r4,<y14=r8,<t10=r4
eor r4,r8,r4

# qhasm:   y15 ^= t11
# asm 1: eor >y15=int32#6,<y15=int32#10,<t11=int32#6
# asm 2: eor >y15=r5,<y15=r9,<t11=r5
eor r5,r9,r5

# qhasm:   y14 ^= t51
# asm 1: eor >y14=int32#9,<y14=int32#5,<t51=int32#8
# asm 2: eor >y14=r8,<y14=r4,<t51=r7
eor r8,r4,r7

# qhasm:   y15 ^= t50
# asm 1: eor >y15=int32#10,<y15=int32#6,<t50=int32#7
# asm 2: eor >y15=r9,<y15=r5,<t50=r6
eor r9,r5,r6

# qhasm:   b3 = mem8[yp +19]
# asm 1: ldrb >b3=int32#13,[<yp=int32#4,#19]
# asm 2: ldrb >b3=r12,[<yp=r3,#19]
ldrb r12,[r3,#19]

# qhasm:   b7 = mem8[yp +55]
# asm 1: ldrb >b7=int32#14,[<yp=int32#4,#55]
# asm 2: ldrb >b7=r14,[<yp=r3,#55]
ldrb r14,[r3,#55]

# qhasm:   b2 = input_1 + (b2 << 5)
# asm 1: add >b2=int32#5,<input_1=int32#2,<b2=int32#11,LSL #5
# asm 2: add >b2=r4,<input_1=r1,<b2=r10,LSL #5
add r4,r1,r10,LSL #5

# qhasm:   b6 = input_1 + (b6 << 5)
# asm 1: add >b6=int32#7,<input_1=int32#2,<b6=int32#12,LSL #5
# asm 2: add >b6=r6,<input_1=r1,<b6=r11,LSL #5
add r6,r1,r11,LSL #5

# qhasm:   assign r4 r5 to t20 t21 = mem64[b2 + 16]
# asm 1: ldrd >t20=int32#5,[<b2=int32#5,#16]
# asm 2: ldrd >t20=r4,[<b2=r4,#16]
ldrd r4,[r4,#16]

# qhasm:   assign r6 r7 to t60 t61 = mem64[b6 + 16]
# asm 1: ldrd >t60=int32#7,[<b6=int32#7,#16]
# asm 2: ldrd >t60=r6,[<b6=r6,#16]
ldrd r6,[r6,#16]

# qhasm:   b3 = input_1 + (b3 << 5)
# asm 1: add >b3=int32#11,<input_1=int32#2,<b3=int32#13,LSL #5
# asm 2: add >b3=r10,<input_1=r1,<b3=r12,LSL #5
add r10,r1,r12,LSL #5

# qhasm:   b7 = input_1 + (b7 << 5)
# asm 1: add >b7=int32#12,<input_1=int32#2,<b7=int32#14,LSL #5
# asm 2: add >b7=r11,<input_1=r1,<b7=r14,LSL #5
add r11,r1,r14,LSL #5

# qhasm:   y14 ^= t20
# asm 1: eor >y14=int32#9,<y14=int32#9,<t20=int32#5
# asm 2: eor >y14=r8,<y14=r8,<t20=r4
eor r8,r8,r4

# qhasm:   y15 ^= t21
# asm 1: eor >y15=int32#10,<y15=int32#10,<t21=int32#6
# asm 2: eor >y15=r9,<y15=r9,<t21=r5
eor r9,r9,r5

# qhasm:   assign r4 r5 to t30 t31 = mem64[b3 + 24]
# asm 1: ldrd >t30=int32#5,[<b3=int32#11,#24]
# asm 2: ldrd >t30=r4,[<b3=r10,#24]
ldrd r4,[r10,#24]

# qhasm:   y14 ^= t61
# asm 1: eor >y14=int32#9,<y14=int32#9,<t61=int32#8
# asm 2: eor >y14=r8,<y14=r8,<t61=r7
eor r8,r8,r7

# qhasm:   y15 ^= t60
# asm 1: eor >y15=int32#10,<y15=int32#10,<t60=int32#7
# asm 2: eor >y15=r9,<y15=r9,<t60=r6
eor r9,r9,r6

# qhasm:   assign r6 r7 to t70 t71 = mem64[b7 + 24]
# asm 1: ldrd >t70=int32#7,[<b7=int32#12,#24]
# asm 2: ldrd >t70=r6,[<b7=r11,#24]
ldrd r6,[r11,#24]

# qhasm:   y14 ^= t30
# asm 1: eor >y14=int32#5,<y14=int32#9,<t30=int32#5
# asm 2: eor >y14=r4,<y14=r8,<t30=r4
eor r4,r8,r4

# qhasm:   y15 ^= t31
# asm 1: eor >y15=int32#6,<y15=int32#10,<t31=int32#6
# asm 2: eor >y15=r5,<y15=r9,<t31=r5
eor r5,r9,r5

# qhasm:   y14 ^= t71
# asm 1: eor >y14=int32#9,<y14=int32#5,<t71=int32#8
# asm 2: eor >y14=r8,<y14=r4,<t71=r7
eor r8,r4,r7

# qhasm:   y15 ^= t70
# asm 1: eor >y15=int32#10,<y15=int32#6,<t70=int32#7
# asm 2: eor >y15=r9,<y15=r5,<t70=r6
eor r9,r5,r6

# qhasm:   assign r8 r9 to y14 y15;mem64[input_0 + 56] = y14 y15
# asm 1: strd <y14=int32#9,[<input_0=int32#1,#56]
# asm 2: strd <y14=r8,[<input_0=r0,#56]
strd r8,[r0,#56]

# qhasm: c += 1
# asm 1: add >c=int32#3,<c=int32#3,#1
# asm 2: add >c=r2,<c=r2,#1
add r2,r2,#1

# qhasm: =? c - 10
# asm 1: cmp <c=int32#3,#10
# asm 2: cmp <c=r2,#10
cmp r2,#10

# qhasm: goto ploop if !=
bne ._ploop

# qhasm: caller_r4 = caller_r4_stack
# asm 1: ldr >caller_r4=int32#5,<caller_r4_stack=stack32#1
# asm 2: ldr >caller_r4=r4,<caller_r4_stack=[sp,#0]
ldr r4,[sp,#0]

# qhasm: caller_r5 = caller_r5_stack
# asm 1: ldr >caller_r5=int32#6,<caller_r5_stack=stack32#2
# asm 2: ldr >caller_r5=r5,<caller_r5_stack=[sp,#4]
ldr r5,[sp,#4]

# qhasm: caller_r6 = caller_r6_stack
# asm 1: ldr >caller_r6=int32#7,<caller_r6_stack=stack32#3
# asm 2: ldr >caller_r6=r6,<caller_r6_stack=[sp,#8]
ldr r6,[sp,#8]

# qhasm: caller_r7 = caller_r7_stack
# asm 1: ldr >caller_r7=int32#8,<caller_r7_stack=stack32#4
# asm 2: ldr >caller_r7=r7,<caller_r7_stack=[sp,#12]
ldr r7,[sp,#12]

# qhasm: caller_r8 = caller_r8_stack
# asm 1: ldr >caller_r8=int32#9,<caller_r8_stack=stack32#5
# asm 2: ldr >caller_r8=r8,<caller_r8_stack=[sp,#16]
ldr r8,[sp,#16]

# qhasm: caller_r9 = caller_r9_stack
# asm 1: ldr >caller_r9=int32#10,<caller_r9_stack=stack32#6
# asm 2: ldr >caller_r9=r9,<caller_r9_stack=[sp,#20]
ldr r9,[sp,#20]

# qhasm: caller_r10 = caller_r10_stack
# asm 1: ldr >caller_r10=int32#11,<caller_r10_stack=stack32#7
# asm 2: ldr >caller_r10=r10,<caller_r10_stack=[sp,#24]
ldr r10,[sp,#24]

# qhasm: caller_r11 = caller_r11_stack
# asm 1: ldr >caller_r11=int32#12,<caller_r11_stack=stack32#8
# asm 2: ldr >caller_r11=r11,<caller_r11_stack=[sp,#28]
ldr r11,[sp,#28]

# qhasm: caller_r14 = caller_r14_stack
# asm 1: ldr >caller_r14=int32#14,<caller_r14_stack=stack32#9
# asm 2: ldr >caller_r14=r14,<caller_r14_stack=[sp,#32]
ldr r14,[sp,#32]

# qhasm: return
add sp,sp,#128
bx lr
