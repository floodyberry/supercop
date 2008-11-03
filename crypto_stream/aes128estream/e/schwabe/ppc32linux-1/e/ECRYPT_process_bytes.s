
# qhasm: int32 action

# qhasm: int32 ctxp

# qhasm: int32 inp

# qhasm: int32 outp

# qhasm: int32 length

# qhasm: int32 debug

# qhasm: input action

# qhasm: input ctxp

# qhasm: input inp

# qhasm: input outp

# qhasm: input length

# qhasm: input debug

# qhasm: int32 constants

# qhasm: int32 constants_low

# qhasm: int32 tx0

# qhasm: int32 tx1

# qhasm: int32 tx2

# qhasm: int32 tx3

# qhasm: int32 table0

# qhasm: int32 table1

# qhasm: int32 table1p3

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

# qhasm: int32 n0p

# qhasm: int32 tmp1

# qhasm: int32 check

# qhasm: int32 d

# qhasm: int32 tmpp

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

# qhasm: stack128 tmp

# qhasm: stack32 pre10

# qhasm: stack32 pre20

# qhasm: stack32 pre21

# qhasm: stack32 pre22

# qhasm: stack32 pre23

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

# qhasm: enter ECRYPT_process_bytes
.text
.align 3
.globl _ECRYPT_process_bytes
.globl ECRYPT_process_bytes
_ECRYPT_process_bytes:
ECRYPT_process_bytes:
stwu 1,-416(1)

# qhasm: =? (uint32) length - 0
# asm 1: cmplwi <length=int32#5,0
# asm 2: cmplwi <length=7,0
cmplwi 7,0

# qhasm: goto donothing if =
beq .label.donothing

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
# asm 1: lis >constants=int32#1,aes_big_constants@h
# asm 2: lis >constants=3,aes_big_constants@h
lis 3,aes_big_constants@h

# qhasm: constants |= &aes_big_constants & 0xffff
# asm 1: ori >constants=int32#1,<constants=int32#1,aes_big_constants@l
# asm 2: ori >constants=3,<constants=3,aes_big_constants@l
ori 3,3,aes_big_constants@l

# qhasm: table0 = constants + 40
# asm 1: addi >table0=int32#6,<constants=int32#1,40
# asm 2: addi >table0=8,<constants=3,40
addi 8,3,40

# qhasm: table1 = constants + 48
# asm 1: addi >table1=int32#7,<constants=int32#1,48
# asm 2: addi >table1=9,<constants=3,48
addi 9,3,48

# qhasm: table1p3 = constants + 51
# asm 1: addi >table1p3=int32#8,<constants=int32#1,51
# asm 2: addi >table1p3=10,<constants=3,51
addi 10,3,51

# qhasm: table2 = constants + 44
# asm 1: addi >table2=int32#9,<constants=int32#1,44
# asm 2: addi >table2=11,<constants=3,44
addi 11,3,44

# qhasm: table3 = constants + 52
# asm 1: addi >table3=int32#1,<constants=int32#1,52
# asm 2: addi >table3=3,<constants=3,52
addi 3,3,52

# qhasm: n0p = ctxp + 56
# asm 1: addi >n0p=int32#10,<ctxp=int32#2,56
# asm 2: addi >n0p=12,<ctxp=4,56
addi 12,4,56

# qhasm: tx0 = *(uint32 *) (ctxp + 0) 
# asm 1: lwz >tx0=int32#11,0(<ctxp=int32#2)
# asm 2: lwz >tx0=13,0(<ctxp=4)
lwz 13,0(4)

# qhasm: tx1 = *(uint32 *) (ctxp + 4) 
# asm 1: lwz >tx1=int32#12,4(<ctxp=int32#2)
# asm 2: lwz >tx1=14,4(<ctxp=4)
lwz 14,4(4)

# qhasm: tx2 = *(uint32 *) (ctxp + 8) 
# asm 1: lwz >tx2=int32#13,8(<ctxp=int32#2)
# asm 2: lwz >tx2=15,8(<ctxp=4)
lwz 15,8(4)

# qhasm: tx3 = *(uint32 *) (ctxp + 12)
# asm 1: lwz >tx3=int32#14,12(<ctxp=int32#2)
# asm 2: lwz >tx3=16,12(<ctxp=4)
lwz 16,12(4)

# qhasm: x0 = tx0
# asm 1: stw <tx0=int32#11,>x0=stack32#19
# asm 2: stw <tx0=13,>x0=72(1)
stw 13,72(1)

# qhasm: x1 = tx1
# asm 1: stw <tx1=int32#12,>x1=stack32#20
# asm 2: stw <tx1=14,>x1=76(1)
stw 14,76(1)

# qhasm: x2 = tx2
# asm 1: stw <tx2=int32#13,>x2=stack32#21
# asm 2: stw <tx2=15,>x2=80(1)
stw 15,80(1)

# qhasm: x3 = tx3
# asm 1: stw <tx3=int32#14,>x3=stack32#22
# asm 2: stw <tx3=16,>x3=84(1)
stw 16,84(1)

# qhasm: y1 = *(uint32 *) (n0p + 4)
# asm 1: lwz >y1=int32#11,4(<n0p=int32#10)
# asm 2: lwz >y1=13,4(<n0p=12)
lwz 13,4(12)

# qhasm: y2 = *(uint32 *) (n0p + 8)
# asm 1: lwz >y2=int32#15,8(<n0p=int32#10)
# asm 2: lwz >y2=17,8(<n0p=12)
lwz 17,8(12)

# qhasm: y3 = *(uint32 *) (n0p + 12)
# asm 1: lwz >y3=int32#16,12(<n0p=int32#10)
# asm 2: lwz >y3=18,12(<n0p=12)
lwz 18,12(12)

# qhasm: y1 ^= tx1
# asm 1: xor >y1=int32#11,<tx1=int32#12,<y1=int32#11
# asm 2: xor >y1=13,<tx1=14,<y1=13
xor 13,14,13

# qhasm: y2 ^= tx2
# asm 1: xor >y2=int32#15,<tx2=int32#13,<y2=int32#15
# asm 2: xor >y2=17,<tx2=15,<y2=17
xor 17,15,17

# qhasm: y3 ^= tx3
# asm 1: xor >y3=int32#16,<tx3=int32#14,<y3=int32#16
# asm 2: xor >y3=18,<tx3=16,<y3=18
xor 18,16,18

# qhasm: *(uint32 *) (n0p + 4) = y1
# asm 1: stw <y1=int32#11,4(<n0p=int32#10)
# asm 2: stw <y1=13,4(<n0p=12)
stw 13,4(12)

# qhasm: *(uint32 *) (n0p + 8) = y2
# asm 1: stw <y2=int32#15,8(<n0p=int32#10)
# asm 2: stw <y2=17,8(<n0p=12)
stw 17,8(12)

# qhasm: *(uint32 *) (n0p + 12) = y3
# asm 1: stw <y3=int32#16,12(<n0p=int32#10)
# asm 2: stw <y3=18,12(<n0p=12)
stw 18,12(12)

# qhasm: tx0 = *(uint32 *) (ctxp + 16)
# asm 1: lwz >tx0=int32#11,16(<ctxp=int32#2)
# asm 2: lwz >tx0=13,16(<ctxp=4)
lwz 13,16(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x4  = tx0 
# asm 1: stw <tx0=int32#11,>x4=stack32#23
# asm 2: stw <tx0=13,>x4=88(1)
stw 13,88(1)

# qhasm: x5  = tx1 
# asm 1: stw <tx1=int32#12,>x5=stack32#24
# asm 2: stw <tx1=14,>x5=92(1)
stw 14,92(1)

# qhasm: x6  = tx2 
# asm 1: stw <tx2=int32#13,>x6=stack32#25
# asm 2: stw <tx2=15,>x6=96(1)
stw 15,96(1)

# qhasm: x7  = tx3 
# asm 1: stw <tx3=int32#14,>x7=stack32#26
# asm 2: stw <tx3=16,>x7=100(1)
stw 16,100(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 20) 
# asm 1: lwz >tx0=int32#11,20(<ctxp=int32#2)
# asm 2: lwz >tx0=13,20(<ctxp=4)
lwz 13,20(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x8  = tx0 
# asm 1: stw <tx0=int32#11,>x8=stack32#27
# asm 2: stw <tx0=13,>x8=104(1)
stw 13,104(1)

# qhasm: x9  = tx1
# asm 1: stw <tx1=int32#12,>x9=stack32#28
# asm 2: stw <tx1=14,>x9=108(1)
stw 14,108(1)

# qhasm: x10  = tx2 
# asm 1: stw <tx2=int32#13,>x10=stack32#29
# asm 2: stw <tx2=15,>x10=112(1)
stw 15,112(1)

# qhasm: x11  = tx3 
# asm 1: stw <tx3=int32#14,>x11=stack32#30
# asm 2: stw <tx3=16,>x11=116(1)
stw 16,116(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 24) 
# asm 1: lwz >tx0=int32#11,24(<ctxp=int32#2)
# asm 2: lwz >tx0=13,24(<ctxp=4)
lwz 13,24(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x12  = tx0 
# asm 1: stw <tx0=int32#11,>x12=stack32#31
# asm 2: stw <tx0=13,>x12=120(1)
stw 13,120(1)

# qhasm: x13  = tx1
# asm 1: stw <tx1=int32#12,>x13=stack32#32
# asm 2: stw <tx1=14,>x13=124(1)
stw 14,124(1)

# qhasm: x14  = tx2 
# asm 1: stw <tx2=int32#13,>x14=stack32#33
# asm 2: stw <tx2=15,>x14=128(1)
stw 15,128(1)

# qhasm: x15  = tx3 
# asm 1: stw <tx3=int32#14,>x15=stack32#34
# asm 2: stw <tx3=16,>x15=132(1)
stw 16,132(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 28) 
# asm 1: lwz >tx0=int32#11,28(<ctxp=int32#2)
# asm 2: lwz >tx0=13,28(<ctxp=4)
lwz 13,28(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x16  = tx0 
# asm 1: stw <tx0=int32#11,>x16=stack32#35
# asm 2: stw <tx0=13,>x16=136(1)
stw 13,136(1)

# qhasm: x17  = tx1
# asm 1: stw <tx1=int32#12,>x17=stack32#36
# asm 2: stw <tx1=14,>x17=140(1)
stw 14,140(1)

# qhasm: x18  = tx2 
# asm 1: stw <tx2=int32#13,>x18=stack32#37
# asm 2: stw <tx2=15,>x18=144(1)
stw 15,144(1)

# qhasm: x19  = tx3 
# asm 1: stw <tx3=int32#14,>x19=stack32#38
# asm 2: stw <tx3=16,>x19=148(1)
stw 16,148(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 32) 
# asm 1: lwz >tx0=int32#11,32(<ctxp=int32#2)
# asm 2: lwz >tx0=13,32(<ctxp=4)
lwz 13,32(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x20  = tx0 
# asm 1: stw <tx0=int32#11,>x20=stack32#39
# asm 2: stw <tx0=13,>x20=152(1)
stw 13,152(1)

# qhasm: x21  = tx1
# asm 1: stw <tx1=int32#12,>x21=stack32#40
# asm 2: stw <tx1=14,>x21=156(1)
stw 14,156(1)

# qhasm: x22  = tx2 
# asm 1: stw <tx2=int32#13,>x22=stack32#41
# asm 2: stw <tx2=15,>x22=160(1)
stw 15,160(1)

# qhasm: x23  = tx3 
# asm 1: stw <tx3=int32#14,>x23=stack32#42
# asm 2: stw <tx3=16,>x23=164(1)
stw 16,164(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 36) 
# asm 1: lwz >tx0=int32#11,36(<ctxp=int32#2)
# asm 2: lwz >tx0=13,36(<ctxp=4)
lwz 13,36(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x24  = tx0 
# asm 1: stw <tx0=int32#11,>x24=stack32#43
# asm 2: stw <tx0=13,>x24=168(1)
stw 13,168(1)

# qhasm: x25  = tx1
# asm 1: stw <tx1=int32#12,>x25=stack32#44
# asm 2: stw <tx1=14,>x25=172(1)
stw 14,172(1)

# qhasm: x26  = tx2 
# asm 1: stw <tx2=int32#13,>x26=stack32#45
# asm 2: stw <tx2=15,>x26=176(1)
stw 15,176(1)

# qhasm: x27  = tx3 
# asm 1: stw <tx3=int32#14,>x27=stack32#46
# asm 2: stw <tx3=16,>x27=180(1)
stw 16,180(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 40) 
# asm 1: lwz >tx0=int32#11,40(<ctxp=int32#2)
# asm 2: lwz >tx0=13,40(<ctxp=4)
lwz 13,40(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x28  = tx0 
# asm 1: stw <tx0=int32#11,>x28=stack32#47
# asm 2: stw <tx0=13,>x28=184(1)
stw 13,184(1)

# qhasm: x29  = tx1
# asm 1: stw <tx1=int32#12,>x29=stack32#48
# asm 2: stw <tx1=14,>x29=188(1)
stw 14,188(1)

# qhasm: x30  = tx2 
# asm 1: stw <tx2=int32#13,>x30=stack32#49
# asm 2: stw <tx2=15,>x30=192(1)
stw 15,192(1)

# qhasm: x31  = tx3 
# asm 1: stw <tx3=int32#14,>x31=stack32#50
# asm 2: stw <tx3=16,>x31=196(1)
stw 16,196(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 44) 
# asm 1: lwz >tx0=int32#11,44(<ctxp=int32#2)
# asm 2: lwz >tx0=13,44(<ctxp=4)
lwz 13,44(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x32  = tx0 
# asm 1: stw <tx0=int32#11,>x32=stack32#51
# asm 2: stw <tx0=13,>x32=200(1)
stw 13,200(1)

# qhasm: x33  = tx1
# asm 1: stw <tx1=int32#12,>x33=stack32#52
# asm 2: stw <tx1=14,>x33=204(1)
stw 14,204(1)

# qhasm: x34  = tx2 
# asm 1: stw <tx2=int32#13,>x34=stack32#53
# asm 2: stw <tx2=15,>x34=208(1)
stw 15,208(1)

# qhasm: x35  = tx3 
# asm 1: stw <tx3=int32#14,>x35=stack32#54
# asm 2: stw <tx3=16,>x35=212(1)
stw 16,212(1)

# qhasm: tx0 = *(uint32 *) (ctxp + 48) 
# asm 1: lwz >tx0=int32#11,48(<ctxp=int32#2)
# asm 2: lwz >tx0=13,48(<ctxp=4)
lwz 13,48(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#11,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=13,<tx1=14
xor 14,13,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x36  = tx0 
# asm 1: stw <tx0=int32#11,>x36=stack32#55
# asm 2: stw <tx0=13,>x36=216(1)
stw 13,216(1)

# qhasm: x37  = tx1
# asm 1: stw <tx1=int32#12,>x37=stack32#56
# asm 2: stw <tx1=14,>x37=220(1)
stw 14,220(1)

# qhasm: x38  = tx2 
# asm 1: stw <tx2=int32#13,>x38=stack32#57
# asm 2: stw <tx2=15,>x38=224(1)
stw 15,224(1)

# qhasm: x39  = tx3 
# asm 1: stw <tx3=int32#14,>x39=stack32#58
# asm 2: stw <tx3=16,>x39=228(1)
stw 16,228(1)

# qhasm: y0 = *(uint32 *) (n0p + 0)
# asm 1: lwz >y0=int32#11,0(<n0p=int32#10)
# asm 2: lwz >y0=13,0(<n0p=12)
lwz 13,0(12)

# qhasm: tx0 = *(uint32 *) (ctxp + 52) 
# asm 1: lwz >tx0=int32#2,52(<ctxp=int32#2)
# asm 2: lwz >tx0=4,52(<ctxp=4)
lwz 4,52(4)

# qhasm: tx1 ^= tx0
# asm 1: xor >tx1=int32#12,<tx0=int32#2,<tx1=int32#12
# asm 2: xor >tx1=14,<tx0=4,<tx1=14
xor 14,4,14

# qhasm: tx2 ^= tx1
# asm 1: xor >tx2=int32#13,<tx1=int32#12,<tx2=int32#13
# asm 2: xor >tx2=15,<tx1=14,<tx2=15
xor 15,14,15

# qhasm: tx3 ^= tx2
# asm 1: xor >tx3=int32#14,<tx2=int32#13,<tx3=int32#14
# asm 2: xor >tx3=16,<tx2=15,<tx3=16
xor 16,15,16

# qhasm: x40  = tx0 
# asm 1: stw <tx0=int32#2,>x40=stack32#59
# asm 2: stw <tx0=4,>x40=232(1)
stw 4,232(1)

# qhasm: x41  = tx1
# asm 1: stw <tx1=int32#12,>x41=stack32#60
# asm 2: stw <tx1=14,>x41=236(1)
stw 14,236(1)

# qhasm: x42  = tx2 
# asm 1: stw <tx2=int32#13,>x42=stack32#61
# asm 2: stw <tx2=15,>x42=240(1)
stw 15,240(1)

# qhasm: x43  = tx3 
# asm 1: stw <tx3=int32#14,>x43=stack32#62
# asm 2: stw <tx3=16,>x43=244(1)
stw 16,244(1)

# qhasm: tx0 = x0
# asm 1: lwz >tx0=int32#2,<x0=stack32#19
# asm 2: lwz >tx0=4,<x0=72(1)
lwz 4,72(1)

# qhasm: y0 ^= tx0
# asm 1: xor >y0=int32#2,<tx0=int32#2,<y0=int32#11
# asm 2: xor >y0=4,<tx0=4,<y0=13
xor 4,4,13

# qhasm: goto precompute
b .label.precompute

# qhasm: mainloop:
.label.mainloop:

# qhasm: z0 ^= in0 
# asm 1: xor >z0=int32#12,<in0=int32#22,<z0=int32#12
# asm 2: xor >z0=14,<in0=24,<z0=14
xor 14,24,14

# qhasm: inp += 16
# asm 1: addi >inp=int32#3,<inp=int32#3,16
# asm 2: addi >inp=5,<inp=5,16
addi 5,5,16

# qhasm: *(uint32 *) (outp + 0) = z0
# asm 1: stw <z0=int32#12,0(<outp=int32#4)
# asm 2: stw <z0=14,0(<outp=6)
stw 14,0(6)

# qhasm: z1 ^= in1
# asm 1: xor >z1=int32#2,<in1=int32#11,<z1=int32#2
# asm 2: xor >z1=4,<in1=13,<z1=4
xor 4,13,4

# qhasm: *(uint32 *) (outp + 4) = z1
# asm 1: stw <z1=int32#2,4(<outp=int32#4)
# asm 2: stw <z1=4,4(<outp=6)
stw 4,4(6)

# qhasm: z2 ^= in2 
# asm 1: xor >z2=int32#2,<in2=int32#20,<z2=int32#19
# asm 2: xor >z2=4,<in2=22,<z2=21
xor 4,22,21

# qhasm: *(uint32 *) (outp + 8) = z2
# asm 1: stw <z2=int32#2,8(<outp=int32#4)
# asm 2: stw <z2=4,8(<outp=6)
stw 4,8(6)

# qhasm: z3 ^= in3 
# asm 1: xor >z3=int32#2,<in3=int32#15,<z3=int32#18
# asm 2: xor >z3=4,<in3=17,<z3=20
xor 4,17,20

# qhasm: check = y0 & (65536 * 0xff00)
# asm 1: andis. >check=int32#11,<y0=int32#14,0xff00
# asm 2: andis. >check=13,<y0=16,0xff00
andis. 13,16,0xff00

# qhasm: =? (uint32) check - 0
# asm 1: cmplwi <check=int32#11,0
# asm 2: cmplwi <check=13,0
cmplwi 13,0

# qhasm: *(uint32 *) (outp + 12) = z3
# asm 1: stw <z3=int32#2,12(<outp=int32#4)
# asm 2: stw <z3=4,12(<outp=6)
stw 4,12(6)

# qhasm: y0 ^= tx0
# asm 1: xor >y0=int32#2,<tx0=int32#13,<y0=int32#14
# asm 2: xor >y0=4,<tx0=15,<y0=16
xor 4,15,16

# qhasm: z0 = pre10
# asm 1: lwz >z0=int32#11,<pre10=stack32#63
# asm 2: lwz >z0=13,<pre10=248(1)
lwz 13,248(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#12,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=14,<y0=4,12,4080
rlwinm 14,4,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#12,<table0=int32#6,<p00=int32#12
# asm 2: lwzx >p00=14,<table0=8,<p00=14
lwzx 14,8,14

# qhasm: outp += 16
# asm 1: addi >outp=int32#4,<outp=int32#4,16
# asm 2: addi >outp=6,<outp=6,16
addi 6,6,16

# qhasm: goto after_precompute if !=
bne .label.after_precompute

# qhasm: precompute:
.label.precompute:

# qhasm: y1 = *(uint32 *) (n0p + 4)
# asm 1: lwz >y1=int32#11,4(<n0p=int32#10)
# asm 2: lwz >y1=13,4(<n0p=12)
lwz 13,4(12)

# qhasm: y2 = *(uint32 *) (n0p + 8)
# asm 1: lwz >y2=int32#12,8(<n0p=int32#10)
# asm 2: lwz >y2=14,8(<n0p=12)
lwz 14,8(12)

# qhasm: y3 = *(uint32 *) (n0p + 12)
# asm 1: lwz >y3=int32#13,12(<n0p=int32#10)
# asm 2: lwz >y3=15,12(<n0p=12)
lwz 15,12(12)

# qhasm: z0 = x4
# asm 1: lwz >z0=int32#14,<x4=stack32#23
# asm 2: lwz >z0=16,<x4=88(1)
lwz 16,88(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#15,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=17,<y0=4,20,4080
rlwinm 17,4,20,4080

# qhasm: z1 = x5
# asm 1: lwz >z1=int32#16,<x5=stack32#24
# asm 2: lwz >z1=18,<x5=92(1)
lwz 18,92(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#17,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=19,<y0=4,28,4080
rlwinm 19,4,28,4080

# qhasm: z2 = x6
# asm 1: lwz >z2=int32#18,<x6=stack32#25
# asm 2: lwz >z2=20,<x6=96(1)
lwz 20,96(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#19,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=21,<y0=4,4,4080
rlwinm 21,4,4,4080

# qhasm: z3 = x7
# asm 1: lwz >z3=int32#20,<x7=stack32#26
# asm 2: lwz >z3=22,<x7=100(1)
lwz 22,100(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#21,<y1=int32#11,12,4080
# asm 2: rlwinm >p10=23,<y1=13,12,4080
rlwinm 23,13,12,4080

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#22,<y1=int32#11,20,4080
# asm 2: rlwinm >p11=24,<y1=13,20,4080
rlwinm 24,13,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#15,<table1=int32#7,<p01=int32#15
# asm 2: lwzx >p01=17,<table1=9,<p01=17
lwzx 17,9,17

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#23,<y1=int32#11,28,4080
# asm 2: rlwinm >p12=25,<y1=13,28,4080
rlwinm 25,13,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#17,<table2=int32#9,<p02=int32#17
# asm 2: lwzx >p02=19,<table2=11,<p02=19
lwzx 19,11,19

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#11,<y1=int32#11,4,4080
# asm 2: rlwinm >p13=13,<y1=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#19,<table3=int32#1,<p03=int32#19
# asm 2: lwzx >p03=21,<table3=3,<p03=21
lwzx 21,3,21

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#21,<table0=int32#6,<p10=int32#21
# asm 2: lwzx >p10=23,<table0=8,<p10=23
lwzx 23,8,23

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#15,<p01=int32#15,<z3=int32#20
# asm 2: xor >z3=17,<p01=17,<z3=22
xor 17,17,22

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#20,<table1=int32#7,<p11=int32#22
# asm 2: lwzx >p11=22,<table1=9,<p11=24
lwzx 22,9,24

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#12,12,4080
# asm 2: rlwinm >p20=24,<y2=14,12,4080
rlwinm 24,14,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#17,<p02=int32#17,<z2=int32#18
# asm 2: xor >z2=19,<p02=19,<z2=20
xor 19,19,20

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#18,<table2=int32#9,<p12=int32#23
# asm 2: lwzx >p12=20,<table2=11,<p12=25
lwzx 20,11,25

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#12,20,4080
# asm 2: rlwinm >p21=25,<y2=14,20,4080
rlwinm 25,14,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#16,<p03=int32#19,<z1=int32#16
# asm 2: xor >z1=18,<p03=21,<z1=18
xor 18,21,18

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#11,<table3=int32#1,<p13=int32#11
# asm 2: lwzx >p13=13,<table3=3,<p13=13
lwzx 13,3,13

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#19,<y2=int32#12,28,4080
# asm 2: rlwinm >p22=21,<y2=14,28,4080
rlwinm 21,14,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#12,<y2=int32#12,4,4080
# asm 2: rlwinm >p23=14,<y2=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#13,12,4080
# asm 2: rlwinm >p30=26,<y3=15,12,4080
rlwinm 26,15,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#14,<p11=int32#20,<z0=int32#14
# asm 2: xor >z0=16,<p11=22,<z0=16
xor 16,22,16

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#9,<p22=int32#19
# asm 2: lwzx >p22=21,<table2=11,<p22=21
lwzx 21,11,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#20,<y3=int32#13,20,4080
# asm 2: rlwinm >p31=22,<y3=15,20,4080
rlwinm 22,15,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#16,<p10=int32#21,<z1=int32#16
# asm 2: xor >z1=18,<p10=23,<z1=18
xor 18,23,18

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#12,<table3=int32#1,<p23=int32#12
# asm 2: lwzx >p23=14,<table3=3,<p23=14
lwzx 14,3,14

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#21,<y3=int32#13,28,4080
# asm 2: rlwinm >p32=23,<y3=15,28,4080
rlwinm 23,15,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#13,<y3=int32#13,4,4080
# asm 2: rlwinm >p33=15,<y3=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#20,<table1=int32#7,<p31=int32#20
# asm 2: lwzx >p31=22,<table1=9,<p31=22
lwzx 22,9,22

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#15,<p12=int32#18,<z3=int32#15
# asm 2: xor >z3=17,<p12=20,<z3=17
xor 17,20,17

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#18,<table2=int32#9,<p32=int32#21
# asm 2: lwzx >p32=20,<table2=11,<p32=23
lwzx 20,11,23

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#11,<p13=int32#11,<z2=int32#17
# asm 2: xor >z2=13,<p13=13,<z2=19
xor 13,13,19

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#13,<table3=int32#1,<p33=int32#13
# asm 2: lwzx >p33=15,<table3=3,<p33=15
lwzx 15,3,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#11,<p20=int32#22,<z2=int32#11
# asm 2: xor >z2=13,<p20=24,<z2=13
xor 13,24,13

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#16,<p21=int32#23,<z1=int32#16
# asm 2: xor >z1=18,<p21=25,<z1=18
xor 18,25,18

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#14,<p22=int32#19,<z0=int32#14
# asm 2: xor >z0=16,<p22=21,<z0=16
xor 16,21,16

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#12,<p23=int32#12,<z3=int32#15
# asm 2: xor >z3=14,<p23=14,<z3=17
xor 14,14,17

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#11,<z2=int32#11,<p31=int32#20
# asm 2: xor >y2=13,<z2=13,<p31=22
xor 13,13,22

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#12,<z3=int32#12,<p30=int32#24
# asm 2: xor >y3=14,<z3=14,<p30=26
xor 14,14,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#15,<z1=int32#16,<p32=int32#18
# asm 2: xor >y1=17,<z1=18,<p32=20
xor 17,18,20

# qhasm: z0 = z0 ^ p33
# asm 1: xor >z0=int32#13,<z0=int32#14,<p33=int32#13
# asm 2: xor >z0=15,<z0=16,<p33=15
xor 15,16,15

# qhasm: pre10 = z0
# asm 1: stw <z0=int32#13,>pre10=stack32#63
# asm 2: stw <z0=15,>pre10=248(1)
stw 15,248(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#13,<y1=int32#15,12,4080
# asm 2: rlwinm >p10=15,<y1=17,12,4080
rlwinm 15,17,12,4080

# qhasm: z0 = x8
# asm 1: lwz >z0=int32#14,<x8=stack32#27
# asm 2: lwz >z0=16,<x8=104(1)
lwz 16,104(1)

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#16,<y1=int32#15,20,4080
# asm 2: rlwinm >p11=18,<y1=17,20,4080
rlwinm 18,17,20,4080

# qhasm: z1 = x9
# asm 1: lwz >z1=int32#17,<x9=stack32#28
# asm 2: lwz >z1=19,<x9=108(1)
lwz 19,108(1)

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#18,<y1=int32#15,28,4080
# asm 2: rlwinm >p12=20,<y1=17,28,4080
rlwinm 20,17,28,4080

# qhasm: z2 = x10
# asm 1: lwz >z2=int32#19,<x10=stack32#29
# asm 2: lwz >z2=21,<x10=112(1)
lwz 21,112(1)

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#15,<y1=int32#15,4,4080
# asm 2: rlwinm >p13=17,<y1=17,4,4080
rlwinm 17,17,4,4080

# qhasm: z3 = x11
# asm 1: lwz >z3=int32#20,<x11=stack32#30
# asm 2: lwz >z3=22,<x11=116(1)
lwz 22,116(1)

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#13,<table0=int32#6,<p10=int32#13
# asm 2: lwzx >p10=15,<table0=8,<p10=15
lwzx 15,8,15

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#21,<y2=int32#11,12,4080
# asm 2: rlwinm >p20=23,<y2=13,12,4080
rlwinm 23,13,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#16,<table1=int32#7,<p11=int32#16
# asm 2: lwzx >p11=18,<table1=9,<p11=18
lwzx 18,9,18

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#22,<y2=int32#11,20,4080
# asm 2: rlwinm >p21=24,<y2=13,20,4080
rlwinm 24,13,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#18,<table2=int32#9,<p12=int32#18
# asm 2: lwzx >p12=20,<table2=11,<p12=20
lwzx 20,11,20

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#23,<y2=int32#11,28,4080
# asm 2: rlwinm >p22=25,<y2=13,28,4080
rlwinm 25,13,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#15,<table3=int32#1,<p13=int32#15
# asm 2: lwzx >p13=17,<table3=3,<p13=17
lwzx 17,3,17

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#11,<y2=int32#11,4,4080
# asm 2: rlwinm >p23=13,<y2=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#21,<table0=int32#6,<p20=int32#21
# asm 2: lwzx >p20=23,<table0=8,<p20=23
lwzx 23,8,23

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#12,12,4080
# asm 2: rlwinm >p30=26,<y3=14,12,4080
rlwinm 26,14,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#22,<table1=int32#7,<p21=int32#22
# asm 2: lwzx >p21=24,<table1=9,<p21=24
lwzx 24,9,24

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#14,<p11=int32#16,<z0=int32#14
# asm 2: xor >z0=16,<p11=18,<z0=16
xor 16,18,16

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#16,<table2=int32#9,<p22=int32#23
# asm 2: lwzx >p22=18,<table2=11,<p22=25
lwzx 18,11,25

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#23,<y3=int32#12,20,4080
# asm 2: rlwinm >p31=25,<y3=14,20,4080
rlwinm 25,14,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#13,<p10=int32#13,<z1=int32#17
# asm 2: xor >z1=15,<p10=15,<z1=19
xor 15,15,19

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#11,<table3=int32#1,<p23=int32#11
# asm 2: lwzx >p23=13,<table3=3,<p23=13
lwzx 13,3,13

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#17,<y3=int32#12,28,4080
# asm 2: rlwinm >p32=19,<y3=14,28,4080
rlwinm 19,14,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#12,<y3=int32#12,4,4080
# asm 2: rlwinm >p33=14,<y3=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#23,<table1=int32#7,<p31=int32#23
# asm 2: lwzx >p31=25,<table1=9,<p31=25
lwzx 25,9,25

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#18,<p12=int32#18,<z3=int32#20
# asm 2: xor >z3=20,<p12=20,<z3=22
xor 20,20,22

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#9,<p32=int32#17
# asm 2: lwzx >p32=19,<table2=11,<p32=19
lwzx 19,11,19

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#15,<p13=int32#15,<z2=int32#19
# asm 2: xor >z2=17,<p13=17,<z2=21
xor 17,17,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#12,<table3=int32#1,<p33=int32#12
# asm 2: lwzx >p33=14,<table3=3,<p33=14
lwzx 14,3,14

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#15,<p20=int32#21,<z2=int32#15
# asm 2: xor >z2=17,<p20=23,<z2=17
xor 17,23,17

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#13,<p21=int32#22,<z1=int32#13
# asm 2: xor >z1=15,<p21=24,<z1=15
xor 15,24,15

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#14,<p22=int32#16,<z0=int32#14
# asm 2: xor >z0=16,<p22=18,<z0=16
xor 16,18,16

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#11,<p23=int32#11,<z3=int32#18
# asm 2: xor >z3=13,<p23=13,<z3=20
xor 13,13,20

# qhasm: z2 ^= p31
# asm 1: xor >z2=int32#15,<p31=int32#23,<z2=int32#15
# asm 2: xor >z2=17,<p31=25,<z2=17
xor 17,25,17

# qhasm: z3 ^= p30
# asm 1: xor >z3=int32#11,<p30=int32#24,<z3=int32#11
# asm 2: xor >z3=13,<p30=26,<z3=13
xor 13,26,13

# qhasm: z1 ^= p32
# asm 1: xor >z1=int32#13,<p32=int32#17,<z1=int32#13
# asm 2: xor >z1=15,<p32=19,<z1=15
xor 15,19,15

# qhasm: pre22 = z2
# asm 1: stw <z2=int32#15,>pre22=stack32#64
# asm 2: stw <z2=17,>pre22=252(1)
stw 17,252(1)

# qhasm: z0 ^= p33
# asm 1: xor >z0=int32#12,<p33=int32#12,<z0=int32#14
# asm 2: xor >z0=14,<p33=14,<z0=16
xor 14,14,16

# qhasm: pre23 = z3
# asm 1: stw <z3=int32#11,>pre23=stack32#65
# asm 2: stw <z3=13,>pre23=256(1)
stw 13,256(1)

# qhasm: pre20 = z0
# asm 1: stw <z0=int32#12,>pre20=stack32#66
# asm 2: stw <z0=14,>pre20=260(1)
stw 14,260(1)

# qhasm: pre21 = z1
# asm 1: stw <z1=int32#13,>pre21=stack32#67
# asm 2: stw <z1=15,>pre21=264(1)
stw 15,264(1)

# qhasm: z0 = pre10
# asm 1: lwz >z0=int32#11,<pre10=stack32#63
# asm 2: lwz >z0=13,<pre10=248(1)
lwz 13,248(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#2,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=4,<y0=4,12,4080
rlwinm 4,4,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#12,<table0=int32#6,<p00=int32#2
# asm 2: lwzx >p00=14,<table0=8,<p00=4
lwzx 14,8,4

# qhasm: after_precompute:
.label.after_precompute:

# qhasm: y0 = z0 ^ p00
# asm 1: xor >y0=int32#2,<z0=int32#11,<p00=int32#12
# asm 2: xor >y0=4,<z0=13,<p00=14
xor 4,13,14

# qhasm: n0 = *(swapendian uint32 *) n0p 
# asm 1: lwbrx >n0=int32#11,0,<n0p=int32#10
# asm 2: lwbrx >n0=13,0,<n0p=12
lwbrx 13,0,12

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#12,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=14,<y0=4,12,4080
rlwinm 14,4,12,4080

# qhasm: z0 = pre20
# asm 1: lwz >z0=int32#13,<pre20=stack32#66
# asm 2: lwz >z0=15,<pre20=260(1)
lwz 15,260(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#14,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=16,<y0=4,20,4080
rlwinm 16,4,20,4080

# qhasm: z1 = pre21
# asm 1: lwz >z1=int32#15,<pre21=stack32#67
# asm 2: lwz >z1=17,<pre21=264(1)
lwz 17,264(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#16,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=18,<y0=4,28,4080
rlwinm 18,4,28,4080

# qhasm: z2 = pre22
# asm 1: lwz >z2=int32#17,<pre22=stack32#64
# asm 2: lwz >z2=19,<pre22=252(1)
lwz 19,252(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#2,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=4,<y0=4,4,4080
rlwinm 4,4,4,4080

# qhasm: z3 = pre23
# asm 1: lwz >z3=int32#18,<pre23=stack32#65
# asm 2: lwz >z3=20,<pre23=256(1)
lwz 20,256(1)

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#12,<table0=int32#6,<p00=int32#12
# asm 2: lwzx >p00=14,<table0=8,<p00=14
lwzx 14,8,14

# qhasm: n0 = n0 + 1
# asm 1: addi >n0=int32#11,<n0=int32#11,1
# asm 2: addi >n0=13,<n0=13,1
addi 13,13,1

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#14,<table1=int32#7,<p01=int32#14
# asm 2: lwzx >p01=16,<table1=9,<p01=16
lwzx 16,9,16

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#16,<table2=int32#9,<p02=int32#16
# asm 2: lwzx >p02=18,<table2=11,<p02=18
lwzx 18,11,18

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#2,<table3=int32#1,<p03=int32#2
# asm 2: lwzx >p03=4,<table3=3,<p03=4
lwzx 4,3,4

# qhasm: y0 = z0 ^ p00
# asm 1: xor >y0=int32#12,<z0=int32#13,<p00=int32#12
# asm 2: xor >y0=14,<z0=15,<p00=14
xor 14,15,14

# qhasm: y3 = z3 ^ p01
# asm 1: xor >y3=int32#13,<z3=int32#18,<p01=int32#14
# asm 2: xor >y3=15,<z3=20,<p01=16
xor 15,20,16

# qhasm: y2 = z2 ^ p02
# asm 1: xor >y2=int32#14,<z2=int32#17,<p02=int32#16
# asm 2: xor >y2=16,<z2=19,<p02=18
xor 16,19,18

# qhasm: y1 = z1 ^ p03
# asm 1: xor >y1=int32#2,<z1=int32#15,<p03=int32#2
# asm 2: xor >y1=4,<z1=17,<p03=4
xor 4,17,4

# qhasm: z0 = x12
# asm 1: lwz >z0=int32#15,<x12=stack32#31
# asm 2: lwz >z0=17,<x12=120(1)
lwz 17,120(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#12,12,4080
# asm 2: rlwinm >p00=18,<y0=14,12,4080
rlwinm 18,14,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#12,20,4080
# asm 2: rlwinm >p01=19,<y0=14,20,4080
rlwinm 19,14,20,4080

# qhasm: z1 = x13
# asm 1: lwz >z1=int32#18,<x13=stack32#32
# asm 2: lwz >z1=20,<x13=124(1)
lwz 20,124(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#12,28,4080
# asm 2: rlwinm >p02=21,<y0=14,28,4080
rlwinm 21,14,28,4080

# qhasm: z2 = x14
# asm 1: lwz >z2=int32#20,<x14=stack32#33
# asm 2: lwz >z2=22,<x14=128(1)
lwz 22,128(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#12,<y0=int32#12,4,4080
# asm 2: rlwinm >p03=14,<y0=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z3 = x15
# asm 1: lwz >z3=int32#21,<x15=stack32#34
# asm 2: lwz >z3=23,<x15=132(1)
lwz 23,132(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#2,12,4080
# asm 2: rlwinm >p10=24,<y1=4,12,4080
rlwinm 24,4,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#2,20,4080
# asm 2: rlwinm >p11=25,<y1=4,20,4080
rlwinm 25,4,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#2,28,4080
# asm 2: rlwinm >p12=26,<y1=4,28,4080
rlwinm 26,4,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#2,<y1=int32#2,4,4080
# asm 2: rlwinm >p13=4,<y1=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#12,<table3=int32#1,<p03=int32#12
# asm 2: lwzx >p03=14,<table3=3,<p03=14
lwzx 14,3,14

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#14,12,4080
# asm 2: rlwinm >p20=24,<y2=16,12,4080
rlwinm 24,16,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#14,20,4080
# asm 2: rlwinm >p21=25,<y2=16,20,4080
rlwinm 25,16,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#12,<p03=int32#12,<z1=int32#18
# asm 2: xor >z1=14,<p03=14,<z1=20
xor 14,14,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#2,<table3=int32#1,<p13=int32#2
# asm 2: lwzx >p13=4,<table3=3,<p13=4
lwzx 4,3,4

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#14,28,4080
# asm 2: rlwinm >p22=20,<y2=16,28,4080
rlwinm 20,16,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#14,<y2=int32#14,4,4080
# asm 2: rlwinm >p23=16,<y2=16,4,4080
rlwinm 16,16,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#13,12,4080
# asm 2: rlwinm >p30=26,<y3=15,12,4080
rlwinm 26,15,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#13,20,4080
# asm 2: rlwinm >p31=23,<y3=15,20,4080
rlwinm 23,15,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#12,<p10=int32#16,<z1=int32#12
# asm 2: xor >z1=14,<p10=18,<z1=14
xor 14,18,14

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#14,<table3=int32#1,<p23=int32#14
# asm 2: lwzx >p23=16,<table3=3,<p23=16
lwzx 16,3,16

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#13,28,4080
# asm 2: rlwinm >p32=18,<y3=15,28,4080
rlwinm 18,15,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#13,<y3=int32#13,4,4080
# asm 2: rlwinm >p33=15,<y3=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#2,<p13=int32#2,<z2=int32#19
# asm 2: xor >z2=4,<p13=4,<z2=21
xor 4,4,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#13,<table3=int32#1,<p33=int32#13
# asm 2: lwzx >p33=15,<table3=3,<p33=15
lwzx 15,3,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#2,<p20=int32#22,<z2=int32#2
# asm 2: xor >z2=4,<p20=24,<z2=4
xor 4,24,4

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#12,<p21=int32#23,<z1=int32#12
# asm 2: xor >z1=14,<p21=25,<z1=14
xor 14,25,14

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#14,<p23=int32#14,<z3=int32#17
# asm 2: xor >z3=16,<p23=16,<z3=19
xor 16,16,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#2,<z2=int32#2,<p31=int32#21
# asm 2: xor >y2=4,<z2=4,<p31=23
xor 4,4,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#14,<z3=int32#14,<p30=int32#24
# asm 2: xor >y3=16,<z3=16,<p30=26
xor 16,16,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#12,<z1=int32#12,<p32=int32#16
# asm 2: xor >y1=14,<z1=14,<p32=18
xor 14,14,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#13,<z0=int32#15,<p33=int32#13
# asm 2: xor >y0=15,<z0=17,<p33=15
xor 15,17,15

# qhasm: z0 = x16
# asm 1: lwz >z0=int32#15,<x16=stack32#35
# asm 2: lwz >z0=17,<x16=136(1)
lwz 17,136(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#13,12,4080
# asm 2: rlwinm >p00=18,<y0=15,12,4080
rlwinm 18,15,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#13,20,4080
# asm 2: rlwinm >p01=19,<y0=15,20,4080
rlwinm 19,15,20,4080

# qhasm: z1 = x17
# asm 1: lwz >z1=int32#18,<x17=stack32#36
# asm 2: lwz >z1=20,<x17=140(1)
lwz 20,140(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#13,28,4080
# asm 2: rlwinm >p02=21,<y0=15,28,4080
rlwinm 21,15,28,4080

# qhasm: z2 = x18
# asm 1: lwz >z2=int32#20,<x18=stack32#37
# asm 2: lwz >z2=22,<x18=144(1)
lwz 22,144(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#13,<y0=int32#13,4,4080
# asm 2: rlwinm >p03=15,<y0=15,4,4080
rlwinm 15,15,4,4080

# qhasm: z3 = x19
# asm 1: lwz >z3=int32#21,<x19=stack32#38
# asm 2: lwz >z3=23,<x19=148(1)
lwz 23,148(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#12,12,4080
# asm 2: rlwinm >p10=24,<y1=14,12,4080
rlwinm 24,14,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#12,20,4080
# asm 2: rlwinm >p11=25,<y1=14,20,4080
rlwinm 25,14,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#12,28,4080
# asm 2: rlwinm >p12=26,<y1=14,28,4080
rlwinm 26,14,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#12,<y1=int32#12,4,4080
# asm 2: rlwinm >p13=14,<y1=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#13,<table3=int32#1,<p03=int32#13
# asm 2: lwzx >p03=15,<table3=3,<p03=15
lwzx 15,3,15

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#2,12,4080
# asm 2: rlwinm >p20=24,<y2=4,12,4080
rlwinm 24,4,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#2,20,4080
# asm 2: rlwinm >p21=25,<y2=4,20,4080
rlwinm 25,4,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#13,<p03=int32#13,<z1=int32#18
# asm 2: xor >z1=15,<p03=15,<z1=20
xor 15,15,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#12,<table3=int32#1,<p13=int32#12
# asm 2: lwzx >p13=14,<table3=3,<p13=14
lwzx 14,3,14

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#2,28,4080
# asm 2: rlwinm >p22=20,<y2=4,28,4080
rlwinm 20,4,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#2,<y2=int32#2,4,4080
# asm 2: rlwinm >p23=4,<y2=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#14,12,4080
# asm 2: rlwinm >p30=26,<y3=16,12,4080
rlwinm 26,16,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#14,20,4080
# asm 2: rlwinm >p31=23,<y3=16,20,4080
rlwinm 23,16,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#13,<p10=int32#16,<z1=int32#13
# asm 2: xor >z1=15,<p10=18,<z1=15
xor 15,18,15

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#2,<table3=int32#1,<p23=int32#2
# asm 2: lwzx >p23=4,<table3=3,<p23=4
lwzx 4,3,4

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#14,28,4080
# asm 2: rlwinm >p32=18,<y3=16,28,4080
rlwinm 18,16,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#14,<y3=int32#14,4,4080
# asm 2: rlwinm >p33=16,<y3=16,4,4080
rlwinm 16,16,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#12,<p13=int32#12,<z2=int32#19
# asm 2: xor >z2=14,<p13=14,<z2=21
xor 14,14,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#14,<table3=int32#1,<p33=int32#14
# asm 2: lwzx >p33=16,<table3=3,<p33=16
lwzx 16,3,16

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#12,<p20=int32#22,<z2=int32#12
# asm 2: xor >z2=14,<p20=24,<z2=14
xor 14,24,14

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#13,<p21=int32#23,<z1=int32#13
# asm 2: xor >z1=15,<p21=25,<z1=15
xor 15,25,15

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#2,<p23=int32#2,<z3=int32#17
# asm 2: xor >z3=4,<p23=4,<z3=19
xor 4,4,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#12,<z2=int32#12,<p31=int32#21
# asm 2: xor >y2=14,<z2=14,<p31=23
xor 14,14,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#2,<z3=int32#2,<p30=int32#24
# asm 2: xor >y3=4,<z3=4,<p30=26
xor 4,4,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#13,<z1=int32#13,<p32=int32#16
# asm 2: xor >y1=15,<z1=15,<p32=18
xor 15,15,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#14,<z0=int32#15,<p33=int32#14
# asm 2: xor >y0=16,<z0=17,<p33=16
xor 16,17,16

# qhasm: z0 = x20
# asm 1: lwz >z0=int32#15,<x20=stack32#39
# asm 2: lwz >z0=17,<x20=152(1)
lwz 17,152(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#14,12,4080
# asm 2: rlwinm >p00=18,<y0=16,12,4080
rlwinm 18,16,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#14,20,4080
# asm 2: rlwinm >p01=19,<y0=16,20,4080
rlwinm 19,16,20,4080

# qhasm: z1 = x21
# asm 1: lwz >z1=int32#18,<x21=stack32#40
# asm 2: lwz >z1=20,<x21=156(1)
lwz 20,156(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#14,28,4080
# asm 2: rlwinm >p02=21,<y0=16,28,4080
rlwinm 21,16,28,4080

# qhasm: z2 = x22
# asm 1: lwz >z2=int32#20,<x22=stack32#41
# asm 2: lwz >z2=22,<x22=160(1)
lwz 22,160(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#14,<y0=int32#14,4,4080
# asm 2: rlwinm >p03=16,<y0=16,4,4080
rlwinm 16,16,4,4080

# qhasm: z3 = x23
# asm 1: lwz >z3=int32#21,<x23=stack32#42
# asm 2: lwz >z3=23,<x23=164(1)
lwz 23,164(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#13,12,4080
# asm 2: rlwinm >p10=24,<y1=15,12,4080
rlwinm 24,15,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#13,20,4080
# asm 2: rlwinm >p11=25,<y1=15,20,4080
rlwinm 25,15,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#13,28,4080
# asm 2: rlwinm >p12=26,<y1=15,28,4080
rlwinm 26,15,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#13,<y1=int32#13,4,4080
# asm 2: rlwinm >p13=15,<y1=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#14,<table3=int32#1,<p03=int32#14
# asm 2: lwzx >p03=16,<table3=3,<p03=16
lwzx 16,3,16

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#12,12,4080
# asm 2: rlwinm >p20=24,<y2=14,12,4080
rlwinm 24,14,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#12,20,4080
# asm 2: rlwinm >p21=25,<y2=14,20,4080
rlwinm 25,14,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#14,<p03=int32#14,<z1=int32#18
# asm 2: xor >z1=16,<p03=16,<z1=20
xor 16,16,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#13,<table3=int32#1,<p13=int32#13
# asm 2: lwzx >p13=15,<table3=3,<p13=15
lwzx 15,3,15

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#12,28,4080
# asm 2: rlwinm >p22=20,<y2=14,28,4080
rlwinm 20,14,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#12,<y2=int32#12,4,4080
# asm 2: rlwinm >p23=14,<y2=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#2,12,4080
# asm 2: rlwinm >p30=26,<y3=4,12,4080
rlwinm 26,4,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#2,20,4080
# asm 2: rlwinm >p31=23,<y3=4,20,4080
rlwinm 23,4,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#14,<p10=int32#16,<z1=int32#14
# asm 2: xor >z1=16,<p10=18,<z1=16
xor 16,18,16

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#12,<table3=int32#1,<p23=int32#12
# asm 2: lwzx >p23=14,<table3=3,<p23=14
lwzx 14,3,14

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#2,28,4080
# asm 2: rlwinm >p32=18,<y3=4,28,4080
rlwinm 18,4,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#2,<y3=int32#2,4,4080
# asm 2: rlwinm >p33=4,<y3=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#13,<p13=int32#13,<z2=int32#19
# asm 2: xor >z2=15,<p13=15,<z2=21
xor 15,15,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#2,<table3=int32#1,<p33=int32#2
# asm 2: lwzx >p33=4,<table3=3,<p33=4
lwzx 4,3,4

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#13,<p20=int32#22,<z2=int32#13
# asm 2: xor >z2=15,<p20=24,<z2=15
xor 15,24,15

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#14,<p21=int32#23,<z1=int32#14
# asm 2: xor >z1=16,<p21=25,<z1=16
xor 16,25,16

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#12,<p23=int32#12,<z3=int32#17
# asm 2: xor >z3=14,<p23=14,<z3=19
xor 14,14,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#13,<z2=int32#13,<p31=int32#21
# asm 2: xor >y2=15,<z2=15,<p31=23
xor 15,15,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#12,<z3=int32#12,<p30=int32#24
# asm 2: xor >y3=14,<z3=14,<p30=26
xor 14,14,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#14,<z1=int32#14,<p32=int32#16
# asm 2: xor >y1=16,<z1=16,<p32=18
xor 16,16,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#2,<z0=int32#15,<p33=int32#2
# asm 2: xor >y0=4,<z0=17,<p33=4
xor 4,17,4

# qhasm: z0 = x24
# asm 1: lwz >z0=int32#15,<x24=stack32#43
# asm 2: lwz >z0=17,<x24=168(1)
lwz 17,168(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=18,<y0=4,12,4080
rlwinm 18,4,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=19,<y0=4,20,4080
rlwinm 19,4,20,4080

# qhasm: z1 = x25
# asm 1: lwz >z1=int32#18,<x25=stack32#44
# asm 2: lwz >z1=20,<x25=172(1)
lwz 20,172(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=21,<y0=4,28,4080
rlwinm 21,4,28,4080

# qhasm: z2 = x26
# asm 1: lwz >z2=int32#20,<x26=stack32#45
# asm 2: lwz >z2=22,<x26=176(1)
lwz 22,176(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#2,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=4,<y0=4,4,4080
rlwinm 4,4,4,4080

# qhasm: z3 = x27
# asm 1: lwz >z3=int32#21,<x27=stack32#46
# asm 2: lwz >z3=23,<x27=180(1)
lwz 23,180(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#14,12,4080
# asm 2: rlwinm >p10=24,<y1=16,12,4080
rlwinm 24,16,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#14,20,4080
# asm 2: rlwinm >p11=25,<y1=16,20,4080
rlwinm 25,16,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#14,28,4080
# asm 2: rlwinm >p12=26,<y1=16,28,4080
rlwinm 26,16,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#14,<y1=int32#14,4,4080
# asm 2: rlwinm >p13=16,<y1=16,4,4080
rlwinm 16,16,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#2,<table3=int32#1,<p03=int32#2
# asm 2: lwzx >p03=4,<table3=3,<p03=4
lwzx 4,3,4

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#13,12,4080
# asm 2: rlwinm >p20=24,<y2=15,12,4080
rlwinm 24,15,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#13,20,4080
# asm 2: rlwinm >p21=25,<y2=15,20,4080
rlwinm 25,15,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#2,<p03=int32#2,<z1=int32#18
# asm 2: xor >z1=4,<p03=4,<z1=20
xor 4,4,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#14,<table3=int32#1,<p13=int32#14
# asm 2: lwzx >p13=16,<table3=3,<p13=16
lwzx 16,3,16

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#13,28,4080
# asm 2: rlwinm >p22=20,<y2=15,28,4080
rlwinm 20,15,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#13,<y2=int32#13,4,4080
# asm 2: rlwinm >p23=15,<y2=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#12,12,4080
# asm 2: rlwinm >p30=26,<y3=14,12,4080
rlwinm 26,14,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#12,20,4080
# asm 2: rlwinm >p31=23,<y3=14,20,4080
rlwinm 23,14,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#2,<p10=int32#16,<z1=int32#2
# asm 2: xor >z1=4,<p10=18,<z1=4
xor 4,18,4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#13,<table3=int32#1,<p23=int32#13
# asm 2: lwzx >p23=15,<table3=3,<p23=15
lwzx 15,3,15

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#12,28,4080
# asm 2: rlwinm >p32=18,<y3=14,28,4080
rlwinm 18,14,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#12,<y3=int32#12,4,4080
# asm 2: rlwinm >p33=14,<y3=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#14,<p13=int32#14,<z2=int32#19
# asm 2: xor >z2=16,<p13=16,<z2=21
xor 16,16,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#12,<table3=int32#1,<p33=int32#12
# asm 2: lwzx >p33=14,<table3=3,<p33=14
lwzx 14,3,14

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#14,<p20=int32#22,<z2=int32#14
# asm 2: xor >z2=16,<p20=24,<z2=16
xor 16,24,16

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#2,<p21=int32#23,<z1=int32#2
# asm 2: xor >z1=4,<p21=25,<z1=4
xor 4,25,4

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#13,<p23=int32#13,<z3=int32#17
# asm 2: xor >z3=15,<p23=15,<z3=19
xor 15,15,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#14,<z2=int32#14,<p31=int32#21
# asm 2: xor >y2=16,<z2=16,<p31=23
xor 16,16,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#13,<z3=int32#13,<p30=int32#24
# asm 2: xor >y3=15,<z3=15,<p30=26
xor 15,15,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#2,<z1=int32#2,<p32=int32#16
# asm 2: xor >y1=4,<z1=4,<p32=18
xor 4,4,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#12,<z0=int32#15,<p33=int32#12
# asm 2: xor >y0=14,<z0=17,<p33=14
xor 14,17,14

# qhasm: z0 = x28
# asm 1: lwz >z0=int32#15,<x28=stack32#47
# asm 2: lwz >z0=17,<x28=184(1)
lwz 17,184(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#12,12,4080
# asm 2: rlwinm >p00=18,<y0=14,12,4080
rlwinm 18,14,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#12,20,4080
# asm 2: rlwinm >p01=19,<y0=14,20,4080
rlwinm 19,14,20,4080

# qhasm: z1 = x29
# asm 1: lwz >z1=int32#18,<x29=stack32#48
# asm 2: lwz >z1=20,<x29=188(1)
lwz 20,188(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#12,28,4080
# asm 2: rlwinm >p02=21,<y0=14,28,4080
rlwinm 21,14,28,4080

# qhasm: z2 = x30
# asm 1: lwz >z2=int32#20,<x30=stack32#49
# asm 2: lwz >z2=22,<x30=192(1)
lwz 22,192(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#12,<y0=int32#12,4,4080
# asm 2: rlwinm >p03=14,<y0=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z3 = x31
# asm 1: lwz >z3=int32#21,<x31=stack32#50
# asm 2: lwz >z3=23,<x31=196(1)
lwz 23,196(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#2,12,4080
# asm 2: rlwinm >p10=24,<y1=4,12,4080
rlwinm 24,4,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#2,20,4080
# asm 2: rlwinm >p11=25,<y1=4,20,4080
rlwinm 25,4,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#2,28,4080
# asm 2: rlwinm >p12=26,<y1=4,28,4080
rlwinm 26,4,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#2,<y1=int32#2,4,4080
# asm 2: rlwinm >p13=4,<y1=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#12,<table3=int32#1,<p03=int32#12
# asm 2: lwzx >p03=14,<table3=3,<p03=14
lwzx 14,3,14

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#14,12,4080
# asm 2: rlwinm >p20=24,<y2=16,12,4080
rlwinm 24,16,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#14,20,4080
# asm 2: rlwinm >p21=25,<y2=16,20,4080
rlwinm 25,16,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#12,<p03=int32#12,<z1=int32#18
# asm 2: xor >z1=14,<p03=14,<z1=20
xor 14,14,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#2,<table3=int32#1,<p13=int32#2
# asm 2: lwzx >p13=4,<table3=3,<p13=4
lwzx 4,3,4

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#14,28,4080
# asm 2: rlwinm >p22=20,<y2=16,28,4080
rlwinm 20,16,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#14,<y2=int32#14,4,4080
# asm 2: rlwinm >p23=16,<y2=16,4,4080
rlwinm 16,16,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#13,12,4080
# asm 2: rlwinm >p30=26,<y3=15,12,4080
rlwinm 26,15,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#13,20,4080
# asm 2: rlwinm >p31=23,<y3=15,20,4080
rlwinm 23,15,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#12,<p10=int32#16,<z1=int32#12
# asm 2: xor >z1=14,<p10=18,<z1=14
xor 14,18,14

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#14,<table3=int32#1,<p23=int32#14
# asm 2: lwzx >p23=16,<table3=3,<p23=16
lwzx 16,3,16

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#13,28,4080
# asm 2: rlwinm >p32=18,<y3=15,28,4080
rlwinm 18,15,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#13,<y3=int32#13,4,4080
# asm 2: rlwinm >p33=15,<y3=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#2,<p13=int32#2,<z2=int32#19
# asm 2: xor >z2=4,<p13=4,<z2=21
xor 4,4,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#13,<table3=int32#1,<p33=int32#13
# asm 2: lwzx >p33=15,<table3=3,<p33=15
lwzx 15,3,15

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#2,<p20=int32#22,<z2=int32#2
# asm 2: xor >z2=4,<p20=24,<z2=4
xor 4,24,4

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#12,<p21=int32#23,<z1=int32#12
# asm 2: xor >z1=14,<p21=25,<z1=14
xor 14,25,14

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#14,<p23=int32#14,<z3=int32#17
# asm 2: xor >z3=16,<p23=16,<z3=19
xor 16,16,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#2,<z2=int32#2,<p31=int32#21
# asm 2: xor >y2=4,<z2=4,<p31=23
xor 4,4,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#14,<z3=int32#14,<p30=int32#24
# asm 2: xor >y3=16,<z3=16,<p30=26
xor 16,16,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#12,<z1=int32#12,<p32=int32#16
# asm 2: xor >y1=14,<z1=14,<p32=18
xor 14,14,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#13,<z0=int32#15,<p33=int32#13
# asm 2: xor >y0=15,<z0=17,<p33=15
xor 15,17,15

# qhasm: z0 = x32
# asm 1: lwz >z0=int32#15,<x32=stack32#51
# asm 2: lwz >z0=17,<x32=200(1)
lwz 17,200(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#13,12,4080
# asm 2: rlwinm >p00=18,<y0=15,12,4080
rlwinm 18,15,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#13,20,4080
# asm 2: rlwinm >p01=19,<y0=15,20,4080
rlwinm 19,15,20,4080

# qhasm: z1 = x33
# asm 1: lwz >z1=int32#18,<x33=stack32#52
# asm 2: lwz >z1=20,<x33=204(1)
lwz 20,204(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#13,28,4080
# asm 2: rlwinm >p02=21,<y0=15,28,4080
rlwinm 21,15,28,4080

# qhasm: z2 = x34
# asm 1: lwz >z2=int32#20,<x34=stack32#53
# asm 2: lwz >z2=22,<x34=208(1)
lwz 22,208(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#13,<y0=int32#13,4,4080
# asm 2: rlwinm >p03=15,<y0=15,4,4080
rlwinm 15,15,4,4080

# qhasm: z3 = x35
# asm 1: lwz >z3=int32#21,<x35=stack32#54
# asm 2: lwz >z3=23,<x35=212(1)
lwz 23,212(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#12,12,4080
# asm 2: rlwinm >p10=24,<y1=14,12,4080
rlwinm 24,14,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#12,20,4080
# asm 2: rlwinm >p11=25,<y1=14,20,4080
rlwinm 25,14,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#12,28,4080
# asm 2: rlwinm >p12=26,<y1=14,28,4080
rlwinm 26,14,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#12,<y1=int32#12,4,4080
# asm 2: rlwinm >p13=14,<y1=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#13,<table3=int32#1,<p03=int32#13
# asm 2: lwzx >p03=15,<table3=3,<p03=15
lwzx 15,3,15

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#2,12,4080
# asm 2: rlwinm >p20=24,<y2=4,12,4080
rlwinm 24,4,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#2,20,4080
# asm 2: rlwinm >p21=25,<y2=4,20,4080
rlwinm 25,4,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#13,<p03=int32#13,<z1=int32#18
# asm 2: xor >z1=15,<p03=15,<z1=20
xor 15,15,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#12,<table3=int32#1,<p13=int32#12
# asm 2: lwzx >p13=14,<table3=3,<p13=14
lwzx 14,3,14

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#2,28,4080
# asm 2: rlwinm >p22=20,<y2=4,28,4080
rlwinm 20,4,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#2,<y2=int32#2,4,4080
# asm 2: rlwinm >p23=4,<y2=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#14,12,4080
# asm 2: rlwinm >p30=26,<y3=16,12,4080
rlwinm 26,16,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#14,20,4080
# asm 2: rlwinm >p31=23,<y3=16,20,4080
rlwinm 23,16,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#13,<p10=int32#16,<z1=int32#13
# asm 2: xor >z1=15,<p10=18,<z1=15
xor 15,18,15

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#2,<table3=int32#1,<p23=int32#2
# asm 2: lwzx >p23=4,<table3=3,<p23=4
lwzx 4,3,4

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#14,28,4080
# asm 2: rlwinm >p32=18,<y3=16,28,4080
rlwinm 18,16,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#14,<y3=int32#14,4,4080
# asm 2: rlwinm >p33=16,<y3=16,4,4080
rlwinm 16,16,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#12,<p13=int32#12,<z2=int32#19
# asm 2: xor >z2=14,<p13=14,<z2=21
xor 14,14,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#14,<table3=int32#1,<p33=int32#14
# asm 2: lwzx >p33=16,<table3=3,<p33=16
lwzx 16,3,16

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#12,<p20=int32#22,<z2=int32#12
# asm 2: xor >z2=14,<p20=24,<z2=14
xor 14,24,14

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#13,<p21=int32#23,<z1=int32#13
# asm 2: xor >z1=15,<p21=25,<z1=15
xor 15,25,15

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#2,<p23=int32#2,<z3=int32#17
# asm 2: xor >z3=4,<p23=4,<z3=19
xor 4,4,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#12,<z2=int32#12,<p31=int32#21
# asm 2: xor >y2=14,<z2=14,<p31=23
xor 14,14,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#2,<z3=int32#2,<p30=int32#24
# asm 2: xor >y3=4,<z3=4,<p30=26
xor 4,4,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#13,<z1=int32#13,<p32=int32#16
# asm 2: xor >y1=15,<z1=15,<p32=18
xor 15,15,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#14,<z0=int32#15,<p33=int32#14
# asm 2: xor >y0=16,<z0=17,<p33=16
xor 16,17,16

# qhasm: z0 = x36
# asm 1: lwz >z0=int32#15,<x36=stack32#55
# asm 2: lwz >z0=17,<x36=216(1)
lwz 17,216(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#14,12,4080
# asm 2: rlwinm >p00=18,<y0=16,12,4080
rlwinm 18,16,12,4080

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#17,<y0=int32#14,20,4080
# asm 2: rlwinm >p01=19,<y0=16,20,4080
rlwinm 19,16,20,4080

# qhasm: z1 = x37
# asm 1: lwz >z1=int32#18,<x37=stack32#56
# asm 2: lwz >z1=20,<x37=220(1)
lwz 20,220(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#19,<y0=int32#14,28,4080
# asm 2: rlwinm >p02=21,<y0=16,28,4080
rlwinm 21,16,28,4080

# qhasm: z2 = x38
# asm 1: lwz >z2=int32#20,<x38=stack32#57
# asm 2: lwz >z2=22,<x38=224(1)
lwz 22,224(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#14,<y0=int32#14,4,4080
# asm 2: rlwinm >p03=16,<y0=16,4,4080
rlwinm 16,16,4,4080

# qhasm: z3 = x39
# asm 1: lwz >z3=int32#21,<x39=stack32#58
# asm 2: lwz >z3=23,<x39=228(1)
lwz 23,228(1)

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#13,12,4080
# asm 2: rlwinm >p10=24,<y1=15,12,4080
rlwinm 24,15,12,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p11 = 4080 & (y1 <<< 20) 
# asm 1: rlwinm >p11=int32#23,<y1=int32#13,20,4080
# asm 2: rlwinm >p11=25,<y1=15,20,4080
rlwinm 25,15,20,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#17,<table1=int32#7,<p01=int32#17
# asm 2: lwzx >p01=19,<table1=9,<p01=19
lwzx 19,9,19

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#13,28,4080
# asm 2: rlwinm >p12=26,<y1=15,28,4080
rlwinm 26,15,28,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#19,<table2=int32#9,<p02=int32#19
# asm 2: lwzx >p02=21,<table2=11,<p02=21
lwzx 21,11,21

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#13,<y1=int32#13,4,4080
# asm 2: rlwinm >p13=15,<y1=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#14,<table3=int32#1,<p03=int32#14
# asm 2: lwzx >p03=16,<table3=3,<p03=16
lwzx 16,3,16

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#22
# asm 2: lwzx >p10=18,<table0=8,<p10=24
lwzx 18,8,24

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#17,<p01=int32#17,<z3=int32#21
# asm 2: xor >z3=19,<p01=19,<z3=23
xor 19,19,23

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#21,<table1=int32#7,<p11=int32#23
# asm 2: lwzx >p11=23,<table1=9,<p11=25
lwzx 23,9,25

# qhasm: p20 = 4080 & (y2 <<< 12) 
# asm 1: rlwinm >p20=int32#22,<y2=int32#12,12,4080
# asm 2: rlwinm >p20=24,<y2=14,12,4080
rlwinm 24,14,12,4080

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#19,<z2=int32#20
# asm 2: xor >z2=21,<p02=21,<z2=22
xor 21,21,22

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#9,<p12=int32#24
# asm 2: lwzx >p12=22,<table2=11,<p12=26
lwzx 22,11,26

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#23,<y2=int32#12,20,4080
# asm 2: rlwinm >p21=25,<y2=14,20,4080
rlwinm 25,14,20,4080

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#14,<p03=int32#14,<z1=int32#18
# asm 2: xor >z1=16,<p03=16,<z1=20
xor 16,16,20

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#13,<table3=int32#1,<p13=int32#13
# asm 2: lwzx >p13=15,<table3=3,<p13=15
lwzx 15,3,15

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#18,<y2=int32#12,28,4080
# asm 2: rlwinm >p22=20,<y2=14,28,4080
rlwinm 20,14,28,4080

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#22,<table0=int32#6,<p20=int32#22
# asm 2: lwzx >p20=24,<table0=8,<p20=24
lwzx 24,8,24

# qhasm: p23 = 4080 & (y2 <<< 4) 
# asm 1: rlwinm >p23=int32#12,<y2=int32#12,4,4080
# asm 2: rlwinm >p23=14,<y2=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#23,<table1=int32#7,<p21=int32#23
# asm 2: lwzx >p21=25,<table1=9,<p21=25
lwzx 25,9,25

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#24,<y3=int32#2,12,4080
# asm 2: rlwinm >p30=26,<y3=4,12,4080
rlwinm 26,4,12,4080

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#21,<z0=int32#15
# asm 2: xor >z0=17,<p11=23,<z0=17
xor 17,23,17

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#18,<table2=int32#9,<p22=int32#18
# asm 2: lwzx >p22=20,<table2=11,<p22=20
lwzx 20,11,20

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#21,<y3=int32#2,20,4080
# asm 2: rlwinm >p31=23,<y3=4,20,4080
rlwinm 23,4,20,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#14,<p10=int32#16,<z1=int32#14
# asm 2: xor >z1=16,<p10=18,<z1=16
xor 16,18,16

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#12,<table3=int32#1,<p23=int32#12
# asm 2: lwzx >p23=14,<table3=3,<p23=14
lwzx 14,3,14

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#16,<y3=int32#2,28,4080
# asm 2: rlwinm >p32=18,<y3=4,28,4080
rlwinm 18,4,28,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#24,<table0=int32#6,<p30=int32#24
# asm 2: lwzx >p30=26,<table0=8,<p30=26
lwzx 26,8,26

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#2,<y3=int32#2,4,4080
# asm 2: rlwinm >p33=4,<y3=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#21,<table1=int32#7,<p31=int32#21
# asm 2: lwzx >p31=23,<table1=9,<p31=23
lwzx 23,9,23

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#17,<p12=int32#20,<z3=int32#17
# asm 2: xor >z3=19,<p12=22,<z3=19
xor 19,22,19

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#16,<table2=int32#9,<p32=int32#16
# asm 2: lwzx >p32=18,<table2=11,<p32=18
lwzx 18,11,18

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#13,<p13=int32#13,<z2=int32#19
# asm 2: xor >z2=15,<p13=15,<z2=21
xor 15,15,21

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#2,<table3=int32#1,<p33=int32#2
# asm 2: lwzx >p33=4,<table3=3,<p33=4
lwzx 4,3,4

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#13,<p20=int32#22,<z2=int32#13
# asm 2: xor >z2=15,<p20=24,<z2=15
xor 15,24,15

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#14,<p21=int32#23,<z1=int32#14
# asm 2: xor >z1=16,<p21=25,<z1=16
xor 16,25,16

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p22=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#12,<p23=int32#12,<z3=int32#17
# asm 2: xor >z3=14,<p23=14,<z3=19
xor 14,14,19

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#13,<z2=int32#13,<p31=int32#21
# asm 2: xor >y2=15,<z2=15,<p31=23
xor 15,15,23

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#12,<z3=int32#12,<p30=int32#24
# asm 2: xor >y3=14,<z3=14,<p30=26
xor 14,14,26

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#14,<z1=int32#14,<p32=int32#16
# asm 2: xor >y1=16,<z1=16,<p32=18
xor 16,16,18

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#2,<z0=int32#15,<p33=int32#2
# asm 2: xor >y0=4,<z0=17,<p33=4
xor 4,17,4

# qhasm: z0 = x40
# asm 1: lwz >z0=int32#15,<x40=stack32#59
# asm 2: lwz >z0=17,<x40=232(1)
lwz 17,232(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#2,12,4080
# asm 2: rlwinm >p00=18,<y0=4,12,4080
rlwinm 18,4,12,4080

# qhasm: z1 = x41
# asm 1: lwz >z1=int32#17,<x41=stack32#60
# asm 2: lwz >z1=19,<x41=236(1)
lwz 19,236(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#18,<y0=int32#2,20,4080
# asm 2: rlwinm >p01=20,<y0=4,20,4080
rlwinm 20,4,20,4080

# qhasm: z2 = x42
# asm 1: lwz >z2=int32#19,<x42=stack32#61
# asm 2: lwz >z2=21,<x42=240(1)
lwz 21,240(1)

# qhasm: p02 = 4080 & (y0 <<< 28) 
# asm 1: rlwinm >p02=int32#20,<y0=int32#2,28,4080
# asm 2: rlwinm >p02=22,<y0=4,28,4080
rlwinm 22,4,28,4080

# qhasm: z3 = x43
# asm 1: lwz >z3=int32#21,<x43=stack32#62
# asm 2: lwz >z3=23,<x43=244(1)
lwz 23,244(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#2,<y0=int32#2,4,4080
# asm 2: rlwinm >p03=4,<y0=4,4,4080
rlwinm 4,4,4,4080

# qhasm: p00 = *(uint32 *) (table2 + p00)
# asm 1: lwzx >p00=int32#16,<table2=int32#9,<p00=int32#16
# asm 2: lwzx >p00=18,<table2=11,<p00=18
lwzx 18,11,18

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#22,<y1=int32#14,12,4080
# asm 2: rlwinm >p10=24,<y1=16,12,4080
rlwinm 24,16,12,4080

# qhasm: p01 = *(uint32 *) (table3 + p01)
# asm 1: lwzx >p01=int32#18,<table3=int32#1,<p01=int32#18
# asm 2: lwzx >p01=20,<table3=3,<p01=20
lwzx 20,3,20

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#23,<y1=int32#14,20,4080
# asm 2: rlwinm >p11=25,<y1=16,20,4080
rlwinm 25,16,20,4080

# qhasm: p02 = *(uint32 *) (table0 + p02)
# asm 1: lwzx >p02=int32#20,<table0=int32#6,<p02=int32#20
# asm 2: lwzx >p02=22,<table0=8,<p02=22
lwzx 22,8,22

# qhasm: p12 = 4080 & (y1 <<< 28) 
# asm 1: rlwinm >p12=int32#24,<y1=int32#14,28,4080
# asm 2: rlwinm >p12=26,<y1=16,28,4080
rlwinm 26,16,28,4080

# qhasm: p03 = *(uint8 *) (table1p3 + p03)
# asm 1: lbzx >p03=int32#2,<table1p3=int32#8,<p03=int32#2
# asm 2: lbzx >p03=4,<table1p3=10,<p03=4
lbzx 4,10,4

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#14,<y1=int32#14,4,4080
# asm 2: rlwinm >p13=16,<y1=16,4,4080
rlwinm 16,16,4,4080

# qhasm: *(swapendian uint32 *) n0p = n0
# asm 1: stwbrx <n0=int32#11,0,<n0p=int32#10
# asm 2: stwbrx <n0=13,0,<n0p=12
stwbrx 13,0,12

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#11,<y2=int32#13,12,4080
# asm 2: rlwinm >p20=13,<y2=15,12,4080
rlwinm 13,15,12,4080

# qhasm: p10 = *(uint32 *) (table2 + p10)
# asm 1: lwzx >p10=int32#22,<table2=int32#9,<p10=int32#22
# asm 2: lwzx >p10=24,<table2=11,<p10=24
lwzx 24,11,24

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#25,<y2=int32#13,20,4080
# asm 2: rlwinm >p21=27,<y2=15,20,4080
rlwinm 27,15,20,4080

# qhasm: p11 = *(uint32 *) (table3 + p11)
# asm 1: lwzx >p11=int32#23,<table3=int32#1,<p11=int32#23
# asm 2: lwzx >p11=25,<table3=3,<p11=25
lwzx 25,3,25

# qhasm: p22 = 4080 & (y2 <<< 28) 
# asm 1: rlwinm >p22=int32#26,<y2=int32#13,28,4080
# asm 2: rlwinm >p22=28,<y2=15,28,4080
rlwinm 28,15,28,4080

# qhasm: p12 = *(uint32 *) (table0 + p12)
# asm 1: lwzx >p12=int32#24,<table0=int32#6,<p12=int32#24
# asm 2: lwzx >p12=26,<table0=8,<p12=26
lwzx 26,8,26

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#13,<y2=int32#13,4,4080
# asm 2: rlwinm >p23=15,<y2=15,4,4080
rlwinm 15,15,4,4080

# qhasm: p13 = *(uint8 *) (table1p3 + p13)
# asm 1: lbzx >p13=int32#14,<table1p3=int32#8,<p13=int32#14
# asm 2: lbzx >p13=16,<table1p3=10,<p13=16
lbzx 16,10,16

# qhasm: p03 bits 0xff000000 = p10 <<< 0
# asm 1: rlwimi <p03=int32#2,<p10=int32#22,0,0xff000000
# asm 2: rlwimi <p03=4,<p10=24,0,0xff000000
rlwimi 4,24,0,0xff000000

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#22,<y3=int32#12,12,4080
# asm 2: rlwinm >p30=24,<y3=14,12,4080
rlwinm 24,14,12,4080

# qhasm: p00 bits 0x00ff0000 = p11 <<< 0
# asm 1: rlwimi <p00=int32#16,<p11=int32#23,0,0x00ff0000
# asm 2: rlwimi <p00=18,<p11=25,0,0x00ff0000
rlwimi 18,25,0,0x00ff0000

# qhasm: p20 = *(uint32 *) (table2 + p20)
# asm 1: lwzx >p20=int32#11,<table2=int32#9,<p20=int32#11
# asm 2: lwzx >p20=13,<table2=11,<p20=13
lwzx 13,11,13

# qhasm: p01 bits 0x0000ff00 = p12 <<< 0
# asm 1: rlwimi <p01=int32#18,<p12=int32#24,0,0x0000ff00
# asm 2: rlwimi <p01=20,<p12=26,0,0x0000ff00
rlwimi 20,26,0,0x0000ff00

# qhasm: p21 = *(uint32 *) (table3 + p21)
# asm 1: lwzx >p21=int32#23,<table3=int32#1,<p21=int32#25
# asm 2: lwzx >p21=25,<table3=3,<p21=27
lwzx 25,3,27

# qhasm: p02 bits 0x000000ff = p13 <<< 0
# asm 1: rlwimi <p02=int32#20,<p13=int32#14,0,0x000000ff
# asm 2: rlwimi <p02=22,<p13=16,0,0x000000ff
rlwimi 22,16,0,0x000000ff

# qhasm: p22 = *(uint32 *) (table0 + p22)
# asm 1: lwzx >p22=int32#14,<table0=int32#6,<p22=int32#26
# asm 2: lwzx >p22=16,<table0=8,<p22=28
lwzx 16,8,28

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#24,<y3=int32#12,20,4080
# asm 2: rlwinm >p31=26,<y3=14,20,4080
rlwinm 26,14,20,4080

# qhasm: p23 = *(uint8 *) (table1p3 + p23)
# asm 1: lbzx >p23=int32#13,<table1p3=int32#8,<p23=int32#13
# asm 2: lbzx >p23=15,<table1p3=10,<p23=15
lbzx 15,10,15

# qhasm: p32 = 4080 & (y3 <<< 28) 
# asm 1: rlwinm >p32=int32#25,<y3=int32#12,28,4080
# asm 2: rlwinm >p32=27,<y3=14,28,4080
rlwinm 27,14,28,4080

# qhasm: p30 = *(uint32 *) (table2 + p30)
# asm 1: lwzx >p30=int32#22,<table2=int32#9,<p30=int32#22
# asm 2: lwzx >p30=24,<table2=11,<p30=24
lwzx 24,11,24

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#12,<y3=int32#12,4,4080
# asm 2: rlwinm >p33=14,<y3=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p31 = *(uint32 *) (table3 + p31)
# asm 1: lwzx >p31=int32#24,<table3=int32#1,<p31=int32#24
# asm 2: lwzx >p31=26,<table3=3,<p31=26
lwzx 26,3,26

# qhasm: p02 bits 0xff000000 = p20 <<< 0
# asm 1: rlwimi <p02=int32#20,<p20=int32#11,0,0xff000000
# asm 2: rlwimi <p02=22,<p20=13,0,0xff000000
rlwimi 22,13,0,0xff000000

# qhasm: p32 = *(uint32 *) (table0 + p32)
# asm 1: lwzx >p32=int32#11,<table0=int32#6,<p32=int32#25
# asm 2: lwzx >p32=13,<table0=8,<p32=27
lwzx 13,8,27

# qhasm: p03 bits 0x00ff0000 = p21 <<< 0
# asm 1: rlwimi <p03=int32#2,<p21=int32#23,0,0x00ff0000
# asm 2: rlwimi <p03=4,<p21=25,0,0x00ff0000
rlwimi 4,25,0,0x00ff0000

# qhasm: p33 = *(uint8 *) (table1p3 + p33)
# asm 1: lbzx >p33=int32#12,<table1p3=int32#8,<p33=int32#12
# asm 2: lbzx >p33=14,<table1p3=10,<p33=14
lbzx 14,10,14

# qhasm: p00 bits 0x0000ff00 = p22 <<< 0
# asm 1: rlwimi <p00=int32#16,<p22=int32#14,0,0x0000ff00
# asm 2: rlwimi <p00=18,<p22=16,0,0x0000ff00
rlwimi 18,16,0,0x0000ff00

# qhasm: y0 = *(uint32 *) (n0p + 0)
# asm 1: lwz >y0=int32#14,0(<n0p=int32#10)
# asm 2: lwz >y0=16,0(<n0p=12)
lwz 16,0(12)

# qhasm: p01 bits 0x000000ff = p23 <<< 0
# asm 1: rlwimi <p01=int32#18,<p23=int32#13,0,0x000000ff
# asm 2: rlwimi <p01=20,<p23=15,0,0x000000ff
rlwimi 20,15,0,0x000000ff

# qhasm: p01 bits 0xff000000 = p30 <<< 0
# asm 1: rlwimi <p01=int32#18,<p30=int32#22,0,0xff000000
# asm 2: rlwimi <p01=20,<p30=24,0,0xff000000
rlwimi 20,24,0,0xff000000

# qhasm: tx0 = x0
# asm 1: lwz >tx0=int32#13,<x0=stack32#19
# asm 2: lwz >tx0=15,<x0=72(1)
lwz 15,72(1)

# qhasm: in0 = *(uint32 *) (inp + 0)
# asm 1: lwz >in0=int32#22,0(<inp=int32#3)
# asm 2: lwz >in0=24,0(<inp=5)
lwz 24,0(5)

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#18,<p01=int32#18,<z3=int32#21
# asm 2: xor >z3=20,<p01=20,<z3=23
xor 20,20,23

# qhasm: p02 bits 0x00ff0000 = p31 <<< 0
# asm 1: rlwimi <p02=int32#20,<p31=int32#24,0,0x00ff0000
# asm 2: rlwimi <p02=22,<p31=26,0,0x00ff0000
rlwimi 22,26,0,0x00ff0000

# qhasm: p03 bits 0x0000ff00 = p32 <<< 0
# asm 1: rlwimi <p03=int32#2,<p32=int32#11,0,0x0000ff00
# asm 2: rlwimi <p03=4,<p32=13,0,0x0000ff00
rlwimi 4,13,0,0x0000ff00

# qhasm: in1 = *(uint32 *) (inp + 4)
# asm 1: lwz >in1=int32#11,4(<inp=int32#3)
# asm 2: lwz >in1=13,4(<inp=5)
lwz 13,4(5)

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#19,<p02=int32#20,<z2=int32#19
# asm 2: xor >z2=21,<p02=22,<z2=21
xor 21,22,21

# qhasm: in2 = *(uint32 *) (inp + 8)
# asm 1: lwz >in2=int32#20,8(<inp=int32#3)
# asm 2: lwz >in2=22,8(<inp=5)
lwz 22,8(5)

# qhasm: p00 bits 0x000000ff = p33 <<< 0
# asm 1: rlwimi <p00=int32#16,<p33=int32#12,0,0x000000ff
# asm 2: rlwimi <p00=18,<p33=14,0,0x000000ff
rlwimi 18,14,0,0x000000ff

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#2,<p03=int32#2,<z1=int32#17
# asm 2: xor >z1=4,<p03=4,<z1=19
xor 4,4,19

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#12,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=14,<p00=18,<z0=17
xor 14,18,17

# qhasm: in3 = *(uint32 *) (inp + 12)
# asm 1: lwz >in3=int32#15,12(<inp=int32#3)
# asm 2: lwz >in3=17,12(<inp=5)
lwz 17,12(5)

# qhasm: <? length -= 16
# asm 1: addic. >length=int32#5,<length=int32#5,-16
# asm 2: addic. >length=7,<length=7,-16
addic. 7,7,-16

# qhasm: goto mainloop if !<
bge .label.mainloop

# qhasm: atmost15bytesleft:
.label.atmost15bytesleft:

# qhasm: length += 16
# asm 1: addi >length=int32#1,<length=int32#5,16
# asm 2: addi >length=3,<length=7,16
addi 3,7,16

# qhasm: tmpp = &tmp
# asm 1: lea >tmpp=int32#5,>tmp=stack128#1
# asm 2: lea >tmpp=7,>tmp=272(1)
addi 7,1,272

# qhasm: *(uint32 *) (tmpp + 0) = z0
# asm 1: stw <z0=int32#12,0(<tmpp=int32#5)
# asm 2: stw <z0=14,0(<tmpp=7)
stw 14,0(7)

# qhasm: *(uint32 *) (tmpp + 4) = z1
# asm 1: stw <z1=int32#2,4(<tmpp=int32#5)
# asm 2: stw <z1=4,4(<tmpp=7)
stw 4,4(7)

# qhasm: *(uint32 *) (tmpp + 8) = z2
# asm 1: stw <z2=int32#19,8(<tmpp=int32#5)
# asm 2: stw <z2=21,8(<tmpp=7)
stw 21,8(7)

# qhasm: *(uint32 *) (tmpp + 12) = z3
# asm 1: stw <z3=int32#18,12(<tmpp=int32#5)
# asm 2: stw <z3=20,12(<tmpp=7)
stw 20,12(7)

# qhasm: copyloop:
.label.copyloop:

# qhasm: <? (uint32) length - 1
# asm 1: cmplwi <length=int32#1,1
# asm 2: cmplwi <length=3,1
cmplwi 3,1

# qhasm: goto end if <
blt .label.end

# qhasm: tmp1 = *(uint8 *) (tmpp + 0)
# asm 1: lbz >tmp1=int32#2,0(<tmpp=int32#5)
# asm 2: lbz >tmp1=4,0(<tmpp=7)
lbz 4,0(7)

# qhasm: in0 = *(uint8 *) (inp + 0)
# asm 1: lbz >in0=int32#6,0(<inp=int32#3)
# asm 2: lbz >in0=8,0(<inp=5)
lbz 8,0(5)

# qhasm: tmp1 ^= in0
# asm 1: xor >tmp1=int32#2,<in0=int32#6,<tmp1=int32#2
# asm 2: xor >tmp1=4,<in0=8,<tmp1=4
xor 4,8,4

# qhasm: *(uint8 *) (outp + 0) = tmp1 
# asm 1: stb <tmp1=int32#2,0(<outp=int32#4)
# asm 2: stb <tmp1=4,0(<outp=6)
stb 4,0(6)

# qhasm: outp = outp + 1
# asm 1: addi >outp=int32#4,<outp=int32#4,1
# asm 2: addi >outp=6,<outp=6,1
addi 6,6,1

# qhasm: inp = inp + 1
# asm 1: addi >inp=int32#3,<inp=int32#3,1
# asm 2: addi >inp=5,<inp=5,1
addi 5,5,1

# qhasm: tmpp = tmpp + 1
# asm 1: addi >tmpp=int32#5,<tmpp=int32#5,1
# asm 2: addi >tmpp=7,<tmpp=7,1
addi 7,7,1

# qhasm: length = length - 1
# asm 1: addi >length=int32#1,<length=int32#1,-1
# asm 2: addi >length=3,<length=3,-1
addi 3,3,-1

# qhasm: goto copyloop
b .label.copyloop

# qhasm: end:
.label.end:

# qhasm: n0 = *(swapendian uint32 *) n0p 
# asm 1: lwbrx >n0=int32#1,0,<n0p=int32#10
# asm 2: lwbrx >n0=3,0,<n0p=12
lwbrx 3,0,12

# qhasm: n0 = n0 - 1
# asm 1: addi >n0=int32#1,<n0=int32#1,-1
# asm 2: addi >n0=3,<n0=3,-1
addi 3,3,-1

# qhasm: *(swapendian uint32 *) n0p = n0
# asm 1: stwbrx <n0=int32#1,0,<n0p=int32#10
# asm 2: stwbrx <n0=3,0,<n0p=12
stwbrx 3,0,12

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

# qhasm: tx1 = x1
# asm 1: lwz >tx1=int32#1,<x1=stack32#20
# asm 2: lwz >tx1=3,<x1=76(1)
lwz 3,76(1)

# qhasm: tx2 = x2
# asm 1: lwz >tx2=int32#2,<x2=stack32#21
# asm 2: lwz >tx2=4,<x2=80(1)
lwz 4,80(1)

# qhasm: tx3 = x3
# asm 1: lwz >tx3=int32#3,<x3=stack32#22
# asm 2: lwz >tx3=5,<x3=84(1)
lwz 5,84(1)

# qhasm: y1 = *(uint32 *) (n0p + 4)
# asm 1: lwz >y1=int32#4,4(<n0p=int32#10)
# asm 2: lwz >y1=6,4(<n0p=12)
lwz 6,4(12)

# qhasm: y2 = *(uint32 *) (n0p + 8)
# asm 1: lwz >y2=int32#5,8(<n0p=int32#10)
# asm 2: lwz >y2=7,8(<n0p=12)
lwz 7,8(12)

# qhasm: y3 = *(uint32 *) (n0p + 12)
# asm 1: lwz >y3=int32#6,12(<n0p=int32#10)
# asm 2: lwz >y3=8,12(<n0p=12)
lwz 8,12(12)

# qhasm: y1 ^= tx1
# asm 1: xor >y1=int32#1,<tx1=int32#1,<y1=int32#4
# asm 2: xor >y1=3,<tx1=3,<y1=6
xor 3,3,6

# qhasm: y2 ^= tx2
# asm 1: xor >y2=int32#2,<tx2=int32#2,<y2=int32#5
# asm 2: xor >y2=4,<tx2=4,<y2=7
xor 4,4,7

# qhasm: y3 ^= tx3
# asm 1: xor >y3=int32#3,<tx3=int32#3,<y3=int32#6
# asm 2: xor >y3=5,<tx3=5,<y3=8
xor 5,5,8

# qhasm: *(uint32 *) (n0p + 4) = y1
# asm 1: stw <y1=int32#1,4(<n0p=int32#10)
# asm 2: stw <y1=3,4(<n0p=12)
stw 3,4(12)

# qhasm: *(uint32 *) (n0p + 8) = y2
# asm 1: stw <y2=int32#2,8(<n0p=int32#10)
# asm 2: stw <y2=4,8(<n0p=12)
stw 4,8(12)

# qhasm: *(uint32 *) (n0p + 12) = y3
# asm 1: stw <y3=int32#3,12(<n0p=int32#10)
# asm 2: stw <y3=5,12(<n0p=12)
stw 5,12(12)

# qhasm: donothing:
.label.donothing:

# qhasm: leave
addi 1,1,416
blr
