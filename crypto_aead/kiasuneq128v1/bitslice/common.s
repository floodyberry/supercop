################################################################
### Original Author: Emilia Käsper                           ###
### Original Date: 2009-03-19                                ###
### Original Status: Public domain                           ###
### Modified by: Jeremy Jean, 2014-04-04 (tweaked AES)       ###
################################################################

.ifndef COMMON_S
COMMON_S:

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
pxor	ONE, \b3
pxor	ONE, \b0
pxor	ONE, \b1
pxor	ONE, \b6

.endm

#*************************************************************
#* Mul_GF4: Input x0-x1,y0-y1 Output x0-x1 Temp t0 (8) *
#*************************************************************

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

#**********************************************
#* Inv_GF4: Input x0,x1 Output x1 ,x0 (0)     *
#**********************************************

# inversion is swapping

#******************************************************************
#* Mul_GF16: Input x0-x3,y0-y3 Output x0-x3 Temp t0-t3 (34)       *
#******************************************************************

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

#************************************************************
#* Inv_GF16: Input x0-x3 Output x0-x3 Temp t0-t3 (26)       *
#************************************************************


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


#********************************************************************
#* Inv_GF256: Input x0-x7 Output x0-x7 Temp t0-t3,s0-s3 (144)       *
#********************************************************************


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

# AES linear components

.macro shiftrows x0, x1, x2, x3, x4, x5, x6, x7, i, M, k

pxor (128*(\i-1))(\k), \x0
pshufb \M, \x0
pxor (128*(\i-1)+16)(\k), \x1
pshufb \M, \x1
pxor (128*(\i-1)+32)(\k), \x2
pshufb \M, \x2
pxor (128*(\i-1)+48)(\k), \x3
pshufb \M, \x3
pxor (128*(\i-1)+64)(\k), \x4
pshufb \M, \x4
pxor (128*(\i-1)+80)(\k), \x5
pshufb \M, \x5
pxor (128*(\i-1)+96)(\k), \x6
pshufb \M, \x6
pxor (128*(\i-1)+112)(\k),\x7
pshufb \M, \x7

.endm



### ShiftRow including Key and Tweak (added by Jeremy)
.macro shiftrowsTWEAKED x0, x1, x2, x3, x4, x5, x6, x7, i, M, k, tw

### Key addition
pxor (128*(\i-1)    )(\k), \x0
pxor (128*(\i-1)+ 16)(\k), \x1
pxor (128*(\i-1)+ 32)(\k), \x2
pxor (128*(\i-1)+ 48)(\k), \x3
pxor (128*(\i-1)+ 64)(\k), \x4
pxor (128*(\i-1)+ 80)(\k), \x5
pxor (128*(\i-1)+ 96)(\k), \x6
pxor (128*(\i-1)+112)(\k), \x7

### Tweak addition
pxor               (\tw), \x0
pxor             16(\tw), \x1
pxor             32(\tw), \x2
pxor             48(\tw), \x3
pxor             64(\tw), \x4
pxor             80(\tw), \x5
pxor             96(\tw), \x6
pxor            112(\tw), \x7
	
### Counter for the permutations
pxor             CSTTWA, \x0
pxor             CSTTWB, \x1
pxor             CSTTWC, \x2

### Shiftrows
pshufb               \M, \x0
pshufb               \M, \x1
pshufb               \M, \x2
pshufb               \M, \x3
pshufb               \M, \x4
pshufb               \M, \x5
pshufb               \M, \x6
pshufb               \M, \x7

.endm

.macro mixcolumns x0, x1, x2, x3, x4, x5, x6, x7, t0, t1, t2, t3, t4, t5, t6, t7

pshufd $0x93, \x0, \t0 	# x0 <<< 32
pshufd $0x93, \x1, \t1
pshufd $0x93, \x2, \t2
pshufd $0x93, \x3, \t3
pshufd $0x93, \x4, \t4
pshufd $0x93, \x5, \t5
pshufd $0x93, \x6, \t6
pshufd $0x93, \x7, \t7

pxor \t0, \x0		# x0 ^ (x0 <<< 32)
pxor \t1, \x1
pxor \t2, \x2
pxor \t3, \x3
pxor \t4, \x4
pxor \t5, \x5
pxor \t6, \x6
pxor \t7, \x7

pxor \x7, \t0
pxor \x0, \t1
pxor \x1, \t2
pxor \x7, \t1
pxor \x2, \t3
pxor \x3, \t4
pxor \x4, \t5
pxor \x7, \t3
pxor \x5, \t6
pxor \x6, \t7
pxor \x7, \t4

pshufd $0x4E, \x0, \x0 	# (x0 ^ (x0 <<< 32)) <<< 64)
pshufd $0x4E, \x1, \x1
pshufd $0x4E, \x2, \x2
pshufd $0x4E, \x3, \x3
pshufd $0x4E, \x4, \x4
pshufd $0x4E, \x5, \x5
pshufd $0x4E, \x6, \x6
pshufd $0x4E, \x7, \x7

pxor \x0, \t0
pxor \x1, \t1
pxor \x2, \t2
pxor \x3, \t3
pxor \x4, \t4
pxor \x5, \t5
pxor \x6, \t6
pxor \x7, \t7

.endm


# full round of AES
.macro aesround i, b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k

# shiftrows macro includes (interleaved) round key addition
shiftrows \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \i, SR, \k

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
#output in b0, b1, b4, b6, b3, b7, b2, b5

mixcolumns \b0, \b1, \b4, \b6, \b3, \b7, \b2, \b5, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
# output in msb > [t7, t6, t5, t4, t3, t2, t1, t0] < lsb

.endm


#### full tweaked AES round (added by Jeremy)
.macro aesroundTWEAKED i, b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k, tw

# shiftrows macro includes (interleaved) round key addition
shiftrowsTWEAKED \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \i, SR, \k, \tw

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
#output in b0, b1, b4, b6, b3, b7, b2, b5

mixcolumns \b0, \b1, \b4, \b6, \b3, \b7, \b2, \b5, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
# output in msb > [t7, t6, t5, t4, t3, t2, t1, t0] < lsb

.endm




# last round of AES
.macro lastround b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k

# shiftrows macro includes (interleaved) round key addition and output shuffle
shiftrows \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, 10, SRM0, \k
	
sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
#output in b0, b1, b4, b6, b3, b7, b2, b5

# last key addition
pxor (128*10    )(\k), \b0
pxor (128*10+ 16)(\k), \b1
pxor (128*10+ 32)(\k), \b4
pxor (128*10+ 48)(\k), \b6
pxor (128*10+ 64)(\k), \b3
pxor (128*10+ 80)(\k), \b7
pxor (128*10+ 96)(\k), \b2
pxor (128*10+112)(\k), \b5

.endm



# last round of AES (added by Jeremy)

.macro lastroundTWEAKED b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k, tw

# shiftrows macro includes (interleaved) round key addition and output shuffle
shiftrowsTWEAKED \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, 10, SR, \k, \tw

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
#output in b0, b1, b4, b6, b3, b7, b2, b5

# last key addition
pxor (128*10    )(\k), \b0
pxor (128*10+ 16)(\k), \b1
pxor (128*10+ 32)(\k), \b4
pxor (128*10+ 48)(\k), \b6
pxor (128*10+ 64)(\k), \b3
pxor (128*10+ 80)(\k), \b7
pxor (128*10+ 96)(\k), \b2
pxor (128*10+112)(\k), \b5

#pshufb M0, \b0
#pshufb M0, \b1
#pshufb M0, \b2
#pshufb M0, \b3
#pshufb M0, \b4
#pshufb M0, \b5
#pshufb M0, \b6
#pshufb M0, \b7

pxor      (\tw), \b0
pxor  (16)(\tw), \b1
pxor  (32)(\tw), \b4
pxor  (48)(\tw), \b6
pxor  (64)(\tw), \b3
pxor  (80)(\tw), \b7
pxor  (96)(\tw), \b2
pxor (112)(\tw), \b5

### Counter for the permutations
pxor             CSTTWA, \b0
pxor             CSTTWB, \b1
pxor             CSTTWC, \b4

	
#pshufb M0, \b0
#pshufb M0, \b1
#pshufb M0, \b2
#pshufb M0, \b3
#pshufb M0, \b4
#pshufb M0, \b5
#pshufb M0, \b6
#pshufb M0, \b7

.endm

.macro swapmove a, b, n, m, t

movdqa 	\b, \t
psrlq  	\n, \t
pxor  	\a, \t
pand	\m, \t
pxor	\t, \a
psllq	\n, \t
pxor	\t, \b

.endm

.macro bitslice x0, x1, x2, x3, x4, x5, x6, x7, t

swapmove \x0, \x1, $1, BS0, \t
swapmove \x2, \x3, $1, BS0, \t
swapmove \x4, \x5, $1, BS0, \t
swapmove \x6, \x7, $1, BS0, \t

swapmove \x0, \x2, $2, BS1, \t
swapmove \x1, \x3, $2, BS1, \t
swapmove \x4, \x6, $2, BS1, \t
swapmove \x5, \x7, $2, BS1, \t

swapmove \x0, \x4, $4, BS2, \t
swapmove \x1, \x5, $4, BS2, \t
swapmove \x2, \x6, $4, BS2, \t
swapmove \x3, \x7, $4, BS2, \t

.endm

.macro bitslicekey0 key, bskey

movdqu (\key), %xmm0
pshufb M0,     %xmm0
movdqa %xmm0,  %xmm1
movdqa %xmm0,  %xmm2
movdqa %xmm0,  %xmm3
movdqa %xmm0,  %xmm4
movdqa %xmm0,  %xmm5
movdqa %xmm0,  %xmm6
movdqa %xmm0,  %xmm7

bitslice %xmm7, %xmm6, %xmm5, %xmm4, %xmm3, %xmm2, %xmm1, %xmm0, %xmm8

movdqa %xmm0,    (\bskey)
movdqa %xmm1,  16(\bskey)
movdqa %xmm2,  32(\bskey)
movdqa %xmm3,  48(\bskey)
movdqa %xmm4,  64(\bskey)
movdqa %xmm5,  80(\bskey)
movdqa %xmm6,  96(\bskey)
movdqa %xmm7, 112(\bskey)

.endm

.macro xorkeys b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7

pxor \t0, \b0
pxor \t1, \b1
pxor \t2, \b4
pxor \t3, \b6
pxor \t4, \b3
pxor \t5, \b7
pxor \t6, \b2
pxor \t7, \b5

psrld $8,\t0
psrld $8,\t1
psrld $8,\t2
psrld $8,\t3
psrld $8,\t4
psrld $8,\t5
psrld $8,\t6
psrld $8,\t7

pxor \t0, \b0
pxor \t1, \b1
pxor \t2, \b4
pxor \t3, \b6
pxor \t4, \b3
pxor \t5, \b7
pxor \t6, \b2
pxor \t7, \b5

psrld $8,\t0
psrld $8,\t1
psrld $8,\t2
psrld $8,\t3
psrld $8,\t4
psrld $8,\t5
psrld $8,\t6
psrld $8,\t7

pxor \t0, \b0
pxor \t1, \b1
pxor \t2, \b4
pxor \t3, \b6
pxor \t4, \b3
pxor \t5, \b7
pxor \t6, \b2
pxor \t7, \b5

psrld $8,\t0
psrld $8,\t1
psrld $8,\t2
psrld $8,\t3
psrld $8,\t4
psrld $8,\t5
psrld $8,\t6
psrld $8,\t7

pxor \t0, \b0
pxor \t1, \b1
pxor \t2, \b4
pxor \t3, \b6
pxor \t4, \b3
pxor \t5, \b7
pxor \t6, \b2
pxor \t7, \b5

.endm


.macro keyexp1 b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey

pshufb ROTB, \b0
pshufb ROTB, \b1
pshufb ROTB, \b2
pshufb ROTB, \b3
pshufb ROTB, \b4
pshufb ROTB, \b5
pshufb ROTB, \b6
pshufb ROTB, \b7

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

pxor RCON, \b0

pshufb EXPB0, \b0
pshufb EXPB0, \b1
pshufb EXPB0, \b4
pshufb EXPB0, \b6
pshufb EXPB0, \b3
pshufb EXPB0, \b7
pshufb EXPB0, \b2
pshufb EXPB0, \b5

movdqa   0(\bskey), \t0
movdqa  16(\bskey), \t1
movdqa  32(\bskey), \t2
movdqa  48(\bskey), \t3
movdqa  64(\bskey), \t4
movdqa  80(\bskey), \t5
movdqa  96(\bskey), \t6
movdqa 112(\bskey), \t7

xorkeys \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

movdqa \b0,128(\bskey)
movdqa \b1,144(\bskey)
movdqa \b4,160(\bskey)
movdqa \b6,176(\bskey)
movdqa \b3,192(\bskey)
movdqa \b7,208(\bskey)
movdqa \b2,224(\bskey)
movdqa \b5,240(\bskey)

.endm


.macro keyexp9 b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey
#pxor ONE, \b0
#pxor ONE, \b1
#pxor ONE, \b5
#pxor ONE, \b6

pshufb ROTB, \b0
pshufb ROTB, \b1
pshufb ROTB, \b2
pshufb ROTB, \b3
pshufb ROTB, \b4
pshufb ROTB, \b5
pshufb ROTB, \b6
pshufb ROTB, \b7

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

pxor RCON, \b0
pxor RCON, \b1
pxor RCON, \b6
pxor RCON, \b3

pshufb EXPB0, \b0
pshufb EXPB0, \b1
pshufb EXPB0, \b4
pshufb EXPB0, \b6
pshufb EXPB0, \b3
pshufb EXPB0, \b7
pshufb EXPB0, \b2
pshufb EXPB0, \b5

movdqa 1024(\bskey), \t0
movdqa 1040(\bskey), \t1
movdqa 1056(\bskey), \t2
movdqa 1072(\bskey), \t3
movdqa 1088(\bskey), \t4
movdqa 1104(\bskey), \t5
movdqa 1120(\bskey), \t6
movdqa 1136(\bskey), \t7

#pxor ONE, \t0
#pxor ONE, \t1
#pxor ONE, \t5
#pxor ONE, \t6

xorkeys \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

movdqa \b0,1152(\bskey)
movdqa \b1,1168(\bskey)
movdqa \b4,1184(\bskey)
movdqa \b6,1200(\bskey)
movdqa \b3,1216(\bskey)
movdqa \b7,1232(\bskey)
movdqa \b2,1248(\bskey)
movdqa \b5,1264(\bskey)

.endm

.macro keyexp10 b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey
#pxor ONE, \b0
#pxor ONE, \b1
#pxor ONE, \b5
#pxor ONE, \b6

pshufb ROTB, \b0
pshufb ROTB, \b1
pshufb ROTB, \b2
pshufb ROTB, \b3
pshufb ROTB, \b4
pshufb ROTB, \b5
pshufb ROTB, \b6
pshufb ROTB, \b7

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

pxor RCON, \b1
pxor RCON, \b4
pxor RCON, \b3
pxor RCON, \b7

pshufb EXPB0, \b0
pshufb EXPB0, \b1
pshufb EXPB0, \b4
pshufb EXPB0, \b6
pshufb EXPB0, \b3
pshufb EXPB0, \b7
pshufb EXPB0, \b2
pshufb EXPB0, \b5

movdqa 1152(\bskey), \t0
movdqa 1168(\bskey), \t1
movdqa 1184(\bskey), \t2
movdqa 1200(\bskey), \t3
movdqa 1216(\bskey), \t4
movdqa 1232(\bskey), \t5
movdqa 1248(\bskey), \t6
movdqa 1264(\bskey), \t7

#pxor ONE, \t0
#pxor ONE, \t1
#pxor ONE, \t5
#pxor ONE, \t6

xorkeys \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

#pshufb M0, \b0
#pshufb M0, \b1
#pshufb M0, \b2
#pshufb M0, \b3
#pshufb M0, \b4
#pshufb M0, \b5
#pshufb M0, \b6
#pshufb M0, \b7

movdqa \b0,1280(\bskey)
movdqa \b1,1296(\bskey)
movdqa \b4,1312(\bskey)
movdqa \b6,1328(\bskey)
movdqa \b3,1344(\bskey)
movdqa \b7,1360(\bskey)
movdqa \b2,1376(\bskey)
movdqa \b5,1392(\bskey)

.endm

.macro keyexp b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, rconbit, round, bskey
#pxor ONE, \b0
#pxor ONE, \b1
#pxor ONE, \b5
#pxor ONE, \b6

pshufb ROTB, \b0
pshufb ROTB, \b1
pshufb ROTB, \b2
pshufb ROTB, \b3
pshufb ROTB, \b4
pshufb ROTB, \b5
pshufb ROTB, \b6
pshufb ROTB, \b7

sbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

pxor RCON, \rconbit

pshufb EXPB0, \b0
pshufb EXPB0, \b1
pshufb EXPB0, \b4
pshufb EXPB0, \b6
pshufb EXPB0, \b3
pshufb EXPB0, \b7
pshufb EXPB0, \b2
pshufb EXPB0, \b5

movdqa ((\round-1)*128 +   0)(\bskey), \t0
movdqa ((\round-1)*128 +  16)(\bskey), \t1
movdqa ((\round-1)*128 +  32)(\bskey), \t2
movdqa ((\round-1)*128 +  48)(\bskey), \t3
movdqa ((\round-1)*128 +  64)(\bskey), \t4
movdqa ((\round-1)*128 +  80)(\bskey), \t5
movdqa ((\round-1)*128 +  96)(\bskey), \t6
movdqa ((\round-1)*128 + 112)(\bskey), \t7

#pxor ONE, \t0
#pxor ONE, \t1
#pxor ONE, \t5
#pxor ONE, \t6

xorkeys \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7

movdqa \b0,(\round*128 +   0)(\bskey)
movdqa \b1,(\round*128 +  16)(\bskey)
movdqa \b4,(\round*128 +  32)(\bskey)
movdqa \b6,(\round*128 +  48)(\bskey)
movdqa \b3,(\round*128 +  64)(\bskey)
movdqa \b7,(\round*128 +  80)(\bskey)
movdqa \b2,(\round*128 +  96)(\bskey)
movdqa \b5,(\round*128 + 112)(\bskey)

.endm


## Full AES128 Encryption
.macro aes128 b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k

# b0 - b7 data blocks
# k - key address

bitslice \b7, \b6, \b5, \b4, \b3, \b2, \b1, \b0, \t0

# encrypt
aesround 1, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k
aesround 2, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k
aesround 3, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k
aesround 4, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k
aesround 5, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k
aesround 6, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k
aesround 7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k
aesround 8, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k
aesround 9, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k
lastround   \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k
# output in lsb > [t0, t1, t4, t6, t3, t7, t2, t5] < msb
	
bitslice \t5, \t2, \t7, \t3, \t6, \t4, \t1, \t0, \b0

.endm



## Full Twkeaked AES128 Encryption (added by Jeremy)
.macro aes128TWEAKED b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k, tw

# b0 - b7 data blocks
# k - key address
# tw - tweak address

bitslice \b7, \b6, \b5, \b4, \b3, \b2, \b1, \b0, \t0
	
# encrypt
aesroundTWEAKED  1, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
aesroundTWEAKED  2, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
aesroundTWEAKED  3, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
aesroundTWEAKED  4, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
aesroundTWEAKED  5, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
aesroundTWEAKED  6, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
aesroundTWEAKED  7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
aesroundTWEAKED  8, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
aesroundTWEAKED  9, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
lastroundTWEAKED    \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
# output in lsb > [t0, t1, t4, t6, t3, t7, t2, t5] < msb

bitslice \t5, \t2, \t7, \t3, \t6, \t4, \t1, \t0, \b0

.endm

.endif
