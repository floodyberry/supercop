
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

# qhasm: reg128 bb0

# qhasm: reg128 bb1

# qhasm: reg128 bb2

# qhasm: reg128 bb3

# qhasm: reg128 bb4

# qhasm: reg128 bb5

# qhasm: reg128 bb6

# qhasm: reg128 bb7

# qhasm: reg128 bb8

# qhasm: reg128 bb9

# qhasm: reg128 bb10

# qhasm: reg128 bb11

# qhasm: reg128 bb12

# qhasm: reg128 bb13

# qhasm: reg128 bb14

# qhasm: reg128 bb15

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

# qhasm: reg128 SR

# qhasm: stack128 SR_stack

# qhasm: int32 y

# qhasm: int32 z

# qhasm: stack128 RCTRINC1_stack

# qhasm: stack128 RCTRINC2_stack

# qhasm: stack128 RCTRINC3_stack

# qhasm: stack128 RCTRINC4_stack

# qhasm: stack128 RCTRINC5_stack

# qhasm: stack128 RCTRINC6_stack

# qhasm: stack128 RCTRINC7_stack

# qhasm: reg128 RCTRINC1

# qhasm: reg128 RCTRINC2

# qhasm: reg128 RCTRINC3

# qhasm: reg128 RCTRINC4

# qhasm: reg128 RCTRINC5

# qhasm: reg128 RCTRINC6

# qhasm: reg128 RCTRINC7

# qhasm: stack1024 bl

# qhasm: stack128 nonce_stack

# qhasm: int32 blp

# qhasm: int32 b

# qhasm: int32 tmp

# qhasm: int32 c

# qhasm: int32 np

# qhasm: qpushenter crypto_stream_aes128ctr_neon_afternm_constants
.align 2
.global _crypto_stream_aes128ctr_neon_afternm_constants
.global crypto_stream_aes128ctr_neon_afternm_constants
.type _crypto_stream_aes128ctr_neon_afternm_constants STT_FUNC
.type crypto_stream_aes128ctr_neon_afternm_constants STT_FUNC
_crypto_stream_aes128ctr_neon_afternm_constants:
crypto_stream_aes128ctr_neon_afternm_constants:
vpush {q4,q5,q6,q7}
mov r12,sp
sub sp,sp,#320
and sp,sp,#0xffffffe0

# qhasm: stack64 stack_r45

# qhasm: stack64 stack_r67

# qhasm: assign r4 r5 to caller_r4 caller_r5;stack_r45 = caller_r4 caller_r5
# asm 1: strd <caller_r4=int32#5,>stack_r45=stack64#1
# asm 2: strd <caller_r4=r4,>stack_r45=[sp,#0]
strd r4,[sp,#0]

# qhasm: assign r6 r7 to caller_r6 caller_r7;stack_r67 = caller_r6 caller_r7
# asm 1: strd <caller_r6=int32#7,>stack_r67=stack64#2
# asm 2: strd <caller_r6=r6,>stack_r67=[sp,#8]
strd r6,[sp,#8]

# qhasm: np = input_4
# asm 1: ldr >np=int32#2,<input_4=stack32#arg17
# asm 2: ldr >np=r1,<input_4=[r12,#64]
ldr r1,[r12,#64]

# qhasm: bb0 = mem128[np]
# asm 1: vld1.8 {>bb0=reg128#1%bot->bb0=reg128#1%top},[<np=int32#2]
# asm 2: vld1.8 {>bb0=d0->bb0=d1},[<np=r1]
vld1.8 {d0-d1},[r1]

# qhasm: new nonce_stack

# qhasm: new SR_stack

# qhasm: new RCTRINC1_stack

# qhasm: new RCTRINC2_stack

# qhasm: new RCTRINC3_stack

# qhasm: new RCTRINC4_stack

# qhasm: new RCTRINC5_stack

# qhasm: new RCTRINC6_stack

# qhasm: new RCTRINC7_stack

# qhasm: np = &nonce_stack
# asm 1: lea >np=int32#2,<nonce_stack=stack128#1
# asm 2: lea >np=r1,<nonce_stack=[sp,#32]
add r1,sp,#32

# qhasm: mem128[np] aligned= bb0
# asm 1: vst1.8 {<bb0=reg128#1%bot-<bb0=reg128#1%top},[<np=int32#2,: 128]
# asm 2: vst1.8 {<bb0=d0-<bb0=d1},[<np=r1,: 128]
vst1.8 {d0-d1},[r1,: 128]

# qhasm: z = input_6
# asm 1: ldr >z=int32#4,<input_6=stack32#arg19
# asm 2: ldr >z=r3,<input_6=[r12,#72]
ldr r3,[r12,#72]

# qhasm: SR = mem128[z];z += 16
# asm 1: vld1.8 {>SR=reg128#1%bot->SR=reg128#1%top},[<z=int32#4]!
# asm 2: vld1.8 {>SR=d0->SR=d1},[<z=r3]!
vld1.8 {d0-d1},[r3]!

# qhasm: RCTRINC1 = mem128[z]
# asm 1: vld1.8 {>RCTRINC1=reg128#2%bot->RCTRINC1=reg128#2%top},[<z=int32#4]
# asm 2: vld1.8 {>RCTRINC1=d2->RCTRINC1=d3},[<z=r3]
vld1.8 {d2-d3},[r3]

# qhasm: 4x RCTRINC2 = RCTRINC1 + RCTRINC1
# asm 1: vadd.i32 >RCTRINC2=reg128#3,<RCTRINC1=reg128#2,<RCTRINC1=reg128#2
# asm 2: vadd.i32 >RCTRINC2=q2,<RCTRINC1=q1,<RCTRINC1=q1
vadd.i32 q2,q1,q1

# qhasm: 4x RCTRINC3 = RCTRINC2 + RCTRINC1
# asm 1: vadd.i32 >RCTRINC3=reg128#4,<RCTRINC2=reg128#3,<RCTRINC1=reg128#2
# asm 2: vadd.i32 >RCTRINC3=q3,<RCTRINC2=q2,<RCTRINC1=q1
vadd.i32 q3,q2,q1

# qhasm: 4x RCTRINC4 = RCTRINC3 + RCTRINC1
# asm 1: vadd.i32 >RCTRINC4=reg128#5,<RCTRINC3=reg128#4,<RCTRINC1=reg128#2
# asm 2: vadd.i32 >RCTRINC4=q4,<RCTRINC3=q3,<RCTRINC1=q1
vadd.i32 q4,q3,q1

# qhasm: 4x RCTRINC5 = RCTRINC4 + RCTRINC1
# asm 1: vadd.i32 >RCTRINC5=reg128#6,<RCTRINC4=reg128#5,<RCTRINC1=reg128#2
# asm 2: vadd.i32 >RCTRINC5=q5,<RCTRINC4=q4,<RCTRINC1=q1
vadd.i32 q5,q4,q1

# qhasm: 4x RCTRINC6 = RCTRINC5 + RCTRINC1
# asm 1: vadd.i32 >RCTRINC6=reg128#7,<RCTRINC5=reg128#6,<RCTRINC1=reg128#2
# asm 2: vadd.i32 >RCTRINC6=q6,<RCTRINC5=q5,<RCTRINC1=q1
vadd.i32 q6,q5,q1

# qhasm: 4x RCTRINC7 = RCTRINC6 + RCTRINC1
# asm 1: vadd.i32 >RCTRINC7=reg128#8,<RCTRINC6=reg128#7,<RCTRINC1=reg128#2
# asm 2: vadd.i32 >RCTRINC7=q7,<RCTRINC6=q6,<RCTRINC1=q1
vadd.i32 q7,q6,q1

# qhasm: z = &SR_stack
# asm 1: lea >z=int32#4,<SR_stack=stack128#2
# asm 2: lea >z=r3,<SR_stack=[sp,#48]
add r3,sp,#48

# qhasm: mem128[z] aligned= SR
# asm 1: vst1.8 {<SR=reg128#1%bot-<SR=reg128#1%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<SR=d0-<SR=d1},[<z=r3,: 128]
vst1.8 {d0-d1},[r3,: 128]

# qhasm: z = &RCTRINC1_stack
# asm 1: lea >z=int32#4,<RCTRINC1_stack=stack128#3
# asm 2: lea >z=r3,<RCTRINC1_stack=[sp,#64]
add r3,sp,#64

# qhasm: mem128[z] aligned= RCTRINC1
# asm 1: vst1.8 {<RCTRINC1=reg128#2%bot-<RCTRINC1=reg128#2%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC1=d2-<RCTRINC1=d3},[<z=r3,: 128]
vst1.8 {d2-d3},[r3,: 128]

# qhasm: z = &RCTRINC2_stack
# asm 1: lea >z=int32#4,<RCTRINC2_stack=stack128#4
# asm 2: lea >z=r3,<RCTRINC2_stack=[sp,#80]
add r3,sp,#80

# qhasm: mem128[z] aligned= RCTRINC2
# asm 1: vst1.8 {<RCTRINC2=reg128#3%bot-<RCTRINC2=reg128#3%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC2=d4-<RCTRINC2=d5},[<z=r3,: 128]
vst1.8 {d4-d5},[r3,: 128]

# qhasm: z = &RCTRINC3_stack
# asm 1: lea >z=int32#4,<RCTRINC3_stack=stack128#5
# asm 2: lea >z=r3,<RCTRINC3_stack=[sp,#96]
add r3,sp,#96

# qhasm: mem128[z] aligned= RCTRINC3
# asm 1: vst1.8 {<RCTRINC3=reg128#4%bot-<RCTRINC3=reg128#4%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC3=d6-<RCTRINC3=d7},[<z=r3,: 128]
vst1.8 {d6-d7},[r3,: 128]

# qhasm: z = &RCTRINC4_stack
# asm 1: lea >z=int32#4,<RCTRINC4_stack=stack128#6
# asm 2: lea >z=r3,<RCTRINC4_stack=[sp,#112]
add r3,sp,#112

# qhasm: mem128[z] aligned= RCTRINC4
# asm 1: vst1.8 {<RCTRINC4=reg128#5%bot-<RCTRINC4=reg128#5%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC4=d8-<RCTRINC4=d9},[<z=r3,: 128]
vst1.8 {d8-d9},[r3,: 128]

# qhasm: z = &RCTRINC5_stack
# asm 1: lea >z=int32#4,<RCTRINC5_stack=stack128#7
# asm 2: lea >z=r3,<RCTRINC5_stack=[sp,#128]
add r3,sp,#128

# qhasm: mem128[z] aligned= RCTRINC5
# asm 1: vst1.8 {<RCTRINC5=reg128#6%bot-<RCTRINC5=reg128#6%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC5=d10-<RCTRINC5=d11},[<z=r3,: 128]
vst1.8 {d10-d11},[r3,: 128]

# qhasm: z = &RCTRINC6_stack
# asm 1: lea >z=int32#4,<RCTRINC6_stack=stack128#8
# asm 2: lea >z=r3,<RCTRINC6_stack=[sp,#144]
add r3,sp,#144

# qhasm: mem128[z] aligned= RCTRINC6
# asm 1: vst1.8 {<RCTRINC6=reg128#7%bot-<RCTRINC6=reg128#7%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC6=d12-<RCTRINC6=d13},[<z=r3,: 128]
vst1.8 {d12-d13},[r3,: 128]

# qhasm: z = &RCTRINC7_stack
# asm 1: lea >z=int32#4,<RCTRINC7_stack=stack128#9
# asm 2: lea >z=r3,<RCTRINC7_stack=[sp,#160]
add r3,sp,#160

# qhasm: mem128[z] aligned= RCTRINC7
# asm 1: vst1.8 {<RCTRINC7=reg128#8%bot-<RCTRINC7=reg128#8%top},[<z=int32#4,: 128]
# asm 2: vst1.8 {<RCTRINC7=d14-<RCTRINC7=d15},[<z=r3,: 128]
vst1.8 {d14-d15},[r3,: 128]

# qhasm: enc_block:
._enc_block:

# qhasm: c = input_5
# asm 1: ldr >c=int32#4,<input_5=stack32#arg18
# asm 2: ldr >c=r3,<input_5=[r12,#68]
ldr r3,[r12,#68]

# qhasm: bb0 aligned= mem128[np]
# asm 1: vld1.8 {>bb0=reg128#1%bot->bb0=reg128#1%top},[<np=int32#2,: 128]
# asm 2: vld1.8 {>bb0=d0->bb0=d1},[<np=r1,: 128]
vld1.8 {d0-d1},[r1,: 128]

# qhasm: bb1 = bb0
# asm 1: vmov >bb1=reg128#2,<bb0=reg128#1
# asm 2: vmov >bb1=q1,<bb0=q0
vmov q1,q0

# qhasm:   bb1 = bb1[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb1=reg128#2,<bb1=reg128#2
# asm 2: vrev32.i8 >bb1=q1,<bb1=q1
vrev32.i8 q1,q1

# qhasm: bb2 = bb1
# asm 1: vmov >bb2=reg128#3,<bb1=reg128#2
# asm 2: vmov >bb2=q2,<bb1=q1
vmov q2,q1

# qhasm: bb3 = bb1
# asm 1: vmov >bb3=reg128#4,<bb1=reg128#2
# asm 2: vmov >bb3=q3,<bb1=q1
vmov q3,q1

# qhasm: bb4 = bb1
# asm 1: vmov >bb4=reg128#5,<bb1=reg128#2
# asm 2: vmov >bb4=q4,<bb1=q1
vmov q4,q1

# qhasm: bb5 = bb1
# asm 1: vmov >bb5=reg128#6,<bb1=reg128#2
# asm 2: vmov >bb5=q5,<bb1=q1
vmov q5,q1

# qhasm: bb6 = bb1
# asm 1: vmov >bb6=reg128#7,<bb1=reg128#2
# asm 2: vmov >bb6=q6,<bb1=q1
vmov q6,q1

# qhasm: bb7 = bb1
# asm 1: vmov >bb7=reg128#8,<bb1=reg128#2
# asm 2: vmov >bb7=q7,<bb1=q1
vmov q7,q1

# qhasm: z = &RCTRINC1_stack
# asm 1: lea >z=int32#5,<RCTRINC1_stack=stack128#3
# asm 2: lea >z=r4,<RCTRINC1_stack=[sp,#64]
add r4,sp,#64

# qhasm: RCTRINC1 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC1=reg128#9%bot->RCTRINC1=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC1=d16->RCTRINC1=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb1 += RCTRINC1
# asm 1: vadd.i32 >bb1=reg128#2,<bb1=reg128#2,<RCTRINC1=reg128#9
# asm 2: vadd.i32 >bb1=q1,<bb1=q1,<RCTRINC1=q8
vadd.i32 q1,q1,q8

# qhasm: z = &RCTRINC2_stack
# asm 1: lea >z=int32#5,<RCTRINC2_stack=stack128#4
# asm 2: lea >z=r4,<RCTRINC2_stack=[sp,#80]
add r4,sp,#80

# qhasm: RCTRINC2 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC2=reg128#9%bot->RCTRINC2=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC2=d16->RCTRINC2=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb2 += RCTRINC2
# asm 1: vadd.i32 >bb2=reg128#3,<bb2=reg128#3,<RCTRINC2=reg128#9
# asm 2: vadd.i32 >bb2=q2,<bb2=q2,<RCTRINC2=q8
vadd.i32 q2,q2,q8

# qhasm: z = &RCTRINC3_stack
# asm 1: lea >z=int32#5,<RCTRINC3_stack=stack128#5
# asm 2: lea >z=r4,<RCTRINC3_stack=[sp,#96]
add r4,sp,#96

# qhasm: RCTRINC3 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC3=reg128#9%bot->RCTRINC3=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC3=d16->RCTRINC3=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb3 += RCTRINC3
# asm 1: vadd.i32 >bb3=reg128#4,<bb3=reg128#4,<RCTRINC3=reg128#9
# asm 2: vadd.i32 >bb3=q3,<bb3=q3,<RCTRINC3=q8
vadd.i32 q3,q3,q8

# qhasm: z = &RCTRINC4_stack
# asm 1: lea >z=int32#5,<RCTRINC4_stack=stack128#6
# asm 2: lea >z=r4,<RCTRINC4_stack=[sp,#112]
add r4,sp,#112

# qhasm: RCTRINC4 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC4=reg128#9%bot->RCTRINC4=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC4=d16->RCTRINC4=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb4 += RCTRINC4
# asm 1: vadd.i32 >bb4=reg128#5,<bb4=reg128#5,<RCTRINC4=reg128#9
# asm 2: vadd.i32 >bb4=q4,<bb4=q4,<RCTRINC4=q8
vadd.i32 q4,q4,q8

# qhasm: z = &RCTRINC5_stack
# asm 1: lea >z=int32#5,<RCTRINC5_stack=stack128#7
# asm 2: lea >z=r4,<RCTRINC5_stack=[sp,#128]
add r4,sp,#128

# qhasm: RCTRINC5 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC5=reg128#9%bot->RCTRINC5=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC5=d16->RCTRINC5=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb5 += RCTRINC5
# asm 1: vadd.i32 >bb5=reg128#6,<bb5=reg128#6,<RCTRINC5=reg128#9
# asm 2: vadd.i32 >bb5=q5,<bb5=q5,<RCTRINC5=q8
vadd.i32 q5,q5,q8

# qhasm: z = &RCTRINC6_stack
# asm 1: lea >z=int32#5,<RCTRINC6_stack=stack128#8
# asm 2: lea >z=r4,<RCTRINC6_stack=[sp,#144]
add r4,sp,#144

# qhasm: RCTRINC6 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC6=reg128#9%bot->RCTRINC6=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC6=d16->RCTRINC6=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb6 += RCTRINC6
# asm 1: vadd.i32 >bb6=reg128#7,<bb6=reg128#7,<RCTRINC6=reg128#9
# asm 2: vadd.i32 >bb6=q6,<bb6=q6,<RCTRINC6=q8
vadd.i32 q6,q6,q8

# qhasm: z = &RCTRINC7_stack
# asm 1: lea >z=int32#5,<RCTRINC7_stack=stack128#9
# asm 2: lea >z=r4,<RCTRINC7_stack=[sp,#160]
add r4,sp,#160

# qhasm: RCTRINC7 aligned= mem128[z]
# asm 1: vld1.8 {>RCTRINC7=reg128#9%bot->RCTRINC7=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>RCTRINC7=d16->RCTRINC7=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm: 4x bb7 += RCTRINC7
# asm 1: vadd.i32 >bb7=reg128#8,<bb7=reg128#8,<RCTRINC7=reg128#9
# asm 2: vadd.i32 >bb7=q7,<bb7=q7,<RCTRINC7=q8
vadd.i32 q7,q7,q8

# qhasm:   bb0 = bb0[0,2,1,3]
# asm 1: vtrn.32 <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vtrn.32 <bb0=d0,<bb0=d1
vtrn.32 d0,d1

# qhasm:   bb0 = bb0[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vtrn.8 <bb0=d0,<bb0=d1
vtrn.8 d0,d1

# qhasm:   bb0 = bb0[0,2,1,3]
# asm 1: vtrn.32 <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vtrn.32 <bb0=d0,<bb0=d1
vtrn.32 d0,d1

# qhasm:   bb0 = bb0[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vtrn.16 <bb0=d0,<bb0=d1
vtrn.16 d0,d1

# qhasm:   bb0 = bb0[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb0=reg128#1,<bb0=reg128#1
# asm 2: vrev64.i8 >bb0=q0,<bb0=q0
vrev64.i8 q0,q0

# qhasm:   bb0 = bb0[1,0]
# asm 1: vswp <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vswp <bb0=d0,<bb0=d1
vswp d0,d1

# qhasm:   bb1 = bb1[0,2,1,3]
# asm 1: vtrn.32 <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vtrn.32 <bb1=d2,<bb1=d3
vtrn.32 d2,d3

# qhasm:   bb1 = bb1[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vtrn.8 <bb1=d2,<bb1=d3
vtrn.8 d2,d3

# qhasm:   bb1 = bb1[0,2,1,3]
# asm 1: vtrn.32 <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vtrn.32 <bb1=d2,<bb1=d3
vtrn.32 d2,d3

# qhasm:   bb1 = bb1[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vtrn.16 <bb1=d2,<bb1=d3
vtrn.16 d2,d3

# qhasm:   bb1 = bb1[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb1=reg128#2,<bb1=reg128#2
# asm 2: vrev32.i8 >bb1=q1,<bb1=q1
vrev32.i8 q1,q1

# qhasm:   bb2 = bb2[0,2,1,3]
# asm 1: vtrn.32 <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vtrn.32 <bb2=d4,<bb2=d5
vtrn.32 d4,d5

# qhasm:   bb2 = bb2[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vtrn.8 <bb2=d4,<bb2=d5
vtrn.8 d4,d5

# qhasm:   bb2 = bb2[0,2,1,3]
# asm 1: vtrn.32 <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vtrn.32 <bb2=d4,<bb2=d5
vtrn.32 d4,d5

# qhasm:   bb2 = bb2[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vtrn.16 <bb2=d4,<bb2=d5
vtrn.16 d4,d5

# qhasm:   bb2 = bb2[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb2=reg128#3,<bb2=reg128#3
# asm 2: vrev32.i8 >bb2=q2,<bb2=q2
vrev32.i8 q2,q2

# qhasm:   bb3 = bb3[0,2,1,3]
# asm 1: vtrn.32 <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vtrn.32 <bb3=d6,<bb3=d7
vtrn.32 d6,d7

# qhasm:   bb3 = bb3[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vtrn.8 <bb3=d6,<bb3=d7
vtrn.8 d6,d7

# qhasm:   bb3 = bb3[0,2,1,3]
# asm 1: vtrn.32 <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vtrn.32 <bb3=d6,<bb3=d7
vtrn.32 d6,d7

# qhasm:   bb3 = bb3[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vtrn.16 <bb3=d6,<bb3=d7
vtrn.16 d6,d7

# qhasm:   bb3 = bb3[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb3=reg128#4,<bb3=reg128#4
# asm 2: vrev32.i8 >bb3=q3,<bb3=q3
vrev32.i8 q3,q3

# qhasm:   bb4 = bb4[0,2,1,3]
# asm 1: vtrn.32 <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vtrn.32 <bb4=d8,<bb4=d9
vtrn.32 d8,d9

# qhasm:   bb4 = bb4[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vtrn.8 <bb4=d8,<bb4=d9
vtrn.8 d8,d9

# qhasm:   bb4 = bb4[0,2,1,3]
# asm 1: vtrn.32 <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vtrn.32 <bb4=d8,<bb4=d9
vtrn.32 d8,d9

# qhasm:   bb4 = bb4[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vtrn.16 <bb4=d8,<bb4=d9
vtrn.16 d8,d9

# qhasm:   bb4 = bb4[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb4=reg128#5,<bb4=reg128#5
# asm 2: vrev32.i8 >bb4=q4,<bb4=q4
vrev32.i8 q4,q4

# qhasm:   bb5 = bb5[0,2,1,3]
# asm 1: vtrn.32 <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vtrn.32 <bb5=d10,<bb5=d11
vtrn.32 d10,d11

# qhasm:   bb5 = bb5[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vtrn.8 <bb5=d10,<bb5=d11
vtrn.8 d10,d11

# qhasm:   bb5 = bb5[0,2,1,3]
# asm 1: vtrn.32 <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vtrn.32 <bb5=d10,<bb5=d11
vtrn.32 d10,d11

# qhasm:   bb5 = bb5[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vtrn.16 <bb5=d10,<bb5=d11
vtrn.16 d10,d11

# qhasm:   bb5 = bb5[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb5=reg128#6,<bb5=reg128#6
# asm 2: vrev32.i8 >bb5=q5,<bb5=q5
vrev32.i8 q5,q5

# qhasm:   bb6 = bb6[0,2,1,3]
# asm 1: vtrn.32 <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vtrn.32 <bb6=d12,<bb6=d13
vtrn.32 d12,d13

# qhasm:   bb6 = bb6[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vtrn.8 <bb6=d12,<bb6=d13
vtrn.8 d12,d13

# qhasm:   bb6 = bb6[0,2,1,3]
# asm 1: vtrn.32 <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vtrn.32 <bb6=d12,<bb6=d13
vtrn.32 d12,d13

# qhasm:   bb6 = bb6[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vtrn.16 <bb6=d12,<bb6=d13
vtrn.16 d12,d13

# qhasm:   bb6 = bb6[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb6=reg128#7,<bb6=reg128#7
# asm 2: vrev32.i8 >bb6=q6,<bb6=q6
vrev32.i8 q6,q6

# qhasm:   bb7 = bb7[0,2,1,3]
# asm 1: vtrn.32 <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vtrn.32 <bb7=d14,<bb7=d15
vtrn.32 d14,d15

# qhasm:   bb7 = bb7[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vtrn.8 <bb7=d14,<bb7=d15
vtrn.8 d14,d15

# qhasm:   bb7 = bb7[0,2,1,3]
# asm 1: vtrn.32 <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vtrn.32 <bb7=d14,<bb7=d15
vtrn.32 d14,d15

# qhasm:   bb7 = bb7[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vtrn.16 <bb7=d14,<bb7=d15
vtrn.16 d14,d15

# qhasm:   bb7 = bb7[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
# asm 1: vrev32.i8 >bb7=reg128#8,<bb7=reg128#8
# asm 2: vrev32.i8 >bb7=q7,<bb7=q7
vrev32.i8 q7,q7

# qhasm:     u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
# asm 1: vmov.i8 >u=reg128#9,#0x55
# asm 2: vmov.i8 >u=q8,#0x55
vmov.i8 q8,#0x55

# qhasm:       2x t0 = bb6 unsigned>> 1
# asm 1: vshr.u64 >t0=reg128#10,<bb6=reg128#7,#1
# asm 2: vshr.u64 >t0=q9,<bb6=q6,#1
vshr.u64 q9,q6,#1

# qhasm:       2x t2 = bb4 unsigned>> 1
# asm 1: vshr.u64 >t2=reg128#11,<bb4=reg128#5,#1
# asm 2: vshr.u64 >t2=q10,<bb4=q4,#1
vshr.u64 q10,q4,#1

# qhasm:       2x t4 = bb2 unsigned>> 1
# asm 1: vshr.u64 >t4=reg128#12,<bb2=reg128#3,#1
# asm 2: vshr.u64 >t4=q11,<bb2=q2,#1
vshr.u64 q11,q2,#1

# qhasm:       2x t6 = bb0 unsigned>> 1
# asm 1: vshr.u64 >t6=reg128#13,<bb0=reg128#1,#1
# asm 2: vshr.u64 >t6=q12,<bb0=q0,#1
vshr.u64 q12,q0,#1

# qhasm:       t0 ^= bb7
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<bb7=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<bb7=q7
veor q9,q9,q7

# qhasm:       t2 ^= bb5
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<bb5=reg128#6
# asm 2: veor >t2=q10,<t2=q10,<bb5=q5
veor q10,q10,q5

# qhasm:       t4 ^= bb3
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<bb3=reg128#4
# asm 2: veor >t4=q11,<t4=q11,<bb3=q3
veor q11,q11,q3

# qhasm:       t6 ^= bb1
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<bb1=reg128#2
# asm 2: veor >t6=q12,<t6=q12,<bb1=q1
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

# qhasm:       bb7 ^= t0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<t0=reg128#10
# asm 2: veor >bb7=q7,<bb7=q7,<t0=q9
veor q7,q7,q9

# qhasm:       bb5 ^= t2
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<t2=reg128#11
# asm 2: veor >bb5=q5,<bb5=q5,<t2=q10
veor q5,q5,q10

# qhasm:       bb3 ^= t4
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<t4=reg128#12
# asm 2: veor >bb3=q3,<bb3=q3,<t4=q11
veor q3,q3,q11

# qhasm:       bb1 ^= t6
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<t6=reg128#9
# asm 2: veor >bb1=q1,<bb1=q1,<t6=q8
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

# qhasm:       bb6 ^= t0
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<t0=reg128#10
# asm 2: veor >bb6=q6,<bb6=q6,<t0=q9
veor q6,q6,q9

# qhasm:       bb4 ^= t2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<t2=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<t2=q10
veor q4,q4,q10

# qhasm:       bb2 ^= t4
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<t4=reg128#12
# asm 2: veor >bb2=q2,<bb2=q2,<t4=q11
veor q2,q2,q11

# qhasm:       bb0 ^= t6
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<t6=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<t6=q8
veor q0,q0,q8

# qhasm:     u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33
# asm 1: vmov.i8 >u=reg128#9,#0x33
# asm 2: vmov.i8 >u=q8,#0x33
vmov.i8 q8,#0x33

# qhasm:       2x t0 = bb5 unsigned>> 2
# asm 1: vshr.u64 >t0=reg128#10,<bb5=reg128#6,#2
# asm 2: vshr.u64 >t0=q9,<bb5=q5,#2
vshr.u64 q9,q5,#2

# qhasm:       2x t2 = bb4 unsigned>> 2
# asm 1: vshr.u64 >t2=reg128#11,<bb4=reg128#5,#2
# asm 2: vshr.u64 >t2=q10,<bb4=q4,#2
vshr.u64 q10,q4,#2

# qhasm:       2x t4 = bb1 unsigned>> 2
# asm 1: vshr.u64 >t4=reg128#12,<bb1=reg128#2,#2
# asm 2: vshr.u64 >t4=q11,<bb1=q1,#2
vshr.u64 q11,q1,#2

# qhasm:       2x t6 = bb0 unsigned>> 2
# asm 1: vshr.u64 >t6=reg128#13,<bb0=reg128#1,#2
# asm 2: vshr.u64 >t6=q12,<bb0=q0,#2
vshr.u64 q12,q0,#2

# qhasm:       t0 ^= bb7
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<bb7=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<bb7=q7
veor q9,q9,q7

# qhasm:       t2 ^= bb6
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<bb6=reg128#7
# asm 2: veor >t2=q10,<t2=q10,<bb6=q6
veor q10,q10,q6

# qhasm:       t4 ^= bb3
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<bb3=reg128#4
# asm 2: veor >t4=q11,<t4=q11,<bb3=q3
veor q11,q11,q3

# qhasm:       t6 ^= bb2
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<bb2=reg128#3
# asm 2: veor >t6=q12,<t6=q12,<bb2=q2
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

# qhasm:       bb7 ^= t0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<t0=reg128#10
# asm 2: veor >bb7=q7,<bb7=q7,<t0=q9
veor q7,q7,q9

# qhasm:       bb6 ^= t2
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<t2=reg128#11
# asm 2: veor >bb6=q6,<bb6=q6,<t2=q10
veor q6,q6,q10

# qhasm:       bb3 ^= t4
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<t4=reg128#12
# asm 2: veor >bb3=q3,<bb3=q3,<t4=q11
veor q3,q3,q11

# qhasm:       bb2 ^= t6
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<t6=reg128#9
# asm 2: veor >bb2=q2,<bb2=q2,<t6=q8
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

# qhasm:       bb5 ^= t0
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<t0=reg128#10
# asm 2: veor >bb5=q5,<bb5=q5,<t0=q9
veor q5,q5,q9

# qhasm:       bb4 ^= t2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<t2=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<t2=q10
veor q4,q4,q10

# qhasm:       bb1 ^= t4
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<t4=reg128#12
# asm 2: veor >bb1=q1,<bb1=q1,<t4=q11
veor q1,q1,q11

# qhasm:       bb0 ^= t6
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<t6=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<t6=q8
veor q0,q0,q8

# qhasm:     u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
# asm 1: vmov.i8 >u=reg128#9,#0x0f
# asm 2: vmov.i8 >u=q8,#0x0f
vmov.i8 q8,#0x0f

# qhasm:       2x t0 = bb3 unsigned>> 4
# asm 1: vshr.u64 >t0=reg128#10,<bb3=reg128#4,#4
# asm 2: vshr.u64 >t0=q9,<bb3=q3,#4
vshr.u64 q9,q3,#4

# qhasm:       2x t2 = bb2 unsigned>> 4
# asm 1: vshr.u64 >t2=reg128#11,<bb2=reg128#3,#4
# asm 2: vshr.u64 >t2=q10,<bb2=q2,#4
vshr.u64 q10,q2,#4

# qhasm:       2x t4 = bb1 unsigned>> 4
# asm 1: vshr.u64 >t4=reg128#12,<bb1=reg128#2,#4
# asm 2: vshr.u64 >t4=q11,<bb1=q1,#4
vshr.u64 q11,q1,#4

# qhasm:       2x t6 = bb0 unsigned>> 4
# asm 1: vshr.u64 >t6=reg128#13,<bb0=reg128#1,#4
# asm 2: vshr.u64 >t6=q12,<bb0=q0,#4
vshr.u64 q12,q0,#4

# qhasm:       t0 ^= bb7
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<bb7=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<bb7=q7
veor q9,q9,q7

# qhasm:       t2 ^= bb6
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<bb6=reg128#7
# asm 2: veor >t2=q10,<t2=q10,<bb6=q6
veor q10,q10,q6

# qhasm:       t4 ^= bb5
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<bb5=reg128#6
# asm 2: veor >t4=q11,<t4=q11,<bb5=q5
veor q11,q11,q5

# qhasm:       t6 ^= bb4
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<bb4=reg128#5
# asm 2: veor >t6=q12,<t6=q12,<bb4=q4
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

# qhasm:       bb7 ^= t0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<t0=reg128#10
# asm 2: veor >bb7=q7,<bb7=q7,<t0=q9
veor q7,q7,q9

# qhasm:       bb6 ^= t2
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<t2=reg128#11
# asm 2: veor >bb6=q6,<bb6=q6,<t2=q10
veor q6,q6,q10

# qhasm:       bb5 ^= t4
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<t4=reg128#12
# asm 2: veor >bb5=q5,<bb5=q5,<t4=q11
veor q5,q5,q11

# qhasm:       bb4 ^= t6
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<t6=reg128#9
# asm 2: veor >bb4=q4,<bb4=q4,<t6=q8
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

# qhasm:       bb3 ^= t0
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<t0=reg128#10
# asm 2: veor >bb3=q3,<bb3=q3,<t0=q9
veor q3,q3,q9

# qhasm:       bb2 ^= t2
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<t2=reg128#11
# asm 2: veor >bb2=q2,<bb2=q2,<t2=q10
veor q2,q2,q10

# qhasm:       bb1 ^= t4
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<t4=reg128#12
# asm 2: veor >bb1=q1,<bb1=q1,<t4=q11
veor q1,q1,q11

# qhasm:       bb0 ^= t6
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<t6=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<t6=q8
veor q0,q0,q8

# qhasm:     bb8 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb8=reg128#9%bot->bb8=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb8=d16->bb8=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb9=reg128#10%bot->bb9=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb9=d18->bb9=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb10 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb10=reg128#11%bot->bb10=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb10=d20->bb10=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb11 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb11=reg128#12%bot->bb11=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb11=d22->bb11=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb12 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb12=reg128#13%bot->bb12=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb12=d24->bb12=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb13 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb13=reg128#14%bot->bb13=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb13=d26->bb13=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb14 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb14=reg128#15%bot->bb14=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb14=d28->bb14=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb15 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb15=reg128#16%bot->bb15=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb15=d30->bb15=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb2 ^= bb10
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb10=reg128#11
# asm 2: veor >bb2=q2,<bb2=q2,<bb10=q10
veor q2,q2,q10

# qhasm:     bb5 ^= bb13
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb13=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb13=q13
veor q5,q5,q13

# qhasm:       bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb1=reg128#2%bot,{<bb1=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb1=d2,{<bb1=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb1=reg128#2%top,{<bb1=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb1=d3,{<bb1=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb3 ^= bb11
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb11=reg128#12
# asm 2: veor >bb3=q3,<bb3=q3,<bb11=q11
veor q3,q3,q11

# qhasm:       bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb2=reg128#3%bot,{<bb2=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb2=d4,{<bb2=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb2=reg128#3%top,{<bb2=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb2=d5,{<bb2=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb6 ^= bb14
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb14=reg128#15
# asm 2: veor >bb6=q6,<bb6=q6,<bb14=q14
veor q6,q6,q14

# qhasm:     bb7 ^= bb15
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb15=reg128#16
# asm 2: veor >bb7=q7,<bb7=q7,<bb15=q15
veor q7,q7,q15

# qhasm:       bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb5=reg128#6%bot,{<bb5=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb5=d10,{<bb5=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb5=reg128#6%top,{<bb5=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb5=d11,{<bb5=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb4 ^= bb12
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb12=reg128#13
# asm 2: veor >bb4=q4,<bb4=q4,<bb12=q12
veor q4,q4,q12

# qhasm:       bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb0=reg128#1%bot,{<bb0=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb0=d0,{<bb0=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb0=reg128#1%top,{<bb0=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb0=d1,{<bb0=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb2 ^= bb1
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb1=reg128#2
# asm 2: veor >bb2=q2,<bb2=q2,<bb1=q1
veor q2,q2,q1

# qhasm:       bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb3=reg128#4%bot,{<bb3=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb3=d6,{<bb3=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb3=reg128#4%top,{<bb3=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb3=d7,{<bb3=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb5 ^= bb0
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb0=reg128#1
# asm 2: veor >bb5=q5,<bb5=q5,<bb0=q0
veor q5,q5,q0

# qhasm:       bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb6=reg128#7%bot,{<bb6=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb6=d12,{<bb6=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb6=reg128#7%top,{<bb6=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb6=d13,{<bb6=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb3 ^= bb0
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb0=reg128#1
# asm 2: veor >bb3=q3,<bb3=q3,<bb0=q0
veor q3,q3,q0

# qhasm:       bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb7=reg128#8%bot,{<bb7=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb7=d14,{<bb7=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb7=reg128#8%top,{<bb7=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb7=d15,{<bb7=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb5 ^= bb6
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb6=reg128#7
# asm 2: veor >bb5=q5,<bb5=q5,<bb6=q6
veor q5,q5,q6

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb3=reg128#4
# asm 2: veor >bb6=q6,<bb6=q6,<bb3=q3
veor q6,q6,q3

# qhasm:     bb3 ^= bb7
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb7=reg128#8
# asm 2: veor >bb3=q3,<bb3=q3,<bb7=q7
veor q3,q3,q7

# qhasm:       bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb4=reg128#5%bot,{<bb4=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb4=d8,{<bb4=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb4=reg128#5%top,{<bb4=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb4=d9,{<bb4=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb6 ^= bb2
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb2=reg128#3
# asm 2: veor >bb6=q6,<bb6=q6,<bb2=q2
veor q6,q6,q2

# qhasm:     bb7 ^= bb5
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb5=reg128#6
# asm 2: veor >bb7=q7,<bb7=q7,<bb5=q5
veor q7,q7,q5

# qhasm:     bb3 ^= bb4
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb4=reg128#5
# asm 2: veor >bb3=q3,<bb3=q3,<bb4=q4
veor q3,q3,q4

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb5=reg128#6
# asm 2: veor >bb4=q4,<bb4=q4,<bb5=q5
veor q4,q4,q5

# qhasm:     bb3 ^= bb1
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb1=reg128#2
# asm 2: veor >bb3=q3,<bb3=q3,<bb1=q1
veor q3,q3,q1

# qhasm:     bb2 ^= bb7
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb7=reg128#8
# asm 2: veor >bb2=q2,<bb2=q2,<bb7=q7
veor q2,q2,q7

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:       bb11 = bb7 ^ bb4
# asm 1: veor >bb11=reg128#9,<bb7=reg128#8,<bb4=reg128#5
# asm 2: veor >bb11=q8,<bb7=q7,<bb4=q4
veor q8,q7,q4

# qhasm:       bb10 = bb1 ^ bb2
# asm 1: veor >bb10=reg128#10,<bb1=reg128#2,<bb2=reg128#3
# asm 2: veor >bb10=q9,<bb1=q1,<bb2=q2
veor q9,q1,q2

# qhasm:       bb9 = bb5 ^ bb3
# asm 1: veor >bb9=reg128#11,<bb5=reg128#6,<bb3=reg128#4
# asm 2: veor >bb9=q10,<bb5=q5,<bb3=q3
veor q10,q5,q3

# qhasm:       bb13 = bb2 ^ bb4
# asm 1: veor >bb13=reg128#12,<bb2=reg128#3,<bb4=reg128#5
# asm 2: veor >bb13=q11,<bb2=q2,<bb4=q4
veor q11,q2,q4

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb6=q6,<bb0=q0
veor q12,q6,q0

# qhasm:       bb8 = bb10 & bb9
# asm 1: vand >bb8=reg128#14,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vand >bb8=q13,<bb10=q9,<bb9=q10
vand q13,q9,q10

# qhasm:       bb14 = bb11 & bb12
# asm 1: vand >bb14=reg128#15,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vand >bb14=q14,<bb11=q8,<bb12=q12
vand q14,q8,q12

# qhasm:       bb15 = bb11 ^ bb10
# asm 1: veor >bb15=reg128#16,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb15=q15,<bb11=q8,<bb10=q9
veor q15,q8,q9

# qhasm:       bb11 |= bb12
# asm 1: vorr >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vorr >bb11=q8,<bb11=q8,<bb12=q12
vorr q8,q8,q12

# qhasm:       bb12 ^= bb9
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb9=reg128#11
# asm 2: veor >bb12=q12,<bb12=q12,<bb9=q10
veor q12,q12,q10

# qhasm:       bb10 |= bb9
# asm 1: vorr >bb10=reg128#10,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vorr >bb10=q9,<bb10=q9,<bb9=q10
vorr q9,q9,q10

# qhasm:       bb15 &= bb12
# asm 1: vand >bb15=reg128#11,<bb15=reg128#16,<bb12=reg128#13
# asm 2: vand >bb15=q10,<bb15=q15,<bb12=q12
vand q10,q15,q12

# qhasm:       bb12 = bb3 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb3=reg128#4,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb3=q3,<bb0=q0
veor q12,q3,q0

# qhasm:       bb11 ^= bb15
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb15=reg128#11
# asm 2: veor >bb11=q8,<bb11=q8,<bb15=q10
veor q8,q8,q10

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb10 ^= bb14
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb14=reg128#15
# asm 2: veor >bb10=q9,<bb10=q9,<bb14=q14
veor q9,q9,q14

# qhasm:       bb11 ^= bb13
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb13=reg128#12
# asm 2: veor >bb11=q8,<bb11=q8,<bb13=q11
veor q8,q8,q11

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#12
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q11
veor q9,q9,q11

# qhasm:       bb13 = bb7 ^ bb1
# asm 1: veor >bb13=reg128#12,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb13=q11,<bb7=q7,<bb1=q1
veor q11,q7,q1

# qhasm:       bb12 = bb5 ^ bb6
# asm 1: veor >bb12=reg128#13,<bb5=reg128#6,<bb6=reg128#7
# asm 2: veor >bb12=q12,<bb5=q5,<bb6=q6
veor q12,q5,q6

# qhasm:       bb8 ^= bb14
# asm 1: veor >bb8=reg128#14,<bb8=reg128#14,<bb14=reg128#15
# asm 2: veor >bb8=q13,<bb8=q13,<bb14=q14
veor q13,q13,q14

# qhasm:       bb9 = bb13 | bb12
# asm 1: vorr >bb9=reg128#16,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vorr >bb9=q15,<bb13=q11,<bb12=q12
vorr q15,q11,q12

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb9 ^= bb15
# asm 1: veor >bb9=reg128#11,<bb9=reg128#16,<bb15=reg128#11
# asm 2: veor >bb9=q10,<bb9=q15,<bb15=q10
veor q10,q15,q10

# qhasm:       bb8 ^= bb13
# asm 1: veor >bb8=reg128#12,<bb8=reg128#14,<bb13=reg128#12
# asm 2: veor >bb8=q11,<bb8=q13,<bb13=q11
veor q11,q13,q11

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#15
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q14
veor q10,q10,q14

# qhasm:       bb12 = bb2 & bb3
# asm 1: vand >bb12=reg128#13,<bb2=reg128#3,<bb3=reg128#4
# asm 2: vand >bb12=q12,<bb2=q2,<bb3=q3
vand q12,q2,q3

# qhasm:       bb13 = bb4 & bb0
# asm 1: vand >bb13=reg128#14,<bb4=reg128#5,<bb0=reg128#1
# asm 2: vand >bb13=q13,<bb4=q4,<bb0=q0
vand q13,q4,q0

# qhasm:       bb11 ^= bb12
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: veor >bb11=q8,<bb11=q8,<bb12=q12
veor q8,q8,q12

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#14
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q13
veor q9,q9,q13

# qhasm:       bb14 = bb1 & bb5
# asm 1: vand >bb14=reg128#13,<bb1=reg128#2,<bb5=reg128#6
# asm 2: vand >bb14=q12,<bb1=q1,<bb5=q5
vand q12,q1,q5

# qhasm:       bb12 = bb11 ^ bb10
# asm 1: veor >bb12=reg128#14,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb12=q13,<bb11=q8,<bb10=q9
veor q13,q8,q9

# qhasm:       bb15 = bb7 | bb6
# asm 1: vorr >bb15=reg128#15,<bb7=reg128#8,<bb6=reg128#7
# asm 2: vorr >bb15=q14,<bb7=q7,<bb6=q6
vorr q14,q7,q6

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#13
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q12
veor q10,q10,q12

# qhasm:       bb8 ^= bb15
# asm 1: veor >bb8=reg128#12,<bb8=reg128#12,<bb15=reg128#15
# asm 2: veor >bb8=q11,<bb8=q11,<bb15=q14
veor q11,q11,q14

# qhasm:       bb11 &= bb9
# asm 1: vand >bb11=reg128#9,<bb11=reg128#9,<bb9=reg128#11
# asm 2: vand >bb11=q8,<bb11=q8,<bb9=q10
vand q8,q8,q10

# qhasm:       bb13 = bb9 ^ bb8
# asm 1: veor >bb13=reg128#13,<bb9=reg128#11,<bb8=reg128#12
# asm 2: veor >bb13=q12,<bb9=q10,<bb8=q11
veor q12,q10,q11

# qhasm:       bb14 = bb8 ^ bb11
# asm 1: veor >bb14=reg128#15,<bb8=reg128#12,<bb11=reg128#9
# asm 2: veor >bb14=q14,<bb8=q11,<bb11=q8
veor q14,q11,q8

# qhasm:       bb11 ^= bb10
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb11=q8,<bb11=q8,<bb10=q9
veor q8,q8,q9

# qhasm:       bb15 = bb12 & bb14
# asm 1: vand >bb15=reg128#16,<bb12=reg128#14,<bb14=reg128#15
# asm 2: vand >bb15=q15,<bb12=q13,<bb14=q14
vand q15,q13,q14

# qhasm:       bb13 &= bb11
# asm 1: vand >bb13=reg128#9,<bb13=reg128#13,<bb11=reg128#9
# asm 2: vand >bb13=q8,<bb13=q12,<bb11=q8
vand q8,q12,q8

# qhasm:       bb15 ^= bb10
# asm 1: veor >bb15=reg128#10,<bb15=reg128#16,<bb10=reg128#10
# asm 2: veor >bb15=q9,<bb15=q15,<bb10=q9
veor q9,q15,q9

# qhasm:       bb13 ^= bb8
# asm 1: veor >bb13=reg128#9,<bb13=reg128#9,<bb8=reg128#12
# asm 2: veor >bb13=q8,<bb13=q8,<bb8=q11
veor q8,q8,q11

# qhasm:       bb10 = bb14 ^ bb13
# asm 1: veor >bb10=reg128#13,<bb14=reg128#15,<bb13=reg128#9
# asm 2: veor >bb10=q12,<bb14=q14,<bb13=q8
veor q12,q14,q8

# qhasm:       bb9 ^= bb13
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb13=reg128#9
# asm 2: veor >bb9=q10,<bb9=q10,<bb13=q8
veor q10,q10,q8

# qhasm:       bb10 &= bb8
# asm 1: vand >bb10=reg128#12,<bb10=reg128#13,<bb8=reg128#12
# asm 2: vand >bb10=q11,<bb10=q12,<bb8=q11
vand q11,q12,q11

# qhasm:       bb8 = bb5 ^ bb3
# asm 1: veor >bb8=reg128#13,<bb5=reg128#6,<bb3=reg128#4
# asm 2: veor >bb8=q12,<bb5=q5,<bb3=q3
veor q12,q5,q3

# qhasm:       bb14 ^= bb10
# asm 1: veor >bb14=reg128#15,<bb14=reg128#15,<bb10=reg128#12
# asm 2: veor >bb14=q14,<bb14=q14,<bb10=q11
veor q14,q14,q11

# qhasm:       bb9 ^= bb10
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb10=reg128#12
# asm 2: veor >bb9=q10,<bb9=q10,<bb10=q11
veor q10,q10,q11

# qhasm:       bb14 &= bb15
# asm 1: vand >bb14=reg128#12,<bb14=reg128#15,<bb15=reg128#10
# asm 2: vand >bb14=q11,<bb14=q14,<bb15=q9
vand q11,q14,q9

# qhasm:       bb14 ^= bb12
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb12=reg128#14
# asm 2: veor >bb14=q11,<bb14=q11,<bb12=q13
veor q11,q11,q13

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#14,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb12=q13,<bb6=q6,<bb0=q0
veor q13,q6,q0

# qhasm:       bb10 = bb15 ^ bb14
# asm 1: veor >bb10=reg128#15,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb10=q14,<bb15=q9,<bb14=q11
veor q14,q9,q11

# qhasm:       bb10 &= bb6
# asm 1: vand >bb10=reg128#15,<bb10=reg128#15,<bb6=reg128#7
# asm 2: vand >bb10=q14,<bb10=q14,<bb6=q6
vand q14,q14,q6

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb5=reg128#6
# asm 2: veor >bb6=q6,<bb6=q6,<bb5=q5
veor q6,q6,q5

# qhasm:       bb5 &= bb15
# asm 1: vand >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#10
# asm 2: vand >bb5=q5,<bb5=q5,<bb15=q9
vand q5,q5,q9

# qhasm:       bb6 &= bb14
# asm 1: vand >bb6=reg128#7,<bb6=reg128#7,<bb14=reg128#12
# asm 2: vand >bb6=q6,<bb6=q6,<bb14=q11
vand q6,q6,q11

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q11,<bb14=q11,<bb9=q10
veor q11,q11,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#10,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q9,<bb15=q9,<bb13=q8
veor q9,q9,q8

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb5=reg128#6
# asm 2: veor >bb6=q6,<bb6=q6,<bb5=q5
veor q6,q6,q5

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#16,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q15,<bb15=q9,<bb14=q11
veor q15,q9,q11

# qhasm:       bb5 ^= bb10
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb10=reg128#15
# asm 2: veor >bb5=q5,<bb5=q5,<bb10=q14
veor q5,q5,q14

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#15,<bb11=reg128#16,<bb12=reg128#14
# asm 2: vand >bb11=q14,<bb11=q15,<bb12=q13
vand q14,q15,q13

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb8=reg128#13
# asm 2: veor >bb12=q13,<bb12=q13,<bb8=q12
veor q13,q13,q12

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#13,<bb8=reg128#13,<bb15=reg128#10
# asm 2: vand >bb8=q12,<bb8=q12,<bb15=q9
vand q12,q12,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#14,<bb12=reg128#14,<bb14=reg128#12
# asm 2: vand >bb12=q13,<bb12=q13,<bb14=q11
vand q13,q13,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#13,<bb8=reg128#13,<bb12=reg128#14
# asm 2: veor >bb8=q12,<bb8=q12,<bb12=q13
veor q12,q12,q13

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb11=reg128#15
# asm 2: veor >bb12=q13,<bb12=q13,<bb11=q14
veor q13,q13,q14

# qhasm:       bb10 &= bb0
# asm 1: vand >bb10=reg128#15,<bb10=reg128#16,<bb0=reg128#1
# asm 2: vand >bb10=q14,<bb10=q15,<bb0=q0
vand q14,q15,q0

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#4
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q3
veor q0,q0,q3

# qhasm:       bb3 &= bb13
# asm 1: vand >bb3=reg128#4,<bb3=reg128#4,<bb13=reg128#9
# asm 2: vand >bb3=q3,<bb3=q3,<bb13=q8
vand q3,q3,q8

# qhasm:       bb0 &= bb9
# asm 1: vand >bb0=reg128#1,<bb0=reg128#1,<bb9=reg128#11
# asm 2: vand >bb0=q0,<bb0=q0,<bb9=q10
vand q0,q0,q10

# qhasm:       bb6 ^= bb12
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb12=reg128#14
# asm 2: veor >bb6=q6,<bb6=q6,<bb12=q13
veor q6,q6,q13

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#4
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q3
veor q0,q0,q3

# qhasm:       bb3 ^= bb10
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb10=reg128#15
# asm 2: veor >bb3=q3,<bb3=q3,<bb10=q14
veor q3,q3,q14

# qhasm:       bb0 ^= bb12
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb12=reg128#14
# asm 2: veor >bb0=q0,<bb0=q0,<bb12=q13
veor q0,q0,q13

# qhasm:       bb5 ^= bb8
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb8=reg128#13
# asm 2: veor >bb5=q5,<bb5=q5,<bb8=q12
veor q5,q5,q12

# qhasm:       bb3 ^= bb8
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb8=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb8=q12
veor q3,q3,q12

# qhasm:       bb12 = bb7 ^ bb4
# asm 1: veor >bb12=reg128#13,<bb7=reg128#8,<bb4=reg128#5
# asm 2: veor >bb12=q12,<bb7=q7,<bb4=q4
veor q12,q7,q4

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#14,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q13,<bb15=q9,<bb14=q11
veor q13,q9,q11

# qhasm:       bb8 = bb1 ^ bb2
# asm 1: veor >bb8=reg128#15,<bb1=reg128#2,<bb2=reg128#3
# asm 2: veor >bb8=q14,<bb1=q1,<bb2=q2
veor q14,q1,q2

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#14,<bb11=reg128#14,<bb12=reg128#13
# asm 2: vand >bb11=q13,<bb11=q13,<bb12=q12
vand q13,q13,q12

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb8=reg128#15
# asm 2: veor >bb12=q12,<bb12=q12,<bb8=q14
veor q12,q12,q14

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#15,<bb8=reg128#15,<bb15=reg128#10
# asm 2: vand >bb8=q14,<bb8=q14,<bb15=q9
vand q14,q14,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#13,<bb12=reg128#13,<bb14=reg128#12
# asm 2: vand >bb12=q12,<bb12=q12,<bb14=q11
vand q12,q12,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#15,<bb8=reg128#15,<bb12=reg128#13
# asm 2: veor >bb8=q14,<bb8=q14,<bb12=q12
veor q14,q14,q12

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb11=reg128#14
# asm 2: veor >bb12=q12,<bb12=q12,<bb11=q13
veor q12,q12,q13

# qhasm:       bb10 &= bb4
# asm 1: vand >bb10=reg128#14,<bb10=reg128#16,<bb4=reg128#5
# asm 2: vand >bb10=q13,<bb10=q15,<bb4=q4
vand q13,q15,q4

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb2=reg128#3
# asm 2: veor >bb4=q4,<bb4=q4,<bb2=q2
veor q4,q4,q2

# qhasm:       bb2 &= bb13
# asm 1: vand >bb2=reg128#3,<bb2=reg128#3,<bb13=reg128#9
# asm 2: vand >bb2=q2,<bb2=q2,<bb13=q8
vand q2,q2,q8

# qhasm:       bb4 &= bb9
# asm 1: vand >bb4=reg128#5,<bb4=reg128#5,<bb9=reg128#11
# asm 2: vand >bb4=q4,<bb4=q4,<bb9=q10
vand q4,q4,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#9,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q8,<bb15=q9,<bb13=q8
veor q8,q9,q8

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#10,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q9,<bb14=q11,<bb9=q10
veor q9,q11,q10

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb2=reg128#3
# asm 2: veor >bb4=q4,<bb4=q4,<bb2=q2
veor q4,q4,q2

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#11,<bb15=reg128#9,<bb14=reg128#10
# asm 2: veor >bb11=q10,<bb15=q8,<bb14=q9
veor q10,q8,q9

# qhasm:       bb2 ^= bb10
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb10=reg128#14
# asm 2: veor >bb2=q2,<bb2=q2,<bb10=q13
veor q2,q2,q13

# qhasm:       bb11 &= bb7
# asm 1: vand >bb11=reg128#11,<bb11=reg128#11,<bb7=reg128#8
# asm 2: vand >bb11=q10,<bb11=q10,<bb7=q7
vand q10,q10,q7

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 &= bb15
# asm 1: vand >bb1=reg128#2,<bb1=reg128#2,<bb15=reg128#9
# asm 2: vand >bb1=q1,<bb1=q1,<bb15=q8
vand q1,q1,q8

# qhasm:       bb7 &= bb14
# asm 1: vand >bb7=reg128#8,<bb7=reg128#8,<bb14=reg128#10
# asm 2: vand >bb7=q7,<bb7=q7,<bb14=q9
vand q7,q7,q9

# qhasm:       bb4 ^= bb12
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb12=reg128#13
# asm 2: veor >bb4=q4,<bb4=q4,<bb12=q12
veor q4,q4,q12

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 ^= bb11
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb11=reg128#11
# asm 2: veor >bb1=q1,<bb1=q1,<bb11=q10
veor q1,q1,q10

# qhasm:       bb7 ^= bb12
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb12=reg128#13
# asm 2: veor >bb7=q7,<bb7=q7,<bb12=q12
veor q7,q7,q12

# qhasm:       bb1 ^= bb8
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb8=reg128#15
# asm 2: veor >bb1=q1,<bb1=q1,<bb8=q14
veor q1,q1,q14

# qhasm:       bb2 ^= bb8
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb8=reg128#15
# asm 2: veor >bb2=q2,<bb2=q2,<bb8=q14
veor q2,q2,q14

# qhasm:     bb7 ^= bb0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb0=reg128#1
# asm 2: veor >bb7=q7,<bb7=q7,<bb0=q0
veor q7,q7,q0

# qhasm:     bb1 ^= bb6
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb6=reg128#7
# asm 2: veor >bb1=q1,<bb1=q1,<bb6=q6
veor q1,q1,q6

# qhasm:     bb4 ^= bb7
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb7=reg128#8
# asm 2: veor >bb4=q4,<bb4=q4,<bb7=q7
veor q4,q4,q7

# qhasm:     bb6 ^= bb0
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb6=q6,<bb6=q6,<bb0=q0
veor q6,q6,q0

# qhasm:     bb0 ^= bb1
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb1=reg128#2
# asm 2: veor >bb0=q0,<bb0=q0,<bb1=q1
veor q0,q0,q1

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:     bb5 ^= bb2
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb2=reg128#3
# asm 2: veor >bb5=q5,<bb5=q5,<bb2=q2
veor q5,q5,q2

# qhasm:     bb2 ^= bb3
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb3=reg128#4
# asm 2: veor >bb2=q2,<bb2=q2,<bb3=q3
veor q2,q2,q3

# qhasm:     bb3 ^= bb5
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb5=reg128#6
# asm 2: veor >bb3=q3,<bb3=q3,<bb5=q5
veor q3,q3,q5

# qhasm:     bb8 = bb0[3]bb0[0,1,2]
# asm 1: vext.32 >bb8=reg128#9,<bb0=reg128#1,<bb0=reg128#1,#3
# asm 2: vext.32 >bb8=q8,<bb0=q0,<bb0=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb5=reg128#6
# asm 2: veor >bb4=q4,<bb4=q4,<bb5=q5
veor q4,q4,q5

# qhasm:     bb9 = bb1[3]bb1[0,1,2]
# asm 1: vext.32 >bb9=reg128#10,<bb1=reg128#2,<bb1=reg128#2,#3
# asm 2: vext.32 >bb9=q9,<bb1=q1,<bb1=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb3=reg128#4
# asm 2: veor >bb6=q6,<bb6=q6,<bb3=q3
veor q6,q6,q3

# qhasm:     bb10 = bb4[3]bb4[0,1,2]
# asm 1: vext.32 >bb10=reg128#11,<bb4=reg128#5,<bb4=reg128#5,#3
# asm 2: vext.32 >bb10=q10,<bb4=q4,<bb4=q4,#3
vext.32 q10,q4,q4,#3

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb11 = bb6[3]bb6[0,1,2]
# asm 1: vext.32 >bb11=reg128#12,<bb6=reg128#7,<bb6=reg128#7,#3
# asm 2: vext.32 >bb11=q11,<bb6=q6,<bb6=q6,#3
vext.32 q11,q6,q6,#3

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     bb12 = bb3[3]bb3[0,1,2]
# asm 1: vext.32 >bb12=reg128#13,<bb3=reg128#4,<bb3=reg128#4,#3
# asm 2: vext.32 >bb12=q12,<bb3=q3,<bb3=q3,#3
vext.32 q12,q3,q3,#3

# qhasm:     bb4 ^= bb10
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb10=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<bb10=q10
veor q4,q4,q10

# qhasm:     bb15 = bb5[3]bb5[0,1,2]
# asm 1: vext.32 >bb15=reg128#14,<bb5=reg128#6,<bb5=reg128#6,#3
# asm 2: vext.32 >bb15=q13,<bb5=q5,<bb5=q5,#3
vext.32 q13,q5,q5,#3

# qhasm:     bb6 ^= bb11
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb11=reg128#12
# asm 2: veor >bb6=q6,<bb6=q6,<bb11=q11
veor q6,q6,q11

# qhasm:     bb13 = bb7[3]bb7[0,1,2]
# asm 1: vext.32 >bb13=reg128#15,<bb7=reg128#8,<bb7=reg128#8,#3
# asm 2: vext.32 >bb13=q14,<bb7=q7,<bb7=q7,#3
vext.32 q14,q7,q7,#3

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb12=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb12=q12
veor q3,q3,q12

# qhasm:     bb14 = bb2[3]bb2[0,1,2]
# asm 1: vext.32 >bb14=reg128#16,<bb2=reg128#3,<bb2=reg128#3,#3
# asm 2: vext.32 >bb14=q15,<bb2=q2,<bb2=q2,#3
vext.32 q15,q2,q2,#3

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb15=q13
veor q5,q5,q13

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb13=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb13=q14
veor q7,q7,q14

# qhasm:     bb2 ^= bb14
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb14=reg128#16
# asm 2: veor >bb2=q2,<bb2=q2,<bb14=q15
veor q2,q2,q15

# qhasm:     bb9 ^= bb0
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb0=reg128#1
# asm 2: veor >bb9=q9,<bb9=q9,<bb0=q0
veor q9,q9,q0

# qhasm:     bb8 ^= bb5
# asm 1: veor >bb8=reg128#9,<bb8=reg128#9,<bb5=reg128#6
# asm 2: veor >bb8=q8,<bb8=q8,<bb5=q5
veor q8,q8,q5

# qhasm:     bb10 ^= bb1
# asm 1: veor >bb10=reg128#11,<bb10=reg128#11,<bb1=reg128#2
# asm 2: veor >bb10=q10,<bb10=q10,<bb1=q1
veor q10,q10,q1

# qhasm:     bb9 ^= bb5
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb5=reg128#6
# asm 2: veor >bb9=q9,<bb9=q9,<bb5=q5
veor q9,q9,q5

# qhasm:     bb0 = bb0[2,3]bb0[0,1]
# asm 1: vswp <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vswp <bb0=d0,<bb0=d1
vswp d0,d1

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb4=reg128#5
# asm 2: veor >bb11=q11,<bb11=q11,<bb4=q4
veor q11,q11,q4

# qhasm:     bb1 = bb1[2,3]bb1[0,1]
# asm 1: vswp <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vswp <bb1=d2,<bb1=d3
vswp d2,d3

# qhasm:     bb12 ^= bb6
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb6=reg128#7
# asm 2: veor >bb12=q12,<bb12=q12,<bb6=q6
veor q12,q12,q6

# qhasm:     bb4 = bb4[2,3]bb4[0,1]
# asm 1: vswp <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vswp <bb4=d8,<bb4=d9
vswp d8,d9

# qhasm:     bb13 ^= bb3
# asm 1: veor >bb13=reg128#15,<bb13=reg128#15,<bb3=reg128#4
# asm 2: veor >bb13=q14,<bb13=q14,<bb3=q3
veor q14,q14,q3

# qhasm:     bb6 = bb6[2,3]bb6[0,1]
# asm 1: vswp <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vswp <bb6=d12,<bb6=d13
vswp d12,d13

# qhasm:     bb11 ^= bb5
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb5=reg128#6
# asm 2: veor >bb11=q11,<bb11=q11,<bb5=q5
veor q11,q11,q5

# qhasm:     bb3 = bb3[2,3]bb3[0,1]
# asm 1: vswp <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vswp <bb3=d6,<bb3=d7
vswp d6,d7

# qhasm:     bb14 ^= bb7
# asm 1: veor >bb14=reg128#16,<bb14=reg128#16,<bb7=reg128#8
# asm 2: veor >bb14=q15,<bb14=q15,<bb7=q7
veor q15,q15,q7

# qhasm:     bb7 = bb7[2,3]bb7[0,1]
# asm 1: vswp <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vswp <bb7=d14,<bb7=d15
vswp d14,d15

# qhasm:     bb15 ^= bb2
# asm 1: veor >bb15=reg128#14,<bb15=reg128#14,<bb2=reg128#3
# asm 2: veor >bb15=q13,<bb15=q13,<bb2=q2
veor q13,q13,q2

# qhasm:     bb2 = bb2[2,3]bb2[0,1]
# asm 1: vswp <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vswp <bb2=d4,<bb2=d5
vswp d4,d5

# qhasm:     bb12 ^= bb5
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb5=reg128#6
# asm 2: veor >bb12=q12,<bb12=q12,<bb5=q5
veor q12,q12,q5

# qhasm:     bb5 = bb5[2,3]bb5[0,1]
# asm 1: vswp <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vswp <bb5=d10,<bb5=d11
vswp d10,d11

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#9,<bb0=reg128#1
# asm 2: veor >bb8=q0,<bb8=q8,<bb0=q0
veor q0,q8,q0

# qhasm:     bb0 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb0=reg128#9%bot->bb0=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb0=d16->bb0=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#10,<bb1=reg128#2
# asm 2: veor >bb9=q1,<bb9=q9,<bb1=q1
veor q1,q9,q1

# qhasm:     bb1 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb1=reg128#10%bot->bb1=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb1=d18->bb1=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb14 ^= bb2
# asm 1: veor >bb14=reg128#3,<bb14=reg128#16,<bb2=reg128#3
# asm 2: veor >bb14=q2,<bb14=q15,<bb2=q2
veor q2,q15,q2

# qhasm:     bb2 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb2=reg128#16%bot->bb2=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb2=d30->bb2=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb12 ^= bb3
# asm 1: veor >bb12=reg128#4,<bb12=reg128#13,<bb3=reg128#4
# asm 2: veor >bb12=q3,<bb12=q12,<bb3=q3
veor q3,q12,q3

# qhasm:     bb3 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb3=reg128#13%bot->bb3=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb3=d24->bb3=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb10 ^= bb4
# asm 1: veor >bb10=reg128#5,<bb10=reg128#11,<bb4=reg128#5
# asm 2: veor >bb10=q4,<bb10=q10,<bb4=q4
veor q4,q10,q4

# qhasm:     bb4 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb4=reg128#11%bot->bb4=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb4=d20->bb4=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#14,<bb5=reg128#6
# asm 2: veor >bb15=q5,<bb15=q13,<bb5=q5
veor q5,q13,q5

# qhasm:     bb5 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb5=reg128#14%bot->bb5=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb5=d26->bb5=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb11 ^= bb6
# asm 1: veor >bb11=reg128#7,<bb11=reg128#12,<bb6=reg128#7
# asm 2: veor >bb11=q6,<bb11=q11,<bb6=q6
veor q6,q11,q6

# qhasm:     bb6 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb6=reg128#12%bot->bb6=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb6=d22->bb6=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#15,<bb7=reg128#8
# asm 2: veor >bb13=q7,<bb13=q14,<bb7=q7
veor q7,q14,q7

# qhasm:     bb7 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb7=reg128#15%bot->bb7=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb7=d28->bb7=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb10 ^= bb2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb2=reg128#16
# asm 2: veor >bb10=q4,<bb10=q4,<bb2=q15
veor q4,q4,q15

# qhasm:     bb13 ^= bb5
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb5=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb5=q13
veor q7,q7,q13

# qhasm:       bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb9=reg128#2%bot,{<bb9=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb9=d2,{<bb9=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb9=reg128#2%top,{<bb9=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb9=d3,{<bb9=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb11 ^= bb3
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb3=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb3=q12
veor q6,q6,q12

# qhasm:       bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb10=reg128#5%bot,{<bb10=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb10=d8,{<bb10=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb10=reg128#5%top,{<bb10=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb10=d9,{<bb10=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb14 ^= bb6
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb6=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<bb6=q11
veor q2,q2,q11

# qhasm:     bb15 ^= bb7
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb7=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb7=q14
veor q5,q5,q14

# qhasm:       bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb13=reg128#8%bot,{<bb13=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb13=d14,{<bb13=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb13=reg128#8%top,{<bb13=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb13=d15,{<bb13=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb12 ^= bb4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb4=reg128#11
# asm 2: veor >bb12=q3,<bb12=q3,<bb4=q10
veor q3,q3,q10

# qhasm:       bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb8=reg128#1%bot,{<bb8=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb8=d0,{<bb8=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb8=reg128#1%top,{<bb8=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb8=d1,{<bb8=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb10 ^= bb9
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb9=reg128#2
# asm 2: veor >bb10=q4,<bb10=q4,<bb9=q1
veor q4,q4,q1

# qhasm:       bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb11=reg128#7%bot,{<bb11=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb11=d12,{<bb11=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb11=reg128#7%top,{<bb11=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb11=d13,{<bb11=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb13 ^= bb8
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb8=reg128#1
# asm 2: veor >bb13=q7,<bb13=q7,<bb8=q0
veor q7,q7,q0

# qhasm:       bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb14=reg128#3%bot,{<bb14=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb14=d4,{<bb14=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb14=reg128#3%top,{<bb14=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb14=d5,{<bb14=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb11 ^= bb8
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb8=reg128#1
# asm 2: veor >bb11=q6,<bb11=q6,<bb8=q0
veor q6,q6,q0

# qhasm:       bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb15=reg128#6%bot,{<bb15=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb15=d10,{<bb15=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb15=reg128#6%top,{<bb15=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb15=d11,{<bb15=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb13 ^= bb14
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb14=reg128#3
# asm 2: veor >bb13=q7,<bb13=q7,<bb14=q2
veor q7,q7,q2

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb11=reg128#7
# asm 2: veor >bb14=q2,<bb14=q2,<bb11=q6
veor q2,q2,q6

# qhasm:     bb11 ^= bb15
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb15=reg128#6
# asm 2: veor >bb11=q6,<bb11=q6,<bb15=q5
veor q6,q6,q5

# qhasm:       bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb12=reg128#4%bot,{<bb12=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb12=d6,{<bb12=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb12=reg128#4%top,{<bb12=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb12=d7,{<bb12=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb14 ^= bb10
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb10=reg128#5
# asm 2: veor >bb14=q2,<bb14=q2,<bb10=q4
veor q2,q2,q4

# qhasm:     bb15 ^= bb13
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb13=reg128#8
# asm 2: veor >bb15=q5,<bb15=q5,<bb13=q7
veor q5,q5,q7

# qhasm:     bb11 ^= bb12
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb12=reg128#4
# asm 2: veor >bb11=q6,<bb11=q6,<bb12=q3
veor q6,q6,q3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb13=reg128#8
# asm 2: veor >bb12=q3,<bb12=q3,<bb13=q7
veor q3,q3,q7

# qhasm:     bb11 ^= bb9
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb9=reg128#2
# asm 2: veor >bb11=q6,<bb11=q6,<bb9=q1
veor q6,q6,q1

# qhasm:     bb10 ^= bb15
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb15=reg128#6
# asm 2: veor >bb10=q4,<bb10=q4,<bb15=q5
veor q4,q4,q5

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:       bb3 = bb15 ^ bb12
# asm 1: veor >bb3=reg128#9,<bb15=reg128#6,<bb12=reg128#4
# asm 2: veor >bb3=q8,<bb15=q5,<bb12=q3
veor q8,q5,q3

# qhasm:       bb2 = bb9 ^ bb10
# asm 1: veor >bb2=reg128#10,<bb9=reg128#2,<bb10=reg128#5
# asm 2: veor >bb2=q9,<bb9=q1,<bb10=q4
veor q9,q1,q4

# qhasm:       bb1 = bb13 ^ bb11
# asm 1: veor >bb1=reg128#11,<bb13=reg128#8,<bb11=reg128#7
# asm 2: veor >bb1=q10,<bb13=q7,<bb11=q6
veor q10,q7,q6

# qhasm:       bb5 = bb10 ^ bb12
# asm 1: veor >bb5=reg128#12,<bb10=reg128#5,<bb12=reg128#4
# asm 2: veor >bb5=q11,<bb10=q4,<bb12=q3
veor q11,q4,q3

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb14=q2,<bb8=q0
veor q12,q2,q0

# qhasm:       bb0 = bb2 & bb1
# asm 1: vand >bb0=reg128#14,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vand >bb0=q13,<bb2=q9,<bb1=q10
vand q13,q9,q10

# qhasm:       bb6 = bb3 & bb4
# asm 1: vand >bb6=reg128#15,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vand >bb6=q14,<bb3=q8,<bb4=q12
vand q14,q8,q12

# qhasm:       bb7 = bb3 ^ bb2
# asm 1: veor >bb7=reg128#16,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb7=q15,<bb3=q8,<bb2=q9
veor q15,q8,q9

# qhasm:       bb3 |= bb4
# asm 1: vorr >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vorr >bb3=q8,<bb3=q8,<bb4=q12
vorr q8,q8,q12

# qhasm:       bb4 ^= bb1
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb1=reg128#11
# asm 2: veor >bb4=q12,<bb4=q12,<bb1=q10
veor q12,q12,q10

# qhasm:       bb2 |= bb1
# asm 1: vorr >bb2=reg128#10,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vorr >bb2=q9,<bb2=q9,<bb1=q10
vorr q9,q9,q10

# qhasm:       bb7 &= bb4
# asm 1: vand >bb7=reg128#11,<bb7=reg128#16,<bb4=reg128#13
# asm 2: vand >bb7=q10,<bb7=q15,<bb4=q12
vand q10,q15,q12

# qhasm:       bb4 = bb11 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb11=reg128#7,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb11=q6,<bb8=q0
veor q12,q6,q0

# qhasm:       bb3 ^= bb7
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb7=reg128#11
# asm 2: veor >bb3=q8,<bb3=q8,<bb7=q10
veor q8,q8,q10

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb2 ^= bb6
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb6=reg128#15
# asm 2: veor >bb2=q9,<bb2=q9,<bb6=q14
veor q9,q9,q14

# qhasm:       bb3 ^= bb5
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb5=reg128#12
# asm 2: veor >bb3=q8,<bb3=q8,<bb5=q11
veor q8,q8,q11

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#12
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q11
veor q9,q9,q11

# qhasm:       bb5 = bb15 ^ bb9
# asm 1: veor >bb5=reg128#12,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb5=q11,<bb15=q5,<bb9=q1
veor q11,q5,q1

# qhasm:       bb4 = bb13 ^ bb14
# asm 1: veor >bb4=reg128#13,<bb13=reg128#8,<bb14=reg128#3
# asm 2: veor >bb4=q12,<bb13=q7,<bb14=q2
veor q12,q7,q2

# qhasm:       bb0 ^= bb6
# asm 1: veor >bb0=reg128#14,<bb0=reg128#14,<bb6=reg128#15
# asm 2: veor >bb0=q13,<bb0=q13,<bb6=q14
veor q13,q13,q14

# qhasm:       bb1 = bb5 | bb4
# asm 1: vorr >bb1=reg128#16,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vorr >bb1=q15,<bb5=q11,<bb4=q12
vorr q15,q11,q12

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb1 ^= bb7
# asm 1: veor >bb1=reg128#11,<bb1=reg128#16,<bb7=reg128#11
# asm 2: veor >bb1=q10,<bb1=q15,<bb7=q10
veor q10,q15,q10

# qhasm:       bb0 ^= bb5
# asm 1: veor >bb0=reg128#12,<bb0=reg128#14,<bb5=reg128#12
# asm 2: veor >bb0=q11,<bb0=q13,<bb5=q11
veor q11,q13,q11

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#15
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q14
veor q10,q10,q14

# qhasm:       bb4 = bb10 & bb11
# asm 1: vand >bb4=reg128#13,<bb10=reg128#5,<bb11=reg128#7
# asm 2: vand >bb4=q12,<bb10=q4,<bb11=q6
vand q12,q4,q6

# qhasm:       bb5 = bb12 & bb8
# asm 1: vand >bb5=reg128#14,<bb12=reg128#4,<bb8=reg128#1
# asm 2: vand >bb5=q13,<bb12=q3,<bb8=q0
vand q13,q3,q0

# qhasm:       bb3 ^= bb4
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: veor >bb3=q8,<bb3=q8,<bb4=q12
veor q8,q8,q12

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#14
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q13
veor q9,q9,q13

# qhasm:       bb6 = bb9 & bb13
# asm 1: vand >bb6=reg128#13,<bb9=reg128#2,<bb13=reg128#8
# asm 2: vand >bb6=q12,<bb9=q1,<bb13=q7
vand q12,q1,q7

# qhasm:       bb4 = bb3 ^ bb2
# asm 1: veor >bb4=reg128#14,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb4=q13,<bb3=q8,<bb2=q9
veor q13,q8,q9

# qhasm:       bb7 = bb15 | bb14
# asm 1: vorr >bb7=reg128#15,<bb15=reg128#6,<bb14=reg128#3
# asm 2: vorr >bb7=q14,<bb15=q5,<bb14=q2
vorr q14,q5,q2

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#13
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q12
veor q10,q10,q12

# qhasm:       bb0 ^= bb7
# asm 1: veor >bb0=reg128#12,<bb0=reg128#12,<bb7=reg128#15
# asm 2: veor >bb0=q11,<bb0=q11,<bb7=q14
veor q11,q11,q14

# qhasm:       bb3 &= bb1
# asm 1: vand >bb3=reg128#9,<bb3=reg128#9,<bb1=reg128#11
# asm 2: vand >bb3=q8,<bb3=q8,<bb1=q10
vand q8,q8,q10

# qhasm:       bb5 = bb1 ^ bb0
# asm 1: veor >bb5=reg128#13,<bb1=reg128#11,<bb0=reg128#12
# asm 2: veor >bb5=q12,<bb1=q10,<bb0=q11
veor q12,q10,q11

# qhasm:       bb6 = bb0 ^ bb3
# asm 1: veor >bb6=reg128#15,<bb0=reg128#12,<bb3=reg128#9
# asm 2: veor >bb6=q14,<bb0=q11,<bb3=q8
veor q14,q11,q8

# qhasm:       bb3 ^= bb2
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb3=q8,<bb3=q8,<bb2=q9
veor q8,q8,q9

# qhasm:       bb7 = bb4 & bb6
# asm 1: vand >bb7=reg128#16,<bb4=reg128#14,<bb6=reg128#15
# asm 2: vand >bb7=q15,<bb4=q13,<bb6=q14
vand q15,q13,q14

# qhasm:       bb5 &= bb3
# asm 1: vand >bb5=reg128#9,<bb5=reg128#13,<bb3=reg128#9
# asm 2: vand >bb5=q8,<bb5=q12,<bb3=q8
vand q8,q12,q8

# qhasm:       bb7 ^= bb2
# asm 1: veor >bb7=reg128#10,<bb7=reg128#16,<bb2=reg128#10
# asm 2: veor >bb7=q9,<bb7=q15,<bb2=q9
veor q9,q15,q9

# qhasm:       bb5 ^= bb0
# asm 1: veor >bb5=reg128#9,<bb5=reg128#9,<bb0=reg128#12
# asm 2: veor >bb5=q8,<bb5=q8,<bb0=q11
veor q8,q8,q11

# qhasm:       bb2 = bb6 ^ bb5
# asm 1: veor >bb2=reg128#13,<bb6=reg128#15,<bb5=reg128#9
# asm 2: veor >bb2=q12,<bb6=q14,<bb5=q8
veor q12,q14,q8

# qhasm:       bb1 ^= bb5
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb5=reg128#9
# asm 2: veor >bb1=q10,<bb1=q10,<bb5=q8
veor q10,q10,q8

# qhasm:       bb2 &= bb0
# asm 1: vand >bb2=reg128#12,<bb2=reg128#13,<bb0=reg128#12
# asm 2: vand >bb2=q11,<bb2=q12,<bb0=q11
vand q11,q12,q11

# qhasm:       bb0 = bb13 ^ bb11
# asm 1: veor >bb0=reg128#13,<bb13=reg128#8,<bb11=reg128#7
# asm 2: veor >bb0=q12,<bb13=q7,<bb11=q6
veor q12,q7,q6

# qhasm:       bb6 ^= bb2
# asm 1: veor >bb6=reg128#15,<bb6=reg128#15,<bb2=reg128#12
# asm 2: veor >bb6=q14,<bb6=q14,<bb2=q11
veor q14,q14,q11

# qhasm:       bb1 ^= bb2
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb2=reg128#12
# asm 2: veor >bb1=q10,<bb1=q10,<bb2=q11
veor q10,q10,q11

# qhasm:       bb6 &= bb7
# asm 1: vand >bb6=reg128#12,<bb6=reg128#15,<bb7=reg128#10
# asm 2: vand >bb6=q11,<bb6=q14,<bb7=q9
vand q11,q14,q9

# qhasm:       bb6 ^= bb4
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb4=reg128#14
# asm 2: veor >bb6=q11,<bb6=q11,<bb4=q13
veor q11,q11,q13

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#14,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb4=q13,<bb14=q2,<bb8=q0
veor q13,q2,q0

# qhasm:       bb2 = bb7 ^ bb6
# asm 1: veor >bb2=reg128#15,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb2=q14,<bb7=q9,<bb6=q11
veor q14,q9,q11

# qhasm:       bb2 &= bb14
# asm 1: vand >bb2=reg128#15,<bb2=reg128#15,<bb14=reg128#3
# asm 2: vand >bb2=q14,<bb2=q14,<bb14=q2
vand q14,q14,q2

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb13=reg128#8
# asm 2: veor >bb14=q2,<bb14=q2,<bb13=q7
veor q2,q2,q7

# qhasm:       bb13 &= bb7
# asm 1: vand >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#10
# asm 2: vand >bb13=q7,<bb13=q7,<bb7=q9
vand q7,q7,q9

# qhasm:       bb14 &= bb6
# asm 1: vand >bb14=reg128#3,<bb14=reg128#3,<bb6=reg128#12
# asm 2: vand >bb14=q2,<bb14=q2,<bb6=q11
vand q2,q2,q11

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q11,<bb6=q11,<bb1=q10
veor q11,q11,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#10,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q9,<bb7=q9,<bb5=q8
veor q9,q9,q8

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb13=reg128#8
# asm 2: veor >bb14=q2,<bb14=q2,<bb13=q7
veor q2,q2,q7

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#16,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q15,<bb7=q9,<bb6=q11
veor q15,q9,q11

# qhasm:       bb13 ^= bb2
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb2=reg128#15
# asm 2: veor >bb13=q7,<bb13=q7,<bb2=q14
veor q7,q7,q14

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#15,<bb3=reg128#16,<bb4=reg128#14
# asm 2: vand >bb3=q14,<bb3=q15,<bb4=q13
vand q14,q15,q13

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb0=reg128#13
# asm 2: veor >bb4=q13,<bb4=q13,<bb0=q12
veor q13,q13,q12

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#13,<bb0=reg128#13,<bb7=reg128#10
# asm 2: vand >bb0=q12,<bb0=q12,<bb7=q9
vand q12,q12,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#14,<bb4=reg128#14,<bb6=reg128#12
# asm 2: vand >bb4=q13,<bb4=q13,<bb6=q11
vand q13,q13,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#13,<bb0=reg128#13,<bb4=reg128#14
# asm 2: veor >bb0=q12,<bb0=q12,<bb4=q13
veor q12,q12,q13

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb3=reg128#15
# asm 2: veor >bb4=q13,<bb4=q13,<bb3=q14
veor q13,q13,q14

# qhasm:       bb2 &= bb8
# asm 1: vand >bb2=reg128#15,<bb2=reg128#16,<bb8=reg128#1
# asm 2: vand >bb2=q14,<bb2=q15,<bb8=q0
vand q14,q15,q0

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#7
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q6
veor q0,q0,q6

# qhasm:       bb11 &= bb5
# asm 1: vand >bb11=reg128#7,<bb11=reg128#7,<bb5=reg128#9
# asm 2: vand >bb11=q6,<bb11=q6,<bb5=q8
vand q6,q6,q8

# qhasm:       bb8 &= bb1
# asm 1: vand >bb8=reg128#1,<bb8=reg128#1,<bb1=reg128#11
# asm 2: vand >bb8=q0,<bb8=q0,<bb1=q10
vand q0,q0,q10

# qhasm:       bb14 ^= bb4
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb4=reg128#14
# asm 2: veor >bb14=q2,<bb14=q2,<bb4=q13
veor q2,q2,q13

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#7
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q6
veor q0,q0,q6

# qhasm:       bb11 ^= bb2
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb2=reg128#15
# asm 2: veor >bb11=q6,<bb11=q6,<bb2=q14
veor q6,q6,q14

# qhasm:       bb8 ^= bb4
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb4=reg128#14
# asm 2: veor >bb8=q0,<bb8=q0,<bb4=q13
veor q0,q0,q13

# qhasm:       bb13 ^= bb0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb0=reg128#13
# asm 2: veor >bb13=q7,<bb13=q7,<bb0=q12
veor q7,q7,q12

# qhasm:       bb11 ^= bb0
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb0=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb0=q12
veor q6,q6,q12

# qhasm:       bb4 = bb15 ^ bb12
# asm 1: veor >bb4=reg128#13,<bb15=reg128#6,<bb12=reg128#4
# asm 2: veor >bb4=q12,<bb15=q5,<bb12=q3
veor q12,q5,q3

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#14,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q13,<bb7=q9,<bb6=q11
veor q13,q9,q11

# qhasm:       bb0 = bb9 ^ bb10
# asm 1: veor >bb0=reg128#15,<bb9=reg128#2,<bb10=reg128#5
# asm 2: veor >bb0=q14,<bb9=q1,<bb10=q4
veor q14,q1,q4

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#14,<bb3=reg128#14,<bb4=reg128#13
# asm 2: vand >bb3=q13,<bb3=q13,<bb4=q12
vand q13,q13,q12

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb0=reg128#15
# asm 2: veor >bb4=q12,<bb4=q12,<bb0=q14
veor q12,q12,q14

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#15,<bb0=reg128#15,<bb7=reg128#10
# asm 2: vand >bb0=q14,<bb0=q14,<bb7=q9
vand q14,q14,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#13,<bb4=reg128#13,<bb6=reg128#12
# asm 2: vand >bb4=q12,<bb4=q12,<bb6=q11
vand q12,q12,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#15,<bb0=reg128#15,<bb4=reg128#13
# asm 2: veor >bb0=q14,<bb0=q14,<bb4=q12
veor q14,q14,q12

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb3=reg128#14
# asm 2: veor >bb4=q12,<bb4=q12,<bb3=q13
veor q12,q12,q13

# qhasm:       bb2 &= bb12
# asm 1: vand >bb2=reg128#14,<bb2=reg128#16,<bb12=reg128#4
# asm 2: vand >bb2=q13,<bb2=q15,<bb12=q3
vand q13,q15,q3

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb10=reg128#5
# asm 2: veor >bb12=q3,<bb12=q3,<bb10=q4
veor q3,q3,q4

# qhasm:       bb10 &= bb5
# asm 1: vand >bb10=reg128#5,<bb10=reg128#5,<bb5=reg128#9
# asm 2: vand >bb10=q4,<bb10=q4,<bb5=q8
vand q4,q4,q8

# qhasm:       bb12 &= bb1
# asm 1: vand >bb12=reg128#4,<bb12=reg128#4,<bb1=reg128#11
# asm 2: vand >bb12=q3,<bb12=q3,<bb1=q10
vand q3,q3,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#9,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q8,<bb7=q9,<bb5=q8
veor q8,q9,q8

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#10,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q9,<bb6=q11,<bb1=q10
veor q9,q11,q10

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb10=reg128#5
# asm 2: veor >bb12=q3,<bb12=q3,<bb10=q4
veor q3,q3,q4

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#11,<bb7=reg128#9,<bb6=reg128#10
# asm 2: veor >bb3=q10,<bb7=q8,<bb6=q9
veor q10,q8,q9

# qhasm:       bb10 ^= bb2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb2=reg128#14
# asm 2: veor >bb10=q4,<bb10=q4,<bb2=q13
veor q4,q4,q13

# qhasm:       bb3 &= bb15
# asm 1: vand >bb3=reg128#11,<bb3=reg128#11,<bb15=reg128#6
# asm 2: vand >bb3=q10,<bb3=q10,<bb15=q5
vand q10,q10,q5

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 &= bb7
# asm 1: vand >bb9=reg128#2,<bb9=reg128#2,<bb7=reg128#9
# asm 2: vand >bb9=q1,<bb9=q1,<bb7=q8
vand q1,q1,q8

# qhasm:       bb15 &= bb6
# asm 1: vand >bb15=reg128#6,<bb15=reg128#6,<bb6=reg128#10
# asm 2: vand >bb15=q5,<bb15=q5,<bb6=q9
vand q5,q5,q9

# qhasm:       bb12 ^= bb4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb4=reg128#13
# asm 2: veor >bb12=q3,<bb12=q3,<bb4=q12
veor q3,q3,q12

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 ^= bb3
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb3=reg128#11
# asm 2: veor >bb9=q1,<bb9=q1,<bb3=q10
veor q1,q1,q10

# qhasm:       bb15 ^= bb4
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb4=reg128#13
# asm 2: veor >bb15=q5,<bb15=q5,<bb4=q12
veor q5,q5,q12

# qhasm:       bb9 ^= bb0
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb0=reg128#15
# asm 2: veor >bb9=q1,<bb9=q1,<bb0=q14
veor q1,q1,q14

# qhasm:       bb10 ^= bb0
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb0=reg128#15
# asm 2: veor >bb10=q4,<bb10=q4,<bb0=q14
veor q4,q4,q14

# qhasm:     bb15 ^= bb8
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb8=reg128#1
# asm 2: veor >bb15=q5,<bb15=q5,<bb8=q0
veor q5,q5,q0

# qhasm:     bb9 ^= bb14
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb14=reg128#3
# asm 2: veor >bb9=q1,<bb9=q1,<bb14=q2
veor q1,q1,q2

# qhasm:     bb12 ^= bb15
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb15=reg128#6
# asm 2: veor >bb12=q3,<bb12=q3,<bb15=q5
veor q3,q3,q5

# qhasm:     bb14 ^= bb8
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb14=q2,<bb14=q2,<bb8=q0
veor q2,q2,q0

# qhasm:     bb8 ^= bb9
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb9=reg128#2
# asm 2: veor >bb8=q0,<bb8=q0,<bb9=q1
veor q0,q0,q1

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:     bb13 ^= bb10
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb10=reg128#5
# asm 2: veor >bb13=q7,<bb13=q7,<bb10=q4
veor q7,q7,q4

# qhasm:     bb10 ^= bb11
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb11=reg128#7
# asm 2: veor >bb10=q4,<bb10=q4,<bb11=q6
veor q4,q4,q6

# qhasm:     bb11 ^= bb13
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb13=reg128#8
# asm 2: veor >bb11=q6,<bb11=q6,<bb13=q7
veor q6,q6,q7

# qhasm:     bb0 = bb8[3]bb8[0,1,2]
# asm 1: vext.32 >bb0=reg128#9,<bb8=reg128#1,<bb8=reg128#1,#3
# asm 2: vext.32 >bb0=q8,<bb8=q0,<bb8=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb13=reg128#8
# asm 2: veor >bb12=q3,<bb12=q3,<bb13=q7
veor q3,q3,q7

# qhasm:     bb1 = bb9[3]bb9[0,1,2]
# asm 1: vext.32 >bb1=reg128#10,<bb9=reg128#2,<bb9=reg128#2,#3
# asm 2: vext.32 >bb1=q9,<bb9=q1,<bb9=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb11=reg128#7
# asm 2: veor >bb14=q2,<bb14=q2,<bb11=q6
veor q2,q2,q6

# qhasm:     bb2 = bb12[3]bb12[0,1,2]
# asm 1: vext.32 >bb2=reg128#11,<bb12=reg128#4,<bb12=reg128#4,#3
# asm 2: vext.32 >bb2=q10,<bb12=q3,<bb12=q3,#3
vext.32 q10,q3,q3,#3

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb3 = bb14[3]bb14[0,1,2]
# asm 1: vext.32 >bb3=reg128#12,<bb14=reg128#3,<bb14=reg128#3,#3
# asm 2: vext.32 >bb3=q11,<bb14=q2,<bb14=q2,#3
vext.32 q11,q2,q2,#3

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     bb4 = bb11[3]bb11[0,1,2]
# asm 1: vext.32 >bb4=reg128#13,<bb11=reg128#7,<bb11=reg128#7,#3
# asm 2: vext.32 >bb4=q12,<bb11=q6,<bb11=q6,#3
vext.32 q12,q6,q6,#3

# qhasm:     bb12 ^= bb2
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb2=reg128#11
# asm 2: veor >bb12=q3,<bb12=q3,<bb2=q10
veor q3,q3,q10

# qhasm:     bb7 = bb13[3]bb13[0,1,2]
# asm 1: vext.32 >bb7=reg128#14,<bb13=reg128#8,<bb13=reg128#8,#3
# asm 2: vext.32 >bb7=q13,<bb13=q7,<bb13=q7,#3
vext.32 q13,q7,q7,#3

# qhasm:     bb14 ^= bb3
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb3=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<bb3=q11
veor q2,q2,q11

# qhasm:     bb5 = bb15[3]bb15[0,1,2]
# asm 1: vext.32 >bb5=reg128#15,<bb15=reg128#6,<bb15=reg128#6,#3
# asm 2: vext.32 >bb5=q14,<bb15=q5,<bb15=q5,#3
vext.32 q14,q5,q5,#3

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb4=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb4=q12
veor q6,q6,q12

# qhasm:     bb6 = bb10[3]bb10[0,1,2]
# asm 1: vext.32 >bb6=reg128#16,<bb10=reg128#5,<bb10=reg128#5,#3
# asm 2: vext.32 >bb6=q15,<bb10=q4,<bb10=q4,#3
vext.32 q15,q4,q4,#3

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb7=q13
veor q7,q7,q13

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb5=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb5=q14
veor q5,q5,q14

# qhasm:     bb10 ^= bb6
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb6=reg128#16
# asm 2: veor >bb10=q4,<bb10=q4,<bb6=q15
veor q4,q4,q15

# qhasm:     bb1 ^= bb8
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb8=reg128#1
# asm 2: veor >bb1=q9,<bb1=q9,<bb8=q0
veor q9,q9,q0

# qhasm:     bb0 ^= bb13
# asm 1: veor >bb0=reg128#9,<bb0=reg128#9,<bb13=reg128#8
# asm 2: veor >bb0=q8,<bb0=q8,<bb13=q7
veor q8,q8,q7

# qhasm:     bb2 ^= bb9
# asm 1: veor >bb2=reg128#11,<bb2=reg128#11,<bb9=reg128#2
# asm 2: veor >bb2=q10,<bb2=q10,<bb9=q1
veor q10,q10,q1

# qhasm:     bb1 ^= bb13
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb13=reg128#8
# asm 2: veor >bb1=q9,<bb1=q9,<bb13=q7
veor q9,q9,q7

# qhasm:     bb8 = bb8[2,3]bb8[0,1]
# asm 1: vswp <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vswp <bb8=d0,<bb8=d1
vswp d0,d1

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb12=reg128#4
# asm 2: veor >bb3=q11,<bb3=q11,<bb12=q3
veor q11,q11,q3

# qhasm:     bb9 = bb9[2,3]bb9[0,1]
# asm 1: vswp <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vswp <bb9=d2,<bb9=d3
vswp d2,d3

# qhasm:     bb4 ^= bb14
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb14=reg128#3
# asm 2: veor >bb4=q12,<bb4=q12,<bb14=q2
veor q12,q12,q2

# qhasm:     bb12 = bb12[2,3]bb12[0,1]
# asm 1: vswp <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vswp <bb12=d6,<bb12=d7
vswp d6,d7

# qhasm:     bb5 ^= bb11
# asm 1: veor >bb5=reg128#15,<bb5=reg128#15,<bb11=reg128#7
# asm 2: veor >bb5=q14,<bb5=q14,<bb11=q6
veor q14,q14,q6

# qhasm:     bb14 = bb14[2,3]bb14[0,1]
# asm 1: vswp <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vswp <bb14=d4,<bb14=d5
vswp d4,d5

# qhasm:     bb3 ^= bb13
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb13=reg128#8
# asm 2: veor >bb3=q11,<bb3=q11,<bb13=q7
veor q11,q11,q7

# qhasm:     bb11 = bb11[2,3]bb11[0,1]
# asm 1: vswp <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vswp <bb11=d12,<bb11=d13
vswp d12,d13

# qhasm:     bb6 ^= bb15
# asm 1: veor >bb6=reg128#16,<bb6=reg128#16,<bb15=reg128#6
# asm 2: veor >bb6=q15,<bb6=q15,<bb15=q5
veor q15,q15,q5

# qhasm:     bb15 = bb15[2,3]bb15[0,1]
# asm 1: vswp <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vswp <bb15=d10,<bb15=d11
vswp d10,d11

# qhasm:     bb7 ^= bb10
# asm 1: veor >bb7=reg128#14,<bb7=reg128#14,<bb10=reg128#5
# asm 2: veor >bb7=q13,<bb7=q13,<bb10=q4
veor q13,q13,q4

# qhasm:     bb10 = bb10[2,3]bb10[0,1]
# asm 1: vswp <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vswp <bb10=d8,<bb10=d9
vswp d8,d9

# qhasm:     bb4 ^= bb13
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb13=reg128#8
# asm 2: veor >bb4=q12,<bb4=q12,<bb13=q7
veor q12,q12,q7

# qhasm:     bb13 = bb13[2,3]bb13[0,1]
# asm 1: vswp <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vswp <bb13=d14,<bb13=d15
vswp d14,d15

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#9,<bb8=reg128#1
# asm 2: veor >bb0=q0,<bb0=q8,<bb8=q0
veor q0,q8,q0

# qhasm:     bb8 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb8=reg128#9%bot->bb8=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb8=d16->bb8=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#10,<bb9=reg128#2
# asm 2: veor >bb1=q1,<bb1=q9,<bb9=q1
veor q1,q9,q1

# qhasm:     bb9 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb9=reg128#10%bot->bb9=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb9=d18->bb9=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb6 ^= bb10
# asm 1: veor >bb6=reg128#5,<bb6=reg128#16,<bb10=reg128#5
# asm 2: veor >bb6=q4,<bb6=q15,<bb10=q4
veor q4,q15,q4

# qhasm:     bb10 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb10=reg128#16%bot->bb10=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb10=d30->bb10=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb4 ^= bb11
# asm 1: veor >bb4=reg128#7,<bb4=reg128#13,<bb11=reg128#7
# asm 2: veor >bb4=q6,<bb4=q12,<bb11=q6
veor q6,q12,q6

# qhasm:     bb11 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb11=reg128#13%bot->bb11=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb11=d24->bb11=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb2 ^= bb12
# asm 1: veor >bb2=reg128#4,<bb2=reg128#11,<bb12=reg128#4
# asm 2: veor >bb2=q3,<bb2=q10,<bb12=q3
veor q3,q10,q3

# qhasm:     bb12 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb12=reg128#11%bot->bb12=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb12=d20->bb12=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#14,<bb13=reg128#8
# asm 2: veor >bb7=q7,<bb7=q13,<bb13=q7
veor q7,q13,q7

# qhasm:     bb13 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb13=reg128#14%bot->bb13=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb13=d26->bb13=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb3 ^= bb14
# asm 1: veor >bb3=reg128#3,<bb3=reg128#12,<bb14=reg128#3
# asm 2: veor >bb3=q2,<bb3=q11,<bb14=q2
veor q2,q11,q2

# qhasm:     bb14 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb14=reg128#12%bot->bb14=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb14=d22->bb14=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#15,<bb15=reg128#6
# asm 2: veor >bb5=q5,<bb5=q14,<bb15=q5
veor q5,q14,q5

# qhasm:     bb15 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb15=reg128#15%bot->bb15=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb15=d28->bb15=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb2 ^= bb10
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb10=reg128#16
# asm 2: veor >bb2=q3,<bb2=q3,<bb10=q15
veor q3,q3,q15

# qhasm:     bb5 ^= bb13
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb13=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb13=q13
veor q5,q5,q13

# qhasm:       bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb1=reg128#2%bot,{<bb1=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb1=d2,{<bb1=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb1=reg128#2%top,{<bb1=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb1=d3,{<bb1=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb3 ^= bb11
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb11=reg128#13
# asm 2: veor >bb3=q2,<bb3=q2,<bb11=q12
veor q2,q2,q12

# qhasm:       bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb2=reg128#4%bot,{<bb2=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb2=d6,{<bb2=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb2=reg128#4%top,{<bb2=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb2=d7,{<bb2=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb6 ^= bb14
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb14=reg128#12
# asm 2: veor >bb6=q4,<bb6=q4,<bb14=q11
veor q4,q4,q11

# qhasm:     bb7 ^= bb15
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb15=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb15=q14
veor q7,q7,q14

# qhasm:       bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb5=reg128#6%bot,{<bb5=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb5=d10,{<bb5=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb5=reg128#6%top,{<bb5=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb5=d11,{<bb5=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb4 ^= bb12
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb12=reg128#11
# asm 2: veor >bb4=q6,<bb4=q6,<bb12=q10
veor q6,q6,q10

# qhasm:       bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb0=reg128#1%bot,{<bb0=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb0=d0,{<bb0=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb0=reg128#1%top,{<bb0=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb0=d1,{<bb0=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb2 ^= bb1
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb1=reg128#2
# asm 2: veor >bb2=q3,<bb2=q3,<bb1=q1
veor q3,q3,q1

# qhasm:       bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb3=reg128#3%bot,{<bb3=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb3=d4,{<bb3=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb3=reg128#3%top,{<bb3=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb3=d5,{<bb3=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb5 ^= bb0
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb0=reg128#1
# asm 2: veor >bb5=q5,<bb5=q5,<bb0=q0
veor q5,q5,q0

# qhasm:       bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb6=reg128#5%bot,{<bb6=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb6=d8,{<bb6=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb6=reg128#5%top,{<bb6=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb6=d9,{<bb6=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb3 ^= bb0
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb0=reg128#1
# asm 2: veor >bb3=q2,<bb3=q2,<bb0=q0
veor q2,q2,q0

# qhasm:       bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb7=reg128#8%bot,{<bb7=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb7=d14,{<bb7=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb7=reg128#8%top,{<bb7=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb7=d15,{<bb7=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb5 ^= bb6
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb6=reg128#5
# asm 2: veor >bb5=q5,<bb5=q5,<bb6=q4
veor q5,q5,q4

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb3=reg128#3
# asm 2: veor >bb6=q4,<bb6=q4,<bb3=q2
veor q4,q4,q2

# qhasm:     bb3 ^= bb7
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb7=reg128#8
# asm 2: veor >bb3=q2,<bb3=q2,<bb7=q7
veor q2,q2,q7

# qhasm:       bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb4=reg128#7%bot,{<bb4=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb4=d12,{<bb4=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb4=reg128#7%top,{<bb4=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb4=d13,{<bb4=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb6 ^= bb2
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb2=reg128#4
# asm 2: veor >bb6=q4,<bb6=q4,<bb2=q3
veor q4,q4,q3

# qhasm:     bb7 ^= bb5
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb5=reg128#6
# asm 2: veor >bb7=q7,<bb7=q7,<bb5=q5
veor q7,q7,q5

# qhasm:     bb3 ^= bb4
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb4=reg128#7
# asm 2: veor >bb3=q2,<bb3=q2,<bb4=q6
veor q2,q2,q6

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb5=reg128#6
# asm 2: veor >bb4=q6,<bb4=q6,<bb5=q5
veor q6,q6,q5

# qhasm:     bb3 ^= bb1
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb1=reg128#2
# asm 2: veor >bb3=q2,<bb3=q2,<bb1=q1
veor q2,q2,q1

# qhasm:     bb2 ^= bb7
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb7=reg128#8
# asm 2: veor >bb2=q3,<bb2=q3,<bb7=q7
veor q3,q3,q7

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:       bb11 = bb7 ^ bb4
# asm 1: veor >bb11=reg128#9,<bb7=reg128#8,<bb4=reg128#7
# asm 2: veor >bb11=q8,<bb7=q7,<bb4=q6
veor q8,q7,q6

# qhasm:       bb10 = bb1 ^ bb2
# asm 1: veor >bb10=reg128#10,<bb1=reg128#2,<bb2=reg128#4
# asm 2: veor >bb10=q9,<bb1=q1,<bb2=q3
veor q9,q1,q3

# qhasm:       bb9 = bb5 ^ bb3
# asm 1: veor >bb9=reg128#11,<bb5=reg128#6,<bb3=reg128#3
# asm 2: veor >bb9=q10,<bb5=q5,<bb3=q2
veor q10,q5,q2

# qhasm:       bb13 = bb2 ^ bb4
# asm 1: veor >bb13=reg128#12,<bb2=reg128#4,<bb4=reg128#7
# asm 2: veor >bb13=q11,<bb2=q3,<bb4=q6
veor q11,q3,q6

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb6=reg128#5,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb6=q4,<bb0=q0
veor q12,q4,q0

# qhasm:       bb8 = bb10 & bb9
# asm 1: vand >bb8=reg128#14,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vand >bb8=q13,<bb10=q9,<bb9=q10
vand q13,q9,q10

# qhasm:       bb14 = bb11 & bb12
# asm 1: vand >bb14=reg128#15,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vand >bb14=q14,<bb11=q8,<bb12=q12
vand q14,q8,q12

# qhasm:       bb15 = bb11 ^ bb10
# asm 1: veor >bb15=reg128#16,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb15=q15,<bb11=q8,<bb10=q9
veor q15,q8,q9

# qhasm:       bb11 |= bb12
# asm 1: vorr >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vorr >bb11=q8,<bb11=q8,<bb12=q12
vorr q8,q8,q12

# qhasm:       bb12 ^= bb9
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb9=reg128#11
# asm 2: veor >bb12=q12,<bb12=q12,<bb9=q10
veor q12,q12,q10

# qhasm:       bb10 |= bb9
# asm 1: vorr >bb10=reg128#10,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vorr >bb10=q9,<bb10=q9,<bb9=q10
vorr q9,q9,q10

# qhasm:       bb15 &= bb12
# asm 1: vand >bb15=reg128#11,<bb15=reg128#16,<bb12=reg128#13
# asm 2: vand >bb15=q10,<bb15=q15,<bb12=q12
vand q10,q15,q12

# qhasm:       bb12 = bb3 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb3=reg128#3,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb3=q2,<bb0=q0
veor q12,q2,q0

# qhasm:       bb11 ^= bb15
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb15=reg128#11
# asm 2: veor >bb11=q8,<bb11=q8,<bb15=q10
veor q8,q8,q10

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb10 ^= bb14
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb14=reg128#15
# asm 2: veor >bb10=q9,<bb10=q9,<bb14=q14
veor q9,q9,q14

# qhasm:       bb11 ^= bb13
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb13=reg128#12
# asm 2: veor >bb11=q8,<bb11=q8,<bb13=q11
veor q8,q8,q11

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#12
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q11
veor q9,q9,q11

# qhasm:       bb13 = bb7 ^ bb1
# asm 1: veor >bb13=reg128#12,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb13=q11,<bb7=q7,<bb1=q1
veor q11,q7,q1

# qhasm:       bb12 = bb5 ^ bb6
# asm 1: veor >bb12=reg128#13,<bb5=reg128#6,<bb6=reg128#5
# asm 2: veor >bb12=q12,<bb5=q5,<bb6=q4
veor q12,q5,q4

# qhasm:       bb8 ^= bb14
# asm 1: veor >bb8=reg128#14,<bb8=reg128#14,<bb14=reg128#15
# asm 2: veor >bb8=q13,<bb8=q13,<bb14=q14
veor q13,q13,q14

# qhasm:       bb9 = bb13 | bb12
# asm 1: vorr >bb9=reg128#16,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vorr >bb9=q15,<bb13=q11,<bb12=q12
vorr q15,q11,q12

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb9 ^= bb15
# asm 1: veor >bb9=reg128#11,<bb9=reg128#16,<bb15=reg128#11
# asm 2: veor >bb9=q10,<bb9=q15,<bb15=q10
veor q10,q15,q10

# qhasm:       bb8 ^= bb13
# asm 1: veor >bb8=reg128#12,<bb8=reg128#14,<bb13=reg128#12
# asm 2: veor >bb8=q11,<bb8=q13,<bb13=q11
veor q11,q13,q11

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#15
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q14
veor q10,q10,q14

# qhasm:       bb12 = bb2 & bb3
# asm 1: vand >bb12=reg128#13,<bb2=reg128#4,<bb3=reg128#3
# asm 2: vand >bb12=q12,<bb2=q3,<bb3=q2
vand q12,q3,q2

# qhasm:       bb13 = bb4 & bb0
# asm 1: vand >bb13=reg128#14,<bb4=reg128#7,<bb0=reg128#1
# asm 2: vand >bb13=q13,<bb4=q6,<bb0=q0
vand q13,q6,q0

# qhasm:       bb11 ^= bb12
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: veor >bb11=q8,<bb11=q8,<bb12=q12
veor q8,q8,q12

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#14
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q13
veor q9,q9,q13

# qhasm:       bb14 = bb1 & bb5
# asm 1: vand >bb14=reg128#13,<bb1=reg128#2,<bb5=reg128#6
# asm 2: vand >bb14=q12,<bb1=q1,<bb5=q5
vand q12,q1,q5

# qhasm:       bb12 = bb11 ^ bb10
# asm 1: veor >bb12=reg128#14,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb12=q13,<bb11=q8,<bb10=q9
veor q13,q8,q9

# qhasm:       bb15 = bb7 | bb6
# asm 1: vorr >bb15=reg128#15,<bb7=reg128#8,<bb6=reg128#5
# asm 2: vorr >bb15=q14,<bb7=q7,<bb6=q4
vorr q14,q7,q4

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#13
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q12
veor q10,q10,q12

# qhasm:       bb8 ^= bb15
# asm 1: veor >bb8=reg128#12,<bb8=reg128#12,<bb15=reg128#15
# asm 2: veor >bb8=q11,<bb8=q11,<bb15=q14
veor q11,q11,q14

# qhasm:       bb11 &= bb9
# asm 1: vand >bb11=reg128#9,<bb11=reg128#9,<bb9=reg128#11
# asm 2: vand >bb11=q8,<bb11=q8,<bb9=q10
vand q8,q8,q10

# qhasm:       bb13 = bb9 ^ bb8
# asm 1: veor >bb13=reg128#13,<bb9=reg128#11,<bb8=reg128#12
# asm 2: veor >bb13=q12,<bb9=q10,<bb8=q11
veor q12,q10,q11

# qhasm:       bb14 = bb8 ^ bb11
# asm 1: veor >bb14=reg128#15,<bb8=reg128#12,<bb11=reg128#9
# asm 2: veor >bb14=q14,<bb8=q11,<bb11=q8
veor q14,q11,q8

# qhasm:       bb11 ^= bb10
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb11=q8,<bb11=q8,<bb10=q9
veor q8,q8,q9

# qhasm:       bb15 = bb12 & bb14
# asm 1: vand >bb15=reg128#16,<bb12=reg128#14,<bb14=reg128#15
# asm 2: vand >bb15=q15,<bb12=q13,<bb14=q14
vand q15,q13,q14

# qhasm:       bb13 &= bb11
# asm 1: vand >bb13=reg128#9,<bb13=reg128#13,<bb11=reg128#9
# asm 2: vand >bb13=q8,<bb13=q12,<bb11=q8
vand q8,q12,q8

# qhasm:       bb15 ^= bb10
# asm 1: veor >bb15=reg128#10,<bb15=reg128#16,<bb10=reg128#10
# asm 2: veor >bb15=q9,<bb15=q15,<bb10=q9
veor q9,q15,q9

# qhasm:       bb13 ^= bb8
# asm 1: veor >bb13=reg128#9,<bb13=reg128#9,<bb8=reg128#12
# asm 2: veor >bb13=q8,<bb13=q8,<bb8=q11
veor q8,q8,q11

# qhasm:       bb10 = bb14 ^ bb13
# asm 1: veor >bb10=reg128#13,<bb14=reg128#15,<bb13=reg128#9
# asm 2: veor >bb10=q12,<bb14=q14,<bb13=q8
veor q12,q14,q8

# qhasm:       bb9 ^= bb13
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb13=reg128#9
# asm 2: veor >bb9=q10,<bb9=q10,<bb13=q8
veor q10,q10,q8

# qhasm:       bb10 &= bb8
# asm 1: vand >bb10=reg128#12,<bb10=reg128#13,<bb8=reg128#12
# asm 2: vand >bb10=q11,<bb10=q12,<bb8=q11
vand q11,q12,q11

# qhasm:       bb8 = bb5 ^ bb3
# asm 1: veor >bb8=reg128#13,<bb5=reg128#6,<bb3=reg128#3
# asm 2: veor >bb8=q12,<bb5=q5,<bb3=q2
veor q12,q5,q2

# qhasm:       bb14 ^= bb10
# asm 1: veor >bb14=reg128#15,<bb14=reg128#15,<bb10=reg128#12
# asm 2: veor >bb14=q14,<bb14=q14,<bb10=q11
veor q14,q14,q11

# qhasm:       bb9 ^= bb10
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb10=reg128#12
# asm 2: veor >bb9=q10,<bb9=q10,<bb10=q11
veor q10,q10,q11

# qhasm:       bb14 &= bb15
# asm 1: vand >bb14=reg128#12,<bb14=reg128#15,<bb15=reg128#10
# asm 2: vand >bb14=q11,<bb14=q14,<bb15=q9
vand q11,q14,q9

# qhasm:       bb14 ^= bb12
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb12=reg128#14
# asm 2: veor >bb14=q11,<bb14=q11,<bb12=q13
veor q11,q11,q13

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#14,<bb6=reg128#5,<bb0=reg128#1
# asm 2: veor >bb12=q13,<bb6=q4,<bb0=q0
veor q13,q4,q0

# qhasm:       bb10 = bb15 ^ bb14
# asm 1: veor >bb10=reg128#15,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb10=q14,<bb15=q9,<bb14=q11
veor q14,q9,q11

# qhasm:       bb10 &= bb6
# asm 1: vand >bb10=reg128#15,<bb10=reg128#15,<bb6=reg128#5
# asm 2: vand >bb10=q14,<bb10=q14,<bb6=q4
vand q14,q14,q4

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb5=reg128#6
# asm 2: veor >bb6=q4,<bb6=q4,<bb5=q5
veor q4,q4,q5

# qhasm:       bb5 &= bb15
# asm 1: vand >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#10
# asm 2: vand >bb5=q5,<bb5=q5,<bb15=q9
vand q5,q5,q9

# qhasm:       bb6 &= bb14
# asm 1: vand >bb6=reg128#5,<bb6=reg128#5,<bb14=reg128#12
# asm 2: vand >bb6=q4,<bb6=q4,<bb14=q11
vand q4,q4,q11

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q11,<bb14=q11,<bb9=q10
veor q11,q11,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#10,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q9,<bb15=q9,<bb13=q8
veor q9,q9,q8

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb5=reg128#6
# asm 2: veor >bb6=q4,<bb6=q4,<bb5=q5
veor q4,q4,q5

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#16,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q15,<bb15=q9,<bb14=q11
veor q15,q9,q11

# qhasm:       bb5 ^= bb10
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb10=reg128#15
# asm 2: veor >bb5=q5,<bb5=q5,<bb10=q14
veor q5,q5,q14

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#15,<bb11=reg128#16,<bb12=reg128#14
# asm 2: vand >bb11=q14,<bb11=q15,<bb12=q13
vand q14,q15,q13

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb8=reg128#13
# asm 2: veor >bb12=q13,<bb12=q13,<bb8=q12
veor q13,q13,q12

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#13,<bb8=reg128#13,<bb15=reg128#10
# asm 2: vand >bb8=q12,<bb8=q12,<bb15=q9
vand q12,q12,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#14,<bb12=reg128#14,<bb14=reg128#12
# asm 2: vand >bb12=q13,<bb12=q13,<bb14=q11
vand q13,q13,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#13,<bb8=reg128#13,<bb12=reg128#14
# asm 2: veor >bb8=q12,<bb8=q12,<bb12=q13
veor q12,q12,q13

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb11=reg128#15
# asm 2: veor >bb12=q13,<bb12=q13,<bb11=q14
veor q13,q13,q14

# qhasm:       bb10 &= bb0
# asm 1: vand >bb10=reg128#15,<bb10=reg128#16,<bb0=reg128#1
# asm 2: vand >bb10=q14,<bb10=q15,<bb0=q0
vand q14,q15,q0

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#3
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q2
veor q0,q0,q2

# qhasm:       bb3 &= bb13
# asm 1: vand >bb3=reg128#3,<bb3=reg128#3,<bb13=reg128#9
# asm 2: vand >bb3=q2,<bb3=q2,<bb13=q8
vand q2,q2,q8

# qhasm:       bb0 &= bb9
# asm 1: vand >bb0=reg128#1,<bb0=reg128#1,<bb9=reg128#11
# asm 2: vand >bb0=q0,<bb0=q0,<bb9=q10
vand q0,q0,q10

# qhasm:       bb6 ^= bb12
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb12=reg128#14
# asm 2: veor >bb6=q4,<bb6=q4,<bb12=q13
veor q4,q4,q13

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#3
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q2
veor q0,q0,q2

# qhasm:       bb3 ^= bb10
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb10=reg128#15
# asm 2: veor >bb3=q2,<bb3=q2,<bb10=q14
veor q2,q2,q14

# qhasm:       bb0 ^= bb12
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb12=reg128#14
# asm 2: veor >bb0=q0,<bb0=q0,<bb12=q13
veor q0,q0,q13

# qhasm:       bb5 ^= bb8
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb8=reg128#13
# asm 2: veor >bb5=q5,<bb5=q5,<bb8=q12
veor q5,q5,q12

# qhasm:       bb3 ^= bb8
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb8=reg128#13
# asm 2: veor >bb3=q2,<bb3=q2,<bb8=q12
veor q2,q2,q12

# qhasm:       bb12 = bb7 ^ bb4
# asm 1: veor >bb12=reg128#13,<bb7=reg128#8,<bb4=reg128#7
# asm 2: veor >bb12=q12,<bb7=q7,<bb4=q6
veor q12,q7,q6

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#14,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q13,<bb15=q9,<bb14=q11
veor q13,q9,q11

# qhasm:       bb8 = bb1 ^ bb2
# asm 1: veor >bb8=reg128#15,<bb1=reg128#2,<bb2=reg128#4
# asm 2: veor >bb8=q14,<bb1=q1,<bb2=q3
veor q14,q1,q3

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#14,<bb11=reg128#14,<bb12=reg128#13
# asm 2: vand >bb11=q13,<bb11=q13,<bb12=q12
vand q13,q13,q12

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb8=reg128#15
# asm 2: veor >bb12=q12,<bb12=q12,<bb8=q14
veor q12,q12,q14

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#15,<bb8=reg128#15,<bb15=reg128#10
# asm 2: vand >bb8=q14,<bb8=q14,<bb15=q9
vand q14,q14,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#13,<bb12=reg128#13,<bb14=reg128#12
# asm 2: vand >bb12=q12,<bb12=q12,<bb14=q11
vand q12,q12,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#15,<bb8=reg128#15,<bb12=reg128#13
# asm 2: veor >bb8=q14,<bb8=q14,<bb12=q12
veor q14,q14,q12

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb11=reg128#14
# asm 2: veor >bb12=q12,<bb12=q12,<bb11=q13
veor q12,q12,q13

# qhasm:       bb10 &= bb4
# asm 1: vand >bb10=reg128#14,<bb10=reg128#16,<bb4=reg128#7
# asm 2: vand >bb10=q13,<bb10=q15,<bb4=q6
vand q13,q15,q6

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb2=reg128#4
# asm 2: veor >bb4=q6,<bb4=q6,<bb2=q3
veor q6,q6,q3

# qhasm:       bb2 &= bb13
# asm 1: vand >bb2=reg128#4,<bb2=reg128#4,<bb13=reg128#9
# asm 2: vand >bb2=q3,<bb2=q3,<bb13=q8
vand q3,q3,q8

# qhasm:       bb4 &= bb9
# asm 1: vand >bb4=reg128#7,<bb4=reg128#7,<bb9=reg128#11
# asm 2: vand >bb4=q6,<bb4=q6,<bb9=q10
vand q6,q6,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#9,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q8,<bb15=q9,<bb13=q8
veor q8,q9,q8

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#10,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q9,<bb14=q11,<bb9=q10
veor q9,q11,q10

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb2=reg128#4
# asm 2: veor >bb4=q6,<bb4=q6,<bb2=q3
veor q6,q6,q3

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#11,<bb15=reg128#9,<bb14=reg128#10
# asm 2: veor >bb11=q10,<bb15=q8,<bb14=q9
veor q10,q8,q9

# qhasm:       bb2 ^= bb10
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb10=reg128#14
# asm 2: veor >bb2=q3,<bb2=q3,<bb10=q13
veor q3,q3,q13

# qhasm:       bb11 &= bb7
# asm 1: vand >bb11=reg128#11,<bb11=reg128#11,<bb7=reg128#8
# asm 2: vand >bb11=q10,<bb11=q10,<bb7=q7
vand q10,q10,q7

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 &= bb15
# asm 1: vand >bb1=reg128#2,<bb1=reg128#2,<bb15=reg128#9
# asm 2: vand >bb1=q1,<bb1=q1,<bb15=q8
vand q1,q1,q8

# qhasm:       bb7 &= bb14
# asm 1: vand >bb7=reg128#8,<bb7=reg128#8,<bb14=reg128#10
# asm 2: vand >bb7=q7,<bb7=q7,<bb14=q9
vand q7,q7,q9

# qhasm:       bb4 ^= bb12
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb12=reg128#13
# asm 2: veor >bb4=q6,<bb4=q6,<bb12=q12
veor q6,q6,q12

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 ^= bb11
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb11=reg128#11
# asm 2: veor >bb1=q1,<bb1=q1,<bb11=q10
veor q1,q1,q10

# qhasm:       bb7 ^= bb12
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb12=reg128#13
# asm 2: veor >bb7=q7,<bb7=q7,<bb12=q12
veor q7,q7,q12

# qhasm:       bb1 ^= bb8
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb8=reg128#15
# asm 2: veor >bb1=q1,<bb1=q1,<bb8=q14
veor q1,q1,q14

# qhasm:       bb2 ^= bb8
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb8=reg128#15
# asm 2: veor >bb2=q3,<bb2=q3,<bb8=q14
veor q3,q3,q14

# qhasm:     bb7 ^= bb0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb0=reg128#1
# asm 2: veor >bb7=q7,<bb7=q7,<bb0=q0
veor q7,q7,q0

# qhasm:     bb1 ^= bb6
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb6=reg128#5
# asm 2: veor >bb1=q1,<bb1=q1,<bb6=q4
veor q1,q1,q4

# qhasm:     bb4 ^= bb7
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb7=reg128#8
# asm 2: veor >bb4=q6,<bb4=q6,<bb7=q7
veor q6,q6,q7

# qhasm:     bb6 ^= bb0
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb0=reg128#1
# asm 2: veor >bb6=q4,<bb6=q4,<bb0=q0
veor q4,q4,q0

# qhasm:     bb0 ^= bb1
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb1=reg128#2
# asm 2: veor >bb0=q0,<bb0=q0,<bb1=q1
veor q0,q0,q1

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:     bb5 ^= bb2
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb2=reg128#4
# asm 2: veor >bb5=q5,<bb5=q5,<bb2=q3
veor q5,q5,q3

# qhasm:     bb2 ^= bb3
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb3=reg128#3
# asm 2: veor >bb2=q3,<bb2=q3,<bb3=q2
veor q3,q3,q2

# qhasm:     bb3 ^= bb5
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb5=reg128#6
# asm 2: veor >bb3=q2,<bb3=q2,<bb5=q5
veor q2,q2,q5

# qhasm:     bb8 = bb0[3]bb0[0,1,2]
# asm 1: vext.32 >bb8=reg128#9,<bb0=reg128#1,<bb0=reg128#1,#3
# asm 2: vext.32 >bb8=q8,<bb0=q0,<bb0=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb5=reg128#6
# asm 2: veor >bb4=q6,<bb4=q6,<bb5=q5
veor q6,q6,q5

# qhasm:     bb9 = bb1[3]bb1[0,1,2]
# asm 1: vext.32 >bb9=reg128#10,<bb1=reg128#2,<bb1=reg128#2,#3
# asm 2: vext.32 >bb9=q9,<bb1=q1,<bb1=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb3=reg128#3
# asm 2: veor >bb6=q4,<bb6=q4,<bb3=q2
veor q4,q4,q2

# qhasm:     bb10 = bb4[3]bb4[0,1,2]
# asm 1: vext.32 >bb10=reg128#11,<bb4=reg128#7,<bb4=reg128#7,#3
# asm 2: vext.32 >bb10=q10,<bb4=q6,<bb4=q6,#3
vext.32 q10,q6,q6,#3

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb11 = bb6[3]bb6[0,1,2]
# asm 1: vext.32 >bb11=reg128#12,<bb6=reg128#5,<bb6=reg128#5,#3
# asm 2: vext.32 >bb11=q11,<bb6=q4,<bb6=q4,#3
vext.32 q11,q4,q4,#3

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     bb12 = bb3[3]bb3[0,1,2]
# asm 1: vext.32 >bb12=reg128#13,<bb3=reg128#3,<bb3=reg128#3,#3
# asm 2: vext.32 >bb12=q12,<bb3=q2,<bb3=q2,#3
vext.32 q12,q2,q2,#3

# qhasm:     bb4 ^= bb10
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb10=reg128#11
# asm 2: veor >bb4=q6,<bb4=q6,<bb10=q10
veor q6,q6,q10

# qhasm:     bb15 = bb5[3]bb5[0,1,2]
# asm 1: vext.32 >bb15=reg128#14,<bb5=reg128#6,<bb5=reg128#6,#3
# asm 2: vext.32 >bb15=q13,<bb5=q5,<bb5=q5,#3
vext.32 q13,q5,q5,#3

# qhasm:     bb6 ^= bb11
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb11=reg128#12
# asm 2: veor >bb6=q4,<bb6=q4,<bb11=q11
veor q4,q4,q11

# qhasm:     bb13 = bb7[3]bb7[0,1,2]
# asm 1: vext.32 >bb13=reg128#15,<bb7=reg128#8,<bb7=reg128#8,#3
# asm 2: vext.32 >bb13=q14,<bb7=q7,<bb7=q7,#3
vext.32 q14,q7,q7,#3

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb12=reg128#13
# asm 2: veor >bb3=q2,<bb3=q2,<bb12=q12
veor q2,q2,q12

# qhasm:     bb14 = bb2[3]bb2[0,1,2]
# asm 1: vext.32 >bb14=reg128#16,<bb2=reg128#4,<bb2=reg128#4,#3
# asm 2: vext.32 >bb14=q15,<bb2=q3,<bb2=q3,#3
vext.32 q15,q3,q3,#3

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb15=q13
veor q5,q5,q13

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb13=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb13=q14
veor q7,q7,q14

# qhasm:     bb2 ^= bb14
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb14=reg128#16
# asm 2: veor >bb2=q3,<bb2=q3,<bb14=q15
veor q3,q3,q15

# qhasm:     bb9 ^= bb0
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb0=reg128#1
# asm 2: veor >bb9=q9,<bb9=q9,<bb0=q0
veor q9,q9,q0

# qhasm:     bb8 ^= bb5
# asm 1: veor >bb8=reg128#9,<bb8=reg128#9,<bb5=reg128#6
# asm 2: veor >bb8=q8,<bb8=q8,<bb5=q5
veor q8,q8,q5

# qhasm:     bb10 ^= bb1
# asm 1: veor >bb10=reg128#11,<bb10=reg128#11,<bb1=reg128#2
# asm 2: veor >bb10=q10,<bb10=q10,<bb1=q1
veor q10,q10,q1

# qhasm:     bb9 ^= bb5
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb5=reg128#6
# asm 2: veor >bb9=q9,<bb9=q9,<bb5=q5
veor q9,q9,q5

# qhasm:     bb0 = bb0[2,3]bb0[0,1]
# asm 1: vswp <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vswp <bb0=d0,<bb0=d1
vswp d0,d1

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb4=reg128#7
# asm 2: veor >bb11=q11,<bb11=q11,<bb4=q6
veor q11,q11,q6

# qhasm:     bb1 = bb1[2,3]bb1[0,1]
# asm 1: vswp <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vswp <bb1=d2,<bb1=d3
vswp d2,d3

# qhasm:     bb12 ^= bb6
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb6=reg128#5
# asm 2: veor >bb12=q12,<bb12=q12,<bb6=q4
veor q12,q12,q4

# qhasm:     bb4 = bb4[2,3]bb4[0,1]
# asm 1: vswp <bb4=reg128#7%bot,<bb4=reg128#7%top
# asm 2: vswp <bb4=d12,<bb4=d13
vswp d12,d13

# qhasm:     bb13 ^= bb3
# asm 1: veor >bb13=reg128#15,<bb13=reg128#15,<bb3=reg128#3
# asm 2: veor >bb13=q14,<bb13=q14,<bb3=q2
veor q14,q14,q2

# qhasm:     bb6 = bb6[2,3]bb6[0,1]
# asm 1: vswp <bb6=reg128#5%bot,<bb6=reg128#5%top
# asm 2: vswp <bb6=d8,<bb6=d9
vswp d8,d9

# qhasm:     bb11 ^= bb5
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb5=reg128#6
# asm 2: veor >bb11=q11,<bb11=q11,<bb5=q5
veor q11,q11,q5

# qhasm:     bb3 = bb3[2,3]bb3[0,1]
# asm 1: vswp <bb3=reg128#3%bot,<bb3=reg128#3%top
# asm 2: vswp <bb3=d4,<bb3=d5
vswp d4,d5

# qhasm:     bb14 ^= bb7
# asm 1: veor >bb14=reg128#16,<bb14=reg128#16,<bb7=reg128#8
# asm 2: veor >bb14=q15,<bb14=q15,<bb7=q7
veor q15,q15,q7

# qhasm:     bb7 = bb7[2,3]bb7[0,1]
# asm 1: vswp <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vswp <bb7=d14,<bb7=d15
vswp d14,d15

# qhasm:     bb15 ^= bb2
# asm 1: veor >bb15=reg128#14,<bb15=reg128#14,<bb2=reg128#4
# asm 2: veor >bb15=q13,<bb15=q13,<bb2=q3
veor q13,q13,q3

# qhasm:     bb2 = bb2[2,3]bb2[0,1]
# asm 1: vswp <bb2=reg128#4%bot,<bb2=reg128#4%top
# asm 2: vswp <bb2=d6,<bb2=d7
vswp d6,d7

# qhasm:     bb12 ^= bb5
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb5=reg128#6
# asm 2: veor >bb12=q12,<bb12=q12,<bb5=q5
veor q12,q12,q5

# qhasm:     bb5 = bb5[2,3]bb5[0,1]
# asm 1: vswp <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vswp <bb5=d10,<bb5=d11
vswp d10,d11

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#9,<bb0=reg128#1
# asm 2: veor >bb8=q0,<bb8=q8,<bb0=q0
veor q0,q8,q0

# qhasm:     bb0 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb0=reg128#9%bot->bb0=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb0=d16->bb0=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#10,<bb1=reg128#2
# asm 2: veor >bb9=q1,<bb9=q9,<bb1=q1
veor q1,q9,q1

# qhasm:     bb1 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb1=reg128#10%bot->bb1=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb1=d18->bb1=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb14 ^= bb2
# asm 1: veor >bb14=reg128#4,<bb14=reg128#16,<bb2=reg128#4
# asm 2: veor >bb14=q3,<bb14=q15,<bb2=q3
veor q3,q15,q3

# qhasm:     bb2 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb2=reg128#16%bot->bb2=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb2=d30->bb2=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb12 ^= bb3
# asm 1: veor >bb12=reg128#3,<bb12=reg128#13,<bb3=reg128#3
# asm 2: veor >bb12=q2,<bb12=q12,<bb3=q2
veor q2,q12,q2

# qhasm:     bb3 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb3=reg128#13%bot->bb3=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb3=d24->bb3=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb10 ^= bb4
# asm 1: veor >bb10=reg128#7,<bb10=reg128#11,<bb4=reg128#7
# asm 2: veor >bb10=q6,<bb10=q10,<bb4=q6
veor q6,q10,q6

# qhasm:     bb4 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb4=reg128#11%bot->bb4=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb4=d20->bb4=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#14,<bb5=reg128#6
# asm 2: veor >bb15=q5,<bb15=q13,<bb5=q5
veor q5,q13,q5

# qhasm:     bb5 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb5=reg128#14%bot->bb5=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb5=d26->bb5=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb11 ^= bb6
# asm 1: veor >bb11=reg128#5,<bb11=reg128#12,<bb6=reg128#5
# asm 2: veor >bb11=q4,<bb11=q11,<bb6=q4
veor q4,q11,q4

# qhasm:     bb6 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb6=reg128#12%bot->bb6=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb6=d22->bb6=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#15,<bb7=reg128#8
# asm 2: veor >bb13=q7,<bb13=q14,<bb7=q7
veor q7,q14,q7

# qhasm:     bb7 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb7=reg128#15%bot->bb7=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb7=d28->bb7=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb10 ^= bb2
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb2=reg128#16
# asm 2: veor >bb10=q6,<bb10=q6,<bb2=q15
veor q6,q6,q15

# qhasm:     bb13 ^= bb5
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb5=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb5=q13
veor q7,q7,q13

# qhasm:       bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb9=reg128#2%bot,{<bb9=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb9=d2,{<bb9=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb9=reg128#2%top,{<bb9=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb9=d3,{<bb9=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb11 ^= bb3
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb3=reg128#13
# asm 2: veor >bb11=q4,<bb11=q4,<bb3=q12
veor q4,q4,q12

# qhasm:       bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb10=reg128#7%bot,{<bb10=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb10=d12,{<bb10=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb10=reg128#7%top,{<bb10=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb10=d13,{<bb10=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb14 ^= bb6
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb6=reg128#12
# asm 2: veor >bb14=q3,<bb14=q3,<bb6=q11
veor q3,q3,q11

# qhasm:     bb15 ^= bb7
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb7=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb7=q14
veor q5,q5,q14

# qhasm:       bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb13=reg128#8%bot,{<bb13=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb13=d14,{<bb13=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb13=reg128#8%top,{<bb13=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb13=d15,{<bb13=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb12 ^= bb4
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb4=reg128#11
# asm 2: veor >bb12=q2,<bb12=q2,<bb4=q10
veor q2,q2,q10

# qhasm:       bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb8=reg128#1%bot,{<bb8=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb8=d0,{<bb8=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb8=reg128#1%top,{<bb8=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb8=d1,{<bb8=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb10 ^= bb9
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb9=reg128#2
# asm 2: veor >bb10=q6,<bb10=q6,<bb9=q1
veor q6,q6,q1

# qhasm:       bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb11=reg128#5%bot,{<bb11=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb11=d8,{<bb11=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb11=reg128#5%top,{<bb11=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb11=d9,{<bb11=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb13 ^= bb8
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb8=reg128#1
# asm 2: veor >bb13=q7,<bb13=q7,<bb8=q0
veor q7,q7,q0

# qhasm:       bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb14=reg128#4%bot,{<bb14=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb14=d6,{<bb14=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb14=reg128#4%top,{<bb14=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb14=d7,{<bb14=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb11 ^= bb8
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb8=reg128#1
# asm 2: veor >bb11=q4,<bb11=q4,<bb8=q0
veor q4,q4,q0

# qhasm:       bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb15=reg128#6%bot,{<bb15=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb15=d10,{<bb15=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb15=reg128#6%top,{<bb15=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb15=d11,{<bb15=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb13 ^= bb14
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb14=reg128#4
# asm 2: veor >bb13=q7,<bb13=q7,<bb14=q3
veor q7,q7,q3

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb11=reg128#5
# asm 2: veor >bb14=q3,<bb14=q3,<bb11=q4
veor q3,q3,q4

# qhasm:     bb11 ^= bb15
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb15=reg128#6
# asm 2: veor >bb11=q4,<bb11=q4,<bb15=q5
veor q4,q4,q5

# qhasm:       bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb12=reg128#3%bot,{<bb12=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb12=d4,{<bb12=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb12=reg128#3%top,{<bb12=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb12=d5,{<bb12=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb14 ^= bb10
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb10=reg128#7
# asm 2: veor >bb14=q3,<bb14=q3,<bb10=q6
veor q3,q3,q6

# qhasm:     bb15 ^= bb13
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb13=reg128#8
# asm 2: veor >bb15=q5,<bb15=q5,<bb13=q7
veor q5,q5,q7

# qhasm:     bb11 ^= bb12
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb12=reg128#3
# asm 2: veor >bb11=q4,<bb11=q4,<bb12=q2
veor q4,q4,q2

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb13=reg128#8
# asm 2: veor >bb12=q2,<bb12=q2,<bb13=q7
veor q2,q2,q7

# qhasm:     bb11 ^= bb9
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb9=reg128#2
# asm 2: veor >bb11=q4,<bb11=q4,<bb9=q1
veor q4,q4,q1

# qhasm:     bb10 ^= bb15
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb15=reg128#6
# asm 2: veor >bb10=q6,<bb10=q6,<bb15=q5
veor q6,q6,q5

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:       bb3 = bb15 ^ bb12
# asm 1: veor >bb3=reg128#9,<bb15=reg128#6,<bb12=reg128#3
# asm 2: veor >bb3=q8,<bb15=q5,<bb12=q2
veor q8,q5,q2

# qhasm:       bb2 = bb9 ^ bb10
# asm 1: veor >bb2=reg128#10,<bb9=reg128#2,<bb10=reg128#7
# asm 2: veor >bb2=q9,<bb9=q1,<bb10=q6
veor q9,q1,q6

# qhasm:       bb1 = bb13 ^ bb11
# asm 1: veor >bb1=reg128#11,<bb13=reg128#8,<bb11=reg128#5
# asm 2: veor >bb1=q10,<bb13=q7,<bb11=q4
veor q10,q7,q4

# qhasm:       bb5 = bb10 ^ bb12
# asm 1: veor >bb5=reg128#12,<bb10=reg128#7,<bb12=reg128#3
# asm 2: veor >bb5=q11,<bb10=q6,<bb12=q2
veor q11,q6,q2

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb14=reg128#4,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb14=q3,<bb8=q0
veor q12,q3,q0

# qhasm:       bb0 = bb2 & bb1
# asm 1: vand >bb0=reg128#14,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vand >bb0=q13,<bb2=q9,<bb1=q10
vand q13,q9,q10

# qhasm:       bb6 = bb3 & bb4
# asm 1: vand >bb6=reg128#15,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vand >bb6=q14,<bb3=q8,<bb4=q12
vand q14,q8,q12

# qhasm:       bb7 = bb3 ^ bb2
# asm 1: veor >bb7=reg128#16,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb7=q15,<bb3=q8,<bb2=q9
veor q15,q8,q9

# qhasm:       bb3 |= bb4
# asm 1: vorr >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vorr >bb3=q8,<bb3=q8,<bb4=q12
vorr q8,q8,q12

# qhasm:       bb4 ^= bb1
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb1=reg128#11
# asm 2: veor >bb4=q12,<bb4=q12,<bb1=q10
veor q12,q12,q10

# qhasm:       bb2 |= bb1
# asm 1: vorr >bb2=reg128#10,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vorr >bb2=q9,<bb2=q9,<bb1=q10
vorr q9,q9,q10

# qhasm:       bb7 &= bb4
# asm 1: vand >bb7=reg128#11,<bb7=reg128#16,<bb4=reg128#13
# asm 2: vand >bb7=q10,<bb7=q15,<bb4=q12
vand q10,q15,q12

# qhasm:       bb4 = bb11 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb11=reg128#5,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb11=q4,<bb8=q0
veor q12,q4,q0

# qhasm:       bb3 ^= bb7
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb7=reg128#11
# asm 2: veor >bb3=q8,<bb3=q8,<bb7=q10
veor q8,q8,q10

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb2 ^= bb6
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb6=reg128#15
# asm 2: veor >bb2=q9,<bb2=q9,<bb6=q14
veor q9,q9,q14

# qhasm:       bb3 ^= bb5
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb5=reg128#12
# asm 2: veor >bb3=q8,<bb3=q8,<bb5=q11
veor q8,q8,q11

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#12
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q11
veor q9,q9,q11

# qhasm:       bb5 = bb15 ^ bb9
# asm 1: veor >bb5=reg128#12,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb5=q11,<bb15=q5,<bb9=q1
veor q11,q5,q1

# qhasm:       bb4 = bb13 ^ bb14
# asm 1: veor >bb4=reg128#13,<bb13=reg128#8,<bb14=reg128#4
# asm 2: veor >bb4=q12,<bb13=q7,<bb14=q3
veor q12,q7,q3

# qhasm:       bb0 ^= bb6
# asm 1: veor >bb0=reg128#14,<bb0=reg128#14,<bb6=reg128#15
# asm 2: veor >bb0=q13,<bb0=q13,<bb6=q14
veor q13,q13,q14

# qhasm:       bb1 = bb5 | bb4
# asm 1: vorr >bb1=reg128#16,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vorr >bb1=q15,<bb5=q11,<bb4=q12
vorr q15,q11,q12

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb1 ^= bb7
# asm 1: veor >bb1=reg128#11,<bb1=reg128#16,<bb7=reg128#11
# asm 2: veor >bb1=q10,<bb1=q15,<bb7=q10
veor q10,q15,q10

# qhasm:       bb0 ^= bb5
# asm 1: veor >bb0=reg128#12,<bb0=reg128#14,<bb5=reg128#12
# asm 2: veor >bb0=q11,<bb0=q13,<bb5=q11
veor q11,q13,q11

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#15
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q14
veor q10,q10,q14

# qhasm:       bb4 = bb10 & bb11
# asm 1: vand >bb4=reg128#13,<bb10=reg128#7,<bb11=reg128#5
# asm 2: vand >bb4=q12,<bb10=q6,<bb11=q4
vand q12,q6,q4

# qhasm:       bb5 = bb12 & bb8
# asm 1: vand >bb5=reg128#14,<bb12=reg128#3,<bb8=reg128#1
# asm 2: vand >bb5=q13,<bb12=q2,<bb8=q0
vand q13,q2,q0

# qhasm:       bb3 ^= bb4
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: veor >bb3=q8,<bb3=q8,<bb4=q12
veor q8,q8,q12

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#14
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q13
veor q9,q9,q13

# qhasm:       bb6 = bb9 & bb13
# asm 1: vand >bb6=reg128#13,<bb9=reg128#2,<bb13=reg128#8
# asm 2: vand >bb6=q12,<bb9=q1,<bb13=q7
vand q12,q1,q7

# qhasm:       bb4 = bb3 ^ bb2
# asm 1: veor >bb4=reg128#14,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb4=q13,<bb3=q8,<bb2=q9
veor q13,q8,q9

# qhasm:       bb7 = bb15 | bb14
# asm 1: vorr >bb7=reg128#15,<bb15=reg128#6,<bb14=reg128#4
# asm 2: vorr >bb7=q14,<bb15=q5,<bb14=q3
vorr q14,q5,q3

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#13
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q12
veor q10,q10,q12

# qhasm:       bb0 ^= bb7
# asm 1: veor >bb0=reg128#12,<bb0=reg128#12,<bb7=reg128#15
# asm 2: veor >bb0=q11,<bb0=q11,<bb7=q14
veor q11,q11,q14

# qhasm:       bb3 &= bb1
# asm 1: vand >bb3=reg128#9,<bb3=reg128#9,<bb1=reg128#11
# asm 2: vand >bb3=q8,<bb3=q8,<bb1=q10
vand q8,q8,q10

# qhasm:       bb5 = bb1 ^ bb0
# asm 1: veor >bb5=reg128#13,<bb1=reg128#11,<bb0=reg128#12
# asm 2: veor >bb5=q12,<bb1=q10,<bb0=q11
veor q12,q10,q11

# qhasm:       bb6 = bb0 ^ bb3
# asm 1: veor >bb6=reg128#15,<bb0=reg128#12,<bb3=reg128#9
# asm 2: veor >bb6=q14,<bb0=q11,<bb3=q8
veor q14,q11,q8

# qhasm:       bb3 ^= bb2
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb3=q8,<bb3=q8,<bb2=q9
veor q8,q8,q9

# qhasm:       bb7 = bb4 & bb6
# asm 1: vand >bb7=reg128#16,<bb4=reg128#14,<bb6=reg128#15
# asm 2: vand >bb7=q15,<bb4=q13,<bb6=q14
vand q15,q13,q14

# qhasm:       bb5 &= bb3
# asm 1: vand >bb5=reg128#9,<bb5=reg128#13,<bb3=reg128#9
# asm 2: vand >bb5=q8,<bb5=q12,<bb3=q8
vand q8,q12,q8

# qhasm:       bb7 ^= bb2
# asm 1: veor >bb7=reg128#10,<bb7=reg128#16,<bb2=reg128#10
# asm 2: veor >bb7=q9,<bb7=q15,<bb2=q9
veor q9,q15,q9

# qhasm:       bb5 ^= bb0
# asm 1: veor >bb5=reg128#9,<bb5=reg128#9,<bb0=reg128#12
# asm 2: veor >bb5=q8,<bb5=q8,<bb0=q11
veor q8,q8,q11

# qhasm:       bb2 = bb6 ^ bb5
# asm 1: veor >bb2=reg128#13,<bb6=reg128#15,<bb5=reg128#9
# asm 2: veor >bb2=q12,<bb6=q14,<bb5=q8
veor q12,q14,q8

# qhasm:       bb1 ^= bb5
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb5=reg128#9
# asm 2: veor >bb1=q10,<bb1=q10,<bb5=q8
veor q10,q10,q8

# qhasm:       bb2 &= bb0
# asm 1: vand >bb2=reg128#12,<bb2=reg128#13,<bb0=reg128#12
# asm 2: vand >bb2=q11,<bb2=q12,<bb0=q11
vand q11,q12,q11

# qhasm:       bb0 = bb13 ^ bb11
# asm 1: veor >bb0=reg128#13,<bb13=reg128#8,<bb11=reg128#5
# asm 2: veor >bb0=q12,<bb13=q7,<bb11=q4
veor q12,q7,q4

# qhasm:       bb6 ^= bb2
# asm 1: veor >bb6=reg128#15,<bb6=reg128#15,<bb2=reg128#12
# asm 2: veor >bb6=q14,<bb6=q14,<bb2=q11
veor q14,q14,q11

# qhasm:       bb1 ^= bb2
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb2=reg128#12
# asm 2: veor >bb1=q10,<bb1=q10,<bb2=q11
veor q10,q10,q11

# qhasm:       bb6 &= bb7
# asm 1: vand >bb6=reg128#12,<bb6=reg128#15,<bb7=reg128#10
# asm 2: vand >bb6=q11,<bb6=q14,<bb7=q9
vand q11,q14,q9

# qhasm:       bb6 ^= bb4
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb4=reg128#14
# asm 2: veor >bb6=q11,<bb6=q11,<bb4=q13
veor q11,q11,q13

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#14,<bb14=reg128#4,<bb8=reg128#1
# asm 2: veor >bb4=q13,<bb14=q3,<bb8=q0
veor q13,q3,q0

# qhasm:       bb2 = bb7 ^ bb6
# asm 1: veor >bb2=reg128#15,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb2=q14,<bb7=q9,<bb6=q11
veor q14,q9,q11

# qhasm:       bb2 &= bb14
# asm 1: vand >bb2=reg128#15,<bb2=reg128#15,<bb14=reg128#4
# asm 2: vand >bb2=q14,<bb2=q14,<bb14=q3
vand q14,q14,q3

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb13=reg128#8
# asm 2: veor >bb14=q3,<bb14=q3,<bb13=q7
veor q3,q3,q7

# qhasm:       bb13 &= bb7
# asm 1: vand >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#10
# asm 2: vand >bb13=q7,<bb13=q7,<bb7=q9
vand q7,q7,q9

# qhasm:       bb14 &= bb6
# asm 1: vand >bb14=reg128#4,<bb14=reg128#4,<bb6=reg128#12
# asm 2: vand >bb14=q3,<bb14=q3,<bb6=q11
vand q3,q3,q11

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q11,<bb6=q11,<bb1=q10
veor q11,q11,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#10,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q9,<bb7=q9,<bb5=q8
veor q9,q9,q8

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb13=reg128#8
# asm 2: veor >bb14=q3,<bb14=q3,<bb13=q7
veor q3,q3,q7

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#16,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q15,<bb7=q9,<bb6=q11
veor q15,q9,q11

# qhasm:       bb13 ^= bb2
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb2=reg128#15
# asm 2: veor >bb13=q7,<bb13=q7,<bb2=q14
veor q7,q7,q14

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#15,<bb3=reg128#16,<bb4=reg128#14
# asm 2: vand >bb3=q14,<bb3=q15,<bb4=q13
vand q14,q15,q13

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb0=reg128#13
# asm 2: veor >bb4=q13,<bb4=q13,<bb0=q12
veor q13,q13,q12

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#13,<bb0=reg128#13,<bb7=reg128#10
# asm 2: vand >bb0=q12,<bb0=q12,<bb7=q9
vand q12,q12,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#14,<bb4=reg128#14,<bb6=reg128#12
# asm 2: vand >bb4=q13,<bb4=q13,<bb6=q11
vand q13,q13,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#13,<bb0=reg128#13,<bb4=reg128#14
# asm 2: veor >bb0=q12,<bb0=q12,<bb4=q13
veor q12,q12,q13

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb3=reg128#15
# asm 2: veor >bb4=q13,<bb4=q13,<bb3=q14
veor q13,q13,q14

# qhasm:       bb2 &= bb8
# asm 1: vand >bb2=reg128#15,<bb2=reg128#16,<bb8=reg128#1
# asm 2: vand >bb2=q14,<bb2=q15,<bb8=q0
vand q14,q15,q0

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#5
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q4
veor q0,q0,q4

# qhasm:       bb11 &= bb5
# asm 1: vand >bb11=reg128#5,<bb11=reg128#5,<bb5=reg128#9
# asm 2: vand >bb11=q4,<bb11=q4,<bb5=q8
vand q4,q4,q8

# qhasm:       bb8 &= bb1
# asm 1: vand >bb8=reg128#1,<bb8=reg128#1,<bb1=reg128#11
# asm 2: vand >bb8=q0,<bb8=q0,<bb1=q10
vand q0,q0,q10

# qhasm:       bb14 ^= bb4
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb4=reg128#14
# asm 2: veor >bb14=q3,<bb14=q3,<bb4=q13
veor q3,q3,q13

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#5
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q4
veor q0,q0,q4

# qhasm:       bb11 ^= bb2
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb2=reg128#15
# asm 2: veor >bb11=q4,<bb11=q4,<bb2=q14
veor q4,q4,q14

# qhasm:       bb8 ^= bb4
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb4=reg128#14
# asm 2: veor >bb8=q0,<bb8=q0,<bb4=q13
veor q0,q0,q13

# qhasm:       bb13 ^= bb0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb0=reg128#13
# asm 2: veor >bb13=q7,<bb13=q7,<bb0=q12
veor q7,q7,q12

# qhasm:       bb11 ^= bb0
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb0=reg128#13
# asm 2: veor >bb11=q4,<bb11=q4,<bb0=q12
veor q4,q4,q12

# qhasm:       bb4 = bb15 ^ bb12
# asm 1: veor >bb4=reg128#13,<bb15=reg128#6,<bb12=reg128#3
# asm 2: veor >bb4=q12,<bb15=q5,<bb12=q2
veor q12,q5,q2

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#14,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q13,<bb7=q9,<bb6=q11
veor q13,q9,q11

# qhasm:       bb0 = bb9 ^ bb10
# asm 1: veor >bb0=reg128#15,<bb9=reg128#2,<bb10=reg128#7
# asm 2: veor >bb0=q14,<bb9=q1,<bb10=q6
veor q14,q1,q6

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#14,<bb3=reg128#14,<bb4=reg128#13
# asm 2: vand >bb3=q13,<bb3=q13,<bb4=q12
vand q13,q13,q12

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb0=reg128#15
# asm 2: veor >bb4=q12,<bb4=q12,<bb0=q14
veor q12,q12,q14

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#15,<bb0=reg128#15,<bb7=reg128#10
# asm 2: vand >bb0=q14,<bb0=q14,<bb7=q9
vand q14,q14,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#13,<bb4=reg128#13,<bb6=reg128#12
# asm 2: vand >bb4=q12,<bb4=q12,<bb6=q11
vand q12,q12,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#15,<bb0=reg128#15,<bb4=reg128#13
# asm 2: veor >bb0=q14,<bb0=q14,<bb4=q12
veor q14,q14,q12

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb3=reg128#14
# asm 2: veor >bb4=q12,<bb4=q12,<bb3=q13
veor q12,q12,q13

# qhasm:       bb2 &= bb12
# asm 1: vand >bb2=reg128#14,<bb2=reg128#16,<bb12=reg128#3
# asm 2: vand >bb2=q13,<bb2=q15,<bb12=q2
vand q13,q15,q2

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb10=reg128#7
# asm 2: veor >bb12=q2,<bb12=q2,<bb10=q6
veor q2,q2,q6

# qhasm:       bb10 &= bb5
# asm 1: vand >bb10=reg128#7,<bb10=reg128#7,<bb5=reg128#9
# asm 2: vand >bb10=q6,<bb10=q6,<bb5=q8
vand q6,q6,q8

# qhasm:       bb12 &= bb1
# asm 1: vand >bb12=reg128#3,<bb12=reg128#3,<bb1=reg128#11
# asm 2: vand >bb12=q2,<bb12=q2,<bb1=q10
vand q2,q2,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#9,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q8,<bb7=q9,<bb5=q8
veor q8,q9,q8

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#10,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q9,<bb6=q11,<bb1=q10
veor q9,q11,q10

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb10=reg128#7
# asm 2: veor >bb12=q2,<bb12=q2,<bb10=q6
veor q2,q2,q6

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#11,<bb7=reg128#9,<bb6=reg128#10
# asm 2: veor >bb3=q10,<bb7=q8,<bb6=q9
veor q10,q8,q9

# qhasm:       bb10 ^= bb2
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb2=reg128#14
# asm 2: veor >bb10=q6,<bb10=q6,<bb2=q13
veor q6,q6,q13

# qhasm:       bb3 &= bb15
# asm 1: vand >bb3=reg128#11,<bb3=reg128#11,<bb15=reg128#6
# asm 2: vand >bb3=q10,<bb3=q10,<bb15=q5
vand q10,q10,q5

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 &= bb7
# asm 1: vand >bb9=reg128#2,<bb9=reg128#2,<bb7=reg128#9
# asm 2: vand >bb9=q1,<bb9=q1,<bb7=q8
vand q1,q1,q8

# qhasm:       bb15 &= bb6
# asm 1: vand >bb15=reg128#6,<bb15=reg128#6,<bb6=reg128#10
# asm 2: vand >bb15=q5,<bb15=q5,<bb6=q9
vand q5,q5,q9

# qhasm:       bb12 ^= bb4
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb4=reg128#13
# asm 2: veor >bb12=q2,<bb12=q2,<bb4=q12
veor q2,q2,q12

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 ^= bb3
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb3=reg128#11
# asm 2: veor >bb9=q1,<bb9=q1,<bb3=q10
veor q1,q1,q10

# qhasm:       bb15 ^= bb4
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb4=reg128#13
# asm 2: veor >bb15=q5,<bb15=q5,<bb4=q12
veor q5,q5,q12

# qhasm:       bb9 ^= bb0
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb0=reg128#15
# asm 2: veor >bb9=q1,<bb9=q1,<bb0=q14
veor q1,q1,q14

# qhasm:       bb10 ^= bb0
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb0=reg128#15
# asm 2: veor >bb10=q6,<bb10=q6,<bb0=q14
veor q6,q6,q14

# qhasm:     bb15 ^= bb8
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb8=reg128#1
# asm 2: veor >bb15=q5,<bb15=q5,<bb8=q0
veor q5,q5,q0

# qhasm:     bb9 ^= bb14
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb14=reg128#4
# asm 2: veor >bb9=q1,<bb9=q1,<bb14=q3
veor q1,q1,q3

# qhasm:     bb12 ^= bb15
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb15=reg128#6
# asm 2: veor >bb12=q2,<bb12=q2,<bb15=q5
veor q2,q2,q5

# qhasm:     bb14 ^= bb8
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb8=reg128#1
# asm 2: veor >bb14=q3,<bb14=q3,<bb8=q0
veor q3,q3,q0

# qhasm:     bb8 ^= bb9
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb9=reg128#2
# asm 2: veor >bb8=q0,<bb8=q0,<bb9=q1
veor q0,q0,q1

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:     bb13 ^= bb10
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb10=reg128#7
# asm 2: veor >bb13=q7,<bb13=q7,<bb10=q6
veor q7,q7,q6

# qhasm:     bb10 ^= bb11
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb11=reg128#5
# asm 2: veor >bb10=q6,<bb10=q6,<bb11=q4
veor q6,q6,q4

# qhasm:     bb11 ^= bb13
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb13=reg128#8
# asm 2: veor >bb11=q4,<bb11=q4,<bb13=q7
veor q4,q4,q7

# qhasm:     bb0 = bb8[3]bb8[0,1,2]
# asm 1: vext.32 >bb0=reg128#9,<bb8=reg128#1,<bb8=reg128#1,#3
# asm 2: vext.32 >bb0=q8,<bb8=q0,<bb8=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb13=reg128#8
# asm 2: veor >bb12=q2,<bb12=q2,<bb13=q7
veor q2,q2,q7

# qhasm:     bb1 = bb9[3]bb9[0,1,2]
# asm 1: vext.32 >bb1=reg128#10,<bb9=reg128#2,<bb9=reg128#2,#3
# asm 2: vext.32 >bb1=q9,<bb9=q1,<bb9=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb11=reg128#5
# asm 2: veor >bb14=q3,<bb14=q3,<bb11=q4
veor q3,q3,q4

# qhasm:     bb2 = bb12[3]bb12[0,1,2]
# asm 1: vext.32 >bb2=reg128#11,<bb12=reg128#3,<bb12=reg128#3,#3
# asm 2: vext.32 >bb2=q10,<bb12=q2,<bb12=q2,#3
vext.32 q10,q2,q2,#3

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb3 = bb14[3]bb14[0,1,2]
# asm 1: vext.32 >bb3=reg128#12,<bb14=reg128#4,<bb14=reg128#4,#3
# asm 2: vext.32 >bb3=q11,<bb14=q3,<bb14=q3,#3
vext.32 q11,q3,q3,#3

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     bb4 = bb11[3]bb11[0,1,2]
# asm 1: vext.32 >bb4=reg128#13,<bb11=reg128#5,<bb11=reg128#5,#3
# asm 2: vext.32 >bb4=q12,<bb11=q4,<bb11=q4,#3
vext.32 q12,q4,q4,#3

# qhasm:     bb12 ^= bb2
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb2=reg128#11
# asm 2: veor >bb12=q2,<bb12=q2,<bb2=q10
veor q2,q2,q10

# qhasm:     bb7 = bb13[3]bb13[0,1,2]
# asm 1: vext.32 >bb7=reg128#14,<bb13=reg128#8,<bb13=reg128#8,#3
# asm 2: vext.32 >bb7=q13,<bb13=q7,<bb13=q7,#3
vext.32 q13,q7,q7,#3

# qhasm:     bb14 ^= bb3
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb3=reg128#12
# asm 2: veor >bb14=q3,<bb14=q3,<bb3=q11
veor q3,q3,q11

# qhasm:     bb5 = bb15[3]bb15[0,1,2]
# asm 1: vext.32 >bb5=reg128#15,<bb15=reg128#6,<bb15=reg128#6,#3
# asm 2: vext.32 >bb5=q14,<bb15=q5,<bb15=q5,#3
vext.32 q14,q5,q5,#3

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb4=reg128#13
# asm 2: veor >bb11=q4,<bb11=q4,<bb4=q12
veor q4,q4,q12

# qhasm:     bb6 = bb10[3]bb10[0,1,2]
# asm 1: vext.32 >bb6=reg128#16,<bb10=reg128#7,<bb10=reg128#7,#3
# asm 2: vext.32 >bb6=q15,<bb10=q6,<bb10=q6,#3
vext.32 q15,q6,q6,#3

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb7=q13
veor q7,q7,q13

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb5=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb5=q14
veor q5,q5,q14

# qhasm:     bb10 ^= bb6
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb6=reg128#16
# asm 2: veor >bb10=q6,<bb10=q6,<bb6=q15
veor q6,q6,q15

# qhasm:     bb1 ^= bb8
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb8=reg128#1
# asm 2: veor >bb1=q9,<bb1=q9,<bb8=q0
veor q9,q9,q0

# qhasm:     bb0 ^= bb13
# asm 1: veor >bb0=reg128#9,<bb0=reg128#9,<bb13=reg128#8
# asm 2: veor >bb0=q8,<bb0=q8,<bb13=q7
veor q8,q8,q7

# qhasm:     bb2 ^= bb9
# asm 1: veor >bb2=reg128#11,<bb2=reg128#11,<bb9=reg128#2
# asm 2: veor >bb2=q10,<bb2=q10,<bb9=q1
veor q10,q10,q1

# qhasm:     bb1 ^= bb13
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb13=reg128#8
# asm 2: veor >bb1=q9,<bb1=q9,<bb13=q7
veor q9,q9,q7

# qhasm:     bb8 = bb8[2,3]bb8[0,1]
# asm 1: vswp <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vswp <bb8=d0,<bb8=d1
vswp d0,d1

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb12=reg128#3
# asm 2: veor >bb3=q11,<bb3=q11,<bb12=q2
veor q11,q11,q2

# qhasm:     bb9 = bb9[2,3]bb9[0,1]
# asm 1: vswp <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vswp <bb9=d2,<bb9=d3
vswp d2,d3

# qhasm:     bb4 ^= bb14
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb14=reg128#4
# asm 2: veor >bb4=q12,<bb4=q12,<bb14=q3
veor q12,q12,q3

# qhasm:     bb12 = bb12[2,3]bb12[0,1]
# asm 1: vswp <bb12=reg128#3%bot,<bb12=reg128#3%top
# asm 2: vswp <bb12=d4,<bb12=d5
vswp d4,d5

# qhasm:     bb5 ^= bb11
# asm 1: veor >bb5=reg128#15,<bb5=reg128#15,<bb11=reg128#5
# asm 2: veor >bb5=q14,<bb5=q14,<bb11=q4
veor q14,q14,q4

# qhasm:     bb14 = bb14[2,3]bb14[0,1]
# asm 1: vswp <bb14=reg128#4%bot,<bb14=reg128#4%top
# asm 2: vswp <bb14=d6,<bb14=d7
vswp d6,d7

# qhasm:     bb3 ^= bb13
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb13=reg128#8
# asm 2: veor >bb3=q11,<bb3=q11,<bb13=q7
veor q11,q11,q7

# qhasm:     bb11 = bb11[2,3]bb11[0,1]
# asm 1: vswp <bb11=reg128#5%bot,<bb11=reg128#5%top
# asm 2: vswp <bb11=d8,<bb11=d9
vswp d8,d9

# qhasm:     bb6 ^= bb15
# asm 1: veor >bb6=reg128#16,<bb6=reg128#16,<bb15=reg128#6
# asm 2: veor >bb6=q15,<bb6=q15,<bb15=q5
veor q15,q15,q5

# qhasm:     bb15 = bb15[2,3]bb15[0,1]
# asm 1: vswp <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vswp <bb15=d10,<bb15=d11
vswp d10,d11

# qhasm:     bb7 ^= bb10
# asm 1: veor >bb7=reg128#14,<bb7=reg128#14,<bb10=reg128#7
# asm 2: veor >bb7=q13,<bb7=q13,<bb10=q6
veor q13,q13,q6

# qhasm:     bb10 = bb10[2,3]bb10[0,1]
# asm 1: vswp <bb10=reg128#7%bot,<bb10=reg128#7%top
# asm 2: vswp <bb10=d12,<bb10=d13
vswp d12,d13

# qhasm:     bb4 ^= bb13
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb13=reg128#8
# asm 2: veor >bb4=q12,<bb4=q12,<bb13=q7
veor q12,q12,q7

# qhasm:     bb13 = bb13[2,3]bb13[0,1]
# asm 1: vswp <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vswp <bb13=d14,<bb13=d15
vswp d14,d15

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#9,<bb8=reg128#1
# asm 2: veor >bb0=q0,<bb0=q8,<bb8=q0
veor q0,q8,q0

# qhasm:     bb8 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb8=reg128#9%bot->bb8=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb8=d16->bb8=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#10,<bb9=reg128#2
# asm 2: veor >bb1=q1,<bb1=q9,<bb9=q1
veor q1,q9,q1

# qhasm:     bb9 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb9=reg128#10%bot->bb9=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb9=d18->bb9=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb6 ^= bb10
# asm 1: veor >bb6=reg128#7,<bb6=reg128#16,<bb10=reg128#7
# asm 2: veor >bb6=q6,<bb6=q15,<bb10=q6
veor q6,q15,q6

# qhasm:     bb10 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb10=reg128#16%bot->bb10=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb10=d30->bb10=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb4 ^= bb11
# asm 1: veor >bb4=reg128#5,<bb4=reg128#13,<bb11=reg128#5
# asm 2: veor >bb4=q4,<bb4=q12,<bb11=q4
veor q4,q12,q4

# qhasm:     bb11 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb11=reg128#13%bot->bb11=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb11=d24->bb11=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb2 ^= bb12
# asm 1: veor >bb2=reg128#3,<bb2=reg128#11,<bb12=reg128#3
# asm 2: veor >bb2=q2,<bb2=q10,<bb12=q2
veor q2,q10,q2

# qhasm:     bb12 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb12=reg128#11%bot->bb12=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb12=d20->bb12=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#14,<bb13=reg128#8
# asm 2: veor >bb7=q7,<bb7=q13,<bb13=q7
veor q7,q13,q7

# qhasm:     bb13 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb13=reg128#14%bot->bb13=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb13=d26->bb13=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb3 ^= bb14
# asm 1: veor >bb3=reg128#4,<bb3=reg128#12,<bb14=reg128#4
# asm 2: veor >bb3=q3,<bb3=q11,<bb14=q3
veor q3,q11,q3

# qhasm:     bb14 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb14=reg128#12%bot->bb14=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb14=d22->bb14=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#15,<bb15=reg128#6
# asm 2: veor >bb5=q5,<bb5=q14,<bb15=q5
veor q5,q14,q5

# qhasm:     bb15 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb15=reg128#15%bot->bb15=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb15=d28->bb15=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb2 ^= bb10
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb10=reg128#16
# asm 2: veor >bb2=q2,<bb2=q2,<bb10=q15
veor q2,q2,q15

# qhasm:     bb5 ^= bb13
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb13=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb13=q13
veor q5,q5,q13

# qhasm:       bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb1=reg128#2%bot,{<bb1=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb1=d2,{<bb1=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb1=reg128#2%top,{<bb1=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb1=d3,{<bb1=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb3 ^= bb11
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb11=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb11=q12
veor q3,q3,q12

# qhasm:       bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb2=reg128#3%bot,{<bb2=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb2=d4,{<bb2=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb2=reg128#3%top,{<bb2=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb2=d5,{<bb2=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb6 ^= bb14
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb14=reg128#12
# asm 2: veor >bb6=q6,<bb6=q6,<bb14=q11
veor q6,q6,q11

# qhasm:     bb7 ^= bb15
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb15=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb15=q14
veor q7,q7,q14

# qhasm:       bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb5=reg128#6%bot,{<bb5=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb5=d10,{<bb5=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb5=reg128#6%top,{<bb5=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb5=d11,{<bb5=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb4 ^= bb12
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb12=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<bb12=q10
veor q4,q4,q10

# qhasm:       bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb0=reg128#1%bot,{<bb0=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb0=d0,{<bb0=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb0=reg128#1%top,{<bb0=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb0=d1,{<bb0=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb2 ^= bb1
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb1=reg128#2
# asm 2: veor >bb2=q2,<bb2=q2,<bb1=q1
veor q2,q2,q1

# qhasm:       bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb3=reg128#4%bot,{<bb3=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb3=d6,{<bb3=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb3=reg128#4%top,{<bb3=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb3=d7,{<bb3=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb5 ^= bb0
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb0=reg128#1
# asm 2: veor >bb5=q5,<bb5=q5,<bb0=q0
veor q5,q5,q0

# qhasm:       bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb6=reg128#7%bot,{<bb6=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb6=d12,{<bb6=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb6=reg128#7%top,{<bb6=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb6=d13,{<bb6=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb3 ^= bb0
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb0=reg128#1
# asm 2: veor >bb3=q3,<bb3=q3,<bb0=q0
veor q3,q3,q0

# qhasm:       bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb7=reg128#8%bot,{<bb7=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb7=d14,{<bb7=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb7=reg128#8%top,{<bb7=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb7=d15,{<bb7=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb5 ^= bb6
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb6=reg128#7
# asm 2: veor >bb5=q5,<bb5=q5,<bb6=q6
veor q5,q5,q6

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb3=reg128#4
# asm 2: veor >bb6=q6,<bb6=q6,<bb3=q3
veor q6,q6,q3

# qhasm:     bb3 ^= bb7
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb7=reg128#8
# asm 2: veor >bb3=q3,<bb3=q3,<bb7=q7
veor q3,q3,q7

# qhasm:       bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb4=reg128#5%bot,{<bb4=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb4=d8,{<bb4=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb4=reg128#5%top,{<bb4=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb4=d9,{<bb4=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb6 ^= bb2
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb2=reg128#3
# asm 2: veor >bb6=q6,<bb6=q6,<bb2=q2
veor q6,q6,q2

# qhasm:     bb7 ^= bb5
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb5=reg128#6
# asm 2: veor >bb7=q7,<bb7=q7,<bb5=q5
veor q7,q7,q5

# qhasm:     bb3 ^= bb4
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb4=reg128#5
# asm 2: veor >bb3=q3,<bb3=q3,<bb4=q4
veor q3,q3,q4

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb5=reg128#6
# asm 2: veor >bb4=q4,<bb4=q4,<bb5=q5
veor q4,q4,q5

# qhasm:     bb3 ^= bb1
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb1=reg128#2
# asm 2: veor >bb3=q3,<bb3=q3,<bb1=q1
veor q3,q3,q1

# qhasm:     bb2 ^= bb7
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb7=reg128#8
# asm 2: veor >bb2=q2,<bb2=q2,<bb7=q7
veor q2,q2,q7

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:       bb11 = bb7 ^ bb4
# asm 1: veor >bb11=reg128#9,<bb7=reg128#8,<bb4=reg128#5
# asm 2: veor >bb11=q8,<bb7=q7,<bb4=q4
veor q8,q7,q4

# qhasm:       bb10 = bb1 ^ bb2
# asm 1: veor >bb10=reg128#10,<bb1=reg128#2,<bb2=reg128#3
# asm 2: veor >bb10=q9,<bb1=q1,<bb2=q2
veor q9,q1,q2

# qhasm:       bb9 = bb5 ^ bb3
# asm 1: veor >bb9=reg128#11,<bb5=reg128#6,<bb3=reg128#4
# asm 2: veor >bb9=q10,<bb5=q5,<bb3=q3
veor q10,q5,q3

# qhasm:       bb13 = bb2 ^ bb4
# asm 1: veor >bb13=reg128#12,<bb2=reg128#3,<bb4=reg128#5
# asm 2: veor >bb13=q11,<bb2=q2,<bb4=q4
veor q11,q2,q4

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb6=q6,<bb0=q0
veor q12,q6,q0

# qhasm:       bb8 = bb10 & bb9
# asm 1: vand >bb8=reg128#14,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vand >bb8=q13,<bb10=q9,<bb9=q10
vand q13,q9,q10

# qhasm:       bb14 = bb11 & bb12
# asm 1: vand >bb14=reg128#15,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vand >bb14=q14,<bb11=q8,<bb12=q12
vand q14,q8,q12

# qhasm:       bb15 = bb11 ^ bb10
# asm 1: veor >bb15=reg128#16,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb15=q15,<bb11=q8,<bb10=q9
veor q15,q8,q9

# qhasm:       bb11 |= bb12
# asm 1: vorr >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vorr >bb11=q8,<bb11=q8,<bb12=q12
vorr q8,q8,q12

# qhasm:       bb12 ^= bb9
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb9=reg128#11
# asm 2: veor >bb12=q12,<bb12=q12,<bb9=q10
veor q12,q12,q10

# qhasm:       bb10 |= bb9
# asm 1: vorr >bb10=reg128#10,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vorr >bb10=q9,<bb10=q9,<bb9=q10
vorr q9,q9,q10

# qhasm:       bb15 &= bb12
# asm 1: vand >bb15=reg128#11,<bb15=reg128#16,<bb12=reg128#13
# asm 2: vand >bb15=q10,<bb15=q15,<bb12=q12
vand q10,q15,q12

# qhasm:       bb12 = bb3 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb3=reg128#4,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb3=q3,<bb0=q0
veor q12,q3,q0

# qhasm:       bb11 ^= bb15
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb15=reg128#11
# asm 2: veor >bb11=q8,<bb11=q8,<bb15=q10
veor q8,q8,q10

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb10 ^= bb14
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb14=reg128#15
# asm 2: veor >bb10=q9,<bb10=q9,<bb14=q14
veor q9,q9,q14

# qhasm:       bb11 ^= bb13
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb13=reg128#12
# asm 2: veor >bb11=q8,<bb11=q8,<bb13=q11
veor q8,q8,q11

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#12
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q11
veor q9,q9,q11

# qhasm:       bb13 = bb7 ^ bb1
# asm 1: veor >bb13=reg128#12,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb13=q11,<bb7=q7,<bb1=q1
veor q11,q7,q1

# qhasm:       bb12 = bb5 ^ bb6
# asm 1: veor >bb12=reg128#13,<bb5=reg128#6,<bb6=reg128#7
# asm 2: veor >bb12=q12,<bb5=q5,<bb6=q6
veor q12,q5,q6

# qhasm:       bb8 ^= bb14
# asm 1: veor >bb8=reg128#14,<bb8=reg128#14,<bb14=reg128#15
# asm 2: veor >bb8=q13,<bb8=q13,<bb14=q14
veor q13,q13,q14

# qhasm:       bb9 = bb13 | bb12
# asm 1: vorr >bb9=reg128#16,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vorr >bb9=q15,<bb13=q11,<bb12=q12
vorr q15,q11,q12

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb9 ^= bb15
# asm 1: veor >bb9=reg128#11,<bb9=reg128#16,<bb15=reg128#11
# asm 2: veor >bb9=q10,<bb9=q15,<bb15=q10
veor q10,q15,q10

# qhasm:       bb8 ^= bb13
# asm 1: veor >bb8=reg128#12,<bb8=reg128#14,<bb13=reg128#12
# asm 2: veor >bb8=q11,<bb8=q13,<bb13=q11
veor q11,q13,q11

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#15
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q14
veor q10,q10,q14

# qhasm:       bb12 = bb2 & bb3
# asm 1: vand >bb12=reg128#13,<bb2=reg128#3,<bb3=reg128#4
# asm 2: vand >bb12=q12,<bb2=q2,<bb3=q3
vand q12,q2,q3

# qhasm:       bb13 = bb4 & bb0
# asm 1: vand >bb13=reg128#14,<bb4=reg128#5,<bb0=reg128#1
# asm 2: vand >bb13=q13,<bb4=q4,<bb0=q0
vand q13,q4,q0

# qhasm:       bb11 ^= bb12
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: veor >bb11=q8,<bb11=q8,<bb12=q12
veor q8,q8,q12

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#14
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q13
veor q9,q9,q13

# qhasm:       bb14 = bb1 & bb5
# asm 1: vand >bb14=reg128#13,<bb1=reg128#2,<bb5=reg128#6
# asm 2: vand >bb14=q12,<bb1=q1,<bb5=q5
vand q12,q1,q5

# qhasm:       bb12 = bb11 ^ bb10
# asm 1: veor >bb12=reg128#14,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb12=q13,<bb11=q8,<bb10=q9
veor q13,q8,q9

# qhasm:       bb15 = bb7 | bb6
# asm 1: vorr >bb15=reg128#15,<bb7=reg128#8,<bb6=reg128#7
# asm 2: vorr >bb15=q14,<bb7=q7,<bb6=q6
vorr q14,q7,q6

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#13
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q12
veor q10,q10,q12

# qhasm:       bb8 ^= bb15
# asm 1: veor >bb8=reg128#12,<bb8=reg128#12,<bb15=reg128#15
# asm 2: veor >bb8=q11,<bb8=q11,<bb15=q14
veor q11,q11,q14

# qhasm:       bb11 &= bb9
# asm 1: vand >bb11=reg128#9,<bb11=reg128#9,<bb9=reg128#11
# asm 2: vand >bb11=q8,<bb11=q8,<bb9=q10
vand q8,q8,q10

# qhasm:       bb13 = bb9 ^ bb8
# asm 1: veor >bb13=reg128#13,<bb9=reg128#11,<bb8=reg128#12
# asm 2: veor >bb13=q12,<bb9=q10,<bb8=q11
veor q12,q10,q11

# qhasm:       bb14 = bb8 ^ bb11
# asm 1: veor >bb14=reg128#15,<bb8=reg128#12,<bb11=reg128#9
# asm 2: veor >bb14=q14,<bb8=q11,<bb11=q8
veor q14,q11,q8

# qhasm:       bb11 ^= bb10
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb11=q8,<bb11=q8,<bb10=q9
veor q8,q8,q9

# qhasm:       bb15 = bb12 & bb14
# asm 1: vand >bb15=reg128#16,<bb12=reg128#14,<bb14=reg128#15
# asm 2: vand >bb15=q15,<bb12=q13,<bb14=q14
vand q15,q13,q14

# qhasm:       bb13 &= bb11
# asm 1: vand >bb13=reg128#9,<bb13=reg128#13,<bb11=reg128#9
# asm 2: vand >bb13=q8,<bb13=q12,<bb11=q8
vand q8,q12,q8

# qhasm:       bb15 ^= bb10
# asm 1: veor >bb15=reg128#10,<bb15=reg128#16,<bb10=reg128#10
# asm 2: veor >bb15=q9,<bb15=q15,<bb10=q9
veor q9,q15,q9

# qhasm:       bb13 ^= bb8
# asm 1: veor >bb13=reg128#9,<bb13=reg128#9,<bb8=reg128#12
# asm 2: veor >bb13=q8,<bb13=q8,<bb8=q11
veor q8,q8,q11

# qhasm:       bb10 = bb14 ^ bb13
# asm 1: veor >bb10=reg128#13,<bb14=reg128#15,<bb13=reg128#9
# asm 2: veor >bb10=q12,<bb14=q14,<bb13=q8
veor q12,q14,q8

# qhasm:       bb9 ^= bb13
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb13=reg128#9
# asm 2: veor >bb9=q10,<bb9=q10,<bb13=q8
veor q10,q10,q8

# qhasm:       bb10 &= bb8
# asm 1: vand >bb10=reg128#12,<bb10=reg128#13,<bb8=reg128#12
# asm 2: vand >bb10=q11,<bb10=q12,<bb8=q11
vand q11,q12,q11

# qhasm:       bb8 = bb5 ^ bb3
# asm 1: veor >bb8=reg128#13,<bb5=reg128#6,<bb3=reg128#4
# asm 2: veor >bb8=q12,<bb5=q5,<bb3=q3
veor q12,q5,q3

# qhasm:       bb14 ^= bb10
# asm 1: veor >bb14=reg128#15,<bb14=reg128#15,<bb10=reg128#12
# asm 2: veor >bb14=q14,<bb14=q14,<bb10=q11
veor q14,q14,q11

# qhasm:       bb9 ^= bb10
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb10=reg128#12
# asm 2: veor >bb9=q10,<bb9=q10,<bb10=q11
veor q10,q10,q11

# qhasm:       bb14 &= bb15
# asm 1: vand >bb14=reg128#12,<bb14=reg128#15,<bb15=reg128#10
# asm 2: vand >bb14=q11,<bb14=q14,<bb15=q9
vand q11,q14,q9

# qhasm:       bb14 ^= bb12
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb12=reg128#14
# asm 2: veor >bb14=q11,<bb14=q11,<bb12=q13
veor q11,q11,q13

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#14,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb12=q13,<bb6=q6,<bb0=q0
veor q13,q6,q0

# qhasm:       bb10 = bb15 ^ bb14
# asm 1: veor >bb10=reg128#15,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb10=q14,<bb15=q9,<bb14=q11
veor q14,q9,q11

# qhasm:       bb10 &= bb6
# asm 1: vand >bb10=reg128#15,<bb10=reg128#15,<bb6=reg128#7
# asm 2: vand >bb10=q14,<bb10=q14,<bb6=q6
vand q14,q14,q6

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb5=reg128#6
# asm 2: veor >bb6=q6,<bb6=q6,<bb5=q5
veor q6,q6,q5

# qhasm:       bb5 &= bb15
# asm 1: vand >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#10
# asm 2: vand >bb5=q5,<bb5=q5,<bb15=q9
vand q5,q5,q9

# qhasm:       bb6 &= bb14
# asm 1: vand >bb6=reg128#7,<bb6=reg128#7,<bb14=reg128#12
# asm 2: vand >bb6=q6,<bb6=q6,<bb14=q11
vand q6,q6,q11

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q11,<bb14=q11,<bb9=q10
veor q11,q11,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#10,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q9,<bb15=q9,<bb13=q8
veor q9,q9,q8

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb5=reg128#6
# asm 2: veor >bb6=q6,<bb6=q6,<bb5=q5
veor q6,q6,q5

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#16,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q15,<bb15=q9,<bb14=q11
veor q15,q9,q11

# qhasm:       bb5 ^= bb10
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb10=reg128#15
# asm 2: veor >bb5=q5,<bb5=q5,<bb10=q14
veor q5,q5,q14

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#15,<bb11=reg128#16,<bb12=reg128#14
# asm 2: vand >bb11=q14,<bb11=q15,<bb12=q13
vand q14,q15,q13

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb8=reg128#13
# asm 2: veor >bb12=q13,<bb12=q13,<bb8=q12
veor q13,q13,q12

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#13,<bb8=reg128#13,<bb15=reg128#10
# asm 2: vand >bb8=q12,<bb8=q12,<bb15=q9
vand q12,q12,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#14,<bb12=reg128#14,<bb14=reg128#12
# asm 2: vand >bb12=q13,<bb12=q13,<bb14=q11
vand q13,q13,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#13,<bb8=reg128#13,<bb12=reg128#14
# asm 2: veor >bb8=q12,<bb8=q12,<bb12=q13
veor q12,q12,q13

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb11=reg128#15
# asm 2: veor >bb12=q13,<bb12=q13,<bb11=q14
veor q13,q13,q14

# qhasm:       bb10 &= bb0
# asm 1: vand >bb10=reg128#15,<bb10=reg128#16,<bb0=reg128#1
# asm 2: vand >bb10=q14,<bb10=q15,<bb0=q0
vand q14,q15,q0

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#4
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q3
veor q0,q0,q3

# qhasm:       bb3 &= bb13
# asm 1: vand >bb3=reg128#4,<bb3=reg128#4,<bb13=reg128#9
# asm 2: vand >bb3=q3,<bb3=q3,<bb13=q8
vand q3,q3,q8

# qhasm:       bb0 &= bb9
# asm 1: vand >bb0=reg128#1,<bb0=reg128#1,<bb9=reg128#11
# asm 2: vand >bb0=q0,<bb0=q0,<bb9=q10
vand q0,q0,q10

# qhasm:       bb6 ^= bb12
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb12=reg128#14
# asm 2: veor >bb6=q6,<bb6=q6,<bb12=q13
veor q6,q6,q13

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#4
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q3
veor q0,q0,q3

# qhasm:       bb3 ^= bb10
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb10=reg128#15
# asm 2: veor >bb3=q3,<bb3=q3,<bb10=q14
veor q3,q3,q14

# qhasm:       bb0 ^= bb12
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb12=reg128#14
# asm 2: veor >bb0=q0,<bb0=q0,<bb12=q13
veor q0,q0,q13

# qhasm:       bb5 ^= bb8
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb8=reg128#13
# asm 2: veor >bb5=q5,<bb5=q5,<bb8=q12
veor q5,q5,q12

# qhasm:       bb3 ^= bb8
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb8=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb8=q12
veor q3,q3,q12

# qhasm:       bb12 = bb7 ^ bb4
# asm 1: veor >bb12=reg128#13,<bb7=reg128#8,<bb4=reg128#5
# asm 2: veor >bb12=q12,<bb7=q7,<bb4=q4
veor q12,q7,q4

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#14,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q13,<bb15=q9,<bb14=q11
veor q13,q9,q11

# qhasm:       bb8 = bb1 ^ bb2
# asm 1: veor >bb8=reg128#15,<bb1=reg128#2,<bb2=reg128#3
# asm 2: veor >bb8=q14,<bb1=q1,<bb2=q2
veor q14,q1,q2

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#14,<bb11=reg128#14,<bb12=reg128#13
# asm 2: vand >bb11=q13,<bb11=q13,<bb12=q12
vand q13,q13,q12

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb8=reg128#15
# asm 2: veor >bb12=q12,<bb12=q12,<bb8=q14
veor q12,q12,q14

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#15,<bb8=reg128#15,<bb15=reg128#10
# asm 2: vand >bb8=q14,<bb8=q14,<bb15=q9
vand q14,q14,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#13,<bb12=reg128#13,<bb14=reg128#12
# asm 2: vand >bb12=q12,<bb12=q12,<bb14=q11
vand q12,q12,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#15,<bb8=reg128#15,<bb12=reg128#13
# asm 2: veor >bb8=q14,<bb8=q14,<bb12=q12
veor q14,q14,q12

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb11=reg128#14
# asm 2: veor >bb12=q12,<bb12=q12,<bb11=q13
veor q12,q12,q13

# qhasm:       bb10 &= bb4
# asm 1: vand >bb10=reg128#14,<bb10=reg128#16,<bb4=reg128#5
# asm 2: vand >bb10=q13,<bb10=q15,<bb4=q4
vand q13,q15,q4

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb2=reg128#3
# asm 2: veor >bb4=q4,<bb4=q4,<bb2=q2
veor q4,q4,q2

# qhasm:       bb2 &= bb13
# asm 1: vand >bb2=reg128#3,<bb2=reg128#3,<bb13=reg128#9
# asm 2: vand >bb2=q2,<bb2=q2,<bb13=q8
vand q2,q2,q8

# qhasm:       bb4 &= bb9
# asm 1: vand >bb4=reg128#5,<bb4=reg128#5,<bb9=reg128#11
# asm 2: vand >bb4=q4,<bb4=q4,<bb9=q10
vand q4,q4,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#9,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q8,<bb15=q9,<bb13=q8
veor q8,q9,q8

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#10,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q9,<bb14=q11,<bb9=q10
veor q9,q11,q10

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb2=reg128#3
# asm 2: veor >bb4=q4,<bb4=q4,<bb2=q2
veor q4,q4,q2

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#11,<bb15=reg128#9,<bb14=reg128#10
# asm 2: veor >bb11=q10,<bb15=q8,<bb14=q9
veor q10,q8,q9

# qhasm:       bb2 ^= bb10
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb10=reg128#14
# asm 2: veor >bb2=q2,<bb2=q2,<bb10=q13
veor q2,q2,q13

# qhasm:       bb11 &= bb7
# asm 1: vand >bb11=reg128#11,<bb11=reg128#11,<bb7=reg128#8
# asm 2: vand >bb11=q10,<bb11=q10,<bb7=q7
vand q10,q10,q7

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 &= bb15
# asm 1: vand >bb1=reg128#2,<bb1=reg128#2,<bb15=reg128#9
# asm 2: vand >bb1=q1,<bb1=q1,<bb15=q8
vand q1,q1,q8

# qhasm:       bb7 &= bb14
# asm 1: vand >bb7=reg128#8,<bb7=reg128#8,<bb14=reg128#10
# asm 2: vand >bb7=q7,<bb7=q7,<bb14=q9
vand q7,q7,q9

# qhasm:       bb4 ^= bb12
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb12=reg128#13
# asm 2: veor >bb4=q4,<bb4=q4,<bb12=q12
veor q4,q4,q12

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 ^= bb11
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb11=reg128#11
# asm 2: veor >bb1=q1,<bb1=q1,<bb11=q10
veor q1,q1,q10

# qhasm:       bb7 ^= bb12
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb12=reg128#13
# asm 2: veor >bb7=q7,<bb7=q7,<bb12=q12
veor q7,q7,q12

# qhasm:       bb1 ^= bb8
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb8=reg128#15
# asm 2: veor >bb1=q1,<bb1=q1,<bb8=q14
veor q1,q1,q14

# qhasm:       bb2 ^= bb8
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb8=reg128#15
# asm 2: veor >bb2=q2,<bb2=q2,<bb8=q14
veor q2,q2,q14

# qhasm:     bb7 ^= bb0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb0=reg128#1
# asm 2: veor >bb7=q7,<bb7=q7,<bb0=q0
veor q7,q7,q0

# qhasm:     bb1 ^= bb6
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb6=reg128#7
# asm 2: veor >bb1=q1,<bb1=q1,<bb6=q6
veor q1,q1,q6

# qhasm:     bb4 ^= bb7
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb7=reg128#8
# asm 2: veor >bb4=q4,<bb4=q4,<bb7=q7
veor q4,q4,q7

# qhasm:     bb6 ^= bb0
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb6=q6,<bb6=q6,<bb0=q0
veor q6,q6,q0

# qhasm:     bb0 ^= bb1
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb1=reg128#2
# asm 2: veor >bb0=q0,<bb0=q0,<bb1=q1
veor q0,q0,q1

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:     bb5 ^= bb2
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb2=reg128#3
# asm 2: veor >bb5=q5,<bb5=q5,<bb2=q2
veor q5,q5,q2

# qhasm:     bb2 ^= bb3
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb3=reg128#4
# asm 2: veor >bb2=q2,<bb2=q2,<bb3=q3
veor q2,q2,q3

# qhasm:     bb3 ^= bb5
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb5=reg128#6
# asm 2: veor >bb3=q3,<bb3=q3,<bb5=q5
veor q3,q3,q5

# qhasm:     bb8 = bb0[3]bb0[0,1,2]
# asm 1: vext.32 >bb8=reg128#9,<bb0=reg128#1,<bb0=reg128#1,#3
# asm 2: vext.32 >bb8=q8,<bb0=q0,<bb0=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb5=reg128#6
# asm 2: veor >bb4=q4,<bb4=q4,<bb5=q5
veor q4,q4,q5

# qhasm:     bb9 = bb1[3]bb1[0,1,2]
# asm 1: vext.32 >bb9=reg128#10,<bb1=reg128#2,<bb1=reg128#2,#3
# asm 2: vext.32 >bb9=q9,<bb1=q1,<bb1=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb3=reg128#4
# asm 2: veor >bb6=q6,<bb6=q6,<bb3=q3
veor q6,q6,q3

# qhasm:     bb10 = bb4[3]bb4[0,1,2]
# asm 1: vext.32 >bb10=reg128#11,<bb4=reg128#5,<bb4=reg128#5,#3
# asm 2: vext.32 >bb10=q10,<bb4=q4,<bb4=q4,#3
vext.32 q10,q4,q4,#3

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb11 = bb6[3]bb6[0,1,2]
# asm 1: vext.32 >bb11=reg128#12,<bb6=reg128#7,<bb6=reg128#7,#3
# asm 2: vext.32 >bb11=q11,<bb6=q6,<bb6=q6,#3
vext.32 q11,q6,q6,#3

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     bb12 = bb3[3]bb3[0,1,2]
# asm 1: vext.32 >bb12=reg128#13,<bb3=reg128#4,<bb3=reg128#4,#3
# asm 2: vext.32 >bb12=q12,<bb3=q3,<bb3=q3,#3
vext.32 q12,q3,q3,#3

# qhasm:     bb4 ^= bb10
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb10=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<bb10=q10
veor q4,q4,q10

# qhasm:     bb15 = bb5[3]bb5[0,1,2]
# asm 1: vext.32 >bb15=reg128#14,<bb5=reg128#6,<bb5=reg128#6,#3
# asm 2: vext.32 >bb15=q13,<bb5=q5,<bb5=q5,#3
vext.32 q13,q5,q5,#3

# qhasm:     bb6 ^= bb11
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb11=reg128#12
# asm 2: veor >bb6=q6,<bb6=q6,<bb11=q11
veor q6,q6,q11

# qhasm:     bb13 = bb7[3]bb7[0,1,2]
# asm 1: vext.32 >bb13=reg128#15,<bb7=reg128#8,<bb7=reg128#8,#3
# asm 2: vext.32 >bb13=q14,<bb7=q7,<bb7=q7,#3
vext.32 q14,q7,q7,#3

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb12=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb12=q12
veor q3,q3,q12

# qhasm:     bb14 = bb2[3]bb2[0,1,2]
# asm 1: vext.32 >bb14=reg128#16,<bb2=reg128#3,<bb2=reg128#3,#3
# asm 2: vext.32 >bb14=q15,<bb2=q2,<bb2=q2,#3
vext.32 q15,q2,q2,#3

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb15=q13
veor q5,q5,q13

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb13=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb13=q14
veor q7,q7,q14

# qhasm:     bb2 ^= bb14
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb14=reg128#16
# asm 2: veor >bb2=q2,<bb2=q2,<bb14=q15
veor q2,q2,q15

# qhasm:     bb9 ^= bb0
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb0=reg128#1
# asm 2: veor >bb9=q9,<bb9=q9,<bb0=q0
veor q9,q9,q0

# qhasm:     bb8 ^= bb5
# asm 1: veor >bb8=reg128#9,<bb8=reg128#9,<bb5=reg128#6
# asm 2: veor >bb8=q8,<bb8=q8,<bb5=q5
veor q8,q8,q5

# qhasm:     bb10 ^= bb1
# asm 1: veor >bb10=reg128#11,<bb10=reg128#11,<bb1=reg128#2
# asm 2: veor >bb10=q10,<bb10=q10,<bb1=q1
veor q10,q10,q1

# qhasm:     bb9 ^= bb5
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb5=reg128#6
# asm 2: veor >bb9=q9,<bb9=q9,<bb5=q5
veor q9,q9,q5

# qhasm:     bb0 = bb0[2,3]bb0[0,1]
# asm 1: vswp <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vswp <bb0=d0,<bb0=d1
vswp d0,d1

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb4=reg128#5
# asm 2: veor >bb11=q11,<bb11=q11,<bb4=q4
veor q11,q11,q4

# qhasm:     bb1 = bb1[2,3]bb1[0,1]
# asm 1: vswp <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vswp <bb1=d2,<bb1=d3
vswp d2,d3

# qhasm:     bb12 ^= bb6
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb6=reg128#7
# asm 2: veor >bb12=q12,<bb12=q12,<bb6=q6
veor q12,q12,q6

# qhasm:     bb4 = bb4[2,3]bb4[0,1]
# asm 1: vswp <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vswp <bb4=d8,<bb4=d9
vswp d8,d9

# qhasm:     bb13 ^= bb3
# asm 1: veor >bb13=reg128#15,<bb13=reg128#15,<bb3=reg128#4
# asm 2: veor >bb13=q14,<bb13=q14,<bb3=q3
veor q14,q14,q3

# qhasm:     bb6 = bb6[2,3]bb6[0,1]
# asm 1: vswp <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vswp <bb6=d12,<bb6=d13
vswp d12,d13

# qhasm:     bb11 ^= bb5
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb5=reg128#6
# asm 2: veor >bb11=q11,<bb11=q11,<bb5=q5
veor q11,q11,q5

# qhasm:     bb3 = bb3[2,3]bb3[0,1]
# asm 1: vswp <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vswp <bb3=d6,<bb3=d7
vswp d6,d7

# qhasm:     bb14 ^= bb7
# asm 1: veor >bb14=reg128#16,<bb14=reg128#16,<bb7=reg128#8
# asm 2: veor >bb14=q15,<bb14=q15,<bb7=q7
veor q15,q15,q7

# qhasm:     bb7 = bb7[2,3]bb7[0,1]
# asm 1: vswp <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vswp <bb7=d14,<bb7=d15
vswp d14,d15

# qhasm:     bb15 ^= bb2
# asm 1: veor >bb15=reg128#14,<bb15=reg128#14,<bb2=reg128#3
# asm 2: veor >bb15=q13,<bb15=q13,<bb2=q2
veor q13,q13,q2

# qhasm:     bb2 = bb2[2,3]bb2[0,1]
# asm 1: vswp <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vswp <bb2=d4,<bb2=d5
vswp d4,d5

# qhasm:     bb12 ^= bb5
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb5=reg128#6
# asm 2: veor >bb12=q12,<bb12=q12,<bb5=q5
veor q12,q12,q5

# qhasm:     bb5 = bb5[2,3]bb5[0,1]
# asm 1: vswp <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vswp <bb5=d10,<bb5=d11
vswp d10,d11

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#9,<bb0=reg128#1
# asm 2: veor >bb8=q0,<bb8=q8,<bb0=q0
veor q0,q8,q0

# qhasm:     bb0 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb0=reg128#9%bot->bb0=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb0=d16->bb0=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#10,<bb1=reg128#2
# asm 2: veor >bb9=q1,<bb9=q9,<bb1=q1
veor q1,q9,q1

# qhasm:     bb1 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb1=reg128#10%bot->bb1=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb1=d18->bb1=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb14 ^= bb2
# asm 1: veor >bb14=reg128#3,<bb14=reg128#16,<bb2=reg128#3
# asm 2: veor >bb14=q2,<bb14=q15,<bb2=q2
veor q2,q15,q2

# qhasm:     bb2 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb2=reg128#16%bot->bb2=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb2=d30->bb2=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb12 ^= bb3
# asm 1: veor >bb12=reg128#4,<bb12=reg128#13,<bb3=reg128#4
# asm 2: veor >bb12=q3,<bb12=q12,<bb3=q3
veor q3,q12,q3

# qhasm:     bb3 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb3=reg128#13%bot->bb3=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb3=d24->bb3=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb10 ^= bb4
# asm 1: veor >bb10=reg128#5,<bb10=reg128#11,<bb4=reg128#5
# asm 2: veor >bb10=q4,<bb10=q10,<bb4=q4
veor q4,q10,q4

# qhasm:     bb4 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb4=reg128#11%bot->bb4=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb4=d20->bb4=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#14,<bb5=reg128#6
# asm 2: veor >bb15=q5,<bb15=q13,<bb5=q5
veor q5,q13,q5

# qhasm:     bb5 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb5=reg128#14%bot->bb5=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb5=d26->bb5=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb11 ^= bb6
# asm 1: veor >bb11=reg128#7,<bb11=reg128#12,<bb6=reg128#7
# asm 2: veor >bb11=q6,<bb11=q11,<bb6=q6
veor q6,q11,q6

# qhasm:     bb6 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb6=reg128#12%bot->bb6=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb6=d22->bb6=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#15,<bb7=reg128#8
# asm 2: veor >bb13=q7,<bb13=q14,<bb7=q7
veor q7,q14,q7

# qhasm:     bb7 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb7=reg128#15%bot->bb7=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb7=d28->bb7=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb10 ^= bb2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb2=reg128#16
# asm 2: veor >bb10=q4,<bb10=q4,<bb2=q15
veor q4,q4,q15

# qhasm:     bb13 ^= bb5
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb5=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb5=q13
veor q7,q7,q13

# qhasm:       bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb9=reg128#2%bot,{<bb9=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb9=d2,{<bb9=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb9=reg128#2%top,{<bb9=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb9=d3,{<bb9=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb11 ^= bb3
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb3=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb3=q12
veor q6,q6,q12

# qhasm:       bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb10=reg128#5%bot,{<bb10=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb10=d8,{<bb10=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb10=reg128#5%top,{<bb10=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb10=d9,{<bb10=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb14 ^= bb6
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb6=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<bb6=q11
veor q2,q2,q11

# qhasm:     bb15 ^= bb7
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb7=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb7=q14
veor q5,q5,q14

# qhasm:       bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb13=reg128#8%bot,{<bb13=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb13=d14,{<bb13=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb13=reg128#8%top,{<bb13=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb13=d15,{<bb13=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb12 ^= bb4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb4=reg128#11
# asm 2: veor >bb12=q3,<bb12=q3,<bb4=q10
veor q3,q3,q10

# qhasm:       bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb8=reg128#1%bot,{<bb8=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb8=d0,{<bb8=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb8=reg128#1%top,{<bb8=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb8=d1,{<bb8=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb10 ^= bb9
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb9=reg128#2
# asm 2: veor >bb10=q4,<bb10=q4,<bb9=q1
veor q4,q4,q1

# qhasm:       bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb11=reg128#7%bot,{<bb11=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb11=d12,{<bb11=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb11=reg128#7%top,{<bb11=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb11=d13,{<bb11=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb13 ^= bb8
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb8=reg128#1
# asm 2: veor >bb13=q7,<bb13=q7,<bb8=q0
veor q7,q7,q0

# qhasm:       bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb14=reg128#3%bot,{<bb14=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb14=d4,{<bb14=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb14=reg128#3%top,{<bb14=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb14=d5,{<bb14=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb11 ^= bb8
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb8=reg128#1
# asm 2: veor >bb11=q6,<bb11=q6,<bb8=q0
veor q6,q6,q0

# qhasm:       bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb15=reg128#6%bot,{<bb15=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb15=d10,{<bb15=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb15=reg128#6%top,{<bb15=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb15=d11,{<bb15=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb13 ^= bb14
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb14=reg128#3
# asm 2: veor >bb13=q7,<bb13=q7,<bb14=q2
veor q7,q7,q2

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb11=reg128#7
# asm 2: veor >bb14=q2,<bb14=q2,<bb11=q6
veor q2,q2,q6

# qhasm:     bb11 ^= bb15
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb15=reg128#6
# asm 2: veor >bb11=q6,<bb11=q6,<bb15=q5
veor q6,q6,q5

# qhasm:       bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb12=reg128#4%bot,{<bb12=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb12=d6,{<bb12=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb12=reg128#4%top,{<bb12=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb12=d7,{<bb12=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb14 ^= bb10
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb10=reg128#5
# asm 2: veor >bb14=q2,<bb14=q2,<bb10=q4
veor q2,q2,q4

# qhasm:     bb15 ^= bb13
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb13=reg128#8
# asm 2: veor >bb15=q5,<bb15=q5,<bb13=q7
veor q5,q5,q7

# qhasm:     bb11 ^= bb12
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb12=reg128#4
# asm 2: veor >bb11=q6,<bb11=q6,<bb12=q3
veor q6,q6,q3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb13=reg128#8
# asm 2: veor >bb12=q3,<bb12=q3,<bb13=q7
veor q3,q3,q7

# qhasm:     bb11 ^= bb9
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb9=reg128#2
# asm 2: veor >bb11=q6,<bb11=q6,<bb9=q1
veor q6,q6,q1

# qhasm:     bb10 ^= bb15
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb15=reg128#6
# asm 2: veor >bb10=q4,<bb10=q4,<bb15=q5
veor q4,q4,q5

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:       bb3 = bb15 ^ bb12
# asm 1: veor >bb3=reg128#9,<bb15=reg128#6,<bb12=reg128#4
# asm 2: veor >bb3=q8,<bb15=q5,<bb12=q3
veor q8,q5,q3

# qhasm:       bb2 = bb9 ^ bb10
# asm 1: veor >bb2=reg128#10,<bb9=reg128#2,<bb10=reg128#5
# asm 2: veor >bb2=q9,<bb9=q1,<bb10=q4
veor q9,q1,q4

# qhasm:       bb1 = bb13 ^ bb11
# asm 1: veor >bb1=reg128#11,<bb13=reg128#8,<bb11=reg128#7
# asm 2: veor >bb1=q10,<bb13=q7,<bb11=q6
veor q10,q7,q6

# qhasm:       bb5 = bb10 ^ bb12
# asm 1: veor >bb5=reg128#12,<bb10=reg128#5,<bb12=reg128#4
# asm 2: veor >bb5=q11,<bb10=q4,<bb12=q3
veor q11,q4,q3

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb14=q2,<bb8=q0
veor q12,q2,q0

# qhasm:       bb0 = bb2 & bb1
# asm 1: vand >bb0=reg128#14,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vand >bb0=q13,<bb2=q9,<bb1=q10
vand q13,q9,q10

# qhasm:       bb6 = bb3 & bb4
# asm 1: vand >bb6=reg128#15,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vand >bb6=q14,<bb3=q8,<bb4=q12
vand q14,q8,q12

# qhasm:       bb7 = bb3 ^ bb2
# asm 1: veor >bb7=reg128#16,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb7=q15,<bb3=q8,<bb2=q9
veor q15,q8,q9

# qhasm:       bb3 |= bb4
# asm 1: vorr >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vorr >bb3=q8,<bb3=q8,<bb4=q12
vorr q8,q8,q12

# qhasm:       bb4 ^= bb1
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb1=reg128#11
# asm 2: veor >bb4=q12,<bb4=q12,<bb1=q10
veor q12,q12,q10

# qhasm:       bb2 |= bb1
# asm 1: vorr >bb2=reg128#10,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vorr >bb2=q9,<bb2=q9,<bb1=q10
vorr q9,q9,q10

# qhasm:       bb7 &= bb4
# asm 1: vand >bb7=reg128#11,<bb7=reg128#16,<bb4=reg128#13
# asm 2: vand >bb7=q10,<bb7=q15,<bb4=q12
vand q10,q15,q12

# qhasm:       bb4 = bb11 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb11=reg128#7,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb11=q6,<bb8=q0
veor q12,q6,q0

# qhasm:       bb3 ^= bb7
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb7=reg128#11
# asm 2: veor >bb3=q8,<bb3=q8,<bb7=q10
veor q8,q8,q10

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb2 ^= bb6
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb6=reg128#15
# asm 2: veor >bb2=q9,<bb2=q9,<bb6=q14
veor q9,q9,q14

# qhasm:       bb3 ^= bb5
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb5=reg128#12
# asm 2: veor >bb3=q8,<bb3=q8,<bb5=q11
veor q8,q8,q11

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#12
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q11
veor q9,q9,q11

# qhasm:       bb5 = bb15 ^ bb9
# asm 1: veor >bb5=reg128#12,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb5=q11,<bb15=q5,<bb9=q1
veor q11,q5,q1

# qhasm:       bb4 = bb13 ^ bb14
# asm 1: veor >bb4=reg128#13,<bb13=reg128#8,<bb14=reg128#3
# asm 2: veor >bb4=q12,<bb13=q7,<bb14=q2
veor q12,q7,q2

# qhasm:       bb0 ^= bb6
# asm 1: veor >bb0=reg128#14,<bb0=reg128#14,<bb6=reg128#15
# asm 2: veor >bb0=q13,<bb0=q13,<bb6=q14
veor q13,q13,q14

# qhasm:       bb1 = bb5 | bb4
# asm 1: vorr >bb1=reg128#16,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vorr >bb1=q15,<bb5=q11,<bb4=q12
vorr q15,q11,q12

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb1 ^= bb7
# asm 1: veor >bb1=reg128#11,<bb1=reg128#16,<bb7=reg128#11
# asm 2: veor >bb1=q10,<bb1=q15,<bb7=q10
veor q10,q15,q10

# qhasm:       bb0 ^= bb5
# asm 1: veor >bb0=reg128#12,<bb0=reg128#14,<bb5=reg128#12
# asm 2: veor >bb0=q11,<bb0=q13,<bb5=q11
veor q11,q13,q11

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#15
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q14
veor q10,q10,q14

# qhasm:       bb4 = bb10 & bb11
# asm 1: vand >bb4=reg128#13,<bb10=reg128#5,<bb11=reg128#7
# asm 2: vand >bb4=q12,<bb10=q4,<bb11=q6
vand q12,q4,q6

# qhasm:       bb5 = bb12 & bb8
# asm 1: vand >bb5=reg128#14,<bb12=reg128#4,<bb8=reg128#1
# asm 2: vand >bb5=q13,<bb12=q3,<bb8=q0
vand q13,q3,q0

# qhasm:       bb3 ^= bb4
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: veor >bb3=q8,<bb3=q8,<bb4=q12
veor q8,q8,q12

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#14
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q13
veor q9,q9,q13

# qhasm:       bb6 = bb9 & bb13
# asm 1: vand >bb6=reg128#13,<bb9=reg128#2,<bb13=reg128#8
# asm 2: vand >bb6=q12,<bb9=q1,<bb13=q7
vand q12,q1,q7

# qhasm:       bb4 = bb3 ^ bb2
# asm 1: veor >bb4=reg128#14,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb4=q13,<bb3=q8,<bb2=q9
veor q13,q8,q9

# qhasm:       bb7 = bb15 | bb14
# asm 1: vorr >bb7=reg128#15,<bb15=reg128#6,<bb14=reg128#3
# asm 2: vorr >bb7=q14,<bb15=q5,<bb14=q2
vorr q14,q5,q2

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#13
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q12
veor q10,q10,q12

# qhasm:       bb0 ^= bb7
# asm 1: veor >bb0=reg128#12,<bb0=reg128#12,<bb7=reg128#15
# asm 2: veor >bb0=q11,<bb0=q11,<bb7=q14
veor q11,q11,q14

# qhasm:       bb3 &= bb1
# asm 1: vand >bb3=reg128#9,<bb3=reg128#9,<bb1=reg128#11
# asm 2: vand >bb3=q8,<bb3=q8,<bb1=q10
vand q8,q8,q10

# qhasm:       bb5 = bb1 ^ bb0
# asm 1: veor >bb5=reg128#13,<bb1=reg128#11,<bb0=reg128#12
# asm 2: veor >bb5=q12,<bb1=q10,<bb0=q11
veor q12,q10,q11

# qhasm:       bb6 = bb0 ^ bb3
# asm 1: veor >bb6=reg128#15,<bb0=reg128#12,<bb3=reg128#9
# asm 2: veor >bb6=q14,<bb0=q11,<bb3=q8
veor q14,q11,q8

# qhasm:       bb3 ^= bb2
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb3=q8,<bb3=q8,<bb2=q9
veor q8,q8,q9

# qhasm:       bb7 = bb4 & bb6
# asm 1: vand >bb7=reg128#16,<bb4=reg128#14,<bb6=reg128#15
# asm 2: vand >bb7=q15,<bb4=q13,<bb6=q14
vand q15,q13,q14

# qhasm:       bb5 &= bb3
# asm 1: vand >bb5=reg128#9,<bb5=reg128#13,<bb3=reg128#9
# asm 2: vand >bb5=q8,<bb5=q12,<bb3=q8
vand q8,q12,q8

# qhasm:       bb7 ^= bb2
# asm 1: veor >bb7=reg128#10,<bb7=reg128#16,<bb2=reg128#10
# asm 2: veor >bb7=q9,<bb7=q15,<bb2=q9
veor q9,q15,q9

# qhasm:       bb5 ^= bb0
# asm 1: veor >bb5=reg128#9,<bb5=reg128#9,<bb0=reg128#12
# asm 2: veor >bb5=q8,<bb5=q8,<bb0=q11
veor q8,q8,q11

# qhasm:       bb2 = bb6 ^ bb5
# asm 1: veor >bb2=reg128#13,<bb6=reg128#15,<bb5=reg128#9
# asm 2: veor >bb2=q12,<bb6=q14,<bb5=q8
veor q12,q14,q8

# qhasm:       bb1 ^= bb5
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb5=reg128#9
# asm 2: veor >bb1=q10,<bb1=q10,<bb5=q8
veor q10,q10,q8

# qhasm:       bb2 &= bb0
# asm 1: vand >bb2=reg128#12,<bb2=reg128#13,<bb0=reg128#12
# asm 2: vand >bb2=q11,<bb2=q12,<bb0=q11
vand q11,q12,q11

# qhasm:       bb0 = bb13 ^ bb11
# asm 1: veor >bb0=reg128#13,<bb13=reg128#8,<bb11=reg128#7
# asm 2: veor >bb0=q12,<bb13=q7,<bb11=q6
veor q12,q7,q6

# qhasm:       bb6 ^= bb2
# asm 1: veor >bb6=reg128#15,<bb6=reg128#15,<bb2=reg128#12
# asm 2: veor >bb6=q14,<bb6=q14,<bb2=q11
veor q14,q14,q11

# qhasm:       bb1 ^= bb2
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb2=reg128#12
# asm 2: veor >bb1=q10,<bb1=q10,<bb2=q11
veor q10,q10,q11

# qhasm:       bb6 &= bb7
# asm 1: vand >bb6=reg128#12,<bb6=reg128#15,<bb7=reg128#10
# asm 2: vand >bb6=q11,<bb6=q14,<bb7=q9
vand q11,q14,q9

# qhasm:       bb6 ^= bb4
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb4=reg128#14
# asm 2: veor >bb6=q11,<bb6=q11,<bb4=q13
veor q11,q11,q13

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#14,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb4=q13,<bb14=q2,<bb8=q0
veor q13,q2,q0

# qhasm:       bb2 = bb7 ^ bb6
# asm 1: veor >bb2=reg128#15,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb2=q14,<bb7=q9,<bb6=q11
veor q14,q9,q11

# qhasm:       bb2 &= bb14
# asm 1: vand >bb2=reg128#15,<bb2=reg128#15,<bb14=reg128#3
# asm 2: vand >bb2=q14,<bb2=q14,<bb14=q2
vand q14,q14,q2

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb13=reg128#8
# asm 2: veor >bb14=q2,<bb14=q2,<bb13=q7
veor q2,q2,q7

# qhasm:       bb13 &= bb7
# asm 1: vand >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#10
# asm 2: vand >bb13=q7,<bb13=q7,<bb7=q9
vand q7,q7,q9

# qhasm:       bb14 &= bb6
# asm 1: vand >bb14=reg128#3,<bb14=reg128#3,<bb6=reg128#12
# asm 2: vand >bb14=q2,<bb14=q2,<bb6=q11
vand q2,q2,q11

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q11,<bb6=q11,<bb1=q10
veor q11,q11,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#10,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q9,<bb7=q9,<bb5=q8
veor q9,q9,q8

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb13=reg128#8
# asm 2: veor >bb14=q2,<bb14=q2,<bb13=q7
veor q2,q2,q7

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#16,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q15,<bb7=q9,<bb6=q11
veor q15,q9,q11

# qhasm:       bb13 ^= bb2
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb2=reg128#15
# asm 2: veor >bb13=q7,<bb13=q7,<bb2=q14
veor q7,q7,q14

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#15,<bb3=reg128#16,<bb4=reg128#14
# asm 2: vand >bb3=q14,<bb3=q15,<bb4=q13
vand q14,q15,q13

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb0=reg128#13
# asm 2: veor >bb4=q13,<bb4=q13,<bb0=q12
veor q13,q13,q12

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#13,<bb0=reg128#13,<bb7=reg128#10
# asm 2: vand >bb0=q12,<bb0=q12,<bb7=q9
vand q12,q12,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#14,<bb4=reg128#14,<bb6=reg128#12
# asm 2: vand >bb4=q13,<bb4=q13,<bb6=q11
vand q13,q13,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#13,<bb0=reg128#13,<bb4=reg128#14
# asm 2: veor >bb0=q12,<bb0=q12,<bb4=q13
veor q12,q12,q13

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb3=reg128#15
# asm 2: veor >bb4=q13,<bb4=q13,<bb3=q14
veor q13,q13,q14

# qhasm:       bb2 &= bb8
# asm 1: vand >bb2=reg128#15,<bb2=reg128#16,<bb8=reg128#1
# asm 2: vand >bb2=q14,<bb2=q15,<bb8=q0
vand q14,q15,q0

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#7
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q6
veor q0,q0,q6

# qhasm:       bb11 &= bb5
# asm 1: vand >bb11=reg128#7,<bb11=reg128#7,<bb5=reg128#9
# asm 2: vand >bb11=q6,<bb11=q6,<bb5=q8
vand q6,q6,q8

# qhasm:       bb8 &= bb1
# asm 1: vand >bb8=reg128#1,<bb8=reg128#1,<bb1=reg128#11
# asm 2: vand >bb8=q0,<bb8=q0,<bb1=q10
vand q0,q0,q10

# qhasm:       bb14 ^= bb4
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb4=reg128#14
# asm 2: veor >bb14=q2,<bb14=q2,<bb4=q13
veor q2,q2,q13

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#7
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q6
veor q0,q0,q6

# qhasm:       bb11 ^= bb2
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb2=reg128#15
# asm 2: veor >bb11=q6,<bb11=q6,<bb2=q14
veor q6,q6,q14

# qhasm:       bb8 ^= bb4
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb4=reg128#14
# asm 2: veor >bb8=q0,<bb8=q0,<bb4=q13
veor q0,q0,q13

# qhasm:       bb13 ^= bb0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb0=reg128#13
# asm 2: veor >bb13=q7,<bb13=q7,<bb0=q12
veor q7,q7,q12

# qhasm:       bb11 ^= bb0
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb0=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb0=q12
veor q6,q6,q12

# qhasm:       bb4 = bb15 ^ bb12
# asm 1: veor >bb4=reg128#13,<bb15=reg128#6,<bb12=reg128#4
# asm 2: veor >bb4=q12,<bb15=q5,<bb12=q3
veor q12,q5,q3

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#14,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q13,<bb7=q9,<bb6=q11
veor q13,q9,q11

# qhasm:       bb0 = bb9 ^ bb10
# asm 1: veor >bb0=reg128#15,<bb9=reg128#2,<bb10=reg128#5
# asm 2: veor >bb0=q14,<bb9=q1,<bb10=q4
veor q14,q1,q4

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#14,<bb3=reg128#14,<bb4=reg128#13
# asm 2: vand >bb3=q13,<bb3=q13,<bb4=q12
vand q13,q13,q12

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb0=reg128#15
# asm 2: veor >bb4=q12,<bb4=q12,<bb0=q14
veor q12,q12,q14

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#15,<bb0=reg128#15,<bb7=reg128#10
# asm 2: vand >bb0=q14,<bb0=q14,<bb7=q9
vand q14,q14,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#13,<bb4=reg128#13,<bb6=reg128#12
# asm 2: vand >bb4=q12,<bb4=q12,<bb6=q11
vand q12,q12,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#15,<bb0=reg128#15,<bb4=reg128#13
# asm 2: veor >bb0=q14,<bb0=q14,<bb4=q12
veor q14,q14,q12

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb3=reg128#14
# asm 2: veor >bb4=q12,<bb4=q12,<bb3=q13
veor q12,q12,q13

# qhasm:       bb2 &= bb12
# asm 1: vand >bb2=reg128#14,<bb2=reg128#16,<bb12=reg128#4
# asm 2: vand >bb2=q13,<bb2=q15,<bb12=q3
vand q13,q15,q3

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb10=reg128#5
# asm 2: veor >bb12=q3,<bb12=q3,<bb10=q4
veor q3,q3,q4

# qhasm:       bb10 &= bb5
# asm 1: vand >bb10=reg128#5,<bb10=reg128#5,<bb5=reg128#9
# asm 2: vand >bb10=q4,<bb10=q4,<bb5=q8
vand q4,q4,q8

# qhasm:       bb12 &= bb1
# asm 1: vand >bb12=reg128#4,<bb12=reg128#4,<bb1=reg128#11
# asm 2: vand >bb12=q3,<bb12=q3,<bb1=q10
vand q3,q3,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#9,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q8,<bb7=q9,<bb5=q8
veor q8,q9,q8

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#10,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q9,<bb6=q11,<bb1=q10
veor q9,q11,q10

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb10=reg128#5
# asm 2: veor >bb12=q3,<bb12=q3,<bb10=q4
veor q3,q3,q4

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#11,<bb7=reg128#9,<bb6=reg128#10
# asm 2: veor >bb3=q10,<bb7=q8,<bb6=q9
veor q10,q8,q9

# qhasm:       bb10 ^= bb2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb2=reg128#14
# asm 2: veor >bb10=q4,<bb10=q4,<bb2=q13
veor q4,q4,q13

# qhasm:       bb3 &= bb15
# asm 1: vand >bb3=reg128#11,<bb3=reg128#11,<bb15=reg128#6
# asm 2: vand >bb3=q10,<bb3=q10,<bb15=q5
vand q10,q10,q5

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 &= bb7
# asm 1: vand >bb9=reg128#2,<bb9=reg128#2,<bb7=reg128#9
# asm 2: vand >bb9=q1,<bb9=q1,<bb7=q8
vand q1,q1,q8

# qhasm:       bb15 &= bb6
# asm 1: vand >bb15=reg128#6,<bb15=reg128#6,<bb6=reg128#10
# asm 2: vand >bb15=q5,<bb15=q5,<bb6=q9
vand q5,q5,q9

# qhasm:       bb12 ^= bb4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb4=reg128#13
# asm 2: veor >bb12=q3,<bb12=q3,<bb4=q12
veor q3,q3,q12

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 ^= bb3
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb3=reg128#11
# asm 2: veor >bb9=q1,<bb9=q1,<bb3=q10
veor q1,q1,q10

# qhasm:       bb15 ^= bb4
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb4=reg128#13
# asm 2: veor >bb15=q5,<bb15=q5,<bb4=q12
veor q5,q5,q12

# qhasm:       bb9 ^= bb0
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb0=reg128#15
# asm 2: veor >bb9=q1,<bb9=q1,<bb0=q14
veor q1,q1,q14

# qhasm:       bb10 ^= bb0
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb0=reg128#15
# asm 2: veor >bb10=q4,<bb10=q4,<bb0=q14
veor q4,q4,q14

# qhasm:     bb15 ^= bb8
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb8=reg128#1
# asm 2: veor >bb15=q5,<bb15=q5,<bb8=q0
veor q5,q5,q0

# qhasm:     bb9 ^= bb14
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb14=reg128#3
# asm 2: veor >bb9=q1,<bb9=q1,<bb14=q2
veor q1,q1,q2

# qhasm:     bb12 ^= bb15
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb15=reg128#6
# asm 2: veor >bb12=q3,<bb12=q3,<bb15=q5
veor q3,q3,q5

# qhasm:     bb14 ^= bb8
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb14=q2,<bb14=q2,<bb8=q0
veor q2,q2,q0

# qhasm:     bb8 ^= bb9
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb9=reg128#2
# asm 2: veor >bb8=q0,<bb8=q0,<bb9=q1
veor q0,q0,q1

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:     bb13 ^= bb10
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb10=reg128#5
# asm 2: veor >bb13=q7,<bb13=q7,<bb10=q4
veor q7,q7,q4

# qhasm:     bb10 ^= bb11
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb11=reg128#7
# asm 2: veor >bb10=q4,<bb10=q4,<bb11=q6
veor q4,q4,q6

# qhasm:     bb11 ^= bb13
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb13=reg128#8
# asm 2: veor >bb11=q6,<bb11=q6,<bb13=q7
veor q6,q6,q7

# qhasm:     bb0 = bb8[3]bb8[0,1,2]
# asm 1: vext.32 >bb0=reg128#9,<bb8=reg128#1,<bb8=reg128#1,#3
# asm 2: vext.32 >bb0=q8,<bb8=q0,<bb8=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb13=reg128#8
# asm 2: veor >bb12=q3,<bb12=q3,<bb13=q7
veor q3,q3,q7

# qhasm:     bb1 = bb9[3]bb9[0,1,2]
# asm 1: vext.32 >bb1=reg128#10,<bb9=reg128#2,<bb9=reg128#2,#3
# asm 2: vext.32 >bb1=q9,<bb9=q1,<bb9=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb11=reg128#7
# asm 2: veor >bb14=q2,<bb14=q2,<bb11=q6
veor q2,q2,q6

# qhasm:     bb2 = bb12[3]bb12[0,1,2]
# asm 1: vext.32 >bb2=reg128#11,<bb12=reg128#4,<bb12=reg128#4,#3
# asm 2: vext.32 >bb2=q10,<bb12=q3,<bb12=q3,#3
vext.32 q10,q3,q3,#3

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb3 = bb14[3]bb14[0,1,2]
# asm 1: vext.32 >bb3=reg128#12,<bb14=reg128#3,<bb14=reg128#3,#3
# asm 2: vext.32 >bb3=q11,<bb14=q2,<bb14=q2,#3
vext.32 q11,q2,q2,#3

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     bb4 = bb11[3]bb11[0,1,2]
# asm 1: vext.32 >bb4=reg128#13,<bb11=reg128#7,<bb11=reg128#7,#3
# asm 2: vext.32 >bb4=q12,<bb11=q6,<bb11=q6,#3
vext.32 q12,q6,q6,#3

# qhasm:     bb12 ^= bb2
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb2=reg128#11
# asm 2: veor >bb12=q3,<bb12=q3,<bb2=q10
veor q3,q3,q10

# qhasm:     bb7 = bb13[3]bb13[0,1,2]
# asm 1: vext.32 >bb7=reg128#14,<bb13=reg128#8,<bb13=reg128#8,#3
# asm 2: vext.32 >bb7=q13,<bb13=q7,<bb13=q7,#3
vext.32 q13,q7,q7,#3

# qhasm:     bb14 ^= bb3
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb3=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<bb3=q11
veor q2,q2,q11

# qhasm:     bb5 = bb15[3]bb15[0,1,2]
# asm 1: vext.32 >bb5=reg128#15,<bb15=reg128#6,<bb15=reg128#6,#3
# asm 2: vext.32 >bb5=q14,<bb15=q5,<bb15=q5,#3
vext.32 q14,q5,q5,#3

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb4=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb4=q12
veor q6,q6,q12

# qhasm:     bb6 = bb10[3]bb10[0,1,2]
# asm 1: vext.32 >bb6=reg128#16,<bb10=reg128#5,<bb10=reg128#5,#3
# asm 2: vext.32 >bb6=q15,<bb10=q4,<bb10=q4,#3
vext.32 q15,q4,q4,#3

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb7=q13
veor q7,q7,q13

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb5=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb5=q14
veor q5,q5,q14

# qhasm:     bb10 ^= bb6
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb6=reg128#16
# asm 2: veor >bb10=q4,<bb10=q4,<bb6=q15
veor q4,q4,q15

# qhasm:     bb1 ^= bb8
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb8=reg128#1
# asm 2: veor >bb1=q9,<bb1=q9,<bb8=q0
veor q9,q9,q0

# qhasm:     bb0 ^= bb13
# asm 1: veor >bb0=reg128#9,<bb0=reg128#9,<bb13=reg128#8
# asm 2: veor >bb0=q8,<bb0=q8,<bb13=q7
veor q8,q8,q7

# qhasm:     bb2 ^= bb9
# asm 1: veor >bb2=reg128#11,<bb2=reg128#11,<bb9=reg128#2
# asm 2: veor >bb2=q10,<bb2=q10,<bb9=q1
veor q10,q10,q1

# qhasm:     bb1 ^= bb13
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb13=reg128#8
# asm 2: veor >bb1=q9,<bb1=q9,<bb13=q7
veor q9,q9,q7

# qhasm:     bb8 = bb8[2,3]bb8[0,1]
# asm 1: vswp <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vswp <bb8=d0,<bb8=d1
vswp d0,d1

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb12=reg128#4
# asm 2: veor >bb3=q11,<bb3=q11,<bb12=q3
veor q11,q11,q3

# qhasm:     bb9 = bb9[2,3]bb9[0,1]
# asm 1: vswp <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vswp <bb9=d2,<bb9=d3
vswp d2,d3

# qhasm:     bb4 ^= bb14
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb14=reg128#3
# asm 2: veor >bb4=q12,<bb4=q12,<bb14=q2
veor q12,q12,q2

# qhasm:     bb12 = bb12[2,3]bb12[0,1]
# asm 1: vswp <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vswp <bb12=d6,<bb12=d7
vswp d6,d7

# qhasm:     bb5 ^= bb11
# asm 1: veor >bb5=reg128#15,<bb5=reg128#15,<bb11=reg128#7
# asm 2: veor >bb5=q14,<bb5=q14,<bb11=q6
veor q14,q14,q6

# qhasm:     bb14 = bb14[2,3]bb14[0,1]
# asm 1: vswp <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vswp <bb14=d4,<bb14=d5
vswp d4,d5

# qhasm:     bb3 ^= bb13
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb13=reg128#8
# asm 2: veor >bb3=q11,<bb3=q11,<bb13=q7
veor q11,q11,q7

# qhasm:     bb11 = bb11[2,3]bb11[0,1]
# asm 1: vswp <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vswp <bb11=d12,<bb11=d13
vswp d12,d13

# qhasm:     bb6 ^= bb15
# asm 1: veor >bb6=reg128#16,<bb6=reg128#16,<bb15=reg128#6
# asm 2: veor >bb6=q15,<bb6=q15,<bb15=q5
veor q15,q15,q5

# qhasm:     bb15 = bb15[2,3]bb15[0,1]
# asm 1: vswp <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vswp <bb15=d10,<bb15=d11
vswp d10,d11

# qhasm:     bb7 ^= bb10
# asm 1: veor >bb7=reg128#14,<bb7=reg128#14,<bb10=reg128#5
# asm 2: veor >bb7=q13,<bb7=q13,<bb10=q4
veor q13,q13,q4

# qhasm:     bb10 = bb10[2,3]bb10[0,1]
# asm 1: vswp <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vswp <bb10=d8,<bb10=d9
vswp d8,d9

# qhasm:     bb4 ^= bb13
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb13=reg128#8
# asm 2: veor >bb4=q12,<bb4=q12,<bb13=q7
veor q12,q12,q7

# qhasm:     bb13 = bb13[2,3]bb13[0,1]
# asm 1: vswp <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vswp <bb13=d14,<bb13=d15
vswp d14,d15

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#9,<bb8=reg128#1
# asm 2: veor >bb0=q0,<bb0=q8,<bb8=q0
veor q0,q8,q0

# qhasm:     bb8 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb8=reg128#9%bot->bb8=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb8=d16->bb8=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#10,<bb9=reg128#2
# asm 2: veor >bb1=q1,<bb1=q9,<bb9=q1
veor q1,q9,q1

# qhasm:     bb9 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb9=reg128#10%bot->bb9=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb9=d18->bb9=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb6 ^= bb10
# asm 1: veor >bb6=reg128#5,<bb6=reg128#16,<bb10=reg128#5
# asm 2: veor >bb6=q4,<bb6=q15,<bb10=q4
veor q4,q15,q4

# qhasm:     bb10 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb10=reg128#16%bot->bb10=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb10=d30->bb10=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb4 ^= bb11
# asm 1: veor >bb4=reg128#7,<bb4=reg128#13,<bb11=reg128#7
# asm 2: veor >bb4=q6,<bb4=q12,<bb11=q6
veor q6,q12,q6

# qhasm:     bb11 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb11=reg128#13%bot->bb11=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb11=d24->bb11=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb2 ^= bb12
# asm 1: veor >bb2=reg128#4,<bb2=reg128#11,<bb12=reg128#4
# asm 2: veor >bb2=q3,<bb2=q10,<bb12=q3
veor q3,q10,q3

# qhasm:     bb12 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb12=reg128#11%bot->bb12=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb12=d20->bb12=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#14,<bb13=reg128#8
# asm 2: veor >bb7=q7,<bb7=q13,<bb13=q7
veor q7,q13,q7

# qhasm:     bb13 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb13=reg128#14%bot->bb13=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb13=d26->bb13=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb3 ^= bb14
# asm 1: veor >bb3=reg128#3,<bb3=reg128#12,<bb14=reg128#3
# asm 2: veor >bb3=q2,<bb3=q11,<bb14=q2
veor q2,q11,q2

# qhasm:     bb14 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb14=reg128#12%bot->bb14=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb14=d22->bb14=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#15,<bb15=reg128#6
# asm 2: veor >bb5=q5,<bb5=q14,<bb15=q5
veor q5,q14,q5

# qhasm:     bb15 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb15=reg128#15%bot->bb15=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb15=d28->bb15=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb2 ^= bb10
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb10=reg128#16
# asm 2: veor >bb2=q3,<bb2=q3,<bb10=q15
veor q3,q3,q15

# qhasm:     bb5 ^= bb13
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb13=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb13=q13
veor q5,q5,q13

# qhasm:       bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb1=reg128#2%bot,{<bb1=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb1=d2,{<bb1=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb1=reg128#2%top,{<bb1=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb1=d3,{<bb1=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb3 ^= bb11
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb11=reg128#13
# asm 2: veor >bb3=q2,<bb3=q2,<bb11=q12
veor q2,q2,q12

# qhasm:       bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb2=reg128#4%bot,{<bb2=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb2=d6,{<bb2=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb2=reg128#4%top,{<bb2=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb2=d7,{<bb2=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb6 ^= bb14
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb14=reg128#12
# asm 2: veor >bb6=q4,<bb6=q4,<bb14=q11
veor q4,q4,q11

# qhasm:     bb7 ^= bb15
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb15=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb15=q14
veor q7,q7,q14

# qhasm:       bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb5=reg128#6%bot,{<bb5=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb5=d10,{<bb5=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb5=reg128#6%top,{<bb5=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb5=d11,{<bb5=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb4 ^= bb12
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb12=reg128#11
# asm 2: veor >bb4=q6,<bb4=q6,<bb12=q10
veor q6,q6,q10

# qhasm:       bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb0=reg128#1%bot,{<bb0=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb0=d0,{<bb0=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb0=reg128#1%top,{<bb0=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb0=d1,{<bb0=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb2 ^= bb1
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb1=reg128#2
# asm 2: veor >bb2=q3,<bb2=q3,<bb1=q1
veor q3,q3,q1

# qhasm:       bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb3=reg128#3%bot,{<bb3=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb3=d4,{<bb3=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb3=reg128#3%top,{<bb3=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb3=d5,{<bb3=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb5 ^= bb0
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb0=reg128#1
# asm 2: veor >bb5=q5,<bb5=q5,<bb0=q0
veor q5,q5,q0

# qhasm:       bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb6=reg128#5%bot,{<bb6=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb6=d8,{<bb6=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb6=reg128#5%top,{<bb6=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb6=d9,{<bb6=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb3 ^= bb0
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb0=reg128#1
# asm 2: veor >bb3=q2,<bb3=q2,<bb0=q0
veor q2,q2,q0

# qhasm:       bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb7=reg128#8%bot,{<bb7=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb7=d14,{<bb7=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb7=reg128#8%top,{<bb7=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb7=d15,{<bb7=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb5 ^= bb6
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb6=reg128#5
# asm 2: veor >bb5=q5,<bb5=q5,<bb6=q4
veor q5,q5,q4

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb3=reg128#3
# asm 2: veor >bb6=q4,<bb6=q4,<bb3=q2
veor q4,q4,q2

# qhasm:     bb3 ^= bb7
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb7=reg128#8
# asm 2: veor >bb3=q2,<bb3=q2,<bb7=q7
veor q2,q2,q7

# qhasm:       bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb4=reg128#7%bot,{<bb4=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb4=d12,{<bb4=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb4=reg128#7%top,{<bb4=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb4=d13,{<bb4=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb6 ^= bb2
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb2=reg128#4
# asm 2: veor >bb6=q4,<bb6=q4,<bb2=q3
veor q4,q4,q3

# qhasm:     bb7 ^= bb5
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb5=reg128#6
# asm 2: veor >bb7=q7,<bb7=q7,<bb5=q5
veor q7,q7,q5

# qhasm:     bb3 ^= bb4
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb4=reg128#7
# asm 2: veor >bb3=q2,<bb3=q2,<bb4=q6
veor q2,q2,q6

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb5=reg128#6
# asm 2: veor >bb4=q6,<bb4=q6,<bb5=q5
veor q6,q6,q5

# qhasm:     bb3 ^= bb1
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb1=reg128#2
# asm 2: veor >bb3=q2,<bb3=q2,<bb1=q1
veor q2,q2,q1

# qhasm:     bb2 ^= bb7
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb7=reg128#8
# asm 2: veor >bb2=q3,<bb2=q3,<bb7=q7
veor q3,q3,q7

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:       bb11 = bb7 ^ bb4
# asm 1: veor >bb11=reg128#9,<bb7=reg128#8,<bb4=reg128#7
# asm 2: veor >bb11=q8,<bb7=q7,<bb4=q6
veor q8,q7,q6

# qhasm:       bb10 = bb1 ^ bb2
# asm 1: veor >bb10=reg128#10,<bb1=reg128#2,<bb2=reg128#4
# asm 2: veor >bb10=q9,<bb1=q1,<bb2=q3
veor q9,q1,q3

# qhasm:       bb9 = bb5 ^ bb3
# asm 1: veor >bb9=reg128#11,<bb5=reg128#6,<bb3=reg128#3
# asm 2: veor >bb9=q10,<bb5=q5,<bb3=q2
veor q10,q5,q2

# qhasm:       bb13 = bb2 ^ bb4
# asm 1: veor >bb13=reg128#12,<bb2=reg128#4,<bb4=reg128#7
# asm 2: veor >bb13=q11,<bb2=q3,<bb4=q6
veor q11,q3,q6

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb6=reg128#5,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb6=q4,<bb0=q0
veor q12,q4,q0

# qhasm:       bb8 = bb10 & bb9
# asm 1: vand >bb8=reg128#14,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vand >bb8=q13,<bb10=q9,<bb9=q10
vand q13,q9,q10

# qhasm:       bb14 = bb11 & bb12
# asm 1: vand >bb14=reg128#15,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vand >bb14=q14,<bb11=q8,<bb12=q12
vand q14,q8,q12

# qhasm:       bb15 = bb11 ^ bb10
# asm 1: veor >bb15=reg128#16,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb15=q15,<bb11=q8,<bb10=q9
veor q15,q8,q9

# qhasm:       bb11 |= bb12
# asm 1: vorr >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vorr >bb11=q8,<bb11=q8,<bb12=q12
vorr q8,q8,q12

# qhasm:       bb12 ^= bb9
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb9=reg128#11
# asm 2: veor >bb12=q12,<bb12=q12,<bb9=q10
veor q12,q12,q10

# qhasm:       bb10 |= bb9
# asm 1: vorr >bb10=reg128#10,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vorr >bb10=q9,<bb10=q9,<bb9=q10
vorr q9,q9,q10

# qhasm:       bb15 &= bb12
# asm 1: vand >bb15=reg128#11,<bb15=reg128#16,<bb12=reg128#13
# asm 2: vand >bb15=q10,<bb15=q15,<bb12=q12
vand q10,q15,q12

# qhasm:       bb12 = bb3 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb3=reg128#3,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb3=q2,<bb0=q0
veor q12,q2,q0

# qhasm:       bb11 ^= bb15
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb15=reg128#11
# asm 2: veor >bb11=q8,<bb11=q8,<bb15=q10
veor q8,q8,q10

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb10 ^= bb14
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb14=reg128#15
# asm 2: veor >bb10=q9,<bb10=q9,<bb14=q14
veor q9,q9,q14

# qhasm:       bb11 ^= bb13
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb13=reg128#12
# asm 2: veor >bb11=q8,<bb11=q8,<bb13=q11
veor q8,q8,q11

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#12
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q11
veor q9,q9,q11

# qhasm:       bb13 = bb7 ^ bb1
# asm 1: veor >bb13=reg128#12,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb13=q11,<bb7=q7,<bb1=q1
veor q11,q7,q1

# qhasm:       bb12 = bb5 ^ bb6
# asm 1: veor >bb12=reg128#13,<bb5=reg128#6,<bb6=reg128#5
# asm 2: veor >bb12=q12,<bb5=q5,<bb6=q4
veor q12,q5,q4

# qhasm:       bb8 ^= bb14
# asm 1: veor >bb8=reg128#14,<bb8=reg128#14,<bb14=reg128#15
# asm 2: veor >bb8=q13,<bb8=q13,<bb14=q14
veor q13,q13,q14

# qhasm:       bb9 = bb13 | bb12
# asm 1: vorr >bb9=reg128#16,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vorr >bb9=q15,<bb13=q11,<bb12=q12
vorr q15,q11,q12

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb9 ^= bb15
# asm 1: veor >bb9=reg128#11,<bb9=reg128#16,<bb15=reg128#11
# asm 2: veor >bb9=q10,<bb9=q15,<bb15=q10
veor q10,q15,q10

# qhasm:       bb8 ^= bb13
# asm 1: veor >bb8=reg128#12,<bb8=reg128#14,<bb13=reg128#12
# asm 2: veor >bb8=q11,<bb8=q13,<bb13=q11
veor q11,q13,q11

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#15
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q14
veor q10,q10,q14

# qhasm:       bb12 = bb2 & bb3
# asm 1: vand >bb12=reg128#13,<bb2=reg128#4,<bb3=reg128#3
# asm 2: vand >bb12=q12,<bb2=q3,<bb3=q2
vand q12,q3,q2

# qhasm:       bb13 = bb4 & bb0
# asm 1: vand >bb13=reg128#14,<bb4=reg128#7,<bb0=reg128#1
# asm 2: vand >bb13=q13,<bb4=q6,<bb0=q0
vand q13,q6,q0

# qhasm:       bb11 ^= bb12
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: veor >bb11=q8,<bb11=q8,<bb12=q12
veor q8,q8,q12

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#14
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q13
veor q9,q9,q13

# qhasm:       bb14 = bb1 & bb5
# asm 1: vand >bb14=reg128#13,<bb1=reg128#2,<bb5=reg128#6
# asm 2: vand >bb14=q12,<bb1=q1,<bb5=q5
vand q12,q1,q5

# qhasm:       bb12 = bb11 ^ bb10
# asm 1: veor >bb12=reg128#14,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb12=q13,<bb11=q8,<bb10=q9
veor q13,q8,q9

# qhasm:       bb15 = bb7 | bb6
# asm 1: vorr >bb15=reg128#15,<bb7=reg128#8,<bb6=reg128#5
# asm 2: vorr >bb15=q14,<bb7=q7,<bb6=q4
vorr q14,q7,q4

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#13
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q12
veor q10,q10,q12

# qhasm:       bb8 ^= bb15
# asm 1: veor >bb8=reg128#12,<bb8=reg128#12,<bb15=reg128#15
# asm 2: veor >bb8=q11,<bb8=q11,<bb15=q14
veor q11,q11,q14

# qhasm:       bb11 &= bb9
# asm 1: vand >bb11=reg128#9,<bb11=reg128#9,<bb9=reg128#11
# asm 2: vand >bb11=q8,<bb11=q8,<bb9=q10
vand q8,q8,q10

# qhasm:       bb13 = bb9 ^ bb8
# asm 1: veor >bb13=reg128#13,<bb9=reg128#11,<bb8=reg128#12
# asm 2: veor >bb13=q12,<bb9=q10,<bb8=q11
veor q12,q10,q11

# qhasm:       bb14 = bb8 ^ bb11
# asm 1: veor >bb14=reg128#15,<bb8=reg128#12,<bb11=reg128#9
# asm 2: veor >bb14=q14,<bb8=q11,<bb11=q8
veor q14,q11,q8

# qhasm:       bb11 ^= bb10
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb11=q8,<bb11=q8,<bb10=q9
veor q8,q8,q9

# qhasm:       bb15 = bb12 & bb14
# asm 1: vand >bb15=reg128#16,<bb12=reg128#14,<bb14=reg128#15
# asm 2: vand >bb15=q15,<bb12=q13,<bb14=q14
vand q15,q13,q14

# qhasm:       bb13 &= bb11
# asm 1: vand >bb13=reg128#9,<bb13=reg128#13,<bb11=reg128#9
# asm 2: vand >bb13=q8,<bb13=q12,<bb11=q8
vand q8,q12,q8

# qhasm:       bb15 ^= bb10
# asm 1: veor >bb15=reg128#10,<bb15=reg128#16,<bb10=reg128#10
# asm 2: veor >bb15=q9,<bb15=q15,<bb10=q9
veor q9,q15,q9

# qhasm:       bb13 ^= bb8
# asm 1: veor >bb13=reg128#9,<bb13=reg128#9,<bb8=reg128#12
# asm 2: veor >bb13=q8,<bb13=q8,<bb8=q11
veor q8,q8,q11

# qhasm:       bb10 = bb14 ^ bb13
# asm 1: veor >bb10=reg128#13,<bb14=reg128#15,<bb13=reg128#9
# asm 2: veor >bb10=q12,<bb14=q14,<bb13=q8
veor q12,q14,q8

# qhasm:       bb9 ^= bb13
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb13=reg128#9
# asm 2: veor >bb9=q10,<bb9=q10,<bb13=q8
veor q10,q10,q8

# qhasm:       bb10 &= bb8
# asm 1: vand >bb10=reg128#12,<bb10=reg128#13,<bb8=reg128#12
# asm 2: vand >bb10=q11,<bb10=q12,<bb8=q11
vand q11,q12,q11

# qhasm:       bb8 = bb5 ^ bb3
# asm 1: veor >bb8=reg128#13,<bb5=reg128#6,<bb3=reg128#3
# asm 2: veor >bb8=q12,<bb5=q5,<bb3=q2
veor q12,q5,q2

# qhasm:       bb14 ^= bb10
# asm 1: veor >bb14=reg128#15,<bb14=reg128#15,<bb10=reg128#12
# asm 2: veor >bb14=q14,<bb14=q14,<bb10=q11
veor q14,q14,q11

# qhasm:       bb9 ^= bb10
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb10=reg128#12
# asm 2: veor >bb9=q10,<bb9=q10,<bb10=q11
veor q10,q10,q11

# qhasm:       bb14 &= bb15
# asm 1: vand >bb14=reg128#12,<bb14=reg128#15,<bb15=reg128#10
# asm 2: vand >bb14=q11,<bb14=q14,<bb15=q9
vand q11,q14,q9

# qhasm:       bb14 ^= bb12
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb12=reg128#14
# asm 2: veor >bb14=q11,<bb14=q11,<bb12=q13
veor q11,q11,q13

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#14,<bb6=reg128#5,<bb0=reg128#1
# asm 2: veor >bb12=q13,<bb6=q4,<bb0=q0
veor q13,q4,q0

# qhasm:       bb10 = bb15 ^ bb14
# asm 1: veor >bb10=reg128#15,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb10=q14,<bb15=q9,<bb14=q11
veor q14,q9,q11

# qhasm:       bb10 &= bb6
# asm 1: vand >bb10=reg128#15,<bb10=reg128#15,<bb6=reg128#5
# asm 2: vand >bb10=q14,<bb10=q14,<bb6=q4
vand q14,q14,q4

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb5=reg128#6
# asm 2: veor >bb6=q4,<bb6=q4,<bb5=q5
veor q4,q4,q5

# qhasm:       bb5 &= bb15
# asm 1: vand >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#10
# asm 2: vand >bb5=q5,<bb5=q5,<bb15=q9
vand q5,q5,q9

# qhasm:       bb6 &= bb14
# asm 1: vand >bb6=reg128#5,<bb6=reg128#5,<bb14=reg128#12
# asm 2: vand >bb6=q4,<bb6=q4,<bb14=q11
vand q4,q4,q11

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q11,<bb14=q11,<bb9=q10
veor q11,q11,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#10,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q9,<bb15=q9,<bb13=q8
veor q9,q9,q8

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb5=reg128#6
# asm 2: veor >bb6=q4,<bb6=q4,<bb5=q5
veor q4,q4,q5

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#16,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q15,<bb15=q9,<bb14=q11
veor q15,q9,q11

# qhasm:       bb5 ^= bb10
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb10=reg128#15
# asm 2: veor >bb5=q5,<bb5=q5,<bb10=q14
veor q5,q5,q14

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#15,<bb11=reg128#16,<bb12=reg128#14
# asm 2: vand >bb11=q14,<bb11=q15,<bb12=q13
vand q14,q15,q13

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb8=reg128#13
# asm 2: veor >bb12=q13,<bb12=q13,<bb8=q12
veor q13,q13,q12

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#13,<bb8=reg128#13,<bb15=reg128#10
# asm 2: vand >bb8=q12,<bb8=q12,<bb15=q9
vand q12,q12,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#14,<bb12=reg128#14,<bb14=reg128#12
# asm 2: vand >bb12=q13,<bb12=q13,<bb14=q11
vand q13,q13,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#13,<bb8=reg128#13,<bb12=reg128#14
# asm 2: veor >bb8=q12,<bb8=q12,<bb12=q13
veor q12,q12,q13

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb11=reg128#15
# asm 2: veor >bb12=q13,<bb12=q13,<bb11=q14
veor q13,q13,q14

# qhasm:       bb10 &= bb0
# asm 1: vand >bb10=reg128#15,<bb10=reg128#16,<bb0=reg128#1
# asm 2: vand >bb10=q14,<bb10=q15,<bb0=q0
vand q14,q15,q0

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#3
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q2
veor q0,q0,q2

# qhasm:       bb3 &= bb13
# asm 1: vand >bb3=reg128#3,<bb3=reg128#3,<bb13=reg128#9
# asm 2: vand >bb3=q2,<bb3=q2,<bb13=q8
vand q2,q2,q8

# qhasm:       bb0 &= bb9
# asm 1: vand >bb0=reg128#1,<bb0=reg128#1,<bb9=reg128#11
# asm 2: vand >bb0=q0,<bb0=q0,<bb9=q10
vand q0,q0,q10

# qhasm:       bb6 ^= bb12
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb12=reg128#14
# asm 2: veor >bb6=q4,<bb6=q4,<bb12=q13
veor q4,q4,q13

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#3
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q2
veor q0,q0,q2

# qhasm:       bb3 ^= bb10
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb10=reg128#15
# asm 2: veor >bb3=q2,<bb3=q2,<bb10=q14
veor q2,q2,q14

# qhasm:       bb0 ^= bb12
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb12=reg128#14
# asm 2: veor >bb0=q0,<bb0=q0,<bb12=q13
veor q0,q0,q13

# qhasm:       bb5 ^= bb8
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb8=reg128#13
# asm 2: veor >bb5=q5,<bb5=q5,<bb8=q12
veor q5,q5,q12

# qhasm:       bb3 ^= bb8
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb8=reg128#13
# asm 2: veor >bb3=q2,<bb3=q2,<bb8=q12
veor q2,q2,q12

# qhasm:       bb12 = bb7 ^ bb4
# asm 1: veor >bb12=reg128#13,<bb7=reg128#8,<bb4=reg128#7
# asm 2: veor >bb12=q12,<bb7=q7,<bb4=q6
veor q12,q7,q6

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#14,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q13,<bb15=q9,<bb14=q11
veor q13,q9,q11

# qhasm:       bb8 = bb1 ^ bb2
# asm 1: veor >bb8=reg128#15,<bb1=reg128#2,<bb2=reg128#4
# asm 2: veor >bb8=q14,<bb1=q1,<bb2=q3
veor q14,q1,q3

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#14,<bb11=reg128#14,<bb12=reg128#13
# asm 2: vand >bb11=q13,<bb11=q13,<bb12=q12
vand q13,q13,q12

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb8=reg128#15
# asm 2: veor >bb12=q12,<bb12=q12,<bb8=q14
veor q12,q12,q14

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#15,<bb8=reg128#15,<bb15=reg128#10
# asm 2: vand >bb8=q14,<bb8=q14,<bb15=q9
vand q14,q14,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#13,<bb12=reg128#13,<bb14=reg128#12
# asm 2: vand >bb12=q12,<bb12=q12,<bb14=q11
vand q12,q12,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#15,<bb8=reg128#15,<bb12=reg128#13
# asm 2: veor >bb8=q14,<bb8=q14,<bb12=q12
veor q14,q14,q12

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb11=reg128#14
# asm 2: veor >bb12=q12,<bb12=q12,<bb11=q13
veor q12,q12,q13

# qhasm:       bb10 &= bb4
# asm 1: vand >bb10=reg128#14,<bb10=reg128#16,<bb4=reg128#7
# asm 2: vand >bb10=q13,<bb10=q15,<bb4=q6
vand q13,q15,q6

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb2=reg128#4
# asm 2: veor >bb4=q6,<bb4=q6,<bb2=q3
veor q6,q6,q3

# qhasm:       bb2 &= bb13
# asm 1: vand >bb2=reg128#4,<bb2=reg128#4,<bb13=reg128#9
# asm 2: vand >bb2=q3,<bb2=q3,<bb13=q8
vand q3,q3,q8

# qhasm:       bb4 &= bb9
# asm 1: vand >bb4=reg128#7,<bb4=reg128#7,<bb9=reg128#11
# asm 2: vand >bb4=q6,<bb4=q6,<bb9=q10
vand q6,q6,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#9,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q8,<bb15=q9,<bb13=q8
veor q8,q9,q8

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#10,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q9,<bb14=q11,<bb9=q10
veor q9,q11,q10

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb2=reg128#4
# asm 2: veor >bb4=q6,<bb4=q6,<bb2=q3
veor q6,q6,q3

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#11,<bb15=reg128#9,<bb14=reg128#10
# asm 2: veor >bb11=q10,<bb15=q8,<bb14=q9
veor q10,q8,q9

# qhasm:       bb2 ^= bb10
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb10=reg128#14
# asm 2: veor >bb2=q3,<bb2=q3,<bb10=q13
veor q3,q3,q13

# qhasm:       bb11 &= bb7
# asm 1: vand >bb11=reg128#11,<bb11=reg128#11,<bb7=reg128#8
# asm 2: vand >bb11=q10,<bb11=q10,<bb7=q7
vand q10,q10,q7

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 &= bb15
# asm 1: vand >bb1=reg128#2,<bb1=reg128#2,<bb15=reg128#9
# asm 2: vand >bb1=q1,<bb1=q1,<bb15=q8
vand q1,q1,q8

# qhasm:       bb7 &= bb14
# asm 1: vand >bb7=reg128#8,<bb7=reg128#8,<bb14=reg128#10
# asm 2: vand >bb7=q7,<bb7=q7,<bb14=q9
vand q7,q7,q9

# qhasm:       bb4 ^= bb12
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb12=reg128#13
# asm 2: veor >bb4=q6,<bb4=q6,<bb12=q12
veor q6,q6,q12

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 ^= bb11
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb11=reg128#11
# asm 2: veor >bb1=q1,<bb1=q1,<bb11=q10
veor q1,q1,q10

# qhasm:       bb7 ^= bb12
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb12=reg128#13
# asm 2: veor >bb7=q7,<bb7=q7,<bb12=q12
veor q7,q7,q12

# qhasm:       bb1 ^= bb8
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb8=reg128#15
# asm 2: veor >bb1=q1,<bb1=q1,<bb8=q14
veor q1,q1,q14

# qhasm:       bb2 ^= bb8
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb8=reg128#15
# asm 2: veor >bb2=q3,<bb2=q3,<bb8=q14
veor q3,q3,q14

# qhasm:     bb7 ^= bb0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb0=reg128#1
# asm 2: veor >bb7=q7,<bb7=q7,<bb0=q0
veor q7,q7,q0

# qhasm:     bb1 ^= bb6
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb6=reg128#5
# asm 2: veor >bb1=q1,<bb1=q1,<bb6=q4
veor q1,q1,q4

# qhasm:     bb4 ^= bb7
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb7=reg128#8
# asm 2: veor >bb4=q6,<bb4=q6,<bb7=q7
veor q6,q6,q7

# qhasm:     bb6 ^= bb0
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb0=reg128#1
# asm 2: veor >bb6=q4,<bb6=q4,<bb0=q0
veor q4,q4,q0

# qhasm:     bb0 ^= bb1
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb1=reg128#2
# asm 2: veor >bb0=q0,<bb0=q0,<bb1=q1
veor q0,q0,q1

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:     bb5 ^= bb2
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb2=reg128#4
# asm 2: veor >bb5=q5,<bb5=q5,<bb2=q3
veor q5,q5,q3

# qhasm:     bb2 ^= bb3
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb3=reg128#3
# asm 2: veor >bb2=q3,<bb2=q3,<bb3=q2
veor q3,q3,q2

# qhasm:     bb3 ^= bb5
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb5=reg128#6
# asm 2: veor >bb3=q2,<bb3=q2,<bb5=q5
veor q2,q2,q5

# qhasm:     bb8 = bb0[3]bb0[0,1,2]
# asm 1: vext.32 >bb8=reg128#9,<bb0=reg128#1,<bb0=reg128#1,#3
# asm 2: vext.32 >bb8=q8,<bb0=q0,<bb0=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb5=reg128#6
# asm 2: veor >bb4=q6,<bb4=q6,<bb5=q5
veor q6,q6,q5

# qhasm:     bb9 = bb1[3]bb1[0,1,2]
# asm 1: vext.32 >bb9=reg128#10,<bb1=reg128#2,<bb1=reg128#2,#3
# asm 2: vext.32 >bb9=q9,<bb1=q1,<bb1=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb3=reg128#3
# asm 2: veor >bb6=q4,<bb6=q4,<bb3=q2
veor q4,q4,q2

# qhasm:     bb10 = bb4[3]bb4[0,1,2]
# asm 1: vext.32 >bb10=reg128#11,<bb4=reg128#7,<bb4=reg128#7,#3
# asm 2: vext.32 >bb10=q10,<bb4=q6,<bb4=q6,#3
vext.32 q10,q6,q6,#3

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb11 = bb6[3]bb6[0,1,2]
# asm 1: vext.32 >bb11=reg128#12,<bb6=reg128#5,<bb6=reg128#5,#3
# asm 2: vext.32 >bb11=q11,<bb6=q4,<bb6=q4,#3
vext.32 q11,q4,q4,#3

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     bb12 = bb3[3]bb3[0,1,2]
# asm 1: vext.32 >bb12=reg128#13,<bb3=reg128#3,<bb3=reg128#3,#3
# asm 2: vext.32 >bb12=q12,<bb3=q2,<bb3=q2,#3
vext.32 q12,q2,q2,#3

# qhasm:     bb4 ^= bb10
# asm 1: veor >bb4=reg128#7,<bb4=reg128#7,<bb10=reg128#11
# asm 2: veor >bb4=q6,<bb4=q6,<bb10=q10
veor q6,q6,q10

# qhasm:     bb15 = bb5[3]bb5[0,1,2]
# asm 1: vext.32 >bb15=reg128#14,<bb5=reg128#6,<bb5=reg128#6,#3
# asm 2: vext.32 >bb15=q13,<bb5=q5,<bb5=q5,#3
vext.32 q13,q5,q5,#3

# qhasm:     bb6 ^= bb11
# asm 1: veor >bb6=reg128#5,<bb6=reg128#5,<bb11=reg128#12
# asm 2: veor >bb6=q4,<bb6=q4,<bb11=q11
veor q4,q4,q11

# qhasm:     bb13 = bb7[3]bb7[0,1,2]
# asm 1: vext.32 >bb13=reg128#15,<bb7=reg128#8,<bb7=reg128#8,#3
# asm 2: vext.32 >bb13=q14,<bb7=q7,<bb7=q7,#3
vext.32 q14,q7,q7,#3

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#3,<bb3=reg128#3,<bb12=reg128#13
# asm 2: veor >bb3=q2,<bb3=q2,<bb12=q12
veor q2,q2,q12

# qhasm:     bb14 = bb2[3]bb2[0,1,2]
# asm 1: vext.32 >bb14=reg128#16,<bb2=reg128#4,<bb2=reg128#4,#3
# asm 2: vext.32 >bb14=q15,<bb2=q3,<bb2=q3,#3
vext.32 q15,q3,q3,#3

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb15=q13
veor q5,q5,q13

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb13=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb13=q14
veor q7,q7,q14

# qhasm:     bb2 ^= bb14
# asm 1: veor >bb2=reg128#4,<bb2=reg128#4,<bb14=reg128#16
# asm 2: veor >bb2=q3,<bb2=q3,<bb14=q15
veor q3,q3,q15

# qhasm:     bb9 ^= bb0
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb0=reg128#1
# asm 2: veor >bb9=q9,<bb9=q9,<bb0=q0
veor q9,q9,q0

# qhasm:     bb8 ^= bb5
# asm 1: veor >bb8=reg128#9,<bb8=reg128#9,<bb5=reg128#6
# asm 2: veor >bb8=q8,<bb8=q8,<bb5=q5
veor q8,q8,q5

# qhasm:     bb10 ^= bb1
# asm 1: veor >bb10=reg128#11,<bb10=reg128#11,<bb1=reg128#2
# asm 2: veor >bb10=q10,<bb10=q10,<bb1=q1
veor q10,q10,q1

# qhasm:     bb9 ^= bb5
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb5=reg128#6
# asm 2: veor >bb9=q9,<bb9=q9,<bb5=q5
veor q9,q9,q5

# qhasm:     bb0 = bb0[2,3]bb0[0,1]
# asm 1: vswp <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vswp <bb0=d0,<bb0=d1
vswp d0,d1

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb4=reg128#7
# asm 2: veor >bb11=q11,<bb11=q11,<bb4=q6
veor q11,q11,q6

# qhasm:     bb1 = bb1[2,3]bb1[0,1]
# asm 1: vswp <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vswp <bb1=d2,<bb1=d3
vswp d2,d3

# qhasm:     bb12 ^= bb6
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb6=reg128#5
# asm 2: veor >bb12=q12,<bb12=q12,<bb6=q4
veor q12,q12,q4

# qhasm:     bb4 = bb4[2,3]bb4[0,1]
# asm 1: vswp <bb4=reg128#7%bot,<bb4=reg128#7%top
# asm 2: vswp <bb4=d12,<bb4=d13
vswp d12,d13

# qhasm:     bb13 ^= bb3
# asm 1: veor >bb13=reg128#15,<bb13=reg128#15,<bb3=reg128#3
# asm 2: veor >bb13=q14,<bb13=q14,<bb3=q2
veor q14,q14,q2

# qhasm:     bb6 = bb6[2,3]bb6[0,1]
# asm 1: vswp <bb6=reg128#5%bot,<bb6=reg128#5%top
# asm 2: vswp <bb6=d8,<bb6=d9
vswp d8,d9

# qhasm:     bb11 ^= bb5
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb5=reg128#6
# asm 2: veor >bb11=q11,<bb11=q11,<bb5=q5
veor q11,q11,q5

# qhasm:     bb3 = bb3[2,3]bb3[0,1]
# asm 1: vswp <bb3=reg128#3%bot,<bb3=reg128#3%top
# asm 2: vswp <bb3=d4,<bb3=d5
vswp d4,d5

# qhasm:     bb14 ^= bb7
# asm 1: veor >bb14=reg128#16,<bb14=reg128#16,<bb7=reg128#8
# asm 2: veor >bb14=q15,<bb14=q15,<bb7=q7
veor q15,q15,q7

# qhasm:     bb7 = bb7[2,3]bb7[0,1]
# asm 1: vswp <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vswp <bb7=d14,<bb7=d15
vswp d14,d15

# qhasm:     bb15 ^= bb2
# asm 1: veor >bb15=reg128#14,<bb15=reg128#14,<bb2=reg128#4
# asm 2: veor >bb15=q13,<bb15=q13,<bb2=q3
veor q13,q13,q3

# qhasm:     bb2 = bb2[2,3]bb2[0,1]
# asm 1: vswp <bb2=reg128#4%bot,<bb2=reg128#4%top
# asm 2: vswp <bb2=d6,<bb2=d7
vswp d6,d7

# qhasm:     bb12 ^= bb5
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb5=reg128#6
# asm 2: veor >bb12=q12,<bb12=q12,<bb5=q5
veor q12,q12,q5

# qhasm:     bb5 = bb5[2,3]bb5[0,1]
# asm 1: vswp <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vswp <bb5=d10,<bb5=d11
vswp d10,d11

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#9,<bb0=reg128#1
# asm 2: veor >bb8=q0,<bb8=q8,<bb0=q0
veor q0,q8,q0

# qhasm:     bb0 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb0=reg128#9%bot->bb0=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb0=d16->bb0=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#10,<bb1=reg128#2
# asm 2: veor >bb9=q1,<bb9=q9,<bb1=q1
veor q1,q9,q1

# qhasm:     bb1 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb1=reg128#10%bot->bb1=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb1=d18->bb1=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb14 ^= bb2
# asm 1: veor >bb14=reg128#4,<bb14=reg128#16,<bb2=reg128#4
# asm 2: veor >bb14=q3,<bb14=q15,<bb2=q3
veor q3,q15,q3

# qhasm:     bb2 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb2=reg128#16%bot->bb2=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb2=d30->bb2=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb12 ^= bb3
# asm 1: veor >bb12=reg128#3,<bb12=reg128#13,<bb3=reg128#3
# asm 2: veor >bb12=q2,<bb12=q12,<bb3=q2
veor q2,q12,q2

# qhasm:     bb3 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb3=reg128#13%bot->bb3=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb3=d24->bb3=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb10 ^= bb4
# asm 1: veor >bb10=reg128#7,<bb10=reg128#11,<bb4=reg128#7
# asm 2: veor >bb10=q6,<bb10=q10,<bb4=q6
veor q6,q10,q6

# qhasm:     bb4 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb4=reg128#11%bot->bb4=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb4=d20->bb4=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#14,<bb5=reg128#6
# asm 2: veor >bb15=q5,<bb15=q13,<bb5=q5
veor q5,q13,q5

# qhasm:     bb5 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb5=reg128#14%bot->bb5=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb5=d26->bb5=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb11 ^= bb6
# asm 1: veor >bb11=reg128#5,<bb11=reg128#12,<bb6=reg128#5
# asm 2: veor >bb11=q4,<bb11=q11,<bb6=q4
veor q4,q11,q4

# qhasm:     bb6 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb6=reg128#12%bot->bb6=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb6=d22->bb6=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#15,<bb7=reg128#8
# asm 2: veor >bb13=q7,<bb13=q14,<bb7=q7
veor q7,q14,q7

# qhasm:     bb7 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb7=reg128#15%bot->bb7=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb7=d28->bb7=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb10 ^= bb2
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb2=reg128#16
# asm 2: veor >bb10=q6,<bb10=q6,<bb2=q15
veor q6,q6,q15

# qhasm:     bb13 ^= bb5
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb5=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb5=q13
veor q7,q7,q13

# qhasm:       bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb9=reg128#2%bot,{<bb9=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb9=d2,{<bb9=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb9=reg128#2%top,{<bb9=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb9=d3,{<bb9=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb11 ^= bb3
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb3=reg128#13
# asm 2: veor >bb11=q4,<bb11=q4,<bb3=q12
veor q4,q4,q12

# qhasm:       bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb10=reg128#7%bot,{<bb10=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb10=d12,{<bb10=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb10=reg128#7%top,{<bb10=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb10=d13,{<bb10=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb14 ^= bb6
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb6=reg128#12
# asm 2: veor >bb14=q3,<bb14=q3,<bb6=q11
veor q3,q3,q11

# qhasm:     bb15 ^= bb7
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb7=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb7=q14
veor q5,q5,q14

# qhasm:       bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb13=reg128#8%bot,{<bb13=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb13=d14,{<bb13=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb13=reg128#8%top,{<bb13=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb13=d15,{<bb13=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb12 ^= bb4
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb4=reg128#11
# asm 2: veor >bb12=q2,<bb12=q2,<bb4=q10
veor q2,q2,q10

# qhasm:       bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb8=reg128#1%bot,{<bb8=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb8=d0,{<bb8=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb8=reg128#1%top,{<bb8=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb8=d1,{<bb8=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb10 ^= bb9
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb9=reg128#2
# asm 2: veor >bb10=q6,<bb10=q6,<bb9=q1
veor q6,q6,q1

# qhasm:       bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb11=reg128#5%bot,{<bb11=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb11=d8,{<bb11=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb11=reg128#5%top,{<bb11=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb11=d9,{<bb11=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb13 ^= bb8
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb8=reg128#1
# asm 2: veor >bb13=q7,<bb13=q7,<bb8=q0
veor q7,q7,q0

# qhasm:       bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb14=reg128#4%bot,{<bb14=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb14=d6,{<bb14=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb14=reg128#4%top,{<bb14=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb14=d7,{<bb14=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb11 ^= bb8
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb8=reg128#1
# asm 2: veor >bb11=q4,<bb11=q4,<bb8=q0
veor q4,q4,q0

# qhasm:       bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb15=reg128#6%bot,{<bb15=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb15=d10,{<bb15=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb15=reg128#6%top,{<bb15=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb15=d11,{<bb15=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb13 ^= bb14
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb14=reg128#4
# asm 2: veor >bb13=q7,<bb13=q7,<bb14=q3
veor q7,q7,q3

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb11=reg128#5
# asm 2: veor >bb14=q3,<bb14=q3,<bb11=q4
veor q3,q3,q4

# qhasm:     bb11 ^= bb15
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb15=reg128#6
# asm 2: veor >bb11=q4,<bb11=q4,<bb15=q5
veor q4,q4,q5

# qhasm:       bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb12=reg128#3%bot,{<bb12=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb12=d4,{<bb12=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb12=reg128#3%top,{<bb12=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb12=d5,{<bb12=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb14 ^= bb10
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb10=reg128#7
# asm 2: veor >bb14=q3,<bb14=q3,<bb10=q6
veor q3,q3,q6

# qhasm:     bb15 ^= bb13
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb13=reg128#8
# asm 2: veor >bb15=q5,<bb15=q5,<bb13=q7
veor q5,q5,q7

# qhasm:     bb11 ^= bb12
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb12=reg128#3
# asm 2: veor >bb11=q4,<bb11=q4,<bb12=q2
veor q4,q4,q2

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb13=reg128#8
# asm 2: veor >bb12=q2,<bb12=q2,<bb13=q7
veor q2,q2,q7

# qhasm:     bb11 ^= bb9
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb9=reg128#2
# asm 2: veor >bb11=q4,<bb11=q4,<bb9=q1
veor q4,q4,q1

# qhasm:     bb10 ^= bb15
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb15=reg128#6
# asm 2: veor >bb10=q6,<bb10=q6,<bb15=q5
veor q6,q6,q5

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:       bb3 = bb15 ^ bb12
# asm 1: veor >bb3=reg128#9,<bb15=reg128#6,<bb12=reg128#3
# asm 2: veor >bb3=q8,<bb15=q5,<bb12=q2
veor q8,q5,q2

# qhasm:       bb2 = bb9 ^ bb10
# asm 1: veor >bb2=reg128#10,<bb9=reg128#2,<bb10=reg128#7
# asm 2: veor >bb2=q9,<bb9=q1,<bb10=q6
veor q9,q1,q6

# qhasm:       bb1 = bb13 ^ bb11
# asm 1: veor >bb1=reg128#11,<bb13=reg128#8,<bb11=reg128#5
# asm 2: veor >bb1=q10,<bb13=q7,<bb11=q4
veor q10,q7,q4

# qhasm:       bb5 = bb10 ^ bb12
# asm 1: veor >bb5=reg128#12,<bb10=reg128#7,<bb12=reg128#3
# asm 2: veor >bb5=q11,<bb10=q6,<bb12=q2
veor q11,q6,q2

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb14=reg128#4,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb14=q3,<bb8=q0
veor q12,q3,q0

# qhasm:       bb0 = bb2 & bb1
# asm 1: vand >bb0=reg128#14,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vand >bb0=q13,<bb2=q9,<bb1=q10
vand q13,q9,q10

# qhasm:       bb6 = bb3 & bb4
# asm 1: vand >bb6=reg128#15,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vand >bb6=q14,<bb3=q8,<bb4=q12
vand q14,q8,q12

# qhasm:       bb7 = bb3 ^ bb2
# asm 1: veor >bb7=reg128#16,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb7=q15,<bb3=q8,<bb2=q9
veor q15,q8,q9

# qhasm:       bb3 |= bb4
# asm 1: vorr >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vorr >bb3=q8,<bb3=q8,<bb4=q12
vorr q8,q8,q12

# qhasm:       bb4 ^= bb1
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb1=reg128#11
# asm 2: veor >bb4=q12,<bb4=q12,<bb1=q10
veor q12,q12,q10

# qhasm:       bb2 |= bb1
# asm 1: vorr >bb2=reg128#10,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vorr >bb2=q9,<bb2=q9,<bb1=q10
vorr q9,q9,q10

# qhasm:       bb7 &= bb4
# asm 1: vand >bb7=reg128#11,<bb7=reg128#16,<bb4=reg128#13
# asm 2: vand >bb7=q10,<bb7=q15,<bb4=q12
vand q10,q15,q12

# qhasm:       bb4 = bb11 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb11=reg128#5,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb11=q4,<bb8=q0
veor q12,q4,q0

# qhasm:       bb3 ^= bb7
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb7=reg128#11
# asm 2: veor >bb3=q8,<bb3=q8,<bb7=q10
veor q8,q8,q10

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb2 ^= bb6
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb6=reg128#15
# asm 2: veor >bb2=q9,<bb2=q9,<bb6=q14
veor q9,q9,q14

# qhasm:       bb3 ^= bb5
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb5=reg128#12
# asm 2: veor >bb3=q8,<bb3=q8,<bb5=q11
veor q8,q8,q11

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#12
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q11
veor q9,q9,q11

# qhasm:       bb5 = bb15 ^ bb9
# asm 1: veor >bb5=reg128#12,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb5=q11,<bb15=q5,<bb9=q1
veor q11,q5,q1

# qhasm:       bb4 = bb13 ^ bb14
# asm 1: veor >bb4=reg128#13,<bb13=reg128#8,<bb14=reg128#4
# asm 2: veor >bb4=q12,<bb13=q7,<bb14=q3
veor q12,q7,q3

# qhasm:       bb0 ^= bb6
# asm 1: veor >bb0=reg128#14,<bb0=reg128#14,<bb6=reg128#15
# asm 2: veor >bb0=q13,<bb0=q13,<bb6=q14
veor q13,q13,q14

# qhasm:       bb1 = bb5 | bb4
# asm 1: vorr >bb1=reg128#16,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vorr >bb1=q15,<bb5=q11,<bb4=q12
vorr q15,q11,q12

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb1 ^= bb7
# asm 1: veor >bb1=reg128#11,<bb1=reg128#16,<bb7=reg128#11
# asm 2: veor >bb1=q10,<bb1=q15,<bb7=q10
veor q10,q15,q10

# qhasm:       bb0 ^= bb5
# asm 1: veor >bb0=reg128#12,<bb0=reg128#14,<bb5=reg128#12
# asm 2: veor >bb0=q11,<bb0=q13,<bb5=q11
veor q11,q13,q11

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#15
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q14
veor q10,q10,q14

# qhasm:       bb4 = bb10 & bb11
# asm 1: vand >bb4=reg128#13,<bb10=reg128#7,<bb11=reg128#5
# asm 2: vand >bb4=q12,<bb10=q6,<bb11=q4
vand q12,q6,q4

# qhasm:       bb5 = bb12 & bb8
# asm 1: vand >bb5=reg128#14,<bb12=reg128#3,<bb8=reg128#1
# asm 2: vand >bb5=q13,<bb12=q2,<bb8=q0
vand q13,q2,q0

# qhasm:       bb3 ^= bb4
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: veor >bb3=q8,<bb3=q8,<bb4=q12
veor q8,q8,q12

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#14
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q13
veor q9,q9,q13

# qhasm:       bb6 = bb9 & bb13
# asm 1: vand >bb6=reg128#13,<bb9=reg128#2,<bb13=reg128#8
# asm 2: vand >bb6=q12,<bb9=q1,<bb13=q7
vand q12,q1,q7

# qhasm:       bb4 = bb3 ^ bb2
# asm 1: veor >bb4=reg128#14,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb4=q13,<bb3=q8,<bb2=q9
veor q13,q8,q9

# qhasm:       bb7 = bb15 | bb14
# asm 1: vorr >bb7=reg128#15,<bb15=reg128#6,<bb14=reg128#4
# asm 2: vorr >bb7=q14,<bb15=q5,<bb14=q3
vorr q14,q5,q3

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#13
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q12
veor q10,q10,q12

# qhasm:       bb0 ^= bb7
# asm 1: veor >bb0=reg128#12,<bb0=reg128#12,<bb7=reg128#15
# asm 2: veor >bb0=q11,<bb0=q11,<bb7=q14
veor q11,q11,q14

# qhasm:       bb3 &= bb1
# asm 1: vand >bb3=reg128#9,<bb3=reg128#9,<bb1=reg128#11
# asm 2: vand >bb3=q8,<bb3=q8,<bb1=q10
vand q8,q8,q10

# qhasm:       bb5 = bb1 ^ bb0
# asm 1: veor >bb5=reg128#13,<bb1=reg128#11,<bb0=reg128#12
# asm 2: veor >bb5=q12,<bb1=q10,<bb0=q11
veor q12,q10,q11

# qhasm:       bb6 = bb0 ^ bb3
# asm 1: veor >bb6=reg128#15,<bb0=reg128#12,<bb3=reg128#9
# asm 2: veor >bb6=q14,<bb0=q11,<bb3=q8
veor q14,q11,q8

# qhasm:       bb3 ^= bb2
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb3=q8,<bb3=q8,<bb2=q9
veor q8,q8,q9

# qhasm:       bb7 = bb4 & bb6
# asm 1: vand >bb7=reg128#16,<bb4=reg128#14,<bb6=reg128#15
# asm 2: vand >bb7=q15,<bb4=q13,<bb6=q14
vand q15,q13,q14

# qhasm:       bb5 &= bb3
# asm 1: vand >bb5=reg128#9,<bb5=reg128#13,<bb3=reg128#9
# asm 2: vand >bb5=q8,<bb5=q12,<bb3=q8
vand q8,q12,q8

# qhasm:       bb7 ^= bb2
# asm 1: veor >bb7=reg128#10,<bb7=reg128#16,<bb2=reg128#10
# asm 2: veor >bb7=q9,<bb7=q15,<bb2=q9
veor q9,q15,q9

# qhasm:       bb5 ^= bb0
# asm 1: veor >bb5=reg128#9,<bb5=reg128#9,<bb0=reg128#12
# asm 2: veor >bb5=q8,<bb5=q8,<bb0=q11
veor q8,q8,q11

# qhasm:       bb2 = bb6 ^ bb5
# asm 1: veor >bb2=reg128#13,<bb6=reg128#15,<bb5=reg128#9
# asm 2: veor >bb2=q12,<bb6=q14,<bb5=q8
veor q12,q14,q8

# qhasm:       bb1 ^= bb5
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb5=reg128#9
# asm 2: veor >bb1=q10,<bb1=q10,<bb5=q8
veor q10,q10,q8

# qhasm:       bb2 &= bb0
# asm 1: vand >bb2=reg128#12,<bb2=reg128#13,<bb0=reg128#12
# asm 2: vand >bb2=q11,<bb2=q12,<bb0=q11
vand q11,q12,q11

# qhasm:       bb0 = bb13 ^ bb11
# asm 1: veor >bb0=reg128#13,<bb13=reg128#8,<bb11=reg128#5
# asm 2: veor >bb0=q12,<bb13=q7,<bb11=q4
veor q12,q7,q4

# qhasm:       bb6 ^= bb2
# asm 1: veor >bb6=reg128#15,<bb6=reg128#15,<bb2=reg128#12
# asm 2: veor >bb6=q14,<bb6=q14,<bb2=q11
veor q14,q14,q11

# qhasm:       bb1 ^= bb2
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb2=reg128#12
# asm 2: veor >bb1=q10,<bb1=q10,<bb2=q11
veor q10,q10,q11

# qhasm:       bb6 &= bb7
# asm 1: vand >bb6=reg128#12,<bb6=reg128#15,<bb7=reg128#10
# asm 2: vand >bb6=q11,<bb6=q14,<bb7=q9
vand q11,q14,q9

# qhasm:       bb6 ^= bb4
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb4=reg128#14
# asm 2: veor >bb6=q11,<bb6=q11,<bb4=q13
veor q11,q11,q13

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#14,<bb14=reg128#4,<bb8=reg128#1
# asm 2: veor >bb4=q13,<bb14=q3,<bb8=q0
veor q13,q3,q0

# qhasm:       bb2 = bb7 ^ bb6
# asm 1: veor >bb2=reg128#15,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb2=q14,<bb7=q9,<bb6=q11
veor q14,q9,q11

# qhasm:       bb2 &= bb14
# asm 1: vand >bb2=reg128#15,<bb2=reg128#15,<bb14=reg128#4
# asm 2: vand >bb2=q14,<bb2=q14,<bb14=q3
vand q14,q14,q3

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb13=reg128#8
# asm 2: veor >bb14=q3,<bb14=q3,<bb13=q7
veor q3,q3,q7

# qhasm:       bb13 &= bb7
# asm 1: vand >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#10
# asm 2: vand >bb13=q7,<bb13=q7,<bb7=q9
vand q7,q7,q9

# qhasm:       bb14 &= bb6
# asm 1: vand >bb14=reg128#4,<bb14=reg128#4,<bb6=reg128#12
# asm 2: vand >bb14=q3,<bb14=q3,<bb6=q11
vand q3,q3,q11

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q11,<bb6=q11,<bb1=q10
veor q11,q11,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#10,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q9,<bb7=q9,<bb5=q8
veor q9,q9,q8

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb13=reg128#8
# asm 2: veor >bb14=q3,<bb14=q3,<bb13=q7
veor q3,q3,q7

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#16,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q15,<bb7=q9,<bb6=q11
veor q15,q9,q11

# qhasm:       bb13 ^= bb2
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb2=reg128#15
# asm 2: veor >bb13=q7,<bb13=q7,<bb2=q14
veor q7,q7,q14

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#15,<bb3=reg128#16,<bb4=reg128#14
# asm 2: vand >bb3=q14,<bb3=q15,<bb4=q13
vand q14,q15,q13

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb0=reg128#13
# asm 2: veor >bb4=q13,<bb4=q13,<bb0=q12
veor q13,q13,q12

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#13,<bb0=reg128#13,<bb7=reg128#10
# asm 2: vand >bb0=q12,<bb0=q12,<bb7=q9
vand q12,q12,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#14,<bb4=reg128#14,<bb6=reg128#12
# asm 2: vand >bb4=q13,<bb4=q13,<bb6=q11
vand q13,q13,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#13,<bb0=reg128#13,<bb4=reg128#14
# asm 2: veor >bb0=q12,<bb0=q12,<bb4=q13
veor q12,q12,q13

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb3=reg128#15
# asm 2: veor >bb4=q13,<bb4=q13,<bb3=q14
veor q13,q13,q14

# qhasm:       bb2 &= bb8
# asm 1: vand >bb2=reg128#15,<bb2=reg128#16,<bb8=reg128#1
# asm 2: vand >bb2=q14,<bb2=q15,<bb8=q0
vand q14,q15,q0

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#5
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q4
veor q0,q0,q4

# qhasm:       bb11 &= bb5
# asm 1: vand >bb11=reg128#5,<bb11=reg128#5,<bb5=reg128#9
# asm 2: vand >bb11=q4,<bb11=q4,<bb5=q8
vand q4,q4,q8

# qhasm:       bb8 &= bb1
# asm 1: vand >bb8=reg128#1,<bb8=reg128#1,<bb1=reg128#11
# asm 2: vand >bb8=q0,<bb8=q0,<bb1=q10
vand q0,q0,q10

# qhasm:       bb14 ^= bb4
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb4=reg128#14
# asm 2: veor >bb14=q3,<bb14=q3,<bb4=q13
veor q3,q3,q13

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#5
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q4
veor q0,q0,q4

# qhasm:       bb11 ^= bb2
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb2=reg128#15
# asm 2: veor >bb11=q4,<bb11=q4,<bb2=q14
veor q4,q4,q14

# qhasm:       bb8 ^= bb4
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb4=reg128#14
# asm 2: veor >bb8=q0,<bb8=q0,<bb4=q13
veor q0,q0,q13

# qhasm:       bb13 ^= bb0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb0=reg128#13
# asm 2: veor >bb13=q7,<bb13=q7,<bb0=q12
veor q7,q7,q12

# qhasm:       bb11 ^= bb0
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb0=reg128#13
# asm 2: veor >bb11=q4,<bb11=q4,<bb0=q12
veor q4,q4,q12

# qhasm:       bb4 = bb15 ^ bb12
# asm 1: veor >bb4=reg128#13,<bb15=reg128#6,<bb12=reg128#3
# asm 2: veor >bb4=q12,<bb15=q5,<bb12=q2
veor q12,q5,q2

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#14,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q13,<bb7=q9,<bb6=q11
veor q13,q9,q11

# qhasm:       bb0 = bb9 ^ bb10
# asm 1: veor >bb0=reg128#15,<bb9=reg128#2,<bb10=reg128#7
# asm 2: veor >bb0=q14,<bb9=q1,<bb10=q6
veor q14,q1,q6

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#14,<bb3=reg128#14,<bb4=reg128#13
# asm 2: vand >bb3=q13,<bb3=q13,<bb4=q12
vand q13,q13,q12

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb0=reg128#15
# asm 2: veor >bb4=q12,<bb4=q12,<bb0=q14
veor q12,q12,q14

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#15,<bb0=reg128#15,<bb7=reg128#10
# asm 2: vand >bb0=q14,<bb0=q14,<bb7=q9
vand q14,q14,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#13,<bb4=reg128#13,<bb6=reg128#12
# asm 2: vand >bb4=q12,<bb4=q12,<bb6=q11
vand q12,q12,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#15,<bb0=reg128#15,<bb4=reg128#13
# asm 2: veor >bb0=q14,<bb0=q14,<bb4=q12
veor q14,q14,q12

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb3=reg128#14
# asm 2: veor >bb4=q12,<bb4=q12,<bb3=q13
veor q12,q12,q13

# qhasm:       bb2 &= bb12
# asm 1: vand >bb2=reg128#14,<bb2=reg128#16,<bb12=reg128#3
# asm 2: vand >bb2=q13,<bb2=q15,<bb12=q2
vand q13,q15,q2

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb10=reg128#7
# asm 2: veor >bb12=q2,<bb12=q2,<bb10=q6
veor q2,q2,q6

# qhasm:       bb10 &= bb5
# asm 1: vand >bb10=reg128#7,<bb10=reg128#7,<bb5=reg128#9
# asm 2: vand >bb10=q6,<bb10=q6,<bb5=q8
vand q6,q6,q8

# qhasm:       bb12 &= bb1
# asm 1: vand >bb12=reg128#3,<bb12=reg128#3,<bb1=reg128#11
# asm 2: vand >bb12=q2,<bb12=q2,<bb1=q10
vand q2,q2,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#9,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q8,<bb7=q9,<bb5=q8
veor q8,q9,q8

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#10,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q9,<bb6=q11,<bb1=q10
veor q9,q11,q10

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb10=reg128#7
# asm 2: veor >bb12=q2,<bb12=q2,<bb10=q6
veor q2,q2,q6

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#11,<bb7=reg128#9,<bb6=reg128#10
# asm 2: veor >bb3=q10,<bb7=q8,<bb6=q9
veor q10,q8,q9

# qhasm:       bb10 ^= bb2
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb2=reg128#14
# asm 2: veor >bb10=q6,<bb10=q6,<bb2=q13
veor q6,q6,q13

# qhasm:       bb3 &= bb15
# asm 1: vand >bb3=reg128#11,<bb3=reg128#11,<bb15=reg128#6
# asm 2: vand >bb3=q10,<bb3=q10,<bb15=q5
vand q10,q10,q5

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 &= bb7
# asm 1: vand >bb9=reg128#2,<bb9=reg128#2,<bb7=reg128#9
# asm 2: vand >bb9=q1,<bb9=q1,<bb7=q8
vand q1,q1,q8

# qhasm:       bb15 &= bb6
# asm 1: vand >bb15=reg128#6,<bb15=reg128#6,<bb6=reg128#10
# asm 2: vand >bb15=q5,<bb15=q5,<bb6=q9
vand q5,q5,q9

# qhasm:       bb12 ^= bb4
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb4=reg128#13
# asm 2: veor >bb12=q2,<bb12=q2,<bb4=q12
veor q2,q2,q12

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 ^= bb3
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb3=reg128#11
# asm 2: veor >bb9=q1,<bb9=q1,<bb3=q10
veor q1,q1,q10

# qhasm:       bb15 ^= bb4
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb4=reg128#13
# asm 2: veor >bb15=q5,<bb15=q5,<bb4=q12
veor q5,q5,q12

# qhasm:       bb9 ^= bb0
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb0=reg128#15
# asm 2: veor >bb9=q1,<bb9=q1,<bb0=q14
veor q1,q1,q14

# qhasm:       bb10 ^= bb0
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb0=reg128#15
# asm 2: veor >bb10=q6,<bb10=q6,<bb0=q14
veor q6,q6,q14

# qhasm:     bb15 ^= bb8
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb8=reg128#1
# asm 2: veor >bb15=q5,<bb15=q5,<bb8=q0
veor q5,q5,q0

# qhasm:     bb9 ^= bb14
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb14=reg128#4
# asm 2: veor >bb9=q1,<bb9=q1,<bb14=q3
veor q1,q1,q3

# qhasm:     bb12 ^= bb15
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb15=reg128#6
# asm 2: veor >bb12=q2,<bb12=q2,<bb15=q5
veor q2,q2,q5

# qhasm:     bb14 ^= bb8
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb8=reg128#1
# asm 2: veor >bb14=q3,<bb14=q3,<bb8=q0
veor q3,q3,q0

# qhasm:     bb8 ^= bb9
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb9=reg128#2
# asm 2: veor >bb8=q0,<bb8=q0,<bb9=q1
veor q0,q0,q1

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:     bb13 ^= bb10
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb10=reg128#7
# asm 2: veor >bb13=q7,<bb13=q7,<bb10=q6
veor q7,q7,q6

# qhasm:     bb10 ^= bb11
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb11=reg128#5
# asm 2: veor >bb10=q6,<bb10=q6,<bb11=q4
veor q6,q6,q4

# qhasm:     bb11 ^= bb13
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb13=reg128#8
# asm 2: veor >bb11=q4,<bb11=q4,<bb13=q7
veor q4,q4,q7

# qhasm:     bb0 = bb8[3]bb8[0,1,2]
# asm 1: vext.32 >bb0=reg128#9,<bb8=reg128#1,<bb8=reg128#1,#3
# asm 2: vext.32 >bb0=q8,<bb8=q0,<bb8=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb13=reg128#8
# asm 2: veor >bb12=q2,<bb12=q2,<bb13=q7
veor q2,q2,q7

# qhasm:     bb1 = bb9[3]bb9[0,1,2]
# asm 1: vext.32 >bb1=reg128#10,<bb9=reg128#2,<bb9=reg128#2,#3
# asm 2: vext.32 >bb1=q9,<bb9=q1,<bb9=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb11=reg128#5
# asm 2: veor >bb14=q3,<bb14=q3,<bb11=q4
veor q3,q3,q4

# qhasm:     bb2 = bb12[3]bb12[0,1,2]
# asm 1: vext.32 >bb2=reg128#11,<bb12=reg128#3,<bb12=reg128#3,#3
# asm 2: vext.32 >bb2=q10,<bb12=q2,<bb12=q2,#3
vext.32 q10,q2,q2,#3

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb3 = bb14[3]bb14[0,1,2]
# asm 1: vext.32 >bb3=reg128#12,<bb14=reg128#4,<bb14=reg128#4,#3
# asm 2: vext.32 >bb3=q11,<bb14=q3,<bb14=q3,#3
vext.32 q11,q3,q3,#3

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:     bb4 = bb11[3]bb11[0,1,2]
# asm 1: vext.32 >bb4=reg128#13,<bb11=reg128#5,<bb11=reg128#5,#3
# asm 2: vext.32 >bb4=q12,<bb11=q4,<bb11=q4,#3
vext.32 q12,q4,q4,#3

# qhasm:     bb12 ^= bb2
# asm 1: veor >bb12=reg128#3,<bb12=reg128#3,<bb2=reg128#11
# asm 2: veor >bb12=q2,<bb12=q2,<bb2=q10
veor q2,q2,q10

# qhasm:     bb7 = bb13[3]bb13[0,1,2]
# asm 1: vext.32 >bb7=reg128#14,<bb13=reg128#8,<bb13=reg128#8,#3
# asm 2: vext.32 >bb7=q13,<bb13=q7,<bb13=q7,#3
vext.32 q13,q7,q7,#3

# qhasm:     bb14 ^= bb3
# asm 1: veor >bb14=reg128#4,<bb14=reg128#4,<bb3=reg128#12
# asm 2: veor >bb14=q3,<bb14=q3,<bb3=q11
veor q3,q3,q11

# qhasm:     bb5 = bb15[3]bb15[0,1,2]
# asm 1: vext.32 >bb5=reg128#15,<bb15=reg128#6,<bb15=reg128#6,#3
# asm 2: vext.32 >bb5=q14,<bb15=q5,<bb15=q5,#3
vext.32 q14,q5,q5,#3

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#5,<bb11=reg128#5,<bb4=reg128#13
# asm 2: veor >bb11=q4,<bb11=q4,<bb4=q12
veor q4,q4,q12

# qhasm:     bb6 = bb10[3]bb10[0,1,2]
# asm 1: vext.32 >bb6=reg128#16,<bb10=reg128#7,<bb10=reg128#7,#3
# asm 2: vext.32 >bb6=q15,<bb10=q6,<bb10=q6,#3
vext.32 q15,q6,q6,#3

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb7=q13
veor q7,q7,q13

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb5=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb5=q14
veor q5,q5,q14

# qhasm:     bb10 ^= bb6
# asm 1: veor >bb10=reg128#7,<bb10=reg128#7,<bb6=reg128#16
# asm 2: veor >bb10=q6,<bb10=q6,<bb6=q15
veor q6,q6,q15

# qhasm:     bb1 ^= bb8
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb8=reg128#1
# asm 2: veor >bb1=q9,<bb1=q9,<bb8=q0
veor q9,q9,q0

# qhasm:     bb0 ^= bb13
# asm 1: veor >bb0=reg128#9,<bb0=reg128#9,<bb13=reg128#8
# asm 2: veor >bb0=q8,<bb0=q8,<bb13=q7
veor q8,q8,q7

# qhasm:     bb2 ^= bb9
# asm 1: veor >bb2=reg128#11,<bb2=reg128#11,<bb9=reg128#2
# asm 2: veor >bb2=q10,<bb2=q10,<bb9=q1
veor q10,q10,q1

# qhasm:     bb1 ^= bb13
# asm 1: veor >bb1=reg128#10,<bb1=reg128#10,<bb13=reg128#8
# asm 2: veor >bb1=q9,<bb1=q9,<bb13=q7
veor q9,q9,q7

# qhasm:     bb8 = bb8[2,3]bb8[0,1]
# asm 1: vswp <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vswp <bb8=d0,<bb8=d1
vswp d0,d1

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb12=reg128#3
# asm 2: veor >bb3=q11,<bb3=q11,<bb12=q2
veor q11,q11,q2

# qhasm:     bb9 = bb9[2,3]bb9[0,1]
# asm 1: vswp <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vswp <bb9=d2,<bb9=d3
vswp d2,d3

# qhasm:     bb4 ^= bb14
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb14=reg128#4
# asm 2: veor >bb4=q12,<bb4=q12,<bb14=q3
veor q12,q12,q3

# qhasm:     bb12 = bb12[2,3]bb12[0,1]
# asm 1: vswp <bb12=reg128#3%bot,<bb12=reg128#3%top
# asm 2: vswp <bb12=d4,<bb12=d5
vswp d4,d5

# qhasm:     bb5 ^= bb11
# asm 1: veor >bb5=reg128#15,<bb5=reg128#15,<bb11=reg128#5
# asm 2: veor >bb5=q14,<bb5=q14,<bb11=q4
veor q14,q14,q4

# qhasm:     bb14 = bb14[2,3]bb14[0,1]
# asm 1: vswp <bb14=reg128#4%bot,<bb14=reg128#4%top
# asm 2: vswp <bb14=d6,<bb14=d7
vswp d6,d7

# qhasm:     bb3 ^= bb13
# asm 1: veor >bb3=reg128#12,<bb3=reg128#12,<bb13=reg128#8
# asm 2: veor >bb3=q11,<bb3=q11,<bb13=q7
veor q11,q11,q7

# qhasm:     bb11 = bb11[2,3]bb11[0,1]
# asm 1: vswp <bb11=reg128#5%bot,<bb11=reg128#5%top
# asm 2: vswp <bb11=d8,<bb11=d9
vswp d8,d9

# qhasm:     bb6 ^= bb15
# asm 1: veor >bb6=reg128#16,<bb6=reg128#16,<bb15=reg128#6
# asm 2: veor >bb6=q15,<bb6=q15,<bb15=q5
veor q15,q15,q5

# qhasm:     bb15 = bb15[2,3]bb15[0,1]
# asm 1: vswp <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vswp <bb15=d10,<bb15=d11
vswp d10,d11

# qhasm:     bb7 ^= bb10
# asm 1: veor >bb7=reg128#14,<bb7=reg128#14,<bb10=reg128#7
# asm 2: veor >bb7=q13,<bb7=q13,<bb10=q6
veor q13,q13,q6

# qhasm:     bb10 = bb10[2,3]bb10[0,1]
# asm 1: vswp <bb10=reg128#7%bot,<bb10=reg128#7%top
# asm 2: vswp <bb10=d12,<bb10=d13
vswp d12,d13

# qhasm:     bb4 ^= bb13
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb13=reg128#8
# asm 2: veor >bb4=q12,<bb4=q12,<bb13=q7
veor q12,q12,q7

# qhasm:     bb13 = bb13[2,3]bb13[0,1]
# asm 1: vswp <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vswp <bb13=d14,<bb13=d15
vswp d14,d15

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#9,<bb8=reg128#1
# asm 2: veor >bb0=q0,<bb0=q8,<bb8=q0
veor q0,q8,q0

# qhasm:     bb8 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb8=reg128#9%bot->bb8=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb8=d16->bb8=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#10,<bb9=reg128#2
# asm 2: veor >bb1=q1,<bb1=q9,<bb9=q1
veor q1,q9,q1

# qhasm:     bb9 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb9=reg128#10%bot->bb9=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb9=d18->bb9=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb6 ^= bb10
# asm 1: veor >bb6=reg128#7,<bb6=reg128#16,<bb10=reg128#7
# asm 2: veor >bb6=q6,<bb6=q15,<bb10=q6
veor q6,q15,q6

# qhasm:     bb10 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb10=reg128#16%bot->bb10=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb10=d30->bb10=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb4 ^= bb11
# asm 1: veor >bb4=reg128#5,<bb4=reg128#13,<bb11=reg128#5
# asm 2: veor >bb4=q4,<bb4=q12,<bb11=q4
veor q4,q12,q4

# qhasm:     bb11 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb11=reg128#13%bot->bb11=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb11=d24->bb11=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb2 ^= bb12
# asm 1: veor >bb2=reg128#3,<bb2=reg128#11,<bb12=reg128#3
# asm 2: veor >bb2=q2,<bb2=q10,<bb12=q2
veor q2,q10,q2

# qhasm:     bb12 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb12=reg128#11%bot->bb12=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb12=d20->bb12=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#14,<bb13=reg128#8
# asm 2: veor >bb7=q7,<bb7=q13,<bb13=q7
veor q7,q13,q7

# qhasm:     bb13 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb13=reg128#14%bot->bb13=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb13=d26->bb13=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb3 ^= bb14
# asm 1: veor >bb3=reg128#4,<bb3=reg128#12,<bb14=reg128#4
# asm 2: veor >bb3=q3,<bb3=q11,<bb14=q3
veor q3,q11,q3

# qhasm:     bb14 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb14=reg128#12%bot->bb14=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb14=d22->bb14=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#15,<bb15=reg128#6
# asm 2: veor >bb5=q5,<bb5=q14,<bb15=q5
veor q5,q14,q5

# qhasm:     bb15 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb15=reg128#15%bot->bb15=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb15=d28->bb15=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#10%bot->SR=reg128#10%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d18->SR=d19},[<z=r4,: 128]
vld1.8 {d18-d19},[r4,: 128]

# qhasm:     bb2 ^= bb10
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb10=reg128#16
# asm 2: veor >bb2=q2,<bb2=q2,<bb10=q15
veor q2,q2,q15

# qhasm:     bb5 ^= bb13
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb13=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb13=q13
veor q5,q5,q13

# qhasm:       bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb1=reg128#2%bot,{<bb1=reg128#2%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb1=d2,{<bb1=d2},<SR=d18
vtbl.8 d2,{d2},d18

# qhasm:       bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb1=reg128#2%top,{<bb1=reg128#2%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb1=d3,{<bb1=d3},<SR=d19
vtbl.8 d3,{d3},d19

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb3 ^= bb11
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb11=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb11=q12
veor q3,q3,q12

# qhasm:       bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb2=reg128#3%bot,{<bb2=reg128#3%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb2=d4,{<bb2=d4},<SR=d18
vtbl.8 d4,{d4},d18

# qhasm:       bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb2=reg128#3%top,{<bb2=reg128#3%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb2=d5,{<bb2=d5},<SR=d19
vtbl.8 d5,{d5},d19

# qhasm:     bb6 ^= bb14
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb14=reg128#12
# asm 2: veor >bb6=q6,<bb6=q6,<bb14=q11
veor q6,q6,q11

# qhasm:     bb7 ^= bb15
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb15=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb15=q14
veor q7,q7,q14

# qhasm:       bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb5=reg128#6%bot,{<bb5=reg128#6%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb5=d10,{<bb5=d10},<SR=d18
vtbl.8 d10,{d10},d18

# qhasm:       bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb5=reg128#6%top,{<bb5=reg128#6%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb5=d11,{<bb5=d11},<SR=d19
vtbl.8 d11,{d11},d19

# qhasm:     bb4 ^= bb12
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb12=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<bb12=q10
veor q4,q4,q10

# qhasm:       bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb0=reg128#1%bot,{<bb0=reg128#1%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb0=d0,{<bb0=d0},<SR=d18
vtbl.8 d0,{d0},d18

# qhasm:       bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb0=reg128#1%top,{<bb0=reg128#1%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb0=d1,{<bb0=d1},<SR=d19
vtbl.8 d1,{d1},d19

# qhasm:     bb2 ^= bb1
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb1=reg128#2
# asm 2: veor >bb2=q2,<bb2=q2,<bb1=q1
veor q2,q2,q1

# qhasm:       bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb3=reg128#4%bot,{<bb3=reg128#4%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb3=d6,{<bb3=d6},<SR=d18
vtbl.8 d6,{d6},d18

# qhasm:       bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb3=reg128#4%top,{<bb3=reg128#4%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb3=d7,{<bb3=d7},<SR=d19
vtbl.8 d7,{d7},d19

# qhasm:     bb5 ^= bb0
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb0=reg128#1
# asm 2: veor >bb5=q5,<bb5=q5,<bb0=q0
veor q5,q5,q0

# qhasm:       bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb6=reg128#7%bot,{<bb6=reg128#7%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb6=d12,{<bb6=d12},<SR=d18
vtbl.8 d12,{d12},d18

# qhasm:       bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb6=reg128#7%top,{<bb6=reg128#7%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb6=d13,{<bb6=d13},<SR=d19
vtbl.8 d13,{d13},d19

# qhasm:     bb3 ^= bb0
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb0=reg128#1
# asm 2: veor >bb3=q3,<bb3=q3,<bb0=q0
veor q3,q3,q0

# qhasm:       bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb7=reg128#8%bot,{<bb7=reg128#8%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb7=d14,{<bb7=d14},<SR=d18
vtbl.8 d14,{d14},d18

# qhasm:       bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb7=reg128#8%top,{<bb7=reg128#8%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb7=d15,{<bb7=d15},<SR=d19
vtbl.8 d15,{d15},d19

# qhasm:     bb5 ^= bb6
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb6=reg128#7
# asm 2: veor >bb5=q5,<bb5=q5,<bb6=q6
veor q5,q5,q6

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb3=reg128#4
# asm 2: veor >bb6=q6,<bb6=q6,<bb3=q3
veor q6,q6,q3

# qhasm:     bb3 ^= bb7
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb7=reg128#8
# asm 2: veor >bb3=q3,<bb3=q3,<bb7=q7
veor q3,q3,q7

# qhasm:       bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb4=reg128#5%bot,{<bb4=reg128#5%bot},<SR=reg128#10%bot
# asm 2: vtbl.8 >bb4=d8,{<bb4=d8},<SR=d18
vtbl.8 d8,{d8},d18

# qhasm:       bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb4=reg128#5%top,{<bb4=reg128#5%top},<SR=reg128#10%top
# asm 2: vtbl.8 >bb4=d9,{<bb4=d9},<SR=d19
vtbl.8 d9,{d9},d19

# qhasm:     bb6 ^= bb2
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb2=reg128#3
# asm 2: veor >bb6=q6,<bb6=q6,<bb2=q2
veor q6,q6,q2

# qhasm:     bb7 ^= bb5
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb5=reg128#6
# asm 2: veor >bb7=q7,<bb7=q7,<bb5=q5
veor q7,q7,q5

# qhasm:     bb3 ^= bb4
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb4=reg128#5
# asm 2: veor >bb3=q3,<bb3=q3,<bb4=q4
veor q3,q3,q4

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb5=reg128#6
# asm 2: veor >bb4=q4,<bb4=q4,<bb5=q5
veor q4,q4,q5

# qhasm:     bb3 ^= bb1
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb1=reg128#2
# asm 2: veor >bb3=q3,<bb3=q3,<bb1=q1
veor q3,q3,q1

# qhasm:     bb2 ^= bb7
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb7=reg128#8
# asm 2: veor >bb2=q2,<bb2=q2,<bb7=q7
veor q2,q2,q7

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:       bb11 = bb7 ^ bb4
# asm 1: veor >bb11=reg128#9,<bb7=reg128#8,<bb4=reg128#5
# asm 2: veor >bb11=q8,<bb7=q7,<bb4=q4
veor q8,q7,q4

# qhasm:       bb10 = bb1 ^ bb2
# asm 1: veor >bb10=reg128#10,<bb1=reg128#2,<bb2=reg128#3
# asm 2: veor >bb10=q9,<bb1=q1,<bb2=q2
veor q9,q1,q2

# qhasm:       bb9 = bb5 ^ bb3
# asm 1: veor >bb9=reg128#11,<bb5=reg128#6,<bb3=reg128#4
# asm 2: veor >bb9=q10,<bb5=q5,<bb3=q3
veor q10,q5,q3

# qhasm:       bb13 = bb2 ^ bb4
# asm 1: veor >bb13=reg128#12,<bb2=reg128#3,<bb4=reg128#5
# asm 2: veor >bb13=q11,<bb2=q2,<bb4=q4
veor q11,q2,q4

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb6=q6,<bb0=q0
veor q12,q6,q0

# qhasm:       bb8 = bb10 & bb9
# asm 1: vand >bb8=reg128#14,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vand >bb8=q13,<bb10=q9,<bb9=q10
vand q13,q9,q10

# qhasm:       bb14 = bb11 & bb12
# asm 1: vand >bb14=reg128#15,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vand >bb14=q14,<bb11=q8,<bb12=q12
vand q14,q8,q12

# qhasm:       bb15 = bb11 ^ bb10
# asm 1: veor >bb15=reg128#16,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb15=q15,<bb11=q8,<bb10=q9
veor q15,q8,q9

# qhasm:       bb11 |= bb12
# asm 1: vorr >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: vorr >bb11=q8,<bb11=q8,<bb12=q12
vorr q8,q8,q12

# qhasm:       bb12 ^= bb9
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb9=reg128#11
# asm 2: veor >bb12=q12,<bb12=q12,<bb9=q10
veor q12,q12,q10

# qhasm:       bb10 |= bb9
# asm 1: vorr >bb10=reg128#10,<bb10=reg128#10,<bb9=reg128#11
# asm 2: vorr >bb10=q9,<bb10=q9,<bb9=q10
vorr q9,q9,q10

# qhasm:       bb15 &= bb12
# asm 1: vand >bb15=reg128#11,<bb15=reg128#16,<bb12=reg128#13
# asm 2: vand >bb15=q10,<bb15=q15,<bb12=q12
vand q10,q15,q12

# qhasm:       bb12 = bb3 ^ bb0
# asm 1: veor >bb12=reg128#13,<bb3=reg128#4,<bb0=reg128#1
# asm 2: veor >bb12=q12,<bb3=q3,<bb0=q0
veor q12,q3,q0

# qhasm:       bb11 ^= bb15
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb15=reg128#11
# asm 2: veor >bb11=q8,<bb11=q8,<bb15=q10
veor q8,q8,q10

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb10 ^= bb14
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb14=reg128#15
# asm 2: veor >bb10=q9,<bb10=q9,<bb14=q14
veor q9,q9,q14

# qhasm:       bb11 ^= bb13
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb13=reg128#12
# asm 2: veor >bb11=q8,<bb11=q8,<bb13=q11
veor q8,q8,q11

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#12
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q11
veor q9,q9,q11

# qhasm:       bb13 = bb7 ^ bb1
# asm 1: veor >bb13=reg128#12,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb13=q11,<bb7=q7,<bb1=q1
veor q11,q7,q1

# qhasm:       bb12 = bb5 ^ bb6
# asm 1: veor >bb12=reg128#13,<bb5=reg128#6,<bb6=reg128#7
# asm 2: veor >bb12=q12,<bb5=q5,<bb6=q6
veor q12,q5,q6

# qhasm:       bb8 ^= bb14
# asm 1: veor >bb8=reg128#14,<bb8=reg128#14,<bb14=reg128#15
# asm 2: veor >bb8=q13,<bb8=q13,<bb14=q14
veor q13,q13,q14

# qhasm:       bb9 = bb13 | bb12
# asm 1: vorr >bb9=reg128#16,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vorr >bb9=q15,<bb13=q11,<bb12=q12
vorr q15,q11,q12

# qhasm:       bb13 &= bb12
# asm 1: vand >bb13=reg128#12,<bb13=reg128#12,<bb12=reg128#13
# asm 2: vand >bb13=q11,<bb13=q11,<bb12=q12
vand q11,q11,q12

# qhasm:       bb9 ^= bb15
# asm 1: veor >bb9=reg128#11,<bb9=reg128#16,<bb15=reg128#11
# asm 2: veor >bb9=q10,<bb9=q15,<bb15=q10
veor q10,q15,q10

# qhasm:       bb8 ^= bb13
# asm 1: veor >bb8=reg128#12,<bb8=reg128#14,<bb13=reg128#12
# asm 2: veor >bb8=q11,<bb8=q13,<bb13=q11
veor q11,q13,q11

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#15
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q14
veor q10,q10,q14

# qhasm:       bb12 = bb2 & bb3
# asm 1: vand >bb12=reg128#13,<bb2=reg128#3,<bb3=reg128#4
# asm 2: vand >bb12=q12,<bb2=q2,<bb3=q3
vand q12,q2,q3

# qhasm:       bb13 = bb4 & bb0
# asm 1: vand >bb13=reg128#14,<bb4=reg128#5,<bb0=reg128#1
# asm 2: vand >bb13=q13,<bb4=q4,<bb0=q0
vand q13,q4,q0

# qhasm:       bb11 ^= bb12
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb12=reg128#13
# asm 2: veor >bb11=q8,<bb11=q8,<bb12=q12
veor q8,q8,q12

# qhasm:       bb10 ^= bb13
# asm 1: veor >bb10=reg128#10,<bb10=reg128#10,<bb13=reg128#14
# asm 2: veor >bb10=q9,<bb10=q9,<bb13=q13
veor q9,q9,q13

# qhasm:       bb14 = bb1 & bb5
# asm 1: vand >bb14=reg128#13,<bb1=reg128#2,<bb5=reg128#6
# asm 2: vand >bb14=q12,<bb1=q1,<bb5=q5
vand q12,q1,q5

# qhasm:       bb12 = bb11 ^ bb10
# asm 1: veor >bb12=reg128#14,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb12=q13,<bb11=q8,<bb10=q9
veor q13,q8,q9

# qhasm:       bb15 = bb7 | bb6
# asm 1: vorr >bb15=reg128#15,<bb7=reg128#8,<bb6=reg128#7
# asm 2: vorr >bb15=q14,<bb7=q7,<bb6=q6
vorr q14,q7,q6

# qhasm:       bb9 ^= bb14
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb14=reg128#13
# asm 2: veor >bb9=q10,<bb9=q10,<bb14=q12
veor q10,q10,q12

# qhasm:       bb8 ^= bb15
# asm 1: veor >bb8=reg128#12,<bb8=reg128#12,<bb15=reg128#15
# asm 2: veor >bb8=q11,<bb8=q11,<bb15=q14
veor q11,q11,q14

# qhasm:       bb11 &= bb9
# asm 1: vand >bb11=reg128#9,<bb11=reg128#9,<bb9=reg128#11
# asm 2: vand >bb11=q8,<bb11=q8,<bb9=q10
vand q8,q8,q10

# qhasm:       bb13 = bb9 ^ bb8
# asm 1: veor >bb13=reg128#13,<bb9=reg128#11,<bb8=reg128#12
# asm 2: veor >bb13=q12,<bb9=q10,<bb8=q11
veor q12,q10,q11

# qhasm:       bb14 = bb8 ^ bb11
# asm 1: veor >bb14=reg128#15,<bb8=reg128#12,<bb11=reg128#9
# asm 2: veor >bb14=q14,<bb8=q11,<bb11=q8
veor q14,q11,q8

# qhasm:       bb11 ^= bb10
# asm 1: veor >bb11=reg128#9,<bb11=reg128#9,<bb10=reg128#10
# asm 2: veor >bb11=q8,<bb11=q8,<bb10=q9
veor q8,q8,q9

# qhasm:       bb15 = bb12 & bb14
# asm 1: vand >bb15=reg128#16,<bb12=reg128#14,<bb14=reg128#15
# asm 2: vand >bb15=q15,<bb12=q13,<bb14=q14
vand q15,q13,q14

# qhasm:       bb13 &= bb11
# asm 1: vand >bb13=reg128#9,<bb13=reg128#13,<bb11=reg128#9
# asm 2: vand >bb13=q8,<bb13=q12,<bb11=q8
vand q8,q12,q8

# qhasm:       bb15 ^= bb10
# asm 1: veor >bb15=reg128#10,<bb15=reg128#16,<bb10=reg128#10
# asm 2: veor >bb15=q9,<bb15=q15,<bb10=q9
veor q9,q15,q9

# qhasm:       bb13 ^= bb8
# asm 1: veor >bb13=reg128#9,<bb13=reg128#9,<bb8=reg128#12
# asm 2: veor >bb13=q8,<bb13=q8,<bb8=q11
veor q8,q8,q11

# qhasm:       bb10 = bb14 ^ bb13
# asm 1: veor >bb10=reg128#13,<bb14=reg128#15,<bb13=reg128#9
# asm 2: veor >bb10=q12,<bb14=q14,<bb13=q8
veor q12,q14,q8

# qhasm:       bb9 ^= bb13
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb13=reg128#9
# asm 2: veor >bb9=q10,<bb9=q10,<bb13=q8
veor q10,q10,q8

# qhasm:       bb10 &= bb8
# asm 1: vand >bb10=reg128#12,<bb10=reg128#13,<bb8=reg128#12
# asm 2: vand >bb10=q11,<bb10=q12,<bb8=q11
vand q11,q12,q11

# qhasm:       bb8 = bb5 ^ bb3
# asm 1: veor >bb8=reg128#13,<bb5=reg128#6,<bb3=reg128#4
# asm 2: veor >bb8=q12,<bb5=q5,<bb3=q3
veor q12,q5,q3

# qhasm:       bb14 ^= bb10
# asm 1: veor >bb14=reg128#15,<bb14=reg128#15,<bb10=reg128#12
# asm 2: veor >bb14=q14,<bb14=q14,<bb10=q11
veor q14,q14,q11

# qhasm:       bb9 ^= bb10
# asm 1: veor >bb9=reg128#11,<bb9=reg128#11,<bb10=reg128#12
# asm 2: veor >bb9=q10,<bb9=q10,<bb10=q11
veor q10,q10,q11

# qhasm:       bb14 &= bb15
# asm 1: vand >bb14=reg128#12,<bb14=reg128#15,<bb15=reg128#10
# asm 2: vand >bb14=q11,<bb14=q14,<bb15=q9
vand q11,q14,q9

# qhasm:       bb14 ^= bb12
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb12=reg128#14
# asm 2: veor >bb14=q11,<bb14=q11,<bb12=q13
veor q11,q11,q13

# qhasm:       bb12 = bb6 ^ bb0
# asm 1: veor >bb12=reg128#14,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb12=q13,<bb6=q6,<bb0=q0
veor q13,q6,q0

# qhasm:       bb10 = bb15 ^ bb14
# asm 1: veor >bb10=reg128#15,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb10=q14,<bb15=q9,<bb14=q11
veor q14,q9,q11

# qhasm:       bb10 &= bb6
# asm 1: vand >bb10=reg128#15,<bb10=reg128#15,<bb6=reg128#7
# asm 2: vand >bb10=q14,<bb10=q14,<bb6=q6
vand q14,q14,q6

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb5=reg128#6
# asm 2: veor >bb6=q6,<bb6=q6,<bb5=q5
veor q6,q6,q5

# qhasm:       bb5 &= bb15
# asm 1: vand >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#10
# asm 2: vand >bb5=q5,<bb5=q5,<bb15=q9
vand q5,q5,q9

# qhasm:       bb6 &= bb14
# asm 1: vand >bb6=reg128#7,<bb6=reg128#7,<bb14=reg128#12
# asm 2: vand >bb6=q6,<bb6=q6,<bb14=q11
vand q6,q6,q11

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#12,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q11,<bb14=q11,<bb9=q10
veor q11,q11,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#10,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q9,<bb15=q9,<bb13=q8
veor q9,q9,q8

# qhasm:       bb6 ^= bb5
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb5=reg128#6
# asm 2: veor >bb6=q6,<bb6=q6,<bb5=q5
veor q6,q6,q5

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#16,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q15,<bb15=q9,<bb14=q11
veor q15,q9,q11

# qhasm:       bb5 ^= bb10
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb10=reg128#15
# asm 2: veor >bb5=q5,<bb5=q5,<bb10=q14
veor q5,q5,q14

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#15,<bb11=reg128#16,<bb12=reg128#14
# asm 2: vand >bb11=q14,<bb11=q15,<bb12=q13
vand q14,q15,q13

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb8=reg128#13
# asm 2: veor >bb12=q13,<bb12=q13,<bb8=q12
veor q13,q13,q12

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#13,<bb8=reg128#13,<bb15=reg128#10
# asm 2: vand >bb8=q12,<bb8=q12,<bb15=q9
vand q12,q12,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#14,<bb12=reg128#14,<bb14=reg128#12
# asm 2: vand >bb12=q13,<bb12=q13,<bb14=q11
vand q13,q13,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#13,<bb8=reg128#13,<bb12=reg128#14
# asm 2: veor >bb8=q12,<bb8=q12,<bb12=q13
veor q12,q12,q13

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#14,<bb12=reg128#14,<bb11=reg128#15
# asm 2: veor >bb12=q13,<bb12=q13,<bb11=q14
veor q13,q13,q14

# qhasm:       bb10 &= bb0
# asm 1: vand >bb10=reg128#15,<bb10=reg128#16,<bb0=reg128#1
# asm 2: vand >bb10=q14,<bb10=q15,<bb0=q0
vand q14,q15,q0

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#4
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q3
veor q0,q0,q3

# qhasm:       bb3 &= bb13
# asm 1: vand >bb3=reg128#4,<bb3=reg128#4,<bb13=reg128#9
# asm 2: vand >bb3=q3,<bb3=q3,<bb13=q8
vand q3,q3,q8

# qhasm:       bb0 &= bb9
# asm 1: vand >bb0=reg128#1,<bb0=reg128#1,<bb9=reg128#11
# asm 2: vand >bb0=q0,<bb0=q0,<bb9=q10
vand q0,q0,q10

# qhasm:       bb6 ^= bb12
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb12=reg128#14
# asm 2: veor >bb6=q6,<bb6=q6,<bb12=q13
veor q6,q6,q13

# qhasm:       bb0 ^= bb3
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb3=reg128#4
# asm 2: veor >bb0=q0,<bb0=q0,<bb3=q3
veor q0,q0,q3

# qhasm:       bb3 ^= bb10
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb10=reg128#15
# asm 2: veor >bb3=q3,<bb3=q3,<bb10=q14
veor q3,q3,q14

# qhasm:       bb0 ^= bb12
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb12=reg128#14
# asm 2: veor >bb0=q0,<bb0=q0,<bb12=q13
veor q0,q0,q13

# qhasm:       bb5 ^= bb8
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb8=reg128#13
# asm 2: veor >bb5=q5,<bb5=q5,<bb8=q12
veor q5,q5,q12

# qhasm:       bb3 ^= bb8
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb8=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb8=q12
veor q3,q3,q12

# qhasm:       bb12 = bb7 ^ bb4
# asm 1: veor >bb12=reg128#13,<bb7=reg128#8,<bb4=reg128#5
# asm 2: veor >bb12=q12,<bb7=q7,<bb4=q4
veor q12,q7,q4

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#14,<bb15=reg128#10,<bb14=reg128#12
# asm 2: veor >bb11=q13,<bb15=q9,<bb14=q11
veor q13,q9,q11

# qhasm:       bb8 = bb1 ^ bb2
# asm 1: veor >bb8=reg128#15,<bb1=reg128#2,<bb2=reg128#3
# asm 2: veor >bb8=q14,<bb1=q1,<bb2=q2
veor q14,q1,q2

# qhasm:       bb11 &= bb12
# asm 1: vand >bb11=reg128#14,<bb11=reg128#14,<bb12=reg128#13
# asm 2: vand >bb11=q13,<bb11=q13,<bb12=q12
vand q13,q13,q12

# qhasm:       bb12 ^= bb8
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb8=reg128#15
# asm 2: veor >bb12=q12,<bb12=q12,<bb8=q14
veor q12,q12,q14

# qhasm:       bb8 &= bb15
# asm 1: vand >bb8=reg128#15,<bb8=reg128#15,<bb15=reg128#10
# asm 2: vand >bb8=q14,<bb8=q14,<bb15=q9
vand q14,q14,q9

# qhasm:       bb12 &= bb14
# asm 1: vand >bb12=reg128#13,<bb12=reg128#13,<bb14=reg128#12
# asm 2: vand >bb12=q12,<bb12=q12,<bb14=q11
vand q12,q12,q11

# qhasm:       bb10 = bb13 ^ bb9
# asm 1: veor >bb10=reg128#16,<bb13=reg128#9,<bb9=reg128#11
# asm 2: veor >bb10=q15,<bb13=q8,<bb9=q10
veor q15,q8,q10

# qhasm:       bb8 ^= bb12
# asm 1: veor >bb8=reg128#15,<bb8=reg128#15,<bb12=reg128#13
# asm 2: veor >bb8=q14,<bb8=q14,<bb12=q12
veor q14,q14,q12

# qhasm:       bb12 ^= bb11
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb11=reg128#14
# asm 2: veor >bb12=q12,<bb12=q12,<bb11=q13
veor q12,q12,q13

# qhasm:       bb10 &= bb4
# asm 1: vand >bb10=reg128#14,<bb10=reg128#16,<bb4=reg128#5
# asm 2: vand >bb10=q13,<bb10=q15,<bb4=q4
vand q13,q15,q4

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb2=reg128#3
# asm 2: veor >bb4=q4,<bb4=q4,<bb2=q2
veor q4,q4,q2

# qhasm:       bb2 &= bb13
# asm 1: vand >bb2=reg128#3,<bb2=reg128#3,<bb13=reg128#9
# asm 2: vand >bb2=q2,<bb2=q2,<bb13=q8
vand q2,q2,q8

# qhasm:       bb4 &= bb9
# asm 1: vand >bb4=reg128#5,<bb4=reg128#5,<bb9=reg128#11
# asm 2: vand >bb4=q4,<bb4=q4,<bb9=q10
vand q4,q4,q10

# qhasm:       bb15 ^= bb13
# asm 1: veor >bb15=reg128#9,<bb15=reg128#10,<bb13=reg128#9
# asm 2: veor >bb15=q8,<bb15=q9,<bb13=q8
veor q8,q9,q8

# qhasm:       bb14 ^= bb9
# asm 1: veor >bb14=reg128#10,<bb14=reg128#12,<bb9=reg128#11
# asm 2: veor >bb14=q9,<bb14=q11,<bb9=q10
veor q9,q11,q10

# qhasm:       bb4 ^= bb2
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb2=reg128#3
# asm 2: veor >bb4=q4,<bb4=q4,<bb2=q2
veor q4,q4,q2

# qhasm:       bb11 = bb15 ^ bb14
# asm 1: veor >bb11=reg128#11,<bb15=reg128#9,<bb14=reg128#10
# asm 2: veor >bb11=q10,<bb15=q8,<bb14=q9
veor q10,q8,q9

# qhasm:       bb2 ^= bb10
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb10=reg128#14
# asm 2: veor >bb2=q2,<bb2=q2,<bb10=q13
veor q2,q2,q13

# qhasm:       bb11 &= bb7
# asm 1: vand >bb11=reg128#11,<bb11=reg128#11,<bb7=reg128#8
# asm 2: vand >bb11=q10,<bb11=q10,<bb7=q7
vand q10,q10,q7

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 &= bb15
# asm 1: vand >bb1=reg128#2,<bb1=reg128#2,<bb15=reg128#9
# asm 2: vand >bb1=q1,<bb1=q1,<bb15=q8
vand q1,q1,q8

# qhasm:       bb7 &= bb14
# asm 1: vand >bb7=reg128#8,<bb7=reg128#8,<bb14=reg128#10
# asm 2: vand >bb7=q7,<bb7=q7,<bb14=q9
vand q7,q7,q9

# qhasm:       bb4 ^= bb12
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb12=reg128#13
# asm 2: veor >bb4=q4,<bb4=q4,<bb12=q12
veor q4,q4,q12

# qhasm:       bb7 ^= bb1
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb1=reg128#2
# asm 2: veor >bb7=q7,<bb7=q7,<bb1=q1
veor q7,q7,q1

# qhasm:       bb1 ^= bb11
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb11=reg128#11
# asm 2: veor >bb1=q1,<bb1=q1,<bb11=q10
veor q1,q1,q10

# qhasm:       bb7 ^= bb12
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb12=reg128#13
# asm 2: veor >bb7=q7,<bb7=q7,<bb12=q12
veor q7,q7,q12

# qhasm:       bb1 ^= bb8
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb8=reg128#15
# asm 2: veor >bb1=q1,<bb1=q1,<bb8=q14
veor q1,q1,q14

# qhasm:       bb2 ^= bb8
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb8=reg128#15
# asm 2: veor >bb2=q2,<bb2=q2,<bb8=q14
veor q2,q2,q14

# qhasm:     bb7 ^= bb0
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb0=reg128#1
# asm 2: veor >bb7=q7,<bb7=q7,<bb0=q0
veor q7,q7,q0

# qhasm:     bb1 ^= bb6
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb6=reg128#7
# asm 2: veor >bb1=q1,<bb1=q1,<bb6=q6
veor q1,q1,q6

# qhasm:     bb4 ^= bb7
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb7=reg128#8
# asm 2: veor >bb4=q4,<bb4=q4,<bb7=q7
veor q4,q4,q7

# qhasm:     bb6 ^= bb0
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb0=reg128#1
# asm 2: veor >bb6=q6,<bb6=q6,<bb0=q0
veor q6,q6,q0

# qhasm:     bb0 ^= bb1
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb1=reg128#2
# asm 2: veor >bb0=q0,<bb0=q0,<bb1=q1
veor q0,q0,q1

# qhasm:     bb1 ^= bb5
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb5=reg128#6
# asm 2: veor >bb1=q1,<bb1=q1,<bb5=q5
veor q1,q1,q5

# qhasm:     bb5 ^= bb2
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb2=reg128#3
# asm 2: veor >bb5=q5,<bb5=q5,<bb2=q2
veor q5,q5,q2

# qhasm:     bb2 ^= bb3
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb3=reg128#4
# asm 2: veor >bb2=q2,<bb2=q2,<bb3=q3
veor q2,q2,q3

# qhasm:     bb3 ^= bb5
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb5=reg128#6
# asm 2: veor >bb3=q3,<bb3=q3,<bb5=q5
veor q3,q3,q5

# qhasm:     bb8 = bb0[3]bb0[0,1,2]
# asm 1: vext.32 >bb8=reg128#9,<bb0=reg128#1,<bb0=reg128#1,#3
# asm 2: vext.32 >bb8=q8,<bb0=q0,<bb0=q0,#3
vext.32 q8,q0,q0,#3

# qhasm:     bb4 ^= bb5
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb5=reg128#6
# asm 2: veor >bb4=q4,<bb4=q4,<bb5=q5
veor q4,q4,q5

# qhasm:     bb9 = bb1[3]bb1[0,1,2]
# asm 1: vext.32 >bb9=reg128#10,<bb1=reg128#2,<bb1=reg128#2,#3
# asm 2: vext.32 >bb9=q9,<bb1=q1,<bb1=q1,#3
vext.32 q9,q1,q1,#3

# qhasm:     bb6 ^= bb3
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb3=reg128#4
# asm 2: veor >bb6=q6,<bb6=q6,<bb3=q3
veor q6,q6,q3

# qhasm:     bb10 = bb4[3]bb4[0,1,2]
# asm 1: vext.32 >bb10=reg128#11,<bb4=reg128#5,<bb4=reg128#5,#3
# asm 2: vext.32 >bb10=q10,<bb4=q4,<bb4=q4,#3
vext.32 q10,q4,q4,#3

# qhasm:     bb0 ^= bb8
# asm 1: veor >bb0=reg128#1,<bb0=reg128#1,<bb8=reg128#9
# asm 2: veor >bb0=q0,<bb0=q0,<bb8=q8
veor q0,q0,q8

# qhasm:     bb11 = bb6[3]bb6[0,1,2]
# asm 1: vext.32 >bb11=reg128#12,<bb6=reg128#7,<bb6=reg128#7,#3
# asm 2: vext.32 >bb11=q11,<bb6=q6,<bb6=q6,#3
vext.32 q11,q6,q6,#3

# qhasm:     bb1 ^= bb9
# asm 1: veor >bb1=reg128#2,<bb1=reg128#2,<bb9=reg128#10
# asm 2: veor >bb1=q1,<bb1=q1,<bb9=q9
veor q1,q1,q9

# qhasm:     bb12 = bb3[3]bb3[0,1,2]
# asm 1: vext.32 >bb12=reg128#13,<bb3=reg128#4,<bb3=reg128#4,#3
# asm 2: vext.32 >bb12=q12,<bb3=q3,<bb3=q3,#3
vext.32 q12,q3,q3,#3

# qhasm:     bb4 ^= bb10
# asm 1: veor >bb4=reg128#5,<bb4=reg128#5,<bb10=reg128#11
# asm 2: veor >bb4=q4,<bb4=q4,<bb10=q10
veor q4,q4,q10

# qhasm:     bb15 = bb5[3]bb5[0,1,2]
# asm 1: vext.32 >bb15=reg128#14,<bb5=reg128#6,<bb5=reg128#6,#3
# asm 2: vext.32 >bb15=q13,<bb5=q5,<bb5=q5,#3
vext.32 q13,q5,q5,#3

# qhasm:     bb6 ^= bb11
# asm 1: veor >bb6=reg128#7,<bb6=reg128#7,<bb11=reg128#12
# asm 2: veor >bb6=q6,<bb6=q6,<bb11=q11
veor q6,q6,q11

# qhasm:     bb13 = bb7[3]bb7[0,1,2]
# asm 1: vext.32 >bb13=reg128#15,<bb7=reg128#8,<bb7=reg128#8,#3
# asm 2: vext.32 >bb13=q14,<bb7=q7,<bb7=q7,#3
vext.32 q14,q7,q7,#3

# qhasm:     bb3 ^= bb12
# asm 1: veor >bb3=reg128#4,<bb3=reg128#4,<bb12=reg128#13
# asm 2: veor >bb3=q3,<bb3=q3,<bb12=q12
veor q3,q3,q12

# qhasm:     bb14 = bb2[3]bb2[0,1,2]
# asm 1: vext.32 >bb14=reg128#16,<bb2=reg128#3,<bb2=reg128#3,#3
# asm 2: vext.32 >bb14=q15,<bb2=q2,<bb2=q2,#3
vext.32 q15,q2,q2,#3

# qhasm:     bb5 ^= bb15
# asm 1: veor >bb5=reg128#6,<bb5=reg128#6,<bb15=reg128#14
# asm 2: veor >bb5=q5,<bb5=q5,<bb15=q13
veor q5,q5,q13

# qhasm:     bb7 ^= bb13
# asm 1: veor >bb7=reg128#8,<bb7=reg128#8,<bb13=reg128#15
# asm 2: veor >bb7=q7,<bb7=q7,<bb13=q14
veor q7,q7,q14

# qhasm:     bb2 ^= bb14
# asm 1: veor >bb2=reg128#3,<bb2=reg128#3,<bb14=reg128#16
# asm 2: veor >bb2=q2,<bb2=q2,<bb14=q15
veor q2,q2,q15

# qhasm:     bb9 ^= bb0
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb0=reg128#1
# asm 2: veor >bb9=q9,<bb9=q9,<bb0=q0
veor q9,q9,q0

# qhasm:     bb8 ^= bb5
# asm 1: veor >bb8=reg128#9,<bb8=reg128#9,<bb5=reg128#6
# asm 2: veor >bb8=q8,<bb8=q8,<bb5=q5
veor q8,q8,q5

# qhasm:     bb10 ^= bb1
# asm 1: veor >bb10=reg128#11,<bb10=reg128#11,<bb1=reg128#2
# asm 2: veor >bb10=q10,<bb10=q10,<bb1=q1
veor q10,q10,q1

# qhasm:     bb9 ^= bb5
# asm 1: veor >bb9=reg128#10,<bb9=reg128#10,<bb5=reg128#6
# asm 2: veor >bb9=q9,<bb9=q9,<bb5=q5
veor q9,q9,q5

# qhasm:     bb0 = bb0[2,3]bb0[0,1]
# asm 1: vswp <bb0=reg128#1%bot,<bb0=reg128#1%top
# asm 2: vswp <bb0=d0,<bb0=d1
vswp d0,d1

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb4=reg128#5
# asm 2: veor >bb11=q11,<bb11=q11,<bb4=q4
veor q11,q11,q4

# qhasm:     bb1 = bb1[2,3]bb1[0,1]
# asm 1: vswp <bb1=reg128#2%bot,<bb1=reg128#2%top
# asm 2: vswp <bb1=d2,<bb1=d3
vswp d2,d3

# qhasm:     bb12 ^= bb6
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb6=reg128#7
# asm 2: veor >bb12=q12,<bb12=q12,<bb6=q6
veor q12,q12,q6

# qhasm:     bb4 = bb4[2,3]bb4[0,1]
# asm 1: vswp <bb4=reg128#5%bot,<bb4=reg128#5%top
# asm 2: vswp <bb4=d8,<bb4=d9
vswp d8,d9

# qhasm:     bb13 ^= bb3
# asm 1: veor >bb13=reg128#15,<bb13=reg128#15,<bb3=reg128#4
# asm 2: veor >bb13=q14,<bb13=q14,<bb3=q3
veor q14,q14,q3

# qhasm:     bb6 = bb6[2,3]bb6[0,1]
# asm 1: vswp <bb6=reg128#7%bot,<bb6=reg128#7%top
# asm 2: vswp <bb6=d12,<bb6=d13
vswp d12,d13

# qhasm:     bb11 ^= bb5
# asm 1: veor >bb11=reg128#12,<bb11=reg128#12,<bb5=reg128#6
# asm 2: veor >bb11=q11,<bb11=q11,<bb5=q5
veor q11,q11,q5

# qhasm:     bb3 = bb3[2,3]bb3[0,1]
# asm 1: vswp <bb3=reg128#4%bot,<bb3=reg128#4%top
# asm 2: vswp <bb3=d6,<bb3=d7
vswp d6,d7

# qhasm:     bb14 ^= bb7
# asm 1: veor >bb14=reg128#16,<bb14=reg128#16,<bb7=reg128#8
# asm 2: veor >bb14=q15,<bb14=q15,<bb7=q7
veor q15,q15,q7

# qhasm:     bb7 = bb7[2,3]bb7[0,1]
# asm 1: vswp <bb7=reg128#8%bot,<bb7=reg128#8%top
# asm 2: vswp <bb7=d14,<bb7=d15
vswp d14,d15

# qhasm:     bb15 ^= bb2
# asm 1: veor >bb15=reg128#14,<bb15=reg128#14,<bb2=reg128#3
# asm 2: veor >bb15=q13,<bb15=q13,<bb2=q2
veor q13,q13,q2

# qhasm:     bb2 = bb2[2,3]bb2[0,1]
# asm 1: vswp <bb2=reg128#3%bot,<bb2=reg128#3%top
# asm 2: vswp <bb2=d4,<bb2=d5
vswp d4,d5

# qhasm:     bb12 ^= bb5
# asm 1: veor >bb12=reg128#13,<bb12=reg128#13,<bb5=reg128#6
# asm 2: veor >bb12=q12,<bb12=q12,<bb5=q5
veor q12,q12,q5

# qhasm:     bb5 = bb5[2,3]bb5[0,1]
# asm 1: vswp <bb5=reg128#6%bot,<bb5=reg128#6%top
# asm 2: vswp <bb5=d10,<bb5=d11
vswp d10,d11

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#9,<bb0=reg128#1
# asm 2: veor >bb8=q0,<bb8=q8,<bb0=q0
veor q0,q8,q0

# qhasm:     bb0 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb0=reg128#9%bot->bb0=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb0=d16->bb0=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#10,<bb1=reg128#2
# asm 2: veor >bb9=q1,<bb9=q9,<bb1=q1
veor q1,q9,q1

# qhasm:     bb1 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb1=reg128#10%bot->bb1=reg128#10%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb1=d18->bb1=d19},[<c=r3,: 128]!
vld1.8 {d18-d19},[r3,: 128]!

# qhasm:     bb14 ^= bb2
# asm 1: veor >bb14=reg128#3,<bb14=reg128#16,<bb2=reg128#3
# asm 2: veor >bb14=q2,<bb14=q15,<bb2=q2
veor q2,q15,q2

# qhasm:     bb2 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb2=reg128#16%bot->bb2=reg128#16%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb2=d30->bb2=d31},[<c=r3,: 128]!
vld1.8 {d30-d31},[r3,: 128]!

# qhasm:     bb12 ^= bb3
# asm 1: veor >bb12=reg128#4,<bb12=reg128#13,<bb3=reg128#4
# asm 2: veor >bb12=q3,<bb12=q12,<bb3=q3
veor q3,q12,q3

# qhasm:     bb3 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb3=reg128#13%bot->bb3=reg128#13%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb3=d24->bb3=d25},[<c=r3,: 128]!
vld1.8 {d24-d25},[r3,: 128]!

# qhasm:     bb10 ^= bb4
# asm 1: veor >bb10=reg128#5,<bb10=reg128#11,<bb4=reg128#5
# asm 2: veor >bb10=q4,<bb10=q10,<bb4=q4
veor q4,q10,q4

# qhasm:     bb4 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb4=reg128#11%bot->bb4=reg128#11%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb4=d20->bb4=d21},[<c=r3,: 128]!
vld1.8 {d20-d21},[r3,: 128]!

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#14,<bb5=reg128#6
# asm 2: veor >bb15=q5,<bb15=q13,<bb5=q5
veor q5,q13,q5

# qhasm:     bb5 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb5=reg128#14%bot->bb5=reg128#14%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb5=d26->bb5=d27},[<c=r3,: 128]!
vld1.8 {d26-d27},[r3,: 128]!

# qhasm:     bb11 ^= bb6
# asm 1: veor >bb11=reg128#7,<bb11=reg128#12,<bb6=reg128#7
# asm 2: veor >bb11=q6,<bb11=q11,<bb6=q6
veor q6,q11,q6

# qhasm:     bb6 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb6=reg128#12%bot->bb6=reg128#12%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb6=d22->bb6=d23},[<c=r3,: 128]!
vld1.8 {d22-d23},[r3,: 128]!

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#15,<bb7=reg128#8
# asm 2: veor >bb13=q7,<bb13=q14,<bb7=q7
veor q7,q14,q7

# qhasm:     bb7 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb7=reg128#15%bot->bb7=reg128#15%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb7=d28->bb7=d29},[<c=r3,: 128]!
vld1.8 {d28-d29},[r3,: 128]!

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     z = &SR_stack
# asm 1: lea >z=int32#5,<SR_stack=stack128#2
# asm 2: lea >z=r4,<SR_stack=[sp,#48]
add r4,sp,#48

# qhasm:     SR aligned= mem128[z]
# asm 1: vld1.8 {>SR=reg128#9%bot->SR=reg128#9%top},[<z=int32#5,: 128]
# asm 2: vld1.8 {>SR=d16->SR=d17},[<z=r4,: 128]
vld1.8 {d16-d17},[r4,: 128]

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#10
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q9
veor q1,q1,q9

# qhasm:         bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb8=reg128#1%bot,{<bb8=reg128#1%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb8=d0,{<bb8=d0},<SR=d16
vtbl.8 d0,{d0},d16

# qhasm:         bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb8=reg128#1%top,{<bb8=reg128#1%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb8=d1,{<bb8=d1},<SR=d17
vtbl.8 d1,{d1},d17

# qhasm:         bb8 = bb8[0,2,1,3]
# asm 1: vtrn.32 <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vtrn.32 <bb8=d0,<bb8=d1
vtrn.32 d0,d1

# qhasm:         bb8 = bb8[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vtrn.8 <bb8=d0,<bb8=d1
vtrn.8 d0,d1

# qhasm:         bb8 = bb8[0,2,1,3]
# asm 1: vtrn.32 <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vtrn.32 <bb8=d0,<bb8=d1
vtrn.32 d0,d1

# qhasm:         bb8 = bb8[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vtrn.16 <bb8=d0,<bb8=d1
vtrn.16 d0,d1

# qhasm:         bb8 = bb8[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb8=reg128#1,<bb8=reg128#1
# asm 2: vrev64.i8 >bb8=q0,<bb8=q0
vrev64.i8 q0,q0

# qhasm:         bb8 = bb8[1,0]
# asm 1: vswp <bb8=reg128#1%bot,<bb8=reg128#1%top
# asm 2: vswp <bb8=d0,<bb8=d1
vswp d0,d1

# qhasm:     bb10 ^= bb2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb2=reg128#16
# asm 2: veor >bb10=q4,<bb10=q4,<bb2=q15
veor q4,q4,q15

# qhasm:         bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb9=reg128#2%bot,{<bb9=reg128#2%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb9=d2,{<bb9=d2},<SR=d16
vtbl.8 d2,{d2},d16

# qhasm:         bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb9=reg128#2%top,{<bb9=reg128#2%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb9=d3,{<bb9=d3},<SR=d17
vtbl.8 d3,{d3},d17

# qhasm:         bb9 = bb9[0,2,1,3]
# asm 1: vtrn.32 <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vtrn.32 <bb9=d2,<bb9=d3
vtrn.32 d2,d3

# qhasm:         bb9 = bb9[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vtrn.8 <bb9=d2,<bb9=d3
vtrn.8 d2,d3

# qhasm:         bb9 = bb9[0,2,1,3]
# asm 1: vtrn.32 <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vtrn.32 <bb9=d2,<bb9=d3
vtrn.32 d2,d3

# qhasm:         bb9 = bb9[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vtrn.16 <bb9=d2,<bb9=d3
vtrn.16 d2,d3

# qhasm:         bb9 = bb9[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb9=reg128#2,<bb9=reg128#2
# asm 2: vrev64.i8 >bb9=q1,<bb9=q1
vrev64.i8 q1,q1

# qhasm:         bb9 = bb9[1,0]
# asm 1: vswp <bb9=reg128#2%bot,<bb9=reg128#2%top
# asm 2: vswp <bb9=d2,<bb9=d3
vswp d2,d3

# qhasm:     bb11 ^= bb3
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb3=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb3=q12
veor q6,q6,q12

# qhasm:         bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb10=reg128#5%bot,{<bb10=reg128#5%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb10=d8,{<bb10=d8},<SR=d16
vtbl.8 d8,{d8},d16

# qhasm:         bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb10=reg128#5%top,{<bb10=reg128#5%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb10=d9,{<bb10=d9},<SR=d17
vtbl.8 d9,{d9},d17

# qhasm:         bb10 = bb10[0,2,1,3]
# asm 1: vtrn.32 <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vtrn.32 <bb10=d8,<bb10=d9
vtrn.32 d8,d9

# qhasm:         bb10 = bb10[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vtrn.8 <bb10=d8,<bb10=d9
vtrn.8 d8,d9

# qhasm:         bb10 = bb10[0,2,1,3]
# asm 1: vtrn.32 <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vtrn.32 <bb10=d8,<bb10=d9
vtrn.32 d8,d9

# qhasm:         bb10 = bb10[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vtrn.16 <bb10=d8,<bb10=d9
vtrn.16 d8,d9

# qhasm:         bb10 = bb10[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb10=reg128#5,<bb10=reg128#5
# asm 2: vrev64.i8 >bb10=q4,<bb10=q4
vrev64.i8 q4,q4

# qhasm:         bb10 = bb10[1,0]
# asm 1: vswp <bb10=reg128#5%bot,<bb10=reg128#5%top
# asm 2: vswp <bb10=d8,<bb10=d9
vswp d8,d9

# qhasm:     bb12 ^= bb4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb4=reg128#11
# asm 2: veor >bb12=q3,<bb12=q3,<bb4=q10
veor q3,q3,q10

# qhasm:         bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb11=reg128#7%bot,{<bb11=reg128#7%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb11=d12,{<bb11=d12},<SR=d16
vtbl.8 d12,{d12},d16

# qhasm:         bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb11=reg128#7%top,{<bb11=reg128#7%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb11=d13,{<bb11=d13},<SR=d17
vtbl.8 d13,{d13},d17

# qhasm:         bb11 = bb11[0,2,1,3]
# asm 1: vtrn.32 <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vtrn.32 <bb11=d12,<bb11=d13
vtrn.32 d12,d13

# qhasm:         bb11 = bb11[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vtrn.8 <bb11=d12,<bb11=d13
vtrn.8 d12,d13

# qhasm:         bb11 = bb11[0,2,1,3]
# asm 1: vtrn.32 <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vtrn.32 <bb11=d12,<bb11=d13
vtrn.32 d12,d13

# qhasm:         bb11 = bb11[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vtrn.16 <bb11=d12,<bb11=d13
vtrn.16 d12,d13

# qhasm:         bb11 = bb11[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb11=reg128#7,<bb11=reg128#7
# asm 2: vrev64.i8 >bb11=q6,<bb11=q6
vrev64.i8 q6,q6

# qhasm:         bb11 = bb11[1,0]
# asm 1: vswp <bb11=reg128#7%bot,<bb11=reg128#7%top
# asm 2: vswp <bb11=d12,<bb11=d13
vswp d12,d13

# qhasm:     bb10 ^= bb9
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb9=reg128#2
# asm 2: veor >bb10=q4,<bb10=q4,<bb9=q1
veor q4,q4,q1

# qhasm:     bb13 ^= bb5
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb5=reg128#14
# asm 2: veor >bb13=q7,<bb13=q7,<bb5=q13
veor q7,q7,q13

# qhasm:         bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb12=reg128#4%bot,{<bb12=reg128#4%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb12=d6,{<bb12=d6},<SR=d16
vtbl.8 d6,{d6},d16

# qhasm:         bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb12=reg128#4%top,{<bb12=reg128#4%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb12=d7,{<bb12=d7},<SR=d17
vtbl.8 d7,{d7},d17

# qhasm:         bb12 = bb12[0,2,1,3]
# asm 1: vtrn.32 <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vtrn.32 <bb12=d6,<bb12=d7
vtrn.32 d6,d7

# qhasm:         bb12 = bb12[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vtrn.8 <bb12=d6,<bb12=d7
vtrn.8 d6,d7

# qhasm:         bb12 = bb12[0,2,1,3]
# asm 1: vtrn.32 <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vtrn.32 <bb12=d6,<bb12=d7
vtrn.32 d6,d7

# qhasm:         bb12 = bb12[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vtrn.16 <bb12=d6,<bb12=d7
vtrn.16 d6,d7

# qhasm:         bb12 = bb12[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb12=reg128#4,<bb12=reg128#4
# asm 2: vrev64.i8 >bb12=q3,<bb12=q3
vrev64.i8 q3,q3

# qhasm:         bb12 = bb12[1,0]
# asm 1: vswp <bb12=reg128#4%bot,<bb12=reg128#4%top
# asm 2: vswp <bb12=d6,<bb12=d7
vswp d6,d7

# qhasm:     bb11 ^= bb8
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb8=reg128#1
# asm 2: veor >bb11=q6,<bb11=q6,<bb8=q0
veor q6,q6,q0

# qhasm:     bb14 ^= bb6
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb6=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<bb6=q11
veor q2,q2,q11

# qhasm:         bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb13=reg128#8%bot,{<bb13=reg128#8%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb13=d14,{<bb13=d14},<SR=d16
vtbl.8 d14,{d14},d16

# qhasm:         bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb13=reg128#8%top,{<bb13=reg128#8%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb13=d15,{<bb13=d15},<SR=d17
vtbl.8 d15,{d15},d17

# qhasm:         bb13 = bb13[0,2,1,3]
# asm 1: vtrn.32 <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vtrn.32 <bb13=d14,<bb13=d15
vtrn.32 d14,d15

# qhasm:         bb13 = bb13[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vtrn.8 <bb13=d14,<bb13=d15
vtrn.8 d14,d15

# qhasm:         bb13 = bb13[0,2,1,3]
# asm 1: vtrn.32 <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vtrn.32 <bb13=d14,<bb13=d15
vtrn.32 d14,d15

# qhasm:         bb13 = bb13[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vtrn.16 <bb13=d14,<bb13=d15
vtrn.16 d14,d15

# qhasm:         bb13 = bb13[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb13=reg128#8,<bb13=reg128#8
# asm 2: vrev64.i8 >bb13=q7,<bb13=q7
vrev64.i8 q7,q7

# qhasm:         bb13 = bb13[1,0]
# asm 1: vswp <bb13=reg128#8%bot,<bb13=reg128#8%top
# asm 2: vswp <bb13=d14,<bb13=d15
vswp d14,d15

# qhasm:     bb15 ^= bb7
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb7=reg128#15
# asm 2: veor >bb15=q5,<bb15=q5,<bb7=q14
veor q5,q5,q14

# qhasm:         bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb14=reg128#3%bot,{<bb14=reg128#3%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb14=d4,{<bb14=d4},<SR=d16
vtbl.8 d4,{d4},d16

# qhasm:         bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb14=reg128#3%top,{<bb14=reg128#3%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb14=d5,{<bb14=d5},<SR=d17
vtbl.8 d5,{d5},d17

# qhasm:         bb14 = bb14[0,2,1,3]
# asm 1: vtrn.32 <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vtrn.32 <bb14=d4,<bb14=d5
vtrn.32 d4,d5

# qhasm:         bb14 = bb14[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vtrn.8 <bb14=d4,<bb14=d5
vtrn.8 d4,d5

# qhasm:         bb14 = bb14[0,2,1,3]
# asm 1: vtrn.32 <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vtrn.32 <bb14=d4,<bb14=d5
vtrn.32 d4,d5

# qhasm:         bb14 = bb14[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vtrn.16 <bb14=d4,<bb14=d5
vtrn.16 d4,d5

# qhasm:         bb14 = bb14[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb14=reg128#3,<bb14=reg128#3
# asm 2: vrev64.i8 >bb14=q2,<bb14=q2
vrev64.i8 q2,q2

# qhasm:         bb14 = bb14[1,0]
# asm 1: vswp <bb14=reg128#3%bot,<bb14=reg128#3%top
# asm 2: vswp <bb14=d4,<bb14=d5
vswp d4,d5

# qhasm:     bb13 ^= bb14
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb14=reg128#3
# asm 2: veor >bb13=q7,<bb13=q7,<bb14=q2
veor q7,q7,q2

# qhasm:         bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
# asm 1: vtbl.8 >bb15=reg128#6%bot,{<bb15=reg128#6%bot},<SR=reg128#9%bot
# asm 2: vtbl.8 >bb15=d10,{<bb15=d10},<SR=d16
vtbl.8 d10,{d10},d16

# qhasm:         bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
# asm 1: vtbl.8 >bb15=reg128#6%top,{<bb15=reg128#6%top},<SR=reg128#9%top
# asm 2: vtbl.8 >bb15=d11,{<bb15=d11},<SR=d17
vtbl.8 d11,{d11},d17

# qhasm:         bb15 = bb15[0,2,1,3]
# asm 1: vtrn.32 <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vtrn.32 <bb15=d10,<bb15=d11
vtrn.32 d10,d11

# qhasm:         bb15 = bb15[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
# asm 1: vtrn.8 <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vtrn.8 <bb15=d10,<bb15=d11
vtrn.8 d10,d11

# qhasm:         bb15 = bb15[0,2,1,3]
# asm 1: vtrn.32 <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vtrn.32 <bb15=d10,<bb15=d11
vtrn.32 d10,d11

# qhasm:         bb15 = bb15[0,4,2,6,1,5,3,7]
# asm 1: vtrn.16 <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vtrn.16 <bb15=d10,<bb15=d11
vtrn.16 d10,d11

# qhasm:         bb15 = bb15[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
# asm 1: vrev64.i8 >bb15=reg128#6,<bb15=reg128#6
# asm 2: vrev64.i8 >bb15=q5,<bb15=q5
vrev64.i8 q5,q5

# qhasm:         bb15 = bb15[1,0]
# asm 1: vswp <bb15=reg128#6%bot,<bb15=reg128#6%top
# asm 2: vswp <bb15=d10,<bb15=d11
vswp d10,d11

# qhasm:     bb13 ^= bb8
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb8=reg128#1
# asm 2: veor >bb13=q7,<bb13=q7,<bb8=q0
veor q7,q7,q0

# qhasm:     bb14 ^= bb10
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb10=reg128#5
# asm 2: veor >bb14=q2,<bb14=q2,<bb10=q4
veor q2,q2,q4

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb11=reg128#7
# asm 2: veor >bb14=q2,<bb14=q2,<bb11=q6
veor q2,q2,q6

# qhasm:     bb11 ^= bb15
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb15=reg128#6
# asm 2: veor >bb11=q6,<bb11=q6,<bb15=q5
veor q6,q6,q5

# qhasm:     bb15 ^= bb13
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb13=reg128#8
# asm 2: veor >bb15=q5,<bb15=q5,<bb13=q7
veor q5,q5,q7

# qhasm:     bb11 ^= bb12
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb12=reg128#4
# asm 2: veor >bb11=q6,<bb11=q6,<bb12=q3
veor q6,q6,q3

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb13=reg128#8
# asm 2: veor >bb12=q3,<bb12=q3,<bb13=q7
veor q3,q3,q7

# qhasm:     bb11 ^= bb9
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb9=reg128#2
# asm 2: veor >bb11=q6,<bb11=q6,<bb9=q1
veor q6,q6,q1

# qhasm:     bb10 ^= bb15
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb15=reg128#6
# asm 2: veor >bb10=q4,<bb10=q4,<bb15=q5
veor q4,q4,q5

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:       bb3 = bb15 ^ bb12
# asm 1: veor >bb3=reg128#9,<bb15=reg128#6,<bb12=reg128#4
# asm 2: veor >bb3=q8,<bb15=q5,<bb12=q3
veor q8,q5,q3

# qhasm:       bb2 = bb9 ^ bb10
# asm 1: veor >bb2=reg128#10,<bb9=reg128#2,<bb10=reg128#5
# asm 2: veor >bb2=q9,<bb9=q1,<bb10=q4
veor q9,q1,q4

# qhasm:       bb1 = bb13 ^ bb11
# asm 1: veor >bb1=reg128#11,<bb13=reg128#8,<bb11=reg128#7
# asm 2: veor >bb1=q10,<bb13=q7,<bb11=q6
veor q10,q7,q6

# qhasm:       bb5 = bb10 ^ bb12
# asm 1: veor >bb5=reg128#12,<bb10=reg128#5,<bb12=reg128#4
# asm 2: veor >bb5=q11,<bb10=q4,<bb12=q3
veor q11,q4,q3

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb14=q2,<bb8=q0
veor q12,q2,q0

# qhasm:       bb0 = bb2 & bb1
# asm 1: vand >bb0=reg128#14,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vand >bb0=q13,<bb2=q9,<bb1=q10
vand q13,q9,q10

# qhasm:       bb6 = bb3 & bb4
# asm 1: vand >bb6=reg128#15,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vand >bb6=q14,<bb3=q8,<bb4=q12
vand q14,q8,q12

# qhasm:       bb7 = bb3 ^ bb2
# asm 1: veor >bb7=reg128#16,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb7=q15,<bb3=q8,<bb2=q9
veor q15,q8,q9

# qhasm:       bb3 |= bb4
# asm 1: vorr >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: vorr >bb3=q8,<bb3=q8,<bb4=q12
vorr q8,q8,q12

# qhasm:       bb4 ^= bb1
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb1=reg128#11
# asm 2: veor >bb4=q12,<bb4=q12,<bb1=q10
veor q12,q12,q10

# qhasm:       bb2 |= bb1
# asm 1: vorr >bb2=reg128#10,<bb2=reg128#10,<bb1=reg128#11
# asm 2: vorr >bb2=q9,<bb2=q9,<bb1=q10
vorr q9,q9,q10

# qhasm:       bb7 &= bb4
# asm 1: vand >bb7=reg128#11,<bb7=reg128#16,<bb4=reg128#13
# asm 2: vand >bb7=q10,<bb7=q15,<bb4=q12
vand q10,q15,q12

# qhasm:       bb4 = bb11 ^ bb8
# asm 1: veor >bb4=reg128#13,<bb11=reg128#7,<bb8=reg128#1
# asm 2: veor >bb4=q12,<bb11=q6,<bb8=q0
veor q12,q6,q0

# qhasm:       bb3 ^= bb7
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb7=reg128#11
# asm 2: veor >bb3=q8,<bb3=q8,<bb7=q10
veor q8,q8,q10

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb2 ^= bb6
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb6=reg128#15
# asm 2: veor >bb2=q9,<bb2=q9,<bb6=q14
veor q9,q9,q14

# qhasm:       bb3 ^= bb5
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb5=reg128#12
# asm 2: veor >bb3=q8,<bb3=q8,<bb5=q11
veor q8,q8,q11

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#12
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q11
veor q9,q9,q11

# qhasm:       bb5 = bb15 ^ bb9
# asm 1: veor >bb5=reg128#12,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb5=q11,<bb15=q5,<bb9=q1
veor q11,q5,q1

# qhasm:       bb4 = bb13 ^ bb14
# asm 1: veor >bb4=reg128#13,<bb13=reg128#8,<bb14=reg128#3
# asm 2: veor >bb4=q12,<bb13=q7,<bb14=q2
veor q12,q7,q2

# qhasm:       bb0 ^= bb6
# asm 1: veor >bb0=reg128#14,<bb0=reg128#14,<bb6=reg128#15
# asm 2: veor >bb0=q13,<bb0=q13,<bb6=q14
veor q13,q13,q14

# qhasm:       bb1 = bb5 | bb4
# asm 1: vorr >bb1=reg128#16,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vorr >bb1=q15,<bb5=q11,<bb4=q12
vorr q15,q11,q12

# qhasm:       bb5 &= bb4
# asm 1: vand >bb5=reg128#12,<bb5=reg128#12,<bb4=reg128#13
# asm 2: vand >bb5=q11,<bb5=q11,<bb4=q12
vand q11,q11,q12

# qhasm:       bb1 ^= bb7
# asm 1: veor >bb1=reg128#11,<bb1=reg128#16,<bb7=reg128#11
# asm 2: veor >bb1=q10,<bb1=q15,<bb7=q10
veor q10,q15,q10

# qhasm:       bb0 ^= bb5
# asm 1: veor >bb0=reg128#12,<bb0=reg128#14,<bb5=reg128#12
# asm 2: veor >bb0=q11,<bb0=q13,<bb5=q11
veor q11,q13,q11

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#15
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q14
veor q10,q10,q14

# qhasm:       bb4 = bb10 & bb11
# asm 1: vand >bb4=reg128#13,<bb10=reg128#5,<bb11=reg128#7
# asm 2: vand >bb4=q12,<bb10=q4,<bb11=q6
vand q12,q4,q6

# qhasm:       bb5 = bb12 & bb8
# asm 1: vand >bb5=reg128#14,<bb12=reg128#4,<bb8=reg128#1
# asm 2: vand >bb5=q13,<bb12=q3,<bb8=q0
vand q13,q3,q0

# qhasm:       bb3 ^= bb4
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb4=reg128#13
# asm 2: veor >bb3=q8,<bb3=q8,<bb4=q12
veor q8,q8,q12

# qhasm:       bb2 ^= bb5
# asm 1: veor >bb2=reg128#10,<bb2=reg128#10,<bb5=reg128#14
# asm 2: veor >bb2=q9,<bb2=q9,<bb5=q13
veor q9,q9,q13

# qhasm:       bb6 = bb9 & bb13
# asm 1: vand >bb6=reg128#13,<bb9=reg128#2,<bb13=reg128#8
# asm 2: vand >bb6=q12,<bb9=q1,<bb13=q7
vand q12,q1,q7

# qhasm:       bb4 = bb3 ^ bb2
# asm 1: veor >bb4=reg128#14,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb4=q13,<bb3=q8,<bb2=q9
veor q13,q8,q9

# qhasm:       bb7 = bb15 | bb14
# asm 1: vorr >bb7=reg128#15,<bb15=reg128#6,<bb14=reg128#3
# asm 2: vorr >bb7=q14,<bb15=q5,<bb14=q2
vorr q14,q5,q2

# qhasm:       bb1 ^= bb6
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb6=reg128#13
# asm 2: veor >bb1=q10,<bb1=q10,<bb6=q12
veor q10,q10,q12

# qhasm:       bb0 ^= bb7
# asm 1: veor >bb0=reg128#12,<bb0=reg128#12,<bb7=reg128#15
# asm 2: veor >bb0=q11,<bb0=q11,<bb7=q14
veor q11,q11,q14

# qhasm:       bb3 &= bb1
# asm 1: vand >bb3=reg128#9,<bb3=reg128#9,<bb1=reg128#11
# asm 2: vand >bb3=q8,<bb3=q8,<bb1=q10
vand q8,q8,q10

# qhasm:       bb5 = bb1 ^ bb0
# asm 1: veor >bb5=reg128#13,<bb1=reg128#11,<bb0=reg128#12
# asm 2: veor >bb5=q12,<bb1=q10,<bb0=q11
veor q12,q10,q11

# qhasm:       bb6 = bb0 ^ bb3
# asm 1: veor >bb6=reg128#15,<bb0=reg128#12,<bb3=reg128#9
# asm 2: veor >bb6=q14,<bb0=q11,<bb3=q8
veor q14,q11,q8

# qhasm:       bb3 ^= bb2
# asm 1: veor >bb3=reg128#9,<bb3=reg128#9,<bb2=reg128#10
# asm 2: veor >bb3=q8,<bb3=q8,<bb2=q9
veor q8,q8,q9

# qhasm:       bb7 = bb4 & bb6
# asm 1: vand >bb7=reg128#16,<bb4=reg128#14,<bb6=reg128#15
# asm 2: vand >bb7=q15,<bb4=q13,<bb6=q14
vand q15,q13,q14

# qhasm:       bb5 &= bb3
# asm 1: vand >bb5=reg128#9,<bb5=reg128#13,<bb3=reg128#9
# asm 2: vand >bb5=q8,<bb5=q12,<bb3=q8
vand q8,q12,q8

# qhasm:       bb7 ^= bb2
# asm 1: veor >bb7=reg128#10,<bb7=reg128#16,<bb2=reg128#10
# asm 2: veor >bb7=q9,<bb7=q15,<bb2=q9
veor q9,q15,q9

# qhasm:       bb5 ^= bb0
# asm 1: veor >bb5=reg128#9,<bb5=reg128#9,<bb0=reg128#12
# asm 2: veor >bb5=q8,<bb5=q8,<bb0=q11
veor q8,q8,q11

# qhasm:       bb2 = bb6 ^ bb5
# asm 1: veor >bb2=reg128#13,<bb6=reg128#15,<bb5=reg128#9
# asm 2: veor >bb2=q12,<bb6=q14,<bb5=q8
veor q12,q14,q8

# qhasm:       bb1 ^= bb5
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb5=reg128#9
# asm 2: veor >bb1=q10,<bb1=q10,<bb5=q8
veor q10,q10,q8

# qhasm:       bb2 &= bb0
# asm 1: vand >bb2=reg128#12,<bb2=reg128#13,<bb0=reg128#12
# asm 2: vand >bb2=q11,<bb2=q12,<bb0=q11
vand q11,q12,q11

# qhasm:       bb0 = bb13 ^ bb11
# asm 1: veor >bb0=reg128#13,<bb13=reg128#8,<bb11=reg128#7
# asm 2: veor >bb0=q12,<bb13=q7,<bb11=q6
veor q12,q7,q6

# qhasm:       bb6 ^= bb2
# asm 1: veor >bb6=reg128#15,<bb6=reg128#15,<bb2=reg128#12
# asm 2: veor >bb6=q14,<bb6=q14,<bb2=q11
veor q14,q14,q11

# qhasm:       bb1 ^= bb2
# asm 1: veor >bb1=reg128#11,<bb1=reg128#11,<bb2=reg128#12
# asm 2: veor >bb1=q10,<bb1=q10,<bb2=q11
veor q10,q10,q11

# qhasm:       bb6 &= bb7
# asm 1: vand >bb6=reg128#12,<bb6=reg128#15,<bb7=reg128#10
# asm 2: vand >bb6=q11,<bb6=q14,<bb7=q9
vand q11,q14,q9

# qhasm:       bb6 ^= bb4
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb4=reg128#14
# asm 2: veor >bb6=q11,<bb6=q11,<bb4=q13
veor q11,q11,q13

# qhasm:       bb4 = bb14 ^ bb8
# asm 1: veor >bb4=reg128#14,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb4=q13,<bb14=q2,<bb8=q0
veor q13,q2,q0

# qhasm:       bb2 = bb7 ^ bb6
# asm 1: veor >bb2=reg128#15,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb2=q14,<bb7=q9,<bb6=q11
veor q14,q9,q11

# qhasm:       bb2 &= bb14
# asm 1: vand >bb2=reg128#15,<bb2=reg128#15,<bb14=reg128#3
# asm 2: vand >bb2=q14,<bb2=q14,<bb14=q2
vand q14,q14,q2

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb13=reg128#8
# asm 2: veor >bb14=q2,<bb14=q2,<bb13=q7
veor q2,q2,q7

# qhasm:       bb13 &= bb7
# asm 1: vand >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#10
# asm 2: vand >bb13=q7,<bb13=q7,<bb7=q9
vand q7,q7,q9

# qhasm:       bb14 &= bb6
# asm 1: vand >bb14=reg128#3,<bb14=reg128#3,<bb6=reg128#12
# asm 2: vand >bb14=q2,<bb14=q2,<bb6=q11
vand q2,q2,q11

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#12,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q11,<bb6=q11,<bb1=q10
veor q11,q11,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#10,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q9,<bb7=q9,<bb5=q8
veor q9,q9,q8

# qhasm:       bb14 ^= bb13
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb13=reg128#8
# asm 2: veor >bb14=q2,<bb14=q2,<bb13=q7
veor q2,q2,q7

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#16,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q15,<bb7=q9,<bb6=q11
veor q15,q9,q11

# qhasm:       bb13 ^= bb2
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb2=reg128#15
# asm 2: veor >bb13=q7,<bb13=q7,<bb2=q14
veor q7,q7,q14

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#15,<bb3=reg128#16,<bb4=reg128#14
# asm 2: vand >bb3=q14,<bb3=q15,<bb4=q13
vand q14,q15,q13

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb0=reg128#13
# asm 2: veor >bb4=q13,<bb4=q13,<bb0=q12
veor q13,q13,q12

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#13,<bb0=reg128#13,<bb7=reg128#10
# asm 2: vand >bb0=q12,<bb0=q12,<bb7=q9
vand q12,q12,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#14,<bb4=reg128#14,<bb6=reg128#12
# asm 2: vand >bb4=q13,<bb4=q13,<bb6=q11
vand q13,q13,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#13,<bb0=reg128#13,<bb4=reg128#14
# asm 2: veor >bb0=q12,<bb0=q12,<bb4=q13
veor q12,q12,q13

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#14,<bb4=reg128#14,<bb3=reg128#15
# asm 2: veor >bb4=q13,<bb4=q13,<bb3=q14
veor q13,q13,q14

# qhasm:       bb2 &= bb8
# asm 1: vand >bb2=reg128#15,<bb2=reg128#16,<bb8=reg128#1
# asm 2: vand >bb2=q14,<bb2=q15,<bb8=q0
vand q14,q15,q0

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#7
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q6
veor q0,q0,q6

# qhasm:       bb11 &= bb5
# asm 1: vand >bb11=reg128#7,<bb11=reg128#7,<bb5=reg128#9
# asm 2: vand >bb11=q6,<bb11=q6,<bb5=q8
vand q6,q6,q8

# qhasm:       bb8 &= bb1
# asm 1: vand >bb8=reg128#1,<bb8=reg128#1,<bb1=reg128#11
# asm 2: vand >bb8=q0,<bb8=q0,<bb1=q10
vand q0,q0,q10

# qhasm:       bb14 ^= bb4
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb4=reg128#14
# asm 2: veor >bb14=q2,<bb14=q2,<bb4=q13
veor q2,q2,q13

# qhasm:       bb8 ^= bb11
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb11=reg128#7
# asm 2: veor >bb8=q0,<bb8=q0,<bb11=q6
veor q0,q0,q6

# qhasm:       bb11 ^= bb2
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb2=reg128#15
# asm 2: veor >bb11=q6,<bb11=q6,<bb2=q14
veor q6,q6,q14

# qhasm:       bb8 ^= bb4
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb4=reg128#14
# asm 2: veor >bb8=q0,<bb8=q0,<bb4=q13
veor q0,q0,q13

# qhasm:       bb13 ^= bb0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb0=reg128#13
# asm 2: veor >bb13=q7,<bb13=q7,<bb0=q12
veor q7,q7,q12

# qhasm:       bb11 ^= bb0
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb0=reg128#13
# asm 2: veor >bb11=q6,<bb11=q6,<bb0=q12
veor q6,q6,q12

# qhasm:       bb4 = bb15 ^ bb12
# asm 1: veor >bb4=reg128#13,<bb15=reg128#6,<bb12=reg128#4
# asm 2: veor >bb4=q12,<bb15=q5,<bb12=q3
veor q12,q5,q3

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#14,<bb7=reg128#10,<bb6=reg128#12
# asm 2: veor >bb3=q13,<bb7=q9,<bb6=q11
veor q13,q9,q11

# qhasm:       bb0 = bb9 ^ bb10
# asm 1: veor >bb0=reg128#15,<bb9=reg128#2,<bb10=reg128#5
# asm 2: veor >bb0=q14,<bb9=q1,<bb10=q4
veor q14,q1,q4

# qhasm:       bb3 &= bb4
# asm 1: vand >bb3=reg128#14,<bb3=reg128#14,<bb4=reg128#13
# asm 2: vand >bb3=q13,<bb3=q13,<bb4=q12
vand q13,q13,q12

# qhasm:       bb4 ^= bb0
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb0=reg128#15
# asm 2: veor >bb4=q12,<bb4=q12,<bb0=q14
veor q12,q12,q14

# qhasm:       bb0 &= bb7
# asm 1: vand >bb0=reg128#15,<bb0=reg128#15,<bb7=reg128#10
# asm 2: vand >bb0=q14,<bb0=q14,<bb7=q9
vand q14,q14,q9

# qhasm:       bb4 &= bb6
# asm 1: vand >bb4=reg128#13,<bb4=reg128#13,<bb6=reg128#12
# asm 2: vand >bb4=q12,<bb4=q12,<bb6=q11
vand q12,q12,q11

# qhasm:       bb2 = bb5 ^ bb1
# asm 1: veor >bb2=reg128#16,<bb5=reg128#9,<bb1=reg128#11
# asm 2: veor >bb2=q15,<bb5=q8,<bb1=q10
veor q15,q8,q10

# qhasm:       bb0 ^= bb4
# asm 1: veor >bb0=reg128#15,<bb0=reg128#15,<bb4=reg128#13
# asm 2: veor >bb0=q14,<bb0=q14,<bb4=q12
veor q14,q14,q12

# qhasm:       bb4 ^= bb3
# asm 1: veor >bb4=reg128#13,<bb4=reg128#13,<bb3=reg128#14
# asm 2: veor >bb4=q12,<bb4=q12,<bb3=q13
veor q12,q12,q13

# qhasm:       bb2 &= bb12
# asm 1: vand >bb2=reg128#14,<bb2=reg128#16,<bb12=reg128#4
# asm 2: vand >bb2=q13,<bb2=q15,<bb12=q3
vand q13,q15,q3

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb10=reg128#5
# asm 2: veor >bb12=q3,<bb12=q3,<bb10=q4
veor q3,q3,q4

# qhasm:       bb10 &= bb5
# asm 1: vand >bb10=reg128#5,<bb10=reg128#5,<bb5=reg128#9
# asm 2: vand >bb10=q4,<bb10=q4,<bb5=q8
vand q4,q4,q8

# qhasm:       bb12 &= bb1
# asm 1: vand >bb12=reg128#4,<bb12=reg128#4,<bb1=reg128#11
# asm 2: vand >bb12=q3,<bb12=q3,<bb1=q10
vand q3,q3,q10

# qhasm:       bb7 ^= bb5
# asm 1: veor >bb7=reg128#9,<bb7=reg128#10,<bb5=reg128#9
# asm 2: veor >bb7=q8,<bb7=q9,<bb5=q8
veor q8,q9,q8

# qhasm:       bb6 ^= bb1
# asm 1: veor >bb6=reg128#10,<bb6=reg128#12,<bb1=reg128#11
# asm 2: veor >bb6=q9,<bb6=q11,<bb1=q10
veor q9,q11,q10

# qhasm:       bb12 ^= bb10
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb10=reg128#5
# asm 2: veor >bb12=q3,<bb12=q3,<bb10=q4
veor q3,q3,q4

# qhasm:       bb3 = bb7 ^ bb6
# asm 1: veor >bb3=reg128#11,<bb7=reg128#9,<bb6=reg128#10
# asm 2: veor >bb3=q10,<bb7=q8,<bb6=q9
veor q10,q8,q9

# qhasm:       bb10 ^= bb2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb2=reg128#14
# asm 2: veor >bb10=q4,<bb10=q4,<bb2=q13
veor q4,q4,q13

# qhasm:       bb3 &= bb15
# asm 1: vand >bb3=reg128#11,<bb3=reg128#11,<bb15=reg128#6
# asm 2: vand >bb3=q10,<bb3=q10,<bb15=q5
vand q10,q10,q5

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 &= bb7
# asm 1: vand >bb9=reg128#2,<bb9=reg128#2,<bb7=reg128#9
# asm 2: vand >bb9=q1,<bb9=q1,<bb7=q8
vand q1,q1,q8

# qhasm:       bb15 &= bb6
# asm 1: vand >bb15=reg128#6,<bb15=reg128#6,<bb6=reg128#10
# asm 2: vand >bb15=q5,<bb15=q5,<bb6=q9
vand q5,q5,q9

# qhasm:       bb12 ^= bb4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb4=reg128#13
# asm 2: veor >bb12=q3,<bb12=q3,<bb4=q12
veor q3,q3,q12

# qhasm:       bb15 ^= bb9
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb9=reg128#2
# asm 2: veor >bb15=q5,<bb15=q5,<bb9=q1
veor q5,q5,q1

# qhasm:       bb9 ^= bb3
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb3=reg128#11
# asm 2: veor >bb9=q1,<bb9=q1,<bb3=q10
veor q1,q1,q10

# qhasm:       bb15 ^= bb4
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb4=reg128#13
# asm 2: veor >bb15=q5,<bb15=q5,<bb4=q12
veor q5,q5,q12

# qhasm:       bb9 ^= bb0
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb0=reg128#15
# asm 2: veor >bb9=q1,<bb9=q1,<bb0=q14
veor q1,q1,q14

# qhasm:       bb10 ^= bb0
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb0=reg128#15
# asm 2: veor >bb10=q4,<bb10=q4,<bb0=q14
veor q4,q4,q14

# qhasm:     bb15 ^= bb8
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb8=reg128#1
# asm 2: veor >bb15=q5,<bb15=q5,<bb8=q0
veor q5,q5,q0

# qhasm:     bb9 ^= bb14
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb14=reg128#3
# asm 2: veor >bb9=q1,<bb9=q1,<bb14=q2
veor q1,q1,q2

# qhasm:     bb12 ^= bb15
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb15=reg128#6
# asm 2: veor >bb12=q3,<bb12=q3,<bb15=q5
veor q3,q3,q5

# qhasm:     bb14 ^= bb8
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb8=reg128#1
# asm 2: veor >bb14=q2,<bb14=q2,<bb8=q0
veor q2,q2,q0

# qhasm:     bb8 ^= bb9
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb9=reg128#2
# asm 2: veor >bb8=q0,<bb8=q0,<bb9=q1
veor q0,q0,q1

# qhasm:     bb9 ^= bb13
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb13=reg128#8
# asm 2: veor >bb9=q1,<bb9=q1,<bb13=q7
veor q1,q1,q7

# qhasm:     bb13 ^= bb10
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb10=reg128#5
# asm 2: veor >bb13=q7,<bb13=q7,<bb10=q4
veor q7,q7,q4

# qhasm:     bb10 ^= bb11
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb11=reg128#7
# asm 2: veor >bb10=q4,<bb10=q4,<bb11=q6
veor q4,q4,q6

# qhasm:     bb11 ^= bb13
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb13=reg128#8
# asm 2: veor >bb11=q6,<bb11=q6,<bb13=q7
veor q6,q6,q7

# qhasm:     bb12 ^= bb13
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb13=reg128#8
# asm 2: veor >bb12=q3,<bb12=q3,<bb13=q7
veor q3,q3,q7

# qhasm:     bb14 ^= bb11
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb11=reg128#7
# asm 2: veor >bb14=q2,<bb14=q2,<bb11=q6
veor q2,q2,q6

# qhasm:     bb0 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb0=reg128#9%bot->bb0=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb0=d16->bb0=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb8 ^= bb0
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<bb0=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<bb0=q8
veor q0,q0,q8

# qhasm:     bb1 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb1=reg128#9%bot->bb1=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb1=d16->bb1=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb9 ^= bb1
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<bb1=reg128#9
# asm 2: veor >bb9=q1,<bb9=q1,<bb1=q8
veor q1,q1,q8

# qhasm:     bb2 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb2=reg128#9%bot->bb2=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb2=d16->bb2=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb12 ^= bb2
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<bb2=reg128#9
# asm 2: veor >bb12=q3,<bb12=q3,<bb2=q8
veor q3,q3,q8

# qhasm:     bb3 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb3=reg128#9%bot->bb3=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb3=d16->bb3=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb14 ^= bb3
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<bb3=reg128#9
# asm 2: veor >bb14=q2,<bb14=q2,<bb3=q8
veor q2,q2,q8

# qhasm:     bb4 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb4=reg128#9%bot->bb4=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb4=d16->bb4=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb11 ^= bb4
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<bb4=reg128#9
# asm 2: veor >bb11=q6,<bb11=q6,<bb4=q8
veor q6,q6,q8

# qhasm:     bb5 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb5=reg128#9%bot->bb5=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb5=d16->bb5=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb15 ^= bb5
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<bb5=reg128#9
# asm 2: veor >bb15=q5,<bb15=q5,<bb5=q8
veor q5,q5,q8

# qhasm:     bb6 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb6=reg128#9%bot->bb6=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb6=d16->bb6=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb10 ^= bb6
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<bb6=reg128#9
# asm 2: veor >bb10=q4,<bb10=q4,<bb6=q8
veor q4,q4,q8

# qhasm:     bb7 aligned= mem128[c];c += 16
# asm 1: vld1.8 {>bb7=reg128#9%bot->bb7=reg128#9%top},[<c=int32#4,: 128]!
# asm 2: vld1.8 {>bb7=d16->bb7=d17},[<c=r3,: 128]!
vld1.8 {d16-d17},[r3,: 128]!

# qhasm:     bb13 ^= bb7
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<bb7=reg128#9
# asm 2: veor >bb13=q7,<bb13=q7,<bb7=q8
veor q7,q7,q8

# qhasm:     u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
# asm 1: vmov.i8 >u=reg128#9,#0x55
# asm 2: vmov.i8 >u=q8,#0x55
vmov.i8 q8,#0x55

# qhasm:       2x t0 = bb10 unsigned>> 1
# asm 1: vshr.u64 >t0=reg128#10,<bb10=reg128#5,#1
# asm 2: vshr.u64 >t0=q9,<bb10=q4,#1
vshr.u64 q9,q4,#1

# qhasm:       2x t2 = bb11 unsigned>> 1
# asm 1: vshr.u64 >t2=reg128#11,<bb11=reg128#7,#1
# asm 2: vshr.u64 >t2=q10,<bb11=q6,#1
vshr.u64 q10,q6,#1

# qhasm:       2x t4 = bb12 unsigned>> 1
# asm 1: vshr.u64 >t4=reg128#12,<bb12=reg128#4,#1
# asm 2: vshr.u64 >t4=q11,<bb12=q3,#1
vshr.u64 q11,q3,#1

# qhasm:       2x t6 = bb8 unsigned>> 1
# asm 1: vshr.u64 >t6=reg128#13,<bb8=reg128#1,#1
# asm 2: vshr.u64 >t6=q12,<bb8=q0,#1
vshr.u64 q12,q0,#1

# qhasm:       t0 ^= bb13
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<bb13=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<bb13=q7
veor q9,q9,q7

# qhasm:       t2 ^= bb15
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<bb15=reg128#6
# asm 2: veor >t2=q10,<t2=q10,<bb15=q5
veor q10,q10,q5

# qhasm:       t4 ^= bb14
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<bb14=reg128#3
# asm 2: veor >t4=q11,<t4=q11,<bb14=q2
veor q11,q11,q2

# qhasm:       t6 ^= bb9
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<bb9=reg128#2
# asm 2: veor >t6=q12,<t6=q12,<bb9=q1
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

# qhasm:       bb13 ^= t0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<t0=reg128#10
# asm 2: veor >bb13=q7,<bb13=q7,<t0=q9
veor q7,q7,q9

# qhasm:       bb15 ^= t2
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<t2=reg128#11
# asm 2: veor >bb15=q5,<bb15=q5,<t2=q10
veor q5,q5,q10

# qhasm:       bb14 ^= t4
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<t4=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<t4=q11
veor q2,q2,q11

# qhasm:       bb9 ^= t6
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<t6=reg128#9
# asm 2: veor >bb9=q1,<bb9=q1,<t6=q8
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

# qhasm:       bb10 ^= t0
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<t0=reg128#10
# asm 2: veor >bb10=q4,<bb10=q4,<t0=q9
veor q4,q4,q9

# qhasm:       bb11 ^= t2
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<t2=reg128#11
# asm 2: veor >bb11=q6,<bb11=q6,<t2=q10
veor q6,q6,q10

# qhasm:       bb12 ^= t4
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<t4=reg128#12
# asm 2: veor >bb12=q3,<bb12=q3,<t4=q11
veor q3,q3,q11

# qhasm:       bb8 ^= t6
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<t6=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<t6=q8
veor q0,q0,q8

# qhasm:     u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33
# asm 1: vmov.i8 >u=reg128#9,#0x33
# asm 2: vmov.i8 >u=q8,#0x33
vmov.i8 q8,#0x33

# qhasm:       2x t0 = bb15 unsigned>> 2
# asm 1: vshr.u64 >t0=reg128#10,<bb15=reg128#6,#2
# asm 2: vshr.u64 >t0=q9,<bb15=q5,#2
vshr.u64 q9,q5,#2

# qhasm:       2x t2 = bb11 unsigned>> 2
# asm 1: vshr.u64 >t2=reg128#11,<bb11=reg128#7,#2
# asm 2: vshr.u64 >t2=q10,<bb11=q6,#2
vshr.u64 q10,q6,#2

# qhasm:       2x t4 = bb9 unsigned>> 2
# asm 1: vshr.u64 >t4=reg128#12,<bb9=reg128#2,#2
# asm 2: vshr.u64 >t4=q11,<bb9=q1,#2
vshr.u64 q11,q1,#2

# qhasm:       2x t6 = bb8 unsigned>> 2
# asm 1: vshr.u64 >t6=reg128#13,<bb8=reg128#1,#2
# asm 2: vshr.u64 >t6=q12,<bb8=q0,#2
vshr.u64 q12,q0,#2

# qhasm:       t0 ^= bb13
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<bb13=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<bb13=q7
veor q9,q9,q7

# qhasm:       t2 ^= bb10
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<bb10=reg128#5
# asm 2: veor >t2=q10,<t2=q10,<bb10=q4
veor q10,q10,q4

# qhasm:       t4 ^= bb14
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<bb14=reg128#3
# asm 2: veor >t4=q11,<t4=q11,<bb14=q2
veor q11,q11,q2

# qhasm:       t6 ^= bb12
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<bb12=reg128#4
# asm 2: veor >t6=q12,<t6=q12,<bb12=q3
veor q12,q12,q3

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

# qhasm:       bb13 ^= t0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<t0=reg128#10
# asm 2: veor >bb13=q7,<bb13=q7,<t0=q9
veor q7,q7,q9

# qhasm:       bb10 ^= t2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<t2=reg128#11
# asm 2: veor >bb10=q4,<bb10=q4,<t2=q10
veor q4,q4,q10

# qhasm:       bb14 ^= t4
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<t4=reg128#12
# asm 2: veor >bb14=q2,<bb14=q2,<t4=q11
veor q2,q2,q11

# qhasm:       bb12 ^= t6
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<t6=reg128#9
# asm 2: veor >bb12=q3,<bb12=q3,<t6=q8
veor q3,q3,q8

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

# qhasm:       bb15 ^= t0
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<t0=reg128#10
# asm 2: veor >bb15=q5,<bb15=q5,<t0=q9
veor q5,q5,q9

# qhasm:       bb11 ^= t2
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<t2=reg128#11
# asm 2: veor >bb11=q6,<bb11=q6,<t2=q10
veor q6,q6,q10

# qhasm:       bb9 ^= t4
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<t4=reg128#12
# asm 2: veor >bb9=q1,<bb9=q1,<t4=q11
veor q1,q1,q11

# qhasm:       bb8 ^= t6
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<t6=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<t6=q8
veor q0,q0,q8

# qhasm:     u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
# asm 1: vmov.i8 >u=reg128#9,#0x0f
# asm 2: vmov.i8 >u=q8,#0x0f
vmov.i8 q8,#0x0f

# qhasm:       2x t0 = bb14 unsigned>> 4
# asm 1: vshr.u64 >t0=reg128#10,<bb14=reg128#3,#4
# asm 2: vshr.u64 >t0=q9,<bb14=q2,#4
vshr.u64 q9,q2,#4

# qhasm:       2x t2 = bb12 unsigned>> 4
# asm 1: vshr.u64 >t2=reg128#11,<bb12=reg128#4,#4
# asm 2: vshr.u64 >t2=q10,<bb12=q3,#4
vshr.u64 q10,q3,#4

# qhasm:       2x t4 = bb9 unsigned>> 4
# asm 1: vshr.u64 >t4=reg128#12,<bb9=reg128#2,#4
# asm 2: vshr.u64 >t4=q11,<bb9=q1,#4
vshr.u64 q11,q1,#4

# qhasm:       2x t6 = bb8 unsigned>> 4
# asm 1: vshr.u64 >t6=reg128#13,<bb8=reg128#1,#4
# asm 2: vshr.u64 >t6=q12,<bb8=q0,#4
vshr.u64 q12,q0,#4

# qhasm:       t0 ^= bb13
# asm 1: veor >t0=reg128#10,<t0=reg128#10,<bb13=reg128#8
# asm 2: veor >t0=q9,<t0=q9,<bb13=q7
veor q9,q9,q7

# qhasm:       t2 ^= bb10
# asm 1: veor >t2=reg128#11,<t2=reg128#11,<bb10=reg128#5
# asm 2: veor >t2=q10,<t2=q10,<bb10=q4
veor q10,q10,q4

# qhasm:       t4 ^= bb15
# asm 1: veor >t4=reg128#12,<t4=reg128#12,<bb15=reg128#6
# asm 2: veor >t4=q11,<t4=q11,<bb15=q5
veor q11,q11,q5

# qhasm:       t6 ^= bb11
# asm 1: veor >t6=reg128#13,<t6=reg128#13,<bb11=reg128#7
# asm 2: veor >t6=q12,<t6=q12,<bb11=q6
veor q12,q12,q6

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

# qhasm:       bb13 ^= t0
# asm 1: veor >bb13=reg128#8,<bb13=reg128#8,<t0=reg128#10
# asm 2: veor >bb13=q7,<bb13=q7,<t0=q9
veor q7,q7,q9

# qhasm:       bb10 ^= t2
# asm 1: veor >bb10=reg128#5,<bb10=reg128#5,<t2=reg128#11
# asm 2: veor >bb10=q4,<bb10=q4,<t2=q10
veor q4,q4,q10

# qhasm:       bb15 ^= t4
# asm 1: veor >bb15=reg128#6,<bb15=reg128#6,<t4=reg128#12
# asm 2: veor >bb15=q5,<bb15=q5,<t4=q11
veor q5,q5,q11

# qhasm:       bb11 ^= t6
# asm 1: veor >bb11=reg128#7,<bb11=reg128#7,<t6=reg128#9
# asm 2: veor >bb11=q6,<bb11=q6,<t6=q8
veor q6,q6,q8

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

# qhasm:       bb14 ^= t0
# asm 1: veor >bb14=reg128#3,<bb14=reg128#3,<t0=reg128#10
# asm 2: veor >bb14=q2,<bb14=q2,<t0=q9
veor q2,q2,q9

# qhasm:       bb12 ^= t2
# asm 1: veor >bb12=reg128#4,<bb12=reg128#4,<t2=reg128#11
# asm 2: veor >bb12=q3,<bb12=q3,<t2=q10
veor q3,q3,q10

# qhasm:       bb9 ^= t4
# asm 1: veor >bb9=reg128#2,<bb9=reg128#2,<t4=reg128#12
# asm 2: veor >bb9=q1,<bb9=q1,<t4=q11
veor q1,q1,q11

# qhasm:       bb8 ^= t6
# asm 1: veor >bb8=reg128#1,<bb8=reg128#1,<t6=reg128#9
# asm 2: veor >bb8=q0,<bb8=q0,<t6=q8
veor q0,q0,q8

# qhasm: unsigned<? =? input_2-128
# asm 1: cmp <input_2=int32#3,#128
# asm 2: cmp <input_2=r2,#128
cmp r2,#128

# qhasm: goto partial if unsigned<
blo ._partial

# qhasm: goto full if =
beq ._full

# qhasm: tmp = mem32[np+12]
# asm 1: ldr >tmp=int32#4,[<np=int32#2,#12]
# asm 2: ldr >tmp=r3,[<np=r1,#12]
ldr r3,[r1,#12]

# qhasm: tmp = tmp[3]tmp[2]tmp[1]tmp[0]
# asm 1: rev >tmp=int32#4,<tmp=int32#4
# asm 2: rev >tmp=r3,<tmp=r3
rev r3,r3

# qhasm: tmp += 8
# asm 1: add >tmp=int32#4,<tmp=int32#4,#8
# asm 2: add >tmp=r3,<tmp=r3,#8
add r3,r3,#8

# qhasm: tmp = tmp[3]tmp[2]tmp[1]tmp[0]
# asm 1: rev >tmp=int32#4,<tmp=int32#4
# asm 2: rev >tmp=r3,<tmp=r3
rev r3,r3

# qhasm: mem32[np+12] = tmp
# asm 1: str <tmp=int32#4,[<np=int32#2,#12]
# asm 2: str <tmp=r3,[<np=r1,#12]
str r3,[r1,#12]

# qhasm: mem128[input_0] = bb8;input_0 += 16
# asm 1: vst1.8 {<bb8=reg128#1%bot-<bb8=reg128#1%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb8=d0-<bb8=d1},[<input_0=r0]!
vst1.8 {d0-d1},[r0]!

# qhasm: mem128[input_0] = bb9;input_0 += 16
# asm 1: vst1.8 {<bb9=reg128#2%bot-<bb9=reg128#2%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb9=d2-<bb9=d3},[<input_0=r0]!
vst1.8 {d2-d3},[r0]!

# qhasm: mem128[input_0] = bb12;input_0 += 16
# asm 1: vst1.8 {<bb12=reg128#4%bot-<bb12=reg128#4%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb12=d6-<bb12=d7},[<input_0=r0]!
vst1.8 {d6-d7},[r0]!

# qhasm: mem128[input_0] = bb14;input_0 += 16
# asm 1: vst1.8 {<bb14=reg128#3%bot-<bb14=reg128#3%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb14=d4-<bb14=d5},[<input_0=r0]!
vst1.8 {d4-d5},[r0]!

# qhasm: mem128[input_0] = bb11;input_0 += 16
# asm 1: vst1.8 {<bb11=reg128#7%bot-<bb11=reg128#7%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb11=d12-<bb11=d13},[<input_0=r0]!
vst1.8 {d12-d13},[r0]!

# qhasm: mem128[input_0] = bb15;input_0 += 16
# asm 1: vst1.8 {<bb15=reg128#6%bot-<bb15=reg128#6%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb15=d10-<bb15=d11},[<input_0=r0]!
vst1.8 {d10-d11},[r0]!

# qhasm: mem128[input_0] = bb10;input_0 += 16
# asm 1: vst1.8 {<bb10=reg128#5%bot-<bb10=reg128#5%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb10=d8-<bb10=d9},[<input_0=r0]!
vst1.8 {d8-d9},[r0]!

# qhasm: mem128[input_0] = bb13;input_0 += 16
# asm 1: vst1.8 {<bb13=reg128#8%bot-<bb13=reg128#8%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb13=d14-<bb13=d15},[<input_0=r0]!
vst1.8 {d14-d15},[r0]!

# qhasm: input_2 -= 128
# asm 1: sub >input_2=int32#3,<input_2=int32#3,#128
# asm 2: sub >input_2=r2,<input_2=r2,#128
sub r2,r2,#128

# qhasm: goto enc_block
b ._enc_block

# qhasm: partial:
._partial:

# qhasm: blp = &bl
# asm 1: lea >blp=int32#2,<bl=stack1024#1
# asm 2: lea >blp=r1,<bl=[sp,#192]
add r1,sp,#192

# qhasm: mem128[blp] = bb8;blp += 16
# asm 1: vst1.8 {<bb8=reg128#1%bot-<bb8=reg128#1%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb8=d0-<bb8=d1},[<blp=r1]!
vst1.8 {d0-d1},[r1]!

# qhasm: mem128[blp] = bb9;blp += 16
# asm 1: vst1.8 {<bb9=reg128#2%bot-<bb9=reg128#2%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb9=d2-<bb9=d3},[<blp=r1]!
vst1.8 {d2-d3},[r1]!

# qhasm: mem128[blp] = bb12;blp += 16
# asm 1: vst1.8 {<bb12=reg128#4%bot-<bb12=reg128#4%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb12=d6-<bb12=d7},[<blp=r1]!
vst1.8 {d6-d7},[r1]!

# qhasm: mem128[blp] = bb14;blp += 16
# asm 1: vst1.8 {<bb14=reg128#3%bot-<bb14=reg128#3%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb14=d4-<bb14=d5},[<blp=r1]!
vst1.8 {d4-d5},[r1]!

# qhasm: mem128[blp] = bb11;blp += 16
# asm 1: vst1.8 {<bb11=reg128#7%bot-<bb11=reg128#7%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb11=d12-<bb11=d13},[<blp=r1]!
vst1.8 {d12-d13},[r1]!

# qhasm: mem128[blp] = bb15;blp += 16
# asm 1: vst1.8 {<bb15=reg128#6%bot-<bb15=reg128#6%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb15=d10-<bb15=d11},[<blp=r1]!
vst1.8 {d10-d11},[r1]!

# qhasm: mem128[blp] = bb10;blp += 16
# asm 1: vst1.8 {<bb10=reg128#5%bot-<bb10=reg128#5%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb10=d8-<bb10=d9},[<blp=r1]!
vst1.8 {d8-d9},[r1]!

# qhasm: mem128[blp] = bb13;blp += 16
# asm 1: vst1.8 {<bb13=reg128#8%bot-<bb13=reg128#8%top},[<blp=int32#2]!
# asm 2: vst1.8 {<bb13=d14-<bb13=d15},[<blp=r1]!
vst1.8 {d14-d15},[r1]!

# qhasm: blp = &bl
# asm 1: lea >blp=int32#2,<bl=stack1024#1
# asm 2: lea >blp=r1,<bl=[sp,#192]
add r1,sp,#192

# qhasm: bytes:
._bytes:

# qhasm: =? input_2-0
# asm 1: cmp <input_2=int32#3,#0
# asm 2: cmp <input_2=r2,#0
cmp r2,#0

# qhasm: goto end if =
beq ._end

# qhasm: b = mem8[blp];blp += 1
# asm 1: ldrb >b=int32#4,[<blp=int32#2],#1
# asm 2: ldrb >b=r3,[<blp=r1],#1
ldrb r3,[r1],#1

# qhasm: mem8[input_0] = b;input_0 += 1
# asm 1: strb <b=int32#4,[<input_0=int32#1],#1
# asm 2: strb <b=r3,[<input_0=r0],#1
strb r3,[r0],#1

# qhasm: input_2 -= 1
# asm 1: sub >input_2=int32#3,<input_2=int32#3,#1
# asm 2: sub >input_2=r2,<input_2=r2,#1
sub r2,r2,#1

# qhasm: goto bytes
b ._bytes

# qhasm: full:
._full:

# qhasm: mem128[input_0] = bb8;input_0 += 16
# asm 1: vst1.8 {<bb8=reg128#1%bot-<bb8=reg128#1%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb8=d0-<bb8=d1},[<input_0=r0]!
vst1.8 {d0-d1},[r0]!

# qhasm: mem128[input_0] = bb9;input_0 += 16
# asm 1: vst1.8 {<bb9=reg128#2%bot-<bb9=reg128#2%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb9=d2-<bb9=d3},[<input_0=r0]!
vst1.8 {d2-d3},[r0]!

# qhasm: mem128[input_0] = bb12;input_0 += 16
# asm 1: vst1.8 {<bb12=reg128#4%bot-<bb12=reg128#4%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb12=d6-<bb12=d7},[<input_0=r0]!
vst1.8 {d6-d7},[r0]!

# qhasm: mem128[input_0] = bb14;input_0 += 16
# asm 1: vst1.8 {<bb14=reg128#3%bot-<bb14=reg128#3%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb14=d4-<bb14=d5},[<input_0=r0]!
vst1.8 {d4-d5},[r0]!

# qhasm: mem128[input_0] = bb11;input_0 += 16
# asm 1: vst1.8 {<bb11=reg128#7%bot-<bb11=reg128#7%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb11=d12-<bb11=d13},[<input_0=r0]!
vst1.8 {d12-d13},[r0]!

# qhasm: mem128[input_0] = bb15;input_0 += 16
# asm 1: vst1.8 {<bb15=reg128#6%bot-<bb15=reg128#6%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb15=d10-<bb15=d11},[<input_0=r0]!
vst1.8 {d10-d11},[r0]!

# qhasm: mem128[input_0] = bb10;input_0 += 16
# asm 1: vst1.8 {<bb10=reg128#5%bot-<bb10=reg128#5%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb10=d8-<bb10=d9},[<input_0=r0]!
vst1.8 {d8-d9},[r0]!

# qhasm: mem128[input_0] = bb13;input_0 += 16
# asm 1: vst1.8 {<bb13=reg128#8%bot-<bb13=reg128#8%top},[<input_0=int32#1]!
# asm 2: vst1.8 {<bb13=d14-<bb13=d15},[<input_0=r0]!
vst1.8 {d14-d15},[r0]!

# qhasm: end:
._end:

# qhasm: assign r4 r5 to caller_r4 caller_r5 = stack_r45
# asm 1: ldrd >caller_r4=int32#5,<stack_r45=stack64#1
# asm 2: ldrd >caller_r4=r4,<stack_r45=[sp,#0]
ldrd r4,[sp,#0]

# qhasm: assign r6 r7 to caller_r6 caller_r7 = stack_r67
# asm 1: ldrd >caller_r6=int32#7,<stack_r67=stack64#2
# asm 2: ldrd >caller_r6=r6,<stack_r67=[sp,#8]
ldrd r6,[sp,#8]

# qhasm: qpopreturn
mov sp,r12
vpop {q4,q5,q6,q7}
bx lr
