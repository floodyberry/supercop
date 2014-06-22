
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

# qhasm: int32 adr2	

# qhasm: int32 adr3	

# qhasm: int32 adr4

# qhasm: int32 adr5

# qhasm: int32 count

# qhasm: int32 idx

# qhasm: int32 shf

# qhasm: int32 bit

# qhasm: int32 swap

# qhasm: int32 prevbit

# qhasm: int128 c

# qhasm: int128 sum0

# qhasm: int128 sum1

# qhasm: int128 dif0

# qhasm: int128 dif1

# qhasm: int128 neg1

# qhasm: int128 neg2

# qhasm: int128 copy

# qhasm: int128 suma0

# qhasm: int128 difa0

# qhasm: int128 suma1

# qhasm: int128 difa1

# qhasm: int128 rst0

# qhasm: int128 rst1

# qhasm: int128 rst2

# qhasm: int128 rst3

# qhasm: int128 rst4

# qhasm: int128 a0

# qhasm: int128 a1

# qhasm: int128 a2

# qhasm: int128 a3

# qhasm: int128 a4

# qhasm: int128 _2a0

# qhasm: int128 _2a1

# qhasm: int128 _2a2

# qhasm: int128 _2a3

# qhasm: int128 _2a4

# qhasm: int128 b0

# qhasm: int128 b1

# qhasm: int128 b2

# qhasm: int128 b3

# qhasm: int128 b4

# qhasm: int128 _2b0

# qhasm: int128 _2b1

# qhasm: int128 _2b2

# qhasm: int128 _2b3

# qhasm: int128 _2b4

# qhasm: int128 c0

# qhasm: int128 h0

# qhasm: int128 h1

# qhasm: int128 h2

# qhasm: int128 h3

# qhasm: int128 h4

# qhasm: int128 h5

# qhasm: int128 k0

# qhasm: int128 k1

# qhasm: int128 k2

# qhasm: int128 k3

# qhasm: int128 k4

# qhasm: int128 k5

# qhasm: int128 _2k0

# qhasm: int128 _2k2

# qhasm: int128 _2k4

# qhasm: int128 p0

# qhasm: int128 p1

# qhasm: int128 p2

# qhasm: int128 p3

# qhasm: int128 p4

# qhasm: int128 p5

# qhasm: int128 q0

# qhasm: int128 q1

# qhasm: int128 q2

# qhasm: int128 q3

# qhasm: int128 q4

# qhasm: int128 q5

# qhasm: int128 n0

# qhasm: int128 n1

# qhasm: int128 n2

# qhasm: int128 na0

# qhasm: int128 na1

# qhasm: int128 t

# qhasm: int128 t0

# qhasm: int128 t1

# qhasm: int128 t2

# qhasm: int128 t3

# qhasm: int128 t4

# qhasm: int128 mask25

# qhasm: int128 mask26

# qhasm: int128 _27

# qhasm: int128 _28

# qhasm: int128 _29_28

# qhasm: int128 _28_27_28_27

# qhasm: qpushenter loop
.align 4
.global _loop
.global loop
.type _loop STT_FUNC
.type loop STT_FUNC
_loop:
loop:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#64
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

# qhasm: count = 0xff
# asm 1: ldr >count=int32#5,=0xff
# asm 2: ldr >count=r4,=0xff
ldr r4,=0xff

# qhasm: prevbit = 0
# asm 1: ldr >prevbit=int32#6,=0
# asm 2: ldr >prevbit=r5,=0
ldr r5,=0

# qhasm: count ^= 0x5
# asm 1: eor >count=int32#5,<count=int32#5,#0x5
# asm 2: eor >count=r4,<count=r4,#0x5
eor r4,r4,#0x5

# qhasm: looptop:
._looptop:

# qhasm: adr4 = input_4
# asm 1: ldr >adr4=int32#7,<input_4=stack32#arg17
# asm 2: ldr >adr4=r6,<input_4=[r12,#64]
ldr r6,[r12,#64]

# qhasm: 		adr1 = input_1 + 16
# asm 1: add >adr1=int32#8,<input_1=int32#2,#16
# asm 2: add >adr1=r7,<input_1=r1,#16
add r7,r1,#16

# qhasm: 		adr0 = input_1 + 64
# asm 1: add >adr0=int32#9,<input_1=int32#2,#64
# asm 2: add >adr0=r8,<input_1=r1,#64
add r8,r1,#64

# qhasm: idx = (count unsigned>> 5)
# asm 1: mov >idx=int32#10,<count=int32#5,LSR #5
# asm 2: mov >idx=r9,<count=r4,LSR #5
mov r9,r4,LSR #5

# qhasm:   shf = count & 0x1f
# asm 1: and >shf=int32#11,<count=int32#5,#0x1f
# asm 2: and >shf=r10,<count=r4,#0x1f
and r10,r4,#0x1f

# qhasm: idx <<= 2
# asm 1: mov >idx=int32#10,<idx=int32#10,LSL #2
# asm 2: mov >idx=r9,<idx=r9,LSL #2
mov r9,r9,LSL #2

# qhasm: adr4 += idx
# asm 1: add >adr4=int32#7,<adr4=int32#7,<idx=int32#10
# asm 2: add >adr4=r6,<adr4=r6,<idx=r9
add r6,r6,r9

# qhasm: 		adr2 = input_1
# asm 1: mov >adr2=int32#10,<input_1=int32#2
# asm 2: mov >adr2=r9,<input_1=r1
mov r9,r1

# qhasm: 		adr3 = input_1 + 48
# asm 1: add >adr3=int32#12,<input_1=int32#2,#48
# asm 2: add >adr3=r11,<input_1=r1,#48
add r11,r1,#48

# qhasm: bit = mem32[adr4]
# asm 1: ldr >bit=int32#7,[<adr4=int32#7]
# asm 2: ldr >bit=r6,[<adr4=r6]
ldr r6,[r6]

# qhasm: bit unsigned>> = shf	
# asm 1: mov >bit=int32#7,<bit=int32#7,LSR <shf=int32#11
# asm 2: mov >bit=r6,<bit=r6,LSR <shf=r10
mov r6,r6,LSR r10

# qhasm: bit &= 0x1		
# asm 1: and >bit=int32#7,<bit=int32#7,#0x1
# asm 2: and >bit=r6,<bit=r6,#0x1
and r6,r6,#0x1

# qhasm: swap = bit ^ prevbit	
# asm 1: eor >swap=int32#11,<bit=int32#7,<prevbit=int32#6
# asm 2: eor >swap=r10,<bit=r6,<prevbit=r5
eor r10,r6,r5

# qhasm: prevbit = bit 		
# asm 1: mov >prevbit=int32#6,<bit=int32#7
# asm 2: mov >prevbit=r5,<bit=r6
mov r5,r6

# qhasm: bit = swap ^ 0x1
# asm 1: eor >bit=int32#7,<swap=int32#11,#0x1
# asm 2: eor >bit=r6,<swap=r10,#0x1
eor r6,r10,#0x1

# qhasm: bit -= 1
# asm 1: sub >bit=int32#7,<bit=int32#7,#1
# asm 2: sub >bit=r6,<bit=r6,#1
sub r6,r6,#1

# qhasm: b1 aligned = mem128[adr1]
# asm 1: vld1.8 {>b1=reg128#1%bot->b1=reg128#1%top},[<adr1=int32#8,: 128]
# asm 2: vld1.8 {>b1=d0->b1=d1},[<adr1=r7,: 128]
vld1.8 {d0-d1},[r7,: 128]

# qhasm: b4 aligned = mem128[adr0]	
# asm 1: vld1.8 {>b4=reg128#2%bot->b4=reg128#2%top},[<adr0=int32#9,: 128]
# asm 2: vld1.8 {>b4=d2->b4=d3},[<adr0=r8,: 128]
vld1.8 {d2-d3},[r8,: 128]

# qhasm: 4x sum1 = b1 + b4
# asm 1: vadd.i32 >sum1=reg128#3,<b1=reg128#1,<b4=reg128#2
# asm 2: vadd.i32 >sum1=q2,<b1=q0,<b4=q1
vadd.i32 q2,q0,q1

# qhasm: b0 aligned = mem128[adr2]	
# asm 1: vld1.8 {>b0=reg128#4%bot->b0=reg128#4%top},[<adr2=int32#10,: 128]
# asm 2: vld1.8 {>b0=d6->b0=d7},[<adr2=r9,: 128]
vld1.8 {d6-d7},[r9,: 128]

# qhasm: 	adr0 = input_0 + 16
# asm 1: add >adr0=int32#8,<input_0=int32#1,#16
# asm 2: add >adr0=r7,<input_0=r0,#16
add r7,r0,#16

# qhasm: 	adr1 = input_0 + 64
# asm 1: add >adr1=int32#9,<input_0=int32#1,#64
# asm 2: add >adr1=r8,<input_0=r0,#64
add r8,r0,#64

# qhasm: adr2 = input_1 + 32
# asm 1: add >adr2=int32#10,<input_1=int32#2,#32
# asm 2: add >adr2=r9,<input_1=r1,#32
add r9,r1,#32

# qhasm: 4x dif1 = b1 - b4
# asm 1: vsub.i32 >dif1=reg128#1,<b1=reg128#1,<b4=reg128#2
# asm 2: vsub.i32 >dif1=q0,<b1=q0,<b4=q1
vsub.i32 q0,q0,q1

# qhasm: b3 aligned = mem128[adr3]	
# asm 1: vld1.8 {>b3=reg128#2%bot->b3=reg128#2%top},[<adr3=int32#12,: 128]
# asm 2: vld1.8 {>b3=d2->b3=d3},[<adr3=r11,: 128]
vld1.8 {d2-d3},[r11,: 128]

# qhasm: 4x sum0 = b0 + b3
# asm 1: vadd.i32 >sum0=reg128#5,<b0=reg128#4,<b3=reg128#2
# asm 2: vadd.i32 >sum0=q4,<b0=q3,<b3=q1
vadd.i32 q4,q3,q1

# qhasm: 	a1 aligned = mem128[adr0]
# asm 1: vld1.8 {>a1=reg128#6%bot->a1=reg128#6%top},[<adr0=int32#8,: 128]
# asm 2: vld1.8 {>a1=d10->a1=d11},[<adr0=r7,: 128]
vld1.8 {d10-d11},[r7,: 128]

# qhasm: 4x dif0 = b0 - b3
# asm 1: vsub.i32 >dif0=reg128#2,<b0=reg128#4,<b3=reg128#2
# asm 2: vsub.i32 >dif0=q1,<b0=q3,<b3=q1
vsub.i32 q1,q3,q1

# qhasm: 	a4 aligned = mem128[adr1]	
# asm 1: vld1.8 {>a4=reg128#4%bot->a4=reg128#4%top},[<adr1=int32#9,: 128]
# asm 2: vld1.8 {>a4=d6->a4=d7},[<adr1=r8,: 128]
vld1.8 {d6-d7},[r8,: 128]

# qhasm: 	adr0 = input_0
# asm 1: mov >adr0=int32#8,<input_0=int32#1
# asm 2: mov >adr0=r7,<input_0=r0
mov r7,r0

# qhasm: 	adr1 = input_0 + 32	
# asm 1: add >adr1=int32#9,<input_0=int32#1,#32
# asm 2: add >adr1=r8,<input_0=r0,#32
add r8,r0,#32

# qhasm: sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2]sum1[1]dif1[1]sum1[3]dif1[3]	
# asm 1: vtrn.32 <sum1=reg128#3,<dif1=reg128#1
# asm 2: vtrn.32 <sum1=q2,<dif1=q0
vtrn.32 q2,q0

# qhasm: b2 aligned = mem128[adr2]	
# asm 1: vld1.8 {>b2=reg128#7%bot->b2=reg128#7%top},[<adr2=int32#10,: 128]
# asm 2: vld1.8 {>b2=d12->b2=d13},[<adr2=r9,: 128]
vld1.8 {d12-d13},[r9,: 128]

# qhasm: 	a0 aligned = mem128[adr0]
# asm 1: vld1.8 {>a0=reg128#8%bot->a0=reg128#8%top},[<adr0=int32#8,: 128]
# asm 2: vld1.8 {>a0=d14->a0=d15},[<adr0=r7,: 128]
vld1.8 {d14-d15},[r7,: 128]

# qhasm: 	a2 aligned = mem128[adr1]; adr1 += 16	
# asm 1: vld1.8 {>a2=reg128#9%bot->a2=reg128#9%top},[<adr1=int32#9,: 128]!
# asm 2: vld1.8 {>a2=d16->a2=d17},[<adr1=r8,: 128]!
vld1.8 {d16-d17},[r8,: 128]!

# qhasm: 	a3 aligned = mem128[adr1]		
# asm 1: vld1.8 {>a3=reg128#10%bot->a3=reg128#10%top},[<adr1=int32#9,: 128]
# asm 2: vld1.8 {>a3=d18->a3=d19},[<adr1=r8,: 128]
vld1.8 {d18-d19},[r8,: 128]

# qhasm: 	4x suma1 = a1 + a4
# asm 1: vadd.i32 >suma1=reg128#11,<a1=reg128#6,<a4=reg128#4
# asm 2: vadd.i32 >suma1=q10,<a1=q5,<a4=q3
vadd.i32 q10,q5,q3

# qhasm: sum1 b2 = sum1[0]b2[0] sum1[1]b2[1]
# asm 1: vswp <b2=reg128#7%bot,<sum1=reg128#3%top
# asm 2: vswp <b2=d12,<sum1=d5
vswp d12,d5

# qhasm: 	4x difa1 = a1 - a4
# asm 1: vsub.i32 >difa1=reg128#4,<a1=reg128#6,<a4=reg128#4
# asm 2: vsub.i32 >difa1=q3,<a1=q5,<a4=q3
vsub.i32 q3,q5,q3

# qhasm: dif1 b2 = dif1[0]b2[1] b2[0]dif1[1]
# asm 1: vswp <b2=reg128#7%top,<dif1=reg128#1%top
# asm 2: vswp <b2=d13,<dif1=d1
vswp d13,d1

# qhasm: sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2]sum0[1]dif0[1]sum0[3]dif0[3]			
# asm 1: vtrn.32 <sum0=reg128#5,<dif0=reg128#2
# asm 2: vtrn.32 <sum0=q4,<dif0=q1
vtrn.32 q4,q1

# qhasm: 4x b1 = sum1 + dif1									
# asm 1: vadd.i32 >b1=reg128#6,<sum1=reg128#3,<dif1=reg128#1
# asm 2: vadd.i32 >b1=q5,<sum1=q2,<dif1=q0
vadd.i32 q5,q2,q0

# qhasm: 	suma1 difa1 = suma1[0]difa1[0]suma1[2]difa1[2] suma1[1]difa1[1]suma1[3]difa1[3]	
# asm 1: vtrn.32 <suma1=reg128#11,<difa1=reg128#4
# asm 2: vtrn.32 <suma1=q10,<difa1=q3
vtrn.32 q10,q3

# qhasm: 4x b4 = sum1 - dif1									
# asm 1: vsub.i32 >b4=reg128#1,<sum1=reg128#3,<dif1=reg128#1
# asm 2: vsub.i32 >b4=q0,<sum1=q2,<dif1=q0
vsub.i32 q0,q2,q0

# qhasm: 	4x suma0 = a0 + a3
# asm 1: vadd.i32 >suma0=reg128#3,<a0=reg128#8,<a3=reg128#10
# asm 2: vadd.i32 >suma0=q2,<a0=q7,<a3=q9
vadd.i32 q2,q7,q9

# qhasm: b1 b2 = b2[0]b1[1] b1[0]b2[1]	
# asm 1: vswp <b2=reg128#7%bot,<b1=reg128#6%bot
# asm 2: vswp <b2=d12,<b1=d10
vswp d12,d10

# qhasm: 4x b0 = sum0 + dif0
# asm 1: vadd.i32 >b0=reg128#12,<sum0=reg128#5,<dif0=reg128#2
# asm 2: vadd.i32 >b0=q11,<sum0=q4,<dif0=q1
vadd.i32 q11,q4,q1

# qhasm: 	suma1 a2 = suma1[0]a2[0] suma1[1]a2[1]
# asm 1: vswp <a2=reg128#9%bot,<suma1=reg128#11%top
# asm 2: vswp <a2=d16,<suma1=d21
vswp d16,d21

# qhasm: 4x b3 = sum0 - dif0
# asm 1: vsub.i32 >b3=reg128#2,<sum0=reg128#5,<dif0=reg128#2
# asm 2: vsub.i32 >b3=q1,<sum0=q4,<dif0=q1
vsub.i32 q1,q4,q1

# qhasm: b2 b4 = b2[0]b4[0] b2[1]b4[1]
# asm 1: vswp <b4=reg128#1%bot,<b2=reg128#7%top
# asm 2: vswp <b4=d0,<b2=d13
vswp d0,d13

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#8,<input_5=stack32#arg18
# asm 2: ldr >adr5=r7,<input_5=[r12,#68]
ldr r7,[r12,#68]

# qhasm: b1 b4 = b1[0]b1[1]b1[2]b4[2] b4[0]b4[1]b1[3]b4[3]
# asm 1: vtrn.32 <b1=reg128#6%top,<b4=reg128#1%top
# asm 2: vtrn.32 <b1=d11,<b4=d1
vtrn.32 d11,d1

# qhasm: 	4x difa0 = a0 - a3
# asm 1: vsub.i32 >difa0=reg128#5,<a0=reg128#8,<a3=reg128#10
# asm 2: vsub.i32 >difa0=q4,<a0=q7,<a3=q9
vsub.i32 q4,q7,q9

# qhasm: adr5 += 48
# asm 1: add >adr5=int32#8,<adr5=int32#8,#48
# asm 2: add >adr5=r7,<adr5=r7,#48
add r7,r7,#48

# qhasm: 	a2 difa1 = a2[0]difa1[1] difa1[0]a2[1]
# asm 1: vswp <difa1=reg128#4%top,<a2=reg128#9%top
# asm 2: vswp <difa1=d7,<a2=d17
vswp d7,d17

# qhasm: 4x sum1 = b1 + b4
# asm 1: vadd.i32 >sum1=reg128#8,<b1=reg128#6,<b4=reg128#1
# asm 2: vadd.i32 >sum1=q7,<b1=q5,<b4=q0
vadd.i32 q7,q5,q0

# qhasm: 4x dif1 = b1 - b4
# asm 1: vsub.i32 >dif1=reg128#1,<b1=reg128#6,<b4=reg128#1
# asm 2: vsub.i32 >dif1=q0,<b1=q5,<b4=q0
vsub.i32 q0,q5,q0

# qhasm: _29_28 aligned = mem128[adr5]
# asm 1: vld1.8 {>_29_28=reg128#6%bot->_29_28=reg128#6%top},[<adr5=int32#8,: 128]
# asm 2: vld1.8 {>_29_28=d10->_29_28=d11},[<adr5=r7,: 128]
vld1.8 {d10-d11},[r7,: 128]

# qhasm: adr5 -= 16
# asm 1: sub >adr5=int32#8,<adr5=int32#8,#16
# asm 2: sub >adr5=r7,<adr5=r7,#16
sub r7,r7,#16

# qhasm: adr0 = input_1
# asm 1: mov >adr0=int32#9,<input_1=int32#2
# asm 2: mov >adr0=r8,<input_1=r1
mov r8,r1

# qhasm: adr1 = input_1 + 48
# asm 1: add >adr1=int32#10,<input_1=int32#2,#48
# asm 2: add >adr1=r9,<input_1=r1,#48
add r9,r1,#48

# qhasm: adr2 = input_1 + 32
# asm 1: add >adr2=int32#11,<input_1=int32#2,#32
# asm 2: add >adr2=r10,<input_1=r1,#32
add r10,r1,#32

# qhasm: 4x b0 += _29_28
# asm 1: vadd.i32 >b0=reg128#10,<b0=reg128#12,<_29_28=reg128#6
# asm 2: vadd.i32 >b0=q9,<b0=q11,<_29_28=q5
vadd.i32 q9,q11,q5

# qhasm: _28    aligned = mem128[adr5]
# asm 1: vld1.8 {>_28=reg128#12%bot->_28=reg128#12%top},[<adr5=int32#8,: 128]
# asm 2: vld1.8 {>_28=d22->_28=d23},[<adr5=r7,: 128]
vld1.8 {d22-d23},[r7,: 128]

# qhasm: 4x b3 += _29_28
# asm 1: vadd.i32 >b3=reg128#2,<b3=reg128#2,<_29_28=reg128#6
# asm 2: vadd.i32 >b3=q1,<b3=q1,<_29_28=q5
vadd.i32 q1,q1,q5

# qhasm: sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]	
# asm 1: vswp <dif1=reg128#1%bot,<sum1=reg128#8%top
# asm 2: vswp <dif1=d0,<sum1=d15
vswp d0,d15

# qhasm: 4x dif1 += _28					
# asm 1: vadd.i32 >dif1=reg128#1,<dif1=reg128#1,<_28=reg128#12
# asm 2: vadd.i32 >dif1=q0,<dif1=q0,<_28=q11
vadd.i32 q0,q0,q11

# qhasm: b2 sum1 = b2[0]sum1[0] b2[1]sum1[1]
# asm 1: vswp <sum1=reg128#8%bot,<b2=reg128#7%top
# asm 2: vswp <sum1=d14,<b2=d13
vswp d14,d13

# qhasm: 4x b2   += _29_28
# asm 1: vadd.i32 >b2=reg128#7,<b2=reg128#7,<_29_28=reg128#6
# asm 2: vadd.i32 >b2=q6,<b2=q6,<_29_28=q5
vadd.i32 q6,q6,q5

# qhasm: mem128[adr0] aligned = b0	
# asm 1: vst1.8 {<b0=reg128#10%bot-<b0=reg128#10%top},[<adr0=int32#9,: 128]
# asm 2: vst1.8 {<b0=d18-<b0=d19},[<adr0=r8,: 128]
vst1.8 {d18-d19},[r8,: 128]

# qhasm: 4x sum1 += _29_28
# asm 1: vadd.i32 >sum1=reg128#8,<sum1=reg128#8,<_29_28=reg128#6
# asm 2: vadd.i32 >sum1=q7,<sum1=q7,<_29_28=q5
vadd.i32 q7,q7,q5

# qhasm: mem128[adr1] aligned = b3
# asm 1: vst1.8 {<b3=reg128#2%bot-<b3=reg128#2%top},[<adr1=int32#10,: 128]
# asm 2: vst1.8 {<b3=d2-<b3=d3},[<adr1=r9,: 128]
vst1.8 {d2-d3},[r9,: 128]

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#8,<input_5=stack32#arg18
# asm 2: ldr >adr5=r7,<input_5=[r12,#68]
ldr r7,[r12,#68]

# qhasm: adr3 = input_1 + 16
# asm 1: add >adr3=int32#9,<input_1=int32#2,#16
# asm 2: add >adr3=r8,<input_1=r1,#16
add r8,r1,#16

# qhasm: adr4 = input_1 + 64
# asm 1: add >adr4=int32#10,<input_1=int32#2,#64
# asm 2: add >adr4=r9,<input_1=r1,#64
add r9,r1,#64

# qhasm: 4x a1 = suma1 + difa1
# asm 1: vadd.i32 >a1=reg128#2,<suma1=reg128#11,<difa1=reg128#4
# asm 2: vadd.i32 >a1=q1,<suma1=q10,<difa1=q3
vadd.i32 q1,q10,q3

# qhasm: mem128[adr2] aligned = dif1	
# asm 1: vst1.8 {<dif1=reg128#1%bot-<dif1=reg128#1%top},[<adr2=int32#11,: 128]
# asm 2: vst1.8 {<dif1=d0-<dif1=d1},[<adr2=r10,: 128]
vst1.8 {d0-d1},[r10,: 128]

# qhasm: 4x a4 = suma1 - difa1
# asm 1: vsub.i32 >a4=reg128#1,<suma1=reg128#11,<difa1=reg128#4
# asm 2: vsub.i32 >a4=q0,<suma1=q10,<difa1=q3
vsub.i32 q0,q10,q3

# qhasm: mem128[adr3] aligned = b2	
# asm 1: vst1.8 {<b2=reg128#7%bot-<b2=reg128#7%top},[<adr3=int32#9,: 128]
# asm 2: vst1.8 {<b2=d12-<b2=d13},[<adr3=r8,: 128]
vst1.8 {d12-d13},[r8,: 128]

# qhasm: suma0 difa0 = suma0[0]difa0[0]suma0[2]difa0[2] suma0[1]difa0[1]suma0[3]difa0[3]
# asm 1: vtrn.32 <suma0=reg128#3,<difa0=reg128#5
# asm 2: vtrn.32 <suma0=q2,<difa0=q4
vtrn.32 q2,q4

# qhasm: mem128[adr4] aligned = sum1	
# asm 1: vst1.8 {<sum1=reg128#8%bot-<sum1=reg128#8%top},[<adr4=int32#10,: 128]
# asm 2: vst1.8 {<sum1=d14-<sum1=d15},[<adr4=r9,: 128]
vst1.8 {d14-d15},[r9,: 128]

# qhasm: 4x a0 = suma0 + difa0
# asm 1: vadd.i32 >a0=reg128#4,<suma0=reg128#3,<difa0=reg128#5
# asm 2: vadd.i32 >a0=q3,<suma0=q2,<difa0=q4
vadd.i32 q3,q2,q4

# qhasm: a1 a2 = a2[0]a1[1] a1[0]a2[1]
# asm 1: vswp <a2=reg128#9%bot,<a1=reg128#2%bot
# asm 2: vswp <a2=d16,<a1=d2
vswp d16,d2

# qhasm: 4x a3 = suma0 - difa0
# asm 1: vsub.i32 >a3=reg128#3,<suma0=reg128#3,<difa0=reg128#5
# asm 2: vsub.i32 >a3=q2,<suma0=q2,<difa0=q4
vsub.i32 q2,q2,q4

# qhasm: a2 a4 = a2[0]a4[0] a2[1]a4[1]
# asm 1: vswp <a4=reg128#1%bot,<a2=reg128#9%top
# asm 2: vswp <a4=d0,<a2=d17
vswp d0,d17

# qhasm: a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]
# asm 1: vtrn.32 <a1=reg128#2%top,<a4=reg128#1%top
# asm 2: vtrn.32 <a1=d3,<a4=d1
vtrn.32 d3,d1

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#9,<input_0=int32#1,#48
# asm 2: add >adr0=r8,<input_0=r0,#48
add r8,r0,#48

# qhasm: 	adr1 = input_1
# asm 1: mov >adr1=int32#10,<input_1=int32#2
# asm 2: mov >adr1=r9,<input_1=r1
mov r9,r1

# qhasm: 4x suma1 = a1 + a4		
# asm 1: vadd.i32 >suma1=reg128#5,<a1=reg128#2,<a4=reg128#1
# asm 2: vadd.i32 >suma1=q4,<a1=q1,<a4=q0
vadd.i32 q4,q1,q0

# qhasm: mask25 aligned = mem128[adr5]; adr5+=16
# asm 1: vld1.8 {>mask25=reg128#7%bot->mask25=reg128#7%top},[<adr5=int32#8,: 128]!
# asm 2: vld1.8 {>mask25=d12->mask25=d13},[<adr5=r7,: 128]!
vld1.8 {d12-d13},[r7,: 128]!

# qhasm: 4x difa1 = a1 - a4
# asm 1: vsub.i32 >difa1=reg128#1,<a1=reg128#2,<a4=reg128#1
# asm 2: vsub.i32 >difa1=q0,<a1=q1,<a4=q0
vsub.i32 q0,q1,q0

# qhasm: mask26 aligned = mem128[adr5]; adr5+=16
# asm 1: vld1.8 {>mask26=reg128#2%bot->mask26=reg128#2%top},[<adr5=int32#8,: 128]!
# asm 2: vld1.8 {>mask26=d2->mask26=d3},[<adr5=r7,: 128]!
vld1.8 {d2-d3},[r7,: 128]!

# qhasm: 	b0 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b0=reg128#8%bot->b0=reg128#8%top},[<adr1=int32#10,: 128]!
# asm 2: vld1.8 {>b0=d14->b0=d15},[<adr1=r9,: 128]!
vld1.8 {d14-d15},[r9,: 128]!

# qhasm: a2 suma1 = a2[0]suma1[0] a2[1]suma1[1]	
# asm 1: vswp <suma1=reg128#5%bot,<a2=reg128#9%top
# asm 2: vswp <suma1=d8,<a2=d17
vswp d8,d17

# qhasm: 4x a3 = a3 + _29_28
# asm 1: vadd.i32 >a3=reg128#3,<a3=reg128#3,<_29_28=reg128#6
# asm 2: vadd.i32 >a3=q2,<a3=q2,<_29_28=q5
vadd.i32 q2,q2,q5

# qhasm: suma1 difa1 = suma1[0]difa1[0] suma1[1]difa1[1]
# asm 1: vswp <difa1=reg128#1%bot,<suma1=reg128#5%top
# asm 2: vswp <difa1=d0,<suma1=d9
vswp d0,d9

# qhasm: 4x a0 = a0 + _29_28
# asm 1: vadd.i32 >a0=reg128#4,<a0=reg128#4,<_29_28=reg128#6
# asm 2: vadd.i32 >a0=q3,<a0=q3,<_29_28=q5
vadd.i32 q3,q3,q5

# qhasm: 4x a4 = suma1 + _29_28
# asm 1: vadd.i32 >a4=reg128#5,<suma1=reg128#5,<_29_28=reg128#6
# asm 2: vadd.i32 >a4=q4,<suma1=q4,<_29_28=q5
vadd.i32 q4,q4,q5

# qhasm: 4x a1 = a2 + _29_28
# asm 1: vadd.i32 >a1=reg128#6,<a2=reg128#9,<_29_28=reg128#6
# asm 2: vadd.i32 >a1=q5,<a2=q8,<_29_28=q5
vadd.i32 q5,q8,q5

# qhasm: mem128[adr0] aligned = a3; adr0+=16
# asm 1: vst1.8 {<a3=reg128#3%bot-<a3=reg128#3%top},[<adr0=int32#9,: 128]!
# asm 2: vst1.8 {<a3=d4-<a3=d5},[<adr0=r8,: 128]!
vst1.8 {d4-d5},[r8,: 128]!

# qhasm: 4x a2 = difa1 + _28
# asm 1: vadd.i32 >a2=reg128#1,<difa1=reg128#1,<_28=reg128#12
# asm 2: vadd.i32 >a2=q0,<difa1=q0,<_28=q11
vadd.i32 q0,q0,q11

# qhasm: mem128[adr0] aligned = a4; adr0+=16	
# asm 1: vst1.8 {<a4=reg128#5%bot-<a4=reg128#5%top},[<adr0=int32#9,: 128]!
# asm 2: vst1.8 {<a4=d8-<a4=d9},[<adr0=r8,: 128]!
vst1.8 {d8-d9},[r8,: 128]!

# qhasm: 	adr0 = input_1 + 48
# asm 1: add >adr0=int32#8,<input_1=int32#2,#48
# asm 2: add >adr0=r7,<input_1=r1,#48
add r7,r1,#48

# qhasm: 	b1 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b1=reg128#3%bot->b1=reg128#3%top},[<adr1=int32#10,: 128]!
# asm 2: vld1.8 {>b1=d4->b1=d5},[<adr1=r9,: 128]!
vld1.8 {d4-d5},[r9,: 128]!

# qhasm: 	b3 aligned = mem128[adr0]		
# asm 1: vld1.8 {>b3=reg128#5%bot->b3=reg128#5%top},[<adr0=int32#8,: 128]
# asm 2: vld1.8 {>b3=d8->b3=d9},[<adr0=r7,: 128]
vld1.8 {d8-d9},[r7,: 128]

# qhasm: 	adr0 -= 16
# asm 1: sub >adr0=int32#8,<adr0=int32#8,#16
# asm 2: sub >adr0=r7,<adr0=r7,#16
sub r7,r7,#16

# qhasm: h3[0,1]  =   b1[2] unsigned* a0[0]; h3[2,3]  =   b1[3] unsigned* a0[1]
# asm 1: vmull.u32 >h3=reg128#9,<b1=reg128#3%top,<a0=reg128#4%bot
# asm 2: vmull.u32 >h3=q8,<b1=d5,<a0=d6
vmull.u32 q8,d5,d6

# qhasm: h3[0,1] +=   b1[0] unsigned* a0[2]; h3[2,3] +=   b1[1] unsigned* a0[3]
# asm 1: vmlal.u32 <h3=reg128#9,<b1=reg128#3%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q8,<b1=d4,<a0=d7
vmlal.u32 q8,d4,d7

# qhasm: 2x _2b1 = b1 + b1
# asm 1: vadd.i64 >_2b1=reg128#10,<b1=reg128#3,<b1=reg128#3
# asm 2: vadd.i64 >_2b1=q9,<b1=q2,<b1=q2
vadd.i64 q9,q2,q2

# qhasm: b0 b3 = b0[0]b3[0] b0[1]b3[1]
# asm 1: vswp <b3=reg128#5%bot,<b0=reg128#8%top
# asm 2: vswp <b3=d8,<b0=d15
vswp d8,d15

# qhasm: h1[0,1]  =   b1[0] unsigned* a2[0]; h1[2,3]  =   b1[1] unsigned* a2[1]
# asm 1: vmull.u32 >h1=reg128#11,<b1=reg128#3%bot,<a2=reg128#1%bot
# asm 2: vmull.u32 >h1=q10,<b1=d4,<a2=d0
vmull.u32 q10,d4,d0

# qhasm: h4[0,1]  =   b1[0] unsigned* a1[0]; h4[2,3]  =   b1[1] unsigned* a1[1]
# asm 1: vmull.u32 >h4=reg128#12,<b1=reg128#3%bot,<a1=reg128#6%bot
# asm 2: vmull.u32 >h4=q11,<b1=d4,<a1=d10
vmull.u32 q11,d4,d10

# qhasm: 2x _2b0 = b3 + b3
# asm 1: vadd.i64 >_2b0=reg128#13,<b3=reg128#5,<b3=reg128#5
# asm 2: vadd.i64 >_2b0=q12,<b3=q4,<b3=q4
vadd.i64 q12,q4,q4

# qhasm: b2 aligned = mem128[adr0]			
# asm 1: vld1.8 {>b2=reg128#14%bot->b2=reg128#14%top},[<adr0=int32#8,: 128]
# asm 2: vld1.8 {>b2=d26->b2=d27},[<adr0=r7,: 128]
vld1.8 {d26-d27},[r7,: 128]

# qhasm: h2[0,1]  =   b1[0] unsigned* a0[0]; h2[2,3]  =   b1[1] unsigned* a0[1]
# asm 1: vmull.u32 >h2=reg128#15,<b1=reg128#3%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h2=q14,<b1=d4,<a0=d6
vmull.u32 q14,d4,d6

# qhasm: h1[0,1] +=   b2[0] unsigned* a1[0]; h1[2,3] +=   b2[1] unsigned* a1[1]
# asm 1: vmlal.u32 <h1=reg128#11,<b2=reg128#14%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h1=q10,<b2=d26,<a1=d10
vmlal.u32 q10,d26,d10

# qhasm: 2x _2b2 = b2 + b2
# asm 1: vadd.i64 >_2b2=reg128#16,<b2=reg128#14,<b2=reg128#14
# asm 2: vadd.i64 >_2b2=q15,<b2=q13,<b2=q13
vadd.i64 q15,q13,q13

# qhasm: b0 b3 = b0[0]b3[0] b0[1]b3[1]
# asm 1: vswp <b3=reg128#5%bot,<b0=reg128#8%top
# asm 2: vswp <b3=d8,<b0=d15
vswp d8,d15

# qhasm: h4[0,1] +=   b2[0] unsigned* a0[0]; h4[2,3] +=   b2[1] unsigned* a0[1]
# asm 1: vmlal.u32 <h4=reg128#12,<b2=reg128#14%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q11,<b2=d26,<a0=d6
vmlal.u32 q11,d26,d6

# qhasm: h4[0,1] += _2b1[2] unsigned* a0[2]; h4[2,3] += _2b1[3] unsigned* a0[3]
# asm 1: vmlal.u32 <h4=reg128#12,<_2b1=reg128#10%top,<a0=reg128#4%top
# asm 2: vmlal.u32 <h4=q11,<_2b1=d19,<a0=d7
vmlal.u32 q11,d19,d7

# qhasm: h4[0,1] += _2b0[0] unsigned* a1[2]; h4[2,3] += _2b0[1] unsigned* a1[3]
# asm 1: vmlal.u32 <h4=reg128#12,<_2b0=reg128#13%bot,<a1=reg128#6%top
# asm 2: vmlal.u32 <h4=q11,<_2b0=d24,<a1=d11
vmlal.u32 q11,d24,d11

# qhasm: h4[0,1] +=   b0[0] unsigned* a2[0]; h4[2,3] +=   b0[1] unsigned* a2[1]
# asm 1: vmlal.u32 <h4=reg128#12,<b0=reg128#8%bot,<a2=reg128#1%bot
# asm 2: vmlal.u32 <h4=q11,<b0=d14,<a2=d0
vmlal.u32 q11,d14,d0

# qhasm: h0[0,1]  = _2b1[2] unsigned* a1[0]; h0[2,3]  = _2b1[3] unsigned* a1[1]
# asm 1: vmull.u32 >h0=reg128#5,<_2b1=reg128#10%top,<a1=reg128#6%bot
# asm 2: vmull.u32 >h0=q4,<_2b1=d19,<a1=d10
vmull.u32 q4,d19,d10

# qhasm: h0[0,1] += _2b1[0] unsigned* a1[2]; h0[2,3] += _2b1[1] unsigned* a1[3]
# asm 1: vmlal.u32 <h0=reg128#5,<_2b1=reg128#10%bot,<a1=reg128#6%top
# asm 2: vmlal.u32 <h0=q4,<_2b1=d18,<a1=d11
vmlal.u32 q4,d18,d11

# qhasm: h0[0,1] += _2b2[0] unsigned* a0[2]; h0[2,3] += _2b2[1] unsigned* a0[3]
# asm 1: vmlal.u32 <h0=reg128#5,<_2b2=reg128#16%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h0=q4,<_2b2=d30,<a0=d7
vmlal.u32 q4,d30,d7

# qhasm: h0[0,1] +=   b0[0] unsigned* a0[0]; h0[2,3] +=   b0[1] unsigned* a0[1]
# asm 1: vmlal.u32 <h0=reg128#5,<b0=reg128#8%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h0=q4,<b0=d14,<a0=d6
vmlal.u32 q4,d14,d6

# qhasm: h0[0,1] += _2b0[0] unsigned* a2[0]; h0[2,3] += _2b0[1] unsigned* a2[1]
# asm 1: vmlal.u32 <h0=reg128#5,<_2b0=reg128#13%bot,<a2=reg128#1%bot
# asm 2: vmlal.u32 <h0=q4,<_2b0=d24,<a2=d0
vmlal.u32 q4,d24,d0

# qhasm: h1[0,1] += _2b1[2] unsigned* a1[2]; h1[2,3] += _2b1[3] unsigned* a1[3]
# asm 1: vmlal.u32 <h1=reg128#11,<_2b1=reg128#10%top,<a1=reg128#6%top
# asm 2: vmlal.u32 <h1=q10,<_2b1=d19,<a1=d11
vmlal.u32 q10,d19,d11

# qhasm: h2[0,1] += _2b1[2] unsigned* a2[0]; h2[2,3] += _2b1[3] unsigned* a2[1]
# asm 1: vmlal.u32 <h2=reg128#15,<_2b1=reg128#10%top,<a2=reg128#1%bot
# asm 2: vmlal.u32 <h2=q14,<_2b1=d19,<a2=d0
vmlal.u32 q14,d19,d0

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h4=reg128#12,#25
# asm 2: vshr.u64 >t=q9,<h4=q11,#25
vshr.u64 q9,q11,#25

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#12,<h4=reg128#12,<mask25=reg128#7
# asm 2: vand >h4=q11,<h4=q11,<mask25=q6
vand q11,q11,q6

# qhasm: h1[0,1] +=   b0[2] unsigned* a0[0]; h1[2,3] +=   b0[3] unsigned* a0[1]
# asm 1: vmlal.u32 <h1=reg128#11,<b0=reg128#8%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q10,<b0=d15,<a0=d6
vmlal.u32 q10,d15,d6

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#5,<h0=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >h0=q4,<h0=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: h1[0,1] +=   b0[0] unsigned* a0[2]; h1[2,3] +=   b0[1] unsigned* a0[3]
# asm 1: vmlal.u32 <h1=reg128#11,<b0=reg128#8%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h1=q10,<b0=d14,<a0=d7
vmlal.u32 q10,d14,d7

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#10,<h0=reg128#5,#26
# asm 2: vshr.u64 >t=q9,<h0=q4,#26
vshr.u64 q9,q4,#26

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#5,<h0=reg128#5,<mask26=reg128#2
# asm 2: vand >h0=q4,<h0=q4,<mask26=q1
vand q4,q4,q1

# qhasm: h2[0,1] += _2b2[0] unsigned* a1[2]; h2[2,3] += _2b2[1] unsigned* a1[3]
# asm 1: vmlal.u32 <h2=reg128#15,<_2b2=reg128#16%bot,<a1=reg128#6%top
# asm 2: vmlal.u32 <h2=q14,<_2b2=d30,<a1=d11
vmlal.u32 q14,d30,d11

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#10,<h1=reg128#11,<t=reg128#10
# asm 2: vadd.i64 >h1=q9,<h1=q10,<t=q9
vadd.i64 q9,q10,q9

# qhasm: h2[0,1] +=   b0[0] unsigned* a1[0]; h2[2,3] +=   b0[1] unsigned* a1[1]
# asm 1: vmlal.u32 <h2=reg128#15,<b0=reg128#8%bot,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h2=q14,<b0=d14,<a1=d10
vmlal.u32 q14,d14,d10

# qhasm: h2[0,1] += _2b0[0] unsigned* a0[2]; h2[2,3] += _2b0[1] unsigned* a0[3]
# asm 1: vmlal.u32 <h2=reg128#15,<_2b0=reg128#13%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h2=q14,<_2b0=d24,<a0=d7
vmlal.u32 q14,d24,d7

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h1=reg128#10,#25
# asm 2: vshr.u64 >t=q10,<h1=q9,#25
vshr.u64 q10,q9,#25

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#10,<h1=reg128#10,<mask25=reg128#7
# asm 2: vand >h1=q9,<h1=q9,<mask25=q6
vand q9,q9,q6

# qhasm: h3[0,1] +=   b2[0] unsigned* a2[0]; h3[2,3] +=   b2[1] unsigned* a2[1]
# asm 1: vmlal.u32 <h3=reg128#9,<b2=reg128#14%bot,<a2=reg128#1%bot
# asm 2: vmlal.u32 <h3=q8,<b2=d26,<a2=d0
vmlal.u32 q8,d26,d0

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#11,<h2=reg128#15,<t=reg128#11
# asm 2: vadd.i64 >h2=q10,<h2=q14,<t=q10
vadd.i64 q10,q14,q10

# qhasm: h3[0,1] +=   b0[2] unsigned* a1[0]; h3[2,3] +=   b0[3] unsigned* a1[1]
# asm 1: vmlal.u32 <h3=reg128#9,<b0=reg128#8%top,<a1=reg128#6%bot
# asm 2: vmlal.u32 <h3=q8,<b0=d15,<a1=d10
vmlal.u32 q8,d15,d10

# qhasm: h3[0,1] +=   b0[0] unsigned* a1[2]; h3[2,3] +=   b0[1] unsigned* a1[3]
# asm 1: vmlal.u32 <h3=reg128#9,<b0=reg128#8%bot,<a1=reg128#6%top
# asm 2: vmlal.u32 <h3=q8,<b0=d14,<a1=d11
vmlal.u32 q8,d14,d11

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#15,<h2=reg128#11,#26
# asm 2: vshr.u64 >t=q14,<h2=q10,#26
vshr.u64 q14,q10,#26

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#2,<h2=reg128#11,<mask26=reg128#2
# asm 2: vand >h2=q1,<h2=q10,<mask26=q1
vand q1,q10,q1

# qhasm: t0 = a0 ^ b0
# asm 1: veor >t0=reg128#4,<a0=reg128#4,<b0=reg128#8
# asm 2: veor >t0=q3,<a0=q3,<b0=q7
veor q3,q3,q7

# qhasm: t1 = a1 ^ b1
# asm 1: veor >t1=reg128#6,<a1=reg128#6,<b1=reg128#3
# asm 2: veor >t1=q5,<a1=q5,<b1=q2
veor q5,q5,q2

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#9,<h3=reg128#9,<t=reg128#15
# asm 2: vadd.i64 >h3=q8,<h3=q8,<t=q14
vadd.i64 q8,q8,q14

# qhasm: 4x c = bit
# asm 1: vdup.i32 >c=reg128#11,<bit=int32#7
# asm 2: vdup.i32 >c=q10,<bit=r6
vdup.i32 q10,r6

# qhasm: t0 &= c
# asm 1: vand >t0=reg128#4,<t0=reg128#4,<c=reg128#11
# asm 2: vand >t0=q3,<t0=q3,<c=q10
vand q3,q3,q10

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#15,<h3=reg128#9,#25
# asm 2: vshr.u64 >t=q14,<h3=q8,#25
vshr.u64 q14,q8,#25

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#9,<h3=reg128#9,<mask25=reg128#7
# asm 2: vand >h3=q8,<h3=q8,<mask25=q6
vand q8,q8,q6

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#8,<input_1=int32#2
# asm 2: mov >adr1=r7,<input_1=r1
mov r7,r1

# qhasm: b0 ^= t0
# asm 1: veor >b0=reg128#4,<b0=reg128#8,<t0=reg128#4
# asm 2: veor >b0=q3,<b0=q7,<t0=q3
veor q3,q7,q3

# qhasm: t2 = a2 ^ b2
# asm 1: veor >t2=reg128#8,<a2=reg128#1,<b2=reg128#14
# asm 2: veor >t2=q7,<a2=q0,<b2=q13
veor q7,q0,q13

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#12,<h4=reg128#12,<t=reg128#15
# asm 2: vadd.i64 >h4=q11,<h4=q11,<t=q14
vadd.i64 q11,q11,q14

# qhasm: t1 &= c
# asm 1: vand >t1=reg128#6,<t1=reg128#6,<c=reg128#11
# asm 2: vand >t1=q5,<t1=q5,<c=q10
vand q5,q5,q10

# qhasm: t2 &= c
# asm 1: vand >t2=reg128#8,<t2=reg128#8,<c=reg128#11
# asm 2: vand >t2=q7,<t2=q7,<c=q10
vand q7,q7,q10

# qhasm: mem128[adr1] aligned = b0; adr1+=16
# asm 1: vst1.8 {<b0=reg128#4%bot-<b0=reg128#4%top},[<adr1=int32#8,: 128]!
# asm 2: vst1.8 {<b0=d6-<b0=d7},[<adr1=r7,: 128]!
vst1.8 {d6-d7},[r7,: 128]!

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#4,<h4=reg128#12,#25
# asm 2: vshr.u64 >t=q3,<h4=q11,#25
vshr.u64 q3,q11,#25

# qhasm: 	adr0 = input_0 + 48
# asm 1: add >adr0=int32#8,<input_0=int32#1,#48
# asm 2: add >adr0=r7,<input_0=r0,#48
add r7,r0,#48

# qhasm: 	a3 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a3=reg128#11%bot->a3=reg128#11%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a3=d20->a3=d21},[<adr0=r7,: 128]!
vld1.8 {d20-d21},[r7,: 128]!

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#12,<h4=reg128#12,<mask25=reg128#7
# asm 2: vand >h4=q11,<h4=q11,<mask25=q6
vand q11,q11,q6

# qhasm: 	a4 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a4=reg128#15%bot->a4=reg128#15%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a4=d28->a4=d29},[<adr0=r7,: 128]!
vld1.8 {d28-d29},[r7,: 128]!

# qhasm: b1 ^= t1
# asm 1: veor >b1=reg128#3,<b1=reg128#3,<t1=reg128#6
# asm 2: veor >b1=q2,<b1=q2,<t1=q5
veor q2,q2,q5

# qhasm: 	adr1 = input_1 + 48
# asm 1: add >adr1=int32#8,<input_1=int32#2,#48
# asm 2: add >adr1=r7,<input_1=r1,#48
add r7,r1,#48

# qhasm: 	b3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b3=reg128#6%bot->b3=reg128#6%top},[<adr1=int32#8,: 128]!
# asm 2: vld1.8 {>b3=d10->b3=d11},[<adr1=r7,: 128]!
vld1.8 {d10-d11},[r7,: 128]!

# qhasm: t2 ^= b2
# asm 1: veor >t2=reg128#8,<t2=reg128#8,<b2=reg128#14
# asm 2: veor >t2=q7,<t2=q7,<b2=q13
veor q7,q7,q13

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#2,<h3=reg128#9
# asm 2: vtrn.32 <h2=q1,<h3=q8
vtrn.32 q1,q8

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#4,<h0=reg128#5,<t=reg128#4
# asm 2: vadd.i64 >h0=q3,<h0=q4,<t=q3
vadd.i64 q3,q4,q3

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#12%bot,<h4=reg128#12%top
# asm 2: vtrn.32 <h4=d22,<h4=d23
vtrn.32 d22,d23

# qhasm: b2 = t2[0,1]b2[2,3]
# asm 1: vext.32 <b2=reg128#14%bot,<t2=reg128#8%bot,<t2=reg128#8%bot,#0
# asm 2: vext.32 <b2=d26,<t2=d14,<t2=d14,#0
vext.32 d26,d14,d14,#0

# qhasm: b4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b4=reg128#5%bot->b4=reg128#5%top},[<adr1=int32#8,: 128]!
# asm 2: vld1.8 {>b4=d8->b4=d9},[<adr1=r7,: 128]!
vld1.8 {d8-d9},[r7,: 128]!

# qhasm: adr1 = input_1 + 16
# asm 1: add >adr1=int32#8,<input_1=int32#2,#16
# asm 2: add >adr1=r7,<input_1=r1,#16
add r7,r1,#16

# qhasm: 2x _2b4 = b4 + b4
# asm 1: vadd.i64 >_2b4=reg128#8,<b4=reg128#5,<b4=reg128#5
# asm 2: vadd.i64 >_2b4=q7,<b4=q4,<b4=q4
vadd.i64 q7,q4,q4

# qhasm: mem128[adr1] aligned = b1; adr1+=16
# asm 1: vst1.8 {<b1=reg128#3%bot-<b1=reg128#3%top},[<adr1=int32#8,: 128]!
# asm 2: vst1.8 {<b1=d4-<b1=d5},[<adr1=r7,: 128]!
vst1.8 {d4-d5},[r7,: 128]!

# qhasm: k5[0,1]  =   b2[2] unsigned* a3[0]; k5[2,3]  =   b2[3] unsigned* a3[1]
# asm 1: vmull.u32 >k5=reg128#3,<b2=reg128#14%top,<a3=reg128#11%bot
# asm 2: vmull.u32 >k5=q2,<b2=d27,<a3=d20
vmull.u32 q2,d27,d20

# qhasm: a2 = h4[0]a2[1]	
# asm 1: vmov <a2=reg128#1%bot,<h4=reg128#12%bot
# asm 2: vmov <a2=d0,<h4=d22
vmov d0,d22

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#4,<h1=reg128#10
# asm 2: vtrn.32 <h0=q3,<h1=q9
vtrn.32 q3,q9

# qhasm: k5[0,1] += _2b4[2] unsigned* a3[2]; k5[2,3] += _2b4[3] unsigned* a3[3]
# asm 1: vmlal.u32 <k5=reg128#3,<_2b4=reg128#8%top,<a3=reg128#11%top
# asm 2: vmlal.u32 <k5=q2,<_2b4=d15,<a3=d21
vmlal.u32 q2,d15,d21

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#2%bot,<h2=reg128#2%top
# asm 2: vtrn.32 <h2=d2,<h2=d3
vtrn.32 d2,d3

# qhasm: k5[0,1] +=   b4[0] unsigned* a4[0]; k5[2,3] +=   b4[1] unsigned* a4[1]
# asm 1: vmlal.u32 <k5=reg128#3,<b4=reg128#5%bot,<a4=reg128#15%bot
# asm 2: vmlal.u32 <k5=q2,<b4=d8,<a4=d28
vmlal.u32 q2,d8,d28

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#4%bot,<h0=reg128#4%top
# asm 2: vtrn.32 <h0=d6,<h0=d7
vtrn.32 d6,d7

# qhasm: mem128[adr1] aligned = b2; adr1+=16
# asm 1: vst1.8 {<b2=reg128#14%bot-<b2=reg128#14%top},[<adr1=int32#8,: 128]!
# asm 2: vst1.8 {<b2=d26-<b2=d27},[<adr1=r7,: 128]!
vst1.8 {d26-d27},[r7,: 128]!

# qhasm: k5[0,1] += _2b0[2] unsigned* a4[2]; k5[2,3] += _2b0[3] unsigned* a4[3]
# asm 1: vmlal.u32 <k5=reg128#3,<_2b0=reg128#13%top,<a4=reg128#15%top
# asm 2: vmlal.u32 <k5=q2,<_2b0=d25,<a4=d29
vmlal.u32 q2,d25,d29

# qhasm: k5[0,1] +=   b3[0] unsigned* a2[2]; k5[2,3] +=   b3[1] unsigned* a2[3]
# asm 1: vmlal.u32 <k5=reg128#3,<b3=reg128#6%bot,<a2=reg128#1%top
# asm 2: vmlal.u32 <k5=q2,<b3=d10,<a2=d1
vmlal.u32 q2,d10,d1

# qhasm: k0[0,1]  =   b3[0] unsigned* a3[0]; k0[2,3]  =   b3[1] unsigned* a3[1]
# asm 1: vmull.u32 >k0=reg128#9,<b3=reg128#6%bot,<a3=reg128#11%bot
# asm 2: vmull.u32 >k0=q8,<b3=d10,<a3=d20
vmull.u32 q8,d10,d20

# qhasm: k0[0,1] += _2b2[2] unsigned* a3[2]; k0[2,3] += _2b2[3] unsigned* a3[3]
# asm 1: vmlal.u32 <k0=reg128#9,<_2b2=reg128#16%top,<a3=reg128#11%top
# asm 2: vmlal.u32 <k0=q8,<_2b2=d31,<a3=d21
vmlal.u32 q8,d31,d21

# qhasm: k0[0,1] += _2b4[2] unsigned* a4[0]; k0[2,3] += _2b4[3] unsigned* a4[1]
# asm 1: vmlal.u32 <k0=reg128#9,<_2b4=reg128#8%top,<a4=reg128#15%bot
# asm 2: vmlal.u32 <k0=q8,<_2b4=d15,<a4=d28
vmlal.u32 q8,d15,d28

# qhasm: k0[0,1] += _2b4[0] unsigned* a4[2]; k0[2,3] += _2b4[1] unsigned* a4[3]
# asm 1: vmlal.u32 <k0=reg128#9,<_2b4=reg128#8%bot,<a4=reg128#15%top
# asm 2: vmlal.u32 <k0=q8,<_2b4=d14,<a4=d29
vmlal.u32 q8,d14,d29

# qhasm: k0[0,1] += _2b0[2] unsigned* a2[2]; k0[2,3] += _2b0[3] unsigned* a2[3]
# asm 1: vmlal.u32 <k0=reg128#9,<_2b0=reg128#13%top,<a2=reg128#1%top
# asm 2: vmlal.u32 <k0=q8,<_2b0=d25,<a2=d1
vmlal.u32 q8,d25,d1

# qhasm: k2[0,1]  = _2b2[2] unsigned* a4[2]; k2[2,3]  = _2b2[3] unsigned* a4[3]
# asm 1: vmull.u32 >k2=reg128#10,<_2b2=reg128#16%top,<a4=reg128#15%top
# asm 2: vmull.u32 >k2=q9,<_2b2=d31,<a4=d29
vmull.u32 q9,d31,d29

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#8,<input_0=int32#1
# asm 2: mov >adr0=r7,<input_0=r0
mov r7,r0

# qhasm: 2x t = k5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#12,<k5=reg128#3,#25
# asm 2: vshr.u64 >t=q11,<k5=q2,#25
vshr.u64 q11,q2,#25

# qhasm: mem128[adr0] aligned = h0; adr0+=16
# asm 1: vst1.8 {<h0=reg128#4%bot-<h0=reg128#4%top},[<adr0=int32#8,: 128]!
# asm 2: vst1.8 {<h0=d6-<h0=d7},[<adr0=r7,: 128]!
vst1.8 {d6-d7},[r7,: 128]!

# qhasm: k5 &= mask25
# asm 1: vand >k5=reg128#3,<k5=reg128#3,<mask25=reg128#7
# asm 2: vand >k5=q2,<k5=q2,<mask25=q6
vand q2,q2,q6

# qhasm: mem128[adr0] aligned = h2; adr0+=16
# asm 1: vst1.8 {<h2=reg128#2%bot-<h2=reg128#2%top},[<adr0=int32#8,: 128]!
# asm 2: vst1.8 {<h2=d2-<h2=d3},[<adr0=r7,: 128]!
vst1.8 {d2-d3},[r7,: 128]!

# qhasm: k1[0,1]  =   b3[2] unsigned* a3[0]; k1[2,3]  =   b3[3] unsigned* a3[1]
# asm 1: vmull.u32 >k1=reg128#2,<b3=reg128#6%top,<a3=reg128#11%bot
# asm 2: vmull.u32 >k1=q1,<b3=d11,<a3=d20
vmull.u32 q1,d11,d20

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#9,<t=reg128#12
# asm 2: vadd.i64 >k0=q3,<k0=q8,<t=q11
vadd.i64 q3,q8,q11

# qhasm: k1[0,1] +=   b3[0] unsigned* a3[2]; k1[2,3] +=   b3[1] unsigned* a3[3]
# asm 1: vmlal.u32 <k1=reg128#2,<b3=reg128#6%bot,<a3=reg128#11%top
# asm 2: vmlal.u32 <k1=q1,<b3=d10,<a3=d21
vmlal.u32 q1,d10,d21

# qhasm: k1[0,1] +=   b2[2] unsigned* a4[0]; k1[2,3] +=   b2[3] unsigned* a4[1]
# asm 1: vmlal.u32 <k1=reg128#2,<b2=reg128#14%top,<a4=reg128#15%bot
# asm 2: vmlal.u32 <k1=q1,<b2=d27,<a4=d28
vmlal.u32 q1,d27,d28

# qhasm: k1[0,1] += _2b4[2] unsigned* a4[2]; k1[2,3] += _2b4[3] unsigned* a4[3]
# asm 1: vmlal.u32 <k1=reg128#2,<_2b4=reg128#8%top,<a4=reg128#15%top
# asm 2: vmlal.u32 <k1=q1,<_2b4=d15,<a4=d29
vmlal.u32 q1,d15,d29

# qhasm: k1[0,1] +=   b4[0] unsigned* a2[2]; k1[2,3] +=   b4[1] unsigned* a2[3]
# asm 1: vmlal.u32 <k1=reg128#2,<b4=reg128#5%bot,<a2=reg128#1%top
# asm 2: vmlal.u32 <k1=q1,<b4=d8,<a2=d1
vmlal.u32 q1,d8,d1

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#9,<input_5=stack32#arg18
# asm 2: ldr >adr5=r8,<input_5=[r12,#68]
ldr r8,[r12,#68]

# qhasm: adr5 += 16
# asm 1: add >adr5=int32#9,<adr5=int32#9,#16
# asm 2: add >adr5=r8,<adr5=r8,#16
add r8,r8,#16

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<k0=reg128#4,#26
# asm 2: vshr.u64 >t=q8,<k0=q3,#26
vshr.u64 q8,q3,#26

# qhasm: mask26 aligned = mem128[adr5]
# asm 1: vld1.8 {>mask26=reg128#12%bot->mask26=reg128#12%top},[<adr5=int32#9,: 128]
# asm 2: vld1.8 {>mask26=d22->mask26=d23},[<adr5=r8,: 128]
vld1.8 {d22-d23},[r8,: 128]

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#4,<mask26=reg128#12
# asm 2: vand >k0=q3,<k0=q3,<mask26=q11
vand q3,q3,q11

# qhasm: mem128[adr0] aligned = a2; adr0+=16
# asm 1: vst1.8 {<a2=reg128#1%bot-<a2=reg128#1%top},[<adr0=int32#8,: 128]!
# asm 2: vst1.8 {<a2=d0-<a2=d1},[<adr0=r7,: 128]!
vst1.8 {d0-d1},[r7,: 128]!

# qhasm: k2[0,1] +=   b4[0] unsigned* a3[0]; k2[2,3] +=   b4[1] unsigned* a3[1]
# asm 1: vmlal.u32 <k2=reg128#10,<b4=reg128#5%bot,<a3=reg128#11%bot
# asm 2: vmlal.u32 <k2=q9,<b4=d8,<a3=d20
vmlal.u32 q9,d8,d20

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#2,<k1=reg128#2,<t=reg128#9
# asm 2: vadd.i64 >k1=q1,<k1=q1,<t=q8
vadd.i64 q1,q1,q8

# qhasm: k2[0,1] += _2b0[2] unsigned* a3[2]; k2[2,3] += _2b0[3] unsigned* a3[3]
# asm 1: vmlal.u32 <k2=reg128#10,<_2b0=reg128#13%top,<a3=reg128#11%top
# asm 2: vmlal.u32 <k2=q9,<_2b0=d25,<a3=d21
vmlal.u32 q9,d25,d21

# qhasm: k2[0,1] +=   b3[0] unsigned* a4[0]; k2[2,3] +=   b3[1] unsigned* a4[1]
# asm 1: vmlal.u32 <k2=reg128#10,<b3=reg128#6%bot,<a4=reg128#15%bot
# asm 2: vmlal.u32 <k2=q9,<b3=d10,<a4=d28
vmlal.u32 q9,d10,d28

# qhasm: k2[0,1] += _2b4[2] unsigned* a2[2]; k2[2,3] += _2b4[3] unsigned* a2[3]
# asm 1: vmlal.u32 <k2=reg128#10,<_2b4=reg128#8%top,<a2=reg128#1%top
# asm 2: vmlal.u32 <k2=q9,<_2b4=d15,<a2=d1
vmlal.u32 q9,d15,d1

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<k1=reg128#2,#25
# asm 2: vshr.u64 >t=q7,<k1=q1,#25
vshr.u64 q7,q1,#25

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#2,<k1=reg128#2,<mask25=reg128#7
# asm 2: vand >k1=q1,<k1=q1,<mask25=q6
vand q1,q1,q6

# qhasm: k3[0,1]  =   b4[2] unsigned* a3[0]; k3[2,3]  =   b4[3] unsigned* a3[1]
# asm 1: vmull.u32 >k3=reg128#9,<b4=reg128#5%top,<a3=reg128#11%bot
# asm 2: vmull.u32 >k3=q8,<b4=d9,<a3=d20
vmull.u32 q8,d9,d20

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#8,<k2=reg128#10,<t=reg128#8
# asm 2: vadd.i64 >k2=q7,<k2=q9,<t=q7
vadd.i64 q7,q9,q7

# qhasm: k3[0,1] +=   b4[0] unsigned* a3[2]; k3[2,3] +=   b4[1] unsigned* a3[3]
# asm 1: vmlal.u32 <k3=reg128#9,<b4=reg128#5%bot,<a3=reg128#11%top
# asm 2: vmlal.u32 <k3=q8,<b4=d8,<a3=d21
vmlal.u32 q8,d8,d21

# qhasm: k3[0,1] +=   b3[2] unsigned* a4[0]; k3[2,3] +=   b3[3] unsigned* a4[1]
# asm 1: vmlal.u32 <k3=reg128#9,<b3=reg128#6%top,<a4=reg128#15%bot
# asm 2: vmlal.u32 <k3=q8,<b3=d11,<a4=d28
vmlal.u32 q8,d11,d28

# qhasm: k3[0,1] +=   b3[0] unsigned* a4[2]; k3[2,3] +=   b3[1] unsigned* a4[3]
# asm 1: vmlal.u32 <k3=reg128#9,<b3=reg128#6%bot,<a4=reg128#15%top
# asm 2: vmlal.u32 <k3=q8,<b3=d10,<a4=d29
vmlal.u32 q8,d10,d29

# qhasm: k3[0,1] +=   b2[2] unsigned* a2[2]; k3[2,3] +=   b2[3] unsigned* a2[3]
# asm 1: vmlal.u32 <k3=reg128#9,<b2=reg128#14%top,<a2=reg128#1%top
# asm 2: vmlal.u32 <k3=q8,<b2=d27,<a2=d1
vmlal.u32 q8,d27,d1

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#10,<k2=reg128#8,#26
# asm 2: vshr.u64 >t=q9,<k2=q7,#26
vshr.u64 q9,q7,#26

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#8,<k2=reg128#8,<mask26=reg128#12
# asm 2: vand >k2=q7,<k2=q7,<mask26=q11
vand q7,q7,q11

# qhasm: t3  = a3 ^ b3
# asm 1: veor >t3=reg128#11,<a3=reg128#11,<b3=reg128#6
# asm 2: veor >t3=q10,<a3=q10,<b3=q5
veor q10,q10,q5

# qhasm: t4  = a4 ^ b4
# asm 1: veor >t4=reg128#13,<a4=reg128#15,<b4=reg128#5
# asm 2: veor >t4=q12,<a4=q14,<b4=q4
veor q12,q14,q4

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#9,<k3=reg128#9,<t=reg128#10
# asm 2: vadd.i64 >k3=q8,<k3=q8,<t=q9
vadd.i64 q8,q8,q9

# qhasm: 4x c = bit
# asm 1: vdup.i32 >c=reg128#10,<bit=int32#7
# asm 2: vdup.i32 >c=q9,<bit=r6
vdup.i32 q9,r6

# qhasm: t3 &= c
# asm 1: vand >t3=reg128#11,<t3=reg128#11,<c=reg128#10
# asm 2: vand >t3=q10,<t3=q10,<c=q9
vand q10,q10,q9

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#15,<k3=reg128#9,#25
# asm 2: vshr.u64 >t=q14,<k3=q8,#25
vshr.u64 q14,q8,#25

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#9,<k3=reg128#9,<mask25=reg128#7
# asm 2: vand >k3=q8,<k3=q8,<mask25=q6
vand q8,q8,q6

# qhasm: b3 ^= t3
# asm 1: veor >b3=reg128#6,<b3=reg128#6,<t3=reg128#11
# asm 2: veor >b3=q5,<b3=q5,<t3=q10
veor q5,q5,q10

# qhasm: t2  = a2 ^ b2
# asm 1: veor >t2=reg128#11,<a2=reg128#1,<b2=reg128#14
# asm 2: veor >t2=q10,<a2=q0,<b2=q13
veor q10,q0,q13

# qhasm: 2x k5 +=t
# asm 1: vadd.i64 >k5=reg128#3,<k5=reg128#3,<t=reg128#15
# asm 2: vadd.i64 >k5=q2,<k5=q2,<t=q14
vadd.i64 q2,q2,q14

# qhasm: t2 &= c
# asm 1: vand >t2=reg128#11,<t2=reg128#11,<c=reg128#10
# asm 2: vand >t2=q10,<t2=q10,<c=q9
vand q10,q10,q9

# qhasm: t4 &= c
# asm 1: vand >t4=reg128#10,<t4=reg128#13,<c=reg128#10
# asm 2: vand >t4=q9,<t4=q12,<c=q9
vand q9,q12,q9

# qhasm: 	adr1 = input_1 + 48
# asm 1: add >adr1=int32#7,<input_1=int32#2,#48
# asm 2: add >adr1=r6,<input_1=r1,#48
add r6,r1,#48

# qhasm: 	mem128[adr1] aligned = b3; adr1+=16
# asm 1: vst1.8 {<b3=reg128#6%bot-<b3=reg128#6%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<b3=d10-<b3=d11},[<adr1=r6,: 128]!
vst1.8 {d10-d11},[r6,: 128]!

# qhasm: 	adr0 = input_0
# asm 1: mov >adr0=int32#8,<input_0=int32#1
# asm 2: mov >adr0=r7,<input_0=r0
mov r7,r0

# qhasm: 2x t = k5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<k5=reg128#3,#25
# asm 2: vshr.u64 >t=q5,<k5=q2,#25
vshr.u64 q5,q2,#25

# qhasm: 	a0 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a0=reg128#13%bot->a0=reg128#13%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a0=d24->a0=d25},[<adr0=r7,: 128]!
vld1.8 {d24-d25},[r7,: 128]!

# qhasm: k5 &= mask25
# asm 1: vand >k5=reg128#3,<k5=reg128#3,<mask25=reg128#7
# asm 2: vand >k5=q2,<k5=q2,<mask25=q6
vand q2,q2,q6

# qhasm: 	a1 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a1=reg128#15%bot->a1=reg128#15%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a1=d28->a1=d29},[<adr0=r7,: 128]!
vld1.8 {d28-d29},[r7,: 128]!

# qhasm: 	adr3 = input_3 + 16
# asm 1: add >adr3=int32#8,<input_3=int32#4,#16
# asm 2: add >adr3=r7,<input_3=r3,#16
add r7,r3,#16

# qhasm: 	c0 aligned = mem128[adr3]
# asm 1: vld1.8 {>c0=reg128#16%bot->c0=reg128#16%top},[<adr3=int32#8,: 128]
# asm 2: vld1.8 {>c0=d30->c0=d31},[<adr3=r7,: 128]
vld1.8 {d30-d31},[r7,: 128]

# qhasm: t2 ^= b2
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<b2=reg128#14
# asm 2: veor >t2=q10,<t2=q10,<b2=q13
veor q10,q10,q13

# qhasm: b4 ^= t4
# asm 1: veor >b4=reg128#5,<b4=reg128#5,<t4=reg128#10
# asm 2: veor >b4=q4,<b4=q4,<t4=q9
veor q4,q4,q9

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#8,<k3=reg128#9
# asm 2: vtrn.32 <k2=q7,<k3=q8
vtrn.32 q7,q8

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#4,<t=reg128#6
# asm 2: vadd.i64 >k0=q3,<k0=q3,<t=q5
vadd.i64 q3,q3,q5

# qhasm: k5 = k5[0,2,1,3]
# asm 1: vtrn.32 <k5=reg128#3%bot,<k5=reg128#3%top
# asm 2: vtrn.32 <k5=d4,<k5=d5
vtrn.32 d4,d5

# qhasm: 	p4[0,1]  =   a2[0] unsigned* c0[0]; p4[2,3]  =   a2[1] unsigned* c0[1]
# asm 1: vmull.u32 >p4=reg128#6,<a2=reg128#1%bot,<c0=reg128#16%bot
# asm 2: vmull.u32 >p4=q5,<a2=d0,<c0=d30
vmull.u32 q5,d0,d30

# qhasm: mem128[adr1] aligned = b4; adr1+=16
# asm 1: vst1.8 {<b4=reg128#5%bot-<b4=reg128#5%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<b4=d8-<b4=d9},[<adr1=r6,: 128]!
vst1.8 {d8-d9},[r6,: 128]!

# qhasm: p0[0,1]  =   a0[0] unsigned* c0[0]; p0[2,3]  =   a0[1] unsigned* c0[1]
# asm 1: vmull.u32 >p0=reg128#5,<a0=reg128#13%bot,<c0=reg128#16%bot
# asm 2: vmull.u32 >p0=q4,<a0=d24,<c0=d30
vmull.u32 q4,d24,d30

# qhasm: p1[0,1]  =   a0[2] unsigned* c0[0]; p1[2,3]  =   a0[3] unsigned* c0[1]
# asm 1: vmull.u32 >p1=reg128#9,<a0=reg128#13%top,<c0=reg128#16%bot
# asm 2: vmull.u32 >p1=q8,<a0=d25,<c0=d30
vmull.u32 q8,d25,d30

# qhasm: a2 = a2[0]k5[0]
# asm 1: vmov <a2=reg128#1%top,<k5=reg128#3%bot
# asm 2: vmov <a2=d1,<k5=d4
vmov d1,d4

# qhasm: b2  = b2[0,1]t2[2,3]
# asm 1: vext.32 <b2=reg128#14%top,<t2=reg128#11%top,<t2=reg128#11%top,#0
# asm 2: vext.32 <b2=d27,<t2=d21,<t2=d21,#0
vext.32 d27,d21,d21,#0

# qhasm: 2x t = p4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#3,<p4=reg128#6,#25
# asm 2: vshr.u64 >t=q2,<p4=q5,#25
vshr.u64 q2,q5,#25

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#4,<k1=reg128#2
# asm 2: vtrn.32 <k0=q3,<k1=q1
vtrn.32 q3,q1

# qhasm: p4 &= mask25
# asm 1: vand >p4=reg128#2,<p4=reg128#6,<mask25=reg128#7
# asm 2: vand >p4=q1,<p4=q5,<mask25=q6
vand q1,q5,q6

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#8%bot,<k2=reg128#8%top
# asm 2: vtrn.32 <k2=d14,<k2=d15
vtrn.32 d14,d15

# qhasm: 2x p0 += t
# asm 1: vadd.i64 >p0=reg128#3,<p0=reg128#5,<t=reg128#3
# asm 2: vadd.i64 >p0=q2,<p0=q4,<t=q2
vadd.i64 q2,q4,q2

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#4%bot,<k0=reg128#4%top
# asm 2: vtrn.32 <k0=d6,<k0=d7
vtrn.32 d6,d7

# qhasm: p2[0,1]  =   a1[0] unsigned* c0[0]; p2[2,3]  =   a1[1] unsigned* c0[1]
# asm 1: vmull.u32 >p2=reg128#5,<a1=reg128#15%bot,<c0=reg128#16%bot
# asm 2: vmull.u32 >p2=q4,<a1=d28,<c0=d30
vmull.u32 q4,d28,d30

# qhasm: 2x t = p0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<p0=reg128#3,#26
# asm 2: vshr.u64 >t=q5,<p0=q2,#26
vshr.u64 q5,q2,#26

# qhasm: p0 &= mask26
# asm 1: vand >p0=reg128#3,<p0=reg128#3,<mask26=reg128#12
# asm 2: vand >p0=q2,<p0=q2,<mask26=q11
vand q2,q2,q11

# qhasm: adr1 = input_1 + 32
# asm 1: add >adr1=int32#7,<input_1=int32#2,#32
# asm 2: add >adr1=r6,<input_1=r1,#32
add r6,r1,#32

# qhasm: mem128[adr1] aligned = b2; adr1+=16
# asm 1: vst1.8 {<b2=reg128#14%bot-<b2=reg128#14%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<b2=d26-<b2=d27},[<adr1=r6,: 128]!
vst1.8 {d26-d27},[r6,: 128]!

# qhasm: 2x p1 += t
# asm 1: vadd.i64 >p1=reg128#6,<p1=reg128#9,<t=reg128#6
# asm 2: vadd.i64 >p1=q5,<p1=q8,<t=q5
vadd.i64 q5,q8,q5

# qhasm: adr0 = input_0 + 32
# asm 1: add >adr0=int32#7,<input_0=int32#1,#32
# asm 2: add >adr0=r6,<input_0=r0,#32
add r6,r0,#32

# qhasm: mem128[adr0] aligned = a2; adr0+=16
# asm 1: vst1.8 {<a2=reg128#1%bot-<a2=reg128#1%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<a2=d0-<a2=d1},[<adr0=r6,: 128]!
vst1.8 {d0-d1},[r6,: 128]!

# qhasm: p3[0,1]  =   a1[2] unsigned* c0[0]; p3[2,3]  =   a1[3] unsigned* c0[1]
# asm 1: vmull.u32 >p3=reg128#9,<a1=reg128#15%top,<c0=reg128#16%bot
# asm 2: vmull.u32 >p3=q8,<a1=d29,<c0=d30
vmull.u32 q8,d29,d30

# qhasm: 2x t = p1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<p1=reg128#6,#25
# asm 2: vshr.u64 >t=q9,<p1=q5,#25
vshr.u64 q9,q5,#25

# qhasm: mem128[adr0] aligned = k0; adr0+=16
# asm 1: vst1.8 {<k0=reg128#4%bot-<k0=reg128#4%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<k0=d6-<k0=d7},[<adr0=r6,: 128]!
vst1.8 {d6-d7},[r6,: 128]!

# qhasm: p1 &= mask25
# asm 1: vand >p1=reg128#6,<p1=reg128#6,<mask25=reg128#7
# asm 2: vand >p1=q5,<p1=q5,<mask25=q6
vand q5,q5,q6

# qhasm: mem128[adr0] aligned = k2; adr0+=16
# asm 1: vst1.8 {<k2=reg128#8%bot-<k2=reg128#8%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<k2=d14-<k2=d15},[<adr0=r6,: 128]!
vst1.8 {d14-d15},[r6,: 128]!

# qhasm: 	q5[0,1]  =   a2[2] unsigned* c0[2]; q5[2,3]  =   a2[3] unsigned* c0[3]
# asm 1: vmull.u32 >q5=reg128#1,<a2=reg128#1%top,<c0=reg128#16%top
# asm 2: vmull.u32 >q5=q0,<a2=d1,<c0=d31
vmull.u32 q0,d1,d31

# qhasm: 2x p2 += t
# asm 1: vadd.i64 >p2=reg128#5,<p2=reg128#5,<t=reg128#10
# asm 2: vadd.i64 >p2=q4,<p2=q4,<t=q9
vadd.i64 q4,q4,q9

# qhasm: p0 p1 = p0[0]p1[0]p0[2]p1[2] p0[1]p1[1]p0[3]p1[3]
# asm 1: vtrn.32 <p0=reg128#3,<p1=reg128#6
# asm 2: vtrn.32 <p0=q2,<p1=q5
vtrn.32 q2,q5

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 80
# asm 1: add >adr5=int32#7,<adr5=int32#7,#80
# asm 2: add >adr5=r6,<adr5=r6,#80
add r6,r6,#80

# qhasm: _28_27_28_27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_28_27_28_27=reg128#6%bot->_28_27_28_27=reg128#6%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_28_27_28_27=d10->_28_27_28_27=d11},[<adr5=r6,: 128]
vld1.8 {d10-d11},[r6,: 128]

# qhasm: 2x t = p2 unsigned>> 26 
# asm 1: vshr.u64 >t=reg128#10,<p2=reg128#5,#26
# asm 2: vshr.u64 >t=q9,<p2=q4,#26
vshr.u64 q9,q4,#26

# qhasm: p2 &= mask26 
# asm 1: vand >p2=reg128#5,<p2=reg128#5,<mask26=reg128#12
# asm 2: vand >p2=q4,<p2=q4,<mask26=q11
vand q4,q4,q11

# qhasm: 4x na0 = _28_27_28_27 - p0 
# asm 1: vsub.i32 >na0=reg128#11,<_28_27_28_27=reg128#6,<p0=reg128#3
# asm 2: vsub.i32 >na0=q10,<_28_27_28_27=q5,<p0=q2
vsub.i32 q10,q5,q2

# qhasm: 2x p3 += t 
# asm 1: vadd.i64 >p3=reg128#9,<p3=reg128#9,<t=reg128#10
# asm 2: vadd.i64 >p3=q8,<p3=q8,<t=q9
vadd.i64 q8,q8,q9

# qhasm: q0[0,1]  =   k0[0] unsigned* c0[2]; q0[2,3]  =   k0[1] unsigned* c0[3]
# asm 1: vmull.u32 >q0=reg128#10,<k0=reg128#4%bot,<c0=reg128#16%top
# asm 2: vmull.u32 >q0=q9,<k0=d6,<c0=d31
vmull.u32 q9,d6,d31

# qhasm: 2x t = p3 unsigned>> 25 
# asm 1: vshr.u64 >t=reg128#13,<p3=reg128#9,#25
# asm 2: vshr.u64 >t=q12,<p3=q8,#25
vshr.u64 q12,q8,#25

# qhasm: p3 &= mask25 
# asm 1: vand >p3=reg128#9,<p3=reg128#9,<mask25=reg128#7
# asm 2: vand >p3=q8,<p3=q8,<mask25=q6
vand q8,q8,q6

# qhasm: 2x t2 = q5 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#14,<q5=reg128#1,#25
# asm 2: vshr.u64 >t2=q13,<q5=q0,#25
vshr.u64 q13,q0,#25

# qhasm: q5 &= mask25
# asm 1: vand >q5=reg128#1,<q5=reg128#1,<mask25=reg128#7
# asm 2: vand >q5=q0,<q5=q0,<mask25=q6
vand q0,q0,q6

# qhasm: 2x q0 += t2
# asm 1: vadd.i64 >q0=reg128#10,<q0=reg128#10,<t2=reg128#14
# asm 2: vadd.i64 >q0=q9,<q0=q9,<t2=q13
vadd.i64 q9,q9,q13

# qhasm: q1[0,1]  =   k0[2] unsigned* c0[2]; q1[2,3]  =   k0[3] unsigned* c0[3]
# asm 1: vmull.u32 >q1=reg128#4,<k0=reg128#4%top,<c0=reg128#16%top
# asm 2: vmull.u32 >q1=q3,<k0=d7,<c0=d31
vmull.u32 q3,d7,d31

# qhasm: 2x p4 += t 
# asm 1: vadd.i64 >p4=reg128#2,<p4=reg128#2,<t=reg128#13
# asm 2: vadd.i64 >p4=q1,<p4=q1,<t=q12
vadd.i64 q1,q1,q12

# qhasm: p2 p3 = p2[0]p3[0]p2[2]p3[2] p2[1]p3[1]p2[3]p3[3] 
# asm 1: vtrn.32 <p2=reg128#5,<p3=reg128#9
# asm 2: vtrn.32 <p2=q4,<p3=q8
vtrn.32 q4,q8

# qhasm: 2x t2 = q0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#9,<q0=reg128#10,#26
# asm 2: vshr.u64 >t2=q8,<q0=q9,#26
vshr.u64 q8,q9,#26

# qhasm: q0 &= mask26
# asm 1: vand >q0=reg128#10,<q0=reg128#10,<mask26=reg128#12
# asm 2: vand >q0=q9,<q0=q9,<mask26=q11
vand q9,q9,q11

# qhasm: q2[0,1]  =   k2[0] unsigned* c0[2]; q2[2,3]  =   k2[1] unsigned* c0[3]
# asm 1: vmull.u32 >q2=reg128#13,<k2=reg128#8%bot,<c0=reg128#16%top
# asm 2: vmull.u32 >q2=q12,<k2=d14,<c0=d31
vmull.u32 q12,d14,d31

# qhasm: 4x na1 = _28_27_28_27 - p2 
# asm 1: vsub.i32 >na1=reg128#14,<_28_27_28_27=reg128#6,<p2=reg128#5
# asm 2: vsub.i32 >na1=q13,<_28_27_28_27=q5,<p2=q4
vsub.i32 q13,q5,q4

# qhasm: 2x q1 += t2
# asm 1: vadd.i64 >q1=reg128#4,<q1=reg128#4,<t2=reg128#9
# asm 2: vadd.i64 >q1=q3,<q1=q3,<t2=q8
vadd.i64 q3,q3,q8

# qhasm: q3[0,1]  =   k2[2] unsigned* c0[2]; q3[2,3]  =   k2[3] unsigned* c0[3]
# asm 1: vmull.u32 >q3=reg128#8,<k2=reg128#8%top,<c0=reg128#16%top
# asm 2: vmull.u32 >q3=q7,<k2=d15,<c0=d31
vmull.u32 q7,d15,d31

# qhasm: 2x t2 = q1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#9,<q1=reg128#4,#25
# asm 2: vshr.u64 >t2=q8,<q1=q3,#25
vshr.u64 q8,q3,#25

# qhasm: q1 &= mask25
# asm 1: vand >q1=reg128#4,<q1=reg128#4,<mask25=reg128#7
# asm 2: vand >q1=q3,<q1=q3,<mask25=q6
vand q3,q3,q6

# qhasm: 2x q2 += t2
# asm 1: vadd.i64 >q2=reg128#9,<q2=reg128#13,<t2=reg128#9
# asm 2: vadd.i64 >q2=q8,<q2=q12,<t2=q8
vadd.i64 q8,q12,q8

# qhasm: na0 = p0[0]na0[1] 
# asm 1: vmov <na0=reg128#11%bot,<p0=reg128#3%bot
# asm 2: vmov <na0=d20,<p0=d4
vmov d20,d4

# qhasm: na1 = p2[0]na1[1] 
# asm 1: vmov <na1=reg128#14%bot,<p2=reg128#5%bot
# asm 2: vmov <na1=d26,<p2=d8
vmov d26,d8

# qhasm: q0 q1 = q0[0]q1[0]q0[2]q1[2] q0[1]q1[1]q0[3]q1[3]
# asm 1: vtrn.32 <q0=reg128#10,<q1=reg128#4
# asm 2: vtrn.32 <q0=q9,<q1=q3
vtrn.32 q9,q3

# qhasm: 2x t2 = q2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#3,<q2=reg128#9,#26
# asm 2: vshr.u64 >t2=q2,<q2=q8,#26
vshr.u64 q2,q8,#26

# qhasm: na0 = na0[0,2,1,3] 
# asm 1: vtrn.32 <na0=reg128#11%bot,<na0=reg128#11%top
# asm 2: vtrn.32 <na0=d20,<na0=d21
vtrn.32 d20,d21

# qhasm: q2 &= mask26
# asm 1: vand >q2=reg128#4,<q2=reg128#9,<mask26=reg128#12
# asm 2: vand >q2=q3,<q2=q8,<mask26=q11
vand q3,q8,q11

# qhasm: 4x n0 = _28_27_28_27 - q0 
# asm 1: vsub.i32 >n0=reg128#5,<_28_27_28_27=reg128#6,<q0=reg128#10
# asm 2: vsub.i32 >n0=q4,<_28_27_28_27=q5,<q0=q9
vsub.i32 q4,q5,q9

# qhasm: 2x q3 += t2
# asm 1: vadd.i64 >q3=reg128#3,<q3=reg128#8,<t2=reg128#3
# asm 2: vadd.i64 >q3=q2,<q3=q7,<t2=q2
vadd.i64 q2,q7,q2

# qhasm: na1 = na1[0,2,1,3] 
# asm 1: vtrn.32 <na1=reg128#14%bot,<na1=reg128#14%top
# asm 2: vtrn.32 <na1=d26,<na1=d27
vtrn.32 d26,d27

# qhasm: 	adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: 	adr5 += 64
# asm 1: add >adr5=int32#7,<adr5=int32#7,#64
# asm 2: add >adr5=r6,<adr5=r6,#64
add r6,r6,#64

# qhasm: 	_27 aligned = mem128[adr5]; adr5+=16
# asm 1: vld1.8 {>_27=reg128#6%bot->_27=reg128#6%top},[<adr5=int32#7,: 128]!
# asm 2: vld1.8 {>_27=d10->_27=d11},[<adr5=r6,: 128]!
vld1.8 {d10-d11},[r6,: 128]!

# qhasm: 	_28_27_28_27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_28_27_28_27=reg128#8%bot->_28_27_28_27=reg128#8%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_28_27_28_27=d14->_28_27_28_27=d15},[<adr5=r6,: 128]
vld1.8 {d14-d15},[r6,: 128]

# qhasm: 2x t2 = q3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#9,<q3=reg128#3,#25
# asm 2: vshr.u64 >t2=q8,<q3=q2,#25
vshr.u64 q8,q2,#25

# qhasm: q3 &= mask25
# asm 1: vand >q3=reg128#3,<q3=reg128#3,<mask25=reg128#7
# asm 2: vand >q3=q2,<q3=q2,<mask25=q6
vand q2,q2,q6

# qhasm: 2x q5 += t2
# asm 1: vadd.i64 >q5=reg128#1,<q5=reg128#1,<t2=reg128#9
# asm 2: vadd.i64 >q5=q0,<q5=q0,<t2=q8
vadd.i64 q0,q0,q8

# qhasm: q2 q3 = q2[0]q3[0]q2[2]q3[2] q2[1]q3[1]q2[3]q3[3]	
# asm 1: vtrn.32 <q2=reg128#4,<q3=reg128#3
# asm 2: vtrn.32 <q2=q3,<q3=q2
vtrn.32 q3,q2

# qhasm: p4 q5 = p4[0]q5[0]p4[2]q5[2] p4[1]q5[1]p4[3]q5[3]
# asm 1: vtrn.32 <p4=reg128#2,<q5=reg128#1
# asm 2: vtrn.32 <p4=q1,<q5=q0
vtrn.32 q1,q0

# qhasm: 4x n1 = _28_27_28_27 - q2 
# asm 1: vsub.i32 >n1=reg128#1,<_28_27_28_27=reg128#8,<q2=reg128#4
# asm 2: vsub.i32 >n1=q0,<_28_27_28_27=q7,<q2=q3
vsub.i32 q0,q7,q3

# qhasm: 4x n2 = _27 - p4 
# asm 1: vsub.i32 >n2=reg128#3,<_27=reg128#6,<p4=reg128#2
# asm 2: vsub.i32 >n2=q2,<_27=q5,<p4=q1
vsub.i32 q2,q5,q1

# qhasm: n0 = n0[0,2,1,3] 
# asm 1: vtrn.32 <n0=reg128#5%bot,<n0=reg128#5%top
# asm 2: vtrn.32 <n0=d8,<n0=d9
vtrn.32 d8,d9

# qhasm: n1 = n1[0,2,1,3] 
# asm 1: vtrn.32 <n1=reg128#1%bot,<n1=reg128#1%top
# asm 2: vtrn.32 <n1=d0,<n1=d1
vtrn.32 d0,d1

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#7,<input_0=int32#1,#48
# asm 2: add >adr0=r6,<input_0=r0,#48
add r6,r0,#48

# qhasm: q0 = n2[1,2,3]p4[0] 
# asm 1: vext.32 >q0=reg128#2,<n2=reg128#3,<p4=reg128#2,#1
# asm 2: vext.32 >q0=q1,<n2=q2,<p4=q1,#1
vext.32 q1,q2,q1,#1

# qhasm: 4x sum1 = na1 + n1
# asm 1: vadd.i32 >sum1=reg128#3,<na1=reg128#14,<n1=reg128#1
# asm 2: vadd.i32 >sum1=q2,<na1=q13,<n1=q0
vadd.i32 q2,q13,q0

# qhasm: mem128[adr0] = n0; adr0+=16	
# asm 1: vst1.8 {<n0=reg128#5%bot-<n0=reg128#5%top},[<adr0=int32#7]!
# asm 2: vst1.8 {<n0=d8-<n0=d9},[<adr0=r6]!
vst1.8 {d8-d9},[r6]!

# qhasm: p4 = q0[3]q0[0,1,2] 
# asm 1: vext.32 >p4=reg128#2,<q0=reg128#2,<q0=reg128#2,#3
# asm 2: vext.32 >p4=q1,<q0=q1,<q0=q1,#3
vext.32 q1,q1,q1,#3

# qhasm: 4x dif1 = na1 - n1
# asm 1: vsub.i32 >dif1=reg128#4,<na1=reg128#14,<n1=reg128#1
# asm 2: vsub.i32 >dif1=q3,<na1=q13,<n1=q0
vsub.i32 q3,q13,q0

# qhasm: mem128[adr0] = n1; adr0+=16	
# asm 1: vst1.8 {<n1=reg128#1%bot-<n1=reg128#1%top},[<adr0=int32#7]!
# asm 2: vst1.8 {<n1=d0-<n1=d1},[<adr0=r6]!
vst1.8 {d0-d1},[r6]!

# qhasm: p4 = p4[0,2,1,3] 
# asm 1: vtrn.32 <p4=reg128#2%bot,<p4=reg128#2%top
# asm 2: vtrn.32 <p4=d2,<p4=d3
vtrn.32 d2,d3

# qhasm: sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2] sum1[1]dif1[1]sum1[3]dif1[3]
# asm 1: vtrn.32 <sum1=reg128#3,<dif1=reg128#4
# asm 2: vtrn.32 <sum1=q2,<dif1=q3
vtrn.32 q2,q3

# qhasm: 4x sum0 = na0 + n0
# asm 1: vadd.i32 >sum0=reg128#1,<na0=reg128#11,<n0=reg128#5
# asm 2: vadd.i32 >sum0=q0,<na0=q10,<n0=q4
vadd.i32 q0,q10,q4

# qhasm: sum1 p4 = sum1[0]p4[0] sum1[1]p4[1]
# asm 1: vswp <p4=reg128#2%bot,<sum1=reg128#3%top
# asm 2: vswp <p4=d2,<sum1=d5
vswp d2,d5

# qhasm: 4x dif0 = na0 - n0
# asm 1: vsub.i32 >dif0=reg128#5,<na0=reg128#11,<n0=reg128#5
# asm 2: vsub.i32 >dif0=q4,<na0=q10,<n0=q4
vsub.i32 q4,q10,q4

# qhasm: p4 dif1 = p4[0]dif1[1] dif1[0]p4[1]
# asm 1: vswp <dif1=reg128#4%top,<p4=reg128#2%top
# asm 2: vswp <dif1=d7,<p4=d3
vswp d7,d3

# qhasm: 4x a1 = sum1 + dif1
# asm 1: vadd.i32 >a1=reg128#6,<sum1=reg128#3,<dif1=reg128#4
# asm 2: vadd.i32 >a1=q5,<sum1=q2,<dif1=q3
vadd.i32 q5,q2,q3

# qhasm: 4x a4 = sum1 - dif1
# asm 1: vsub.i32 >a4=reg128#3,<sum1=reg128#3,<dif1=reg128#4
# asm 2: vsub.i32 >a4=q2,<sum1=q2,<dif1=q3
vsub.i32 q2,q2,q3

# qhasm: sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2] sum0[1]dif0[1]sum0[3]dif0[3]
# asm 1: vtrn.32 <sum0=reg128#1,<dif0=reg128#5
# asm 2: vtrn.32 <sum0=q0,<dif0=q4
vtrn.32 q0,q4

# qhasm: 4x a0 = sum0 + dif0
# asm 1: vadd.i32 >a0=reg128#4,<sum0=reg128#1,<dif0=reg128#5
# asm 2: vadd.i32 >a0=q3,<sum0=q0,<dif0=q4
vadd.i32 q3,q0,q4

# qhasm: a1 p4 = p4[0]a1[1] a1[0]p4[1]
# asm 1: vswp <p4=reg128#2%bot,<a1=reg128#6%bot
# asm 2: vswp <p4=d2,<a1=d10
vswp d2,d10

# qhasm: 4x a3 = sum0 - dif0
# asm 1: vsub.i32 >a3=reg128#1,<sum0=reg128#1,<dif0=reg128#5
# asm 2: vsub.i32 >a3=q0,<sum0=q0,<dif0=q4
vsub.i32 q0,q0,q4

# qhasm: p4 a4 = p4[0]a4[0] p4[1]a4[1]
# asm 1: vswp <a4=reg128#3%bot,<p4=reg128#2%top
# asm 2: vswp <a4=d4,<p4=d3
vswp d4,d3

# qhasm: a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]
# asm 1: vtrn.32 <a1=reg128#6%top,<a4=reg128#3%top
# asm 2: vtrn.32 <a1=d11,<a4=d5
vtrn.32 d11,d5

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 32
# asm 1: add >adr5=int32#7,<adr5=int32#7,#32
# asm 2: add >adr5=r6,<adr5=r6,#32
add r6,r6,#32

# qhasm: 4x sum1 = a1 + a4
# asm 1: vadd.i32 >sum1=reg128#5,<a1=reg128#6,<a4=reg128#3
# asm 2: vadd.i32 >sum1=q4,<a1=q5,<a4=q2
vadd.i32 q4,q5,q2

# qhasm: _28 aligned = mem128[adr5]; adr5+=16
# asm 1: vld1.8 {>_28=reg128#8%bot->_28=reg128#8%top},[<adr5=int32#7,: 128]!
# asm 2: vld1.8 {>_28=d14->_28=d15},[<adr5=r6,: 128]!
vld1.8 {d14-d15},[r6,: 128]!

# qhasm: 4x dif1 = a1 - a4
# asm 1: vsub.i32 >dif1=reg128#3,<a1=reg128#6,<a4=reg128#3
# asm 2: vsub.i32 >dif1=q2,<a1=q5,<a4=q2
vsub.i32 q2,q5,q2

# qhasm: _29_28 aligned = mem128[adr5]
# asm 1: vld1.8 {>_29_28=reg128#6%bot->_29_28=reg128#6%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_29_28=d10->_29_28=d11},[<adr5=r6,: 128]
vld1.8 {d10-d11},[r6,: 128]

# qhasm: p4 sum1 = p4[0]sum1[0] p4[1]sum1[1]
# asm 1: vswp <sum1=reg128#5%bot,<p4=reg128#2%top
# asm 2: vswp <sum1=d8,<p4=d3
vswp d8,d3

# qhasm: 4x a0 = a0 + _29_28
# asm 1: vadd.i32 >a0=reg128#4,<a0=reg128#4,<_29_28=reg128#6
# asm 2: vadd.i32 >a0=q3,<a0=q3,<_29_28=q5
vadd.i32 q3,q3,q5

# qhasm: sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]
# asm 1: vswp <dif1=reg128#3%bot,<sum1=reg128#5%top
# asm 2: vswp <dif1=d4,<sum1=d9
vswp d4,d9

# qhasm: 4x a3 = a3 + _29_28
# asm 1: vadd.i32 >a3=reg128#1,<a3=reg128#1,<_29_28=reg128#6
# asm 2: vadd.i32 >a3=q0,<a3=q0,<_29_28=q5
vadd.i32 q0,q0,q5

# qhasm: 4x a4 = sum1 + _29_28
# asm 1: vadd.i32 >a4=reg128#5,<sum1=reg128#5,<_29_28=reg128#6
# asm 2: vadd.i32 >a4=q4,<sum1=q4,<_29_28=q5
vadd.i32 q4,q4,q5

# qhasm: 4x a1 = p4 + _29_28
# asm 1: vadd.i32 >a1=reg128#2,<p4=reg128#2,<_29_28=reg128#6
# asm 2: vadd.i32 >a1=q1,<p4=q1,<_29_28=q5
vadd.i32 q1,q1,q5

# qhasm: 4x a2 = dif1 + _28
# asm 1: vadd.i32 >a2=reg128#3,<dif1=reg128#3,<_28=reg128#8
# asm 2: vadd.i32 >a2=q2,<dif1=q2,<_28=q7
vadd.i32 q2,q2,q7

# qhasm: a0 a3 = a0[0]a3[0] a0[1]a3[1]
# asm 1: vswp <a3=reg128#1%bot,<a0=reg128#4%top
# asm 2: vswp <a3=d0,<a0=d7
vswp d0,d7

# qhasm: 2x _2a1 = a1 + a1
# asm 1: vadd.i64 >_2a1=reg128#6,<a1=reg128#2,<a1=reg128#2
# asm 2: vadd.i64 >_2a1=q5,<a1=q1,<a1=q1
vadd.i64 q5,q1,q1

# qhasm: 2x _2a2 = a2 + a2
# asm 1: vadd.i64 >_2a2=reg128#8,<a2=reg128#3,<a2=reg128#3
# asm 2: vadd.i64 >_2a2=q7,<a2=q2,<a2=q2
vadd.i64 q7,q2,q2

# qhasm: 2x _2a0 = a3 + a3
# asm 1: vadd.i64 >_2a0=reg128#9,<a3=reg128#1,<a3=reg128#1
# asm 2: vadd.i64 >_2a0=q8,<a3=q0,<a3=q0
vadd.i64 q8,q0,q0

# qhasm: a0 a3 = a0[0]a3[0] a0[1]a3[1]
# asm 1: vswp <a3=reg128#1%bot,<a0=reg128#4%top
# asm 2: vswp <a3=d0,<a0=d7
vswp d0,d7

# qhasm: 2x _2a4 = a4 + a4
# asm 1: vadd.i64 >_2a4=reg128#10,<a4=reg128#5,<a4=reg128#5
# asm 2: vadd.i64 >_2a4=q9,<a4=q4,<a4=q4
vadd.i64 q9,q4,q4

# qhasm: h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]
# asm 1: vmull.u32 >h3=reg128#11,<a2=reg128#3%bot,<a2=reg128#3%bot
# asm 2: vmull.u32 >h3=q10,<a2=d4,<a2=d4
vmull.u32 q10,d4,d4

# qhasm: h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]
# asm 1: vmlal.u32 <h3=reg128#11,<_2a1=reg128#6%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h3=q10,<_2a1=d11,<a0=d6
vmlal.u32 q10,d11,d6

# qhasm: h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]
# asm 1: vmlal.u32 <h3=reg128#11,<_2a1=reg128#6%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <h3=q10,<_2a1=d10,<a0=d7
vmlal.u32 q10,d10,d7

# qhasm: h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]
# asm 1: vmull.u32 >h4=reg128#13,<a1=reg128#2%bot,<a1=reg128#2%bot
# asm 2: vmull.u32 >h4=q12,<a1=d2,<a1=d2
vmull.u32 q12,d2,d2

# qhasm: h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]
# asm 1: vmlal.u32 <h4=reg128#13,<_2a2=reg128#8%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h4=q12,<_2a2=d14,<a0=d6
vmlal.u32 q12,d14,d6

# qhasm: h4[0,1] += _2a1[2] unsigned* _2a0[0]; h4[2,3] += _2a1[3] unsigned* _2a0[1]
# asm 1: vmlal.u32 <h4=reg128#13,<_2a1=reg128#6%top,<_2a0=reg128#9%bot
# asm 2: vmlal.u32 <h4=q12,<_2a1=d11,<_2a0=d16
vmlal.u32 q12,d11,d16

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#14,<h3=reg128#11,#25
# asm 2: vshr.u64 >t=q13,<h3=q10,#25
vshr.u64 q13,q10,#25

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#11,<h3=reg128#11,<mask25=reg128#7
# asm 2: vand >h3=q10,<h3=q10,<mask25=q6
vand q10,q10,q6

# qhasm: h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]
# asm 1: vmull.u32 >h0=reg128#15,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >h0=q14,<a0=d6,<a0=d6
vmull.u32 q14,d6,d6

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#13,<h4=reg128#13,<t=reg128#14
# asm 2: vadd.i64 >h4=q12,<h4=q12,<t=q13
vadd.i64 q12,q12,q13

# qhasm: h0[0,1] += _2a2[0] unsigned* _2a0[0]; h0[2,3] += _2a2[1] unsigned* _2a0[1]
# asm 1: vmlal.u32 <h0=reg128#15,<_2a2=reg128#8%bot,<_2a0=reg128#9%bot
# asm 2: vmlal.u32 <h0=q14,<_2a2=d14,<_2a0=d16
vmlal.u32 q14,d14,d16

# qhasm: h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]
# asm 1: vmlal.u32 <h0=reg128#15,<_2a1=reg128#6%top,<_2a1=reg128#6%bot
# asm 2: vmlal.u32 <h0=q14,<_2a1=d11,<_2a1=d10
vmlal.u32 q14,d11,d10

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#14,<h4=reg128#13,#25
# asm 2: vshr.u64 >t=q13,<h4=q12,#25
vshr.u64 q13,q12,#25

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#13,<h4=reg128#13,<mask25=reg128#7
# asm 2: vand >h4=q12,<h4=q12,<mask25=q6
vand q12,q12,q6

# qhasm: h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]
# asm 1: vmull.u32 >h1=reg128#16,<_2a1=reg128#6%top,<a1=reg128#2%top
# asm 2: vmull.u32 >h1=q15,<_2a1=d11,<a1=d3
vmull.u32 q15,d11,d3

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#14,<h0=reg128#15,<t=reg128#14
# asm 2: vadd.i64 >h0=q13,<h0=q14,<t=q13
vadd.i64 q13,q14,q13

# qhasm: h1[0,1] += _2a0[0] unsigned*   a0[0]; h1[2,3] += _2a0[1] unsigned*   a0[1]
# asm 1: vmlal.u32 <h1=reg128#16,<_2a0=reg128#9%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h1=q15,<_2a0=d16,<a0=d6
vmlal.u32 q15,d16,d6

# qhasm: h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]
# asm 1: vmlal.u32 <h1=reg128#16,<_2a2=reg128#8%bot,<a1=reg128#2%bot
# asm 2: vmlal.u32 <h1=q15,<_2a2=d14,<a1=d2
vmlal.u32 q15,d14,d2

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#2,<h0=reg128#14,#26
# asm 2: vshr.u64 >t=q1,<h0=q13,#26
vshr.u64 q1,q13,#26

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#14,<h0=reg128#14,<mask26=reg128#12
# asm 2: vand >h0=q13,<h0=q13,<mask26=q11
vand q13,q13,q11

# qhasm: h2[0,1]  = _2a0[0] unsigned*   a0[2]; h2[2,3]  = _2a0[1] unsigned*   a0[3]
# asm 1: vmull.u32 >h2=reg128#15,<_2a0=reg128#9%bot,<a0=reg128#4%top
# asm 2: vmull.u32 >h2=q14,<_2a0=d16,<a0=d7
vmull.u32 q14,d16,d7

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#2,<h1=reg128#16,<t=reg128#2
# asm 2: vadd.i64 >h1=q1,<h1=q15,<t=q1
vadd.i64 q1,q15,q1

# qhasm: h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]
# asm 1: vmlal.u32 <h2=reg128#15,<_2a1=reg128#6%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <h2=q14,<_2a1=d10,<a0=d6
vmlal.u32 q14,d10,d6

# qhasm: h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]
# asm 1: vmlal.u32 <h2=reg128#15,<_2a2=reg128#8%bot,<_2a1=reg128#6%top
# asm 2: vmlal.u32 <h2=q14,<_2a2=d14,<_2a1=d11
vmlal.u32 q14,d14,d11

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#4,<h1=reg128#2,#25
# asm 2: vshr.u64 >t=q3,<h1=q1,#25
vshr.u64 q3,q1,#25

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#2,<h1=reg128#2,<mask25=reg128#7
# asm 2: vand >h1=q1,<h1=q1,<mask25=q6
vand q1,q1,q6

# qhasm: 	k3[0,1]  =   a2[2] unsigned*   a2[2]; k3[2,3]  =   a2[3] unsigned*   a2[3]
# asm 1: vmull.u32 >k3=reg128#6,<a2=reg128#3%top,<a2=reg128#3%top
# asm 2: vmull.u32 >k3=q5,<a2=d5,<a2=d5
vmull.u32 q5,d5,d5

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#4,<h2=reg128#15,<t=reg128#4
# asm 2: vadd.i64 >h2=q3,<h2=q14,<t=q3
vadd.i64 q3,q14,q3

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#14,<h1=reg128#2
# asm 2: vtrn.32 <h0=q13,<h1=q1
vtrn.32 q13,q1

# qhasm: 	k3[0,1] += _2a4[2] unsigned*   a3[0]; k3[2,3] += _2a4[3] unsigned*   a3[1]
# asm 1: vmlal.u32 <k3=reg128#6,<_2a4=reg128#10%top,<a3=reg128#1%bot
# asm 2: vmlal.u32 <k3=q5,<_2a4=d19,<a3=d0
vmlal.u32 q5,d19,d0

# qhasm: 	k3[0,1] += _2a4[0] unsigned*   a3[2]; k3[2,3] += _2a4[1] unsigned*   a3[3]
# asm 1: vmlal.u32 <k3=reg128#6,<_2a4=reg128#10%bot,<a3=reg128#1%top
# asm 2: vmlal.u32 <k3=q5,<_2a4=d18,<a3=d1
vmlal.u32 q5,d18,d1

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#2,<h2=reg128#4,#26
# asm 2: vshr.u64 >t=q1,<h2=q3,#26
vshr.u64 q1,q3,#26

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#4,<h2=reg128#4,<mask26=reg128#12
# asm 2: vand >h2=q3,<h2=q3,<mask26=q11
vand q3,q3,q11

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#14%bot,<h0=reg128#14%top
# asm 2: vtrn.32 <h0=d26,<h0=d27
vtrn.32 d26,d27

# qhasm: 	k4[0,1]  =   a4[0] unsigned*   a4[0]; k4[2,3]  =   a4[1] unsigned*   a4[1]
# asm 1: vmull.u32 >k4=reg128#15,<a4=reg128#5%bot,<a4=reg128#5%bot
# asm 2: vmull.u32 >k4=q14,<a4=d8,<a4=d8
vmull.u32 q14,d8,d8

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#2,<h3=reg128#11,<t=reg128#2
# asm 2: vadd.i64 >h3=q1,<h3=q10,<t=q1
vadd.i64 q1,q10,q1

# qhasm: 	k4[0,1] += _2a2[2] unsigned*   a3[0]; k4[2,3] += _2a2[3] unsigned*   a3[1]
# asm 1: vmlal.u32 <k4=reg128#15,<_2a2=reg128#8%top,<a3=reg128#1%bot
# asm 2: vmlal.u32 <k4=q14,<_2a2=d15,<a3=d0
vmlal.u32 q14,d15,d0

# qhasm: 	k4[0,1] += _2a4[2] unsigned* _2a0[2]; k4[2,3] += _2a4[3] unsigned* _2a0[3]
# asm 1: vmlal.u32 <k4=reg128#15,<_2a4=reg128#10%top,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <k4=q14,<_2a4=d19,<_2a0=d17
vmlal.u32 q14,d19,d17

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#11,<h3=reg128#2,#25
# asm 2: vshr.u64 >t=q10,<h3=q1,#25
vshr.u64 q10,q1,#25

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#2,<h3=reg128#2,<mask25=reg128#7
# asm 2: vand >h3=q1,<h3=q1,<mask25=q6
vand q1,q1,q6

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#7,<input_0=int32#1
# asm 2: mov >adr0=r6,<input_0=r0
mov r6,r0

# qhasm: mem128[adr0] aligned = h0; adr0+=16
# asm 1: vst1.8 {<h0=reg128#14%bot-<h0=reg128#14%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<h0=d26-<h0=d27},[<adr0=r6,: 128]!
vst1.8 {d26-d27},[r6,: 128]!

# qhasm: 	k0[0,1]  =   a3[0] unsigned*   a3[0]; k0[2,3]  =   a3[1] unsigned*   a3[1]
# asm 1: vmull.u32 >k0=reg128#14,<a3=reg128#1%bot,<a3=reg128#1%bot
# asm 2: vmull.u32 >k0=q13,<a3=d0,<a3=d0
vmull.u32 q13,d0,d0

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#13,<t=reg128#11
# asm 2: vadd.i64 >h4=q10,<h4=q12,<t=q10
vadd.i64 q10,q12,q10

# qhasm: 	2x t2 = k3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#13,<k3=reg128#6,#25
# asm 2: vshr.u64 >t2=q12,<k3=q5,#25
vshr.u64 q12,q5,#25

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#4,<h3=reg128#2
# asm 2: vtrn.32 <h2=q3,<h3=q1
vtrn.32 q3,q1

# qhasm: 	k3 &= mask25
# asm 1: vand >k3=reg128#2,<k3=reg128#6,<mask25=reg128#7
# asm 2: vand >k3=q1,<k3=q5,<mask25=q6
vand q1,q5,q6

# qhasm: 	k0[0,1] += _2a2[2] unsigned* _2a0[2]; k0[2,3] += _2a2[3] unsigned* _2a0[3]
# asm 1: vmlal.u32 <k0=reg128#14,<_2a2=reg128#8%top,<_2a0=reg128#9%top
# asm 2: vmlal.u32 <k0=q13,<_2a2=d15,<_2a0=d17
vmlal.u32 q13,d15,d17

# qhasm: 	2x k4 += t2
# asm 1: vadd.i64 >k4=reg128#6,<k4=reg128#15,<t2=reg128#13
# asm 2: vadd.i64 >k4=q5,<k4=q14,<t2=q12
vadd.i64 q5,q14,q12

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#11%bot,<h4=reg128#11%top
# asm 2: vtrn.32 <h4=d20,<h4=d21
vtrn.32 d20,d21

# qhasm: 	k0[0,1] += _2a4[2] unsigned* _2a4[0]; k0[2,3] += _2a4[3] unsigned* _2a4[1]
# asm 1: vmlal.u32 <k0=reg128#14,<_2a4=reg128#10%top,<_2a4=reg128#10%bot
# asm 2: vmlal.u32 <k0=q13,<_2a4=d19,<_2a4=d18
vmlal.u32 q13,d19,d18

# qhasm: 	2x t2 = k4 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#13,<k4=reg128#6,#25
# asm 2: vshr.u64 >t2=q12,<k4=q5,#25
vshr.u64 q12,q5,#25

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#4%bot,<h2=reg128#4%top
# asm 2: vtrn.32 <h2=d6,<h2=d7
vtrn.32 d6,d7

# qhasm: 	k4 &= mask25
# asm 1: vand >k4=reg128#6,<k4=reg128#6,<mask25=reg128#7
# asm 2: vand >k4=q5,<k4=q5,<mask25=q6
vand q5,q5,q6

# qhasm: a2 = h4[0]a2[1]
# asm 1: vmov <a2=reg128#3%bot,<h4=reg128#11%bot
# asm 2: vmov <a2=d4,<h4=d20
vmov d4,d20

# qhasm: mem128[adr0] aligned = h2; adr0+=16
# asm 1: vst1.8 {<h2=reg128#4%bot-<h2=reg128#4%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<h2=d6-<h2=d7},[<adr0=r6,: 128]!
vst1.8 {d6-d7},[r6,: 128]!

# qhasm: k1[0,1]  = _2a4[2] unsigned*   a4[2]; k1[2,3]  = _2a4[3] unsigned*   a4[3]	
# asm 1: vmull.u32 >k1=reg128#4,<_2a4=reg128#10%top,<a4=reg128#5%top
# asm 2: vmull.u32 >k1=q3,<_2a4=d19,<a4=d9
vmull.u32 q3,d19,d9

# qhasm: 2x k0 += t2
# asm 1: vadd.i64 >k0=reg128#11,<k0=reg128#14,<t2=reg128#13
# asm 2: vadd.i64 >k0=q10,<k0=q13,<t2=q12
vadd.i64 q10,q13,q12

# qhasm: k1[0,1] += _2a0[2] unsigned*   a3[0]; k1[2,3] += _2a0[3] unsigned*   a3[1]
# asm 1: vmlal.u32 <k1=reg128#4,<_2a0=reg128#9%top,<a3=reg128#1%bot
# asm 2: vmlal.u32 <k1=q3,<_2a0=d17,<a3=d0
vmlal.u32 q3,d17,d0

# qhasm: k1[0,1] += _2a2[2] unsigned*   a4[0]; k1[2,3] += _2a2[3] unsigned*   a4[1]
# asm 1: vmlal.u32 <k1=reg128#4,<_2a2=reg128#8%top,<a4=reg128#5%bot
# asm 2: vmlal.u32 <k1=q3,<_2a2=d15,<a4=d8
vmlal.u32 q3,d15,d8

# qhasm: 2x t2 = k0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#5,<k0=reg128#11,#26
# asm 2: vshr.u64 >t2=q4,<k0=q10,#26
vshr.u64 q4,q10,#26

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#11,<k0=reg128#11,<mask26=reg128#12
# asm 2: vand >k0=q10,<k0=q10,<mask26=q11
vand q10,q10,q11

# qhasm: k2[0,1]  = _2a0[2] unsigned*   a3[2]; k2[2,3]  = _2a0[3] unsigned*   a3[3]
# asm 1: vmull.u32 >k2=reg128#9,<_2a0=reg128#9%top,<a3=reg128#1%top
# asm 2: vmull.u32 >k2=q8,<_2a0=d17,<a3=d1
vmull.u32 q8,d17,d1

# qhasm: 2x k1 += t2
# asm 1: vadd.i64 >k1=reg128#4,<k1=reg128#4,<t2=reg128#5
# asm 2: vadd.i64 >k1=q3,<k1=q3,<t2=q4
vadd.i64 q3,q3,q4

# qhasm: k2[0,1] += _2a4[0] unsigned*   a3[0]; k2[2,3] += _2a4[1] unsigned*   a3[1]
# asm 1: vmlal.u32 <k2=reg128#9,<_2a4=reg128#10%bot,<a3=reg128#1%bot
# asm 2: vmlal.u32 <k2=q8,<_2a4=d18,<a3=d0
vmlal.u32 q8,d18,d0

# qhasm: k2[0,1] += _2a2[2] unsigned* _2a4[2]; k2[2,3] += _2a2[3] unsigned* _2a4[3]
# asm 1: vmlal.u32 <k2=reg128#9,<_2a2=reg128#8%top,<_2a4=reg128#10%top
# asm 2: vmlal.u32 <k2=q8,<_2a2=d15,<_2a4=d19
vmlal.u32 q8,d15,d19

# qhasm: 2x t2 = k1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#1,<k1=reg128#4,#25
# asm 2: vshr.u64 >t2=q0,<k1=q3,#25
vshr.u64 q0,q3,#25

# qhasm: 	adr2 = input_2
# asm 1: mov >adr2=int32#7,<input_2=int32#3
# asm 2: mov >adr2=r6,<input_2=r2
mov r6,r2

# qhasm: 	b0 aligned = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b0=reg128#5%bot->b0=reg128#5%top},[<adr2=int32#7,: 128]!
# asm 2: vld1.8 {>b0=d8->b0=d9},[<adr2=r6,: 128]!
vld1.8 {d8-d9},[r6,: 128]!

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#4,<k1=reg128#4,<mask25=reg128#7
# asm 2: vand >k1=q3,<k1=q3,<mask25=q6
vand q3,q3,q6

# qhasm: 	adr0 = input_0
# asm 1: mov >adr0=int32#8,<input_0=int32#1
# asm 2: mov >adr0=r7,<input_0=r0
mov r7,r0

# qhasm: 	a0 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a0=reg128#8%bot->a0=reg128#8%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a0=d14->a0=d15},[<adr0=r7,: 128]!
vld1.8 {d14-d15},[r7,: 128]!

# qhasm: 	h1[0,1]  =   a0[2] unsigned* b0[0]; h1[2,3]  =   a0[3] unsigned* b0[1]	
# asm 1: vmull.u32 >h1=reg128#10,<a0=reg128#8%top,<b0=reg128#5%bot
# asm 2: vmull.u32 >h1=q9,<a0=d15,<b0=d8
vmull.u32 q9,d15,d8

# qhasm: 2x k2 += t2
# asm 1: vadd.i64 >k2=reg128#1,<k2=reg128#9,<t2=reg128#1
# asm 2: vadd.i64 >k2=q0,<k2=q8,<t2=q0
vadd.i64 q0,q8,q0

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#11,<k1=reg128#4
# asm 2: vtrn.32 <k0=q10,<k1=q3
vtrn.32 q10,q3

# qhasm: 	h1[0,1] +=   a0[0] unsigned* b0[2]; h1[2,3] +=   a0[1] unsigned* b0[3]	
# asm 1: vmlal.u32 <h1=reg128#10,<a0=reg128#8%bot,<b0=reg128#5%top
# asm 2: vmlal.u32 <h1=q9,<a0=d14,<b0=d9
vmlal.u32 q9,d14,d9

# qhasm: 2x t2 = k2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#4,<k2=reg128#1,#26
# asm 2: vshr.u64 >t2=q3,<k2=q0,#26
vshr.u64 q3,q0,#26

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#11%bot,<k0=reg128#11%top
# asm 2: vtrn.32 <k0=d20,<k0=d21
vtrn.32 d20,d21

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#1,<k2=reg128#1,<mask26=reg128#12
# asm 2: vand >k2=q0,<k2=q0,<mask26=q11
vand q0,q0,q11

# qhasm: 	adr0 = input_0 + 16
# asm 1: add >adr0=int32#8,<input_0=int32#1,#16
# asm 2: add >adr0=r7,<input_0=r0,#16
add r7,r0,#16

# qhasm: 	a1 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a1=reg128#9%bot->a1=reg128#9%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a1=d16->a1=d17},[<adr0=r7,: 128]!
vld1.8 {d16-d17},[r7,: 128]!

# qhasm: 	h0[0,1]  =   a0[0] unsigned* b0[0]; h0[2,3]  =   a0[1] unsigned* b0[1]
# asm 1: vmull.u32 >h0=reg128#12,<a0=reg128#8%bot,<b0=reg128#5%bot
# asm 2: vmull.u32 >h0=q11,<a0=d14,<b0=d8
vmull.u32 q11,d14,d8

# qhasm: 2x k3 += t2
# asm 1: vadd.i64 >k3=reg128#2,<k3=reg128#2,<t2=reg128#4
# asm 2: vadd.i64 >k3=q1,<k3=q1,<t2=q3
vadd.i64 q1,q1,q3

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#8,<input_0=int32#1,#48
# asm 2: add >adr0=r7,<input_0=r0,#48
add r7,r0,#48

# qhasm: mem128[adr0] aligned = k0; adr0+=16
# asm 1: vst1.8 {<k0=reg128#11%bot-<k0=reg128#11%top},[<adr0=int32#8,: 128]!
# asm 2: vst1.8 {<k0=d20-<k0=d21},[<adr0=r7,: 128]!
vst1.8 {d20-d21},[r7,: 128]!

# qhasm: 	h3[0,1]  =   a1[2] unsigned* b0[0]; h3[2,3]  =   a1[3] unsigned* b0[1]	
# asm 1: vmull.u32 >h3=reg128#4,<a1=reg128#9%top,<b0=reg128#5%bot
# asm 2: vmull.u32 >h3=q3,<a1=d17,<b0=d8
vmull.u32 q3,d17,d8

# qhasm: 	h3[0,1] +=   a1[0] unsigned* b0[2]; h3[2,3] +=   a1[1] unsigned* b0[3]
# asm 1: vmlal.u32 <h3=reg128#4,<a1=reg128#9%bot,<b0=reg128#5%top
# asm 2: vmlal.u32 <h3=q3,<a1=d16,<b0=d9
vmlal.u32 q3,d16,d9

# qhasm: 2x t2 = k3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#13,<k3=reg128#2,#25
# asm 2: vshr.u64 >t2=q12,<k3=q1,#25
vshr.u64 q12,q1,#25

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#2,<k3=reg128#2,<mask25=reg128#7
# asm 2: vand >k3=q1,<k3=q1,<mask25=q6
vand q1,q1,q6

# qhasm: 	a0 k0 = a0[0]k0[0] a0[1]k0[1]
# asm 1: vswp <k0=reg128#11%bot,<a0=reg128#8%top
# asm 2: vswp <k0=d20,<a0=d15
vswp d20,d15

# qhasm: 	2x _2a1 = a1 + a1
# asm 1: vadd.i64 >_2a1=reg128#14,<a1=reg128#9,<a1=reg128#9
# asm 2: vadd.i64 >_2a1=q13,<a1=q8,<a1=q8
vadd.i64 q13,q8,q8

# qhasm: 	b1 aligned = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b1=reg128#15%bot->b1=reg128#15%top},[<adr2=int32#7,: 128]!
# asm 2: vld1.8 {>b1=d28->b1=d29},[<adr2=r6,: 128]!
vld1.8 {d28-d29},[r6,: 128]!

# qhasm: 	h3[0,1] +=   k0[0] unsigned* b1[0]; h3[2,3] +=   k0[1] unsigned* b1[1]	
# asm 1: vmlal.u32 <h3=reg128#4,<k0=reg128#11%bot,<b1=reg128#15%bot
# asm 2: vmlal.u32 <h3=q3,<k0=d20,<b1=d28
vmlal.u32 q3,d20,d28

# qhasm: 2x k4 += t2
# asm 1: vadd.i64 >k4=reg128#6,<k4=reg128#6,<t2=reg128#13
# asm 2: vadd.i64 >k4=q5,<k4=q5,<t2=q12
vadd.i64 q5,q5,q12

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#1,<k3=reg128#2
# asm 2: vtrn.32 <k2=q0,<k3=q1
vtrn.32 q0,q1

# qhasm: 	h3[0,1] +=   a0[0] unsigned* b1[2]; h3[2,3] +=   a0[1] unsigned* b1[3]
# asm 1: vmlal.u32 <h3=reg128#4,<a0=reg128#8%bot,<b1=reg128#15%top
# asm 2: vmlal.u32 <h3=q3,<a0=d14,<b1=d29
vmlal.u32 q3,d14,d29

# qhasm: 	2x _2a0 = k0 + k0
# asm 1: vadd.i64 >_2a0=reg128#2,<k0=reg128#11,<k0=reg128#11
# asm 2: vadd.i64 >_2a0=q1,<k0=q10,<k0=q10
vadd.i64 q1,q10,q10

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#6%bot,<k4=reg128#6%top
# asm 2: vtrn.32 <k4=d10,<k4=d11
vtrn.32 d10,d11

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#1%bot,<k2=reg128#1%top
# asm 2: vtrn.32 <k2=d0,<k2=d1
vtrn.32 d0,d1

# qhasm: 	h2[0,1]  =   a1[0] unsigned* b0[0]; h2[2,3]  =   a1[1] unsigned* b0[1]	
# asm 1: vmull.u32 >h2=reg128#13,<a1=reg128#9%bot,<b0=reg128#5%bot
# asm 2: vmull.u32 >h2=q12,<a1=d16,<b0=d8
vmull.u32 q12,d16,d8

# qhasm: a2 = a2[0]k4[0]
# asm 1: vmov <a2=reg128#3%top,<k4=reg128#6%bot
# asm 2: vmov <a2=d5,<k4=d10
vmov d5,d10

# qhasm: adr0 = input_0 + 64
# asm 1: add >adr0=int32#7,<input_0=int32#1,#64
# asm 2: add >adr0=r6,<input_0=r0,#64
add r6,r0,#64

# qhasm: mem128[adr0] aligned = k2; adr0+=16
# asm 1: vst1.8 {<k2=reg128#1%bot-<k2=reg128#1%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<k2=d0-<k2=d1},[<adr0=r6,: 128]!
vst1.8 {d0-d1},[r6,: 128]!

# qhasm: 	2x _2a2 = a2 + a2
# asm 1: vadd.i64 >_2a2=reg128#1,<a2=reg128#3,<a2=reg128#3
# asm 2: vadd.i64 >_2a2=q0,<a2=q2,<a2=q2
vadd.i64 q0,q2,q2

# qhasm: 	a0 k0 = a0[0]k0[0] a0[1]k0[1]
# asm 1: vswp <k0=reg128#11%bot,<a0=reg128#8%top
# asm 2: vswp <k0=d20,<a0=d15
vswp d20,d15

# qhasm: 	adr2 = input_2 + 32
# asm 1: add >adr2=int32#7,<input_2=int32#3,#32
# asm 2: add >adr2=r6,<input_2=r2,#32
add r6,r2,#32

# qhasm: 	b2 aligned = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b2=reg128#6%bot->b2=reg128#6%top},[<adr2=int32#7,: 128]!
# asm 2: vld1.8 {>b2=d10->b2=d11},[<adr2=r6,: 128]!
vld1.8 {d10-d11},[r6,: 128]!

# qhasm: adr0 = input_0 + 32
# asm 1: add >adr0=int32#7,<input_0=int32#1,#32
# asm 2: add >adr0=r6,<input_0=r0,#32
add r6,r0,#32

# qhasm: mem128[adr0] aligned = a2; adr0+=16	
# asm 1: vst1.8 {<a2=reg128#3%bot-<a2=reg128#3%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<a2=d4-<a2=d5},[<adr0=r6,: 128]!
vst1.8 {d4-d5},[r6,: 128]!

# qhasm: mem128[adr0] aligned = k0; adr0+=16	
# asm 1: vst1.8 {<k0=reg128#11%bot-<k0=reg128#11%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<k0=d20-<k0=d21},[<adr0=r6,: 128]!
vst1.8 {d20-d21},[r6,: 128]!

# qhasm: h3[0,1] +=   a2[0] unsigned* b2[0]; h3[2,3] +=   a2[1] unsigned* b2[1]	
# asm 1: vmlal.u32 <h3=reg128#4,<a2=reg128#3%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <h3=q3,<a2=d4,<b2=d10
vmlal.u32 q3,d4,d10

# qhasm: h4[0,1]  =   a2[0] unsigned* b0[0]; h4[2,3]  =   a2[1] unsigned* b0[1]
# asm 1: vmull.u32 >h4=reg128#11,<a2=reg128#3%bot,<b0=reg128#5%bot
# asm 2: vmull.u32 >h4=q10,<a2=d4,<b0=d8
vmull.u32 q10,d4,d8

# qhasm: h4[0,1] += _2a1[2] unsigned* b0[2]; h4[2,3] += _2a1[3] unsigned* b0[3]
# asm 1: vmlal.u32 <h4=reg128#11,<_2a1=reg128#14%top,<b0=reg128#5%top
# asm 2: vmlal.u32 <h4=q10,<_2a1=d27,<b0=d9
vmlal.u32 q10,d27,d9

# qhasm: h4[0,1] +=   a1[0] unsigned* b1[0]; h4[2,3] +=   a1[1] unsigned* b1[1]
# asm 1: vmlal.u32 <h4=reg128#11,<a1=reg128#9%bot,<b1=reg128#15%bot
# asm 2: vmlal.u32 <h4=q10,<a1=d16,<b1=d28
vmlal.u32 q10,d16,d28

# qhasm: h4[0,1] += _2a0[0] unsigned* b1[2]; h4[2,3] += _2a0[1] unsigned* b1[3]
# asm 1: vmlal.u32 <h4=reg128#11,<_2a0=reg128#2%bot,<b1=reg128#15%top
# asm 2: vmlal.u32 <h4=q10,<_2a0=d2,<b1=d29
vmlal.u32 q10,d2,d29

# qhasm: h4[0,1] +=   a0[0] unsigned* b2[0]; h4[2,3] +=   a0[1] unsigned* b2[1]
# asm 1: vmlal.u32 <h4=reg128#11,<a0=reg128#8%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <h4=q10,<a0=d14,<b2=d10
vmlal.u32 q10,d14,d10

# qhasm: 2x t  = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#16,<h3=reg128#4,#25
# asm 2: vshr.u64 >t=q15,<h3=q3,#25
vshr.u64 q15,q3,#25

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#4,<h3=reg128#4,<mask25=reg128#7
# asm 2: vand >h3=q3,<h3=q3,<mask25=q6
vand q3,q3,q6

# qhasm: h0[0,1] += _2a2[0] unsigned* b0[2]; h0[2,3] += _2a2[1] unsigned* b0[3]
# asm 1: vmlal.u32 <h0=reg128#12,<_2a2=reg128#1%bot,<b0=reg128#5%top
# asm 2: vmlal.u32 <h0=q11,<_2a2=d0,<b0=d9
vmlal.u32 q11,d0,d9

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#11,<h4=reg128#11,<t=reg128#16
# asm 2: vadd.i64 >h4=q10,<h4=q10,<t=q15
vadd.i64 q10,q10,q15

# qhasm: h0[0,1] += _2a1[2] unsigned* b1[0]; h0[2,3] += _2a1[3] unsigned* b1[1]	
# asm 1: vmlal.u32 <h0=reg128#12,<_2a1=reg128#14%top,<b1=reg128#15%bot
# asm 2: vmlal.u32 <h0=q11,<_2a1=d27,<b1=d28
vmlal.u32 q11,d27,d28

# qhasm: h0[0,1] += _2a1[0] unsigned* b1[2]; h0[2,3] += _2a1[1] unsigned* b1[3]
# asm 1: vmlal.u32 <h0=reg128#12,<_2a1=reg128#14%bot,<b1=reg128#15%top
# asm 2: vmlal.u32 <h0=q11,<_2a1=d26,<b1=d29
vmlal.u32 q11,d26,d29

# qhasm: h0[0,1] += _2a0[0] unsigned* b2[0]; h0[2,3] += _2a0[1] unsigned* b2[1]
# asm 1: vmlal.u32 <h0=reg128#12,<_2a0=reg128#2%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <h0=q11,<_2a0=d2,<b2=d10
vmlal.u32 q11,d2,d10

# qhasm: 2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#16,<h4=reg128#11,#25
# asm 2: vshr.u64 >t=q15,<h4=q10,#25
vshr.u64 q15,q10,#25

# qhasm: h4 &= mask25
# asm 1: vand >h4=reg128#11,<h4=reg128#11,<mask25=reg128#7
# asm 2: vand >h4=q10,<h4=q10,<mask25=q6
vand q10,q10,q6

# qhasm: h1[0,1] +=   a2[0] unsigned* b1[0]; h1[2,3] +=   a2[1] unsigned* b1[1]	
# asm 1: vmlal.u32 <h1=reg128#10,<a2=reg128#3%bot,<b1=reg128#15%bot
# asm 2: vmlal.u32 <h1=q9,<a2=d4,<b1=d28
vmlal.u32 q9,d4,d28

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#12,<h0=reg128#12,<t=reg128#16
# asm 2: vadd.i64 >h0=q11,<h0=q11,<t=q15
vadd.i64 q11,q11,q15

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 16
# asm 1: add >adr5=int32#7,<adr5=int32#7,#16
# asm 2: add >adr5=r6,<adr5=r6,#16
add r6,r6,#16

# qhasm: mask26 aligned = mem128[adr5]
# asm 1: vld1.8 {>mask26=reg128#16%bot->mask26=reg128#16%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>mask26=d30->mask26=d31},[<adr5=r6,: 128]
vld1.8 {d30-d31},[r6,: 128]

# qhasm: h1[0,1] += _2a1[2] unsigned* b1[2]; h1[2,3] += _2a1[3] unsigned* b1[3]	
# asm 1: vmlal.u32 <h1=reg128#10,<_2a1=reg128#14%top,<b1=reg128#15%top
# asm 2: vmlal.u32 <h1=q9,<_2a1=d27,<b1=d29
vmlal.u32 q9,d27,d29

# qhasm: h1[0,1] +=   a1[0] unsigned* b2[0]; h1[2,3] +=   a1[1] unsigned* b2[1]
# asm 1: vmlal.u32 <h1=reg128#10,<a1=reg128#9%bot,<b2=reg128#6%bot
# asm 2: vmlal.u32 <h1=q9,<a1=d16,<b2=d10
vmlal.u32 q9,d16,d10

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#9,<h0=reg128#12,#26
# asm 2: vshr.u64 >t=q8,<h0=q11,#26
vshr.u64 q8,q11,#26

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#12,<h0=reg128#12,<mask26=reg128#16
# asm 2: vand >h0=q11,<h0=q11,<mask26=q15
vand q11,q11,q15

# qhasm: h2[0,1] += _2a0[0] unsigned* b0[2]; h2[2,3] += _2a0[1] unsigned* b0[3]	
# asm 1: vmlal.u32 <h2=reg128#13,<_2a0=reg128#2%bot,<b0=reg128#5%top
# asm 2: vmlal.u32 <h2=q12,<_2a0=d2,<b0=d9
vmlal.u32 q12,d2,d9

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#10,<t=reg128#9
# asm 2: vadd.i64 >h1=q4,<h1=q9,<t=q8
vadd.i64 q4,q9,q8

# qhasm: h2[0,1] +=   a0[0] unsigned* b1[0]; h2[2,3] +=   a0[1] unsigned* b1[1]	
# asm 1: vmlal.u32 <h2=reg128#13,<a0=reg128#8%bot,<b1=reg128#15%bot
# asm 2: vmlal.u32 <h2=q12,<a0=d14,<b1=d28
vmlal.u32 q12,d14,d28

# qhasm: h2[0,1] += _2a2[0] unsigned* b1[2]; h2[2,3] += _2a2[1] unsigned* b1[3]
# asm 1: vmlal.u32 <h2=reg128#13,<_2a2=reg128#1%bot,<b1=reg128#15%top
# asm 2: vmlal.u32 <h2=q12,<_2a2=d0,<b1=d29
vmlal.u32 q12,d0,d29

# qhasm: h2[0,1] += _2a1[2] unsigned* b2[0]; h2[2,3] += _2a1[3] unsigned* b2[1]
# asm 1: vmlal.u32 <h2=reg128#13,<_2a1=reg128#14%top,<b2=reg128#6%bot
# asm 2: vmlal.u32 <h2=q12,<_2a1=d27,<b2=d10
vmlal.u32 q12,d27,d10

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q7,<h1=q4,#25
vshr.u64 q7,q4,#25

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#7
# asm 2: vand >h1=q4,<h1=q4,<mask25=q6
vand q4,q4,q6

# qhasm: 	k3[0,1]  =   a2[2] unsigned* b2[2]; k3[2,3]  =   a2[3] unsigned* b2[3]	
# asm 1: vmull.u32 >k3=reg128#9,<a2=reg128#3%top,<b2=reg128#6%top
# asm 2: vmull.u32 >k3=q8,<a2=d5,<b2=d11
vmull.u32 q8,d5,d11

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#8,<h2=reg128#13,<t=reg128#8
# asm 2: vadd.i64 >h2=q7,<h2=q12,<t=q7
vadd.i64 q7,q12,q7

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#12,<h1=reg128#5
# asm 2: vtrn.32 <h0=q11,<h1=q4
vtrn.32 q11,q4

# qhasm: 	k0[0,1]  = _2a0[2] unsigned* b2[2]; k0[2,3]  = _2a0[3] unsigned* b2[3]	
# asm 1: vmull.u32 >k0=reg128#5,<_2a0=reg128#2%top,<b2=reg128#6%top
# asm 2: vmull.u32 >k0=q4,<_2a0=d3,<b2=d11
vmull.u32 q4,d3,d11

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#10,<h2=reg128#8,#26
# asm 2: vshr.u64 >t=q9,<h2=q7,#26
vshr.u64 q9,q7,#26

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#12%bot,<h0=reg128#12%top
# asm 2: vtrn.32 <h0=d22,<h0=d23
vtrn.32 d22,d23

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#8,<h2=reg128#8,<mask26=reg128#16
# asm 2: vand >h2=q7,<h2=q7,<mask26=q15
vand q7,q7,q15

# qhasm: 	adr2 = input_2 + 48
# asm 1: add >adr2=int32#7,<input_2=int32#3,#48
# asm 2: add >adr2=r6,<input_2=r2,#48
add r6,r2,#48

# qhasm: 	b3 aligned = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b3=reg128#13%bot->b3=reg128#13%top},[<adr2=int32#7,: 128]!
# asm 2: vld1.8 {>b3=d24->b3=d25},[<adr2=r6,: 128]!
vld1.8 {d24-d25},[r6,: 128]!

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#4,<h3=reg128#4,<t=reg128#10
# asm 2: vadd.i64 >h3=q3,<h3=q3,<t=q9
vadd.i64 q3,q3,q9

# qhasm: adr0 = input_0
# asm 1: mov >adr0=int32#8,<input_0=int32#1
# asm 2: mov >adr0=r7,<input_0=r0
mov r7,r0

# qhasm: mem128[adr0] aligned = h0; adr0+=16
# asm 1: vst1.8 {<h0=reg128#12%bot-<h0=reg128#12%top},[<adr0=int32#8,: 128]!
# asm 2: vst1.8 {<h0=d22-<h0=d23},[<adr0=r7,: 128]!
vst1.8 {d22-d23},[r7,: 128]!

# qhasm: 	k0[0,1] += _2a2[2] unsigned* b3[2]; k0[2,3] += _2a2[3] unsigned* b3[3]
# asm 1: vmlal.u32 <k0=reg128#5,<_2a2=reg128#1%top,<b3=reg128#13%top
# asm 2: vmlal.u32 <k0=q4,<_2a2=d1,<b3=d25
vmlal.u32 q4,d1,d25

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h3=reg128#4,#25
# asm 2: vshr.u64 >t=q9,<h3=q3,#25
vshr.u64 q9,q3,#25

# qhasm: 	adr0 = input_0 + 48
# asm 1: add >adr0=int32#8,<input_0=int32#1,#48
# asm 2: add >adr0=r7,<input_0=r0,#48
add r7,r0,#48

# qhasm: 	a3 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a3=reg128#12%bot->a3=reg128#12%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a3=d22->a3=d23},[<adr0=r7,: 128]!
vld1.8 {d22-d23},[r7,: 128]!

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#4,<h3=reg128#4,<mask25=reg128#7
# asm 2: vand >h3=q3,<h3=q3,<mask25=q6
vand q3,q3,q6

# qhasm: 	a4 aligned = mem128[adr0]; adr0+=16
# asm 1: vld1.8 {>a4=reg128#14%bot->a4=reg128#14%top},[<adr0=int32#8,: 128]!
# asm 2: vld1.8 {>a4=d26->a4=d27},[<adr0=r7,: 128]!
vld1.8 {d26-d27},[r7,: 128]!

# qhasm: 	k4[0,1]  =   a2[2] unsigned* b3[0]; k4[2,3]  =   a2[3] unsigned* b3[1]	
# asm 1: vmull.u32 >k4=reg128#15,<a2=reg128#3%top,<b3=reg128#13%bot
# asm 2: vmull.u32 >k4=q14,<a2=d5,<b3=d24
vmull.u32 q14,d5,d24

# qhasm: 2x h4 += t
# asm 1: vadd.i64 >h4=reg128#10,<h4=reg128#11,<t=reg128#10
# asm 2: vadd.i64 >h4=q9,<h4=q10,<t=q9
vadd.i64 q9,q10,q9

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#8,<h3=reg128#4
# asm 2: vtrn.32 <h2=q7,<h3=q3
vtrn.32 q7,q3

# qhasm: 	2x _2a4 = a4 + a4
# asm 1: vadd.i64 >_2a4=reg128#4,<a4=reg128#14,<a4=reg128#14
# asm 2: vadd.i64 >_2a4=q3,<a4=q13,<a4=q13
vadd.i64 q3,q13,q13

# qhasm: b4 aligned = mem128[adr2]; adr2+=16
# asm 1: vld1.8 {>b4=reg128#11%bot->b4=reg128#11%top},[<adr2=int32#7,: 128]!
# asm 2: vld1.8 {>b4=d20->b4=d21},[<adr2=r6,: 128]!
vld1.8 {d20-d21},[r6,: 128]!

# qhasm: 	k3[0,1] +=   a4[2] unsigned* b3[0]; k3[2,3] +=   a4[3] unsigned* b3[1]	
# asm 1: vmlal.u32 <k3=reg128#9,<a4=reg128#14%top,<b3=reg128#13%bot
# asm 2: vmlal.u32 <k3=q8,<a4=d27,<b3=d24
vmlal.u32 q8,d27,d24

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#8%bot,<h2=reg128#8%top
# asm 2: vtrn.32 <h2=d14,<h2=d15
vtrn.32 d14,d15

# qhasm: k3[0,1] +=   a4[0] unsigned* b3[2]; k3[2,3] +=   a4[1] unsigned* b3[3]	
# asm 1: vmlal.u32 <k3=reg128#9,<a4=reg128#14%bot,<b3=reg128#13%top
# asm 2: vmlal.u32 <k3=q8,<a4=d26,<b3=d25
vmlal.u32 q8,d26,d25

# qhasm: k3[0,1] +=   a3[2] unsigned* b4[0]; k3[2,3] +=   a3[3] unsigned* b4[1]
# asm 1: vmlal.u32 <k3=reg128#9,<a3=reg128#12%top,<b4=reg128#11%bot
# asm 2: vmlal.u32 <k3=q8,<a3=d23,<b4=d20
vmlal.u32 q8,d23,d20

# qhasm: k3[0,1] +=   a3[0] unsigned* b4[2]; k3[2,3] +=   a3[1] unsigned* b4[3]
# asm 1: vmlal.u32 <k3=reg128#9,<a3=reg128#12%bot,<b4=reg128#11%top
# asm 2: vmlal.u32 <k3=q8,<a3=d22,<b4=d21
vmlal.u32 q8,d22,d21

# qhasm: k4[0,1] += _2a4[2] unsigned* b3[2]; k4[2,3] += _2a4[3] unsigned* b3[3]
# asm 1: vmlal.u32 <k4=reg128#15,<_2a4=reg128#4%top,<b3=reg128#13%top
# asm 2: vmlal.u32 <k4=q14,<_2a4=d7,<b3=d25
vmlal.u32 q14,d7,d25

# qhasm: k4[0,1] +=   a4[0] unsigned* b4[0]; k4[2,3] +=   a4[1] unsigned* b4[1]
# asm 1: vmlal.u32 <k4=reg128#15,<a4=reg128#14%bot,<b4=reg128#11%bot
# asm 2: vmlal.u32 <k4=q14,<a4=d26,<b4=d20
vmlal.u32 q14,d26,d20

# qhasm: k4[0,1] += _2a0[2] unsigned* b4[2]; k4[2,3] += _2a0[3] unsigned* b4[3]	
# asm 1: vmlal.u32 <k4=reg128#15,<_2a0=reg128#2%top,<b4=reg128#11%top
# asm 2: vmlal.u32 <k4=q14,<_2a0=d3,<b4=d21
vmlal.u32 q14,d3,d21

# qhasm: k4[0,1] +=   a3[0] unsigned* b2[2]; k4[2,3] +=   a3[1] unsigned* b2[3]
# asm 1: vmlal.u32 <k4=reg128#15,<a3=reg128#12%bot,<b2=reg128#6%top
# asm 2: vmlal.u32 <k4=q14,<a3=d22,<b2=d11
vmlal.u32 q14,d22,d11

# qhasm: k2[0,1]  = _2a2[2] unsigned* b4[2]; k2[2,3]  = _2a2[3] unsigned* b4[3]
# asm 1: vmull.u32 >k2=reg128#1,<_2a2=reg128#1%top,<b4=reg128#11%top
# asm 2: vmull.u32 >k2=q0,<_2a2=d1,<b4=d21
vmull.u32 q0,d1,d21

# qhasm: k2[0,1] += _2a0[2] unsigned* b3[2]; k2[2,3] += _2a0[3] unsigned* b3[3]
# asm 1: vmlal.u32 <k2=reg128#1,<_2a0=reg128#2%top,<b3=reg128#13%top
# asm 2: vmlal.u32 <k2=q0,<_2a0=d3,<b3=d25
vmlal.u32 q0,d3,d25

# qhasm: 2x t2 = k3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#2,<k3=reg128#9,#25
# asm 2: vshr.u64 >t2=q1,<k3=q8,#25
vshr.u64 q1,q8,#25

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#9,<k3=reg128#9,<mask25=reg128#7
# asm 2: vand >k3=q8,<k3=q8,<mask25=q6
vand q8,q8,q6

# qhasm: adr0 = input_0 + 16			
# asm 1: add >adr0=int32#7,<input_0=int32#1,#16
# asm 2: add >adr0=r6,<input_0=r0,#16
add r6,r0,#16

# qhasm: mem128[adr0] aligned = h2; adr0+=16	
# asm 1: vst1.8 {<h2=reg128#8%bot-<h2=reg128#8%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<h2=d14-<h2=d15},[<adr0=r6,: 128]!
vst1.8 {d14-d15},[r6,: 128]!

# qhasm: k0[0,1] +=   a3[0] unsigned* b3[0]; k0[2,3] +=   a3[1] unsigned* b3[1]	
# asm 1: vmlal.u32 <k0=reg128#5,<a3=reg128#12%bot,<b3=reg128#13%bot
# asm 2: vmlal.u32 <k0=q4,<a3=d22,<b3=d24
vmlal.u32 q4,d22,d24

# qhasm: 2x k4 += t2
# asm 1: vadd.i64 >k4=reg128#2,<k4=reg128#15,<t2=reg128#2
# asm 2: vadd.i64 >k4=q1,<k4=q14,<t2=q1
vadd.i64 q1,q14,q1

# qhasm: k0[0,1] += _2a4[2] unsigned* b4[0]; k0[2,3] += _2a4[3] unsigned* b4[1]
# asm 1: vmlal.u32 <k0=reg128#5,<_2a4=reg128#4%top,<b4=reg128#11%bot
# asm 2: vmlal.u32 <k0=q4,<_2a4=d7,<b4=d20
vmlal.u32 q4,d7,d20

# qhasm: k0[0,1] += _2a4[0] unsigned* b4[2]; k0[2,3] += _2a4[1] unsigned* b4[3]
# asm 1: vmlal.u32 <k0=reg128#5,<_2a4=reg128#4%bot,<b4=reg128#11%top
# asm 2: vmlal.u32 <k0=q4,<_2a4=d6,<b4=d21
vmlal.u32 q4,d6,d21

# qhasm: 2x t2 = k4 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#8,<k4=reg128#2,#25
# asm 2: vshr.u64 >t2=q7,<k4=q1,#25
vshr.u64 q7,q1,#25

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#2,<k4=reg128#2,<mask25=reg128#7
# asm 2: vand >k4=q1,<k4=q1,<mask25=q6
vand q1,q1,q6

# qhasm: k1[0,1]  =   a3[2] unsigned* b3[0]; k1[2,3]  =   a3[3] unsigned* b3[1]	
# asm 1: vmull.u32 >k1=reg128#15,<a3=reg128#12%top,<b3=reg128#13%bot
# asm 2: vmull.u32 >k1=q14,<a3=d23,<b3=d24
vmull.u32 q14,d23,d24

# qhasm: 2x k0 += t2
# asm 1: vadd.i64 >k0=reg128#5,<k0=reg128#5,<t2=reg128#8
# asm 2: vadd.i64 >k0=q4,<k0=q4,<t2=q7
vadd.i64 q4,q4,q7

# qhasm: k1[0,1] +=   a3[0] unsigned* b3[2]; k1[2,3] +=   a3[1] unsigned* b3[3]
# asm 1: vmlal.u32 <k1=reg128#15,<a3=reg128#12%bot,<b3=reg128#13%top
# asm 2: vmlal.u32 <k1=q14,<a3=d22,<b3=d25
vmlal.u32 q14,d22,d25

# qhasm: k1[0,1] +=   a2[2] unsigned* b4[0]; k1[2,3] +=   a2[3] unsigned* b4[1]
# asm 1: vmlal.u32 <k1=reg128#15,<a2=reg128#3%top,<b4=reg128#11%bot
# asm 2: vmlal.u32 <k1=q14,<a2=d5,<b4=d20
vmlal.u32 q14,d5,d20

# qhasm: k1[0,1] += _2a4[2] unsigned* b4[2]; k1[2,3] += _2a4[3] unsigned* b4[3]
# asm 1: vmlal.u32 <k1=reg128#15,<_2a4=reg128#4%top,<b4=reg128#11%top
# asm 2: vmlal.u32 <k1=q14,<_2a4=d7,<b4=d21
vmlal.u32 q14,d7,d21

# qhasm: k1[0,1] +=   a4[0] unsigned* b2[2]; k1[2,3] +=   a4[1] unsigned* b2[3]
# asm 1: vmlal.u32 <k1=reg128#15,<a4=reg128#14%bot,<b2=reg128#6%top
# asm 2: vmlal.u32 <k1=q14,<a4=d26,<b2=d11
vmlal.u32 q14,d26,d11

# qhasm: 2x t2 = k0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#8,<k0=reg128#5,#26
# asm 2: vshr.u64 >t2=q7,<k0=q4,#26
vshr.u64 q7,q4,#26

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#5,<mask26=reg128#16
# asm 2: vand >k0=q4,<k0=q4,<mask26=q15
vand q4,q4,q15

# qhasm: k2[0,1] +=   a4[0] unsigned* b3[0]; k2[2,3] +=   a4[1] unsigned* b3[1]	
# asm 1: vmlal.u32 <k2=reg128#1,<a4=reg128#14%bot,<b3=reg128#13%bot
# asm 2: vmlal.u32 <k2=q0,<a4=d26,<b3=d24
vmlal.u32 q0,d26,d24

# qhasm: 2x k1 += t2
# asm 1: vadd.i64 >k1=reg128#8,<k1=reg128#15,<t2=reg128#8
# asm 2: vadd.i64 >k1=q7,<k1=q14,<t2=q7
vadd.i64 q7,q14,q7

# qhasm: k2[0,1] +=   a3[0] unsigned* b4[0]; k2[2,3] +=   a3[1] unsigned* b4[1]
# asm 1: vmlal.u32 <k2=reg128#1,<a3=reg128#12%bot,<b4=reg128#11%bot
# asm 2: vmlal.u32 <k2=q0,<a3=d22,<b4=d20
vmlal.u32 q0,d22,d20

# qhasm: k2[0,1] += _2a4[2] unsigned* b2[2]; k2[2,3] += _2a4[3] unsigned* b2[3]
# asm 1: vmlal.u32 <k2=reg128#1,<_2a4=reg128#4%top,<b2=reg128#6%top
# asm 2: vmlal.u32 <k2=q0,<_2a4=d7,<b2=d11
vmlal.u32 q0,d7,d11

# qhasm: 2x t2 = k1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#4,<k1=reg128#8,#25
# asm 2: vshr.u64 >t2=q3,<k1=q7,#25
vshr.u64 q3,q7,#25

# qhasm: 	adr1 = input_1
# asm 1: mov >adr1=int32#7,<input_1=int32#2
# asm 2: mov >adr1=r6,<input_1=r1
mov r6,r1

# qhasm: 	b0 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b0=reg128#6%bot->b0=reg128#6%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b0=d10->b0=d11},[<adr1=r6,: 128]!
vld1.8 {d10-d11},[r6,: 128]!

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#8,<k1=reg128#8,<mask25=reg128#7
# asm 2: vand >k1=q7,<k1=q7,<mask25=q6
vand q7,q7,q6

# qhasm: 	b1 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b1=reg128#11%bot->b1=reg128#11%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b1=d20->b1=d21},[<adr1=r6,: 128]!
vld1.8 {d20-d21},[r6,: 128]!

# qhasm: 	adr1 = input_1 + 48
# asm 1: add >adr1=int32#7,<input_1=int32#2,#48
# asm 2: add >adr1=r6,<input_1=r1,#48
add r6,r1,#48

# qhasm: 	b3 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b3=reg128#12%bot->b3=reg128#12%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b3=d22->b3=d23},[<adr1=r6,: 128]!
vld1.8 {d22-d23},[r6,: 128]!

# qhasm: 	h0[0,1]  =   b0[0] unsigned*   b0[0]; h0[2,3]  =   b0[1] unsigned*   b0[1]	
# asm 1: vmull.u32 >h0=reg128#13,<b0=reg128#6%bot,<b0=reg128#6%bot
# asm 2: vmull.u32 >h0=q12,<b0=d10,<b0=d10
vmull.u32 q12,d10,d10

# qhasm: 2x k2 += t2
# asm 1: vadd.i64 >k2=reg128#1,<k2=reg128#1,<t2=reg128#4
# asm 2: vadd.i64 >k2=q0,<k2=q0,<t2=q3
vadd.i64 q0,q0,q3

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#5,<k1=reg128#8
# asm 2: vtrn.32 <k0=q4,<k1=q7
vtrn.32 q4,q7

# qhasm: 	h5[0,1]  =   b1[0] unsigned*   b1[0]; h5[2,3]  =   b1[1] unsigned*   b1[1]	
# asm 1: vmull.u32 >h5=reg128#4,<b1=reg128#11%bot,<b1=reg128#11%bot
# asm 2: vmull.u32 >h5=q3,<b1=d20,<b1=d20
vmull.u32 q3,d20,d20

# qhasm: 2x t2 = k2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#8,<k2=reg128#1,#26
# asm 2: vshr.u64 >t2=q7,<k2=q0,#26
vshr.u64 q7,q0,#26

# qhasm: 	b0 b3 = b0[0]b3[0] b0[1]b3[1]
# asm 1: vswp <b3=reg128#12%bot,<b0=reg128#6%top
# asm 2: vswp <b3=d22,<b0=d11
vswp d22,d11

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#1,<k2=reg128#1,<mask26=reg128#16
# asm 2: vand >k2=q0,<k2=q0,<mask26=q15
vand q0,q0,q15

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#5%bot,<k0=reg128#5%top
# asm 2: vtrn.32 <k0=d8,<k0=d9
vtrn.32 d8,d9

# qhasm: 2x k3 += t2
# asm 1: vadd.i64 >k3=reg128#8,<k3=reg128#9,<t2=reg128#8
# asm 2: vadd.i64 >k3=q7,<k3=q8,<t2=q7
vadd.i64 q7,q8,q7

# qhasm: 	adr1 = input_1 + 32
# asm 1: add >adr1=int32#7,<input_1=int32#2,#32
# asm 2: add >adr1=r6,<input_1=r1,#32
add r6,r1,#32

# qhasm: 	b2 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b2=reg128#9%bot->b2=reg128#9%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b2=d16->b2=d17},[<adr1=r6,: 128]!
vld1.8 {d16-d17},[r6,: 128]!

# qhasm: 	h3[0,1]  =   b2[0] unsigned*   b2[0]; h3[2,3]  =   b2[1] unsigned*   b2[1]	
# asm 1: vmull.u32 >h3=reg128#14,<b2=reg128#9%bot,<b2=reg128#9%bot
# asm 2: vmull.u32 >h3=q13,<b2=d16,<b2=d16
vmull.u32 q13,d16,d16

# qhasm: 2x t2 = k3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#15,<k3=reg128#8,#25
# asm 2: vshr.u64 >t2=q14,<k3=q7,#25
vshr.u64 q14,q7,#25

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#7,<k3=reg128#8,<mask25=reg128#7
# asm 2: vand >k3=q6,<k3=q7,<mask25=q6
vand q6,q7,q6

# qhasm: 	2x _2b0 = b3 + b3
# asm 1: vadd.i64 >_2b0=reg128#8,<b3=reg128#12,<b3=reg128#12
# asm 2: vadd.i64 >_2b0=q7,<b3=q11,<b3=q11
vadd.i64 q7,q11,q11

# qhasm: 	2x _2b1 = b1 + b1
# asm 1: vadd.i64 >_2b1=reg128#16,<b1=reg128#11,<b1=reg128#11
# asm 2: vadd.i64 >_2b1=q15,<b1=q10,<b1=q10
vadd.i64 q15,q10,q10

# qhasm: adr0 = input_0 + 48
# asm 1: add >adr0=int32#7,<input_0=int32#1,#48
# asm 2: add >adr0=r6,<input_0=r0,#48
add r6,r0,#48

# qhasm: mem128[adr0] aligned = k0; adr0+=16
# asm 1: vst1.8 {<k0=reg128#5%bot-<k0=reg128#5%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<k0=d8-<k0=d9},[<adr0=r6,: 128]!
vst1.8 {d8-d9},[r6,: 128]!

# qhasm: 2x k4 += t2
# asm 1: vadd.i64 >k4=reg128#2,<k4=reg128#2,<t2=reg128#15
# asm 2: vadd.i64 >k4=q1,<k4=q1,<t2=q14
vadd.i64 q1,q1,q14

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#1,<k3=reg128#7
# asm 2: vtrn.32 <k2=q0,<k3=q6
vtrn.32 q0,q6

# qhasm: 	2x _2b2 = b2 + b2
# asm 1: vadd.i64 >_2b2=reg128#5,<b2=reg128#9,<b2=reg128#9
# asm 2: vadd.i64 >_2b2=q4,<b2=q8,<b2=q8
vadd.i64 q4,q8,q8

# qhasm: 	b0 b3 = b0[0]b3[0] b0[1]b3[1]
# asm 1: vswp <b3=reg128#12%bot,<b0=reg128#6%top
# asm 2: vswp <b3=d22,<b0=d11
vswp d22,d11

# qhasm: 	h0[0,1] += _2b1[2] unsigned* _2b1[0]; h0[2,3] += _2b1[3] unsigned* _2b1[1]	
# asm 1: vmlal.u32 <h0=reg128#13,<_2b1=reg128#16%top,<_2b1=reg128#16%bot
# asm 2: vmlal.u32 <h0=q12,<_2b1=d31,<_2b1=d30
vmlal.u32 q12,d31,d30

# qhasm: 	h0[0,1] += _2b2[0] unsigned* _2b0[0]; h0[2,3] += _2b2[1] unsigned* _2b0[1]	
# asm 1: vmlal.u32 <h0=reg128#13,<_2b2=reg128#5%bot,<_2b0=reg128#8%bot
# asm 2: vmlal.u32 <h0=q12,<_2b2=d8,<_2b0=d14
vmlal.u32 q12,d8,d14

# qhasm: 	h1[0,1]  = _2b1[2] unsigned*   b1[2]; h1[2,3]  = _2b1[3] unsigned*   b1[3]
# asm 1: vmull.u32 >h1=reg128#7,<_2b1=reg128#16%top,<b1=reg128#11%top
# asm 2: vmull.u32 >h1=q6,<_2b1=d31,<b1=d21
vmull.u32 q6,d31,d21

# qhasm: 	h1[0,1] += _2b0[0] unsigned*   b0[0]; h1[2,3] += _2b0[1] unsigned*   b0[1]	
# asm 1: vmlal.u32 <h1=reg128#7,<_2b0=reg128#8%bot,<b0=reg128#6%bot
# asm 2: vmlal.u32 <h1=q6,<_2b0=d14,<b0=d10
vmlal.u32 q6,d14,d10

# qhasm: 	h1[0,1] += _2b2[0] unsigned*   b1[0]; h1[2,3] += _2b2[1] unsigned*   b1[1]
# asm 1: vmlal.u32 <h1=reg128#7,<_2b2=reg128#5%bot,<b1=reg128#11%bot
# asm 2: vmlal.u32 <h1=q6,<_2b2=d8,<b1=d20
vmlal.u32 q6,d8,d20

# qhasm: 	adr5 = input_5
# asm 1: ldr >adr5=int32#8,<input_5=stack32#arg18
# asm 2: ldr >adr5=r7,<input_5=[r12,#68]
ldr r7,[r12,#68]

# qhasm: 	adr5 += 16
# asm 1: add >adr5=int32#8,<adr5=int32#8,#16
# asm 2: add >adr5=r7,<adr5=r7,#16
add r7,r7,#16

# qhasm: 	mask26 aligned = mem128[adr5]
# asm 1: vld1.8 {>mask26=reg128#11%bot->mask26=reg128#11%top},[<adr5=int32#8,: 128]
# asm 2: vld1.8 {>mask26=d20->mask26=d21},[<adr5=r7,: 128]
vld1.8 {d20-d21},[r7,: 128]

# qhasm: 	2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#15,<h0=reg128#13,#26
# asm 2: vshr.u64 >t=q14,<h0=q12,#26
vshr.u64 q14,q12,#26

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#1%bot,<k2=reg128#1%top
# asm 2: vtrn.32 <k2=d0,<k2=d1
vtrn.32 d0,d1

# qhasm: 	h0 &= mask26
# asm 1: vand >h0=reg128#13,<h0=reg128#13,<mask26=reg128#11
# asm 2: vand >h0=q12,<h0=q12,<mask26=q10
vand q12,q12,q10

# qhasm: h4 k4 = h4[0]k4[0]h4[2]k4[2] h4[1]k4[1]h4[3]k4[3]
# asm 1: vtrn.32 <h4=reg128#10,<k4=reg128#2
# asm 2: vtrn.32 <h4=q9,<k4=q1
vtrn.32 q9,q1

# qhasm: mem128[adr0] aligned = k2; adr0+=16
# asm 1: vst1.8 {<k2=reg128#1%bot-<k2=reg128#1%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<k2=d0-<k2=d1},[<adr0=r6,: 128]!
vst1.8 {d0-d1},[r6,: 128]!

# qhasm: 	h2[0,1]  = _2b0[0] unsigned*   b0[2]; h2[2,3]  = _2b0[1] unsigned*   b0[3]	
# asm 1: vmull.u32 >h2=reg128#1,<_2b0=reg128#8%bot,<b0=reg128#6%top
# asm 2: vmull.u32 >h2=q0,<_2b0=d14,<b0=d11
vmull.u32 q0,d14,d11

# qhasm: 	2x h1 += t
# asm 1: vadd.i64 >h1=reg128#2,<h1=reg128#7,<t=reg128#15
# asm 2: vadd.i64 >h1=q1,<h1=q6,<t=q14
vadd.i64 q1,q6,q14

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#10%bot,<h4=reg128#10%top
# asm 2: vtrn.32 <h4=d18,<h4=d19
vtrn.32 d18,d19

# qhasm: 	h2[0,1] += _2b1[0] unsigned*   b0[0]; h2[2,3] += _2b1[1] unsigned*   b0[1]	
# asm 1: vmlal.u32 <h2=reg128#1,<_2b1=reg128#16%bot,<b0=reg128#6%bot
# asm 2: vmlal.u32 <h2=q0,<_2b1=d30,<b0=d10
vmlal.u32 q0,d30,d10

# qhasm: h2[0,1] += _2b2[0] unsigned* _2b1[2]; h2[2,3] += _2b2[1] unsigned* _2b1[3]	
# asm 1: vmlal.u32 <h2=reg128#1,<_2b2=reg128#5%bot,<_2b1=reg128#16%top
# asm 2: vmlal.u32 <h2=q0,<_2b2=d8,<_2b1=d31
vmlal.u32 q0,d8,d31

# qhasm: 2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<h1=reg128#2,#25
# asm 2: vshr.u64 >t=q6,<h1=q1,#25
vshr.u64 q6,q1,#25

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: mask25 aligned = mem128[adr5]
# asm 1: vld1.8 {>mask25=reg128#15%bot->mask25=reg128#15%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>mask25=d28->mask25=d29},[<adr5=r6,: 128]
vld1.8 {d28-d29},[r6,: 128]

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#2,<h1=reg128#2,<mask25=reg128#15
# asm 2: vand >h1=q1,<h1=q1,<mask25=q14
vand q1,q1,q14

# qhasm: adr0 = input_0 + 32			
# asm 1: add >adr0=int32#7,<input_0=int32#1,#32
# asm 2: add >adr0=r6,<input_0=r0,#32
add r6,r0,#32

# qhasm: mem128[adr0] aligned = h4; adr0+=16	
# asm 1: vst1.8 {<h4=reg128#10%bot-<h4=reg128#10%top},[<adr0=int32#7,: 128]!
# asm 2: vst1.8 {<h4=d18-<h4=d19},[<adr0=r6,: 128]!
vst1.8 {d18-d19},[r6,: 128]!

# qhasm: h3[0,1] += _2b1[2] unsigned*   b0[0]; h3[2,3] += _2b1[3] unsigned*   b0[1]	
# asm 1: vmlal.u32 <h3=reg128#14,<_2b1=reg128#16%top,<b0=reg128#6%bot
# asm 2: vmlal.u32 <h3=q13,<_2b1=d31,<b0=d10
vmlal.u32 q13,d31,d10

# qhasm: 2x h2 += t
# asm 1: vadd.i64 >h2=reg128#1,<h2=reg128#1,<t=reg128#7
# asm 2: vadd.i64 >h2=q0,<h2=q0,<t=q6
vadd.i64 q0,q0,q6

# qhasm: h3[0,1] += _2b1[0] unsigned*   b0[2]; h3[2,3] += _2b1[1] unsigned*   b0[3]	
# asm 1: vmlal.u32 <h3=reg128#14,<_2b1=reg128#16%bot,<b0=reg128#6%top
# asm 2: vmlal.u32 <h3=q13,<_2b1=d30,<b0=d11
vmlal.u32 q13,d30,d11

# qhasm: 2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#7,<h2=reg128#1,#26
# asm 2: vshr.u64 >t=q6,<h2=q0,#26
vshr.u64 q6,q0,#26

# qhasm: h2 &= mask26
# asm 1: vand >h2=reg128#1,<h2=reg128#1,<mask26=reg128#11
# asm 2: vand >h2=q0,<h2=q0,<mask26=q10
vand q0,q0,q10

# qhasm: h5[0,1] += _2b2[0] unsigned*   b0[0]; h5[2,3] += _2b2[1] unsigned*   b0[1]	
# asm 1: vmlal.u32 <h5=reg128#4,<_2b2=reg128#5%bot,<b0=reg128#6%bot
# asm 2: vmlal.u32 <h5=q3,<_2b2=d8,<b0=d10
vmlal.u32 q3,d8,d10

# qhasm: 2x h3 += t
# asm 1: vadd.i64 >h3=reg128#6,<h3=reg128#14,<t=reg128#7
# asm 2: vadd.i64 >h3=q5,<h3=q13,<t=q6
vadd.i64 q5,q13,q6

# qhasm: h5[0,1] += _2b1[2] unsigned* _2b0[0]; h5[2,3] += _2b1[3] unsigned* _2b0[1]	
# asm 1: vmlal.u32 <h5=reg128#4,<_2b1=reg128#16%top,<_2b0=reg128#8%bot
# asm 2: vmlal.u32 <h5=q3,<_2b1=d31,<_2b0=d14
vmlal.u32 q3,d31,d14

# qhasm: 2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#7,<h3=reg128#6,#25
# asm 2: vshr.u64 >t=q6,<h3=q5,#25
vshr.u64 q6,q5,#25

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#6,<h3=reg128#6,<mask25=reg128#15
# asm 2: vand >h3=q5,<h3=q5,<mask25=q14
vand q5,q5,q14

# qhasm: 	k0[0,1]  =   b3[0] unsigned*   b3[0]; k0[2,3]  =   b3[1] unsigned*   b3[1]	
# asm 1: vmull.u32 >k0=reg128#10,<b3=reg128#12%bot,<b3=reg128#12%bot
# asm 2: vmull.u32 >k0=q9,<b3=d22,<b3=d22
vmull.u32 q9,d22,d22

# qhasm: 2x h5 += t
# asm 1: vadd.i64 >h5=reg128#4,<h5=reg128#4,<t=reg128#7
# asm 2: vadd.i64 >h5=q3,<h5=q3,<t=q6
vadd.i64 q3,q3,q6

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#1,<h3=reg128#6
# asm 2: vtrn.32 <h2=q0,<h3=q5
vtrn.32 q0,q5

# qhasm: 	k0[0,1] += _2b2[2] unsigned* _2b0[2]; k0[2,3] += _2b2[3] unsigned* _2b0[3]	
# asm 1: vmlal.u32 <k0=reg128#10,<_2b2=reg128#5%top,<_2b0=reg128#8%top
# asm 2: vmlal.u32 <k0=q9,<_2b2=d9,<_2b0=d15
vmlal.u32 q9,d9,d15

# qhasm: 2x t = h5 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#6,<h5=reg128#4,#25
# asm 2: vshr.u64 >t=q5,<h5=q3,#25
vshr.u64 q5,q3,#25

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#1%bot,<h2=reg128#1%top
# asm 2: vtrn.32 <h2=d0,<h2=d1
vtrn.32 d0,d1

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#4,<h5=reg128#4,<mask25=reg128#15
# asm 2: vand >h5=q3,<h5=q3,<mask25=q14
vand q3,q3,q14

# qhasm: 	k1[0,1]  = _2b0[2] unsigned*   b3[0]; k1[2,3]  = _2b0[3] unsigned*   b3[1]	
# asm 1: vmull.u32 >k1=reg128#7,<_2b0=reg128#8%top,<b3=reg128#12%bot
# asm 2: vmull.u32 >k1=q6,<_2b0=d15,<b3=d22
vmull.u32 q6,d15,d22

# qhasm: 2x h0 += t
# asm 1: vadd.i64 >h0=reg128#6,<h0=reg128#13,<t=reg128#6
# asm 2: vadd.i64 >h0=q5,<h0=q12,<t=q5
vadd.i64 q5,q12,q5

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#4%bot,<h5=reg128#4%top
# asm 2: vtrn.32 <h5=d6,<h5=d7
vtrn.32 d6,d7

# qhasm: 	k3[0,1]  =   b2[2] unsigned*   b2[2]; k3[2,3]  =   b2[3] unsigned*   b2[3]	
# asm 1: vmull.u32 >k3=reg128#9,<b2=reg128#9%top,<b2=reg128#9%top
# asm 2: vmull.u32 >k3=q8,<b2=d17,<b2=d17
vmull.u32 q8,d17,d17

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#13,<h0=reg128#6,#26
# asm 2: vshr.u64 >t=q12,<h0=q5,#26
vshr.u64 q12,q5,#26

# qhasm: adr1 = input_1 + 16
# asm 1: add >adr1=int32#7,<input_1=int32#2,#16
# asm 2: add >adr1=r6,<input_1=r1,#16
add r6,r1,#16

# qhasm: mem128[adr1] = h2; adr1+=16
# asm 1: vst1.8 {<h2=reg128#1%bot-<h2=reg128#1%top},[<adr1=int32#7]!
# asm 2: vst1.8 {<h2=d0-<h2=d1},[<adr1=r6]!
vst1.8 {d0-d1},[r6]!

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#1,<h0=reg128#6,<mask26=reg128#11
# asm 2: vand >h0=q0,<h0=q5,<mask26=q10
vand q0,q5,q10

# qhasm: 	adr1 = input_1 + 64
# asm 1: add >adr1=int32#7,<input_1=int32#2,#64
# asm 2: add >adr1=r6,<input_1=r1,#64
add r6,r1,#64

# qhasm: 	b4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b4=reg128#6%bot->b4=reg128#6%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b4=d10->b4=d11},[<adr1=r6,: 128]!
vld1.8 {d10-d11},[r6,: 128]!

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#2,<h1=reg128#2,<t=reg128#13
# asm 2: vadd.i64 >h1=q1,<h1=q1,<t=q12
vadd.i64 q1,q1,q12

# qhasm: a2 = h5[0]a2[1]
# asm 1: vmov <a2=reg128#3%bot,<h5=reg128#4%bot
# asm 2: vmov <a2=d4,<h5=d6
vmov d4,d6

# qhasm: 	k1[0,1] += _2b2[2] unsigned*   b4[0]; k1[2,3] += _2b2[3] unsigned*   b4[1]	
# asm 1: vmlal.u32 <k1=reg128#7,<_2b2=reg128#5%top,<b4=reg128#6%bot
# asm 2: vmlal.u32 <k1=q6,<_2b2=d9,<b4=d10
vmlal.u32 q6,d9,d10

# qhasm: 	2x _2b4 = b4 + b4
# asm 1: vadd.i64 >_2b4=reg128#4,<b4=reg128#6,<b4=reg128#6
# asm 2: vadd.i64 >_2b4=q3,<b4=q5,<b4=q5
vadd.i64 q3,q5,q5

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#1,<h1=reg128#2
# asm 2: vtrn.32 <h0=q0,<h1=q1
vtrn.32 q0,q1

# qhasm: 	k2[0,1]  = _2b0[2] unsigned*   b3[2]; k2[2,3]  = _2b0[3] unsigned*   b3[3]	
# asm 1: vmull.u32 >k2=reg128#2,<_2b0=reg128#8%top,<b3=reg128#12%top
# asm 2: vmull.u32 >k2=q1,<_2b0=d15,<b3=d23
vmull.u32 q1,d15,d23

# qhasm: 	k0[0,1] += _2b4[2] unsigned* _2b4[0]; k0[2,3] += _2b4[3] unsigned* _2b4[1]
# asm 1: vmlal.u32 <k0=reg128#10,<_2b4=reg128#4%top,<_2b4=reg128#4%bot
# asm 2: vmlal.u32 <k0=q9,<_2b4=d7,<_2b4=d6
vmlal.u32 q9,d7,d6

# qhasm: 	k1[0,1] += _2b4[2] unsigned*   b4[2]; k1[2,3] += _2b4[3] unsigned*   b4[3]
# asm 1: vmlal.u32 <k1=reg128#7,<_2b4=reg128#4%top,<b4=reg128#6%top
# asm 2: vmlal.u32 <k1=q6,<_2b4=d7,<b4=d11
vmlal.u32 q6,d7,d11

# qhasm: 	k2[0,1] += _2b4[0] unsigned*   b3[0]; k2[2,3] += _2b4[1] unsigned*   b3[1]	
# asm 1: vmlal.u32 <k2=reg128#2,<_2b4=reg128#4%bot,<b3=reg128#12%bot
# asm 2: vmlal.u32 <k2=q1,<_2b4=d6,<b3=d22
vmlal.u32 q1,d6,d22

# qhasm: 	k2[0,1] += _2b2[2] unsigned* _2b4[2]; k2[2,3] += _2b2[3] unsigned* _2b4[3]
# asm 1: vmlal.u32 <k2=reg128#2,<_2b2=reg128#5%top,<_2b4=reg128#4%top
# asm 2: vmlal.u32 <k2=q1,<_2b2=d9,<_2b4=d7
vmlal.u32 q1,d9,d7

# qhasm: 	2x t2 = k0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#13,<k0=reg128#10,#26
# asm 2: vshr.u64 >t2=q12,<k0=q9,#26
vshr.u64 q12,q9,#26

# qhasm: 	k0 &= mask26
# asm 1: vand >k0=reg128#10,<k0=reg128#10,<mask26=reg128#11
# asm 2: vand >k0=q9,<k0=q9,<mask26=q10
vand q9,q9,q10

# qhasm: 	2x k1 += t2
# asm 1: vadd.i64 >k1=reg128#7,<k1=reg128#7,<t2=reg128#13
# asm 2: vadd.i64 >k1=q6,<k1=q6,<t2=q12
vadd.i64 q6,q6,q12

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#1%bot,<h0=reg128#1%top
# asm 2: vtrn.32 <h0=d0,<h0=d1
vtrn.32 d0,d1

# qhasm: 	k3[0,1] += _2b4[2] unsigned*   b3[0]; k3[2,3] += _2b4[3] unsigned*   b3[1]	
# asm 1: vmlal.u32 <k3=reg128#9,<_2b4=reg128#4%top,<b3=reg128#12%bot
# asm 2: vmlal.u32 <k3=q8,<_2b4=d7,<b3=d22
vmlal.u32 q8,d7,d22

# qhasm: 	2x t2 = k1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#13,<k1=reg128#7,#25
# asm 2: vshr.u64 >t2=q12,<k1=q6,#25
vshr.u64 q12,q6,#25

# qhasm: 	k1 &= mask25
# asm 1: vand >k1=reg128#7,<k1=reg128#7,<mask25=reg128#15
# asm 2: vand >k1=q6,<k1=q6,<mask25=q14
vand q6,q6,q14

# qhasm: 	2x k2 += t2
# asm 1: vadd.i64 >k2=reg128#2,<k2=reg128#2,<t2=reg128#13
# asm 2: vadd.i64 >k2=q1,<k2=q1,<t2=q12
vadd.i64 q1,q1,q12

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#7,<input_1=int32#2
# asm 2: mov >adr1=r6,<input_1=r1
mov r6,r1

# qhasm: mem128[adr1] = h0; adr1+=16
# asm 1: vst1.8 {<h0=reg128#1%bot-<h0=reg128#1%top},[<adr1=int32#7]!
# asm 2: vst1.8 {<h0=d0-<h0=d1},[<adr1=r6]!
vst1.8 {d0-d1},[r6]!

# qhasm: k3[0,1] += _2b4[0] unsigned*   b3[2]; k3[2,3] += _2b4[1] unsigned*   b3[3]	
# asm 1: vmlal.u32 <k3=reg128#9,<_2b4=reg128#4%bot,<b3=reg128#12%top
# asm 2: vmlal.u32 <k3=q8,<_2b4=d6,<b3=d23
vmlal.u32 q8,d6,d23

# qhasm: 2x t2 = k2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#1,<k2=reg128#2,#26
# asm 2: vshr.u64 >t2=q0,<k2=q1,#26
vshr.u64 q0,q1,#26

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#2,<k2=reg128#2,<mask26=reg128#11
# asm 2: vand >k2=q1,<k2=q1,<mask26=q10
vand q1,q1,q10

# qhasm: 	adr3 = input_3 + 16		
# asm 1: add >adr3=int32#7,<input_3=int32#4,#16
# asm 2: add >adr3=r6,<input_3=r3,#16
add r6,r3,#16

# qhasm: 	c0 aligned = mem128[adr3]	
# asm 1: vld1.8 {>c0=reg128#13%bot->c0=reg128#13%top},[<adr3=int32#7,: 128]
# asm 2: vld1.8 {>c0=d24->c0=d25},[<adr3=r6,: 128]
vld1.8 {d24-d25},[r6,: 128]

# qhasm: k4[0,1]  =   b4[0] unsigned*   b4[0]; k4[2,3]  =   b4[1] unsigned*   b4[1]	
# asm 1: vmull.u32 >k4=reg128#6,<b4=reg128#6%bot,<b4=reg128#6%bot
# asm 2: vmull.u32 >k4=q5,<b4=d10,<b4=d10
vmull.u32 q5,d10,d10

# qhasm: 2x k3 += t2
# asm 1: vadd.i64 >k3=reg128#1,<k3=reg128#9,<t2=reg128#1
# asm 2: vadd.i64 >k3=q0,<k3=q8,<t2=q0
vadd.i64 q0,q8,q0

# qhasm: k4[0,1] += _2b2[2] unsigned*   b3[0]; k4[2,3] += _2b2[3] unsigned*   b3[1]	
# asm 1: vmlal.u32 <k4=reg128#6,<_2b2=reg128#5%top,<b3=reg128#12%bot
# asm 2: vmlal.u32 <k4=q5,<_2b2=d9,<b3=d22
vmlal.u32 q5,d9,d22

# qhasm: k4[0,1] += _2b4[2] unsigned* _2b0[2]; k4[2,3] += _2b4[3] unsigned* _2b0[3]
# asm 1: vmlal.u32 <k4=reg128#6,<_2b4=reg128#4%top,<_2b0=reg128#8%top
# asm 2: vmlal.u32 <k4=q5,<_2b4=d7,<_2b0=d15
vmlal.u32 q5,d7,d15

# qhasm: 2x t2 = k3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#4,<k3=reg128#1,#25
# asm 2: vshr.u64 >t2=q3,<k3=q0,#25
vshr.u64 q3,q0,#25

# qhasm: 	adr1 = input_1
# asm 1: mov >adr1=int32#7,<input_1=int32#2
# asm 2: mov >adr1=r6,<input_1=r1
mov r6,r1

# qhasm: 	b0 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b0=reg128#5%bot->b0=reg128#5%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b0=d8->b0=d9},[<adr1=r6,: 128]!
vld1.8 {d8-d9},[r6,: 128]!

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#1,<k3=reg128#1,<mask25=reg128#15
# asm 2: vand >k3=q0,<k3=q0,<mask25=q14
vand q0,q0,q14

# qhasm: 	b1 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b1=reg128#8%bot->b1=reg128#8%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b1=d14->b1=d15},[<adr1=r6,: 128]!
vld1.8 {d14-d15},[r6,: 128]!

# qhasm: 	h0[0,1]  =   b0[0] unsigned* c0[0]; h0[2,3]  =   b0[1] unsigned* c0[1]	
# asm 1: vmull.u32 >h0=reg128#9,<b0=reg128#5%bot,<c0=reg128#13%bot
# asm 2: vmull.u32 >h0=q8,<b0=d8,<c0=d24
vmull.u32 q8,d8,d24

# qhasm: 2x k4 += t2
# asm 1: vadd.i64 >k4=reg128#4,<k4=reg128#6,<t2=reg128#4
# asm 2: vadd.i64 >k4=q3,<k4=q5,<t2=q3
vadd.i64 q3,q5,q3

# qhasm: 	h1[0,1]  =   b0[2] unsigned* c0[0]; h1[2,3]  =   b0[3] unsigned* c0[1]	
# asm 1: vmull.u32 >h1=reg128#5,<b0=reg128#5%top,<c0=reg128#13%bot
# asm 2: vmull.u32 >h1=q4,<b0=d9,<c0=d24
vmull.u32 q4,d9,d24

# qhasm: 	h2[0,1]  =   b1[0] unsigned* c0[0]; h2[2,3]  =   b1[1] unsigned* c0[1]
# asm 1: vmull.u32 >h2=reg128#6,<b1=reg128#8%bot,<c0=reg128#13%bot
# asm 2: vmull.u32 >h2=q5,<b1=d14,<c0=d24
vmull.u32 q5,d14,d24

# qhasm: 2x t2 = k4 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#12,<k4=reg128#4,#25
# asm 2: vshr.u64 >t2=q11,<k4=q3,#25
vshr.u64 q11,q3,#25

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#2,<k3=reg128#1
# asm 2: vtrn.32 <k2=q1,<k3=q0
vtrn.32 q1,q0

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#1,<k4=reg128#4,<mask25=reg128#15
# asm 2: vand >k4=q0,<k4=q3,<mask25=q14
vand q0,q3,q14

# qhasm: 2x k0 += t2
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#10,<t2=reg128#12
# asm 2: vadd.i64 >k0=q3,<k0=q9,<t2=q11
vadd.i64 q3,q9,q11

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#2%bot,<k2=reg128#2%top
# asm 2: vtrn.32 <k2=d2,<k2=d3
vtrn.32 d2,d3

# qhasm: 	h3[0,1]  =   b1[2] unsigned* c0[0]; h3[2,3]  =   b1[3] unsigned* c0[1]	
# asm 1: vmull.u32 >h3=reg128#8,<b1=reg128#8%top,<c0=reg128#13%bot
# asm 2: vmull.u32 >h3=q7,<b1=d15,<c0=d24
vmull.u32 q7,d15,d24

# qhasm: 	2x t = h1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<h1=reg128#5,#25
# asm 2: vshr.u64 >t=q9,<h1=q4,#25
vshr.u64 q9,q4,#25

# qhasm: 	h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#15
# asm 2: vand >h1=q4,<h1=q4,<mask25=q14
vand q4,q4,q14

# qhasm: 	2x h2 += t
# asm 1: vadd.i64 >h2=reg128#6,<h2=reg128#6,<t=reg128#10
# asm 2: vadd.i64 >h2=q5,<h2=q5,<t=q9
vadd.i64 q5,q5,q9

# qhasm: 2x t2 = k0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#10,<k0=reg128#4,#26
# asm 2: vshr.u64 >t2=q9,<k0=q3,#26
vshr.u64 q9,q3,#26

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#1%bot,<k4=reg128#1%top
# asm 2: vtrn.32 <k4=d0,<k4=d1
vtrn.32 d0,d1

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#4,<mask26=reg128#11
# asm 2: vand >k0=q3,<k0=q3,<mask26=q10
vand q3,q3,q10

# qhasm: 2x k1 += t2
# asm 1: vadd.i64 >k1=reg128#7,<k1=reg128#7,<t2=reg128#10
# asm 2: vadd.i64 >k1=q6,<k1=q6,<t2=q9
vadd.i64 q6,q6,q9

# qhasm: a2 = a2[0]k4[0]
# asm 1: vmov <a2=reg128#3%top,<k4=reg128#1%bot
# asm 2: vmov <a2=d5,<k4=d0
vmov d5,d0

# qhasm: 	2x t = h2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#1,<h2=reg128#6,#26
# asm 2: vshr.u64 >t=q0,<h2=q5,#26
vshr.u64 q0,q5,#26

# qhasm: 	h2 &= mask26
# asm 1: vand >h2=reg128#6,<h2=reg128#6,<mask26=reg128#11
# asm 2: vand >h2=q5,<h2=q5,<mask26=q10
vand q5,q5,q10

# qhasm: 	2x h3 += t
# asm 1: vadd.i64 >h3=reg128#1,<h3=reg128#8,<t=reg128#1
# asm 2: vadd.i64 >h3=q0,<h3=q7,<t=q0
vadd.i64 q0,q7,q0

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#4,<k1=reg128#7
# asm 2: vtrn.32 <k0=q3,<k1=q6
vtrn.32 q3,q6

# qhasm: 	h4[0,1]  =   a2[0] unsigned* c0[0]; h4[2,3]  =   a2[1] unsigned* c0[1]	
# asm 1: vmull.u32 >h4=reg128#7,<a2=reg128#3%bot,<c0=reg128#13%bot
# asm 2: vmull.u32 >h4=q6,<a2=d4,<c0=d24
vmull.u32 q6,d4,d24

# qhasm: 	2x t = h3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h3=reg128#1,#25
# asm 2: vshr.u64 >t=q7,<h3=q0,#25
vshr.u64 q7,q0,#25

# qhasm: 	h3 &= mask25
# asm 1: vand >h3=reg128#1,<h3=reg128#1,<mask25=reg128#15
# asm 2: vand >h3=q0,<h3=q0,<mask25=q14
vand q0,q0,q14

# qhasm: 		p2[0,1]  =   k2[0] unsigned* c0[2]; p2[2,3]  =   k2[1] unsigned* c0[3]	
# asm 1: vmull.u32 >p2=reg128#10,<k2=reg128#2%bot,<c0=reg128#13%top
# asm 2: vmull.u32 >p2=q9,<k2=d2,<c0=d25
vmull.u32 q9,d2,d25

# qhasm: 	2x h4 += t
# asm 1: vadd.i64 >h4=reg128#7,<h4=reg128#7,<t=reg128#8
# asm 2: vadd.i64 >h4=q6,<h4=q6,<t=q7
vadd.i64 q6,q6,q7

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#4%bot,<k0=reg128#4%top
# asm 2: vtrn.32 <k0=d6,<k0=d7
vtrn.32 d6,d7

# qhasm: 		p3[0,1]  =   k2[2] unsigned* c0[2]; p3[2,3]  =   k2[3] unsigned* c0[3]	
# asm 1: vmull.u32 >p3=reg128#2,<k2=reg128#2%top,<c0=reg128#13%top
# asm 2: vmull.u32 >p3=q1,<k2=d3,<c0=d25
vmull.u32 q1,d3,d25

# qhasm: 	2x t = h4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#8,<h4=reg128#7,#25
# asm 2: vshr.u64 >t=q7,<h4=q6,#25
vshr.u64 q7,q6,#25

# qhasm: 	h4 &= mask25
# asm 1: vand >h4=reg128#7,<h4=reg128#7,<mask25=reg128#15
# asm 2: vand >h4=q6,<h4=q6,<mask25=q14
vand q6,q6,q14

# qhasm: 	2x h0 += t
# asm 1: vadd.i64 >h0=reg128#8,<h0=reg128#9,<t=reg128#8
# asm 2: vadd.i64 >h0=q7,<h0=q8,<t=q7
vadd.i64 q7,q8,q7

# qhasm: 		2x t2 = p2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#9,<p2=reg128#10,#26
# asm 2: vshr.u64 >t2=q8,<p2=q9,#26
vshr.u64 q8,q9,#26

# qhasm: 		p2 &= mask26
# asm 1: vand >p2=reg128#10,<p2=reg128#10,<mask26=reg128#11
# asm 2: vand >p2=q9,<p2=q9,<mask26=q10
vand q9,q9,q10

# qhasm: 		2x p3 += t2
# asm 1: vadd.i64 >p3=reg128#2,<p3=reg128#2,<t2=reg128#9
# asm 2: vadd.i64 >p3=q1,<p3=q1,<t2=q8
vadd.i64 q1,q1,q8

# qhasm: adr1 = input_1 + 48
# asm 1: add >adr1=int32#7,<input_1=int32#2,#48
# asm 2: add >adr1=r6,<input_1=r1,#48
add r6,r1,#48

# qhasm: mem128[adr1] = k0; adr1+=16
# asm 1: vst1.8 {<k0=reg128#4%bot-<k0=reg128#4%top},[<adr1=int32#7]!
# asm 2: vst1.8 {<k0=d6-<k0=d7},[<adr1=r6]!
vst1.8 {d6-d7},[r6]!

# qhasm: 			p5[0,1]  =   a2[2] unsigned* c0[2]; p5[2,3]  =   a2[3] unsigned* c0[3]	
# asm 1: vmull.u32 >p5=reg128#3,<a2=reg128#3%top,<c0=reg128#13%top
# asm 2: vmull.u32 >p5=q2,<a2=d5,<c0=d25
vmull.u32 q2,d5,d25

# qhasm: 			2x t2 = p3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#9,<p3=reg128#2,#25
# asm 2: vshr.u64 >t2=q8,<p3=q1,#25
vshr.u64 q8,q1,#25

# qhasm: 			p3 &= mask25
# asm 1: vand >p3=reg128#2,<p3=reg128#2,<mask25=reg128#15
# asm 2: vand >p3=q1,<p3=q1,<mask25=q14
vand q1,q1,q14

# qhasm: 2x t = h0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<h0=reg128#8,#26
# asm 2: vshr.u64 >t=q11,<h0=q7,#26
vshr.u64 q11,q7,#26

# qhasm: h0 &= mask26
# asm 1: vand >h0=reg128#8,<h0=reg128#8,<mask26=reg128#11
# asm 2: vand >h0=q7,<h0=q7,<mask26=q10
vand q7,q7,q10

# qhasm: 2x h1 += t
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t=reg128#12
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t=q11
vadd.i64 q4,q4,q11

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#6,<h3=reg128#1
# asm 2: vtrn.32 <h2=q5,<h3=q0
vtrn.32 q5,q0

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 80
# asm 1: add >adr5=int32#7,<adr5=int32#7,#80
# asm 2: add >adr5=r6,<adr5=r6,#80
add r6,r6,#80

# qhasm: 			2x p5 += t2
# asm 1: vadd.i64 >p5=reg128#1,<p5=reg128#3,<t2=reg128#9
# asm 2: vadd.i64 >p5=q0,<p5=q2,<t2=q8
vadd.i64 q0,q2,q8

# qhasm: _28_27_28_27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_28_27_28_27=reg128#3%bot->_28_27_28_27=reg128#3%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_28_27_28_27=d4->_28_27_28_27=d5},[<adr5=r6,: 128]
vld1.8 {d4-d5},[r6,: 128]

# qhasm: 			p0[0,1]  =   k0[0] unsigned* c0[2]; p0[2,3]  =   k0[1] unsigned* c0[3]	
# asm 1: vmull.u32 >p0=reg128#9,<k0=reg128#4%bot,<c0=reg128#13%top
# asm 2: vmull.u32 >p0=q8,<k0=d6,<c0=d25
vmull.u32 q8,d6,d25

# qhasm: 			2x t2 = p5 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#12,<p5=reg128#1,#25
# asm 2: vshr.u64 >t2=q11,<p5=q0,#25
vshr.u64 q11,q0,#25

# qhasm: 			p5 &= mask25
# asm 1: vand >p5=reg128#1,<p5=reg128#1,<mask25=reg128#15
# asm 2: vand >p5=q0,<p5=q0,<mask25=q14
vand q0,q0,q14

# qhasm: 4x n1 = _28_27_28_27 - h2
# asm 1: vsub.i32 >n1=reg128#14,<_28_27_28_27=reg128#3,<h2=reg128#6
# asm 2: vsub.i32 >n1=q13,<_28_27_28_27=q2,<h2=q5
vsub.i32 q13,q2,q5

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#8,<h1=reg128#5
# asm 2: vtrn.32 <h0=q7,<h1=q4
vtrn.32 q7,q4

# qhasm: 			2x p0 += t2
# asm 1: vadd.i64 >p0=reg128#5,<p0=reg128#9,<t2=reg128#12
# asm 2: vadd.i64 >p0=q4,<p0=q8,<t2=q11
vadd.i64 q4,q8,q11

# qhasm: 4x n0 = _28_27_28_27 - h0
# asm 1: vsub.i32 >n0=reg128#3,<_28_27_28_27=reg128#3,<h0=reg128#8
# asm 2: vsub.i32 >n0=q2,<_28_27_28_27=q2,<h0=q7
vsub.i32 q2,q2,q7

# qhasm: h2 = h2[0]n1[1]
# asm 1: vmov <h2=reg128#6%top,<n1=reg128#14%top
# asm 2: vmov <h2=d11,<n1=d27
vmov d11,d27

# qhasm: 			p1[0,1]  =   k0[2] unsigned* c0[2]; p1[2,3]  =   k0[3] unsigned* c0[3]	
# asm 1: vmull.u32 >p1=reg128#4,<k0=reg128#4%top,<c0=reg128#13%top
# asm 2: vmull.u32 >p1=q3,<k0=d7,<c0=d25
vmull.u32 q3,d7,d25

# qhasm: 			2x t2 = p0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#9,<p0=reg128#5,#26
# asm 2: vshr.u64 >t2=q8,<p0=q4,#26
vshr.u64 q8,q4,#26

# qhasm: 			h4 p5 = h4[0]p5[0]h4[2]p5[2] h4[1]p5[1]h4[3]p5[3]
# asm 1: vtrn.32 <h4=reg128#7,<p5=reg128#1
# asm 2: vtrn.32 <h4=q6,<p5=q0
vtrn.32 q6,q0

# qhasm: 			p0 &= mask26
# asm 1: vand >p0=reg128#1,<p0=reg128#5,<mask26=reg128#11
# asm 2: vand >p0=q0,<p0=q4,<mask26=q10
vand q0,q4,q10

# qhasm: 			adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: 			adr5 += 64
# asm 1: add >adr5=int32#7,<adr5=int32#7,#64
# asm 2: add >adr5=r6,<adr5=r6,#64
add r6,r6,#64

# qhasm: 			_27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_27=reg128#5%bot->_27=reg128#5%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_27=d8->_27=d9},[<adr5=r6,: 128]
vld1.8 {d8-d9},[r6,: 128]

# qhasm: h0 = h0[0]n0[1]
# asm 1: vmov <h0=reg128#8%top,<n0=reg128#3%top
# asm 2: vmov <h0=d15,<n0=d5
vmov d15,d5

# qhasm: 			2x p1 += t2
# asm 1: vadd.i64 >p1=reg128#3,<p1=reg128#4,<t2=reg128#9
# asm 2: vadd.i64 >p1=q2,<p1=q3,<t2=q8
vadd.i64 q2,q3,q8

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#6%bot,<h2=reg128#6%top
# asm 2: vtrn.32 <h2=d10,<h2=d11
vtrn.32 d10,d11

# qhasm: 			4x n2 = _27 - h4
# asm 1: vsub.i32 >n2=reg128#4,<_27=reg128#5,<h4=reg128#7
# asm 2: vsub.i32 >n2=q3,<_27=q4,<h4=q6
vsub.i32 q3,q4,q6

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#8%bot,<h0=reg128#8%top
# asm 2: vtrn.32 <h0=d14,<h0=d15
vtrn.32 d14,d15

# qhasm: 2x t2 = p1 unsigned>> 25	
# asm 1: vshr.u64 >t2=reg128#5,<p1=reg128#3,#25
# asm 2: vshr.u64 >t2=q4,<p1=q2,#25
vshr.u64 q4,q2,#25

# qhasm: p1 &= mask25
# asm 1: vand >p1=reg128#3,<p1=reg128#3,<mask25=reg128#15
# asm 2: vand >p1=q2,<p1=q2,<mask25=q14
vand q2,q2,q14

# qhasm: 2x p2 += t2
# asm 1: vadd.i64 >p2=reg128#5,<p2=reg128#10,<t2=reg128#5
# asm 2: vadd.i64 >p2=q4,<p2=q9,<t2=q4
vadd.i64 q4,q9,q4

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 80
# asm 1: add >adr5=int32#7,<adr5=int32#7,#80
# asm 2: add >adr5=r6,<adr5=r6,#80
add r6,r6,#80

# qhasm: _28_27_28_27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_28_27_28_27=reg128#9%bot->_28_27_28_27=reg128#9%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_28_27_28_27=d16->_28_27_28_27=d17},[<adr5=r6,: 128]
vld1.8 {d16-d17},[r6,: 128]

# qhasm: p5 = n2[1,2,3]h4[0]
# asm 1: vext.32 >p5=reg128#4,<n2=reg128#4,<h4=reg128#7,#1
# asm 2: vext.32 >p5=q3,<n2=q3,<h4=q6,#1
vext.32 q3,q3,q6,#1

# qhasm: p0 p1 = p0[0]p1[0]p0[2]p1[2] p0[1]p1[1]p0[3]p1[3]
# asm 1: vtrn.32 <p0=reg128#1,<p1=reg128#3
# asm 2: vtrn.32 <p0=q0,<p1=q2
vtrn.32 q0,q2

# qhasm: p2 p3 = p2[0]p3[0]p2[2]p3[2] p2[1]p3[1]p2[3]p3[3]
# asm 1: vtrn.32 <p2=reg128#5,<p3=reg128#2
# asm 2: vtrn.32 <p2=q4,<p3=q1
vtrn.32 q4,q1

# qhasm: 4x n0 = _28_27_28_27 - p0	
# asm 1: vsub.i32 >n0=reg128#1,<_28_27_28_27=reg128#9,<p0=reg128#1
# asm 2: vsub.i32 >n0=q0,<_28_27_28_27=q8,<p0=q0
vsub.i32 q0,q8,q0

# qhasm: 4x n1 = _28_27_28_27 - p2
# asm 1: vsub.i32 >n1=reg128#2,<_28_27_28_27=reg128#9,<p2=reg128#5
# asm 2: vsub.i32 >n1=q1,<_28_27_28_27=q8,<p2=q4
vsub.i32 q1,q8,q4

# qhasm: p4 = p5[3]p5[0,1,2]
# asm 1: vext.32 >p4=reg128#3,<p5=reg128#4,<p5=reg128#4,#3
# asm 2: vext.32 >p4=q2,<p5=q3,<p5=q3,#3
vext.32 q2,q3,q3,#3

# qhasm: n0 = n0[0,2,1,3]
# asm 1: vtrn.32 <n0=reg128#1%bot,<n0=reg128#1%top
# asm 2: vtrn.32 <n0=d0,<n0=d1
vtrn.32 d0,d1

# qhasm: n1 = n1[0,2,1,3]
# asm 1: vtrn.32 <n1=reg128#2%bot,<n1=reg128#2%top
# asm 2: vtrn.32 <n1=d2,<n1=d3
vtrn.32 d2,d3

# qhasm: p4 = p4[0,2,1,3]
# asm 1: vtrn.32 <p4=reg128#3%bot,<p4=reg128#3%top
# asm 2: vtrn.32 <p4=d4,<p4=d5
vtrn.32 d4,d5

# qhasm: 4x sum1 = h2 + n1
# asm 1: vadd.i32 >sum1=reg128#4,<h2=reg128#6,<n1=reg128#2
# asm 2: vadd.i32 >sum1=q3,<h2=q5,<n1=q1
vadd.i32 q3,q5,q1

# qhasm: 4x dif1 = h2 - n1
# asm 1: vsub.i32 >dif1=reg128#2,<h2=reg128#6,<n1=reg128#2
# asm 2: vsub.i32 >dif1=q1,<h2=q5,<n1=q1
vsub.i32 q1,q5,q1

# qhasm: sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2] sum1[1]dif1[1]sum1[3]dif1[3]
# asm 1: vtrn.32 <sum1=reg128#4,<dif1=reg128#2
# asm 2: vtrn.32 <sum1=q3,<dif1=q1
vtrn.32 q3,q1

# qhasm: 4x sum0 = h0 + n0
# asm 1: vadd.i32 >sum0=reg128#5,<h0=reg128#8,<n0=reg128#1
# asm 2: vadd.i32 >sum0=q4,<h0=q7,<n0=q0
vadd.i32 q4,q7,q0

# qhasm: sum1 p4 = sum1[0]p4[0] sum1[1]p4[1]
# asm 1: vswp <p4=reg128#3%bot,<sum1=reg128#4%top
# asm 2: vswp <p4=d4,<sum1=d7
vswp d4,d7

# qhasm: 4x dif0 = h0 - n0
# asm 1: vsub.i32 >dif0=reg128#1,<h0=reg128#8,<n0=reg128#1
# asm 2: vsub.i32 >dif0=q0,<h0=q7,<n0=q0
vsub.i32 q0,q7,q0

# qhasm: p4 dif1 = p4[0]dif1[1] dif1[0]p4[1]
# asm 1: vswp <dif1=reg128#2%top,<p4=reg128#3%top
# asm 2: vswp <dif1=d3,<p4=d5
vswp d3,d5

# qhasm: 4x a1 = sum1 + dif1
# asm 1: vadd.i32 >a1=reg128#6,<sum1=reg128#4,<dif1=reg128#2
# asm 2: vadd.i32 >a1=q5,<sum1=q3,<dif1=q1
vadd.i32 q5,q3,q1

# qhasm: 4x a4 = sum1 - dif1
# asm 1: vsub.i32 >a4=reg128#2,<sum1=reg128#4,<dif1=reg128#2
# asm 2: vsub.i32 >a4=q1,<sum1=q3,<dif1=q1
vsub.i32 q1,q3,q1

# qhasm: sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2] sum0[1]dif0[1]sum0[3]dif0[3]
# asm 1: vtrn.32 <sum0=reg128#5,<dif0=reg128#1
# asm 2: vtrn.32 <sum0=q4,<dif0=q0
vtrn.32 q4,q0

# qhasm: 4x a0 = sum0 + dif0
# asm 1: vadd.i32 >a0=reg128#4,<sum0=reg128#5,<dif0=reg128#1
# asm 2: vadd.i32 >a0=q3,<sum0=q4,<dif0=q0
vadd.i32 q3,q4,q0

# qhasm: a1 p4 = p4[0]a1[1] a1[0]p4[1]
# asm 1: vswp <p4=reg128#3%bot,<a1=reg128#6%bot
# asm 2: vswp <p4=d4,<a1=d10
vswp d4,d10

# qhasm: 4x a3 = sum0 - dif0
# asm 1: vsub.i32 >a3=reg128#1,<sum0=reg128#5,<dif0=reg128#1
# asm 2: vsub.i32 >a3=q0,<sum0=q4,<dif0=q0
vsub.i32 q0,q4,q0

# qhasm: p4 a4 = p4[0]a4[0] p4[1]a4[1]
# asm 1: vswp <a4=reg128#2%bot,<p4=reg128#3%top
# asm 2: vswp <a4=d2,<p4=d5
vswp d2,d5

# qhasm: a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]
# asm 1: vtrn.32 <a1=reg128#6%top,<a4=reg128#2%top
# asm 2: vtrn.32 <a1=d11,<a4=d3
vtrn.32 d11,d3

# qhasm: 4x sum1 = a1 + a4
# asm 1: vadd.i32 >sum1=reg128#5,<a1=reg128#6,<a4=reg128#2
# asm 2: vadd.i32 >sum1=q4,<a1=q5,<a4=q1
vadd.i32 q4,q5,q1

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 32
# asm 1: add >adr5=int32#7,<adr5=int32#7,#32
# asm 2: add >adr5=r6,<adr5=r6,#32
add r6,r6,#32

# qhasm: _28 aligned = mem128[adr5]; adr5+=16
# asm 1: vld1.8 {>_28=reg128#7%bot->_28=reg128#7%top},[<adr5=int32#7,: 128]!
# asm 2: vld1.8 {>_28=d12->_28=d13},[<adr5=r6,: 128]!
vld1.8 {d12-d13},[r6,: 128]!

# qhasm: 4x dif1 = a1 - a4
# asm 1: vsub.i32 >dif1=reg128#2,<a1=reg128#6,<a4=reg128#2
# asm 2: vsub.i32 >dif1=q1,<a1=q5,<a4=q1
vsub.i32 q1,q5,q1

# qhasm: _29_28 aligned = mem128[adr5]
# asm 1: vld1.8 {>_29_28=reg128#6%bot->_29_28=reg128#6%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_29_28=d10->_29_28=d11},[<adr5=r6,: 128]
vld1.8 {d10-d11},[r6,: 128]

# qhasm: 4x a0 = a0 + _29_28
# asm 1: vadd.i32 >a0=reg128#4,<a0=reg128#4,<_29_28=reg128#6
# asm 2: vadd.i32 >a0=q3,<a0=q3,<_29_28=q5
vadd.i32 q3,q3,q5

# qhasm: p4 sum1 = p4[0]sum1[0] p4[1]sum1[1]
# asm 1: vswp <sum1=reg128#5%bot,<p4=reg128#3%top
# asm 2: vswp <sum1=d8,<p4=d5
vswp d8,d5

# qhasm: 4x a3 = a3 + _29_28
# asm 1: vadd.i32 >a3=reg128#1,<a3=reg128#1,<_29_28=reg128#6
# asm 2: vadd.i32 >a3=q0,<a3=q0,<_29_28=q5
vadd.i32 q0,q0,q5

# qhasm: sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]
# asm 1: vswp <dif1=reg128#2%bot,<sum1=reg128#5%top
# asm 2: vswp <dif1=d2,<sum1=d9
vswp d2,d9

# qhasm: 4x a1 = p4 + _29_28
# asm 1: vadd.i32 >a1=reg128#3,<p4=reg128#3,<_29_28=reg128#6
# asm 2: vadd.i32 >a1=q2,<p4=q2,<_29_28=q5
vadd.i32 q2,q2,q5

# qhasm: 4x a4 = sum1 + _29_28
# asm 1: vadd.i32 >a4=reg128#5,<sum1=reg128#5,<_29_28=reg128#6
# asm 2: vadd.i32 >a4=q4,<sum1=q4,<_29_28=q5
vadd.i32 q4,q4,q5

# qhasm: 4x a2 = dif1 + _28
# asm 1: vadd.i32 >a2=reg128#2,<dif1=reg128#2,<_28=reg128#7
# asm 2: vadd.i32 >a2=q1,<dif1=q1,<_28=q6
vadd.i32 q1,q1,q6

# qhasm: a0 a3 = a0[0]a3[0] a0[1]a3[1]
# asm 1: vswp <a3=reg128#1%bot,<a0=reg128#4%top
# asm 2: vswp <a3=d0,<a0=d7
vswp d0,d7

# qhasm: 2x _2a1 = a1 + a1
# asm 1: vadd.i64 >_2a1=reg128#6,<a1=reg128#3,<a1=reg128#3
# asm 2: vadd.i64 >_2a1=q5,<a1=q2,<a1=q2
vadd.i64 q5,q2,q2

# qhasm: 2x _2a2 = a2 + a2
# asm 1: vadd.i64 >_2a2=reg128#7,<a2=reg128#2,<a2=reg128#2
# asm 2: vadd.i64 >_2a2=q6,<a2=q1,<a2=q1
vadd.i64 q6,q1,q1

# qhasm: 2x _2a0 = a3 + a3
# asm 1: vadd.i64 >_2a0=reg128#8,<a3=reg128#1,<a3=reg128#1
# asm 2: vadd.i64 >_2a0=q7,<a3=q0,<a3=q0
vadd.i64 q7,q0,q0

# qhasm: adr1 = input_1 + 64			
# asm 1: add >adr1=int32#7,<input_1=int32#2,#64
# asm 2: add >adr1=r6,<input_1=r1,#64
add r6,r1,#64

# qhasm: mem128[adr1] aligned = a4; adr1 +=16	
# asm 1: vst1.8 {<a4=reg128#5%bot-<a4=reg128#5%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<a4=d8-<a4=d9},[<adr1=r6,: 128]!
vst1.8 {d8-d9},[r6,: 128]!

# qhasm: k0[0,1]  =   a0[0] unsigned*   a0[0]; k0[2,3]  =   a0[1] unsigned*   a0[1]	
# asm 1: vmull.u32 >k0=reg128#5,<a0=reg128#4%bot,<a0=reg128#4%bot
# asm 2: vmull.u32 >k0=q4,<a0=d6,<a0=d6
vmull.u32 q4,d6,d6

# qhasm: k0[0,1] += _2a2[0] unsigned* _2a0[0]; k0[2,3] += _2a2[1] unsigned* _2a0[1]
# asm 1: vmlal.u32 <k0=reg128#5,<_2a2=reg128#7%bot,<_2a0=reg128#8%bot
# asm 2: vmlal.u32 <k0=q4,<_2a2=d12,<_2a0=d14
vmlal.u32 q4,d12,d14

# qhasm: k0[0,1] += _2a1[2] unsigned* _2a1[0]; k0[2,3] += _2a1[3] unsigned* _2a1[1]
# asm 1: vmlal.u32 <k0=reg128#5,<_2a1=reg128#6%top,<_2a1=reg128#6%bot
# asm 2: vmlal.u32 <k0=q4,<_2a1=d11,<_2a1=d10
vmlal.u32 q4,d11,d10

# qhasm: a0 a3 = a0[0]a3[0] a0[1]a3[1]
# asm 1: vswp <a3=reg128#1%bot,<a0=reg128#4%top
# asm 2: vswp <a3=d0,<a0=d7
vswp d0,d7

# qhasm: k1[0,1]  = _2a1[2] unsigned*   a1[2]; k1[2,3]  = _2a1[3] unsigned*   a1[3]
# asm 1: vmull.u32 >k1=reg128#9,<_2a1=reg128#6%top,<a1=reg128#3%top
# asm 2: vmull.u32 >k1=q8,<_2a1=d11,<a1=d5
vmull.u32 q8,d11,d5

# qhasm: k1[0,1] += _2a0[0] unsigned*   a0[0]; k1[2,3] += _2a0[1] unsigned*   a0[1]
# asm 1: vmlal.u32 <k1=reg128#9,<_2a0=reg128#8%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <k1=q8,<_2a0=d14,<a0=d6
vmlal.u32 q8,d14,d6

# qhasm: k1[0,1] += _2a2[0] unsigned*   a1[0]; k1[2,3] += _2a2[1] unsigned*   a1[1]
# asm 1: vmlal.u32 <k1=reg128#9,<_2a2=reg128#7%bot,<a1=reg128#3%bot
# asm 2: vmlal.u32 <k1=q8,<_2a2=d12,<a1=d4
vmlal.u32 q8,d12,d4

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#10,<k0=reg128#5,#26
# asm 2: vshr.u64 >t=q9,<k0=q4,#26
vshr.u64 q9,q4,#26

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#5,<k0=reg128#5,<mask26=reg128#11
# asm 2: vand >k0=q4,<k0=q4,<mask26=q10
vand q4,q4,q10

# qhasm: k2[0,1]  = _2a0[0] unsigned*   a0[2]; k2[2,3]  = _2a0[1] unsigned*   a0[3]	
# asm 1: vmull.u32 >k2=reg128#12,<_2a0=reg128#8%bot,<a0=reg128#4%top
# asm 2: vmull.u32 >k2=q11,<_2a0=d14,<a0=d7
vmull.u32 q11,d14,d7

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#9,<k1=reg128#9,<t=reg128#10
# asm 2: vadd.i64 >k1=q8,<k1=q8,<t=q9
vadd.i64 q8,q8,q9

# qhasm: k2[0,1] += _2a1[0] unsigned*   a0[0]; k2[2,3] += _2a1[1] unsigned*   a0[1]	
# asm 1: vmlal.u32 <k2=reg128#12,<_2a1=reg128#6%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <k2=q11,<_2a1=d10,<a0=d6
vmlal.u32 q11,d10,d6

# qhasm: k2[0,1] += _2a2[0] unsigned* _2a1[2]; k2[2,3] += _2a2[1] unsigned* _2a1[3]
# asm 1: vmlal.u32 <k2=reg128#12,<_2a2=reg128#7%bot,<_2a1=reg128#6%top
# asm 2: vmlal.u32 <k2=q11,<_2a2=d12,<_2a1=d11
vmlal.u32 q11,d12,d11

# qhasm: 2x t = k1 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#10,<k1=reg128#9,#25
# asm 2: vshr.u64 >t=q9,<k1=q8,#25
vshr.u64 q9,q8,#25

# qhasm: k1 &= mask25
# asm 1: vand >k1=reg128#9,<k1=reg128#9,<mask25=reg128#15
# asm 2: vand >k1=q8,<k1=q8,<mask25=q14
vand q8,q8,q14

# qhasm: k3[0,1]  =   a2[0] unsigned*   a2[0]; k3[2,3]  =   a2[1] unsigned*   a2[1]	
# asm 1: vmull.u32 >k3=reg128#13,<a2=reg128#2%bot,<a2=reg128#2%bot
# asm 2: vmull.u32 >k3=q12,<a2=d2,<a2=d2
vmull.u32 q12,d2,d2

# qhasm: 2x k2 += t
# asm 1: vadd.i64 >k2=reg128#10,<k2=reg128#12,<t=reg128#10
# asm 2: vadd.i64 >k2=q9,<k2=q11,<t=q9
vadd.i64 q9,q11,q9

# qhasm: k3[0,1] += _2a1[2] unsigned*   a0[0]; k3[2,3] += _2a1[3] unsigned*   a0[1]	
# asm 1: vmlal.u32 <k3=reg128#13,<_2a1=reg128#6%top,<a0=reg128#4%bot
# asm 2: vmlal.u32 <k3=q12,<_2a1=d11,<a0=d6
vmlal.u32 q12,d11,d6

# qhasm: k3[0,1] += _2a1[0] unsigned*   a0[2]; k3[2,3] += _2a1[1] unsigned*   a0[3]
# asm 1: vmlal.u32 <k3=reg128#13,<_2a1=reg128#6%bot,<a0=reg128#4%top
# asm 2: vmlal.u32 <k3=q12,<_2a1=d10,<a0=d7
vmlal.u32 q12,d10,d7

# qhasm: 2x t = k2 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#12,<k2=reg128#10,#26
# asm 2: vshr.u64 >t=q11,<k2=q9,#26
vshr.u64 q11,q9,#26

# qhasm: k2 &= mask26
# asm 1: vand >k2=reg128#10,<k2=reg128#10,<mask26=reg128#11
# asm 2: vand >k2=q9,<k2=q9,<mask26=q10
vand q9,q9,q10

# qhasm: k4[0,1]  =   a1[0] unsigned*   a1[0]; k4[2,3]  =   a1[1] unsigned*   a1[1]	
# asm 1: vmull.u32 >k4=reg128#3,<a1=reg128#3%bot,<a1=reg128#3%bot
# asm 2: vmull.u32 >k4=q2,<a1=d4,<a1=d4
vmull.u32 q2,d4,d4

# qhasm: 2x k3 += t
# asm 1: vadd.i64 >k3=reg128#12,<k3=reg128#13,<t=reg128#12
# asm 2: vadd.i64 >k3=q11,<k3=q12,<t=q11
vadd.i64 q11,q12,q11

# qhasm: k4[0,1] += _2a2[0] unsigned*   a0[0]; k4[2,3] += _2a2[1] unsigned*   a0[1]
# asm 1: vmlal.u32 <k4=reg128#3,<_2a2=reg128#7%bot,<a0=reg128#4%bot
# asm 2: vmlal.u32 <k4=q2,<_2a2=d12,<a0=d6
vmlal.u32 q2,d12,d6

# qhasm: k4[0,1] += _2a1[2] unsigned* _2a0[0]; k4[2,3] += _2a1[3] unsigned* _2a0[1]
# asm 1: vmlal.u32 <k4=reg128#3,<_2a1=reg128#6%top,<_2a0=reg128#8%bot
# asm 2: vmlal.u32 <k4=q2,<_2a1=d11,<_2a0=d14
vmlal.u32 q2,d11,d14

# qhasm: 2x t = k3 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#4,<k3=reg128#12,#25
# asm 2: vshr.u64 >t=q3,<k3=q11,#25
vshr.u64 q3,q11,#25

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#6,<k3=reg128#12,<mask25=reg128#15
# asm 2: vand >k3=q5,<k3=q11,<mask25=q14
vand q5,q11,q14

# qhasm: 	h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]	
# asm 1: vmull.u32 >h0=reg128#12,<a3=reg128#1%bot,<a3=reg128#1%bot
# asm 2: vmull.u32 >h0=q11,<a3=d0,<a3=d0
vmull.u32 q11,d0,d0

# qhasm: 2x k4 += t
# asm 1: vadd.i64 >k4=reg128#3,<k4=reg128#3,<t=reg128#4
# asm 2: vadd.i64 >k4=q2,<k4=q2,<t=q3
vadd.i64 q2,q2,q3

# qhasm: 	h0[0,1] += _2a2[2] unsigned* _2a0[2]; h0[2,3] += _2a2[3] unsigned* _2a0[3]	
# asm 1: vmlal.u32 <h0=reg128#12,<_2a2=reg128#7%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h0=q11,<_2a2=d13,<_2a0=d15
vmlal.u32 q11,d13,d15

# qhasm: 2x t = k4 unsigned>> 25
# asm 1: vshr.u64 >t=reg128#4,<k4=reg128#3,#25
# asm 2: vshr.u64 >t=q3,<k4=q2,#25
vshr.u64 q3,q2,#25

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#10,<k3=reg128#6
# asm 2: vtrn.32 <k2=q9,<k3=q5
vtrn.32 q9,q5

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#3,<k4=reg128#3,<mask25=reg128#15
# asm 2: vand >k4=q2,<k4=q2,<mask25=q14
vand q2,q2,q14

# qhasm: 2x k0 += t
# asm 1: vadd.i64 >k0=reg128#4,<k0=reg128#5,<t=reg128#4
# asm 2: vadd.i64 >k0=q3,<k0=q4,<t=q3
vadd.i64 q3,q4,q3

# qhasm: k2 = k2[0,2,1,3]
# asm 1: vtrn.32 <k2=reg128#10%bot,<k2=reg128#10%top
# asm 2: vtrn.32 <k2=d18,<k2=d19
vtrn.32 d18,d19

# qhasm: 	h1[0,1] = _2a0[2] unsigned*   a3[0]; h1[2,3] = _2a0[3] unsigned*   a3[1]	
# asm 1: vmull.u32 >h1=reg128#5,<_2a0=reg128#8%top,<a3=reg128#1%bot
# asm 2: vmull.u32 >h1=q4,<_2a0=d15,<a3=d0
vmull.u32 q4,d15,d0

# qhasm: 2x t = k0 unsigned>> 26
# asm 1: vshr.u64 >t=reg128#6,<k0=reg128#4,#26
# asm 2: vshr.u64 >t=q5,<k0=q3,#26
vshr.u64 q5,q3,#26

# qhasm: k4 = k4[0,2,1,3]
# asm 1: vtrn.32 <k4=reg128#3%bot,<k4=reg128#3%top
# asm 2: vtrn.32 <k4=d4,<k4=d5
vtrn.32 d4,d5

# qhasm: k0 &= mask26
# asm 1: vand >k0=reg128#4,<k0=reg128#4,<mask26=reg128#11
# asm 2: vand >k0=q3,<k0=q3,<mask26=q10
vand q3,q3,q10

# qhasm: 2x k1 += t
# asm 1: vadd.i64 >k1=reg128#6,<k1=reg128#9,<t=reg128#6
# asm 2: vadd.i64 >k1=q5,<k1=q8,<t=q5
vadd.i64 q5,q8,q5

# qhasm: 	h5[0,1]  = _2a2[2] unsigned*   a3[0]; h5[2,3]  = _2a2[3] unsigned*   a3[1]	
# asm 1: vmull.u32 >h5=reg128#9,<_2a2=reg128#7%top,<a3=reg128#1%bot
# asm 2: vmull.u32 >h5=q8,<_2a2=d13,<a3=d0
vmull.u32 q8,d13,d0

# qhasm: 	adr1 = input_1 +64
# asm 1: add >adr1=int32#7,<input_1=int32#2,#64
# asm 2: add >adr1=r6,<input_1=r1,#64
add r6,r1,#64

# qhasm: 	a4 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>a4=reg128#13%bot->a4=reg128#13%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>a4=d24->a4=d25},[<adr1=r6,: 128]!
vld1.8 {d24-d25},[r6,: 128]!

# qhasm: 	2x _2a4 = a4 + a4
# asm 1: vadd.i64 >_2a4=reg128#14,<a4=reg128#13,<a4=reg128#13
# asm 2: vadd.i64 >_2a4=q13,<a4=q12,<a4=q12
vadd.i64 q13,q12,q12

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#4,<k1=reg128#6
# asm 2: vtrn.32 <k0=q3,<k1=q5
vtrn.32 q3,q5

# qhasm: a2 = k4[0]a2[1]
# asm 1: vmov <a2=reg128#2%bot,<k4=reg128#3%bot
# asm 2: vmov <a2=d2,<k4=d4
vmov d2,d4

# qhasm: 	h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]	
# asm 1: vmlal.u32 <h0=reg128#12,<_2a4=reg128#14%top,<_2a4=reg128#14%bot
# asm 2: vmlal.u32 <h0=q11,<_2a4=d27,<_2a4=d26
vmlal.u32 q11,d27,d26

# qhasm: 	h1[0,1] += _2a4[2] unsigned*   a4[2]; h1[2,3] += _2a4[3] unsigned*   a4[3]
# asm 1: vmlal.u32 <h1=reg128#5,<_2a4=reg128#14%top,<a4=reg128#13%top
# asm 2: vmlal.u32 <h1=q4,<_2a4=d27,<a4=d25
vmlal.u32 q4,d27,d25

# qhasm: 	h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]
# asm 1: vmlal.u32 <h1=reg128#5,<_2a2=reg128#7%top,<a4=reg128#13%bot
# asm 2: vmlal.u32 <h1=q4,<_2a2=d13,<a4=d24
vmlal.u32 q4,d13,d24

# qhasm: 	h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]
# asm 1: vmull.u32 >h3=reg128#3,<a2=reg128#2%top,<a2=reg128#2%top
# asm 2: vmull.u32 >h3=q2,<a2=d3,<a2=d3
vmull.u32 q2,d3,d3

# qhasm: 	2x t2 = h0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#6,<h0=reg128#12,#26
# asm 2: vshr.u64 >t2=q5,<h0=q11,#26
vshr.u64 q5,q11,#26

# qhasm: k0 = k0[0,2,1,3]
# asm 1: vtrn.32 <k0=reg128#4%bot,<k0=reg128#4%top
# asm 2: vtrn.32 <k0=d6,<k0=d7
vtrn.32 d6,d7

# qhasm: 	h0 &= mask26
# asm 1: vand >h0=reg128#12,<h0=reg128#12,<mask26=reg128#11
# asm 2: vand >h0=q11,<h0=q11,<mask26=q10
vand q11,q11,q10

# qhasm: 	2x h1 += t2
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t2=reg128#6
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t2=q5
vadd.i64 q4,q4,q5

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#7,<input_1=int32#2
# asm 2: mov >adr1=r6,<input_1=r1
mov r6,r1

# qhasm: mem128[adr1] aligned = k0; adr1+=16
# asm 1: vst1.8 {<k0=reg128#4%bot-<k0=reg128#4%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<k0=d6-<k0=d7},[<adr1=r6,: 128]!
vst1.8 {d6-d7},[r6,: 128]!

# qhasm: h2[0,1]  = _2a0[2] unsigned*   a3[2]; h2[2,3]  = _2a0[3] unsigned*   a3[3]	
# asm 1: vmull.u32 >h2=reg128#4,<_2a0=reg128#8%top,<a3=reg128#1%top
# asm 2: vmull.u32 >h2=q3,<_2a0=d15,<a3=d1
vmull.u32 q3,d15,d1

# qhasm: h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]
# asm 1: vmlal.u32 <h2=reg128#4,<_2a4=reg128#14%bot,<a3=reg128#1%bot
# asm 2: vmlal.u32 <h2=q3,<_2a4=d26,<a3=d0
vmlal.u32 q3,d26,d0

# qhasm: h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]
# asm 1: vmlal.u32 <h2=reg128#4,<_2a2=reg128#7%top,<_2a4=reg128#14%top
# asm 2: vmlal.u32 <h2=q3,<_2a2=d13,<_2a4=d27
vmlal.u32 q3,d13,d27

# qhasm: 2x t2 = h1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#6,<h1=reg128#5,#25
# asm 2: vshr.u64 >t2=q5,<h1=q4,#25
vshr.u64 q5,q4,#25

# qhasm: h1 &= mask25
# asm 1: vand >h1=reg128#5,<h1=reg128#5,<mask25=reg128#15
# asm 2: vand >h1=q4,<h1=q4,<mask25=q14
vand q4,q4,q14

# qhasm: mem128[adr1] aligned = k2; adr1+=16	
# asm 1: vst1.8 {<k2=reg128#10%bot-<k2=reg128#10%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<k2=d18-<k2=d19},[<adr1=r6,: 128]!
vst1.8 {d18-d19},[r6,: 128]!

# qhasm: h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]	
# asm 1: vmlal.u32 <h3=reg128#3,<_2a4=reg128#14%top,<a3=reg128#1%bot
# asm 2: vmlal.u32 <h3=q2,<_2a4=d27,<a3=d0
vmlal.u32 q2,d27,d0

# qhasm: 2x h2 += t2
# asm 1: vadd.i64 >h2=reg128#4,<h2=reg128#4,<t2=reg128#6
# asm 2: vadd.i64 >h2=q3,<h2=q3,<t2=q5
vadd.i64 q3,q3,q5

# qhasm: h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]	
# asm 1: vmlal.u32 <h3=reg128#3,<_2a4=reg128#14%bot,<a3=reg128#1%top
# asm 2: vmlal.u32 <h3=q2,<_2a4=d26,<a3=d1
vmlal.u32 q2,d26,d1

# qhasm: 2x t2 = h2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#1,<h2=reg128#4,#26
# asm 2: vshr.u64 >t2=q0,<h2=q3,#26
vshr.u64 q0,q3,#26

# qhasm: b4 = h2 & mask26	
# asm 1: vand >b4=reg128#4,<h2=reg128#4,<mask26=reg128#11
# asm 2: vand >b4=q3,<h2=q3,<mask26=q10
vand q3,q3,q10

# qhasm: h5[0,1] +=   a4[0] unsigned*   a4[0]; h5[2,3] +=   a4[1] unsigned*   a4[1]	
# asm 1: vmlal.u32 <h5=reg128#9,<a4=reg128#13%bot,<a4=reg128#13%bot
# asm 2: vmlal.u32 <h5=q8,<a4=d24,<a4=d24
vmlal.u32 q8,d24,d24

# qhasm: 2x h3 += t2
# asm 1: vadd.i64 >h3=reg128#1,<h3=reg128#3,<t2=reg128#1
# asm 2: vadd.i64 >h3=q0,<h3=q2,<t2=q0
vadd.i64 q0,q2,q0

# qhasm: h5[0,1] += _2a4[2] unsigned* _2a0[2]; h5[2,3] += _2a4[3] unsigned* _2a0[3]	
# asm 1: vmlal.u32 <h5=reg128#9,<_2a4=reg128#14%top,<_2a0=reg128#8%top
# asm 2: vmlal.u32 <h5=q8,<_2a4=d27,<_2a0=d15
vmlal.u32 q8,d27,d15

# qhasm: 2x t2 = h3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#3,<h3=reg128#1,#25
# asm 2: vshr.u64 >t2=q2,<h3=q0,#25
vshr.u64 q2,q0,#25

# qhasm: 		adr3 = input_3
# asm 1: mov >adr3=int32#7,<input_3=int32#4
# asm 2: mov >adr3=r6,<input_3=r3
mov r6,r3

# qhasm: 		c0 aligned = mem128[adr3]
# asm 1: vld1.8 {>c0=reg128#6%bot->c0=reg128#6%top},[<adr3=int32#7,: 128]
# asm 2: vld1.8 {>c0=d10->c0=d11},[<adr3=r6,: 128]
vld1.8 {d10-d11},[r6,: 128]

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#1,<h3=reg128#1,<mask25=reg128#15
# asm 2: vand >h3=q0,<h3=q0,<mask25=q14
vand q0,q0,q14

# qhasm: 		adr1 = input_1
# asm 1: mov >adr1=int32#7,<input_1=int32#2
# asm 2: mov >adr1=r6,<input_1=r1
mov r6,r1

# qhasm: 		b0 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b0=reg128#7%bot->b0=reg128#7%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b0=d12->b0=d13},[<adr1=r6,: 128]!
vld1.8 {d12-d13},[r6,: 128]!

# qhasm: 		k0[0,1]  =   b0[0] unsigned* c0[0]; k0[2,3]  =   b0[1] unsigned* c0[1]	
# asm 1: vmull.u32 >k0=reg128#8,<b0=reg128#7%bot,<c0=reg128#6%bot
# asm 2: vmull.u32 >k0=q7,<b0=d12,<c0=d10
vmull.u32 q7,d12,d10

# qhasm: 2x h5 += t2
# asm 1: vadd.i64 >h5=reg128#3,<h5=reg128#9,<t2=reg128#3
# asm 2: vadd.i64 >h5=q2,<h5=q8,<t2=q2
vadd.i64 q2,q8,q2

# qhasm: 		k1[0,1]  =   b0[2] unsigned* c0[0]; k1[2,3]  =   b0[3] unsigned* c0[1]	
# asm 1: vmull.u32 >k1=reg128#7,<b0=reg128#7%top,<c0=reg128#6%bot
# asm 2: vmull.u32 >k1=q6,<b0=d13,<c0=d10
vmull.u32 q6,d13,d10

# qhasm: 2x t2 = h5 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#9,<h5=reg128#3,#25
# asm 2: vshr.u64 >t2=q8,<h5=q2,#25
vshr.u64 q8,q2,#25

# qhasm: b4 h3 = b4[0]h3[0]b4[2]h3[2] b4[1]h3[1]b4[3]h3[3]
# asm 1: vtrn.32 <b4=reg128#4,<h3=reg128#1
# asm 2: vtrn.32 <b4=q3,<h3=q0
vtrn.32 q3,q0

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#1,<h5=reg128#3,<mask25=reg128#15
# asm 2: vand >h5=q0,<h5=q2,<mask25=q14
vand q0,q2,q14

# qhasm: 2x h0 += t2
# asm 1: vadd.i64 >h0=reg128#3,<h0=reg128#12,<t2=reg128#9
# asm 2: vadd.i64 >h0=q2,<h0=q11,<t2=q8
vadd.i64 q2,q11,q8

# qhasm: b4 = b4[0,2,1,3]
# asm 1: vtrn.32 <b4=reg128#4%bot,<b4=reg128#4%top
# asm 2: vtrn.32 <b4=d6,<b4=d7
vtrn.32 d6,d7

# qhasm: 		2x t2 = k0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#9,<k0=reg128#8,#26
# asm 2: vshr.u64 >t2=q8,<k0=q7,#26
vshr.u64 q8,q7,#26

# qhasm: 		k0 &= mask26
# asm 1: vand >k0=reg128#8,<k0=reg128#8,<mask26=reg128#11
# asm 2: vand >k0=q7,<k0=q7,<mask26=q10
vand q7,q7,q10

# qhasm: 		2x k1 += t2
# asm 1: vadd.i64 >k1=reg128#7,<k1=reg128#7,<t2=reg128#9
# asm 2: vadd.i64 >k1=q6,<k1=q6,<t2=q8
vadd.i64 q6,q6,q8

# qhasm: 2x t2 = h0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#9,<h0=reg128#3,#26
# asm 2: vshr.u64 >t2=q8,<h0=q2,#26
vshr.u64 q8,q2,#26

# qhasm: h5 = h5[0,2,1,3]
# asm 1: vtrn.32 <h5=reg128#1%bot,<h5=reg128#1%top
# asm 2: vtrn.32 <h5=d0,<h5=d1
vtrn.32 d0,d1

# qhasm: b3 = h0 & mask26	
# asm 1: vand >b3=reg128#3,<h0=reg128#3,<mask26=reg128#11
# asm 2: vand >b3=q2,<h0=q2,<mask26=q10
vand q2,q2,q10

# qhasm: 		adr1 = input_1 + 16
# asm 1: add >adr1=int32#7,<input_1=int32#2,#16
# asm 2: add >adr1=r6,<input_1=r1,#16
add r6,r1,#16

# qhasm: 		b1 aligned = mem128[adr1]; adr1+=16
# asm 1: vld1.8 {>b1=reg128#10%bot->b1=reg128#10%top},[<adr1=int32#7,: 128]!
# asm 2: vld1.8 {>b1=d18->b1=d19},[<adr1=r6,: 128]!
vld1.8 {d18-d19},[r6,: 128]!

# qhasm: 		k2[0,1]  =   b1[0] unsigned* c0[0]; k2[2,3]  =   b1[1] unsigned* c0[1]	
# asm 1: vmull.u32 >k2=reg128#12,<b1=reg128#10%bot,<c0=reg128#6%bot
# asm 2: vmull.u32 >k2=q11,<b1=d18,<c0=d10
vmull.u32 q11,d18,d10

# qhasm: 2x h1 += t2
# asm 1: vadd.i64 >h1=reg128#5,<h1=reg128#5,<t2=reg128#9
# asm 2: vadd.i64 >h1=q4,<h1=q4,<t2=q8
vadd.i64 q4,q4,q8

# qhasm: a2 = a2[0]h5[0]
# asm 1: vmov <a2=reg128#2%top,<h5=reg128#1%bot
# asm 2: vmov <a2=d3,<h5=d0
vmov d3,d0

# qhasm: 		2x t2 = k1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#1,<k1=reg128#7,#25
# asm 2: vshr.u64 >t2=q0,<k1=q6,#25
vshr.u64 q0,q6,#25

# qhasm: 		k1 &= mask25
# asm 1: vand >k1=reg128#7,<k1=reg128#7,<mask25=reg128#15
# asm 2: vand >k1=q6,<k1=q6,<mask25=q14
vand q6,q6,q14

# qhasm: 		2x k2 += t2
# asm 1: vadd.i64 >k2=reg128#1,<k2=reg128#12,<t2=reg128#1
# asm 2: vadd.i64 >k2=q0,<k2=q11,<t2=q0
vadd.i64 q0,q11,q0

# qhasm: 		k3[0,1]  =   b1[2] unsigned* c0[0]; k3[2,3]  =   b1[3] unsigned* c0[1]	
# asm 1: vmull.u32 >k3=reg128#9,<b1=reg128#10%top,<c0=reg128#6%bot
# asm 2: vmull.u32 >k3=q8,<b1=d19,<c0=d10
vmull.u32 q8,d19,d10

# qhasm: 		k4[0,1]  =   a2[0] unsigned* c0[0]; k4[2,3]  =   a2[1] unsigned* c0[1]
# asm 1: vmull.u32 >k4=reg128#10,<a2=reg128#2%bot,<c0=reg128#6%bot
# asm 2: vmull.u32 >k4=q9,<a2=d2,<c0=d10
vmull.u32 q9,d2,d10

# qhasm: 		2x t2 = k2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#12,<k2=reg128#1,#26
# asm 2: vshr.u64 >t2=q11,<k2=q0,#26
vshr.u64 q11,q0,#26

# qhasm: b3 h1 = b3[0]h1[0]b3[2]h1[2] b3[1]h1[1]b3[3]h1[3]
# asm 1: vtrn.32 <b3=reg128#3,<h1=reg128#5
# asm 2: vtrn.32 <b3=q2,<h1=q4
vtrn.32 q2,q4

# qhasm: 		k2 &= mask26
# asm 1: vand >k2=reg128#1,<k2=reg128#1,<mask26=reg128#11
# asm 2: vand >k2=q0,<k2=q0,<mask26=q10
vand q0,q0,q10

# qhasm: 		2x k3 += t2
# asm 1: vadd.i64 >k3=reg128#5,<k3=reg128#9,<t2=reg128#12
# asm 2: vadd.i64 >k3=q4,<k3=q8,<t2=q11
vadd.i64 q4,q8,q11

# qhasm: b3 = b3[0,2,1,3]
# asm 1: vtrn.32 <b3=reg128#3%bot,<b3=reg128#3%top
# asm 2: vtrn.32 <b3=d4,<b3=d5
vtrn.32 d4,d5

# qhasm: 		h0[0,1]  =   b3[0] unsigned* c0[2]; h0[2,3]  =   b3[1] unsigned* c0[3]	
# asm 1: vmull.u32 >h0=reg128#9,<b3=reg128#3%bot,<c0=reg128#6%top
# asm 2: vmull.u32 >h0=q8,<b3=d4,<c0=d11
vmull.u32 q8,d4,d11

# qhasm: 2x t2 = k3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#12,<k3=reg128#5,#25
# asm 2: vshr.u64 >t2=q11,<k3=q4,#25
vshr.u64 q11,q4,#25

# qhasm: k3 &= mask25
# asm 1: vand >k3=reg128#5,<k3=reg128#5,<mask25=reg128#15
# asm 2: vand >k3=q4,<k3=q4,<mask25=q14
vand q4,q4,q14

# qhasm: 2x k4 += t2
# asm 1: vadd.i64 >k4=reg128#10,<k4=reg128#10,<t2=reg128#12
# asm 2: vadd.i64 >k4=q9,<k4=q9,<t2=q11
vadd.i64 q9,q9,q11

# qhasm: 		h1[0,1]  =   b3[2] unsigned* c0[2]; h1[2,3]  =   b3[3] unsigned* c0[3]	
# asm 1: vmull.u32 >h1=reg128#3,<b3=reg128#3%top,<c0=reg128#6%top
# asm 2: vmull.u32 >h1=q2,<b3=d5,<c0=d11
vmull.u32 q2,d5,d11

# qhasm: 2x t2 = k4 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#12,<k4=reg128#10,#25
# asm 2: vshr.u64 >t2=q11,<k4=q9,#25
vshr.u64 q11,q9,#25

# qhasm: k4 &= mask25
# asm 1: vand >k4=reg128#10,<k4=reg128#10,<mask25=reg128#15
# asm 2: vand >k4=q9,<k4=q9,<mask25=q14
vand q9,q9,q14

# qhasm: k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
# asm 1: vtrn.32 <k2=reg128#1,<k3=reg128#5
# asm 2: vtrn.32 <k2=q0,<k3=q4
vtrn.32 q0,q4

# qhasm: 2x k0 += t2
# asm 1: vadd.i64 >k0=reg128#5,<k0=reg128#8,<t2=reg128#12
# asm 2: vadd.i64 >k0=q4,<k0=q7,<t2=q11
vadd.i64 q4,q7,q11

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 80
# asm 1: add >adr5=int32#7,<adr5=int32#7,#80
# asm 2: add >adr5=r6,<adr5=r6,#80
add r6,r6,#80

# qhasm: _28_27_28_27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_28_27_28_27=reg128#8%bot->_28_27_28_27=reg128#8%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_28_27_28_27=d14->_28_27_28_27=d15},[<adr5=r6,: 128]
vld1.8 {d14-d15},[r6,: 128]

# qhasm: 4x n1 = _28_27_28_27 - k2
# asm 1: vsub.i32 >n1=reg128#12,<_28_27_28_27=reg128#8,<k2=reg128#1
# asm 2: vsub.i32 >n1=q11,<_28_27_28_27=q7,<k2=q0
vsub.i32 q11,q7,q0

# qhasm: 		2x t2 = h0 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#13,<h0=reg128#9,#26
# asm 2: vshr.u64 >t2=q12,<h0=q8,#26
vshr.u64 q12,q8,#26

# qhasm: 		h0 &= mask26
# asm 1: vand >h0=reg128#9,<h0=reg128#9,<mask26=reg128#11
# asm 2: vand >h0=q8,<h0=q8,<mask26=q10
vand q8,q8,q10

# qhasm: k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
# asm 1: vtrn.32 <k0=reg128#5,<k1=reg128#7
# asm 2: vtrn.32 <k0=q4,<k1=q6
vtrn.32 q4,q6

# qhasm: 		2x h1 += t2
# asm 1: vadd.i64 >h1=reg128#3,<h1=reg128#3,<t2=reg128#13
# asm 2: vadd.i64 >h1=q2,<h1=q2,<t2=q12
vadd.i64 q2,q2,q12

# qhasm: 		h2[0,1]  =   b4[0] unsigned* c0[2]; h2[2,3]  =   b4[1] unsigned* c0[3]	
# asm 1: vmull.u32 >h2=reg128#7,<b4=reg128#4%bot,<c0=reg128#6%top
# asm 2: vmull.u32 >h2=q6,<b4=d6,<c0=d11
vmull.u32 q6,d6,d11

# qhasm: 4x n0 = _28_27_28_27 - k0
# asm 1: vsub.i32 >n0=reg128#8,<_28_27_28_27=reg128#8,<k0=reg128#5
# asm 2: vsub.i32 >n0=q7,<_28_27_28_27=q7,<k0=q4
vsub.i32 q7,q7,q4

# qhasm: n1 = n1[0]k2[1]
# asm 1: vmov <n1=reg128#12%top,<k2=reg128#1%top
# asm 2: vmov <n1=d23,<k2=d1
vmov d23,d1

# qhasm: n0 = n0[0]k0[1]
# asm 1: vmov <n0=reg128#8%top,<k0=reg128#5%top
# asm 2: vmov <n0=d15,<k0=d9
vmov d15,d9

# qhasm: 		2x t2 = h1 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#1,<h1=reg128#3,#25
# asm 2: vshr.u64 >t2=q0,<h1=q2,#25
vshr.u64 q0,q2,#25

# qhasm: n1 = n1[0,2,1,3]
# asm 1: vtrn.32 <n1=reg128#12%bot,<n1=reg128#12%top
# asm 2: vtrn.32 <n1=d22,<n1=d23
vtrn.32 d22,d23

# qhasm: 		h1 &= mask25
# asm 1: vand >h1=reg128#3,<h1=reg128#3,<mask25=reg128#15
# asm 2: vand >h1=q2,<h1=q2,<mask25=q14
vand q2,q2,q14

# qhasm: n0 = n0[0,2,1,3]
# asm 1: vtrn.32 <n0=reg128#8%bot,<n0=reg128#8%top
# asm 2: vtrn.32 <n0=d14,<n0=d15
vtrn.32 d14,d15

# qhasm: 		2x h2 += t2
# asm 1: vadd.i64 >h2=reg128#1,<h2=reg128#7,<t2=reg128#1
# asm 2: vadd.i64 >h2=q0,<h2=q6,<t2=q0
vadd.i64 q0,q6,q0

# qhasm: 		h3[0,1]  =   b4[2] unsigned* c0[2]; h3[2,3]  =   b4[3] unsigned* c0[3]	
# asm 1: vmull.u32 >h3=reg128#4,<b4=reg128#4%top,<c0=reg128#6%top
# asm 2: vmull.u32 >h3=q3,<b4=d7,<c0=d11
vmull.u32 q3,d7,d11

# qhasm: 		2x t2 = h2 unsigned>> 26
# asm 1: vshr.u64 >t2=reg128#5,<h2=reg128#1,#26
# asm 2: vshr.u64 >t2=q4,<h2=q0,#26
vshr.u64 q4,q0,#26

# qhasm: adr1 = input_1
# asm 1: mov >adr1=int32#7,<input_1=int32#2
# asm 2: mov >adr1=r6,<input_1=r1
mov r6,r1

# qhasm: mem128[adr1] aligned = n0; adr1+=16
# asm 1: vst1.8 {<n0=reg128#8%bot-<n0=reg128#8%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<n0=d14-<n0=d15},[<adr1=r6,: 128]!
vst1.8 {d14-d15},[r6,: 128]!

# qhasm: 		h2 &= mask26
# asm 1: vand >h2=reg128#1,<h2=reg128#1,<mask26=reg128#11
# asm 2: vand >h2=q0,<h2=q0,<mask26=q10
vand q0,q0,q10

# qhasm: mem128[adr1] aligned = n1; adr1+=16
# asm 1: vst1.8 {<n1=reg128#12%bot-<n1=reg128#12%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<n1=d22-<n1=d23},[<adr1=r6,: 128]!
vst1.8 {d22-d23},[r6,: 128]!

# qhasm: h5[0,1]  =   a2[2] unsigned* c0[2]; h5[2,3]  =   a2[3] unsigned* c0[3]	
# asm 1: vmull.u32 >h5=reg128#2,<a2=reg128#2%top,<c0=reg128#6%top
# asm 2: vmull.u32 >h5=q1,<a2=d3,<c0=d11
vmull.u32 q1,d3,d11

# qhasm: 2x h3 += t2
# asm 1: vadd.i64 >h3=reg128#4,<h3=reg128#4,<t2=reg128#5
# asm 2: vadd.i64 >h3=q3,<h3=q3,<t2=q4
vadd.i64 q3,q3,q4

# qhasm: 2x t2 = h3 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#5,<h3=reg128#4,#25
# asm 2: vshr.u64 >t2=q4,<h3=q3,#25
vshr.u64 q4,q3,#25

# qhasm: h3 &= mask25
# asm 1: vand >h3=reg128#4,<h3=reg128#4,<mask25=reg128#15
# asm 2: vand >h3=q3,<h3=q3,<mask25=q14
vand q3,q3,q14

# qhasm: 2x h5 += t2
# asm 1: vadd.i64 >h5=reg128#2,<h5=reg128#2,<t2=reg128#5
# asm 2: vadd.i64 >h5=q1,<h5=q1,<t2=q4
vadd.i64 q1,q1,q4

# qhasm: 2x t2 = h5 unsigned>> 25
# asm 1: vshr.u64 >t2=reg128#5,<h5=reg128#2,#25
# asm 2: vshr.u64 >t2=q4,<h5=q1,#25
vshr.u64 q4,q1,#25

# qhasm: h5 &= mask25
# asm 1: vand >h5=reg128#2,<h5=reg128#2,<mask25=reg128#15
# asm 2: vand >h5=q1,<h5=q1,<mask25=q14
vand q1,q1,q14

# qhasm: 2x h0 += t2
# asm 1: vadd.i64 >h0=reg128#5,<h0=reg128#9,<t2=reg128#5
# asm 2: vadd.i64 >h0=q4,<h0=q8,<t2=q4
vadd.i64 q4,q8,q4

# qhasm: adr5 = input_5
# asm 1: ldr >adr5=int32#7,<input_5=stack32#arg18
# asm 2: ldr >adr5=r6,<input_5=[r12,#68]
ldr r6,[r12,#68]

# qhasm: adr5 += 64
# asm 1: add >adr5=int32#7,<adr5=int32#7,#64
# asm 2: add >adr5=r6,<adr5=r6,#64
add r6,r6,#64

# qhasm: _27 aligned = mem128[adr5]
# asm 1: vld1.8 {>_27=reg128#6%bot->_27=reg128#6%top},[<adr5=int32#7,: 128]
# asm 2: vld1.8 {>_27=d10->_27=d11},[<adr5=r6,: 128]
vld1.8 {d10-d11},[r6,: 128]

# qhasm: k4 h5 = k4[0]h5[0]k4[2]h5[2] k4[1]h5[1]k4[3]h5[3]
# asm 1: vtrn.32 <k4=reg128#10,<h5=reg128#2
# asm 2: vtrn.32 <k4=q9,<h5=q1
vtrn.32 q9,q1

# qhasm: h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
# asm 1: vtrn.32 <h2=reg128#1,<h3=reg128#4
# asm 2: vtrn.32 <h2=q0,<h3=q3
vtrn.32 q0,q3

# qhasm: h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
# asm 1: vtrn.32 <h0=reg128#5,<h1=reg128#3
# asm 2: vtrn.32 <h0=q4,<h1=q2
vtrn.32 q4,q2

# qhasm: 4x n2 = _27 - k4
# asm 1: vsub.i32 >n2=reg128#2,<_27=reg128#6,<k4=reg128#10
# asm 2: vsub.i32 >n2=q1,<_27=q5,<k4=q9
vsub.i32 q1,q5,q9

# qhasm: h2 = h2[0,2,1,3]
# asm 1: vtrn.32 <h2=reg128#1%bot,<h2=reg128#1%top
# asm 2: vtrn.32 <h2=d0,<h2=d1
vtrn.32 d0,d1

# qhasm: h0 = h0[0,2,1,3]
# asm 1: vtrn.32 <h0=reg128#5%bot,<h0=reg128#5%top
# asm 2: vtrn.32 <h0=d8,<h0=d9
vtrn.32 d8,d9

# qhasm: h1 = k4[1,2,3]n2[0]
# asm 1: vext.32 >h1=reg128#2,<k4=reg128#10,<n2=reg128#2,#1
# asm 2: vext.32 >h1=q1,<k4=q9,<n2=q1,#1
vext.32 q1,q9,q1,#1

# qhasm: adr1 = input_1 + 64
# asm 1: add >adr1=int32#7,<input_1=int32#2,#64
# asm 2: add >adr1=r6,<input_1=r1,#64
add r6,r1,#64

# qhasm: mem128[adr1] aligned = h2
# asm 1: vst1.8 {<h2=reg128#1%bot-<h2=reg128#1%top},[<adr1=int32#7,: 128]
# asm 2: vst1.8 {<h2=d0-<h2=d1},[<adr1=r6,: 128]
vst1.8 {d0-d1},[r6,: 128]

# qhasm: adr1 -= 16
# asm 1: sub >adr1=int32#7,<adr1=int32#7,#16
# asm 2: sub >adr1=r6,<adr1=r6,#16
sub r6,r6,#16

# qhasm: mem128[adr1] aligned = h0; adr1+=16
# asm 1: vst1.8 {<h0=reg128#5%bot-<h0=reg128#5%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<h0=d8-<h0=d9},[<adr1=r6,: 128]!
vst1.8 {d8-d9},[r6,: 128]!

# qhasm: h4 = h1[3]h1[0,1,2]
# asm 1: vext.32 >h4=reg128#1,<h1=reg128#2,<h1=reg128#2,#3
# asm 2: vext.32 >h4=q0,<h1=q1,<h1=q1,#3
vext.32 q0,q1,q1,#3

# qhasm: h4 = h4[0,2,1,3]
# asm 1: vtrn.32 <h4=reg128#1%bot,<h4=reg128#1%top
# asm 2: vtrn.32 <h4=d0,<h4=d1
vtrn.32 d0,d1

# qhasm: adr1 = input_1 + 32
# asm 1: add >adr1=int32#7,<input_1=int32#2,#32
# asm 2: add >adr1=r6,<input_1=r1,#32
add r6,r1,#32

# qhasm: mem128[adr1] aligned = h4; adr1+=16
# asm 1: vst1.8 {<h4=reg128#1%bot-<h4=reg128#1%top},[<adr1=int32#7,: 128]!
# asm 2: vst1.8 {<h4=d0-<h4=d1},[<adr1=r6,: 128]!
vst1.8 {d0-d1},[r6,: 128]!

# qhasm: unsigned<? count -= 1
# asm 1: subs >count=int32#5,<count=int32#5,#1
# asm 2: subs >count=r4,<count=r4,#1
subs r4,r4,#1

# qhasm: goto looptop if !unsigned<
bhs ._looptop

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
