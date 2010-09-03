;
; luffa512_avr.s              
; Version 2.0 (Sep 15th 2009)
;
; CPU TYPE  :ATmega8515
;
; Copyright (C) 2008-2009 Hitachi, Ltd. All rights reserved.
;
; Hitachi, Ltd. is the owner of this software and hereby grant
; the U.S. Government and any interested party the right to use
; this software for the purposes of the SHA-3 evaluation process,
; notwithstanding that this software is copyrighted.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


.MACRO	PERMQSTEP
	ldi	r18,0xff
	ldi	r16,4
	;32bit unit loop
loop32_1:
	ld	r0,Y
	ldd	r1,Y+4
	ldd	r2,Y+8
	ldd	r3,Y+12
	rcall SUBCRUMB
	std	Y+12,r3
	std	Y+8,r2
	std	Y+4,r1
	st	Y+,r4
	dec	r16
	brne loop32_1

	adiw r28,12
	ldi	r16,4
	;32bit unit loop
loop32_2:
	ld	r3,Y
	ldd	r0,Y+4
	ldd	r1,Y+8
	ldd	r2,Y+12
	rcall SUBCRUMB
	std	Y+12,r2
	std	Y+8,r1
	std	Y+4,r4
	st	Y+,r3
	dec	r16
	brne loop32_2

	sbiw r28,20
	ldi	r16,4
	loopMW:
	ld	r18,Y
	ldd	r0,Y+1
	ldd	r1,Y+2
	ldd	r19,Y+3
	ldd	r26,Y+16
	ldd	r2,Y+17
	ldd	r3,Y+18
	ldd	r27,Y+19
	MIXWORD	r18,r0,r1,r19,r26,r2,r3,r27
	std	Y+16,r3
	st	Y+,r0
	std	Y+16,r27
	st	Y+,r1
	std	Y+16,r26
	st	Y+,r19
	std	Y+16,r2
	st	Y+,r18
	dec	r16
	breq loopMW_e
	rjmp loopMW
loopMW_e:
	sbiw r28,16
	ldi	r16,2
;assume that constants c[8] are contained in r6,..,r13.
loopCNS:
	CNSUPDATE r6,r7,r8,r9,r10,r11,r12,r13,r18
	ld	r0,Y
	eor	r0,r10
	st	Y+,r0
	ld	r0,Y
	eor	r0,r11
	st	Y+,r0
	ld	r0,Y
	eor	r0,r12
	st	Y+,r0
	ld	r0,Y
	eor	r0,r13
	st	Y+,r0

	adiw r28,12
	dec	r16
	brne loopCNS
	sbiw r28,32
.ENDM

;a0,..,a3,b0,..,b3->a1,a2,a3,a0,b2,b3,b0,b1
.MACRO	MIXWORD	p0,p1,p2,p3,p4,p5,p6,p7
	eor	\p4,\p0
	eor	\p5,\p1
	eor	\p6,\p2
	eor	\p7,\p3
	lsl	\p3
	rol	\p2
	rol	\p1
	rol	\p0
	brcc NOC1
	ori	\p3,0x01
NOC1:
	lsl	\p3
	rol	\p2
	rol	\p1
	rol	\p0
	brcc NOC2
	ori	\p3,0x01
NOC2:
	eor	\p0,\p4
	eor	\p1,\p5
	eor	\p2,\p6
	eor	\p3,\p7
	lsr	\p4
	ror	\p5
	ror	\p6
	ror	\p7
	brcc NOC3
	ori	\p4,0x80
NOC3:
	lsr	\p4
	ror	\p5
	ror	\p6
	ror	\p7
	brcc NOC4
	ori	\p4,0x80
NOC4:
	eor	\p6,\p0
	eor	\p7,\p1
	eor	\p4,\p2
	eor	\p5,\p3
	lsl	\p3
	rol	\p2
	rol	\p1
	rol	\p0
	brcc NOC5
	ori	\p3,0x01
NOC5:
	lsl	\p3
	rol	\p2
	rol	\p1
	rol	\p0
	brcc NOC6
	ori	\p3,0x01
NOC6:
	eor	\p0,\p5
	eor	\p1,\p6
	eor	\p2,\p7
	eor	\p3,\p4
	lsl	\p7
	rol	\p6
	rol	\p5
	rol	\p4
	brcc NOC7
	ori	\p7,0x01
NOC7:
.ENDM

.MACRO CNSUPDATE p0,p1,p2,p3,p4,p5,p6,p7,p8
	lsl	\p7
	rol	\p6
	rol	\p5
	rol	\p4
	rol	\p3
	rol	\p2
	rol	\p1
	rol	\p0
	brcc MOVCNS
	ldi	\p8,0xc4
	eor	\p0,\p8
	ldi	\p8,0xd6
	eor	\p1,\p8
	ldi	\p8,0x49
	eor	\p2,\p8
	ldi	\p8,0x6c
	eor	\p3,\p8
	ldi	\p8,0x55
	eor	\p4,\p8
	ldi	\p8,0xc6
	eor	\p5,\p8
	ldi	\p8,0x1c
	eor	\p6,\p8
	ldi	\p8,0x8d
	eor	\p7,\p8
MOVCNS:
	movw \p8,\p0
	movw \p0,\p4
	movw \p4,\p8
	movw \p8,\p2
	movw \p2,\p6
	movw \p6,\p8
.ENDM


.section .text
;Luffa-512 hash function
.global luffa512
.func luffa512  ;r25,r24 : pointer of data
				;r23,r22 : data byte length
				;r21,r20 : pointer of hashval
luffa512:
	push r2
	push r3
	push r4
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r16
	push r17
	push r28
	push r29

	ldi	r31,hi8(IV)			; Z:IV
	ldi	r30,lo8(IV)
	ldi	r27,hi8(chain1)		; X:chain1
	ldi	r26,lo8(chain1)
	ldi	r16,160
loopIV:
	lpm	r17,Z+
	st	X+,r17
	dec	r16
	brne loopIV	

loopROUND:
	cpi	r23,0			; check data byte length
	brne ROUND
	cpi	r22,32
	brlo LASTMSG
ROUND:					; if ((data byte length) >= 32)
	; Message Injection Function
	rcall FUNCXORH

	movw r26,r24		; X:data
	ldi	r16,32
loopMSG1:
	ld	r0,X+
	st	Z+,r0			; Z:tmp
	dec	r16
	brne loopMSG1

	rcall FUNCXORM

	; Step Function
	push r24
	rcall luffa512_step
	pop	r24
	
	; sub 32 bytes from data byte length
	subi r22,32
	brcc endSUB
	subi r23,1
endSUB:

	adiw r24,32		; add 32 bytes to address of data
	rjmp loopROUND

LASTMSG:
	; Message Injection Function
	rcall FUNCXORH

	; process last message 
	ldi	r16,0x80
	ldi	r17,31
	tst	r22
	breq ADDPAD
	sub	r17,r22
	
	movw r26,r24		; X:data
loopMSG2:
	ld	r0,X+
	st	Z+,r0			; Z:tmp
	dec	r22
	brne loopMSG2
ADDPAD:
	st	Z+,r16

ZEROPAD:				; zero padding
	tst	r17
	breq ENDPAD
	clr	r0
loopZEROPAD:
	st	Z+,r0
	dec	r17
	brne loopZEROPAD
ENDPAD:

	rcall FUNCXORM
	rcall luffa512_step

	; blank round
	rcall FUNCXORH
	rcall luffa512_step

	movw r26,r20		; X:hashval
	rcall XOR256BLOCK

	; blank round
	rcall FUNCXORH
	rcall luffa512_step
	
	movw r26,r20
	adiw r26,32			; X:hashval+32
	rcall XOR256BLOCK

	clr	r1
	pop	r29
	pop	r28
	pop	r17
	pop	r16
	pop	r13
	pop	r12
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	pop	r7
	pop	r6
	pop	r4
	pop	r3
	pop	r2
	ret
.endfunc

;XORs all 256-bit blocks
; r27:r26 : output address
.func XOR256BLOCK
XOR256BLOCK:
	ldi	r29,hi8(chain1)	; Y:chain1
	ldi	r28,lo8(chain1)
	ldi	r31,hi8(chain3)	; Z:chain3
	ldi	r30,lo8(chain3)
	ldi	r16,32
loopXOR256BLOCK:
	ldd	r1,Y+32
	ld	r0,Y+
	ldd	r3,Z+32
	ld	r2,Z+
	ldd	r4,Z+63
	eor	r0,r1
	eor	r0,r2
	eor	r0,r3
	eor	r0,r4
	st	X+,r0
	dec	r16
	brne loopXOR256BLOCK
	ret
.endfunc

;Luffa-512 Step Function
.func luffa512_step
luffa512_step:
	; Tweaks
	ldi	r29,hi8(chain5+32)	; Y:chain5+32
	ldi	r28,lo8(chain5+32)
	rcall ROTL1
	adiw r28,16				; Y:chain5+32
	rcall ROTL1
	adiw r28,16				; Y:chain5+32
	rcall ROTL1
	adiw r28,16				; Y:chain5+32
	rcall ROTL1
	sbiw r28,16				; Y:chain4+32
	rcall ROTL1
	adiw r28,16				; Y:chain4+32
	rcall ROTL1
	adiw r28,16				; Y:chain4+32
	rcall ROTL1
	sbiw r28,16				; Y:chain3+32
	rcall ROTL1
	adiw r28,16				; Y:chain3+32
	rcall ROTL1
	sbiw r28,16				; Y:chain2+32
	rcall ROTL1

	ldi	r31,hi8(CNS)		; Z:CNS
	ldi	r30,lo8(CNS)
	ldi	r29,hi8(chain1)		; Y:chain1
	ldi	r28,lo8(chain1)

	ldi	r24,5
loopPERM:
	lpm	r6,Z+
	lpm	r7,Z+
	lpm	r8,Z+
	lpm	r9,Z+
	lpm	r10,Z+
	lpm	r11,Z+
	lpm	r12,Z+
	lpm	r13,Z+
	rcall FUNCPERM
	adiw r28,32
	dec	r24
	brne loopPERM
	ret
.endfunc

.func FUNCXORH
FUNCXORH:
	ldi	r27,hi8(tmp)	; X:tmp
	ldi	r26,lo8(tmp)
	rcall XOR256BLOCK

	movw r28,r26
	rcall MULT2

	ldi	r29,hi8(chain1+32)	; Y:chain1+32
	ldi	r28,lo8(chain1+32)

	ldi	r16,32
loopMIH_2:
	ld	r17,-X		; X:tmp+32
	ld	r0,-Y
	ldd	r1,Y+32
	ldd r4,Z+63		
	eor	r4,r17
	std	Z+63,r4
	ld	r2,-Z		; Z:chain3+32 
	ldd	r3,Z+32
	eor	r0,r17
	eor	r1,r17
	eor	r2,r17
	eor	r3,r17
	st	Y,r0
	std	Y+32,r1
	st	Z,r2
	std	Z+32,r3
	st	X,r0
	dec	r16
	brne loopMIH_2

	sbiw r30,32				; Z:chain2
	ldi	r29,hi8(chain1+32)	; Y:chain1+32
	ldi	r28,lo8(chain1+32)

	ldi	r17,4
loopMIH_3:
	rcall MULT2
	rcall XOR32
	adiw r28,32
	dec	r17
	brne loopMIH_3
	
	rcall MULT2
	adiw r28,32
	ldi	r31,hi8(tmp+32)		; Z:tmp+32
	ldi	r30,lo8(tmp+32)
	rcall XOR32_r

	ldi	r16,32
loopMIH_4:
	ld	r0,Y+
	st	Z+,r0
	dec	r16
brne	loopMIH_4

	ldi	r31,hi8(chain4+32)	; Z:chain3+32
	ldi	r30,lo8(chain4+32)

	ldi	r17,4
loopMIH_5:
	rcall MULT2
	adiw r28,32
	rcall XOR32_r
	dec	r17
	brne loopMIH_5
	
	rcall MULT2
	adiw r28,32
	ldi	r31,hi8(tmp+32)		; Z:tmp+32
	ldi	r30,lo8(tmp+32)
	rcall XOR32_r
	ret
.endfunc

.func XOR32
XOR32:
	ldi	r16,32
XOR32_1:
	ld	r0,Y
	ld	r1,Z+
	eor	r0,r1
	st	Y+,r0
	dec	r16
	brne XOR32_1
	ret
.endfunc

.func XOR32_r
XOR32_r:
	ldi	r16,32
XOR32_r_1:
	ld	r0,-Y
	ld	r1,-Z
	eor	r0,r1
	st	Y,r0
	dec	r16
	brne XOR32_r_1
	ret
.endfunc

.func MULT2
MULT2:
	ld	r1,-Y
	ld	r2,-Y
	ld	r3,-Y
	ld	r4,-Y
	ldi	r16,28
MULT2_1:
	ld	r0,-Y
	std	Y+4,r0
	dec	r16
	brne MULT2_1
	st	Y+,r4
	st	Y+,r3
	st	Y+,r2
	st	Y+,r1

	ldi	r16,4
MULT2_2:
	ld	r4,-Y
	ldd	r1,Y+4
	ldd	r2,Y+12
	ldd	r3,Y+16
	eor	r1,r4
	eor	r2,r4
	eor	r3,r4
	std	Y+4,r1
	std	Y+12,r2
	std	Y+16,r3
	dec	r16
	brne MULT2_2
	ret
.endfunc

;function of insertion of a message
.func FUNCXORM
FUNCXORM:
	movw r26,r28		; X:chain1
	ldi	r29,hi8(tmp)	; Y:tmp
	ldi	r28,lo8(tmp)

	ldi	r17,5
loopMIM_1:
	ldi	r16,32
XOR32_X_1:
	ld	r0,X
	ld	r1,Y+
	eor	r0,r1
	st	X+,r0
	dec	r16
	brne XOR32_X_1
	dec	r17
	breq loopMIM_1_e
	rcall MULT2
	rjmp loopMIM_1
loopMIM_1_e:
	ret
.endfunc

.func ROTL1
ROTL1:
	ldi	r16,4
ROTL1_1:
	ld	r17,-Y
	ld	r2,-Y
	ld	r1,-Y
	ld	r0,-Y
	lsl	r17
	rol	r2
	rol	r1
	rol	r0
	brcc NOCARRY
	ori	r17,1
NOCARRY:
	st	Y,r0
	std	Y+1,r1
	std	Y+2,r2
	std	Y+3,r17
	dec	r16
	brne ROTL1_1
	ret
.endfunc

;function of permutation
.func FUNCPERM
FUNCPERM:
	ldi	r17,8
loopSTEP:
	PERMQSTEP
	dec	r17
	breq loopSTEP_e
	rjmp loopSTEP
loopSTEP_e:
	ret
.endfunc

.func SUBCRUMB
SUBCRUMB:	;(r0,r1,r2,r3) -> (r4,r1,r2,r3), 0xff is set to r18
	mov	r4,r0
	or	r0,r1
	eor	r2,r3
	eor	r1,r18
	eor	r0,r3
	and	r3,r4
	eor	r1,r3
	eor	r3,r2
	and	r2,r0
	eor	r0,r18
	eor	r2,r1
	or	r1,r3
	eor	r4,r1
	eor	r3,r2
	and	r2,r1
	eor	r1,r0
	ret
.endfunc

IV:
.byte	0x6d,0x25,0x1e,0x69,0x44,0xb0,0x51,0xe0
.byte	0x4e,0xaa,0x6f,0xb4,0xdb,0xf7,0x84,0x65
.byte	0x6e,0x29,0x20,0x11,0x90,0x15,0x2d,0xf4
.byte	0xee,0x05,0x81,0x39,0xde,0xf6,0x10,0xbb
.byte	0xc3,0xb4,0x4b,0x95,0xd9,0xd2,0xf2,0x56
.byte	0x70,0xee,0xe9,0xa0,0xde,0x09,0x9f,0xa3
.byte	0x5d,0x9b,0x05,0x57,0x8f,0xc9,0x44,0xb3
.byte	0xcf,0x1c,0xcf,0x0e,0x74,0x6c,0xd5,0x81
.byte	0xf7,0xef,0xc8,0x9d,0x5d,0xba,0x57,0x81
.byte	0x04,0x01,0x6c,0xe5,0xad,0x65,0x9c,0x05
.byte	0x03,0x06,0x19,0x4f,0x66,0x6d,0x18,0x36
.byte	0x24,0xaa,0x23,0x0a,0x8b,0x26,0x4a,0xe7
.byte	0x85,0x80,0x75,0xd5,0x36,0xd7,0x9c,0xce
.byte	0xe5,0x71,0xf7,0xd7,0x20,0x4b,0x1f,0x67
.byte	0x35,0x87,0x0c,0x6a,0x57,0xe9,0xe9,0x23
.byte	0x14,0xbc,0xb8,0x08,0x7c,0xde,0x72,0xce
.byte	0x6c,0x68,0xe9,0xbe,0x5e,0xc4,0x1e,0x22
.byte	0xc8,0x25,0xb7,0xc7,0xaf,0xfb,0x43,0x63
.byte	0xf5,0xdf,0x39,0x99,0x0f,0xc6,0x88,0xf1
.byte	0xb0,0x72,0x24,0xcc,0x03,0xe8,0x6c,0xea

CNS:
.byte	0x18,0x1c,0xca,0x53,0x38,0x0c,0xde,0x06
.byte	0x5b,0x6f,0x08,0x76,0xf1,0x6f,0x85,0x94
.byte	0x7e,0x10,0x6c,0xe9,0x38,0x97,0x9c,0xb0
.byte	0xbb,0x62,0xf3,0x64,0x92,0xe9,0x3c,0x29
.byte	0x9a,0x02,0x50,0x47,0xcf,0xf2,0xa9,0x40

.section .bss
chain1:
.space	32
chain2:
.space	32
chain3:
.space	32
chain4:
.space	32
chain5:
.space	32
tmp:
.space	32
