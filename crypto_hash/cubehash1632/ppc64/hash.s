
# qhasm: int64 out

# qhasm: int64 in

# qhasm: int64 inlen

# qhasm: int64 result

# qhasm: input out

# qhasm: input in

# qhasm: input inlen

# qhasm: output result

# qhasm: int64 x00

# qhasm: int64 x01

# qhasm: int64 x02

# qhasm: int64 x03

# qhasm: int64 x04

# qhasm: int64 x05

# qhasm: int64 x06

# qhasm: int64 x07

# qhasm: int64 x08

# qhasm: int64 x09

# qhasm: int64 x0a

# qhasm: int64 x0b

# qhasm: int64 x0c

# qhasm: int64 x0d

# qhasm: int64 x0e

# qhasm: int64 x0f

# qhasm: int64 x10

# qhasm: int64 x11

# qhasm: int64 x12

# qhasm: int64 x13

# qhasm: int64 x14

# qhasm: int64 x15

# qhasm: int64 x16

# qhasm: int64 x17

# qhasm: int64 x18

# qhasm: int64 x19

# qhasm: int64 x1a

# qhasm: int64 x1b

# qhasm: int64 x1c

# qhasm: int64 x1d

# qhasm: int64 x1e

# qhasm: int64 x1f

# qhasm: int64 y00

# qhasm: int64 y01

# qhasm: int64 y02

# qhasm: int64 y03

# qhasm: int64 y04

# qhasm: int64 y05

# qhasm: int64 y06

# qhasm: int64 y07

# qhasm: int64 r

# qhasm: int64 i

# qhasm: int64 finalization

# qhasm: stack256 tmp

# qhasm: int64 z

# qhasm: stack64 out_stack

# qhasm: stack64 in_stack

# qhasm: stack64 inlen_stack

# qhasm: stack32 finalization_stack

# qhasm: stack32 r_stack

# qhasm: stack32 x02_stack

# qhasm: stack32 x0a_stack

# qhasm: stack32 x0b_stack

# qhasm: stack32 x0c_stack

# qhasm: stack32 x14_stack

# qhasm: stack32 x15_stack

# qhasm: stack32 x16_stack

# qhasm: stack32 x17_stack

# qhasm: stack32 x1c_stack

# qhasm: stack32 x1d_stack

# qhasm: stack32 x1e_stack

# qhasm: stack32 x1f_stack

# qhasm: int64 i12

# qhasm: int64 i13

# qhasm: int64 i14

# qhasm: int64 i15

# qhasm: int64 i16

# qhasm: int64 i17

# qhasm: int64 i18

# qhasm: int64 i19

# qhasm: int64 i20

# qhasm: int64 i21

# qhasm: int64 i22

# qhasm: int64 i23

# qhasm: int64 i24

# qhasm: int64 i25

# qhasm: int64 i26

# qhasm: int64 i27

# qhasm: int64 i28

# qhasm: int64 i29

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

# qhasm: stack64 i12_stack

# qhasm: stack64 i13_stack

# qhasm: stack64 i14_stack

# qhasm: stack64 i15_stack

# qhasm: stack64 i16_stack

# qhasm: stack64 i17_stack

# qhasm: stack64 i18_stack

# qhasm: stack64 i19_stack

# qhasm: stack64 i20_stack

# qhasm: stack64 i21_stack

# qhasm: stack64 i22_stack

# qhasm: stack64 i23_stack

# qhasm: stack64 i24_stack

# qhasm: stack64 i25_stack

# qhasm: stack64 i26_stack

# qhasm: stack64 i27_stack

# qhasm: stack64 i28_stack

# qhasm: stack64 i29_stack

# qhasm: int64 constants

# qhasm: enter crypto_hash_cubehash1632_ppc64
.text
.align 3
.globl .crypto_hash_cubehash1632_ppc64
.globl _crypto_hash_cubehash1632_ppc64
.globl crypto_hash_cubehash1632_ppc64
_crypto_hash_cubehash1632_ppc64:
.crypto_hash_cubehash1632_ppc64:
crypto_hash_cubehash1632_ppc64:
stwu 1,-400(1)

# qhasm: i12_stack = i12
# asm 1: std <i12=int64#11,>i12_stack=stack64#1
# asm 2: std <i12=14,>i12_stack=96(1)
std 14,96(1)

# qhasm: i13_stack = i13
# asm 1: std <i13=int64#12,>i13_stack=stack64#2
# asm 2: std <i13=15,>i13_stack=104(1)
std 15,104(1)

# qhasm: i14_stack = i14
# asm 1: std <i14=int64#13,>i14_stack=stack64#3
# asm 2: std <i14=16,>i14_stack=112(1)
std 16,112(1)

# qhasm: i15_stack = i15
# asm 1: std <i15=int64#14,>i15_stack=stack64#4
# asm 2: std <i15=17,>i15_stack=120(1)
std 17,120(1)

# qhasm: i16_stack = i16
# asm 1: std <i16=int64#15,>i16_stack=stack64#5
# asm 2: std <i16=18,>i16_stack=128(1)
std 18,128(1)

# qhasm: i17_stack = i17
# asm 1: std <i17=int64#16,>i17_stack=stack64#6
# asm 2: std <i17=19,>i17_stack=136(1)
std 19,136(1)

# qhasm: i18_stack = i18
# asm 1: std <i18=int64#17,>i18_stack=stack64#7
# asm 2: std <i18=20,>i18_stack=144(1)
std 20,144(1)

# qhasm: i19_stack = i19
# asm 1: std <i19=int64#18,>i19_stack=stack64#8
# asm 2: std <i19=21,>i19_stack=152(1)
std 21,152(1)

# qhasm: i20_stack = i20
# asm 1: std <i20=int64#19,>i20_stack=stack64#9
# asm 2: std <i20=22,>i20_stack=160(1)
std 22,160(1)

# qhasm: i21_stack = i21
# asm 1: std <i21=int64#20,>i21_stack=stack64#10
# asm 2: std <i21=23,>i21_stack=168(1)
std 23,168(1)

# qhasm: i22_stack = i22
# asm 1: std <i22=int64#21,>i22_stack=stack64#11
# asm 2: std <i22=24,>i22_stack=176(1)
std 24,176(1)

# qhasm: i23_stack = i23
# asm 1: std <i23=int64#22,>i23_stack=stack64#12
# asm 2: std <i23=25,>i23_stack=184(1)
std 25,184(1)

# qhasm: i24_stack = i24
# asm 1: std <i24=int64#23,>i24_stack=stack64#13
# asm 2: std <i24=26,>i24_stack=192(1)
std 26,192(1)

# qhasm: i25_stack = i25
# asm 1: std <i25=int64#24,>i25_stack=stack64#14
# asm 2: std <i25=27,>i25_stack=200(1)
std 27,200(1)

# qhasm: i26_stack = i26
# asm 1: std <i26=int64#25,>i26_stack=stack64#15
# asm 2: std <i26=28,>i26_stack=208(1)
std 28,208(1)

# qhasm: i27_stack = i27
# asm 1: std <i27=int64#26,>i27_stack=stack64#16
# asm 2: std <i27=29,>i27_stack=216(1)
std 29,216(1)

# qhasm: i28_stack = i28
# asm 1: std <i28=int64#27,>i28_stack=stack64#17
# asm 2: std <i28=30,>i28_stack=224(1)
std 30,224(1)

# qhasm: i29_stack = i29
# asm 1: std <i29=int64#28,>i29_stack=stack64#18
# asm 2: std <i29=31,>i29_stack=232(1)
std 31,232(1)

# qhasm: constants = &crypto_hash_cubehash1632_ppc64_constants & 0xffff0000
# asm 1: lis >constants=int64#4,crypto_hash_cubehash1632_ppc64_constants@h
# asm 2: lis >constants=6,crypto_hash_cubehash1632_ppc64_constants@h
lis 6,crypto_hash_cubehash1632_ppc64_constants@h

# qhasm: constants |= &crypto_hash_cubehash1632_ppc64_constants & 0xffff
# asm 1: ori >constants=int64#4,<constants=int64#4,crypto_hash_cubehash1632_ppc64_constants@l
# asm 2: ori >constants=6,<constants=6,crypto_hash_cubehash1632_ppc64_constants@l
ori 6,6,crypto_hash_cubehash1632_ppc64_constants@l

# qhasm:   out_stack = out
# asm 1: std <out=int64#1,>out_stack=stack64#19
# asm 2: std <out=3,>out_stack=240(1)
std 3,240(1)

# qhasm:   x08 = *(uint32 *) (constants + 32)
# asm 1: lwz >x08=int64#1,32(<constants=int64#4)
# asm 2: lwz >x08=3,32(<constants=6)
lwz 3,32(6)

# qhasm:   x09 = *(uint32 *) (constants + 36)
# asm 1: lwz >x09=int64#5,36(<constants=int64#4)
# asm 2: lwz >x09=7,36(<constants=6)
lwz 7,36(6)

# qhasm:   x0a = *(uint32 *) (constants + 40)
# asm 1: lwz >x0a=int64#6,40(<constants=int64#4)
# asm 2: lwz >x0a=8,40(<constants=6)
lwz 8,40(6)

# qhasm:   x0b = *(uint32 *) (constants + 44)
# asm 1: lwz >x0b=int64#7,44(<constants=int64#4)
# asm 2: lwz >x0b=9,44(<constants=6)
lwz 9,44(6)

# qhasm:   x0c = *(uint32 *) (constants + 48)
# asm 1: lwz >x0c=int64#8,48(<constants=int64#4)
# asm 2: lwz >x0c=10,48(<constants=6)
lwz 10,48(6)

# qhasm:   x0d = *(uint32 *) (constants + 52)
# asm 1: lwz >x0d=int64#9,52(<constants=int64#4)
# asm 2: lwz >x0d=11,52(<constants=6)
lwz 11,52(6)

# qhasm:   x0e = *(uint32 *) (constants + 56)
# asm 1: lwz >x0e=int64#10,56(<constants=int64#4)
# asm 2: lwz >x0e=12,56(<constants=6)
lwz 12,56(6)

# qhasm:   x0f = *(uint32 *) (constants + 60)
# asm 1: lwz >x0f=int64#11,60(<constants=int64#4)
# asm 2: lwz >x0f=14,60(<constants=6)
lwz 14,60(6)

# qhasm:   x0b_stack = x0b
# asm 1: stw <x0b=int64#7,>x0b_stack=stack32#1
# asm 2: stw <x0b=9,>x0b_stack=0(1)
stw 9,0(1)

# qhasm:   x0c_stack = x0c
# asm 1: stw <x0c=int64#8,>x0c_stack=stack32#2
# asm 2: stw <x0c=10,>x0c_stack=4(1)
stw 10,4(1)

# qhasm:   x10 = *(uint32 *) (constants + 64)
# asm 1: lwz >x10=int64#7,64(<constants=int64#4)
# asm 2: lwz >x10=9,64(<constants=6)
lwz 9,64(6)

# qhasm:   x11 = *(uint32 *) (constants + 68)
# asm 1: lwz >x11=int64#8,68(<constants=int64#4)
# asm 2: lwz >x11=10,68(<constants=6)
lwz 10,68(6)

# qhasm:   x12 = *(uint32 *) (constants + 72)
# asm 1: lwz >x12=int64#12,72(<constants=int64#4)
# asm 2: lwz >x12=15,72(<constants=6)
lwz 15,72(6)

# qhasm:   x13 = *(uint32 *) (constants + 76)
# asm 1: lwz >x13=int64#13,76(<constants=int64#4)
# asm 2: lwz >x13=16,76(<constants=6)
lwz 16,76(6)

# qhasm:   x14 = *(uint32 *) (constants + 80)
# asm 1: lwz >x14=int64#14,80(<constants=int64#4)
# asm 2: lwz >x14=17,80(<constants=6)
lwz 17,80(6)

# qhasm:   x15 = *(uint32 *) (constants + 84)
# asm 1: lwz >x15=int64#15,84(<constants=int64#4)
# asm 2: lwz >x15=18,84(<constants=6)
lwz 18,84(6)

# qhasm:   x16 = *(uint32 *) (constants + 88)
# asm 1: lwz >x16=int64#16,88(<constants=int64#4)
# asm 2: lwz >x16=19,88(<constants=6)
lwz 19,88(6)

# qhasm:   x17 = *(uint32 *) (constants + 92)
# asm 1: lwz >x17=int64#17,92(<constants=int64#4)
# asm 2: lwz >x17=20,92(<constants=6)
lwz 20,92(6)

# qhasm:   x14_stack = x14
# asm 1: stw <x14=int64#14,>x14_stack=stack32#3
# asm 2: stw <x14=17,>x14_stack=8(1)
stw 17,8(1)

# qhasm:   x15_stack = x15
# asm 1: stw <x15=int64#15,>x15_stack=stack32#4
# asm 2: stw <x15=18,>x15_stack=12(1)
stw 18,12(1)

# qhasm:   x16_stack = x16
# asm 1: stw <x16=int64#16,>x16_stack=stack32#5
# asm 2: stw <x16=19,>x16_stack=16(1)
stw 19,16(1)

# qhasm:   x17_stack = x17
# asm 1: stw <x17=int64#17,>x17_stack=stack32#6
# asm 2: stw <x17=20,>x17_stack=20(1)
stw 20,20(1)

# qhasm:   x18 = *(uint32 *) (constants + 96)
# asm 1: lwz >x18=int64#14,96(<constants=int64#4)
# asm 2: lwz >x18=17,96(<constants=6)
lwz 17,96(6)

# qhasm:   x19 = *(uint32 *) (constants + 100)
# asm 1: lwz >x19=int64#15,100(<constants=int64#4)
# asm 2: lwz >x19=18,100(<constants=6)
lwz 18,100(6)

# qhasm:   x1a = *(uint32 *) (constants + 104)
# asm 1: lwz >x1a=int64#16,104(<constants=int64#4)
# asm 2: lwz >x1a=19,104(<constants=6)
lwz 19,104(6)

# qhasm:   x1b = *(uint32 *) (constants + 108)
# asm 1: lwz >x1b=int64#17,108(<constants=int64#4)
# asm 2: lwz >x1b=20,108(<constants=6)
lwz 20,108(6)

# qhasm:   x1c = *(uint32 *) (constants + 112)
# asm 1: lwz >x1c=int64#18,112(<constants=int64#4)
# asm 2: lwz >x1c=21,112(<constants=6)
lwz 21,112(6)

# qhasm:   x1d = *(uint32 *) (constants + 116)
# asm 1: lwz >x1d=int64#19,116(<constants=int64#4)
# asm 2: lwz >x1d=22,116(<constants=6)
lwz 22,116(6)

# qhasm:   x1e = *(uint32 *) (constants + 120)
# asm 1: lwz >x1e=int64#20,120(<constants=int64#4)
# asm 2: lwz >x1e=23,120(<constants=6)
lwz 23,120(6)

# qhasm:   x1f = *(uint32 *) (constants + 124)
# asm 1: lwz >x1f=int64#21,124(<constants=int64#4)
# asm 2: lwz >x1f=24,124(<constants=6)
lwz 24,124(6)

# qhasm:   x1c_stack = x1c
# asm 1: stw <x1c=int64#18,>x1c_stack=stack32#7
# asm 2: stw <x1c=21,>x1c_stack=24(1)
stw 21,24(1)

# qhasm:   x1d_stack = x1d
# asm 1: stw <x1d=int64#19,>x1d_stack=stack32#8
# asm 2: stw <x1d=22,>x1d_stack=28(1)
stw 22,28(1)

# qhasm:   x1e_stack = x1e
# asm 1: stw <x1e=int64#20,>x1e_stack=stack32#9
# asm 2: stw <x1e=23,>x1e_stack=32(1)
stw 23,32(1)

# qhasm:   x1f_stack = x1f
# asm 1: stw <x1f=int64#21,>x1f_stack=stack32#10
# asm 2: stw <x1f=24,>x1f_stack=36(1)
stw 24,36(1)

# qhasm:   x00 = *(uint32 *) (constants + 0)
# asm 1: lwz >x00=int64#18,0(<constants=int64#4)
# asm 2: lwz >x00=21,0(<constants=6)
lwz 21,0(6)

# qhasm:   x01 = *(uint32 *) (constants + 4)
# asm 1: lwz >x01=int64#19,4(<constants=int64#4)
# asm 2: lwz >x01=22,4(<constants=6)
lwz 22,4(6)

# qhasm:   x02 = *(uint32 *) (constants + 8)
# asm 1: lwz >x02=int64#20,8(<constants=int64#4)
# asm 2: lwz >x02=23,8(<constants=6)
lwz 23,8(6)

# qhasm:   x03 = *(uint32 *) (constants + 12)
# asm 1: lwz >x03=int64#21,12(<constants=int64#4)
# asm 2: lwz >x03=24,12(<constants=6)
lwz 24,12(6)

# qhasm:   x04 = *(uint32 *) (constants + 16)
# asm 1: lwz >x04=int64#22,16(<constants=int64#4)
# asm 2: lwz >x04=25,16(<constants=6)
lwz 25,16(6)

# qhasm:   x05 = *(uint32 *) (constants + 20)
# asm 1: lwz >x05=int64#23,20(<constants=int64#4)
# asm 2: lwz >x05=26,20(<constants=6)
lwz 26,20(6)

# qhasm:   x06 = *(uint32 *) (constants + 24)
# asm 1: lwz >x06=int64#24,24(<constants=int64#4)
# asm 2: lwz >x06=27,24(<constants=6)
lwz 27,24(6)

# qhasm:   x07 = *(uint32 *) (constants + 28)
# asm 1: lwz >x07=int64#4,28(<constants=int64#4)
# asm 2: lwz >x07=6,28(<constants=6)
lwz 6,28(6)

# qhasm:   finalization = 0
# asm 1: li >finalization=int64#25,0
# asm 2: li >finalization=28,0
li 28,0

# qhasm:                      <? (uint64) inlen - 32
# asm 1: cmpldi <inlen=int64#3,32
# asm 2: cmpldi <inlen=5,32
cmpldi 5,32

# qhasm: goto inlenbelow32 if <
blt .label.inlenbelow32

# qhasm: mainloop:
.label.mainloop:

# qhasm:   inlen -= 32
# asm 1: addi >inlen=int64#3,<inlen=int64#3,-32
# asm 2: addi >inlen=5,<inlen=5,-32
addi 5,5,-32

# qhasm:   r = 16
# asm 1: li >r=int64#26,16
# asm 2: li >r=29,16
li 29,16

# qhasm:   finalization_stack = finalization
# asm 1: stw <finalization=int64#25,>finalization_stack=stack32#11
# asm 2: stw <finalization=28,>finalization_stack=40(1)
stw 28,40(1)

# qhasm:   inlen_stack = inlen
# asm 1: std <inlen=int64#3,>inlen_stack=stack64#20
# asm 2: std <inlen=5,>inlen_stack=248(1)
std 5,248(1)

# qhasm:   y00 = *(swapendian uint32 *) in
# asm 1: lwbrx >y00=int64#3,0,<in=int64#2
# asm 2: lwbrx >y00=5,0,<in=4
lwbrx 5,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y01 = *(swapendian uint32 *) in
# asm 1: lwbrx >y01=int64#25,0,<in=int64#2
# asm 2: lwbrx >y01=28,0,<in=4
lwbrx 28,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y02 = *(swapendian uint32 *) in
# asm 1: lwbrx >y02=int64#27,0,<in=int64#2
# asm 2: lwbrx >y02=30,0,<in=4
lwbrx 30,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y03 = *(swapendian uint32 *) in
# asm 1: lwbrx >y03=int64#28,0,<in=int64#2
# asm 2: lwbrx >y03=31,0,<in=4
lwbrx 31,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   x00 ^= y00
# asm 1: xor >x00=int64#18,<x00=int64#18,<y00=int64#3
# asm 2: xor >x00=21,<x00=21,<y00=5
xor 21,21,5

# qhasm:   x01 ^= y01
# asm 1: xor >x01=int64#19,<x01=int64#19,<y01=int64#25
# asm 2: xor >x01=22,<x01=22,<y01=28
xor 22,22,28

# qhasm:   x02 ^= y02
# asm 1: xor >x02=int64#20,<x02=int64#20,<y02=int64#27
# asm 2: xor >x02=23,<x02=23,<y02=30
xor 23,23,30

# qhasm:   x03 ^= y03
# asm 1: xor >x03=int64#21,<x03=int64#21,<y03=int64#28
# asm 2: xor >x03=24,<x03=24,<y03=31
xor 24,24,31

# qhasm:   y04 = *(swapendian uint32 *) in
# asm 1: lwbrx >y04=int64#3,0,<in=int64#2
# asm 2: lwbrx >y04=5,0,<in=4
lwbrx 5,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y05 = *(swapendian uint32 *) in
# asm 1: lwbrx >y05=int64#25,0,<in=int64#2
# asm 2: lwbrx >y05=28,0,<in=4
lwbrx 28,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   x04 ^= y04
# asm 1: xor >x04=int64#22,<x04=int64#22,<y04=int64#3
# asm 2: xor >x04=25,<x04=25,<y04=5
xor 25,25,5

# qhasm:   x05 ^= y05
# asm 1: xor >x05=int64#23,<x05=int64#23,<y05=int64#25
# asm 2: xor >x05=26,<x05=26,<y05=28
xor 26,26,28

# qhasm:   y06 = *(swapendian uint32 *) in
# asm 1: lwbrx >y06=int64#3,0,<in=int64#2
# asm 2: lwbrx >y06=5,0,<in=4
lwbrx 5,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   y07 = *(swapendian uint32 *) in
# asm 1: lwbrx >y07=int64#25,0,<in=int64#2
# asm 2: lwbrx >y07=28,0,<in=4
lwbrx 28,0,4

# qhasm:   in += 4
# asm 1: addi >in=int64#2,<in=int64#2,4
# asm 2: addi >in=4,<in=4,4
addi 4,4,4

# qhasm:   x06 ^= y06
# asm 1: xor >x06=int64#24,<x06=int64#24,<y06=int64#3
# asm 2: xor >x06=27,<x06=27,<y06=5
xor 27,27,5

# qhasm:   x07 ^= y07
# asm 1: xor >x07=int64#4,<x07=int64#4,<y07=int64#25
# asm 2: xor >x07=6,<x07=6,<y07=28
xor 6,6,28

# qhasm:   in_stack = in
# asm 1: std <in=int64#2,>in_stack=stack64#21
# asm 2: std <in=4,>in_stack=256(1)
std 4,256(1)

# qhasm: morerounds:
.label.morerounds:

# qhasm: r_stack = r
# asm 1: stw <r=int64#26,>r_stack=stack32#12
# asm 2: stw <r=29,>r_stack=44(1)
stw 29,44(1)

# qhasm:   x10 += x00
# asm 1: add >x10=int64#2,<x10=int64#7,<x00=int64#18
# asm 2: add >x10=4,<x10=9,<x00=21
add 4,9,21

# qhasm:   x12 += x02
# asm 1: add >x12=int64#3,<x12=int64#12,<x02=int64#20
# asm 2: add >x12=5,<x12=15,<x02=23
add 5,15,23

# qhasm:   x18 += x08
# asm 1: add >x18=int64#7,<x18=int64#14,<x08=int64#1
# asm 2: add >x18=9,<x18=17,<x08=3
add 9,17,3

# qhasm:   x1a += x0a
# asm 1: add >x1a=int64#12,<x1a=int64#16,<x0a=int64#6
# asm 2: add >x1a=15,<x1a=19,<x0a=8
add 15,19,8

# qhasm:   (uint32) x00 <<<= 7
# asm 1: rlwinm <x00=int64#18,<x00=int64#18,7,0xffffffff
# asm 2: rlwinm <x00=21,<x00=21,7,0xffffffff
rlwinm 21,21,7,0xffffffff

# qhasm:   (uint32) x02 <<<= 7
# asm 1: rlwinm <x02=int64#20,<x02=int64#20,7,0xffffffff
# asm 2: rlwinm <x02=23,<x02=23,7,0xffffffff
rlwinm 23,23,7,0xffffffff

# qhasm:   (uint32) x08 <<<= 7
# asm 1: rlwinm <x08=int64#1,<x08=int64#1,7,0xffffffff
# asm 2: rlwinm <x08=3,<x08=3,7,0xffffffff
rlwinm 3,3,7,0xffffffff

# qhasm:   (uint32) x0a <<<= 7
# asm 1: rlwinm <x0a=int64#6,<x0a=int64#6,7,0xffffffff
# asm 2: rlwinm <x0a=8,<x0a=8,7,0xffffffff
rlwinm 8,8,7,0xffffffff

# qhasm:   x00 ^= x18
# asm 1: xor >x00=int64#14,<x00=int64#18,<x18=int64#7
# asm 2: xor >x00=17,<x00=21,<x18=9
xor 17,21,9

# qhasm:   x02 ^= x1a
# asm 1: xor >x02=int64#16,<x02=int64#20,<x1a=int64#12
# asm 2: xor >x02=19,<x02=23,<x1a=15
xor 19,23,15

# qhasm:   x08 ^= x10
# asm 1: xor >x08=int64#1,<x08=int64#1,<x10=int64#2
# asm 2: xor >x08=3,<x08=3,<x10=4
xor 3,3,4

# qhasm:   x0a ^= x12
# asm 1: xor >x0a=int64#6,<x0a=int64#6,<x12=int64#3
# asm 2: xor >x0a=8,<x0a=8,<x12=5
xor 8,8,5

# qhasm:   x1a += x00
# asm 1: add >x1a=int64#12,<x1a=int64#12,<x00=int64#14
# asm 2: add >x1a=15,<x1a=15,<x00=17
add 15,15,17

# qhasm:   x18 += x02
# asm 1: add >x18=int64#7,<x18=int64#7,<x02=int64#16
# asm 2: add >x18=9,<x18=9,<x02=19
add 9,9,19

# qhasm:   x12 += x08
# asm 1: add >x12=int64#3,<x12=int64#3,<x08=int64#1
# asm 2: add >x12=5,<x12=5,<x08=3
add 5,5,3

# qhasm:   x10 += x0a
# asm 1: add >x10=int64#2,<x10=int64#2,<x0a=int64#6
# asm 2: add >x10=4,<x10=4,<x0a=8
add 4,4,8

# qhasm:   x02_stack = x02
# asm 1: stw <x02=int64#16,>x02_stack=stack32#13
# asm 2: stw <x02=19,>x02_stack=48(1)
stw 19,48(1)

# qhasm:   x0a_stack = x0a
# asm 1: stw <x0a=int64#6,>x0a_stack=stack32#14
# asm 2: stw <x0a=8,>x0a_stack=52(1)
stw 8,52(1)

# qhasm:   x0c = x0c_stack
# asm 1: lwz >x0c=int64#6,<x0c_stack=stack32#2
# asm 2: lwz >x0c=8,<x0c_stack=4(1)
lwz 8,4(1)

# qhasm:   x14 = x14_stack
# asm 1: lwz >x14=int64#16,<x14_stack=stack32#3
# asm 2: lwz >x14=19,<x14_stack=8(1)
lwz 19,8(1)

# qhasm:   x16 = x16_stack
# asm 1: lwz >x16=int64#18,<x16_stack=stack32#5
# asm 2: lwz >x16=21,<x16_stack=16(1)
lwz 21,16(1)

# qhasm:   x1c = x1c_stack
# asm 1: lwz >x1c=int64#20,<x1c_stack=stack32#7
# asm 2: lwz >x1c=23,<x1c_stack=24(1)
lwz 23,24(1)

# qhasm:   x1e = x1e_stack
# asm 1: lwz >x1e=int64#25,<x1e_stack=stack32#9
# asm 2: lwz >x1e=28,<x1e_stack=32(1)
lwz 28,32(1)

# qhasm:   x14 += x04
# asm 1: add >x14=int64#16,<x14=int64#16,<x04=int64#22
# asm 2: add >x14=19,<x14=19,<x04=25
add 19,19,25

# qhasm:   x16 += x06
# asm 1: add >x16=int64#18,<x16=int64#18,<x06=int64#24
# asm 2: add >x16=21,<x16=21,<x06=27
add 21,21,27

# qhasm:   x1c += x0c
# asm 1: add >x1c=int64#20,<x1c=int64#20,<x0c=int64#6
# asm 2: add >x1c=23,<x1c=23,<x0c=8
add 23,23,8

# qhasm:   x1e += x0e
# asm 1: add >x1e=int64#25,<x1e=int64#25,<x0e=int64#10
# asm 2: add >x1e=28,<x1e=28,<x0e=12
add 28,28,12

# qhasm:   (uint32) x04 <<<= 7
# asm 1: rlwinm <x04=int64#22,<x04=int64#22,7,0xffffffff
# asm 2: rlwinm <x04=25,<x04=25,7,0xffffffff
rlwinm 25,25,7,0xffffffff

# qhasm:   (uint32) x06 <<<= 7
# asm 1: rlwinm <x06=int64#24,<x06=int64#24,7,0xffffffff
# asm 2: rlwinm <x06=27,<x06=27,7,0xffffffff
rlwinm 27,27,7,0xffffffff

# qhasm:   (uint32) x0c <<<= 7
# asm 1: rlwinm <x0c=int64#6,<x0c=int64#6,7,0xffffffff
# asm 2: rlwinm <x0c=8,<x0c=8,7,0xffffffff
rlwinm 8,8,7,0xffffffff

# qhasm:   (uint32) x0e <<<= 7
# asm 1: rlwinm <x0e=int64#10,<x0e=int64#10,7,0xffffffff
# asm 2: rlwinm <x0e=12,<x0e=12,7,0xffffffff
rlwinm 12,12,7,0xffffffff

# qhasm:   x04 ^= x1c
# asm 1: xor >x04=int64#22,<x04=int64#22,<x1c=int64#20
# asm 2: xor >x04=25,<x04=25,<x1c=23
xor 25,25,23

# qhasm:   x06 ^= x1e
# asm 1: xor >x06=int64#24,<x06=int64#24,<x1e=int64#25
# asm 2: xor >x06=27,<x06=27,<x1e=28
xor 27,27,28

# qhasm:   x0c ^= x14
# asm 1: xor >x0c=int64#6,<x0c=int64#6,<x14=int64#16
# asm 2: xor >x0c=8,<x0c=8,<x14=19
xor 8,8,19

# qhasm:   x0e ^= x16
# asm 1: xor >x0e=int64#10,<x0e=int64#10,<x16=int64#18
# asm 2: xor >x0e=12,<x0e=12,<x16=21
xor 12,12,21

# qhasm:   x1e += x04
# asm 1: add >x1e=int64#25,<x1e=int64#25,<x04=int64#22
# asm 2: add >x1e=28,<x1e=28,<x04=25
add 28,28,25

# qhasm:   x1c += x06
# asm 1: add >x1c=int64#20,<x1c=int64#20,<x06=int64#24
# asm 2: add >x1c=23,<x1c=23,<x06=27
add 23,23,27

# qhasm:   x16 += x0c
# asm 1: add >x16=int64#18,<x16=int64#18,<x0c=int64#6
# asm 2: add >x16=21,<x16=21,<x0c=8
add 21,21,8

# qhasm:   x14 += x0e
# asm 1: add >x14=int64#16,<x14=int64#16,<x0e=int64#10
# asm 2: add >x14=19,<x14=19,<x0e=12
add 19,19,12

# qhasm:   x0c_stack = x0c
# asm 1: stw <x0c=int64#6,>x0c_stack=stack32#2
# asm 2: stw <x0c=8,>x0c_stack=4(1)
stw 8,4(1)

# qhasm:   x14_stack = x14
# asm 1: stw <x14=int64#16,>x14_stack=stack32#3
# asm 2: stw <x14=19,>x14_stack=8(1)
stw 19,8(1)

# qhasm:   x16_stack = x16
# asm 1: stw <x16=int64#18,>x16_stack=stack32#5
# asm 2: stw <x16=21,>x16_stack=16(1)
stw 21,16(1)

# qhasm:   x1c_stack = x1c
# asm 1: stw <x1c=int64#20,>x1c_stack=stack32#7
# asm 2: stw <x1c=23,>x1c_stack=24(1)
stw 23,24(1)

# qhasm:   x1e_stack = x1e
# asm 1: stw <x1e=int64#25,>x1e_stack=stack32#9
# asm 2: stw <x1e=28,>x1e_stack=32(1)
stw 28,32(1)

# qhasm:   x0b = x0b_stack
# asm 1: lwz >x0b=int64#6,<x0b_stack=stack32#1
# asm 2: lwz >x0b=8,<x0b_stack=0(1)
lwz 8,0(1)

# qhasm:   x11 += x01
# asm 1: add >x11=int64#8,<x11=int64#8,<x01=int64#19
# asm 2: add >x11=10,<x11=10,<x01=22
add 10,10,22

# qhasm:   x13 += x03
# asm 1: add >x13=int64#13,<x13=int64#13,<x03=int64#21
# asm 2: add >x13=16,<x13=16,<x03=24
add 16,16,24

# qhasm:   x19 += x09
# asm 1: add >x19=int64#15,<x19=int64#15,<x09=int64#5
# asm 2: add >x19=18,<x19=18,<x09=7
add 18,18,7

# qhasm:   x1b += x0b
# asm 1: add >x1b=int64#16,<x1b=int64#17,<x0b=int64#6
# asm 2: add >x1b=19,<x1b=20,<x0b=8
add 19,20,8

# qhasm:   (uint32) x01 <<<= 7
# asm 1: rlwinm <x01=int64#19,<x01=int64#19,7,0xffffffff
# asm 2: rlwinm <x01=22,<x01=22,7,0xffffffff
rlwinm 22,22,7,0xffffffff

# qhasm:   (uint32) x03 <<<= 7
# asm 1: rlwinm <x03=int64#21,<x03=int64#21,7,0xffffffff
# asm 2: rlwinm <x03=24,<x03=24,7,0xffffffff
rlwinm 24,24,7,0xffffffff

# qhasm:   (uint32) x09 <<<= 7
# asm 1: rlwinm <x09=int64#5,<x09=int64#5,7,0xffffffff
# asm 2: rlwinm <x09=7,<x09=7,7,0xffffffff
rlwinm 7,7,7,0xffffffff

# qhasm:   (uint32) x0b <<<= 7
# asm 1: rlwinm <x0b=int64#6,<x0b=int64#6,7,0xffffffff
# asm 2: rlwinm <x0b=8,<x0b=8,7,0xffffffff
rlwinm 8,8,7,0xffffffff

# qhasm:   x01 ^= x19
# asm 1: xor >x01=int64#17,<x01=int64#19,<x19=int64#15
# asm 2: xor >x01=20,<x01=22,<x19=18
xor 20,22,18

# qhasm:   x03 ^= x1b
# asm 1: xor >x03=int64#18,<x03=int64#21,<x1b=int64#16
# asm 2: xor >x03=21,<x03=24,<x1b=19
xor 21,24,19

# qhasm:   x09 ^= x11
# asm 1: xor >x09=int64#5,<x09=int64#5,<x11=int64#8
# asm 2: xor >x09=7,<x09=7,<x11=10
xor 7,7,10

# qhasm:   x0b ^= x13
# asm 1: xor >x0b=int64#6,<x0b=int64#6,<x13=int64#13
# asm 2: xor >x0b=8,<x0b=8,<x13=16
xor 8,8,16

# qhasm:   x1b += x01
# asm 1: add >x1b=int64#16,<x1b=int64#16,<x01=int64#17
# asm 2: add >x1b=19,<x1b=19,<x01=20
add 19,19,20

# qhasm:   x19 += x03
# asm 1: add >x19=int64#15,<x19=int64#15,<x03=int64#18
# asm 2: add >x19=18,<x19=18,<x03=21
add 18,18,21

# qhasm:   x13 += x09
# asm 1: add >x13=int64#13,<x13=int64#13,<x09=int64#5
# asm 2: add >x13=16,<x13=16,<x09=7
add 16,16,7

# qhasm:   x11 += x0b
# asm 1: add >x11=int64#8,<x11=int64#8,<x0b=int64#6
# asm 2: add >x11=10,<x11=10,<x0b=8
add 10,10,8

# qhasm:   x0b_stack = x0b
# asm 1: stw <x0b=int64#6,>x0b_stack=stack32#1
# asm 2: stw <x0b=8,>x0b_stack=0(1)
stw 8,0(1)

# qhasm:   x15 = x15_stack
# asm 1: lwz >x15=int64#6,<x15_stack=stack32#4
# asm 2: lwz >x15=8,<x15_stack=12(1)
lwz 8,12(1)

# qhasm:   x17 = x17_stack
# asm 1: lwz >x17=int64#19,<x17_stack=stack32#6
# asm 2: lwz >x17=22,<x17_stack=20(1)
lwz 22,20(1)

# qhasm:   x1d = x1d_stack
# asm 1: lwz >x1d=int64#20,<x1d_stack=stack32#8
# asm 2: lwz >x1d=23,<x1d_stack=28(1)
lwz 23,28(1)

# qhasm:   x1f = x1f_stack
# asm 1: lwz >x1f=int64#21,<x1f_stack=stack32#10
# asm 2: lwz >x1f=24,<x1f_stack=36(1)
lwz 24,36(1)

# qhasm:   x15 += x05
# asm 1: add >x15=int64#6,<x15=int64#6,<x05=int64#23
# asm 2: add >x15=8,<x15=8,<x05=26
add 8,8,26

# qhasm:   x17 += x07
# asm 1: add >x17=int64#19,<x17=int64#19,<x07=int64#4
# asm 2: add >x17=22,<x17=22,<x07=6
add 22,22,6

# qhasm:   x1d += x0d
# asm 1: add >x1d=int64#20,<x1d=int64#20,<x0d=int64#9
# asm 2: add >x1d=23,<x1d=23,<x0d=11
add 23,23,11

# qhasm:   x1f += x0f
# asm 1: add >x1f=int64#21,<x1f=int64#21,<x0f=int64#11
# asm 2: add >x1f=24,<x1f=24,<x0f=14
add 24,24,14

# qhasm:   (uint32) x05 <<<= 7
# asm 1: rlwinm <x05=int64#23,<x05=int64#23,7,0xffffffff
# asm 2: rlwinm <x05=26,<x05=26,7,0xffffffff
rlwinm 26,26,7,0xffffffff

# qhasm:   (uint32) x07 <<<= 7
# asm 1: rlwinm <x07=int64#4,<x07=int64#4,7,0xffffffff
# asm 2: rlwinm <x07=6,<x07=6,7,0xffffffff
rlwinm 6,6,7,0xffffffff

# qhasm:   (uint32) x0d <<<= 7
# asm 1: rlwinm <x0d=int64#9,<x0d=int64#9,7,0xffffffff
# asm 2: rlwinm <x0d=11,<x0d=11,7,0xffffffff
rlwinm 11,11,7,0xffffffff

# qhasm:   (uint32) x0f <<<= 7
# asm 1: rlwinm <x0f=int64#11,<x0f=int64#11,7,0xffffffff
# asm 2: rlwinm <x0f=14,<x0f=14,7,0xffffffff
rlwinm 14,14,7,0xffffffff

# qhasm:   x05 ^= x1d
# asm 1: xor >x05=int64#23,<x05=int64#23,<x1d=int64#20
# asm 2: xor >x05=26,<x05=26,<x1d=23
xor 26,26,23

# qhasm:   x07 ^= x1f
# asm 1: xor >x07=int64#4,<x07=int64#4,<x1f=int64#21
# asm 2: xor >x07=6,<x07=6,<x1f=24
xor 6,6,24

# qhasm:   x0d ^= x15
# asm 1: xor >x0d=int64#9,<x0d=int64#9,<x15=int64#6
# asm 2: xor >x0d=11,<x0d=11,<x15=8
xor 11,11,8

# qhasm:   x0f ^= x17
# asm 1: xor >x0f=int64#11,<x0f=int64#11,<x17=int64#19
# asm 2: xor >x0f=14,<x0f=14,<x17=22
xor 14,14,22

# qhasm:   x1f += x05
# asm 1: add >x1f=int64#21,<x1f=int64#21,<x05=int64#23
# asm 2: add >x1f=24,<x1f=24,<x05=26
add 24,24,26

# qhasm:   x1d += x07
# asm 1: add >x1d=int64#20,<x1d=int64#20,<x07=int64#4
# asm 2: add >x1d=23,<x1d=23,<x07=6
add 23,23,6

# qhasm:   x17 += x0d
# asm 1: add >x17=int64#19,<x17=int64#19,<x0d=int64#9
# asm 2: add >x17=22,<x17=22,<x0d=11
add 22,22,11

# qhasm:   x15 += x0f
# asm 1: add >x15=int64#6,<x15=int64#6,<x0f=int64#11
# asm 2: add >x15=8,<x15=8,<x0f=14
add 8,8,14

# qhasm:   x1e = x1e_stack
# asm 1: lwz >x1e=int64#25,<x1e_stack=stack32#9
# asm 2: lwz >x1e=28,<x1e_stack=32(1)
lwz 28,32(1)

# qhasm:   x16 = x16_stack
# asm 1: lwz >x16=int64#26,<x16_stack=stack32#5
# asm 2: lwz >x16=29,<x16_stack=16(1)
lwz 29,16(1)

# qhasm:   x15_stack = x15
# asm 1: stw <x15=int64#6,>x15_stack=stack32#4
# asm 2: stw <x15=8,>x15_stack=12(1)
stw 8,12(1)

# qhasm:   x1d_stack = x1d
# asm 1: stw <x1d=int64#20,>x1d_stack=stack32#5
# asm 2: stw <x1d=23,>x1d_stack=16(1)
stw 23,16(1)

# qhasm:   (uint32) x00 <<<= 11
# asm 1: rlwinm <x00=int64#14,<x00=int64#14,11,0xffffffff
# asm 2: rlwinm <x00=17,<x00=17,11,0xffffffff
rlwinm 17,17,11,0xffffffff

# qhasm:   (uint32) x01 <<<= 11
# asm 1: rlwinm <x01=int64#17,<x01=int64#17,11,0xffffffff
# asm 2: rlwinm <x01=20,<x01=20,11,0xffffffff
rlwinm 20,20,11,0xffffffff

# qhasm:   (uint32) x08 <<<= 11
# asm 1: rlwinm <x08=int64#1,<x08=int64#1,11,0xffffffff
# asm 2: rlwinm <x08=3,<x08=3,11,0xffffffff
rlwinm 3,3,11,0xffffffff

# qhasm:   (uint32) x09 <<<= 11
# asm 1: rlwinm <x09=int64#5,<x09=int64#5,11,0xffffffff
# asm 2: rlwinm <x09=7,<x09=7,11,0xffffffff
rlwinm 7,7,11,0xffffffff

# qhasm:   x00 ^= x1e
# asm 1: xor >x00=int64#6,<x00=int64#14,<x1e=int64#25
# asm 2: xor >x00=8,<x00=17,<x1e=28
xor 8,17,28

# qhasm:   x01 ^= x1f
# asm 1: xor >x01=int64#14,<x01=int64#17,<x1f=int64#21
# asm 2: xor >x01=17,<x01=20,<x1f=24
xor 17,20,24

# qhasm:   x08 ^= x16
# asm 1: xor >x08=int64#1,<x08=int64#1,<x16=int64#26
# asm 2: xor >x08=3,<x08=3,<x16=29
xor 3,3,29

# qhasm:   x09 ^= x17
# asm 1: xor >x09=int64#5,<x09=int64#5,<x17=int64#19
# asm 2: xor >x09=7,<x09=7,<x17=22
xor 7,7,22

# qhasm:   x1f += x00
# asm 1: add >x1f=int64#17,<x1f=int64#21,<x00=int64#6
# asm 2: add >x1f=20,<x1f=24,<x00=8
add 20,24,8

# qhasm:   x1e += x01
# asm 1: add >x1e=int64#20,<x1e=int64#25,<x01=int64#14
# asm 2: add >x1e=23,<x1e=28,<x01=17
add 23,28,17

# qhasm:   x17 += x08
# asm 1: add >x17=int64#19,<x17=int64#19,<x08=int64#1
# asm 2: add >x17=22,<x17=22,<x08=3
add 22,22,3

# qhasm:   x16 += x09
# asm 1: add >x16=int64#21,<x16=int64#26,<x09=int64#5
# asm 2: add >x16=24,<x16=29,<x09=7
add 24,29,7

# qhasm:   (uint32) x00 <<<= 7
# asm 1: rlwinm <x00=int64#6,<x00=int64#6,7,0xffffffff
# asm 2: rlwinm <x00=8,<x00=8,7,0xffffffff
rlwinm 8,8,7,0xffffffff

# qhasm:   (uint32) x01 <<<= 7
# asm 1: rlwinm <x01=int64#14,<x01=int64#14,7,0xffffffff
# asm 2: rlwinm <x01=17,<x01=17,7,0xffffffff
rlwinm 17,17,7,0xffffffff

# qhasm:   (uint32) x08 <<<= 7
# asm 1: rlwinm <x08=int64#1,<x08=int64#1,7,0xffffffff
# asm 2: rlwinm <x08=3,<x08=3,7,0xffffffff
rlwinm 3,3,7,0xffffffff

# qhasm:   (uint32) x09 <<<= 7
# asm 1: rlwinm <x09=int64#5,<x09=int64#5,7,0xffffffff
# asm 2: rlwinm <x09=7,<x09=7,7,0xffffffff
rlwinm 7,7,7,0xffffffff

# qhasm:   x00 ^= x17
# asm 1: xor >x00=int64#6,<x00=int64#6,<x17=int64#19
# asm 2: xor >x00=8,<x00=8,<x17=22
xor 8,8,22

# qhasm:   x01 ^= x16
# asm 1: xor >x01=int64#25,<x01=int64#14,<x16=int64#21
# asm 2: xor >x01=28,<x01=17,<x16=24
xor 28,17,24

# qhasm:   x08 ^= x1f
# asm 1: xor >x08=int64#1,<x08=int64#1,<x1f=int64#17
# asm 2: xor >x08=3,<x08=3,<x1f=20
xor 3,3,20

# qhasm:   x09 ^= x1e
# asm 1: xor >x09=int64#5,<x09=int64#5,<x1e=int64#20
# asm 2: xor >x09=7,<x09=7,<x1e=23
xor 7,7,23

# qhasm:   x1e_stack = x1e
# asm 1: stw <x1e=int64#20,>x1e_stack=stack32#6
# asm 2: stw <x1e=23,>x1e_stack=20(1)
stw 23,20(1)

# qhasm:   x1f_stack = x1f
# asm 1: stw <x1f=int64#17,>x1f_stack=stack32#9
# asm 2: stw <x1f=20,>x1f_stack=32(1)
stw 20,32(1)

# qhasm:   x16_stack = x16
# asm 1: stw <x16=int64#21,>x16_stack=stack32#10
# asm 2: stw <x16=24,>x16_stack=36(1)
stw 24,36(1)

# qhasm:   x17_stack = x17
# asm 1: stw <x17=int64#19,>x17_stack=stack32#15
# asm 2: stw <x17=22,>x17_stack=56(1)
stw 22,56(1)

# qhasm:   x02 = x02_stack
# asm 1: lwz >x02=int64#14,<x02_stack=stack32#13
# asm 2: lwz >x02=17,<x02_stack=48(1)
lwz 17,48(1)

# qhasm:   x0a = x0a_stack
# asm 1: lwz >x0a=int64#17,<x0a_stack=stack32#14
# asm 2: lwz >x0a=20,<x0a_stack=52(1)
lwz 20,52(1)

# qhasm:   x0b = x0b_stack
# asm 1: lwz >x0b=int64#19,<x0b_stack=stack32#1
# asm 2: lwz >x0b=22,<x0b_stack=0(1)
lwz 22,0(1)

# qhasm:   x1c = x1c_stack
# asm 1: lwz >x1c=int64#20,<x1c_stack=stack32#7
# asm 2: lwz >x1c=23,<x1c_stack=24(1)
lwz 23,24(1)

# qhasm:   x1d = x1d_stack
# asm 1: lwz >x1d=int64#21,<x1d_stack=stack32#5
# asm 2: lwz >x1d=24,<x1d_stack=16(1)
lwz 24,16(1)

# qhasm:   x14 = x14_stack
# asm 1: lwz >x14=int64#26,<x14_stack=stack32#3
# asm 2: lwz >x14=29,<x14_stack=8(1)
lwz 29,8(1)

# qhasm:   x15 = x15_stack
# asm 1: lwz >x15=int64#27,<x15_stack=stack32#4
# asm 2: lwz >x15=30,<x15_stack=12(1)
lwz 30,12(1)

# qhasm:   (uint32) x02 <<<= 11
# asm 1: rlwinm <x02=int64#14,<x02=int64#14,11,0xffffffff
# asm 2: rlwinm <x02=17,<x02=17,11,0xffffffff
rlwinm 17,17,11,0xffffffff

# qhasm:   (uint32) x03 <<<= 11
# asm 1: rlwinm <x03=int64#18,<x03=int64#18,11,0xffffffff
# asm 2: rlwinm <x03=21,<x03=21,11,0xffffffff
rlwinm 21,21,11,0xffffffff

# qhasm:   (uint32) x0a <<<= 11
# asm 1: rlwinm <x0a=int64#17,<x0a=int64#17,11,0xffffffff
# asm 2: rlwinm <x0a=20,<x0a=20,11,0xffffffff
rlwinm 20,20,11,0xffffffff

# qhasm:   (uint32) x0b <<<= 11
# asm 1: rlwinm <x0b=int64#19,<x0b=int64#19,11,0xffffffff
# asm 2: rlwinm <x0b=22,<x0b=22,11,0xffffffff
rlwinm 22,22,11,0xffffffff

# qhasm:   x02 ^= x1c
# asm 1: xor >x02=int64#14,<x02=int64#14,<x1c=int64#20
# asm 2: xor >x02=17,<x02=17,<x1c=23
xor 17,17,23

# qhasm:   x03 ^= x1d
# asm 1: xor >x03=int64#18,<x03=int64#18,<x1d=int64#21
# asm 2: xor >x03=21,<x03=21,<x1d=24
xor 21,21,24

# qhasm:   x0a ^= x14
# asm 1: xor >x0a=int64#17,<x0a=int64#17,<x14=int64#26
# asm 2: xor >x0a=20,<x0a=20,<x14=29
xor 20,20,29

# qhasm:   x0b ^= x15
# asm 1: xor >x0b=int64#19,<x0b=int64#19,<x15=int64#27
# asm 2: xor >x0b=22,<x0b=22,<x15=30
xor 22,22,30

# qhasm:   x1d += x02
# asm 1: add >x1d=int64#21,<x1d=int64#21,<x02=int64#14
# asm 2: add >x1d=24,<x1d=24,<x02=17
add 24,24,17

# qhasm:   x1c += x03
# asm 1: add >x1c=int64#20,<x1c=int64#20,<x03=int64#18
# asm 2: add >x1c=23,<x1c=23,<x03=21
add 23,23,21

# qhasm:   x15 += x0a
# asm 1: add >x15=int64#27,<x15=int64#27,<x0a=int64#17
# asm 2: add >x15=30,<x15=30,<x0a=20
add 30,30,20

# qhasm:   x14 += x0b
# asm 1: add >x14=int64#26,<x14=int64#26,<x0b=int64#19
# asm 2: add >x14=29,<x14=29,<x0b=22
add 29,29,22

# qhasm:   (uint32) x02 <<<= 7
# asm 1: rlwinm <x02=int64#14,<x02=int64#14,7,0xffffffff
# asm 2: rlwinm <x02=17,<x02=17,7,0xffffffff
rlwinm 17,17,7,0xffffffff

# qhasm:   (uint32) x03 <<<= 7
# asm 1: rlwinm <x03=int64#18,<x03=int64#18,7,0xffffffff
# asm 2: rlwinm <x03=21,<x03=21,7,0xffffffff
rlwinm 21,21,7,0xffffffff

# qhasm:   (uint32) x0a <<<= 7
# asm 1: rlwinm <x0a=int64#17,<x0a=int64#17,7,0xffffffff
# asm 2: rlwinm <x0a=20,<x0a=20,7,0xffffffff
rlwinm 20,20,7,0xffffffff

# qhasm:   (uint32) x0b <<<= 7
# asm 1: rlwinm <x0b=int64#19,<x0b=int64#19,7,0xffffffff
# asm 2: rlwinm <x0b=22,<x0b=22,7,0xffffffff
rlwinm 22,22,7,0xffffffff

# qhasm:   x02 ^= x15
# asm 1: xor >x02=int64#14,<x02=int64#14,<x15=int64#27
# asm 2: xor >x02=17,<x02=17,<x15=30
xor 17,17,30

# qhasm:   x03 ^= x14
# asm 1: xor >x03=int64#28,<x03=int64#18,<x14=int64#26
# asm 2: xor >x03=31,<x03=21,<x14=29
xor 31,21,29

# qhasm:   x0a ^= x1d
# asm 1: xor >x0a=int64#17,<x0a=int64#17,<x1d=int64#21
# asm 2: xor >x0a=20,<x0a=20,<x1d=24
xor 20,20,24

# qhasm:   x0b ^= x1c
# asm 1: xor >x0b=int64#18,<x0b=int64#19,<x1c=int64#20
# asm 2: xor >x0b=21,<x0b=22,<x1c=23
xor 21,22,23

# qhasm:   x02_stack = x02
# asm 1: stw <x02=int64#14,>x02_stack=stack32#1
# asm 2: stw <x02=17,>x02_stack=0(1)
stw 17,0(1)

# qhasm:   x0a_stack = x0a
# asm 1: stw <x0a=int64#17,>x0a_stack=stack32#5
# asm 2: stw <x0a=20,>x0a_stack=16(1)
stw 20,16(1)

# qhasm:   x0b_stack = x0b
# asm 1: stw <x0b=int64#18,>x0b_stack=stack32#13
# asm 2: stw <x0b=21,>x0b_stack=48(1)
stw 21,48(1)

# qhasm:   x1d_stack = x1d
# asm 1: stw <x1d=int64#21,>x1d_stack=stack32#3
# asm 2: stw <x1d=24,>x1d_stack=8(1)
stw 24,8(1)

# qhasm:   x1c_stack = x1c
# asm 1: stw <x1c=int64#20,>x1c_stack=stack32#4
# asm 2: stw <x1c=23,>x1c_stack=12(1)
stw 23,12(1)

# qhasm:   x15_stack = x15
# asm 1: stw <x15=int64#27,>x15_stack=stack32#7
# asm 2: stw <x15=30,>x15_stack=24(1)
stw 30,24(1)

# qhasm:   x14_stack = x14
# asm 1: stw <x14=int64#26,>x14_stack=stack32#8
# asm 2: stw <x14=29,>x14_stack=28(1)
stw 29,28(1)

# qhasm:   x0c = x0c_stack
# asm 1: lwz >x0c=int64#14,<x0c_stack=stack32#2
# asm 2: lwz >x0c=17,<x0c_stack=4(1)
lwz 17,4(1)

# qhasm:   (uint32) x04 <<<= 11
# asm 1: rlwinm <x04=int64#22,<x04=int64#22,11,0xffffffff
# asm 2: rlwinm <x04=25,<x04=25,11,0xffffffff
rlwinm 25,25,11,0xffffffff

# qhasm:   (uint32) x05 <<<= 11
# asm 1: rlwinm <x05=int64#23,<x05=int64#23,11,0xffffffff
# asm 2: rlwinm <x05=26,<x05=26,11,0xffffffff
rlwinm 26,26,11,0xffffffff

# qhasm:   (uint32) x0c <<<= 11
# asm 1: rlwinm <x0c=int64#14,<x0c=int64#14,11,0xffffffff
# asm 2: rlwinm <x0c=17,<x0c=17,11,0xffffffff
rlwinm 17,17,11,0xffffffff

# qhasm:   (uint32) x0d <<<= 11
# asm 1: rlwinm <x0d=int64#9,<x0d=int64#9,11,0xffffffff
# asm 2: rlwinm <x0d=11,<x0d=11,11,0xffffffff
rlwinm 11,11,11,0xffffffff

# qhasm:   x04 ^= x1a
# asm 1: xor >x04=int64#17,<x04=int64#22,<x1a=int64#12
# asm 2: xor >x04=20,<x04=25,<x1a=15
xor 20,25,15

# qhasm:   x05 ^= x1b
# asm 1: xor >x05=int64#18,<x05=int64#23,<x1b=int64#16
# asm 2: xor >x05=21,<x05=26,<x1b=19
xor 21,26,19

# qhasm:   x0c ^= x12
# asm 1: xor >x0c=int64#14,<x0c=int64#14,<x12=int64#3
# asm 2: xor >x0c=17,<x0c=17,<x12=5
xor 17,17,5

# qhasm:   x0d ^= x13
# asm 1: xor >x0d=int64#9,<x0d=int64#9,<x13=int64#13
# asm 2: xor >x0d=11,<x0d=11,<x13=16
xor 11,11,16

# qhasm:   x1b += x04
# asm 1: add >x1b=int64#16,<x1b=int64#16,<x04=int64#17
# asm 2: add >x1b=19,<x1b=19,<x04=20
add 19,19,20

# qhasm:   x1a += x05
# asm 1: add >x1a=int64#20,<x1a=int64#12,<x05=int64#18
# asm 2: add >x1a=23,<x1a=15,<x05=21
add 23,15,21

# qhasm:   x13 += x0c
# asm 1: add >x13=int64#12,<x13=int64#13,<x0c=int64#14
# asm 2: add >x13=15,<x13=16,<x0c=17
add 15,16,17

# qhasm:   x12 += x0d
# asm 1: add >x12=int64#3,<x12=int64#3,<x0d=int64#9
# asm 2: add >x12=5,<x12=5,<x0d=11
add 5,5,11

# qhasm:   (uint32) x04 <<<= 7
# asm 1: rlwinm <x04=int64#17,<x04=int64#17,7,0xffffffff
# asm 2: rlwinm <x04=20,<x04=20,7,0xffffffff
rlwinm 20,20,7,0xffffffff

# qhasm:   (uint32) x05 <<<= 7
# asm 1: rlwinm <x05=int64#18,<x05=int64#18,7,0xffffffff
# asm 2: rlwinm <x05=21,<x05=21,7,0xffffffff
rlwinm 21,21,7,0xffffffff

# qhasm:   (uint32) x0c <<<= 7
# asm 1: rlwinm <x0c=int64#14,<x0c=int64#14,7,0xffffffff
# asm 2: rlwinm <x0c=17,<x0c=17,7,0xffffffff
rlwinm 17,17,7,0xffffffff

# qhasm:   (uint32) x0d <<<= 7
# asm 1: rlwinm <x0d=int64#9,<x0d=int64#9,7,0xffffffff
# asm 2: rlwinm <x0d=11,<x0d=11,7,0xffffffff
rlwinm 11,11,7,0xffffffff

# qhasm:   x04 ^= x13
# asm 1: xor >x04=int64#13,<x04=int64#17,<x13=int64#12
# asm 2: xor >x04=16,<x04=20,<x13=15
xor 16,20,15

# qhasm:   x05 ^= x12
# asm 1: xor >x05=int64#17,<x05=int64#18,<x12=int64#3
# asm 2: xor >x05=20,<x05=21,<x12=5
xor 20,21,5

# qhasm:   x0c ^= x1b
# asm 1: xor >x0c=int64#14,<x0c=int64#14,<x1b=int64#16
# asm 2: xor >x0c=17,<x0c=17,<x1b=19
xor 17,17,19

# qhasm:   x0d ^= x1a
# asm 1: xor >x0d=int64#9,<x0d=int64#9,<x1a=int64#20
# asm 2: xor >x0d=11,<x0d=11,<x1a=23
xor 11,11,23

# qhasm:   x0c_stack = x0c
# asm 1: stw <x0c=int64#14,>x0c_stack=stack32#2
# asm 2: stw <x0c=17,>x0c_stack=4(1)
stw 17,4(1)

# qhasm:   (uint32) x06 <<<= 11
# asm 1: rlwinm <x06=int64#24,<x06=int64#24,11,0xffffffff
# asm 2: rlwinm <x06=27,<x06=27,11,0xffffffff
rlwinm 27,27,11,0xffffffff

# qhasm:   (uint32) x07 <<<= 11
# asm 1: rlwinm <x07=int64#4,<x07=int64#4,11,0xffffffff
# asm 2: rlwinm <x07=6,<x07=6,11,0xffffffff
rlwinm 6,6,11,0xffffffff

# qhasm:   (uint32) x0e <<<= 11
# asm 1: rlwinm <x0e=int64#10,<x0e=int64#10,11,0xffffffff
# asm 2: rlwinm <x0e=12,<x0e=12,11,0xffffffff
rlwinm 12,12,11,0xffffffff

# qhasm:   (uint32) x0f <<<= 11
# asm 1: rlwinm <x0f=int64#11,<x0f=int64#11,11,0xffffffff
# asm 2: rlwinm <x0f=14,<x0f=14,11,0xffffffff
rlwinm 14,14,11,0xffffffff

# qhasm:   x06 ^= x18
# asm 1: xor >x06=int64#14,<x06=int64#24,<x18=int64#7
# asm 2: xor >x06=17,<x06=27,<x18=9
xor 17,27,9

# qhasm:   x07 ^= x19
# asm 1: xor >x07=int64#4,<x07=int64#4,<x19=int64#15
# asm 2: xor >x07=6,<x07=6,<x19=18
xor 6,6,18

# qhasm:   x0e ^= x10
# asm 1: xor >x0e=int64#10,<x0e=int64#10,<x10=int64#2
# asm 2: xor >x0e=12,<x0e=12,<x10=4
xor 12,12,4

# qhasm:   x0f ^= x11
# asm 1: xor >x0f=int64#11,<x0f=int64#11,<x11=int64#8
# asm 2: xor >x0f=14,<x0f=14,<x11=10
xor 14,14,10

# qhasm:   x19 += x06
# asm 1: add >x19=int64#15,<x19=int64#15,<x06=int64#14
# asm 2: add >x19=18,<x19=18,<x06=17
add 18,18,17

# qhasm:   x18 += x07
# asm 1: add >x18=int64#18,<x18=int64#7,<x07=int64#4
# asm 2: add >x18=21,<x18=9,<x07=6
add 21,9,6

# qhasm:   x11 += x0e
# asm 1: add >x11=int64#7,<x11=int64#8,<x0e=int64#10
# asm 2: add >x11=9,<x11=10,<x0e=12
add 9,10,12

# qhasm:   x10 += x0f
# asm 1: add >x10=int64#2,<x10=int64#2,<x0f=int64#11
# asm 2: add >x10=4,<x10=4,<x0f=14
add 4,4,14

# qhasm:   (uint32) x06 <<<= 7
# asm 1: rlwinm <x06=int64#14,<x06=int64#14,7,0xffffffff
# asm 2: rlwinm <x06=17,<x06=17,7,0xffffffff
rlwinm 17,17,7,0xffffffff

# qhasm:   (uint32) x07 <<<= 7
# asm 1: rlwinm <x07=int64#4,<x07=int64#4,7,0xffffffff
# asm 2: rlwinm <x07=6,<x07=6,7,0xffffffff
rlwinm 6,6,7,0xffffffff

# qhasm:   (uint32) x0e <<<= 7
# asm 1: rlwinm <x0e=int64#10,<x0e=int64#10,7,0xffffffff
# asm 2: rlwinm <x0e=12,<x0e=12,7,0xffffffff
rlwinm 12,12,7,0xffffffff

# qhasm:   (uint32) x0f <<<= 7
# asm 1: rlwinm <x0f=int64#11,<x0f=int64#11,7,0xffffffff
# asm 2: rlwinm <x0f=14,<x0f=14,7,0xffffffff
rlwinm 14,14,7,0xffffffff

# qhasm:   x06 ^= x11
# asm 1: xor >x06=int64#21,<x06=int64#14,<x11=int64#7
# asm 2: xor >x06=24,<x06=17,<x11=9
xor 24,17,9

# qhasm:   x07 ^= x10
# asm 1: xor >x07=int64#4,<x07=int64#4,<x10=int64#2
# asm 2: xor >x07=6,<x07=6,<x10=4
xor 6,6,4

# qhasm:   x0e ^= x19
# asm 1: xor >x0e=int64#10,<x0e=int64#10,<x19=int64#15
# asm 2: xor >x0e=12,<x0e=12,<x19=18
xor 12,12,18

# qhasm:   x0f ^= x18
# asm 1: xor >x0f=int64#11,<x0f=int64#11,<x18=int64#18
# asm 2: xor >x0f=14,<x0f=14,<x18=21
xor 14,14,21

# qhasm:   x0c = x0c_stack
# asm 1: lwz >x0c=int64#19,<x0c_stack=stack32#2
# asm 2: lwz >x0c=22,<x0c_stack=4(1)
lwz 22,4(1)

# qhasm:   x11 += x04
# asm 1: add >x11=int64#8,<x11=int64#7,<x04=int64#13
# asm 2: add >x11=10,<x11=9,<x04=16
add 10,9,16

# qhasm:   x10 += x05
# asm 1: add >x10=int64#7,<x10=int64#2,<x05=int64#17
# asm 2: add >x10=9,<x10=4,<x05=20
add 9,4,20

# qhasm:   x19 += x0c
# asm 1: add >x19=int64#15,<x19=int64#15,<x0c=int64#19
# asm 2: add >x19=18,<x19=18,<x0c=22
add 18,18,22

# qhasm:   x18 += x0d
# asm 1: add >x18=int64#14,<x18=int64#18,<x0d=int64#9
# asm 2: add >x18=17,<x18=21,<x0d=11
add 17,21,11

# qhasm:   x15 = x15_stack
# asm 1: lwz >x15=int64#2,<x15_stack=stack32#7
# asm 2: lwz >x15=4,<x15_stack=24(1)
lwz 4,24(1)

# qhasm:   x14 = x14_stack
# asm 1: lwz >x14=int64#18,<x14_stack=stack32#8
# asm 2: lwz >x14=21,<x14_stack=28(1)
lwz 21,28(1)

# qhasm:   x1d = x1d_stack
# asm 1: lwz >x1d=int64#22,<x1d_stack=stack32#3
# asm 2: lwz >x1d=25,<x1d_stack=8(1)
lwz 25,8(1)

# qhasm:   x1c = x1c_stack
# asm 1: lwz >x1c=int64#23,<x1c_stack=stack32#4
# asm 2: lwz >x1c=26,<x1c_stack=12(1)
lwz 26,12(1)

# qhasm:   x15 += x00
# asm 1: add >x15=int64#2,<x15=int64#2,<x00=int64#6
# asm 2: add >x15=4,<x15=4,<x00=8
add 4,4,8

# qhasm:   x14 += x01
# asm 1: add >x14=int64#18,<x14=int64#18,<x01=int64#25
# asm 2: add >x14=21,<x14=21,<x01=28
add 21,21,28

# qhasm:   x1d += x08
# asm 1: add >x1d=int64#24,<x1d=int64#22,<x08=int64#1
# asm 2: add >x1d=27,<x1d=25,<x08=3
add 27,25,3

# qhasm:   x1c += x09
# asm 1: add >x1c=int64#26,<x1c=int64#23,<x09=int64#5
# asm 2: add >x1c=29,<x1c=26,<x09=7
add 29,26,7

# qhasm:   (uint32) x04 <<<= 11
# asm 1: rlwinm <x04=int64#13,<x04=int64#13,11,0xffffffff
# asm 2: rlwinm <x04=16,<x04=16,11,0xffffffff
rlwinm 16,16,11,0xffffffff

# qhasm:   (uint32) x05 <<<= 11
# asm 1: rlwinm <x05=int64#17,<x05=int64#17,11,0xffffffff
# asm 2: rlwinm <x05=20,<x05=20,11,0xffffffff
rlwinm 20,20,11,0xffffffff

# qhasm:   (uint32) x0c <<<= 11
# asm 1: rlwinm <x0c=int64#19,<x0c=int64#19,11,0xffffffff
# asm 2: rlwinm <x0c=22,<x0c=22,11,0xffffffff
rlwinm 22,22,11,0xffffffff

# qhasm:   (uint32) x0d <<<= 11
# asm 1: rlwinm <x0d=int64#9,<x0d=int64#9,11,0xffffffff
# asm 2: rlwinm <x0d=11,<x0d=11,11,0xffffffff
rlwinm 11,11,11,0xffffffff

# qhasm:   x04 ^= x15
# asm 1: xor >x04=int64#22,<x04=int64#13,<x15=int64#2
# asm 2: xor >x04=25,<x04=16,<x15=4
xor 25,16,4

# qhasm:   x05 ^= x14
# asm 1: xor >x05=int64#23,<x05=int64#17,<x14=int64#18
# asm 2: xor >x05=26,<x05=20,<x14=21
xor 26,20,21

# qhasm:   x0c ^= x1d
# asm 1: xor >x0c=int64#13,<x0c=int64#19,<x1d=int64#24
# asm 2: xor >x0c=16,<x0c=22,<x1d=27
xor 16,22,27

# qhasm:   x0d ^= x1c
# asm 1: xor >x0d=int64#9,<x0d=int64#9,<x1c=int64#26
# asm 2: xor >x0d=11,<x0d=11,<x1c=29
xor 11,11,29

# qhasm:   x15_stack = x15
# asm 1: stw <x15=int64#2,>x15_stack=stack32#4
# asm 2: stw <x15=4,>x15_stack=12(1)
stw 4,12(1)

# qhasm:   x14_stack = x14
# asm 1: stw <x14=int64#18,>x14_stack=stack32#3
# asm 2: stw <x14=21,>x14_stack=8(1)
stw 21,8(1)

# qhasm:   x1d_stack = x1d
# asm 1: stw <x1d=int64#24,>x1d_stack=stack32#8
# asm 2: stw <x1d=27,>x1d_stack=28(1)
stw 27,28(1)

# qhasm:   x1c_stack = x1c
# asm 1: stw <x1c=int64#26,>x1c_stack=stack32#7
# asm 2: stw <x1c=29,>x1c_stack=24(1)
stw 29,24(1)

# qhasm:   x0c_stack = x0c
# asm 1: stw <x0c=int64#13,>x0c_stack=stack32#2
# asm 2: stw <x0c=16,>x0c_stack=4(1)
stw 16,4(1)

# qhasm:   (uint32) x00 <<<= 11
# asm 1: rlwinm <x00=int64#6,<x00=int64#6,11,0xffffffff
# asm 2: rlwinm <x00=8,<x00=8,11,0xffffffff
rlwinm 8,8,11,0xffffffff

# qhasm:   (uint32) x01 <<<= 11
# asm 1: rlwinm <x01=int64#25,<x01=int64#25,11,0xffffffff
# asm 2: rlwinm <x01=28,<x01=28,11,0xffffffff
rlwinm 28,28,11,0xffffffff

# qhasm:   (uint32) x08 <<<= 11
# asm 1: rlwinm <x08=int64#1,<x08=int64#1,11,0xffffffff
# asm 2: rlwinm <x08=3,<x08=3,11,0xffffffff
rlwinm 3,3,11,0xffffffff

# qhasm:   (uint32) x09 <<<= 11
# asm 1: rlwinm <x09=int64#5,<x09=int64#5,11,0xffffffff
# asm 2: rlwinm <x09=7,<x09=7,11,0xffffffff
rlwinm 7,7,11,0xffffffff

# qhasm:   x00 ^= x11
# asm 1: xor >x00=int64#18,<x00=int64#6,<x11=int64#8
# asm 2: xor >x00=21,<x00=8,<x11=10
xor 21,8,10

# qhasm:   x01 ^= x10
# asm 1: xor >x01=int64#19,<x01=int64#25,<x10=int64#7
# asm 2: xor >x01=22,<x01=28,<x10=9
xor 22,28,9

# qhasm:   x08 ^= x19
# asm 1: xor >x08=int64#1,<x08=int64#1,<x19=int64#15
# asm 2: xor >x08=3,<x08=3,<x19=18
xor 3,3,18

# qhasm:   x09 ^= x18
# asm 1: xor >x09=int64#5,<x09=int64#5,<x18=int64#14
# asm 2: xor >x09=7,<x09=7,<x18=17
xor 7,7,17

# qhasm:   x13 += x06
# asm 1: add >x13=int64#13,<x13=int64#12,<x06=int64#21
# asm 2: add >x13=16,<x13=15,<x06=24
add 16,15,24

# qhasm:   x12 += x07
# asm 1: add >x12=int64#12,<x12=int64#3,<x07=int64#4
# asm 2: add >x12=15,<x12=5,<x07=6
add 15,5,6

# qhasm:   x1b += x0e
# asm 1: add >x1b=int64#17,<x1b=int64#16,<x0e=int64#10
# asm 2: add >x1b=20,<x1b=19,<x0e=12
add 20,19,12

# qhasm:   x1a += x0f
# asm 1: add >x1a=int64#16,<x1a=int64#20,<x0f=int64#11
# asm 2: add >x1a=19,<x1a=23,<x0f=14
add 19,23,14

# qhasm:   x02 = x02_stack
# asm 1: lwz >x02=int64#2,<x02_stack=stack32#1
# asm 2: lwz >x02=4,<x02_stack=0(1)
lwz 4,0(1)

# qhasm:   x0a = x0a_stack
# asm 1: lwz >x0a=int64#3,<x0a_stack=stack32#5
# asm 2: lwz >x0a=5,<x0a_stack=16(1)
lwz 5,16(1)

# qhasm:   x0b = x0b_stack
# asm 1: lwz >x0b=int64#25,<x0b_stack=stack32#13
# asm 2: lwz >x0b=28,<x0b_stack=48(1)
lwz 28,48(1)

# qhasm:   x17 = x17_stack
# asm 1: lwz >x17=int64#6,<x17_stack=stack32#15
# asm 2: lwz >x17=8,<x17_stack=56(1)
lwz 8,56(1)

# qhasm:   x16 = x16_stack
# asm 1: lwz >x16=int64#20,<x16_stack=stack32#10
# asm 2: lwz >x16=23,<x16_stack=36(1)
lwz 23,36(1)

# qhasm:   x1f = x1f_stack
# asm 1: lwz >x1f=int64#24,<x1f_stack=stack32#9
# asm 2: lwz >x1f=27,<x1f_stack=32(1)
lwz 27,32(1)

# qhasm:   x1e = x1e_stack
# asm 1: lwz >x1e=int64#26,<x1e_stack=stack32#6
# asm 2: lwz >x1e=29,<x1e_stack=20(1)
lwz 29,20(1)

# qhasm:   x17 += x02
# asm 1: add >x17=int64#6,<x17=int64#6,<x02=int64#2
# asm 2: add >x17=8,<x17=8,<x02=4
add 8,8,4

# qhasm:   x16 += x03
# asm 1: add >x16=int64#20,<x16=int64#20,<x03=int64#28
# asm 2: add >x16=23,<x16=23,<x03=31
add 23,23,31

# qhasm:   x1f += x0a
# asm 1: add >x1f=int64#27,<x1f=int64#24,<x0a=int64#3
# asm 2: add >x1f=30,<x1f=27,<x0a=5
add 30,27,5

# qhasm:   x1e += x0b
# asm 1: add >x1e=int64#26,<x1e=int64#26,<x0b=int64#25
# asm 2: add >x1e=29,<x1e=29,<x0b=28
add 29,29,28

# qhasm:   (uint32) x06 <<<= 11
# asm 1: rlwinm <x06=int64#21,<x06=int64#21,11,0xffffffff
# asm 2: rlwinm <x06=24,<x06=24,11,0xffffffff
rlwinm 24,24,11,0xffffffff

# qhasm:   (uint32) x07 <<<= 11
# asm 1: rlwinm <x07=int64#4,<x07=int64#4,11,0xffffffff
# asm 2: rlwinm <x07=6,<x07=6,11,0xffffffff
rlwinm 6,6,11,0xffffffff

# qhasm:   (uint32) x0e <<<= 11
# asm 1: rlwinm <x0e=int64#10,<x0e=int64#10,11,0xffffffff
# asm 2: rlwinm <x0e=12,<x0e=12,11,0xffffffff
rlwinm 12,12,11,0xffffffff

# qhasm:   (uint32) x0f <<<= 11
# asm 1: rlwinm <x0f=int64#11,<x0f=int64#11,11,0xffffffff
# asm 2: rlwinm <x0f=14,<x0f=14,11,0xffffffff
rlwinm 14,14,11,0xffffffff

# qhasm:   x06 ^= x17
# asm 1: xor >x06=int64#24,<x06=int64#21,<x17=int64#6
# asm 2: xor >x06=27,<x06=24,<x17=8
xor 27,24,8

# qhasm:   x07 ^= x16
# asm 1: xor >x07=int64#4,<x07=int64#4,<x16=int64#20
# asm 2: xor >x07=6,<x07=6,<x16=23
xor 6,6,23

# qhasm:   x0e ^= x1f
# asm 1: xor >x0e=int64#10,<x0e=int64#10,<x1f=int64#27
# asm 2: xor >x0e=12,<x0e=12,<x1f=30
xor 12,12,30

# qhasm:   x0f ^= x1e
# asm 1: xor >x0f=int64#11,<x0f=int64#11,<x1e=int64#26
# asm 2: xor >x0f=14,<x0f=14,<x1e=29
xor 14,14,29

# qhasm:   x17_stack = x17
# asm 1: stw <x17=int64#6,>x17_stack=stack32#6
# asm 2: stw <x17=8,>x17_stack=20(1)
stw 8,20(1)

# qhasm:   x16_stack = x16
# asm 1: stw <x16=int64#20,>x16_stack=stack32#5
# asm 2: stw <x16=23,>x16_stack=16(1)
stw 23,16(1)

# qhasm:   x1f_stack = x1f
# asm 1: stw <x1f=int64#27,>x1f_stack=stack32#10
# asm 2: stw <x1f=30,>x1f_stack=36(1)
stw 30,36(1)

# qhasm:   x1e_stack = x1e
# asm 1: stw <x1e=int64#26,>x1e_stack=stack32#9
# asm 2: stw <x1e=29,>x1e_stack=32(1)
stw 29,32(1)

# qhasm: r = r_stack
# asm 1: lwz >r=int64#6,<r_stack=stack32#12
# asm 2: lwz >r=8,<r_stack=44(1)
lwz 8,44(1)

# qhasm:   (uint32) x02 <<<= 11
# asm 1: rlwinm <x02=int64#2,<x02=int64#2,11,0xffffffff
# asm 2: rlwinm <x02=4,<x02=4,11,0xffffffff
rlwinm 4,4,11,0xffffffff

# qhasm:   (uint32) x03 <<<= 11
# asm 1: rlwinm <x03=int64#28,<x03=int64#28,11,0xffffffff
# asm 2: rlwinm <x03=31,<x03=31,11,0xffffffff
rlwinm 31,31,11,0xffffffff

# qhasm:   (uint32) x0a <<<= 11
# asm 1: rlwinm <x0a=int64#3,<x0a=int64#3,11,0xffffffff
# asm 2: rlwinm <x0a=5,<x0a=5,11,0xffffffff
rlwinm 5,5,11,0xffffffff

# qhasm:   (uint32) x0b <<<= 11
# asm 1: rlwinm <x0b=int64#25,<x0b=int64#25,11,0xffffffff
# asm 2: rlwinm <x0b=28,<x0b=28,11,0xffffffff
rlwinm 28,28,11,0xffffffff

# qhasm:                    >? r -= 2
# asm 1: addic. >r=int64#26,<r=int64#6,-2
# asm 2: addic. >r=29,<r=8,-2
addic. 29,8,-2

# qhasm:   x02 ^= x13
# asm 1: xor >x02=int64#20,<x02=int64#2,<x13=int64#13
# asm 2: xor >x02=23,<x02=4,<x13=16
xor 23,4,16

# qhasm:   x03 ^= x12
# asm 1: xor >x03=int64#21,<x03=int64#28,<x12=int64#12
# asm 2: xor >x03=24,<x03=31,<x12=15
xor 24,31,15

# qhasm:   x0a ^= x1b
# asm 1: xor >x0a=int64#6,<x0a=int64#3,<x1b=int64#17
# asm 2: xor >x0a=8,<x0a=5,<x1b=20
xor 8,5,20

# qhasm:   x0b ^= x1a
# asm 1: xor >x0b=int64#2,<x0b=int64#25,<x1a=int64#16
# asm 2: xor >x0b=4,<x0b=28,<x1a=19
xor 4,28,19

# qhasm:   x0b_stack = x0b
# asm 1: stw <x0b=int64#2,>x0b_stack=stack32#1
# asm 2: stw <x0b=4,>x0b_stack=0(1)
stw 4,0(1)

# qhasm: goto morerounds if >
bgt .label.morerounds

# qhasm:   finalization = finalization_stack
# asm 1: lwz >finalization=int64#25,<finalization_stack=stack32#11
# asm 2: lwz >finalization=28,<finalization_stack=40(1)
lwz 28,40(1)

# qhasm:   in = in_stack
# asm 1: ld >in=int64#2,<in_stack=stack64#21
# asm 2: ld >in=4,<in_stack=256(1)
ld 4,256(1)

# qhasm:   inlen = inlen_stack
# asm 1: ld >inlen=int64#3,<inlen_stack=stack64#20
# asm 2: ld >inlen=5,<inlen_stack=248(1)
ld 5,248(1)

# qhasm:                   <? (uint64) inlen - 32
# asm 1: cmpldi <inlen=int64#3,32
# asm 2: cmpldi <inlen=5,32
cmpldi 5,32

# qhasm: goto mainloop if !<
bge .label.mainloop

# qhasm: inlenbelow32:
.label.inlenbelow32:

# qhasm:                       =? (uint32) finalization - 1
# asm 1: cmplwi <finalization=int64#25,1
# asm 2: cmplwi <finalization=28,1
cmplwi 28,1

# qhasm: goto finalization1 if =
beq .label.finalization1

# qhasm:                       =? (uint32) finalization - 2
# asm 1: cmplwi <finalization=int64#25,2
# asm 2: cmplwi <finalization=28,2
cmplwi 28,2

# qhasm: goto finalization2 if =
beq .label.finalization2

# qhasm:   y00 = 0
# asm 1: li >y00=int64#25,0
# asm 2: li >y00=28,0
li 28,0

# qhasm:   z = &tmp
# asm 1: lea >z=int64#26,>tmp=stack256#1
# asm 2: lea >z=29,>tmp=64(1)
addi 29,1,64

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: stw <y00=int64#25,0(<z=int64#26)
# asm 2: stw <y00=28,0(<z=29)
stw 28,0(29)

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: stw <y00=int64#25,4(<z=int64#26)
# asm 2: stw <y00=28,4(<z=29)
stw 28,4(29)

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: stw <y00=int64#25,8(<z=int64#26)
# asm 2: stw <y00=28,8(<z=29)
stw 28,8(29)

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: stw <y00=int64#25,12(<z=int64#26)
# asm 2: stw <y00=28,12(<z=29)
stw 28,12(29)

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: stw <y00=int64#25,16(<z=int64#26)
# asm 2: stw <y00=28,16(<z=29)
stw 28,16(29)

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: stw <y00=int64#25,20(<z=int64#26)
# asm 2: stw <y00=28,20(<z=29)
stw 28,20(29)

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: stw <y00=int64#25,24(<z=int64#26)
# asm 2: stw <y00=28,24(<z=29)
stw 28,24(29)

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: stw <y00=int64#25,28(<z=int64#26)
# asm 2: stw <y00=28,28(<z=29)
stw 28,28(29)

# qhasm:                  =? (uint64) inlen - 0
# asm 1: cmpldi <inlen=int64#3,0
# asm 2: cmpldi <inlen=5,0
cmpldi 5,0

# qhasm: goto copydone if =
beq .label.copydone

# qhasm:   copyloop:
.label.copyloop:

# qhasm:     y00 = *(uint8 *) (in + 0)
# asm 1: lbz >y00=int64#25,0(<in=int64#2)
# asm 2: lbz >y00=28,0(<in=4)
lbz 28,0(4)

# qhasm:     in += 1
# asm 1: addi >in=int64#2,<in=int64#2,1
# asm 2: addi >in=4,<in=4,1
addi 4,4,1

# qhasm:     *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int64#25,0(<z=int64#26)
# asm 2: stb <y00=28,0(<z=29)
stb 28,0(29)

# qhasm:     z += 1
# asm 1: addi >z=int64#26,<z=int64#26,1
# asm 2: addi >z=29,<z=29,1
addi 29,29,1

# qhasm:                  >? inlen -= 1
# asm 1: addic. >inlen=int64#3,<inlen=int64#3,-1
# asm 2: addic. >inlen=5,<inlen=5,-1
addic. 5,5,-1

# qhasm: goto copyloop if >
bgt .label.copyloop

# qhasm: copydone:
.label.copydone:

# qhasm:   y00 = 128
# asm 1: li >y00=int64#2,128
# asm 2: li >y00=4,128
li 4,128

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int64#2,0(<z=int64#26)
# asm 2: stb <y00=4,0(<z=29)
stb 4,0(29)

# qhasm:   in = &tmp
# asm 1: lea >in=int64#2,>tmp=stack256#1
# asm 2: lea >in=4,>tmp=64(1)
addi 4,1,64

# qhasm:   finalization = 1
# asm 1: li >finalization=int64#25,1
# asm 2: li >finalization=28,1
li 28,1

# qhasm:   inlen = 32
# asm 1: li >inlen=int64#3,32
# asm 2: li >inlen=5,32
li 5,32

# qhasm:   goto mainloop
b .label.mainloop

# qhasm: finalization1:
.label.finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: lwz >x1f=int64#25,<x1f_stack=stack32#10
# asm 2: lwz >x1f=28,<x1f_stack=36(1)
lwz 28,36(1)

# qhasm:   x1f ^= 1
# asm 1: xori >x1f=int64#25,<x1f=int64#25,1
# asm 2: xori >x1f=28,<x1f=28,1
xori 28,28,1

# qhasm:   x1f_stack = x1f
# asm 1: stw <x1f=int64#25,>x1f_stack=stack32#10
# asm 2: stw <x1f=28,>x1f_stack=36(1)
stw 28,36(1)

# qhasm:   r = 160
# asm 1: li >r=int64#26,160
# asm 2: li >r=29,160
li 29,160

# qhasm:   finalization = 2
# asm 1: li >finalization=int64#25,2
# asm 2: li >finalization=28,2
li 28,2

# qhasm:   finalization_stack = finalization
# asm 1: stw <finalization=int64#25,>finalization_stack=stack32#11
# asm 2: stw <finalization=28,>finalization_stack=40(1)
stw 28,40(1)

# qhasm:   in_stack = in
# asm 1: std <in=int64#2,>in_stack=stack64#21
# asm 2: std <in=4,>in_stack=256(1)
std 4,256(1)

# qhasm:   inlen_stack = inlen
# asm 1: std <inlen=int64#3,>inlen_stack=stack64#20
# asm 2: std <inlen=5,>inlen_stack=248(1)
std 5,248(1)

# qhasm: goto morerounds
b .label.morerounds

# qhasm: finalization2:
.label.finalization2:

# qhasm:   out = out_stack
# asm 1: ld >out=int64#2,<out_stack=stack64#19
# asm 2: ld >out=4,<out_stack=240(1)
ld 4,240(1)

# qhasm:   *(swapendian uint32 *) out = x00
# asm 1: stwbrx <x00=int64#18,0,<out=int64#2
# asm 2: stwbrx <x00=21,0,<out=4
stwbrx 21,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x01
# asm 1: stwbrx <x01=int64#19,0,<out=int64#2
# asm 2: stwbrx <x01=22,0,<out=4
stwbrx 22,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x02
# asm 1: stwbrx <x02=int64#20,0,<out=int64#2
# asm 2: stwbrx <x02=23,0,<out=4
stwbrx 23,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x03
# asm 1: stwbrx <x03=int64#21,0,<out=int64#2
# asm 2: stwbrx <x03=24,0,<out=4
stwbrx 24,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x04
# asm 1: stwbrx <x04=int64#22,0,<out=int64#2
# asm 2: stwbrx <x04=25,0,<out=4
stwbrx 25,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x05
# asm 1: stwbrx <x05=int64#23,0,<out=int64#2
# asm 2: stwbrx <x05=26,0,<out=4
stwbrx 26,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x06
# asm 1: stwbrx <x06=int64#24,0,<out=int64#2
# asm 2: stwbrx <x06=27,0,<out=4
stwbrx 27,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   *(swapendian uint32 *) out = x07
# asm 1: stwbrx <x07=int64#4,0,<out=int64#2
# asm 2: stwbrx <x07=6,0,<out=4
stwbrx 6,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#2,<out=int64#2,4
# asm 2: addi >out=4,<out=4,4
addi 4,4,4

# qhasm:   x0b = x0b_stack
# asm 1: lwz >x0b=int64#3,<x0b_stack=stack32#1
# asm 2: lwz >x0b=5,<x0b_stack=0(1)
lwz 5,0(1)

# qhasm:   x0c = x0c_stack
# asm 1: lwz >x0c=int64#4,<x0c_stack=stack32#2
# asm 2: lwz >x0c=6,<x0c_stack=4(1)
lwz 6,4(1)

# qhasm:   *(swapendian uint32 *) out = x08
# asm 1: stwbrx <x08=int64#1,0,<out=int64#2
# asm 2: stwbrx <x08=3,0,<out=4
stwbrx 3,0,4

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#2,4
# asm 2: addi >out=3,<out=4,4
addi 3,4,4

# qhasm:   *(swapendian uint32 *) out = x09
# asm 1: stwbrx <x09=int64#5,0,<out=int64#1
# asm 2: stwbrx <x09=7,0,<out=3
stwbrx 7,0,3

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0a
# asm 1: stwbrx <x0a=int64#6,0,<out=int64#1
# asm 2: stwbrx <x0a=8,0,<out=3
stwbrx 8,0,3

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0b
# asm 1: stwbrx <x0b=int64#3,0,<out=int64#1
# asm 2: stwbrx <x0b=5,0,<out=3
stwbrx 5,0,3

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0c
# asm 1: stwbrx <x0c=int64#4,0,<out=int64#1
# asm 2: stwbrx <x0c=6,0,<out=3
stwbrx 6,0,3

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0d
# asm 1: stwbrx <x0d=int64#9,0,<out=int64#1
# asm 2: stwbrx <x0d=11,0,<out=3
stwbrx 11,0,3

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0e
# asm 1: stwbrx <x0e=int64#10,0,<out=int64#1
# asm 2: stwbrx <x0e=12,0,<out=3
stwbrx 12,0,3

# qhasm:   out += 4
# asm 1: addi >out=int64#1,<out=int64#1,4
# asm 2: addi >out=3,<out=3,4
addi 3,3,4

# qhasm:   *(swapendian uint32 *) out = x0f
# asm 1: stwbrx <x0f=int64#11,0,<out=int64#1
# asm 2: stwbrx <x0f=14,0,<out=3
stwbrx 14,0,3

# qhasm:   result = 0
# asm 1: li >result=int64#1,0
# asm 2: li >result=3,0
li 3,0

# qhasm: i12 = i12_stack
# asm 1: ld >i12=int64#11,<i12_stack=stack64#1
# asm 2: ld >i12=14,<i12_stack=96(1)
ld 14,96(1)

# qhasm: i13 = i13_stack
# asm 1: ld >i13=int64#12,<i13_stack=stack64#2
# asm 2: ld >i13=15,<i13_stack=104(1)
ld 15,104(1)

# qhasm: i14 = i14_stack
# asm 1: ld >i14=int64#13,<i14_stack=stack64#3
# asm 2: ld >i14=16,<i14_stack=112(1)
ld 16,112(1)

# qhasm: i15 = i15_stack
# asm 1: ld >i15=int64#14,<i15_stack=stack64#4
# asm 2: ld >i15=17,<i15_stack=120(1)
ld 17,120(1)

# qhasm: i16 = i16_stack
# asm 1: ld >i16=int64#15,<i16_stack=stack64#5
# asm 2: ld >i16=18,<i16_stack=128(1)
ld 18,128(1)

# qhasm: i17 = i17_stack
# asm 1: ld >i17=int64#16,<i17_stack=stack64#6
# asm 2: ld >i17=19,<i17_stack=136(1)
ld 19,136(1)

# qhasm: i18 = i18_stack
# asm 1: ld >i18=int64#17,<i18_stack=stack64#7
# asm 2: ld >i18=20,<i18_stack=144(1)
ld 20,144(1)

# qhasm: i19 = i19_stack
# asm 1: ld >i19=int64#18,<i19_stack=stack64#8
# asm 2: ld >i19=21,<i19_stack=152(1)
ld 21,152(1)

# qhasm: i20 = i20_stack
# asm 1: ld >i20=int64#19,<i20_stack=stack64#9
# asm 2: ld >i20=22,<i20_stack=160(1)
ld 22,160(1)

# qhasm: i21 = i21_stack
# asm 1: ld >i21=int64#20,<i21_stack=stack64#10
# asm 2: ld >i21=23,<i21_stack=168(1)
ld 23,168(1)

# qhasm: i22 = i22_stack
# asm 1: ld >i22=int64#21,<i22_stack=stack64#11
# asm 2: ld >i22=24,<i22_stack=176(1)
ld 24,176(1)

# qhasm: i23 = i23_stack
# asm 1: ld >i23=int64#22,<i23_stack=stack64#12
# asm 2: ld >i23=25,<i23_stack=184(1)
ld 25,184(1)

# qhasm: i24 = i24_stack
# asm 1: ld >i24=int64#23,<i24_stack=stack64#13
# asm 2: ld >i24=26,<i24_stack=192(1)
ld 26,192(1)

# qhasm: i25 = i25_stack
# asm 1: ld >i25=int64#24,<i25_stack=stack64#14
# asm 2: ld >i25=27,<i25_stack=200(1)
ld 27,200(1)

# qhasm: i26 = i26_stack
# asm 1: ld >i26=int64#25,<i26_stack=stack64#15
# asm 2: ld >i26=28,<i26_stack=208(1)
ld 28,208(1)

# qhasm: i27 = i27_stack
# asm 1: ld >i27=int64#26,<i27_stack=stack64#16
# asm 2: ld >i27=29,<i27_stack=216(1)
ld 29,216(1)

# qhasm: i28 = i28_stack
# asm 1: ld >i28=int64#27,<i28_stack=stack64#17
# asm 2: ld >i28=30,<i28_stack=224(1)
ld 30,224(1)

# qhasm: i29 = i29_stack
# asm 1: ld >i29=int64#28,<i29_stack=stack64#18
# asm 2: ld >i29=31,<i29_stack=232(1)
ld 31,232(1)

# qhasm: leave
addi 1,1,400
blr
