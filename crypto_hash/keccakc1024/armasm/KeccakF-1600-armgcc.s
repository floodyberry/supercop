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

.equ _ba0	,   0*4
.equ _ba1	,   1*4
.equ _be0	,   2*4
.equ _be1	,   3*4
.equ _bi0	,   4*4
.equ _bi1	,   5*4
.equ _bo0	,   6*4
.equ _bo1	,   7*4
.equ _bu0	,   8*4
.equ _bu1	,   9*4
.equ _ga0	,  10*4
.equ _ga1	,  11*4
.equ _ge0	,  12*4
.equ _ge1	,  13*4
.equ _gi0	,  14*4
.equ _gi1	,  15*4
.equ _go0	,  16*4
.equ _go1	,  17*4
.equ _gu0	,  18*4
.equ _gu1	,  19*4
.equ _ka0	,  20*4
.equ _ka1	,  21*4
.equ _ke0	,  22*4
.equ _ke1	,  23*4
.equ _ki0	,  24*4
.equ _ki1	,  25*4
.equ _ko0	,  26*4
.equ _ko1	,  27*4
.equ _ku0	,  28*4
.equ _ku1	,  29*4
.equ _ma0	,  30*4
.equ _ma1	,  31*4
.equ _me0	,  32*4
.equ _me1	,  33*4
.equ _mi0	,  34*4
.equ _mi1	,  35*4
.equ _mo0	,  36*4
.equ _mo1	,  37*4
.equ _mu0	,  38*4
.equ _mu1	,  39*4
.equ _sa0	,  40*4
.equ _sa1	,  41*4
.equ _se0	,  42*4
.equ _se1	,  43*4
.equ _si0	,  44*4
.equ _si1	,  45*4
.equ _so0	,  46*4
.equ _so1	,  47*4
.equ _su0	,  48*4
.equ _su1	,  49*4

.equ mDe1	,  50*4
.equ mDi0	,  51*4
.equ mDo0	,  52*4
.equ mDo1	,  53*4

@// --- macros

.macro		xor5		result,ptr,b,g,k,m,s

		ldr			\result, [\ptr, #\b]
		ldr			r1, [\ptr, #\g]
		ldr			r2, [\ptr, #\k]
		eor			\result, \result, r1				
		ldr			r1, [\ptr, #\m]
		eor			\result, \result, r2
		ldr			r2, [\ptr, #\s]
		eor			\result, \result, r1				
		eor			\result, \result, r2
		.endm

.macro		xorrol 		b, yy, rr

		eor			\b, \b, \yy
		ror			\b, #32-\rr
		.endm


.macro		xandnot 	resptr, resofs, aa, bb, cc

		bic			r1, \cc, \bb
		eor			r1, r1, \aa
		str			r1, [\resptr, #\resofs]
		.endm

.macro		xandnotRC 	resptr, resofs, aa, bb, cc

		ldr			r1, [r3], #4
		bic			\cc, \cc, \bb
		eor			\cc, \cc, r1
		eor			\cc, \cc, \aa
		str			\cc, [\resptr, #\resofs]
		.endm


	.size	KeccakPermutationOnWords, .-KeccakPermutationOnWords
	.align	2
	.global	KeccakPermutationOnWordsAfterXoring_ARM_asm
	.thumb
	.thumb_func
	.type	KeccakPermutationOnWordsAfterXoring_ARM_asm, %function
KeccakPermutationOnWordsAfterXoring_ARM_asm:
	@ args = 0, pretend = 0, frame = 408
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.

    push	{r4-r12,lr}
		sub   sp,sp,#4*(50+4)

		movs	r9, r2
		beq		interleaveDone
		mov		r8,r0
interleaveLoop:

		ldr		r4, [r1], #4
		ldr		r5, [r1], #4
		ldrd    r6, r7, [r8]

		@// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
		and		r3,r4,#0x55555555
		orr		r3,r3,r3, LSR #1
		and		r3,r3,#0x33333333
		orr		r3,r3,r3, LSR #2
		and		r3,r3,#0x0F0F0F0F
		orr		r3,r3,r3, LSR #4
		and		r3,r3,#0x00FF00FF
		bfi		r3,r3,#8, #8
		eor		r6,r6,r3, LSR #8

		and		r3,r5,#0x55555555
		orr		r3,r3,r3, LSR #1
		and		r3,r3,#0x33333333
		orr		r3,r3,r3, LSR #2
		and		r3,r3,#0x0F0F0F0F
		orr		r3,r3,r3, LSR #4
		and		r3,r3,#0x00FF00FF
		orr		r3,r3,r3, LSR #8
		eor		r6,r6,r3, LSL #16

		and		r3,r4,#0xAAAAAAAA
		orr		r3,r3,r3, LSL #1
		and		r3,r3,#0xCCCCCCCC
		orr		r3,r3,r3, LSL #2
		and		r3,r3,#0xF0F0F0F0
		orr		r3,r3,r3, LSL #4
		and		r3,r3,#0xFF00FF00
		orr		r3,r3,r3, LSL #8
		eor		r7,r7,r3, LSR #16

		and		r3,r5,#0xAAAAAAAA
		orr		r3,r3,r3, LSL #1
		and		r3,r3,#0xCCCCCCCC
		orr		r3,r3,r3, LSL #2
		and		r3,r3,#0xF0F0F0F0
		orr		r3,r3,r3, LSL #4
		and		r3,r3,#0xFF00FF00
		orr		r3,r3,r3, LSL #8
		bfc		r3, #0, #16
		eor		r7,r7,r3

		strd	r6,r7,[r8], #8

		subs	r9,r9,#1
		bne		interleaveLoop

interleaveDone:

		ldr		r3, =KeccakF1600RoundConstantsWithTerminator
		b		roundLoop	@//jump over the table
		.ltorg

	@ ALIGN

KeccakF1600RoundConstantsWithTerminator:
		@//		0			1
		.word	0x00000001
    .word 0x00000000
		.word 0x00000000
    .word 0x00000089
		.word 0x00000000
    .word 0x8000008b
		.word 0x00000000
    .word 0x80008080
		.word 0x00000001
    .word 0x0000008b
		.word 0x00000001
		.word 0x00008000
		.word 0x00000001
		.word 0x80008088
		.word 0x00000001
		.word 0x80000082
		.word 0x00000000
		.word 0x0000000b
		.word 0x00000000
		.word 0x0000000a
		.word 0x00000001
		.word 0x00008082
		.word 0x00000000
		.word 0x00008003
		.word 0x00000001
		.word 0x0000808b
		.word 0x00000001
 		.word 0x8000000b
		.word 0x00000001
		.word 0x8000008a
		.word 0x00000001
		.word 0x80000081
		.word 0x00000000
		.word 0x80000081
		.word 0x00000000
		.word 0x80000008
		.word 0x00000000
		.word 0x00000083
		.word 0x00000000
		.word 0x80008003
		.word 0x00000001
		.word 0x80008088
		.word 0x00000000
		.word 0x80000088
		.word 0x00000001
		.word 0x00008000
		.word 0x00000000
		.word 0x80008082
		.word 0xFFFFFFFF	@//terminator

roundLoop:

		@//prepTheta	A		
	    xor5		r10, r0,_bu0, _gu0, _ku0, _mu0, _su0
	    xor5		r6, r0,_be1, _ge1, _ke1, _me1, _se1
		eor			r5, r10, r6, ROR #31
	    xor5	  	r11, r0,_bu1, _gu1, _ku1, _mu1, _su1
	    xor5		r7, r0,_be0, _ge0, _ke0, _me0, _se0
	    eor			r4, r11, r7

	    xor5		r8, r0,_bi0, _gi0, _ki0, _mi0, _si0
	    eor			r1, r8, r11, ROR #31
		str			r1, [sp, #mDo0]
	    xor5		r9, r0,_bi1, _gi1, _ki1, _mi1, _si1
	    eor			r1, r9, r10
		str			r1, [sp, #mDo1]

	    xor5		r10, r0,_ba0, _ga0, _ka0, _ma0, _sa0
	    eor			lr, r10, r9, ROR #31
	    xor5		r11, r0,_ba1, _ga1, _ka1, _ma1, _sa1
	    eor			r1, r11, r8
		str			r1, [sp, #mDe1]

	    xor5		r9, r0,_bo1, _go1, _ko1, _mo1, _so1
	    eor			r1, r7, r9, ROR #31
		str			r1, [sp, #mDi0]
	    xor5		r8, r0,_bo0, _go0, _ko0, _mo0, _so0
	    eor			r2, r6, r8

	    eor			r7, r8, r11, ROR #31
	    eor			r6, r9, r10

		@//thetaRhoPiChiIota 0, in A, out E
		ldr			r8, [r0, #_ba0]
		ldr			r9, [r0, #_ge0]
		ldr			r10, [r0, #_ki1]
		ldr			r11, [r0, #_mo1]
		ldr			r12, [r0, #_su0]
		ldr			r1, [sp, #mDo1]
		eor			r8, r8, r5
		xorrol 		r9, lr, 22
		xorrol 		r10, r2, 22
		xorrol 		r11, r1,  11
		xorrol 		r12, r7,  7
		xandnot		sp, _be0, r9, r10, r11
		xandnot		sp, _bi0, r10, r11, r12
		xandnot		sp, _bo0, r11, r12, r8
		xandnot		sp, _bu0, r12, r8, r9
		xandnotRC	sp, _ba0, r8, r9, r10

		ldr			r8, [r0, #_bo0]
		ldr			r1, [sp, #mDo0]
		ldr			r9, [r0, #_gu0]
	    xorrol 		r8, r1, 14
		ldr			r1, [sp, #mDe1]
		ldr			r10, [r0, #_ka1]
		ldr			r11, [r0, #_me1]
		ldr			r12, [r0, #_si1]
	    xorrol 		r9, r7, 10
	    xorrol 		r10, r4,  2
	    xorrol 		r11, r1,  23
	    xorrol 		r12, r2, 31
		xandnot		sp, _ga0, r8, r9, r10
		xandnot		sp, _ge0, r9, r10, r11
		xandnot		sp, _gi0, r10, r11, r12
		xandnot		sp, _go0, r11, r12, r8
		xandnot		sp, _gu0, r12, r8, r9

		ldr			r8, [r0, #_be1]
		ldr			r1, [sp, #mDe1]
		ldr			r9, [r0, #_gi0]
	    xorrol 		r8, r1,   1
		ldr			r1, [sp, #mDi0]
		ldr			r10, [r0, #_ko1]
	    xorrol 		r9, r1,   3
		ldr			r1, [sp, #mDo1]
		ldr			r11, [r0, #_mu0]
		ldr			r12, [r0, #_sa0]
	    xorrol 		r10, r1,  13
	    xorrol 		r11, r7,  4
	    xorrol 		r12, r5,  9
		xandnot		sp, _ka0, r8, r9, r10
		xandnot		sp, _ke0, r9, r10, r11
		xandnot		sp, _ki0, r10, r11, r12
		xandnot		sp, _ko0, r11, r12, r8
		xandnot		sp, _ku0, r12, r8, r9

		ldr			r8, [r0, #_bu1]
		ldr			r9, [r0, #_ga0]
		ldr			r10, [r0, #_ke0]
		ldr			r11, [r0, #_mi1]
		ldr			r12, [r0, #_so0]
		ldr			r1, [sp, #mDo0]
	    xorrol 		r8, r6, 14
	    xorrol 		r9, r5, 18
	    xorrol 		r10, lr,  5
	    xorrol 		r11, r2,  8
	    xorrol 		r12, r1,  28
		xandnot		sp, _ma0, r8, r9, r10
		xandnot		sp, _me0, r9, r10, r11
		xandnot		sp, _mi0, r10, r11, r12
		xandnot		sp, _mo0, r11, r12, r8
		xandnot		sp, _mu0, r12, r8, r9

		ldr			r1, [sp, #mDi0]
		ldr			r8, [r0, #_bi0]
		ldr			r9, [r0, #_go1]
	    xorrol 		r8, r1,  31
		ldr			r1, [sp, #mDo1]
		ldr			r10, [r0, #_ku1]
	    xorrol 		r9, r1,  28
		ldr			r11, [r0, #_ma1]
		ldr			r12, [r0, #_se0]
	    xorrol 		r10, r6, 20
	    xorrol 		r11, r4, 21
	    xorrol 		r12, lr,  1
		xandnot		sp, _sa0, r8, r9, r10
		xandnot		sp, _se0, r9, r10, r11
		xandnot		sp, _si0, r10, r11, r12
		xandnot		sp, _so0, r11, r12, r8
		xandnot		sp, _su0, r12, r8, r9

		@//	thetaRhoPiChiIota 1, in A, out E
		ldr			r1, [sp, #mDe1]
		ldr			r9, [r0, #_ge1]
		ldr			r8, [r0, #_ba1]
	    xorrol 		r9, r1,  22
		ldr			r1, [sp, #mDi0]
		ldr			r10, [r0, #_ki0]
	    eor			r8, r8, r4    
	    xorrol 		r10, r1,  21
		ldr			r1, [sp, #mDo0]
		ldr			r11, [r0, #_mo0]
		ldr			r12, [r0, #_su1]
	    xorrol 		r11, r1,  10
	    xorrol 		r12, r6,  7
		xandnot		sp, _be1, r9, r10, r11
		xandnot		sp, _bi1, r10, r11, r12
		xandnot		sp, _bo1, r11, r12, r8
		xandnot		sp, _bu1, r12, r8, r9
		xandnotRC	sp, _ba1, r8, r9, r10

		ldr			r1, [sp, #mDo1]
		ldr			r8, [r0, #_bo1]
		ldr			r12, [r0, #_si0]
	    xorrol 		r8, r1,  14
		ldr			r1, [sp, #mDi0]
		ldr			r9, [r0, #_gu1]
	    xorrol 		r12, r1,  30
		ldr			r10, [r0, #_ka0]
		ldr			r11, [r0, #_me0]
	    xorrol 		r9, r6, 10
	    xorrol 		r10, r5,  1
	    xorrol 		r11, lr, 22
		xandnot		sp, _ga1, r8, r9, r10
		xandnot		sp, _ge1, r9, r10, r11
		xandnot		sp, _gi1, r10, r11, r12
		xandnot		sp, _go1, r11, r12, r8
		xandnot		sp, _gu1, r12, r8, r9

		ldr			r1, [sp, #mDo0]
		ldr			r10, [r0, #_ko0]
		ldr			r8, [r0, #_be0]
	    xorrol 		r10, r1,  12
		ldr			r9, [r0, #_gi1]
		ldr			r11, [r0, #_mu1]
		ldr			r12, [r0, #_sa1]
	    eor			r8, r8, lr    
	    xorrol 		r9, r2,  3
	    xorrol 		r11, r6,  4
	    xorrol 		r12, r4,  9
		xandnot		sp, _ka1, r8, r9, r10
		xandnot		sp, _ke1, r9, r10, r11
		xandnot		sp, _ki1, r10, r11, r12
		xandnot		sp, _ko1, r11, r12, r8
		xandnot		sp, _ku1, r12, r8, r9

		ldr			r1, [sp, #mDe1]
		ldr			r10, [r0, #_ke1]
		ldr			r11, [r0, #_mi0]
	    xorrol 		r10, r1,   5
		ldr			r1, [sp, #mDi0]
		ldr			r12, [r0, #_so1]
	    xorrol 		r11, r1,   7
		ldr			r1, [sp, #mDo1]
		ldr			r8, [r0, #_bu0]
		ldr			r9, [r0, #_ga1]
	    xorrol 		r8, r7, 13
	    xorrol 		r9, r4, 18
	    xorrol 		r12, r1,  28
		xandnot		sp, _ma1, r8, r9, r10
		xandnot		sp, _me1, r9, r10, r11
		xandnot		sp, _mi1, r10, r11, r12
		xandnot		sp, _mo1, r11, r12, r8
		xandnot		sp, _mu1, r12, r8, r9

		ldr			r1, [sp, #mDo0]
		ldr			r9, [r0, #_go0]
		ldr			r8, [r0, #_bi1]
	    xorrol 		r9, r1,  27
		ldr			r10, [r0, #_ku0]
		ldr			r11, [r0, #_ma0]
		ldr			r12, [r0, #_se1]
		ldr			r1, [sp, #mDe1]
	    xorrol 		r8, r2, 31
	    xorrol 		r10, r7, 19
	    xorrol 		r11, r5, 20
	    xorrol 		r12, r1,  1
		xandnot		sp, _sa1, r8, r9, r10
		xandnot		sp, _se1, r9, r10, r11
		xandnot		sp, _si1, r10, r11, r12
		xandnot		sp, _so1, r11, r12, r8
		xandnot		sp, _su1, r12, r8, r9

		@//prepTheta	E		
	    xor5		r10, sp,_bu0, _gu0, _ku0, _mu0, _su0
	    xor5		r6, sp,_be1, _ge1, _ke1, _me1, _se1
		eor			r5, r10, r6, ROR #31
	    xor5	  	r11, sp,_bu1, _gu1, _ku1, _mu1, _su1
	    xor5		r7, sp,_be0, _ge0, _ke0, _me0, _se0
	    eor			r4, r11, r7

	    xor5		r8, sp,_bi0, _gi0, _ki0, _mi0, _si0
	    eor			r1, r8, r11, ROR #31
		str			r1, [sp, #mDo0]
	    xor5		r9, sp,_bi1, _gi1, _ki1, _mi1, _si1
	    eor			r1, r9, r10
		str			r1, [sp, #mDo1]

	    xor5		r10, sp,_ba0, _ga0, _ka0, _ma0, _sa0
	    eor			lr, r10, r9, ROR #31
	    xor5		r11, sp,_ba1, _ga1, _ka1, _ma1, _sa1
	    eor			r1, r11, r8
		str			r1, [sp, #mDe1]

	    xor5		r9, sp,_bo1, _go1, _ko1, _mo1, _so1
	    eor			r1, r7, r9, ROR #31
		str			r1, [sp, #mDi0]
	    xor5		r8, sp,_bo0, _go0, _ko0, _mo0, _so0
	    eor			r2, r6, r8

	    eor			r7, r8, r11, ROR #31
	    eor			r6, r9, r10

		@//thetaRhoPiChiIota 0, in E, out A
		ldr			r8, [sp, #_ba0]
		ldr			r9, [sp, #_ge0]
		ldr			r10, [sp, #_ki1]
		ldr			r11, [sp, #_mo1]
		ldr			r12, [sp, #_su0]
		ldr			r1, [sp, #mDo1]
		eor			r8, r8, r5
		xorrol 		r9, lr, 22
		xorrol 		r10, r2, 22
		xorrol 		r11, r1,  11
		xorrol 		r12, r7,  7
		xandnot		r0, _be0, r9, r10, r11
		xandnot		r0, _bi0, r10, r11, r12
		xandnot		r0, _bo0, r11, r12, r8
		xandnot		r0, _bu0, r12, r8, r9
		xandnotRC	r0, _ba0, r8, r9, r10

		ldr			r8, [sp, #_bo0]
		ldr			r1, [sp, #mDo0]
		ldr			r9, [sp, #_gu0]
	    xorrol 		r8, r1, 14
		ldr			r1, [sp, #mDe1]
		ldr			r10, [sp, #_ka1]
		ldr			r11, [sp, #_me1]
		ldr			r12, [sp, #_si1]
	    xorrol 		r9, r7, 10
	    xorrol 		r10, r4,  2
	    xorrol 		r11, r1,  23
	    xorrol 		r12, r2, 31
		xandnot		r0, _ga0, r8, r9, r10
		xandnot		r0, _ge0, r9, r10, r11
		xandnot		r0, _gi0, r10, r11, r12
		xandnot		r0, _go0, r11, r12, r8
		xandnot		r0, _gu0, r12, r8, r9

		ldr			r8, [sp, #_be1]
		ldr			r1, [sp, #mDe1]
		ldr			r9, [sp, #_gi0]
	    xorrol 		r8, r1,   1
		ldr			r1, [sp, #mDi0]
		ldr			r10, [sp, #_ko1]
	    xorrol 		r9, r1,   3
		ldr			r1, [sp, #mDo1]
		ldr			r11, [sp, #_mu0]
		ldr			r12, [sp, #_sa0]
	    xorrol 		r10, r1,  13
	    xorrol 		r11, r7,  4
	    xorrol 		r12, r5,  9
		xandnot		r0, _ka0, r8, r9, r10
		xandnot		r0, _ke0, r9, r10, r11
		xandnot		r0, _ki0, r10, r11, r12
		xandnot		r0, _ko0, r11, r12, r8
		xandnot		r0, _ku0, r12, r8, r9

		ldr			r8, [sp, #_bu1]
		ldr			r9, [sp, #_ga0]
		ldr			r10, [sp, #_ke0]
		ldr			r11, [sp, #_mi1]
		ldr			r12, [sp, #_so0]
		ldr			r1, [sp, #mDo0]
	    xorrol 		r8, r6, 14
	    xorrol 		r9, r5, 18
	    xorrol 		r10, lr,  5
	    xorrol 		r11, r2,  8
	    xorrol 		r12, r1,  28
		xandnot		r0, _ma0, r8, r9, r10
		xandnot		r0, _me0, r9, r10, r11
		xandnot		r0, _mi0, r10, r11, r12
		xandnot		r0, _mo0, r11, r12, r8
		xandnot		r0, _mu0, r12, r8, r9

		ldr			r1, [sp, #mDi0]
		ldr			r8, [sp, #_bi0]
		ldr			r9, [sp, #_go1]
	    xorrol 		r8, r1,  31
		ldr			r1, [sp, #mDo1]
		ldr			r10, [sp, #_ku1]
	    xorrol 		r9, r1,  28
		ldr			r11, [sp, #_ma1]
		ldr			r12, [sp, #_se0]
	    xorrol 		r10, r6, 20
	    xorrol 		r11, r4, 21
	    xorrol 		r12, lr,  1
		xandnot		r0, _sa0, r8, r9, r10
		xandnot		r0, _se0, r9, r10, r11
		xandnot		r0, _si0, r10, r11, r12
		xandnot		r0, _so0, r11, r12, r8
		xandnot		r0, _su0, r12, r8, r9

		@//	thetaRhoPiChiIota 1, in A, out E
		ldr			r1, [sp, #mDe1]
		ldr			r9, [sp, #_ge1]
		ldr			r8, [sp, #_ba1]
	    xorrol 		r9, r1,  22
		ldr			r1, [sp, #mDi0]
		ldr			r10, [sp, #_ki0]
	    eor			r8, r8, r4    
	    xorrol 		r10, r1,  21
		ldr			r1, [sp, #mDo0]
		ldr			r11, [sp, #_mo0]
		ldr			r12, [sp, #_su1]
	    xorrol 		r11, r1,  10
	    xorrol 		r12, r6,  7
		xandnot		r0, _be1, r9, r10, r11
		xandnot		r0, _bi1, r10, r11, r12
		xandnot		r0, _bo1, r11, r12, r8
		xandnot		r0, _bu1, r12, r8, r9
		xandnotRC	r0, _ba1, r8, r9, r10

		ldr			r1, [sp, #mDo1]
		ldr			r8, [sp, #_bo1]
		ldr			r12, [sp, #_si0]
	    xorrol 		r8, r1,  14
		ldr			r1, [sp, #mDi0]
		ldr			r9, [sp, #_gu1]
	    xorrol 		r12, r1,  30
		ldr			r10, [sp, #_ka0]
		ldr			r11, [sp, #_me0]
	    xorrol 		r9, r6, 10
	    xorrol 		r10, r5,  1
	    xorrol 		r11, lr, 22
		xandnot		r0, _ga1, r8, r9, r10
		xandnot		r0, _ge1, r9, r10, r11
		xandnot		r0, _gi1, r10, r11, r12
		xandnot		r0, _go1, r11, r12, r8
		xandnot		r0, _gu1, r12, r8, r9

		ldr			r1, [sp, #mDo0]
		ldr			r10, [sp, #_ko0]
		ldr			r8, [sp, #_be0]
	    xorrol 		r10, r1,  12
		ldr			r9, [sp, #_gi1]
		ldr			r11, [sp, #_mu1]
		ldr			r12, [sp, #_sa1]
	    eor			r8, r8, lr    
	    xorrol 		r9, r2,  3
	    xorrol 		r11, r6,  4
	    xorrol 		r12, r4,  9
		xandnot		r0, _ka1, r8, r9, r10
		xandnot		r0, _ke1, r9, r10, r11
		xandnot		r0, _ki1, r10, r11, r12
		xandnot		r0, _ko1, r11, r12, r8
		xandnot		r0, _ku1, r12, r8, r9

		ldr			r1, [sp, #mDe1]
		ldr			r10, [sp, #_ke1]
		ldr			r11, [sp, #_mi0]
	    xorrol 		r10, r1,   5
		ldr			r1, [sp, #mDi0]
		ldr			r12, [sp, #_so1]
	    xorrol 		r11, r1,   7
		ldr			r1, [sp, #mDo1]
		ldr			r8, [sp, #_bu0]
		ldr			r9, [sp, #_ga1]
	    xorrol 		r8, r7, 13
	    xorrol 		r9, r4, 18
	    xorrol 		r12, r1,  28
		xandnot		r0, _ma1, r8, r9, r10
		xandnot		r0, _me1, r9, r10, r11
		xandnot		r0, _mi1, r10, r11, r12
		xandnot		r0, _mo1, r11, r12, r8
		xandnot		r0, _mu1, r12, r8, r9

		ldr			r1, [sp, #mDo0]
		ldr			r9, [sp, #_go0]
		ldr			r8, [sp, #_bi1]
	    xorrol 		r9, r1,  27
		ldr			r10, [sp, #_ku0]
		ldr			r11, [sp, #_ma0]
		ldr			r12, [sp, #_se1]
		ldr			r1, [sp, #mDe1]
	    xorrol 		r8, r2, 31
	    xorrol 		r10, r7, 19
	    xorrol 		r11, r5, 20
	    xorrol 		r12, r1,  1
		xandnot		r0, _sa1, r8, r9, r10
		xandnot		r0, _se1, r9, r10, r11
		xandnot		r0, _si1, r10, r11, r12
		xandnot		r0, _so1, r11, r12, r8
		ldr			r10, [r3]
		xandnot		r0, _su1, r12, r8, r9

		cmp			r10, #0xFFFFFFFF
		bne			roundLoop

		add			sp,sp,#4*(50+4)
		pop			{r4-r12,pc}

	@

	@ ALIGN

