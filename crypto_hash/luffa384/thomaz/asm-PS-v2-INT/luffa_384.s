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
	movdqa \raux0, \r0
	movdqa \raux1, \r0
	movdqa \raux2, \r1
	movdqa \raux3, \r1
	pand \raux0, maskShuffle
	pand \raux1, maskShuffle+16
	pand \raux2, maskShuffle
	pand \raux3, maskShuffle+16
	pand \r0, maskShuffle+32
	pand \r1, maskShuffle+32
	pslld \raux0, 12
	pslld \raux2, 12
	psrld \raux1, 12
	psrld \raux3, 12
	pxor \r0, \raux0
	pxor \r0, \raux1
	pxor \r1, \raux2
	pxor \r1, \raux3
.endm

.macro mPSSTEPIII r0,r1,raux0,raux1,raux2,raux3
	movdqa \raux0, \r0
	movdqa \raux1, \r0
	movdqa \raux2, \r1
	movdqa \raux3, \r1
	pand \raux0, maskShuffle+48
	pand \raux1, maskShuffle+64
	pand \raux2, maskShuffle+48
	pand \raux3, maskShuffle+64
	pand \r0, maskShuffle+80
	pand \r1, maskShuffle+80
	pslld \raux0, 6
	pslld \raux2, 6
	psrld \raux1, 6
	psrld \raux3, 6
	pxor \r0, \raux0
	pxor \r0, \raux1
	pxor \r1, \raux2
	pxor \r1, \raux3
.endm

.macro mPSSTEPIV r0,r1,raux0,raux1,raux2,raux3
	movdqa \raux0, \r0
	movdqa \raux1, \r0
	movdqa \raux2, \r1
	movdqa \raux3, \r1
	pand \raux0, maskShuffle+96
	pand \raux1, maskShuffle+112
	pand \raux2, maskShuffle+96
	pand \raux3, maskShuffle+112
	pand \r0, maskShuffle+128
	pand \r1, maskShuffle+128
	psllw \raux0, 3
	psllw \raux2, 3
	psrlw \raux1, 3
	psrlw \raux3, 3	
	pxor \r0, \raux0
	pxor \r0, \raux1
	pxor \r1, \raux2
	pxor \r1, \raux3
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
	movdqa \raux0, maskMIMult2
	movdqa \raux1, maskMIMult2
	pand \raux0, \r0
	pxor \r0, \raux0
	pslld \r0, 1
	pand \raux1, \r1	
	pxor \r1, \raux1	
	pslld \r1, 1
	psrld \raux0, 3
	pxor \r1, \raux0
	pxor \r0, \raux1
	psrld \raux1, 2
	pxor \r0, \raux1
	psrld \raux1, 1
	pxor \r0, \raux1
	pxor \r1, \raux1
.endm

#Message Injection

.macro mMI r0, r1, r2, r3, r4, r5, r6, r7, rbuf0, rbuf1, rtmp0, rtmp1, raux0, raux1
	movdqa \rtmp0, \r0
	movdqa \rtmp1, \r1
	pxor \rtmp0, \r2
	pxor \rtmp1, \r3
	pxor \rtmp0, \r4
	pxor \rtmp1, \r5
	pxor \rtmp0, \r6
	pxor \rtmp1, \r7
	mMIMult2 \rtmp0, \rtmp1, \raux0, \raux1
	pxor \r0, \rtmp0
	pxor \r1, \rtmp1
	pxor \r2, \rtmp0
	pxor \r3, \rtmp1
	pxor \r4, \rtmp0
	pxor \r5, \rtmp1
	pxor \r6, \rtmp0
	pxor \r7, \rtmp1

	movdqa \rtmp0, \r6
	movdqa \rtmp1, \r7
	mMIMult2 \r6, \r7, \raux0, \raux1
	pxor \r6, \r4
	pxor \r7, \r5
	mMIMult2 \r4, \r5, \raux0, \raux1
	pxor \r4, \r2
	pxor \r5, \r3
	mMIMult2 \r2, \r3, \raux0, \raux1
	pxor \r2, \r0
	pxor \r3, \r1
	mMIMult2 \r0, \r1, \raux0, \raux1
	pxor \r0, \rtmp0
	pxor \r1, \rtmp1
	
	pxor \r0, \rbuf0
	pxor \r1, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	pxor \r2, \rbuf0
	pxor \r3, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	pxor \r4, \rbuf0
	pxor \r5, \rbuf1
	mMIMult2 \rbuf0, \rbuf1, \raux0, \raux1
	pxor \r6, \rbuf0
	pxor \r7, \rbuf1
.endm

#Tweak

.macro mTweak r0, r1, r2, raux0
	pshufd \raux0, \r0, 108
	psrlq \raux0, 60	
	psllq \r0, 4
	pxor \r0, \raux0

	palignr \r1, \r1, 15

	pshufd \raux0, \r2, 108
	psrlq \raux0, 52	
	psllq \r2, 12
	pxor \r2, \raux0
.endm

#SubCrumb

.macro mSubCrumb r0, raux0, raux1, table0, table1
	movdqa \raux0, \r0
	pand \r0, maskSubCrumb
	pxor \raux0, \r0
	psrld \raux0, 4
	movdqa \raux1, \table0
	pshufb \raux1, \r0
	movdqa \r0, \table1
	pshufb \r0, \raux0
	pxor \r0, \raux1
.endm

#MixWord

.macro mMixWord rch0, rch1, raux0
	pxor \rch1, \rch0
	palignr \rch0, \rch0, 15
	pxor \rch0, \rch1
	palignr \rch1, \rch1, 9
	pxor \rch1, \rch0
	palignr \rch0, \rch0, 11
	pxor \rch0, \rch1
	pshufd \raux0, \rch1, 108
	psrlq \raux0, 60
	psllq \rch1, 4
	pxor \rch1, \raux0
.endm

#Step

.macro mSTEP rch0, rch1, rch2, rch3, rch4, rch5, rch6, rch7, raux0, raux1, numCST
	mSubCrumb \rch0, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16
	mSubCrumb \rch1, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48

	mSubCrumb \rch2, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16
	mSubCrumb \rch3, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48

	mSubCrumb \rch4, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16
	mSubCrumb \rch5, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48

	mSubCrumb \rch6, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16	
	mSubCrumb \rch7, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48
	
	mMixWord \rch0, \rch1, \raux0
	pxor \rch0, CONSTS+\numCST
	mMixWord \rch2, \rch3, \raux0
	pxor \rch2, CONSTS+16+\numCST
	pxor \rch1, CONSTS+64+\numCST	
	pxor \rch3, CONSTS+80+\numCST
	mMixWord \rch4, \rch5, \raux0
	pxor \rch4, CONSTS+32+\numCST
	pxor \rch5, CONSTS+96+\numCST
	mMixWord \rch6, \rch7, \raux0
	pxor \rch6, CONSTS+48+\numCST
	pxor \rch7, CONSTS+112+\numCST
.endm

#Round function

	.type fRound, @function
	.align 16
fRound:
	mPS %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13	
	mMI %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13

	mTweak %xmm3, %xmm5, %xmm7, %xmm8

	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 0
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 128
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 256
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 384
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 512
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 640
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 768
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, 896

	ret
	.size fRound, .-fRound

#Padding function

	.type fPadding, @function
	.align 16
fPadding:
	movups %xmm8, [%rdi]
	movups %xmm9, [%rdi+16]
	movdqa [buffer], %xmm8
	movdqa [buffer+16], %xmm9

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
	movups %xmm8, [buffer]
	movups %xmm9, [buffer+16]
	
	call fRound
	ret	
	.size fPadding, .-fPadding

#Finalization

	.type fFinalization, @function
	.align 16
fFinalization:
	pxor %xmm8, %xmm8
	pxor %xmm9, %xmm9
	call fRound

	movdqa %xmm14, %xmm0
	movdqa %xmm15, %xmm1
	pxor %xmm14, %xmm2
	pxor %xmm15, %xmm3
	pxor %xmm14, %xmm4
	pxor %xmm15, %xmm5
	pxor %xmm14, %xmm6
	pxor %xmm15, %xmm7

	pxor %xmm8, %xmm8
	pxor %xmm9, %xmm9
	call fRound

	pxor %xmm2, %xmm0
	pxor %xmm2, %xmm4
	pxor %xmm2, %xmm6
	
	movdqa %xmm0, %xmm14
	movdqa %xmm1, %xmm15

	mPuS %xmm0, %xmm1, %xmm4, %xmm5, %xmm6, %xmm7
	mPuS %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7

	ret
	.size fFinalization, .-fFinalization

#Luffa-384 Main function

	.globl fLuffa384
	.type fLuffa384, @function
	.align 16
fLuffa384:
	#Initialize chaining variables
	movdqa %xmm0, [IV]
	movdqa %xmm1, [IV+16]
	movdqa %xmm2, [IV+32]
	movdqa %xmm3, [IV+48]
	movdqa %xmm4, [IV+64]
	movdqa %xmm5, [IV+80]
	movdqa %xmm6, [IV+96]
	movdqa %xmm7, [IV+112]	
	
	#Absorbing phase
	movq %rcx, %rdi

	cmp %rdx, 32
	jl phPadding
phAbsorb:
	movups %xmm8, [%rdi]
	movups %xmm9, [%rdi+16]
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

	ret
	.size fLuffa384, .-fLuffa384

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
maskSubCrumb:
	.long 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F
tableSubCrumb:
	.byte 0x0D, 0x0E, 0x00, 0x01, 0x05, 0x0A, 0x07, 0x06, 0x0B, 0x03, 0x09, 0x0C, 0x0F, 0x08, 0x02, 0x04
	.byte 0xD0, 0xE0, 0x00, 0x10, 0x50, 0xA0, 0x70, 0x60, 0xB0, 0x30, 0x90, 0xC0, 0xF0, 0x80, 0x20, 0x40
	.byte 0x0B, 0x07, 0x0D, 0x06, 0x00, 0x03, 0x02, 0x09, 0x0A, 0x0F, 0x05, 0x01, 0x0E, 0x04, 0x0C, 0x08
	.byte 0xB0, 0x70, 0xD0, 0x60, 0x00, 0x30, 0x20, 0x90, 0xA0, 0xF0, 0x50, 0x10, 0xE0, 0x40, 0xC0, 0x80
	
	.align 32
	.type IV, @object
	.size IV, 128
IV:
	.long 0x6bf41c09, 0x86435d56, 0xe8fa49c9, 0x8f18d7c9
	.long 0xa2efc28d, 0x40382206, 0x889a1e87, 0xed5addd0
	.long 0xd2c303a9, 0xe76ad8bd, 0x7653c568, 0xbf4ea893
	.long 0xa123457b, 0xce084f4d, 0x3a85fc13, 0x6d897f67
	.long 0x74411d0f, 0x974ade22, 0x39b2393d, 0x9393af1b
	.long 0x89a25bf9, 0x0843b0c5, 0x42e06bd2, 0x826086b9
	.long 0x7f852fed, 0x655fafcd, 0x3e4682ae, 0x54e20725
	.long 0x8930d8b2, 0x6aec7182, 0xfa6ced93, 0x0a9f8f23

	.align 32
	.type CONSTS, @object
	.size CONSTS, 1024
CONSTS:
	.long 0x10100110, 0x10010100, 0x00111001, 0x00110000
	.long 0x11101101, 0x00010000, 0x11011110, 0x10110110
	.long 0x11010010, 0x11011001, 0x00100000, 0x11111100
	.long 0x10100101, 0x10101111, 0x00010011, 0x10110010
	.long 0x00011000, 0x01111000, 0x00110011, 0x11100000
	.long 0x00111101, 0x01011111, 0x01101000, 0x00000001 
	.long 0x11000001, 0x01110010, 0x01011110, 0x11100010
	.long 0x10111111, 0x11001001, 0x00101000, 0x11100000 
	.long 0x10011001, 0x01010010, 0x11100110, 0x11000000 
	.long 0x10101110, 0x01111010, 0x11110100, 0x01110000
	.long 0x00100101, 0x00101110, 0x01010101, 0x00110100
	.long 0x10010101, 0x10111110, 0x01001110, 0x11001000 
	.long 0x00001101, 0x10101001, 0x00011011, 0x01000100
	.long 0x11110100, 0x01111100, 0x10100001, 0x00000101
	.long 0x01110010, 0x10111011, 0x00100011, 0x11100110
	.long 0x10010001, 0x01101111, 0x01110101, 0x01000100 
	.long 0x00010010, 0x00111010, 0x11000011, 0x01101100
	.long 0x11010100, 0x10100011, 0x00000111, 0x00000111
	.long 0x10001111, 0x10000001, 0x11011000, 0x01111010 
	.long 0x00100010, 0x10001010, 0x01100000, 0x01001110 
	.long 0x01000010, 0x11010100, 0x00110100, 0x01111111
	.long 0x11001010, 0x11001010, 0x00001001, 0x10111101
	.long 0x10100100, 0x10100100, 0x01011000, 0x01011100 
	.long 0x00110010, 0x11001110, 0x10001111, 0x01111110
	.long 0x00111110, 0x10011000, 0x01010110, 0x11011100
	.long 0x01010001, 0x10001111, 0x00011110, 0x00011100
	.long 0x01001010, 0x01110110, 0x00111000, 0x10000100 
	.long 0x11111110, 0x01011000, 0x11011000, 0x01010110 
	.long 0x01111111, 0x00100001, 0x10001001, 0x10010011
	.long 0x00101000, 0x00101011, 0x00100111, 0x11110100
	.long 0x11100111, 0x11100010, 0x00111000, 0x00011110
	.long 0x10111110, 0x01001000, 0x01100101, 0x10010101 
	.long 0x10001111, 0x00010000, 0x00000000, 0x00011110
	.long 0x01000101, 0x00111101, 0x01111010, 0x01110000
	.long 0x00110010, 0x11100000, 0x01101101, 0x10111011 
	.long 0x10001111, 0x00010011, 0x00111011, 0x00110100
	.long 0x11100110, 0x10111100, 0x10101000, 0x11100101
	.long 0x11001100, 0x11100101, 0x01001010, 0x00010100 
	.long 0x10011101, 0x10001011, 0x11100011, 0x01111000
	.long 0x11100010, 0x00011011, 0x00011001, 0x11111110 
	.long 0x00111101, 0x01000010, 0x00000000, 0x01111000
	.long 0x01100010, 0x10000101, 0x10110010, 0x10101110 
	.long 0x11001000, 0x10000000, 0x10110111, 0x11101101
	.long 0x00111101, 0x01001110, 0x11101100, 0x11010000 
	.long 0x11110100, 0x10111010, 0x01110100, 0x01010010
	.long 0x00101011, 0x10101110, 0x10100111, 0x11111010 
	.long 0x00011001, 0x01100111, 0x01011000, 0x00100111
 	.long 0x11100101, 0x00100110, 0x10110010, 0x00111100
	.long 0x10000010, 0x01111000, 0x01011011, 0x10001111
	.long 0x10001001, 0x00010101, 0x11001010, 0x10111010 
	.long 0x01010110, 0x01110011, 0x10000100, 0x11011001
	.long 0x10000010, 0x01001000, 0x11101011, 0x00101100
	.long 0x10100111, 0x10011011, 0x10001000, 0x00100110
	.long 0x11000001, 0x11110001, 0x01001000, 0x00101110 
	.long 0x01111111, 0x10100101, 0x11101101, 0x00110110 
	.long 0x10001110, 0x10100010, 0x01000100, 0x01011001 
	.long 0x00010010, 0x11011011, 0x11100001, 0x10010110
	.long 0x00111110, 0x01101111, 0x10100100, 0x01000000 
	.long 0x00110100, 0x10000100, 0x11000111, 0x10100010
 	.long 0x00001000, 0x00100010, 0x10101101, 0x10110011 
	.long 0x10011101, 0x01101110, 0x00100010, 0x10011010
	.long 0x00000100, 0x11000111, 0x00100011, 0x10111001 
	.long 0x11100111, 0x10101100, 0x00111010, 0x01110000
	.long 0x01010101, 0x11000011, 0x11000100, 0x10100001


.section .data
	.align 16
buffer:
	.space 32
