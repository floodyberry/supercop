int64 action
int64 ctxp
int64 inp
int64 outp
int64 length

input action
input ctxp
input inp
input outp
input length

int64 constants
int64 constants_low
int64 oddmask
int64 evenmask

int64 tx0
int64 tx1
int64 tx2
int64 tx3

int64 table0
int64 table1
int64 table2
int64 table3

int64 in0
int64 in1
int64 in2
int64 in3

int64 dd
int64 inint
int64 outint
int64 tmp0
int64 tmp1
int64 key
int64 tmpp
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

stack64 outp_stack
stack64 inp_stack
stack64 length_stack
stack64 length_save_stack

stack320 tmp

# Enter the function
enter ECRYPT_process_bytes

=? length - 0
goto donothing if =

# Make global aes-constants reachable from within qhasm:
constants = (aes_little_constants & 0xfffffc0000000000) >> 32
constants_low = aes_little_constants & 0xfffffc00
constants |= (aes_little_constants & 0x3ff00000000) >> 32
constants_low |= aes_little_constants & 0x3ff
constants <<= 32
constants |= constants_low

evenmask = 0xff
evenmask <<= 16
evenmask ^= 0xff
evenmask <<= 8 

oddmask = (uint32) evenmask >> 8

tx0 = *(uint32 *) (ctxp + 0) 
table0 = constants + 40
table1 = constants + 48

tx1 = *(uint32 *) (ctxp + 4) 
table2 = constants + 44
table3 = constants + 52

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

y0 = *(uint32 *) (ctxp + 56)  
y1 = *(uint32 *) (ctxp + 60)  
y2 = *(uint32 *) (ctxp + 64)  
y3 = *(uint32 *) (ctxp + 68)  

unsigned<? length - 40
goto lessthan40bytesleft if unsigned<

mainloop:

length_stack = length

##################  BEGIN  ################## 


#################################################
z0 = x4
p00 = (uint32) y0 << 4

z1 = x5
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x6
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x7
p03 = (uint32) y0 >> 20
p02 &= 4080

p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p33 &= 4080

p33 = *(uint32 *) (table3 + p33)
p31 &= 4080
p30 &= 4080

p31 = *(uint32 *) (table1 + p31)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y0 = z0 ^ p33

inint = *(uint32 *) (inp + 0)
y2 = z2 ^ p31

##############  Odd round LEX  ###############

tmp0 = y0 & oddmask

tmp1 = y2 & oddmask
inint ^= tmp0

(uint32) tmp1 <<= 8
y3 = z3 ^ p30

inint ^= tmp1
y1 = z1 ^ p32

#################################################
z0 = x8
p00 = (uint32) y0 << 4

z1 = x9
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x10
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x11
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 0) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p31 &= 4080

p31 = *(uint32 *) (table1 + p31)
p33 &= 4080
p30 &= 4080

p33 = *(uint32 *) (table3 + p33)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y2 = z2 ^ p31

inint = *(uint32 *) (inp + 4)
y0 = z0 ^ p33


################  Even round LEX  ###############

tmp1 = y2 & evenmask

tmp0 = y0 & evenmask
inint ^= tmp1

(uint32) tmp0 >>= 8
y3 = z3 ^ p30

inint ^= tmp0
y1 = z1 ^ p32

#################################################
z0 = x12
p00 = (uint32) y0 << 4

z1 = x13
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x14
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x15
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 4) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p33 &= 4080

p33 = *(uint32 *) (table3 + p33)
p31 &= 4080
p30 &= 4080

p31 = *(uint32 *) (table1 + p31)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y0 = z0 ^ p33

inint = *(uint32 *) (inp + 8)
y2 = z2 ^ p31

##############  Odd round LEX  ###############

tmp0 = y0 & oddmask

tmp1 = y2 & oddmask
inint ^= tmp0

(uint32) tmp1 <<= 8
y3 = z3 ^ p30

inint ^= tmp1
y1 = z1 ^ p32

#################################################
z0 = x16
p00 = (uint32) y0 << 4

z1 = x17
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x18
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x19
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 8) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p31 &= 4080

p31 = *(uint32 *) (table1 + p31)
p33 &= 4080
p30 &= 4080

p33 = *(uint32 *) (table3 + p33)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y2 = z2 ^ p31

inint = *(uint32 *) (inp + 12)
y0 = z0 ^ p33


################  Even round LEX  ###############

tmp1 = y2 & evenmask

tmp0 = y0 & evenmask
inint ^= tmp1

(uint32) tmp0 >>= 8
y3 = z3 ^ p30

inint ^= tmp0
y1 = z1 ^ p32


#################################################
z0 = x20
p00 = (uint32) y0 << 4

z1 = x21
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x22
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x23
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 12) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p33 &= 4080

p33 = *(uint32 *) (table3 + p33)
p31 &= 4080
p30 &= 4080

p31 = *(uint32 *) (table1 + p31)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y0 = z0 ^ p33

inint = *(uint32 *) (inp + 16)
y2 = z2 ^ p31

##############  Odd round LEX  ###############

tmp0 = y0 & oddmask

tmp1 = y2 & oddmask
inint ^= tmp0

(uint32) tmp1 <<= 8
y3 = z3 ^ p30

inint ^= tmp1
y1 = z1 ^ p32

################################################
z0 = x24
p00 = (uint32) y0 << 4

z1 = x25
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x26
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x27
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 16) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p31 &= 4080

p31 = *(uint32 *) (table1 + p31)
p33 &= 4080
p30 &= 4080

p33 = *(uint32 *) (table3 + p33)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y2 = z2 ^ p31

inint = *(uint32 *) (inp + 20)
y0 = z0 ^ p33


################  Even round LEX  ###############

tmp1 = y2 & evenmask

tmp0 = y0 & evenmask
inint ^= tmp1

(uint32) tmp0 >>= 8
y3 = z3 ^ p30

inint ^= tmp0
y1 = z1 ^ p32

################################################
z0 = x28
p00 = (uint32) y0 << 4

z1 = x29
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x30
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x31
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 20) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p33 &= 4080

p33 = *(uint32 *) (table3 + p33)
p31 &= 4080
p30 &= 4080

p31 = *(uint32 *) (table1 + p31)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y0 = z0 ^ p33

inint = *(uint32 *) (inp + 24)
y2 = z2 ^ p31

##############  Odd round LEX  ###############

tmp0 = y0 & oddmask

tmp1 = y2 & oddmask
inint ^= tmp0

(uint32) tmp1 <<= 8
y3 = z3 ^ p30

inint ^= tmp1
y1 = z1 ^ p32

################################################
z0 = x32
p00 = (uint32) y0 << 4

z1 = x33
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x34
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x35
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 24) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p31 &= 4080

p31 = *(uint32 *) (table1 + p31)
p33 &= 4080
p30 &= 4080

p33 = *(uint32 *) (table3 + p33)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y2 = z2 ^ p31

inint = *(uint32 *) (inp + 28)
y0 = z0 ^ p33

################  Even round LEX  ###############

tmp1 = y2 & evenmask

tmp0 = y0 & evenmask
inint ^= tmp1

(uint32) tmp0 >>= 8
y3 = z3 ^ p30

inint ^= tmp0
y1 = z1 ^ p32

#################################################
z0 = x36
p00 = (uint32) y0 << 4

z1 = x37
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x38
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x39
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 28) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p33 &= 4080

p33 = *(uint32 *) (table3 + p33)
p31 &= 4080
p30 &= 4080

p31 = *(uint32 *) (table1 + p31)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y0 = z0 ^ p33

inint = *(uint32 *) (inp + 32)
y2 = z2 ^ p31

##############  Odd round LEX  ###############

tmp0 = y0 & oddmask

tmp1 = y2 & oddmask
inint ^= tmp0

(uint32) tmp1 <<= 8
y3 = z3 ^ p30

inint ^= tmp1
y1 = z1 ^ p32

#################################################
z0 = x40
p00 = (uint32) y0 << 4

z1 = x41
p01 = (uint32) y0 >> 4 
p00 &= 4080

z2 = x42
p02 = (uint32) y0 >> 12
p01 &= 4080

z3 = x43
p03 = (uint32) y0 >> 20
p02 &= 4080

*(uint32 *) (outp + 32) = inint
p10 = (uint32) y1 << 4
p03 &= 4080

p00 = *(uint32 *) (table0 + p00)
p11 = (uint32) y1 >> 4
p10 &= 4080

p01 = *(uint32 *) (table1 + p01)
p12 = (uint32) y1 >> 12
p11 &= 4080

p02 = *(uint32 *) (table2 + p02)
p13 = (uint32) y1 >> 20
p12 &= 4080

p03 = *(uint32 *) (table3 + p03)
p13 &= 4080
z0 ^= p00

p10 = *(uint32 *) (table0 + p10)
p20 = (uint32) y2 << 4
z3 ^= p01

p11 = *(uint32 *) (table1 + p11)
p21 = (uint32) y2 >> 4
z2 ^= p02

p12 = *(uint32 *) (table2 + p12)
p22 = (uint32) y2 >> 12
z1 ^= p03

p13 = *(uint32 *) (table3 + p13)
p23 = (uint32) y2 >> 20
p20 &= 4080

p21 &= 4080
p22 &= 4080

p20 = *(uint32 *) (table0 + p20)
p33 = (uint32) y3 >> 20
z0 ^= p11

p21 = *(uint32 *) (table1 + p21)
p31 = (uint32) y3 >> 4 
p23 &= 4080

p22 = *(uint32 *) (table2 + p22)
z1 ^= p10
z3 ^= p12

p32 = (uint32) y3 >> 12
z2 ^= p13

p23 = *(uint32 *) (table3 + p23)
p30 = (uint32) y3 << 4
p31 &= 4080

p31 = *(uint32 *) (table1 + p31)
p33 &= 4080
p30 &= 4080

p33 = *(uint32 *) (table3 + p33)
p32 &= 4080
z2 ^= p20

p30 = *(uint32 *) (table0 + p30)
z1 ^= p21
z0 ^= p22

p32 = *(uint32 *) (table2 + p32)
z3 ^= p23
y2 = z2 ^ p31

inint = *(uint32 *) (inp + 36)
y0 = z0 ^ p33

################  Even round LEX  ###############

tmp1 = y2 & evenmask

tmp0 = y0 & evenmask
inint ^= tmp1

length = length_stack
(uint32) tmp0 >>= 8
y3 = z3 ^ p30

inint ^= tmp0
y1 = z1 ^ p32

*(uint32 *) (outp + 36) = inint

##################   END   ################## 

inp += 40
length -= 40

signed<? length - 40
outp += 40

goto mainloop if !signed<

lessthan40bytesleft:

signed<? =? length - 0

goto end if =

goto copy if signed<

inp_stack = inp
length_save_stack = length
outp_stack = outp

tmp0 = 0

inp = &tmp

*(uint64 *) (inp + 0) = tmp0
*(uint64 *) (inp + 8) = tmp0
*(uint64 *) (inp + 16) = tmp0
*(uint64 *) (inp + 24) = tmp0
*(uint64 *) (inp + 32) = tmp0

outp = inp

goto mainloop

copy:
length = length_save_stack
tmpp = &tmp
inp = inp_stack
outp = outp_stack

copyloop:

unsigned<? length - 1
goto end if unsigned<

dd = *(uint8 *) (tmpp + 0)
in0 = *(uint8 *) (inp + 0)
dd ^= in0
*(uint8 *) (outp + 0) = dd

outp += 1
inp +=  1
tmpp += 1
length -= 1

goto copyloop

end:

*(uint32 *) (ctxp + 56) = y0
*(uint32 *) (ctxp + 60) = y1
*(uint32 *) (ctxp + 64) = y2
*(uint32 *) (ctxp + 68) = y3

donothing:

leave
