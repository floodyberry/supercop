	.file     "Compress256_sse2_32_v1.c"
	.text
	.globl    Compress256
	.type     Compress256, @function
	Compress256:
.LFB540:
	pushq     %r15
.LCFI0:
	pushq     %r14
.LCFI1:
	pushq     %r13
.LCFI2:
	pushq     %r12
.LCFI3:
	pushq     %rbp
.LCFI4:
	pushq     %rbx
.LCFI5:
	subq      $448, %rsp
.LCFI6:
	movq      %rdi, %rbp
	movdqa    .LC4(%rip), %xmm15
	movq      %rsi, -96(%rsp)
	movdqa    16(%rdx), %xmm0
	movdqa    %xmm0, 232(%rsp)
	movdqa    %xmm0, 296(%rsp)
	leaq      16(%rdx), %rax
	movdqa    32(%rdx), %xmm0
	movq      %rax, -88(%rsp)
	movdqa    %xmm0, 248(%rsp)
	movdqa    48(%rdx), %xmm0
	movdqa    %xmm0, 264(%rsp)
	movdqa    64(%rdx), %xmm0
	movdqa    %xmm0, 280(%rsp)
	.align    32
.L2:
	movl      (%rbp), %eax
	rorl      $31, %eax
	movdqa    232(%rsp), %xmm6
	movl      %eax, 152(%rsp)
	movl      %eax, 216(%rsp)
	pxor      (%rbp), %xmm6
	movdqa    248(%rsp), %xmm1
	pxor      .LC20(%rip), %xmm6
	pxor      16(%rbp), %xmm1
	movl      4(%rbp), %eax
	pxor      %xmm15, %xmm1
	rorl      $30, %eax
	movl      %eax, 156(%rsp)
	movl      %eax, 220(%rsp)
	movdqa    264(%rsp), %xmm9
	movdqa    .LC21(%rip), %xmm0
	movaps    %xmm1, %xmm7
	pxor      32(%rbp), %xmm9
	movdqa    %xmm1, %xmm4
	pxor      .LC8(%rip), %xmm9
	movdqa    280(%rsp), %xmm5
	movdqa    .LC21(%rip), %xmm2
	pxor      %xmm9, %xmm0
	pxor      .LC7(%rip), %xmm4
	pxor      %xmm6, %xmm2
	movdqa    %xmm2, %xmm8
	pxor      48(%rbp), %xmm5
	psubd     %xmm6, %xmm9
	movdqa    %xmm5, %xmm3
	shufps    $78, %xmm0, %xmm7
	pxor      %xmm15, %xmm3
	paddd     %xmm1, %xmm5
	movl      8(%rbp), %eax
	movdqa    %xmm7, %xmm6
	psubd     %xmm7, %xmm5
	pslldq    $4, %xmm7
	paddd     %xmm3, %xmm4
	paddd     %xmm0, %xmm8
	rorl      $29, %eax
	psrldq    $12, %xmm6
	shufps    $78, %xmm3, %xmm0
	shufps    $78, %xmm2, %xmm3
	movl      %eax, 160(%rsp)
	psubd     %xmm3, %xmm4
	movl      %eax, 224(%rsp)
	movl      12(%rbp), %eax
	rorl      $28, %eax
	movl      %eax, 164(%rsp)
	movl      16(%rbp), %eax
	rorl      $27, %eax
	movl      %eax, 168(%rsp)
	pxor      %xmm15, %xmm0
	shufps    $78, %xmm1, %xmm2
	movdqa    %xmm0, %xmm1
	paddd     %xmm0, %xmm9
	pxor      .LC21(%rip), %xmm2
	movl      20(%rbp), %eax
	rorl      $26, %eax
	movl      %eax, 172(%rsp)
	movl      24(%rbp), %eax
	rorl      $25, %eax
	movl      %eax, 176(%rsp)
	movl      28(%rbp), %eax
	psubd     %xmm2, %xmm8
	pslldq    $4, %xmm1
	rorl      $24, %eax
	por       %xmm1, %xmm6
	pxor      .LC9(%rip), %xmm6
	movl      %eax, 180(%rsp)
	movl      32(%rbp), %eax
	rorl      $23, %eax
	movl      %eax, 184(%rsp)
	movl      36(%rbp), %eax
	rorl      $22, %eax
	movl      %eax, 188(%rsp)
	paddd     %xmm6, %xmm5
	movdqa    %xmm3, %xmm1
	movl      40(%rbp), %eax
	rorl      $21, %eax
	movl      %eax, 192(%rsp)
	movl      44(%rbp), %eax
	psrldq    $12, %xmm3
	psrldq    $12, %xmm0
	rorl      $20, %eax
	pslldq    $4, %xmm1
	movl      %eax, 196(%rsp)
	movl      48(%rbp), %eax
	movl      $0, 88(%rsp)
	movdqa    168(%rsp), %xmm12
	por       %xmm1, %xmm0
	movdqa    %xmm2, %xmm1
	rorl      $19, %eax
	movl      %eax, 200(%rsp)
	pslldq    $4, %xmm1
	por       %xmm1, %xmm3
	pxor      .LC21(%rip), %xmm0
	paddd     %xmm0, %xmm9
	paddd     %xmm3, %xmm4
	movl      52(%rbp), %eax
	pxor      .LC21(%rip), %xmm3
	psrldq    $12, %xmm2
	por       %xmm7, %xmm2
	pxor      %xmm15, %xmm0
	pxor      .LC20(%rip), %xmm2
	rorl      $18, %eax
	paddd     %xmm2, %xmm8
	movl      %eax, 204(%rsp)
	movl      56(%rbp), %eax
	pxor      .LC10(%rip), %xmm2
	psubd     %xmm3, %xmm9
	rorl      $17, %eax
	psubd     %xmm2, %xmm4
	movl      %eax, 208(%rsp)
	paddd     .LC13(%rip), %xmm4
	movl      60(%rbp), %eax
	rorl      $16, %eax
	movl      %eax, 212(%rsp)
	paddd     .LC12(%rip), %xmm9
	pxor      %xmm15, %xmm6
	movaps    %xmm9, %xmm2
	psubd     %xmm0, %xmm5
	paddd     %xmm6, %xmm8
	paddd     .LC22(%rip), %xmm5
	paddd     .LC14(%rip), %xmm8
	shufps    $15, %xmm8, %xmm2
	shufps    $168, %xmm5, %xmm2
	movaps    %xmm4, %xmm0
	shufps    $141, %xmm9, %xmm0
	movaps    %xmm8, %xmm7
	shufps    $216, %xmm8, %xmm4
	shufps    $42, %xmm0, %xmm7
	shufps    $23, %xmm5, %xmm0
	movdqa    %xmm0, %xmm1
	shufps    $213, %xmm4, %xmm9
	shufps    $143, %xmm4, %xmm5
	pslld     $3, %xmm1
	psrld     $1, %xmm0
	movdqa    %xmm1, %xmm8
	pxor      %xmm0, %xmm8
	pslld     $1, %xmm1
	pxor      %xmm1, %xmm8
	psrld     $12, %xmm0
	pxor      %xmm0, %xmm8
	psrld     $15, %xmm0
	pslld     $15, %xmm1
	pxor      %xmm1, %xmm8
	pxor      %xmm0, %xmm8
	movdqa    %xmm2, %xmm0
	pslld     $2, %xmm0
	psrld     $1, %xmm2
	movdqa    %xmm0, %xmm3
	pxor      %xmm2, %xmm3
	pslld     $6, %xmm0
	psrld     $8, %xmm2
	pxor      %xmm0, %xmm3
	pslld     $15, %xmm0
	pxor      %xmm2, %xmm3
	pxor      %xmm0, %xmm3
	psrld     $15, %xmm2
	pxor      %xmm2, %xmm3
	movdqa    %xmm5, %xmm0
	pslld     $1, %xmm0
	psrld     $2, %xmm5
	movdqa    %xmm0, %xmm6
	pxor      %xmm5, %xmm6
	psrld     $5, %xmm5
	pslld     $11, %xmm0
	pxor      %xmm0, %xmm6
	pslld     $13, %xmm0
	pxor      %xmm5, %xmm6
	pxor      %xmm0, %xmm6
	psrld     $13, %xmm5
	pxor      %xmm5, %xmm6
	movdqa    %xmm7, %xmm0
	pslld     $2, %xmm0
	psrld     $2, %xmm7
	movdqa    %xmm0, %xmm1
	pxor      %xmm7, %xmm1
	movaps    %xmm6, %xmm2
	pslld     $13, %xmm0
	psrld     $1, %xmm7
	movaps    %xmm8, %xmm5
	pxor      %xmm0, %xmm1
	pslld     $14, %xmm0
	pxor      %xmm7, %xmm1
	pxor      %xmm0, %xmm1
	movdqa    %xmm9, %xmm0
	psrld     $14, %xmm7
	pxor      %xmm7, %xmm1
	psrld     $1, %xmm0
	movaps    %xmm1, %xmm4
	pxor      %xmm9, %xmm0
	movdqu    284(%rsp), %xmm7
	shufps    $194, %xmm6, %xmm1
	shufps    $95, %xmm3, %xmm4
	movdqu    268(%rsp), %xmm6
	shufps    $237, %xmm0, %xmm5
	shufps    $10, %xmm0, %xmm2
	movaps    %xmm5, %xmm0
	shufps    $40, %xmm0, %xmm4
	shufps    $34, %xmm8, %xmm3
	shufps    $120, %xmm4, %xmm4
	movaps    %xmm3, %xmm5
	shufps    $34, %xmm1, %xmm5
	paddd     %xmm6, %xmm4
	shufps    $119, %xmm0, %xmm1
	movdqu    236(%rsp), %xmm0
	shufps    $114, %xmm3, %xmm2
	movdqu    252(%rsp), %xmm3
	shufps    $120, %xmm2, %xmm2
	paddd     %xmm0, %xmm5
	movdqa    %xmm5, %xmm13
	paddd     %xmm3, %xmm2
	movdqa    %xmm4, 56(%rsp)
	movdqa    %xmm4, %xmm11
	movdqa    %xmm2, %xmm14
	movdqa    %xmm2, 40(%rsp)
	pxor      %xmm0, %xmm0
	paddd     %xmm7, %xmm1
	movdqa    %xmm5, 24(%rsp)
	movdqa    %xmm1, 72(%rsp)
	movl      80(%rsp), %ebx
	rorl      $9, %ebx
	movl      72(%rsp), %r12d
	movdqa    %xmm1, %xmm10
	punpckhqdq    %xmm5, %xmm0
	paddd     %xmm2, %xmm0
	paddd     %xmm4, %xmm0
	paddd     %xmm1, %xmm0
	pshufd    $238, %xmm0, %xmm1
	paddd     %xmm0, %xmm1
	movq      %xmm1, 424(%rsp)
	movdqa    %xmm5, %xmm0
	punpcklqdq    %xmm2, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $2, %xmm1
	psrld     $1, %xmm0
	movdqa    %xmm1, %xmm4
	pxor      %xmm0, %xmm4
	pslld     $6, %xmm1
	pxor      %xmm1, %xmm4
	psrld     $8, %xmm0
	pxor      %xmm0, %xmm4
	pslld     $15, %xmm1
	pxor      %xmm1, %xmm4
	psrld     $15, %xmm0
	pxor      %xmm0, %xmm4
	movdqa    %xmm5, %xmm0
	punpckhqdq    %xmm2, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $2, %xmm1
	psrld     $2, %xmm0
	movdqa    %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	pslld     $13, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $1, %xmm0
	pxor      %xmm0, %xmm2
	pslld     $14, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $14, %xmm0
	pxor      %xmm0, %xmm2
	movdqa    200(%rsp), %xmm8
	movdqu    60(%rsp), %xmm6
	movdqu    28(%rsp), %xmm3
	movdqa    %xmm11, %xmm0
	paddd     %xmm2, %xmm4
	punpcklqdq    %xmm10, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $2, %xmm1
	psrld     $1, %xmm0
	movdqa    %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	pslld     $6, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $8, %xmm0
	pxor      %xmm0, %xmm2
	pslld     $15, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $15, %xmm0
	pxor      %xmm0, %xmm2
	movdqu    44(%rsp), %xmm7
	paddd     %xmm2, %xmm4
	movdqa    %xmm11, %xmm0
	punpckhqdq    %xmm10, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $2, %xmm1
	psrld     $2, %xmm0
	movdqa    %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	pslld     $13, %xmm1
	movdqa    184(%rsp), %xmm5
	pxor      %xmm1, %xmm2
	movl      84(%rsp), %esi
	rorl      $13, %r12d
	movl      68(%rsp), %ecx
	psrld     $1, %xmm0
	rorl      $5, %esi
	movl      424(%rsp), %r14d
	pxor      %xmm0, %xmm2
	rorl      $13, %ecx
	pslld     $14, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $14, %xmm0
	pxor      %xmm0, %xmm2
	paddd     %xmm2, %xmm4
	movdqa    %xmm3, %xmm0
	punpcklqdq    %xmm7, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $1, %xmm1
	psrld     $2, %xmm0
	movdqa    %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	pslld     $11, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $5, %xmm0
	pxor      %xmm0, %xmm2
	pslld     $13, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $13, %xmm0
	pxor      %xmm0, %xmm2
	paddd     %xmm2, %xmm4
	punpckhqdq    %xmm7, %xmm3
	movdqa    %xmm3, %xmm0
	pslld     $3, %xmm0
	psrld     $1, %xmm3
	movdqa    %xmm0, %xmm1
	pslld     $1, %xmm0
	pxor      %xmm3, %xmm1
	psrld     $12, %xmm3
	pxor      %xmm0, %xmm1
	pslld     $15, %xmm0
	pxor      %xmm3, %xmm1
	pxor      %xmm0, %xmm1
	psrld     $15, %xmm3
	movl      76(%rsp), %edi
	movl      %r14d, %r8d
	rorl      $9, %edi
	pxor      %xmm3, %xmm1
	paddd     %xmm1, %xmm4
	movdqu    76(%rsp), %xmm3
	movdqa    %xmm6, %xmm0
	punpcklqdq    %xmm3, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $1, %xmm1
	psrld     $2, %xmm0
	movdqa    %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	pslld     $11, %xmm1
	pxor      %xmm1, %xmm2
	psrld     $5, %xmm0
	pslld     $13, %xmm1
	pxor      %xmm0, %xmm2
	pxor      %xmm1, %xmm2
	psrld     $13, %xmm0
	pxor      %xmm0, %xmm2
	paddd     %xmm2, %xmm4
	movdqa    %xmm6, %xmm0
	punpckhqdq    %xmm3, %xmm0
	movdqa    %xmm0, %xmm1
	pslld     $3, %xmm1
	psrld     $1, %xmm0
	movdqa    %xmm1, %xmm2
	movdqu    68(%rsp), %xmm3
	pslld     $1, %xmm1
	pxor      %xmm0, %xmm2
	psrld     $12, %xmm0
	pxor      %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	pslld     $15, %xmm1
	psrld     $15, %xmm0
	pxor      %xmm1, %xmm2
	pxor      %xmm0, %xmm2
	movdqu    176(%rsp), %xmm0
	paddd     %xmm2, %xmm4
	pshufd    $238, %xmm4, %xmm9
	paddd     %xmm4, %xmm9
	movdqu    212(%rsp), %xmm1
	movdqu    164(%rsp), %xmm2
	movdqu    180(%rsp), %xmm4
	paddd     %xmm1, %xmm8
	movd      %xmm9, %rax
	paddd     .LC18(%rip), %xmm8
	movdqu    160(%rsp), %xmm1
	psubd     %xmm0, %xmm8
	movdqu    244(%rsp), %xmm0
	pxor      %xmm0, %xmm8
	paddd     %xmm12, %xmm4
	movdqu    196(%rsp), %xmm0
	paddd     %xmm0, %xmm5
	movdqu    292(%rsp), %xmm0
	paddd     .LC16(%rip), %xmm4
	paddd     .LC17(%rip), %xmm5
	psubd     %xmm1, %xmm5
	movdqa    %xmm6, %xmm1
	pxor      %xmm0, %xmm5
	pslld     $3, %xmm1
	movdqa    %xmm6, %xmm0
	psrld     $29, %xmm0
	por       %xmm1, %xmm0
	movdqa    %xmm3, %xmm1
	paddd     %xmm0, %xmm5
	movdqa    %xmm3, %xmm0
	psrld     $25, %xmm0
	pslld     $7, %xmm1
	por       %xmm1, %xmm0
	paddd     %xmm0, %xmm5
	movdqa    152(%rsp), %xmm0
	paddd     %xmm2, %xmm0
	movq      200(%rsp), %xmm2
	paddd     .LC15(%rip), %xmm0
	movq      192(%rsp), %xmm1
	punpcklqdq    %xmm2, %xmm1
	psubd     %xmm1, %xmm0
	movdqu    260(%rsp), %xmm1
	pxor      %xmm1, %xmm0
	movq      %rax, %xmm1
	paddd     %xmm1, %xmm0
	movdqa    %xmm0, 88(%rsp)
	movq      208(%rsp), %xmm0
	movq      152(%rsp), %xmm1
	punpcklqdq    %xmm1, %xmm0
	psubd     %xmm0, %xmm4
	movdqu    276(%rsp), %xmm0
	pxor      %xmm0, %xmm4
	movdqa    %xmm7, %xmm0
	psrld     $29, %xmm0
	pslld     $3, %xmm7
	por       %xmm7, %xmm0
	paddd     %xmm0, %xmm4
	movdqu    52(%rsp), %xmm0
	movl      88(%rsp), %r11d
	movl      %r11d, %r9d
	movl      %r11d, %eax
	movdqa    %xmm0, %xmm1
	shrl      $5, %eax
	leal      0(,%r11,8), %edx
	movl      %eax, 312(%rsp)
	psrld     $25, %xmm1
	movl      %r11d, %eax
	pslld     $7, %xmm0
	shrl      %r9d
	rorl      $13, %eax
	movl      %eax, %r10d
	por       %xmm0, %xmm1
	rorl      $15, %eax
	paddd     %xmm1, %xmm4
	xorl      %edx, %r10d
	movdqa    %xmm6, %xmm0
	xorl      %r9d, %r10d
	psrld     $19, %xmm0
	xorl      %r11d, %r9d
	pslld     $13, %xmm6
	por       %xmm6, %xmm0
	paddd     %xmm0, %xmm4
	movdqa    %xmm3, %xmm0
	psrld     $16, %xmm0
	pslld     $16, %xmm3
	por       %xmm3, %xmm0
	xorl      %eax, %r10d
	addl      92(%rsp), %r10d
	paddd     %xmm0, %xmm4
	movl      %r10d, 92(%rsp)
	addl      96(%rsp), %r8d
	movl      %r10d, %eax
	sall      $8, %eax
	movl      %eax, 316(%rsp)
	addl      %edi, %r8d
	addl      %esi, %r8d
	addl      %ecx, %r8d
	movl      36(%rsp), %eax
	rorl      $29, %eax
	addl      %eax, %r8d
	movl      44(%rsp), %eax
	rorl      $25, %eax
	addl      %eax, %r8d
	movl      52(%rsp), %eax
	rorl      $19, %eax
	addl      %eax, %r8d
	movl      60(%rsp), %eax
	rorl      $16, %eax
	addl      %eax, %r8d
	addl      %r9d, %r8d
	movl      %r10d, %eax
	shrl      $2, %eax
	xorl      %r10d, %eax
	addl      %eax, %r8d
	movl      %r8d, 96(%rsp)
	movl      %r8d, %eax
	movl      428(%rsp), %edi
	movl      %r10d, %ecx
	sall      $5, %eax
	movl      %edi, %edx
	addl      100(%rsp), %edx
	movl      %eax, 320(%rsp)
	movdqu    76(%rsp), %xmm2
	rorl      $5, %ecx
	addl      %r12d, %edx
	movl      %r10d, %r12d
	movdqa    %xmm2, %xmm0
	addl      %ebx, %edx
	psrld     $29, %xmm0
	xorl      %r11d, %r12d
	movl      40(%rsp), %eax
	xorl      %r8d, %r12d
	movdqa    %xmm2, %xmm1
	rorl      $29, %eax
	addl      %eax, %edx
	movl      48(%rsp), %eax
	rorl      $25, %eax
	addl      %eax, %edx
	movl      56(%rsp), %eax
	rorl      $19, %eax
	addl      %eax, %edx
	movl      64(%rsp), %eax
	rorl      $16, %eax
	addl      %eax, %edx
	movl      %r11d, %eax
	rorl      $5, %eax
	addl      %eax, %edx
	movl      %r10d, %eax
	shrl      %eax
	xorl      %r10d, %eax
	addl      %eax, %edx
	movl      %r8d, %eax
	pslld     $3, %xmm1
	shrl      $2, %eax
	por       %xmm1, %xmm0
	paddd     %xmm0, %xmm8
	xorl      %r8d, %eax
	addl      %eax, %edx
	movl      %edx, 100(%rsp)
	movl      %edx, %eax
	sall      $5, %eax
	movl      %eax, 324(%rsp)
	leal      (%r14,%r11), %eax
	movl      %eax, %esi
	subl      32(%rsp), %esi
	movdqu    84(%rsp), %xmm6
	movdqa    %xmm6, %xmm3
	movdqa    %xmm6, %xmm0
	psrld     $25, %xmm0
	movdqa    %xmm6, %xmm1
	pslld     $16, %xmm3
	movl      %r8d, %eax
	pslld     $7, %xmm1
	xorl      %edx, %r12d
	por       %xmm1, %xmm0
	paddd     %xmm0, %xmm8
	movdqa    %xmm6, %xmm1
	movdqa    %xmm6, %xmm0
	movdqa    %xmm8, 136(%rsp)
	shrl      %eax
	psrld     $9, %xmm0
	pslld     $23, %xmm1
	por       %xmm1, %xmm0
	paddd     %xmm0, %xmm4
	movdqa    %xmm2, %xmm0
	psrld     $13, %xmm0
	movdqa    %xmm2, %xmm1
	pslld     $19, %xmm1
	por       %xmm1, %xmm0
	paddd     %xmm0, %xmm4
	movdqa    %xmm4, 104(%rsp)
	movdqa    %xmm2, %xmm0
	psrld     $19, %xmm0
	pslld     $13, %xmm2
	movl      %edx, %r11d
	movl      %r8d, %r9d
	rorl      $13, %r11d
	movl      %esi, %r15d
	rorl      $13, %r9d
	por       %xmm2, %xmm0
	paddd     %xmm0, %xmm5
	addl      104(%rsp), %r15d
	addl      %ecx, %r15d
	xorl      %r8d, %eax
	addl      %eax, %r15d
	movdqa    %xmm6, %xmm0
	movl      %edx, %eax
	psrld     $16, %xmm0
	shrl      $2, %eax
	por       %xmm3, %xmm0
	xorl      %edx, %eax
	paddd     %xmm0, %xmm5
	addl      %eax, %r15d
	movdqa    %xmm5, 120(%rsp)
	xorl      %r15d, %r12d
	addl      124(%rsp), %r9d
	movl      %r15d, 104(%rsp)
	movl      %r15d, 328(%rsp)
	movl      %edi, %eax
	subl      36(%rsp), %eax
	leal      (%rax,%r10), %ecx
	movl      %ecx, %r13d
	addl      108(%rsp), %r13d
	movl      %r8d, %eax
	rorl      $5, %eax
	addl      %eax, %r13d
	movl      %edx, %eax
	shrl      %eax
	xorl      %edx, %eax
	addl      %eax, %r13d
	movl      %r15d, %eax
	shrl      $2, %eax
	xorl      %r15d, %eax
	addl      %eax, %r13d
	movl      %r13d, 108(%rsp)
	movl      %r13d, %eax
	addl      128(%rsp), %r11d
	shrl      $6, %eax
	movl      %eax, 332(%rsp)
	movl      %esi, %eax
	subl      40(%rsp), %eax
	leal      (%rax,%r8), %esi
	movl      %esi, %r14d
	rorl      $19, %r8d
	xorl      %r13d, %r12d
	addl      112(%rsp), %r14d
	addl      140(%rsp), %r8d
	movl      %edx, %eax
	rorl      $5, %eax
	addl      %eax, %r14d
	movl      %r15d, %eax
	shrl      %eax
	xorl      %r15d, %eax
	addl      %eax, %r14d
	movl      %r13d, %eax
	shrl      $2, %eax
	xorl      %r13d, %eax
	addl      %eax, %r14d
	movl      %r14d, 112(%rsp)
	movl      %r14d, %eax
	sall      $6, %eax
	xorl      %r14d, %r12d
	movl      %eax, 336(%rsp)
	movl      %ecx, %eax
	subl      44(%rsp), %eax
	leal      (%rax,%rdx), %edi
	movl      %r15d, %eax
	movl      %edi, %ebx
	rorl      $5, %eax
	addl      116(%rsp), %ebx
	addl      %eax, %ebx
	movl      %r13d, %eax
	shrl      %eax
	xorl      %r13d, %eax
	addl      %eax, %ebx
	movl      %r14d, %eax
	shrl      $2, %eax
	xorl      %r14d, %eax
	addl      %eax, %ebx
	movl      %ebx, 116(%rsp)
	xorl      %ebx, %r12d
	leal      0(,%rbx,4), %eax
	movl      %eax, 340(%rsp)
	movl      %esi, %eax
	movl      %r10d, %esi
	rorl      $13, %esi
	subl      48(%rsp), %eax
	addl      120(%rsp), %esi
	leal      (%rax,%r15), %ecx
	mov       %r12d, %eax
	movq      %rax, %xmm0
	movl      %r12d, %eax
	sall      $4, %eax
	pshufd    $0, %xmm0, %xmm0
	movl      %eax, 388(%rsp)
	movl      %r12d, %eax
	sall      $6, %eax
	movl      %eax, 384(%rsp)
	movl      %r12d, %eax
	sall      $8, %eax
	movl      %eax, 376(%rsp)
	movl      %r12d, %eax
	shrl      $2, %eax
	movl      %eax, 404(%rsp)
	movl      %r12d, %eax
	shrl      $3, %eax
	movl      %eax, 392(%rsp)
	movl      %r12d, %eax
	shrl      $4, %eax
	movl      %eax, 396(%rsp)
	movl      %r12d, %eax
	shrl      $6, %eax
	movl      %eax, 380(%rsp)
	movl      %r12d, %eax
	shrl      $7, %eax
	movl      %eax, 400(%rsp)
	movl      %edx, %eax
	rorl      $9, %eax
	addl      %eax, %esi
	addl      %ecx, %esi
	movl      %r13d, %eax
	rorl      $5, %eax
	addl      %eax, %esi
	movl      %r14d, %eax
	shrl      %eax
	xorl      %r14d, %eax
	addl      %eax, %esi
	movl      %ebx, %eax
	rorl      $19, %r10d
	shrl      $2, %eax
	xorl      %ebx, %eax
	addl      %eax, %esi
	movl      %esi, 120(%rsp)
	movl      %edi, %eax
	subl      52(%rsp), %eax
	leal      (%rax,%r13), %edi
	movl      %r15d, %eax
	rorl      $9, %eax
	addl      %eax, %r9d
	addl      %edi, %r9d
	movl      %r14d, %eax
	rorl      $5, %eax
	addl      %eax, %r9d
	movl      %ebx, %eax
	shrl      %eax
	xorl      %ebx, %eax
	addl      %eax, %r9d
	movl      %esi, %eax
	shrl      $2, %eax
	xorl      %esi, %eax
	addl      %eax, %r9d
	movl      %r9d, 124(%rsp)
	movl      %ecx, %eax
	subl      56(%rsp), %eax
	leal      (%rax,%r14), %ecx
	movl      %r13d, %eax
	rorl      $9, %eax
	addl      %eax, %r11d
	addl      136(%rsp), %r10d
	addl      %ecx, %r11d
	movl      %ebx, %eax
	rorl      $5, %eax
	addl      %eax, %r11d
	movl      %esi, %eax
	shrl      %eax
	xorl      %esi, %eax
	addl      %eax, %r11d
	movl      %r9d, %eax
	shrl      $2, %eax
	xorl      %r9d, %eax
	addl      %eax, %r11d
	movl      %r11d, 128(%rsp)
	movl      %edi, %eax
	subl      60(%rsp), %eax
	addl      %ebx, %eax
	movl      %eax, 12(%rsp)
	movl      %r14d, %eax
	movl      %r15d, %edi
	rorl      $13, %edi
	addl      132(%rsp), %edi
	rorl      $9, %eax
	addl      %eax, %edi
	addl      12(%rsp), %edi
	movl      %esi, %eax
	rorl      $5, %eax
	addl      %eax, %edi
	movl      %r9d, %eax
	shrl      %eax
	xorl      %r9d, %eax
	addl      %eax, %edi
	movl      %r11d, %eax
	shrl      $2, %eax
	xorl      %r11d, %eax
	addl      %eax, %edi
	movl      %edi, 132(%rsp)
	movl      %ecx, %eax
	subl      64(%rsp), %eax
	addl      %esi, %eax
	movl      %eax, 16(%rsp)
	movl      %edx, %eax
	rorl      $16, %eax
	addl      %eax, %r10d
	movl      %r13d, %eax
	rorl      $13, %eax
	addl      %eax, %r10d
	movl      %ebx, %eax
	rorl      $9, %eax
	addl      %eax, %r10d
	addl      16(%rsp), %r10d
	movl      %r9d, %eax
	rorl      $5, %eax
	addl      %eax, %r10d
	movl      %r11d, %eax
	shrl      %eax
	xorl      %r11d, %eax
	addl      %eax, %r10d
	movl      %edi, %eax
	shrl      $2, %eax
	xorl      %edi, %eax
	addl      %eax, %r10d
	movl      %r10d, 136(%rsp)
	movl      12(%rsp), %eax
	rorl      $16, %r13d
	rorl      $13, %ebx
	subl      68(%rsp), %eax
	rorl      $19, %edx
	movl      144(%rsp), %ecx
	addl      %r9d, %eax
	movl      %eax, 20(%rsp)
	movl      %r15d, %eax
	rorl      $16, %eax
	addl      %eax, %r8d
	movl      %r14d, %eax
	rorl      $13, %eax
	movdqa    120(%rsp), %xmm1
	pxor      %xmm0, %xmm13
	addl      %eax, %r8d
	pxor      %xmm1, %xmm13
	pxor      32(%rbp), %xmm1
	movl      %esi, %eax
	rorl      $19, %r15d
	rorl      $9, %eax
	subl      72(%rsp), %ecx
	rorl      $16, %r14d
	addl      %edx, %ecx
	addl      %eax, %r8d
	addl      %r13d, %ecx
	movl      %r11d, %eax
	addl      20(%rsp), %r8d
	movl      148(%rsp), %edx
	subl      76(%rsp), %edx
	rorl      $5, %eax
	addl      %ebx, %ecx
	addl      %r15d, %edx
	addl      %eax, %r8d
	addl      %r14d, %edx
	addl      16(%rsp), %ecx
	movl      %edi, %eax
	shrl      %eax
	xorl      %edi, %eax
	addl      %eax, %r8d
	movl      %r10d, %eax
	shrl      $2, %eax
	xorl      %r10d, %eax
	addl      %eax, %r8d
	movl      %r9d, %eax
	movl      %r8d, 140(%rsp)
	rorl      $9, %eax
	addl      %eax, %ecx
	addl      %r11d, %ecx
	movl      %edi, %eax
	rorl      $5, %eax
	addl      %eax, %ecx
	movl      %r10d, %eax
	shrl      %eax
	xorl      %r10d, %eax
	addl      %eax, %ecx
	movl      %r8d, %eax
	shrl      $2, %eax
	xorl      %r8d, %eax
	addl      %eax, %ecx
	movl      %ecx, 144(%rsp)
	movl      %esi, %eax
	xorl      %r12d, %esi
	xorl      %r9d, %esi
	rorl      $13, %eax
	xorl      %r11d, %esi
	addl      %eax, %edx
	addl      20(%rsp), %edx
	movl      %r11d, %eax
	rorl      $9, %eax
	addl      %eax, %edx
	addl      %edi, %edx
	movl      %r10d, %eax
	rorl      $5, %eax
	xorl      %edi, %esi
	pxor      %xmm0, %xmm14
	xorl      %r10d, %esi
	xorl      %r8d, %esi
	addl      %eax, %edx
	movl      %r8d, %eax
	shrl      %eax
	xorl      %r8d, %eax
	addl      %eax, %edx
	movl      %ecx, %eax
	shrl      $2, %eax
	xorl      %ecx, %eax
	xorl      %ecx, %esi
	addl      %eax, %edx
	movl      %edx, 148(%rsp)
	xorl      %edx, %esi
	mov       %esi, %eax
	leaq      312(%rsp), %rdx              #
	movq      %rax, %xmm3
	movq      %rax, 408(%rsp)
	movl      %esi, %eax
	pshufd    $0, %xmm3, %xmm3
	sall      $5, %eax
	movl      %eax, 344(%rsp)
	movl      %esi, %eax
	sall      $6, %eax
	movl      %eax, 364(%rsp)
	movl      %esi, %eax
	shrl      %eax
	movl      %eax, 356(%rsp)
	movl      %esi, %eax
	shrl      $3, %eax
	movl      %eax, 360(%rsp)
	movl      %esi, %eax
	shrl      $4, %eax
	movl      %eax, 368(%rsp)
	movl      %esi, %eax
	shrl      $5, %eax
	movl      %eax, 352(%rsp)
	movl      %esi, %eax
	shrl      $7, %eax
	movl      %eax, 348(%rsp)
	movdqa    136(%rsp), %xmm2
	shrl      $11, %esi
	movl      %esi, 372(%rsp)
	pxor      %xmm2, %xmm14
	movdqa    312(%rsp), %xmm0
	pxor      (%rbp), %xmm0
	pxor      344(%rsp), %xmm0
	paddd     %xmm13, %xmm0
	movdqa    %xmm0, 232(%rsp)
	movdqa    %xmm0, 296(%rsp)
	movdqa    328(%rsp), %xmm0
	pxor      16(%rbp), %xmm0
	pxor      360(%rsp), %xmm0
	paddd     %xmm14, %xmm0
	movdqa    %xmm0, 248(%rsp)
	movss     116(%rsp), %xmm0
	movss     %xmm0, %xmm6
	pxor      %xmm3, %xmm1
	pxor      48(%rbp), %xmm2
	movdqu    100(%rsp), %xmm0
	pxor      %xmm0, %xmm10
	pxor      80(%rdx), %xmm10
	pxor      %xmm6, %xmm11
	pxor      %xmm3, %xmm2
	pxor      64(%rdx), %xmm11
	paddd     %xmm2, %xmm10
	paddd     %xmm1, %xmm11
	movdqa    %xmm11, 264(%rsp)
	movdqa    %xmm10, 280(%rsp)
	movl      248(%rsp), %eax
	rorl      $23, %eax
	addl      %eax, 264(%rsp)
	movl      252(%rsp), %eax
	rorl      $22, %eax
	addl      %eax, 268(%rsp)
	movl      256(%rsp), %eax
	rorl      $21, %eax
	addl      %eax, 272(%rsp)
	movl      260(%rsp), %eax
	rorl      $20, %eax
	addl      %eax, 276(%rsp)
	movl      232(%rsp), %eax
	rorl      $19, %eax
	addl      %eax, 280(%rsp)
	movl      236(%rsp), %eax
	rorl      $18, %eax
	addl      %eax, 284(%rsp)
	movl      240(%rsp), %eax
	rorl      $17, %eax
	addl      %eax, 288(%rsp)
	movl      244(%rsp), %eax
	rorl      $16, %eax
	addl      %eax, 292(%rsp)
	addq      $64, %rbp
	cmpq      -96(%rsp), %rbp
	jb        .L2
	movq      -88(%rsp), %rax
	movdqa    232(%rsp), %xmm0
	movdqa    %xmm0, (%rax)
	movdqa    248(%rsp), %xmm0
	movdqa    %xmm0, 16(%rax)
	movdqa    264(%rsp), %xmm0
	movdqa    %xmm0, 32(%rax)
	movdqa    280(%rsp), %xmm0
	movdqa    %xmm0, 48(%rax)
	addq      $448, %rsp
	popq      %rbx
	popq      %rbp
	popq      %r12
	popq      %r13
	popq      %r14
	popq      %r15
	ret
.LFE540:
	.size     Compress256, .-Compress256
	.globl    consts256
	.section  .rodata
	.align    128
	.type     consts256, @object
	.size     consts256, 64
	consts256:
	.long     1431655760
	.long     1521134245
	.long     1610612730
	.long     1700091215
	.long     1789569700
	.long     1879048185
	.long     1968526670
	.long     2058005155
	.long     2147483640
	.long     -2058005171
	.long     -1968526686
	.long     -1879048201
	.long     -1789569716
	.long     -1700091231
	.long     -1610612746
	.long     -1521134261
	.globl    negate256
	.align    128
	.type     negate256, @object
	.size     negate256, 112
	negate256:
	.long     -1
	.long     -1
	.long     1
	.long     -1
	.long     1
	.long     -1
	.long     1
	.long     -1
	.long     1
	.long     1
	.long     -1
	.long     -1
	.long     1
	.long     -1
	.long     -1
	.long     -1
	.long     1
	.long     1
	.long     1
	.long     -1
	.long     -1
	.long     1
	.long     -1
	.long     -1
	.long     -1
	.long     1
	.long     1
	.long     -1
	.section  .rodata.cst16,"aM",@progbits,16
	.align    16
.LC4:
	.long     -1
	.long     0
	.long     0
	.long     0
	.align    16
.LC7:
	.long     0
	.long     -1
	.long     0
	.long     -1
	.align    16
.LC8:
	.long     0
	.long     0
	.long     0
	.long     -1
	.align    16
.LC9:
	.long     0
	.long     -1
	.long     -1
	.long     0
	.align    16
.LC10:
	.long     -1
	.long     -1
	.long     0
	.long     -1
	.align    16
.LC12:
	.long     0
	.long     0
	.long     0
	.long     1
	.align    16
.LC13:
	.long     2
	.long     1
	.long     0
	.long     1
	.align    16
.LC14:
	.long     2
	.long     1
	.long     -1
	.long     2
	.align    16
.LC15:
	.quad     6533221836532307280
	.quad     7301836170252517370
	.align    16
.LC16:
	.quad     8070450503972727460
	.quad     8839064837692937550
	.align    16
.LC17:
	.quad     -8839064902296403976
	.quad     -8070450568576193886
	.align    16
.LC18:
	.quad     -7301836234855983796
	.quad     -6533221901135773706
	.align    16
.LC20:
	.quad     -1
	.quad     0
	.align    16
.LC21:
	.quad     -4294967296
	.quad     0
	.align    16
.LC22:
	.quad     -4294967295
	.quad     -4294967296
	.section  .eh_frame,"a",@progbits
.Lframe1:
	.long     .LECIE1-.LSCIE1
.LSCIE1:
	.long     0x0
	.byte     0x1
	.string   "zR"
	.uleb128  0x1
	.sleb128  -8
	.byte     0x10
	.uleb128  0x1
	.byte     0x3
	.byte     0xc
	.uleb128  0x7
	.uleb128  0x8
	.byte     0x90
	.uleb128  0x1
	.align    8
.LECIE1:
.LSFDE1:
	.long     .LEFDE1-.LASFDE1
.LASFDE1:
	.long     .LASFDE1-.Lframe1
	.long     .LFB540
	.long     .LFE540-.LFB540
	.uleb128  0x0
	.byte     0x4
	.long     .LCFI0-.LFB540
	.byte     0xe
	.uleb128  0x10
	.byte     0x4
	.long     .LCFI1-.LCFI0
	.byte     0xe
	.uleb128  0x18
	.byte     0x4
	.long     .LCFI2-.LCFI1
	.byte     0xe
	.uleb128  0x20
	.byte     0x4
	.long     .LCFI3-.LCFI2
	.byte     0xe
	.uleb128  0x28
	.byte     0x4
	.long     .LCFI4-.LCFI3
	.byte     0xe
	.uleb128  0x30
	.byte     0x4
	.long     .LCFI5-.LCFI4
	.byte     0xe
	.uleb128  0x38
	.byte     0x4
	.long     .LCFI6-.LCFI5
	.byte     0xe
	.uleb128  0x1f8
	.byte     0x83
	.uleb128  0x7
	.byte     0x86
	.uleb128  0x6
	.byte     0x8c
	.uleb128  0x5
	.byte     0x8d
	.uleb128  0x4
	.byte     0x8e
	.uleb128  0x3
	.byte     0x8f
	.uleb128  0x2
	.align    8
.LEFDE1:
	.ident    "GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section  .note.GNU-stack,"",@progbits
