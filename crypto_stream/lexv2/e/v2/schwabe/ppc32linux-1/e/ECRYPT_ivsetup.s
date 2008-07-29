
# qhasm: int32 ctxp

# qhasm: int32 iv_plainp

# qhasm: input ctxp

# qhasm: input iv_plainp

# qhasm: int32 constants

# qhasm: int32 constants_low

# qhasm: int32 tx0

# qhasm: int32 tx1

# qhasm: int32 tx2

# qhasm: int32 tx3

# qhasm: int32 sx0

# qhasm: int32 sx1

# qhasm: int32 sx2

# qhasm: int32 sx3

# qhasm: int32 table0

# qhasm: int32 table1

# qhasm: int32 table2

# qhasm: int32 table3

# qhasm: int32 d0

# qhasm: int32 d1

# qhasm: int32 d2

# qhasm: int32 d3

# qhasm: int32 n0

# qhasm: int32 n1

# qhasm: int32 n2

# qhasm: int32 n3

# qhasm: int32 in0

# qhasm: int32 in1

# qhasm: int32 in2

# qhasm: int32 in3

# qhasm: int32 tmp0 

# qhasm: int32 key

# qhasm: int32 inint

# qhasm: int32 outint

# qhasm: int32 y0

# qhasm: int32 y1

# qhasm: int32 y2

# qhasm: int32 y3

# qhasm: int32 z0

# qhasm: int32 z1

# qhasm: int32 z2

# qhasm: int32 z3

# qhasm: int32 p00

# qhasm: int32 p01

# qhasm: int32 p02

# qhasm: int32 p03

# qhasm: int32 p10

# qhasm: int32 p11

# qhasm: int32 p12

# qhasm: int32 p13

# qhasm: int32 p20

# qhasm: int32 p21

# qhasm: int32 p22

# qhasm: int32 p23

# qhasm: int32 p30

# qhasm: int32 p31

# qhasm: int32 p32

# qhasm: int32 p33

# qhasm: stack32 x0

# qhasm: stack32 x1

# qhasm: stack32 x2

# qhasm: stack32 x3

# qhasm: stack32 x4

# qhasm: stack32 x5

# qhasm: stack32 x6

# qhasm: stack32 x7

# qhasm: stack32 x8

# qhasm: stack32 x9

# qhasm: stack32 x10

# qhasm: stack32 x11

# qhasm: stack32 x12

# qhasm: stack32 x13

# qhasm: stack32 x14

# qhasm: stack32 x15

# qhasm: stack32 x16

# qhasm: stack32 x17

# qhasm: stack32 x18

# qhasm: stack32 x19

# qhasm: stack32 x20

# qhasm: stack32 x21

# qhasm: stack32 x22

# qhasm: stack32 x23

# qhasm: stack32 x24

# qhasm: stack32 x25

# qhasm: stack32 x26

# qhasm: stack32 x27

# qhasm: stack32 x28

# qhasm: stack32 x29

# qhasm: stack32 x30

# qhasm: stack32 x31

# qhasm: stack32 x32

# qhasm: stack32 x33

# qhasm: stack32 x34

# qhasm: stack32 x35

# qhasm: stack32 x36

# qhasm: stack32 x37

# qhasm: stack32 x38

# qhasm: stack32 x39

# qhasm: stack32 x40

# qhasm: stack32 x41

# qhasm: stack32 x42

# qhasm: stack32 x43

# qhasm: stack32 inp_stack

# qhasm: stack32 outp_stack

# qhasm: stack32 length_stack

# qhasm: int32 i12

# qhasm: int32 i13

# qhasm: int32 i14

# qhasm: int32 i15

# qhasm: int32 i16

# qhasm: int32 i17

# qhasm: int32 i18

# qhasm: int32 i19

# qhasm: int32 i20

# qhasm: int32 i21

# qhasm: int32 i22

# qhasm: int32 i23

# qhasm: int32 i24

# qhasm: int32 i25

# qhasm: int32 i26

# qhasm: int32 i27

# qhasm: int32 i28

# qhasm: int32 i29

# qhasm: caller i12

# qhasm: caller i13

# qhasm: caller i14

# qhasm: caller i15

# qhasm: caller i16

# qhasm: caller i17

# qhasm: caller i18

# qhasm: caller i19

# qhasm: caller i20

# qhasm: caller i21

# qhasm: caller i22

# qhasm: caller i23

# qhasm: caller i24

# qhasm: caller i25

# qhasm: caller i26

# qhasm: caller i27

# qhasm: caller i28

# qhasm: caller i29

# qhasm: stack32 i12_stack

# qhasm: stack32 i13_stack

# qhasm: stack32 i14_stack

# qhasm: stack32 i15_stack

# qhasm: stack32 i16_stack

# qhasm: stack32 i17_stack

# qhasm: stack32 i18_stack

# qhasm: stack32 i19_stack

# qhasm: stack32 i20_stack

# qhasm: stack32 i21_stack

# qhasm: stack32 i22_stack

# qhasm: stack32 i23_stack

# qhasm: stack32 i24_stack

# qhasm: stack32 i25_stack

# qhasm: stack32 i26_stack

# qhasm: stack32 i27_stack

# qhasm: stack32 i28_stack

# qhasm: stack32 i29_stack

# qhasm: enter ECRYPT_ivsetup_qhasm
.text
.align 3
.globl _ECRYPT_ivsetup_qhasm
.globl ECRYPT_ivsetup_qhasm
_ECRYPT_ivsetup_qhasm:
ECRYPT_ivsetup_qhasm:
stwu 1,-384(1)

# qhasm: i12_stack = i12
# asm 1: stw <i12=int32#12,>i12_stack=stack32#1
# asm 2: stw <i12=14,>i12_stack=0(1)
stw 14,0(1)

# qhasm: i13_stack = i13
# asm 1: stw <i13=int32#13,>i13_stack=stack32#2
# asm 2: stw <i13=15,>i13_stack=4(1)
stw 15,4(1)

# qhasm: i14_stack = i14
# asm 1: stw <i14=int32#14,>i14_stack=stack32#3
# asm 2: stw <i14=16,>i14_stack=8(1)
stw 16,8(1)

# qhasm: i15_stack = i15
# asm 1: stw <i15=int32#15,>i15_stack=stack32#4
# asm 2: stw <i15=17,>i15_stack=12(1)
stw 17,12(1)

# qhasm: i16_stack = i16
# asm 1: stw <i16=int32#16,>i16_stack=stack32#5
# asm 2: stw <i16=18,>i16_stack=16(1)
stw 18,16(1)

# qhasm: i17_stack = i17
# asm 1: stw <i17=int32#17,>i17_stack=stack32#6
# asm 2: stw <i17=19,>i17_stack=20(1)
stw 19,20(1)

# qhasm: i18_stack = i18
# asm 1: stw <i18=int32#18,>i18_stack=stack32#7
# asm 2: stw <i18=20,>i18_stack=24(1)
stw 20,24(1)

# qhasm: i19_stack = i19
# asm 1: stw <i19=int32#19,>i19_stack=stack32#8
# asm 2: stw <i19=21,>i19_stack=28(1)
stw 21,28(1)

# qhasm: i20_stack = i20
# asm 1: stw <i20=int32#20,>i20_stack=stack32#9
# asm 2: stw <i20=22,>i20_stack=32(1)
stw 22,32(1)

# qhasm: i21_stack = i21
# asm 1: stw <i21=int32#21,>i21_stack=stack32#10
# asm 2: stw <i21=23,>i21_stack=36(1)
stw 23,36(1)

# qhasm: i22_stack = i22
# asm 1: stw <i22=int32#22,>i22_stack=stack32#11
# asm 2: stw <i22=24,>i22_stack=40(1)
stw 24,40(1)

# qhasm: i23_stack = i23
# asm 1: stw <i23=int32#23,>i23_stack=stack32#12
# asm 2: stw <i23=25,>i23_stack=44(1)
stw 25,44(1)

# qhasm: i24_stack = i24
# asm 1: stw <i24=int32#24,>i24_stack=stack32#13
# asm 2: stw <i24=26,>i24_stack=48(1)
stw 26,48(1)

# qhasm: i25_stack = i25
# asm 1: stw <i25=int32#25,>i25_stack=stack32#14
# asm 2: stw <i25=27,>i25_stack=52(1)
stw 27,52(1)

# qhasm: i26_stack = i26
# asm 1: stw <i26=int32#26,>i26_stack=stack32#15
# asm 2: stw <i26=28,>i26_stack=56(1)
stw 28,56(1)

# qhasm: i27_stack = i27
# asm 1: stw <i27=int32#27,>i27_stack=stack32#16
# asm 2: stw <i27=29,>i27_stack=60(1)
stw 29,60(1)

# qhasm: i28_stack = i28
# asm 1: stw <i28=int32#28,>i28_stack=stack32#17
# asm 2: stw <i28=30,>i28_stack=64(1)
stw 30,64(1)

# qhasm: i29_stack = i29
# asm 1: stw <i29=int32#29,>i29_stack=stack32#18
# asm 2: stw <i29=31,>i29_stack=68(1)
stw 31,68(1)

# qhasm: constants = &aes_big_constants & 0xffff0000
# asm 1: lis >constants=int32#3,aes_big_constants@h
# asm 2: lis >constants=5,aes_big_constants@h
lis 5,aes_big_constants@h

# qhasm: constants |= &aes_big_constants & 0xffff
# asm 1: ori >constants=int32#3,<constants=int32#3,aes_big_constants@l
# asm 2: ori >constants=5,<constants=5,aes_big_constants@l
ori 5,5,aes_big_constants@l

# qhasm: table0 = constants
# asm 1: mr >table0=int32#4,<constants=int32#3
# asm 2: mr >table0=6,<constants=5
mr 6,5

# qhasm: table0 += 40
# asm 1: addi >table0=int32#4,<table0=int32#4,40
# asm 2: addi >table0=6,<table0=6,40
addi 6,6,40

# qhasm: table1 = constants
# asm 1: mr >table1=int32#5,<constants=int32#3
# asm 2: mr >table1=7,<constants=5
mr 7,5

# qhasm: table1 += 48
# asm 1: addi >table1=int32#5,<table1=int32#5,48
# asm 2: addi >table1=7,<table1=7,48
addi 7,7,48

# qhasm: table2 = constants
# asm 1: mr >table2=int32#6,<constants=int32#3
# asm 2: mr >table2=8,<constants=5
mr 8,5

# qhasm: table2 += 44
# asm 1: addi >table2=int32#6,<table2=int32#6,44
# asm 2: addi >table2=8,<table2=8,44
addi 8,8,44

# qhasm: table3 = constants
# asm 1: mr >table3=int32#3,<constants=int32#3
# asm 2: mr >table3=5,<constants=5
mr 5,5

# qhasm: table3 += 52
# asm 1: addi >table3=int32#3,<table3=int32#3,52
# asm 2: addi >table3=5,<table3=5,52
addi 5,5,52

# qhasm: tx0 = *(uint32 *) (ctxp + 0) 
# asm 1: lwz >tx0=int32#7,0(<ctxp=int32#1)
# asm 2: lwz >tx0=9,0(<ctxp=3)
lwz 9,0(3)

# qhasm: tx1 = *(uint32 *) (ctxp + 4) 
# asm 1: lwz >tx1=int32#8,4(<ctxp=int32#1)
# asm 2: lwz >tx1=10,4(<ctxp=3)
lwz 10,4(3)

# qhasm: tx2 = *(uint32 *) (ctxp + 8) 
# asm 1: lwz >tx2=int32#9,8(<ctxp=int32#1)
# asm 2: lwz >tx2=11,8(<ctxp=3)
lwz 11,8(3)

# qhasm: tx3 = *(uint32 *) (ctxp + 12)
# asm 1: lwz >tx3=int32#10,12(<ctxp=int32#1)
# asm 2: lwz >tx3=12,12(<ctxp=3)
lwz 12,12(3)

# qhasm: x0 = tx0
# asm 1: stw <tx0=int32#7,>x0=stack32#19
# asm 2: stw <tx0=9,>x0=72(1)
stw 9,72(1)

# qhasm: x1 = tx1
# asm 1: stw <tx1=int32#8,>x1=stack32#20
# asm 2: stw <tx1=10,>x1=76(1)
stw 10,76(1)

# qhasm: x2 = tx2
# asm 1: stw <tx2=int32#9,>x2=stack32#21
# asm 2: stw <tx2=11,>x2=80(1)
stw 11,80(1)

# qhasm: x3 = tx3
# asm 1: stw <tx3=int32#10,>x3=stack32#22
# asm 2: stw <tx3=12,>x3=84(1)
stw 12,84(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 16)
# asm 1: lwz >tx0=int32#7,16(<ctxp=int32#1)
# asm 2: lwz >tx0=9,16(<ctxp=3)
lwz 9,16(3)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x4  = tx0 
# asm 1: stw <tx0=int32#7,>x4=stack32#23
# asm 2: stw <tx0=9,>x4=88(1)
stw 9,88(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 20) 
# asm 1: lwz >tx0=int32#7,20(<ctxp=int32#1)
# asm 2: lwz >tx0=9,20(<ctxp=3)
lwz 9,20(3)

# qhasm: x5  = tx1 
# asm 1: stw <tx1=int32#8,>x5=stack32#24
# asm 2: stw <tx1=10,>x5=92(1)
stw 10,92(1)

# qhasm: x6  = tx2 
# asm 1: stw <tx2=int32#9,>x6=stack32#25
# asm 2: stw <tx2=11,>x6=96(1)
stw 11,96(1)

# qhasm: x7  = tx3 
# asm 1: stw <tx3=int32#10,>x7=stack32#26
# asm 2: stw <tx3=12,>x7=100(1)
stw 12,100(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x8  = tx0 
# asm 1: stw <tx0=int32#7,>x8=stack32#27
# asm 2: stw <tx0=9,>x8=104(1)
stw 9,104(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 24) 
# asm 1: lwz >tx0=int32#7,24(<ctxp=int32#1)
# asm 2: lwz >tx0=9,24(<ctxp=3)
lwz 9,24(3)

# qhasm: x9  = tx1
# asm 1: stw <tx1=int32#8,>x9=stack32#28
# asm 2: stw <tx1=10,>x9=108(1)
stw 10,108(1)

# qhasm: x10  = tx2 
# asm 1: stw <tx2=int32#9,>x10=stack32#29
# asm 2: stw <tx2=11,>x10=112(1)
stw 11,112(1)

# qhasm: x11  = tx3 
# asm 1: stw <tx3=int32#10,>x11=stack32#30
# asm 2: stw <tx3=12,>x11=116(1)
stw 12,116(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x12  = tx0 
# asm 1: stw <tx0=int32#7,>x12=stack32#31
# asm 2: stw <tx0=9,>x12=120(1)
stw 9,120(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 28) 
# asm 1: lwz >tx0=int32#7,28(<ctxp=int32#1)
# asm 2: lwz >tx0=9,28(<ctxp=3)
lwz 9,28(3)

# qhasm: x13  = tx1
# asm 1: stw <tx1=int32#8,>x13=stack32#32
# asm 2: stw <tx1=10,>x13=124(1)
stw 10,124(1)

# qhasm: x14  = tx2 
# asm 1: stw <tx2=int32#9,>x14=stack32#33
# asm 2: stw <tx2=11,>x14=128(1)
stw 11,128(1)

# qhasm: x15  = tx3 
# asm 1: stw <tx3=int32#10,>x15=stack32#34
# asm 2: stw <tx3=12,>x15=132(1)
stw 12,132(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x16  = tx0 
# asm 1: stw <tx0=int32#7,>x16=stack32#35
# asm 2: stw <tx0=9,>x16=136(1)
stw 9,136(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 32) 
# asm 1: lwz >tx0=int32#7,32(<ctxp=int32#1)
# asm 2: lwz >tx0=9,32(<ctxp=3)
lwz 9,32(3)

# qhasm: x17  = tx1
# asm 1: stw <tx1=int32#8,>x17=stack32#36
# asm 2: stw <tx1=10,>x17=140(1)
stw 10,140(1)

# qhasm: x18  = tx2 
# asm 1: stw <tx2=int32#9,>x18=stack32#37
# asm 2: stw <tx2=11,>x18=144(1)
stw 11,144(1)

# qhasm: x19  = tx3 
# asm 1: stw <tx3=int32#10,>x19=stack32#38
# asm 2: stw <tx3=12,>x19=148(1)
stw 12,148(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x20  = tx0 
# asm 1: stw <tx0=int32#7,>x20=stack32#39
# asm 2: stw <tx0=9,>x20=152(1)
stw 9,152(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 36) 
# asm 1: lwz >tx0=int32#7,36(<ctxp=int32#1)
# asm 2: lwz >tx0=9,36(<ctxp=3)
lwz 9,36(3)

# qhasm: x21  = tx1
# asm 1: stw <tx1=int32#8,>x21=stack32#40
# asm 2: stw <tx1=10,>x21=156(1)
stw 10,156(1)

# qhasm: x22  = tx2 
# asm 1: stw <tx2=int32#9,>x22=stack32#41
# asm 2: stw <tx2=11,>x22=160(1)
stw 11,160(1)

# qhasm: x23  = tx3 
# asm 1: stw <tx3=int32#10,>x23=stack32#42
# asm 2: stw <tx3=12,>x23=164(1)
stw 12,164(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x24  = tx0 
# asm 1: stw <tx0=int32#7,>x24=stack32#43
# asm 2: stw <tx0=9,>x24=168(1)
stw 9,168(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 40) 
# asm 1: lwz >tx0=int32#7,40(<ctxp=int32#1)
# asm 2: lwz >tx0=9,40(<ctxp=3)
lwz 9,40(3)

# qhasm: x25  = tx1
# asm 1: stw <tx1=int32#8,>x25=stack32#44
# asm 2: stw <tx1=10,>x25=172(1)
stw 10,172(1)

# qhasm: x26  = tx2 
# asm 1: stw <tx2=int32#9,>x26=stack32#45
# asm 2: stw <tx2=11,>x26=176(1)
stw 11,176(1)

# qhasm: x27  = tx3 
# asm 1: stw <tx3=int32#10,>x27=stack32#46
# asm 2: stw <tx3=12,>x27=180(1)
stw 12,180(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x28  = tx0 
# asm 1: stw <tx0=int32#7,>x28=stack32#47
# asm 2: stw <tx0=9,>x28=184(1)
stw 9,184(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 44) 
# asm 1: lwz >tx0=int32#7,44(<ctxp=int32#1)
# asm 2: lwz >tx0=9,44(<ctxp=3)
lwz 9,44(3)

# qhasm: x29  = tx1
# asm 1: stw <tx1=int32#8,>x29=stack32#48
# asm 2: stw <tx1=10,>x29=188(1)
stw 10,188(1)

# qhasm: x30  = tx2 
# asm 1: stw <tx2=int32#9,>x30=stack32#49
# asm 2: stw <tx2=11,>x30=192(1)
stw 11,192(1)

# qhasm: x31  = tx3 
# asm 1: stw <tx3=int32#10,>x31=stack32#50
# asm 2: stw <tx3=12,>x31=196(1)
stw 12,196(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x32  = tx0 
# asm 1: stw <tx0=int32#7,>x32=stack32#51
# asm 2: stw <tx0=9,>x32=200(1)
stw 9,200(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 48) 
# asm 1: lwz >tx0=int32#7,48(<ctxp=int32#1)
# asm 2: lwz >tx0=9,48(<ctxp=3)
lwz 9,48(3)

# qhasm: x33  = tx1
# asm 1: stw <tx1=int32#8,>x33=stack32#52
# asm 2: stw <tx1=10,>x33=204(1)
stw 10,204(1)

# qhasm: x34  = tx2 
# asm 1: stw <tx2=int32#9,>x34=stack32#53
# asm 2: stw <tx2=11,>x34=208(1)
stw 11,208(1)

# qhasm: x35  = tx3 
# asm 1: stw <tx3=int32#10,>x35=stack32#54
# asm 2: stw <tx3=12,>x35=212(1)
stw 12,212(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x36  = tx0 
# asm 1: stw <tx0=int32#7,>x36=stack32#55
# asm 2: stw <tx0=9,>x36=216(1)
stw 9,216(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 52) 
# asm 1: lwz >tx0=int32#7,52(<ctxp=int32#1)
# asm 2: lwz >tx0=9,52(<ctxp=3)
lwz 9,52(3)

# qhasm: x37  = tx1
# asm 1: stw <tx1=int32#8,>x37=stack32#56
# asm 2: stw <tx1=10,>x37=220(1)
stw 10,220(1)

# qhasm: x38  = tx2 
# asm 1: stw <tx2=int32#9,>x38=stack32#57
# asm 2: stw <tx2=11,>x38=224(1)
stw 11,224(1)

# qhasm: x39  = tx3 
# asm 1: stw <tx3=int32#10,>x39=stack32#58
# asm 2: stw <tx3=12,>x39=228(1)
stw 12,228(1)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#8,<tx0=int32#7,<tx1=int32#8
# asm 2: xor >tx1=10,<tx0=9,<tx1=10
xor 10,9,10

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#9,<tx1=int32#8,<tx2=int32#9
# asm 2: xor >tx2=11,<tx1=10,<tx2=11
xor 11,10,11

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#10,<tx2=int32#9,<tx3=int32#10
# asm 2: xor >tx3=12,<tx2=11,<tx3=12
xor 12,11,12

# qhasm: x40  = tx0 
# asm 1: stw <tx0=int32#7,>x40=stack32#59
# asm 2: stw <tx0=9,>x40=232(1)
stw 9,232(1)

# qhasm: x41  = tx1
# asm 1: stw <tx1=int32#8,>x41=stack32#60
# asm 2: stw <tx1=10,>x41=236(1)
stw 10,236(1)

# qhasm: x42  = tx2 
# asm 1: stw <tx2=int32#9,>x42=stack32#61
# asm 2: stw <tx2=11,>x42=240(1)
stw 11,240(1)

# qhasm: x43  = tx3 
# asm 1: stw <tx3=int32#10,>x43=stack32#62
# asm 2: stw <tx3=12,>x43=244(1)
stw 12,244(1)

# qhasm: y0 = *(swapendian uint32 *) iv_plainp
# asm 1: lwbrx >y0=int32#7,0,<iv_plainp=int32#2
# asm 2: lwbrx >y0=9,0,<iv_plainp=4
lwbrx 9,0,4

# qhasm: iv_plainp += 4
# asm 1: addi >iv_plainp=int32#2,<iv_plainp=int32#2,4
# asm 2: addi >iv_plainp=4,<iv_plainp=4,4
addi 4,4,4

# qhasm: y1 = *(swapendian uint32 *) iv_plainp
# asm 1: lwbrx >y1=int32#8,0,<iv_plainp=int32#2
# asm 2: lwbrx >y1=10,0,<iv_plainp=4
lwbrx 10,0,4

# qhasm: iv_plainp += 4
# asm 1: addi >iv_plainp=int32#2,<iv_plainp=int32#2,4
# asm 2: addi >iv_plainp=4,<iv_plainp=4,4
addi 4,4,4

# qhasm: y2 = *(swapendian uint32 *) iv_plainp
# asm 1: lwbrx >y2=int32#9,0,<iv_plainp=int32#2
# asm 2: lwbrx >y2=11,0,<iv_plainp=4
lwbrx 11,0,4

# qhasm: iv_plainp += 4
# asm 1: addi >iv_plainp=int32#2,<iv_plainp=int32#2,4
# asm 2: addi >iv_plainp=4,<iv_plainp=4,4
addi 4,4,4

# qhasm: y3 = *(swapendian uint32 *) iv_plainp
# asm 1: lwbrx >y3=int32#2,0,<iv_plainp=int32#2
# asm 2: lwbrx >y3=4,0,<iv_plainp=4
lwbrx 4,0,4

# qhasm: tx0 = x0
# asm 1: lwz >tx0=int32#10,<x0=stack32#19
# asm 2: lwz >tx0=12,<x0=72(1)
lwz 12,72(1)

# qhasm: tx1 = x1
# asm 1: lwz >tx1=int32#11,<x1=stack32#20
# asm 2: lwz >tx1=13,<x1=76(1)
lwz 13,76(1)

# qhasm: tx2 = x2
# asm 1: lwz >tx2=int32#12,<x2=stack32#21
# asm 2: lwz >tx2=14,<x2=80(1)
lwz 14,80(1)

# qhasm: tx3 = x3
# asm 1: lwz >tx3=int32#13,<x3=stack32#22
# asm 2: lwz >tx3=15,<x3=84(1)
lwz 15,84(1)

# qhasm: y0 ^= tx0
# asm 1: xor >y0=int32#7,<tx0=int32#10,<y0=int32#7
# asm 2: xor >y0=9,<tx0=12,<y0=9
xor 9,12,9

# qhasm: y1 ^= tx1
# asm 1: xor >y1=int32#8,<tx1=int32#11,<y1=int32#8
# asm 2: xor >y1=10,<tx1=13,<y1=10
xor 10,13,10

# qhasm: y2 ^= tx2
# asm 1: xor >y2=int32#9,<tx2=int32#12,<y2=int32#9
# asm 2: xor >y2=11,<tx2=14,<y2=11
xor 11,14,11

# qhasm: y3 ^= tx3
# asm 1: xor >y3=int32#2,<tx3=int32#13,<y3=int32#2
# asm 2: xor >y3=4,<tx3=15,<y3=4
xor 4,15,4

# qhasm: z0 = x4
# asm 1: lwz >z0=int32#10,<x4=stack32#23
# asm 2: lwz >z0=12,<x4=88(1)
lwz 12,88(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#7,12,4080
# asm 2: rlwinm >p00=13,<y0=9,12,4080
rlwinm 13,9,12,4080

# qhasm: z1 = x5
# asm 1: lwz >z1=int32#12,<x5=stack32#24
# asm 2: lwz >z1=14,<x5=92(1)
lwz 14,92(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#7,20,4080
# asm 2: rlwinm >p01=15,<y0=9,20,4080
rlwinm 15,9,20,4080

# qhasm: z2 = x6
# asm 1: lwz >z2=int32#14,<x6=stack32#25
# asm 2: lwz >z2=16,<x6=96(1)
lwz 16,96(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#7,28,4080
# asm 2: rlwinm >p02=17,<y0=9,28,4080
rlwinm 17,9,28,4080

# qhasm: z3 = x7
# asm 1: lwz >z3=int32#16,<x7=stack32#26
# asm 2: lwz >z3=18,<x7=100(1)
lwz 18,100(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#7,<y0=int32#7,4,4080
# asm 2: rlwinm >p03=9,<y0=9,4,4080
rlwinm 9,9,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#8,12,4080
# asm 2: rlwinm >p10=19,<y1=10,12,4080
rlwinm 19,10,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#8,20,4080
# asm 2: rlwinm >p11=20,<y1=10,20,4080
rlwinm 20,10,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#8,28,4080
# asm 2: rlwinm >p12=21,<y1=10,28,4080
rlwinm 21,10,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#7,<table3=int32#3,<p03=int32#7
# asm 2: lwzx >p03=9,<table3=5,<p03=9
lwzx 9,5,9

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#8,<y1=int32#8,4,4080
# asm 2: rlwinm >p13=10,<y1=10,4,4080
rlwinm 10,10,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#7,<p03=int32#7,<z1=int32#12
# asm 2: xor >z1=9,<p03=9,<z1=14
xor 9,9,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#9,12,4080
# asm 2: rlwinm >p20=16,<y2=11,12,4080
rlwinm 16,11,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#9,20,4080
# asm 2: rlwinm >p21=18,<y2=11,20,4080
rlwinm 18,11,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#9,28,4080
# asm 2: rlwinm >p22=20,<y2=11,28,4080
rlwinm 20,11,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#8,<table3=int32#3,<p13=int32#8
# asm 2: lwzx >p13=10,<table3=5,<p13=10
lwzx 10,5,10

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#9,<y2=int32#9,4,4080
# asm 2: rlwinm >p23=11,<y2=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#7,<p10=int32#12,<z1=int32#7
# asm 2: xor >z1=9,<p10=14,<z1=9
xor 9,14,9

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#8,<p13=int32#8,<z2=int32#13
# asm 2: xor >z2=10,<p13=10,<z2=15
xor 10,10,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#2,12,4080
# asm 2: rlwinm >p30=15,<y3=4,12,4080
rlwinm 15,4,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#2,20,4080
# asm 2: rlwinm >p31=17,<y3=4,20,4080
rlwinm 17,4,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#2,28,4080
# asm 2: rlwinm >p32=19,<y3=4,28,4080
rlwinm 19,4,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#9,<table3=int32#3,<p23=int32#9
# asm 2: lwzx >p23=11,<table3=5,<p23=11
lwzx 11,5,11

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#2,<y3=int32#2,4,4080
# asm 2: rlwinm >p33=4,<y3=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#8,<p20=int32#12,<z2=int32#8
# asm 2: xor >z2=10,<p20=14,<z2=10
xor 10,14,10

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#7,<p21=int32#14,<z1=int32#7
# asm 2: xor >z1=9,<p21=16,<z1=9
xor 9,16,9

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#2,<table3=int32#3,<p33=int32#2
# asm 2: lwzx >p33=4,<table3=5,<p33=4
lwzx 4,5,4

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#9,<p23=int32#9,<z3=int32#11
# asm 2: xor >z3=11,<p23=11,<z3=13
xor 11,11,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#8,<z2=int32#8,<p31=int32#12
# asm 2: xor >y2=10,<z2=10,<p31=14
xor 10,10,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#7,<z1=int32#7,<p32=int32#14
# asm 2: xor >y1=9,<z1=9,<p32=16
xor 9,9,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#2,<z0=int32#10,<p33=int32#2
# asm 2: xor >y0=4,<z0=12,<p33=4
xor 4,12,4

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#9,<z3=int32#9,<p30=int32#13
# asm 2: xor >y3=11,<z3=11,<p30=15
xor 11,11,15

# qhasm: z0 = x8
# asm 1: lwz >z0=int32#10,<x8=stack32#27
# asm 2: lwz >z0=12,<x8=104(1)
lwz 12,104(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=13,<y0=4,12,4080
rlwinm 13,4,12,4080

# qhasm: z1 = x9
# asm 1: lwz >z1=int32#12,<x9=stack32#28
# asm 2: lwz >z1=14,<x9=108(1)
lwz 14,108(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=15,<y0=4,20,4080
rlwinm 15,4,20,4080

# qhasm: z2 = x10
# asm 1: lwz >z2=int32#14,<x10=stack32#29
# asm 2: lwz >z2=16,<x10=112(1)
lwz 16,112(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=17,<y0=4,28,4080
rlwinm 17,4,28,4080

# qhasm: z3 = x11
# asm 1: lwz >z3=int32#16,<x11=stack32#30
# asm 2: lwz >z3=18,<x11=116(1)
lwz 18,116(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#2,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=4,<y0=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#7,12,4080
# asm 2: rlwinm >p10=19,<y1=9,12,4080
rlwinm 19,9,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#7,20,4080
# asm 2: rlwinm >p11=20,<y1=9,20,4080
rlwinm 20,9,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#7,28,4080
# asm 2: rlwinm >p12=21,<y1=9,28,4080
rlwinm 21,9,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#2,<table3=int32#3,<p03=int32#2
# asm 2: lwzx >p03=4,<table3=5,<p03=4
lwzx 4,5,4

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#7,<y1=int32#7,4,4080
# asm 2: rlwinm >p13=9,<y1=9,4,4080
rlwinm 9,9,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#2,<p03=int32#2,<z1=int32#12
# asm 2: xor >z1=4,<p03=4,<z1=14
xor 4,4,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#8,12,4080
# asm 2: rlwinm >p20=16,<y2=10,12,4080
rlwinm 16,10,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#8,20,4080
# asm 2: rlwinm >p21=18,<y2=10,20,4080
rlwinm 18,10,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#8,28,4080
# asm 2: rlwinm >p22=20,<y2=10,28,4080
rlwinm 20,10,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#7,<table3=int32#3,<p13=int32#7
# asm 2: lwzx >p13=9,<table3=5,<p13=9
lwzx 9,5,9

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#8,<y2=int32#8,4,4080
# asm 2: rlwinm >p23=10,<y2=10,4,4080
rlwinm 10,10,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#2,<p10=int32#12,<z1=int32#2
# asm 2: xor >z1=4,<p10=14,<z1=4
xor 4,14,4

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#7,<p13=int32#7,<z2=int32#13
# asm 2: xor >z2=9,<p13=9,<z2=15
xor 9,9,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#9,12,4080
# asm 2: rlwinm >p30=15,<y3=11,12,4080
rlwinm 15,11,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#9,20,4080
# asm 2: rlwinm >p31=17,<y3=11,20,4080
rlwinm 17,11,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#9,28,4080
# asm 2: rlwinm >p32=19,<y3=11,28,4080
rlwinm 19,11,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#8,<table3=int32#3,<p23=int32#8
# asm 2: lwzx >p23=10,<table3=5,<p23=10
lwzx 10,5,10

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#9,<y3=int32#9,4,4080
# asm 2: rlwinm >p33=11,<y3=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#7,<p20=int32#12,<z2=int32#7
# asm 2: xor >z2=9,<p20=14,<z2=9
xor 9,14,9

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#2,<p21=int32#14,<z1=int32#2
# asm 2: xor >z1=4,<p21=16,<z1=4
xor 4,16,4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#9,<table3=int32#3,<p33=int32#9
# asm 2: lwzx >p33=11,<table3=5,<p33=11
lwzx 11,5,11

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#8,<p23=int32#8,<z3=int32#11
# asm 2: xor >z3=10,<p23=10,<z3=13
xor 10,10,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#7,<z2=int32#7,<p31=int32#12
# asm 2: xor >y2=9,<z2=9,<p31=14
xor 9,9,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#2,<z1=int32#2,<p32=int32#14
# asm 2: xor >y1=4,<z1=4,<p32=16
xor 4,4,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#9,<z0=int32#10,<p33=int32#9
# asm 2: xor >y0=11,<z0=12,<p33=11
xor 11,12,11

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#8,<z3=int32#8,<p30=int32#13
# asm 2: xor >y3=10,<z3=10,<p30=15
xor 10,10,15

# qhasm: z0 = x12
# asm 1: lwz >z0=int32#10,<x12=stack32#31
# asm 2: lwz >z0=12,<x12=120(1)
lwz 12,120(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#9,12,4080
# asm 2: rlwinm >p00=13,<y0=11,12,4080
rlwinm 13,11,12,4080

# qhasm: z1 = x13
# asm 1: lwz >z1=int32#12,<x13=stack32#32
# asm 2: lwz >z1=14,<x13=124(1)
lwz 14,124(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#9,20,4080
# asm 2: rlwinm >p01=15,<y0=11,20,4080
rlwinm 15,11,20,4080

# qhasm: z2 = x14
# asm 1: lwz >z2=int32#14,<x14=stack32#33
# asm 2: lwz >z2=16,<x14=128(1)
lwz 16,128(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#9,28,4080
# asm 2: rlwinm >p02=17,<y0=11,28,4080
rlwinm 17,11,28,4080

# qhasm: z3 = x15
# asm 1: lwz >z3=int32#16,<x15=stack32#34
# asm 2: lwz >z3=18,<x15=132(1)
lwz 18,132(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#9,<y0=int32#9,4,4080
# asm 2: rlwinm >p03=11,<y0=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#2,12,4080
# asm 2: rlwinm >p10=19,<y1=4,12,4080
rlwinm 19,4,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#2,20,4080
# asm 2: rlwinm >p11=20,<y1=4,20,4080
rlwinm 20,4,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#2,28,4080
# asm 2: rlwinm >p12=21,<y1=4,28,4080
rlwinm 21,4,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#9,<table3=int32#3,<p03=int32#9
# asm 2: lwzx >p03=11,<table3=5,<p03=11
lwzx 11,5,11

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#2,<y1=int32#2,4,4080
# asm 2: rlwinm >p13=4,<y1=4,4,4080
rlwinm 4,4,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#9,<p03=int32#9,<z1=int32#12
# asm 2: xor >z1=11,<p03=11,<z1=14
xor 11,11,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#7,12,4080
# asm 2: rlwinm >p20=16,<y2=9,12,4080
rlwinm 16,9,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#7,20,4080
# asm 2: rlwinm >p21=18,<y2=9,20,4080
rlwinm 18,9,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#7,28,4080
# asm 2: rlwinm >p22=20,<y2=9,28,4080
rlwinm 20,9,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#2,<table3=int32#3,<p13=int32#2
# asm 2: lwzx >p13=4,<table3=5,<p13=4
lwzx 4,5,4

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#7,<y2=int32#7,4,4080
# asm 2: rlwinm >p23=9,<y2=9,4,4080
rlwinm 9,9,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#9,<p10=int32#12,<z1=int32#9
# asm 2: xor >z1=11,<p10=14,<z1=11
xor 11,14,11

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#2,<p13=int32#2,<z2=int32#13
# asm 2: xor >z2=4,<p13=4,<z2=15
xor 4,4,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#8,12,4080
# asm 2: rlwinm >p30=15,<y3=10,12,4080
rlwinm 15,10,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#8,20,4080
# asm 2: rlwinm >p31=17,<y3=10,20,4080
rlwinm 17,10,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#8,28,4080
# asm 2: rlwinm >p32=19,<y3=10,28,4080
rlwinm 19,10,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#7,<table3=int32#3,<p23=int32#7
# asm 2: lwzx >p23=9,<table3=5,<p23=9
lwzx 9,5,9

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#8,<y3=int32#8,4,4080
# asm 2: rlwinm >p33=10,<y3=10,4,4080
rlwinm 10,10,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#2,<p20=int32#12,<z2=int32#2
# asm 2: xor >z2=4,<p20=14,<z2=4
xor 4,14,4

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#9,<p21=int32#14,<z1=int32#9
# asm 2: xor >z1=11,<p21=16,<z1=11
xor 11,16,11

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#8,<table3=int32#3,<p33=int32#8
# asm 2: lwzx >p33=10,<table3=5,<p33=10
lwzx 10,5,10

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#7,<p23=int32#7,<z3=int32#11
# asm 2: xor >z3=9,<p23=9,<z3=13
xor 9,9,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#2,<z2=int32#2,<p31=int32#12
# asm 2: xor >y2=4,<z2=4,<p31=14
xor 4,4,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#9,<z1=int32#9,<p32=int32#14
# asm 2: xor >y1=11,<z1=11,<p32=16
xor 11,11,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#8,<z0=int32#10,<p33=int32#8
# asm 2: xor >y0=10,<z0=12,<p33=10
xor 10,12,10

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#7,<z3=int32#7,<p30=int32#13
# asm 2: xor >y3=9,<z3=9,<p30=15
xor 9,9,15

# qhasm: z0 = x16
# asm 1: lwz >z0=int32#10,<x16=stack32#35
# asm 2: lwz >z0=12,<x16=136(1)
lwz 12,136(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#8,12,4080
# asm 2: rlwinm >p00=13,<y0=10,12,4080
rlwinm 13,10,12,4080

# qhasm: z1 = x17
# asm 1: lwz >z1=int32#12,<x17=stack32#36
# asm 2: lwz >z1=14,<x17=140(1)
lwz 14,140(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#8,20,4080
# asm 2: rlwinm >p01=15,<y0=10,20,4080
rlwinm 15,10,20,4080

# qhasm: z2 = x18
# asm 1: lwz >z2=int32#14,<x18=stack32#37
# asm 2: lwz >z2=16,<x18=144(1)
lwz 16,144(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#8,28,4080
# asm 2: rlwinm >p02=17,<y0=10,28,4080
rlwinm 17,10,28,4080

# qhasm: z3 = x19
# asm 1: lwz >z3=int32#16,<x19=stack32#38
# asm 2: lwz >z3=18,<x19=148(1)
lwz 18,148(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#8,<y0=int32#8,4,4080
# asm 2: rlwinm >p03=10,<y0=10,4,4080
rlwinm 10,10,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#9,12,4080
# asm 2: rlwinm >p10=19,<y1=11,12,4080
rlwinm 19,11,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#9,20,4080
# asm 2: rlwinm >p11=20,<y1=11,20,4080
rlwinm 20,11,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#9,28,4080
# asm 2: rlwinm >p12=21,<y1=11,28,4080
rlwinm 21,11,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#8,<table3=int32#3,<p03=int32#8
# asm 2: lwzx >p03=10,<table3=5,<p03=10
lwzx 10,5,10

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#9,<y1=int32#9,4,4080
# asm 2: rlwinm >p13=11,<y1=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#8,<p03=int32#8,<z1=int32#12
# asm 2: xor >z1=10,<p03=10,<z1=14
xor 10,10,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#2,12,4080
# asm 2: rlwinm >p20=16,<y2=4,12,4080
rlwinm 16,4,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#2,20,4080
# asm 2: rlwinm >p21=18,<y2=4,20,4080
rlwinm 18,4,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#2,28,4080
# asm 2: rlwinm >p22=20,<y2=4,28,4080
rlwinm 20,4,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#9,<table3=int32#3,<p13=int32#9
# asm 2: lwzx >p13=11,<table3=5,<p13=11
lwzx 11,5,11

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#2,<y2=int32#2,4,4080
# asm 2: rlwinm >p23=4,<y2=4,4,4080
rlwinm 4,4,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#8,<p10=int32#12,<z1=int32#8
# asm 2: xor >z1=10,<p10=14,<z1=10
xor 10,14,10

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#9,<p13=int32#9,<z2=int32#13
# asm 2: xor >z2=11,<p13=11,<z2=15
xor 11,11,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#7,12,4080
# asm 2: rlwinm >p30=15,<y3=9,12,4080
rlwinm 15,9,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#7,20,4080
# asm 2: rlwinm >p31=17,<y3=9,20,4080
rlwinm 17,9,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#7,28,4080
# asm 2: rlwinm >p32=19,<y3=9,28,4080
rlwinm 19,9,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#2,<table3=int32#3,<p23=int32#2
# asm 2: lwzx >p23=4,<table3=5,<p23=4
lwzx 4,5,4

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#7,<y3=int32#7,4,4080
# asm 2: rlwinm >p33=9,<y3=9,4,4080
rlwinm 9,9,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#9,<p20=int32#12,<z2=int32#9
# asm 2: xor >z2=11,<p20=14,<z2=11
xor 11,14,11

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#8,<p21=int32#14,<z1=int32#8
# asm 2: xor >z1=10,<p21=16,<z1=10
xor 10,16,10

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#7,<table3=int32#3,<p33=int32#7
# asm 2: lwzx >p33=9,<table3=5,<p33=9
lwzx 9,5,9

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#2,<p23=int32#2,<z3=int32#11
# asm 2: xor >z3=4,<p23=4,<z3=13
xor 4,4,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#9,<z2=int32#9,<p31=int32#12
# asm 2: xor >y2=11,<z2=11,<p31=14
xor 11,11,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#8,<z1=int32#8,<p32=int32#14
# asm 2: xor >y1=10,<z1=10,<p32=16
xor 10,10,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#7,<z0=int32#10,<p33=int32#7
# asm 2: xor >y0=9,<z0=12,<p33=9
xor 9,12,9

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#2,<z3=int32#2,<p30=int32#13
# asm 2: xor >y3=4,<z3=4,<p30=15
xor 4,4,15

# qhasm: z0 = x20
# asm 1: lwz >z0=int32#10,<x20=stack32#39
# asm 2: lwz >z0=12,<x20=152(1)
lwz 12,152(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#7,12,4080
# asm 2: rlwinm >p00=13,<y0=9,12,4080
rlwinm 13,9,12,4080

# qhasm: z1 = x21
# asm 1: lwz >z1=int32#12,<x21=stack32#40
# asm 2: lwz >z1=14,<x21=156(1)
lwz 14,156(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#7,20,4080
# asm 2: rlwinm >p01=15,<y0=9,20,4080
rlwinm 15,9,20,4080

# qhasm: z2 = x22
# asm 1: lwz >z2=int32#14,<x22=stack32#41
# asm 2: lwz >z2=16,<x22=160(1)
lwz 16,160(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#7,28,4080
# asm 2: rlwinm >p02=17,<y0=9,28,4080
rlwinm 17,9,28,4080

# qhasm: z3 = x23
# asm 1: lwz >z3=int32#16,<x23=stack32#42
# asm 2: lwz >z3=18,<x23=164(1)
lwz 18,164(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#7,<y0=int32#7,4,4080
# asm 2: rlwinm >p03=9,<y0=9,4,4080
rlwinm 9,9,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#8,12,4080
# asm 2: rlwinm >p10=19,<y1=10,12,4080
rlwinm 19,10,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#8,20,4080
# asm 2: rlwinm >p11=20,<y1=10,20,4080
rlwinm 20,10,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#8,28,4080
# asm 2: rlwinm >p12=21,<y1=10,28,4080
rlwinm 21,10,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#7,<table3=int32#3,<p03=int32#7
# asm 2: lwzx >p03=9,<table3=5,<p03=9
lwzx 9,5,9

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#8,<y1=int32#8,4,4080
# asm 2: rlwinm >p13=10,<y1=10,4,4080
rlwinm 10,10,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#7,<p03=int32#7,<z1=int32#12
# asm 2: xor >z1=9,<p03=9,<z1=14
xor 9,9,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#9,12,4080
# asm 2: rlwinm >p20=16,<y2=11,12,4080
rlwinm 16,11,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#9,20,4080
# asm 2: rlwinm >p21=18,<y2=11,20,4080
rlwinm 18,11,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#9,28,4080
# asm 2: rlwinm >p22=20,<y2=11,28,4080
rlwinm 20,11,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#8,<table3=int32#3,<p13=int32#8
# asm 2: lwzx >p13=10,<table3=5,<p13=10
lwzx 10,5,10

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#9,<y2=int32#9,4,4080
# asm 2: rlwinm >p23=11,<y2=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#7,<p10=int32#12,<z1=int32#7
# asm 2: xor >z1=9,<p10=14,<z1=9
xor 9,14,9

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#8,<p13=int32#8,<z2=int32#13
# asm 2: xor >z2=10,<p13=10,<z2=15
xor 10,10,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#2,12,4080
# asm 2: rlwinm >p30=15,<y3=4,12,4080
rlwinm 15,4,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#2,20,4080
# asm 2: rlwinm >p31=17,<y3=4,20,4080
rlwinm 17,4,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#2,28,4080
# asm 2: rlwinm >p32=19,<y3=4,28,4080
rlwinm 19,4,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#9,<table3=int32#3,<p23=int32#9
# asm 2: lwzx >p23=11,<table3=5,<p23=11
lwzx 11,5,11

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#2,<y3=int32#2,4,4080
# asm 2: rlwinm >p33=4,<y3=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#8,<p20=int32#12,<z2=int32#8
# asm 2: xor >z2=10,<p20=14,<z2=10
xor 10,14,10

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#7,<p21=int32#14,<z1=int32#7
# asm 2: xor >z1=9,<p21=16,<z1=9
xor 9,16,9

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#2,<table3=int32#3,<p33=int32#2
# asm 2: lwzx >p33=4,<table3=5,<p33=4
lwzx 4,5,4

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#9,<p23=int32#9,<z3=int32#11
# asm 2: xor >z3=11,<p23=11,<z3=13
xor 11,11,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#8,<z2=int32#8,<p31=int32#12
# asm 2: xor >y2=10,<z2=10,<p31=14
xor 10,10,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#7,<z1=int32#7,<p32=int32#14
# asm 2: xor >y1=9,<z1=9,<p32=16
xor 9,9,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#2,<z0=int32#10,<p33=int32#2
# asm 2: xor >y0=4,<z0=12,<p33=4
xor 4,12,4

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#9,<z3=int32#9,<p30=int32#13
# asm 2: xor >y3=11,<z3=11,<p30=15
xor 11,11,15

# qhasm: z0 = x24
# asm 1: lwz >z0=int32#10,<x24=stack32#43
# asm 2: lwz >z0=12,<x24=168(1)
lwz 12,168(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=13,<y0=4,12,4080
rlwinm 13,4,12,4080

# qhasm: z1 = x25
# asm 1: lwz >z1=int32#12,<x25=stack32#44
# asm 2: lwz >z1=14,<x25=172(1)
lwz 14,172(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=15,<y0=4,20,4080
rlwinm 15,4,20,4080

# qhasm: z2 = x26
# asm 1: lwz >z2=int32#14,<x26=stack32#45
# asm 2: lwz >z2=16,<x26=176(1)
lwz 16,176(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=17,<y0=4,28,4080
rlwinm 17,4,28,4080

# qhasm: z3 = x27
# asm 1: lwz >z3=int32#16,<x27=stack32#46
# asm 2: lwz >z3=18,<x27=180(1)
lwz 18,180(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#2,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=4,<y0=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#7,12,4080
# asm 2: rlwinm >p10=19,<y1=9,12,4080
rlwinm 19,9,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#7,20,4080
# asm 2: rlwinm >p11=20,<y1=9,20,4080
rlwinm 20,9,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#7,28,4080
# asm 2: rlwinm >p12=21,<y1=9,28,4080
rlwinm 21,9,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#2,<table3=int32#3,<p03=int32#2
# asm 2: lwzx >p03=4,<table3=5,<p03=4
lwzx 4,5,4

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#7,<y1=int32#7,4,4080
# asm 2: rlwinm >p13=9,<y1=9,4,4080
rlwinm 9,9,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#2,<p03=int32#2,<z1=int32#12
# asm 2: xor >z1=4,<p03=4,<z1=14
xor 4,4,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#8,12,4080
# asm 2: rlwinm >p20=16,<y2=10,12,4080
rlwinm 16,10,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#8,20,4080
# asm 2: rlwinm >p21=18,<y2=10,20,4080
rlwinm 18,10,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#8,28,4080
# asm 2: rlwinm >p22=20,<y2=10,28,4080
rlwinm 20,10,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#7,<table3=int32#3,<p13=int32#7
# asm 2: lwzx >p13=9,<table3=5,<p13=9
lwzx 9,5,9

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#8,<y2=int32#8,4,4080
# asm 2: rlwinm >p23=10,<y2=10,4,4080
rlwinm 10,10,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#2,<p10=int32#12,<z1=int32#2
# asm 2: xor >z1=4,<p10=14,<z1=4
xor 4,14,4

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#7,<p13=int32#7,<z2=int32#13
# asm 2: xor >z2=9,<p13=9,<z2=15
xor 9,9,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#9,12,4080
# asm 2: rlwinm >p30=15,<y3=11,12,4080
rlwinm 15,11,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#9,20,4080
# asm 2: rlwinm >p31=17,<y3=11,20,4080
rlwinm 17,11,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#9,28,4080
# asm 2: rlwinm >p32=19,<y3=11,28,4080
rlwinm 19,11,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#8,<table3=int32#3,<p23=int32#8
# asm 2: lwzx >p23=10,<table3=5,<p23=10
lwzx 10,5,10

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#9,<y3=int32#9,4,4080
# asm 2: rlwinm >p33=11,<y3=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#7,<p20=int32#12,<z2=int32#7
# asm 2: xor >z2=9,<p20=14,<z2=9
xor 9,14,9

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#2,<p21=int32#14,<z1=int32#2
# asm 2: xor >z1=4,<p21=16,<z1=4
xor 4,16,4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#9,<table3=int32#3,<p33=int32#9
# asm 2: lwzx >p33=11,<table3=5,<p33=11
lwzx 11,5,11

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#8,<p23=int32#8,<z3=int32#11
# asm 2: xor >z3=10,<p23=10,<z3=13
xor 10,10,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#7,<z2=int32#7,<p31=int32#12
# asm 2: xor >y2=9,<z2=9,<p31=14
xor 9,9,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#2,<z1=int32#2,<p32=int32#14
# asm 2: xor >y1=4,<z1=4,<p32=16
xor 4,4,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#9,<z0=int32#10,<p33=int32#9
# asm 2: xor >y0=11,<z0=12,<p33=11
xor 11,12,11

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#8,<z3=int32#8,<p30=int32#13
# asm 2: xor >y3=10,<z3=10,<p30=15
xor 10,10,15

# qhasm: z0 = x28
# asm 1: lwz >z0=int32#10,<x28=stack32#47
# asm 2: lwz >z0=12,<x28=184(1)
lwz 12,184(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#9,12,4080
# asm 2: rlwinm >p00=13,<y0=11,12,4080
rlwinm 13,11,12,4080

# qhasm: z1 = x29
# asm 1: lwz >z1=int32#12,<x29=stack32#48
# asm 2: lwz >z1=14,<x29=188(1)
lwz 14,188(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#9,20,4080
# asm 2: rlwinm >p01=15,<y0=11,20,4080
rlwinm 15,11,20,4080

# qhasm: z2 = x30
# asm 1: lwz >z2=int32#14,<x30=stack32#49
# asm 2: lwz >z2=16,<x30=192(1)
lwz 16,192(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#9,28,4080
# asm 2: rlwinm >p02=17,<y0=11,28,4080
rlwinm 17,11,28,4080

# qhasm: z3 = x31
# asm 1: lwz >z3=int32#16,<x31=stack32#50
# asm 2: lwz >z3=18,<x31=196(1)
lwz 18,196(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#9,<y0=int32#9,4,4080
# asm 2: rlwinm >p03=11,<y0=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#2,12,4080
# asm 2: rlwinm >p10=19,<y1=4,12,4080
rlwinm 19,4,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#2,20,4080
# asm 2: rlwinm >p11=20,<y1=4,20,4080
rlwinm 20,4,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#2,28,4080
# asm 2: rlwinm >p12=21,<y1=4,28,4080
rlwinm 21,4,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#9,<table3=int32#3,<p03=int32#9
# asm 2: lwzx >p03=11,<table3=5,<p03=11
lwzx 11,5,11

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#2,<y1=int32#2,4,4080
# asm 2: rlwinm >p13=4,<y1=4,4,4080
rlwinm 4,4,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#9,<p03=int32#9,<z1=int32#12
# asm 2: xor >z1=11,<p03=11,<z1=14
xor 11,11,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#7,12,4080
# asm 2: rlwinm >p20=16,<y2=9,12,4080
rlwinm 16,9,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#7,20,4080
# asm 2: rlwinm >p21=18,<y2=9,20,4080
rlwinm 18,9,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#7,28,4080
# asm 2: rlwinm >p22=20,<y2=9,28,4080
rlwinm 20,9,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#2,<table3=int32#3,<p13=int32#2
# asm 2: lwzx >p13=4,<table3=5,<p13=4
lwzx 4,5,4

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#7,<y2=int32#7,4,4080
# asm 2: rlwinm >p23=9,<y2=9,4,4080
rlwinm 9,9,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#9,<p10=int32#12,<z1=int32#9
# asm 2: xor >z1=11,<p10=14,<z1=11
xor 11,14,11

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#2,<p13=int32#2,<z2=int32#13
# asm 2: xor >z2=4,<p13=4,<z2=15
xor 4,4,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#8,12,4080
# asm 2: rlwinm >p30=15,<y3=10,12,4080
rlwinm 15,10,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#8,20,4080
# asm 2: rlwinm >p31=17,<y3=10,20,4080
rlwinm 17,10,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#8,28,4080
# asm 2: rlwinm >p32=19,<y3=10,28,4080
rlwinm 19,10,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#7,<table3=int32#3,<p23=int32#7
# asm 2: lwzx >p23=9,<table3=5,<p23=9
lwzx 9,5,9

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#8,<y3=int32#8,4,4080
# asm 2: rlwinm >p33=10,<y3=10,4,4080
rlwinm 10,10,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#2,<p20=int32#12,<z2=int32#2
# asm 2: xor >z2=4,<p20=14,<z2=4
xor 4,14,4

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#9,<p21=int32#14,<z1=int32#9
# asm 2: xor >z1=11,<p21=16,<z1=11
xor 11,16,11

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#8,<table3=int32#3,<p33=int32#8
# asm 2: lwzx >p33=10,<table3=5,<p33=10
lwzx 10,5,10

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#7,<p23=int32#7,<z3=int32#11
# asm 2: xor >z3=9,<p23=9,<z3=13
xor 9,9,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#2,<z2=int32#2,<p31=int32#12
# asm 2: xor >y2=4,<z2=4,<p31=14
xor 4,4,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#9,<z1=int32#9,<p32=int32#14
# asm 2: xor >y1=11,<z1=11,<p32=16
xor 11,11,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#8,<z0=int32#10,<p33=int32#8
# asm 2: xor >y0=10,<z0=12,<p33=10
xor 10,12,10

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#7,<z3=int32#7,<p30=int32#13
# asm 2: xor >y3=9,<z3=9,<p30=15
xor 9,9,15

# qhasm: z0 = x32
# asm 1: lwz >z0=int32#10,<x32=stack32#51
# asm 2: lwz >z0=12,<x32=200(1)
lwz 12,200(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#8,12,4080
# asm 2: rlwinm >p00=13,<y0=10,12,4080
rlwinm 13,10,12,4080

# qhasm: z1 = x33
# asm 1: lwz >z1=int32#12,<x33=stack32#52
# asm 2: lwz >z1=14,<x33=204(1)
lwz 14,204(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#8,20,4080
# asm 2: rlwinm >p01=15,<y0=10,20,4080
rlwinm 15,10,20,4080

# qhasm: z2 = x34
# asm 1: lwz >z2=int32#14,<x34=stack32#53
# asm 2: lwz >z2=16,<x34=208(1)
lwz 16,208(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#8,28,4080
# asm 2: rlwinm >p02=17,<y0=10,28,4080
rlwinm 17,10,28,4080

# qhasm: z3 = x35
# asm 1: lwz >z3=int32#16,<x35=stack32#54
# asm 2: lwz >z3=18,<x35=212(1)
lwz 18,212(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#8,<y0=int32#8,4,4080
# asm 2: rlwinm >p03=10,<y0=10,4,4080
rlwinm 10,10,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#9,12,4080
# asm 2: rlwinm >p10=19,<y1=11,12,4080
rlwinm 19,11,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#9,20,4080
# asm 2: rlwinm >p11=20,<y1=11,20,4080
rlwinm 20,11,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#9,28,4080
# asm 2: rlwinm >p12=21,<y1=11,28,4080
rlwinm 21,11,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#8,<table3=int32#3,<p03=int32#8
# asm 2: lwzx >p03=10,<table3=5,<p03=10
lwzx 10,5,10

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#9,<y1=int32#9,4,4080
# asm 2: rlwinm >p13=11,<y1=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#8,<p03=int32#8,<z1=int32#12
# asm 2: xor >z1=10,<p03=10,<z1=14
xor 10,10,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#2,12,4080
# asm 2: rlwinm >p20=16,<y2=4,12,4080
rlwinm 16,4,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#2,20,4080
# asm 2: rlwinm >p21=18,<y2=4,20,4080
rlwinm 18,4,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#2,28,4080
# asm 2: rlwinm >p22=20,<y2=4,28,4080
rlwinm 20,4,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#9,<table3=int32#3,<p13=int32#9
# asm 2: lwzx >p13=11,<table3=5,<p13=11
lwzx 11,5,11

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#2,<y2=int32#2,4,4080
# asm 2: rlwinm >p23=4,<y2=4,4,4080
rlwinm 4,4,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#8,<p10=int32#12,<z1=int32#8
# asm 2: xor >z1=10,<p10=14,<z1=10
xor 10,14,10

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#9,<p13=int32#9,<z2=int32#13
# asm 2: xor >z2=11,<p13=11,<z2=15
xor 11,11,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#7,12,4080
# asm 2: rlwinm >p30=15,<y3=9,12,4080
rlwinm 15,9,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#7,20,4080
# asm 2: rlwinm >p31=17,<y3=9,20,4080
rlwinm 17,9,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#7,28,4080
# asm 2: rlwinm >p32=19,<y3=9,28,4080
rlwinm 19,9,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#2,<table3=int32#3,<p23=int32#2
# asm 2: lwzx >p23=4,<table3=5,<p23=4
lwzx 4,5,4

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#7,<y3=int32#7,4,4080
# asm 2: rlwinm >p33=9,<y3=9,4,4080
rlwinm 9,9,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#9,<p20=int32#12,<z2=int32#9
# asm 2: xor >z2=11,<p20=14,<z2=11
xor 11,14,11

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#8,<p21=int32#14,<z1=int32#8
# asm 2: xor >z1=10,<p21=16,<z1=10
xor 10,16,10

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#7,<table3=int32#3,<p33=int32#7
# asm 2: lwzx >p33=9,<table3=5,<p33=9
lwzx 9,5,9

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#2,<p23=int32#2,<z3=int32#11
# asm 2: xor >z3=4,<p23=4,<z3=13
xor 4,4,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#9,<z2=int32#9,<p31=int32#12
# asm 2: xor >y2=11,<z2=11,<p31=14
xor 11,11,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#8,<z1=int32#8,<p32=int32#14
# asm 2: xor >y1=10,<z1=10,<p32=16
xor 10,10,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#7,<z0=int32#10,<p33=int32#7
# asm 2: xor >y0=9,<z0=12,<p33=9
xor 9,12,9

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#2,<z3=int32#2,<p30=int32#13
# asm 2: xor >y3=4,<z3=4,<p30=15
xor 4,4,15

# qhasm: z0 = x36
# asm 1: lwz >z0=int32#10,<x36=stack32#55
# asm 2: lwz >z0=12,<x36=216(1)
lwz 12,216(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#7,12,4080
# asm 2: rlwinm >p00=13,<y0=9,12,4080
rlwinm 13,9,12,4080

# qhasm: z1 = x37
# asm 1: lwz >z1=int32#12,<x37=stack32#56
# asm 2: lwz >z1=14,<x37=220(1)
lwz 14,220(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#7,20,4080
# asm 2: rlwinm >p01=15,<y0=9,20,4080
rlwinm 15,9,20,4080

# qhasm: z2 = x38
# asm 1: lwz >z2=int32#14,<x38=stack32#57
# asm 2: lwz >z2=16,<x38=224(1)
lwz 16,224(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#15,<y0=int32#7,28,4080
# asm 2: rlwinm >p02=17,<y0=9,28,4080
rlwinm 17,9,28,4080

# qhasm: z3 = x39
# asm 1: lwz >z3=int32#16,<x39=stack32#58
# asm 2: lwz >z3=18,<x39=228(1)
lwz 18,228(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#7,<y0=int32#7,4,4080
# asm 2: rlwinm >p03=9,<y0=9,4,4080
rlwinm 9,9,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#11,<table0=int32#4,<p00=int32#11
# asm 2: lwzx >p00=13,<table0=6,<p00=13
lwzx 13,6,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#8,12,4080
# asm 2: rlwinm >p10=19,<y1=10,12,4080
rlwinm 19,10,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#13,<table1=int32#5,<p01=int32#13
# asm 2: lwzx >p01=15,<table1=7,<p01=15
lwzx 15,7,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#8,20,4080
# asm 2: rlwinm >p11=20,<y1=10,20,4080
rlwinm 20,10,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#15,<table2=int32#6,<p02=int32#15
# asm 2: lwzx >p02=17,<table2=8,<p02=17
lwzx 17,8,17

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#19,<y1=int32#8,28,4080
# asm 2: rlwinm >p12=21,<y1=10,28,4080
rlwinm 21,10,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#7,<table3=int32#3,<p03=int32#7
# asm 2: lwzx >p03=9,<table3=5,<p03=9
lwzx 9,5,9

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#8,<y1=int32#8,4,4080
# asm 2: rlwinm >p13=10,<y1=10,4,4080
rlwinm 10,10,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#7,<p03=int32#7,<z1=int32#12
# asm 2: xor >z1=9,<p03=9,<z1=14
xor 9,9,14

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#12,<table0=int32#4,<p10=int32#17
# asm 2: lwzx >p10=14,<table0=6,<p10=19
lwzx 14,6,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#9,12,4080
# asm 2: rlwinm >p20=16,<y2=11,12,4080
rlwinm 16,11,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#15,<table1=int32#5,<p11=int32#18
# asm 2: lwzx >p11=17,<table1=7,<p11=20
lwzx 17,7,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#9,20,4080
# asm 2: rlwinm >p21=18,<y2=11,20,4080
rlwinm 18,11,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#17,<table2=int32#6,<p12=int32#19
# asm 2: lwzx >p12=19,<table2=8,<p12=21
lwzx 19,8,21

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#9,28,4080
# asm 2: rlwinm >p22=20,<y2=11,28,4080
rlwinm 20,11,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#8,<table3=int32#3,<p13=int32#8
# asm 2: lwzx >p13=10,<table3=5,<p13=10
lwzx 10,5,10

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#9,<y2=int32#9,4,4080
# asm 2: rlwinm >p23=11,<y2=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#7,<p10=int32#12,<z1=int32#7
# asm 2: xor >z1=9,<p10=14,<z1=9
xor 9,14,9

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#8,<p13=int32#8,<z2=int32#13
# asm 2: xor >z2=10,<p13=10,<z2=15
xor 10,10,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#12,<table0=int32#4,<p20=int32#14
# asm 2: lwzx >p20=14,<table0=6,<p20=16
lwzx 14,6,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#2,12,4080
# asm 2: rlwinm >p30=15,<y3=4,12,4080
rlwinm 15,4,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#14,<table1=int32#5,<p21=int32#16
# asm 2: lwzx >p21=16,<table1=7,<p21=18
lwzx 16,7,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#2,20,4080
# asm 2: rlwinm >p31=17,<y3=4,20,4080
rlwinm 17,4,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#6,<p22=int32#18
# asm 2: lwzx >p22=18,<table2=8,<p22=20
lwzx 18,8,20

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#17,<y3=int32#2,28,4080
# asm 2: rlwinm >p32=19,<y3=4,28,4080
rlwinm 19,4,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#9,<table3=int32#3,<p23=int32#9
# asm 2: lwzx >p23=11,<table3=5,<p23=11
lwzx 11,5,11

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#2,<y3=int32#2,4,4080
# asm 2: rlwinm >p33=4,<y3=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#13,<table0=int32#4,<p30=int32#13
# asm 2: lwzx >p30=15,<table0=6,<p30=15
lwzx 15,6,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#8,<p20=int32#12,<z2=int32#8
# asm 2: xor >z2=10,<p20=14,<z2=10
xor 10,14,10

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#12,<table1=int32#5,<p31=int32#15
# asm 2: lwzx >p31=14,<table1=7,<p31=17
lwzx 14,7,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#7,<p21=int32#14,<z1=int32#7
# asm 2: xor >z1=9,<p21=16,<z1=9
xor 9,16,9

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#14,<table2=int32#6,<p32=int32#17
# asm 2: lwzx >p32=16,<table2=8,<p32=19
lwzx 16,8,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#2,<table3=int32#3,<p33=int32#2
# asm 2: lwzx >p33=4,<table3=5,<p33=4
lwzx 4,5,4

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#9,<p23=int32#9,<z3=int32#11
# asm 2: xor >z3=11,<p23=11,<z3=13
xor 11,11,13

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#8,<z2=int32#8,<p31=int32#12
# asm 2: xor >y2=10,<z2=10,<p31=14
xor 10,10,14

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#7,<z1=int32#7,<p32=int32#14
# asm 2: xor >y1=9,<z1=9,<p32=16
xor 9,9,16

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#2,<z0=int32#10,<p33=int32#2
# asm 2: xor >y0=4,<z0=12,<p33=4
xor 4,12,4

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#9,<z3=int32#9,<p30=int32#13
# asm 2: xor >y3=11,<z3=11,<p30=15
xor 11,11,15

# qhasm: z0 = x40
# asm 1: lwz >z0=int32#10,<x40=stack32#59
# asm 2: lwz >z0=12,<x40=232(1)
lwz 12,232(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#11,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=13,<y0=4,12,4080
rlwinm 13,4,12,4080

# qhasm: z1 = x41
# asm 1: lwz >z1=int32#12,<x41=stack32#60
# asm 2: lwz >z1=14,<x41=236(1)
lwz 14,236(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#13,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=15,<y0=4,20,4080
rlwinm 15,4,20,4080

# qhasm: z2 = x42
# asm 1: lwz >z2=int32#14,<x42=stack32#61
# asm 2: lwz >z2=16,<x42=240(1)
lwz 16,240(1)

# qhasm: p02 = 4080 & (y0 <<< 28) 
# asm 1: rlwinm >p02=int32#15,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=17,<y0=4,28,4080
rlwinm 17,4,28,4080

# qhasm: z3 = x43
# asm 1: lwz >z3=int32#16,<x43=stack32#62
# asm 2: lwz >z3=18,<x43=244(1)
lwz 18,244(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#2,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=4,<y0=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p00 = *(uint32 *) (table2 + p00)
# asm 1: lwzx >p00=int32#11,<table2=int32#6,<p00=int32#11
# asm 2: lwzx >p00=13,<table2=8,<p00=13
lwzx 13,8,13

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#17,<y1=int32#7,12,4080
# asm 2: rlwinm >p10=19,<y1=9,12,4080
rlwinm 19,9,12,4080

# qhasm: p01 = *(uint32 *) (table3 + p01)
# asm 1: lwzx >p01=int32#13,<table3=int32#3,<p01=int32#13
# asm 2: lwzx >p01=15,<table3=5,<p01=15
lwzx 15,5,15

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#18,<y1=int32#7,20,4080
# asm 2: rlwinm >p11=20,<y1=9,20,4080
rlwinm 20,9,20,4080

# qhasm: p02 = *(uint32 *) (table0 + p02)
# asm 1: lwzx >p02=int32#15,<table0=int32#4,<p02=int32#15
# asm 2: lwzx >p02=17,<table0=6,<p02=17
lwzx 17,6,17

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#19,<y1=int32#7,28,4080
# asm 2: rlwinm >p12=21,<y1=9,28,4080
rlwinm 21,9,28,4080

# qhasm: p03 = *(uint32 *) (table1 + p03)
# asm 1: lwzx >p03=int32#2,<table1=int32#5,<p03=int32#2
# asm 2: lwzx >p03=4,<table1=7,<p03=4
lwzx 4,7,4

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#7,<y1=int32#7,4,4080
# asm 2: rlwinm >p13=9,<y1=9,4,4080
rlwinm 9,9,4,4080

# qhasm: p00 = p00 & (65536 * 0xff00) 
# asm 1: andis. >p00=int32#11,<p00=int32#11,0xff00
# asm 2: andis. >p00=13,<p00=13,0xff00
andis. 13,13,0xff00

# qhasm: p01 = p01 & (65536 * 0xff) 
# asm 1: andis. >p01=int32#13,<p01=int32#13,0xff
# asm 2: andis. >p01=15,<p01=15,0xff
andis. 15,15,0xff

# qhasm: p02 = p02 & 0xff00 
# asm 1: andi. >p02=int32#15,<p02=int32#15,0xff00
# asm 2: andi. >p02=17,<p02=17,0xff00
andi. 17,17,0xff00

# qhasm: p03 = p03 & 0xff 
# asm 1: andi. >p03=int32#2,<p03=int32#2,0xff
# asm 2: andi. >p03=4,<p03=4,0xff
andi. 4,4,0xff

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#10,<p00=int32#11,<z0=int32#10
# asm 2: xor >z0=12,<p00=13,<z0=12
xor 12,13,12

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#11,<p01=int32#13,<z3=int32#16
# asm 2: xor >z3=13,<p01=15,<z3=18
xor 13,15,18

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#15,<z2=int32#14
# asm 2: xor >z2=15,<p02=17,<z2=16
xor 15,17,16

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#2,<p03=int32#2,<z1=int32#12
# asm 2: xor >z1=4,<p03=4,<z1=14
xor 4,4,14

# qhasm: p10 = *(uint32 *) (table2 + p10)
# asm 1: lwzx >p10=int32#12,<table2=int32#6,<p10=int32#17
# asm 2: lwzx >p10=14,<table2=8,<p10=19
lwzx 14,8,19

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#14,<y2=int32#8,12,4080
# asm 2: rlwinm >p20=16,<y2=10,12,4080
rlwinm 16,10,12,4080

# qhasm: p11 = *(uint32 *) (table3 + p11)
# asm 1: lwzx >p11=int32#15,<table3=int32#3,<p11=int32#18
# asm 2: lwzx >p11=17,<table3=5,<p11=20
lwzx 17,5,20

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#16,<y2=int32#8,20,4080
# asm 2: rlwinm >p21=18,<y2=10,20,4080
rlwinm 18,10,20,4080

# qhasm: p12 = *(uint32 *) (table0 + p12)
# asm 1: lwzx >p12=int32#17,<table0=int32#4,<p12=int32#19
# asm 2: lwzx >p12=19,<table0=6,<p12=21
lwzx 19,6,21

# qhasm: p22 = 4080 & (y2 <<< 28) 
# asm 1: rlwinm >p22=int32#18,<y2=int32#8,28,4080
# asm 2: rlwinm >p22=20,<y2=10,28,4080
rlwinm 20,10,28,4080

# qhasm: p13 = *(uint32 *) (table1 + p13)
# asm 1: lwzx >p13=int32#7,<table1=int32#5,<p13=int32#7
# asm 2: lwzx >p13=9,<table1=7,<p13=9
lwzx 9,7,9

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#8,<y2=int32#8,4,4080
# asm 2: rlwinm >p23=10,<y2=10,4,4080
rlwinm 10,10,4,4080

# qhasm: p10 = p10 & (65536 * 0xff00) 
# asm 1: andis. >p10=int32#12,<p10=int32#12,0xff00
# asm 2: andis. >p10=14,<p10=14,0xff00
andis. 14,14,0xff00

# qhasm: p11 = p11 & (65536 * 0xff) 
# asm 1: andis. >p11=int32#15,<p11=int32#15,0xff
# asm 2: andis. >p11=17,<p11=17,0xff
andis. 17,17,0xff

# qhasm: p12 = p12 & 0xff00 
# asm 1: andi. >p12=int32#17,<p12=int32#17,0xff00
# asm 2: andi. >p12=19,<p12=19,0xff00
andi. 19,19,0xff00

# qhasm: p13 = p13 & 0xff 
# asm 1: andi. >p13=int32#7,<p13=int32#7,0xff
# asm 2: andi. >p13=9,<p13=9,0xff
andi. 9,9,0xff

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#2,<p10=int32#12,<z1=int32#2
# asm 2: xor >z1=4,<p10=14,<z1=4
xor 4,14,4

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#10,<p11=int32#15,<z0=int32#10
# asm 2: xor >z0=12,<p11=17,<z0=12
xor 12,17,12

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#11,<p12=int32#17,<z3=int32#11
# asm 2: xor >z3=13,<p12=19,<z3=13
xor 13,19,13

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#7,<p13=int32#7,<z2=int32#13
# asm 2: xor >z2=9,<p13=9,<z2=15
xor 9,9,15

# qhasm: p20 = *(uint32 *) (table2 + p20)
# asm 1: lwzx >p20=int32#12,<table2=int32#6,<p20=int32#14
# asm 2: lwzx >p20=14,<table2=8,<p20=16
lwzx 14,8,16

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#13,<y3=int32#9,12,4080
# asm 2: rlwinm >p30=15,<y3=11,12,4080
rlwinm 15,11,12,4080

# qhasm: p21 = *(uint32 *) (table3 + p21)
# asm 1: lwzx >p21=int32#14,<table3=int32#3,<p21=int32#16
# asm 2: lwzx >p21=16,<table3=5,<p21=18
lwzx 16,5,18

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#15,<y3=int32#9,20,4080
# asm 2: rlwinm >p31=17,<y3=11,20,4080
rlwinm 17,11,20,4080

# qhasm: p22 = *(uint32 *) (table0 + p22)
# asm 1: lwzx >p22=int32#16,<table0=int32#4,<p22=int32#18
# asm 2: lwzx >p22=18,<table0=6,<p22=20
lwzx 18,6,20

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#17,<y3=int32#9,28,4080
# asm 2: rlwinm >p32=19,<y3=11,28,4080
rlwinm 19,11,28,4080

# qhasm: p23 = *(uint32 *) (table1 + p23)
# asm 1: lwzx >p23=int32#8,<table1=int32#5,<p23=int32#8
# asm 2: lwzx >p23=10,<table1=7,<p23=10
lwzx 10,7,10

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#9,<y3=int32#9,4,4080
# asm 2: rlwinm >p33=11,<y3=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p20 = p20 & (65536 * 0xff00) 
# asm 1: andis. >p20=int32#12,<p20=int32#12,0xff00
# asm 2: andis. >p20=14,<p20=14,0xff00
andis. 14,14,0xff00

# qhasm: p21 = p21 & (65536 * 0xff) 
# asm 1: andis. >p21=int32#14,<p21=int32#14,0xff
# asm 2: andis. >p21=16,<p21=16,0xff
andis. 16,16,0xff

# qhasm: p22 = p22 & 0xff00 
# asm 1: andi. >p22=int32#16,<p22=int32#16,0xff00
# asm 2: andi. >p22=18,<p22=18,0xff00
andi. 18,18,0xff00

# qhasm: p23 = p23 & 0xff 
# asm 1: andi. >p23=int32#8,<p23=int32#8,0xff
# asm 2: andi. >p23=10,<p23=10,0xff
andi. 10,10,0xff

# qhasm: p30 = *(uint32 *) (table2 + p30)
# asm 1: lwzx >p30=int32#6,<table2=int32#6,<p30=int32#13
# asm 2: lwzx >p30=8,<table2=8,<p30=15
lwzx 8,8,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#7,<p20=int32#12,<z2=int32#7
# asm 2: xor >z2=9,<p20=14,<z2=9
xor 9,14,9

# qhasm: p31 = *(uint32 *) (table3 + p31)
# asm 1: lwzx >p31=int32#3,<table3=int32#3,<p31=int32#15
# asm 2: lwzx >p31=5,<table3=5,<p31=17
lwzx 5,5,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#2,<p21=int32#14,<z1=int32#2
# asm 2: xor >z1=4,<p21=16,<z1=4
xor 4,16,4

# qhasm: p32 = *(uint32 *) (table0 + p32)
# asm 1: lwzx >p32=int32#4,<table0=int32#4,<p32=int32#17
# asm 2: lwzx >p32=6,<table0=6,<p32=19
lwzx 6,6,19

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#10,<p22=int32#16,<z0=int32#10
# asm 2: xor >z0=12,<p22=18,<z0=12
xor 12,18,12

# qhasm: p33 = *(uint32 *) (table1 + p33)
# asm 1: lwzx >p33=int32#5,<table1=int32#5,<p33=int32#9
# asm 2: lwzx >p33=7,<table1=7,<p33=11
lwzx 7,7,11

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#8,<p23=int32#8,<z3=int32#11
# asm 2: xor >z3=10,<p23=10,<z3=13
xor 10,10,13

# qhasm: p30 = p30 & (65536 * 0xff00) 
# asm 1: andis. >p30=int32#6,<p30=int32#6,0xff00
# asm 2: andis. >p30=8,<p30=8,0xff00
andis. 8,8,0xff00

# qhasm: p31 = p31 & (65536 * 0xff) 
# asm 1: andis. >p31=int32#3,<p31=int32#3,0xff
# asm 2: andis. >p31=5,<p31=5,0xff
andis. 5,5,0xff

# qhasm: p32 = p32 & 0xff00 
# asm 1: andi. >p32=int32#4,<p32=int32#4,0xff00
# asm 2: andi. >p32=6,<p32=6,0xff00
andi. 6,6,0xff00

# qhasm: p33 = p33 & 0xff 
# asm 1: andi. >p33=int32#5,<p33=int32#5,0xff
# asm 2: andi. >p33=7,<p33=7,0xff
andi. 7,7,0xff

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#5,<z0=int32#10,<p33=int32#5
# asm 2: xor >y0=7,<z0=12,<p33=7
xor 7,12,7

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#2,<z1=int32#2,<p32=int32#4
# asm 2: xor >y1=4,<z1=4,<p32=6
xor 4,4,6

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#3,<z2=int32#7,<p31=int32#3
# asm 2: xor >y2=5,<z2=9,<p31=5
xor 5,9,5

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#4,<z3=int32#8,<p30=int32#6
# asm 2: xor >y3=6,<z3=10,<p30=8
xor 6,10,8

# qhasm: *(uint32 *) (ctxp + 56) = y0
# asm 1: stw <y0=int32#5,56(<ctxp=int32#1)
# asm 2: stw <y0=7,56(<ctxp=3)
stw 7,56(3)

# qhasm: *(uint32 *) (ctxp + 60) = y1
# asm 1: stw <y1=int32#2,60(<ctxp=int32#1)
# asm 2: stw <y1=4,60(<ctxp=3)
stw 4,60(3)

# qhasm: *(uint32 *) (ctxp + 64) = y2
# asm 1: stw <y2=int32#3,64(<ctxp=int32#1)
# asm 2: stw <y2=5,64(<ctxp=3)
stw 5,64(3)

# qhasm: *(uint32 *) (ctxp + 68) = y3
# asm 1: stw <y3=int32#4,68(<ctxp=int32#1)
# asm 2: stw <y3=6,68(<ctxp=3)
stw 6,68(3)

# qhasm: i12 = i12_stack
# asm 1: lwz >i12=int32#12,<i12_stack=stack32#1
# asm 2: lwz >i12=14,<i12_stack=0(1)
lwz 14,0(1)

# qhasm: i13 = i13_stack
# asm 1: lwz >i13=int32#13,<i13_stack=stack32#2
# asm 2: lwz >i13=15,<i13_stack=4(1)
lwz 15,4(1)

# qhasm: i14 = i14_stack
# asm 1: lwz >i14=int32#14,<i14_stack=stack32#3
# asm 2: lwz >i14=16,<i14_stack=8(1)
lwz 16,8(1)

# qhasm: i15 = i15_stack
# asm 1: lwz >i15=int32#15,<i15_stack=stack32#4
# asm 2: lwz >i15=17,<i15_stack=12(1)
lwz 17,12(1)

# qhasm: i16 = i16_stack
# asm 1: lwz >i16=int32#16,<i16_stack=stack32#5
# asm 2: lwz >i16=18,<i16_stack=16(1)
lwz 18,16(1)

# qhasm: i17 = i17_stack
# asm 1: lwz >i17=int32#17,<i17_stack=stack32#6
# asm 2: lwz >i17=19,<i17_stack=20(1)
lwz 19,20(1)

# qhasm: i18 = i18_stack
# asm 1: lwz >i18=int32#18,<i18_stack=stack32#7
# asm 2: lwz >i18=20,<i18_stack=24(1)
lwz 20,24(1)

# qhasm: i19 = i19_stack
# asm 1: lwz >i19=int32#19,<i19_stack=stack32#8
# asm 2: lwz >i19=21,<i19_stack=28(1)
lwz 21,28(1)

# qhasm: i20 = i20_stack
# asm 1: lwz >i20=int32#20,<i20_stack=stack32#9
# asm 2: lwz >i20=22,<i20_stack=32(1)
lwz 22,32(1)

# qhasm: i21 = i21_stack
# asm 1: lwz >i21=int32#21,<i21_stack=stack32#10
# asm 2: lwz >i21=23,<i21_stack=36(1)
lwz 23,36(1)

# qhasm: i22 = i22_stack
# asm 1: lwz >i22=int32#22,<i22_stack=stack32#11
# asm 2: lwz >i22=24,<i22_stack=40(1)
lwz 24,40(1)

# qhasm: i23 = i23_stack
# asm 1: lwz >i23=int32#23,<i23_stack=stack32#12
# asm 2: lwz >i23=25,<i23_stack=44(1)
lwz 25,44(1)

# qhasm: i24 = i24_stack
# asm 1: lwz >i24=int32#24,<i24_stack=stack32#13
# asm 2: lwz >i24=26,<i24_stack=48(1)
lwz 26,48(1)

# qhasm: i25 = i25_stack
# asm 1: lwz >i25=int32#25,<i25_stack=stack32#14
# asm 2: lwz >i25=27,<i25_stack=52(1)
lwz 27,52(1)

# qhasm: i26 = i26_stack
# asm 1: lwz >i26=int32#26,<i26_stack=stack32#15
# asm 2: lwz >i26=28,<i26_stack=56(1)
lwz 28,56(1)

# qhasm: i27 = i27_stack
# asm 1: lwz >i27=int32#27,<i27_stack=stack32#16
# asm 2: lwz >i27=29,<i27_stack=60(1)
lwz 29,60(1)

# qhasm: i28 = i28_stack
# asm 1: lwz >i28=int32#28,<i28_stack=stack32#17
# asm 2: lwz >i28=30,<i28_stack=64(1)
lwz 30,64(1)

# qhasm: i29 = i29_stack
# asm 1: lwz >i29=int32#29,<i29_stack=stack32#18
# asm 2: lwz >i29=31,<i29_stack=68(1)
lwz 31,68(1)

# qhasm: leave
addi 1,1,384
blr
