
# qhasm: int64 ctxp

# qhasm: int64 iv_plainp

# qhasm: input ctxp

# qhasm: input iv_plainp

# qhasm: int64 constants

# qhasm: int64 constants_low

# qhasm: int64 tx0

# qhasm: int64 tx1

# qhasm: int64 tx2

# qhasm: int64 tx3

# qhasm: int64 table0

# qhasm: int64 table1

# qhasm: int64 table2

# qhasm: int64 table3

# qhasm: int64 y0

# qhasm: int64 y1

# qhasm: int64 y2

# qhasm: int64 y3

# qhasm: int64 z0

# qhasm: int64 z1

# qhasm: int64 z2

# qhasm: int64 z3

# qhasm: int64 p00

# qhasm: int64 p01

# qhasm: int64 p02

# qhasm: int64 p03

# qhasm: int64 p10

# qhasm: int64 p11

# qhasm: int64 p12

# qhasm: int64 p13

# qhasm: int64 p20

# qhasm: int64 p21

# qhasm: int64 p22

# qhasm: int64 p23

# qhasm: int64 p30

# qhasm: int64 p31

# qhasm: int64 p32

# qhasm: int64 p33

# qhasm: int64 mask1

# qhasm: int64 mask2

# qhasm: int64 mask3

# qhasm: stack64 x0

# qhasm: stack64 x1

# qhasm: stack64 x2

# qhasm: stack64 x3

# qhasm: stack64 x4

# qhasm: stack64 x5

# qhasm: stack64 x6

# qhasm: stack64 x7

# qhasm: stack64 x8

# qhasm: stack64 x9

# qhasm: stack64 x10

# qhasm: stack64 x11

# qhasm: stack64 x12

# qhasm: stack64 x13

# qhasm: stack64 x14

# qhasm: stack64 x15

# qhasm: stack64 x16

# qhasm: stack64 x17

# qhasm: stack64 x18

# qhasm: stack64 x19

# qhasm: stack64 x20

# qhasm: stack64 x21

# qhasm: stack64 x22

# qhasm: stack64 x23

# qhasm: stack64 x24

# qhasm: stack64 x25

# qhasm: stack64 x26

# qhasm: stack64 x27

# qhasm: stack64 x28

# qhasm: stack64 x29

# qhasm: stack64 x30

# qhasm: stack64 x31

# qhasm: stack64 x32

# qhasm: stack64 x33

# qhasm: stack64 x34

# qhasm: stack64 x35

# qhasm: stack64 x36

# qhasm: stack64 x37

# qhasm: stack64 x38

# qhasm: stack64 x39

# qhasm: stack64 x40

# qhasm: stack64 x41

# qhasm: stack64 x42

# qhasm: stack64 x43

# qhasm: enter ECRYPT_ivsetup
.section ".text"
.align 32
.global ECRYPT_ivsetup
ECRYPT_ivsetup:
save %sp,-528,%sp

# qhasm: constants = (aes_little_constants & 0xfffffc0000000000) >> 32
# asm 1: sethi %hh(aes_little_constants),>constants=int64#3
# asm 2: sethi %hh(aes_little_constants),>constants=%i2
sethi %hh(aes_little_constants),%i2

# qhasm: constants_low = aes_little_constants & 0xfffffc00
# asm 1: sethi %lm(aes_little_constants),>constants_low=int64#4
# asm 2: sethi %lm(aes_little_constants),>constants_low=%i3
sethi %lm(aes_little_constants),%i3

# qhasm: constants |= (aes_little_constants & 0x3ff00000000) >> 32
# asm 1: or <constants=int64#3,%hm(aes_little_constants),>constants=int64#3
# asm 2: or <constants=%i2,%hm(aes_little_constants),>constants=%i2
or %i2,%hm(aes_little_constants),%i2

# qhasm: constants_low |= aes_little_constants & 0x3ff
# asm 1: or <constants_low=int64#4,%lo(aes_little_constants),>constants_low=int64#4
# asm 2: or <constants_low=%i3,%lo(aes_little_constants),>constants_low=%i3
or %i3,%lo(aes_little_constants),%i3

# qhasm: constants <<= 32
# asm 1: sllx <constants=int64#3,32,>constants=int64#3
# asm 2: sllx <constants=%i2,32,>constants=%i2
sllx %i2,32,%i2

# qhasm: constants |= constants_low
# asm 1: or  <constants=int64#3,<constants_low=int64#4,>constants=int64#3
# asm 2: or  <constants=%i2,<constants_low=%i3,>constants=%i2
or  %i2,%i3,%i2

# qhasm: y0 = *(uint32 *) (iv_plainp + 0)
# asm 1: lduw [<iv_plainp=int64#2+0],>y0=int64#4
# asm 2: lduw [<iv_plainp=%i1+0],>y0=%i3
lduw [%i1+0],%i3

# qhasm: y1 = *(uint32 *) (iv_plainp + 4)
# asm 1: lduw [<iv_plainp=int64#2+4],>y1=int64#5
# asm 2: lduw [<iv_plainp=%i1+4],>y1=%i4
lduw [%i1+4],%i4

# qhasm: y2 = *(uint32 *) (iv_plainp + 8)
# asm 1: lduw [<iv_plainp=int64#2+8],>y2=int64#6
# asm 2: lduw [<iv_plainp=%i1+8],>y2=%i5
lduw [%i1+8],%i5

# qhasm: y3 = *(uint32 *) (iv_plainp + 12)
# asm 1: lduw [<iv_plainp=int64#2+12],>y3=int64#2
# asm 2: lduw [<iv_plainp=%i1+12],>y3=%i1
lduw [%i1+12],%i1

# qhasm: tx0 = *(uint32 *) (ctxp + 0) 
# asm 1: lduw [<ctxp=int64#1+0],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+0],>tx0=%g1
lduw [%i0+0],%g1

# qhasm: table0 = constants + 40
# asm 1: add <constants=int64#3,40,>table0=int64#8
# asm 2: add <constants=%i2,40,>table0=%g4
add %i2,40,%g4

# qhasm: table1 = constants + 48
# asm 1: add <constants=int64#3,48,>table1=int64#9
# asm 2: add <constants=%i2,48,>table1=%g5
add %i2,48,%g5

# qhasm: tx1 = *(uint32 *) (ctxp + 4) 
# asm 1: lduw [<ctxp=int64#1+4],>tx1=int64#10
# asm 2: lduw [<ctxp=%i0+4],>tx1=%o0
lduw [%i0+4],%o0

# qhasm: table2 = constants + 44
# asm 1: add <constants=int64#3,44,>table2=int64#11
# asm 2: add <constants=%i2,44,>table2=%o1
add %i2,44,%o1

# qhasm: table3 = constants + 52
# asm 1: add <constants=int64#3,52,>table3=int64#3
# asm 2: add <constants=%i2,52,>table3=%i2
add %i2,52,%i2

# qhasm: tx2 = *(uint32 *) (ctxp + 8) 
# asm 1: lduw [<ctxp=int64#1+8],>tx2=int64#12
# asm 2: lduw [<ctxp=%i0+8],>tx2=%o2
lduw [%i0+8],%o2

# qhasm: mask1 = 0xff
# asm 1: add %g0,0xff,>mask1=int64#13
# asm 2: add %g0,0xff,>mask1=%o3
add %g0,0xff,%o3

# qhasm: mask1 <<= 24
# asm 1: sllx <mask1=int64#13,24,>mask1=int64#13
# asm 2: sllx <mask1=%o3,24,>mask1=%o3
sllx %o3,24,%o3

# qhasm: tx3 = *(uint32 *) (ctxp + 12)
# asm 1: lduw [<ctxp=int64#1+12],>tx3=int64#14
# asm 2: lduw [<ctxp=%i0+12],>tx3=%o4
lduw [%i0+12],%o4

# qhasm: mask2 = 0xff
# asm 1: add %g0,0xff,>mask2=int64#15
# asm 2: add %g0,0xff,>mask2=%o5
add %g0,0xff,%o5

# qhasm: mask2 <<= 16
# asm 1: sllx <mask2=int64#15,16,>mask2=int64#15
# asm 2: sllx <mask2=%o5,16,>mask2=%o5
sllx %o5,16,%o5

# qhasm: x0 = tx0
# asm 1: stx <tx0=int64#7,[%fp+2023->x0=stack64#1]
# asm 2: stx <tx0=%g1,[%fp+2023->x0=0]
stx %g1,[%fp+2023-0]

# qhasm: mask3 = 0xff
# asm 1: add %g0,0xff,>mask3=int64#16
# asm 2: add %g0,0xff,>mask3=%o7
add %g0,0xff,%o7

# qhasm: mask3 <<= 8
# asm 1: sllx <mask3=int64#16,8,>mask3=int64#16
# asm 2: sllx <mask3=%o7,8,>mask3=%o7
sllx %o7,8,%o7

# qhasm: x1 = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x1=stack64#2]
# asm 2: stx <tx1=%o0,[%fp+2023->x1=8]
stx %o0,[%fp+2023-8]

# qhasm: x2 = tx2
# asm 1: stx <tx2=int64#12,[%fp+2023->x2=stack64#3]
# asm 2: stx <tx2=%o2,[%fp+2023->x2=16]
stx %o2,[%fp+2023-16]

# qhasm: x3 = tx3
# asm 1: stx <tx3=int64#14,[%fp+2023->x3=stack64#4]
# asm 2: stx <tx3=%o4,[%fp+2023->x3=24]
stx %o4,[%fp+2023-24]

# qhasm: y0 ^= tx0
# asm 1: xor <y0=int64#4,<tx0=int64#7,>y0=int64#4
# asm 2: xor <y0=%i3,<tx0=%g1,>y0=%i3
xor %i3,%g1,%i3

# qhasm: y1 ^= tx1
# asm 1: xor <y1=int64#5,<tx1=int64#10,>y1=int64#5
# asm 2: xor <y1=%i4,<tx1=%o0,>y1=%i4
xor %i4,%o0,%i4

# qhasm: y2 ^= tx2
# asm 1: xor <y2=int64#6,<tx2=int64#12,>y2=int64#6
# asm 2: xor <y2=%i5,<tx2=%o2,>y2=%i5
xor %i5,%o2,%i5

# qhasm: y3 ^= tx3
# asm 1: xor <y3=int64#2,<tx3=int64#14,>y3=int64#2
# asm 2: xor <y3=%i1,<tx3=%o4,>y3=%i1
xor %i1,%o4,%i1

# qhasm: tx0 = *(uint32 *) (ctxp + 16)
# asm 1: lduw [<ctxp=int64#1+16],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+16],>tx0=%g1
lduw [%i0+16],%g1

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x4  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x4=stack64#5]
# asm 2: stx <tx0=%g1,[%fp+2023->x4=32]
stx %g1,[%fp+2023-32]

# qhasm: tx0 = *(uint32 *) (ctxp + 20) 
# asm 1: lduw [<ctxp=int64#1+20],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+20],>tx0=%g1
lduw [%i0+20],%g1

# qhasm: x5  = tx1 
# asm 1: stx <tx1=int64#10,[%fp+2023->x5=stack64#6]
# asm 2: stx <tx1=%o0,[%fp+2023->x5=40]
stx %o0,[%fp+2023-40]

# qhasm: x6  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x6=stack64#7]
# asm 2: stx <tx2=%o2,[%fp+2023->x6=48]
stx %o2,[%fp+2023-48]

# qhasm: x7  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x7=stack64#8]
# asm 2: stx <tx3=%o4,[%fp+2023->x7=56]
stx %o4,[%fp+2023-56]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x8  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x8=stack64#9]
# asm 2: stx <tx0=%g1,[%fp+2023->x8=64]
stx %g1,[%fp+2023-64]

# qhasm: tx0 = *(uint32 *) (ctxp + 24) 
# asm 1: lduw [<ctxp=int64#1+24],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+24],>tx0=%g1
lduw [%i0+24],%g1

# qhasm: x9  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x9=stack64#10]
# asm 2: stx <tx1=%o0,[%fp+2023->x9=72]
stx %o0,[%fp+2023-72]

# qhasm: x10  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x10=stack64#11]
# asm 2: stx <tx2=%o2,[%fp+2023->x10=80]
stx %o2,[%fp+2023-80]

# qhasm: x11  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x11=stack64#12]
# asm 2: stx <tx3=%o4,[%fp+2023->x11=88]
stx %o4,[%fp+2023-88]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x12  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x12=stack64#13]
# asm 2: stx <tx0=%g1,[%fp+2023->x12=96]
stx %g1,[%fp+2023-96]

# qhasm: tx0 = *(uint32 *) (ctxp + 28) 
# asm 1: lduw [<ctxp=int64#1+28],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+28],>tx0=%g1
lduw [%i0+28],%g1

# qhasm: x13  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x13=stack64#14]
# asm 2: stx <tx1=%o0,[%fp+2023->x13=104]
stx %o0,[%fp+2023-104]

# qhasm: x14  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x14=stack64#15]
# asm 2: stx <tx2=%o2,[%fp+2023->x14=112]
stx %o2,[%fp+2023-112]

# qhasm: x15  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x15=stack64#16]
# asm 2: stx <tx3=%o4,[%fp+2023->x15=120]
stx %o4,[%fp+2023-120]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x16  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x16=stack64#17]
# asm 2: stx <tx0=%g1,[%fp+2023->x16=128]
stx %g1,[%fp+2023-128]

# qhasm: tx0 = *(uint32 *) (ctxp + 32) 
# asm 1: lduw [<ctxp=int64#1+32],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+32],>tx0=%g1
lduw [%i0+32],%g1

# qhasm: x17  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x17=stack64#18]
# asm 2: stx <tx1=%o0,[%fp+2023->x17=136]
stx %o0,[%fp+2023-136]

# qhasm: x18  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x18=stack64#19]
# asm 2: stx <tx2=%o2,[%fp+2023->x18=144]
stx %o2,[%fp+2023-144]

# qhasm: x19  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x19=stack64#20]
# asm 2: stx <tx3=%o4,[%fp+2023->x19=152]
stx %o4,[%fp+2023-152]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x20  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x20=stack64#21]
# asm 2: stx <tx0=%g1,[%fp+2023->x20=160]
stx %g1,[%fp+2023-160]

# qhasm: tx0 = *(uint32 *) (ctxp + 36) 
# asm 1: lduw [<ctxp=int64#1+36],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+36],>tx0=%g1
lduw [%i0+36],%g1

# qhasm: x21  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x21=stack64#22]
# asm 2: stx <tx1=%o0,[%fp+2023->x21=168]
stx %o0,[%fp+2023-168]

# qhasm: x22  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x22=stack64#23]
# asm 2: stx <tx2=%o2,[%fp+2023->x22=176]
stx %o2,[%fp+2023-176]

# qhasm: x23  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x23=stack64#24]
# asm 2: stx <tx3=%o4,[%fp+2023->x23=184]
stx %o4,[%fp+2023-184]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x24  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x24=stack64#25]
# asm 2: stx <tx0=%g1,[%fp+2023->x24=192]
stx %g1,[%fp+2023-192]

# qhasm: tx0 = *(uint32 *) (ctxp + 40) 
# asm 1: lduw [<ctxp=int64#1+40],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+40],>tx0=%g1
lduw [%i0+40],%g1

# qhasm: x25  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x25=stack64#26]
# asm 2: stx <tx1=%o0,[%fp+2023->x25=200]
stx %o0,[%fp+2023-200]

# qhasm: x26  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x26=stack64#27]
# asm 2: stx <tx2=%o2,[%fp+2023->x26=208]
stx %o2,[%fp+2023-208]

# qhasm: x27  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x27=stack64#28]
# asm 2: stx <tx3=%o4,[%fp+2023->x27=216]
stx %o4,[%fp+2023-216]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x28  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x28=stack64#29]
# asm 2: stx <tx0=%g1,[%fp+2023->x28=224]
stx %g1,[%fp+2023-224]

# qhasm: tx0 = *(uint32 *) (ctxp + 44) 
# asm 1: lduw [<ctxp=int64#1+44],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+44],>tx0=%g1
lduw [%i0+44],%g1

# qhasm: x29  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x29=stack64#30]
# asm 2: stx <tx1=%o0,[%fp+2023->x29=232]
stx %o0,[%fp+2023-232]

# qhasm: x30  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x30=stack64#31]
# asm 2: stx <tx2=%o2,[%fp+2023->x30=240]
stx %o2,[%fp+2023-240]

# qhasm: x31  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x31=stack64#32]
# asm 2: stx <tx3=%o4,[%fp+2023->x31=248]
stx %o4,[%fp+2023-248]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x32  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x32=stack64#33]
# asm 2: stx <tx0=%g1,[%fp+2023->x32=256]
stx %g1,[%fp+2023-256]

# qhasm: tx0 = *(uint32 *) (ctxp + 48) 
# asm 1: lduw [<ctxp=int64#1+48],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+48],>tx0=%g1
lduw [%i0+48],%g1

# qhasm: x33  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x33=stack64#34]
# asm 2: stx <tx1=%o0,[%fp+2023->x33=264]
stx %o0,[%fp+2023-264]

# qhasm: x34  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x34=stack64#35]
# asm 2: stx <tx2=%o2,[%fp+2023->x34=272]
stx %o2,[%fp+2023-272]

# qhasm: x35  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x35=stack64#36]
# asm 2: stx <tx3=%o4,[%fp+2023->x35=280]
stx %o4,[%fp+2023-280]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x36  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x36=stack64#37]
# asm 2: stx <tx0=%g1,[%fp+2023->x36=288]
stx %g1,[%fp+2023-288]

# qhasm: tx0 = *(uint32 *) (ctxp + 52) 
# asm 1: lduw [<ctxp=int64#1+52],>tx0=int64#7
# asm 2: lduw [<ctxp=%i0+52],>tx0=%g1
lduw [%i0+52],%g1

# qhasm: x37  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x37=stack64#38]
# asm 2: stx <tx1=%o0,[%fp+2023->x37=296]
stx %o0,[%fp+2023-296]

# qhasm: x38  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x38=stack64#39]
# asm 2: stx <tx2=%o2,[%fp+2023->x38=304]
stx %o2,[%fp+2023-304]

# qhasm: x39  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x39=stack64#40]
# asm 2: stx <tx3=%o4,[%fp+2023->x39=312]
stx %o4,[%fp+2023-312]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#10,<tx0=int64#7,>tx1=int64#10
# asm 2: xor <tx1=%o0,<tx0=%g1,>tx1=%o0
xor %o0,%g1,%o0

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#12,<tx1=int64#10,>tx2=int64#12
# asm 2: xor <tx2=%o2,<tx1=%o0,>tx2=%o2
xor %o2,%o0,%o2

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#12,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o2,>tx3=%o4
xor %o4,%o2,%o4

# qhasm: x40  = tx0 
# asm 1: stx <tx0=int64#7,[%fp+2023->x40=stack64#41]
# asm 2: stx <tx0=%g1,[%fp+2023->x40=320]
stx %g1,[%fp+2023-320]

# qhasm: x41  = tx1
# asm 1: stx <tx1=int64#10,[%fp+2023->x41=stack64#42]
# asm 2: stx <tx1=%o0,[%fp+2023->x41=328]
stx %o0,[%fp+2023-328]

# qhasm: x42  = tx2 
# asm 1: stx <tx2=int64#12,[%fp+2023->x42=stack64#43]
# asm 2: stx <tx2=%o2,[%fp+2023->x42=336]
stx %o2,[%fp+2023-336]

# qhasm: x43  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x43=stack64#44]
# asm 2: stx <tx3=%o4,[%fp+2023->x43=344]
stx %o4,[%fp+2023-344]

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#4,4,>p00=int64#7
# asm 2: sll <y0=%i3,4,>p00=%g1
sll %i3,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#4,4,>p01=int64#10
# asm 2: srl <y0=%i3,4,>p01=%o0
srl %i3,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x4
# asm 1: ldx [%fp+2023-<x4=stack64#5],>z0=int64#12
# asm 2: ldx [%fp+2023-<x4=32],>z0=%o2
ldx [%fp+2023-32],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#4,12,>p02=int64#14
# asm 2: srl <y0=%i3,12,>p02=%o4
srl %i3,12,%o4

# qhasm: z1 = x5
# asm 1: ldx [%fp+2023-<x5=stack64#6],>z1=int64#17
# asm 2: ldx [%fp+2023-<x5=40],>z1=%l0
ldx [%fp+2023-40],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#4,20,>p03=int64#4
# asm 2: srl <y0=%i3,20,>p03=%i3
srl %i3,20,%i3

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x6
# asm 1: ldx [%fp+2023-<x6=stack64#7],>z2=int64#18
# asm 2: ldx [%fp+2023-<x6=48],>z2=%l1
ldx [%fp+2023-48],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#5,4,>p10=int64#19
# asm 2: sll <y1=%i4,4,>p10=%l2
sll %i4,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#4,4080,>p03=int64#4
# asm 2: and <p03=%i3,4080,>p03=%i3
and %i3,4080,%i3

# qhasm: z3 = x7
# asm 1: ldx [%fp+2023-<x7=stack64#8],>z3=int64#20
# asm 2: ldx [%fp+2023-<x7=56],>z3=%l3
ldx [%fp+2023-56],%l3

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#5,4,>p11=int64#21
# asm 2: srl <y1=%i4,4,>p11=%l4
srl %i4,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#5,12,>p12=int64#22
# asm 2: srl <y1=%i4,12,>p12=%l5
srl %i4,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#5,20,>p13=int64#5
# asm 2: srl <y1=%i4,20,>p13=%i4
srl %i4,20,%i4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#5,4080,>p13=int64#5
# asm 2: and <p13=%i4,4080,>p13=%i4
and %i4,4080,%i4

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#4],>p03=int64#4
# asm 2: lduw [<table3=%i2+<p03=%i3],>p03=%i3
lduw [%i2+%i3],%i3

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#6,4,>p20=int64#12
# asm 2: sll <y2=%i5,4,>p20=%o2
sll %i5,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#6,4,>p21=int64#20
# asm 2: srl <y2=%i5,4,>p21=%l3
srl %i5,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#6,12,>p22=int64#21
# asm 2: srl <y2=%i5,12,>p22=%l4
srl %i5,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#4,>z1=int64#4
# asm 2: xor <z1=%l0,<p03=%i3,>z1=%i3
xor %l0,%i3,%i3

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#6,20,>p23=int64#6
# asm 2: srl <y2=%i5,20,>p23=%i5
srl %i5,20,%i5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#5],>p13=int64#5
# asm 2: lduw [<table3=%i2+<p13=%i4],>p13=%i4
lduw [%i2+%i4],%i4

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#2,4,>p30=int64#22
# asm 2: sll <y3=%i1,4,>p30=%l5
sll %i1,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#6,4080,>p23=int64#6
# asm 2: and <p23=%i5,4080,>p23=%i5
and %i5,4080,%i5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#2,4,>p31=int64#23
# asm 2: srl <y3=%i1,4,>p31=%l6
srl %i1,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#2,12,>p32=int64#20
# asm 2: srl <y3=%i1,12,>p32=%l3
srl %i1,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#4,<p10=int64#19,>z1=int64#4
# asm 2: xor <z1=%i3,<p10=%l2,>z1=%i3
xor %i3,%l2,%i3

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#2,20,>p33=int64#2
# asm 2: srl <y3=%i1,20,>p33=%i1
srl %i1,20,%i1

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#6],>p23=int64#6
# asm 2: lduw [<table3=%i2+<p23=%i5],>p23=%i5
lduw [%i2+%i5],%i5

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#2,4080,>p33=int64#2
# asm 2: and <p33=%i1,4080,>p33=%i1
and %i1,4080,%i1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#5,>z2=int64#5
# asm 2: xor <z2=%o2,<p13=%i4,>z2=%i4
xor %o2,%i4,%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#4,<p21=int64#18,>z1=int64#4
# asm 2: xor <z1=%i3,<p21=%l1,>z1=%i3
xor %i3,%l1,%i3

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#2],>p33=int64#2
# asm 2: lduw [<table3=%i2+<p33=%i1],>p33=%i1
lduw [%i2+%i1],%i1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#6,>z3=int64#6
# asm 2: xor <z3=%o0,<p23=%i5,>z3=%i5
xor %o0,%i5,%i5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#5,<p31=int64#20,>y2=int64#5
# asm 2: xor <z2=%i4,<p31=%l3,>y2=%i4
xor %i4,%l3,%i4

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#6,<p30=int64#21,>y3=int64#6
# asm 2: xor <z3=%i5,<p30=%l4,>y3=%i5
xor %i5,%l4,%i5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#4,<p32=int64#14,>y1=int64#4
# asm 2: xor <z1=%i3,<p32=%o4,>y1=%i3
xor %i3,%o4,%i3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#2,>y0=int64#2
# asm 2: xor <z0=%g1,<p33=%i1,>y0=%i1
xor %g1,%i1,%i1

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#2,4,>p00=int64#7
# asm 2: sll <y0=%i1,4,>p00=%g1
sll %i1,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#2,4,>p01=int64#10
# asm 2: srl <y0=%i1,4,>p01=%o0
srl %i1,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x8
# asm 1: ldx [%fp+2023-<x8=stack64#9],>z0=int64#12
# asm 2: ldx [%fp+2023-<x8=64],>z0=%o2
ldx [%fp+2023-64],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p02=int64#14
# asm 2: srl <y0=%i1,12,>p02=%o4
srl %i1,12,%o4

# qhasm: z1 = x9
# asm 1: ldx [%fp+2023-<x9=stack64#10],>z1=int64#17
# asm 2: ldx [%fp+2023-<x9=72],>z1=%l0
ldx [%fp+2023-72],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p03=int64#2
# asm 2: srl <y0=%i1,20,>p03=%i1
srl %i1,20,%i1

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x10
# asm 1: ldx [%fp+2023-<x10=stack64#11],>z2=int64#18
# asm 2: ldx [%fp+2023-<x10=80],>z2=%l1
ldx [%fp+2023-80],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#4,4,>p10=int64#19
# asm 2: sll <y1=%i3,4,>p10=%l2
sll %i3,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#2,4080,>p03=int64#2
# asm 2: and <p03=%i1,4080,>p03=%i1
and %i1,4080,%i1

# qhasm: z3 = x11
# asm 1: ldx [%fp+2023-<x11=stack64#12],>z3=int64#20
# asm 2: ldx [%fp+2023-<x11=88],>z3=%l3
ldx [%fp+2023-88],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#4,4,>p11=int64#21
# asm 2: srl <y1=%i3,4,>p11=%l4
srl %i3,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#4,12,>p12=int64#22
# asm 2: srl <y1=%i3,12,>p12=%l5
srl %i3,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#4,20,>p13=int64#4
# asm 2: srl <y1=%i3,20,>p13=%i3
srl %i3,20,%i3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#4,4080,>p13=int64#4
# asm 2: and <p13=%i3,4080,>p13=%i3
and %i3,4080,%i3

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#2],>p03=int64#2
# asm 2: lduw [<table3=%i2+<p03=%i1],>p03=%i1
lduw [%i2+%i1],%i1

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#5,4,>p20=int64#12
# asm 2: sll <y2=%i4,4,>p20=%o2
sll %i4,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#5,4,>p21=int64#20
# asm 2: srl <y2=%i4,4,>p21=%l3
srl %i4,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#5,12,>p22=int64#21
# asm 2: srl <y2=%i4,12,>p22=%l4
srl %i4,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#2,>z1=int64#2
# asm 2: xor <z1=%l0,<p03=%i1,>z1=%i1
xor %l0,%i1,%i1

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#5,20,>p23=int64#5
# asm 2: srl <y2=%i4,20,>p23=%i4
srl %i4,20,%i4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#4],>p13=int64#4
# asm 2: lduw [<table3=%i2+<p13=%i3],>p13=%i3
lduw [%i2+%i3],%i3

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#6,4,>p30=int64#22
# asm 2: sll <y3=%i5,4,>p30=%l5
sll %i5,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#5,4080,>p23=int64#5
# asm 2: and <p23=%i4,4080,>p23=%i4
and %i4,4080,%i4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#6,4,>p31=int64#23
# asm 2: srl <y3=%i5,4,>p31=%l6
srl %i5,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#6,12,>p32=int64#20
# asm 2: srl <y3=%i5,12,>p32=%l3
srl %i5,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#2,<p10=int64#19,>z1=int64#2
# asm 2: xor <z1=%i1,<p10=%l2,>z1=%i1
xor %i1,%l2,%i1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#6,20,>p33=int64#6
# asm 2: srl <y3=%i5,20,>p33=%i5
srl %i5,20,%i5

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#5],>p23=int64#5
# asm 2: lduw [<table3=%i2+<p23=%i4],>p23=%i4
lduw [%i2+%i4],%i4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#6,4080,>p33=int64#6
# asm 2: and <p33=%i5,4080,>p33=%i5
and %i5,4080,%i5

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#4,>z2=int64#4
# asm 2: xor <z2=%o2,<p13=%i3,>z2=%i3
xor %o2,%i3,%i3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#2,<p21=int64#18,>z1=int64#2
# asm 2: xor <z1=%i1,<p21=%l1,>z1=%i1
xor %i1,%l1,%i1

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#6],>p33=int64#6
# asm 2: lduw [<table3=%i2+<p33=%i5],>p33=%i5
lduw [%i2+%i5],%i5

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#5,>z3=int64#5
# asm 2: xor <z3=%o0,<p23=%i4,>z3=%i4
xor %o0,%i4,%i4

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#4,<p31=int64#20,>y2=int64#4
# asm 2: xor <z2=%i3,<p31=%l3,>y2=%i3
xor %i3,%l3,%i3

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#5,<p30=int64#21,>y3=int64#5
# asm 2: xor <z3=%i4,<p30=%l4,>y3=%i4
xor %i4,%l4,%i4

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#2,<p32=int64#14,>y1=int64#2
# asm 2: xor <z1=%i1,<p32=%o4,>y1=%i1
xor %i1,%o4,%i1

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#6,>y0=int64#6
# asm 2: xor <z0=%g1,<p33=%i5,>y0=%i5
xor %g1,%i5,%i5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#6,4,>p00=int64#7
# asm 2: sll <y0=%i5,4,>p00=%g1
sll %i5,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#6,4,>p01=int64#10
# asm 2: srl <y0=%i5,4,>p01=%o0
srl %i5,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x12
# asm 1: ldx [%fp+2023-<x12=stack64#13],>z0=int64#12
# asm 2: ldx [%fp+2023-<x12=96],>z0=%o2
ldx [%fp+2023-96],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#6,12,>p02=int64#14
# asm 2: srl <y0=%i5,12,>p02=%o4
srl %i5,12,%o4

# qhasm: z1 = x13
# asm 1: ldx [%fp+2023-<x13=stack64#14],>z1=int64#17
# asm 2: ldx [%fp+2023-<x13=104],>z1=%l0
ldx [%fp+2023-104],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#6,20,>p03=int64#6
# asm 2: srl <y0=%i5,20,>p03=%i5
srl %i5,20,%i5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x14
# asm 1: ldx [%fp+2023-<x14=stack64#15],>z2=int64#18
# asm 2: ldx [%fp+2023-<x14=112],>z2=%l1
ldx [%fp+2023-112],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#2,4,>p10=int64#19
# asm 2: sll <y1=%i1,4,>p10=%l2
sll %i1,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#6,4080,>p03=int64#6
# asm 2: and <p03=%i5,4080,>p03=%i5
and %i5,4080,%i5

# qhasm: z3 = x15
# asm 1: ldx [%fp+2023-<x15=stack64#16],>z3=int64#20
# asm 2: ldx [%fp+2023-<x15=120],>z3=%l3
ldx [%fp+2023-120],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#2,4,>p11=int64#21
# asm 2: srl <y1=%i1,4,>p11=%l4
srl %i1,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#2,12,>p12=int64#22
# asm 2: srl <y1=%i1,12,>p12=%l5
srl %i1,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#2,20,>p13=int64#2
# asm 2: srl <y1=%i1,20,>p13=%i1
srl %i1,20,%i1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#2,4080,>p13=int64#2
# asm 2: and <p13=%i1,4080,>p13=%i1
and %i1,4080,%i1

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#6],>p03=int64#6
# asm 2: lduw [<table3=%i2+<p03=%i5],>p03=%i5
lduw [%i2+%i5],%i5

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#4,4,>p20=int64#12
# asm 2: sll <y2=%i3,4,>p20=%o2
sll %i3,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#4,4,>p21=int64#20
# asm 2: srl <y2=%i3,4,>p21=%l3
srl %i3,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#4,12,>p22=int64#21
# asm 2: srl <y2=%i3,12,>p22=%l4
srl %i3,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#6,>z1=int64#6
# asm 2: xor <z1=%l0,<p03=%i5,>z1=%i5
xor %l0,%i5,%i5

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#4,20,>p23=int64#4
# asm 2: srl <y2=%i3,20,>p23=%i3
srl %i3,20,%i3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#2],>p13=int64#2
# asm 2: lduw [<table3=%i2+<p13=%i1],>p13=%i1
lduw [%i2+%i1],%i1

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#5,4,>p30=int64#22
# asm 2: sll <y3=%i4,4,>p30=%l5
sll %i4,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#4,4080,>p23=int64#4
# asm 2: and <p23=%i3,4080,>p23=%i3
and %i3,4080,%i3

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#5,4,>p31=int64#23
# asm 2: srl <y3=%i4,4,>p31=%l6
srl %i4,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#20
# asm 2: srl <y3=%i4,12,>p32=%l3
srl %i4,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#6,<p10=int64#19,>z1=int64#6
# asm 2: xor <z1=%i5,<p10=%l2,>z1=%i5
xor %i5,%l2,%i5

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#5,20,>p33=int64#5
# asm 2: srl <y3=%i4,20,>p33=%i4
srl %i4,20,%i4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#4],>p23=int64#4
# asm 2: lduw [<table3=%i2+<p23=%i3],>p23=%i3
lduw [%i2+%i3],%i3

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#5,4080,>p33=int64#5
# asm 2: and <p33=%i4,4080,>p33=%i4
and %i4,4080,%i4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#2,>z2=int64#2
# asm 2: xor <z2=%o2,<p13=%i1,>z2=%i1
xor %o2,%i1,%i1

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#6,<p21=int64#18,>z1=int64#6
# asm 2: xor <z1=%i5,<p21=%l1,>z1=%i5
xor %i5,%l1,%i5

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#5],>p33=int64#5
# asm 2: lduw [<table3=%i2+<p33=%i4],>p33=%i4
lduw [%i2+%i4],%i4

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#4,>z3=int64#4
# asm 2: xor <z3=%o0,<p23=%i3,>z3=%i3
xor %o0,%i3,%i3

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#2,<p31=int64#20,>y2=int64#2
# asm 2: xor <z2=%i1,<p31=%l3,>y2=%i1
xor %i1,%l3,%i1

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#4,<p30=int64#21,>y3=int64#4
# asm 2: xor <z3=%i3,<p30=%l4,>y3=%i3
xor %i3,%l4,%i3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#6,<p32=int64#14,>y1=int64#6
# asm 2: xor <z1=%i5,<p32=%o4,>y1=%i5
xor %i5,%o4,%i5

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#5,>y0=int64#5
# asm 2: xor <z0=%g1,<p33=%i4,>y0=%i4
xor %g1,%i4,%i4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#5,4,>p00=int64#7
# asm 2: sll <y0=%i4,4,>p00=%g1
sll %i4,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#5,4,>p01=int64#10
# asm 2: srl <y0=%i4,4,>p01=%o0
srl %i4,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x16
# asm 1: ldx [%fp+2023-<x16=stack64#17],>z0=int64#12
# asm 2: ldx [%fp+2023-<x16=128],>z0=%o2
ldx [%fp+2023-128],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#5,12,>p02=int64#14
# asm 2: srl <y0=%i4,12,>p02=%o4
srl %i4,12,%o4

# qhasm: z1 = x17
# asm 1: ldx [%fp+2023-<x17=stack64#18],>z1=int64#17
# asm 2: ldx [%fp+2023-<x17=136],>z1=%l0
ldx [%fp+2023-136],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#5,20,>p03=int64#5
# asm 2: srl <y0=%i4,20,>p03=%i4
srl %i4,20,%i4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x18
# asm 1: ldx [%fp+2023-<x18=stack64#19],>z2=int64#18
# asm 2: ldx [%fp+2023-<x18=144],>z2=%l1
ldx [%fp+2023-144],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#6,4,>p10=int64#19
# asm 2: sll <y1=%i5,4,>p10=%l2
sll %i5,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#5,4080,>p03=int64#5
# asm 2: and <p03=%i4,4080,>p03=%i4
and %i4,4080,%i4

# qhasm: z3 = x19
# asm 1: ldx [%fp+2023-<x19=stack64#20],>z3=int64#20
# asm 2: ldx [%fp+2023-<x19=152],>z3=%l3
ldx [%fp+2023-152],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#6,4,>p11=int64#21
# asm 2: srl <y1=%i5,4,>p11=%l4
srl %i5,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#6,12,>p12=int64#22
# asm 2: srl <y1=%i5,12,>p12=%l5
srl %i5,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#6,20,>p13=int64#6
# asm 2: srl <y1=%i5,20,>p13=%i5
srl %i5,20,%i5

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#6,4080,>p13=int64#6
# asm 2: and <p13=%i5,4080,>p13=%i5
and %i5,4080,%i5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#5],>p03=int64#5
# asm 2: lduw [<table3=%i2+<p03=%i4],>p03=%i4
lduw [%i2+%i4],%i4

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#2,4,>p20=int64#12
# asm 2: sll <y2=%i1,4,>p20=%o2
sll %i1,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#2,4,>p21=int64#20
# asm 2: srl <y2=%i1,4,>p21=%l3
srl %i1,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#2,12,>p22=int64#21
# asm 2: srl <y2=%i1,12,>p22=%l4
srl %i1,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#5,>z1=int64#5
# asm 2: xor <z1=%l0,<p03=%i4,>z1=%i4
xor %l0,%i4,%i4

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#2,20,>p23=int64#2
# asm 2: srl <y2=%i1,20,>p23=%i1
srl %i1,20,%i1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#6],>p13=int64#6
# asm 2: lduw [<table3=%i2+<p13=%i5],>p13=%i5
lduw [%i2+%i5],%i5

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#4,4,>p30=int64#22
# asm 2: sll <y3=%i3,4,>p30=%l5
sll %i3,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#2,4080,>p23=int64#2
# asm 2: and <p23=%i1,4080,>p23=%i1
and %i1,4080,%i1

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#4,4,>p31=int64#23
# asm 2: srl <y3=%i3,4,>p31=%l6
srl %i3,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#4,12,>p32=int64#20
# asm 2: srl <y3=%i3,12,>p32=%l3
srl %i3,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#5,<p10=int64#19,>z1=int64#5
# asm 2: xor <z1=%i4,<p10=%l2,>z1=%i4
xor %i4,%l2,%i4

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#4,20,>p33=int64#4
# asm 2: srl <y3=%i3,20,>p33=%i3
srl %i3,20,%i3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#2],>p23=int64#2
# asm 2: lduw [<table3=%i2+<p23=%i1],>p23=%i1
lduw [%i2+%i1],%i1

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#4,4080,>p33=int64#4
# asm 2: and <p33=%i3,4080,>p33=%i3
and %i3,4080,%i3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#6,>z2=int64#6
# asm 2: xor <z2=%o2,<p13=%i5,>z2=%i5
xor %o2,%i5,%i5

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#5,<p21=int64#18,>z1=int64#5
# asm 2: xor <z1=%i4,<p21=%l1,>z1=%i4
xor %i4,%l1,%i4

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#4],>p33=int64#4
# asm 2: lduw [<table3=%i2+<p33=%i3],>p33=%i3
lduw [%i2+%i3],%i3

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#2,>z3=int64#2
# asm 2: xor <z3=%o0,<p23=%i1,>z3=%i1
xor %o0,%i1,%i1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#6,<p31=int64#20,>y2=int64#6
# asm 2: xor <z2=%i5,<p31=%l3,>y2=%i5
xor %i5,%l3,%i5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#2,<p30=int64#21,>y3=int64#2
# asm 2: xor <z3=%i1,<p30=%l4,>y3=%i1
xor %i1,%l4,%i1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#5,<p32=int64#14,>y1=int64#5
# asm 2: xor <z1=%i4,<p32=%o4,>y1=%i4
xor %i4,%o4,%i4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#4,>y0=int64#4
# asm 2: xor <z0=%g1,<p33=%i3,>y0=%i3
xor %g1,%i3,%i3

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#4,4,>p00=int64#7
# asm 2: sll <y0=%i3,4,>p00=%g1
sll %i3,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#4,4,>p01=int64#10
# asm 2: srl <y0=%i3,4,>p01=%o0
srl %i3,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x20
# asm 1: ldx [%fp+2023-<x20=stack64#21],>z0=int64#12
# asm 2: ldx [%fp+2023-<x20=160],>z0=%o2
ldx [%fp+2023-160],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#4,12,>p02=int64#14
# asm 2: srl <y0=%i3,12,>p02=%o4
srl %i3,12,%o4

# qhasm: z1 = x21
# asm 1: ldx [%fp+2023-<x21=stack64#22],>z1=int64#17
# asm 2: ldx [%fp+2023-<x21=168],>z1=%l0
ldx [%fp+2023-168],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#4,20,>p03=int64#4
# asm 2: srl <y0=%i3,20,>p03=%i3
srl %i3,20,%i3

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x22
# asm 1: ldx [%fp+2023-<x22=stack64#23],>z2=int64#18
# asm 2: ldx [%fp+2023-<x22=176],>z2=%l1
ldx [%fp+2023-176],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#5,4,>p10=int64#19
# asm 2: sll <y1=%i4,4,>p10=%l2
sll %i4,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#4,4080,>p03=int64#4
# asm 2: and <p03=%i3,4080,>p03=%i3
and %i3,4080,%i3

# qhasm: z3 = x23
# asm 1: ldx [%fp+2023-<x23=stack64#24],>z3=int64#20
# asm 2: ldx [%fp+2023-<x23=184],>z3=%l3
ldx [%fp+2023-184],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#5,4,>p11=int64#21
# asm 2: srl <y1=%i4,4,>p11=%l4
srl %i4,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#5,12,>p12=int64#22
# asm 2: srl <y1=%i4,12,>p12=%l5
srl %i4,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#5,20,>p13=int64#5
# asm 2: srl <y1=%i4,20,>p13=%i4
srl %i4,20,%i4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#5,4080,>p13=int64#5
# asm 2: and <p13=%i4,4080,>p13=%i4
and %i4,4080,%i4

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#4],>p03=int64#4
# asm 2: lduw [<table3=%i2+<p03=%i3],>p03=%i3
lduw [%i2+%i3],%i3

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#6,4,>p20=int64#12
# asm 2: sll <y2=%i5,4,>p20=%o2
sll %i5,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#6,4,>p21=int64#20
# asm 2: srl <y2=%i5,4,>p21=%l3
srl %i5,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#6,12,>p22=int64#21
# asm 2: srl <y2=%i5,12,>p22=%l4
srl %i5,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#4,>z1=int64#4
# asm 2: xor <z1=%l0,<p03=%i3,>z1=%i3
xor %l0,%i3,%i3

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#6,20,>p23=int64#6
# asm 2: srl <y2=%i5,20,>p23=%i5
srl %i5,20,%i5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#5],>p13=int64#5
# asm 2: lduw [<table3=%i2+<p13=%i4],>p13=%i4
lduw [%i2+%i4],%i4

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#2,4,>p30=int64#22
# asm 2: sll <y3=%i1,4,>p30=%l5
sll %i1,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#6,4080,>p23=int64#6
# asm 2: and <p23=%i5,4080,>p23=%i5
and %i5,4080,%i5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#2,4,>p31=int64#23
# asm 2: srl <y3=%i1,4,>p31=%l6
srl %i1,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#2,12,>p32=int64#20
# asm 2: srl <y3=%i1,12,>p32=%l3
srl %i1,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#4,<p10=int64#19,>z1=int64#4
# asm 2: xor <z1=%i3,<p10=%l2,>z1=%i3
xor %i3,%l2,%i3

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#2,20,>p33=int64#2
# asm 2: srl <y3=%i1,20,>p33=%i1
srl %i1,20,%i1

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#6],>p23=int64#6
# asm 2: lduw [<table3=%i2+<p23=%i5],>p23=%i5
lduw [%i2+%i5],%i5

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#2,4080,>p33=int64#2
# asm 2: and <p33=%i1,4080,>p33=%i1
and %i1,4080,%i1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#5,>z2=int64#5
# asm 2: xor <z2=%o2,<p13=%i4,>z2=%i4
xor %o2,%i4,%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#4,<p21=int64#18,>z1=int64#4
# asm 2: xor <z1=%i3,<p21=%l1,>z1=%i3
xor %i3,%l1,%i3

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#2],>p33=int64#2
# asm 2: lduw [<table3=%i2+<p33=%i1],>p33=%i1
lduw [%i2+%i1],%i1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#6,>z3=int64#6
# asm 2: xor <z3=%o0,<p23=%i5,>z3=%i5
xor %o0,%i5,%i5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#5,<p31=int64#20,>y2=int64#5
# asm 2: xor <z2=%i4,<p31=%l3,>y2=%i4
xor %i4,%l3,%i4

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#6,<p30=int64#21,>y3=int64#6
# asm 2: xor <z3=%i5,<p30=%l4,>y3=%i5
xor %i5,%l4,%i5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#4,<p32=int64#14,>y1=int64#4
# asm 2: xor <z1=%i3,<p32=%o4,>y1=%i3
xor %i3,%o4,%i3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#2,>y0=int64#2
# asm 2: xor <z0=%g1,<p33=%i1,>y0=%i1
xor %g1,%i1,%i1

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#2,4,>p00=int64#7
# asm 2: sll <y0=%i1,4,>p00=%g1
sll %i1,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#2,4,>p01=int64#10
# asm 2: srl <y0=%i1,4,>p01=%o0
srl %i1,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x24
# asm 1: ldx [%fp+2023-<x24=stack64#25],>z0=int64#12
# asm 2: ldx [%fp+2023-<x24=192],>z0=%o2
ldx [%fp+2023-192],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p02=int64#14
# asm 2: srl <y0=%i1,12,>p02=%o4
srl %i1,12,%o4

# qhasm: z1 = x25
# asm 1: ldx [%fp+2023-<x25=stack64#26],>z1=int64#17
# asm 2: ldx [%fp+2023-<x25=200],>z1=%l0
ldx [%fp+2023-200],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p03=int64#2
# asm 2: srl <y0=%i1,20,>p03=%i1
srl %i1,20,%i1

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x26
# asm 1: ldx [%fp+2023-<x26=stack64#27],>z2=int64#18
# asm 2: ldx [%fp+2023-<x26=208],>z2=%l1
ldx [%fp+2023-208],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#4,4,>p10=int64#19
# asm 2: sll <y1=%i3,4,>p10=%l2
sll %i3,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#2,4080,>p03=int64#2
# asm 2: and <p03=%i1,4080,>p03=%i1
and %i1,4080,%i1

# qhasm: z3 = x27
# asm 1: ldx [%fp+2023-<x27=stack64#28],>z3=int64#20
# asm 2: ldx [%fp+2023-<x27=216],>z3=%l3
ldx [%fp+2023-216],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#4,4,>p11=int64#21
# asm 2: srl <y1=%i3,4,>p11=%l4
srl %i3,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#4,12,>p12=int64#22
# asm 2: srl <y1=%i3,12,>p12=%l5
srl %i3,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#4,20,>p13=int64#4
# asm 2: srl <y1=%i3,20,>p13=%i3
srl %i3,20,%i3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#4,4080,>p13=int64#4
# asm 2: and <p13=%i3,4080,>p13=%i3
and %i3,4080,%i3

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#2],>p03=int64#2
# asm 2: lduw [<table3=%i2+<p03=%i1],>p03=%i1
lduw [%i2+%i1],%i1

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#5,4,>p20=int64#12
# asm 2: sll <y2=%i4,4,>p20=%o2
sll %i4,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#5,4,>p21=int64#20
# asm 2: srl <y2=%i4,4,>p21=%l3
srl %i4,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#5,12,>p22=int64#21
# asm 2: srl <y2=%i4,12,>p22=%l4
srl %i4,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#2,>z1=int64#2
# asm 2: xor <z1=%l0,<p03=%i1,>z1=%i1
xor %l0,%i1,%i1

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#5,20,>p23=int64#5
# asm 2: srl <y2=%i4,20,>p23=%i4
srl %i4,20,%i4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#4],>p13=int64#4
# asm 2: lduw [<table3=%i2+<p13=%i3],>p13=%i3
lduw [%i2+%i3],%i3

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#6,4,>p30=int64#22
# asm 2: sll <y3=%i5,4,>p30=%l5
sll %i5,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#5,4080,>p23=int64#5
# asm 2: and <p23=%i4,4080,>p23=%i4
and %i4,4080,%i4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#6,4,>p31=int64#23
# asm 2: srl <y3=%i5,4,>p31=%l6
srl %i5,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#6,12,>p32=int64#20
# asm 2: srl <y3=%i5,12,>p32=%l3
srl %i5,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#2,<p10=int64#19,>z1=int64#2
# asm 2: xor <z1=%i1,<p10=%l2,>z1=%i1
xor %i1,%l2,%i1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#6,20,>p33=int64#6
# asm 2: srl <y3=%i5,20,>p33=%i5
srl %i5,20,%i5

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#5],>p23=int64#5
# asm 2: lduw [<table3=%i2+<p23=%i4],>p23=%i4
lduw [%i2+%i4],%i4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#6,4080,>p33=int64#6
# asm 2: and <p33=%i5,4080,>p33=%i5
and %i5,4080,%i5

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#4,>z2=int64#4
# asm 2: xor <z2=%o2,<p13=%i3,>z2=%i3
xor %o2,%i3,%i3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#2,<p21=int64#18,>z1=int64#2
# asm 2: xor <z1=%i1,<p21=%l1,>z1=%i1
xor %i1,%l1,%i1

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#6],>p33=int64#6
# asm 2: lduw [<table3=%i2+<p33=%i5],>p33=%i5
lduw [%i2+%i5],%i5

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#5,>z3=int64#5
# asm 2: xor <z3=%o0,<p23=%i4,>z3=%i4
xor %o0,%i4,%i4

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#4,<p31=int64#20,>y2=int64#4
# asm 2: xor <z2=%i3,<p31=%l3,>y2=%i3
xor %i3,%l3,%i3

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#5,<p30=int64#21,>y3=int64#5
# asm 2: xor <z3=%i4,<p30=%l4,>y3=%i4
xor %i4,%l4,%i4

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#2,<p32=int64#14,>y1=int64#2
# asm 2: xor <z1=%i1,<p32=%o4,>y1=%i1
xor %i1,%o4,%i1

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#6,>y0=int64#6
# asm 2: xor <z0=%g1,<p33=%i5,>y0=%i5
xor %g1,%i5,%i5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#6,4,>p00=int64#7
# asm 2: sll <y0=%i5,4,>p00=%g1
sll %i5,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#6,4,>p01=int64#10
# asm 2: srl <y0=%i5,4,>p01=%o0
srl %i5,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x28
# asm 1: ldx [%fp+2023-<x28=stack64#29],>z0=int64#12
# asm 2: ldx [%fp+2023-<x28=224],>z0=%o2
ldx [%fp+2023-224],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#6,12,>p02=int64#14
# asm 2: srl <y0=%i5,12,>p02=%o4
srl %i5,12,%o4

# qhasm: z1 = x29
# asm 1: ldx [%fp+2023-<x29=stack64#30],>z1=int64#17
# asm 2: ldx [%fp+2023-<x29=232],>z1=%l0
ldx [%fp+2023-232],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#6,20,>p03=int64#6
# asm 2: srl <y0=%i5,20,>p03=%i5
srl %i5,20,%i5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x30
# asm 1: ldx [%fp+2023-<x30=stack64#31],>z2=int64#18
# asm 2: ldx [%fp+2023-<x30=240],>z2=%l1
ldx [%fp+2023-240],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#2,4,>p10=int64#19
# asm 2: sll <y1=%i1,4,>p10=%l2
sll %i1,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#6,4080,>p03=int64#6
# asm 2: and <p03=%i5,4080,>p03=%i5
and %i5,4080,%i5

# qhasm: z3 = x31
# asm 1: ldx [%fp+2023-<x31=stack64#32],>z3=int64#20
# asm 2: ldx [%fp+2023-<x31=248],>z3=%l3
ldx [%fp+2023-248],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#2,4,>p11=int64#21
# asm 2: srl <y1=%i1,4,>p11=%l4
srl %i1,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#2,12,>p12=int64#22
# asm 2: srl <y1=%i1,12,>p12=%l5
srl %i1,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#2,20,>p13=int64#2
# asm 2: srl <y1=%i1,20,>p13=%i1
srl %i1,20,%i1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#2,4080,>p13=int64#2
# asm 2: and <p13=%i1,4080,>p13=%i1
and %i1,4080,%i1

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#6],>p03=int64#6
# asm 2: lduw [<table3=%i2+<p03=%i5],>p03=%i5
lduw [%i2+%i5],%i5

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#4,4,>p20=int64#12
# asm 2: sll <y2=%i3,4,>p20=%o2
sll %i3,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#4,4,>p21=int64#20
# asm 2: srl <y2=%i3,4,>p21=%l3
srl %i3,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#4,12,>p22=int64#21
# asm 2: srl <y2=%i3,12,>p22=%l4
srl %i3,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#6,>z1=int64#6
# asm 2: xor <z1=%l0,<p03=%i5,>z1=%i5
xor %l0,%i5,%i5

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#4,20,>p23=int64#4
# asm 2: srl <y2=%i3,20,>p23=%i3
srl %i3,20,%i3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#2],>p13=int64#2
# asm 2: lduw [<table3=%i2+<p13=%i1],>p13=%i1
lduw [%i2+%i1],%i1

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#5,4,>p30=int64#22
# asm 2: sll <y3=%i4,4,>p30=%l5
sll %i4,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#4,4080,>p23=int64#4
# asm 2: and <p23=%i3,4080,>p23=%i3
and %i3,4080,%i3

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#5,4,>p31=int64#23
# asm 2: srl <y3=%i4,4,>p31=%l6
srl %i4,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#20
# asm 2: srl <y3=%i4,12,>p32=%l3
srl %i4,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#6,<p10=int64#19,>z1=int64#6
# asm 2: xor <z1=%i5,<p10=%l2,>z1=%i5
xor %i5,%l2,%i5

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#5,20,>p33=int64#5
# asm 2: srl <y3=%i4,20,>p33=%i4
srl %i4,20,%i4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#4],>p23=int64#4
# asm 2: lduw [<table3=%i2+<p23=%i3],>p23=%i3
lduw [%i2+%i3],%i3

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#5,4080,>p33=int64#5
# asm 2: and <p33=%i4,4080,>p33=%i4
and %i4,4080,%i4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#2,>z2=int64#2
# asm 2: xor <z2=%o2,<p13=%i1,>z2=%i1
xor %o2,%i1,%i1

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#6,<p21=int64#18,>z1=int64#6
# asm 2: xor <z1=%i5,<p21=%l1,>z1=%i5
xor %i5,%l1,%i5

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#5],>p33=int64#5
# asm 2: lduw [<table3=%i2+<p33=%i4],>p33=%i4
lduw [%i2+%i4],%i4

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#4,>z3=int64#4
# asm 2: xor <z3=%o0,<p23=%i3,>z3=%i3
xor %o0,%i3,%i3

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#2,<p31=int64#20,>y2=int64#2
# asm 2: xor <z2=%i1,<p31=%l3,>y2=%i1
xor %i1,%l3,%i1

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#4,<p30=int64#21,>y3=int64#4
# asm 2: xor <z3=%i3,<p30=%l4,>y3=%i3
xor %i3,%l4,%i3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#6,<p32=int64#14,>y1=int64#6
# asm 2: xor <z1=%i5,<p32=%o4,>y1=%i5
xor %i5,%o4,%i5

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#5,>y0=int64#5
# asm 2: xor <z0=%g1,<p33=%i4,>y0=%i4
xor %g1,%i4,%i4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#5,4,>p00=int64#7
# asm 2: sll <y0=%i4,4,>p00=%g1
sll %i4,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#5,4,>p01=int64#10
# asm 2: srl <y0=%i4,4,>p01=%o0
srl %i4,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x32
# asm 1: ldx [%fp+2023-<x32=stack64#33],>z0=int64#12
# asm 2: ldx [%fp+2023-<x32=256],>z0=%o2
ldx [%fp+2023-256],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#5,12,>p02=int64#14
# asm 2: srl <y0=%i4,12,>p02=%o4
srl %i4,12,%o4

# qhasm: z1 = x33
# asm 1: ldx [%fp+2023-<x33=stack64#34],>z1=int64#17
# asm 2: ldx [%fp+2023-<x33=264],>z1=%l0
ldx [%fp+2023-264],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#5,20,>p03=int64#5
# asm 2: srl <y0=%i4,20,>p03=%i4
srl %i4,20,%i4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x34
# asm 1: ldx [%fp+2023-<x34=stack64#35],>z2=int64#18
# asm 2: ldx [%fp+2023-<x34=272],>z2=%l1
ldx [%fp+2023-272],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#6,4,>p10=int64#19
# asm 2: sll <y1=%i5,4,>p10=%l2
sll %i5,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#5,4080,>p03=int64#5
# asm 2: and <p03=%i4,4080,>p03=%i4
and %i4,4080,%i4

# qhasm: z3 = x35
# asm 1: ldx [%fp+2023-<x35=stack64#36],>z3=int64#20
# asm 2: ldx [%fp+2023-<x35=280],>z3=%l3
ldx [%fp+2023-280],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#6,4,>p11=int64#21
# asm 2: srl <y1=%i5,4,>p11=%l4
srl %i5,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#6,12,>p12=int64#22
# asm 2: srl <y1=%i5,12,>p12=%l5
srl %i5,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#6,20,>p13=int64#6
# asm 2: srl <y1=%i5,20,>p13=%i5
srl %i5,20,%i5

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#6,4080,>p13=int64#6
# asm 2: and <p13=%i5,4080,>p13=%i5
and %i5,4080,%i5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#5],>p03=int64#5
# asm 2: lduw [<table3=%i2+<p03=%i4],>p03=%i4
lduw [%i2+%i4],%i4

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#2,4,>p20=int64#12
# asm 2: sll <y2=%i1,4,>p20=%o2
sll %i1,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#2,4,>p21=int64#20
# asm 2: srl <y2=%i1,4,>p21=%l3
srl %i1,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#2,12,>p22=int64#21
# asm 2: srl <y2=%i1,12,>p22=%l4
srl %i1,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#5,>z1=int64#5
# asm 2: xor <z1=%l0,<p03=%i4,>z1=%i4
xor %l0,%i4,%i4

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#2,20,>p23=int64#2
# asm 2: srl <y2=%i1,20,>p23=%i1
srl %i1,20,%i1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#6],>p13=int64#6
# asm 2: lduw [<table3=%i2+<p13=%i5],>p13=%i5
lduw [%i2+%i5],%i5

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#4,4,>p30=int64#22
# asm 2: sll <y3=%i3,4,>p30=%l5
sll %i3,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#2,4080,>p23=int64#2
# asm 2: and <p23=%i1,4080,>p23=%i1
and %i1,4080,%i1

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#4,4,>p31=int64#23
# asm 2: srl <y3=%i3,4,>p31=%l6
srl %i3,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#4,12,>p32=int64#20
# asm 2: srl <y3=%i3,12,>p32=%l3
srl %i3,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#5,<p10=int64#19,>z1=int64#5
# asm 2: xor <z1=%i4,<p10=%l2,>z1=%i4
xor %i4,%l2,%i4

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#4,20,>p33=int64#4
# asm 2: srl <y3=%i3,20,>p33=%i3
srl %i3,20,%i3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#2],>p23=int64#2
# asm 2: lduw [<table3=%i2+<p23=%i1],>p23=%i1
lduw [%i2+%i1],%i1

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#4,4080,>p33=int64#4
# asm 2: and <p33=%i3,4080,>p33=%i3
and %i3,4080,%i3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#6,>z2=int64#6
# asm 2: xor <z2=%o2,<p13=%i5,>z2=%i5
xor %o2,%i5,%i5

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#5,<p21=int64#18,>z1=int64#5
# asm 2: xor <z1=%i4,<p21=%l1,>z1=%i4
xor %i4,%l1,%i4

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#4],>p33=int64#4
# asm 2: lduw [<table3=%i2+<p33=%i3],>p33=%i3
lduw [%i2+%i3],%i3

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#2,>z3=int64#2
# asm 2: xor <z3=%o0,<p23=%i1,>z3=%i1
xor %o0,%i1,%i1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#6,<p31=int64#20,>y2=int64#6
# asm 2: xor <z2=%i5,<p31=%l3,>y2=%i5
xor %i5,%l3,%i5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#2,<p30=int64#21,>y3=int64#2
# asm 2: xor <z3=%i1,<p30=%l4,>y3=%i1
xor %i1,%l4,%i1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#5,<p32=int64#14,>y1=int64#5
# asm 2: xor <z1=%i4,<p32=%o4,>y1=%i4
xor %i4,%o4,%i4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#4,>y0=int64#4
# asm 2: xor <z0=%g1,<p33=%i3,>y0=%i3
xor %g1,%i3,%i3

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#4,4,>p00=int64#7
# asm 2: sll <y0=%i3,4,>p00=%g1
sll %i3,4,%g1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#7
# asm 2: and <p00=%g1,4080,>p00=%g1
and %g1,4080,%g1

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#4,4,>p01=int64#10
# asm 2: srl <y0=%i3,4,>p01=%o0
srl %i3,4,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#10,4080,>p01=int64#10
# asm 2: and <p01=%o0,4080,>p01=%o0
and %o0,4080,%o0

# qhasm: z0 = x36
# asm 1: ldx [%fp+2023-<x36=stack64#37],>z0=int64#12
# asm 2: ldx [%fp+2023-<x36=288],>z0=%o2
ldx [%fp+2023-288],%o2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#4,12,>p02=int64#14
# asm 2: srl <y0=%i3,12,>p02=%o4
srl %i3,12,%o4

# qhasm: z1 = x37
# asm 1: ldx [%fp+2023-<x37=stack64#38],>z1=int64#17
# asm 2: ldx [%fp+2023-<x37=296],>z1=%l0
ldx [%fp+2023-296],%l0

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#4,20,>p03=int64#4
# asm 2: srl <y0=%i3,20,>p03=%i3
srl %i3,20,%i3

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#14,4080,>p02=int64#14
# asm 2: and <p02=%o4,4080,>p02=%o4
and %o4,4080,%o4

# qhasm: z2 = x38
# asm 1: ldx [%fp+2023-<x38=stack64#39],>z2=int64#18
# asm 2: ldx [%fp+2023-<x38=304],>z2=%l1
ldx [%fp+2023-304],%l1

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#5,4,>p10=int64#19
# asm 2: sll <y1=%i4,4,>p10=%l2
sll %i4,4,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#4,4080,>p03=int64#4
# asm 2: and <p03=%i3,4080,>p03=%i3
and %i3,4080,%i3

# qhasm: z3 = x39
# asm 1: ldx [%fp+2023-<x39=stack64#40],>z3=int64#20
# asm 2: ldx [%fp+2023-<x39=312],>z3=%l3
ldx [%fp+2023-312],%l3

# qhasm: p11 = (uint32) y1 >> 4 
# asm 1: srl <y1=int64#5,4,>p11=int64#21
# asm 2: srl <y1=%i4,4,>p11=%l4
srl %i4,4,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#19,4080,>p10=int64#19
# asm 2: and <p10=%l2,4080,>p10=%l2
and %l2,4080,%l2

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#8+<p00=int64#7],>p00=int64#7
# asm 2: lduw [<table0=%g4+<p00=%g1],>p00=%g1
lduw [%g4+%g1],%g1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#5,12,>p12=int64#22
# asm 2: srl <y1=%i4,12,>p12=%l5
srl %i4,12,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#9+<p01=int64#10],>p01=int64#10
# asm 2: lduw [<table1=%g5+<p01=%o0],>p01=%o0
lduw [%g5+%o0],%o0

# qhasm: p13 = (uint32) y1 >> 20 
# asm 1: srl <y1=int64#5,20,>p13=int64#5
# asm 2: srl <y1=%i4,20,>p13=%i4
srl %i4,20,%i4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#11+<p02=int64#14],>p02=int64#14
# asm 2: lduw [<table2=%o1+<p02=%o4],>p02=%o4
lduw [%o1+%o4],%o4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#12,<p00=int64#7,>z0=int64#7
# asm 2: xor <z0=%o2,<p00=%g1,>z0=%g1
xor %o2,%g1,%g1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#5,4080,>p13=int64#5
# asm 2: and <p13=%i4,4080,>p13=%i4
and %i4,4080,%i4

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#3+<p03=int64#4],>p03=int64#4
# asm 2: lduw [<table3=%i2+<p03=%i3],>p03=%i3
lduw [%i2+%i3],%i3

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#6,4,>p20=int64#12
# asm 2: sll <y2=%i5,4,>p20=%o2
sll %i5,4,%o2

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#10,>z3=int64#10
# asm 2: xor <z3=%l3,<p01=%o0,>z3=%o0
xor %l3,%o0,%o0

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#8+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table0=%g4+<p10=%l2],>p10=%l2
lduw [%g4+%l2],%l2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#6,4,>p21=int64#20
# asm 2: srl <y2=%i5,4,>p21=%l3
srl %i5,4,%l3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#14,>z2=int64#14
# asm 2: xor <z2=%l1,<p02=%o4,>z2=%o4
xor %l1,%o4,%o4

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#9+<p11=int64#21],>p11=int64#18
# asm 2: lduw [<table1=%g5+<p11=%l4],>p11=%l1
lduw [%g5+%l4],%l1

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#6,12,>p22=int64#21
# asm 2: srl <y2=%i5,12,>p22=%l4
srl %i5,12,%l4

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#4,>z1=int64#4
# asm 2: xor <z1=%l0,<p03=%i3,>z1=%i3
xor %l0,%i3,%i3

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#11+<p12=int64#22],>p12=int64#17
# asm 2: lduw [<table2=%o1+<p12=%l5],>p12=%l0
lduw [%o1+%l5],%l0

# qhasm: p23 = (uint32) y2 >> 20 
# asm 1: srl <y2=int64#6,20,>p23=int64#6
# asm 2: srl <y2=%i5,20,>p23=%i5
srl %i5,20,%i5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#3+<p13=int64#5],>p13=int64#5
# asm 2: lduw [<table3=%i2+<p13=%i4],>p13=%i4
lduw [%i2+%i4],%i4

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#20,4080,>p21=int64#20
# asm 2: and <p21=%l3,4080,>p21=%l3
and %l3,4080,%l3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#21,4080,>p22=int64#21
# asm 2: and <p22=%l4,4080,>p22=%l4
and %l4,4080,%l4

# qhasm: p30 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#2,4,>p30=int64#22
# asm 2: sll <y3=%i1,4,>p30=%l5
sll %i1,4,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#6,4080,>p23=int64#6
# asm 2: and <p23=%i5,4080,>p23=%i5
and %i5,4080,%i5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#8+<p20=int64#12],>p20=int64#12
# asm 2: lduw [<table0=%g4+<p20=%o2],>p20=%o2
lduw [%g4+%o2],%o2

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#2,4,>p31=int64#23
# asm 2: srl <y3=%i1,4,>p31=%l6
srl %i1,4,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#7,<p11=int64#18,>z0=int64#7
# asm 2: xor <z0=%g1,<p11=%l1,>z0=%g1
xor %g1,%l1,%g1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#9+<p21=int64#20],>p21=int64#18
# asm 2: lduw [<table1=%g5+<p21=%l3],>p21=%l1
lduw [%g5+%l3],%l1

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#2,12,>p32=int64#20
# asm 2: srl <y3=%i1,12,>p32=%l3
srl %i1,12,%l3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#4,<p10=int64#19,>z1=int64#4
# asm 2: xor <z1=%i3,<p10=%l2,>z1=%i3
xor %i3,%l2,%i3

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#11+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o1+<p22=%l4],>p22=%l2
lduw [%o1+%l4],%l2

# qhasm: p33 = (uint32) y3 >> 20 
# asm 1: srl <y3=int64#2,20,>p33=int64#2
# asm 2: srl <y3=%i1,20,>p33=%i1
srl %i1,20,%i1

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#21
# asm 2: and <p30=%l5,4080,>p30=%l4
and %l5,4080,%l4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#3+<p23=int64#6],>p23=int64#6
# asm 2: lduw [<table3=%i2+<p23=%i5],>p23=%i5
lduw [%i2+%i5],%i5

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#2,4080,>p33=int64#2
# asm 2: and <p33=%i1,4080,>p33=%i1
and %i1,4080,%i1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#8+<p30=int64#21],>p30=int64#21
# asm 2: lduw [<table0=%g4+<p30=%l4],>p30=%l4
lduw [%g4+%l4],%l4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#10,<p12=int64#17,>z3=int64#10
# asm 2: xor <z3=%o0,<p12=%l0,>z3=%o0
xor %o0,%l0,%o0

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#17
# asm 2: and <p32=%l3,4080,>p32=%l0
and %l3,4080,%l0

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#9+<p31=int64#22],>p31=int64#20
# asm 2: lduw [<table1=%g5+<p31=%l5],>p31=%l3
lduw [%g5+%l5],%l3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#14,<p20=int64#12,>z2=int64#12
# asm 2: xor <z2=%o4,<p20=%o2,>z2=%o2
xor %o4,%o2,%o2

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#7,<p22=int64#19,>z0=int64#7
# asm 2: xor <z0=%g1,<p22=%l2,>z0=%g1
xor %g1,%l2,%g1

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#11+<p32=int64#17],>p32=int64#14
# asm 2: lduw [<table2=%o1+<p32=%l0],>p32=%o4
lduw [%o1+%l0],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#12,<p13=int64#5,>z2=int64#5
# asm 2: xor <z2=%o2,<p13=%i4,>z2=%i4
xor %o2,%i4,%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#4,<p21=int64#18,>z1=int64#4
# asm 2: xor <z1=%i3,<p21=%l1,>z1=%i3
xor %i3,%l1,%i3

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#3+<p33=int64#2],>p33=int64#2
# asm 2: lduw [<table3=%i2+<p33=%i1],>p33=%i1
lduw [%i2+%i1],%i1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#6,>z3=int64#6
# asm 2: xor <z3=%o0,<p23=%i5,>z3=%i5
xor %o0,%i5,%i5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#5,<p31=int64#20,>y2=int64#5
# asm 2: xor <z2=%i4,<p31=%l3,>y2=%i4
xor %i4,%l3,%i4

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#6,<p30=int64#21,>y3=int64#6
# asm 2: xor <z3=%i5,<p30=%l4,>y3=%i5
xor %i5,%l4,%i5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#4,<p32=int64#14,>y1=int64#4
# asm 2: xor <z1=%i3,<p32=%o4,>y1=%i3
xor %i3,%o4,%i3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#7,<p33=int64#2,>y0=int64#2
# asm 2: xor <z0=%g1,<p33=%i1,>y0=%i1
xor %g1,%i1,%i1

# qhasm: table2 +=3
# asm 1: add <table2=int64#11,3,>table2=int64#7
# asm 2: add <table2=%o1,3,>table2=%g1
add %o1,3,%g1

# qhasm: z0 = x40
# asm 1: ldx [%fp+2023-<x40=stack64#41],>z0=int64#10
# asm 2: ldx [%fp+2023-<x40=320],>z0=%o0
ldx [%fp+2023-320],%o0

# qhasm: z1 = x41
# asm 1: ldx [%fp+2023-<x41=stack64#42],>z1=int64#11
# asm 2: ldx [%fp+2023-<x41=328],>z1=%o1
ldx [%fp+2023-328],%o1

# qhasm: z2 = x42
# asm 1: ldx [%fp+2023-<x42=stack64#43],>z2=int64#12
# asm 2: ldx [%fp+2023-<x42=336],>z2=%o2
ldx [%fp+2023-336],%o2

# qhasm: z3 = x43
# asm 1: ldx [%fp+2023-<x43=stack64#44],>z3=int64#14
# asm 2: ldx [%fp+2023-<x43=344],>z3=%o4
ldx [%fp+2023-344],%o4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#2,4,>p00=int64#17
# asm 2: sll <y0=%i1,4,>p00=%l0
sll %i1,4,%l0

# qhasm: p01 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#2,4,>p01=int64#18
# asm 2: srl <y0=%i1,4,>p01=%l1
srl %i1,4,%l1

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p02=int64#19
# asm 2: srl <y0=%i1,12,>p02=%l2
srl %i1,12,%l2

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p03=int64#2
# asm 2: srl <y0=%i1,20,>p03=%i1
srl %i1,20,%i1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#17,4080,>p00=int64#17
# asm 2: and <p00=%l0,4080,>p00=%l0
and %l0,4080,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#19,4080,>p02=int64#19
# asm 2: and <p02=%l2,4080,>p02=%l2
and %l2,4080,%l2

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#2,4080,>p03=int64#2
# asm 2: and <p03=%i1,4080,>p03=%i1
and %i1,4080,%i1

# qhasm: p00 = *(uint8 *) (table2 + p00)
# asm 1: ldub [<table2=int64#7+<p00=int64#17],>p00=int64#17
# asm 2: ldub [<table2=%g1+<p00=%l0],>p00=%l0
ldub [%g1+%l0],%l0

# qhasm: p01 = *(uint32 *) (table3 + p01)
# asm 1: lduw [<table3=int64#3+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table3=%i2+<p01=%l1],>p01=%l1
lduw [%i2+%l1],%l1

# qhasm: p02 = *(uint32 *) (table0 + p02)
# asm 1: lduw [<table0=int64#8+<p02=int64#19],>p02=int64#19
# asm 2: lduw [<table0=%g4+<p02=%l2],>p02=%l2
lduw [%g4+%l2],%l2

# qhasm: p03 = *(uint32 *) (table1 + p03)
# asm 1: lduw [<table1=int64#9+<p03=int64#2],>p03=int64#2
# asm 2: lduw [<table1=%g5+<p03=%i1],>p03=%i1
lduw [%g5+%i1],%i1

# qhasm: p01 &= mask3
# asm 1: and <p01=int64#18,<mask3=int64#16,>p01=int64#18
# asm 2: and <p01=%l1,<mask3=%o7,>p01=%l1
and %l1,%o7,%l1

# qhasm: p02 &= mask2
# asm 1: and <p02=int64#19,<mask2=int64#15,>p02=int64#19
# asm 2: and <p02=%l2,<mask2=%o5,>p02=%l2
and %l2,%o5,%l2

# qhasm: p03 &= mask1
# asm 1: and <p03=int64#2,<mask1=int64#13,>p03=int64#2
# asm 2: and <p03=%i1,<mask1=%o3,>p03=%i1
and %i1,%o3,%i1

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#10,<p00=int64#17,>z0=int64#10
# asm 2: xor <z0=%o0,<p00=%l0,>z0=%o0
xor %o0,%l0,%o0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#11,<p03=int64#2,>z1=int64#2
# asm 2: xor <z1=%o1,<p03=%i1,>z1=%i1
xor %o1,%i1,%i1

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#12,<p02=int64#19,>z2=int64#11
# asm 2: xor <z2=%o2,<p02=%l2,>z2=%o1
xor %o2,%l2,%o1

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#14,<p01=int64#18,>z3=int64#12
# asm 2: xor <z3=%o4,<p01=%l1,>z3=%o2
xor %o4,%l1,%o2

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#4,4,>p10=int64#14
# asm 2: sll <y1=%i3,4,>p10=%o4
sll %i3,4,%o4

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#4,4,>p11=int64#17
# asm 2: srl <y1=%i3,4,>p11=%l0
srl %i3,4,%l0

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#4,12,>p12=int64#18
# asm 2: srl <y1=%i3,12,>p12=%l1
srl %i3,12,%l1

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#4,20,>p13=int64#4
# asm 2: srl <y1=%i3,20,>p13=%i3
srl %i3,20,%i3

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#14,4080,>p10=int64#14
# asm 2: and <p10=%o4,4080,>p10=%o4
and %o4,4080,%o4

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#17,4080,>p11=int64#17
# asm 2: and <p11=%l0,4080,>p11=%l0
and %l0,4080,%l0

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#18,4080,>p12=int64#18
# asm 2: and <p12=%l1,4080,>p12=%l1
and %l1,4080,%l1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#4,4080,>p13=int64#4
# asm 2: and <p13=%i3,4080,>p13=%i3
and %i3,4080,%i3

# qhasm: p10 = *(uint8 *) (table2 + p10)
# asm 1: ldub [<table2=int64#7+<p10=int64#14],>p10=int64#14
# asm 2: ldub [<table2=%g1+<p10=%o4],>p10=%o4
ldub [%g1+%o4],%o4

# qhasm: p11 = *(uint32 *) (table3 + p11)
# asm 1: lduw [<table3=int64#3+<p11=int64#17],>p11=int64#17
# asm 2: lduw [<table3=%i2+<p11=%l0],>p11=%l0
lduw [%i2+%l0],%l0

# qhasm: p12 = *(uint32 *) (table0 + p12)
# asm 1: lduw [<table0=int64#8+<p12=int64#18],>p12=int64#18
# asm 2: lduw [<table0=%g4+<p12=%l1],>p12=%l1
lduw [%g4+%l1],%l1

# qhasm: p13 = *(uint32 *) (table1 + p13)
# asm 1: lduw [<table1=int64#9+<p13=int64#4],>p13=int64#4
# asm 2: lduw [<table1=%g5+<p13=%i3],>p13=%i3
lduw [%g5+%i3],%i3

# qhasm: p11 &= mask3
# asm 1: and <p11=int64#17,<mask3=int64#16,>p11=int64#17
# asm 2: and <p11=%l0,<mask3=%o7,>p11=%l0
and %l0,%o7,%l0

# qhasm: p12 &= mask2
# asm 1: and <p12=int64#18,<mask2=int64#15,>p12=int64#18
# asm 2: and <p12=%l1,<mask2=%o5,>p12=%l1
and %l1,%o5,%l1

# qhasm: p13 &= mask1
# asm 1: and <p13=int64#4,<mask1=int64#13,>p13=int64#4
# asm 2: and <p13=%i3,<mask1=%o3,>p13=%i3
and %i3,%o3,%i3

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#10,<p11=int64#17,>z0=int64#10
# asm 2: xor <z0=%o0,<p11=%l0,>z0=%o0
xor %o0,%l0,%o0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#2,<p10=int64#14,>z1=int64#2
# asm 2: xor <z1=%i1,<p10=%o4,>z1=%i1
xor %i1,%o4,%i1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#11,<p13=int64#4,>z2=int64#4
# asm 2: xor <z2=%o1,<p13=%i3,>z2=%i3
xor %o1,%i3,%i3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#12,<p12=int64#18,>z3=int64#11
# asm 2: xor <z3=%o2,<p12=%l1,>z3=%o1
xor %o2,%l1,%o1

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#5,4,>p20=int64#12
# asm 2: sll <y2=%i4,4,>p20=%o2
sll %i4,4,%o2

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#5,4,>p21=int64#14
# asm 2: srl <y2=%i4,4,>p21=%o4
srl %i4,4,%o4

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#5,12,>p22=int64#17
# asm 2: srl <y2=%i4,12,>p22=%l0
srl %i4,12,%l0

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#5,20,>p23=int64#5
# asm 2: srl <y2=%i4,20,>p23=%i4
srl %i4,20,%i4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#12,4080,>p20=int64#12
# asm 2: and <p20=%o2,4080,>p20=%o2
and %o2,4080,%o2

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#14,4080,>p21=int64#14
# asm 2: and <p21=%o4,4080,>p21=%o4
and %o4,4080,%o4

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#17,4080,>p22=int64#17
# asm 2: and <p22=%l0,4080,>p22=%l0
and %l0,4080,%l0

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#5,4080,>p23=int64#5
# asm 2: and <p23=%i4,4080,>p23=%i4
and %i4,4080,%i4

# qhasm: p20 = *(uint8 *) (table2 + p20)
# asm 1: ldub [<table2=int64#7+<p20=int64#12],>p20=int64#12
# asm 2: ldub [<table2=%g1+<p20=%o2],>p20=%o2
ldub [%g1+%o2],%o2

# qhasm: p21 = *(uint32 *) (table3 + p21)
# asm 1: lduw [<table3=int64#3+<p21=int64#14],>p21=int64#14
# asm 2: lduw [<table3=%i2+<p21=%o4],>p21=%o4
lduw [%i2+%o4],%o4

# qhasm: p22 = *(uint32 *) (table0 + p22)
# asm 1: lduw [<table0=int64#8+<p22=int64#17],>p22=int64#17
# asm 2: lduw [<table0=%g4+<p22=%l0],>p22=%l0
lduw [%g4+%l0],%l0

# qhasm: p23 = *(uint32 *) (table1 + p23)
# asm 1: lduw [<table1=int64#9+<p23=int64#5],>p23=int64#5
# asm 2: lduw [<table1=%g5+<p23=%i4],>p23=%i4
lduw [%g5+%i4],%i4

# qhasm: p21 &= mask3
# asm 1: and <p21=int64#14,<mask3=int64#16,>p21=int64#14
# asm 2: and <p21=%o4,<mask3=%o7,>p21=%o4
and %o4,%o7,%o4

# qhasm: p22 &= mask2
# asm 1: and <p22=int64#17,<mask2=int64#15,>p22=int64#17
# asm 2: and <p22=%l0,<mask2=%o5,>p22=%l0
and %l0,%o5,%l0

# qhasm: p23 &= mask1
# asm 1: and <p23=int64#5,<mask1=int64#13,>p23=int64#5
# asm 2: and <p23=%i4,<mask1=%o3,>p23=%i4
and %i4,%o3,%i4

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#10,<p22=int64#17,>z0=int64#10
# asm 2: xor <z0=%o0,<p22=%l0,>z0=%o0
xor %o0,%l0,%o0

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#2,<p21=int64#14,>z1=int64#2
# asm 2: xor <z1=%i1,<p21=%o4,>z1=%i1
xor %i1,%o4,%i1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#4,<p20=int64#12,>z2=int64#4
# asm 2: xor <z2=%i3,<p20=%o2,>z2=%i3
xor %i3,%o2,%i3

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#11,<p23=int64#5,>z3=int64#5
# asm 2: xor <z3=%o1,<p23=%i4,>z3=%i4
xor %o1,%i4,%i4

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#6,4,>p30=int64#11
# asm 2: sll <y3=%i5,4,>p30=%o1
sll %i5,4,%o1

# qhasm: p31 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#6,4,>p31=int64#12
# asm 2: srl <y3=%i5,4,>p31=%o2
srl %i5,4,%o2

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#6,12,>p32=int64#14
# asm 2: srl <y3=%i5,12,>p32=%o4
srl %i5,12,%o4

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#6,20,>p33=int64#6
# asm 2: srl <y3=%i5,20,>p33=%i5
srl %i5,20,%i5

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#11,4080,>p30=int64#11
# asm 2: and <p30=%o1,4080,>p30=%o1
and %o1,4080,%o1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#12,4080,>p31=int64#12
# asm 2: and <p31=%o2,4080,>p31=%o2
and %o2,4080,%o2

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#14,4080,>p32=int64#14
# asm 2: and <p32=%o4,4080,>p32=%o4
and %o4,4080,%o4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#6,4080,>p33=int64#6
# asm 2: and <p33=%i5,4080,>p33=%i5
and %i5,4080,%i5

# qhasm: p30 = *(uint8 *) (table2 + p30)
# asm 1: ldub [<table2=int64#7+<p30=int64#11],>p30=int64#7
# asm 2: ldub [<table2=%g1+<p30=%o1],>p30=%g1
ldub [%g1+%o1],%g1

# qhasm: p31 = *(uint32 *) (table3 + p31)
# asm 1: lduw [<table3=int64#3+<p31=int64#12],>p31=int64#3
# asm 2: lduw [<table3=%i2+<p31=%o2],>p31=%i2
lduw [%i2+%o2],%i2

# qhasm: p32 = *(uint32 *) (table0 + p32)
# asm 1: lduw [<table0=int64#8+<p32=int64#14],>p32=int64#8
# asm 2: lduw [<table0=%g4+<p32=%o4],>p32=%g4
lduw [%g4+%o4],%g4

# qhasm: p33 = *(uint32 *) (table1 + p33)
# asm 1: lduw [<table1=int64#9+<p33=int64#6],>p33=int64#6
# asm 2: lduw [<table1=%g5+<p33=%i5],>p33=%i5
lduw [%g5+%i5],%i5

# qhasm: p31 &= mask3
# asm 1: and <p31=int64#3,<mask3=int64#16,>p31=int64#3
# asm 2: and <p31=%i2,<mask3=%o7,>p31=%i2
and %i2,%o7,%i2

# qhasm: p32 &= mask2
# asm 1: and <p32=int64#8,<mask2=int64#15,>p32=int64#8
# asm 2: and <p32=%g4,<mask2=%o5,>p32=%g4
and %g4,%o5,%g4

# qhasm: p33 &= mask1
# asm 1: and <p33=int64#6,<mask1=int64#13,>p33=int64#6
# asm 2: and <p33=%i5,<mask1=%o3,>p33=%i5
and %i5,%o3,%i5

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#10,<p33=int64#6,>y0=int64#6
# asm 2: xor <z0=%o0,<p33=%i5,>y0=%i5
xor %o0,%i5,%i5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#2,<p32=int64#8,>y1=int64#2
# asm 2: xor <z1=%i1,<p32=%g4,>y1=%i1
xor %i1,%g4,%i1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#4,<p31=int64#3,>y2=int64#3
# asm 2: xor <z2=%i3,<p31=%i2,>y2=%i2
xor %i3,%i2,%i2

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#5,<p30=int64#7,>y3=int64#4
# asm 2: xor <z3=%i4,<p30=%g1,>y3=%i3
xor %i4,%g1,%i3

# qhasm: *(uint32 *) (ctxp + 56) = y0
# asm 1: stw <y0=int64#6,[<ctxp=int64#1+56]
# asm 2: stw <y0=%i5,[<ctxp=%i0+56]
stw %i5,[%i0+56]

# qhasm: *(uint32 *) (ctxp + 60) = y1
# asm 1: stw <y1=int64#2,[<ctxp=int64#1+60]
# asm 2: stw <y1=%i1,[<ctxp=%i0+60]
stw %i1,[%i0+60]

# qhasm: *(uint32 *) (ctxp + 64) = y2
# asm 1: stw <y2=int64#3,[<ctxp=int64#1+64]
# asm 2: stw <y2=%i2,[<ctxp=%i0+64]
stw %i2,[%i0+64]

# qhasm: *(uint32 *) (ctxp + 68) = y3
# asm 1: stw <y3=int64#4,[<ctxp=int64#1+68]
# asm 2: stw <y3=%i3,[<ctxp=%i0+68]
stw %i3,[%i0+68]

# qhasm: leave
ret
restore
