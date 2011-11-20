
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

# qhasm: int32 B

# qhasm: int32 Xrep

# qhasm: int32 X

# qhasm: int32 nextseq

# qhasm: int32 a

# qhasm: int32 b

# qhasm: int32 c

# qhasm: int32 d

# qhasm: int32 u

# qhasm: int32 v

# qhasm: int32 w

# qhasm: int32 y

# qhasm: int32 z

# qhasm: int32 temp0

# qhasm: int32 temp1

# qhasm: int32 mask

# qhasm: int32 x0

# qhasm: int32 x1

# qhasm: int32 x2

# qhasm: int32 x3

# qhasm: int32 x4

# qhasm: int32 x5

# qhasm: int32 x6

# qhasm: int32 x7

# qhasm: int32 c0

# qhasm: int32 c1

# qhasm: stack32 caller_r4_stack

# qhasm: stack32 caller_r5_stack

# qhasm: stack32 caller_r6_stack

# qhasm: stack32 caller_r7_stack

# qhasm: stack32 caller_r8_stack

# qhasm: stack32 caller_r9_stack

# qhasm: stack32 caller_r10_stack

# qhasm: stack32 caller_r11_stack

# qhasm: stack32 caller_r14_stack

# qhasm: stack32 mask1

# qhasm: stack32 mask2

# qhasm: stack32 mask4

# qhasm: stack32 mask8

# qhasm: stack32 nextseq_stack

# qhasm: stack32 B_stack

# qhasm: stack32 Xrep_stack

# qhasm: stack64 T0

# qhasm: stack64 T1

# qhasm: stack64 T2

# qhasm: stack64 T3

# qhasm: stack64 T4

# qhasm: stack64 T5

# qhasm: stack64 T6

# qhasm: stack64 T7

# qhasm: enter loopcompress
.align 2
.global _loopcompress
.global loopcompress
_loopcompress:
loopcompress:
sub sp,sp,#128

# qhasm: caller_r4_stack = caller_r4
# asm 1: str <caller_r4=int32#5,>caller_r4_stack=stack32#1
# asm 2: str <caller_r4=r4,>caller_r4_stack=[sp,#64]
str r4,[sp,#64]

# qhasm: caller_r5_stack = caller_r5
# asm 1: str <caller_r5=int32#6,>caller_r5_stack=stack32#2
# asm 2: str <caller_r5=r5,>caller_r5_stack=[sp,#68]
str r5,[sp,#68]

# qhasm: caller_r6_stack = caller_r6
# asm 1: str <caller_r6=int32#7,>caller_r6_stack=stack32#3
# asm 2: str <caller_r6=r6,>caller_r6_stack=[sp,#72]
str r6,[sp,#72]

# qhasm: caller_r7_stack = caller_r7
# asm 1: str <caller_r7=int32#8,>caller_r7_stack=stack32#4
# asm 2: str <caller_r7=r7,>caller_r7_stack=[sp,#76]
str r7,[sp,#76]

# qhasm: caller_r8_stack = caller_r8
# asm 1: str <caller_r8=int32#9,>caller_r8_stack=stack32#5
# asm 2: str <caller_r8=r8,>caller_r8_stack=[sp,#80]
str r8,[sp,#80]

# qhasm: caller_r9_stack = caller_r9
# asm 1: str <caller_r9=int32#10,>caller_r9_stack=stack32#6
# asm 2: str <caller_r9=r9,>caller_r9_stack=[sp,#84]
str r9,[sp,#84]

# qhasm: caller_r10_stack = caller_r10
# asm 1: str <caller_r10=int32#11,>caller_r10_stack=stack32#7
# asm 2: str <caller_r10=r10,>caller_r10_stack=[sp,#88]
str r10,[sp,#88]

# qhasm: caller_r11_stack = caller_r11
# asm 1: str <caller_r11=int32#12,>caller_r11_stack=stack32#8
# asm 2: str <caller_r11=r11,>caller_r11_stack=[sp,#92]
str r11,[sp,#92]

# qhasm: caller_r14_stack = caller_r14
# asm 1: str <caller_r14=int32#14,>caller_r14_stack=stack32#9
# asm 2: str <caller_r14=r14,>caller_r14_stack=[sp,#96]
str r14,[sp,#96]

# qhasm: nextseq = input_3
# asm 1: mov >nextseq=int32#4,<input_3=int32#4
# asm 2: mov >nextseq=r3,<input_3=r3
mov r3,r3

# qhasm: B = input_0
# asm 1: mov >B=int32#9,<input_0=int32#1
# asm 2: mov >B=r8,<input_0=r0
mov r8,r0

# qhasm: Xrep = input_1
# asm 1: mov >Xrep=int32#1,<input_1=int32#2
# asm 2: mov >Xrep=r0,<input_1=r1
mov r0,r1

# qhasm: X = input_2
# asm 1: mov >X=int32#11,<input_2=int32#3
# asm 2: mov >X=r10,<input_2=r2
mov r10,r2

# qhasm: y = mem32[nextseq -16]
# asm 1: ldr >y=int32#2,[<nextseq=int32#4,#-16]
# asm 2: ldr >y=r1,[<nextseq=r3,#-16]
ldr r1,[r3,#-16]

# qhasm: z = mem32[nextseq -12]
# asm 1: ldr >z=int32#3,[<nextseq=int32#4,#-12]
# asm 2: ldr >z=r2,[<nextseq=r3,#-12]
ldr r2,[r3,#-12]

# qhasm: v = mem32[nextseq -8]
# asm 1: ldr >v=int32#5,[<nextseq=int32#4,#-8]
# asm 2: ldr >v=r4,[<nextseq=r3,#-8]
ldr r4,[r3,#-8]

# qhasm: w = mem32[nextseq -4]
# asm 1: ldr >w=int32#6,[<nextseq=int32#4,#-4]
# asm 2: ldr >w=r5,[<nextseq=r3,#-4]
ldr r5,[r3,#-4]

# qhasm: mask1 = y
# asm 1: str <y=int32#2,>mask1=stack32#10
# asm 2: str <y=r1,>mask1=[sp,#100]
str r1,[sp,#100]

# qhasm: mask2 = z
# asm 1: str <z=int32#3,>mask2=stack32#11
# asm 2: str <z=r2,>mask2=[sp,#104]
str r2,[sp,#104]

# qhasm: mask4 = v
# asm 1: str <v=int32#5,>mask4=stack32#12
# asm 2: str <v=r4,>mask4=[sp,#108]
str r4,[sp,#108]

# qhasm: mask8 = w
# asm 1: str <w=int32#6,>mask8=stack32#13
# asm 2: str <w=r5,>mask8=[sp,#112]
str r5,[sp,#112]

# qhasm: nextseq_stack = nextseq
# asm 1: str <nextseq=int32#4,>nextseq_stack=stack32#14
# asm 2: str <nextseq=r3,>nextseq_stack=[sp,#116]
str r3,[sp,#116]

# qhasm: _f8:
.__f8:

# qhasm: signed>? Xrep - 0
# asm 1: cmp <Xrep=int32#1,#0
# asm 2: cmp <Xrep=r0,#0
cmp r0,#0

# qhasm: goto _end_f8 if !signed>
ble .__end_f8

# qhasm: Xrep_stack = Xrep
# asm 1: str <Xrep=int32#1,>Xrep_stack=stack32#15
# asm 2: str <Xrep=r0,>Xrep_stack=[sp,#120]
str r0,[sp,#120]

# qhasm: nextseq = nextseq_stack
# asm 1: ldr >nextseq=int32#12,<nextseq_stack=stack32#14
# asm 2: ldr >nextseq=r11,<nextseq_stack=[sp,#116]
ldr r11,[sp,#116]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+0]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#0]
# asm 2: ldrd >x0=r0,[<X=r10,#0]
ldrd r0,[r10,#0]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+0]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#0]
# asm 2: ldrd >x4=r4,[<B=r8,#0]
ldrd r4,[r8,#0]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+32]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#32]
# asm 2: ldrd >x6=r6,[<B=r8,#32]
ldrd r6,[r8,#32]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+32]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#32]
# asm 2: ldrd >x2=r2,[<X=r10,#32]
ldrd r2,[r10,#32]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+0] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#0]
# asm 2: strd <x0=r0,[<X=r10,#0]
strd r0,[r10,#0]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+32] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#32]
# asm 2: strd <x2=r2,[<X=r10,#32]
strd r2,[r10,#32]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+64]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#64]
# asm 2: ldrd >x0=r0,[<X=r10,#64]
ldrd r0,[r10,#64]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+8]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#8]
# asm 2: ldrd >x4=r4,[<B=r8,#8]
ldrd r4,[r8,#8]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+40]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#40]
# asm 2: ldrd >x6=r6,[<B=r8,#40]
ldrd r6,[r8,#40]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+96]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#96]
# asm 2: ldrd >x2=r2,[<X=r10,#96]
ldrd r2,[r10,#96]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+64] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#64]
# asm 2: strd <x0=r0,[<X=r10,#64]
strd r0,[r10,#64]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+96] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#96]
# asm 2: strd <x2=r2,[<X=r10,#96]
strd r2,[r10,#96]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+16]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#16]
# asm 2: ldrd >x0=r0,[<X=r10,#16]
ldrd r0,[r10,#16]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+16]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#16]
# asm 2: ldrd >x4=r4,[<B=r8,#16]
ldrd r4,[r8,#16]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+48]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#48]
# asm 2: ldrd >x6=r6,[<B=r8,#48]
ldrd r6,[r8,#48]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+48]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#48]
# asm 2: ldrd >x2=r2,[<X=r10,#48]
ldrd r2,[r10,#48]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+16] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#16]
# asm 2: strd <x0=r0,[<X=r10,#16]
strd r0,[r10,#16]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+48] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#48]
# asm 2: strd <x2=r2,[<X=r10,#48]
strd r2,[r10,#48]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+80]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#80]
# asm 2: ldrd >x0=r0,[<X=r10,#80]
ldrd r0,[r10,#80]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+24]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#24]
# asm 2: ldrd >x4=r4,[<B=r8,#24]
ldrd r4,[r8,#24]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+56]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#56]
# asm 2: ldrd >x6=r6,[<B=r8,#56]
ldrd r6,[r8,#56]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+112]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#112]
# asm 2: ldrd >x2=r2,[<X=r10,#112]
ldrd r2,[r10,#112]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+80] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#80]
# asm 2: strd <x0=r0,[<X=r10,#80]
strd r0,[r10,#80]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+112] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#112]
# asm 2: strd <x2=r2,[<X=r10,#112]
strd r2,[r10,#112]

# qhasm: B_stack = B
# asm 1: str <B=int32#9,>B_stack=stack32#16
# asm 2: str <B=r8,>B_stack=[sp,#124]
str r8,[sp,#124]

# qhasm: assign r2 r3 to x4 x6 = mem64[X+8]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#8]
# asm 2: ldrd >x4=r2,[<X=r10,#8]
ldrd r2,[r10,#8]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+0]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#0]
# asm 2: ldrd >x0=r0,[<X=r10,#0]
ldrd r0,[r10,#0]

# qhasm: _7rounds:
.__7rounds:

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm: assign r6 r7 to x5 x7 = mem64[X+24]
# asm 1: ldrd >x5=int32#7,[<X=int32#11,#24]
# asm 2: ldrd >x5=r6,[<X=r10,#24]
ldrd r6,[r10,#24]

# qhasm: assign r4 r5 to x1 x3 = mem64[X+16]
# asm 1: ldrd >x1=int32#5,[<X=int32#11,#16]
# asm 2: ldrd >x1=r4,[<X=r10,#16]
ldrd r4,[r10,#16]

# qhasm:       =? c0 - c1
# asm 1: cmp <c0=int32#9,<c1=int32#10
# asm 2: cmp <c0=r8,<c1=r9
cmp r8,r9

# qhasm:       goto _end_e8 if =
beq .__end_e8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       mask = mask1
# asm 1: ldr >mask=int32#9,<mask1=stack32#10
# asm 2: ldr >mask=r8,<mask1=[sp,#100]
ldr r8,[sp,#100]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #1
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #1
and r9,r8,r4,LSL #1

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 1)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #1
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #1
and r12,r8,r5,LSL #1

# qhasm:       x1= y | (x1 unsigned>> 1)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #1
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #1
orr r4,r9,r4,LSR #1

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #1
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #1
and r9,r8,r6,LSL #1

# qhasm:       x3= z | (x3 unsigned>> 1)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #1
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #1
orr r5,r12,r5,LSR #1

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 1)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #1
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #1
bic r12,r8,r7,LSL #1

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 1)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #1
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #1
orr r6,r9,r6,LSR #1

# qhasm:       x7= z | (x7 unsigned>> 1)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #1
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #1
orr r7,r12,r7,LSR #1

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask2
# asm 1: ldr >mask=int32#9,<mask2=stack32#11
# asm 2: ldr >mask=r8,<mask2=[sp,#104]
ldr r8,[sp,#104]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #2
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #2
and r9,r8,r4,LSL #2

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 2)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #2
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #2
and r12,r8,r5,LSL #2

# qhasm:       x1= y | (x1 unsigned>> 2)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #2
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #2
orr r4,r9,r4,LSR #2

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #2
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #2
and r9,r8,r6,LSL #2

# qhasm:       x3= z | (x3 unsigned>> 2)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #2
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #2
orr r5,r12,r5,LSR #2

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 2)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #2
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #2
bic r12,r8,r7,LSL #2

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 2)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #2
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #2
orr r6,r9,r6,LSR #2

# qhasm:       x7= z | (x7 unsigned>> 2)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #2
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #2
orr r7,r12,r7,LSR #2

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask4
# asm 1: ldr >mask=int32#9,<mask4=stack32#12
# asm 2: ldr >mask=r8,<mask4=[sp,#108]
ldr r8,[sp,#108]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #4
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #4
and r9,r8,r4,LSL #4

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 4)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #4
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #4
and r12,r8,r5,LSL #4

# qhasm:       x1= y | (x1 unsigned>> 4)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #4
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #4
orr r4,r9,r4,LSR #4

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #4
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #4
and r9,r8,r6,LSL #4

# qhasm:       x3= z | (x3 unsigned>> 4)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #4
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #4
orr r5,r12,r5,LSR #4

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 4)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #4
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #4
bic r12,r8,r7,LSL #4

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 4)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #4
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #4
orr r6,r9,r6,LSR #4

# qhasm:       x7= z | (x7 unsigned>> 4)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #4
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #4
orr r7,r12,r7,LSR #4

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask8
# asm 1: ldr >mask=int32#9,<mask8=stack32#13
# asm 2: ldr >mask=r8,<mask8=[sp,#112]
ldr r8,[sp,#112]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #8
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #8
and r9,r8,r4,LSL #8

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 8)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #8
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #8
and r12,r8,r5,LSL #8

# qhasm:       x1= y | (x1 unsigned>> 8)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #8
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #8
orr r4,r9,r4,LSR #8

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #8
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #8
and r9,r8,r6,LSL #8

# qhasm:       x3= z | (x3 unsigned>> 8)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #8
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #8
orr r5,r12,r5,LSR #8

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 8)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #8
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #8
bic r12,r8,r7,LSL #8

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 8)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #8
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #8
orr r6,r9,r6,LSR #8

# qhasm:       x7= z | (x7 unsigned>> 8)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #8
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #8
orr r7,r12,r7,LSR #8

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = (x1 << 16)
# asm 1: mov >y=int32#9,<x1=int32#5,LSL #16
# asm 2: mov >y=r8,<x1=r4,LSL #16
mov r8,r4,LSL #16

# qhasm:       x1 = y | (x1 unsigned>> 16)
# asm 1: orr >x1=int32#5,<y=int32#9,<x1=int32#5,LSR #16
# asm 2: orr >x1=r4,<y=r8,<x1=r4,LSR #16
orr r4,r8,r4,LSR #16

# qhasm:       y = (x3 << 16)
# asm 1: mov >y=int32#9,<x3=int32#6,LSL #16
# asm 2: mov >y=r8,<x3=r5,LSL #16
mov r8,r5,LSL #16

# qhasm:       x3 = y | (x3 unsigned>> 16)
# asm 1: orr >x3=int32#6,<y=int32#9,<x3=int32#6,LSR #16
# asm 2: orr >x3=r5,<y=r8,<x3=r5,LSR #16
orr r5,r8,r5,LSR #16

# qhasm:       y = (x5 << 16)
# asm 1: mov >y=int32#9,<x5=int32#7,LSL #16
# asm 2: mov >y=r8,<x5=r6,LSL #16
mov r8,r6,LSL #16

# qhasm:       x5 = y | (x5 unsigned>> 16)
# asm 1: orr >x5=int32#7,<y=int32#9,<x5=int32#7,LSR #16
# asm 2: orr >x5=r6,<y=r8,<x5=r6,LSR #16
orr r6,r8,r6,LSR #16

# qhasm:       y = (x7 << 16)
# asm 1: mov >y=int32#9,<x7=int32#8,LSL #16
# asm 2: mov >y=r8,<x7=r7,LSL #16
mov r8,r7,LSL #16

# qhasm:       x7 = y | (x7 unsigned>> 16)
# asm 1: orr >x7=int32#8,<y=int32#9,<x7=int32#8,LSR #16
# asm 2: orr >x7=r7,<y=r8,<x7=r7,LSR #16
orr r7,r8,r7,LSR #16

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+8] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#8]
# asm 2: strd <x4=r2,[<X=r10,#8]
strd r2,[r10,#8]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+0] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#0]
# asm 2: strd <x0=r0,[<X=r10,#0]
strd r0,[r10,#0]

# qhasm: assign r6 r7 to x5 x7 ; T1 = x5 x7
# asm 1: strd <x5=int32#7,>T1=stack64#1
# asm 2: strd <x5=r6,>T1=[sp,#0]
strd r6,[sp,#0]

# qhasm: assign r4 r5 to x1 x3 ; T0 = x1 x3
# asm 1: strd <x1=int32#5,>T0=stack64#2
# asm 2: strd <x1=r4,>T0=[sp,#8]
strd r4,[sp,#8]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm: assign r2 r3 to x4 x6 = mem64[X+40]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#40]
# asm 2: ldrd >x4=r2,[<X=r10,#40]
ldrd r2,[r10,#40]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+32]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#32]
# asm 2: ldrd >x0=r0,[<X=r10,#32]
ldrd r0,[r10,#32]

# qhasm: assign r6 r7 to x5 x7 = mem64[X+56]
# asm 1: ldrd >x5=int32#7,[<X=int32#11,#56]
# asm 2: ldrd >x5=r6,[<X=r10,#56]
ldrd r6,[r10,#56]

# qhasm: assign r4 r5 to x1 x3 = mem64[X+48]
# asm 1: ldrd >x1=int32#5,[<X=int32#11,#48]
# asm 2: ldrd >x1=r4,[<X=r10,#48]
ldrd r4,[r10,#48]

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       mask = mask1
# asm 1: ldr >mask=int32#9,<mask1=stack32#10
# asm 2: ldr >mask=r8,<mask1=[sp,#100]
ldr r8,[sp,#100]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #1
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #1
and r9,r8,r4,LSL #1

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 1)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #1
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #1
and r12,r8,r5,LSL #1

# qhasm:       x1= y | (x1 unsigned>> 1)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #1
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #1
orr r4,r9,r4,LSR #1

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #1
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #1
and r9,r8,r6,LSL #1

# qhasm:       x3= z | (x3 unsigned>> 1)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #1
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #1
orr r5,r12,r5,LSR #1

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 1)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #1
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #1
bic r12,r8,r7,LSL #1

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 1)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #1
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #1
orr r6,r9,r6,LSR #1

# qhasm:       x7= z | (x7 unsigned>> 1)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #1
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #1
orr r7,r12,r7,LSR #1

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask2
# asm 1: ldr >mask=int32#9,<mask2=stack32#11
# asm 2: ldr >mask=r8,<mask2=[sp,#104]
ldr r8,[sp,#104]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #2
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #2
and r9,r8,r4,LSL #2

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 2)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #2
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #2
and r12,r8,r5,LSL #2

# qhasm:       x1= y | (x1 unsigned>> 2)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #2
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #2
orr r4,r9,r4,LSR #2

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #2
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #2
and r9,r8,r6,LSL #2

# qhasm:       x3= z | (x3 unsigned>> 2)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #2
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #2
orr r5,r12,r5,LSR #2

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 2)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #2
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #2
bic r12,r8,r7,LSL #2

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 2)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #2
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #2
orr r6,r9,r6,LSR #2

# qhasm:       x7= z | (x7 unsigned>> 2)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #2
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #2
orr r7,r12,r7,LSR #2

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask4
# asm 1: ldr >mask=int32#9,<mask4=stack32#12
# asm 2: ldr >mask=r8,<mask4=[sp,#108]
ldr r8,[sp,#108]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #4
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #4
and r9,r8,r4,LSL #4

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 4)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #4
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #4
and r12,r8,r5,LSL #4

# qhasm:       x1= y | (x1 unsigned>> 4)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #4
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #4
orr r4,r9,r4,LSR #4

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #4
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #4
and r9,r8,r6,LSL #4

# qhasm:       x3= z | (x3 unsigned>> 4)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #4
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #4
orr r5,r12,r5,LSR #4

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 4)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #4
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #4
bic r12,r8,r7,LSL #4

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 4)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #4
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #4
orr r6,r9,r6,LSR #4

# qhasm:       x7= z | (x7 unsigned>> 4)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #4
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #4
orr r7,r12,r7,LSR #4

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask8
# asm 1: ldr >mask=int32#9,<mask8=stack32#13
# asm 2: ldr >mask=r8,<mask8=[sp,#112]
ldr r8,[sp,#112]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #8
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #8
and r9,r8,r4,LSL #8

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 8)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #8
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #8
and r12,r8,r5,LSL #8

# qhasm:       x1= y | (x1 unsigned>> 8)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #8
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #8
orr r4,r9,r4,LSR #8

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #8
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #8
and r9,r8,r6,LSL #8

# qhasm:       x3= z | (x3 unsigned>> 8)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #8
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #8
orr r5,r12,r5,LSR #8

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 8)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #8
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #8
bic r12,r8,r7,LSL #8

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 8)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #8
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #8
orr r6,r9,r6,LSR #8

# qhasm:       x7= z | (x7 unsigned>> 8)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #8
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #8
orr r7,r12,r7,LSR #8

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = (x1 << 16)
# asm 1: mov >y=int32#9,<x1=int32#5,LSL #16
# asm 2: mov >y=r8,<x1=r4,LSL #16
mov r8,r4,LSL #16

# qhasm:       x1 = y | (x1 unsigned>> 16)
# asm 1: orr >x1=int32#5,<y=int32#9,<x1=int32#5,LSR #16
# asm 2: orr >x1=r4,<y=r8,<x1=r4,LSR #16
orr r4,r8,r4,LSR #16

# qhasm:       y = (x3 << 16)
# asm 1: mov >y=int32#9,<x3=int32#6,LSL #16
# asm 2: mov >y=r8,<x3=r5,LSL #16
mov r8,r5,LSL #16

# qhasm:       x3 = y | (x3 unsigned>> 16)
# asm 1: orr >x3=int32#6,<y=int32#9,<x3=int32#6,LSR #16
# asm 2: orr >x3=r5,<y=r8,<x3=r5,LSR #16
orr r5,r8,r5,LSR #16

# qhasm:       y = (x5 << 16)
# asm 1: mov >y=int32#9,<x5=int32#7,LSL #16
# asm 2: mov >y=r8,<x5=r6,LSL #16
mov r8,r6,LSL #16

# qhasm:       x5 = y | (x5 unsigned>> 16)
# asm 1: orr >x5=int32#7,<y=int32#9,<x5=int32#7,LSR #16
# asm 2: orr >x5=r6,<y=r8,<x5=r6,LSR #16
orr r6,r8,r6,LSR #16

# qhasm:       y = (x7 << 16)
# asm 1: mov >y=int32#9,<x7=int32#8,LSL #16
# asm 2: mov >y=r8,<x7=r7,LSL #16
mov r8,r7,LSL #16

# qhasm:       x7 = y | (x7 unsigned>> 16)
# asm 1: orr >x7=int32#8,<y=int32#9,<x7=int32#8,LSR #16
# asm 2: orr >x7=r7,<y=r8,<x7=r7,LSR #16
orr r7,r8,r7,LSR #16

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+40] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#40]
# asm 2: strd <x4=r2,[<X=r10,#40]
strd r2,[r10,#40]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+32] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#32]
# asm 2: strd <x0=r0,[<X=r10,#32]
strd r0,[r10,#32]

# qhasm: assign r6 r7 to x5 x7 ; T3 = x5 x7
# asm 1: strd <x5=int32#7,>T3=stack64#3
# asm 2: strd <x5=r6,>T3=[sp,#16]
strd r6,[sp,#16]

# qhasm: assign r4 r5 to x1 x3 ; T2 = x1 x3
# asm 1: strd <x1=int32#5,>T2=stack64#4
# asm 2: strd <x1=r4,>T2=[sp,#24]
strd r4,[sp,#24]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm: assign r2 r3 to x4 x6 = mem64[X+72]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#72]
# asm 2: ldrd >x4=r2,[<X=r10,#72]
ldrd r2,[r10,#72]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+64]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#64]
# asm 2: ldrd >x0=r0,[<X=r10,#64]
ldrd r0,[r10,#64]

# qhasm: assign r6 r7 to x5 x7 = mem64[X+88]
# asm 1: ldrd >x5=int32#7,[<X=int32#11,#88]
# asm 2: ldrd >x5=r6,[<X=r10,#88]
ldrd r6,[r10,#88]

# qhasm: assign r4 r5 to x1 x3 = mem64[X+80]
# asm 1: ldrd >x1=int32#5,[<X=int32#11,#80]
# asm 2: ldrd >x1=r4,[<X=r10,#80]
ldrd r4,[r10,#80]

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       mask = mask1
# asm 1: ldr >mask=int32#9,<mask1=stack32#10
# asm 2: ldr >mask=r8,<mask1=[sp,#100]
ldr r8,[sp,#100]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #1
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #1
and r9,r8,r4,LSL #1

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 1)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #1
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #1
and r12,r8,r5,LSL #1

# qhasm:       x1= y | (x1 unsigned>> 1)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #1
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #1
orr r4,r9,r4,LSR #1

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #1
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #1
and r9,r8,r6,LSL #1

# qhasm:       x3= z | (x3 unsigned>> 1)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #1
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #1
orr r5,r12,r5,LSR #1

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 1)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #1
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #1
bic r12,r8,r7,LSL #1

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 1)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #1
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #1
orr r6,r9,r6,LSR #1

# qhasm:       x7= z | (x7 unsigned>> 1)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #1
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #1
orr r7,r12,r7,LSR #1

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask2
# asm 1: ldr >mask=int32#9,<mask2=stack32#11
# asm 2: ldr >mask=r8,<mask2=[sp,#104]
ldr r8,[sp,#104]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #2
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #2
and r9,r8,r4,LSL #2

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 2)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #2
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #2
and r12,r8,r5,LSL #2

# qhasm:       x1= y | (x1 unsigned>> 2)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #2
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #2
orr r4,r9,r4,LSR #2

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #2
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #2
and r9,r8,r6,LSL #2

# qhasm:       x3= z | (x3 unsigned>> 2)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #2
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #2
orr r5,r12,r5,LSR #2

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 2)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #2
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #2
bic r12,r8,r7,LSL #2

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 2)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #2
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #2
orr r6,r9,r6,LSR #2

# qhasm:       x7= z | (x7 unsigned>> 2)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #2
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #2
orr r7,r12,r7,LSR #2

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask4
# asm 1: ldr >mask=int32#9,<mask4=stack32#12
# asm 2: ldr >mask=r8,<mask4=[sp,#108]
ldr r8,[sp,#108]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #4
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #4
and r9,r8,r4,LSL #4

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 4)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #4
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #4
and r12,r8,r5,LSL #4

# qhasm:       x1= y | (x1 unsigned>> 4)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #4
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #4
orr r4,r9,r4,LSR #4

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #4
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #4
and r9,r8,r6,LSL #4

# qhasm:       x3= z | (x3 unsigned>> 4)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #4
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #4
orr r5,r12,r5,LSR #4

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 4)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #4
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #4
bic r12,r8,r7,LSL #4

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 4)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #4
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #4
orr r6,r9,r6,LSR #4

# qhasm:       x7= z | (x7 unsigned>> 4)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #4
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #4
orr r7,r12,r7,LSR #4

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask8
# asm 1: ldr >mask=int32#9,<mask8=stack32#13
# asm 2: ldr >mask=r8,<mask8=[sp,#112]
ldr r8,[sp,#112]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #8
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #8
and r9,r8,r4,LSL #8

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 8)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #8
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #8
and r12,r8,r5,LSL #8

# qhasm:       x1= y | (x1 unsigned>> 8)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #8
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #8
orr r4,r9,r4,LSR #8

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #8
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #8
and r9,r8,r6,LSL #8

# qhasm:       x3= z | (x3 unsigned>> 8)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #8
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #8
orr r5,r12,r5,LSR #8

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 8)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #8
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #8
bic r12,r8,r7,LSL #8

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 8)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #8
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #8
orr r6,r9,r6,LSR #8

# qhasm:       x7= z | (x7 unsigned>> 8)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #8
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #8
orr r7,r12,r7,LSR #8

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = (x1 << 16)
# asm 1: mov >y=int32#9,<x1=int32#5,LSL #16
# asm 2: mov >y=r8,<x1=r4,LSL #16
mov r8,r4,LSL #16

# qhasm:       x1 = y | (x1 unsigned>> 16)
# asm 1: orr >x1=int32#5,<y=int32#9,<x1=int32#5,LSR #16
# asm 2: orr >x1=r4,<y=r8,<x1=r4,LSR #16
orr r4,r8,r4,LSR #16

# qhasm:       y = (x3 << 16)
# asm 1: mov >y=int32#9,<x3=int32#6,LSL #16
# asm 2: mov >y=r8,<x3=r5,LSL #16
mov r8,r5,LSL #16

# qhasm:       x3 = y | (x3 unsigned>> 16)
# asm 1: orr >x3=int32#6,<y=int32#9,<x3=int32#6,LSR #16
# asm 2: orr >x3=r5,<y=r8,<x3=r5,LSR #16
orr r5,r8,r5,LSR #16

# qhasm:       y = (x5 << 16)
# asm 1: mov >y=int32#9,<x5=int32#7,LSL #16
# asm 2: mov >y=r8,<x5=r6,LSL #16
mov r8,r6,LSL #16

# qhasm:       x5 = y | (x5 unsigned>> 16)
# asm 1: orr >x5=int32#7,<y=int32#9,<x5=int32#7,LSR #16
# asm 2: orr >x5=r6,<y=r8,<x5=r6,LSR #16
orr r6,r8,r6,LSR #16

# qhasm:       y = (x7 << 16)
# asm 1: mov >y=int32#9,<x7=int32#8,LSL #16
# asm 2: mov >y=r8,<x7=r7,LSL #16
mov r8,r7,LSL #16

# qhasm:       x7 = y | (x7 unsigned>> 16)
# asm 1: orr >x7=int32#8,<y=int32#9,<x7=int32#8,LSR #16
# asm 2: orr >x7=r7,<y=r8,<x7=r7,LSR #16
orr r7,r8,r7,LSR #16

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+72] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#72]
# asm 2: strd <x4=r2,[<X=r10,#72]
strd r2,[r10,#72]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+64] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#64]
# asm 2: strd <x0=r0,[<X=r10,#64]
strd r0,[r10,#64]

# qhasm: assign r6 r7 to x5 x7 ; T5 = x5 x7
# asm 1: strd <x5=int32#7,>T5=stack64#5
# asm 2: strd <x5=r6,>T5=[sp,#32]
strd r6,[sp,#32]

# qhasm: assign r4 r5 to x1 x3 ; T4 = x1 x3
# asm 1: strd <x1=int32#5,>T4=stack64#6
# asm 2: strd <x1=r4,>T4=[sp,#40]
strd r4,[sp,#40]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm: assign r2 r3 to x4 x6 = mem64[X+104]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#104]
# asm 2: ldrd >x4=r2,[<X=r10,#104]
ldrd r2,[r10,#104]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+96]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#96]
# asm 2: ldrd >x0=r0,[<X=r10,#96]
ldrd r0,[r10,#96]

# qhasm: assign r6 r7 to x5 x7 = mem64[X+120]
# asm 1: ldrd >x5=int32#7,[<X=int32#11,#120]
# asm 2: ldrd >x5=r6,[<X=r10,#120]
ldrd r6,[r10,#120]

# qhasm: assign r4 r5 to x1 x3 = mem64[X+112]
# asm 1: ldrd >x1=int32#5,[<X=int32#11,#112]
# asm 2: ldrd >x1=r4,[<X=r10,#112]
ldrd r4,[r10,#112]

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       mask = mask1
# asm 1: ldr >mask=int32#9,<mask1=stack32#10
# asm 2: ldr >mask=r8,<mask1=[sp,#100]
ldr r8,[sp,#100]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #1
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #1
and r9,r8,r4,LSL #1

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 1)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #1
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #1
and r12,r8,r5,LSL #1

# qhasm:       x1= y | (x1 unsigned>> 1)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #1
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #1
orr r4,r9,r4,LSR #1

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 1)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #1
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #1
and r9,r8,r6,LSL #1

# qhasm:       x3= z | (x3 unsigned>> 1)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #1
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #1
orr r5,r12,r5,LSR #1

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 1)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #1
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #1
bic r12,r8,r7,LSL #1

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 1)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #1
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #1
orr r6,r9,r6,LSR #1

# qhasm:       x7= z | (x7 unsigned>> 1)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #1
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #1
orr r7,r12,r7,LSR #1

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask2
# asm 1: ldr >mask=int32#9,<mask2=stack32#11
# asm 2: ldr >mask=r8,<mask2=[sp,#104]
ldr r8,[sp,#104]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #2
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #2
and r9,r8,r4,LSL #2

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 2)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #2
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #2
and r12,r8,r5,LSL #2

# qhasm:       x1= y | (x1 unsigned>> 2)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #2
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #2
orr r4,r9,r4,LSR #2

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 2)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #2
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #2
and r9,r8,r6,LSL #2

# qhasm:       x3= z | (x3 unsigned>> 2)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #2
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #2
orr r5,r12,r5,LSR #2

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 2)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #2
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #2
bic r12,r8,r7,LSL #2

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 2)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #2
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #2
orr r6,r9,r6,LSR #2

# qhasm:       x7= z | (x7 unsigned>> 2)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #2
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #2
orr r7,r12,r7,LSR #2

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask4
# asm 1: ldr >mask=int32#9,<mask4=stack32#12
# asm 2: ldr >mask=r8,<mask4=[sp,#108]
ldr r8,[sp,#108]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #4
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #4
and r9,r8,r4,LSL #4

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 4)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #4
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #4
and r12,r8,r5,LSL #4

# qhasm:       x1= y | (x1 unsigned>> 4)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #4
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #4
orr r4,r9,r4,LSR #4

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 4)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #4
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #4
and r9,r8,r6,LSL #4

# qhasm:       x3= z | (x3 unsigned>> 4)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #4
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #4
orr r5,r12,r5,LSR #4

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 4)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #4
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #4
bic r12,r8,r7,LSL #4

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 4)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #4
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #4
orr r6,r9,r6,LSR #4

# qhasm:       x7= z | (x7 unsigned>> 4)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #4
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #4
orr r7,r12,r7,LSR #4

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       mask = mask8
# asm 1: ldr >mask=int32#9,<mask8=stack32#13
# asm 2: ldr >mask=r8,<mask8=[sp,#112]
ldr r8,[sp,#112]

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#10,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r9,<x0=r0,<x6=r3
eor r9,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#10
# asm 2: eor >x5=r6,<x5=r6,<y=r9
eor r6,r6,r9

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r9,<x1=r4,<x7=r7
eor r9,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#10
# asm 2: eor >x4=r2,<x4=r2,<y=r9
eor r2,r2,r9

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = mask & (x1 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x1=int32#5,LSL #8
# asm 2: and >y=r9,<mask=r8,<x1=r4,LSL #8
and r9,r8,r4,LSL #8

# qhasm:       x1= mask & x1
# asm 1: and >x1=int32#5,<mask=int32#9,<x1=int32#5
# asm 2: and >x1=r4,<mask=r8,<x1=r4
and r4,r8,r4

# qhasm:       z = mask & (x3 << 8)
# asm 1: and >z=int32#13,<mask=int32#9,<x3=int32#6,LSL #8
# asm 2: and >z=r12,<mask=r8,<x3=r5,LSL #8
and r12,r8,r5,LSL #8

# qhasm:       x1= y | (x1 unsigned>> 8)
# asm 1: orr >x1=int32#5,<y=int32#10,<x1=int32#5,LSR #8
# asm 2: orr >x1=r4,<y=r9,<x1=r4,LSR #8
orr r4,r9,r4,LSR #8

# qhasm:       x3= mask & x3
# asm 1: and >x3=int32#6,<mask=int32#9,<x3=int32#6
# asm 2: and >x3=r5,<mask=r8,<x3=r5
and r5,r8,r5

# qhasm:       y = mask & (x5 << 8)
# asm 1: and >y=int32#10,<mask=int32#9,<x5=int32#7,LSL #8
# asm 2: and >y=r9,<mask=r8,<x5=r6,LSL #8
and r9,r8,r6,LSL #8

# qhasm:       x3= z | (x3 unsigned>> 8)
# asm 1: orr >x3=int32#6,<z=int32#13,<x3=int32#6,LSR #8
# asm 2: orr >x3=r5,<z=r12,<x3=r5,LSR #8
orr r5,r12,r5,LSR #8

# qhasm:       x5= mask & x5
# asm 1: and >x5=int32#7,<mask=int32#9,<x5=int32#7
# asm 2: and >x5=r6,<mask=r8,<x5=r6
and r6,r8,r6

# qhasm:       z = mask & ~(x7 << 8)
# asm 1: bic >z=int32#13,<mask=int32#9,<x7=int32#8,LSL #8
# asm 2: bic >z=r12,<mask=r8,<x7=r7,LSL #8
bic r12,r8,r7,LSL #8

# qhasm:       x7= mask & ~x7
# asm 1: bic >x7=int32#8,<mask=int32#9,<x7=int32#8
# asm 2: bic >x7=r7,<mask=r8,<x7=r7
bic r7,r8,r7

# qhasm:       x5= y | (x5 unsigned>> 8)
# asm 1: orr >x5=int32#7,<y=int32#10,<x5=int32#7,LSR #8
# asm 2: orr >x5=r6,<y=r9,<x5=r6,LSR #8
orr r6,r9,r6,LSR #8

# qhasm:       x7= z | (x7 unsigned>> 8)
# asm 1: orr >x7=int32#8,<z=int32#13,<x7=int32#8,LSR #8
# asm 2: orr >x7=r7,<z=r12,<x7=r7,LSR #8
orr r7,r12,r7,LSR #8

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#9,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r8,<c1=r9,<x5=r6
bic r8,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#9,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r8,<x1=r4,<x3=r5
and r8,r4,r5

# qhasm:       temp0 = c1 ^ z
# asm 1: eor >temp0=int32#9,<c1=int32#10,<z=int32#9
# asm 2: eor >temp0=r8,<c1=r9,<z=r8
eor r8,r9,r8

# qhasm:       z = x5 & x7
# asm 1: and >z=int32#10,<x5=int32#7,<x7=int32#8
# asm 2: and >z=r9,<x5=r6,<x7=r7
and r9,r6,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#10,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r9,<x5=r6,<x3=r5
bic r9,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#10,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r9,<x1=r4,<x5=r6
and r9,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#10
# asm 2: eor >x3=r5,<x3=r5,<z=r9
eor r5,r5,r9

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#10,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r9,<x1=r4,<x7=r7
bic r9,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#10
# asm 2: eor >x5=r6,<x5=r6,<z=r9
eor r6,r6,r9

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#10,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r9,<x3=r5,<x7=r7
orr r9,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#10
# asm 2: eor >x1=r4,<x1=r4,<z=r9
eor r4,r4,r9

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#10,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r9,<x3=r5,<x5=r6
and r9,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#10
# asm 2: eor >x7=r7,<x7=r7,<z=r9
eor r7,r7,r9

# qhasm:       x5 ^= temp0
# asm 1: eor >x5=int32#7,<x5=int32#7,<temp0=int32#9
# asm 2: eor >x5=r6,<x5=r6,<temp0=r8
eor r6,r6,r8

# qhasm:       temp0 &= x1
# asm 1: and >temp0=int32#9,<temp0=int32#9,<x1=int32#5
# asm 2: and >temp0=r8,<temp0=r8,<x1=r4
and r8,r8,r4

# qhasm:       x3 ^= temp0
# asm 1: eor >x3=int32#6,<x3=int32#6,<temp0=int32#9
# asm 2: eor >x3=r5,<x3=r5,<temp0=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm:       y = (x1 << 16)
# asm 1: mov >y=int32#9,<x1=int32#5,LSL #16
# asm 2: mov >y=r8,<x1=r4,LSL #16
mov r8,r4,LSL #16

# qhasm:       x1 = y | (x1 unsigned>> 16)
# asm 1: orr >x1=int32#5,<y=int32#9,<x1=int32#5,LSR #16
# asm 2: orr >x1=r4,<y=r8,<x1=r4,LSR #16
orr r4,r8,r4,LSR #16

# qhasm:       y = (x3 << 16)
# asm 1: mov >y=int32#9,<x3=int32#6,LSL #16
# asm 2: mov >y=r8,<x3=r5,LSL #16
mov r8,r5,LSL #16

# qhasm:       x3 = y | (x3 unsigned>> 16)
# asm 1: orr >x3=int32#6,<y=int32#9,<x3=int32#6,LSR #16
# asm 2: orr >x3=r5,<y=r8,<x3=r5,LSR #16
orr r5,r8,r5,LSR #16

# qhasm:       y = (x5 << 16)
# asm 1: mov >y=int32#9,<x5=int32#7,LSL #16
# asm 2: mov >y=r8,<x5=r6,LSL #16
mov r8,r6,LSL #16

# qhasm:       x5 = y | (x5 unsigned>> 16)
# asm 1: orr >x5=int32#7,<y=int32#9,<x5=int32#7,LSR #16
# asm 2: orr >x5=r6,<y=r8,<x5=r6,LSR #16
orr r6,r8,r6,LSR #16

# qhasm:       y = (x7 << 16)
# asm 1: mov >y=int32#9,<x7=int32#8,LSL #16
# asm 2: mov >y=r8,<x7=r7,LSL #16
mov r8,r7,LSL #16

# qhasm:       x7 = y | (x7 unsigned>> 16)
# asm 1: orr >x7=int32#8,<y=int32#9,<x7=int32#8,LSR #16
# asm 2: orr >x7=r7,<y=r8,<x7=r7,LSR #16
orr r7,r8,r7,LSR #16

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+104] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#104]
# asm 2: strd <x4=r2,[<X=r10,#104]
strd r2,[r10,#104]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+96] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#96]
# asm 2: strd <x0=r0,[<X=r10,#96]
strd r0,[r10,#96]

# qhasm: assign r2 r3 to x4 x6 = mem64[X+72]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#72]
# asm 2: ldrd >x4=r2,[<X=r10,#72]
ldrd r2,[r10,#72]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+64]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#64]
# asm 2: ldrd >x0=r0,[<X=r10,#64]
ldrd r0,[r10,#64]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+72] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#72]
# asm 2: strd <x4=r2,[<X=r10,#72]
strd r2,[r10,#72]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+64] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#64]
# asm 2: strd <x0=r0,[<X=r10,#64]
strd r0,[r10,#64]

# qhasm: assign r4 r5 to x1 x3 ; mem64[X+16] = x1 x3
# asm 1: strd <x1=int32#5,[<X=int32#11,#16]
# asm 2: strd <x1=r4,[<X=r10,#16]
strd r4,[r10,#16]

# qhasm: assign r6 r7 to x5 x7 ; mem64[X+24] = x5 x7
# asm 1: strd <x5=int32#7,[<X=int32#11,#24]
# asm 2: strd <x5=r6,[<X=r10,#24]
strd r6,[r10,#24]

# qhasm: assign r2 r3 to x4 x6 = mem64[X+104]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#104]
# asm 2: ldrd >x4=r2,[<X=r10,#104]
ldrd r2,[r10,#104]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+96]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#96]
# asm 2: ldrd >x0=r0,[<X=r10,#96]
ldrd r0,[r10,#96]

# qhasm: assign r6 r7 to x5 x7 = T5
# asm 1: ldrd >x5=int32#7,<T5=stack64#5
# asm 2: ldrd >x5=r6,<T5=[sp,#32]
ldrd r6,[sp,#32]

# qhasm: assign r4 r5 to x1 x3 = T4
# asm 1: ldrd >x1=int32#5,<T4=stack64#6
# asm 2: ldrd >x1=r4,<T4=[sp,#40]
ldrd r4,[sp,#40]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+104] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#104]
# asm 2: strd <x4=r2,[<X=r10,#104]
strd r2,[r10,#104]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+96] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#96]
# asm 2: strd <x0=r0,[<X=r10,#96]
strd r0,[r10,#96]

# qhasm: assign r6 r7 to x5 x7 ; mem64[X+56] = x5 x7
# asm 1: strd <x5=int32#7,[<X=int32#11,#56]
# asm 2: strd <x5=r6,[<X=r10,#56]
strd r6,[r10,#56]

# qhasm: assign r4 r5 to x1 x3 ; mem64[X+48] = x1 x3
# asm 1: strd <x1=int32#5,[<X=int32#11,#48]
# asm 2: strd <x1=r4,[<X=r10,#48]
strd r4,[r10,#48]

# qhasm: assign r2 r3 to x4 x6 = mem64[X+40]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#40]
# asm 2: ldrd >x4=r2,[<X=r10,#40]
ldrd r2,[r10,#40]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+32]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#32]
# asm 2: ldrd >x0=r0,[<X=r10,#32]
ldrd r0,[r10,#32]

# qhasm: assign r6 r7 to x5 x7 = T1
# asm 1: ldrd >x5=int32#7,<T1=stack64#1
# asm 2: ldrd >x5=r6,<T1=[sp,#0]
ldrd r6,[sp,#0]

# qhasm: assign r4 r5 to x1 x3 = T0
# asm 1: ldrd >x1=int32#5,<T0=stack64#2
# asm 2: ldrd >x1=r4,<T0=[sp,#8]
ldrd r4,[sp,#8]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+40] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#40]
# asm 2: strd <x4=r2,[<X=r10,#40]
strd r2,[r10,#40]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+32] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#32]
# asm 2: strd <x0=r0,[<X=r10,#32]
strd r0,[r10,#32]

# qhasm: assign r4 r5 to x1 x3 ; mem64[X+112] = x1 x3
# asm 1: strd <x1=int32#5,[<X=int32#11,#112]
# asm 2: strd <x1=r4,[<X=r10,#112]
strd r4,[r10,#112]

# qhasm: assign r6 r7 to x5 x7 ; mem64[X+120] = x5 x7
# asm 1: strd <x5=int32#7,[<X=int32#11,#120]
# asm 2: strd <x5=r6,[<X=r10,#120]
strd r6,[r10,#120]

# qhasm: assign r2 r3 to x4 x6 = mem64[X+8]
# asm 1: ldrd >x4=int32#3,[<X=int32#11,#8]
# asm 2: ldrd >x4=r2,[<X=r10,#8]
ldrd r2,[r10,#8]

# qhasm: assign r0 r1 to x0 x2 = mem64[X+0]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#0]
# asm 2: ldrd >x0=r0,[<X=r10,#0]
ldrd r0,[r10,#0]

# qhasm: assign r6 r7 to x5 x7 = T3
# asm 1: ldrd >x5=int32#7,<T3=stack64#3
# asm 2: ldrd >x5=r6,<T3=[sp,#16]
ldrd r6,[sp,#16]

# qhasm: assign r4 r5 to x1 x3 = T2
# asm 1: ldrd >x1=int32#5,<T2=stack64#4
# asm 2: ldrd >x1=r4,<T2=[sp,#24]
ldrd r4,[sp,#24]

# qhasm: assign r8 r9 to c0 c1 = mem64[nextseq];nextseq += 8
# asm 1: ldrd >c0=int32#9,[<nextseq=int32#12],#8
# asm 2: ldrd >c0=r8,[<nextseq=r11],#8
ldrd r8,[r11],#8

# qhasm:       x6 = ~x6
# asm 1: mvn >x6=int32#4,<x6=int32#4
# asm 2: mvn >x6=r3,<x6=r3
mvn r3,r3

# qhasm:       y = x4 & x6
# asm 1: and >y=int32#13,<x4=int32#3,<x6=int32#4
# asm 2: and >y=r12,<x4=r2,<x6=r3
and r12,r2,r3

# qhasm:       z = c0 & ~x4
# asm 1: bic >z=int32#14,<c0=int32#9,<x4=int32#3
# asm 2: bic >z=r14,<c0=r8,<x4=r2
bic r14,r8,r2

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#14
# asm 2: eor >x0=r0,<x0=r0,<z=r14
eor r0,r0,r14

# qhasm:       z = x0 & x2
# asm 1: and >z=int32#14,<x0=int32#1,<x2=int32#2
# asm 2: and >z=r14,<x0=r0,<x2=r1
and r14,r0,r1

# qhasm:       c0 ^= z
# asm 1: eor >c0=int32#9,<c0=int32#9,<z=int32#14
# asm 2: eor >c0=r8,<c0=r8,<z=r14
eor r8,r8,r14

# qhasm:       x0 ^= y
# asm 1: eor >x0=int32#1,<x0=int32#1,<y=int32#13
# asm 2: eor >x0=r0,<x0=r0,<y=r12
eor r0,r0,r12

# qhasm:       z = x4 & ~x2
# asm 1: bic >z=int32#13,<x4=int32#3,<x2=int32#2
# asm 2: bic >z=r12,<x4=r2,<x2=r1
bic r12,r2,r1

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       z = x0 & x4
# asm 1: and >z=int32#13,<x0=int32#1,<x4=int32#3
# asm 2: and >z=r12,<x0=r0,<x4=r2
and r12,r0,r2

# qhasm:       x2 ^= z
# asm 1: eor >x2=int32#2,<x2=int32#2,<z=int32#13
# asm 2: eor >x2=r1,<x2=r1,<z=r12
eor r1,r1,r12

# qhasm:       z = x0 & ~x6
# asm 1: bic >z=int32#13,<x0=int32#1,<x6=int32#4
# asm 2: bic >z=r12,<x0=r0,<x6=r3
bic r12,r0,r3

# qhasm:       x4 ^= z
# asm 1: eor >x4=int32#3,<x4=int32#3,<z=int32#13
# asm 2: eor >x4=r2,<x4=r2,<z=r12
eor r2,r2,r12

# qhasm:       z = x2 | x6
# asm 1: orr >z=int32#13,<x2=int32#2,<x6=int32#4
# asm 2: orr >z=r12,<x2=r1,<x6=r3
orr r12,r1,r3

# qhasm:       x0 ^= z
# asm 1: eor >x0=int32#1,<x0=int32#1,<z=int32#13
# asm 2: eor >x0=r0,<x0=r0,<z=r12
eor r0,r0,r12

# qhasm:       z = x2 & x4
# asm 1: and >z=int32#13,<x2=int32#2,<x4=int32#3
# asm 2: and >z=r12,<x2=r1,<x4=r2
and r12,r1,r2

# qhasm:       x6 ^= z
# asm 1: eor >x6=int32#4,<x6=int32#4,<z=int32#13
# asm 2: eor >x6=r3,<x6=r3,<z=r12
eor r3,r3,r12

# qhasm:       x4 ^= c0
# asm 1: eor >x4=int32#3,<x4=int32#3,<c0=int32#9
# asm 2: eor >x4=r2,<x4=r2,<c0=r8
eor r2,r2,r8

# qhasm:       c0 &= x0
# asm 1: and >c0=int32#9,<c0=int32#9,<x0=int32#1
# asm 2: and >c0=r8,<c0=r8,<x0=r0
and r8,r8,r0

# qhasm:       x2 ^= c0
# asm 1: eor >x2=int32#2,<x2=int32#2,<c0=int32#9
# asm 2: eor >x2=r1,<x2=r1,<c0=r8
eor r1,r1,r8

# qhasm:       x7 = ~x7
# asm 1: mvn >x7=int32#8,<x7=int32#8
# asm 2: mvn >x7=r7,<x7=r7
mvn r7,r7

# qhasm:       y = x5 & x7
# asm 1: and >y=int32#9,<x5=int32#7,<x7=int32#8
# asm 2: and >y=r8,<x5=r6,<x7=r7
and r8,r6,r7

# qhasm:       z = c1 & ~x5
# asm 1: bic >z=int32#13,<c1=int32#10,<x5=int32#7
# asm 2: bic >z=r12,<c1=r9,<x5=r6
bic r12,r9,r6

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#13
# asm 2: eor >x1=r4,<x1=r4,<z=r12
eor r4,r4,r12

# qhasm:       z = x1 & x3
# asm 1: and >z=int32#13,<x1=int32#5,<x3=int32#6
# asm 2: and >z=r12,<x1=r4,<x3=r5
and r12,r4,r5

# qhasm:       c1 ^= z
# asm 1: eor >c1=int32#10,<c1=int32#10,<z=int32#13
# asm 2: eor >c1=r9,<c1=r9,<z=r12
eor r9,r9,r12

# qhasm:       x1 ^= y
# asm 1: eor >x1=int32#5,<x1=int32#5,<y=int32#9
# asm 2: eor >x1=r4,<x1=r4,<y=r8
eor r4,r4,r8

# qhasm:       z = x5 & ~x3
# asm 1: bic >z=int32#9,<x5=int32#7,<x3=int32#6
# asm 2: bic >z=r8,<x5=r6,<x3=r5
bic r8,r6,r5

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       z = x1 & x5
# asm 1: and >z=int32#9,<x1=int32#5,<x5=int32#7
# asm 2: and >z=r8,<x1=r4,<x5=r6
and r8,r4,r6

# qhasm:       x3 ^= z
# asm 1: eor >x3=int32#6,<x3=int32#6,<z=int32#9
# asm 2: eor >x3=r5,<x3=r5,<z=r8
eor r5,r5,r8

# qhasm:       z = x1 & ~x7
# asm 1: bic >z=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: bic >z=r8,<x1=r4,<x7=r7
bic r8,r4,r7

# qhasm:       x5 ^= z
# asm 1: eor >x5=int32#7,<x5=int32#7,<z=int32#9
# asm 2: eor >x5=r6,<x5=r6,<z=r8
eor r6,r6,r8

# qhasm:       z = x3 | x7
# asm 1: orr >z=int32#9,<x3=int32#6,<x7=int32#8
# asm 2: orr >z=r8,<x3=r5,<x7=r7
orr r8,r5,r7

# qhasm:       x1 ^= z
# asm 1: eor >x1=int32#5,<x1=int32#5,<z=int32#9
# asm 2: eor >x1=r4,<x1=r4,<z=r8
eor r4,r4,r8

# qhasm:       z = x3 & x5
# asm 1: and >z=int32#9,<x3=int32#6,<x5=int32#7
# asm 2: and >z=r8,<x3=r5,<x5=r6
and r8,r5,r6

# qhasm:       x7 ^= z
# asm 1: eor >x7=int32#8,<x7=int32#8,<z=int32#9
# asm 2: eor >x7=r7,<x7=r7,<z=r8
eor r7,r7,r8

# qhasm:       x5 ^= c1
# asm 1: eor >x5=int32#7,<x5=int32#7,<c1=int32#10
# asm 2: eor >x5=r6,<x5=r6,<c1=r9
eor r6,r6,r9

# qhasm:       c1 &= x1
# asm 1: and >c1=int32#9,<c1=int32#10,<x1=int32#5
# asm 2: and >c1=r8,<c1=r9,<x1=r4
and r8,r9,r4

# qhasm:       x3 ^= c1
# asm 1: eor >x3=int32#6,<x3=int32#6,<c1=int32#9
# asm 2: eor >x3=r5,<x3=r5,<c1=r8
eor r5,r5,r8

# qhasm:       x1 ^= x2
# asm 1: eor >x1=int32#5,<x1=int32#5,<x2=int32#2
# asm 2: eor >x1=r4,<x1=r4,<x2=r1
eor r4,r4,r1

# qhasm:       x3 ^= x4
# asm 1: eor >x3=int32#6,<x3=int32#6,<x4=int32#3
# asm 2: eor >x3=r5,<x3=r5,<x4=r2
eor r5,r5,r2

# qhasm:       y = x0 ^ x6
# asm 1: eor >y=int32#9,<x0=int32#1,<x6=int32#4
# asm 2: eor >y=r8,<x0=r0,<x6=r3
eor r8,r0,r3

# qhasm:       x5 ^= y
# asm 1: eor >x5=int32#7,<x5=int32#7,<y=int32#9
# asm 2: eor >x5=r6,<x5=r6,<y=r8
eor r6,r6,r8

# qhasm:       x7 ^= x0
# asm 1: eor >x7=int32#8,<x7=int32#8,<x0=int32#1
# asm 2: eor >x7=r7,<x7=r7,<x0=r0
eor r7,r7,r0

# qhasm:       x0 ^= x3
# asm 1: eor >x0=int32#1,<x0=int32#1,<x3=int32#6
# asm 2: eor >x0=r0,<x0=r0,<x3=r5
eor r0,r0,r5

# qhasm:       x2 ^= x5
# asm 1: eor >x2=int32#2,<x2=int32#2,<x5=int32#7
# asm 2: eor >x2=r1,<x2=r1,<x5=r6
eor r1,r1,r6

# qhasm:       y = x1 ^ x7
# asm 1: eor >y=int32#9,<x1=int32#5,<x7=int32#8
# asm 2: eor >y=r8,<x1=r4,<x7=r7
eor r8,r4,r7

# qhasm:       x4 ^= y
# asm 1: eor >x4=int32#3,<x4=int32#3,<y=int32#9
# asm 2: eor >x4=r2,<x4=r2,<y=r8
eor r2,r2,r8

# qhasm:       x6 ^= x1
# asm 1: eor >x6=int32#4,<x6=int32#4,<x1=int32#5
# asm 2: eor >x6=r3,<x6=r3,<x1=r4
eor r3,r3,r4

# qhasm: assign r6 r7 to x5 x7 ; mem64[X+88] = x5 x7
# asm 1: strd <x5=int32#7,[<X=int32#11,#88]
# asm 2: strd <x5=r6,[<X=r10,#88]
strd r6,[r10,#88]

# qhasm: assign r4 r5 to x1 x3 ; mem64[X+80] = x1 x3
# asm 1: strd <x1=int32#5,[<X=int32#11,#80]
# asm 2: strd <x1=r4,[<X=r10,#80]
strd r4,[r10,#80]

# qhasm:      goto _7rounds
b .__7rounds

# qhasm:       _end_e8:
.__end_e8:

# qhasm: assign r2 r3 to x4 x6 ; mem64[X+8] = x4 x6
# asm 1: strd <x4=int32#3,[<X=int32#11,#8]
# asm 2: strd <x4=r2,[<X=r10,#8]
strd r2,[r10,#8]

# qhasm: assign r0 r1 to x0 x2 ; mem64[X+0] = x0 x2
# asm 1: strd <x0=int32#1,[<X=int32#11,#0]
# asm 2: strd <x0=r0,[<X=r10,#0]
strd r0,[r10,#0]

# qhasm: B = B_stack
# asm 1: ldr >B=int32#9,<B_stack=stack32#16
# asm 2: ldr >B=r8,<B_stack=[sp,#124]
ldr r8,[sp,#124]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+8]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#8]
# asm 2: ldrd >x0=r0,[<X=r10,#8]
ldrd r0,[r10,#8]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+0]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#0]
# asm 2: ldrd >x4=r4,[<B=r8,#0]
ldrd r4,[r8,#0]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+32]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#32]
# asm 2: ldrd >x6=r6,[<B=r8,#32]
ldrd r6,[r8,#32]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+40]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#40]
# asm 2: ldrd >x2=r2,[<X=r10,#40]
ldrd r2,[r10,#40]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+8] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#8]
# asm 2: strd <x0=r0,[<X=r10,#8]
strd r0,[r10,#8]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+40] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#40]
# asm 2: strd <x2=r2,[<X=r10,#40]
strd r2,[r10,#40]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+72]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#72]
# asm 2: ldrd >x0=r0,[<X=r10,#72]
ldrd r0,[r10,#72]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+8]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#8]
# asm 2: ldrd >x4=r4,[<B=r8,#8]
ldrd r4,[r8,#8]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+40]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#40]
# asm 2: ldrd >x6=r6,[<B=r8,#40]
ldrd r6,[r8,#40]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+104]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#104]
# asm 2: ldrd >x2=r2,[<X=r10,#104]
ldrd r2,[r10,#104]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+72] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#72]
# asm 2: strd <x0=r0,[<X=r10,#72]
strd r0,[r10,#72]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+104] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#104]
# asm 2: strd <x2=r2,[<X=r10,#104]
strd r2,[r10,#104]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+24]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#24]
# asm 2: ldrd >x0=r0,[<X=r10,#24]
ldrd r0,[r10,#24]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+16]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#16]
# asm 2: ldrd >x4=r4,[<B=r8,#16]
ldrd r4,[r8,#16]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+48]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#48]
# asm 2: ldrd >x6=r6,[<B=r8,#48]
ldrd r6,[r8,#48]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+56]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#56]
# asm 2: ldrd >x2=r2,[<X=r10,#56]
ldrd r2,[r10,#56]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+24] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#24]
# asm 2: strd <x0=r0,[<X=r10,#24]
strd r0,[r10,#24]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+56] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#56]
# asm 2: strd <x2=r2,[<X=r10,#56]
strd r2,[r10,#56]

# qhasm: assign r0 r1 to x0 x1 = mem64[X+88]
# asm 1: ldrd >x0=int32#1,[<X=int32#11,#88]
# asm 2: ldrd >x0=r0,[<X=r10,#88]
ldrd r0,[r10,#88]

# qhasm: assign r4 r5 to x4 x5 = mem64[B+24]
# asm 1: ldrd >x4=int32#5,[<B=int32#9,#24]
# asm 2: ldrd >x4=r4,[<B=r8,#24]
ldrd r4,[r8,#24]

# qhasm: assign r6 r7 to x6 x7 = mem64[B+56]
# asm 1: ldrd >x6=int32#7,[<B=int32#9,#56]
# asm 2: ldrd >x6=r6,[<B=r8,#56]
ldrd r6,[r8,#56]

# qhasm: assign r2 r3 to x2 x3 = mem64[X+120]
# asm 1: ldrd >x2=int32#3,[<X=int32#11,#120]
# asm 2: ldrd >x2=r2,[<X=r10,#120]
ldrd r2,[r10,#120]

# qhasm: x0 ^= x4
# asm 1: eor >x0=int32#1,<x0=int32#1,<x4=int32#5
# asm 2: eor >x0=r0,<x0=r0,<x4=r4
eor r0,r0,r4

# qhasm: x1 ^= x6
# asm 1: eor >x1=int32#2,<x1=int32#2,<x6=int32#7
# asm 2: eor >x1=r1,<x1=r1,<x6=r6
eor r1,r1,r6

# qhasm: assign r0 r1 to x0 x1; mem64[X+88] = x0 x1
# asm 1: strd <x0=int32#1,[<X=int32#11,#88]
# asm 2: strd <x0=r0,[<X=r10,#88]
strd r0,[r10,#88]

# qhasm: x2 ^= x5
# asm 1: eor >x2=int32#3,<x2=int32#3,<x5=int32#6
# asm 2: eor >x2=r2,<x2=r2,<x5=r5
eor r2,r2,r5

# qhasm: x3 ^= x7
# asm 1: eor >x3=int32#4,<x3=int32#4,<x7=int32#8
# asm 2: eor >x3=r3,<x3=r3,<x7=r7
eor r3,r3,r7

# qhasm: assign r2 r3 to x2 x3; mem64[X+120] = x2 x3
# asm 1: strd <x2=int32#3,[<X=int32#11,#120]
# asm 2: strd <x2=r2,[<X=r10,#120]
strd r2,[r10,#120]

# qhasm: B += 64
# asm 1: add >B=int32#9,<B=int32#9,#64
# asm 2: add >B=r8,<B=r8,#64
add r8,r8,#64

# qhasm: Xrep = Xrep_stack
# asm 1: ldr >Xrep=int32#1,<Xrep_stack=stack32#15
# asm 2: ldr >Xrep=r0,<Xrep_stack=[sp,#120]
ldr r0,[sp,#120]

# qhasm: Xrep = Xrep - 1
# asm 1: sub >Xrep=int32#1,<Xrep=int32#1,#1
# asm 2: sub >Xrep=r0,<Xrep=r0,#1
sub r0,r0,#1

# qhasm: goto _f8
b .__f8

# qhasm: _end_f8:
.__end_f8:

# qhasm: caller_r4 = caller_r4_stack
# asm 1: ldr >caller_r4=int32#5,<caller_r4_stack=stack32#1
# asm 2: ldr >caller_r4=r4,<caller_r4_stack=[sp,#64]
ldr r4,[sp,#64]

# qhasm: caller_r5 = caller_r5_stack
# asm 1: ldr >caller_r5=int32#6,<caller_r5_stack=stack32#2
# asm 2: ldr >caller_r5=r5,<caller_r5_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: caller_r6 = caller_r6_stack
# asm 1: ldr >caller_r6=int32#7,<caller_r6_stack=stack32#3
# asm 2: ldr >caller_r6=r6,<caller_r6_stack=[sp,#72]
ldr r6,[sp,#72]

# qhasm: caller_r7 = caller_r7_stack
# asm 1: ldr >caller_r7=int32#8,<caller_r7_stack=stack32#4
# asm 2: ldr >caller_r7=r7,<caller_r7_stack=[sp,#76]
ldr r7,[sp,#76]

# qhasm: caller_r8 = caller_r8_stack
# asm 1: ldr >caller_r8=int32#9,<caller_r8_stack=stack32#5
# asm 2: ldr >caller_r8=r8,<caller_r8_stack=[sp,#80]
ldr r8,[sp,#80]

# qhasm: caller_r9 = caller_r9_stack
# asm 1: ldr >caller_r9=int32#10,<caller_r9_stack=stack32#6
# asm 2: ldr >caller_r9=r9,<caller_r9_stack=[sp,#84]
ldr r9,[sp,#84]

# qhasm: caller_r10 = caller_r10_stack
# asm 1: ldr >caller_r10=int32#11,<caller_r10_stack=stack32#7
# asm 2: ldr >caller_r10=r10,<caller_r10_stack=[sp,#88]
ldr r10,[sp,#88]

# qhasm: caller_r11 = caller_r11_stack
# asm 1: ldr >caller_r11=int32#12,<caller_r11_stack=stack32#8
# asm 2: ldr >caller_r11=r11,<caller_r11_stack=[sp,#92]
ldr r11,[sp,#92]

# qhasm: caller_r14 = caller_r14_stack
# asm 1: ldr >caller_r14=int32#14,<caller_r14_stack=stack32#9
# asm 2: ldr >caller_r14=r14,<caller_r14_stack=[sp,#96]
ldr r14,[sp,#96]

# qhasm: return
add sp,sp,#128
bx lr
