
# qhasm: int64 action

# qhasm: int64 ctxp

# qhasm: int64 inp

# qhasm: int64 outp

# qhasm: int64 length

# qhasm: input action

# qhasm: input ctxp

# qhasm: input inp

# qhasm: input outp

# qhasm: input length

# qhasm: int64 constants

# qhasm: int64 constants_low

# qhasm: int64 oddmask

# qhasm: int64 evenmask

# qhasm: int64 tx0

# qhasm: int64 tx1

# qhasm: int64 tx2

# qhasm: int64 tx3

# qhasm: int64 table0

# qhasm: int64 table1

# qhasm: int64 table2

# qhasm: int64 table3

# qhasm: int64 in0

# qhasm: int64 in1

# qhasm: int64 in2

# qhasm: int64 in3

# qhasm: int64 dd

# qhasm: int64 inint

# qhasm: int64 outint

# qhasm: int64 tmp0

# qhasm: int64 tmp1

# qhasm: int64 key

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

# qhasm: stack64 length_stack

# qhasm: stack64 length_save_stack

# qhasm: stack320 tmp

# qhasm: enter ECRYPT_process_bytes
.section ".text"
.align 32
.global ECRYPT_process_bytes
ECRYPT_process_bytes:
save %sp,-608,%sp

# qhasm: =? length - 0
# asm 1: subcc <length=int64#5,0,%g0
# asm 2: subcc <length=%i4,0,%g0
subcc %i4,0,%g0

# qhasm: goto donothing if =
be,pt %xcc,._donothing
nop

# qhasm: constants = (aes_little_constants & 0xfffffc0000000000) >> 32
# asm 1: sethi %hh(aes_little_constants),>constants=int64#1
# asm 2: sethi %hh(aes_little_constants),>constants=%i0
sethi %hh(aes_little_constants),%i0

# qhasm: constants_low = aes_little_constants & 0xfffffc00
# asm 1: sethi %lm(aes_little_constants),>constants_low=int64#6
# asm 2: sethi %lm(aes_little_constants),>constants_low=%i5
sethi %lm(aes_little_constants),%i5

# qhasm: constants |= (aes_little_constants & 0x3ff00000000) >> 32
# asm 1: or <constants=int64#1,%hm(aes_little_constants),>constants=int64#1
# asm 2: or <constants=%i0,%hm(aes_little_constants),>constants=%i0
or %i0,%hm(aes_little_constants),%i0

# qhasm: constants_low |= aes_little_constants & 0x3ff
# asm 1: or <constants_low=int64#6,%lo(aes_little_constants),>constants_low=int64#6
# asm 2: or <constants_low=%i5,%lo(aes_little_constants),>constants_low=%i5
or %i5,%lo(aes_little_constants),%i5

# qhasm: constants <<= 32
# asm 1: sllx <constants=int64#1,32,>constants=int64#1
# asm 2: sllx <constants=%i0,32,>constants=%i0
sllx %i0,32,%i0

# qhasm: constants |= constants_low
# asm 1: or  <constants=int64#1,<constants_low=int64#6,>constants=int64#1
# asm 2: or  <constants=%i0,<constants_low=%i5,>constants=%i0
or  %i0,%i5,%i0

# qhasm: evenmask = 0xff
# asm 1: add %g0,0xff,>evenmask=int64#6
# asm 2: add %g0,0xff,>evenmask=%i5
add %g0,0xff,%i5

# qhasm: evenmask <<= 16
# asm 1: sllx <evenmask=int64#6,16,>evenmask=int64#6
# asm 2: sllx <evenmask=%i5,16,>evenmask=%i5
sllx %i5,16,%i5

# qhasm: evenmask ^= 0xff
# asm 1: xor <evenmask=int64#6,0xff,>evenmask=int64#6
# asm 2: xor <evenmask=%i5,0xff,>evenmask=%i5
xor %i5,0xff,%i5

# qhasm: evenmask <<= 8 
# asm 1: sllx <evenmask=int64#6,8,>evenmask=int64#6
# asm 2: sllx <evenmask=%i5,8,>evenmask=%i5
sllx %i5,8,%i5

# qhasm: oddmask = (uint32) evenmask >> 8
# asm 1: srl <evenmask=int64#6,8,>oddmask=int64#7
# asm 2: srl <evenmask=%i5,8,>oddmask=%g1
srl %i5,8,%g1

# qhasm: tx0 = *(uint32 *) (ctxp + 0) 
# asm 1: lduw [<ctxp=int64#2+0],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+0],>tx0=%g4
lduw [%i1+0],%g4

# qhasm: table0 = constants + 40
# asm 1: add <constants=int64#1,40,>table0=int64#9
# asm 2: add <constants=%i0,40,>table0=%g5
add %i0,40,%g5

# qhasm: table1 = constants + 48
# asm 1: add <constants=int64#1,48,>table1=int64#10
# asm 2: add <constants=%i0,48,>table1=%o0
add %i0,48,%o0

# qhasm: tx1 = *(uint32 *) (ctxp + 4) 
# asm 1: lduw [<ctxp=int64#2+4],>tx1=int64#11
# asm 2: lduw [<ctxp=%i1+4],>tx1=%o1
lduw [%i1+4],%o1

# qhasm: table2 = constants + 44
# asm 1: add <constants=int64#1,44,>table2=int64#12
# asm 2: add <constants=%i0,44,>table2=%o2
add %i0,44,%o2

# qhasm: table3 = constants + 52
# asm 1: add <constants=int64#1,52,>table3=int64#1
# asm 2: add <constants=%i0,52,>table3=%i0
add %i0,52,%i0

# qhasm: tx2 = *(uint32 *) (ctxp + 8) 
# asm 1: lduw [<ctxp=int64#2+8],>tx2=int64#13
# asm 2: lduw [<ctxp=%i1+8],>tx2=%o3
lduw [%i1+8],%o3

# qhasm: tx3 = *(uint32 *) (ctxp + 12)
# asm 1: lduw [<ctxp=int64#2+12],>tx3=int64#14
# asm 2: lduw [<ctxp=%i1+12],>tx3=%o4
lduw [%i1+12],%o4

# qhasm: x0 = tx0
# asm 1: stx <tx0=int64#8,[%fp+2023->x0=stack64#1]
# asm 2: stx <tx0=%g4,[%fp+2023->x0=80]
stx %g4,[%fp+2023-80]

# qhasm: x1 = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x1=stack64#2]
# asm 2: stx <tx1=%o1,[%fp+2023->x1=88]
stx %o1,[%fp+2023-88]

# qhasm: x2 = tx2
# asm 1: stx <tx2=int64#13,[%fp+2023->x2=stack64#3]
# asm 2: stx <tx2=%o3,[%fp+2023->x2=96]
stx %o3,[%fp+2023-96]

# qhasm: x3 = tx3
# asm 1: stx <tx3=int64#14,[%fp+2023->x3=stack64#4]
# asm 2: stx <tx3=%o4,[%fp+2023->x3=104]
stx %o4,[%fp+2023-104]

# qhasm: tx0 = *(uint32 *) (ctxp + 16)
# asm 1: lduw [<ctxp=int64#2+16],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+16],>tx0=%g4
lduw [%i1+16],%g4

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x4  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x4=stack64#5]
# asm 2: stx <tx0=%g4,[%fp+2023->x4=112]
stx %g4,[%fp+2023-112]

# qhasm: tx0 = *(uint32 *) (ctxp + 20) 
# asm 1: lduw [<ctxp=int64#2+20],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+20],>tx0=%g4
lduw [%i1+20],%g4

# qhasm: x5  = tx1 
# asm 1: stx <tx1=int64#11,[%fp+2023->x5=stack64#6]
# asm 2: stx <tx1=%o1,[%fp+2023->x5=120]
stx %o1,[%fp+2023-120]

# qhasm: x6  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x6=stack64#7]
# asm 2: stx <tx2=%o3,[%fp+2023->x6=128]
stx %o3,[%fp+2023-128]

# qhasm: x7  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x7=stack64#8]
# asm 2: stx <tx3=%o4,[%fp+2023->x7=136]
stx %o4,[%fp+2023-136]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x8  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x8=stack64#9]
# asm 2: stx <tx0=%g4,[%fp+2023->x8=144]
stx %g4,[%fp+2023-144]

# qhasm: tx0 = *(uint32 *) (ctxp + 24) 
# asm 1: lduw [<ctxp=int64#2+24],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+24],>tx0=%g4
lduw [%i1+24],%g4

# qhasm: x9  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x9=stack64#10]
# asm 2: stx <tx1=%o1,[%fp+2023->x9=152]
stx %o1,[%fp+2023-152]

# qhasm: x10  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x10=stack64#11]
# asm 2: stx <tx2=%o3,[%fp+2023->x10=160]
stx %o3,[%fp+2023-160]

# qhasm: x11  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x11=stack64#12]
# asm 2: stx <tx3=%o4,[%fp+2023->x11=168]
stx %o4,[%fp+2023-168]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x12  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x12=stack64#13]
# asm 2: stx <tx0=%g4,[%fp+2023->x12=176]
stx %g4,[%fp+2023-176]

# qhasm: tx0 = *(uint32 *) (ctxp + 28) 
# asm 1: lduw [<ctxp=int64#2+28],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+28],>tx0=%g4
lduw [%i1+28],%g4

# qhasm: x13  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x13=stack64#14]
# asm 2: stx <tx1=%o1,[%fp+2023->x13=184]
stx %o1,[%fp+2023-184]

# qhasm: x14  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x14=stack64#15]
# asm 2: stx <tx2=%o3,[%fp+2023->x14=192]
stx %o3,[%fp+2023-192]

# qhasm: x15  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x15=stack64#16]
# asm 2: stx <tx3=%o4,[%fp+2023->x15=200]
stx %o4,[%fp+2023-200]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x16  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x16=stack64#17]
# asm 2: stx <tx0=%g4,[%fp+2023->x16=208]
stx %g4,[%fp+2023-208]

# qhasm: tx0 = *(uint32 *) (ctxp + 32) 
# asm 1: lduw [<ctxp=int64#2+32],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+32],>tx0=%g4
lduw [%i1+32],%g4

# qhasm: x17  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x17=stack64#18]
# asm 2: stx <tx1=%o1,[%fp+2023->x17=216]
stx %o1,[%fp+2023-216]

# qhasm: x18  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x18=stack64#19]
# asm 2: stx <tx2=%o3,[%fp+2023->x18=224]
stx %o3,[%fp+2023-224]

# qhasm: x19  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x19=stack64#20]
# asm 2: stx <tx3=%o4,[%fp+2023->x19=232]
stx %o4,[%fp+2023-232]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x20  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x20=stack64#21]
# asm 2: stx <tx0=%g4,[%fp+2023->x20=240]
stx %g4,[%fp+2023-240]

# qhasm: tx0 = *(uint32 *) (ctxp + 36) 
# asm 1: lduw [<ctxp=int64#2+36],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+36],>tx0=%g4
lduw [%i1+36],%g4

# qhasm: x21  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x21=stack64#22]
# asm 2: stx <tx1=%o1,[%fp+2023->x21=248]
stx %o1,[%fp+2023-248]

# qhasm: x22  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x22=stack64#23]
# asm 2: stx <tx2=%o3,[%fp+2023->x22=256]
stx %o3,[%fp+2023-256]

# qhasm: x23  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x23=stack64#24]
# asm 2: stx <tx3=%o4,[%fp+2023->x23=264]
stx %o4,[%fp+2023-264]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x24  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x24=stack64#25]
# asm 2: stx <tx0=%g4,[%fp+2023->x24=272]
stx %g4,[%fp+2023-272]

# qhasm: tx0 = *(uint32 *) (ctxp + 40) 
# asm 1: lduw [<ctxp=int64#2+40],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+40],>tx0=%g4
lduw [%i1+40],%g4

# qhasm: x25  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x25=stack64#26]
# asm 2: stx <tx1=%o1,[%fp+2023->x25=280]
stx %o1,[%fp+2023-280]

# qhasm: x26  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x26=stack64#27]
# asm 2: stx <tx2=%o3,[%fp+2023->x26=288]
stx %o3,[%fp+2023-288]

# qhasm: x27  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x27=stack64#28]
# asm 2: stx <tx3=%o4,[%fp+2023->x27=296]
stx %o4,[%fp+2023-296]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x28  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x28=stack64#29]
# asm 2: stx <tx0=%g4,[%fp+2023->x28=304]
stx %g4,[%fp+2023-304]

# qhasm: tx0 = *(uint32 *) (ctxp + 44) 
# asm 1: lduw [<ctxp=int64#2+44],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+44],>tx0=%g4
lduw [%i1+44],%g4

# qhasm: x29  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x29=stack64#30]
# asm 2: stx <tx1=%o1,[%fp+2023->x29=312]
stx %o1,[%fp+2023-312]

# qhasm: x30  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x30=stack64#31]
# asm 2: stx <tx2=%o3,[%fp+2023->x30=320]
stx %o3,[%fp+2023-320]

# qhasm: x31  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x31=stack64#32]
# asm 2: stx <tx3=%o4,[%fp+2023->x31=328]
stx %o4,[%fp+2023-328]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x32  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x32=stack64#33]
# asm 2: stx <tx0=%g4,[%fp+2023->x32=336]
stx %g4,[%fp+2023-336]

# qhasm: tx0 = *(uint32 *) (ctxp + 48) 
# asm 1: lduw [<ctxp=int64#2+48],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+48],>tx0=%g4
lduw [%i1+48],%g4

# qhasm: x33  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x33=stack64#34]
# asm 2: stx <tx1=%o1,[%fp+2023->x33=344]
stx %o1,[%fp+2023-344]

# qhasm: x34  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x34=stack64#35]
# asm 2: stx <tx2=%o3,[%fp+2023->x34=352]
stx %o3,[%fp+2023-352]

# qhasm: x35  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x35=stack64#36]
# asm 2: stx <tx3=%o4,[%fp+2023->x35=360]
stx %o4,[%fp+2023-360]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x36  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x36=stack64#37]
# asm 2: stx <tx0=%g4,[%fp+2023->x36=368]
stx %g4,[%fp+2023-368]

# qhasm: tx0 = *(uint32 *) (ctxp + 52) 
# asm 1: lduw [<ctxp=int64#2+52],>tx0=int64#8
# asm 2: lduw [<ctxp=%i1+52],>tx0=%g4
lduw [%i1+52],%g4

# qhasm: x37  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x37=stack64#38]
# asm 2: stx <tx1=%o1,[%fp+2023->x37=376]
stx %o1,[%fp+2023-376]

# qhasm: x38  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x38=stack64#39]
# asm 2: stx <tx2=%o3,[%fp+2023->x38=384]
stx %o3,[%fp+2023-384]

# qhasm: x39  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x39=stack64#40]
# asm 2: stx <tx3=%o4,[%fp+2023->x39=392]
stx %o4,[%fp+2023-392]

# qhasm: tx1 ^= tx0
# asm 1: xor <tx1=int64#11,<tx0=int64#8,>tx1=int64#11
# asm 2: xor <tx1=%o1,<tx0=%g4,>tx1=%o1
xor %o1,%g4,%o1

# qhasm: tx2 ^= tx1
# asm 1: xor <tx2=int64#13,<tx1=int64#11,>tx2=int64#13
# asm 2: xor <tx2=%o3,<tx1=%o1,>tx2=%o3
xor %o3,%o1,%o3

# qhasm: tx3 ^= tx2
# asm 1: xor <tx3=int64#14,<tx2=int64#13,>tx3=int64#14
# asm 2: xor <tx3=%o4,<tx2=%o3,>tx3=%o4
xor %o4,%o3,%o4

# qhasm: x40  = tx0 
# asm 1: stx <tx0=int64#8,[%fp+2023->x40=stack64#41]
# asm 2: stx <tx0=%g4,[%fp+2023->x40=400]
stx %g4,[%fp+2023-400]

# qhasm: x41  = tx1
# asm 1: stx <tx1=int64#11,[%fp+2023->x41=stack64#42]
# asm 2: stx <tx1=%o1,[%fp+2023->x41=408]
stx %o1,[%fp+2023-408]

# qhasm: x42  = tx2 
# asm 1: stx <tx2=int64#13,[%fp+2023->x42=stack64#43]
# asm 2: stx <tx2=%o3,[%fp+2023->x42=416]
stx %o3,[%fp+2023-416]

# qhasm: x43  = tx3 
# asm 1: stx <tx3=int64#14,[%fp+2023->x43=stack64#44]
# asm 2: stx <tx3=%o4,[%fp+2023->x43=424]
stx %o4,[%fp+2023-424]

# qhasm: y0 = *(uint32 *) (ctxp + 56)  
# asm 1: lduw [<ctxp=int64#2+56],>y0=int64#8
# asm 2: lduw [<ctxp=%i1+56],>y0=%g4
lduw [%i1+56],%g4

# qhasm: y1 = *(uint32 *) (ctxp + 60)  
# asm 1: lduw [<ctxp=int64#2+60],>y1=int64#11
# asm 2: lduw [<ctxp=%i1+60],>y1=%o1
lduw [%i1+60],%o1

# qhasm: y2 = *(uint32 *) (ctxp + 64)  
# asm 1: lduw [<ctxp=int64#2+64],>y2=int64#13
# asm 2: lduw [<ctxp=%i1+64],>y2=%o3
lduw [%i1+64],%o3

# qhasm: y3 = *(uint32 *) (ctxp + 68)  
# asm 1: lduw [<ctxp=int64#2+68],>y3=int64#14
# asm 2: lduw [<ctxp=%i1+68],>y3=%o4
lduw [%i1+68],%o4

# qhasm: unsigned<? length - 40
# asm 1: subcc <length=int64#5,40,%g0
# asm 2: subcc <length=%i4,40,%g0
subcc %i4,40,%g0

# qhasm: goto lessthan40bytesleft if unsigned<
blu,pt %xcc,._lessthan40bytesleft
nop

# qhasm: mainloop:
._mainloop:

# qhasm: length_stack = length
# asm 1: stx <length=int64#5,[%fp+2023->length_stack=stack64#4]
# asm 2: stx <length=%i4,[%fp+2023->length_stack=104]
stx %i4,[%fp+2023-104]

# qhasm: z0 = x4
# asm 1: ldx [%fp+2023-<x4=stack64#5],>z0=int64#5
# asm 2: ldx [%fp+2023-<x4=112],>z0=%i4
ldx [%fp+2023-112],%i4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#8,4,>p00=int64#15
# asm 2: sll <y0=%g4,4,>p00=%o5
sll %g4,4,%o5

# qhasm: z1 = x5
# asm 1: ldx [%fp+2023-<x5=stack64#6],>z1=int64#16
# asm 2: ldx [%fp+2023-<x5=120],>z1=%o7
ldx [%fp+2023-120],%o7

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#8,4,>p01=int64#17
# asm 2: srl <y0=%g4,4,>p01=%l0
srl %g4,4,%l0

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#15,4080,>p00=int64#15
# asm 2: and <p00=%o5,4080,>p00=%o5
and %o5,4080,%o5

# qhasm: z2 = x6
# asm 1: ldx [%fp+2023-<x6=stack64#7],>z2=int64#18
# asm 2: ldx [%fp+2023-<x6=128],>z2=%l1
ldx [%fp+2023-128],%l1

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#8,12,>p02=int64#19
# asm 2: srl <y0=%g4,12,>p02=%l2
srl %g4,12,%l2

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#17,4080,>p01=int64#17
# asm 2: and <p01=%l0,4080,>p01=%l0
and %l0,4080,%l0

# qhasm: z3 = x7
# asm 1: ldx [%fp+2023-<x7=stack64#8],>z3=int64#20
# asm 2: ldx [%fp+2023-<x7=136],>z3=%l3
ldx [%fp+2023-136],%l3

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#8,20,>p03=int64#8
# asm 2: srl <y0=%g4,20,>p03=%g4
srl %g4,20,%g4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#19,4080,>p02=int64#19
# asm 2: and <p02=%l2,4080,>p02=%l2
and %l2,4080,%l2

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#11,4,>p10=int64#21
# asm 2: sll <y1=%o1,4,>p10=%l4
sll %o1,4,%l4

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#8,4080,>p03=int64#8
# asm 2: and <p03=%g4,4080,>p03=%g4
and %g4,4080,%g4

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#15],>p00=int64#15
# asm 2: lduw [<table0=%g5+<p00=%o5],>p00=%o5
lduw [%g5+%o5],%o5

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#11,4,>p11=int64#22
# asm 2: srl <y1=%o1,4,>p11=%l5
srl %o1,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#21,4080,>p10=int64#21
# asm 2: and <p10=%l4,4080,>p10=%l4
and %l4,4080,%l4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#17],>p01=int64#17
# asm 2: lduw [<table1=%o0+<p01=%l0],>p01=%l0
lduw [%o0+%l0],%l0

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#11,12,>p12=int64#23
# asm 2: srl <y1=%o1,12,>p12=%l6
srl %o1,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#19],>p02=int64#19
# asm 2: lduw [<table2=%o2+<p02=%l2],>p02=%l2
lduw [%o2+%l2],%l2

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#11,20,>p13=int64#11
# asm 2: srl <y1=%o1,20,>p13=%o1
srl %o1,20,%o1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#8],>p03=int64#8
# asm 2: lduw [<table3=%i0+<p03=%g4],>p03=%g4
lduw [%i0+%g4],%g4

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#11,4080,>p13=int64#11
# asm 2: and <p13=%o1,4080,>p13=%o1
and %o1,4080,%o1

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#5,<p00=int64#15,>z0=int64#5
# asm 2: xor <z0=%i4,<p00=%o5,>z0=%i4
xor %i4,%o5,%i4

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#21],>p10=int64#15
# asm 2: lduw [<table0=%g5+<p10=%l4],>p10=%o5
lduw [%g5+%l4],%o5

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#13,4,>p20=int64#21
# asm 2: sll <y2=%o3,4,>p20=%l4
sll %o3,4,%l4

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#20,<p01=int64#17,>z3=int64#17
# asm 2: xor <z3=%l3,<p01=%l0,>z3=%l0
xor %l3,%l0,%l0

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#20
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l3
lduw [%o0+%l5],%l3

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#13,4,>p21=int64#22
# asm 2: srl <y2=%o3,4,>p21=%l5
srl %o3,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#19,>z2=int64#18
# asm 2: xor <z2=%l1,<p02=%l2,>z2=%l1
xor %l1,%l2,%l1

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#19
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l2
lduw [%o2+%l6],%l2

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#13,12,>p22=int64#23
# asm 2: srl <y2=%o3,12,>p22=%l6
srl %o3,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#8,>z1=int64#8
# asm 2: xor <z1=%o7,<p03=%g4,>z1=%g4
xor %o7,%g4,%g4

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#11],>p13=int64#11
# asm 2: lduw [<table3=%i0+<p13=%o1],>p13=%o1
lduw [%i0+%o1],%o1

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#13,20,>p23=int64#13
# asm 2: srl <y2=%o3,20,>p23=%o3
srl %o3,20,%o3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#21,4080,>p20=int64#16
# asm 2: and <p20=%l4,4080,>p20=%o7
and %l4,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#21
# asm 2: and <p21=%l5,4080,>p21=%l4
and %l5,4080,%l4

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#14,20,>p33=int64#23
# asm 2: srl <y3=%o4,20,>p33=%l6
srl %o4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#5,<p11=int64#20,>z0=int64#5
# asm 2: xor <z0=%i4,<p11=%l3,>z0=%i4
xor %i4,%l3,%i4

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#21],>p21=int64#20
# asm 2: lduw [<table1=%o0+<p21=%l4],>p21=%l3
lduw [%o0+%l4],%l3

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#14,4,>p31=int64#21
# asm 2: srl <y3=%o4,4,>p31=%l4
srl %o4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#13,4080,>p23=int64#13
# asm 2: and <p23=%o3,4080,>p23=%o3
and %o3,4080,%o3

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#8,<p10=int64#15,>z1=int64#8
# asm 2: xor <z1=%g4,<p10=%o5,>z1=%g4
xor %g4,%o5,%g4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#17,<p12=int64#19,>z3=int64#15
# asm 2: xor <z3=%l0,<p12=%l2,>z3=%o5
xor %l0,%l2,%o5

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#14,12,>p32=int64#17
# asm 2: srl <y3=%o4,12,>p32=%l0
srl %o4,12,%l0

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#18,<p13=int64#11,>z2=int64#11
# asm 2: xor <z2=%l1,<p13=%o1,>z2=%o1
xor %l1,%o1,%o1

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#13],>p23=int64#13
# asm 2: lduw [<table3=%i0+<p23=%o3],>p23=%o3
lduw [%i0+%o3],%o3

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#14,4,>p30=int64#14
# asm 2: sll <y3=%o4,4,>p30=%o4
sll %o4,4,%o4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#18
# asm 2: and <p33=%l6,4080,>p33=%l1
and %l6,4080,%l1

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#18],>p33=int64#18
# asm 2: lduw [<table3=%i0+<p33=%l1],>p33=%l1
lduw [%i0+%l1],%l1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#14,4080,>p30=int64#14
# asm 2: and <p30=%o4,4080,>p30=%o4
and %o4,4080,%o4

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#19],>p31=int64#19
# asm 2: lduw [<table1=%o0+<p31=%l2],>p31=%l2
lduw [%o0+%l2],%l2

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#17,4080,>p32=int64#17
# asm 2: and <p32=%l0,4080,>p32=%l0
and %l0,4080,%l0

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#11,<p20=int64#16,>z2=int64#11
# asm 2: xor <z2=%o1,<p20=%o7,>z2=%o1
xor %o1,%o7,%o1

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#14],>p30=int64#14
# asm 2: lduw [<table0=%g5+<p30=%o4],>p30=%o4
lduw [%g5+%o4],%o4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#8,<p21=int64#20,>z1=int64#8
# asm 2: xor <z1=%g4,<p21=%l3,>z1=%g4
xor %g4,%l3,%g4

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#5,<p22=int64#22,>z0=int64#5
# asm 2: xor <z0=%i4,<p22=%l5,>z0=%i4
xor %i4,%l5,%i4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#17],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l0],>p32=%o7
lduw [%o2+%l0],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#13,>z3=int64#13
# asm 2: xor <z3=%o5,<p23=%o3,>z3=%o3
xor %o5,%o3,%o3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#5,<p33=int64#18,>y0=int64#5
# asm 2: xor <z0=%i4,<p33=%l1,>y0=%i4
xor %i4,%l1,%i4

# qhasm: inint = *(uint32 *) (inp + 0)
# asm 1: lduw [<inp=int64#3+0],>inint=int64#15
# asm 2: lduw [<inp=%i2+0],>inint=%o5
lduw [%i2+0],%o5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#11,<p31=int64#19,>y2=int64#11
# asm 2: xor <z2=%o1,<p31=%l2,>y2=%o1
xor %o1,%l2,%o1

# qhasm: tmp0 = y0 & oddmask
# asm 1: and <y0=int64#5,<oddmask=int64#7,>tmp0=int64#17
# asm 2: and <y0=%i4,<oddmask=%g1,>tmp0=%l0
and %i4,%g1,%l0

# qhasm: tmp1 = y2 & oddmask
# asm 1: and <y2=int64#11,<oddmask=int64#7,>tmp1=int64#18
# asm 2: and <y2=%o1,<oddmask=%g1,>tmp1=%l1
and %o1,%g1,%l1

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#15,<tmp0=int64#17,>inint=int64#15
# asm 2: xor <inint=%o5,<tmp0=%l0,>inint=%o5
xor %o5,%l0,%o5

# qhasm: (uint32) tmp1 <<= 8
# asm 1: sll <tmp1=int64#18,8,>tmp1=int64#17
# asm 2: sll <tmp1=%l1,8,>tmp1=%l0
sll %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#13,<p30=int64#14,>y3=int64#13
# asm 2: xor <z3=%o3,<p30=%o4,>y3=%o3
xor %o3,%o4,%o3

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#15,<tmp1=int64#17,>inint=int64#14
# asm 2: xor <inint=%o5,<tmp1=%l0,>inint=%o4
xor %o5,%l0,%o4

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#8,<p32=int64#16,>y1=int64#8
# asm 2: xor <z1=%g4,<p32=%o7,>y1=%g4
xor %g4,%o7,%g4

# qhasm: z0 = x8
# asm 1: ldx [%fp+2023-<x8=stack64#9],>z0=int64#15
# asm 2: ldx [%fp+2023-<x8=144],>z0=%o5
ldx [%fp+2023-144],%o5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#5,4,>p00=int64#16
# asm 2: sll <y0=%i4,4,>p00=%o7
sll %i4,4,%o7

# qhasm: z1 = x9
# asm 1: ldx [%fp+2023-<x9=stack64#10],>z1=int64#17
# asm 2: ldx [%fp+2023-<x9=152],>z1=%l0
ldx [%fp+2023-152],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#5,4,>p01=int64#18
# asm 2: srl <y0=%i4,4,>p01=%l1
srl %i4,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x10
# asm 1: ldx [%fp+2023-<x10=stack64#11],>z2=int64#19
# asm 2: ldx [%fp+2023-<x10=160],>z2=%l2
ldx [%fp+2023-160],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#5,12,>p02=int64#20
# asm 2: srl <y0=%i4,12,>p02=%l3
srl %i4,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x11
# asm 1: ldx [%fp+2023-<x11=stack64#12],>z3=int64#21
# asm 2: ldx [%fp+2023-<x11=168],>z3=%l4
ldx [%fp+2023-168],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#5,20,>p03=int64#5
# asm 2: srl <y0=%i4,20,>p03=%i4
srl %i4,20,%i4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 0) = inint
# asm 1: stw <inint=int64#14,[<outp=int64#4+0]
# asm 2: stw <inint=%o4,[<outp=%i3+0]
stw %o4,[%i3+0]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#8,4,>p10=int64#14
# asm 2: sll <y1=%g4,4,>p10=%o4
sll %g4,4,%o4

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#5,4080,>p03=int64#5
# asm 2: and <p03=%i4,4080,>p03=%i4
and %i4,4080,%i4

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#8,4,>p11=int64#22
# asm 2: srl <y1=%g4,4,>p11=%l5
srl %g4,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#14,4080,>p10=int64#14
# asm 2: and <p10=%o4,4080,>p10=%o4
and %o4,4080,%o4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#8,12,>p12=int64#23
# asm 2: srl <y1=%g4,12,>p12=%l6
srl %g4,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#8,20,>p13=int64#8
# asm 2: srl <y1=%g4,20,>p13=%g4
srl %g4,20,%g4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#5],>p03=int64#5
# asm 2: lduw [<table3=%i0+<p03=%i4],>p03=%i4
lduw [%i0+%i4],%i4

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#8,4080,>p13=int64#8
# asm 2: and <p13=%g4,4080,>p13=%g4
and %g4,4080,%g4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#16,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%o7,>z0=%o5
xor %o5,%o7,%o5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#14],>p10=int64#14
# asm 2: lduw [<table0=%g5+<p10=%o4],>p10=%o4
lduw [%g5+%o4],%o4

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#11,4,>p20=int64#16
# asm 2: sll <y2=%o1,4,>p20=%o7
sll %o1,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#11,4,>p21=int64#22
# asm 2: srl <y2=%o1,4,>p21=%l5
srl %o1,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#11,12,>p22=int64#23
# asm 2: srl <y2=%o1,12,>p22=%l6
srl %o1,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#5,>z1=int64#5
# asm 2: xor <z1=%l0,<p03=%i4,>z1=%i4
xor %l0,%i4,%i4

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#8],>p13=int64#8
# asm 2: lduw [<table3=%i0+<p13=%g4],>p13=%g4
lduw [%i0+%g4],%g4

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#11,20,>p23=int64#11
# asm 2: srl <y2=%o1,20,>p23=%o1
srl %o1,20,%o1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#13,20,>p33=int64#23
# asm 2: srl <y3=%o3,20,>p33=%l6
srl %o3,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#15,<p11=int64#21,>z0=int64#15
# asm 2: xor <z0=%o5,<p11=%l4,>z0=%o5
xor %o5,%l4,%o5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#13,4,>p31=int64#21
# asm 2: srl <y3=%o3,4,>p31=%l4
srl %o3,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#11,4080,>p23=int64#11
# asm 2: and <p23=%o1,4080,>p23=%o1
and %o1,4080,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#5,<p10=int64#14,>z1=int64#5
# asm 2: xor <z1=%i4,<p10=%o4,>z1=%i4
xor %i4,%o4,%i4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#14
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o4
xor %l1,%l3,%o4

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#13,12,>p32=int64#18
# asm 2: srl <y3=%o3,12,>p32=%l1
srl %o3,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#8,>z2=int64#8
# asm 2: xor <z2=%l2,<p13=%g4,>z2=%g4
xor %l2,%g4,%g4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#11],>p23=int64#11
# asm 2: lduw [<table3=%i0+<p23=%o1],>p23=%o1
lduw [%i0+%o1],%o1

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#13,4,>p30=int64#13
# asm 2: sll <y3=%o3,4,>p30=%o3
sll %o3,4,%o3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#19],>p31=int64#19
# asm 2: lduw [<table1=%o0+<p31=%l2],>p31=%l2
lduw [%o0+%l2],%l2

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#20
# asm 2: and <p33=%l6,4080,>p33=%l3
and %l6,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#13,4080,>p30=int64#13
# asm 2: and <p30=%o3,4080,>p30=%o3
and %o3,4080,%o3

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#20],>p33=int64#20
# asm 2: lduw [<table3=%i0+<p33=%l3],>p33=%l3
lduw [%i0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#8,<p20=int64#16,>z2=int64#8
# asm 2: xor <z2=%g4,<p20=%o7,>z2=%g4
xor %g4,%o7,%g4

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#13],>p30=int64#13
# asm 2: lduw [<table0=%g5+<p30=%o3],>p30=%o3
lduw [%g5+%o3],%o3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#5,<p21=int64#17,>z1=int64#5
# asm 2: xor <z1=%i4,<p21=%l0,>z1=%i4
xor %i4,%l0,%i4

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#15,<p22=int64#22,>z0=int64#15
# asm 2: xor <z0=%o5,<p22=%l5,>z0=%o5
xor %o5,%l5,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#14,<p23=int64#11,>z3=int64#11
# asm 2: xor <z3=%o4,<p23=%o1,>z3=%o1
xor %o4,%o1,%o1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#8,<p31=int64#19,>y2=int64#8
# asm 2: xor <z2=%g4,<p31=%l2,>y2=%g4
xor %g4,%l2,%g4

# qhasm: inint = *(uint32 *) (inp + 4)
# asm 1: lduw [<inp=int64#3+4],>inint=int64#14
# asm 2: lduw [<inp=%i2+4],>inint=%o4
lduw [%i2+4],%o4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#15,<p33=int64#20,>y0=int64#15
# asm 2: xor <z0=%o5,<p33=%l3,>y0=%o5
xor %o5,%l3,%o5

# qhasm: tmp1 = y2 & evenmask
# asm 1: and <y2=int64#8,<evenmask=int64#6,>tmp1=int64#17
# asm 2: and <y2=%g4,<evenmask=%i5,>tmp1=%l0
and %g4,%i5,%l0

# qhasm: tmp0 = y0 & evenmask
# asm 1: and <y0=int64#15,<evenmask=int64#6,>tmp0=int64#18
# asm 2: and <y0=%o5,<evenmask=%i5,>tmp0=%l1
and %o5,%i5,%l1

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#14,<tmp1=int64#17,>inint=int64#14
# asm 2: xor <inint=%o4,<tmp1=%l0,>inint=%o4
xor %o4,%l0,%o4

# qhasm: (uint32) tmp0 >>= 8
# asm 1: srl <tmp0=int64#18,8,>tmp0=int64#17
# asm 2: srl <tmp0=%l1,8,>tmp0=%l0
srl %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#11,<p30=int64#13,>y3=int64#11
# asm 2: xor <z3=%o1,<p30=%o3,>y3=%o1
xor %o1,%o3,%o1

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#14,<tmp0=int64#17,>inint=int64#13
# asm 2: xor <inint=%o4,<tmp0=%l0,>inint=%o3
xor %o4,%l0,%o3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#5,<p32=int64#16,>y1=int64#5
# asm 2: xor <z1=%i4,<p32=%o7,>y1=%i4
xor %i4,%o7,%i4

# qhasm: z0 = x12
# asm 1: ldx [%fp+2023-<x12=stack64#13],>z0=int64#14
# asm 2: ldx [%fp+2023-<x12=176],>z0=%o4
ldx [%fp+2023-176],%o4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#15,4,>p00=int64#16
# asm 2: sll <y0=%o5,4,>p00=%o7
sll %o5,4,%o7

# qhasm: z1 = x13
# asm 1: ldx [%fp+2023-<x13=stack64#14],>z1=int64#17
# asm 2: ldx [%fp+2023-<x13=184],>z1=%l0
ldx [%fp+2023-184],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#15,4,>p01=int64#18
# asm 2: srl <y0=%o5,4,>p01=%l1
srl %o5,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x14
# asm 1: ldx [%fp+2023-<x14=stack64#15],>z2=int64#19
# asm 2: ldx [%fp+2023-<x14=192],>z2=%l2
ldx [%fp+2023-192],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#15,12,>p02=int64#20
# asm 2: srl <y0=%o5,12,>p02=%l3
srl %o5,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x15
# asm 1: ldx [%fp+2023-<x15=stack64#16],>z3=int64#21
# asm 2: ldx [%fp+2023-<x15=200],>z3=%l4
ldx [%fp+2023-200],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#15,20,>p03=int64#15
# asm 2: srl <y0=%o5,20,>p03=%o5
srl %o5,20,%o5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 4) = inint
# asm 1: stw <inint=int64#13,[<outp=int64#4+4]
# asm 2: stw <inint=%o3,[<outp=%i3+4]
stw %o3,[%i3+4]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#5,4,>p10=int64#13
# asm 2: sll <y1=%i4,4,>p10=%o3
sll %i4,4,%o3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#15,4080,>p03=int64#15
# asm 2: and <p03=%o5,4080,>p03=%o5
and %o5,4080,%o5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#5,4,>p11=int64#22
# asm 2: srl <y1=%i4,4,>p11=%l5
srl %i4,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#13,4080,>p10=int64#13
# asm 2: and <p10=%o3,4080,>p10=%o3
and %o3,4080,%o3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#5,12,>p12=int64#23
# asm 2: srl <y1=%i4,12,>p12=%l6
srl %i4,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#5,20,>p13=int64#5
# asm 2: srl <y1=%i4,20,>p13=%i4
srl %i4,20,%i4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#15],>p03=int64#15
# asm 2: lduw [<table3=%i0+<p03=%o5],>p03=%o5
lduw [%i0+%o5],%o5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#5,4080,>p13=int64#5
# asm 2: and <p13=%i4,4080,>p13=%i4
and %i4,4080,%i4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#14,<p00=int64#16,>z0=int64#14
# asm 2: xor <z0=%o4,<p00=%o7,>z0=%o4
xor %o4,%o7,%o4

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#13],>p10=int64#13
# asm 2: lduw [<table0=%g5+<p10=%o3],>p10=%o3
lduw [%g5+%o3],%o3

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#8,4,>p20=int64#16
# asm 2: sll <y2=%g4,4,>p20=%o7
sll %g4,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#8,4,>p21=int64#22
# asm 2: srl <y2=%g4,4,>p21=%l5
srl %g4,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#8,12,>p22=int64#23
# asm 2: srl <y2=%g4,12,>p22=%l6
srl %g4,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#15,>z1=int64#15
# asm 2: xor <z1=%l0,<p03=%o5,>z1=%o5
xor %l0,%o5,%o5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#5],>p13=int64#5
# asm 2: lduw [<table3=%i0+<p13=%i4],>p13=%i4
lduw [%i0+%i4],%i4

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#8,20,>p23=int64#8
# asm 2: srl <y2=%g4,20,>p23=%g4
srl %g4,20,%g4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#11,20,>p33=int64#23
# asm 2: srl <y3=%o1,20,>p33=%l6
srl %o1,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#14,<p11=int64#21,>z0=int64#14
# asm 2: xor <z0=%o4,<p11=%l4,>z0=%o4
xor %o4,%l4,%o4

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#11,4,>p31=int64#21
# asm 2: srl <y3=%o1,4,>p31=%l4
srl %o1,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#8,4080,>p23=int64#8
# asm 2: and <p23=%g4,4080,>p23=%g4
and %g4,4080,%g4

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#15,<p10=int64#13,>z1=int64#13
# asm 2: xor <z1=%o5,<p10=%o3,>z1=%o3
xor %o5,%o3,%o3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#15
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o5
xor %l1,%l3,%o5

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#11,12,>p32=int64#18
# asm 2: srl <y3=%o1,12,>p32=%l1
srl %o1,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#5,>z2=int64#5
# asm 2: xor <z2=%l2,<p13=%i4,>z2=%i4
xor %l2,%i4,%i4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#8],>p23=int64#8
# asm 2: lduw [<table3=%i0+<p23=%g4],>p23=%g4
lduw [%i0+%g4],%g4

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#11,4,>p30=int64#11
# asm 2: sll <y3=%o1,4,>p30=%o1
sll %o1,4,%o1

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#19
# asm 2: and <p33=%l6,4080,>p33=%l2
and %l6,4080,%l2

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#19],>p33=int64#19
# asm 2: lduw [<table3=%i0+<p33=%l2],>p33=%l2
lduw [%i0+%l2],%l2

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#20
# asm 2: and <p31=%l4,4080,>p31=%l3
and %l4,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#11,4080,>p30=int64#11
# asm 2: and <p30=%o1,4080,>p30=%o1
and %o1,4080,%o1

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#20],>p31=int64#20
# asm 2: lduw [<table1=%o0+<p31=%l3],>p31=%l3
lduw [%o0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#5,<p20=int64#16,>z2=int64#5
# asm 2: xor <z2=%i4,<p20=%o7,>z2=%i4
xor %i4,%o7,%i4

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#11],>p30=int64#11
# asm 2: lduw [<table0=%g5+<p30=%o1],>p30=%o1
lduw [%g5+%o1],%o1

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#13,<p21=int64#17,>z1=int64#13
# asm 2: xor <z1=%o3,<p21=%l0,>z1=%o3
xor %o3,%l0,%o3

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#14,<p22=int64#22,>z0=int64#14
# asm 2: xor <z0=%o4,<p22=%l5,>z0=%o4
xor %o4,%l5,%o4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#8,>z3=int64#8
# asm 2: xor <z3=%o5,<p23=%g4,>z3=%g4
xor %o5,%g4,%g4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#14,<p33=int64#19,>y0=int64#14
# asm 2: xor <z0=%o4,<p33=%l2,>y0=%o4
xor %o4,%l2,%o4

# qhasm: inint = *(uint32 *) (inp + 8)
# asm 1: lduw [<inp=int64#3+8],>inint=int64#15
# asm 2: lduw [<inp=%i2+8],>inint=%o5
lduw [%i2+8],%o5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#5,<p31=int64#20,>y2=int64#5
# asm 2: xor <z2=%i4,<p31=%l3,>y2=%i4
xor %i4,%l3,%i4

# qhasm: tmp0 = y0 & oddmask
# asm 1: and <y0=int64#14,<oddmask=int64#7,>tmp0=int64#17
# asm 2: and <y0=%o4,<oddmask=%g1,>tmp0=%l0
and %o4,%g1,%l0

# qhasm: tmp1 = y2 & oddmask
# asm 1: and <y2=int64#5,<oddmask=int64#7,>tmp1=int64#18
# asm 2: and <y2=%i4,<oddmask=%g1,>tmp1=%l1
and %i4,%g1,%l1

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#15,<tmp0=int64#17,>inint=int64#15
# asm 2: xor <inint=%o5,<tmp0=%l0,>inint=%o5
xor %o5,%l0,%o5

# qhasm: (uint32) tmp1 <<= 8
# asm 1: sll <tmp1=int64#18,8,>tmp1=int64#17
# asm 2: sll <tmp1=%l1,8,>tmp1=%l0
sll %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#8,<p30=int64#11,>y3=int64#8
# asm 2: xor <z3=%g4,<p30=%o1,>y3=%g4
xor %g4,%o1,%g4

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#15,<tmp1=int64#17,>inint=int64#11
# asm 2: xor <inint=%o5,<tmp1=%l0,>inint=%o1
xor %o5,%l0,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#13,<p32=int64#16,>y1=int64#13
# asm 2: xor <z1=%o3,<p32=%o7,>y1=%o3
xor %o3,%o7,%o3

# qhasm: z0 = x16
# asm 1: ldx [%fp+2023-<x16=stack64#17],>z0=int64#15
# asm 2: ldx [%fp+2023-<x16=208],>z0=%o5
ldx [%fp+2023-208],%o5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#14,4,>p00=int64#16
# asm 2: sll <y0=%o4,4,>p00=%o7
sll %o4,4,%o7

# qhasm: z1 = x17
# asm 1: ldx [%fp+2023-<x17=stack64#18],>z1=int64#17
# asm 2: ldx [%fp+2023-<x17=216],>z1=%l0
ldx [%fp+2023-216],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#14,4,>p01=int64#18
# asm 2: srl <y0=%o4,4,>p01=%l1
srl %o4,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x18
# asm 1: ldx [%fp+2023-<x18=stack64#19],>z2=int64#19
# asm 2: ldx [%fp+2023-<x18=224],>z2=%l2
ldx [%fp+2023-224],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#14,12,>p02=int64#20
# asm 2: srl <y0=%o4,12,>p02=%l3
srl %o4,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x19
# asm 1: ldx [%fp+2023-<x19=stack64#20],>z3=int64#21
# asm 2: ldx [%fp+2023-<x19=232],>z3=%l4
ldx [%fp+2023-232],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#14,20,>p03=int64#14
# asm 2: srl <y0=%o4,20,>p03=%o4
srl %o4,20,%o4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 8) = inint
# asm 1: stw <inint=int64#11,[<outp=int64#4+8]
# asm 2: stw <inint=%o1,[<outp=%i3+8]
stw %o1,[%i3+8]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#13,4,>p10=int64#11
# asm 2: sll <y1=%o3,4,>p10=%o1
sll %o3,4,%o1

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#14,4080,>p03=int64#14
# asm 2: and <p03=%o4,4080,>p03=%o4
and %o4,4080,%o4

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#13,4,>p11=int64#22
# asm 2: srl <y1=%o3,4,>p11=%l5
srl %o3,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#11,4080,>p10=int64#11
# asm 2: and <p10=%o1,4080,>p10=%o1
and %o1,4080,%o1

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#13,12,>p12=int64#23
# asm 2: srl <y1=%o3,12,>p12=%l6
srl %o3,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#13,20,>p13=int64#13
# asm 2: srl <y1=%o3,20,>p13=%o3
srl %o3,20,%o3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#14],>p03=int64#14
# asm 2: lduw [<table3=%i0+<p03=%o4],>p03=%o4
lduw [%i0+%o4],%o4

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#13,4080,>p13=int64#13
# asm 2: and <p13=%o3,4080,>p13=%o3
and %o3,4080,%o3

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#16,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%o7,>z0=%o5
xor %o5,%o7,%o5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#11],>p10=int64#11
# asm 2: lduw [<table0=%g5+<p10=%o1],>p10=%o1
lduw [%g5+%o1],%o1

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#5,4,>p20=int64#16
# asm 2: sll <y2=%i4,4,>p20=%o7
sll %i4,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#5,4,>p21=int64#22
# asm 2: srl <y2=%i4,4,>p21=%l5
srl %i4,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#5,12,>p22=int64#23
# asm 2: srl <y2=%i4,12,>p22=%l6
srl %i4,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#14,>z1=int64#14
# asm 2: xor <z1=%l0,<p03=%o4,>z1=%o4
xor %l0,%o4,%o4

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#13],>p13=int64#13
# asm 2: lduw [<table3=%i0+<p13=%o3],>p13=%o3
lduw [%i0+%o3],%o3

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#5,20,>p23=int64#5
# asm 2: srl <y2=%i4,20,>p23=%i4
srl %i4,20,%i4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#8,20,>p33=int64#23
# asm 2: srl <y3=%g4,20,>p33=%l6
srl %g4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#15,<p11=int64#21,>z0=int64#15
# asm 2: xor <z0=%o5,<p11=%l4,>z0=%o5
xor %o5,%l4,%o5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#8,4,>p31=int64#21
# asm 2: srl <y3=%g4,4,>p31=%l4
srl %g4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#5,4080,>p23=int64#5
# asm 2: and <p23=%i4,4080,>p23=%i4
and %i4,4080,%i4

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#14,<p10=int64#11,>z1=int64#11
# asm 2: xor <z1=%o4,<p10=%o1,>z1=%o1
xor %o4,%o1,%o1

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#14
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o4
xor %l1,%l3,%o4

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#8,12,>p32=int64#18
# asm 2: srl <y3=%g4,12,>p32=%l1
srl %g4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#13,>z2=int64#13
# asm 2: xor <z2=%l2,<p13=%o3,>z2=%o3
xor %l2,%o3,%o3

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#5],>p23=int64#5
# asm 2: lduw [<table3=%i0+<p23=%i4],>p23=%i4
lduw [%i0+%i4],%i4

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#8,4,>p30=int64#8
# asm 2: sll <y3=%g4,4,>p30=%g4
sll %g4,4,%g4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#19],>p31=int64#19
# asm 2: lduw [<table1=%o0+<p31=%l2],>p31=%l2
lduw [%o0+%l2],%l2

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#20
# asm 2: and <p33=%l6,4080,>p33=%l3
and %l6,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#8,4080,>p30=int64#8
# asm 2: and <p30=%g4,4080,>p30=%g4
and %g4,4080,%g4

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#20],>p33=int64#20
# asm 2: lduw [<table3=%i0+<p33=%l3],>p33=%l3
lduw [%i0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#13,<p20=int64#16,>z2=int64#13
# asm 2: xor <z2=%o3,<p20=%o7,>z2=%o3
xor %o3,%o7,%o3

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#8],>p30=int64#8
# asm 2: lduw [<table0=%g5+<p30=%g4],>p30=%g4
lduw [%g5+%g4],%g4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#11,<p21=int64#17,>z1=int64#11
# asm 2: xor <z1=%o1,<p21=%l0,>z1=%o1
xor %o1,%l0,%o1

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#15,<p22=int64#22,>z0=int64#15
# asm 2: xor <z0=%o5,<p22=%l5,>z0=%o5
xor %o5,%l5,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#14,<p23=int64#5,>z3=int64#5
# asm 2: xor <z3=%o4,<p23=%i4,>z3=%i4
xor %o4,%i4,%i4

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#13,<p31=int64#19,>y2=int64#13
# asm 2: xor <z2=%o3,<p31=%l2,>y2=%o3
xor %o3,%l2,%o3

# qhasm: inint = *(uint32 *) (inp + 12)
# asm 1: lduw [<inp=int64#3+12],>inint=int64#14
# asm 2: lduw [<inp=%i2+12],>inint=%o4
lduw [%i2+12],%o4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#15,<p33=int64#20,>y0=int64#15
# asm 2: xor <z0=%o5,<p33=%l3,>y0=%o5
xor %o5,%l3,%o5

# qhasm: tmp1 = y2 & evenmask
# asm 1: and <y2=int64#13,<evenmask=int64#6,>tmp1=int64#17
# asm 2: and <y2=%o3,<evenmask=%i5,>tmp1=%l0
and %o3,%i5,%l0

# qhasm: tmp0 = y0 & evenmask
# asm 1: and <y0=int64#15,<evenmask=int64#6,>tmp0=int64#18
# asm 2: and <y0=%o5,<evenmask=%i5,>tmp0=%l1
and %o5,%i5,%l1

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#14,<tmp1=int64#17,>inint=int64#14
# asm 2: xor <inint=%o4,<tmp1=%l0,>inint=%o4
xor %o4,%l0,%o4

# qhasm: (uint32) tmp0 >>= 8
# asm 1: srl <tmp0=int64#18,8,>tmp0=int64#17
# asm 2: srl <tmp0=%l1,8,>tmp0=%l0
srl %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#5,<p30=int64#8,>y3=int64#5
# asm 2: xor <z3=%i4,<p30=%g4,>y3=%i4
xor %i4,%g4,%i4

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#14,<tmp0=int64#17,>inint=int64#8
# asm 2: xor <inint=%o4,<tmp0=%l0,>inint=%g4
xor %o4,%l0,%g4

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#11,<p32=int64#16,>y1=int64#11
# asm 2: xor <z1=%o1,<p32=%o7,>y1=%o1
xor %o1,%o7,%o1

# qhasm: z0 = x20
# asm 1: ldx [%fp+2023-<x20=stack64#21],>z0=int64#14
# asm 2: ldx [%fp+2023-<x20=240],>z0=%o4
ldx [%fp+2023-240],%o4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#15,4,>p00=int64#16
# asm 2: sll <y0=%o5,4,>p00=%o7
sll %o5,4,%o7

# qhasm: z1 = x21
# asm 1: ldx [%fp+2023-<x21=stack64#22],>z1=int64#17
# asm 2: ldx [%fp+2023-<x21=248],>z1=%l0
ldx [%fp+2023-248],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#15,4,>p01=int64#18
# asm 2: srl <y0=%o5,4,>p01=%l1
srl %o5,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x22
# asm 1: ldx [%fp+2023-<x22=stack64#23],>z2=int64#19
# asm 2: ldx [%fp+2023-<x22=256],>z2=%l2
ldx [%fp+2023-256],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#15,12,>p02=int64#20
# asm 2: srl <y0=%o5,12,>p02=%l3
srl %o5,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x23
# asm 1: ldx [%fp+2023-<x23=stack64#24],>z3=int64#21
# asm 2: ldx [%fp+2023-<x23=264],>z3=%l4
ldx [%fp+2023-264],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#15,20,>p03=int64#15
# asm 2: srl <y0=%o5,20,>p03=%o5
srl %o5,20,%o5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 12) = inint
# asm 1: stw <inint=int64#8,[<outp=int64#4+12]
# asm 2: stw <inint=%g4,[<outp=%i3+12]
stw %g4,[%i3+12]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#11,4,>p10=int64#8
# asm 2: sll <y1=%o1,4,>p10=%g4
sll %o1,4,%g4

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#15,4080,>p03=int64#15
# asm 2: and <p03=%o5,4080,>p03=%o5
and %o5,4080,%o5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#11,4,>p11=int64#22
# asm 2: srl <y1=%o1,4,>p11=%l5
srl %o1,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#8,4080,>p10=int64#8
# asm 2: and <p10=%g4,4080,>p10=%g4
and %g4,4080,%g4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#11,12,>p12=int64#23
# asm 2: srl <y1=%o1,12,>p12=%l6
srl %o1,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#11,20,>p13=int64#11
# asm 2: srl <y1=%o1,20,>p13=%o1
srl %o1,20,%o1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#15],>p03=int64#15
# asm 2: lduw [<table3=%i0+<p03=%o5],>p03=%o5
lduw [%i0+%o5],%o5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#11,4080,>p13=int64#11
# asm 2: and <p13=%o1,4080,>p13=%o1
and %o1,4080,%o1

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#14,<p00=int64#16,>z0=int64#14
# asm 2: xor <z0=%o4,<p00=%o7,>z0=%o4
xor %o4,%o7,%o4

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#8],>p10=int64#8
# asm 2: lduw [<table0=%g5+<p10=%g4],>p10=%g4
lduw [%g5+%g4],%g4

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#13,4,>p20=int64#16
# asm 2: sll <y2=%o3,4,>p20=%o7
sll %o3,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#13,4,>p21=int64#22
# asm 2: srl <y2=%o3,4,>p21=%l5
srl %o3,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#13,12,>p22=int64#23
# asm 2: srl <y2=%o3,12,>p22=%l6
srl %o3,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#15,>z1=int64#15
# asm 2: xor <z1=%l0,<p03=%o5,>z1=%o5
xor %l0,%o5,%o5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#11],>p13=int64#11
# asm 2: lduw [<table3=%i0+<p13=%o1],>p13=%o1
lduw [%i0+%o1],%o1

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#13,20,>p23=int64#13
# asm 2: srl <y2=%o3,20,>p23=%o3
srl %o3,20,%o3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#5,20,>p33=int64#23
# asm 2: srl <y3=%i4,20,>p33=%l6
srl %i4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#14,<p11=int64#21,>z0=int64#14
# asm 2: xor <z0=%o4,<p11=%l4,>z0=%o4
xor %o4,%l4,%o4

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#5,4,>p31=int64#21
# asm 2: srl <y3=%i4,4,>p31=%l4
srl %i4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#13,4080,>p23=int64#13
# asm 2: and <p23=%o3,4080,>p23=%o3
and %o3,4080,%o3

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#15,<p10=int64#8,>z1=int64#8
# asm 2: xor <z1=%o5,<p10=%g4,>z1=%g4
xor %o5,%g4,%g4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#15
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o5
xor %l1,%l3,%o5

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#18
# asm 2: srl <y3=%i4,12,>p32=%l1
srl %i4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#11,>z2=int64#11
# asm 2: xor <z2=%l2,<p13=%o1,>z2=%o1
xor %l2,%o1,%o1

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#13],>p23=int64#13
# asm 2: lduw [<table3=%i0+<p23=%o3],>p23=%o3
lduw [%i0+%o3],%o3

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#5,4,>p30=int64#5
# asm 2: sll <y3=%i4,4,>p30=%i4
sll %i4,4,%i4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#19
# asm 2: and <p33=%l6,4080,>p33=%l2
and %l6,4080,%l2

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#19],>p33=int64#19
# asm 2: lduw [<table3=%i0+<p33=%l2],>p33=%l2
lduw [%i0+%l2],%l2

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#20
# asm 2: and <p31=%l4,4080,>p31=%l3
and %l4,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#5,4080,>p30=int64#5
# asm 2: and <p30=%i4,4080,>p30=%i4
and %i4,4080,%i4

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#20],>p31=int64#20
# asm 2: lduw [<table1=%o0+<p31=%l3],>p31=%l3
lduw [%o0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#11,<p20=int64#16,>z2=int64#11
# asm 2: xor <z2=%o1,<p20=%o7,>z2=%o1
xor %o1,%o7,%o1

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#5],>p30=int64#5
# asm 2: lduw [<table0=%g5+<p30=%i4],>p30=%i4
lduw [%g5+%i4],%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#8,<p21=int64#17,>z1=int64#8
# asm 2: xor <z1=%g4,<p21=%l0,>z1=%g4
xor %g4,%l0,%g4

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#14,<p22=int64#22,>z0=int64#14
# asm 2: xor <z0=%o4,<p22=%l5,>z0=%o4
xor %o4,%l5,%o4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#13,>z3=int64#13
# asm 2: xor <z3=%o5,<p23=%o3,>z3=%o3
xor %o5,%o3,%o3

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#14,<p33=int64#19,>y0=int64#14
# asm 2: xor <z0=%o4,<p33=%l2,>y0=%o4
xor %o4,%l2,%o4

# qhasm: inint = *(uint32 *) (inp + 16)
# asm 1: lduw [<inp=int64#3+16],>inint=int64#15
# asm 2: lduw [<inp=%i2+16],>inint=%o5
lduw [%i2+16],%o5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#11,<p31=int64#20,>y2=int64#11
# asm 2: xor <z2=%o1,<p31=%l3,>y2=%o1
xor %o1,%l3,%o1

# qhasm: tmp0 = y0 & oddmask
# asm 1: and <y0=int64#14,<oddmask=int64#7,>tmp0=int64#17
# asm 2: and <y0=%o4,<oddmask=%g1,>tmp0=%l0
and %o4,%g1,%l0

# qhasm: tmp1 = y2 & oddmask
# asm 1: and <y2=int64#11,<oddmask=int64#7,>tmp1=int64#18
# asm 2: and <y2=%o1,<oddmask=%g1,>tmp1=%l1
and %o1,%g1,%l1

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#15,<tmp0=int64#17,>inint=int64#15
# asm 2: xor <inint=%o5,<tmp0=%l0,>inint=%o5
xor %o5,%l0,%o5

# qhasm: (uint32) tmp1 <<= 8
# asm 1: sll <tmp1=int64#18,8,>tmp1=int64#17
# asm 2: sll <tmp1=%l1,8,>tmp1=%l0
sll %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#13,<p30=int64#5,>y3=int64#5
# asm 2: xor <z3=%o3,<p30=%i4,>y3=%i4
xor %o3,%i4,%i4

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#15,<tmp1=int64#17,>inint=int64#13
# asm 2: xor <inint=%o5,<tmp1=%l0,>inint=%o3
xor %o5,%l0,%o3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#8,<p32=int64#16,>y1=int64#8
# asm 2: xor <z1=%g4,<p32=%o7,>y1=%g4
xor %g4,%o7,%g4

# qhasm: z0 = x24
# asm 1: ldx [%fp+2023-<x24=stack64#25],>z0=int64#15
# asm 2: ldx [%fp+2023-<x24=272],>z0=%o5
ldx [%fp+2023-272],%o5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#14,4,>p00=int64#16
# asm 2: sll <y0=%o4,4,>p00=%o7
sll %o4,4,%o7

# qhasm: z1 = x25
# asm 1: ldx [%fp+2023-<x25=stack64#26],>z1=int64#17
# asm 2: ldx [%fp+2023-<x25=280],>z1=%l0
ldx [%fp+2023-280],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#14,4,>p01=int64#18
# asm 2: srl <y0=%o4,4,>p01=%l1
srl %o4,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x26
# asm 1: ldx [%fp+2023-<x26=stack64#27],>z2=int64#19
# asm 2: ldx [%fp+2023-<x26=288],>z2=%l2
ldx [%fp+2023-288],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#14,12,>p02=int64#20
# asm 2: srl <y0=%o4,12,>p02=%l3
srl %o4,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x27
# asm 1: ldx [%fp+2023-<x27=stack64#28],>z3=int64#21
# asm 2: ldx [%fp+2023-<x27=296],>z3=%l4
ldx [%fp+2023-296],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#14,20,>p03=int64#14
# asm 2: srl <y0=%o4,20,>p03=%o4
srl %o4,20,%o4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 16) = inint
# asm 1: stw <inint=int64#13,[<outp=int64#4+16]
# asm 2: stw <inint=%o3,[<outp=%i3+16]
stw %o3,[%i3+16]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#8,4,>p10=int64#13
# asm 2: sll <y1=%g4,4,>p10=%o3
sll %g4,4,%o3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#14,4080,>p03=int64#14
# asm 2: and <p03=%o4,4080,>p03=%o4
and %o4,4080,%o4

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#8,4,>p11=int64#22
# asm 2: srl <y1=%g4,4,>p11=%l5
srl %g4,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#13,4080,>p10=int64#13
# asm 2: and <p10=%o3,4080,>p10=%o3
and %o3,4080,%o3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#8,12,>p12=int64#23
# asm 2: srl <y1=%g4,12,>p12=%l6
srl %g4,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#8,20,>p13=int64#8
# asm 2: srl <y1=%g4,20,>p13=%g4
srl %g4,20,%g4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#14],>p03=int64#14
# asm 2: lduw [<table3=%i0+<p03=%o4],>p03=%o4
lduw [%i0+%o4],%o4

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#8,4080,>p13=int64#8
# asm 2: and <p13=%g4,4080,>p13=%g4
and %g4,4080,%g4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#16,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%o7,>z0=%o5
xor %o5,%o7,%o5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#13],>p10=int64#13
# asm 2: lduw [<table0=%g5+<p10=%o3],>p10=%o3
lduw [%g5+%o3],%o3

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#11,4,>p20=int64#16
# asm 2: sll <y2=%o1,4,>p20=%o7
sll %o1,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#11,4,>p21=int64#22
# asm 2: srl <y2=%o1,4,>p21=%l5
srl %o1,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#11,12,>p22=int64#23
# asm 2: srl <y2=%o1,12,>p22=%l6
srl %o1,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#14,>z1=int64#14
# asm 2: xor <z1=%l0,<p03=%o4,>z1=%o4
xor %l0,%o4,%o4

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#8],>p13=int64#8
# asm 2: lduw [<table3=%i0+<p13=%g4],>p13=%g4
lduw [%i0+%g4],%g4

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#11,20,>p23=int64#11
# asm 2: srl <y2=%o1,20,>p23=%o1
srl %o1,20,%o1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#5,20,>p33=int64#23
# asm 2: srl <y3=%i4,20,>p33=%l6
srl %i4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#15,<p11=int64#21,>z0=int64#15
# asm 2: xor <z0=%o5,<p11=%l4,>z0=%o5
xor %o5,%l4,%o5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#5,4,>p31=int64#21
# asm 2: srl <y3=%i4,4,>p31=%l4
srl %i4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#11,4080,>p23=int64#11
# asm 2: and <p23=%o1,4080,>p23=%o1
and %o1,4080,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#14,<p10=int64#13,>z1=int64#13
# asm 2: xor <z1=%o4,<p10=%o3,>z1=%o3
xor %o4,%o3,%o3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#14
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o4
xor %l1,%l3,%o4

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#18
# asm 2: srl <y3=%i4,12,>p32=%l1
srl %i4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#8,>z2=int64#8
# asm 2: xor <z2=%l2,<p13=%g4,>z2=%g4
xor %l2,%g4,%g4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#11],>p23=int64#11
# asm 2: lduw [<table3=%i0+<p23=%o1],>p23=%o1
lduw [%i0+%o1],%o1

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#5,4,>p30=int64#5
# asm 2: sll <y3=%i4,4,>p30=%i4
sll %i4,4,%i4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#19],>p31=int64#19
# asm 2: lduw [<table1=%o0+<p31=%l2],>p31=%l2
lduw [%o0+%l2],%l2

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#20
# asm 2: and <p33=%l6,4080,>p33=%l3
and %l6,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#5,4080,>p30=int64#5
# asm 2: and <p30=%i4,4080,>p30=%i4
and %i4,4080,%i4

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#20],>p33=int64#20
# asm 2: lduw [<table3=%i0+<p33=%l3],>p33=%l3
lduw [%i0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#8,<p20=int64#16,>z2=int64#8
# asm 2: xor <z2=%g4,<p20=%o7,>z2=%g4
xor %g4,%o7,%g4

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#5],>p30=int64#5
# asm 2: lduw [<table0=%g5+<p30=%i4],>p30=%i4
lduw [%g5+%i4],%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#13,<p21=int64#17,>z1=int64#13
# asm 2: xor <z1=%o3,<p21=%l0,>z1=%o3
xor %o3,%l0,%o3

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#15,<p22=int64#22,>z0=int64#15
# asm 2: xor <z0=%o5,<p22=%l5,>z0=%o5
xor %o5,%l5,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#14,<p23=int64#11,>z3=int64#11
# asm 2: xor <z3=%o4,<p23=%o1,>z3=%o1
xor %o4,%o1,%o1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#8,<p31=int64#19,>y2=int64#8
# asm 2: xor <z2=%g4,<p31=%l2,>y2=%g4
xor %g4,%l2,%g4

# qhasm: inint = *(uint32 *) (inp + 20)
# asm 1: lduw [<inp=int64#3+20],>inint=int64#14
# asm 2: lduw [<inp=%i2+20],>inint=%o4
lduw [%i2+20],%o4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#15,<p33=int64#20,>y0=int64#15
# asm 2: xor <z0=%o5,<p33=%l3,>y0=%o5
xor %o5,%l3,%o5

# qhasm: tmp1 = y2 & evenmask
# asm 1: and <y2=int64#8,<evenmask=int64#6,>tmp1=int64#17
# asm 2: and <y2=%g4,<evenmask=%i5,>tmp1=%l0
and %g4,%i5,%l0

# qhasm: tmp0 = y0 & evenmask
# asm 1: and <y0=int64#15,<evenmask=int64#6,>tmp0=int64#18
# asm 2: and <y0=%o5,<evenmask=%i5,>tmp0=%l1
and %o5,%i5,%l1

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#14,<tmp1=int64#17,>inint=int64#14
# asm 2: xor <inint=%o4,<tmp1=%l0,>inint=%o4
xor %o4,%l0,%o4

# qhasm: (uint32) tmp0 >>= 8
# asm 1: srl <tmp0=int64#18,8,>tmp0=int64#17
# asm 2: srl <tmp0=%l1,8,>tmp0=%l0
srl %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#11,<p30=int64#5,>y3=int64#5
# asm 2: xor <z3=%o1,<p30=%i4,>y3=%i4
xor %o1,%i4,%i4

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#14,<tmp0=int64#17,>inint=int64#11
# asm 2: xor <inint=%o4,<tmp0=%l0,>inint=%o1
xor %o4,%l0,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#13,<p32=int64#16,>y1=int64#13
# asm 2: xor <z1=%o3,<p32=%o7,>y1=%o3
xor %o3,%o7,%o3

# qhasm: z0 = x28
# asm 1: ldx [%fp+2023-<x28=stack64#29],>z0=int64#14
# asm 2: ldx [%fp+2023-<x28=304],>z0=%o4
ldx [%fp+2023-304],%o4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#15,4,>p00=int64#16
# asm 2: sll <y0=%o5,4,>p00=%o7
sll %o5,4,%o7

# qhasm: z1 = x29
# asm 1: ldx [%fp+2023-<x29=stack64#30],>z1=int64#17
# asm 2: ldx [%fp+2023-<x29=312],>z1=%l0
ldx [%fp+2023-312],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#15,4,>p01=int64#18
# asm 2: srl <y0=%o5,4,>p01=%l1
srl %o5,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x30
# asm 1: ldx [%fp+2023-<x30=stack64#31],>z2=int64#19
# asm 2: ldx [%fp+2023-<x30=320],>z2=%l2
ldx [%fp+2023-320],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#15,12,>p02=int64#20
# asm 2: srl <y0=%o5,12,>p02=%l3
srl %o5,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x31
# asm 1: ldx [%fp+2023-<x31=stack64#32],>z3=int64#21
# asm 2: ldx [%fp+2023-<x31=328],>z3=%l4
ldx [%fp+2023-328],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#15,20,>p03=int64#15
# asm 2: srl <y0=%o5,20,>p03=%o5
srl %o5,20,%o5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 20) = inint
# asm 1: stw <inint=int64#11,[<outp=int64#4+20]
# asm 2: stw <inint=%o1,[<outp=%i3+20]
stw %o1,[%i3+20]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#13,4,>p10=int64#11
# asm 2: sll <y1=%o3,4,>p10=%o1
sll %o3,4,%o1

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#15,4080,>p03=int64#15
# asm 2: and <p03=%o5,4080,>p03=%o5
and %o5,4080,%o5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#13,4,>p11=int64#22
# asm 2: srl <y1=%o3,4,>p11=%l5
srl %o3,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#11,4080,>p10=int64#11
# asm 2: and <p10=%o1,4080,>p10=%o1
and %o1,4080,%o1

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#13,12,>p12=int64#23
# asm 2: srl <y1=%o3,12,>p12=%l6
srl %o3,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#13,20,>p13=int64#13
# asm 2: srl <y1=%o3,20,>p13=%o3
srl %o3,20,%o3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#15],>p03=int64#15
# asm 2: lduw [<table3=%i0+<p03=%o5],>p03=%o5
lduw [%i0+%o5],%o5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#13,4080,>p13=int64#13
# asm 2: and <p13=%o3,4080,>p13=%o3
and %o3,4080,%o3

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#14,<p00=int64#16,>z0=int64#14
# asm 2: xor <z0=%o4,<p00=%o7,>z0=%o4
xor %o4,%o7,%o4

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#11],>p10=int64#11
# asm 2: lduw [<table0=%g5+<p10=%o1],>p10=%o1
lduw [%g5+%o1],%o1

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#8,4,>p20=int64#16
# asm 2: sll <y2=%g4,4,>p20=%o7
sll %g4,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#8,4,>p21=int64#22
# asm 2: srl <y2=%g4,4,>p21=%l5
srl %g4,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#8,12,>p22=int64#23
# asm 2: srl <y2=%g4,12,>p22=%l6
srl %g4,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#15,>z1=int64#15
# asm 2: xor <z1=%l0,<p03=%o5,>z1=%o5
xor %l0,%o5,%o5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#13],>p13=int64#13
# asm 2: lduw [<table3=%i0+<p13=%o3],>p13=%o3
lduw [%i0+%o3],%o3

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#8,20,>p23=int64#8
# asm 2: srl <y2=%g4,20,>p23=%g4
srl %g4,20,%g4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#5,20,>p33=int64#23
# asm 2: srl <y3=%i4,20,>p33=%l6
srl %i4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#14,<p11=int64#21,>z0=int64#14
# asm 2: xor <z0=%o4,<p11=%l4,>z0=%o4
xor %o4,%l4,%o4

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#5,4,>p31=int64#21
# asm 2: srl <y3=%i4,4,>p31=%l4
srl %i4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#8,4080,>p23=int64#8
# asm 2: and <p23=%g4,4080,>p23=%g4
and %g4,4080,%g4

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#15,<p10=int64#11,>z1=int64#11
# asm 2: xor <z1=%o5,<p10=%o1,>z1=%o1
xor %o5,%o1,%o1

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#15
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o5
xor %l1,%l3,%o5

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#18
# asm 2: srl <y3=%i4,12,>p32=%l1
srl %i4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#13,>z2=int64#13
# asm 2: xor <z2=%l2,<p13=%o3,>z2=%o3
xor %l2,%o3,%o3

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#8],>p23=int64#8
# asm 2: lduw [<table3=%i0+<p23=%g4],>p23=%g4
lduw [%i0+%g4],%g4

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#5,4,>p30=int64#5
# asm 2: sll <y3=%i4,4,>p30=%i4
sll %i4,4,%i4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#19
# asm 2: and <p33=%l6,4080,>p33=%l2
and %l6,4080,%l2

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#19],>p33=int64#19
# asm 2: lduw [<table3=%i0+<p33=%l2],>p33=%l2
lduw [%i0+%l2],%l2

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#20
# asm 2: and <p31=%l4,4080,>p31=%l3
and %l4,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#5,4080,>p30=int64#5
# asm 2: and <p30=%i4,4080,>p30=%i4
and %i4,4080,%i4

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#20],>p31=int64#20
# asm 2: lduw [<table1=%o0+<p31=%l3],>p31=%l3
lduw [%o0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#13,<p20=int64#16,>z2=int64#13
# asm 2: xor <z2=%o3,<p20=%o7,>z2=%o3
xor %o3,%o7,%o3

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#5],>p30=int64#5
# asm 2: lduw [<table0=%g5+<p30=%i4],>p30=%i4
lduw [%g5+%i4],%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#11,<p21=int64#17,>z1=int64#11
# asm 2: xor <z1=%o1,<p21=%l0,>z1=%o1
xor %o1,%l0,%o1

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#14,<p22=int64#22,>z0=int64#14
# asm 2: xor <z0=%o4,<p22=%l5,>z0=%o4
xor %o4,%l5,%o4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#8,>z3=int64#8
# asm 2: xor <z3=%o5,<p23=%g4,>z3=%g4
xor %o5,%g4,%g4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#14,<p33=int64#19,>y0=int64#14
# asm 2: xor <z0=%o4,<p33=%l2,>y0=%o4
xor %o4,%l2,%o4

# qhasm: inint = *(uint32 *) (inp + 24)
# asm 1: lduw [<inp=int64#3+24],>inint=int64#15
# asm 2: lduw [<inp=%i2+24],>inint=%o5
lduw [%i2+24],%o5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#13,<p31=int64#20,>y2=int64#13
# asm 2: xor <z2=%o3,<p31=%l3,>y2=%o3
xor %o3,%l3,%o3

# qhasm: tmp0 = y0 & oddmask
# asm 1: and <y0=int64#14,<oddmask=int64#7,>tmp0=int64#17
# asm 2: and <y0=%o4,<oddmask=%g1,>tmp0=%l0
and %o4,%g1,%l0

# qhasm: tmp1 = y2 & oddmask
# asm 1: and <y2=int64#13,<oddmask=int64#7,>tmp1=int64#18
# asm 2: and <y2=%o3,<oddmask=%g1,>tmp1=%l1
and %o3,%g1,%l1

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#15,<tmp0=int64#17,>inint=int64#15
# asm 2: xor <inint=%o5,<tmp0=%l0,>inint=%o5
xor %o5,%l0,%o5

# qhasm: (uint32) tmp1 <<= 8
# asm 1: sll <tmp1=int64#18,8,>tmp1=int64#17
# asm 2: sll <tmp1=%l1,8,>tmp1=%l0
sll %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#8,<p30=int64#5,>y3=int64#5
# asm 2: xor <z3=%g4,<p30=%i4,>y3=%i4
xor %g4,%i4,%i4

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#15,<tmp1=int64#17,>inint=int64#8
# asm 2: xor <inint=%o5,<tmp1=%l0,>inint=%g4
xor %o5,%l0,%g4

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#11,<p32=int64#16,>y1=int64#11
# asm 2: xor <z1=%o1,<p32=%o7,>y1=%o1
xor %o1,%o7,%o1

# qhasm: z0 = x32
# asm 1: ldx [%fp+2023-<x32=stack64#33],>z0=int64#15
# asm 2: ldx [%fp+2023-<x32=336],>z0=%o5
ldx [%fp+2023-336],%o5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#14,4,>p00=int64#16
# asm 2: sll <y0=%o4,4,>p00=%o7
sll %o4,4,%o7

# qhasm: z1 = x33
# asm 1: ldx [%fp+2023-<x33=stack64#34],>z1=int64#17
# asm 2: ldx [%fp+2023-<x33=344],>z1=%l0
ldx [%fp+2023-344],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#14,4,>p01=int64#18
# asm 2: srl <y0=%o4,4,>p01=%l1
srl %o4,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x34
# asm 1: ldx [%fp+2023-<x34=stack64#35],>z2=int64#19
# asm 2: ldx [%fp+2023-<x34=352],>z2=%l2
ldx [%fp+2023-352],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#14,12,>p02=int64#20
# asm 2: srl <y0=%o4,12,>p02=%l3
srl %o4,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x35
# asm 1: ldx [%fp+2023-<x35=stack64#36],>z3=int64#21
# asm 2: ldx [%fp+2023-<x35=360],>z3=%l4
ldx [%fp+2023-360],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#14,20,>p03=int64#14
# asm 2: srl <y0=%o4,20,>p03=%o4
srl %o4,20,%o4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 24) = inint
# asm 1: stw <inint=int64#8,[<outp=int64#4+24]
# asm 2: stw <inint=%g4,[<outp=%i3+24]
stw %g4,[%i3+24]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#11,4,>p10=int64#8
# asm 2: sll <y1=%o1,4,>p10=%g4
sll %o1,4,%g4

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#14,4080,>p03=int64#14
# asm 2: and <p03=%o4,4080,>p03=%o4
and %o4,4080,%o4

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#11,4,>p11=int64#22
# asm 2: srl <y1=%o1,4,>p11=%l5
srl %o1,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#8,4080,>p10=int64#8
# asm 2: and <p10=%g4,4080,>p10=%g4
and %g4,4080,%g4

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#11,12,>p12=int64#23
# asm 2: srl <y1=%o1,12,>p12=%l6
srl %o1,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#11,20,>p13=int64#11
# asm 2: srl <y1=%o1,20,>p13=%o1
srl %o1,20,%o1

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#14],>p03=int64#14
# asm 2: lduw [<table3=%i0+<p03=%o4],>p03=%o4
lduw [%i0+%o4],%o4

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#11,4080,>p13=int64#11
# asm 2: and <p13=%o1,4080,>p13=%o1
and %o1,4080,%o1

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#16,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%o7,>z0=%o5
xor %o5,%o7,%o5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#8],>p10=int64#8
# asm 2: lduw [<table0=%g5+<p10=%g4],>p10=%g4
lduw [%g5+%g4],%g4

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#13,4,>p20=int64#16
# asm 2: sll <y2=%o3,4,>p20=%o7
sll %o3,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#13,4,>p21=int64#22
# asm 2: srl <y2=%o3,4,>p21=%l5
srl %o3,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#13,12,>p22=int64#23
# asm 2: srl <y2=%o3,12,>p22=%l6
srl %o3,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#14,>z1=int64#14
# asm 2: xor <z1=%l0,<p03=%o4,>z1=%o4
xor %l0,%o4,%o4

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#11],>p13=int64#11
# asm 2: lduw [<table3=%i0+<p13=%o1],>p13=%o1
lduw [%i0+%o1],%o1

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#13,20,>p23=int64#13
# asm 2: srl <y2=%o3,20,>p23=%o3
srl %o3,20,%o3

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#5,20,>p33=int64#23
# asm 2: srl <y3=%i4,20,>p33=%l6
srl %i4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#15,<p11=int64#21,>z0=int64#15
# asm 2: xor <z0=%o5,<p11=%l4,>z0=%o5
xor %o5,%l4,%o5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#5,4,>p31=int64#21
# asm 2: srl <y3=%i4,4,>p31=%l4
srl %i4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#13,4080,>p23=int64#13
# asm 2: and <p23=%o3,4080,>p23=%o3
and %o3,4080,%o3

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#14,<p10=int64#8,>z1=int64#8
# asm 2: xor <z1=%o4,<p10=%g4,>z1=%g4
xor %o4,%g4,%g4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#14
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o4
xor %l1,%l3,%o4

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#18
# asm 2: srl <y3=%i4,12,>p32=%l1
srl %i4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#11,>z2=int64#11
# asm 2: xor <z2=%l2,<p13=%o1,>z2=%o1
xor %l2,%o1,%o1

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#13],>p23=int64#13
# asm 2: lduw [<table3=%i0+<p23=%o3],>p23=%o3
lduw [%i0+%o3],%o3

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#5,4,>p30=int64#5
# asm 2: sll <y3=%i4,4,>p30=%i4
sll %i4,4,%i4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#19],>p31=int64#19
# asm 2: lduw [<table1=%o0+<p31=%l2],>p31=%l2
lduw [%o0+%l2],%l2

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#20
# asm 2: and <p33=%l6,4080,>p33=%l3
and %l6,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#5,4080,>p30=int64#5
# asm 2: and <p30=%i4,4080,>p30=%i4
and %i4,4080,%i4

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#20],>p33=int64#20
# asm 2: lduw [<table3=%i0+<p33=%l3],>p33=%l3
lduw [%i0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#11,<p20=int64#16,>z2=int64#11
# asm 2: xor <z2=%o1,<p20=%o7,>z2=%o1
xor %o1,%o7,%o1

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#5],>p30=int64#5
# asm 2: lduw [<table0=%g5+<p30=%i4],>p30=%i4
lduw [%g5+%i4],%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#8,<p21=int64#17,>z1=int64#8
# asm 2: xor <z1=%g4,<p21=%l0,>z1=%g4
xor %g4,%l0,%g4

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#15,<p22=int64#22,>z0=int64#15
# asm 2: xor <z0=%o5,<p22=%l5,>z0=%o5
xor %o5,%l5,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#14,<p23=int64#13,>z3=int64#13
# asm 2: xor <z3=%o4,<p23=%o3,>z3=%o3
xor %o4,%o3,%o3

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#11,<p31=int64#19,>y2=int64#11
# asm 2: xor <z2=%o1,<p31=%l2,>y2=%o1
xor %o1,%l2,%o1

# qhasm: inint = *(uint32 *) (inp + 28)
# asm 1: lduw [<inp=int64#3+28],>inint=int64#14
# asm 2: lduw [<inp=%i2+28],>inint=%o4
lduw [%i2+28],%o4

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#15,<p33=int64#20,>y0=int64#15
# asm 2: xor <z0=%o5,<p33=%l3,>y0=%o5
xor %o5,%l3,%o5

# qhasm: tmp1 = y2 & evenmask
# asm 1: and <y2=int64#11,<evenmask=int64#6,>tmp1=int64#17
# asm 2: and <y2=%o1,<evenmask=%i5,>tmp1=%l0
and %o1,%i5,%l0

# qhasm: tmp0 = y0 & evenmask
# asm 1: and <y0=int64#15,<evenmask=int64#6,>tmp0=int64#18
# asm 2: and <y0=%o5,<evenmask=%i5,>tmp0=%l1
and %o5,%i5,%l1

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#14,<tmp1=int64#17,>inint=int64#14
# asm 2: xor <inint=%o4,<tmp1=%l0,>inint=%o4
xor %o4,%l0,%o4

# qhasm: (uint32) tmp0 >>= 8
# asm 1: srl <tmp0=int64#18,8,>tmp0=int64#17
# asm 2: srl <tmp0=%l1,8,>tmp0=%l0
srl %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#13,<p30=int64#5,>y3=int64#5
# asm 2: xor <z3=%o3,<p30=%i4,>y3=%i4
xor %o3,%i4,%i4

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#14,<tmp0=int64#17,>inint=int64#13
# asm 2: xor <inint=%o4,<tmp0=%l0,>inint=%o3
xor %o4,%l0,%o3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#8,<p32=int64#16,>y1=int64#8
# asm 2: xor <z1=%g4,<p32=%o7,>y1=%g4
xor %g4,%o7,%g4

# qhasm: z0 = x36
# asm 1: ldx [%fp+2023-<x36=stack64#37],>z0=int64#14
# asm 2: ldx [%fp+2023-<x36=368],>z0=%o4
ldx [%fp+2023-368],%o4

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#15,4,>p00=int64#16
# asm 2: sll <y0=%o5,4,>p00=%o7
sll %o5,4,%o7

# qhasm: z1 = x37
# asm 1: ldx [%fp+2023-<x37=stack64#38],>z1=int64#17
# asm 2: ldx [%fp+2023-<x37=376],>z1=%l0
ldx [%fp+2023-376],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#15,4,>p01=int64#18
# asm 2: srl <y0=%o5,4,>p01=%l1
srl %o5,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x38
# asm 1: ldx [%fp+2023-<x38=stack64#39],>z2=int64#19
# asm 2: ldx [%fp+2023-<x38=384],>z2=%l2
ldx [%fp+2023-384],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#15,12,>p02=int64#20
# asm 2: srl <y0=%o5,12,>p02=%l3
srl %o5,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x39
# asm 1: ldx [%fp+2023-<x39=stack64#40],>z3=int64#21
# asm 2: ldx [%fp+2023-<x39=392],>z3=%l4
ldx [%fp+2023-392],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#15,20,>p03=int64#15
# asm 2: srl <y0=%o5,20,>p03=%o5
srl %o5,20,%o5

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 28) = inint
# asm 1: stw <inint=int64#13,[<outp=int64#4+28]
# asm 2: stw <inint=%o3,[<outp=%i3+28]
stw %o3,[%i3+28]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#8,4,>p10=int64#13
# asm 2: sll <y1=%g4,4,>p10=%o3
sll %g4,4,%o3

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#15,4080,>p03=int64#15
# asm 2: and <p03=%o5,4080,>p03=%o5
and %o5,4080,%o5

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#8,4,>p11=int64#22
# asm 2: srl <y1=%g4,4,>p11=%l5
srl %g4,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#13,4080,>p10=int64#13
# asm 2: and <p10=%o3,4080,>p10=%o3
and %o3,4080,%o3

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#8,12,>p12=int64#23
# asm 2: srl <y1=%g4,12,>p12=%l6
srl %g4,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#8,20,>p13=int64#8
# asm 2: srl <y1=%g4,20,>p13=%g4
srl %g4,20,%g4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#15],>p03=int64#15
# asm 2: lduw [<table3=%i0+<p03=%o5],>p03=%o5
lduw [%i0+%o5],%o5

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#8,4080,>p13=int64#8
# asm 2: and <p13=%g4,4080,>p13=%g4
and %g4,4080,%g4

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#14,<p00=int64#16,>z0=int64#14
# asm 2: xor <z0=%o4,<p00=%o7,>z0=%o4
xor %o4,%o7,%o4

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#13],>p10=int64#13
# asm 2: lduw [<table0=%g5+<p10=%o3],>p10=%o3
lduw [%g5+%o3],%o3

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#11,4,>p20=int64#16
# asm 2: sll <y2=%o1,4,>p20=%o7
sll %o1,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#11,4,>p21=int64#22
# asm 2: srl <y2=%o1,4,>p21=%l5
srl %o1,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#11,12,>p22=int64#23
# asm 2: srl <y2=%o1,12,>p22=%l6
srl %o1,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#15,>z1=int64#15
# asm 2: xor <z1=%l0,<p03=%o5,>z1=%o5
xor %l0,%o5,%o5

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#8],>p13=int64#8
# asm 2: lduw [<table3=%i0+<p13=%g4],>p13=%g4
lduw [%i0+%g4],%g4

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#11,20,>p23=int64#11
# asm 2: srl <y2=%o1,20,>p23=%o1
srl %o1,20,%o1

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#5,20,>p33=int64#23
# asm 2: srl <y3=%i4,20,>p33=%l6
srl %i4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#14,<p11=int64#21,>z0=int64#14
# asm 2: xor <z0=%o4,<p11=%l4,>z0=%o4
xor %o4,%l4,%o4

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#5,4,>p31=int64#21
# asm 2: srl <y3=%i4,4,>p31=%l4
srl %i4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#11,4080,>p23=int64#11
# asm 2: and <p23=%o1,4080,>p23=%o1
and %o1,4080,%o1

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#15,<p10=int64#13,>z1=int64#13
# asm 2: xor <z1=%o5,<p10=%o3,>z1=%o3
xor %o5,%o3,%o3

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#15
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o5
xor %l1,%l3,%o5

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#18
# asm 2: srl <y3=%i4,12,>p32=%l1
srl %i4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#8,>z2=int64#8
# asm 2: xor <z2=%l2,<p13=%g4,>z2=%g4
xor %l2,%g4,%g4

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#11],>p23=int64#11
# asm 2: lduw [<table3=%i0+<p23=%o1],>p23=%o1
lduw [%i0+%o1],%o1

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#5,4,>p30=int64#5
# asm 2: sll <y3=%i4,4,>p30=%i4
sll %i4,4,%i4

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#19
# asm 2: and <p33=%l6,4080,>p33=%l2
and %l6,4080,%l2

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#19],>p33=int64#19
# asm 2: lduw [<table3=%i0+<p33=%l2],>p33=%l2
lduw [%i0+%l2],%l2

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#20
# asm 2: and <p31=%l4,4080,>p31=%l3
and %l4,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#5,4080,>p30=int64#5
# asm 2: and <p30=%i4,4080,>p30=%i4
and %i4,4080,%i4

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#20],>p31=int64#20
# asm 2: lduw [<table1=%o0+<p31=%l3],>p31=%l3
lduw [%o0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#8,<p20=int64#16,>z2=int64#8
# asm 2: xor <z2=%g4,<p20=%o7,>z2=%g4
xor %g4,%o7,%g4

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#5],>p30=int64#5
# asm 2: lduw [<table0=%g5+<p30=%i4],>p30=%i4
lduw [%g5+%i4],%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#13,<p21=int64#17,>z1=int64#13
# asm 2: xor <z1=%o3,<p21=%l0,>z1=%o3
xor %o3,%l0,%o3

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#14,<p22=int64#22,>z0=int64#14
# asm 2: xor <z0=%o4,<p22=%l5,>z0=%o4
xor %o4,%l5,%o4

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#15,<p23=int64#11,>z3=int64#11
# asm 2: xor <z3=%o5,<p23=%o1,>z3=%o1
xor %o5,%o1,%o1

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#14,<p33=int64#19,>y0=int64#14
# asm 2: xor <z0=%o4,<p33=%l2,>y0=%o4
xor %o4,%l2,%o4

# qhasm: inint = *(uint32 *) (inp + 32)
# asm 1: lduw [<inp=int64#3+32],>inint=int64#15
# asm 2: lduw [<inp=%i2+32],>inint=%o5
lduw [%i2+32],%o5

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#8,<p31=int64#20,>y2=int64#8
# asm 2: xor <z2=%g4,<p31=%l3,>y2=%g4
xor %g4,%l3,%g4

# qhasm: tmp0 = y0 & oddmask
# asm 1: and <y0=int64#14,<oddmask=int64#7,>tmp0=int64#17
# asm 2: and <y0=%o4,<oddmask=%g1,>tmp0=%l0
and %o4,%g1,%l0

# qhasm: tmp1 = y2 & oddmask
# asm 1: and <y2=int64#8,<oddmask=int64#7,>tmp1=int64#18
# asm 2: and <y2=%g4,<oddmask=%g1,>tmp1=%l1
and %g4,%g1,%l1

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#15,<tmp0=int64#17,>inint=int64#15
# asm 2: xor <inint=%o5,<tmp0=%l0,>inint=%o5
xor %o5,%l0,%o5

# qhasm: (uint32) tmp1 <<= 8
# asm 1: sll <tmp1=int64#18,8,>tmp1=int64#17
# asm 2: sll <tmp1=%l1,8,>tmp1=%l0
sll %l1,8,%l0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#11,<p30=int64#5,>y3=int64#5
# asm 2: xor <z3=%o1,<p30=%i4,>y3=%i4
xor %o1,%i4,%i4

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#15,<tmp1=int64#17,>inint=int64#11
# asm 2: xor <inint=%o5,<tmp1=%l0,>inint=%o1
xor %o5,%l0,%o1

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#13,<p32=int64#16,>y1=int64#13
# asm 2: xor <z1=%o3,<p32=%o7,>y1=%o3
xor %o3,%o7,%o3

# qhasm: z0 = x40
# asm 1: ldx [%fp+2023-<x40=stack64#41],>z0=int64#15
# asm 2: ldx [%fp+2023-<x40=400],>z0=%o5
ldx [%fp+2023-400],%o5

# qhasm: p00 = (uint32) y0 << 4
# asm 1: sll <y0=int64#14,4,>p00=int64#16
# asm 2: sll <y0=%o4,4,>p00=%o7
sll %o4,4,%o7

# qhasm: z1 = x41
# asm 1: ldx [%fp+2023-<x41=stack64#42],>z1=int64#17
# asm 2: ldx [%fp+2023-<x41=408],>z1=%l0
ldx [%fp+2023-408],%l0

# qhasm: p01 = (uint32) y0 >> 4 
# asm 1: srl <y0=int64#14,4,>p01=int64#18
# asm 2: srl <y0=%o4,4,>p01=%l1
srl %o4,4,%l1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#16,4080,>p00=int64#16
# asm 2: and <p00=%o7,4080,>p00=%o7
and %o7,4080,%o7

# qhasm: z2 = x42
# asm 1: ldx [%fp+2023-<x42=stack64#43],>z2=int64#19
# asm 2: ldx [%fp+2023-<x42=416],>z2=%l2
ldx [%fp+2023-416],%l2

# qhasm: p02 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#14,12,>p02=int64#20
# asm 2: srl <y0=%o4,12,>p02=%l3
srl %o4,12,%l3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: z3 = x43
# asm 1: ldx [%fp+2023-<x43=stack64#44],>z3=int64#21
# asm 2: ldx [%fp+2023-<x43=424],>z3=%l4
ldx [%fp+2023-424],%l4

# qhasm: p03 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#14,20,>p03=int64#14
# asm 2: srl <y0=%o4,20,>p03=%o4
srl %o4,20,%o4

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#20,4080,>p02=int64#20
# asm 2: and <p02=%l3,4080,>p02=%l3
and %l3,4080,%l3

# qhasm: *(uint32 *) (outp + 32) = inint
# asm 1: stw <inint=int64#11,[<outp=int64#4+32]
# asm 2: stw <inint=%o1,[<outp=%i3+32]
stw %o1,[%i3+32]

# qhasm: p10 = (uint32) y1 << 4
# asm 1: sll <y1=int64#13,4,>p10=int64#11
# asm 2: sll <y1=%o3,4,>p10=%o1
sll %o3,4,%o1

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#14,4080,>p03=int64#14
# asm 2: and <p03=%o4,4080,>p03=%o4
and %o4,4080,%o4

# qhasm: p00 = *(uint32 *) (table0 + p00)
# asm 1: lduw [<table0=int64#9+<p00=int64#16],>p00=int64#16
# asm 2: lduw [<table0=%g5+<p00=%o7],>p00=%o7
lduw [%g5+%o7],%o7

# qhasm: p11 = (uint32) y1 >> 4
# asm 1: srl <y1=int64#13,4,>p11=int64#22
# asm 2: srl <y1=%o3,4,>p11=%l5
srl %o3,4,%l5

# qhasm: p10 &= 4080
# asm 1: and <p10=int64#11,4080,>p10=int64#11
# asm 2: and <p10=%o1,4080,>p10=%o1
and %o1,4080,%o1

# qhasm: p01 = *(uint32 *) (table1 + p01)
# asm 1: lduw [<table1=int64#10+<p01=int64#18],>p01=int64#18
# asm 2: lduw [<table1=%o0+<p01=%l1],>p01=%l1
lduw [%o0+%l1],%l1

# qhasm: p12 = (uint32) y1 >> 12
# asm 1: srl <y1=int64#13,12,>p12=int64#23
# asm 2: srl <y1=%o3,12,>p12=%l6
srl %o3,12,%l6

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#22
# asm 2: and <p11=%l5,4080,>p11=%l5
and %l5,4080,%l5

# qhasm: p02 = *(uint32 *) (table2 + p02)
# asm 1: lduw [<table2=int64#12+<p02=int64#20],>p02=int64#20
# asm 2: lduw [<table2=%o2+<p02=%l3],>p02=%l3
lduw [%o2+%l3],%l3

# qhasm: p13 = (uint32) y1 >> 20
# asm 1: srl <y1=int64#13,20,>p13=int64#13
# asm 2: srl <y1=%o3,20,>p13=%o3
srl %o3,20,%o3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#23,4080,>p12=int64#23
# asm 2: and <p12=%l6,4080,>p12=%l6
and %l6,4080,%l6

# qhasm: p03 = *(uint32 *) (table3 + p03)
# asm 1: lduw [<table3=int64#1+<p03=int64#14],>p03=int64#14
# asm 2: lduw [<table3=%i0+<p03=%o4],>p03=%o4
lduw [%i0+%o4],%o4

# qhasm: p13 &= 4080
# asm 1: and <p13=int64#13,4080,>p13=int64#13
# asm 2: and <p13=%o3,4080,>p13=%o3
and %o3,4080,%o3

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#16,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%o7,>z0=%o5
xor %o5,%o7,%o5

# qhasm: p10 = *(uint32 *) (table0 + p10)
# asm 1: lduw [<table0=int64#9+<p10=int64#11],>p10=int64#11
# asm 2: lduw [<table0=%g5+<p10=%o1],>p10=%o1
lduw [%g5+%o1],%o1

# qhasm: p20 = (uint32) y2 << 4
# asm 1: sll <y2=int64#8,4,>p20=int64#16
# asm 2: sll <y2=%g4,4,>p20=%o7
sll %g4,4,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#21,<p01=int64#18,>z3=int64#18
# asm 2: xor <z3=%l4,<p01=%l1,>z3=%l1
xor %l4,%l1,%l1

# qhasm: p11 = *(uint32 *) (table1 + p11)
# asm 1: lduw [<table1=int64#10+<p11=int64#22],>p11=int64#21
# asm 2: lduw [<table1=%o0+<p11=%l5],>p11=%l4
lduw [%o0+%l5],%l4

# qhasm: p21 = (uint32) y2 >> 4
# asm 1: srl <y2=int64#8,4,>p21=int64#22
# asm 2: srl <y2=%g4,4,>p21=%l5
srl %g4,4,%l5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#19,<p02=int64#20,>z2=int64#19
# asm 2: xor <z2=%l2,<p02=%l3,>z2=%l2
xor %l2,%l3,%l2

# qhasm: p12 = *(uint32 *) (table2 + p12)
# asm 1: lduw [<table2=int64#12+<p12=int64#23],>p12=int64#20
# asm 2: lduw [<table2=%o2+<p12=%l6],>p12=%l3
lduw [%o2+%l6],%l3

# qhasm: p22 = (uint32) y2 >> 12
# asm 1: srl <y2=int64#8,12,>p22=int64#23
# asm 2: srl <y2=%g4,12,>p22=%l6
srl %g4,12,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#17,<p03=int64#14,>z1=int64#14
# asm 2: xor <z1=%l0,<p03=%o4,>z1=%o4
xor %l0,%o4,%o4

# qhasm: p13 = *(uint32 *) (table3 + p13)
# asm 1: lduw [<table3=int64#1+<p13=int64#13],>p13=int64#13
# asm 2: lduw [<table3=%i0+<p13=%o3],>p13=%o3
lduw [%i0+%o3],%o3

# qhasm: p23 = (uint32) y2 >> 20
# asm 1: srl <y2=int64#8,20,>p23=int64#8
# asm 2: srl <y2=%g4,20,>p23=%g4
srl %g4,20,%g4

# qhasm: p20 &= 4080
# asm 1: and <p20=int64#16,4080,>p20=int64#16
# asm 2: and <p20=%o7,4080,>p20=%o7
and %o7,4080,%o7

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#22,4080,>p21=int64#17
# asm 2: and <p21=%l5,4080,>p21=%l0
and %l5,4080,%l0

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#23,4080,>p22=int64#22
# asm 2: and <p22=%l6,4080,>p22=%l5
and %l6,4080,%l5

# qhasm: p20 = *(uint32 *) (table0 + p20)
# asm 1: lduw [<table0=int64#9+<p20=int64#16],>p20=int64#16
# asm 2: lduw [<table0=%g5+<p20=%o7],>p20=%o7
lduw [%g5+%o7],%o7

# qhasm: p33 = (uint32) y3 >> 20
# asm 1: srl <y3=int64#5,20,>p33=int64#23
# asm 2: srl <y3=%i4,20,>p33=%l6
srl %i4,20,%l6

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#15,<p11=int64#21,>z0=int64#15
# asm 2: xor <z0=%o5,<p11=%l4,>z0=%o5
xor %o5,%l4,%o5

# qhasm: p21 = *(uint32 *) (table1 + p21)
# asm 1: lduw [<table1=int64#10+<p21=int64#17],>p21=int64#17
# asm 2: lduw [<table1=%o0+<p21=%l0],>p21=%l0
lduw [%o0+%l0],%l0

# qhasm: p31 = (uint32) y3 >> 4 
# asm 1: srl <y3=int64#5,4,>p31=int64#21
# asm 2: srl <y3=%i4,4,>p31=%l4
srl %i4,4,%l4

# qhasm: p23 &= 4080
# asm 1: and <p23=int64#8,4080,>p23=int64#8
# asm 2: and <p23=%g4,4080,>p23=%g4
and %g4,4080,%g4

# qhasm: p22 = *(uint32 *) (table2 + p22)
# asm 1: lduw [<table2=int64#12+<p22=int64#22],>p22=int64#22
# asm 2: lduw [<table2=%o2+<p22=%l5],>p22=%l5
lduw [%o2+%l5],%l5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#14,<p10=int64#11,>z1=int64#11
# asm 2: xor <z1=%o4,<p10=%o1,>z1=%o1
xor %o4,%o1,%o1

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#18,<p12=int64#20,>z3=int64#14
# asm 2: xor <z3=%l1,<p12=%l3,>z3=%o4
xor %l1,%l3,%o4

# qhasm: p32 = (uint32) y3 >> 12
# asm 1: srl <y3=int64#5,12,>p32=int64#18
# asm 2: srl <y3=%i4,12,>p32=%l1
srl %i4,12,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#13,>z2=int64#13
# asm 2: xor <z2=%l2,<p13=%o3,>z2=%o3
xor %l2,%o3,%o3

# qhasm: p23 = *(uint32 *) (table3 + p23)
# asm 1: lduw [<table3=int64#1+<p23=int64#8],>p23=int64#8
# asm 2: lduw [<table3=%i0+<p23=%g4],>p23=%g4
lduw [%i0+%g4],%g4

# qhasm: p30 = (uint32) y3 << 4
# asm 1: sll <y3=int64#5,4,>p30=int64#5
# asm 2: sll <y3=%i4,4,>p30=%i4
sll %i4,4,%i4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p31 = *(uint32 *) (table1 + p31)
# asm 1: lduw [<table1=int64#10+<p31=int64#19],>p31=int64#19
# asm 2: lduw [<table1=%o0+<p31=%l2],>p31=%l2
lduw [%o0+%l2],%l2

# qhasm: p33 &= 4080
# asm 1: and <p33=int64#23,4080,>p33=int64#20
# asm 2: and <p33=%l6,4080,>p33=%l3
and %l6,4080,%l3

# qhasm: p30 &= 4080
# asm 1: and <p30=int64#5,4080,>p30=int64#5
# asm 2: and <p30=%i4,4080,>p30=%i4
and %i4,4080,%i4

# qhasm: p33 = *(uint32 *) (table3 + p33)
# asm 1: lduw [<table3=int64#1+<p33=int64#20],>p33=int64#20
# asm 2: lduw [<table3=%i0+<p33=%l3],>p33=%l3
lduw [%i0+%l3],%l3

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#18,4080,>p32=int64#18
# asm 2: and <p32=%l1,4080,>p32=%l1
and %l1,4080,%l1

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#13,<p20=int64#16,>z2=int64#13
# asm 2: xor <z2=%o3,<p20=%o7,>z2=%o3
xor %o3,%o7,%o3

# qhasm: p30 = *(uint32 *) (table0 + p30)
# asm 1: lduw [<table0=int64#9+<p30=int64#5],>p30=int64#5
# asm 2: lduw [<table0=%g5+<p30=%i4],>p30=%i4
lduw [%g5+%i4],%i4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#11,<p21=int64#17,>z1=int64#11
# asm 2: xor <z1=%o1,<p21=%l0,>z1=%o1
xor %o1,%l0,%o1

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#15,<p22=int64#22,>z0=int64#15
# asm 2: xor <z0=%o5,<p22=%l5,>z0=%o5
xor %o5,%l5,%o5

# qhasm: p32 = *(uint32 *) (table2 + p32)
# asm 1: lduw [<table2=int64#12+<p32=int64#18],>p32=int64#16
# asm 2: lduw [<table2=%o2+<p32=%l1],>p32=%o7
lduw [%o2+%l1],%o7

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#14,<p23=int64#8,>z3=int64#14
# asm 2: xor <z3=%o4,<p23=%g4,>z3=%o4
xor %o4,%g4,%o4

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#13,<p31=int64#19,>y2=int64#13
# asm 2: xor <z2=%o3,<p31=%l2,>y2=%o3
xor %o3,%l2,%o3

# qhasm: inint = *(uint32 *) (inp + 36)
# asm 1: lduw [<inp=int64#3+36],>inint=int64#17
# asm 2: lduw [<inp=%i2+36],>inint=%l0
lduw [%i2+36],%l0

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#15,<p33=int64#20,>y0=int64#8
# asm 2: xor <z0=%o5,<p33=%l3,>y0=%g4
xor %o5,%l3,%g4

# qhasm: tmp1 = y2 & evenmask
# asm 1: and <y2=int64#13,<evenmask=int64#6,>tmp1=int64#15
# asm 2: and <y2=%o3,<evenmask=%i5,>tmp1=%o5
and %o3,%i5,%o5

# qhasm: tmp0 = y0 & evenmask
# asm 1: and <y0=int64#8,<evenmask=int64#6,>tmp0=int64#18
# asm 2: and <y0=%g4,<evenmask=%i5,>tmp0=%l1
and %g4,%i5,%l1

# qhasm: inint ^= tmp1
# asm 1: xor <inint=int64#17,<tmp1=int64#15,>inint=int64#15
# asm 2: xor <inint=%l0,<tmp1=%o5,>inint=%o5
xor %l0,%o5,%o5

# qhasm: length = length_stack
# asm 1: ldx [%fp+2023-<length_stack=stack64#4],>length=int64#17
# asm 2: ldx [%fp+2023-<length_stack=104],>length=%l0
ldx [%fp+2023-104],%l0

# qhasm: (uint32) tmp0 >>= 8
# asm 1: srl <tmp0=int64#18,8,>tmp0=int64#18
# asm 2: srl <tmp0=%l1,8,>tmp0=%l1
srl %l1,8,%l1

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#14,<p30=int64#5,>y3=int64#14
# asm 2: xor <z3=%o4,<p30=%i4,>y3=%o4
xor %o4,%i4,%o4

# qhasm: inint ^= tmp0
# asm 1: xor <inint=int64#15,<tmp0=int64#18,>inint=int64#5
# asm 2: xor <inint=%o5,<tmp0=%l1,>inint=%i4
xor %o5,%l1,%i4

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#11,<p32=int64#16,>y1=int64#11
# asm 2: xor <z1=%o1,<p32=%o7,>y1=%o1
xor %o1,%o7,%o1

# qhasm: *(uint32 *) (outp + 36) = inint
# asm 1: stw <inint=int64#5,[<outp=int64#4+36]
# asm 2: stw <inint=%i4,[<outp=%i3+36]
stw %i4,[%i3+36]

# qhasm: inp += 40
# asm 1: add <inp=int64#3,40,>inp=int64#3
# asm 2: add <inp=%i2,40,>inp=%i2
add %i2,40,%i2

# qhasm: length -= 40
# asm 1: sub <length=int64#17,40,>length=int64#5
# asm 2: sub <length=%l0,40,>length=%i4
sub %l0,40,%i4

# qhasm: signed<? length - 40
# asm 1: subcc <length=int64#5,40,%g0
# asm 2: subcc <length=%i4,40,%g0
subcc %i4,40,%g0

# qhasm: outp += 40
# asm 1: add <outp=int64#4,40,>outp=int64#4
# asm 2: add <outp=%i3,40,>outp=%i3
add %i3,40,%i3

# qhasm: goto mainloop if !signed<
bge,pt %xcc,._mainloop
nop

# qhasm: lessthan40bytesleft:
._lessthan40bytesleft:

# qhasm: signed<? =? length - 0
# asm 1: subcc <length=int64#5,0,%g0
# asm 2: subcc <length=%i4,0,%g0
subcc %i4,0,%g0

# qhasm: goto end if =
be,pt %xcc,._end
nop

# qhasm: goto copy if signed<
bl,pt %xcc,._copy
nop

# qhasm: inp_stack = inp
# asm 1: stx <inp=int64#3,[%fp+2023->inp_stack=stack64#1]
# asm 2: stx <inp=%i2,[%fp+2023->inp_stack=80]
stx %i2,[%fp+2023-80]

# qhasm: length_save_stack = length
# asm 1: stx <length=int64#5,[%fp+2023->length_save_stack=stack64#2]
# asm 2: stx <length=%i4,[%fp+2023->length_save_stack=88]
stx %i4,[%fp+2023-88]

# qhasm: outp_stack = outp
# asm 1: stx <outp=int64#4,[%fp+2023->outp_stack=stack64#3]
# asm 2: stx <outp=%i3,[%fp+2023->outp_stack=96]
stx %i3,[%fp+2023-96]

# qhasm: tmp0 = 0
# asm 1: add %g0,0,>tmp0=int64#4
# asm 2: add %g0,0,>tmp0=%i3
add %g0,0,%i3

# qhasm: inp = &tmp
# asm 1: add %fp,1991->tmp=stack320#1,>inp=int64#3
# asm 2: add %fp,1991->tmp=0,>inp=%i2
add %fp,1991-0,%i2

# qhasm: *(uint64 *) (inp + 0) = tmp0
# asm 1: stx <tmp0=int64#4,[<inp=int64#3+0]
# asm 2: stx <tmp0=%i3,[<inp=%i2+0]
stx %i3,[%i2+0]

# qhasm: *(uint64 *) (inp + 8) = tmp0
# asm 1: stx <tmp0=int64#4,[<inp=int64#3+8]
# asm 2: stx <tmp0=%i3,[<inp=%i2+8]
stx %i3,[%i2+8]

# qhasm: *(uint64 *) (inp + 16) = tmp0
# asm 1: stx <tmp0=int64#4,[<inp=int64#3+16]
# asm 2: stx <tmp0=%i3,[<inp=%i2+16]
stx %i3,[%i2+16]

# qhasm: *(uint64 *) (inp + 24) = tmp0
# asm 1: stx <tmp0=int64#4,[<inp=int64#3+24]
# asm 2: stx <tmp0=%i3,[<inp=%i2+24]
stx %i3,[%i2+24]

# qhasm: *(uint64 *) (inp + 32) = tmp0
# asm 1: stx <tmp0=int64#4,[<inp=int64#3+32]
# asm 2: stx <tmp0=%i3,[<inp=%i2+32]
stx %i3,[%i2+32]

# qhasm: outp = inp
# asm 1: add %g0,<inp=int64#3,>outp=int64#4
# asm 2: add %g0,<inp=%i2,>outp=%i3
add %g0,%i2,%i3

# qhasm: goto mainloop
b ._mainloop
nop

# qhasm: copy:
._copy:

# qhasm: length = length_save_stack
# asm 1: ldx [%fp+2023-<length_save_stack=stack64#2],>length=int64#1
# asm 2: ldx [%fp+2023-<length_save_stack=88],>length=%i0
ldx [%fp+2023-88],%i0

# qhasm: tmpp = &tmp
# asm 1: add %fp,1991->tmp=stack320#1,>tmpp=int64#3
# asm 2: add %fp,1991->tmp=0,>tmpp=%i2
add %fp,1991-0,%i2

# qhasm: inp = inp_stack
# asm 1: ldx [%fp+2023-<inp_stack=stack64#1],>inp=int64#4
# asm 2: ldx [%fp+2023-<inp_stack=80],>inp=%i3
ldx [%fp+2023-80],%i3

# qhasm: outp = outp_stack
# asm 1: ldx [%fp+2023-<outp_stack=stack64#3],>outp=int64#5
# asm 2: ldx [%fp+2023-<outp_stack=96],>outp=%i4
ldx [%fp+2023-96],%i4

# qhasm: copyloop:
._copyloop:

# qhasm: unsigned<? length - 1
# asm 1: subcc <length=int64#1,1,%g0
# asm 2: subcc <length=%i0,1,%g0
subcc %i0,1,%g0

# qhasm: goto end if unsigned<
blu,pt %xcc,._end
nop

# qhasm: dd = *(uint8 *) (tmpp + 0)
# asm 1: ldub [<tmpp=int64#3+0],>dd=int64#6
# asm 2: ldub [<tmpp=%i2+0],>dd=%i5
ldub [%i2+0],%i5

# qhasm: in0 = *(uint8 *) (inp + 0)
# asm 1: ldub [<inp=int64#4+0],>in0=int64#7
# asm 2: ldub [<inp=%i3+0],>in0=%g1
ldub [%i3+0],%g1

# qhasm: dd ^= in0
# asm 1: xor <dd=int64#6,<in0=int64#7,>dd=int64#6
# asm 2: xor <dd=%i5,<in0=%g1,>dd=%i5
xor %i5,%g1,%i5

# qhasm: *(uint8 *) (outp + 0) = dd
# asm 1: stb <dd=int64#6,[<outp=int64#5+0]
# asm 2: stb <dd=%i5,[<outp=%i4+0]
stb %i5,[%i4+0]

# qhasm: outp += 1
# asm 1: add <outp=int64#5,1,>outp=int64#5
# asm 2: add <outp=%i4,1,>outp=%i4
add %i4,1,%i4

# qhasm: inp +=  1
# asm 1: add <inp=int64#4,1,>inp=int64#4
# asm 2: add <inp=%i3,1,>inp=%i3
add %i3,1,%i3

# qhasm: tmpp += 1
# asm 1: add <tmpp=int64#3,1,>tmpp=int64#3
# asm 2: add <tmpp=%i2,1,>tmpp=%i2
add %i2,1,%i2

# qhasm: length -= 1
# asm 1: sub <length=int64#1,1,>length=int64#1
# asm 2: sub <length=%i0,1,>length=%i0
sub %i0,1,%i0

# qhasm: goto copyloop
b ._copyloop
nop

# qhasm: end:
._end:

# qhasm: *(uint32 *) (ctxp + 56) = y0
# asm 1: stw <y0=int64#8,[<ctxp=int64#2+56]
# asm 2: stw <y0=%g4,[<ctxp=%i1+56]
stw %g4,[%i1+56]

# qhasm: *(uint32 *) (ctxp + 60) = y1
# asm 1: stw <y1=int64#11,[<ctxp=int64#2+60]
# asm 2: stw <y1=%o1,[<ctxp=%i1+60]
stw %o1,[%i1+60]

# qhasm: *(uint32 *) (ctxp + 64) = y2
# asm 1: stw <y2=int64#13,[<ctxp=int64#2+64]
# asm 2: stw <y2=%o3,[<ctxp=%i1+64]
stw %o3,[%i1+64]

# qhasm: *(uint32 *) (ctxp + 68) = y3
# asm 1: stw <y3=int64#14,[<ctxp=int64#2+68]
# asm 2: stw <y3=%o4,[<ctxp=%i1+68]
stw %o4,[%i1+68]

# qhasm: donothing:
._donothing:

# qhasm: leave
ret
restore
