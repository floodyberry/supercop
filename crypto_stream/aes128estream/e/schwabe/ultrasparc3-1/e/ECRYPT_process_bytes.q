# D. J. Bernstein and Peter Schwabe
# 2008.09.05
# Public domain.

int64 action
int64 ctxp
int64 inp
int64 outp
int64 length
int64 debug

input action
input ctxp
input inp
input outp
input length
input debug

int64 constants
int64 constants_low

int64 tx0
int64 tx1
int64 tx2
int64 tx3

int64 table0
int64 table1
int64 table2
int64 table3

#stack64 pre10
#stack64 pre20
#stack64 pre21
#stack64 pre22
#stack64 pre23 

int64 check

int64 n0
int64 n1
int64 n2
int64 n3

int64 in0
int64 in1
int64 in2
int64 in3

int64 n0p
int64 dd 
int64 tmpp
int64 y0
int64 y1
int64 y2
int64 y3
int64 ty0
int64 z0
int64 z1
int64 z2
int64 z3
int64 tz0
int64 tz1
int64 tz2
int64 tz3
int64 p00
int64 p01
int64 p02
int64 p03
int64 p10
int64 p11
int64 p12
int64 p13
int64 p20
int64 p21
int64 p22
int64 p23
int64 p30
int64 p31
int64 p32
int64 p33

int64 mask

stack128 tmp

# Enter the function
enter ECRYPT_process_bytes

=? length - 0
goto donothing if =

# Make global aes-constants reachable from within qhasm:
constants = (aes_big_constants & 0xfffffc0000000000) >> 32
constants_low = aes_big_constants & 0xfffffc00
constants |= (aes_big_constants & 0x3ff00000000) >> 32
constants_low |= aes_big_constants & 0x3ff
constants <<= 32
constants |= constants_low

# Set table constants:
table0 = constants
table0 += 80
table1 = constants
table1 += 4000
table1 += 176 
table2 = table0 + 8
table3 = table1 + 8

y0 = *(uint32 *) (ctxp + 356)
y1 = *(uint64 *) (ctxp + 360)
y2 = *(uint64 *) (ctxp + 368)
y3 = *(uint64 *) (ctxp + 376)

n0p = ctxp + 356 

n0 = *(swapendian uint32 *) n0p
n0 = n0 + 1
*(swapendian uint32 *) n0p = n0

## AddRoundKey
tx0 = *(uint64 *) (ctxp + 0)
y0 ^= tx0

goto precompute

mainloop:

ty0 = (uint64) y0 << 32
outp += 16
#z0 = pre10
z0 = *(uint64 *) (ctxp + 384)

y2 <<= 32
n0p = ctxp + 356
y0 = *(uint32 *) (ctxp + 356)

y2 ^= y3
ty0 ^= y1
n0 = *(swapendian uint32 *) n0p

in0 ^= ty0 
in2 ^= y2 
tx0 = *(uint64 *) (ctxp + 0)

check = (uint32) y0 >> 24
inp += 16
*(uint64 *) (outp - 16) = in0

n0 = n0 + 1
=? check - 0
*(uint64 *) (outp - 8) = in2

aftercopy:

## AddRoundKey

y0 ^= tx0
*(swapendian uint32 *) n0p = n0

goto after_precompute if !=

precompute:

################################################
####            Precomputation              ####
################################################
#
y1 = *(uint64 *) (ctxp + 360)
y2 = *(uint64 *) (ctxp + 368)
y3 = *(uint64 *) (ctxp + 376)


tx1 = *(uint64 *) (ctxp + 8)
tx2 = *(uint64 *) (ctxp + 16)
tx3 = *(uint64 *) (ctxp + 24)

y1 ^= tx1
y2 ^= tx2
y3 ^= tx3


p01 = (uint32) y0 >> 12
z0 = *(uint64 *) (ctxp + 32)

p02 = (uint32) y0 >> 4
p01 &= 4080
z1 = *(uint64 *) (ctxp + 40)

p03 = (uint32) y0 << 4 
p02 &= 4080
z2 = *(uint64 *) (ctxp + 48)

p03 &= 4080
z3 = *(uint64 *) (ctxp + 56)

p01 = *(uint64 *) (table1 + p01)
p02 = *(uint64 *) (table2 + p02)
p03 = *(uint64 *) (table3 + p03)

p10 = (uint64) y1 >> 48 
p13 = y1 & 4080

p11 = (uint64) y1 >> 32 
z3 ^= p01
p10 = *(uint64 *) (table0 + p10)

p12 = (uint64) y1 >> 16
p11 &= 4080
p13 = *(uint64 *) (table3 + p13)

p12 &= 4080
z2 ^= p02
p11 = *(uint64 *) (table1 + p11)

p20 = (uint64) y2 >> 48
p23 = y2 & 4080
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
z1 ^= p03
p20 = *(uint64 *) (table0 + p20)

p22 = (uint64) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

p22 &= 4080
z1 ^= p10
p21 = *(uint64 *) (table1 + p21)

z0 ^= p11
z3 ^= p12
p22 = *(uint64 *) (table2 + p22)

p30 = (uint64) y3 >> 48
p33 = y3 & 4080

z2 ^= p13
z2 ^= p20
p30 = *(uint64 *) (table0 + p30)

p31 = (uint64) y3 >> 32
z1 ^= p21
p33 = *(uint64 *) (table3 + p33)

p32 = (uint64) y3 >> 16
p31 &= 4080

z0 ^= p22
p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

z3 ^= p23
y3 = z3 ^ p30
p32 = *(uint64 *) (table2 + p32)

y2 = z2 ^ p31
y1 = z1 ^ p32
z3 = *(uint64 *) (ctxp + 88)

z0 ^= p33
#pre10 = z0
*(uint64 *) (ctxp + 384) = z0

################################################
####     Precomputation for Round 2         ####
################################################

p10 = (uint64) y1 >> 48
p13 = y1 & 4080
z0 = *(uint64 *) (ctxp + 64)

p11 = (uint64) y1 >> 32
z1 = *(uint64 *) (ctxp + 72)

p12 = (uint64) y1 >> 16
p11 &= 4080
z2 = *(uint64 *) (ctxp + 80)

p20 = (uint64) y2 >> 48
p12 &= 4080
p10 = *(uint64 *) (table0 + p10)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p11 = *(uint64 *) (table1 + p11)

p22 = (uint64) y2 >> 16
p21 &= 4080
p12 = *(uint64 *) (table2 + p12)

z1 ^= p10
p22 &= 4080
p13 = *(uint64 *) (table3 + p13)

z0 ^= p11
z3 ^= p12
p20 = *(uint64 *) (table0 + p20)

z2 ^= p13
p23 = *(uint64 *) (table3 + p23)

p21 = *(uint64 *) (table1 + p21)

p22 = *(uint64 *) (table2 + p22)

p30 = (uint64) y3 >> 48
p33 = y3 & 4080

p31 = (uint64) y3 >> 32
z2 ^= p20
p30 = *(uint64 *) (table0 + p30)

p32 = (uint64) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

z1 ^= p21
p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

z0 ^= p22
z3 ^= p23
p32 = *(uint64 *) (table2 + p32)

z2 ^= p31
z1 ^= p32

z0 ^= p33
z3 ^= p30
#pre22 = z2
*(uint64 *) (ctxp + 408) = z2

#pre21 = z1
*(uint64 *) (ctxp + 400) = z1
#pre20 = z0
*(uint64 *) (ctxp + 392) = z0
#pre23 = z3
*(uint64 *) (ctxp + 416) = z3

#z0 = pre10
z0 = *(uint64 *) (ctxp + 384)

after_precompute:

#################################################
#####              AES Round 1               ####
#################################################
p00 = (uint32) y0 >> 20
#z1 = pre21
z1 = *(uint64 *) (ctxp + 400)

p00 &= 4080
#nop
#z3 = pre23
z3 = *(uint64 *) (ctxp + 416)

#nop
#nop
p00 = *(uint64 *) (table0 + p00)

#################################################
#####              AES Round 2               ####
#################################################

#nop
#nop

#nop
#nop

#nop
y0 = z0 ^ p00
#z0 = pre20
z0 = *(uint64 *) (ctxp + 392)


p00 = (uint64) y0 >> 48
p03 = y0 & 4080
#z2 = pre22
z2 = *(uint64 *) (ctxp + 408)

p01 = (uint64) y0 >> 32
p02 = (uint64) y0 >> 16
p00 = *(uint64 *) (table0 + p00)

p01 &= 4080
p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

#nop
#nop
p01 = *(uint64 *) (table1 + p01)

#nop
#nop
p02 = *(uint64 *) (table2 + p02)

y0 = z0 ^ p00
y1 = z1 ^ p03
z1 = *(uint64 *) (ctxp + 104)

p00 = (uint64) y0 >> 48
y3 = z3 ^ p01
z0 = *(uint64 *) (ctxp + 96)

y2 = z2 ^ p02
z2 = *(uint64 *) (ctxp + 112)

###   BEGIN AUTOMATICALLY GENERATED LOOP CODE   ###

round3:


################################################
####             AES Round 3               ####
################################################

p01 = (uint64) y0 >> 32
p03 = y0 & 4080
z3 = *(uint64 *) (ctxp + 120)

p02 = (uint32) y0 >> 16
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

#p12 &= 4080
p13 = y1 & 4080
p11 = *(uint64 *) (table1 + p11)

z3 ^= p01
z2 ^= p02
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 136)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 144)

p00 = (uint64) y0 >> 48
y1 = tz1 ^ p32
z0 = *(uint64 *) (ctxp + 128)

################################################
####             AES Round 4               ####
################################################
p01 = (uint64) y0 >> 32
y2 = tz2 ^ p31
z3 = *(uint64 *) (ctxp + 152)

p02 = (uint32) y0 >> 16
p03 = y0 & 4080
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

#p12 &= 4080
p13 = y1 & 4080
p11 = *(uint64 *) (table1 + p11)

z2 ^= p02
z3 ^= p01
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 168)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 176)

p00 = (uint64) y0 >> 48
y2 = tz2 ^ p31
z0 = *(uint64 *) (ctxp + 160)

################################################
####             AES Round 5               ####
################################################
p01 = (uint64) y0 >> 32
y1 = tz1 ^ p32
z3 = *(uint64 *) (ctxp + 184)

p02 = (uint32) y0 >> 16
p03 = y0 & 4080
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

p13 = y1 & 4080
#p12 &= 4080
p11 = *(uint64 *) (table1 + p11)

z2 ^= p02
z3 ^= p01
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 200)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 208)

p00 = (uint64) y0 >> 48
y2 = tz2 ^ p31
z0 = *(uint64 *) (ctxp + 192)

################################################
####             AES Round 6               ####
################################################
p01 = (uint64) y0 >> 32
y1 = tz1 ^ p32
z3 = *(uint64 *) (ctxp + 216)

p02 = (uint32) y0 >> 16
p03 = y0 & 4080
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

p13 = y1 & 4080
#p12 &= 4080
p11 = *(uint64 *) (table1 + p11)

z3 ^= p01
z2 ^= p02
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 232)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 240)

p00 = (uint64) y0 >> 48
y2 = tz2 ^ p31
z0 = *(uint64 *) (ctxp + 224)

################################################
####             AES Round 7               ####
################################################
p01 = (uint64) y0 >> 32
y1 = tz1 ^ p32
z3 = *(uint64 *) (ctxp + 248)

p02 = (uint32) y0 >> 16
p03 = y0 & 4080
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

p13 = y1 & 4080
#p12 &= 4080
p11 = *(uint64 *) (table1 + p11)

z3 ^= p01
z2 ^= p02
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 264)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 272)

p00 = (uint64) y0 >> 48
y2 = tz2 ^ p31
z0 = *(uint64 *) (ctxp + 256)

################################################
####             AES Round 8               ####
################################################
p01 = (uint64) y0 >> 32
y1 = tz1 ^ p32
z3 = *(uint64 *) (ctxp + 280)

p02 = (uint32) y0 >> 16
p03 = y0 & 4080
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

p13 = y1 & 4080
#p12 &= 4080
p11 = *(uint64 *) (table1 + p11)

z3 ^= p01
z2 ^= p02
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 296)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 304)

p00 = (uint64) y0 >> 48
y2 = tz2 ^ p31
z0 = *(uint64 *) (ctxp + 288)

################################################
####             AES Round 9               ####
################################################
p01 = (uint64) y0 >> 32
y1 = tz1 ^ p32
z3 = *(uint64 *) (ctxp + 312)

p02 = (uint32) y0 >> 16
p03 = y0 & 4080
p00 = *(uint64 *) (table0 + p00)

p10 = (uint64) y1 >> 48
#p02 &= 4080
p03 = *(uint64 *) (table3 + p03)

p11 = (uint64) y1 >> 32
p01 &= 4080
p02 = *(uint64 *) (table2 + p02)

p12 = (uint32) y1 >> 16
z0 ^= p00
p01 = *(uint64 *) (table1 + p01)

z1 ^= p03
p11 &= 4080
p10 = *(uint64 *) (table0 + p10)

p13 = y1 & 4080
#p12 &= 4080
p11 = *(uint64 *) (table1 + p11)

z3 ^= p01
z2 ^= p02
p13 = *(uint64 *) (table3 + p13)

p20 = (uint64) y2 >> 48
z1 ^= p10
p12 = *(uint64 *) (table2 + p12)

p21 = (uint64) y2 >> 32
p23 = y2 & 4080
p20 = *(uint64 *) (table0 + p20)

p22 = (uint32) y2 >> 16
p21 &= 4080
p23 = *(uint64 *) (table3 + p23)

#p22 &= 4080
tz3 = z3 ^ p12
p21 = *(uint64 *) (table1 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p13
p22 = *(uint64 *) (table2 + p22)

p31 = (uint64) y3 >> 32
p33 = y3 & 4080
p30 = *(uint64 *) (table0 + p30)

p32 = (uint32) y3 >> 16
p31 &= 4080
p33 = *(uint64 *) (table3 + p33)

tz0 = z0 ^ p11
#p32 &= 4080
p31 = *(uint64 *) (table1 + p31)

tz1 = z1 ^ p21
tz2 = z2 ^ p20
p32 = *(uint64 *) (table2 + p32)

tz0 ^= p22
tz3 ^= p23
z1 = *(uint64 *) (ctxp + 328)

y0 = tz0 ^ p33
y3 = tz3 ^ p30
z2 = *(uint64 *) (ctxp + 336)

y2 = tz2 ^ p31
y1 = tz1 ^ p32
z0 = *(uint64 *) (ctxp + 320)

###    END AUTOMATICALLY GENERATED LOOP CODE    ###

##################################################
######             Last AES Round             ####
##################################################

#*(uint64 *) (debug + 0) = y0
#*(uint64 *) (debug + 8) = y1
#*(uint64 *) (debug + 16) = y2
#*(uint64 *) (debug + 24) = y3

last_round:

p00 = (uint64) y0 >> 48
table0 = table3 + 4088
z3 = *(uint64 *) (ctxp + 344)

p02 = (uint32) y0 >> 16
table2 = table0 + 4

p03 = y0 & 4080
table1 = table2 + 4
p00 = *(uint32 *) (table2 + p00)

p01 = (uint64) y0 >> 32
#p02 &= 4080
p03 = *(uint32 *) (table1 + p03)

p10 = (uint64) y1 >> 48
table3 = table1 + 4
p02 = *(uint32 *) (table0 + p02)

z0 ^= p00
p01 &= 4080

p11 = (uint64) y1 >> 32
z1 ^= p03
p01 = *(uint32 *) (table3 + p01)

p12 = (uint32) y1 >> 16
p13 = y1 & 4080
p10 = *(uint32 *) (table2 + p10)

p11 &= 4080
z2 ^= p02
p13 = *(uint32 *) (table1 + p13)

#p12 &= 4080
z3 ^= p01
p11 = *(uint32 *) (table3 + p11)

p20 = (uint64) y2 >> 48
p23 = y2 & 4080
p12 = *(uint32 *) (table0 + p12)

p21 = (uint64) y2 >> 32
z2 ^= p13
p20 = *(uint32 *) (table2 + p20)

z0 ^= p11
p21 &= 4080
p23 = *(uint32 *) (table1 + p23)

p22 = (uint32) y2 >> 16
z3 ^= p12

#p22 &= 4080
z1 ^= p10
p21 = *(uint32 *) (table3 + p21)

p30 = (uint64) y3 >> 48
z2 ^= p20
p22 = *(uint32 *) (table0 + p22)

p33 = y3 & 4080
z3 ^= p23
p30 = *(uint32 *) (table2 + p30)

p31 = (uint64) y3 >> 32
z1 ^= p21
p33 = *(uint32 *) (table1 + p33)

p32 = (uint32) y3 >> 16
p31 &= 4080

z0 ^= p22
#p32 &= 4080
p31 = *(uint32 *) (table3 + p31)

table3 = table0 - 4088
y3 = z3 ^ p30
p32 = *(uint32 *) (table0 + p32)

table1 = table3 - 8
y0 = z0 ^ p33

table2 = table1 - 4088
y2 = z2 ^ p31
in0 = *(uint64 *) (inp + 0)

table0 = table2 - 8
y1 = z1 ^ p32
in2 = *(uint64 *) (inp + 8)

# if there are less then 16 bytes left, handle them differently:

unsigned>? =? unsigned<? length -= 16

goto mainloop if unsigned>

goto atmost15bytesleft if unsigned<

(uint64) y0 <<= 32
(uint64) y2 <<= 32

y0 ^= y1
y2 ^= y3

y0 ^= in0 
y2 ^= in2 

*(uint64 *) (outp + 0) = y0
*(uint64 *) (outp + 8) = y2

goto end

atmost15bytesleft:

length += 16
tmpp = &tmp

*(uint32 *) (tmpp + 0) = y0
*(uint32 *) (tmpp + 4) = y1
*(uint32 *) (tmpp + 8) = y2
*(uint32 *) (tmpp + 12) = y3

copyloop:

=? length -= 1

dd = *(uint8 *) (tmpp + 0)
in0 = *(uint8 *) (inp + 0)
dd ^= in0
*(uint8 *) (outp + 0) = dd

outp = outp + 1
inp = inp + 1
tmpp = tmpp + 1

goto copyloop if !=

end:


donothing:

dd = 0

leave
