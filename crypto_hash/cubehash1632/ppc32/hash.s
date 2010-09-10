
# qhasm: int32 out

# qhasm: int32 in

# qhasm: int32 inlenhigh

# qhasm: int32 inlenlow

# qhasm: int32 result

# qhasm: input out

# qhasm: input in

# qhasm: input inlenhigh

# qhasm: input inlenlow

# qhasm: output result

# qhasm: int32 x00

# qhasm: int32 x01

# qhasm: int32 x02

# qhasm: int32 x03

# qhasm: int32 x04

# qhasm: int32 x05

# qhasm: int32 x06

# qhasm: int32 x07

# qhasm: int32 x08

# qhasm: int32 x09

# qhasm: int32 x0a

# qhasm: int32 x0b

# qhasm: int32 x0c

# qhasm: int32 x0d

# qhasm: int32 x0e

# qhasm: int32 x0f

# qhasm: int32 x10

# qhasm: int32 x11

# qhasm: int32 x12

# qhasm: int32 x13

# qhasm: int32 x14

# qhasm: int32 x15

# qhasm: int32 x16

# qhasm: int32 x17

# qhasm: int32 x18

# qhasm: int32 x19

# qhasm: int32 x1a

# qhasm: int32 x1b

# qhasm: int32 x1c

# qhasm: int32 x1d

# qhasm: int32 x1e

# qhasm: int32 x1f

# qhasm: int32 y00

# qhasm: int32 y01

# qhasm: int32 y02

# qhasm: int32 y03

# qhasm: int32 y04

# qhasm: int32 y05

# qhasm: int32 y06

# qhasm: int32 y07

# qhasm: int32 r

# qhasm: int32 i

# qhasm: int32 finalization

# qhasm: stack256 tmp

# qhasm: int32 z

# qhasm: stack32 out_stack

# qhasm: stack32 in_stack

# qhasm: stack32 inlenlow_stack

# qhasm: stack32 inlenhigh_stack

# qhasm: stack32 finalization_stack

# qhasm: stack32 r_stack

# qhasm: stack32 x02_stack

# qhasm: stack32 x0a_stack

# qhasm: stack32 x0b_stack

# qhasm: stack32 x14_stack

# qhasm: stack32 x15_stack

# qhasm: stack32 x16_stack

# qhasm: stack32 x17_stack

# qhasm: stack32 x1c_stack

# qhasm: stack32 x1d_stack

# qhasm: stack32 x1e_stack

# qhasm: stack32 x1f_stack

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

# qhasm: enter crypto_hash_cubehash1632_ppc32
.text
.align 3
.globl .crypto_hash_cubehash1632_ppc32
.globl _crypto_hash_cubehash1632_ppc32
.globl crypto_hash_cubehash1632_ppc32
.crypto_hash_cubehash1632_ppc32:
_crypto_hash_cubehash1632_ppc32:
crypto_hash_cubehash1632_ppc32:
stwu 1,-320(1)

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

# qhasm:   out_stack = out
# asm 1: stw <out=int32#1,>out_stack=stack32#19
# asm 2: stw <out=3,>out_stack=72(1)
stw 3,72(1)

# qhasm:   x08 = 65536 * 0x4d42
# asm 1: lis >x08=int32#1,0x4d42
# asm 2: lis >x08=3,0x4d42
lis 3,0x4d42

# qhasm:   x09 = 65536 * 0xa647
# asm 1: lis >x09=int32#5,0xa647
# asm 2: lis >x09=7,0xa647
lis 7,0xa647

# qhasm:   x0a = 65536 * 0x97cf
# asm 1: lis >x0a=int32#6,0x97cf
# asm 2: lis >x0a=8,0x97cf
lis 8,0x97cf

# qhasm:   x0b = 65536 * 0x825b
# asm 1: lis >x0b=int32#7,0x825b
# asm 2: lis >x0b=9,0x825b
lis 9,0x825b

# qhasm:   x0c = 65536 * 0xeef8
# asm 1: lis >x0c=int32#8,0xeef8
# asm 2: lis >x0c=10,0xeef8
lis 10,0xeef8

# qhasm:   x0d = 65536 * 0xf220
# asm 1: lis >x0d=int32#9,0xf220
# asm 2: lis >x0d=11,0xf220
lis 11,0xf220

# qhasm:   x0e = 65536 * 0xd0e5
# asm 1: lis >x0e=int32#10,0xd0e5
# asm 2: lis >x0e=12,0xd0e5
lis 12,0xd0e5

# qhasm:   x0f = 65536 * 0xa239
# asm 1: lis >x0f=int32#11,0xa239
# asm 2: lis >x0f=13,0xa239
lis 13,0xa239

# qhasm:   x08 |= 0xc787
# asm 1: ori >x08=int32#1,<x08=int32#1,0xc787
# asm 2: ori >x08=3,<x08=3,0xc787
ori 3,3,0xc787

# qhasm:   x09 |= 0xa8b3
# asm 1: ori >x09=int32#5,<x09=int32#5,0xa8b3
# asm 2: ori >x09=7,<x09=7,0xa8b3
ori 7,7,0xa8b3

# qhasm:   x0a |= 0x0bef
# asm 1: ori >x0a=int32#6,<x0a=int32#6,0x0bef
# asm 2: ori >x0a=8,<x0a=8,0x0bef
ori 8,8,0x0bef

# qhasm:   x0b |= 0x4537
# asm 1: ori >x0b=int32#7,<x0b=int32#7,0x4537
# asm 2: ori >x0b=9,<x0b=9,0x4537
ori 9,9,0x4537

# qhasm:   x0c |= 0x64d2
# asm 1: ori >x0c=int32#8,<x0c=int32#8,0x64d2
# asm 2: ori >x0c=10,<x0c=10,0x64d2
ori 10,10,0x64d2

# qhasm:   x0d |= 0x90c4
# asm 1: ori >x0d=int32#9,<x0d=int32#9,0x90c4
# asm 2: ori >x0d=11,<x0d=11,0x90c4
ori 11,11,0x90c4

# qhasm:   x0e |= 0xcd33
# asm 1: ori >x0e=int32#10,<x0e=int32#10,0xcd33
# asm 2: ori >x0e=12,<x0e=12,0xcd33
ori 12,12,0xcd33

# qhasm:   x0f |= 0x11ae
# asm 1: ori >x0f=int32#11,<x0f=int32#11,0x11ae
# asm 2: ori >x0f=13,<x0f=13,0x11ae
ori 13,13,0x11ae

# qhasm:   x0b_stack = x0b
# asm 1: stw <x0b=int32#7,>x0b_stack=stack32#20
# asm 2: stw <x0b=9,>x0b_stack=76(1)
stw 9,76(1)

# qhasm:   x10 = 65536 * 0xfcd3
# asm 1: lis >x10=int32#7,0xfcd3
# asm 2: lis >x10=9,0xfcd3
lis 9,0xfcd3

# qhasm:   x11 = 65536 * 0x148f
# asm 1: lis >x11=int32#12,0x148f
# asm 2: lis >x11=14,0x148f
lis 14,0x148f

# qhasm:   x12 = 65536 * 0x1b01
# asm 1: lis >x12=int32#13,0x1b01
# asm 2: lis >x12=15,0x1b01
lis 15,0x1b01

# qhasm:   x13 = 65536 * 0xb644
# asm 1: lis >x13=int32#14,0xb644
# asm 2: lis >x13=16,0xb644
lis 16,0xb644

# qhasm:   x14 = 65536 * 0x6a53
# asm 1: lis >x14=int32#15,0x6a53
# asm 2: lis >x14=17,0x6a53
lis 17,0x6a53

# qhasm:   x15 = 65536 * 0x2ff5
# asm 1: lis >x15=int32#16,0x2ff5
# asm 2: lis >x15=18,0x2ff5
lis 18,0x2ff5

# qhasm:   x16 = 65536 * 0x91fa
# asm 1: lis >x16=int32#17,0x91fa
# asm 2: lis >x16=19,0x91fa
lis 19,0x91fa

# qhasm:   x17 = 65536 * 0x0dba
# asm 1: lis >x17=int32#18,0x0dba
# asm 2: lis >x17=20,0x0dba
lis 20,0x0dba

# qhasm:   x10 |= 0x98d9
# asm 1: ori >x10=int32#7,<x10=int32#7,0x98d9
# asm 2: ori >x10=9,<x10=9,0x98d9
ori 9,9,0x98d9

# qhasm:   x11 |= 0xe485
# asm 1: ori >x11=int32#12,<x11=int32#12,0xe485
# asm 2: ori >x11=14,<x11=14,0xe485
ori 14,14,0xe485

# qhasm:   x12 |= 0x7bef
# asm 1: ori >x12=int32#13,<x12=int32#13,0x7bef
# asm 2: ori >x12=15,<x12=15,0x7bef
ori 15,15,0x7bef

# qhasm:   x13 |= 0x4532
# asm 1: ori >x13=int32#14,<x13=int32#14,0x4532
# asm 2: ori >x13=16,<x13=16,0x4532
ori 16,16,0x4532

# qhasm:   x14 |= 0x6159
# asm 1: ori >x14=int32#15,<x14=int32#15,0x6159
# asm 2: ori >x14=17,<x14=17,0x6159
ori 17,17,0x6159

# qhasm:   x15 |= 0x781c
# asm 1: ori >x15=int32#16,<x15=int32#16,0x781c
# asm 2: ori >x15=18,<x15=18,0x781c
ori 18,18,0x781c

# qhasm:   x16 |= 0x7934
# asm 1: ori >x16=int32#17,<x16=int32#17,0x7934
# asm 2: ori >x16=19,<x16=19,0x7934
ori 19,19,0x7934

# qhasm:   x17 |= 0xdea9
# asm 1: ori >x17=int32#18,<x17=int32#18,0xdea9
# asm 2: ori >x17=20,<x17=20,0xdea9
ori 20,20,0xdea9

# qhasm:   x14_stack = x14
# asm 1: stw <x14=int32#15,>x14_stack=stack32#21
# asm 2: stw <x14=17,>x14_stack=80(1)
stw 17,80(1)

# qhasm:   x15_stack = x15
# asm 1: stw <x15=int32#16,>x15_stack=stack32#22
# asm 2: stw <x15=18,>x15_stack=84(1)
stw 18,84(1)

# qhasm:   x16_stack = x16
# asm 1: stw <x16=int32#17,>x16_stack=stack32#23
# asm 2: stw <x16=19,>x16_stack=88(1)
stw 19,88(1)

# qhasm:   x17_stack = x17
# asm 1: stw <x17=int32#18,>x17_stack=stack32#24
# asm 2: stw <x17=20,>x17_stack=92(1)
stw 20,92(1)

# qhasm:   x18 = 65536 * 0xd65c
# asm 1: lis >x18=int32#15,0xd65c
# asm 2: lis >x18=17,0xd65c
lis 17,0xd65c

# qhasm:   x19 = 65536 * 0xa5a7
# asm 1: lis >x19=int32#16,0xa5a7
# asm 2: lis >x19=18,0xa5a7
lis 18,0xa5a7

# qhasm:   x1a = 65536 * 0xb1c6
# asm 1: lis >x1a=int32#17,0xb1c6
# asm 2: lis >x1a=19,0xb1c6
lis 19,0xb1c6

# qhasm:   x1b = 65536 * 0xbc79
# asm 1: lis >x1b=int32#18,0xbc79
# asm 2: lis >x1b=20,0xbc79
lis 20,0xbc79

# qhasm:   x1c = 65536 * 0x1921
# asm 1: lis >x1c=int32#19,0x1921
# asm 2: lis >x1c=21,0x1921
lis 21,0x1921

# qhasm:   x1d = 65536 * 0xe798
# asm 1: lis >x1d=int32#20,0xe798
# asm 2: lis >x1d=22,0xe798
lis 22,0xe798

# qhasm:   x1e = 65536 * 0x7795
# asm 1: lis >x1e=int32#21,0x7795
# asm 2: lis >x1e=23,0x7795
lis 23,0x7795

# qhasm:   x1f = 65536 * 0xd43e
# asm 1: lis >x1f=int32#22,0xd43e
# asm 2: lis >x1f=24,0xd43e
lis 24,0xd43e

# qhasm:   x18 |= 0x8a2b
# asm 1: ori >x18=int32#15,<x18=int32#15,0x8a2b
# asm 2: ori >x18=17,<x18=17,0x8a2b
ori 17,17,0x8a2b

# qhasm:   x19 |= 0x0e75
# asm 1: ori >x19=int32#16,<x19=int32#16,0x0e75
# asm 2: ori >x19=18,<x19=18,0x0e75
ori 18,18,0x0e75

# qhasm:   x1a |= 0x2456
# asm 1: ori >x1a=int32#17,<x1a=int32#17,0x2456
# asm 2: ori >x1a=19,<x1a=19,0x2456
ori 19,19,0x2456

# qhasm:   x1b |= 0x6576
# asm 1: ori >x1b=int32#18,<x1b=int32#18,0x6576
# asm 2: ori >x1b=20,<x1b=20,0x6576
ori 20,20,0x6576

# qhasm:   x1c |= 0xc8f7
# asm 1: ori >x1c=int32#19,<x1c=int32#19,0xc8f7
# asm 2: ori >x1c=21,<x1c=21,0xc8f7
ori 21,21,0xc8f7

# qhasm:   x1d |= 0x9af1
# asm 1: ori >x1d=int32#20,<x1d=int32#20,0x9af1
# asm 2: ori >x1d=22,<x1d=22,0x9af1
ori 22,22,0x9af1

# qhasm:   x1e |= 0xd246
# asm 1: ori >x1e=int32#21,<x1e=int32#21,0xd246
# asm 2: ori >x1e=23,<x1e=23,0xd246
ori 23,23,0xd246

# qhasm:   x1f |= 0x3b44
# asm 1: ori >x1f=int32#22,<x1f=int32#22,0x3b44
# asm 2: ori >x1f=24,<x1f=24,0x3b44
ori 24,24,0x3b44

# qhasm:   x1c_stack = x1c
# asm 1: stw <x1c=int32#19,>x1c_stack=stack32#25
# asm 2: stw <x1c=21,>x1c_stack=96(1)
stw 21,96(1)

# qhasm:   x1d_stack = x1d
# asm 1: stw <x1d=int32#20,>x1d_stack=stack32#26
# asm 2: stw <x1d=22,>x1d_stack=100(1)
stw 22,100(1)

# qhasm:   x1e_stack = x1e
# asm 1: stw <x1e=int32#21,>x1e_stack=stack32#27
# asm 2: stw <x1e=23,>x1e_stack=104(1)
stw 23,104(1)

# qhasm:   x1f_stack = x1f
# asm 1: stw <x1f=int32#22,>x1f_stack=stack32#28
# asm 2: stw <x1f=24,>x1f_stack=108(1)
stw 24,108(1)

# qhasm:   x00 = 65536 * 0x2aea
# asm 1: lis >x00=int32#19,0x2aea
# asm 2: lis >x00=21,0x2aea
lis 21,0x2aea

# qhasm:   x01 = 65536 * 0x50f4
# asm 1: lis >x01=int32#20,0x50f4
# asm 2: lis >x01=22,0x50f4
lis 22,0x50f4

# qhasm:   x02 = 65536 * 0x2d53
# asm 1: lis >x02=int32#21,0x2d53
# asm 2: lis >x02=23,0x2d53
lis 23,0x2d53

# qhasm:   x03 = 65536 * 0x4167
# asm 1: lis >x03=int32#22,0x4167
# asm 2: lis >x03=24,0x4167
lis 24,0x4167

# qhasm:   x04 = 65536 * 0x3fee
# asm 1: lis >x04=int32#23,0x3fee
# asm 2: lis >x04=25,0x3fee
lis 25,0x3fee

# qhasm:   x05 = 65536 * 0xc701
# asm 1: lis >x05=int32#24,0xc701
# asm 2: lis >x05=26,0xc701
lis 26,0xc701

# qhasm:   x06 = 65536 * 0xcc39
# asm 1: lis >x06=int32#25,0xcc39
# asm 2: lis >x06=27,0xcc39
lis 27,0xcc39

# qhasm:   x07 = 65536 * 0x50ac
# asm 1: lis >x07=int32#26,0x50ac
# asm 2: lis >x07=28,0x50ac
lis 28,0x50ac

# qhasm:   x00 |= 0x2a61
# asm 1: ori >x00=int32#19,<x00=int32#19,0x2a61
# asm 2: ori >x00=21,<x00=21,0x2a61
ori 21,21,0x2a61

# qhasm:   x01 |= 0x94d4
# asm 1: ori >x01=int32#20,<x01=int32#20,0x94d4
# asm 2: ori >x01=22,<x01=22,0x94d4
ori 22,22,0x94d4

# qhasm:   x02 |= 0x8b8b
# asm 1: ori >x02=int32#21,<x02=int32#21,0x8b8b
# asm 2: ori >x02=23,<x02=23,0x8b8b
ori 23,23,0x8b8b

# qhasm:   x03 |= 0xd83e
# asm 1: ori >x03=int32#22,<x03=int32#22,0xd83e
# asm 2: ori >x03=24,<x03=24,0xd83e
ori 24,24,0xd83e

# qhasm:   x04 |= 0x2313
# asm 1: ori >x04=int32#23,<x04=int32#23,0x2313
# asm 2: ori >x04=25,<x04=25,0x2313
ori 25,25,0x2313

# qhasm:   x05 |= 0xcf8c
# asm 1: ori >x05=int32#24,<x05=int32#24,0xcf8c
# asm 2: ori >x05=26,<x05=26,0xcf8c
ori 26,26,0xcf8c

# qhasm:   x06 |= 0x968e
# asm 1: ori >x06=int32#25,<x06=int32#25,0x968e
# asm 2: ori >x06=27,<x06=27,0x968e
ori 27,27,0x968e

# qhasm:   x07 |= 0x5695
# asm 1: ori >x07=int32#26,<x07=int32#26,0x5695
# asm 2: ori >x07=28,<x07=28,0x5695
ori 28,28,0x5695

# qhasm:   finalization = 0
# asm 1: li >finalization=int32#27,0
# asm 2: li >finalization=29,0
li 29,0

# qhasm: checkinlen:
.label.checkinlen:

# qhasm:                   <? (uint32) inlenlow - 32
# asm 1: cmplwi <inlenlow=int32#4,32
# asm 2: cmplwi <inlenlow=6,32
cmplwi 6,32

# qhasm: goto mainloop if !<
bge .label.mainloop

# qhasm:                      =? (uint32) inlenhigh - 0
# asm 1: cmplwi <inlenhigh=int32#3,0
# asm 2: cmplwi <inlenhigh=5,0
cmplwi 5,0

# qhasm: goto inlenbelow32 if =
beq .label.inlenbelow32

# qhasm: mainloop:
.label.mainloop:

# qhasm:   carry? inlenlow -= 32
# asm 1: addic. >inlenlow=int32#4,<inlenlow=int32#4,-32
# asm 2: addic. >inlenlow=6,<inlenlow=6,-32
addic. 6,6,-32

# qhasm:   inlenhigh = inlenhigh - 1 + carry
# asm 1: addme >inlenhigh=int32#3,<inlenhigh=int32#3
# asm 2: addme >inlenhigh=5,<inlenhigh=5
addme 5,5

# qhasm:   r = 16
# asm 1: li >r=int32#28,16
# asm 2: li >r=30,16
li 30,16

# qhasm:   finalization_stack = finalization
# asm 1: stw <finalization=int32#27,>finalization_stack=stack32#29
# asm 2: stw <finalization=29,>finalization_stack=112(1)
stw 29,112(1)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: stw <inlenlow=int32#4,>inlenlow_stack=stack32#30
# asm 2: stw <inlenlow=6,>inlenlow_stack=116(1)
stw 6,116(1)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: stw <inlenhigh=int32#3,>inlenhigh_stack=stack32#31
# asm 2: stw <inlenhigh=5,>inlenhigh_stack=120(1)
stw 5,120(1)

# qhasm:   y00 = *(swapendian uint32 *) in
# asm 1: lwbrx >y00=int32#3,0,<in=int32#2
# asm 2: lwbrx >y00=5,0,<in=4
lwbrx 5,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y01 = *(swapendian uint32 *) in
# asm 1: lwbrx >y01=int32#4,0,<in=int32#2
# asm 2: lwbrx >y01=6,0,<in=4
lwbrx 6,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y02 = *(swapendian uint32 *) in
# asm 1: lwbrx >y02=int32#27,0,<in=int32#2
# asm 2: lwbrx >y02=29,0,<in=4
lwbrx 29,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y03 = *(swapendian uint32 *) in
# asm 1: lwbrx >y03=int32#29,0,<in=int32#2
# asm 2: lwbrx >y03=31,0,<in=4
lwbrx 31,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   x00 ^= y00
# asm 1: xor >x00=int32#19,<y00=int32#3,<x00=int32#19
# asm 2: xor >x00=21,<y00=5,<x00=21
xor 21,5,21

# qhasm:   x01 ^= y01
# asm 1: xor >x01=int32#20,<y01=int32#4,<x01=int32#20
# asm 2: xor >x01=22,<y01=6,<x01=22
xor 22,6,22

# qhasm:   x02 ^= y02
# asm 1: xor >x02=int32#21,<y02=int32#27,<x02=int32#21
# asm 2: xor >x02=23,<y02=29,<x02=23
xor 23,29,23

# qhasm:   x03 ^= y03
# asm 1: xor >x03=int32#22,<y03=int32#29,<x03=int32#22
# asm 2: xor >x03=24,<y03=31,<x03=24
xor 24,31,24

# qhasm:   y04 = *(swapendian uint32 *) in
# asm 1: lwbrx >y04=int32#3,0,<in=int32#2
# asm 2: lwbrx >y04=5,0,<in=4
lwbrx 5,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y05 = *(swapendian uint32 *) in
# asm 1: lwbrx >y05=int32#4,0,<in=int32#2
# asm 2: lwbrx >y05=6,0,<in=4
lwbrx 6,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   x04 ^= y04
# asm 1: xor >x04=int32#23,<y04=int32#3,<x04=int32#23
# asm 2: xor >x04=25,<y04=5,<x04=25
xor 25,5,25

# qhasm:   x05 ^= y05
# asm 1: xor >x05=int32#24,<y05=int32#4,<x05=int32#24
# asm 2: xor >x05=26,<y05=6,<x05=26
xor 26,6,26

# qhasm:   y06 = *(swapendian uint32 *) in
# asm 1: lwbrx >y06=int32#3,0,<in=int32#2
# asm 2: lwbrx >y06=5,0,<in=4
lwbrx 5,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y07 = *(swapendian uint32 *) in
# asm 1: lwbrx >y07=int32#4,0,<in=int32#2
# asm 2: lwbrx >y07=6,0,<in=4
lwbrx 6,0,4

# qhasm:   in += 4
# asm 1: addi >in=int32#2,<in=int32#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   x06 ^= y06
# asm 1: xor >x06=int32#25,<y06=int32#3,<x06=int32#25
# asm 2: xor >x06=27,<y06=5,<x06=27
xor 27,5,27

# qhasm:   x07 ^= y07
# asm 1: xor >x07=int32#26,<y07=int32#4,<x07=int32#26
# asm 2: xor >x07=28,<y07=6,<x07=28
xor 28,6,28

# qhasm:   in_stack = in
# asm 1: stw <in=int32#2,>in_stack=stack32#32
# asm 2: stw <in=4,>in_stack=124(1)
stw 4,124(1)

# qhasm: morerounds:
.label.morerounds:

# qhasm: r_stack = r
# asm 1: stw <r=int32#28,>r_stack=stack32#33
# asm 2: stw <r=30,>r_stack=128(1)
stw 30,128(1)

# qhasm:   x10 += x00
# asm 1: add >x10=int32#2,<x10=int32#7,<x00=int32#19
# asm 2: add >x10=4,<x10=9,<x00=21
add 4,9,21

# qhasm:   x12 += x02
# asm 1: add >x12=int32#3,<x12=int32#13,<x02=int32#21
# asm 2: add >x12=5,<x12=15,<x02=23
add 5,15,23

# qhasm:   x18 += x08
# asm 1: add >x18=int32#4,<x18=int32#15,<x08=int32#1
# asm 2: add >x18=6,<x18=17,<x08=3
add 6,17,3

# qhasm:   x1a += x0a
# asm 1: add >x1a=int32#7,<x1a=int32#17,<x0a=int32#6
# asm 2: add >x1a=9,<x1a=19,<x0a=8
add 9,19,8

# qhasm:   x00 <<<= 7
# asm 1: rlwinm >x00=int32#13,<x00=int32#19,7,0xffffffff
# asm 2: rlwinm >x00=15,<x00=21,7,0xffffffff
rlwinm 15,21,7,0xffffffff

# qhasm:   x02 <<<= 7
# asm 1: rlwinm >x02=int32#15,<x02=int32#21,7,0xffffffff
# asm 2: rlwinm >x02=17,<x02=23,7,0xffffffff
rlwinm 17,23,7,0xffffffff

# qhasm:   x08 <<<= 7
# asm 1: rlwinm >x08=int32#1,<x08=int32#1,7,0xffffffff
# asm 2: rlwinm >x08=3,<x08=3,7,0xffffffff
rlwinm 3,3,7,0xffffffff

# qhasm:   x0a <<<= 7
# asm 1: rlwinm >x0a=int32#6,<x0a=int32#6,7,0xffffffff
# asm 2: rlwinm >x0a=8,<x0a=8,7,0xffffffff
rlwinm 8,8,7,0xffffffff

# qhasm:   x00 ^= x18
# asm 1: xor >x00=int32#13,<x18=int32#4,<x00=int32#13
# asm 2: xor >x00=15,<x18=6,<x00=15
xor 15,6,15

# qhasm:   x02 ^= x1a
# asm 1: xor >x02=int32#15,<x1a=int32#7,<x02=int32#15
# asm 2: xor >x02=17,<x1a=9,<x02=17
xor 17,9,17

# qhasm:   x08 ^= x10
# asm 1: xor >x08=int32#1,<x10=int32#2,<x08=int32#1
# asm 2: xor >x08=3,<x10=4,<x08=3
xor 3,4,3

# qhasm:   x0a ^= x12
# asm 1: xor >x0a=int32#6,<x12=int32#3,<x0a=int32#6
# asm 2: xor >x0a=8,<x12=5,<x0a=8
xor 8,5,8

# qhasm:           x02_stack = x02
# asm 1: stw <x02=int32#15,>x02_stack=stack32#34
# asm 2: stw <x02=17,>x02_stack=132(1)
stw 17,132(1)

# qhasm:   x1a += x00
# asm 1: add >x1a=int32#7,<x1a=int32#7,<x00=int32#13
# asm 2: add >x1a=9,<x1a=9,<x00=15
add 9,9,15

# qhasm:           x0a_stack = x0a
# asm 1: stw <x0a=int32#6,>x0a_stack=stack32#35
# asm 2: stw <x0a=8,>x0a_stack=136(1)
stw 8,136(1)

# qhasm:   x18 += x02
# asm 1: add >x18=int32#4,<x18=int32#4,<x02=int32#15
# asm 2: add >x18=6,<x18=6,<x02=17
add 6,6,17

# qhasm:           x14 = x14_stack
# asm 1: lwz >x14=int32#15,<x14_stack=stack32#21
# asm 2: lwz >x14=17,<x14_stack=80(1)
lwz 17,80(1)

# qhasm:   x12 += x08
# asm 1: add >x12=int32#3,<x12=int32#3,<x08=int32#1
# asm 2: add >x12=5,<x12=5,<x08=3
add 5,5,3

# qhasm:           x16 = x16_stack
# asm 1: lwz >x16=int32#17,<x16_stack=stack32#23
# asm 2: lwz >x16=19,<x16_stack=88(1)
lwz 19,88(1)

# qhasm:   x10 += x0a
# asm 1: add >x10=int32#2,<x10=int32#2,<x0a=int32#6
# asm 2: add >x10=4,<x10=4,<x0a=8
add 4,4,8

# qhasm:           x1c = x1c_stack
# asm 1: lwz >x1c=int32#6,<x1c_stack=stack32#25
# asm 2: lwz >x1c=8,<x1c_stack=96(1)
lwz 8,96(1)

# qhasm:   x14 += x04
# asm 1: add >x14=int32#15,<x14=int32#15,<x04=int32#23
# asm 2: add >x14=17,<x14=17,<x04=25
add 17,17,25

# qhasm:           x1e = x1e_stack
# asm 1: lwz >x1e=int32#19,<x1e_stack=stack32#27
# asm 2: lwz >x1e=21,<x1e_stack=104(1)
lwz 21,104(1)

# qhasm:   x16 += x06
# asm 1: add >x16=int32#17,<x16=int32#17,<x06=int32#25
# asm 2: add >x16=19,<x16=19,<x06=27
add 19,19,27

# qhasm:   x1c += x0c
# asm 1: add >x1c=int32#6,<x1c=int32#6,<x0c=int32#8
# asm 2: add >x1c=8,<x1c=8,<x0c=10
add 8,8,10

# qhasm:   x1e += x0e
# asm 1: add >x1e=int32#19,<x1e=int32#19,<x0e=int32#10
# asm 2: add >x1e=21,<x1e=21,<x0e=12
add 21,21,12

# qhasm:   x04 <<<= 7
# asm 1: rlwinm >x04=int32#21,<x04=int32#23,7,0xffffffff
# asm 2: rlwinm >x04=23,<x04=25,7,0xffffffff
rlwinm 23,25,7,0xffffffff

# qhasm:   x06 <<<= 7
# asm 1: rlwinm >x06=int32#23,<x06=int32#25,7,0xffffffff
# asm 2: rlwinm >x06=25,<x06=27,7,0xffffffff
rlwinm 25,27,7,0xffffffff

# qhasm:   x0c <<<= 7
# asm 1: rlwinm >x0c=int32#8,<x0c=int32#8,7,0xffffffff
# asm 2: rlwinm >x0c=10,<x0c=10,7,0xffffffff
rlwinm 10,10,7,0xffffffff

# qhasm:   x0e <<<= 7
# asm 1: rlwinm >x0e=int32#10,<x0e=int32#10,7,0xffffffff
# asm 2: rlwinm >x0e=12,<x0e=12,7,0xffffffff
rlwinm 12,12,7,0xffffffff

# qhasm:   x04 ^= x1c
# asm 1: xor >x04=int32#21,<x1c=int32#6,<x04=int32#21
# asm 2: xor >x04=23,<x1c=8,<x04=23
xor 23,8,23

# qhasm:   x06 ^= x1e
# asm 1: xor >x06=int32#23,<x1e=int32#19,<x06=int32#23
# asm 2: xor >x06=25,<x1e=21,<x06=25
xor 25,21,25

# qhasm:   x0c ^= x14
# asm 1: xor >x0c=int32#8,<x14=int32#15,<x0c=int32#8
# asm 2: xor >x0c=10,<x14=17,<x0c=10
xor 10,17,10

# qhasm:   x0e ^= x16
# asm 1: xor >x0e=int32#10,<x16=int32#17,<x0e=int32#10
# asm 2: xor >x0e=12,<x16=19,<x0e=12
xor 12,19,12

# qhasm:           x0b = x0b_stack
# asm 1: lwz >x0b=int32#25,<x0b_stack=stack32#20
# asm 2: lwz >x0b=27,<x0b_stack=76(1)
lwz 27,76(1)

# qhasm:   x1e += x04
# asm 1: add >x1e=int32#19,<x1e=int32#19,<x04=int32#21
# asm 2: add >x1e=21,<x1e=21,<x04=23
add 21,21,23

# qhasm:   x1c += x06
# asm 1: add >x1c=int32#6,<x1c=int32#6,<x06=int32#23
# asm 2: add >x1c=8,<x1c=8,<x06=25
add 8,8,25

# qhasm:   x16 += x0c
# asm 1: add >x16=int32#17,<x16=int32#17,<x0c=int32#8
# asm 2: add >x16=19,<x16=19,<x0c=10
add 19,19,10

# qhasm:   x14 += x0e
# asm 1: add >x14=int32#15,<x14=int32#15,<x0e=int32#10
# asm 2: add >x14=17,<x14=17,<x0e=12
add 17,17,12

# qhasm:           x1e_stack = x1e
# asm 1: stw <x1e=int32#19,>x1e_stack=stack32#20
# asm 2: stw <x1e=21,>x1e_stack=76(1)
stw 21,76(1)

# qhasm:   x11 += x01
# asm 1: add >x11=int32#12,<x11=int32#12,<x01=int32#20
# asm 2: add >x11=14,<x11=14,<x01=22
add 14,14,22

# qhasm:           x1c_stack = x1c
# asm 1: stw <x1c=int32#6,>x1c_stack=stack32#21
# asm 2: stw <x1c=8,>x1c_stack=80(1)
stw 8,80(1)

# qhasm:   x13 += x03
# asm 1: add >x13=int32#6,<x13=int32#14,<x03=int32#22
# asm 2: add >x13=8,<x13=16,<x03=24
add 8,16,24

# qhasm:           x16_stack = x16
# asm 1: stw <x16=int32#17,>x16_stack=stack32#23
# asm 2: stw <x16=19,>x16_stack=88(1)
stw 19,88(1)

# qhasm:   x19 += x09
# asm 1: add >x19=int32#14,<x19=int32#16,<x09=int32#5
# asm 2: add >x19=16,<x19=18,<x09=7
add 16,18,7

# qhasm:           x14_stack = x14
# asm 1: stw <x14=int32#15,>x14_stack=stack32#25
# asm 2: stw <x14=17,>x14_stack=96(1)
stw 17,96(1)

# qhasm:   x1b += x0b
# asm 1: add >x1b=int32#15,<x1b=int32#18,<x0b=int32#25
# asm 2: add >x1b=17,<x1b=20,<x0b=27
add 17,20,27

# qhasm:   x01 <<<= 7
# asm 1: rlwinm >x01=int32#16,<x01=int32#20,7,0xffffffff
# asm 2: rlwinm >x01=18,<x01=22,7,0xffffffff
rlwinm 18,22,7,0xffffffff

# qhasm:   x03 <<<= 7
# asm 1: rlwinm >x03=int32#17,<x03=int32#22,7,0xffffffff
# asm 2: rlwinm >x03=19,<x03=24,7,0xffffffff
rlwinm 19,24,7,0xffffffff

# qhasm:   x09 <<<= 7
# asm 1: rlwinm >x09=int32#5,<x09=int32#5,7,0xffffffff
# asm 2: rlwinm >x09=7,<x09=7,7,0xffffffff
rlwinm 7,7,7,0xffffffff

# qhasm:   x0b <<<= 7
# asm 1: rlwinm >x0b=int32#18,<x0b=int32#25,7,0xffffffff
# asm 2: rlwinm >x0b=20,<x0b=27,7,0xffffffff
rlwinm 20,27,7,0xffffffff

# qhasm:   x01 ^= x19
# asm 1: xor >x01=int32#16,<x19=int32#14,<x01=int32#16
# asm 2: xor >x01=18,<x19=16,<x01=18
xor 18,16,18

# qhasm:   x03 ^= x1b
# asm 1: xor >x03=int32#17,<x1b=int32#15,<x03=int32#17
# asm 2: xor >x03=19,<x1b=17,<x03=19
xor 19,17,19

# qhasm:   x09 ^= x11
# asm 1: xor >x09=int32#5,<x11=int32#12,<x09=int32#5
# asm 2: xor >x09=7,<x11=14,<x09=7
xor 7,14,7

# qhasm:   x0b ^= x13
# asm 1: xor >x0b=int32#18,<x13=int32#6,<x0b=int32#18
# asm 2: xor >x0b=20,<x13=8,<x0b=20
xor 20,8,20

# qhasm:           x15 = x15_stack
# asm 1: lwz >x15=int32#19,<x15_stack=stack32#22
# asm 2: lwz >x15=21,<x15_stack=84(1)
lwz 21,84(1)

# qhasm:   x1b += x01
# asm 1: add >x1b=int32#15,<x1b=int32#15,<x01=int32#16
# asm 2: add >x1b=17,<x1b=17,<x01=18
add 17,17,18

# qhasm:           x17 = x17_stack
# asm 1: lwz >x17=int32#20,<x17_stack=stack32#24
# asm 2: lwz >x17=22,<x17_stack=92(1)
lwz 22,92(1)

# qhasm:   x19 += x03
# asm 1: add >x19=int32#14,<x19=int32#14,<x03=int32#17
# asm 2: add >x19=16,<x19=16,<x03=19
add 16,16,19

# qhasm:           x1d = x1d_stack
# asm 1: lwz >x1d=int32#22,<x1d_stack=stack32#26
# asm 2: lwz >x1d=24,<x1d_stack=100(1)
lwz 24,100(1)

# qhasm:   x13 += x09
# asm 1: add >x13=int32#6,<x13=int32#6,<x09=int32#5
# asm 2: add >x13=8,<x13=8,<x09=7
add 8,8,7

# qhasm:           x1f = x1f_stack
# asm 1: lwz >x1f=int32#25,<x1f_stack=stack32#28
# asm 2: lwz >x1f=27,<x1f_stack=108(1)
lwz 27,108(1)

# qhasm:   x11 += x0b
# asm 1: add >x11=int32#12,<x11=int32#12,<x0b=int32#18
# asm 2: add >x11=14,<x11=14,<x0b=20
add 14,14,20

# qhasm:           x0b_stack = x0b
# asm 1: stw <x0b=int32#18,>x0b_stack=stack32#22
# asm 2: stw <x0b=20,>x0b_stack=84(1)
stw 20,84(1)

# qhasm:   x15 += x05
# asm 1: add >x15=int32#18,<x15=int32#19,<x05=int32#24
# asm 2: add >x15=20,<x15=21,<x05=26
add 20,21,26

# qhasm:   x17 += x07
# asm 1: add >x17=int32#19,<x17=int32#20,<x07=int32#26
# asm 2: add >x17=21,<x17=22,<x07=28
add 21,22,28

# qhasm:   x1d += x0d
# asm 1: add >x1d=int32#20,<x1d=int32#22,<x0d=int32#9
# asm 2: add >x1d=22,<x1d=24,<x0d=11
add 22,24,11

# qhasm:   x1f += x0f
# asm 1: add >x1f=int32#22,<x1f=int32#25,<x0f=int32#11
# asm 2: add >x1f=24,<x1f=27,<x0f=13
add 24,27,13

# qhasm:   x05 <<<= 7
# asm 1: rlwinm >x05=int32#24,<x05=int32#24,7,0xffffffff
# asm 2: rlwinm >x05=26,<x05=26,7,0xffffffff
rlwinm 26,26,7,0xffffffff

# qhasm:   x07 <<<= 7
# asm 1: rlwinm >x07=int32#25,<x07=int32#26,7,0xffffffff
# asm 2: rlwinm >x07=27,<x07=28,7,0xffffffff
rlwinm 27,28,7,0xffffffff

# qhasm:   x0d <<<= 7
# asm 1: rlwinm >x0d=int32#9,<x0d=int32#9,7,0xffffffff
# asm 2: rlwinm >x0d=11,<x0d=11,7,0xffffffff
rlwinm 11,11,7,0xffffffff

# qhasm:   x0f <<<= 7
# asm 1: rlwinm >x0f=int32#11,<x0f=int32#11,7,0xffffffff
# asm 2: rlwinm >x0f=13,<x0f=13,7,0xffffffff
rlwinm 13,13,7,0xffffffff

# qhasm:   x05 ^= x1d
# asm 1: xor >x05=int32#24,<x1d=int32#20,<x05=int32#24
# asm 2: xor >x05=26,<x1d=22,<x05=26
xor 26,22,26

# qhasm:   x07 ^= x1f
# asm 1: xor >x07=int32#25,<x1f=int32#22,<x07=int32#25
# asm 2: xor >x07=27,<x1f=24,<x07=27
xor 27,24,27

# qhasm:   x0d ^= x15
# asm 1: xor >x0d=int32#9,<x15=int32#18,<x0d=int32#9
# asm 2: xor >x0d=11,<x15=20,<x0d=11
xor 11,20,11

# qhasm:   x0f ^= x17
# asm 1: xor >x0f=int32#11,<x17=int32#19,<x0f=int32#11
# asm 2: xor >x0f=13,<x17=21,<x0f=13
xor 13,21,13

# qhasm:   x1f += x05
# asm 1: add >x1f=int32#22,<x1f=int32#22,<x05=int32#24
# asm 2: add >x1f=24,<x1f=24,<x05=26
add 24,24,26

# qhasm:   x1d += x07
# asm 1: add >x1d=int32#20,<x1d=int32#20,<x07=int32#25
# asm 2: add >x1d=22,<x1d=22,<x07=27
add 22,22,27

# qhasm:   x17 += x0d
# asm 1: add >x17=int32#19,<x17=int32#19,<x0d=int32#9
# asm 2: add >x17=21,<x17=21,<x0d=11
add 21,21,11

# qhasm:   x15 += x0f
# asm 1: add >x15=int32#18,<x15=int32#18,<x0f=int32#11
# asm 2: add >x15=20,<x15=20,<x0f=13
add 20,20,13

# qhasm:           x1e = x1e_stack
# asm 1: lwz >x1e=int32#26,<x1e_stack=stack32#20
# asm 2: lwz >x1e=28,<x1e_stack=76(1)
lwz 28,76(1)

# qhasm:   x00 <<<= 11
# asm 1: rlwinm >x00=int32#13,<x00=int32#13,11,0xffffffff
# asm 2: rlwinm >x00=15,<x00=15,11,0xffffffff
rlwinm 15,15,11,0xffffffff

# qhasm:           x16 = x16_stack
# asm 1: lwz >x16=int32#27,<x16_stack=stack32#23
# asm 2: lwz >x16=29,<x16_stack=88(1)
lwz 29,88(1)

# qhasm:   x01 <<<= 11
# asm 1: rlwinm >x01=int32#16,<x01=int32#16,11,0xffffffff
# asm 2: rlwinm >x01=18,<x01=18,11,0xffffffff
rlwinm 18,18,11,0xffffffff

# qhasm:           x15_stack = x15
# asm 1: stw <x15=int32#18,>x15_stack=stack32#20
# asm 2: stw <x15=20,>x15_stack=76(1)
stw 20,76(1)

# qhasm:   x08 <<<= 11
# asm 1: rlwinm >x08=int32#1,<x08=int32#1,11,0xffffffff
# asm 2: rlwinm >x08=3,<x08=3,11,0xffffffff
rlwinm 3,3,11,0xffffffff

# qhasm:           x1d_stack = x1d
# asm 1: stw <x1d=int32#20,>x1d_stack=stack32#23
# asm 2: stw <x1d=22,>x1d_stack=88(1)
stw 22,88(1)

# qhasm:   x09 <<<= 11
# asm 1: rlwinm >x09=int32#5,<x09=int32#5,11,0xffffffff
# asm 2: rlwinm >x09=7,<x09=7,11,0xffffffff
rlwinm 7,7,11,0xffffffff

# qhasm:   x00 ^= x1e
# asm 1: xor >x00=int32#13,<x1e=int32#26,<x00=int32#13
# asm 2: xor >x00=15,<x1e=28,<x00=15
xor 15,28,15

# qhasm:   x01 ^= x1f
# asm 1: xor >x01=int32#16,<x1f=int32#22,<x01=int32#16
# asm 2: xor >x01=18,<x1f=24,<x01=18
xor 18,24,18

# qhasm:   x08 ^= x16
# asm 1: xor >x08=int32#1,<x16=int32#27,<x08=int32#1
# asm 2: xor >x08=3,<x16=29,<x08=3
xor 3,29,3

# qhasm:   x09 ^= x17
# asm 1: xor >x09=int32#5,<x17=int32#19,<x09=int32#5
# asm 2: xor >x09=7,<x17=21,<x09=7
xor 7,21,7

# qhasm:   x1f += x00
# asm 1: add >x1f=int32#18,<x1f=int32#22,<x00=int32#13
# asm 2: add >x1f=20,<x1f=24,<x00=15
add 20,24,15

# qhasm:   x1e += x01
# asm 1: add >x1e=int32#20,<x1e=int32#26,<x01=int32#16
# asm 2: add >x1e=22,<x1e=28,<x01=18
add 22,28,18

# qhasm:   x17 += x08
# asm 1: add >x17=int32#19,<x17=int32#19,<x08=int32#1
# asm 2: add >x17=21,<x17=21,<x08=3
add 21,21,3

# qhasm:   x16 += x09
# asm 1: add >x16=int32#22,<x16=int32#27,<x09=int32#5
# asm 2: add >x16=24,<x16=29,<x09=7
add 24,29,7

# qhasm:   x00 <<<= 7
# asm 1: rlwinm >x00=int32#13,<x00=int32#13,7,0xffffffff
# asm 2: rlwinm >x00=15,<x00=15,7,0xffffffff
rlwinm 15,15,7,0xffffffff

# qhasm:           x1f_stack = x1f
# asm 1: stw <x1f=int32#18,>x1f_stack=stack32#24
# asm 2: stw <x1f=20,>x1f_stack=92(1)
stw 20,92(1)

# qhasm:   x01 <<<= 7
# asm 1: rlwinm >x01=int32#16,<x01=int32#16,7,0xffffffff
# asm 2: rlwinm >x01=18,<x01=18,7,0xffffffff
rlwinm 18,18,7,0xffffffff

# qhasm:           x1e_stack = x1e
# asm 1: stw <x1e=int32#20,>x1e_stack=stack32#27
# asm 2: stw <x1e=22,>x1e_stack=104(1)
stw 22,104(1)

# qhasm:   x08 <<<= 7
# asm 1: rlwinm >x08=int32#1,<x08=int32#1,7,0xffffffff
# asm 2: rlwinm >x08=3,<x08=3,7,0xffffffff
rlwinm 3,3,7,0xffffffff

# qhasm:           x17_stack = x17
# asm 1: stw <x17=int32#19,>x17_stack=stack32#28
# asm 2: stw <x17=21,>x17_stack=108(1)
stw 21,108(1)

# qhasm:   x09 <<<= 7
# asm 1: rlwinm >x09=int32#5,<x09=int32#5,7,0xffffffff
# asm 2: rlwinm >x09=7,<x09=7,7,0xffffffff
rlwinm 7,7,7,0xffffffff

# qhasm:           x16_stack = x16
# asm 1: stw <x16=int32#22,>x16_stack=stack32#36
# asm 2: stw <x16=24,>x16_stack=140(1)
stw 24,140(1)

# qhasm:   x00 ^= x17
# asm 1: xor >x00=int32#13,<x17=int32#19,<x00=int32#13
# asm 2: xor >x00=15,<x17=21,<x00=15
xor 15,21,15

# qhasm:           x02 = x02_stack
# asm 1: lwz >x02=int32#19,<x02_stack=stack32#34
# asm 2: lwz >x02=21,<x02_stack=132(1)
lwz 21,132(1)

# qhasm:   x01 ^= x16
# asm 1: xor >x01=int32#22,<x16=int32#22,<x01=int32#16
# asm 2: xor >x01=24,<x16=24,<x01=18
xor 24,24,18

# qhasm:           x0a = x0a_stack
# asm 1: lwz >x0a=int32#16,<x0a_stack=stack32#35
# asm 2: lwz >x0a=18,<x0a_stack=136(1)
lwz 18,136(1)

# qhasm:   x08 ^= x1f
# asm 1: xor >x08=int32#1,<x1f=int32#18,<x08=int32#1
# asm 2: xor >x08=3,<x1f=20,<x08=3
xor 3,20,3

# qhasm:           x0b = x0b_stack
# asm 1: lwz >x0b=int32#18,<x0b_stack=stack32#22
# asm 2: lwz >x0b=20,<x0b_stack=84(1)
lwz 20,84(1)

# qhasm:   x09 ^= x1e
# asm 1: xor >x09=int32#5,<x1e=int32#20,<x09=int32#5
# asm 2: xor >x09=7,<x1e=22,<x09=7
xor 7,22,7

# qhasm:           x1c = x1c_stack
# asm 1: lwz >x1c=int32#20,<x1c_stack=stack32#21
# asm 2: lwz >x1c=22,<x1c_stack=80(1)
lwz 22,80(1)

# qhasm:   x02 <<<= 11
# asm 1: rlwinm >x02=int32#19,<x02=int32#19,11,0xffffffff
# asm 2: rlwinm >x02=21,<x02=21,11,0xffffffff
rlwinm 21,21,11,0xffffffff

# qhasm:           x1d = x1d_stack
# asm 1: lwz >x1d=int32#26,<x1d_stack=stack32#23
# asm 2: lwz >x1d=28,<x1d_stack=88(1)
lwz 28,88(1)

# qhasm:   x03 <<<= 11
# asm 1: rlwinm >x03=int32#17,<x03=int32#17,11,0xffffffff
# asm 2: rlwinm >x03=19,<x03=19,11,0xffffffff
rlwinm 19,19,11,0xffffffff

# qhasm:           x14 = x14_stack
# asm 1: lwz >x14=int32#27,<x14_stack=stack32#25
# asm 2: lwz >x14=29,<x14_stack=96(1)
lwz 29,96(1)

# qhasm:   x0a <<<= 11
# asm 1: rlwinm >x0a=int32#16,<x0a=int32#16,11,0xffffffff
# asm 2: rlwinm >x0a=18,<x0a=18,11,0xffffffff
rlwinm 18,18,11,0xffffffff

# qhasm:           x15 = x15_stack
# asm 1: lwz >x15=int32#28,<x15_stack=stack32#20
# asm 2: lwz >x15=30,<x15_stack=76(1)
lwz 30,76(1)

# qhasm:   x0b <<<= 11
# asm 1: rlwinm >x0b=int32#18,<x0b=int32#18,11,0xffffffff
# asm 2: rlwinm >x0b=20,<x0b=20,11,0xffffffff
rlwinm 20,20,11,0xffffffff

# qhasm:   x02 ^= x1c
# asm 1: xor >x02=int32#19,<x1c=int32#20,<x02=int32#19
# asm 2: xor >x02=21,<x1c=22,<x02=21
xor 21,22,21

# qhasm:   x03 ^= x1d
# asm 1: xor >x03=int32#17,<x1d=int32#26,<x03=int32#17
# asm 2: xor >x03=19,<x1d=28,<x03=19
xor 19,28,19

# qhasm:   x0a ^= x14
# asm 1: xor >x0a=int32#16,<x14=int32#27,<x0a=int32#16
# asm 2: xor >x0a=18,<x14=29,<x0a=18
xor 18,29,18

# qhasm:   x0b ^= x15
# asm 1: xor >x0b=int32#18,<x15=int32#28,<x0b=int32#18
# asm 2: xor >x0b=20,<x15=30,<x0b=20
xor 20,30,20

# qhasm:   x1d += x02
# asm 1: add >x1d=int32#26,<x1d=int32#26,<x02=int32#19
# asm 2: add >x1d=28,<x1d=28,<x02=21
add 28,28,21

# qhasm:   x1c += x03
# asm 1: add >x1c=int32#20,<x1c=int32#20,<x03=int32#17
# asm 2: add >x1c=22,<x1c=22,<x03=19
add 22,22,19

# qhasm:   x15 += x0a
# asm 1: add >x15=int32#28,<x15=int32#28,<x0a=int32#16
# asm 2: add >x15=30,<x15=30,<x0a=18
add 30,30,18

# qhasm:   x14 += x0b
# asm 1: add >x14=int32#27,<x14=int32#27,<x0b=int32#18
# asm 2: add >x14=29,<x14=29,<x0b=20
add 29,29,20

# qhasm:           x1d_stack = x1d
# asm 1: stw <x1d=int32#26,>x1d_stack=stack32#20
# asm 2: stw <x1d=28,>x1d_stack=76(1)
stw 28,76(1)

# qhasm:   x02 <<<= 7
# asm 1: rlwinm >x02=int32#19,<x02=int32#19,7,0xffffffff
# asm 2: rlwinm >x02=21,<x02=21,7,0xffffffff
rlwinm 21,21,7,0xffffffff

# qhasm:           x1c_stack = x1c
# asm 1: stw <x1c=int32#20,>x1c_stack=stack32#21
# asm 2: stw <x1c=22,>x1c_stack=80(1)
stw 22,80(1)

# qhasm:   x03 <<<= 7
# asm 1: rlwinm >x03=int32#17,<x03=int32#17,7,0xffffffff
# asm 2: rlwinm >x03=19,<x03=19,7,0xffffffff
rlwinm 19,19,7,0xffffffff

# qhasm:           x15_stack = x15
# asm 1: stw <x15=int32#28,>x15_stack=stack32#22
# asm 2: stw <x15=30,>x15_stack=84(1)
stw 30,84(1)

# qhasm:   x0a <<<= 7
# asm 1: rlwinm >x0a=int32#16,<x0a=int32#16,7,0xffffffff
# asm 2: rlwinm >x0a=18,<x0a=18,7,0xffffffff
rlwinm 18,18,7,0xffffffff

# qhasm:           x14_stack = x14
# asm 1: stw <x14=int32#27,>x14_stack=stack32#23
# asm 2: stw <x14=29,>x14_stack=88(1)
stw 29,88(1)

# qhasm:   x0b <<<= 7
# asm 1: rlwinm >x0b=int32#18,<x0b=int32#18,7,0xffffffff
# asm 2: rlwinm >x0b=20,<x0b=20,7,0xffffffff
rlwinm 20,20,7,0xffffffff

# qhasm:   x02 ^= x15
# asm 1: xor >x02=int32#19,<x15=int32#28,<x02=int32#19
# asm 2: xor >x02=21,<x15=30,<x02=21
xor 21,30,21

# qhasm:   x03 ^= x14
# asm 1: xor >x03=int32#27,<x14=int32#27,<x03=int32#17
# asm 2: xor >x03=29,<x14=29,<x03=19
xor 29,29,19

# qhasm:   x0a ^= x1d
# asm 1: xor >x0a=int32#16,<x1d=int32#26,<x0a=int32#16
# asm 2: xor >x0a=18,<x1d=28,<x0a=18
xor 18,28,18

# qhasm:   x0b ^= x1c
# asm 1: xor >x0b=int32#17,<x1c=int32#20,<x0b=int32#18
# asm 2: xor >x0b=19,<x1c=22,<x0b=20
xor 19,22,20

# qhasm:           x02_stack = x02
# asm 1: stw <x02=int32#19,>x02_stack=stack32#34
# asm 2: stw <x02=21,>x02_stack=132(1)
stw 21,132(1)

# qhasm:   x04 <<<= 11
# asm 1: rlwinm >x04=int32#18,<x04=int32#21,11,0xffffffff
# asm 2: rlwinm >x04=20,<x04=23,11,0xffffffff
rlwinm 20,23,11,0xffffffff

# qhasm:           x0a_stack = x0a
# asm 1: stw <x0a=int32#16,>x0a_stack=stack32#35
# asm 2: stw <x0a=18,>x0a_stack=136(1)
stw 18,136(1)

# qhasm:   x05 <<<= 11
# asm 1: rlwinm >x05=int32#16,<x05=int32#24,11,0xffffffff
# asm 2: rlwinm >x05=18,<x05=26,11,0xffffffff
rlwinm 18,26,11,0xffffffff

# qhasm:           x0b_stack = x0b
# asm 1: stw <x0b=int32#17,>x0b_stack=stack32#37
# asm 2: stw <x0b=19,>x0b_stack=144(1)
stw 19,144(1)

# qhasm:   x0c <<<= 11
# asm 1: rlwinm >x0c=int32#8,<x0c=int32#8,11,0xffffffff
# asm 2: rlwinm >x0c=10,<x0c=10,11,0xffffffff
rlwinm 10,10,11,0xffffffff

# qhasm:   x0d <<<= 11
# asm 1: rlwinm >x0d=int32#9,<x0d=int32#9,11,0xffffffff
# asm 2: rlwinm >x0d=11,<x0d=11,11,0xffffffff
rlwinm 11,11,11,0xffffffff

# qhasm:   x04 ^= x1a
# asm 1: xor >x04=int32#17,<x1a=int32#7,<x04=int32#18
# asm 2: xor >x04=19,<x1a=9,<x04=20
xor 19,9,20

# qhasm:   x05 ^= x1b
# asm 1: xor >x05=int32#16,<x1b=int32#15,<x05=int32#16
# asm 2: xor >x05=18,<x1b=17,<x05=18
xor 18,17,18

# qhasm:   x0c ^= x12
# asm 1: xor >x0c=int32#8,<x12=int32#3,<x0c=int32#8
# asm 2: xor >x0c=10,<x12=5,<x0c=10
xor 10,5,10

# qhasm:   x0d ^= x13
# asm 1: xor >x0d=int32#9,<x13=int32#6,<x0d=int32#9
# asm 2: xor >x0d=11,<x13=8,<x0d=11
xor 11,8,11

# qhasm:   x1b += x04
# asm 1: add >x1b=int32#18,<x1b=int32#15,<x04=int32#17
# asm 2: add >x1b=20,<x1b=17,<x04=19
add 20,17,19

# qhasm:   x1a += x05
# asm 1: add >x1a=int32#21,<x1a=int32#7,<x05=int32#16
# asm 2: add >x1a=23,<x1a=9,<x05=18
add 23,9,18

# qhasm:   x13 += x0c
# asm 1: add >x13=int32#6,<x13=int32#6,<x0c=int32#8
# asm 2: add >x13=8,<x13=8,<x0c=10
add 8,8,10

# qhasm:   x12 += x0d
# asm 1: add >x12=int32#3,<x12=int32#3,<x0d=int32#9
# asm 2: add >x12=5,<x12=5,<x0d=11
add 5,5,11

# qhasm:   x04 <<<= 7
# asm 1: rlwinm >x04=int32#7,<x04=int32#17,7,0xffffffff
# asm 2: rlwinm >x04=9,<x04=19,7,0xffffffff
rlwinm 9,19,7,0xffffffff

# qhasm:   x05 <<<= 7
# asm 1: rlwinm >x05=int32#15,<x05=int32#16,7,0xffffffff
# asm 2: rlwinm >x05=17,<x05=18,7,0xffffffff
rlwinm 17,18,7,0xffffffff

# qhasm:   x0c <<<= 7
# asm 1: rlwinm >x0c=int32#8,<x0c=int32#8,7,0xffffffff
# asm 2: rlwinm >x0c=10,<x0c=10,7,0xffffffff
rlwinm 10,10,7,0xffffffff

# qhasm:   x0d <<<= 7
# asm 1: rlwinm >x0d=int32#9,<x0d=int32#9,7,0xffffffff
# asm 2: rlwinm >x0d=11,<x0d=11,7,0xffffffff
rlwinm 11,11,7,0xffffffff

# qhasm:   x04 ^= x13
# asm 1: xor >x04=int32#17,<x13=int32#6,<x04=int32#7
# asm 2: xor >x04=19,<x13=8,<x04=9
xor 19,8,9

# qhasm:   x05 ^= x12
# asm 1: xor >x05=int32#19,<x12=int32#3,<x05=int32#15
# asm 2: xor >x05=21,<x12=5,<x05=17
xor 21,5,17

# qhasm:   x0c ^= x1b
# asm 1: xor >x0c=int32#8,<x1b=int32#18,<x0c=int32#8
# asm 2: xor >x0c=10,<x1b=20,<x0c=10
xor 10,20,10

# qhasm:   x0d ^= x1a
# asm 1: xor >x0d=int32#9,<x1a=int32#21,<x0d=int32#9
# asm 2: xor >x0d=11,<x1a=23,<x0d=11
xor 11,23,11

# qhasm:   x06 <<<= 11
# asm 1: rlwinm >x06=int32#7,<x06=int32#23,11,0xffffffff
# asm 2: rlwinm >x06=9,<x06=25,11,0xffffffff
rlwinm 9,25,11,0xffffffff

# qhasm:   x07 <<<= 11
# asm 1: rlwinm >x07=int32#15,<x07=int32#25,11,0xffffffff
# asm 2: rlwinm >x07=17,<x07=27,11,0xffffffff
rlwinm 17,27,11,0xffffffff

# qhasm:   x0e <<<= 11
# asm 1: rlwinm >x0e=int32#10,<x0e=int32#10,11,0xffffffff
# asm 2: rlwinm >x0e=12,<x0e=12,11,0xffffffff
rlwinm 12,12,11,0xffffffff

# qhasm:   x0f <<<= 11
# asm 1: rlwinm >x0f=int32#11,<x0f=int32#11,11,0xffffffff
# asm 2: rlwinm >x0f=13,<x0f=13,11,0xffffffff
rlwinm 13,13,11,0xffffffff

# qhasm:   x06 ^= x18
# asm 1: xor >x06=int32#7,<x18=int32#4,<x06=int32#7
# asm 2: xor >x06=9,<x18=6,<x06=9
xor 9,6,9

# qhasm:   x07 ^= x19
# asm 1: xor >x07=int32#15,<x19=int32#14,<x07=int32#15
# asm 2: xor >x07=17,<x19=16,<x07=17
xor 17,16,17

# qhasm:   x0e ^= x10
# asm 1: xor >x0e=int32#10,<x10=int32#2,<x0e=int32#10
# asm 2: xor >x0e=12,<x10=4,<x0e=12
xor 12,4,12

# qhasm:   x0f ^= x11
# asm 1: xor >x0f=int32#11,<x11=int32#12,<x0f=int32#11
# asm 2: xor >x0f=13,<x11=14,<x0f=13
xor 13,14,13

# qhasm:   x19 += x06
# asm 1: add >x19=int32#14,<x19=int32#14,<x06=int32#7
# asm 2: add >x19=16,<x19=16,<x06=9
add 16,16,9

# qhasm:   x18 += x07
# asm 1: add >x18=int32#4,<x18=int32#4,<x07=int32#15
# asm 2: add >x18=6,<x18=6,<x07=17
add 6,6,17

# qhasm:   x11 += x0e
# asm 1: add >x11=int32#12,<x11=int32#12,<x0e=int32#10
# asm 2: add >x11=14,<x11=14,<x0e=12
add 14,14,12

# qhasm:   x10 += x0f
# asm 1: add >x10=int32#2,<x10=int32#2,<x0f=int32#11
# asm 2: add >x10=4,<x10=4,<x0f=13
add 4,4,13

# qhasm:   x06 <<<= 7
# asm 1: rlwinm >x06=int32#7,<x06=int32#7,7,0xffffffff
# asm 2: rlwinm >x06=9,<x06=9,7,0xffffffff
rlwinm 9,9,7,0xffffffff

# qhasm:   x07 <<<= 7
# asm 1: rlwinm >x07=int32#15,<x07=int32#15,7,0xffffffff
# asm 2: rlwinm >x07=17,<x07=17,7,0xffffffff
rlwinm 17,17,7,0xffffffff

# qhasm:   x0e <<<= 7
# asm 1: rlwinm >x0e=int32#10,<x0e=int32#10,7,0xffffffff
# asm 2: rlwinm >x0e=12,<x0e=12,7,0xffffffff
rlwinm 12,12,7,0xffffffff

# qhasm:   x0f <<<= 7
# asm 1: rlwinm >x0f=int32#11,<x0f=int32#11,7,0xffffffff
# asm 2: rlwinm >x0f=13,<x0f=13,7,0xffffffff
rlwinm 13,13,7,0xffffffff

# qhasm:   x06 ^= x11
# asm 1: xor >x06=int32#25,<x11=int32#12,<x06=int32#7
# asm 2: xor >x06=27,<x11=14,<x06=9
xor 27,14,9

# qhasm:           x15 = x15_stack
# asm 1: lwz >x15=int32#20,<x15_stack=stack32#22
# asm 2: lwz >x15=22,<x15_stack=84(1)
lwz 22,84(1)

# qhasm:   x07 ^= x10
# asm 1: xor >x07=int32#26,<x10=int32#2,<x07=int32#15
# asm 2: xor >x07=28,<x10=4,<x07=17
xor 28,4,17

# qhasm:           x14 = x14_stack
# asm 1: lwz >x14=int32#23,<x14_stack=stack32#23
# asm 2: lwz >x14=25,<x14_stack=88(1)
lwz 25,88(1)

# qhasm:   x0e ^= x19
# asm 1: xor >x0e=int32#10,<x19=int32#14,<x0e=int32#10
# asm 2: xor >x0e=12,<x19=16,<x0e=12
xor 12,16,12

# qhasm:           x1d = x1d_stack
# asm 1: lwz >x1d=int32#24,<x1d_stack=stack32#20
# asm 2: lwz >x1d=26,<x1d_stack=76(1)
lwz 26,76(1)

# qhasm:   x0f ^= x18
# asm 1: xor >x0f=int32#11,<x18=int32#4,<x0f=int32#11
# asm 2: xor >x0f=13,<x18=6,<x0f=13
xor 13,6,13

# qhasm:           x1c = x1c_stack
# asm 1: lwz >x1c=int32#28,<x1c_stack=stack32#21
# asm 2: lwz >x1c=30,<x1c_stack=80(1)
lwz 30,80(1)

# qhasm:   x11 += x04
# asm 1: add >x11=int32#12,<x11=int32#12,<x04=int32#17
# asm 2: add >x11=14,<x11=14,<x04=19
add 14,14,19

# qhasm:   x10 += x05
# asm 1: add >x10=int32#7,<x10=int32#2,<x05=int32#19
# asm 2: add >x10=9,<x10=4,<x05=21
add 9,4,21

# qhasm:   x19 += x0c
# asm 1: add >x19=int32#16,<x19=int32#14,<x0c=int32#8
# asm 2: add >x19=18,<x19=16,<x0c=10
add 18,16,10

# qhasm:   x18 += x0d
# asm 1: add >x18=int32#15,<x18=int32#4,<x0d=int32#9
# asm 2: add >x18=17,<x18=6,<x0d=11
add 17,6,11

# qhasm:   x15 += x00
# asm 1: add >x15=int32#2,<x15=int32#20,<x00=int32#13
# asm 2: add >x15=4,<x15=22,<x00=15
add 4,22,15

# qhasm:   x14 += x01
# asm 1: add >x14=int32#4,<x14=int32#23,<x01=int32#22
# asm 2: add >x14=6,<x14=25,<x01=24
add 6,25,24

# qhasm:   x1d += x08
# asm 1: add >x1d=int32#14,<x1d=int32#24,<x08=int32#1
# asm 2: add >x1d=16,<x1d=26,<x08=3
add 16,26,3

# qhasm:   x1c += x09
# asm 1: add >x1c=int32#20,<x1c=int32#28,<x09=int32#5
# asm 2: add >x1c=22,<x1c=30,<x09=7
add 22,30,7

# qhasm:   x04 <<<= 11
# asm 1: rlwinm >x04=int32#17,<x04=int32#17,11,0xffffffff
# asm 2: rlwinm >x04=19,<x04=19,11,0xffffffff
rlwinm 19,19,11,0xffffffff

# qhasm:           x15_stack = x15
# asm 1: stw <x15=int32#2,>x15_stack=stack32#22
# asm 2: stw <x15=4,>x15_stack=84(1)
stw 4,84(1)

# qhasm:   x05 <<<= 11
# asm 1: rlwinm >x05=int32#19,<x05=int32#19,11,0xffffffff
# asm 2: rlwinm >x05=21,<x05=21,11,0xffffffff
rlwinm 21,21,11,0xffffffff

# qhasm:           x14_stack = x14
# asm 1: stw <x14=int32#4,>x14_stack=stack32#21
# asm 2: stw <x14=6,>x14_stack=80(1)
stw 6,80(1)

# qhasm:   x0c <<<= 11
# asm 1: rlwinm >x0c=int32#8,<x0c=int32#8,11,0xffffffff
# asm 2: rlwinm >x0c=10,<x0c=10,11,0xffffffff
rlwinm 10,10,11,0xffffffff

# qhasm:           x1d_stack = x1d
# asm 1: stw <x1d=int32#14,>x1d_stack=stack32#26
# asm 2: stw <x1d=16,>x1d_stack=100(1)
stw 16,100(1)

# qhasm:   x0d <<<= 11
# asm 1: rlwinm >x0d=int32#9,<x0d=int32#9,11,0xffffffff
# asm 2: rlwinm >x0d=11,<x0d=11,11,0xffffffff
rlwinm 11,11,11,0xffffffff

# qhasm:           x1c_stack = x1c
# asm 1: stw <x1c=int32#20,>x1c_stack=stack32#25
# asm 2: stw <x1c=22,>x1c_stack=96(1)
stw 22,96(1)

# qhasm:   x04 ^= x15
# asm 1: xor >x04=int32#23,<x15=int32#2,<x04=int32#17
# asm 2: xor >x04=25,<x15=4,<x04=19
xor 25,4,19

# qhasm:   x05 ^= x14
# asm 1: xor >x05=int32#24,<x14=int32#4,<x05=int32#19
# asm 2: xor >x05=26,<x14=6,<x05=21
xor 26,6,21

# qhasm:   x0c ^= x1d
# asm 1: xor >x0c=int32#8,<x1d=int32#14,<x0c=int32#8
# asm 2: xor >x0c=10,<x1d=16,<x0c=10
xor 10,16,10

# qhasm:   x0d ^= x1c
# asm 1: xor >x0d=int32#9,<x1c=int32#20,<x0d=int32#9
# asm 2: xor >x0d=11,<x1c=22,<x0d=11
xor 11,22,11

# qhasm:   x00 <<<= 11
# asm 1: rlwinm >x00=int32#2,<x00=int32#13,11,0xffffffff
# asm 2: rlwinm >x00=4,<x00=15,11,0xffffffff
rlwinm 4,15,11,0xffffffff

# qhasm:   x01 <<<= 11
# asm 1: rlwinm >x01=int32#4,<x01=int32#22,11,0xffffffff
# asm 2: rlwinm >x01=6,<x01=24,11,0xffffffff
rlwinm 6,24,11,0xffffffff

# qhasm:   x08 <<<= 11
# asm 1: rlwinm >x08=int32#1,<x08=int32#1,11,0xffffffff
# asm 2: rlwinm >x08=3,<x08=3,11,0xffffffff
rlwinm 3,3,11,0xffffffff

# qhasm:   x09 <<<= 11
# asm 1: rlwinm >x09=int32#5,<x09=int32#5,11,0xffffffff
# asm 2: rlwinm >x09=7,<x09=7,11,0xffffffff
rlwinm 7,7,11,0xffffffff

# qhasm:   x00 ^= x11
# asm 1: xor >x00=int32#19,<x11=int32#12,<x00=int32#2
# asm 2: xor >x00=21,<x11=14,<x00=4
xor 21,14,4

# qhasm:   x01 ^= x10
# asm 1: xor >x01=int32#20,<x10=int32#7,<x01=int32#4
# asm 2: xor >x01=22,<x10=9,<x01=6
xor 22,9,6

# qhasm:           x17 = x17_stack
# asm 1: lwz >x17=int32#2,<x17_stack=stack32#28
# asm 2: lwz >x17=4,<x17_stack=108(1)
lwz 4,108(1)

# qhasm:   x08 ^= x19
# asm 1: xor >x08=int32#1,<x19=int32#16,<x08=int32#1
# asm 2: xor >x08=3,<x19=18,<x08=3
xor 3,18,3

# qhasm:           x02 = x02_stack
# asm 1: lwz >x02=int32#4,<x02_stack=stack32#34
# asm 2: lwz >x02=6,<x02_stack=132(1)
lwz 6,132(1)

# qhasm:   x09 ^= x18
# asm 1: xor >x09=int32#5,<x18=int32#15,<x09=int32#5
# asm 2: xor >x09=7,<x18=17,<x09=7
xor 7,17,7

# qhasm:           x16 = x16_stack
# asm 1: lwz >x16=int32#22,<x16_stack=stack32#36
# asm 2: lwz >x16=24,<x16_stack=140(1)
lwz 24,140(1)

# qhasm:   x13 += x06
# asm 1: add >x13=int32#14,<x13=int32#6,<x06=int32#25
# asm 2: add >x13=16,<x13=8,<x06=27
add 16,8,27

# qhasm:           x1f = x1f_stack
# asm 1: lwz >x1f=int32#6,<x1f_stack=stack32#24
# asm 2: lwz >x1f=8,<x1f_stack=92(1)
lwz 8,92(1)

# qhasm:   x12 += x07
# asm 1: add >x12=int32#13,<x12=int32#3,<x07=int32#26
# asm 2: add >x12=15,<x12=5,<x07=28
add 15,5,28

# qhasm:           x0a = x0a_stack
# asm 1: lwz >x0a=int32#3,<x0a_stack=stack32#35
# asm 2: lwz >x0a=5,<x0a_stack=136(1)
lwz 5,136(1)

# qhasm:   x1b += x0e
# asm 1: add >x1b=int32#18,<x1b=int32#18,<x0e=int32#10
# asm 2: add >x1b=20,<x1b=20,<x0e=12
add 20,20,12

# qhasm:           x1e = x1e_stack
# asm 1: lwz >x1e=int32#28,<x1e_stack=stack32#27
# asm 2: lwz >x1e=30,<x1e_stack=104(1)
lwz 30,104(1)

# qhasm:   x1a += x0f
# asm 1: add >x1a=int32#17,<x1a=int32#21,<x0f=int32#11
# asm 2: add >x1a=19,<x1a=23,<x0f=13
add 19,23,13

# qhasm:           x0b = x0b_stack
# asm 1: lwz >x0b=int32#21,<x0b_stack=stack32#37
# asm 2: lwz >x0b=23,<x0b_stack=144(1)
lwz 23,144(1)

# qhasm:   x17 += x02
# asm 1: add >x17=int32#2,<x17=int32#2,<x02=int32#4
# asm 2: add >x17=4,<x17=4,<x02=6
add 4,4,6

# qhasm:   x16 += x03
# asm 1: add >x16=int32#22,<x16=int32#22,<x03=int32#27
# asm 2: add >x16=24,<x16=24,<x03=29
add 24,24,29

# qhasm:   x1f += x0a
# asm 1: add >x1f=int32#6,<x1f=int32#6,<x0a=int32#3
# asm 2: add >x1f=8,<x1f=8,<x0a=5
add 8,8,5

# qhasm:   x1e += x0b
# asm 1: add >x1e=int32#29,<x1e=int32#28,<x0b=int32#21
# asm 2: add >x1e=31,<x1e=30,<x0b=23
add 31,30,23

# qhasm:         r = r_stack
# asm 1: lwz >r=int32#28,<r_stack=stack32#33
# asm 2: lwz >r=30,<r_stack=128(1)
lwz 30,128(1)

# qhasm:   x06 <<<= 11
# asm 1: rlwinm >x06=int32#25,<x06=int32#25,11,0xffffffff
# asm 2: rlwinm >x06=27,<x06=27,11,0xffffffff
rlwinm 27,27,11,0xffffffff

# qhasm:           x17_stack = x17
# asm 1: stw <x17=int32#2,>x17_stack=stack32#24
# asm 2: stw <x17=4,>x17_stack=92(1)
stw 4,92(1)

# qhasm:   x07 <<<= 11
# asm 1: rlwinm >x07=int32#26,<x07=int32#26,11,0xffffffff
# asm 2: rlwinm >x07=28,<x07=28,11,0xffffffff
rlwinm 28,28,11,0xffffffff

# qhasm:           x16_stack = x16
# asm 1: stw <x16=int32#22,>x16_stack=stack32#23
# asm 2: stw <x16=24,>x16_stack=88(1)
stw 24,88(1)

# qhasm:   x0e <<<= 11
# asm 1: rlwinm >x0e=int32#10,<x0e=int32#10,11,0xffffffff
# asm 2: rlwinm >x0e=12,<x0e=12,11,0xffffffff
rlwinm 12,12,11,0xffffffff

# qhasm:           x1f_stack = x1f
# asm 1: stw <x1f=int32#6,>x1f_stack=stack32#28
# asm 2: stw <x1f=8,>x1f_stack=108(1)
stw 8,108(1)

# qhasm:   x0f <<<= 11
# asm 1: rlwinm >x0f=int32#11,<x0f=int32#11,11,0xffffffff
# asm 2: rlwinm >x0f=13,<x0f=13,11,0xffffffff
rlwinm 13,13,11,0xffffffff

# qhasm:           x1e_stack = x1e
# asm 1: stw <x1e=int32#29,>x1e_stack=stack32#27
# asm 2: stw <x1e=31,>x1e_stack=104(1)
stw 31,104(1)

# qhasm:                    >? r -= 2
# asm 1: addic. >r=int32#28,<r=int32#28,-2
# asm 2: addic. >r=30,<r=30,-2
addic. 30,30,-2

# qhasm:   x06 ^= x17
# asm 1: xor >x06=int32#25,<x17=int32#2,<x06=int32#25
# asm 2: xor >x06=27,<x17=4,<x06=27
xor 27,4,27

# qhasm:   x07 ^= x16
# asm 1: xor >x07=int32#26,<x16=int32#22,<x07=int32#26
# asm 2: xor >x07=28,<x16=24,<x07=28
xor 28,24,28

# qhasm:   x0e ^= x1f
# asm 1: xor >x0e=int32#10,<x1f=int32#6,<x0e=int32#10
# asm 2: xor >x0e=12,<x1f=8,<x0e=12
xor 12,8,12

# qhasm:   x0f ^= x1e
# asm 1: xor >x0f=int32#11,<x1e=int32#29,<x0f=int32#11
# asm 2: xor >x0f=13,<x1e=31,<x0f=13
xor 13,31,13

# qhasm:   x0b <<<= 11
# asm 1: rlwinm >x0b=int32#2,<x0b=int32#21,11,0xffffffff
# asm 2: rlwinm >x0b=4,<x0b=23,11,0xffffffff
rlwinm 4,23,11,0xffffffff

# qhasm:   x0a <<<= 11
# asm 1: rlwinm >x0a=int32#3,<x0a=int32#3,11,0xffffffff
# asm 2: rlwinm >x0a=5,<x0a=5,11,0xffffffff
rlwinm 5,5,11,0xffffffff

# qhasm:   x03 <<<= 11
# asm 1: rlwinm >x03=int32#21,<x03=int32#27,11,0xffffffff
# asm 2: rlwinm >x03=23,<x03=29,11,0xffffffff
rlwinm 23,29,11,0xffffffff

# qhasm:   x02 <<<= 11
# asm 1: rlwinm >x02=int32#4,<x02=int32#4,11,0xffffffff
# asm 2: rlwinm >x02=6,<x02=6,11,0xffffffff
rlwinm 6,6,11,0xffffffff

# qhasm:   x0b ^= x1a
# asm 1: xor >x0b=int32#2,<x1a=int32#17,<x0b=int32#2
# asm 2: xor >x0b=4,<x1a=19,<x0b=4
xor 4,19,4

# qhasm:   x0a ^= x1b
# asm 1: xor >x0a=int32#6,<x1b=int32#18,<x0a=int32#3
# asm 2: xor >x0a=8,<x1b=20,<x0a=5
xor 8,20,5

# qhasm:   x03 ^= x12
# asm 1: xor >x03=int32#22,<x12=int32#13,<x03=int32#21
# asm 2: xor >x03=24,<x12=15,<x03=23
xor 24,15,23

# qhasm:   x02 ^= x13
# asm 1: xor >x02=int32#21,<x13=int32#14,<x02=int32#4
# asm 2: xor >x02=23,<x13=16,<x02=6
xor 23,16,6

# qhasm:           x0b_stack = x0b
# asm 1: stw <x0b=int32#2,>x0b_stack=stack32#20
# asm 2: stw <x0b=4,>x0b_stack=76(1)
stw 4,76(1)

# qhasm: goto morerounds if >
bgt .label.morerounds

# qhasm:   finalization = finalization_stack
# asm 1: lwz >finalization=int32#27,<finalization_stack=stack32#29
# asm 2: lwz >finalization=29,<finalization_stack=112(1)
lwz 29,112(1)

# qhasm:   in = in_stack
# asm 1: lwz >in=int32#2,<in_stack=stack32#32
# asm 2: lwz >in=4,<in_stack=124(1)
lwz 4,124(1)

# qhasm:   inlenlow = inlenlow_stack
# asm 1: lwz >inlenlow=int32#4,<inlenlow_stack=stack32#30
# asm 2: lwz >inlenlow=6,<inlenlow_stack=116(1)
lwz 6,116(1)

# qhasm:   inlenhigh = inlenhigh_stack
# asm 1: lwz >inlenhigh=int32#3,<inlenhigh_stack=stack32#31
# asm 2: lwz >inlenhigh=5,<inlenhigh_stack=120(1)
lwz 5,120(1)

# qhasm: goto checkinlen
b .label.checkinlen

# qhasm: inlenbelow32:
.label.inlenbelow32:

# qhasm:                       =? (uint32) finalization - 1
# asm 1: cmplwi <finalization=int32#27,1
# asm 2: cmplwi <finalization=29,1
cmplwi 29,1

# qhasm: goto finalization1 if =
beq .label.finalization1

# qhasm:                       =? (uint32) finalization - 2
# asm 1: cmplwi <finalization=int32#27,2
# asm 2: cmplwi <finalization=29,2
cmplwi 29,2

# qhasm: goto finalization2 if =
beq .label.finalization2

# qhasm:   y00 = 0
# asm 1: li >y00=int32#27,0
# asm 2: li >y00=29,0
li 29,0

# qhasm:   z = &tmp
# asm 1: lea >z=int32#28,>tmp=stack256#1
# asm 2: lea >z=30,>tmp=160(1)
addi 30,1,160

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: stw <y00=int32#27,0(<z=int32#28)
# asm 2: stw <y00=29,0(<z=30)
stw 29,0(30)

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: stw <y00=int32#27,4(<z=int32#28)
# asm 2: stw <y00=29,4(<z=30)
stw 29,4(30)

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: stw <y00=int32#27,8(<z=int32#28)
# asm 2: stw <y00=29,8(<z=30)
stw 29,8(30)

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: stw <y00=int32#27,12(<z=int32#28)
# asm 2: stw <y00=29,12(<z=30)
stw 29,12(30)

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: stw <y00=int32#27,16(<z=int32#28)
# asm 2: stw <y00=29,16(<z=30)
stw 29,16(30)

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: stw <y00=int32#27,20(<z=int32#28)
# asm 2: stw <y00=29,20(<z=30)
stw 29,20(30)

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: stw <y00=int32#27,24(<z=int32#28)
# asm 2: stw <y00=29,24(<z=30)
stw 29,24(30)

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: stw <y00=int32#27,28(<z=int32#28)
# asm 2: stw <y00=29,28(<z=30)
stw 29,28(30)

# qhasm:                  =? (uint32) inlenlow - 0
# asm 1: cmplwi <inlenlow=int32#4,0
# asm 2: cmplwi <inlenlow=6,0
cmplwi 6,0

# qhasm: goto copydone if =
beq .label.copydone

# qhasm:   copyloop:
.label.copyloop:

# qhasm:     y00 = *(uint8 *) (in + 0)
# asm 1: lbz >y00=int32#27,0(<in=int32#2)
# asm 2: lbz >y00=29,0(<in=4)
lbz 29,0(4)

# qhasm:     in += 1
# asm 1: addi >in=int32#2,<in=int32#2,1
# asm 2: addi >in=4,<in=4,1
addi 4,4,1

# qhasm:     *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int32#27,0(<z=int32#28)
# asm 2: stb <y00=29,0(<z=30)
stb 29,0(30)

# qhasm:     z += 1
# asm 1: addi >z=int32#28,<z=int32#28,1
# asm 2: addi >z=30,<z=30,1
addi 30,30,1

# qhasm:                  >? inlenlow -= 1
# asm 1: addic. >inlenlow=int32#4,<inlenlow=int32#4,-1
# asm 2: addic. >inlenlow=6,<inlenlow=6,-1
addic. 6,6,-1

# qhasm: goto copyloop if >
bgt .label.copyloop

# qhasm: copydone:
.label.copydone:

# qhasm:   y00 = 128
# asm 1: li >y00=int32#2,128
# asm 2: li >y00=4,128
li 4,128

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int32#2,0(<z=int32#28)
# asm 2: stb <y00=4,0(<z=30)
stb 4,0(30)

# qhasm:   in = &tmp
# asm 1: lea >in=int32#2,>tmp=stack256#1
# asm 2: lea >in=4,>tmp=160(1)
addi 4,1,160

# qhasm:   finalization = 1
# asm 1: li >finalization=int32#27,1
# asm 2: li >finalization=29,1
li 29,1

# qhasm:   inlenlow = 32
# asm 1: li >inlenlow=int32#4,32
# asm 2: li >inlenlow=6,32
li 6,32

# qhasm:   goto mainloop
b .label.mainloop

# qhasm: finalization1:
.label.finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: lwz >x1f=int32#27,<x1f_stack=stack32#28
# asm 2: lwz >x1f=29,<x1f_stack=108(1)
lwz 29,108(1)

# qhasm:   x1f ^= 1
# asm 1: xori >x1f=int32#27,<x1f=int32#27,1
# asm 2: xori >x1f=29,<x1f=29,1
xori 29,29,1

# qhasm:   x1f_stack = x1f
# asm 1: stw <x1f=int32#27,>x1f_stack=stack32#28
# asm 2: stw <x1f=29,>x1f_stack=108(1)
stw 29,108(1)

# qhasm:   r = 160
# asm 1: li >r=int32#28,160
# asm 2: li >r=30,160
li 30,160

# qhasm:   finalization = 2
# asm 1: li >finalization=int32#27,2
# asm 2: li >finalization=29,2
li 29,2

# qhasm:   finalization_stack = finalization
# asm 1: stw <finalization=int32#27,>finalization_stack=stack32#29
# asm 2: stw <finalization=29,>finalization_stack=112(1)
stw 29,112(1)

# qhasm:   in_stack = in
# asm 1: stw <in=int32#2,>in_stack=stack32#32
# asm 2: stw <in=4,>in_stack=124(1)
stw 4,124(1)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: stw <inlenlow=int32#4,>inlenlow_stack=stack32#30
# asm 2: stw <inlenlow=6,>inlenlow_stack=116(1)
stw 6,116(1)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: stw <inlenhigh=int32#3,>inlenhigh_stack=stack32#31
# asm 2: stw <inlenhigh=5,>inlenhigh_stack=120(1)
stw 5,120(1)

# qhasm: goto morerounds
b .label.morerounds

# qhasm: finalization2:
.label.finalization2:

# qhasm:   out = out_stack
# asm 1: lwz >out=int32#2,<out_stack=stack32#19
# asm 2: lwz >out=4,<out_stack=72(1)
lwz 4,72(1)

# qhasm:   *(swapendian uint32 *) out = x00
# asm 1: stwbrx <x00=int32#19,0,<out=int32#2
# asm 2: stwbrx <x00=21,0,<out=4
stwbrx 21,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x01
# asm 1: stwbrx <x01=int32#20,0,<out=int32#2
# asm 2: stwbrx <x01=22,0,<out=4
stwbrx 22,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x02
# asm 1: stwbrx <x02=int32#21,0,<out=int32#2
# asm 2: stwbrx <x02=23,0,<out=4
stwbrx 23,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x03
# asm 1: stwbrx <x03=int32#22,0,<out=int32#2
# asm 2: stwbrx <x03=24,0,<out=4
stwbrx 24,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x04
# asm 1: stwbrx <x04=int32#23,0,<out=int32#2
# asm 2: stwbrx <x04=25,0,<out=4
stwbrx 25,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x05
# asm 1: stwbrx <x05=int32#24,0,<out=int32#2
# asm 2: stwbrx <x05=26,0,<out=4
stwbrx 26,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x06
# asm 1: stwbrx <x06=int32#25,0,<out=int32#2
# asm 2: stwbrx <x06=27,0,<out=4
stwbrx 27,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x07
# asm 1: stwbrx <x07=int32#26,0,<out=int32#2
# asm 2: stwbrx <x07=28,0,<out=4
stwbrx 28,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#2,<out=int32#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   x0b = x0b_stack
# asm 1: lwz >x0b=int32#3,<x0b_stack=stack32#20
# asm 2: lwz >x0b=5,<x0b_stack=76(1)
lwz 5,76(1)

# qhasm:   *(swapendian uint32 *) out = x08
# asm 1: stwbrx <x08=int32#1,0,<out=int32#2
# asm 2: stwbrx <x08=3,0,<out=4
stwbrx 3,0,4

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#2,4
# asm 2: addi >out=3,<out=4,4
addi 3,4,4

# qhasm:   *(swapendian uint32 *) out = x09
# asm 1: stwbrx <x09=int32#5,0,<out=int32#1
# asm 2: stwbrx <x09=7,0,<out=3
stwbrx 7,0,3

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0a
# asm 1: stwbrx <x0a=int32#6,0,<out=int32#1
# asm 2: stwbrx <x0a=8,0,<out=3
stwbrx 8,0,3

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0b
# asm 1: stwbrx <x0b=int32#3,0,<out=int32#1
# asm 2: stwbrx <x0b=5,0,<out=3
stwbrx 5,0,3

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0c
# asm 1: stwbrx <x0c=int32#8,0,<out=int32#1
# asm 2: stwbrx <x0c=10,0,<out=3
stwbrx 10,0,3

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0d
# asm 1: stwbrx <x0d=int32#9,0,<out=int32#1
# asm 2: stwbrx <x0d=11,0,<out=3
stwbrx 11,0,3

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0e
# asm 1: stwbrx <x0e=int32#10,0,<out=int32#1
# asm 2: stwbrx <x0e=12,0,<out=3
stwbrx 12,0,3

# qhasm:   out += 4
# asm 1: addi >out=int32#1,<out=int32#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0f
# asm 1: stwbrx <x0f=int32#11,0,<out=int32#1
# asm 2: stwbrx <x0f=13,0,<out=3
stwbrx 13,0,3

# qhasm:   result = 0
# asm 1: li >result=int32#1,0
# asm 2: li >result=3,0
li 3,0

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
addi 1,1,320
blr
