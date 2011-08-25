/*
 * Copyright (C) 2011 BACKEND Authors
 *
 * This code is legal property of its developers, whose names are not
 * listed here. Please refer to the COPYRIGHT file for contact
 * information.
 *
 * This code is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this code. If not, see <http://www.gnu.org/licenses/>.
 */

	.file	"relic_fb_mul_low.c"
	.text
	.p2align 4,,15
	.globl	fb_muld_low
	.type	fb_muld_low, @function
fb_muld_low:
.LFB590:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$6216, %rsp
	.cfi_def_cfa_offset 6272
	leaq	64(%rsp), %rbp
	movl	%ecx, 32(%rsp)
	movl	$768, %ecx
	movq	%rbp, %rdi
	movq	%rsi, 24(%rsp)
	rep stosq
	movl	32(%rsp), %eax
	movq	%r13, %rdi
	addl	%eax, %eax
	movl	%eax, %esi
	movl	%eax, 36(%rsp)
	call	dv_zero
	movl	32(%rsp), %r12d
	movq	%rbp, %rdi
	addl	$1, %r12d
	movl	%r12d, %esi
	call	dv_zero
	leaq	384(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	768(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	1152(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	1536(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	1920(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	2304(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	2688(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	3072(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	3456(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	3840(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	4224(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	4608(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	4992(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	5376(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	leaq	5760(%rbp), %rdi
	movl	%r12d, %esi
	call	dv_zero
	movl	32(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L2
	movq	%rbx, %rdx
	movl	32(%rsp), %ebx
	movq	%rbp, %rax
	xorl	%r9d, %r9d
	subl	$1, %ebx
	leaq	8(%rbp,%rbx,8), %r15
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rsi, %r9
.L3:
	movq	(%rdx), %rsi
	movq	%r9, %r10
	movq	%r9, %rcx
	shrq	$63, %r10
	shrq	$62, %rcx
	movq	$0, (%rax)
	shrq	$61, %r9
	addq	$8, %rdx
	leaq	(%rsi,%rsi), %r8
	movq	%rsi, 384(%rax)
	leaq	0(,%rsi,4), %rdi
	orq	%r10, %r8
	orq	%rcx, %rdi
	movq	%r8, 768(%rax)
	leaq	0(,%rsi,8), %rcx
	movq	%rdi, %rbx
	movq	%rdi, %r11
	orq	%r9, %rcx
	movq	%r8, %r9
	xorq	%r8, %r11
	xorq	%rsi, %r9
	xorq	%rsi, %rbx
	movq	%rcx, %r14
	movq	%r9, %r10
	xorq	%rcx, %r8
	movq	%r9, 1152(%rax)
	xorq	%rdi, %r10
	xorq	%rcx, %r9
	movq	%rdi, 1536(%rax)
	movq	%rbx, 1920(%rax)
	xorq	%rcx, %rdi
	xorq	%rcx, %rbx
	movq	%r11, 2304(%rax)
	xorq	%rsi, %r14
	xorq	%rcx, %r11
	movq	%rcx, 3072(%rax)
	xorq	%r10, %rcx
	movq	%r10, 2688(%rax)
	movq	%r14, 3456(%rax)
	movq	%r8, 3840(%rax)
	movq	%r9, 4224(%rax)
	movq	%rdi, 4608(%rax)
	movq	%rbx, 4992(%rax)
	movq	%r11, 5376(%rax)
	movq	%rcx, 5760(%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L10
	testq	%rsi, %rsi
	je	.L2
	movslq	32(%rsp), %r15
	movq	%rsi, %rdx
	movq	%rsi, %r11
	shrq	$62, %rdx
	shrq	$63, %r11
	movq	%rdx, %rax
	shrq	$61, %rsi
	xorq	%r11, %rax
	movq	%r11, 1216(%rsp,%r15,8)
	movq	%r11, 832(%rsp,%r15,8)
	xorq	%rsi, %r11
	movq	%rdx, 1984(%rsp,%r15,8)
	movq	%rdx, 1600(%rsp,%r15,8)
	xorq	%rsi, %rdx
	movq	%rsi, 3520(%rsp,%r15,8)
	movq	%rsi, 3136(%rsp,%r15,8)
	xorq	%rax, %rsi
	movq	$0, 448(%rsp,%r15,8)
	movq	$0, 64(%rsp,%r15,8)
	movq	%rax, 2752(%rsp,%r15,8)
	movq	%rax, 2368(%rsp,%r15,8)
	movq	%r11, 4288(%rsp,%r15,8)
	movq	%r11, 3904(%rsp,%r15,8)
	movq	%rdx, 5056(%rsp,%r15,8)
	movq	%rdx, 4672(%rsp,%r15,8)
	movq	%rsi, 5824(%rsp,%r15,8)
	movq	%rsi, 5440(%rsp,%r15,8)
.L2:
	movl	32(%rsp), %esi
	leaq	8(%r13), %rdi
	movl	$60, %ebx
	movq	%rdi, 48(%rsp)
	subl	$1, %esi
	salq	$3, %rsi
	movq	%rsi, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	32(%rsp), %r14d
	testl	%r14d, %r14d
	jle	.L8
	movq	24(%rsp), %r11
	movl	%ebx, %ecx
	movq	%r13, %rsi
	movq	48(%rsp), %r15
	leaq	8(%r13), %r14
	movq	%r13, %rdi
	movq	(%r11), %rdx
	addq	56(%rsp), %r15
	shrq	%cl, %rdx
	movl	%r12d, %ecx
	movq	%r15, 16(%rsp)
	andl	$15, %edx
	subq	%r13, %r15
	leaq	(%rdx,%rdx,2), %rdx
	subq	$8, %r15
	shrq	$3, %r15
	salq	$7, %rdx
	andl	$3, %r15d
	addq	%rbp, %rdx
	movq	%r15, 8(%rsp)
	call	fb_addd_low
	movq	24(%rsp), %r15
	movq	8(%rsp), %rax
	addq	$8, %r15
	cmpq	16(%rsp), %r14
	je	.L8
	testq	%rax, %rax
	je	.L40
	cmpq	$1, %rax
	je	.L35
	cmpq	$2, %rax
	je	.L36
	movq	(%r15), %rsi
	movl	%ebx, %ecx
	movq	%r14, %rdi
	shrq	%cl, %rsi
	movl	%r12d, %ecx
	andl	$15, %esi
	leaq	(%rsi,%rsi,2), %rdx
	movq	%r14, %rsi
	leaq	16(%r13), %r14
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	24(%rsp), %r15
	addq	$16, %r15
.L36:
	movq	(%r15), %rdi
	movl	%ebx, %ecx
	movq	%r14, %rsi
	addq	$8, %r15
	shrq	%cl, %rdi
	movl	%r12d, %ecx
	andl	$15, %edi
	leaq	(%rdi,%rdi,2), %rdx
	movq	%r14, %rdi
	addq	$8, %r14
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
.L35:
	movq	(%r15), %r9
	movl	%ebx, %ecx
	movq	%r14, %rsi
	movq	%r14, %rdi
	addq	$8, %r14
	addq	$8, %r15
	shrq	%cl, %r9
	movl	%r12d, %ecx
	andl	$15, %r9d
	leaq	(%r9,%r9,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	cmpq	16(%rsp), %r14
	je	.L8
.L40:
	movq	%r13, 40(%rsp)
	movq	16(%rsp), %r13
.L5:
	movq	(%r15), %rax
	movl	%ebx, %ecx
	movq	%r14, %rsi
	movq	%r14, %rdi
	shrq	%cl, %rax
	movl	%r12d, %ecx
	andl	$15, %eax
	leaq	(%rax,%rax,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	8(%r15), %r10
	movl	%ebx, %ecx
	leaq	8(%r14), %rdi
	movq	%rdi, %rsi
	shrq	%cl, %r10
	movl	%r12d, %ecx
	andl	$15, %r10d
	leaq	(%r10,%r10,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	16(%r15), %r8
	movl	%ebx, %ecx
	leaq	16(%r14), %rdi
	movq	%rdi, %rsi
	shrq	%cl, %r8
	movl	%r12d, %ecx
	andl	$15, %r8d
	leaq	(%r8,%r8,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	24(%r15), %r9
	movl	%ebx, %ecx
	leaq	24(%r14), %rdi
	addq	$32, %r14
	addq	$32, %r15
	movq	%rdi, %rsi
	shrq	%cl, %r9
	movl	%r12d, %ecx
	andl	$15, %r9d
	leaq	(%r9,%r9,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	cmpq	%r13, %r14
	jne	.L5
	movq	40(%rsp), %r13
.L8:
	movl	36(%rsp), %edx
	movl	$4, %ecx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	bn_lshb_low
	subl	$4, %ebx
	jne	.L4
	movl	32(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L1
	movl	32(%rsp), %r15d
	leaq	8(%r13), %rbx
	subl	$1, %r15d
	leaq	(%rbx,%r15,8), %r14
	andl	$3, %r15d
	je	.L38
	movq	24(%rsp), %r10
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	%r12d, %ecx
	movq	%rbx, %r13
	leaq	8(%rbx), %rbx
	movq	(%r10), %r8
	andl	$15, %r8d
	leaq	(%r8,%r8,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	addq	$8, 24(%rsp)
	cmpq	$1, %r15
	je	.L38
	cmpq	$2, %r15
	je	.L34
	movq	24(%rsp), %r15
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	%r12d, %ecx
	movq	%rbx, %r13
	leaq	8(%rbx), %rbx
	movq	(%r15), %rax
	andl	$15, %eax
	leaq	(%rax,%rax,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	addq	$8, 24(%rsp)
.L34:
	movq	24(%rsp), %r11
	movq	%r13, %rdi
	movq	%r13, %rsi
	movq	(%r11), %rcx
	andl	$15, %ecx
	leaq	(%rcx,%rcx,2), %rdx
	movl	%r12d, %ecx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	%rbx, %rdx
	addq	$8, %rbx
	addq	$8, 24(%rsp)
	movq	%rdx, %rdi
	movq	24(%rsp), %r15
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L42:
	movq	8(%r15), %r9
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	leaq	8(%rbx), %r13
	movl	%r12d, %ecx
	andl	$15, %r9d
	leaq	(%r9,%r9,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	16(%r15), %rdi
	movl	%r12d, %ecx
	movq	%r13, %rsi
	andl	$15, %edi
	leaq	(%rdi,%rdi,2), %rdx
	movq	%r13, %rdi
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	movq	24(%r15), %rsi
	leaq	16(%rbx), %rdi
	movl	%r12d, %ecx
	addq	$32, %r15
	andl	$15, %esi
	leaq	(%rsi,%rsi,2), %rdx
	movq	%rdi, %rsi
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	leaq	24(%rbx), %rdi
	addq	$32, %rbx
.L9:
	movq	(%r15), %r13
	movl	%r12d, %ecx
	movq	%rdi, %rsi
	andl	$15, %r13d
	leaq	0(%r13,%r13,2), %rdx
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	fb_addd_low
	cmpq	%r14, %rbx
	jne	.L42
.L1:
	addq	$6216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore_state
	movq	%r13, %rdi
	movq	24(%rsp), %r15
	jmp	.L9
	.cfi_endproc
.LFE590:
	.size	fb_muld_low, .-fb_muld_low
	.p2align 4,,15
	.globl	fb_mul1_low
	.type	fb_mul1_low, @function
fb_mul1_low:
.LFB591:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	testq	%rdx, %rdx
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	je	.L73
	cmpq	$1, %rdx
	je	.L74
	movq	%rdx, %rdi
	call	util_bits_dig
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	leal	-1(%rax), %edx
	call	fb_lshb_low
	movq	%r12, %rdi
	movq	%rax, 32(%rbx)
	call	util_bits_dig
	leal	-2(%rax), %edx
	testl	%edx, %edx
	jle	.L46
	movl	$66, %esi
	subl	%eax, %esi
	subl	$3, %eax
	andl	$3, %eax
	btq	%rdx, %r12
	jc	.L75
.L51:
	addl	$1, %esi
	subl	$1, %edx
	je	.L46
	testl	%eax, %eax
	je	.L48
	cmpl	$1, %eax
	je	.L69
	cmpl	$2, %eax
	.p2align 4,,3
	je	.L70
	btq	%rdx, %r12
	jnc	.L53
	movq	0(%rbp), %r9
	movl	%edx, %ecx
	movq	%r9, %rax
	salq	%cl, %rax
	movl	%esi, %ecx
	xorq	%rax, (%rbx)
	shrq	%cl, %r9
	movl	%edx, %ecx
	movq	8(%rbp), %r10
	movq	%r10, %r11
	salq	%cl, %r11
	movl	%esi, %ecx
	orq	%r11, %r9
	shrq	%cl, %r10
	movl	%edx, %ecx
	xorq	%r9, 8(%rbx)
	movq	16(%rbp), %rax
	movq	%rax, %r8
	salq	%cl, %r8
	movl	%esi, %ecx
	orq	%r8, %r10
	shrq	%cl, %rax
	movl	%edx, %ecx
	xorq	%r10, 16(%rbx)
	movq	24(%rbp), %r11
	movq	%r11, %rdi
	salq	%cl, %rdi
	movl	%esi, %ecx
	orq	%rdi, %rax
	shrq	%cl, %r11
	xorq	%rax, 24(%rbx)
	xorq	%r11, 32(%rbx)
.L53:
	subl	$1, %edx
	addl	$1, %esi
.L70:
	btq	%rdx, %r12
	jnc	.L56
	movq	0(%rbp), %rax
	movl	%edx, %ecx
	movq	%rax, %r10
	salq	%cl, %r10
	movl	%esi, %ecx
	xorq	%r10, (%rbx)
	shrq	%cl, %rax
	movl	%edx, %ecx
	movq	8(%rbp), %r9
	movq	%r9, %rdi
	salq	%cl, %rdi
	movl	%esi, %ecx
	orq	%rdi, %rax
	shrq	%cl, %r9
	movl	%edx, %ecx
	xorq	%rax, 8(%rbx)
	movq	16(%rbp), %r10
	movq	%r10, %r11
	salq	%cl, %r11
	movl	%esi, %ecx
	orq	%r11, %r9
	shrq	%cl, %r10
	movl	%edx, %ecx
	xorq	%r9, 16(%rbx)
	movq	24(%rbp), %rdi
	movq	%rdi, %r8
	salq	%cl, %r8
	movl	%esi, %ecx
	orq	%r8, %r10
	shrq	%cl, %rdi
	xorq	%r10, 24(%rbx)
	xorq	%rdi, 32(%rbx)
.L56:
	subl	$1, %edx
	addl	$1, %esi
.L69:
	btq	%rdx, %r12
	jnc	.L59
	movq	0(%rbp), %r10
	movl	%edx, %ecx
	movq	%r10, %r11
	salq	%cl, %r11
	movl	%esi, %ecx
	xorq	%r11, (%rbx)
	shrq	%cl, %r10
	movl	%edx, %ecx
	movq	8(%rbp), %rdi
	movq	%rdi, %r9
	salq	%cl, %r9
	movl	%esi, %ecx
	orq	%r9, %r10
	shrq	%cl, %rdi
	movl	%edx, %ecx
	xorq	%r10, 8(%rbx)
	movq	16(%rbp), %r11
	movq	%r11, %rax
	salq	%cl, %rax
	movl	%esi, %ecx
	orq	%rax, %rdi
	shrq	%cl, %r11
	movl	%edx, %ecx
	xorq	%rdi, 16(%rbx)
	movq	24(%rbp), %r9
	movq	%r9, %r8
	salq	%cl, %r8
	movl	%esi, %ecx
	orq	%r8, %r11
	shrq	%cl, %r9
	xorq	%r11, 24(%rbx)
	xorq	%r9, 32(%rbx)
.L59:
	addl	$1, %esi
	subl	$1, %edx
	je	.L46
.L48:
	btq	%rdx, %r12
	jnc	.L47
	movq	0(%rbp), %r11
	movl	%edx, %ecx
	movq	%r11, %rax
	salq	%cl, %rax
	movl	%esi, %ecx
	xorq	%rax, (%rbx)
	shrq	%cl, %r11
	movl	%edx, %ecx
	movq	8(%rbp), %r9
	movq	%r9, %rdi
	salq	%cl, %rdi
	movl	%esi, %ecx
	orq	%rdi, %r11
	shrq	%cl, %r9
	movl	%edx, %ecx
	xorq	%r11, 8(%rbx)
	movq	16(%rbp), %rax
	movq	%rax, %r10
	salq	%cl, %r10
	movl	%esi, %ecx
	orq	%r10, %r9
	shrq	%cl, %rax
	movl	%edx, %ecx
	xorq	%r9, 16(%rbx)
	movq	24(%rbp), %rdi
	movq	%rdi, %r8
	salq	%cl, %r8
	movl	%esi, %ecx
	orq	%r8, %rax
	shrq	%cl, %rdi
	xorq	%rax, 24(%rbx)
	xorq	%rdi, 32(%rbx)
.L47:
	subl	$1, %edx
	addl	$1, %esi
	btq	%rdx, %r12
	jnc	.L62
	movq	0(%rbp), %r11
	movl	%edx, %ecx
	movq	%r11, %rax
	salq	%cl, %rax
	movl	%esi, %ecx
	xorq	%rax, (%rbx)
	shrq	%cl, %r11
	movl	%edx, %ecx
	movq	8(%rbp), %r10
	movq	%r10, %rdi
	salq	%cl, %rdi
	movl	%esi, %ecx
	orq	%rdi, %r11
	shrq	%cl, %r10
	movl	%edx, %ecx
	xorq	%r11, 8(%rbx)
	movq	16(%rbp), %rax
	movq	%rax, %r9
	salq	%cl, %r9
	movl	%esi, %ecx
	orq	%r9, %r10
	shrq	%cl, %rax
	movl	%edx, %ecx
	xorq	%r10, 16(%rbx)
	movq	24(%rbp), %rdi
	movq	%rdi, %r8
	salq	%cl, %r8
	movl	%esi, %ecx
	orq	%r8, %rax
	shrq	%cl, %rdi
	xorq	%rax, 24(%rbx)
	xorq	%rdi, 32(%rbx)
.L62:
	leal	-1(%rdx), %eax
	leal	1(%rsi), %edi
	btq	%rax, %r12
	jnc	.L64
	movq	0(%rbp), %r8
	movl	%eax, %ecx
	movq	%r8, %r9
	salq	%cl, %r9
	movl	%edi, %ecx
	xorq	%r9, (%rbx)
	shrq	%cl, %r8
	movl	%eax, %ecx
	movq	8(%rbp), %r9
	movq	%r9, %r11
	salq	%cl, %r11
	movl	%edi, %ecx
	orq	%r11, %r8
	shrq	%cl, %r9
	movl	%eax, %ecx
	xorq	%r8, 8(%rbx)
	movq	16(%rbp), %r8
	movq	%r8, %r10
	salq	%cl, %r10
	movl	%edi, %ecx
	orq	%r10, %r9
	shrq	%cl, %r8
	movl	%eax, %ecx
	xorq	%r9, 16(%rbx)
	movq	24(%rbp), %r9
	movq	%r9, %r11
	salq	%cl, %r11
	movl	%edi, %ecx
	orq	%r11, %r8
	shrq	%cl, %r9
	xorq	%r8, 24(%rbx)
	xorq	%r9, 32(%rbx)
.L64:
	leal	-2(%rdx), %eax
	leal	2(%rsi), %edi
	btq	%rax, %r12
	jnc	.L66
	movq	0(%rbp), %r8
	movl	%eax, %ecx
	movq	%r8, %r9
	salq	%cl, %r9
	movl	%edi, %ecx
	xorq	%r9, (%rbx)
	shrq	%cl, %r8
	movl	%eax, %ecx
	movq	8(%rbp), %r9
	movq	%r9, %r10
	salq	%cl, %r10
	movl	%edi, %ecx
	orq	%r10, %r8
	shrq	%cl, %r9
	movl	%eax, %ecx
	xorq	%r8, 8(%rbx)
	movq	16(%rbp), %r8
	movq	%r8, %r11
	salq	%cl, %r11
	movl	%edi, %ecx
	orq	%r11, %r9
	shrq	%cl, %r8
	movl	%eax, %ecx
	xorq	%r9, 16(%rbx)
	movq	24(%rbp), %r11
	movq	%r11, %r10
	salq	%cl, %r10
	movl	%edi, %ecx
	orq	%r10, %r8
	shrq	%cl, %r11
	xorq	%r8, 24(%rbx)
	xorq	%r11, 32(%rbx)
.L66:
	addl	$3, %esi
	subl	$3, %edx
	jne	.L48
.L46:
	andl	$1, %r12d
	jne	.L76
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	.cfi_restore_state
	movq	0(%rbp), %r10
	movl	%edx, %ecx
	movq	%r10, %r9
	salq	%cl, %r9
	movl	%esi, %ecx
	xorq	%r9, (%rbx)
	shrq	%cl, %r10
	movl	%edx, %ecx
	movq	8(%rbp), %r11
	movq	%r11, %r8
	salq	%cl, %r8
	movl	%esi, %ecx
	orq	%r8, %r10
	shrq	%cl, %r11
	movl	%edx, %ecx
	xorq	%r10, 8(%rbx)
	movq	16(%rbp), %r10
	movq	%r10, %rdi
	salq	%cl, %rdi
	movl	%esi, %ecx
	orq	%rdi, %r11
	shrq	%cl, %r10
	movl	%edx, %ecx
	xorq	%r11, 16(%rbx)
	movq	24(%rbp), %r8
	movq	%r8, %r9
	salq	%cl, %r9
	movl	%esi, %ecx
	orq	%r9, %r10
	shrq	%cl, %r8
	xorq	%r10, 24(%rbx)
	xorq	%r8, 32(%rbx)
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L76:
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdx
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	fb_add
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$5, %esi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	dv_zero
	.p2align 4,,10
	.p2align 3
.L74:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	fb_copy
	.cfi_endproc
.LFE591:
	.size	fb_mul1_low, .-fb_mul1_low
	.p2align 4,,15
	.globl	fb_muln_low
	.type	fb_muln_low, @function
fb_muln_low:
.LFB592:
	.cfi_startproc
	subq	$3984, %rsp
	.cfi_def_cfa_offset 3992
	pxor	%xmm10, %xmm10
	movdqa	(%rdx), %xmm13
	movdqa	%xmm10, -120(%rsp)
	movdqa	%xmm10, 1928(%rsp)
	movdqa	%xmm13, %xmm5
	movdqa	%xmm13, %xmm6
	movdqa	%xmm13, %xmm3
	psrlq	$57, %xmm5
	movdqa	%xmm13, %xmm14
	movdqa	%xmm13, 8(%rsp)
	movdqa	%xmm5, %xmm9
	psllq	$2, %xmm6
	pslldq	$8, %xmm9
	movdqa	%xmm9, %xmm15
	movdqa	%xmm9, %xmm11
	movdqa	%xmm9, %xmm8
	psrlq	$4, %xmm15
	psrlq	$5, %xmm11
	psllq	$3, %xmm3
	pxor	%xmm11, %xmm6
	movdqa	%xmm13, %xmm11
	pxor	%xmm15, %xmm3
	psrlq	$6, %xmm8
	movdqa	%xmm6, %xmm7
	movdqa	%xmm6, %xmm12
	movdqa	%xmm6, %xmm4
	movdqa	%xmm3, %xmm2
	movdqa	%xmm3, %xmm0
	movdqa	%xmm3, %xmm1
	pxor	%xmm13, %xmm7
	movdqa	%xmm6, 392(%rsp)
	psllq	$1, %xmm14
	pxor	%xmm3, %xmm6
	movdqa	%xmm6, %xmm15
	pxor	%xmm8, %xmm14
	pxor	%xmm13, %xmm2
	pxor	%xmm14, %xmm11
	pxor	%xmm14, %xmm12
	pxor	%xmm11, %xmm4
	pxor	%xmm14, %xmm0
	pxor	%xmm11, %xmm1
	pxor	%xmm13, %xmm15
	movdqa	%xmm14, 136(%rsp)
	movdqa	%xmm9, %xmm8
	pxor	%xmm6, %xmm14
	movdqa	%xmm11, 264(%rsp)
	psrlq	$1, %xmm8
	movdqa	%xmm6, 1416(%rsp)
	pxor	%xmm11, %xmm6
	movdqa	%xmm13, %xmm11
	movdqa	%xmm15, 1544(%rsp)
	movdqa	%xmm13, %xmm15
	psllq	$5, %xmm11
	movdqa	%xmm14, 1672(%rsp)
	movdqa	%xmm13, %xmm14
	psrldq	$8, %xmm5
	movdqa	%xmm7, 520(%rsp)
	psllq	$7, %xmm13
	movdqa	%xmm9, %xmm7
	pxor	%xmm9, %xmm13
	psllq	$4, %xmm14
	movdqa	%xmm12, 648(%rsp)
	movdqa	%xmm4, 776(%rsp)
	psrlq	$3, %xmm9
	psllq	$6, %xmm15
	pxor	%xmm9, %xmm14
	movdqa	%xmm3, 904(%rsp)
	pxor	%xmm8, %xmm15
	psrlq	$2, %xmm7
	movdqa	%xmm2, 1032(%rsp)
	movdqa	%xmm0, 1160(%rsp)
	movdqa	%xmm15, %xmm12
	movdqa	%xmm15, %xmm4
	movdqa	%xmm15, %xmm2
	movdqa	%xmm13, %xmm0
	movdqa	%xmm13, %xmm3
	pxor	%xmm7, %xmm11
	pxor	%xmm14, %xmm12
	pxor	%xmm11, %xmm4
	movdqa	%xmm1, 1288(%rsp)
	movdqa	%xmm13, %xmm1
	pxor	%xmm14, %xmm0
	movdqa	%xmm6, 1800(%rsp)
	movdqa	%xmm14, %xmm6
	pxor	%xmm11, %xmm1
	movdqa	%xmm14, 2056(%rsp)
	pxor	%xmm11, %xmm6
	pxor	%xmm6, %xmm2
	movdqa	%xmm11, 2184(%rsp)
	pxor	%xmm6, %xmm3
	movdqa	%xmm6, 2312(%rsp)
	movdqa	%xmm15, 2440(%rsp)
	movdqa	%xmm12, 2568(%rsp)
	movdqa	%xmm4, 2696(%rsp)
	movdqa	%xmm2, 2824(%rsp)
	movdqa	%xmm13, 2952(%rsp)
	pxor	%xmm15, %xmm13
	pxor	%xmm13, %xmm14
	movdqa	%xmm0, 3080(%rsp)
	pxor	%xmm13, %xmm11
	movdqa	%xmm1, 3208(%rsp)
	movdqa	%xmm3, 3336(%rsp)
	movdqa	%xmm13, 3464(%rsp)
	pxor	%xmm6, %xmm13
	movdqa	%xmm14, 3592(%rsp)
	movdqa	%xmm11, 3720(%rsp)
	movdqa	%xmm13, 3848(%rsp)
	movdqa	16(%rdx), %xmm13
	movdqa	%xmm10, -104(%rsp)
	movdqa	%xmm13, %xmm6
	movdqa	%xmm13, %xmm14
	movdqa	%xmm13, %xmm11
	psrlq	$57, %xmm6
	movdqa	%xmm13, %xmm15
	movdqa	%xmm13, 24(%rsp)
	movdqa	%xmm6, %xmm8
	psllq	$1, %xmm14
	movdqa	%xmm10, 1944(%rsp)
	pslldq	$8, %xmm8
	pxor	%xmm8, %xmm5
	movdqa	%xmm5, %xmm7
	movdqa	%xmm5, %xmm9
	movdqa	%xmm5, %xmm12
	psrlq	$4, %xmm7
	psrlq	$5, %xmm9
	psrlq	$6, %xmm12
	psllq	$2, %xmm11
	pxor	%xmm12, %xmm14
	movdqa	%xmm13, %xmm12
	psllq	$3, %xmm15
	pxor	%xmm9, %xmm11
	movdqa	%xmm11, %xmm4
	pxor	%xmm7, %xmm15
	movdqa	%xmm11, %xmm2
	movdqa	%xmm11, %xmm0
	movdqa	%xmm15, %xmm1
	movdqa	%xmm15, %xmm3
	movdqa	%xmm15, %xmm7
	pxor	%xmm14, %xmm12
	pxor	%xmm13, %xmm4
	movdqa	%xmm11, 408(%rsp)
	pxor	%xmm15, %xmm11
	movdqa	%xmm11, %xmm9
	movdqa	%xmm14, 152(%rsp)
	pxor	%xmm14, %xmm2
	pxor	%xmm12, %xmm0
	pxor	%xmm13, %xmm1
	pxor	%xmm14, %xmm3
	pxor	%xmm12, %xmm7
	pxor	%xmm13, %xmm9
	movdqa	%xmm12, 280(%rsp)
	pxor	%xmm11, %xmm14
	psrldq	$8, %xmm6
	movdqa	%xmm4, 536(%rsp)
	movdqa	%xmm5, %xmm4
	movdqa	%xmm11, 1432(%rsp)
	pxor	%xmm12, %xmm11
	movdqa	%xmm13, %xmm12
	movdqa	%xmm9, 1560(%rsp)
	movdqa	%xmm13, %xmm9
	psrlq	$1, %xmm4
	movdqa	%xmm11, 1816(%rsp)
	movdqa	%xmm13, %xmm11
	psllq	$7, %xmm13
	pxor	%xmm5, %xmm13
	psllq	$4, %xmm12
	movdqa	%xmm2, 664(%rsp)
	psllq	$6, %xmm9
	movdqa	%xmm5, %xmm2
	movdqa	%xmm0, 792(%rsp)
	psrlq	$3, %xmm5
	pxor	%xmm4, %xmm9
	movdqa	%xmm15, 920(%rsp)
	pxor	%xmm5, %xmm12
	psrlq	$2, %xmm2
	movdqa	%xmm1, 1048(%rsp)
	movdqa	%xmm3, 1176(%rsp)
	movdqa	%xmm12, %xmm5
	movdqa	%xmm9, %xmm0
	movdqa	%xmm9, %xmm1
	movdqa	%xmm9, %xmm3
	movdqa	%xmm13, %xmm15
	psllq	$5, %xmm11
	pxor	%xmm12, %xmm0
	pxor	%xmm12, %xmm15
	movdqa	%xmm7, 1304(%rsp)
	movdqa	%xmm13, %xmm7
	pxor	%xmm2, %xmm11
	movdqa	%xmm14, 1688(%rsp)
	movdqa	%xmm13, %xmm14
	pxor	%xmm11, %xmm5
	movdqa	%xmm12, 2072(%rsp)
	pxor	%xmm11, %xmm1
	pxor	%xmm5, %xmm3
	movdqa	%xmm11, 2200(%rsp)
	pxor	%xmm11, %xmm14
	pxor	%xmm5, %xmm7
	movdqa	%xmm9, 2456(%rsp)
	pxor	%xmm13, %xmm9
	pxor	%xmm9, %xmm12
	movdqa	%xmm0, 2584(%rsp)
	pxor	%xmm9, %xmm11
	movdqa	%xmm6, %xmm4
	movdqa	%xmm1, 2712(%rsp)
	psrlq	$1, %xmm4
	movdqa	%xmm3, 2840(%rsp)
	movdqa	%xmm9, 3480(%rsp)
	pxor	%xmm5, %xmm9
	movdqa	%xmm5, 2328(%rsp)
	movdqa	%xmm13, 2968(%rsp)
	movdqa	%xmm15, 3096(%rsp)
	movdqa	%xmm14, 3224(%rsp)
	movdqa	%xmm7, 3352(%rsp)
	movdqa	%xmm12, 3608(%rsp)
	movdqa	%xmm11, 3736(%rsp)
	movdqa	%xmm9, 3864(%rsp)
	movdqa	%xmm10, 2344(%rsp)
	movq	8(%rsi), %rdx
	movdqa	%xmm4, 2856(%rsp)
	movq	24(%rsi), %rax
	movdqa	%xmm4, 2728(%rsp)
	movdqa	%xmm4, 2600(%rsp)
	movq	%rdx, %r11
	movq	%rdx, %r10
	movq	%rdx, %r8
	shrq	$49, %r11
	shrq	$60, %r10
	movq	%rax, %rcx
	movdqa	%xmm4, 2472(%rsp)
	salq	$7, %r10
	movq	%rax, %r9
	movdqa	%xmm10, 2216(%rsp)
	pxor	%xmm6, %xmm4
	andl	$1920, %r11d
	movdqa	%xmm10, 2088(%rsp)
	shrq	$60, %rcx
	movdqa	-120(%rsp,%r11), %xmm2
	movdqa	%xmm10, 1960(%rsp)
	salq	$7, %rcx
	movdqa	-104(%rsp,%r11), %xmm0
	movdqa	%xmm6, 3368(%rsp)
	shrq	$49, %r9
	movq	%rdx, %r11
	movdqa	%xmm6, 3240(%rsp)
	andl	$1920, %r9d
	shrq	$41, %r8
	movdqa	%xmm6, 3112(%rsp)
	andl	$1920, %r8d
	shrq	$45, %r11
	movdqa	%xmm6, 2984(%rsp)
	andl	$1920, %r11d
	movdqa	%xmm4, 3880(%rsp)
	movdqa	%xmm4, 3752(%rsp)
	movdqa	%xmm4, 3624(%rsp)
	movdqa	%xmm4, 3496(%rsp)
	movdqa	1960(%rsp,%r10), %xmm1
	pxor	1928(%rsp,%r10), %xmm2
	pxor	1944(%rsp,%r10), %xmm0
	movdqa	1960(%rsp,%rcx), %xmm3
	pxor	-120(%rsp,%r9), %xmm0
	movq	%rax, %r10
	pxor	-104(%rsp,%r9), %xmm1
	movq	%rax, %r9
	shrq	$41, %r10
	pxor	1928(%rsp,%rcx), %xmm0
	shrq	$45, %r9
	andl	$1920, %r10d
	pxor	1944(%rsp,%rcx), %xmm1
	movq	%rdx, %rcx
	palignr	$15, %xmm1, %xmm3
	palignr	$15, %xmm0, %xmm1
	andl	$1920, %r9d
	shrq	$33, %rcx
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %ecx
	pxor	1960(%rsp,%r11), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r8), %xmm0
	pxor	-104(%rsp,%r10), %xmm1
	pxor	-120(%rsp,%r8), %xmm2
	movq	%rdx, %r8
	pxor	1928(%rsp,%r11), %xmm2
	pxor	1944(%rsp,%r9), %xmm1
	shrq	$37, %r8
	pxor	1944(%rsp,%r11), %xmm0
	pxor	1960(%rsp,%r9), %xmm3
	movq	%rax, %r11
	pxor	-120(%rsp,%r10), %xmm0
	palignr	$15, %xmm1, %xmm3
	movq	%rax, %r10
	andl	$1920, %r8d
	pxor	1928(%rsp,%r9), %xmm0
	shrq	$33, %r11
	shrq	$37, %r10
	palignr	$15, %xmm0, %xmm1
	movq	%rdx, %r9
	andl	$1920, %r10d
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %r11d
	shrq	$25, %r9
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%rcx), %xmm0
	pxor	1960(%rsp,%r8), %xmm1
	pxor	-120(%rsp,%rcx), %xmm2
	movq	%rdx, %rcx
	pxor	1928(%rsp,%r8), %xmm2
	pxor	1944(%rsp,%r8), %xmm0
	shrq	$29, %rcx
	movq	%rax, %r8
	andl	$1920, %ecx
	pxor	-120(%rsp,%r11), %xmm0
	pxor	-104(%rsp,%r11), %xmm1
	andl	$1920, %r9d
	shrq	$25, %r8
	movq	%rax, %r11
	pxor	1928(%rsp,%r10), %xmm0
	shrq	$29, %r11
	pxor	1944(%rsp,%r10), %xmm1
	andl	$1920, %r8d
	andl	$1920, %r11d
	pxor	1960(%rsp,%r10), %xmm3
	palignr	$15, %xmm1, %xmm3
	movq	%rdx, %r10
	palignr	$15, %xmm0, %xmm1
	shrq	$17, %r10
	pxor	1960(%rsp,%r11), %xmm3
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %r10d
	pxor	1960(%rsp,%rcx), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r9), %xmm0
	pxor	1944(%rsp,%rcx), %xmm0
	pxor	-120(%rsp,%r9), %xmm2
	movq	%rdx, %r9
	pxor	1928(%rsp,%rcx), %xmm2
	movq	%rax, %rcx
	pxor	-120(%rsp,%r8), %xmm0
	shrq	$21, %r9
	pxor	-104(%rsp,%r8), %xmm1
	shrq	$17, %rcx
	movq	%rax, %r8
	pxor	1928(%rsp,%r11), %xmm0
	andl	$1920, %r9d
	shrq	$21, %r8
	pxor	1944(%rsp,%r11), %xmm1
	andl	$1920, %ecx
	palignr	$15, %xmm1, %xmm3
	palignr	$15, %xmm0, %xmm1
	andl	$1920, %r8d
	movq	%rdx, %r11
	palignr	$15, %xmm2, %xmm0
	shrq	$9, %r11
	pxor	1960(%rsp,%r9), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r10), %xmm0
	pxor	-104(%rsp,%rcx), %xmm1
	pxor	-120(%rsp,%r10), %xmm2
	movq	%rdx, %r10
	pxor	1928(%rsp,%r9), %xmm2
	pxor	1944(%rsp,%r9), %xmm0
	movq	%rax, %r9
	pxor	-120(%rsp,%rcx), %xmm0
	movq	%rax, %rcx
	shrq	$13, %r10
	andl	$1920, %r11d
	pxor	1928(%rsp,%r8), %xmm0
	shrq	$9, %r9
	pxor	1944(%rsp,%r8), %xmm1
	pxor	1960(%rsp,%r8), %xmm3
	shrq	$13, %rcx
	movq	%rdx, %r8
	andl	$1920, %r10d
	andl	$1920, %ecx
	shrq	%r8
	andl	$1920, %r9d
	palignr	$15, %xmm1, %xmm3
	andl	$1920, %r8d
	pxor	1960(%rsp,%rcx), %xmm3
	palignr	$15, %xmm0, %xmm1
	pxor	1960(%rsp,%r10), %xmm1
	palignr	$15, %xmm2, %xmm0
	pxor	-104(%rsp,%r9), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r11), %xmm0
	pxor	1944(%rsp,%rcx), %xmm1
	pxor	-120(%rsp,%r11), %xmm2
	palignr	$15, %xmm1, %xmm3
	movq	%rdx, %r11
	pxor	1928(%rsp,%r10), %xmm2
	shrq	$5, %r11
	pxor	1944(%rsp,%r10), %xmm0
	movq	%rax, %r10
	pxor	-120(%rsp,%r9), %xmm0
	movq	%rax, %r9
	pxor	1928(%rsp,%rcx), %xmm0
	palignr	$15, %xmm0, %xmm1
	shrq	%r10
	palignr	$15, %xmm2, %xmm0
	shrq	$5, %r9
	movq	%rdx, %rcx
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r8), %xmm0
	andl	$1920, %r11d
	pxor	-120(%rsp,%r8), %xmm2
	movq	%rax, %r8
	andl	$1920, %r9d
	andl	$1920, %r10d
	andl	$15, %ecx
	salq	$3, %rdx
	andl	$15, %r8d
	andl	$1920, %edx
	salq	$7, %rcx
	pxor	1928(%rsp,%r11), %xmm2
	salq	$7, %r8
	pxor	1944(%rsp,%r11), %xmm0
	pxor	1960(%rsp,%r11), %xmm1
	pxor	-120(%rsp,%r10), %xmm0
	salq	$3, %rax
	pxor	1928(%rsp,%r9), %xmm0
	andl	$1920, %eax
	pxor	-104(%rsp,%r10), %xmm1
	pxor	1960(%rsp,%r9), %xmm3
	pxor	1944(%rsp,%r9), %xmm1
	palignr	$15, %xmm1, %xmm3
	pxor	1960(%rsp,%rax), %xmm3
	palignr	$15, %xmm0, %xmm1
	pxor	1960(%rsp,%rdx), %xmm1
	palignr	$15, %xmm2, %xmm0
	pxor	-104(%rsp,%r8), %xmm1
	pxor	-104(%rsp,%rcx), %xmm0
	pslldq	$1, %xmm2
	pxor	1944(%rsp,%rdx), %xmm0
	pxor	-120(%rsp,%r8), %xmm0
	movq	(%rsi), %r8
	pxor	-120(%rsp,%rcx), %xmm2
	pxor	1928(%rsp,%rax), %xmm0
	pxor	1944(%rsp,%rax), %xmm1
	movq	16(%rsi), %rax
	pxor	1928(%rsp,%rdx), %xmm2
	palignr	$15, %xmm1, %xmm3
	palignr	$15, %xmm0, %xmm1
	movq	%r8, %r11
	movq	%r8, %r10
	movq	%r8, %rcx
	movq	%rax, %r9
	movq	%rax, %rsi
	shrq	$49, %r11
	andl	$1920, %r11d
	shrq	$60, %r10
	movq	%r8, %rdx
	shrq	$49, %r9
	shrq	$60, %rsi
	palignr	$15, %xmm2, %xmm0
	salq	$7, %r10
	salq	$7, %rsi
	andl	$1920, %r9d
	shrq	$41, %rcx
	pslldq	$1, %xmm2
	shrq	$45, %rdx
	pxor	-120(%rsp,%r11), %xmm2
	andl	$1920, %ecx
	pxor	1928(%rsp,%r10), %xmm2
	pxor	-104(%rsp,%r11), %xmm0
	movq	%rax, %r11
	pxor	1944(%rsp,%r10), %xmm0
	pxor	1960(%rsp,%r10), %xmm1
	movq	%rax, %r10
	pxor	-120(%rsp,%r9), %xmm0
	pxor	-104(%rsp,%r9), %xmm1
	shrq	$41, %r11
	movq	%r8, %r9
	pxor	1928(%rsp,%rsi), %xmm0
	andl	$1920, %edx
	pxor	1944(%rsp,%rsi), %xmm1
	shrq	$45, %r10
	andl	$1920, %r11d
	shrq	$33, %r9
	pxor	1960(%rsp,%rsi), %xmm3
	palignr	$15, %xmm1, %xmm3
	movq	%r8, %rsi
	palignr	$15, %xmm0, %xmm1
	andl	$1920, %r10d
	shrq	$37, %rsi
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %esi
	pxor	1960(%rsp,%rdx), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%rcx), %xmm0
	pxor	1944(%rsp,%rdx), %xmm0
	pxor	-120(%rsp,%rcx), %xmm2
	movq	%rax, %rcx
	pxor	1928(%rsp,%rdx), %xmm2
	shrq	$33, %rcx
	movq	%rax, %rdx
	pxor	-120(%rsp,%r11), %xmm0
	pxor	-104(%rsp,%r11), %xmm1
	andl	$1920, %ecx
	shrq	$37, %rdx
	pxor	1928(%rsp,%r10), %xmm0
	movq	%r8, %r11
	pxor	1944(%rsp,%r10), %xmm1
	pxor	1960(%rsp,%r10), %xmm3
	andl	$1920, %r9d
	movq	%r8, %r10
	palignr	$15, %xmm1, %xmm3
	andl	$1920, %edx
	shrq	$25, %r11
	palignr	$15, %xmm0, %xmm1
	shrq	$29, %r10
	pxor	1960(%rsp,%rdx), %xmm3
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %r10d
	pxor	1960(%rsp,%rsi), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r9), %xmm0
	pxor	-104(%rsp,%rcx), %xmm1
	pxor	-120(%rsp,%r9), %xmm2
	movq	%rax, %r9
	pxor	1928(%rsp,%rsi), %xmm2
	pxor	1944(%rsp,%rsi), %xmm0
	movq	%rax, %rsi
	pxor	-120(%rsp,%rcx), %xmm0
	movq	%r8, %rcx
	andl	$1920, %r11d
	shrq	$25, %r9
	shrq	$29, %rsi
	shrq	$17, %rcx
	andl	$1920, %r9d
	pxor	1928(%rsp,%rdx), %xmm0
	andl	$1920, %esi
	pxor	1944(%rsp,%rdx), %xmm1
	movq	%r8, %rdx
	palignr	$15, %xmm1, %xmm3
	andl	$1920, %ecx
	palignr	$15, %xmm0, %xmm1
	shrq	$21, %rdx
	pxor	1960(%rsp,%rsi), %xmm3
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %edx
	pxor	1960(%rsp,%r10), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r11), %xmm0
	pxor	1944(%rsp,%r10), %xmm0
	pxor	-120(%rsp,%r11), %xmm2
	movq	%rax, %r11
	pxor	1928(%rsp,%r10), %xmm2
	movq	%rax, %r10
	pxor	-120(%rsp,%r9), %xmm0
	shrq	$17, %r11
	pxor	1928(%rsp,%rsi), %xmm0
	pxor	-104(%rsp,%r9), %xmm1
	shrq	$21, %r10
	pxor	1944(%rsp,%rsi), %xmm1
	movq	%r8, %r9
	movq	%r8, %rsi
	palignr	$15, %xmm1, %xmm3
	shrq	$9, %r9
	shrq	$13, %rsi
	palignr	$15, %xmm0, %xmm1
	andl	$1920, %r10d
	andl	$1920, %r11d
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %esi
	pxor	1960(%rsp,%rdx), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%rcx), %xmm0
	pxor	1944(%rsp,%rdx), %xmm0
	pxor	-120(%rsp,%rcx), %xmm2
	movq	%rax, %rcx
	pxor	1928(%rsp,%rdx), %xmm2
	movq	%rax, %rdx
	pxor	-120(%rsp,%r11), %xmm0
	pxor	-104(%rsp,%r11), %xmm1
	andl	$1920, %r9d
	shrq	$9, %rcx
	movq	%r8, %r11
	pxor	1928(%rsp,%r10), %xmm0
	shrq	$13, %rdx
	shrq	%r11
	pxor	1944(%rsp,%r10), %xmm1
	andl	$1920, %edx
	pxor	1960(%rsp,%r10), %xmm3
	palignr	$15, %xmm1, %xmm3
	andl	$1920, %ecx
	movq	%r8, %r10
	palignr	$15, %xmm0, %xmm1
	shrq	$5, %r10
	andl	$1920, %r11d
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %r10d
	pxor	1960(%rsp,%rsi), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%r9), %xmm0
	pxor	1944(%rsp,%rsi), %xmm0
	pxor	-120(%rsp,%r9), %xmm2
	movq	%rax, %r9
	pxor	1928(%rsp,%rsi), %xmm2
	movq	%rax, %rsi
	pxor	-120(%rsp,%rcx), %xmm0
	pxor	-104(%rsp,%rcx), %xmm1
	pxor	1928(%rsp,%rdx), %xmm0
	shrq	%r9
	movq	%r8, %rcx
	pxor	1944(%rsp,%rdx), %xmm1
	shrq	$5, %rsi
	andl	$15, %ecx
	pxor	1960(%rsp,%rdx), %xmm3
	movq	%rax, %rdx
	andl	$1920, %esi
	palignr	$15, %xmm1, %xmm3
	andl	$1920, %r9d
	andl	$15, %edx
	palignr	$15, %xmm0, %xmm1
	salq	$3, %r8
	salq	$3, %rax
	palignr	$15, %xmm2, %xmm0
	andl	$1920, %eax
	salq	$7, %rcx
	pslldq	$1, %xmm2
	salq	$7, %rdx
	pxor	-104(%rsp,%r11), %xmm0
	pxor	-120(%rsp,%r11), %xmm2
	andl	$1920, %r8d
	pxor	1928(%rsp,%r10), %xmm2
	pxor	1944(%rsp,%r10), %xmm0
	pxor	-120(%rsp,%r9), %xmm0
	pxor	1960(%rsp,%r10), %xmm1
	pxor	1928(%rsp,%rsi), %xmm0
	pxor	-104(%rsp,%r9), %xmm1
	pxor	1960(%rsp,%rsi), %xmm3
	pxor	1944(%rsp,%rsi), %xmm1
	palignr	$15, %xmm1, %xmm3
	pxor	1960(%rsp,%rax), %xmm3
	palignr	$15, %xmm0, %xmm1
	pxor	1960(%rsp,%r8), %xmm1
	palignr	$15, %xmm2, %xmm0
	pxor	-104(%rsp,%rdx), %xmm1
	pslldq	$1, %xmm2
	pxor	-104(%rsp,%rcx), %xmm0
	pxor	1944(%rsp,%rax), %xmm1
	pxor	1944(%rsp,%r8), %xmm0
	pxor	-120(%rsp,%rcx), %xmm2
	pxor	-120(%rsp,%rdx), %xmm0
	pxor	1928(%rsp,%r8), %xmm2
	pxor	1928(%rsp,%rax), %xmm0
	movdqa	%xmm2, (%rdi)
	movdqa	%xmm0, 16(%rdi)
	movdqa	%xmm1, 32(%rdi)
	movdqa	%xmm3, 48(%rdi)
	addq	$3984, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE592:
	.size	fb_muln_low, .-fb_muln_low
	.p2align 4,,15
	.globl	fb_mulm_low
	.type	fb_mulm_low, @function
fb_mulm_low:
.LFB593:
	.cfi_startproc
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4104
	pxor	%xmm11, %xmm11
	movdqa	(%rdx), %xmm10
	movdqa	%xmm11, -72(%rsp)
	movdqa	%xmm11, 1976(%rsp)
	movdqa	%xmm10, %xmm13
	movdqa	%xmm10, %xmm0
	movdqa	%xmm10, %xmm3
	psrlq	$57, %xmm13
	movdqa	%xmm10, %xmm15
	movdqa	%xmm10, 56(%rsp)
	movdqa	%xmm13, %xmm5
	psllq	$2, %xmm0
	pslldq	$8, %xmm5
	movdqa	%xmm5, %xmm1
	movdqa	%xmm5, %xmm12
	movdqa	%xmm5, %xmm8
	psrlq	$4, %xmm1
	psrlq	$5, %xmm12
	psllq	$3, %xmm3
	pxor	%xmm12, %xmm0
	movdqa	%xmm10, %xmm12
	pxor	%xmm1, %xmm3
	psrlq	$6, %xmm8
	movdqa	%xmm0, %xmm4
	movdqa	%xmm0, %xmm14
	movdqa	%xmm0, %xmm9
	movdqa	%xmm3, %xmm2
	movdqa	%xmm3, %xmm7
	movdqa	%xmm3, %xmm6
	pxor	%xmm10, %xmm4
	movdqa	%xmm0, 440(%rsp)
	psllq	$1, %xmm15
	pxor	%xmm3, %xmm0
	movdqa	%xmm0, %xmm1
	pxor	%xmm8, %xmm15
	pxor	%xmm10, %xmm2
	pxor	%xmm15, %xmm12
	pxor	%xmm15, %xmm14
	pxor	%xmm12, %xmm9
	pxor	%xmm15, %xmm7
	pxor	%xmm12, %xmm6
	pxor	%xmm10, %xmm1
	movdqa	%xmm15, 184(%rsp)
	movdqa	%xmm5, %xmm8
	pxor	%xmm0, %xmm15
	movdqa	%xmm12, 312(%rsp)
	psrlq	$1, %xmm8
	movdqa	%xmm0, 1464(%rsp)
	pxor	%xmm12, %xmm0
	movdqa	%xmm10, %xmm12
	movdqa	%xmm1, 1592(%rsp)
	movdqa	%xmm10, %xmm1
	psllq	$5, %xmm12
	movdqa	%xmm15, 1720(%rsp)
	movdqa	%xmm10, %xmm15
	psllq	$7, %xmm10
	pxor	%xmm5, %xmm10
	psllq	$4, %xmm15
	movdqa	%xmm4, 568(%rsp)
	psllq	$6, %xmm1
	movdqa	%xmm5, %xmm4
	movdqa	%xmm14, 696(%rsp)
	psrlq	$3, %xmm5
	pxor	%xmm8, %xmm1
	movdqa	%xmm9, 824(%rsp)
	pxor	%xmm5, %xmm15
	psrlq	$2, %xmm4
	movdqa	%xmm3, 952(%rsp)
	movdqa	%xmm2, 1080(%rsp)
	movdqa	%xmm1, %xmm14
	movdqa	%xmm1, %xmm9
	movdqa	%xmm7, 1208(%rsp)
	movdqa	%xmm1, %xmm2
	movdqa	%xmm10, %xmm7
	movdqa	%xmm10, %xmm3
	pxor	%xmm4, %xmm12
	pxor	%xmm15, %xmm14
	movdqa	%xmm6, 1336(%rsp)
	movdqa	%xmm10, %xmm6
	pxor	%xmm12, %xmm9
	movdqa	%xmm0, 1848(%rsp)
	movdqa	%xmm15, %xmm0
	pxor	%xmm15, %xmm7
	pxor	%xmm12, %xmm0
	pxor	%xmm12, %xmm6
	movdqa	%xmm15, 2104(%rsp)
	movdqa	%xmm12, 2232(%rsp)
	pxor	%xmm0, %xmm2
	pxor	%xmm0, %xmm3
	movdqa	%xmm0, 2360(%rsp)
	psrldq	$8, %xmm13
	movdqa	%xmm1, 2488(%rsp)
	movdqa	%xmm14, 2616(%rsp)
	movdqa	%xmm9, 2744(%rsp)
	movdqa	%xmm2, 2872(%rsp)
	movdqa	%xmm10, 3000(%rsp)
	pxor	%xmm1, %xmm10
	pxor	%xmm10, %xmm15
	movdqa	%xmm7, 3128(%rsp)
	pxor	%xmm10, %xmm12
	movdqa	%xmm6, 3256(%rsp)
	movdqa	%xmm3, 3384(%rsp)
	movdqa	%xmm10, 3512(%rsp)
	pxor	%xmm0, %xmm10
	movdqa	%xmm15, 3640(%rsp)
	movdqa	%xmm12, 3768(%rsp)
	movdqa	%xmm10, 3896(%rsp)
	movdqa	16(%rdx), %xmm0
	movdqa	%xmm11, -56(%rsp)
	movdqa	%xmm0, %xmm10
	movdqa	%xmm0, %xmm15
	movdqa	%xmm0, %xmm12
	psrlq	$57, %xmm10
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, 72(%rsp)
	movdqa	%xmm10, %xmm8
	psllq	$1, %xmm15
	movdqa	%xmm11, 1992(%rsp)
	pslldq	$8, %xmm8
	pxor	%xmm8, %xmm13
	movdqa	%xmm13, %xmm5
	movdqa	%xmm13, %xmm4
	movdqa	%xmm13, %xmm14
	psrlq	$4, %xmm5
	psrlq	$5, %xmm4
	psrlq	$6, %xmm14
	psllq	$2, %xmm12
	pxor	%xmm14, %xmm15
	movdqa	%xmm0, %xmm14
	psllq	$3, %xmm1
	pxor	%xmm4, %xmm12
	movdqa	%xmm12, %xmm9
	pxor	%xmm5, %xmm1
	movdqa	%xmm12, %xmm2
	movdqa	%xmm12, %xmm7
	movdqa	%xmm1, %xmm6
	movdqa	%xmm1, %xmm3
	movdqa	%xmm1, %xmm5
	pxor	%xmm15, %xmm14
	pxor	%xmm0, %xmm9
	movdqa	%xmm12, 456(%rsp)
	pxor	%xmm1, %xmm12
	movdqa	%xmm12, %xmm4
	movdqa	%xmm15, 200(%rsp)
	pxor	%xmm15, %xmm2
	pxor	%xmm14, %xmm7
	pxor	%xmm0, %xmm6
	pxor	%xmm15, %xmm3
	pxor	%xmm14, %xmm5
	pxor	%xmm0, %xmm4
	movdqa	%xmm14, 328(%rsp)
	pxor	%xmm12, %xmm15
	psrldq	$8, %xmm10
	movdqa	%xmm9, 584(%rsp)
	movdqa	%xmm13, %xmm9
	movdqa	%xmm12, 1480(%rsp)
	pxor	%xmm14, %xmm12
	movdqa	%xmm0, %xmm14
	movdqa	%xmm15, 1736(%rsp)
	movdqa	%xmm0, %xmm15
	psrlq	$1, %xmm9
	movdqa	%xmm12, 1864(%rsp)
	movdqa	%xmm0, %xmm12
	psllq	$7, %xmm0
	pxor	%xmm13, %xmm0
	psllq	$4, %xmm15
	movdqa	%xmm2, 712(%rsp)
	psllq	$6, %xmm12
	movdqa	%xmm13, %xmm2
	movdqa	%xmm7, 840(%rsp)
	psrlq	$3, %xmm13
	pxor	%xmm9, %xmm12
	movdqa	%xmm1, 968(%rsp)
	pxor	%xmm13, %xmm15
	psrlq	$2, %xmm2
	movdqa	%xmm6, 1096(%rsp)
	movdqa	%xmm3, 1224(%rsp)
	movdqa	%xmm15, %xmm13
	movdqa	%xmm12, %xmm7
	movdqa	%xmm12, %xmm6
	movdqa	%xmm12, %xmm3
	movdqa	%xmm0, %xmm1
	psllq	$5, %xmm14
	pxor	%xmm15, %xmm7
	movdqa	%xmm10, %xmm9
	movdqa	%xmm5, 1352(%rsp)
	movdqa	%xmm0, %xmm5
	pxor	%xmm2, %xmm14
	movdqa	%xmm4, 1608(%rsp)
	movdqa	%xmm0, %xmm4
	pxor	%xmm14, %xmm13
	movdqa	%xmm15, 2120(%rsp)
	pxor	%xmm14, %xmm6
	pxor	%xmm15, %xmm5
	movdqa	%xmm14, 2248(%rsp)
	pxor	%xmm14, %xmm1
	pxor	%xmm13, %xmm3
	movdqa	%xmm12, 2504(%rsp)
	pxor	%xmm13, %xmm4
	pxor	%xmm0, %xmm12
	movdqa	%xmm7, 2632(%rsp)
	pxor	%xmm12, %xmm15
	pxor	%xmm12, %xmm14
	movdqa	%xmm6, 2760(%rsp)
	psrlq	$1, %xmm9
	movdqa	%xmm3, 2888(%rsp)
	movdqa	%xmm0, 3016(%rsp)
	movdqa	%xmm5, 3144(%rsp)
	movdqa	%xmm1, 3272(%rsp)
	movdqa	%xmm4, 3400(%rsp)
	movdqa	%xmm12, 3528(%rsp)
	pxor	%xmm13, %xmm12
	movdqa	%xmm13, 2376(%rsp)
	movdqa	%xmm15, 3656(%rsp)
	movdqa	%xmm14, 3784(%rsp)
	movdqa	%xmm12, 3912(%rsp)
	movdqa	%xmm11, 2392(%rsp)
	movq	8(%rsi), %r10
	movdqa	%xmm9, 2904(%rsp)
	movq	24(%rsi), %r8
	movdqa	%xmm9, 2776(%rsp)
	movdqa	%xmm9, 2648(%rsp)
	movq	%r10, %r11
	movq	%r10, %r9
	movq	%r10, %rdx
	shrq	$49, %r11
	shrq	$60, %r9
	movq	%r8, %rcx
	movdqa	%xmm9, 2520(%rsp)
	salq	$7, %r9
	pxor	%xmm10, %xmm9
	movdqa	%xmm11, 2264(%rsp)
	movq	%r8, %rax
	andl	$1920, %r11d
	movdqa	%xmm11, 2136(%rsp)
	shrq	$60, %rcx
	movdqa	-72(%rsp,%r11), %xmm2
	movdqa	%xmm11, 2008(%rsp)
	salq	$7, %rcx
	movdqa	-56(%rsp,%r11), %xmm7
	movdqa	%xmm10, 3416(%rsp)
	shrq	$49, %rax
	movq	%r10, %r11
	movdqa	%xmm10, 3288(%rsp)
	andl	$1920, %eax
	shrq	$41, %rdx
	movdqa	%xmm10, 3160(%rsp)
	andl	$1920, %edx
	shrq	$45, %r11
	movdqa	%xmm10, 3032(%rsp)
	andl	$1920, %r11d
	movdqa	%xmm9, 3928(%rsp)
	movdqa	%xmm9, 3800(%rsp)
	movdqa	%xmm9, 3672(%rsp)
	movdqa	%xmm9, 3544(%rsp)
	movdqa	2008(%rsp,%r9), %xmm6
	pxor	1976(%rsp,%r9), %xmm2
	pxor	1992(%rsp,%r9), %xmm7
	movdqa	2008(%rsp,%rcx), %xmm3
	pxor	-72(%rsp,%rax), %xmm7
	movq	%r8, %r9
	pxor	-56(%rsp,%rax), %xmm6
	movq	%r8, %rax
	shrq	$41, %r9
	pxor	1976(%rsp,%rcx), %xmm7
	shrq	$45, %rax
	andl	$1920, %r9d
	pxor	1992(%rsp,%rcx), %xmm6
	movq	%r10, %rcx
	palignr	$15, %xmm6, %xmm3
	palignr	$15, %xmm7, %xmm6
	andl	$1920, %eax
	shrq	$33, %rcx
	palignr	$15, %xmm2, %xmm7
	andl	$1920, %ecx
	pxor	2008(%rsp,%r11), %xmm6
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rdx), %xmm7
	pxor	-56(%rsp,%r9), %xmm6
	pxor	1992(%rsp,%r11), %xmm7
	pxor	-72(%rsp,%rdx), %xmm2
	movq	%r10, %rdx
	pxor	1976(%rsp,%r11), %xmm2
	shrq	$37, %rdx
	movq	%r8, %r11
	pxor	1992(%rsp,%rax), %xmm6
	pxor	-72(%rsp,%r9), %xmm7
	movq	%r8, %r9
	pxor	1976(%rsp,%rax), %xmm7
	andl	$1920, %edx
	shrq	$33, %r11
	pxor	2008(%rsp,%rax), %xmm3
	palignr	$15, %xmm6, %xmm3
	shrq	$37, %r9
	palignr	$15, %xmm7, %xmm6
	movq	%r10, %rax
	andl	$1920, %r9d
	palignr	$15, %xmm2, %xmm7
	andl	$1920, %r11d
	shrq	$25, %rax
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rcx), %xmm7
	pxor	2008(%rsp,%rdx), %xmm6
	pxor	-72(%rsp,%rcx), %xmm2
	movq	%r10, %rcx
	pxor	1976(%rsp,%rdx), %xmm2
	shrq	$29, %rcx
	pxor	-56(%rsp,%r11), %xmm6
	pxor	1992(%rsp,%rdx), %xmm7
	movq	%r8, %rdx
	andl	$1920, %ecx
	pxor	-72(%rsp,%r11), %xmm7
	andl	$1920, %eax
	shrq	$25, %rdx
	movq	%r8, %r11
	pxor	1976(%rsp,%r9), %xmm7
	andl	$1920, %edx
	pxor	1992(%rsp,%r9), %xmm6
	pxor	2008(%rsp,%r9), %xmm3
	palignr	$15, %xmm6, %xmm3
	movq	%r10, %r9
	palignr	$15, %xmm7, %xmm6
	shrq	$29, %r11
	palignr	$15, %xmm2, %xmm7
	andl	$1920, %r11d
	pxor	2008(%rsp,%rcx), %xmm6
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rax), %xmm7
	shrq	$17, %r9
	pxor	-72(%rsp,%rax), %xmm2
	movq	%r10, %rax
	pxor	1976(%rsp,%rcx), %xmm2
	pxor	1992(%rsp,%rcx), %xmm7
	movq	%r8, %rcx
	pxor	-72(%rsp,%rdx), %xmm7
	pxor	-56(%rsp,%rdx), %xmm6
	shrq	$21, %rax
	shrq	$17, %rcx
	movq	%r8, %rdx
	andl	$1920, %eax
	andl	$1920, %r9d
	pxor	1976(%rsp,%r11), %xmm7
	andl	$1920, %ecx
	pxor	1992(%rsp,%r11), %xmm6
	pxor	2008(%rsp,%r11), %xmm3
	shrq	$21, %rdx
	movq	%r10, %r11
	palignr	$15, %xmm6, %xmm3
	andl	$1920, %edx
	shrq	$9, %r11
	palignr	$15, %xmm7, %xmm6
	andl	$1920, %r11d
	pxor	2008(%rsp,%rdx), %xmm3
	pxor	2008(%rsp,%rax), %xmm6
	palignr	$15, %xmm2, %xmm7
	pxor	-56(%rsp,%rcx), %xmm6
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%r9), %xmm7
	pxor	1992(%rsp,%rax), %xmm7
	pxor	-72(%rsp,%r9), %xmm2
	pxor	-72(%rsp,%rcx), %xmm7
	movq	%r10, %r9
	pxor	1976(%rsp,%rax), %xmm2
	movq	%r8, %rcx
	movq	%r8, %rax
	pxor	1976(%rsp,%rdx), %xmm7
	shrq	$13, %r9
	shrq	$9, %rax
	shrq	$13, %rcx
	andl	$1920, %r9d
	andl	$1920, %eax
	pxor	1992(%rsp,%rdx), %xmm6
	movq	%r10, %rdx
	andl	$1920, %ecx
	palignr	$15, %xmm6, %xmm3
	shrq	%rdx
	palignr	$15, %xmm7, %xmm6
	andl	$1920, %edx
	pxor	2008(%rsp,%rcx), %xmm3
	pxor	2008(%rsp,%r9), %xmm6
	palignr	$15, %xmm2, %xmm7
	pxor	-56(%rsp,%rax), %xmm6
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%r11), %xmm7
	pxor	1992(%rsp,%rcx), %xmm6
	pxor	-72(%rsp,%r11), %xmm2
	palignr	$15, %xmm6, %xmm3
	movq	%r10, %r11
	pxor	1976(%rsp,%r9), %xmm2
	shrq	$5, %r11
	pxor	1992(%rsp,%r9), %xmm7
	movq	%r8, %r9
	pxor	-72(%rsp,%rax), %xmm7
	movq	%r8, %rax
	pxor	1976(%rsp,%rcx), %xmm7
	palignr	$15, %xmm7, %xmm6
	shrq	%r9
	palignr	$15, %xmm2, %xmm7
	shrq	$5, %rax
	movq	%r10, %rcx
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rdx), %xmm7
	andl	$15, %ecx
	pxor	-72(%rsp,%rdx), %xmm2
	movq	%r8, %rdx
	andl	$1920, %eax
	andl	$1920, %r11d
	salq	$3, %r10
	andl	$15, %edx
	andl	$1920, %r9d
	andl	$1920, %r10d
	salq	$7, %rcx
	pxor	1976(%rsp,%r11), %xmm2
	salq	$7, %rdx
	pxor	1992(%rsp,%r11), %xmm7
	pxor	2008(%rsp,%r11), %xmm6
	pxor	-72(%rsp,%r9), %xmm7
	salq	$3, %r8
	pxor	1976(%rsp,%rax), %xmm7
	pxor	-56(%rsp,%r9), %xmm6
	pxor	2008(%rsp,%rax), %xmm3
	pxor	1992(%rsp,%rax), %xmm6
	palignr	$15, %xmm6, %xmm3
	andl	$1920, %r8d
	pxor	2008(%rsp,%r8), %xmm3
	palignr	$15, %xmm7, %xmm6
	pxor	2008(%rsp,%r10), %xmm6
	palignr	$15, %xmm2, %xmm7
	pxor	-56(%rsp,%rdx), %xmm6
	pxor	-56(%rsp,%rcx), %xmm7
	pslldq	$1, %xmm2
	pxor	1992(%rsp,%r10), %xmm7
	pxor	-72(%rsp,%rdx), %xmm7
	movq	(%rsi), %rdx
	pxor	-72(%rsp,%rcx), %xmm2
	pxor	1976(%rsp,%r8), %xmm7
	pxor	1992(%rsp,%r8), %xmm6
	movq	16(%rsi), %r8
	pxor	1976(%rsp,%r10), %xmm2
	palignr	$15, %xmm6, %xmm3
	palignr	$15, %xmm7, %xmm6
	movq	%rdx, %r11
	movq	%rdx, %r9
	movq	%rdx, %rcx
	shrq	$49, %r11
	movq	%r8, %rsi
	movq	%r8, %rax
	andl	$1920, %r11d
	shrq	$60, %r9
	movq	%rdx, %r10
	salq	$7, %r9
	palignr	$15, %xmm2, %xmm7
	shrq	$49, %rsi
	shrq	$60, %rax
	pslldq	$1, %xmm2
	shrq	$41, %rcx
	salq	$7, %rax
	pxor	-72(%rsp,%r11), %xmm2
	pxor	-56(%rsp,%r11), %xmm7
	andl	$1920, %esi
	movq	%r8, %r11
	andl	$1920, %ecx
	pxor	1976(%rsp,%r9), %xmm2
	shrq	$45, %r10
	pxor	1992(%rsp,%r9), %xmm7
	pxor	2008(%rsp,%r9), %xmm6
	movq	%r8, %r9
	pxor	-72(%rsp,%rsi), %xmm7
	pxor	-56(%rsp,%rsi), %xmm6
	shrq	$41, %r11
	shrq	$45, %r9
	pxor	1976(%rsp,%rax), %xmm7
	movq	%rdx, %rsi
	pxor	1992(%rsp,%rax), %xmm6
	pxor	2008(%rsp,%rax), %xmm3
	movq	%rdx, %rax
	palignr	$15, %xmm6, %xmm3
	palignr	$15, %xmm7, %xmm6
	andl	$1920, %r10d
	andl	$1920, %r9d
	palignr	$15, %xmm2, %xmm7
	shrq	$33, %rsi
	shrq	$37, %rax
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rcx), %xmm7
	andl	$1920, %r11d
	pxor	-72(%rsp,%rcx), %xmm2
	movq	%r8, %rcx
	pxor	1976(%rsp,%r10), %xmm2
	andl	$1920, %eax
	andl	$1920, %esi
	shrq	$33, %rcx
	pxor	1992(%rsp,%r10), %xmm7
	andl	$1920, %ecx
	pxor	2008(%rsp,%r10), %xmm6
	pxor	-72(%rsp,%r11), %xmm7
	pxor	-56(%rsp,%r11), %xmm6
	movq	%r8, %r10
	pxor	1976(%rsp,%r9), %xmm7
	shrq	$37, %r10
	movq	%rdx, %r11
	pxor	1992(%rsp,%r9), %xmm6
	andl	$1920, %r10d
	shrq	$25, %r11
	pxor	2008(%rsp,%r9), %xmm3
	palignr	$15, %xmm6, %xmm3
	movq	%rdx, %r9
	palignr	$15, %xmm7, %xmm6
	shrq	$29, %r9
	pxor	2008(%rsp,%r10), %xmm3
	palignr	$15, %xmm2, %xmm7
	andl	$1920, %r9d
	pxor	2008(%rsp,%rax), %xmm6
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rsi), %xmm7
	pxor	1992(%rsp,%rax), %xmm7
	pxor	-72(%rsp,%rsi), %xmm2
	movq	%r8, %rsi
	pxor	1976(%rsp,%rax), %xmm2
	movq	%r8, %rax
	pxor	-72(%rsp,%rcx), %xmm7
	pxor	-56(%rsp,%rcx), %xmm6
	shrq	$25, %rsi
	shrq	$29, %rax
	movq	%rdx, %rcx
	andl	$1920, %eax
	andl	$1920, %r11d
	shrq	$17, %rcx
	pxor	1976(%rsp,%r10), %xmm7
	andl	$1920, %esi
	pxor	1992(%rsp,%r10), %xmm6
	palignr	$15, %xmm6, %xmm3
	andl	$1920, %ecx
	movq	%rdx, %r10
	palignr	$15, %xmm7, %xmm6
	shrq	$21, %r10
	pxor	2008(%rsp,%rax), %xmm3
	palignr	$15, %xmm2, %xmm7
	andl	$1920, %r10d
	pxor	2008(%rsp,%r9), %xmm6
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%r11), %xmm7
	pxor	-56(%rsp,%rsi), %xmm6
	pxor	1992(%rsp,%rax), %xmm6
	pxor	-72(%rsp,%r11), %xmm2
	pxor	1992(%rsp,%r9), %xmm7
	palignr	$15, %xmm6, %xmm3
	pxor	-72(%rsp,%rsi), %xmm7
	movq	%r8, %r11
	pxor	1976(%rsp,%rax), %xmm7
	palignr	$15, %xmm7, %xmm6
	movq	%rdx, %rsi
	shrq	$17, %r11
	movq	%rdx, %rax
	shrq	$9, %rsi
	pxor	1976(%rsp,%r9), %xmm2
	movq	%r8, %r9
	shrq	$13, %rax
	palignr	$15, %xmm2, %xmm7
	shrq	$21, %r9
	andl	$1920, %eax
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rcx), %xmm7
	andl	$1920, %r9d
	pxor	-72(%rsp,%rcx), %xmm2
	movq	%r8, %rcx
	andl	$1920, %r11d
	shrq	$9, %rcx
	andl	$1920, %esi
	pxor	1976(%rsp,%r10), %xmm2
	pxor	1992(%rsp,%r10), %xmm7
	andl	$1920, %ecx
	pxor	2008(%rsp,%r10), %xmm6
	pxor	-72(%rsp,%r11), %xmm7
	pxor	-56(%rsp,%r11), %xmm6
	movq	%r8, %r10
	pxor	1976(%rsp,%r9), %xmm7
	shrq	$13, %r10
	movq	%rdx, %r11
	pxor	1992(%rsp,%r9), %xmm6
	andl	$1920, %r10d
	shrq	%r11
	pxor	2008(%rsp,%r9), %xmm3
	palignr	$15, %xmm6, %xmm3
	movq	%rdx, %r9
	palignr	$15, %xmm7, %xmm6
	shrq	$5, %r9
	pxor	2008(%rsp,%r10), %xmm3
	palignr	$15, %xmm2, %xmm7
	andl	$1920, %r9d
	pxor	2008(%rsp,%rax), %xmm6
	pxor	-56(%rsp,%rsi), %xmm7
	pxor	-56(%rsp,%rcx), %xmm6
	pxor	1992(%rsp,%rax), %xmm7
	pslldq	$1, %xmm2
	pxor	-72(%rsp,%rcx), %xmm7
	movq	%rdx, %rcx
	pxor	-72(%rsp,%rsi), %xmm2
	andl	$15, %ecx
	pxor	1976(%rsp,%rax), %xmm2
	movq	%r8, %rsi
	movq	%r8, %rax
	salq	$7, %rcx
	shrq	%rsi
	shrq	$5, %rax
	andl	$1920, %r11d
	andl	$1920, %eax
	andl	$1920, %esi
	salq	$3, %rdx
	pxor	1976(%rsp,%r10), %xmm7
	movdqa	-72(%rsp,%rcx), %xmm5
	pxor	1992(%rsp,%r10), %xmm6
	movq	%r8, %r10
	palignr	$15, %xmm6, %xmm3
	salq	$3, %r8
	palignr	$15, %xmm7, %xmm6
	andl	$1920, %edx
	andl	$15, %r10d
	palignr	$15, %xmm2, %xmm7
	salq	$7, %r10
	andl	$1920, %r8d
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%r11), %xmm7
	pxor	2008(%rsp,%r9), %xmm6
	pxor	-72(%rsp,%r11), %xmm2
	pxor	-56(%rsp,%rsi), %xmm6
	pxor	1976(%rsp,%r9), %xmm2
	pxor	1992(%rsp,%rax), %xmm6
	pxor	1992(%rsp,%r9), %xmm7
	pxor	-72(%rsp,%rsi), %xmm7
	pxor	2008(%rsp,%rax), %xmm3
	palignr	$15, %xmm6, %xmm3
	pxor	1976(%rsp,%rax), %xmm7
	palignr	$15, %xmm7, %xmm6
	palignr	$15, %xmm2, %xmm7
	pslldq	$1, %xmm2
	pxor	-56(%rsp,%rcx), %xmm7
	pxor	%xmm2, %xmm5
	pxor	1976(%rsp,%rdx), %xmm5
	movdqa	%xmm5, -88(%rsp)
	movdqa	2008(%rsp,%r8), %xmm0
	pxor	1992(%rsp,%rdx), %xmm7
	pxor	-72(%rsp,%r10), %xmm7
	pxor	2008(%rsp,%rdx), %xmm6
	pxor	-56(%rsp,%r10), %xmm6
	pxor	1992(%rsp,%r8), %xmm6
	pxor	%xmm3, %xmm0
	movdqa	%xmm6, -104(%rsp)
	pxor	1976(%rsp,%r8), %xmm7
	movdqa	%xmm0, 4072(%rsp)
	movq	-104(%rsp), %r9
	movq	4080(%rsp), %rdx
	movdqa	%xmm7, -120(%rsp)
	movdqa	-120(%rsp), %xmm1
	movdqa	%xmm5, 4024(%rsp)
	movq	-120(%rsp), %rcx
	movdqa	%xmm1, 4040(%rsp)
	movdqa	-104(%rsp), %xmm4
	movq	%rdx, %r8
	movq	%rdx, %r11
	movq	%rdx, %rsi
	shrq	$52, %r11
	shrq	$59, %r8
	movq	%rdx, %rax
	xorq	%r11, %r8
	movq	%rdx, %r11
	movq	-88(%rsp), %r10
	movdqa	%xmm4, 4056(%rsp)
	xorq	%r9, %r8
	shrq	$55, %rsi
	xorq	%rsi, %r8
	shrq	$57, %rax
	movq	%rdx, %r9
	salq	$12, %r11
	xorq	%rax, %r8
	movq	%rdx, %rax
	salq	$5, %rax
	salq	$9, %r9
	xorq	%r11, %rax
	salq	$7, %rdx
	xorq	4048(%rsp), %rax
	xorq	%r9, %rax
	xorq	%rdx, %rax
	movq	4072(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rdx, %r11
	movq	%rdx, %r9
	shrq	$59, %rsi
	shrq	$52, %r11
	xorq	%rsi, %rax
	shrq	$55, %r9
	movq	%rdx, %rsi
	xorq	%r11, %rax
	shrq	$57, %rsi
	movq	%rdx, %r11
	xorq	%r9, %rax
	salq	$12, %r11
	movq	%rdx, %r9
	xorq	%rsi, %rax
	movq	%rdx, %rsi
	salq	$9, %r9
	salq	$5, %rsi
	salq	$7, %rdx
	xorq	%r11, %rsi
	xorq	%rcx, %rsi
	xorq	%r9, %rsi
	movq	4064(%rsp), %r9
	xorq	%rdx, %rsi
	movq	%r9, %r11
	movq	%r9, %rdx
	movq	%r9, %rcx
	shrq	$59, %r11
	shrq	$52, %rdx
	xorq	%r11, %rsi
	movq	%r9, %r11
	xorq	%rdx, %rsi
	shrq	$55, %rcx
	movq	%r9, %rdx
	salq	$12, %r11
	xorq	%rcx, %rsi
	movq	%r9, %rcx
	salq	$5, %rcx
	salq	$9, %rdx
	xorq	%r11, %rcx
	movq	%r9, %r11
	shrq	$57, %r9
	xorq	4032(%rsp), %rcx
	salq	$7, %r11
	xorq	%rdx, %rcx
	movq	%r8, %rdx
	xorq	%r11, %rcx
	shrq	$59, %rdx
	movq	%r8, %r11
	xorq	%rdx, %rcx
	shrq	$52, %r11
	movq	%r8, %rdx
	xorq	%r11, %rcx
	shrq	$55, %rdx
	movq	%r8, %r11
	xorq	%rdx, %rcx
	movq	%r8, %rdx
	salq	$12, %r11
	salq	$5, %rdx
	xorq	%r11, %rdx
	movq	%r8, %r11
	xorq	%r10, %rdx
	salq	$9, %r11
	movq	%r8, %r10
	xorq	%r11, %rdx
	salq	$7, %r10
	xorq	%r10, %rdx
	movq	%rax, %r10
	shrq	$59, %r10
	xorq	%r10, %rdx
	salq	$59, %r10
	movq	%r10, %r11
	xorq	%r10, %rax
	shrq	$52, %r11
	movq	%rax, 24(%rdi)
	xorq	%r11, %rdx
	movq	%r10, %r11
	shrq	$55, %r11
	xorq	%r11, %rdx
	xorq	%r9, %rsi
	shrq	$57, %r8
	shrq	$57, %r10
	xorq	%r8, %rcx
	movq	%rsi, 16(%rdi)
	xorq	%r10, %rdx
	movq	%rcx, 8(%rdi)
	movq	%rdx, (%rdi)
	addq	$4096, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE593:
	.size	fb_mulm_low, .-fb_mulm_low
	.ident	"GCC: (Gentoo 4.6.0 p1.2, pie-0.4.5) 4.6.0"
	.section	.note.GNU-stack,"",@progbits
