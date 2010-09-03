
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

# qhasm: stack64 x02_stack

# qhasm: stack64 x03_stack

# qhasm: stack64 x05_stack

# qhasm: stack64 x06_stack

# qhasm: stack64 x07_stack

# qhasm: stack64 x09_stack

# qhasm: stack64 x0a_stack

# qhasm: stack64 x0b_stack

# qhasm: stack64 x0c_stack

# qhasm: stack64 x0d_stack

# qhasm: stack64 x0e_stack

# qhasm: stack64 x0f_stack

# qhasm: stack64 x13_stack

# qhasm: stack64 x14_stack

# qhasm: stack64 x15_stack

# qhasm: stack64 x16_stack

# qhasm: stack64 x17_stack

# qhasm: stack64 x19_stack

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
save %sp,-432,%sp

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

# qhasm:   x09_stack = x09
# asm 1: stx <x09=int64#4,[%fp+2023->x09_stack=stack64#2]
# asm 2: stx <x09=%i3,[%fp+2023->x09_stack=40]
stx %i3,[%fp+2023-40]

# qhasm:           x14 = 0x6a536159 & 0xfffffc00
# asm 1: sethi %lm(0x6a536159),>x14=int64#4
# asm 2: sethi %lm(0x6a536159),>x14=%i3
sethi %lm(0x6a536159),%i3

# qhasm:           x15 = 0x2ff5781c & 0xfffffc00
# asm 1: sethi %lm(0x2ff5781c),>x15=int64#15
# asm 2: sethi %lm(0x2ff5781c),>x15=%o5
sethi %lm(0x2ff5781c),%o5

# qhasm:   x0b_stack = x0b
# asm 1: stx <x0b=int64#6,[%fp+2023->x0b_stack=stack64#3]
# asm 2: stx <x0b=%i5,[%fp+2023->x0b_stack=48]
stx %i5,[%fp+2023-48]

# qhasm:           x16 = 0x91fa7934 & 0xfffffc00
# asm 1: sethi %lm(0x91fa7934),>x16=int64#6
# asm 2: sethi %lm(0x91fa7934),>x16=%i5
sethi %lm(0x91fa7934),%i5

# qhasm:           x17 = 0x0dbadea9 & 0xfffffc00
# asm 1: sethi %lm(0x0dbadea9),>x17=int64#16
# asm 2: sethi %lm(0x0dbadea9),>x17=%o7
sethi %lm(0x0dbadea9),%o7

# qhasm:   x0c_stack = x0c
# asm 1: stx <x0c=int64#7,[%fp+2023->x0c_stack=stack64#4]
# asm 2: stx <x0c=%g1,[%fp+2023->x0c_stack=56]
stx %g1,[%fp+2023-56]

# qhasm:           x10 |= 0xfcd398d9 & 0x3ff
# asm 1: or <x10=int64#11,%lo(0xfcd398d9),>x10=int64#7
# asm 2: or <x10=%o1,%lo(0xfcd398d9),>x10=%g1
or %o1,%lo(0xfcd398d9),%g1

# qhasm:           x11 |= 0x148fe485 & 0x3ff
# asm 1: or <x11=int64#12,%lo(0x148fe485),>x11=int64#11
# asm 2: or <x11=%o2,%lo(0x148fe485),>x11=%o1
or %o2,%lo(0x148fe485),%o1

# qhasm:   x0d_stack = x0d
# asm 1: stx <x0d=int64#8,[%fp+2023->x0d_stack=stack64#5]
# asm 2: stx <x0d=%g4,[%fp+2023->x0d_stack=64]
stx %g4,[%fp+2023-64]

# qhasm:           x12 |= 0x1b017bef & 0x3ff
# asm 1: or <x12=int64#13,%lo(0x1b017bef),>x12=int64#8
# asm 2: or <x12=%o3,%lo(0x1b017bef),>x12=%g4
or %o3,%lo(0x1b017bef),%g4

# qhasm:           x13 |= 0xb6444532 & 0x3ff
# asm 1: or <x13=int64#14,%lo(0xb6444532),>x13=int64#12
# asm 2: or <x13=%o4,%lo(0xb6444532),>x13=%o2
or %o4,%lo(0xb6444532),%o2

# qhasm:   x0e_stack = x0e
# asm 1: stx <x0e=int64#9,[%fp+2023->x0e_stack=stack64#6]
# asm 2: stx <x0e=%g5,[%fp+2023->x0e_stack=72]
stx %g5,[%fp+2023-72]

# qhasm:           x14 |= 0x6a536159 & 0x3ff
# asm 1: or <x14=int64#4,%lo(0x6a536159),>x14=int64#4
# asm 2: or <x14=%i3,%lo(0x6a536159),>x14=%i3
or %i3,%lo(0x6a536159),%i3

# qhasm:           x15 |= 0x2ff5781c & 0x3ff
# asm 1: or <x15=int64#15,%lo(0x2ff5781c),>x15=int64#9
# asm 2: or <x15=%o5,%lo(0x2ff5781c),>x15=%g5
or %o5,%lo(0x2ff5781c),%g5

# qhasm:   x0f_stack = x0f
# asm 1: stx <x0f=int64#10,[%fp+2023->x0f_stack=stack64#7]
# asm 2: stx <x0f=%o0,[%fp+2023->x0f_stack=80]
stx %o0,[%fp+2023-80]

# qhasm:           x16 |= 0x91fa7934 & 0x3ff
# asm 1: or <x16=int64#6,%lo(0x91fa7934),>x16=int64#6
# asm 2: or <x16=%i5,%lo(0x91fa7934),>x16=%i5
or %i5,%lo(0x91fa7934),%i5

# qhasm:           x17 |= 0x0dbadea9 & 0x3ff
# asm 1: or <x17=int64#16,%lo(0x0dbadea9),>x17=int64#10
# asm 2: or <x17=%o7,%lo(0x0dbadea9),>x17=%o0
or %o7,%lo(0x0dbadea9),%o0

# qhasm:   x18 = 0xd65c8a2b & 0xfffffc00
# asm 1: sethi %lm(0xd65c8a2b),>x18=int64#13
# asm 2: sethi %lm(0xd65c8a2b),>x18=%o3
sethi %lm(0xd65c8a2b),%o3

# qhasm:   x19 = 0xa5a70e75 & 0xfffffc00
# asm 1: sethi %lm(0xa5a70e75),>x19=int64#14
# asm 2: sethi %lm(0xa5a70e75),>x19=%o4
sethi %lm(0xa5a70e75),%o4

# qhasm:   x1a = 0xb1c62456 & 0xfffffc00
# asm 1: sethi %lm(0xb1c62456),>x1a=int64#15
# asm 2: sethi %lm(0xb1c62456),>x1a=%o5
sethi %lm(0xb1c62456),%o5

# qhasm:   x1b = 0xbc796576 & 0xfffffc00
# asm 1: sethi %lm(0xbc796576),>x1b=int64#16
# asm 2: sethi %lm(0xbc796576),>x1b=%o7
sethi %lm(0xbc796576),%o7

# qhasm:   x1c = 0x1921c8f7 & 0xfffffc00
# asm 1: sethi %lm(0x1921c8f7),>x1c=int64#17
# asm 2: sethi %lm(0x1921c8f7),>x1c=%l0
sethi %lm(0x1921c8f7),%l0

# qhasm:   x1d = 0xe7989af1 & 0xfffffc00
# asm 1: sethi %lm(0xe7989af1),>x1d=int64#18
# asm 2: sethi %lm(0xe7989af1),>x1d=%l1
sethi %lm(0xe7989af1),%l1

# qhasm:           x13_stack = x13
# asm 1: stx <x13=int64#12,[%fp+2023->x13_stack=stack64#8]
# asm 2: stx <x13=%o2,[%fp+2023->x13_stack=88]
stx %o2,[%fp+2023-88]

# qhasm:   x1e = 0x7795d246 & 0xfffffc00
# asm 1: sethi %lm(0x7795d246),>x1e=int64#12
# asm 2: sethi %lm(0x7795d246),>x1e=%o2
sethi %lm(0x7795d246),%o2

# qhasm:   x1f = 0xd43e3b44 & 0xfffffc00
# asm 1: sethi %lm(0xd43e3b44),>x1f=int64#19
# asm 2: sethi %lm(0xd43e3b44),>x1f=%l2
sethi %lm(0xd43e3b44),%l2

# qhasm:           x14_stack = x14
# asm 1: stx <x14=int64#4,[%fp+2023->x14_stack=stack64#9]
# asm 2: stx <x14=%i3,[%fp+2023->x14_stack=96]
stx %i3,[%fp+2023-96]

# qhasm:   x18 |= 0xd65c8a2b & 0x3ff
# asm 1: or <x18=int64#13,%lo(0xd65c8a2b),>x18=int64#4
# asm 2: or <x18=%o3,%lo(0xd65c8a2b),>x18=%i3
or %o3,%lo(0xd65c8a2b),%i3

# qhasm:   x19 |= 0xa5a70e75 & 0x3ff
# asm 1: or <x19=int64#14,%lo(0xa5a70e75),>x19=int64#13
# asm 2: or <x19=%o4,%lo(0xa5a70e75),>x19=%o3
or %o4,%lo(0xa5a70e75),%o3

# qhasm:           x15_stack = x15
# asm 1: stx <x15=int64#9,[%fp+2023->x15_stack=stack64#10]
# asm 2: stx <x15=%g5,[%fp+2023->x15_stack=104]
stx %g5,[%fp+2023-104]

# qhasm:   x1a |= 0xb1c62456 & 0x3ff
# asm 1: or <x1a=int64#15,%lo(0xb1c62456),>x1a=int64#9
# asm 2: or <x1a=%o5,%lo(0xb1c62456),>x1a=%g5
or %o5,%lo(0xb1c62456),%g5

# qhasm:   x1b |= 0xbc796576 & 0x3ff
# asm 1: or <x1b=int64#16,%lo(0xbc796576),>x1b=int64#14
# asm 2: or <x1b=%o7,%lo(0xbc796576),>x1b=%o4
or %o7,%lo(0xbc796576),%o4

# qhasm:           x16_stack = x16
# asm 1: stx <x16=int64#6,[%fp+2023->x16_stack=stack64#11]
# asm 2: stx <x16=%i5,[%fp+2023->x16_stack=112]
stx %i5,[%fp+2023-112]

# qhasm:   x1c |= 0x1921c8f7 & 0x3ff
# asm 1: or <x1c=int64#17,%lo(0x1921c8f7),>x1c=int64#6
# asm 2: or <x1c=%l0,%lo(0x1921c8f7),>x1c=%i5
or %l0,%lo(0x1921c8f7),%i5

# qhasm:   x1d |= 0xe7989af1 & 0x3ff
# asm 1: or <x1d=int64#18,%lo(0xe7989af1),>x1d=int64#15
# asm 2: or <x1d=%l1,%lo(0xe7989af1),>x1d=%o5
or %l1,%lo(0xe7989af1),%o5

# qhasm:           x17_stack = x17
# asm 1: stx <x17=int64#10,[%fp+2023->x17_stack=stack64#12]
# asm 2: stx <x17=%o0,[%fp+2023->x17_stack=120]
stx %o0,[%fp+2023-120]

# qhasm:   x1e |= 0x7795d246 & 0x3ff
# asm 1: or <x1e=int64#12,%lo(0x7795d246),>x1e=int64#10
# asm 2: or <x1e=%o2,%lo(0x7795d246),>x1e=%o0
or %o2,%lo(0x7795d246),%o0

# qhasm:   x1f |= 0xd43e3b44 & 0x3ff
# asm 1: or <x1f=int64#19,%lo(0xd43e3b44),>x1f=int64#12
# asm 2: or <x1f=%l2,%lo(0xd43e3b44),>x1f=%o2
or %l2,%lo(0xd43e3b44),%o2

# qhasm:           x00 = 0x2aea2a61 & 0xfffffc00
# asm 1: sethi %lm(0x2aea2a61),>x00=int64#16
# asm 2: sethi %lm(0x2aea2a61),>x00=%o7
sethi %lm(0x2aea2a61),%o7

# qhasm:           x01 = 0x50f494d4 & 0xfffffc00
# asm 1: sethi %lm(0x50f494d4),>x01=int64#17
# asm 2: sethi %lm(0x50f494d4),>x01=%l0
sethi %lm(0x50f494d4),%l0

# qhasm:   x19_stack = x19
# asm 1: stx <x19=int64#13,[%fp+2023->x19_stack=stack64#13]
# asm 2: stx <x19=%o3,[%fp+2023->x19_stack=128]
stx %o3,[%fp+2023-128]

# qhasm:           x02 = 0x2d538b8b & 0xfffffc00
# asm 1: sethi %lm(0x2d538b8b),>x02=int64#13
# asm 2: sethi %lm(0x2d538b8b),>x02=%o3
sethi %lm(0x2d538b8b),%o3

# qhasm:           x03 = 0x4167d83e & 0xfffffc00
# asm 1: sethi %lm(0x4167d83e),>x03=int64#18
# asm 2: sethi %lm(0x4167d83e),>x03=%l1
sethi %lm(0x4167d83e),%l1

# qhasm:           x04 = 0x3fee2313 & 0xfffffc00
# asm 1: sethi %lm(0x3fee2313),>x04=int64#19
# asm 2: sethi %lm(0x3fee2313),>x04=%l2
sethi %lm(0x3fee2313),%l2

# qhasm:           x05 = 0xc701cf8c & 0xfffffc00
# asm 1: sethi %lm(0xc701cf8c),>x05=int64#20
# asm 2: sethi %lm(0xc701cf8c),>x05=%l3
sethi %lm(0xc701cf8c),%l3

# qhasm:   x1b_stack = x1b
# asm 1: stx <x1b=int64#14,[%fp+2023->x1b_stack=stack64#14]
# asm 2: stx <x1b=%o4,[%fp+2023->x1b_stack=136]
stx %o4,[%fp+2023-136]

# qhasm:           x06 = 0xcc39968e & 0xfffffc00
# asm 1: sethi %lm(0xcc39968e),>x06=int64#14
# asm 2: sethi %lm(0xcc39968e),>x06=%o4
sethi %lm(0xcc39968e),%o4

# qhasm:           x07 = 0x50ac5695 & 0xfffffc00
# asm 1: sethi %lm(0x50ac5695),>x07=int64#21
# asm 2: sethi %lm(0x50ac5695),>x07=%l4
sethi %lm(0x50ac5695),%l4

# qhasm:   x1c_stack = x1c
# asm 1: stx <x1c=int64#6,[%fp+2023->x1c_stack=stack64#15]
# asm 2: stx <x1c=%i5,[%fp+2023->x1c_stack=144]
stx %i5,[%fp+2023-144]

# qhasm:           x00 |= 0x2aea2a61 & 0x3ff
# asm 1: or <x00=int64#16,%lo(0x2aea2a61),>x00=int64#6
# asm 2: or <x00=%o7,%lo(0x2aea2a61),>x00=%i5
or %o7,%lo(0x2aea2a61),%i5

# qhasm:           x01 |= 0x50f494d4 & 0x3ff
# asm 1: or <x01=int64#17,%lo(0x50f494d4),>x01=int64#16
# asm 2: or <x01=%l0,%lo(0x50f494d4),>x01=%o7
or %l0,%lo(0x50f494d4),%o7

# qhasm:   x1d_stack = x1d
# asm 1: stx <x1d=int64#15,[%fp+2023->x1d_stack=stack64#16]
# asm 2: stx <x1d=%o5,[%fp+2023->x1d_stack=152]
stx %o5,[%fp+2023-152]

# qhasm:           x02 |= 0x2d538b8b & 0x3ff
# asm 1: or <x02=int64#13,%lo(0x2d538b8b),>x02=int64#13
# asm 2: or <x02=%o3,%lo(0x2d538b8b),>x02=%o3
or %o3,%lo(0x2d538b8b),%o3

# qhasm:           x03 |= 0x4167d83e & 0x3ff
# asm 1: or <x03=int64#18,%lo(0x4167d83e),>x03=int64#15
# asm 2: or <x03=%l1,%lo(0x4167d83e),>x03=%o5
or %l1,%lo(0x4167d83e),%o5

# qhasm:   x1e_stack = x1e
# asm 1: stx <x1e=int64#10,[%fp+2023->x1e_stack=stack64#17]
# asm 2: stx <x1e=%o0,[%fp+2023->x1e_stack=160]
stx %o0,[%fp+2023-160]

# qhasm:           x04 |= 0x3fee2313 & 0x3ff
# asm 1: or <x04=int64#19,%lo(0x3fee2313),>x04=int64#10
# asm 2: or <x04=%l2,%lo(0x3fee2313),>x04=%o0
or %l2,%lo(0x3fee2313),%o0

# qhasm:           x05 |= 0xc701cf8c & 0x3ff
# asm 1: or <x05=int64#20,%lo(0xc701cf8c),>x05=int64#17
# asm 2: or <x05=%l3,%lo(0xc701cf8c),>x05=%l0
or %l3,%lo(0xc701cf8c),%l0

# qhasm:   x1f_stack = x1f
# asm 1: stx <x1f=int64#12,[%fp+2023->x1f_stack=stack64#18]
# asm 2: stx <x1f=%o2,[%fp+2023->x1f_stack=168]
stx %o2,[%fp+2023-168]

# qhasm:           x06 |= 0xcc39968e & 0x3ff
# asm 1: or <x06=int64#14,%lo(0xcc39968e),>x06=int64#12
# asm 2: or <x06=%o4,%lo(0xcc39968e),>x06=%o2
or %o4,%lo(0xcc39968e),%o2

# qhasm:           x07 |= 0x50ac5695 & 0x3ff
# asm 1: or <x07=int64#21,%lo(0x50ac5695),>x07=int64#14
# asm 2: or <x07=%l4,%lo(0x50ac5695),>x07=%o4
or %l4,%lo(0x50ac5695),%o4

# qhasm:   finalization = 0
# asm 1: add %g0,0,>finalization=int64#18
# asm 2: add %g0,0,>finalization=%l1
add %g0,0,%l1

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
# asm 1: add %g0,16,>r=int64#19
# asm 2: add %g0,16,>r=%l2
add %g0,16,%l2

# qhasm:   finalization_stack = finalization
# asm 1: stx <finalization=int64#18,[%fp+2023->finalization_stack=stack64#19]
# asm 2: stx <finalization=%l1,[%fp+2023->finalization_stack=176]
stx %l1,[%fp+2023-176]

# qhasm:   inlen_stack = inlen
# asm 1: stx <inlen=int64#3,[%fp+2023->inlen_stack=stack64#20]
# asm 2: stx <inlen=%i2,[%fp+2023->inlen_stack=184]
stx %i2,[%fp+2023-184]

# qhasm:   in0 = *(uint8 *) (in + 0)
# asm 1: ldub [<in=int64#2+0],>in0=int64#3
# asm 2: ldub [<in=%i1+0],>in0=%i2
ldub [%i1+0],%i2

# qhasm:     in1 = *(uint8 *) (in + 1)
# asm 1: ldub [<in=int64#2+1],>in1=int64#18
# asm 2: ldub [<in=%i1+1],>in1=%l1
ldub [%i1+1],%l1

# qhasm:       in2 = *(uint8 *) (in + 2)
# asm 1: ldub [<in=int64#2+2],>in2=int64#20
# asm 2: ldub [<in=%i1+2],>in2=%l3
ldub [%i1+2],%l3

# qhasm:         in3 = *(uint8 *) (in + 3)
# asm 1: ldub [<in=int64#2+3],>in3=int64#21
# asm 2: ldub [<in=%i1+3],>in3=%l4
ldub [%i1+3],%l4

# qhasm:   x00 ^= in0
# asm 1: xor <x00=int64#6,<in0=int64#3,>x00=int64#3
# asm 2: xor <x00=%i5,<in0=%i2,>x00=%i2
xor %i5,%i2,%i2

# qhasm:           in4 = *(uint8 *) (in + 4)
# asm 1: ldub [<in=int64#2+4],>in4=int64#22
# asm 2: ldub [<in=%i1+4],>in4=%l5
ldub [%i1+4],%l5

# qhasm:     in1 <<= 8
# asm 1: sllx <in1=int64#18,8,>in1=int64#6
# asm 2: sllx <in1=%l1,8,>in1=%i5
sllx %l1,8,%i5

# qhasm:     x00 ^= in1
# asm 1: xor <x00=int64#3,<in1=int64#6,>x00=int64#3
# asm 2: xor <x00=%i2,<in1=%i5,>x00=%i2
xor %i2,%i5,%i2

# qhasm:             in5 = *(uint8 *) (in + 5)
# asm 1: ldub [<in=int64#2+5],>in5=int64#18
# asm 2: ldub [<in=%i1+5],>in5=%l1
ldub [%i1+5],%l1

# qhasm:       in2 <<= 16
# asm 1: sllx <in2=int64#20,16,>in2=int64#6
# asm 2: sllx <in2=%l3,16,>in2=%i5
sllx %l3,16,%i5

# qhasm:       x00 ^= in2
# asm 1: xor <x00=int64#3,<in2=int64#6,>x00=int64#3
# asm 2: xor <x00=%i2,<in2=%i5,>x00=%i2
xor %i2,%i5,%i2

# qhasm:               in6 = *(uint8 *) (in + 6)
# asm 1: ldub [<in=int64#2+6],>in6=int64#20
# asm 2: ldub [<in=%i1+6],>in6=%l3
ldub [%i1+6],%l3

# qhasm:         in3 <<= 24
# asm 1: sllx <in3=int64#21,24,>in3=int64#6
# asm 2: sllx <in3=%l4,24,>in3=%i5
sllx %l4,24,%i5

# qhasm:         x00 ^= in3
# asm 1: xor <x00=int64#3,<in3=int64#6,>x00=int64#6
# asm 2: xor <x00=%i2,<in3=%i5,>x00=%i5
xor %i2,%i5,%i5

# qhasm:                 in7 = *(uint8 *) (in + 7)
# asm 1: ldub [<in=int64#2+7],>in7=int64#3
# asm 2: ldub [<in=%i1+7],>in7=%i2
ldub [%i1+7],%i2

# qhasm:           x01 ^= in4
# asm 1: xor <x01=int64#16,<in4=int64#22,>x01=int64#16
# asm 2: xor <x01=%o7,<in4=%l5,>x01=%o7
xor %o7,%l5,%o7

# qhasm:                   in8 = *(uint8 *) (in + 8)
# asm 1: ldub [<in=int64#2+8],>in8=int64#21
# asm 2: ldub [<in=%i1+8],>in8=%l4
ldub [%i1+8],%l4

# qhasm:             in5 <<= 8
# asm 1: sllx <in5=int64#18,8,>in5=int64#18
# asm 2: sllx <in5=%l1,8,>in5=%l1
sllx %l1,8,%l1

# qhasm:             x01 ^= in5
# asm 1: xor <x01=int64#16,<in5=int64#18,>x01=int64#16
# asm 2: xor <x01=%o7,<in5=%l1,>x01=%o7
xor %o7,%l1,%o7

# qhasm:                     in9 = *(uint8 *) (in + 9)
# asm 1: ldub [<in=int64#2+9],>in9=int64#18
# asm 2: ldub [<in=%i1+9],>in9=%l1
ldub [%i1+9],%l1

# qhasm:               in6 <<= 16
# asm 1: sllx <in6=int64#20,16,>in6=int64#20
# asm 2: sllx <in6=%l3,16,>in6=%l3
sllx %l3,16,%l3

# qhasm:               x01 ^= in6
# asm 1: xor <x01=int64#16,<in6=int64#20,>x01=int64#16
# asm 2: xor <x01=%o7,<in6=%l3,>x01=%o7
xor %o7,%l3,%o7

# qhasm:                       in10 = *(uint8 *) (in + 10)
# asm 1: ldub [<in=int64#2+10],>in10=int64#20
# asm 2: ldub [<in=%i1+10],>in10=%l3
ldub [%i1+10],%l3

# qhasm:                 in7 <<= 24
# asm 1: sllx <in7=int64#3,24,>in7=int64#3
# asm 2: sllx <in7=%i2,24,>in7=%i2
sllx %i2,24,%i2

# qhasm:                 x01 ^= in7
# asm 1: xor <x01=int64#16,<in7=int64#3,>x01=int64#16
# asm 2: xor <x01=%o7,<in7=%i2,>x01=%o7
xor %o7,%i2,%o7

# qhasm:                         in11 = *(uint8 *) (in + 11)
# asm 1: ldub [<in=int64#2+11],>in11=int64#3
# asm 2: ldub [<in=%i1+11],>in11=%i2
ldub [%i1+11],%i2

# qhasm:                   x02 ^= in8
# asm 1: xor <x02=int64#13,<in8=int64#21,>x02=int64#13
# asm 2: xor <x02=%o3,<in8=%l4,>x02=%o3
xor %o3,%l4,%o3

# qhasm:                           in12 = *(uint8 *) (in + 12)
# asm 1: ldub [<in=int64#2+12],>in12=int64#21
# asm 2: ldub [<in=%i1+12],>in12=%l4
ldub [%i1+12],%l4

# qhasm:                     in9 <<= 8
# asm 1: sllx <in9=int64#18,8,>in9=int64#18
# asm 2: sllx <in9=%l1,8,>in9=%l1
sllx %l1,8,%l1

# qhasm:                     x02 ^= in9
# asm 1: xor <x02=int64#13,<in9=int64#18,>x02=int64#13
# asm 2: xor <x02=%o3,<in9=%l1,>x02=%o3
xor %o3,%l1,%o3

# qhasm:                             in13 = *(uint8 *) (in + 13)
# asm 1: ldub [<in=int64#2+13],>in13=int64#18
# asm 2: ldub [<in=%i1+13],>in13=%l1
ldub [%i1+13],%l1

# qhasm:                       in10 <<= 16
# asm 1: sllx <in10=int64#20,16,>in10=int64#20
# asm 2: sllx <in10=%l3,16,>in10=%l3
sllx %l3,16,%l3

# qhasm:                       x02 ^= in10
# asm 1: xor <x02=int64#13,<in10=int64#20,>x02=int64#13
# asm 2: xor <x02=%o3,<in10=%l3,>x02=%o3
xor %o3,%l3,%o3

# qhasm:                               in14 = *(uint8 *) (in + 14)
# asm 1: ldub [<in=int64#2+14],>in14=int64#20
# asm 2: ldub [<in=%i1+14],>in14=%l3
ldub [%i1+14],%l3

# qhasm:                         in11 <<= 24
# asm 1: sllx <in11=int64#3,24,>in11=int64#3
# asm 2: sllx <in11=%i2,24,>in11=%i2
sllx %i2,24,%i2

# qhasm:                         x02 ^= in11
# asm 1: xor <x02=int64#13,<in11=int64#3,>x02=int64#13
# asm 2: xor <x02=%o3,<in11=%i2,>x02=%o3
xor %o3,%i2,%o3

# qhasm:                                 in15 = *(uint8 *) (in + 15)
# asm 1: ldub [<in=int64#2+15],>in15=int64#3
# asm 2: ldub [<in=%i1+15],>in15=%i2
ldub [%i1+15],%i2

# qhasm:                           x03 ^= in12
# asm 1: xor <x03=int64#15,<in12=int64#21,>x03=int64#15
# asm 2: xor <x03=%o5,<in12=%l4,>x03=%o5
xor %o5,%l4,%o5

# qhasm:                                   in16 = *(uint8 *) (in + 16)
# asm 1: ldub [<in=int64#2+16],>in16=int64#21
# asm 2: ldub [<in=%i1+16],>in16=%l4
ldub [%i1+16],%l4

# qhasm:                             in13 <<= 8
# asm 1: sllx <in13=int64#18,8,>in13=int64#18
# asm 2: sllx <in13=%l1,8,>in13=%l1
sllx %l1,8,%l1

# qhasm:                             x03 ^= in13
# asm 1: xor <x03=int64#15,<in13=int64#18,>x03=int64#15
# asm 2: xor <x03=%o5,<in13=%l1,>x03=%o5
xor %o5,%l1,%o5

# qhasm:                                     in17 = *(uint8 *) (in + 17)
# asm 1: ldub [<in=int64#2+17],>in17=int64#18
# asm 2: ldub [<in=%i1+17],>in17=%l1
ldub [%i1+17],%l1

# qhasm:                               in14 <<= 16
# asm 1: sllx <in14=int64#20,16,>in14=int64#20
# asm 2: sllx <in14=%l3,16,>in14=%l3
sllx %l3,16,%l3

# qhasm:                               x03 ^= in14
# asm 1: xor <x03=int64#15,<in14=int64#20,>x03=int64#15
# asm 2: xor <x03=%o5,<in14=%l3,>x03=%o5
xor %o5,%l3,%o5

# qhasm:                                       in18 = *(uint8 *) (in + 18)
# asm 1: ldub [<in=int64#2+18],>in18=int64#20
# asm 2: ldub [<in=%i1+18],>in18=%l3
ldub [%i1+18],%l3

# qhasm:                                 in15 <<= 24
# asm 1: sllx <in15=int64#3,24,>in15=int64#3
# asm 2: sllx <in15=%i2,24,>in15=%i2
sllx %i2,24,%i2

# qhasm:                                 x03 ^= in15
# asm 1: xor <x03=int64#15,<in15=int64#3,>x03=int64#3
# asm 2: xor <x03=%o5,<in15=%i2,>x03=%i2
xor %o5,%i2,%i2

# qhasm:   x03_stack = x03
# asm 1: stx <x03=int64#3,[%fp+2023->x03_stack=stack64#21]
# asm 2: stx <x03=%i2,[%fp+2023->x03_stack=192]
stx %i2,[%fp+2023-192]

# qhasm:                                         in19 = *(uint8 *) (in + 19)
# asm 1: ldub [<in=int64#2+19],>in19=int64#3
# asm 2: ldub [<in=%i1+19],>in19=%i2
ldub [%i1+19],%i2

# qhasm:                                   x04 ^= in16
# asm 1: xor <x04=int64#10,<in16=int64#21,>x04=int64#10
# asm 2: xor <x04=%o0,<in16=%l4,>x04=%o0
xor %o0,%l4,%o0

# qhasm:                                           in20 = *(uint8 *) (in + 20)
# asm 1: ldub [<in=int64#2+20],>in20=int64#15
# asm 2: ldub [<in=%i1+20],>in20=%o5
ldub [%i1+20],%o5

# qhasm:                                     in17 <<= 8
# asm 1: sllx <in17=int64#18,8,>in17=int64#18
# asm 2: sllx <in17=%l1,8,>in17=%l1
sllx %l1,8,%l1

# qhasm:                                     x04 ^= in17
# asm 1: xor <x04=int64#10,<in17=int64#18,>x04=int64#10
# asm 2: xor <x04=%o0,<in17=%l1,>x04=%o0
xor %o0,%l1,%o0

# qhasm:                                             in21 = *(uint8 *) (in + 21)
# asm 1: ldub [<in=int64#2+21],>in21=int64#18
# asm 2: ldub [<in=%i1+21],>in21=%l1
ldub [%i1+21],%l1

# qhasm:                                       in18 <<= 16
# asm 1: sllx <in18=int64#20,16,>in18=int64#20
# asm 2: sllx <in18=%l3,16,>in18=%l3
sllx %l3,16,%l3

# qhasm:                                       x04 ^= in18
# asm 1: xor <x04=int64#10,<in18=int64#20,>x04=int64#10
# asm 2: xor <x04=%o0,<in18=%l3,>x04=%o0
xor %o0,%l3,%o0

# qhasm:                                               in22 = *(uint8 *) (in + 22)
# asm 1: ldub [<in=int64#2+22],>in22=int64#20
# asm 2: ldub [<in=%i1+22],>in22=%l3
ldub [%i1+22],%l3

# qhasm:                                         in19 <<= 24
# asm 1: sllx <in19=int64#3,24,>in19=int64#3
# asm 2: sllx <in19=%i2,24,>in19=%i2
sllx %i2,24,%i2

# qhasm:                                         x04 ^= in19
# asm 1: xor <x04=int64#10,<in19=int64#3,>x04=int64#10
# asm 2: xor <x04=%o0,<in19=%i2,>x04=%o0
xor %o0,%i2,%o0

# qhasm:                                                 in23 = *(uint8 *) (in + 23)
# asm 1: ldub [<in=int64#2+23],>in23=int64#3
# asm 2: ldub [<in=%i1+23],>in23=%i2
ldub [%i1+23],%i2

# qhasm:                                           x05 ^= in20
# asm 1: xor <x05=int64#17,<in20=int64#15,>x05=int64#15
# asm 2: xor <x05=%l0,<in20=%o5,>x05=%o5
xor %l0,%o5,%o5

# qhasm:                                                   in24 = *(uint8 *) (in + 24)
# asm 1: ldub [<in=int64#2+24],>in24=int64#17
# asm 2: ldub [<in=%i1+24],>in24=%l0
ldub [%i1+24],%l0

# qhasm:                                             in21 <<= 8
# asm 1: sllx <in21=int64#18,8,>in21=int64#18
# asm 2: sllx <in21=%l1,8,>in21=%l1
sllx %l1,8,%l1

# qhasm:                                             x05 ^= in21
# asm 1: xor <x05=int64#15,<in21=int64#18,>x05=int64#15
# asm 2: xor <x05=%o5,<in21=%l1,>x05=%o5
xor %o5,%l1,%o5

# qhasm:                                                     in25 = *(uint8 *) (in + 25)
# asm 1: ldub [<in=int64#2+25],>in25=int64#18
# asm 2: ldub [<in=%i1+25],>in25=%l1
ldub [%i1+25],%l1

# qhasm:                                               in22 <<= 16
# asm 1: sllx <in22=int64#20,16,>in22=int64#20
# asm 2: sllx <in22=%l3,16,>in22=%l3
sllx %l3,16,%l3

# qhasm:                                               x05 ^= in22
# asm 1: xor <x05=int64#15,<in22=int64#20,>x05=int64#15
# asm 2: xor <x05=%o5,<in22=%l3,>x05=%o5
xor %o5,%l3,%o5

# qhasm:                                                       in26 = *(uint8 *) (in + 26)
# asm 1: ldub [<in=int64#2+26],>in26=int64#20
# asm 2: ldub [<in=%i1+26],>in26=%l3
ldub [%i1+26],%l3

# qhasm:                                                 in23 <<= 24
# asm 1: sllx <in23=int64#3,24,>in23=int64#3
# asm 2: sllx <in23=%i2,24,>in23=%i2
sllx %i2,24,%i2

# qhasm:                                                 x05 ^= in23
# asm 1: xor <x05=int64#15,<in23=int64#3,>x05=int64#3
# asm 2: xor <x05=%o5,<in23=%i2,>x05=%i2
xor %o5,%i2,%i2

# qhasm:   x05_stack = x05
# asm 1: stx <x05=int64#3,[%fp+2023->x05_stack=stack64#22]
# asm 2: stx <x05=%i2,[%fp+2023->x05_stack=200]
stx %i2,[%fp+2023-200]

# qhasm:                                                         in27 = *(uint8 *) (in + 27)
# asm 1: ldub [<in=int64#2+27],>in27=int64#3
# asm 2: ldub [<in=%i1+27],>in27=%i2
ldub [%i1+27],%i2

# qhasm:                                                   x06 ^= in24
# asm 1: xor <x06=int64#12,<in24=int64#17,>x06=int64#12
# asm 2: xor <x06=%o2,<in24=%l0,>x06=%o2
xor %o2,%l0,%o2

# qhasm:                                                           in28 = *(uint8 *) (in + 28)
# asm 1: ldub [<in=int64#2+28],>in28=int64#15
# asm 2: ldub [<in=%i1+28],>in28=%o5
ldub [%i1+28],%o5

# qhasm:                                                     in25 <<= 8
# asm 1: sllx <in25=int64#18,8,>in25=int64#17
# asm 2: sllx <in25=%l1,8,>in25=%l0
sllx %l1,8,%l0

# qhasm:                                                     x06 ^= in25
# asm 1: xor <x06=int64#12,<in25=int64#17,>x06=int64#12
# asm 2: xor <x06=%o2,<in25=%l0,>x06=%o2
xor %o2,%l0,%o2

# qhasm:                                                             in29 = *(uint8 *) (in + 29)
# asm 1: ldub [<in=int64#2+29],>in29=int64#17
# asm 2: ldub [<in=%i1+29],>in29=%l0
ldub [%i1+29],%l0

# qhasm:                                                       in26 <<= 16
# asm 1: sllx <in26=int64#20,16,>in26=int64#18
# asm 2: sllx <in26=%l3,16,>in26=%l1
sllx %l3,16,%l1

# qhasm:                                                       x06 ^= in26
# asm 1: xor <x06=int64#12,<in26=int64#18,>x06=int64#12
# asm 2: xor <x06=%o2,<in26=%l1,>x06=%o2
xor %o2,%l1,%o2

# qhasm:                                                               in30 = *(uint8 *) (in + 30)
# asm 1: ldub [<in=int64#2+30],>in30=int64#18
# asm 2: ldub [<in=%i1+30],>in30=%l1
ldub [%i1+30],%l1

# qhasm:                                                         in27 <<= 24
# asm 1: sllx <in27=int64#3,24,>in27=int64#3
# asm 2: sllx <in27=%i2,24,>in27=%i2
sllx %i2,24,%i2

# qhasm:                                                         x06 ^= in27
# asm 1: xor <x06=int64#12,<in27=int64#3,>x06=int64#3
# asm 2: xor <x06=%o2,<in27=%i2,>x06=%i2
xor %o2,%i2,%i2

# qhasm:   x06_stack = x06
# asm 1: stx <x06=int64#3,[%fp+2023->x06_stack=stack64#23]
# asm 2: stx <x06=%i2,[%fp+2023->x06_stack=208]
stx %i2,[%fp+2023-208]

# qhasm:                                                                 in31 = *(uint8 *) (in + 31)
# asm 1: ldub [<in=int64#2+31],>in31=int64#3
# asm 2: ldub [<in=%i1+31],>in31=%i2
ldub [%i1+31],%i2

# qhasm:                                                           x07 ^= in28
# asm 1: xor <x07=int64#14,<in28=int64#15,>x07=int64#12
# asm 2: xor <x07=%o4,<in28=%o5,>x07=%o2
xor %o4,%o5,%o2

# qhasm:                                                             in29 <<= 8
# asm 1: sllx <in29=int64#17,8,>in29=int64#14
# asm 2: sllx <in29=%l0,8,>in29=%o4
sllx %l0,8,%o4

# qhasm:                                                             x07 ^= in29
# asm 1: xor <x07=int64#12,<in29=int64#14,>x07=int64#12
# asm 2: xor <x07=%o2,<in29=%o4,>x07=%o2
xor %o2,%o4,%o2

# qhasm:                                                               in30 <<= 16
# asm 1: sllx <in30=int64#18,16,>in30=int64#14
# asm 2: sllx <in30=%l1,16,>in30=%o4
sllx %l1,16,%o4

# qhasm:                                                               x07 ^= in30
# asm 1: xor <x07=int64#12,<in30=int64#14,>x07=int64#12
# asm 2: xor <x07=%o2,<in30=%o4,>x07=%o2
xor %o2,%o4,%o2

# qhasm:                                                                 in31 <<= 24
# asm 1: sllx <in31=int64#3,24,>in31=int64#3
# asm 2: sllx <in31=%i2,24,>in31=%i2
sllx %i2,24,%i2

# qhasm:                                                                 x07 ^= in31
# asm 1: xor <x07=int64#12,<in31=int64#3,>x07=int64#3
# asm 2: xor <x07=%o2,<in31=%i2,>x07=%i2
xor %o2,%i2,%i2

# qhasm:   x07_stack = x07
# asm 1: stx <x07=int64#3,[%fp+2023->x07_stack=stack64#24]
# asm 2: stx <x07=%i2,[%fp+2023->x07_stack=216]
stx %i2,[%fp+2023-216]

# qhasm:   in += 32
# asm 1: add <in=int64#2,32,>in=int64#2
# asm 2: add <in=%i1,32,>in=%i1
add %i1,32,%i1

# qhasm:   in_stack = in
# asm 1: stx <in=int64#2,[%fp+2023->in_stack=stack64#25]
# asm 2: stx <in=%i1,[%fp+2023->in_stack=224]
stx %i1,[%fp+2023-224]

# qhasm: morerounds:
._morerounds:

# qhasm: r_stack = r
# asm 1: stx <r=int64#19,[%fp+2023->r_stack=stack64#26]
# asm 2: stx <r=%l2,[%fp+2023->r_stack=232]
stx %l2,[%fp+2023-232]

# qhasm:   x10 += x00
# asm 1: add <x10=int64#7,<x00=int64#6,>x10=int64#2
# asm 2: add <x10=%g1,<x00=%i5,>x10=%i1
add %g1,%i5,%i1

# qhasm:   x12 += x02
# asm 1: add <x12=int64#8,<x02=int64#13,>x12=int64#3
# asm 2: add <x12=%g4,<x02=%o3,>x12=%i2
add %g4,%o3,%i2

# qhasm:   x18 += x08
# asm 1: add <x18=int64#4,<x08=int64#1,>x18=int64#4
# asm 2: add <x18=%i3,<x08=%i0,>x18=%i3
add %i3,%i0,%i3

# qhasm:   x1a += x0a
# asm 1: add <x1a=int64#9,<x0a=int64#5,>x1a=int64#7
# asm 2: add <x1a=%g5,<x0a=%i4,>x1a=%g1
add %g5,%i4,%g1

# qhasm:   s00 = x00 << 7
# asm 1: sllx <x00=int64#6,7,>s00=int64#8
# asm 2: sllx <x00=%i5,7,>s00=%g4
sllx %i5,7,%g4

# qhasm:   s02 = x02 << 7
# asm 1: sllx <x02=int64#13,7,>s02=int64#9
# asm 2: sllx <x02=%o3,7,>s02=%g5
sllx %o3,7,%g5

# qhasm:   (uint32) x00 >>= 25
# asm 1: srl <x00=int64#6,25,>x00=int64#6
# asm 2: srl <x00=%i5,25,>x00=%i5
srl %i5,25,%i5

# qhasm:   (uint32) x02 >>= 25
# asm 1: srl <x02=int64#13,25,>x02=int64#12
# asm 2: srl <x02=%o3,25,>x02=%o2
srl %o3,25,%o2

# qhasm:   x00 |= s00
# asm 1: or  <x00=int64#6,<s00=int64#8,>x00=int64#6
# asm 2: or  <x00=%i5,<s00=%g4,>x00=%i5
or  %i5,%g4,%i5

# qhasm:   x02 |= s02
# asm 1: or  <x02=int64#12,<s02=int64#9,>x02=int64#8
# asm 2: or  <x02=%o2,<s02=%g5,>x02=%g4
or  %o2,%g5,%g4

# qhasm:   s08 = x08 << 7
# asm 1: sllx <x08=int64#1,7,>s08=int64#9
# asm 2: sllx <x08=%i0,7,>s08=%g5
sllx %i0,7,%g5

# qhasm:   s0a = x0a << 7
# asm 1: sllx <x0a=int64#5,7,>s0a=int64#12
# asm 2: sllx <x0a=%i4,7,>s0a=%o2
sllx %i4,7,%o2

# qhasm:     x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#23],>x06=int64#13
# asm 2: ldx [%fp+2023-<x06_stack=208],>x06=%o3
ldx [%fp+2023-208],%o3

# qhasm:   (uint32) x08 >>= 25
# asm 1: srl <x08=int64#1,25,>x08=int64#1
# asm 2: srl <x08=%i0,25,>x08=%i0
srl %i0,25,%i0

# qhasm:   (uint32) x0a >>= 25
# asm 1: srl <x0a=int64#5,25,>x0a=int64#5
# asm 2: srl <x0a=%i4,25,>x0a=%i4
srl %i4,25,%i4

# qhasm:     x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#4],>x0c=int64#14
# asm 2: ldx [%fp+2023-<x0c_stack=56],>x0c=%o4
ldx [%fp+2023-56],%o4

# qhasm:   x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#9,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%g5,>x08=%i0
or  %i0,%g5,%i0

# qhasm:   x0a |= s0a
# asm 1: or  <x0a=int64#5,<s0a=int64#12,>x0a=int64#5
# asm 2: or  <x0a=%i4,<s0a=%o2,>x0a=%i4
or  %i4,%o2,%i4

# qhasm:     x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#6],>x0e=int64#9
# asm 2: ldx [%fp+2023-<x0e_stack=72],>x0e=%g5
ldx [%fp+2023-72],%g5

# qhasm:   x00 ^= x18
# asm 1: xor <x00=int64#6,<x18=int64#4,>x00=int64#6
# asm 2: xor <x00=%i5,<x18=%i3,>x00=%i5
xor %i5,%i3,%i5

# qhasm:   x02 ^= x1a
# asm 1: xor <x02=int64#8,<x1a=int64#7,>x02=int64#8
# asm 2: xor <x02=%g4,<x1a=%g1,>x02=%g4
xor %g4,%g1,%g4

# qhasm:     x14 = x14_stack
# asm 1: ldx [%fp+2023-<x14_stack=stack64#9],>x14=int64#12
# asm 2: ldx [%fp+2023-<x14_stack=96],>x14=%o2
ldx [%fp+2023-96],%o2

# qhasm:   x08 ^= x10
# asm 1: xor <x08=int64#1,<x10=int64#2,>x08=int64#1
# asm 2: xor <x08=%i0,<x10=%i1,>x08=%i0
xor %i0,%i1,%i0

# qhasm:   x0a ^= x12
# asm 1: xor <x0a=int64#5,<x12=int64#3,>x0a=int64#5
# asm 2: xor <x0a=%i4,<x12=%i2,>x0a=%i4
xor %i4,%i2,%i4

# qhasm:     x16 = x16_stack
# asm 1: ldx [%fp+2023-<x16_stack=stack64#11],>x16=int64#15
# asm 2: ldx [%fp+2023-<x16_stack=112],>x16=%o5
ldx [%fp+2023-112],%o5

# qhasm:   x1a += x00
# asm 1: add <x1a=int64#7,<x00=int64#6,>x1a=int64#7
# asm 2: add <x1a=%g1,<x00=%i5,>x1a=%g1
add %g1,%i5,%g1

# qhasm:   x18 += x02
# asm 1: add <x18=int64#4,<x02=int64#8,>x18=int64#4
# asm 2: add <x18=%i3,<x02=%g4,>x18=%i3
add %i3,%g4,%i3

# qhasm:     x1c = x1c_stack
# asm 1: ldx [%fp+2023-<x1c_stack=stack64#15],>x1c=int64#17
# asm 2: ldx [%fp+2023-<x1c_stack=144],>x1c=%l0
ldx [%fp+2023-144],%l0

# qhasm:   x12 += x08
# asm 1: add <x12=int64#3,<x08=int64#1,>x12=int64#3
# asm 2: add <x12=%i2,<x08=%i0,>x12=%i2
add %i2,%i0,%i2

# qhasm:   x10 += x0a
# asm 1: add <x10=int64#2,<x0a=int64#5,>x10=int64#2
# asm 2: add <x10=%i1,<x0a=%i4,>x10=%i1
add %i1,%i4,%i1

# qhasm:     x1e = x1e_stack
# asm 1: ldx [%fp+2023-<x1e_stack=stack64#17],>x1e=int64#18
# asm 2: ldx [%fp+2023-<x1e_stack=160],>x1e=%l1
ldx [%fp+2023-160],%l1

# qhasm:     x14 += x04
# asm 1: add <x14=int64#12,<x04=int64#10,>x14=int64#12
# asm 2: add <x14=%o2,<x04=%o0,>x14=%o2
add %o2,%o0,%o2

# qhasm:     x16 += x06
# asm 1: add <x16=int64#15,<x06=int64#13,>x16=int64#15
# asm 2: add <x16=%o5,<x06=%o3,>x16=%o5
add %o5,%o3,%o5

# qhasm:   x02_stack = x02
# asm 1: stx <x02=int64#8,[%fp+2023->x02_stack=stack64#4]
# asm 2: stx <x02=%g4,[%fp+2023->x02_stack=56]
stx %g4,[%fp+2023-56]

# qhasm:     x1c += x0c
# asm 1: add <x1c=int64#17,<x0c=int64#14,>x1c=int64#8
# asm 2: add <x1c=%l0,<x0c=%o4,>x1c=%g4
add %l0,%o4,%g4

# qhasm:     x1e += x0e
# asm 1: add <x1e=int64#18,<x0e=int64#9,>x1e=int64#17
# asm 2: add <x1e=%l1,<x0e=%g5,>x1e=%l0
add %l1,%g5,%l0

# qhasm:   x0a_stack = x0a
# asm 1: stx <x0a=int64#5,[%fp+2023->x0a_stack=stack64#6]
# asm 2: stx <x0a=%i4,[%fp+2023->x0a_stack=72]
stx %i4,[%fp+2023-72]

# qhasm:     s04 = x04 << 7
# asm 1: sllx <x04=int64#10,7,>s04=int64#5
# asm 2: sllx <x04=%o0,7,>s04=%i4
sllx %o0,7,%i4

# qhasm:     s06 = x06 << 7
# asm 1: sllx <x06=int64#13,7,>s06=int64#18
# asm 2: sllx <x06=%o3,7,>s06=%l1
sllx %o3,7,%l1

# qhasm:     (uint32) x04 >>= 25
# asm 1: srl <x04=int64#10,25,>x04=int64#10
# asm 2: srl <x04=%o0,25,>x04=%o0
srl %o0,25,%o0

# qhasm:     (uint32) x06 >>= 25
# asm 1: srl <x06=int64#13,25,>x06=int64#13
# asm 2: srl <x06=%o3,25,>x06=%o3
srl %o3,25,%o3

# qhasm:     x04 |= s04
# asm 1: or  <x04=int64#10,<s04=int64#5,>x04=int64#5
# asm 2: or  <x04=%o0,<s04=%i4,>x04=%i4
or  %o0,%i4,%i4

# qhasm:     x06 |= s06
# asm 1: or  <x06=int64#13,<s06=int64#18,>x06=int64#10
# asm 2: or  <x06=%o3,<s06=%l1,>x06=%o0
or  %o3,%l1,%o0

# qhasm:     s0c = x0c << 7
# asm 1: sllx <x0c=int64#14,7,>s0c=int64#13
# asm 2: sllx <x0c=%o4,7,>s0c=%o3
sllx %o4,7,%o3

# qhasm:     s0e = x0e << 7
# asm 1: sllx <x0e=int64#9,7,>s0e=int64#18
# asm 2: sllx <x0e=%g5,7,>s0e=%l1
sllx %g5,7,%l1

# qhasm:     (uint32) x0c >>= 25
# asm 1: srl <x0c=int64#14,25,>x0c=int64#14
# asm 2: srl <x0c=%o4,25,>x0c=%o4
srl %o4,25,%o4

# qhasm:     (uint32) x0e >>= 25
# asm 1: srl <x0e=int64#9,25,>x0e=int64#9
# asm 2: srl <x0e=%g5,25,>x0e=%g5
srl %g5,25,%g5

# qhasm:   x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#21],>x03=int64#19
# asm 2: ldx [%fp+2023-<x03_stack=192],>x03=%l2
ldx [%fp+2023-192],%l2

# qhasm:     x0c |= s0c
# asm 1: or  <x0c=int64#14,<s0c=int64#13,>x0c=int64#13
# asm 2: or  <x0c=%o4,<s0c=%o3,>x0c=%o3
or  %o4,%o3,%o3

# qhasm:     x0e |= s0e
# asm 1: or  <x0e=int64#9,<s0e=int64#18,>x0e=int64#9
# asm 2: or  <x0e=%g5,<s0e=%l1,>x0e=%g5
or  %g5,%l1,%g5

# qhasm:   x09 = x09_stack
# asm 1: ldx [%fp+2023-<x09_stack=stack64#2],>x09=int64#14
# asm 2: ldx [%fp+2023-<x09_stack=40],>x09=%o4
ldx [%fp+2023-40],%o4

# qhasm:     x04 ^= x1c
# asm 1: xor <x04=int64#5,<x1c=int64#8,>x04=int64#5
# asm 2: xor <x04=%i4,<x1c=%g4,>x04=%i4
xor %i4,%g4,%i4

# qhasm:     x06 ^= x1e
# asm 1: xor <x06=int64#10,<x1e=int64#17,>x06=int64#10
# asm 2: xor <x06=%o0,<x1e=%l0,>x06=%o0
xor %o0,%l0,%o0

# qhasm:   x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#3],>x0b=int64#18
# asm 2: ldx [%fp+2023-<x0b_stack=48],>x0b=%l1
ldx [%fp+2023-48],%l1

# qhasm:     x0c ^= x14
# asm 1: xor <x0c=int64#13,<x14=int64#12,>x0c=int64#13
# asm 2: xor <x0c=%o3,<x14=%o2,>x0c=%o3
xor %o3,%o2,%o3

# qhasm:     x0e ^= x16
# asm 1: xor <x0e=int64#9,<x16=int64#15,>x0e=int64#9
# asm 2: xor <x0e=%g5,<x16=%o5,>x0e=%g5
xor %g5,%o5,%g5

# qhasm:   x13 = x13_stack
# asm 1: ldx [%fp+2023-<x13_stack=stack64#8],>x13=int64#20
# asm 2: ldx [%fp+2023-<x13_stack=88],>x13=%l3
ldx [%fp+2023-88],%l3

# qhasm:     x1e += x04
# asm 1: add <x1e=int64#17,<x04=int64#5,>x1e=int64#17
# asm 2: add <x1e=%l0,<x04=%i4,>x1e=%l0
add %l0,%i4,%l0

# qhasm:     x1c += x06
# asm 1: add <x1c=int64#8,<x06=int64#10,>x1c=int64#8
# asm 2: add <x1c=%g4,<x06=%o0,>x1c=%g4
add %g4,%o0,%g4

# qhasm:   x19 = x19_stack
# asm 1: ldx [%fp+2023-<x19_stack=stack64#13],>x19=int64#21
# asm 2: ldx [%fp+2023-<x19_stack=128],>x19=%l4
ldx [%fp+2023-128],%l4

# qhasm:     x16 += x0c
# asm 1: add <x16=int64#15,<x0c=int64#13,>x16=int64#15
# asm 2: add <x16=%o5,<x0c=%o3,>x16=%o5
add %o5,%o3,%o5

# qhasm:     x14 += x0e
# asm 1: add <x14=int64#12,<x0e=int64#9,>x14=int64#12
# asm 2: add <x14=%o2,<x0e=%g5,>x14=%o2
add %o2,%g5,%o2

# qhasm:   x1b = x1b_stack
# asm 1: ldx [%fp+2023-<x1b_stack=stack64#14],>x1b=int64#22
# asm 2: ldx [%fp+2023-<x1b_stack=136],>x1b=%l5
ldx [%fp+2023-136],%l5

# qhasm:     x06_stack = x06
# asm 1: stx <x06=int64#10,[%fp+2023->x06_stack=stack64#2]
# asm 2: stx <x06=%o0,[%fp+2023->x06_stack=40]
stx %o0,[%fp+2023-40]

# qhasm:     x0c_stack = x0c
# asm 1: stx <x0c=int64#13,[%fp+2023->x0c_stack=stack64#3]
# asm 2: stx <x0c=%o3,[%fp+2023->x0c_stack=48]
stx %o3,[%fp+2023-48]

# qhasm:     x0e_stack = x0e
# asm 1: stx <x0e=int64#9,[%fp+2023->x0e_stack=stack64#8]
# asm 2: stx <x0e=%g5,[%fp+2023->x0e_stack=88]
stx %g5,[%fp+2023-88]

# qhasm:   x11 += x01
# asm 1: add <x11=int64#11,<x01=int64#16,>x11=int64#9
# asm 2: add <x11=%o1,<x01=%o7,>x11=%g5
add %o1,%o7,%g5

# qhasm:   x13 += x03
# asm 1: add <x13=int64#20,<x03=int64#19,>x13=int64#10
# asm 2: add <x13=%l3,<x03=%l2,>x13=%o0
add %l3,%l2,%o0

# qhasm:     x14_stack = x14
# asm 1: stx <x14=int64#12,[%fp+2023->x14_stack=stack64#9]
# asm 2: stx <x14=%o2,[%fp+2023->x14_stack=96]
stx %o2,[%fp+2023-96]

# qhasm:   x19 += x09
# asm 1: add <x19=int64#21,<x09=int64#14,>x19=int64#11
# asm 2: add <x19=%l4,<x09=%o4,>x19=%o1
add %l4,%o4,%o1

# qhasm:   x1b += x0b
# asm 1: add <x1b=int64#22,<x0b=int64#18,>x1b=int64#12
# asm 2: add <x1b=%l5,<x0b=%l1,>x1b=%o2
add %l5,%l1,%o2

# qhasm:     x16_stack = x16
# asm 1: stx <x16=int64#15,[%fp+2023->x16_stack=stack64#11]
# asm 2: stx <x16=%o5,[%fp+2023->x16_stack=112]
stx %o5,[%fp+2023-112]

# qhasm:   s01 = x01 << 7
# asm 1: sllx <x01=int64#16,7,>s01=int64#13
# asm 2: sllx <x01=%o7,7,>s01=%o3
sllx %o7,7,%o3

# qhasm:   s03 = x03 << 7
# asm 1: sllx <x03=int64#19,7,>s03=int64#15
# asm 2: sllx <x03=%l2,7,>s03=%o5
sllx %l2,7,%o5

# qhasm:     x1c_stack = x1c
# asm 1: stx <x1c=int64#8,[%fp+2023->x1c_stack=stack64#13]
# asm 2: stx <x1c=%g4,[%fp+2023->x1c_stack=128]
stx %g4,[%fp+2023-128]

# qhasm:   (uint32) x01 >>= 25
# asm 1: srl <x01=int64#16,25,>x01=int64#8
# asm 2: srl <x01=%o7,25,>x01=%g4
srl %o7,25,%g4

# qhasm:   (uint32) x03 >>= 25
# asm 1: srl <x03=int64#19,25,>x03=int64#16
# asm 2: srl <x03=%l2,25,>x03=%o7
srl %l2,25,%o7

# qhasm:     x1e_stack = x1e
# asm 1: stx <x1e=int64#17,[%fp+2023->x1e_stack=stack64#14]
# asm 2: stx <x1e=%l0,[%fp+2023->x1e_stack=136]
stx %l0,[%fp+2023-136]

# qhasm:   x01 |= s01
# asm 1: or  <x01=int64#8,<s01=int64#13,>x01=int64#8
# asm 2: or  <x01=%g4,<s01=%o3,>x01=%g4
or  %g4,%o3,%g4

# qhasm:   x03 |= s03
# asm 1: or  <x03=int64#16,<s03=int64#15,>x03=int64#13
# asm 2: or  <x03=%o7,<s03=%o5,>x03=%o3
or  %o7,%o5,%o3

# qhasm:     x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#22],>x05=int64#15
# asm 2: ldx [%fp+2023-<x05_stack=200],>x05=%o5
ldx [%fp+2023-200],%o5

# qhasm:   s09 = x09 << 7
# asm 1: sllx <x09=int64#14,7,>s09=int64#16
# asm 2: sllx <x09=%o4,7,>s09=%o7
sllx %o4,7,%o7

# qhasm:   s0b = x0b << 7
# asm 1: sllx <x0b=int64#18,7,>s0b=int64#17
# asm 2: sllx <x0b=%l1,7,>s0b=%l0
sllx %l1,7,%l0

# qhasm:     x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#24],>x07=int64#19
# asm 2: ldx [%fp+2023-<x07_stack=216],>x07=%l2
ldx [%fp+2023-216],%l2

# qhasm:   (uint32) x09 >>= 25
# asm 1: srl <x09=int64#14,25,>x09=int64#14
# asm 2: srl <x09=%o4,25,>x09=%o4
srl %o4,25,%o4

# qhasm:   (uint32) x0b >>= 25
# asm 1: srl <x0b=int64#18,25,>x0b=int64#18
# asm 2: srl <x0b=%l1,25,>x0b=%l1
srl %l1,25,%l1

# qhasm:     x0d = x0d_stack
# asm 1: ldx [%fp+2023-<x0d_stack=stack64#5],>x0d=int64#20
# asm 2: ldx [%fp+2023-<x0d_stack=64],>x0d=%l3
ldx [%fp+2023-64],%l3

# qhasm:   x09 |= s09
# asm 1: or  <x09=int64#14,<s09=int64#16,>x09=int64#14
# asm 2: or  <x09=%o4,<s09=%o7,>x09=%o4
or  %o4,%o7,%o4

# qhasm:   x0b |= s0b
# asm 1: or  <x0b=int64#18,<s0b=int64#17,>x0b=int64#16
# asm 2: or  <x0b=%l1,<s0b=%l0,>x0b=%o7
or  %l1,%l0,%o7

# qhasm:     x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#7],>x0f=int64#17
# asm 2: ldx [%fp+2023-<x0f_stack=80],>x0f=%l0
ldx [%fp+2023-80],%l0

# qhasm:   x01 ^= x19
# asm 1: xor <x01=int64#8,<x19=int64#11,>x01=int64#8
# asm 2: xor <x01=%g4,<x19=%o1,>x01=%g4
xor %g4,%o1,%g4

# qhasm:   x03 ^= x1b
# asm 1: xor <x03=int64#13,<x1b=int64#12,>x03=int64#13
# asm 2: xor <x03=%o3,<x1b=%o2,>x03=%o3
xor %o3,%o2,%o3

# qhasm:     x15 = x15_stack
# asm 1: ldx [%fp+2023-<x15_stack=stack64#10],>x15=int64#18
# asm 2: ldx [%fp+2023-<x15_stack=104],>x15=%l1
ldx [%fp+2023-104],%l1

# qhasm:   x09 ^= x11
# asm 1: xor <x09=int64#14,<x11=int64#9,>x09=int64#14
# asm 2: xor <x09=%o4,<x11=%g5,>x09=%o4
xor %o4,%g5,%o4

# qhasm:   x0b ^= x13
# asm 1: xor <x0b=int64#16,<x13=int64#10,>x0b=int64#16
# asm 2: xor <x0b=%o7,<x13=%o0,>x0b=%o7
xor %o7,%o0,%o7

# qhasm:     x17 = x17_stack
# asm 1: ldx [%fp+2023-<x17_stack=stack64#12],>x17=int64#21
# asm 2: ldx [%fp+2023-<x17_stack=120],>x17=%l4
ldx [%fp+2023-120],%l4

# qhasm:   x1b += x01
# asm 1: add <x1b=int64#12,<x01=int64#8,>x1b=int64#12
# asm 2: add <x1b=%o2,<x01=%g4,>x1b=%o2
add %o2,%g4,%o2

# qhasm:   x19 += x03
# asm 1: add <x19=int64#11,<x03=int64#13,>x19=int64#11
# asm 2: add <x19=%o1,<x03=%o3,>x19=%o1
add %o1,%o3,%o1

# qhasm:     x1d = x1d_stack
# asm 1: ldx [%fp+2023-<x1d_stack=stack64#16],>x1d=int64#22
# asm 2: ldx [%fp+2023-<x1d_stack=152],>x1d=%l5
ldx [%fp+2023-152],%l5

# qhasm:   x13 += x09
# asm 1: add <x13=int64#10,<x09=int64#14,>x13=int64#10
# asm 2: add <x13=%o0,<x09=%o4,>x13=%o0
add %o0,%o4,%o0

# qhasm:   x11 += x0b
# asm 1: add <x11=int64#9,<x0b=int64#16,>x11=int64#9
# asm 2: add <x11=%g5,<x0b=%o7,>x11=%g5
add %g5,%o7,%g5

# qhasm:     x1f = x1f_stack
# asm 1: ldx [%fp+2023-<x1f_stack=stack64#18],>x1f=int64#23
# asm 2: ldx [%fp+2023-<x1f_stack=168],>x1f=%l6
ldx [%fp+2023-168],%l6

# qhasm:     x15 += x05
# asm 1: add <x15=int64#18,<x05=int64#15,>x15=int64#18
# asm 2: add <x15=%l1,<x05=%o5,>x15=%l1
add %l1,%o5,%l1

# qhasm:     x17 += x07
# asm 1: add <x17=int64#21,<x07=int64#19,>x17=int64#21
# asm 2: add <x17=%l4,<x07=%l2,>x17=%l4
add %l4,%l2,%l4

# qhasm:   x03_stack = x03
# asm 1: stx <x03=int64#13,[%fp+2023->x03_stack=stack64#5]
# asm 2: stx <x03=%o3,[%fp+2023->x03_stack=64]
stx %o3,[%fp+2023-64]

# qhasm:     x1d += x0d
# asm 1: add <x1d=int64#22,<x0d=int64#20,>x1d=int64#13
# asm 2: add <x1d=%l5,<x0d=%l3,>x1d=%o3
add %l5,%l3,%o3

# qhasm:     x1f += x0f
# asm 1: add <x1f=int64#23,<x0f=int64#17,>x1f=int64#22
# asm 2: add <x1f=%l6,<x0f=%l0,>x1f=%l5
add %l6,%l0,%l5

# qhasm:   x09_stack = x09
# asm 1: stx <x09=int64#14,[%fp+2023->x09_stack=stack64#7]
# asm 2: stx <x09=%o4,[%fp+2023->x09_stack=80]
stx %o4,[%fp+2023-80]

# qhasm:     s05 = x05 << 7
# asm 1: sllx <x05=int64#15,7,>s05=int64#14
# asm 2: sllx <x05=%o5,7,>s05=%o4
sllx %o5,7,%o4

# qhasm:     s07 = x07 << 7
# asm 1: sllx <x07=int64#19,7,>s07=int64#23
# asm 2: sllx <x07=%l2,7,>s07=%l6
sllx %l2,7,%l6

# qhasm:   x0b_stack = x0b
# asm 1: stx <x0b=int64#16,[%fp+2023->x0b_stack=stack64#10]
# asm 2: stx <x0b=%o7,[%fp+2023->x0b_stack=104]
stx %o7,[%fp+2023-104]

# qhasm:     (uint32) x05 >>= 25
# asm 1: srl <x05=int64#15,25,>x05=int64#15
# asm 2: srl <x05=%o5,25,>x05=%o5
srl %o5,25,%o5

# qhasm:     (uint32) x07 >>= 25
# asm 1: srl <x07=int64#19,25,>x07=int64#16
# asm 2: srl <x07=%l2,25,>x07=%o7
srl %l2,25,%o7

# qhasm:   x13_stack = x13
# asm 1: stx <x13=int64#10,[%fp+2023->x13_stack=stack64#12]
# asm 2: stx <x13=%o0,[%fp+2023->x13_stack=120]
stx %o0,[%fp+2023-120]

# qhasm:     x05 |= s05
# asm 1: or  <x05=int64#15,<s05=int64#14,>x05=int64#10
# asm 2: or  <x05=%o5,<s05=%o4,>x05=%o0
or  %o5,%o4,%o0

# qhasm:     x07 |= s07
# asm 1: or  <x07=int64#16,<s07=int64#23,>x07=int64#14
# asm 2: or  <x07=%o7,<s07=%l6,>x07=%o4
or  %o7,%l6,%o4

# qhasm:   x19_stack = x19
# asm 1: stx <x19=int64#11,[%fp+2023->x19_stack=stack64#15]
# asm 2: stx <x19=%o1,[%fp+2023->x19_stack=144]
stx %o1,[%fp+2023-144]

# qhasm:     s0d = x0d << 7
# asm 1: sllx <x0d=int64#20,7,>s0d=int64#11
# asm 2: sllx <x0d=%l3,7,>s0d=%o1
sllx %l3,7,%o1

# qhasm:     s0f = x0f << 7
# asm 1: sllx <x0f=int64#17,7,>s0f=int64#15
# asm 2: sllx <x0f=%l0,7,>s0f=%o5
sllx %l0,7,%o5

# qhasm:   x1b_stack = x1b
# asm 1: stx <x1b=int64#12,[%fp+2023->x1b_stack=stack64#16]
# asm 2: stx <x1b=%o2,[%fp+2023->x1b_stack=152]
stx %o2,[%fp+2023-152]

# qhasm:     (uint32) x0d >>= 25
# asm 1: srl <x0d=int64#20,25,>x0d=int64#12
# asm 2: srl <x0d=%l3,25,>x0d=%o2
srl %l3,25,%o2

# qhasm:     (uint32) x0f >>= 25
# asm 1: srl <x0f=int64#17,25,>x0f=int64#16
# asm 2: srl <x0f=%l0,25,>x0f=%o7
srl %l0,25,%o7

# qhasm:     x0d |= s0d
# asm 1: or  <x0d=int64#12,<s0d=int64#11,>x0d=int64#11
# asm 2: or  <x0d=%o2,<s0d=%o1,>x0d=%o1
or  %o2,%o1,%o1

# qhasm:     x0f |= s0f
# asm 1: or  <x0f=int64#16,<s0f=int64#15,>x0f=int64#12
# asm 2: or  <x0f=%o7,<s0f=%o5,>x0f=%o2
or  %o7,%o5,%o2

# qhasm:     x05 ^= x1d
# asm 1: xor <x05=int64#10,<x1d=int64#13,>x05=int64#10
# asm 2: xor <x05=%o0,<x1d=%o3,>x05=%o0
xor %o0,%o3,%o0

# qhasm:     x07 ^= x1f
# asm 1: xor <x07=int64#14,<x1f=int64#22,>x07=int64#14
# asm 2: xor <x07=%o4,<x1f=%l5,>x07=%o4
xor %o4,%l5,%o4

# qhasm:   x1e = x1e_stack
# asm 1: ldx [%fp+2023-<x1e_stack=stack64#14],>x1e=int64#15
# asm 2: ldx [%fp+2023-<x1e_stack=136],>x1e=%o5
ldx [%fp+2023-136],%o5

# qhasm:     x0d ^= x15
# asm 1: xor <x0d=int64#11,<x15=int64#18,>x0d=int64#11
# asm 2: xor <x0d=%o1,<x15=%l1,>x0d=%o1
xor %o1,%l1,%o1

# qhasm:     x0f ^= x17
# asm 1: xor <x0f=int64#12,<x17=int64#21,>x0f=int64#12
# asm 2: xor <x0f=%o2,<x17=%l4,>x0f=%o2
xor %o2,%l4,%o2

# qhasm:   x16 = x16_stack
# asm 1: ldx [%fp+2023-<x16_stack=stack64#11],>x16=int64#16
# asm 2: ldx [%fp+2023-<x16_stack=112],>x16=%o7
ldx [%fp+2023-112],%o7

# qhasm:     x1f += x05
# asm 1: add <x1f=int64#22,<x05=int64#10,>x1f=int64#17
# asm 2: add <x1f=%l5,<x05=%o0,>x1f=%l0
add %l5,%o0,%l0

# qhasm:     x1d += x07
# asm 1: add <x1d=int64#13,<x07=int64#14,>x1d=int64#13
# asm 2: add <x1d=%o3,<x07=%o4,>x1d=%o3
add %o3,%o4,%o3

# qhasm:   x09 = x09_stack
# asm 1: ldx [%fp+2023-<x09_stack=stack64#7],>x09=int64#19
# asm 2: ldx [%fp+2023-<x09_stack=80],>x09=%l2
ldx [%fp+2023-80],%l2

# qhasm:     x17 += x0d
# asm 1: add <x17=int64#21,<x0d=int64#11,>x17=int64#20
# asm 2: add <x17=%l4,<x0d=%o1,>x17=%l3
add %l4,%o1,%l3

# qhasm:     x15 += x0f
# asm 1: add <x15=int64#18,<x0f=int64#12,>x15=int64#18
# asm 2: add <x15=%l1,<x0f=%o2,>x15=%l1
add %l1,%o2,%l1

# qhasm:     x05_stack = x05
# asm 1: stx <x05=int64#10,[%fp+2023->x05_stack=stack64#7]
# asm 2: stx <x05=%o0,[%fp+2023->x05_stack=80]
stx %o0,[%fp+2023-80]

# qhasm:   s00 = x00 << 11
# asm 1: sllx <x00=int64#6,11,>s00=int64#10
# asm 2: sllx <x00=%i5,11,>s00=%o0
sllx %i5,11,%o0

# qhasm:   s01 = x01 << 11
# asm 1: sllx <x01=int64#8,11,>s01=int64#21
# asm 2: sllx <x01=%g4,11,>s01=%l4
sllx %g4,11,%l4

# qhasm:     x07_stack = x07
# asm 1: stx <x07=int64#14,[%fp+2023->x07_stack=stack64#11]
# asm 2: stx <x07=%o4,[%fp+2023->x07_stack=112]
stx %o4,[%fp+2023-112]

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int64#6,21,>x00=int64#6
# asm 2: srl <x00=%i5,21,>x00=%i5
srl %i5,21,%i5

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int64#8,21,>x01=int64#8
# asm 2: srl <x01=%g4,21,>x01=%g4
srl %g4,21,%g4

# qhasm:     x0d_stack = x0d
# asm 1: stx <x0d=int64#11,[%fp+2023->x0d_stack=stack64#14]
# asm 2: stx <x0d=%o1,[%fp+2023->x0d_stack=136]
stx %o1,[%fp+2023-136]

# qhasm:   x00 |= s00
# asm 1: or  <x00=int64#6,<s00=int64#10,>x00=int64#6
# asm 2: or  <x00=%i5,<s00=%o0,>x00=%i5
or  %i5,%o0,%i5

# qhasm:   x01 |= s01
# asm 1: or  <x01=int64#8,<s01=int64#21,>x01=int64#8
# asm 2: or  <x01=%g4,<s01=%l4,>x01=%g4
or  %g4,%l4,%g4

# qhasm:     x0f_stack = x0f
# asm 1: stx <x0f=int64#12,[%fp+2023->x0f_stack=stack64#17]
# asm 2: stx <x0f=%o2,[%fp+2023->x0f_stack=160]
stx %o2,[%fp+2023-160]

# qhasm:   s08 = x08 << 11
# asm 1: sllx <x08=int64#1,11,>s08=int64#10
# asm 2: sllx <x08=%i0,11,>s08=%o0
sllx %i0,11,%o0

# qhasm:   s09 = x09 << 11
# asm 1: sllx <x09=int64#19,11,>s09=int64#11
# asm 2: sllx <x09=%l2,11,>s09=%o1
sllx %l2,11,%o1

# qhasm:     x15_stack = x15
# asm 1: stx <x15=int64#18,[%fp+2023->x15_stack=stack64#18]
# asm 2: stx <x15=%l1,[%fp+2023->x15_stack=168]
stx %l1,[%fp+2023-168]

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int64#1,21,>x08=int64#1
# asm 2: srl <x08=%i0,21,>x08=%i0
srl %i0,21,%i0

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int64#19,21,>x09=int64#12
# asm 2: srl <x09=%l2,21,>x09=%o2
srl %l2,21,%o2

# qhasm:     x1d_stack = x1d
# asm 1: stx <x1d=int64#13,[%fp+2023->x1d_stack=stack64#21]
# asm 2: stx <x1d=%o3,[%fp+2023->x1d_stack=192]
stx %o3,[%fp+2023-192]

# qhasm:   x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#10,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%o0,>x08=%i0
or  %i0,%o0,%i0

# qhasm:   x09 |= s09
# asm 1: or  <x09=int64#12,<s09=int64#11,>x09=int64#10
# asm 2: or  <x09=%o2,<s09=%o1,>x09=%o0
or  %o2,%o1,%o0

# qhasm:   x00 ^= x1e
# asm 1: xor <x00=int64#6,<x1e=int64#15,>x00=int64#6
# asm 2: xor <x00=%i5,<x1e=%o5,>x00=%i5
xor %i5,%o5,%i5

# qhasm:   x01 ^= x1f
# asm 1: xor <x01=int64#8,<x1f=int64#17,>x01=int64#8
# asm 2: xor <x01=%g4,<x1f=%l0,>x01=%g4
xor %g4,%l0,%g4

# qhasm:   x08 ^= x16
# asm 1: xor <x08=int64#1,<x16=int64#16,>x08=int64#1
# asm 2: xor <x08=%i0,<x16=%o7,>x08=%i0
xor %i0,%o7,%i0

# qhasm:   x09 ^= x17
# asm 1: xor <x09=int64#10,<x17=int64#20,>x09=int64#10
# asm 2: xor <x09=%o0,<x17=%l3,>x09=%o0
xor %o0,%l3,%o0

# qhasm:   x1f += x00
# asm 1: add <x1f=int64#17,<x00=int64#6,>x1f=int64#11
# asm 2: add <x1f=%l0,<x00=%i5,>x1f=%o1
add %l0,%i5,%o1

# qhasm:   x1e += x01
# asm 1: add <x1e=int64#15,<x01=int64#8,>x1e=int64#12
# asm 2: add <x1e=%o5,<x01=%g4,>x1e=%o2
add %o5,%g4,%o2

# qhasm:   x17 += x08
# asm 1: add <x17=int64#20,<x08=int64#1,>x17=int64#13
# asm 2: add <x17=%l3,<x08=%i0,>x17=%o3
add %l3,%i0,%o3

# qhasm:   x16 += x09
# asm 1: add <x16=int64#16,<x09=int64#10,>x16=int64#14
# asm 2: add <x16=%o7,<x09=%o0,>x16=%o4
add %o7,%o0,%o4

# qhasm:   s00 = x00 << 7
# asm 1: sllx <x00=int64#6,7,>s00=int64#15
# asm 2: sllx <x00=%i5,7,>s00=%o5
sllx %i5,7,%o5

# qhasm:   s01 = x01 << 7
# asm 1: sllx <x01=int64#8,7,>s01=int64#16
# asm 2: sllx <x01=%g4,7,>s01=%o7
sllx %g4,7,%o7

# qhasm:     x02 = x02_stack
# asm 1: ldx [%fp+2023-<x02_stack=stack64#4],>x02=int64#17
# asm 2: ldx [%fp+2023-<x02_stack=56],>x02=%l0
ldx [%fp+2023-56],%l0

# qhasm:   (uint32) x00 >>= 25
# asm 1: srl <x00=int64#6,25,>x00=int64#6
# asm 2: srl <x00=%i5,25,>x00=%i5
srl %i5,25,%i5

# qhasm:   (uint32) x01 >>= 25
# asm 1: srl <x01=int64#8,25,>x01=int64#8
# asm 2: srl <x01=%g4,25,>x01=%g4
srl %g4,25,%g4

# qhasm:     x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#5],>x03=int64#18
# asm 2: ldx [%fp+2023-<x03_stack=64],>x03=%l1
ldx [%fp+2023-64],%l1

# qhasm:   x00 |= s00
# asm 1: or  <x00=int64#6,<s00=int64#15,>x00=int64#6
# asm 2: or  <x00=%i5,<s00=%o5,>x00=%i5
or  %i5,%o5,%i5

# qhasm:   x01 |= s01
# asm 1: or  <x01=int64#8,<s01=int64#16,>x01=int64#8
# asm 2: or  <x01=%g4,<s01=%o7,>x01=%g4
or  %g4,%o7,%g4

# qhasm:     x0a = x0a_stack
# asm 1: ldx [%fp+2023-<x0a_stack=stack64#6],>x0a=int64#15
# asm 2: ldx [%fp+2023-<x0a_stack=72],>x0a=%o5
ldx [%fp+2023-72],%o5

# qhasm:   s08 = x08 << 7
# asm 1: sllx <x08=int64#1,7,>s08=int64#16
# asm 2: sllx <x08=%i0,7,>s08=%o7
sllx %i0,7,%o7

# qhasm:   s09 = x09 << 7
# asm 1: sllx <x09=int64#10,7,>s09=int64#19
# asm 2: sllx <x09=%o0,7,>s09=%l2
sllx %o0,7,%l2

# qhasm:     x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#10],>x0b=int64#20
# asm 2: ldx [%fp+2023-<x0b_stack=104],>x0b=%l3
ldx [%fp+2023-104],%l3

# qhasm:   (uint32) x08 >>= 25
# asm 1: srl <x08=int64#1,25,>x08=int64#1
# asm 2: srl <x08=%i0,25,>x08=%i0
srl %i0,25,%i0

# qhasm:   (uint32) x09 >>= 25
# asm 1: srl <x09=int64#10,25,>x09=int64#10
# asm 2: srl <x09=%o0,25,>x09=%o0
srl %o0,25,%o0

# qhasm:     x1c = x1c_stack
# asm 1: ldx [%fp+2023-<x1c_stack=stack64#13],>x1c=int64#21
# asm 2: ldx [%fp+2023-<x1c_stack=128],>x1c=%l4
ldx [%fp+2023-128],%l4

# qhasm:   x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#16,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%o7,>x08=%i0
or  %i0,%o7,%i0

# qhasm:   x09 |= s09
# asm 1: or  <x09=int64#10,<s09=int64#19,>x09=int64#10
# asm 2: or  <x09=%o0,<s09=%l2,>x09=%o0
or  %o0,%l2,%o0

# qhasm:     x1d = x1d_stack
# asm 1: ldx [%fp+2023-<x1d_stack=stack64#21],>x1d=int64#16
# asm 2: ldx [%fp+2023-<x1d_stack=192],>x1d=%o7
ldx [%fp+2023-192],%o7

# qhasm:   x00 ^= x17
# asm 1: xor <x00=int64#6,<x17=int64#13,>x00=int64#6
# asm 2: xor <x00=%i5,<x17=%o3,>x00=%i5
xor %i5,%o3,%i5

# qhasm:   x01 ^= x16
# asm 1: xor <x01=int64#8,<x16=int64#14,>x01=int64#8
# asm 2: xor <x01=%g4,<x16=%o4,>x01=%g4
xor %g4,%o4,%g4

# qhasm:     x14 = x14_stack
# asm 1: ldx [%fp+2023-<x14_stack=stack64#9],>x14=int64#19
# asm 2: ldx [%fp+2023-<x14_stack=96],>x14=%l2
ldx [%fp+2023-96],%l2

# qhasm:   x08 ^= x1f
# asm 1: xor <x08=int64#1,<x1f=int64#11,>x08=int64#1
# asm 2: xor <x08=%i0,<x1f=%o1,>x08=%i0
xor %i0,%o1,%i0

# qhasm:   x09 ^= x1e
# asm 1: xor <x09=int64#10,<x1e=int64#12,>x09=int64#10
# asm 2: xor <x09=%o0,<x1e=%o2,>x09=%o0
xor %o0,%o2,%o0

# qhasm:     x15 = x15_stack
# asm 1: ldx [%fp+2023-<x15_stack=stack64#18],>x15=int64#22
# asm 2: ldx [%fp+2023-<x15_stack=168],>x15=%l5
ldx [%fp+2023-168],%l5

# qhasm:     s02 = x02 << 11
# asm 1: sllx <x02=int64#17,11,>s02=int64#23
# asm 2: sllx <x02=%l0,11,>s02=%l6
sllx %l0,11,%l6

# qhasm:     s03 = x03 << 11
# asm 1: sllx <x03=int64#18,11,>s03=int64#24
# asm 2: sllx <x03=%l1,11,>s03=%l7
sllx %l1,11,%l7

# qhasm:   x09_stack = x09
# asm 1: stx <x09=int64#10,[%fp+2023->x09_stack=stack64#4]
# asm 2: stx <x09=%o0,[%fp+2023->x09_stack=56]
stx %o0,[%fp+2023-56]

# qhasm:     (uint32) x02 >>= 21
# asm 1: srl <x02=int64#17,21,>x02=int64#10
# asm 2: srl <x02=%l0,21,>x02=%o0
srl %l0,21,%o0

# qhasm:     (uint32) x03 >>= 21
# asm 1: srl <x03=int64#18,21,>x03=int64#17
# asm 2: srl <x03=%l1,21,>x03=%l0
srl %l1,21,%l0

# qhasm:   x1e_stack = x1e
# asm 1: stx <x1e=int64#12,[%fp+2023->x1e_stack=stack64#6]
# asm 2: stx <x1e=%o2,[%fp+2023->x1e_stack=72]
stx %o2,[%fp+2023-72]

# qhasm:     x02 |= s02
# asm 1: or  <x02=int64#10,<s02=int64#23,>x02=int64#10
# asm 2: or  <x02=%o0,<s02=%l6,>x02=%o0
or  %o0,%l6,%o0

# qhasm:     x03 |= s03
# asm 1: or  <x03=int64#17,<s03=int64#24,>x03=int64#12
# asm 2: or  <x03=%l0,<s03=%l7,>x03=%o2
or  %l0,%l7,%o2

# qhasm:   x1f_stack = x1f
# asm 1: stx <x1f=int64#11,[%fp+2023->x1f_stack=stack64#18]
# asm 2: stx <x1f=%o1,[%fp+2023->x1f_stack=168]
stx %o1,[%fp+2023-168]

# qhasm:     s0a = x0a << 11
# asm 1: sllx <x0a=int64#15,11,>s0a=int64#11
# asm 2: sllx <x0a=%o5,11,>s0a=%o1
sllx %o5,11,%o1

# qhasm:     s0b = x0b << 11
# asm 1: sllx <x0b=int64#20,11,>s0b=int64#17
# asm 2: sllx <x0b=%l3,11,>s0b=%l0
sllx %l3,11,%l0

# qhasm:   x16_stack = x16
# asm 1: stx <x16=int64#14,[%fp+2023->x16_stack=stack64#21]
# asm 2: stx <x16=%o4,[%fp+2023->x16_stack=192]
stx %o4,[%fp+2023-192]

# qhasm:     (uint32) x0a >>= 21
# asm 1: srl <x0a=int64#15,21,>x0a=int64#14
# asm 2: srl <x0a=%o5,21,>x0a=%o4
srl %o5,21,%o4

# qhasm:     (uint32) x0b >>= 21
# asm 1: srl <x0b=int64#20,21,>x0b=int64#15
# asm 2: srl <x0b=%l3,21,>x0b=%o5
srl %l3,21,%o5

# qhasm:   x17_stack = x17
# asm 1: stx <x17=int64#13,[%fp+2023->x17_stack=stack64#23]
# asm 2: stx <x17=%o3,[%fp+2023->x17_stack=208]
stx %o3,[%fp+2023-208]

# qhasm:     x0a |= s0a
# asm 1: or  <x0a=int64#14,<s0a=int64#11,>x0a=int64#11
# asm 2: or  <x0a=%o4,<s0a=%o1,>x0a=%o1
or  %o4,%o1,%o1

# qhasm:     x0b |= s0b
# asm 1: or  <x0b=int64#15,<s0b=int64#17,>x0b=int64#13
# asm 2: or  <x0b=%o5,<s0b=%l0,>x0b=%o3
or  %o5,%l0,%o3

# qhasm:     x02 ^= x1c
# asm 1: xor <x02=int64#10,<x1c=int64#21,>x02=int64#10
# asm 2: xor <x02=%o0,<x1c=%l4,>x02=%o0
xor %o0,%l4,%o0

# qhasm:     x03 ^= x1d
# asm 1: xor <x03=int64#12,<x1d=int64#16,>x03=int64#12
# asm 2: xor <x03=%o2,<x1d=%o7,>x03=%o2
xor %o2,%o7,%o2

# qhasm:     x0a ^= x14
# asm 1: xor <x0a=int64#11,<x14=int64#19,>x0a=int64#11
# asm 2: xor <x0a=%o1,<x14=%l2,>x0a=%o1
xor %o1,%l2,%o1

# qhasm:     x0b ^= x15
# asm 1: xor <x0b=int64#13,<x15=int64#22,>x0b=int64#13
# asm 2: xor <x0b=%o3,<x15=%l5,>x0b=%o3
xor %o3,%l5,%o3

# qhasm:     x1d += x02
# asm 1: add <x1d=int64#16,<x02=int64#10,>x1d=int64#14
# asm 2: add <x1d=%o7,<x02=%o0,>x1d=%o4
add %o7,%o0,%o4

# qhasm:     x1c += x03
# asm 1: add <x1c=int64#21,<x03=int64#12,>x1c=int64#15
# asm 2: add <x1c=%l4,<x03=%o2,>x1c=%o5
add %l4,%o2,%o5

# qhasm:     x15 += x0a
# asm 1: add <x15=int64#22,<x0a=int64#11,>x15=int64#16
# asm 2: add <x15=%l5,<x0a=%o1,>x15=%o7
add %l5,%o1,%o7

# qhasm:     x14 += x0b
# asm 1: add <x14=int64#19,<x0b=int64#13,>x14=int64#17
# asm 2: add <x14=%l2,<x0b=%o3,>x14=%l0
add %l2,%o3,%l0

# qhasm:     s02 = x02 << 7
# asm 1: sllx <x02=int64#10,7,>s02=int64#18
# asm 2: sllx <x02=%o0,7,>s02=%l1
sllx %o0,7,%l1

# qhasm:     s03 = x03 << 7
# asm 1: sllx <x03=int64#12,7,>s03=int64#19
# asm 2: sllx <x03=%o2,7,>s03=%l2
sllx %o2,7,%l2

# qhasm:     (uint32) x02 >>= 25
# asm 1: srl <x02=int64#10,25,>x02=int64#10
# asm 2: srl <x02=%o0,25,>x02=%o0
srl %o0,25,%o0

# qhasm:     (uint32) x03 >>= 25
# asm 1: srl <x03=int64#12,25,>x03=int64#12
# asm 2: srl <x03=%o2,25,>x03=%o2
srl %o2,25,%o2

# qhasm:     x02 |= s02
# asm 1: or  <x02=int64#10,<s02=int64#18,>x02=int64#10
# asm 2: or  <x02=%o0,<s02=%l1,>x02=%o0
or  %o0,%l1,%o0

# qhasm:     x03 |= s03
# asm 1: or  <x03=int64#12,<s03=int64#19,>x03=int64#12
# asm 2: or  <x03=%o2,<s03=%l2,>x03=%o2
or  %o2,%l2,%o2

# qhasm:     s0a = x0a << 7
# asm 1: sllx <x0a=int64#11,7,>s0a=int64#18
# asm 2: sllx <x0a=%o1,7,>s0a=%l1
sllx %o1,7,%l1

# qhasm:     s0b = x0b << 7
# asm 1: sllx <x0b=int64#13,7,>s0b=int64#19
# asm 2: sllx <x0b=%o3,7,>s0b=%l2
sllx %o3,7,%l2

# qhasm:   x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#7],>x05=int64#20
# asm 2: ldx [%fp+2023-<x05_stack=80],>x05=%l3
ldx [%fp+2023-80],%l3

# qhasm:     (uint32) x0a >>= 25
# asm 1: srl <x0a=int64#11,25,>x0a=int64#11
# asm 2: srl <x0a=%o1,25,>x0a=%o1
srl %o1,25,%o1

# qhasm:     (uint32) x0b >>= 25
# asm 1: srl <x0b=int64#13,25,>x0b=int64#13
# asm 2: srl <x0b=%o3,25,>x0b=%o3
srl %o3,25,%o3

# qhasm:   x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#3],>x0c=int64#21
# asm 2: ldx [%fp+2023-<x0c_stack=48],>x0c=%l4
ldx [%fp+2023-48],%l4

# qhasm:     x0a |= s0a
# asm 1: or  <x0a=int64#11,<s0a=int64#18,>x0a=int64#11
# asm 2: or  <x0a=%o1,<s0a=%l1,>x0a=%o1
or  %o1,%l1,%o1

# qhasm:     x0b |= s0b
# asm 1: or  <x0b=int64#13,<s0b=int64#19,>x0b=int64#13
# asm 2: or  <x0b=%o3,<s0b=%l2,>x0b=%o3
or  %o3,%l2,%o3

# qhasm:   x0d = x0d_stack
# asm 1: ldx [%fp+2023-<x0d_stack=stack64#14],>x0d=int64#18
# asm 2: ldx [%fp+2023-<x0d_stack=136],>x0d=%l1
ldx [%fp+2023-136],%l1

# qhasm:     x02 ^= x15
# asm 1: xor <x02=int64#10,<x15=int64#16,>x02=int64#10
# asm 2: xor <x02=%o0,<x15=%o7,>x02=%o0
xor %o0,%o7,%o0

# qhasm:     x03 ^= x14
# asm 1: xor <x03=int64#12,<x14=int64#17,>x03=int64#12
# asm 2: xor <x03=%o2,<x14=%l0,>x03=%o2
xor %o2,%l0,%o2

# qhasm:   x1b = x1b_stack
# asm 1: ldx [%fp+2023-<x1b_stack=stack64#16],>x1b=int64#19
# asm 2: ldx [%fp+2023-<x1b_stack=152],>x1b=%l2
ldx [%fp+2023-152],%l2

# qhasm:     x0a ^= x1d
# asm 1: xor <x0a=int64#11,<x1d=int64#14,>x0a=int64#11
# asm 2: xor <x0a=%o1,<x1d=%o4,>x0a=%o1
xor %o1,%o4,%o1

# qhasm:     x0b ^= x1c
# asm 1: xor <x0b=int64#13,<x1c=int64#15,>x0b=int64#13
# asm 2: xor <x0b=%o3,<x1c=%o5,>x0b=%o3
xor %o3,%o5,%o3

# qhasm:   x13 = x13_stack
# asm 1: ldx [%fp+2023-<x13_stack=stack64#12],>x13=int64#22
# asm 2: ldx [%fp+2023-<x13_stack=120],>x13=%l5
ldx [%fp+2023-120],%l5

# qhasm:   s04 = x04 << 11
# asm 1: sllx <x04=int64#5,11,>s04=int64#23
# asm 2: sllx <x04=%i4,11,>s04=%l6
sllx %i4,11,%l6

# qhasm:   s05 = x05 << 11
# asm 1: sllx <x05=int64#20,11,>s05=int64#24
# asm 2: sllx <x05=%l3,11,>s05=%l7
sllx %l3,11,%l7

# qhasm:     x02_stack = x02
# asm 1: stx <x02=int64#10,[%fp+2023->x02_stack=stack64#3]
# asm 2: stx <x02=%o0,[%fp+2023->x02_stack=48]
stx %o0,[%fp+2023-48]

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int64#5,21,>x04=int64#5
# asm 2: srl <x04=%i4,21,>x04=%i4
srl %i4,21,%i4

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int64#20,21,>x05=int64#10
# asm 2: srl <x05=%l3,21,>x05=%o0
srl %l3,21,%o0

# qhasm:     x03_stack = x03
# asm 1: stx <x03=int64#12,[%fp+2023->x03_stack=stack64#7]
# asm 2: stx <x03=%o2,[%fp+2023->x03_stack=80]
stx %o2,[%fp+2023-80]

# qhasm:   x04 |= s04
# asm 1: or  <x04=int64#5,<s04=int64#23,>x04=int64#5
# asm 2: or  <x04=%i4,<s04=%l6,>x04=%i4
or  %i4,%l6,%i4

# qhasm:   x05 |= s05
# asm 1: or  <x05=int64#10,<s05=int64#24,>x05=int64#10
# asm 2: or  <x05=%o0,<s05=%l7,>x05=%o0
or  %o0,%l7,%o0

# qhasm:     x0a_stack = x0a
# asm 1: stx <x0a=int64#11,[%fp+2023->x0a_stack=stack64#12]
# asm 2: stx <x0a=%o1,[%fp+2023->x0a_stack=120]
stx %o1,[%fp+2023-120]

# qhasm:   s0c = x0c << 11
# asm 1: sllx <x0c=int64#21,11,>s0c=int64#11
# asm 2: sllx <x0c=%l4,11,>s0c=%o1
sllx %l4,11,%o1

# qhasm:   s0d = x0d << 11
# asm 1: sllx <x0d=int64#18,11,>s0d=int64#12
# asm 2: sllx <x0d=%l1,11,>s0d=%o2
sllx %l1,11,%o2

# qhasm:     x0b_stack = x0b
# asm 1: stx <x0b=int64#13,[%fp+2023->x0b_stack=stack64#14]
# asm 2: stx <x0b=%o3,[%fp+2023->x0b_stack=136]
stx %o3,[%fp+2023-136]

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int64#21,21,>x0c=int64#13
# asm 2: srl <x0c=%l4,21,>x0c=%o3
srl %l4,21,%o3

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int64#18,21,>x0d=int64#18
# asm 2: srl <x0d=%l1,21,>x0d=%l1
srl %l1,21,%l1

# qhasm:     x1d_stack = x1d
# asm 1: stx <x1d=int64#14,[%fp+2023->x1d_stack=stack64#5]
# asm 2: stx <x1d=%o4,[%fp+2023->x1d_stack=64]
stx %o4,[%fp+2023-64]

# qhasm:   x0c |= s0c
# asm 1: or  <x0c=int64#13,<s0c=int64#11,>x0c=int64#11
# asm 2: or  <x0c=%o3,<s0c=%o1,>x0c=%o1
or  %o3,%o1,%o1

# qhasm:   x0d |= s0d
# asm 1: or  <x0d=int64#18,<s0d=int64#12,>x0d=int64#12
# asm 2: or  <x0d=%l1,<s0d=%o2,>x0d=%o2
or  %l1,%o2,%o2

# qhasm:     x1c_stack = x1c
# asm 1: stx <x1c=int64#15,[%fp+2023->x1c_stack=stack64#9]
# asm 2: stx <x1c=%o5,[%fp+2023->x1c_stack=96]
stx %o5,[%fp+2023-96]

# qhasm:   x04 ^= x1a
# asm 1: xor <x04=int64#5,<x1a=int64#7,>x04=int64#5
# asm 2: xor <x04=%i4,<x1a=%g1,>x04=%i4
xor %i4,%g1,%i4

# qhasm:   x05 ^= x1b
# asm 1: xor <x05=int64#10,<x1b=int64#19,>x05=int64#10
# asm 2: xor <x05=%o0,<x1b=%l2,>x05=%o0
xor %o0,%l2,%o0

# qhasm:     x15_stack = x15
# asm 1: stx <x15=int64#16,[%fp+2023->x15_stack=stack64#10]
# asm 2: stx <x15=%o7,[%fp+2023->x15_stack=104]
stx %o7,[%fp+2023-104]

# qhasm:   x0c ^= x12
# asm 1: xor <x0c=int64#11,<x12=int64#3,>x0c=int64#11
# asm 2: xor <x0c=%o1,<x12=%i2,>x0c=%o1
xor %o1,%i2,%o1

# qhasm:   x0d ^= x13
# asm 1: xor <x0d=int64#12,<x13=int64#22,>x0d=int64#12
# asm 2: xor <x0d=%o2,<x13=%l5,>x0d=%o2
xor %o2,%l5,%o2

# qhasm:     x14_stack = x14
# asm 1: stx <x14=int64#17,[%fp+2023->x14_stack=stack64#13]
# asm 2: stx <x14=%l0,[%fp+2023->x14_stack=128]
stx %l0,[%fp+2023-128]

# qhasm:   x1b += x04
# asm 1: add <x1b=int64#19,<x04=int64#5,>x1b=int64#13
# asm 2: add <x1b=%l2,<x04=%i4,>x1b=%o3
add %l2,%i4,%o3

# qhasm:   x1a += x05
# asm 1: add <x1a=int64#7,<x05=int64#10,>x1a=int64#14
# asm 2: add <x1a=%g1,<x05=%o0,>x1a=%o4
add %g1,%o0,%o4

# qhasm:   x13 += x0c
# asm 1: add <x13=int64#22,<x0c=int64#11,>x13=int64#7
# asm 2: add <x13=%l5,<x0c=%o1,>x13=%g1
add %l5,%o1,%g1

# qhasm:   x12 += x0d
# asm 1: add <x12=int64#3,<x0d=int64#12,>x12=int64#3
# asm 2: add <x12=%i2,<x0d=%o2,>x12=%i2
add %i2,%o2,%i2

# qhasm:   s04 = x04 << 7
# asm 1: sllx <x04=int64#5,7,>s04=int64#15
# asm 2: sllx <x04=%i4,7,>s04=%o5
sllx %i4,7,%o5

# qhasm:   s05 = x05 << 7
# asm 1: sllx <x05=int64#10,7,>s05=int64#16
# asm 2: sllx <x05=%o0,7,>s05=%o7
sllx %o0,7,%o7

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int64#5,25,>x04=int64#5
# asm 2: srl <x04=%i4,25,>x04=%i4
srl %i4,25,%i4

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int64#10,25,>x05=int64#10
# asm 2: srl <x05=%o0,25,>x05=%o0
srl %o0,25,%o0

# qhasm:   x04 |= s04
# asm 1: or  <x04=int64#5,<s04=int64#15,>x04=int64#5
# asm 2: or  <x04=%i4,<s04=%o5,>x04=%i4
or  %i4,%o5,%i4

# qhasm:   x05 |= s05
# asm 1: or  <x05=int64#10,<s05=int64#16,>x05=int64#10
# asm 2: or  <x05=%o0,<s05=%o7,>x05=%o0
or  %o0,%o7,%o0

# qhasm:   s0c = x0c << 7
# asm 1: sllx <x0c=int64#11,7,>s0c=int64#15
# asm 2: sllx <x0c=%o1,7,>s0c=%o5
sllx %o1,7,%o5

# qhasm:   s0d = x0d << 7
# asm 1: sllx <x0d=int64#12,7,>s0d=int64#16
# asm 2: sllx <x0d=%o2,7,>s0d=%o7
sllx %o2,7,%o7

# qhasm:     x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#2],>x06=int64#17
# asm 2: ldx [%fp+2023-<x06_stack=40],>x06=%l0
ldx [%fp+2023-40],%l0

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int64#11,25,>x0c=int64#11
# asm 2: srl <x0c=%o1,25,>x0c=%o1
srl %o1,25,%o1

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int64#12,25,>x0d=int64#12
# asm 2: srl <x0d=%o2,25,>x0d=%o2
srl %o2,25,%o2

# qhasm:     x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#11],>x07=int64#18
# asm 2: ldx [%fp+2023-<x07_stack=112],>x07=%l1
ldx [%fp+2023-112],%l1

# qhasm:   x0c |= s0c
# asm 1: or  <x0c=int64#11,<s0c=int64#15,>x0c=int64#11
# asm 2: or  <x0c=%o1,<s0c=%o5,>x0c=%o1
or  %o1,%o5,%o1

# qhasm:   x0d |= s0d
# asm 1: or  <x0d=int64#12,<s0d=int64#16,>x0d=int64#12
# asm 2: or  <x0d=%o2,<s0d=%o7,>x0d=%o2
or  %o2,%o7,%o2

# qhasm:     x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#8],>x0e=int64#15
# asm 2: ldx [%fp+2023-<x0e_stack=88],>x0e=%o5
ldx [%fp+2023-88],%o5

# qhasm:   x04 ^= x13
# asm 1: xor <x04=int64#5,<x13=int64#7,>x04=int64#5
# asm 2: xor <x04=%i4,<x13=%g1,>x04=%i4
xor %i4,%g1,%i4

# qhasm:   x05 ^= x12
# asm 1: xor <x05=int64#10,<x12=int64#3,>x05=int64#10
# asm 2: xor <x05=%o0,<x12=%i2,>x05=%o0
xor %o0,%i2,%o0

# qhasm:     x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#17],>x0f=int64#16
# asm 2: ldx [%fp+2023-<x0f_stack=160],>x0f=%o7
ldx [%fp+2023-160],%o7

# qhasm:   x0c ^= x1b
# asm 1: xor <x0c=int64#11,<x1b=int64#13,>x0c=int64#11
# asm 2: xor <x0c=%o1,<x1b=%o3,>x0c=%o1
xor %o1,%o3,%o1

# qhasm:   x0d ^= x1a
# asm 1: xor <x0d=int64#12,<x1a=int64#14,>x0d=int64#12
# asm 2: xor <x0d=%o2,<x1a=%o4,>x0d=%o2
xor %o2,%o4,%o2

# qhasm:     x19 = x19_stack
# asm 1: ldx [%fp+2023-<x19_stack=stack64#15],>x19=int64#19
# asm 2: ldx [%fp+2023-<x19_stack=144],>x19=%l2
ldx [%fp+2023-144],%l2

# qhasm:     s06 = x06 << 11
# asm 1: sllx <x06=int64#17,11,>s06=int64#20
# asm 2: sllx <x06=%l0,11,>s06=%l3
sllx %l0,11,%l3

# qhasm:     s07 = x07 << 11
# asm 1: sllx <x07=int64#18,11,>s07=int64#21
# asm 2: sllx <x07=%l1,11,>s07=%l4
sllx %l1,11,%l4

# qhasm:   x05_stack = x05
# asm 1: stx <x05=int64#10,[%fp+2023->x05_stack=stack64#2]
# asm 2: stx <x05=%o0,[%fp+2023->x05_stack=40]
stx %o0,[%fp+2023-40]

# qhasm:     (uint32) x06 >>= 21
# asm 1: srl <x06=int64#17,21,>x06=int64#10
# asm 2: srl <x06=%l0,21,>x06=%o0
srl %l0,21,%o0

# qhasm:     (uint32) x07 >>= 21
# asm 1: srl <x07=int64#18,21,>x07=int64#17
# asm 2: srl <x07=%l1,21,>x07=%l0
srl %l1,21,%l0

# qhasm:   x0c_stack = x0c
# asm 1: stx <x0c=int64#11,[%fp+2023->x0c_stack=stack64#8]
# asm 2: stx <x0c=%o1,[%fp+2023->x0c_stack=88]
stx %o1,[%fp+2023-88]

# qhasm:     x06 |= s06
# asm 1: or  <x06=int64#10,<s06=int64#20,>x06=int64#10
# asm 2: or  <x06=%o0,<s06=%l3,>x06=%o0
or  %o0,%l3,%o0

# qhasm:     x07 |= s07
# asm 1: or  <x07=int64#17,<s07=int64#21,>x07=int64#11
# asm 2: or  <x07=%l0,<s07=%l4,>x07=%o1
or  %l0,%l4,%o1

# qhasm:   x0d_stack = x0d
# asm 1: stx <x0d=int64#12,[%fp+2023->x0d_stack=stack64#11]
# asm 2: stx <x0d=%o2,[%fp+2023->x0d_stack=112]
stx %o2,[%fp+2023-112]

# qhasm:     s0e = x0e << 11
# asm 1: sllx <x0e=int64#15,11,>s0e=int64#12
# asm 2: sllx <x0e=%o5,11,>s0e=%o2
sllx %o5,11,%o2

# qhasm:     s0f = x0f << 11
# asm 1: sllx <x0f=int64#16,11,>s0f=int64#17
# asm 2: sllx <x0f=%o7,11,>s0f=%l0
sllx %o7,11,%l0

# qhasm:   x1b_stack = x1b
# asm 1: stx <x1b=int64#13,[%fp+2023->x1b_stack=stack64#17]
# asm 2: stx <x1b=%o3,[%fp+2023->x1b_stack=160]
stx %o3,[%fp+2023-160]

# qhasm:     (uint32) x0e >>= 21
# asm 1: srl <x0e=int64#15,21,>x0e=int64#13
# asm 2: srl <x0e=%o5,21,>x0e=%o3
srl %o5,21,%o3

# qhasm:     (uint32) x0f >>= 21
# asm 1: srl <x0f=int64#16,21,>x0f=int64#15
# asm 2: srl <x0f=%o7,21,>x0f=%o5
srl %o7,21,%o5

# qhasm:   x13_stack = x13
# asm 1: stx <x13=int64#7,[%fp+2023->x13_stack=stack64#24]
# asm 2: stx <x13=%g1,[%fp+2023->x13_stack=216]
stx %g1,[%fp+2023-216]

# qhasm:     x0e |= s0e
# asm 1: or  <x0e=int64#13,<s0e=int64#12,>x0e=int64#7
# asm 2: or  <x0e=%o3,<s0e=%o2,>x0e=%g1
or  %o3,%o2,%g1

# qhasm:     x0f |= s0f
# asm 1: or  <x0f=int64#15,<s0f=int64#17,>x0f=int64#12
# asm 2: or  <x0f=%o5,<s0f=%l0,>x0f=%o2
or  %o5,%l0,%o2

# qhasm:     x06 ^= x18
# asm 1: xor <x06=int64#10,<x18=int64#4,>x06=int64#10
# asm 2: xor <x06=%o0,<x18=%i3,>x06=%o0
xor %o0,%i3,%o0

# qhasm:     x07 ^= x19
# asm 1: xor <x07=int64#11,<x19=int64#19,>x07=int64#11
# asm 2: xor <x07=%o1,<x19=%l2,>x07=%o1
xor %o1,%l2,%o1

# qhasm:     x0e ^= x10
# asm 1: xor <x0e=int64#7,<x10=int64#2,>x0e=int64#7
# asm 2: xor <x0e=%g1,<x10=%i1,>x0e=%g1
xor %g1,%i1,%g1

# qhasm:     x0f ^= x11
# asm 1: xor <x0f=int64#12,<x11=int64#9,>x0f=int64#12
# asm 2: xor <x0f=%o2,<x11=%g5,>x0f=%o2
xor %o2,%g5,%o2

# qhasm:     x19 += x06
# asm 1: add <x19=int64#19,<x06=int64#10,>x19=int64#13
# asm 2: add <x19=%l2,<x06=%o0,>x19=%o3
add %l2,%o0,%o3

# qhasm:     x18 += x07
# asm 1: add <x18=int64#4,<x07=int64#11,>x18=int64#4
# asm 2: add <x18=%i3,<x07=%o1,>x18=%i3
add %i3,%o1,%i3

# qhasm:     x11 += x0e
# asm 1: add <x11=int64#9,<x0e=int64#7,>x11=int64#9
# asm 2: add <x11=%g5,<x0e=%g1,>x11=%g5
add %g5,%g1,%g5

# qhasm:     x10 += x0f
# asm 1: add <x10=int64#2,<x0f=int64#12,>x10=int64#2
# asm 2: add <x10=%i1,<x0f=%o2,>x10=%i1
add %i1,%o2,%i1

# qhasm:     s06 = x06 << 7
# asm 1: sllx <x06=int64#10,7,>s06=int64#15
# asm 2: sllx <x06=%o0,7,>s06=%o5
sllx %o0,7,%o5

# qhasm:     s07 = x07 << 7
# asm 1: sllx <x07=int64#11,7,>s07=int64#16
# asm 2: sllx <x07=%o1,7,>s07=%o7
sllx %o1,7,%o7

# qhasm:     (uint32) x06 >>= 25
# asm 1: srl <x06=int64#10,25,>x06=int64#10
# asm 2: srl <x06=%o0,25,>x06=%o0
srl %o0,25,%o0

# qhasm:     (uint32) x07 >>= 25
# asm 1: srl <x07=int64#11,25,>x07=int64#11
# asm 2: srl <x07=%o1,25,>x07=%o1
srl %o1,25,%o1

# qhasm:     x06 |= s06
# asm 1: or  <x06=int64#10,<s06=int64#15,>x06=int64#10
# asm 2: or  <x06=%o0,<s06=%o5,>x06=%o0
or  %o0,%o5,%o0

# qhasm:     x07 |= s07
# asm 1: or  <x07=int64#11,<s07=int64#16,>x07=int64#11
# asm 2: or  <x07=%o1,<s07=%o7,>x07=%o1
or  %o1,%o7,%o1

# qhasm:     s0e = x0e << 7
# asm 1: sllx <x0e=int64#7,7,>s0e=int64#15
# asm 2: sllx <x0e=%g1,7,>s0e=%o5
sllx %g1,7,%o5

# qhasm:     s0f = x0f << 7
# asm 1: sllx <x0f=int64#12,7,>s0f=int64#16
# asm 2: sllx <x0f=%o2,7,>s0f=%o7
sllx %o2,7,%o7

# qhasm:   x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#2],>x05=int64#17
# asm 2: ldx [%fp+2023-<x05_stack=40],>x05=%l0
ldx [%fp+2023-40],%l0

# qhasm:     (uint32) x0e >>= 25
# asm 1: srl <x0e=int64#7,25,>x0e=int64#7
# asm 2: srl <x0e=%g1,25,>x0e=%g1
srl %g1,25,%g1

# qhasm:     (uint32) x0f >>= 25
# asm 1: srl <x0f=int64#12,25,>x0f=int64#12
# asm 2: srl <x0f=%o2,25,>x0f=%o2
srl %o2,25,%o2

# qhasm:   x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#8],>x0c=int64#18
# asm 2: ldx [%fp+2023-<x0c_stack=88],>x0c=%l1
ldx [%fp+2023-88],%l1

# qhasm:     x0e |= s0e
# asm 1: or  <x0e=int64#7,<s0e=int64#15,>x0e=int64#7
# asm 2: or  <x0e=%g1,<s0e=%o5,>x0e=%g1
or  %g1,%o5,%g1

# qhasm:     x0f |= s0f
# asm 1: or  <x0f=int64#12,<s0f=int64#16,>x0f=int64#12
# asm 2: or  <x0f=%o2,<s0f=%o7,>x0f=%o2
or  %o2,%o7,%o2

# qhasm:   x0d = x0d_stack
# asm 1: ldx [%fp+2023-<x0d_stack=stack64#11],>x0d=int64#15
# asm 2: ldx [%fp+2023-<x0d_stack=112],>x0d=%o5
ldx [%fp+2023-112],%o5

# qhasm:     x06 ^= x11
# asm 1: xor <x06=int64#10,<x11=int64#9,>x06=int64#10
# asm 2: xor <x06=%o0,<x11=%g5,>x06=%o0
xor %o0,%g5,%o0

# qhasm:     x07 ^= x10
# asm 1: xor <x07=int64#11,<x10=int64#2,>x07=int64#16
# asm 2: xor <x07=%o1,<x10=%i1,>x07=%o7
xor %o1,%i1,%o7

# qhasm:       x15 = x15_stack
# asm 1: ldx [%fp+2023-<x15_stack=stack64#10],>x15=int64#19
# asm 2: ldx [%fp+2023-<x15_stack=104],>x15=%l2
ldx [%fp+2023-104],%l2

# qhasm:     x0e ^= x19
# asm 1: xor <x0e=int64#7,<x19=int64#13,>x0e=int64#20
# asm 2: xor <x0e=%g1,<x19=%o3,>x0e=%l3
xor %g1,%o3,%l3

# qhasm:     x0f ^= x18
# asm 1: xor <x0f=int64#12,<x18=int64#4,>x0f=int64#12
# asm 2: xor <x0f=%o2,<x18=%i3,>x0f=%o2
xor %o2,%i3,%o2

# qhasm:       x14 = x14_stack
# asm 1: ldx [%fp+2023-<x14_stack=stack64#13],>x14=int64#21
# asm 2: ldx [%fp+2023-<x14_stack=128],>x14=%l4
ldx [%fp+2023-128],%l4

# qhasm:       x1d = x1d_stack
# asm 1: ldx [%fp+2023-<x1d_stack=stack64#5],>x1d=int64#22
# asm 2: ldx [%fp+2023-<x1d_stack=64],>x1d=%l5
ldx [%fp+2023-64],%l5

# qhasm:       x1c = x1c_stack
# asm 1: ldx [%fp+2023-<x1c_stack=stack64#9],>x1c=int64#23
# asm 2: ldx [%fp+2023-<x1c_stack=96],>x1c=%l6
ldx [%fp+2023-96],%l6

# qhasm:   x11 += x04
# asm 1: add <x11=int64#9,<x04=int64#5,>x11=int64#11
# asm 2: add <x11=%g5,<x04=%i4,>x11=%o1
add %g5,%i4,%o1

# qhasm:   x10 += x05
# asm 1: add <x10=int64#2,<x05=int64#17,>x10=int64#7
# asm 2: add <x10=%i1,<x05=%l0,>x10=%g1
add %i1,%l0,%g1

# qhasm:       x09 = x09_stack
# asm 1: ldx [%fp+2023-<x09_stack=stack64#4],>x09=int64#2
# asm 2: ldx [%fp+2023-<x09_stack=56],>x09=%i1
ldx [%fp+2023-56],%i1

# qhasm:   x19 += x0c
# asm 1: add <x19=int64#13,<x0c=int64#18,>x19=int64#9
# asm 2: add <x19=%o3,<x0c=%l1,>x19=%g5
add %o3,%l1,%g5

# qhasm:   x18 += x0d
# asm 1: add <x18=int64#4,<x0d=int64#15,>x18=int64#4
# asm 2: add <x18=%i3,<x0d=%o5,>x18=%i3
add %i3,%o5,%i3

# qhasm:     x06_stack = x06
# asm 1: stx <x06=int64#10,[%fp+2023->x06_stack=stack64#27]
# asm 2: stx <x06=%o0,[%fp+2023->x06_stack=240]
stx %o0,[%fp+2023-240]

# qhasm:       x15 += x00
# asm 1: add <x15=int64#19,<x00=int64#6,>x15=int64#10
# asm 2: add <x15=%l2,<x00=%i5,>x15=%o0
add %l2,%i5,%o0

# qhasm:       x14 += x01
# asm 1: add <x14=int64#21,<x01=int64#8,>x14=int64#13
# asm 2: add <x14=%l4,<x01=%g4,>x14=%o3
add %l4,%g4,%o3

# qhasm:   x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#2],>x05=int64#15
# asm 2: ldx [%fp+2023-<x05_stack=40],>x05=%o5
ldx [%fp+2023-40],%o5

# qhasm:       x1d += x08
# asm 1: add <x1d=int64#22,<x08=int64#1,>x1d=int64#18
# asm 2: add <x1d=%l5,<x08=%i0,>x1d=%l1
add %l5,%i0,%l1

# qhasm:       x1c += x09
# asm 1: add <x1c=int64#23,<x09=int64#2,>x1c=int64#19
# asm 2: add <x1c=%l6,<x09=%i1,>x1c=%l2
add %l6,%i1,%l2

# qhasm:   x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#8],>x0c=int64#17
# asm 2: ldx [%fp+2023-<x0c_stack=88],>x0c=%l0
ldx [%fp+2023-88],%l0

# qhasm:   s04 = x04 << 11
# asm 1: sllx <x04=int64#5,11,>s04=int64#21
# asm 2: sllx <x04=%i4,11,>s04=%l4
sllx %i4,11,%l4

# qhasm:   s05 = x05 << 11
# asm 1: sllx <x05=int64#15,11,>s05=int64#22
# asm 2: sllx <x05=%o5,11,>s05=%l5
sllx %o5,11,%l5

# qhasm:   x0d = x0d_stack
# asm 1: ldx [%fp+2023-<x0d_stack=stack64#11],>x0d=int64#23
# asm 2: ldx [%fp+2023-<x0d_stack=112],>x0d=%l6
ldx [%fp+2023-112],%l6

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int64#5,21,>x04=int64#5
# asm 2: srl <x04=%i4,21,>x04=%i4
srl %i4,21,%i4

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int64#15,21,>x05=int64#15
# asm 2: srl <x05=%o5,21,>x05=%o5
srl %o5,21,%o5

# qhasm:     x07_stack = x07
# asm 1: stx <x07=int64#16,[%fp+2023->x07_stack=stack64#8]
# asm 2: stx <x07=%o7,[%fp+2023->x07_stack=88]
stx %o7,[%fp+2023-88]

# qhasm:   x04 |= s04
# asm 1: or  <x04=int64#5,<s04=int64#21,>x04=int64#5
# asm 2: or  <x04=%i4,<s04=%l4,>x04=%i4
or  %i4,%l4,%i4

# qhasm:   x05 |= s05
# asm 1: or  <x05=int64#15,<s05=int64#22,>x05=int64#15
# asm 2: or  <x05=%o5,<s05=%l5,>x05=%o5
or  %o5,%l5,%o5

# qhasm:     x0e_stack = x0e
# asm 1: stx <x0e=int64#20,[%fp+2023->x0e_stack=stack64#11]
# asm 2: stx <x0e=%l3,[%fp+2023->x0e_stack=112]
stx %l3,[%fp+2023-112]

# qhasm:   s0c = x0c << 11
# asm 1: sllx <x0c=int64#17,11,>s0c=int64#16
# asm 2: sllx <x0c=%l0,11,>s0c=%o7
sllx %l0,11,%o7

# qhasm:   s0d = x0d << 11
# asm 1: sllx <x0d=int64#23,11,>s0d=int64#20
# asm 2: sllx <x0d=%l6,11,>s0d=%l3
sllx %l6,11,%l3

# qhasm:     x0f_stack = x0f
# asm 1: stx <x0f=int64#12,[%fp+2023->x0f_stack=stack64#28]
# asm 2: stx <x0f=%o2,[%fp+2023->x0f_stack=248]
stx %o2,[%fp+2023-248]

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int64#17,21,>x0c=int64#12
# asm 2: srl <x0c=%l0,21,>x0c=%o2
srl %l0,21,%o2

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int64#23,21,>x0d=int64#17
# asm 2: srl <x0d=%l6,21,>x0d=%l0
srl %l6,21,%l0

# qhasm:   x15_stack = x15
# asm 1: stx <x15=int64#10,[%fp+2023->x15_stack=stack64#10]
# asm 2: stx <x15=%o0,[%fp+2023->x15_stack=104]
stx %o0,[%fp+2023-104]

# qhasm:   x0c |= s0c
# asm 1: or  <x0c=int64#12,<s0c=int64#16,>x0c=int64#12
# asm 2: or  <x0c=%o2,<s0c=%o7,>x0c=%o2
or  %o2,%o7,%o2

# qhasm:   x0d |= s0d
# asm 1: or  <x0d=int64#17,<s0d=int64#20,>x0d=int64#16
# asm 2: or  <x0d=%l0,<s0d=%l3,>x0d=%o7
or  %l0,%l3,%o7

# qhasm:   x14_stack = x14
# asm 1: stx <x14=int64#13,[%fp+2023->x14_stack=stack64#9]
# asm 2: stx <x14=%o3,[%fp+2023->x14_stack=96]
stx %o3,[%fp+2023-96]

# qhasm:   x04 ^= x15
# asm 1: xor <x04=int64#5,<x15=int64#10,>x04=int64#10
# asm 2: xor <x04=%i4,<x15=%o0,>x04=%o0
xor %i4,%o0,%o0

# qhasm:   x05 ^= x14
# asm 1: xor <x05=int64#15,<x14=int64#13,>x05=int64#17
# asm 2: xor <x05=%o5,<x14=%o3,>x05=%l0
xor %o5,%o3,%l0

# qhasm:   x1d_stack = x1d
# asm 1: stx <x1d=int64#18,[%fp+2023->x1d_stack=stack64#16]
# asm 2: stx <x1d=%l1,[%fp+2023->x1d_stack=152]
stx %l1,[%fp+2023-152]

# qhasm:   x0c ^= x1d
# asm 1: xor <x0c=int64#12,<x1d=int64#18,>x0c=int64#5
# asm 2: xor <x0c=%o2,<x1d=%l1,>x0c=%i4
xor %o2,%l1,%i4

# qhasm:   x0d ^= x1c
# asm 1: xor <x0d=int64#16,<x1c=int64#19,>x0d=int64#12
# asm 2: xor <x0d=%o7,<x1c=%l2,>x0d=%o2
xor %o7,%l2,%o2

# qhasm:   x1c_stack = x1c
# asm 1: stx <x1c=int64#19,[%fp+2023->x1c_stack=stack64#15]
# asm 2: stx <x1c=%l2,[%fp+2023->x1c_stack=144]
stx %l2,[%fp+2023-144]

# qhasm:   s00 = x00 << 11
# asm 1: sllx <x00=int64#6,11,>s00=int64#13
# asm 2: sllx <x00=%i5,11,>s00=%o3
sllx %i5,11,%o3

# qhasm:   s01 = x01 << 11
# asm 1: sllx <x01=int64#8,11,>s01=int64#15
# asm 2: sllx <x01=%g4,11,>s01=%o5
sllx %g4,11,%o5

# qhasm:     x19_stack = x19
# asm 1: stx <x19=int64#9,[%fp+2023->x19_stack=stack64#13]
# asm 2: stx <x19=%g5,[%fp+2023->x19_stack=128]
stx %g5,[%fp+2023-128]

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int64#6,21,>x00=int64#6
# asm 2: srl <x00=%i5,21,>x00=%i5
srl %i5,21,%i5

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int64#8,21,>x01=int64#8
# asm 2: srl <x01=%g4,21,>x01=%g4
srl %g4,21,%g4

# qhasm:   x05_stack = x05
# asm 1: stx <x05=int64#17,[%fp+2023->x05_stack=stack64#22]
# asm 2: stx <x05=%l0,[%fp+2023->x05_stack=200]
stx %l0,[%fp+2023-200]

# qhasm:   x00 |= s00
# asm 1: or  <x00=int64#6,<s00=int64#13,>x00=int64#6
# asm 2: or  <x00=%i5,<s00=%o3,>x00=%i5
or  %i5,%o3,%i5

# qhasm:   x01 |= s01
# asm 1: or  <x01=int64#8,<s01=int64#15,>x01=int64#8
# asm 2: or  <x01=%g4,<s01=%o5,>x01=%g4
or  %g4,%o5,%g4

# qhasm:   x0c_stack = x0c
# asm 1: stx <x0c=int64#5,[%fp+2023->x0c_stack=stack64#4]
# asm 2: stx <x0c=%i4,[%fp+2023->x0c_stack=56]
stx %i4,[%fp+2023-56]

# qhasm:   s08 = x08 << 11
# asm 1: sllx <x08=int64#1,11,>s08=int64#5
# asm 2: sllx <x08=%i0,11,>s08=%i4
sllx %i0,11,%i4

# qhasm:   s09 = x09 << 11
# asm 1: sllx <x09=int64#2,11,>s09=int64#13
# asm 2: sllx <x09=%i1,11,>s09=%o3
sllx %i1,11,%o3

# qhasm:   x0d_stack = x0d
# asm 1: stx <x0d=int64#12,[%fp+2023->x0d_stack=stack64#5]
# asm 2: stx <x0d=%o2,[%fp+2023->x0d_stack=64]
stx %o2,[%fp+2023-64]

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int64#1,21,>x08=int64#1
# asm 2: srl <x08=%i0,21,>x08=%i0
srl %i0,21,%i0

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int64#2,21,>x09=int64#2
# asm 2: srl <x09=%i1,21,>x09=%i1
srl %i1,21,%i1

# qhasm:   x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#27],>x06=int64#12
# asm 2: ldx [%fp+2023-<x06_stack=240],>x06=%o2
ldx [%fp+2023-240],%o2

# qhasm:   x08 |= s08
# asm 1: or  <x08=int64#1,<s08=int64#5,>x08=int64#1
# asm 2: or  <x08=%i0,<s08=%i4,>x08=%i0
or  %i0,%i4,%i0

# qhasm:   x09 |= s09
# asm 1: or  <x09=int64#2,<s09=int64#13,>x09=int64#2
# asm 2: or  <x09=%i1,<s09=%o3,>x09=%i1
or  %i1,%o3,%i1

# qhasm:   x13 = x13_stack
# asm 1: ldx [%fp+2023-<x13_stack=stack64#24],>x13=int64#5
# asm 2: ldx [%fp+2023-<x13_stack=216],>x13=%i4
ldx [%fp+2023-216],%i4

# qhasm:   x00 ^= x11
# asm 1: xor <x00=int64#6,<x11=int64#11,>x00=int64#6
# asm 2: xor <x00=%i5,<x11=%o1,>x00=%i5
xor %i5,%o1,%i5

# qhasm:   x01 ^= x10
# asm 1: xor <x01=int64#8,<x10=int64#7,>x01=int64#16
# asm 2: xor <x01=%g4,<x10=%g1,>x01=%o7
xor %g4,%g1,%o7

# qhasm:   x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#8],>x07=int64#8
# asm 2: ldx [%fp+2023-<x07_stack=88],>x07=%g4
ldx [%fp+2023-88],%g4

# qhasm:   x08 ^= x19
# asm 1: xor <x08=int64#1,<x19=int64#9,>x08=int64#1
# asm 2: xor <x08=%i0,<x19=%g5,>x08=%i0
xor %i0,%g5,%i0

# qhasm:   x09 ^= x18
# asm 1: xor <x09=int64#2,<x18=int64#4,>x09=int64#2
# asm 2: xor <x09=%i1,<x18=%i3,>x09=%i1
xor %i1,%i3,%i1

# qhasm:   x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#11],>x0e=int64#9
# asm 2: ldx [%fp+2023-<x0e_stack=112],>x0e=%g5
ldx [%fp+2023-112],%g5

# qhasm:   x13 += x06
# asm 1: add <x13=int64#5,<x06=int64#12,>x13=int64#5
# asm 2: add <x13=%i4,<x06=%o2,>x13=%i4
add %i4,%o2,%i4

# qhasm:   x12 += x07
# asm 1: add <x12=int64#3,<x07=int64#8,>x12=int64#8
# asm 2: add <x12=%i2,<x07=%g4,>x12=%g4
add %i2,%g4,%g4

# qhasm:   x1b = x1b_stack
# asm 1: ldx [%fp+2023-<x1b_stack=stack64#17],>x1b=int64#3
# asm 2: ldx [%fp+2023-<x1b_stack=160],>x1b=%i2
ldx [%fp+2023-160],%i2

# qhasm:   x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#28],>x0f=int64#12
# asm 2: ldx [%fp+2023-<x0f_stack=248],>x0f=%o2
ldx [%fp+2023-248],%o2

# qhasm:   x09_stack = x09
# asm 1: stx <x09=int64#2,[%fp+2023->x09_stack=stack64#2]
# asm 2: stx <x09=%i1,[%fp+2023->x09_stack=40]
stx %i1,[%fp+2023-40]

# qhasm:   x02 = x02_stack
# asm 1: ldx [%fp+2023-<x02_stack=stack64#3],>x02=int64#2
# asm 2: ldx [%fp+2023-<x02_stack=48],>x02=%i1
ldx [%fp+2023-48],%i1

# qhasm:   x1b += x0e
# asm 1: add <x1b=int64#3,<x0e=int64#9,>x1b=int64#3
# asm 2: add <x1b=%i2,<x0e=%g5,>x1b=%i2
add %i2,%g5,%i2

# qhasm:   x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#7],>x03=int64#13
# asm 2: ldx [%fp+2023-<x03_stack=80],>x03=%o3
ldx [%fp+2023-80],%o3

# qhasm:   x1a += x0f
# asm 1: add <x1a=int64#14,<x0f=int64#12,>x1a=int64#9
# asm 2: add <x1a=%o4,<x0f=%o2,>x1a=%g5
add %o4,%o2,%g5

# qhasm:   x0a = x0a_stack
# asm 1: ldx [%fp+2023-<x0a_stack=stack64#12],>x0a=int64#15
# asm 2: ldx [%fp+2023-<x0a_stack=120],>x0a=%o5
ldx [%fp+2023-120],%o5

# qhasm:   x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#14],>x0b=int64#18
# asm 2: ldx [%fp+2023-<x0b_stack=136],>x0b=%l1
ldx [%fp+2023-136],%l1

# qhasm:   x17 = x17_stack
# asm 1: ldx [%fp+2023-<x17_stack=stack64#23],>x17=int64#12
# asm 2: ldx [%fp+2023-<x17_stack=208],>x17=%o2
ldx [%fp+2023-208],%o2

# qhasm:   x16 = x16_stack
# asm 1: ldx [%fp+2023-<x16_stack=stack64#21],>x16=int64#14
# asm 2: ldx [%fp+2023-<x16_stack=192],>x16=%o4
ldx [%fp+2023-192],%o4

# qhasm:   x1f = x1f_stack
# asm 1: ldx [%fp+2023-<x1f_stack=stack64#18],>x1f=int64#19
# asm 2: ldx [%fp+2023-<x1f_stack=168],>x1f=%l2
ldx [%fp+2023-168],%l2

# qhasm:   x1e = x1e_stack
# asm 1: ldx [%fp+2023-<x1e_stack=stack64#6],>x1e=int64#20
# asm 2: ldx [%fp+2023-<x1e_stack=72],>x1e=%l3
ldx [%fp+2023-72],%l3

# qhasm:   x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#27],>x06=int64#21
# asm 2: ldx [%fp+2023-<x06_stack=240],>x06=%l4
ldx [%fp+2023-240],%l4

# qhasm:   x17 += x02
# asm 1: add <x17=int64#12,<x02=int64#2,>x17=int64#12
# asm 2: add <x17=%o2,<x02=%i1,>x17=%o2
add %o2,%i1,%o2

# qhasm:   x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#8],>x07=int64#22
# asm 2: ldx [%fp+2023-<x07_stack=88],>x07=%l5
ldx [%fp+2023-88],%l5

# qhasm:   x16 += x03
# asm 1: add <x16=int64#14,<x03=int64#13,>x16=int64#14
# asm 2: add <x16=%o4,<x03=%o3,>x16=%o4
add %o4,%o3,%o4

# qhasm:   x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#11],>x0e=int64#23
# asm 2: ldx [%fp+2023-<x0e_stack=112],>x0e=%l6
ldx [%fp+2023-112],%l6

# qhasm:   x1f += x0a
# asm 1: add <x1f=int64#19,<x0a=int64#15,>x1f=int64#19
# asm 2: add <x1f=%l2,<x0a=%o5,>x1f=%l2
add %l2,%o5,%l2

# qhasm:   x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#28],>x0f=int64#24
# asm 2: ldx [%fp+2023-<x0f_stack=248],>x0f=%l7
ldx [%fp+2023-248],%l7

# qhasm:   x1e += x0b
# asm 1: add <x1e=int64#20,<x0b=int64#18,>x1e=int64#20
# asm 2: add <x1e=%l3,<x0b=%l1,>x1e=%l3
add %l3,%l1,%l3

# qhasm: x13_stack = x13
# asm 1: stx <x13=int64#5,[%fp+2023->x13_stack=stack64#8]
# asm 2: stx <x13=%i4,[%fp+2023->x13_stack=88]
stx %i4,[%fp+2023-88]

# qhasm: x1b_stack = x1b
# asm 1: stx <x1b=int64#3,[%fp+2023->x1b_stack=stack64#14]
# asm 2: stx <x1b=%i2,[%fp+2023->x1b_stack=136]
stx %i2,[%fp+2023-136]

# qhasm:   s06 = x06 << 11
# asm 1: sllx <x06=int64#21,11,>s06=int64#3
# asm 2: sllx <x06=%l4,11,>s06=%i2
sllx %l4,11,%i2

# qhasm:   s07 = x07 << 11
# asm 1: sllx <x07=int64#22,11,>s07=int64#5
# asm 2: sllx <x07=%l5,11,>s07=%i4
sllx %l5,11,%i4

# qhasm:   (uint32) x06 >>= 21
# asm 1: srl <x06=int64#21,21,>x06=int64#21
# asm 2: srl <x06=%l4,21,>x06=%l4
srl %l4,21,%l4

# qhasm:   (uint32) x07 >>= 21
# asm 1: srl <x07=int64#22,21,>x07=int64#22
# asm 2: srl <x07=%l5,21,>x07=%l5
srl %l5,21,%l5

# qhasm:   x17_stack = x17
# asm 1: stx <x17=int64#12,[%fp+2023->x17_stack=stack64#12]
# asm 2: stx <x17=%o2,[%fp+2023->x17_stack=120]
stx %o2,[%fp+2023-120]

# qhasm:   x06 |= s06
# asm 1: or  <x06=int64#21,<s06=int64#3,>x06=int64#3
# asm 2: or  <x06=%l4,<s06=%i2,>x06=%i2
or  %l4,%i2,%i2

# qhasm:   x07 |= s07
# asm 1: or  <x07=int64#22,<s07=int64#5,>x07=int64#5
# asm 2: or  <x07=%l5,<s07=%i4,>x07=%i4
or  %l5,%i4,%i4

# qhasm:   x16_stack = x16
# asm 1: stx <x16=int64#14,[%fp+2023->x16_stack=stack64#11]
# asm 2: stx <x16=%o4,[%fp+2023->x16_stack=112]
stx %o4,[%fp+2023-112]

# qhasm:   s0e = x0e << 11
# asm 1: sllx <x0e=int64#23,11,>s0e=int64#21
# asm 2: sllx <x0e=%l6,11,>s0e=%l4
sllx %l6,11,%l4

# qhasm:   s0f = x0f << 11
# asm 1: sllx <x0f=int64#24,11,>s0f=int64#22
# asm 2: sllx <x0f=%l7,11,>s0f=%l5
sllx %l7,11,%l5

# qhasm:   x1f_stack = x1f
# asm 1: stx <x1f=int64#19,[%fp+2023->x1f_stack=stack64#18]
# asm 2: stx <x1f=%l2,[%fp+2023->x1f_stack=168]
stx %l2,[%fp+2023-168]

# qhasm:   (uint32) x0e >>= 21
# asm 1: srl <x0e=int64#23,21,>x0e=int64#23
# asm 2: srl <x0e=%l6,21,>x0e=%l6
srl %l6,21,%l6

# qhasm:   (uint32) x0f >>= 21
# asm 1: srl <x0f=int64#24,21,>x0f=int64#24
# asm 2: srl <x0f=%l7,21,>x0f=%l7
srl %l7,21,%l7

# qhasm:   x1e_stack = x1e
# asm 1: stx <x1e=int64#20,[%fp+2023->x1e_stack=stack64#17]
# asm 2: stx <x1e=%l3,[%fp+2023->x1e_stack=160]
stx %l3,[%fp+2023-160]

# qhasm:   x0e |= s0e
# asm 1: or  <x0e=int64#23,<s0e=int64#21,>x0e=int64#21
# asm 2: or  <x0e=%l6,<s0e=%l4,>x0e=%l4
or  %l6,%l4,%l4

# qhasm:   x0f |= s0f
# asm 1: or  <x0f=int64#24,<s0f=int64#22,>x0f=int64#22
# asm 2: or  <x0f=%l7,<s0f=%l5,>x0f=%l5
or  %l7,%l5,%l5

# qhasm: r = r_stack
# asm 1: ldx [%fp+2023-<r_stack=stack64#26],>r=int64#23
# asm 2: ldx [%fp+2023-<r_stack=232],>r=%l6
ldx [%fp+2023-232],%l6

# qhasm:   x06 ^= x17
# asm 1: xor <x06=int64#3,<x17=int64#12,>x06=int64#12
# asm 2: xor <x06=%i2,<x17=%o2,>x06=%o2
xor %i2,%o2,%o2

# qhasm:   x07 ^= x16
# asm 1: xor <x07=int64#5,<x16=int64#14,>x07=int64#14
# asm 2: xor <x07=%i4,<x16=%o4,>x07=%o4
xor %i4,%o4,%o4

# qhasm:   x06_stack = x06
# asm 1: stx <x06=int64#12,[%fp+2023->x06_stack=stack64#23]
# asm 2: stx <x06=%o2,[%fp+2023->x06_stack=208]
stx %o2,[%fp+2023-208]

# qhasm:   x0e ^= x1f
# asm 1: xor <x0e=int64#21,<x1f=int64#19,>x0e=int64#3
# asm 2: xor <x0e=%l4,<x1f=%l2,>x0e=%i2
xor %l4,%l2,%i2

# qhasm:   x0f ^= x1e
# asm 1: xor <x0f=int64#22,<x1e=int64#20,>x0f=int64#5
# asm 2: xor <x0f=%l5,<x1e=%l3,>x0f=%i4
xor %l5,%l3,%i4

# qhasm:   x07_stack = x07
# asm 1: stx <x07=int64#14,[%fp+2023->x07_stack=stack64#24]
# asm 2: stx <x07=%o4,[%fp+2023->x07_stack=216]
stx %o4,[%fp+2023-216]

# qhasm:   s0b = x0b << 11
# asm 1: sllx <x0b=int64#18,11,>s0b=int64#19
# asm 2: sllx <x0b=%l1,11,>s0b=%l2
sllx %l1,11,%l2

# qhasm:   s0a = x0a << 11
# asm 1: sllx <x0a=int64#15,11,>s0a=int64#20
# asm 2: sllx <x0a=%o5,11,>s0a=%l3
sllx %o5,11,%l3

# qhasm:   x0e_stack = x0e
# asm 1: stx <x0e=int64#3,[%fp+2023->x0e_stack=stack64#6]
# asm 2: stx <x0e=%i2,[%fp+2023->x0e_stack=72]
stx %i2,[%fp+2023-72]

# qhasm:   (uint32) x0b >>= 21
# asm 1: srl <x0b=int64#18,21,>x0b=int64#3
# asm 2: srl <x0b=%l1,21,>x0b=%i2
srl %l1,21,%i2

# qhasm:   (uint32) x0a >>= 21
# asm 1: srl <x0a=int64#15,21,>x0a=int64#15
# asm 2: srl <x0a=%o5,21,>x0a=%o5
srl %o5,21,%o5

# qhasm:   x0f_stack = x0f
# asm 1: stx <x0f=int64#5,[%fp+2023->x0f_stack=stack64#7]
# asm 2: stx <x0f=%i4,[%fp+2023->x0f_stack=80]
stx %i4,[%fp+2023-80]

# qhasm:   x0b |= s0b
# asm 1: or  <x0b=int64#3,<s0b=int64#19,>x0b=int64#3
# asm 2: or  <x0b=%i2,<s0b=%l2,>x0b=%i2
or  %i2,%l2,%i2

# qhasm:   x0a |= s0a
# asm 1: or  <x0a=int64#15,<s0a=int64#20,>x0a=int64#5
# asm 2: or  <x0a=%o5,<s0a=%l3,>x0a=%i4
or  %o5,%l3,%i4

# qhasm:   x13 = x13_stack
# asm 1: ldx [%fp+2023-<x13_stack=stack64#8],>x13=int64#15
# asm 2: ldx [%fp+2023-<x13_stack=88],>x13=%o5
ldx [%fp+2023-88],%o5

# qhasm:   s03 = x03 << 11
# asm 1: sllx <x03=int64#13,11,>s03=int64#18
# asm 2: sllx <x03=%o3,11,>s03=%l1
sllx %o3,11,%l1

# qhasm:   s02 = x02 << 11
# asm 1: sllx <x02=int64#2,11,>s02=int64#19
# asm 2: sllx <x02=%i1,11,>s02=%l2
sllx %i1,11,%l2

# qhasm:   x1b = x1b_stack
# asm 1: ldx [%fp+2023-<x1b_stack=stack64#14],>x1b=int64#20
# asm 2: ldx [%fp+2023-<x1b_stack=136],>x1b=%l3
ldx [%fp+2023-136],%l3

# qhasm:   (uint32) x03 >>= 21
# asm 1: srl <x03=int64#13,21,>x03=int64#13
# asm 2: srl <x03=%o3,21,>x03=%o3
srl %o3,21,%o3

# qhasm:   (uint32) x02 >>= 21
# asm 1: srl <x02=int64#2,21,>x02=int64#2
# asm 2: srl <x02=%i1,21,>x02=%i1
srl %i1,21,%i1

# qhasm:   x03 |= s03
# asm 1: or  <x03=int64#13,<s03=int64#18,>x03=int64#18
# asm 2: or  <x03=%o3,<s03=%l1,>x03=%l1
or  %o3,%l1,%l1

# qhasm:   x02 |= s02
# asm 1: or  <x02=int64#2,<s02=int64#19,>x02=int64#2
# asm 2: or  <x02=%i1,<s02=%l2,>x02=%i1
or  %i1,%l2,%i1

# qhasm:                    unsigned>? r -= 2
# asm 1: subcc <r=int64#23,2,>r=int64#19
# asm 2: subcc <r=%l6,2,>r=%l2
subcc %l6,2,%l2

# qhasm:   x02 ^= x13
# asm 1: xor <x02=int64#2,<x13=int64#15,>x02=int64#13
# asm 2: xor <x02=%i1,<x13=%o5,>x02=%o3
xor %i1,%o5,%o3

# qhasm:   x03 ^= x12
# asm 1: xor <x03=int64#18,<x12=int64#8,>x03=int64#15
# asm 2: xor <x03=%l1,<x12=%g4,>x03=%o5
xor %l1,%g4,%o5

# qhasm:   x03_stack = x03
# asm 1: stx <x03=int64#15,[%fp+2023->x03_stack=stack64#21]
# asm 2: stx <x03=%o5,[%fp+2023->x03_stack=192]
stx %o5,[%fp+2023-192]

# qhasm:   x0a ^= x1b
# asm 1: xor <x0a=int64#5,<x1b=int64#20,>x0a=int64#5
# asm 2: xor <x0a=%i4,<x1b=%l3,>x0a=%i4
xor %i4,%l3,%i4

# qhasm:   x0b ^= x1a
# asm 1: xor <x0b=int64#3,<x1a=int64#9,>x0b=int64#2
# asm 2: xor <x0b=%i2,<x1a=%g5,>x0b=%i1
xor %i2,%g5,%i1

# qhasm:   x0b_stack = x0b
# asm 1: stx <x0b=int64#2,[%fp+2023->x0b_stack=stack64#3]
# asm 2: stx <x0b=%i1,[%fp+2023->x0b_stack=48]
stx %i1,[%fp+2023-48]

# qhasm: goto morerounds if unsigned>
bgu,pt %xcc,._morerounds
nop

# qhasm:   finalization = finalization_stack
# asm 1: ldx [%fp+2023-<finalization_stack=stack64#19],>finalization=int64#18
# asm 2: ldx [%fp+2023-<finalization_stack=176],>finalization=%l1
ldx [%fp+2023-176],%l1

# qhasm:   in = in_stack
# asm 1: ldx [%fp+2023-<in_stack=stack64#25],>in=int64#2
# asm 2: ldx [%fp+2023-<in_stack=224],>in=%i1
ldx [%fp+2023-224],%i1

# qhasm:   inlen = inlen_stack
# asm 1: ldx [%fp+2023-<inlen_stack=stack64#20],>inlen=int64#3
# asm 2: ldx [%fp+2023-<inlen_stack=184],>inlen=%i2
ldx [%fp+2023-184],%i2

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
# asm 1: subcc <finalization=int64#18,1,%g0
# asm 2: subcc <finalization=%l1,1,%g0
subcc %l1,1,%g0

# qhasm: goto finalization1 if =
be,pt %xcc,._finalization1
nop

# qhasm:                       =? finalization - 2
# asm 1: subcc <finalization=int64#18,2,%g0
# asm 2: subcc <finalization=%l1,2,%g0
subcc %l1,2,%g0

# qhasm: goto finalization2 if =
be,pt %xcc,._finalization2
nop

# qhasm:   z = &tmp
# asm 1: add %fp,1999->tmp=stack256#1,>z=int64#18
# asm 2: add %fp,1999->tmp=0,>z=%l1
add %fp,1999-0,%l1

# qhasm:   *(uint64 *) (z + 0) = 0
# asm 1: stx %g0,[<z=int64#18+0]
# asm 2: stx %g0,[<z=%l1+0]
stx %g0,[%l1+0]

# qhasm:   *(uint64 *) (z + 8) = 0
# asm 1: stx %g0,[<z=int64#18+8]
# asm 2: stx %g0,[<z=%l1+8]
stx %g0,[%l1+8]

# qhasm:   *(uint64 *) (z + 16) = 0
# asm 1: stx %g0,[<z=int64#18+16]
# asm 2: stx %g0,[<z=%l1+16]
stx %g0,[%l1+16]

# qhasm:   *(uint64 *) (z + 24) = 0
# asm 1: stx %g0,[<z=int64#18+24]
# asm 2: stx %g0,[<z=%l1+24]
stx %g0,[%l1+24]

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
# asm 1: ldub [<in=int64#2+0],>y00=int64#19
# asm 2: ldub [<in=%i1+0],>y00=%l2
ldub [%i1+0],%l2

# qhasm:     in += 1
# asm 1: add <in=int64#2,1,>in=int64#2
# asm 2: add <in=%i1,1,>in=%i1
add %i1,1,%i1

# qhasm:     *(uint8 *) (z + 0) = y00
# asm 1: stb <y00=int64#19,[<z=int64#18+0]
# asm 2: stb <y00=%l2,[<z=%l1+0]
stb %l2,[%l1+0]

# qhasm:     z += 1
# asm 1: add <z=int64#18,1,>z=int64#18
# asm 2: add <z=%l1,1,>z=%l1
add %l1,1,%l1

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
# asm 1: stb <y00=int64#2,[<z=int64#18+0]
# asm 2: stb <y00=%i1,[<z=%l1+0]
stb %i1,[%l1+0]

# qhasm:   in = &tmp
# asm 1: add %fp,1999->tmp=stack256#1,>in=int64#2
# asm 2: add %fp,1999->tmp=0,>in=%i1
add %fp,1999-0,%i1

# qhasm:   finalization = 1
# asm 1: add %g0,1,>finalization=int64#18
# asm 2: add %g0,1,>finalization=%l1
add %g0,1,%l1

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
# asm 1: ldx [%fp+2023-<x1f_stack=stack64#18],>x1f=int64#12
# asm 2: ldx [%fp+2023-<x1f_stack=168],>x1f=%o2
ldx [%fp+2023-168],%o2

# qhasm:   x1f ^= 1
# asm 1: xor <x1f=int64#12,1,>x1f=int64#12
# asm 2: xor <x1f=%o2,1,>x1f=%o2
xor %o2,1,%o2

# qhasm:   x1f_stack = x1f
# asm 1: stx <x1f=int64#12,[%fp+2023->x1f_stack=stack64#18]
# asm 2: stx <x1f=%o2,[%fp+2023->x1f_stack=168]
stx %o2,[%fp+2023-168]

# qhasm:   r = 160
# asm 1: add %g0,160,>r=int64#19
# asm 2: add %g0,160,>r=%l2
add %g0,160,%l2

# qhasm:   finalization = 2
# asm 1: add %g0,2,>finalization=int64#12
# asm 2: add %g0,2,>finalization=%o2
add %g0,2,%o2

# qhasm:   finalization_stack = finalization
# asm 1: stx <finalization=int64#12,[%fp+2023->finalization_stack=stack64#19]
# asm 2: stx <finalization=%o2,[%fp+2023->finalization_stack=176]
stx %o2,[%fp+2023-176]

# qhasm:   in_stack = in
# asm 1: stx <in=int64#2,[%fp+2023->in_stack=stack64#25]
# asm 2: stx <in=%i1,[%fp+2023->in_stack=224]
stx %i1,[%fp+2023-224]

# qhasm:   inlen_stack = inlen
# asm 1: stx <inlen=int64#3,[%fp+2023->inlen_stack=stack64#20]
# asm 2: stx <inlen=%i2,[%fp+2023->inlen_stack=184]
stx %i2,[%fp+2023-184]

# qhasm: goto morerounds
b ._morerounds
nop

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: ldx [%fp+2023-<out_stack=stack64#1],>out=int64#2
# asm 2: ldx [%fp+2023-<out_stack=32],>out=%i1
ldx [%fp+2023-32],%i1

# qhasm:   x03 = x03_stack
# asm 1: ldx [%fp+2023-<x03_stack=stack64#21],>x03=int64#3
# asm 2: ldx [%fp+2023-<x03_stack=192],>x03=%i2
ldx [%fp+2023-192],%i2

# qhasm:   x05 = x05_stack
# asm 1: ldx [%fp+2023-<x05_stack=stack64#22],>x05=int64#4
# asm 2: ldx [%fp+2023-<x05_stack=200],>x05=%i3
ldx [%fp+2023-200],%i3

# qhasm:   x06 = x06_stack
# asm 1: ldx [%fp+2023-<x06_stack=stack64#23],>x06=int64#7
# asm 2: ldx [%fp+2023-<x06_stack=208],>x06=%g1
ldx [%fp+2023-208],%g1

# qhasm:   x07 = x07_stack
# asm 1: ldx [%fp+2023-<x07_stack=stack64#24],>x07=int64#8
# asm 2: ldx [%fp+2023-<x07_stack=216],>x07=%g4
ldx [%fp+2023-216],%g4

# qhasm:   *(uint8 *) (out + 0) = x00
# asm 1: stb <x00=int64#6,[<out=int64#2+0]
# asm 2: stb <x00=%i5,[<out=%i1+0]
stb %i5,[%i1+0]

# qhasm:   (uint32) x00 >>= 8
# asm 1: srl <x00=int64#6,8,>x00=int64#6
# asm 2: srl <x00=%i5,8,>x00=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 4) = x01
# asm 1: stb <x01=int64#16,[<out=int64#2+4]
# asm 2: stb <x01=%o7,[<out=%i1+4]
stb %o7,[%i1+4]

# qhasm:   (uint32) x01 >>= 8
# asm 1: srl <x01=int64#16,8,>x01=int64#9
# asm 2: srl <x01=%o7,8,>x01=%g5
srl %o7,8,%g5

# qhasm:   *(uint8 *) (out + 8) = x02
# asm 1: stb <x02=int64#13,[<out=int64#2+8]
# asm 2: stb <x02=%o3,[<out=%i1+8]
stb %o3,[%i1+8]

# qhasm:   (uint32) x02 >>= 8
# asm 1: srl <x02=int64#13,8,>x02=int64#11
# asm 2: srl <x02=%o3,8,>x02=%o1
srl %o3,8,%o1

# qhasm:   *(uint8 *) (out + 12) = x03
# asm 1: stb <x03=int64#3,[<out=int64#2+12]
# asm 2: stb <x03=%i2,[<out=%i1+12]
stb %i2,[%i1+12]

# qhasm:   (uint32) x03 >>= 8
# asm 1: srl <x03=int64#3,8,>x03=int64#3
# asm 2: srl <x03=%i2,8,>x03=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 16) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+16]
# asm 2: stb <x04=%o0,[<out=%i1+16]
stb %o0,[%i1+16]

# qhasm:   (uint32) x04 >>= 8
# asm 1: srl <x04=int64#10,8,>x04=int64#10
# asm 2: srl <x04=%o0,8,>x04=%o0
srl %o0,8,%o0

# qhasm:   *(uint8 *) (out + 20) = x05
# asm 1: stb <x05=int64#4,[<out=int64#2+20]
# asm 2: stb <x05=%i3,[<out=%i1+20]
stb %i3,[%i1+20]

# qhasm:   (uint32) x05 >>= 8
# asm 1: srl <x05=int64#4,8,>x05=int64#4
# asm 2: srl <x05=%i3,8,>x05=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 24) = x06
# asm 1: stb <x06=int64#7,[<out=int64#2+24]
# asm 2: stb <x06=%g1,[<out=%i1+24]
stb %g1,[%i1+24]

# qhasm:   (uint32) x06 >>= 8
# asm 1: srl <x06=int64#7,8,>x06=int64#7
# asm 2: srl <x06=%g1,8,>x06=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 28) = x07
# asm 1: stb <x07=int64#8,[<out=int64#2+28]
# asm 2: stb <x07=%g4,[<out=%i1+28]
stb %g4,[%i1+28]

# qhasm:   (uint32) x07 >>= 8
# asm 1: srl <x07=int64#8,8,>x07=int64#8
# asm 2: srl <x07=%g4,8,>x07=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 1) = x00
# asm 1: stb <x00=int64#6,[<out=int64#2+1]
# asm 2: stb <x00=%i5,[<out=%i1+1]
stb %i5,[%i1+1]

# qhasm:   (uint32) x00 >>= 8
# asm 1: srl <x00=int64#6,8,>x00=int64#6
# asm 2: srl <x00=%i5,8,>x00=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 5) = x01
# asm 1: stb <x01=int64#9,[<out=int64#2+5]
# asm 2: stb <x01=%g5,[<out=%i1+5]
stb %g5,[%i1+5]

# qhasm:   (uint32) x01 >>= 8
# asm 1: srl <x01=int64#9,8,>x01=int64#9
# asm 2: srl <x01=%g5,8,>x01=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 9) = x02
# asm 1: stb <x02=int64#11,[<out=int64#2+9]
# asm 2: stb <x02=%o1,[<out=%i1+9]
stb %o1,[%i1+9]

# qhasm:   (uint32) x02 >>= 8
# asm 1: srl <x02=int64#11,8,>x02=int64#11
# asm 2: srl <x02=%o1,8,>x02=%o1
srl %o1,8,%o1

# qhasm:   *(uint8 *) (out + 13) = x03
# asm 1: stb <x03=int64#3,[<out=int64#2+13]
# asm 2: stb <x03=%i2,[<out=%i1+13]
stb %i2,[%i1+13]

# qhasm:   (uint32) x03 >>= 8
# asm 1: srl <x03=int64#3,8,>x03=int64#3
# asm 2: srl <x03=%i2,8,>x03=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 17) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+17]
# asm 2: stb <x04=%o0,[<out=%i1+17]
stb %o0,[%i1+17]

# qhasm:   (uint32) x04 >>= 8
# asm 1: srl <x04=int64#10,8,>x04=int64#10
# asm 2: srl <x04=%o0,8,>x04=%o0
srl %o0,8,%o0

# qhasm:   *(uint8 *) (out + 21) = x05
# asm 1: stb <x05=int64#4,[<out=int64#2+21]
# asm 2: stb <x05=%i3,[<out=%i1+21]
stb %i3,[%i1+21]

# qhasm:   (uint32) x05 >>= 8
# asm 1: srl <x05=int64#4,8,>x05=int64#4
# asm 2: srl <x05=%i3,8,>x05=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 25) = x06
# asm 1: stb <x06=int64#7,[<out=int64#2+25]
# asm 2: stb <x06=%g1,[<out=%i1+25]
stb %g1,[%i1+25]

# qhasm:   (uint32) x06 >>= 8
# asm 1: srl <x06=int64#7,8,>x06=int64#7
# asm 2: srl <x06=%g1,8,>x06=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 29) = x07
# asm 1: stb <x07=int64#8,[<out=int64#2+29]
# asm 2: stb <x07=%g4,[<out=%i1+29]
stb %g4,[%i1+29]

# qhasm:   (uint32) x07 >>= 8
# asm 1: srl <x07=int64#8,8,>x07=int64#8
# asm 2: srl <x07=%g4,8,>x07=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 2) = x00
# asm 1: stb <x00=int64#6,[<out=int64#2+2]
# asm 2: stb <x00=%i5,[<out=%i1+2]
stb %i5,[%i1+2]

# qhasm:   (uint32) x00 >>= 8
# asm 1: srl <x00=int64#6,8,>x00=int64#6
# asm 2: srl <x00=%i5,8,>x00=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 6) = x01
# asm 1: stb <x01=int64#9,[<out=int64#2+6]
# asm 2: stb <x01=%g5,[<out=%i1+6]
stb %g5,[%i1+6]

# qhasm:   (uint32) x01 >>= 8
# asm 1: srl <x01=int64#9,8,>x01=int64#9
# asm 2: srl <x01=%g5,8,>x01=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 10) = x02
# asm 1: stb <x02=int64#11,[<out=int64#2+10]
# asm 2: stb <x02=%o1,[<out=%i1+10]
stb %o1,[%i1+10]

# qhasm:   (uint32) x02 >>= 8
# asm 1: srl <x02=int64#11,8,>x02=int64#11
# asm 2: srl <x02=%o1,8,>x02=%o1
srl %o1,8,%o1

# qhasm:   *(uint8 *) (out + 14) = x03
# asm 1: stb <x03=int64#3,[<out=int64#2+14]
# asm 2: stb <x03=%i2,[<out=%i1+14]
stb %i2,[%i1+14]

# qhasm:   (uint32) x03 >>= 8
# asm 1: srl <x03=int64#3,8,>x03=int64#3
# asm 2: srl <x03=%i2,8,>x03=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 18) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+18]
# asm 2: stb <x04=%o0,[<out=%i1+18]
stb %o0,[%i1+18]

# qhasm:   (uint32) x04 >>= 8
# asm 1: srl <x04=int64#10,8,>x04=int64#10
# asm 2: srl <x04=%o0,8,>x04=%o0
srl %o0,8,%o0

# qhasm:   *(uint8 *) (out + 22) = x05
# asm 1: stb <x05=int64#4,[<out=int64#2+22]
# asm 2: stb <x05=%i3,[<out=%i1+22]
stb %i3,[%i1+22]

# qhasm:   (uint32) x05 >>= 8
# asm 1: srl <x05=int64#4,8,>x05=int64#4
# asm 2: srl <x05=%i3,8,>x05=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 26) = x06
# asm 1: stb <x06=int64#7,[<out=int64#2+26]
# asm 2: stb <x06=%g1,[<out=%i1+26]
stb %g1,[%i1+26]

# qhasm:   (uint32) x06 >>= 8
# asm 1: srl <x06=int64#7,8,>x06=int64#7
# asm 2: srl <x06=%g1,8,>x06=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 30) = x07
# asm 1: stb <x07=int64#8,[<out=int64#2+30]
# asm 2: stb <x07=%g4,[<out=%i1+30]
stb %g4,[%i1+30]

# qhasm:   (uint32) x07 >>= 8
# asm 1: srl <x07=int64#8,8,>x07=int64#8
# asm 2: srl <x07=%g4,8,>x07=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 3) = x00
# asm 1: stb <x00=int64#6,[<out=int64#2+3]
# asm 2: stb <x00=%i5,[<out=%i1+3]
stb %i5,[%i1+3]

# qhasm:   *(uint8 *) (out + 7) = x01
# asm 1: stb <x01=int64#9,[<out=int64#2+7]
# asm 2: stb <x01=%g5,[<out=%i1+7]
stb %g5,[%i1+7]

# qhasm:   *(uint8 *) (out + 11) = x02
# asm 1: stb <x02=int64#11,[<out=int64#2+11]
# asm 2: stb <x02=%o1,[<out=%i1+11]
stb %o1,[%i1+11]

# qhasm:   *(uint8 *) (out + 15) = x03
# asm 1: stb <x03=int64#3,[<out=int64#2+15]
# asm 2: stb <x03=%i2,[<out=%i1+15]
stb %i2,[%i1+15]

# qhasm:   *(uint8 *) (out + 19) = x04
# asm 1: stb <x04=int64#10,[<out=int64#2+19]
# asm 2: stb <x04=%o0,[<out=%i1+19]
stb %o0,[%i1+19]

# qhasm:   *(uint8 *) (out + 23) = x05
# asm 1: stb <x05=int64#4,[<out=int64#2+23]
# asm 2: stb <x05=%i3,[<out=%i1+23]
stb %i3,[%i1+23]

# qhasm:   *(uint8 *) (out + 27) = x06
# asm 1: stb <x06=int64#7,[<out=int64#2+27]
# asm 2: stb <x06=%g1,[<out=%i1+27]
stb %g1,[%i1+27]

# qhasm:   *(uint8 *) (out + 31) = x07
# asm 1: stb <x07=int64#8,[<out=int64#2+31]
# asm 2: stb <x07=%g4,[<out=%i1+31]
stb %g4,[%i1+31]

# qhasm:   x09 = x09_stack
# asm 1: ldx [%fp+2023-<x09_stack=stack64#2],>x09=int64#3
# asm 2: ldx [%fp+2023-<x09_stack=40],>x09=%i2
ldx [%fp+2023-40],%i2

# qhasm:   x0b = x0b_stack
# asm 1: ldx [%fp+2023-<x0b_stack=stack64#3],>x0b=int64#4
# asm 2: ldx [%fp+2023-<x0b_stack=48],>x0b=%i3
ldx [%fp+2023-48],%i3

# qhasm:   x0c = x0c_stack
# asm 1: ldx [%fp+2023-<x0c_stack=stack64#4],>x0c=int64#6
# asm 2: ldx [%fp+2023-<x0c_stack=56],>x0c=%i5
ldx [%fp+2023-56],%i5

# qhasm:   x0d = x0d_stack
# asm 1: ldx [%fp+2023-<x0d_stack=stack64#5],>x0d=int64#7
# asm 2: ldx [%fp+2023-<x0d_stack=64],>x0d=%g1
ldx [%fp+2023-64],%g1

# qhasm:   x0e = x0e_stack
# asm 1: ldx [%fp+2023-<x0e_stack=stack64#6],>x0e=int64#8
# asm 2: ldx [%fp+2023-<x0e_stack=72],>x0e=%g4
ldx [%fp+2023-72],%g4

# qhasm:   x0f = x0f_stack
# asm 1: ldx [%fp+2023-<x0f_stack=stack64#7],>x0f=int64#9
# asm 2: ldx [%fp+2023-<x0f_stack=80],>x0f=%g5
ldx [%fp+2023-80],%g5

# qhasm:   *(uint8 *) (out + 32) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+32]
# asm 2: stb <x08=%i0,[<out=%i1+32]
stb %i0,[%i1+32]

# qhasm:   (uint32) x08 >>= 8
# asm 1: srl <x08=int64#1,8,>x08=int64#1
# asm 2: srl <x08=%i0,8,>x08=%i0
srl %i0,8,%i0

# qhasm:   *(uint8 *) (out + 36) = x09
# asm 1: stb <x09=int64#3,[<out=int64#2+36]
# asm 2: stb <x09=%i2,[<out=%i1+36]
stb %i2,[%i1+36]

# qhasm:   (uint32) x09 >>= 8
# asm 1: srl <x09=int64#3,8,>x09=int64#3
# asm 2: srl <x09=%i2,8,>x09=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 40) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+40]
# asm 2: stb <x0a=%i4,[<out=%i1+40]
stb %i4,[%i1+40]

# qhasm:   (uint32) x0a >>= 8
# asm 1: srl <x0a=int64#5,8,>x0a=int64#5
# asm 2: srl <x0a=%i4,8,>x0a=%i4
srl %i4,8,%i4

# qhasm:   *(uint8 *) (out + 44) = x0b
# asm 1: stb <x0b=int64#4,[<out=int64#2+44]
# asm 2: stb <x0b=%i3,[<out=%i1+44]
stb %i3,[%i1+44]

# qhasm:   (uint32) x0b >>= 8
# asm 1: srl <x0b=int64#4,8,>x0b=int64#4
# asm 2: srl <x0b=%i3,8,>x0b=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 48) = x0c
# asm 1: stb <x0c=int64#6,[<out=int64#2+48]
# asm 2: stb <x0c=%i5,[<out=%i1+48]
stb %i5,[%i1+48]

# qhasm:   (uint32) x0c >>= 8
# asm 1: srl <x0c=int64#6,8,>x0c=int64#6
# asm 2: srl <x0c=%i5,8,>x0c=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 52) = x0d
# asm 1: stb <x0d=int64#7,[<out=int64#2+52]
# asm 2: stb <x0d=%g1,[<out=%i1+52]
stb %g1,[%i1+52]

# qhasm:   (uint32) x0d >>= 8
# asm 1: srl <x0d=int64#7,8,>x0d=int64#7
# asm 2: srl <x0d=%g1,8,>x0d=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 56) = x0e
# asm 1: stb <x0e=int64#8,[<out=int64#2+56]
# asm 2: stb <x0e=%g4,[<out=%i1+56]
stb %g4,[%i1+56]

# qhasm:   (uint32) x0e >>= 8
# asm 1: srl <x0e=int64#8,8,>x0e=int64#8
# asm 2: srl <x0e=%g4,8,>x0e=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 60) = x0f
# asm 1: stb <x0f=int64#9,[<out=int64#2+60]
# asm 2: stb <x0f=%g5,[<out=%i1+60]
stb %g5,[%i1+60]

# qhasm:   (uint32) x0f >>= 8
# asm 1: srl <x0f=int64#9,8,>x0f=int64#9
# asm 2: srl <x0f=%g5,8,>x0f=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 33) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+33]
# asm 2: stb <x08=%i0,[<out=%i1+33]
stb %i0,[%i1+33]

# qhasm:   (uint32) x08 >>= 8
# asm 1: srl <x08=int64#1,8,>x08=int64#1
# asm 2: srl <x08=%i0,8,>x08=%i0
srl %i0,8,%i0

# qhasm:   *(uint8 *) (out + 37) = x09
# asm 1: stb <x09=int64#3,[<out=int64#2+37]
# asm 2: stb <x09=%i2,[<out=%i1+37]
stb %i2,[%i1+37]

# qhasm:   (uint32) x09 >>= 8
# asm 1: srl <x09=int64#3,8,>x09=int64#3
# asm 2: srl <x09=%i2,8,>x09=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 41) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+41]
# asm 2: stb <x0a=%i4,[<out=%i1+41]
stb %i4,[%i1+41]

# qhasm:   (uint32) x0a >>= 8
# asm 1: srl <x0a=int64#5,8,>x0a=int64#5
# asm 2: srl <x0a=%i4,8,>x0a=%i4
srl %i4,8,%i4

# qhasm:   *(uint8 *) (out + 45) = x0b
# asm 1: stb <x0b=int64#4,[<out=int64#2+45]
# asm 2: stb <x0b=%i3,[<out=%i1+45]
stb %i3,[%i1+45]

# qhasm:   (uint32) x0b >>= 8
# asm 1: srl <x0b=int64#4,8,>x0b=int64#4
# asm 2: srl <x0b=%i3,8,>x0b=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 49) = x0c
# asm 1: stb <x0c=int64#6,[<out=int64#2+49]
# asm 2: stb <x0c=%i5,[<out=%i1+49]
stb %i5,[%i1+49]

# qhasm:   (uint32) x0c >>= 8
# asm 1: srl <x0c=int64#6,8,>x0c=int64#6
# asm 2: srl <x0c=%i5,8,>x0c=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 53) = x0d
# asm 1: stb <x0d=int64#7,[<out=int64#2+53]
# asm 2: stb <x0d=%g1,[<out=%i1+53]
stb %g1,[%i1+53]

# qhasm:   (uint32) x0d >>= 8
# asm 1: srl <x0d=int64#7,8,>x0d=int64#7
# asm 2: srl <x0d=%g1,8,>x0d=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 57) = x0e
# asm 1: stb <x0e=int64#8,[<out=int64#2+57]
# asm 2: stb <x0e=%g4,[<out=%i1+57]
stb %g4,[%i1+57]

# qhasm:   (uint32) x0e >>= 8
# asm 1: srl <x0e=int64#8,8,>x0e=int64#8
# asm 2: srl <x0e=%g4,8,>x0e=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 61) = x0f
# asm 1: stb <x0f=int64#9,[<out=int64#2+61]
# asm 2: stb <x0f=%g5,[<out=%i1+61]
stb %g5,[%i1+61]

# qhasm:   (uint32) x0f >>= 8
# asm 1: srl <x0f=int64#9,8,>x0f=int64#9
# asm 2: srl <x0f=%g5,8,>x0f=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 34) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+34]
# asm 2: stb <x08=%i0,[<out=%i1+34]
stb %i0,[%i1+34]

# qhasm:   (uint32) x08 >>= 8
# asm 1: srl <x08=int64#1,8,>x08=int64#1
# asm 2: srl <x08=%i0,8,>x08=%i0
srl %i0,8,%i0

# qhasm:   *(uint8 *) (out + 38) = x09
# asm 1: stb <x09=int64#3,[<out=int64#2+38]
# asm 2: stb <x09=%i2,[<out=%i1+38]
stb %i2,[%i1+38]

# qhasm:   (uint32) x09 >>= 8
# asm 1: srl <x09=int64#3,8,>x09=int64#3
# asm 2: srl <x09=%i2,8,>x09=%i2
srl %i2,8,%i2

# qhasm:   *(uint8 *) (out + 42) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+42]
# asm 2: stb <x0a=%i4,[<out=%i1+42]
stb %i4,[%i1+42]

# qhasm:   (uint32) x0a >>= 8
# asm 1: srl <x0a=int64#5,8,>x0a=int64#5
# asm 2: srl <x0a=%i4,8,>x0a=%i4
srl %i4,8,%i4

# qhasm:   *(uint8 *) (out + 46) = x0b
# asm 1: stb <x0b=int64#4,[<out=int64#2+46]
# asm 2: stb <x0b=%i3,[<out=%i1+46]
stb %i3,[%i1+46]

# qhasm:   (uint32) x0b >>= 8
# asm 1: srl <x0b=int64#4,8,>x0b=int64#4
# asm 2: srl <x0b=%i3,8,>x0b=%i3
srl %i3,8,%i3

# qhasm:   *(uint8 *) (out + 50) = x0c
# asm 1: stb <x0c=int64#6,[<out=int64#2+50]
# asm 2: stb <x0c=%i5,[<out=%i1+50]
stb %i5,[%i1+50]

# qhasm:   (uint32) x0c >>= 8
# asm 1: srl <x0c=int64#6,8,>x0c=int64#6
# asm 2: srl <x0c=%i5,8,>x0c=%i5
srl %i5,8,%i5

# qhasm:   *(uint8 *) (out + 54) = x0d
# asm 1: stb <x0d=int64#7,[<out=int64#2+54]
# asm 2: stb <x0d=%g1,[<out=%i1+54]
stb %g1,[%i1+54]

# qhasm:   (uint32) x0d >>= 8
# asm 1: srl <x0d=int64#7,8,>x0d=int64#7
# asm 2: srl <x0d=%g1,8,>x0d=%g1
srl %g1,8,%g1

# qhasm:   *(uint8 *) (out + 58) = x0e
# asm 1: stb <x0e=int64#8,[<out=int64#2+58]
# asm 2: stb <x0e=%g4,[<out=%i1+58]
stb %g4,[%i1+58]

# qhasm:   (uint32) x0e >>= 8
# asm 1: srl <x0e=int64#8,8,>x0e=int64#8
# asm 2: srl <x0e=%g4,8,>x0e=%g4
srl %g4,8,%g4

# qhasm:   *(uint8 *) (out + 62) = x0f
# asm 1: stb <x0f=int64#9,[<out=int64#2+62]
# asm 2: stb <x0f=%g5,[<out=%i1+62]
stb %g5,[%i1+62]

# qhasm:   (uint32) x0f >>= 8
# asm 1: srl <x0f=int64#9,8,>x0f=int64#9
# asm 2: srl <x0f=%g5,8,>x0f=%g5
srl %g5,8,%g5

# qhasm:   *(uint8 *) (out + 35) = x08
# asm 1: stb <x08=int64#1,[<out=int64#2+35]
# asm 2: stb <x08=%i0,[<out=%i1+35]
stb %i0,[%i1+35]

# qhasm:   *(uint8 *) (out + 39) = x09
# asm 1: stb <x09=int64#3,[<out=int64#2+39]
# asm 2: stb <x09=%i2,[<out=%i1+39]
stb %i2,[%i1+39]

# qhasm:   *(uint8 *) (out + 43) = x0a
# asm 1: stb <x0a=int64#5,[<out=int64#2+43]
# asm 2: stb <x0a=%i4,[<out=%i1+43]
stb %i4,[%i1+43]

# qhasm:   *(uint8 *) (out + 47) = x0b
# asm 1: stb <x0b=int64#4,[<out=int64#2+47]
# asm 2: stb <x0b=%i3,[<out=%i1+47]
stb %i3,[%i1+47]

# qhasm:   *(uint8 *) (out + 51) = x0c
# asm 1: stb <x0c=int64#6,[<out=int64#2+51]
# asm 2: stb <x0c=%i5,[<out=%i1+51]
stb %i5,[%i1+51]

# qhasm:   *(uint8 *) (out + 55) = x0d
# asm 1: stb <x0d=int64#7,[<out=int64#2+55]
# asm 2: stb <x0d=%g1,[<out=%i1+55]
stb %g1,[%i1+55]

# qhasm:   *(uint8 *) (out + 59) = x0e
# asm 1: stb <x0e=int64#8,[<out=int64#2+59]
# asm 2: stb <x0e=%g4,[<out=%i1+59]
stb %g4,[%i1+59]

# qhasm:   *(uint8 *) (out + 63) = x0f
# asm 1: stb <x0f=int64#9,[<out=int64#2+63]
# asm 2: stb <x0f=%g5,[<out=%i1+63]
stb %g5,[%i1+63]

# qhasm:   result = 0
# asm 1: add %g0,0,>result=int64#1
# asm 2: add %g0,0,>result=%i0
add %g0,0,%i0

# qhasm: leave
ret
restore
