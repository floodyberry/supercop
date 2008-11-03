
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

# qhasm: int64 check

# qhasm: int64 n0

# qhasm: int64 n1

# qhasm: int64 n2

# qhasm: int64 n3

# qhasm: int64 in0

# qhasm: int64 in1

# qhasm: int64 in2

# qhasm: int64 in3

# qhasm: int64 n0p

# qhasm: int64 dd 

# qhasm: int64 tmpp

# qhasm: int64 y0

# qhasm: int64 y1

# qhasm: int64 y2

# qhasm: int64 y3

# qhasm: int64 ty0

# qhasm: int64 z0

# qhasm: int64 z1

# qhasm: int64 z2

# qhasm: int64 z3

# qhasm: int64 tz0

# qhasm: int64 tz1

# qhasm: int64 tz2

# qhasm: int64 tz3

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

# qhasm: int64 mask

# qhasm: stack128 tmp

# qhasm: enter ECRYPT_process_bytes
.section ".text"
.align 32
.global ECRYPT_process_bytes
ECRYPT_process_bytes:
save %sp,-192,%sp

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

# qhasm: table0 = constants
# asm 1: add %g0,<constants=int64#1,>table0=int64#6
# asm 2: add %g0,<constants=%i0,>table0=%i5
add %g0,%i0,%i5

# qhasm: table0 += 80
# asm 1: add <table0=int64#6,80,>table0=int64#6
# asm 2: add <table0=%i5,80,>table0=%i5
add %i5,80,%i5

# qhasm: table1 = constants
# asm 1: add %g0,<constants=int64#1,>table1=int64#1
# asm 2: add %g0,<constants=%i0,>table1=%i0
add %g0,%i0,%i0

# qhasm: table1 += 4000
# asm 1: add <table1=int64#1,4000,>table1=int64#1
# asm 2: add <table1=%i0,4000,>table1=%i0
add %i0,4000,%i0

# qhasm: table1 += 176 
# asm 1: add <table1=int64#1,176,>table1=int64#1
# asm 2: add <table1=%i0,176,>table1=%i0
add %i0,176,%i0

# qhasm: table2 = table0 + 8
# asm 1: add <table0=int64#6,8,>table2=int64#7
# asm 2: add <table0=%i5,8,>table2=%g1
add %i5,8,%g1

# qhasm: table3 = table1 + 8
# asm 1: add <table1=int64#1,8,>table3=int64#8
# asm 2: add <table1=%i0,8,>table3=%g4
add %i0,8,%g4

# qhasm: y0 = *(uint32 *) (ctxp + 356)
# asm 1: lduw [<ctxp=int64#2+356],>y0=int64#9
# asm 2: lduw [<ctxp=%i1+356],>y0=%g5
lduw [%i1+356],%g5

# qhasm: y1 = *(uint64 *) (ctxp + 360)
# asm 1: ldx [<ctxp=int64#2+360],>y1=int64#10
# asm 2: ldx [<ctxp=%i1+360],>y1=%o0
ldx [%i1+360],%o0

# qhasm: y2 = *(uint64 *) (ctxp + 368)
# asm 1: ldx [<ctxp=int64#2+368],>y2=int64#11
# asm 2: ldx [<ctxp=%i1+368],>y2=%o1
ldx [%i1+368],%o1

# qhasm: y3 = *(uint64 *) (ctxp + 376)
# asm 1: ldx [<ctxp=int64#2+376],>y3=int64#12
# asm 2: ldx [<ctxp=%i1+376],>y3=%o2
ldx [%i1+376],%o2

# qhasm: n0p = ctxp + 356 
# asm 1: add <ctxp=int64#2,356,>n0p=int64#13
# asm 2: add <ctxp=%i1,356,>n0p=%o3
add %i1,356,%o3

# qhasm: n0 = *(swapendian uint32 *) n0p
# asm 1: lduwa [<n0p=int64#13] 0x88,>n0=int64#14
# asm 2: lduwa [<n0p=%o3] 0x88,>n0=%o4
lduwa [%o3] 0x88,%o4

# qhasm: n0 = n0 + 1
# asm 1: add <n0=int64#14,1,>n0=int64#14
# asm 2: add <n0=%o4,1,>n0=%o4
add %o4,1,%o4

# qhasm: *(swapendian uint32 *) n0p = n0
# asm 1: stwa <n0=int64#14,[<n0p=int64#13] 0x88
# asm 2: stwa <n0=%o4,[<n0p=%o3] 0x88
stwa %o4,[%o3] 0x88

# qhasm: tx0 = *(uint64 *) (ctxp + 0)
# asm 1: ldx [<ctxp=int64#2+0],>tx0=int64#13
# asm 2: ldx [<ctxp=%i1+0],>tx0=%o3
ldx [%i1+0],%o3

# qhasm: y0 ^= tx0
# asm 1: xor <y0=int64#9,<tx0=int64#13,>y0=int64#9
# asm 2: xor <y0=%g5,<tx0=%o3,>y0=%g5
xor %g5,%o3,%g5

# qhasm: goto precompute
b ._precompute
nop

# qhasm: mainloop:
._mainloop:

# qhasm: ty0 = (uint64) y0 << 32
# asm 1: sllx <y0=int64#9,32,>ty0=int64#9
# asm 2: sllx <y0=%g5,32,>ty0=%g5
sllx %g5,32,%g5

# qhasm: outp += 16
# asm 1: add <outp=int64#4,16,>outp=int64#4
# asm 2: add <outp=%i3,16,>outp=%i3
add %i3,16,%i3

# qhasm: z0 = *(uint64 *) (ctxp + 384)
# asm 1: ldx [<ctxp=int64#2+384],>z0=int64#10
# asm 2: ldx [<ctxp=%i1+384],>z0=%o0
ldx [%i1+384],%o0

# qhasm: y2 <<= 32
# asm 1: sllx <y2=int64#11,32,>y2=int64#11
# asm 2: sllx <y2=%o1,32,>y2=%o1
sllx %o1,32,%o1

# qhasm: n0p = ctxp + 356
# asm 1: add <ctxp=int64#2,356,>n0p=int64#16
# asm 2: add <ctxp=%i1,356,>n0p=%o7
add %i1,356,%o7

# qhasm: y0 = *(uint32 *) (ctxp + 356)
# asm 1: lduw [<ctxp=int64#2+356],>y0=int64#17
# asm 2: lduw [<ctxp=%i1+356],>y0=%l0
lduw [%i1+356],%l0

# qhasm: y2 ^= y3
# asm 1: xor <y2=int64#11,<y3=int64#12,>y2=int64#11
# asm 2: xor <y2=%o1,<y3=%o2,>y2=%o1
xor %o1,%o2,%o1

# qhasm: ty0 ^= y1
# asm 1: xor <ty0=int64#9,<y1=int64#14,>ty0=int64#9
# asm 2: xor <ty0=%g5,<y1=%o4,>ty0=%g5
xor %g5,%o4,%g5

# qhasm: n0 = *(swapendian uint32 *) n0p
# asm 1: lduwa [<n0p=int64#16] 0x88,>n0=int64#12
# asm 2: lduwa [<n0p=%o7] 0x88,>n0=%o2
lduwa [%o7] 0x88,%o2

# qhasm: in0 ^= ty0 
# asm 1: xor <in0=int64#13,<ty0=int64#9,>in0=int64#9
# asm 2: xor <in0=%o3,<ty0=%g5,>in0=%g5
xor %o3,%g5,%g5

# qhasm: in2 ^= y2 
# asm 1: xor <in2=int64#15,<y2=int64#11,>in2=int64#11
# asm 2: xor <in2=%o5,<y2=%o1,>in2=%o1
xor %o5,%o1,%o1

# qhasm: tx0 = *(uint64 *) (ctxp + 0)
# asm 1: ldx [<ctxp=int64#2+0],>tx0=int64#13
# asm 2: ldx [<ctxp=%i1+0],>tx0=%o3
ldx [%i1+0],%o3

# qhasm: check = (uint32) y0 >> 24
# asm 1: srl <y0=int64#17,24,>check=int64#14
# asm 2: srl <y0=%l0,24,>check=%o4
srl %l0,24,%o4

# qhasm: inp += 16
# asm 1: add <inp=int64#3,16,>inp=int64#3
# asm 2: add <inp=%i2,16,>inp=%i2
add %i2,16,%i2

# qhasm: *(uint64 *) (outp - 16) = in0
# asm 1: stx <in0=int64#9,[<outp=int64#4-16]
# asm 2: stx <in0=%g5,[<outp=%i3-16]
stx %g5,[%i3-16]

# qhasm: n0 = n0 + 1
# asm 1: add <n0=int64#12,1,>n0=int64#12
# asm 2: add <n0=%o2,1,>n0=%o2
add %o2,1,%o2

# qhasm: =? check - 0
# asm 1: subcc <check=int64#14,0,%g0
# asm 2: subcc <check=%o4,0,%g0
subcc %o4,0,%g0

# qhasm: *(uint64 *) (outp - 8) = in2
# asm 1: stx <in2=int64#11,[<outp=int64#4-8]
# asm 2: stx <in2=%o1,[<outp=%i3-8]
stx %o1,[%i3-8]

# qhasm: aftercopy:
._aftercopy:

# qhasm: y0 ^= tx0
# asm 1: xor <y0=int64#17,<tx0=int64#13,>y0=int64#9
# asm 2: xor <y0=%l0,<tx0=%o3,>y0=%g5
xor %l0,%o3,%g5

# qhasm: *(swapendian uint32 *) n0p = n0
# asm 1: stwa <n0=int64#12,[<n0p=int64#16] 0x88
# asm 2: stwa <n0=%o2,[<n0p=%o7] 0x88
stwa %o2,[%o7] 0x88

# qhasm: goto after_precompute if !=
bne,pt %xcc,._after_precompute
nop

# qhasm: precompute:
._precompute:

# qhasm: y1 = *(uint64 *) (ctxp + 360)
# asm 1: ldx [<ctxp=int64#2+360],>y1=int64#10
# asm 2: ldx [<ctxp=%i1+360],>y1=%o0
ldx [%i1+360],%o0

# qhasm: y2 = *(uint64 *) (ctxp + 368)
# asm 1: ldx [<ctxp=int64#2+368],>y2=int64#11
# asm 2: ldx [<ctxp=%i1+368],>y2=%o1
ldx [%i1+368],%o1

# qhasm: y3 = *(uint64 *) (ctxp + 376)
# asm 1: ldx [<ctxp=int64#2+376],>y3=int64#12
# asm 2: ldx [<ctxp=%i1+376],>y3=%o2
ldx [%i1+376],%o2

# qhasm: tx1 = *(uint64 *) (ctxp + 8)
# asm 1: ldx [<ctxp=int64#2+8],>tx1=int64#13
# asm 2: ldx [<ctxp=%i1+8],>tx1=%o3
ldx [%i1+8],%o3

# qhasm: tx2 = *(uint64 *) (ctxp + 16)
# asm 1: ldx [<ctxp=int64#2+16],>tx2=int64#14
# asm 2: ldx [<ctxp=%i1+16],>tx2=%o4
ldx [%i1+16],%o4

# qhasm: tx3 = *(uint64 *) (ctxp + 24)
# asm 1: ldx [<ctxp=int64#2+24],>tx3=int64#15
# asm 2: ldx [<ctxp=%i1+24],>tx3=%o5
ldx [%i1+24],%o5

# qhasm: y1 ^= tx1
# asm 1: xor <y1=int64#10,<tx1=int64#13,>y1=int64#10
# asm 2: xor <y1=%o0,<tx1=%o3,>y1=%o0
xor %o0,%o3,%o0

# qhasm: y2 ^= tx2
# asm 1: xor <y2=int64#11,<tx2=int64#14,>y2=int64#11
# asm 2: xor <y2=%o1,<tx2=%o4,>y2=%o1
xor %o1,%o4,%o1

# qhasm: y3 ^= tx3
# asm 1: xor <y3=int64#12,<tx3=int64#15,>y3=int64#12
# asm 2: xor <y3=%o2,<tx3=%o5,>y3=%o2
xor %o2,%o5,%o2

# qhasm: p01 = (uint32) y0 >> 12
# asm 1: srl <y0=int64#9,12,>p01=int64#13
# asm 2: srl <y0=%g5,12,>p01=%o3
srl %g5,12,%o3

# qhasm: z0 = *(uint64 *) (ctxp + 32)
# asm 1: ldx [<ctxp=int64#2+32],>z0=int64#14
# asm 2: ldx [<ctxp=%i1+32],>z0=%o4
ldx [%i1+32],%o4

# qhasm: p02 = (uint32) y0 >> 4
# asm 1: srl <y0=int64#9,4,>p02=int64#15
# asm 2: srl <y0=%g5,4,>p02=%o5
srl %g5,4,%o5

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#13,4080,>p01=int64#13
# asm 2: and <p01=%o3,4080,>p01=%o3
and %o3,4080,%o3

# qhasm: z1 = *(uint64 *) (ctxp + 40)
# asm 1: ldx [<ctxp=int64#2+40],>z1=int64#16
# asm 2: ldx [<ctxp=%i1+40],>z1=%o7
ldx [%i1+40],%o7

# qhasm: p03 = (uint32) y0 << 4 
# asm 1: sll <y0=int64#9,4,>p03=int64#17
# asm 2: sll <y0=%g5,4,>p03=%l0
sll %g5,4,%l0

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#15,4080,>p02=int64#15
# asm 2: and <p02=%o5,4080,>p02=%o5
and %o5,4080,%o5

# qhasm: z2 = *(uint64 *) (ctxp + 48)
# asm 1: ldx [<ctxp=int64#2+48],>z2=int64#18
# asm 2: ldx [<ctxp=%i1+48],>z2=%l1
ldx [%i1+48],%l1

# qhasm: p03 &= 4080
# asm 1: and <p03=int64#17,4080,>p03=int64#17
# asm 2: and <p03=%l0,4080,>p03=%l0
and %l0,4080,%l0

# qhasm: z3 = *(uint64 *) (ctxp + 56)
# asm 1: ldx [<ctxp=int64#2+56],>z3=int64#19
# asm 2: ldx [<ctxp=%i1+56],>z3=%l2
ldx [%i1+56],%l2

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#13],>p01=int64#13
# asm 2: ldx [<table1=%i0+<p01=%o3],>p01=%o3
ldx [%i0+%o3],%o3

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#15],>p02=int64#15
# asm 2: ldx [<table2=%g1+<p02=%o5],>p02=%o5
ldx [%g1+%o5],%o5

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#17],>p03=int64#17
# asm 2: ldx [<table3=%g4+<p03=%l0],>p03=%l0
ldx [%g4+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48 
# asm 1: srlx <y1=int64#10,48,>p10=int64#20
# asm 2: srlx <y1=%o0,48,>p10=%l3
srlx %o0,48,%l3

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#10,4080,>p13=int64#21
# asm 2: and <y1=%o0,4080,>p13=%l4
and %o0,4080,%l4

# qhasm: p11 = (uint64) y1 >> 32 
# asm 1: srlx <y1=int64#10,32,>p11=int64#22
# asm 2: srlx <y1=%o0,32,>p11=%l5
srlx %o0,32,%l5

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#13,>z3=int64#13
# asm 2: xor <z3=%l2,<p01=%o3,>z3=%o3
xor %l2,%o3,%o3

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#19
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l2
ldx [%i5+%l3],%l2

# qhasm: p12 = (uint64) y1 >> 16
# asm 1: srlx <y1=int64#10,16,>p12=int64#10
# asm 2: srlx <y1=%o0,16,>p12=%o0
srlx %o0,16,%o0

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#22,4080,>p11=int64#20
# asm 2: and <p11=%l5,4080,>p11=%l3
and %l5,4080,%l3

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#21],>p13=int64#21
# asm 2: ldx [<table3=%g4+<p13=%l4],>p13=%l4
ldx [%g4+%l4],%l4

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#10,4080,>p12=int64#10
# asm 2: and <p12=%o0,4080,>p12=%o0
and %o0,4080,%o0

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#18,<p02=int64#15,>z2=int64#15
# asm 2: xor <z2=%l1,<p02=%o5,>z2=%o5
xor %l1,%o5,%o5

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#20],>p11=int64#18
# asm 2: ldx [<table1=%i0+<p11=%l3],>p11=%l1
ldx [%i0+%l3],%l1

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#11,48,>p20=int64#20
# asm 2: srlx <y2=%o1,48,>p20=%l3
srlx %o1,48,%l3

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#11,4080,>p23=int64#22
# asm 2: and <y2=%o1,4080,>p23=%l5
and %o1,4080,%l5

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#10],>p12=int64#10
# asm 2: ldx [<table2=%g1+<p12=%o0],>p12=%o0
ldx [%g1+%o0],%o0

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#11,32,>p21=int64#23
# asm 2: srlx <y2=%o1,32,>p21=%l6
srlx %o1,32,%l6

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#16,<p03=int64#17,>z1=int64#16
# asm 2: xor <z1=%o7,<p03=%l0,>z1=%o7
xor %o7,%l0,%o7

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#20],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l3],>p20=%l0
ldx [%i5+%l3],%l0

# qhasm: p22 = (uint64) y2 >> 16
# asm 1: srlx <y2=int64#11,16,>p22=int64#11
# asm 2: srlx <y2=%o1,16,>p22=%o1
srlx %o1,16,%o1

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#23,4080,>p21=int64#20
# asm 2: and <p21=%l6,4080,>p21=%l3
and %l6,4080,%l3

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#22],>p23=int64#22
# asm 2: ldx [<table3=%g4+<p23=%l5],>p23=%l5
ldx [%g4+%l5],%l5

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#11,4080,>p22=int64#11
# asm 2: and <p22=%o1,4080,>p22=%o1
and %o1,4080,%o1

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#16,<p10=int64#19,>z1=int64#16
# asm 2: xor <z1=%o7,<p10=%l2,>z1=%o7
xor %o7,%l2,%o7

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#20],>p21=int64#19
# asm 2: ldx [<table1=%i0+<p21=%l3],>p21=%l2
ldx [%i0+%l3],%l2

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#14,<p11=int64#18,>z0=int64#14
# asm 2: xor <z0=%o4,<p11=%l1,>z0=%o4
xor %o4,%l1,%o4

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#13,<p12=int64#10,>z3=int64#10
# asm 2: xor <z3=%o3,<p12=%o0,>z3=%o0
xor %o3,%o0,%o0

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#11],>p22=int64#11
# asm 2: ldx [<table2=%g1+<p22=%o1],>p22=%o1
ldx [%g1+%o1],%o1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#12,48,>p30=int64#13
# asm 2: srlx <y3=%o2,48,>p30=%o3
srlx %o2,48,%o3

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#12,4080,>p33=int64#18
# asm 2: and <y3=%o2,4080,>p33=%l1
and %o2,4080,%l1

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#15,<p13=int64#21,>z2=int64#15
# asm 2: xor <z2=%o5,<p13=%l4,>z2=%o5
xor %o5,%l4,%o5

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#15,<p20=int64#17,>z2=int64#15
# asm 2: xor <z2=%o5,<p20=%l0,>z2=%o5
xor %o5,%l0,%o5

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#13],>p30=int64#13
# asm 2: ldx [<table0=%i5+<p30=%o3],>p30=%o3
ldx [%i5+%o3],%o3

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#12,32,>p31=int64#17
# asm 2: srlx <y3=%o2,32,>p31=%l0
srlx %o2,32,%l0

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#16,<p21=int64#19,>z1=int64#16
# asm 2: xor <z1=%o7,<p21=%l2,>z1=%o7
xor %o7,%l2,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#18],>p33=int64#18
# asm 2: ldx [<table3=%g4+<p33=%l1],>p33=%l1
ldx [%g4+%l1],%l1

# qhasm: p32 = (uint64) y3 >> 16
# asm 1: srlx <y3=int64#12,16,>p32=int64#12
# asm 2: srlx <y3=%o2,16,>p32=%o2
srlx %o2,16,%o2

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#17,4080,>p31=int64#17
# asm 2: and <p31=%l0,4080,>p31=%l0
and %l0,4080,%l0

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#14,<p22=int64#11,>z0=int64#11
# asm 2: xor <z0=%o4,<p22=%o1,>z0=%o1
xor %o4,%o1,%o1

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#12,4080,>p32=int64#12
# asm 2: and <p32=%o2,4080,>p32=%o2
and %o2,4080,%o2

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#17],>p31=int64#14
# asm 2: ldx [<table1=%i0+<p31=%l0],>p31=%o4
ldx [%i0+%l0],%o4

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#10,<p23=int64#22,>z3=int64#10
# asm 2: xor <z3=%o0,<p23=%l5,>z3=%o0
xor %o0,%l5,%o0

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#10,<p30=int64#13,>y3=int64#10
# asm 2: xor <z3=%o0,<p30=%o3,>y3=%o0
xor %o0,%o3,%o0

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#12],>p32=int64#12
# asm 2: ldx [<table2=%g1+<p32=%o2],>p32=%o2
ldx [%g1+%o2],%o2

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#15,<p31=int64#14,>y2=int64#13
# asm 2: xor <z2=%o5,<p31=%o4,>y2=%o3
xor %o5,%o4,%o3

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#16,<p32=int64#12,>y1=int64#12
# asm 2: xor <z1=%o7,<p32=%o2,>y1=%o2
xor %o7,%o2,%o2

# qhasm: z3 = *(uint64 *) (ctxp + 88)
# asm 1: ldx [<ctxp=int64#2+88],>z3=int64#14
# asm 2: ldx [<ctxp=%i1+88],>z3=%o4
ldx [%i1+88],%o4

# qhasm: z0 ^= p33
# asm 1: xor <z0=int64#11,<p33=int64#18,>z0=int64#11
# asm 2: xor <z0=%o1,<p33=%l1,>z0=%o1
xor %o1,%l1,%o1

# qhasm: *(uint64 *) (ctxp + 384) = z0
# asm 1: stx <z0=int64#11,[<ctxp=int64#2+384]
# asm 2: stx <z0=%o1,[<ctxp=%i1+384]
stx %o1,[%i1+384]

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#12,48,>p10=int64#11
# asm 2: srlx <y1=%o2,48,>p10=%o1
srlx %o2,48,%o1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#12,4080,>p13=int64#15
# asm 2: and <y1=%o2,4080,>p13=%o5
and %o2,4080,%o5

# qhasm: z0 = *(uint64 *) (ctxp + 64)
# asm 1: ldx [<ctxp=int64#2+64],>z0=int64#16
# asm 2: ldx [<ctxp=%i1+64],>z0=%o7
ldx [%i1+64],%o7

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#12,32,>p11=int64#17
# asm 2: srlx <y1=%o2,32,>p11=%l0
srlx %o2,32,%l0

# qhasm: z1 = *(uint64 *) (ctxp + 72)
# asm 1: ldx [<ctxp=int64#2+72],>z1=int64#18
# asm 2: ldx [<ctxp=%i1+72],>z1=%l1
ldx [%i1+72],%l1

# qhasm: p12 = (uint64) y1 >> 16
# asm 1: srlx <y1=int64#12,16,>p12=int64#12
# asm 2: srlx <y1=%o2,16,>p12=%o2
srlx %o2,16,%o2

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#17,4080,>p11=int64#17
# asm 2: and <p11=%l0,4080,>p11=%l0
and %l0,4080,%l0

# qhasm: z2 = *(uint64 *) (ctxp + 80)
# asm 1: ldx [<ctxp=int64#2+80],>z2=int64#19
# asm 2: ldx [<ctxp=%i1+80],>z2=%l2
ldx [%i1+80],%l2

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#13,48,>p20=int64#20
# asm 2: srlx <y2=%o3,48,>p20=%l3
srlx %o3,48,%l3

# qhasm: p12 &= 4080
# asm 1: and <p12=int64#12,4080,>p12=int64#12
# asm 2: and <p12=%o2,4080,>p12=%o2
and %o2,4080,%o2

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#11],>p10=int64#11
# asm 2: ldx [<table0=%i5+<p10=%o1],>p10=%o1
ldx [%i5+%o1],%o1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#13,32,>p21=int64#21
# asm 2: srlx <y2=%o3,32,>p21=%l4
srlx %o3,32,%l4

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#13,4080,>p23=int64#22
# asm 2: and <y2=%o3,4080,>p23=%l5
and %o3,4080,%l5

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#17],>p11=int64#17
# asm 2: ldx [<table1=%i0+<p11=%l0],>p11=%l0
ldx [%i0+%l0],%l0

# qhasm: p22 = (uint64) y2 >> 16
# asm 1: srlx <y2=int64#13,16,>p22=int64#13
# asm 2: srlx <y2=%o3,16,>p22=%o3
srlx %o3,16,%o3

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#21
# asm 2: and <p21=%l4,4080,>p21=%l4
and %l4,4080,%l4

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#12],>p12=int64#12
# asm 2: ldx [<table2=%g1+<p12=%o2],>p12=%o2
ldx [%g1+%o2],%o2

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#18,<p10=int64#11,>z1=int64#11
# asm 2: xor <z1=%l1,<p10=%o1,>z1=%o1
xor %l1,%o1,%o1

# qhasm: p22 &= 4080
# asm 1: and <p22=int64#13,4080,>p22=int64#13
# asm 2: and <p22=%o3,4080,>p22=%o3
and %o3,4080,%o3

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#15],>p13=int64#15
# asm 2: ldx [<table3=%g4+<p13=%o5],>p13=%o5
ldx [%g4+%o5],%o5

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#16,<p11=int64#17,>z0=int64#16
# asm 2: xor <z0=%o7,<p11=%l0,>z0=%o7
xor %o7,%l0,%o7

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#14,<p12=int64#12,>z3=int64#12
# asm 2: xor <z3=%o4,<p12=%o2,>z3=%o2
xor %o4,%o2,%o2

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#20],>p20=int64#14
# asm 2: ldx [<table0=%i5+<p20=%l3],>p20=%o4
ldx [%i5+%l3],%o4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#19,<p13=int64#15,>z2=int64#15
# asm 2: xor <z2=%l2,<p13=%o5,>z2=%o5
xor %l2,%o5,%o5

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#22],>p23=int64#17
# asm 2: ldx [<table3=%g4+<p23=%l5],>p23=%l0
ldx [%g4+%l5],%l0

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#21],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l4],>p21=%l1
ldx [%i0+%l4],%l1

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#13],>p22=int64#13
# asm 2: ldx [<table2=%g1+<p22=%o3],>p22=%o3
ldx [%g1+%o3],%o3

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#10,48,>p30=int64#19
# asm 2: srlx <y3=%o0,48,>p30=%l2
srlx %o0,48,%l2

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#10,4080,>p33=int64#20
# asm 2: and <y3=%o0,4080,>p33=%l3
and %o0,4080,%l3

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#10,32,>p31=int64#21
# asm 2: srlx <y3=%o0,32,>p31=%l4
srlx %o0,32,%l4

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#15,<p20=int64#14,>z2=int64#14
# asm 2: xor <z2=%o5,<p20=%o4,>z2=%o4
xor %o5,%o4,%o4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#15
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%o5
ldx [%i5+%l2],%o5

# qhasm: p32 = (uint64) y3 >> 16
# asm 1: srlx <y3=int64#10,16,>p32=int64#10
# asm 2: srlx <y3=%o0,16,>p32=%o0
srlx %o0,16,%o0

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#21,4080,>p31=int64#19
# asm 2: and <p31=%l4,4080,>p31=%l2
and %l4,4080,%l2

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#20],>p33=int64#20
# asm 2: ldx [<table3=%g4+<p33=%l3],>p33=%l3
ldx [%g4+%l3],%l3

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#11,<p21=int64#18,>z1=int64#11
# asm 2: xor <z1=%o1,<p21=%l1,>z1=%o1
xor %o1,%l1,%o1

# qhasm: p32 &= 4080
# asm 1: and <p32=int64#10,4080,>p32=int64#10
# asm 2: and <p32=%o0,4080,>p32=%o0
and %o0,4080,%o0

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#19],>p31=int64#18
# asm 2: ldx [<table1=%i0+<p31=%l2],>p31=%l1
ldx [%i0+%l2],%l1

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#16,<p22=int64#13,>z0=int64#13
# asm 2: xor <z0=%o7,<p22=%o3,>z0=%o3
xor %o7,%o3,%o3

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#12,<p23=int64#17,>z3=int64#12
# asm 2: xor <z3=%o2,<p23=%l0,>z3=%o2
xor %o2,%l0,%o2

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#10],>p32=int64#10
# asm 2: ldx [<table2=%g1+<p32=%o0],>p32=%o0
ldx [%g1+%o0],%o0

# qhasm: z2 ^= p31
# asm 1: xor <z2=int64#14,<p31=int64#18,>z2=int64#14
# asm 2: xor <z2=%o4,<p31=%l1,>z2=%o4
xor %o4,%l1,%o4

# qhasm: z1 ^= p32
# asm 1: xor <z1=int64#11,<p32=int64#10,>z1=int64#10
# asm 2: xor <z1=%o1,<p32=%o0,>z1=%o0
xor %o1,%o0,%o0

# qhasm: z0 ^= p33
# asm 1: xor <z0=int64#13,<p33=int64#20,>z0=int64#11
# asm 2: xor <z0=%o3,<p33=%l3,>z0=%o1
xor %o3,%l3,%o1

# qhasm: z3 ^= p30
# asm 1: xor <z3=int64#12,<p30=int64#15,>z3=int64#12
# asm 2: xor <z3=%o2,<p30=%o5,>z3=%o2
xor %o2,%o5,%o2

# qhasm: *(uint64 *) (ctxp + 408) = z2
# asm 1: stx <z2=int64#14,[<ctxp=int64#2+408]
# asm 2: stx <z2=%o4,[<ctxp=%i1+408]
stx %o4,[%i1+408]

# qhasm: *(uint64 *) (ctxp + 400) = z1
# asm 1: stx <z1=int64#10,[<ctxp=int64#2+400]
# asm 2: stx <z1=%o0,[<ctxp=%i1+400]
stx %o0,[%i1+400]

# qhasm: *(uint64 *) (ctxp + 392) = z0
# asm 1: stx <z0=int64#11,[<ctxp=int64#2+392]
# asm 2: stx <z0=%o1,[<ctxp=%i1+392]
stx %o1,[%i1+392]

# qhasm: *(uint64 *) (ctxp + 416) = z3
# asm 1: stx <z3=int64#12,[<ctxp=int64#2+416]
# asm 2: stx <z3=%o2,[<ctxp=%i1+416]
stx %o2,[%i1+416]

# qhasm: z0 = *(uint64 *) (ctxp + 384)
# asm 1: ldx [<ctxp=int64#2+384],>z0=int64#10
# asm 2: ldx [<ctxp=%i1+384],>z0=%o0
ldx [%i1+384],%o0

# qhasm: after_precompute:
._after_precompute:

# qhasm: p00 = (uint32) y0 >> 20
# asm 1: srl <y0=int64#9,20,>p00=int64#9
# asm 2: srl <y0=%g5,20,>p00=%g5
srl %g5,20,%g5

# qhasm: z1 = *(uint64 *) (ctxp + 400)
# asm 1: ldx [<ctxp=int64#2+400],>z1=int64#11
# asm 2: ldx [<ctxp=%i1+400],>z1=%o1
ldx [%i1+400],%o1

# qhasm: p00 &= 4080
# asm 1: and <p00=int64#9,4080,>p00=int64#9
# asm 2: and <p00=%g5,4080,>p00=%g5
and %g5,4080,%g5

# qhasm: z3 = *(uint64 *) (ctxp + 416)
# asm 1: ldx [<ctxp=int64#2+416],>z3=int64#12
# asm 2: ldx [<ctxp=%i1+416],>z3=%o2
ldx [%i1+416],%o2

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#9],>p00=int64#9
# asm 2: ldx [<table0=%i5+<p00=%g5],>p00=%g5
ldx [%i5+%g5],%g5

# qhasm: y0 = z0 ^ p00
# asm 1: xor <z0=int64#10,<p00=int64#9,>y0=int64#9
# asm 2: xor <z0=%o0,<p00=%g5,>y0=%g5
xor %o0,%g5,%g5

# qhasm: z0 = *(uint64 *) (ctxp + 392)
# asm 1: ldx [<ctxp=int64#2+392],>z0=int64#10
# asm 2: ldx [<ctxp=%i1+392],>z0=%o0
ldx [%i1+392],%o0

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#9,48,>p00=int64#13
# asm 2: srlx <y0=%g5,48,>p00=%o3
srlx %g5,48,%o3

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#9,4080,>p03=int64#14
# asm 2: and <y0=%g5,4080,>p03=%o4
and %g5,4080,%o4

# qhasm: z2 = *(uint64 *) (ctxp + 408)
# asm 1: ldx [<ctxp=int64#2+408],>z2=int64#15
# asm 2: ldx [<ctxp=%i1+408],>z2=%o5
ldx [%i1+408],%o5

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#9,32,>p01=int64#16
# asm 2: srlx <y0=%g5,32,>p01=%o7
srlx %g5,32,%o7

# qhasm: p02 = (uint64) y0 >> 16
# asm 1: srlx <y0=int64#9,16,>p02=int64#9
# asm 2: srlx <y0=%g5,16,>p02=%g5
srlx %g5,16,%g5

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#13],>p00=int64#13
# asm 2: ldx [<table0=%i5+<p00=%o3],>p00=%o3
ldx [%i5+%o3],%o3

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#16,4080,>p01=int64#16
# asm 2: and <p01=%o7,4080,>p01=%o7
and %o7,4080,%o7

# qhasm: p02 &= 4080
# asm 1: and <p02=int64#9,4080,>p02=int64#9
# asm 2: and <p02=%g5,4080,>p02=%g5
and %g5,4080,%g5

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#14],>p03=int64#14
# asm 2: ldx [<table3=%g4+<p03=%o4],>p03=%o4
ldx [%g4+%o4],%o4

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#16],>p01=int64#16
# asm 2: ldx [<table1=%i0+<p01=%o7],>p01=%o7
ldx [%i0+%o7],%o7

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#9],>p02=int64#9
# asm 2: ldx [<table2=%g1+<p02=%g5],>p02=%g5
ldx [%g1+%g5],%g5

# qhasm: y0 = z0 ^ p00
# asm 1: xor <z0=int64#10,<p00=int64#13,>y0=int64#10
# asm 2: xor <z0=%o0,<p00=%o3,>y0=%o0
xor %o0,%o3,%o0

# qhasm: y1 = z1 ^ p03
# asm 1: xor <z1=int64#11,<p03=int64#14,>y1=int64#11
# asm 2: xor <z1=%o1,<p03=%o4,>y1=%o1
xor %o1,%o4,%o1

# qhasm: z1 = *(uint64 *) (ctxp + 104)
# asm 1: ldx [<ctxp=int64#2+104],>z1=int64#13
# asm 2: ldx [<ctxp=%i1+104],>z1=%o3
ldx [%i1+104],%o3

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#10,48,>p00=int64#14
# asm 2: srlx <y0=%o0,48,>p00=%o4
srlx %o0,48,%o4

# qhasm: y3 = z3 ^ p01
# asm 1: xor <z3=int64#12,<p01=int64#16,>y3=int64#12
# asm 2: xor <z3=%o2,<p01=%o7,>y3=%o2
xor %o2,%o7,%o2

# qhasm: z0 = *(uint64 *) (ctxp + 96)
# asm 1: ldx [<ctxp=int64#2+96],>z0=int64#16
# asm 2: ldx [<ctxp=%i1+96],>z0=%o7
ldx [%i1+96],%o7

# qhasm: y2 = z2 ^ p02
# asm 1: xor <z2=int64#15,<p02=int64#9,>y2=int64#9
# asm 2: xor <z2=%o5,<p02=%g5,>y2=%g5
xor %o5,%g5,%g5

# qhasm: z2 = *(uint64 *) (ctxp + 112)
# asm 1: ldx [<ctxp=int64#2+112],>z2=int64#15
# asm 2: ldx [<ctxp=%i1+112],>z2=%o5
ldx [%i1+112],%o5

# qhasm: round3:
._round3:

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#10,32,>p01=int64#17
# asm 2: srlx <y0=%o0,32,>p01=%l0
srlx %o0,32,%l0

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#10,4080,>p03=int64#18
# asm 2: and <y0=%o0,4080,>p03=%l1
and %o0,4080,%l1

# qhasm: z3 = *(uint64 *) (ctxp + 120)
# asm 1: ldx [<ctxp=int64#2+120],>z3=int64#19
# asm 2: ldx [<ctxp=%i1+120],>z3=%l2
ldx [%i1+120],%l2

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#10,16,>p02=int64#10
# asm 2: srl <y0=%o0,16,>p02=%o0
srl %o0,16,%o0

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#14],>p00=int64#14
# asm 2: ldx [<table0=%i5+<p00=%o4],>p00=%o4
ldx [%i5+%o4],%o4

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#11,48,>p10=int64#20
# asm 2: srlx <y1=%o1,48,>p10=%l3
srlx %o1,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#18],>p03=int64#18
# asm 2: ldx [<table3=%g4+<p03=%l1],>p03=%l1
ldx [%g4+%l1],%l1

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#11,32,>p11=int64#21
# asm 2: srlx <y1=%o1,32,>p11=%l4
srlx %o1,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#17,4080,>p01=int64#17
# asm 2: and <p01=%l0,4080,>p01=%l0
and %l0,4080,%l0

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#10],>p02=int64#10
# asm 2: ldx [<table2=%g1+<p02=%o0],>p02=%o0
ldx [%g1+%o0],%o0

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#11,16,>p12=int64#22
# asm 2: srl <y1=%o1,16,>p12=%l5
srl %o1,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#16,<p00=int64#14,>z0=int64#14
# asm 2: xor <z0=%o7,<p00=%o4,>z0=%o4
xor %o7,%o4,%o4

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#17],>p01=int64#16
# asm 2: ldx [<table1=%i0+<p01=%l0],>p01=%o7
ldx [%i0+%l0],%o7

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#13,<p03=int64#18,>z1=int64#13
# asm 2: xor <z1=%o3,<p03=%l1,>z1=%o3
xor %o3,%l1,%o3

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#17
# asm 2: and <p11=%l4,4080,>p11=%l0
and %l4,4080,%l0

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#11,4080,>p13=int64#11
# asm 2: and <y1=%o1,4080,>p13=%o1
and %o1,4080,%o1

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#17],>p11=int64#17
# asm 2: ldx [<table1=%i0+<p11=%l0],>p11=%l0
ldx [%i0+%l0],%l0

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#19,<p01=int64#16,>z3=int64#16
# asm 2: xor <z3=%l2,<p01=%o7,>z3=%o7
xor %l2,%o7,%o7

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#15,<p02=int64#10,>z2=int64#10
# asm 2: xor <z2=%o5,<p02=%o0,>z2=%o0
xor %o5,%o0,%o0

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#11],>p13=int64#11
# asm 2: ldx [<table3=%g4+<p13=%o1],>p13=%o1
ldx [%g4+%o1],%o1

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#9,48,>p20=int64#15
# asm 2: srlx <y2=%g5,48,>p20=%o5
srlx %g5,48,%o5

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#13,<p10=int64#18,>z1=int64#13
# asm 2: xor <z1=%o3,<p10=%l1,>z1=%o3
xor %o3,%l1,%o3

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#9,32,>p21=int64#19
# asm 2: srlx <y2=%g5,32,>p21=%l2
srlx %g5,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#9,4080,>p23=int64#20
# asm 2: and <y2=%g5,4080,>p23=%l3
and %g5,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#15],>p20=int64#15
# asm 2: ldx [<table0=%i5+<p20=%o5],>p20=%o5
ldx [%i5+%o5],%o5

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#9,16,>p22=int64#9
# asm 2: srl <y2=%g5,16,>p22=%g5
srl %g5,16,%g5

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#16,<p12=int64#18,>tz3=int64#16
# asm 2: xor <z3=%o7,<p12=%l1,>tz3=%o7
xor %o7,%l1,%o7

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#12,48,>p30=int64#19
# asm 2: srlx <y3=%o2,48,>p30=%l2
srlx %o2,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#10,<p13=int64#11,>z2=int64#10
# asm 2: xor <z2=%o0,<p13=%o1,>z2=%o0
xor %o0,%o1,%o0

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#9],>p22=int64#9
# asm 2: ldx [<table2=%g1+<p22=%g5],>p22=%g5
ldx [%g1+%g5],%g5

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#12,32,>p31=int64#11
# asm 2: srlx <y3=%o2,32,>p31=%o1
srlx %o2,32,%o1

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#12,4080,>p33=int64#21
# asm 2: and <y3=%o2,4080,>p33=%l4
and %o2,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#19
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%l2
ldx [%i5+%l2],%l2

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#12,16,>p32=int64#12
# asm 2: srl <y3=%o2,16,>p32=%o2
srl %o2,16,%o2

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#11,4080,>p31=int64#11
# asm 2: and <p31=%o1,4080,>p31=%o1
and %o1,4080,%o1

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#21
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l4
ldx [%g4+%l4],%l4

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#14,<p11=int64#17,>tz0=int64#14
# asm 2: xor <z0=%o4,<p11=%l0,>tz0=%o4
xor %o4,%l0,%o4

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#11],>p31=int64#11
# asm 2: ldx [<table1=%i0+<p31=%o1],>p31=%o1
ldx [%i0+%o1],%o1

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#13,<p21=int64#18,>tz1=int64#13
# asm 2: xor <z1=%o3,<p21=%l1,>tz1=%o3
xor %o3,%l1,%o3

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#10,<p20=int64#15,>tz2=int64#10
# asm 2: xor <z2=%o0,<p20=%o5,>tz2=%o0
xor %o0,%o5,%o0

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#12],>p32=int64#12
# asm 2: ldx [<table2=%g1+<p32=%o2],>p32=%o2
ldx [%g1+%o2],%o2

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#14,<p22=int64#9,>tz0=int64#9
# asm 2: xor <tz0=%o4,<p22=%g5,>tz0=%g5
xor %o4,%g5,%g5

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#16,<p23=int64#20,>tz3=int64#14
# asm 2: xor <tz3=%o7,<p23=%l3,>tz3=%o4
xor %o7,%l3,%o4

# qhasm: z1 = *(uint64 *) (ctxp + 136)
# asm 1: ldx [<ctxp=int64#2+136],>z1=int64#15
# asm 2: ldx [<ctxp=%i1+136],>z1=%o5
ldx [%i1+136],%o5

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#9,<p33=int64#21,>y0=int64#9
# asm 2: xor <tz0=%g5,<p33=%l4,>y0=%g5
xor %g5,%l4,%g5

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#14,<p30=int64#19,>y3=int64#14
# asm 2: xor <tz3=%o4,<p30=%l2,>y3=%o4
xor %o4,%l2,%o4

# qhasm: z2 = *(uint64 *) (ctxp + 144)
# asm 1: ldx [<ctxp=int64#2+144],>z2=int64#16
# asm 2: ldx [<ctxp=%i1+144],>z2=%o7
ldx [%i1+144],%o7

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#9,48,>p00=int64#17
# asm 2: srlx <y0=%g5,48,>p00=%l0
srlx %g5,48,%l0

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#13,<p32=int64#12,>y1=int64#12
# asm 2: xor <tz1=%o3,<p32=%o2,>y1=%o2
xor %o3,%o2,%o2

# qhasm: z0 = *(uint64 *) (ctxp + 128)
# asm 1: ldx [<ctxp=int64#2+128],>z0=int64#13
# asm 2: ldx [<ctxp=%i1+128],>z0=%o3
ldx [%i1+128],%o3

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#9,32,>p01=int64#18
# asm 2: srlx <y0=%g5,32,>p01=%l1
srlx %g5,32,%l1

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#10,<p31=int64#11,>y2=int64#10
# asm 2: xor <tz2=%o0,<p31=%o1,>y2=%o0
xor %o0,%o1,%o0

# qhasm: z3 = *(uint64 *) (ctxp + 152)
# asm 1: ldx [<ctxp=int64#2+152],>z3=int64#11
# asm 2: ldx [<ctxp=%i1+152],>z3=%o1
ldx [%i1+152],%o1

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#9,16,>p02=int64#19
# asm 2: srl <y0=%g5,16,>p02=%l2
srl %g5,16,%l2

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#9,4080,>p03=int64#9
# asm 2: and <y0=%g5,4080,>p03=%g5
and %g5,4080,%g5

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#17],>p00=int64#17
# asm 2: ldx [<table0=%i5+<p00=%l0],>p00=%l0
ldx [%i5+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#12,48,>p10=int64#20
# asm 2: srlx <y1=%o2,48,>p10=%l3
srlx %o2,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#9],>p03=int64#9
# asm 2: ldx [<table3=%g4+<p03=%g5],>p03=%g5
ldx [%g4+%g5],%g5

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#12,32,>p11=int64#21
# asm 2: srlx <y1=%o2,32,>p11=%l4
srlx %o2,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#19],>p02=int64#19
# asm 2: ldx [<table2=%g1+<p02=%l2],>p02=%l2
ldx [%g1+%l2],%l2

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#12,16,>p12=int64#22
# asm 2: srl <y1=%o2,16,>p12=%l5
srl %o2,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#13,<p00=int64#17,>z0=int64#13
# asm 2: xor <z0=%o3,<p00=%l0,>z0=%o3
xor %o3,%l0,%o3

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#18],>p01=int64#17
# asm 2: ldx [<table1=%i0+<p01=%l1],>p01=%l0
ldx [%i0+%l1],%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#15,<p03=int64#9,>z1=int64#9
# asm 2: xor <z1=%o5,<p03=%g5,>z1=%g5
xor %o5,%g5,%g5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#15
# asm 2: and <p11=%l4,4080,>p11=%o5
and %l4,4080,%o5

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#12,4080,>p13=int64#12
# asm 2: and <y1=%o2,4080,>p13=%o2
and %o2,4080,%o2

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#15],>p11=int64#15
# asm 2: ldx [<table1=%i0+<p11=%o5],>p11=%o5
ldx [%i0+%o5],%o5

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#16,<p02=int64#19,>z2=int64#16
# asm 2: xor <z2=%o7,<p02=%l2,>z2=%o7
xor %o7,%l2,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#11,<p01=int64#17,>z3=int64#11
# asm 2: xor <z3=%o1,<p01=%l0,>z3=%o1
xor %o1,%l0,%o1

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#12],>p13=int64#12
# asm 2: ldx [<table3=%g4+<p13=%o2],>p13=%o2
ldx [%g4+%o2],%o2

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#10,48,>p20=int64#17
# asm 2: srlx <y2=%o0,48,>p20=%l0
srlx %o0,48,%l0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#9,<p10=int64#18,>z1=int64#9
# asm 2: xor <z1=%g5,<p10=%l1,>z1=%g5
xor %g5,%l1,%g5

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#10,32,>p21=int64#19
# asm 2: srlx <y2=%o0,32,>p21=%l2
srlx %o0,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#10,4080,>p23=int64#20
# asm 2: and <y2=%o0,4080,>p23=%l3
and %o0,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#17],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l0],>p20=%l0
ldx [%i5+%l0],%l0

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#10,16,>p22=int64#10
# asm 2: srl <y2=%o0,16,>p22=%o0
srl %o0,16,%o0

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#11,<p12=int64#18,>tz3=int64#11
# asm 2: xor <z3=%o1,<p12=%l1,>tz3=%o1
xor %o1,%l1,%o1

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#14,48,>p30=int64#19
# asm 2: srlx <y3=%o4,48,>p30=%l2
srlx %o4,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#12,>z2=int64#12
# asm 2: xor <z2=%o7,<p13=%o2,>z2=%o2
xor %o7,%o2,%o2

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#10],>p22=int64#10
# asm 2: ldx [<table2=%g1+<p22=%o0],>p22=%o0
ldx [%g1+%o0],%o0

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#14,32,>p31=int64#16
# asm 2: srlx <y3=%o4,32,>p31=%o7
srlx %o4,32,%o7

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#14,4080,>p33=int64#21
# asm 2: and <y3=%o4,4080,>p33=%l4
and %o4,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#19
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%l2
ldx [%i5+%l2],%l2

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#14,16,>p32=int64#14
# asm 2: srl <y3=%o4,16,>p32=%o4
srl %o4,16,%o4

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#16,4080,>p31=int64#16
# asm 2: and <p31=%o7,4080,>p31=%o7
and %o7,4080,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#21
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l4
ldx [%g4+%l4],%l4

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#13,<p11=int64#15,>tz0=int64#13
# asm 2: xor <z0=%o3,<p11=%o5,>tz0=%o3
xor %o3,%o5,%o3

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#16],>p31=int64#15
# asm 2: ldx [<table1=%i0+<p31=%o7],>p31=%o5
ldx [%i0+%o7],%o5

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#9,<p21=int64#18,>tz1=int64#9
# asm 2: xor <z1=%g5,<p21=%l1,>tz1=%g5
xor %g5,%l1,%g5

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#12,<p20=int64#17,>tz2=int64#12
# asm 2: xor <z2=%o2,<p20=%l0,>tz2=%o2
xor %o2,%l0,%o2

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#14],>p32=int64#14
# asm 2: ldx [<table2=%g1+<p32=%o4],>p32=%o4
ldx [%g1+%o4],%o4

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#13,<p22=int64#10,>tz0=int64#10
# asm 2: xor <tz0=%o3,<p22=%o0,>tz0=%o0
xor %o3,%o0,%o0

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#11,<p23=int64#20,>tz3=int64#11
# asm 2: xor <tz3=%o1,<p23=%l3,>tz3=%o1
xor %o1,%l3,%o1

# qhasm: z1 = *(uint64 *) (ctxp + 168)
# asm 1: ldx [<ctxp=int64#2+168],>z1=int64#13
# asm 2: ldx [<ctxp=%i1+168],>z1=%o3
ldx [%i1+168],%o3

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#10,<p33=int64#21,>y0=int64#10
# asm 2: xor <tz0=%o0,<p33=%l4,>y0=%o0
xor %o0,%l4,%o0

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#11,<p30=int64#19,>y3=int64#11
# asm 2: xor <tz3=%o1,<p30=%l2,>y3=%o1
xor %o1,%l2,%o1

# qhasm: z2 = *(uint64 *) (ctxp + 176)
# asm 1: ldx [<ctxp=int64#2+176],>z2=int64#16
# asm 2: ldx [<ctxp=%i1+176],>z2=%o7
ldx [%i1+176],%o7

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#10,48,>p00=int64#17
# asm 2: srlx <y0=%o0,48,>p00=%l0
srlx %o0,48,%l0

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#12,<p31=int64#15,>y2=int64#12
# asm 2: xor <tz2=%o2,<p31=%o5,>y2=%o2
xor %o2,%o5,%o2

# qhasm: z0 = *(uint64 *) (ctxp + 160)
# asm 1: ldx [<ctxp=int64#2+160],>z0=int64#15
# asm 2: ldx [<ctxp=%i1+160],>z0=%o5
ldx [%i1+160],%o5

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#10,32,>p01=int64#18
# asm 2: srlx <y0=%o0,32,>p01=%l1
srlx %o0,32,%l1

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#9,<p32=int64#14,>y1=int64#9
# asm 2: xor <tz1=%g5,<p32=%o4,>y1=%g5
xor %g5,%o4,%g5

# qhasm: z3 = *(uint64 *) (ctxp + 184)
# asm 1: ldx [<ctxp=int64#2+184],>z3=int64#14
# asm 2: ldx [<ctxp=%i1+184],>z3=%o4
ldx [%i1+184],%o4

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#10,16,>p02=int64#19
# asm 2: srl <y0=%o0,16,>p02=%l2
srl %o0,16,%l2

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#10,4080,>p03=int64#10
# asm 2: and <y0=%o0,4080,>p03=%o0
and %o0,4080,%o0

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#17],>p00=int64#17
# asm 2: ldx [<table0=%i5+<p00=%l0],>p00=%l0
ldx [%i5+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#9,48,>p10=int64#20
# asm 2: srlx <y1=%g5,48,>p10=%l3
srlx %g5,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#10],>p03=int64#10
# asm 2: ldx [<table3=%g4+<p03=%o0],>p03=%o0
ldx [%g4+%o0],%o0

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#9,32,>p11=int64#21
# asm 2: srlx <y1=%g5,32,>p11=%l4
srlx %g5,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#19],>p02=int64#19
# asm 2: ldx [<table2=%g1+<p02=%l2],>p02=%l2
ldx [%g1+%l2],%l2

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#9,16,>p12=int64#22
# asm 2: srl <y1=%g5,16,>p12=%l5
srl %g5,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#17,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%l0,>z0=%o5
xor %o5,%l0,%o5

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#18],>p01=int64#17
# asm 2: ldx [<table1=%i0+<p01=%l1],>p01=%l0
ldx [%i0+%l1],%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#13,<p03=int64#10,>z1=int64#10
# asm 2: xor <z1=%o3,<p03=%o0,>z1=%o0
xor %o3,%o0,%o0

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#13
# asm 2: and <p11=%l4,4080,>p11=%o3
and %l4,4080,%o3

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#9,4080,>p13=int64#9
# asm 2: and <y1=%g5,4080,>p13=%g5
and %g5,4080,%g5

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#13],>p11=int64#13
# asm 2: ldx [<table1=%i0+<p11=%o3],>p11=%o3
ldx [%i0+%o3],%o3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#16,<p02=int64#19,>z2=int64#16
# asm 2: xor <z2=%o7,<p02=%l2,>z2=%o7
xor %o7,%l2,%o7

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#14,<p01=int64#17,>z3=int64#14
# asm 2: xor <z3=%o4,<p01=%l0,>z3=%o4
xor %o4,%l0,%o4

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#9],>p13=int64#9
# asm 2: ldx [<table3=%g4+<p13=%g5],>p13=%g5
ldx [%g4+%g5],%g5

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#12,48,>p20=int64#17
# asm 2: srlx <y2=%o2,48,>p20=%l0
srlx %o2,48,%l0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#10,<p10=int64#18,>z1=int64#10
# asm 2: xor <z1=%o0,<p10=%l1,>z1=%o0
xor %o0,%l1,%o0

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#12,32,>p21=int64#19
# asm 2: srlx <y2=%o2,32,>p21=%l2
srlx %o2,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#12,4080,>p23=int64#20
# asm 2: and <y2=%o2,4080,>p23=%l3
and %o2,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#17],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l0],>p20=%l0
ldx [%i5+%l0],%l0

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#12,16,>p22=int64#12
# asm 2: srl <y2=%o2,16,>p22=%o2
srl %o2,16,%o2

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#14,<p12=int64#18,>tz3=int64#14
# asm 2: xor <z3=%o4,<p12=%l1,>tz3=%o4
xor %o4,%l1,%o4

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#11,48,>p30=int64#19
# asm 2: srlx <y3=%o1,48,>p30=%l2
srlx %o1,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#9,>z2=int64#9
# asm 2: xor <z2=%o7,<p13=%g5,>z2=%g5
xor %o7,%g5,%g5

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#12],>p22=int64#12
# asm 2: ldx [<table2=%g1+<p22=%o2],>p22=%o2
ldx [%g1+%o2],%o2

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#11,32,>p31=int64#16
# asm 2: srlx <y3=%o1,32,>p31=%o7
srlx %o1,32,%o7

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#11,4080,>p33=int64#21
# asm 2: and <y3=%o1,4080,>p33=%l4
and %o1,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#19
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%l2
ldx [%i5+%l2],%l2

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#11,16,>p32=int64#11
# asm 2: srl <y3=%o1,16,>p32=%o1
srl %o1,16,%o1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#16,4080,>p31=int64#16
# asm 2: and <p31=%o7,4080,>p31=%o7
and %o7,4080,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#21
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l4
ldx [%g4+%l4],%l4

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#15,<p11=int64#13,>tz0=int64#13
# asm 2: xor <z0=%o5,<p11=%o3,>tz0=%o3
xor %o5,%o3,%o3

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#16],>p31=int64#15
# asm 2: ldx [<table1=%i0+<p31=%o7],>p31=%o5
ldx [%i0+%o7],%o5

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#10,<p21=int64#18,>tz1=int64#10
# asm 2: xor <z1=%o0,<p21=%l1,>tz1=%o0
xor %o0,%l1,%o0

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#9,<p20=int64#17,>tz2=int64#9
# asm 2: xor <z2=%g5,<p20=%l0,>tz2=%g5
xor %g5,%l0,%g5

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#11],>p32=int64#11
# asm 2: ldx [<table2=%g1+<p32=%o1],>p32=%o1
ldx [%g1+%o1],%o1

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#13,<p22=int64#12,>tz0=int64#12
# asm 2: xor <tz0=%o3,<p22=%o2,>tz0=%o2
xor %o3,%o2,%o2

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#14,<p23=int64#20,>tz3=int64#13
# asm 2: xor <tz3=%o4,<p23=%l3,>tz3=%o3
xor %o4,%l3,%o3

# qhasm: z1 = *(uint64 *) (ctxp + 200)
# asm 1: ldx [<ctxp=int64#2+200],>z1=int64#14
# asm 2: ldx [<ctxp=%i1+200],>z1=%o4
ldx [%i1+200],%o4

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#12,<p33=int64#21,>y0=int64#12
# asm 2: xor <tz0=%o2,<p33=%l4,>y0=%o2
xor %o2,%l4,%o2

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#13,<p30=int64#19,>y3=int64#13
# asm 2: xor <tz3=%o3,<p30=%l2,>y3=%o3
xor %o3,%l2,%o3

# qhasm: z2 = *(uint64 *) (ctxp + 208)
# asm 1: ldx [<ctxp=int64#2+208],>z2=int64#16
# asm 2: ldx [<ctxp=%i1+208],>z2=%o7
ldx [%i1+208],%o7

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#12,48,>p00=int64#17
# asm 2: srlx <y0=%o2,48,>p00=%l0
srlx %o2,48,%l0

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#9,<p31=int64#15,>y2=int64#9
# asm 2: xor <tz2=%g5,<p31=%o5,>y2=%g5
xor %g5,%o5,%g5

# qhasm: z0 = *(uint64 *) (ctxp + 192)
# asm 1: ldx [<ctxp=int64#2+192],>z0=int64#15
# asm 2: ldx [<ctxp=%i1+192],>z0=%o5
ldx [%i1+192],%o5

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#12,32,>p01=int64#18
# asm 2: srlx <y0=%o2,32,>p01=%l1
srlx %o2,32,%l1

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#10,<p32=int64#11,>y1=int64#10
# asm 2: xor <tz1=%o0,<p32=%o1,>y1=%o0
xor %o0,%o1,%o0

# qhasm: z3 = *(uint64 *) (ctxp + 216)
# asm 1: ldx [<ctxp=int64#2+216],>z3=int64#11
# asm 2: ldx [<ctxp=%i1+216],>z3=%o1
ldx [%i1+216],%o1

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#12,16,>p02=int64#19
# asm 2: srl <y0=%o2,16,>p02=%l2
srl %o2,16,%l2

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#12,4080,>p03=int64#12
# asm 2: and <y0=%o2,4080,>p03=%o2
and %o2,4080,%o2

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#17],>p00=int64#17
# asm 2: ldx [<table0=%i5+<p00=%l0],>p00=%l0
ldx [%i5+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#10,48,>p10=int64#20
# asm 2: srlx <y1=%o0,48,>p10=%l3
srlx %o0,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#12],>p03=int64#12
# asm 2: ldx [<table3=%g4+<p03=%o2],>p03=%o2
ldx [%g4+%o2],%o2

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#10,32,>p11=int64#21
# asm 2: srlx <y1=%o0,32,>p11=%l4
srlx %o0,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#19],>p02=int64#19
# asm 2: ldx [<table2=%g1+<p02=%l2],>p02=%l2
ldx [%g1+%l2],%l2

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#10,16,>p12=int64#22
# asm 2: srl <y1=%o0,16,>p12=%l5
srl %o0,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#17,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%l0,>z0=%o5
xor %o5,%l0,%o5

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#18],>p01=int64#17
# asm 2: ldx [<table1=%i0+<p01=%l1],>p01=%l0
ldx [%i0+%l1],%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#14,<p03=int64#12,>z1=int64#12
# asm 2: xor <z1=%o4,<p03=%o2,>z1=%o2
xor %o4,%o2,%o2

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#14
# asm 2: and <p11=%l4,4080,>p11=%o4
and %l4,4080,%o4

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#10,4080,>p13=int64#10
# asm 2: and <y1=%o0,4080,>p13=%o0
and %o0,4080,%o0

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#14],>p11=int64#14
# asm 2: ldx [<table1=%i0+<p11=%o4],>p11=%o4
ldx [%i0+%o4],%o4

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#11,<p01=int64#17,>z3=int64#11
# asm 2: xor <z3=%o1,<p01=%l0,>z3=%o1
xor %o1,%l0,%o1

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#16,<p02=int64#19,>z2=int64#16
# asm 2: xor <z2=%o7,<p02=%l2,>z2=%o7
xor %o7,%l2,%o7

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#10],>p13=int64#10
# asm 2: ldx [<table3=%g4+<p13=%o0],>p13=%o0
ldx [%g4+%o0],%o0

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#9,48,>p20=int64#17
# asm 2: srlx <y2=%g5,48,>p20=%l0
srlx %g5,48,%l0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#12,<p10=int64#18,>z1=int64#12
# asm 2: xor <z1=%o2,<p10=%l1,>z1=%o2
xor %o2,%l1,%o2

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#9,32,>p21=int64#19
# asm 2: srlx <y2=%g5,32,>p21=%l2
srlx %g5,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#9,4080,>p23=int64#20
# asm 2: and <y2=%g5,4080,>p23=%l3
and %g5,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#17],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l0],>p20=%l0
ldx [%i5+%l0],%l0

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#9,16,>p22=int64#9
# asm 2: srl <y2=%g5,16,>p22=%g5
srl %g5,16,%g5

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#11,<p12=int64#18,>tz3=int64#11
# asm 2: xor <z3=%o1,<p12=%l1,>tz3=%o1
xor %o1,%l1,%o1

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#13,48,>p30=int64#19
# asm 2: srlx <y3=%o3,48,>p30=%l2
srlx %o3,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#10,>z2=int64#10
# asm 2: xor <z2=%o7,<p13=%o0,>z2=%o0
xor %o7,%o0,%o0

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#9],>p22=int64#9
# asm 2: ldx [<table2=%g1+<p22=%g5],>p22=%g5
ldx [%g1+%g5],%g5

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#13,32,>p31=int64#16
# asm 2: srlx <y3=%o3,32,>p31=%o7
srlx %o3,32,%o7

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#13,4080,>p33=int64#21
# asm 2: and <y3=%o3,4080,>p33=%l4
and %o3,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#19
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%l2
ldx [%i5+%l2],%l2

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#13,16,>p32=int64#13
# asm 2: srl <y3=%o3,16,>p32=%o3
srl %o3,16,%o3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#16,4080,>p31=int64#16
# asm 2: and <p31=%o7,4080,>p31=%o7
and %o7,4080,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#21
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l4
ldx [%g4+%l4],%l4

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#15,<p11=int64#14,>tz0=int64#14
# asm 2: xor <z0=%o5,<p11=%o4,>tz0=%o4
xor %o5,%o4,%o4

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#16],>p31=int64#15
# asm 2: ldx [<table1=%i0+<p31=%o7],>p31=%o5
ldx [%i0+%o7],%o5

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#12,<p21=int64#18,>tz1=int64#12
# asm 2: xor <z1=%o2,<p21=%l1,>tz1=%o2
xor %o2,%l1,%o2

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#10,<p20=int64#17,>tz2=int64#10
# asm 2: xor <z2=%o0,<p20=%l0,>tz2=%o0
xor %o0,%l0,%o0

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#13],>p32=int64#13
# asm 2: ldx [<table2=%g1+<p32=%o3],>p32=%o3
ldx [%g1+%o3],%o3

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#14,<p22=int64#9,>tz0=int64#9
# asm 2: xor <tz0=%o4,<p22=%g5,>tz0=%g5
xor %o4,%g5,%g5

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#11,<p23=int64#20,>tz3=int64#11
# asm 2: xor <tz3=%o1,<p23=%l3,>tz3=%o1
xor %o1,%l3,%o1

# qhasm: z1 = *(uint64 *) (ctxp + 232)
# asm 1: ldx [<ctxp=int64#2+232],>z1=int64#14
# asm 2: ldx [<ctxp=%i1+232],>z1=%o4
ldx [%i1+232],%o4

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#9,<p33=int64#21,>y0=int64#9
# asm 2: xor <tz0=%g5,<p33=%l4,>y0=%g5
xor %g5,%l4,%g5

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#11,<p30=int64#19,>y3=int64#11
# asm 2: xor <tz3=%o1,<p30=%l2,>y3=%o1
xor %o1,%l2,%o1

# qhasm: z2 = *(uint64 *) (ctxp + 240)
# asm 1: ldx [<ctxp=int64#2+240],>z2=int64#16
# asm 2: ldx [<ctxp=%i1+240],>z2=%o7
ldx [%i1+240],%o7

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#9,48,>p00=int64#17
# asm 2: srlx <y0=%g5,48,>p00=%l0
srlx %g5,48,%l0

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#10,<p31=int64#15,>y2=int64#10
# asm 2: xor <tz2=%o0,<p31=%o5,>y2=%o0
xor %o0,%o5,%o0

# qhasm: z0 = *(uint64 *) (ctxp + 224)
# asm 1: ldx [<ctxp=int64#2+224],>z0=int64#15
# asm 2: ldx [<ctxp=%i1+224],>z0=%o5
ldx [%i1+224],%o5

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#9,32,>p01=int64#18
# asm 2: srlx <y0=%g5,32,>p01=%l1
srlx %g5,32,%l1

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#12,<p32=int64#13,>y1=int64#12
# asm 2: xor <tz1=%o2,<p32=%o3,>y1=%o2
xor %o2,%o3,%o2

# qhasm: z3 = *(uint64 *) (ctxp + 248)
# asm 1: ldx [<ctxp=int64#2+248],>z3=int64#13
# asm 2: ldx [<ctxp=%i1+248],>z3=%o3
ldx [%i1+248],%o3

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#9,16,>p02=int64#19
# asm 2: srl <y0=%g5,16,>p02=%l2
srl %g5,16,%l2

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#9,4080,>p03=int64#9
# asm 2: and <y0=%g5,4080,>p03=%g5
and %g5,4080,%g5

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#17],>p00=int64#17
# asm 2: ldx [<table0=%i5+<p00=%l0],>p00=%l0
ldx [%i5+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#12,48,>p10=int64#20
# asm 2: srlx <y1=%o2,48,>p10=%l3
srlx %o2,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#9],>p03=int64#9
# asm 2: ldx [<table3=%g4+<p03=%g5],>p03=%g5
ldx [%g4+%g5],%g5

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#12,32,>p11=int64#21
# asm 2: srlx <y1=%o2,32,>p11=%l4
srlx %o2,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#19],>p02=int64#19
# asm 2: ldx [<table2=%g1+<p02=%l2],>p02=%l2
ldx [%g1+%l2],%l2

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#12,16,>p12=int64#22
# asm 2: srl <y1=%o2,16,>p12=%l5
srl %o2,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#17,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%l0,>z0=%o5
xor %o5,%l0,%o5

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#18],>p01=int64#17
# asm 2: ldx [<table1=%i0+<p01=%l1],>p01=%l0
ldx [%i0+%l1],%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#14,<p03=int64#9,>z1=int64#9
# asm 2: xor <z1=%o4,<p03=%g5,>z1=%g5
xor %o4,%g5,%g5

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#14
# asm 2: and <p11=%l4,4080,>p11=%o4
and %l4,4080,%o4

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#12,4080,>p13=int64#12
# asm 2: and <y1=%o2,4080,>p13=%o2
and %o2,4080,%o2

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#14],>p11=int64#14
# asm 2: ldx [<table1=%i0+<p11=%o4],>p11=%o4
ldx [%i0+%o4],%o4

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#13,<p01=int64#17,>z3=int64#13
# asm 2: xor <z3=%o3,<p01=%l0,>z3=%o3
xor %o3,%l0,%o3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#16,<p02=int64#19,>z2=int64#16
# asm 2: xor <z2=%o7,<p02=%l2,>z2=%o7
xor %o7,%l2,%o7

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#12],>p13=int64#12
# asm 2: ldx [<table3=%g4+<p13=%o2],>p13=%o2
ldx [%g4+%o2],%o2

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#10,48,>p20=int64#17
# asm 2: srlx <y2=%o0,48,>p20=%l0
srlx %o0,48,%l0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#9,<p10=int64#18,>z1=int64#9
# asm 2: xor <z1=%g5,<p10=%l1,>z1=%g5
xor %g5,%l1,%g5

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#10,32,>p21=int64#19
# asm 2: srlx <y2=%o0,32,>p21=%l2
srlx %o0,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#10,4080,>p23=int64#20
# asm 2: and <y2=%o0,4080,>p23=%l3
and %o0,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#17],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l0],>p20=%l0
ldx [%i5+%l0],%l0

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#10,16,>p22=int64#10
# asm 2: srl <y2=%o0,16,>p22=%o0
srl %o0,16,%o0

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#13,<p12=int64#18,>tz3=int64#13
# asm 2: xor <z3=%o3,<p12=%l1,>tz3=%o3
xor %o3,%l1,%o3

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#11,48,>p30=int64#19
# asm 2: srlx <y3=%o1,48,>p30=%l2
srlx %o1,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#12,>z2=int64#12
# asm 2: xor <z2=%o7,<p13=%o2,>z2=%o2
xor %o7,%o2,%o2

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#10],>p22=int64#10
# asm 2: ldx [<table2=%g1+<p22=%o0],>p22=%o0
ldx [%g1+%o0],%o0

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#11,32,>p31=int64#16
# asm 2: srlx <y3=%o1,32,>p31=%o7
srlx %o1,32,%o7

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#11,4080,>p33=int64#21
# asm 2: and <y3=%o1,4080,>p33=%l4
and %o1,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#19
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%l2
ldx [%i5+%l2],%l2

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#11,16,>p32=int64#11
# asm 2: srl <y3=%o1,16,>p32=%o1
srl %o1,16,%o1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#16,4080,>p31=int64#16
# asm 2: and <p31=%o7,4080,>p31=%o7
and %o7,4080,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#21
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l4
ldx [%g4+%l4],%l4

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#15,<p11=int64#14,>tz0=int64#14
# asm 2: xor <z0=%o5,<p11=%o4,>tz0=%o4
xor %o5,%o4,%o4

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#16],>p31=int64#15
# asm 2: ldx [<table1=%i0+<p31=%o7],>p31=%o5
ldx [%i0+%o7],%o5

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#9,<p21=int64#18,>tz1=int64#9
# asm 2: xor <z1=%g5,<p21=%l1,>tz1=%g5
xor %g5,%l1,%g5

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#12,<p20=int64#17,>tz2=int64#12
# asm 2: xor <z2=%o2,<p20=%l0,>tz2=%o2
xor %o2,%l0,%o2

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#11],>p32=int64#11
# asm 2: ldx [<table2=%g1+<p32=%o1],>p32=%o1
ldx [%g1+%o1],%o1

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#14,<p22=int64#10,>tz0=int64#10
# asm 2: xor <tz0=%o4,<p22=%o0,>tz0=%o0
xor %o4,%o0,%o0

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#13,<p23=int64#20,>tz3=int64#13
# asm 2: xor <tz3=%o3,<p23=%l3,>tz3=%o3
xor %o3,%l3,%o3

# qhasm: z1 = *(uint64 *) (ctxp + 264)
# asm 1: ldx [<ctxp=int64#2+264],>z1=int64#14
# asm 2: ldx [<ctxp=%i1+264],>z1=%o4
ldx [%i1+264],%o4

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#10,<p33=int64#21,>y0=int64#10
# asm 2: xor <tz0=%o0,<p33=%l4,>y0=%o0
xor %o0,%l4,%o0

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#13,<p30=int64#19,>y3=int64#13
# asm 2: xor <tz3=%o3,<p30=%l2,>y3=%o3
xor %o3,%l2,%o3

# qhasm: z2 = *(uint64 *) (ctxp + 272)
# asm 1: ldx [<ctxp=int64#2+272],>z2=int64#16
# asm 2: ldx [<ctxp=%i1+272],>z2=%o7
ldx [%i1+272],%o7

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#10,48,>p00=int64#17
# asm 2: srlx <y0=%o0,48,>p00=%l0
srlx %o0,48,%l0

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#12,<p31=int64#15,>y2=int64#12
# asm 2: xor <tz2=%o2,<p31=%o5,>y2=%o2
xor %o2,%o5,%o2

# qhasm: z0 = *(uint64 *) (ctxp + 256)
# asm 1: ldx [<ctxp=int64#2+256],>z0=int64#15
# asm 2: ldx [<ctxp=%i1+256],>z0=%o5
ldx [%i1+256],%o5

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#10,32,>p01=int64#18
# asm 2: srlx <y0=%o0,32,>p01=%l1
srlx %o0,32,%l1

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#9,<p32=int64#11,>y1=int64#9
# asm 2: xor <tz1=%g5,<p32=%o1,>y1=%g5
xor %g5,%o1,%g5

# qhasm: z3 = *(uint64 *) (ctxp + 280)
# asm 1: ldx [<ctxp=int64#2+280],>z3=int64#11
# asm 2: ldx [<ctxp=%i1+280],>z3=%o1
ldx [%i1+280],%o1

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#10,16,>p02=int64#19
# asm 2: srl <y0=%o0,16,>p02=%l2
srl %o0,16,%l2

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#10,4080,>p03=int64#10
# asm 2: and <y0=%o0,4080,>p03=%o0
and %o0,4080,%o0

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#17],>p00=int64#17
# asm 2: ldx [<table0=%i5+<p00=%l0],>p00=%l0
ldx [%i5+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#9,48,>p10=int64#20
# asm 2: srlx <y1=%g5,48,>p10=%l3
srlx %g5,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#10],>p03=int64#10
# asm 2: ldx [<table3=%g4+<p03=%o0],>p03=%o0
ldx [%g4+%o0],%o0

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#9,32,>p11=int64#21
# asm 2: srlx <y1=%g5,32,>p11=%l4
srlx %g5,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#19],>p02=int64#19
# asm 2: ldx [<table2=%g1+<p02=%l2],>p02=%l2
ldx [%g1+%l2],%l2

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#9,16,>p12=int64#22
# asm 2: srl <y1=%g5,16,>p12=%l5
srl %g5,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#17,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%l0,>z0=%o5
xor %o5,%l0,%o5

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#18],>p01=int64#17
# asm 2: ldx [<table1=%i0+<p01=%l1],>p01=%l0
ldx [%i0+%l1],%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#14,<p03=int64#10,>z1=int64#10
# asm 2: xor <z1=%o4,<p03=%o0,>z1=%o0
xor %o4,%o0,%o0

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#14
# asm 2: and <p11=%l4,4080,>p11=%o4
and %l4,4080,%o4

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#9,4080,>p13=int64#9
# asm 2: and <y1=%g5,4080,>p13=%g5
and %g5,4080,%g5

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#14],>p11=int64#14
# asm 2: ldx [<table1=%i0+<p11=%o4],>p11=%o4
ldx [%i0+%o4],%o4

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#11,<p01=int64#17,>z3=int64#11
# asm 2: xor <z3=%o1,<p01=%l0,>z3=%o1
xor %o1,%l0,%o1

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#16,<p02=int64#19,>z2=int64#16
# asm 2: xor <z2=%o7,<p02=%l2,>z2=%o7
xor %o7,%l2,%o7

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#9],>p13=int64#9
# asm 2: ldx [<table3=%g4+<p13=%g5],>p13=%g5
ldx [%g4+%g5],%g5

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#12,48,>p20=int64#17
# asm 2: srlx <y2=%o2,48,>p20=%l0
srlx %o2,48,%l0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#10,<p10=int64#18,>z1=int64#10
# asm 2: xor <z1=%o0,<p10=%l1,>z1=%o0
xor %o0,%l1,%o0

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#12,32,>p21=int64#19
# asm 2: srlx <y2=%o2,32,>p21=%l2
srlx %o2,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#12,4080,>p23=int64#20
# asm 2: and <y2=%o2,4080,>p23=%l3
and %o2,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#17],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l0],>p20=%l0
ldx [%i5+%l0],%l0

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#12,16,>p22=int64#12
# asm 2: srl <y2=%o2,16,>p22=%o2
srl %o2,16,%o2

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#11,<p12=int64#18,>tz3=int64#11
# asm 2: xor <z3=%o1,<p12=%l1,>tz3=%o1
xor %o1,%l1,%o1

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#13,48,>p30=int64#19
# asm 2: srlx <y3=%o3,48,>p30=%l2
srlx %o3,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#9,>z2=int64#9
# asm 2: xor <z2=%o7,<p13=%g5,>z2=%g5
xor %o7,%g5,%g5

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#12],>p22=int64#12
# asm 2: ldx [<table2=%g1+<p22=%o2],>p22=%o2
ldx [%g1+%o2],%o2

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#13,32,>p31=int64#16
# asm 2: srlx <y3=%o3,32,>p31=%o7
srlx %o3,32,%o7

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#13,4080,>p33=int64#21
# asm 2: and <y3=%o3,4080,>p33=%l4
and %o3,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#19
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%l2
ldx [%i5+%l2],%l2

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#13,16,>p32=int64#13
# asm 2: srl <y3=%o3,16,>p32=%o3
srl %o3,16,%o3

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#16,4080,>p31=int64#16
# asm 2: and <p31=%o7,4080,>p31=%o7
and %o7,4080,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#21
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l4
ldx [%g4+%l4],%l4

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#15,<p11=int64#14,>tz0=int64#14
# asm 2: xor <z0=%o5,<p11=%o4,>tz0=%o4
xor %o5,%o4,%o4

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#16],>p31=int64#15
# asm 2: ldx [<table1=%i0+<p31=%o7],>p31=%o5
ldx [%i0+%o7],%o5

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#10,<p21=int64#18,>tz1=int64#10
# asm 2: xor <z1=%o0,<p21=%l1,>tz1=%o0
xor %o0,%l1,%o0

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#9,<p20=int64#17,>tz2=int64#9
# asm 2: xor <z2=%g5,<p20=%l0,>tz2=%g5
xor %g5,%l0,%g5

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#13],>p32=int64#13
# asm 2: ldx [<table2=%g1+<p32=%o3],>p32=%o3
ldx [%g1+%o3],%o3

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#14,<p22=int64#12,>tz0=int64#12
# asm 2: xor <tz0=%o4,<p22=%o2,>tz0=%o2
xor %o4,%o2,%o2

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#11,<p23=int64#20,>tz3=int64#11
# asm 2: xor <tz3=%o1,<p23=%l3,>tz3=%o1
xor %o1,%l3,%o1

# qhasm: z1 = *(uint64 *) (ctxp + 296)
# asm 1: ldx [<ctxp=int64#2+296],>z1=int64#14
# asm 2: ldx [<ctxp=%i1+296],>z1=%o4
ldx [%i1+296],%o4

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#12,<p33=int64#21,>y0=int64#12
# asm 2: xor <tz0=%o2,<p33=%l4,>y0=%o2
xor %o2,%l4,%o2

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#11,<p30=int64#19,>y3=int64#11
# asm 2: xor <tz3=%o1,<p30=%l2,>y3=%o1
xor %o1,%l2,%o1

# qhasm: z2 = *(uint64 *) (ctxp + 304)
# asm 1: ldx [<ctxp=int64#2+304],>z2=int64#16
# asm 2: ldx [<ctxp=%i1+304],>z2=%o7
ldx [%i1+304],%o7

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#12,48,>p00=int64#17
# asm 2: srlx <y0=%o2,48,>p00=%l0
srlx %o2,48,%l0

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#9,<p31=int64#15,>y2=int64#9
# asm 2: xor <tz2=%g5,<p31=%o5,>y2=%g5
xor %g5,%o5,%g5

# qhasm: z0 = *(uint64 *) (ctxp + 288)
# asm 1: ldx [<ctxp=int64#2+288],>z0=int64#15
# asm 2: ldx [<ctxp=%i1+288],>z0=%o5
ldx [%i1+288],%o5

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#12,32,>p01=int64#18
# asm 2: srlx <y0=%o2,32,>p01=%l1
srlx %o2,32,%l1

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#10,<p32=int64#13,>y1=int64#10
# asm 2: xor <tz1=%o0,<p32=%o3,>y1=%o0
xor %o0,%o3,%o0

# qhasm: z3 = *(uint64 *) (ctxp + 312)
# asm 1: ldx [<ctxp=int64#2+312],>z3=int64#13
# asm 2: ldx [<ctxp=%i1+312],>z3=%o3
ldx [%i1+312],%o3

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#12,16,>p02=int64#19
# asm 2: srl <y0=%o2,16,>p02=%l2
srl %o2,16,%l2

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#12,4080,>p03=int64#12
# asm 2: and <y0=%o2,4080,>p03=%o2
and %o2,4080,%o2

# qhasm: p00 = *(uint64 *) (table0 + p00)
# asm 1: ldx [<table0=int64#6+<p00=int64#17],>p00=int64#17
# asm 2: ldx [<table0=%i5+<p00=%l0],>p00=%l0
ldx [%i5+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#10,48,>p10=int64#20
# asm 2: srlx <y1=%o0,48,>p10=%l3
srlx %o0,48,%l3

# qhasm: p03 = *(uint64 *) (table3 + p03)
# asm 1: ldx [<table3=int64#8+<p03=int64#12],>p03=int64#12
# asm 2: ldx [<table3=%g4+<p03=%o2],>p03=%o2
ldx [%g4+%o2],%o2

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#10,32,>p11=int64#21
# asm 2: srlx <y1=%o0,32,>p11=%l4
srlx %o0,32,%l4

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#18,4080,>p01=int64#18
# asm 2: and <p01=%l1,4080,>p01=%l1
and %l1,4080,%l1

# qhasm: p02 = *(uint64 *) (table2 + p02)
# asm 1: ldx [<table2=int64#7+<p02=int64#19],>p02=int64#19
# asm 2: ldx [<table2=%g1+<p02=%l2],>p02=%l2
ldx [%g1+%l2],%l2

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#10,16,>p12=int64#22
# asm 2: srl <y1=%o0,16,>p12=%l5
srl %o0,16,%l5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#15,<p00=int64#17,>z0=int64#15
# asm 2: xor <z0=%o5,<p00=%l0,>z0=%o5
xor %o5,%l0,%o5

# qhasm: p01 = *(uint64 *) (table1 + p01)
# asm 1: ldx [<table1=int64#1+<p01=int64#18],>p01=int64#17
# asm 2: ldx [<table1=%i0+<p01=%l1],>p01=%l0
ldx [%i0+%l1],%l0

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#14,<p03=int64#12,>z1=int64#12
# asm 2: xor <z1=%o4,<p03=%o2,>z1=%o2
xor %o4,%o2,%o2

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#21,4080,>p11=int64#14
# asm 2: and <p11=%l4,4080,>p11=%o4
and %l4,4080,%o4

# qhasm: p10 = *(uint64 *) (table0 + p10)
# asm 1: ldx [<table0=int64#6+<p10=int64#20],>p10=int64#18
# asm 2: ldx [<table0=%i5+<p10=%l3],>p10=%l1
ldx [%i5+%l3],%l1

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#10,4080,>p13=int64#10
# asm 2: and <y1=%o0,4080,>p13=%o0
and %o0,4080,%o0

# qhasm: p11 = *(uint64 *) (table1 + p11)
# asm 1: ldx [<table1=int64#1+<p11=int64#14],>p11=int64#14
# asm 2: ldx [<table1=%i0+<p11=%o4],>p11=%o4
ldx [%i0+%o4],%o4

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#13,<p01=int64#17,>z3=int64#13
# asm 2: xor <z3=%o3,<p01=%l0,>z3=%o3
xor %o3,%l0,%o3

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#16,<p02=int64#19,>z2=int64#16
# asm 2: xor <z2=%o7,<p02=%l2,>z2=%o7
xor %o7,%l2,%o7

# qhasm: p13 = *(uint64 *) (table3 + p13)
# asm 1: ldx [<table3=int64#8+<p13=int64#10],>p13=int64#10
# asm 2: ldx [<table3=%g4+<p13=%o0],>p13=%o0
ldx [%g4+%o0],%o0

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#9,48,>p20=int64#17
# asm 2: srlx <y2=%g5,48,>p20=%l0
srlx %g5,48,%l0

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#12,<p10=int64#18,>z1=int64#12
# asm 2: xor <z1=%o2,<p10=%l1,>z1=%o2
xor %o2,%l1,%o2

# qhasm: p12 = *(uint64 *) (table2 + p12)
# asm 1: ldx [<table2=int64#7+<p12=int64#22],>p12=int64#18
# asm 2: ldx [<table2=%g1+<p12=%l5],>p12=%l1
ldx [%g1+%l5],%l1

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#9,32,>p21=int64#19
# asm 2: srlx <y2=%g5,32,>p21=%l2
srlx %g5,32,%l2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#9,4080,>p23=int64#20
# asm 2: and <y2=%g5,4080,>p23=%l3
and %g5,4080,%l3

# qhasm: p20 = *(uint64 *) (table0 + p20)
# asm 1: ldx [<table0=int64#6+<p20=int64#17],>p20=int64#17
# asm 2: ldx [<table0=%i5+<p20=%l0],>p20=%l0
ldx [%i5+%l0],%l0

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#9,16,>p22=int64#9
# asm 2: srl <y2=%g5,16,>p22=%g5
srl %g5,16,%g5

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#19,4080,>p21=int64#19
# asm 2: and <p21=%l2,4080,>p21=%l2
and %l2,4080,%l2

# qhasm: p23 = *(uint64 *) (table3 + p23)
# asm 1: ldx [<table3=int64#8+<p23=int64#20],>p23=int64#20
# asm 2: ldx [<table3=%g4+<p23=%l3],>p23=%l3
ldx [%g4+%l3],%l3

# qhasm: tz3 = z3 ^ p12
# asm 1: xor <z3=int64#13,<p12=int64#18,>tz3=int64#13
# asm 2: xor <z3=%o3,<p12=%l1,>tz3=%o3
xor %o3,%l1,%o3

# qhasm: p21 = *(uint64 *) (table1 + p21)
# asm 1: ldx [<table1=int64#1+<p21=int64#19],>p21=int64#18
# asm 2: ldx [<table1=%i0+<p21=%l2],>p21=%l1
ldx [%i0+%l2],%l1

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#11,48,>p30=int64#19
# asm 2: srlx <y3=%o1,48,>p30=%l2
srlx %o1,48,%l2

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#16,<p13=int64#10,>z2=int64#10
# asm 2: xor <z2=%o7,<p13=%o0,>z2=%o0
xor %o7,%o0,%o0

# qhasm: p22 = *(uint64 *) (table2 + p22)
# asm 1: ldx [<table2=int64#7+<p22=int64#9],>p22=int64#9
# asm 2: ldx [<table2=%g1+<p22=%g5],>p22=%g5
ldx [%g1+%g5],%g5

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#11,32,>p31=int64#16
# asm 2: srlx <y3=%o1,32,>p31=%o7
srlx %o1,32,%o7

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#11,4080,>p33=int64#21
# asm 2: and <y3=%o1,4080,>p33=%l4
and %o1,4080,%l4

# qhasm: p30 = *(uint64 *) (table0 + p30)
# asm 1: ldx [<table0=int64#6+<p30=int64#19],>p30=int64#6
# asm 2: ldx [<table0=%i5+<p30=%l2],>p30=%i5
ldx [%i5+%l2],%i5

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#11,16,>p32=int64#11
# asm 2: srl <y3=%o1,16,>p32=%o1
srl %o1,16,%o1

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#16,4080,>p31=int64#16
# asm 2: and <p31=%o7,4080,>p31=%o7
and %o7,4080,%o7

# qhasm: p33 = *(uint64 *) (table3 + p33)
# asm 1: ldx [<table3=int64#8+<p33=int64#21],>p33=int64#19
# asm 2: ldx [<table3=%g4+<p33=%l4],>p33=%l2
ldx [%g4+%l4],%l2

# qhasm: tz0 = z0 ^ p11
# asm 1: xor <z0=int64#15,<p11=int64#14,>tz0=int64#14
# asm 2: xor <z0=%o5,<p11=%o4,>tz0=%o4
xor %o5,%o4,%o4

# qhasm: p31 = *(uint64 *) (table1 + p31)
# asm 1: ldx [<table1=int64#1+<p31=int64#16],>p31=int64#1
# asm 2: ldx [<table1=%i0+<p31=%o7],>p31=%i0
ldx [%i0+%o7],%i0

# qhasm: tz1 = z1 ^ p21
# asm 1: xor <z1=int64#12,<p21=int64#18,>tz1=int64#12
# asm 2: xor <z1=%o2,<p21=%l1,>tz1=%o2
xor %o2,%l1,%o2

# qhasm: tz2 = z2 ^ p20
# asm 1: xor <z2=int64#10,<p20=int64#17,>tz2=int64#10
# asm 2: xor <z2=%o0,<p20=%l0,>tz2=%o0
xor %o0,%l0,%o0

# qhasm: p32 = *(uint64 *) (table2 + p32)
# asm 1: ldx [<table2=int64#7+<p32=int64#11],>p32=int64#7
# asm 2: ldx [<table2=%g1+<p32=%o1],>p32=%g1
ldx [%g1+%o1],%g1

# qhasm: tz0 ^= p22
# asm 1: xor <tz0=int64#14,<p22=int64#9,>tz0=int64#9
# asm 2: xor <tz0=%o4,<p22=%g5,>tz0=%g5
xor %o4,%g5,%g5

# qhasm: tz3 ^= p23
# asm 1: xor <tz3=int64#13,<p23=int64#20,>tz3=int64#11
# asm 2: xor <tz3=%o3,<p23=%l3,>tz3=%o1
xor %o3,%l3,%o1

# qhasm: z1 = *(uint64 *) (ctxp + 328)
# asm 1: ldx [<ctxp=int64#2+328],>z1=int64#13
# asm 2: ldx [<ctxp=%i1+328],>z1=%o3
ldx [%i1+328],%o3

# qhasm: y0 = tz0 ^ p33
# asm 1: xor <tz0=int64#9,<p33=int64#19,>y0=int64#9
# asm 2: xor <tz0=%g5,<p33=%l2,>y0=%g5
xor %g5,%l2,%g5

# qhasm: y3 = tz3 ^ p30
# asm 1: xor <tz3=int64#11,<p30=int64#6,>y3=int64#6
# asm 2: xor <tz3=%o1,<p30=%i5,>y3=%i5
xor %o1,%i5,%i5

# qhasm: z2 = *(uint64 *) (ctxp + 336)
# asm 1: ldx [<ctxp=int64#2+336],>z2=int64#11
# asm 2: ldx [<ctxp=%i1+336],>z2=%o1
ldx [%i1+336],%o1

# qhasm: y2 = tz2 ^ p31
# asm 1: xor <tz2=int64#10,<p31=int64#1,>y2=int64#1
# asm 2: xor <tz2=%o0,<p31=%i0,>y2=%i0
xor %o0,%i0,%i0

# qhasm: y1 = tz1 ^ p32
# asm 1: xor <tz1=int64#12,<p32=int64#7,>y1=int64#7
# asm 2: xor <tz1=%o2,<p32=%g1,>y1=%g1
xor %o2,%g1,%g1

# qhasm: z0 = *(uint64 *) (ctxp + 320)
# asm 1: ldx [<ctxp=int64#2+320],>z0=int64#10
# asm 2: ldx [<ctxp=%i1+320],>z0=%o0
ldx [%i1+320],%o0

# qhasm: last_round:
._last_round:

# qhasm: p00 = (uint64) y0 >> 48
# asm 1: srlx <y0=int64#9,48,>p00=int64#12
# asm 2: srlx <y0=%g5,48,>p00=%o2
srlx %g5,48,%o2

# qhasm: table0 = table3 + 4088
# asm 1: add <table3=int64#8,4088,>table0=int64#14
# asm 2: add <table3=%g4,4088,>table0=%o4
add %g4,4088,%o4

# qhasm: z3 = *(uint64 *) (ctxp + 344)
# asm 1: ldx [<ctxp=int64#2+344],>z3=int64#8
# asm 2: ldx [<ctxp=%i1+344],>z3=%g4
ldx [%i1+344],%g4

# qhasm: p02 = (uint32) y0 >> 16
# asm 1: srl <y0=int64#9,16,>p02=int64#15
# asm 2: srl <y0=%g5,16,>p02=%o5
srl %g5,16,%o5

# qhasm: table2 = table0 + 4
# asm 1: add <table0=int64#14,4,>table2=int64#16
# asm 2: add <table0=%o4,4,>table2=%o7
add %o4,4,%o7

# qhasm: p03 = y0 & 4080
# asm 1: and <y0=int64#9,4080,>p03=int64#17
# asm 2: and <y0=%g5,4080,>p03=%l0
and %g5,4080,%l0

# qhasm: table1 = table2 + 4
# asm 1: add <table2=int64#16,4,>table1=int64#18
# asm 2: add <table2=%o7,4,>table1=%l1
add %o7,4,%l1

# qhasm: p00 = *(uint32 *) (table2 + p00)
# asm 1: lduw [<table2=int64#16+<p00=int64#12],>p00=int64#12
# asm 2: lduw [<table2=%o7+<p00=%o2],>p00=%o2
lduw [%o7+%o2],%o2

# qhasm: p01 = (uint64) y0 >> 32
# asm 1: srlx <y0=int64#9,32,>p01=int64#9
# asm 2: srlx <y0=%g5,32,>p01=%g5
srlx %g5,32,%g5

# qhasm: p03 = *(uint32 *) (table1 + p03)
# asm 1: lduw [<table1=int64#18+<p03=int64#17],>p03=int64#17
# asm 2: lduw [<table1=%l1+<p03=%l0],>p03=%l0
lduw [%l1+%l0],%l0

# qhasm: p10 = (uint64) y1 >> 48
# asm 1: srlx <y1=int64#7,48,>p10=int64#19
# asm 2: srlx <y1=%g1,48,>p10=%l2
srlx %g1,48,%l2

# qhasm: table3 = table1 + 4
# asm 1: add <table1=int64#18,4,>table3=int64#20
# asm 2: add <table1=%l1,4,>table3=%l3
add %l1,4,%l3

# qhasm: p02 = *(uint32 *) (table0 + p02)
# asm 1: lduw [<table0=int64#14+<p02=int64#15],>p02=int64#15
# asm 2: lduw [<table0=%o4+<p02=%o5],>p02=%o5
lduw [%o4+%o5],%o5

# qhasm: z0 ^= p00
# asm 1: xor <z0=int64#10,<p00=int64#12,>z0=int64#10
# asm 2: xor <z0=%o0,<p00=%o2,>z0=%o0
xor %o0,%o2,%o0

# qhasm: p01 &= 4080
# asm 1: and <p01=int64#9,4080,>p01=int64#9
# asm 2: and <p01=%g5,4080,>p01=%g5
and %g5,4080,%g5

# qhasm: p11 = (uint64) y1 >> 32
# asm 1: srlx <y1=int64#7,32,>p11=int64#12
# asm 2: srlx <y1=%g1,32,>p11=%o2
srlx %g1,32,%o2

# qhasm: z1 ^= p03
# asm 1: xor <z1=int64#13,<p03=int64#17,>z1=int64#13
# asm 2: xor <z1=%o3,<p03=%l0,>z1=%o3
xor %o3,%l0,%o3

# qhasm: p01 = *(uint32 *) (table3 + p01)
# asm 1: lduw [<table3=int64#20+<p01=int64#9],>p01=int64#9
# asm 2: lduw [<table3=%l3+<p01=%g5],>p01=%g5
lduw [%l3+%g5],%g5

# qhasm: p12 = (uint32) y1 >> 16
# asm 1: srl <y1=int64#7,16,>p12=int64#17
# asm 2: srl <y1=%g1,16,>p12=%l0
srl %g1,16,%l0

# qhasm: p13 = y1 & 4080
# asm 1: and <y1=int64#7,4080,>p13=int64#7
# asm 2: and <y1=%g1,4080,>p13=%g1
and %g1,4080,%g1

# qhasm: p10 = *(uint32 *) (table2 + p10)
# asm 1: lduw [<table2=int64#16+<p10=int64#19],>p10=int64#19
# asm 2: lduw [<table2=%o7+<p10=%l2],>p10=%l2
lduw [%o7+%l2],%l2

# qhasm: p11 &= 4080
# asm 1: and <p11=int64#12,4080,>p11=int64#12
# asm 2: and <p11=%o2,4080,>p11=%o2
and %o2,4080,%o2

# qhasm: z2 ^= p02
# asm 1: xor <z2=int64#11,<p02=int64#15,>z2=int64#11
# asm 2: xor <z2=%o1,<p02=%o5,>z2=%o1
xor %o1,%o5,%o1

# qhasm: p13 = *(uint32 *) (table1 + p13)
# asm 1: lduw [<table1=int64#18+<p13=int64#7],>p13=int64#7
# asm 2: lduw [<table1=%l1+<p13=%g1],>p13=%g1
lduw [%l1+%g1],%g1

# qhasm: z3 ^= p01
# asm 1: xor <z3=int64#8,<p01=int64#9,>z3=int64#8
# asm 2: xor <z3=%g4,<p01=%g5,>z3=%g4
xor %g4,%g5,%g4

# qhasm: p11 = *(uint32 *) (table3 + p11)
# asm 1: lduw [<table3=int64#20+<p11=int64#12],>p11=int64#9
# asm 2: lduw [<table3=%l3+<p11=%o2],>p11=%g5
lduw [%l3+%o2],%g5

# qhasm: p20 = (uint64) y2 >> 48
# asm 1: srlx <y2=int64#1,48,>p20=int64#12
# asm 2: srlx <y2=%i0,48,>p20=%o2
srlx %i0,48,%o2

# qhasm: p23 = y2 & 4080
# asm 1: and <y2=int64#1,4080,>p23=int64#15
# asm 2: and <y2=%i0,4080,>p23=%o5
and %i0,4080,%o5

# qhasm: p12 = *(uint32 *) (table0 + p12)
# asm 1: lduw [<table0=int64#14+<p12=int64#17],>p12=int64#17
# asm 2: lduw [<table0=%o4+<p12=%l0],>p12=%l0
lduw [%o4+%l0],%l0

# qhasm: p21 = (uint64) y2 >> 32
# asm 1: srlx <y2=int64#1,32,>p21=int64#21
# asm 2: srlx <y2=%i0,32,>p21=%l4
srlx %i0,32,%l4

# qhasm: z2 ^= p13
# asm 1: xor <z2=int64#11,<p13=int64#7,>z2=int64#7
# asm 2: xor <z2=%o1,<p13=%g1,>z2=%g1
xor %o1,%g1,%g1

# qhasm: p20 = *(uint32 *) (table2 + p20)
# asm 1: lduw [<table2=int64#16+<p20=int64#12],>p20=int64#11
# asm 2: lduw [<table2=%o7+<p20=%o2],>p20=%o1
lduw [%o7+%o2],%o1

# qhasm: z0 ^= p11
# asm 1: xor <z0=int64#10,<p11=int64#9,>z0=int64#9
# asm 2: xor <z0=%o0,<p11=%g5,>z0=%g5
xor %o0,%g5,%g5

# qhasm: p21 &= 4080
# asm 1: and <p21=int64#21,4080,>p21=int64#10
# asm 2: and <p21=%l4,4080,>p21=%o0
and %l4,4080,%o0

# qhasm: p23 = *(uint32 *) (table1 + p23)
# asm 1: lduw [<table1=int64#18+<p23=int64#15],>p23=int64#12
# asm 2: lduw [<table1=%l1+<p23=%o5],>p23=%o2
lduw [%l1+%o5],%o2

# qhasm: p22 = (uint32) y2 >> 16
# asm 1: srl <y2=int64#1,16,>p22=int64#1
# asm 2: srl <y2=%i0,16,>p22=%i0
srl %i0,16,%i0

# qhasm: z3 ^= p12
# asm 1: xor <z3=int64#8,<p12=int64#17,>z3=int64#8
# asm 2: xor <z3=%g4,<p12=%l0,>z3=%g4
xor %g4,%l0,%g4

# qhasm: z1 ^= p10
# asm 1: xor <z1=int64#13,<p10=int64#19,>z1=int64#13
# asm 2: xor <z1=%o3,<p10=%l2,>z1=%o3
xor %o3,%l2,%o3

# qhasm: p21 = *(uint32 *) (table3 + p21)
# asm 1: lduw [<table3=int64#20+<p21=int64#10],>p21=int64#10
# asm 2: lduw [<table3=%l3+<p21=%o0],>p21=%o0
lduw [%l3+%o0],%o0

# qhasm: p30 = (uint64) y3 >> 48
# asm 1: srlx <y3=int64#6,48,>p30=int64#15
# asm 2: srlx <y3=%i5,48,>p30=%o5
srlx %i5,48,%o5

# qhasm: z2 ^= p20
# asm 1: xor <z2=int64#7,<p20=int64#11,>z2=int64#11
# asm 2: xor <z2=%g1,<p20=%o1,>z2=%o1
xor %g1,%o1,%o1

# qhasm: p22 = *(uint32 *) (table0 + p22)
# asm 1: lduw [<table0=int64#14+<p22=int64#1],>p22=int64#1
# asm 2: lduw [<table0=%o4+<p22=%i0],>p22=%i0
lduw [%o4+%i0],%i0

# qhasm: p33 = y3 & 4080
# asm 1: and <y3=int64#6,4080,>p33=int64#7
# asm 2: and <y3=%i5,4080,>p33=%g1
and %i5,4080,%g1

# qhasm: z3 ^= p23
# asm 1: xor <z3=int64#8,<p23=int64#12,>z3=int64#12
# asm 2: xor <z3=%g4,<p23=%o2,>z3=%o2
xor %g4,%o2,%o2

# qhasm: p30 = *(uint32 *) (table2 + p30)
# asm 1: lduw [<table2=int64#16+<p30=int64#15],>p30=int64#15
# asm 2: lduw [<table2=%o7+<p30=%o5],>p30=%o5
lduw [%o7+%o5],%o5

# qhasm: p31 = (uint64) y3 >> 32
# asm 1: srlx <y3=int64#6,32,>p31=int64#8
# asm 2: srlx <y3=%i5,32,>p31=%g4
srlx %i5,32,%g4

# qhasm: z1 ^= p21
# asm 1: xor <z1=int64#13,<p21=int64#10,>z1=int64#10
# asm 2: xor <z1=%o3,<p21=%o0,>z1=%o0
xor %o3,%o0,%o0

# qhasm: p33 = *(uint32 *) (table1 + p33)
# asm 1: lduw [<table1=int64#18+<p33=int64#7],>p33=int64#7
# asm 2: lduw [<table1=%l1+<p33=%g1],>p33=%g1
lduw [%l1+%g1],%g1

# qhasm: p32 = (uint32) y3 >> 16
# asm 1: srl <y3=int64#6,16,>p32=int64#6
# asm 2: srl <y3=%i5,16,>p32=%i5
srl %i5,16,%i5

# qhasm: p31 &= 4080
# asm 1: and <p31=int64#8,4080,>p31=int64#8
# asm 2: and <p31=%g4,4080,>p31=%g4
and %g4,4080,%g4

# qhasm: z0 ^= p22
# asm 1: xor <z0=int64#9,<p22=int64#1,>z0=int64#9
# asm 2: xor <z0=%g5,<p22=%i0,>z0=%g5
xor %g5,%i0,%g5

# qhasm: p31 = *(uint32 *) (table3 + p31)
# asm 1: lduw [<table3=int64#20+<p31=int64#8],>p31=int64#13
# asm 2: lduw [<table3=%l3+<p31=%g4],>p31=%o3
lduw [%l3+%g4],%o3

# qhasm: table3 = table0 - 4088
# asm 1: sub <table0=int64#14,4088,>table3=int64#8
# asm 2: sub <table0=%o4,4088,>table3=%g4
sub %o4,4088,%g4

# qhasm: y3 = z3 ^ p30
# asm 1: xor <z3=int64#12,<p30=int64#15,>y3=int64#12
# asm 2: xor <z3=%o2,<p30=%o5,>y3=%o2
xor %o2,%o5,%o2

# qhasm: p32 = *(uint32 *) (table0 + p32)
# asm 1: lduw [<table0=int64#14+<p32=int64#6],>p32=int64#14
# asm 2: lduw [<table0=%o4+<p32=%i5],>p32=%o4
lduw [%o4+%i5],%o4

# qhasm: table1 = table3 - 8
# asm 1: sub <table3=int64#8,8,>table1=int64#1
# asm 2: sub <table3=%g4,8,>table1=%i0
sub %g4,8,%i0

# qhasm: y0 = z0 ^ p33
# asm 1: xor <z0=int64#9,<p33=int64#7,>y0=int64#9
# asm 2: xor <z0=%g5,<p33=%g1,>y0=%g5
xor %g5,%g1,%g5

# qhasm: table2 = table1 - 4088
# asm 1: sub <table1=int64#1,4088,>table2=int64#7
# asm 2: sub <table1=%i0,4088,>table2=%g1
sub %i0,4088,%g1

# qhasm: y2 = z2 ^ p31
# asm 1: xor <z2=int64#11,<p31=int64#13,>y2=int64#11
# asm 2: xor <z2=%o1,<p31=%o3,>y2=%o1
xor %o1,%o3,%o1

# qhasm: in0 = *(uint64 *) (inp + 0)
# asm 1: ldx [<inp=int64#3+0],>in0=int64#13
# asm 2: ldx [<inp=%i2+0],>in0=%o3
ldx [%i2+0],%o3

# qhasm: table0 = table2 - 8
# asm 1: sub <table2=int64#7,8,>table0=int64#6
# asm 2: sub <table2=%g1,8,>table0=%i5
sub %g1,8,%i5

# qhasm: y1 = z1 ^ p32
# asm 1: xor <z1=int64#10,<p32=int64#14,>y1=int64#14
# asm 2: xor <z1=%o0,<p32=%o4,>y1=%o4
xor %o0,%o4,%o4

# qhasm: in2 = *(uint64 *) (inp + 8)
# asm 1: ldx [<inp=int64#3+8],>in2=int64#15
# asm 2: ldx [<inp=%i2+8],>in2=%o5
ldx [%i2+8],%o5

# qhasm: unsigned>? =? unsigned<? length -= 16
# asm 1: subcc <length=int64#5,16,>length=int64#5
# asm 2: subcc <length=%i4,16,>length=%i4
subcc %i4,16,%i4

# qhasm: goto mainloop if unsigned>
bgu,pt %xcc,._mainloop
nop

# qhasm: goto atmost15bytesleft if unsigned<
blu,pt %xcc,._atmost15bytesleft
nop

# qhasm: (uint64) y0 <<= 32
# asm 1: sllx <y0=int64#9,32,>y0=int64#1
# asm 2: sllx <y0=%g5,32,>y0=%i0
sllx %g5,32,%i0

# qhasm: (uint64) y2 <<= 32
# asm 1: sllx <y2=int64#11,32,>y2=int64#2
# asm 2: sllx <y2=%o1,32,>y2=%i1
sllx %o1,32,%i1

# qhasm: y0 ^= y1
# asm 1: xor <y0=int64#1,<y1=int64#14,>y0=int64#1
# asm 2: xor <y0=%i0,<y1=%o4,>y0=%i0
xor %i0,%o4,%i0

# qhasm: y2 ^= y3
# asm 1: xor <y2=int64#2,<y3=int64#12,>y2=int64#2
# asm 2: xor <y2=%i1,<y3=%o2,>y2=%i1
xor %i1,%o2,%i1

# qhasm: y0 ^= in0 
# asm 1: xor <y0=int64#1,<in0=int64#13,>y0=int64#1
# asm 2: xor <y0=%i0,<in0=%o3,>y0=%i0
xor %i0,%o3,%i0

# qhasm: y2 ^= in2 
# asm 1: xor <y2=int64#2,<in2=int64#15,>y2=int64#2
# asm 2: xor <y2=%i1,<in2=%o5,>y2=%i1
xor %i1,%o5,%i1

# qhasm: *(uint64 *) (outp + 0) = y0
# asm 1: stx <y0=int64#1,[<outp=int64#4+0]
# asm 2: stx <y0=%i0,[<outp=%i3+0]
stx %i0,[%i3+0]

# qhasm: *(uint64 *) (outp + 8) = y2
# asm 1: stx <y2=int64#2,[<outp=int64#4+8]
# asm 2: stx <y2=%i1,[<outp=%i3+8]
stx %i1,[%i3+8]

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
# asm 1: add %fp,2015->tmp=stack128#1,>tmpp=int64#2
# asm 2: add %fp,2015->tmp=0,>tmpp=%i1
add %fp,2015-0,%i1

# qhasm: *(uint32 *) (tmpp + 0) = y0
# asm 1: stw <y0=int64#9,[<tmpp=int64#2+0]
# asm 2: stw <y0=%g5,[<tmpp=%i1+0]
stw %g5,[%i1+0]

# qhasm: *(uint32 *) (tmpp + 4) = y1
# asm 1: stw <y1=int64#14,[<tmpp=int64#2+4]
# asm 2: stw <y1=%o4,[<tmpp=%i1+4]
stw %o4,[%i1+4]

# qhasm: *(uint32 *) (tmpp + 8) = y2
# asm 1: stw <y2=int64#11,[<tmpp=int64#2+8]
# asm 2: stw <y2=%o1,[<tmpp=%i1+8]
stw %o1,[%i1+8]

# qhasm: *(uint32 *) (tmpp + 12) = y3
# asm 1: stw <y3=int64#12,[<tmpp=int64#2+12]
# asm 2: stw <y3=%o2,[<tmpp=%i1+12]
stw %o2,[%i1+12]

# qhasm: copyloop:
._copyloop:

# qhasm: =? length -= 1
# asm 1: subcc <length=int64#1,1,>length=int64#1
# asm 2: subcc <length=%i0,1,>length=%i0
subcc %i0,1,%i0

# qhasm: dd = *(uint8 *) (tmpp + 0)
# asm 1: ldub [<tmpp=int64#2+0],>dd=int64#5
# asm 2: ldub [<tmpp=%i1+0],>dd=%i4
ldub [%i1+0],%i4

# qhasm: in0 = *(uint8 *) (inp + 0)
# asm 1: ldub [<inp=int64#3+0],>in0=int64#6
# asm 2: ldub [<inp=%i2+0],>in0=%i5
ldub [%i2+0],%i5

# qhasm: dd ^= in0
# asm 1: xor <dd=int64#5,<in0=int64#6,>dd=int64#5
# asm 2: xor <dd=%i4,<in0=%i5,>dd=%i4
xor %i4,%i5,%i4

# qhasm: *(uint8 *) (outp + 0) = dd
# asm 1: stb <dd=int64#5,[<outp=int64#4+0]
# asm 2: stb <dd=%i4,[<outp=%i3+0]
stb %i4,[%i3+0]

# qhasm: outp = outp + 1
# asm 1: add <outp=int64#4,1,>outp=int64#4
# asm 2: add <outp=%i3,1,>outp=%i3
add %i3,1,%i3

# qhasm: inp = inp + 1
# asm 1: add <inp=int64#3,1,>inp=int64#3
# asm 2: add <inp=%i2,1,>inp=%i2
add %i2,1,%i2

# qhasm: tmpp = tmpp + 1
# asm 1: add <tmpp=int64#2,1,>tmpp=int64#2
# asm 2: add <tmpp=%i1,1,>tmpp=%i1
add %i1,1,%i1

# qhasm: goto copyloop if !=
bne,pt %xcc,._copyloop
nop

# qhasm: end:
._end:

# qhasm: donothing:
._donothing:

# qhasm: dd = 0
# asm 1: add %g0,0,>dd=int64#1
# asm 2: add %g0,0,>dd=%i0
add %g0,0,%i0

# qhasm: leave
ret
restore
