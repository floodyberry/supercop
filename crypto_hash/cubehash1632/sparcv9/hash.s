
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

# qhasm: int64 s00

# qhasm: int64 s01

# qhasm: int64 s02

# qhasm: int64 s03

# qhasm: int64 s04

# qhasm: int64 s05

# qhasm: int64 s06

# qhasm: int64 s07

# qhasm: int64 s08

# qhasm: int64 s09

# qhasm: int64 s0a

# qhasm: int64 s0b

# qhasm: int64 s0c

# qhasm: int64 s0d

# qhasm: int64 s0e

# qhasm: int64 s0f

# qhasm: int64 y00

# qhasm: int64 y01

# qhasm: int64 y02

# qhasm: int64 y03

# qhasm: int64 y04

# qhasm: int64 y05

# qhasm: int64 y06

# qhasm: int64 y07

# qhasm: int64 in0

# qhasm: int64 in1

# qhasm: int64 in2

# qhasm: int64 in3

# qhasm: int64 in4

# qhasm: int64 in5

# qhasm: int64 in6

# qhasm: int64 in7

# qhasm: int64 in8

# qhasm: int64 in9

# qhasm: int64 in10

# qhasm: int64 in11

# qhasm: int64 in12

# qhasm: int64 in13

# qhasm: int64 in14

# qhasm: int64 in15

# qhasm: int64 in16

# qhasm: int64 in17

# qhasm: int64 in18

# qhasm: int64 in19

# qhasm: int64 in20

# qhasm: int64 in21

# qhasm: int64 in22

# qhasm: int64 in23

# qhasm: int64 in24

# qhasm: int64 in25

# qhasm: int64 in26

# qhasm: int64 in27

# qhasm: int64 in28

# qhasm: int64 in29

# qhasm: int64 in30

# qhasm: int64 in31

# qhasm: int64 r

# qhasm: int64 i

# qhasm: int64 finalization

# qhasm: stack256 tmp

# qhasm: int64 z

# qhasm: stack64 out_stack

# qhasm: stack64 in_stack

# qhasm: stack64 inlen_stack

# qhasm: stack64 finalization_stack

# qhasm: stack64 r_stack

# qhasm: stack64 x00_stack

# qhasm: stack64 x01_stack

# qhasm: stack64 x02_stack

# qhasm: stack64 x03_stack

# qhasm: stack64 x04_stack

# qhasm: stack64 x05_stack

# qhasm: stack64 x06_stack

# qhasm: stack64 x07_stack

# qhasm: stack64 x08_stack

# qhasm: stack64 x09_stack

# qhasm: stack64 x0a_stack

# qhasm: stack64 x0b_stack

# qhasm: stack64 x0c_stack

# qhasm: stack64 x0d_stack

# qhasm: stack64 x0e_stack

# qhasm: stack64 x0f_stack

# qhasm: stack64 x10_stack

# qhasm: stack64 x11_stack

# qhasm: stack64 x12_stack

# qhasm: stack64 x13_stack

# qhasm: stack64 x14_stack

# qhasm: stack64 x15_stack

# qhasm: stack64 x16_stack

# qhasm: stack64 x17_stack

# qhasm: stack64 x18_stack

# qhasm: stack64 x19_stack

# qhasm: stack64 x1a_stack

# qhasm: stack64 x1b_stack

# qhasm: stack64 x1c_stack

# qhasm: stack64 x1d_stack

# qhasm: stack64 x1e_stack

# qhasm: stack64 x1f_stack

# qhasm: enter crypto_hash_cubehash1632_sparcv9
.section ".text"
.align 32
.global crypto_hash_cubehash1632_sparcv9
crypto_hash_cubehash1632_sparcv9:
save %sp,-448,%sp

# qhasm:   out_stack = out
# asm 1: stx <out=int64#1,[%fp+2023->out_stack=stack64#1]
# asm 2: stx <out=%i0,[%fp+2023->out_stack=32]
stx %i0,[%fp+2023-32]

# qhasm:   x08 = 0x4d42c787 & 0xfffffc00
# asm 1: sethi %lm(0x4d42c787),>x08=int64#1
# asm 2: sethi %lm(0x4d42c787),>x08=%i0
sethi %lm(0x4d42c787),%i0

# qhasm:   x09 = 0xa647a8b3 & 0xfffffc00
# asm 1: sethi %lm(0xa647a8b3),>x09=int64#4
# asm 2: sethi %lm(0xa647a8b3),>x09=%i3
sethi %lm(0xa647a8b3),%i3

# qhasm:   x0a = 0x97cf0bef & 0xfffffc00
# asm 1: sethi %lm(0x97cf0bef),>x0a=int64#5
# asm 2: sethi %lm(0x97cf0bef),>x0a=%i4
sethi %lm(0x97cf0bef),%i4

# qhasm:   x0b = 0x825b4537 & 0xfffffc00
# asm 1: sethi %lm(0x825b4537),>x0b=int64#6
# asm 2: sethi %lm(0x825b4537),>x0b=%i5
sethi %lm(0x825b4537),%i5

# qhasm:   x0c = 0xeef864d2 & 0xfffffc00
# asm 1: sethi %lm(0xeef864d2),>x0c=int64#7
# asm 2: sethi %lm(0xeef864d2),>x0c=%g1
sethi %lm(0xeef864d2),%g1

# qhasm:   x0d = 0xf22090c4 & 0xfffffc00
# asm 1: sethi %lm(0xf22090c4),>x0d=int64#8
# asm 2: sethi %lm(0xf22090c4),>x0d=%g4
sethi %lm(0xf22090c4),%g4

# qhasm:   x0e = 0xd0e5cd33 & 0xfffffc00
# asm 1: sethi %lm(0xd0e5cd33),>x0e=int64#9
# asm 2: sethi %lm(0xd0e5cd33),>x0e=%g5
sethi %lm(0xd0e5cd33),%g5

# qhasm:   x0f = 0xa23911ae & 0xfffffc00
# asm 1: sethi %lm(0xa23911ae),>x0f=int64#10
# asm 2: sethi %lm(0xa23911ae),>x0f=%o0
sethi %lm(0xa23911ae),%o0

# qhasm:   x08 |= 0x4d42c787 & 0x3ff
# asm 1: or <x08=int64#1,%lo(0x4d42c787),>x08=int64#1
# asm 2: or <x08=%i0,%lo(0x4d42c787),>x08=%i0
or %i0,%lo(0x4d42c787),%i0

# qhasm:   x09 |= 0xa647a8b3 & 0x3ff
# asm 1: or <x09=int64#4,%lo(0xa647a8b3),>x09=int64#4
# asm 2: or <x09=%i3,%lo(0xa647a8b3),>x09=%i3
or %i3,%lo(0xa647a8b3),%i3

# qhasm:   x0a |= 0x97cf0bef & 0x3ff
# asm 1: or <x0a=int64#5,%lo(0x97cf0bef),>x0a=int64#5
# asm 2: or <x0a=%i4,%lo(0x97cf0bef),>x0a=%i4
or %i4,%lo(0x97cf0bef),%i4

# qhasm:   x0b |= 0x825b4537 & 0x3ff
# asm 1: or <x0b=int64#6,%lo(0x825b4537),>x0b=int64#6
# asm 2: or <x0b=%i5,%lo(0x825b4537),>x0b=%i5
or %i5,%lo(0x825b4537),%i5

# qhasm:   x0c |= 0xeef864d2 & 0x3ff
# asm 1: or <x0c=int64#7,%lo(0xeef864d2),>x0c=int64#7
# asm 2: or <x0c=%g1,%lo(0xeef864d2),>x0c=%g1
or %g1,%lo(0xeef864d2),%g1

# qhasm:   x0d |= 0xf22090c4 & 0x3ff
# asm 1: or <x0d=int64#8,%lo(0xf22090c4),>x0d=int64#8
# asm 2: or <x0d=%g4,%lo(0xf22090c4),>x0d=%g4
or %g4,%lo(0xf22090c4),%g4

# qhasm:   x0e |= 0xd0e5cd33 & 0x3ff
# asm 1: or <x0e=int64#9,%lo(0xd0e5cd33),>x0e=int64#9
# asm 2: or <x0e=%g5,%lo(0xd0e5cd33),>x0e=%g5
or %g5,%lo(0xd0e5cd33),%g5

# qhasm:   x0f |= 0xa23911ae & 0x3ff
# asm 1: or <x0f=int64#10,%lo(0xa23911ae),>x0f=int64#10
# asm 2: or <x0f=%o0,%lo(0xa23911ae),>x0f=%o0
or %o0,%lo(0xa23911ae),%o0

# qhasm:           x10 = 0xfcd398d9 & 0xfffffc00
# asm 1: sethi %lm(0xfcd398d9),>x10=int64#11
# asm 2: sethi %lm(0xfcd398d9),>x10=%o1
sethi %lm(0xfcd398d9),%o1

# qhasm:           x11 = 0x148fe485 & 0xfffffc00
# asm 1: sethi %lm(0x148fe485),>x11=int64#12
# asm 2: sethi %lm(0x148fe485),>x11=%o2
sethi %lm(0x148fe485),%o2

# qhasm:           x12 = 0x1b017bef & 0xfffffc00
# asm 1: sethi %lm(0x1b017bef),>x12=int64#13
# asm 2: sethi %lm(0x1b017bef),>x12=%o3
sethi %lm(0x1b017bef),%o3

# qhasm:           x13 = 0xb6444532 & 0xfffffc00
# asm 1: sethi %lm(0xb6444532),>x13=int64#14
# asm 2: sethi %lm(0xb6444532),>x13=%o4
sethi %lm(0xb6444532),%o4

# qhasm:           x14 = 0x6a536159 & 0xfffffc00
# asm 1: sethi %lm(0x6a536159),>x14=int64#15
# asm 2: sethi %lm(0x6a536159),>x14=%o5
sethi %lm(0x6a536159),%o5

# qhasm:           x15 = 0x2ff5781c & 0xfffffc00
# asm 1: sethi %lm(0x2ff5781c),>x15=int64#16
# asm 2: sethi %lm(0x2ff5781c),>x15=%o7
sethi %lm(0x2ff5781c),%o7

# qhasm:   x0b_stack = x0b
# asm 1: stx <x0b=int64#6,[%fp+2023->x0b_stack=stack64#2]
# asm 2: stx <x0b=%i5,[%fp+2023->x0b_stack=40]
stx %i5,[%fp+2023-40]

# qhasm:           x16 = 0x91fa7934 & 0xfffffc00
# asm 1: sethi %lm(0x91fa7934),>x16=int64#6
# asm 2: sethi %lm(0x91fa7934),>x16=%i5
sethi %lm(0x91fa7934),%i5

# qhasm:           x17 = 0x0dbadea9 & 0xfffffc00
# asm 1: sethi %lm(0x0dbadea9),>x17=int64#17
# asm 2: sethi %lm(0x0dbadea9),>x17=%l0
sethi %lm(0x0dbadea9),%l0

# qhasm:           x10 |= 0xfcd398d9 & 0x3ff
# asm 1: or <x10=int64#11,%lo(0xfcd398d9),>x10=int64#11
# asm 2: or <x10=%o1,%lo(0xfcd398d9),>x10=%o1
or %o1,%lo(0xfcd398d9),%o1

# qhasm:           x11 |= 0x148fe485 & 0x3ff
# asm 1: or <x11=int64#12,%lo(0x148fe485),>x11=int64#12
# asm 2: or <x11=%o2,%lo(0x148fe485),>x11=%o2
or %o2,%lo(0x148fe485),%o2

# qhasm:           x12 |= 0x1b017bef & 0x3ff
# asm 1: or <x12=int64#13,%lo(0x1b017bef),>x12=int64#13
# asm 2: or <x12=%o3,%lo(0x1b017bef),>x12=%o3
or %o3,%lo(0x1b017bef),%o3

# qhasm:           x13 |= 0xb6444532 & 0x3ff
# asm 1: or <x13=int64#14,%lo(0xb6444532),>x13=int64#14
# asm 2: or <x13=%o4,%lo(0xb6444532),>x13=%o4
or %o4,%lo(0xb6444532),%o4

# qhasm:           x14 |= 0x6a536159 & 0x3ff
# asm 1: or <x14=int64#15,%lo(0x6a536159),>x14=int64#15
# asm 2: or <x14=%o5,%lo(0x6a536159),>x14=%o5
or %o5,%lo(0x6a536159),%o5

# qhasm:           x15 |= 0x2ff5781c & 0x3ff
# asm 1: or <x15=int64#16,%lo(0x2ff5781c),>x15=int64#16
# asm 2: or <x15=%o7,%lo(0x2ff5781c),>x15=%o7
or %o7,%lo(0x2ff5781c),%o7

# qhasm:   x0f_stack = x0f
# asm 1: stx <x0f=int64#10,[%fp+2023->x0f_stack=stack64#3]
# asm 2: stx <x0f=%o0,[%fp+2023->x0f_stack=48]
stx %o0,[%fp+2023-48]

# qhasm:           x16 |= 0x91fa7934 & 0x3ff
# asm 1: or <x16=int64#6,%lo(0x91fa7934),>x16=int64#6
# asm 2: or <x16=%i5,%lo(0x91fa7934),>x16=%i5
or %i5,%lo(0x91fa7934),%i5

# qhasm:           x17 |= 0x0dbadea9 & 0x3ff
# asm 1: or <x17=int64#17,%lo(0x0dbadea9),>x17=int64#10
# asm 2: or <x17=%l0,%lo(0x0dbadea9),>x17=%o0
or %l0,%lo(0x0dbadea9),%o0

# qhasm:   x18 = 0xd65c8a2b & 0xfffffc00
# asm 1: sethi %lm(0xd65c8a2b),>x18=int64#17
# asm 2: sethi %lm(0xd65c8a2b),>x18=%l0
sethi %lm(0xd65c8a2b),%l0

# qhasm:   x19 = 0xa5a70e75 & 0xfffffc00
# asm 1: sethi %lm(0xa5a70e75),>x19=int64#18
# asm 2: sethi %lm(0xa5a70e75),>x19=%l1
sethi %lm(0xa5a70e75),%l1

# qhasm:           x11_stack = x11
# asm 1: stx <x11=int64#12,[%fp+2023->x11_stack=stack64#4]
# asm 2: stx <x11=%o2,[%fp+2023->x11_stack=56]
stx %o2,[%fp+2023-56]

# qhasm:   x1a = 0xb1c62456 & 0xfffffc00
# asm 1: sethi %lm(0xb1c62456),>x1a=int64#12
# asm 2: sethi %lm(0xb1c62456),>x1a=%o2
sethi %lm(0xb1c62456),%o2

# qhasm:   x1b = 0xbc796576 & 0xfffffc00
# asm 1: sethi %lm(0xbc796576),>x1b=int64#19
# asm 2: sethi %lm(0xbc796576),>x1b=%l2
sethi %lm(0xbc796576),%l2

# qhasm:   x1c = 0x1921c8f7 & 0xfffffc00
# asm 1: sethi %lm(0x1921c8f7),>x1c=int64#20
# asm 2: sethi %lm(0x1921c8f7),>x1c=%l3
sethi %lm(0x1921c8f7),%l3

# qhasm:   x1d = 0xe7989af1 & 0xfffffc00
# asm 1: sethi %lm(0xe7989af1),>x1d=int64#21
# asm 2: sethi %lm(0xe7989af1),>x1d=%l4
sethi %lm(0xe7989af1),%l4

# qhasm:           x13_stack = x13
# asm 1: stx <x13=int64#14,[%fp+2023->x13_stack=stack64#5]
# asm 2: stx <x13=%o4,[%fp+2023->x13_stack=64]
stx %o4,[%fp+2023-64]

# qhasm:   x1e = 0x7795d246 & 0xfffffc00
# asm 1: sethi %lm(0x7795d246),>x1e=int64#14
# asm 2: sethi %lm(0x7795d246),>x1e=%o4
sethi %lm(0x7795d246),%o4

# qhasm:   x1f = 0xd43e3b44 & 0xfffffc00
# asm 1: sethi %lm(0xd43e3b44),>x1f=int64#22
# asm 2: sethi %lm(0xd43e3b44),>x1f=%l5
sethi %lm(0xd43e3b44),%l5

# qhasm:   x18 |= 0xd65c8a2b & 0x3ff
# asm 1: or <x18=int64#17,%lo(0xd65c8a2b),>x18=int64#17
# asm 2: or <x18=%l0,%lo(0xd65c8a2b),>x18=%l0
or %l0,%lo(0xd65c8a2b),%l0

# qhasm:   x19 |= 0xa5a70e75 & 0x3ff
# asm 1: or <x19=int64#18,%lo(0xa5a70e75),>x19=int64#18
# asm 2: or <x19=%l1,%lo(0xa5a70e75),>x19=%l1
or %l1,%lo(0xa5a70e75),%l1

# qhasm:           x15_stack = x15
# asm 1: stx <x15=int64#16,[%fp+2023->x15_stack=stack64#6]
# asm 2: stx <x15=%o7,[%fp+2023->x15_stack=72]
stx %o7,[%fp+2023-72]

# qhasm:   x1a |= 0xb1c62456 & 0x3ff
# asm 1: or <x1a=int64#12,%lo(0xb1c62456),>x1a=int64#12
# asm 2: or <x1a=%o2,%lo(0xb1c62456),>x1a=%o2
or %o2,%lo(0xb1c62456),%o2

# qhasm:   x1b |= 0xbc796576 & 0x3ff
# asm 1: or <x1b=int64#19,%lo(0xbc796576),>x1b=int64#16
# asm 2: or <x1b=%l2,%lo(0xbc796576),>x1b=%o7
or %l2,%lo(0xbc796576),%o7

# qhasm:           x16_stack = x16
# asm 1: stx <x16=int64#6,[%fp+2023->x16_stack=stack64#7]
# asm 2: stx <x16=%i5,[%fp+2023->x16_stack=80]
stx %i5,[%fp+2023-80]

# qhasm:   x1c |= 0x1921c8f7 & 0x3ff
# asm 1: or <x1c=int64#20,%lo(0x1921c8f7),>x1c=int64#6
# asm 2: or <x1c=%l3,%lo(0x1921c8f7),>x1c=%i5
or %l3,%lo(0x1921c8f7),%i5

# qhasm:   x1d |= 0xe7989af1 & 0x3ff
# asm 1: or <x1d=int64#21,%lo(0xe7989af1),>x1d=int64#19
# asm 2: or <x1d=%l4,%lo(0xe7989af1),>x1d=%l2
or %l4,%lo(0xe7989af1),%l2

# qhasm:           x17_stack = x17
# asm 1: stx <x17=int64#10,[%fp+2023->x17_stack=stack64#8]
# asm 2: stx <x17=%o0,[%fp+2023->x17_stack=88]
stx %o0,[%fp+2023-88]

# qhasm:   x1e |= 0x7795d246 & 0x3ff
# asm 1: or <x1e=int64#14,%lo(0x7795d246),>x1e=int64#10
# asm 2: or <x1e=%o4,%lo(0x7795d246),>x1e=%o0
or %o4,%lo(0x7795d246),%o0

# qhasm:   x1f |= 0xd43e3b44 & 0x3ff
# asm 1: or <x1f=int64#22,%lo(0xd43e3b44),>x1f=int64#14
# asm 2: or <x1f=%l5,%lo(0xd43e3b44),>x1f=%o4
or %l5,%lo(0xd43e3b44),%o4

# qhasm:   x18_stack = x18
# asm 1: stx <x18=int64#17,[%fp+2023->x18_stack=stack64#9]
# asm 2: stx <x18=%l0,[%fp+2023->x18_stack=96]
stx %l0,[%fp+2023-96]

# qhasm:           x00 = 0x2aea2a61 & 0xfffffc00
# asm 1: sethi %lm(0x2aea2a61),>x00=int64#17
# asm 2: sethi %lm(0x2aea2a61),>x00=%l0
sethi %lm(0x2aea2a61),%l0

# qhasm:           x01 = 0x50f494d4 & 0xfffffc00
# asm 1: sethi %lm(0x50f494d4),>x01=int64#20
# asm 2: sethi %lm(0x50f494d4),>x01=%l3
sethi %lm(0x50f494d4),%l3

# qhasm:   x19_stack = x19
# asm 1: stx <x19=int64#18,[%fp+2023->x19_stack=stack64#10]
# asm 2: stx <x19=%l1,[%fp+2023->x19_stack=104]
stx %l1,[%fp+2023-104]

# qhasm:           x02 = 0x2d538b8b & 0xfffffc00
# asm 1: sethi %lm(0x2d538b8b),>x02=int64#18
# asm 2: sethi %lm(0x2d538b8b),>x02=%l1
sethi %lm(0x2d538b8b),%l1

# qhasm:           x03 = 0x4167d83e & 0xfffffc00
# asm 1: sethi %lm(0x4167d83e),>x03=int64#21
# asm 2: sethi %lm(0x4167d83e),>x03=%l4
sethi %lm(0x4167d83e),%l4

# qhasm:   x1a_stack = x1a
# asm 1: stx <x1a=int64#12,[%fp+2023->x1a_stack=stack64#11]
# asm 2: stx <x1a=%o2,[%fp+2023->x1a_stack=112]
stx %o2,[%fp+2023-112]

# qhasm:           x04 = 0x3fee2313 & 0xfffffc00
# asm 1: sethi %lm(0x3fee2313),>x04=int64#12
# asm 2: sethi %lm(0x3fee2313),>x04=%o2
sethi %lm(0x3fee2313),%o2

# qhasm:           x05 = 0xc701cf8c & 0xfffffc00
# asm 1: sethi %lm(0xc701cf8c),>x05=int64#22
# asm 2: sethi %lm(0xc701cf8c),>x05=%l5
sethi %lm(0xc701cf8c),%l5

# qhasm:   x1b_stack = x1b
# asm 1: stx <x1b=int64#16,[%fp+2023->x1b_stack=stack64#12]
# asm 2: stx <x1b=%o7,[%fp+2023->x1b_stack=120]
stx %o7,[%fp+2023-120]

# qhasm:           x06 = 0xcc39968e & 0xfffffc00
# asm 1: sethi %lm(0xcc39968e),>x06=int64#16
# asm 2: sethi %lm(0xcc39968e),>x06=%o7
sethi %lm(0xcc39968e),%o7

# qhasm:           x07 = 0x50ac5695 & 0xfffffc00
# asm 1: sethi %lm(0x50ac5695),>x07=int64#23
# asm 2: sethi %lm(0x50ac5695),>x07=%l6
sethi %lm(0x50ac5695),%l6

# qhasm:   x1c_stack = x1c
# asm 1: stx <x1c=int64#6,[%fp+2023->x1c_stack=stack64#13]
# asm 2: stx <x1c=%i5,[%fp+2023->x1c_stack=128]
stx %i5,[%fp+2023-128]

# qhasm:           x00 |= 0x2aea2a61 & 0x3ff
# asm 1: or <x00=int64#17,%lo(0x2aea2a61),>x00=int64#6
# asm 2: or <x00=%l0,%lo(0x2aea2a61),>x00=%i5
or %l0,%lo(0x2aea2a61),%i5

# qhasm:           x01 |= 0x50f494d4 & 0x3ff
# asm 1: or <x01=int64#20,%lo(0x50f494d4),>x01=int64#17
# asm 2: or <x01=%l3,%lo(0x50f494d4),>x01=%l0
or %l3,%lo(0x50f494d4),%l0

# qhasm:   x1d_stack = x1d
# asm 1: stx <x1d=int64#19,[%fp+2023->x1d_stack=stack64#14]
# asm 2: stx <x1d=%l2,[%fp+2023->x1d_stack=136]
stx %l2,[%fp+2023-136]

# qhasm:           x02 |= 0x2d538b8b & 0x3ff
# asm 1: or <x02=int64#18,%lo(0x2d538b8b),>x02=int64#18
# asm 2: or <x02=%l1,%lo(0x2d538b8b),>x02=%l1
or %l1,%lo(0x2d538b8b),%l1

# qhasm:           x03 |= 0x4167d83e & 0x3ff
# asm 1: or <x03=int64#21,%lo(0x4167d83e),>x03=int64#19
# asm 2: or <x03=%l4,%lo(0x4167d83e),>x03=%l2
or %l4,%lo(0x4167d83e),%l2

# qhasm:   x1e_stack = x1e
# asm 1: stx <x1e=int64#10,[%fp+2023->x1e_stack=stack64#15]
# asm 2: stx <x1e=%o0,[%fp+2023->x1e_stack=144]
stx %o0,[%fp+2023-144]

# qhasm:           x04 |= 0x3fee2313 & 0x3ff
# asm 1: or <x04=int64#12,%lo(0x3fee2313),>x04=int64#10
# asm 2: or <x04=%o2,%lo(0x3fee2313),>x04=%o0
or %o2,%lo(0x3fee2313),%o0

# qhasm:           x05 |= 0xc701cf8c & 0x3ff
# asm 1: or <x05=int64#22,%lo(0xc701cf8c),>x05=int64#12
# asm 2: or <x05=%l5,%lo(0xc701cf8c),>x05=%o2
or %l5,%lo(0xc701cf8c),%o2

# qhasm:   x1f_stack = x1f
# asm 1: stx <x1f=int64#14,[%fp+2023->x1f_stack=stack64#16]
# asm 2: stx <x1f=%o4,[%fp+2023->x1f_stack=152]
stx %o4,[%fp+2023-152]

# qhasm:           x06 |= 0xcc39968e & 0x3ff
# asm 1: or <x06=int64#16,%lo(0xcc39968e),>x06=int64#14
# asm 2: or <x06=%o7,%lo(0xcc39968e),>x06=%o4
or %o7,%lo(0xcc39968e),%o4

# qhasm:           x07 |= 0x50ac5695 & 0x3ff
# asm 1: or <x07=int64#23,%lo(0x50ac5695),>x07=int64#16
# asm 2: or <x07=%l6,%lo(0x50ac5695),>x07=%o7
or %l6,%lo(0x50ac5695),%o7

# qhasm:   finalization = 0
# asm 1: add %g0,0,>finalization=int64#20
# asm 2: add %g0,0,>finalization=%l3
add %g0,0,%l3

# qhasm:                      unsigned<? inlen - 32
# asm 1: subcc <inlen=int64#3,32,%g0
# asm 2: subcc <inlen=%i2,32,%g0
subcc %i2,32,%g0

# qhasm: goto inlenbelow32 if unsigned<
blu,pt %xcc,._inlenbelow32
nop

# qhasm: mainloop:
._mainloop:

# qhasm:   inlen -= 32
# asm 1: sub <inlen=int64#3,32,>inlen=int64#3
# asm 2: sub <inlen=%i2,32,>inlen=%i2
sub %i2,32,%i2

# qhasm:   r = 16
# asm 1: add %g0,16,>r=int64#21
# asm 2: add %g0,16,>r=%l4
add %g0,16,%l4

# qhasm:   finalization_stack = finalization
# asm 1: stx <finalization=int64#20,[%fp+2023->finalization_stack=stack64#17]
# asm 2: stx <finalization=%l3,[%fp+2023->finalization_stack=160]
stx %l3,[%fp+2023-160]

# qhasm:   inlen_stack = inlen
# asm 1: stx <inlen=int64#3,[%fp+2023->inlen_stack=stack64#18]
# asm 2: stx <inlen=%i2,[%fp+2023->inlen_stack=168]
stx %i2,[%fp+2023-168]

# qhasm:   in0 = *(uint8 *) (in + 0)
# asm 1: ldub [<in=int64#2+0],>in0=int64#3
# asm 2: ldub [<in=%i1+0],>in0=%i2
ldub [%i1+0],%i2

# qhasm:     in1 = *(uint8 *) (in + 1)
# asm 1: ldub [<in=int64#2+1],>in1=int64#20
# asm 2: ldub [<in=%i1+1],>in1=%l3
ldub [%i1+1],%l3

# qhasm:       in2 = *(uint8 *) (in + 2)
# asm 1: ldub [<in=int64#2+2],>in2=int64#22
# asm 2: ldub [<in=%i1+2],>in2=%l5
ldub [%i1+2],%l5

# qhasm:         in3 = *(uint8 *) (in + 3)
# asm 1: ldub [<in=int64#2+3],>in3=int64#23
# asm 2: ldub [<in=%i1+3],>in3=%l6
ldub [%i1+3],%l6

# qhasm:   x00 ^= in0
# asm 1: xor <x00=int64#6,<in0=int64#3,>x00=int64#3
# asm 2: xor <x00=%i5,<in0=%i2,>x00=%i2
xor %i5,%i2,%i2

# qhasm:           in4 = *(uint8 *) (in + 4)
# asm 1: ldub [<in=int64#2+4],>in4=int64#24
# asm 2: ldub [<in=%i1+4],>in4=%l7
ldub [%i1+4],%l7

# qhasm:     in1 <<= 8
# asm 1: sllx <in1=int64#20,8,>in1=int64#6
# asm 2: sllx <in1=%l3,8,>in1=%i5
sllx %l3,8,%i5

# qhasm:             in5 = *(uint8 *) (in + 5)
# asm 1: ldub [<in=int64#2+5],>in5=int64#20
# asm 2: ldub [<in=%i1+5],>in5=%l3
ldub [%i1+5],%l3

# qhasm:     x00 ^= in1
# asm 1: xor <x00=int64#3,<in1=int64#6,>x00=int64#3
# asm 2: xor <x00=%i2,<in1=%i5,>x00=%i2
xor %i2,%i5,%i2

# qhasm:       in2 <<= 16
# asm 1: sllx <in2=int64#22,16,>in2=int64#6
# asm 2: sllx <in2=%l5,16,>in2=%i5
sllx %l5,16,%i5

# qhasm:               in6 = *(uint8 *) (in + 6)
# asm 1: ldub [<in=int64#2+6],>in6=int64#22
# asm 2: ldub [<in=%i1+6],>in6=%l5
ldub [%i1+6],%l5

# qhasm:       x00 ^= in2
# asm 1: xor <x00=int64#3,<in2=int64#6,>x00=int64#3
# asm 2: xor <x00=%i2,<in2=%i5,>x00=%i2
xor %i2,%i5,%i2

# qhasm:         in3 <<= 24
# asm 1: sllx <in3=int64#23,24,>in3=int64#6
# asm 2: sllx <in3=%l6,24,>in3=%i5
sllx %l6,24,%i5

# qhasm:                 in7 = *(uint8 *) (in + 7)
# asm 1: ldub [<in=int64#2+7],>in7=int64#23
# asm 2: ldub [<in=%i1+7],>in7=%l6
ldub [%i1+7],%l6

# qhasm:         x00 ^= in3
# asm 1: xor <x00=int64#3,<in3=int64#6,>x00=int64#6
# asm 2: xor <x00=%i2,<in3=%i5,>x00=%i5
xor %i2,%i5,%i5

# qhasm:                   in8 = *(uint8 *) (in + 8)
# asm 1: ldub [<in=int64#2+8],>in8=int64#3
# asm 2: ldub [<in=%i1+8],>in8=%i2
ldub [%i1+8],%i2

# qhasm:           x01 ^= in4
# asm 1: xor <x01=int64#17,<in4=int64#24,>x01=int64#17
# asm 2: xor <x01=%l0,<in4=%l7,>x01=%l0
xor %l0,%l7,%l0

# qhasm:             in5 <<= 8
# asm 1: sllx <in5=int64#20,8,>in5=int64#20
# asm 2: sllx <in5=%l3,8,>in5=%l3
sllx %l3,8,%l3

# qhasm:                     in9 = *(uint8 *) (in + 9)
# asm 1: ldub [<in=int64#2+9],>in9=int64#24
# asm 2: ldub [<in=%i1+9],>in9=%l7
ldub [%i1+9],%l7

# qhasm:             x01 ^= in5
# asm 1: xor <x01=int64#17,<in5=int64#20,>x01=int64#17
# asm 2: xor <x01=%l0,<in5=%l3,>x01=%l0
xor %l0,%l3,%l0

# qhasm:               in6 <<= 16
# asm 1: sllx <in6=int64#22,16,>in6=int64#20
# asm 2: sllx <in6=%l5,16,>in6=%l3
sllx %l5,16,%l3

# qhasm:                       in10 = *(uint8 *) (in + 10)
# asm 1: ldub [<in=int64#2+10],>in10=int64#22
# asm 2: ldub [<in=%i1+10],>in10=%l5
ldub [%i1+10],%l5

# qhasm:               x01 ^= in6
# asm 1: xor <x01=int64#17,<in6=int64#20,>x01=int64#17
# asm 2: xor <x01=%l0,<in6=%l3,>x01=%l0
xor %l0,%l3,%l0

# qhasm:                 in7 <<= 24
# asm 1: sllx <in7=int64#23,24,>in7=int64#20
# asm 2: sllx <in7=%l6,24,>in7=%l3
sllx %l6,24,%l3

# qhasm:                         in11 = *(uint8 *) (in + 11)
# asm 1: ldub [<in=int64#2+11],>in11=int64#23
# asm 2: ldub [<in=%i1+11],>in11=%l6
ldub [%i1+11],%l6

# qhasm:                 x01 ^= in7
# asm 1: xor <x01=int64#17,<in7=int64#20,>x01=int64#17
# asm 2: xor <x01=%l0,<in7=%l3,>x01=%l0
xor %l0,%l3,%l0

# qhasm:                           in12 = *(uint8 *) (in + 12)
# asm 1: ldub [<in=int64#2+12],>in12=int64#20
# asm 2: ldub [<in=%i1+12],>in12=%l3
ldub [%i1+12],%l3

# qhasm:                   x02 ^= in8
# asm 1: xor <x02=int64#18,<in8=int64#3,>x02=int64#3
# asm 2: xor <x02=%l1,<in8=%i2,>x02=%i2
xor %l1,%i2,%i2

# qhasm:                     in9 <<= 8
# asm 1: sllx <in9=int64#24,8,>in9=int64#18
# asm 2: sllx <in9=%l7,8,>in9=%l1
sllx %l7,8,%l1

# qhasm:                             in13 = *(uint8 *) (in + 13)
# asm 1: ldub [<in=int64#2+13],>in13=int64#24
# asm 2: ldub [<in=%i1+13],>in13=%l7
ldub [%i1+13],%l7

# qhasm:                     x02 ^= in9
# asm 1: xor <x02=int64#3,<in9=int64#18,>x02=int64#3
# asm 2: xor <x02=%i2,<in9=%l1,>x02=%i2
xor %i2,%l1,%i2

# qhasm:                       in10 <<= 16
# asm 1: sllx <in10=int64#22,16,>in10=int64#18
# asm 2: sllx <in10=%l5,16,>in10=%l1
sllx %l5,16,%l1

# qhasm:                               in14 = *(uint8 *) (in + 14)
# asm 1: ldub [<in=int64#2+14],>in14=int64#22
# asm 2: ldub [<in=%i1+14],>in14=%l5
ldub [%i1+14],%l5

# qhasm:                       x02 ^= in10
# asm 1: xor <x02=int64#3,<in10=int64#18,>x02=int64#3
# asm 2: xor <x02=%i2,<in10=%l1,>x02=%i2
xor %i2,%l1,%i2

# qhasm:                         in11 <<= 24
# asm 1: sllx <in11=int64#23,24,>in11=int64#18
# asm 2: sllx <in11=%l6,24,>in11=%l1
sllx %l6,24,%l1

# qhasm:                                 in15 = *(uint8 *) (in + 15)
# asm 1: ldub [<in=int64#2+15],>in15=int64#23
# asm 2: ldub [<in=%i1+15],>in15=%l6
ldub [%i1+15],%l6

# qhasm:                         x02 ^= in11
# asm 1: xor <x02=int64#3,<in11=int64#18,>x02=int64#18
# asm 2: xor <x02=%i2,<in11=%l1,>x02=%l1
xor %i2,%l1,%l1

# qhasm:                                   in16 = *(uint8 *) (in + 16)
# asm 1: ldub [<in=int64#2+16],>in16=int64#3
# asm 2: ldub [<in=%i1+16],>in16=%i2
ldub [%i1+16],%i2

# qhasm:                           x03 ^= in12
# asm 1: xor <x03=int64#19,<in12=int64#20,>x03=int64#19
# asm 2: xor <x03=%l2,<in12=%l3,>x03=%l2
xor %l2,%l3,%l2

# qhasm:                             in13 <<= 8
# asm 1: sllx <in13=int64#24,8,>in13=int64#20
# asm 2: sllx <in13=%l7,8,>in13=%l3
sllx %l7,8,%l3

# qhasm:                                     in17 = *(uint8 *) (in + 17)
# asm 1: ldub [<in=int64#2+17],>in17=int64#24
# asm 2: ldub [<in=%i1+17],>in17=%l7
ldub [%i1+17],%l7

# qhasm:                             x03 ^= in13
# asm 1: xor <x03=int64#19,<in13=int64#20,>x03=int64#19
# asm 2: xor <x03=%l2,<in13=%l3,>x03=%l2
xor %l2,%l3,%l2

# qhasm:                               in14 <<= 16
# asm 1: sllx <in14=int64#22,16,>in14=int64#20
# asm 2: sllx <in14=%l5,16,>in14=%l3
sllx %l5,16,%l3

# qhasm:                                       in18 = *(uint8 *) (in + 18)
# asm 1: ldub [<in=int64#2+18],>in18=int64#22
# asm 2: ldub [<in=%i1+18],>in18=%l5
ldub [%i1+18],%l5

# qhasm:                               x03 ^= in14
# asm 1: xor <x03=int64#19,<in14=int64#20,>x03=int64#19
# asm 2: xor <x03=%l2,<in14=%l3,>x03=%l2
xor %l2,%l3,%l2

# qhasm:                                 in15 <<= 24
# asm 1: sllx <in15=int64#23,24,>in15=int64#20
# asm 2: sllx <in15=%l6,24,>in15=%l3
sllx %l6,24,%l3

# qhasm:                                         in19 = *(uint8 *) (in + 19)
# asm 1: ldub [<in=int64#2+19],>in19=int64#23
# asm 2: ldub [<in=%i1+19],>in19=%l6
ldub [%i1+19],%l6

# qhasm:                                 x03 ^= in15
# asm 1: xor <x03=int64#19,<in15=int64#20,>x03=int64#19
# asm 2: xor <x03=%l2,<in15=%l3,>x03=%l2
xor %l2,%l3,%l2

# qhasm:                                           in20 = *(uint8 *) (in + 20)
# asm 1: ldub [<in=int64#2+20],>in20=int64#20
# asm 2: ldub [<in=%i1+20],>in20=%l3
ldub [%i1+20],%l3

# qhasm:                                   x04 ^= in16
# asm 1: xor <x04=int64#10,<in16=int64#3,>x04=int64#3
# asm 2: xor <x04=%o0,<in16=%i2,>x04=%i2
xor %o0,%i2,%i2

# qhasm:                                     in17 <<= 8
# asm 1: sllx <in17=int64#24,8,>in17=int64#10
# asm 2: sllx <in17=%l7,8,>in17=%o0
sllx %l7,8,%o0

# qhasm:                                             in21 = *(uint8 *) (in + 21)
# asm 1: ldub [<in=int64#2+21],>in21=int64#24
# asm 2: ldub [<in=%i1+21],>in21=%l7
ldub [%i1+21],%l7

# qhasm:                                     x04 ^= in17
# asm 1: xor <x04=int64#3,<in17=int64#10,>x04=int64#3
# asm 2: xor <x04=%i2,<in17=%o0,>x04=%i2
xor %i2,%o0,%i2

# qhasm:                                       in18 <<= 16
# asm 1: sllx <in18=int64#22,16,>in18=int64#10
# asm 2: sllx <in18=%l5,16,>in18=%o0
sllx %l5,16,%o0

# qhasm:                                               in22 = *(uint8 *) (in + 22)
# asm 1: ldub [<in=int64#2+22],>in22=int64#22
# asm 2: ldub [<in=%i1+22],>in22=%l5
ldub [%i1+22],%l5

# qhasm:                                       x04 ^= in18
# asm 1: xor <x04=int64#3,<in18=int64#10,>x04=int64#3
# asm 2: xor <x04=%i2,<in18=%o0,>x04=%i2
xor %i2,%o0,%i2

# qhasm:                                         in19 <<= 24
# asm 1: sllx <in19=int64#23,24,>in19=int64#10
# asm 2: sllx <in19=%l6,24,>in19=%o0
sllx %l6,24,%o0

# qhasm:                                                 in23 = *(uint8 *) (in + 23)
# asm 1: ldub [<in=int64#2+23],>in23=int64#23
# asm 2: ldub [<in=%i1+23],>in23=%l6
ldub [%i1+23],%l6

# qhasm:                                         x04 ^= in19
# asm 1: xor <x04=int64#3,<in19=int64#10,>x04=int64#10
# asm 2: xor <x04=%i2,<in19=%o0,>x04=%o0
xor %i2,%o0,%o0

# qhasm:                                                   in24 = *(uint8 *) (in + 24)
# asm 1: ldub [<in=int64#2+24],>in24=int64#3
# asm 2: ldub [<in=%i1+24],>in24=%i2
ldub [%i1+24],%i2

# qhasm:                                           x05 ^= in20
# asm 1: xor <x05=int64#12,<in20=int64#20,>x05=int64#12
# asm 2: xor <x05=%o2,<in20=%l3,>x05=%o2
xor %o2,%l3,%o2

# qhasm:                                             in21 <<= 8
# asm 1: sllx <in21=int64#24,8,>in21=int64#20
# asm 2: sllx <in21=%l7,8,>in21=%l3
sllx %l7,8,%l3

# qhasm:                                                     in25 = *(uint8 *) (in + 25)
# asm 1: ldub [<in=int64#2+25],>in25=int64#24
# asm 2: ldub [<in=%i1+25],>in25=%l7
ldub [%i1+25],%l7

# qhasm:                                             x05 ^= in21
# asm 1: xor <x05=int64#12,<in21=int64#20,>x05=int64#12
# asm 2: xor <x05=%o2,<in21=%l3,>x05=%o2
xor %o2,%l3,%o2

# qhasm:                                               in22 <<= 16
# asm 1: sllx <in22=int64#22,16,>in22=int64#20
# asm 2: sllx <in22=%l5,16,>in22=%l3
sllx %l5,16,%l3

# qhasm:                                                       in26 = *(uint8 *) (in + 26)
# asm 1: ldub [<in=int64#2+26],>in26=int64#22
# asm 2: ldub [<in=%i1+26],>in26=%l5
ldub [%i1+26],%l5

# qhasm:                                               x05 ^= in22
# asm 1: xor <x05=int64#12,<in22=int64#20,>x05=int64#12
# asm 2: xor <x05=%o2,<in22=%l3,>x05=%o2
xor %o2,%l3,%o2

# qhasm:                                                 in23 <<= 24
# asm 1: sllx <in23=int64#23,24,>in23=int64#20
# asm 2: sllx <in23=%l6,24,>in23=%l3
sllx %l6,24,%l3

# qhasm:                                                         in27 = *(uint8 *) (in + 27)
# asm 1: ldub [<in=int64#2+27],>in27=int64#23
# asm 2: ldub [<in=%i1+27],>in27=%l6
ldub [%i1+27],%l6

# qhasm:                                                 x05 ^= in23
# asm 1: xor <x05=int64#12,<in23=int64#20,>x05=int64#12
# asm 2: xor <x05=%o2,<in23=%l3,>x05=%o2
xor %o2,%l3,%o2

# qhasm:                                                           in28 = *(uint8 *) (in + 28)
# asm 1: ldub [<in=int64#2+28],>in28=int64#20
# asm 2: ldub [<in=%i1+28],>in28=%l3
ldub [%i1+28],%l3

# qhasm:                                                   x06 ^= in24
# asm 1: xor <x06=int64#14,<in24=int64#3,>x06=int64#3
# asm 2: xor <x06=%o4,<in24=%i2,>x06=%i2
xor %o4,%i2,%i2

# qhasm:                                                     in25 <<= 8
# asm 1: sllx <in25=int64#24,8,>in25=int64#14
# asm 2: sllx <in25=%l7,8,>in25=%o4
sllx %l7,8,%o4

# qhasm:                                                             in29 = *(uint8 *) (in + 29)
# asm 1: ldub [<in=int64#2+29],>in29=int64#24
# asm 2: ldub [<in=%i1+29],>in29=%l7
ldub [%i1+29],%l7

# qhasm:                                                     x06 ^= in25
# asm 1: xor <x06=int64#3,<in25=int64#14,>x06=int64#3
# asm 2: xor <x06=%i2,<in25=%o4,>x06=%i2
xor %i2,%o4,%i2

# qhasm:                                                       in26 <<= 16
# asm 1: sllx <in26=int64#22,16,>in26=int64#14
# asm 2: sllx <in26=%l5,16,>in26=%o4
sllx %l5,16,%o4

# qhasm:                                                               in30 = *(uint8 *) (in + 30)
# asm 1: ldub [<in=int64#2+30],>in30=int64#22
# asm 2: ldub [<in=%i1+30],>in30=%l5
ldub [%i1+30],%l5

# qhasm:                                                       x06 ^= in26
# asm 1: xor <x06=int64#3,<in26=int64#14,>x06=int64#3
# asm 2: xor <x06=%i2,<in26=%o4,>x06=%i2
xor %i2,%o4,%i2

# qhasm:                                                         in27 <<= 24
# asm 1: sllx <in27=int64#23,24,>in27=int64#14
# asm 2: sllx <in27=%l6,24,>in27=%o4
sllx %l6,24,%o4

# qhasm:                                                                 in31 = *(uint8 *) (in + 31)
# asm 1: ldub [<in=int64#2+31],>in31=int64#23
# asm 2: ldub [<in=%i1+31],>in31=%l6
ldub [%i1+31],%l6

# qhasm:                                                         x06 ^= in27
# asm 1: xor <x06=int64#3,<in27=int64#14,>x06=int64#14
# asm 2: xor <x06=%i2,<in27=%o4,>x06=%o4
xor %i2,%o4,%o4

# qhasm:                                                             in29 <<= 8
# asm 1: sllx <in29=int64#24,8,>in29=int64#3
# asm 2: sllx <in29=%l7,8,>in29=%i2
sllx %l7,8,%i2

# qhasm:                                                           x07 ^= in28
# asm 1: xor <x07=int64#16,<in28=int64#20,>x07=int64#16
# asm 2: xor <x07=%o7,<in28=%l3,>x07=%o7
xor %o7,%l3,%o7

# qhasm:                                                               in30 <<= 16
# asm 1: sllx <in30=int64#22,16,>in30=int64#20
# asm 2: sllx <in30=%l5,16,>in30=%l3
sllx %l5,16,%l3

# qhasm:                                                             x07 ^= in29
# asm 1: xor <x07=int64#16,<in29=int64#3,>x07=int64#3
# asm 2: xor <x07=%o7,<in29=%i2,>x07=%i2
xor %o7,%i2,%i2

# qhasm:                                                                 in31 <<= 24
# asm 1: sllx <in31=int64#23,24,>in31=int64#16
# asm 2: sllx <in31=%l6,24,>in31=%o7
sllx %l6,24,%o7

# qhasm:                                                               x07 ^= in30
# asm 1: xor <x07=int64#3,<in30=int64#20,>x07=int64#3
# asm 2: xor <x07=%i2,<in30=%l3,>x07=%i2
xor %i2,%l3,%i2

# qhasm:                                                                 x07 ^= in31
# asm 1: xor <x07=int64#3,<in31=int64#16,>x07=int64#3
# asm 2: xor <x07=%i2,<in31=%o7,>x07=%i2
xor %i2,%o7,%i2

# qhasm:   in += 32
# asm 1: add <in=int64#2,32,>in=int64#2
# asm 2: add <in=%i1,32,>in=%i1
add %i1,32,%i1

# qhasm:   in_stack = in
# asm 1: stx <in=int64#2,[%fp+2023->in_stack=stack64#19]
# asm 2: stx <in=%i1,[%fp+2023->in_stack=176]
stx %i1,[%fp+2023-176]

# qhasm: x01_stack = x01
# asm 1: stx <x01=int64#17,[%fp+2023->x01_stack=stack64#20]
# asm 2: stx <x01=%l0,[%fp+2023->x01_stack=184]
stx %l0,[%fp+2023-184]

# qhasm: x03_stack = x03
# asm 1: stx <x03=int64#19,[%fp+2023->x03_stack=stack64#21]
# asm 2: stx <x03=%l2,[%fp+2023->x03_stack=192]
stx %l2,[%fp+2023-192]

# qhasm: x05_stack = x05
# asm 1: stx <x05=int64#12,[%fp+2023->x05_stack=stack64#22]
# asm 2: stx <x05=%o2,[%fp+2023->x05_stack=200]
stx %o2,[%fp+2023-200]

# qhasm: x07_stack = x07
# asm 1: stx <x07=int64#3,[%fp+2023->x07_stack=stack64#23]
# asm 2: stx <x07=%i2,[%fp+2023->x07_stack=208]
stx %i2,[%fp+2023-208]

# qhasm: x16 = x16_stack
# asm 1: ldx [%fp+2023-<x16_stack=stack64#7],>x16=int64#2
# asm 2: ldx [%fp+2023-<x16_stack=80],>x16=%i1
ldx [%fp+2023-80],%i1

# qhasm: x18 = x18_stack
# asm 1: ldx [%fp+2023-<x18_stack=stack64#9],>x18=int64#3
# asm 2: ldx [%fp+2023-<x18_stack=96],>x18=%i2
ldx [%fp+2023-96],%i2

# qhasm: x1a = x1a_stack
# asm 1: ldx [%fp+2023-<x1a_stack=stack64#11],>x1a=int64#12
# asm 2: ldx [%fp+2023-<x1a_stack=112],>x1a=%o2
ldx [%fp+2023-112],%o2

# qhasm: x1c = x1c_stack
# asm 1: ldx [%fp+2023-<x1c_stack=stack64#13],>x1c=int64#16
# asm 2: ldx [%fp+2023-<x1c_stack=128],>x1c=%o7
ldx [%fp+2023-128],%o7

# qhasm: x1e = x1e_stack
# asm 1: ldx [%fp+2023-<x1e_stack=stack64#15],>x1e=int64#17
# asm 2: ldx [%fp+2023-<x1e_stack=144],>x1e=%l0
ldx [%fp+2023-144],%l0

# qhasm: morerounds:
._morerounds:

# qhasm: s00 = x00 << 7
# asm 1: sllx <x00=int64#6,7,>s00=int64#19
# asm 2: sllx <x00=%i5,7,>s00=%l2
sllx %i5,7,%l2

# qhasm: x10 += x00
# asm 1: add <x10=int64#11,<x00=int64#6,>x10=int64#11
# asm 2: add <x10=%o1,<x00=%i5,>x10=%o1
add %o1,%i5,%o1

# qhasm: s08 = x08 << 7
# asm 1: sllx <x08=int64#1,7,>s08=int64#20
# asm 2: sllx <x08=%i0,7,>s08=%l3
sllx %i0,7,%l3

# qhasm: x18 += x08
# asm 1: add <x18=int64#3,<x08=int64#1,>x18=int64#3
# asm 2: add <x18=%i2,<x08=%i0,>x18=%i2
add %i2,%i0,%i2

# qhasm: (uint32) x00 >>= 25
# asm 1: srl <x00=int64#6,25,>x00=int64#6
# asm 2: srl <x00=%i5,25,>x00=%i5
srl %i5,25,%i5

# qhasm: (uint32) x08 >>= 25
# asm 1: srl <x08=int64#1,25,>x08=int64#1
# asm 2: srl <x08=%i0,25,>x08=%i0
srl %i0,25,%i0

# qhasm:                 r_stack = r
# asm 1: stx <r=int64#21,[%fp+2023->r_stack=stack64#7]
# asm 2: stx <r=%l4,[%fp+2023->r_stack=80]
stx %l4,[%fp+2023-80]

# qhasm: x00 |= s00
# asm 1: or  <x00=int64#6,<s00=int64#19,>x00=int64#6
# asm 2: or  <x00=%i5,<s00=%l2,>x00=%i5
or  %i5,%l2,%i5

# qhasm: x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#20,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%l3,>x08=%i0
or  %i0,%l3,%i0

# qhasm: x00 ^= x18
# asm 1: xor <x00=int64#6,<x18=int64#3,>x00=int64#6
# asm 2: xor <x00=%i5,<x18=%i2,>x00=%i5
xor %i5,%i2,%i5

# qhasm: x08 ^= x10
# asm 1: xor <x08=int64#1,<x10=int64#11,>x08=int64#1
# asm 2: xor <x08=%i0,<x10=%o1,>x08=%i0
xor %i0,%o1,%i0

# qhasm:   s04 = x04 << 7
# asm 1: sllx <x04=int64#10,7,>s04=int64#19
# asm 2: sllx <x04=%o0,7,>s04=%l2
sllx %o0,7,%l2

# qhasm:   x14 += x04
# asm 1: add <x14=int64#15,<x04=int64#10,>x14=int64#15
# asm 2: add <x14=%o5,<x04=%o0,>x14=%o5
add %o5,%o0,%o5

# qhasm:   s0c = x0c << 7
# asm 1: sllx <x0c=int64#7,7,>s0c=int64#20
# asm 2: sllx <x0c=%g1,7,>s0c=%l3
sllx %g1,7,%l3

# qhasm:   x1c += x0c
# asm 1: add <x1c=int64#16,<x0c=int64#7,>x1c=int64#16
# asm 2: add <x1c=%o7,<x0c=%g1,>x1c=%o7
add %o7,%g1,%o7

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int64#10,25,>x04=int64#10
# asm 2: srl <x04=%o0,25,>x04=%o0
srl %o0,25,%o0

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int64#7,25,>x0c=int64#7
# asm 2: srl <x0c=%g1,25,>x0c=%g1
srl %g1,25,%g1

# qhasm:   x04 |= s04
# asm 1: or  <x04=int64#10,<s04=int64#19,>x04=int64#10
# asm 2: or  <x04=%o0,<s04=%l2,>x04=%o0
or  %o0,%l2,%o0

# qhasm:   x0c |= s0c
# asm 1: or  <x0c=int64#7,<s0c=int64#20,>x0c=int64#7
# asm 2: or  <x0c=%g1,<s0c=%l3,>x0c=%g1
or  %g1,%l3,%g1

# qhasm:   x04 ^= x1c
# asm 1: xor <x04=int64#10,<x1c=int64#16,>x04=int64#10
# asm 2: xor <x04=%o0,<x1c=%o7,>x04=%o0
xor %o0,%o7,%o0

# qhasm:   x0c ^= x14
# asm 1: xor <x0c=int64#7,<x14=int64#15,>x0c=int64#7
# asm 2: xor <x0c=%g1,<x14=%o5,>x0c=%g1
xor %g1,%o5,%g1

# qhasm: s02 = x02 << 7
# asm 1: sllx <x02=int64#18,7,>s02=int64#19
# asm 2: sllx <x02=%l1,7,>s02=%l2
sllx %l1,7,%l2

# qhasm: x12 += x02
# asm 1: add <x12=int64#13,<x02=int64#18,>x12=int64#13
# asm 2: add <x12=%o3,<x02=%l1,>x12=%o3
add %o3,%l1,%o3

# qhasm: s0a = x0a << 7
# asm 1: sllx <x0a=int64#5,7,>s0a=int64#20
# asm 2: sllx <x0a=%i4,7,>s0a=%l3
sllx %i4,7,%l3

# qhasm: x1a += x0a
# asm 1: add <x1a=int64#12,<x0a=int64#5,>x1a=int64#12
# asm 2: add <x1a=%o2,<x0a=%i4,>x1a=%o2
add %o2,%i4,%o2

# qhasm: (uint32) x02 >>= 25
# asm 1: srl <x02=int64#18,25,>x02=int64#18
# asm 2: srl <x02=%l1,25,>x02=%l1
srl %l1,25,%l1

# qhasm: (uint32) x0a >>= 25
# asm 1: srl <x0a=int64#5,25,>x0a=int64#5
# asm 2: srl <x0a=%i4,25,>x0a=%i4
srl %i4,25,%i4

# qhasm: x02 |= s02
# asm 1: or  <x02=int64#18,<s02=int64#19,>x02=int64#18
# asm 2: or  <x02=%l1,<s02=%l2,>x02=%l1
or  %l1,%l2,%l1

# qhasm: x0a |= s0a
# asm 1: or  <x0a=int64#5,<s0a=int64#20,>x0a=int64#5
# asm 2: or  <x0a=%i4,<s0a=%l3,>x0a=%i4
or  %i4,%l3,%i4

# qhasm: x02 ^= x1a
# asm 1: xor <x02=int64#18,<x1a=int64#12,>x02=int64#18
# asm 2: xor <x02=%l1,<x1a=%o2,>x02=%l1
xor %l1,%o2,%l1

# qhasm: x0a ^= x12
# asm 1: xor <x0a=int64#5,<x12=int64#13,>x0a=int64#5
# asm 2: xor <x0a=%i4,<x12=%o3,>x0a=%i4
xor %i4,%o3,%i4

# qhasm:   s06 = x06 << 7
# asm 1: sllx <x06=int64#14,7,>s06=int64#19
# asm 2: sllx <x06=%o4,7,>s06=%l2
sllx %o4,7,%l2

# qhasm:   x16 += x06
# asm 1: add <x16=int64#2,<x06=int64#14,>x16=int64#2
# asm 2: add <x16=%i1,<x06=%o4,>x16=%i1
add %i1,%o4,%i1

# qhasm:   s0e = x0e << 7
# asm 1: sllx <x0e=int64#9,7,>s0e=int64#20
# asm 2: sllx <x0e=%g5,7,>s0e=%l3
sllx %g5,7,%l3

# qhasm:   x1e += x0e
# asm 1: add <x1e=int64#17,<x0e=int64#9,>x1e=int64#17
# asm 2: add <x1e=%l0,<x0e=%g5,>x1e=%l0
add %l0,%g5,%l0

# qhasm:   (uint32) x06 >>= 25
# asm 1: srl <x06=int64#14,25,>x06=int64#14
# asm 2: srl <x06=%o4,25,>x06=%o4
srl %o4,25,%o4

# qhasm:   (uint32) x0e >>= 25
# asm 1: srl <x0e=int64#9,25,>x0e=int64#9
# asm 2: srl <x0e=%g5,25,>x0e=%g5
srl %g5,25,%g5

# qhasm:   x06 |= s06
# asm 1: or  <x06=int64#14,<s06=int64#19,>x06=int64#14
# asm 2: or  <x06=%o4,<s06=%l2,>x06=%o4
or  %o4,%l2,%o4

# qhasm:   x0e |= s0e
# asm 1: or  <x0e=int64#9,<s0e=int64#20,>x0e=int64#9
# asm 2: or  <x0e=%g5,<s0e=%l3,>x0e=%g5
or  %g5,%l3,%g5

# qhasm:                 x01 = x01_stack
# asm 1: ldx [%fp+2023-<x01_stack=stack64#20],>x01=int64#19
# asm 2: ldx [%fp+2023-<x01_stack=184],>x01=%l2
ldx [%fp+2023-184],%l2

# qhasm:   x06 ^= x1e
# asm 1: xor <x06=int64#14,<x1e=int64#17,>x06=int64#14
# asm 2: xor <x06=%o4,<x1e=%l0,>x06=%o4
xor %o4,%l0,%o4

# qhasm:   x0e ^= x16
# asm 1: xor <x0e=int64#9,<x16=int64#2,>x0e=int64#9
# asm 2: xor <x0e=%g5,<x16=%i1,>x0e=%g5
xor %g5,%i1,%g5

# qhasm:                 x11 = x11_stack
# asm 1: ldx [%fp+2023-<x11_stack=stack64#4],>x11=int64#20
# asm 2: ldx [%fp+2023-<x11_stack=56],>x11=%l3
ldx [%fp+2023-56],%l3

# qhasm: s0a = x0a << 11
# asm 1: sllx <x0a=int64#5,11,>s0a=int64#21
# asm 2: sllx <x0a=%i4,11,>s0a=%l4
sllx %i4,11,%l4

# qhasm: x10 += x0a
# asm 1: add <x10=int64#11,<x0a=int64#5,>x10=int64#11
# asm 2: add <x10=%o1,<x0a=%i4,>x10=%o1
add %o1,%i4,%o1

# qhasm: s0e = x0e << 11
# asm 1: sllx <x0e=int64#9,11,>s0e=int64#22
# asm 2: sllx <x0e=%g5,11,>s0e=%l5
sllx %g5,11,%l5

# qhasm: x14 += x0e
# asm 1: add <x14=int64#15,<x0e=int64#9,>x14=int64#15
# asm 2: add <x14=%o5,<x0e=%g5,>x14=%o5
add %o5,%g5,%o5

# qhasm:                 x19 = x19_stack
# asm 1: ldx [%fp+2023-<x19_stack=stack64#10],>x19=int64#23
# asm 2: ldx [%fp+2023-<x19_stack=104],>x19=%l6
ldx [%fp+2023-104],%l6

# qhasm: (uint32) x0a >>= 21
# asm 1: srl <x0a=int64#5,21,>x0a=int64#5
# asm 2: srl <x0a=%i4,21,>x0a=%i4
srl %i4,21,%i4

# qhasm: (uint32) x0e >>= 21
# asm 1: srl <x0e=int64#9,21,>x0e=int64#9
# asm 2: srl <x0e=%g5,21,>x0e=%g5
srl %g5,21,%g5

# qhasm:                 x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#22],>x05=int64#24
# asm 2: ldx [%fp+2023-<x05_stack=200],>x05=%l7
ldx [%fp+2023-200],%l7

# qhasm: x0a |= s0a
# asm 1: or  <x0a=int64#5,<s0a=int64#21,>x0a=int64#5
# asm 2: or  <x0a=%i4,<s0a=%l4,>x0a=%i4
or  %i4,%l4,%i4

# qhasm: x0e |= s0e
# asm 1: or  <x0e=int64#9,<s0e=int64#22,>x0e=int64#9
# asm 2: or  <x0e=%g5,<s0e=%l5,>x0e=%g5
or  %g5,%l5,%g5

# qhasm:         x10_stack = x10
# asm 1: stx <x10=int64#11,[%fp+2023->x10_stack=stack64#9]
# asm 2: stx <x10=%o1,[%fp+2023->x10_stack=96]
stx %o1,[%fp+2023-96]

# qhasm: x0a ^= x14
# asm 1: xor <x0a=int64#5,<x14=int64#15,>x0a=int64#5
# asm 2: xor <x0a=%i4,<x14=%o5,>x0a=%i4
xor %i4,%o5,%i4

# qhasm: x0e ^= x10
# asm 1: xor <x0e=int64#9,<x10=int64#11,>x0e=int64#9
# asm 2: xor <x0e=%g5,<x10=%o1,>x0e=%g5
xor %g5,%o1,%g5

# qhasm:         x14_stack = x14
# asm 1: stx <x14=int64#15,[%fp+2023->x14_stack=stack64#11]
# asm 2: stx <x14=%o5,[%fp+2023->x14_stack=112]
stx %o5,[%fp+2023-112]

# qhasm:   s02 = x02 << 11
# asm 1: sllx <x02=int64#18,11,>s02=int64#11
# asm 2: sllx <x02=%l1,11,>s02=%o1
sllx %l1,11,%o1

# qhasm:   x18 += x02
# asm 1: add <x18=int64#3,<x02=int64#18,>x18=int64#3
# asm 2: add <x18=%i2,<x02=%l1,>x18=%i2
add %i2,%l1,%i2

# qhasm:   s06 = x06 << 11
# asm 1: sllx <x06=int64#14,11,>s06=int64#15
# asm 2: sllx <x06=%o4,11,>s06=%o5
sllx %o4,11,%o5

# qhasm:   x1c += x06
# asm 1: add <x1c=int64#16,<x06=int64#14,>x1c=int64#16
# asm 2: add <x1c=%o7,<x06=%o4,>x1c=%o7
add %o7,%o4,%o7

# qhasm:         x0a_stack = x0a
# asm 1: stx <x0a=int64#5,[%fp+2023->x0a_stack=stack64#4]
# asm 2: stx <x0a=%i4,[%fp+2023->x0a_stack=56]
stx %i4,[%fp+2023-56]

# qhasm:   (uint32) x02 >>= 21
# asm 1: srl <x02=int64#18,21,>x02=int64#5
# asm 2: srl <x02=%l1,21,>x02=%i4
srl %l1,21,%i4

# qhasm:   (uint32) x06 >>= 21
# asm 1: srl <x06=int64#14,21,>x06=int64#14
# asm 2: srl <x06=%o4,21,>x06=%o4
srl %o4,21,%o4

# qhasm:         x0e_stack = x0e
# asm 1: stx <x0e=int64#9,[%fp+2023->x0e_stack=stack64#10]
# asm 2: stx <x0e=%g5,[%fp+2023->x0e_stack=104]
stx %g5,[%fp+2023-104]

# qhasm:   x02 |= s02
# asm 1: or  <x02=int64#5,<s02=int64#11,>x02=int64#5
# asm 2: or  <x02=%i4,<s02=%o1,>x02=%i4
or  %i4,%o1,%i4

# qhasm:   x06 |= s06
# asm 1: or  <x06=int64#14,<s06=int64#15,>x06=int64#9
# asm 2: or  <x06=%o4,<s06=%o5,>x06=%g5
or  %o4,%o5,%g5

# qhasm:         x18_stack = x18
# asm 1: stx <x18=int64#3,[%fp+2023->x18_stack=stack64#13]
# asm 2: stx <x18=%i2,[%fp+2023->x18_stack=128]
stx %i2,[%fp+2023-128]

# qhasm:   x02 ^= x1c
# asm 1: xor <x02=int64#5,<x1c=int64#16,>x02=int64#5
# asm 2: xor <x02=%i4,<x1c=%o7,>x02=%i4
xor %i4,%o7,%i4

# qhasm:   x06 ^= x18
# asm 1: xor <x06=int64#9,<x18=int64#3,>x06=int64#3
# asm 2: xor <x06=%g5,<x18=%i2,>x06=%i2
xor %g5,%i2,%i2

# qhasm:         x1c_stack = x1c
# asm 1: stx <x1c=int64#16,[%fp+2023->x1c_stack=stack64#15]
# asm 2: stx <x1c=%o7,[%fp+2023->x1c_stack=144]
stx %o7,[%fp+2023-144]

# qhasm: s08 = x08 << 11
# asm 1: sllx <x08=int64#1,11,>s08=int64#9
# asm 2: sllx <x08=%i0,11,>s08=%g5
sllx %i0,11,%g5

# qhasm: x12 += x08
# asm 1: add <x12=int64#13,<x08=int64#1,>x12=int64#11
# asm 2: add <x12=%o3,<x08=%i0,>x12=%o1
add %o3,%i0,%o1

# qhasm:                 x15 = x15_stack
# asm 1: ldx [%fp+2023-<x15_stack=stack64#6],>x15=int64#13
# asm 2: ldx [%fp+2023-<x15_stack=72],>x15=%o3
ldx [%fp+2023-72],%o3

# qhasm: s0c = x0c << 11
# asm 1: sllx <x0c=int64#7,11,>s0c=int64#14
# asm 2: sllx <x0c=%g1,11,>s0c=%o4
sllx %g1,11,%o4

# qhasm: x16 += x0c
# asm 1: add <x16=int64#2,<x0c=int64#7,>x16=int64#2
# asm 2: add <x16=%i1,<x0c=%g1,>x16=%i1
add %i1,%g1,%i1

# qhasm:         x02_stack = x02
# asm 1: stx <x02=int64#5,[%fp+2023->x02_stack=stack64#6]
# asm 2: stx <x02=%i4,[%fp+2023->x02_stack=72]
stx %i4,[%fp+2023-72]

# qhasm: (uint32) x08 >>= 21
# asm 1: srl <x08=int64#1,21,>x08=int64#1
# asm 2: srl <x08=%i0,21,>x08=%i0
srl %i0,21,%i0

# qhasm: (uint32) x0c >>= 21
# asm 1: srl <x0c=int64#7,21,>x0c=int64#5
# asm 2: srl <x0c=%g1,21,>x0c=%i4
srl %g1,21,%i4

# qhasm:         x06_stack = x06
# asm 1: stx <x06=int64#3,[%fp+2023->x06_stack=stack64#20]
# asm 2: stx <x06=%i2,[%fp+2023->x06_stack=184]
stx %i2,[%fp+2023-184]

# qhasm: x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#9,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%g5,>x08=%i0
or  %i0,%g5,%i0

# qhasm: x0c |= s0c
# asm 1: or  <x0c=int64#5,<s0c=int64#14,>x0c=int64#3
# asm 2: or  <x0c=%i4,<s0c=%o4,>x0c=%i2
or  %i4,%o4,%i2

# qhasm:         x12_stack = x12
# asm 1: stx <x12=int64#11,[%fp+2023->x12_stack=stack64#22]
# asm 2: stx <x12=%o1,[%fp+2023->x12_stack=200]
stx %o1,[%fp+2023-200]

# qhasm: x08 ^= x16
# asm 1: xor <x08=int64#1,<x16=int64#2,>x08=int64#1
# asm 2: xor <x08=%i0,<x16=%i1,>x08=%i0
xor %i0,%i1,%i0

# qhasm: x0c ^= x12
# asm 1: xor <x0c=int64#3,<x12=int64#11,>x0c=int64#3
# asm 2: xor <x0c=%i2,<x12=%o1,>x0c=%i2
xor %i2,%o1,%i2

# qhasm:         x16_stack = x16
# asm 1: stx <x16=int64#2,[%fp+2023->x16_stack=stack64#24]
# asm 2: stx <x16=%i1,[%fp+2023->x16_stack=216]
stx %i1,[%fp+2023-216]

# qhasm:   s00 = x00 << 11
# asm 1: sllx <x00=int64#6,11,>s00=int64#2
# asm 2: sllx <x00=%i5,11,>s00=%i1
sllx %i5,11,%i1

# qhasm:   x1a += x00
# asm 1: add <x1a=int64#12,<x00=int64#6,>x1a=int64#5
# asm 2: add <x1a=%o2,<x00=%i5,>x1a=%i4
add %o2,%i5,%i4

# qhasm:                 x1d = x1d_stack
# asm 1: ldx [%fp+2023-<x1d_stack=stack64#14],>x1d=int64#7
# asm 2: ldx [%fp+2023-<x1d_stack=136],>x1d=%g1
ldx [%fp+2023-136],%g1

# qhasm:   s04 = x04 << 11
# asm 1: sllx <x04=int64#10,11,>s04=int64#9
# asm 2: sllx <x04=%o0,11,>s04=%g5
sllx %o0,11,%g5

# qhasm:   x1e += x04
# asm 1: add <x1e=int64#17,<x04=int64#10,>x1e=int64#11
# asm 2: add <x1e=%l0,<x04=%o0,>x1e=%o1
add %l0,%o0,%o1

# qhasm:         x08_stack = x08
# asm 1: stx <x08=int64#1,[%fp+2023->x08_stack=stack64#14]
# asm 2: stx <x08=%i0,[%fp+2023->x08_stack=136]
stx %i0,[%fp+2023-136]

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int64#6,21,>x00=int64#1
# asm 2: srl <x00=%i5,21,>x00=%i0
srl %i5,21,%i0

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int64#10,21,>x04=int64#6
# asm 2: srl <x04=%o0,21,>x04=%i5
srl %o0,21,%i5

# qhasm:         x0c_stack = x0c
# asm 1: stx <x0c=int64#3,[%fp+2023->x0c_stack=stack64#25]
# asm 2: stx <x0c=%i2,[%fp+2023->x0c_stack=224]
stx %i2,[%fp+2023-224]

# qhasm:   x00 |= s00
# asm 1: or  <x00=int64#1,<s00=int64#2,>x00=int64#1
# asm 2: or  <x00=%i0,<s00=%i1,>x00=%i0
or  %i0,%i1,%i0

# qhasm:   x04 |= s04
# asm 1: or  <x04=int64#6,<s04=int64#9,>x04=int64#2
# asm 2: or  <x04=%i5,<s04=%g5,>x04=%i1
or  %i5,%g5,%i1

# qhasm:         x1a_stack = x1a
# asm 1: stx <x1a=int64#5,[%fp+2023->x1a_stack=stack64#26]
# asm 2: stx <x1a=%i4,[%fp+2023->x1a_stack=232]
stx %i4,[%fp+2023-232]

# qhasm:   x00 ^= x1e
# asm 1: xor <x00=int64#1,<x1e=int64#11,>x00=int64#1
# asm 2: xor <x00=%i0,<x1e=%o1,>x00=%i0
xor %i0,%o1,%i0

# qhasm:   x04 ^= x1a
# asm 1: xor <x04=int64#2,<x1a=int64#5,>x04=int64#2
# asm 2: xor <x04=%i1,<x1a=%i4,>x04=%i1
xor %i1,%i4,%i1

# qhasm:         x1e_stack = x1e
# asm 1: stx <x1e=int64#11,[%fp+2023->x1e_stack=stack64#27]
# asm 2: stx <x1e=%o1,[%fp+2023->x1e_stack=240]
stx %o1,[%fp+2023-240]

# qhasm: s01 = x01 << 7
# asm 1: sllx <x01=int64#19,7,>s01=int64#3
# asm 2: sllx <x01=%l2,7,>s01=%i2
sllx %l2,7,%i2

# qhasm: x11 += x01
# asm 1: add <x11=int64#20,<x01=int64#19,>x11=int64#5
# asm 2: add <x11=%l3,<x01=%l2,>x11=%i4
add %l3,%l2,%i4

# qhasm:         x00_stack = x00
# asm 1: stx <x00=int64#1,[%fp+2023->x00_stack=stack64#28]
# asm 2: stx <x00=%i0,[%fp+2023->x00_stack=248]
stx %i0,[%fp+2023-248]

# qhasm: s09 = x09 << 7
# asm 1: sllx <x09=int64#4,7,>s09=int64#1
# asm 2: sllx <x09=%i3,7,>s09=%i0
sllx %i3,7,%i0

# qhasm: x19 += x09
# asm 1: add <x19=int64#23,<x09=int64#4,>x19=int64#6
# asm 2: add <x19=%l6,<x09=%i3,>x19=%i5
add %l6,%i3,%i5

# qhasm:                 x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#21],>x03=int64#9
# asm 2: ldx [%fp+2023-<x03_stack=192],>x03=%g5
ldx [%fp+2023-192],%g5

# qhasm: (uint32) x01 >>= 25
# asm 1: srl <x01=int64#19,25,>x01=int64#10
# asm 2: srl <x01=%l2,25,>x01=%o0
srl %l2,25,%o0

# qhasm: (uint32) x09 >>= 25
# asm 1: srl <x09=int64#4,25,>x09=int64#4
# asm 2: srl <x09=%i3,25,>x09=%i3
srl %i3,25,%i3

# qhasm:                 x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#2],>x0b=int64#11
# asm 2: ldx [%fp+2023-<x0b_stack=40],>x0b=%o1
ldx [%fp+2023-40],%o1

# qhasm: x01 |= s01
# asm 1: or  <x01=int64#10,<s01=int64#3,>x01=int64#3
# asm 2: or  <x01=%o0,<s01=%i2,>x01=%i2
or  %o0,%i2,%i2

# qhasm: x09 |= s09
# asm 1: or  <x09=int64#4,<s09=int64#1,>x09=int64#1
# asm 2: or  <x09=%i3,<s09=%i0,>x09=%i0
or  %i3,%i0,%i0

# qhasm:                 x13 = x13_stack
# asm 1: ldx [%fp+2023-<x13_stack=stack64#5],>x13=int64#4
# asm 2: ldx [%fp+2023-<x13_stack=64],>x13=%i3
ldx [%fp+2023-64],%i3

# qhasm: x01 ^= x19
# asm 1: xor <x01=int64#3,<x19=int64#6,>x01=int64#3
# asm 2: xor <x01=%i2,<x19=%i5,>x01=%i2
xor %i2,%i5,%i2

# qhasm: x09 ^= x11
# asm 1: xor <x09=int64#1,<x11=int64#5,>x09=int64#1
# asm 2: xor <x09=%i0,<x11=%i4,>x09=%i0
xor %i0,%i4,%i0

# qhasm:                 x1b = x1b_stack
# asm 1: ldx [%fp+2023-<x1b_stack=stack64#12],>x1b=int64#10
# asm 2: ldx [%fp+2023-<x1b_stack=120],>x1b=%o0
ldx [%fp+2023-120],%o0

# qhasm:   s05 = x05 << 7
# asm 1: sllx <x05=int64#24,7,>s05=int64#12
# asm 2: sllx <x05=%l7,7,>s05=%o2
sllx %l7,7,%o2

# qhasm:   x15 += x05
# asm 1: add <x15=int64#13,<x05=int64#24,>x15=int64#13
# asm 2: add <x15=%o3,<x05=%l7,>x15=%o3
add %o3,%l7,%o3

# qhasm:         x04_stack = x04
# asm 1: stx <x04=int64#2,[%fp+2023->x04_stack=stack64#2]
# asm 2: stx <x04=%i1,[%fp+2023->x04_stack=40]
stx %i1,[%fp+2023-40]

# qhasm:   s0d = x0d << 7
# asm 1: sllx <x0d=int64#8,7,>s0d=int64#2
# asm 2: sllx <x0d=%g4,7,>s0d=%i1
sllx %g4,7,%i1

# qhasm:   x1d += x0d
# asm 1: add <x1d=int64#7,<x0d=int64#8,>x1d=int64#7
# asm 2: add <x1d=%g1,<x0d=%g4,>x1d=%g1
add %g1,%g4,%g1

# qhasm:                 x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#23],>x07=int64#14
# asm 2: ldx [%fp+2023-<x07_stack=208],>x07=%o4
ldx [%fp+2023-208],%o4

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int64#24,25,>x05=int64#15
# asm 2: srl <x05=%l7,25,>x05=%o5
srl %l7,25,%o5

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int64#8,25,>x0d=int64#8
# asm 2: srl <x0d=%g4,25,>x0d=%g4
srl %g4,25,%g4

# qhasm:                 x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#3],>x0f=int64#16
# asm 2: ldx [%fp+2023-<x0f_stack=48],>x0f=%o7
ldx [%fp+2023-48],%o7

# qhasm:   x05 |= s05
# asm 1: or  <x05=int64#15,<s05=int64#12,>x05=int64#12
# asm 2: or  <x05=%o5,<s05=%o2,>x05=%o2
or  %o5,%o2,%o2

# qhasm:   x0d |= s0d
# asm 1: or  <x0d=int64#8,<s0d=int64#2,>x0d=int64#2
# asm 2: or  <x0d=%g4,<s0d=%i1,>x0d=%i1
or  %g4,%i1,%i1

# qhasm:                 x17 = x17_stack
# asm 1: ldx [%fp+2023-<x17_stack=stack64#8],>x17=int64#8
# asm 2: ldx [%fp+2023-<x17_stack=88],>x17=%g4
ldx [%fp+2023-88],%g4

# qhasm:   x05 ^= x1d
# asm 1: xor <x05=int64#12,<x1d=int64#7,>x05=int64#12
# asm 2: xor <x05=%o2,<x1d=%g1,>x05=%o2
xor %o2,%g1,%o2

# qhasm:   x0d ^= x15
# asm 1: xor <x0d=int64#2,<x15=int64#13,>x0d=int64#2
# asm 2: xor <x0d=%i1,<x15=%o3,>x0d=%i1
xor %i1,%o3,%i1

# qhasm:                 x1f = x1f_stack
# asm 1: ldx [%fp+2023-<x1f_stack=stack64#16],>x1f=int64#15
# asm 2: ldx [%fp+2023-<x1f_stack=152],>x1f=%o5
ldx [%fp+2023-152],%o5

# qhasm: s03 = x03 << 7
# asm 1: sllx <x03=int64#9,7,>s03=int64#17
# asm 2: sllx <x03=%g5,7,>s03=%l0
sllx %g5,7,%l0

# qhasm: x13 += x03
# asm 1: add <x13=int64#4,<x03=int64#9,>x13=int64#4
# asm 2: add <x13=%i3,<x03=%g5,>x13=%i3
add %i3,%g5,%i3

# qhasm: s0b = x0b << 7
# asm 1: sllx <x0b=int64#11,7,>s0b=int64#18
# asm 2: sllx <x0b=%o1,7,>s0b=%l1
sllx %o1,7,%l1

# qhasm: x1b += x0b
# asm 1: add <x1b=int64#10,<x0b=int64#11,>x1b=int64#10
# asm 2: add <x1b=%o0,<x0b=%o1,>x1b=%o0
add %o0,%o1,%o0

# qhasm: (uint32) x03 >>= 25
# asm 1: srl <x03=int64#9,25,>x03=int64#9
# asm 2: srl <x03=%g5,25,>x03=%g5
srl %g5,25,%g5

# qhasm: (uint32) x0b >>= 25
# asm 1: srl <x0b=int64#11,25,>x0b=int64#11
# asm 2: srl <x0b=%o1,25,>x0b=%o1
srl %o1,25,%o1

# qhasm: x03 |= s03
# asm 1: or  <x03=int64#9,<s03=int64#17,>x03=int64#9
# asm 2: or  <x03=%g5,<s03=%l0,>x03=%g5
or  %g5,%l0,%g5

# qhasm: x0b |= s0b
# asm 1: or  <x0b=int64#11,<s0b=int64#18,>x0b=int64#11
# asm 2: or  <x0b=%o1,<s0b=%l1,>x0b=%o1
or  %o1,%l1,%o1

# qhasm: x03 ^= x1b
# asm 1: xor <x03=int64#9,<x1b=int64#10,>x03=int64#9
# asm 2: xor <x03=%g5,<x1b=%o0,>x03=%g5
xor %g5,%o0,%g5

# qhasm: x0b ^= x13
# asm 1: xor <x0b=int64#11,<x13=int64#4,>x0b=int64#11
# asm 2: xor <x0b=%o1,<x13=%i3,>x0b=%o1
xor %o1,%i3,%o1

# qhasm:   s07 = x07 << 7
# asm 1: sllx <x07=int64#14,7,>s07=int64#17
# asm 2: sllx <x07=%o4,7,>s07=%l0
sllx %o4,7,%l0

# qhasm:   x17 += x07
# asm 1: add <x17=int64#8,<x07=int64#14,>x17=int64#8
# asm 2: add <x17=%g4,<x07=%o4,>x17=%g4
add %g4,%o4,%g4

# qhasm:   s0f = x0f << 7
# asm 1: sllx <x0f=int64#16,7,>s0f=int64#18
# asm 2: sllx <x0f=%o7,7,>s0f=%l1
sllx %o7,7,%l1

# qhasm:   x1f += x0f
# asm 1: add <x1f=int64#15,<x0f=int64#16,>x1f=int64#15
# asm 2: add <x1f=%o5,<x0f=%o7,>x1f=%o5
add %o5,%o7,%o5

# qhasm:   (uint32) x07 >>= 25
# asm 1: srl <x07=int64#14,25,>x07=int64#14
# asm 2: srl <x07=%o4,25,>x07=%o4
srl %o4,25,%o4

# qhasm:   (uint32) x0f >>= 25
# asm 1: srl <x0f=int64#16,25,>x0f=int64#16
# asm 2: srl <x0f=%o7,25,>x0f=%o7
srl %o7,25,%o7

# qhasm:   x07 |= s07
# asm 1: or  <x07=int64#14,<s07=int64#17,>x07=int64#14
# asm 2: or  <x07=%o4,<s07=%l0,>x07=%o4
or  %o4,%l0,%o4

# qhasm:   x0f |= s0f
# asm 1: or  <x0f=int64#16,<s0f=int64#18,>x0f=int64#16
# asm 2: or  <x0f=%o7,<s0f=%l1,>x0f=%o7
or  %o7,%l1,%o7

# qhasm:   x07 ^= x1f
# asm 1: xor <x07=int64#14,<x1f=int64#15,>x07=int64#14
# asm 2: xor <x07=%o4,<x1f=%o5,>x07=%o4
xor %o4,%o5,%o4

# qhasm:   x0f ^= x17
# asm 1: xor <x0f=int64#16,<x17=int64#8,>x0f=int64#16
# asm 2: xor <x0f=%o7,<x17=%g4,>x0f=%o7
xor %o7,%g4,%o7

# qhasm: s0b = x0b << 11
# asm 1: sllx <x0b=int64#11,11,>s0b=int64#17
# asm 2: sllx <x0b=%o1,11,>s0b=%l0
sllx %o1,11,%l0

# qhasm: x11 += x0b
# asm 1: add <x11=int64#5,<x0b=int64#11,>x11=int64#5
# asm 2: add <x11=%i4,<x0b=%o1,>x11=%i4
add %i4,%o1,%i4

# qhasm: s0f = x0f << 11
# asm 1: sllx <x0f=int64#16,11,>s0f=int64#18
# asm 2: sllx <x0f=%o7,11,>s0f=%l1
sllx %o7,11,%l1

# qhasm: x15 += x0f
# asm 1: add <x15=int64#13,<x0f=int64#16,>x15=int64#13
# asm 2: add <x15=%o3,<x0f=%o7,>x15=%o3
add %o3,%o7,%o3

# qhasm: (uint32) x0b >>= 21
# asm 1: srl <x0b=int64#11,21,>x0b=int64#11
# asm 2: srl <x0b=%o1,21,>x0b=%o1
srl %o1,21,%o1

# qhasm: (uint32) x0f >>= 21
# asm 1: srl <x0f=int64#16,21,>x0f=int64#16
# asm 2: srl <x0f=%o7,21,>x0f=%o7
srl %o7,21,%o7

# qhasm: x0b |= s0b
# asm 1: or  <x0b=int64#11,<s0b=int64#17,>x0b=int64#11
# asm 2: or  <x0b=%o1,<s0b=%l0,>x0b=%o1
or  %o1,%l0,%o1

# qhasm: x0f |= s0f
# asm 1: or  <x0f=int64#16,<s0f=int64#18,>x0f=int64#16
# asm 2: or  <x0f=%o7,<s0f=%l1,>x0f=%o7
or  %o7,%l1,%o7

# qhasm: x0b ^= x15
# asm 1: xor <x0b=int64#11,<x15=int64#13,>x0b=int64#11
# asm 2: xor <x0b=%o1,<x15=%o3,>x0b=%o1
xor %o1,%o3,%o1

# qhasm: x0f ^= x11
# asm 1: xor <x0f=int64#16,<x11=int64#5,>x0f=int64#16
# asm 2: xor <x0f=%o7,<x11=%i4,>x0f=%o7
xor %o7,%i4,%o7

# qhasm:   s03 = x03 << 11
# asm 1: sllx <x03=int64#9,11,>s03=int64#17
# asm 2: sllx <x03=%g5,11,>s03=%l0
sllx %g5,11,%l0

# qhasm:   x19 += x03
# asm 1: add <x19=int64#6,<x03=int64#9,>x19=int64#6
# asm 2: add <x19=%i5,<x03=%g5,>x19=%i5
add %i5,%g5,%i5

# qhasm:   s07 = x07 << 11
# asm 1: sllx <x07=int64#14,11,>s07=int64#18
# asm 2: sllx <x07=%o4,11,>s07=%l1
sllx %o4,11,%l1

# qhasm:   x1d += x07
# asm 1: add <x1d=int64#7,<x07=int64#14,>x1d=int64#7
# asm 2: add <x1d=%g1,<x07=%o4,>x1d=%g1
add %g1,%o4,%g1

# qhasm:         x0b_stack = x0b
# asm 1: stx <x0b=int64#11,[%fp+2023->x0b_stack=stack64#3]
# asm 2: stx <x0b=%o1,[%fp+2023->x0b_stack=48]
stx %o1,[%fp+2023-48]

# qhasm:   (uint32) x03 >>= 21
# asm 1: srl <x03=int64#9,21,>x03=int64#9
# asm 2: srl <x03=%g5,21,>x03=%g5
srl %g5,21,%g5

# qhasm:   (uint32) x07 >>= 21
# asm 1: srl <x07=int64#14,21,>x07=int64#11
# asm 2: srl <x07=%o4,21,>x07=%o1
srl %o4,21,%o1

# qhasm:         x0f_stack = x0f
# asm 1: stx <x0f=int64#16,[%fp+2023->x0f_stack=stack64#21]
# asm 2: stx <x0f=%o7,[%fp+2023->x0f_stack=192]
stx %o7,[%fp+2023-192]

# qhasm:   x03 |= s03
# asm 1: or  <x03=int64#9,<s03=int64#17,>x03=int64#9
# asm 2: or  <x03=%g5,<s03=%l0,>x03=%g5
or  %g5,%l0,%g5

# qhasm:   x07 |= s07
# asm 1: or  <x07=int64#11,<s07=int64#18,>x07=int64#11
# asm 2: or  <x07=%o1,<s07=%l1,>x07=%o1
or  %o1,%l1,%o1

# qhasm:   x03 ^= x1d
# asm 1: xor <x03=int64#9,<x1d=int64#7,>x03=int64#9
# asm 2: xor <x03=%g5,<x1d=%g1,>x03=%g5
xor %g5,%g1,%g5

# qhasm:   x07 ^= x19
# asm 1: xor <x07=int64#11,<x19=int64#6,>x07=int64#11
# asm 2: xor <x07=%o1,<x19=%i5,>x07=%o1
xor %o1,%i5,%o1

# qhasm: s09 = x09 << 11
# asm 1: sllx <x09=int64#1,11,>s09=int64#14
# asm 2: sllx <x09=%i0,11,>s09=%o4
sllx %i0,11,%o4

# qhasm: x13 += x09
# asm 1: add <x13=int64#4,<x09=int64#1,>x13=int64#4
# asm 2: add <x13=%i3,<x09=%i0,>x13=%i3
add %i3,%i0,%i3

# qhasm: s0d = x0d << 11
# asm 1: sllx <x0d=int64#2,11,>s0d=int64#16
# asm 2: sllx <x0d=%i1,11,>s0d=%o7
sllx %i1,11,%o7

# qhasm: x17 += x0d
# asm 1: add <x17=int64#8,<x0d=int64#2,>x17=int64#8
# asm 2: add <x17=%g4,<x0d=%i1,>x17=%g4
add %g4,%i1,%g4

# qhasm:         x03_stack = x03
# asm 1: stx <x03=int64#9,[%fp+2023->x03_stack=stack64#23]
# asm 2: stx <x03=%g5,[%fp+2023->x03_stack=208]
stx %g5,[%fp+2023-208]

# qhasm: (uint32) x09 >>= 21
# asm 1: srl <x09=int64#1,21,>x09=int64#1
# asm 2: srl <x09=%i0,21,>x09=%i0
srl %i0,21,%i0

# qhasm: (uint32) x0d >>= 21
# asm 1: srl <x0d=int64#2,21,>x0d=int64#2
# asm 2: srl <x0d=%i1,21,>x0d=%i1
srl %i1,21,%i1

# qhasm:         x07_stack = x07
# asm 1: stx <x07=int64#11,[%fp+2023->x07_stack=stack64#29]
# asm 2: stx <x07=%o1,[%fp+2023->x07_stack=256]
stx %o1,[%fp+2023-256]

# qhasm: x09 |= s09
# asm 1: or  <x09=int64#1,<s09=int64#14,>x09=int64#1
# asm 2: or  <x09=%i0,<s09=%o4,>x09=%i0
or  %i0,%o4,%i0

# qhasm: x0d |= s0d
# asm 1: or  <x0d=int64#2,<s0d=int64#16,>x0d=int64#2
# asm 2: or  <x0d=%i1,<s0d=%o7,>x0d=%i1
or  %i1,%o7,%i1

# qhasm:                 x00 = x00_stack
# asm 1: ldx [%fp+2023-<x00_stack=stack64#28],>x00=int64#9
# asm 2: ldx [%fp+2023-<x00_stack=248],>x00=%g5
ldx [%fp+2023-248],%g5

# qhasm: x09 ^= x17
# asm 1: xor <x09=int64#1,<x17=int64#8,>x09=int64#1
# asm 2: xor <x09=%i0,<x17=%g4,>x09=%i0
xor %i0,%g4,%i0

# qhasm: x0d ^= x13
# asm 1: xor <x0d=int64#2,<x13=int64#4,>x0d=int64#2
# asm 2: xor <x0d=%i1,<x13=%i3,>x0d=%i1
xor %i1,%i3,%i1

# qhasm:                 x08 = x08_stack
# asm 1: ldx [%fp+2023-<x08_stack=stack64#14],>x08=int64#11
# asm 2: ldx [%fp+2023-<x08_stack=136],>x08=%o1
ldx [%fp+2023-136],%o1

# qhasm:   s01 = x01 << 11
# asm 1: sllx <x01=int64#3,11,>s01=int64#14
# asm 2: sllx <x01=%i2,11,>s01=%o4
sllx %i2,11,%o4

# qhasm:   x1b += x01
# asm 1: add <x1b=int64#10,<x01=int64#3,>x1b=int64#10
# asm 2: add <x1b=%o0,<x01=%i2,>x1b=%o0
add %o0,%i2,%o0

# qhasm:   s05 = x05 << 11
# asm 1: sllx <x05=int64#12,11,>s05=int64#16
# asm 2: sllx <x05=%o2,11,>s05=%o7
sllx %o2,11,%o7

# qhasm:   x1f += x05
# asm 1: add <x1f=int64#15,<x05=int64#12,>x1f=int64#15
# asm 2: add <x1f=%o5,<x05=%o2,>x1f=%o5
add %o5,%o2,%o5

# qhasm:         x09_stack = x09
# asm 1: stx <x09=int64#1,[%fp+2023->x09_stack=stack64#5]
# asm 2: stx <x09=%i0,[%fp+2023->x09_stack=64]
stx %i0,[%fp+2023-64]

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int64#3,21,>x01=int64#1
# asm 2: srl <x01=%i2,21,>x01=%i0
srl %i2,21,%i0

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int64#12,21,>x05=int64#3
# asm 2: srl <x05=%o2,21,>x05=%i2
srl %o2,21,%i2

# qhasm:         x0d_stack = x0d
# asm 1: stx <x0d=int64#2,[%fp+2023->x0d_stack=stack64#14]
# asm 2: stx <x0d=%i1,[%fp+2023->x0d_stack=136]
stx %i1,[%fp+2023-136]

# qhasm:   x01 |= s01
# asm 1: or  <x01=int64#1,<s01=int64#14,>x01=int64#1
# asm 2: or  <x01=%i0,<s01=%o4,>x01=%i0
or  %i0,%o4,%i0

# qhasm:   x05 |= s05
# asm 1: or  <x05=int64#3,<s05=int64#16,>x05=int64#2
# asm 2: or  <x05=%i2,<s05=%o7,>x05=%i1
or  %i2,%o7,%i1

# qhasm:                 x04 = x04_stack
# asm 1: ldx [%fp+2023-<x04_stack=stack64#2],>x04=int64#3
# asm 2: ldx [%fp+2023-<x04_stack=40],>x04=%i2
ldx [%fp+2023-40],%i2

# qhasm:   x01 ^= x1f
# asm 1: xor <x01=int64#1,<x1f=int64#15,>x01=int64#1
# asm 2: xor <x01=%i0,<x1f=%o5,>x01=%i0
xor %i0,%o5,%i0

# qhasm:   x05 ^= x1b
# asm 1: xor <x05=int64#2,<x1b=int64#10,>x05=int64#2
# asm 2: xor <x05=%i1,<x1b=%o0,>x05=%i1
xor %i1,%o0,%i1

# qhasm:                 x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#25],>x0c=int64#12
# asm 2: ldx [%fp+2023-<x0c_stack=224],>x0c=%o2
ldx [%fp+2023-224],%o2

# qhasm: s00 = x00 << 7
# asm 1: sllx <x00=int64#9,7,>s00=int64#14
# asm 2: sllx <x00=%g5,7,>s00=%o4
sllx %g5,7,%o4

# qhasm: x1f += x00
# asm 1: add <x1f=int64#15,<x00=int64#9,>x1f=int64#15
# asm 2: add <x1f=%o5,<x00=%g5,>x1f=%o5
add %o5,%g5,%o5

# qhasm: s08 = x08 << 7
# asm 1: sllx <x08=int64#11,7,>s08=int64#16
# asm 2: sllx <x08=%o1,7,>s08=%o7
sllx %o1,7,%o7

# qhasm: x17 += x08
# asm 1: add <x17=int64#8,<x08=int64#11,>x17=int64#8
# asm 2: add <x17=%g4,<x08=%o1,>x17=%g4
add %g4,%o1,%g4

# qhasm:         x01_stack = x01
# asm 1: stx <x01=int64#1,[%fp+2023->x01_stack=stack64#2]
# asm 2: stx <x01=%i0,[%fp+2023->x01_stack=40]
stx %i0,[%fp+2023-40]

# qhasm: (uint32) x00 >>= 25
# asm 1: srl <x00=int64#9,25,>x00=int64#1
# asm 2: srl <x00=%g5,25,>x00=%i0
srl %g5,25,%i0

# qhasm: (uint32) x08 >>= 25
# asm 1: srl <x08=int64#11,25,>x08=int64#9
# asm 2: srl <x08=%o1,25,>x08=%g5
srl %o1,25,%g5

# qhasm:         x05_stack = x05
# asm 1: stx <x05=int64#2,[%fp+2023->x05_stack=stack64#8]
# asm 2: stx <x05=%i1,[%fp+2023->x05_stack=88]
stx %i1,[%fp+2023-88]

# qhasm: x00 |= s00
# asm 1: or  <x00=int64#1,<s00=int64#14,>x00=int64#1
# asm 2: or  <x00=%i0,<s00=%o4,>x00=%i0
or  %i0,%o4,%i0

# qhasm: x08 |= s08
# asm 1: or  <x08=int64#9,<s08=int64#16,>x08=int64#2
# asm 2: or  <x08=%g5,<s08=%o7,>x08=%i1
or  %g5,%o7,%i1

# qhasm:                 x02 = x02_stack
# asm 1: ldx [%fp+2023-<x02_stack=stack64#6],>x02=int64#9
# asm 2: ldx [%fp+2023-<x02_stack=72],>x02=%g5
ldx [%fp+2023-72],%g5

# qhasm: x00 ^= x17
# asm 1: xor <x00=int64#1,<x17=int64#8,>x00=int64#1
# asm 2: xor <x00=%i0,<x17=%g4,>x00=%i0
xor %i0,%g4,%i0

# qhasm: x08 ^= x1f
# asm 1: xor <x08=int64#2,<x1f=int64#15,>x08=int64#2
# asm 2: xor <x08=%i1,<x1f=%o5,>x08=%i1
xor %i1,%o5,%i1

# qhasm:                 x0a = x0a_stack
# asm 1: ldx [%fp+2023-<x0a_stack=stack64#4],>x0a=int64#11
# asm 2: ldx [%fp+2023-<x0a_stack=56],>x0a=%o1
ldx [%fp+2023-56],%o1

# qhasm:   s04 = x04 << 7
# asm 1: sllx <x04=int64#3,7,>s04=int64#14
# asm 2: sllx <x04=%i2,7,>s04=%o4
sllx %i2,7,%o4

# qhasm:   x1b += x04
# asm 1: add <x1b=int64#10,<x04=int64#3,>x1b=int64#10
# asm 2: add <x1b=%o0,<x04=%i2,>x1b=%o0
add %o0,%i2,%o0

# qhasm:   s0c = x0c << 7
# asm 1: sllx <x0c=int64#12,7,>s0c=int64#16
# asm 2: sllx <x0c=%o2,7,>s0c=%o7
sllx %o2,7,%o7

# qhasm:   x13 += x0c
# asm 1: add <x13=int64#4,<x0c=int64#12,>x13=int64#4
# asm 2: add <x13=%i3,<x0c=%o2,>x13=%i3
add %i3,%o2,%i3

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int64#3,25,>x04=int64#3
# asm 2: srl <x04=%i2,25,>x04=%i2
srl %i2,25,%i2

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int64#12,25,>x0c=int64#12
# asm 2: srl <x0c=%o2,25,>x0c=%o2
srl %o2,25,%o2

# qhasm:   x04 |= s04
# asm 1: or  <x04=int64#3,<s04=int64#14,>x04=int64#3
# asm 2: or  <x04=%i2,<s04=%o4,>x04=%i2
or  %i2,%o4,%i2

# qhasm:   x0c |= s0c
# asm 1: or  <x0c=int64#12,<s0c=int64#16,>x0c=int64#12
# asm 2: or  <x0c=%o2,<s0c=%o7,>x0c=%o2
or  %o2,%o7,%o2

# qhasm:                 x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#20],>x06=int64#14
# asm 2: ldx [%fp+2023-<x06_stack=184],>x06=%o4
ldx [%fp+2023-184],%o4

# qhasm:   x04 ^= x13
# asm 1: xor <x04=int64#3,<x13=int64#4,>x04=int64#3
# asm 2: xor <x04=%i2,<x13=%i3,>x04=%i2
xor %i2,%i3,%i2

# qhasm:   x0c ^= x1b
# asm 1: xor <x0c=int64#12,<x1b=int64#10,>x0c=int64#12
# asm 2: xor <x0c=%o2,<x1b=%o0,>x0c=%o2
xor %o2,%o0,%o2

# qhasm:                 x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#10],>x0e=int64#16
# asm 2: ldx [%fp+2023-<x0e_stack=104],>x0e=%o7
ldx [%fp+2023-104],%o7

# qhasm: s02 = x02 << 7
# asm 1: sllx <x02=int64#9,7,>s02=int64#17
# asm 2: sllx <x02=%g5,7,>s02=%l0
sllx %g5,7,%l0

# qhasm: x1d += x02
# asm 1: add <x1d=int64#7,<x02=int64#9,>x1d=int64#7
# asm 2: add <x1d=%g1,<x02=%g5,>x1d=%g1
add %g1,%g5,%g1

# qhasm: s0a = x0a << 7
# asm 1: sllx <x0a=int64#11,7,>s0a=int64#18
# asm 2: sllx <x0a=%o1,7,>s0a=%l1
sllx %o1,7,%l1

# qhasm: x15 += x0a
# asm 1: add <x15=int64#13,<x0a=int64#11,>x15=int64#13
# asm 2: add <x15=%o3,<x0a=%o1,>x15=%o3
add %o3,%o1,%o3

# qhasm: (uint32) x02 >>= 25
# asm 1: srl <x02=int64#9,25,>x02=int64#9
# asm 2: srl <x02=%g5,25,>x02=%g5
srl %g5,25,%g5

# qhasm: (uint32) x0a >>= 25
# asm 1: srl <x0a=int64#11,25,>x0a=int64#11
# asm 2: srl <x0a=%o1,25,>x0a=%o1
srl %o1,25,%o1

# qhasm: x02 |= s02
# asm 1: or  <x02=int64#9,<s02=int64#17,>x02=int64#9
# asm 2: or  <x02=%g5,<s02=%l0,>x02=%g5
or  %g5,%l0,%g5

# qhasm: x0a |= s0a
# asm 1: or  <x0a=int64#11,<s0a=int64#18,>x0a=int64#11
# asm 2: or  <x0a=%o1,<s0a=%l1,>x0a=%o1
or  %o1,%l1,%o1

# qhasm: x02 ^= x15
# asm 1: xor <x02=int64#9,<x15=int64#13,>x02=int64#9
# asm 2: xor <x02=%g5,<x15=%o3,>x02=%g5
xor %g5,%o3,%g5

# qhasm: x0a ^= x1d
# asm 1: xor <x0a=int64#11,<x1d=int64#7,>x0a=int64#11
# asm 2: xor <x0a=%o1,<x1d=%g1,>x0a=%o1
xor %o1,%g1,%o1

# qhasm:   s06 = x06 << 7
# asm 1: sllx <x06=int64#14,7,>s06=int64#17
# asm 2: sllx <x06=%o4,7,>s06=%l0
sllx %o4,7,%l0

# qhasm:   x19 += x06
# asm 1: add <x19=int64#6,<x06=int64#14,>x19=int64#6
# asm 2: add <x19=%i5,<x06=%o4,>x19=%i5
add %i5,%o4,%i5

# qhasm:   s0e = x0e << 7
# asm 1: sllx <x0e=int64#16,7,>s0e=int64#18
# asm 2: sllx <x0e=%o7,7,>s0e=%l1
sllx %o7,7,%l1

# qhasm:   x11 += x0e
# asm 1: add <x11=int64#5,<x0e=int64#16,>x11=int64#5
# asm 2: add <x11=%i4,<x0e=%o7,>x11=%i4
add %i4,%o7,%i4

# qhasm:   (uint32) x06 >>= 25
# asm 1: srl <x06=int64#14,25,>x06=int64#14
# asm 2: srl <x06=%o4,25,>x06=%o4
srl %o4,25,%o4

# qhasm:   (uint32) x0e >>= 25
# asm 1: srl <x0e=int64#16,25,>x0e=int64#16
# asm 2: srl <x0e=%o7,25,>x0e=%o7
srl %o7,25,%o7

# qhasm:   x06 |= s06
# asm 1: or  <x06=int64#14,<s06=int64#17,>x06=int64#14
# asm 2: or  <x06=%o4,<s06=%l0,>x06=%o4
or  %o4,%l0,%o4

# qhasm:   x0e |= s0e
# asm 1: or  <x0e=int64#16,<s0e=int64#18,>x0e=int64#16
# asm 2: or  <x0e=%o7,<s0e=%l1,>x0e=%o7
or  %o7,%l1,%o7

# qhasm:                 x01 = x01_stack
# asm 1: ldx [%fp+2023-<x01_stack=stack64#2],>x01=int64#17
# asm 2: ldx [%fp+2023-<x01_stack=40],>x01=%l0
ldx [%fp+2023-40],%l0

# qhasm:   x06 ^= x11
# asm 1: xor <x06=int64#14,<x11=int64#5,>x06=int64#14
# asm 2: xor <x06=%o4,<x11=%i4,>x06=%o4
xor %o4,%i4,%o4

# qhasm:   x0e ^= x19
# asm 1: xor <x0e=int64#16,<x19=int64#6,>x0e=int64#16
# asm 2: xor <x0e=%o7,<x19=%i5,>x0e=%o7
xor %o7,%i5,%o7

# qhasm:                 x1e = x1e_stack
# asm 1: ldx [%fp+2023-<x1e_stack=stack64#27],>x1e=int64#18
# asm 2: ldx [%fp+2023-<x1e_stack=240],>x1e=%l1
ldx [%fp+2023-240],%l1

# qhasm: s02 = x02 << 11
# asm 1: sllx <x02=int64#9,11,>s02=int64#19
# asm 2: sllx <x02=%g5,11,>s02=%l2
sllx %g5,11,%l2

# qhasm: x17 += x02
# asm 1: add <x17=int64#8,<x02=int64#9,>x17=int64#8
# asm 2: add <x17=%g4,<x02=%g5,>x17=%g4
add %g4,%g5,%g4

# qhasm:                 x09 = x09_stack
# asm 1: ldx [%fp+2023-<x09_stack=stack64#5],>x09=int64#20
# asm 2: ldx [%fp+2023-<x09_stack=64],>x09=%l3
ldx [%fp+2023-64],%l3

# qhasm: s06 = x06 << 11
# asm 1: sllx <x06=int64#14,11,>s06=int64#21
# asm 2: sllx <x06=%o4,11,>s06=%l4
sllx %o4,11,%l4

# qhasm: x13 += x06
# asm 1: add <x13=int64#4,<x06=int64#14,>x13=int64#4
# asm 2: add <x13=%i3,<x06=%o4,>x13=%i3
add %i3,%o4,%i3

# qhasm:                 x16 = x16_stack
# asm 1: ldx [%fp+2023-<x16_stack=stack64#24],>x16=int64#22
# asm 2: ldx [%fp+2023-<x16_stack=216],>x16=%l5
ldx [%fp+2023-216],%l5

# qhasm: (uint32) x02 >>= 21
# asm 1: srl <x02=int64#9,21,>x02=int64#9
# asm 2: srl <x02=%g5,21,>x02=%g5
srl %g5,21,%g5

# qhasm: (uint32) x06 >>= 21
# asm 1: srl <x06=int64#14,21,>x06=int64#14
# asm 2: srl <x06=%o4,21,>x06=%o4
srl %o4,21,%o4

# qhasm:                 x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#8],>x05=int64#23
# asm 2: ldx [%fp+2023-<x05_stack=88],>x05=%l6
ldx [%fp+2023-88],%l6

# qhasm: x02 |= s02
# asm 1: or  <x02=int64#9,<s02=int64#19,>x02=int64#9
# asm 2: or  <x02=%g5,<s02=%l2,>x02=%g5
or  %g5,%l2,%g5

# qhasm: x06 |= s06
# asm 1: or  <x06=int64#14,<s06=int64#21,>x06=int64#14
# asm 2: or  <x06=%o4,<s06=%l4,>x06=%o4
or  %o4,%l4,%o4

# qhasm:         x17_stack = x17
# asm 1: stx <x17=int64#8,[%fp+2023->x17_stack=stack64#8]
# asm 2: stx <x17=%g4,[%fp+2023->x17_stack=88]
stx %g4,[%fp+2023-88]

# qhasm: x02 ^= x13
# asm 1: xor <x02=int64#9,<x13=int64#4,>x02=int64#9
# asm 2: xor <x02=%g5,<x13=%i3,>x02=%g5
xor %g5,%i3,%g5

# qhasm: x06 ^= x17
# asm 1: xor <x06=int64#14,<x17=int64#8,>x06=int64#8
# asm 2: xor <x06=%o4,<x17=%g4,>x06=%g4
xor %o4,%g4,%g4

# qhasm:         x13_stack = x13
# asm 1: stx <x13=int64#4,[%fp+2023->x13_stack=stack64#5]
# asm 2: stx <x13=%i3,[%fp+2023->x13_stack=64]
stx %i3,[%fp+2023-64]

# qhasm:   s0a = x0a << 11
# asm 1: sllx <x0a=int64#11,11,>s0a=int64#4
# asm 2: sllx <x0a=%o1,11,>s0a=%i3
sllx %o1,11,%i3

# qhasm:   x1f += x0a
# asm 1: add <x1f=int64#15,<x0a=int64#11,>x1f=int64#14
# asm 2: add <x1f=%o5,<x0a=%o1,>x1f=%o4
add %o5,%o1,%o4

# qhasm:                 x1a = x1a_stack
# asm 1: ldx [%fp+2023-<x1a_stack=stack64#26],>x1a=int64#15
# asm 2: ldx [%fp+2023-<x1a_stack=232],>x1a=%o5
ldx [%fp+2023-232],%o5

# qhasm:   s0e = x0e << 11
# asm 1: sllx <x0e=int64#16,11,>s0e=int64#19
# asm 2: sllx <x0e=%o7,11,>s0e=%l2
sllx %o7,11,%l2

# qhasm:   x1b += x0e
# asm 1: add <x1b=int64#10,<x0e=int64#16,>x1b=int64#10
# asm 2: add <x1b=%o0,<x0e=%o7,>x1b=%o0
add %o0,%o7,%o0

# qhasm:         x02_stack = x02
# asm 1: stx <x02=int64#9,[%fp+2023->x02_stack=stack64#20]
# asm 2: stx <x02=%g5,[%fp+2023->x02_stack=184]
stx %g5,[%fp+2023-184]

# qhasm:   (uint32) x0a >>= 21
# asm 1: srl <x0a=int64#11,21,>x0a=int64#9
# asm 2: srl <x0a=%o1,21,>x0a=%g5
srl %o1,21,%g5

# qhasm:   (uint32) x0e >>= 21
# asm 1: srl <x0e=int64#16,21,>x0e=int64#11
# asm 2: srl <x0e=%o7,21,>x0e=%o1
srl %o7,21,%o1

# qhasm:         x06_stack = x06
# asm 1: stx <x06=int64#8,[%fp+2023->x06_stack=stack64#24]
# asm 2: stx <x06=%g4,[%fp+2023->x06_stack=216]
stx %g4,[%fp+2023-216]

# qhasm:   x0a |= s0a
# asm 1: or  <x0a=int64#9,<s0a=int64#4,>x0a=int64#4
# asm 2: or  <x0a=%g5,<s0a=%i3,>x0a=%i3
or  %g5,%i3,%i3

# qhasm:   x0e |= s0e
# asm 1: or  <x0e=int64#11,<s0e=int64#19,>x0e=int64#8
# asm 2: or  <x0e=%o1,<s0e=%l2,>x0e=%g4
or  %o1,%l2,%g4

# qhasm:         x1f_stack = x1f
# asm 1: stx <x1f=int64#14,[%fp+2023->x1f_stack=stack64#16]
# asm 2: stx <x1f=%o4,[%fp+2023->x1f_stack=152]
stx %o4,[%fp+2023-152]

# qhasm:   x0a ^= x1b
# asm 1: xor <x0a=int64#4,<x1b=int64#10,>x0a=int64#4
# asm 2: xor <x0a=%i3,<x1b=%o0,>x0a=%i3
xor %i3,%o0,%i3

# qhasm:   x0e ^= x1f
# asm 1: xor <x0e=int64#8,<x1f=int64#14,>x0e=int64#8
# asm 2: xor <x0e=%g4,<x1f=%o4,>x0e=%g4
xor %g4,%o4,%g4

# qhasm:         x1b_stack = x1b
# asm 1: stx <x1b=int64#10,[%fp+2023->x1b_stack=stack64#12]
# asm 2: stx <x1b=%o0,[%fp+2023->x1b_stack=120]
stx %o0,[%fp+2023-120]

# qhasm: s00 = x00 << 11
# asm 1: sllx <x00=int64#1,11,>s00=int64#9
# asm 2: sllx <x00=%i0,11,>s00=%g5
sllx %i0,11,%g5

# qhasm: x15 += x00
# asm 1: add <x15=int64#13,<x00=int64#1,>x15=int64#10
# asm 2: add <x15=%o3,<x00=%i0,>x15=%o0
add %o3,%i0,%o0

# qhasm:                 x0d = x0d_stack
# asm 1: ldx [%fp+2023-<x0d_stack=stack64#14],>x0d=int64#11
# asm 2: ldx [%fp+2023-<x0d_stack=136],>x0d=%o1
ldx [%fp+2023-136],%o1

# qhasm: s04 = x04 << 11
# asm 1: sllx <x04=int64#3,11,>s04=int64#13
# asm 2: sllx <x04=%i2,11,>s04=%o3
sllx %i2,11,%o3

# qhasm: x11 += x04
# asm 1: add <x11=int64#5,<x04=int64#3,>x11=int64#5
# asm 2: add <x11=%i4,<x04=%i2,>x11=%i4
add %i4,%i2,%i4

# qhasm:         x0a_stack = x0a
# asm 1: stx <x0a=int64#4,[%fp+2023->x0a_stack=stack64#25]
# asm 2: stx <x0a=%i3,[%fp+2023->x0a_stack=224]
stx %i3,[%fp+2023-224]

# qhasm: (uint32) x00 >>= 21
# asm 1: srl <x00=int64#1,21,>x00=int64#1
# asm 2: srl <x00=%i0,21,>x00=%i0
srl %i0,21,%i0

# qhasm: (uint32) x04 >>= 21
# asm 1: srl <x04=int64#3,21,>x04=int64#3
# asm 2: srl <x04=%i2,21,>x04=%i2
srl %i2,21,%i2

# qhasm:         x0e_stack = x0e
# asm 1: stx <x0e=int64#8,[%fp+2023->x0e_stack=stack64#26]
# asm 2: stx <x0e=%g4,[%fp+2023->x0e_stack=232]
stx %g4,[%fp+2023-232]

# qhasm: x00 |= s00
# asm 1: or  <x00=int64#1,<s00=int64#9,>x00=int64#1
# asm 2: or  <x00=%i0,<s00=%g5,>x00=%i0
or  %i0,%g5,%i0

# qhasm: x04 |= s04
# asm 1: or  <x04=int64#3,<s04=int64#13,>x04=int64#3
# asm 2: or  <x04=%i2,<s04=%o3,>x04=%i2
or  %i2,%o3,%i2

# qhasm:         x15_stack = x15
# asm 1: stx <x15=int64#10,[%fp+2023->x15_stack=stack64#6]
# asm 2: stx <x15=%o0,[%fp+2023->x15_stack=72]
stx %o0,[%fp+2023-72]

# qhasm: x00 ^= x11
# asm 1: xor <x00=int64#1,<x11=int64#5,>x00=int64#1
# asm 2: xor <x00=%i0,<x11=%i4,>x00=%i0
xor %i0,%i4,%i0

# qhasm: x04 ^= x15
# asm 1: xor <x04=int64#3,<x15=int64#10,>x04=int64#3
# asm 2: xor <x04=%i2,<x15=%o0,>x04=%i2
xor %i2,%o0,%i2

# qhasm:         x11_stack = x11
# asm 1: stx <x11=int64#5,[%fp+2023->x11_stack=stack64#4]
# asm 2: stx <x11=%i4,[%fp+2023->x11_stack=56]
stx %i4,[%fp+2023-56]

# qhasm:   s08 = x08 << 11
# asm 1: sllx <x08=int64#2,11,>s08=int64#4
# asm 2: sllx <x08=%i1,11,>s08=%i3
sllx %i1,11,%i3

# qhasm:   x1d += x08
# asm 1: add <x1d=int64#7,<x08=int64#2,>x1d=int64#5
# asm 2: add <x1d=%g1,<x08=%i1,>x1d=%i4
add %g1,%i1,%i4

# qhasm:                 x12 = x12_stack
# asm 1: ldx [%fp+2023-<x12_stack=stack64#22],>x12=int64#7
# asm 2: ldx [%fp+2023-<x12_stack=200],>x12=%g1
ldx [%fp+2023-200],%g1

# qhasm:   s0c = x0c << 11
# asm 1: sllx <x0c=int64#12,11,>s0c=int64#8
# asm 2: sllx <x0c=%o2,11,>s0c=%g4
sllx %o2,11,%g4

# qhasm:   x19 += x0c
# asm 1: add <x19=int64#6,<x0c=int64#12,>x19=int64#6
# asm 2: add <x19=%i5,<x0c=%o2,>x19=%i5
add %i5,%o2,%i5

# qhasm:         x00_stack = x00
# asm 1: stx <x00=int64#1,[%fp+2023->x00_stack=stack64#2]
# asm 2: stx <x00=%i0,[%fp+2023->x00_stack=40]
stx %i0,[%fp+2023-40]

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int64#2,21,>x08=int64#1
# asm 2: srl <x08=%i1,21,>x08=%i0
srl %i1,21,%i0

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int64#12,21,>x0c=int64#2
# asm 2: srl <x0c=%o2,21,>x0c=%i1
srl %o2,21,%i1

# qhasm:         x04_stack = x04
# asm 1: stx <x04=int64#3,[%fp+2023->x04_stack=stack64#22]
# asm 2: stx <x04=%i2,[%fp+2023->x04_stack=200]
stx %i2,[%fp+2023-200]

# qhasm:   x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#4,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%i3,>x08=%i0
or  %i0,%i3,%i0

# qhasm:   x0c |= s0c
# asm 1: or  <x0c=int64#2,<s0c=int64#8,>x0c=int64#2
# asm 2: or  <x0c=%i1,<s0c=%g4,>x0c=%i1
or  %i1,%g4,%i1

# qhasm:         x1d_stack = x1d
# asm 1: stx <x1d=int64#5,[%fp+2023->x1d_stack=stack64#14]
# asm 2: stx <x1d=%i4,[%fp+2023->x1d_stack=136]
stx %i4,[%fp+2023-136]

# qhasm:   x08 ^= x19
# asm 1: xor <x08=int64#1,<x19=int64#6,>x08=int64#1
# asm 2: xor <x08=%i0,<x19=%i5,>x08=%i0
xor %i0,%i5,%i0

# qhasm:   x0c ^= x1d
# asm 1: xor <x0c=int64#2,<x1d=int64#5,>x0c=int64#2
# asm 2: xor <x0c=%i1,<x1d=%i4,>x0c=%i1
xor %i1,%i4,%i1

# qhasm:         x19_stack = x19
# asm 1: stx <x19=int64#6,[%fp+2023->x19_stack=stack64#10]
# asm 2: stx <x19=%i5,[%fp+2023->x19_stack=104]
stx %i5,[%fp+2023-104]

# qhasm: s01 = x01 << 7
# asm 1: sllx <x01=int64#17,7,>s01=int64#3
# asm 2: sllx <x01=%l0,7,>s01=%i2
sllx %l0,7,%i2

# qhasm: x1e += x01
# asm 1: add <x1e=int64#18,<x01=int64#17,>x1e=int64#4
# asm 2: add <x1e=%l1,<x01=%l0,>x1e=%i3
add %l1,%l0,%i3

# qhasm:         x08_stack = x08
# asm 1: stx <x08=int64#1,[%fp+2023->x08_stack=stack64#27]
# asm 2: stx <x08=%i0,[%fp+2023->x08_stack=240]
stx %i0,[%fp+2023-240]

# qhasm: s09 = x09 << 7
# asm 1: sllx <x09=int64#20,7,>s09=int64#1
# asm 2: sllx <x09=%l3,7,>s09=%i0
sllx %l3,7,%i0

# qhasm: x16 += x09
# asm 1: add <x16=int64#22,<x09=int64#20,>x16=int64#5
# asm 2: add <x16=%l5,<x09=%l3,>x16=%i4
add %l5,%l3,%i4

# qhasm:                 x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#23],>x03=int64#6
# asm 2: ldx [%fp+2023-<x03_stack=208],>x03=%i5
ldx [%fp+2023-208],%i5

# qhasm: (uint32) x01 >>= 25
# asm 1: srl <x01=int64#17,25,>x01=int64#8
# asm 2: srl <x01=%l0,25,>x01=%g4
srl %l0,25,%g4

# qhasm: (uint32) x09 >>= 25
# asm 1: srl <x09=int64#20,25,>x09=int64#9
# asm 2: srl <x09=%l3,25,>x09=%g5
srl %l3,25,%g5

# qhasm:                 x1c = x1c_stack
# asm 1: ldx [%fp+2023-<x1c_stack=stack64#15],>x1c=int64#10
# asm 2: ldx [%fp+2023-<x1c_stack=144],>x1c=%o0
ldx [%fp+2023-144],%o0

# qhasm: x01 |= s01
# asm 1: or  <x01=int64#8,<s01=int64#3,>x01=int64#3
# asm 2: or  <x01=%g4,<s01=%i2,>x01=%i2
or  %g4,%i2,%i2

# qhasm: x09 |= s09
# asm 1: or  <x09=int64#9,<s09=int64#1,>x09=int64#1
# asm 2: or  <x09=%g5,<s09=%i0,>x09=%i0
or  %g5,%i0,%i0

# qhasm:                 x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#3],>x0b=int64#8
# asm 2: ldx [%fp+2023-<x0b_stack=48],>x0b=%g4
ldx [%fp+2023-48],%g4

# qhasm: x01 ^= x16
# asm 1: xor <x01=int64#3,<x16=int64#5,>x01=int64#3
# asm 2: xor <x01=%i2,<x16=%i4,>x01=%i2
xor %i2,%i4,%i2

# qhasm: x09 ^= x1e
# asm 1: xor <x09=int64#1,<x1e=int64#4,>x09=int64#9
# asm 2: xor <x09=%i0,<x1e=%i3,>x09=%g5
xor %i0,%i3,%g5

# qhasm:                 x14 = x14_stack
# asm 1: ldx [%fp+2023-<x14_stack=stack64#11],>x14=int64#1
# asm 2: ldx [%fp+2023-<x14_stack=112],>x14=%i0
ldx [%fp+2023-112],%i0

# qhasm:   s05 = x05 << 7
# asm 1: sllx <x05=int64#23,7,>s05=int64#12
# asm 2: sllx <x05=%l6,7,>s05=%o2
sllx %l6,7,%o2

# qhasm:   x1a += x05
# asm 1: add <x1a=int64#15,<x05=int64#23,>x1a=int64#14
# asm 2: add <x1a=%o5,<x05=%l6,>x1a=%o4
add %o5,%l6,%o4

# qhasm:         x0c_stack = x0c
# asm 1: stx <x0c=int64#2,[%fp+2023->x0c_stack=stack64#3]
# asm 2: stx <x0c=%i1,[%fp+2023->x0c_stack=48]
stx %i1,[%fp+2023-48]

# qhasm:   s0d = x0d << 7
# asm 1: sllx <x0d=int64#11,7,>s0d=int64#2
# asm 2: sllx <x0d=%o1,7,>s0d=%i1
sllx %o1,7,%i1

# qhasm:   x12 += x0d
# asm 1: add <x12=int64#7,<x0d=int64#11,>x12=int64#7
# asm 2: add <x12=%g1,<x0d=%o1,>x12=%g1
add %g1,%o1,%g1

# qhasm:                 x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#29],>x07=int64#13
# asm 2: ldx [%fp+2023-<x07_stack=256],>x07=%o3
ldx [%fp+2023-256],%o3

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int64#23,25,>x05=int64#15
# asm 2: srl <x05=%l6,25,>x05=%o5
srl %l6,25,%o5

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int64#11,25,>x0d=int64#11
# asm 2: srl <x0d=%o1,25,>x0d=%o1
srl %o1,25,%o1

# qhasm:                 x18 = x18_stack
# asm 1: ldx [%fp+2023-<x18_stack=stack64#13],>x18=int64#16
# asm 2: ldx [%fp+2023-<x18_stack=128],>x18=%o7
ldx [%fp+2023-128],%o7

# qhasm:   x05 |= s05
# asm 1: or  <x05=int64#15,<s05=int64#12,>x05=int64#12
# asm 2: or  <x05=%o5,<s05=%o2,>x05=%o2
or  %o5,%o2,%o2

# qhasm:   x0d |= s0d
# asm 1: or  <x0d=int64#11,<s0d=int64#2,>x0d=int64#2
# asm 2: or  <x0d=%o1,<s0d=%i1,>x0d=%i1
or  %o1,%i1,%i1

# qhasm:                 x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#21],>x0f=int64#11
# asm 2: ldx [%fp+2023-<x0f_stack=192],>x0f=%o1
ldx [%fp+2023-192],%o1

# qhasm:   x05 ^= x12
# asm 1: xor <x05=int64#12,<x12=int64#7,>x05=int64#18
# asm 2: xor <x05=%o2,<x12=%g1,>x05=%l1
xor %o2,%g1,%l1

# qhasm:   x0d ^= x1a
# asm 1: xor <x0d=int64#2,<x1a=int64#14,>x0d=int64#19
# asm 2: xor <x0d=%i1,<x1a=%o4,>x0d=%l2
xor %i1,%o4,%l2

# qhasm:                 x10 = x10_stack
# asm 1: ldx [%fp+2023-<x10_stack=stack64#9],>x10=int64#2
# asm 2: ldx [%fp+2023-<x10_stack=96],>x10=%i1
ldx [%fp+2023-96],%i1

# qhasm: s03 = x03 << 7
# asm 1: sllx <x03=int64#6,7,>s03=int64#12
# asm 2: sllx <x03=%i5,7,>s03=%o2
sllx %i5,7,%o2

# qhasm: x1c += x03
# asm 1: add <x1c=int64#10,<x03=int64#6,>x1c=int64#20
# asm 2: add <x1c=%o0,<x03=%i5,>x1c=%l3
add %o0,%i5,%l3

# qhasm: s0b = x0b << 7
# asm 1: sllx <x0b=int64#8,7,>s0b=int64#10
# asm 2: sllx <x0b=%g4,7,>s0b=%o0
sllx %g4,7,%o0

# qhasm: x14 += x0b
# asm 1: add <x14=int64#1,<x0b=int64#8,>x14=int64#15
# asm 2: add <x14=%i0,<x0b=%g4,>x14=%o5
add %i0,%g4,%o5

# qhasm: (uint32) x03 >>= 25
# asm 1: srl <x03=int64#6,25,>x03=int64#1
# asm 2: srl <x03=%i5,25,>x03=%i0
srl %i5,25,%i0

# qhasm: (uint32) x0b >>= 25
# asm 1: srl <x0b=int64#8,25,>x0b=int64#6
# asm 2: srl <x0b=%g4,25,>x0b=%i5
srl %g4,25,%i5

# qhasm: x03 |= s03
# asm 1: or  <x03=int64#1,<s03=int64#12,>x03=int64#1
# asm 2: or  <x03=%i0,<s03=%o2,>x03=%i0
or  %i0,%o2,%i0

# qhasm: x0b |= s0b
# asm 1: or  <x0b=int64#6,<s0b=int64#10,>x0b=int64#6
# asm 2: or  <x0b=%i5,<s0b=%o0,>x0b=%i5
or  %i5,%o0,%i5

# qhasm: x03 ^= x14
# asm 1: xor <x03=int64#1,<x14=int64#15,>x03=int64#1
# asm 2: xor <x03=%i0,<x14=%o5,>x03=%i0
xor %i0,%o5,%i0

# qhasm: x0b ^= x1c
# asm 1: xor <x0b=int64#6,<x1c=int64#20,>x0b=int64#8
# asm 2: xor <x0b=%i5,<x1c=%l3,>x0b=%g4
xor %i5,%l3,%g4

# qhasm:   s07 = x07 << 7
# asm 1: sllx <x07=int64#13,7,>s07=int64#6
# asm 2: sllx <x07=%o3,7,>s07=%i5
sllx %o3,7,%i5

# qhasm:   x18 += x07
# asm 1: add <x18=int64#16,<x07=int64#13,>x18=int64#22
# asm 2: add <x18=%o7,<x07=%o3,>x18=%l5
add %o7,%o3,%l5

# qhasm:   s0f = x0f << 7
# asm 1: sllx <x0f=int64#11,7,>s0f=int64#10
# asm 2: sllx <x0f=%o1,7,>s0f=%o0
sllx %o1,7,%o0

# qhasm:   x10 += x0f
# asm 1: add <x10=int64#2,<x0f=int64#11,>x10=int64#16
# asm 2: add <x10=%i1,<x0f=%o1,>x10=%o7
add %i1,%o1,%o7

# qhasm:   (uint32) x07 >>= 25
# asm 1: srl <x07=int64#13,25,>x07=int64#2
# asm 2: srl <x07=%o3,25,>x07=%i1
srl %o3,25,%i1

# qhasm:   (uint32) x0f >>= 25
# asm 1: srl <x0f=int64#11,25,>x0f=int64#11
# asm 2: srl <x0f=%o1,25,>x0f=%o1
srl %o1,25,%o1

# qhasm:   x07 |= s07
# asm 1: or  <x07=int64#2,<s07=int64#6,>x07=int64#2
# asm 2: or  <x07=%i1,<s07=%i5,>x07=%i1
or  %i1,%i5,%i1

# qhasm:   x0f |= s0f
# asm 1: or  <x0f=int64#11,<s0f=int64#10,>x0f=int64#6
# asm 2: or  <x0f=%o1,<s0f=%o0,>x0f=%i5
or  %o1,%o0,%i5

# qhasm:   x07 ^= x10
# asm 1: xor <x07=int64#2,<x10=int64#16,>x07=int64#10
# asm 2: xor <x07=%i1,<x10=%o7,>x07=%o0
xor %i1,%o7,%o0

# qhasm:   x0f ^= x18
# asm 1: xor <x0f=int64#6,<x18=int64#22,>x0f=int64#11
# asm 2: xor <x0f=%i5,<x18=%l5,>x0f=%o1
xor %i5,%l5,%o1

# qhasm:                 r = r_stack
# asm 1: ldx [%fp+2023-<r_stack=stack64#7],>r=int64#6
# asm 2: ldx [%fp+2023-<r_stack=80],>r=%i5
ldx [%fp+2023-80],%i5

# qhasm: s03 = x03 << 11
# asm 1: sllx <x03=int64#1,11,>s03=int64#12
# asm 2: sllx <x03=%i0,11,>s03=%o2
sllx %i0,11,%o2

# qhasm: x16 += x03
# asm 1: add <x16=int64#5,<x03=int64#1,>x16=int64#2
# asm 2: add <x16=%i4,<x03=%i0,>x16=%i1
add %i4,%i0,%i1

# qhasm: s07 = x07 << 11
# asm 1: sllx <x07=int64#10,11,>s07=int64#5
# asm 2: sllx <x07=%o0,11,>s07=%i4
sllx %o0,11,%i4

# qhasm: x12 += x07
# asm 1: add <x12=int64#7,<x07=int64#10,>x12=int64#13
# asm 2: add <x12=%g1,<x07=%o0,>x12=%o3
add %g1,%o0,%o3

# qhasm: (uint32) x03 >>= 21
# asm 1: srl <x03=int64#1,21,>x03=int64#1
# asm 2: srl <x03=%i0,21,>x03=%i0
srl %i0,21,%i0

# qhasm: (uint32) x07 >>= 21
# asm 1: srl <x07=int64#10,21,>x07=int64#7
# asm 2: srl <x07=%o0,21,>x07=%g1
srl %o0,21,%g1

# qhasm: x03 |= s03
# asm 1: or  <x03=int64#1,<s03=int64#12,>x03=int64#1
# asm 2: or  <x03=%i0,<s03=%o2,>x03=%i0
or  %i0,%o2,%i0

# qhasm: x07 |= s07
# asm 1: or  <x07=int64#7,<s07=int64#5,>x07=int64#5
# asm 2: or  <x07=%g1,<s07=%i4,>x07=%i4
or  %g1,%i4,%i4

# qhasm: x03 ^= x12
# asm 1: xor <x03=int64#1,<x12=int64#13,>x03=int64#1
# asm 2: xor <x03=%i0,<x12=%o3,>x03=%i0
xor %i0,%o3,%i0

# qhasm: x07 ^= x16
# asm 1: xor <x07=int64#5,<x16=int64#2,>x07=int64#5
# asm 2: xor <x07=%i4,<x16=%i1,>x07=%i4
xor %i4,%i1,%i4

# qhasm:                    unsigned>? r -= 2
# asm 1: subcc <r=int64#6,2,>r=int64#21
# asm 2: subcc <r=%i5,2,>r=%l4
subcc %i5,2,%l4

# qhasm:   s0b = x0b << 11
# asm 1: sllx <x0b=int64#8,11,>s0b=int64#7
# asm 2: sllx <x0b=%g4,11,>s0b=%g1
sllx %g4,11,%g1

# qhasm:   x1e += x0b
# asm 1: add <x1e=int64#4,<x0b=int64#8,>x1e=int64#17
# asm 2: add <x1e=%i3,<x0b=%g4,>x1e=%l0
add %i3,%g4,%l0

# qhasm:                 x00 = x00_stack
# asm 1: ldx [%fp+2023-<x00_stack=stack64#2],>x00=int64#6
# asm 2: ldx [%fp+2023-<x00_stack=40],>x00=%i5
ldx [%fp+2023-40],%i5

# qhasm:   s0f = x0f << 11
# asm 1: sllx <x0f=int64#11,11,>s0f=int64#4
# asm 2: sllx <x0f=%o1,11,>s0f=%i3
sllx %o1,11,%i3

# qhasm:   x1a += x0f
# asm 1: add <x1a=int64#14,<x0f=int64#11,>x1a=int64#12
# asm 2: add <x1a=%o4,<x0f=%o1,>x1a=%o2
add %o4,%o1,%o2

# qhasm:         x03_stack = x03
# asm 1: stx <x03=int64#1,[%fp+2023->x03_stack=stack64#21]
# asm 2: stx <x03=%i0,[%fp+2023->x03_stack=192]
stx %i0,[%fp+2023-192]

# qhasm:   (uint32) x0b >>= 21
# asm 1: srl <x0b=int64#8,21,>x0b=int64#1
# asm 2: srl <x0b=%g4,21,>x0b=%i0
srl %g4,21,%i0

# qhasm:   (uint32) x0f >>= 21
# asm 1: srl <x0f=int64#11,21,>x0f=int64#8
# asm 2: srl <x0f=%o1,21,>x0f=%g4
srl %o1,21,%g4

# qhasm:         x07_stack = x07
# asm 1: stx <x07=int64#5,[%fp+2023->x07_stack=stack64#23]
# asm 2: stx <x07=%i4,[%fp+2023->x07_stack=208]
stx %i4,[%fp+2023-208]

# qhasm:   x0b |= s0b
# asm 1: or  <x0b=int64#1,<s0b=int64#7,>x0b=int64#5
# asm 2: or  <x0b=%i0,<s0b=%g1,>x0b=%i4
or  %i0,%g1,%i4

# qhasm:   x0f |= s0f
# asm 1: or  <x0f=int64#8,<s0f=int64#4,>x0f=int64#4
# asm 2: or  <x0f=%g4,<s0f=%i3,>x0f=%i3
or  %g4,%i3,%i3

# qhasm:                 x08 = x08_stack
# asm 1: ldx [%fp+2023-<x08_stack=stack64#27],>x08=int64#1
# asm 2: ldx [%fp+2023-<x08_stack=240],>x08=%i0
ldx [%fp+2023-240],%i0

# qhasm:   x0b ^= x1a
# asm 1: xor <x0b=int64#5,<x1a=int64#12,>x0b=int64#5
# asm 2: xor <x0b=%i4,<x1a=%o2,>x0b=%i4
xor %i4,%o2,%i4

# qhasm:   x0f ^= x1e
# asm 1: xor <x0f=int64#4,<x1e=int64#17,>x0f=int64#4
# asm 2: xor <x0f=%i3,<x1e=%l0,>x0f=%i3
xor %i3,%l0,%i3

# qhasm:                 x04 = x04_stack
# asm 1: ldx [%fp+2023-<x04_stack=stack64#22],>x04=int64#10
# asm 2: ldx [%fp+2023-<x04_stack=200],>x04=%o0
ldx [%fp+2023-200],%o0

# qhasm: s01 = x01 << 11
# asm 1: sllx <x01=int64#3,11,>s01=int64#8
# asm 2: sllx <x01=%i2,11,>s01=%g4
sllx %i2,11,%g4

# qhasm: x14 += x01
# asm 1: add <x14=int64#15,<x01=int64#3,>x14=int64#15
# asm 2: add <x14=%o5,<x01=%i2,>x14=%o5
add %o5,%i2,%o5

# qhasm:                 x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#3],>x0c=int64#7
# asm 2: ldx [%fp+2023-<x0c_stack=48],>x0c=%g1
ldx [%fp+2023-48],%g1

# qhasm: s05 = x05 << 11
# asm 1: sllx <x05=int64#18,11,>s05=int64#14
# asm 2: sllx <x05=%l1,11,>s05=%o4
sllx %l1,11,%o4

# qhasm: x10 += x05
# asm 1: add <x10=int64#16,<x05=int64#18,>x10=int64#11
# asm 2: add <x10=%o7,<x05=%l1,>x10=%o1
add %o7,%l1,%o1

# qhasm:         x0b_stack = x0b
# asm 1: stx <x0b=int64#5,[%fp+2023->x0b_stack=stack64#2]
# asm 2: stx <x0b=%i4,[%fp+2023->x0b_stack=40]
stx %i4,[%fp+2023-40]

# qhasm: (uint32) x01 >>= 21
# asm 1: srl <x01=int64#3,21,>x01=int64#3
# asm 2: srl <x01=%i2,21,>x01=%i2
srl %i2,21,%i2

# qhasm: (uint32) x05 >>= 21
# asm 1: srl <x05=int64#18,21,>x05=int64#5
# asm 2: srl <x05=%l1,21,>x05=%i4
srl %l1,21,%i4

# qhasm:         x0f_stack = x0f
# asm 1: stx <x0f=int64#4,[%fp+2023->x0f_stack=stack64#3]
# asm 2: stx <x0f=%i3,[%fp+2023->x0f_stack=48]
stx %i3,[%fp+2023-48]

# qhasm: x01 |= s01
# asm 1: or  <x01=int64#3,<s01=int64#8,>x01=int64#3
# asm 2: or  <x01=%i2,<s01=%g4,>x01=%i2
or  %i2,%g4,%i2

# qhasm: x05 |= s05
# asm 1: or  <x05=int64#5,<s05=int64#14,>x05=int64#4
# asm 2: or  <x05=%i4,<s05=%o4,>x05=%i3
or  %i4,%o4,%i3

# qhasm:                 x02 = x02_stack
# asm 1: ldx [%fp+2023-<x02_stack=stack64#20],>x02=int64#18
# asm 2: ldx [%fp+2023-<x02_stack=184],>x02=%l1
ldx [%fp+2023-184],%l1

# qhasm: x01 ^= x10
# asm 1: xor <x01=int64#3,<x10=int64#11,>x01=int64#8
# asm 2: xor <x01=%i2,<x10=%o1,>x01=%g4
xor %i2,%o1,%g4

# qhasm: x05 ^= x14
# asm 1: xor <x05=int64#4,<x14=int64#15,>x05=int64#4
# asm 2: xor <x05=%i3,<x14=%o5,>x05=%i3
xor %i3,%o5,%i3

# qhasm:                 x0a = x0a_stack
# asm 1: ldx [%fp+2023-<x0a_stack=stack64#25],>x0a=int64#5
# asm 2: ldx [%fp+2023-<x0a_stack=224],>x0a=%i4
ldx [%fp+2023-224],%i4

# qhasm:   s09 = x09 << 11
# asm 1: sllx <x09=int64#9,11,>s09=int64#23
# asm 2: sllx <x09=%g5,11,>s09=%l6
sllx %g5,11,%l6

# qhasm:   x1c += x09
# asm 1: add <x1c=int64#20,<x09=int64#9,>x1c=int64#16
# asm 2: add <x1c=%l3,<x09=%g5,>x1c=%o7
add %l3,%g5,%o7

# qhasm:                 x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#24],>x06=int64#14
# asm 2: ldx [%fp+2023-<x06_stack=216],>x06=%o4
ldx [%fp+2023-216],%o4

# qhasm:   s0d = x0d << 11
# asm 1: sllx <x0d=int64#19,11,>s0d=int64#20
# asm 2: sllx <x0d=%l2,11,>s0d=%l3
sllx %l2,11,%l3

# qhasm:   x18 += x0d
# asm 1: add <x18=int64#22,<x0d=int64#19,>x18=int64#3
# asm 2: add <x18=%l5,<x0d=%l2,>x18=%i2
add %l5,%l2,%i2

# qhasm:         x01_stack = x01
# asm 1: stx <x01=int64#8,[%fp+2023->x01_stack=stack64#20]
# asm 2: stx <x01=%g4,[%fp+2023->x01_stack=184]
stx %g4,[%fp+2023-184]

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int64#9,21,>x09=int64#8
# asm 2: srl <x09=%g5,21,>x09=%g4
srl %g5,21,%g4

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int64#19,21,>x0d=int64#9
# asm 2: srl <x0d=%l2,21,>x0d=%g5
srl %l2,21,%g5

# qhasm:         x05_stack = x05
# asm 1: stx <x05=int64#4,[%fp+2023->x05_stack=stack64#22]
# asm 2: stx <x05=%i3,[%fp+2023->x05_stack=200]
stx %i3,[%fp+2023-200]

# qhasm:   x09 |= s09
# asm 1: or  <x09=int64#8,<s09=int64#23,>x09=int64#4
# asm 2: or  <x09=%g4,<s09=%l6,>x09=%i3
or  %g4,%l6,%i3

# qhasm:   x0d |= s0d
# asm 1: or  <x0d=int64#9,<s0d=int64#20,>x0d=int64#8
# asm 2: or  <x0d=%g5,<s0d=%l3,>x0d=%g4
or  %g5,%l3,%g4

# qhasm:                 x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#26],>x0e=int64#9
# asm 2: ldx [%fp+2023-<x0e_stack=232],>x0e=%g5
ldx [%fp+2023-232],%g5

# qhasm:   x09 ^= x18
# asm 1: xor <x09=int64#4,<x18=int64#3,>x09=int64#4
# asm 2: xor <x09=%i3,<x18=%i2,>x09=%i3
xor %i3,%i2,%i3

# qhasm:   x0d ^= x1c
# asm 1: xor <x0d=int64#8,<x1c=int64#16,>x0d=int64#8
# asm 2: xor <x0d=%g4,<x1c=%o7,>x0d=%g4
xor %g4,%o7,%g4

# qhasm: goto morerounds if unsigned>
bgu,pt %xcc,._morerounds
nop

# qhasm: x16_stack = x16
# asm 1: stx <x16=int64#2,[%fp+2023->x16_stack=stack64#7]
# asm 2: stx <x16=%i1,[%fp+2023->x16_stack=80]
stx %i1,[%fp+2023-80]

# qhasm: x18_stack = x18
# asm 1: stx <x18=int64#3,[%fp+2023->x18_stack=stack64#9]
# asm 2: stx <x18=%i2,[%fp+2023->x18_stack=96]
stx %i2,[%fp+2023-96]

# qhasm: x1a_stack = x1a
# asm 1: stx <x1a=int64#12,[%fp+2023->x1a_stack=stack64#11]
# asm 2: stx <x1a=%o2,[%fp+2023->x1a_stack=112]
stx %o2,[%fp+2023-112]

# qhasm: x1c_stack = x1c
# asm 1: stx <x1c=int64#16,[%fp+2023->x1c_stack=stack64#13]
# asm 2: stx <x1c=%o7,[%fp+2023->x1c_stack=128]
stx %o7,[%fp+2023-128]

# qhasm: x1e_stack = x1e
# asm 1: stx <x1e=int64#17,[%fp+2023->x1e_stack=stack64#15]
# asm 2: stx <x1e=%l0,[%fp+2023->x1e_stack=144]
stx %l0,[%fp+2023-144]

# qhasm: x01 = x01_stack
# asm 1: ldx [%fp+2023-<x01_stack=stack64#20],>x01=int64#17
# asm 2: ldx [%fp+2023-<x01_stack=184],>x01=%l0
ldx [%fp+2023-184],%l0

# qhasm: x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#21],>x03=int64#19
# asm 2: ldx [%fp+2023-<x03_stack=192],>x03=%l2
ldx [%fp+2023-192],%l2

# qhasm: x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#22],>x05=int64#12
# asm 2: ldx [%fp+2023-<x05_stack=200],>x05=%o2
ldx [%fp+2023-200],%o2

# qhasm: x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#23],>x07=int64#16
# asm 2: ldx [%fp+2023-<x07_stack=208],>x07=%o7
ldx [%fp+2023-208],%o7

# qhasm:   finalization = finalization_stack
# asm 1: ldx [%fp+2023-<finalization_stack=stack64#17],>finalization=int64#20
# asm 2: ldx [%fp+2023-<finalization_stack=160],>finalization=%l3
ldx [%fp+2023-160],%l3

# qhasm:   in = in_stack
# asm 1: ldx [%fp+2023-<in_stack=stack64#19],>in=int64#2
# asm 2: ldx [%fp+2023-<in_stack=176],>in=%i1
ldx [%fp+2023-176],%i1

# qhasm:   inlen = inlen_stack
# asm 1: ldx [%fp+2023-<inlen_stack=stack64#18],>inlen=int64#3
# asm 2: ldx [%fp+2023-<inlen_stack=168],>inlen=%i2
ldx [%fp+2023-168],%i2

# qhasm:                   unsigned<? inlen - 32
# asm 1: subcc <inlen=int64#3,32,%g0
# asm 2: subcc <inlen=%i2,32,%g0
subcc %i2,32,%g0

# qhasm: goto mainloop if !unsigned<
bgeu,pt %xcc,._mainloop
nop

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:                       =? finalization - 1
# asm 1: subcc <finalization=int64#20,1,%g0
# asm 2: subcc <finalization=%l3,1,%g0
subcc %l3,1,%g0

# qhasm: goto finalization1 if =
be,pt %xcc,._finalization1
nop

# qhasm:                       =? finalization - 2
# asm 1: subcc <finalization=int64#20,2,%g0
# asm 2: subcc <finalization=%l3,2,%g0
subcc %l3,2,%g0

# qhasm: goto finalization2 if =
be,pt %xcc,._finalization2
nop

# qhasm:   z = &tmp
# asm 1: add %fp,1999->tmp=stack256#1,>z=int64#20
# asm 2: add %fp,1999->tmp=0,>z=%l3
add %fp,1999-0,%l3

# qhasm:   *(uint64 *) (z + 0) = 0
# asm 1: stx %g0,[<z=int64#20+0]
# asm 2: stx %g0,[<z=%l3+0]
stx %g0,[%l3+0]

# qhasm:   *(uint64 *) (z + 8) = 0
# asm 1: stx %g0,[<z=int64#20+8]
# asm 2: stx %g0,[<z=%l3+8]
stx %g0,[%l3+8]

# qhasm:   *(uint64 *) (z + 16) = 0
# asm 1: stx %g0,[<z=int64#20+16]
# asm 2: stx %g0,[<z=%l3+16]
stx %g0,[%l3+16]

# qhasm:   *(uint64 *) (z + 24) = 0
# asm 1: stx %g0,[<z=int64#20+24]
# asm 2: stx %g0,[<z=%l3+24]
stx %g0,[%l3+24]

# qhasm:                  =? inlen - 0
# asm 1: subcc <inlen=int64#3,0,%g0
# asm 2: subcc <inlen=%i2,0,%g0
subcc %i2,0,%g0

# qhasm: goto copydone if =
be,pt %xcc,._copydone
nop

# qhasm:   copyloop:
._copyloop:

# qhasm:     y00 = *(uint8 *) (in + 0)
# asm 1: ldub [<in=int64#2+0],>y00=int64#21
# asm 2: ldub [<in=%i1+0],>y00=%l4
ldub [%i1+0],%l4

# qhasm:     in += 1
# asm 1: add <in=int64#2,1,>in=int64#2
# asm 2: add <in=%i1,1,>in=%i1
add %i1,1,%i1

# qhasm:     *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int64#21,[<z=int64#20+0]
# asm 2: stb <y00=%l4,[<z=%l3+0]
stb %l4,[%l3+0]

# qhasm:     z += 1
# asm 1: add <z=int64#20,1,>z=int64#20
# asm 2: add <z=%l3,1,>z=%l3
add %l3,1,%l3

# qhasm:                  unsigned>? inlen -= 1
# asm 1: subcc <inlen=int64#3,1,>inlen=int64#3
# asm 2: subcc <inlen=%i2,1,>inlen=%i2
subcc %i2,1,%i2

# qhasm: goto copyloop if unsigned>
bgu,pt %xcc,._copyloop
nop

# qhasm: copydone:
._copydone:

# qhasm:   y00 = 128
# asm 1: add %g0,128,>y00=int64#2
# asm 2: add %g0,128,>y00=%i1
add %g0,128,%i1

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int64#2,[<z=int64#20+0]
# asm 2: stb <y00=%i1,[<z=%l3+0]
stb %i1,[%l3+0]

# qhasm:   in = &tmp
# asm 1: add %fp,1999->tmp=stack256#1,>in=int64#2
# asm 2: add %fp,1999->tmp=0,>in=%i1
add %fp,1999-0,%i1

# qhasm:   finalization = 1
# asm 1: add %g0,1,>finalization=int64#20
# asm 2: add %g0,1,>finalization=%l3
add %g0,1,%l3

# qhasm:   inlen = 32
# asm 1: add %g0,32,>inlen=int64#3
# asm 2: add %g0,32,>inlen=%i2
add %g0,32,%i2

# qhasm:   goto mainloop
b ._mainloop
nop

# qhasm: finalization1:
._finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: ldx [%fp+2023-<x1f_stack=stack64#16],>x1f=int64#20
# asm 2: ldx [%fp+2023-<x1f_stack=152],>x1f=%l3
ldx [%fp+2023-152],%l3

# qhasm:   x1f ^= 1
# asm 1: xor <x1f=int64#20,1,>x1f=int64#20
# asm 2: xor <x1f=%l3,1,>x1f=%l3
xor %l3,1,%l3

# qhasm:   x1f_stack = x1f
# asm 1: stx <x1f=int64#20,[%fp+2023->x1f_stack=stack64#16]
# asm 2: stx <x1f=%l3,[%fp+2023->x1f_stack=152]
stx %l3,[%fp+2023-152]

# qhasm:   r = 160
# asm 1: add %g0,160,>r=int64#21
# asm 2: add %g0,160,>r=%l4
add %g0,160,%l4

# qhasm:   finalization = 2
# asm 1: add %g0,2,>finalization=int64#20
# asm 2: add %g0,2,>finalization=%l3
add %g0,2,%l3

# qhasm:   finalization_stack = finalization
# asm 1: stx <finalization=int64#20,[%fp+2023->finalization_stack=stack64#17]
# asm 2: stx <finalization=%l3,[%fp+2023->finalization_stack=160]
stx %l3,[%fp+2023-160]

# qhasm:   in_stack = in
# asm 1: stx <in=int64#2,[%fp+2023->in_stack=stack64#19]
# asm 2: stx <in=%i1,[%fp+2023->in_stack=176]
stx %i1,[%fp+2023-176]

# qhasm:   inlen_stack = inlen
# asm 1: stx <inlen=int64#3,[%fp+2023->inlen_stack=stack64#18]
# asm 2: stx <inlen=%i2,[%fp+2023->inlen_stack=168]
stx %i2,[%fp+2023-168]

# qhasm:   x01_stack = x01
# asm 1: stx <x01=int64#17,[%fp+2023->x01_stack=stack64#20]
# asm 2: stx <x01=%l0,[%fp+2023->x01_stack=184]
stx %l0,[%fp+2023-184]

# qhasm:   x03_stack = x03
# asm 1: stx <x03=int64#19,[%fp+2023->x03_stack=stack64#21]
# asm 2: stx <x03=%l2,[%fp+2023->x03_stack=192]
stx %l2,[%fp+2023-192]

# qhasm:   x05_stack = x05
# asm 1: stx <x05=int64#12,[%fp+2023->x05_stack=stack64#22]
# asm 2: stx <x05=%o2,[%fp+2023->x05_stack=200]
stx %o2,[%fp+2023-200]

# qhasm:   x07_stack = x07
# asm 1: stx <x07=int64#16,[%fp+2023->x07_stack=stack64#23]
# asm 2: stx <x07=%o7,[%fp+2023->x07_stack=208]
stx %o7,[%fp+2023-208]

# qhasm:   x16 = x16_stack
# asm 1: ldx [%fp+2023-<x16_stack=stack64#7],>x16=int64#2
# asm 2: ldx [%fp+2023-<x16_stack=80],>x16=%i1
ldx [%fp+2023-80],%i1

# qhasm:   x18 = x18_stack
# asm 1: ldx [%fp+2023-<x18_stack=stack64#9],>x18=int64#3
# asm 2: ldx [%fp+2023-<x18_stack=96],>x18=%i2
ldx [%fp+2023-96],%i2

# qhasm:   x1a = x1a_stack
# asm 1: ldx [%fp+2023-<x1a_stack=stack64#11],>x1a=int64#12
# asm 2: ldx [%fp+2023-<x1a_stack=112],>x1a=%o2
ldx [%fp+2023-112],%o2

# qhasm:   x1c = x1c_stack
# asm 1: ldx [%fp+2023-<x1c_stack=stack64#13],>x1c=int64#16
# asm 2: ldx [%fp+2023-<x1c_stack=128],>x1c=%o7
ldx [%fp+2023-128],%o7

# qhasm:   x1e = x1e_stack
# asm 1: ldx [%fp+2023-<x1e_stack=stack64#15],>x1e=int64#17
# asm 2: ldx [%fp+2023-<x1e_stack=144],>x1e=%l0
ldx [%fp+2023-144],%l0

# qhasm: goto morerounds
b ._morerounds
nop

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: ldx [%fp+2023-<out_stack=stack64#1],>out=int64#2
# asm 2: ldx [%fp+2023-<out_stack=32],>out=%i1
ldx [%fp+2023-32],%i1

# qhasm:   *(uint8 *) (out + 0) = x00
# asm 1: stb <x00=int64#6,[<out=int64#2+0]
# asm 2: stb <x00=%i5,[<out=%i1+0]
stb %i5,[%i1+0]

# qhasm:   (uint32) x00 >>= 8
# asm 1: srl <x00=int64#6,8,>x00=int64#3
# asm 2: srl <x00=%i5,8,>x00=%i2
srl %i5,8,%i2

# qhasm:   *(uint8 *) (out + 4) = x01
# asm 1: stb <x01=int64#17,[<out=int64#2+4]
# asm 2: stb <x01=%l0,[<out=%i1+4]
stb %l0,[%i1+4]

# qhasm:   (uint32) x01 >>= 8
# asm 1: srl <x01=int64#17,8,>x01=int64#6
# asm 2: srl <x01=%l0,8,>x01=%i5
srl %l0,8,%i5

# qhasm:   *(uint8 *) (out + 8) = x02
# asm 1: stb <x02=int64#18,[<out=int64#2+8]
# asm 2: stb <x02=%l1,[<out=%i1+8]
stb %l1,[%i1+8]

# qhasm:   (uint32) x02 >>= 8
# asm 1: srl <x02=int64#18,8,>x02=int64#11
# asm 2: srl <x02=%l1,8,>x02=%o1
srl %l1,8,%o1

# qhasm:   *(uint8 *) (out + 12) = x03
# asm 1: stb <x03=int64#19,[<out=int64#2+12]
# asm 2: stb <x03=%l2,[<out=%i1+12]
stb %l2,[%i1+12]

# qhasm:   (uint32) x03 >>= 8
# asm 1: srl <x03=int64#19,8,>x03=int64#13
# asm 2: srl <x03=%l2,8,>x03=%o3
srl %l2,8,%o3

# qhasm:   *(uint8 *) (out + 16) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+16]
# asm 2: stb <x04=%o0,[<out=%i1+16]
stb %o0,[%i1+16]

# qhasm:   (uint32) x04 >>= 8
# asm 1: srl <x04=int64#10,8,>x04=int64#10
# asm 2: srl <x04=%o0,8,>x04=%o0
srl %o0,8,%o0

# qhasm:   *(uint8 *) (out + 20) = x05
# asm 1: stb <x05=int64#12,[<out=int64#2+20]
# asm 2: stb <x05=%o2,[<out=%i1+20]
stb %o2,[%i1+20]

# qhasm:   (uint32) x05 >>= 8
# asm 1: srl <x05=int64#12,8,>x05=int64#12
# asm 2: srl <x05=%o2,8,>x05=%o2
srl %o2,8,%o2

# qhasm:   *(uint8 *) (out + 24) = x06
# asm 1: stb <x06=int64#14,[<out=int64#2+24]
# asm 2: stb <x06=%o4,[<out=%i1+24]
stb %o4,[%i1+24]

# qhasm:   (uint32) x06 >>= 8
# asm 1: srl <x06=int64#14,8,>x06=int64#14
# asm 2: srl <x06=%o4,8,>x06=%o4
srl %o4,8,%o4

# qhasm:   *(uint8 *) (out + 28) = x07
# asm 1: stb <x07=int64#16,[<out=int64#2+28]
# asm 2: stb <x07=%o7,[<out=%i1+28]
stb %o7,[%i1+28]

# qhasm:   (uint32) x07 >>= 8
# asm 1: srl <x07=int64#16,8,>x07=int64#15
# asm 2: srl <x07=%o7,8,>x07=%o5
srl %o7,8,%o5

# qhasm:   *(uint8 *) (out + 1) = x00
# asm 1: stb <x00=int64#3,[<out=int64#2+1]
# asm 2: stb <x00=%i2,[<out=%i1+1]
stb %i2,[%i1+1]

# qhasm:   (uint32) x00 >>= 8
# asm 1: srl <x00=int64#3,8,>x00=int64#3
# asm 2: srl <x00=%i2,8,>x00=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 5) = x01
# asm 1: stb <x01=int64#6,[<out=int64#2+5]
# asm 2: stb <x01=%i5,[<out=%i1+5]
stb %i5,[%i1+5]

# qhasm:   (uint32) x01 >>= 8
# asm 1: srl <x01=int64#6,8,>x01=int64#6
# asm 2: srl <x01=%i5,8,>x01=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 9) = x02
# asm 1: stb <x02=int64#11,[<out=int64#2+9]
# asm 2: stb <x02=%o1,[<out=%i1+9]
stb %o1,[%i1+9]

# qhasm:   (uint32) x02 >>= 8
# asm 1: srl <x02=int64#11,8,>x02=int64#11
# asm 2: srl <x02=%o1,8,>x02=%o1
srl %o1,8,%o1

# qhasm:   *(uint8 *) (out + 13) = x03
# asm 1: stb <x03=int64#13,[<out=int64#2+13]
# asm 2: stb <x03=%o3,[<out=%i1+13]
stb %o3,[%i1+13]

# qhasm:   (uint32) x03 >>= 8
# asm 1: srl <x03=int64#13,8,>x03=int64#13
# asm 2: srl <x03=%o3,8,>x03=%o3
srl %o3,8,%o3

# qhasm:   *(uint8 *) (out + 17) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+17]
# asm 2: stb <x04=%o0,[<out=%i1+17]
stb %o0,[%i1+17]

# qhasm:   (uint32) x04 >>= 8
# asm 1: srl <x04=int64#10,8,>x04=int64#10
# asm 2: srl <x04=%o0,8,>x04=%o0
srl %o0,8,%o0

# qhasm:   *(uint8 *) (out + 21) = x05
# asm 1: stb <x05=int64#12,[<out=int64#2+21]
# asm 2: stb <x05=%o2,[<out=%i1+21]
stb %o2,[%i1+21]

# qhasm:   (uint32) x05 >>= 8
# asm 1: srl <x05=int64#12,8,>x05=int64#12
# asm 2: srl <x05=%o2,8,>x05=%o2
srl %o2,8,%o2

# qhasm:   *(uint8 *) (out + 25) = x06
# asm 1: stb <x06=int64#14,[<out=int64#2+25]
# asm 2: stb <x06=%o4,[<out=%i1+25]
stb %o4,[%i1+25]

# qhasm:   (uint32) x06 >>= 8
# asm 1: srl <x06=int64#14,8,>x06=int64#14
# asm 2: srl <x06=%o4,8,>x06=%o4
srl %o4,8,%o4

# qhasm:   *(uint8 *) (out + 29) = x07
# asm 1: stb <x07=int64#15,[<out=int64#2+29]
# asm 2: stb <x07=%o5,[<out=%i1+29]
stb %o5,[%i1+29]

# qhasm:   (uint32) x07 >>= 8
# asm 1: srl <x07=int64#15,8,>x07=int64#15
# asm 2: srl <x07=%o5,8,>x07=%o5
srl %o5,8,%o5

# qhasm:   *(uint8 *) (out + 2) = x00
# asm 1: stb <x00=int64#3,[<out=int64#2+2]
# asm 2: stb <x00=%i2,[<out=%i1+2]
stb %i2,[%i1+2]

# qhasm:   (uint32) x00 >>= 8
# asm 1: srl <x00=int64#3,8,>x00=int64#3
# asm 2: srl <x00=%i2,8,>x00=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 6) = x01
# asm 1: stb <x01=int64#6,[<out=int64#2+6]
# asm 2: stb <x01=%i5,[<out=%i1+6]
stb %i5,[%i1+6]

# qhasm:   (uint32) x01 >>= 8
# asm 1: srl <x01=int64#6,8,>x01=int64#6
# asm 2: srl <x01=%i5,8,>x01=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 10) = x02
# asm 1: stb <x02=int64#11,[<out=int64#2+10]
# asm 2: stb <x02=%o1,[<out=%i1+10]
stb %o1,[%i1+10]

# qhasm:   (uint32) x02 >>= 8
# asm 1: srl <x02=int64#11,8,>x02=int64#11
# asm 2: srl <x02=%o1,8,>x02=%o1
srl %o1,8,%o1

# qhasm:   *(uint8 *) (out + 14) = x03
# asm 1: stb <x03=int64#13,[<out=int64#2+14]
# asm 2: stb <x03=%o3,[<out=%i1+14]
stb %o3,[%i1+14]

# qhasm:   (uint32) x03 >>= 8
# asm 1: srl <x03=int64#13,8,>x03=int64#13
# asm 2: srl <x03=%o3,8,>x03=%o3
srl %o3,8,%o3

# qhasm:   *(uint8 *) (out + 18) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+18]
# asm 2: stb <x04=%o0,[<out=%i1+18]
stb %o0,[%i1+18]

# qhasm:   (uint32) x04 >>= 8
# asm 1: srl <x04=int64#10,8,>x04=int64#10
# asm 2: srl <x04=%o0,8,>x04=%o0
srl %o0,8,%o0

# qhasm:   *(uint8 *) (out + 22) = x05
# asm 1: stb <x05=int64#12,[<out=int64#2+22]
# asm 2: stb <x05=%o2,[<out=%i1+22]
stb %o2,[%i1+22]

# qhasm:   (uint32) x05 >>= 8
# asm 1: srl <x05=int64#12,8,>x05=int64#12
# asm 2: srl <x05=%o2,8,>x05=%o2
srl %o2,8,%o2

# qhasm:   *(uint8 *) (out + 26) = x06
# asm 1: stb <x06=int64#14,[<out=int64#2+26]
# asm 2: stb <x06=%o4,[<out=%i1+26]
stb %o4,[%i1+26]

# qhasm:   (uint32) x06 >>= 8
# asm 1: srl <x06=int64#14,8,>x06=int64#14
# asm 2: srl <x06=%o4,8,>x06=%o4
srl %o4,8,%o4

# qhasm:   *(uint8 *) (out + 30) = x07
# asm 1: stb <x07=int64#15,[<out=int64#2+30]
# asm 2: stb <x07=%o5,[<out=%i1+30]
stb %o5,[%i1+30]

# qhasm:   (uint32) x07 >>= 8
# asm 1: srl <x07=int64#15,8,>x07=int64#15
# asm 2: srl <x07=%o5,8,>x07=%o5
srl %o5,8,%o5

# qhasm:   *(uint8 *) (out + 3) = x00
# asm 1: stb <x00=int64#3,[<out=int64#2+3]
# asm 2: stb <x00=%i2,[<out=%i1+3]
stb %i2,[%i1+3]

# qhasm:   *(uint8 *) (out + 7) = x01
# asm 1: stb <x01=int64#6,[<out=int64#2+7]
# asm 2: stb <x01=%i5,[<out=%i1+7]
stb %i5,[%i1+7]

# qhasm:   *(uint8 *) (out + 11) = x02
# asm 1: stb <x02=int64#11,[<out=int64#2+11]
# asm 2: stb <x02=%o1,[<out=%i1+11]
stb %o1,[%i1+11]

# qhasm:   *(uint8 *) (out + 15) = x03
# asm 1: stb <x03=int64#13,[<out=int64#2+15]
# asm 2: stb <x03=%o3,[<out=%i1+15]
stb %o3,[%i1+15]

# qhasm:   *(uint8 *) (out + 19) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+19]
# asm 2: stb <x04=%o0,[<out=%i1+19]
stb %o0,[%i1+19]

# qhasm:   *(uint8 *) (out + 23) = x05
# asm 1: stb <x05=int64#12,[<out=int64#2+23]
# asm 2: stb <x05=%o2,[<out=%i1+23]
stb %o2,[%i1+23]

# qhasm:   *(uint8 *) (out + 27) = x06
# asm 1: stb <x06=int64#14,[<out=int64#2+27]
# asm 2: stb <x06=%o4,[<out=%i1+27]
stb %o4,[%i1+27]

# qhasm:   *(uint8 *) (out + 31) = x07
# asm 1: stb <x07=int64#15,[<out=int64#2+31]
# asm 2: stb <x07=%o5,[<out=%i1+31]
stb %o5,[%i1+31]

# qhasm:   x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#2],>x0b=int64#3
# asm 2: ldx [%fp+2023-<x0b_stack=40],>x0b=%i2
ldx [%fp+2023-40],%i2

# qhasm:   x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#3],>x0f=int64#6
# asm 2: ldx [%fp+2023-<x0f_stack=48],>x0f=%i5
ldx [%fp+2023-48],%i5

# qhasm:   *(uint8 *) (out + 32) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+32]
# asm 2: stb <x08=%i0,[<out=%i1+32]
stb %i0,[%i1+32]

# qhasm:   (uint32) x08 >>= 8
# asm 1: srl <x08=int64#1,8,>x08=int64#1
# asm 2: srl <x08=%i0,8,>x08=%i0
srl %i0,8,%i0

# qhasm:   *(uint8 *) (out + 36) = x09
# asm 1: stb <x09=int64#4,[<out=int64#2+36]
# asm 2: stb <x09=%i3,[<out=%i1+36]
stb %i3,[%i1+36]

# qhasm:   (uint32) x09 >>= 8
# asm 1: srl <x09=int64#4,8,>x09=int64#4
# asm 2: srl <x09=%i3,8,>x09=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 40) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+40]
# asm 2: stb <x0a=%i4,[<out=%i1+40]
stb %i4,[%i1+40]

# qhasm:   (uint32) x0a >>= 8
# asm 1: srl <x0a=int64#5,8,>x0a=int64#5
# asm 2: srl <x0a=%i4,8,>x0a=%i4
srl %i4,8,%i4

# qhasm:   *(uint8 *) (out + 44) = x0b
# asm 1: stb <x0b=int64#3,[<out=int64#2+44]
# asm 2: stb <x0b=%i2,[<out=%i1+44]
stb %i2,[%i1+44]

# qhasm:   (uint32) x0b >>= 8
# asm 1: srl <x0b=int64#3,8,>x0b=int64#3
# asm 2: srl <x0b=%i2,8,>x0b=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 48) = x0c
# asm 1: stb <x0c=int64#7,[<out=int64#2+48]
# asm 2: stb <x0c=%g1,[<out=%i1+48]
stb %g1,[%i1+48]

# qhasm:   (uint32) x0c >>= 8
# asm 1: srl <x0c=int64#7,8,>x0c=int64#7
# asm 2: srl <x0c=%g1,8,>x0c=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 52) = x0d
# asm 1: stb <x0d=int64#8,[<out=int64#2+52]
# asm 2: stb <x0d=%g4,[<out=%i1+52]
stb %g4,[%i1+52]

# qhasm:   (uint32) x0d >>= 8
# asm 1: srl <x0d=int64#8,8,>x0d=int64#8
# asm 2: srl <x0d=%g4,8,>x0d=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 56) = x0e
# asm 1: stb <x0e=int64#9,[<out=int64#2+56]
# asm 2: stb <x0e=%g5,[<out=%i1+56]
stb %g5,[%i1+56]

# qhasm:   (uint32) x0e >>= 8
# asm 1: srl <x0e=int64#9,8,>x0e=int64#9
# asm 2: srl <x0e=%g5,8,>x0e=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 60) = x0f
# asm 1: stb <x0f=int64#6,[<out=int64#2+60]
# asm 2: stb <x0f=%i5,[<out=%i1+60]
stb %i5,[%i1+60]

# qhasm:   (uint32) x0f >>= 8
# asm 1: srl <x0f=int64#6,8,>x0f=int64#6
# asm 2: srl <x0f=%i5,8,>x0f=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 33) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+33]
# asm 2: stb <x08=%i0,[<out=%i1+33]
stb %i0,[%i1+33]

# qhasm:   (uint32) x08 >>= 8
# asm 1: srl <x08=int64#1,8,>x08=int64#1
# asm 2: srl <x08=%i0,8,>x08=%i0
srl %i0,8,%i0

# qhasm:   *(uint8 *) (out + 37) = x09
# asm 1: stb <x09=int64#4,[<out=int64#2+37]
# asm 2: stb <x09=%i3,[<out=%i1+37]
stb %i3,[%i1+37]

# qhasm:   (uint32) x09 >>= 8
# asm 1: srl <x09=int64#4,8,>x09=int64#4
# asm 2: srl <x09=%i3,8,>x09=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 41) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+41]
# asm 2: stb <x0a=%i4,[<out=%i1+41]
stb %i4,[%i1+41]

# qhasm:   (uint32) x0a >>= 8
# asm 1: srl <x0a=int64#5,8,>x0a=int64#5
# asm 2: srl <x0a=%i4,8,>x0a=%i4
srl %i4,8,%i4

# qhasm:   *(uint8 *) (out + 45) = x0b
# asm 1: stb <x0b=int64#3,[<out=int64#2+45]
# asm 2: stb <x0b=%i2,[<out=%i1+45]
stb %i2,[%i1+45]

# qhasm:   (uint32) x0b >>= 8
# asm 1: srl <x0b=int64#3,8,>x0b=int64#3
# asm 2: srl <x0b=%i2,8,>x0b=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 49) = x0c
# asm 1: stb <x0c=int64#7,[<out=int64#2+49]
# asm 2: stb <x0c=%g1,[<out=%i1+49]
stb %g1,[%i1+49]

# qhasm:   (uint32) x0c >>= 8
# asm 1: srl <x0c=int64#7,8,>x0c=int64#7
# asm 2: srl <x0c=%g1,8,>x0c=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 53) = x0d
# asm 1: stb <x0d=int64#8,[<out=int64#2+53]
# asm 2: stb <x0d=%g4,[<out=%i1+53]
stb %g4,[%i1+53]

# qhasm:   (uint32) x0d >>= 8
# asm 1: srl <x0d=int64#8,8,>x0d=int64#8
# asm 2: srl <x0d=%g4,8,>x0d=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 57) = x0e
# asm 1: stb <x0e=int64#9,[<out=int64#2+57]
# asm 2: stb <x0e=%g5,[<out=%i1+57]
stb %g5,[%i1+57]

# qhasm:   (uint32) x0e >>= 8
# asm 1: srl <x0e=int64#9,8,>x0e=int64#9
# asm 2: srl <x0e=%g5,8,>x0e=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 61) = x0f
# asm 1: stb <x0f=int64#6,[<out=int64#2+61]
# asm 2: stb <x0f=%i5,[<out=%i1+61]
stb %i5,[%i1+61]

# qhasm:   (uint32) x0f >>= 8
# asm 1: srl <x0f=int64#6,8,>x0f=int64#6
# asm 2: srl <x0f=%i5,8,>x0f=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 34) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+34]
# asm 2: stb <x08=%i0,[<out=%i1+34]
stb %i0,[%i1+34]

# qhasm:   (uint32) x08 >>= 8
# asm 1: srl <x08=int64#1,8,>x08=int64#1
# asm 2: srl <x08=%i0,8,>x08=%i0
srl %i0,8,%i0

# qhasm:   *(uint8 *) (out + 38) = x09
# asm 1: stb <x09=int64#4,[<out=int64#2+38]
# asm 2: stb <x09=%i3,[<out=%i1+38]
stb %i3,[%i1+38]

# qhasm:   (uint32) x09 >>= 8
# asm 1: srl <x09=int64#4,8,>x09=int64#4
# asm 2: srl <x09=%i3,8,>x09=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 42) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+42]
# asm 2: stb <x0a=%i4,[<out=%i1+42]
stb %i4,[%i1+42]

# qhasm:   (uint32) x0a >>= 8
# asm 1: srl <x0a=int64#5,8,>x0a=int64#5
# asm 2: srl <x0a=%i4,8,>x0a=%i4
srl %i4,8,%i4

# qhasm:   *(uint8 *) (out + 46) = x0b
# asm 1: stb <x0b=int64#3,[<out=int64#2+46]
# asm 2: stb <x0b=%i2,[<out=%i1+46]
stb %i2,[%i1+46]

# qhasm:   (uint32) x0b >>= 8
# asm 1: srl <x0b=int64#3,8,>x0b=int64#3
# asm 2: srl <x0b=%i2,8,>x0b=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 50) = x0c
# asm 1: stb <x0c=int64#7,[<out=int64#2+50]
# asm 2: stb <x0c=%g1,[<out=%i1+50]
stb %g1,[%i1+50]

# qhasm:   (uint32) x0c >>= 8
# asm 1: srl <x0c=int64#7,8,>x0c=int64#7
# asm 2: srl <x0c=%g1,8,>x0c=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 54) = x0d
# asm 1: stb <x0d=int64#8,[<out=int64#2+54]
# asm 2: stb <x0d=%g4,[<out=%i1+54]
stb %g4,[%i1+54]

# qhasm:   (uint32) x0d >>= 8
# asm 1: srl <x0d=int64#8,8,>x0d=int64#8
# asm 2: srl <x0d=%g4,8,>x0d=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 58) = x0e
# asm 1: stb <x0e=int64#9,[<out=int64#2+58]
# asm 2: stb <x0e=%g5,[<out=%i1+58]
stb %g5,[%i1+58]

# qhasm:   (uint32) x0e >>= 8
# asm 1: srl <x0e=int64#9,8,>x0e=int64#9
# asm 2: srl <x0e=%g5,8,>x0e=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 62) = x0f
# asm 1: stb <x0f=int64#6,[<out=int64#2+62]
# asm 2: stb <x0f=%i5,[<out=%i1+62]
stb %i5,[%i1+62]

# qhasm:   (uint32) x0f >>= 8
# asm 1: srl <x0f=int64#6,8,>x0f=int64#6
# asm 2: srl <x0f=%i5,8,>x0f=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 35) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+35]
# asm 2: stb <x08=%i0,[<out=%i1+35]
stb %i0,[%i1+35]

# qhasm:   *(uint8 *) (out + 39) = x09
# asm 1: stb <x09=int64#4,[<out=int64#2+39]
# asm 2: stb <x09=%i3,[<out=%i1+39]
stb %i3,[%i1+39]

# qhasm:   *(uint8 *) (out + 43) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+43]
# asm 2: stb <x0a=%i4,[<out=%i1+43]
stb %i4,[%i1+43]

# qhasm:   *(uint8 *) (out + 47) = x0b
# asm 1: stb <x0b=int64#3,[<out=int64#2+47]
# asm 2: stb <x0b=%i2,[<out=%i1+47]
stb %i2,[%i1+47]

# qhasm:   *(uint8 *) (out + 51) = x0c
# asm 1: stb <x0c=int64#7,[<out=int64#2+51]
# asm 2: stb <x0c=%g1,[<out=%i1+51]
stb %g1,[%i1+51]

# qhasm:   *(uint8 *) (out + 55) = x0d
# asm 1: stb <x0d=int64#8,[<out=int64#2+55]
# asm 2: stb <x0d=%g4,[<out=%i1+55]
stb %g4,[%i1+55]

# qhasm:   *(uint8 *) (out + 59) = x0e
# asm 1: stb <x0e=int64#9,[<out=int64#2+59]
# asm 2: stb <x0e=%g5,[<out=%i1+59]
stb %g5,[%i1+59]

# qhasm:   *(uint8 *) (out + 63) = x0f
# asm 1: stb <x0f=int64#6,[<out=int64#2+63]
# asm 2: stb <x0f=%i5,[<out=%i1+63]
stb %i5,[%i1+63]

# qhasm:   result = 0
# asm 1: add %g0,0,>result=int64#1
# asm 2: add %g0,0,>result=%i0
add %g0,0,%i0

# qhasm: leave
ret
restore
