# Author: Emilia Käsper				     	
# Date: 2009-03-19					     
# Public domain

.ifndef COMMON_SBOX_S
COMMON_SBOX_S:

# sbox
# input in  lsb > [b0, b1, b2, b3, b4, b5, b6, b7] < msb
# output in lsb > [b0, b1, b4, b6, b3, b7, b2, b5] < msb

.macro sbox b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, s0, s1, s2, s3

InBasisChange \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7
Inv_GF256 \b6, \b5, \b0, \b3, \b7, \b1, \b4, \b2, \t0, \t1, \t2, \t3, \s0, \s1, \s2, \s3
OutBasisChange \b7, \b1, \b4, \b2, \b6, \b5, \b0, \b3

.endm


# InBasisChange
# input in  lsb > [b0, b1, b2, b3, b4, b5, b6, b7] < msb
# output in lsb > [b6, b5, b0, b3, b7, b1, b4, b2] < msb 

.macro InBasisChange b0, b1, b2, b3, b4, b5, b6, b7

pxor	\b6, \b5
pxor	\b1, \b2
pxor 	\b0, \b5
pxor	\b2, \b6
pxor 	\b0, \b3

pxor	\b3, \b6
pxor	\b7, \b3
pxor	\b4, \b3
pxor	\b5, \b7
pxor	\b1, \b3

pxor	\b5, \b4
pxor	\b7, \b2
pxor	\b5, \b1

.endm


# OutBasisChange
# input in  lsb > [b0, b1, b2, b3, b4, b5, b6, b7] < msb
# output in lsb > [b6, b1, b2, b4, b7, b0, b3, b5] < msb

.macro OutBasisChange b0, b1, b2, b3, b4, b5, b6, b7

pxor	\b6, \b0
pxor	\b4, \b1
pxor	\b0, \b2
pxor	\b6, \b4
pxor	\b1, \b6

pxor	\b5, \b1
pxor	\b3, \b5
pxor	\b5, \b2
pxor	\b7, \b3
pxor	\b5, \b7

pxor	\b7, \b4

# can modify subkeys instead
# *** stillich ***
# Reenabled the transformation below
pxor	ONE, \b3
pxor	ONE, \b0
pxor	ONE, \b1
pxor	ONE, \b6

.endm

#;*************************************************************
#;* Mul_GF4: Input x0-x1,y0-y1 Output x0-x1 Temp t0 (8) *
#;*************************************************************

# Mul_GF4

.macro Mul_GF4 x0, x1, y0, y1, t0

movdqa 	\y0, \t0
pxor 	\y1, \t0
pand	\x0, \t0
pxor	\x1, \x0
pand	\y1, \x0
pand	\y0, \x1
pxor	\x1, \x0
pxor	\t0, \x1

.endm

# multiply and scale by N

.macro Mul_GF4_N x0, x1, y0, y1, t0

movdqa 	\y0, \t0
pxor	\y1, \t0
pand	\x0, \t0
pxor	\x1, \x0
pand	\y1, \x0
pand	\y0, \x1
pxor	\x0, \x1
pxor	\t0, \x0

.endm

# multiply with common factor y

.macro Mul_GF4_2 x0, x1, x2, x3, y0, y1, t0, t1

movdqa 	\y0, \t0
pxor 	\y1, \t0
movdqa	\t0, \t1
pand	\x0, \t0
pand	\x2, \t1
pxor	\x1, \x0
pxor	\x3, \x2
pand	\y1, \x0
pand	\y1, \x2
pand	\y0, \x1
pand	\y0, \x3
pxor	\x1, \x0
pxor	\x3, \x2
pxor	\t0, \x1
pxor	\t1, \x3

.endm

#;**********************************************
#;* Inv_GF4: Input x0,x1 Output x1 ,x0 (0)     *
#;**********************************************

# inversion is swapping

#;******************************************************************
#;* Mul_GF16: Input x0-x3,y0-y3 Output x0-x3 Temp t0-t3 (34)       *
#;******************************************************************

.macro Mul_GF16 x0, x1, x2, x3, y0, y1, y2, y3, t0, t1, t2, t3


movdqa	\x0, \t0
movdqa	\x1, \t1
Mul_GF4 \x0, \x1, \y0, \y1, \t2
pxor	\x2, \t0
pxor	\x3, \t1
pxor	\y2, \y0
pxor	\y3, \y1
Mul_GF4_N \t0, \t1, \y0, \y1, \t2
Mul_GF4 \x2, \x3, \y2, \y3, \t3

pxor	\t0, \x0
pxor	\t0, \x2
pxor	\t1, \x1
pxor	\t1, \x3

.endm

# multiply with common factors

.macro Mul_GF16_2 x0, x1, x2, x3, x4, x5, x6, x7, y0, y1, y2, y3, t0, t1, t2, t3

movdqa	\x0, \t0
movdqa	\x1, \t1
Mul_GF4 \x0, \x1, \y0, \y1, \t2
pxor	\x2, \t0
pxor	\x3, \t1
pxor	\y2, \y0
pxor	\y3, \y1
Mul_GF4_N \t0, \t1, \y0, \y1, \t3
Mul_GF4 \x2, \x3, \y2, \y3, \t2

pxor	\t0, \x0
pxor	\t0, \x2
pxor	\t1, \x1
pxor	\t1, \x3

movdqa	\x4, \t0
movdqa	\x5, \t1
pxor	\x6, \t0
pxor	\x7, \t1
Mul_GF4_N \t0, \t1, \y0, \y1, \t3
Mul_GF4	\x6, \x7, \y2, \y3, \t2
pxor	\y2, \y0
pxor	\y3, \y1
Mul_GF4	\x4, \x5, \y0, \y1, \t3

pxor	\t0, \x4
pxor	\t0, \x6
pxor	\t1, \x5
pxor	\t1, \x7

.endm

#;************************************************************
#;* Inv_GF16: Input x0-x3 Output x0-x3 Temp t0-t3 (26)       *
#;************************************************************


# Inv_GF16

.macro Inv_GF16 x0, x1, x2, x3, t0, t1, t2, t3

movdqa	\x1, \t0
movdqa	\x0, \t1
pand	\x3, \t0
por	\x2, \t1
movdqa	\x1, \t2
movdqa	\x0, \t3
por	\x2, \t2
por	\x3, \t3
pxor	\t3, \t2
pxor	\t2, \t0
pxor	\t2, \t1

#inversion for (t0, t1) is swapping

Mul_GF4_2 \x0, \x1, \x2, \x3, \t1, \t0, \t2, \t3

.endm


#;********************************************************************
#;* Inv_GF256: Input x0-x7 Output x0-x7 Temp t0-t3,s0-s3 (144)       *
#;********************************************************************


#Inv_GF256

.macro Inv_GF256 x0,x1,x2,x3,x4,x5,x6,x7,t0,t1,t2,t3,s0,s1,s2,s3

# direct optimizations from hardware

movdqa  \x4, \t3
movdqa	\x5, \t2
movdqa	\x1, \t1
movdqa	\x7, \s1
movdqa	\x0, \s0

pxor	\x6, \t3
pxor	\x7, \t2
pxor	\x3, \t1
pxor	\x6, \s1
pxor	\x2, \s0

movdqa	\t3, \s2
movdqa	\t2, \t0
movdqa	\t3, \s3

por	\t1, \t2
por	\s0, \t3
pxor	\t0, \s3
pand	\s0, \s2
pand	\t1, \t0
pxor	\t1, \s0
pand	\s0, \s3
movdqa	\x3, \s0
pxor	\x2, \s0
pand	\s0, \s1
pxor	\s1, \t3
pxor	\s1, \t2
movdqa	\x4, \s1
pxor	\x5, \s1
movdqa	\x1, \s0
movdqa	\s1, \t1
pxor	\x0, \s0
por	\s0, \t1
pand	\s0, \s1
pxor	\s1, \t0
pxor	\s3, \t3
pxor	\s2, \t2
pxor	\s3, \t1
pxor	\s2, \t0
pxor	\s2, \t1
movdqa	\x7, \s0
movdqa	\x6, \s1
movdqa	\x5, \s2
movdqa	\x4, \s3
pand	\x3, \s0
pand	\x2, \s1
pand	\x1, \s2
por	\x0, \s3
pxor	\s0, \t3
pxor	\s1, \t2
pxor	\s2, \t1
pxor	\s3, \t0 

#Inv_GF16 \t0, \t1, \t2, \t3, \s0, \s1, \s2, \s3

# new smaller inversion

movdqa	\t3, \s0
pxor	\t2, \s0

pand	\t1, \t3

movdqa	\t0, \s2
pxor	\t3, \s2

movdqa	\s0, \s3
pand	\s2, \s3

pxor	\t2, \s3

movdqa	\t1, \s1
pxor	\t0, \s1

pxor	\t2, \t3

pand	\t3, \s1

pxor	\t0, \s1

pxor	\s1, \t1

movdqa	\s2, \t2
pxor	\s1, \t2

pand	\t0, \t2

pxor	\t2, \t1

pxor	\t2, \s2

pand	\s3, \s2

pxor	\s0, \s2


# output in s3, s2, s1, t1


# Mul_GF16_2 \x0, \x1, \x2, \x3, \x4, \x5, \x6, \x7, \t2, \t3, \t0, \t1, \s0, \s1, \s2, \s3

Mul_GF16_2 \x0, \x1, \x2, \x3, \x4, \x5, \x6, \x7, \s3, \s2, \s1, \t1, \s0, \t0, \t2, \t3

### output msb > [x3,x2,x1,x0,x7,x6,x5,x4] < lsb

.endm

.endif
