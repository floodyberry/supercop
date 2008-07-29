int32 ctxp
int32 iv_plainp

input ctxp
input iv_plainp

int32 constants
int32 constants_low

int32 tx0
int32 tx1
int32 tx2
int32 tx3

int32 sx0
int32 sx1
int32 sx2
int32 sx3

int32 table0
int32 table1
int32 table2
int32 table3

int32 d0
int32 d1
int32 d2
int32 d3

int32 n0
int32 n1
int32 n2
int32 n3

int32 in0
int32 in1
int32 in2
int32 in3

int32 tmp0 
int32 key
int32 inint
int32 outint

int32 y0
int32 y1
int32 y2
int32 y3
int32 z0
int32 z1
int32 z2
int32 z3
int32 p00
int32 p01
int32 p02
int32 p03
int32 p10
int32 p11
int32 p12
int32 p13
int32 p20
int32 p21
int32 p22
int32 p23
int32 p30
int32 p31
int32 p32
int32 p33

stack32 x0
stack32 x1
stack32 x2
stack32 x3
stack32 x4
stack32 x5
stack32 x6
stack32 x7
stack32 x8
stack32 x9
stack32 x10
stack32 x11
stack32 x12
stack32 x13
stack32 x14
stack32 x15
stack32 x16
stack32 x17
stack32 x18
stack32 x19
stack32 x20
stack32 x21
stack32 x22
stack32 x23
stack32 x24
stack32 x25
stack32 x26
stack32 x27
stack32 x28
stack32 x29
stack32 x30
stack32 x31
stack32 x32
stack32 x33
stack32 x34
stack32 x35
stack32 x36
stack32 x37
stack32 x38
stack32 x39
stack32 x40
stack32 x41
stack32 x42
stack32 x43

stack32 inp_stack
stack32 outp_stack
stack32 length_stack

int32 i12
int32 i13
int32 i14
int32 i15
int32 i16
int32 i17
int32 i18
int32 i19
int32 i20
int32 i21
int32 i22
int32 i23
int32 i24
int32 i25
int32 i26
int32 i27
int32 i28
int32 i29

caller i12
caller i13
caller i14
caller i15
caller i16
caller i17
caller i18
caller i19
caller i20
caller i21
caller i22
caller i23
caller i24
caller i25
caller i26
caller i27
caller i28
caller i29

stack32 i12_stack
stack32 i13_stack
stack32 i14_stack
stack32 i15_stack
stack32 i16_stack
stack32 i17_stack
stack32 i18_stack
stack32 i19_stack
stack32 i20_stack
stack32 i21_stack
stack32 i22_stack
stack32 i23_stack
stack32 i24_stack
stack32 i25_stack
stack32 i26_stack
stack32 i27_stack
stack32 i28_stack
stack32 i29_stack

# Enter the function
enter ECRYPT_ivsetup_qhasm

i12_stack = i12
i13_stack = i13
i14_stack = i14
i15_stack = i15
i16_stack = i16
i17_stack = i17
i18_stack = i18
i19_stack = i19
i20_stack = i20
i21_stack = i21
i22_stack = i22
i23_stack = i23
i24_stack = i24
i25_stack = i25
i26_stack = i26
i27_stack = i27
i28_stack = i28
i29_stack = i29

# Make global aes-constants reachable from within qhasm:
constants = &aes_big_constants & 0xffff0000
constants |= &aes_big_constants & 0xffff

# Set table constants:
table0 = constants
table0 += 40
table1 = constants
table1 += 48
table2 = constants
table2 += 44
table3 = constants
table3 += 52

tx0 = *(uint32 *) (ctxp + 0) 
tx1 = *(uint32 *) (ctxp + 4) 
tx2 = *(uint32 *) (ctxp + 8) 
tx3 = *(uint32 *) (ctxp + 12)

x0 = tx0
x1 = tx1
x2 = tx2
x3 = tx3

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

# Get ivplain
y0 = *(swapendian uint32 *) iv_plainp
#y0 = *(uint32 *) (iv_plainp + 0)
iv_plainp += 4
y1 = *(swapendian uint32 *) iv_plainp
#y1 = *(uint32 *) (iv_plainp + 0)
iv_plainp += 4
y2 = *(swapendian uint32 *) iv_plainp
#y2 = *(uint32 *) (iv_plainp + 0)
iv_plainp += 4
y3 = *(swapendian uint32 *) iv_plainp
#y3 = *(uint32 *) (iv_plainp + 0)

# One standard AES to encrypt the IV

# AddRoundKey
tx0 = x0
tx1 = x1
tx2 = x2
tx3 = x3

y0 ^= tx0
y1 ^= tx1
y2 ^= tx2
y3 ^= tx3

##################################################
######                Round 1                ####
##################################################
z0 = x4
p00 = 4080 & (y0 <<< 12)

z1 = x5
p01 = 4080 & (y0 <<< 20)

z2 = x6
p02 = 4080 & (y0 <<< 28)

z3 = x7
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30



#################################################
#####                Round 2                ####
#################################################
z0 = x8
p00 = 4080 & (y0 <<< 12)

z1 = x9
p01 = 4080 & (y0 <<< 20)

z2 = x10
p02 = 4080 & (y0 <<< 28)

z3 = x11
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 3                ####
#################################################
z0 = x12
p00 = 4080 & (y0 <<< 12)

z1 = x13
p01 = 4080 & (y0 <<< 20)

z2 = x14
p02 = 4080 & (y0 <<< 28)

z3 = x15
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 4                ####
#################################################
z0 = x16
p00 = 4080 & (y0 <<< 12)

z1 = x17
p01 = 4080 & (y0 <<< 20)

z2 = x18
p02 = 4080 & (y0 <<< 28)

z3 = x19
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 5                ####
#################################################
z0 = x20
p00 = 4080 & (y0 <<< 12)

z1 = x21
p01 = 4080 & (y0 <<< 20)

z2 = x22
p02 = 4080 & (y0 <<< 28)

z3 = x23
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 6                ####
#################################################
z0 = x24
p00 = 4080 & (y0 <<< 12)

z1 = x25
p01 = 4080 & (y0 <<< 20)

z2 = x26
p02 = 4080 & (y0 <<< 28)

z3 = x27
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 7                ####
#################################################
z0 = x28
p00 = 4080 & (y0 <<< 12)

z1 = x29
p01 = 4080 & (y0 <<< 20)

z2 = x30
p02 = 4080 & (y0 <<< 28)

z3 = x31
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 8                ####
#################################################
z0 = x32
p00 = 4080 & (y0 <<< 12)

z1 = x33
p01 = 4080 & (y0 <<< 20)

z2 = x34
p02 = 4080 & (y0 <<< 28)

z3 = x35
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30


#################################################
#####                Round 9                ####
#################################################
z0 = x36
p00 = 4080 & (y0 <<< 12)

z1 = x37
p01 = 4080 & (y0 <<< 20)

z2 = x38
p02 = 4080 & (y0 <<< 28)

z3 = x39
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table0 + p00)
p10 = 4080 & (y1 <<< 12)

p01 = *(uint32 *) (table1 + p01)
p11 = 4080 & (y1 <<< 20)

p02 = *(uint32 *) (table2 + p02)
p12 = 4080 & (y1 <<< 28)

p03 = *(uint32 *) (table3 + p03)
p13 = 4080 & (y1 <<< 4)

z0 ^= p00
z3 ^= p01

z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table0 + p10)
p20 = 4080 & (y2 <<< 12)

p11 = *(uint32 *) (table1 + p11)
p21 = 4080 & (y2 <<< 20)

p12 = *(uint32 *) (table2 + p12)
p22 = 4080 & (y2 <<< 28)

p13 = *(uint32 *) (table3 + p13)
p23 = 4080 & (y2 <<< 4)

z1 ^= p10
z0 ^= p11

z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table0 + p20)
p30 = 4080 & (y3 <<< 12)

p21 = *(uint32 *) (table1 + p21)
p31 = 4080 & (y3 <<< 20)

p22 = *(uint32 *) (table2 + p22)
p32 = 4080 & (y3 <<< 28)

p23 = *(uint32 *) (table3 + p23)
p33 = 4080 & (y3 <<< 4)

p30 = *(uint32 *) (table0 + p30)
z2 ^= p20

p31 = *(uint32 *) (table1 + p31)
z1 ^= p21

p32 = *(uint32 *) (table2 + p32)
z0 ^= p22

p33 = *(uint32 *) (table3 + p33)
z3 ^= p23

y2 = z2 ^ p31
y1 = z1 ^ p32

y0 = z0 ^ p33
y3 = z3 ^ p30



################################################
####             Last AES Round             ####
################################################

z0 = x40
p00 = 4080 & (y0 <<< 12)
z1 = x41
p01 = 4080 & (y0 <<< 20)
z2 = x42
p02 = 4080 & (y0 <<< 28) 
z3 = x43
p03 = 4080 & (y0 <<< 4)

p00 = *(uint32 *) (table2 + p00)
p10 = 4080 & (y1 <<< 12)
p01 = *(uint32 *) (table3 + p01)
p11 = 4080 & (y1 <<< 20)
p02 = *(uint32 *) (table0 + p02)
p12 = 4080 & (y1 <<< 28) 
p03 = *(uint32 *) (table1 + p03)
p13 = 4080 & (y1 <<< 4)

p00 = p00 & (65536 * 0xff00) 
p01 = p01 & (65536 * 0xff) 
p02 = p02 & 0xff00 
p03 = p03 & 0xff 

z0 ^= p00
z3 ^= p01
z2 ^= p02
z1 ^= p03

p10 = *(uint32 *) (table2 + p10)
p20 = 4080 & (y2 <<< 12)
p11 = *(uint32 *) (table3 + p11)
p21 = 4080 & (y2 <<< 20)
p12 = *(uint32 *) (table0 + p12)
p22 = 4080 & (y2 <<< 28) 
p13 = *(uint32 *) (table1 + p13)
p23 = 4080 & (y2 <<< 4)

p10 = p10 & (65536 * 0xff00) 
p11 = p11 & (65536 * 0xff) 
p12 = p12 & 0xff00 
p13 = p13 & 0xff 

z1 ^= p10
z0 ^= p11
z3 ^= p12
z2 ^= p13

p20 = *(uint32 *) (table2 + p20)
p30 = 4080 & (y3 <<< 12)
p21 = *(uint32 *) (table3 + p21)
p31 = 4080 & (y3 <<< 20)
p22 = *(uint32 *) (table0 + p22)
p32 = 4080 & (y3 <<< 28) 
p23 = *(uint32 *) (table1 + p23)
p33 = 4080 & (y3 <<< 4)


p20 = p20 & (65536 * 0xff00) 
p21 = p21 & (65536 * 0xff) 
p22 = p22 & 0xff00 
p23 = p23 & 0xff 


p30 = *(uint32 *) (table2 + p30)
z2 ^= p20
p31 = *(uint32 *) (table3 + p31)
z1 ^= p21
p32 = *(uint32 *) (table0 + p32)
z0 ^= p22
p33 = *(uint32 *) (table1 + p33)
z3 ^= p23


p30 = p30 & (65536 * 0xff00) 
p31 = p31 & (65536 * 0xff) 

p32 = p32 & 0xff00 
p33 = p33 & 0xff 

y0 = z0 ^ p33
y1 = z1 ^ p32

y2 = z2 ^ p31
y3 = z3 ^ p30


*(uint32 *) (ctxp + 56) = y0
*(uint32 *) (ctxp + 60) = y1
*(uint32 *) (ctxp + 64) = y2
*(uint32 *) (ctxp + 68) = y3

i12 = i12_stack
i13 = i13_stack
i14 = i14_stack
i15 = i15_stack
i16 = i16_stack
i17 = i17_stack
i18 = i18_stack
i19 = i19_stack
i20 = i20_stack
i21 = i21_stack
i22 = i22_stack
i23 = i23_stack
i24 = i24_stack
i25 = i25_stack
i26 = i26_stack
i27 = i27_stack
i28 = i28_stack
i29 = i29_stack

leave
