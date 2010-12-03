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

/*
Modified on 2/12/2010 by Hitachi: changed to a code for 32-bit mode
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

.macro mMI rbuf0, rbuf1, r0, r1, r2, r3,r4,r5
	movaps \r0, XMMWORD PTR [buffer2]
	movaps \r1, XMMWORD PTR [buffer2+16]
	movaps \r4, XMMWORD PTR [buffer2+64]
	movaps \r5, XMMWORD PTR [buffer2+80]
	xorps \r4, \r0
	xorps \r5, \r1
	xorps \r4, XMMWORD PTR [buffer2+32]
	xorps \r5, XMMWORD PTR [buffer2+48]
	mMIMult2 \r4, \r5, \r2, \r3
	xorps \r0, \rbuf0
	xorps \r1, \rbuf1
	xorps \r0, \r4
	xorps \r1, \r5
	mMIMult2 \rbuf0, \rbuf1, \r2, \r3
	movaps \r2, XMMWORD PTR [buffer2+32]
	movaps \r3, XMMWORD PTR [buffer2+48]
	xorps \r2, \r4
	xorps \r3, \r5
	xorps \r2, \rbuf0
	xorps \r3, \rbuf1
	movaps	XMMWORD PTR [buffer2], \r4
	movaps	XMMWORD PTR [buffer2+16], \r5
	mMIMult2 \rbuf0, \rbuf1, \r4, \r5
	movaps	\r4, [buffer2+64]
	movaps	\r5, [buffer2+80]
	xorps \r4, [buffer2]
	xorps \r5, [buffer2+16]
	xorps \r4, \rbuf0
	xorps \r5, \rbuf1
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

.macro mSubCrumb r0, raux0, raux1, table0, table1
	movaps \raux0, \r0
	andps \r0, maskSubCrumb[0]
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

.macro mSTEP rch0, rch1, rch2, rch3, rch4, rch5, raux0, raux1, numCST
	mSubCrumb \rch0, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16
	mSubCrumb \rch1, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48

	mSubCrumb \rch2, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16
	mSubCrumb \rch3, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48

	mSubCrumb \rch4, \raux0, \raux1, tableSubCrumb, tableSubCrumb+16	
	mSubCrumb \rch5, \raux0, \raux1, tableSubCrumb+32, tableSubCrumb+48
	
	mMixWord \rch0, \rch1, \raux0
	xorps \rch0, CONSTS+\numCST
	mMixWord \rch2, \rch3, \raux0
	xorps \rch2, CONSTS+16+\numCST
	xorps \rch1, CONSTS+48+\numCST	
	xorps \rch3, CONSTS+64+\numCST
	mMixWord \rch4, \rch5, \raux0
	xorps \rch4, CONSTS+32+\numCST
	xorps \rch5, CONSTS+80+\numCST
.endm

#Round function

	.type fRound, @function
	.align 16
fRound:
	mPS %xmm6, %xmm7, %xmm0, %xmm1, %xmm2, %xmm3
	mMI %xmm6, %xmm7, %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5

	mTweak %xmm3, %xmm5, %xmm6

	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 0
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 96
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 192
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 288
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 384
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 480
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 576
	mSTEP %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, 672
	movaps	XMMWORD PTR [buffer2], %xmm0
	movaps	XMMWORD PTR [buffer2+16], %xmm1
	movaps	XMMWORD PTR [buffer2+32], %xmm2
	movaps	XMMWORD PTR [buffer2+48], %xmm3
	movaps	XMMWORD PTR [buffer2+64], %xmm4
	movaps	XMMWORD PTR [buffer2+80], %xmm5
	ret
	.size fRound, .-fRound

#Padding function

	.type fPadding, @function
	.align 16
fPadding:
	movups %xmm6, [%edi]
	movups %xmm7, [%edi+16]
	movaps [buffer], %xmm6
	movaps [buffer+16], %xmm7

	mov byte ptr[buffer+%edx], 0x80
	add %edx, 1

	cmp %edx, 32
	je phEndPadding
phZero:	
	mov byte ptr[buffer+%edx], 0x00
	add %edx, 1
	cmp %edx, 32
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

	mPuS %xmm0, %xmm1, %xmm4, %xmm5, %xmm6, %xmm7

	ret
	.size fFinalization, .-fFinalization

#Luffa-256 Main function

	.globl fLuffa256
	.type fLuffa256, @function
	.align 16
fLuffa256:
	push %edi
	push %esi
	#Initialize chaining variables
	movaps %xmm0, [IV]
	movaps %xmm1, [IV+16]
	movaps %xmm2, [IV+32]
	movaps %xmm3, [IV+48]
	movaps %xmm4, [IV+64]
	movaps %xmm5, [IV+80]

	movaps [buffer2], %xmm0
	movaps [buffer2+16], %xmm1
	movaps [buffer2+32], %xmm2
	movaps [buffer2+48], %xmm3
	movaps [buffer2+64], %xmm4
	movaps [buffer2+80], %xmm5

	#Initialize masks
//	movaps %xmm12, maskShufLittleEndian
//	movaps %xmm13, maskSubCrumb
	
	#Absorbing phase
	mov %edi, [%esp+12]
	mov %esi, [%esp+16]
	mov %edx, [%esp+20]
//	mov %ecx, %edi

	cmp %edx, 32
	jl phPadding
phAbsorb:
	movups %xmm6, [%edi]
	movups %xmm7, [%edi+16]
	sub %edx, 32
	add %edi, 32
	call fRound	
	cmp %edx, 32
	jge phAbsorb

phPadding:
	call fPadding
	call fFinalization

//	mov %edi, %ecx
	movups [%esi], %xmm0
	movups [%esi+16], %xmm1
	pop %esi
	pop %edi
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
maskSubCrumb:
	.long 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F
tableSubCrumb:
	.byte 0x0D, 0x0E, 0x00, 0x01, 0x05, 0x0A, 0x07, 0x06, 0x0B, 0x03, 0x09, 0x0C, 0x0F, 0x08, 0x02, 0x04
	.byte 0xD0, 0xE0, 0x00, 0x10, 0x50, 0xA0, 0x70, 0x60, 0xB0, 0x30, 0x90, 0xC0, 0xF0, 0x80, 0x20, 0x40
	.byte 0x0B, 0x07, 0x0D, 0x06, 0x00, 0x03, 0x02, 0x09, 0x0A, 0x0F, 0x05, 0x01, 0x0E, 0x04, 0x0C, 0x08
	.byte 0xB0, 0x70, 0xD0, 0x60, 0x00, 0x30, 0x20, 0x90, 0xA0, 0xF0, 0x50, 0x10, 0xE0, 0x40, 0xC0, 0x80
	
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
	.size CONSTS, 768
CONSTS:
	.long 0x10100110, 0x10010100, 0x00111001, 0x00110000
	.long 0x11101101, 0x00010000, 0x11011110, 0x10110110
	.long 0x11010010, 0x11011001, 0x00100000, 0x11111100
	.long 0x00011000, 0x01111000, 0x00110011, 0x11100000
	.long 0x00111101, 0x01011111, 0x01101000, 0x00000001 
	.long 0x11000001, 0x01110010, 0x01011110, 0x11100010
	.long 0x10011001, 0x01010010, 0x11100110, 0x11000000 
	.long 0x10101110, 0x01111010, 0x11110100, 0x01110000
	.long 0x00100101, 0x00101110, 0x01010101, 0x00110100
	.long 0x00001101, 0x10101001, 0x00011011, 0x01000100
	.long 0x11110100, 0x01111100, 0x10100001, 0x00000101
	.long 0x01110010, 0x10111011, 0x00100011, 0x11100110
	.long 0x00010010, 0x00111010, 0x11000011, 0x01101100
	.long 0x11010100, 0x10100011, 0x00000111, 0x00000111
	.long 0x10001111, 0x10000001, 0x11011000, 0x01111010 
	.long 0x01000010, 0x11010100, 0x00110100, 0x01111111
	.long 0x11001010, 0x11001010, 0x00001001, 0x10111101
	.long 0x10100100, 0x10100100, 0x01011000, 0x01011100 
	.long 0x00111110, 0x10011000, 0x01010110, 0x11011100
	.long 0x01010001, 0x10001111, 0x00011110, 0x00011100
	.long 0x01001010, 0x01110110, 0x00111000, 0x10000100 
	.long 0x01111111, 0x00100001, 0x10001001, 0x10010011
	.long 0x00101000, 0x00101011, 0x00100111, 0x11110100
	.long 0x11100111, 0x11100010, 0x00111000, 0x00011110
	.long 0x10001111, 0x00010000, 0x00000000, 0x00011110
	.long 0x01000101, 0x00111101, 0x01111010, 0x01110000
	.long 0x00110010, 0x11100000, 0x01101101, 0x10111011 
	.long 0x11100110, 0x10111100, 0x10101000, 0x11100101
	.long 0x11001100, 0x11100101, 0x01001010, 0x00010100 
	.long 0x10011101, 0x10001011, 0x11100011, 0x01111000
	.long 0x00111101, 0x01000010, 0x00000000, 0x01111000
	.long 0x01100010, 0x10000101, 0x10110010, 0x10101110 
	.long 0x11001000, 0x10000000, 0x10110111, 0x11101101
	.long 0x11110100, 0x10111010, 0x01110100, 0x01010010
	.long 0x00101011, 0x10101110, 0x10100111, 0x11111010 
	.long 0x00011001, 0x01100111, 0x01011000, 0x00100111 
	.long 0x10000010, 0x01111000, 0x01011011, 0x10001111
	.long 0x10001001, 0x00010101, 0x11001010, 0x10111010 
	.long 0x01010110, 0x01110011, 0x10000100, 0x11011001
	.long 0x10100111, 0x10011011, 0x10001000, 0x00100110
	.long 0x11000001, 0x11110001, 0x01001000, 0x00101110 
	.long 0x01111111, 0x10100101, 0x11101101, 0x00110110 
	.long 0x00010010, 0x11011011, 0x11100001, 0x10010110
	.long 0x00111110, 0x01101111, 0x10100100, 0x01000000 
	.long 0x00110100, 0x10000100, 0x11000111, 0x10100010 
	.long 0x10011101, 0x01101110, 0x00100010, 0x10011010
	.long 0x00000100, 0x11000111, 0x00100011, 0x10111001 
	.long 0x11100111, 0x10101100, 0x00111010, 0x01110000

.section .data
	.align 16
buffer:
	.space 32
buffer2:
	.space 96
