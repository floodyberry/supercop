dnl  AMD64 mpn_sub_n -- Subtract two limb vectors of the same length > 0 and
dnl  store difference in a third limb vector.

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
C AMD K8:		 3
C Intel P4:		11.5
C Intel Core 2:		13.25


C INPUT PARAMETERS
C rp	rdi
C up	rsi
C vp	rdx
C n	rcx

ASM_START()
PROLOGUE(mpn_sub_n)
	leaq	(%rsi,%rcx,8), %rsi
	leaq	(%rdi,%rcx,8), %rdi
	leaq	(%rdx,%rcx,8), %rdx
	negq	%rcx
	xorl	%eax, %eax		C clear cy

	ALIGN(4)			C minimal alignment for claimed speed
L(loop):
	movq	(%rsi,%rcx,8), %rax
	movq	(%rdx,%rcx,8), %r10
	sbbq	%r10, %rax
	movq	%rax, (%rdi,%rcx,8)
	incq	%rcx
	jne	L(loop)

	movq	%rcx, %rax		C zero %rax
	adcq	%rax, %rax
	ret
EPILOGUE()
