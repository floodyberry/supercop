/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by Ronny Van Keer, hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include "Keccak-avr8-settings.h"
#include "crypto_hash.h"

#define	cKeccakR_SizeInBytes	(cKeccakR/8)

#ifndef crypto_hash_BYTES
    #ifdef cKeccakFixedOutputLengthInBytes
        #define crypto_hash_BYTES cKeccakFixedOutputLengthInBytes
    #else
        #define crypto_hash_BYTES cKeccakR_SizeInBytes
    #endif
#endif

//	Registers used in all routines
#define	zero			1
#define	rpState		24
#define	rX				26
#define	rY				28
#define	rZ				30


/*
 * int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
 *
 * argument out   is passed in r24:r25
 * argument in    is passed in r22:r23
 * argument inlen is passed in r14:r21, only lowest 16-bits (r14-r15) are used
 */
.global crypto_hash_keccakc512_avr8asmc		
crypto_hash_keccakc512_avr8asmc:			

	//	crypto_hash only registers
	#define	rT1				16
	#define	rT2				17
	#define	rT3				18
	#define	rInLen		22 //(2 regs)
	#define	sp				0x3D

	push	r2
	push	r3
	push	r4
	push	r5
	push	r6
	push	r7
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15
	push	r16
	push	r17
	push	r28
	push	r29

	//	Allocate state (25*8) + C variables (5*8)
	in		rZ,			 			sp
	in		rZ+1, 				sp+1
	subi  rZ,			  		240
	sbci  rZ+1,					0
	in		r0,						0x3F
	cli         				
	out		sp+1, 				rZ+1
	out		sp,						rZ
	out		0x3F,					r0
	adiw	rZ,						41			// pointer to start of state, end of C, compensate post decrement

	push	r24										// save out pointer
	push	r25

	movw	rpState,			rZ
	movw	rY, 					r22				//y contains in pointer
	movw	rInLen,				r14

	ldi		rT3,					5*5*8			//clear state
clearStateLoop:
	st		z+,						zero
	dec		rT3
	brne	clearStateLoop

	//	Full blocks
	cpi		rInLen,				cKeccakR_SizeInBytes
	cpc		rInLen+1,			zero         
	brcs	ch_lastblock

ch_FullRateLoop:
	ldi		rT3, 					cKeccakR_SizeInBytes
	movw	rZ, 					rpState
ch_XorLanesLoop:
	ld		rT1,					Y+
	ld		rT2, 					Z
	eor		rT1, 					rT2
	st		Z+, 					rT1
	subi	rT3, 					1
	brne	ch_XorLanesLoop
	
	push	rY
	push	rY+1
	call  KeccakF
	pop		rY+1
	pop		rY

	subi  rInLen,   		cKeccakR_SizeInBytes
	sbci  rInLen+1, 		0
	cpi   rInLen,   		cKeccakR_SizeInBytes
	cpc   rInLen+1, 		zero         
	brcc	ch_FullRateLoop

ch_lastblock:					//	XOR last uncomplete block into state
	movw	rZ, 					rpState

	subi	rInLen,				0
	breq	ch_Padding
ch_xorBytesLoop:
	ld		rT1, 					Y+
	ld		rT2, 					Z
	eor		rT1, 					rT2
	st		Z+, 					rT1
	subi	rInLen,				1
	brne	ch_xorBytesLoop

ch_Padding:
	ldi		rT1,					1
	ld		rT2,					Z
	eor		rT1,					rT2
	st		Z,						rT1

	ldi		rZ,						cKeccakR_SizeInBytes-1
	add		rZ,						rpState
	mov		rZ+1,					rpState+1
	adc		rZ+1,					zero
	ld		rT1,					Z
	subi	rT1,					0x80
	st		Z,						rT1

	call  KeccakF

	//output 
	ldi		rT3,			 		crypto_hash_BYTES
	movw	rY, 					rpState
	pop		rZ+1																	; restore out pointer
	pop		rZ
outputLoop:
	ld		rT1,					Y+
	st		Z+, 					rT1
	dec		rT3
	brne  outputLoop


	//	Free state and pop registers
	ldi		rZ,						199
	add		rpState,			rZ
	adc		rpState+1,		zero
	in		r0,						0x3F
	cli         				
	out		sp+1, 				rpState+1
	out		sp,						rpState
	out		0x3F,					r0

	pop		r29
	pop		r28
	pop		r17
	pop		r16
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		r7
	pop		r6
	pop		r5
	pop		r4
	pop		r3
	pop		r2

	// return 0
	mov		r24, 					zero
	mov		r25, 					zero

	#undef	rInLen
	#undef	rT1
	#undef	rT2
	#undef	rT3
	#undef	sp				

	ret


//#define ROT_BIT(a)	 (a <= 4) ? ((a == 0) ? 0x80 : (a & 7)) : (0x80 | (8-a))

#define ROT_BIT(a)	 ((a) & 7)
#define ROT_BYTE(a)	 (((a)/8 + !!(((a)%8) > 4)) & 7)

KeccakF_RhoPiConstants:
	.BYTE	 ROT_BIT( 1), ROT_BYTE( 3),	10 * 8
	.BYTE	 ROT_BIT( 3), ROT_BYTE( 6),	 7 * 8
	.BYTE	 ROT_BIT( 6), ROT_BYTE(10),	11 * 8
	.BYTE	 ROT_BIT(10), ROT_BYTE(15),	17 * 8
	.BYTE	 ROT_BIT(15), ROT_BYTE(21),	18 * 8
	.BYTE	 ROT_BIT(21), ROT_BYTE(28),	 3 * 8
	.BYTE	 ROT_BIT(28), ROT_BYTE(36),	 5 * 8
	.BYTE	 ROT_BIT(36), ROT_BYTE(45),	16 * 8
	.BYTE	 ROT_BIT(45), ROT_BYTE(55),	 8 * 8
	.BYTE	 ROT_BIT(55), ROT_BYTE( 2),	21 * 8 
	.BYTE	 ROT_BIT( 2), ROT_BYTE(14),	24 * 8
	.BYTE	 ROT_BIT(14), ROT_BYTE(27),	 4 * 8
	.BYTE	 ROT_BIT(27), ROT_BYTE(41),	15 * 8
	.BYTE	 ROT_BIT(41), ROT_BYTE(56),	23 * 8
	.BYTE	 ROT_BIT(56), ROT_BYTE( 8),	19 * 8 
	.BYTE	 ROT_BIT( 8), ROT_BYTE(25),	13 * 8
	.BYTE	 ROT_BIT(25), ROT_BYTE(43),	12 * 8
	.BYTE	 ROT_BIT(43), ROT_BYTE(62),	 2 * 8
	.BYTE	 ROT_BIT(62), ROT_BYTE(18),	20 * 8
	.BYTE	 ROT_BIT(18), ROT_BYTE(39),	14 * 8
	.BYTE	 ROT_BIT(39), ROT_BYTE(61),	22 * 8
	.BYTE	 ROT_BIT(61), ROT_BYTE(20),	 9 * 8
	.BYTE	 ROT_BIT(20), ROT_BYTE(44),	 6 * 8
	.BYTE	 ROT_BIT(44), ROT_BYTE( 1),	 1 * 8


KeccakF_RoundConstants:
	.BYTE	   0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x82, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x8a, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x8b, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x81, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x09, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x8a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x09, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x0a, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x8b, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x8b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x89, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x03, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x0a, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x0a, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x81, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00
	.BYTE	   0x08, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.BYTE	   0xFF, 0		//terminator

	.text


 
// KeccakF
// Not callable from C!
//
// argument rpState is passed in r24:r25
//
KeccakF:

	//	Variables used in multiple operations
	#define	rTemp			2			// 8 regs (2-9)
	#define	rTempBis	10		// 8 regs (10-17)
	#define	rTempTer	18		// 2 regs (18-19)
	#define	pRound		20		// 2 regs (20-21)

	//	Initial Prepare Theta
	#define	TCIPx				rTempTer
	
	movw	rZ, 					rpState				// Z points to 5 C lanes
	sbiw	rZ,						40
	movw	rY,						rpState
	ldi		TCIPx,				5*8
KeccakInitialPrepTheta_Loop:
	ld		r0,						Y
	adiw	rY,						40
	ld		rTemp,				Y
	adiw	rY,						40
	eor		r0,						rTemp
	ld		rTemp,				Y
	adiw	rY,						40
	eor		r0,						rTemp
	ld		rTemp,				Y
	eor		r0,						rTemp
	ldd		rTemp,				Y+40
	eor		r0,						rTemp
	st		Z+, 					r0
	subi	rY,						119
	sbc		rY+1,					zero
	dec		TCIPx
	brne	KeccakInitialPrepTheta_Loop
	#undef	TCIPx

	ldi		pRound,				lo8(KeccakF_RoundConstants)
	ldi		pRound+1,			hi8(KeccakF_RoundConstants)
Keccak_RoundLoop:

	//	Theta
	#define	TCplus			rX
	#define	TCminus			rZ
	#define	TCcoordX		rTempTer
	#define	TCcoordY		rTempTer+1

	movw	TCminus,			rpState
	sbiw	TCminus,			1*8
	movw	TCplus,				rpState
	sbiw	TCplus,				4*8
	movw	rY,						rpState

	ldi		TCcoordX,			0x16
KeccakTheta_Loop1:
	ld		rTemp+0,			X+	
	ld		rTemp+1,			X+	
	ld		rTemp+2,			X+	
	ld		rTemp+3,			X+	
	ld		rTemp+4,			X+	
	ld		rTemp+5,			X+	
	ld		rTemp+6,			X+	
	ld		rTemp+7,			X+	

	lsl		rTemp+0
	rol		rTemp+1
	rol		rTemp+2
	rol		rTemp+3
	rol		rTemp+4
	rol		rTemp+5
	rol		rTemp+6
	rol		rTemp+7
	adc		rTemp+0, 			zero

	ld		r0,						Z+	
	eor		rTemp+0,			r0
	ld		r0,						Z+	
	eor		rTemp+1,			r0
	ld		r0,						Z+	
	eor		rTemp+2,			r0
	ld		r0,						Z+	
	eor		rTemp+3,			r0
	ld		r0,						Z+	
	eor		rTemp+4,			r0
	ld		r0,						Z+	
	eor		rTemp+5,			r0
	ld		r0,						Z+	
	eor		rTemp+6,			r0
	ld		r0,						Z+	
	eor		rTemp+7,			r0

	ldi		TCcoordY,			5
KeccakTheta_Loop2:
	ld		r0,						Y
	eor		r0, 					rTemp+0
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+1
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+2
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+3
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+4
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+5
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+6
	st		Y+, 					r0
	ld		r0,						Y
	eor		r0, 					rTemp+7
	st		Y+, 					r0
	adiw	rY, 					32

	dec		TCcoordY
	brne	KeccakTheta_Loop2

	subi	rY, 					200-8
	sbc		rY+1, 				zero

	lsr		TCcoordX
	brcc	1f
	breq	KeccakTheta_End
	rjmp	KeccakTheta_Loop1
1:	
	cpi		TCcoordX, 		0x0B
	brne	2f
	sbiw	TCminus, 			40
	rjmp	KeccakTheta_Loop1
2:
	sbiw	TCplus,				40
	rjmp	KeccakTheta_Loop1

KeccakTheta_End:	
	#undef	TCplus
	#undef	TCminus
	#undef	TCcoordX
	#undef	TCcoordY


	//	Rho Pi
	#define	RPindex			rTempTer+0
	#define	RPTemp			rTempTer+1

	sbiw	rY, 					32

	ld		rTemp+0,			Y+	
	ld		rTemp+1,			Y+	
	ld		rTemp+2,			Y+	
	ld		rTemp+3,			Y+	
	ld		rTemp+4,			Y+	
	ld		rTemp+5,			Y+	
	ld		rTemp+6,			Y+	
	ld		rTemp+7,			Y+	
	
	ldi		rZ,						lo8(KeccakF_RhoPiConstants)
	ldi		rZ+1,					hi8(KeccakF_RhoPiConstants)

KeccakRhoPi_Loop:
	;	do bit rotation
	lpm		RPTemp,				Z+		;get nuber of bits to rotate
	cpi		RPTemp,				5
	brcs	rotate64_nbit_leftOrNot
	neg		RPTemp
	andi	RPTemp,				3

rotate64_nbit_right:
	bst		rTemp, 				0
	ror		rTemp+7
	ror		rTemp+6
	ror		rTemp+5
	ror		rTemp+4
	ror		rTemp+3
	ror		rTemp+2
	ror		rTemp+1
	ror		rTemp
	bld		rTemp+7, 			7
	dec		RPTemp
	brne	rotate64_nbit_right
	rjmp	KeccakRhoPi_RhoBitRotateDone

rotate64_nbit_leftOrNot:
	tst		RPTemp
	breq	KeccakRhoPi_RhoBitRotateDone
rotate64_nbit_left:
	lsl		rTemp
	rol		rTemp+1
	rol		rTemp+2
	rol		rTemp+3
	rol 	rTemp+4
	rol		rTemp+5
	rol		rTemp+6
	rol		rTemp+7
	adc		rTemp, 				r1
	dec		RPTemp
	brne	rotate64_nbit_left

KeccakRhoPi_RhoBitRotateDone:
	lpm		r0,						Z+		;get number of bytes to rotate
	lpm		RPindex,			Z+		;get index in state
	movw	rY,						rpState
	add		rY,						RPindex
	adc		rY+1, 				zero
	
	ldi		rX,						rTempBis
	add		rX,						r0
	mov		rX+1,					zero
	ldi		RPTemp,				8
KeccakRhoPi_PiByteRotLoop:
	ld		r0,						Y+
	st		X+,						r0
	cpi		rX,						rTempBis+8
	brne	KeccakRhoPi_PiByteRotFirst
	ldi		rX,						rTempBis
KeccakRhoPi_PiByteRotFirst:
	dec		RPTemp
	brne	KeccakRhoPi_PiByteRotLoop

	sbiw	rY, 					8
	st		Y+,						rTemp+0
	st		Y+,						rTemp+1
	st		Y+,						rTemp+2
	st		Y+,						rTemp+3
	st		Y+,						rTemp+4
	st		Y+,						rTemp+5
	st		Y+,						rTemp+6
	st		Y+,						rTemp+7

	movw	rTemp+0,			rTempBis+0
	movw	rTemp+2,			rTempBis+2
	movw	rTemp+4,			rTempBis+4
	movw	rTemp+6,			rTempBis+6
KeccakRhoPi_RhoDone:
	subi	RPindex, 			8
	brne	KeccakRhoPi_Loop

	#undef	RPindex			
	#undef	RPTemp


	//	Chi Iota prepare Theta
	#define	CIPTa0			rTemp
	#define	CIPTa1			rTemp+1
	#define	CIPTa2			rTemp+2
	#define	CIPTa3			rTemp+3
	#define	CIPTa4			rTemp+4
	#define	CIPTc0			rTempBis
	#define	CIPTc1			rTempBis+1
	#define	CIPTc2			rTempBis+2
	#define	CIPTc3			rTempBis+3
	#define	CIPTc4			rTempBis+4
	#define	CIPTz				rTempBis+6
	#define	CIPTy				rTempBis+7

	movw	rY,						rpState
	movw	rX,			 			rpState			; 5 * C
	sbiw	rX,						40
	movw	rZ, 					pRound

	ldi		CIPTz,				8
KeccakChiIotaPrepareTheta_zLoop:
	mov		CIPTc0,				zero
	mov		CIPTc1,				zero
	movw	CIPTc2,				CIPTc0
	mov		CIPTc4,				zero

	ldi		CIPTy,				5
KeccakChiIotaPrepareTheta_yLoop:
	ld		CIPTa0,				Y
	ldd		CIPTa1,				Y+8
	ldd		CIPTa2,				Y+16
	ldd		CIPTa3,				Y+24
	ldd		CIPTa4,				Y+32
	
	;*p			= t = a0 ^ ((~a1) & a2); c0 ^= t;
	mov		r0, 					CIPTa1
	com		r0      			
	and		r0,						CIPTa2
	eor		r0,						CIPTa0
	eor		CIPTc0,				r0
	st		Y,  					r0
	
	;*(p+8)	= t = a1 ^ ((~a2) & a3); c1 ^= t;
	mov		r0, 					CIPTa2
	com		r0      			
	and		r0,						CIPTa3
	eor		r0,						CIPTa1
	eor		CIPTc1,				r0
	std		Y+8, 					r0

	;*(p+16) = a2 ^= ((~a3) & a4); c2 ^= a2;
	mov		r0, 					CIPTa3
	com		r0      			
	and		r0,						CIPTa4
	eor		r0,						CIPTa2
	eor		CIPTc2,				r0
	std		Y+16,					r0

	;*(p+24) = a3 ^= ((~a4) & a0); c3 ^= a3;
	mov		r0, 					CIPTa4
	com		r0      			
	and		r0,						CIPTa0
	eor		r0,						CIPTa3
	eor		CIPTc3,				r0
	std		Y+24,					r0

	;*(p+32) = a4 ^= ((~a0) & a1); c4 ^= a4;
	com		CIPTa0
	and		CIPTa0,				CIPTa1
	eor		CIPTa0,				CIPTa4
	eor		CIPTc4,				CIPTa0
	std		Y+32,					CIPTa0
	
	adiw	rY,						40	
	dec		CIPTy
	brne	KeccakChiIotaPrepareTheta_yLoop

	subi	rY,						200
	sbc		rY+1,					zero	

	lpm		r0, 					Z+		;Round Constant
	ld		CIPTa0,				Y
	eor		CIPTa0,				r0
	st		Y+,						CIPTa0
                			
	movw	pRound,				rZ
	movw	rZ,						rX
	eor		CIPTc0,				r0
	st		Z+,						CIPTc0	
	std		Z+7,					CIPTc1
	std		Z+15,					CIPTc2
	std		Z+23,					CIPTc3
	std		Z+31,					CIPTc4
	movw	rX,						rZ
	movw	rZ,						pRound

	dec		CIPTz
	brne	KeccakChiIotaPrepareTheta_zLoop

	#undef	CIPTa0
	#undef	CIPTa1
	#undef	CIPTa2
	#undef	CIPTa3
	#undef	CIPTa4
	#undef	CIPTc0
	#undef	CIPTc1
	#undef	CIPTc2
	#undef	CIPTc3
	#undef	CIPTc4
	#undef	CIPTz
	#undef	CIPTy


	;Check for terminator
	lpm		r0,						Z
	inc		r0					
	breq	Keccak_Done
	rjmp	Keccak_RoundLoop
Keccak_Done:
	ret

	#undef	rTemp			
	#undef	rTempBis	
	#undef	rTempTer
	#undef	pRound		

	#undef	rpState		
	#undef	zero			
	#undef	rX				
	#undef	rY				
	#undef	rZ				
