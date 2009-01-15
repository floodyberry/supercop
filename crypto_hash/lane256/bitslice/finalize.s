#  Copyright (c) 2008 Emilia Kasper <emilia.kasper@esat.kuleuven.be>
# 
#  Permission to use, copy, modify, and distribute this software for any
#  purpose with or without fee is hereby granted, provided that the above
#  copyright notice and this permission notice appear in all copies.
# 
#  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

################################################################
### LANE256 compression function        	             ###
### bitsliced implementation for Intel Core 2 Duo processors ###
### requires support of SSE extensions up to SSSE3           ###
### Emilia Kasper, 2008		        	             ###
################################################################

######################################################
### finalize: Q-lanes of the output transformation ###
######################################################

##################
### parameters ###
##################

# expanded chaining value
# u64 h[16] in (%rdi)

##############
### macros ###				
##############


# AES S-box
# input  in msb >> [b7,b6,b5, b4,b3,b2,b1,b0] << lsb
# output in msb >> [b6,b4,b7,b12,b3,b5,b0,b1] << lsb

.macro sbox b7, b6, b5, b4, b3, b2, b1, b0, b8, b9, b10, b11, b12, b13, b14
  InBasisChange \b7, \b6, \b5, \b4, \b3, \b2, \b1, \b0 
  Inv_GF256 \b0, \b3, \b6, \b5, \b4, \b2, \b1, \b7, \b8, \b9, \b10, \b11, \b12, \b13, \b14
  OutBasisChange \b0, \b3, \b6, \b5, \b4, \b2, \b1, \b7, \b12
.endm

# InBasisChange

.macro InBasisChange g0, g1, g2, g3, g4, g5, g6, g7

xorps	 \g5, \g6
xorps	 \g1, \g6
xorps	 \g4, \g5
xorps	 \g5, \g7
xorps	 \g3, \g4

xorps	 \g0, \g4
xorps	 \g2, \g0
xorps	 \g0, \g7
xorps	 \g2, \g3
xorps	 \g6, \g2

xorps	 \g1, \g3
xorps	 \g4, \g6

.endm

#OutBasisChange

.macro OutBasisChange g0, g1, g2, g3, g4, g5, g6, g7, g8
xorps 	\g3, \g1
xorps 	\g5, \g1
xorps 	\g0, \g1
movaps	\g1, \g8
xorps	\g2, \g8

xorps	\g4, \g1
xorps	\g6, \g2
xorps	\g1, \g6
xorps	\g7, \g1
xorps	\g2, \g7

xorps	\g3, \g2
xorps	\g5, \g3
xorps	\g0, \g3
xorps	\g4, \g0
xorps	\g7, \g0

xorps	\g5, \g4

xorps	D0, \g6
xorps	D0, \g0
xorps	D0, \g7
xorps	D0, \g4

.endm

# Mul_GF4
# input x0,x1,y0,y1
# output x0,x1

.macro Mul_GF4 x0, x1, y0, y1, t0

movaps	\x1, \t0
xorps	\x0, \x1
pand	\y0, \x0
pand	\y1, \t0
xorps	\y1, \y0
pand	\y0, \x1
xorps	\x0, \x1
xorps	\t0, \x0

.endm

# Inv_GF4

.macro Inv_GF4 x0, x1
pand	\x1, \x0
xorps	D0, \x0

.endm

# Mul_GF16
# input x0-x3,y0-y3
# output x0-x3

.macro Mul_GF16 x0, x1, x2, x3, y0, y1, y2, y3, t0, t1, t2, t3

movaps	\x2, \t0
movaps	\x3, \t1
movaps	\y3, \t2

movaps	\t0, \t3
pand	\t2, \t3
pand	\y2, \t0
pand	\t1, \t2
pand	\y2, \t1

xorps	\t3, \t1
xorps	\t1, \t0
xorps	\t2, \t1

xorps	\x0, \x2
xorps	\x1, \x3
xorps	\y0, \y2
xorps	\y1, \y3


Mul_GF4 \x2, \x3, \y2, \y3, \t3
Mul_GF4	\x0, \x1, \y0, \y1, \t3

xorps	\x0, \x2
xorps	\x1, \x3
xorps	\t1, \x0
xorps	\t0, \x1

.endm

# Inv_GF16

.macro Inv_GF16 x0, x1, x2, x3, t0, t1, t2, t3

movaps	\x0, \t0
movaps	\x1, \t1
xorps	\x2, \t0
xorps	\x3, \t1
movaps	\t0, \t2

Mul_GF4 \x0, \x1, \t0, \t1, \t3
xorps	\x3, \x0
xorps	\x2, \x1
Inv_GF4	\x0, \x1
movaps	\x0, \t0
Mul_GF4 \x2, \x3, \t0, \x1, \t3
Mul_GF4 \x0, \x1, \t2, \t1, \t3

.endm

#Inv_GF256

.macro Inv_GF256 x0,x1,x2,x3,x4,x5,x6,x7,t0,t1,t2,t3,s0,s1,s2


movaps	\x0, \t0 
movaps	\x1, \t1 
movaps  \x2, \t2 
movaps  \x3, \t3 
xorps   \x4, \t0

xorps	\x5, \t1 
xorps	\x6, \t2 
xorps	\x7, \t3

movaps	\t0, 128(%rsp) 
movaps	\t1, 144(%rsp)

movaps 	\t2, 160(%rsp) 
movaps 	\t3, 176(%rsp)
movaps 	\x7, 192(%rsp)

Mul_GF16 \x0,\x1,\x2,\x3,\t0,\t1,\t2,\t3,\s0,\s1,\s2,\x7

movaps 	192(%rsp), \x7

xorps 	\x4, \x0 
xorps 	\x4, \x1
xorps 	\x4, \x2 
xorps 	\x4, \x3 
xorps 	\x5, \x1

xorps 	\x5, \x3 
xorps 	\x6, \x2 
xorps 	\x7, \x2 
xorps 	\x7, \x3

Inv_GF16 \x0,\x1,\x2,\x3,\t0,\t1,\t2,\t3

movaps 	128(%rsp), \t0 
movaps	144(%rsp), \t1
movaps  160(%rsp), \t2 
movaps	176(%rsp), \t3
movaps	\x0, 128(%rsp)
movaps	\x1, 144(%rsp)
movaps	\x2, 160(%rsp)
movaps	\x3, 176(%rsp)

Mul_GF16 \x0,\x1,\x2,\x3,\t0,\t1,\t2,\t3,\s0,\s1,\s2,\x7

movaps	128(%rsp), \t0
movaps	144(%rsp),\t1
movaps	160(%rsp),\t2
movaps	176(%rsp),\t3
movaps	\x3, 176(%rsp)
movaps	192(%rsp), \x7

Mul_GF16 \x4,\x5,\x6,\x7,\t0,\t1,\t2,\t3,\s0,\s1,\s2,\x3

movaps	176(%rsp),\x3

.endm

# AES linear components

.macro shiftrows x0, x1, x2, x3, x4, x5, x6, x7

pshufb SR, \x0
pshufb SR, \x1
pshufb SR, \x2
pshufb SR, \x3
pshufb SR, \x4
pshufb SR, \x5
pshufb SR, \x6
pshufb SR, \x7

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

xorps \t0, \x0		# x0 ^ (x0 <<< 32)
xorps \t1, \x1
xorps \t2, \x2
xorps \t3, \x3
xorps \t4, \x4
xorps \t5, \x5
xorps \t6, \x6
xorps \t7, \x7

xorps \x7, \t0
xorps \x7, \t1
xorps \x0, \t1
xorps \x1, \t2
xorps \x7, \t3
xorps \x2, \t3
xorps \x7, \t4
xorps \x3, \t4
xorps \x4, \t5
xorps \x5, \t6
xorps \x6, \t7

pshufd $0x4E, \x0, \x0 	# (x0 ^ (x0 <<< 32)) <<< 64)
pshufd $0x4E, \x1, \x1
pshufd $0x4E, \x2, \x2
pshufd $0x4E, \x3, \x3
pshufd $0x4E, \x4, \x4
pshufd $0x4E, \x5, \x5
pshufd $0x4E, \x6, \x6
pshufd $0x4E, \x7, \x7

xorps \x0, \t0
xorps \x1, \t1
xorps \x2, \t2
xorps \x3, \t3
xorps \x4, \t4
xorps \x5, \t5
xorps \x6, \t6
xorps \x7, \t7

.endm

# SwapColumns for one bit position

# we use this to get back to regs 0 - 7

.macro swap x, y, t0

movaps \x, \t0
movaps \x, \y
pand SW0, \x
pand SW1, \t0
pand SW2, \y
psrld $12, \x
pslld $12, \t0
por \x, \y
por \t0, \y

.endm

# full round of LANE256, sans counters

.macro laneround c0, c1, c2, c3, c4, c5, c6, c7

shiftrows %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7

sbox %xmm7, %xmm6, %xmm5, %xmm4, %xmm3, %xmm2, %xmm1, %xmm0, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14

# output in msb >> [xmm6, xmm4, xmm7, xmm12, xmm3, xmm5, xmm0, xmm1]  << lsb

mixcolumns %xmm1, %xmm0, %xmm5, %xmm3, %xmm12, %xmm7, %xmm4, %xmm6, %xmm2, %xmm8, %xmm9, %xmm10, %xmm11, %xmm13, %xmm14,%xmm15

# output in msb >> [xmm15, xmm14, xmm13, xmm11, xmm10, xmm9, xmm8, xmm2] << lsb

### add round constants here ###

xorps \c0, %xmm2
xorps \c1, %xmm8
xorps \c2, %xmm9
xorps \c3, %xmm10
xorps \c4, %xmm11
xorps \c5, %xmm13
xorps \c6, %xmm14
xorps \c7, %xmm15

### lanes swap ###

swap %xmm2, %xmm0, %xmm1
swap %xmm8, %xmm1, %xmm2
swap %xmm9, %xmm2, %xmm3
swap %xmm10, %xmm3, %xmm4
swap %xmm11, %xmm4, %xmm5
swap %xmm13, %xmm5, %xmm6
swap %xmm14, %xmm6, %xmm7
swap %xmm15, %xmm7, %xmm8

.endm

# last round of LANE256 (no constants)

.macro lastround

shiftrows %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7

sbox %xmm7, %xmm6, %xmm5, %xmm4, %xmm3, %xmm2, %xmm1, %xmm0, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14

# output in msb >> [xmm6, xmm4, xmm7, xmm12, xmm3, xmm5, xmm0, xmm1]  << lsb

mixcolumns %xmm1, %xmm0, %xmm5, %xmm3, %xmm12, %xmm7, %xmm4, %xmm6, %xmm2, %xmm8, %xmm9, %xmm10, %xmm11, %xmm13, %xmm14,%xmm15

### lanes swap ###

swap %xmm2, %xmm0, %xmm1
swap %xmm8, %xmm1, %xmm2
swap %xmm9, %xmm2, %xmm3
swap %xmm10, %xmm3, %xmm4
swap %xmm11, %xmm4, %xmm5
swap %xmm13, %xmm5, %xmm6
swap %xmm14, %xmm6, %xmm7
swap %xmm15, %xmm7, %xmm8

# output in xmm7-xmm0

.endm

.text

# the last 3 rounds

.global finalize

finalize:

enter $256, $0

# align stack

and $0xFFFFFFFFFFFFFF00, %rsp

movdqu (%rdi), %xmm0 	# lsb
movdqu 16(%rdi), %xmm1
movdqu 32(%rdi), %xmm2
movdqu 48(%rdi), %xmm3
movdqu 64(%rdi), %xmm4
movdqu 80(%rdi), %xmm5
movdqu 96(%rdi), %xmm6
movdqu 112(%rdi), %xmm7

# output transform takes zero counter

laneround LLC00, LLC01, LLC02, LLC03, LLC04, LLC05, LLC06, LLC07
laneround LLC10, LLC11, LLC12, LLC13, LLC14, LLC15, LLC16, LLC17
lastround

# output in msb >> [xmm7, xmm6, xmm5, xmm4, xmm3, xmm2, xmm1, xmm0]  << lsb

# collect hash value in 32 bytes

movaps %xmm0, %xmm8
psllq $1, %xmm8
xorps %xmm8, %xmm0
movaps %xmm0, %xmm8
pand LEFT, %xmm0
pand RIGHT, %xmm8
psrlq $5, %xmm0
psrlq $1, %xmm8

movaps %xmm1, %xmm9
psllq $1, %xmm9
xorps %xmm9, %xmm1
movaps %xmm1, %xmm9
pand LEFT, %xmm1
pand RIGHT, %xmm9
psrlq $4, %xmm1
xorps %xmm1, %xmm0
xorps %xmm9, %xmm8

movaps %xmm2, %xmm10
psllq $1, %xmm10
xorps %xmm10, %xmm2
movaps %xmm2, %xmm10
pand LEFT, %xmm2
pand RIGHT, %xmm10
psrlq $3, %xmm2
psllq $1, %xmm10
xorps %xmm2, %xmm0
xorps %xmm10, %xmm8

movaps %xmm3, %xmm11
psllq $1, %xmm11
xorps %xmm11, %xmm3
movaps %xmm3, %xmm11
pand LEFT, %xmm3
pand RIGHT, %xmm11
psrlq $2, %xmm3
psllq $2, %xmm11
xorps %xmm3, %xmm0
xorps %xmm11, %xmm8

movaps %xmm4, %xmm12
psllq $1, %xmm12
xorps %xmm12, %xmm4
movaps %xmm4, %xmm12
pand LEFT, %xmm4
pand RIGHT, %xmm12
psrlq $1, %xmm4
psllq $3, %xmm12
xorps %xmm4, %xmm0
xorps %xmm12, %xmm8

movaps %xmm5, %xmm13
psllq $1, %xmm13
xorps %xmm13, %xmm5
movaps %xmm5, %xmm13
pand LEFT, %xmm5
pand RIGHT, %xmm13
psllq $4, %xmm13
xorps %xmm5, %xmm0
xorps %xmm13, %xmm8

movaps %xmm6, %xmm14
psllq $1, %xmm14
xorps %xmm14, %xmm6
movaps %xmm6, %xmm14
pand LEFT, %xmm6
pand RIGHT, %xmm14
psllq $1, %xmm6
psllq $5, %xmm14
xorps %xmm6, %xmm0
xorps %xmm14, %xmm8

movaps %xmm7, %xmm15
psllq $1, %xmm15
xorps %xmm15, %xmm7
movaps %xmm7, %xmm15
pand LEFT, %xmm7
pand RIGHT, %xmm15
psllq $2, %xmm7
psllq $6, %xmm15
xorps %xmm7, %xmm0
xorps %xmm15, %xmm8

# restore correct byte order

pshufb USHUF, %xmm0
pshufb USHUF, %xmm8

movdqu %xmm0, (%rdi)
movdqu %xmm8, 16(%rdi)

leave

ret

.data

.align 16

D0: .quad 0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF

# shiftrows

SR: .quad 0x0504070600030201, 0x0f0e0d0c0a09080b

# swap masks

SW0: .quad 0x0F0F00000F0F0000, 0x0f0f00000f0f0000
SW1: .quad 0x0000f0f00000f0f0, 0x0000f0f00000f0f0
SW2: .quad 0xf0f00f0ff0f00f0f, 0xf0f00f0ff0f00f0f

# finalize masks

LEFT: .quad 0x2020202020202020, 0x2020202020202020
RIGHT: .quad 0x0202020202020202, 0x0202020202020202 

USHUF: .quad 0x0f0b07030e0a0602, 0x0d0905010c080400

# constants for lanes Q0, Q1

LLC00:	.int 0x5ce9c34c, 0x1c80d5fd, 0xdc778d5e, 0x3199e2ba
LLC01:	.int 0xb52a8f81, 0x80d5fdcd, 0x778d5ec3, 0x99e2ba1f
LLC02:	.int 0x2a8f8158, 0xd5fdcd07, 0x8d5ec379, 0xe2ba1f9e
LLC03:	.int 0x8f8158ad, 0xfdcd0758, 0x5ec379de, 0xba1f9e21
LLC04:	.int 0x8158adff, 0xcd0758d5, 0xc379deeb, 0x1f9e21ab
LLC05:	.int 0x58adff1c, 0x758d5dc, 0x79deeb31, 0xc2c868b5
LLC06:	.int 0xadff1c80, 0x58d5dc77, 0xdeeb3199, 0xc868b52a
LLC07:	.int 0xff1c80d5, 0xd5dc778d, 0xeb3199e2, 0x345ce9c3
LLC10:	.int 0xdb5b8e73, 0xdc778d5e, 0x3199e2ba, 0xf9e71ab9
LLC11:	.int 0x80d5fdcd, 0x778d5ec3, 0x99e2ba1f, 0xe71ab99f
LLC12:	.int 0xd5fdcd07, 0x8d5ec379, 0xe2ba1f9e, 0x1ab99f76
LLC13:	.int 0xfdcd0758, 0x5ec379de, 0xba1f9e21, 0xb99f76a4
LLC14:	.int 0xcd0758d5, 0xc379deeb, 0x1f9e21ab, 0x9f76a492
LLC15:	.int 0x758d5dc, 0x79deeb31, 0x9e21abf9, 0xadff1c80
LLC16:	.int 0x58d5dc77, 0xdeeb3199, 0x21abf9e7, 0xff1c80d5
LLC17:	.int 0xd5dc778d, 0xeb3199e2, 0xabf9e71a, 0xc7db5b8e

