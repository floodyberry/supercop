/*
 * luffa512_x64asm.s
 * Luffa Specification Version 2.0.1 (Oct 2nd 2009)
 *
 * Implementation of Luffa-512: Oliveira, Lopez approach
 * Method: Perfect Shuffle
 * Programmed by Hitachi Ltd.
 * 
 *
 * Copyright (C) 2008-2010 Hitachi, Ltd. All rights reserved.
 *
 * Hitachi, Ltd. is the owner of this software and hereby grant
 * the U.S. Government and any interested party the right to use
 * this software for the purposes of the SHA-3 evaluation process,
 * notwithstanding that this software is copyrighted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

.intel_syntax

	.macro	ROUND	r0,r1,r2,r3,r4,r5,r6,r7,u0,u1,t0,t1,t2,t3,t4,t5,pt,msg
	MI_IS	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,\pt
	movdqu	\r0,XMMWORD PTR [\msg+0]
	movdqu	\r4,XMMWORD PTR [\msg+16]
	MI_MSG	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\pt
	PERM	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,\pt
	.endm

	.macro	ROUND_BLANK	r0,r1,r2,r3,r4,r5,r6,r7,u0,u1,t0,t1,t2,t3,t4,t5,pt
	MI_IS	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,\pt
	pxor	\r0,\r0
	movdqa	\r4,\r0
	MI_MSG	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\pt
	PERM	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,\pt
	.endm

	.macro	OUTPUT1 m0,m1,m2,m3,m4,m5,m6,m7,u0,u1,t0,t1,t2,t3,t4,t5,rout,pt
	movdqa \t0,\m0
	movdqa \t1,\m1
	movdqa \t2,\m2
	movdqa \t3,\m3
	UNCONV_FMT	\t0,\t1,\t2,\t3,\t4,\t5
	pxor	\t0,\u0
	pxor	\t0,\t1
	pxor	\t0,\t2
	pxor	\t0,\t3
	movdqa	XMMWORD PTR [\pt], \t0
	movdqa \t0,\m4
	movdqa \t1,\m5
	movdqa \t2,\m6
	movdqa \t3,\m7
	UNCONV_FMT	\t0,\t1,\t2,\t3,\t4,\t5
	pxor	\t1,\u1
	pxor	\t1,\t0
	pxor	\t1,\t2
	pxor	\t1,\t3
	movdqa	\t0, XMMWORD PTR [\pt]
	movdqa	XMMWORD PTR [\pt], \u0
	movdqa	XMMWORD PTR [\pt+16], \u1
	UNPSHFL	\t0,\t1,\t2,\t3,\t4,\t5,\u0,\u1
	movdqa	XMMWORD PTR [\rout], \t0
	movdqa	XMMWORD PTR [\rout+16], \t1
	.endm

	.macro	OUTPUT2 m0,m1,m2,m3,m4,m5,m6,m7,u0,u1,t0,t1,rout,pt
	UNCONV_FMT	\m0,\m1,\m2,\m3,\t0,\t1
	UNCONV_FMT	\m4,\m5,\m6,\m7,\t0,\t1
	pxor	\m0,\m1
	pxor	\m4,\m5
	pxor	\m0,\m2
	pxor	\m4,\m6
	pxor	\m0,\m3
	pxor	\m4,\m7
	pxor	\m0,\u0
	pxor	\m4,\u1
	UNPSHFL	\m0,\m4,\m1,\m2,\m3,\m5,\t0,\t1
	movdqa	XMMWORD PTR [\rout+32], \m0
	movdqa	XMMWORD PTR [\rout+48], \m4
	.endm

	.macro	PSHFL m0,m1,t0,t1
	pshufhw	\m0,\m0,0xd8
	pshuflw	\m0,\m0,0xd8
	pshufb	\m0, XMMWORD PTR psmask[0]

	pshufhw	\m1,\m1,0xd8
	pshuflw	\m1,\m1,0xd8
	pshufb	\m1, XMMWORD PTR psmask[0]
	SHFL_PART \m0,\m1,\t0,\t1, 4,psmask[16]
	SHFL_PART \m0,\m1,\t0,\t1, 2,psmask[32]
	SHFL_PART \m0,\m1,\t0,\t1, 1,mask22[0]

	pshufd	\m0,\m0,0xd8
	pshufhw	\m0,\m0,0xd8
	pshuflw	\m0,\m0,0xd8
	pshufb	\m0, XMMWORD PTR psmask[0]

	pshufd	\m1,\m1,0xd8
	pshufhw	\m1,\m1,0xd8
	pshuflw	\m1,\m1,0xd8
	pshufb	\m1, XMMWORD PTR psmask[0]
	SHFL_PART \m0,\m1,\t0,\t1, 4,psmask[16]
	SHFL_PART \m0,\m1,\t0,\t1, 2,psmask[32]
	.endm

	.macro	SHFL_PART m0,m1,t0,t1,sh,r
	movdqa	\t0, \m0
	psrlq	\t0, \sh
	pxor	\t0, \m0
	pand	\t0, XMMWORD PTR \r
	pxor	\m0, \t0
	psllq	\t0, \sh
	pxor	\m0, \t0

	movdqa	\t1, \m1
	psrlq	\t1, \sh
	pxor	\t1, \m1
	pand	\t1, XMMWORD PTR \r
	pxor	\m1, \t1
	psllq	\t1, \sh
	pxor	\m1, \t1
	.endm

	.macro	UNPSHFL m0,m1,t0,t1,r0,r1,r2,r3
	movdqa	\r0, XMMWORD PTR psmask[0]
	SHFL_PART \m0,\m1,\t0,\t1, 2,psmask[32]
	SHFL_PART \m0,\m1,\t0,\t1, 4,psmask[16]
	pshufb	\m0,\r0
	pshufb	\m1,\r0
	pshufhw	\m0,\m0,0xd8
	pshufhw	\m1,\m1,0xd8
	pshuflw	\m0,\m0,0xd8
	pshuflw	\m1,\m1,0xd8
	pshufd	\m0,\m0,0xd8
	pshufd	\m1,\m1,0xd8
	SHFL_PART \m0,\m1,\t0,\t1, 1,mask22[0]
	SHFL_PART \m0,\m1,\t0,\t1, 2,psmask[32]
	SHFL_PART \m0,\m1,\t0,\t1, 4,psmask[16]
	pshufb	\m0,\r0
	pshufb	\m1,\r0
	pshufhw	\m0,\m0,0xd8
	pshufhw	\m1,\m1,0xd8
	pshuflw	\m0,\m0,0xd8
	pshuflw	\m1,\m1,0xd8
	.endm

	.macro	MULT2_1 m0,m1,t0,t1,r0
	movdqa	\t0,\m0
	movdqa	\t1,\m1
	pand	\t0,\r0
	pand	\t1,\r0
	pxor	\m0,\t0
	pxor	\m1,\t1
	pslld	\m0,1
	pslld	\m1,1
	psrld	\t0,3
	pxor	\m1,\t0
	pxor	\m0,\t1
	psrld	\t1,2
	pxor	\m0,\t1
	psrld	\t1,1
	pxor	\m1,\t1
	pxor	\m0,\t1
	.endm

	.macro	CONV_FMT r0,r1,r2,r3,t0,t1
	movdqa	\t1,\r1
	movdqa	\t0,\r0
	pand	\t1,XMMWORD PTR mask55[0]
	pand	\t0,XMMWORD PTR maskaa[0]
	pand	\r0,XMMWORD PTR mask55[0]
	pand	\r1,XMMWORD PTR maskaa[0]
	pslld	\t1,1
	psrld	\t0,1
	por		\r0,\t1
	por		\r1,\t0

	movdqa	\t1,\r3
	movdqa	\t0,\r2
	pand	\t1,XMMWORD PTR mask55[0]
	pand	\t0,XMMWORD PTR maskaa[0]
	pand	\r2,XMMWORD PTR mask55[0]
	pand	\r3,XMMWORD PTR maskaa[0]
	pslld	\t1,1
	psrld	\t0,1
	por		\r2,\t1
	por		\r3,\t0

	movdqa	\t1,\r2
	movdqa	\t0,\r0
	pand	\t1,XMMWORD PTR mask33[0]
	pand	\t0,XMMWORD PTR maskcc[0]
	pand	\r0,XMMWORD PTR mask33[0]
	pand	\r2,XMMWORD PTR maskcc[0]
	pslld	\t1,2
	psrld	\t0,2
	por		\r0,\t1
	por		\r2,\t0

	movdqa	\t1,\r3
	movdqa	\t0,\r1
	pand	\t1,XMMWORD PTR mask33[0]
	pand	\r1,XMMWORD PTR mask33[0]
	pxor	\t0,\r1
	pxor	\r3,\t1
	pslld	\t1,2
	psrld	\t0,2
	por		\r1,\t1
	por		\r3,\t0
	.endm

	.macro	UNCONV_FMT	r0,r1,r2,r3,t0,t1
	movdqa	\t0,\r0
	movdqa	\t1,\r1
	pand	\r0,mask55
	psrld	\t0,1
	pand	\r1,maskaa
	pslld	\t1,1
	pand	\t0,mask55
	pand	\t1,maskaa
	por		\r1,\t0
	por		\r0,\t1

	movdqa	\t0,\r2
	movdqa	\t1,\r3
	pand	\r2,mask55
	psrld	\t0,1
	pand	\r3,maskaa
	pslld	\t1,1
	pand	\t0,mask55
	pand	\t1,maskaa
	por		\r3,\t0
	por		\r2,\t1

	movdqa	\t0,\r0
	movdqa	\t1,\r2
	pand	\r0,mask33
	psrld	\t0,2
	pand	\r2,maskcc
	pslld	\t1,2
	pand	\t0,mask33
	pand	\t1,maskcc
	por		\r2,\t0
	por		\r0,\t1

	movdqa	\t0,\r1
	movdqa	\t1,\r3
	pand	\r1,mask33
	psrld	\t0,2
	pand	\r3,maskcc
	pslld	\t1,2
	pand	\t0,mask33
	pand	\t1,maskcc
	por		\r3,\t0
	por		\r1,\t1
	.endm

	.macro	MI_IS	r0,r1,r2,r3,r4,r5,r6,r7,u0,u1,t0,t1,t2,s0,s1,s2,pt
	UNCONV_FMT	\r0,\r1,\r2,\r3,\t0,\t1
	movdqa	\s0,\u0
	pxor	\s0,\r0
	pxor	\s0,\r2
	pxor	\s0,\r3
	pxor	\s0,\r1
	UNCONV_FMT	\r4,\r5,\r6,\r7,\t0,\t1
	movdqa	\s1,\u1
	pxor	\s1,\r4
	pxor	\s1,\r6
	movdqa	\t2,XMMWORD PTR mult2mask[0]
	pxor	\s1,\r7
	pxor	\s1,\r5
	MULT2_1	\s0,\s1,\t0,\t1,\t2
	pxor	\r0,\s0
	pxor	\r4,\s1
	pxor	\r1,\s0
	pxor	\r5,\s1
	movdqa	XMMWORD PTR [\pt+0], \r0
	movdqa	XMMWORD PTR [\pt+16], \r4
	pxor	\r2,\s0
	pxor	\r6,\s1
	pxor	\r3,\s0
	pxor	\r7,\s1
	movdqa	\s2,\r0
	pxor	\u0,\s0
	pxor	\u1,\s1
	movdqa	\s0,\r4
	MULT2_1	\r0,\r4,\t0,\t1,\t2
	pxor	\r0,\r1
	pxor	\r4,\r5
	MULT2_1 \r1,\r5,\t0,\t1,\t2
	pxor	\r1,\r2
	pxor	\r5,\r6
	MULT2_1 \r2,\r6,\t0,\t1,\t2
	pxor	\r2,\r3
	pxor	\r6,\r7
	MULT2_1 \r3,\r7,\t0,\t1,\t2
	pxor	\r3,\u0
	pxor	\r7,\u1
	MULT2_1 \u0,\u1,\t0,\t1,\t2
	pxor	\u0,\s2
	pxor	\u1,\s0
	movdqa	\s1,\r0
	movdqa	\s2,\r4
	MULT2_1	\r0,\r4,\t0,\t1,\t2
	pxor	\r0,\u0
	pxor	\r4,\u1
	movdqa	XMMWORD PTR [\pt+0],\r0
	movdqa	XMMWORD PTR [\pt+16],\r4
	MULT2_1	\u0,\u1,\t0,\t1,\t2
	pxor	\u0,\r3
	pxor	\u1,\r7
	movdqa	XMMWORD PTR [\pt+128],\u0
	movdqa	XMMWORD PTR [\pt+144],\u1
	MULT2_1	\r3,\r7,\t0,\t1,\t2
	pxor	\r3,\r2
	pxor	\r7,\r6
	movdqa	XMMWORD PTR [\pt+96],\r3
	movdqa	XMMWORD PTR [\pt+112],\r7
	MULT2_1	\r2,\r6,\t0,\t1,\t2
	pxor	\r2,\r1
	pxor	\r6,\r5
	movdqa	XMMWORD PTR [\pt+64],\r2
	movdqa	XMMWORD PTR [\pt+80],\r6
	MULT2_1	\r1,\r5,\t0,\t1,\t2
	pxor	\r1,\s1
	pxor	\r5,\s2
	movdqa	XMMWORD PTR [\pt+32],\r1
	movdqa	XMMWORD PTR [\pt+48],\r5
	.endm

	.macro	MI_MSG	r0,r1,r2,r3,r4,r5,r6,r7,u0,u1,t0,t1,t2,pt
	PSHFL	\r0,\r4,\t0,\t1
	movdqa	\r1,\r0
	movdqa	\r5,\r4
	movdqa	\t2,XMMWORD PTR mult2mask[0]
	pxor	\r0,XMMWORD PTR [\pt+0]
	pxor	\r4,XMMWORD PTR [\pt+16]
	MULT2_1	\r1,\r5,\t0,\t1,\t2
	movdqa	\r2,\r1
	movdqa	\r6,\r5
	pxor	\r1,XMMWORD PTR [\pt+32]
	pxor	\r5,XMMWORD PTR [\pt+48]
	MULT2_1	\r2,\r6,\t0,\t1,\t2
	movdqa	\r3,\r2
	movdqa	\r7,\r6
	pxor	\r2,XMMWORD PTR [\pt+64]
	pxor	\r6,XMMWORD PTR [\pt+80]
	MULT2_1	\r3,\r7,\t0,\t1,\t2
	movdqa	\u0,\r3
	movdqa	\u1,\r7
	pxor	\r3,XMMWORD PTR [\pt+96]
	pxor	\r7,XMMWORD PTR [\pt+112]
	MULT2_1	\u0,\u1,\t0,\t1,\t2
	pxor	\u0,XMMWORD PTR [\pt+128]
	pxor	\u1,XMMWORD PTR [\pt+144]
	CONV_FMT	\r0,\r1,\r2,\r3,\t0,\t1
	CONV_FMT	\r4,\r5,\r6,\r7,\t0,\t1
	.endm

	.macro	PERM	r0,r1,r2,r3,r4,r5,r6,r7,u0,u1,t0,t1,t2,t3,t4,t5,pt
	TWEAK	\r4,\r5,\r6,\r7,\u1,\t0,\t1,\t2,\t3,\t4
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,RND_CNS+0
	STEP	\t0,\r1,\r2,\r3,\r4,\t1,\r6,\r7,\t2,\t3,\r0,\r5,\u0,\u1,\t4,\t5,RND_CNS+64
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,RND_CNS+128
	STEP	\t0,\r1,\r2,\r3,\r4,\t1,\r6,\r7,\t2,\t3,\r0,\r5,\u0,\u1,\t4,\t5,RND_CNS+192
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,RND_CNS+256
	STEP	\t0,\r1,\r2,\r3,\r4,\t1,\r6,\r7,\t2,\t3,\r0,\r5,\u0,\u1,\t4,\t5,RND_CNS+320
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\u0,\u1,\t0,\t1,\t2,\t3,\t4,\t5,RND_CNS+384
	STEP	\t0,\r1,\r2,\r3,\r4,\t1,\r6,\r7,\t2,\t3,\r0,\r5,\u0,\u1,\t4,\t5,RND_CNS+448
	.endm

	.macro	STEP	r0,r1,r2,r3,r4,r5,r6,r7,u0,u1,t0,t1,t2,t3,t4,t5,cns
	SUB_CRUMB	\r0,\r1,\r2,\r3,\t0,\r5,\r6,\r7,\r4,\t1,\t4,\u0,\u1,\t2,\t3,\t5
	MIX_WORD	\t0,\r1,\r2,\r3,\r4,\t1,\r6,\r7,\t2,\t3,\r0,\r5,\u0,\u1,\t4,\t5,\cns
	.endm

	.macro	TWEAK	r0,r1,r2,r3,u1,t0,t1,t2,t3,t4
	TWEAK_PART	\r0,\t0,\t1,\t2,\t3,\t4
	TWEAK_PART	\r1,\t0,\t1,\t2,\t3,\t4
	TWEAK_PART	\r2,\t0,\t1,\t2,\t3,\t4
	TWEAK_PART	\r3,\t0,\t1,\t2,\t3,\t4
	pshufb	\u1,XMMWORD PTR twmask[0]
	.endm

	.macro	TWEAK_PART r0,t0,t1,t2,t3,t4
	movdqa	\t0,\r0
	movdqa	\t1,\r0
	movdqa	\t2,\r0
	pand	\t0,XMMWORD PTR mask22[0]
	pand	\t1,XMMWORD PTR mask44[0]
	pand	\t2,XMMWORD PTR mask88[0]
	pshufd	\t3,\t0,0x39
	pshufd	\t4,\t2,0x39
	pslld	\t0,4
	pslld	\t2,12
	psrld	\t3,28
	psrld	\t4,20
	por		\t0,\t3
	por		\t2,\t4
	pshufb	\t1,XMMWORD PTR mwmask[0]
	pand	\r0,XMMWORD PTR mask11[0]
	por		\r0,\t0
	por		\r0,\t1
	por		\r0,\t2
	.endm

	#(r0,r1,r2,r3)->(r4,r1,r2,r3), (s0,s1,s2,s3)->(s4,s1,s2,s3)
	.macro SUB_CRUMB	r0,r1,r2,r3,r4,s0,s1,s2,s3,s4,t0,u0,u1,u2,u3,u4
	movdqa	\t0, XMMWORD PTR allone
	movdqa	\r4, \r0
	movdqa	\u2, XMMWORD PTR sbox[0]
	movdqa	\s4, \s0
	movdqa	\u4, XMMWORD PTR sbox[16]
	por		\r0, \r1
	movdqa	\u3, \u0
	por		\s0, \s1
	pand	\u0, XMMWORD PTR smask[0]
	pxor	\r2, \r3
	psrld	\u3, 4
	pxor	\s2, \s3
	pxor	\r1, \t0
	pshufb	\u2, \u0
	pxor	\s1, \t0
	pand	\u3, XMMWORD PTR smask[0]
	pxor	\r0, \r3
	pxor	\s0, \s3
	pshufb	\u4, \u3
	pand	\r3, \r4
	pxor	\u2, \u4
	pand	\s3, \s4
	movdqa	\u3, XMMWORD PTR sbox[32]
	pxor	\r1, \r3
	pxor	\s1, \s3
	pxor	\r3, \r2
	movdqa	\u0, XMMWORD PTR sbox[48]
	pxor	\s3, \s2
	movdqa	\u4, \u1
	pand	\r2, \r0
	pand	\s2, \s0
	pand	\u1, XMMWORD PTR smask[0]
	pxor	\r0, \t0
	pxor	\s0, \t0
	psrld	\u4, 4
	pxor	\r2, \r1
	pxor	\s2, \s1
	por		\r1, \r3
	pshufb	\u3, \u1
	por		\s1, \s3
	pxor	\r4, \r1
	pand	\u4, XMMWORD PTR smask[0]
	pxor	\s4, \s1
	pxor	\r3, \r2
	pshufb	\u0, \u4
	pxor	\s3, \s2
	pand	\r2, \r1
	pxor	\u3, \u0
	pand	\s2, \s1
	pxor	\r1, \r0
	pxor	\s1, \s0
	.endm

	.macro	MIX_WORD m0,m1,m2,m3,m4,m5,m6,m7,u0,u1,t0,t1,t2,r0,r1,r2,cns
	movdqa	\r0,XMMWORD PTR mwmask[0]
	movdqa	\r1,XMMWORD PTR mwmask[16]
	movdqa	\r2,XMMWORD PTR mwmask[32]
	pxor	\u1,\u0
	pshufb	\u0,\r0
	pxor	\m4,\m0
	pshufb	\m0,\r0
	pxor	\m0,\m4
	pxor	\u0,\u1
	pshufb	\m4,\r1
	pxor	\m5,\m1
	pshufb	\u1,\r1
	pxor	\m4,\m0
	pshufb	\m1,\r0
	pxor	\m6,\m2
	pshufb	\m0,\r2
	pxor	\u1,\u0
	pxor	\m1,\m5
	pshufb	\m2,\r0
	pxor	\m0,\m4
	pshufb	\m5,\r1
	pxor	\m2,\m6
	pshufb	\u0,\r2
	pshufd	\t0,\m4,0x39
	pxor	\m5,\m1
	pxor	\u0,\u1
	pshufb	\m6,\r1
	pxor	\m7,\m3
	pshufd	\t2,\u1,0x39
	pslld	\m4,4
	pshufb	\m1,\r2
	pxor	\m6,\m2
	pshufb	\m3,\r0
	psrld	\t0,28
	pxor	\m1,\m5
	pslld	\u1,4
	pshufb	\m2,\r2
	pxor	\m3,\m7
	psrld	\t2,28
	pxor	\m0, XMMWORD PTR [\cns+0]

	pshufd	\t1,\m5,0x39
 	pxor	\u0, XMMWORD PTR [\cns+32]
	pshufb	\m7,\r1
	por		\u1,\t2
	pslld	\m5,4
	pxor	\m2,\m6
	pshufd	\t2,\m6,0x39
	pxor	\m7,\m3
	psrld	\t1,28
	por		\m4,\t0
	pslld	\m6,4
	pxor	\u1, XMMWORD PTR [\cns+48]
	pshufb	\m3,\r2

	psrld	\t2,28
	pxor	\m3,\m7
	por		\m5,\t1
	pshufd	\t1,\m7,0x39

	pslld	\m7,4
	pxor	\m4, XMMWORD PTR [\cns+16]
	por		\m6,\t2
	psrld	\t1,28
	por		\m7,\t1
	.endm


.text
	.globl	luffa512_init
	.type	luffa512_init, @function
	.align	16
luffa512_init:
	movdqa	%xmm0, [IV    ]
	movdqa	%xmm1, [IV+ 16]
	movdqa	%xmm2, [IV+ 32]
	movdqa	%xmm3, [IV+ 48]
	movdqa	%xmm4, [IV+ 64]
	movdqa	%xmm5, [IV+ 80]
	movdqa	%xmm6, [IV+ 96]
	movdqa	%xmm7, [IV+112]
	movdqa	%xmm8, [IV+128]
	movdqa	%xmm9, [IV+144]
	movdqu	[%rdi    ], %xmm0
	movdqu	[%rdi+ 16], %xmm1
	movdqu	[%rdi+ 32], %xmm2
	movdqu	[%rdi+ 48], %xmm3
	movdqu	[%rdi+ 64], %xmm4
	movdqu	[%rdi+ 80], %xmm5
	movdqu	[%rdi+ 96], %xmm6
	movdqu	[%rdi+112], %xmm7
	movdqu	[%rdi+128], %xmm8
	movdqu	[%rdi+144], %xmm9
	ret
	.size	luffa512_init, .-luffa512_init


//luffa-512 round function
	.globl	luffa512
	.type	luffa512, @function
	.align	16
luffa512:
	push	%rbp
	mov	%rbp, %rsp
	and	%rsp, QWORD PTR mask16[0]
	sub	%rsp, 160
	mov	%rax, 0
	movdqu	%xmm0, [%rdi    ]
	movdqu	%xmm1, [%rdi+ 16]
	movdqu	%xmm2, [%rdi+ 32]
	movdqu	%xmm3, [%rdi+ 48]
	movdqu	%xmm4, [%rdi+ 64]
	movdqu	%xmm5, [%rdi+ 80]
	movdqu	%xmm6, [%rdi+ 96]
	movdqu	%xmm7, [%rdi+112]
	movdqu	%xmm8, [%rdi+128]
	movdqu	%xmm9, [%rdi+144]

.RND512:
	ROUND	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm12,%xmm13,%xmm14,%xmm15,%rsp,%rsi
	add	%rsi, 32
	add	%rax, 1
	cmp	%rax, %rdx
	jl	.RND512

	movdqu	[%rdi    ], %xmm0
	movdqu	[%rdi+ 16], %xmm1
	movdqu	[%rdi+ 32], %xmm2
	movdqu	[%rdi+ 48], %xmm3
	movdqu	[%rdi+ 64], %xmm4
	movdqu	[%rdi+ 80], %xmm5
	movdqu	[%rdi+ 96], %xmm6
	movdqu	[%rdi+112], %xmm7
	movdqu	[%rdi+128], %xmm8
	movdqu	[%rdi+144], %xmm9
	mov	%rsp, %rbp
	pop	%rbp
	ret
	.size	luffa512, .-luffa512


	.globl	luffa512_final
	.type	luffa512_final, @function
	.align	16
luffa512_final:
	push	%rbp
	mov	%rbp, %rsp
	and	%rsp, QWORD PTR mask16[0]
	sub	%rsp, 160
	movdqu	%xmm0, [%rdi    ]
	movdqu	%xmm1, [%rdi+ 16]
	movdqu	%xmm2, [%rdi+ 32]
	movdqu	%xmm3, [%rdi+ 48]
	movdqu	%xmm4, [%rdi+ 64]
	movdqu	%xmm5, [%rdi+ 80]
	movdqu	%xmm6, [%rdi+ 96]
	movdqu	%xmm7, [%rdi+112]
	movdqu	%xmm8, [%rdi+128]
	movdqu	%xmm9, [%rdi+144]

	ROUND_BLANK	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm12,%xmm13,%xmm14,%xmm15,%rsp
	OUTPUT1	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm12,%xmm13,%xmm14,%xmm15,%rsi,%rsp

	ROUND_BLANK	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm12,%xmm13,%xmm14,%xmm15,%rsp
	OUTPUT2	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%rsi,%rsp

	mov	%rsp, %rbp
	pop	%rbp
	ret
	.size	luffa512_final, .-luffa512_final


	.section	.rodata
	.align 32
mask16:
	.long	0xfffffff0,0xffffffff,0x00000000,0x00000000
	.align	32
mask33:
	.long	0x33333333,0x33333333,0x33333333,0x33333333
maskaa:
	.long	0xaaaaaaaa,0xaaaaaaaa,0xaaaaaaaa,0xaaaaaaaa
mask55:
	.long	0x55555555,0x55555555,0x55555555,0x55555555
maskcc:
	.long	0xcccccccc,0xcccccccc,0xcccccccc,0xcccccccc
mask22:
	.long	0x22222222,0x22222222,0x22222222,0x22222222
mask44:
	.long	0x44444444,0x44444444,0x44444444,0x44444444
mask88:
	.long	0x88888888,0x88888888,0x88888888,0x88888888
mask11:
	.long	0x11111111,0x11111111,0x11111111,0x11111111
mult2mask:
	.long	0x88888888,0x88888888,0x88888888,0x88888888
psmask:
	.long	0x03010200,0x07050604,0x0b090a08,0x0f0d0e0c
	.long	0x00f000f0,0x00f000f0,0x00f000f0,0x00f000f0
	.long	0x0c0c0c0c,0x0c0c0c0c,0x0c0c0c0c,0x0c0c0c0c
twmask:
	.byte	0x6,0x7,0x0,0x1,0xa,0xb,0x4,0x5
	.byte	0xe,0xf,0x8,0x9,0x2,0x3,0xc,0xd
mwmask:
	.byte	0x7,0x0,0x1,0x2,0xb,0x4,0x5,0x6
	.byte	0xf,0x8,0x9,0xa,0x3,0xc,0xd,0xe
	.byte	0x9,0xa,0xb,0x4,0xd,0xe,0xf,0x8
	.byte	0x1,0x2,0x3,0xc,0x5,0x6,0x7,0x0
	.byte	0xb,0x4,0x5,0x6,0xf,0x8,0x9,0xa
	.byte	0x3,0xc,0xd,0xe,0x7,0x0,0x1,0x2
	.long	0xf0000000,0xf0000000,0xf0000000,0xf0000000
allone:
	.byte	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	.byte	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
sbox:
	.byte	0x0d,0x0e,0x00,0x01,0x05,0x0a,0x07,0x06
	.byte	0x0b,0x03,0x09,0x0c,0x0f,0x08,0x02,0x04
	.byte	0xd0,0xe0,0x00,0x10,0x50,0xa0,0x70,0x60
	.byte	0xb0,0x30,0x90,0xc0,0xf0,0x80,0x20,0x40
	.byte	0x0b,0x07,0x0d,0x06,0x00,0x03,0x02,0x09
	.byte	0x0a,0x0f,0x05,0x01,0x0e,0x04,0x0c,0x08
	.byte	0xb0,0x70,0xd0,0x60,0x00,0x30,0x20,0x90
	.byte	0xa0,0xf0,0x50,0x10,0xe0,0x40,0xc0,0x80
smask:
	.long	0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f

	.align	32
	.type	IV, @object
	.size	IV, 128
IV:	
	.byte 0x6f,0x1d,0x54,0xe7,0x45,0x47,0x72,0xe4
	.byte 0x3a,0x79,0x89,0x4e,0x0f,0x5e,0x1e,0xe9
	.byte 0x86,0x6d,0x8e,0x27,0xe8,0x48,0x5f,0xfa
	.byte 0x65,0x8c,0x2f,0xa7,0xa4,0x8a,0x12,0xdb
	.byte 0x18,0x1d,0xa2,0x8b,0x3c,0x32,0xb8,0x3a
	.byte 0x9b,0x7d,0xf8,0xaf,0x8c,0x0d,0x79,0xfc
	.byte 0x35,0x76,0xc3,0x73,0x9f,0xa5,0x51,0x1d
	.byte 0xaa,0xef,0x0e,0x70,0xaf,0x0d,0xb0,0x29
	.byte 0x5e,0x3b,0x9a,0x03,0xeb,0x3c,0x12,0xa0
	.byte 0x06,0xca,0x14,0x00,0xe7,0xc6,0x83,0x0e
	.byte 0xea,0x2e,0x49,0x3c,0x0f,0xe5,0xc1,0xae
	.byte 0x09,0xd3,0x94,0x8a,0xea,0x05,0xf7,0x31
	.byte 0x32,0x3f,0x58,0x33,0x41,0xeb,0xca,0xc0
	.byte 0x67,0xa2,0xc8,0xb2,0x61,0xf2,0x11,0x00
	.byte 0x54,0xdb,0xab,0x5b,0xd0,0xaf,0x79,0x9b
	.byte 0xc2,0x42,0x8b,0x2e,0xd7,0x9c,0x51,0xfc
	.byte 0xa8,0xfb,0x92,0xc7,0x8c,0x96,0xd8,0xab
	.byte 0xed,0x36,0x56,0x59,0xfc,0x15,0xb1,0x5c
	.byte 0xab,0x23,0x55,0x51,0x71,0x93,0xc5,0xbf
	.byte 0x01,0xbc,0xd1,0x28,0x83,0xd4,0xa3,0xfe

RND_CNS:
	//RND1
	.byte 0xa0,0x46,0xff,0xe4,0xa9,0x32,0x5b,0x22
	.byte 0x8c,0xc9,0x87,0xd4,0x5a,0x2b,0xb4,0xf6
	.byte 0x42,0x00,0xd0,0xdd,0x51,0xe4,0xb5,0x06
	.byte 0x6a,0xb2,0x57,0x8f,0x8e,0xba,0xab,0xc4
	.byte 0x00,0x00,0x11,0x11,0x10,0x00,0x01,0x11
	.byte 0x01,0x10,0x10,0x11,0x11,0x00,0x10,0x11
	.byte 0x00,0x00,0x01,0x01,0x00,0x00,0x01,0x10
	.byte 0x01,0x01,0x01,0x11,0x11,0x01,0x11,0x01
	//RND2
	.byte 0x00,0x84,0x66,0x9b,0x94,0x8f,0x36,0x3f
	.byte 0xf0,0xec,0xeb,0x83,0x2d,0x3e,0x69,0xb0
	.byte 0x42,0x0f,0x40,0x4d,0x5f,0x18,0xe9,0x28
	.byte 0xcd,0xfa,0xf6,0x5a,0x49,0x13,0x6e,0xa6
	.byte 0x00,0x11,0x10,0x10,0x01,0x00,0x01,0x00
	.byte 0x11,0x01,0x01,0x11,0x10,0x10,0x11,0x11
	.byte 0x01,0x11,0x10,0x00,0x01,0x10,0x01,0x00
	.byte 0x01,0x01,0x10,0x00,0x11,0x10,0x10,0x10
	//RND3
	.byte 0xe2,0xdb,0x54,0x0d,0x33,0x42,0x84,0x5d
	.byte 0xb6,0x90,0x31,0xe0,0xd4,0x46,0x83,0x62
	.byte 0x93,0xff,0xbf,0x2d,0x8a,0xe9,0x15,0x84
	.byte 0xa0,0xad,0x41,0xfb,0xb0,0x24,0xc8,0x63
	.byte 0x11,0x10,0x01,0x00,0x11,0x10,0x00,0x11
	.byte 0x10,0x01,0x10,0x01,0x10,0x00,0x11,0x11
	.byte 0x00,0x01,0x11,0x10,0x00,0x01,0x10,0x01
	.byte 0x10,0x01,0x01,0x10,0x00,0x11,0x10,0x10
	//RND4
	.byte 0x80,0x3f,0x0b,0x59,0x30,0xe3,0x4f,0x89
	.byte 0x62,0xb6,0x4d,0x3c,0xd2,0xd9,0x9b,0x8e
	.byte 0x59,0x4e,0x2f,0xb2,0x2b,0x5a,0xe4,0x18
	.byte 0x63,0xa0,0x70,0x4c,0xd5,0xbd,0xf9,0xc5
	.byte 0x11,0x11,0x10,0x01,0x01,0x11,0x10,0x00
	.byte 0x11,0x10,0x01,0x10,0x01,0x10,0x00,0x11
	.byte 0x01,0x00,0x01,0x11,0x10,0x00,0x01,0x10
	.byte 0x10,0x10,0x01,0x01,0x00,0x00,0x11,0x10
	//RND5
	.byte 0x54,0x59,0xef,0x42,0xac,0xe4,0xea,0x06
	.byte 0x8a,0x22,0x6b,0x44,0xdb,0x9b,0x44,0x92
	.byte 0x81,0xcb,0xde,0x9d,0x6c,0xb0,0x58,0x56
	.byte 0xce,0xd3,0x39,0x72,0x94,0x67,0x94,0xfb
	.byte 0x00,0x10,0x11,0x01,0x00,0x00,0x10,0x01
	.byte 0x10,0x01,0x10,0x00,0x01,0x10,0x00,0x01
	.byte 0x01,0x10,0x10,0x00,0x11,0x00,0x01,0x00
	.byte 0x10,0x10,0x01,0x00,0x10,0x01,0x11,0x10
	//RND6
	.byte 0x24,0x76,0x79,0xed,0x64,0x8c,0xe6,0xe8
	.byte 0x92,0x8a,0x00,0x69,0x29,0xd9,0xb9,0x46
	.byte 0x74,0xac,0xeb,0x23,0xa2,0x43,0xbd,0xa5
	.byte 0xf4,0x3e,0xf1,0x34,0x2e,0x69,0xb5,0x99
	.byte 0x10,0x11,0x00,0x10,0x10,0x10,0x01,0x11
	.byte 0x01,0x10,0x10,0x11,0x10,0x00,0x01,0x01
	.byte 0x11,0x11,0x00,0x00,0x00,0x00,0x00,0x11
	.byte 0x11,0x00,0x01,0x01,0x11,0x00,0x00,0x11
	//RND7
	.byte 0x35,0xf9,0xa6,0x74,0xb9,0xb4,0x81,0xeb
	.byte 0x46,0x92,0x57,0x0d,0xd2,0x24,0x04,0xb4
	.byte 0x78,0xa7,0x7c,0x08,0x04,0x7c,0x40,0x5e
	.byte 0x97,0x14,0xe3,0xf2,0xd7,0xcd,0x54,0xb6
	.byte 0x11,0x10,0x11,0x00,0x11,0x10,0x10,0x01
	.byte 0x01,0x01,0x10,0x10,0x00,0x10,0x00,0x01
	.byte 0x11,0x11,0x11,0x00,0x01,0x00,0x00,0x00
	.byte 0x11,0x11,0x00,0x01,0x00,0x11,0x00,0x00
	//RND8
	.byte 0xd8,0x01,0xc9,0xd2,0x4d,0x8e,0xb0,0xf5
	.byte 0xb3,0x36,0xa1,0x53,0x30,0xa6,0x67,0x00
	.byte 0x1a,0x30,0xe7,0xb4,0x72,0x48,0x74,0x88
	.byte 0xba,0x57,0x50,0xeb,0x4d,0x1f,0x49,0x5c
	.byte 0x01,0x11,0x10,0x11,0x10,0x11,0x10,0x10
	.byte 0x01,0x01,0x01,0x10,0x00,0x00,0x10,0x00
	.byte 0x00,0x11,0x11,0x11,0x01,0x01,0x00,0x00
	.byte 0x00,0x11,0x11,0x00,0x01,0x00,0x11,0x00

