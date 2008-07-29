
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

# qhasm: int32 tmp1

# qhasm: int32 key

# qhasm: int32 inint

# qhasm: int32 outint

# qhasm: int32 oddmask

# qhasm: int32 evenmask

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

# qhasm: stack320 tmp

# qhasm: int32 tmpp

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

# qhasm: enter ECRYPT_process_bytes_qhasm
.text
.align 3
.globl _ECRYPT_process_bytes_qhasm
.globl ECRYPT_process_bytes_qhasm
_ECRYPT_process_bytes_qhasm:
ECRYPT_process_bytes_qhasm:
stwu 1,-464(1)

# qhasm: <? (uint32) length - 0
# asm 1: cmplwi <length=int32#5,0
# asm 2: cmplwi <length=7,0
cmplwi 7,0

# qhasm: goto donothing if <
blt .label.donothing

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

# qhasm: table0 = constants
# asm 1: mr >table0=int32#6,<constants=int32#1
# asm 2: mr >table0=8,<constants=3
mr 8,3

# qhasm: table0 += 40
# asm 1: addi >table0=int32#6,<table0=int32#6,40
# asm 2: addi >table0=8,<table0=8,40
addi 8,8,40

# qhasm: table1 = constants
# asm 1: mr >table1=int32#7,<constants=int32#1
# asm 2: mr >table1=9,<constants=3
mr 9,3

# qhasm: table1 += 48
# asm 1: addi >table1=int32#7,<table1=int32#7,48
# asm 2: addi >table1=9,<table1=9,48
addi 9,9,48

# qhasm: table2 = constants
# asm 1: mr >table2=int32#8,<constants=int32#1
# asm 2: mr >table2=10,<constants=3
mr 10,3

# qhasm: table2 += 44
# asm 1: addi >table2=int32#8,<table2=int32#8,44
# asm 2: addi >table2=10,<table2=10,44
addi 10,10,44

# qhasm: table3 = constants
# asm 1: mr >table3=int32#1,<constants=int32#1
# asm 2: mr >table3=3,<constants=3
mr 3,3

# qhasm: table3 += 52
# asm 1: addi >table3=int32#1,<table3=int32#1,52
# asm 2: addi >table3=3,<table3=3,52
addi 3,3,52

# qhasm: oddmask = 0xff
# asm 1: li >oddmask=int32#9,0xff
# asm 2: li >oddmask=11,0xff
li 11,0xff

# qhasm: oddmask <<= 24 
# asm 1: slwi >oddmask=int32#9,<oddmask=int32#9,24
# asm 2: slwi >oddmask=11,<oddmask=11,24
slwi 11,11,24

# qhasm: oddmask ^= 0xff00
# asm 1: xori >oddmask=int32#9,<oddmask=int32#9,0xff00
# asm 2: xori >oddmask=11,<oddmask=11,0xff00
xori 11,11,0xff00

# qhasm: evenmask = 0xff
# asm 1: li >evenmask=int32#10,0xff
# asm 2: li >evenmask=12,0xff
li 12,0xff

# qhasm: evenmask <<= 16
# asm 1: slwi >evenmask=int32#10,<evenmask=int32#10,16
# asm 2: slwi >evenmask=12,<evenmask=12,16
slwi 12,12,16

# qhasm: evenmask ^= 0xff
# asm 1: xori >evenmask=int32#10,<evenmask=int32#10,0xff
# asm 2: xori >evenmask=12,<evenmask=12,0xff
xori 12,12,0xff

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

# qhasm: tx0 = *(uint32 *) (ctxp + 52) 
# asm 1: lwz >tx0=int32#11,52(<ctxp=int32#2)
# asm 2: lwz >tx0=13,52(<ctxp=4)
lwz 13,52(4)

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

# qhasm: x40  = tx0 
# asm 1: stw <tx0=int32#11,>x40=stack32#59
# asm 2: stw <tx0=13,>x40=232(1)
stw 13,232(1)

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

# qhasm: y0 = *(uint32 *) (ctxp + 56)
# asm 1: lwz >y0=int32#11,56(<ctxp=int32#2)
# asm 2: lwz >y0=13,56(<ctxp=4)
lwz 13,56(4)

# qhasm: y1 = *(uint32 *) (ctxp + 60)
# asm 1: lwz >y1=int32#12,60(<ctxp=int32#2)
# asm 2: lwz >y1=14,60(<ctxp=4)
lwz 14,60(4)

# qhasm: y2 = *(uint32 *) (ctxp + 64)
# asm 1: lwz >y2=int32#13,64(<ctxp=int32#2)
# asm 2: lwz >y2=15,64(<ctxp=4)
lwz 15,64(4)

# qhasm: y3 = *(uint32 *) (ctxp + 68)
# asm 1: lwz >y3=int32#14,68(<ctxp=int32#2)
# asm 2: lwz >y3=16,68(<ctxp=4)
lwz 16,68(4)

# qhasm: <? (uint32) length - 40
# asm 1: cmplwi <length=int32#5,40
# asm 2: cmplwi <length=7,40
cmplwi 7,40

# qhasm: goto lessthan40bytesleft if <
blt .label.lessthan40bytesleft

# qhasm: mainloop:
.label.mainloop:

# qhasm: z0 = x4
# asm 1: lwz >z0=int32#9,<x4=stack32#23
# asm 2: lwz >z0=11,<x4=88(1)
lwz 11,88(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#10,<y0=int32#11,12,4080
# asm 2: rlwinm >p00=12,<y0=13,12,4080
rlwinm 12,13,12,4080

# qhasm: z1 = x5
# asm 1: lwz >z1=int32#15,<x5=stack32#24
# asm 2: lwz >z1=17,<x5=92(1)
lwz 17,92(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#11,20,4080
# asm 2: rlwinm >p01=18,<y0=13,20,4080
rlwinm 18,13,20,4080

# qhasm: z2 = x6
# asm 1: lwz >z2=int32#17,<x6=stack32#25
# asm 2: lwz >z2=19,<x6=96(1)
lwz 19,96(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#11,28,4080
# asm 2: rlwinm >p02=20,<y0=13,28,4080
rlwinm 20,13,28,4080

# qhasm: z3 = x7
# asm 1: lwz >z3=int32#19,<x7=stack32#26
# asm 2: lwz >z3=21,<x7=100(1)
lwz 21,100(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#11,<y0=int32#11,4,4080
# asm 2: rlwinm >p03=13,<y0=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#10,<table0=int32#6,<p00=int32#10
# asm 2: lwzx >p00=12,<table0=8,<p00=12
lwzx 12,8,12

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#12,12,4080
# asm 2: rlwinm >p10=22,<y1=14,12,4080
rlwinm 22,14,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#12,20,4080
# asm 2: rlwinm >p11=23,<y1=14,20,4080
rlwinm 23,14,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#12,28,4080
# asm 2: rlwinm >p12=24,<y1=14,28,4080
rlwinm 24,14,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#11,<table3=int32#1,<p03=int32#11
# asm 2: lwzx >p03=13,<table3=3,<p03=13
lwzx 13,3,13

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#12,<y1=int32#12,4,4080
# asm 2: rlwinm >p13=14,<y1=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#9,<p00=int32#10,<z0=int32#9
# asm 2: xor >z0=11,<p00=12,<z0=11
xor 11,12,11

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#10,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=12,<p01=18,<z3=21
xor 12,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#11,<p03=int32#11,<z1=int32#15
# asm 2: xor >z1=13,<p03=13,<z1=17
xor 13,13,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#13,12,4080
# asm 2: rlwinm >p20=19,<y2=15,12,4080
rlwinm 19,15,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#13,20,4080
# asm 2: rlwinm >p21=21,<y2=15,20,4080
rlwinm 21,15,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#13,28,4080
# asm 2: rlwinm >p22=23,<y2=15,28,4080
rlwinm 23,15,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#12,<table3=int32#1,<p13=int32#12
# asm 2: lwzx >p13=14,<table3=3,<p13=14
lwzx 14,3,14

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#13,<y2=int32#13,4,4080
# asm 2: rlwinm >p23=15,<y2=15,4,4080
rlwinm 15,15,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#11,<p10=int32#15,<z1=int32#11
# asm 2: xor >z1=13,<p10=17,<z1=13
xor 13,17,13

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#9,<p11=int32#18,<z0=int32#9
# asm 2: xor >z0=11,<p11=20,<z0=11
xor 11,20,11

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#10,<p12=int32#20,<z3=int32#10
# asm 2: xor >z3=12,<p12=22,<z3=12
xor 12,22,12

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#12,<p13=int32#12,<z2=int32#16
# asm 2: xor >z2=14,<p13=14,<z2=18
xor 14,14,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#14,12,4080
# asm 2: rlwinm >p30=18,<y3=16,12,4080
rlwinm 18,16,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#14,20,4080
# asm 2: rlwinm >p31=20,<y3=16,20,4080
rlwinm 20,16,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#14,28,4080
# asm 2: rlwinm >p32=22,<y3=16,28,4080
rlwinm 22,16,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#13,<table3=int32#1,<p23=int32#13
# asm 2: lwzx >p23=15,<table3=3,<p23=15
lwzx 15,3,15

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#14,<y3=int32#14,4,4080
# asm 2: rlwinm >p33=16,<y3=16,4,4080
rlwinm 16,16,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#12,<p20=int32#15,<z2=int32#12
# asm 2: xor >z2=14,<p20=17,<z2=14
xor 14,17,14

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#11,<p21=int32#17,<z1=int32#11
# asm 2: xor >z1=13,<p21=19,<z1=13
xor 13,19,13

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#9,<p22=int32#19,<z0=int32#9
# asm 2: xor >z0=11,<p22=21,<z0=11
xor 11,21,11

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#14,<table3=int32#1,<p33=int32#14
# asm 2: lwzx >p33=16,<table3=3,<p33=16
lwzx 16,3,16

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#10,<p23=int32#13,<z3=int32#10
# asm 2: xor >z3=12,<p23=15,<z3=12
xor 12,15,12

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#12,<z2=int32#12,<p31=int32#15
# asm 2: xor >y2=14,<z2=14,<p31=17
xor 14,14,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#11,<z1=int32#11,<p32=int32#17
# asm 2: xor >y1=13,<z1=13,<p32=19
xor 13,13,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#9,<z0=int32#9,<p33=int32#14
# asm 2: xor >y0=11,<z0=11,<p33=16
xor 11,11,16

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#10,<z3=int32#10,<p30=int32#16
# asm 2: xor >y3=12,<z3=12,<p30=18
xor 12,12,18

# qhasm: inint = *(uint32 *) (inp + 0)
# asm 1: lwz >inint=int32#13,0(<inp=int32#3)
# asm 2: lwz >inint=15,0(<inp=5)
lwz 15,0(5)

# qhasm: tmp0 = y0 <<< 8
# asm 1: rlwinm >tmp0=int32#14,<y0=int32#9,8,0xffffffff
# asm 2: rlwinm >tmp0=16,<y0=11,8,0xffffffff
rlwinm 16,11,8,0xffffffff

# qhasm: z0 = x8
# asm 1: lwz >z0=int32#15,<x8=stack32#27
# asm 2: lwz >z0=17,<x8=104(1)
lwz 17,104(1)

# qhasm: tmp0 bits 0xff00 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#12,16,0xff00
# asm 2: rlwimi <tmp0=16,<y2=14,16,0xff00
rlwimi 16,14,16,0xff00

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#16,<y0=int32#9,12,4080
# asm 2: rlwinm >p00=18,<y0=11,12,4080
rlwinm 18,11,12,4080

# qhasm: tmp0 bits 0xff000000 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#12,16,0xff000000
# asm 2: rlwimi <tmp0=16,<y2=14,16,0xff000000
rlwimi 16,14,16,0xff000000

# qhasm: z1 = x9
# asm 1: lwz >z1=int32#17,<x9=stack32#28
# asm 2: lwz >z1=19,<x9=108(1)
lwz 19,108(1)

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#14,<y0=int32#9,20,4080
# asm 2: rlwinm >p01=16,<y0=11,20,4080
rlwinm 16,11,20,4080

# qhasm: *(uint32 *) (outp + 0) = outint
# asm 1: stw <outint=int32#13,0(<outp=int32#4)
# asm 2: stw <outint=15,0(<outp=6)
stw 15,0(6)

# qhasm: z2 = x10
# asm 1: lwz >z2=int32#13,<x10=stack32#29
# asm 2: lwz >z2=15,<x10=112(1)
lwz 15,112(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#9,28,4080
# asm 2: rlwinm >p02=20,<y0=11,28,4080
rlwinm 20,11,28,4080

# qhasm: z3 = x11
# asm 1: lwz >z3=int32#19,<x11=stack32#30
# asm 2: lwz >z3=21,<x11=116(1)
lwz 21,116(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#9,<y0=int32#9,4,4080
# asm 2: rlwinm >p03=11,<y0=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#16,<table0=int32#6,<p00=int32#16
# asm 2: lwzx >p00=18,<table0=8,<p00=18
lwzx 18,8,18

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#11,12,4080
# asm 2: rlwinm >p10=22,<y1=13,12,4080
rlwinm 22,13,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#14,<table1=int32#7,<p01=int32#14
# asm 2: lwzx >p01=16,<table1=9,<p01=16
lwzx 16,9,16

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#11,20,4080
# asm 2: rlwinm >p11=23,<y1=13,20,4080
rlwinm 23,13,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#11,28,4080
# asm 2: rlwinm >p12=24,<y1=13,28,4080
rlwinm 24,13,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#9,<table3=int32#1,<p03=int32#9
# asm 2: lwzx >p03=11,<table3=3,<p03=11
lwzx 11,3,11

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#11,<y1=int32#11,4,4080
# asm 2: rlwinm >p13=13,<y1=13,4,4080
rlwinm 13,13,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#15,<p00=int32#16,<z0=int32#15
# asm 2: xor >z0=17,<p00=18,<z0=17
xor 17,18,17

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#14,<z3=int32#19
# asm 2: xor >z3=16,<p01=16,<z3=21
xor 16,16,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#13,<p02=int32#18,<z2=int32#13
# asm 2: xor >z2=15,<p02=20,<z2=15
xor 15,20,15

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#9,<p03=int32#9,<z1=int32#17
# asm 2: xor >z1=11,<p03=11,<z1=19
xor 11,11,19

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#16,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=18,<table0=8,<p10=22
lwzx 18,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#12,12,4080
# asm 2: rlwinm >p20=19,<y2=14,12,4080
rlwinm 19,14,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#12,20,4080
# asm 2: rlwinm >p21=21,<y2=14,20,4080
rlwinm 21,14,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#12,28,4080
# asm 2: rlwinm >p22=23,<y2=14,28,4080
rlwinm 23,14,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#11,<table3=int32#1,<p13=int32#11
# asm 2: lwzx >p13=13,<table3=3,<p13=13
lwzx 13,3,13

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#12,<y2=int32#12,4,4080
# asm 2: rlwinm >p23=14,<y2=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#9,<p10=int32#16,<z1=int32#9
# asm 2: xor >z1=11,<p10=18,<z1=11
xor 11,18,11

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#15,<p11=int32#18,<z0=int32#15
# asm 2: xor >z0=17,<p11=20,<z0=17
xor 17,20,17

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#11,<p13=int32#11,<z2=int32#13
# asm 2: xor >z2=13,<p13=13,<z2=15
xor 13,13,15

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#13,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=15,<table0=8,<p20=19
lwzx 15,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#10,12,4080
# asm 2: rlwinm >p30=18,<y3=12,12,4080
rlwinm 18,12,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#10,20,4080
# asm 2: rlwinm >p31=20,<y3=12,20,4080
rlwinm 20,12,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#10,28,4080
# asm 2: rlwinm >p32=22,<y3=12,28,4080
rlwinm 22,12,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#12,<table3=int32#1,<p23=int32#12
# asm 2: lwzx >p23=14,<table3=3,<p23=14
lwzx 14,3,14

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#10,<y3=int32#10,4,4080
# asm 2: rlwinm >p33=12,<y3=12,4,4080
rlwinm 12,12,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#11,<p20=int32#13,<z2=int32#11
# asm 2: xor >z2=13,<p20=15,<z2=13
xor 13,15,13

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#13,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=15,<table1=9,<p31=20
lwzx 15,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#9,<p21=int32#17,<z1=int32#9
# asm 2: xor >z1=11,<p21=19,<z1=11
xor 11,19,11

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#15,<p22=int32#19,<z0=int32#15
# asm 2: xor >z0=17,<p22=21,<z0=17
xor 17,21,17

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#10,<table3=int32#1,<p33=int32#10
# asm 2: lwzx >p33=12,<table3=3,<p33=12
lwzx 12,3,12

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#12,<p23=int32#12,<z3=int32#14
# asm 2: xor >z3=14,<p23=14,<z3=16
xor 14,14,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#11,<z2=int32#11,<p31=int32#13
# asm 2: xor >y2=13,<z2=13,<p31=15
xor 13,13,15

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#9,<z1=int32#9,<p32=int32#17
# asm 2: xor >y1=11,<z1=11,<p32=19
xor 11,11,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#10,<z0=int32#15,<p33=int32#10
# asm 2: xor >y0=12,<z0=17,<p33=12
xor 12,17,12

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#12,<z3=int32#12,<p30=int32#16
# asm 2: xor >y3=14,<z3=14,<p30=18
xor 14,14,18

# qhasm: inint = *(uint32 *) (inp + 4)
# asm 1: lwz >inint=int32#13,4(<inp=int32#3)
# asm 2: lwz >inint=15,4(<inp=5)
lwz 15,4(5)

# qhasm: tmp0 = y2 <<< 24
# asm 1: rlwinm >tmp0=int32#14,<y2=int32#11,24,0xffffffff
# asm 2: rlwinm >tmp0=16,<y2=13,24,0xffffffff
rlwinm 16,13,24,0xffffffff

# qhasm: tmp0 bits 0xff = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#10,16,0xff
# asm 2: rlwimi <tmp0=16,<y0=12,16,0xff
rlwimi 16,12,16,0xff

# qhasm: tmp0 bits 0xff0000 = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#10,16,0xff0000
# asm 2: rlwimi <tmp0=16,<y0=12,16,0xff0000
rlwimi 16,12,16,0xff0000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 4) = outint
# asm 1: stw <outint=int32#13,4(<outp=int32#4)
# asm 2: stw <outint=15,4(<outp=6)
stw 15,4(6)

# qhasm: z0 = x12
# asm 1: lwz >z0=int32#13,<x12=stack32#31
# asm 2: lwz >z0=15,<x12=120(1)
lwz 15,120(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#10,12,4080
# asm 2: rlwinm >p00=16,<y0=12,12,4080
rlwinm 16,12,12,4080

# qhasm: z1 = x13
# asm 1: lwz >z1=int32#15,<x13=stack32#32
# asm 2: lwz >z1=17,<x13=124(1)
lwz 17,124(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#10,20,4080
# asm 2: rlwinm >p01=18,<y0=12,20,4080
rlwinm 18,12,20,4080

# qhasm: z2 = x14
# asm 1: lwz >z2=int32#17,<x14=stack32#33
# asm 2: lwz >z2=19,<x14=128(1)
lwz 19,128(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#10,28,4080
# asm 2: rlwinm >p02=20,<y0=12,28,4080
rlwinm 20,12,28,4080

# qhasm: z3 = x15
# asm 1: lwz >z3=int32#19,<x15=stack32#34
# asm 2: lwz >z3=21,<x15=132(1)
lwz 21,132(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#10,<y0=int32#10,4,4080
# asm 2: rlwinm >p03=12,<y0=12,4,4080
rlwinm 12,12,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#9,12,4080
# asm 2: rlwinm >p10=22,<y1=11,12,4080
rlwinm 22,11,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#9,20,4080
# asm 2: rlwinm >p11=23,<y1=11,20,4080
rlwinm 23,11,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#9,28,4080
# asm 2: rlwinm >p12=24,<y1=11,28,4080
rlwinm 24,11,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#10,<table3=int32#1,<p03=int32#10
# asm 2: lwzx >p03=12,<table3=3,<p03=12
lwzx 12,3,12

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#9,<y1=int32#9,4,4080
# asm 2: rlwinm >p13=11,<y1=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#10,<p03=int32#10,<z1=int32#15
# asm 2: xor >z1=12,<p03=12,<z1=17
xor 12,12,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#11,12,4080
# asm 2: rlwinm >p20=19,<y2=13,12,4080
rlwinm 19,13,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#11,20,4080
# asm 2: rlwinm >p21=21,<y2=13,20,4080
rlwinm 21,13,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#11,28,4080
# asm 2: rlwinm >p22=23,<y2=13,28,4080
rlwinm 23,13,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#9,<table3=int32#1,<p13=int32#9
# asm 2: lwzx >p13=11,<table3=3,<p13=11
lwzx 11,3,11

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#11,<y2=int32#11,4,4080
# asm 2: rlwinm >p23=13,<y2=13,4,4080
rlwinm 13,13,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#10,<p10=int32#15,<z1=int32#10
# asm 2: xor >z1=12,<p10=17,<z1=12
xor 12,17,12

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#9,<p13=int32#9,<z2=int32#16
# asm 2: xor >z2=11,<p13=11,<z2=18
xor 11,11,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#12,12,4080
# asm 2: rlwinm >p30=18,<y3=14,12,4080
rlwinm 18,14,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#12,20,4080
# asm 2: rlwinm >p31=20,<y3=14,20,4080
rlwinm 20,14,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#12,28,4080
# asm 2: rlwinm >p32=22,<y3=14,28,4080
rlwinm 22,14,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#11,<table3=int32#1,<p23=int32#11
# asm 2: lwzx >p23=13,<table3=3,<p23=13
lwzx 13,3,13

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#12,<y3=int32#12,4,4080
# asm 2: rlwinm >p33=14,<y3=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#9,<p20=int32#15,<z2=int32#9
# asm 2: xor >z2=11,<p20=17,<z2=11
xor 11,17,11

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#10,<p21=int32#17,<z1=int32#10
# asm 2: xor >z1=12,<p21=19,<z1=12
xor 12,19,12

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#12,<table3=int32#1,<p33=int32#12
# asm 2: lwzx >p33=14,<table3=3,<p33=14
lwzx 14,3,14

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#11,<p23=int32#11,<z3=int32#14
# asm 2: xor >z3=13,<p23=13,<z3=16
xor 13,13,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#9,<z2=int32#9,<p31=int32#15
# asm 2: xor >y2=11,<z2=11,<p31=17
xor 11,11,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#10,<z1=int32#10,<p32=int32#17
# asm 2: xor >y1=12,<z1=12,<p32=19
xor 12,12,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#12,<z0=int32#13,<p33=int32#12
# asm 2: xor >y0=14,<z0=15,<p33=14
xor 14,15,14

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#11,<z3=int32#11,<p30=int32#16
# asm 2: xor >y3=13,<z3=13,<p30=18
xor 13,13,18

# qhasm: inint = *(uint32 *) (inp + 8)
# asm 1: lwz >inint=int32#13,8(<inp=int32#3)
# asm 2: lwz >inint=15,8(<inp=5)
lwz 15,8(5)

# qhasm: tmp0 = y0 <<< 8
# asm 1: rlwinm >tmp0=int32#14,<y0=int32#12,8,0xffffffff
# asm 2: rlwinm >tmp0=16,<y0=14,8,0xffffffff
rlwinm 16,14,8,0xffffffff

# qhasm: tmp0 bits 0xff00 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#9,16,0xff00
# asm 2: rlwimi <tmp0=16,<y2=11,16,0xff00
rlwimi 16,11,16,0xff00

# qhasm: tmp0 bits 0xff000000 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#9,16,0xff000000
# asm 2: rlwimi <tmp0=16,<y2=11,16,0xff000000
rlwimi 16,11,16,0xff000000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 8) = outint
# asm 1: stw <outint=int32#13,8(<outp=int32#4)
# asm 2: stw <outint=15,8(<outp=6)
stw 15,8(6)

# qhasm: z0 = x16
# asm 1: lwz >z0=int32#13,<x16=stack32#35
# asm 2: lwz >z0=15,<x16=136(1)
lwz 15,136(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#12,12,4080
# asm 2: rlwinm >p00=16,<y0=14,12,4080
rlwinm 16,14,12,4080

# qhasm: z1 = x17
# asm 1: lwz >z1=int32#15,<x17=stack32#36
# asm 2: lwz >z1=17,<x17=140(1)
lwz 17,140(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#12,20,4080
# asm 2: rlwinm >p01=18,<y0=14,20,4080
rlwinm 18,14,20,4080

# qhasm: z2 = x18
# asm 1: lwz >z2=int32#17,<x18=stack32#37
# asm 2: lwz >z2=19,<x18=144(1)
lwz 19,144(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#12,28,4080
# asm 2: rlwinm >p02=20,<y0=14,28,4080
rlwinm 20,14,28,4080

# qhasm: z3 = x19
# asm 1: lwz >z3=int32#19,<x19=stack32#38
# asm 2: lwz >z3=21,<x19=148(1)
lwz 21,148(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#12,<y0=int32#12,4,4080
# asm 2: rlwinm >p03=14,<y0=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#10,12,4080
# asm 2: rlwinm >p10=22,<y1=12,12,4080
rlwinm 22,12,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#10,20,4080
# asm 2: rlwinm >p11=23,<y1=12,20,4080
rlwinm 23,12,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#10,28,4080
# asm 2: rlwinm >p12=24,<y1=12,28,4080
rlwinm 24,12,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#12,<table3=int32#1,<p03=int32#12
# asm 2: lwzx >p03=14,<table3=3,<p03=14
lwzx 14,3,14

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#10,<y1=int32#10,4,4080
# asm 2: rlwinm >p13=12,<y1=12,4,4080
rlwinm 12,12,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#12,<p03=int32#12,<z1=int32#15
# asm 2: xor >z1=14,<p03=14,<z1=17
xor 14,14,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#9,12,4080
# asm 2: rlwinm >p20=19,<y2=11,12,4080
rlwinm 19,11,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#9,20,4080
# asm 2: rlwinm >p21=21,<y2=11,20,4080
rlwinm 21,11,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#9,28,4080
# asm 2: rlwinm >p22=23,<y2=11,28,4080
rlwinm 23,11,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#10,<table3=int32#1,<p13=int32#10
# asm 2: lwzx >p13=12,<table3=3,<p13=12
lwzx 12,3,12

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#9,<y2=int32#9,4,4080
# asm 2: rlwinm >p23=11,<y2=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#12,<p10=int32#15,<z1=int32#12
# asm 2: xor >z1=14,<p10=17,<z1=14
xor 14,17,14

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#10,<p13=int32#10,<z2=int32#16
# asm 2: xor >z2=12,<p13=12,<z2=18
xor 12,12,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#11,12,4080
# asm 2: rlwinm >p30=18,<y3=13,12,4080
rlwinm 18,13,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#11,20,4080
# asm 2: rlwinm >p31=20,<y3=13,20,4080
rlwinm 20,13,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#11,28,4080
# asm 2: rlwinm >p32=22,<y3=13,28,4080
rlwinm 22,13,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#9,<table3=int32#1,<p23=int32#9
# asm 2: lwzx >p23=11,<table3=3,<p23=11
lwzx 11,3,11

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#11,<y3=int32#11,4,4080
# asm 2: rlwinm >p33=13,<y3=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#10,<p20=int32#15,<z2=int32#10
# asm 2: xor >z2=12,<p20=17,<z2=12
xor 12,17,12

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#12,<p21=int32#17,<z1=int32#12
# asm 2: xor >z1=14,<p21=19,<z1=14
xor 14,19,14

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#11,<table3=int32#1,<p33=int32#11
# asm 2: lwzx >p33=13,<table3=3,<p33=13
lwzx 13,3,13

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#9,<p23=int32#9,<z3=int32#14
# asm 2: xor >z3=11,<p23=11,<z3=16
xor 11,11,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#10,<z2=int32#10,<p31=int32#15
# asm 2: xor >y2=12,<z2=12,<p31=17
xor 12,12,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#12,<z1=int32#12,<p32=int32#17
# asm 2: xor >y1=14,<z1=14,<p32=19
xor 14,14,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#11,<z0=int32#13,<p33=int32#11
# asm 2: xor >y0=13,<z0=15,<p33=13
xor 13,15,13

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#9,<z3=int32#9,<p30=int32#16
# asm 2: xor >y3=11,<z3=11,<p30=18
xor 11,11,18

# qhasm: inint = *(uint32 *) (inp + 12)
# asm 1: lwz >inint=int32#13,12(<inp=int32#3)
# asm 2: lwz >inint=15,12(<inp=5)
lwz 15,12(5)

# qhasm: tmp0 = y2 <<< 24
# asm 1: rlwinm >tmp0=int32#14,<y2=int32#10,24,0xffffffff
# asm 2: rlwinm >tmp0=16,<y2=12,24,0xffffffff
rlwinm 16,12,24,0xffffffff

# qhasm: tmp0 bits 0xff = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#11,16,0xff
# asm 2: rlwimi <tmp0=16,<y0=13,16,0xff
rlwimi 16,13,16,0xff

# qhasm: tmp0 bits 0xff0000 = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#11,16,0xff0000
# asm 2: rlwimi <tmp0=16,<y0=13,16,0xff0000
rlwimi 16,13,16,0xff0000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 12) = outint
# asm 1: stw <outint=int32#13,12(<outp=int32#4)
# asm 2: stw <outint=15,12(<outp=6)
stw 15,12(6)

# qhasm: z0 = x20
# asm 1: lwz >z0=int32#13,<x20=stack32#39
# asm 2: lwz >z0=15,<x20=152(1)
lwz 15,152(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#11,12,4080
# asm 2: rlwinm >p00=16,<y0=13,12,4080
rlwinm 16,13,12,4080

# qhasm: z1 = x21
# asm 1: lwz >z1=int32#15,<x21=stack32#40
# asm 2: lwz >z1=17,<x21=156(1)
lwz 17,156(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#11,20,4080
# asm 2: rlwinm >p01=18,<y0=13,20,4080
rlwinm 18,13,20,4080

# qhasm: z2 = x22
# asm 1: lwz >z2=int32#17,<x22=stack32#41
# asm 2: lwz >z2=19,<x22=160(1)
lwz 19,160(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#11,28,4080
# asm 2: rlwinm >p02=20,<y0=13,28,4080
rlwinm 20,13,28,4080

# qhasm: z3 = x23
# asm 1: lwz >z3=int32#19,<x23=stack32#42
# asm 2: lwz >z3=21,<x23=164(1)
lwz 21,164(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#11,<y0=int32#11,4,4080
# asm 2: rlwinm >p03=13,<y0=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#12,12,4080
# asm 2: rlwinm >p10=22,<y1=14,12,4080
rlwinm 22,14,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#12,20,4080
# asm 2: rlwinm >p11=23,<y1=14,20,4080
rlwinm 23,14,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#12,28,4080
# asm 2: rlwinm >p12=24,<y1=14,28,4080
rlwinm 24,14,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#11,<table3=int32#1,<p03=int32#11
# asm 2: lwzx >p03=13,<table3=3,<p03=13
lwzx 13,3,13

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#12,<y1=int32#12,4,4080
# asm 2: rlwinm >p13=14,<y1=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#11,<p03=int32#11,<z1=int32#15
# asm 2: xor >z1=13,<p03=13,<z1=17
xor 13,13,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#10,12,4080
# asm 2: rlwinm >p20=19,<y2=12,12,4080
rlwinm 19,12,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#10,20,4080
# asm 2: rlwinm >p21=21,<y2=12,20,4080
rlwinm 21,12,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#10,28,4080
# asm 2: rlwinm >p22=23,<y2=12,28,4080
rlwinm 23,12,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#12,<table3=int32#1,<p13=int32#12
# asm 2: lwzx >p13=14,<table3=3,<p13=14
lwzx 14,3,14

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#10,<y2=int32#10,4,4080
# asm 2: rlwinm >p23=12,<y2=12,4,4080
rlwinm 12,12,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#11,<p10=int32#15,<z1=int32#11
# asm 2: xor >z1=13,<p10=17,<z1=13
xor 13,17,13

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#12,<p13=int32#12,<z2=int32#16
# asm 2: xor >z2=14,<p13=14,<z2=18
xor 14,14,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#9,12,4080
# asm 2: rlwinm >p30=18,<y3=11,12,4080
rlwinm 18,11,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#9,20,4080
# asm 2: rlwinm >p31=20,<y3=11,20,4080
rlwinm 20,11,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#9,28,4080
# asm 2: rlwinm >p32=22,<y3=11,28,4080
rlwinm 22,11,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#10,<table3=int32#1,<p23=int32#10
# asm 2: lwzx >p23=12,<table3=3,<p23=12
lwzx 12,3,12

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#9,<y3=int32#9,4,4080
# asm 2: rlwinm >p33=11,<y3=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#12,<p20=int32#15,<z2=int32#12
# asm 2: xor >z2=14,<p20=17,<z2=14
xor 14,17,14

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#11,<p21=int32#17,<z1=int32#11
# asm 2: xor >z1=13,<p21=19,<z1=13
xor 13,19,13

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#9,<table3=int32#1,<p33=int32#9
# asm 2: lwzx >p33=11,<table3=3,<p33=11
lwzx 11,3,11

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#10,<p23=int32#10,<z3=int32#14
# asm 2: xor >z3=12,<p23=12,<z3=16
xor 12,12,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#12,<z2=int32#12,<p31=int32#15
# asm 2: xor >y2=14,<z2=14,<p31=17
xor 14,14,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#11,<z1=int32#11,<p32=int32#17
# asm 2: xor >y1=13,<z1=13,<p32=19
xor 13,13,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#9,<z0=int32#13,<p33=int32#9
# asm 2: xor >y0=11,<z0=15,<p33=11
xor 11,15,11

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#10,<z3=int32#10,<p30=int32#16
# asm 2: xor >y3=12,<z3=12,<p30=18
xor 12,12,18

# qhasm: inint = *(uint32 *) (inp + 16)
# asm 1: lwz >inint=int32#13,16(<inp=int32#3)
# asm 2: lwz >inint=15,16(<inp=5)
lwz 15,16(5)

# qhasm: tmp0 = y0 <<< 8
# asm 1: rlwinm >tmp0=int32#14,<y0=int32#9,8,0xffffffff
# asm 2: rlwinm >tmp0=16,<y0=11,8,0xffffffff
rlwinm 16,11,8,0xffffffff

# qhasm: tmp0 bits 0xff00 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#12,16,0xff00
# asm 2: rlwimi <tmp0=16,<y2=14,16,0xff00
rlwimi 16,14,16,0xff00

# qhasm: tmp0 bits 0xff000000 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#12,16,0xff000000
# asm 2: rlwimi <tmp0=16,<y2=14,16,0xff000000
rlwimi 16,14,16,0xff000000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 16) = outint
# asm 1: stw <outint=int32#13,16(<outp=int32#4)
# asm 2: stw <outint=15,16(<outp=6)
stw 15,16(6)

# qhasm: z0 = x24
# asm 1: lwz >z0=int32#13,<x24=stack32#43
# asm 2: lwz >z0=15,<x24=168(1)
lwz 15,168(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#9,12,4080
# asm 2: rlwinm >p00=16,<y0=11,12,4080
rlwinm 16,11,12,4080

# qhasm: z1 = x25
# asm 1: lwz >z1=int32#15,<x25=stack32#44
# asm 2: lwz >z1=17,<x25=172(1)
lwz 17,172(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#9,20,4080
# asm 2: rlwinm >p01=18,<y0=11,20,4080
rlwinm 18,11,20,4080

# qhasm: z2 = x26
# asm 1: lwz >z2=int32#17,<x26=stack32#45
# asm 2: lwz >z2=19,<x26=176(1)
lwz 19,176(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#9,28,4080
# asm 2: rlwinm >p02=20,<y0=11,28,4080
rlwinm 20,11,28,4080

# qhasm: z3 = x27
# asm 1: lwz >z3=int32#19,<x27=stack32#46
# asm 2: lwz >z3=21,<x27=180(1)
lwz 21,180(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#9,<y0=int32#9,4,4080
# asm 2: rlwinm >p03=11,<y0=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#11,12,4080
# asm 2: rlwinm >p10=22,<y1=13,12,4080
rlwinm 22,13,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#11,20,4080
# asm 2: rlwinm >p11=23,<y1=13,20,4080
rlwinm 23,13,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#11,28,4080
# asm 2: rlwinm >p12=24,<y1=13,28,4080
rlwinm 24,13,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#9,<table3=int32#1,<p03=int32#9
# asm 2: lwzx >p03=11,<table3=3,<p03=11
lwzx 11,3,11

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#11,<y1=int32#11,4,4080
# asm 2: rlwinm >p13=13,<y1=13,4,4080
rlwinm 13,13,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#9,<p03=int32#9,<z1=int32#15
# asm 2: xor >z1=11,<p03=11,<z1=17
xor 11,11,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#12,12,4080
# asm 2: rlwinm >p20=19,<y2=14,12,4080
rlwinm 19,14,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#12,20,4080
# asm 2: rlwinm >p21=21,<y2=14,20,4080
rlwinm 21,14,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#12,28,4080
# asm 2: rlwinm >p22=23,<y2=14,28,4080
rlwinm 23,14,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#11,<table3=int32#1,<p13=int32#11
# asm 2: lwzx >p13=13,<table3=3,<p13=13
lwzx 13,3,13

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#12,<y2=int32#12,4,4080
# asm 2: rlwinm >p23=14,<y2=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#9,<p10=int32#15,<z1=int32#9
# asm 2: xor >z1=11,<p10=17,<z1=11
xor 11,17,11

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#11,<p13=int32#11,<z2=int32#16
# asm 2: xor >z2=13,<p13=13,<z2=18
xor 13,13,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#10,12,4080
# asm 2: rlwinm >p30=18,<y3=12,12,4080
rlwinm 18,12,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#10,20,4080
# asm 2: rlwinm >p31=20,<y3=12,20,4080
rlwinm 20,12,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#10,28,4080
# asm 2: rlwinm >p32=22,<y3=12,28,4080
rlwinm 22,12,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#12,<table3=int32#1,<p23=int32#12
# asm 2: lwzx >p23=14,<table3=3,<p23=14
lwzx 14,3,14

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#10,<y3=int32#10,4,4080
# asm 2: rlwinm >p33=12,<y3=12,4,4080
rlwinm 12,12,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#11,<p20=int32#15,<z2=int32#11
# asm 2: xor >z2=13,<p20=17,<z2=13
xor 13,17,13

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#9,<p21=int32#17,<z1=int32#9
# asm 2: xor >z1=11,<p21=19,<z1=11
xor 11,19,11

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#10,<table3=int32#1,<p33=int32#10
# asm 2: lwzx >p33=12,<table3=3,<p33=12
lwzx 12,3,12

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#12,<p23=int32#12,<z3=int32#14
# asm 2: xor >z3=14,<p23=14,<z3=16
xor 14,14,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#11,<z2=int32#11,<p31=int32#15
# asm 2: xor >y2=13,<z2=13,<p31=17
xor 13,13,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#9,<z1=int32#9,<p32=int32#17
# asm 2: xor >y1=11,<z1=11,<p32=19
xor 11,11,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#10,<z0=int32#13,<p33=int32#10
# asm 2: xor >y0=12,<z0=15,<p33=12
xor 12,15,12

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#12,<z3=int32#12,<p30=int32#16
# asm 2: xor >y3=14,<z3=14,<p30=18
xor 14,14,18

# qhasm: inint = *(uint32 *) (inp + 20)
# asm 1: lwz >inint=int32#13,20(<inp=int32#3)
# asm 2: lwz >inint=15,20(<inp=5)
lwz 15,20(5)

# qhasm: tmp0 = y2 <<< 24
# asm 1: rlwinm >tmp0=int32#14,<y2=int32#11,24,0xffffffff
# asm 2: rlwinm >tmp0=16,<y2=13,24,0xffffffff
rlwinm 16,13,24,0xffffffff

# qhasm: tmp0 bits 0xff = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#10,16,0xff
# asm 2: rlwimi <tmp0=16,<y0=12,16,0xff
rlwimi 16,12,16,0xff

# qhasm: tmp0 bits 0xff0000 = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#10,16,0xff0000
# asm 2: rlwimi <tmp0=16,<y0=12,16,0xff0000
rlwimi 16,12,16,0xff0000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 20) = outint
# asm 1: stw <outint=int32#13,20(<outp=int32#4)
# asm 2: stw <outint=15,20(<outp=6)
stw 15,20(6)

# qhasm: z0 = x28
# asm 1: lwz >z0=int32#13,<x28=stack32#47
# asm 2: lwz >z0=15,<x28=184(1)
lwz 15,184(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#10,12,4080
# asm 2: rlwinm >p00=16,<y0=12,12,4080
rlwinm 16,12,12,4080

# qhasm: z1 = x29
# asm 1: lwz >z1=int32#15,<x29=stack32#48
# asm 2: lwz >z1=17,<x29=188(1)
lwz 17,188(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#10,20,4080
# asm 2: rlwinm >p01=18,<y0=12,20,4080
rlwinm 18,12,20,4080

# qhasm: z2 = x30
# asm 1: lwz >z2=int32#17,<x30=stack32#49
# asm 2: lwz >z2=19,<x30=192(1)
lwz 19,192(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#10,28,4080
# asm 2: rlwinm >p02=20,<y0=12,28,4080
rlwinm 20,12,28,4080

# qhasm: z3 = x31
# asm 1: lwz >z3=int32#19,<x31=stack32#50
# asm 2: lwz >z3=21,<x31=196(1)
lwz 21,196(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#10,<y0=int32#10,4,4080
# asm 2: rlwinm >p03=12,<y0=12,4,4080
rlwinm 12,12,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#9,12,4080
# asm 2: rlwinm >p10=22,<y1=11,12,4080
rlwinm 22,11,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#9,20,4080
# asm 2: rlwinm >p11=23,<y1=11,20,4080
rlwinm 23,11,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#9,28,4080
# asm 2: rlwinm >p12=24,<y1=11,28,4080
rlwinm 24,11,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#10,<table3=int32#1,<p03=int32#10
# asm 2: lwzx >p03=12,<table3=3,<p03=12
lwzx 12,3,12

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#9,<y1=int32#9,4,4080
# asm 2: rlwinm >p13=11,<y1=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#10,<p03=int32#10,<z1=int32#15
# asm 2: xor >z1=12,<p03=12,<z1=17
xor 12,12,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#11,12,4080
# asm 2: rlwinm >p20=19,<y2=13,12,4080
rlwinm 19,13,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#11,20,4080
# asm 2: rlwinm >p21=21,<y2=13,20,4080
rlwinm 21,13,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#11,28,4080
# asm 2: rlwinm >p22=23,<y2=13,28,4080
rlwinm 23,13,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#9,<table3=int32#1,<p13=int32#9
# asm 2: lwzx >p13=11,<table3=3,<p13=11
lwzx 11,3,11

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#11,<y2=int32#11,4,4080
# asm 2: rlwinm >p23=13,<y2=13,4,4080
rlwinm 13,13,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#10,<p10=int32#15,<z1=int32#10
# asm 2: xor >z1=12,<p10=17,<z1=12
xor 12,17,12

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#9,<p13=int32#9,<z2=int32#16
# asm 2: xor >z2=11,<p13=11,<z2=18
xor 11,11,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#12,12,4080
# asm 2: rlwinm >p30=18,<y3=14,12,4080
rlwinm 18,14,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#12,20,4080
# asm 2: rlwinm >p31=20,<y3=14,20,4080
rlwinm 20,14,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#12,28,4080
# asm 2: rlwinm >p32=22,<y3=14,28,4080
rlwinm 22,14,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#11,<table3=int32#1,<p23=int32#11
# asm 2: lwzx >p23=13,<table3=3,<p23=13
lwzx 13,3,13

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#12,<y3=int32#12,4,4080
# asm 2: rlwinm >p33=14,<y3=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#9,<p20=int32#15,<z2=int32#9
# asm 2: xor >z2=11,<p20=17,<z2=11
xor 11,17,11

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#10,<p21=int32#17,<z1=int32#10
# asm 2: xor >z1=12,<p21=19,<z1=12
xor 12,19,12

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#12,<table3=int32#1,<p33=int32#12
# asm 2: lwzx >p33=14,<table3=3,<p33=14
lwzx 14,3,14

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#11,<p23=int32#11,<z3=int32#14
# asm 2: xor >z3=13,<p23=13,<z3=16
xor 13,13,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#9,<z2=int32#9,<p31=int32#15
# asm 2: xor >y2=11,<z2=11,<p31=17
xor 11,11,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#10,<z1=int32#10,<p32=int32#17
# asm 2: xor >y1=12,<z1=12,<p32=19
xor 12,12,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#12,<z0=int32#13,<p33=int32#12
# asm 2: xor >y0=14,<z0=15,<p33=14
xor 14,15,14

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#11,<z3=int32#11,<p30=int32#16
# asm 2: xor >y3=13,<z3=13,<p30=18
xor 13,13,18

# qhasm: inint = *(uint32 *) (inp + 24)
# asm 1: lwz >inint=int32#13,24(<inp=int32#3)
# asm 2: lwz >inint=15,24(<inp=5)
lwz 15,24(5)

# qhasm: tmp0 = y0 <<< 8
# asm 1: rlwinm >tmp0=int32#14,<y0=int32#12,8,0xffffffff
# asm 2: rlwinm >tmp0=16,<y0=14,8,0xffffffff
rlwinm 16,14,8,0xffffffff

# qhasm: tmp0 bits 0xff00 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#9,16,0xff00
# asm 2: rlwimi <tmp0=16,<y2=11,16,0xff00
rlwimi 16,11,16,0xff00

# qhasm: tmp0 bits 0xff000000 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#9,16,0xff000000
# asm 2: rlwimi <tmp0=16,<y2=11,16,0xff000000
rlwimi 16,11,16,0xff000000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 24) = outint
# asm 1: stw <outint=int32#13,24(<outp=int32#4)
# asm 2: stw <outint=15,24(<outp=6)
stw 15,24(6)

# qhasm: z0 = x32
# asm 1: lwz >z0=int32#13,<x32=stack32#51
# asm 2: lwz >z0=15,<x32=200(1)
lwz 15,200(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#12,12,4080
# asm 2: rlwinm >p00=16,<y0=14,12,4080
rlwinm 16,14,12,4080

# qhasm: z1 = x33
# asm 1: lwz >z1=int32#15,<x33=stack32#52
# asm 2: lwz >z1=17,<x33=204(1)
lwz 17,204(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#12,20,4080
# asm 2: rlwinm >p01=18,<y0=14,20,4080
rlwinm 18,14,20,4080

# qhasm: z2 = x34
# asm 1: lwz >z2=int32#17,<x34=stack32#53
# asm 2: lwz >z2=19,<x34=208(1)
lwz 19,208(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#12,28,4080
# asm 2: rlwinm >p02=20,<y0=14,28,4080
rlwinm 20,14,28,4080

# qhasm: z3 = x35
# asm 1: lwz >z3=int32#19,<x35=stack32#54
# asm 2: lwz >z3=21,<x35=212(1)
lwz 21,212(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#12,<y0=int32#12,4,4080
# asm 2: rlwinm >p03=14,<y0=14,4,4080
rlwinm 14,14,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#10,12,4080
# asm 2: rlwinm >p10=22,<y1=12,12,4080
rlwinm 22,12,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#10,20,4080
# asm 2: rlwinm >p11=23,<y1=12,20,4080
rlwinm 23,12,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#10,28,4080
# asm 2: rlwinm >p12=24,<y1=12,28,4080
rlwinm 24,12,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#12,<table3=int32#1,<p03=int32#12
# asm 2: lwzx >p03=14,<table3=3,<p03=14
lwzx 14,3,14

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#10,<y1=int32#10,4,4080
# asm 2: rlwinm >p13=12,<y1=12,4,4080
rlwinm 12,12,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#12,<p03=int32#12,<z1=int32#15
# asm 2: xor >z1=14,<p03=14,<z1=17
xor 14,14,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#9,12,4080
# asm 2: rlwinm >p20=19,<y2=11,12,4080
rlwinm 19,11,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#9,20,4080
# asm 2: rlwinm >p21=21,<y2=11,20,4080
rlwinm 21,11,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#9,28,4080
# asm 2: rlwinm >p22=23,<y2=11,28,4080
rlwinm 23,11,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#10,<table3=int32#1,<p13=int32#10
# asm 2: lwzx >p13=12,<table3=3,<p13=12
lwzx 12,3,12

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#9,<y2=int32#9,4,4080
# asm 2: rlwinm >p23=11,<y2=11,4,4080
rlwinm 11,11,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#12,<p10=int32#15,<z1=int32#12
# asm 2: xor >z1=14,<p10=17,<z1=14
xor 14,17,14

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#10,<p13=int32#10,<z2=int32#16
# asm 2: xor >z2=12,<p13=12,<z2=18
xor 12,12,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#11,12,4080
# asm 2: rlwinm >p30=18,<y3=13,12,4080
rlwinm 18,13,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#11,20,4080
# asm 2: rlwinm >p31=20,<y3=13,20,4080
rlwinm 20,13,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#11,28,4080
# asm 2: rlwinm >p32=22,<y3=13,28,4080
rlwinm 22,13,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#9,<table3=int32#1,<p23=int32#9
# asm 2: lwzx >p23=11,<table3=3,<p23=11
lwzx 11,3,11

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#11,<y3=int32#11,4,4080
# asm 2: rlwinm >p33=13,<y3=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#10,<p20=int32#15,<z2=int32#10
# asm 2: xor >z2=12,<p20=17,<z2=12
xor 12,17,12

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#12,<p21=int32#17,<z1=int32#12
# asm 2: xor >z1=14,<p21=19,<z1=14
xor 14,19,14

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#11,<table3=int32#1,<p33=int32#11
# asm 2: lwzx >p33=13,<table3=3,<p33=13
lwzx 13,3,13

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#9,<p23=int32#9,<z3=int32#14
# asm 2: xor >z3=11,<p23=11,<z3=16
xor 11,11,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#10,<z2=int32#10,<p31=int32#15
# asm 2: xor >y2=12,<z2=12,<p31=17
xor 12,12,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#12,<z1=int32#12,<p32=int32#17
# asm 2: xor >y1=14,<z1=14,<p32=19
xor 14,14,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#11,<z0=int32#13,<p33=int32#11
# asm 2: xor >y0=13,<z0=15,<p33=13
xor 13,15,13

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#9,<z3=int32#9,<p30=int32#16
# asm 2: xor >y3=11,<z3=11,<p30=18
xor 11,11,18

# qhasm: inint = *(uint32 *) (inp + 28)
# asm 1: lwz >inint=int32#13,28(<inp=int32#3)
# asm 2: lwz >inint=15,28(<inp=5)
lwz 15,28(5)

# qhasm: tmp0 = y2 <<< 24
# asm 1: rlwinm >tmp0=int32#14,<y2=int32#10,24,0xffffffff
# asm 2: rlwinm >tmp0=16,<y2=12,24,0xffffffff
rlwinm 16,12,24,0xffffffff

# qhasm: tmp0 bits 0xff = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#11,16,0xff
# asm 2: rlwimi <tmp0=16,<y0=13,16,0xff
rlwimi 16,13,16,0xff

# qhasm: tmp0 bits 0xff0000 = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y0=int32#11,16,0xff0000
# asm 2: rlwimi <tmp0=16,<y0=13,16,0xff0000
rlwimi 16,13,16,0xff0000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 28) = outint
# asm 1: stw <outint=int32#13,28(<outp=int32#4)
# asm 2: stw <outint=15,28(<outp=6)
stw 15,28(6)

# qhasm: z0 = x36
# asm 1: lwz >z0=int32#13,<x36=stack32#55
# asm 2: lwz >z0=15,<x36=216(1)
lwz 15,216(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#11,12,4080
# asm 2: rlwinm >p00=16,<y0=13,12,4080
rlwinm 16,13,12,4080

# qhasm: z1 = x37
# asm 1: lwz >z1=int32#15,<x37=stack32#56
# asm 2: lwz >z1=17,<x37=220(1)
lwz 17,220(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#11,20,4080
# asm 2: rlwinm >p01=18,<y0=13,20,4080
rlwinm 18,13,20,4080

# qhasm: z2 = x38
# asm 1: lwz >z2=int32#17,<x38=stack32#57
# asm 2: lwz >z2=19,<x38=224(1)
lwz 19,224(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#11,28,4080
# asm 2: rlwinm >p02=20,<y0=13,28,4080
rlwinm 20,13,28,4080

# qhasm: z3 = x39
# asm 1: lwz >z3=int32#19,<x39=stack32#58
# asm 2: lwz >z3=21,<x39=228(1)
lwz 21,228(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#11,<y0=int32#11,4,4080
# asm 2: rlwinm >p03=13,<y0=13,4,4080
rlwinm 13,13,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#12,12,4080
# asm 2: rlwinm >p10=22,<y1=14,12,4080
rlwinm 22,14,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#12,20,4080
# asm 2: rlwinm >p11=23,<y1=14,20,4080
rlwinm 23,14,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#12,28,4080
# asm 2: rlwinm >p12=24,<y1=14,28,4080
rlwinm 24,14,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#11,<table3=int32#1,<p03=int32#11
# asm 2: lwzx >p03=13,<table3=3,<p03=13
lwzx 13,3,13

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#12,<y1=int32#12,4,4080
# asm 2: rlwinm >p13=14,<y1=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#11,<p03=int32#11,<z1=int32#15
# asm 2: xor >z1=13,<p03=13,<z1=17
xor 13,13,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#10,12,4080
# asm 2: rlwinm >p20=19,<y2=12,12,4080
rlwinm 19,12,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#10,20,4080
# asm 2: rlwinm >p21=21,<y2=12,20,4080
rlwinm 21,12,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#10,28,4080
# asm 2: rlwinm >p22=23,<y2=12,28,4080
rlwinm 23,12,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#12,<table3=int32#1,<p13=int32#12
# asm 2: lwzx >p13=14,<table3=3,<p13=14
lwzx 14,3,14

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#10,<y2=int32#10,4,4080
# asm 2: rlwinm >p23=12,<y2=12,4,4080
rlwinm 12,12,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#11,<p10=int32#15,<z1=int32#11
# asm 2: xor >z1=13,<p10=17,<z1=13
xor 13,17,13

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#12,<p13=int32#12,<z2=int32#16
# asm 2: xor >z2=14,<p13=14,<z2=18
xor 14,14,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#9,12,4080
# asm 2: rlwinm >p30=18,<y3=11,12,4080
rlwinm 18,11,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#9,20,4080
# asm 2: rlwinm >p31=20,<y3=11,20,4080
rlwinm 20,11,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#9,28,4080
# asm 2: rlwinm >p32=22,<y3=11,28,4080
rlwinm 22,11,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#10,<table3=int32#1,<p23=int32#10
# asm 2: lwzx >p23=12,<table3=3,<p23=12
lwzx 12,3,12

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#9,<y3=int32#9,4,4080
# asm 2: rlwinm >p33=11,<y3=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#12,<p20=int32#15,<z2=int32#12
# asm 2: xor >z2=14,<p20=17,<z2=14
xor 14,17,14

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#11,<p21=int32#17,<z1=int32#11
# asm 2: xor >z1=13,<p21=19,<z1=13
xor 13,19,13

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#13,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=15,<p22=21,<z0=15
xor 15,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#9,<table3=int32#1,<p33=int32#9
# asm 2: lwzx >p33=11,<table3=3,<p33=11
lwzx 11,3,11

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#10,<p23=int32#10,<z3=int32#14
# asm 2: xor >z3=12,<p23=12,<z3=16
xor 12,12,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#12,<z2=int32#12,<p31=int32#15
# asm 2: xor >y2=14,<z2=14,<p31=17
xor 14,14,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#11,<z1=int32#11,<p32=int32#17
# asm 2: xor >y1=13,<z1=13,<p32=19
xor 13,13,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#9,<z0=int32#13,<p33=int32#9
# asm 2: xor >y0=11,<z0=15,<p33=11
xor 11,15,11

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#10,<z3=int32#10,<p30=int32#16
# asm 2: xor >y3=12,<z3=12,<p30=18
xor 12,12,18

# qhasm: inint = *(uint32 *) (inp + 32)
# asm 1: lwz >inint=int32#13,32(<inp=int32#3)
# asm 2: lwz >inint=15,32(<inp=5)
lwz 15,32(5)

# qhasm: tmp0 = y0 <<< 8
# asm 1: rlwinm >tmp0=int32#14,<y0=int32#9,8,0xffffffff
# asm 2: rlwinm >tmp0=16,<y0=11,8,0xffffffff
rlwinm 16,11,8,0xffffffff

# qhasm: tmp0 bits 0xff00 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#12,16,0xff00
# asm 2: rlwimi <tmp0=16,<y2=14,16,0xff00
rlwimi 16,14,16,0xff00

# qhasm: tmp0 bits 0xff000000 = y2 <<< 16
# asm 1: rlwimi <tmp0=int32#14,<y2=int32#12,16,0xff000000
# asm 2: rlwimi <tmp0=16,<y2=14,16,0xff000000
rlwimi 16,14,16,0xff000000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#13,<inint=int32#13,<tmp0=int32#14
# asm 2: xor >outint=15,<inint=15,<tmp0=16
xor 15,15,16

# qhasm: *(uint32 *) (outp + 32) = outint
# asm 1: stw <outint=int32#13,32(<outp=int32#4)
# asm 2: stw <outint=15,32(<outp=6)
stw 15,32(6)

# qhasm: z0 = x40
# asm 1: lwz >z0=int32#13,<x40=stack32#59
# asm 2: lwz >z0=15,<x40=232(1)
lwz 15,232(1)

# qhasm: p00 = 4080 & (y0 <<< 12)
# asm 1: rlwinm >p00=int32#14,<y0=int32#9,12,4080
# asm 2: rlwinm >p00=16,<y0=11,12,4080
rlwinm 16,11,12,4080

# qhasm: z1 = x41
# asm 1: lwz >z1=int32#15,<x41=stack32#60
# asm 2: lwz >z1=17,<x41=236(1)
lwz 17,236(1)

# qhasm: p01 = 4080 & (y0 <<< 20)
# asm 1: rlwinm >p01=int32#16,<y0=int32#9,20,4080
# asm 2: rlwinm >p01=18,<y0=11,20,4080
rlwinm 18,11,20,4080

# qhasm: z2 = x42
# asm 1: lwz >z2=int32#17,<x42=stack32#61
# asm 2: lwz >z2=19,<x42=240(1)
lwz 19,240(1)

# qhasm: p02 = 4080 & (y0 <<< 28)
# asm 1: rlwinm >p02=int32#18,<y0=int32#9,28,4080
# asm 2: rlwinm >p02=20,<y0=11,28,4080
rlwinm 20,11,28,4080

# qhasm: z3 = x43
# asm 1: lwz >z3=int32#19,<x43=stack32#62
# asm 2: lwz >z3=21,<x43=244(1)
lwz 21,244(1)

# qhasm: p03 = 4080 & (y0 <<< 4)
# asm 1: rlwinm >p03=int32#9,<y0=int32#9,4,4080
# asm 2: rlwinm >p03=11,<y0=11,4,4080
rlwinm 11,11,4,4080

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lwzx >p00=int32#14,<table0=int32#6,<p00=int32#14
# asm 2: lwzx >p00=16,<table0=8,<p00=16
lwzx 16,8,16

# qhasm: p10 = 4080 & (y1 <<< 12)
# asm 1: rlwinm >p10=int32#20,<y1=int32#11,12,4080
# asm 2: rlwinm >p10=22,<y1=13,12,4080
rlwinm 22,13,12,4080

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lwzx >p01=int32#16,<table1=int32#7,<p01=int32#16
# asm 2: lwzx >p01=18,<table1=9,<p01=18
lwzx 18,9,18

# qhasm: p11 = 4080 & (y1 <<< 20)
# asm 1: rlwinm >p11=int32#21,<y1=int32#11,20,4080
# asm 2: rlwinm >p11=23,<y1=13,20,4080
rlwinm 23,13,20,4080

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lwzx >p02=int32#18,<table2=int32#8,<p02=int32#18
# asm 2: lwzx >p02=20,<table2=10,<p02=20
lwzx 20,10,20

# qhasm: p12 = 4080 & (y1 <<< 28)
# asm 1: rlwinm >p12=int32#22,<y1=int32#11,28,4080
# asm 2: rlwinm >p12=24,<y1=13,28,4080
rlwinm 24,13,28,4080

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lwzx >p03=int32#9,<table3=int32#1,<p03=int32#9
# asm 2: lwzx >p03=11,<table3=3,<p03=11
lwzx 11,3,11

# qhasm: p13 = 4080 & (y1 <<< 4)
# asm 1: rlwinm >p13=int32#11,<y1=int32#11,4,4080
# asm 2: rlwinm >p13=13,<y1=13,4,4080
rlwinm 13,13,4,4080

# qhasm: z0 ^= p00
# asm 1: xor >z0=int32#13,<p00=int32#14,<z0=int32#13
# asm 2: xor >z0=15,<p00=16,<z0=15
xor 15,16,15

# qhasm: z3 ^= p01
# asm 1: xor >z3=int32#14,<p01=int32#16,<z3=int32#19
# asm 2: xor >z3=16,<p01=18,<z3=21
xor 16,18,21

# qhasm: z2 ^= p02
# asm 1: xor >z2=int32#16,<p02=int32#18,<z2=int32#17
# asm 2: xor >z2=18,<p02=20,<z2=19
xor 18,20,19

# qhasm: z1 ^= p03
# asm 1: xor >z1=int32#9,<p03=int32#9,<z1=int32#15
# asm 2: xor >z1=11,<p03=11,<z1=17
xor 11,11,17

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lwzx >p10=int32#15,<table0=int32#6,<p10=int32#20
# asm 2: lwzx >p10=17,<table0=8,<p10=22
lwzx 17,8,22

# qhasm: p20 = 4080 & (y2 <<< 12)
# asm 1: rlwinm >p20=int32#17,<y2=int32#12,12,4080
# asm 2: rlwinm >p20=19,<y2=14,12,4080
rlwinm 19,14,12,4080

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lwzx >p11=int32#18,<table1=int32#7,<p11=int32#21
# asm 2: lwzx >p11=20,<table1=9,<p11=23
lwzx 20,9,23

# qhasm: p21 = 4080 & (y2 <<< 20)
# asm 1: rlwinm >p21=int32#19,<y2=int32#12,20,4080
# asm 2: rlwinm >p21=21,<y2=14,20,4080
rlwinm 21,14,20,4080

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lwzx >p12=int32#20,<table2=int32#8,<p12=int32#22
# asm 2: lwzx >p12=22,<table2=10,<p12=24
lwzx 22,10,24

# qhasm: p22 = 4080 & (y2 <<< 28)
# asm 1: rlwinm >p22=int32#21,<y2=int32#12,28,4080
# asm 2: rlwinm >p22=23,<y2=14,28,4080
rlwinm 23,14,28,4080

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lwzx >p13=int32#11,<table3=int32#1,<p13=int32#11
# asm 2: lwzx >p13=13,<table3=3,<p13=13
lwzx 13,3,13

# qhasm: p23 = 4080 & (y2 <<< 4)
# asm 1: rlwinm >p23=int32#12,<y2=int32#12,4,4080
# asm 2: rlwinm >p23=14,<y2=14,4,4080
rlwinm 14,14,4,4080

# qhasm: z1 ^= p10
# asm 1: xor >z1=int32#9,<p10=int32#15,<z1=int32#9
# asm 2: xor >z1=11,<p10=17,<z1=11
xor 11,17,11

# qhasm: z0 ^= p11
# asm 1: xor >z0=int32#13,<p11=int32#18,<z0=int32#13
# asm 2: xor >z0=15,<p11=20,<z0=15
xor 15,20,15

# qhasm: z3 ^= p12
# asm 1: xor >z3=int32#14,<p12=int32#20,<z3=int32#14
# asm 2: xor >z3=16,<p12=22,<z3=16
xor 16,22,16

# qhasm: z2 ^= p13
# asm 1: xor >z2=int32#11,<p13=int32#11,<z2=int32#16
# asm 2: xor >z2=13,<p13=13,<z2=18
xor 13,13,18

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lwzx >p20=int32#15,<table0=int32#6,<p20=int32#17
# asm 2: lwzx >p20=17,<table0=8,<p20=19
lwzx 17,8,19

# qhasm: p30 = 4080 & (y3 <<< 12)
# asm 1: rlwinm >p30=int32#16,<y3=int32#10,12,4080
# asm 2: rlwinm >p30=18,<y3=12,12,4080
rlwinm 18,12,12,4080

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lwzx >p21=int32#17,<table1=int32#7,<p21=int32#19
# asm 2: lwzx >p21=19,<table1=9,<p21=21
lwzx 19,9,21

# qhasm: p31 = 4080 & (y3 <<< 20)
# asm 1: rlwinm >p31=int32#18,<y3=int32#10,20,4080
# asm 2: rlwinm >p31=20,<y3=12,20,4080
rlwinm 20,12,20,4080

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lwzx >p22=int32#19,<table2=int32#8,<p22=int32#21
# asm 2: lwzx >p22=21,<table2=10,<p22=23
lwzx 21,10,23

# qhasm: p32 = 4080 & (y3 <<< 28)
# asm 1: rlwinm >p32=int32#20,<y3=int32#10,28,4080
# asm 2: rlwinm >p32=22,<y3=12,28,4080
rlwinm 22,12,28,4080

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lwzx >p23=int32#12,<table3=int32#1,<p23=int32#12
# asm 2: lwzx >p23=14,<table3=3,<p23=14
lwzx 14,3,14

# qhasm: p33 = 4080 & (y3 <<< 4)
# asm 1: rlwinm >p33=int32#10,<y3=int32#10,4,4080
# asm 2: rlwinm >p33=12,<y3=12,4,4080
rlwinm 12,12,4,4080

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lwzx >p30=int32#16,<table0=int32#6,<p30=int32#16
# asm 2: lwzx >p30=18,<table0=8,<p30=18
lwzx 18,8,18

# qhasm: z2 ^= p20
# asm 1: xor >z2=int32#11,<p20=int32#15,<z2=int32#11
# asm 2: xor >z2=13,<p20=17,<z2=13
xor 13,17,13

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lwzx >p31=int32#15,<table1=int32#7,<p31=int32#18
# asm 2: lwzx >p31=17,<table1=9,<p31=20
lwzx 17,9,20

# qhasm: z1 ^= p21
# asm 1: xor >z1=int32#9,<p21=int32#17,<z1=int32#9
# asm 2: xor >z1=11,<p21=19,<z1=11
xor 11,19,11

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lwzx >p32=int32#17,<table2=int32#8,<p32=int32#20
# asm 2: lwzx >p32=19,<table2=10,<p32=22
lwzx 19,10,22

# qhasm: z0 ^= p22
# asm 1: xor >z0=int32#18,<p22=int32#19,<z0=int32#13
# asm 2: xor >z0=20,<p22=21,<z0=15
xor 20,21,15

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lwzx >p33=int32#10,<table3=int32#1,<p33=int32#10
# asm 2: lwzx >p33=12,<table3=3,<p33=12
lwzx 12,3,12

# qhasm: z3 ^= p23
# asm 1: xor >z3=int32#14,<p23=int32#12,<z3=int32#14
# asm 2: xor >z3=16,<p23=14,<z3=16
xor 16,14,16

# qhasm: y2 = z2 ^ p31
# asm 1: xor >y2=int32#13,<z2=int32#11,<p31=int32#15
# asm 2: xor >y2=15,<z2=13,<p31=17
xor 15,13,17

# qhasm: y1 = z1 ^ p32
# asm 1: xor >y1=int32#12,<z1=int32#9,<p32=int32#17
# asm 2: xor >y1=14,<z1=11,<p32=19
xor 14,11,19

# qhasm: y0 = z0 ^ p33
# asm 1: xor >y0=int32#11,<z0=int32#18,<p33=int32#10
# asm 2: xor >y0=13,<z0=20,<p33=12
xor 13,20,12

# qhasm: y3 = z3 ^ p30
# asm 1: xor >y3=int32#14,<z3=int32#14,<p30=int32#16
# asm 2: xor >y3=16,<z3=16,<p30=18
xor 16,16,18

# qhasm: inint = *(uint32 *) (inp + 36)
# asm 1: lwz >inint=int32#9,36(<inp=int32#3)
# asm 2: lwz >inint=11,36(<inp=5)
lwz 11,36(5)

# qhasm: tmp0 = y2 <<< 24
# asm 1: rlwinm >tmp0=int32#10,<y2=int32#13,24,0xffffffff
# asm 2: rlwinm >tmp0=12,<y2=15,24,0xffffffff
rlwinm 12,15,24,0xffffffff

# qhasm: tmp0 bits 0xff = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#10,<y0=int32#11,16,0xff
# asm 2: rlwimi <tmp0=12,<y0=13,16,0xff
rlwimi 12,13,16,0xff

# qhasm: tmp0 bits 0xff0000 = y0 <<< 16
# asm 1: rlwimi <tmp0=int32#10,<y0=int32#11,16,0xff0000
# asm 2: rlwimi <tmp0=12,<y0=13,16,0xff0000
rlwimi 12,13,16,0xff0000

# qhasm: outint = inint ^ tmp0
# asm 1: xor >outint=int32#9,<inint=int32#9,<tmp0=int32#10
# asm 2: xor >outint=11,<inint=11,<tmp0=12
xor 11,11,12

# qhasm: *(uint32 *) (outp + 36) = outint
# asm 1: stw <outint=int32#9,36(<outp=int32#4)
# asm 2: stw <outint=11,36(<outp=6)
stw 11,36(6)

# qhasm: length -=40
# asm 1: addi >length=int32#5,<length=int32#5,-40
# asm 2: addi >length=7,<length=7,-40
addi 7,7,-40

# qhasm: inp += 40
# asm 1: addi >inp=int32#3,<inp=int32#3,40
# asm 2: addi >inp=5,<inp=5,40
addi 5,5,40

# qhasm: outp += 40
# asm 1: addi >outp=int32#4,<outp=int32#4,40
# asm 2: addi >outp=6,<outp=6,40
addi 6,6,40

# qhasm: <? (int32) length - 40
# asm 1: cmpwi <length=int32#5,40
# asm 2: cmpwi <length=7,40
cmpwi 7,40

# qhasm: goto mainloop if !<
bge .label.mainloop

# qhasm: lessthan40bytesleft:
.label.lessthan40bytesleft:

# qhasm: <? =? (int32) length - 0
# asm 1: cmpwi <length=int32#5,0
# asm 2: cmpwi <length=7,0
cmpwi 7,0

# qhasm: goto end if =
beq .label.end

# qhasm: goto copy if <
blt .label.copy

# qhasm: inp_stack = inp
# asm 1: stw <inp=int32#3,>inp_stack=stack32#19
# asm 2: stw <inp=5,>inp_stack=72(1)
stw 5,72(1)

# qhasm: outp_stack = outp
# asm 1: stw <outp=int32#4,>outp_stack=stack32#21
# asm 2: stw <outp=6,>outp_stack=80(1)
stw 6,80(1)

# qhasm: length_stack = length
# asm 1: stw <length=int32#5,>length_stack=stack32#20
# asm 2: stw <length=7,>length_stack=76(1)
stw 7,76(1)

# qhasm: tmp0 = 0
# asm 1: li >tmp0=int32#4,0
# asm 2: li >tmp0=6,0
li 6,0

# qhasm: inp = &tmp
# asm 1: lea >inp=int32#3,>tmp=stack320#1
# asm 2: lea >inp=5,>tmp=256(1)
addi 5,1,256

# qhasm: *(uint32 *) (inp + 0) = tmp0
# asm 1: stw <tmp0=int32#4,0(<inp=int32#3)
# asm 2: stw <tmp0=6,0(<inp=5)
stw 6,0(5)

# qhasm: *(uint32 *) (inp + 4) = tmp0
# asm 1: stw <tmp0=int32#4,4(<inp=int32#3)
# asm 2: stw <tmp0=6,4(<inp=5)
stw 6,4(5)

# qhasm: *(uint32 *) (inp + 8) = tmp0
# asm 1: stw <tmp0=int32#4,8(<inp=int32#3)
# asm 2: stw <tmp0=6,8(<inp=5)
stw 6,8(5)

# qhasm: *(uint32 *) (inp + 12) = tmp0
# asm 1: stw <tmp0=int32#4,12(<inp=int32#3)
# asm 2: stw <tmp0=6,12(<inp=5)
stw 6,12(5)

# qhasm: *(uint32 *) (inp + 16) = tmp0
# asm 1: stw <tmp0=int32#4,16(<inp=int32#3)
# asm 2: stw <tmp0=6,16(<inp=5)
stw 6,16(5)

# qhasm: *(uint32 *) (inp + 20) = tmp0
# asm 1: stw <tmp0=int32#4,20(<inp=int32#3)
# asm 2: stw <tmp0=6,20(<inp=5)
stw 6,20(5)

# qhasm: *(uint32 *) (inp + 24) = tmp0
# asm 1: stw <tmp0=int32#4,24(<inp=int32#3)
# asm 2: stw <tmp0=6,24(<inp=5)
stw 6,24(5)

# qhasm: *(uint32 *) (inp + 28) = tmp0
# asm 1: stw <tmp0=int32#4,28(<inp=int32#3)
# asm 2: stw <tmp0=6,28(<inp=5)
stw 6,28(5)

# qhasm: *(uint32 *) (inp + 32) = tmp0
# asm 1: stw <tmp0=int32#4,32(<inp=int32#3)
# asm 2: stw <tmp0=6,32(<inp=5)
stw 6,32(5)

# qhasm: *(uint32 *) (inp + 36) = tmp0
# asm 1: stw <tmp0=int32#4,36(<inp=int32#3)
# asm 2: stw <tmp0=6,36(<inp=5)
stw 6,36(5)

# qhasm: outp = inp 
# asm 1: mr >outp=int32#4,<inp=int32#3
# asm 2: mr >outp=6,<inp=5
mr 6,5

# qhasm: goto mainloop
b .label.mainloop

# qhasm: copy:
.label.copy:

# qhasm: length = length_stack
# asm 1: lwz >length=int32#1,<length_stack=stack32#20
# asm 2: lwz >length=3,<length_stack=76(1)
lwz 3,76(1)

# qhasm: tmpp = &tmp
# asm 1: lea >tmpp=int32#3,>tmp=stack320#1
# asm 2: lea >tmpp=5,>tmp=256(1)
addi 5,1,256

# qhasm: inp = inp_stack
# asm 1: lwz >inp=int32#4,<inp_stack=stack32#19
# asm 2: lwz >inp=6,<inp_stack=72(1)
lwz 6,72(1)

# qhasm: outp = outp_stack
# asm 1: lwz >outp=int32#5,<outp_stack=stack32#21
# asm 2: lwz >outp=7,<outp_stack=80(1)
lwz 7,80(1)

# qhasm: copyloop:
.label.copyloop:

# qhasm: <? (int32) length - 1
# asm 1: cmpwi <length=int32#1,1
# asm 2: cmpwi <length=3,1
cmpwi 3,1

# qhasm: goto end if <
blt .label.end

# qhasm: tmp1 = *(uint8 *) (tmpp + 0)
# asm 1: lbz >tmp1=int32#6,0(<tmpp=int32#3)
# asm 2: lbz >tmp1=8,0(<tmpp=5)
lbz 8,0(5)

# qhasm: in0 = *(uint8 *) (inp + 0)
# asm 1: lbz >in0=int32#7,0(<inp=int32#4)
# asm 2: lbz >in0=9,0(<inp=6)
lbz 9,0(6)

# qhasm: tmp1 ^= in0
# asm 1: xor >tmp1=int32#6,<in0=int32#7,<tmp1=int32#6
# asm 2: xor >tmp1=8,<in0=9,<tmp1=8
xor 8,9,8

# qhasm: *(uint8 *) (outp + 0) = tmp1 
# asm 1: stb <tmp1=int32#6,0(<outp=int32#5)
# asm 2: stb <tmp1=8,0(<outp=7)
stb 8,0(7)

# qhasm: outp = outp + 1
# asm 1: addi >outp=int32#5,<outp=int32#5,1
# asm 2: addi >outp=7,<outp=7,1
addi 7,7,1

# qhasm: inp = inp + 1
# asm 1: addi >inp=int32#4,<inp=int32#4,1
# asm 2: addi >inp=6,<inp=6,1
addi 6,6,1

# qhasm: tmpp = tmpp + 1
# asm 1: addi >tmpp=int32#3,<tmpp=int32#3,1
# asm 2: addi >tmpp=5,<tmpp=5,1
addi 5,5,1

# qhasm: length = length - 1
# asm 1: addi >length=int32#1,<length=int32#1,-1
# asm 2: addi >length=3,<length=3,-1
addi 3,3,-1

# qhasm: goto copyloop
b .label.copyloop

# qhasm: end:
.label.end:

# qhasm: *(uint32 *) (ctxp + 56) = y0
# asm 1: stw <y0=int32#11,56(<ctxp=int32#2)
# asm 2: stw <y0=13,56(<ctxp=4)
stw 13,56(4)

# qhasm: *(uint32 *) (ctxp + 60) = y1
# asm 1: stw <y1=int32#12,60(<ctxp=int32#2)
# asm 2: stw <y1=14,60(<ctxp=4)
stw 14,60(4)

# qhasm: *(uint32 *) (ctxp + 64) = y2
# asm 1: stw <y2=int32#13,64(<ctxp=int32#2)
# asm 2: stw <y2=15,64(<ctxp=4)
stw 15,64(4)

# qhasm: *(uint32 *) (ctxp + 68) = y3
# asm 1: stw <y3=int32#14,68(<ctxp=int32#2)
# asm 2: stw <y3=16,68(<ctxp=4)
stw 16,68(4)

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

# qhasm: donothing:
.label.donothing:

# qhasm: leave
addi 1,1,464
blr
