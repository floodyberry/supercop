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
	movaps \raux0, \r0
	movaps \raux1, \r1
	andps \raux0, maskMIMult2
	andps \raux1, maskMIMult2
	xorps \r0, \raux0
	xorps \r1, \raux1
	pslld \r0, 1
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

.macro mMI r0, r1, r2, r3, r4, r5, rbuf0, rbuf1, rtmp0, rtmp1, raux0, raux1
	movaps \rtmp0, \r0
	movaps \rtmp1, \r1
	xorps \rtmp0, \r2
	xorps \rtmp1, \r3
	xorps \rtmp0, \r4
	xorps \rtmp1, \r5
	mMIMult2 \rtmp0, \rtmp1, \raux0, \raux1
	xorps \r0, \rbuf0
	xorps \r1, \rbuf1
	xorps \r0, \rtmp0
	xorps \r1, \rtmp1	
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	xorps \r2, \rtmp0
	xorps \r3, \rtmp1
	xorps \r2, \rbuf0
	xorps \r3, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	xorps \r4, \rtmp0
	xorps \r5, \rtmp1
	xorps \r4, \rbuf0
	xorps \r5, \rbuf1
.endm

#Serial-Par 
.macro mSerialPar rch0, rch1, rch2, rch3, rch4, rch5, raux0, tch0, tch1, tch2, tch3, tch4, tch5, tch6, tch7
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

	#4
	movaps \tch4, \rch1
	andps \tch4, maskParSerial
	movaps \raux0, \rch3
	andps \raux0, maskParSerial
	psllq \raux0, 1
	orps \tch4, \raux0
	movaps \raux0, \rch5
	andps \raux0, maskParSerial
	psllq \raux0, 2
	orps \tch4, \raux0

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

	#5
	movaps \tch5, \rch3
	andps \tch5, maskParSerial+16
	movaps \raux0, \rch1
	andps \raux0, maskParSerial+16
	psrlq \raux0, 1
	orps \tch5, \raux0
	movaps \raux0, \rch5
	andps \raux0, maskParSerial+16
	psllq \raux0, 1
	orps \tch5, \raux0

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

	#6
	movaps \tch6, \rch5
	andps \tch6, maskParSerial+32
	movaps \raux0, \rch1
	andps \raux0, maskParSerial+32
	psrlq \raux0, 2
	orps \tch6, \raux0
	movaps \raux0, \rch3
	andps \raux0, maskParSerial+32
	psrlq \raux0, 1
	orps \tch6, \raux0

	#3
	movaps \tch3, \rch0
	andps \tch3, maskParSerial+48
	psrlq \tch3, 3
	movaps \raux0, \rch2
	andps \raux0, maskParSerial+48
	psrlq \raux0, 2
	orps \tch3, \raux0
	movaps \raux0, \rch4
	andps \raux0, maskParSerial+48
	psrlq \raux0, 1
	orps \tch3, \raux0

	#7
	movaps \tch7, \rch1
	andps \tch7, maskParSerial+48
	psrlq \tch7, 3
	movaps \raux0, \rch3
	andps \raux0, maskParSerial+48
	psrlq \raux0, 2
	orps \tch7, \raux0
	movaps \raux0, \rch5
	andps \raux0, maskParSerial+48
	psrlq \raux0, 1
	orps \tch7, \raux0

	movaps \rch0, \tch0
	movaps \rch1, \tch1
	movaps \rch2, \tch2
	movaps \rch3, \tch3
	movaps \rch4, \tch4
	movaps \rch5, \tch5
	movaps \raux0, \tch6
	movaps \tch0, \tch7
.endm

#Par-Serial
.macro mParSerial rch0, rch1, rch2, rch3, rch4, rch5, raux0, tch0, tch1, tch2, tch3, tch4, tch5, tch6, tch7
	movaps \tch7, \tch0
	movaps \tch6, \raux0
	movaps \tch5, \rch5
	movaps \tch4, \rch4
	movaps \tch3, \rch3
	movaps \tch2, \rch2
	movaps \tch1, \rch1
	movaps \tch0, \rch0
	
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

	#1
	movaps \rch1, \tch4
	andps \rch1, maskParSerial
	movaps \raux0, \tch5
	andps \raux0, maskParSerial
	psllq \raux0, 1
	orps \rch1, \raux0
	movaps \raux0, \tch6
	andps \raux0, maskParSerial
	psllq \raux0, 2
	orps \rch1, \raux0
	movaps \raux0, \tch7
	andps \raux0, maskParSerial
	psllq \raux0, 3
	orps \rch1, \raux0

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

	#3
	movaps \rch3, \tch5
	andps \rch3, maskParSerial+16
	movaps \raux0, \tch4
	andps \raux0, maskParSerial+16
	psrlq \raux0, 1
	orps \rch3, \raux0
	movaps \raux0, \tch6
	andps \raux0, maskParSerial+16
	psllq \raux0, 1
	orps \rch3, \raux0	
	movaps \raux0, \tch7
	andps \raux0, maskParSerial+16
	psllq \raux0, 2
	orps \rch3, \raux0

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

	#5
	movaps \rch5, \tch6
	andps \rch5, maskParSerial+32
	movaps \raux0, \tch4
	andps \raux0, maskParSerial+32
	psrlq \raux0, 2
	orps \rch5, \raux0
	movaps \raux0, \tch5
	andps \raux0, maskParSerial+32
	psrlq \raux0, 1
	orps \rch5, \raux0
	movaps \raux0, \tch7
	andps \raux0, maskParSerial+32
	psllq \raux0, 1
	orps \rch5, \raux0
.endm


#Tweak
.macro mTweak r0, r1, raux0
	pshufd \raux0, \r0, 108
	psrlq \raux0, 60	
	psllq \r0, 4
	xorps \r0, \raux0
	palignr \r1, \r1, 15
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
.macro mSTEP rch0, rch1, rch2, rch3, rch4, rch5, rch6, rch7, raux0, numCST
	mSubCrumb \rch0, \rch1, \rch2, \rch3, \raux0
	mSubCrumb \rch5, \rch6, \rch7, \rch4, \raux0

	mMixWord \rch0, \rch4, \raux0	
	mMixWord \rch1, \rch5, \raux0
	xorps \rch0, CONSTS+\numCST
	mMixWord \rch2, \rch6, \raux0
	xorps \rch4, CONSTS+\numCST+16
	mMixWord \rch3, \rch7, \raux0
.endm

#Round function
	.type fRound, @function
	.align 16
fRound:
	mPS %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11
	mMI %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11

	mTweak %xmm3, %xmm5, %xmm6

	mSerialPar %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14

	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 0
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 32
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 64
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 96
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 128
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 160
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 192
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, 224

	mParSerial %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14

	ret
	.size fRound, .-fRound

#Padding function

	.type fPadding, @function
	.align 16
fPadding:
	movups %xmm6, [%rdi]
	movups %xmm7, [%rdi+16]
	movaps [buffer], %xmm6
	movaps [buffer+16], %xmm7

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
	movups %xmm6, [buffer]
	movups %xmm7, [buffer+16]
	
	call fRound
	ret	
	.size fPadding, .-fPadding

#Finalization

	.type fFinalization, @function
	.align 16
fFinalization:
	xorps %xmm6, %xmm6
	xorps %xmm7, %xmm7

	call fRound

	xorps %xmm0, %xmm2
	xorps %xmm1, %xmm3
	xorps %xmm0, %xmm4
	xorps %xmm1, %xmm5

	mPuS %xmm0, %xmm1, %xmm6, %xmm7, %xmm8, %xmm9

	ret
	.size fFinalization, .-fFinalization

#Luffa-256 Main function

	.globl fLuffa256
	.type fLuffa256, @function
	.align 16
fLuffa256:
	#Initialize chaining variables
	movaps %xmm0, [IV]
	movaps %xmm1, [IV+16]
	movaps %xmm2, [IV+32]
	movaps %xmm3, [IV+48]
	movaps %xmm4, [IV+64]
	movaps %xmm5, [IV+80]
	
	#Absorbing phase
	movq %rcx, %rdi

	cmp %rdx, 32
	jl phPadding
phAbsorb:
	movups %xmm6, [%rdi]
	movups %xmm7, [%rdi+16]
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
	ret
	.size fLuffa256, .-fLuffa256

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
	
	.align 32
	.type IV, @object
	.size IV, 96
IV:
	.long 0x6bf41c09, 0x86435d56, 0xe8fa49c9, 0x8f18d7c9
	.long 0xa2efc28d, 0x40382206, 0x889a1e87, 0xed5addd0
	.long 0xd2c303a9, 0xe76ad8bd, 0x7653c568, 0xbf4ea893
	.long 0xa123457b, 0xce084f4d, 0x3a85fc13, 0x6d897f67
	.long 0x74411d0f, 0x974ade22, 0x39b2393d, 0x9393af1b
	.long 0x89a25bf9, 0x0843b0c5, 0x42e06bd2, 0x826086b9

	.align 32
	.type CONSTS, @object
	.size CONSTS, 256
CONSTS:
	.long 0x76342352, 0x54074104, 0x22533221, 0x64774620
	.long 0x44233206, 0x07573262, 0x06356451, 0x55500042
	.long 0x30613625, 0x03636470, 0x37360714, 0x13660400
	.long 0x26661341, 0x52767245, 0x20611057, 0x45400742
	.long 0x62034654, 0x60311036, 0x55044233, 0x05545362
	.long 0x63402430, 0x73412520, 0x04156102, 0x25377713
	.long 0x06135152, 0x34453662, 0x01476330, 0x51033700
	.long 0x45713555, 0x44702063, 0x10645223, 0x32274651
	.long 0x12441353, 0x44632202, 0x06626424, 0x42675154
	.long 0x73146714, 0x72315346, 0x56503064, 0x15564301
	.long 0x46315121, 0x61000212, 0x60660464, 0x65717624
	.long 0x11356126, 0x34713674, 0x25354322, 0x23632474
	.long 0x34042452, 0x05571246, 0x63013431, 0x74267135
	.long 0x36544557, 0x72631417, 0x56407404, 0x00742770
	.long 0x00672630, 0x53213633, 0x75300645, 0x52410150
	.long 0x54411745, 0x63505732, 0x00744072, 0x34673012

.section .data
	.align 16
buffer:
	.space 32
