# Proest permutation on ARM
# (c) Thom Wiggers, 2015
# This file is available under the New BSD licence
#
# See also https://thomwiggers.nl/proest/ for more information and the qhasm
# source code

# qhasm: int32 input_0

# qhasm: int32 input_1

# qhasm: int32 input_2

# qhasm: int32 input_3

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

# qhasm: int32 x_0_1

# qhasm: int32 x_2_3

# qhasm: int32 x_4_5

# qhasm: int32 x_6_7

# qhasm: int32 x_8_9

# qhasm: int32 x_10_11

# qhasm: int32 x_11

# qhasm: int32 x_12_13

# qhasm: int32 x_14_15

# qhasm: int32 bits_0

# qhasm: int32 bits_1

# qhasm: int32 bits_2

# qhasm: int32 bits_3

# qhasm: int32 bits_4

# qhasm: int32 bits_5

# qhasm: int32 bits_6

# qhasm: int32 bits_7

# qhasm: int32 bits_8

# qhasm: int32 bits_9

# qhasm: int32 bits_10

# qhasm: int32 bits_11

# qhasm: int32 bits_12

# qhasm: int32 bits_13

# qhasm: int32 bits_14

# qhasm: int32 bits_15

# qhasm: int32 t1

# qhasm: int32 t2

# qhasm: int32 t3

# qhasm: int32 t4

# qhasm: int32 t5shifted

# qhasm: int32 t6shifted

# qhasm: int32 t7

# qhasm: int32 t8

# qhasm: int32 t8shifted

# qhasm: int32 t9

# qhasm: int32 t10shifted

# qhasm: int32 t8_t11

# qhasm: int32 t11

# qhasm: int32 t12

# qhasm: int32 t13

# qhasm: int32 t14

# qhasm: int32 t15shifted

# qhasm: int32 t16

# qhasm: int32 t17shifted

# qhasm: int32 t18

# qhasm: int32 t19

# qhasm: int32 t20

# qhasm: int32 t21

# qhasm: int32 t22

# qhasm: int32 t23

# qhasm: int32 t24

# qhasm: int32 t25

# qhasm: int32 t26

# qhasm: int32 t27

# qhasm: int32 t28

# qhasm: int32 t28shifted

# qhasm: int32 t29

# qhasm: int32 t30

# qhasm: int32 t31shifted

# qhasm: int32 t32

# qhasm: int32 t33

# qhasm: int32 t34

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

# qhasm: int32 x_1_0

# qhasm: int32 x_1_1

# qhasm: int32 x_1_2

# qhasm: int32 x_1_3

# qhasm: int32 x_2_0

# qhasm: int32 x_2_1

# qhasm: int32 x_2_2

# qhasm: int32 mx_2_3

# qhasm: int32 x_3_0

# qhasm: int32 x_3_1

# qhasm: int32 x_3_2

# qhasm: int32 x_3_3

# qhasm: int32 x

# qhasm: int32 y

# qhasm: int32 z

# qhasm: int32 roundcounter

# qhasm: int32 c1

# qhasm: int32 c2

# qhasm: int32 offset

# qhasm: enter ARM_ASM_proest_unrolled
.align 4
.global _ARM_ASM_proest_unrolled
.global ARM_ASM_proest_unrolled
.type _ARM_ASM_proest_unrolled STT_FUNC
.type ARM_ASM_proest_unrolled STT_FUNC
_ARM_ASM_proest_unrolled:
ARM_ASM_proest_unrolled:
sub sp,sp,#0

# qhasm:     offset = input_0 + 52
# asm 1: add >offset=int32#2,<input_0=int32#1,#52
# asm 2: add >offset=r1,<input_0=r0,#52
add r1,r0,#52

# qhasm:     storesp[input_0 + 88]
# asm 1: str sp,[<input_0=int32#1,#88]
# asm 2: str sp,[<input_0=r0,#88]
str sp,[r0,#88]

# qhasm:     mem288[offset] = caller_r4 caller_r5 caller_r6 caller_r7 caller_r8 caller_r9 caller_r10 caller_r11 caller_r14
# asm 1: stm <offset=int32#2, {<caller_r4=int32#5,<caller_r5=int32#6,<caller_r6=int32#7,<caller_r7=int32#8,<caller_r8=int32#9,<caller_r9=int32#10,<caller_r10=int32#11,<caller_r11=int32#12,<caller_r14=int32#15}
# asm 2: stm <offset=r1, {<caller_r4=r4,<caller_r5=r5,<caller_r6=r6,<caller_r7=r7,<caller_r8=r8,<caller_r9=r9,<caller_r10=r10,<caller_r11=r11,<caller_r14=r14}
stm r1, {r4,r5,r6,r7,r8,r9,r10,r11,r14}

# qhasm:     assign r13 to roundcounter

# qhasm:     roundcounter = 32  
# asm 1: ldr >roundcounter=int32#5,=32
# asm 2: ldr >roundcounter=r4,=32
ldr r4,=32

# qhasm:     proest_beginning:
._proest_beginning:

# qhasm:     assign r1 r2 r3 r12 to x_0_1 x_2_3 x_4_5 x_6_7 = mem128[input_0]
# asm 1: ldm <input_0=int32#1, {>x_0_1=int32#2,>x_2_3=int32#3,>x_4_5=int32#4,>x_6_7=int32#13}
# asm 2: ldm <input_0=r0, {>x_0_1=r1,>x_2_3=r2,>x_4_5=r3,>x_6_7=r12}
ldm r0, {r1,r2,r3,r12}

# qhasm:     mem16[input_0 + 92] = roundcounter
# asm 1: strh <roundcounter=int32#5,[<input_0=int32#1,#92]
# asm 2: strh <roundcounter=r4,[<input_0=r0,#92]
strh r4,[r0,#92]

# qhasm:     bits_0 = x_0_1 & (x_0_1 unsigned>> 16)
# asm 1: and >bits_0=int32#5,<x_0_1=int32#2,<x_0_1=int32#2,LSR #16
# asm 2: and >bits_0=r4,<x_0_1=r1,<x_0_1=r1,LSR #16
and r4,r1,r1,LSR #16

# qhasm:     bits_0 ^= x_2_3
# asm 1: eor >bits_0=int32#5,<bits_0=int32#5,<x_2_3=int32#3
# asm 2: eor >bits_0=r4,<bits_0=r4,<x_2_3=r2
eor r4,r4,r2

# qhasm:     mem16[input_0] = bits_0; input_0 += 2
# asm 1: strh <bits_0=int32#5,[<input_0=int32#1],#2
# asm 2: strh <bits_0=r4,[<input_0=r0],#2
strh r4,[r0],#2

# qhasm:     bits_1 = x_2_3 & (x_0_1 unsigned>> 16)
# asm 1: and >bits_1=int32#6,<x_2_3=int32#3,<x_0_1=int32#2,LSR #16
# asm 2: and >bits_1=r5,<x_2_3=r2,<x_0_1=r1,LSR #16
and r5,r2,r1,LSR #16

# qhasm:     bits_1 ^= (x_2_3 unsigned>> 16)
# asm 1: eor >bits_1=int32#3,<bits_1=int32#6,<x_2_3=int32#3,LSR #16
# asm 2: eor >bits_1=r2,<bits_1=r5,<x_2_3=r2,LSR #16
eor r2,r5,r2,LSR #16

# qhasm:     mem16[input_0] = bits_1; input_0 += 2
# asm 1: strh <bits_1=int32#3,[<input_0=int32#1],#2
# asm 2: strh <bits_1=r2,[<input_0=r0],#2
strh r2,[r0],#2

# qhasm:     bits_2 = bits_0 & bits_1
# asm 1: and >bits_2=int32#5,<bits_0=int32#5,<bits_1=int32#3
# asm 2: and >bits_2=r4,<bits_0=r4,<bits_1=r2
and r4,r4,r2

# qhasm:     bits_2 ^= x_0_1
# asm 1: eor >bits_2=int32#5,<bits_2=int32#5,<x_0_1=int32#2
# asm 2: eor >bits_2=r4,<bits_2=r4,<x_0_1=r1
eor r4,r4,r1

# qhasm:     mem16[input_0] = bits_2; input_0 += 2
# asm 1: strh <bits_2=int32#5,[<input_0=int32#1],#2
# asm 2: strh <bits_2=r4,[<input_0=r0],#2
strh r4,[r0],#2

# qhasm:     bits_3 = bits_1 & bits_2
# asm 1: and >bits_3=int32#3,<bits_1=int32#3,<bits_2=int32#5
# asm 2: and >bits_3=r2,<bits_1=r2,<bits_2=r4
and r2,r2,r4

# qhasm:     bits_3 ^= (x_0_1 unsigned>> 16)
# asm 1: eor >bits_3=int32#2,<bits_3=int32#3,<x_0_1=int32#2,LSR #16
# asm 2: eor >bits_3=r1,<bits_3=r2,<x_0_1=r1,LSR #16
eor r1,r2,r1,LSR #16

# qhasm:     mem16[input_0] = bits_3; input_0 += 2
# asm 1: strh <bits_3=int32#2,[<input_0=int32#1],#2
# asm 2: strh <bits_3=r1,[<input_0=r0],#2
strh r1,[r0],#2

# qhasm:     bits_4 = x_4_5 & (x_4_5 unsigned>> 16)
# asm 1: and >bits_4=int32#2,<x_4_5=int32#4,<x_4_5=int32#4,LSR #16
# asm 2: and >bits_4=r1,<x_4_5=r3,<x_4_5=r3,LSR #16
and r1,r3,r3,LSR #16

# qhasm:     bits_4 ^= x_6_7
# asm 1: eor >bits_4=int32#2,<bits_4=int32#2,<x_6_7=int32#13
# asm 2: eor >bits_4=r1,<bits_4=r1,<x_6_7=r12
eor r1,r1,r12

# qhasm:     mem16[input_0] = bits_4; input_0 += 8
# asm 1: strh <bits_4=int32#2,[<input_0=int32#1],#8
# asm 2: strh <bits_4=r1,[<input_0=r0],#8
strh r1,[r0],#8

# qhasm:     bits_5 = x_6_7 & (x_4_5 unsigned>> 16)
# asm 1: and >bits_5=int32#3,<x_6_7=int32#13,<x_4_5=int32#4,LSR #16
# asm 2: and >bits_5=r2,<x_6_7=r12,<x_4_5=r3,LSR #16
and r2,r12,r3,LSR #16

# qhasm:     bits_5 ^= (x_6_7 unsigned>> 16)
# asm 1: eor >bits_5=int32#3,<bits_5=int32#3,<x_6_7=int32#13,LSR #16
# asm 2: eor >bits_5=r2,<bits_5=r2,<x_6_7=r12,LSR #16
eor r2,r2,r12,LSR #16

# qhasm:     bits_6 = bits_4 & bits_5
# asm 1: and >bits_6=int32#2,<bits_4=int32#2,<bits_5=int32#3
# asm 2: and >bits_6=r1,<bits_4=r1,<bits_5=r2
and r1,r1,r2

# qhasm:     bits_6 ^= x_4_5
# asm 1: eor >bits_6=int32#2,<bits_6=int32#2,<x_4_5=int32#4
# asm 2: eor >bits_6=r1,<bits_6=r1,<x_4_5=r3
eor r1,r1,r3

# qhasm:     assign r4 r5 r6 r7 to x_8_9 x_10_11 x_12_13 x_14_15 = mem128[input_0]
# asm 1: ldm <input_0=int32#1, {>x_8_9=int32#5,>x_10_11=int32#6,>x_12_13=int32#7,>x_14_15=int32#8}
# asm 2: ldm <input_0=r0, {>x_8_9=r4,>x_10_11=r5,>x_12_13=r6,>x_14_15=r7}
ldm r0, {r4,r5,r6,r7}

# qhasm:     input_0 -= 16
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#16
# asm 2: sub >input_0=r0,<input_0=r0,#16
sub r0,r0,#16

# qhasm:     bits_7 = bits_5 & bits_6
# asm 1: and >bits_7=int32#9,<bits_5=int32#3,<bits_6=int32#2
# asm 2: and >bits_7=r8,<bits_5=r2,<bits_6=r1
and r8,r2,r1

# qhasm:     bits_7 ^= (x_4_5 unsigned>> 16)
# asm 1: eor >bits_7=int32#4,<bits_7=int32#9,<x_4_5=int32#4,LSR #16
# asm 2: eor >bits_7=r3,<bits_7=r8,<x_4_5=r3,LSR #16
eor r3,r8,r3,LSR #16

# qhasm:     mem16[input_0 + 10] = bits_5
# asm 1: strh <bits_5=int32#3,[<input_0=int32#1,#10]
# asm 2: strh <bits_5=r2,[<input_0=r0,#10]
strh r2,[r0,#10]

# qhasm:     mem16[input_0 + 12] = bits_6
# asm 1: strh <bits_6=int32#2,[<input_0=int32#1,#12]
# asm 2: strh <bits_6=r1,[<input_0=r0,#12]
strh r1,[r0,#12]

# qhasm:     mem16[input_0 + 14] = bits_7
# asm 1: strh <bits_7=int32#4,[<input_0=int32#1,#14]
# asm 2: strh <bits_7=r3,[<input_0=r0,#14]
strh r3,[r0,#14]

# qhasm:     bits_8 = x_8_9 & (x_8_9 unsigned>> 16)
# asm 1: and >bits_8=int32#2,<x_8_9=int32#5,<x_8_9=int32#5,LSR #16
# asm 2: and >bits_8=r1,<x_8_9=r4,<x_8_9=r4,LSR #16
and r1,r4,r4,LSR #16

# qhasm:     bits_8 ^= x_10_11
# asm 1: eor >bits_8=int32#2,<bits_8=int32#2,<x_10_11=int32#6
# asm 2: eor >bits_8=r1,<bits_8=r1,<x_10_11=r5
eor r1,r1,r5

# qhasm:     mem16[input_0 + 16] = bits_8
# asm 1: strh <bits_8=int32#2,[<input_0=int32#1,#16]
# asm 2: strh <bits_8=r1,[<input_0=r0,#16]
strh r1,[r0,#16]

# qhasm:     bits_9 = x_10_11 & (x_8_9 unsigned>> 16)
# asm 1: and >bits_9=int32#3,<x_10_11=int32#6,<x_8_9=int32#5,LSR #16
# asm 2: and >bits_9=r2,<x_10_11=r5,<x_8_9=r4,LSR #16
and r2,r5,r4,LSR #16

# qhasm:     bits_9 ^= (x_10_11 unsigned>> 16)
# asm 1: eor >bits_9=int32#3,<bits_9=int32#3,<x_10_11=int32#6,LSR #16
# asm 2: eor >bits_9=r2,<bits_9=r2,<x_10_11=r5,LSR #16
eor r2,r2,r5,LSR #16

# qhasm:     mem16[input_0 + 18] = bits_9
# asm 1: strh <bits_9=int32#3,[<input_0=int32#1,#18]
# asm 2: strh <bits_9=r2,[<input_0=r0,#18]
strh r2,[r0,#18]

# qhasm:     bits_10 = bits_8 & bits_9
# asm 1: and >bits_10=int32#2,<bits_8=int32#2,<bits_9=int32#3
# asm 2: and >bits_10=r1,<bits_8=r1,<bits_9=r2
and r1,r1,r2

# qhasm:     bits_10 ^= x_8_9
# asm 1: eor >bits_10=int32#2,<bits_10=int32#2,<x_8_9=int32#5
# asm 2: eor >bits_10=r1,<bits_10=r1,<x_8_9=r4
eor r1,r1,r4

# qhasm:     mem16[input_0 + 20] = bits_10
# asm 1: strh <bits_10=int32#2,[<input_0=int32#1,#20]
# asm 2: strh <bits_10=r1,[<input_0=r0,#20]
strh r1,[r0,#20]

# qhasm:     bits_11 = bits_9 & bits_10
# asm 1: and >bits_11=int32#2,<bits_9=int32#3,<bits_10=int32#2
# asm 2: and >bits_11=r1,<bits_9=r2,<bits_10=r1
and r1,r2,r1

# qhasm:     bits_11 ^= (x_8_9 unsigned>> 16)
# asm 1: eor >bits_11=int32#2,<bits_11=int32#2,<x_8_9=int32#5,LSR #16
# asm 2: eor >bits_11=r1,<bits_11=r1,<x_8_9=r4,LSR #16
eor r1,r1,r4,LSR #16

# qhasm:     mem16[input_0 + 22] = bits_11
# asm 1: strh <bits_11=int32#2,[<input_0=int32#1,#22]
# asm 2: strh <bits_11=r1,[<input_0=r0,#22]
strh r1,[r0,#22]

# qhasm:     bits_12 = x_12_13 & (x_12_13 unsigned>> 16)
# asm 1: and >bits_12=int32#2,<x_12_13=int32#7,<x_12_13=int32#7,LSR #16
# asm 2: and >bits_12=r1,<x_12_13=r6,<x_12_13=r6,LSR #16
and r1,r6,r6,LSR #16

# qhasm:     bits_12 ^= x_14_15
# asm 1: eor >bits_12=int32#2,<bits_12=int32#2,<x_14_15=int32#8
# asm 2: eor >bits_12=r1,<bits_12=r1,<x_14_15=r7
eor r1,r1,r7

# qhasm:     mem16[input_0 + 24] = bits_12
# asm 1: strh <bits_12=int32#2,[<input_0=int32#1,#24]
# asm 2: strh <bits_12=r1,[<input_0=r0,#24]
strh r1,[r0,#24]

# qhasm:     bits_13 = x_14_15 & (x_12_13 unsigned>> 16)
# asm 1: and >bits_13=int32#3,<x_14_15=int32#8,<x_12_13=int32#7,LSR #16
# asm 2: and >bits_13=r2,<x_14_15=r7,<x_12_13=r6,LSR #16
and r2,r7,r6,LSR #16

# qhasm:     bits_13 ^= (x_14_15 unsigned>> 16)
# asm 1: eor >bits_13=int32#5,<bits_13=int32#3,<x_14_15=int32#8,LSR #16
# asm 2: eor >bits_13=r4,<bits_13=r2,<x_14_15=r7,LSR #16
eor r4,r2,r7,LSR #16

# qhasm:     mem16[input_0 + 26] = bits_13
# asm 1: strh <bits_13=int32#5,[<input_0=int32#1,#26]
# asm 2: strh <bits_13=r4,[<input_0=r0,#26]
strh r4,[r0,#26]

# qhasm:     bits_14 = bits_12 & bits_13
# asm 1: and >bits_14=int32#2,<bits_12=int32#2,<bits_13=int32#5
# asm 2: and >bits_14=r1,<bits_12=r1,<bits_13=r4
and r1,r1,r4

# qhasm:     bits_14 ^= x_12_13
# asm 1: eor >bits_14=int32#9,<bits_14=int32#2,<x_12_13=int32#7
# asm 2: eor >bits_14=r8,<bits_14=r1,<x_12_13=r6
eor r8,r1,r6

# qhasm:     mem16[input_0 + 28] = bits_14
# asm 1: strh <bits_14=int32#9,[<input_0=int32#1,#28]
# asm 2: strh <bits_14=r8,[<input_0=r0,#28]
strh r8,[r0,#28]

# qhasm:     assign r1 r2 r3 to x_0_1 x_2_3 x_4_5 = mem96[input_0]
# asm 1: ldm <input_0=int32#1, {>x_0_1=int32#2,>x_2_3=int32#3,>x_4_5=int32#4}
# asm 2: ldm <input_0=r0, {>x_0_1=r1,>x_2_3=r2,>x_4_5=r3}
ldm r0, {r1,r2,r3}

# qhasm:     bits_15 = bits_13 & bits_14
# asm 1: and >bits_15=int32#5,<bits_13=int32#5,<bits_14=int32#9
# asm 2: and >bits_15=r4,<bits_13=r4,<bits_14=r8
and r4,r4,r8

# qhasm:     bits_15 ^= (x_12_13 unsigned>> 16)
# asm 1: eor >bits_15=int32#5,<bits_15=int32#5,<x_12_13=int32#7,LSR #16
# asm 2: eor >bits_15=r4,<bits_15=r4,<x_12_13=r6,LSR #16
eor r4,r4,r6,LSR #16

# qhasm:     mem16[input_0 + 30] = bits_15
# asm 1: strh <bits_15=int32#5,[<input_0=int32#1,#30]
# asm 2: strh <bits_15=r4,[<input_0=r0,#30]
strh r4,[r0,#30]

# qhasm:     assign r6 r7 to x_8_9 x_10_11 = mem64[input_0 + 16]
# asm 1: ldrd >x_8_9=int32#7,[<input_0=int32#1,#16]
# asm 2: ldrd >x_8_9=r6,[<input_0=r0,#16]
ldrd r6,[r0,#16]

# qhasm:     assign r4 r5 to x_12_13 x_14_15 = mem64[input_0 + 24]
# asm 1: ldrd >x_12_13=int32#5,[<input_0=int32#1,#24]
# asm 2: ldrd >x_12_13=r4,[<input_0=r0,#24]
ldrd r4,[r0,#24]

# qhasm:     t1 = x_0_1 ^ x_4_5
# asm 1: eor >t1=int32#10,<x_0_1=int32#2,<x_4_5=int32#4
# asm 2: eor >t1=r9,<x_0_1=r1,<x_4_5=r3
eor r9,r1,r3

# qhasm:     t3 = t1 ^ bits_14
# asm 1: eor >t3=int32#9,<t1=int32#10,<bits_14=int32#9
# asm 2: eor >t3=r8,<t1=r9,<bits_14=r8
eor r8,r9,r8

# qhasm:     t5shifted = x_8_9 ^ x_4_5
# asm 1: eor >t5shifted=int32#11,<x_8_9=int32#7,<x_4_5=int32#4
# asm 2: eor >t5shifted=r10,<x_8_9=r6,<x_4_5=r3
eor r10,r6,r3

# qhasm:     y14 = t3 ^ (t5shifted unsigned>> 16)
# asm 1: eor >y14=int32#12,<t3=int32#9,<t5shifted=int32#11,LSR #16
# asm 2: eor >y14=r11,<t3=r8,<t5shifted=r10,LSR #16
eor r11,r8,r10,LSR #16

# qhasm:     mem16[input_0 + 34] = y14
# asm 1: strh <y14=int32#12,[<input_0=int32#1,#34]
# asm 2: strh <y14=r11,[<input_0=r0,#34]
strh r11,[r0,#34]

# qhasm:     t12 = x_10_11 ^ t3
# asm 1: eor >t12=int32#9,<x_10_11=int32#8,<t3=int32#9
# asm 2: eor >t12=r8,<x_10_11=r7,<t3=r8
eor r8,r7,r8

# qhasm:     t2 = x_12_13 ^ x_8_9
# asm 1: eor >t2=int32#12,<x_12_13=int32#5,<x_8_9=int32#7
# asm 2: eor >t2=r11,<x_12_13=r4,<x_8_9=r6
eor r11,r4,r6

# qhasm:     mem16[input_0 + 32] = t2
# asm 1: strh <t2=int32#12,[<input_0=int32#1,#32]
# asm 2: strh <t2=r11,[<input_0=r0,#32]
strh r11,[r0,#32]

# qhasm:     t4 = t2 ^ x_2_3
# asm 1: eor >t4=int32#12,<t2=int32#12,<x_2_3=int32#3
# asm 2: eor >t4=r11,<t2=r11,<x_2_3=r2
eor r11,r11,r2

# qhasm:     x_6_7 = mem32[input_0 + 12]
# asm 1: ldr >x_6_7=int32#13,[<input_0=int32#1,#12]
# asm 2: ldr >x_6_7=r12,[<input_0=r0,#12]
ldr r12,[r0,#12]

# qhasm:     y2 = t4 ^ (t5shifted unsigned>> 16)
# asm 1: eor >y2=int32#14,<t4=int32#12,<t5shifted=int32#11,LSR #16
# asm 2: eor >y2=r13,<t4=r11,<t5shifted=r10,LSR #16
eor r13,r11,r10,LSR #16

# qhasm:     mem16[input_0 + 4] = y2
# asm 1: strh <y2=int32#14,[<input_0=int32#1,#4]
# asm 2: strh <y2=r13,[<input_0=r0,#4]
strh r13,[r0,#4]

# qhasm:     t10shifted = x_0_1 ^ x_10_11
# asm 1: eor >t10shifted=int32#14,<x_0_1=int32#2,<x_10_11=int32#8
# asm 2: eor >t10shifted=r13,<x_0_1=r1,<x_10_11=r7
eor r13,r1,r7

# qhasm:     t14 = x_6_7 ^ t4
# asm 1: eor >t14=int32#12,<x_6_7=int32#13,<t4=int32#12
# asm 2: eor >t14=r11,<x_6_7=r12,<t4=r11
eor r11,r12,r11

# qhasm:     t19 = x_4_5 ^ (t10shifted unsigned>> 16)
# asm 1: eor >t19=int32#4,<x_4_5=int32#4,<t10shifted=int32#14,LSR #16
# asm 2: eor >t19=r3,<x_4_5=r3,<t10shifted=r13,LSR #16
eor r3,r3,r13,LSR #16

# qhasm:     t11 = x_12_13 ^ (x_14_15 unsigned>> 16)
# asm 1: eor >t11=int32#13,<x_12_13=int32#5,<x_14_15=int32#6,LSR #16
# asm 2: eor >t11=r12,<x_12_13=r4,<x_14_15=r5,LSR #16
eor r12,r4,r5,LSR #16

# qhasm:     y1 = t19 ^ t11
# asm 1: eor >y1=int32#4,<t19=int32#4,<t11=int32#13
# asm 2: eor >y1=r3,<t19=r3,<t11=r12
eor r3,r3,r12

# qhasm:     mem16[input_0 + 48] = t11
# asm 1: strh <t11=int32#13,[<input_0=int32#1,#48]
# asm 2: strh <t11=r12,[<input_0=r0,#48]
strh r12,[r0,#48]

# qhasm:     mem16[input_0 + 2] = y1
# asm 1: strh <y1=int32#4,[<input_0=int32#1,#2]
# asm 2: strh <y1=r3,[<input_0=r0,#2]
strh r3,[r0,#2]

# qhasm:     t21 = t12 ^ (x_2_3 unsigned>> 16)
# asm 1: eor >t21=int32#4,<t12=int32#9,<x_2_3=int32#3,LSR #16
# asm 2: eor >t21=r3,<t12=r8,<x_2_3=r2,LSR #16
eor r3,r8,r2,LSR #16

# qhasm:     t13 = x_8_9 ^ (x_10_11 unsigned>> 16)
# asm 1: eor >t13=int32#13,<x_8_9=int32#7,<x_10_11=int32#8,LSR #16
# asm 2: eor >t13=r12,<x_8_9=r6,<x_10_11=r7,LSR #16
eor r12,r6,r7,LSR #16

# qhasm:     y4 = t13 ^ t21
# asm 1: eor >y4=int32#4,<t13=int32#13,<t21=int32#4
# asm 2: eor >y4=r3,<t13=r12,<t21=r3
eor r3,r12,r3

# qhasm:     mem16[input_0 + 36] = y4
# asm 1: strh <y4=int32#4,[<input_0=int32#1,#36]
# asm 2: strh <y4=r3,[<input_0=r0,#36]
strh r3,[r0,#36]

# qhasm:     t6shifted = x_0_1 ^ x_12_13
# asm 1: eor >t6shifted=int32#4,<x_0_1=int32#2,<x_12_13=int32#5
# asm 2: eor >t6shifted=r3,<x_0_1=r1,<x_12_13=r4
eor r3,r1,r4

# qhasm:     t22 = x_10_11 ^ (t6shifted unsigned>> 16)
# asm 1: eor >t22=int32#4,<x_10_11=int32#8,<t6shifted=int32#4,LSR #16
# asm 2: eor >t22=r3,<x_10_11=r7,<t6shifted=r3,LSR #16
eor r3,r7,r3,LSR #16

# qhasm:     y10 = t1 ^ t22
# asm 1: eor >y10=int32#8,<t1=int32#10,<t22=int32#4
# asm 2: eor >y10=r7,<t1=r9,<t22=r3
eor r7,r9,r3

# qhasm:     mem16[input_0 + 38] = y10
# asm 1: strh <y10=int32#8,[<input_0=int32#1,#38]
# asm 2: strh <y10=r7,[<input_0=r0,#38]
strh r7,[r0,#38]

# qhasm:     x_6_7 = mem32[input_0 + 12]
# asm 1: ldr >x_6_7=int32#8,[<input_0=int32#1,#12]
# asm 2: ldr >x_6_7=r7,[<input_0=r0,#12]
ldr r7,[r0,#12]

# qhasm:     t9 = x_2_3 ^ x_14_15
# asm 1: eor >t9=int32#10,<x_2_3=int32#3,<x_14_15=int32#6
# asm 2: eor >t9=r9,<x_2_3=r2,<x_14_15=r5
eor r9,r2,r5

# qhasm:     t23 = t9 ^ (x_8_9 unsigned>> 16)
# asm 1: eor >t23=int32#10,<t9=int32#10,<x_8_9=int32#7,LSR #16
# asm 2: eor >t23=r9,<t9=r9,<x_8_9=r6,LSR #16
eor r9,r9,r6,LSR #16

# qhasm:     t8shifted = x_6_7 ^ x_12_13
# asm 1: eor >t8shifted=int32#15,<x_6_7=int32#8,<x_12_13=int32#5
# asm 2: eor >t8shifted=r14,<x_6_7=r7,<x_12_13=r4
eor r14,r7,r4

# qhasm:     mem32[input_0 + 44] = t8shifted 
# asm 1: str <t8shifted=int32#15,[<input_0=int32#1,#44]
# asm 2: str <t8shifted=r14,[<input_0=r0,#44]
str r14,[r0,#44]

# qhasm:     y7 = t23 ^ (t8shifted unsigned>> 16)
# asm 1: eor >y7=int32#15,<t23=int32#10,<t8shifted=int32#15,LSR #16
# asm 2: eor >y7=r14,<t23=r9,<t8shifted=r14,LSR #16
eor r14,r9,r14,LSR #16

# qhasm:     mem16[input_0 + 14] = y7
# asm 1: strh <y7=int32#15,[<input_0=int32#1,#14]
# asm 2: strh <y7=r14,[<input_0=r0,#14]
strh r14,[r0,#14]

# qhasm:     t24 = t23 ^ (t10shifted unsigned>> 16)
# asm 1: eor >t24=int32#10,<t23=int32#10,<t10shifted=int32#14,LSR #16
# asm 2: eor >t24=r9,<t23=r9,<t10shifted=r13,LSR #16
eor r9,r9,r13,LSR #16

# qhasm:     x_4_5 = mem32[input_0 + 8] 
# asm 1: ldr >x_4_5=int32#14,[<input_0=int32#1,#8]
# asm 2: ldr >x_4_5=r13,[<input_0=r0,#8]
ldr r13,[r0,#8]

# qhasm:     y11 = t24 ^ (t5shifted unsigned>> 16)
# asm 1: eor >y11=int32#10,<t24=int32#10,<t5shifted=int32#11,LSR #16
# asm 2: eor >y11=r9,<t24=r9,<t5shifted=r10,LSR #16
eor r9,r9,r10,LSR #16

# qhasm:     t25 = x_0_1 ^ t13
# asm 1: eor >t25=int32#11,<x_0_1=int32#2,<t13=int32#13
# asm 2: eor >t25=r10,<x_0_1=r1,<t13=r12
eor r10,r1,r12

# qhasm:     t15shifted = x_4_5 ^ x_14_15
# asm 1: eor >t15shifted=int32#13,<x_4_5=int32#14,<x_14_15=int32#6
# asm 2: eor >t15shifted=r12,<x_4_5=r13,<x_14_15=r5
eor r12,r13,r5

# qhasm:     mem16[input_0 + 40] = y11
# asm 1: strh <y11=int32#10,[<input_0=int32#1,#40]
# asm 2: strh <y11=r9,[<input_0=r0,#40]
strh r9,[r0,#40]

# qhasm:     y5 = t25 ^ (t15shifted unsigned>> 16)
# asm 1: eor >y5=int32#10,<t25=int32#11,<t15shifted=int32#13,LSR #16
# asm 2: eor >y5=r9,<t25=r10,<t15shifted=r12,LSR #16
eor r9,r10,r12,LSR #16

# qhasm:     t17shifted = x_2_3 ^ x_8_9
# asm 1: eor >t17shifted=int32#11,<x_2_3=int32#3,<x_8_9=int32#7
# asm 2: eor >t17shifted=r10,<x_2_3=r2,<x_8_9=r6
eor r10,r2,r6

# qhasm:     mem16[input_0 + 10] = y5
# asm 1: strh <y5=int32#10,[<input_0=int32#1,#10]
# asm 2: strh <y5=r9,[<input_0=r0,#10]
strh r9,[r0,#10]

# qhasm:     t26 = x_12_13 ^ (t17shifted unsigned>> 16)
# asm 1: eor >t26=int32#10,<x_12_13=int32#5,<t17shifted=int32#11,LSR #16
# asm 2: eor >t26=r9,<x_12_13=r4,<t17shifted=r10,LSR #16
eor r9,r4,r10,LSR #16

# qhasm:     t18 = x_4_5 ^ (x_6_7 unsigned>> 16)
# asm 1: eor >t18=int32#14,<x_4_5=int32#14,<x_6_7=int32#8,LSR #16
# asm 2: eor >t18=r13,<x_4_5=r13,<x_6_7=r7,LSR #16
eor r13,r13,r7,LSR #16

# qhasm:     y9 = t18 ^ t26
# asm 1: eor >y9=int32#10,<t18=int32#14,<t26=int32#10
# asm 2: eor >y9=r9,<t18=r13,<t26=r9
eor r9,r13,r9

# qhasm:     mem16[input_0 + 44] = t18
# asm 1: strh <t18=int32#14,[<input_0=int32#1,#44]
# asm 2: strh <t18=r13,[<input_0=r0,#44]
strh r13,[r0,#44]

# qhasm:     mem16[input_0 + 18] = y9
# asm 1: strh <y9=int32#10,[<input_0=int32#1,#18]
# asm 2: strh <y9=r9,[<input_0=r0,#18]
strh r9,[r0,#18]

# qhasm:     t2 = mem16[input_0 + 32]
# asm 1: ldrh >t2=int32#10,[<input_0=int32#1,#32]
# asm 2: ldrh >t2=r9,[<input_0=r0,#32]
ldrh r9,[r0,#32]

# qhasm:     x_10_11 = mem32[input_0 + 20]
# asm 1: ldr >x_10_11=int32#14,[<input_0=int32#1,#20]
# asm 2: ldr >x_10_11=r13,[<input_0=r0,#20]
ldr r13,[r0,#20]

# qhasm:     t8_t11 = mem32[input_0 + 46]
# asm 1: ldr >t8_t11=int32#15,[<input_0=int32#1,#46]
# asm 2: ldr >t8_t11=r14,[<input_0=r0,#46]
ldr r14,[r0,#46]

# qhasm:     t27 = t2 ^ t22
# asm 1: eor >t27=int32#4,<t2=int32#10,<t22=int32#4
# asm 2: eor >t27=r3,<t2=r9,<t22=r3
eor r3,r9,r3

# qhasm:     t16 = x_6_7 ^ x_10_11
# asm 1: eor >t16=int32#10,<x_6_7=int32#8,<x_10_11=int32#14
# asm 2: eor >t16=r9,<x_6_7=r7,<x_10_11=r13
eor r9,r7,r13

# qhasm:     t28shifted = t8_t11 ^ x_6_7
# asm 1: eor >t28shifted=int32#8,<t8_t11=int32#15,<x_6_7=int32#8
# asm 2: eor >t28shifted=r7,<t8_t11=r14,<x_6_7=r7
eor r7,r14,r7

# qhasm:     y6 = t16 ^ t27
# asm 1: eor >y6=int32#4,<t16=int32#10,<t27=int32#4
# asm 2: eor >y6=r3,<t16=r9,<t27=r3
eor r3,r9,r3

# qhasm:     y0 = t12 ^ (t28shifted unsigned>> 16)
# asm 1: eor >y0=int32#8,<t12=int32#9,<t28shifted=int32#8,LSR #16
# asm 2: eor >y0=r7,<t12=r8,<t28shifted=r7,LSR #16
eor r7,r8,r7,LSR #16

# qhasm:     mem16[input_0 + 0] = y0
# asm 1: strh <y0=int32#8,[<input_0=int32#1,#0]
# asm 2: strh <y0=r7,[<input_0=r0,#0]
strh r7,[r0,#0]

# qhasm:     t30 = x_8_9 ^ t8_t11
# asm 1: eor >t30=int32#7,<x_8_9=int32#7,<t8_t11=int32#15
# asm 2: eor >t30=r6,<x_8_9=r6,<t8_t11=r14
eor r6,r6,r14

# qhasm:     t7 = x_0_1 ^ (x_2_3 unsigned>> 16)
# asm 1: eor >t7=int32#3,<x_0_1=int32#2,<x_2_3=int32#3,LSR #16
# asm 2: eor >t7=r2,<x_0_1=r1,<x_2_3=r2,LSR #16
eor r2,r1,r2,LSR #16

# qhasm:     y13 = t7 ^ t30
# asm 1: eor >y13=int32#7,<t7=int32#3,<t30=int32#7
# asm 2: eor >y13=r6,<t7=r2,<t30=r6
eor r6,r2,r6

# qhasm:     t31shifted = t17shifted ^ x_12_13
# asm 1: eor >t31shifted=int32#5,<t17shifted=int32#11,<x_12_13=int32#5
# asm 2: eor >t31shifted=r4,<t17shifted=r10,<x_12_13=r4
eor r4,r10,r4

# qhasm:     y3 = t16 ^ (t31shifted unsigned>> 16)
# asm 1: eor >y3=int32#5,<t16=int32#10,<t31shifted=int32#5,LSR #16
# asm 2: eor >y3=r4,<t16=r9,<t31shifted=r4,LSR #16
eor r4,r9,r4,LSR #16

# qhasm:     mem16[input_0 + 6] = y3
# asm 1: strh <y3=int32#5,[<input_0=int32#1,#6]
# asm 2: strh <y3=r4,[<input_0=r0,#6]
strh r4,[r0,#6]

# qhasm:     t32 = t16 ^ (x_0_1 unsigned>> 16)
# asm 1: eor >t32=int32#2,<t16=int32#10,<x_0_1=int32#2,LSR #16
# asm 2: eor >t32=r1,<t16=r9,<x_0_1=r1,LSR #16
eor r1,r9,r1,LSR #16

# qhasm:     y15 = t32 ^ (t15shifted unsigned>> 16)
# asm 1: eor >y15=int32#2,<t32=int32#2,<t15shifted=int32#13,LSR #16
# asm 2: eor >y15=r1,<t32=r1,<t15shifted=r12,LSR #16
eor r1,r1,r12,LSR #16

# qhasm:     t18 = mem16[input_0 + 44]
# asm 1: ldrh >t18=int32#5,[<input_0=int32#1,#44]
# asm 2: ldrh >t18=r4,[<input_0=r0,#44]
ldrh r4,[r0,#44]

# qhasm:     t33 = t14 ^ (x_14_15 unsigned>> 16)
# asm 1: eor >t33=int32#6,<t14=int32#12,<x_14_15=int32#6,LSR #16
# asm 2: eor >t33=r5,<t14=r11,<x_14_15=r5,LSR #16
eor r5,r11,r5,LSR #16

# qhasm:     y8 = t18 ^ t33
# asm 1: eor >y8=int32#5,<t18=int32#5,<t33=int32#6
# asm 2: eor >y8=r4,<t18=r4,<t33=r5
eor r4,r4,r5

# qhasm:     t34 = t14 ^ (x_10_11 unsigned>> 16)
# asm 1: eor >t34=int32#6,<t14=int32#12,<x_10_11=int32#14,LSR #16
# asm 2: eor >t34=r5,<t14=r11,<x_10_11=r13,LSR #16
eor r5,r11,r13,LSR #16

# qhasm:     y12 = t34 ^ t7
# asm 1: eor >y12=int32#3,<t34=int32#6,<t7=int32#3
# asm 2: eor >y12=r2,<t34=r5,<t7=r2
eor r2,r5,r2

# qhasm:     x = 0xffff
# asm 1: ldr >x=int32#6,=0xffff
# asm 2: ldr >x=r5,=0xffff
ldr r5,=0xffff

# qhasm:     x_1_0 = mem16[input_0 + 36]
# asm 1: ldrh >x_1_0=int32#8,[<input_0=int32#1,#36]
# asm 2: ldrh >x_1_0=r7,[<input_0=r0,#36]
ldrh r7,[r0,#36]

# qhasm:     x_1_1 = mem16[input_0 + 10]
# asm 1: ldrh >x_1_1=int32#9,[<input_0=int32#1,#10]
# asm 2: ldrh >x_1_1=r8,[<input_0=r0,#10]
ldrh r8,[r0,#10]

# qhasm:     x_1_2 = y6 & x
# asm 1: and >x_1_2=int32#4,<y6=int32#4,<x=int32#6
# asm 2: and >x_1_2=r3,<y6=r3,<x=r5
and r3,r3,r5

# qhasm:     x_1_3 = mem16[input_0 + 14]
# asm 1: ldrh >x_1_3=int32#10,[<input_0=int32#1,#14]
# asm 2: ldrh >x_1_3=r9,[<input_0=r0,#14]
ldrh r9,[r0,#14]

# qhasm:     x_1_0 |= (x_1_0 << 16)
# asm 1: orr >x_1_0=int32#8,<x_1_0=int32#8,<x_1_0=int32#8,LSL #16
# asm 2: orr >x_1_0=r7,<x_1_0=r7,<x_1_0=r7,LSL #16
orr r7,r7,r7,LSL #16

# qhasm:     x_1_1 |= (x_1_1 << 16)
# asm 1: orr >x_1_1=int32#9,<x_1_1=int32#9,<x_1_1=int32#9,LSL #16
# asm 2: orr >x_1_1=r8,<x_1_1=r8,<x_1_1=r8,LSL #16
orr r8,r8,r8,LSL #16

# qhasm:     x_1_2 |= (x_1_2 << 16)
# asm 1: orr >x_1_2=int32#4,<x_1_2=int32#4,<x_1_2=int32#4,LSL #16
# asm 2: orr >x_1_2=r3,<x_1_2=r3,<x_1_2=r3,LSL #16
orr r3,r3,r3,LSL #16

# qhasm:     x_1_3 |= (x_1_3 << 16)
# asm 1: orr >x_1_3=int32#10,<x_1_3=int32#10,<x_1_3=int32#10,LSL #16
# asm 2: orr >x_1_3=r9,<x_1_3=r9,<x_1_3=r9,LSL #16
orr r9,r9,r9,LSL #16

# qhasm:     x_1_0 >>>= 2
# asm 1: mov >x_1_0=int32#8,<x_1_0=int32#8,ROR #2
# asm 2: mov >x_1_0=r7,<x_1_0=r7,ROR #2
mov r7,r7,ROR #2

# qhasm:     x_1_1 >>>= 2
# asm 1: mov >x_1_1=int32#9,<x_1_1=int32#9,ROR #2
# asm 2: mov >x_1_1=r8,<x_1_1=r8,ROR #2
mov r8,r8,ROR #2

# qhasm:     x_1_2 >>>= 2
# asm 1: mov >x_1_2=int32#11,<x_1_2=int32#4,ROR #2
# asm 2: mov >x_1_2=r10,<x_1_2=r3,ROR #2
mov r10,r3,ROR #2

# qhasm:     x_1_3 >>>= 2
# asm 1: mov >x_1_3=int32#10,<x_1_3=int32#10,ROR #2
# asm 2: mov >x_1_3=r9,<x_1_3=r9,ROR #2
mov r9,r9,ROR #2

# qhasm:     x_2_0 = y8 & x
# asm 1: and >x_2_0=int32#4,<y8=int32#5,<x=int32#6
# asm 2: and >x_2_0=r3,<y8=r4,<x=r5
and r3,r4,r5

# qhasm:     x_2_1 = mem16[input_0 + 18]
# asm 1: ldrh >x_2_1=int32#5,[<input_0=int32#1,#18]
# asm 2: ldrh >x_2_1=r4,[<input_0=r0,#18]
ldrh r4,[r0,#18]

# qhasm:     x_2_2 = mem16[input_0 + 38]
# asm 1: ldrh >x_2_2=int32#12,[<input_0=int32#1,#38]
# asm 2: ldrh >x_2_2=r11,[<input_0=r0,#38]
ldrh r11,[r0,#38]

# qhasm:     mx_2_3 = mem16[input_0 + 40] 
# asm 1: ldrh >mx_2_3=int32#13,[<input_0=int32#1,#40]
# asm 2: ldrh >mx_2_3=r12,[<input_0=r0,#40]
ldrh r12,[r0,#40]

# qhasm:     x_2_0 |= (x_2_0 << 16)
# asm 1: orr >x_2_0=int32#4,<x_2_0=int32#4,<x_2_0=int32#4,LSL #16
# asm 2: orr >x_2_0=r3,<x_2_0=r3,<x_2_0=r3,LSL #16
orr r3,r3,r3,LSL #16

# qhasm:     x_2_1 |= (x_2_1 << 16)
# asm 1: orr >x_2_1=int32#5,<x_2_1=int32#5,<x_2_1=int32#5,LSL #16
# asm 2: orr >x_2_1=r4,<x_2_1=r4,<x_2_1=r4,LSL #16
orr r4,r4,r4,LSL #16

# qhasm:     x_2_2 |= (x_2_2 << 16)
# asm 1: orr >x_2_2=int32#12,<x_2_2=int32#12,<x_2_2=int32#12,LSL #16
# asm 2: orr >x_2_2=r11,<x_2_2=r11,<x_2_2=r11,LSL #16
orr r11,r11,r11,LSL #16

# qhasm:     mx_2_3 |= (mx_2_3 << 16)
# asm 1: orr >mx_2_3=int32#13,<mx_2_3=int32#13,<mx_2_3=int32#13,LSL #16
# asm 2: orr >mx_2_3=r12,<mx_2_3=r12,<mx_2_3=r12,LSL #16
orr r12,r12,r12,LSL #16

# qhasm:     x_2_0 >>>= 4
# asm 1: mov >x_2_0=int32#14,<x_2_0=int32#4,ROR #4
# asm 2: mov >x_2_0=r13,<x_2_0=r3,ROR #4
mov r13,r3,ROR #4

# qhasm:     x_2_1 >>>= 4
# asm 1: mov >x_2_1=int32#5,<x_2_1=int32#5,ROR #4
# asm 2: mov >x_2_1=r4,<x_2_1=r4,ROR #4
mov r4,r4,ROR #4

# qhasm:     x_2_2 >>>= 4
# asm 1: mov >x_2_2=int32#12,<x_2_2=int32#12,ROR #4
# asm 2: mov >x_2_2=r11,<x_2_2=r11,ROR #4
mov r11,r11,ROR #4

# qhasm:     mx_2_3 >>>= 4
# asm 1: mov >mx_2_3=int32#13,<mx_2_3=int32#13,ROR #4
# asm 2: mov >mx_2_3=r12,<mx_2_3=r12,ROR #4
mov r12,r12,ROR #4

# qhasm:     x_3_0 = y12 & x
# asm 1: and >x_3_0=int32#3,<y12=int32#3,<x=int32#6
# asm 2: and >x_3_0=r2,<y12=r2,<x=r5
and r2,r2,r5

# qhasm:     x_3_1 = y13 & x
# asm 1: and >x_3_1=int32#4,<y13=int32#7,<x=int32#6
# asm 2: and >x_3_1=r3,<y13=r6,<x=r5
and r3,r6,r5

# qhasm:     x_3_2 = mem16[input_0 + 34]
# asm 1: ldrh >x_3_2=int32#7,[<input_0=int32#1,#34]
# asm 2: ldrh >x_3_2=r6,[<input_0=r0,#34]
ldrh r6,[r0,#34]

# qhasm:     x_3_3 = y15 & x
# asm 1: and >x_3_3=int32#2,<y15=int32#2,<x=int32#6
# asm 2: and >x_3_3=r1,<y15=r1,<x=r5
and r1,r1,r5

# qhasm:     x_3_0 |= (x_3_0 << 16)
# asm 1: orr >x_3_0=int32#3,<x_3_0=int32#3,<x_3_0=int32#3,LSL #16
# asm 2: orr >x_3_0=r2,<x_3_0=r2,<x_3_0=r2,LSL #16
orr r2,r2,r2,LSL #16

# qhasm:     x_3_1 |= (x_3_1 << 16)
# asm 1: orr >x_3_1=int32#4,<x_3_1=int32#4,<x_3_1=int32#4,LSL #16
# asm 2: orr >x_3_1=r3,<x_3_1=r3,<x_3_1=r3,LSL #16
orr r3,r3,r3,LSL #16

# qhasm:     x_3_2 |= (x_3_2 << 16)
# asm 1: orr >x_3_2=int32#6,<x_3_2=int32#7,<x_3_2=int32#7,LSL #16
# asm 2: orr >x_3_2=r5,<x_3_2=r6,<x_3_2=r6,LSL #16
orr r5,r6,r6,LSL #16

# qhasm:     x_3_3 |= (x_3_3 << 16)
# asm 1: orr >x_3_3=int32#2,<x_3_3=int32#2,<x_3_3=int32#2,LSL #16
# asm 2: orr >x_3_3=r1,<x_3_3=r1,<x_3_3=r1,LSL #16
orr r1,r1,r1,LSL #16

# qhasm:     x_3_0 >>>= 6
# asm 1: mov >x_3_0=int32#3,<x_3_0=int32#3,ROR #6
# asm 2: mov >x_3_0=r2,<x_3_0=r2,ROR #6
mov r2,r2,ROR #6

# qhasm:     x_3_1 >>>= 6
# asm 1: mov >x_3_1=int32#7,<x_3_1=int32#4,ROR #6
# asm 2: mov >x_3_1=r6,<x_3_1=r3,ROR #6
mov r6,r3,ROR #6

# qhasm:     x_3_2 >>>= 6
# asm 1: mov >x_3_2=int32#4,<x_3_2=int32#6,ROR #6
# asm 2: mov >x_3_2=r3,<x_3_2=r5,ROR #6
mov r3,r5,ROR #6

# qhasm:     x_3_3 >>>= 6
# asm 1: mov >x_3_3=int32#2,<x_3_3=int32#2,ROR #6
# asm 2: mov >x_3_3=r1,<x_3_3=r1,ROR #6
mov r1,r1,ROR #6

# qhasm:     mem16[input_0 + 24] = x_3_0
# asm 1: strh <x_3_0=int32#3,[<input_0=int32#1,#24]
# asm 2: strh <x_3_0=r2,[<input_0=r0,#24]
strh r2,[r0,#24]

# qhasm:     mem16[input_0 + 28] = x_3_2
# asm 1: strh <x_3_2=int32#4,[<input_0=int32#1,#28]
# asm 2: strh <x_3_2=r3,[<input_0=r0,#28]
strh r3,[r0,#28]

# qhasm:     mem16[input_0 + 30] = x_3_3
# asm 1: strh <x_3_3=int32#2,[<input_0=int32#1,#30]
# asm 2: strh <x_3_3=r1,[<input_0=r0,#30]
strh r1,[r0,#30]

# qhasm:     roundcounter = mem16[input_0 + 92]
# asm 1: ldrh >roundcounter=int32#2,[<input_0=int32#1,#92]
# asm 2: ldrh >roundcounter=r1,[<input_0=r0,#92]
ldrh r1,[r0,#92]

# qhasm:     assign r2 r3 to x_0_1 x_2_3 = mem64[input_0 + 0]
# asm 1: ldrd >x_0_1=int32#3,[<input_0=int32#1,#0]
# asm 2: ldrd >x_0_1=r2,[<input_0=r0,#0]
ldrd r2,[r0,#0]

# qhasm:     c1 = 0x75817581
# asm 1: ldr >c1=int32#6,=0x75817581
# asm 2: ldr >c1=r5,=0x75817581
ldr r5,=0x75817581

# qhasm:     c2 = 0x658b658b 
# asm 1: ldr >c2=int32#15,=0x658b658b
# asm 2: ldr >c2=r14,=0x658b658b
ldr r14,=0x658b658b

# qhasm:     c1 >>>= roundcounter
# asm 1: ror >c1=int32#6,<c1=int32#6,<roundcounter=int32#2
# asm 2: ror >c1=r5,<c1=r5,<roundcounter=r1
ror r5,r5,r1

# qhasm:     c2 >>>= roundcounter
# asm 1: ror >c2=int32#2,<c2=int32#15,<roundcounter=int32#2
# asm 2: ror >c2=r1,<c2=r14,<roundcounter=r1
ror r1,r14,r1

# qhasm:     y = c2 ^ (x_0_1 unsigned>> 16)
# asm 1: eor >y=int32#15,<c2=int32#2,<x_0_1=int32#3,LSR #16
# asm 2: eor >y=r14,<c2=r1,<x_0_1=r2,LSR #16
eor r14,r1,r2,LSR #16

# qhasm:     x_0_1 ^= c1
# asm 1: eor >x_0_1=int32#3,<x_0_1=int32#3,<c1=int32#6
# asm 2: eor >x_0_1=r2,<x_0_1=r2,<c1=r5
eor r2,r2,r5

# qhasm:     c2 >>>= 30
# asm 1: mov >c2=int32#2,<c2=int32#2,ROR #30
# asm 2: mov >c2=r1,<c2=r1,ROR #30
mov r1,r1,ROR #30

# qhasm:     mem16[input_0 + 0] = x_0_1
# asm 1: strh <x_0_1=int32#3,[<input_0=int32#1,#0]
# asm 2: strh <x_0_1=r2,[<input_0=r0,#0]
strh r2,[r0,#0]

# qhasm:     mem16[input_0 + 2] = y
# asm 1: strh <y=int32#15,[<input_0=int32#1,#2]
# asm 2: strh <y=r14,[<input_0=r0,#2]
strh r14,[r0,#2]

# qhasm:     y = c2 ^ (x_2_3 unsigned>> 16)
# asm 1: eor >y=int32#3,<c2=int32#2,<x_2_3=int32#4,LSR #16
# asm 2: eor >y=r2,<c2=r1,<x_2_3=r3,LSR #16
eor r2,r1,r3,LSR #16

# qhasm:     x_2_3 ^= (c1 >>> 30)
# asm 1: eor >x_2_3=int32#4,<x_2_3=int32#4,<c1=int32#6,ROR #30
# asm 2: eor >x_2_3=r3,<x_2_3=r3,<c1=r5,ROR #30
eor r3,r3,r5,ROR #30

# qhasm:     mem16[input_0 + 4] = x_2_3
# asm 1: strh <x_2_3=int32#4,[<input_0=int32#1,#4]
# asm 2: strh <x_2_3=r3,[<input_0=r0,#4]
strh r3,[r0,#4]

# qhasm:     mem16[input_0 + 6] = y
# asm 1: strh <y=int32#3,[<input_0=int32#1,#6]
# asm 2: strh <y=r2,[<input_0=r0,#6]
strh r2,[r0,#6]

# qhasm:     y = x_1_1 ^ (c2 >>> 30)
# asm 1: eor >y=int32#3,<x_1_1=int32#9,<c2=int32#2,ROR #30
# asm 2: eor >y=r2,<x_1_1=r8,<c2=r1,ROR #30
eor r2,r8,r1,ROR #30

# qhasm:     x_1_0 ^= (c1 >>> 28)
# asm 1: eor >x_1_0=int32#4,<x_1_0=int32#8,<c1=int32#6,ROR #28
# asm 2: eor >x_1_0=r3,<x_1_0=r7,<c1=r5,ROR #28
eor r3,r7,r5,ROR #28

# qhasm:     mem16[input_0 + 8] = x_1_0
# asm 1: strh <x_1_0=int32#4,[<input_0=int32#1,#8]
# asm 2: strh <x_1_0=r3,[<input_0=r0,#8]
strh r3,[r0,#8]

# qhasm:     mem16[input_0 + 10] = y
# asm 1: strh <y=int32#3,[<input_0=int32#1,#10]
# asm 2: strh <y=r2,[<input_0=r0,#10]
strh r2,[r0,#10]

# qhasm:     y = x_1_3 ^ (c2 >>> 28)
# asm 1: eor >y=int32#3,<x_1_3=int32#10,<c2=int32#2,ROR #28
# asm 2: eor >y=r2,<x_1_3=r9,<c2=r1,ROR #28
eor r2,r9,r1,ROR #28

# qhasm:     x = x_1_2 ^ (c1 >>> 26)
# asm 1: eor >x=int32#4,<x_1_2=int32#11,<c1=int32#6,ROR #26
# asm 2: eor >x=r3,<x_1_2=r10,<c1=r5,ROR #26
eor r3,r10,r5,ROR #26

# qhasm:     mem16[input_0 + 12] = x
# asm 1: strh <x=int32#4,[<input_0=int32#1,#12]
# asm 2: strh <x=r3,[<input_0=r0,#12]
strh r3,[r0,#12]

# qhasm:     mem16[input_0 + 14] = y
# asm 1: strh <y=int32#3,[<input_0=int32#1,#14]
# asm 2: strh <y=r2,[<input_0=r0,#14]
strh r2,[r0,#14]

# qhasm:     x_12_13 = mem32[input_0 + 24]
# asm 1: ldr >x_12_13=int32#3,[<input_0=int32#1,#24]
# asm 2: ldr >x_12_13=r2,[<input_0=r0,#24]
ldr r2,[r0,#24]

# qhasm:     x_14_15 = mem32[input_0 + 28]
# asm 1: ldr >x_14_15=int32#8,[<input_0=int32#1,#28]
# asm 2: ldr >x_14_15=r7,[<input_0=r0,#28]
ldr r7,[r0,#28]

# qhasm:     y = x_2_1 ^ (c2 >>> 26)
# asm 1: eor >y=int32#4,<x_2_1=int32#5,<c2=int32#2,ROR #26
# asm 2: eor >y=r3,<x_2_1=r4,<c2=r1,ROR #26
eor r3,r4,r1,ROR #26

# qhasm:     x = x_2_0 ^ (c1 >>> 24)
# asm 1: eor >x=int32#5,<x_2_0=int32#14,<c1=int32#6,ROR #24
# asm 2: eor >x=r4,<x_2_0=r13,<c1=r5,ROR #24
eor r4,r13,r5,ROR #24

# qhasm:     mem16[input_0 + 16] = x
# asm 1: strh <x=int32#5,[<input_0=int32#1,#16]
# asm 2: strh <x=r4,[<input_0=r0,#16]
strh r4,[r0,#16]

# qhasm:     mem16[input_0 + 18] = y
# asm 1: strh <y=int32#4,[<input_0=int32#1,#18]
# asm 2: strh <y=r3,[<input_0=r0,#18]
strh r3,[r0,#18]

# qhasm:     y = mx_2_3 ^ (c2 >>> 24)
# asm 1: eor >y=int32#4,<mx_2_3=int32#13,<c2=int32#2,ROR #24
# asm 2: eor >y=r3,<mx_2_3=r12,<c2=r1,ROR #24
eor r3,r12,r1,ROR #24

# qhasm:     x = x_2_2 ^ (c1 >>> 22)
# asm 1: eor >x=int32#5,<x_2_2=int32#12,<c1=int32#6,ROR #22
# asm 2: eor >x=r4,<x_2_2=r11,<c1=r5,ROR #22
eor r4,r11,r5,ROR #22

# qhasm:     mem16[input_0 + 20] = x
# asm 1: strh <x=int32#5,[<input_0=int32#1,#20]
# asm 2: strh <x=r4,[<input_0=r0,#20]
strh r4,[r0,#20]

# qhasm:     mem16[input_0 + 22] = y
# asm 1: strh <y=int32#4,[<input_0=int32#1,#22]
# asm 2: strh <y=r3,[<input_0=r0,#22]
strh r3,[r0,#22]

# qhasm:     y = x_3_1 ^ (c2 >>> 22)
# asm 1: eor >y=int32#4,<x_3_1=int32#7,<c2=int32#2,ROR #22
# asm 2: eor >y=r3,<x_3_1=r6,<c2=r1,ROR #22
eor r3,r6,r1,ROR #22

# qhasm:     x = x_12_13 ^ (c1 >>> 20)
# asm 1: eor >x=int32#3,<x_12_13=int32#3,<c1=int32#6,ROR #20
# asm 2: eor >x=r2,<x_12_13=r2,<c1=r5,ROR #20
eor r2,r2,r5,ROR #20

# qhasm:     c2 >>>= 20
# asm 1: mov >c2=int32#5,<c2=int32#2,ROR #20
# asm 2: mov >c2=r4,<c2=r1,ROR #20
mov r4,r1,ROR #20

# qhasm:     mem16[input_0 + 24] = x
# asm 1: strh <x=int32#3,[<input_0=int32#1,#24]
# asm 2: strh <x=r2,[<input_0=r0,#24]
strh r2,[r0,#24]

# qhasm:     mem16[input_0 + 26] = y
# asm 1: strh <y=int32#4,[<input_0=int32#1,#26]
# asm 2: strh <y=r3,[<input_0=r0,#26]
strh r3,[r0,#26]

# qhasm:     assign r1 r2 r3 r12 to x_0_1 x_2_3 x_4_5 x_6_7 = mem128[input_0]
# asm 1: ldm <input_0=int32#1, {>x_0_1=int32#2,>x_2_3=int32#3,>x_4_5=int32#4,>x_6_7=int32#13}
# asm 2: ldm <input_0=r0, {>x_0_1=r1,>x_2_3=r2,>x_4_5=r3,>x_6_7=r12}
ldm r0, {r1,r2,r3,r12}

# qhasm:     y = c2 ^ (x_14_15 unsigned>> 16)
# asm 1: eor >y=int32#5,<c2=int32#5,<x_14_15=int32#8,LSR #16
# asm 2: eor >y=r4,<c2=r4,<x_14_15=r7,LSR #16
eor r4,r4,r7,LSR #16

# qhasm:     x = x_14_15 ^ (c1 >>> 18)
# asm 1: eor >x=int32#6,<x_14_15=int32#8,<c1=int32#6,ROR #18
# asm 2: eor >x=r5,<x_14_15=r7,<c1=r5,ROR #18
eor r5,r7,r5,ROR #18

# qhasm:     mem16[input_0 + 28] = x
# asm 1: strh <x=int32#6,[<input_0=int32#1,#28]
# asm 2: strh <x=r5,[<input_0=r0,#28]
strh r5,[r0,#28]

# qhasm:     mem16[input_0 + 30] = y
# asm 1: strh <y=int32#5,[<input_0=int32#1,#30]
# asm 2: strh <y=r4,[<input_0=r0,#30]
strh r4,[r0,#30]

# qhasm:     bits_0 = x_0_1 & (x_0_1 unsigned>> 16)
# asm 1: and >bits_0=int32#5,<x_0_1=int32#2,<x_0_1=int32#2,LSR #16
# asm 2: and >bits_0=r4,<x_0_1=r1,<x_0_1=r1,LSR #16
and r4,r1,r1,LSR #16

# qhasm:     bits_0 ^= x_2_3
# asm 1: eor >bits_0=int32#5,<bits_0=int32#5,<x_2_3=int32#3
# asm 2: eor >bits_0=r4,<bits_0=r4,<x_2_3=r2
eor r4,r4,r2

# qhasm:     mem16[input_0] = bits_0; input_0 += 2
# asm 1: strh <bits_0=int32#5,[<input_0=int32#1],#2
# asm 2: strh <bits_0=r4,[<input_0=r0],#2
strh r4,[r0],#2

# qhasm:     bits_1 = x_2_3 & (x_0_1 unsigned>> 16)
# asm 1: and >bits_1=int32#6,<x_2_3=int32#3,<x_0_1=int32#2,LSR #16
# asm 2: and >bits_1=r5,<x_2_3=r2,<x_0_1=r1,LSR #16
and r5,r2,r1,LSR #16

# qhasm:     bits_1 ^= (x_2_3 unsigned>> 16)
# asm 1: eor >bits_1=int32#3,<bits_1=int32#6,<x_2_3=int32#3,LSR #16
# asm 2: eor >bits_1=r2,<bits_1=r5,<x_2_3=r2,LSR #16
eor r2,r5,r2,LSR #16

# qhasm:     mem16[input_0] = bits_1; input_0 += 2
# asm 1: strh <bits_1=int32#3,[<input_0=int32#1],#2
# asm 2: strh <bits_1=r2,[<input_0=r0],#2
strh r2,[r0],#2

# qhasm:     bits_2 = bits_0 & bits_1
# asm 1: and >bits_2=int32#5,<bits_0=int32#5,<bits_1=int32#3
# asm 2: and >bits_2=r4,<bits_0=r4,<bits_1=r2
and r4,r4,r2

# qhasm:     bits_2 ^= x_0_1
# asm 1: eor >bits_2=int32#5,<bits_2=int32#5,<x_0_1=int32#2
# asm 2: eor >bits_2=r4,<bits_2=r4,<x_0_1=r1
eor r4,r4,r1

# qhasm:     mem16[input_0] = bits_2; input_0 += 2
# asm 1: strh <bits_2=int32#5,[<input_0=int32#1],#2
# asm 2: strh <bits_2=r4,[<input_0=r0],#2
strh r4,[r0],#2

# qhasm:     bits_3 = bits_1 & bits_2
# asm 1: and >bits_3=int32#3,<bits_1=int32#3,<bits_2=int32#5
# asm 2: and >bits_3=r2,<bits_1=r2,<bits_2=r4
and r2,r2,r4

# qhasm:     bits_3 ^= (x_0_1 unsigned>> 16)
# asm 1: eor >bits_3=int32#2,<bits_3=int32#3,<x_0_1=int32#2,LSR #16
# asm 2: eor >bits_3=r1,<bits_3=r2,<x_0_1=r1,LSR #16
eor r1,r2,r1,LSR #16

# qhasm:     mem16[input_0] = bits_3; input_0 += 2
# asm 1: strh <bits_3=int32#2,[<input_0=int32#1],#2
# asm 2: strh <bits_3=r1,[<input_0=r0],#2
strh r1,[r0],#2

# qhasm:     bits_4 = x_4_5 & (x_4_5 unsigned>> 16)
# asm 1: and >bits_4=int32#2,<x_4_5=int32#4,<x_4_5=int32#4,LSR #16
# asm 2: and >bits_4=r1,<x_4_5=r3,<x_4_5=r3,LSR #16
and r1,r3,r3,LSR #16

# qhasm:     bits_4 ^= x_6_7
# asm 1: eor >bits_4=int32#2,<bits_4=int32#2,<x_6_7=int32#13
# asm 2: eor >bits_4=r1,<bits_4=r1,<x_6_7=r12
eor r1,r1,r12

# qhasm:     mem16[input_0] = bits_4; input_0 += 8
# asm 1: strh <bits_4=int32#2,[<input_0=int32#1],#8
# asm 2: strh <bits_4=r1,[<input_0=r0],#8
strh r1,[r0],#8

# qhasm:     bits_5 = x_6_7 & (x_4_5 unsigned>> 16)
# asm 1: and >bits_5=int32#3,<x_6_7=int32#13,<x_4_5=int32#4,LSR #16
# asm 2: and >bits_5=r2,<x_6_7=r12,<x_4_5=r3,LSR #16
and r2,r12,r3,LSR #16

# qhasm:     bits_5 ^= (x_6_7 unsigned>> 16)
# asm 1: eor >bits_5=int32#3,<bits_5=int32#3,<x_6_7=int32#13,LSR #16
# asm 2: eor >bits_5=r2,<bits_5=r2,<x_6_7=r12,LSR #16
eor r2,r2,r12,LSR #16

# qhasm:     bits_6 = bits_4 & bits_5
# asm 1: and >bits_6=int32#2,<bits_4=int32#2,<bits_5=int32#3
# asm 2: and >bits_6=r1,<bits_4=r1,<bits_5=r2
and r1,r1,r2

# qhasm:     bits_6 ^= x_4_5
# asm 1: eor >bits_6=int32#2,<bits_6=int32#2,<x_4_5=int32#4
# asm 2: eor >bits_6=r1,<bits_6=r1,<x_4_5=r3
eor r1,r1,r3

# qhasm:     assign r4 r5 r6 r7 to x_8_9 x_10_11 x_12_13 x_14_15 = mem128[input_0]
# asm 1: ldm <input_0=int32#1, {>x_8_9=int32#5,>x_10_11=int32#6,>x_12_13=int32#7,>x_14_15=int32#8}
# asm 2: ldm <input_0=r0, {>x_8_9=r4,>x_10_11=r5,>x_12_13=r6,>x_14_15=r7}
ldm r0, {r4,r5,r6,r7}

# qhasm:     input_0 -= 16
# asm 1: sub >input_0=int32#1,<input_0=int32#1,#16
# asm 2: sub >input_0=r0,<input_0=r0,#16
sub r0,r0,#16

# qhasm:     bits_7 = bits_5 & bits_6
# asm 1: and >bits_7=int32#9,<bits_5=int32#3,<bits_6=int32#2
# asm 2: and >bits_7=r8,<bits_5=r2,<bits_6=r1
and r8,r2,r1

# qhasm:     bits_7 ^= (x_4_5 unsigned>> 16)
# asm 1: eor >bits_7=int32#4,<bits_7=int32#9,<x_4_5=int32#4,LSR #16
# asm 2: eor >bits_7=r3,<bits_7=r8,<x_4_5=r3,LSR #16
eor r3,r8,r3,LSR #16

# qhasm:     mem16[input_0 + 10] = bits_5
# asm 1: strh <bits_5=int32#3,[<input_0=int32#1,#10]
# asm 2: strh <bits_5=r2,[<input_0=r0,#10]
strh r2,[r0,#10]

# qhasm:     mem16[input_0 + 12] = bits_6
# asm 1: strh <bits_6=int32#2,[<input_0=int32#1,#12]
# asm 2: strh <bits_6=r1,[<input_0=r0,#12]
strh r1,[r0,#12]

# qhasm:     mem16[input_0 + 14] = bits_7
# asm 1: strh <bits_7=int32#4,[<input_0=int32#1,#14]
# asm 2: strh <bits_7=r3,[<input_0=r0,#14]
strh r3,[r0,#14]

# qhasm:     bits_8 = x_8_9 & (x_8_9 unsigned>> 16)
# asm 1: and >bits_8=int32#2,<x_8_9=int32#5,<x_8_9=int32#5,LSR #16
# asm 2: and >bits_8=r1,<x_8_9=r4,<x_8_9=r4,LSR #16
and r1,r4,r4,LSR #16

# qhasm:     bits_8 ^= x_10_11
# asm 1: eor >bits_8=int32#2,<bits_8=int32#2,<x_10_11=int32#6
# asm 2: eor >bits_8=r1,<bits_8=r1,<x_10_11=r5
eor r1,r1,r5

# qhasm:     mem16[input_0 + 16] = bits_8
# asm 1: strh <bits_8=int32#2,[<input_0=int32#1,#16]
# asm 2: strh <bits_8=r1,[<input_0=r0,#16]
strh r1,[r0,#16]

# qhasm:     bits_9 = x_10_11 & (x_8_9 unsigned>> 16)
# asm 1: and >bits_9=int32#3,<x_10_11=int32#6,<x_8_9=int32#5,LSR #16
# asm 2: and >bits_9=r2,<x_10_11=r5,<x_8_9=r4,LSR #16
and r2,r5,r4,LSR #16

# qhasm:     bits_9 ^= (x_10_11 unsigned>> 16)
# asm 1: eor >bits_9=int32#3,<bits_9=int32#3,<x_10_11=int32#6,LSR #16
# asm 2: eor >bits_9=r2,<bits_9=r2,<x_10_11=r5,LSR #16
eor r2,r2,r5,LSR #16

# qhasm:     mem16[input_0 + 18] = bits_9
# asm 1: strh <bits_9=int32#3,[<input_0=int32#1,#18]
# asm 2: strh <bits_9=r2,[<input_0=r0,#18]
strh r2,[r0,#18]

# qhasm:     bits_10 = bits_8 & bits_9
# asm 1: and >bits_10=int32#2,<bits_8=int32#2,<bits_9=int32#3
# asm 2: and >bits_10=r1,<bits_8=r1,<bits_9=r2
and r1,r1,r2

# qhasm:     bits_10 ^= x_8_9
# asm 1: eor >bits_10=int32#2,<bits_10=int32#2,<x_8_9=int32#5
# asm 2: eor >bits_10=r1,<bits_10=r1,<x_8_9=r4
eor r1,r1,r4

# qhasm:     mem16[input_0 + 20] = bits_10
# asm 1: strh <bits_10=int32#2,[<input_0=int32#1,#20]
# asm 2: strh <bits_10=r1,[<input_0=r0,#20]
strh r1,[r0,#20]

# qhasm:     bits_11 = bits_9 & bits_10
# asm 1: and >bits_11=int32#2,<bits_9=int32#3,<bits_10=int32#2
# asm 2: and >bits_11=r1,<bits_9=r2,<bits_10=r1
and r1,r2,r1

# qhasm:     bits_11 ^= (x_8_9 unsigned>> 16)
# asm 1: eor >bits_11=int32#2,<bits_11=int32#2,<x_8_9=int32#5,LSR #16
# asm 2: eor >bits_11=r1,<bits_11=r1,<x_8_9=r4,LSR #16
eor r1,r1,r4,LSR #16

# qhasm:     mem16[input_0 + 22] = bits_11
# asm 1: strh <bits_11=int32#2,[<input_0=int32#1,#22]
# asm 2: strh <bits_11=r1,[<input_0=r0,#22]
strh r1,[r0,#22]

# qhasm:     bits_12 = x_12_13 & (x_12_13 unsigned>> 16)
# asm 1: and >bits_12=int32#2,<x_12_13=int32#7,<x_12_13=int32#7,LSR #16
# asm 2: and >bits_12=r1,<x_12_13=r6,<x_12_13=r6,LSR #16
and r1,r6,r6,LSR #16

# qhasm:     bits_12 ^= x_14_15
# asm 1: eor >bits_12=int32#2,<bits_12=int32#2,<x_14_15=int32#8
# asm 2: eor >bits_12=r1,<bits_12=r1,<x_14_15=r7
eor r1,r1,r7

# qhasm:     mem16[input_0 + 24] = bits_12
# asm 1: strh <bits_12=int32#2,[<input_0=int32#1,#24]
# asm 2: strh <bits_12=r1,[<input_0=r0,#24]
strh r1,[r0,#24]

# qhasm:     bits_13 = x_14_15 & (x_12_13 unsigned>> 16)
# asm 1: and >bits_13=int32#3,<x_14_15=int32#8,<x_12_13=int32#7,LSR #16
# asm 2: and >bits_13=r2,<x_14_15=r7,<x_12_13=r6,LSR #16
and r2,r7,r6,LSR #16

# qhasm:     bits_13 ^= (x_14_15 unsigned>> 16)
# asm 1: eor >bits_13=int32#5,<bits_13=int32#3,<x_14_15=int32#8,LSR #16
# asm 2: eor >bits_13=r4,<bits_13=r2,<x_14_15=r7,LSR #16
eor r4,r2,r7,LSR #16

# qhasm:     mem16[input_0 + 26] = bits_13
# asm 1: strh <bits_13=int32#5,[<input_0=int32#1,#26]
# asm 2: strh <bits_13=r4,[<input_0=r0,#26]
strh r4,[r0,#26]

# qhasm:     bits_14 = bits_12 & bits_13
# asm 1: and >bits_14=int32#2,<bits_12=int32#2,<bits_13=int32#5
# asm 2: and >bits_14=r1,<bits_12=r1,<bits_13=r4
and r1,r1,r4

# qhasm:     bits_14 ^= x_12_13
# asm 1: eor >bits_14=int32#9,<bits_14=int32#2,<x_12_13=int32#7
# asm 2: eor >bits_14=r8,<bits_14=r1,<x_12_13=r6
eor r8,r1,r6

# qhasm:     mem16[input_0 + 28] = bits_14
# asm 1: strh <bits_14=int32#9,[<input_0=int32#1,#28]
# asm 2: strh <bits_14=r8,[<input_0=r0,#28]
strh r8,[r0,#28]

# qhasm:     assign r1 r2 r3 to x_0_1 x_2_3 x_4_5 = mem96[input_0]
# asm 1: ldm <input_0=int32#1, {>x_0_1=int32#2,>x_2_3=int32#3,>x_4_5=int32#4}
# asm 2: ldm <input_0=r0, {>x_0_1=r1,>x_2_3=r2,>x_4_5=r3}
ldm r0, {r1,r2,r3}

# qhasm:     bits_15 = bits_13 & bits_14
# asm 1: and >bits_15=int32#5,<bits_13=int32#5,<bits_14=int32#9
# asm 2: and >bits_15=r4,<bits_13=r4,<bits_14=r8
and r4,r4,r8

# qhasm:     bits_15 ^= (x_12_13 unsigned>> 16)
# asm 1: eor >bits_15=int32#5,<bits_15=int32#5,<x_12_13=int32#7,LSR #16
# asm 2: eor >bits_15=r4,<bits_15=r4,<x_12_13=r6,LSR #16
eor r4,r4,r6,LSR #16

# qhasm:     mem16[input_0 + 30] = bits_15
# asm 1: strh <bits_15=int32#5,[<input_0=int32#1,#30]
# asm 2: strh <bits_15=r4,[<input_0=r0,#30]
strh r4,[r0,#30]

# qhasm:     assign r6 r7 to x_8_9 x_10_11 = mem64[input_0 + 16]
# asm 1: ldrd >x_8_9=int32#7,[<input_0=int32#1,#16]
# asm 2: ldrd >x_8_9=r6,[<input_0=r0,#16]
ldrd r6,[r0,#16]

# qhasm:     assign r4 r5 to x_12_13 x_14_15 = mem64[input_0 + 24]
# asm 1: ldrd >x_12_13=int32#5,[<input_0=int32#1,#24]
# asm 2: ldrd >x_12_13=r4,[<input_0=r0,#24]
ldrd r4,[r0,#24]

# qhasm:     t1 = x_0_1 ^ x_4_5
# asm 1: eor >t1=int32#10,<x_0_1=int32#2,<x_4_5=int32#4
# asm 2: eor >t1=r9,<x_0_1=r1,<x_4_5=r3
eor r9,r1,r3

# qhasm:     t3 = t1 ^ bits_14
# asm 1: eor >t3=int32#9,<t1=int32#10,<bits_14=int32#9
# asm 2: eor >t3=r8,<t1=r9,<bits_14=r8
eor r8,r9,r8

# qhasm:     t5shifted = x_8_9 ^ x_4_5
# asm 1: eor >t5shifted=int32#11,<x_8_9=int32#7,<x_4_5=int32#4
# asm 2: eor >t5shifted=r10,<x_8_9=r6,<x_4_5=r3
eor r10,r6,r3

# qhasm:     y14 = t3 ^ (t5shifted unsigned>> 16)
# asm 1: eor >y14=int32#12,<t3=int32#9,<t5shifted=int32#11,LSR #16
# asm 2: eor >y14=r11,<t3=r8,<t5shifted=r10,LSR #16
eor r11,r8,r10,LSR #16

# qhasm:     mem16[input_0 + 34] = y14
# asm 1: strh <y14=int32#12,[<input_0=int32#1,#34]
# asm 2: strh <y14=r11,[<input_0=r0,#34]
strh r11,[r0,#34]

# qhasm:     t12 = x_10_11 ^ t3
# asm 1: eor >t12=int32#9,<x_10_11=int32#8,<t3=int32#9
# asm 2: eor >t12=r8,<x_10_11=r7,<t3=r8
eor r8,r7,r8

# qhasm:     t2 = x_12_13 ^ x_8_9
# asm 1: eor >t2=int32#12,<x_12_13=int32#5,<x_8_9=int32#7
# asm 2: eor >t2=r11,<x_12_13=r4,<x_8_9=r6
eor r11,r4,r6

# qhasm:     mem16[input_0 + 32] = t2
# asm 1: strh <t2=int32#12,[<input_0=int32#1,#32]
# asm 2: strh <t2=r11,[<input_0=r0,#32]
strh r11,[r0,#32]

# qhasm:     t4 = t2 ^ x_2_3
# asm 1: eor >t4=int32#12,<t2=int32#12,<x_2_3=int32#3
# asm 2: eor >t4=r11,<t2=r11,<x_2_3=r2
eor r11,r11,r2

# qhasm:     x_6_7 = mem32[input_0 + 12]
# asm 1: ldr >x_6_7=int32#13,[<input_0=int32#1,#12]
# asm 2: ldr >x_6_7=r12,[<input_0=r0,#12]
ldr r12,[r0,#12]

# qhasm:     y2 = t4 ^ (t5shifted unsigned>> 16)
# asm 1: eor >y2=int32#14,<t4=int32#12,<t5shifted=int32#11,LSR #16
# asm 2: eor >y2=r13,<t4=r11,<t5shifted=r10,LSR #16
eor r13,r11,r10,LSR #16

# qhasm:     mem16[input_0 + 4] = y2
# asm 1: strh <y2=int32#14,[<input_0=int32#1,#4]
# asm 2: strh <y2=r13,[<input_0=r0,#4]
strh r13,[r0,#4]

# qhasm:     t10shifted = x_0_1 ^ x_10_11
# asm 1: eor >t10shifted=int32#14,<x_0_1=int32#2,<x_10_11=int32#8
# asm 2: eor >t10shifted=r13,<x_0_1=r1,<x_10_11=r7
eor r13,r1,r7

# qhasm:     t14 = x_6_7 ^ t4
# asm 1: eor >t14=int32#12,<x_6_7=int32#13,<t4=int32#12
# asm 2: eor >t14=r11,<x_6_7=r12,<t4=r11
eor r11,r12,r11

# qhasm:     t19 = x_4_5 ^ (t10shifted unsigned>> 16)
# asm 1: eor >t19=int32#4,<x_4_5=int32#4,<t10shifted=int32#14,LSR #16
# asm 2: eor >t19=r3,<x_4_5=r3,<t10shifted=r13,LSR #16
eor r3,r3,r13,LSR #16

# qhasm:     t11 = x_12_13 ^ (x_14_15 unsigned>> 16)
# asm 1: eor >t11=int32#13,<x_12_13=int32#5,<x_14_15=int32#6,LSR #16
# asm 2: eor >t11=r12,<x_12_13=r4,<x_14_15=r5,LSR #16
eor r12,r4,r5,LSR #16

# qhasm:     y1 = t19 ^ t11
# asm 1: eor >y1=int32#4,<t19=int32#4,<t11=int32#13
# asm 2: eor >y1=r3,<t19=r3,<t11=r12
eor r3,r3,r12

# qhasm:     mem16[input_0 + 48] = t11
# asm 1: strh <t11=int32#13,[<input_0=int32#1,#48]
# asm 2: strh <t11=r12,[<input_0=r0,#48]
strh r12,[r0,#48]

# qhasm:     mem16[input_0 + 2] = y1
# asm 1: strh <y1=int32#4,[<input_0=int32#1,#2]
# asm 2: strh <y1=r3,[<input_0=r0,#2]
strh r3,[r0,#2]

# qhasm:     t21 = t12 ^ (x_2_3 unsigned>> 16)
# asm 1: eor >t21=int32#4,<t12=int32#9,<x_2_3=int32#3,LSR #16
# asm 2: eor >t21=r3,<t12=r8,<x_2_3=r2,LSR #16
eor r3,r8,r2,LSR #16

# qhasm:     t13 = x_8_9 ^ (x_10_11 unsigned>> 16)
# asm 1: eor >t13=int32#13,<x_8_9=int32#7,<x_10_11=int32#8,LSR #16
# asm 2: eor >t13=r12,<x_8_9=r6,<x_10_11=r7,LSR #16
eor r12,r6,r7,LSR #16

# qhasm:     y4 = t13 ^ t21
# asm 1: eor >y4=int32#4,<t13=int32#13,<t21=int32#4
# asm 2: eor >y4=r3,<t13=r12,<t21=r3
eor r3,r12,r3

# qhasm:     mem16[input_0 + 36] = y4
# asm 1: strh <y4=int32#4,[<input_0=int32#1,#36]
# asm 2: strh <y4=r3,[<input_0=r0,#36]
strh r3,[r0,#36]

# qhasm:     t6shifted = x_0_1 ^ x_12_13
# asm 1: eor >t6shifted=int32#4,<x_0_1=int32#2,<x_12_13=int32#5
# asm 2: eor >t6shifted=r3,<x_0_1=r1,<x_12_13=r4
eor r3,r1,r4

# qhasm:     t22 = x_10_11 ^ (t6shifted unsigned>> 16)
# asm 1: eor >t22=int32#4,<x_10_11=int32#8,<t6shifted=int32#4,LSR #16
# asm 2: eor >t22=r3,<x_10_11=r7,<t6shifted=r3,LSR #16
eor r3,r7,r3,LSR #16

# qhasm:     y10 = t1 ^ t22
# asm 1: eor >y10=int32#8,<t1=int32#10,<t22=int32#4
# asm 2: eor >y10=r7,<t1=r9,<t22=r3
eor r7,r9,r3

# qhasm:     mem16[input_0 + 38] = y10
# asm 1: strh <y10=int32#8,[<input_0=int32#1,#38]
# asm 2: strh <y10=r7,[<input_0=r0,#38]
strh r7,[r0,#38]

# qhasm:     x_6_7 = mem32[input_0 + 12]
# asm 1: ldr >x_6_7=int32#8,[<input_0=int32#1,#12]
# asm 2: ldr >x_6_7=r7,[<input_0=r0,#12]
ldr r7,[r0,#12]

# qhasm:     t9 = x_2_3 ^ x_14_15
# asm 1: eor >t9=int32#10,<x_2_3=int32#3,<x_14_15=int32#6
# asm 2: eor >t9=r9,<x_2_3=r2,<x_14_15=r5
eor r9,r2,r5

# qhasm:     t23 = t9 ^ (x_8_9 unsigned>> 16)
# asm 1: eor >t23=int32#10,<t9=int32#10,<x_8_9=int32#7,LSR #16
# asm 2: eor >t23=r9,<t9=r9,<x_8_9=r6,LSR #16
eor r9,r9,r6,LSR #16

# qhasm:     t8shifted = x_6_7 ^ x_12_13
# asm 1: eor >t8shifted=int32#15,<x_6_7=int32#8,<x_12_13=int32#5
# asm 2: eor >t8shifted=r14,<x_6_7=r7,<x_12_13=r4
eor r14,r7,r4

# qhasm:     mem32[input_0 + 44] = t8shifted 
# asm 1: str <t8shifted=int32#15,[<input_0=int32#1,#44]
# asm 2: str <t8shifted=r14,[<input_0=r0,#44]
str r14,[r0,#44]

# qhasm:     y7 = t23 ^ (t8shifted unsigned>> 16)
# asm 1: eor >y7=int32#15,<t23=int32#10,<t8shifted=int32#15,LSR #16
# asm 2: eor >y7=r14,<t23=r9,<t8shifted=r14,LSR #16
eor r14,r9,r14,LSR #16

# qhasm:     mem16[input_0 + 14] = y7
# asm 1: strh <y7=int32#15,[<input_0=int32#1,#14]
# asm 2: strh <y7=r14,[<input_0=r0,#14]
strh r14,[r0,#14]

# qhasm:     t24 = t23 ^ (t10shifted unsigned>> 16)
# asm 1: eor >t24=int32#10,<t23=int32#10,<t10shifted=int32#14,LSR #16
# asm 2: eor >t24=r9,<t23=r9,<t10shifted=r13,LSR #16
eor r9,r9,r13,LSR #16

# qhasm:     x_4_5 = mem32[input_0 + 8] 
# asm 1: ldr >x_4_5=int32#14,[<input_0=int32#1,#8]
# asm 2: ldr >x_4_5=r13,[<input_0=r0,#8]
ldr r13,[r0,#8]

# qhasm:     y11 = t24 ^ (t5shifted unsigned>> 16)
# asm 1: eor >y11=int32#10,<t24=int32#10,<t5shifted=int32#11,LSR #16
# asm 2: eor >y11=r9,<t24=r9,<t5shifted=r10,LSR #16
eor r9,r9,r10,LSR #16

# qhasm:     t25 = x_0_1 ^ t13
# asm 1: eor >t25=int32#11,<x_0_1=int32#2,<t13=int32#13
# asm 2: eor >t25=r10,<x_0_1=r1,<t13=r12
eor r10,r1,r12

# qhasm:     t15shifted = x_4_5 ^ x_14_15
# asm 1: eor >t15shifted=int32#13,<x_4_5=int32#14,<x_14_15=int32#6
# asm 2: eor >t15shifted=r12,<x_4_5=r13,<x_14_15=r5
eor r12,r13,r5

# qhasm:     mem16[input_0 + 40] = y11
# asm 1: strh <y11=int32#10,[<input_0=int32#1,#40]
# asm 2: strh <y11=r9,[<input_0=r0,#40]
strh r9,[r0,#40]

# qhasm:     y5 = t25 ^ (t15shifted unsigned>> 16)
# asm 1: eor >y5=int32#10,<t25=int32#11,<t15shifted=int32#13,LSR #16
# asm 2: eor >y5=r9,<t25=r10,<t15shifted=r12,LSR #16
eor r9,r10,r12,LSR #16

# qhasm:     t17shifted = x_2_3 ^ x_8_9
# asm 1: eor >t17shifted=int32#11,<x_2_3=int32#3,<x_8_9=int32#7
# asm 2: eor >t17shifted=r10,<x_2_3=r2,<x_8_9=r6
eor r10,r2,r6

# qhasm:     mem16[input_0 + 10] = y5
# asm 1: strh <y5=int32#10,[<input_0=int32#1,#10]
# asm 2: strh <y5=r9,[<input_0=r0,#10]
strh r9,[r0,#10]

# qhasm:     t26 = x_12_13 ^ (t17shifted unsigned>> 16)
# asm 1: eor >t26=int32#10,<x_12_13=int32#5,<t17shifted=int32#11,LSR #16
# asm 2: eor >t26=r9,<x_12_13=r4,<t17shifted=r10,LSR #16
eor r9,r4,r10,LSR #16

# qhasm:     t18 = x_4_5 ^ (x_6_7 unsigned>> 16)
# asm 1: eor >t18=int32#14,<x_4_5=int32#14,<x_6_7=int32#8,LSR #16
# asm 2: eor >t18=r13,<x_4_5=r13,<x_6_7=r7,LSR #16
eor r13,r13,r7,LSR #16

# qhasm:     y9 = t18 ^ t26
# asm 1: eor >y9=int32#10,<t18=int32#14,<t26=int32#10
# asm 2: eor >y9=r9,<t18=r13,<t26=r9
eor r9,r13,r9

# qhasm:     mem16[input_0 + 44] = t18
# asm 1: strh <t18=int32#14,[<input_0=int32#1,#44]
# asm 2: strh <t18=r13,[<input_0=r0,#44]
strh r13,[r0,#44]

# qhasm:     mem16[input_0 + 18] = y9
# asm 1: strh <y9=int32#10,[<input_0=int32#1,#18]
# asm 2: strh <y9=r9,[<input_0=r0,#18]
strh r9,[r0,#18]

# qhasm:     t2 = mem16[input_0 + 32]
# asm 1: ldrh >t2=int32#10,[<input_0=int32#1,#32]
# asm 2: ldrh >t2=r9,[<input_0=r0,#32]
ldrh r9,[r0,#32]

# qhasm:     x_10_11 = mem32[input_0 + 20]
# asm 1: ldr >x_10_11=int32#14,[<input_0=int32#1,#20]
# asm 2: ldr >x_10_11=r13,[<input_0=r0,#20]
ldr r13,[r0,#20]

# qhasm:     t8_t11 = mem32[input_0 + 46]
# asm 1: ldr >t8_t11=int32#15,[<input_0=int32#1,#46]
# asm 2: ldr >t8_t11=r14,[<input_0=r0,#46]
ldr r14,[r0,#46]

# qhasm:     t27 = t2 ^ t22
# asm 1: eor >t27=int32#4,<t2=int32#10,<t22=int32#4
# asm 2: eor >t27=r3,<t2=r9,<t22=r3
eor r3,r9,r3

# qhasm:     t16 = x_6_7 ^ x_10_11
# asm 1: eor >t16=int32#10,<x_6_7=int32#8,<x_10_11=int32#14
# asm 2: eor >t16=r9,<x_6_7=r7,<x_10_11=r13
eor r9,r7,r13

# qhasm:     t28shifted = t8_t11 ^ x_6_7
# asm 1: eor >t28shifted=int32#8,<t8_t11=int32#15,<x_6_7=int32#8
# asm 2: eor >t28shifted=r7,<t8_t11=r14,<x_6_7=r7
eor r7,r14,r7

# qhasm:     y6 = t16 ^ t27
# asm 1: eor >y6=int32#4,<t16=int32#10,<t27=int32#4
# asm 2: eor >y6=r3,<t16=r9,<t27=r3
eor r3,r9,r3

# qhasm:     y0 = t12 ^ (t28shifted unsigned>> 16)
# asm 1: eor >y0=int32#8,<t12=int32#9,<t28shifted=int32#8,LSR #16
# asm 2: eor >y0=r7,<t12=r8,<t28shifted=r7,LSR #16
eor r7,r8,r7,LSR #16

# qhasm:     mem16[input_0 + 0] = y0
# asm 1: strh <y0=int32#8,[<input_0=int32#1,#0]
# asm 2: strh <y0=r7,[<input_0=r0,#0]
strh r7,[r0,#0]

# qhasm:     t30 = x_8_9 ^ t8_t11
# asm 1: eor >t30=int32#7,<x_8_9=int32#7,<t8_t11=int32#15
# asm 2: eor >t30=r6,<x_8_9=r6,<t8_t11=r14
eor r6,r6,r14

# qhasm:     t7 = x_0_1 ^ (x_2_3 unsigned>> 16)
# asm 1: eor >t7=int32#3,<x_0_1=int32#2,<x_2_3=int32#3,LSR #16
# asm 2: eor >t7=r2,<x_0_1=r1,<x_2_3=r2,LSR #16
eor r2,r1,r2,LSR #16

# qhasm:     y13 = t7 ^ t30
# asm 1: eor >y13=int32#7,<t7=int32#3,<t30=int32#7
# asm 2: eor >y13=r6,<t7=r2,<t30=r6
eor r6,r2,r6

# qhasm:     t31shifted = t17shifted ^ x_12_13
# asm 1: eor >t31shifted=int32#5,<t17shifted=int32#11,<x_12_13=int32#5
# asm 2: eor >t31shifted=r4,<t17shifted=r10,<x_12_13=r4
eor r4,r10,r4

# qhasm:     y3 = t16 ^ (t31shifted unsigned>> 16)
# asm 1: eor >y3=int32#5,<t16=int32#10,<t31shifted=int32#5,LSR #16
# asm 2: eor >y3=r4,<t16=r9,<t31shifted=r4,LSR #16
eor r4,r9,r4,LSR #16

# qhasm:     mem16[input_0 + 6] = y3
# asm 1: strh <y3=int32#5,[<input_0=int32#1,#6]
# asm 2: strh <y3=r4,[<input_0=r0,#6]
strh r4,[r0,#6]

# qhasm:     t32 = t16 ^ (x_0_1 unsigned>> 16)
# asm 1: eor >t32=int32#2,<t16=int32#10,<x_0_1=int32#2,LSR #16
# asm 2: eor >t32=r1,<t16=r9,<x_0_1=r1,LSR #16
eor r1,r9,r1,LSR #16

# qhasm:     y15 = t32 ^ (t15shifted unsigned>> 16)
# asm 1: eor >y15=int32#2,<t32=int32#2,<t15shifted=int32#13,LSR #16
# asm 2: eor >y15=r1,<t32=r1,<t15shifted=r12,LSR #16
eor r1,r1,r12,LSR #16

# qhasm:     t18 = mem16[input_0 + 44]
# asm 1: ldrh >t18=int32#5,[<input_0=int32#1,#44]
# asm 2: ldrh >t18=r4,[<input_0=r0,#44]
ldrh r4,[r0,#44]

# qhasm:     t33 = t14 ^ (x_14_15 unsigned>> 16)
# asm 1: eor >t33=int32#6,<t14=int32#12,<x_14_15=int32#6,LSR #16
# asm 2: eor >t33=r5,<t14=r11,<x_14_15=r5,LSR #16
eor r5,r11,r5,LSR #16

# qhasm:     y8 = t18 ^ t33
# asm 1: eor >y8=int32#5,<t18=int32#5,<t33=int32#6
# asm 2: eor >y8=r4,<t18=r4,<t33=r5
eor r4,r4,r5

# qhasm:     t34 = t14 ^ (x_10_11 unsigned>> 16)
# asm 1: eor >t34=int32#6,<t14=int32#12,<x_10_11=int32#14,LSR #16
# asm 2: eor >t34=r5,<t14=r11,<x_10_11=r13,LSR #16
eor r5,r11,r13,LSR #16

# qhasm:     y12 = t34 ^ t7
# asm 1: eor >y12=int32#3,<t34=int32#6,<t7=int32#3
# asm 2: eor >y12=r2,<t34=r5,<t7=r2
eor r2,r5,r2

# qhasm:     x = 0xffff
# asm 1: ldr >x=int32#6,=0xffff
# asm 2: ldr >x=r5,=0xffff
ldr r5,=0xffff

# qhasm:     x_1_0 = mem16[input_0 + 36] 
# asm 1: ldrh >x_1_0=int32#8,[<input_0=int32#1,#36]
# asm 2: ldrh >x_1_0=r7,[<input_0=r0,#36]
ldrh r7,[r0,#36]

# qhasm:     x_1_1 = mem16[input_0 + 10]
# asm 1: ldrh >x_1_1=int32#9,[<input_0=int32#1,#10]
# asm 2: ldrh >x_1_1=r8,[<input_0=r0,#10]
ldrh r8,[r0,#10]

# qhasm:     x_1_2 = y6 & x
# asm 1: and >x_1_2=int32#4,<y6=int32#4,<x=int32#6
# asm 2: and >x_1_2=r3,<y6=r3,<x=r5
and r3,r3,r5

# qhasm:     x_1_3 = mem16[input_0 + 14]
# asm 1: ldrh >x_1_3=int32#10,[<input_0=int32#1,#14]
# asm 2: ldrh >x_1_3=r9,[<input_0=r0,#14]
ldrh r9,[r0,#14]

# qhasm:     x_1_0 |= (x_1_0 << 16)
# asm 1: orr >x_1_0=int32#8,<x_1_0=int32#8,<x_1_0=int32#8,LSL #16
# asm 2: orr >x_1_0=r7,<x_1_0=r7,<x_1_0=r7,LSL #16
orr r7,r7,r7,LSL #16

# qhasm:     x_1_1 |= (x_1_1 << 16)
# asm 1: orr >x_1_1=int32#9,<x_1_1=int32#9,<x_1_1=int32#9,LSL #16
# asm 2: orr >x_1_1=r8,<x_1_1=r8,<x_1_1=r8,LSL #16
orr r8,r8,r8,LSL #16

# qhasm:     x_1_2 |= (x_1_2 << 16)
# asm 1: orr >x_1_2=int32#4,<x_1_2=int32#4,<x_1_2=int32#4,LSL #16
# asm 2: orr >x_1_2=r3,<x_1_2=r3,<x_1_2=r3,LSL #16
orr r3,r3,r3,LSL #16

# qhasm:     x_1_3 |= (x_1_3 << 16)
# asm 1: orr >x_1_3=int32#10,<x_1_3=int32#10,<x_1_3=int32#10,LSL #16
# asm 2: orr >x_1_3=r9,<x_1_3=r9,<x_1_3=r9,LSL #16
orr r9,r9,r9,LSL #16

# qhasm:     x_1_0 >>>= 1
# asm 1: mov >x_1_0=int32#8,<x_1_0=int32#8,ROR #1
# asm 2: mov >x_1_0=r7,<x_1_0=r7,ROR #1
mov r7,r7,ROR #1

# qhasm:     x_1_1 >>>= 1
# asm 1: mov >x_1_1=int32#9,<x_1_1=int32#9,ROR #1
# asm 2: mov >x_1_1=r8,<x_1_1=r8,ROR #1
mov r8,r8,ROR #1

# qhasm:     x_1_2 >>>= 1
# asm 1: mov >x_1_2=int32#11,<x_1_2=int32#4,ROR #1
# asm 2: mov >x_1_2=r10,<x_1_2=r3,ROR #1
mov r10,r3,ROR #1

# qhasm:     x_1_3 >>>= 1
# asm 1: mov >x_1_3=int32#10,<x_1_3=int32#10,ROR #1
# asm 2: mov >x_1_3=r9,<x_1_3=r9,ROR #1
mov r9,r9,ROR #1

# qhasm:     x_2_0 = y8 & x
# asm 1: and >x_2_0=int32#4,<y8=int32#5,<x=int32#6
# asm 2: and >x_2_0=r3,<y8=r4,<x=r5
and r3,r4,r5

# qhasm:     x_2_1 = mem16[input_0 + 18]
# asm 1: ldrh >x_2_1=int32#5,[<input_0=int32#1,#18]
# asm 2: ldrh >x_2_1=r4,[<input_0=r0,#18]
ldrh r4,[r0,#18]

# qhasm:     x_2_2 = mem16[input_0 + 38] 
# asm 1: ldrh >x_2_2=int32#12,[<input_0=int32#1,#38]
# asm 2: ldrh >x_2_2=r11,[<input_0=r0,#38]
ldrh r11,[r0,#38]

# qhasm:     mx_2_3 = mem16[input_0 + 40] 
# asm 1: ldrh >mx_2_3=int32#13,[<input_0=int32#1,#40]
# asm 2: ldrh >mx_2_3=r12,[<input_0=r0,#40]
ldrh r12,[r0,#40]

# qhasm:     x_2_0 |= (x_2_0 << 16)
# asm 1: orr >x_2_0=int32#4,<x_2_0=int32#4,<x_2_0=int32#4,LSL #16
# asm 2: orr >x_2_0=r3,<x_2_0=r3,<x_2_0=r3,LSL #16
orr r3,r3,r3,LSL #16

# qhasm:     x_2_1 |= (x_2_1 << 16)
# asm 1: orr >x_2_1=int32#5,<x_2_1=int32#5,<x_2_1=int32#5,LSL #16
# asm 2: orr >x_2_1=r4,<x_2_1=r4,<x_2_1=r4,LSL #16
orr r4,r4,r4,LSL #16

# qhasm:     x_2_2 |= (x_2_2 << 16)
# asm 1: orr >x_2_2=int32#12,<x_2_2=int32#12,<x_2_2=int32#12,LSL #16
# asm 2: orr >x_2_2=r11,<x_2_2=r11,<x_2_2=r11,LSL #16
orr r11,r11,r11,LSL #16

# qhasm:     mx_2_3 |= (mx_2_3 << 16)
# asm 1: orr >mx_2_3=int32#13,<mx_2_3=int32#13,<mx_2_3=int32#13,LSL #16
# asm 2: orr >mx_2_3=r12,<mx_2_3=r12,<mx_2_3=r12,LSL #16
orr r12,r12,r12,LSL #16

# qhasm:     x_2_0 >>>= 8
# asm 1: mov >x_2_0=int32#14,<x_2_0=int32#4,ROR #8
# asm 2: mov >x_2_0=r13,<x_2_0=r3,ROR #8
mov r13,r3,ROR #8

# qhasm:     x_2_1 >>>= 8
# asm 1: mov >x_2_1=int32#5,<x_2_1=int32#5,ROR #8
# asm 2: mov >x_2_1=r4,<x_2_1=r4,ROR #8
mov r4,r4,ROR #8

# qhasm:     x_2_2 >>>= 8
# asm 1: mov >x_2_2=int32#12,<x_2_2=int32#12,ROR #8
# asm 2: mov >x_2_2=r11,<x_2_2=r11,ROR #8
mov r11,r11,ROR #8

# qhasm:     mx_2_3 >>>= 8
# asm 1: mov >mx_2_3=int32#13,<mx_2_3=int32#13,ROR #8
# asm 2: mov >mx_2_3=r12,<mx_2_3=r12,ROR #8
mov r12,r12,ROR #8

# qhasm:     x_3_0 = y12 & x
# asm 1: and >x_3_0=int32#3,<y12=int32#3,<x=int32#6
# asm 2: and >x_3_0=r2,<y12=r2,<x=r5
and r2,r2,r5

# qhasm:     x_3_1 = y13 & x
# asm 1: and >x_3_1=int32#4,<y13=int32#7,<x=int32#6
# asm 2: and >x_3_1=r3,<y13=r6,<x=r5
and r3,r6,r5

# qhasm:     x_3_2 = mem16[input_0 + 34]
# asm 1: ldrh >x_3_2=int32#7,[<input_0=int32#1,#34]
# asm 2: ldrh >x_3_2=r6,[<input_0=r0,#34]
ldrh r6,[r0,#34]

# qhasm:     x_3_3 = y15 & x
# asm 1: and >x_3_3=int32#2,<y15=int32#2,<x=int32#6
# asm 2: and >x_3_3=r1,<y15=r1,<x=r5
and r1,r1,r5

# qhasm:     x_3_0 |= (x_3_0 << 16)
# asm 1: orr >x_3_0=int32#3,<x_3_0=int32#3,<x_3_0=int32#3,LSL #16
# asm 2: orr >x_3_0=r2,<x_3_0=r2,<x_3_0=r2,LSL #16
orr r2,r2,r2,LSL #16

# qhasm:     x_3_1 |= (x_3_1 << 16)
# asm 1: orr >x_3_1=int32#4,<x_3_1=int32#4,<x_3_1=int32#4,LSL #16
# asm 2: orr >x_3_1=r3,<x_3_1=r3,<x_3_1=r3,LSL #16
orr r3,r3,r3,LSL #16

# qhasm:     x_3_2 |= (x_3_2 << 16)
# asm 1: orr >x_3_2=int32#6,<x_3_2=int32#7,<x_3_2=int32#7,LSL #16
# asm 2: orr >x_3_2=r5,<x_3_2=r6,<x_3_2=r6,LSL #16
orr r5,r6,r6,LSL #16

# qhasm:     x_3_3 |= (x_3_3 << 16)
# asm 1: orr >x_3_3=int32#2,<x_3_3=int32#2,<x_3_3=int32#2,LSL #16
# asm 2: orr >x_3_3=r1,<x_3_3=r1,<x_3_3=r1,LSL #16
orr r1,r1,r1,LSL #16

# qhasm:     x_3_0 >>>= 9
# asm 1: mov >x_3_0=int32#3,<x_3_0=int32#3,ROR #9
# asm 2: mov >x_3_0=r2,<x_3_0=r2,ROR #9
mov r2,r2,ROR #9

# qhasm:     x_3_1 >>>= 9
# asm 1: mov >x_3_1=int32#7,<x_3_1=int32#4,ROR #9
# asm 2: mov >x_3_1=r6,<x_3_1=r3,ROR #9
mov r6,r3,ROR #9

# qhasm:     x_3_2 >>>= 9
# asm 1: mov >x_3_2=int32#4,<x_3_2=int32#6,ROR #9
# asm 2: mov >x_3_2=r3,<x_3_2=r5,ROR #9
mov r3,r5,ROR #9

# qhasm:     x_3_3 >>>= 9
# asm 1: mov >x_3_3=int32#2,<x_3_3=int32#2,ROR #9
# asm 2: mov >x_3_3=r1,<x_3_3=r1,ROR #9
mov r1,r1,ROR #9

# qhasm:     mem16[input_0 + 24] = x_3_0
# asm 1: strh <x_3_0=int32#3,[<input_0=int32#1,#24]
# asm 2: strh <x_3_0=r2,[<input_0=r0,#24]
strh r2,[r0,#24]

# qhasm:     mem16[input_0 + 28] = x_3_2
# asm 1: strh <x_3_2=int32#4,[<input_0=int32#1,#28]
# asm 2: strh <x_3_2=r3,[<input_0=r0,#28]
strh r3,[r0,#28]

# qhasm:     mem16[input_0 + 30] = x_3_3
# asm 1: strh <x_3_3=int32#2,[<input_0=int32#1,#30]
# asm 2: strh <x_3_3=r1,[<input_0=r0,#30]
strh r1,[r0,#30]

# qhasm:     roundcounter = mem16[input_0 + 92]
# asm 1: ldrh >roundcounter=int32#2,[<input_0=int32#1,#92]
# asm 2: ldrh >roundcounter=r1,[<input_0=r0,#92]
ldrh r1,[r0,#92]

# qhasm:     assign r2 r3 to x_0_1 x_2_3 = mem64[input_0 + 0]
# asm 1: ldrd >x_0_1=int32#3,[<input_0=int32#1,#0]
# asm 2: ldrd >x_0_1=r2,[<input_0=r0,#0]
ldrd r2,[r0,#0]

# qhasm:     c1 = 0xeb02eb02
# asm 1: ldr >c1=int32#6,=0xeb02eb02
# asm 2: ldr >c1=r5,=0xeb02eb02
ldr r5,=0xeb02eb02

# qhasm:     c2 = 0xcb16cb16 
# asm 1: ldr >c2=int32#15,=0xcb16cb16
# asm 2: ldr >c2=r14,=0xcb16cb16
ldr r14,=0xcb16cb16

# qhasm:     c1 >>>= roundcounter
# asm 1: ror >c1=int32#6,<c1=int32#6,<roundcounter=int32#2
# asm 2: ror >c1=r5,<c1=r5,<roundcounter=r1
ror r5,r5,r1

# qhasm:     c2 >>>= roundcounter
# asm 1: ror >c2=int32#2,<c2=int32#15,<roundcounter=int32#2
# asm 2: ror >c2=r1,<c2=r14,<roundcounter=r1
ror r1,r14,r1

# qhasm:     y = c2 ^ (x_0_1 unsigned>> 16)
# asm 1: eor >y=int32#15,<c2=int32#2,<x_0_1=int32#3,LSR #16
# asm 2: eor >y=r14,<c2=r1,<x_0_1=r2,LSR #16
eor r14,r1,r2,LSR #16

# qhasm:     x_0_1 ^= c1
# asm 1: eor >x_0_1=int32#3,<x_0_1=int32#3,<c1=int32#6
# asm 2: eor >x_0_1=r2,<x_0_1=r2,<c1=r5
eor r2,r2,r5

# qhasm:     c2 >>>= 30
# asm 1: mov >c2=int32#2,<c2=int32#2,ROR #30
# asm 2: mov >c2=r1,<c2=r1,ROR #30
mov r1,r1,ROR #30

# qhasm:     mem16[input_0 + 0] = x_0_1
# asm 1: strh <x_0_1=int32#3,[<input_0=int32#1,#0]
# asm 2: strh <x_0_1=r2,[<input_0=r0,#0]
strh r2,[r0,#0]

# qhasm:     mem16[input_0 + 2] = y
# asm 1: strh <y=int32#15,[<input_0=int32#1,#2]
# asm 2: strh <y=r14,[<input_0=r0,#2]
strh r14,[r0,#2]

# qhasm:     y = c2 ^ (x_2_3 unsigned>> 16)
# asm 1: eor >y=int32#3,<c2=int32#2,<x_2_3=int32#4,LSR #16
# asm 2: eor >y=r2,<c2=r1,<x_2_3=r3,LSR #16
eor r2,r1,r3,LSR #16

# qhasm:     x_2_3 ^= (c1 >>> 30)
# asm 1: eor >x_2_3=int32#4,<x_2_3=int32#4,<c1=int32#6,ROR #30
# asm 2: eor >x_2_3=r3,<x_2_3=r3,<c1=r5,ROR #30
eor r3,r3,r5,ROR #30

# qhasm:     mem16[input_0 + 4] = x_2_3
# asm 1: strh <x_2_3=int32#4,[<input_0=int32#1,#4]
# asm 2: strh <x_2_3=r3,[<input_0=r0,#4]
strh r3,[r0,#4]

# qhasm:     mem16[input_0 + 6] = y
# asm 1: strh <y=int32#3,[<input_0=int32#1,#6]
# asm 2: strh <y=r2,[<input_0=r0,#6]
strh r2,[r0,#6]

# qhasm:     y = x_1_1 ^ (c2 >>> 30)
# asm 1: eor >y=int32#3,<x_1_1=int32#9,<c2=int32#2,ROR #30
# asm 2: eor >y=r2,<x_1_1=r8,<c2=r1,ROR #30
eor r2,r8,r1,ROR #30

# qhasm:     x_1_0 ^= (c1 >>> 28)
# asm 1: eor >x_1_0=int32#4,<x_1_0=int32#8,<c1=int32#6,ROR #28
# asm 2: eor >x_1_0=r3,<x_1_0=r7,<c1=r5,ROR #28
eor r3,r7,r5,ROR #28

# qhasm:     mem16[input_0 + 8] = x_1_0
# asm 1: strh <x_1_0=int32#4,[<input_0=int32#1,#8]
# asm 2: strh <x_1_0=r3,[<input_0=r0,#8]
strh r3,[r0,#8]

# qhasm:     mem16[input_0 + 10] = y
# asm 1: strh <y=int32#3,[<input_0=int32#1,#10]
# asm 2: strh <y=r2,[<input_0=r0,#10]
strh r2,[r0,#10]

# qhasm:     y = x_1_3 ^ (c2 >>> 28)
# asm 1: eor >y=int32#3,<x_1_3=int32#10,<c2=int32#2,ROR #28
# asm 2: eor >y=r2,<x_1_3=r9,<c2=r1,ROR #28
eor r2,r9,r1,ROR #28

# qhasm:     x = x_1_2 ^ (c1 >>> 26)
# asm 1: eor >x=int32#4,<x_1_2=int32#11,<c1=int32#6,ROR #26
# asm 2: eor >x=r3,<x_1_2=r10,<c1=r5,ROR #26
eor r3,r10,r5,ROR #26

# qhasm:     mem16[input_0 + 12] = x
# asm 1: strh <x=int32#4,[<input_0=int32#1,#12]
# asm 2: strh <x=r3,[<input_0=r0,#12]
strh r3,[r0,#12]

# qhasm:     mem16[input_0 + 14] = y
# asm 1: strh <y=int32#3,[<input_0=int32#1,#14]
# asm 2: strh <y=r2,[<input_0=r0,#14]
strh r2,[r0,#14]

# qhasm:     x_12_13 = mem32[input_0 + 24]
# asm 1: ldr >x_12_13=int32#3,[<input_0=int32#1,#24]
# asm 2: ldr >x_12_13=r2,[<input_0=r0,#24]
ldr r2,[r0,#24]

# qhasm:     x_14_15 = mem32[input_0 + 28]
# asm 1: ldr >x_14_15=int32#4,[<input_0=int32#1,#28]
# asm 2: ldr >x_14_15=r3,[<input_0=r0,#28]
ldr r3,[r0,#28]

# qhasm:     y = x_2_1 ^ (c2 >>> 26)
# asm 1: eor >y=int32#5,<x_2_1=int32#5,<c2=int32#2,ROR #26
# asm 2: eor >y=r4,<x_2_1=r4,<c2=r1,ROR #26
eor r4,r4,r1,ROR #26

# qhasm:     x = x_2_0 ^ (c1 >>> 24)
# asm 1: eor >x=int32#8,<x_2_0=int32#14,<c1=int32#6,ROR #24
# asm 2: eor >x=r7,<x_2_0=r13,<c1=r5,ROR #24
eor r7,r13,r5,ROR #24

# qhasm:     mem16[input_0 + 16] = x
# asm 1: strh <x=int32#8,[<input_0=int32#1,#16]
# asm 2: strh <x=r7,[<input_0=r0,#16]
strh r7,[r0,#16]

# qhasm:     mem16[input_0 + 18] = y
# asm 1: strh <y=int32#5,[<input_0=int32#1,#18]
# asm 2: strh <y=r4,[<input_0=r0,#18]
strh r4,[r0,#18]

# qhasm:     y = mx_2_3 ^ (c2 >>> 24)
# asm 1: eor >y=int32#5,<mx_2_3=int32#13,<c2=int32#2,ROR #24
# asm 2: eor >y=r4,<mx_2_3=r12,<c2=r1,ROR #24
eor r4,r12,r1,ROR #24

# qhasm:     x = x_2_2 ^ (c1 >>> 22)
# asm 1: eor >x=int32#8,<x_2_2=int32#12,<c1=int32#6,ROR #22
# asm 2: eor >x=r7,<x_2_2=r11,<c1=r5,ROR #22
eor r7,r11,r5,ROR #22

# qhasm:     mem16[input_0 + 20] = x
# asm 1: strh <x=int32#8,[<input_0=int32#1,#20]
# asm 2: strh <x=r7,[<input_0=r0,#20]
strh r7,[r0,#20]

# qhasm:     mem16[input_0 + 22] = y
# asm 1: strh <y=int32#5,[<input_0=int32#1,#22]
# asm 2: strh <y=r4,[<input_0=r0,#22]
strh r4,[r0,#22]

# qhasm:     y = x_3_1 ^ (c2 >>> 22)
# asm 1: eor >y=int32#5,<x_3_1=int32#7,<c2=int32#2,ROR #22
# asm 2: eor >y=r4,<x_3_1=r6,<c2=r1,ROR #22
eor r4,r6,r1,ROR #22

# qhasm:     x = x_12_13 ^ (c1 >>> 20)
# asm 1: eor >x=int32#3,<x_12_13=int32#3,<c1=int32#6,ROR #20
# asm 2: eor >x=r2,<x_12_13=r2,<c1=r5,ROR #20
eor r2,r2,r5,ROR #20

# qhasm:     c2 >>>= 20
# asm 1: mov >c2=int32#2,<c2=int32#2,ROR #20
# asm 2: mov >c2=r1,<c2=r1,ROR #20
mov r1,r1,ROR #20

# qhasm:     mem16[input_0 + 24] = x
# asm 1: strh <x=int32#3,[<input_0=int32#1,#24]
# asm 2: strh <x=r2,[<input_0=r0,#24]
strh r2,[r0,#24]

# qhasm:     mem16[input_0 + 26] = y
# asm 1: strh <y=int32#5,[<input_0=int32#1,#26]
# asm 2: strh <y=r4,[<input_0=r0,#26]
strh r4,[r0,#26]

# qhasm:     roundcounter = mem16[input_0 + 92]
# asm 1: ldrh >roundcounter=int32#3,[<input_0=int32#1,#92]
# asm 2: ldrh >roundcounter=r2,[<input_0=r0,#92]
ldrh r2,[r0,#92]

# qhasm:     y = c2 ^ (x_14_15 unsigned>> 16)
# asm 1: eor >y=int32#2,<c2=int32#2,<x_14_15=int32#4,LSR #16
# asm 2: eor >y=r1,<c2=r1,<x_14_15=r3,LSR #16
eor r1,r1,r3,LSR #16

# qhasm:     x = x_14_15 ^ (c1 >>> 18)
# asm 1: eor >x=int32#4,<x_14_15=int32#4,<c1=int32#6,ROR #18
# asm 2: eor >x=r3,<x_14_15=r3,<c1=r5,ROR #18
eor r3,r3,r5,ROR #18

# qhasm:     mem16[input_0 + 28] = x
# asm 1: strh <x=int32#4,[<input_0=int32#1,#28]
# asm 2: strh <x=r3,[<input_0=r0,#28]
strh r3,[r0,#28]

# qhasm:     mem16[input_0 + 30] = y
# asm 1: strh <y=int32#2,[<input_0=int32#1,#30]
# asm 2: strh <y=r1,[<input_0=r0,#30]
strh r1,[r0,#30]

# qhasm:     roundcounter -= 2
# asm 1: sub >roundcounter=int32#5,<roundcounter=int32#3,#2
# asm 2: sub >roundcounter=r4,<roundcounter=r2,#2
sub r4,r2,#2

# qhasm:     =? roundcounter - 16
# asm 1: cmp <roundcounter=int32#5,#16
# asm 2: cmp <roundcounter=r4,#16
cmp r4,#16

# qhasm:     goto proest_beginning if !=
bne ._proest_beginning

# qhasm:     offset = input_0 + 52
# asm 1: add >offset=int32#2,<input_0=int32#1,#52
# asm 2: add >offset=r1,<input_0=r0,#52
add r1,r0,#52

# qhasm:     loadsp[input_0 + 88]
# asm 1: ldr sp,[<input_0=int32#1,#88]
# asm 2: ldr sp,[<input_0=r0,#88]
ldr sp,[r0,#88]

# qhasm:     caller_r4 caller_r5 caller_r6 caller_r7 caller_r8 caller_r9 caller_r10 caller_r11 caller_r14 = mem288[offset]
# asm 1: ldm <offset=int32#2, {r4, r5, r6, r7, r8, r9, r10, r11, r14}
# asm 2: ldm <offset=r1, {r4, r5, r6, r7, r8, r9, r10, r11, r14}
ldm r1, {r4, r5, r6, r7, r8, r9, r10, r11, r14}

# qhasm: return
add sp,sp,#0
bx lr
