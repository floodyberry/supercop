/*
File: AVR8-rotate64.s

This code is originally by Daniel Otte (daniel.otte@rub.de) in 2006-2010 as part of the AVR-Crypto-Lib, and was then improved by Ronny Van Keer, STMicroelectronics, in 2010. 

Implementation by Daniel Otte and Ronny Van Keer,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

.global rotate64_1bit_left
rotate64_4bit_left:
	lsl r18
	rol r19
	rol r20
	rol r21
	rol r22
	rol r23
	rol r24
	rol r25
	adc r18, r1
rotate64_3bit_left:
	lsl r18
	rol r19
	rol r20
	rol r21
	rol r22
	rol r23
	rol r24
	rol r25
	adc r18, r1
rotate64_2bit_left:
	lsl r18
	rol r19
	rol r20
	rol r21
	rol r22
	rol r23
	rol r24
	rol r25
	adc r18, r1
rotate64_1bit_left:
	lsl r18
	rol r19
	rol r20
	rol r21
	rol r22
	rol r23
	rol r24
	rol r25
	adc r18, r1
	ret

.global rotate64_1bit_right
rotate64_3bit_right:
	bst r18, 0
	ror r25
	ror r24
	ror r23
	ror r22
	ror r21
	ror r20
	ror r19
	ror r18
	bld r25, 7
rotate64_2bit_right:
	bst r18, 0
	ror r25
	ror r24
	ror r23
	ror r22
	ror r21
	ror r20
	ror r19
	ror r18
	bld r25, 7
rotate64_1bit_right:
	bst r18, 0
	ror r25
	ror r24
	ror r23
	ror r22
	ror r21
	ror r20
	ror r19
	ror r18
	bld r25, 7
	ret

/*
**	Each byte rotate routine must be 16 instructions long.
*/
rotate64_0byte_left:
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)
	ldi r31, pm_hi8(bit_rot_jmp_table)
	add r30, r16

	adc r31, r1
	ijmp
	nop
	nop

	nop
	nop
	nop
	nop

	nop
	nop
	nop
	nop

rotate64_1byte_left:
	mov r0, r25
	mov r25, r24
	mov r24, r23
	mov r23, r22

	mov r22, r21
	mov r21, r20
	mov r20, r19
	mov r19, r18

	mov r18, r0
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)
	ldi r31, pm_hi8(bit_rot_jmp_table)

	add r30, r16
	adc r31, r1
	ijmp
	nop

rotate64_2byte_left:
	movw r0, r24
	movw r24, r22
	movw r22, r20
	movw r20, r18

	movw r18, r0
	clr r1
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)

	ldi r31, pm_hi8(bit_rot_jmp_table)
	add r30, r16
	adc r31, r1
	ijmp

	nop
	nop
	nop
	nop

rotate64_3byte_left:
	mov r0, r25
	mov r25, r22
	mov r22, r19
	mov r19, r24

	mov r24, r21
	mov r21, r18
	mov r18, r23
	mov r23, r20

	mov r20, r0
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)
	ldi r31, pm_hi8(bit_rot_jmp_table)

	add r30, r16
	adc r31, r1
	ijmp
	nop

rotate64_4byte_left:
	movw r0, r24
	movw r24, r20
	movw r20, r0
	movw r0, r22

	movw r22, r18
	movw r18, r0
	clr r1
	andi r16, 0x07

	ldi r30, pm_lo8(bit_rot_jmp_table)
	ldi r31, pm_hi8(bit_rot_jmp_table)
	add r30, r16
	adc r31, r1

	ijmp
	nop
	nop
	nop

rotate64_5byte_left:
	mov r0, r25
	mov r25, r20
	mov r20, r23
	mov r23, r18

	mov r18, r21
	mov r21, r24
	mov r24, r19
	mov r19, r22

	mov r22, r0
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)
	ldi r31, pm_hi8(bit_rot_jmp_table)

	add r30, r16
	adc r31, r1
	ijmp
	nop

rotate64_6byte_left:
	movw r0, r18
	movw r18, r20
	movw r20, r22
	movw r22, r24

	movw r24, r0
	clr r1
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)

	ldi r31, pm_hi8(bit_rot_jmp_table)
	add r30, r16
	adc r31, r1
	ijmp

	nop
	nop
	nop
	nop

rotate64_7byte_left:
	mov r0, r18
	mov r18, r19
	mov r19, r20
	mov r20, r21

	mov r21, r22
	mov r22, r23
	mov r23, r24
	mov r24, r25

	mov r25, r0
	andi r16, 0x07
	ldi r30, pm_lo8(bit_rot_jmp_table)
	ldi r31, pm_hi8(bit_rot_jmp_table)

	add r30, r16
	adc r31, r1
	ijmp
	nop


bit_rot_jmp_table:
	ret
	rjmp rotate64_1bit_left
	rjmp rotate64_2bit_left
	rjmp rotate64_3bit_left
	rjmp rotate64_4bit_left
	rjmp rotate64_3bit_right
	rjmp rotate64_2bit_right
	rjmp rotate64_1bit_right

.global rotate64left_code
rotate64left_code:
	ldi r30, pm_lo8(rotate64_0byte_left)
	ldi r31, pm_hi8(rotate64_0byte_left)
	mov r0, r16
	andi r16, 0x70
	add r30, r16
	adc r31, r1
	mov r16, r0
	ijmp
	