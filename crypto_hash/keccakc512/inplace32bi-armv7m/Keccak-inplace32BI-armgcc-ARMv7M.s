@ The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
@ Michaël Peeters and Gilles Van Assche. For more information, feedback or
@ questions, please refer to our website: http://keccak.noekeon.org/
@
@ Implementation by Ronny Van Keer,
@ hereby denoted as "the implementer".
@
@ To the extent possible under law, the implementer has waived all copyright
@ and related or neighboring rights to the source code in this file.
@ http://creativecommons.org/publicdomain/zero/1.0/

@ This file was created from a .asm file
@  using the ads2gas.pl script.
	.equ DO1STROUNDING, 0

	@ PRESERVE8
	@	THUMB
	.syntax unified
	.cpu cortex-m3
	.thumb

@// --- defines
.equ	cKeccakLaneSizeInBytes	,	8
.equ cKeccakR_SizeInBytes , 1088/8
.equ crypto_hash_BYTES , 256/8


@//	--- offsets in state
.equ	Aba0	,   0*4
.equ	Aba1	,   1*4
.equ	Abe0	,   2*4
.equ	Abe1	,   3*4
.equ	Abi0	,   4*4
.equ	Abi1	,   5*4
.equ	Abo0	,   6*4
.equ	Abo1	,   7*4
.equ	Abu0	,   8*4
.equ	Abu1	,   9*4
.equ	Aga0	,  10*4
.equ	Aga1	,  11*4
.equ	Age0	,  12*4
.equ	Age1	,  13*4
.equ	Agi0	,  14*4
.equ	Agi1	,  15*4
.equ	Ago0	,  16*4
.equ	Ago1	,  17*4
.equ	Agu0	,  18*4
.equ	Agu1	,  19*4
.equ	Aka0	,  20*4
.equ	Aka1	,  21*4
.equ	Ake0	,  22*4
.equ	Ake1	,  23*4
.equ	Aki0	,  24*4
.equ	Aki1	,  25*4
.equ	Ako0	,  26*4
.equ	Ako1	,  27*4
.equ	Aku0	,  28*4
.equ	Aku1	,  29*4
.equ	Ama0	,  30*4
.equ	Ama1	,  31*4
.equ	Ame0	,  32*4
.equ	Ame1	,  33*4
.equ	Ami0	,  34*4
.equ	Ami1	,  35*4
.equ	Amo0	,  36*4
.equ	Amo1	,  37*4
.equ	Amu0	,  38*4
.equ	Amu1	,  39*4
.equ	Asa0	,  40*4
.equ	Asa1	,  41*4
.equ	Ase0	,  42*4
.equ	Ase1	,  43*4
.equ	Asi0	,  44*4
.equ	Asi1	,  45*4
.equ	Aso0	,  46*4
.equ	Aso1	,  47*4
.equ	Asu0	,  48*4
.equ	Asu1	,  49*4

@//	--- offsets on stack
.equ	mDo0	,  50*4
.equ	mDo1	,  51*4
.equ	mDi0	,  52*4
.equ	mRC		,  53*4
.equ	mRet	,  54*4
.equ	mIn		,  55*4
.equ	mOut	,  56*4
.equ	mLen	,  57*4

@// --- macros

		@// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
.macro		interleaveLane	x0,x1,s0,s1,t

		and		\t,\x0,#0x55555555
		orr		\t,\t,\t, LSR #1
		and		\t,\t,#0x33333333
		orr		\t,\t,\t, LSR #2
		and		\t,\t,#0x0F0F0F0F
		orr		\t,\t,\t, LSR #4
		and		\t,\t,#0x00FF00FF
		bfi		\t,\t,#8, #8
		eor		\s0,\s0,\t, LSR #8

		and		\t,\x1,#0x55555555
		orr		\t,\t,\t, LSR #1
		and		\t,\t,#0x33333333
		orr		\t,\t,\t, LSR #2
		and		\t,\t,#0x0F0F0F0F
		orr		\t,\t,\t, LSR #4
		and		\t,\t,#0x00FF00FF
		orr		\t,\t,\t, LSR #8
		eor		\s0,\s0,\t, LSL #16

		and		\t,\x0,#0xAAAAAAAA
		orr		\t,\t,\t, LSL #1
		and		\t,\t,#0xCCCCCCCC
		orr		\t,\t,\t, LSL #2
		and		\t,\t,#0xF0F0F0F0
		orr		\t,\t,\t, LSL #4
		and		\t,\t,#0xFF00FF00
		orr		\t,\t,\t, LSL #8
		eor		\s1,\s1,\t, LSR #16

		and		\t,\x1,#0xAAAAAAAA
		orr		\t,\t,\t, LSL #1
		and		\t,\t,#0xCCCCCCCC
		orr		\t,\t,\t, LSL #2
		and		\t,\t,#0xF0F0F0F0
		orr		\t,\t,\t, LSL #4
		and		\t,\t,#0xFF00FF00
		orr		\t,\t,\t, LSL #8
		bfc		\t, #0, #16
		eors	\s1,\s1,\t
		.endm

		@// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
.macro		uninterleaveLane	x0, x1, t

		movs	\t, \x0					@// t = x0@
		bfi		\x0, \x1, #16, #16		@// x0 = (x0 & 0x0000FFFF) | (x1 << 16)@
		bfc		\x1, #0, #16			@//	x1 = (t >> 16) | (x1 & 0xFFFF0000)@
		orr		\x1, \x1, \t, LSR #16

	    eor		\t, \x0, \x0, LSR #8    @// t = (x0 ^ (x0 >>  8)) & 0x0000FF00UL@  x0 = x0 ^ t ^ (t <<  8)@
		and		\t, #0x0000FF00
	    eors	\x0, \x0, \t
	    eor		\x0, \x0, \t, LSL #8

	    eor		\t, \x0, \x0, LSR #4	@// t = (x0 ^ (x0 >>  4)) & 0x00F000F0UL@  x0 = x0 ^ t ^ (t <<  4)@
		and		\t, #0x00F000F0
	    eors	\x0, \x0, \t
	    eor		\x0, \x0, \t, LSL #4

	    eor		\t, \x0, \x0, LSR #2	@// t = (x0 ^ (x0 >>  2)) & 0x0C0C0C0CUL@  x0 = x0 ^ t ^ (t <<  2)@
		and		\t, #0x0C0C0C0C
	    eors	\x0, \x0, \t
	    eor		\x0, \x0, \t, LSL #2

	    eor		\t, \x0, \x0, LSR #1	@// t = (x0 ^ (x0 >>  1)) & 0x22222222UL@  x0 = x0 ^ t ^ (t <<  1)@
		and		\t, #0x22222222
	    eors	\x0, \x0, \t
	    eor		\x0, \x0, \t, LSL #1

	    eor		\t, \x1, \x1, LSR #8    @// t = (x1 ^ (x1 >>  8)) & 0x0000FF00UL@  x1 = x1 ^ t ^ (t <<  8)@
		and		\t, #0x0000FF00
	    eors	\x1, \x1, \t
	    eor		\x1, \x1, \t, LSL #8

	    eor		\t, \x1, \x1, LSR #4	@// t = (x1 ^ (x1 >>  4)) & 0x00F000F0UL@  x1 = x1 ^ t ^ (t <<  4)@
		and		\t, #0x00F000F0
	    eors	\x1, \x1, \t
	    eor		\x1, \x1, \t, LSL #4

	    eor		\t, \x1, \x1, LSR #2	@// t = (x1 ^ (x1 >>  2)) & 0x0C0C0C0CUL@  x1 = x1 ^ t ^ (t <<  2)@
		and		\t, #0x0C0C0C0C
	    eors	\x1, \x1, \t
	    eor		\x1, \x1, \t, LSL #2

	    eor		\t, \x1, \x1, LSR #1	@// t = (x1 ^ (x1 >>  1)) & 0x22222222UL@  x1 = x1 ^ t ^ (t <<  1)@
		and		\t, #0x22222222
	    eors	\x1, \x1, \t
	    eor		\x1, \x1, \t, LSL #1
		.endm

.macro		xor5		result,b,g,k,m,s

		ldr			\result, [sp, #\b]
		ldr			r1, [sp, #\g]
		ldr			r2, [sp, #\k]
		eors		\result, \result, r1				
		ldr			r1, [sp, #\m]
		eors		\result, \result, r2
		ldr			r2, [sp, #\s]
		eors		\result, \result, r1				
		eors		\result, \result, r2
		.endm

.macro		xorrol 		result, aa, bb

		eor			\result, \aa, \bb, ROR #31
		.endm


.macro		xandnot 	resofs, aa, bb, cc

		bic			r1, \cc, \bb
		eors		r1, r1, \aa
		str			r1, [sp, #\resofs]
		.endm

.macro		KeccakThetaRhoPiChiIota aA1, aDax, aA2, aDex, rot2, aA3, aDix, rot3, aA4, aDox, rot4, aA5, aDux, rot5, offset, last
		ldr		r3, [sp, #\aA1]
		ldr		r4, [sp, #\aA2]
		ldr		r5, [sp, #\aA3]
		ldr		r6, [sp, #\aA4]
		ldr		r7, [sp, #\aA5]
		eors	r3, r3, \aDax
		eors	r5, r5, \aDix
		eors	r4, r4, \aDex
		eors	r6, r6, \aDox
		eors	r7, r7, \aDux
		rors	r4, #32-\rot2
		rors	r5, #32-\rot3
		rors	r6, #32-\rot4
		rors	r7, #32-\rot5
	    xandnot \aA2, r4, r5, r6
	    xandnot \aA3, r5, r6, r7
	    xandnot \aA4, r6, r7, r3
	    xandnot \aA5, r7, r3, r4
		ldr		r1, [sp, #mRC]
		bics	r5, r5, r4
		ldr		r4, [r1, #\offset]
		eors	r3, r3, r5
		eors	r3, r3, r4
		.if	\last == 1
		ldr		r2, [r1, #32]!
		str		r1, [sp, #mRC]
		cmp		r2, #0xFFFFFFFF
		.endif
		str		r3, [sp, #\aA1]
		.endm

.macro		KeccakThetaRhoPiChi aB1, aA1, aDax, rot1, aB2, aA2, aDex, rot2, aB3, aA3, aDix, rot3, aB4, aA4, aDox, rot4, aB5, aA5, aDux, rot5
		ldr		\aB1, [sp, #\aA1]
		ldr		\aB2, [sp, #\aA2]
		ldr		\aB3, [sp, #\aA3]
		ldr		\aB4, [sp, #\aA4]
		ldr		\aB5, [sp, #\aA5]
		eors	\aB1, \aB1, \aDax
		eors	\aB3, \aB3, \aDix
		eors	\aB2, \aB2, \aDex
		eors	\aB4, \aB4, \aDox
		eors	\aB5, \aB5, \aDux
		rors	\aB1, #32-\rot1
		.if	\rot2 > 0
		rors	\aB2, #32-\rot2
		.endif
		rors	\aB3, #32-\rot3
		rors	\aB4, #32-\rot4
		rors	\aB5, #32-\rot5
		xandnot \aA1, r3, r4, r5
	    xandnot \aA2, r4, r5, r6
	    xandnot \aA3, r5, r6, r7
	    xandnot \aA4, r6, r7, r3
	    xandnot \aA5, r7, r3, r4
		.endm

.macro		KeccakRound0

        xor5        r3,  Abu0, Agu0, Aku0, Amu0, Asu0
        xor5        r7, Abe1, Age1, Ake1, Ame1, Ase1
        xorrol      r8, r3, r7
        xor5        r6,  Abu1, Agu1, Aku1, Amu1, Asu1
        xor5        r12, Abe0, Age0, Ake0, Ame0, Ase0
        eor         r9, r6, r12

        xor5        r5,  Abi0, Agi0, Aki0, Ami0, Asi0
        xorrol      r0, r5, r6
        xor5        r4,  Abi1, Agi1, Aki1, Ami1, Asi1
        eor         r11, r4, r3
		str			r0, [sp, #mDo0]
		str			r11, [sp, #mDo1]

        xor5        r3,  Aba0, Aga0, Aka0, Ama0, Asa0
        xorrol      r10, r3, r4
        xor5        r6,  Aba1, Aga1, Aka1, Ama1, Asa1
        eor         r11, r6, r5

        xor5        r4,  Abo1, Ago1, Ako1, Amo1, Aso1
        xorrol      r12, r12, r4
        xor5        r5,  Abo0, Ago0, Ako0, Amo0, Aso0
        eor         r2, r7, r5
		str			r12, [sp, #mDi0]

        xorrol      r12, r5, r6
        eor         lr, r4, r3

		KeccakThetaRhoPiChi r5, Aka1, r9,  2, r6, Ame1, r11, 23, r7, Asi1, r2, 31, r3, Abo0, r0, 14, r4, Agu0, r12, 10
		KeccakThetaRhoPiChi r7, Asa1, r9,  9, r3, Abe0, r10,  0, r4, Agi1, r2,  3, r5, Ako0, r0, 12, r6, Amu1, lr,  4
		KeccakThetaRhoPiChi r4, Aga0, r8, 18, r5, Ake0, r10,  5, r6, Ami1, r2,  8, r7, Aso0, r0, 28, r3, Abu1, lr, 14
		KeccakThetaRhoPiChi r6, Ama0, r8, 20, r7, Ase1, r11,  1, r3, Abi1, r2, 31, r4, Ago0, r0, 27, r5, Aku0, r12, 19
		ldr			r0, [sp, #mDo1]
		KeccakThetaRhoPiChiIota Aba0, r8,         Age0, r10, 22,     Aki1, r2, 22,     Amo1, r0, 11,     Asu0, r12,  7, 0, 0

		ldr			r2, [sp, #mDi0]
		KeccakThetaRhoPiChi r5, Aka0, r8,  1, r6, Ame0, r10, 22, r7, Asi0, r2, 30, r3, Abo1, r0, 14, r4, Agu1, lr, 10
		KeccakThetaRhoPiChi r7, Asa0, r8,  9, r3, Abe1, r11,  1, r4, Agi0, r2,  3, r5, Ako1, r0, 13, r6, Amu0, r12,  4
		KeccakThetaRhoPiChi r4, Aga1, r9, 18, r5, Ake1, r11,  5, r6, Ami0, r2,  7, r7, Aso1, r0, 28, r3, Abu0, r12, 13
		KeccakThetaRhoPiChi r6, Ama1, r9, 21, r7, Ase0, r10,  1, r3, Abi0, r2, 31, r4, Ago1, r0, 28, r5, Aku1, lr, 20
		ldr			r0, [sp, #mDo0]
		KeccakThetaRhoPiChiIota Aba1, r9,         Age1, r11, 22,     Aki0, r2, 21,     Amo0, r0, 10,     Asu1, lr,  7, 4, 0
		.endm

.macro		KeccakRound1

        xor5        r3,  Asu0, Agu0, Amu0, Abu1, Aku1
        xor5        r7, Age1, Ame0, Abe0, Ake1, Ase1
        xorrol      r8, r3, r7
        xor5        r6,  Asu1, Agu1, Amu1, Abu0, Aku0
        xor5        r12, Age0, Ame1, Abe1, Ake0, Ase0
        eor         r9, r6, r12

        xor5        r5,  Aki1, Asi1, Agi0, Ami1, Abi0
        xorrol      r0, r5, r6
        xor5        r4,  Aki0, Asi0, Agi1, Ami0, Abi1
        eor         r11, r4, r3
		str			r0, [sp, #mDo0]
		str			r11, [sp, #mDo1]

        xor5        r3,  Aba0, Aka1, Asa0, Aga0, Ama1
        xorrol      r10, r3, r4
        xor5        r6,  Aba1, Aka0, Asa1, Aga1, Ama0
        eor         r11, r6, r5

        xor5        r4,  Amo0, Abo1, Ako0, Aso1, Ago0
        xorrol      r12, r12, r4
        xor5        r5,  Amo1, Abo0, Ako1, Aso0, Ago1
        eor         r2, r7, r5
		str			r12, [sp, #mDi0]

        xorrol      r12, r5, r6
        eor         lr, r4, r3

		KeccakThetaRhoPiChi r5, Asa1, r9,  2, r6, Ake1, r11, 23, r7, Abi1, r2, 31, r3, Amo1, r0, 14, r4, Agu0, r12, 10
		KeccakThetaRhoPiChi r7, Ama0, r9,  9, r3, Age0, r10,  0, r4, Asi0, r2,  3, r5, Ako1, r0, 12, r6, Abu0, lr,  4
		KeccakThetaRhoPiChi r4, Aka1, r8, 18, r5, Abe1, r10,  5, r6, Ami0, r2,  8, r7, Ago1, r0, 28, r3, Asu1, lr, 14
		KeccakThetaRhoPiChi r6, Aga0, r8, 20, r7, Ase1, r11,  1, r3, Aki0, r2, 31, r4, Abo0, r0, 27, r5, Amu0, r12, 19
		ldr			r0, [sp, #mDo1]
		KeccakThetaRhoPiChiIota Aba0, r8,         Ame1, r10, 22,     Agi1, r2, 22,     Aso1, r0, 11,     Aku1, r12,  7, 8, 0

		ldr			r2, [sp, #mDi0]
		KeccakThetaRhoPiChi r5, Asa0, r8,  1, r6, Ake0, r10, 22, r7, Abi0, r2, 30, r3, Amo0, r0, 14, r4, Agu1, lr, 10
		KeccakThetaRhoPiChi r7, Ama1, r8,  9, r3, Age1, r11,  1, r4, Asi1, r2,  3, r5, Ako0, r0, 13, r6, Abu1, r12,  4
		KeccakThetaRhoPiChi r4, Aka0, r9, 18, r5, Abe0, r11,  5, r6, Ami1, r2,  7, r7, Ago0, r0, 28, r3, Asu0, r12, 13
		KeccakThetaRhoPiChi r6, Aga1, r9, 21, r7, Ase0, r10,  1, r3, Aki1, r2, 31, r4, Abo1, r0, 28, r5, Amu1, lr, 20
		ldr			r0, [sp, #mDo0]
		KeccakThetaRhoPiChiIota Aba1, r9,         Ame0, r11, 22,     Agi0, r2, 21,     Aso0, r0, 10,     Aku0, lr,  7, 12, 0
		.endm

.macro		KeccakRound2

        xor5        r3, Aku1, Agu0, Abu1, Asu1, Amu1
        xor5        r7, Ame0, Ake0, Age0, Abe0, Ase1
        xorrol      r8, r3, r7
        xor5        r6,  Aku0, Agu1, Abu0, Asu0, Amu0
        xor5        r12, Ame1, Ake1, Age1, Abe1, Ase0
        eor         r9, r6, r12

        xor5        r5,  Agi1, Abi1, Asi1, Ami0, Aki1
        xorrol      r0, r5, r6
        xor5        r4,  Agi0, Abi0, Asi0, Ami1, Aki0
        eor         r11, r4, r3
		str			r0, [sp, #mDo0]
		str			r11, [sp, #mDo1]

        xor5        r3,  Aba0, Asa1, Ama1, Aka1, Aga1
        xorrol      r10, r3, r4
        xor5        r6,  Aba1, Asa0, Ama0, Aka0, Aga0
        eor         r11, r6, r5

        xor5        r4,  Aso0, Amo0, Ako1, Ago0, Abo0
        xorrol      r12, r12, r4
        xor5        r5,  Aso1, Amo1, Ako0, Ago1, Abo1
        eor         r2, r7, r5
		str			r12, [sp, #mDi0]

        xorrol      r12, r5, r6
        eor         lr, r4, r3

		KeccakThetaRhoPiChi r5, Ama0, r9,  2, r6, Abe0, r11, 23, r7, Aki0, r2, 31, r3, Aso1, r0, 14, r4, Agu0, r12, 10
		KeccakThetaRhoPiChi r7, Aga0, r9,  9, r3, Ame1, r10,  0, r4, Abi0, r2,  3, r5, Ako0, r0, 12, r6, Asu0, lr,  4
		KeccakThetaRhoPiChi r4, Asa1, r8, 18, r5, Age1, r10,  5, r6, Ami1, r2,  8, r7, Abo1, r0, 28, r3, Aku0, lr, 14
		KeccakThetaRhoPiChi r6, Aka1, r8, 20, r7, Ase1, r11,  1, r3, Agi0, r2, 31, r4, Amo1, r0, 27, r5, Abu1, r12, 19
		ldr			r0, [sp, #mDo1]
		KeccakThetaRhoPiChiIota Aba0, r8,         Ake1, r10, 22,     Asi0, r2, 22,     Ago0, r0, 11,     Amu1, r12,  7, 16, 0

		ldr			r2, [sp, #mDi0]
		KeccakThetaRhoPiChi r5, Ama1, r8,  1, r6, Abe1, r10, 22, r7, Aki1, r2, 30, r3, Aso0, r0, 14, r4, Agu1, lr, 10
		KeccakThetaRhoPiChi r7, Aga1, r8,  9, r3, Ame0, r11,  1, r4, Abi1, r2,  3, r5, Ako1, r0, 13, r6, Asu1, r12,  4
		KeccakThetaRhoPiChi r4, Asa0, r9, 18, r5, Age0, r11,  5, r6, Ami0, r2,  7, r7, Abo0, r0, 28, r3, Aku1, r12, 13
		KeccakThetaRhoPiChi r6, Aka0, r9, 21, r7, Ase0, r10,  1, r3, Agi1, r2, 31, r4, Amo0, r0, 28, r5, Abu0, lr, 20
		ldr			r0, [sp, #mDo0]
		KeccakThetaRhoPiChiIota Aba1, r9,         Ake0, r11, 22,     Asi1, r2, 21,     Ago1, r0, 10,     Amu0, lr,  7, 20, 0
		.endm

.macro		KeccakRound3

        xor5        r3,  Amu1, Agu0, Asu1, Aku0, Abu0
        xor5        r7, Ake0, Abe1, Ame1, Age0, Ase1
        xorrol      r8, r3, r7
        xor5        r6,  Amu0, Agu1, Asu0, Aku1, Abu1
        xor5        r12, Ake1, Abe0, Ame0, Age1, Ase0
        eor         r9, r6, r12

        xor5        r5,  Asi0, Aki0, Abi1, Ami1, Agi1
        xorrol      r0, r5, r6
        xor5        r4,  Asi1, Aki1, Abi0, Ami0, Agi0
        eor         r11, r4, r3
		str			r0, [sp, #mDo0]
		str			r11, [sp, #mDo1]

        xor5        r3,  Aba0, Ama0, Aga1, Asa1, Aka0
        xorrol      r10, r3, r4
        xor5        r6,  Aba1, Ama1, Aga0, Asa0, Aka1
        eor         r11, r6, r5

        xor5        r4,  Ago1, Aso0, Ako0, Abo0, Amo1
        xorrol      r12, r12, r4
        xor5        r5,  Ago0, Aso1, Ako1, Abo1, Amo0
        eor         r2, r7, r5
		str			r12, [sp, #mDi0]

        xorrol      r12, r5, r6
        eor         lr, r4, r3

		KeccakThetaRhoPiChi r5, Aga0, r9,  2, r6, Age0, r11, 23, r7, Agi0, r2, 31, r3, Ago0, r0, 14, r4, Agu0, r12, 10
		KeccakThetaRhoPiChi r7, Aka1, r9,  9, r3, Ake1, r10,  0, r4, Aki1, r2,  3, r5, Ako1, r0, 12, r6, Aku1, lr,  4
		KeccakThetaRhoPiChi r4, Ama0, r8, 18, r5, Ame0, r10,  5, r6, Ami0, r2,  8, r7, Amo0, r0, 28, r3, Amu0, lr, 14
		KeccakThetaRhoPiChi r6, Asa1, r8, 20, r7, Ase1, r11,  1, r3, Asi1, r2, 31, r4, Aso1, r0, 27, r5, Asu1, r12, 19
		ldr			r0, [sp, #mDo1]
		KeccakThetaRhoPiChiIota Aba0, r8,         Abe0, r10, 22,     Abi0, r2, 22,     Abo0, r0, 11,     Abu0, r12,  7, 24, 0

		ldr			r2, [sp, #mDi0]
		KeccakThetaRhoPiChi r5, Aga1, r8,  1, r6, Age1, r10, 22, r7, Agi1, r2, 30, r3, Ago1, r0, 14, r4, Agu1, lr, 10
		KeccakThetaRhoPiChi r7, Aka0, r8,  9, r3, Ake0, r11,  1, r4, Aki0, r2,  3, r5, Ako0, r0, 13, r6, Aku0, r12,  4
		KeccakThetaRhoPiChi r4, Ama1, r9, 18, r5, Ame1, r11,  5, r6, Ami1, r2,  7, r7, Amo1, r0, 28, r3, Amu1, r12, 13
		KeccakThetaRhoPiChi r6, Asa0, r9, 21, r7, Ase0, r10,  1, r3, Asi0, r2, 31, r4, Aso0, r0, 28, r5, Asu0, lr, 20
		ldr			r0, [sp, #mDo0]
		KeccakThetaRhoPiChiIota Aba1, r9,         Abe1, r11, 22,     Abi1, r2, 21,     Abo1, r0, 10,     Abu1, lr,  7, 28, 1
		.endm

@// --- code and constants

@//int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
	@// .size ???
	.align	2
	.global	crypto_hash_keccakc512_inplace32bi_armv7m                 @
	.thumb
	.thumb_func
	.type	crypto_hash_keccakc512_inplace32bi_armv7m, %function      @
crypto_hash_keccakc512_inplace32bi_armv7m:  @                         @

		push	{r4-r12,lr}
		subs	sp, sp, #8*4

		@//allocate and clear state
		movs	r3, #0
		movs	r4, r3
		movs	r5, r3
		movs	r6, r3
		movs	r7, r3
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}
		push	{r3-r7}

		str		r0, [sp, #mOut]		@//	save out pointer
		str		r1, [sp, #mIn]		@//	save in pointer

		@//	Complete rate loop	
		subs	r4, r2, #cKeccakR_SizeInBytes
		bcc		crypto_hash_LoopEnd

		ldr		r0, =crypto_hash_LoopRet+1
		str		r0, [sp, #mRet]		@// save return address
crypto_hash_Loop:
		ldr		r0, =KeccakF1600RoundConstantsWithTerminator
		str		r4, [sp, #mLen]		@// save inlen (ignore upper 32-bit word, since CPU address space is only 32-bit wide)
		str		r0, [sp, #mRC]		@// save Round Constants pointer
		mov		r2, #cKeccakR_SizeInBytes/cKeccakLaneSizeInBytes
		b		KeccakF_FullRate
crypto_hash_LoopRet:
		ldr		r2, [sp, #mLen]		@// save inlen (ignore upper 32-bit word, since CPU address space is only 32-bit wide)
		subs	r4, r2, #cKeccakR_SizeInBytes
		bcs		crypto_hash_Loop
crypto_hash_LoopEnd:

		@// Last incomplete lane and padding
		mov		r4, r2, LSR #3		@// r4 nbrFullLanes = len >> 3@
		and		r6, r2, #7			@// r6 len &= 7@	length last incomplete lane

		movs	r0, #1		    	@//	XOR first padding bit into state: state[nbrFullLanes << 1] ^= 1 << (len * 4)@
		mov		r1, r6, LSL #2
		lsls	r0, r0, r1
		ldr		r1, [sp, r4, LSL #3]
		eors	r1, r1, r0
		str		r1, [sp, r4, LSL #3]

		@// XOR last incomplete lane if needed
		ldr		r3, [sp, #mIn]		@//	get in pointer
		add		r3, r3, r4, LSL #3	@// p = in + nbrFullLanes << 3@
		tbb		[pc, r6]
crypto_hash_leftBranchTab:
		.byte	(crypto_hash_0left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_1left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_2left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_3left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_4left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_5left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_6left-crypto_hash_leftBranchTab)/2
		.byte	(crypto_hash_7left-crypto_hash_leftBranchTab)/2

crypto_hash_0left:
		b		crypto_hash_IncompleteDone
crypto_hash_1left:
		ldrb	r0, [r3]
		movs	r1, #0 				@// x1 = 0
		b		crypto_hash_Interleave
crypto_hash_2left:
		ldrh	r0, [r3]
		movs	r1, #0 				@// x1 = 0
		b		crypto_hash_Interleave
crypto_hash_3left:
		ldrh	r0, [r3]
		ldrb	r1, [r3, #2]
		orr		r0, r0, r1, LSL #16
		movs	r1, #0 				@// x1 = 0
		b		crypto_hash_Interleave
crypto_hash_4left:
		ldr		r0, [r3]
		movs	r1, #0 				@// x1 = 0
		b		crypto_hash_Interleave
crypto_hash_5left:
		ldr		r0, [r3]
		ldrb	r1, [r3, #4]
		b		crypto_hash_Interleave
crypto_hash_6left:
		ldr		r0, [r3]
		ldrh	r1, [r3, #4]
		b		crypto_hash_Interleave
crypto_hash_7left:
		ldrh	r1, [r3, #4]
		ldrb	r0, [r3, #6]
		orr		r1, r1, r0, LSL #16
		ldr		r0, [r3]

crypto_hash_Interleave:
		add		r8, sp, r4, LSL #3
		ldrd	r2, r3, [r8]
		interleaveLane	r0, r1, r2, r3, r6
		strd	r2, r3, [r8]
crypto_hash_IncompleteDone:
		ldr		r0, [sp, #cKeccakR_SizeInBytes-4]	@//	XOR second padding bit into state
		eor		r0, #0x80000000
		str		r0, [sp, #cKeccakR_SizeInBytes-4]

		ldr		r0, =crypto_hash_SqueezeRet+1
		str		r0, [sp, #mRet]		@// save return address
		ldr		r0, =KeccakF1600RoundConstantsWithTerminator
		str		r0, [sp, #mRC]		@// save Round Constants pointer
		movs	r2, r4
		b		KeccakF
crypto_hash_SqueezeRet:

		ldr		r7, [sp, #mOut]		@// save return address
		movs    r4, #crypto_hash_BYTES/cKeccakLaneSizeInBytes	@len  = crypto_hash_BYTES / cKeccakLaneSizeInBytes@
		mov		r3, sp
crypto_hash_OutputLoop:
		ldrd	r0, r1, [r3], #8
		uninterleaveLane	r0, r1, r2
		str		r0, [r7], #4
		str		r1, [r7], #4
		subs	r4, r4, #1
		bne		crypto_hash_OutputLoop

		adds	sp, sp, #5*5*2*4+8*4
		movs	r0, #0
		pop		{r4-r12,pc}
@		nop							@// pad for alignment

	@ ALIGN
		.ltorg
KeccakF1600RoundConstantsWithTerminator:
		.word	0x00000001
		.word	0x00000000
		.word	0x00000000
		.word	0x00000089
		.word	0x00000000
		.word	0x8000008b
		.word	0x00000000
		.word	0x80008080

		.word	0x00000001
		.word	0x0000008b
		.word	0x00000001
		.word	0x00008000
		.word	0x00000001
		.word	0x80008088
		.word	0x00000001
		.word	0x80000082

		.word	0x00000000
		.word	0x0000000b
		.word	0x00000000
		.word	0x0000000a
		.word	0x00000001
		.word	0x00008082
		.word	0x00000000
		.word	0x00008003

		.word	0x00000001
		.word	0x0000808b
		.word	0x00000001
		.word	0x8000000b
		.word	0x00000001
		.word	0x8000008a
		.word	0x00000001
		.word	0x80000081

		.word	0x00000000
		.word	0x80000081
		.word	0x00000000
		.word	0x80000008
		.word	0x00000000
		.word	0x00000083
		.word	0x00000000
		.word	0x80008003

		.word	0x00000001
		.word	0x80008088
		.word	0x00000000
		.word	0x80000088
		.word	0x00000001
		.word	0x00008000
		.word	0x00000000
		.word	0x80008082

		.word	0xFFFFFFFF	@//terminator

	@

	@ ALIGN

KeccakF:
		cmp		r2, #0
		beq		roundLoop
KeccakF_FullRate:
		mov		r8, sp
		ldr		r1, [sp, #mIn]
interleaveLoop:
		ldr		r4, [r1], #4
		ldr		r5, [r1], #4
		ldrd    r6, r7, [r8]
		interleaveLane	r4, r5, r6, r7, r3
		strd	r6,r7,[r8], #8
		subs	r2, r2, #1
		bne		interleaveLoop
		str		r1, [sp, #mIn]

roundLoop:
		KeccakRound0
		KeccakRound1
		KeccakRound2
		KeccakRound3
		bne		roundLoop
		ldr		pc, [sp, #mRet]

	@
	@ ALIGN

