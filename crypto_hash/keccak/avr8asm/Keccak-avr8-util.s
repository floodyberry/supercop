/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
Implementation by Ronny Van Keer, STMicroelectronics

This code, originally by Ronny Van Keer, is hereby put in the public domain.
It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

/*
 * const void * xorBytes( void * dest, const void * src, unsigned char n );
 *
 * param dest is passed in r24:r25
 * param src  is passed in r22:r23
 * param n    is passed in r20
 */
.global xorBytes
xorBytes:
	movw	r30, r24
	movw	r26, r22

	lsr 	r20
	brcc	xorBytes2
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
xorBytes2:
	lsr		r20
	brcc	xorBytes4
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
xorBytes4:
	lsr		r20
	brcc	xorBytes8
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22

	subi	r20,0
xorBytes8:
	brne	xorLanesLoop
	movw	r24, r26
	ret



/*
 * const void *  xorLanes( void * dest, const void * src, unsigned char n );
 *
 * param dest is passed in r24:r25
 * param src  is passed in r22:r23
 * param n    is passed in r20		No check if n is zero
 */
.global xorLanes
xorLanes:
	movw	r30, r24
	movw	r26, r22
xorLanesLoop:
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22
	ld		r22, X+
	ld		r23, Z
	eor		r22, r23
	st		Z+, r22

	subi	r20, 1
	brne	xorLanesLoop
	movw	r24, r26
	ret
