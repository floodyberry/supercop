	.file	"Compress256_sse_31.c"
	.text
.globl Compress256
	.type	Compress256, @function
Compress256:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$780, %esp
	movl	808(%esp), %eax
	leal	16(%eax), %edx
	movl	%edx, 144(%esp)
	movdqa	(%edx), %xmm0
	movdqa	%xmm0, 640(%esp)
	leal	32(%eax), %ecx
	movl	%ecx, 148(%esp)
	movdqa	(%ecx), %xmm0
	movdqa	%xmm0, 656(%esp)
	leal	48(%eax), %ebx
	movl	%ebx, 152(%esp)
	movdqa	(%ebx), %xmm0
	movdqa	%xmm0, 672(%esp)
	addl	$64, %eax
	movl	%eax, 156(%esp)
	movdqa	(%eax), %xmm0
	movdqa	%xmm0, 688(%esp)
.L2:
	leal	640(%esp), %eax
	movl	%eax, 160(%esp)
	movdqa	640(%esp), %xmm4
	movl	800(%esp), %edx
	pxor	(%edx), %xmm4
	movdqa	656(%esp), %xmm2
	pxor	16(%edx), %xmm2
	movdqa	672(%esp), %xmm1
	pxor	32(%edx), %xmm1
	movdqa	688(%esp), %xmm0
	pxor	48(%edx), %xmm0
	movdqa	%xmm2, %xmm3
	palignr	$4, %xmm4, %xmm3
	movdqa	%xmm3, 128(%esp)
	movdqa	%xmm1, %xmm5
	palignr	$4, %xmm2, %xmm5
	movdqa	%xmm0, %xmm3
	palignr	$4, %xmm1, %xmm3
	movdqa	%xmm3, 112(%esp)
	movdqa	%xmm4, %xmm3
	palignr	$4, %xmm0, %xmm3
	movdqa	%xmm3, 96(%esp)
	movl	(%edx), %eax
	rorl	$31, %eax
	movl	%eax, 560(%esp)
	movl	4(%edx), %eax
	rorl	$30, %eax
	movl	%eax, 564(%esp)
	movl	8(%edx), %eax
	rorl	$29, %eax
	movl	%eax, 568(%esp)
	movl	12(%edx), %eax
	rorl	$28, %eax
	movl	%eax, 572(%esp)
	movdqa	%xmm2, %xmm3
	palignr	$8, %xmm4, %xmm3
	movdqa	%xmm3, 80(%esp)
	movdqa	%xmm1, %xmm3
	palignr	$8, %xmm2, %xmm3
	movdqa	%xmm3, 64(%esp)
	movdqa	%xmm0, %xmm2
	palignr	$8, %xmm1, %xmm2
	palignr	$8, %xmm0, %xmm4
	movdqa	.LC16, %xmm3
	movl	16(%edx), %eax
	rorl	$27, %eax
	movl	%eax, 576(%esp)
	movl	20(%edx), %eax
	rorl	$26, %eax
	movl	%eax, 580(%esp)
	movl	24(%edx), %eax
	rorl	$25, %eax
	movl	%eax, 584(%esp)
	movl	28(%edx), %eax
	rorl	$24, %eax
	movl	%eax, 588(%esp)
	movdqa	%xmm5, %xmm6
	palignr	$8, 128(%esp), %xmm6
	movdqa	112(%esp), %xmm0
	palignr	$8, %xmm5, %xmm0
	movdqa	%xmm0, (%esp)
	movdqa	96(%esp), %xmm7
	palignr	$8, 112(%esp), %xmm7
	movdqa	128(%esp), %xmm1
	palignr	$8, 96(%esp), %xmm1
	movdqa	.LC18, %xmm0
	movdqa	%xmm0, 272(%esp)
	psignd	%xmm0, %xmm6
	movdqa	(%esp), %xmm0
	psignd	%xmm3, %xmm0
	psignd	%xmm3, %xmm7
	psignd	.LC21, %xmm1
	psignd	%xmm3, %xmm2
	psubd	%xmm2, %xmm0
	psubd	%xmm2, %xmm6
	movl	32(%edx), %eax
	rorl	$23, %eax
	movl	%eax, 592(%esp)
	movl	36(%edx), %eax
	rorl	$22, %eax
	movl	%eax, 596(%esp)
	movl	40(%edx), %eax
	rorl	$21, %eax
	movl	%eax, 600(%esp)
	movl	44(%edx), %eax
	rorl	$20, %eax
	movl	%eax, 604(%esp)
	movdqa	%xmm5, 288(%esp)
	paddd	%xmm0, %xmm5
	movdqa	96(%esp), %xmm3
	movdqa	%xmm3, 304(%esp)
	paddd	%xmm3, %xmm5
	movdqa	.LC17, %xmm0
	movdqa	%xmm0, 320(%esp)
	psignd	%xmm0, %xmm4
	paddd	%xmm4, %xmm5
	movl	48(%edx), %eax
	rorl	$19, %eax
	movl	%eax, 608(%esp)
	movl	52(%edx), %eax
	rorl	$18, %eax
	movl	%eax, 612(%esp)
	movl	56(%edx), %eax
	rorl	$17, %eax
	movl	%eax, 616(%esp)
	movl	60(%edx), %eax
	rorl	$16, %eax
	movl	%eax, 620(%esp)
	movdqa	112(%esp), %xmm3
	movdqa	%xmm3, 336(%esp)
	movdqa	%xmm3, %xmm0
	psignd	272(%esp), %xmm0
	paddd	%xmm0, %xmm7
	psubd	%xmm4, %xmm7
	movdqa	.LC19, %xmm3
	movdqa	128(%esp), %xmm0
	movdqa	%xmm0, 352(%esp)
	psignd	%xmm3, %xmm0
	paddd	%xmm0, %xmm7
	movdqa	.LC20, %xmm2
	movdqa	80(%esp), %xmm4
	movdqa	%xmm4, %xmm0
	psignd	%xmm2, %xmm0
	paddd	%xmm0, %xmm7
	movdqa	304(%esp), %xmm0
	psignd	%xmm2, %xmm0
	paddd	%xmm0, %xmm1
	movdqa	%xmm4, %xmm0
	psignd	%xmm3, %xmm0
	paddd	%xmm0, %xmm1
	movdqa	288(%esp), %xmm0
	psignd	320(%esp), %xmm0
	psubd	%xmm0, %xmm1
	movdqa	64(%esp), %xmm3
	movdqa	%xmm3, %xmm0
	psignd	272(%esp), %xmm0
	psubd	%xmm0, %xmm1
	movdqa	352(%esp), %xmm0
	psignd	%xmm2, %xmm0
	paddd	%xmm0, %xmm6
	movdqa	%xmm3, %xmm0
	psignd	.LC22, %xmm0
	paddd	%xmm0, %xmm6
	movdqa	336(%esp), %xmm0
	psignd	320(%esp), %xmm0
	psubd	%xmm0, %xmm6
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
	movdqa	640(%esp), %xmm7
	palignr	$4, 688(%esp), %xmm7
	movdqa	688(%esp), %xmm6
	palignr	$4, 672(%esp), %xmm6
	movdqa	672(%esp), %xmm4
	palignr	$4, 656(%esp), %xmm4
	movdqa	656(%esp), %xmm0
	palignr	$4, 640(%esp), %xmm0
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, 192(%esp)
	paddd	%xmm4, %xmm3
	movdqa	%xmm3, 208(%esp)
	paddd	%xmm6, %xmm5
	movdqa	%xmm5, 224(%esp)
	paddd	%xmm7, %xmm2
	movdqa	%xmm2, 240(%esp)
	leal	432(%esp), %ecx
	movdqa	%xmm1, (%ecx)
	movdqa	%xmm3, 16(%ecx)
	movdqa	%xmm5, 32(%ecx)
	movdqa	%xmm2, 48(%ecx)
	pxor	%xmm5, %xmm5
	movdqa	%xmm5, %xmm0
	punpckhqdq	192(%esp), %xmm0
	paddd	208(%esp), %xmm0
	paddd	224(%esp), %xmm0
	paddd	240(%esp), %xmm0
	pshufd	$120, %xmm0, %xmm0
	phaddd	%xmm0, %xmm0
	movq	%xmm0, 24(%esp)
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%eax, 36(%esp)
	movl	%eax, 752(%esp)
	movl	%edx, 756(%esp)
	movdqa	192(%esp), %xmm0
	punpcklqdq	208(%esp), %xmm0
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
	movdqa	192(%esp), %xmm0
	punpckhqdq	208(%esp), %xmm0
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
	movdqa	224(%esp), %xmm0
	punpcklqdq	240(%esp), %xmm0
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
	movdqa	224(%esp), %xmm0
	punpckhqdq	240(%esp), %xmm0
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
	movdqa	208(%esp), %xmm3
	palignr	$4, 192(%esp), %xmm3
	movdqa	224(%esp), %xmm0
	palignr	$4, 208(%esp), %xmm0
	movdqa	%xmm0, 48(%esp)
	movdqa	%xmm3, %xmm0
	punpcklqdq	48(%esp), %xmm0
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
	punpckhqdq	48(%esp), %xmm3
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
	movdqa	240(%esp), %xmm7
	palignr	$4, 224(%esp), %xmm7
	palignr	$4, 240(%esp), %xmm5
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
	leal	560(%esp), %eax
	movdqa	32(%eax), %xmm5
	leal	608(%esp), %edx
	movdqa	(%edx), %xmm2
	movdqa	(%eax), %xmm1
	palignr	$12, %xmm2, %xmm1
	movdqa	16(%eax), %xmm3
	palignr	$12, (%eax), %xmm3
	movdqa	%xmm5, %xmm6
	palignr	$12, 16(%eax), %xmm6
	movdqa	%xmm5, %xmm0
	palignr	$8, 16(%eax), %xmm0
	paddd	%xmm2, %xmm1
	paddd	.LC15, %xmm1
	psubd	%xmm0, %xmm1
	movdqa	656(%esp), %xmm0
	palignr	$12, 640(%esp), %xmm0
	pxor	%xmm1, %xmm0
	movdqa	%xmm0, 112(%ecx)
	palignr	$12, %xmm5, %xmm2
	movdqa	16(%eax), %xmm0
	palignr	$8, (%eax), %xmm0
	paddd	%xmm5, %xmm2
	paddd	.LC14, %xmm2
	psubd	%xmm0, %xmm2
	movdqa	640(%esp), %xmm0
	palignr	$12, 688(%esp), %xmm0
	pxor	%xmm0, %xmm2
	movdqa	%xmm7, %xmm0
	psrld	$29, %xmm0
	movdqa	%xmm7, %xmm1
	pslld	$3, %xmm1
	por	%xmm1, %xmm0
	movdqa	%xmm2, %xmm5
	paddd	%xmm0, %xmm5
	movdqa	240(%esp), %xmm2
	palignr	$12, 224(%esp), %xmm2
	movdqa	%xmm2, %xmm0
	movdqa	%xmm2, %xmm1
	psrld	$25, %xmm1
	pslld	$7, %xmm0
	por	%xmm0, %xmm1
	movdqa	%xmm5, %xmm0
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, 96(%ecx)
	paddd	(%eax), %xmm3
	paddd	.LC12, %xmm3
	movq	40(%eax), %xmm0
	movq	(%edx), %xmm1
	punpcklqdq	%xmm1, %xmm0
	psubd	%xmm0, %xmm3
	movdqa	672(%esp), %xmm0
	palignr	$12, 656(%esp), %xmm0
	pxor	%xmm3, %xmm0
	paddd	%xmm0, %xmm4
	movdqa	%xmm4, 64(%ecx)
	paddd	16(%eax), %xmm6
	paddd	.LC13, %xmm6
	movq	56(%eax), %xmm0
	movq	(%eax), %xmm1
	punpcklqdq	%xmm1, %xmm0
	psubd	%xmm0, %xmm6
	movdqa	688(%esp), %xmm0
	palignr	$12, 672(%esp), %xmm0
	movdqa	%xmm0, %xmm3
	pxor	%xmm6, %xmm3
	movdqa	48(%esp), %xmm1
	movdqa	%xmm1, %xmm0
	psrld	$29, %xmm0
	pslld	$3, %xmm1
	por	%xmm1, %xmm0
	paddd	%xmm0, %xmm3
	movdqa	224(%esp), %xmm0
	palignr	$12, 208(%esp), %xmm0
	movdqa	%xmm0, %xmm1
	psrld	$25, %xmm1
	pslld	$7, %xmm0
	por	%xmm0, %xmm1
	paddd	%xmm3, %xmm1
	movdqa	%xmm7, %xmm0
	psrld	$19, %xmm0
	pslld	$13, %xmm7
	por	%xmm7, %xmm0
	paddd	%xmm1, %xmm0
	pshufb	.LC23, %xmm2
	paddd	%xmm2, %xmm0
	movdqa	%xmm0, 80(%ecx)
	movl	480(%esp), %esi
	rorl	$13, %esi
	movl	488(%esp), %ebx
	movl	%ebx, %eax
	rorl	$13, %eax
	movl	%eax, 176(%esp)
	movl	%ebx, %edx
	rorl	$19, %edx
	movl	%edx, 184(%esp)
	movl	484(%esp), %eax
	movl	%eax, %edi
	rorl	$19, %edi
	movl	492(%esp), %ecx
	rorl	$16, %ecx
	movl	%ecx, 268(%esp)
	rorl	$25, %ecx
	movl	%ecx, 384(%esp)
	movl	%eax, %edx
	rorl	$9, %edx
	movl	%edx, 172(%esp)
	movl	476(%esp), %edx
	rorl	$13, %edx
	movl	492(%esp), %ecx
	rorl	$13, %ecx
	movl	%ecx, 180(%esp)
	rorl	$29, %eax
	movl	%eax, 188(%esp)
	movl	496(%esp), %eax
	sall	$3, %eax
	movl	496(%esp), %ecx
	rorl	$13, %ecx
	movl	%ecx, 380(%esp)
	movl	496(%esp), %ecx
	shrl	%ecx
	xorl	380(%esp), %eax
	movl	%eax, %ebp
	xorl	%ecx, %ebp
	movl	380(%esp), %eax
	rorl	$15, %eax
	xorl	%ebp, %eax
	addl	500(%esp), %eax
	movl	%eax, 168(%esp)
	movl	%eax, 500(%esp)
	movl	36(%esp), %eax
	movl	%eax, 164(%esp)
	movl	%eax, %ebp
	addl	504(%esp), %ebp
	addl	172(%esp), %ebp
	movl	492(%esp), %eax
	rorl	$5, %eax
	leal	(%ebp,%eax), %eax
	leal	(%eax,%edx), %edx
	movl	444(%esp), %eax
	rorl	$29, %eax
	addl	%eax, %edx
	movl	452(%esp), %eax
	rorl	$25, %eax
	addl	%eax, %edx
	movl	460(%esp), %eax
	rorl	$19, %eax
	addl	%eax, %edx
	movl	468(%esp), %eax
	rorl	$16, %eax
	leal	(%edx,%eax), %eax
	xorl	496(%esp), %ecx
	leal	(%eax,%ecx), %edx
	movl	168(%esp), %eax
	shrl	$2, %eax
	xorl	168(%esp), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, 388(%esp)
	movl	%eax, 504(%esp)
	movl	756(%esp), %ebp
	movl	%ebp, %eax
	addl	508(%esp), %eax
	addl	%esi, %eax
	rorl	$9, %ebx
	leal	(%eax,%ebx), %edx
	movl	448(%esp), %eax
	rorl	$29, %eax
	addl	%eax, %edx
	movl	456(%esp), %eax
	rorl	$25, %eax
	addl	%eax, %edx
	movl	464(%esp), %eax
	rorl	$19, %eax
	addl	%eax, %edx
	movl	472(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %edx
	movl	496(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %edx
	movl	168(%esp), %eax
	shrl	%eax
	xorl	168(%esp), %eax
	addl	%eax, %edx
	movl	388(%esp), %eax
	shrl	$2, %eax
	xorl	388(%esp), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, 392(%esp)
	movl	%eax, 508(%esp)
	movl	164(%esp), %eax
	addl	496(%esp), %eax
	movl	%eax, %edx
	subl	440(%esp), %edx
	movl	%edi, %eax
	rorl	$26, %eax
	addl	384(%esp), %eax
	addl	512(%esp), %eax
	leal	(%eax,%edx), %ecx
	movl	168(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	388(%esp), %eax
	shrl	%eax
	xorl	388(%esp), %eax
	addl	%eax, %ecx
	movl	392(%esp), %eax
	shrl	$2, %eax
	xorl	392(%esp), %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, 396(%esp)
	movl	%eax, 512(%esp)
	movl	%ebp, %eax
	subl	444(%esp), %eax
	movl	168(%esp), %ecx
	leal	(%eax,%ecx), %ebx
	movl	496(%esp), %eax
	rorl	$9, %eax
	addl	176(%esp), %eax
	addl	516(%esp), %eax
	leal	(%eax,%ebx), %ecx
	movl	388(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	392(%esp), %eax
	shrl	%eax
	xorl	392(%esp), %eax
	addl	%eax, %ecx
	movl	396(%esp), %eax
	shrl	$2, %eax
	xorl	396(%esp), %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, 400(%esp)
	movl	%eax, 516(%esp)
	movl	%edx, %eax
	subl	448(%esp), %eax
	movl	388(%esp), %ecx
	leal	(%eax,%ecx), %edx
	movl	180(%esp), %ecx
	addl	520(%esp), %ecx
	movl	168(%esp), %eax
	rorl	$9, %eax
	leal	(%ecx,%eax), %eax
	leal	(%eax,%edx), %ecx
	movl	392(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	396(%esp), %eax
	shrl	%eax
	xorl	396(%esp), %eax
	addl	%eax, %ecx
	movl	400(%esp), %eax
	shrl	$2, %eax
	xorl	400(%esp), %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, 404(%esp)
	movl	%eax, 520(%esp)
	movl	%ebx, %eax
	subl	452(%esp), %eax
	movl	392(%esp), %ecx
	leal	(%eax,%ecx), %ebx
	movl	380(%esp), %ecx
	addl	524(%esp), %ecx
	movl	388(%esp), %eax
	rorl	$9, %eax
	leal	(%ecx,%eax), %eax
	leal	(%eax,%ebx), %ecx
	movl	396(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	400(%esp), %eax
	shrl	%eax
	xorl	400(%esp), %eax
	addl	%eax, %ecx
	movl	404(%esp), %eax
	shrl	$2, %eax
	xorl	404(%esp), %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, 408(%esp)
	movl	168(%esp), %eax
	xorl	496(%esp), %eax
	xorl	388(%esp), %eax
	xorl	392(%esp), %eax
	xorl	396(%esp), %eax
	xorl	400(%esp), %eax
	xorl	404(%esp), %eax
	xorl	408(%esp), %eax
	movl	%eax, 412(%esp)
	movl	408(%esp), %eax
	movl	%eax, 524(%esp)
	movl	%edx, %eax
	subl	456(%esp), %eax
	movl	396(%esp), %ecx
	leal	(%eax,%ecx), %edx
	movl	412(%esp), %eax
	movl	%eax, 736(%esp)
	movl	$0, 740(%esp)
	movq	736(%esp), %xmm0
	pshufd	$0, %xmm0, %xmm0
	sall	$4, %eax
	movl	%eax, 716(%esp)
	movl	412(%esp), %eax
	sall	$6, %eax
	movl	%eax, 712(%esp)
	movl	412(%esp), %eax
	sall	$8, %eax
	movl	%eax, 704(%esp)
	movl	412(%esp), %eax
	shrl	$2, %eax
	movl	%eax, 732(%esp)
	movl	412(%esp), %eax
	shrl	$3, %eax
	movl	%eax, 720(%esp)
	movl	412(%esp), %eax
	shrl	$4, %eax
	movl	%eax, 724(%esp)
	movl	412(%esp), %eax
	shrl	$6, %eax
	movl	%eax, 708(%esp)
	movl	412(%esp), %eax
	shrl	$7, %eax
	movl	%eax, 728(%esp)
	addl	268(%esp), %edi
	addl	528(%esp), %edi
	movl	168(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %edi
	movl	392(%esp), %eax
	rorl	$9, %eax
	addl	%eax, %edi
	addl	%edx, %edi
	movl	400(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %edi
	movl	404(%esp), %eax
	shrl	%eax
	xorl	404(%esp), %eax
	addl	%eax, %edi
	movl	408(%esp), %eax
	shrl	$2, %eax
	xorl	408(%esp), %eax
	addl	%eax, %edi
	movl	%edi, 528(%esp)
	movl	%ebx, %eax
	subl	460(%esp), %eax
	movl	400(%esp), %ecx
	leal	(%eax,%ecx), %ebx
	movl	496(%esp), %eax
	rorl	$16, %eax
	addl	184(%esp), %eax
	movl	%eax, %ecx
	addl	532(%esp), %ecx
	movl	388(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %ecx
	movl	396(%esp), %eax
	rorl	$9, %eax
	leal	(%ecx,%eax), %eax
	leal	(%eax,%ebx), %ecx
	movl	404(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	408(%esp), %eax
	shrl	%eax
	xorl	408(%esp), %eax
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$2, %eax
	xorl	%edi, %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, 416(%esp)
	movl	%eax, 532(%esp)
	movl	%edx, %eax
	subl	464(%esp), %eax
	movl	404(%esp), %ecx
	leal	(%eax,%ecx), %edx
	movl	384(%esp), %eax
	rorl	$10, %eax
	movl	%eax, %ecx
	addl	536(%esp), %ecx
	movl	168(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %ecx
	movl	392(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %ecx
	movl	400(%esp), %eax
	rorl	$9, %eax
	leal	(%ecx,%eax), %eax
	leal	(%eax,%edx), %ecx
	movl	408(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	%eax
	xorl	%edi, %eax
	addl	%eax, %ecx
	movl	416(%esp), %eax
	shrl	$2, %eax
	xorl	416(%esp), %eax
	leal	(%ecx,%eax), %ebp
	movl	%ebp, 536(%esp)
	movl	%ebx, %eax
	subl	468(%esp), %eax
	movl	408(%esp), %ebx
	leal	(%eax,%ebx), %ecx
	movl	496(%esp), %esi
	rorl	$19, %esi
	addl	540(%esp), %esi
	movl	388(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %esi
	movl	396(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %esi
	movl	404(%esp), %eax
	rorl	$9, %eax
	addl	%eax, %esi
	addl	%ecx, %esi
	movl	%edi, %eax
	rorl	$5, %eax
	addl	%eax, %esi
	movl	416(%esp), %eax
	shrl	%eax
	xorl	416(%esp), %eax
	addl	%eax, %esi
	movl	%ebp, %eax
	shrl	$2, %eax
	xorl	%ebp, %eax
	addl	%eax, %esi
	movl	%esi, 540(%esp)
	movl	%edx, %eax
	subl	472(%esp), %eax
	addl	%edi, %eax
	movl	%eax, 420(%esp)
	movl	492(%esp), %eax
	rorl	$25, %eax
	addl	188(%esp), %eax
	movl	%eax, %edx
	addl	544(%esp), %edx
	movl	168(%esp), %eax
	rorl	$19, %eax
	addl	%eax, %edx
	movl	392(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %edx
	movl	400(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %edx
	movl	%ebx, %eax
	rorl	$9, %eax
	leal	(%edx,%eax), %eax
	movl	420(%esp), %ebx
	leal	(%eax,%ebx), %edx
	movl	416(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %edx
	movl	%ebp, %eax
	shrl	%eax
	xorl	%ebp, %eax
	addl	%eax, %edx
	movl	%esi, %eax
	shrl	$2, %eax
	xorl	%esi, %eax
	leal	(%edx,%eax), %eax
	movl	%eax, 424(%esp)
	movl	%eax, 544(%esp)
	movl	%ecx, %eax
	subl	476(%esp), %eax
	addl	416(%esp), %eax
	movl	%eax, 428(%esp)
	movl	488(%esp), %ebx
	rorl	$29, %ebx
	movl	496(%esp), %eax
	rorl	$25, %eax
	addl	%eax, %ebx
	addl	548(%esp), %ebx
	movl	388(%esp), %eax
	rorl	$19, %eax
	addl	%eax, %ebx
	movl	396(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %ebx
	movl	404(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %ebx
	movl	%edi, %eax
	rorl	$9, %eax
	addl	%eax, %ebx
	addl	428(%esp), %ebx
	movl	%ebp, %eax
	rorl	$5, %eax
	addl	%eax, %ebx
	movl	%esi, %eax
	shrl	%eax
	xorl	%esi, %eax
	addl	%eax, %ebx
	movl	424(%esp), %eax
	shrl	$2, %eax
	xorl	424(%esp), %eax
	addl	%eax, %ebx
	movl	%ebx, 548(%esp)
	movl	492(%esp), %edx
	rorl	$29, %edx
	subl	480(%esp), %edx
	addl	552(%esp), %edx
	movl	168(%esp), %eax
	rorl	$25, %eax
	addl	%eax, %edx
	movl	392(%esp), %eax
	rorl	$19, %eax
	addl	%eax, %edx
	movl	400(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %edx
	movl	408(%esp), %eax
	rorl	$13, %eax
	addl	%eax, %edx
	addl	420(%esp), %edx
	movl	416(%esp), %eax
	rorl	$9, %eax
	addl	%eax, %edx
	addl	%ebp, %edx
	movl	%esi, %eax
	rorl	$5, %eax
	addl	%eax, %edx
	movl	424(%esp), %eax
	shrl	%eax
	xorl	424(%esp), %eax
	addl	%eax, %edx
	movl	%ebx, %eax
	shrl	$2, %eax
	xorl	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, 552(%esp)
	movl	496(%esp), %ecx
	rorl	$29, %ecx
	subl	484(%esp), %ecx
	addl	556(%esp), %ecx
	movl	388(%esp), %eax
	rorl	$25, %eax
	addl	%eax, %ecx
	movl	396(%esp), %eax
	rorl	$19, %eax
	addl	%eax, %ecx
	movl	404(%esp), %eax
	rorl	$16, %eax
	addl	%eax, %ecx
	movl	%edi, %eax
	rorl	$13, %eax
	addl	%eax, %ecx
	addl	428(%esp), %ecx
	movl	%ebp, %eax
	rorl	$9, %eax
	addl	%eax, %ecx
	addl	%esi, %ecx
	movl	424(%esp), %eax
	rorl	$5, %eax
	addl	%eax, %ecx
	movl	%ebx, %eax
	shrl	%eax
	xorl	%ebx, %eax
	addl	%eax, %ecx
	movl	%edx, %eax
	shrl	$2, %eax
	xorl	%edx, %eax
	addl	%eax, %ecx
	xorl	412(%esp), %edi
	xorl	416(%esp), %edi
	xorl	%ebp, %edi
	xorl	%esi, %edi
	xorl	424(%esp), %edi
	xorl	%ebx, %edi
	xorl	%edx, %edi
	xorl	%ecx, %edi
	movl	%ecx, 556(%esp)
	movl	%edi, 736(%esp)
	movq	736(%esp), %xmm4
	pshufd	$0, %xmm4, %xmm4
	movdqa	192(%esp), %xmm1
	pxor	%xmm0, %xmm1
	leal	432(%esp), %esi
	movdqa	96(%esi), %xmm3
	movdqa	112(%esi), %xmm5
	pxor	%xmm3, %xmm1
	movdqa	%xmm1, 640(%esp)
	movl	496(%esp), %ebp
	shrl	$5, %ebp
	movl	800(%esp), %eax
	xorl	(%eax), %ebp
	movl	%edi, %eax
	sall	$5, %eax
	xorl	%ebp, %eax
	addl	%eax, 640(%esp)
	movl	168(%esp), %ebp
	sall	$8, %ebp
	movl	800(%esp), %eax
	xorl	4(%eax), %ebp
	movl	%edi, %eax
	shrl	$7, %eax
	xorl	%ebp, %eax
	addl	%eax, 644(%esp)
	movl	388(%esp), %ebp
	sall	$5, %ebp
	movl	800(%esp), %eax
	xorl	8(%eax), %ebp
	movl	%edi, %eax
	shrl	$5, %eax
	xorl	%ebp, %eax
	addl	%eax, 648(%esp)
	movl	392(%esp), %ebp
	sall	$5, %ebp
	movl	800(%esp), %eax
	xorl	12(%eax), %ebp
	movl	%edi, %eax
	shrl	%eax
	xorl	%ebp, %eax
	addl	%eax, 652(%esp)
	movl	396(%esp), %ebp
	movl	800(%esp), %eax
	xorl	16(%eax), %ebp
	movl	%edi, %eax
	shrl	$3, %eax
	xorl	%eax, %ebp
	movl	412(%esp), %eax
	xorl	448(%esp), %eax
	xorl	424(%esp), %eax
	leal	(%ebp,%eax), %eax
	movl	%eax, 44(%esp)
	movl	%eax, 656(%esp)
	movl	400(%esp), %ebp
	shrl	$6, %ebp
	movl	800(%esp), %eax
	xorl	20(%eax), %ebp
	movl	%edi, %eax
	sall	$6, %eax
	xorl	%eax, %ebp
	movl	412(%esp), %eax
	xorl	452(%esp), %eax
	xorl	%ebx, %eax
	leal	(%ebp,%eax), %eax
	movl	%eax, 40(%esp)
	movl	%eax, 660(%esp)
	movl	404(%esp), %eax
	sall	$6, %eax
	movl	%eax, %ebp
	movl	800(%esp), %ebx
	xorl	24(%ebx), %ebp
	movl	%edi, %eax
	shrl	$4, %eax
	xorl	%eax, %ebp
	movl	412(%esp), %eax
	xorl	456(%esp), %eax
	xorl	%edx, %eax
	leal	(%ebp,%eax), %edx
	movl	%edx, 664(%esp)
	movl	408(%esp), %eax
	sall	$2, %eax
	xorl	28(%ebx), %eax
	shrl	$11, %edi
	movl	%eax, %ebx
	xorl	%edi, %ebx
	movl	412(%esp), %eax
	xorl	460(%esp), %eax
	xorl	%ecx, %eax
	leal	(%ebx,%eax), %ecx
	movl	%ecx, 668(%esp)
	movdqa	64(%esi), %xmm1
	movdqa	80(%esi), %xmm0
	movdqa	%xmm1, %xmm2
	palignr	$12, %xmm0, %xmm2
	palignr	$12, %xmm1, %xmm0
	movdqa	224(%esp), %xmm1
	pxor	%xmm2, %xmm1
	leal	704(%esp), %eax
	pxor	(%eax), %xmm1
	movdqa	240(%esp), %xmm2
	pxor	%xmm0, %xmm2
	pxor	16(%eax), %xmm2
	movl	800(%esp), %eax
	pxor	32(%eax), %xmm3
	pxor	%xmm4, %xmm3
	movdqa	%xmm1, %xmm0
	paddd	%xmm3, %xmm0
	pxor	48(%eax), %xmm5
	pxor	%xmm4, %xmm5
	paddd	%xmm5, %xmm2
	movdqa	%xmm2, 688(%esp)
	movdqa	%xmm0, 672(%esp)
	movl	44(%esp), %eax
	rorl	$23, %eax
	addl	%eax, 672(%esp)
	movl	40(%esp), %eax
	rorl	$22, %eax
	addl	%eax, 676(%esp)
	movl	%edx, %eax
	rorl	$21, %eax
	addl	%eax, 680(%esp)
	movl	%ecx, %eax
	rorl	$20, %eax
	addl	%eax, 684(%esp)
	movl	640(%esp), %eax
	rorl	$19, %eax
	addl	%eax, 688(%esp)
	movl	644(%esp), %eax
	rorl	$18, %eax
	addl	%eax, 692(%esp)
	movl	648(%esp), %eax
	rorl	$17, %eax
	addl	%eax, 696(%esp)
	movl	652(%esp), %eax
	rorl	$16, %eax
	addl	%eax, 700(%esp)
	addl	$64, 800(%esp)
	movl	804(%esp), %edx
	cmpl	%edx, 800(%esp)
	jb	.L2
	movl	160(%esp), %ecx
	movdqa	(%ecx), %xmm0
	movl	144(%esp), %ebx
	movdqa	%xmm0, (%ebx)
	movdqa	656(%esp), %xmm0
	movl	148(%esp), %eax
	movdqa	%xmm0, (%eax)
	movdqa	672(%esp), %xmm0
	movl	152(%esp), %edx
	movdqa	%xmm0, (%edx)
	movdqa	688(%esp), %xmm0
	movl	156(%esp), %ecx
	movdqa	%xmm0, (%ecx)
	addl	$780, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
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
	.long	1431655760
	.long	1521134245
	.long	1610612730
	.long	1700091215
	.align 16
.LC13:
	.long	1789569700
	.long	1879048185
	.long	1968526670
	.long	2058005155
	.align 16
.LC14:
	.long	2147483640
	.long	-2058005171
	.long	-1968526686
	.long	-1879048201
	.align 16
.LC15:
	.long	-1789569716
	.long	-1700091231
	.long	-1610612746
	.long	-1521134261
	.align 16
.LC16:
	.long	-1
	.long	-1
	.long	1
	.long	-1
	.align 16
.LC17:
	.long	1
	.long	-1
	.long	1
	.long	-1
	.align 16
.LC18:
	.long	1
	.long	1
	.long	-1
	.long	-1
	.align 16
.LC19:
	.long	1
	.long	-1
	.long	-1
	.long	-1
	.align 16
.LC20:
	.long	1
	.long	1
	.long	1
	.long	-1
	.align 16
.LC21:
	.long	-1
	.long	1
	.long	-1
	.long	-1
	.align 16
.LC22:
	.long	-1
	.long	1
	.long	1
	.long	-1
	.align 16
.LC23:
	.long	16777986
	.long	84150022
	.long	151522058
	.long	218894094
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",@progbits
