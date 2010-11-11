/*
* Luffa Implementation
* Copyright (C) 2009-2010 LCA-IC-UNICAMP (Thomaz Oliveira and Julio Lopez)
*
* This file is part of the cryptographic software developed by
* the Applied Cryptographic Lab at the University of Campinas.
*
* This software is legal property of its developers and
* is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
* Lesser General Public License for more details.
*
* LCA-IC-UNICAMP is  the owner of this software and hereby grant
* the U.S. Government and any interested party the right to use this
* software for the purposes of the SHA-3 evaluation process.
*
* You should have received a copy of the GNU Lesser General Public License
* along with this software. If not, see<http://www.gnu.org/licenses/>.
*/

.intel_syntax

#Steps for perfect shuffle

.macro mPSSTEPI r0,r1,mask
	pshufb \r0, \mask
	pshufb \r1, \mask
.endm

.macro mPSSTEPII r0,r1,raux0,raux1,raux2,raux3
	movaps \raux0, \r0
	movaps \raux1, \r0
	movaps \raux2, \r1
	movaps \raux3, \r1
	andps \raux0, maskShuffle
	andps \raux1, maskShuffle+16
	andps \raux2, maskShuffle
	andps \raux3, maskShuffle+16
	andps \r0, maskShuffle+32
	andps \r1, maskShuffle+32
	pslld \raux0, 12
	pslld \raux2, 12
	psrld \raux1, 12
	psrld \raux3, 12
	xorps \r0, \raux0
	xorps \r0, \raux1
	xorps \r1, \raux2
	xorps \r1, \raux3
.endm

.macro mPSSTEPIII r0,r1,raux0,raux1,raux2,raux3
	movaps \raux0, \r0
	movaps \raux1, \r0
	movaps \raux2, \r1
	movaps \raux3, \r1
	andps \raux0, maskShuffle+48
	andps \raux1, maskShuffle+64
	andps \raux2, maskShuffle+48
	andps \raux3, maskShuffle+64
	andps \r0, maskShuffle+80
	andps \r1, maskShuffle+80
	pslld \raux0, 6
	pslld \raux2, 6
	psrld \raux1, 6
	psrld \raux3, 6
	xorps \r0, \raux0
	xorps \r0, \raux1
	xorps \r1, \raux2
	xorps \r1, \raux3
.endm

.macro mPSSTEPIV r0,r1,raux0,raux1,raux2,raux3
	movaps \raux0, \r0
	movaps \raux1, \r0
	movaps \raux2, \r1
	movaps \raux3, \r1
	andps \raux0, maskShuffle+96
	andps \raux1, maskShuffle+112
	andps \raux2, maskShuffle+96
	andps \raux3, maskShuffle+112
	andps \r0, maskShuffle+128
	andps \r1, maskShuffle+128
	psllw \raux0, 3
	psllw \raux2, 3
	psrlw \raux1, 3
	psrlw \raux3, 3	
	xorps \r0, \raux0
	xorps \r0, \raux1
	xorps \r1, \raux2
	xorps \r1, \raux3
.endm

#Perfect Shuffle

.macro mPS r0, r1, raux0, raux1, raux2, raux3
	mPSSTEPI \r0, \r1, maskShufLittleEndian
	mPSSTEPII \r0, \r1, \raux0, \raux1, \raux2, \raux3
	mPSSTEPIII \r0, \r1, \raux0, \raux1, \raux2, \raux3
	mPSSTEPIV \r0, \r1, \raux0, \raux1, \raux2, \raux3			
.endm

#Unshuffle

.macro mPuS r0, r1, raux0, raux1, raux2, raux3
	mPSSTEPIV \r0, \r1, \raux0, \raux1, \raux2, \raux3
	mPSSTEPIII \r0, \r1, \raux0, \raux1, \raux2, \raux3
	mPSSTEPII \r0, \r1, \raux0, \raux1, \raux2, \raux3
	mPSSTEPI \r0, \r1, maskUnShuffle
.endm

#Multiplication by 2 in Message Injection phase

.macro mMIMult2 r0, r1, raux0, raux1
	movaps \raux0, maskMIMult2
	movaps \raux1, maskMIMult2
	andps \raux0, \r0
	xorps \r0, \raux0
	pslld \r0, 1
	andps \raux1, \r1	
	xorps \r1, \raux1	
	pslld \r1, 1
	psrld \raux0, 3
	xorps \r1, \raux0
	xorps \r0, \raux1
	psrld \raux1, 2
	xorps \r0, \raux1
	psrld \raux1, 1
	xorps \r0, \raux1
	xorps \r1, \raux1
.endm

#Message Injection
.macro mMI r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, rbuf0, rbuf1, rtmp0, rtmp1, raux0, raux1
	movaps \rtmp0, \r0
	movaps \rtmp1, \r1
	xorps \rtmp0, \r2
	xorps \rtmp1, \r3
	xorps \rtmp0, \r4
	xorps \rtmp1, \r5
	xorps \rtmp0, \r6
	xorps \rtmp1, \r7
	xorps \rtmp0, \r8
	xorps \rtmp1, \r9
	mMIMult2 \rtmp0, \rtmp1, \raux0, \raux1
	xorps \r0, \rtmp0
	xorps \r1, \rtmp1
	xorps \r2, \rtmp0
	xorps \r3, \rtmp1
	xorps \r4, \rtmp0
	xorps \r5, \rtmp1
	xorps \r6, \rtmp0
	xorps \r7, \rtmp1
	xorps \r8, \rtmp0
	xorps \r9, \rtmp1

	movaps \rtmp0, \r0
	movaps \rtmp1, \r1
	mMIMult2 \r0, \r1, \raux0, \raux1
	xorps \r0, \r2
	xorps \r1, \r3
	mMIMult2 \r2, \r3, \raux0, \raux1
	xorps \r2, \r4
	xorps \r3, \r5
	mMIMult2 \r4, \r5, \raux0, \raux1
	xorps \r4, \r6
	xorps \r5, \r7
	mMIMult2 \r6, \r7, \raux0, \raux1
	xorps \r6, \r8
	xorps \r7, \r9
	mMIMult2 \r8, \r9, \raux0, \raux1
	xorps \r8, \rtmp0
	xorps \r9, \rtmp1

	movaps \rtmp0, \r8
	movaps \rtmp1, \r9
	mMIMult2 \r8, \r9, \raux0, \raux1
	xorps \r8, \r6
	xorps \r9, \r7
	mMIMult2 \r6, \r7, \raux0, \raux1
	xorps \r6, \r4
	xorps \r7, \r5
	mMIMult2 \r4, \r5, \raux0, \raux1
	xorps \r4, \r2
	xorps \r5, \r3
	mMIMult2 \r2, \r3, \raux0, \raux1
	xorps \r2, \r0
	xorps \r3, \r1
	mMIMult2 \r0, \r1, \raux0, \raux1
	xorps \r0, \rtmp0
	xorps \r1, \rtmp1
	
	xorps \r0, \rbuf0
	xorps \r1, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	xorps \r2, \rbuf0
	xorps \r3, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	xorps \r4, \rbuf0
	xorps \r5, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	xorps \r6, \rbuf0
	xorps \r7, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	xorps \r8, \rbuf0
	xorps \r9, \rbuf1
.endm

#Serial-Par 
.macro mSerialPar rch0, rch2, rch4, rch6, raux0, tch0, tch1, tch2, tch3
	#0
	movaps \tch0, \rch0
	andps \tch0, maskParSerial
	movaps \raux0, \rch2
	andps \raux0, maskParSerial
	psllq \raux0, 1
	orps \tch0, \raux0
	movaps \raux0, \rch4
	andps \raux0, maskParSerial
	psllq \raux0, 2
	orps \tch0, \raux0
	movaps \raux0, \rch6
	andps \raux0, maskParSerial
	psllq \raux0, 3
	orps \tch0, \raux0

	#1
	movaps \tch1, \rch2
	andps \tch1, maskParSerial+16
	movaps \raux0, \rch0
	andps \raux0, maskParSerial+16
	psrlq \raux0, 1
	orps \tch1, \raux0
	movaps \raux0, \rch4
	andps \raux0, maskParSerial+16
	psllq \raux0, 1
	orps \tch1, \raux0
	movaps \raux0, \rch6
	andps \raux0, maskParSerial+16
	psllq \raux0, 2
	orps \tch1, \raux0

	#2
	movaps \tch2, \rch4
	andps \tch2, maskParSerial+32
	movaps \raux0, \rch0
	andps \raux0, maskParSerial+32
	psrlq \raux0, 2
	orps \tch2, \raux0
	movaps \raux0, \rch2
	andps \raux0, maskParSerial+32
	psrlq \raux0, 1
	orps \tch2, \raux0
	movaps \raux0, \rch6
	andps \raux0, maskParSerial+32
	psllq \raux0, 1
	orps \tch2, \raux0
	
	#3
	movaps \tch3, \rch6
	andps \tch3, maskParSerial+48
	movaps \raux0, \rch0
	andps \raux0, maskParSerial+48
	psrlq \raux0, 3
	orps \tch3, \raux0
	movaps \raux0, \rch2
	andps \raux0, maskParSerial+48
	psrlq \raux0, 2
	orps \tch3, \raux0
	movaps \raux0, \rch4
	andps \raux0, maskParSerial+48
	psrlq \raux0, 1
	orps \tch3, \raux0

	movaps \rch0, \tch0
	movaps \rch2, \tch1
	movaps \rch4, \tch2
	movaps \rch6, \tch3
.endm

#Par-Serial
.macro mParSerial rch0, rch2, rch4, rch6, raux0, tch0, tch1, tch2, tch3
	movaps \tch0, \rch0
	movaps \tch1, \rch2
	movaps \tch2, \rch4
	movaps \tch3, \rch6	
	
	#0
	movaps \rch0, \tch0
	andps \rch0, maskParSerial
	movaps \raux0, \tch1
	andps \raux0, maskParSerial
	psllq \raux0, 1
	orps \rch0, \raux0
	movaps \raux0, \tch2
	andps \raux0, maskParSerial
	psllq \raux0, 2
	orps \rch0, \raux0
	movaps \raux0, \tch3
	andps \raux0, maskParSerial
	psllq \raux0, 3
	orps \rch0, \raux0

	#2
	movaps \rch2, \tch1
	andps \rch2, maskParSerial+16
	movaps \raux0, \tch0
	andps \raux0, maskParSerial+16
	psrlq \raux0, 1
	orps \rch2, \raux0
	movaps \raux0, \tch2
	andps \raux0, maskParSerial+16
	psllq \raux0, 1
	orps \rch2, \raux0	
	movaps \raux0, \tch3
	andps \raux0, maskParSerial+16
	psllq \raux0, 2
	orps \rch2, \raux0

	#4
	movaps \rch4, \tch2
	andps \rch4, maskParSerial+32
	movaps \raux0, \tch0
	andps \raux0, maskParSerial+32
	psrlq \raux0, 2
	orps \rch4, \raux0
	movaps \raux0, \tch1
	andps \raux0, maskParSerial+32
	psrlq \raux0, 1
	orps \rch4, \raux0
	movaps \raux0, \tch3
	andps \raux0, maskParSerial+32
	psllq \raux0, 1
	orps \rch4, \raux0	

	#6
	movaps \rch6, \tch3
	andps \rch6, maskParSerial+48	
	movaps \raux0, \tch0
	andps \raux0, maskParSerial+48
	psrlq \raux0, 3
	orps \rch6, \raux0
	movaps \raux0, \tch1
	andps \raux0, maskParSerial+48
	psrlq \raux0, 2
	orps \rch6, \raux0
	movaps \raux0, \tch2
	andps \raux0, maskParSerial+48
	psrlq \raux0, 1
	orps \rch6, \raux0
.endm


#Tweak
.macro mTweak r0, r1, r2, r3, raux0
	pshufd \raux0, \r0, 108
	psrlq \raux0, 60	
	psllq \r0, 4
	xorps \r0, \raux0

	palignr \r1, \r1, 15

	pshufd \raux0, \r2, 108
	psrlq \raux0, 52	
	psllq \r2, 12
	xorps \r2, \raux0

	palignr \r3, \r3, 14
.endm

#SubCrumb
.macro mSubCrumb rch0, rch1, rch2, rch3, raux0
	movaps \raux0, \rch0
	orps \rch0, \rch1
	xorps \rch2, \rch3
	xorps \rch1, maskNOT
	xorps \rch0, \rch3
	andps \rch3, \raux0
	xorps \rch1, \rch3
	xorps \rch3, \rch2
	andps \rch2, \rch0
	xorps \rch0, maskNOT
	xorps \rch2, \rch1
	orps \rch1, \rch3
	xorps \raux0, \rch1
	xorps \rch3, \rch2
	andps \rch2, \rch1
	xorps \rch1, \rch0
	movaps \rch0, \raux0
.endm

#SubCrumb512
.macro mSubCrumb512 r0, raux0, raux1, table0, table1
	movaps \raux0, \r0
	andps \r0, maskSubCrumb
	xorps \raux0, \r0
	psrld \raux0, 4
	movaps \raux1, \table0
	pshufb \raux1, \r0
	movaps \r0, \table1
	pshufb \r0, \raux0
	xorps \r0, \raux1
.endm

#MixWord
.macro mMixWord rch0, rch1, raux0
	xorps \rch1, \rch0
	palignr \rch0, \rch0, 15
	xorps \rch0, \rch1
	palignr \rch1, \rch1, 9
	xorps \rch1, \rch0
	palignr \rch0, \rch0, 11
	xorps \rch0, \rch1
	pshufd \raux0, \rch1, 108
	psrlq \raux0, 60
	psllq \rch1, 4
	xorps \rch1, \raux0
.endm

#Step
.macro mSTEP rch0, rch1, rch2, rch3, rch4, rch5, rch6, rch7, rch8, rch9, raux0, raux1, numCST
	mSubCrumb \rch0, \rch1, \rch2, \rch3, \raux0
	mSubCrumb \rch5, \rch6, \rch7, \rch4, \raux0

	mSubCrumb512 \rch8, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16	
	mSubCrumb512 \rch9, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48

	mMixWord \rch0, \rch4, \raux0	
	mMixWord \rch1, \rch5, \raux0
	xorps \rch0, CONSTS+\numCST
	mMixWord \rch2, \rch6, \raux0
	xorps \rch4, CONSTS+\numCST+16
	mMixWord \rch3, \rch7, \raux0
	mMixWord \rch8, \rch9, \raux0
	xorps \rch8, CONSTS+\numCST+32
	xorps \rch9, CONSTS+\numCST+48
		
.endm

#Round function
	.type fRound, @function
	.align 16
fRound:
	mPS %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15
	mMI %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15

	mTweak %xmm3, %xmm5, %xmm7, %xmm9, %xmm10

	mSerialPar %xmm0, %xmm2, %xmm4, %xmm6, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14
	mSerialPar %xmm1, %xmm3, %xmm5, %xmm7, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14

	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 0
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 64
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 128
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 192
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 256
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 320
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 384
	mSTEP %xmm0, %xmm2, %xmm4, %xmm6, %xmm1, %xmm3, %xmm5, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, 448

	mParSerial %xmm0, %xmm2, %xmm4, %xmm6, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14
	mParSerial %xmm1, %xmm3, %xmm5, %xmm7, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14

	ret
	.size fRound, .-fRound

#Padding function

	.type fPadding, @function
	.align 16
fPadding:
	movups %xmm10, [%rdi]
	movups %xmm11, [%rdi+16]
	movaps [buffer], %xmm10
	movaps [buffer+16], %xmm11

	mov byte ptr[buffer+%rdx], 0x80
	addq %rdx, 1

	cmp %rdx, 32
	je phEndPadding
phZero:	
	mov byte ptr[buffer+%rdx], 0x00
	addq %rdx, 1
	cmp %rdx, 32
	jl phZero
	
phEndPadding:
	movups %xmm10, [buffer]
	movups %xmm11, [buffer+16]
	
	call fRound
	ret	
	.size fPadding, .-fPadding

#Finalization

	.type fFinalization, @function
	.align 16
fFinalization:
	xorps %xmm10, %xmm10
	xorps %xmm11, %xmm11
	call fRound

	movaps %xmm14, %xmm0
	movaps %xmm15, %xmm1
	xorps %xmm14, %xmm2
	xorps %xmm15, %xmm3
	xorps %xmm14, %xmm4
	xorps %xmm15, %xmm5
	xorps %xmm14, %xmm6
	xorps %xmm15, %xmm7
	xorps %xmm14, %xmm8
	xorps %xmm15, %xmm9

	movaps [buffer], %xmm14
	movaps [buffer+16], %xmm15

	xorps %xmm10, %xmm10
	xorps %xmm11, %xmm11
	call fRound

	xorps %xmm2, %xmm0
	xorps %xmm3, %xmm1
	xorps %xmm2, %xmm4
	xorps %xmm3, %xmm5
	xorps %xmm2, %xmm6
	xorps %xmm3, %xmm7
	xorps %xmm2, %xmm8
	xorps %xmm3, %xmm9
	
	movaps %xmm0, [buffer]
	movaps %xmm1, [buffer+16]

	mPuS %xmm0, %xmm1, %xmm4, %xmm5, %xmm6, %xmm7
	mPuS %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7

	ret
	.size fFinalization, .-fFinalization

#Luffa-512 Main function

	.globl fLuffa512
	.type fLuffa512, @function
	.align 16
fLuffa512:
	#Initialize chaining variables
	movaps %xmm0, [IV]
	movaps %xmm1, [IV+16]
	movaps %xmm2, [IV+32]
	movaps %xmm3, [IV+48]
	movaps %xmm4, [IV+64]
	movaps %xmm5, [IV+80]
	movaps %xmm6, [IV+96]
	movaps %xmm7, [IV+112]	
	movaps %xmm8, [IV+128]
	movaps %xmm9, [IV+144]
	
	#Absorbing phase
	movq %rcx, %rdi

	cmp %rdx, 32
	jl phPadding
phAbsorb:
	movups %xmm10, [%rdi]
	movups %xmm11, [%rdi+16]
	sub %rdx, 32
	add %rdi, 32
	call fRound	
	cmp %rdx, 32
	jge phAbsorb

phPadding:
	call fPadding
	call fFinalization

	movq %rdi, %rcx
	movups [%rsi], %xmm0
	movups [%rsi+16], %xmm1
	movups [%rsi+32], %xmm2
	movups [%rsi+48], %xmm3

	ret
	.size fLuffa512, .-fLuffa512

.section .rodata
	.align 16
maskShufLittleEndian:
	.byte 0x03, 0x0B, 0x07, 0x0F, 0x02, 0x0A, 0x06, 0x0E, 0x01, 0x09, 0x05, 0x0D, 0x00, 0x08, 0x04, 0x0C
maskShuffle:
	.long 0x0000F0F0, 0x0000F0F0, 0x0000F0F0, 0x0000F0F0
	.long 0x0F0F0000, 0x0F0F0000, 0x0F0F0000, 0x0F0F0000
	.long 0xF0F00F0F, 0xF0F00F0F, 0xF0F00F0F, 0xF0F00F0F
	.long 0x00CC00CC, 0x00CC00CC, 0x00CC00CC, 0x00CC00CC
	.long 0x33003300, 0x33003300, 0x33003300, 0x33003300
	.long 0xCC33CC33, 0xCC33CC33, 0xCC33CC33, 0xCC33CC33
	.long 0x0A0A0A0A, 0x0A0A0A0A, 0x0A0A0A0A, 0x0A0A0A0A
	.long 0x50505050, 0x50505050, 0x50505050, 0x50505050
	.long 0xA5A5A5A5, 0xA5A5A5A5, 0xA5A5A5A5, 0xA5A5A5A5
maskUnShuffle:
	.byte 0x0C, 0x08, 0x04, 0x00, 0x0E, 0x0A, 0x06, 0x02, 0x0D, 0x09, 0x05, 0x01, 0x0F, 0x0B, 0x07, 0x03	
maskMIMult2:
	.long 0x88888888, 0x88888888, 0x88888888, 0x88888888
maskParSerial:
	.long 0x11111111, 0x11111111, 0x11111111, 0x11111111
	.long 0x22222222, 0x22222222, 0x22222222, 0x22222222
	.long 0x44444444, 0x44444444, 0x44444444, 0x44444444
	.long 0x88888888, 0x88888888, 0x88888888, 0x88888888
maskNOT:
	.long 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
maskSubCrumb:
	.long 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F
tableSubCrumb:
	.byte 0x0D, 0x0E, 0x00, 0x01, 0x05, 0x0A, 0x07, 0x06, 0x0B, 0x03, 0x09, 0x0C, 0x0F, 0x08, 0x02, 0x04
	.byte 0xD0, 0xE0, 0x00, 0x10, 0x50, 0xA0, 0x70, 0x60, 0xB0, 0x30, 0x90, 0xC0, 0xF0, 0x80, 0x20, 0x40
	.byte 0x0B, 0x07, 0x0D, 0x06, 0x00, 0x03, 0x02, 0x09, 0x0A, 0x0F, 0x05, 0x01, 0x0E, 0x04, 0x0C, 0x08
	.byte 0xB0, 0x70, 0xD0, 0x60, 0x00, 0x30, 0x20, 0x90, 0xA0, 0xF0, 0x50, 0x10, 0xE0, 0x40, 0xC0, 0x80
	
	.align 32
	.type IV, @object
	.size IV, 160
IV:
	.long 0x6bf41c09, 0x86435d56, 0xe8fa49c9, 0x8f18d7c9
	.long 0xa2efc28d, 0x40382206, 0x889a1e87, 0xed5addd0
	.long 0xd2c303a9, 0xe76ad8bd, 0x7653c568, 0xbf4ea893
	.long 0xa123457b, 0xce084f4d, 0x3a85fc13, 0x6d897f67
	.long 0x74411d0f, 0x974ade22, 0x39b2393d, 0x9393af1b
	.long 0x89a25bf9, 0x0843b0c5, 0x42e06bd2, 0x826086b9
	.long 0x7f852fed, 0x655fafcd, 0x3e4682ae, 0x54e20725
	.long 0x8930d8b2, 0x6aec7182, 0xfa6ced93, 0x0a9f8f23
	.long 0x5cb115fc, 0x595636ed, 0xabd8968c, 0xc792fba8
	.long 0xfea3d483, 0x28d1bc01, 0xbfc59371, 0x515523ab

	.align 32
	.type CONSTS, @object
	.size CONSTS, 512
CONSTS:
	.long 0xf6b42b5a, 0xd487c98c, 0x225b32a9, 0xe4ff46a0
	.long 0xc4abba8e, 0x8f57b26a, 0x06b5e451, 0xddd00042
	.long 0x11100011, 0x11101001, 0x11010010, 0x11110000
	.long 0x01110111, 0x11010101, 0x10010000, 0x01010000

	.long 0xb0693e2d, 0x83ebecf0, 0x3f368f94, 0x9b668400
	.long 0xa66e1349, 0x5af6facd, 0x28e9185f, 0x4d400f42
	.long 0x11111010, 0x11010111, 0x00010001, 0x10101100
	.long 0x10101011, 0x00100101, 0x00011001, 0x00101101
	.long 0x628346d4, 0xe03190b6, 0x5d844233, 0x0d54dbe2
	.long 0x63c824b0, 0xfb41ada0, 0x8415e98a, 0x2dbfff93
	.long 0x11110010, 0x01100110, 0x11001011, 0x00011011
	.long 0x10101100, 0x10010110, 0x01100100, 0x10110100
	.long 0x8e9bd9d2, 0x3c4db662, 0x894fe330, 0x590b3f80
	.long 0xc5f9bdd5, 0x4c70a063, 0x18e45a2b, 0xb22f4e59
	.long 0x11001001, 0x10011011, 0x00101101, 0x01101111
	.long 0x10110000, 0x01011010, 0x10010010, 0x11010001
	.long 0x92449bdb, 0x446b228a, 0x06eae4ac, 0x42ef5954
	.long 0xfb946794, 0x7239d3ce, 0x5658b06c, 0x9ddecb81
	.long 0x01001001, 0x00100110, 0x01100000, 0x01111000
	.long 0x10110110, 0x00011010, 0x00010011, 0x00101001
	.long 0x46b9d929, 0x69008a92, 0xe8e68c64, 0xed797624
	.long 0x99b5692e, 0x34f13ef4, 0xa5bd43a2, 0x23ebac74
	.long 0x01010010, 0x11101001, 0x11011010, 0x10001110
	.long 0x11000011, 0x01010011, 0x11000000, 0x00001111
	.long 0xb40424d2, 0x0d579246, 0xeb81b4b9, 0x74a6f935
	.long 0xb654cdd7, 0xf2e31497, 0x5e407c04, 0x087ca778
	.long 0x01001000, 0x10100101, 0x01101011, 0x00111011
	.long 0x00001100, 0x01001111, 0x00000001, 0x00111111
	.long 0x0067a630, 0x53a136b3, 0xf5b08e4d, 0xd2c901d8
	.long 0x5c491f4d, 0xeb5057ba, 0x88744872, 0xb4e7301a
	.long 0x00100000, 0x10010101, 0x10101110, 0x11101101
	.long 0x00110001, 0x00111100, 0x00000101, 0x11111100

.section .data
	.align 16
buffer:
	.space 32
