
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

# qhasm: int32 t00

# qhasm: int32 t01

# qhasm: int32 t10

# qhasm: int32 t11

# qhasm: int32 t20

# qhasm: int32 t21

# qhasm: int32 k00

# qhasm: int32 k01

# qhasm: int32 k10

# qhasm: int32 k11

# qhasm: int32 k20

# qhasm: int32 k21

# qhasm: int32 k30

# qhasm: int32 k31

# qhasm: int32 k40

# qhasm: int32 k41

# qhasm: int32 k50

# qhasm: int32 k51

# qhasm: int32 k60

# qhasm: int32 k61

# qhasm: int32 k70

# qhasm: int32 k71

# qhasm: int32 k80

# qhasm: int32 k81

# qhasm: int32 x00

# qhasm: int32 x01

# qhasm: int32 x10

# qhasm: int32 x11

# qhasm: int32 x20

# qhasm: int32 x21

# qhasm: int32 x30

# qhasm: int32 x31

# qhasm: int32 x40

# qhasm: int32 x41

# qhasm: int32 x50

# qhasm: int32 x51

# qhasm: int32 x60

# qhasm: int32 x61

# qhasm: int32 x70

# qhasm: int32 x71

# qhasm: int32 w00

# qhasm: int32 w01

# qhasm: int32 w10

# qhasm: int32 w11

# qhasm: int32 w20

# qhasm: int32 w21

# qhasm: int32 w30

# qhasm: int32 w31

# qhasm: int32 w40

# qhasm: int32 w41

# qhasm: int32 w50

# qhasm: int32 w51

# qhasm: int32 w60

# qhasm: int32 w61

# qhasm: int32 w70

# qhasm: int32 w71

# qhasm: int32 const0

# qhasm: int32 const1

# qhasm: int32 kt00

# qhasm: int32 kt01

# qhasm: int32 kt10

# qhasm: int32 kt11

# qhasm: int32 kt20

# qhasm: int32 kt21

# qhasm: int32 kt30

# qhasm: int32 kt31

# qhasm: int32 kt40

# qhasm: int32 kt41

# qhasm: int32 kt50

# qhasm: int32 kt51

# qhasm: int32 kt60

# qhasm: int32 kt61

# qhasm: int32 kt70

# qhasm: int32 kt71

# qhasm: int32 kt80

# qhasm: int32 kt81

# qhasm: stack64 t0_stack

# qhasm: stack64 t1_stack

# qhasm: stack64 t2_stack

# qhasm: stack64 k0_stack

# qhasm: stack64 k1_stack

# qhasm: stack64 k2_stack

# qhasm: stack64 k3_stack

# qhasm: stack64 k4_stack

# qhasm: stack64 k5_stack

# qhasm: stack64 k6_stack

# qhasm: stack64 k7_stack

# qhasm: stack64 k8_stack

# qhasm: stack64 x0_stack

# qhasm: stack64 x1_stack

# qhasm: stack64 x2_stack

# qhasm: stack64 x3_stack

# qhasm: stack64 x4_stack

# qhasm: stack64 x5_stack

# qhasm: stack64 x6_stack

# qhasm: stack64 x7_stack

# qhasm: stack64 const_stack

# qhasm: stack64 kt0_stack

# qhasm: stack64 kt1_stack

# qhasm: stack64 kt2_stack

# qhasm: stack64 kt3_stack

# qhasm: stack64 kt4_stack

# qhasm: stack64 kt5_stack

# qhasm: stack64 kt6_stack

# qhasm: stack64 kt7_stack

# qhasm: stack64 kt8_stack

# qhasm: int32 ctx

# qhasm: int32 msg

# qhasm: int32 blkCnt

# qhasm: int32 byteCntAdd

# qhasm: int32 tmp

# qhasm: stack32 rv_stack

# qhasm: stack32 ctx_stack

# qhasm: stack32 msg_stack

# qhasm: stack32 blkCnt_stack

# qhasm: stack32 byteCntAdd_stack

# qhasm: stack32 caller_r4_stack

# qhasm: stack32 caller_r5_stack

# qhasm: stack32 caller_r6_stack

# qhasm: stack32 caller_r7_stack

# qhasm: stack32 caller_r8_stack

# qhasm: stack32 caller_r9_stack

# qhasm: stack32 caller_r10_stack

# qhasm: stack32 caller_r11_stack

# qhasm: stack32 caller_r14_stack

# qhasm: enter Skein_512_Process_Block
.align 2
.global _Skein_512_Process_Block
.global Skein_512_Process_Block
_Skein_512_Process_Block:
Skein_512_Process_Block:
sub sp,sp,#320

# qhasm: caller_r4_stack = caller_r4
# asm 1: str <caller_r4=int32#5,>caller_r4_stack=stack32#1
# asm 2: str <caller_r4=r4,>caller_r4_stack=[sp,#256]
str r4,[sp,#256]

# qhasm: caller_r5_stack = caller_r5
# asm 1: str <caller_r5=int32#6,>caller_r5_stack=stack32#2
# asm 2: str <caller_r5=r5,>caller_r5_stack=[sp,#260]
str r5,[sp,#260]

# qhasm: caller_r6_stack = caller_r6
# asm 1: str <caller_r6=int32#7,>caller_r6_stack=stack32#3
# asm 2: str <caller_r6=r6,>caller_r6_stack=[sp,#264]
str r6,[sp,#264]

# qhasm: caller_r7_stack = caller_r7
# asm 1: str <caller_r7=int32#8,>caller_r7_stack=stack32#4
# asm 2: str <caller_r7=r7,>caller_r7_stack=[sp,#268]
str r7,[sp,#268]

# qhasm: caller_r8_stack = caller_r8
# asm 1: str <caller_r8=int32#9,>caller_r8_stack=stack32#5
# asm 2: str <caller_r8=r8,>caller_r8_stack=[sp,#272]
str r8,[sp,#272]

# qhasm: caller_r9_stack = caller_r9
# asm 1: str <caller_r9=int32#10,>caller_r9_stack=stack32#6
# asm 2: str <caller_r9=r9,>caller_r9_stack=[sp,#276]
str r9,[sp,#276]

# qhasm: caller_r10_stack = caller_r10
# asm 1: str <caller_r10=int32#11,>caller_r10_stack=stack32#7
# asm 2: str <caller_r10=r10,>caller_r10_stack=[sp,#280]
str r10,[sp,#280]

# qhasm: caller_r11_stack = caller_r11
# asm 1: str <caller_r11=int32#12,>caller_r11_stack=stack32#8
# asm 2: str <caller_r11=r11,>caller_r11_stack=[sp,#284]
str r11,[sp,#284]

# qhasm: caller_r14_stack = caller_r14
# asm 1: str <caller_r14=int32#14,>caller_r14_stack=stack32#9
# asm 2: str <caller_r14=r14,>caller_r14_stack=[sp,#288]
str r14,[sp,#288]

# qhasm: ctx_stack = input_0
# asm 1: str <input_0=int32#1,>ctx_stack=stack32#10
# asm 2: str <input_0=r0,>ctx_stack=[sp,#292]
str r0,[sp,#292]

# qhasm: msg_stack = input_1
# asm 1: str <input_1=int32#2,>msg_stack=stack32#11
# asm 2: str <input_1=r1,>msg_stack=[sp,#296]
str r1,[sp,#296]

# qhasm: blkCnt_stack = input_2
# asm 1: str <input_2=int32#3,>blkCnt_stack=stack32#12
# asm 2: str <input_2=r2,>blkCnt_stack=[sp,#300]
str r2,[sp,#300]

# qhasm: byteCntAdd_stack = input_3
# asm 1: str <input_3=int32#4,>byteCntAdd_stack=stack32#13
# asm 2: str <input_3=r3,>byteCntAdd_stack=[sp,#304]
str r3,[sp,#304]

# qhasm: assign r8 r9 to t00 t01 = mem64[input_0 + 64]
# asm 1: ldrd >t00=int32#9,[<input_0=int32#1,#64]
# asm 2: ldrd >t00=r8,[<input_0=r0,#64]
ldrd r8,[r0,#64]

# qhasm: assign r10 r11 to t10 t11 = mem64[input_0 + 72]
# asm 1: ldrd >t10=int32#11,[<input_0=int32#1,#72]
# asm 2: ldrd >t10=r10,[<input_0=r0,#72]
ldrd r10,[r0,#72]

# qhasm: assign r2 r3 to k00 k01 = mem64[input_0 + 0]
# asm 1: ldrd >k00=int32#3,[<input_0=int32#1,#0]
# asm 2: ldrd >k00=r2,[<input_0=r0,#0]
ldrd r2,[r0,#0]

# qhasm: assign r4 r5 to k10 k11 = mem64[input_0 + 8]
# asm 1: ldrd >k10=int32#5,[<input_0=int32#1,#8]
# asm 2: ldrd >k10=r4,[<input_0=r0,#8]
ldrd r4,[r0,#8]

# qhasm: assign r6 r7 to k20 k21 = mem64[input_0 + 16]
# asm 1: ldrd >k20=int32#7,[<input_0=int32#1,#16]
# asm 2: ldrd >k20=r6,[<input_0=r0,#16]
ldrd r6,[r0,#16]

# qhasm: assign r2 r3 to k00 k01; k0_stack = k00 k01
# asm 1: strd <k00=int32#3,>k0_stack=stack64#1
# asm 2: strd <k00=r2,>k0_stack=[sp,#0]
strd r2,[sp,#0]

# qhasm: assign r4 r5 to k10 k11; k1_stack = k10 k11
# asm 1: strd <k10=int32#5,>k1_stack=stack64#2
# asm 2: strd <k10=r4,>k1_stack=[sp,#8]
strd r4,[sp,#8]

# qhasm: assign r6 r7 to k20 k21; k2_stack = k20 k21
# asm 1: strd <k20=int32#7,>k2_stack=stack64#3
# asm 2: strd <k20=r6,>k2_stack=[sp,#16]
strd r6,[sp,#16]

# qhasm: assign r2 r3 to k30 k31 = mem64[input_0 + 24]
# asm 1: ldrd >k30=int32#3,[<input_0=int32#1,#24]
# asm 2: ldrd >k30=r2,[<input_0=r0,#24]
ldrd r2,[r0,#24]

# qhasm: assign r4 r5 to k40 k41 = mem64[input_0 + 32]
# asm 1: ldrd >k40=int32#5,[<input_0=int32#1,#32]
# asm 2: ldrd >k40=r4,[<input_0=r0,#32]
ldrd r4,[r0,#32]

# qhasm: assign r6 r7 to k50 k51 = mem64[input_0 + 40]
# asm 1: ldrd >k50=int32#7,[<input_0=int32#1,#40]
# asm 2: ldrd >k50=r6,[<input_0=r0,#40]
ldrd r6,[r0,#40]

# qhasm: assign r2 r3 to k30 k31; k3_stack = k30 k31
# asm 1: strd <k30=int32#3,>k3_stack=stack64#4
# asm 2: strd <k30=r2,>k3_stack=[sp,#24]
strd r2,[sp,#24]

# qhasm: assign r4 r5 to k40 k41; k4_stack = k40 k41
# asm 1: strd <k40=int32#5,>k4_stack=stack64#5
# asm 2: strd <k40=r4,>k4_stack=[sp,#32]
strd r4,[sp,#32]

# qhasm: assign r6 r7 to k50 k51; k5_stack = k50 k51
# asm 1: strd <k50=int32#7,>k5_stack=stack64#6
# asm 2: strd <k50=r6,>k5_stack=[sp,#40]
strd r6,[sp,#40]

# qhasm: assign r2 r3 to k60 k61 = mem64[input_0 + 48]
# asm 1: ldrd >k60=int32#3,[<input_0=int32#1,#48]
# asm 2: ldrd >k60=r2,[<input_0=r0,#48]
ldrd r2,[r0,#48]

# qhasm: assign r4 r5 to k70 k71 = mem64[input_0 + 56]
# asm 1: ldrd >k70=int32#5,[<input_0=int32#1,#56]
# asm 2: ldrd >k70=r4,[<input_0=r0,#56]
ldrd r4,[r0,#56]

# qhasm: assign r2 r3 to k60 k61; k6_stack = k60 k61
# asm 1: strd <k60=int32#3,>k6_stack=stack64#7
# asm 2: strd <k60=r2,>k6_stack=[sp,#48]
strd r2,[sp,#48]

# qhasm: assign r4 r5 to k70 k71; k7_stack = k70 k71
# asm 1: strd <k70=int32#5,>k7_stack=stack64#8
# asm 2: strd <k70=r4,>k7_stack=[sp,#56]
strd r4,[sp,#56]

# qhasm: goto loadconst
b ._loadconst

# qhasm: mainloop:
._mainloop:

# qhasm: byteCntAdd = byteCntAdd_stack
# asm 1: ldr >byteCntAdd=int32#1,<byteCntAdd_stack=stack32#13
# asm 2: ldr >byteCntAdd=r0,<byteCntAdd_stack=[sp,#304]
ldr r0,[sp,#304]

# qhasm: assign r10 r11 to t10 t11; t1_stack = t10 t11
# asm 1: strd <t10=int32#11,>t1_stack=stack64#10
# asm 2: strd <t10=r10,>t1_stack=[sp,#72]
strd r10,[sp,#72]

# qhasm: carry? t00 += byteCntAdd
# asm 1: adds >t00=int32#9,<t00=int32#9,<byteCntAdd=int32#1
# asm 2: adds >t00=r8,<t00=r8,<byteCntAdd=r0
adds r8,r8,r0

# qhasm: t01 += 0 + carry
# asm 1: adc >t01=int32#10,<t01=int32#10,#0
# asm 2: adc >t01=r9,<t01=r9,#0
adc r9,r9,#0

# qhasm: assign r8 r9 to t00 t01; t0_stack = t00 t01
# asm 1: strd <t00=int32#9,>t0_stack=stack64#11
# asm 2: strd <t00=r8,>t0_stack=[sp,#80]
strd r8,[sp,#80]

# qhasm: t20 = t00 ^ t10
# asm 1: eor >t20=int32#9,<t00=int32#9,<t10=int32#11
# asm 2: eor >t20=r8,<t00=r8,<t10=r10
eor r8,r8,r10

# qhasm: t21 = t01 ^ t11
# asm 1: eor >t21=int32#10,<t01=int32#10,<t11=int32#12
# asm 2: eor >t21=r9,<t01=r9,<t11=r11
eor r9,r9,r11

# qhasm: assign r8 r9 to t20 t21; t2_stack = t20 t21
# asm 1: strd <t20=int32#9,>t2_stack=stack64#12
# asm 2: strd <t20=r8,>t2_stack=[sp,#88]
strd r8,[sp,#88]

# qhasm: assign r10 r11 to k80 k81 = const_stack
# asm 1: ldrd >k80=int32#11,<const_stack=stack64#9
# asm 2: ldrd >k80=r10,<const_stack=[sp,#64]
ldrd r10,[sp,#64]

# qhasm: msg = msg_stack
# asm 1: ldr >msg=int32#7,<msg_stack=stack32#11
# asm 2: ldr >msg=r6,<msg_stack=[sp,#296]
ldr r6,[sp,#296]

# qhasm: assign r8 r9 to t10 t11 = t1_stack
# asm 1: ldrd >t10=int32#9,<t1_stack=stack64#10
# asm 2: ldrd >t10=r8,<t1_stack=[sp,#72]
ldrd r8,[sp,#72]

# qhasm: assign r0 r1 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#1,<k0_stack=stack64#1
# asm 2: ldrd >k00=r0,<k0_stack=[sp,#0]
ldrd r0,[sp,#0]

# qhasm: assign r2 r3 to w00 w01 = mem64[msg + 0]
# asm 1: ldrd >w00=int32#3,[<msg=int32#7,#0]
# asm 2: ldrd >w00=r2,[<msg=r6,#0]
ldrd r2,[r6,#0]

# qhasm: k80 ^= k00
# asm 1: eor >k80=int32#8,<k80=int32#11,<k00=int32#1
# asm 2: eor >k80=r7,<k80=r10,<k00=r0
eor r7,r10,r0

# qhasm: k81 ^= k01
# asm 1: eor >k81=int32#11,<k81=int32#12,<k01=int32#2
# asm 2: eor >k81=r10,<k81=r11,<k01=r1
eor r10,r11,r1

# qhasm: carry? kt00 = k00 + t10
# asm 1: adds >kt00=int32#5,<k00=int32#1,<t10=int32#9
# asm 2: adds >kt00=r4,<k00=r0,<t10=r8
adds r4,r0,r8

# qhasm: kt01 = k01 + t11 + carry
# asm 1: adc >kt01=int32#6,<k01=int32#2,<t11=int32#10
# asm 2: adc >kt01=r5,<k01=r1,<t11=r9
adc r5,r1,r9

# qhasm: carry? k00 += w00
# asm 1: adds >k00=int32#1,<k00=int32#1,<w00=int32#3
# asm 2: adds >k00=r0,<k00=r0,<w00=r2
adds r0,r0,r2

# qhasm: k01 += w01 + carry
# asm 1: adc >k01=int32#2,<k01=int32#2,<w01=int32#4
# asm 2: adc >k01=r1,<k01=r1,<w01=r3
adc r1,r1,r3

# qhasm: assign r0 r1 to k00 k01; x0_stack = k00 k01
# asm 1: strd <k00=int32#1,>x0_stack=stack64#13
# asm 2: strd <k00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r4 r5 to kt00 kt01; kt0_stack = kt00 kt01
# asm 1: strd <kt00=int32#5,>kt0_stack=stack64#14
# asm 2: strd <kt00=r4,>kt0_stack=[sp,#104]
strd r4,[sp,#104]

# qhasm: assign r0 r1 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#1,<k3_stack=stack64#4
# asm 2: ldrd >k30=r0,<k3_stack=[sp,#24]
ldrd r0,[sp,#24]

# qhasm: assign r2 r3 to w30 w31 = mem64[msg + 24]
# asm 1: ldrd >w30=int32#3,[<msg=int32#7,#24]
# asm 2: ldrd >w30=r2,[<msg=r6,#24]
ldrd r2,[r6,#24]

# qhasm: k80 ^= k30
# asm 1: eor >k80=int32#8,<k80=int32#8,<k30=int32#1
# asm 2: eor >k80=r7,<k80=r7,<k30=r0
eor r7,r7,r0

# qhasm: k81 ^= k31
# asm 1: eor >k81=int32#11,<k81=int32#11,<k31=int32#2
# asm 2: eor >k81=r10,<k81=r10,<k31=r1
eor r10,r10,r1

# qhasm: carry? kt30 = k30 + t10
# asm 1: adds >kt30=int32#5,<k30=int32#1,<t10=int32#9
# asm 2: adds >kt30=r4,<k30=r0,<t10=r8
adds r4,r0,r8

# qhasm: kt31 = k31 + t11 + carry
# asm 1: adc >kt31=int32#6,<k31=int32#2,<t11=int32#10
# asm 2: adc >kt31=r5,<k31=r1,<t11=r9
adc r5,r1,r9

# qhasm: carry? k30 += w30
# asm 1: adds >k30=int32#1,<k30=int32#1,<w30=int32#3
# asm 2: adds >k30=r0,<k30=r0,<w30=r2
adds r0,r0,r2

# qhasm: k31 += w31 + carry
# asm 1: adc >k31=int32#2,<k31=int32#2,<w31=int32#4
# asm 2: adc >k31=r1,<k31=r1,<w31=r3
adc r1,r1,r3

# qhasm: assign r0 r1 to k30 k31; x3_stack = k30 k31
# asm 1: strd <k30=int32#1,>x3_stack=stack64#15
# asm 2: strd <k30=r0,>x3_stack=[sp,#112]
strd r0,[sp,#112]

# qhasm: assign r4 r5 to kt30 kt31; kt3_stack = kt30 kt31
# asm 1: strd <kt30=int32#5,>kt3_stack=stack64#16
# asm 2: strd <kt30=r4,>kt3_stack=[sp,#120]
strd r4,[sp,#120]

# qhasm: assign r0 r1 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#1,<k6_stack=stack64#7
# asm 2: ldrd >k60=r0,<k6_stack=[sp,#48]
ldrd r0,[sp,#48]

# qhasm: assign r2 r3 to w60 w61 = mem64[msg + 48]
# asm 1: ldrd >w60=int32#3,[<msg=int32#7,#48]
# asm 2: ldrd >w60=r2,[<msg=r6,#48]
ldrd r2,[r6,#48]

# qhasm: k80 ^= k60
# asm 1: eor >k80=int32#8,<k80=int32#8,<k60=int32#1
# asm 2: eor >k80=r7,<k80=r7,<k60=r0
eor r7,r7,r0

# qhasm: k81 ^= k61
# asm 1: eor >k81=int32#11,<k81=int32#11,<k61=int32#2
# asm 2: eor >k81=r10,<k81=r10,<k61=r1
eor r10,r10,r1

# qhasm: carry? kt60 = k60 + t10
# asm 1: adds >kt60=int32#5,<k60=int32#1,<t10=int32#9
# asm 2: adds >kt60=r4,<k60=r0,<t10=r8
adds r4,r0,r8

# qhasm: kt61 = k61 + t11 + carry
# asm 1: adc >kt61=int32#6,<k61=int32#2,<t11=int32#10
# asm 2: adc >kt61=r5,<k61=r1,<t11=r9
adc r5,r1,r9

# qhasm: carry? k60 = kt60 + w60
# asm 1: adds >k60=int32#1,<kt60=int32#5,<w60=int32#3
# asm 2: adds >k60=r0,<kt60=r4,<w60=r2
adds r0,r4,r2

# qhasm: k61 = kt61 + w61 + carry
# asm 1: adc >k61=int32#2,<kt61=int32#6,<w61=int32#4
# asm 2: adc >k61=r1,<kt61=r5,<w61=r3
adc r1,r5,r3

# qhasm: assign r0 r1 to k60 k61; x6_stack = k60 k61
# asm 1: strd <k60=int32#1,>x6_stack=stack64#17
# asm 2: strd <k60=r0,>x6_stack=[sp,#128]
strd r0,[sp,#128]

# qhasm: assign r4 r5 to kt60 kt61; kt6_stack = kt60 kt61
# asm 1: strd <kt60=int32#5,>kt6_stack=stack64#18
# asm 2: strd <kt60=r4,>kt6_stack=[sp,#136]
strd r4,[sp,#136]

# qhasm: assign r8 r9 to t20 t21 = t2_stack
# asm 1: ldrd >t20=int32#9,<t2_stack=stack64#12
# asm 2: ldrd >t20=r8,<t2_stack=[sp,#88]
ldrd r8,[sp,#88]

# qhasm: assign r0 r1 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#1,<k1_stack=stack64#2
# asm 2: ldrd >k10=r0,<k1_stack=[sp,#8]
ldrd r0,[sp,#8]

# qhasm: assign r2 r3 to w10 w11 = mem64[msg + 8]
# asm 1: ldrd >w10=int32#3,[<msg=int32#7,#8]
# asm 2: ldrd >w10=r2,[<msg=r6,#8]
ldrd r2,[r6,#8]

# qhasm: k80 ^= k10
# asm 1: eor >k80=int32#8,<k80=int32#8,<k10=int32#1
# asm 2: eor >k80=r7,<k80=r7,<k10=r0
eor r7,r7,r0

# qhasm: k81 ^= k11
# asm 1: eor >k81=int32#11,<k81=int32#11,<k11=int32#2
# asm 2: eor >k81=r10,<k81=r10,<k11=r1
eor r10,r10,r1

# qhasm: carry? kt10 = k10 + t20
# asm 1: adds >kt10=int32#5,<k10=int32#1,<t20=int32#9
# asm 2: adds >kt10=r4,<k10=r0,<t20=r8
adds r4,r0,r8

# qhasm: kt11 = k11 + t21 + carry
# asm 1: adc >kt11=int32#6,<k11=int32#2,<t21=int32#10
# asm 2: adc >kt11=r5,<k11=r1,<t21=r9
adc r5,r1,r9

# qhasm: carry? k10 += w10
# asm 1: adds >k10=int32#1,<k10=int32#1,<w10=int32#3
# asm 2: adds >k10=r0,<k10=r0,<w10=r2
adds r0,r0,r2

# qhasm: k11 += w11 + carry
# asm 1: adc >k11=int32#2,<k11=int32#2,<w11=int32#4
# asm 2: adc >k11=r1,<k11=r1,<w11=r3
adc r1,r1,r3

# qhasm: assign r0 r1 to k10 k11; x1_stack = k10 k11
# asm 1: strd <k10=int32#1,>x1_stack=stack64#12
# asm 2: strd <k10=r0,>x1_stack=[sp,#88]
strd r0,[sp,#88]

# qhasm: assign r4 r5 to kt10 kt11; kt1_stack = kt10 kt11
# asm 1: strd <kt10=int32#5,>kt1_stack=stack64#19
# asm 2: strd <kt10=r4,>kt1_stack=[sp,#144]
strd r4,[sp,#144]

# qhasm: assign r0 r1 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#1,<k4_stack=stack64#5
# asm 2: ldrd >k40=r0,<k4_stack=[sp,#32]
ldrd r0,[sp,#32]

# qhasm: assign r2 r3 to w40 w41 = mem64[msg + 32]
# asm 1: ldrd >w40=int32#3,[<msg=int32#7,#32]
# asm 2: ldrd >w40=r2,[<msg=r6,#32]
ldrd r2,[r6,#32]

# qhasm: k80 ^= k40
# asm 1: eor >k80=int32#8,<k80=int32#8,<k40=int32#1
# asm 2: eor >k80=r7,<k80=r7,<k40=r0
eor r7,r7,r0

# qhasm: k81 ^= k41
# asm 1: eor >k81=int32#11,<k81=int32#11,<k41=int32#2
# asm 2: eor >k81=r10,<k81=r10,<k41=r1
eor r10,r10,r1

# qhasm: carry? kt40 = k40 + t20
# asm 1: adds >kt40=int32#5,<k40=int32#1,<t20=int32#9
# asm 2: adds >kt40=r4,<k40=r0,<t20=r8
adds r4,r0,r8

# qhasm: kt41 = k41 + t21 + carry
# asm 1: adc >kt41=int32#6,<k41=int32#2,<t21=int32#10
# asm 2: adc >kt41=r5,<k41=r1,<t21=r9
adc r5,r1,r9

# qhasm: carry? k40 += w40
# asm 1: adds >k40=int32#1,<k40=int32#1,<w40=int32#3
# asm 2: adds >k40=r0,<k40=r0,<w40=r2
adds r0,r0,r2

# qhasm: k41 += w41 + carry
# asm 1: adc >k41=int32#2,<k41=int32#2,<w41=int32#4
# asm 2: adc >k41=r1,<k41=r1,<w41=r3
adc r1,r1,r3

# qhasm: assign r0 r1 to k40 k41; x4_stack = k40 k41
# asm 1: strd <k40=int32#1,>x4_stack=stack64#20
# asm 2: strd <k40=r0,>x4_stack=[sp,#152]
strd r0,[sp,#152]

# qhasm: assign r4 r5 to kt40 kt41; kt4_stack = kt40 kt41
# asm 1: strd <kt40=int32#5,>kt4_stack=stack64#21
# asm 2: strd <kt40=r4,>kt4_stack=[sp,#160]
strd r4,[sp,#160]

# qhasm: assign r0 r1 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#1,<k7_stack=stack64#8
# asm 2: ldrd >k70=r0,<k7_stack=[sp,#56]
ldrd r0,[sp,#56]

# qhasm: assign r2 r3 to w70 w71 = mem64[msg + 56]
# asm 1: ldrd >w70=int32#3,[<msg=int32#7,#56]
# asm 2: ldrd >w70=r2,[<msg=r6,#56]
ldrd r2,[r6,#56]

# qhasm: k80 ^= k70
# asm 1: eor >k80=int32#8,<k80=int32#8,<k70=int32#1
# asm 2: eor >k80=r7,<k80=r7,<k70=r0
eor r7,r7,r0

# qhasm: k81 ^= k71
# asm 1: eor >k81=int32#11,<k81=int32#11,<k71=int32#2
# asm 2: eor >k81=r10,<k81=r10,<k71=r1
eor r10,r10,r1

# qhasm: carry? kt70 = k70 + t20
# asm 1: adds >kt70=int32#5,<k70=int32#1,<t20=int32#9
# asm 2: adds >kt70=r4,<k70=r0,<t20=r8
adds r4,r0,r8

# qhasm: kt71 = k71 + t21 + carry
# asm 1: adc >kt71=int32#6,<k71=int32#2,<t21=int32#10
# asm 2: adc >kt71=r5,<k71=r1,<t21=r9
adc r5,r1,r9

# qhasm: carry? k70 += w70
# asm 1: adds >k70=int32#1,<k70=int32#1,<w70=int32#3
# asm 2: adds >k70=r0,<k70=r0,<w70=r2
adds r0,r0,r2

# qhasm: k71 += w71 + carry
# asm 1: adc >k71=int32#2,<k71=int32#2,<w71=int32#4
# asm 2: adc >k71=r1,<k71=r1,<w71=r3
adc r1,r1,r3

# qhasm: assign r0 r1 to k70 k71; x7_stack = k70 k71
# asm 1: strd <k70=int32#1,>x7_stack=stack64#22
# asm 2: strd <k70=r0,>x7_stack=[sp,#168]
strd r0,[sp,#168]

# qhasm: assign r4 r5 to kt70 kt71; kt7_stack = kt70 kt71
# asm 1: strd <kt70=int32#5,>kt7_stack=stack64#23
# asm 2: strd <kt70=r4,>kt7_stack=[sp,#176]
strd r4,[sp,#176]

# qhasm: assign r8 r9 to t00 t01 = t0_stack
# asm 1: ldrd >t00=int32#9,<t0_stack=stack64#11
# asm 2: ldrd >t00=r8,<t0_stack=[sp,#80]
ldrd r8,[sp,#80]

# qhasm: assign r0 r1 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#1,<k2_stack=stack64#3
# asm 2: ldrd >k20=r0,<k2_stack=[sp,#16]
ldrd r0,[sp,#16]

# qhasm: assign r2 r3 to w20 w21 = mem64[msg + 16]
# asm 1: ldrd >w20=int32#3,[<msg=int32#7,#16]
# asm 2: ldrd >w20=r2,[<msg=r6,#16]
ldrd r2,[r6,#16]

# qhasm: k80 ^= k20
# asm 1: eor >k80=int32#8,<k80=int32#8,<k20=int32#1
# asm 2: eor >k80=r7,<k80=r7,<k20=r0
eor r7,r7,r0

# qhasm: k81 ^= k21
# asm 1: eor >k81=int32#11,<k81=int32#11,<k21=int32#2
# asm 2: eor >k81=r10,<k81=r10,<k21=r1
eor r10,r10,r1

# qhasm: carry? kt20 = k20 + t00
# asm 1: adds >kt20=int32#5,<k20=int32#1,<t00=int32#9
# asm 2: adds >kt20=r4,<k20=r0,<t00=r8
adds r4,r0,r8

# qhasm: kt21 = k21 + t01 + carry
# asm 1: adc >kt21=int32#6,<k21=int32#2,<t01=int32#10
# asm 2: adc >kt21=r5,<k21=r1,<t01=r9
adc r5,r1,r9

# qhasm: carry? k20 += w20
# asm 1: adds >k20=int32#1,<k20=int32#1,<w20=int32#3
# asm 2: adds >k20=r0,<k20=r0,<w20=r2
adds r0,r0,r2

# qhasm: k21 += w21 + carry
# asm 1: adc >k21=int32#2,<k21=int32#2,<w21=int32#4
# asm 2: adc >k21=r1,<k21=r1,<w21=r3
adc r1,r1,r3

# qhasm: assign r0 r1 to k20 k21; x2_stack = k20 k21
# asm 1: strd <k20=int32#1,>x2_stack=stack64#24
# asm 2: strd <k20=r0,>x2_stack=[sp,#184]
strd r0,[sp,#184]

# qhasm: assign r4 r5 to kt20 kt21; kt2_stack = kt20 kt21
# asm 1: strd <kt20=int32#5,>kt2_stack=stack64#25
# asm 2: strd <kt20=r4,>kt2_stack=[sp,#192]
strd r4,[sp,#192]

# qhasm: assign r0 r1 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#1,<k5_stack=stack64#6
# asm 2: ldrd >k50=r0,<k5_stack=[sp,#40]
ldrd r0,[sp,#40]

# qhasm: assign r2 r3 to w50 w51 = mem64[msg + 40]
# asm 1: ldrd >w50=int32#3,[<msg=int32#7,#40]
# asm 2: ldrd >w50=r2,[<msg=r6,#40]
ldrd r2,[r6,#40]

# qhasm: k80 ^= k50
# asm 1: eor >k80=int32#7,<k80=int32#8,<k50=int32#1
# asm 2: eor >k80=r6,<k80=r7,<k50=r0
eor r6,r7,r0

# qhasm: k81 ^= k51
# asm 1: eor >k81=int32#8,<k81=int32#11,<k51=int32#2
# asm 2: eor >k81=r7,<k81=r10,<k51=r1
eor r7,r10,r1

# qhasm: carry? kt50 = k50 + t00
# asm 1: adds >kt50=int32#5,<k50=int32#1,<t00=int32#9
# asm 2: adds >kt50=r4,<k50=r0,<t00=r8
adds r4,r0,r8

# qhasm: kt51 = k51 + t01 + carry
# asm 1: adc >kt51=int32#6,<k51=int32#2,<t01=int32#10
# asm 2: adc >kt51=r5,<k51=r1,<t01=r9
adc r5,r1,r9

# qhasm: carry? k50 = kt50 + w50
# asm 1: adds >k50=int32#1,<kt50=int32#5,<w50=int32#3
# asm 2: adds >k50=r0,<kt50=r4,<w50=r2
adds r0,r4,r2

# qhasm: k51 = kt51 + w51 + carry
# asm 1: adc >k51=int32#2,<kt51=int32#6,<w51=int32#4
# asm 2: adc >k51=r1,<kt51=r5,<w51=r3
adc r1,r5,r3

# qhasm: assign r0 r1 to k50 k51; x5_stack = k50 k51
# asm 1: strd <k50=int32#1,>x5_stack=stack64#26
# asm 2: strd <k50=r0,>x5_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r4 r5 to kt50 kt51; kt5_stack = kt50 kt51
# asm 1: strd <kt50=int32#5,>kt5_stack=stack64#27
# asm 2: strd <kt50=r4,>kt5_stack=[sp,#208]
strd r4,[sp,#208]

# qhasm: carry? kt80 = k80 + t00
# asm 1: adds >kt80=int32#5,<k80=int32#7,<t00=int32#9
# asm 2: adds >kt80=r4,<k80=r6,<t00=r8
adds r4,r6,r8

# qhasm: kt81 = k81 + t01 + carry
# asm 1: adc >kt81=int32#6,<k81=int32#8,<t01=int32#10
# asm 2: adc >kt81=r5,<k81=r7,<t01=r9
adc r5,r7,r9

# qhasm: assign r8 r9 to k80 k81; k8_stack = k80 k81
# asm 1: strd <k80=int32#7,>k8_stack=stack64#28
# asm 2: strd <k80=r6,>k8_stack=[sp,#216]
strd r6,[sp,#216]

# qhasm: assign r4 r5 to kt80 kt81; kt8_stack = kt80 kt81
# asm 1: strd <kt80=int32#5,>kt8_stack=stack64#29
# asm 2: strd <kt80=r4,>kt8_stack=[sp,#224]
strd r4,[sp,#224]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#3,<x1_stack=stack64#12
# asm 2: ldrd >x10=r2,<x1_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: assign r4 r5 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#5,<x2_stack=stack64#24
# asm 2: ldrd >x20=r4,<x2_stack=[sp,#184]
ldrd r4,[sp,#184]

# qhasm: assign r6 r7 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#7,<x3_stack=stack64#15
# asm 2: ldrd >x30=r6,<x3_stack=[sp,#112]
ldrd r6,[sp,#112]

# qhasm: assign r8 r9 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#9,<x4_stack=stack64#20
# asm 2: ldrd >x40=r8,<x4_stack=[sp,#152]
ldrd r8,[sp,#152]

# qhasm: assign r10 r11 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#11,<x5_stack=stack64#26
# asm 2: ldrd >x50=r10,<x5_stack=[sp,#200]
ldrd r10,[sp,#200]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#3
# asm 2: adds >x00=r0,<x00=r0,<x10=r2
adds r0,r0,r2

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#4
# asm 2: adc >x01=r1,<x01=r1,<x11=r3
adc r1,r1,r3

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#4,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r3,LSL #14
eor r12,r0,r3,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#4,<x01=int32#2,<x11=int32#4,LSR #18
# asm 2: eor >x11=r3,<x01=r1,<x11=r3,LSR #18
eor r3,r1,r3,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#4,<x11=int32#4,<x10=int32#3,LSL #14
# asm 2: eor >x11=r3,<x11=r3,<x10=r2,LSL #14
eor r3,r3,r2,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#3,<tmp=int32#13,<x10=int32#3,LSR #18
# asm 2: eor >x10=r2,<tmp=r12,<x10=r2,LSR #18
eor r2,r12,r2,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#5,<x20=int32#5,<x30=int32#7
# asm 2: adds >x20=r4,<x20=r4,<x30=r6
adds r4,r4,r6

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#6,<x21=int32#6,<x31=int32#8
# asm 2: adc >x21=r5,<x21=r5,<x31=r7
adc r5,r5,r7

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#5,<x31=int32#8,LSL #4
# asm 2: eor >tmp=r12,<x20=r4,<x31=r7,LSL #4
eor r12,r4,r7,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#8,<x21=int32#6,<x31=int32#8,LSR #28
# asm 2: eor >x31=r7,<x21=r5,<x31=r7,LSR #28
eor r7,r5,r7,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#8,<x31=int32#8,<x30=int32#7,LSL #4
# asm 2: eor >x31=r7,<x31=r7,<x30=r6,LSL #4
eor r7,r7,r6,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#7,<tmp=int32#13,<x30=int32#7,LSR #28
# asm 2: eor >x30=r6,<tmp=r12,<x30=r6,LSR #28
eor r6,r12,r6,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#5,<x20=int32#5,<x10=int32#3
# asm 2: adds >x20=r4,<x20=r4,<x10=r2
adds r4,r4,r2

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#6,<x21=int32#6,<x11=int32#4
# asm 2: adc >x21=r5,<x21=r5,<x11=r3
adc r5,r5,r3

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#5,<x11=int32#4,LSL #1
# asm 2: eor >tmp=r12,<x20=r4,<x11=r3,LSL #1
eor r12,r4,r3,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#4,<x21=int32#6,<x11=int32#4,LSR #31
# asm 2: eor >x11=r3,<x21=r5,<x11=r3,LSR #31
eor r3,r5,r3,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#4,<x11=int32#4,<x10=int32#3,LSL #1
# asm 2: eor >x11=r3,<x11=r3,<x10=r2,LSL #1
eor r3,r3,r2,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#3,<tmp=int32#13,<x10=int32#3,LSR #31
# asm 2: eor >x10=r2,<tmp=r12,<x10=r2,LSR #31
eor r2,r12,r2,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x30=r6
adds r0,r0,r6

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x31=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#8,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r7,LSL #10
eor r12,r0,r7,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#8,<x01=int32#2,<x31=int32#8,LSR #22
# asm 2: eor >x31=r7,<x01=r1,<x31=r7,LSR #22
eor r7,r1,r7,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#8,<x31=int32#8,<x30=int32#7,LSL #10
# asm 2: eor >x31=r7,<x31=r7,<x30=r6,LSL #10
eor r7,r7,r6,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#7,<tmp=int32#13,<x30=int32#7,LSR #22
# asm 2: eor >x30=r6,<tmp=r12,<x30=r6,LSR #22
eor r6,r12,r6,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#12
# asm 2: strd <x00=r0,>x0_stack=[sp,#88]
strd r0,[sp,#88]

# qhasm: assign r4 r5 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#5,>x2_stack=stack64#13
# asm 2: strd <x20=r4,>x2_stack=[sp,#96]
strd r4,[sp,#96]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#17
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#128]
ldrd r0,[sp,#128]

# qhasm: assign r4 r5 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#5,<x7_stack=stack64#22
# asm 2: ldrd >x70=r4,<x7_stack=[sp,#168]
ldrd r4,[sp,#168]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#9,<x40=int32#9,<x50=int32#11
# asm 2: adds >x40=r8,<x40=r8,<x50=r10
adds r8,r8,r10

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#10,<x41=int32#10,<x51=int32#12
# asm 2: adc >x41=r9,<x41=r9,<x51=r11
adc r9,r9,r11

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#9,<x51=int32#12,LSR #13
# asm 2: eor >tmp=r12,<x40=r8,<x51=r11,LSR #13
eor r12,r8,r11,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#12,<x41=int32#10,<x51=int32#12,LSL #19
# asm 2: eor >x51=r11,<x41=r9,<x51=r11,LSL #19
eor r11,r9,r11,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#12,<x51=int32#12,<x50=int32#11,LSR #13
# asm 2: eor >x51=r11,<x51=r11,<x50=r10,LSR #13
eor r11,r11,r10,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#11,<tmp=int32#13,<x50=int32#11,LSL #19
# asm 2: eor >x50=r10,<tmp=r12,<x50=r10,LSL #19
eor r10,r12,r10,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x70=r4
adds r0,r0,r4

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x71=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#6,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r5,LSL #5
eor r12,r0,r5,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#6,<x61=int32#2,<x71=int32#6,LSR #27
# asm 2: eor >x71=r5,<x61=r1,<x71=r5,LSR #27
eor r5,r1,r5,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#6,<x71=int32#6,<x70=int32#5,LSL #5
# asm 2: eor >x71=r5,<x71=r5,<x70=r4,LSL #5
eor r5,r5,r4,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#5,<tmp=int32#13,<x70=int32#5,LSR #27
# asm 2: eor >x70=r4,<tmp=r12,<x70=r4,LSR #27
eor r4,r12,r4,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#9,<x40=int32#9,<x70=int32#5
# asm 2: adds >x40=r8,<x40=r8,<x70=r4
adds r8,r8,r4

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#10,<x41=int32#10,<x71=int32#6
# asm 2: adc >x41=r9,<x41=r9,<x71=r5
adc r9,r9,r5

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#9,<x71=int32#6,LSR #5
# asm 2: eor >tmp=r12,<x40=r8,<x71=r5,LSR #5
eor r12,r8,r5,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#6,<x41=int32#10,<x71=int32#6,LSL #27
# asm 2: eor >x71=r5,<x41=r9,<x71=r5,LSL #27
eor r5,r9,r5,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#6,<x71=int32#6,<x70=int32#5,LSR #5
# asm 2: eor >x71=r5,<x71=r5,<x70=r4,LSR #5
eor r5,r5,r4,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#5,<tmp=int32#13,<x70=int32#5,LSL #27
# asm 2: eor >x70=r4,<tmp=r12,<x70=r4,LSL #27
eor r4,r12,r4,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#11
# asm 2: adds >x60=r0,<x60=r0,<x50=r10
adds r0,r0,r10

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#12
# asm 2: adc >x61=r1,<x61=r1,<x51=r11
adc r1,r1,r11

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#12,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r11,LSR #18
eor r12,r0,r11,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#12,<x61=int32#2,<x51=int32#12,LSL #14
# asm 2: eor >x51=r11,<x61=r1,<x51=r11,LSL #14
eor r11,r1,r11,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#12,<x51=int32#12,<x50=int32#11,LSR #18
# asm 2: eor >x51=r11,<x51=r11,<x50=r10,LSR #18
eor r11,r11,r10,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#11,<tmp=int32#13,<x50=int32#11,LSL #14
# asm 2: eor >x50=r10,<tmp=r12,<x50=r10,LSL #14
eor r10,r12,r10,LSL #14

# qhasm: assign r10 r11 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#11,>x5_stack=stack64#15
# asm 2: strd <x50=r10,>x5_stack=[sp,#112]
strd r10,[sp,#112]

# qhasm: assign r4 r5 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#5,>x7_stack=stack64#17
# asm 2: strd <x70=r4,>x7_stack=[sp,#128]
strd r4,[sp,#128]

# qhasm: assign r4 r5 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#5,<k5_stack=stack64#6
# asm 2: ldrd >k50=r4,<k5_stack=[sp,#40]
ldrd r4,[sp,#40]

# qhasm: assign r10 r11 to kt70 kt71 = kt7_stack
# asm 1: ldrd >kt70=int32#11,<kt7_stack=stack64#23
# asm 2: ldrd >kt70=r10,<kt7_stack=[sp,#176]
ldrd r10,[sp,#176]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#9,<x40=int32#9,<x10=int32#3
# asm 2: adds >x40=r8,<x40=r8,<x10=r2
adds r8,r8,r2

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#10,<x41=int32#10,<x11=int32#4
# asm 2: adc >x41=r9,<x41=r9,<x11=r3
adc r9,r9,r3

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#9,<x11=int32#4,LSR #15
# asm 2: eor >tmp=r12,<x40=r8,<x11=r3,LSR #15
eor r12,r8,r3,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#4,<x41=int32#10,<x11=int32#4,LSL #17
# asm 2: eor >x11=r3,<x41=r9,<x11=r3,LSL #17
eor r3,r9,r3,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#4,<x11=int32#4,<x10=int32#3,LSR #15
# asm 2: eor >x11=r3,<x11=r3,<x10=r2,LSR #15
eor r3,r3,r2,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#3,<tmp=int32#13,<x10=int32#3,LSL #17
# asm 2: eor >x10=r2,<tmp=r12,<x10=r2,LSL #17
eor r2,r12,r2,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x30=r6
adds r0,r0,r6

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x31=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#8,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r7,LSL #17
eor r12,r0,r7,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#8,<x61=int32#2,<x31=int32#8,LSR #15
# asm 2: eor >x31=r7,<x61=r1,<x31=r7,LSR #15
eor r7,r1,r7,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#8,<x31=int32#8,<x30=int32#7,LSL #17
# asm 2: eor >x31=r7,<x31=r7,<x30=r6,LSL #17
eor r7,r7,r6,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#7,<tmp=int32#13,<x30=int32#7,LSR #15
# asm 2: eor >x30=r6,<tmp=r12,<x30=r6,LSR #15
eor r6,r12,r6,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x10=r2
adds r0,r0,r2

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x11=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#4,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r3,LSL #12
eor r12,r0,r3,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#4,<x61=int32#2,<x11=int32#4,LSR #20
# asm 2: eor >x11=r3,<x61=r1,<x11=r3,LSR #20
eor r3,r1,r3,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#4,<x11=int32#4,<x10=int32#3,LSL #12
# asm 2: eor >x11=r3,<x11=r3,<x10=r2,LSL #12
eor r3,r3,r2,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#3,<tmp=int32#13,<x10=int32#3,LSR #20
# asm 2: eor >x10=r2,<tmp=r12,<x10=r2,LSR #20
eor r2,r12,r2,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#9,<x40=int32#9,<x30=int32#7
# asm 2: adds >x40=r8,<x40=r8,<x30=r6
adds r8,r8,r6

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#10,<x41=int32#10,<x31=int32#8
# asm 2: adc >x41=r9,<x41=r9,<x31=r7
adc r9,r9,r7

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#9,<x31=int32#8,LSL #24
# asm 2: eor >tmp=r12,<x40=r8,<x31=r7,LSL #24
eor r12,r8,r7,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#8,<x41=int32#10,<x31=int32#8,LSR #8
# asm 2: eor >x31=r7,<x41=r9,<x31=r7,LSR #8
eor r7,r9,r7,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#8,<x31=int32#8,<x30=int32#7,LSL #24
# asm 2: eor >x31=r7,<x31=r7,<x30=r6,LSL #24
eor r7,r7,r6,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#7,<tmp=int32#13,<x30=int32#7,LSR #8
# asm 2: eor >x30=r6,<tmp=r12,<x30=r6,LSR #8
eor r6,r12,r6,LSR #8

# qhasm: carry? x40 += k50
# asm 1: adds >x40=int32#9,<x40=int32#9,<k50=int32#5
# asm 2: adds >x40=r8,<x40=r8,<k50=r4
adds r8,r8,r4

# qhasm: x41 += k51 + carry
# asm 1: adc >x41=int32#10,<x41=int32#10,<k51=int32#6
# asm 2: adc >x41=r9,<x41=r9,<k51=r5
adc r9,r9,r5

# qhasm: assign r4 r5 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#5,<k2_stack=stack64#3
# asm 2: ldrd >k20=r4,<k2_stack=[sp,#16]
ldrd r4,[sp,#16]

# qhasm: carry? x60 += kt70
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt70=int32#11
# asm 2: adds >x60=r0,<x60=r0,<kt70=r10
adds r0,r0,r10

# qhasm: x61 += kt71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt71=int32#12
# asm 2: adc >x61=r1,<x61=r1,<kt71=r11
adc r1,r1,r11

# qhasm: assign r10 r11 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#11,<k4_stack=stack64#5
# asm 2: ldrd >k40=r10,<k4_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: carry? x10 += k20
# asm 1: adds >x10=int32#3,<x10=int32#3,<k20=int32#5
# asm 2: adds >x10=r2,<x10=r2,<k20=r4
adds r2,r2,r4

# qhasm: x11 += k21 + carry
# asm 1: adc >x11=int32#4,<x11=int32#4,<k21=int32#6
# asm 2: adc >x11=r3,<x11=r3,<k21=r5
adc r3,r3,r5

# qhasm: carry? x30 += k40
# asm 1: adds >x30=int32#7,<x30=int32#7,<k40=int32#11
# asm 2: adds >x30=r6,<x30=r6,<k40=r10
adds r6,r6,r10

# qhasm: x31 += k41 + carry
# asm 1: adc >x31=int32#8,<x31=int32#8,<k41=int32#12
# asm 2: adc >x31=r7,<x31=r7,<k41=r11
adc r7,r7,r11

# qhasm: assign r2 r3 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#3,>x1_stack=stack64#20
# asm 2: strd <x10=r2,>x1_stack=[sp,#152]
strd r2,[sp,#152]

# qhasm: assign r6 r7 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#7,>x3_stack=stack64#22
# asm 2: strd <x30=r6,>x3_stack=[sp,#168]
strd r6,[sp,#168]

# qhasm: assign r8 r9 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#9,>x4_stack=stack64#24
# asm 2: strd <x40=r8,>x4_stack=[sp,#184]
strd r8,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#12
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#88]
ldrd r0,[sp,#88]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#13
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#96]
ldrd r2,[sp,#96]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#15
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#112]
ldrd r4,[sp,#112]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#9,<k1_stack=stack64#2
# asm 2: ldrd >k10=r8,<k1_stack=[sp,#8]
ldrd r8,[sp,#8]

# qhasm: assign r10 r11 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#11,<k3_stack=stack64#4
# asm 2: ldrd >k30=r10,<k3_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k10
# asm 1: adds >x00=int32#1,<x00=int32#1,<k10=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k10=r8
adds r0,r0,r8

# qhasm: x01 += k11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k11=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k11=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt60 kt61 = kt6_stack
# asm 1: ldrd >kt60=int32#9,<kt6_stack=stack64#18
# asm 2: ldrd >kt60=r8,<kt6_stack=[sp,#136]
ldrd r8,[sp,#136]

# qhasm: carry? x20 += k30
# asm 1: adds >x20=int32#3,<x20=int32#3,<k30=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k30=r10
adds r2,r2,r10

# qhasm: x21 += k31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k31=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k31=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#11,<k8_stack=stack64#28
# asm 2: ldrd >k80=r10,<k8_stack=[sp,#216]
ldrd r10,[sp,#216]

# qhasm: carry? x50 += kt60
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt60=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt60=r8
adds r4,r4,r8

# qhasm: x51 += kt61 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt61=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt61=r9
adc r5,r5,r9

# qhasm: carry? x70 += k80
# asm 1: adds >x70=int32#7,<x70=int32#7,<k80=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k80=r10
adds r6,r6,r10

# qhasm: x71 += k81 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k81=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k81=r11
adc r7,r7,r11

# qhasm: carry? x70 += 1
# asm 1: adds >x70=int32#7,<x70=int32#7,#1
# asm 2: adds >x70=r6,<x70=r6,#1
adds r6,r6,#1

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#3,<k6_stack=stack64#7
# asm 2: ldrd >k60=r2,<k6_stack=[sp,#48]
ldrd r2,[sp,#48]

# qhasm: assign r4 r5 to kt80 kt81 = kt8_stack
# asm 1: ldrd >kt80=int32#5,<kt8_stack=stack64#29
# asm 2: ldrd >kt80=r4,<kt8_stack=[sp,#224]
ldrd r4,[sp,#224]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k60
# asm 1: adds >x40=int32#11,<x40=int32#11,<k60=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k60=r2
adds r10,r10,r2

# qhasm: x41 += k61 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k61=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k61=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#3,<k3_stack=stack64#4
# asm 2: ldrd >k30=r2,<k3_stack=[sp,#24]
ldrd r2,[sp,#24]

# qhasm: carry? x60 += kt80
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt80=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt80=r4
adds r0,r0,r4

# qhasm: x61 += kt81 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt81=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt81=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#5,<k5_stack=stack64#6
# asm 2: ldrd >k50=r4,<k5_stack=[sp,#40]
ldrd r4,[sp,#40]

# qhasm: carry? x10 += k30
# asm 1: adds >x10=int32#7,<x10=int32#7,<k30=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k30=r2
adds r6,r6,r2

# qhasm: x11 += k31 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k31=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k31=r3
adc r7,r7,r3

# qhasm: carry? x30 += k50
# asm 1: adds >x30=int32#9,<x30=int32#9,<k50=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k50=r4
adds r8,r8,r4

# qhasm: x31 += k51 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k51=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k51=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#9,<k2_stack=stack64#3
# asm 2: ldrd >k20=r8,<k2_stack=[sp,#16]
ldrd r8,[sp,#16]

# qhasm: assign r10 r11 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#11,<k4_stack=stack64#5
# asm 2: ldrd >k40=r10,<k4_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k20
# asm 1: adds >x00=int32#1,<x00=int32#1,<k20=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k20=r8
adds r0,r0,r8

# qhasm: x01 += k21 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k21=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k21=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt70 kt71 = kt7_stack
# asm 1: ldrd >kt70=int32#9,<kt7_stack=stack64#23
# asm 2: ldrd >kt70=r8,<kt7_stack=[sp,#176]
ldrd r8,[sp,#176]

# qhasm: carry? x20 += k40
# asm 1: adds >x20=int32#3,<x20=int32#3,<k40=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k40=r10
adds r2,r2,r10

# qhasm: x21 += k41 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k41=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k41=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#11,<k0_stack=stack64#1
# asm 2: ldrd >k00=r10,<k0_stack=[sp,#0]
ldrd r10,[sp,#0]

# qhasm: carry? x50 += kt70
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt70=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt70=r8
adds r4,r4,r8

# qhasm: x51 += kt71 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt71=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt71=r9
adc r5,r5,r9

# qhasm: carry? x70 += k00
# asm 1: adds >x70=int32#7,<x70=int32#7,<k00=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k00=r10
adds r6,r6,r10

# qhasm: x71 += k01 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k01=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k01=r11
adc r7,r7,r11

# qhasm: carry? x70 += 2
# asm 1: adds >x70=int32#7,<x70=int32#7,#2
# asm 2: adds >x70=r6,<x70=r6,#2
adds r6,r6,#2

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#3,<k7_stack=stack64#8
# asm 2: ldrd >k70=r2,<k7_stack=[sp,#56]
ldrd r2,[sp,#56]

# qhasm: assign r4 r5 to kt00 kt01 = kt0_stack
# asm 1: ldrd >kt00=int32#5,<kt0_stack=stack64#14
# asm 2: ldrd >kt00=r4,<kt0_stack=[sp,#104]
ldrd r4,[sp,#104]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k70
# asm 1: adds >x40=int32#11,<x40=int32#11,<k70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k70=r2
adds r10,r10,r2

# qhasm: x41 += k71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k71=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#3,<k4_stack=stack64#5
# asm 2: ldrd >k40=r2,<k4_stack=[sp,#32]
ldrd r2,[sp,#32]

# qhasm: carry? x60 += kt00
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt00=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt00=r4
adds r0,r0,r4

# qhasm: x61 += kt01 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt01=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt01=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#5,<k6_stack=stack64#7
# asm 2: ldrd >k60=r4,<k6_stack=[sp,#48]
ldrd r4,[sp,#48]

# qhasm: carry? x10 += k40
# asm 1: adds >x10=int32#7,<x10=int32#7,<k40=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k40=r2
adds r6,r6,r2

# qhasm: x11 += k41 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k41=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k41=r3
adc r7,r7,r3

# qhasm: carry? x30 += k60
# asm 1: adds >x30=int32#9,<x30=int32#9,<k60=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k60=r4
adds r8,r8,r4

# qhasm: x31 += k61 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k61=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k61=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#9,<k3_stack=stack64#4
# asm 2: ldrd >k30=r8,<k3_stack=[sp,#24]
ldrd r8,[sp,#24]

# qhasm: assign r10 r11 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#11,<k5_stack=stack64#6
# asm 2: ldrd >k50=r10,<k5_stack=[sp,#40]
ldrd r10,[sp,#40]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k30
# asm 1: adds >x00=int32#1,<x00=int32#1,<k30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k30=r8
adds r0,r0,r8

# qhasm: x01 += k31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k31=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt80 kt81 = kt8_stack
# asm 1: ldrd >kt80=int32#9,<kt8_stack=stack64#29
# asm 2: ldrd >kt80=r8,<kt8_stack=[sp,#224]
ldrd r8,[sp,#224]

# qhasm: carry? x20 += k50
# asm 1: adds >x20=int32#3,<x20=int32#3,<k50=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k50=r10
adds r2,r2,r10

# qhasm: x21 += k51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k51=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k51=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#11,<k1_stack=stack64#2
# asm 2: ldrd >k10=r10,<k1_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: carry? x50 += kt80
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt80=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt80=r8
adds r4,r4,r8

# qhasm: x51 += kt81 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt81=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt81=r9
adc r5,r5,r9

# qhasm: carry? x70 += k10
# asm 1: adds >x70=int32#7,<x70=int32#7,<k10=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k10=r10
adds r6,r6,r10

# qhasm: x71 += k11 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k11=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k11=r11
adc r7,r7,r11

# qhasm: carry? x70 += 3
# asm 1: adds >x70=int32#7,<x70=int32#7,#3
# asm 2: adds >x70=r6,<x70=r6,#3
adds r6,r6,#3

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#3,<k8_stack=stack64#28
# asm 2: ldrd >k80=r2,<k8_stack=[sp,#216]
ldrd r2,[sp,#216]

# qhasm: assign r4 r5 to kt10 kt11 = kt1_stack
# asm 1: ldrd >kt10=int32#5,<kt1_stack=stack64#19
# asm 2: ldrd >kt10=r4,<kt1_stack=[sp,#144]
ldrd r4,[sp,#144]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k80
# asm 1: adds >x40=int32#11,<x40=int32#11,<k80=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k80=r2
adds r10,r10,r2

# qhasm: x41 += k81 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k81=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k81=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#3,<k5_stack=stack64#6
# asm 2: ldrd >k50=r2,<k5_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: carry? x60 += kt10
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt10=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt10=r4
adds r0,r0,r4

# qhasm: x61 += kt11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt11=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt11=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#5,<k7_stack=stack64#8
# asm 2: ldrd >k70=r4,<k7_stack=[sp,#56]
ldrd r4,[sp,#56]

# qhasm: carry? x10 += k50
# asm 1: adds >x10=int32#7,<x10=int32#7,<k50=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k50=r2
adds r6,r6,r2

# qhasm: x11 += k51 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k51=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k51=r3
adc r7,r7,r3

# qhasm: carry? x30 += k70
# asm 1: adds >x30=int32#9,<x30=int32#9,<k70=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k70=r4
adds r8,r8,r4

# qhasm: x31 += k71 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k71=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k71=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#9,<k4_stack=stack64#5
# asm 2: ldrd >k40=r8,<k4_stack=[sp,#32]
ldrd r8,[sp,#32]

# qhasm: assign r10 r11 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#11,<k6_stack=stack64#7
# asm 2: ldrd >k60=r10,<k6_stack=[sp,#48]
ldrd r10,[sp,#48]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k40
# asm 1: adds >x00=int32#1,<x00=int32#1,<k40=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k40=r8
adds r0,r0,r8

# qhasm: x01 += k41 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k41=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k41=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt00 kt01 = kt0_stack
# asm 1: ldrd >kt00=int32#9,<kt0_stack=stack64#14
# asm 2: ldrd >kt00=r8,<kt0_stack=[sp,#104]
ldrd r8,[sp,#104]

# qhasm: carry? x20 += k60
# asm 1: adds >x20=int32#3,<x20=int32#3,<k60=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k60=r10
adds r2,r2,r10

# qhasm: x21 += k61 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k61=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k61=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#11,<k2_stack=stack64#3
# asm 2: ldrd >k20=r10,<k2_stack=[sp,#16]
ldrd r10,[sp,#16]

# qhasm: carry? x50 += kt00
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt00=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt00=r8
adds r4,r4,r8

# qhasm: x51 += kt01 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt01=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt01=r9
adc r5,r5,r9

# qhasm: carry? x70 += k20
# asm 1: adds >x70=int32#7,<x70=int32#7,<k20=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k20=r10
adds r6,r6,r10

# qhasm: x71 += k21 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k21=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k21=r11
adc r7,r7,r11

# qhasm: carry? x70 += 4
# asm 1: adds >x70=int32#7,<x70=int32#7,#4
# asm 2: adds >x70=r6,<x70=r6,#4
adds r6,r6,#4

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#3,<k0_stack=stack64#1
# asm 2: ldrd >k00=r2,<k0_stack=[sp,#0]
ldrd r2,[sp,#0]

# qhasm: assign r4 r5 to kt20 kt21 = kt2_stack
# asm 1: ldrd >kt20=int32#5,<kt2_stack=stack64#25
# asm 2: ldrd >kt20=r4,<kt2_stack=[sp,#192]
ldrd r4,[sp,#192]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k00
# asm 1: adds >x40=int32#11,<x40=int32#11,<k00=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k00=r2
adds r10,r10,r2

# qhasm: x41 += k01 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k01=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k01=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#3,<k6_stack=stack64#7
# asm 2: ldrd >k60=r2,<k6_stack=[sp,#48]
ldrd r2,[sp,#48]

# qhasm: carry? x60 += kt20
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt20=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt20=r4
adds r0,r0,r4

# qhasm: x61 += kt21 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt21=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt21=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#5,<k8_stack=stack64#28
# asm 2: ldrd >k80=r4,<k8_stack=[sp,#216]
ldrd r4,[sp,#216]

# qhasm: carry? x10 += k60
# asm 1: adds >x10=int32#7,<x10=int32#7,<k60=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k60=r2
adds r6,r6,r2

# qhasm: x11 += k61 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k61=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k61=r3
adc r7,r7,r3

# qhasm: carry? x30 += k80
# asm 1: adds >x30=int32#9,<x30=int32#9,<k80=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k80=r4
adds r8,r8,r4

# qhasm: x31 += k81 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k81=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k81=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#9,<k5_stack=stack64#6
# asm 2: ldrd >k50=r8,<k5_stack=[sp,#40]
ldrd r8,[sp,#40]

# qhasm: assign r10 r11 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#11,<k7_stack=stack64#8
# asm 2: ldrd >k70=r10,<k7_stack=[sp,#56]
ldrd r10,[sp,#56]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k50
# asm 1: adds >x00=int32#1,<x00=int32#1,<k50=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k50=r8
adds r0,r0,r8

# qhasm: x01 += k51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k51=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k51=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt10 kt11 = kt1_stack
# asm 1: ldrd >kt10=int32#9,<kt1_stack=stack64#19
# asm 2: ldrd >kt10=r8,<kt1_stack=[sp,#144]
ldrd r8,[sp,#144]

# qhasm: carry? x20 += k70
# asm 1: adds >x20=int32#3,<x20=int32#3,<k70=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k70=r10
adds r2,r2,r10

# qhasm: x21 += k71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k71=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k71=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#11,<k3_stack=stack64#4
# asm 2: ldrd >k30=r10,<k3_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: carry? x50 += kt10
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt10=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt10=r8
adds r4,r4,r8

# qhasm: x51 += kt11 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt11=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt11=r9
adc r5,r5,r9

# qhasm: carry? x70 += k30
# asm 1: adds >x70=int32#7,<x70=int32#7,<k30=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k30=r10
adds r6,r6,r10

# qhasm: x71 += k31 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k31=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k31=r11
adc r7,r7,r11

# qhasm: carry? x70 += 5
# asm 1: adds >x70=int32#7,<x70=int32#7,#5
# asm 2: adds >x70=r6,<x70=r6,#5
adds r6,r6,#5

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#3,<k1_stack=stack64#2
# asm 2: ldrd >k10=r2,<k1_stack=[sp,#8]
ldrd r2,[sp,#8]

# qhasm: assign r4 r5 to kt30 kt31 = kt3_stack
# asm 1: ldrd >kt30=int32#5,<kt3_stack=stack64#16
# asm 2: ldrd >kt30=r4,<kt3_stack=[sp,#120]
ldrd r4,[sp,#120]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k10
# asm 1: adds >x40=int32#11,<x40=int32#11,<k10=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k10=r2
adds r10,r10,r2

# qhasm: x41 += k11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k11=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k11=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#3,<k7_stack=stack64#8
# asm 2: ldrd >k70=r2,<k7_stack=[sp,#56]
ldrd r2,[sp,#56]

# qhasm: carry? x60 += kt30
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt30=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt30=r4
adds r0,r0,r4

# qhasm: x61 += kt31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt31=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt31=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#5,<k0_stack=stack64#1
# asm 2: ldrd >k00=r4,<k0_stack=[sp,#0]
ldrd r4,[sp,#0]

# qhasm: carry? x10 += k70
# asm 1: adds >x10=int32#7,<x10=int32#7,<k70=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k70=r2
adds r6,r6,r2

# qhasm: x11 += k71 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k71=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k71=r3
adc r7,r7,r3

# qhasm: carry? x30 += k00
# asm 1: adds >x30=int32#9,<x30=int32#9,<k00=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k00=r4
adds r8,r8,r4

# qhasm: x31 += k01 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k01=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k01=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#9,<k6_stack=stack64#7
# asm 2: ldrd >k60=r8,<k6_stack=[sp,#48]
ldrd r8,[sp,#48]

# qhasm: assign r10 r11 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#11,<k8_stack=stack64#28
# asm 2: ldrd >k80=r10,<k8_stack=[sp,#216]
ldrd r10,[sp,#216]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k60
# asm 1: adds >x00=int32#1,<x00=int32#1,<k60=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k60=r8
adds r0,r0,r8

# qhasm: x01 += k61 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k61=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k61=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt20 kt21 = kt2_stack
# asm 1: ldrd >kt20=int32#9,<kt2_stack=stack64#25
# asm 2: ldrd >kt20=r8,<kt2_stack=[sp,#192]
ldrd r8,[sp,#192]

# qhasm: carry? x20 += k80
# asm 1: adds >x20=int32#3,<x20=int32#3,<k80=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k80=r10
adds r2,r2,r10

# qhasm: x21 += k81 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k81=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k81=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#11,<k4_stack=stack64#5
# asm 2: ldrd >k40=r10,<k4_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: carry? x50 += kt20
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt20=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt20=r8
adds r4,r4,r8

# qhasm: x51 += kt21 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt21=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt21=r9
adc r5,r5,r9

# qhasm: carry? x70 += k40
# asm 1: adds >x70=int32#7,<x70=int32#7,<k40=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k40=r10
adds r6,r6,r10

# qhasm: x71 += k41 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k41=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k41=r11
adc r7,r7,r11

# qhasm: carry? x70 += 6
# asm 1: adds >x70=int32#7,<x70=int32#7,#6
# asm 2: adds >x70=r6,<x70=r6,#6
adds r6,r6,#6

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#3,<k2_stack=stack64#3
# asm 2: ldrd >k20=r2,<k2_stack=[sp,#16]
ldrd r2,[sp,#16]

# qhasm: assign r4 r5 to kt40 kt41 = kt4_stack
# asm 1: ldrd >kt40=int32#5,<kt4_stack=stack64#21
# asm 2: ldrd >kt40=r4,<kt4_stack=[sp,#160]
ldrd r4,[sp,#160]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k20
# asm 1: adds >x40=int32#11,<x40=int32#11,<k20=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k20=r2
adds r10,r10,r2

# qhasm: x41 += k21 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k21=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k21=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#3,<k8_stack=stack64#28
# asm 2: ldrd >k80=r2,<k8_stack=[sp,#216]
ldrd r2,[sp,#216]

# qhasm: carry? x60 += kt40
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt40=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt40=r4
adds r0,r0,r4

# qhasm: x61 += kt41 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt41=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt41=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#5,<k1_stack=stack64#2
# asm 2: ldrd >k10=r4,<k1_stack=[sp,#8]
ldrd r4,[sp,#8]

# qhasm: carry? x10 += k80
# asm 1: adds >x10=int32#7,<x10=int32#7,<k80=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k80=r2
adds r6,r6,r2

# qhasm: x11 += k81 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k81=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k81=r3
adc r7,r7,r3

# qhasm: carry? x30 += k10
# asm 1: adds >x30=int32#9,<x30=int32#9,<k10=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k10=r4
adds r8,r8,r4

# qhasm: x31 += k11 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k11=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k11=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#9,<k7_stack=stack64#8
# asm 2: ldrd >k70=r8,<k7_stack=[sp,#56]
ldrd r8,[sp,#56]

# qhasm: assign r10 r11 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#11,<k0_stack=stack64#1
# asm 2: ldrd >k00=r10,<k0_stack=[sp,#0]
ldrd r10,[sp,#0]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k70
# asm 1: adds >x00=int32#1,<x00=int32#1,<k70=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k70=r8
adds r0,r0,r8

# qhasm: x01 += k71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k71=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k71=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt30 kt31 = kt3_stack
# asm 1: ldrd >kt30=int32#9,<kt3_stack=stack64#16
# asm 2: ldrd >kt30=r8,<kt3_stack=[sp,#120]
ldrd r8,[sp,#120]

# qhasm: carry? x20 += k00
# asm 1: adds >x20=int32#3,<x20=int32#3,<k00=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k00=r10
adds r2,r2,r10

# qhasm: x21 += k01 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k01=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k01=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#11,<k5_stack=stack64#6
# asm 2: ldrd >k50=r10,<k5_stack=[sp,#40]
ldrd r10,[sp,#40]

# qhasm: carry? x50 += kt30
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt30=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt30=r8
adds r4,r4,r8

# qhasm: x51 += kt31 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt31=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt31=r9
adc r5,r5,r9

# qhasm: carry? x70 += k50
# asm 1: adds >x70=int32#7,<x70=int32#7,<k50=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k50=r10
adds r6,r6,r10

# qhasm: x71 += k51 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k51=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k51=r11
adc r7,r7,r11

# qhasm: carry? x70 += 7
# asm 1: adds >x70=int32#7,<x70=int32#7,#7
# asm 2: adds >x70=r6,<x70=r6,#7
adds r6,r6,#7

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#3,<k3_stack=stack64#4
# asm 2: ldrd >k30=r2,<k3_stack=[sp,#24]
ldrd r2,[sp,#24]

# qhasm: assign r4 r5 to kt50 kt51 = kt5_stack
# asm 1: ldrd >kt50=int32#5,<kt5_stack=stack64#27
# asm 2: ldrd >kt50=r4,<kt5_stack=[sp,#208]
ldrd r4,[sp,#208]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k30
# asm 1: adds >x40=int32#11,<x40=int32#11,<k30=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k30=r2
adds r10,r10,r2

# qhasm: x41 += k31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k31=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k31=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#3,<k0_stack=stack64#1
# asm 2: ldrd >k00=r2,<k0_stack=[sp,#0]
ldrd r2,[sp,#0]

# qhasm: carry? x60 += kt50
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt50=r4
adds r0,r0,r4

# qhasm: x61 += kt51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt51=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#5,<k2_stack=stack64#3
# asm 2: ldrd >k20=r4,<k2_stack=[sp,#16]
ldrd r4,[sp,#16]

# qhasm: carry? x10 += k00
# asm 1: adds >x10=int32#7,<x10=int32#7,<k00=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k00=r2
adds r6,r6,r2

# qhasm: x11 += k01 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k01=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k01=r3
adc r7,r7,r3

# qhasm: carry? x30 += k20
# asm 1: adds >x30=int32#9,<x30=int32#9,<k20=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k20=r4
adds r8,r8,r4

# qhasm: x31 += k21 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k21=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k21=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#9,<k8_stack=stack64#28
# asm 2: ldrd >k80=r8,<k8_stack=[sp,#216]
ldrd r8,[sp,#216]

# qhasm: assign r10 r11 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#11,<k1_stack=stack64#2
# asm 2: ldrd >k10=r10,<k1_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k80
# asm 1: adds >x00=int32#1,<x00=int32#1,<k80=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k80=r8
adds r0,r0,r8

# qhasm: x01 += k81 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k81=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k81=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt40 kt41 = kt4_stack
# asm 1: ldrd >kt40=int32#9,<kt4_stack=stack64#21
# asm 2: ldrd >kt40=r8,<kt4_stack=[sp,#160]
ldrd r8,[sp,#160]

# qhasm: carry? x20 += k10
# asm 1: adds >x20=int32#3,<x20=int32#3,<k10=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k10=r10
adds r2,r2,r10

# qhasm: x21 += k11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k11=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k11=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#11,<k6_stack=stack64#7
# asm 2: ldrd >k60=r10,<k6_stack=[sp,#48]
ldrd r10,[sp,#48]

# qhasm: carry? x50 += kt40
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt40=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt40=r8
adds r4,r4,r8

# qhasm: x51 += kt41 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt41=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt41=r9
adc r5,r5,r9

# qhasm: carry? x70 += k60
# asm 1: adds >x70=int32#7,<x70=int32#7,<k60=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k60=r10
adds r6,r6,r10

# qhasm: x71 += k61 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k61=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k61=r11
adc r7,r7,r11

# qhasm: carry? x70 += 8
# asm 1: adds >x70=int32#7,<x70=int32#7,#8
# asm 2: adds >x70=r6,<x70=r6,#8
adds r6,r6,#8

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#3,<k4_stack=stack64#5
# asm 2: ldrd >k40=r2,<k4_stack=[sp,#32]
ldrd r2,[sp,#32]

# qhasm: assign r4 r5 to kt60 kt61 = kt6_stack
# asm 1: ldrd >kt60=int32#5,<kt6_stack=stack64#18
# asm 2: ldrd >kt60=r4,<kt6_stack=[sp,#136]
ldrd r4,[sp,#136]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k40
# asm 1: adds >x40=int32#11,<x40=int32#11,<k40=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k40=r2
adds r10,r10,r2

# qhasm: x41 += k41 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k41=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k41=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#3,<k1_stack=stack64#2
# asm 2: ldrd >k10=r2,<k1_stack=[sp,#8]
ldrd r2,[sp,#8]

# qhasm: carry? x60 += kt60
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt60=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt60=r4
adds r0,r0,r4

# qhasm: x61 += kt61 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt61=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt61=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#5,<k3_stack=stack64#4
# asm 2: ldrd >k30=r4,<k3_stack=[sp,#24]
ldrd r4,[sp,#24]

# qhasm: carry? x10 += k10
# asm 1: adds >x10=int32#7,<x10=int32#7,<k10=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k10=r2
adds r6,r6,r2

# qhasm: x11 += k11 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k11=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k11=r3
adc r7,r7,r3

# qhasm: carry? x30 += k30
# asm 1: adds >x30=int32#9,<x30=int32#9,<k30=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k30=r4
adds r8,r8,r4

# qhasm: x31 += k31 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k31=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k31=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#9,<k0_stack=stack64#1
# asm 2: ldrd >k00=r8,<k0_stack=[sp,#0]
ldrd r8,[sp,#0]

# qhasm: assign r10 r11 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#11,<k2_stack=stack64#3
# asm 2: ldrd >k20=r10,<k2_stack=[sp,#16]
ldrd r10,[sp,#16]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k00
# asm 1: adds >x00=int32#1,<x00=int32#1,<k00=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k00=r8
adds r0,r0,r8

# qhasm: x01 += k01 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k01=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k01=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt50 kt51 = kt5_stack
# asm 1: ldrd >kt50=int32#9,<kt5_stack=stack64#27
# asm 2: ldrd >kt50=r8,<kt5_stack=[sp,#208]
ldrd r8,[sp,#208]

# qhasm: carry? x20 += k20
# asm 1: adds >x20=int32#3,<x20=int32#3,<k20=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k20=r10
adds r2,r2,r10

# qhasm: x21 += k21 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k21=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k21=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#11,<k7_stack=stack64#8
# asm 2: ldrd >k70=r10,<k7_stack=[sp,#56]
ldrd r10,[sp,#56]

# qhasm: carry? x50 += kt50
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt50=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt50=r8
adds r4,r4,r8

# qhasm: x51 += kt51 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt51=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt51=r9
adc r5,r5,r9

# qhasm: carry? x70 += k70
# asm 1: adds >x70=int32#7,<x70=int32#7,<k70=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k70=r10
adds r6,r6,r10

# qhasm: x71 += k71 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k71=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k71=r11
adc r7,r7,r11

# qhasm: carry? x70 += 9
# asm 1: adds >x70=int32#7,<x70=int32#7,#9
# asm 2: adds >x70=r6,<x70=r6,#9
adds r6,r6,#9

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#3,<k5_stack=stack64#6
# asm 2: ldrd >k50=r2,<k5_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: assign r4 r5 to kt70 kt71 = kt7_stack
# asm 1: ldrd >kt70=int32#5,<kt7_stack=stack64#23
# asm 2: ldrd >kt70=r4,<kt7_stack=[sp,#176]
ldrd r4,[sp,#176]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k50
# asm 1: adds >x40=int32#11,<x40=int32#11,<k50=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k50=r2
adds r10,r10,r2

# qhasm: x41 += k51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k51=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k51=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#3,<k2_stack=stack64#3
# asm 2: ldrd >k20=r2,<k2_stack=[sp,#16]
ldrd r2,[sp,#16]

# qhasm: carry? x60 += kt70
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt70=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt70=r4
adds r0,r0,r4

# qhasm: x61 += kt71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt71=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt71=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#5,<k4_stack=stack64#5
# asm 2: ldrd >k40=r4,<k4_stack=[sp,#32]
ldrd r4,[sp,#32]

# qhasm: carry? x10 += k20
# asm 1: adds >x10=int32#7,<x10=int32#7,<k20=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k20=r2
adds r6,r6,r2

# qhasm: x11 += k21 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k21=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k21=r3
adc r7,r7,r3

# qhasm: carry? x30 += k40
# asm 1: adds >x30=int32#9,<x30=int32#9,<k40=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k40=r4
adds r8,r8,r4

# qhasm: x31 += k41 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k41=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k41=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#9,<k1_stack=stack64#2
# asm 2: ldrd >k10=r8,<k1_stack=[sp,#8]
ldrd r8,[sp,#8]

# qhasm: assign r10 r11 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#11,<k3_stack=stack64#4
# asm 2: ldrd >k30=r10,<k3_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k10
# asm 1: adds >x00=int32#1,<x00=int32#1,<k10=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k10=r8
adds r0,r0,r8

# qhasm: x01 += k11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k11=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k11=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt60 kt61 = kt6_stack
# asm 1: ldrd >kt60=int32#9,<kt6_stack=stack64#18
# asm 2: ldrd >kt60=r8,<kt6_stack=[sp,#136]
ldrd r8,[sp,#136]

# qhasm: carry? x20 += k30
# asm 1: adds >x20=int32#3,<x20=int32#3,<k30=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k30=r10
adds r2,r2,r10

# qhasm: x21 += k31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k31=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k31=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#11,<k8_stack=stack64#28
# asm 2: ldrd >k80=r10,<k8_stack=[sp,#216]
ldrd r10,[sp,#216]

# qhasm: carry? x50 += kt60
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt60=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt60=r8
adds r4,r4,r8

# qhasm: x51 += kt61 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt61=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt61=r9
adc r5,r5,r9

# qhasm: carry? x70 += k80
# asm 1: adds >x70=int32#7,<x70=int32#7,<k80=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k80=r10
adds r6,r6,r10

# qhasm: x71 += k81 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k81=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k81=r11
adc r7,r7,r11

# qhasm: carry? x70 += 10
# asm 1: adds >x70=int32#7,<x70=int32#7,#10
# asm 2: adds >x70=r6,<x70=r6,#10
adds r6,r6,#10

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#3,<k6_stack=stack64#7
# asm 2: ldrd >k60=r2,<k6_stack=[sp,#48]
ldrd r2,[sp,#48]

# qhasm: assign r4 r5 to kt80 kt81 = kt8_stack
# asm 1: ldrd >kt80=int32#5,<kt8_stack=stack64#29
# asm 2: ldrd >kt80=r4,<kt8_stack=[sp,#224]
ldrd r4,[sp,#224]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k60
# asm 1: adds >x40=int32#11,<x40=int32#11,<k60=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k60=r2
adds r10,r10,r2

# qhasm: x41 += k61 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k61=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k61=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#3,<k3_stack=stack64#4
# asm 2: ldrd >k30=r2,<k3_stack=[sp,#24]
ldrd r2,[sp,#24]

# qhasm: carry? x60 += kt80
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt80=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt80=r4
adds r0,r0,r4

# qhasm: x61 += kt81 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt81=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt81=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#5,<k5_stack=stack64#6
# asm 2: ldrd >k50=r4,<k5_stack=[sp,#40]
ldrd r4,[sp,#40]

# qhasm: carry? x10 += k30
# asm 1: adds >x10=int32#7,<x10=int32#7,<k30=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k30=r2
adds r6,r6,r2

# qhasm: x11 += k31 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k31=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k31=r3
adc r7,r7,r3

# qhasm: carry? x30 += k50
# asm 1: adds >x30=int32#9,<x30=int32#9,<k50=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k50=r4
adds r8,r8,r4

# qhasm: x31 += k51 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k51=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k51=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#24
# asm 2: strd <x40=r10,>x4_stack=[sp,#184]
strd r10,[sp,#184]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#26
# asm 2: strd <x60=r0,>x6_stack=[sp,#200]
strd r0,[sp,#200]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#9,<k2_stack=stack64#3
# asm 2: ldrd >k20=r8,<k2_stack=[sp,#16]
ldrd r8,[sp,#16]

# qhasm: assign r10 r11 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#11,<k4_stack=stack64#5
# asm 2: ldrd >k40=r10,<k4_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k20
# asm 1: adds >x00=int32#1,<x00=int32#1,<k20=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k20=r8
adds r0,r0,r8

# qhasm: x01 += k21 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k21=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k21=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt70 kt71 = kt7_stack
# asm 1: ldrd >kt70=int32#9,<kt7_stack=stack64#23
# asm 2: ldrd >kt70=r8,<kt7_stack=[sp,#176]
ldrd r8,[sp,#176]

# qhasm: carry? x20 += k40
# asm 1: adds >x20=int32#3,<x20=int32#3,<k40=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k40=r10
adds r2,r2,r10

# qhasm: x21 += k41 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k41=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k41=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#11,<k0_stack=stack64#1
# asm 2: ldrd >k00=r10,<k0_stack=[sp,#0]
ldrd r10,[sp,#0]

# qhasm: carry? x50 += kt70
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt70=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt70=r8
adds r4,r4,r8

# qhasm: x51 += kt71 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt71=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt71=r9
adc r5,r5,r9

# qhasm: carry? x70 += k00
# asm 1: adds >x70=int32#7,<x70=int32#7,<k00=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k00=r10
adds r6,r6,r10

# qhasm: x71 += k01 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k01=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k01=r11
adc r7,r7,r11

# qhasm: carry? x70 += 11
# asm 1: adds >x70=int32#7,<x70=int32#7,#11
# asm 2: adds >x70=r6,<x70=r6,#11
adds r6,r6,#11

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#24
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#184]
ldrd r10,[sp,#184]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#26
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#200]
ldrd r0,[sp,#200]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#3,<k7_stack=stack64#8
# asm 2: ldrd >k70=r2,<k7_stack=[sp,#56]
ldrd r2,[sp,#56]

# qhasm: assign r4 r5 to kt00 kt01 = kt0_stack
# asm 1: ldrd >kt00=int32#5,<kt0_stack=stack64#14
# asm 2: ldrd >kt00=r4,<kt0_stack=[sp,#104]
ldrd r4,[sp,#104]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k70
# asm 1: adds >x40=int32#11,<x40=int32#11,<k70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k70=r2
adds r10,r10,r2

# qhasm: x41 += k71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k71=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#3,<k4_stack=stack64#5
# asm 2: ldrd >k40=r2,<k4_stack=[sp,#32]
ldrd r2,[sp,#32]

# qhasm: carry? x60 += kt00
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt00=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt00=r4
adds r0,r0,r4

# qhasm: x61 += kt01 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt01=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt01=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#5,<k6_stack=stack64#7
# asm 2: ldrd >k60=r4,<k6_stack=[sp,#48]
ldrd r4,[sp,#48]

# qhasm: carry? x10 += k40
# asm 1: adds >x10=int32#7,<x10=int32#7,<k40=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k40=r2
adds r6,r6,r2

# qhasm: x11 += k41 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k41=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k41=r3
adc r7,r7,r3

# qhasm: carry? x30 += k60
# asm 1: adds >x30=int32#9,<x30=int32#9,<k60=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k60=r4
adds r8,r8,r4

# qhasm: x31 += k61 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k61=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k61=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#23
# asm 2: strd <x40=r10,>x4_stack=[sp,#176]
strd r10,[sp,#176]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#24
# asm 2: strd <x60=r0,>x6_stack=[sp,#184]
strd r0,[sp,#184]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#9,<k3_stack=stack64#4
# asm 2: ldrd >k30=r8,<k3_stack=[sp,#24]
ldrd r8,[sp,#24]

# qhasm: assign r10 r11 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#11,<k5_stack=stack64#6
# asm 2: ldrd >k50=r10,<k5_stack=[sp,#40]
ldrd r10,[sp,#40]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k30
# asm 1: adds >x00=int32#1,<x00=int32#1,<k30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k30=r8
adds r0,r0,r8

# qhasm: x01 += k31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k31=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt80 kt81 = kt8_stack
# asm 1: ldrd >kt80=int32#9,<kt8_stack=stack64#29
# asm 2: ldrd >kt80=r8,<kt8_stack=[sp,#224]
ldrd r8,[sp,#224]

# qhasm: carry? x20 += k50
# asm 1: adds >x20=int32#3,<x20=int32#3,<k50=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k50=r10
adds r2,r2,r10

# qhasm: x21 += k51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k51=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k51=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#11,<k1_stack=stack64#2
# asm 2: ldrd >k10=r10,<k1_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: carry? x50 += kt80
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt80=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt80=r8
adds r4,r4,r8

# qhasm: x51 += kt81 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt81=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt81=r9
adc r5,r5,r9

# qhasm: carry? x70 += k10
# asm 1: adds >x70=int32#7,<x70=int32#7,<k10=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k10=r10
adds r6,r6,r10

# qhasm: x71 += k11 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k11=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k11=r11
adc r7,r7,r11

# qhasm: carry? x70 += 12
# asm 1: adds >x70=int32#7,<x70=int32#7,#12
# asm 2: adds >x70=r6,<x70=r6,#12
adds r6,r6,#12

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#23
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#176]
ldrd r10,[sp,#176]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#15
# asm 2: strd <x20=r2,>x2_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#24
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#184]
ldrd r0,[sp,#184]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#17
# asm 2: strd <x70=r2,>x7_stack=[sp,#128]
strd r2,[sp,#128]

# qhasm: assign r2 r3 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#3,<k8_stack=stack64#28
# asm 2: ldrd >k80=r2,<k8_stack=[sp,#216]
ldrd r2,[sp,#216]

# qhasm: assign r4 r5 to kt10 kt11 = kt1_stack
# asm 1: ldrd >kt10=int32#5,<kt1_stack=stack64#19
# asm 2: ldrd >kt10=r4,<kt1_stack=[sp,#144]
ldrd r4,[sp,#144]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k80
# asm 1: adds >x40=int32#11,<x40=int32#11,<k80=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k80=r2
adds r10,r10,r2

# qhasm: x41 += k81 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k81=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k81=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#3,<k5_stack=stack64#6
# asm 2: ldrd >k50=r2,<k5_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: carry? x60 += kt10
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt10=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt10=r4
adds r0,r0,r4

# qhasm: x61 += kt11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt11=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt11=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#5,<k7_stack=stack64#8
# asm 2: ldrd >k70=r4,<k7_stack=[sp,#56]
ldrd r4,[sp,#56]

# qhasm: carry? x10 += k50
# asm 1: adds >x10=int32#7,<x10=int32#7,<k50=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k50=r2
adds r6,r6,r2

# qhasm: x11 += k51 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k51=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k51=r3
adc r7,r7,r3

# qhasm: carry? x30 += k70
# asm 1: adds >x30=int32#9,<x30=int32#9,<k70=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k70=r4
adds r8,r8,r4

# qhasm: x31 += k71 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k71=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k71=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#20
# asm 2: strd <x10=r6,>x1_stack=[sp,#152]
strd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#22
# asm 2: strd <x30=r8,>x3_stack=[sp,#168]
strd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#23
# asm 2: strd <x40=r10,>x4_stack=[sp,#176]
strd r10,[sp,#176]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#24
# asm 2: strd <x60=r0,>x6_stack=[sp,#184]
strd r0,[sp,#184]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#15
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#112]
ldrd r2,[sp,#112]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#17
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#9,<k4_stack=stack64#5
# asm 2: ldrd >k40=r8,<k4_stack=[sp,#32]
ldrd r8,[sp,#32]

# qhasm: assign r10 r11 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#11,<k6_stack=stack64#7
# asm 2: ldrd >k60=r10,<k6_stack=[sp,#48]
ldrd r10,[sp,#48]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k40
# asm 1: adds >x00=int32#1,<x00=int32#1,<k40=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k40=r8
adds r0,r0,r8

# qhasm: x01 += k41 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k41=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k41=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt00 kt01 = kt0_stack
# asm 1: ldrd >kt00=int32#9,<kt0_stack=stack64#14
# asm 2: ldrd >kt00=r8,<kt0_stack=[sp,#104]
ldrd r8,[sp,#104]

# qhasm: carry? x20 += k60
# asm 1: adds >x20=int32#3,<x20=int32#3,<k60=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k60=r10
adds r2,r2,r10

# qhasm: x21 += k61 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k61=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k61=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#11,<k2_stack=stack64#3
# asm 2: ldrd >k20=r10,<k2_stack=[sp,#16]
ldrd r10,[sp,#16]

# qhasm: carry? x50 += kt00
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt00=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt00=r8
adds r4,r4,r8

# qhasm: x51 += kt01 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt01=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt01=r9
adc r5,r5,r9

# qhasm: carry? x70 += k20
# asm 1: adds >x70=int32#7,<x70=int32#7,<k20=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k20=r10
adds r6,r6,r10

# qhasm: x71 += k21 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k21=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k21=r11
adc r7,r7,r11

# qhasm: carry? x70 += 13
# asm 1: adds >x70=int32#7,<x70=int32#7,#13
# asm 2: adds >x70=r6,<x70=r6,#13
adds r6,r6,#13

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#20
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#152]
ldrd r6,[sp,#152]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#22
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#168]
ldrd r8,[sp,#168]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#23
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#176]
ldrd r10,[sp,#176]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#14
# asm 2: strd <x20=r2,>x2_stack=[sp,#104]
strd r2,[sp,#104]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#24
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#184]
ldrd r0,[sp,#184]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#15
# asm 2: strd <x70=r2,>x7_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r2 r3 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#3,<k0_stack=stack64#1
# asm 2: ldrd >k00=r2,<k0_stack=[sp,#0]
ldrd r2,[sp,#0]

# qhasm: assign r4 r5 to kt20 kt21 = kt2_stack
# asm 1: ldrd >kt20=int32#5,<kt2_stack=stack64#25
# asm 2: ldrd >kt20=r4,<kt2_stack=[sp,#192]
ldrd r4,[sp,#192]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k00
# asm 1: adds >x40=int32#11,<x40=int32#11,<k00=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k00=r2
adds r10,r10,r2

# qhasm: x41 += k01 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k01=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k01=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#3,<k6_stack=stack64#7
# asm 2: ldrd >k60=r2,<k6_stack=[sp,#48]
ldrd r2,[sp,#48]

# qhasm: carry? x60 += kt20
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt20=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt20=r4
adds r0,r0,r4

# qhasm: x61 += kt21 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt21=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt21=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#5,<k8_stack=stack64#28
# asm 2: ldrd >k80=r4,<k8_stack=[sp,#216]
ldrd r4,[sp,#216]

# qhasm: carry? x10 += k60
# asm 1: adds >x10=int32#7,<x10=int32#7,<k60=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k60=r2
adds r6,r6,r2

# qhasm: x11 += k61 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k61=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k61=r3
adc r7,r7,r3

# qhasm: carry? x30 += k80
# asm 1: adds >x30=int32#9,<x30=int32#9,<k80=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k80=r4
adds r8,r8,r4

# qhasm: x31 += k81 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k81=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k81=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#17
# asm 2: strd <x10=r6,>x1_stack=[sp,#128]
strd r6,[sp,#128]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#20
# asm 2: strd <x30=r8,>x3_stack=[sp,#152]
strd r8,[sp,#152]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#22
# asm 2: strd <x40=r10,>x4_stack=[sp,#168]
strd r10,[sp,#168]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#23
# asm 2: strd <x60=r0,>x6_stack=[sp,#176]
strd r0,[sp,#176]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#14
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#104]
ldrd r2,[sp,#104]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#15
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#112]
ldrd r6,[sp,#112]

# qhasm: assign r8 r9 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#9,<k5_stack=stack64#6
# asm 2: ldrd >k50=r8,<k5_stack=[sp,#40]
ldrd r8,[sp,#40]

# qhasm: assign r10 r11 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#11,<k7_stack=stack64#8
# asm 2: ldrd >k70=r10,<k7_stack=[sp,#56]
ldrd r10,[sp,#56]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k50
# asm 1: adds >x00=int32#1,<x00=int32#1,<k50=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k50=r8
adds r0,r0,r8

# qhasm: x01 += k51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k51=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k51=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt10 kt11 = kt1_stack
# asm 1: ldrd >kt10=int32#9,<kt1_stack=stack64#19
# asm 2: ldrd >kt10=r8,<kt1_stack=[sp,#144]
ldrd r8,[sp,#144]

# qhasm: carry? x20 += k70
# asm 1: adds >x20=int32#3,<x20=int32#3,<k70=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k70=r10
adds r2,r2,r10

# qhasm: x21 += k71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k71=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k71=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#11,<k3_stack=stack64#4
# asm 2: ldrd >k30=r10,<k3_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: carry? x50 += kt10
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt10=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt10=r8
adds r4,r4,r8

# qhasm: x51 += kt11 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt11=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt11=r9
adc r5,r5,r9

# qhasm: carry? x70 += k30
# asm 1: adds >x70=int32#7,<x70=int32#7,<k30=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k30=r10
adds r6,r6,r10

# qhasm: x71 += k31 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k31=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k31=r11
adc r7,r7,r11

# qhasm: carry? x70 += 14
# asm 1: adds >x70=int32#7,<x70=int32#7,#14
# asm 2: adds >x70=r6,<x70=r6,#14
adds r6,r6,#14

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#17
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#20
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#152]
ldrd r8,[sp,#152]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#22
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#168]
ldrd r10,[sp,#168]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#14
# asm 2: strd <x20=r2,>x2_stack=[sp,#104]
strd r2,[sp,#104]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#23
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#176]
ldrd r0,[sp,#176]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#15
# asm 2: strd <x70=r2,>x7_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r2 r3 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#3,<k1_stack=stack64#2
# asm 2: ldrd >k10=r2,<k1_stack=[sp,#8]
ldrd r2,[sp,#8]

# qhasm: assign r4 r5 to kt30 kt31 = kt3_stack
# asm 1: ldrd >kt30=int32#5,<kt3_stack=stack64#16
# asm 2: ldrd >kt30=r4,<kt3_stack=[sp,#120]
ldrd r4,[sp,#120]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k10
# asm 1: adds >x40=int32#11,<x40=int32#11,<k10=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k10=r2
adds r10,r10,r2

# qhasm: x41 += k11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k11=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k11=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#3,<k7_stack=stack64#8
# asm 2: ldrd >k70=r2,<k7_stack=[sp,#56]
ldrd r2,[sp,#56]

# qhasm: carry? x60 += kt30
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt30=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt30=r4
adds r0,r0,r4

# qhasm: x61 += kt31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt31=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt31=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#5,<k0_stack=stack64#1
# asm 2: ldrd >k00=r4,<k0_stack=[sp,#0]
ldrd r4,[sp,#0]

# qhasm: carry? x10 += k70
# asm 1: adds >x10=int32#7,<x10=int32#7,<k70=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k70=r2
adds r6,r6,r2

# qhasm: x11 += k71 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k71=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k71=r3
adc r7,r7,r3

# qhasm: carry? x30 += k00
# asm 1: adds >x30=int32#9,<x30=int32#9,<k00=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k00=r4
adds r8,r8,r4

# qhasm: x31 += k01 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k01=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k01=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#17
# asm 2: strd <x10=r6,>x1_stack=[sp,#128]
strd r6,[sp,#128]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#19
# asm 2: strd <x30=r8,>x3_stack=[sp,#144]
strd r8,[sp,#144]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#20
# asm 2: strd <x40=r10,>x4_stack=[sp,#152]
strd r10,[sp,#152]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#22
# asm 2: strd <x60=r0,>x6_stack=[sp,#168]
strd r0,[sp,#168]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#14
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#104]
ldrd r2,[sp,#104]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#15
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#112]
ldrd r6,[sp,#112]

# qhasm: assign r8 r9 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#9,<k6_stack=stack64#7
# asm 2: ldrd >k60=r8,<k6_stack=[sp,#48]
ldrd r8,[sp,#48]

# qhasm: assign r10 r11 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#11,<k8_stack=stack64#28
# asm 2: ldrd >k80=r10,<k8_stack=[sp,#216]
ldrd r10,[sp,#216]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k60
# asm 1: adds >x00=int32#1,<x00=int32#1,<k60=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k60=r8
adds r0,r0,r8

# qhasm: x01 += k61 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k61=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k61=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt20 kt21 = kt2_stack
# asm 1: ldrd >kt20=int32#9,<kt2_stack=stack64#25
# asm 2: ldrd >kt20=r8,<kt2_stack=[sp,#192]
ldrd r8,[sp,#192]

# qhasm: carry? x20 += k80
# asm 1: adds >x20=int32#3,<x20=int32#3,<k80=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k80=r10
adds r2,r2,r10

# qhasm: x21 += k81 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k81=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k81=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#11,<k4_stack=stack64#5
# asm 2: ldrd >k40=r10,<k4_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: carry? x50 += kt20
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt20=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt20=r8
adds r4,r4,r8

# qhasm: x51 += kt21 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt21=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt21=r9
adc r5,r5,r9

# qhasm: carry? x70 += k40
# asm 1: adds >x70=int32#7,<x70=int32#7,<k40=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k40=r10
adds r6,r6,r10

# qhasm: x71 += k41 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k41=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k41=r11
adc r7,r7,r11

# qhasm: carry? x70 += 15
# asm 1: adds >x70=int32#7,<x70=int32#7,#15
# asm 2: adds >x70=r6,<x70=r6,#15
adds r6,r6,#15

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#12
# asm 2: strd <x70=r6,>x7_stack=[sp,#88]
strd r6,[sp,#88]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#17
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#19
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#144]
ldrd r8,[sp,#144]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#20
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#152]
ldrd r10,[sp,#152]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#13
# asm 2: strd <x00=r0,>x0_stack=[sp,#96]
strd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#14
# asm 2: strd <x20=r2,>x2_stack=[sp,#104]
strd r2,[sp,#104]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#22
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#168]
ldrd r0,[sp,#168]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#12
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#12
# asm 2: strd <x50=r4,>x5_stack=[sp,#88]
strd r4,[sp,#88]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#15
# asm 2: strd <x70=r2,>x7_stack=[sp,#112]
strd r2,[sp,#112]

# qhasm: assign r2 r3 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#3,<k2_stack=stack64#3
# asm 2: ldrd >k20=r2,<k2_stack=[sp,#16]
ldrd r2,[sp,#16]

# qhasm: assign r4 r5 to kt40 kt41 = kt4_stack
# asm 1: ldrd >kt40=int32#5,<kt4_stack=stack64#21
# asm 2: ldrd >kt40=r4,<kt4_stack=[sp,#160]
ldrd r4,[sp,#160]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k20
# asm 1: adds >x40=int32#11,<x40=int32#11,<k20=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k20=r2
adds r10,r10,r2

# qhasm: x41 += k21 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k21=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k21=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#3,<k8_stack=stack64#28
# asm 2: ldrd >k80=r2,<k8_stack=[sp,#216]
ldrd r2,[sp,#216]

# qhasm: carry? x60 += kt40
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt40=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt40=r4
adds r0,r0,r4

# qhasm: x61 += kt41 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt41=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt41=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#5,<k1_stack=stack64#2
# asm 2: ldrd >k10=r4,<k1_stack=[sp,#8]
ldrd r4,[sp,#8]

# qhasm: carry? x10 += k80
# asm 1: adds >x10=int32#7,<x10=int32#7,<k80=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k80=r2
adds r6,r6,r2

# qhasm: x11 += k81 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k81=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k81=r3
adc r7,r7,r3

# qhasm: carry? x30 += k10
# asm 1: adds >x30=int32#9,<x30=int32#9,<k10=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k10=r4
adds r8,r8,r4

# qhasm: x31 += k11 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k11=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k11=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#17
# asm 2: strd <x10=r6,>x1_stack=[sp,#128]
strd r6,[sp,#128]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#19
# asm 2: strd <x30=r8,>x3_stack=[sp,#144]
strd r8,[sp,#144]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#20
# asm 2: strd <x40=r10,>x4_stack=[sp,#152]
strd r10,[sp,#152]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#22
# asm 2: strd <x60=r0,>x6_stack=[sp,#168]
strd r0,[sp,#168]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#13
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#96]
ldrd r0,[sp,#96]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#14
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#104]
ldrd r2,[sp,#104]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#12
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#88]
ldrd r4,[sp,#88]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#15
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#112]
ldrd r6,[sp,#112]

# qhasm: assign r8 r9 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#9,<k7_stack=stack64#8
# asm 2: ldrd >k70=r8,<k7_stack=[sp,#56]
ldrd r8,[sp,#56]

# qhasm: assign r10 r11 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#11,<k0_stack=stack64#1
# asm 2: ldrd >k00=r10,<k0_stack=[sp,#0]
ldrd r10,[sp,#0]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k70
# asm 1: adds >x00=int32#1,<x00=int32#1,<k70=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k70=r8
adds r0,r0,r8

# qhasm: x01 += k71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k71=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k71=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt30 kt31 = kt3_stack
# asm 1: ldrd >kt30=int32#9,<kt3_stack=stack64#16
# asm 2: ldrd >kt30=r8,<kt3_stack=[sp,#120]
ldrd r8,[sp,#120]

# qhasm: carry? x20 += k00
# asm 1: adds >x20=int32#3,<x20=int32#3,<k00=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k00=r10
adds r2,r2,r10

# qhasm: x21 += k01 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k01=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k01=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#11,<k5_stack=stack64#6
# asm 2: ldrd >k50=r10,<k5_stack=[sp,#40]
ldrd r10,[sp,#40]

# qhasm: carry? x50 += kt30
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt30=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt30=r8
adds r4,r4,r8

# qhasm: x51 += kt31 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt31=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt31=r9
adc r5,r5,r9

# qhasm: carry? x70 += k50
# asm 1: adds >x70=int32#7,<x70=int32#7,<k50=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k50=r10
adds r6,r6,r10

# qhasm: x71 += k51 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k51=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k51=r11
adc r7,r7,r11

# qhasm: carry? x70 += 16
# asm 1: adds >x70=int32#7,<x70=int32#7,#16
# asm 2: adds >x70=r6,<x70=r6,#16
adds r6,r6,#16

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#6
# asm 2: strd <x70=r6,>x7_stack=[sp,#40]
strd r6,[sp,#40]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#17
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#128]
ldrd r6,[sp,#128]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#19
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#144]
ldrd r8,[sp,#144]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#20
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#152]
ldrd r10,[sp,#152]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 14)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #14
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #14
eor r12,r0,r7,LSL #14

# qhasm: x11 = x01 ^ (x11 unsigned>> 18)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #18
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #18
eor r7,r1,r7,LSR #18

# qhasm: x11 = x11 ^ (x10 << 14)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #14
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #14
eor r7,r7,r6,LSL #14

# qhasm: x10 = tmp  ^ (x10 unsigned>> 18)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #18
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #18
eor r6,r12,r6,LSR #18

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 << 4)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSL #4
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSL #4
eor r12,r2,r9,LSL #4

# qhasm: x31 = x21 ^ (x31 unsigned>> 28)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSR #28
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSR #28
eor r9,r3,r9,LSR #28

# qhasm: x31 = x31 ^ (x30 << 4)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #4
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #4
eor r9,r9,r8,LSL #4

# qhasm: x30 = tmp  ^ (x30 unsigned>> 28)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #28
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #28
eor r8,r12,r8,LSR #28

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 << 1)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSL #1
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSL #1
eor r12,r2,r7,LSL #1

# qhasm: x11 = x21 ^ (x11 unsigned>> 31)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSR #31
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSR #31
eor r7,r3,r7,LSR #31

# qhasm: x11 = x11 ^ (x10 << 1)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #1
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #1
eor r7,r7,r6,LSL #1

# qhasm: x10 = tmp  ^ (x10 unsigned>> 31)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #31
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #31
eor r6,r12,r6,LSR #31

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 << 10)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSL #10
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSL #10
eor r12,r0,r9,LSL #10

# qhasm: x31 = x01 ^ (x31 unsigned>> 22)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSR #22
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSR #22
eor r9,r1,r9,LSR #22

# qhasm: x31 = x31 ^ (x30 << 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #10
eor r9,r9,r8,LSL #10

# qhasm: x30 = tmp  ^ (x30 unsigned>> 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #22
eor r8,r12,r8,LSR #22

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#12
# asm 2: strd <x00=r0,>x0_stack=[sp,#88]
strd r0,[sp,#88]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#13
# asm 2: strd <x20=r2,>x2_stack=[sp,#96]
strd r2,[sp,#96]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#22
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#168]
ldrd r0,[sp,#168]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#6
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 unsigned>> 13)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSR #13
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSR #13
eor r12,r10,r5,LSR #13

# qhasm: x51 = x41 ^ (x51 << 19)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSL #19
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSL #19
eor r5,r11,r5,LSL #19

# qhasm: x51 = x51 ^ (x50 unsigned>> 13)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #13
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #13
eor r5,r5,r4,LSR #13

# qhasm: x50 = tmp  ^ (x50 << 19)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #19
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #19
eor r4,r12,r4,LSL #19

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 << 5)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSL #5
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSL #5
eor r12,r0,r3,LSL #5

# qhasm: x71 = x61 ^ (x71 unsigned>> 27)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSR #27
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSR #27
eor r3,r1,r3,LSR #27

# qhasm: x71 = x71 ^ (x70 << 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #5
eor r3,r3,r2,LSL #5

# qhasm: x70 = tmp  ^ (x70 unsigned>> 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #27
eor r2,r12,r2,LSR #27

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 unsigned>> 5)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSR #5
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSR #5
eor r12,r10,r3,LSR #5

# qhasm: x71 = x41 ^ (x71 << 27)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSL #27
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSL #27
eor r3,r11,r3,LSL #27

# qhasm: x71 = x71 ^ (x70 unsigned>> 5)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #5
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #5
eor r3,r3,r2,LSR #5

# qhasm: x70 = tmp  ^ (x70 << 27)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #27
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #27
eor r2,r12,r2,LSL #27

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 18)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #18
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #18
eor r12,r0,r5,LSR #18

# qhasm: x51 = x61 ^ (x51 << 14)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #14
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #14
eor r5,r1,r5,LSL #14

# qhasm: x51 = x51 ^ (x50 unsigned>> 18)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #18
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #18
eor r5,r5,r4,LSR #18

# qhasm: x50 = tmp  ^ (x50 << 14)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #14
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #14
eor r4,r12,r4,LSL #14

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#6
# asm 2: strd <x50=r4,>x5_stack=[sp,#40]
strd r4,[sp,#40]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#14
# asm 2: strd <x70=r2,>x7_stack=[sp,#104]
strd r2,[sp,#104]

# qhasm: assign r2 r3 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#3,<k3_stack=stack64#4
# asm 2: ldrd >k30=r2,<k3_stack=[sp,#24]
ldrd r2,[sp,#24]

# qhasm: assign r4 r5 to kt50 kt51 = kt5_stack
# asm 1: ldrd >kt50=int32#5,<kt5_stack=stack64#27
# asm 2: ldrd >kt50=r4,<kt5_stack=[sp,#208]
ldrd r4,[sp,#208]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #15
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #15
eor r12,r10,r7,LSR #15

# qhasm: x11 = x41 ^ (x11 << 17)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #17
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #17
eor r7,r11,r7,LSL #17

# qhasm: x11 = x11 ^ (x10 unsigned>> 15)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #15
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #15
eor r7,r7,r6,LSR #15

# qhasm: x10 = tmp  ^ (x10 << 17)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #17
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #17
eor r6,r12,r6,LSL #17

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 << 17)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSL #17
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSL #17
eor r12,r0,r9,LSL #17

# qhasm: x31 = x61 ^ (x31 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSR #15
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSR #15
eor r9,r1,r9,LSR #15

# qhasm: x31 = x31 ^ (x30 << 17)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #17
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #17
eor r9,r9,r8,LSL #17

# qhasm: x30 = tmp  ^ (x30 unsigned>> 15)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #15
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #15
eor r8,r12,r8,LSR #15

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 << 12)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSL #12
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSL #12
eor r12,r0,r7,LSL #12

# qhasm: x11 = x61 ^ (x11 unsigned>> 20)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSR #20
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSR #20
eor r7,r1,r7,LSR #20

# qhasm: x11 = x11 ^ (x10 << 12)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #12
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #12
eor r7,r7,r6,LSL #12

# qhasm: x10 = tmp  ^ (x10 unsigned>> 20)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #20
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #20
eor r6,r12,r6,LSR #20

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 << 24)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSL #24
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSL #24
eor r12,r10,r9,LSL #24

# qhasm: x31 = x41 ^ (x31 unsigned>> 8)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSR #8
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSR #8
eor r9,r11,r9,LSR #8

# qhasm: x31 = x31 ^ (x30 << 24)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSL #24
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSL #24
eor r9,r9,r8,LSL #24

# qhasm: x30 = tmp  ^ (x30 unsigned>> 8)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSR #8
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSR #8
eor r8,r12,r8,LSR #8

# qhasm: carry? x40 += k30
# asm 1: adds >x40=int32#11,<x40=int32#11,<k30=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k30=r2
adds r10,r10,r2

# qhasm: x41 += k31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k31=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k31=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#3,<k0_stack=stack64#1
# asm 2: ldrd >k00=r2,<k0_stack=[sp,#0]
ldrd r2,[sp,#0]

# qhasm: carry? x60 += kt50
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt50=r4
adds r0,r0,r4

# qhasm: x61 += kt51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt51=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#5,<k2_stack=stack64#3
# asm 2: ldrd >k20=r4,<k2_stack=[sp,#16]
ldrd r4,[sp,#16]

# qhasm: carry? x10 += k00
# asm 1: adds >x10=int32#7,<x10=int32#7,<k00=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k00=r2
adds r6,r6,r2

# qhasm: x11 += k01 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k01=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k01=r3
adc r7,r7,r3

# qhasm: carry? x30 += k20
# asm 1: adds >x30=int32#9,<x30=int32#9,<k20=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k20=r4
adds r8,r8,r4

# qhasm: x31 += k21 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k21=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k21=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#15
# asm 2: strd <x10=r6,>x1_stack=[sp,#112]
strd r6,[sp,#112]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#16
# asm 2: strd <x30=r8,>x3_stack=[sp,#120]
strd r8,[sp,#120]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#17
# asm 2: strd <x40=r10,>x4_stack=[sp,#128]
strd r10,[sp,#128]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#19
# asm 2: strd <x60=r0,>x6_stack=[sp,#144]
strd r0,[sp,#144]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#12
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#88]
ldrd r0,[sp,#88]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#13
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#96]
ldrd r2,[sp,#96]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#6
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#40]
ldrd r4,[sp,#40]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#14
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#104]
ldrd r6,[sp,#104]

# qhasm: assign r8 r9 to k80 k81 = k8_stack
# asm 1: ldrd >k80=int32#9,<k8_stack=stack64#28
# asm 2: ldrd >k80=r8,<k8_stack=[sp,#216]
ldrd r8,[sp,#216]

# qhasm: assign r10 r11 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#11,<k1_stack=stack64#2
# asm 2: ldrd >k10=r10,<k1_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 4)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #4
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #4
eor r12,r0,r5,LSL #4

# qhasm: x51 = x01 ^ (x51 unsigned>> 28)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #28
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #28
eor r5,r1,r5,LSR #28

# qhasm: x51 = x51 ^ (x50 << 4)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #4
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #4
eor r5,r5,r4,LSL #4

# qhasm: x50 = tmp  ^ (x50 unsigned>> 28)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #28
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #28
eor r4,r12,r4,LSR #28

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 7)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #7
eor r12,r2,r7,LSL #7

# qhasm: x71 = x21 ^ (x71 unsigned>> 25)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #25
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #25
eor r7,r3,r7,LSR #25

# qhasm: x71 = x71 ^ (x70 << 7)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #7
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x70 = tmp  ^ (x70 unsigned>> 25)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #25
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 unsigned>> 23)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSR #23
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSR #23
eor r12,r0,r7,LSR #23

# qhasm: x71 = x01 ^ (x71 << 9)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSL #9
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSL #9
eor r7,r1,r7,LSL #9

# qhasm: x71 = x71 ^ (x70 unsigned>> 23)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSR #23
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSR #23
eor r7,r7,r6,LSR #23

# qhasm: x70 = tmp  ^ (x70 << 9)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSL #9
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSL #9
eor r6,r12,r6,LSL #9

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 22)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #22
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #22
eor r12,r2,r5,LSL #22

# qhasm: x51 = x21 ^ (x51 unsigned>> 10)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #10
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #10
eor r5,r3,r5,LSR #10

# qhasm: x51 = x51 ^ (x50 << 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #22
eor r5,r5,r4,LSL #22

# qhasm: x50 = tmp  ^ (x50 unsigned>> 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #10
eor r4,r12,r4,LSR #10

# qhasm: carry? x00 += k80
# asm 1: adds >x00=int32#1,<x00=int32#1,<k80=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k80=r8
adds r0,r0,r8

# qhasm: x01 += k81 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k81=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k81=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt40 kt41 = kt4_stack
# asm 1: ldrd >kt40=int32#9,<kt4_stack=stack64#21
# asm 2: ldrd >kt40=r8,<kt4_stack=[sp,#160]
ldrd r8,[sp,#160]

# qhasm: carry? x20 += k10
# asm 1: adds >x20=int32#3,<x20=int32#3,<k10=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k10=r10
adds r2,r2,r10

# qhasm: x21 += k11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k11=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k11=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#11,<k6_stack=stack64#7
# asm 2: ldrd >k60=r10,<k6_stack=[sp,#48]
ldrd r10,[sp,#48]

# qhasm: carry? x50 += kt40
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt40=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt40=r8
adds r4,r4,r8

# qhasm: x51 += kt41 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt41=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt41=r9
adc r5,r5,r9

# qhasm: carry? x70 += k60
# asm 1: adds >x70=int32#7,<x70=int32#7,<k60=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k60=r10
adds r6,r6,r10

# qhasm: x71 += k61 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k61=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k61=r11
adc r7,r7,r11

# qhasm: carry? x70 += 17
# asm 1: adds >x70=int32#7,<x70=int32#7,#17
# asm 2: adds >x70=r6,<x70=r6,#17
adds r6,r6,#17

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#6
# asm 2: strd <x70=r6,>x7_stack=[sp,#40]
strd r6,[sp,#40]

# qhasm: assign r6 r7 to x10 x11 = x1_stack
# asm 1: ldrd >x10=int32#7,<x1_stack=stack64#15
# asm 2: ldrd >x10=r6,<x1_stack=[sp,#112]
ldrd r6,[sp,#112]

# qhasm: assign r8 r9 to x30 x31 = x3_stack
# asm 1: ldrd >x30=int32#9,<x3_stack=stack64#16
# asm 2: ldrd >x30=r8,<x3_stack=[sp,#120]
ldrd r8,[sp,#120]

# qhasm: assign r10 r11 to x40 x41 = x4_stack
# asm 1: ldrd >x40=int32#11,<x4_stack=stack64#17
# asm 2: ldrd >x40=r10,<x4_stack=[sp,#128]
ldrd r10,[sp,#128]

# qhasm: carry? x00 += x10
# asm 1: adds >x00=int32#1,<x00=int32#1,<x10=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x10=r6
adds r0,r0,r6

# qhasm: x01 += x11 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x11=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x11 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x11=int32#8,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x11=r7,LSL #7
eor r12,r0,r7,LSL #7

# qhasm: x11 = x01 ^ (x11 unsigned>> 25)
# asm 1: eor >x11=int32#8,<x01=int32#2,<x11=int32#8,LSR #25
# asm 2: eor >x11=r7,<x01=r1,<x11=r7,LSR #25
eor r7,r1,r7,LSR #25

# qhasm: x11 = x11 ^ (x10 << 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSL #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSL #7
eor r7,r7,r6,LSL #7

# qhasm: x10 = tmp  ^ (x10 unsigned>> 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSR #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSR #25
eor r6,r12,r6,LSR #25

# qhasm: carry? x20 += x30
# asm 1: adds >x20=int32#3,<x20=int32#3,<x30=int32#9
# asm 2: adds >x20=r2,<x20=r2,<x30=r8
adds r2,r2,r8

# qhasm: x21 += x31 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x31=int32#10
# asm 2: adc >x21=r3,<x21=r3,<x31=r9
adc r3,r3,r9

# qhasm: tmp = x20 ^ (x31 unsigned>> 2)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x31=int32#10,LSR #2
# asm 2: eor >tmp=r12,<x20=r2,<x31=r9,LSR #2
eor r12,r2,r9,LSR #2

# qhasm: x31 = x21 ^ (x31 << 30)
# asm 1: eor >x31=int32#10,<x21=int32#4,<x31=int32#10,LSL #30
# asm 2: eor >x31=r9,<x21=r3,<x31=r9,LSL #30
eor r9,r3,r9,LSL #30

# qhasm: x31 = x31 ^ (x30 unsigned>> 2)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #2
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #2
eor r9,r9,r8,LSR #2

# qhasm: x30 = tmp  ^ (x30 << 30)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #30
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #30
eor r8,r12,r8,LSL #30

# qhasm: carry? x20 += x10
# asm 1: adds >x20=int32#3,<x20=int32#3,<x10=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x10=r6
adds r2,r2,r6

# qhasm: x21 += x11 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x11=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x11=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x11 unsigned>> 19)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x11=int32#8,LSR #19
# asm 2: eor >tmp=r12,<x20=r2,<x11=r7,LSR #19
eor r12,r2,r7,LSR #19

# qhasm: x11 = x21 ^ (x11 << 13)
# asm 1: eor >x11=int32#8,<x21=int32#4,<x11=int32#8,LSL #13
# asm 2: eor >x11=r7,<x21=r3,<x11=r7,LSL #13
eor r7,r3,r7,LSL #13

# qhasm: x11 = x11 ^ (x10 unsigned>> 19)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #19
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #19
eor r7,r7,r6,LSR #19

# qhasm: x10 = tmp  ^ (x10 << 13)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #13
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #13
eor r6,r12,r6,LSL #13

# qhasm: carry? x00 += x30
# asm 1: adds >x00=int32#1,<x00=int32#1,<x30=int32#9
# asm 2: adds >x00=r0,<x00=r0,<x30=r8
adds r0,r0,r8

# qhasm: x01 += x31 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x31=int32#10
# asm 2: adc >x01=r1,<x01=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x00 ^ (x31 unsigned>> 15)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x31=int32#10,LSR #15
# asm 2: eor >tmp=r12,<x00=r0,<x31=r9,LSR #15
eor r12,r0,r9,LSR #15

# qhasm: x31 = x01 ^ (x31 << 17)
# asm 1: eor >x31=int32#10,<x01=int32#2,<x31=int32#10,LSL #17
# asm 2: eor >x31=r9,<x01=r1,<x31=r9,LSL #17
eor r9,r1,r9,LSL #17

# qhasm: x31 = x31 ^ (x30 unsigned>> 15)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #15
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #15
eor r9,r9,r8,LSR #15

# qhasm: x30 = tmp  ^ (x30 << 17)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #17
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #17
eor r8,r12,r8,LSL #17

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#7
# asm 2: strd <x00=r0,>x0_stack=[sp,#48]
strd r0,[sp,#48]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#12
# asm 2: strd <x20=r2,>x2_stack=[sp,#88]
strd r2,[sp,#88]

# qhasm: assign r0 r1 to x60 x61 = x6_stack
# asm 1: ldrd >x60=int32#1,<x6_stack=stack64#19
# asm 2: ldrd >x60=r0,<x6_stack=[sp,#144]
ldrd r0,[sp,#144]

# qhasm: assign r2 r3 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#3,<x7_stack=stack64#6
# asm 2: ldrd >x70=r2,<x7_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: carry? x40 += x50
# asm 1: adds >x40=int32#11,<x40=int32#11,<x50=int32#5
# asm 2: adds >x40=r10,<x40=r10,<x50=r4
adds r10,r10,r4

# qhasm: x41 += x51 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x51=int32#6
# asm 2: adc >x41=r11,<x41=r11,<x51=r5
adc r11,r11,r5

# qhasm: tmp = x40 ^ (x51 << 2)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x51=int32#6,LSL #2
# asm 2: eor >tmp=r12,<x40=r10,<x51=r5,LSL #2
eor r12,r10,r5,LSL #2

# qhasm: x51 = x41 ^ (x51 unsigned>> 30)
# asm 1: eor >x51=int32#6,<x41=int32#12,<x51=int32#6,LSR #30
# asm 2: eor >x51=r5,<x41=r11,<x51=r5,LSR #30
eor r5,r11,r5,LSR #30

# qhasm: x51 = x51 ^ (x50 << 2)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #2
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #2
eor r5,r5,r4,LSL #2

# qhasm: x50 = tmp  ^ (x50 unsigned>> 30)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #30
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #30
eor r4,r12,r4,LSR #30

# qhasm: carry? x60 += x70
# asm 1: adds >x60=int32#1,<x60=int32#1,<x70=int32#3
# asm 2: adds >x60=r0,<x60=r0,<x70=r2
adds r0,r0,r2

# qhasm: x61 += x71 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x71=int32#4
# asm 2: adc >x61=r1,<x61=r1,<x71=r3
adc r1,r1,r3

# qhasm: tmp = x60 ^ (x71 unsigned>> 8)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x71=int32#4,LSR #8
# asm 2: eor >tmp=r12,<x60=r0,<x71=r3,LSR #8
eor r12,r0,r3,LSR #8

# qhasm: x71 = x61 ^ (x71 << 24)
# asm 1: eor >x71=int32#4,<x61=int32#2,<x71=int32#4,LSL #24
# asm 2: eor >x71=r3,<x61=r1,<x71=r3,LSL #24
eor r3,r1,r3,LSL #24

# qhasm: x71 = x71 ^ (x70 unsigned>> 8)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSR #8
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSR #8
eor r3,r3,r2,LSR #8

# qhasm: x70 = tmp  ^ (x70 << 24)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSL #24
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSL #24
eor r2,r12,r2,LSL #24

# qhasm: carry? x40 += x70
# asm 1: adds >x40=int32#11,<x40=int32#11,<x70=int32#3
# asm 2: adds >x40=r10,<x40=r10,<x70=r2
adds r10,r10,r2

# qhasm: x41 += x71 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x71=int32#4
# asm 2: adc >x41=r11,<x41=r11,<x71=r3
adc r11,r11,r3

# qhasm: tmp = x40 ^ (x71 << 18)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x71=int32#4,LSL #18
# asm 2: eor >tmp=r12,<x40=r10,<x71=r3,LSL #18
eor r12,r10,r3,LSL #18

# qhasm: x71 = x41 ^ (x71 unsigned>> 14)
# asm 1: eor >x71=int32#4,<x41=int32#12,<x71=int32#4,LSR #14
# asm 2: eor >x71=r3,<x41=r11,<x71=r3,LSR #14
eor r3,r11,r3,LSR #14

# qhasm: x71 = x71 ^ (x70 << 18)
# asm 1: eor >x71=int32#4,<x71=int32#4,<x70=int32#3,LSL #18
# asm 2: eor >x71=r3,<x71=r3,<x70=r2,LSL #18
eor r3,r3,r2,LSL #18

# qhasm: x70 = tmp  ^ (x70 unsigned>> 14)
# asm 1: eor >x70=int32#3,<tmp=int32#13,<x70=int32#3,LSR #14
# asm 2: eor >x70=r2,<tmp=r12,<x70=r2,LSR #14
eor r2,r12,r2,LSR #14

# qhasm: carry? x60 += x50
# asm 1: adds >x60=int32#1,<x60=int32#1,<x50=int32#5
# asm 2: adds >x60=r0,<x60=r0,<x50=r4
adds r0,r0,r4

# qhasm: x61 += x51 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x51=int32#6
# asm 2: adc >x61=r1,<x61=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x60 ^ (x51 unsigned>> 22)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x51=int32#6,LSR #22
# asm 2: eor >tmp=r12,<x60=r0,<x51=r5,LSR #22
eor r12,r0,r5,LSR #22

# qhasm: x51 = x61 ^ (x51 << 10)
# asm 1: eor >x51=int32#6,<x61=int32#2,<x51=int32#6,LSL #10
# asm 2: eor >x51=r5,<x61=r1,<x51=r5,LSL #10
eor r5,r1,r5,LSL #10

# qhasm: x51 = x51 ^ (x50 unsigned>> 22)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSR #22
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSR #22
eor r5,r5,r4,LSR #22

# qhasm: x50 = tmp  ^ (x50 << 10)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSL #10
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSL #10
eor r4,r12,r4,LSL #10

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#6
# asm 2: strd <x50=r4,>x5_stack=[sp,#40]
strd r4,[sp,#40]

# qhasm: assign r2 r3 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#3,>x7_stack=stack64#13
# asm 2: strd <x70=r2,>x7_stack=[sp,#96]
strd r2,[sp,#96]

# qhasm: assign r2 r3 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#3,<k4_stack=stack64#5
# asm 2: ldrd >k40=r2,<k4_stack=[sp,#32]
ldrd r2,[sp,#32]

# qhasm: assign r4 r5 to kt60 kt61 = kt6_stack
# asm 1: ldrd >kt60=int32#5,<kt6_stack=stack64#18
# asm 2: ldrd >kt60=r4,<kt6_stack=[sp,#136]
ldrd r4,[sp,#136]

# qhasm: carry? x40 += x10
# asm 1: adds >x40=int32#11,<x40=int32#11,<x10=int32#7
# asm 2: adds >x40=r10,<x40=r10,<x10=r6
adds r10,r10,r6

# qhasm: x41 += x11 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x11=int32#8
# asm 2: adc >x41=r11,<x41=r11,<x11=r7
adc r11,r11,r7

# qhasm: tmp = x40 ^ (x11 unsigned>> 7)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x11=int32#8,LSR #7
# asm 2: eor >tmp=r12,<x40=r10,<x11=r7,LSR #7
eor r12,r10,r7,LSR #7

# qhasm: x11 = x41 ^ (x11 << 25)
# asm 1: eor >x11=int32#8,<x41=int32#12,<x11=int32#8,LSL #25
# asm 2: eor >x11=r7,<x41=r11,<x11=r7,LSL #25
eor r7,r11,r7,LSL #25

# qhasm: x11 = x11 ^ (x10 unsigned>> 7)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #7
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #7
eor r7,r7,r6,LSR #7

# qhasm: x10 = tmp  ^ (x10 << 25)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #25
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #25
eor r6,r12,r6,LSL #25

# qhasm: carry? x60 += x30
# asm 1: adds >x60=int32#1,<x60=int32#1,<x30=int32#9
# asm 2: adds >x60=r0,<x60=r0,<x30=r8
adds r0,r0,r8

# qhasm: x61 += x31 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x31=int32#10
# asm 2: adc >x61=r1,<x61=r1,<x31=r9
adc r1,r1,r9

# qhasm: tmp = x60 ^ (x31 unsigned>> 3)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x31=int32#10,LSR #3
# asm 2: eor >tmp=r12,<x60=r0,<x31=r9,LSR #3
eor r12,r0,r9,LSR #3

# qhasm: x31 = x61 ^ (x31 << 29)
# asm 1: eor >x31=int32#10,<x61=int32#2,<x31=int32#10,LSL #29
# asm 2: eor >x31=r9,<x61=r1,<x31=r9,LSL #29
eor r9,r1,r9,LSL #29

# qhasm: x31 = x31 ^ (x30 unsigned>> 3)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #3
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #3
eor r9,r9,r8,LSR #3

# qhasm: x30 = tmp  ^ (x30 << 29)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #29
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #29
eor r8,r12,r8,LSL #29

# qhasm: carry? x60 += x10
# asm 1: adds >x60=int32#1,<x60=int32#1,<x10=int32#7
# asm 2: adds >x60=r0,<x60=r0,<x10=r6
adds r0,r0,r6

# qhasm: x61 += x11 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<x11=int32#8
# asm 2: adc >x61=r1,<x61=r1,<x11=r7
adc r1,r1,r7

# qhasm: tmp = x60 ^ (x11 unsigned>> 24)
# asm 1: eor >tmp=int32#13,<x60=int32#1,<x11=int32#8,LSR #24
# asm 2: eor >tmp=r12,<x60=r0,<x11=r7,LSR #24
eor r12,r0,r7,LSR #24

# qhasm: x11 = x61 ^ (x11 << 8)
# asm 1: eor >x11=int32#8,<x61=int32#2,<x11=int32#8,LSL #8
# asm 2: eor >x11=r7,<x61=r1,<x11=r7,LSL #8
eor r7,r1,r7,LSL #8

# qhasm: x11 = x11 ^ (x10 unsigned>> 24)
# asm 1: eor >x11=int32#8,<x11=int32#8,<x10=int32#7,LSR #24
# asm 2: eor >x11=r7,<x11=r7,<x10=r6,LSR #24
eor r7,r7,r6,LSR #24

# qhasm: x10 = tmp  ^ (x10 << 8)
# asm 1: eor >x10=int32#7,<tmp=int32#13,<x10=int32#7,LSL #8
# asm 2: eor >x10=r6,<tmp=r12,<x10=r6,LSL #8
eor r6,r12,r6,LSL #8

# qhasm: carry? x40 += x30
# asm 1: adds >x40=int32#11,<x40=int32#11,<x30=int32#9
# asm 2: adds >x40=r10,<x40=r10,<x30=r8
adds r10,r10,r8

# qhasm: x41 += x31 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<x31=int32#10
# asm 2: adc >x41=r11,<x41=r11,<x31=r9
adc r11,r11,r9

# qhasm: tmp = x40 ^ (x31 unsigned>> 10)
# asm 1: eor >tmp=int32#13,<x40=int32#11,<x31=int32#10,LSR #10
# asm 2: eor >tmp=r12,<x40=r10,<x31=r9,LSR #10
eor r12,r10,r9,LSR #10

# qhasm: x31 = x41 ^ (x31 << 22)
# asm 1: eor >x31=int32#10,<x41=int32#12,<x31=int32#10,LSL #22
# asm 2: eor >x31=r9,<x41=r11,<x31=r9,LSL #22
eor r9,r11,r9,LSL #22

# qhasm: x31 = x31 ^ (x30 unsigned>> 10)
# asm 1: eor >x31=int32#10,<x31=int32#10,<x30=int32#9,LSR #10
# asm 2: eor >x31=r9,<x31=r9,<x30=r8,LSR #10
eor r9,r9,r8,LSR #10

# qhasm: x30 = tmp  ^ (x30 << 22)
# asm 1: eor >x30=int32#9,<tmp=int32#13,<x30=int32#9,LSL #22
# asm 2: eor >x30=r8,<tmp=r12,<x30=r8,LSL #22
eor r8,r12,r8,LSL #22

# qhasm: carry? x40 += k40
# asm 1: adds >x40=int32#11,<x40=int32#11,<k40=int32#3
# asm 2: adds >x40=r10,<x40=r10,<k40=r2
adds r10,r10,r2

# qhasm: x41 += k41 + carry
# asm 1: adc >x41=int32#12,<x41=int32#12,<k41=int32#4
# asm 2: adc >x41=r11,<x41=r11,<k41=r3
adc r11,r11,r3

# qhasm: assign r2 r3 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#3,<k1_stack=stack64#2
# asm 2: ldrd >k10=r2,<k1_stack=[sp,#8]
ldrd r2,[sp,#8]

# qhasm: carry? x60 += kt60
# asm 1: adds >x60=int32#1,<x60=int32#1,<kt60=int32#5
# asm 2: adds >x60=r0,<x60=r0,<kt60=r4
adds r0,r0,r4

# qhasm: x61 += kt61 + carry
# asm 1: adc >x61=int32#2,<x61=int32#2,<kt61=int32#6
# asm 2: adc >x61=r1,<x61=r1,<kt61=r5
adc r1,r1,r5

# qhasm: assign r4 r5 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#5,<k3_stack=stack64#4
# asm 2: ldrd >k30=r4,<k3_stack=[sp,#24]
ldrd r4,[sp,#24]

# qhasm: carry? x10 += k10
# asm 1: adds >x10=int32#7,<x10=int32#7,<k10=int32#3
# asm 2: adds >x10=r6,<x10=r6,<k10=r2
adds r6,r6,r2

# qhasm: x11 += k11 + carry
# asm 1: adc >x11=int32#8,<x11=int32#8,<k11=int32#4
# asm 2: adc >x11=r7,<x11=r7,<k11=r3
adc r7,r7,r3

# qhasm: carry? x30 += k30
# asm 1: adds >x30=int32#9,<x30=int32#9,<k30=int32#5
# asm 2: adds >x30=r8,<x30=r8,<k30=r4
adds r8,r8,r4

# qhasm: x31 += k31 + carry
# asm 1: adc >x31=int32#10,<x31=int32#10,<k31=int32#6
# asm 2: adc >x31=r9,<x31=r9,<k31=r5
adc r9,r9,r5

# qhasm: assign r6 r7 to x10 x11; x1_stack = x10 x11
# asm 1: strd <x10=int32#7,>x1_stack=stack64#2
# asm 2: strd <x10=r6,>x1_stack=[sp,#8]
strd r6,[sp,#8]

# qhasm: assign r8 r9 to x30 x31; x3_stack = x30 x31
# asm 1: strd <x30=int32#9,>x3_stack=stack64#4
# asm 2: strd <x30=r8,>x3_stack=[sp,#24]
strd r8,[sp,#24]

# qhasm: assign r10 r11 to x40 x41; x4_stack = x40 x41
# asm 1: strd <x40=int32#11,>x4_stack=stack64#5
# asm 2: strd <x40=r10,>x4_stack=[sp,#32]
strd r10,[sp,#32]

# qhasm: assign r0 r1 to x60 x61; x6_stack = x60 x61
# asm 1: strd <x60=int32#1,>x6_stack=stack64#14
# asm 2: strd <x60=r0,>x6_stack=[sp,#104]
strd r0,[sp,#104]

# qhasm: assign r0 r1 to x00 x01 = x0_stack
# asm 1: ldrd >x00=int32#1,<x0_stack=stack64#7
# asm 2: ldrd >x00=r0,<x0_stack=[sp,#48]
ldrd r0,[sp,#48]

# qhasm: assign r2 r3 to x20 x21 = x2_stack
# asm 1: ldrd >x20=int32#3,<x2_stack=stack64#12
# asm 2: ldrd >x20=r2,<x2_stack=[sp,#88]
ldrd r2,[sp,#88]

# qhasm: assign r4 r5 to x50 x51 = x5_stack
# asm 1: ldrd >x50=int32#5,<x5_stack=stack64#6
# asm 2: ldrd >x50=r4,<x5_stack=[sp,#40]
ldrd r4,[sp,#40]

# qhasm: assign r6 r7 to x70 x71 = x7_stack
# asm 1: ldrd >x70=int32#7,<x7_stack=stack64#13
# asm 2: ldrd >x70=r6,<x7_stack=[sp,#96]
ldrd r6,[sp,#96]

# qhasm: assign r8 r9 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#9,<k0_stack=stack64#1
# asm 2: ldrd >k00=r8,<k0_stack=[sp,#0]
ldrd r8,[sp,#0]

# qhasm: assign r10 r11 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#11,<k2_stack=stack64#3
# asm 2: ldrd >k20=r10,<k2_stack=[sp,#16]
ldrd r10,[sp,#16]

# qhasm: carry? x00 += x50
# asm 1: adds >x00=int32#1,<x00=int32#1,<x50=int32#5
# asm 2: adds >x00=r0,<x00=r0,<x50=r4
adds r0,r0,r4

# qhasm: x01 += x51 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x51=int32#6
# asm 2: adc >x01=r1,<x01=r1,<x51=r5
adc r1,r1,r5

# qhasm: tmp = x00 ^ (x51 << 7)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x51=int32#6,LSL #7
# asm 2: eor >tmp=r12,<x00=r0,<x51=r5,LSL #7
eor r12,r0,r5,LSL #7

# qhasm: x51 = x01 ^ (x51 unsigned>> 25)
# asm 1: eor >x51=int32#6,<x01=int32#2,<x51=int32#6,LSR #25
# asm 2: eor >x51=r5,<x01=r1,<x51=r5,LSR #25
eor r5,r1,r5,LSR #25

# qhasm: x51 = x51 ^ (x50 << 7)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #7
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #7
eor r5,r5,r4,LSL #7

# qhasm: x50 = tmp  ^ (x50 unsigned>> 25)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #25
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #25
eor r4,r12,r4,LSR #25

# qhasm: carry? x20 += x70
# asm 1: adds >x20=int32#3,<x20=int32#3,<x70=int32#7
# asm 2: adds >x20=r2,<x20=r2,<x70=r6
adds r2,r2,r6

# qhasm: x21 += x71 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x71=int32#8
# asm 2: adc >x21=r3,<x21=r3,<x71=r7
adc r3,r3,r7

# qhasm: tmp = x20 ^ (x71 << 11)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x71=int32#8,LSL #11
# asm 2: eor >tmp=r12,<x20=r2,<x71=r7,LSL #11
eor r12,r2,r7,LSL #11

# qhasm: x71 = x21 ^ (x71 unsigned>> 21)
# asm 1: eor >x71=int32#8,<x21=int32#4,<x71=int32#8,LSR #21
# asm 2: eor >x71=r7,<x21=r3,<x71=r7,LSR #21
eor r7,r3,r7,LSR #21

# qhasm: x71 = x71 ^ (x70 << 11)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #11
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #11
eor r7,r7,r6,LSL #11

# qhasm: x70 = tmp  ^ (x70 unsigned>> 21)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #21
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #21
eor r6,r12,r6,LSR #21

# qhasm: carry? x00 += x70
# asm 1: adds >x00=int32#1,<x00=int32#1,<x70=int32#7
# asm 2: adds >x00=r0,<x00=r0,<x70=r6
adds r0,r0,r6

# qhasm: x01 += x71 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<x71=int32#8
# asm 2: adc >x01=r1,<x01=r1,<x71=r7
adc r1,r1,r7

# qhasm: tmp = x00 ^ (x71 << 3)
# asm 1: eor >tmp=int32#13,<x00=int32#1,<x71=int32#8,LSL #3
# asm 2: eor >tmp=r12,<x00=r0,<x71=r7,LSL #3
eor r12,r0,r7,LSL #3

# qhasm: x71 = x01 ^ (x71 unsigned>> 29)
# asm 1: eor >x71=int32#8,<x01=int32#2,<x71=int32#8,LSR #29
# asm 2: eor >x71=r7,<x01=r1,<x71=r7,LSR #29
eor r7,r1,r7,LSR #29

# qhasm: x71 = x71 ^ (x70 << 3)
# asm 1: eor >x71=int32#8,<x71=int32#8,<x70=int32#7,LSL #3
# asm 2: eor >x71=r7,<x71=r7,<x70=r6,LSL #3
eor r7,r7,r6,LSL #3

# qhasm: x70 = tmp  ^ (x70 unsigned>> 29)
# asm 1: eor >x70=int32#7,<tmp=int32#13,<x70=int32#7,LSR #29
# asm 2: eor >x70=r6,<tmp=r12,<x70=r6,LSR #29
eor r6,r12,r6,LSR #29

# qhasm: carry? x20 += x50
# asm 1: adds >x20=int32#3,<x20=int32#3,<x50=int32#5
# asm 2: adds >x20=r2,<x20=r2,<x50=r4
adds r2,r2,r4

# qhasm: x21 += x51 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<x51=int32#6
# asm 2: adc >x21=r3,<x21=r3,<x51=r5
adc r3,r3,r5

# qhasm: tmp = x20 ^ (x51 << 24)
# asm 1: eor >tmp=int32#13,<x20=int32#3,<x51=int32#6,LSL #24
# asm 2: eor >tmp=r12,<x20=r2,<x51=r5,LSL #24
eor r12,r2,r5,LSL #24

# qhasm: x51 = x21 ^ (x51 unsigned>> 8)
# asm 1: eor >x51=int32#6,<x21=int32#4,<x51=int32#6,LSR #8
# asm 2: eor >x51=r5,<x21=r3,<x51=r5,LSR #8
eor r5,r3,r5,LSR #8

# qhasm: x51 = x51 ^ (x50 << 24)
# asm 1: eor >x51=int32#6,<x51=int32#6,<x50=int32#5,LSL #24
# asm 2: eor >x51=r5,<x51=r5,<x50=r4,LSL #24
eor r5,r5,r4,LSL #24

# qhasm: x50 = tmp  ^ (x50 unsigned>> 8)
# asm 1: eor >x50=int32#5,<tmp=int32#13,<x50=int32#5,LSR #8
# asm 2: eor >x50=r4,<tmp=r12,<x50=r4,LSR #8
eor r4,r12,r4,LSR #8

# qhasm: carry? x00 += k00
# asm 1: adds >x00=int32#1,<x00=int32#1,<k00=int32#9
# asm 2: adds >x00=r0,<x00=r0,<k00=r8
adds r0,r0,r8

# qhasm: x01 += k01 + carry
# asm 1: adc >x01=int32#2,<x01=int32#2,<k01=int32#10
# asm 2: adc >x01=r1,<x01=r1,<k01=r9
adc r1,r1,r9

# qhasm: assign r8 r9 to kt50 kt51 = kt5_stack
# asm 1: ldrd >kt50=int32#9,<kt5_stack=stack64#27
# asm 2: ldrd >kt50=r8,<kt5_stack=[sp,#208]
ldrd r8,[sp,#208]

# qhasm: carry? x20 += k20
# asm 1: adds >x20=int32#3,<x20=int32#3,<k20=int32#11
# asm 2: adds >x20=r2,<x20=r2,<k20=r10
adds r2,r2,r10

# qhasm: x21 += k21 + carry
# asm 1: adc >x21=int32#4,<x21=int32#4,<k21=int32#12
# asm 2: adc >x21=r3,<x21=r3,<k21=r11
adc r3,r3,r11

# qhasm: assign r10 r11 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#11,<k7_stack=stack64#8
# asm 2: ldrd >k70=r10,<k7_stack=[sp,#56]
ldrd r10,[sp,#56]

# qhasm: carry? x50 += kt50
# asm 1: adds >x50=int32#5,<x50=int32#5,<kt50=int32#9
# asm 2: adds >x50=r4,<x50=r4,<kt50=r8
adds r4,r4,r8

# qhasm: x51 += kt51 + carry
# asm 1: adc >x51=int32#6,<x51=int32#6,<kt51=int32#10
# asm 2: adc >x51=r5,<x51=r5,<kt51=r9
adc r5,r5,r9

# qhasm: carry? x70 += k70
# asm 1: adds >x70=int32#7,<x70=int32#7,<k70=int32#11
# asm 2: adds >x70=r6,<x70=r6,<k70=r10
adds r6,r6,r10

# qhasm: x71 += k71 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,<k71=int32#12
# asm 2: adc >x71=r7,<x71=r7,<k71=r11
adc r7,r7,r11

# qhasm: carry? x70 += 18
# asm 1: adds >x70=int32#7,<x70=int32#7,#18
# asm 2: adds >x70=r6,<x70=r6,#18
adds r6,r6,#18

# qhasm: x71 += 0 + carry
# asm 1: adc >x71=int32#8,<x71=int32#8,#0
# asm 2: adc >x71=r7,<x71=r7,#0
adc r7,r7,#0

# qhasm: assign r0 r1 to x00 x01; x0_stack = x00 x01
# asm 1: strd <x00=int32#1,>x0_stack=stack64#1
# asm 2: strd <x00=r0,>x0_stack=[sp,#0]
strd r0,[sp,#0]

# qhasm: assign r2 r3 to x20 x21; x2_stack = x20 x21
# asm 1: strd <x20=int32#3,>x2_stack=stack64#3
# asm 2: strd <x20=r2,>x2_stack=[sp,#16]
strd r2,[sp,#16]

# qhasm: assign r4 r5 to x50 x51; x5_stack = x50 x51
# asm 1: strd <x50=int32#5,>x5_stack=stack64#6
# asm 2: strd <x50=r4,>x5_stack=[sp,#40]
strd r4,[sp,#40]

# qhasm: assign r6 r7 to x70 x71; x7_stack = x70 x71
# asm 1: strd <x70=int32#7,>x7_stack=stack64#7
# asm 2: strd <x70=r6,>x7_stack=[sp,#48]
strd r6,[sp,#48]

# qhasm: msg = msg_stack
# asm 1: ldr >msg=int32#9,<msg_stack=stack32#11
# asm 2: ldr >msg=r8,<msg_stack=[sp,#296]
ldr r8,[sp,#296]

# qhasm: assign r0 r1 to k00 k01 = x0_stack
# asm 1: ldrd >k00=int32#1,<x0_stack=stack64#1
# asm 2: ldrd >k00=r0,<x0_stack=[sp,#0]
ldrd r0,[sp,#0]

# qhasm: assign r2 r3 to k10 k11 = x1_stack
# asm 1: ldrd >k10=int32#3,<x1_stack=stack64#2
# asm 2: ldrd >k10=r2,<x1_stack=[sp,#8]
ldrd r2,[sp,#8]

# qhasm: assign r4 r5 to w00 w01 = mem64[msg + 0]
# asm 1: ldrd >w00=int32#5,[<msg=int32#9,#0]
# asm 2: ldrd >w00=r4,[<msg=r8,#0]
ldrd r4,[r8,#0]

# qhasm: assign r6 r7 to w10 w11 = mem64[msg + 8]
# asm 1: ldrd >w10=int32#7,[<msg=int32#9,#8]
# asm 2: ldrd >w10=r6,[<msg=r8,#8]
ldrd r6,[r8,#8]

# qhasm: k00 ^= w00
# asm 1: eor >k00=int32#1,<k00=int32#1,<w00=int32#5
# asm 2: eor >k00=r0,<k00=r0,<w00=r4
eor r0,r0,r4

# qhasm: k01 ^= w01
# asm 1: eor >k01=int32#2,<k01=int32#2,<w01=int32#6
# asm 2: eor >k01=r1,<k01=r1,<w01=r5
eor r1,r1,r5

# qhasm: k10 ^= w10
# asm 1: eor >k10=int32#3,<k10=int32#3,<w10=int32#7
# asm 2: eor >k10=r2,<k10=r2,<w10=r6
eor r2,r2,r6

# qhasm: k11 ^= w11
# asm 1: eor >k11=int32#4,<k11=int32#4,<w11=int32#8
# asm 2: eor >k11=r3,<k11=r3,<w11=r7
eor r3,r3,r7

# qhasm: assign r0 r1 to k00 k01; k0_stack = k00 k01
# asm 1: strd <k00=int32#1,>k0_stack=stack64#1
# asm 2: strd <k00=r0,>k0_stack=[sp,#0]
strd r0,[sp,#0]

# qhasm: assign r2 r3 to k10 k11; k1_stack = k10 k11
# asm 1: strd <k10=int32#3,>k1_stack=stack64#2
# asm 2: strd <k10=r2,>k1_stack=[sp,#8]
strd r2,[sp,#8]

# qhasm: assign r0 r1 to k20 k21 = x2_stack
# asm 1: ldrd >k20=int32#1,<x2_stack=stack64#3
# asm 2: ldrd >k20=r0,<x2_stack=[sp,#16]
ldrd r0,[sp,#16]

# qhasm: assign r2 r3 to k30 k31 = x3_stack
# asm 1: ldrd >k30=int32#3,<x3_stack=stack64#4
# asm 2: ldrd >k30=r2,<x3_stack=[sp,#24]
ldrd r2,[sp,#24]

# qhasm: assign r4 r5 to w20 w21 = mem64[msg + 16]
# asm 1: ldrd >w20=int32#5,[<msg=int32#9,#16]
# asm 2: ldrd >w20=r4,[<msg=r8,#16]
ldrd r4,[r8,#16]

# qhasm: assign r6 r7 to w30 w31 = mem64[msg + 24]
# asm 1: ldrd >w30=int32#7,[<msg=int32#9,#24]
# asm 2: ldrd >w30=r6,[<msg=r8,#24]
ldrd r6,[r8,#24]

# qhasm: k20 ^= w20
# asm 1: eor >k20=int32#1,<k20=int32#1,<w20=int32#5
# asm 2: eor >k20=r0,<k20=r0,<w20=r4
eor r0,r0,r4

# qhasm: k21 ^= w21
# asm 1: eor >k21=int32#2,<k21=int32#2,<w21=int32#6
# asm 2: eor >k21=r1,<k21=r1,<w21=r5
eor r1,r1,r5

# qhasm: k30 ^= w30
# asm 1: eor >k30=int32#3,<k30=int32#3,<w30=int32#7
# asm 2: eor >k30=r2,<k30=r2,<w30=r6
eor r2,r2,r6

# qhasm: k31 ^= w31
# asm 1: eor >k31=int32#4,<k31=int32#4,<w31=int32#8
# asm 2: eor >k31=r3,<k31=r3,<w31=r7
eor r3,r3,r7

# qhasm: assign r0 r1 to k20 k21; k2_stack = k20 k21
# asm 1: strd <k20=int32#1,>k2_stack=stack64#3
# asm 2: strd <k20=r0,>k2_stack=[sp,#16]
strd r0,[sp,#16]

# qhasm: assign r2 r3 to k30 k31; k3_stack = k30 k31
# asm 1: strd <k30=int32#3,>k3_stack=stack64#4
# asm 2: strd <k30=r2,>k3_stack=[sp,#24]
strd r2,[sp,#24]

# qhasm: assign r0 r1 to k40 k41 = x4_stack
# asm 1: ldrd >k40=int32#1,<x4_stack=stack64#5
# asm 2: ldrd >k40=r0,<x4_stack=[sp,#32]
ldrd r0,[sp,#32]

# qhasm: assign r2 r3 to k50 k51 = x5_stack
# asm 1: ldrd >k50=int32#3,<x5_stack=stack64#6
# asm 2: ldrd >k50=r2,<x5_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: assign r4 r5 to w40 w41 = mem64[msg + 32]
# asm 1: ldrd >w40=int32#5,[<msg=int32#9,#32]
# asm 2: ldrd >w40=r4,[<msg=r8,#32]
ldrd r4,[r8,#32]

# qhasm: assign r6 r7 to w50 w51 = mem64[msg + 40]
# asm 1: ldrd >w50=int32#7,[<msg=int32#9,#40]
# asm 2: ldrd >w50=r6,[<msg=r8,#40]
ldrd r6,[r8,#40]

# qhasm: k40 ^= w40
# asm 1: eor >k40=int32#1,<k40=int32#1,<w40=int32#5
# asm 2: eor >k40=r0,<k40=r0,<w40=r4
eor r0,r0,r4

# qhasm: k41 ^= w41
# asm 1: eor >k41=int32#2,<k41=int32#2,<w41=int32#6
# asm 2: eor >k41=r1,<k41=r1,<w41=r5
eor r1,r1,r5

# qhasm: k50 ^= w50
# asm 1: eor >k50=int32#3,<k50=int32#3,<w50=int32#7
# asm 2: eor >k50=r2,<k50=r2,<w50=r6
eor r2,r2,r6

# qhasm: k51 ^= w51
# asm 1: eor >k51=int32#4,<k51=int32#4,<w51=int32#8
# asm 2: eor >k51=r3,<k51=r3,<w51=r7
eor r3,r3,r7

# qhasm: assign r0 r1 to k40 k41; k4_stack = k40 k41
# asm 1: strd <k40=int32#1,>k4_stack=stack64#5
# asm 2: strd <k40=r0,>k4_stack=[sp,#32]
strd r0,[sp,#32]

# qhasm: assign r2 r3 to k50 k51; k5_stack = k50 k51
# asm 1: strd <k50=int32#3,>k5_stack=stack64#6
# asm 2: strd <k50=r2,>k5_stack=[sp,#40]
strd r2,[sp,#40]

# qhasm: assign r0 r1 to k60 k61 = x6_stack
# asm 1: ldrd >k60=int32#1,<x6_stack=stack64#14
# asm 2: ldrd >k60=r0,<x6_stack=[sp,#104]
ldrd r0,[sp,#104]

# qhasm: assign r2 r3 to k70 k71 = x7_stack
# asm 1: ldrd >k70=int32#3,<x7_stack=stack64#7
# asm 2: ldrd >k70=r2,<x7_stack=[sp,#48]
ldrd r2,[sp,#48]

# qhasm: assign r4 r5 to w60 w61 = mem64[msg + 48]
# asm 1: ldrd >w60=int32#5,[<msg=int32#9,#48]
# asm 2: ldrd >w60=r4,[<msg=r8,#48]
ldrd r4,[r8,#48]

# qhasm: assign r6 r7 to w70 w71 = mem64[msg + 56]
# asm 1: ldrd >w70=int32#7,[<msg=int32#9,#56]
# asm 2: ldrd >w70=r6,[<msg=r8,#56]
ldrd r6,[r8,#56]

# qhasm: k60 ^= w60
# asm 1: eor >k60=int32#1,<k60=int32#1,<w60=int32#5
# asm 2: eor >k60=r0,<k60=r0,<w60=r4
eor r0,r0,r4

# qhasm: k61 ^= w61
# asm 1: eor >k61=int32#2,<k61=int32#2,<w61=int32#6
# asm 2: eor >k61=r1,<k61=r1,<w61=r5
eor r1,r1,r5

# qhasm: k70 ^= w70
# asm 1: eor >k70=int32#3,<k70=int32#3,<w70=int32#7
# asm 2: eor >k70=r2,<k70=r2,<w70=r6
eor r2,r2,r6

# qhasm: k71 ^= w71
# asm 1: eor >k71=int32#4,<k71=int32#4,<w71=int32#8
# asm 2: eor >k71=r3,<k71=r3,<w71=r7
eor r3,r3,r7

# qhasm: assign r0 r1 to k60 k61; k6_stack = k60 k61
# asm 1: strd <k60=int32#1,>k6_stack=stack64#7
# asm 2: strd <k60=r0,>k6_stack=[sp,#48]
strd r0,[sp,#48]

# qhasm: assign r2 r3 to k70 k71; k7_stack = k70 k71
# asm 1: strd <k70=int32#3,>k7_stack=stack64#8
# asm 2: strd <k70=r2,>k7_stack=[sp,#56]
strd r2,[sp,#56]

# qhasm: msg += 64
# asm 1: add >msg=int32#1,<msg=int32#9,#64
# asm 2: add >msg=r0,<msg=r8,#64
add r0,r8,#64

# qhasm: msg_stack = msg
# asm 1: str <msg=int32#1,>msg_stack=stack32#11
# asm 2: str <msg=r0,>msg_stack=[sp,#296]
str r0,[sp,#296]

# qhasm: ctx = ctx_stack
# asm 1: ldr >ctx=int32#1,<ctx_stack=stack32#10
# asm 2: ldr >ctx=r0,<ctx_stack=[sp,#292]
ldr r0,[sp,#292]

# qhasm: assign r8 r9 to t00 t01 = t0_stack
# asm 1: ldrd >t00=int32#9,<t0_stack=stack64#11
# asm 2: ldrd >t00=r8,<t0_stack=[sp,#80]
ldrd r8,[sp,#80]

# qhasm: assign r10 r11 to t10 t11 = t1_stack
# asm 1: ldrd >t10=int32#11,<t1_stack=stack64#10
# asm 2: ldrd >t10=r10,<t1_stack=[sp,#72]
ldrd r10,[sp,#72]

# qhasm: t11 = 0x30000000
# asm 1: ldr >t11=int32#12,=0x30000000
# asm 2: ldr >t11=r11,=0x30000000
ldr r11,=0x30000000

# qhasm: blkCnt = blkCnt_stack
# asm 1: ldr >blkCnt=int32#2,<blkCnt_stack=stack32#12
# asm 2: ldr >blkCnt=r1,<blkCnt_stack=[sp,#300]
ldr r1,[sp,#300]

# qhasm: unsigned>? blkCnt -= 1
# asm 1: subs >blkCnt=int32#2,<blkCnt=int32#2,#1
# asm 2: subs >blkCnt=r1,<blkCnt=r1,#1
subs r1,r1,#1

# qhasm: blkCnt_stack = blkCnt
# asm 1: str <blkCnt=int32#2,>blkCnt_stack=stack32#12
# asm 2: str <blkCnt=r1,>blkCnt_stack=[sp,#300]
str r1,[sp,#300]

# qhasm: goto mainloop if !=
bne ._mainloop

# qhasm: ctx = ctx_stack
# asm 1: ldr >ctx=int32#13,<ctx_stack=stack32#10
# asm 2: ldr >ctx=r12,<ctx_stack=[sp,#292]
ldr r12,[sp,#292]

# qhasm: assign r8 r9 to t00 t01; mem64[ctx + 64] = t00 t01
# asm 1: strd <t00=int32#9,[<ctx=int32#13,#64]
# asm 2: strd <t00=r8,[<ctx=r12,#64]
strd r8,[r12,#64]

# qhasm: assign r10 r11 to t10 t11; mem64[ctx + 72] = t10 t11
# asm 1: strd <t10=int32#11,[<ctx=int32#13,#72]
# asm 2: strd <t10=r10,[<ctx=r12,#72]
strd r10,[r12,#72]

# qhasm: assign r0 r1 to k00 k01 = k0_stack
# asm 1: ldrd >k00=int32#1,<k0_stack=stack64#1
# asm 2: ldrd >k00=r0,<k0_stack=[sp,#0]
ldrd r0,[sp,#0]

# qhasm: assign r2 r3 to k10 k11 = k1_stack
# asm 1: ldrd >k10=int32#3,<k1_stack=stack64#2
# asm 2: ldrd >k10=r2,<k1_stack=[sp,#8]
ldrd r2,[sp,#8]

# qhasm: assign r4 r5 to k20 k21 = k2_stack
# asm 1: ldrd >k20=int32#5,<k2_stack=stack64#3
# asm 2: ldrd >k20=r4,<k2_stack=[sp,#16]
ldrd r4,[sp,#16]

# qhasm: assign r6 r7 to k30 k31 = k3_stack
# asm 1: ldrd >k30=int32#7,<k3_stack=stack64#4
# asm 2: ldrd >k30=r6,<k3_stack=[sp,#24]
ldrd r6,[sp,#24]

# qhasm: assign r0 r1 to k00 k01; mem64[ctx + 0] = k00 k01
# asm 1: strd <k00=int32#1,[<ctx=int32#13,#0]
# asm 2: strd <k00=r0,[<ctx=r12,#0]
strd r0,[r12,#0]

# qhasm: assign r2 r3 to k10 k11; mem64[ctx + 8] = k10 k11
# asm 1: strd <k10=int32#3,[<ctx=int32#13,#8]
# asm 2: strd <k10=r2,[<ctx=r12,#8]
strd r2,[r12,#8]

# qhasm: assign r4 r5 to k20 k21; mem64[ctx + 16] = k20 k21
# asm 1: strd <k20=int32#5,[<ctx=int32#13,#16]
# asm 2: strd <k20=r4,[<ctx=r12,#16]
strd r4,[r12,#16]

# qhasm: assign r6 r7 to k30 k31; mem64[ctx + 24] = k30 k31
# asm 1: strd <k30=int32#7,[<ctx=int32#13,#24]
# asm 2: strd <k30=r6,[<ctx=r12,#24]
strd r6,[r12,#24]

# qhasm: assign r0 r1 to k40 k41 = k4_stack
# asm 1: ldrd >k40=int32#1,<k4_stack=stack64#5
# asm 2: ldrd >k40=r0,<k4_stack=[sp,#32]
ldrd r0,[sp,#32]

# qhasm: assign r2 r3 to k50 k51 = k5_stack
# asm 1: ldrd >k50=int32#3,<k5_stack=stack64#6
# asm 2: ldrd >k50=r2,<k5_stack=[sp,#40]
ldrd r2,[sp,#40]

# qhasm: assign r4 r5 to k60 k61 = k6_stack
# asm 1: ldrd >k60=int32#5,<k6_stack=stack64#7
# asm 2: ldrd >k60=r4,<k6_stack=[sp,#48]
ldrd r4,[sp,#48]

# qhasm: assign r6 r7 to k70 k71 = k7_stack
# asm 1: ldrd >k70=int32#7,<k7_stack=stack64#8
# asm 2: ldrd >k70=r6,<k7_stack=[sp,#56]
ldrd r6,[sp,#56]

# qhasm: assign r0 r1 to k40 k41; mem64[ctx + 32] = k40 k41
# asm 1: strd <k40=int32#1,[<ctx=int32#13,#32]
# asm 2: strd <k40=r0,[<ctx=r12,#32]
strd r0,[r12,#32]

# qhasm: assign r2 r3 to k50 k51; mem64[ctx + 40] = k50 k51
# asm 1: strd <k50=int32#3,[<ctx=int32#13,#40]
# asm 2: strd <k50=r2,[<ctx=r12,#40]
strd r2,[r12,#40]

# qhasm: assign r4 r5 to k60 k61; mem64[ctx + 48] = k60 k61
# asm 1: strd <k60=int32#5,[<ctx=int32#13,#48]
# asm 2: strd <k60=r4,[<ctx=r12,#48]
strd r4,[r12,#48]

# qhasm: assign r6 r7 to k70 k71; mem64[ctx + 56] = k70 k71
# asm 1: strd <k70=int32#7,[<ctx=int32#13,#56]
# asm 2: strd <k70=r6,[<ctx=r12,#56]
strd r6,[r12,#56]

# qhasm: caller_r4 = caller_r4_stack
# asm 1: ldr >caller_r4=int32#5,<caller_r4_stack=stack32#1
# asm 2: ldr >caller_r4=r4,<caller_r4_stack=[sp,#256]
ldr r4,[sp,#256]

# qhasm: caller_r5 = caller_r5_stack
# asm 1: ldr >caller_r5=int32#6,<caller_r5_stack=stack32#2
# asm 2: ldr >caller_r5=r5,<caller_r5_stack=[sp,#260]
ldr r5,[sp,#260]

# qhasm: caller_r6 = caller_r6_stack
# asm 1: ldr >caller_r6=int32#7,<caller_r6_stack=stack32#3
# asm 2: ldr >caller_r6=r6,<caller_r6_stack=[sp,#264]
ldr r6,[sp,#264]

# qhasm: caller_r7 = caller_r7_stack
# asm 1: ldr >caller_r7=int32#8,<caller_r7_stack=stack32#4
# asm 2: ldr >caller_r7=r7,<caller_r7_stack=[sp,#268]
ldr r7,[sp,#268]

# qhasm: caller_r8 = caller_r8_stack
# asm 1: ldr >caller_r8=int32#9,<caller_r8_stack=stack32#5
# asm 2: ldr >caller_r8=r8,<caller_r8_stack=[sp,#272]
ldr r8,[sp,#272]

# qhasm: caller_r9 = caller_r9_stack
# asm 1: ldr >caller_r9=int32#10,<caller_r9_stack=stack32#6
# asm 2: ldr >caller_r9=r9,<caller_r9_stack=[sp,#276]
ldr r9,[sp,#276]

# qhasm: caller_r10 = caller_r10_stack
# asm 1: ldr >caller_r10=int32#11,<caller_r10_stack=stack32#7
# asm 2: ldr >caller_r10=r10,<caller_r10_stack=[sp,#280]
ldr r10,[sp,#280]

# qhasm: caller_r11 = caller_r11_stack
# asm 1: ldr >caller_r11=int32#12,<caller_r11_stack=stack32#8
# asm 2: ldr >caller_r11=r11,<caller_r11_stack=[sp,#284]
ldr r11,[sp,#284]

# qhasm: caller_r14 = caller_r14_stack
# asm 1: ldr >caller_r14=int32#14,<caller_r14_stack=stack32#9
# asm 2: ldr >caller_r14=r14,<caller_r14_stack=[sp,#288]
ldr r14,[sp,#288]

# qhasm: return
add sp,sp,#320
bx lr

# qhasm: loadconst:
._loadconst:

# qhasm: const0 = 0xA9FC1A22
# asm 1: ldr >const0=int32#1,=0xA9FC1A22
# asm 2: ldr >const0=r0,=0xA9FC1A22
ldr r0,=0xA9FC1A22

# qhasm: const1 = 0x1BD11BDA
# asm 1: ldr >const1=int32#2,=0x1BD11BDA
# asm 2: ldr >const1=r1,=0x1BD11BDA
ldr r1,=0x1BD11BDA

# qhasm: assign r0 r1 to const0 const1; const_stack = const0 const1
# asm 1: strd <const0=int32#1,>const_stack=stack64#9
# asm 2: strd <const0=r0,>const_stack=[sp,#64]
strd r0,[sp,#64]

# qhasm: goto mainloop
b ._mainloop
