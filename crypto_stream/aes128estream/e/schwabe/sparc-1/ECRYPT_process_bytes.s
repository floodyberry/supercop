.register %g2,#scratch
.register %g3,#scratch

# qhasm: int64 action

# qhasm: int64 ctxp

# qhasm: int64 inp

# qhasm: int64 outp

# qhasm: int64 length

# qhasm: int64 debug

# qhasm: input action

# qhasm: input ctxp

# qhasm: input inp

# qhasm: input outp

# qhasm: input length

# qhasm: input debug

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

# qhasm: int64 n0p

# qhasm: int64 n0

# qhasm: int64 in0

# qhasm: int64 in1

# qhasm: int64 in2

# qhasm: int64 in3

# qhasm: int64 dd 

# qhasm: int64 tmpp

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

# qhasm: stack64 outp_stack

# qhasm: stack64 inp_stack

# qhasm: stack64 n0p_stack

# qhasm: stack128 tmp

# qhasm: enter ECRYPT_process_bytes_qhasm
.section ".text"
.align 32
.global ECRYPT_process_bytes_qhasm
ECRYPT_process_bytes_qhasm:
save %sp,-576,%sp

# qhasm: =? length - 0
# asm 1: subcc <length=int64#5,0,%g0
# asm 2: subcc <length=%i4,0,%g0
subcc %i4,0,%g0

# qhasm: goto donothing if =
be,pt %xcc,._donothing
nop

# qhasm: constants = (aes_big_constants & 0xfffffc0000000000) >> 32
# asm 1: sethi %hh(aes_big_constants),>constants=int64#1
# asm 2: sethi %hh(aes_big_constants),>constants=%i0
sethi %hh(aes_big_constants),%i0

# qhasm: constants_low = aes_big_constants & 0xfffffc00
# asm 1: sethi %lm(aes_big_constants),>constants_low=int64#6
# asm 2: sethi %lm(aes_big_constants),>constants_low=%i5
sethi %lm(aes_big_constants),%i5

# qhasm: constants |= (aes_big_constants & 0x3ff00000000) >> 32
# asm 1: or <constants=int64#1,%hm(aes_big_constants),>constants=int64#1
# asm 2: or <constants=%i0,%hm(aes_big_constants),>constants=%i0
or %i0,%hm(aes_big_constants),%i0

# qhasm: constants_low |= aes_big_constants & 0x3ff
# asm 1: or <constants_low=int64#6,%lo(aes_big_constants),>constants_low=int64#6
# asm 2: or <constants_low=%i5,%lo(aes_big_constants),>constants_low=%i5
or %i5,%lo(aes_big_constants),%i5

# qhasm: constants <<= 32
# asm 1: sllx <constants=int64#1,32,>constants=int64#1
# asm 2: sllx <constants=%i0,32,>constants=%i0
sllx %i0,32,%i0

# qhasm: constants |= constants_low
# asm 1: or  <constants=int64#1,<constants_low=int64#6,>constants=int64#1
# asm 2: or  <constants=%i0,<constants_low=%i5,>constants=%i0
or  %i0,%i5,%i0

# qhasm: n0p = ctxp + 56
# asm 1: add <ctxp=int64#2,56,>n0p=int64#6
# asm 2: add <ctxp=%i1,56,>n0p=%i5
add %i1,56,%i5

# qhasm: outp_stack = outp
# asm 1: stx <outp=int64#4,[%fp+2023->outp_stack=stack64#1]
# asm 2: stx <outp=%i3,[%fp+2023->outp_stack=16]
stx %i3,[%fp+2023-16]

# qhasm: inp_stack = inp
# asm 1: stx <inp=int64#3,[%fp+2023->inp_stack=stack64#2]
# asm 2: stx <inp=%i2,[%fp+2023->inp_stack=24]
stx %i2,[%fp+2023-24]

# qhasm: n0p_stack = n0p
# asm 1: stx <n0p=int64#6,[%fp+2023->n0p_stack=stack64#3]
# asm 2: stx <n0p=%i5,[%fp+2023->n0p_stack=32]
stx %i5,[%fp+2023-32]

# qhasm: tx0 = *(uint32 *) (ctxp + 0) 
# asm 1: lduw [<ctxp=int64#2+0],>tx0=int64#3
# asm 2: lduw [<ctxp=%i1+0],>tx0=%i2
lduw [%i1+0],%i2

# qhasm: table0 = constants + 40
# asm 1: add <constants=int64#1,40,>table0=int64#7
# asm 2: add <constants=%i0,40,>table0=%g1
add %i0,40,%g1

# qhasm: table1 = constants + 48
# asm 1: add <constants=int64#1,48,>table1=int64#8
# asm 2: add <constants=%i0,48,>table1=%g4
add %i0,48,%g4

# qhasm: tx1 = *(uint32 *) (ctxp + 4) 
# asm 1: lduw [<ctxp=int64#2+4],>tx1=int64#9
# asm 2: lduw [<ctxp=%i1+4],>tx1=%g5
lduw [%i1+4],%g5

# qhasm: table2 = constants + 44
# asm 1: add <constants=int64#1,44,>table2=int64#10
# asm 2: add <constants=%i0,44,>table2=%o0
add %i0,44,%o0

# qhasm: table3 = constants + 52
# asm 1: add <constants=int64#1,52,>table3=int64#1
# asm 2: add <constants=%i0,52,>table3=%i0
add %i0,52,%i0

# qhasm: tx2 = *(uint32 *) (ctxp + 8) 
# asm 1: lduw [<ctxp=int64#2+8],>tx2=int64#11
# asm 2: lduw [<ctxp=%i1+8],>tx2=%o1
lduw [%i1+8],%o1

# qhasm: mask1 = 0xff
# asm 1: add %g0,0xff,>mask1=int64#12
# asm 2: add %g0,0xff,>mask1=%o2
add %g0,0xff,%o2

# qhasm: mask1 <<= 24
# asm 1: sllx <mask1=int64#12,24,>mask1=int64#12
# asm 2: sllx <mask1=%o2,24,>mask1=%o2
sllx %o2,24,%o2

# qhasm: tx3 = *(uint32 *) (ctxp + 12)
# asm 1: lduw [<ctxp=int64#2+12],>tx3=int64#13
# asm 2: lduw [<ctxp=%i1+12],>tx3=%o3
lduw [%i1+12],%o3

# qhasm: mask2 = 0xff
# asm 1: add %g0,0xff,>mask2=int64#14
# asm 2: add %g0,0xff,>mask2=%o4
add %g0,0xff,%o4

# qhasm: mask2 <<= 16
# asm 1: sllx <mask2=int64#14,16,>mask2=int64#14
# asm 2: sllx <mask2=%o4,16,>mask2=%o4
sllx %o4,16,%o4

# qhasm: x0 = tx0
# asm 1: stx <tx0=int64#3,[%fp+2023->x0=stack64#4]
# asm 2: stx <tx0=%i2,[%fp+2023->x0=40]
stx %i2,[%fp+2023-40]

# qhasm: mask3 = 0xff
# asm 1: add %g0,0xff,>mask3=int64#3
# asm 2: add %g0,0xff,>mask3=%i2
add %g0,0xff,%i2

# qhasm: mask3 <<= 8
# asm 1: sllx <mask3=int64#3,8,>mask3=int64#3
# asm 2: sllx <mask3=%i2,8,>mask3=%i2
sllx %i2,8,%i2

# qhasm: x1 = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x1=stack64#5]
# asm 2: stx <tx1=%g5,[%fp+2023->x1=48]
stx %g5,[%fp+2023-48]

# qhasm: x2 = tx2
# asm 1: stx <tx2=int64#11,[%fp+2023->x2=stack64#6]
# asm 2: stx <tx2=%o1,[%fp+2023->x2=56]
stx %o1,[%fp+2023-56]

# qhasm: x3 = tx3
# asm 1: stx <tx3=int64#13,[%fp+2023->x3=stack64#7]
# asm 2: stx <tx3=%o3,[%fp+2023->x3=64]
stx %o3,[%fp+2023-64]

# qhasm: y1 = *(uint32 *) (n0p + 4)
# asm 1: lduw [<n0p=int64#6+4],>y1=int64#15
# asm 2: lduw [<n0p=%i5+4],>y1=%o5
lduw [%i5+4],%o5

# qhasm: y2 = *(uint32 *) (n0p + 8)
# asm 1: lduw [<n0p=int64#6+8],>y2=int64#16
# asm 2: lduw [<n0p=%i5+8],>y2=%o7
lduw [%i5+8],%o7

# qhasm: y3 = *(uint32 *) (n0p + 12)
# asm 1: lduw [<n0p=int64#6+12],>y3=int64#17
# asm 2: lduw [<n0p=%i5+12],>y3=%l0
lduw [%i5+12],%l0

# qhasm: y1 ^= tx1
# asm 1: xor <y1=int64#15,<tx1=int64#9,>y1=int64#15
# asm 2: xor <y1=%o5,<tx1=%g5,>y1=%o5
xor %o5,%g5,%o5

# qhasm: y2 ^= tx2
# asm 1: xor <y2=int64#16,<tx2=int64#11,>y2=int64#16
# asm 2: xor <y2=%o7,<tx2=%o1,>y2=%o7
xor %o7,%o1,%o7

# qhasm: y3 ^= tx3
# asm 1: xor <y3=int64#17,<tx3=int64#13,>y3=int64#17
# asm 2: xor <y3=%l0,<tx3=%o3,>y3=%l0
xor %l0,%o3,%l0

# qhasm: *(uint32 *) (n0p + 4) = y1
# asm 1: stw <y1=int64#15,[<n0p=int64#6+4]
# asm 2: stw <y1=%o5,[<n0p=%i5+4]
stw %o5,[%i5+4]

# qhasm: *(uint32 *) (n0p + 8) = y2
# asm 1: stw <y2=int64#16,[<n0p=int64#6+8]
# asm 2: stw <y2=%o7,[<n0p=%i5+8]
stw %o7,[%i5+8]

# qhasm: *(uint32 *) (n0p + 12) = y3
# asm 1: stw <y3=int64#17,[<n0p=int64#6+12]
# asm 2: stw <y3=%l0,[<n0p=%i5+12]
stw %l0,[%i5+12]

# qhasm: tx0 = *(uint32 *) (ctxp + 16)
# asm 1: lduw [<ctxp=int64#2+16],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+16],>tx0=%o5
lduw [%i1+16],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x4  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x4=stack64#8]
# asm 2: stx <tx0=%o5,[%fp+2023->x4=72]
stx %o5,[%fp+2023-72]

# qhasm: x5  = tx1 
# asm 1: stx <tx1=int64#9,[%fp+2023->x5=stack64#9]
# asm 2: stx <tx1=%g5,[%fp+2023->x5=80]
stx %g5,[%fp+2023-80]

# qhasm: x6  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x6=stack64#10]
# asm 2: stx <tx2=%o1,[%fp+2023->x6=88]
stx %o1,[%fp+2023-88]

# qhasm: x7  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x7=stack64#11]
# asm 2: stx <tx3=%o3,[%fp+2023->x7=96]
stx %o3,[%fp+2023-96]

# qhasm: tx0 = *(uint32 *) (ctxp + 20) 
# asm 1: lduw [<ctxp=int64#2+20],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+20],>tx0=%o5
lduw [%i1+20],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x8  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x8=stack64#12]
# asm 2: stx <tx0=%o5,[%fp+2023->x8=104]
stx %o5,[%fp+2023-104]

# qhasm: x9  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x9=stack64#13]
# asm 2: stx <tx1=%g5,[%fp+2023->x9=112]
stx %g5,[%fp+2023-112]

# qhasm: x10  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x10=stack64#14]
# asm 2: stx <tx2=%o1,[%fp+2023->x10=120]
stx %o1,[%fp+2023-120]

# qhasm: x11  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x11=stack64#15]
# asm 2: stx <tx3=%o3,[%fp+2023->x11=128]
stx %o3,[%fp+2023-128]

# qhasm: tx0 = *(uint32 *) (ctxp + 24) 
# asm 1: lduw [<ctxp=int64#2+24],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+24],>tx0=%o5
lduw [%i1+24],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x12  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x12=stack64#16]
# asm 2: stx <tx0=%o5,[%fp+2023->x12=136]
stx %o5,[%fp+2023-136]

# qhasm: x13  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x13=stack64#17]
# asm 2: stx <tx1=%g5,[%fp+2023->x13=144]
stx %g5,[%fp+2023-144]

# qhasm: x14  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x14=stack64#18]
# asm 2: stx <tx2=%o1,[%fp+2023->x14=152]
stx %o1,[%fp+2023-152]

# qhasm: x15  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x15=stack64#19]
# asm 2: stx <tx3=%o3,[%fp+2023->x15=160]
stx %o3,[%fp+2023-160]

# qhasm: tx0 = *(uint32 *) (ctxp + 28) 
# asm 1: lduw [<ctxp=int64#2+28],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+28],>tx0=%o5
lduw [%i1+28],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x16  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x16=stack64#20]
# asm 2: stx <tx0=%o5,[%fp+2023->x16=168]
stx %o5,[%fp+2023-168]

# qhasm: x17  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x17=stack64#21]
# asm 2: stx <tx1=%g5,[%fp+2023->x17=176]
stx %g5,[%fp+2023-176]

# qhasm: x18  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x18=stack64#22]
# asm 2: stx <tx2=%o1,[%fp+2023->x18=184]
stx %o1,[%fp+2023-184]

# qhasm: x19  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x19=stack64#23]
# asm 2: stx <tx3=%o3,[%fp+2023->x19=192]
stx %o3,[%fp+2023-192]

# qhasm: tx0 = *(uint32 *) (ctxp + 32) 
# asm 1: lduw [<ctxp=int64#2+32],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+32],>tx0=%o5
lduw [%i1+32],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x20  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x20=stack64#24]
# asm 2: stx <tx0=%o5,[%fp+2023->x20=200]
stx %o5,[%fp+2023-200]

# qhasm: x21  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x21=stack64#25]
# asm 2: stx <tx1=%g5,[%fp+2023->x21=208]
stx %g5,[%fp+2023-208]

# qhasm: x22  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x22=stack64#26]
# asm 2: stx <tx2=%o1,[%fp+2023->x22=216]
stx %o1,[%fp+2023-216]

# qhasm: x23  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x23=stack64#27]
# asm 2: stx <tx3=%o3,[%fp+2023->x23=224]
stx %o3,[%fp+2023-224]

# qhasm: tx0 = *(uint32 *) (ctxp + 36) 
# asm 1: lduw [<ctxp=int64#2+36],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+36],>tx0=%o5
lduw [%i1+36],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x24  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x24=stack64#28]
# asm 2: stx <tx0=%o5,[%fp+2023->x24=232]
stx %o5,[%fp+2023-232]

# qhasm: x25  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x25=stack64#29]
# asm 2: stx <tx1=%g5,[%fp+2023->x25=240]
stx %g5,[%fp+2023-240]

# qhasm: x26  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x26=stack64#30]
# asm 2: stx <tx2=%o1,[%fp+2023->x26=248]
stx %o1,[%fp+2023-248]

# qhasm: x27  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x27=stack64#31]
# asm 2: stx <tx3=%o3,[%fp+2023->x27=256]
stx %o3,[%fp+2023-256]

# qhasm: tx0 = *(uint32 *) (ctxp + 40) 
# asm 1: lduw [<ctxp=int64#2+40],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+40],>tx0=%o5
lduw [%i1+40],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x28  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x28=stack64#32]
# asm 2: stx <tx0=%o5,[%fp+2023->x28=264]
stx %o5,[%fp+2023-264]

# qhasm: x29  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x29=stack64#33]
# asm 2: stx <tx1=%g5,[%fp+2023->x29=272]
stx %g5,[%fp+2023-272]

# qhasm: x30  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x30=stack64#34]
# asm 2: stx <tx2=%o1,[%fp+2023->x30=280]
stx %o1,[%fp+2023-280]

# qhasm: x31  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x31=stack64#35]
# asm 2: stx <tx3=%o3,[%fp+2023->x31=288]
stx %o3,[%fp+2023-288]

# qhasm: tx0 = *(uint32 *) (ctxp + 44) 
# asm 1: lduw [<ctxp=int64#2+44],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+44],>tx0=%o5
lduw [%i1+44],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x32  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x32=stack64#36]
# asm 2: stx <tx0=%o5,[%fp+2023->x32=296]
stx %o5,[%fp+2023-296]

# qhasm: x33  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x33=stack64#37]
# asm 2: stx <tx1=%g5,[%fp+2023->x33=304]
stx %g5,[%fp+2023-304]

# qhasm: x34  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x34=stack64#38]
# asm 2: stx <tx2=%o1,[%fp+2023->x34=312]
stx %o1,[%fp+2023-312]

# qhasm: x35  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x35=stack64#39]
# asm 2: stx <tx3=%o3,[%fp+2023->x35=320]
stx %o3,[%fp+2023-320]

# qhasm: tx0 = *(uint32 *) (ctxp + 48) 
# asm 1: lduw [<ctxp=int64#2+48],>tx0=int64#15
# asm 2: lduw [<ctxp=%i1+48],>tx0=%o5
lduw [%i1+48],%o5

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#15,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%o5,>tx1=%g5
xor %g5,%o5,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: y1 = *(uint64 *) (n0p + 0)
# asm 1: ldx [<n0p=int64#6+0],>y1=int64#16
# asm 2: ldx [<n0p=%i5+0],>y1=%o7
ldx [%i5+0],%o7

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x36  = tx0 
# asm 1: stx <tx0=int64#15,[%fp+2023->x36=stack64#40]
# asm 2: stx <tx0=%o5,[%fp+2023->x36=328]
stx %o5,[%fp+2023-328]

# qhasm: x37  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x37=stack64#41]
# asm 2: stx <tx1=%g5,[%fp+2023->x37=336]
stx %g5,[%fp+2023-336]

# qhasm: x38  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x38=stack64#42]
# asm 2: stx <tx2=%o1,[%fp+2023->x38=344]
stx %o1,[%fp+2023-344]

# qhasm: x39  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x39=stack64#43]
# asm 2: stx <tx3=%o3,[%fp+2023->x39=352]
stx %o3,[%fp+2023-352]

# qhasm: tx0 = *(uint32 *) (ctxp + 52) 
# asm 1: lduw [<ctxp=int64#2+52],>tx0=int64#2
# asm 2: lduw [<ctxp=%i1+52],>tx0=%i1
lduw [%i1+52],%i1

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#9,<tx0=int64#2,>tx1=int64#9
# asm 2: xor <tx1=%g5,<tx0=%i1,>tx1=%g5
xor %g5,%i1,%g5

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#11,<tx1=int64#9,>tx2=int64#11
# asm 2: xor <tx2=%o1,<tx1=%g5,>tx2=%o1
xor %o1,%g5,%o1

# qhasm: y3 = *(uint64 *) (n0p + 8)
# asm 1: ldx [<n0p=int64#6+8],>y3=int64#6
# asm 2: ldx [<n0p=%i5+8],>y3=%i5
ldx [%i5+8],%i5

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#13,<tx2=int64#11,>tx3=int64#13
# asm 2: xor <tx3=%o3,<tx2=%o1,>tx3=%o3
xor %o3,%o1,%o3

# qhasm: x40  = tx0 
# asm 1: stx <tx0=int64#2,[%fp+2023->x40=stack64#44]
# asm 2: stx <tx0=%i1,[%fp+2023->x40=360]
stx %i1,[%fp+2023-360]

# qhasm: x41  = tx1
# asm 1: stx <tx1=int64#9,[%fp+2023->x41=stack64#45]
# asm 2: stx <tx1=%g5,[%fp+2023->x41=368]
stx %g5,[%fp+2023-368]

# qhasm: x42  = tx2 
# asm 1: stx <tx2=int64#11,[%fp+2023->x42=stack64#46]
# asm 2: stx <tx2=%o1,[%fp+2023->x42=376]
stx %o1,[%fp+2023-376]

# qhasm: x43  = tx3 
# asm 1: stx <tx3=int64#13,[%fp+2023->x43=stack64#47]
# asm 2: stx <tx3=%o3,[%fp+2023->x43=384]
stx %o3,[%fp+2023-384]

# qhasm: tx0 = x0
# asm 1: ldx [%fp+2023-<x0=stack64#4],>tx0=int64#2
# asm 2: ldx [%fp+2023-<x0=40],>tx0=%i1
ldx [%fp+2023-40],%i1

# qhasm: y0 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#16,32,>y0=int64#9
# asm 2: srlx <y1=%o7,32,>y0=%g5
srlx %o7,32,%g5

# qhasm: y2 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#6,32,>y2=int64#11
# asm 2: srlx <y3=%i5,32,>y2=%o1
srlx %i5,32,%o1

# qhasm: y0 ^= tx0
# asm 1: xor <y0=int64#9,<tx0=int64#2,>y0=int64#2
# asm 2: xor <y0=%g5,<tx0=%i1,>y0=%i1
xor %g5,%i1,%i1

# qhasm: z0 = x4
# asm 1: ldx [%fp+2023-<x4=stack64#8],>z0=int64#9
# asm 2: ldx [%fp+2023-<x4=72],>z0=%g5
ldx [%fp+2023-72],%g5

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p00=int64#13
# asm 2: srl <y0=%i1,20,>p00=%o3
srl %i1,20,%o3

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p01=int64#15
# asm 2: srl <y0=%i1,12,>p01=%o5
srl %i1,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#13,4080,>p00=int64#13
# asm 2: and <p00=%o3,4080,>p00=%o3
and %o3,4080,%o3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: goto aftercopy
b ._aftercopy
nop

# qhasm: mainloop:
._mainloop:

# qhasm: (uint64) z0 <<= 32
# asm 1: sllx <z0=int64#4,32,>z0=int64#4
# asm 2: sllx <z0=%i3,32,>z0=%i3
sllx %i3,32,%i3

# qhasm: table1 -=3
# asm 1: sub <table1=int64#8,3,>table1=int64#8
# asm 2: sub <table1=%g4,3,>table1=%g4
sub %g4,3,%g4

# qhasm: in0 = *(uint64 *) (inp + 0)
# asm 1: ldx [<inp=int64#13+0],>in0=int64#20
# asm 2: ldx [<inp=%o3+0],>in0=%l3
ldx [%o3+0],%l3

# qhasm: (uint64) z2 <<= 32
# asm 1: sllx <z2=int64#2,32,>z2=int64#21
# asm 2: sllx <z2=%i1,32,>z2=%l4
sllx %i1,32,%l4

# qhasm: y0 ^= tx0
# asm 1: xor <y0=int64#15,<tx0=int64#19,>y0=int64#2
# asm 2: xor <y0=%o5,<tx0=%l2,>y0=%i1
xor %o5,%l2,%i1

# qhasm: in2 = *(uint64 *) (inp + 8)
# asm 1: ldx [<inp=int64#13+8],>in2=int64#15
# asm 2: ldx [<inp=%o3+8],>in2=%o5
ldx [%o3+8],%o5

# qhasm: z0 ^= z1
# asm 1: xor <z0=int64#4,<z1=int64#17,>z0=int64#4
# asm 2: xor <z0=%i3,<z1=%l0,>z0=%i3
xor %i3,%l0,%i3

# qhasm: z2 ^= z3
# asm 1: xor <z2=int64#21,<z3=int64#9,>z2=int64#9
# asm 2: xor <z2=%l4,<z3=%g5,>z2=%g5
xor %l4,%g5,%g5

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p00=int64#17
# asm 2: srl <y0=%i1,20,>p00=%l0
srl %i1,20,%l0

# qhasm: inp += 16
# asm 1: add <inp=int64#13,16,>inp=int64#13
# asm 2: add <inp=%o3,16,>inp=%o3
add %o3,16,%o3

# qhasm: inp_stack = inp
# asm 1: stx <inp=int64#13,[%fp+2023->inp_stack=stack64#2]
# asm 2: stx <inp=%o3,[%fp+2023->inp_stack=24]
stx %o3,[%fp+2023-24]

# qhasm: in0 ^= z0
# asm 1: xor <in0=int64#20,<z0=int64#4,>in0=int64#4
# asm 2: xor <in0=%l3,<z0=%i3,>in0=%i3
xor %l3,%i3,%i3

# qhasm: in2 ^= z2
# asm 1: xor <in2=int64#15,<z2=int64#9,>in2=int64#9
# asm 2: xor <in2=%o5,<z2=%g5,>in2=%g5
xor %o5,%g5,%g5

# qhasm: *(uint64 *) (outp + 0) = in0
# asm 1: stx <in0=int64#4,[<outp=int64#18+0]
# asm 2: stx <in0=%i3,[<outp=%l1+0]
stx %i3,[%l1+0]

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p01=int64#4
# asm 2: srl <y0=%i1,12,>p01=%i3
srl %i1,12,%i3

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#17,4080,>p00=int64#13
# asm 2: and <p00=%l0,4080,>p00=%o3
and %l0,4080,%o3

# qhasm: *(uint64 *) (outp + 8) = in2
# asm 1: stx <in2=int64#9,[<outp=int64#18+8]
# asm 2: stx <in2=%g5,[<outp=%l1+8]
stx %g5,[%l1+8]

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#4,4080,>p01=int64#15
# asm 2: and <p01=%i3,4080,>p01=%o5
and %i3,4080,%o5

# qhasm: outp += 16
# asm 1: add <outp=int64#18,16,>outp=int64#4
# asm 2: add <outp=%l1,16,>outp=%i3
add %l1,16,%i3

# qhasm: z0 = x4
# asm 1: ldx [%fp+2023-<x4=stack64#8],>z0=int64#9
# asm 2: ldx [%fp+2023-<x4=72],>z0=%g5
ldx [%fp+2023-72],%g5

# qhasm: aftercopy:
._aftercopy:

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#2,4,>p02=int64#17
# asm 2: srl <y0=%i1,4,>p02=%l0
srl %i1,4,%l0

# qhasm: nop
nop

# qhasm: z1 = x5
# asm 1: ldx [%fp+2023-<x5=stack64#9],>z1=int64#18
# asm 2: ldx [%fp+2023-<x5=80],>z1=%l1
ldx [%fp+2023-80],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#2,4,>p03=int64#2
# asm 2: sll <y0=%i1,4,>p03=%i1
sll %i1,4,%i1

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z2 = x6
# asm 1: ldx [%fp+2023-<x6=stack64#10],>z2=int64#19
# asm 2: ldx [%fp+2023-<x6=88],>z2=%l2
ldx [%fp+2023-88],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#16,20,>p10=int64#20
# asm 2: srl <y1=%o7,20,>p10=%l3
srl %o7,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#2,4080,>p03=int64#2
# asm 2: and <p03=%i1,4080,>p03=%i1
and %i1,4080,%i1

# qhasm: z3 = x7
# asm 1: ldx [%fp+2023-<x7=stack64#11],>z3=int64#21
# asm 2: ldx [%fp+2023-<x7=96],>z3=%l4
ldx [%fp+2023-96],%l4

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#16,12,>p11=int64#22
# asm 2: srl <y1=%o7,12,>p11=%l5
srl %o7,12,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#13],>p00=int64#13
# asm 2: lduw [<table0=%g1+<p00=%o3],>p00=%o3
lduw [%g1+%o3],%o3

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#16,4,>p12=int64#23
# asm 2: srl <y1=%o7,4,>p12=%l6
srl %o7,4,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#16,4,>p13=int64#16
# asm 2: sll <y1=%o7,4,>p13=%o7
sll %o7,4,%o7

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#9,<p00=int64#13,>z0=int64#9
# asm 2: xor <z0=%g5,<p00=%o3,>z0=%g5
xor %g5,%o3,%g5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#16,4080,>p13=int64#13
# asm 2: and <p13=%o7,4080,>p13=%o3
and %o7,4080,%o3

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#2],>p03=int64#2
# asm 2: lduw [<table3=%i0+<p03=%i1],>p03=%i1
lduw [%i0+%i1],%i1

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#11,20,>p20=int64#16
# asm 2: srl <y2=%o1,20,>p20=%o7
srl %o1,20,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l4,<p01=%o5,>z3=%o5
xor %l4,%o5,%o5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#20
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%l3
lduw [%g1+%l3],%l3

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#11,12,>p21=int64#21
# asm 2: srl <y2=%o1,12,>p21=%l4
srl %o1,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l2,<p02=%l0,>z2=%l0
xor %l2,%l0,%l0

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#22],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l5],>p11=%l2
lduw [%g4+%l5],%l2

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#11,4,>p22=int64#22
# asm 2: srl <y2=%o1,4,>p22=%l5
srl %o1,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#18,<p03=int64#2,>z1=int64#2
# asm 2: xor <z1=%l1,<p03=%i1,>z1=%i1
xor %l1,%i1,%i1

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#23],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l6],>p12=%l1
lduw [%o0+%l6],%l1

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#11,4,>p23=int64#11
# asm 2: sll <y2=%o1,4,>p23=%o1
sll %o1,4,%o1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#13],>p13=int64#13
# asm 2: lduw [<table3=%i0+<p13=%o3],>p13=%o3
lduw [%i0+%o3],%o3

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#21
# asm 2: and <p21=%l4,4080,>p21=%l4
and %l4,4080,%l4

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#22
# asm 2: and <p22=%l5,4080,>p22=%l5
and %l5,4080,%l5

# qhasm: outp_stack = outp
# asm 1: stx <outp=int64#4,[%fp+2023->outp_stack=stack64#1]
# asm 2: stx <outp=%i3,[%fp+2023->outp_stack=16]
stx %i3,[%fp+2023-16]

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#6,20,>p30=int64#4
# asm 2: srl <y3=%i5,20,>p30=%i3
srl %i5,20,%i3

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#11,4080,>p23=int64#11
# asm 2: and <p23=%o1,4080,>p23=%o1
and %o1,4080,%o1

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#6,12,>p31=int64#23
# asm 2: srl <y3=%i5,12,>p31=%l6
srl %i5,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#9,<p11=int64#19,>z0=int64#9
# asm 2: xor <z0=%g5,<p11=%l2,>z0=%g5
xor %g5,%l2,%g5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#21],>p21=int64#19
# asm 2: lduw [<table1=%g4+<p21=%l4],>p21=%l2
lduw [%g4+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#6,4,>p32=int64#21
# asm 2: srl <y3=%i5,4,>p32=%l4
srl %i5,4,%l4

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#2,<p10=int64#20,>z1=int64#2
# asm 2: xor <z1=%i1,<p10=%l3,>z1=%i1
xor %i1,%l3,%i1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#22],>p22=int64#20
# asm 2: lduw [<table2=%o0+<p22=%l5],>p22=%l3
lduw [%o0+%l5],%l3

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#6,4,>p33=int64#6
# asm 2: sll <y3=%i5,4,>p33=%i5
sll %i5,4,%i5

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#4,4080,>p30=int64#4
# asm 2: and <p30=%i3,4080,>p30=%i3
and %i3,4080,%i3

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#11],>p23=int64#11
# asm 2: lduw [<table3=%i0+<p23=%o1],>p23=%o1
lduw [%i0+%o1],%o1

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#6,4080,>p33=int64#6
# asm 2: and <p33=%i5,4080,>p33=%i5
and %i5,4080,%i5

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#22
# asm 2: and <p31=%l6,4080,>p31=%l5
and %l6,4080,%l5

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#4],>p30=int64#4
# asm 2: lduw [<table0=%g1+<p30=%i3],>p30=%i3
lduw [%g1+%i3],%i3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#18
# asm 2: and <p32=%l4,4080,>p32=%l1
and %l4,4080,%l1

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#22],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l5],>p31=%l4
lduw [%g4+%l5],%l4

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#17,<p20=int64#16,>z2=int64#16
# asm 2: xor <z2=%l0,<p20=%o7,>z2=%o7
xor %l0,%o7,%o7

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#9,<p22=int64#20,>z0=int64#9
# asm 2: xor <z0=%g5,<p22=%l3,>z0=%g5
xor %g5,%l3,%g5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#18],>p32=int64#17
# asm 2: lduw [<table2=%o0+<p32=%l1],>p32=%l0
lduw [%o0+%l1],%l0

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#13,>z2=int64#13
# asm 2: xor <z2=%o7,<p13=%o3,>z2=%o3
xor %o7,%o3,%o3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#2,<p21=int64#19,>z1=int64#2
# asm 2: xor <z1=%i1,<p21=%l2,>z1=%i1
xor %i1,%l2,%i1

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#6],>p33=int64#6
# asm 2: lduw [<table3=%i0+<p33=%i5],>p33=%i5
lduw [%i0+%i5],%i5

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#11,>z3=int64#11
# asm 2: xor <z3=%o5,<p23=%o1,>z3=%o1
xor %o5,%o1,%o1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#13,<p31=int64#21,>y2=int64#13
# asm 2: xor <z2=%o3,<p31=%l4,>y2=%o3
xor %o3,%l4,%o3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#2,<p32=int64#17,>y1=int64#2
# asm 2: xor <z1=%i1,<p32=%l0,>y1=%i1
xor %i1,%l0,%i1

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#9,<p33=int64#6,>y0=int64#6
# asm 2: xor <z0=%g5,<p33=%i5,>y0=%i5
xor %g5,%i5,%i5

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#6,20,>p00=int64#9
# asm 2: srl <y0=%i5,20,>p00=%g5
srl %i5,20,%g5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#11,<p30=int64#4,>y3=int64#4
# asm 2: xor <z3=%o1,<p30=%i3,>y3=%i3
xor %o1,%i3,%i3

# qhasm: z0 = x8
# asm 1: ldx [%fp+2023-<x8=stack64#12],>z0=int64#11
# asm 2: ldx [%fp+2023-<x8=104],>z0=%o1
ldx [%fp+2023-104],%o1

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#6,12,>p01=int64#15
# asm 2: srl <y0=%i5,12,>p01=%o5
srl %i5,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#9,4080,>p00=int64#9
# asm 2: and <p00=%g5,4080,>p00=%g5
and %g5,4080,%g5

# qhasm: z1 = x9
# asm 1: ldx [%fp+2023-<x9=stack64#13],>z1=int64#16
# asm 2: ldx [%fp+2023-<x9=112],>z1=%o7
ldx [%fp+2023-112],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#6,4,>p02=int64#17
# asm 2: srl <y0=%i5,4,>p02=%l0
srl %i5,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x10
# asm 1: ldx [%fp+2023-<x10=stack64#14],>z2=int64#18
# asm 2: ldx [%fp+2023-<x10=120],>z2=%l1
ldx [%fp+2023-120],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#6,4,>p03=int64#6
# asm 2: sll <y0=%i5,4,>p03=%i5
sll %i5,4,%i5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x11
# asm 1: ldx [%fp+2023-<x11=stack64#15],>z3=int64#19
# asm 2: ldx [%fp+2023-<x11=128],>z3=%l2
ldx [%fp+2023-128],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#2,20,>p10=int64#20
# asm 2: srl <y1=%i1,20,>p10=%l3
srl %i1,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#6,4080,>p03=int64#6
# asm 2: and <p03=%i5,4080,>p03=%i5
and %i5,4080,%i5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#9],>p00=int64#9
# asm 2: lduw [<table0=%g1+<p00=%g5],>p00=%g5
lduw [%g1+%g5],%g5

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#2,12,>p11=int64#21
# asm 2: srl <y1=%i1,12,>p11=%l4
srl %i1,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#2,4,>p12=int64#22
# asm 2: srl <y1=%i1,4,>p12=%l5
srl %i1,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#2,4,>p13=int64#2
# asm 2: sll <y1=%i1,4,>p13=%i1
sll %i1,4,%i1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#6],>p03=int64#6
# asm 2: lduw [<table3=%i0+<p03=%i5],>p03=%i5
lduw [%i0+%i5],%i5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#2,4080,>p13=int64#2
# asm 2: and <p13=%i1,4080,>p13=%i1
and %i1,4080,%i1

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#11,<p00=int64#9,>z0=int64#9
# asm 2: xor <z0=%o1,<p00=%g5,>z0=%g5
xor %o1,%g5,%g5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#11
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o1
lduw [%g1+%l3],%o1

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#13,20,>p20=int64#20
# asm 2: srl <y2=%o3,20,>p20=%l3
srl %o3,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#13,12,>p21=int64#21
# asm 2: srl <y2=%o3,12,>p21=%l4
srl %o3,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#13,4,>p22=int64#22
# asm 2: srl <y2=%o3,4,>p22=%l5
srl %o3,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#6,>z1=int64#6
# asm 2: xor <z1=%o7,<p03=%i5,>z1=%i5
xor %o7,%i5,%i5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#2],>p13=int64#2
# asm 2: lduw [<table3=%i0+<p13=%i1],>p13=%i1
lduw [%i0+%i1],%i1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#13,4,>p23=int64#13
# asm 2: sll <y2=%o3,4,>p23=%o3
sll %o3,4,%o3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#4,20,>p30=int64#22
# asm 2: srl <y3=%i3,20,>p30=%l5
srl %i3,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#13,4080,>p23=int64#13
# asm 2: and <p23=%o3,4080,>p23=%o3
and %o3,4080,%o3

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#4,12,>p31=int64#23
# asm 2: srl <y3=%i3,12,>p31=%l6
srl %i3,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#9,<p11=int64#19,>z0=int64#9
# asm 2: xor <z0=%g5,<p11=%l2,>z0=%g5
xor %g5,%l2,%g5

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#4,4,>p32=int64#21
# asm 2: srl <y3=%i3,4,>p32=%l4
srl %i3,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#13],>p23=int64#13
# asm 2: lduw [<table3=%i0+<p23=%o3],>p23=%o3
lduw [%i0+%o3],%o3

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#4,4,>p33=int64#4
# asm 2: sll <y3=%i3,4,>p33=%i3
sll %i3,4,%i3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#6,<p10=int64#11,>z1=int64#6
# asm 2: xor <z1=%i5,<p10=%o1,>z1=%i5
xor %i5,%o1,%i5

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#11
# asm 2: and <p32=%l4,4080,>p32=%o1
and %l4,4080,%o1

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#4,4080,>p33=int64#4
# asm 2: and <p33=%i3,4080,>p33=%i3
and %i3,4080,%i3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#11],>p32=int64#11
# asm 2: lduw [<table2=%o0+<p32=%o1],>p32=%o1
lduw [%o0+%o1],%o1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#2,>z2=int64#2
# asm 2: xor <z2=%l0,<p13=%i1,>z2=%i1
xor %l0,%i1,%i1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#2,<p20=int64#16,>z2=int64#2
# asm 2: xor <z2=%i1,<p20=%o7,>z2=%i1
xor %i1,%o7,%i1

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#4],>p33=int64#4
# asm 2: lduw [<table3=%i0+<p33=%i3],>p33=%i3
lduw [%i0+%i3],%i3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#6,<p21=int64#20,>z1=int64#6
# asm 2: xor <z1=%i5,<p21=%l3,>z1=%i5
xor %i5,%l3,%i5

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#9,<p22=int64#19,>z0=int64#9
# asm 2: xor <z0=%g5,<p22=%l2,>z0=%g5
xor %g5,%l2,%g5

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#13,>z3=int64#13
# asm 2: xor <z3=%o5,<p23=%o3,>z3=%o3
xor %o5,%o3,%o3

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#2,<p31=int64#21,>y2=int64#2
# asm 2: xor <z2=%i1,<p31=%l4,>y2=%i1
xor %i1,%l4,%i1

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#13,<p30=int64#22,>y3=int64#13
# asm 2: xor <z3=%o3,<p30=%l5,>y3=%o3
xor %o3,%l5,%o3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#9,<p33=int64#4,>y0=int64#4
# asm 2: xor <z0=%g5,<p33=%i3,>y0=%i3
xor %g5,%i3,%i3

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#4,20,>p00=int64#9
# asm 2: srl <y0=%i3,20,>p00=%g5
srl %i3,20,%g5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#6,<p32=int64#11,>y1=int64#6
# asm 2: xor <z1=%i5,<p32=%o1,>y1=%i5
xor %i5,%o1,%i5

# qhasm: z0 = x12
# asm 1: ldx [%fp+2023-<x12=stack64#16],>z0=int64#11
# asm 2: ldx [%fp+2023-<x12=136],>z0=%o1
ldx [%fp+2023-136],%o1

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#4,12,>p01=int64#15
# asm 2: srl <y0=%i3,12,>p01=%o5
srl %i3,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#9,4080,>p00=int64#9
# asm 2: and <p00=%g5,4080,>p00=%g5
and %g5,4080,%g5

# qhasm: z1 = x13
# asm 1: ldx [%fp+2023-<x13=stack64#17],>z1=int64#16
# asm 2: ldx [%fp+2023-<x13=144],>z1=%o7
ldx [%fp+2023-144],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#4,4,>p02=int64#17
# asm 2: srl <y0=%i3,4,>p02=%l0
srl %i3,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x14
# asm 1: ldx [%fp+2023-<x14=stack64#18],>z2=int64#18
# asm 2: ldx [%fp+2023-<x14=152],>z2=%l1
ldx [%fp+2023-152],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#4,4,>p03=int64#4
# asm 2: sll <y0=%i3,4,>p03=%i3
sll %i3,4,%i3

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x15
# asm 1: ldx [%fp+2023-<x15=stack64#19],>z3=int64#19
# asm 2: ldx [%fp+2023-<x15=160],>z3=%l2
ldx [%fp+2023-160],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#6,20,>p10=int64#20
# asm 2: srl <y1=%i5,20,>p10=%l3
srl %i5,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#4,4080,>p03=int64#4
# asm 2: and <p03=%i3,4080,>p03=%i3
and %i3,4080,%i3

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#9],>p00=int64#9
# asm 2: lduw [<table0=%g1+<p00=%g5],>p00=%g5
lduw [%g1+%g5],%g5

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#6,12,>p11=int64#21
# asm 2: srl <y1=%i5,12,>p11=%l4
srl %i5,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#6,4,>p12=int64#22
# asm 2: srl <y1=%i5,4,>p12=%l5
srl %i5,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#6,4,>p13=int64#6
# asm 2: sll <y1=%i5,4,>p13=%i5
sll %i5,4,%i5

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#4],>p03=int64#4
# asm 2: lduw [<table3=%i0+<p03=%i3],>p03=%i3
lduw [%i0+%i3],%i3

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#6,4080,>p13=int64#6
# asm 2: and <p13=%i5,4080,>p13=%i5
and %i5,4080,%i5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#11,<p00=int64#9,>z0=int64#9
# asm 2: xor <z0=%o1,<p00=%g5,>z0=%g5
xor %o1,%g5,%g5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#11
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o1
lduw [%g1+%l3],%o1

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#2,20,>p20=int64#20
# asm 2: srl <y2=%i1,20,>p20=%l3
srl %i1,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#2,12,>p21=int64#21
# asm 2: srl <y2=%i1,12,>p21=%l4
srl %i1,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#2,4,>p22=int64#22
# asm 2: srl <y2=%i1,4,>p22=%l5
srl %i1,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#4,>z1=int64#4
# asm 2: xor <z1=%o7,<p03=%i3,>z1=%i3
xor %o7,%i3,%i3

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#6],>p13=int64#6
# asm 2: lduw [<table3=%i0+<p13=%i5],>p13=%i5
lduw [%i0+%i5],%i5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#2,4,>p23=int64#2
# asm 2: sll <y2=%i1,4,>p23=%i1
sll %i1,4,%i1

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#13,20,>p30=int64#22
# asm 2: srl <y3=%o3,20,>p30=%l5
srl %o3,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#2,4080,>p23=int64#2
# asm 2: and <p23=%i1,4080,>p23=%i1
and %i1,4080,%i1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#13,12,>p31=int64#23
# asm 2: srl <y3=%o3,12,>p31=%l6
srl %o3,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#9,<p11=int64#19,>z0=int64#9
# asm 2: xor <z0=%g5,<p11=%l2,>z0=%g5
xor %g5,%l2,%g5

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#13,4,>p32=int64#21
# asm 2: srl <y3=%o3,4,>p32=%l4
srl %o3,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#2],>p23=int64#2
# asm 2: lduw [<table3=%i0+<p23=%i1],>p23=%i1
lduw [%i0+%i1],%i1

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#13,4,>p33=int64#13
# asm 2: sll <y3=%o3,4,>p33=%o3
sll %o3,4,%o3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#4,<p10=int64#11,>z1=int64#4
# asm 2: xor <z1=%i3,<p10=%o1,>z1=%i3
xor %i3,%o1,%i3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#11
# asm 2: and <p32=%l4,4080,>p32=%o1
and %l4,4080,%o1

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#13,4080,>p33=int64#13
# asm 2: and <p33=%o3,4080,>p33=%o3
and %o3,4080,%o3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#11],>p32=int64#11
# asm 2: lduw [<table2=%o0+<p32=%o1],>p32=%o1
lduw [%o0+%o1],%o1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#6,>z2=int64#6
# asm 2: xor <z2=%l0,<p13=%i5,>z2=%i5
xor %l0,%i5,%i5

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#6,<p20=int64#16,>z2=int64#6
# asm 2: xor <z2=%i5,<p20=%o7,>z2=%i5
xor %i5,%o7,%i5

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#13],>p33=int64#13
# asm 2: lduw [<table3=%i0+<p33=%o3],>p33=%o3
lduw [%i0+%o3],%o3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#4,<p21=int64#20,>z1=int64#4
# asm 2: xor <z1=%i3,<p21=%l3,>z1=%i3
xor %i3,%l3,%i3

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#9,<p22=int64#19,>z0=int64#9
# asm 2: xor <z0=%g5,<p22=%l2,>z0=%g5
xor %g5,%l2,%g5

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#2,>z3=int64#2
# asm 2: xor <z3=%o5,<p23=%i1,>z3=%i1
xor %o5,%i1,%i1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#6,<p31=int64#21,>y2=int64#6
# asm 2: xor <z2=%i5,<p31=%l4,>y2=%i5
xor %i5,%l4,%i5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#2,<p30=int64#22,>y3=int64#2
# asm 2: xor <z3=%i1,<p30=%l5,>y3=%i1
xor %i1,%l5,%i1

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#9,<p33=int64#13,>y0=int64#9
# asm 2: xor <z0=%g5,<p33=%o3,>y0=%g5
xor %g5,%o3,%g5

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#9,20,>p00=int64#13
# asm 2: srl <y0=%g5,20,>p00=%o3
srl %g5,20,%o3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#4,<p32=int64#11,>y1=int64#4
# asm 2: xor <z1=%i3,<p32=%o1,>y1=%i3
xor %i3,%o1,%i3

# qhasm: z0 = x16
# asm 1: ldx [%fp+2023-<x16=stack64#20],>z0=int64#11
# asm 2: ldx [%fp+2023-<x16=168],>z0=%o1
ldx [%fp+2023-168],%o1

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#9,12,>p01=int64#15
# asm 2: srl <y0=%g5,12,>p01=%o5
srl %g5,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#13,4080,>p00=int64#13
# asm 2: and <p00=%o3,4080,>p00=%o3
and %o3,4080,%o3

# qhasm: z1 = x17
# asm 1: ldx [%fp+2023-<x17=stack64#21],>z1=int64#16
# asm 2: ldx [%fp+2023-<x17=176],>z1=%o7
ldx [%fp+2023-176],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#9,4,>p02=int64#17
# asm 2: srl <y0=%g5,4,>p02=%l0
srl %g5,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x18
# asm 1: ldx [%fp+2023-<x18=stack64#22],>z2=int64#18
# asm 2: ldx [%fp+2023-<x18=184],>z2=%l1
ldx [%fp+2023-184],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#9,4,>p03=int64#9
# asm 2: sll <y0=%g5,4,>p03=%g5
sll %g5,4,%g5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x19
# asm 1: ldx [%fp+2023-<x19=stack64#23],>z3=int64#19
# asm 2: ldx [%fp+2023-<x19=192],>z3=%l2
ldx [%fp+2023-192],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#4,20,>p10=int64#20
# asm 2: srl <y1=%i3,20,>p10=%l3
srl %i3,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#9,4080,>p03=int64#9
# asm 2: and <p03=%g5,4080,>p03=%g5
and %g5,4080,%g5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#13],>p00=int64#13
# asm 2: lduw [<table0=%g1+<p00=%o3],>p00=%o3
lduw [%g1+%o3],%o3

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#4,12,>p11=int64#21
# asm 2: srl <y1=%i3,12,>p11=%l4
srl %i3,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#4,4,>p12=int64#22
# asm 2: srl <y1=%i3,4,>p12=%l5
srl %i3,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#4,4,>p13=int64#4
# asm 2: sll <y1=%i3,4,>p13=%i3
sll %i3,4,%i3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#9],>p03=int64#9
# asm 2: lduw [<table3=%i0+<p03=%g5],>p03=%g5
lduw [%i0+%g5],%g5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#4,4080,>p13=int64#4
# asm 2: and <p13=%i3,4080,>p13=%i3
and %i3,4080,%i3

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#11,<p00=int64#13,>z0=int64#11
# asm 2: xor <z0=%o1,<p00=%o3,>z0=%o1
xor %o1,%o3,%o1

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#13
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o3
lduw [%g1+%l3],%o3

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#6,20,>p20=int64#20
# asm 2: srl <y2=%i5,20,>p20=%l3
srl %i5,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#6,12,>p21=int64#21
# asm 2: srl <y2=%i5,12,>p21=%l4
srl %i5,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#6,4,>p22=int64#22
# asm 2: srl <y2=%i5,4,>p22=%l5
srl %i5,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#9,>z1=int64#9
# asm 2: xor <z1=%o7,<p03=%g5,>z1=%g5
xor %o7,%g5,%g5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#4],>p13=int64#4
# asm 2: lduw [<table3=%i0+<p13=%i3],>p13=%i3
lduw [%i0+%i3],%i3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#6,4,>p23=int64#6
# asm 2: sll <y2=%i5,4,>p23=%i5
sll %i5,4,%i5

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#2,20,>p30=int64#22
# asm 2: srl <y3=%i1,20,>p30=%l5
srl %i1,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#6,4080,>p23=int64#6
# asm 2: and <p23=%i5,4080,>p23=%i5
and %i5,4080,%i5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#2,12,>p31=int64#23
# asm 2: srl <y3=%i1,12,>p31=%l6
srl %i1,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#2,4,>p32=int64#21
# asm 2: srl <y3=%i1,4,>p32=%l4
srl %i1,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#6],>p23=int64#6
# asm 2: lduw [<table3=%i0+<p23=%i5],>p23=%i5
lduw [%i0+%i5],%i5

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#2,4,>p33=int64#2
# asm 2: sll <y3=%i1,4,>p33=%i1
sll %i1,4,%i1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#9,<p10=int64#13,>z1=int64#9
# asm 2: xor <z1=%g5,<p10=%o3,>z1=%g5
xor %g5,%o3,%g5

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#13
# asm 2: and <p32=%l4,4080,>p32=%o3
and %l4,4080,%o3

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#2,4080,>p33=int64#2
# asm 2: and <p33=%i1,4080,>p33=%i1
and %i1,4080,%i1

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#13],>p32=int64#13
# asm 2: lduw [<table2=%o0+<p32=%o3],>p32=%o3
lduw [%o0+%o3],%o3

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#4,>z2=int64#4
# asm 2: xor <z2=%l0,<p13=%i3,>z2=%i3
xor %l0,%i3,%i3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#4,<p20=int64#16,>z2=int64#4
# asm 2: xor <z2=%i3,<p20=%o7,>z2=%i3
xor %i3,%o7,%i3

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#2],>p33=int64#2
# asm 2: lduw [<table3=%i0+<p33=%i1],>p33=%i1
lduw [%i0+%i1],%i1

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#9,<p21=int64#20,>z1=int64#9
# asm 2: xor <z1=%g5,<p21=%l3,>z1=%g5
xor %g5,%l3,%g5

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p22=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#6,>z3=int64#6
# asm 2: xor <z3=%o5,<p23=%i5,>z3=%i5
xor %o5,%i5,%i5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#4,<p31=int64#21,>y2=int64#4
# asm 2: xor <z2=%i3,<p31=%l4,>y2=%i3
xor %i3,%l4,%i3

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#6,<p30=int64#22,>y3=int64#6
# asm 2: xor <z3=%i5,<p30=%l5,>y3=%i5
xor %i5,%l5,%i5

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#11,<p33=int64#2,>y0=int64#2
# asm 2: xor <z0=%o1,<p33=%i1,>y0=%i1
xor %o1,%i1,%i1

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p00=int64#11
# asm 2: srl <y0=%i1,20,>p00=%o1
srl %i1,20,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#9,<p32=int64#13,>y1=int64#9
# asm 2: xor <z1=%g5,<p32=%o3,>y1=%g5
xor %g5,%o3,%g5

# qhasm: z0 = x20
# asm 1: ldx [%fp+2023-<x20=stack64#24],>z0=int64#13
# asm 2: ldx [%fp+2023-<x20=200],>z0=%o3
ldx [%fp+2023-200],%o3

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p01=int64#15
# asm 2: srl <y0=%i1,12,>p01=%o5
srl %i1,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#11,4080,>p00=int64#11
# asm 2: and <p00=%o1,4080,>p00=%o1
and %o1,4080,%o1

# qhasm: z1 = x21
# asm 1: ldx [%fp+2023-<x21=stack64#25],>z1=int64#16
# asm 2: ldx [%fp+2023-<x21=208],>z1=%o7
ldx [%fp+2023-208],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#2,4,>p02=int64#17
# asm 2: srl <y0=%i1,4,>p02=%l0
srl %i1,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x22
# asm 1: ldx [%fp+2023-<x22=stack64#26],>z2=int64#18
# asm 2: ldx [%fp+2023-<x22=216],>z2=%l1
ldx [%fp+2023-216],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#2,4,>p03=int64#2
# asm 2: sll <y0=%i1,4,>p03=%i1
sll %i1,4,%i1

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x23
# asm 1: ldx [%fp+2023-<x23=stack64#27],>z3=int64#19
# asm 2: ldx [%fp+2023-<x23=224],>z3=%l2
ldx [%fp+2023-224],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#9,20,>p10=int64#20
# asm 2: srl <y1=%g5,20,>p10=%l3
srl %g5,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#2,4080,>p03=int64#2
# asm 2: and <p03=%i1,4080,>p03=%i1
and %i1,4080,%i1

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#11],>p00=int64#11
# asm 2: lduw [<table0=%g1+<p00=%o1],>p00=%o1
lduw [%g1+%o1],%o1

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#9,12,>p11=int64#21
# asm 2: srl <y1=%g5,12,>p11=%l4
srl %g5,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#9,4,>p12=int64#22
# asm 2: srl <y1=%g5,4,>p12=%l5
srl %g5,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#9,4,>p13=int64#9
# asm 2: sll <y1=%g5,4,>p13=%g5
sll %g5,4,%g5

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#2],>p03=int64#2
# asm 2: lduw [<table3=%i0+<p03=%i1],>p03=%i1
lduw [%i0+%i1],%i1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#9,4080,>p13=int64#9
# asm 2: and <p13=%g5,4080,>p13=%g5
and %g5,4080,%g5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#13,<p00=int64#11,>z0=int64#11
# asm 2: xor <z0=%o3,<p00=%o1,>z0=%o1
xor %o3,%o1,%o1

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#13
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o3
lduw [%g1+%l3],%o3

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#4,20,>p20=int64#20
# asm 2: srl <y2=%i3,20,>p20=%l3
srl %i3,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#4,12,>p21=int64#21
# asm 2: srl <y2=%i3,12,>p21=%l4
srl %i3,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#4,4,>p22=int64#22
# asm 2: srl <y2=%i3,4,>p22=%l5
srl %i3,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#2,>z1=int64#2
# asm 2: xor <z1=%o7,<p03=%i1,>z1=%i1
xor %o7,%i1,%i1

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#9],>p13=int64#9
# asm 2: lduw [<table3=%i0+<p13=%g5],>p13=%g5
lduw [%i0+%g5],%g5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#4,4,>p23=int64#4
# asm 2: sll <y2=%i3,4,>p23=%i3
sll %i3,4,%i3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#6,20,>p30=int64#22
# asm 2: srl <y3=%i5,20,>p30=%l5
srl %i5,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#4,4080,>p23=int64#4
# asm 2: and <p23=%i3,4080,>p23=%i3
and %i3,4080,%i3

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#6,12,>p31=int64#23
# asm 2: srl <y3=%i5,12,>p31=%l6
srl %i5,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#6,4,>p32=int64#21
# asm 2: srl <y3=%i5,4,>p32=%l4
srl %i5,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#4],>p23=int64#4
# asm 2: lduw [<table3=%i0+<p23=%i3],>p23=%i3
lduw [%i0+%i3],%i3

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#6,4,>p33=int64#6
# asm 2: sll <y3=%i5,4,>p33=%i5
sll %i5,4,%i5

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#2,<p10=int64#13,>z1=int64#2
# asm 2: xor <z1=%i1,<p10=%o3,>z1=%i1
xor %i1,%o3,%i1

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#13
# asm 2: and <p32=%l4,4080,>p32=%o3
and %l4,4080,%o3

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#6,4080,>p33=int64#6
# asm 2: and <p33=%i5,4080,>p33=%i5
and %i5,4080,%i5

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#13],>p32=int64#13
# asm 2: lduw [<table2=%o0+<p32=%o3],>p32=%o3
lduw [%o0+%o3],%o3

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#9,>z2=int64#9
# asm 2: xor <z2=%l0,<p13=%g5,>z2=%g5
xor %l0,%g5,%g5

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#9,<p20=int64#16,>z2=int64#9
# asm 2: xor <z2=%g5,<p20=%o7,>z2=%g5
xor %g5,%o7,%g5

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#6],>p33=int64#6
# asm 2: lduw [<table3=%i0+<p33=%i5],>p33=%i5
lduw [%i0+%i5],%i5

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#2,<p21=int64#20,>z1=int64#2
# asm 2: xor <z1=%i1,<p21=%l3,>z1=%i1
xor %i1,%l3,%i1

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p22=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#4,>z3=int64#4
# asm 2: xor <z3=%o5,<p23=%i3,>z3=%i3
xor %o5,%i3,%i3

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#9,<p31=int64#21,>y2=int64#9
# asm 2: xor <z2=%g5,<p31=%l4,>y2=%g5
xor %g5,%l4,%g5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#4,<p30=int64#22,>y3=int64#4
# asm 2: xor <z3=%i3,<p30=%l5,>y3=%i3
xor %i3,%l5,%i3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#11,<p33=int64#6,>y0=int64#6
# asm 2: xor <z0=%o1,<p33=%i5,>y0=%i5
xor %o1,%i5,%i5

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#6,20,>p00=int64#11
# asm 2: srl <y0=%i5,20,>p00=%o1
srl %i5,20,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#2,<p32=int64#13,>y1=int64#2
# asm 2: xor <z1=%i1,<p32=%o3,>y1=%i1
xor %i1,%o3,%i1

# qhasm: z0 = x24
# asm 1: ldx [%fp+2023-<x24=stack64#28],>z0=int64#13
# asm 2: ldx [%fp+2023-<x24=232],>z0=%o3
ldx [%fp+2023-232],%o3

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#6,12,>p01=int64#15
# asm 2: srl <y0=%i5,12,>p01=%o5
srl %i5,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#11,4080,>p00=int64#11
# asm 2: and <p00=%o1,4080,>p00=%o1
and %o1,4080,%o1

# qhasm: z1 = x25
# asm 1: ldx [%fp+2023-<x25=stack64#29],>z1=int64#16
# asm 2: ldx [%fp+2023-<x25=240],>z1=%o7
ldx [%fp+2023-240],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#6,4,>p02=int64#17
# asm 2: srl <y0=%i5,4,>p02=%l0
srl %i5,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x26
# asm 1: ldx [%fp+2023-<x26=stack64#30],>z2=int64#18
# asm 2: ldx [%fp+2023-<x26=248],>z2=%l1
ldx [%fp+2023-248],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#6,4,>p03=int64#6
# asm 2: sll <y0=%i5,4,>p03=%i5
sll %i5,4,%i5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x27
# asm 1: ldx [%fp+2023-<x27=stack64#31],>z3=int64#19
# asm 2: ldx [%fp+2023-<x27=256],>z3=%l2
ldx [%fp+2023-256],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#2,20,>p10=int64#20
# asm 2: srl <y1=%i1,20,>p10=%l3
srl %i1,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#6,4080,>p03=int64#6
# asm 2: and <p03=%i5,4080,>p03=%i5
and %i5,4080,%i5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#11],>p00=int64#11
# asm 2: lduw [<table0=%g1+<p00=%o1],>p00=%o1
lduw [%g1+%o1],%o1

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#2,12,>p11=int64#21
# asm 2: srl <y1=%i1,12,>p11=%l4
srl %i1,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#2,4,>p12=int64#22
# asm 2: srl <y1=%i1,4,>p12=%l5
srl %i1,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#2,4,>p13=int64#2
# asm 2: sll <y1=%i1,4,>p13=%i1
sll %i1,4,%i1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#6],>p03=int64#6
# asm 2: lduw [<table3=%i0+<p03=%i5],>p03=%i5
lduw [%i0+%i5],%i5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#2,4080,>p13=int64#2
# asm 2: and <p13=%i1,4080,>p13=%i1
and %i1,4080,%i1

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#13,<p00=int64#11,>z0=int64#11
# asm 2: xor <z0=%o3,<p00=%o1,>z0=%o1
xor %o3,%o1,%o1

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#13
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o3
lduw [%g1+%l3],%o3

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#9,20,>p20=int64#20
# asm 2: srl <y2=%g5,20,>p20=%l3
srl %g5,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#9,12,>p21=int64#21
# asm 2: srl <y2=%g5,12,>p21=%l4
srl %g5,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#9,4,>p22=int64#22
# asm 2: srl <y2=%g5,4,>p22=%l5
srl %g5,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#6,>z1=int64#6
# asm 2: xor <z1=%o7,<p03=%i5,>z1=%i5
xor %o7,%i5,%i5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#2],>p13=int64#2
# asm 2: lduw [<table3=%i0+<p13=%i1],>p13=%i1
lduw [%i0+%i1],%i1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#9,4,>p23=int64#9
# asm 2: sll <y2=%g5,4,>p23=%g5
sll %g5,4,%g5

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#4,20,>p30=int64#22
# asm 2: srl <y3=%i3,20,>p30=%l5
srl %i3,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#9,4080,>p23=int64#9
# asm 2: and <p23=%g5,4080,>p23=%g5
and %g5,4080,%g5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#4,12,>p31=int64#23
# asm 2: srl <y3=%i3,12,>p31=%l6
srl %i3,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#4,4,>p32=int64#21
# asm 2: srl <y3=%i3,4,>p32=%l4
srl %i3,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#9],>p23=int64#9
# asm 2: lduw [<table3=%i0+<p23=%g5],>p23=%g5
lduw [%i0+%g5],%g5

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#4,4,>p33=int64#4
# asm 2: sll <y3=%i3,4,>p33=%i3
sll %i3,4,%i3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#6,<p10=int64#13,>z1=int64#6
# asm 2: xor <z1=%i5,<p10=%o3,>z1=%i5
xor %i5,%o3,%i5

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#13
# asm 2: and <p32=%l4,4080,>p32=%o3
and %l4,4080,%o3

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#4,4080,>p33=int64#4
# asm 2: and <p33=%i3,4080,>p33=%i3
and %i3,4080,%i3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#13],>p32=int64#13
# asm 2: lduw [<table2=%o0+<p32=%o3],>p32=%o3
lduw [%o0+%o3],%o3

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#2,>z2=int64#2
# asm 2: xor <z2=%l0,<p13=%i1,>z2=%i1
xor %l0,%i1,%i1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#2,<p20=int64#16,>z2=int64#2
# asm 2: xor <z2=%i1,<p20=%o7,>z2=%i1
xor %i1,%o7,%i1

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#4],>p33=int64#4
# asm 2: lduw [<table3=%i0+<p33=%i3],>p33=%i3
lduw [%i0+%i3],%i3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#6,<p21=int64#20,>z1=int64#6
# asm 2: xor <z1=%i5,<p21=%l3,>z1=%i5
xor %i5,%l3,%i5

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p22=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#9,>z3=int64#9
# asm 2: xor <z3=%o5,<p23=%g5,>z3=%g5
xor %o5,%g5,%g5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#2,<p31=int64#21,>y2=int64#2
# asm 2: xor <z2=%i1,<p31=%l4,>y2=%i1
xor %i1,%l4,%i1

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#9,<p30=int64#22,>y3=int64#9
# asm 2: xor <z3=%g5,<p30=%l5,>y3=%g5
xor %g5,%l5,%g5

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#11,<p33=int64#4,>y0=int64#4
# asm 2: xor <z0=%o1,<p33=%i3,>y0=%i3
xor %o1,%i3,%i3

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#4,20,>p00=int64#11
# asm 2: srl <y0=%i3,20,>p00=%o1
srl %i3,20,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#6,<p32=int64#13,>y1=int64#6
# asm 2: xor <z1=%i5,<p32=%o3,>y1=%i5
xor %i5,%o3,%i5

# qhasm: z0 = x28
# asm 1: ldx [%fp+2023-<x28=stack64#32],>z0=int64#13
# asm 2: ldx [%fp+2023-<x28=264],>z0=%o3
ldx [%fp+2023-264],%o3

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#4,12,>p01=int64#15
# asm 2: srl <y0=%i3,12,>p01=%o5
srl %i3,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#11,4080,>p00=int64#11
# asm 2: and <p00=%o1,4080,>p00=%o1
and %o1,4080,%o1

# qhasm: z1 = x29
# asm 1: ldx [%fp+2023-<x29=stack64#33],>z1=int64#16
# asm 2: ldx [%fp+2023-<x29=272],>z1=%o7
ldx [%fp+2023-272],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#4,4,>p02=int64#17
# asm 2: srl <y0=%i3,4,>p02=%l0
srl %i3,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x30
# asm 1: ldx [%fp+2023-<x30=stack64#34],>z2=int64#18
# asm 2: ldx [%fp+2023-<x30=280],>z2=%l1
ldx [%fp+2023-280],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#4,4,>p03=int64#4
# asm 2: sll <y0=%i3,4,>p03=%i3
sll %i3,4,%i3

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x31
# asm 1: ldx [%fp+2023-<x31=stack64#35],>z3=int64#19
# asm 2: ldx [%fp+2023-<x31=288],>z3=%l2
ldx [%fp+2023-288],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#6,20,>p10=int64#20
# asm 2: srl <y1=%i5,20,>p10=%l3
srl %i5,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#4,4080,>p03=int64#4
# asm 2: and <p03=%i3,4080,>p03=%i3
and %i3,4080,%i3

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#11],>p00=int64#11
# asm 2: lduw [<table0=%g1+<p00=%o1],>p00=%o1
lduw [%g1+%o1],%o1

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#6,12,>p11=int64#21
# asm 2: srl <y1=%i5,12,>p11=%l4
srl %i5,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#6,4,>p12=int64#22
# asm 2: srl <y1=%i5,4,>p12=%l5
srl %i5,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#6,4,>p13=int64#6
# asm 2: sll <y1=%i5,4,>p13=%i5
sll %i5,4,%i5

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#4],>p03=int64#4
# asm 2: lduw [<table3=%i0+<p03=%i3],>p03=%i3
lduw [%i0+%i3],%i3

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#6,4080,>p13=int64#6
# asm 2: and <p13=%i5,4080,>p13=%i5
and %i5,4080,%i5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#13,<p00=int64#11,>z0=int64#11
# asm 2: xor <z0=%o3,<p00=%o1,>z0=%o1
xor %o3,%o1,%o1

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#13
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o3
lduw [%g1+%l3],%o3

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#2,20,>p20=int64#20
# asm 2: srl <y2=%i1,20,>p20=%l3
srl %i1,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#2,12,>p21=int64#21
# asm 2: srl <y2=%i1,12,>p21=%l4
srl %i1,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#2,4,>p22=int64#22
# asm 2: srl <y2=%i1,4,>p22=%l5
srl %i1,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#4,>z1=int64#4
# asm 2: xor <z1=%o7,<p03=%i3,>z1=%i3
xor %o7,%i3,%i3

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#6],>p13=int64#6
# asm 2: lduw [<table3=%i0+<p13=%i5],>p13=%i5
lduw [%i0+%i5],%i5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#2,4,>p23=int64#2
# asm 2: sll <y2=%i1,4,>p23=%i1
sll %i1,4,%i1

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#9,20,>p30=int64#22
# asm 2: srl <y3=%g5,20,>p30=%l5
srl %g5,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#2,4080,>p23=int64#2
# asm 2: and <p23=%i1,4080,>p23=%i1
and %i1,4080,%i1

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#9,12,>p31=int64#23
# asm 2: srl <y3=%g5,12,>p31=%l6
srl %g5,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#9,4,>p32=int64#21
# asm 2: srl <y3=%g5,4,>p32=%l4
srl %g5,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#2],>p23=int64#2
# asm 2: lduw [<table3=%i0+<p23=%i1],>p23=%i1
lduw [%i0+%i1],%i1

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#9,4,>p33=int64#9
# asm 2: sll <y3=%g5,4,>p33=%g5
sll %g5,4,%g5

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#4,<p10=int64#13,>z1=int64#4
# asm 2: xor <z1=%i3,<p10=%o3,>z1=%i3
xor %i3,%o3,%i3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#13
# asm 2: and <p32=%l4,4080,>p32=%o3
and %l4,4080,%o3

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#9,4080,>p33=int64#9
# asm 2: and <p33=%g5,4080,>p33=%g5
and %g5,4080,%g5

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#13],>p32=int64#13
# asm 2: lduw [<table2=%o0+<p32=%o3],>p32=%o3
lduw [%o0+%o3],%o3

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#6,>z2=int64#6
# asm 2: xor <z2=%l0,<p13=%i5,>z2=%i5
xor %l0,%i5,%i5

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#6,<p20=int64#16,>z2=int64#6
# asm 2: xor <z2=%i5,<p20=%o7,>z2=%i5
xor %i5,%o7,%i5

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#9],>p33=int64#9
# asm 2: lduw [<table3=%i0+<p33=%g5],>p33=%g5
lduw [%i0+%g5],%g5

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#4,<p21=int64#20,>z1=int64#4
# asm 2: xor <z1=%i3,<p21=%l3,>z1=%i3
xor %i3,%l3,%i3

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p22=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#2,>z3=int64#2
# asm 2: xor <z3=%o5,<p23=%i1,>z3=%i1
xor %o5,%i1,%i1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#6,<p31=int64#21,>y2=int64#6
# asm 2: xor <z2=%i5,<p31=%l4,>y2=%i5
xor %i5,%l4,%i5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#2,<p30=int64#22,>y3=int64#2
# asm 2: xor <z3=%i1,<p30=%l5,>y3=%i1
xor %i1,%l5,%i1

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#11,<p33=int64#9,>y0=int64#9
# asm 2: xor <z0=%o1,<p33=%g5,>y0=%g5
xor %o1,%g5,%g5

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#9,20,>p00=int64#11
# asm 2: srl <y0=%g5,20,>p00=%o1
srl %g5,20,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#4,<p32=int64#13,>y1=int64#4
# asm 2: xor <z1=%i3,<p32=%o3,>y1=%i3
xor %i3,%o3,%i3

# qhasm: z0 = x32
# asm 1: ldx [%fp+2023-<x32=stack64#36],>z0=int64#13
# asm 2: ldx [%fp+2023-<x32=296],>z0=%o3
ldx [%fp+2023-296],%o3

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#9,12,>p01=int64#15
# asm 2: srl <y0=%g5,12,>p01=%o5
srl %g5,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#11,4080,>p00=int64#11
# asm 2: and <p00=%o1,4080,>p00=%o1
and %o1,4080,%o1

# qhasm: z1 = x33
# asm 1: ldx [%fp+2023-<x33=stack64#37],>z1=int64#16
# asm 2: ldx [%fp+2023-<x33=304],>z1=%o7
ldx [%fp+2023-304],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#9,4,>p02=int64#17
# asm 2: srl <y0=%g5,4,>p02=%l0
srl %g5,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x34
# asm 1: ldx [%fp+2023-<x34=stack64#38],>z2=int64#18
# asm 2: ldx [%fp+2023-<x34=312],>z2=%l1
ldx [%fp+2023-312],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#9,4,>p03=int64#9
# asm 2: sll <y0=%g5,4,>p03=%g5
sll %g5,4,%g5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x35
# asm 1: ldx [%fp+2023-<x35=stack64#39],>z3=int64#19
# asm 2: ldx [%fp+2023-<x35=320],>z3=%l2
ldx [%fp+2023-320],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#4,20,>p10=int64#20
# asm 2: srl <y1=%i3,20,>p10=%l3
srl %i3,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#9,4080,>p03=int64#9
# asm 2: and <p03=%g5,4080,>p03=%g5
and %g5,4080,%g5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#11],>p00=int64#11
# asm 2: lduw [<table0=%g1+<p00=%o1],>p00=%o1
lduw [%g1+%o1],%o1

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#4,12,>p11=int64#21
# asm 2: srl <y1=%i3,12,>p11=%l4
srl %i3,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#4,4,>p12=int64#22
# asm 2: srl <y1=%i3,4,>p12=%l5
srl %i3,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#4,4,>p13=int64#4
# asm 2: sll <y1=%i3,4,>p13=%i3
sll %i3,4,%i3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#9],>p03=int64#9
# asm 2: lduw [<table3=%i0+<p03=%g5],>p03=%g5
lduw [%i0+%g5],%g5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#4,4080,>p13=int64#4
# asm 2: and <p13=%i3,4080,>p13=%i3
and %i3,4080,%i3

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#13,<p00=int64#11,>z0=int64#11
# asm 2: xor <z0=%o3,<p00=%o1,>z0=%o1
xor %o3,%o1,%o1

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#13
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o3
lduw [%g1+%l3],%o3

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#6,20,>p20=int64#20
# asm 2: srl <y2=%i5,20,>p20=%l3
srl %i5,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#6,12,>p21=int64#21
# asm 2: srl <y2=%i5,12,>p21=%l4
srl %i5,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#6,4,>p22=int64#22
# asm 2: srl <y2=%i5,4,>p22=%l5
srl %i5,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#9,>z1=int64#9
# asm 2: xor <z1=%o7,<p03=%g5,>z1=%g5
xor %o7,%g5,%g5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#4],>p13=int64#4
# asm 2: lduw [<table3=%i0+<p13=%i3],>p13=%i3
lduw [%i0+%i3],%i3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#6,4,>p23=int64#6
# asm 2: sll <y2=%i5,4,>p23=%i5
sll %i5,4,%i5

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#21
# asm 2: and <p22=%l5,4080,>p22=%l4
and %l5,4080,%l4

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#2,20,>p30=int64#22
# asm 2: srl <y3=%i1,20,>p30=%l5
srl %i1,20,%l5

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#6,4080,>p23=int64#6
# asm 2: and <p23=%i5,4080,>p23=%i5
and %i5,4080,%i5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#2,12,>p31=int64#23
# asm 2: srl <y3=%i1,12,>p31=%l6
srl %i1,12,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#21],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l4],>p22=%l2
lduw [%o0+%l4],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#2,4,>p32=int64#21
# asm 2: srl <y3=%i1,4,>p32=%l4
srl %i1,4,%l4

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#6],>p23=int64#6
# asm 2: lduw [<table3=%i0+<p23=%i5],>p23=%i5
lduw [%i0+%i5],%i5

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#2,4,>p33=int64#2
# asm 2: sll <y3=%i1,4,>p33=%i1
sll %i1,4,%i1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table0=%g1+<p30=%l5],>p30=%l5
lduw [%g1+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#9,<p10=int64#13,>z1=int64#9
# asm 2: xor <z1=%g5,<p10=%o3,>z1=%g5
xor %g5,%o3,%g5

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#21,4080,>p32=int64#13
# asm 2: and <p32=%l4,4080,>p32=%o3
and %l4,4080,%o3

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#23],>p31=int64#21
# asm 2: lduw [<table1=%g4+<p31=%l6],>p31=%l4
lduw [%g4+%l6],%l4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#2,4080,>p33=int64#2
# asm 2: and <p33=%i1,4080,>p33=%i1
and %i1,4080,%i1

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#13],>p32=int64#13
# asm 2: lduw [<table2=%o0+<p32=%o3],>p32=%o3
lduw [%o0+%o3],%o3

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#4,>z2=int64#4
# asm 2: xor <z2=%l0,<p13=%i3,>z2=%i3
xor %l0,%i3,%i3

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#4,<p20=int64#16,>z2=int64#4
# asm 2: xor <z2=%i3,<p20=%o7,>z2=%i3
xor %i3,%o7,%i3

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#2],>p33=int64#2
# asm 2: lduw [<table3=%i0+<p33=%i1],>p33=%i1
lduw [%i0+%i1],%i1

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#9,<p21=int64#20,>z1=int64#9
# asm 2: xor <z1=%g5,<p21=%l3,>z1=%g5
xor %g5,%l3,%g5

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p22=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#6,>z3=int64#6
# asm 2: xor <z3=%o5,<p23=%i5,>z3=%i5
xor %o5,%i5,%i5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#4,<p31=int64#21,>y2=int64#4
# asm 2: xor <z2=%i3,<p31=%l4,>y2=%i3
xor %i3,%l4,%i3

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#6,<p30=int64#22,>y3=int64#6
# asm 2: xor <z3=%i5,<p30=%l5,>y3=%i5
xor %i5,%l5,%i5

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#11,<p33=int64#2,>y0=int64#2
# asm 2: xor <z0=%o1,<p33=%i1,>y0=%i1
xor %o1,%i1,%i1

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#2,20,>p00=int64#11
# asm 2: srl <y0=%i1,20,>p00=%o1
srl %i1,20,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#9,<p32=int64#13,>y1=int64#9
# asm 2: xor <z1=%g5,<p32=%o3,>y1=%g5
xor %g5,%o3,%g5

# qhasm: z0 = x36
# asm 1: ldx [%fp+2023-<x36=stack64#40],>z0=int64#13
# asm 2: ldx [%fp+2023-<x36=328],>z0=%o3
ldx [%fp+2023-328],%o3

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#2,12,>p01=int64#15
# asm 2: srl <y0=%i1,12,>p01=%o5
srl %i1,12,%o5

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#11,4080,>p00=int64#11
# asm 2: and <p00=%o1,4080,>p00=%o1
and %o1,4080,%o1

# qhasm: z1 = x37
# asm 1: ldx [%fp+2023-<x37=stack64#41],>z1=int64#16
# asm 2: ldx [%fp+2023-<x37=336],>z1=%o7
ldx [%fp+2023-336],%o7

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#2,4,>p02=int64#17
# asm 2: srl <y0=%i1,4,>p02=%l0
srl %i1,4,%l0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#15,4080,>p01=int64#15
# asm 2: and <p01=%o5,4080,>p01=%o5
and %o5,4080,%o5

# qhasm: z2 = x38
# asm 1: ldx [%fp+2023-<x38=stack64#42],>z2=int64#18
# asm 2: ldx [%fp+2023-<x38=344],>z2=%l1
ldx [%fp+2023-344],%l1

# qhasm: p03 = (uint32) y0 << 4
# asm 1: sll <y0=int64#2,4,>p03=int64#2
# asm 2: sll <y0=%i1,4,>p03=%i1
sll %i1,4,%i1

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#17,4080,>p02=int64#17
# asm 2: and <p02=%l0,4080,>p02=%l0
and %l0,4080,%l0

# qhasm: z3 = x39
# asm 1: ldx [%fp+2023-<x39=stack64#43],>z3=int64#19
# asm 2: ldx [%fp+2023-<x39=352],>z3=%l2
ldx [%fp+2023-352],%l2

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#9,20,>p10=int64#20
# asm 2: srl <y1=%g5,20,>p10=%l3
srl %g5,20,%l3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#2,4080,>p03=int64#2
# asm 2: and <p03=%i1,4080,>p03=%i1
and %i1,4080,%i1

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#7+<p00=int64#11],>p00=int64#11
# asm 2: lduw [<table0=%g1+<p00=%o1],>p00=%o1
lduw [%g1+%o1],%o1

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#9,12,>p11=int64#21
# asm 2: srl <y1=%g5,12,>p11=%l4
srl %g5,12,%l4

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#20,4080,>p10=int64#20
# asm 2: and <p10=%l3,4080,>p10=%l3
and %l3,4080,%l3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#8+<p01=int64#15],>p01=int64#15
# asm 2: lduw [<table1=%g4+<p01=%o5],>p01=%o5
lduw [%g4+%o5],%o5

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#9,4,>p12=int64#22
# asm 2: srl <y1=%g5,4,>p12=%l5
srl %g5,4,%l5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#21
# asm 2: and <p11=%l4,4080,>p11=%l4
and %l4,4080,%l4

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#10+<p02=int64#17],>p02=int64#17
# asm 2: lduw [<table2=%o0+<p02=%l0],>p02=%l0
lduw [%o0+%l0],%l0

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#9,4,>p13=int64#9
# asm 2: sll <y1=%g5,4,>p13=%g5
sll %g5,4,%g5

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#2],>p03=int64#2
# asm 2: lduw [<table3=%i0+<p03=%i1],>p03=%i1
lduw [%i0+%i1],%i1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#9,4080,>p13=int64#9
# asm 2: and <p13=%g5,4080,>p13=%g5
and %g5,4080,%g5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#13,<p00=int64#11,>z0=int64#11
# asm 2: xor <z0=%o3,<p00=%o1,>z0=%o1
xor %o3,%o1,%o1

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#7+<p10=int64#20],>p10=int64#13
# asm 2: lduw [<table0=%g1+<p10=%l3],>p10=%o3
lduw [%g1+%l3],%o3

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#4,20,>p20=int64#20
# asm 2: srl <y2=%i3,20,>p20=%l3
srl %i3,20,%l3

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#15,>z3=int64#15
# asm 2: xor <z3=%l2,<p01=%o5,>z3=%o5
xor %l2,%o5,%o5

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#8+<p11=int64#21],>p11=int64#19
# asm 2: lduw [<table1=%g4+<p11=%l4],>p11=%l2
lduw [%g4+%l4],%l2

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#4,12,>p21=int64#21
# asm 2: srl <y2=%i3,12,>p21=%l4
srl %i3,12,%l4

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#17,>z2=int64#17
# asm 2: xor <z2=%l1,<p02=%l0,>z2=%l0
xor %l1,%l0,%l0

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#10+<p12=int64#22],>p12=int64#18
# asm 2: lduw [<table2=%o0+<p12=%l5],>p12=%l1
lduw [%o0+%l5],%l1

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#4,4,>p22=int64#22
# asm 2: srl <y2=%i3,4,>p22=%l5
srl %i3,4,%l5

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#2,>z1=int64#2
# asm 2: xor <z1=%o7,<p03=%i1,>z1=%i1
xor %o7,%i1,%i1

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#9],>p13=int64#9
# asm 2: lduw [<table3=%i0+<p13=%g5],>p13=%g5
lduw [%i0+%g5],%g5

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#20,4080,>p20=int64#16
# asm 2: and <p20=%l3,4080,>p20=%o7
and %l3,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#20
# asm 2: and <p21=%l4,4080,>p21=%l3
and %l4,4080,%l3

# qhasm: n0p = n0p_stack
# asm 1: ldx [%fp+2023-<n0p_stack=stack64#3],>n0p=int64#21
# asm 2: ldx [%fp+2023-<n0p_stack=32],>n0p=%l4
ldx [%fp+2023-32],%l4

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#4,4,>p23=int64#4
# asm 2: sll <y2=%i3,4,>p23=%i3
sll %i3,4,%i3

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#22,4080,>p22=int64#22
# asm 2: and <p22=%l5,4080,>p22=%l5
and %l5,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#7+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g1+<p20=%o7],>p20=%o7
lduw [%g1+%o7],%o7

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#6,20,>p30=int64#23
# asm 2: srl <y3=%i5,20,>p30=%l6
srl %i5,20,%l6

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#4,4080,>p23=int64#4
# asm 2: and <p23=%i3,4080,>p23=%i3
and %i3,4080,%i3

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#8+<p21=int64#20],>p21=int64#20
# asm 2: lduw [<table1=%g4+<p21=%l3],>p21=%l3
lduw [%g4+%l3],%l3

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#6,12,>p31=int64#24
# asm 2: srl <y3=%i5,12,>p31=%l7
srl %i5,12,%l7

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#10+<p22=int64#22],>p22=int64#19
# asm 2: lduw [<table2=%o0+<p22=%l5],>p22=%l2
lduw [%o0+%l5],%l2

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#6,4,>p32=int64#22
# asm 2: srl <y3=%i5,4,>p32=%l5
srl %i5,4,%l5

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#23,4080,>p30=int64#23
# asm 2: and <p30=%l6,4080,>p30=%l6
and %l6,4080,%l6

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#4],>p23=int64#4
# asm 2: lduw [<table3=%i0+<p23=%i3],>p23=%i3
lduw [%i0+%i3],%i3

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#2,<p10=int64#13,>z1=int64#2
# asm 2: xor <z1=%i1,<p10=%o3,>z1=%i1
xor %i1,%o3,%i1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#24,4080,>p31=int64#13
# asm 2: and <p31=%l7,4080,>p31=%o3
and %l7,4080,%o3

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#7+<p30=int64#23],>p30=int64#23
# asm 2: lduw [<table0=%g1+<p30=%l6],>p30=%l6
lduw [%g1+%l6],%l6

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#6,4,>p33=int64#6
# asm 2: sll <y3=%i5,4,>p33=%i5
sll %i5,4,%i5

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#22,4080,>p32=int64#22
# asm 2: and <p32=%l5,4080,>p32=%l5
and %l5,4080,%l5

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#8+<p31=int64#13],>p31=int64#13
# asm 2: lduw [<table1=%g4+<p31=%o3],>p31=%o3
lduw [%g4+%o3],%o3

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#6,4080,>p33=int64#6
# asm 2: and <p33=%i5,4080,>p33=%i5
and %i5,4080,%i5

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#18,>z3=int64#15
# asm 2: xor <z3=%o5,<p12=%l1,>z3=%o5
xor %o5,%l1,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#10+<p32=int64#22],>p32=int64#18
# asm 2: lduw [<table2=%o0+<p32=%l5],>p32=%l1
lduw [%o0+%l5],%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#17,<p13=int64#9,>z2=int64#9
# asm 2: xor <z2=%l0,<p13=%g5,>z2=%g5
xor %l0,%g5,%g5

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#9,<p20=int64#16,>z2=int64#9
# asm 2: xor <z2=%g5,<p20=%o7,>z2=%g5
xor %g5,%o7,%g5

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#6],>p33=int64#6
# asm 2: lduw [<table3=%i0+<p33=%i5],>p33=%i5
lduw [%i0+%i5],%i5

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#2,<p21=int64#20,>z1=int64#2
# asm 2: xor <z1=%i1,<p21=%l3,>z1=%i1
xor %i1,%l3,%i1

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#19,>z0=int64#11
# asm 2: xor <z0=%o1,<p22=%l2,>z0=%o1
xor %o1,%l2,%o1

# qhasm: n0 = *(swapendian uint32 *) n0p
# asm 1: lduwa [<n0p=int64#21] 0x88,>n0=int64#16
# asm 2: lduwa [<n0p=%l4] 0x88,>n0=%o7
lduwa [%l4] 0x88,%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#4,>z3=int64#4
# asm 2: xor <z3=%o5,<p23=%i3,>z3=%i3
xor %o5,%i3,%i3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#11,<p33=int64#6,>y0=int64#6
# asm 2: xor <z0=%o1,<p33=%i5,>y0=%i5
xor %o1,%i5,%i5

# qhasm: z0 = x40
# asm 1: ldx [%fp+2023-<x40=stack64#44],>z0=int64#11
# asm 2: ldx [%fp+2023-<x40=360],>z0=%o1
ldx [%fp+2023-360],%o1

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#6,20,>p00=int64#15
# asm 2: srl <y0=%i5,20,>p00=%o5
srl %i5,20,%o5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#2,<p32=int64#18,>y1=int64#2
# asm 2: xor <z1=%i1,<p32=%l1,>y1=%i1
xor %i1,%l1,%i1

# qhasm: p01 = (uint32) y0 >> 12 
# asm 1: srl <y0=int64#6,12,>p01=int64#17
# asm 2: srl <y0=%i5,12,>p01=%l0
srl %i5,12,%l0

# qhasm: n0 += 1
# asm 1: add <n0=int64#16,1,>n0=int64#16
# asm 2: add <n0=%o7,1,>n0=%o7
add %o7,1,%o7

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#9,<p31=int64#13,>y2=int64#9
# asm 2: xor <z2=%g5,<p31=%o3,>y2=%g5
xor %g5,%o3,%g5

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#4,<p30=int64#23,>y3=int64#4
# asm 2: xor <z3=%i3,<p30=%l6,>y3=%i3
xor %i3,%l6,%i3

# qhasm: z1 = x41
# asm 1: ldx [%fp+2023-<x41=stack64#45],>z1=int64#13
# asm 2: ldx [%fp+2023-<x41=368],>z1=%o3
ldx [%fp+2023-368],%o3

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#6,4,>p02=int64#18
# asm 2: srl <y0=%i5,4,>p02=%l1
srl %i5,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#15,4080,>p00=int64#15
# asm 2: and <p00=%o5,4080,>p00=%o5
and %o5,4080,%o5

# qhasm: p03 = (uint32) y0 << 4 
# asm 1: sll <y0=int64#6,4,>p03=int64#6
# asm 2: sll <y0=%i5,4,>p03=%i5
sll %i5,4,%i5

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#17,4080,>p01=int64#17
# asm 2: and <p01=%l0,4080,>p01=%l0
and %l0,4080,%l0

# qhasm: *(swapendian uint32 *) n0p = n0
# asm 1: stwa <n0=int64#16,[<n0p=int64#21] 0x88
# asm 2: stwa <n0=%o7,[<n0p=%l4] 0x88
stwa %o7,[%l4] 0x88

# qhasm: p10 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#2,20,>p10=int64#16
# asm 2: srl <y1=%i1,20,>p10=%o7
srl %i1,20,%o7

# qhasm: table1 +=3
# asm 1: add <table1=int64#8,3,>table1=int64#8
# asm 2: add <table1=%g4,3,>table1=%g4
add %g4,3,%g4

# qhasm: z2 = x42
# asm 1: ldx [%fp+2023-<x42=stack64#46],>z2=int64#19
# asm 2: ldx [%fp+2023-<x42=376],>z2=%l2
ldx [%fp+2023-376],%l2

# qhasm: p11 = (uint32) y1 >> 12 
# asm 1: srl <y1=int64#2,12,>p11=int64#20
# asm 2: srl <y1=%i1,12,>p11=%l3
srl %i1,12,%l3

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#18,4080,>p02=int64#18
# asm 2: and <p02=%l1,4080,>p02=%l1
and %l1,4080,%l1

# qhasm: z3 = x43
# asm 1: ldx [%fp+2023-<x43=stack64#47],>z3=int64#21
# asm 2: ldx [%fp+2023-<x43=384],>z3=%l4
ldx [%fp+2023-384],%l4

# qhasm: p12 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#2,4,>p12=int64#22
# asm 2: srl <y1=%i1,4,>p12=%l5
srl %i1,4,%l5

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#6,4080,>p03=int64#6
# asm 2: and <p03=%i5,4080,>p03=%i5
and %i5,4080,%i5

# qhasm: p00 = *(uint32 *) (table2 + p00)
# asm 1: lduw [<table2=int64#10+<p00=int64#15],>p00=int64#15
# asm 2: lduw [<table2=%o0+<p00=%o5],>p00=%o5
lduw [%o0+%o5],%o5

# qhasm: p13 = (uint32) y1 << 4 
# asm 1: sll <y1=int64#2,4,>p13=int64#2
# asm 2: sll <y1=%i1,4,>p13=%i1
sll %i1,4,%i1

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#16,4080,>p10=int64#16
# asm 2: and <p10=%o7,4080,>p10=%o7
and %o7,4080,%o7

# qhasm: p01 = *(uint32 *) (table3 + p01)
# asm 1: lduw [<table3=int64#1+<p01=int64#17],>p01=int64#17
# asm 2: lduw [<table3=%i0+<p01=%l0],>p01=%l0
lduw [%i0+%l0],%l0

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#20,4080,>p11=int64#20
# asm 2: and <p11=%l3,4080,>p11=%l3
and %l3,4080,%l3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#22,4080,>p12=int64#22
# asm 2: and <p12=%l5,4080,>p12=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table0 + p02)
# asm 1: lduw [<table0=int64#7+<p02=int64#18],>p02=int64#18
# asm 2: lduw [<table0=%g1+<p02=%l1],>p02=%l1
lduw [%g1+%l1],%l1

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#2,4080,>p13=int64#2
# asm 2: and <p13=%i1,4080,>p13=%i1
and %i1,4080,%i1

# qhasm: p00 &= mask1 
# asm 1: and <p00=int64#15,<mask1=int64#12,>p00=int64#15
# asm 2: and <p00=%o5,<mask1=%o2,>p00=%o5
and %o5,%o2,%o5

# qhasm: p03 = *(uint8 *) (table1 + p03)
# asm 1: ldub [<table1=int64#8+<p03=int64#6],>p03=int64#6
# asm 2: ldub [<table1=%g4+<p03=%i5],>p03=%i5
ldub [%g4+%i5],%i5

# qhasm: p20 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#9,20,>p20=int64#23
# asm 2: srl <y2=%g5,20,>p20=%l6
srl %g5,20,%l6

# qhasm: p01 &= mask2
# asm 1: and <p01=int64#17,<mask2=int64#14,>p01=int64#17
# asm 2: and <p01=%l0,<mask2=%o4,>p01=%l0
and %l0,%o4,%l0

# qhasm: p10 = *(uint32 *) (table2 + p10)
# asm 1: lduw [<table2=int64#10+<p10=int64#16],>p10=int64#16
# asm 2: lduw [<table2=%o0+<p10=%o7],>p10=%o7
lduw [%o0+%o7],%o7

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#11,<p00=int64#15,>z0=int64#11
# asm 2: xor <z0=%o1,<p00=%o5,>z0=%o1
xor %o1,%o5,%o1

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#17,>z3=int64#15
# asm 2: xor <z3=%l4,<p01=%l0,>z3=%o5
xor %l4,%l0,%o5

# qhasm: p21 = (uint32) y2 >> 12 
# asm 1: srl <y2=int64#9,12,>p21=int64#17
# asm 2: srl <y2=%g5,12,>p21=%l0
srl %g5,12,%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#13,<p03=int64#6,>z1=int64#6
# asm 2: xor <z1=%o3,<p03=%i5,>z1=%i5
xor %o3,%i5,%i5

# qhasm: p11 = *(uint32 *) (table3 + p11)
# asm 1: lduw [<table3=int64#1+<p11=int64#20],>p11=int64#13
# asm 2: lduw [<table3=%i0+<p11=%l3],>p11=%o3
lduw [%i0+%l3],%o3

# qhasm: p22 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#9,4,>p22=int64#20
# asm 2: srl <y2=%g5,4,>p22=%l3
srl %g5,4,%l3

# qhasm: p02 &= mask3
# asm 1: and <p02=int64#18,<mask3=int64#3,>p02=int64#18
# asm 2: and <p02=%l1,<mask3=%i2,>p02=%l1
and %l1,%i2,%l1

# qhasm: p12 = *(uint32 *) (table0 + p12)
# asm 1: lduw [<table0=int64#7+<p12=int64#22],>p12=int64#21
# asm 2: lduw [<table0=%g1+<p12=%l5],>p12=%l4
lduw [%g1+%l5],%l4

# qhasm: p23 = (uint32) y2 << 4 
# asm 1: sll <y2=int64#9,4,>p23=int64#9
# asm 2: sll <y2=%g5,4,>p23=%g5
sll %g5,4,%g5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#18,>z2=int64#18
# asm 2: xor <z2=%l2,<p02=%l1,>z2=%l1
xor %l2,%l1,%l1

# qhasm: p13 = *(uint8 *) (table1 + p13)
# asm 1: ldub [<table1=int64#8+<p13=int64#2],>p13=int64#2
# asm 2: ldub [<table1=%g4+<p13=%i1],>p13=%i1
ldub [%g4+%i1],%i1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#23,4080,>p20=int64#19
# asm 2: and <p20=%l6,4080,>p20=%l2
and %l6,4080,%l2

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#17,4080,>p21=int64#17
# asm 2: and <p21=%l0,4080,>p21=%l0
and %l0,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#20,4080,>p22=int64#20
# asm 2: and <p22=%l3,4080,>p22=%l3
and %l3,4080,%l3

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#9,4080,>p23=int64#9
# asm 2: and <p23=%g5,4080,>p23=%g5
and %g5,4080,%g5

# qhasm: p20 = *(uint32 *) (table2 + p20)
# asm 1: lduw [<table2=int64#10+<p20=int64#19],>p20=int64#19
# asm 2: lduw [<table2=%o0+<p20=%l2],>p20=%l2
lduw [%o0+%l2],%l2

# qhasm: p30 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#4,20,>p30=int64#22
# asm 2: srl <y3=%i3,20,>p30=%l5
srl %i3,20,%l5

# qhasm: p10 &= mask1
# asm 1: and <p10=int64#16,<mask1=int64#12,>p10=int64#16
# asm 2: and <p10=%o7,<mask1=%o2,>p10=%o7
and %o7,%o2,%o7

# qhasm: p21 = *(uint32 *) (table3 + p21)
# asm 1: lduw [<table3=int64#1+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table3=%i0+<p21=%l0],>p21=%l0
lduw [%i0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 12 
# asm 1: srl <y3=int64#4,12,>p31=int64#23
# asm 2: srl <y3=%i3,12,>p31=%l6
srl %i3,12,%l6

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#6,<p10=int64#16,>z1=int64#6
# asm 2: xor <z1=%i5,<p10=%o7,>z1=%i5
xor %i5,%o7,%i5

# qhasm: p22 = *(uint32 *) (table0 + p22)
# asm 1: lduw [<table0=int64#7+<p22=int64#20],>p22=int64#16
# asm 2: lduw [<table0=%g1+<p22=%l3],>p22=%o7
lduw [%g1+%l3],%o7

# qhasm: p32 = (uint32) y3 >> 4
# asm 1: srl <y3=int64#4,4,>p32=int64#20
# asm 2: srl <y3=%i3,4,>p32=%l3
srl %i3,4,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#22,4080,>p30=int64#22
# asm 2: and <p30=%l5,4080,>p30=%l5
and %l5,4080,%l5

# qhasm: p23 = *(uint8 *) (table1 + p23)
# asm 1: ldub [<table1=int64#8+<p23=int64#9],>p23=int64#9
# asm 2: ldub [<table1=%g4+<p23=%g5],>p23=%g5
ldub [%g4+%g5],%g5

# qhasm: p33 = (uint32) y3 << 4 
# asm 1: sll <y3=int64#4,4,>p33=int64#4
# asm 2: sll <y3=%i3,4,>p33=%i3
sll %i3,4,%i3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#23,4080,>p31=int64#23
# asm 2: and <p31=%l6,4080,>p31=%l6
and %l6,4080,%l6

# qhasm: p30 = *(uint32 *) (table2 + p30)
# asm 1: lduw [<table2=int64#10+<p30=int64#22],>p30=int64#22
# asm 2: lduw [<table2=%o0+<p30=%l5],>p30=%l5
lduw [%o0+%l5],%l5

# qhasm: p12 &= mask3
# asm 1: and <p12=int64#21,<mask3=int64#3,>p12=int64#21
# asm 2: and <p12=%l4,<mask3=%i2,>p12=%l4
and %l4,%i2,%l4

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#20,4080,>p32=int64#20
# asm 2: and <p32=%l3,4080,>p32=%l3
and %l3,4080,%l3

# qhasm: p31 = *(uint32 *) (table3 + p31)
# asm 1: lduw [<table3=int64#1+<p31=int64#23],>p31=int64#23
# asm 2: lduw [<table3=%i0+<p31=%l6],>p31=%l6
lduw [%i0+%l6],%l6

# qhasm: p20 &= mask1
# asm 1: and <p20=int64#19,<mask1=int64#12,>p20=int64#19
# asm 2: and <p20=%l2,<mask1=%o2,>p20=%l2
and %l2,%o2,%l2

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#4,4080,>p33=int64#4
# asm 2: and <p33=%i3,4080,>p33=%i3
and %i3,4080,%i3

# qhasm: n0p = n0p_stack
# asm 1: ldx [%fp+2023-<n0p_stack=stack64#3],>n0p=int64#24
# asm 2: ldx [%fp+2023-<n0p_stack=32],>n0p=%l7
ldx [%fp+2023-32],%l7

# qhasm: p11 &= mask2
# asm 1: and <p11=int64#13,<mask2=int64#14,>p11=int64#13
# asm 2: and <p11=%o3,<mask2=%o4,>p11=%o3
and %o3,%o4,%o3

# qhasm: p21 &= mask2
# asm 1: and <p21=int64#17,<mask2=int64#14,>p21=int64#17
# asm 2: and <p21=%l0,<mask2=%o4,>p21=%l0
and %l0,%o4,%l0

# qhasm: p32 = *(uint32 *) (table0 + p32)
# asm 1: lduw [<table0=int64#7+<p32=int64#20],>p32=int64#20
# asm 2: lduw [<table0=%g1+<p32=%l3],>p32=%l3
lduw [%g1+%l3],%l3

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#11,<p11=int64#13,>z0=int64#11
# asm 2: xor <z0=%o1,<p11=%o3,>z0=%o1
xor %o1,%o3,%o1

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#15,<p12=int64#21,>z3=int64#13
# asm 2: xor <z3=%o5,<p12=%l4,>z3=%o3
xor %o5,%l4,%o3

# qhasm: p33 = *(uint8 *) (table1 + p33)
# asm 1: ldub [<table1=int64#8+<p33=int64#4],>p33=int64#4
# asm 2: ldub [<table1=%g4+<p33=%i3],>p33=%i3
ldub [%g4+%i3],%i3

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#18,<p13=int64#2,>z2=int64#2
# asm 2: xor <z2=%l1,<p13=%i1,>z2=%i1
xor %l1,%i1,%i1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#2,<p20=int64#19,>z2=int64#2
# asm 2: xor <z2=%i1,<p20=%l2,>z2=%i1
xor %i1,%l2,%i1

# qhasm: y0 = *(uint32 *) (n0p + 0)
# asm 1: lduw [<n0p=int64#24+0],>y0=int64#15
# asm 2: lduw [<n0p=%l7+0],>y0=%o5
lduw [%l7+0],%o5

# qhasm: p22 &= mask3
# asm 1: and <p22=int64#16,<mask3=int64#3,>p22=int64#18
# asm 2: and <p22=%o7,<mask3=%i2,>p22=%l1
and %o7,%i2,%l1

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#6,<p21=int64#17,>z1=int64#17
# asm 2: xor <z1=%i5,<p21=%l0,>z1=%l0
xor %i5,%l0,%l0

# qhasm: y1 = *(uint32 *) (n0p + 4)
# asm 1: lduw [<n0p=int64#24+4],>y1=int64#16
# asm 2: lduw [<n0p=%l7+4],>y1=%o7
lduw [%l7+4],%o7

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#11,<p22=int64#18,>z0=int64#18
# asm 2: xor <z0=%o1,<p22=%l1,>z0=%l1
xor %o1,%l1,%l1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#13,<p23=int64#9,>z3=int64#6
# asm 2: xor <z3=%o3,<p23=%g5,>z3=%i5
xor %o3,%g5,%i5

# qhasm: y2 = *(uint32 *) (n0p + 8)
# asm 1: lduw [<n0p=int64#24+8],>y2=int64#11
# asm 2: lduw [<n0p=%l7+8],>y2=%o1
lduw [%l7+8],%o1

# qhasm: p30 &= mask1
# asm 1: and <p30=int64#22,<mask1=int64#12,>p30=int64#9
# asm 2: and <p30=%l5,<mask1=%o2,>p30=%g5
and %l5,%o2,%g5

# qhasm: p31 &= mask2
# asm 1: and <p31=int64#23,<mask2=int64#14,>p31=int64#13
# asm 2: and <p31=%l6,<mask2=%o4,>p31=%o3
and %l6,%o4,%o3

# qhasm: tx0 = x0
# asm 1: ldx [%fp+2023-<x0=stack64#4],>tx0=int64#19
# asm 2: ldx [%fp+2023-<x0=40],>tx0=%l2
ldx [%fp+2023-40],%l2

# qhasm: p32 &= mask3
# asm 1: and <p32=int64#20,<mask3=int64#3,>p32=int64#20
# asm 2: and <p32=%l3,<mask3=%i2,>p32=%l3
and %l3,%i2,%l3

# qhasm: z3 = z3 ^ p30
# asm 1: xor <z3=int64#6,<p30=int64#9,>z3=int64#9
# asm 2: xor <z3=%i5,<p30=%g5,>z3=%g5
xor %i5,%g5,%g5

# qhasm: y3 = *(uint32 *) (n0p + 12)
# asm 1: lduw [<n0p=int64#24+12],>y3=int64#6
# asm 2: lduw [<n0p=%l7+12],>y3=%i5
lduw [%l7+12],%i5

# qhasm: z1 = z1 ^ p32
# asm 1: xor <z1=int64#17,<p32=int64#20,>z1=int64#17
# asm 2: xor <z1=%l0,<p32=%l3,>z1=%l0
xor %l0,%l3,%l0

# qhasm: z2 = z2 ^ p31
# asm 1: xor <z2=int64#2,<p31=int64#13,>z2=int64#2
# asm 2: xor <z2=%i1,<p31=%o3,>z2=%i1
xor %i1,%o3,%i1

# qhasm: inp = inp_stack
# asm 1: ldx [%fp+2023-<inp_stack=stack64#2],>inp=int64#13
# asm 2: ldx [%fp+2023-<inp_stack=24],>inp=%o3
ldx [%fp+2023-24],%o3

# qhasm: z0 = z0 ^ p33
# asm 1: xor <z0=int64#18,<p33=int64#4,>z0=int64#4
# asm 2: xor <z0=%l1,<p33=%i3,>z0=%i3
xor %l1,%i3,%i3

# qhasm: unsigned>? =? unsigned<? length -= 16
# asm 1: subcc <length=int64#5,16,>length=int64#5
# asm 2: subcc <length=%i4,16,>length=%i4
subcc %i4,16,%i4

# qhasm: outp = outp_stack
# asm 1: ldx [%fp+2023-<outp_stack=stack64#1],>outp=int64#18
# asm 2: ldx [%fp+2023-<outp_stack=16],>outp=%l1
ldx [%fp+2023-16],%l1

# qhasm: goto mainloop if unsigned>
bgu,pt %xcc,._mainloop
nop

# qhasm: goto atmost15bytesleft if unsigned<
blu,pt %xcc,._atmost15bytesleft
nop

# qhasm: (uint64) z0 <<= 32
# asm 1: sllx <z0=int64#4,32,>z0=int64#1
# asm 2: sllx <z0=%i3,32,>z0=%i0
sllx %i3,32,%i0

# qhasm: table1 -=3
# asm 1: sub <table1=int64#8,3,>table1=int64#3
# asm 2: sub <table1=%g4,3,>table1=%i2
sub %g4,3,%i2

# qhasm: in0 = *(uint64 *) (inp + 0)
# asm 1: ldx [<inp=int64#13+0],>in0=int64#4
# asm 2: ldx [<inp=%o3+0],>in0=%i3
ldx [%o3+0],%i3

# qhasm: (uint64) z2 <<= 32
# asm 1: sllx <z2=int64#2,32,>z2=int64#2
# asm 2: sllx <z2=%i1,32,>z2=%i1
sllx %i1,32,%i1

# qhasm: y0 ^= tx0
# asm 1: xor <y0=int64#15,<tx0=int64#19,>y0=int64#5
# asm 2: xor <y0=%o5,<tx0=%l2,>y0=%i4
xor %o5,%l2,%i4

# qhasm: in2 = *(uint64 *) (inp + 8)
# asm 1: ldx [<inp=int64#13+8],>in2=int64#6
# asm 2: ldx [<inp=%o3+8],>in2=%i5
ldx [%o3+8],%i5

# qhasm: z0 ^= z1
# asm 1: xor <z0=int64#1,<z1=int64#17,>z0=int64#1
# asm 2: xor <z0=%i0,<z1=%l0,>z0=%i0
xor %i0,%l0,%i0

# qhasm: z2 ^= z3
# asm 1: xor <z2=int64#2,<z3=int64#9,>z2=int64#2
# asm 2: xor <z2=%i1,<z3=%g5,>z2=%i1
xor %i1,%g5,%i1

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#5,20,>p00=int64#7
# asm 2: srl <y0=%i4,20,>p00=%g1
srl %i4,20,%g1

# qhasm: inp += 16
# asm 1: add <inp=int64#13,16,>inp=int64#8
# asm 2: add <inp=%o3,16,>inp=%g4
add %o3,16,%g4

# qhasm: inp_stack = inp
# asm 1: stx <inp=int64#8,[%fp+2023->inp_stack=stack64#1]
# asm 2: stx <inp=%g4,[%fp+2023->inp_stack=16]
stx %g4,[%fp+2023-16]

# qhasm: in0 ^= z0
# asm 1: xor <in0=int64#4,<z0=int64#1,>in0=int64#1
# asm 2: xor <in0=%i3,<z0=%i0,>in0=%i0
xor %i3,%i0,%i0

# qhasm: in2 ^= z2
# asm 1: xor <in2=int64#6,<z2=int64#2,>in2=int64#2
# asm 2: xor <in2=%i5,<z2=%i1,>in2=%i1
xor %i5,%i1,%i1

# qhasm: *(uint64 *) (outp + 0) = in0
# asm 1: stx <in0=int64#1,[<outp=int64#18+0]
# asm 2: stx <in0=%i0,[<outp=%l1+0]
stx %i0,[%l1+0]

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#5,12,>p01=int64#1
# asm 2: srl <y0=%i4,12,>p01=%i0
srl %i4,12,%i0

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#7,4080,>p00=int64#4
# asm 2: and <p00=%g1,4080,>p00=%i3
and %g1,4080,%i3

# qhasm: *(uint64 *) (outp + 8) = in2
# asm 1: stx <in2=int64#2,[<outp=int64#18+8]
# asm 2: stx <in2=%i1,[<outp=%l1+8]
stx %i1,[%l1+8]

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#1,4080,>p01=int64#1
# asm 2: and <p01=%i0,4080,>p01=%i0
and %i0,4080,%i0

# qhasm: outp += 16
# asm 1: add <outp=int64#18,16,>outp=int64#2
# asm 2: add <outp=%l1,16,>outp=%i1
add %l1,16,%i1

# qhasm: z0 = x4
# asm 1: ldx [%fp+2023-<x4=stack64#8],>z0=int64#5
# asm 2: ldx [%fp+2023-<x4=72],>z0=%i4
ldx [%fp+2023-72],%i4

# qhasm: goto end
b ._end
nop

# qhasm: atmost15bytesleft:
._atmost15bytesleft:

# qhasm: length += 16
# asm 1: add <length=int64#5,16,>length=int64#1
# asm 2: add <length=%i4,16,>length=%i0
add %i4,16,%i0

# qhasm: tmpp = &tmp
# asm 1: add %fp,1967->tmp=stack128#1,>tmpp=int64#3
# asm 2: add %fp,1967->tmp=0,>tmpp=%i2
add %fp,1967-0,%i2

# qhasm: *(uint32 *) (tmpp + 0) = z0
# asm 1: stw <z0=int64#4,[<tmpp=int64#3+0]
# asm 2: stw <z0=%i3,[<tmpp=%i2+0]
stw %i3,[%i2+0]

# qhasm: *(uint32 *) (tmpp + 4) = z1
# asm 1: stw <z1=int64#17,[<tmpp=int64#3+4]
# asm 2: stw <z1=%l0,[<tmpp=%i2+4]
stw %l0,[%i2+4]

# qhasm: *(uint32 *) (tmpp + 8) = z2
# asm 1: stw <z2=int64#2,[<tmpp=int64#3+8]
# asm 2: stw <z2=%i1,[<tmpp=%i2+8]
stw %i1,[%i2+8]

# qhasm: *(uint32 *) (tmpp + 12) = z3
# asm 1: stw <z3=int64#9,[<tmpp=int64#3+12]
# asm 2: stw <z3=%g5,[<tmpp=%i2+12]
stw %g5,[%i2+12]

# qhasm: copyloop:
._copyloop:

# qhasm: unsigned<? length -= 1
# asm 1: subcc <length=int64#1,1,>length=int64#1
# asm 2: subcc <length=%i0,1,>length=%i0
subcc %i0,1,%i0

# qhasm: goto end if unsigned<
blu,pt %xcc,._end
nop

# qhasm: dd = *(uint8 *) (tmpp + 0)
# asm 1: ldub [<tmpp=int64#3+0],>dd=int64#2
# asm 2: ldub [<tmpp=%i2+0],>dd=%i1
ldub [%i2+0],%i1

# qhasm: in0 = *(uint8 *) (inp + 0)
# asm 1: ldub [<inp=int64#13+0],>in0=int64#4
# asm 2: ldub [<inp=%o3+0],>in0=%i3
ldub [%o3+0],%i3

# qhasm: dd ^= in0
# asm 1: xor <dd=int64#2,<in0=int64#4,>dd=int64#2
# asm 2: xor <dd=%i1,<in0=%i3,>dd=%i1
xor %i1,%i3,%i1

# qhasm: *(uint8 *) (outp + 0) = dd
# asm 1: stb <dd=int64#2,[<outp=int64#18+0]
# asm 2: stb <dd=%i1,[<outp=%l1+0]
stb %i1,[%l1+0]

# qhasm: outp = outp + 1
# asm 1: add <outp=int64#18,1,>outp=int64#18
# asm 2: add <outp=%l1,1,>outp=%l1
add %l1,1,%l1

# qhasm: inp = inp + 1
# asm 1: add <inp=int64#13,1,>inp=int64#13
# asm 2: add <inp=%o3,1,>inp=%o3
add %o3,1,%o3

# qhasm: tmpp = tmpp + 1
# asm 1: add <tmpp=int64#3,1,>tmpp=int64#3
# asm 2: add <tmpp=%i2,1,>tmpp=%i2
add %i2,1,%i2

# qhasm: outp_stack = outp
# asm 1: stx <outp=int64#18,[%fp+2023->outp_stack=stack64#1]
# asm 2: stx <outp=%l1,[%fp+2023->outp_stack=16]
stx %l1,[%fp+2023-16]

# qhasm: inp_stack = inp
# asm 1: stx <inp=int64#13,[%fp+2023->inp_stack=stack64#2]
# asm 2: stx <inp=%o3,[%fp+2023->inp_stack=24]
stx %o3,[%fp+2023-24]

# qhasm: goto copyloop
b ._copyloop
nop

# qhasm: end:
._end:

# qhasm: n0p = n0p_stack
# asm 1: ldx [%fp+2023-<n0p_stack=stack64#3],>n0p=int64#1
# asm 2: ldx [%fp+2023-<n0p_stack=32],>n0p=%i0
ldx [%fp+2023-32],%i0

# qhasm: tx1 = x1
# asm 1: ldx [%fp+2023-<x1=stack64#5],>tx1=int64#2
# asm 2: ldx [%fp+2023-<x1=48],>tx1=%i1
ldx [%fp+2023-48],%i1

# qhasm: tx2 = x2
# asm 1: ldx [%fp+2023-<x2=stack64#6],>tx2=int64#3
# asm 2: ldx [%fp+2023-<x2=56],>tx2=%i2
ldx [%fp+2023-56],%i2

# qhasm: tx3 = x3
# asm 1: ldx [%fp+2023-<x3=stack64#7],>tx3=int64#4
# asm 2: ldx [%fp+2023-<x3=64],>tx3=%i3
ldx [%fp+2023-64],%i3

# qhasm: y1 = *(uint32 *) (n0p + 4)
# asm 1: lduw [<n0p=int64#1+4],>y1=int64#5
# asm 2: lduw [<n0p=%i0+4],>y1=%i4
lduw [%i0+4],%i4

# qhasm: y2 = *(uint32 *) (n0p + 8)
# asm 1: lduw [<n0p=int64#1+8],>y2=int64#6
# asm 2: lduw [<n0p=%i0+8],>y2=%i5
lduw [%i0+8],%i5

# qhasm: y3 = *(uint32 *) (n0p + 12)
# asm 1: lduw [<n0p=int64#1+12],>y3=int64#7
# asm 2: lduw [<n0p=%i0+12],>y3=%g1
lduw [%i0+12],%g1

# qhasm: y1 ^= tx1
# asm 1: xor <y1=int64#5,<tx1=int64#2,>y1=int64#2
# asm 2: xor <y1=%i4,<tx1=%i1,>y1=%i1
xor %i4,%i1,%i1

# qhasm: y2 ^= tx2
# asm 1: xor <y2=int64#6,<tx2=int64#3,>y2=int64#3
# asm 2: xor <y2=%i5,<tx2=%i2,>y2=%i2
xor %i5,%i2,%i2

# qhasm: y3 ^= tx3
# asm 1: xor <y3=int64#7,<tx3=int64#4,>y3=int64#4
# asm 2: xor <y3=%g1,<tx3=%i3,>y3=%i3
xor %g1,%i3,%i3

# qhasm: *(uint32 *) (n0p + 4) = y1
# asm 1: stw <y1=int64#2,[<n0p=int64#1+4]
# asm 2: stw <y1=%i1,[<n0p=%i0+4]
stw %i1,[%i0+4]

# qhasm: *(uint32 *) (n0p + 8) = y2
# asm 1: stw <y2=int64#3,[<n0p=int64#1+8]
# asm 2: stw <y2=%i2,[<n0p=%i0+8]
stw %i2,[%i0+8]

# qhasm: *(uint32 *) (n0p + 12) = y3
# asm 1: stw <y3=int64#4,[<n0p=int64#1+12]
# asm 2: stw <y3=%i3,[<n0p=%i0+12]
stw %i3,[%i0+12]

# qhasm: donothing:
._donothing:

# qhasm: leave
ret
restore
