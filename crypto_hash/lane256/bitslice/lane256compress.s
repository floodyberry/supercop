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

################################################################
### lane256_compress: Q-lanes of call i-1, P-lanes of call i ###
################################################################

##################
### parameters ###
##################

# u64 h[16] in (%rdi)
# u8 m[64] in (%rsi)
# u64 ctr in %rdx
# u64 ctr_prev in %rcx


##############
### macros ###				
##############

# the basic bitslicing step

.macro swapmove a, b, n, m, t

movaps 	\b, \t
psrlq  	\n, \t
xorps  	\a, \t
pand	\m, \t
xorps	\t, \a
psllq	\n, \t
xorps	\t, \b

.endm

# micro-optimizatons

# swapmove a = 0

.macro swapmove0x a, b, n, m

movaps \b, \a
psrlq \n, \a
pand \m, \a
pand \m, \b

.endm

# swapmove b = 0

.macro swapmovex0 a, b, n, m

movaps \a, \b
psllq \n, \b
pand \m, \a
pand \m, \b

.endm

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

# merge chaining value with expanded message
# input x0
# output y0, y1

.macro blendlanes x0, y0, y1, t

movaps \x0, \t
pand BS11, \x0
por  \x0, \y0
psllq $2, \t
pand BS11, \t
por \t, \y1

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

# we use this to get back to regs 0 - 7

# SwapColumns for one bit position

.macro swap x, y, t0

movaps \x, \t0
movaps \t0, \y
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

### add round constants ###

xorps \c0, %xmm2
xorps \c1, %xmm8
xorps \c2, %xmm9
xorps \c3, %xmm10
xorps \c4, %xmm11
xorps \c5, %xmm13
xorps \c6, %xmm14
xorps \c7, %xmm15

### lanes swap ###

swap %xmm2, %xmm0, %xmm12
swap %xmm8, %xmm1, %xmm5
swap %xmm9, %xmm2, %xmm6
swap %xmm10, %xmm3, %xmm7
swap %xmm11, %xmm4, %xmm12
swap %xmm13, %xmm5, %xmm8
swap %xmm14, %xmm6, %xmm9
swap %xmm15, %xmm7, %xmm10

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

# msg expansion for bitsliced chaining value

.macro expandcv x, y, t0, t1

# xor lanes 6 and 7

movaps \x, \t0
psllq $1, \t0
xorps \t0, \x

# expand chaining value

movaps \x, \t1
pand CVL, \t1
movaps \t1, \t0
psllq $1, \t0
xorps \t0, \t1
psllq $1, \t0
xorps \t0, \t1
psrlq $3, \t0
xorps \t0, \t1
psrlq $2, \t0
xorps \t0, \t1
psrlq $1, \t0
xorps \t0, \t1

pand CVR, \x
psrlq $1, \x
xorps \x, \t1
psllq $3, \x
xorps \x, \t1
psllq $2, \x
xorps \x, \t1
psllq $1, \x
xorps \x, \t1

xorps \t1, \y

.endm

# XOR combiner for lanes P0-P3

.macro xorlanes x, t0, t1

movaps \x, \t0
movaps \x, \t1
pand XOR3, \t0
pand XOR2, \t1
psrlq $2, \t0
psrlq $1, \t1
xorps \t0, \x
xorps \t1, \x
pand L67, \x

.endm

.text

.global lane256_compress

lane256_compress:

enter $640, $0

# align stack - do i have to?

and $0xFFFFFFFFFFFFFF00, %rsp

# bitslice counter ctrh ctrl ctrprevh ctrprevh

movd  %rdx, %xmm6
movd  %rdx, %xmm4
movd  %rcx, %xmm2

pshufb CTRHSHUF, %xmm6
pshufb CTRLSHUF, %xmm4
pshufb CTRHSHUF, %xmm2

movaps %xmm2, %xmm0

# bitslice

swapmove %xmm6, %xmm4, $1, BS0, %xmm15
swapmove %xmm2, %xmm0, $1, BS0, %xmm15

swapmove %xmm6, %xmm2, $2, BS1, %xmm15
swapmove %xmm4, %xmm0, $2, BS1, %xmm15

swapmove0x %xmm7, %xmm6, $4, BS2
swapmove0x %xmm5, %xmm4, $4, BS2
swapmove0x %xmm3, %xmm2, $4, BS2
swapmove0x %xmm1, %xmm0, $4, BS2


movaps %xmm0, 256(%rsp)
movaps %xmm2, 272(%rsp)
movaps %xmm4, 288(%rsp)
movaps %xmm6, 304(%rsp)
movaps %xmm1, 320(%rsp)
movaps %xmm3, 336(%rsp)
movaps %xmm5, 352(%rsp)
movaps %xmm7, 368(%rsp)

# bitslice counter ctrl ctrh ctrprevl ctrprevl

movd  %rdx, %xmm6
movd  %rdx, %xmm4
movd  %rcx, %xmm2

pshufb CTRLSHUF, %xmm6
pshufb CTRHSHUF, %xmm4
pshufb CTRLSHUF, %xmm2

movaps %xmm2, %xmm0

# bitslice

swapmove %xmm6, %xmm4, $1, BS0, %xmm15
swapmove %xmm2, %xmm0, $1, BS0, %xmm15

swapmove %xmm6, %xmm2, $2, BS1, %xmm15
swapmove %xmm4, %xmm0, $2, BS1, %xmm15

swapmove0x %xmm7, %xmm6, $4, BS2
swapmove0x %xmm5, %xmm4, $4, BS2
swapmove0x %xmm3, %xmm2, $4, BS2
swapmove0x %xmm1, %xmm0, $4, BS2


movaps %xmm0, 384(%rsp)
movaps %xmm2, 400(%rsp)
movaps %xmm4, 416(%rsp)
movaps %xmm6, 432(%rsp)
movaps %xmm1, 448(%rsp)
movaps %xmm3, 464(%rsp)
movaps %xmm5, 480(%rsp)
movaps %xmm7, 496(%rsp)

# bitslice L4 L5 H0 H1

movdqu (%rdi), %xmm0 	# lsb
movdqu 16(%rdi), %xmm1
movdqu 32(%rdi), %xmm2
movdqu 48(%rdi), %xmm3
movdqu 64(%rdi), %xmm4
movdqu 80(%rdi), %xmm5
movdqu 96(%rdi), %xmm6
movdqu 112(%rdi), %xmm7

movdqu (%rsi), %xmm8 	# m[ 0]-m[15], lane 4, left
movdqu 16(%rsi), %xmm9 	# m[16]-m[31], lane 4, right
movdqu 32(%rsi), %xmm10 # m[32]-m[47], lane 5, left
movdqu 48(%rsi), %xmm11 # m[48]-m[63], lane 5, right

# shuffle bytes

pshufb M0, %xmm8
pshufb M0, %xmm9
pshufb M0, %xmm10
pshufb M0, %xmm11


# xmm8 -  77557755... 
# xmm10 - 66446644...
# xmm9 - 33113311...
# xmm11 - 22002200...

swapmove %xmm8, %xmm10, $1, BS0, %xmm15
swapmove %xmm9, %xmm11, $1, BS0, %xmm15
swapmove %xmm8, %xmm9, $4, BS2, %xmm15
swapmove %xmm10, %xmm11, $4, BS2, %xmm15

blendlanes %xmm8, %xmm7, %xmm5, %xmm12
blendlanes %xmm9, %xmm3, %xmm1, %xmm13
blendlanes %xmm10, %xmm6, %xmm4, %xmm14
blendlanes %xmm11, %xmm2, %xmm0, %xmm15



# three rounds of LANE

laneround LLC00, LLC01, LLC02, LLC03, LLC04, LLC05, LLC06, LLC07

# add counter

xorps 256(%rsp), %xmm0
xorps 272(%rsp), %xmm1
xorps 288(%rsp), %xmm2
xorps 304(%rsp), %xmm3
xorps 320(%rsp), %xmm4
xorps 336(%rsp), %xmm5
xorps 352(%rsp), %xmm6
xorps 368(%rsp), %xmm7

laneround LLC10, LLC11, LLC12, LLC13, LLC14, LLC15, LLC16, LLC17

# add counter

xorps 384(%rsp), %xmm0
xorps 400(%rsp), %xmm1
xorps 416(%rsp), %xmm2
xorps 432(%rsp), %xmm3
xorps 448(%rsp), %xmm4
xorps 464(%rsp), %xmm5
xorps 480(%rsp), %xmm6
xorps 496(%rsp), %xmm7

laneround LLC20, LLC21, LLC22, LLC23, LLC24, LLC25, LLC26, LLC27

# add counter

movaps 256(%rsp), %xmm8
movaps 272(%rsp), %xmm9
movaps 288(%rsp), %xmm10
movaps 304(%rsp), %xmm11
movaps 320(%rsp), %xmm12
movaps 336(%rsp), %xmm13
movaps 352(%rsp), %xmm14
movaps 368(%rsp), %xmm15

pand CTRM, %xmm8
pand CTRM, %xmm9
pand CTRM, %xmm10
pand CTRM, %xmm11
pand CTRM, %xmm12
pand CTRM, %xmm13
pand CTRM, %xmm14
pand CTRM, %xmm15

xorps %xmm8, %xmm0
xorps %xmm9, %xmm1
xorps %xmm10, %xmm2
xorps %xmm11, %xmm3
xorps %xmm12, %xmm4
xorps %xmm13, %xmm5
xorps %xmm14, %xmm6
xorps %xmm15, %xmm7

movaps %xmm8, 256(%rsp)
movaps %xmm9, 272(%rsp)
movaps %xmm10, 288(%rsp)
movaps %xmm11, 304(%rsp)
movaps %xmm12, 320(%rsp)
movaps %xmm13, 336(%rsp)
movaps %xmm14, 352(%rsp)
movaps %xmm15, 368(%rsp)

# lanes 6 & 7 are done - copy to stack

movaps	%xmm0, (%rsp)
movaps	%xmm1, 16(%rsp)
movaps	%xmm2, 32(%rsp)
movaps	%xmm3, 48(%rsp)
movaps	%xmm4, 64(%rsp)
movaps	%xmm5, 80(%rsp)
movaps	%xmm6, 96(%rsp)
movaps	%xmm7, 112(%rsp)

laneround LLC30, LLC31, LLC32, LLC33, LLC34, LLC35, LLC36, LLC37

# add counter

movaps 384(%rsp), %xmm8
movaps 400(%rsp), %xmm9
movaps 416(%rsp), %xmm10
movaps 432(%rsp), %xmm11
movaps 448(%rsp), %xmm12
movaps 464(%rsp), %xmm13
movaps 480(%rsp), %xmm14
movaps 496(%rsp), %xmm15

pand CTRM, %xmm8
pand CTRM, %xmm9
pand CTRM, %xmm10
pand CTRM, %xmm11
pand CTRM, %xmm12
pand CTRM, %xmm13
pand CTRM, %xmm14
pand CTRM, %xmm15

xorps %xmm8, %xmm0
xorps %xmm9, %xmm1
xorps %xmm10, %xmm2
xorps %xmm11, %xmm3
xorps %xmm12, %xmm4
xorps %xmm13, %xmm5
xorps %xmm14, %xmm6
xorps %xmm15, %xmm7

movaps %xmm8, 384(%rsp)
movaps %xmm9, 400(%rsp)
movaps %xmm10, 416(%rsp)
movaps %xmm11, 432(%rsp)
movaps %xmm12, 448(%rsp)
movaps %xmm13, 464(%rsp)
movaps %xmm14, 480(%rsp)
movaps %xmm15, 496(%rsp)

laneround LLC40, LLC41, LLC42, LLC43, LLC44, LLC45, LLC46, LLC47

# add counter

xorps 256(%rsp), %xmm0
xorps 272(%rsp), %xmm1
xorps 288(%rsp), %xmm2
xorps 304(%rsp), %xmm3
xorps 320(%rsp), %xmm4
xorps 336(%rsp), %xmm5
xorps 352(%rsp), %xmm6
xorps 368(%rsp), %xmm7

lastround

# xor lanes 4 and 5

movaps	%xmm0, %xmm8
movaps	%xmm1, %xmm9
movaps	%xmm2, %xmm10
movaps	%xmm3, %xmm11
movaps	%xmm4, %xmm12
movaps	%xmm5, %xmm13
movaps	%xmm6, %xmm14
movaps	%xmm7, %xmm15

psrlq $3, %xmm0
psrlq $3, %xmm1
psrlq $3, %xmm2
psrlq $3, %xmm3
psrlq $3, %xmm4
psrlq $3, %xmm5
psrlq $3, %xmm6
psrlq $3, %xmm7

psrlq $2, %xmm8
psrlq $2, %xmm9
psrlq $2, %xmm10
psrlq $2, %xmm11
psrlq $2, %xmm12
psrlq $2, %xmm13
psrlq $2, %xmm14
psrlq $2, %xmm15

xorps %xmm8, %xmm0
xorps %xmm9, %xmm1
xorps %xmm10, %xmm2
xorps %xmm11, %xmm3
xorps %xmm12, %xmm4
xorps %xmm13, %xmm5
xorps %xmm14, %xmm6
xorps %xmm15, %xmm7

pand L7, %xmm0
pand L7, %xmm1
pand L7, %xmm2
pand L7, %xmm3
pand L7, %xmm4
pand L7, %xmm5
pand L7, %xmm6
pand L7, %xmm7

# store new intermediate value

movaps  %xmm0, 512(%rsp)	# lsb
movaps  %xmm1, 528(%rsp)
movaps  %xmm2, 544(%rsp) 
movaps  %xmm3, 560(%rsp) 
movaps  %xmm4, 576(%rsp)
movaps  %xmm5, 592(%rsp) 
movaps  %xmm6, 608(%rsp) 
movaps  %xmm7, 624(%rsp)

# bitslice L0, L1, L2, L3

movdqu (%rsi), %xmm8	# m[ 0]-m[15]
movdqu 16(%rsi), %xmm9 	# m[16]-m[31]
movdqu 32(%rsi), %xmm10 # m[32]-m[47]
movdqu 48(%rsi), %xmm11 # m[48]-m[63]

pshufb M0, %xmm8
pshufb M0, %xmm9
pshufb M0, %xmm10
pshufb M0, %xmm11

# message expansion

movaps %xmm8, %xmm6
movaps %xmm8, %xmm5
movaps %xmm6, %xmm2

movaps %xmm9, %xmm4

xorps %xmm10, %xmm6
xorps %xmm10, %xmm5
xorps %xmm10, %xmm4

xorps %xmm11, %xmm5
xorps %xmm11, %xmm2

movaps %xmm4, %xmm7
xorps %xmm2, %xmm7

movaps %xmm6, %xmm3
xorps %xmm9, %xmm3

# bitslice

swapmove %xmm7, %xmm5, $1, BS0, %xmm15
swapmovex0 %xmm3, %xmm1, $1, BS0x0
swapmove %xmm6, %xmm4, $1, BS0, %xmm15
swapmovex0 %xmm2, %xmm0, $1, BS0x0

swapmove %xmm7, %xmm3, $2, BS1, %xmm15
swapmove %xmm5, %xmm1, $2, BS1, %xmm15
swapmove %xmm6, %xmm2, $2, BS1, %xmm15
swapmove %xmm4, %xmm0, $2, BS1, %xmm15

swapmove %xmm7, %xmm6, $4, BS2, %xmm15
swapmove %xmm5, %xmm4, $4, BS2, %xmm15
swapmove %xmm3, %xmm2, $4, BS2, %xmm15
swapmove %xmm1, %xmm0, $4, BS2, %xmm15

# move 6 -> 3 -> 5 -> 6

movaps %xmm6, %xmm8
movaps %xmm5, %xmm6
movaps %xmm3, %xmm5
movaps %xmm8, %xmm3

# move 4 -> 2 -> 1 -> 4

movaps %xmm4, %xmm8
movaps %xmm1, %xmm4
movaps %xmm2, %xmm1
movaps %xmm8, %xmm2

# chaining value

movaps	(%rsp), %xmm8
expandcv %xmm8, %xmm0, %xmm9, %xmm10
movaps	16(%rsp), %xmm11
expandcv %xmm11, %xmm1, %xmm12, %xmm13
movaps	32(%rsp), %xmm8
expandcv %xmm8, %xmm2, %xmm9, %xmm10
movaps	48(%rsp), %xmm11
expandcv %xmm11, %xmm3, %xmm12, %xmm13
movaps	64(%rsp), %xmm8
expandcv %xmm8, %xmm4, %xmm9, %xmm10
movaps	80(%rsp), %xmm11
expandcv %xmm11, %xmm5, %xmm12, %xmm13
movaps	96(%rsp), %xmm8
expandcv %xmm8, %xmm6, %xmm9, %xmm10
movaps	112(%rsp), %xmm11
expandcv %xmm11, %xmm7, %xmm12, %xmm13

# process lanes 0-3

laneround LC00, LC01, LC02, LC03, LC04, LC05, LC06, LC07

# add counter

movaps 256(%rsp), %xmm8
movaps 272(%rsp), %xmm9
movaps 288(%rsp), %xmm10
movaps 304(%rsp), %xmm11
movaps 320(%rsp), %xmm12
movaps 336(%rsp), %xmm13
movaps 352(%rsp), %xmm14
movaps 368(%rsp), %xmm15

psrlq $2, %xmm8
psrlq $2, %xmm9
psrlq $2, %xmm10
psrlq $2, %xmm11
psrlq $2, %xmm12
psrlq $2, %xmm13
psrlq $2, %xmm14
psrlq $2, %xmm15

xorps 256(%rsp), %xmm8
xorps 272(%rsp), %xmm9
xorps 288(%rsp), %xmm10
xorps 304(%rsp), %xmm11
xorps 320(%rsp), %xmm12
xorps 336(%rsp), %xmm13
xorps 352(%rsp), %xmm14
xorps 368(%rsp), %xmm15

xorps %xmm8, %xmm0
xorps %xmm9, %xmm1
xorps %xmm10, %xmm2
xorps %xmm11, %xmm3
xorps %xmm12, %xmm4
xorps %xmm13, %xmm5
xorps %xmm14, %xmm6
xorps %xmm15, %xmm7

movaps %xmm8, 256(%rsp)
movaps %xmm9, 272(%rsp)
movaps %xmm10, 288(%rsp)
movaps %xmm11, 304(%rsp)
movaps %xmm12, 320(%rsp)
movaps %xmm13, 336(%rsp)
movaps %xmm14, 352(%rsp)
movaps %xmm15, 368(%rsp)

laneround LC10, LC11, LC12, LC13, LC14, LC15, LC16, LC17

# add counter

movaps 384(%rsp), %xmm8
movaps 400(%rsp), %xmm9
movaps 416(%rsp), %xmm10
movaps 432(%rsp), %xmm11
movaps 448(%rsp), %xmm12
movaps 464(%rsp), %xmm13
movaps 480(%rsp), %xmm14
movaps 496(%rsp), %xmm15

psrlq $2, %xmm8
psrlq $2, %xmm9
psrlq $2, %xmm10
psrlq $2, %xmm11
psrlq $2, %xmm12
psrlq $2, %xmm13
psrlq $2, %xmm14
psrlq $2, %xmm15

xorps 384(%rsp), %xmm8
xorps 400(%rsp), %xmm9
xorps 416(%rsp), %xmm10
xorps 432(%rsp), %xmm11
xorps 448(%rsp), %xmm12
xorps 464(%rsp), %xmm13
xorps 480(%rsp), %xmm14
xorps 496(%rsp), %xmm15

xorps %xmm8, %xmm0
xorps %xmm9, %xmm1
xorps %xmm10, %xmm2
xorps %xmm11, %xmm3
xorps %xmm12, %xmm4
xorps %xmm13, %xmm5
xorps %xmm14, %xmm6
xorps %xmm15, %xmm7

movaps %xmm8, 384(%rsp)
movaps %xmm9, 400(%rsp)
movaps %xmm10, 416(%rsp)
movaps %xmm11, 432(%rsp)
movaps %xmm12, 448(%rsp)
movaps %xmm13, 464(%rsp)
movaps %xmm14, 480(%rsp)
movaps %xmm15, 496(%rsp)


laneround LC20, LC21, LC22, LC23, LC24, LC25, LC26, LC27

# add counter

xorps 256(%rsp), %xmm0
xorps 272(%rsp), %xmm1
xorps 288(%rsp), %xmm2
xorps 304(%rsp), %xmm3
xorps 320(%rsp), %xmm4
xorps 336(%rsp), %xmm5
xorps 352(%rsp), %xmm6
xorps 368(%rsp), %xmm7

laneround LC30, LC31, LC32, LC33, LC34, LC35, LC36, LC37


# add counter

xorps 384(%rsp), %xmm0
xorps 400(%rsp), %xmm1
xorps 416(%rsp), %xmm2
xorps 432(%rsp), %xmm3
xorps 448(%rsp), %xmm4
xorps 464(%rsp), %xmm5
xorps 480(%rsp), %xmm6
xorps 496(%rsp), %xmm7

laneround LC40, LC41, LC42, LC43, LC44, LC45, LC46, LC47

# add counter

xorps 256(%rsp), %xmm0
xorps 272(%rsp), %xmm1
xorps 288(%rsp), %xmm2
xorps 304(%rsp), %xmm3
xorps 320(%rsp), %xmm4
xorps 336(%rsp), %xmm5
xorps 352(%rsp), %xmm6
xorps 368(%rsp), %xmm7

lastround

# xor values together

xorlanes %xmm0, %xmm8, %xmm9
xorlanes %xmm1, %xmm10, %xmm11
xorlanes %xmm2, %xmm12, %xmm13
xorlanes %xmm3, %xmm14, %xmm15
xorlanes %xmm4, %xmm8, %xmm9
xorlanes %xmm5, %xmm10, %xmm11
xorlanes %xmm6, %xmm12, %xmm13
xorlanes %xmm7, %xmm14, %xmm15

# XOR result of P4-P5

xorps 512(%rsp), %xmm0
xorps 528(%rsp), %xmm1
xorps 544(%rsp), %xmm2
xorps 560(%rsp), %xmm3
xorps 576(%rsp), %xmm4
xorps 592(%rsp), %xmm5
xorps 608(%rsp), %xmm6
xorps 624(%rsp), %xmm7

movdqu  %xmm0, (%rdi)	# lsb
movdqu  %xmm1, 16(%rdi)
movdqu  %xmm2, 32(%rdi) 
movdqu  %xmm3, 48(%rdi) 
movdqu  %xmm4, 64(%rdi)
movdqu  %xmm5, 80(%rdi) 
movdqu  %xmm6, 96(%rdi) 
movdqu  %xmm7, 112(%rdi)

leave 

ret


.data

.align 16

D0: .quad 0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF

# swapmove constants

BS0: .quad 0x5555555555555555, 0x5555555555555555
BS0x0: .quad 0xaaaaaaaaaaaaaaaa, 0xaaaaaaaaaaaaaaaa
BS1: .quad 0x3333333333333333, 0x3333333333333333
BS2: .quad 0x0f0f0f0f0f0f0f0f, 0x0f0f0f0f0f0f0f0f
BS11: .quad 0xcccccccccccccccc, 0xcccccccccccccccc

# transpose matrix

M0: .quad 0x02060a0e03070b0f, 0x0004080c0105090d

SR: .quad 0x0504070600030201, 0x0f0e0d0c0a09080b

SW0: .quad 0x0F0F00000F0F0000, 0x0f0f00000f0f0000
SW1: .quad 0x0000f0f00000f0f0, 0x0000f0f00000f0f0
SW2: .quad 0xf0f00f0ff0f00f0f, 0xf0f00f0ff0f00f0f

L7: .quad 0x1111111111111111, 0x1111111111111111

L67: .quad 0x3333333333333333, 0x3333333333333333 

CVL0: .quad 0x2020202020202020, 0x2020202020202020
CVR0: .quad 0x0202020202020202, 0x0202020202020202
CVL1: .quad 0x1010101010101010, 0x1010101010101010
CVR1: .quad 0x0101010101010101, 0x0101010101010101

CVL: .quad 0x2020202020202020, 0x2020202020202020
CVR: .quad 0x0202020202020202, 0x0202020202020202

# xor masks

XOR3: .quad 0x8888888888888888, 0x8888888888888888 
XOR2: .quad 0x4444444444444444, 0x4444444444444444

# counter position

CTRLSHUF: .quad 0xff01ffffff00ffff, 0xff03ffffff02ffff

CTRHSHUF: .quad 0xff05ffffff04ffff, 0xff07ffffff06ffff

# counter mask

CTRM: .quad 0x000c0000000c0000, 0x000c0000000c0000

# constants for lanes P0, P1, P2, P3

LC00:	.int 0xa6b958bd, 0x2d187c03, 0x1f2aadcf, 0xc1afce29
LC01:	.int 0x1fe1e5d2, 0x187c03d1, 0x2aadcffc, 0xafce291a
LC02:	.int 0xe1e5d2f1, 0x7c03d182, 0xadcffcaa, 0xce291af8
LC03:	.int 0xe5d2f117, 0x3d182ca, 0xcffcaadc, 0x291af8e7
LC04:	.int 0xd2f11750, 0xd182ca3c, 0xfcaadcf2, 0x1af8e795
LC05:	.int 0xf117502d, 0x82ca3c1f, 0xaadcf2c1, 0x5e5ecd1f
LC06:	.int 0x17502d18, 0xca3c1f2a, 0xdcf2c1af, 0x5ecd1fe1
LC07:	.int 0x502d187c, 0x3c1f2aad, 0xf2c1afce, 0x6ba6b958
LC10:	.int 0xf4ec9093, 0x1f2aadcf, 0xc1afce29, 0xa28e7b5b
LC11:	.int 0x187c03d1, 0x2aadcffc, 0xafce291a, 0x8e7b5b28
LC12:	.int 0x7c03d182, 0xadcffcaa, 0xce291af8, 0x7b5b28e3
LC13:	.int 0x3d182ca, 0xcffcaadc, 0x291af8e7, 0x5b28e3bc
LC14:	.int 0xd182ca3c, 0xfcaadcf2, 0x1af8e795, 0x28e3bcbd
LC15:	.int 0x82ca3c1f, 0xaadcf2c1, 0xf8e795a2, 0x17502d18
LC16:	.int 0xca3c1f2a, 0xdcf2c1af, 0xe795a28e, 0x502d187c
LC17:	.int 0x3c1f2aad, 0xf2c1afce, 0x95a28e7b, 0xd9f4ec90
LC20:	.int 0x2903ae61, 0xc1afce29, 0xa28e7b5b, 0x8b3ec3db
LC21:	.int 0x2aadcffc, 0xafce291a, 0x8e7b5b28, 0x3ec3dbb4
LC22:	.int 0xadcffcaa, 0xce291af8, 0x7b5b28e3, 0xc3dbb4e3
LC23:	.int 0xcffcaadc, 0x291af8e7, 0x5b28e3bc, 0xdbb4e33f
LC24:	.int 0xfcaadcf2, 0x1af8e795, 0x28e3bcbd, 0xb4e33fb1
LC25:	.int 0xaadcf2c1, 0xf8e795a2, 0xe3bcbd8b, 0xca3c1f2a
LC26:	.int 0xdcf2c1af, 0xe795a28e, 0xbcbd8b3e, 0x3c1f2aad
LC27:	.int 0xf2c1afce, 0x95a28e7b, 0xbd8b3ec3, 0x362903ae
LC30:	.int 0xd877b990, 0xa28e7b5b, 0x8b3ec3db, 0x4b30f817
LC31:	.int 0xafce291a, 0x8e7b5b28, 0x3ec3dbb4, 0x30f817b3
LC32:	.int 0xce291af8, 0x7b5b28e3, 0xc3dbb4e3, 0xf817b304
LC33:	.int 0x291af8e7, 0x5b28e3bc, 0xdbb4e33f, 0x17b30485
LC34:	.int 0x1af8e795, 0x28e3bcbd, 0xb4e33fb1, 0xb3048578
LC35:	.int 0xf8e795a2, 0xe3bcbd8b, 0xe33fb14b, 0xdcf2c1af
LC36:	.int 0xe795a28e, 0xbcbd8b3e, 0x3fb14b30, 0xf2c1afce
LC37:	.int 0x95a28e7b, 0xbd8b3ec3, 0xb14b30f8, 0x19d877b9
LC40:	.int 0xa22c570c, 0x8b3ec3db, 0x4b30f817, 0x3f445b8f
LC41:	.int 0x8e7b5b28, 0x3ec3dbb4, 0x30f817b3, 0x445b8ff8
LC42:	.int 0x7b5b28e3, 0xc3dbb4e3, 0xf817b304, 0x5b8ff845
LC43:	.int 0x5b28e3bc, 0xdbb4e33f, 0x17b30485, 0x8ff845b9
LC44:	.int 0x28e3bcbd, 0xb4e33fb1, 0xb3048578, 0xf845b9f5
LC45:	.int 0xe3bcbd8b, 0xe33fb14b, 0x485783f, 0xe795a28e
LC46:	.int 0xbcbd8b3e, 0x3fb14b30, 0x85783f44, 0x95a28e7b
LC47:	.int 0xbd8b3ec3, 0xb14b30f8, 0x783f445b, 0xa22c57

# constants for lanes P4, P5, Q0, Q1

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
LLC20:	.int 0xc88c004c, 0x88c088, 0xc8c40888, 0xc048440c
LLC21:	.int 0x448c4cc0, 0x88c0880c, 0xc408888c, 0x48440c00
LLC22:	.int 0x8c4cc048, 0xc0880c8c, 0x8888c44, 0x440c0080
LLC23:	.int 0x4cc048cc, 0x880c8c00, 0x888c4484, 0xc008048
LLC24:	.int 0xc048ccc8, 0xc8c0088, 0x8c448480, 0x8048cc
LLC25:	.int 0x48ccc800, 0x8c0088c8, 0x448480c0, 0x48c4cc44
LLC26:	.int 0xccc80088, 0x88c8c4, 0x8480c048, 0xc4cc448c
LLC27:	.int 0xc80088c0, 0x88c8c408, 0x80c04844, 0x4c88c00
LLC30:	.int 0xc0488800, 0xc8c40888, 0xc048440c, 0x80088c8
LLC31:	.int 0x88c0880c, 0xc408888c, 0x48440c00, 0x88c888
LLC32:	.int 0xc0880c8c, 0x8888c44, 0x440c0080, 0x88c8880c
LLC33:	.int 0x880c8c00, 0x888c4484, 0xc008048, 0xc8880c80
LLC34:	.int 0xc8c0088, 0x8c448480, 0x8048cc, 0x880c8088
LLC35:	.int 0x8c0088c8, 0x448480c0, 0x8048cc08, 0xccc80088
LLC36:	.int 0x88c8c4, 0x8480c048, 0x48cc0800, 0xc80088c0
LLC37:	.int 0x88c8c408, 0x80c04844, 0xcc080088, 0xc0c04888
LLC40:	.int 0xc0040c84, 0xc048440c, 0x80088c8, 0x88cc088c
LLC41:	.int 0xc408888c, 0x48440c00, 0x88c888, 0xcc088c84
LLC42:	.int 0x8888c44, 0x440c0080, 0x88c8880c, 0x88c84c0
LLC43:	.int 0x888c4484, 0xc008048, 0xc8880c80, 0x8c84c08c
LLC44:	.int 0x8c448480, 0x8048cc, 0x880c8088, 0x84c08cc4
LLC45:	.int 0x448480c0, 0x8048cc08, 0xc808888, 0x88c8c4
LLC46:	.int 0x8480c048, 0x48cc0800, 0x808888cc, 0x88c8c408
LLC47:	.int 0x80c04844, 0xcc080088, 0x8888cc08, 0x8c0040c


