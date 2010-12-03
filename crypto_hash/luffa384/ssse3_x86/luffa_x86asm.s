#	Luffa384
#	Programmed by K.I.
#	Ver.1: 8.Sept.2010
#	Ver.2: 8.Sept.2010 Modified from luffa384_OL.s, change the order of MI_IS and MI_MSG
#	Ver.3: 10.Sept.2010 Modified from luffa384_OL-2.s
#	Ver.4: 10.Sept.2010 Modified from luffa384_OL-3.s, change CONV_FMT
#	Ver.4-2: 10.Sept.2010 Modified from luffa384_OL-4.s, change MI_IS
#	Ver.4-3: 13.Sept.2010 Modified from luffa384_OL-4-2.s, change MIX_WORD
#	Ver.4-4: 13.Sept.2010 Modified from luffa384_OL-4-3.s, change SUB_CRUMB
#	Ver.5:	15.Sept.2010 Modified from luffa384_OL-4-4.s, make the code more readable

.intel_syntax

	.macro	ROUND	r0,r1,r2,r3,r4,r5,r6,r7,msg
	MI_IS	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7
	MI_MSG	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,\msg
	PERM	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7
	.endm

	.macro	OUTPUT m0,m1,m2,m3,m4,m5,m6,m7,rout
	mov	\rout, DWORD PTR [%esp+4]
	movups	XMMWORD PTR [\rout], \m0
	movups	XMMWORD PTR [\rout+16], \m1
	movaps	\m2, XMMWORD PTR[buffer+32]
	movaps	\m3, XMMWORD PTR[buffer+48]
	movups	XMMWORD PTR [\rout+64], \m4
	movups	XMMWORD PTR [\rout+80], \m5
	movups	XMMWORD PTR [\rout+96], \m6
	movups	XMMWORD PTR [\rout+112], \m7
	movups	XMMWORD PTR [\rout+32], \m2
	movups	XMMWORD PTR [\rout+48], \m3
	.endm

	.macro	ROUND_FINAL	r0,r1,r2,r3,r4,r5,r6,r7
	MI_IS	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7
	movaps	\r3, XMMWORD PTR [buffer+48]
	CONV_FMT	\r0,\r1,\r2,\r3,\r6,\r7
	movaps	\r6, XMMWORD PTR [buffer+96]
	movaps	\r7, XMMWORD PTR [buffer+112]
	movaps	XMMWORD PTR [buffer+32], \r2
	movaps	XMMWORD PTR [buffer+48], \r3
	pshufd	\r2,\r5,0x39
	pslld	\r5,4
	pshufd	\r3,\r7,0x39
	pslld	\r7,12
	pshufb	\r6,XMMWORD PTR mwmask[0]
	psrld	\r2,28
	psrld	\r3,20
	orps	\r5,\r2
	orps	\r7,\r3
	CONV_FMT	\r4,\r5,\r6,\r7,\r2,\r3
	PERM	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7
	.endm

	.macro	OUTPUT_FINAL m0,m1,m2,m3,m4,m5,m6,m7,rout
	movaps	XMMWORD PTR [buffer+64], \m4
	movaps	XMMWORD PTR [buffer+80], \m5
	movaps	XMMWORD PTR [buffer+96], \m6
	movaps	XMMWORD PTR [buffer+112], \m7
	UNCONV_FMT	\m4,\m5,\m6,\m7,\m2,\m3
	xorps	\m4,\m5
	xorps	\m4,\m6
	xorps	\m4,\m7
	movaps	\m2, XMMWORD PTR [buffer+32]
	movaps	\m3, XMMWORD PTR [buffer+48]
	movaps	XMMWORD PTR [buffer], \m0
	movaps	XMMWORD PTR [buffer+16], \m1
	UNCONV_FMT	\m0,\m1,\m2,\m3,\m6,\m7
	xorps	\m0,\m1
	xorps	\m0,\m2
	xorps	\m0,\m3
	UNPSHFL	\m0,\m4,\m1,\m2,\m3,\m5,\m6,\m7
	movaps	\m1, XMMWORD PTR [buffer+16]
	movaps	\m5, XMMWORD PTR [buffer+80]
	movaps	\m6, XMMWORD PTR [buffer+96]
	movaps	\m7, XMMWORD PTR [buffer+112]
	mov	\rout, [%esp+8]
	movups	XMMWORD PTR [\rout], \m0
	movups	XMMWORD PTR [\rout+16], \m4
	movaps	\m0, XMMWORD PTR [buffer]
	movaps	\m4, XMMWORD PTR [buffer+64]
	.endm

	.macro	OUTPUT_FINAL2 m0,m1,m2,m3,m4,m5,m6,m7,rout
	movaps	\m2, XMMWORD PTR [buffer+32]
	movaps	\m3, XMMWORD PTR [buffer+48]
	UNCONV_FMT	\m0,\m1,\m2,\m3,\m6,\m7
	xorps	\m0,\m1
	xorps	\m0,\m2
	xorps	\m0,\m3
	UNPSHFL	\m0,\m4,\m1,\m2,\m3,\m5,\m6,\m7
	movups	XMMWORD PTR [\rout+32], \m0
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
	movaps	\t0, \m0
	psrlq	\t0, \sh
	xorps	\t0, \m0
	andps	\t0, XMMWORD PTR \r
	xorps	\m0, \t0
	psllq	\t0, \sh
	xorps	\m0, \t0

	movaps	\t1, \m1
	psrlq	\t1, \sh
	xorps	\t1, \m1
	andps	\t1, XMMWORD PTR \r
	xorps	\m1, \t1
	psllq	\t1, \sh
	xorps	\m1, \t1
	.endm

	.macro	UNPSHFL m0,m1,t0,t1,r0,r1,r2,r3
	movaps	\r0, XMMWORD PTR psmask[0]
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

	.macro	MULT2_1 m0,m1,t0,t1
	movaps	\t0,\m0
	movaps	\t1,\m1
	andps	\t0,XMMWORD PTR mask88[0]
	andps	\t1,XMMWORD PTR mask88[0]
	xorps	\m0,\t0
	xorps	\m1,\t1
	pslld	\m0,1
	pslld	\m1,1
	psrld	\t0,3
	xorps	\m1,\t0
	xorps	\m0,\t1
	psrld	\t1,2
	xorps	\m0,\t1
	psrld	\t1,1
	xorps	\m1,\t1
	xorps	\m0,\t1
	.endm

	.macro	CONV_FMT r0,r1,r2,r3,t0,t1
	movaps	\t1,\r1
	movaps	\t0,\r0
	andps	\t1,XMMWORD PTR mask55[0]
	andps	\t0,XMMWORD PTR maskaa[0]
	andps	\r0,XMMWORD PTR mask55[0]
	andps	\r1,XMMWORD PTR maskaa[0]
	pslld	\t1,1
	psrld	\t0,1
	orps	\r0,\t1
	orps	\r1,\t0

	movaps	\t1,\r3
	movaps	\t0,\r2
	andps	\t1,XMMWORD PTR mask55[0]
	andps	\t0,XMMWORD PTR maskaa[0]
	andps	\r2,XMMWORD PTR mask55[0]
	andps	\r3,XMMWORD PTR maskaa[0]
	pslld	\t1,1
	psrld	\t0,1
	orps	\r2,\t1
	orps	\r3,\t0

	movaps	\t1,\r2
	movaps	\t0,\r0
	andps	\t1,XMMWORD PTR mask33[0]
	andps	\t0,XMMWORD PTR maskcc[0]
	andps	\r0,XMMWORD PTR mask33[0]
	andps	\r2,XMMWORD PTR maskcc[0]
	pslld	\t1,2
	psrld	\t0,2
	orps	\r0,\t1
	orps	\r2,\t0

	movaps	\t1,\r3
	movaps	\t0,\r1
	andps	\t1,XMMWORD PTR mask33[0]
	andps	\r1,XMMWORD PTR mask33[0]
	xorps	\t0,\r1
	xorps	\r3,\t1
	pslld	\t1,2
	psrld	\t0,2
	orps	\r1,\t1
	orps	\r3,\t0
	.endm

	.macro	UNCONV_FMT	r0,r1,r2,r3,t0,t1
	movaps	\t0,\r0
	movaps	\t1,\r1
	andps	\r0,mask55
	psrld	\t0,1
	andps	\r1,maskaa
	pslld	\t1,1
	andps	\t0,mask55
	andps	\t1,maskaa
	orps	\r1,\t0
	orps	\r0,\t1

	movaps	\t0,\r2
	movaps	\t1,\r3
	andps	\r2,mask55
	psrld	\t0,1
	andps	\r3,maskaa
	pslld	\t1,1
	andps	\t0,mask55
	andps	\t1,maskaa
	orps	\r3,\t0
	orps	\r2,\t1

	movaps	\t0,\r0
	movaps	\t1,\r2
	andps	\r0,mask33
	psrld	\t0,2
	andps	\r2,maskcc
	pslld	\t1,2
	andps	\t0,mask33
	andps	\t1,maskcc
	orps	\r2,\t0
	orps	\r0,\t1

	movaps	\t0,\r1
	movaps	\t1,\r3
	andps	\r1,mask33
	psrld	\t0,2
	andps	\r3,maskcc
	pslld	\t1,2
	andps	\t0,mask33
	andps	\t1,maskcc
	orps	\r3,\t0
	orps	\r1,\t1
	.endm


	.macro	MI_IS	r0,r1,r2,r3,r4,r5,r6,r7
	UNCONV_FMT	\r4,\r5,\r6,\r7,\r2,\r3
	movaps	\r2,\r4
	xorps	\r4,\r6
	xorps	\r4,\r7
	xorps	\r4,\r5
	movaps	XMMWORD PTR [buffer+64], \r2
	movaps	XMMWORD PTR [buffer+80], \r5
	movaps	XMMWORD PTR [buffer+96], \r6
	movaps	XMMWORD PTR [buffer+112], \r7
	movaps	\r2,XMMWORD PTR[buffer+32]
	movaps	\r3,XMMWORD PTR[buffer+48]
	UNCONV_FMT	\r0,\r1,\r2,\r3,\r6,\r7
	movaps	\r5,\r0
	xorps	\r5,\r1
	xorps	\r5,\r2
	xorps	\r5,\r3
	MULT2_1	\r5,\r4,\r6,\r7
	movaps	\r6, XMMWORD PTR[buffer+96]
	xorps	\r0,\r5
	movaps	\r7, XMMWORD PTR[buffer+112]
	xorps	\r1,\r5
	xorps	\r2,\r5
	xorps	\r3,\r5
	movaps	\r5,XMMWORD PTR[buffer+80]
	xorps	\r7,\r4
	xorps	\r6,\r4
	xorps	\r5,\r4
	xorps	\r4,XMMWORD PTR[buffer+64]
	movaps	XMMWORD PTR[buffer], \r0
	movaps	XMMWORD PTR[buffer+32],\r2
	movaps	XMMWORD PTR[buffer+96],\r6
	movaps	XMMWORD PTR[buffer+64], \r4
	MULT2_1	\r0,\r4,\r2,\r6
	xorps	\r0,\r3
	xorps	\r4,\r7
	MULT2_1	\r3,\r7,\r2,\r6
	movaps	\r2,XMMWORD PTR[buffer+32]
	movaps	\r6,XMMWORD PTR[buffer+96]
	xorps	\r3,\r2
	xorps	\r7,\r6
	movaps	XMMWORD PTR [buffer+48],\r3
	movaps	XMMWORD PTR [buffer+112],\r7
	MULT2_1	\r2,\r6,\r3,\r7
	xorps	\r2,\r1
	xorps	\r6,\r5
	movaps	XMMWORD PTR [buffer+32],\r2
	movaps	XMMWORD PTR [buffer+96],\r6
	MULT2_1	\r1,\r5,\r3,\r7
	xorps	\r1,XMMWORD PTR[buffer]
	xorps	\r5,XMMWORD PTR[buffer+64]
	.endm

	.macro	MI_MSG	r0,r1,r2,r3,r4,r5,r6,r7,msg
	movups	\r3,XMMWORD PTR [\msg+0]
	movups	\r7,XMMWORD PTR [\msg+16]
	PSHFL	\r3,\r7,\r2,\r6
	xorps	\r0,\r3
	xorps	\r4,\r7
	MULT2_1	\r3,\r7,\r2,\r6
	movaps	XMMWORD PTR [buffer+64], \r4
	xorps	\r1,\r3
	xorps	\r5,\r7
	MULT2_1	\r3,\r7,\r2,\r6
	movaps	\r2,\r3
	movaps	\r6,\r7
	xorps	\r2,XMMWORD PTR[buffer+32]
	xorps	\r6,XMMWORD PTR[buffer+96]
	movaps	XMMWORD PTR [buffer+80], \r5
	MULT2_1	\r3,\r7,\r4,\r5
	xorps	\r3,XMMWORD PTR [buffer+48]
	xorps	\r7,XMMWORD PTR [buffer+112]
	CONV_FMT	\r0,\r1,\r2,\r3,\r4,\r5
	movaps	\r4, XMMWORD PTR[buffer+64]
	movaps	\r5, XMMWORD PTR[buffer+80]
	movaps	XMMWORD PTR [buffer+32],\r2
	movaps	XMMWORD PTR [buffer+48],\r3
	pshufd	\r2,\r5,0x39
	pslld	\r5,4
	pshufd	\r3,\r7,0x39
	pslld	\r7,12
	pshufb	\r6,XMMWORD PTR mwmask[0]
	psrld	\r2,28
	psrld	\r3,20
	orps	\r5,\r2
	orps	\r7,\r3
	CONV_FMT	\r4,\r5,\r6,\r7,\r2,\r3
	.endm

	.macro	NMLTOM	r0,r2,r4,r6,t0,t1
	//in :r0=d0 c0 b0 a0, r1=h0 g0 f0 e0, r2=d1 c1 b1 a1, r3=...
	//out:r0=a3 a2 a1 a0, r2=b3 b2 b1 b0, r4=c3 c2 c1 c0, r6=d3 d2 d1 d0
	movaps	\t0, \r0
	movaps	\t1, \r4
	punpckldq	\r0, \r2
	punpckldq	\r4, \r6
	punpckhdq	\t0, \r2
	punpckhdq	\t1, \r6
	movaps	\r2, \r0
	movaps	\r6, \t0
	punpcklqdq	\r0, \r4
	punpckhqdq	\r2, \r4
	punpcklqdq	\t0, \t1
	punpckhqdq	\r6, \t1
	movaps	\r4,\t0
	.endm

	.macro	PERM	r0,r1,r2,r3,r4,r5,r6,r7
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,RND_CNS+0
	STEP	\r5,\r1,\r2,\r3,\r4,\r0,\r6,\r7,RND_CNS+32
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,RND_CNS+64
	STEP	\r5,\r1,\r2,\r3,\r4,\r0,\r6,\r7,RND_CNS+96
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,RND_CNS+128
	STEP	\r5,\r1,\r2,\r3,\r4,\r0,\r6,\r7,RND_CNS+160
	STEP	\r0,\r1,\r2,\r3,\r4,\r5,\r6,\r7,RND_CNS+192
	STEP	\r5,\r1,\r2,\r3,\r4,\r0,\r6,\r7,RND_CNS+224
	.endm

	.macro	STEP	r0,r1,r2,r3,r4,r5,r6,r7,cns
	SUB_CRUMB	\r5,\r6,\r7,\r4,\r2
	movaps	XMMWORD PTR[buffer+80],\r2
	movaps	\r2,XMMWORD PTR[buffer+32]
	movaps	\r3,XMMWORD PTR[buffer+48]
	SUB_CRUMB	\r0,\r1,\r2,\r3,\r5
	MIX_WORD	\r5,\r1,\r2,\r3,\r4,\r0,\r6,\r7,\cns
	.endm

	#(r0,r1,r2,r3)->(r4,r1,r2,r3)
	.macro SUB_CRUMB	r0,r1,r2,r3,r4

	movaps	\r4, \r0
	orps	\r0, \r1
	xorps	\r2, \r3
	xorps	\r1, XMMWORD PTR allone[0]
	xorps	\r0, \r3
	andps	\r3, \r4
	xorps	\r1, \r3
	xorps	\r3, \r2
	andps	\r2, \r0
	xorps	\r0, XMMWORD PTR allone[0]
	xorps	\r2, \r1
	orps	\r1, \r3
	xorps	\r4, \r1
	xorps	\r3, \r2
	andps	\r2, \r1
	xorps	\r1, \r0
	.endm

	.macro	MIX_WORD m0,m1,m2,m3,m4,t0,m6,m7,cns

	xorps	\m6,\m2
	pshufb	\m2,XMMWORD PTR mwmask[0]
	xorps	\m2,\m6
	pshufb	\m6,XMMWORD PTR mwmask[16]
	xorps	\m6,\m2
	pshufb	\m2,XMMWORD PTR mwmask[32]
	xorps	\m2,\m6
	pshufd	\t0,\m6,0x39
	pslld	\m6,4
	psrld	\t0,28
	orps	\m6,\t0
	movaps	XMMWORD PTR[buffer+32],\m2

	xorps	\m7,\m3
	pshufb	\m3,XMMWORD PTR mwmask[0]
	xorps	\m3,\m7
	pshufb	\m7,XMMWORD PTR mwmask[16]
	xorps	\m7,\m3
	pshufb	\m3,XMMWORD PTR mwmask[32]
	xorps	\m3,\m7
	pshufd	\t0,\m7,0x39
	pslld	\m7,4
	psrld	\t0,28
	orps	\m7,\t0
	movaps	XMMWORD PTR[buffer+48],\m3
	movaps	\t0, XMMWORD PTR[buffer+80]

	xorps	\m4,\m0
	pshufb	\m0,XMMWORD PTR mwmask[0]
	xorps	\m0,\m4
	pshufb	\m4,XMMWORD PTR mwmask[16]
	xorps	\m4,\m0
	pshufb	\m0,XMMWORD PTR mwmask[32]
	xorps	\m0,\m4
	pshufd	\m2,\m4,0x39
	pslld	\m4,4
	psrld	\m2,28
	orps	\m4,\m2
 	xorps	\m0, XMMWORD PTR [\cns+0]

	xorps	\t0,\m1
	pshufb	\m1,XMMWORD PTR mwmask[0]
	xorps	\m1,\t0
	pshufb	\t0,XMMWORD PTR mwmask[16]
	xorps	\t0,\m1
	pshufb	\m1,XMMWORD PTR mwmask[32]
	xorps	\m1,\t0
	pshufd	\m2,\t0,0x39
	pslld	\t0,4
	psrld	\m2,28
	orps	\t0,\m2

 	xorps	\m4, XMMWORD PTR [\cns+16]

	.endm

    .globl  luffa384_init
    .type   luffa384_init, @function
    .align  16
luffa384_init:
    mov     %ecx, [%esp+4]
    movaps  %xmm0, [IV    ]
    movaps  %xmm1, [IV+ 16]
    movaps  %xmm2, [IV+ 32]
    movaps  %xmm3, [IV+ 48]
    movaps  %xmm4, [IV+ 64]
    movaps  %xmm5, [IV+ 80]
    movaps  %xmm6, [IV+ 96]
    movaps  %xmm7, [IV+112]
    movups  [%ecx+  0], %xmm0
    movups  [%ecx+ 16], %xmm1
    movups  [%ecx+ 32], %xmm2
    movups  [%ecx+ 48], %xmm3
    movups  [%ecx+ 64], %xmm4
    movups  [%ecx+ 80], %xmm5
    movups  [%ecx+ 96], %xmm6
    movups  [%ecx+112], %xmm7
    ret
    .size   luffa384_init, .-luffa384_init

.text
	.globl	luffa384
	.type	luffa384, @function
	.align	16
luffa384:
	mov	%ecx, DWORD PTR [%esp+4]
	mov	%eax, DWORD PTR [%esp+12]
	movups	%xmm0, XMMWORD PTR [%ecx]
	movups	%xmm1, XMMWORD PTR [%ecx+16]
	movups	%xmm2, XMMWORD PTR [%ecx+32]
	movups	%xmm3, XMMWORD PTR [%ecx+48]
	movups	%xmm4, XMMWORD PTR [%ecx+64]
	movups	%xmm5, XMMWORD PTR [%ecx+80]
	movups	%xmm6, XMMWORD PTR [%ecx+96]
	movups	%xmm7, XMMWORD PTR [%ecx+112]
	movaps	XMMWORD PTR [buffer+32], %xmm2
	movaps	XMMWORD PTR [buffer+48], %xmm3

	mov	%ecx, DWORD PTR[%esp+8]
.RND:
	ROUND	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%ecx
	add	%ecx, 32
	sub	%eax, 1
	jnz	.RND

	OUTPUT	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%ecx

	ret
	.size	luffa384, .-luffa384

    .globl  luffa384_final
    .type   luffa384_final, @function
    .align  16
luffa384_final:
	mov	%ecx, DWORD PTR [%esp+4]
	movups	%xmm0, XMMWORD PTR [%ecx]
	movups	%xmm1, XMMWORD PTR [%ecx+16]
	movups	%xmm2, XMMWORD PTR [%ecx+32]
	movups	%xmm3, XMMWORD PTR [%ecx+48]
	movups	%xmm4, XMMWORD PTR [%ecx+64]
	movups	%xmm5, XMMWORD PTR [%ecx+80]
	movups	%xmm6, XMMWORD PTR [%ecx+96]
	movups	%xmm7, XMMWORD PTR [%ecx+112]
	movaps	XMMWORD PTR [buffer+32], %xmm2
	movaps	XMMWORD PTR [buffer+48], %xmm3

	ROUND_FINAL	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7
	OUTPUT_FINAL	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%ecx

	ROUND_FINAL	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7
	OUTPUT_FINAL2	%xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%ecx
	ret
	.size	luffa384_final, .-luffa384_final



.globl  luffa256_init
    .type   luffa256_init, @function
    .align  16
luffa256_init:
	ret
	.size	luffa256_init, .-luffa256_init

	.globl  luffa512_init
    .type   luffa512_init, @function
    .align  16
luffa512_init:
	ret
	.size	luffa512_init, .-luffa512_init

.globl  luffa256
    .type   luffa256, @function
    .align  16
luffa256:
	ret
	.size	luffa256, .-luffa256

.globl  luffa512
    .type   luffa512_final, @function
    .align  16
luffa512:	
	ret
	.size	luffa512, .-luffa512

.globl  luffa256_final
.type   luffa256_final, @function
    .align  16
luffa256_final:
	ret
	.size	luffa256_final, .-luffa256_final

.globl  luffa512_final
    .type   luffa512_final, @function
    .align  16
luffa512_final:
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
psmask:
	.long	0x03010200,0x07050604,0x0b090a08,0x0f0d0e0c
	.long	0x00f000f0,0x00f000f0,0x00f000f0,0x00f000f0
	.long	0x0c0c0c0c,0x0c0c0c0c,0x0c0c0c0c,0x0c0c0c0c
	.long	0x22222222,0x22222222,0x22222222,0x22222222
	.long	0x05040100,0x07060302,0x0d0c0908,0x0f0e0b0a
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


	.globl	IV
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

RND_CNS:
	//RND1
	.byte 0xa0,0x46,0xff,0xe4,0xa9,0x32,0x5b,0x22
	.byte 0x8c,0xc9,0x87,0xd4,0x5a,0x2b,0xb4,0xf6
	.byte 0x42,0x00,0xd0,0xdd,0x51,0xe4,0xb5,0x06
	.byte 0x6a,0xb2,0x57,0x8f,0x8e,0xba,0xab,0xc4
	//RND2
	.byte 0x00,0x84,0x66,0x9b,0x94,0x8f,0x36,0x3f
	.byte 0xf0,0xec,0xeb,0x83,0x2d,0x3e,0x69,0xb0
	.byte 0x42,0x0f,0x40,0x4d,0x5f,0x18,0xe9,0x28
	.byte 0xcd,0xfa,0xf6,0x5a,0x49,0x13,0x6e,0xa6
	//RND3
	.byte 0xe2,0xdb,0x54,0x0d,0x33,0x42,0x84,0x5d
	.byte 0xb6,0x90,0x31,0xe0,0xd4,0x46,0x83,0x62
	.byte 0x93,0xff,0xbf,0x2d,0x8a,0xe9,0x15,0x84
	.byte 0xa0,0xad,0x41,0xfb,0xb0,0x24,0xc8,0x63
	//RND4
	.byte 0x80,0x3f,0x0b,0x59,0x30,0xe3,0x4f,0x89
	.byte 0x62,0xb6,0x4d,0x3c,0xd2,0xd9,0x9b,0x8e
	.byte 0x59,0x4e,0x2f,0xb2,0x2b,0x5a,0xe4,0x18
	.byte 0x63,0xa0,0x70,0x4c,0xd5,0xbd,0xf9,0xc5
	//RND5
	.byte 0x54,0x59,0xef,0x42,0xac,0xe4,0xea,0x06
	.byte 0x8a,0x22,0x6b,0x44,0xdb,0x9b,0x44,0x92
	.byte 0x81,0xcb,0xde,0x9d,0x6c,0xb0,0x58,0x56
	.byte 0xce,0xd3,0x39,0x72,0x94,0x67,0x94,0xfb
	//RND6
	.byte 0x24,0x76,0x79,0xed,0x64,0x8c,0xe6,0xe8
	.byte 0x92,0x8a,0x00,0x69,0x29,0xd9,0xb9,0x46
	.byte 0x74,0xac,0xeb,0x23,0xa2,0x43,0xbd,0xa5
	.byte 0xf4,0x3e,0xf1,0x34,0x2e,0x69,0xb5,0x99
	//RND7
	.byte 0x35,0xf9,0xa6,0x74,0xb9,0xb4,0x81,0xeb
	.byte 0x46,0x92,0x57,0x0d,0xd2,0x24,0x04,0xb4
	.byte 0x78,0xa7,0x7c,0x08,0x04,0x7c,0x40,0x5e
	.byte 0x97,0x14,0xe3,0xf2,0xd7,0xcd,0x54,0xb6
	//RND8
	.byte 0xd8,0x01,0xc9,0xd2,0x4d,0x8e,0xb0,0xf5
	.byte 0xb3,0x36,0xa1,0x53,0x30,0xa6,0x67,0x00
	.byte 0x1a,0x30,0xe7,0xb4,0x72,0x48,0x74,0x88
	.byte 0xba,0x57,0x50,0xeb,0x4d,0x1f,0x49,0x5c


TESTMSG:
	.byte	0x61,0x62,0x63,0x80,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
TESTMSG2:
        .byte	0x61,0x62,0x63,0x64,0x65,0x66,0x67,0x68
        .byte	0x69,0x70,0x71,0x72,0x73,0x74,0x75,0x76
        .byte	0x77,0x78,0x79,0x80,0x81,0x82,0x83,0x84
        .byte	0x85,0x86,0x87,0x88,0x89,0x90,0x91,0x80
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

.section .data
	.align	32
buffer:
	.space	128
