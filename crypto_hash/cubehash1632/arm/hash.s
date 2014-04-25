
# qhasm: int32 out

# qhasm: int32 in

# qhasm: int32 inlenlow

# qhasm: int32 inlenhigh

# qhasm: int32 result

# qhasm: input out

# qhasm: input in

# qhasm: input inlenlow

# qhasm: input inlenhigh

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

# qhasm: stack32 x03_stack

# qhasm: stack32 x04_stack

# qhasm: stack32 x05_stack

# qhasm: stack32 x06_stack

# qhasm: stack32 x07_stack

# qhasm: stack32 x08_stack

# qhasm: stack32 x09_stack

# qhasm: stack32 x0a_stack

# qhasm: stack32 x0b_stack

# qhasm: stack32 x0c_stack

# qhasm: stack32 x0d_stack

# qhasm: stack32 x0e_stack

# qhasm: stack32 x0f_stack

# qhasm: stack32 x10_stack

# qhasm: stack32 x11_stack

# qhasm: stack32 x12_stack

# qhasm: stack32 x13_stack

# qhasm: stack32 x14_stack

# qhasm: stack32 x15_stack

# qhasm: stack32 x16_stack

# qhasm: stack32 x17_stack

# qhasm: stack32 x18_stack

# qhasm: stack32 x19_stack

# qhasm: stack32 x1a_stack

# qhasm: stack32 x1b_stack

# qhasm: stack32 x1c_stack

# qhasm: stack32 x1d_stack

# qhasm: stack32 x1e_stack

# qhasm: stack32 x1f_stack

# qhasm: enter crypto_hash_cubehash1632_arm
.text
.align 2
.global _crypto_hash_cubehash1632_arm
.global crypto_hash_cubehash1632_arm
.type _crypto_hash_cubehash1632_arm STT_FUNC
.type crypto_hash_cubehash1632_arm STT_FUNC
_crypto_hash_cubehash1632_arm:
crypto_hash_cubehash1632_arm:
stmfd sp!,{r4,r5,r6,r7,r8,r9,sl,fp,lr}
sub sp,sp,#224

# qhasm:   out_stack = out
# asm 1: str <out=int32#1,>out_stack=stack32#1
# asm 2: str <out=r0,>out_stack=[sp,#0]
str r0,[sp,#0]

# qhasm:   x08 = 0x4d42c787
# asm 1: ldr >x08=int32#1,=0x4d42c787
# asm 2: ldr >x08=r0,=0x4d42c787
ldr r0,=0x4d42c787

# qhasm:   x09 = 0xa647a8b3
# asm 1: ldr >x09=int32#5,=0xa647a8b3
# asm 2: ldr >x09=r4,=0xa647a8b3
ldr r4,=0xa647a8b3

# qhasm:   x0a = 0x97cf0bef
# asm 1: ldr >x0a=int32#6,=0x97cf0bef
# asm 2: ldr >x0a=r5,=0x97cf0bef
ldr r5,=0x97cf0bef

# qhasm:   x0b = 0x825b4537
# asm 1: ldr >x0b=int32#7,=0x825b4537
# asm 2: ldr >x0b=r6,=0x825b4537
ldr r6,=0x825b4537

# qhasm:   x0c = 0xeef864d2
# asm 1: ldr >x0c=int32#8,=0xeef864d2
# asm 2: ldr >x0c=r7,=0xeef864d2
ldr r7,=0xeef864d2

# qhasm:   x0d = 0xf22090c4
# asm 1: ldr >x0d=int32#9,=0xf22090c4
# asm 2: ldr >x0d=r8,=0xf22090c4
ldr r8,=0xf22090c4

# qhasm:   x0e = 0xd0e5cd33
# asm 1: ldr >x0e=int32#10,=0xd0e5cd33
# asm 2: ldr >x0e=r9,=0xd0e5cd33
ldr r9,=0xd0e5cd33

# qhasm:   x0f = 0xa23911ae
# asm 1: ldr >x0f=int32#11,=0xa23911ae
# asm 2: ldr >x0f=r10,=0xa23911ae
ldr r10,=0xa23911ae

# qhasm:   x08_stack = x08
# asm 1: str <x08=int32#1,>x08_stack=stack32#2
# asm 2: str <x08=r0,>x08_stack=[sp,#4]
str r0,[sp,#4]

# qhasm:   x09_stack = x09
# asm 1: str <x09=int32#5,>x09_stack=stack32#3
# asm 2: str <x09=r4,>x09_stack=[sp,#8]
str r4,[sp,#8]

# qhasm:   x0b_stack = x0b
# asm 1: str <x0b=int32#7,>x0b_stack=stack32#4
# asm 2: str <x0b=r6,>x0b_stack=[sp,#12]
str r6,[sp,#12]

# qhasm:   x0c_stack = x0c
# asm 1: str <x0c=int32#8,>x0c_stack=stack32#5
# asm 2: str <x0c=r7,>x0c_stack=[sp,#16]
str r7,[sp,#16]

# qhasm:   x0d_stack = x0d
# asm 1: str <x0d=int32#9,>x0d_stack=stack32#6
# asm 2: str <x0d=r8,>x0d_stack=[sp,#20]
str r8,[sp,#20]

# qhasm:   x0e_stack = x0e
# asm 1: str <x0e=int32#10,>x0e_stack=stack32#7
# asm 2: str <x0e=r9,>x0e_stack=[sp,#24]
str r9,[sp,#24]

# qhasm:   x0f_stack = x0f
# asm 1: str <x0f=int32#11,>x0f_stack=stack32#8
# asm 2: str <x0f=r10,>x0f_stack=[sp,#28]
str r10,[sp,#28]

# qhasm:   x10 = 0xfcd398d9
# asm 1: ldr >x10=int32#1,=0xfcd398d9
# asm 2: ldr >x10=r0,=0xfcd398d9
ldr r0,=0xfcd398d9

# qhasm:   x11 = 0x148fe485
# asm 1: ldr >x11=int32#5,=0x148fe485
# asm 2: ldr >x11=r4,=0x148fe485
ldr r4,=0x148fe485

# qhasm:   x12 = 0x1b017bef
# asm 1: ldr >x12=int32#7,=0x1b017bef
# asm 2: ldr >x12=r6,=0x1b017bef
ldr r6,=0x1b017bef

# qhasm:   x13 = 0xb6444532
# asm 1: ldr >x13=int32#8,=0xb6444532
# asm 2: ldr >x13=r7,=0xb6444532
ldr r7,=0xb6444532

# qhasm:   x14 = 0x6a536159
# asm 1: ldr >x14=int32#9,=0x6a536159
# asm 2: ldr >x14=r8,=0x6a536159
ldr r8,=0x6a536159

# qhasm:   x15 = 0x2ff5781c
# asm 1: ldr >x15=int32#10,=0x2ff5781c
# asm 2: ldr >x15=r9,=0x2ff5781c
ldr r9,=0x2ff5781c

# qhasm:   x16 = 0x91fa7934
# asm 1: ldr >x16=int32#11,=0x91fa7934
# asm 2: ldr >x16=r10,=0x91fa7934
ldr r10,=0x91fa7934

# qhasm:   x17 = 0x0dbadea9
# asm 1: ldr >x17=int32#12,=0x0dbadea9
# asm 2: ldr >x17=r11,=0x0dbadea9
ldr r11,=0x0dbadea9

# qhasm:   x10_stack = x10
# asm 1: str <x10=int32#1,>x10_stack=stack32#9
# asm 2: str <x10=r0,>x10_stack=[sp,#32]
str r0,[sp,#32]

# qhasm:   x11_stack = x11
# asm 1: str <x11=int32#5,>x11_stack=stack32#10
# asm 2: str <x11=r4,>x11_stack=[sp,#36]
str r4,[sp,#36]

# qhasm:   x12_stack = x12
# asm 1: str <x12=int32#7,>x12_stack=stack32#11
# asm 2: str <x12=r6,>x12_stack=[sp,#40]
str r6,[sp,#40]

# qhasm:   x13_stack = x13
# asm 1: str <x13=int32#8,>x13_stack=stack32#12
# asm 2: str <x13=r7,>x13_stack=[sp,#44]
str r7,[sp,#44]

# qhasm:   x14_stack = x14
# asm 1: str <x14=int32#9,>x14_stack=stack32#13
# asm 2: str <x14=r8,>x14_stack=[sp,#48]
str r8,[sp,#48]

# qhasm:   x15_stack = x15
# asm 1: str <x15=int32#10,>x15_stack=stack32#14
# asm 2: str <x15=r9,>x15_stack=[sp,#52]
str r9,[sp,#52]

# qhasm:   x16_stack = x16
# asm 1: str <x16=int32#11,>x16_stack=stack32#15
# asm 2: str <x16=r10,>x16_stack=[sp,#56]
str r10,[sp,#56]

# qhasm:   x17_stack = x17
# asm 1: str <x17=int32#12,>x17_stack=stack32#16
# asm 2: str <x17=r11,>x17_stack=[sp,#60]
str r11,[sp,#60]

# qhasm:   x18 = 0xd65c8a2b
# asm 1: ldr >x18=int32#1,=0xd65c8a2b
# asm 2: ldr >x18=r0,=0xd65c8a2b
ldr r0,=0xd65c8a2b

# qhasm:   x19 = 0xa5a70e75
# asm 1: ldr >x19=int32#5,=0xa5a70e75
# asm 2: ldr >x19=r4,=0xa5a70e75
ldr r4,=0xa5a70e75

# qhasm:   x1a = 0xb1c62456
# asm 1: ldr >x1a=int32#7,=0xb1c62456
# asm 2: ldr >x1a=r6,=0xb1c62456
ldr r6,=0xb1c62456

# qhasm:   x1b = 0xbc796576
# asm 1: ldr >x1b=int32#8,=0xbc796576
# asm 2: ldr >x1b=r7,=0xbc796576
ldr r7,=0xbc796576

# qhasm:   x1c = 0x1921c8f7
# asm 1: ldr >x1c=int32#9,=0x1921c8f7
# asm 2: ldr >x1c=r8,=0x1921c8f7
ldr r8,=0x1921c8f7

# qhasm:   x1d = 0xe7989af1
# asm 1: ldr >x1d=int32#10,=0xe7989af1
# asm 2: ldr >x1d=r9,=0xe7989af1
ldr r9,=0xe7989af1

# qhasm:   x1e = 0x7795d246
# asm 1: ldr >x1e=int32#11,=0x7795d246
# asm 2: ldr >x1e=r10,=0x7795d246
ldr r10,=0x7795d246

# qhasm:   x1f = 0xd43e3b44
# asm 1: ldr >x1f=int32#12,=0xd43e3b44
# asm 2: ldr >x1f=r11,=0xd43e3b44
ldr r11,=0xd43e3b44

# qhasm:   x18_stack = x18
# asm 1: str <x18=int32#1,>x18_stack=stack32#17
# asm 2: str <x18=r0,>x18_stack=[sp,#64]
str r0,[sp,#64]

# qhasm:   x19_stack = x19
# asm 1: str <x19=int32#5,>x19_stack=stack32#18
# asm 2: str <x19=r4,>x19_stack=[sp,#68]
str r4,[sp,#68]

# qhasm:   x1a_stack = x1a
# asm 1: str <x1a=int32#7,>x1a_stack=stack32#19
# asm 2: str <x1a=r6,>x1a_stack=[sp,#72]
str r6,[sp,#72]

# qhasm:   x1b_stack = x1b
# asm 1: str <x1b=int32#8,>x1b_stack=stack32#20
# asm 2: str <x1b=r7,>x1b_stack=[sp,#76]
str r7,[sp,#76]

# qhasm:   x1c_stack = x1c
# asm 1: str <x1c=int32#9,>x1c_stack=stack32#21
# asm 2: str <x1c=r8,>x1c_stack=[sp,#80]
str r8,[sp,#80]

# qhasm:   x1d_stack = x1d
# asm 1: str <x1d=int32#10,>x1d_stack=stack32#22
# asm 2: str <x1d=r9,>x1d_stack=[sp,#84]
str r9,[sp,#84]

# qhasm:   x1e_stack = x1e
# asm 1: str <x1e=int32#11,>x1e_stack=stack32#23
# asm 2: str <x1e=r10,>x1e_stack=[sp,#88]
str r10,[sp,#88]

# qhasm:   x1f_stack = x1f
# asm 1: str <x1f=int32#12,>x1f_stack=stack32#24
# asm 2: str <x1f=r11,>x1f_stack=[sp,#92]
str r11,[sp,#92]

# qhasm:   x00 = 0x2aea2a61
# asm 1: ldr >x00=int32#1,=0x2aea2a61
# asm 2: ldr >x00=r0,=0x2aea2a61
ldr r0,=0x2aea2a61

# qhasm:   x01 = 0x50f494d4
# asm 1: ldr >x01=int32#5,=0x50f494d4
# asm 2: ldr >x01=r4,=0x50f494d4
ldr r4,=0x50f494d4

# qhasm:   x02 = 0x2d538b8b
# asm 1: ldr >x02=int32#7,=0x2d538b8b
# asm 2: ldr >x02=r6,=0x2d538b8b
ldr r6,=0x2d538b8b

# qhasm:   x03 = 0x4167d83e
# asm 1: ldr >x03=int32#8,=0x4167d83e
# asm 2: ldr >x03=r7,=0x4167d83e
ldr r7,=0x4167d83e

# qhasm:   x04 = 0x3fee2313
# asm 1: ldr >x04=int32#9,=0x3fee2313
# asm 2: ldr >x04=r8,=0x3fee2313
ldr r8,=0x3fee2313

# qhasm:   x05 = 0xc701cf8c
# asm 1: ldr >x05=int32#10,=0xc701cf8c
# asm 2: ldr >x05=r9,=0xc701cf8c
ldr r9,=0xc701cf8c

# qhasm:   x06 = 0xcc39968e
# asm 1: ldr >x06=int32#11,=0xcc39968e
# asm 2: ldr >x06=r10,=0xcc39968e
ldr r10,=0xcc39968e

# qhasm:   x07 = 0x50ac5695
# asm 1: ldr >x07=int32#12,=0x50ac5695
# asm 2: ldr >x07=r11,=0x50ac5695
ldr r11,=0x50ac5695

# qhasm:   x03_stack = x03
# asm 1: str <x03=int32#8,>x03_stack=stack32#25
# asm 2: str <x03=r7,>x03_stack=[sp,#96]
str r7,[sp,#96]

# qhasm:   x04_stack = x04
# asm 1: str <x04=int32#9,>x04_stack=stack32#26
# asm 2: str <x04=r8,>x04_stack=[sp,#100]
str r8,[sp,#100]

# qhasm:   x05_stack = x05
# asm 1: str <x05=int32#10,>x05_stack=stack32#27
# asm 2: str <x05=r9,>x05_stack=[sp,#104]
str r9,[sp,#104]

# qhasm:   x06_stack = x06
# asm 1: str <x06=int32#11,>x06_stack=stack32#28
# asm 2: str <x06=r10,>x06_stack=[sp,#108]
str r10,[sp,#108]

# qhasm:   x07_stack = x07
# asm 1: str <x07=int32#12,>x07_stack=stack32#29
# asm 2: str <x07=r11,>x07_stack=[sp,#112]
str r11,[sp,#112]

# qhasm:   finalization = 0
# asm 1: ldr >finalization=int32#8,=0
# asm 2: ldr >finalization=r7,=0
ldr r7,=0

# qhasm: checkinlen:
._checkinlen:

# qhasm:                   unsigned<? inlenlow - 32
# asm 1: cmp <inlenlow=int32#3,#32
# asm 2: cmp <inlenlow=r2,#32
cmp r2,#32

# qhasm: goto mainloop if !unsigned<
bhs ._mainloop

# qhasm:                      =? inlenhigh - 0
# asm 1: cmp <inlenhigh=int32#4,#0
# asm 2: cmp <inlenhigh=r3,#0
cmp r3,#0

# qhasm: goto inlenbelow32 if =
beq ._inlenbelow32

# qhasm: mainloop:
._mainloop:

# qhasm:   carry? inlenlow -= 32
# asm 1: subs <inlenlow=int32#3,<inlenlow=int32#3,#32
# asm 2: subs <inlenlow=r2,<inlenlow=r2,#32
subs r2,r2,#32

# qhasm:   inlenhigh -= 0 - carry
# asm 1: sbc <inlenhigh=int32#4,<inlenhigh=int32#4,#0
# asm 2: sbc <inlenhigh=r3,<inlenhigh=r3,#0
sbc r3,r3,#0

# qhasm:   r = 16
# asm 1: ldr >r=int32#9,=16
# asm 2: ldr >r=r8,=16
ldr r8,=16

# qhasm:   finalization_stack = finalization
# asm 1: str <finalization=int32#8,>finalization_stack=stack32#30
# asm 2: str <finalization=r7,>finalization_stack=[sp,#116]
str r7,[sp,#116]

# qhasm:   inlenlow_stack = inlenlow
# asm 1: str <inlenlow=int32#3,>inlenlow_stack=stack32#31
# asm 2: str <inlenlow=r2,>inlenlow_stack=[sp,#120]
str r2,[sp,#120]

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: str <inlenhigh=int32#4,>inlenhigh_stack=stack32#32
# asm 2: str <inlenhigh=r3,>inlenhigh_stack=[sp,#124]
str r3,[sp,#124]

# qhasm:   x03 = x03_stack
# asm 1: ldr >x03=int32#3,<x03_stack=stack32#25
# asm 2: ldr >x03=r2,<x03_stack=[sp,#96]
ldr r2,[sp,#96]

# qhasm:   y00 = *(uint32 *) in; in += 4
# asm 1: ldr >y00=int32#4,[<in=int32#2],#4
# asm 2: ldr >y00=r3,[<in=r1],#4
ldr r3,[r1],#4

# qhasm:   y01 = *(uint32 *) in; in += 4
# asm 1: ldr >y01=int32#8,[<in=int32#2],#4
# asm 2: ldr >y01=r7,[<in=r1],#4
ldr r7,[r1],#4

# qhasm:   y02 = *(uint32 *) in; in += 4
# asm 1: ldr >y02=int32#10,[<in=int32#2],#4
# asm 2: ldr >y02=r9,[<in=r1],#4
ldr r9,[r1],#4

# qhasm:   y03 = *(uint32 *) in; in += 4
# asm 1: ldr >y03=int32#11,[<in=int32#2],#4
# asm 2: ldr >y03=r10,[<in=r1],#4
ldr r10,[r1],#4

# qhasm:   x00 ^= y00
# asm 1: eor <x00=int32#1,<x00=int32#1,<y00=int32#4
# asm 2: eor <x00=r0,<x00=r0,<y00=r3
eor r0,r0,r3

# qhasm:   x01 ^= y01
# asm 1: eor <x01=int32#5,<x01=int32#5,<y01=int32#8
# asm 2: eor <x01=r4,<x01=r4,<y01=r7
eor r4,r4,r7

# qhasm:   x02 ^= y02
# asm 1: eor <x02=int32#7,<x02=int32#7,<y02=int32#10
# asm 2: eor <x02=r6,<x02=r6,<y02=r9
eor r6,r6,r9

# qhasm:   x03 ^= y03
# asm 1: eor <x03=int32#3,<x03=int32#3,<y03=int32#11
# asm 2: eor <x03=r2,<x03=r2,<y03=r10
eor r2,r2,r10

# qhasm:   x03_stack = x03
# asm 1: str <x03=int32#3,>x03_stack=stack32#25
# asm 2: str <x03=r2,>x03_stack=[sp,#96]
str r2,[sp,#96]

# qhasm:   x04 = x04_stack
# asm 1: ldr >x04=int32#3,<x04_stack=stack32#26
# asm 2: ldr >x04=r2,<x04_stack=[sp,#100]
ldr r2,[sp,#100]

# qhasm:   x05 = x05_stack
# asm 1: ldr >x05=int32#4,<x05_stack=stack32#27
# asm 2: ldr >x05=r3,<x05_stack=[sp,#104]
ldr r3,[sp,#104]

# qhasm:   y04 = *(uint32 *) in; in += 4
# asm 1: ldr >y04=int32#8,[<in=int32#2],#4
# asm 2: ldr >y04=r7,[<in=r1],#4
ldr r7,[r1],#4

# qhasm:   y05 = *(uint32 *) in; in += 4
# asm 1: ldr >y05=int32#10,[<in=int32#2],#4
# asm 2: ldr >y05=r9,[<in=r1],#4
ldr r9,[r1],#4

# qhasm:   x04 ^= y04
# asm 1: eor <x04=int32#3,<x04=int32#3,<y04=int32#8
# asm 2: eor <x04=r2,<x04=r2,<y04=r7
eor r2,r2,r7

# qhasm:   x05 ^= y05
# asm 1: eor <x05=int32#4,<x05=int32#4,<y05=int32#10
# asm 2: eor <x05=r3,<x05=r3,<y05=r9
eor r3,r3,r9

# qhasm:   x04_stack = x04
# asm 1: str <x04=int32#3,>x04_stack=stack32#26
# asm 2: str <x04=r2,>x04_stack=[sp,#100]
str r2,[sp,#100]

# qhasm:   x05_stack = x05
# asm 1: str <x05=int32#4,>x05_stack=stack32#27
# asm 2: str <x05=r3,>x05_stack=[sp,#104]
str r3,[sp,#104]

# qhasm:   x06 = x06_stack
# asm 1: ldr >x06=int32#3,<x06_stack=stack32#28
# asm 2: ldr >x06=r2,<x06_stack=[sp,#108]
ldr r2,[sp,#108]

# qhasm:   x07 = x07_stack
# asm 1: ldr >x07=int32#4,<x07_stack=stack32#29
# asm 2: ldr >x07=r3,<x07_stack=[sp,#112]
ldr r3,[sp,#112]

# qhasm:   y06 = *(uint32 *) in; in += 4
# asm 1: ldr >y06=int32#8,[<in=int32#2],#4
# asm 2: ldr >y06=r7,[<in=r1],#4
ldr r7,[r1],#4

# qhasm:   y07 = *(uint32 *) in; in += 4
# asm 1: ldr >y07=int32#10,[<in=int32#2],#4
# asm 2: ldr >y07=r9,[<in=r1],#4
ldr r9,[r1],#4

# qhasm:   x06 ^= y06
# asm 1: eor <x06=int32#3,<x06=int32#3,<y06=int32#8
# asm 2: eor <x06=r2,<x06=r2,<y06=r7
eor r2,r2,r7

# qhasm:   x07 ^= y07
# asm 1: eor <x07=int32#4,<x07=int32#4,<y07=int32#10
# asm 2: eor <x07=r3,<x07=r3,<y07=r9
eor r3,r3,r9

# qhasm:   x06_stack = x06
# asm 1: str <x06=int32#3,>x06_stack=stack32#28
# asm 2: str <x06=r2,>x06_stack=[sp,#108]
str r2,[sp,#108]

# qhasm:   x07_stack = x07
# asm 1: str <x07=int32#4,>x07_stack=stack32#29
# asm 2: str <x07=r3,>x07_stack=[sp,#112]
str r3,[sp,#112]

# qhasm:   in_stack = in
# asm 1: str <in=int32#2,>in_stack=stack32#33
# asm 2: str <in=r1,>in_stack=[sp,#128]
str r1,[sp,#128]

# qhasm: morerounds:
._morerounds:

# qhasm: r_stack = r
# asm 1: str <r=int32#9,>r_stack=stack32#34
# asm 2: str <r=r8,>r_stack=[sp,#132]
str r8,[sp,#132]

# qhasm:   x08 = x08_stack
# asm 1: ldr >x08=int32#2,<x08_stack=stack32#2
# asm 2: ldr >x08=r1,<x08_stack=[sp,#4]
ldr r1,[sp,#4]

# qhasm:   x10 = x10_stack
# asm 1: ldr >x10=int32#3,<x10_stack=stack32#9
# asm 2: ldr >x10=r2,<x10_stack=[sp,#32]
ldr r2,[sp,#32]

# qhasm:   x12 = x12_stack
# asm 1: ldr >x12=int32#4,<x12_stack=stack32#11
# asm 2: ldr >x12=r3,<x12_stack=[sp,#40]
ldr r3,[sp,#40]

# qhasm:   x18 = x18_stack
# asm 1: ldr >x18=int32#8,<x18_stack=stack32#17
# asm 2: ldr >x18=r7,<x18_stack=[sp,#64]
ldr r7,[sp,#64]

# qhasm:   x1a = x1a_stack
# asm 1: ldr >x1a=int32#9,<x1a_stack=stack32#19
# asm 2: ldr >x1a=r8,<x1a_stack=[sp,#72]
ldr r8,[sp,#72]

# qhasm:   x10 += x00
# asm 1: add <x10=int32#3,<x10=int32#3,<x00=int32#1
# asm 2: add <x10=r2,<x10=r2,<x00=r0
add r2,r2,r0

# qhasm:   x12 += x02
# asm 1: add <x12=int32#4,<x12=int32#4,<x02=int32#7
# asm 2: add <x12=r3,<x12=r3,<x02=r6
add r3,r3,r6

# qhasm:   x18 += x08
# asm 1: add <x18=int32#8,<x18=int32#8,<x08=int32#2
# asm 2: add <x18=r7,<x18=r7,<x08=r1
add r7,r7,r1

# qhasm:   x1a += x0a
# asm 1: add <x1a=int32#9,<x1a=int32#9,<x0a=int32#6
# asm 2: add <x1a=r8,<x1a=r8,<x0a=r5
add r8,r8,r5

# qhasm:   x00 = x18 ^ (x00 >>> 25)
# asm 1: eor >x00=int32#1,<x18=int32#8,<x00=int32#1,ROR #25
# asm 2: eor >x00=r0,<x18=r7,<x00=r0,ROR #25
eor r0,r7,r0,ROR #25

# qhasm:   x02 = x1a ^ (x02 >>> 25)
# asm 1: eor >x02=int32#7,<x1a=int32#9,<x02=int32#7,ROR #25
# asm 2: eor >x02=r6,<x1a=r8,<x02=r6,ROR #25
eor r6,r8,r6,ROR #25

# qhasm:   x08 = x10 ^ (x08 >>> 25)
# asm 1: eor >x08=int32#2,<x10=int32#3,<x08=int32#2,ROR #25
# asm 2: eor >x08=r1,<x10=r2,<x08=r1,ROR #25
eor r1,r2,r1,ROR #25

# qhasm:   x0a = x12 ^ (x0a >>> 25)
# asm 1: eor >x0a=int32#6,<x12=int32#4,<x0a=int32#6,ROR #25
# asm 2: eor >x0a=r5,<x12=r3,<x0a=r5,ROR #25
eor r5,r3,r5,ROR #25

# qhasm:   x1a += x00
# asm 1: add <x1a=int32#9,<x1a=int32#9,<x00=int32#1
# asm 2: add <x1a=r8,<x1a=r8,<x00=r0
add r8,r8,r0

# qhasm:   x18 += x02
# asm 1: add <x18=int32#8,<x18=int32#8,<x02=int32#7
# asm 2: add <x18=r7,<x18=r7,<x02=r6
add r7,r7,r6

# qhasm:   x12 += x08
# asm 1: add <x12=int32#4,<x12=int32#4,<x08=int32#2
# asm 2: add <x12=r3,<x12=r3,<x08=r1
add r3,r3,r1

# qhasm:   x10 += x0a
# asm 1: add <x10=int32#3,<x10=int32#3,<x0a=int32#6
# asm 2: add <x10=r2,<x10=r2,<x0a=r5
add r2,r2,r5

# qhasm:   x02_stack = x02
# asm 1: str <x02=int32#7,>x02_stack=stack32#2
# asm 2: str <x02=r6,>x02_stack=[sp,#4]
str r6,[sp,#4]

# qhasm:   x08_stack = x08
# asm 1: str <x08=int32#2,>x08_stack=stack32#9
# asm 2: str <x08=r1,>x08_stack=[sp,#32]
str r1,[sp,#32]

# qhasm:   x0a_stack = x0a
# asm 1: str <x0a=int32#6,>x0a_stack=stack32#11
# asm 2: str <x0a=r5,>x0a_stack=[sp,#40]
str r5,[sp,#40]

# qhasm:   x10_stack = x10
# asm 1: str <x10=int32#3,>x10_stack=stack32#17
# asm 2: str <x10=r2,>x10_stack=[sp,#64]
str r2,[sp,#64]

# qhasm:   x12_stack = x12
# asm 1: str <x12=int32#4,>x12_stack=stack32#19
# asm 2: str <x12=r3,>x12_stack=[sp,#72]
str r3,[sp,#72]

# qhasm:   x18_stack = x18
# asm 1: str <x18=int32#8,>x18_stack=stack32#35
# asm 2: str <x18=r7,>x18_stack=[sp,#136]
str r7,[sp,#136]

# qhasm:   x1a_stack = x1a
# asm 1: str <x1a=int32#9,>x1a_stack=stack32#36
# asm 2: str <x1a=r8,>x1a_stack=[sp,#140]
str r8,[sp,#140]

# qhasm:   x04 = x04_stack
# asm 1: ldr >x04=int32#2,<x04_stack=stack32#26
# asm 2: ldr >x04=r1,<x04_stack=[sp,#100]
ldr r1,[sp,#100]

# qhasm:   x06 = x06_stack
# asm 1: ldr >x06=int32#3,<x06_stack=stack32#28
# asm 2: ldr >x06=r2,<x06_stack=[sp,#108]
ldr r2,[sp,#108]

# qhasm:   x0c = x0c_stack
# asm 1: ldr >x0c=int32#4,<x0c_stack=stack32#5
# asm 2: ldr >x0c=r3,<x0c_stack=[sp,#16]
ldr r3,[sp,#16]

# qhasm:   x0e = x0e_stack
# asm 1: ldr >x0e=int32#6,<x0e_stack=stack32#7
# asm 2: ldr >x0e=r5,<x0e_stack=[sp,#24]
ldr r5,[sp,#24]

# qhasm:   x14 = x14_stack
# asm 1: ldr >x14=int32#7,<x14_stack=stack32#13
# asm 2: ldr >x14=r6,<x14_stack=[sp,#48]
ldr r6,[sp,#48]

# qhasm:   x16 = x16_stack
# asm 1: ldr >x16=int32#8,<x16_stack=stack32#15
# asm 2: ldr >x16=r7,<x16_stack=[sp,#56]
ldr r7,[sp,#56]

# qhasm:   x1c = x1c_stack
# asm 1: ldr >x1c=int32#9,<x1c_stack=stack32#21
# asm 2: ldr >x1c=r8,<x1c_stack=[sp,#80]
ldr r8,[sp,#80]

# qhasm:   x1e = x1e_stack
# asm 1: ldr >x1e=int32#10,<x1e_stack=stack32#23
# asm 2: ldr >x1e=r9,<x1e_stack=[sp,#88]
ldr r9,[sp,#88]

# qhasm:   x14 += x04
# asm 1: add <x14=int32#7,<x14=int32#7,<x04=int32#2
# asm 2: add <x14=r6,<x14=r6,<x04=r1
add r6,r6,r1

# qhasm:   x16 += x06
# asm 1: add <x16=int32#8,<x16=int32#8,<x06=int32#3
# asm 2: add <x16=r7,<x16=r7,<x06=r2
add r7,r7,r2

# qhasm:   x1c += x0c
# asm 1: add <x1c=int32#9,<x1c=int32#9,<x0c=int32#4
# asm 2: add <x1c=r8,<x1c=r8,<x0c=r3
add r8,r8,r3

# qhasm:   x1e += x0e
# asm 1: add <x1e=int32#10,<x1e=int32#10,<x0e=int32#6
# asm 2: add <x1e=r9,<x1e=r9,<x0e=r5
add r9,r9,r5

# qhasm:   x04 = x1c ^ (x04 >>> 25)
# asm 1: eor >x04=int32#2,<x1c=int32#9,<x04=int32#2,ROR #25
# asm 2: eor >x04=r1,<x1c=r8,<x04=r1,ROR #25
eor r1,r8,r1,ROR #25

# qhasm:   x06 = x1e ^ (x06 >>> 25)
# asm 1: eor >x06=int32#3,<x1e=int32#10,<x06=int32#3,ROR #25
# asm 2: eor >x06=r2,<x1e=r9,<x06=r2,ROR #25
eor r2,r9,r2,ROR #25

# qhasm:   x0c = x14 ^ (x0c >>> 25)
# asm 1: eor >x0c=int32#4,<x14=int32#7,<x0c=int32#4,ROR #25
# asm 2: eor >x0c=r3,<x14=r6,<x0c=r3,ROR #25
eor r3,r6,r3,ROR #25

# qhasm:   x0e = x16 ^ (x0e >>> 25)
# asm 1: eor >x0e=int32#6,<x16=int32#8,<x0e=int32#6,ROR #25
# asm 2: eor >x0e=r5,<x16=r7,<x0e=r5,ROR #25
eor r5,r7,r5,ROR #25

# qhasm:   x1e += x04
# asm 1: add <x1e=int32#10,<x1e=int32#10,<x04=int32#2
# asm 2: add <x1e=r9,<x1e=r9,<x04=r1
add r9,r9,r1

# qhasm:   x1c += x06
# asm 1: add <x1c=int32#9,<x1c=int32#9,<x06=int32#3
# asm 2: add <x1c=r8,<x1c=r8,<x06=r2
add r8,r8,r2

# qhasm:   x16 += x0c
# asm 1: add <x16=int32#8,<x16=int32#8,<x0c=int32#4
# asm 2: add <x16=r7,<x16=r7,<x0c=r3
add r7,r7,r3

# qhasm:   x14 += x0e
# asm 1: add <x14=int32#7,<x14=int32#7,<x0e=int32#6
# asm 2: add <x14=r6,<x14=r6,<x0e=r5
add r6,r6,r5

# qhasm:   x04_stack = x04
# asm 1: str <x04=int32#2,>x04_stack=stack32#5
# asm 2: str <x04=r1,>x04_stack=[sp,#16]
str r1,[sp,#16]

# qhasm:   x06_stack = x06
# asm 1: str <x06=int32#3,>x06_stack=stack32#7
# asm 2: str <x06=r2,>x06_stack=[sp,#24]
str r2,[sp,#24]

# qhasm:   x0c_stack = x0c
# asm 1: str <x0c=int32#4,>x0c_stack=stack32#13
# asm 2: str <x0c=r3,>x0c_stack=[sp,#48]
str r3,[sp,#48]

# qhasm:   x0e_stack = x0e
# asm 1: str <x0e=int32#6,>x0e_stack=stack32#15
# asm 2: str <x0e=r5,>x0e_stack=[sp,#56]
str r5,[sp,#56]

# qhasm:   x14_stack = x14
# asm 1: str <x14=int32#7,>x14_stack=stack32#21
# asm 2: str <x14=r6,>x14_stack=[sp,#80]
str r6,[sp,#80]

# qhasm:   x16_stack = x16
# asm 1: str <x16=int32#8,>x16_stack=stack32#23
# asm 2: str <x16=r7,>x16_stack=[sp,#88]
str r7,[sp,#88]

# qhasm:   x1c_stack = x1c
# asm 1: str <x1c=int32#9,>x1c_stack=stack32#26
# asm 2: str <x1c=r8,>x1c_stack=[sp,#100]
str r8,[sp,#100]

# qhasm:   x1e_stack = x1e
# asm 1: str <x1e=int32#10,>x1e_stack=stack32#28
# asm 2: str <x1e=r9,>x1e_stack=[sp,#108]
str r9,[sp,#108]

# qhasm:   x03 = x03_stack
# asm 1: ldr >x03=int32#2,<x03_stack=stack32#25
# asm 2: ldr >x03=r1,<x03_stack=[sp,#96]
ldr r1,[sp,#96]

# qhasm:   x09 = x09_stack
# asm 1: ldr >x09=int32#3,<x09_stack=stack32#3
# asm 2: ldr >x09=r2,<x09_stack=[sp,#8]
ldr r2,[sp,#8]

# qhasm:   x0b = x0b_stack
# asm 1: ldr >x0b=int32#4,<x0b_stack=stack32#4
# asm 2: ldr >x0b=r3,<x0b_stack=[sp,#12]
ldr r3,[sp,#12]

# qhasm:   x11 = x11_stack
# asm 1: ldr >x11=int32#6,<x11_stack=stack32#10
# asm 2: ldr >x11=r5,<x11_stack=[sp,#36]
ldr r5,[sp,#36]

# qhasm:   x13 = x13_stack
# asm 1: ldr >x13=int32#7,<x13_stack=stack32#12
# asm 2: ldr >x13=r6,<x13_stack=[sp,#44]
ldr r6,[sp,#44]

# qhasm:   x19 = x19_stack
# asm 1: ldr >x19=int32#8,<x19_stack=stack32#18
# asm 2: ldr >x19=r7,<x19_stack=[sp,#68]
ldr r7,[sp,#68]

# qhasm:   x1b = x1b_stack
# asm 1: ldr >x1b=int32#9,<x1b_stack=stack32#20
# asm 2: ldr >x1b=r8,<x1b_stack=[sp,#76]
ldr r8,[sp,#76]

# qhasm:   x11 += x01
# asm 1: add <x11=int32#6,<x11=int32#6,<x01=int32#5
# asm 2: add <x11=r5,<x11=r5,<x01=r4
add r5,r5,r4

# qhasm:   x13 += x03
# asm 1: add <x13=int32#7,<x13=int32#7,<x03=int32#2
# asm 2: add <x13=r6,<x13=r6,<x03=r1
add r6,r6,r1

# qhasm:   x19 += x09
# asm 1: add <x19=int32#8,<x19=int32#8,<x09=int32#3
# asm 2: add <x19=r7,<x19=r7,<x09=r2
add r7,r7,r2

# qhasm:   x1b += x0b
# asm 1: add <x1b=int32#9,<x1b=int32#9,<x0b=int32#4
# asm 2: add <x1b=r8,<x1b=r8,<x0b=r3
add r8,r8,r3

# qhasm:   x01 = x19 ^ (x01 >>> 25)
# asm 1: eor >x01=int32#5,<x19=int32#8,<x01=int32#5,ROR #25
# asm 2: eor >x01=r4,<x19=r7,<x01=r4,ROR #25
eor r4,r7,r4,ROR #25

# qhasm:   x03 = x1b ^ (x03 >>> 25)
# asm 1: eor >x03=int32#2,<x1b=int32#9,<x03=int32#2,ROR #25
# asm 2: eor >x03=r1,<x1b=r8,<x03=r1,ROR #25
eor r1,r8,r1,ROR #25

# qhasm:   x09 = x11 ^ (x09 >>> 25)
# asm 1: eor >x09=int32#3,<x11=int32#6,<x09=int32#3,ROR #25
# asm 2: eor >x09=r2,<x11=r5,<x09=r2,ROR #25
eor r2,r5,r2,ROR #25

# qhasm:   x0b = x13 ^ (x0b >>> 25)
# asm 1: eor >x0b=int32#4,<x13=int32#7,<x0b=int32#4,ROR #25
# asm 2: eor >x0b=r3,<x13=r6,<x0b=r3,ROR #25
eor r3,r6,r3,ROR #25

# qhasm:   x1b += x01
# asm 1: add <x1b=int32#9,<x1b=int32#9,<x01=int32#5
# asm 2: add <x1b=r8,<x1b=r8,<x01=r4
add r8,r8,r4

# qhasm:   x19 += x03
# asm 1: add <x19=int32#8,<x19=int32#8,<x03=int32#2
# asm 2: add <x19=r7,<x19=r7,<x03=r1
add r7,r7,r1

# qhasm:   x13 += x09
# asm 1: add <x13=int32#7,<x13=int32#7,<x09=int32#3
# asm 2: add <x13=r6,<x13=r6,<x09=r2
add r6,r6,r2

# qhasm:   x11 += x0b
# asm 1: add <x11=int32#6,<x11=int32#6,<x0b=int32#4
# asm 2: add <x11=r5,<x11=r5,<x0b=r3
add r5,r5,r3

# qhasm:   x03_stack = x03
# asm 1: str <x03=int32#2,>x03_stack=stack32#3
# asm 2: str <x03=r1,>x03_stack=[sp,#8]
str r1,[sp,#8]

# qhasm:   x09_stack = x09
# asm 1: str <x09=int32#3,>x09_stack=stack32#4
# asm 2: str <x09=r2,>x09_stack=[sp,#12]
str r2,[sp,#12]

# qhasm:   x0b_stack = x0b
# asm 1: str <x0b=int32#4,>x0b_stack=stack32#10
# asm 2: str <x0b=r3,>x0b_stack=[sp,#36]
str r3,[sp,#36]

# qhasm:   x11_stack = x11
# asm 1: str <x11=int32#6,>x11_stack=stack32#12
# asm 2: str <x11=r5,>x11_stack=[sp,#44]
str r5,[sp,#44]

# qhasm:   x13_stack = x13
# asm 1: str <x13=int32#7,>x13_stack=stack32#18
# asm 2: str <x13=r6,>x13_stack=[sp,#68]
str r6,[sp,#68]

# qhasm:   x19_stack = x19
# asm 1: str <x19=int32#8,>x19_stack=stack32#20
# asm 2: str <x19=r7,>x19_stack=[sp,#76]
str r7,[sp,#76]

# qhasm:   x1b_stack = x1b
# asm 1: str <x1b=int32#9,>x1b_stack=stack32#25
# asm 2: str <x1b=r8,>x1b_stack=[sp,#96]
str r8,[sp,#96]

# qhasm:   x05 = x05_stack
# asm 1: ldr >x05=int32#2,<x05_stack=stack32#27
# asm 2: ldr >x05=r1,<x05_stack=[sp,#104]
ldr r1,[sp,#104]

# qhasm:   x07 = x07_stack
# asm 1: ldr >x07=int32#3,<x07_stack=stack32#29
# asm 2: ldr >x07=r2,<x07_stack=[sp,#112]
ldr r2,[sp,#112]

# qhasm:   x0d = x0d_stack
# asm 1: ldr >x0d=int32#4,<x0d_stack=stack32#6
# asm 2: ldr >x0d=r3,<x0d_stack=[sp,#20]
ldr r3,[sp,#20]

# qhasm:   x0f = x0f_stack
# asm 1: ldr >x0f=int32#6,<x0f_stack=stack32#8
# asm 2: ldr >x0f=r5,<x0f_stack=[sp,#28]
ldr r5,[sp,#28]

# qhasm:   x15 = x15_stack
# asm 1: ldr >x15=int32#7,<x15_stack=stack32#14
# asm 2: ldr >x15=r6,<x15_stack=[sp,#52]
ldr r6,[sp,#52]

# qhasm:   x17 = x17_stack
# asm 1: ldr >x17=int32#8,<x17_stack=stack32#16
# asm 2: ldr >x17=r7,<x17_stack=[sp,#60]
ldr r7,[sp,#60]

# qhasm:   x1d = x1d_stack
# asm 1: ldr >x1d=int32#9,<x1d_stack=stack32#22
# asm 2: ldr >x1d=r8,<x1d_stack=[sp,#84]
ldr r8,[sp,#84]

# qhasm:   x1f = x1f_stack
# asm 1: ldr >x1f=int32#10,<x1f_stack=stack32#24
# asm 2: ldr >x1f=r9,<x1f_stack=[sp,#92]
ldr r9,[sp,#92]

# qhasm:   x15 += x05
# asm 1: add <x15=int32#7,<x15=int32#7,<x05=int32#2
# asm 2: add <x15=r6,<x15=r6,<x05=r1
add r6,r6,r1

# qhasm:   x17 += x07
# asm 1: add <x17=int32#8,<x17=int32#8,<x07=int32#3
# asm 2: add <x17=r7,<x17=r7,<x07=r2
add r7,r7,r2

# qhasm:   x1d += x0d
# asm 1: add <x1d=int32#9,<x1d=int32#9,<x0d=int32#4
# asm 2: add <x1d=r8,<x1d=r8,<x0d=r3
add r8,r8,r3

# qhasm:   x1f += x0f
# asm 1: add <x1f=int32#10,<x1f=int32#10,<x0f=int32#6
# asm 2: add <x1f=r9,<x1f=r9,<x0f=r5
add r9,r9,r5

# qhasm:   x05 = x1d ^ (x05 >>> 25)
# asm 1: eor >x05=int32#2,<x1d=int32#9,<x05=int32#2,ROR #25
# asm 2: eor >x05=r1,<x1d=r8,<x05=r1,ROR #25
eor r1,r8,r1,ROR #25

# qhasm:   x07 = x1f ^ (x07 >>> 25)
# asm 1: eor >x07=int32#3,<x1f=int32#10,<x07=int32#3,ROR #25
# asm 2: eor >x07=r2,<x1f=r9,<x07=r2,ROR #25
eor r2,r9,r2,ROR #25

# qhasm:   x0d = x15 ^ (x0d >>> 25)
# asm 1: eor >x0d=int32#4,<x15=int32#7,<x0d=int32#4,ROR #25
# asm 2: eor >x0d=r3,<x15=r6,<x0d=r3,ROR #25
eor r3,r6,r3,ROR #25

# qhasm:   x0f = x17 ^ (x0f >>> 25)
# asm 1: eor >x0f=int32#6,<x17=int32#8,<x0f=int32#6,ROR #25
# asm 2: eor >x0f=r5,<x17=r7,<x0f=r5,ROR #25
eor r5,r7,r5,ROR #25

# qhasm:   x1f += x05
# asm 1: add <x1f=int32#10,<x1f=int32#10,<x05=int32#2
# asm 2: add <x1f=r9,<x1f=r9,<x05=r1
add r9,r9,r1

# qhasm:   x1d += x07
# asm 1: add <x1d=int32#9,<x1d=int32#9,<x07=int32#3
# asm 2: add <x1d=r8,<x1d=r8,<x07=r2
add r8,r8,r2

# qhasm:   x17 += x0d
# asm 1: add <x17=int32#8,<x17=int32#8,<x0d=int32#4
# asm 2: add <x17=r7,<x17=r7,<x0d=r3
add r7,r7,r3

# qhasm:   x15 += x0f
# asm 1: add <x15=int32#7,<x15=int32#7,<x0f=int32#6
# asm 2: add <x15=r6,<x15=r6,<x0f=r5
add r6,r6,r5

# qhasm:   x05_stack = x05
# asm 1: str <x05=int32#2,>x05_stack=stack32#6
# asm 2: str <x05=r1,>x05_stack=[sp,#20]
str r1,[sp,#20]

# qhasm:   x07_stack = x07
# asm 1: str <x07=int32#3,>x07_stack=stack32#8
# asm 2: str <x07=r2,>x07_stack=[sp,#28]
str r2,[sp,#28]

# qhasm:   x0d_stack = x0d
# asm 1: str <x0d=int32#4,>x0d_stack=stack32#14
# asm 2: str <x0d=r3,>x0d_stack=[sp,#52]
str r3,[sp,#52]

# qhasm:   x0f_stack = x0f
# asm 1: str <x0f=int32#6,>x0f_stack=stack32#16
# asm 2: str <x0f=r5,>x0f_stack=[sp,#60]
str r5,[sp,#60]

# qhasm:   x1e = x1e_stack
# asm 1: ldr >x1e=int32#2,<x1e_stack=stack32#28
# asm 2: ldr >x1e=r1,<x1e_stack=[sp,#108]
ldr r1,[sp,#108]

# qhasm:   x16 = x16_stack
# asm 1: ldr >x16=int32#3,<x16_stack=stack32#23
# asm 2: ldr >x16=r2,<x16_stack=[sp,#88]
ldr r2,[sp,#88]

# qhasm:   x08 = x08_stack
# asm 1: ldr >x08=int32#4,<x08_stack=stack32#9
# asm 2: ldr >x08=r3,<x08_stack=[sp,#32]
ldr r3,[sp,#32]

# qhasm:   x09 = x09_stack
# asm 1: ldr >x09=int32#6,<x09_stack=stack32#4
# asm 2: ldr >x09=r5,<x09_stack=[sp,#12]
ldr r5,[sp,#12]

# qhasm:   x15_stack = x15
# asm 1: str <x15=int32#7,>x15_stack=stack32#4
# asm 2: str <x15=r6,>x15_stack=[sp,#12]
str r6,[sp,#12]

# qhasm:   x1d_stack = x1d
# asm 1: str <x1d=int32#9,>x1d_stack=stack32#9
# asm 2: str <x1d=r8,>x1d_stack=[sp,#32]
str r8,[sp,#32]

# qhasm:   x00 = x1e ^ (x00 >>> 21)
# asm 1: eor >x00=int32#1,<x1e=int32#2,<x00=int32#1,ROR #21
# asm 2: eor >x00=r0,<x1e=r1,<x00=r0,ROR #21
eor r0,r1,r0,ROR #21

# qhasm:   x01 = x1f ^ (x01 >>> 21)
# asm 1: eor >x01=int32#5,<x1f=int32#10,<x01=int32#5,ROR #21
# asm 2: eor >x01=r4,<x1f=r9,<x01=r4,ROR #21
eor r4,r9,r4,ROR #21

# qhasm:   x08 = x16 ^ (x08 >>> 21)
# asm 1: eor >x08=int32#4,<x16=int32#3,<x08=int32#4,ROR #21
# asm 2: eor >x08=r3,<x16=r2,<x08=r3,ROR #21
eor r3,r2,r3,ROR #21

# qhasm:   x09 = x17 ^ (x09 >>> 21)
# asm 1: eor >x09=int32#6,<x17=int32#8,<x09=int32#6,ROR #21
# asm 2: eor >x09=r5,<x17=r7,<x09=r5,ROR #21
eor r5,r7,r5,ROR #21

# qhasm:   x1f += x00
# asm 1: add <x1f=int32#10,<x1f=int32#10,<x00=int32#1
# asm 2: add <x1f=r9,<x1f=r9,<x00=r0
add r9,r9,r0

# qhasm:   x1e += x01
# asm 1: add <x1e=int32#2,<x1e=int32#2,<x01=int32#5
# asm 2: add <x1e=r1,<x1e=r1,<x01=r4
add r1,r1,r4

# qhasm:   x17 += x08
# asm 1: add <x17=int32#8,<x17=int32#8,<x08=int32#4
# asm 2: add <x17=r7,<x17=r7,<x08=r3
add r7,r7,r3

# qhasm:   x16 += x09
# asm 1: add <x16=int32#3,<x16=int32#3,<x09=int32#6
# asm 2: add <x16=r2,<x16=r2,<x09=r5
add r2,r2,r5

# qhasm:   x00 = x17 ^ (x00 >>> 25)
# asm 1: eor >x00=int32#1,<x17=int32#8,<x00=int32#1,ROR #25
# asm 2: eor >x00=r0,<x17=r7,<x00=r0,ROR #25
eor r0,r7,r0,ROR #25

# qhasm:   x01 = x16 ^ (x01 >>> 25)
# asm 1: eor >x01=int32#5,<x16=int32#3,<x01=int32#5,ROR #25
# asm 2: eor >x01=r4,<x16=r2,<x01=r4,ROR #25
eor r4,r2,r4,ROR #25

# qhasm:   x08 = x1f ^ (x08 >>> 25)
# asm 1: eor >x08=int32#4,<x1f=int32#10,<x08=int32#4,ROR #25
# asm 2: eor >x08=r3,<x1f=r9,<x08=r3,ROR #25
eor r3,r9,r3,ROR #25

# qhasm:   x09 = x1e ^ (x09 >>> 25)
# asm 1: eor >x09=int32#6,<x1e=int32#2,<x09=int32#6,ROR #25
# asm 2: eor >x09=r5,<x1e=r1,<x09=r5,ROR #25
eor r5,r1,r5,ROR #25

# qhasm:   x08_stack = x08
# asm 1: str <x08=int32#4,>x08_stack=stack32#22
# asm 2: str <x08=r3,>x08_stack=[sp,#84]
str r3,[sp,#84]

# qhasm:   x09_stack = x09
# asm 1: str <x09=int32#6,>x09_stack=stack32#23
# asm 2: str <x09=r5,>x09_stack=[sp,#88]
str r5,[sp,#88]

# qhasm:   x1e_stack = x1e
# asm 1: str <x1e=int32#2,>x1e_stack=stack32#24
# asm 2: str <x1e=r1,>x1e_stack=[sp,#92]
str r1,[sp,#92]

# qhasm:   x1f_stack = x1f
# asm 1: str <x1f=int32#10,>x1f_stack=stack32#28
# asm 2: str <x1f=r9,>x1f_stack=[sp,#108]
str r9,[sp,#108]

# qhasm:   x16_stack = x16
# asm 1: str <x16=int32#3,>x16_stack=stack32#29
# asm 2: str <x16=r2,>x16_stack=[sp,#112]
str r2,[sp,#112]

# qhasm:   x17_stack = x17
# asm 1: str <x17=int32#8,>x17_stack=stack32#37
# asm 2: str <x17=r7,>x17_stack=[sp,#144]
str r7,[sp,#144]

# qhasm:   x02 = x02_stack
# asm 1: ldr >x02=int32#2,<x02_stack=stack32#2
# asm 2: ldr >x02=r1,<x02_stack=[sp,#4]
ldr r1,[sp,#4]

# qhasm:   x03 = x03_stack
# asm 1: ldr >x03=int32#3,<x03_stack=stack32#3
# asm 2: ldr >x03=r2,<x03_stack=[sp,#8]
ldr r2,[sp,#8]

# qhasm:   x0a = x0a_stack
# asm 1: ldr >x0a=int32#4,<x0a_stack=stack32#11
# asm 2: ldr >x0a=r3,<x0a_stack=[sp,#40]
ldr r3,[sp,#40]

# qhasm:   x0b = x0b_stack
# asm 1: ldr >x0b=int32#6,<x0b_stack=stack32#10
# asm 2: ldr >x0b=r5,<x0b_stack=[sp,#36]
ldr r5,[sp,#36]

# qhasm:   x1c = x1c_stack
# asm 1: ldr >x1c=int32#7,<x1c_stack=stack32#26
# asm 2: ldr >x1c=r6,<x1c_stack=[sp,#100]
ldr r6,[sp,#100]

# qhasm:   x1d = x1d_stack
# asm 1: ldr >x1d=int32#8,<x1d_stack=stack32#9
# asm 2: ldr >x1d=r7,<x1d_stack=[sp,#32]
ldr r7,[sp,#32]

# qhasm:   x14 = x14_stack
# asm 1: ldr >x14=int32#9,<x14_stack=stack32#21
# asm 2: ldr >x14=r8,<x14_stack=[sp,#80]
ldr r8,[sp,#80]

# qhasm:   x15 = x15_stack
# asm 1: ldr >x15=int32#10,<x15_stack=stack32#4
# asm 2: ldr >x15=r9,<x15_stack=[sp,#12]
ldr r9,[sp,#12]

# qhasm:   x02 = x1c ^ (x02 >>> 21)
# asm 1: eor >x02=int32#2,<x1c=int32#7,<x02=int32#2,ROR #21
# asm 2: eor >x02=r1,<x1c=r6,<x02=r1,ROR #21
eor r1,r6,r1,ROR #21

# qhasm:   x03 = x1d ^ (x03 >>> 21)
# asm 1: eor >x03=int32#3,<x1d=int32#8,<x03=int32#3,ROR #21
# asm 2: eor >x03=r2,<x1d=r7,<x03=r2,ROR #21
eor r2,r7,r2,ROR #21

# qhasm:   x0a = x14 ^ (x0a >>> 21)
# asm 1: eor >x0a=int32#4,<x14=int32#9,<x0a=int32#4,ROR #21
# asm 2: eor >x0a=r3,<x14=r8,<x0a=r3,ROR #21
eor r3,r8,r3,ROR #21

# qhasm:   x0b = x15 ^ (x0b >>> 21)
# asm 1: eor >x0b=int32#6,<x15=int32#10,<x0b=int32#6,ROR #21
# asm 2: eor >x0b=r5,<x15=r9,<x0b=r5,ROR #21
eor r5,r9,r5,ROR #21

# qhasm:   x1d += x02
# asm 1: add <x1d=int32#8,<x1d=int32#8,<x02=int32#2
# asm 2: add <x1d=r7,<x1d=r7,<x02=r1
add r7,r7,r1

# qhasm:   x1c += x03
# asm 1: add <x1c=int32#7,<x1c=int32#7,<x03=int32#3
# asm 2: add <x1c=r6,<x1c=r6,<x03=r2
add r6,r6,r2

# qhasm:   x15 += x0a
# asm 1: add <x15=int32#10,<x15=int32#10,<x0a=int32#4
# asm 2: add <x15=r9,<x15=r9,<x0a=r3
add r9,r9,r3

# qhasm:   x14 += x0b
# asm 1: add <x14=int32#9,<x14=int32#9,<x0b=int32#6
# asm 2: add <x14=r8,<x14=r8,<x0b=r5
add r8,r8,r5

# qhasm:   x02 = x15 ^ (x02 >>> 25)
# asm 1: eor >x02=int32#2,<x15=int32#10,<x02=int32#2,ROR #25
# asm 2: eor >x02=r1,<x15=r9,<x02=r1,ROR #25
eor r1,r9,r1,ROR #25

# qhasm:   x03 = x14 ^ (x03 >>> 25)
# asm 1: eor >x03=int32#3,<x14=int32#9,<x03=int32#3,ROR #25
# asm 2: eor >x03=r2,<x14=r8,<x03=r2,ROR #25
eor r2,r8,r2,ROR #25

# qhasm:   x0a = x1d ^ (x0a >>> 25)
# asm 1: eor >x0a=int32#4,<x1d=int32#8,<x0a=int32#4,ROR #25
# asm 2: eor >x0a=r3,<x1d=r7,<x0a=r3,ROR #25
eor r3,r7,r3,ROR #25

# qhasm:   x0b = x1c ^ (x0b >>> 25)
# asm 1: eor >x0b=int32#6,<x1c=int32#7,<x0b=int32#6,ROR #25
# asm 2: eor >x0b=r5,<x1c=r6,<x0b=r5,ROR #25
eor r5,r6,r5,ROR #25

# qhasm:   x02_stack = x02
# asm 1: str <x02=int32#2,>x02_stack=stack32#4
# asm 2: str <x02=r1,>x02_stack=[sp,#12]
str r1,[sp,#12]

# qhasm:   x03_stack = x03
# asm 1: str <x03=int32#3,>x03_stack=stack32#38
# asm 2: str <x03=r2,>x03_stack=[sp,#148]
str r2,[sp,#148]

# qhasm:   x0a_stack = x0a
# asm 1: str <x0a=int32#4,>x0a_stack=stack32#39
# asm 2: str <x0a=r3,>x0a_stack=[sp,#152]
str r3,[sp,#152]

# qhasm:   x0b_stack = x0b
# asm 1: str <x0b=int32#6,>x0b_stack=stack32#40
# asm 2: str <x0b=r5,>x0b_stack=[sp,#156]
str r5,[sp,#156]

# qhasm:   x1d_stack = x1d
# asm 1: str <x1d=int32#8,>x1d_stack=stack32#2
# asm 2: str <x1d=r7,>x1d_stack=[sp,#4]
str r7,[sp,#4]

# qhasm:   x1c_stack = x1c
# asm 1: str <x1c=int32#7,>x1c_stack=stack32#3
# asm 2: str <x1c=r6,>x1c_stack=[sp,#8]
str r6,[sp,#8]

# qhasm:   x15_stack = x15
# asm 1: str <x15=int32#10,>x15_stack=stack32#11
# asm 2: str <x15=r9,>x15_stack=[sp,#40]
str r9,[sp,#40]

# qhasm:   x14_stack = x14
# asm 1: str <x14=int32#9,>x14_stack=stack32#21
# asm 2: str <x14=r8,>x14_stack=[sp,#80]
str r8,[sp,#80]

# qhasm:   x04 = x04_stack
# asm 1: ldr >x04=int32#2,<x04_stack=stack32#5
# asm 2: ldr >x04=r1,<x04_stack=[sp,#16]
ldr r1,[sp,#16]

# qhasm:   x05 = x05_stack
# asm 1: ldr >x05=int32#3,<x05_stack=stack32#6
# asm 2: ldr >x05=r2,<x05_stack=[sp,#20]
ldr r2,[sp,#20]

# qhasm:   x0c = x0c_stack
# asm 1: ldr >x0c=int32#4,<x0c_stack=stack32#13
# asm 2: ldr >x0c=r3,<x0c_stack=[sp,#48]
ldr r3,[sp,#48]

# qhasm:   x0d = x0d_stack
# asm 1: ldr >x0d=int32#6,<x0d_stack=stack32#14
# asm 2: ldr >x0d=r5,<x0d_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm:   x1a = x1a_stack
# asm 1: ldr >x1a=int32#7,<x1a_stack=stack32#36
# asm 2: ldr >x1a=r6,<x1a_stack=[sp,#140]
ldr r6,[sp,#140]

# qhasm:   x1b = x1b_stack
# asm 1: ldr >x1b=int32#8,<x1b_stack=stack32#25
# asm 2: ldr >x1b=r7,<x1b_stack=[sp,#96]
ldr r7,[sp,#96]

# qhasm:   x12 = x12_stack
# asm 1: ldr >x12=int32#9,<x12_stack=stack32#19
# asm 2: ldr >x12=r8,<x12_stack=[sp,#72]
ldr r8,[sp,#72]

# qhasm:   x13 = x13_stack
# asm 1: ldr >x13=int32#10,<x13_stack=stack32#18
# asm 2: ldr >x13=r9,<x13_stack=[sp,#68]
ldr r9,[sp,#68]

# qhasm:   x04 = x1a ^ (x04 >>> 21)
# asm 1: eor >x04=int32#2,<x1a=int32#7,<x04=int32#2,ROR #21
# asm 2: eor >x04=r1,<x1a=r6,<x04=r1,ROR #21
eor r1,r6,r1,ROR #21

# qhasm:   x05 = x1b ^ (x05 >>> 21)
# asm 1: eor >x05=int32#3,<x1b=int32#8,<x05=int32#3,ROR #21
# asm 2: eor >x05=r2,<x1b=r7,<x05=r2,ROR #21
eor r2,r7,r2,ROR #21

# qhasm:   x0c = x12 ^ (x0c >>> 21)
# asm 1: eor >x0c=int32#4,<x12=int32#9,<x0c=int32#4,ROR #21
# asm 2: eor >x0c=r3,<x12=r8,<x0c=r3,ROR #21
eor r3,r8,r3,ROR #21

# qhasm:   x0d = x13 ^ (x0d >>> 21)
# asm 1: eor >x0d=int32#6,<x13=int32#10,<x0d=int32#6,ROR #21
# asm 2: eor >x0d=r5,<x13=r9,<x0d=r5,ROR #21
eor r5,r9,r5,ROR #21

# qhasm:   x1b += x04
# asm 1: add <x1b=int32#8,<x1b=int32#8,<x04=int32#2
# asm 2: add <x1b=r7,<x1b=r7,<x04=r1
add r7,r7,r1

# qhasm:   x1a += x05
# asm 1: add <x1a=int32#7,<x1a=int32#7,<x05=int32#3
# asm 2: add <x1a=r6,<x1a=r6,<x05=r2
add r6,r6,r2

# qhasm:   x13 += x0c
# asm 1: add <x13=int32#10,<x13=int32#10,<x0c=int32#4
# asm 2: add <x13=r9,<x13=r9,<x0c=r3
add r9,r9,r3

# qhasm:   x12 += x0d
# asm 1: add <x12=int32#9,<x12=int32#9,<x0d=int32#6
# asm 2: add <x12=r8,<x12=r8,<x0d=r5
add r8,r8,r5

# qhasm:   x04 = x13 ^ (x04 >>> 25)
# asm 1: eor >x04=int32#2,<x13=int32#10,<x04=int32#2,ROR #25
# asm 2: eor >x04=r1,<x13=r9,<x04=r1,ROR #25
eor r1,r9,r1,ROR #25

# qhasm:   x05 = x12 ^ (x05 >>> 25)
# asm 1: eor >x05=int32#3,<x12=int32#9,<x05=int32#3,ROR #25
# asm 2: eor >x05=r2,<x12=r8,<x05=r2,ROR #25
eor r2,r8,r2,ROR #25

# qhasm:   x0c = x1b ^ (x0c >>> 25)
# asm 1: eor >x0c=int32#4,<x1b=int32#8,<x0c=int32#4,ROR #25
# asm 2: eor >x0c=r3,<x1b=r7,<x0c=r3,ROR #25
eor r3,r7,r3,ROR #25

# qhasm:   x0d = x1a ^ (x0d >>> 25)
# asm 1: eor >x0d=int32#6,<x1a=int32#7,<x0d=int32#6,ROR #25
# asm 2: eor >x0d=r5,<x1a=r6,<x0d=r5,ROR #25
eor r5,r6,r5,ROR #25

# qhasm:   x04_stack = x04
# asm 1: str <x04=int32#2,>x04_stack=stack32#5
# asm 2: str <x04=r1,>x04_stack=[sp,#16]
str r1,[sp,#16]

# qhasm:   x05_stack = x05
# asm 1: str <x05=int32#3,>x05_stack=stack32#6
# asm 2: str <x05=r2,>x05_stack=[sp,#20]
str r2,[sp,#20]

# qhasm:   x0c_stack = x0c
# asm 1: str <x0c=int32#4,>x0c_stack=stack32#13
# asm 2: str <x0c=r3,>x0c_stack=[sp,#48]
str r3,[sp,#48]

# qhasm:   x0d_stack = x0d
# asm 1: str <x0d=int32#6,>x0d_stack=stack32#14
# asm 2: str <x0d=r5,>x0d_stack=[sp,#52]
str r5,[sp,#52]

# qhasm:   x1b_stack = x1b
# asm 1: str <x1b=int32#8,>x1b_stack=stack32#19
# asm 2: str <x1b=r7,>x1b_stack=[sp,#72]
str r7,[sp,#72]

# qhasm:   x1a_stack = x1a
# asm 1: str <x1a=int32#7,>x1a_stack=stack32#25
# asm 2: str <x1a=r6,>x1a_stack=[sp,#96]
str r6,[sp,#96]

# qhasm:   x13_stack = x13
# asm 1: str <x13=int32#10,>x13_stack=stack32#36
# asm 2: str <x13=r9,>x13_stack=[sp,#140]
str r9,[sp,#140]

# qhasm:   x12_stack = x12
# asm 1: str <x12=int32#9,>x12_stack=stack32#41
# asm 2: str <x12=r8,>x12_stack=[sp,#160]
str r8,[sp,#160]

# qhasm:   x06 = x06_stack
# asm 1: ldr >x06=int32#2,<x06_stack=stack32#7
# asm 2: ldr >x06=r1,<x06_stack=[sp,#24]
ldr r1,[sp,#24]

# qhasm:   x07 = x07_stack
# asm 1: ldr >x07=int32#3,<x07_stack=stack32#8
# asm 2: ldr >x07=r2,<x07_stack=[sp,#28]
ldr r2,[sp,#28]

# qhasm:   x0e = x0e_stack
# asm 1: ldr >x0e=int32#4,<x0e_stack=stack32#15
# asm 2: ldr >x0e=r3,<x0e_stack=[sp,#56]
ldr r3,[sp,#56]

# qhasm:   x0f = x0f_stack
# asm 1: ldr >x0f=int32#6,<x0f_stack=stack32#16
# asm 2: ldr >x0f=r5,<x0f_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm:   x18 = x18_stack
# asm 1: ldr >x18=int32#7,<x18_stack=stack32#35
# asm 2: ldr >x18=r6,<x18_stack=[sp,#136]
ldr r6,[sp,#136]

# qhasm:   x19 = x19_stack
# asm 1: ldr >x19=int32#8,<x19_stack=stack32#20
# asm 2: ldr >x19=r7,<x19_stack=[sp,#76]
ldr r7,[sp,#76]

# qhasm:   x10 = x10_stack
# asm 1: ldr >x10=int32#9,<x10_stack=stack32#17
# asm 2: ldr >x10=r8,<x10_stack=[sp,#64]
ldr r8,[sp,#64]

# qhasm:   x11 = x11_stack
# asm 1: ldr >x11=int32#10,<x11_stack=stack32#12
# asm 2: ldr >x11=r9,<x11_stack=[sp,#44]
ldr r9,[sp,#44]

# qhasm:   x06 = x18 ^ (x06 >>> 21)
# asm 1: eor >x06=int32#2,<x18=int32#7,<x06=int32#2,ROR #21
# asm 2: eor >x06=r1,<x18=r6,<x06=r1,ROR #21
eor r1,r6,r1,ROR #21

# qhasm:   x07 = x19 ^ (x07 >>> 21)
# asm 1: eor >x07=int32#3,<x19=int32#8,<x07=int32#3,ROR #21
# asm 2: eor >x07=r2,<x19=r7,<x07=r2,ROR #21
eor r2,r7,r2,ROR #21

# qhasm:   x0e = x10 ^ (x0e >>> 21)
# asm 1: eor >x0e=int32#4,<x10=int32#9,<x0e=int32#4,ROR #21
# asm 2: eor >x0e=r3,<x10=r8,<x0e=r3,ROR #21
eor r3,r8,r3,ROR #21

# qhasm:   x0f = x11 ^ (x0f >>> 21)
# asm 1: eor >x0f=int32#6,<x11=int32#10,<x0f=int32#6,ROR #21
# asm 2: eor >x0f=r5,<x11=r9,<x0f=r5,ROR #21
eor r5,r9,r5,ROR #21

# qhasm:   x19 += x06
# asm 1: add <x19=int32#8,<x19=int32#8,<x06=int32#2
# asm 2: add <x19=r7,<x19=r7,<x06=r1
add r7,r7,r1

# qhasm:   x18 += x07
# asm 1: add <x18=int32#7,<x18=int32#7,<x07=int32#3
# asm 2: add <x18=r6,<x18=r6,<x07=r2
add r6,r6,r2

# qhasm:   x11 += x0e
# asm 1: add <x11=int32#10,<x11=int32#10,<x0e=int32#4
# asm 2: add <x11=r9,<x11=r9,<x0e=r3
add r9,r9,r3

# qhasm:   x10 += x0f
# asm 1: add <x10=int32#9,<x10=int32#9,<x0f=int32#6
# asm 2: add <x10=r8,<x10=r8,<x0f=r5
add r8,r8,r5

# qhasm:   x06 = x11 ^ (x06 >>> 25)
# asm 1: eor >x06=int32#2,<x11=int32#10,<x06=int32#2,ROR #25
# asm 2: eor >x06=r1,<x11=r9,<x06=r1,ROR #25
eor r1,r9,r1,ROR #25

# qhasm:   x07 = x10 ^ (x07 >>> 25)
# asm 1: eor >x07=int32#3,<x10=int32#9,<x07=int32#3,ROR #25
# asm 2: eor >x07=r2,<x10=r8,<x07=r2,ROR #25
eor r2,r8,r2,ROR #25

# qhasm:   x0e = x19 ^ (x0e >>> 25)
# asm 1: eor >x0e=int32#4,<x19=int32#8,<x0e=int32#4,ROR #25
# asm 2: eor >x0e=r3,<x19=r7,<x0e=r3,ROR #25
eor r3,r7,r3,ROR #25

# qhasm:   x0f = x18 ^ (x0f >>> 25)
# asm 1: eor >x0f=int32#6,<x18=int32#7,<x0f=int32#6,ROR #25
# asm 2: eor >x0f=r5,<x18=r6,<x0f=r5,ROR #25
eor r5,r6,r5,ROR #25

# qhasm:   x06_stack = x06
# asm 1: str <x06=int32#2,>x06_stack=stack32#7
# asm 2: str <x06=r1,>x06_stack=[sp,#24]
str r1,[sp,#24]

# qhasm:   x07_stack = x07
# asm 1: str <x07=int32#3,>x07_stack=stack32#8
# asm 2: str <x07=r2,>x07_stack=[sp,#28]
str r2,[sp,#28]

# qhasm:   x0e_stack = x0e
# asm 1: str <x0e=int32#4,>x0e_stack=stack32#15
# asm 2: str <x0e=r3,>x0e_stack=[sp,#56]
str r3,[sp,#56]

# qhasm:   x0f_stack = x0f
# asm 1: str <x0f=int32#6,>x0f_stack=stack32#16
# asm 2: str <x0f=r5,>x0f_stack=[sp,#60]
str r5,[sp,#60]

# qhasm:   x19_stack = x19
# asm 1: str <x19=int32#8,>x19_stack=stack32#9
# asm 2: str <x19=r7,>x19_stack=[sp,#32]
str r7,[sp,#32]

# qhasm:   x18_stack = x18
# asm 1: str <x18=int32#7,>x18_stack=stack32#10
# asm 2: str <x18=r6,>x18_stack=[sp,#36]
str r6,[sp,#36]

# qhasm:   x11_stack = x11
# asm 1: str <x11=int32#10,>x11_stack=stack32#12
# asm 2: str <x11=r9,>x11_stack=[sp,#44]
str r9,[sp,#44]

# qhasm:   x10_stack = x10
# asm 1: str <x10=int32#9,>x10_stack=stack32#17
# asm 2: str <x10=r8,>x10_stack=[sp,#64]
str r8,[sp,#64]

# qhasm:   x04 = x04_stack
# asm 1: ldr >x04=int32#2,<x04_stack=stack32#5
# asm 2: ldr >x04=r1,<x04_stack=[sp,#16]
ldr r1,[sp,#16]

# qhasm:   x05 = x05_stack
# asm 1: ldr >x05=int32#3,<x05_stack=stack32#6
# asm 2: ldr >x05=r2,<x05_stack=[sp,#20]
ldr r2,[sp,#20]

# qhasm:   x0c = x0c_stack
# asm 1: ldr >x0c=int32#4,<x0c_stack=stack32#13
# asm 2: ldr >x0c=r3,<x0c_stack=[sp,#48]
ldr r3,[sp,#48]

# qhasm:   x0d = x0d_stack
# asm 1: ldr >x0d=int32#6,<x0d_stack=stack32#14
# asm 2: ldr >x0d=r5,<x0d_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm:   x11 = x11_stack
# asm 1: ldr >x11=int32#7,<x11_stack=stack32#12
# asm 2: ldr >x11=r6,<x11_stack=[sp,#44]
ldr r6,[sp,#44]

# qhasm:   x10 = x10_stack
# asm 1: ldr >x10=int32#8,<x10_stack=stack32#17
# asm 2: ldr >x10=r7,<x10_stack=[sp,#64]
ldr r7,[sp,#64]

# qhasm:   x19 = x19_stack
# asm 1: ldr >x19=int32#9,<x19_stack=stack32#9
# asm 2: ldr >x19=r8,<x19_stack=[sp,#32]
ldr r8,[sp,#32]

# qhasm:   x18 = x18_stack
# asm 1: ldr >x18=int32#10,<x18_stack=stack32#10
# asm 2: ldr >x18=r9,<x18_stack=[sp,#36]
ldr r9,[sp,#36]

# qhasm:   x11 += x04
# asm 1: add <x11=int32#7,<x11=int32#7,<x04=int32#2
# asm 2: add <x11=r6,<x11=r6,<x04=r1
add r6,r6,r1

# qhasm:   x10 += x05
# asm 1: add <x10=int32#8,<x10=int32#8,<x05=int32#3
# asm 2: add <x10=r7,<x10=r7,<x05=r2
add r7,r7,r2

# qhasm:   x19 += x0c
# asm 1: add <x19=int32#9,<x19=int32#9,<x0c=int32#4
# asm 2: add <x19=r8,<x19=r8,<x0c=r3
add r8,r8,r3

# qhasm:   x18 += x0d
# asm 1: add <x18=int32#10,<x18=int32#10,<x0d=int32#6
# asm 2: add <x18=r9,<x18=r9,<x0d=r5
add r9,r9,r5

# qhasm:   x11_stack = x11
# asm 1: str <x11=int32#7,>x11_stack=stack32#10
# asm 2: str <x11=r6,>x11_stack=[sp,#36]
str r6,[sp,#36]

# qhasm:   x10_stack = x10
# asm 1: str <x10=int32#8,>x10_stack=stack32#9
# asm 2: str <x10=r7,>x10_stack=[sp,#32]
str r7,[sp,#32]

# qhasm:   x19_stack = x19
# asm 1: str <x19=int32#9,>x19_stack=stack32#18
# asm 2: str <x19=r8,>x19_stack=[sp,#68]
str r8,[sp,#68]

# qhasm:   x18_stack = x18
# asm 1: str <x18=int32#10,>x18_stack=stack32#17
# asm 2: str <x18=r9,>x18_stack=[sp,#64]
str r9,[sp,#64]

# qhasm:   x08 = x08_stack
# asm 1: ldr >x08=int32#2,<x08_stack=stack32#22
# asm 2: ldr >x08=r1,<x08_stack=[sp,#84]
ldr r1,[sp,#84]

# qhasm:   x09 = x09_stack
# asm 1: ldr >x09=int32#3,<x09_stack=stack32#23
# asm 2: ldr >x09=r2,<x09_stack=[sp,#88]
ldr r2,[sp,#88]

# qhasm:   x15 = x15_stack
# asm 1: ldr >x15=int32#4,<x15_stack=stack32#11
# asm 2: ldr >x15=r3,<x15_stack=[sp,#40]
ldr r3,[sp,#40]

# qhasm:   x14 = x14_stack
# asm 1: ldr >x14=int32#6,<x14_stack=stack32#21
# asm 2: ldr >x14=r5,<x14_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm:   x1d = x1d_stack
# asm 1: ldr >x1d=int32#7,<x1d_stack=stack32#2
# asm 2: ldr >x1d=r6,<x1d_stack=[sp,#4]
ldr r6,[sp,#4]

# qhasm:   x1c = x1c_stack
# asm 1: ldr >x1c=int32#8,<x1c_stack=stack32#3
# asm 2: ldr >x1c=r7,<x1c_stack=[sp,#8]
ldr r7,[sp,#8]

# qhasm:   x15 += x00
# asm 1: add <x15=int32#4,<x15=int32#4,<x00=int32#1
# asm 2: add <x15=r3,<x15=r3,<x00=r0
add r3,r3,r0

# qhasm:   x14 += x01
# asm 1: add <x14=int32#6,<x14=int32#6,<x01=int32#5
# asm 2: add <x14=r5,<x14=r5,<x01=r4
add r5,r5,r4

# qhasm:   x1d += x08
# asm 1: add <x1d=int32#7,<x1d=int32#7,<x08=int32#2
# asm 2: add <x1d=r6,<x1d=r6,<x08=r1
add r6,r6,r1

# qhasm:   x1c += x09
# asm 1: add <x1c=int32#8,<x1c=int32#8,<x09=int32#3
# asm 2: add <x1c=r7,<x1c=r7,<x09=r2
add r7,r7,r2

# qhasm:   x04 = x04_stack
# asm 1: ldr >x04=int32#9,<x04_stack=stack32#5
# asm 2: ldr >x04=r8,<x04_stack=[sp,#16]
ldr r8,[sp,#16]

# qhasm:   x05 = x05_stack
# asm 1: ldr >x05=int32#10,<x05_stack=stack32#6
# asm 2: ldr >x05=r9,<x05_stack=[sp,#20]
ldr r9,[sp,#20]

# qhasm:   x0c = x0c_stack
# asm 1: ldr >x0c=int32#11,<x0c_stack=stack32#13
# asm 2: ldr >x0c=r10,<x0c_stack=[sp,#48]
ldr r10,[sp,#48]

# qhasm:   x0d = x0d_stack
# asm 1: ldr >x0d=int32#12,<x0d_stack=stack32#14
# asm 2: ldr >x0d=r11,<x0d_stack=[sp,#52]
ldr r11,[sp,#52]

# qhasm:   x04 = x15 ^ (x04 >>> 21)
# asm 1: eor >x04=int32#9,<x15=int32#4,<x04=int32#9,ROR #21
# asm 2: eor >x04=r8,<x15=r3,<x04=r8,ROR #21
eor r8,r3,r8,ROR #21

# qhasm:   x05 = x14 ^ (x05 >>> 21)
# asm 1: eor >x05=int32#10,<x14=int32#6,<x05=int32#10,ROR #21
# asm 2: eor >x05=r9,<x14=r5,<x05=r9,ROR #21
eor r9,r5,r9,ROR #21

# qhasm:   x0c = x1d ^ (x0c >>> 21)
# asm 1: eor >x0c=int32#11,<x1d=int32#7,<x0c=int32#11,ROR #21
# asm 2: eor >x0c=r10,<x1d=r6,<x0c=r10,ROR #21
eor r10,r6,r10,ROR #21

# qhasm:   x0d = x1c ^ (x0d >>> 21)
# asm 1: eor >x0d=int32#12,<x1c=int32#8,<x0d=int32#12,ROR #21
# asm 2: eor >x0d=r11,<x1c=r7,<x0d=r11,ROR #21
eor r11,r7,r11,ROR #21

# qhasm:   x15_stack = x15
# asm 1: str <x15=int32#4,>x15_stack=stack32#14
# asm 2: str <x15=r3,>x15_stack=[sp,#52]
str r3,[sp,#52]

# qhasm:   x14_stack = x14
# asm 1: str <x14=int32#6,>x14_stack=stack32#13
# asm 2: str <x14=r5,>x14_stack=[sp,#48]
str r5,[sp,#48]

# qhasm:   x1d_stack = x1d
# asm 1: str <x1d=int32#7,>x1d_stack=stack32#22
# asm 2: str <x1d=r6,>x1d_stack=[sp,#84]
str r6,[sp,#84]

# qhasm:   x1c_stack = x1c
# asm 1: str <x1c=int32#8,>x1c_stack=stack32#21
# asm 2: str <x1c=r7,>x1c_stack=[sp,#80]
str r7,[sp,#80]

# qhasm:   x04_stack = x04
# asm 1: str <x04=int32#9,>x04_stack=stack32#26
# asm 2: str <x04=r8,>x04_stack=[sp,#100]
str r8,[sp,#100]

# qhasm:   x05_stack = x05
# asm 1: str <x05=int32#10,>x05_stack=stack32#27
# asm 2: str <x05=r9,>x05_stack=[sp,#104]
str r9,[sp,#104]

# qhasm:   x0c_stack = x0c
# asm 1: str <x0c=int32#11,>x0c_stack=stack32#5
# asm 2: str <x0c=r10,>x0c_stack=[sp,#16]
str r10,[sp,#16]

# qhasm:   x0d_stack = x0d
# asm 1: str <x0d=int32#12,>x0d_stack=stack32#6
# asm 2: str <x0d=r11,>x0d_stack=[sp,#20]
str r11,[sp,#20]

# qhasm:   x11 = x11_stack
# asm 1: ldr >x11=int32#4,<x11_stack=stack32#10
# asm 2: ldr >x11=r3,<x11_stack=[sp,#36]
ldr r3,[sp,#36]

# qhasm:   x10 = x10_stack
# asm 1: ldr >x10=int32#6,<x10_stack=stack32#9
# asm 2: ldr >x10=r5,<x10_stack=[sp,#32]
ldr r5,[sp,#32]

# qhasm:   x19 = x19_stack
# asm 1: ldr >x19=int32#7,<x19_stack=stack32#18
# asm 2: ldr >x19=r6,<x19_stack=[sp,#68]
ldr r6,[sp,#68]

# qhasm:   x18 = x18_stack
# asm 1: ldr >x18=int32#8,<x18_stack=stack32#17
# asm 2: ldr >x18=r7,<x18_stack=[sp,#64]
ldr r7,[sp,#64]

# qhasm:   x00 = x11 ^ (x00 >>> 21)
# asm 1: eor >x00=int32#1,<x11=int32#4,<x00=int32#1,ROR #21
# asm 2: eor >x00=r0,<x11=r3,<x00=r0,ROR #21
eor r0,r3,r0,ROR #21

# qhasm:   x01 = x10 ^ (x01 >>> 21)
# asm 1: eor >x01=int32#5,<x10=int32#6,<x01=int32#5,ROR #21
# asm 2: eor >x01=r4,<x10=r5,<x01=r4,ROR #21
eor r4,r5,r4,ROR #21

# qhasm:   x08 = x19 ^ (x08 >>> 21)
# asm 1: eor >x08=int32#2,<x19=int32#7,<x08=int32#2,ROR #21
# asm 2: eor >x08=r1,<x19=r6,<x08=r1,ROR #21
eor r1,r6,r1,ROR #21

# qhasm:   x09 = x18 ^ (x09 >>> 21)
# asm 1: eor >x09=int32#3,<x18=int32#8,<x09=int32#3,ROR #21
# asm 2: eor >x09=r2,<x18=r7,<x09=r2,ROR #21
eor r2,r7,r2,ROR #21

# qhasm:   x08_stack = x08
# asm 1: str <x08=int32#2,>x08_stack=stack32#2
# asm 2: str <x08=r1,>x08_stack=[sp,#4]
str r1,[sp,#4]

# qhasm:   x09_stack = x09
# asm 1: str <x09=int32#3,>x09_stack=stack32#3
# asm 2: str <x09=r2,>x09_stack=[sp,#8]
str r2,[sp,#8]

# qhasm:   x06 = x06_stack
# asm 1: ldr >x06=int32#2,<x06_stack=stack32#7
# asm 2: ldr >x06=r1,<x06_stack=[sp,#24]
ldr r1,[sp,#24]

# qhasm:   x07 = x07_stack
# asm 1: ldr >x07=int32#3,<x07_stack=stack32#8
# asm 2: ldr >x07=r2,<x07_stack=[sp,#28]
ldr r2,[sp,#28]

# qhasm:   x0e = x0e_stack
# asm 1: ldr >x0e=int32#4,<x0e_stack=stack32#15
# asm 2: ldr >x0e=r3,<x0e_stack=[sp,#56]
ldr r3,[sp,#56]

# qhasm:   x0f = x0f_stack
# asm 1: ldr >x0f=int32#6,<x0f_stack=stack32#16
# asm 2: ldr >x0f=r5,<x0f_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm:   x13 = x13_stack
# asm 1: ldr >x13=int32#7,<x13_stack=stack32#36
# asm 2: ldr >x13=r6,<x13_stack=[sp,#140]
ldr r6,[sp,#140]

# qhasm:   x12 = x12_stack
# asm 1: ldr >x12=int32#8,<x12_stack=stack32#41
# asm 2: ldr >x12=r7,<x12_stack=[sp,#160]
ldr r7,[sp,#160]

# qhasm:   x1b = x1b_stack
# asm 1: ldr >x1b=int32#9,<x1b_stack=stack32#19
# asm 2: ldr >x1b=r8,<x1b_stack=[sp,#72]
ldr r8,[sp,#72]

# qhasm:   x1a = x1a_stack
# asm 1: ldr >x1a=int32#10,<x1a_stack=stack32#25
# asm 2: ldr >x1a=r9,<x1a_stack=[sp,#96]
ldr r9,[sp,#96]

# qhasm:   x13 += x06
# asm 1: add <x13=int32#7,<x13=int32#7,<x06=int32#2
# asm 2: add <x13=r6,<x13=r6,<x06=r1
add r6,r6,r1

# qhasm:   x12 += x07
# asm 1: add <x12=int32#8,<x12=int32#8,<x07=int32#3
# asm 2: add <x12=r7,<x12=r7,<x07=r2
add r7,r7,r2

# qhasm:   x1b += x0e
# asm 1: add <x1b=int32#9,<x1b=int32#9,<x0e=int32#4
# asm 2: add <x1b=r8,<x1b=r8,<x0e=r3
add r8,r8,r3

# qhasm:   x1a += x0f
# asm 1: add <x1a=int32#10,<x1a=int32#10,<x0f=int32#6
# asm 2: add <x1a=r9,<x1a=r9,<x0f=r5
add r9,r9,r5

# qhasm:   x13_stack = x13
# asm 1: str <x13=int32#7,>x13_stack=stack32#12
# asm 2: str <x13=r6,>x13_stack=[sp,#44]
str r6,[sp,#44]

# qhasm:   x12_stack = x12
# asm 1: str <x12=int32#8,>x12_stack=stack32#11
# asm 2: str <x12=r7,>x12_stack=[sp,#40]
str r7,[sp,#40]

# qhasm:   x1b_stack = x1b
# asm 1: str <x1b=int32#9,>x1b_stack=stack32#20
# asm 2: str <x1b=r8,>x1b_stack=[sp,#76]
str r8,[sp,#76]

# qhasm:   x1a_stack = x1a
# asm 1: str <x1a=int32#10,>x1a_stack=stack32#19
# asm 2: str <x1a=r9,>x1a_stack=[sp,#72]
str r9,[sp,#72]

# qhasm:   x02 = x02_stack
# asm 1: ldr >x02=int32#2,<x02_stack=stack32#4
# asm 2: ldr >x02=r1,<x02_stack=[sp,#12]
ldr r1,[sp,#12]

# qhasm:   x03 = x03_stack
# asm 1: ldr >x03=int32#3,<x03_stack=stack32#38
# asm 2: ldr >x03=r2,<x03_stack=[sp,#148]
ldr r2,[sp,#148]

# qhasm:   x0a = x0a_stack
# asm 1: ldr >x0a=int32#4,<x0a_stack=stack32#39
# asm 2: ldr >x0a=r3,<x0a_stack=[sp,#152]
ldr r3,[sp,#152]

# qhasm:   x0b = x0b_stack
# asm 1: ldr >x0b=int32#8,<x0b_stack=stack32#40
# asm 2: ldr >x0b=r7,<x0b_stack=[sp,#156]
ldr r7,[sp,#156]

# qhasm:   x17 = x17_stack
# asm 1: ldr >x17=int32#6,<x17_stack=stack32#37
# asm 2: ldr >x17=r5,<x17_stack=[sp,#144]
ldr r5,[sp,#144]

# qhasm:   x16 = x16_stack
# asm 1: ldr >x16=int32#7,<x16_stack=stack32#29
# asm 2: ldr >x16=r6,<x16_stack=[sp,#112]
ldr r6,[sp,#112]

# qhasm:   x1f = x1f_stack
# asm 1: ldr >x1f=int32#9,<x1f_stack=stack32#28
# asm 2: ldr >x1f=r8,<x1f_stack=[sp,#108]
ldr r8,[sp,#108]

# qhasm:   x1e = x1e_stack
# asm 1: ldr >x1e=int32#10,<x1e_stack=stack32#24
# asm 2: ldr >x1e=r9,<x1e_stack=[sp,#92]
ldr r9,[sp,#92]

# qhasm:   x17 += x02
# asm 1: add <x17=int32#6,<x17=int32#6,<x02=int32#2
# asm 2: add <x17=r5,<x17=r5,<x02=r1
add r5,r5,r1

# qhasm:   x16 += x03
# asm 1: add <x16=int32#7,<x16=int32#7,<x03=int32#3
# asm 2: add <x16=r6,<x16=r6,<x03=r2
add r6,r6,r2

# qhasm:   x1f += x0a
# asm 1: add <x1f=int32#9,<x1f=int32#9,<x0a=int32#4
# asm 2: add <x1f=r8,<x1f=r8,<x0a=r3
add r8,r8,r3

# qhasm:   x1e += x0b
# asm 1: add <x1e=int32#10,<x1e=int32#10,<x0b=int32#8
# asm 2: add <x1e=r9,<x1e=r9,<x0b=r7
add r9,r9,r7

# qhasm:   x06 = x06_stack
# asm 1: ldr >x06=int32#11,<x06_stack=stack32#7
# asm 2: ldr >x06=r10,<x06_stack=[sp,#24]
ldr r10,[sp,#24]

# qhasm:   x07 = x07_stack
# asm 1: ldr >x07=int32#12,<x07_stack=stack32#8
# asm 2: ldr >x07=r11,<x07_stack=[sp,#28]
ldr r11,[sp,#28]

# qhasm:   x0e = x0e_stack
# asm 1: ldr >x0e=int32#13,<x0e_stack=stack32#15
# asm 2: ldr >x0e=r12,<x0e_stack=[sp,#56]
ldr r12,[sp,#56]

# qhasm:   x0f = x0f_stack
# asm 1: ldr >x0f=int32#14,<x0f_stack=stack32#16
# asm 2: ldr >x0f=r14,<x0f_stack=[sp,#60]
ldr r14,[sp,#60]

# qhasm:   x06 = x17 ^ (x06 >>> 21)
# asm 1: eor >x06=int32#11,<x17=int32#6,<x06=int32#11,ROR #21
# asm 2: eor >x06=r10,<x17=r5,<x06=r10,ROR #21
eor r10,r5,r10,ROR #21

# qhasm:   x07 = x16 ^ (x07 >>> 21)
# asm 1: eor >x07=int32#12,<x16=int32#7,<x07=int32#12,ROR #21
# asm 2: eor >x07=r11,<x16=r6,<x07=r11,ROR #21
eor r11,r6,r11,ROR #21

# qhasm:   x0e = x1f ^ (x0e >>> 21)
# asm 1: eor >x0e=int32#13,<x1f=int32#9,<x0e=int32#13,ROR #21
# asm 2: eor >x0e=r12,<x1f=r8,<x0e=r12,ROR #21
eor r12,r8,r12,ROR #21

# qhasm:   x0f = x1e ^ (x0f >>> 21)
# asm 1: eor >x0f=int32#14,<x1e=int32#10,<x0f=int32#14,ROR #21
# asm 2: eor >x0f=r14,<x1e=r9,<x0f=r14,ROR #21
eor r14,r9,r14,ROR #21

# qhasm:   x17_stack = x17
# asm 1: str <x17=int32#6,>x17_stack=stack32#16
# asm 2: str <x17=r5,>x17_stack=[sp,#60]
str r5,[sp,#60]

# qhasm:   x16_stack = x16
# asm 1: str <x16=int32#7,>x16_stack=stack32#15
# asm 2: str <x16=r6,>x16_stack=[sp,#56]
str r6,[sp,#56]

# qhasm:   x1f_stack = x1f
# asm 1: str <x1f=int32#9,>x1f_stack=stack32#24
# asm 2: str <x1f=r8,>x1f_stack=[sp,#92]
str r8,[sp,#92]

# qhasm:   x1e_stack = x1e
# asm 1: str <x1e=int32#10,>x1e_stack=stack32#23
# asm 2: str <x1e=r9,>x1e_stack=[sp,#88]
str r9,[sp,#88]

# qhasm:   x06_stack = x06
# asm 1: str <x06=int32#11,>x06_stack=stack32#28
# asm 2: str <x06=r10,>x06_stack=[sp,#108]
str r10,[sp,#108]

# qhasm:   x07_stack = x07
# asm 1: str <x07=int32#12,>x07_stack=stack32#29
# asm 2: str <x07=r11,>x07_stack=[sp,#112]
str r11,[sp,#112]

# qhasm:   x0e_stack = x0e
# asm 1: str <x0e=int32#13,>x0e_stack=stack32#7
# asm 2: str <x0e=r12,>x0e_stack=[sp,#24]
str r12,[sp,#24]

# qhasm:   x0f_stack = x0f
# asm 1: str <x0f=int32#14,>x0f_stack=stack32#8
# asm 2: str <x0f=r14,>x0f_stack=[sp,#28]
str r14,[sp,#28]

# qhasm:   x13 = x13_stack
# asm 1: ldr >x13=int32#6,<x13_stack=stack32#12
# asm 2: ldr >x13=r5,<x13_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm:   x12 = x12_stack
# asm 1: ldr >x12=int32#10,<x12_stack=stack32#11
# asm 2: ldr >x12=r9,<x12_stack=[sp,#40]
ldr r9,[sp,#40]

# qhasm:   x1b = x1b_stack
# asm 1: ldr >x1b=int32#11,<x1b_stack=stack32#20
# asm 2: ldr >x1b=r10,<x1b_stack=[sp,#76]
ldr r10,[sp,#76]

# qhasm:   x1a = x1a_stack
# asm 1: ldr >x1a=int32#12,<x1a_stack=stack32#19
# asm 2: ldr >x1a=r11,<x1a_stack=[sp,#72]
ldr r11,[sp,#72]

# qhasm: r = r_stack
# asm 1: ldr >r=int32#9,<r_stack=stack32#34
# asm 2: ldr >r=r8,<r_stack=[sp,#132]
ldr r8,[sp,#132]

# qhasm:   x02 = x13 ^ (x02 >>> 21)
# asm 1: eor >x02=int32#7,<x13=int32#6,<x02=int32#2,ROR #21
# asm 2: eor >x02=r6,<x13=r5,<x02=r1,ROR #21
eor r6,r5,r1,ROR #21

# qhasm:   x03 = x12 ^ (x03 >>> 21)
# asm 1: eor >x03=int32#2,<x12=int32#10,<x03=int32#3,ROR #21
# asm 2: eor >x03=r1,<x12=r9,<x03=r2,ROR #21
eor r1,r9,r2,ROR #21

# qhasm:   x0a = x1b ^ (x0a >>> 21)
# asm 1: eor >x0a=int32#6,<x1b=int32#11,<x0a=int32#4,ROR #21
# asm 2: eor >x0a=r5,<x1b=r10,<x0a=r3,ROR #21
eor r5,r10,r3,ROR #21

# qhasm:   x0b = x1a ^ (x0b >>> 21)
# asm 1: eor >x0b=int32#3,<x1a=int32#12,<x0b=int32#8,ROR #21
# asm 2: eor >x0b=r2,<x1a=r11,<x0b=r7,ROR #21
eor r2,r11,r7,ROR #21

# qhasm:   x03_stack = x03
# asm 1: str <x03=int32#2,>x03_stack=stack32#25
# asm 2: str <x03=r1,>x03_stack=[sp,#96]
str r1,[sp,#96]

# qhasm:   x0b_stack = x0b
# asm 1: str <x0b=int32#3,>x0b_stack=stack32#4
# asm 2: str <x0b=r2,>x0b_stack=[sp,#12]
str r2,[sp,#12]

# qhasm:                    unsigned>? r -= 2
# asm 1: subs <r=int32#9,<r=int32#9,#2
# asm 2: subs <r=r8,<r=r8,#2
subs r8,r8,#2

# qhasm: goto morerounds if unsigned>
bhi ._morerounds

# qhasm:   finalization = finalization_stack
# asm 1: ldr >finalization=int32#8,<finalization_stack=stack32#30
# asm 2: ldr >finalization=r7,<finalization_stack=[sp,#116]
ldr r7,[sp,#116]

# qhasm:   in = in_stack
# asm 1: ldr >in=int32#2,<in_stack=stack32#33
# asm 2: ldr >in=r1,<in_stack=[sp,#128]
ldr r1,[sp,#128]

# qhasm:   inlenlow = inlenlow_stack
# asm 1: ldr >inlenlow=int32#3,<inlenlow_stack=stack32#31
# asm 2: ldr >inlenlow=r2,<inlenlow_stack=[sp,#120]
ldr r2,[sp,#120]

# qhasm:   inlenhigh = inlenhigh_stack
# asm 1: ldr >inlenhigh=int32#4,<inlenhigh_stack=stack32#32
# asm 2: ldr >inlenhigh=r3,<inlenhigh_stack=[sp,#124]
ldr r3,[sp,#124]

# qhasm: goto checkinlen
b ._checkinlen

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:                       =? finalization - 1
# asm 1: cmp <finalization=int32#8,#1
# asm 2: cmp <finalization=r7,#1
cmp r7,#1

# qhasm: goto finalization1 if =
beq ._finalization1

# qhasm:                       =? finalization - 2
# asm 1: cmp <finalization=int32#8,#2
# asm 2: cmp <finalization=r7,#2
cmp r7,#2

# qhasm: goto finalization2 if =
beq ._finalization2

# qhasm:   y00 = 0
# asm 1: ldr >y00=int32#8,=0
# asm 2: ldr >y00=r7,=0
ldr r7,=0

# qhasm:   z = &tmp
# asm 1: lea >z=int32#9,<tmp=stack256#1
# asm 2: lea >z=r8,<tmp=[sp,#192]
add r8,sp,#192

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#0]
# asm 2: str <y00=r7,[<z=r8,#0]
str r7,[r8,#0]

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#4]
# asm 2: str <y00=r7,[<z=r8,#4]
str r7,[r8,#4]

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#8]
# asm 2: str <y00=r7,[<z=r8,#8]
str r7,[r8,#8]

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#12]
# asm 2: str <y00=r7,[<z=r8,#12]
str r7,[r8,#12]

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#16]
# asm 2: str <y00=r7,[<z=r8,#16]
str r7,[r8,#16]

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#20]
# asm 2: str <y00=r7,[<z=r8,#20]
str r7,[r8,#20]

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#24]
# asm 2: str <y00=r7,[<z=r8,#24]
str r7,[r8,#24]

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: str <y00=int32#8,[<z=int32#9,#28]
# asm 2: str <y00=r7,[<z=r8,#28]
str r7,[r8,#28]

# qhasm:                  =? inlenlow - 0
# asm 1: cmp <inlenlow=int32#3,#0
# asm 2: cmp <inlenlow=r2,#0
cmp r2,#0

# qhasm: goto copydone if =
beq ._copydone

# qhasm:   copyloop:
._copyloop:

# qhasm:     y00 = *(uint8 *) in; in += 1
# asm 1: ldrb >y00=int32#8,[<in=int32#2],#1
# asm 2: ldrb >y00=r7,[<in=r1],#1
ldrb r7,[r1],#1

# qhasm:     *(uint8 *) z = y00; z += 1
# asm 1: strb <y00=int32#8,[<z=int32#9],#1
# asm 2: strb <y00=r7,[<z=r8],#1
strb r7,[r8],#1

# qhasm:                  unsigned>? inlenlow -= 1
# asm 1: subs <inlenlow=int32#3,<inlenlow=int32#3,#1
# asm 2: subs <inlenlow=r2,<inlenlow=r2,#1
subs r2,r2,#1

# qhasm: goto copyloop if unsigned>
bhi ._copyloop

# qhasm: copydone:
._copydone:

# qhasm:   y00 = 128
# asm 1: ldr >y00=int32#2,=128
# asm 2: ldr >y00=r1,=128
ldr r1,=128

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: strb <y00=int32#2,[<z=int32#9,#0]
# asm 2: strb <y00=r1,[<z=r8,#0]
strb r1,[r8,#0]

# qhasm:   in = &tmp
# asm 1: lea >in=int32#2,<tmp=stack256#1
# asm 2: lea >in=r1,<tmp=[sp,#192]
add r1,sp,#192

# qhasm:   finalization = 1
# asm 1: ldr >finalization=int32#8,=1
# asm 2: ldr >finalization=r7,=1
ldr r7,=1

# qhasm:   inlenlow = 32
# asm 1: ldr >inlenlow=int32#3,=32
# asm 2: ldr >inlenlow=r2,=32
ldr r2,=32

# qhasm:   goto mainloop
b ._mainloop

# qhasm: finalization1:
._finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: ldr >x1f=int32#8,<x1f_stack=stack32#24
# asm 2: ldr >x1f=r7,<x1f_stack=[sp,#92]
ldr r7,[sp,#92]

# qhasm:   x1f ^= 1
# asm 1: eor <x1f=int32#8,<x1f=int32#8,#1
# asm 2: eor <x1f=r7,<x1f=r7,#1
eor r7,r7,#1

# qhasm:   x1f_stack = x1f
# asm 1: str <x1f=int32#8,>x1f_stack=stack32#24
# asm 2: str <x1f=r7,>x1f_stack=[sp,#92]
str r7,[sp,#92]

# qhasm:   r = 160
# asm 1: ldr >r=int32#9,=160
# asm 2: ldr >r=r8,=160
ldr r8,=160

# qhasm:   finalization = 2
# asm 1: ldr >finalization=int32#8,=2
# asm 2: ldr >finalization=r7,=2
ldr r7,=2

# qhasm:   finalization_stack = finalization
# asm 1: str <finalization=int32#8,>finalization_stack=stack32#30
# asm 2: str <finalization=r7,>finalization_stack=[sp,#116]
str r7,[sp,#116]

# qhasm:   in_stack = in
# asm 1: str <in=int32#2,>in_stack=stack32#33
# asm 2: str <in=r1,>in_stack=[sp,#128]
str r1,[sp,#128]

# qhasm:   inlenlow_stack = inlenlow
# asm 1: str <inlenlow=int32#3,>inlenlow_stack=stack32#31
# asm 2: str <inlenlow=r2,>inlenlow_stack=[sp,#120]
str r2,[sp,#120]

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: str <inlenhigh=int32#4,>inlenhigh_stack=stack32#32
# asm 2: str <inlenhigh=r3,>inlenhigh_stack=[sp,#124]
str r3,[sp,#124]

# qhasm: goto morerounds
b ._morerounds

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: ldr >out=int32#2,<out_stack=stack32#1
# asm 2: ldr >out=r1,<out_stack=[sp,#0]
ldr r1,[sp,#0]

# qhasm:   x03 = x03_stack
# asm 1: ldr >x03=int32#3,<x03_stack=stack32#25
# asm 2: ldr >x03=r2,<x03_stack=[sp,#96]
ldr r2,[sp,#96]

# qhasm:   x04 = x04_stack
# asm 1: ldr >x04=int32#4,<x04_stack=stack32#26
# asm 2: ldr >x04=r3,<x04_stack=[sp,#100]
ldr r3,[sp,#100]

# qhasm:   x05 = x05_stack
# asm 1: ldr >x05=int32#8,<x05_stack=stack32#27
# asm 2: ldr >x05=r7,<x05_stack=[sp,#104]
ldr r7,[sp,#104]

# qhasm:   x06 = x06_stack
# asm 1: ldr >x06=int32#9,<x06_stack=stack32#28
# asm 2: ldr >x06=r8,<x06_stack=[sp,#108]
ldr r8,[sp,#108]

# qhasm:   x07 = x07_stack
# asm 1: ldr >x07=int32#10,<x07_stack=stack32#29
# asm 2: ldr >x07=r9,<x07_stack=[sp,#112]
ldr r9,[sp,#112]

# qhasm:   *(uint32 *) (out + 0) = x00
# asm 1: str <x00=int32#1,[<out=int32#2,#0]
# asm 2: str <x00=r0,[<out=r1,#0]
str r0,[r1,#0]

# qhasm:   *(uint32 *) (out + 4) = x01
# asm 1: str <x01=int32#5,[<out=int32#2,#4]
# asm 2: str <x01=r4,[<out=r1,#4]
str r4,[r1,#4]

# qhasm:   *(uint32 *) (out + 8) = x02
# asm 1: str <x02=int32#7,[<out=int32#2,#8]
# asm 2: str <x02=r6,[<out=r1,#8]
str r6,[r1,#8]

# qhasm:   *(uint32 *) (out + 12) = x03
# asm 1: str <x03=int32#3,[<out=int32#2,#12]
# asm 2: str <x03=r2,[<out=r1,#12]
str r2,[r1,#12]

# qhasm:   *(uint32 *) (out + 16) = x04
# asm 1: str <x04=int32#4,[<out=int32#2,#16]
# asm 2: str <x04=r3,[<out=r1,#16]
str r3,[r1,#16]

# qhasm:   *(uint32 *) (out + 20) = x05
# asm 1: str <x05=int32#8,[<out=int32#2,#20]
# asm 2: str <x05=r7,[<out=r1,#20]
str r7,[r1,#20]

# qhasm:   *(uint32 *) (out + 24) = x06
# asm 1: str <x06=int32#9,[<out=int32#2,#24]
# asm 2: str <x06=r8,[<out=r1,#24]
str r8,[r1,#24]

# qhasm:   *(uint32 *) (out + 28) = x07
# asm 1: str <x07=int32#10,[<out=int32#2,#28]
# asm 2: str <x07=r9,[<out=r1,#28]
str r9,[r1,#28]

# qhasm:   x08 = x08_stack
# asm 1: ldr >x08=int32#1,<x08_stack=stack32#2
# asm 2: ldr >x08=r0,<x08_stack=[sp,#4]
ldr r0,[sp,#4]

# qhasm:   x09 = x09_stack
# asm 1: ldr >x09=int32#3,<x09_stack=stack32#3
# asm 2: ldr >x09=r2,<x09_stack=[sp,#8]
ldr r2,[sp,#8]

# qhasm:   x0b = x0b_stack
# asm 1: ldr >x0b=int32#4,<x0b_stack=stack32#4
# asm 2: ldr >x0b=r3,<x0b_stack=[sp,#12]
ldr r3,[sp,#12]

# qhasm:   x0c = x0c_stack
# asm 1: ldr >x0c=int32#5,<x0c_stack=stack32#5
# asm 2: ldr >x0c=r4,<x0c_stack=[sp,#16]
ldr r4,[sp,#16]

# qhasm:   x0d = x0d_stack
# asm 1: ldr >x0d=int32#7,<x0d_stack=stack32#6
# asm 2: ldr >x0d=r6,<x0d_stack=[sp,#20]
ldr r6,[sp,#20]

# qhasm:   x0e = x0e_stack
# asm 1: ldr >x0e=int32#8,<x0e_stack=stack32#7
# asm 2: ldr >x0e=r7,<x0e_stack=[sp,#24]
ldr r7,[sp,#24]

# qhasm:   x0f = x0f_stack
# asm 1: ldr >x0f=int32#9,<x0f_stack=stack32#8
# asm 2: ldr >x0f=r8,<x0f_stack=[sp,#28]
ldr r8,[sp,#28]

# qhasm:   *(uint32 *) (out + 32) = x08
# asm 1: str <x08=int32#1,[<out=int32#2,#32]
# asm 2: str <x08=r0,[<out=r1,#32]
str r0,[r1,#32]

# qhasm:   *(uint32 *) (out + 36) = x09
# asm 1: str <x09=int32#3,[<out=int32#2,#36]
# asm 2: str <x09=r2,[<out=r1,#36]
str r2,[r1,#36]

# qhasm:   *(uint32 *) (out + 40) = x0a
# asm 1: str <x0a=int32#6,[<out=int32#2,#40]
# asm 2: str <x0a=r5,[<out=r1,#40]
str r5,[r1,#40]

# qhasm:   *(uint32 *) (out + 44) = x0b
# asm 1: str <x0b=int32#4,[<out=int32#2,#44]
# asm 2: str <x0b=r3,[<out=r1,#44]
str r3,[r1,#44]

# qhasm:   *(uint32 *) (out + 48) = x0c
# asm 1: str <x0c=int32#5,[<out=int32#2,#48]
# asm 2: str <x0c=r4,[<out=r1,#48]
str r4,[r1,#48]

# qhasm:   *(uint32 *) (out + 52) = x0d
# asm 1: str <x0d=int32#7,[<out=int32#2,#52]
# asm 2: str <x0d=r6,[<out=r1,#52]
str r6,[r1,#52]

# qhasm:   *(uint32 *) (out + 56) = x0e
# asm 1: str <x0e=int32#8,[<out=int32#2,#56]
# asm 2: str <x0e=r7,[<out=r1,#56]
str r7,[r1,#56]

# qhasm:   *(uint32 *) (out + 60) = x0f
# asm 1: str <x0f=int32#9,[<out=int32#2,#60]
# asm 2: str <x0f=r8,[<out=r1,#60]
str r8,[r1,#60]

# qhasm:   result = 0
# asm 1: ldr >result=int32#1,=0
# asm 2: ldr >result=r0,=0
ldr r0,=0

# qhasm: leave
add sp,sp,#224
ldmfd sp!,{r4,r5,r6,r7,r8,r9,sl,fp,lr}
bx lr
