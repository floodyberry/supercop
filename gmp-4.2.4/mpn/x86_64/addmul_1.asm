dnl  AMD64 mpn_addmul_1 -- Multiply a limb vector with a limb and add the
dnl  result to a second limb vector.

dnl  Copyright 2004 Free Software Foundation, Inc.

dnl  This file is part of the GNU MP Library.

dnl  The GNU MP Library is free software; you can redistribute it and/or modify
dnl  it under the terms of the GNU Lesser General Public License as published
dnl  by the Free Software Foundation; either version 3 of the License, or (at
dnl  your option) any later version.

dnl  The GNU MP Library is distributed in the hope that it will be useful, but
dnl  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
dnl  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
dnl  License for more details.

dnl  You should have received a copy of the GNU Lesser General Public License
dnl  along with the GNU MP Library.  If not, see http://www.gnu.org/licenses/.

include(`../config.m4')


C		    cycles/limb
C AMD K8:		 4
C Intel P4:		17.5
C Intel Core 2:		 5.8


C INPUT PARAMETERS
C rp	rdi
C up	rsi
C n	rdx
C vl	rcx

ASM_START()
PROLOGUE(mpn_addmul_1)
	movq	%rdx, %r11
	leaq	(%rsi,%rdx,8), %rsi
	leaq	(%rdi,%rdx,8), %rdi
	negq	%r11
	xorl	%r8d, %r8d
	xorl	%r10d, %r10d

	ALIGN(4)			C minimal alignment for claimed speed
L(loop):
	movq	(%rsi,%r11,8), %rax
	mulq	%rcx
	addq	(%rdi,%r11,8), %rax
	adcq	%r10, %rdx
	addq	%r8, %rax
	movq	%r10, %r8
	movq	%rax, (%rdi,%r11,8)
	adcq	%rdx, %r8
	incq	%r11
	jne	L(loop)

	movq	%r8, %rax
	ret
EPILOGUE()
