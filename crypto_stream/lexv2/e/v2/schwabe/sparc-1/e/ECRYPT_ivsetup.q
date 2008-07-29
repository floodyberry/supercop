# 
#  lex_ultrasparc/ECRYPT_ivsetup.q version 20080315
#  Peter Schwabe
#  Public domain
# 

int64 ctxp
int64 iv_plainp

input ctxp
input iv_plainp

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

int64 y0
int64 y1
int64 y2
int64 y3
int64 z0
int64 z1
int64 z2
int64 z3
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

int64 mask1
int64 mask2
int64 mask3

stack64 x0
stack64 x1
stack64 x2
stack64 x3
stack64 x4
stack64 x5
stack64 x6
stack64 x7
stack64 x8
stack64 x9
stack64 x10
stack64 x11
stack64 x12
stack64 x13
stack64 x14
stack64 x15
stack64 x16
stack64 x17
stack64 x18
stack64 x19
stack64 x20
stack64 x21
stack64 x22
stack64 x23
stack64 x24
stack64 x25
stack64 x26
stack64 x27
stack64 x28
stack64 x29
stack64 x30
stack64 x31
stack64 x32
stack64 x33
stack64 x34
stack64 x35
stack64 x36
stack64 x37
stack64 x38
stack64 x39
stack64 x40
stack64 x41
stack64 x42
stack64 x43

# Enter the function
enter ECRYPT_ivsetup

# Make global aes-constants reachable from within qhasm:
constants = (aes_big_constants & 0xfffffc0000000000) >> 32
constants_low = aes_big_constants & 0xfffffc00
constants |= (aes_big_constants & 0x3ff00000000) >> 32
constants_low |= aes_big_constants & 0x3ff
constants <<= 32
constants |= constants_low

y0 = *(swapendian uint32 *) iv_plainp
iv_plainp += 4
y1 = *(swapendian uint32 *) iv_plainp
iv_plainp += 4
y2 = *(swapendian uint32 *) iv_plainp
iv_plainp += 4
y3 = *(swapendian uint32 *) iv_plainp

tx0 = *(uint32 *) (ctxp + 0) 
table0 = constants + 40
table1 = constants + 48

tx1 = *(uint32 *) (ctxp + 4) 
table2 = constants + 44
table3 = constants + 52

tx2 = *(uint32 *) (ctxp + 8) 
mask1 = 0xff
mask1 <<= 24

tx3 = *(uint32 *) (ctxp + 12)
mask2 = 0xff
mask2 <<= 16

x0 = tx0
mask3 = 0xff
mask3 <<= 8

x1 = tx1
x2 = tx2
x3 = tx3

# XOR tx0 .. tx3 to iv_plain (AddRoundKey)
y0 ^= tx0
y1 ^= tx1
y2 ^= tx2
y3 ^= tx3

#	Key generation round 1:
tx0 = *(uint32 *) (ctxp + 16)
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x4  = tx0 
tx0 = *(uint32 *) (ctxp + 20) 
x5  = tx1 
x6  = tx2 
x7  = tx3 

#	Key generation round 2:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x8  = tx0 
tx0 = *(uint32 *) (ctxp + 24) 
x9  = tx1
x10  = tx2 
x11  = tx3 


#	Key generation round 3:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x12  = tx0 
tx0 = *(uint32 *) (ctxp + 28) 
x13  = tx1
x14  = tx2 
x15  = tx3 

#	Key generation round 4:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x16  = tx0 
tx0 = *(uint32 *) (ctxp + 32) 
x17  = tx1
x18  = tx2 
x19  = tx3 

#	Key generation round 5:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x20  = tx0 
tx0 = *(uint32 *) (ctxp + 36) 
x21  = tx1
x22  = tx2 
x23  = tx3 

#	Key generation round 6:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x24  = tx0 
tx0 = *(uint32 *) (ctxp + 40) 
x25  = tx1
x26  = tx2 
x27  = tx3 

#	Key generation round 7:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x28  = tx0 
tx0 = *(uint32 *) (ctxp + 44) 
x29  = tx1
x30  = tx2 
x31  = tx3 

#	Key generation round 8:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x32  = tx0 
tx0 = *(uint32 *) (ctxp + 48) 
x33  = tx1
x34  = tx2 
x35  = tx3 

#	Key generation round 9:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x36  = tx0 
tx0 = *(uint32 *) (ctxp + 52) 
x37  = tx1
x38  = tx2 
x39  = tx3 

#	Key generation round 10:
tx1 ^= tx0
tx2 ^= tx1
tx3 ^= tx2
x40  = tx0 
x41  = tx1
x42  = tx2 
x43  = tx3 

################################################
####             AES Round 1               ####
################################################

p00 = (uint32) y0 >> 20
p00 &= 4080

p01 = (uint32) y0 >> 12
p01 &= 4080
z0 = x4

p02 = (uint32) y0 >> 4
z1 = x5

p03 = (uint32) y0 << 4
p02 &= 4080
z2 = x6

p10 = (uint32) y1 >> 20
p03 &= 4080
z3 = x7

p11 = (uint32) y1 >> 12 
p10 &= 4080
p00 = *(uint32 *) (table0 + p00)

p12 = (uint32) y1 >> 4
p11 &= 4080
p01 = *(uint32 *) (table1 + p01)

p13 = (uint32) y1 << 4 
p12 &= 4080
p02 = *(uint32 *) (table2 + p02)

z0 ^= p00
p13 &= 4080
p03 = *(uint32 *) (table3 + p03)

p20 = (uint32) y2 >> 20
z3 ^= p01
p10 = *(uint32 *) (table0 + p10)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p11 = *(uint32 *) (table1 + p11)

p22 = (uint32) y2 >> 4
z1 ^= p03
p12 = *(uint32 *) (table2 + p12)

p23 = (uint32) y2 << 4 
p20 &= 4080
p13 = *(uint32 *) (table3 + p13)

p21 &= 4080
p22 &= 4080

p30 = (uint32) y3 >> 20
p23 &= 4080
p20 = *(uint32 *) (table0 + p20)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p21 = *(uint32 *) (table1 + p21)

p32 = (uint32) y3 >> 4
z1 ^= p10
p22 = *(uint32 *) (table2 + p22)

p33 = (uint32) y3 << 4 
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 &= 4080
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z3 ^= p12
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

z2 ^= p20
z0 ^= p22
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z1 ^= p21
p33 = *(uint32 *) (table3 + p33)

z3 ^= p23
y2 = z2 ^ p31

y1 = z1 ^ p32
y0 = z0 ^ p33

################################################
####             AES Round 2               ####
################################################

p00 = (uint32) y0 >> 20
y3 = z3 ^ p30
z0 = x8

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x9

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x10

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x11

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33

################################################
####             AES Round 3               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x12

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x13

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x14

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x15

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33

################################################
####             AES Round 4               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x16

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x17

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x18

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x19

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33


################################################
####             AES Round 5               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x20

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x21

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x22

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x23

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33


################################################
####             AES Round 6               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x24

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x25

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x26

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x27

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33

################################################
####             AES Round 7               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x28

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x29

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x30

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x31

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p30 = *(uint32 *) (table0 + p30)
p33 = (uint32) y3 << 4 
p31 &= 4080

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33

################################################
####             AES Round 8               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x32

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x33

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x34

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x35

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

z1 ^= p10
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y2 = z2 ^ p31

y3 = z3 ^ p30
y0 = z0 ^ p33

################################################
####             AES Round 9               ####
################################################
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32
z0 = x36

p01 = (uint32) y0 >> 12
p00 &= 4080
z1 = x37

p02 = (uint32) y0 >> 4
p01 &= 4080
z2 = x38

p03 = (uint32) y0 << 4
p02 &= 4080
z3 = x39

p10 = (uint32) y1 >> 20
p03 &= 4080
p00 = *(uint32 *) (table0 + p00)

p11 = (uint32) y1 >> 12 
p10 &= 4080
p01 = *(uint32 *) (table1 + p01)

p12 = (uint32) y1 >> 4
p11 &= 4080
p02 = *(uint32 *) (table2 + p02)

p13 = (uint32) y1 << 4 
p12 &= 4080
p03 = *(uint32 *) (table3 + p03)

p13 &= 4080
z0 ^= p00
p10 = *(uint32 *) (table0 + p10)

p20 = (uint32) y2 >> 20
z3 ^= p01
p11 = *(uint32 *) (table1 + p11)

p21 = (uint32) y2 >> 12 
z2 ^= p02
p12 = *(uint32 *) (table2 + p12)

p22 = (uint32) y2 >> 4
z1 ^= p03
p13 = *(uint32 *) (table3 + p13)

p20 &= 4080
p21 &= 4080

p23 = (uint32) y2 << 4 
p22 &= 4080
p20 = *(uint32 *) (table0 + p20)

p30 = (uint32) y3 >> 20
p23 &= 4080
p21 = *(uint32 *) (table1 + p21)

p31 = (uint32) y3 >> 12 
z0 ^= p11
p22 = *(uint32 *) (table2 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint32 *) (table3 + p23)

z1 ^= p10
p31 &= 4080
p30 = *(uint32 *) (table0 + p30)

p33 = (uint32) y3 << 4 
p32 &= 4080
p31 = *(uint32 *) (table1 + p31)

p33 &= 4080
z3 ^= p12
p32 = *(uint32 *) (table2 + p32)

z2 ^= p13
z2 ^= p20
p33 = *(uint32 *) (table3 + p33)

z1 ^= p21
z0 ^= p22

z3 ^= p23
y0 = z0 ^ p33

z0 = x40
p00 = (uint32) y0 >> 20
y1 = z1 ^ p32

p01 = (uint32) y0 >> 12 

y2 = z2 ^ p31
y3 = z3 ^ p30
z1 = x41

p02 = (uint32) y0 >> 4
p00 &= 4080

p03 = (uint32) y0 << 4 
p01 &= 4080

#############################################################
#####    Last AES Round (interleaved with previous)      ####
#############################################################

p10 = (uint32) y1 >> 20
table1 +=3
z2 = x42

p11 = (uint32) y1 >> 12 
p02 &= 4080
z3 = x43

p12 = (uint32) y1 >> 4
p03 &= 4080
p00 = *(uint32 *) (table2 + p00)

p13 = (uint32) y1 << 4 
p10 &= 4080
p01 = *(uint32 *) (table3 + p01)

p11 &= 4080
p12 &= 4080
p02 = *(uint32 *) (table0 + p02)

p13 &= 4080
p00 &= mask1 
p03 = *(uint8 *) (table1 + p03)

p20 = (uint32) y2 >> 20
p01 &= mask2
p10 = *(uint32 *) (table2 + p10)

z0 ^= p00
z3 ^= p01

p21 = (uint32) y2 >> 12 
z1 ^= p03
p11 = *(uint32 *) (table3 + p11)

p22 = (uint32) y2 >> 4
p02 &= mask3
p12 = *(uint32 *) (table0 + p12)

p23 = (uint32) y2 << 4 
z2 ^= p02
p13 = *(uint8 *) (table1 + p13)

p20 &= 4080
p21 &= 4080

p22 &= 4080
p23 &= 4080
p20 = *(uint32 *) (table2 + p20)

p30 = (uint32) y3 >> 20
p10 &= mask1
p21 = *(uint32 *) (table3 + p21)

p31 = (uint32) y3 >> 12 
z1 ^= p10
p22 = *(uint32 *) (table0 + p22)

p32 = (uint32) y3 >> 4
p30 &= 4080
p23 = *(uint8 *) (table1 + p23)

p33 = (uint32) y3 << 4 
p31 &= 4080
p30 = *(uint32 *) (table2 + p30)

p12 &= mask3
p32 &= 4080
p31 = *(uint32 *) (table3 + p31)

p20 &= mask1
p33 &= 4080

p11 &= mask2
p21 &= mask2
p32 = *(uint32 *) (table0 + p32)

z0 ^= p11
z3 ^= p12
p33 = *(uint8 *) (table1 + p33)

z2 ^= p13
z2 ^= p20

p22 &= mask3
z1 ^= p21

z0 ^= p22
z3 ^= p23

p30 &= mask1
p31 &= mask2
tx0 = x0

p32 &= mask3

z0 = z0 ^ p33
z1 = z1 ^ p32
z2 = z2 ^ p31
z3 = z3 ^ p30


*(uint32 *) (ctxp + 56) = z0
*(uint32 *) (ctxp + 60) = z1
*(uint32 *) (ctxp + 64) = z2
*(uint32 *) (ctxp + 68) = z3

leave
