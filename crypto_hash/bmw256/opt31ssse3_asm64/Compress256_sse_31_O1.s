	.file	"Compress256_sse_31.c"
	.text
.globl Compress256
	.type	Compress256, @function
Compress256:
.LFB583:
	pushq	%r15
.LCFI0:
	pushq	%r14
.LCFI1:
	pushq	%r13
.LCFI2:
	pushq	%r12
.LCFI3:
	pushq	%rbp
.LCFI4:
	pushq	%rbx
.LCFI5:
	subq	$416, %rsp
.LCFI6:
	movq	%rdi, -56(%rsp)
	movq	%rsi, -64(%rsp)
	leaq	16(%rdx), %rax
	movq	%rax, -48(%rsp)
	movdqa	(%rax), %xmm0
	movdqa	%xmm0, 280(%rsp)
	leaq	32(%rdx), %rbx
	movq	%rbx, -40(%rsp)
	movdqa	(%rbx), %xmm0
	movdqa	%xmm0, 296(%rsp)
	leaq	48(%rdx), %rbp
	movq	%rbp, -32(%rsp)
	leaq	280(%rsp), %rax
	addq	$32, %rax
	movq	%rax, -24(%rsp)
	movdqa	(%rbp), %xmm0
	movdqa	%xmm0, (%rax)
	addq	$64, %rdx
	movq	%rdx, -16(%rsp)
	leaq	280(%rsp), %rdx
	addq	$48, %rdx
	movq	%rdx, -8(%rsp)
	movq	-16(%rsp), %rbx
	movdqa	(%rbx), %xmm0
	movdqa	%xmm0, (%rdx)
	leaq	280(%rsp), %rbp
	addq	$16, %rbp
	movq	%rbp, -72(%rsp)
	leaq	280(%rsp), %rax
	addq	$32, %rax
	movq	%rax, -80(%rsp)
	leaq	200(%rsp), %rdx
	addq	$48, %rdx
	movq	%rdx, -88(%rsp)
.L2:
	leaq	280(%rsp), %rbx
	movq	%rbx, (%rsp)
	movdqa	280(%rsp), %xmm4
	movq	-56(%rsp), %rbp
	pxor	(%rbp), %xmm4
	movq	-72(%rsp), %rax
	movq	%rax, 8(%rsp)
	movdqa	(%rax), %xmm0
	movdqa	%xmm0, -104(%rsp)
	movdqa	%xmm0, %xmm2
	pxor	16(%rbp), %xmm2
	movq	-80(%rsp), %rax
	movq	%rax, 16(%rsp)
	movdqa	(%rax), %xmm0
	movdqa	%xmm0, -120(%rsp)
	movdqa	%xmm0, %xmm1
	pxor	32(%rbp), %xmm1
	movq	%rbx, %rax
	addq	$48, %rax
	movq	%rax, 24(%rsp)
	movdqa	(%rax), %xmm15
	movdqa	%xmm15, %xmm0
	pxor	48(%rbp), %xmm0
	movdqa	%xmm2, %xmm10
	palignr	$4, %xmm4, %xmm10
	movdqa	%xmm1, %xmm9
	palignr	$4, %xmm2, %xmm9
	movdqa	%xmm0, %xmm11
	palignr	$4, %xmm1, %xmm11
	movdqa	%xmm4, %xmm8
	palignr	$4, %xmm0, %xmm8
	movl	(%rbp), %eax
	rorl	$31, %eax
	movl	%eax, 200(%rsp)
	movl	4(%rbp), %eax
	rorl	$30, %eax
	movl	%eax, 204(%rsp)
	movl	8(%rbp), %eax
	rorl	$29, %eax
	movl	%eax, 208(%rsp)
	movl	12(%rbp), %eax
	rorl	$28, %eax
	movl	%eax, 212(%rsp)
	movdqa	%xmm2, %xmm13
	palignr	$8, %xmm4, %xmm13
	movdqa	%xmm1, %xmm14
	palignr	$8, %xmm2, %xmm14
	movdqa	%xmm0, %xmm2
	palignr	$8, %xmm1, %xmm2
	palignr	$8, %xmm0, %xmm4
	movdqa	.LC16(%rip), %xmm3
	movl	16(%rbp), %eax
	rorl	$27, %eax
	movl	%eax, 216(%rsp)
	movl	20(%rbp), %eax
	rorl	$26, %eax
	movl	%eax, 220(%rsp)
	movl	24(%rbp), %eax
	rorl	$25, %eax
	movl	%eax, 224(%rsp)
	movl	28(%rbp), %eax
	rorl	$24, %eax
	movl	%eax, 228(%rsp)
	movdqa	%xmm9, %xmm6
	palignr	$8, %xmm10, %xmm6
	movdqa	%xmm11, %xmm0
	palignr	$8, %xmm9, %xmm0
	movdqa	%xmm8, %xmm7
	palignr	$8, %xmm11, %xmm7
	movdqa	%xmm10, %xmm1
	palignr	$8, %xmm8, %xmm1
	movdqa	.LC18(%rip), %xmm5
	movdqa	%xmm5, 40(%rsp)
	psignd	%xmm5, %xmm6
	psignd	%xmm3, %xmm0
	psignd	%xmm3, %xmm7
	psignd	.LC21(%rip), %xmm1
	psignd	%xmm3, %xmm2
	psubd	%xmm2, %xmm0
	psubd	%xmm2, %xmm6
	movl	32(%rbp), %eax
	rorl	$23, %eax
	movl	%eax, 232(%rsp)
	movl	36(%rbp), %eax
	rorl	$22, %eax
	movl	%eax, 236(%rsp)
	movl	40(%rbp), %eax
	rorl	$21, %eax
	movl	%eax, 240(%rsp)
	movl	44(%rbp), %eax
	rorl	$20, %eax
	movl	%eax, 244(%rsp)
	movdqa	%xmm9, %xmm5
	paddd	%xmm0, %xmm5
	paddd	%xmm8, %xmm5
	movdqa	.LC17(%rip), %xmm12
	psignd	%xmm12, %xmm4
	paddd	%xmm4, %xmm5
	movl	48(%rbp), %eax
	rorl	$19, %eax
	movl	%eax, 248(%rsp)
	movl	52(%rbp), %eax
	rorl	$18, %eax
	movl	%eax, 252(%rsp)
	movl	56(%rbp), %eax
	rorl	$17, %eax
	movl	%eax, 256(%rsp)
	movl	60(%rbp), %eax
	rorl	$16, %eax
	movl	%eax, 260(%rsp)
	movdqa	%xmm11, %xmm0
	psignd	40(%rsp), %xmm0
	paddd	%xmm0, %xmm7
	psubd	%xmm4, %xmm7
	movdqa	.LC19(%rip), %xmm3
	movdqa	%xmm10, %xmm0
	psignd	%xmm3, %xmm0
	paddd	%xmm0, %xmm7
	movdqa	.LC20(%rip), %xmm2
	movdqa	%xmm13, %xmm0
	psignd	%xmm2, %xmm0
	paddd	%xmm0, %xmm7
	psignd	%xmm2, %xmm8
	paddd	%xmm8, %xmm1
	psignd	%xmm3, %xmm13
	paddd	%xmm13, %xmm1
	psignd	%xmm12, %xmm9
	psubd	%xmm9, %xmm1
	movdqa	%xmm14, %xmm0
	psignd	40(%rsp), %xmm0
	psubd	%xmm0, %xmm1
	psignd	%xmm2, %xmm10
	paddd	%xmm10, %xmm6
	psignd	.LC22(%rip), %xmm14
	paddd	%xmm14, %xmm6
	psignd	%xmm12, %xmm11
	psubd	%xmm11, %xmm6
	movaps	%xmm5, %xmm3
	shufps	$206, %xmm7, %xmm3
	movaps	%xmm1, %xmm4
	shufps	$206, %xmm6, %xmm4
	movaps	%xmm5, %xmm2
	shufps	$148, %xmm7, %xmm2
	movaps	%xmm2, %xmm0
	shufps	$200, %xmm4, %xmm0
	shufps	$253, %xmm1, %xmm2
	shufps	$172, %xmm4, %xmm3
	shufps	$148, %xmm6, %xmm1
	shufps	$143, %xmm1, %xmm5
	shufps	$208, %xmm1, %xmm7
	movdqa	%xmm0, %xmm1
	pslld	$3, %xmm1
	psrld	$1, %xmm0
	movdqa	%xmm1, %xmm4
	pxor	%xmm0, %xmm4
	pslld	$1, %xmm1
	pxor	%xmm1, %xmm4
	psrld	$12, %xmm0
	pxor	%xmm0, %xmm4
	pslld	$15, %xmm1
	pxor	%xmm1, %xmm4
	psrld	$15, %xmm0
	pxor	%xmm0, %xmm4
	movdqa	%xmm2, %xmm0
	pslld	$2, %xmm0
	psrld	$1, %xmm2
	movdqa	%xmm0, %xmm6
	pxor	%xmm2, %xmm6
	pslld	$6, %xmm0
	pxor	%xmm0, %xmm6
	psrld	$8, %xmm2
	pxor	%xmm2, %xmm6
	pslld	$15, %xmm0
	pxor	%xmm0, %xmm6
	psrld	$15, %xmm2
	pxor	%xmm2, %xmm6
	movdqa	%xmm3, %xmm0
	pslld	$1, %xmm0
	psrld	$2, %xmm3
	movdqa	%xmm0, %xmm2
	pxor	%xmm3, %xmm2
	pslld	$11, %xmm0
	pxor	%xmm0, %xmm2
	psrld	$5, %xmm3
	pxor	%xmm3, %xmm2
	pslld	$13, %xmm0
	pxor	%xmm0, %xmm2
	psrld	$13, %xmm3
	pxor	%xmm3, %xmm2
	movdqa	%xmm5, %xmm0
	pslld	$2, %xmm0
	psrld	$2, %xmm5
	movdqa	%xmm0, %xmm1
	pxor	%xmm5, %xmm1
	pslld	$13, %xmm0
	pxor	%xmm0, %xmm1
	psrld	$1, %xmm5
	pxor	%xmm5, %xmm1
	pslld	$14, %xmm0
	pxor	%xmm0, %xmm1
	psrld	$14, %xmm5
	pxor	%xmm5, %xmm1
	movdqa	%xmm7, %xmm0
	psrld	$1, %xmm0
	pxor	%xmm7, %xmm0
	movaps	%xmm6, %xmm7
	shufps	$239, %xmm4, %xmm7
	movaps	%xmm2, %xmm3
	shufps	$197, %xmm0, %xmm3
	movaps	%xmm1, %xmm5
	shufps	$238, %xmm0, %xmm5
	shufps	$255, %xmm4, %xmm0
	movlhps	%xmm6, %xmm4
	shufps	$204, %xmm1, %xmm2
	movaps	%xmm4, %xmm1
	shufps	$136, %xmm2, %xmm1
	shufps	$40, %xmm7, %xmm5
	shufps	$141, %xmm0, %xmm2
	shufps	$210, %xmm4, %xmm3
	shufps	$120, %xmm3, %xmm3
	movdqa	280(%rsp), %xmm7
	palignr	$4, %xmm15, %xmm7
	movdqa	%xmm15, %xmm6
	palignr	$4, -120(%rsp), %xmm6
	movdqa	-120(%rsp), %xmm4
	palignr	$4, -104(%rsp), %xmm4
	movdqa	-104(%rsp), %xmm0
	palignr	$4, 280(%rsp), %xmm0
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm14
	paddd	%xmm4, %xmm3
	movdqa	%xmm3, %xmm13
	paddd	%xmm6, %xmm5
	movdqa	%xmm5, %xmm11
	paddd	%xmm7, %xmm2
	movdqa	%xmm2, %xmm12
	movdqa	%xmm1, 72(%rsp)
	movdqa	%xmm3, 88(%rsp)
	movdqa	%xmm5, 104(%rsp)
	movdqa	%xmm2, 120(%rsp)
	pxor	%xmm5, %xmm5
	movdqa	%xmm5, %xmm0
	punpckhqdq	%xmm1, %xmm0
	paddd	%xmm3, %xmm0
	paddd	%xmm11, %xmm0
	paddd	%xmm2, %xmm0
	pshufd	$120, %xmm0, %xmm0
	phaddd	%xmm0, %xmm0
	movq	%xmm0, 392(%rsp)
	movdqa	%xmm1, %xmm0
	punpcklqdq	%xmm3, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$2, %xmm1
	psrld	$1, %xmm0
	movdqa	%xmm1, %xmm4
	pxor	%xmm0, %xmm4
	pslld	$6, %xmm1
	pxor	%xmm1, %xmm4
	psrld	$8, %xmm0
	pxor	%xmm0, %xmm4
	pslld	$15, %xmm1
	pxor	%xmm1, %xmm4
	psrld	$15, %xmm0
	pxor	%xmm0, %xmm4
	movdqa	%xmm14, %xmm0
	punpckhqdq	%xmm3, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$2, %xmm1
	psrld	$2, %xmm0
	movdqa	%xmm1, %xmm2
	pxor	%xmm0, %xmm2
	pslld	$13, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$1, %xmm0
	pxor	%xmm0, %xmm2
	pslld	$14, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$14, %xmm0
	pxor	%xmm0, %xmm2
	paddd	%xmm2, %xmm4
	movdqa	%xmm11, %xmm0
	punpcklqdq	%xmm12, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$2, %xmm1
	psrld	$1, %xmm0
	movdqa	%xmm1, %xmm2
	pxor	%xmm0, %xmm2
	pslld	$6, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$8, %xmm0
	pxor	%xmm0, %xmm2
	pslld	$15, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$15, %xmm0
	pxor	%xmm0, %xmm2
	paddd	%xmm2, %xmm4
	movdqa	%xmm11, %xmm0
	punpckhqdq	%xmm12, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$2, %xmm1
	psrld	$2, %xmm0
	movdqa	%xmm1, %xmm2
	pxor	%xmm0, %xmm2
	pslld	$13, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$1, %xmm0
	pxor	%xmm0, %xmm2
	pslld	$14, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$14, %xmm0
	pxor	%xmm0, %xmm2
	paddd	%xmm2, %xmm4
	palignr	$4, %xmm14, %xmm3
	movdqa	%xmm11, %xmm10
	palignr	$4, %xmm13, %xmm10
	movdqa	%xmm3, %xmm0
	punpcklqdq	%xmm10, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$1, %xmm1
	psrld	$2, %xmm0
	movdqa	%xmm1, %xmm2
	pxor	%xmm0, %xmm2
	pslld	$11, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$5, %xmm0
	pxor	%xmm0, %xmm2
	pslld	$13, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$13, %xmm0
	pxor	%xmm0, %xmm2
	paddd	%xmm2, %xmm4
	punpckhqdq	%xmm10, %xmm3
	movdqa	%xmm3, %xmm0
	pslld	$3, %xmm0
	psrld	$1, %xmm3
	movdqa	%xmm0, %xmm1
	pxor	%xmm3, %xmm1
	pslld	$1, %xmm0
	pxor	%xmm0, %xmm1
	psrld	$12, %xmm3
	pxor	%xmm3, %xmm1
	pslld	$15, %xmm0
	pxor	%xmm0, %xmm1
	psrld	$15, %xmm3
	pxor	%xmm3, %xmm1
	paddd	%xmm1, %xmm4
	movdqa	%xmm12, %xmm7
	palignr	$4, %xmm11, %xmm7
	palignr	$4, %xmm12, %xmm5
	movdqa	%xmm7, %xmm0
	punpcklqdq	%xmm5, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$1, %xmm1
	psrld	$2, %xmm0
	movdqa	%xmm1, %xmm2
	pxor	%xmm0, %xmm2
	pslld	$11, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$5, %xmm0
	pxor	%xmm0, %xmm2
	pslld	$13, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$13, %xmm0
	pxor	%xmm0, %xmm2
	paddd	%xmm2, %xmm4
	movdqa	%xmm7, %xmm0
	punpckhqdq	%xmm5, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$3, %xmm1
	psrld	$1, %xmm0
	movdqa	%xmm1, %xmm2
	pxor	%xmm0, %xmm2
	pslld	$1, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$12, %xmm0
	pxor	%xmm0, %xmm2
	pslld	$15, %xmm1
	pxor	%xmm1, %xmm2
	psrld	$15, %xmm0
	pxor	%xmm0, %xmm2
	paddd	%xmm2, %xmm4
	pshufd	$120, %xmm4, %xmm4
	pxor	%xmm0, %xmm0
	phaddd	%xmm0, %xmm4
	movdqa	200(%rsp), %xmm8
	movdqa	216(%rsp), %xmm9
	movdqa	232(%rsp), %xmm3
	movq	-88(%rsp), %rax
	movdqa	(%rax), %xmm2
	movdqa	%xmm8, %xmm1
	palignr	$12, %xmm2, %xmm1
	movdqa	%xmm9, %xmm5
	palignr	$12, %xmm8, %xmm5
	movdqa	%xmm3, %xmm6
	palignr	$12, %xmm9, %xmm6
	movdqa	%xmm3, %xmm0
	palignr	$8, %xmm9, %xmm0
	paddd	%xmm2, %xmm1
	paddd	.LC15(%rip), %xmm1
	psubd	%xmm0, %xmm1
	movdqa	-104(%rsp), %xmm0
	palignr	$12, 280(%rsp), %xmm0
	pxor	%xmm1, %xmm0
	movdqa	%xmm0, 184(%rsp)
	palignr	$12, %xmm3, %xmm2
	movdqa	%xmm9, %xmm0
	palignr	$8, %xmm8, %xmm0
	paddd	%xmm3, %xmm2
	paddd	.LC14(%rip), %xmm2
	psubd	%xmm0, %xmm2
	movdqa	280(%rsp), %xmm0
	palignr	$12, %xmm15, %xmm0
	pxor	%xmm0, %xmm2
	movdqa	%xmm7, %xmm0
	psrld	$29, %xmm0
	movdqa	%xmm7, %xmm1
	pslld	$3, %xmm1
	por	%xmm1, %xmm0
	movdqa	%xmm2, %xmm3
	paddd	%xmm0, %xmm3
	movdqa	%xmm12, %xmm2
	palignr	$12, %xmm11, %xmm2
	movdqa	%xmm2, %xmm0
	movdqa	%xmm2, %xmm1
	psrld	$25, %xmm1
	pslld	$7, %xmm0
	por	%xmm0, %xmm1
	movdqa	%xmm3, %xmm0
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, 168(%rsp)
	paddd	%xmm8, %xmm5
	paddd	.LC12(%rip), %xmm5
	movq	240(%rsp), %xmm0
	movq	(%rax), %xmm1
	punpcklqdq	%xmm1, %xmm0
	psubd	%xmm0, %xmm5
	movdqa	-120(%rsp), %xmm0
	palignr	$12, -104(%rsp), %xmm0
	pxor	%xmm5, %xmm0
	paddd	%xmm0, %xmm4
	movdqa	%xmm4, 136(%rsp)
	paddd	%xmm9, %xmm6
	paddd	.LC13(%rip), %xmm6
	movq	256(%rsp), %xmm0
	movq	200(%rsp), %xmm1
	punpcklqdq	%xmm1, %xmm0
	psubd	%xmm0, %xmm6
	palignr	$12, -120(%rsp), %xmm15
	pxor	%xmm6, %xmm15
	movdqa	%xmm10, %xmm0
	psrld	$29, %xmm0
	pslld	$3, %xmm10
	por	%xmm10, %xmm0
	paddd	%xmm0, %xmm15
	movdqa	%xmm11, %xmm0
	palignr	$12, %xmm13, %xmm0
	movdqa	%xmm0, %xmm1
	psrld	$25, %xmm1
	pslld	$7, %xmm0
	por	%xmm0, %xmm1
	paddd	%xmm1, %xmm15
	movdqa	%xmm7, %xmm0
	psrld	$19, %xmm0
	pslld	$13, %xmm7
	por	%xmm7, %xmm0
	paddd	%xmm0, %xmm15
	pshufb	.LC23(%rip), %xmm2
	paddd	%xmm2, %xmm15
	movdqa	%xmm15, 152(%rsp)
	movl	120(%rsp), %r11d
	rorl	$13, %r11d
	movl	128(%rsp), %edi
	movl	%edi, %r15d
	rorl	$13, %r15d
	movl	%edi, %edx
	rorl	$19, %edx
	movl	%edx, 36(%rsp)
	movl	124(%rsp), %r13d
	movl	%r13d, %r8d
	rorl	$19, %r8d
	movl	132(%rsp), %ebp
	rorl	$16, %ebp
	movl	%ebp, %ebx
	rorl	$25, %ebx
	movl	%ebx, 60(%rsp)
	movl	%r13d, %r9d
	rorl	$9, %r9d
	movl	116(%rsp), %edx
	rorl	$13, %edx
	movl	132(%rsp), %r14d
	rorl	$13, %r14d
	rorl	$29, %r13d
	movl	136(%rsp), %eax
	sall	$3, %eax
	movl	136(%rsp), %r12d
	rorl	$13, %r12d
	movl	136(%rsp), %esi
	shrl	%esi
	xorl	%r12d, %eax
	movl	%eax, %ecx
	xorl	%esi, %ecx
	movl	%r12d, %eax
	rorl	$15, %eax
	xorl	%ecx, %eax
	addl	140(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	%eax, 140(%rsp)
	movl	392(%rsp), %ecx
	movl	%ecx, %r10d
	addl	144(%rsp), %r10d
	addl	%r9d, %r10d
	movl	132(%rsp), %eax
	rorl	$5, %eax
	addl	%eax, %r10d
	addl	%edx, %r10d
	movl	84(%rsp), %eax
	rorl	$29, %eax
	addl	%eax, %r10d
	movl	92(%rsp), %eax
	rorl	$25, %eax
	addl	%eax, %r10d
	movl	100(%rsp), %eax
	rorl	$19, %eax
	addl	%eax, %r10d
	movl	108(%rsp), %eax
	rorl	$16, %eax
	addl	%eax, %r10d
	xorl	136(%rsp), %esi
	addl	%esi, %r10d
	movl	32(%rsp), %eax
	shrl	$2, %eax
	xorl	32(%rsp), %eax
	addl	%eax, %r10d
	movl	%r10d, 144(%rsp)
	movl	396(%rsp), %edx
	movl	%edx, %r9d
	addl	148(%rsp), %r9d
	addl	%r11d, %r9d
	rorl	$9, %edi
	addl	%edi, %r9d
	movl	88(%rsp), %eax
	rorl	$29, %eax
	addl	%eax, %r9d
	movl	96(%rsp), %eax
	rorl	$25, %eax
	addl	%eax, %r9d
	movl	104(%rsp), %eax
	rorl	$19, %eax
	addl	%eax, %r9d
	movl	112(%rsp), %eax
	rorl	$16, %eax
	addl	%eax, %r9d
	movl	136(%rsp), %eax
	rorl	$5, %eax
	addl	%eax, %r9d
	movl	32(%rsp), %eax
	shrl	%eax
	xorl	32(%rsp), %eax
	addl	%eax, %r9d
	movl	%r10d, %eax
	shrl	$2, %eax
	xorl	%r10d, %eax
	addl	%eax, %r9d
	movl	%r9d, 148(%rsp)
	addl	136(%rsp), %ecx
	subl	80(%rsp), %ecx
	movl	%r8d, %r11d
	rorl	$26, %r11d
	addl	%ebx, %r11d
	addl	152(%rsp), %r11d
	addl	%ecx, %r11d
	movl	32(%rsp), %eax
	rorl	$5, %eax
	addl	%eax, %r11d
	movl	%r10d, %eax
	shrl	%eax
	xorl	%r10d, %eax
	addl	%eax, %r11d
	movl	%r9d, %eax
	shrl	$2, %eax
	xorl	%r9d, %eax
	addl	%eax, %r11d
	movl	%r11d, 152(%rsp)
	movl	%edx, %eax
	subl	84(%rsp), %eax
	movl	32(%rsp), %ebx
	leal	(%rax,%rbx), %edx
	movl	136(%rsp), %eax
	rorl	$9, %eax
	addl	%eax, %r15d
	addl	156(%rsp), %r15d
	addl	%edx, %r15d
	movl	%r10d, %eax
	rorl	$5, %eax
	addl	%eax, %r15d
	movl	%r9d, %eax
	shrl	%eax
	xorl	%r9d, %eax
	addl	%eax, %r15d
	movl	%r11d, %eax
	shrl	$2, %eax
	xorl	%r11d, %eax
	addl	%eax, %r15d
	movl	%r15d, 156(%rsp)
	subl	88(%rsp), %ecx
	addl	%r10d, %ecx
	addl	160(%rsp), %r14d
	movl	%ebx, %eax
	rorl	$9, %eax
	addl	%eax, %r14d
	addl	%ecx, %r14d
	movl	%r9d, %eax
	rorl	$5, %eax
	addl	%eax, %r14d
	movl	%r11d, %eax
	shrl	%eax
	xorl	%r11d, %eax
	addl	%eax, %r14d
	movl	%r15d, %eax
	shrl	$2, %eax
	xorl	%r15d, %eax
	addl	%eax, %r14d
	movl	%r14d, 160(%rsp)
	movl	%edx, %eax
	subl	92(%rsp), %eax
	leal	(%rax,%r9), %edx
	addl	164(%rsp), %r12d
	movl	%r10d, %eax
	rorl	$9, %eax
	addl	%eax, %r12d
	addl	%edx, %r12d
	movl	%r11d, %eax
	rorl	$5, %eax
	addl	%eax, %r12d
	movl	%r15d, %eax
	shrl	%eax
	xorl	%r15d, %eax
	addl	%eax, %r12d
	movl	%r14d, %eax
	shrl	$2, %eax
	xorl	%r14d, %eax
	addl	%eax, %r12d
	xorl	136(%rsp), %ebx
	xorl	%r10d, %ebx
	xorl	%r9d, %ebx
	xorl	%r11d, %ebx
	xorl	%r15d, %ebx
	xorl	%r14d, %ebx
	xorl	%r12d, %ebx
	movl	%r12d, 164(%rsp)
	subl	96(%rsp), %ecx
	addl	%r11d, %ecx
	mov	%ebx, %eax
	movq	%rax, 376(%rsp)
	movq	376(%rsp), %xmm0
	pshufd	$0, %xmm0, %xmm0
	movl	%ebx, %eax
	sall	$4, %eax
	movl	%eax, 356(%rsp)
	movl	%ebx, %eax
	sall	$6, %eax
	movl	%eax, 352(%rsp)
	movl	%ebx, %eax
	sall	$8, %eax
	movl	%eax, 344(%rsp)
	movl	%ebx, %eax
	shrl	$2, %eax
	movl	%eax, 372(%rsp)
	movl	%ebx, %eax
	shrl	$3, %eax
	movl	%eax, 360(%rsp)
	movl	%ebx, %eax
	shrl	$4, %eax
	movl	%eax, 364(%rsp)
	movl	%ebx, %eax
	shrl	$6, %eax
	movl	%eax, 348(%rsp)
	movl	%ebx, %eax
	shrl	$7, %eax
	movl	%eax, 368(%rsp)
	addl	%ebp, %r8d
	addl	168(%rsp), %r8d
	movl	32(%rsp), %eax
	rorl	$13, %eax
	addl	%eax, %r8d
	movl	%r9d, %eax
	rorl	$9, %eax
	addl	%eax, %r8d
	addl	%ecx, %r8d
	movl	%r15d, %eax
	rorl	$5, %eax
	addl	%eax, %r8d
	movl	%r14d, %eax
	shrl	%eax
	xorl	%r14d, %eax
	addl	%eax, %r8d
	movl	%r12d, %eax
	shrl	$2, %eax
	xorl	%r12d, %eax
	addl	%eax, %r8d
	movl	%r8d, 168(%rsp)
	movl	%edx, %eax
	subl	100(%rsp), %eax
	leal	(%rax,%r15), %esi
	movl	136(%rsp), %eax
	rorl	$16, %eax
	addl	36(%rsp), %eax
	movl	%eax, %edx
	addl	172(%rsp), %edx
	movl	%r10d, %eax
	rorl	$13, %eax
	addl	%eax, %edx
	movl	%r11d, %eax
	rorl	$9, %eax
	leal	(%rdx,%rax), %eax
	leal	(%rax,%rsi), %edx
	movl	%r14d, %eax
	rorl	$5, %eax
	addl	%eax, %edx
	movl	%r12d, %eax
	shrl	%eax
	xorl	%r12d, %eax
	addl	%eax, %edx
	movl	%r8d, %eax
	shrl	$2, %eax
	xorl	%r8d, %eax
	leal	(%rdx,%rax), %eax
	movl	%eax, 64(%rsp)
	movl	%eax, 172(%rsp)
	subl	104(%rsp), %ecx
	addl	%r14d, %ecx
	movl	60(%rsp), %eax
	rorl	$10, %eax
	movl	%eax, %edx
	addl	176(%rsp), %edx
	movl	32(%rsp), %eax
	rorl	$16, %eax
	addl	%eax, %edx
	movl	%r9d, %eax
	rorl	$13, %eax
	addl	%eax, %edx
	movl	%r15d, %eax
	rorl	$9, %eax
	leal	(%rdx,%rax), %eax
	leal	(%rax,%rcx), %edx
	movl	%r12d, %eax
	rorl	$5, %eax
	addl	%eax, %edx
	movl	%r8d, %eax
	shrl	%eax
	xorl	%r8d, %eax
	addl	%eax, %edx
	movl	64(%rsp), %eax
	shrl	$2, %eax
	xorl	64(%rsp), %eax
	leal	(%rdx,%rax), %ebp
	movl	%ebp, 176(%rsp)
	movl	%esi, %eax
	subl	108(%rsp), %eax
	leal	(%rax,%r12), %edx
	movl	136(%rsp), %edi
	rorl	$19, %edi
	addl	180(%rsp), %edi
	movl	%r10d, %eax
	rorl	$16, %eax
	addl	%eax, %edi
	movl	%r11d, %eax
	rorl	$13, %eax
	addl	%eax, %edi
	movl	%r14d, %eax
	rorl	$9, %eax
	addl	%eax, %edi
	addl	%edx, %edi
	movl	%r8d, %eax
	rorl	$5, %eax
	addl	%eax, %edi
	movl	64(%rsp), %eax
	shrl	%eax
	xorl	64(%rsp), %eax
	addl	%eax, %edi
	movl	%ebp, %eax
	shrl	$2, %eax
	xorl	%ebp, %eax
	addl	%eax, %edi
	movl	%edi, 180(%rsp)
	subl	112(%rsp), %ecx
	addl	%r8d, %ecx
	movl	132(%rsp), %eax
	rorl	$25, %eax
	addl	%eax, %r13d
	addl	184(%rsp), %r13d
	movl	32(%rsp), %eax
	rorl	$19, %eax
	addl	%eax, %r13d
	movl	%r9d, %eax
	rorl	$16, %eax
	addl	%eax, %r13d
	movl	%r15d, %eax
	rorl	$13, %eax
	addl	%eax, %r13d
	movl	%r12d, %eax
	rorl	$9, %eax
	addl	%eax, %r13d
	addl	%ecx, %r13d
	movl	64(%rsp), %eax
	rorl	$5, %eax
	addl	%eax, %r13d
	movl	%ebp, %eax
	shrl	%eax
	xorl	%ebp, %eax
	addl	%eax, %r13d
	movl	%edi, %eax
	shrl	$2, %eax
	xorl	%edi, %eax
	addl	%eax, %r13d
	movl	%r13d, 184(%rsp)
	movl	%edx, %eax
	subl	116(%rsp), %eax
	addl	64(%rsp), %eax
	movl	%eax, 68(%rsp)
	movl	128(%rsp), %esi
	rorl	$29, %esi
	movl	136(%rsp), %eax
	rorl	$25, %eax
	addl	%eax, %esi
	addl	188(%rsp), %esi
	movl	%r10d, %eax
	rorl	$19, %eax
	addl	%eax, %esi
	movl	%r11d, %eax
	rorl	$16, %eax
	addl	%eax, %esi
	movl	%r14d, %eax
	rorl	$13, %eax
	addl	%eax, %esi
	movl	%r8d, %eax
	rorl	$9, %eax
	addl	%eax, %esi
	addl	68(%rsp), %esi
	movl	%ebp, %eax
	rorl	$5, %eax
	addl	%eax, %esi
	movl	%edi, %eax
	shrl	%eax
	xorl	%edi, %eax
	addl	%eax, %esi
	movl	%r13d, %eax
	shrl	$2, %eax
	xorl	%r13d, %eax
	addl	%eax, %esi
	movl	%esi, 188(%rsp)
	movl	132(%rsp), %edx
	rorl	$29, %edx
	subl	120(%rsp), %edx
	addl	192(%rsp), %edx
	movl	32(%rsp), %eax
	rorl	$25, %eax
	addl	%eax, %edx
	movl	%r9d, %eax
	rorl	$19, %eax
	addl	%eax, %edx
	movl	%r15d, %eax
	rorl	$16, %eax
	addl	%eax, %edx
	movl	%r12d, %eax
	rorl	$13, %eax
	addl	%eax, %edx
	addl	%ecx, %edx
	movl	64(%rsp), %eax
	rorl	$9, %eax
	addl	%eax, %edx
	addl	%ebp, %edx
	movl	%edi, %eax
	rorl	$5, %eax
	addl	%eax, %edx
	movl	%r13d, %eax
	shrl	%eax
	xorl	%r13d, %eax
	addl	%eax, %edx
	movl	%esi, %eax
	shrl	$2, %eax
	xorl	%esi, %eax
	addl	%eax, %edx
	movl	%edx, 192(%rsp)
	movl	136(%rsp), %ecx
	rorl	$29, %ecx
	subl	124(%rsp), %ecx
	addl	196(%rsp), %ecx
	movl	%r10d, %eax
	rorl	$25, %eax
	addl	%eax, %ecx
	movl	%r11d, %eax
	rorl	$19, %eax
	addl	%eax, %ecx
	movl	%r14d, %eax
	rorl	$16, %eax
	addl	%eax, %ecx
	movl	%r8d, %eax
	rorl	$13, %eax
	addl	%eax, %ecx
	addl	68(%rsp), %ecx
	movl	%ebp, %eax
	rorl	$9, %eax
	addl	%eax, %ecx
	addl	%edi, %ecx
	movl	%r13d, %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	%esi, %eax
	shrl	%eax
	xorl	%esi, %eax
	addl	%eax, %ecx
	movl	%edx, %eax
	shrl	$2, %eax
	xorl	%edx, %eax
	addl	%eax, %ecx
	xorl	%ebx, %r8d
	xorl	64(%rsp), %r8d
	xorl	%ebp, %r8d
	xorl	%edi, %r8d
	xorl	%r13d, %r8d
	xorl	%esi, %r8d
	xorl	%edx, %r8d
	xorl	%ecx, %r8d
	movl	%ecx, 196(%rsp)
	mov	%r8d, %ebp
	movq	%rbp, 376(%rsp)
	movq	376(%rsp), %xmm4
	pshufd	$0, %xmm4, %xmm4
	pxor	%xmm0, %xmm14
	movdqa	168(%rsp), %xmm3
	movdqa	184(%rsp), %xmm5
	pxor	%xmm3, %xmm14
	movdqa	%xmm14, 280(%rsp)
	movl	136(%rsp), %eax
	shrl	$5, %eax
	movl	%eax, %edi
	movq	-56(%rsp), %rbp
	xorl	(%rbp), %edi
	movl	%r8d, %eax
	sall	$5, %eax
	xorl	%edi, %eax
	addl	%eax, 280(%rsp)
	movl	32(%rsp), %eax
	sall	$8, %eax
	movl	%eax, %edi
	xorl	4(%rbp), %edi
	movl	%r8d, %eax
	shrl	$7, %eax
	xorl	%edi, %eax
	addl	%eax, 284(%rsp)
	sall	$5, %r10d
	xorl	8(%rbp), %r10d
	movl	%r8d, %eax
	shrl	$5, %eax
	xorl	%eax, %r10d
	addl	%r10d, 288(%rsp)
	sall	$5, %r9d
	xorl	12(%rbp), %r9d
	movl	%r8d, %eax
	shrl	%eax
	xorl	%eax, %r9d
	addl	%r9d, 292(%rsp)
	xorl	16(%rbp), %r11d
	movl	%r8d, %eax
	shrl	$3, %eax
	xorl	%eax, %r11d
	movl	%ebx, %eax
	xorl	88(%rsp), %eax
	xorl	%r13d, %eax
	addl	%eax, %r11d
	movl	%r11d, 296(%rsp)
	shrl	$6, %r15d
	xorl	20(%rbp), %r15d
	movl	%r8d, %eax
	sall	$6, %eax
	xorl	%eax, %r15d
	movl	%ebx, %eax
	xorl	92(%rsp), %eax
	xorl	%esi, %eax
	addl	%eax, %r15d
	movl	%r15d, 300(%rsp)
	sall	$6, %r14d
	xorl	24(%rbp), %r14d
	movl	%r8d, %eax
	shrl	$4, %eax
	xorl	%eax, %r14d
	movl	%ebx, %eax
	xorl	96(%rsp), %eax
	xorl	%edx, %eax
	addl	%eax, %r14d
	movl	%r14d, 304(%rsp)
	sall	$2, %r12d
	xorl	28(%rbp), %r12d
	shrl	$11, %r8d
	xorl	%r8d, %r12d
	xorl	100(%rsp), %ebx
	xorl	%ecx, %ebx
	addl	%ebx, %r12d
	movl	%r12d, 308(%rsp)
	movdqa	136(%rsp), %xmm1
	movdqa	152(%rsp), %xmm0
	movdqa	%xmm1, %xmm2
	palignr	$12, %xmm0, %xmm2
	palignr	$12, %xmm1, %xmm0
	pxor	%xmm2, %xmm11
	pxor	344(%rsp), %xmm11
	pxor	%xmm0, %xmm12
	pxor	360(%rsp), %xmm12
	pxor	32(%rbp), %xmm3
	pxor	%xmm4, %xmm3
	paddd	%xmm3, %xmm11
	pxor	48(%rbp), %xmm5
	pxor	%xmm4, %xmm5
	paddd	%xmm5, %xmm12
	movq	-8(%rsp), %rax
	movdqa	%xmm12, (%rax)
	movq	-24(%rsp), %rdx
	movdqa	%xmm11, (%rdx)
	rorl	$23, %r11d
	addl	%r11d, 312(%rsp)
	rorl	$22, %r15d
	addl	%r15d, 316(%rsp)
	rorl	$21, %r14d
	addl	%r14d, 320(%rsp)
	rorl	$20, %r12d
	addl	%r12d, 324(%rsp)
	movl	280(%rsp), %eax
	rorl	$19, %eax
	addl	%eax, 328(%rsp)
	movl	284(%rsp), %eax
	rorl	$18, %eax
	addl	%eax, 332(%rsp)
	movl	288(%rsp), %eax
	rorl	$17, %eax
	addl	%eax, 336(%rsp)
	movl	292(%rsp), %eax
	rorl	$16, %eax
	addl	%eax, 340(%rsp)
	addq	$64, %rbp
	movq	%rbp, -56(%rsp)
	movq	-64(%rsp), %rbx
	cmpq	%rbx, %rbp
	jb	.L2
	movq	(%rsp), %rbp
	movdqa	(%rbp), %xmm0
	movq	-48(%rsp), %rax
	movdqa	%xmm0, (%rax)
	movq	8(%rsp), %rdx
	movdqa	(%rdx), %xmm0
	movq	-40(%rsp), %rbx
	movdqa	%xmm0, (%rbx)
	movq	16(%rsp), %rbp
	movdqa	(%rbp), %xmm0
	movq	-32(%rsp), %rax
	movdqa	%xmm0, (%rax)
	movq	24(%rsp), %rdx
	movdqa	(%rdx), %xmm0
	movq	-16(%rsp), %rbx
	movdqa	%xmm0, (%rbx)
	addq	$416, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LFE583:
	.size	Compress256, .-Compress256
.globl consts256
	.section	.rodata
	.align 128
	.type	consts256, @object
	.size	consts256, 64
consts256:
	.long	1431655760
	.long	1521134245
	.long	1610612730
	.long	1700091215
	.long	1789569700
	.long	1879048185
	.long	1968526670
	.long	2058005155
	.long	2147483640
	.long	-2058005171
	.long	-1968526686
	.long	-1879048201
	.long	-1789569716
	.long	-1700091231
	.long	-1610612746
	.long	-1521134261
.globl negate256
	.align 128
	.type	negate256, @object
	.size	negate256, 112
negate256:
	.long	-1
	.long	-1
	.long	1
	.long	-1
	.long	1
	.long	-1
	.long	1
	.long	-1
	.long	1
	.long	1
	.long	-1
	.long	-1
	.long	1
	.long	-1
	.long	-1
	.long	-1
	.long	1
	.long	1
	.long	1
	.long	-1
	.long	-1
	.long	1
	.long	-1
	.long	-1
	.long	-1
	.long	1
	.long	1
	.long	-1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.quad	6533221836532307280
	.quad	7301836170252517370
	.align 16
.LC13:
	.quad	8070450503972727460
	.quad	8839064837692937550
	.align 16
.LC14:
	.quad	-8839064902296403976
	.quad	-8070450568576193886
	.align 16
.LC15:
	.quad	-7301836234855983796
	.quad	-6533221901135773706
	.align 16
.LC16:
	.quad	-1
	.quad	-4294967295
	.align 16
.LC17:
	.quad	-4294967295
	.quad	-4294967295
	.align 16
.LC18:
	.quad	4294967297
	.quad	-1
	.align 16
.LC19:
	.quad	-4294967295
	.quad	-1
	.align 16
.LC20:
	.quad	4294967297
	.quad	-4294967295
	.align 16
.LC21:
	.quad	8589934591
	.quad	-1
	.align 16
.LC22:
	.quad	8589934591
	.quad	-4294967295
	.align 16
.LC23:
	.quad	361421592464458498
	.quad	940142975169071882
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	"zR"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.uleb128 0x1
	.byte	0x3
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB583
	.long	.LFE583-.LFB583
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI0-.LFB583
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x1d8
	.byte	0x83
	.uleb128 0x7
	.byte	0x86
	.uleb128 0x6
	.byte	0x8c
	.uleb128 0x5
	.byte	0x8d
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x8f
	.uleb128 0x2
	.align 8
.LEFDE1:
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",@progbits
