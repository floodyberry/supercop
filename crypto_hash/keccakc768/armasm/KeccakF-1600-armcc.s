
		PRESERVE8
		THUMB
		AREA    |.text|, CODE, READONLY

;// --- defines

_ba0	equ  0*4
_ba1	equ  1*4
_be0	equ  2*4
_be1	equ  3*4
_bi0	equ  4*4
_bi1	equ  5*4
_bo0	equ  6*4
_bo1	equ  7*4
_bu0	equ  8*4
_bu1	equ  9*4
_ga0	equ 10*4
_ga1	equ 11*4
_ge0	equ 12*4
_ge1	equ 13*4
_gi0	equ 14*4
_gi1	equ 15*4
_go0	equ 16*4
_go1	equ 17*4
_gu0	equ 18*4
_gu1	equ 19*4
_ka0	equ 20*4
_ka1	equ 21*4
_ke0	equ 22*4
_ke1	equ 23*4
_ki0	equ 24*4
_ki1	equ 25*4
_ko0	equ 26*4
_ko1	equ 27*4
_ku0	equ 28*4
_ku1	equ 29*4
_ma0	equ 30*4
_ma1	equ 31*4
_me0	equ 32*4
_me1	equ 33*4
_mi0	equ 34*4
_mi1	equ 35*4
_mo0	equ 36*4
_mo1	equ 37*4
_mu0	equ 38*4
_mu1	equ 39*4
_sa0	equ 40*4
_sa1	equ 41*4
_se0	equ 42*4
_se1	equ 43*4
_si0	equ 44*4
_si1	equ 45*4
_so0	equ 46*4
_so1	equ 47*4
_su0	equ 48*4
_su1	equ 49*4

mDe1	equ 50*4
mDi0	equ 51*4
mDo0	equ 52*4
mDo1	equ 53*4

;// --- macros

		MACRO
		xor5		$result,$ptr,$b,$g,$k,$m,$s

		ldr			$result, [$ptr, #$b]
		ldr			r1, [$ptr, #$g]
		ldr			r2, [$ptr, #$k]
		eor			$result, $result, r1				
		ldr			r1, [$ptr, #$m]
		eor			$result, $result, r2
		ldr			r2, [$ptr, #$s]
		eor			$result, $result, r1				
		eor			$result, $result, r2
		MEND

		MACRO
		xorrol 		$b, $yy, $rr

		eor			$b, $b, $yy
		ror			$b, #32-$rr
		MEND


		MACRO
		xandnot 	$resptr, $resofs, $aa, $bb, $cc

		bic			r1, $cc, $bb
		eor			r1, r1, $aa
		str			r1, [$resptr, #$resofs]
		MEND

		MACRO
		xandnotRC 	$resptr, $resofs, $aa, $bb, $cc

		ldr			r1, [r3], #4
		bic			$cc, $cc, $bb
		eor			$cc, $cc, r1
		eor			$cc, $cc, $aa
		str			$cc, [$resptr, #$resofs]
		MEND


		EXPORT  KeccakPermutationOnWordsAfterXoring_ARM_asm
KeccakPermutationOnWordsAfterXoring_ARM_asm   PROC

		push	{r4-r12,lr}
		sub      sp,sp,#4*(50+4)

		movs	r9, r2
		beq		interleaveDone
		mov		r8,r0
interleaveLoop

		ldr		r4, [r1], #4
		ldr		r5, [r1], #4
		ldrd    r6, r7, [r8]

		;// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
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

interleaveDone

		ldr		r3, =KeccakF1600RoundConstantsWithTerminator
		b		roundLoop	;//jump over the table
		LTORG

		ALIGN

KeccakF1600RoundConstantsWithTerminator
		;//		0			1
		dcd		0x00000001,	0x00000000
		dcd		0x00000000,	0x00000089
		dcd		0x00000000,	0x8000008b
		dcd		0x00000000,	0x80008080
		dcd		0x00000001,	0x0000008b
		dcd		0x00000001,	0x00008000
		dcd		0x00000001,	0x80008088
		dcd		0x00000001,	0x80000082
		dcd		0x00000000,	0x0000000b
		dcd		0x00000000,	0x0000000a
		dcd		0x00000001,	0x00008082
		dcd		0x00000000,	0x00008003
		dcd		0x00000001,	0x0000808b
		dcd		0x00000001,	0x8000000b
		dcd		0x00000001,	0x8000008a
		dcd		0x00000001,	0x80000081
		dcd		0x00000000,	0x80000081
		dcd		0x00000000,	0x80000008
		dcd		0x00000000,	0x00000083
		dcd		0x00000000,	0x80008003
		dcd		0x00000001,	0x80008088
		dcd		0x00000000,	0x80000088
		dcd		0x00000001,	0x00008000
		dcd		0x00000000,	0x80008082
		dcd		0xFFFFFFFF	;//terminator

roundLoop

		;//prepTheta	A		
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

		;//thetaRhoPiChiIota 0, in A, out E
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

		;//	thetaRhoPiChiIota 1, in A, out E
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

		;//prepTheta	E		
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

		;//thetaRhoPiChiIota 0, in E, out A
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

		;//	thetaRhoPiChiIota 1, in A, out E
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

		ENDP

		ALIGN

		END
