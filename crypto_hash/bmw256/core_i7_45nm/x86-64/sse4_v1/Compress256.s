	.file     "Compress256_sse_29_v3.c"
	.text
	.globl    Compress256
# MAC support added by commenting out/changing error generating directives.

	.globl    _Compress256
#	.type     Compress256, @function
#	.align    16
	.p2align   4
	Compress256:
_Compress256:
#.LFB584:
	pushq     %r15
#.LCFI0:
	pushq     %r14
#.LCFI1:
	pushq     %r13
#.LCFI2:
	pushq     %r12
#.LCFI3:
	pushq     %rbp
#.LCFI4:
	pushq     %rbx
#.LCFI5:
	subq      $144, %rsp                   # uses stack space in the region of -144 to 139
#.LCFI6:
	movq      %rdi, %rbp
	leaq      16(%rdx), %rbx
	movq      %rsi, -144(%rsp)             # data_end pointer
	movdqa    32(%rbx), %xmm1              # p256_1215
	movdqa    16(%rbx), %xmm2              # p256_0407
	movq      %rbx, -136(%rsp)             # hashState pointer
	movdqa    (%rbx), %xmm4                # p256_0003
	movdqa    %xmm4, -88(%rsp)             # 312(%rsp -> -88(%rsp)
	movdqa    48(%rbx), %xmm0              # p256_0811
	movdqa    %xmm2, -104(%rsp)
#	.align    16
	.p2align   4
.L2:
	pxor      (%rbp), %xmm4
	pxor      16(%rbp), %xmm2
	movdqa    %xmm1, -120(%rsp)            # p256_0811
	movdqa    %xmm0, %xmm15
	movdqa    .LC20(%rip), %xmm13
	pxor      32(%rbp), %xmm1
	pxor      48(%rbp), %xmm0
	movdqa    %xmm2, %xmm10
	palignr   $4, %xmm4, %xmm10
	movdqa    %xmm1, %xmm12
	movdqa    %xmm0, %xmm11
	palignr   $4, %xmm2, %xmm12
	palignr   $4, %xmm1, %xmm11
	movdqa    %xmm11, %xmm5
	movdqa    .LC16(%rip), %xmm3
	palignr   $8, %xmm12, %xmm5
	movdqa    %xmm4, %xmm8
	palignr   $4, %xmm0, %xmm8
	movl      (%rbp), %eax
	movl      4(%rbp), %ebx
	rorl      $31, %eax
	movl      8(%rbp), %ecx
	movl      %eax, -72(%rsp)              # td32_00  (-72(%rsp) - -12(%rsp))
	rorl      $30, %ebx
	movl      %ebx, -68(%rsp)
	rorl      $29, %ecx
	movl      %ecx, -64(%rsp)
	movl      12(%rbp), %edx
	rorl      $28, %edx
	movl      %edx, -60(%rsp)
	movdqa    %xmm1, %xmm14
	palignr   $8, %xmm2, %xmm14
	palignr   $8, %xmm4, %xmm2
	palignr   $8, %xmm0, %xmm4
	palignr   $8, %xmm1, %xmm0
	movl      16(%rbp), %esi
	rorl      $27, %esi
	movdqa    %xmm10, %xmm1
	psignd    %xmm3, %xmm5
	psignd    .LC17(%rip), %xmm4
	psignd    %xmm3, %xmm0                 # last xmm3
	palignr   $8, %xmm8, %xmm1
	movl      %esi, -56(%rsp)
	movl      20(%rbp), %edi
	rorl      $26, %edi
	movdqa    %xmm12, %xmm6
	movl      %edi, -52(%rsp)
	palignr   $8, %xmm10, %xmm6
	movl      24(%rbp), %eax
	movdqa    %xmm8, %xmm7
	palignr   $8, %xmm11, %xmm7
	psignd    .LC21(%rip), %xmm1
	rorl      $25, %eax
	movl      28(%rbp), %ebx
	movl      %eax, -48(%rsp)
	rorl      $24, %ebx
	movl      %ebx, -44(%rsp)
	psignd    .LC18(%rip), %xmm6
	psignd    %xmm3, %xmm7
	psubd     %xmm0, %xmm5
	psubd     %xmm0, %xmm6                 # last xmm0
	psignd    .LC18(%rip), %xmm11
	movl      40(%rbp), %esi
	movl      48(%rbp), %eax
	movdqa    .LC19(%rip), %xmm3
	movl      32(%rbp), %ecx
	rorl      $23, %ecx
	rorl      $19, %eax
	psignd    .LC22(%rip), %xmm14
	paddd     %xmm12, %xmm5
	movl      %ecx, -40(%rsp)
	paddd     %xmm8, %xmm5
	movl      36(%rbp), %edx
	rorl      $22, %edx
	movl      %edx, -36(%rsp)
	psignd    %xmm13, %xmm8
	paddd     %xmm4, %xmm5
	psignd    .LC17(%rip), %xmm12
	rorl      $21, %esi
	movl      44(%rbp), %edi
	movl      %esi, -32(%rsp)
	rorl      $20, %edi
	psubd     %xmm12, %xmm1                # last xmm12
	movdqa    %xmm10, %xmm0
	movl      %edi, -28(%rsp)
	paddd     %xmm11, %xmm7
	psignd    %xmm3, %xmm0                 # TODO: replace sign data, remove the movdqa
	psubd     %xmm4, %xmm7
	paddd     %xmm0, %xmm7
	movdqa    %xmm2, %xmm0
	psignd    %xmm3, %xmm2
	paddd     %xmm2, %xmm1                 # TODO: replace sign data, remove the movdqa # last xmm2
	psignd    %xmm13, %xmm0
	paddd     %xmm0, %xmm7
	paddd     %xmm8, %xmm1                 # last usage xmm8
	paddd     %xmm14, %xmm6
	psignd    .LC23(%rip), %xmm14          # Done: replace sign data, remove the movdqa
	psubd     %xmm14, %xmm1                # last xmm14
	psignd    %xmm13, %xmm10               # TODO: replace sign data, remove the movdqa
	paddd     %xmm10, %xmm6                # last xmm10
	movdqa    %xmm5, %xmm8
	psignd    .LC24(%rip), %xmm11
	psubd     %xmm11, %xmm6
	movdqa    %xmm5, %xmm3
	shufps    $206, %xmm7, %xmm3
	movdqa    %xmm1, %xmm4
	shufps    $206, %xmm6, %xmm4
	shufps    $148, %xmm7, %xmm8
	movdqa    %xmm8, %xmm0
	shufps    $200, %xmm4, %xmm0
	movdqa    %xmm0, %xmm14
	psrld     $1, %xmm0
	pslld     $3, %xmm14
	shufps    $172, %xmm4, %xmm3           # last xmm4
	shufps    $253, %xmm1, %xmm8
	shufps    $148, %xmm6, %xmm1           # last xmm6
	shufps    $143, %xmm1, %xmm5
	shufps    $208, %xmm1, %xmm7           # last xmm1
	movdqa    %xmm7, %xmm11
	psrld     $1, %xmm7
	pxor      %xmm11, %xmm7                # last xmm11
	movdqa    %xmm14, %xmm10
	pxor      %xmm0, %xmm10
	pslld     $1, %xmm14
	pxor      %xmm14, %xmm10
	pslld     $15, %xmm14
	psrld     $12, %xmm0
	movdqa    -88(%rsp), %xmm11
	pxor      %xmm0, %xmm10
	pxor      %xmm14, %xmm10               # last xmm14
	movdqa    %xmm3, %xmm4
	movl      56(%rbp), %ecx
	psrld     $15, %xmm0
	pxor      %xmm0, %xmm10
	movdqa    %xmm8, %xmm9
	movl      52(%rbp), %ebx
	pslld     $2, %xmm9
	movdqa    %xmm9, %xmm6
	psrld     $1, %xmm8
	pxor      %xmm8, %xmm6
	movl      %eax, -24(%rsp)
	pslld     $6, %xmm9
	pxor      %xmm9, %xmm6
	psrld     $8, %xmm8
	pxor      %xmm8, %xmm6
	pslld     $15, %xmm9
	pxor      %xmm9, %xmm6                 # last xmm9
	psrld     $15, %xmm8
	rorl      $17, %ecx
	rorl      $18, %ebx
	pxor      %xmm8, %xmm6                 # last xmm8
	movl      %ebx, -20(%rsp)
	movl      %ecx, -16(%rsp)
	movl      60(%rbp), %edx
	rorl      $16, %edx
	movl      %edx, -12(%rsp)
	pslld     $1, %xmm4
	movdqa    %xmm4, %xmm2
	psrld     $2, %xmm3
	pslld     $11, %xmm4
	pxor      %xmm3, %xmm2
	pxor      %xmm4, %xmm2
	psrld     $5, %xmm3
	pslld     $13, %xmm4
	pxor      %xmm3, %xmm2
	psrld     $13, %xmm3
	pxor      %xmm4, %xmm2                 # last xmm4
	pxor      %xmm3, %xmm2                 # last xmm3
	movdqa    %xmm5, %xmm0
	pslld     $2, %xmm0
	psrld     $2, %xmm5
	movdqa    %xmm0, %xmm1
	pxor      %xmm5, %xmm1
	pslld     $13, %xmm0
	pxor      %xmm0, %xmm1
	psrld     $1, %xmm5
	pxor      %xmm5, %xmm1
	pslld     $14, %xmm0
	pxor      %xmm0, %xmm1                 # last xmm0
	psrld     $14, %xmm5
	pxor      %xmm5, %xmm1                 # last xmm5
	movdqa    %xmm6, %xmm8
	movdqa    %xmm2, %xmm3
	shufps    $197, %xmm7, %xmm3
	shufps    $239, %xmm10, %xmm6
	shufps    $204, %xmm1, %xmm2           # last xmm1
	movdqa    %xmm1, %xmm12
	shufps    $238, %xmm7, %xmm12
	shufps    $255, %xmm10, %xmm7
	movlhps   %xmm8, %xmm10                # last xmm8
	movdqa    %xmm10, %xmm1
	shufps    $136, %xmm2, %xmm1
	shufps    $40, %xmm6, %xmm12           # last xmm6
	movdqa    -104(%rsp), %xmm0
	shufps    $210, %xmm10, %xmm3          # last xmm10
	shufps    $120, %xmm3, %xmm3
	palignr   $4, -88(%rsp), %xmm0
	shufps    $141, %xmm7, %xmm2           # last xmm7
	palignr   $4, %xmm15, %xmm11
	movdqa    %xmm15, %xmm5
	palignr   $4, -120(%rsp), %xmm5
	movdqa    -120(%rsp), %xmm4
	palignr   $4, -104(%rsp), %xmm4
	paddd     %xmm5, %xmm12                # last xmm5
	paddd     %xmm0, %xmm1                 # last xmm0
	paddd     %xmm4, %xmm3                 # last xmm4
	movdqa    %xmm1, %xmm14
	movdqa    %xmm12, 24(%rsp)
	pxor      %xmm9, %xmm9
	punpckhqdq    %xmm1, %xmm9
	movdqa    %xmm3, %xmm13
	movdqa    %xmm3, 8(%rsp)
	movdqa    %xmm1, -8(%rsp)              # exp[00] - exp[03], exp[ 0] - exp[31] lays in -8 - 40
	paddd     %xmm2, %xmm11                # last xmm2
	movdqa    %xmm11, 40(%rsp)
	paddd     %xmm3, %xmm9
	paddd     %xmm12, %xmm9
	movl      12(%rsp), %r14d
	movl      8(%rsp), %r15d
	movl      24(%rsp), %ecx
	movl      28(%rsp), %r9d
	rorl      $16, %r9d
	paddd     %xmm11, %xmm9
	pshufd    $120, %xmm9, %xmm9
	phaddd    %xmm9, %xmm9
	movq      %xmm9, -128(%rsp)            # evenodd ,last xmm9,
	punpcklqdq    %xmm3, %xmm1
	movdqa    %xmm1, %xmm8
	pslld     $2, %xmm8
	movl      40(%rsp), %r12d
	movl      16(%rsp), %ebx
	movl      44(%rsp), %r8d
	rorl      $9, %r8d
	movdqa    %xmm12, %xmm5
	psrld     $1, %xmm1
	movl      32(%rsp), %edx
	punpcklqdq    %xmm11, %xmm5
	movdqa    %xmm8, %xmm4
	pxor      %xmm1, %xmm4
	rorl      $13, %r12d
	pslld     $6, %xmm8
	rorl      $25, %ebx
	movdqa    %xmm12, %xmm9
	movl      52(%rsp), %esi
	movdqa    %xmm14, %xmm6
	movdqa    %xmm5, %xmm10
	pxor      %xmm8, %xmm4
	psrld     $8, %xmm1
	pxor      %xmm1, %xmm4
	pslld     $15, %xmm8
	pxor      %xmm8, %xmm4                 # last xmm8
	psrld     $15, %xmm1
	pxor      %xmm1, %xmm4                 # last xmm1
	psrld     $1, %xmm5
	rorl      $19, %ecx
	punpckhqdq    %xmm3, %xmm6
	movdqa    %xmm12, %xmm8
	movdqa    %xmm6, %xmm7
	pslld     $2, %xmm7
	psrld     $2, %xmm6
	movdqa    %xmm7, %xmm0
	pslld     $13, %xmm7
	pxor      %xmm6, %xmm0
	pxor      %xmm7, %xmm0
	psrld     $1, %xmm6
	pslld     $14, %xmm7
	rorl      $16, %edx
	pxor      %xmm6, %xmm0
	psrld     $14, %xmm6
	rorl      $29, %r15d
	pxor      %xmm7, %xmm0                 # last xmm7
	punpckhqdq    %xmm11, %xmm8
	movdqa    %xmm8, %xmm1
	pxor      %xmm6, %xmm0                 # last xmm6
	addl      %ebx, %r15d
	psrld     $2, %xmm8
	paddd     %xmm0, %xmm4                 # last xmm0
	addl      %ecx, %r15d
	addl      %edx, %r15d
	pslld     $2, %xmm10
	movdqa    %xmm10, %xmm2
	pslld     $6, %xmm10
	pxor      %xmm5, %xmm2
	pxor      %xmm10, %xmm2
	psrld     $8, %xmm5
	pxor      %xmm5, %xmm2
	pslld     $15, %xmm10
	psrld     $15, %xmm5
	pxor      %xmm10, %xmm2                # last xmm10
	pxor      %xmm5, %xmm2                 # last xmm5
	pslld     $2, %xmm1
	paddd     %xmm2, %xmm4                 # last xmm2
	movdqa    %xmm1, %xmm7
	pslld     $13, %xmm1
	pxor      %xmm8, %xmm7
	pxor      %xmm1, %xmm7
	psrld     $1, %xmm8
	pxor      %xmm8, %xmm7
	pslld     $14, %xmm1
	pxor      %xmm1, %xmm7                 # last xmm1
	psrld     $14, %xmm8
	pxor      %xmm8, %xmm7                 # last xmm8
	paddd     %xmm7, %xmm4                 # last xmm7
	palignr   $4, %xmm3, %xmm9
	palignr   $4, %xmm14, %xmm3
	movdqa    %xmm3, %xmm0
	punpcklqdq    %xmm9, %xmm0
	movdqa    %xmm0, %xmm6
	movdqa    %xmm11, %xmm8
	pslld     $1, %xmm6
	palignr   $4, %xmm12, %xmm8
	punpckhqdq    %xmm9, %xmm3
	psrld     $2, %xmm0
	movdqa    %xmm6, %xmm10
	pxor      %xmm0, %xmm10
	pslld     $11, %xmm6
	pxor      %xmm6, %xmm10
	psrld     $5, %xmm0
	pxor      %xmm0, %xmm10
	pslld     $13, %xmm6
	pxor      %xmm6, %xmm10                # last xmm6
	psrld     $13, %xmm0
	movdqa    %xmm3, %xmm5
	pxor      %xmm0, %xmm10                # last xmm0
	paddd     %xmm10, %xmm4                # last xmm10
	pslld     $3, %xmm5
	psrld     $1, %xmm3
	movdqa    %xmm5, %xmm1
	pxor      %xmm3, %xmm1
	pslld     $1, %xmm5
	pxor      %xmm5, %xmm1
	movdqa    %xmm8, %xmm0
	pxor      %xmm10, %xmm10               # TODO: change register
	pslld     $15, %xmm5
	movdqa    %xmm8, %xmm7
	palignr   $4, %xmm11, %xmm10
	psrld     $12, %xmm3
	pxor      %xmm3, %xmm1
	punpckhqdq    %xmm10, %xmm0            # last xmm10
	psrld     $15, %xmm3
	pxor      %xmm5, %xmm1                 # last xmm5
	punpcklqdq    %xmm10, %xmm7
	pxor      %xmm3, %xmm1                 # last xmm3
	paddd     %xmm1, %xmm4                 # last xmm1
	movdqa    %xmm7, %xmm6
	pslld     $1, %xmm6
	psrld     $2, %xmm7
	movdqa    %xmm0, %xmm1
	movdqa    %xmm6, %xmm2
	movl      36(%rsp), %ecx
	movdqa    -56(%rsp), %xmm10
	pxor      %xmm7, %xmm2
	rorl      $13, %ecx
	psrld     $5, %xmm7
	pslld     $11, %xmm6
	pxor      %xmm6, %xmm2
	pslld     $13, %xmm6
	pxor      %xmm7, %xmm2
	pslld     $3, %xmm1
	psrld     $1, %xmm0
	pxor      %xmm6, %xmm2                 # last xmm6
	psrld     $13, %xmm7
	pxor      %xmm7, %xmm2                 # last xmm7
	paddd     %xmm2, %xmm4                 # last xmm2
	movdqa    %xmm1, %xmm5
	pxor      %xmm0, %xmm5
	pslld     $1, %xmm1
	pxor      %xmm2, %xmm2
	pxor      %xmm1, %xmm5
	psrld     $12, %xmm0
	pslld     $15, %xmm1
	pxor      %xmm0, %xmm5
	pxor      %xmm1, %xmm5                 # last xmm1
	psrld     $15, %xmm0
	pxor      %xmm0, %xmm5                 # last xmm0
	paddd     %xmm5, %xmm4                 # last xmm5
	pshufd    $120, %xmm4, %xmm4
	phaddd    %xmm2, %xmm4                 # last xmm2
	movdqa    -72(%rsp), %xmm7
	movdqa    -24(%rsp), %xmm1
	movdqa    -40(%rsp), %xmm5
	movdqa    %xmm7, %xmm0
	palignr   $12, %xmm1, %xmm0
	movdqa    %xmm10, %xmm3                # ok 3
	palignr   $12, %xmm7, %xmm3
	movdqa    %xmm5, %xmm6
	palignr   $12, %xmm10, %xmm6
	paddd     %xmm7, %xmm3
	paddd     %xmm1, %xmm0
	palignr   $12, %xmm5, %xmm1
	paddd     %xmm5, %xmm1
	paddd     .LC12(%rip), %xmm3
	palignr   $8, %xmm10, %xmm5
	paddd     .LC15(%rip), %xmm0
	paddd     %xmm10, %xmm6
	movl      48(%rsp), %ebx
	psubd     %xmm5, %xmm0
	movdqa    -104(%rsp), %xmm5
	movdqa    -88(%rsp), %xmm2
	palignr   $12, %xmm2, %xmm5
	pxor      %xmm0, %xmm5
	palignr   $8, %xmm7, %xmm10            # last xmm7
	paddd     .LC14(%rip), %xmm1
	psubd     %xmm10, %xmm1                # last xmm10
	palignr   $12, %xmm15, %xmm2
	pxor      %xmm1, %xmm2
	movdqa    %xmm8, %xmm7
	pslld     $3, %xmm7
	movdqa    %xmm8, %xmm0
	psrld     $29, %xmm0
	por       %xmm7, %xmm0
	paddd     %xmm0, %xmm2
	psrld     $19, %xmm8
	pslld     $10, %xmm7
	por       %xmm7, %xmm8
	movdqa    %xmm11, %xmm7
	palignr   $12, %xmm12, %xmm7
	movdqa    %xmm7, %xmm0
	movdqa    %xmm7, %xmm10
	psrld     $25, %xmm10
	pslld     $7, %xmm0
	por       %xmm0, %xmm10
	paddd     %xmm2, %xmm10
	movq      -32(%rsp), %xmm0
	punpcklqdq    -24(%rsp), %xmm0
	psubd     %xmm0, %xmm3
	movdqa    -120(%rsp), %xmm0
	palignr   $12, -104(%rsp), %xmm0
	paddd     .LC13(%rip), %xmm6
	pxor      %xmm3, %xmm0
	paddd     %xmm0, %xmm4
	movq      -16(%rsp), %xmm0
	movdqa    %xmm4, 56(%rsp)
	movl      56(%rsp), %edi
	punpcklqdq    -72(%rsp), %xmm0
	rorl      $5, %esi
	psubd     %xmm0, %xmm6
	leal      0(,%edi,8), %r10d
	palignr   $12, -120(%rsp), %xmm15
	pxor      %xmm6, %xmm15                # last xmm6
	paddd     %xmm8, %xmm15                # last xmm8
	movdqa    %xmm9, %xmm0
	psrld     $29, %xmm0
	pslld     $3, %xmm9
	por       %xmm9, %xmm0                 # last xmm10
	rorl      $9, %ebx
	movdqa    %xmm12, %xmm6
	movl      4(%rsp), %edx
	palignr   $12, %xmm13, %xmm6
	movl      %edi, %r11d
	paddd     %xmm0, %xmm15
	movdqa    %xmm6, %xmm1
	pslld     $7, %xmm6
	pshufb    .LC33(%rip), %xmm7
	psrld     $25, %xmm1
	shrl      %edi
	por       %xmm6, %xmm1
	xorl      %edi, %r10d
	paddd     %xmm1, %xmm15
	addl      %esi, %r8d
	paddd     %xmm7, %xmm15
	movl      -128(%rsp), %esi             # from xmm9
	addl      %esi, %r8d
	addl      %r11d, %esi
	movl      %r11d, %eax
	subl      (%rsp), %esi
	rorl      $13, %eax
	xorl      %eax, %r10d
	shrl      $5, %r11d
	movl      %r11d, -40(%rsp)             # reuse the stack space for td32[ 8] - td32[15] (-40 - -12)
	rorl      $15, %eax
	xorl      %eax, %r10d
	addl      60(%rsp), %r10d
	addl      64(%rsp), %r8d
	movl      %r10d, 60(%rsp)
	movl      %r10d, %eax
	addl      %ecx, %r8d
	sall      $8, %eax
	movl      %eax, -36(%rsp)
	rorl      $29, %edx
	addl      %edx, %r8d                   # last edx
	movl      20(%rsp), %r11d
	rorl      $25, %r14d
	addl      %r14d, %r8d                  # last r14
	movl      56(%rsp), %r14d
	rorl      $19, %r11d
	addl      %r11d, %r8d                  # last r11
	addl      %r9d, %r8d                   # last r9
	movl      %r10d, %eax
	xorl      56(%rsp), %edi
	shrl      $2, %eax
	addl      %edi, %r8d
	xorl      %r10d, %eax
	addl      %eax, %r8d
	movl      %r8d, %eax
	movl      -124(%rsp), %edi
	leal      0(%edi,%r12d), %edx
	movl      %r8d, 64(%rsp)
	sall      $5, %eax
	movl      %eax, -32(%rsp)
	addl      68(%rsp), %edx
	addl      %ebx, %edx
	addl      %r15d, %edx
	rorl      $5, %r14d
	addl      %r14d, %edx
	movl      %r10d, %eax
	shrl      %eax
	xorl      %r10d, %eax
	addl      %eax, %edx
	movl      %r8d, %eax
	shrl      $2, %eax
	xorl      %r8d, %eax
	movl      %r10d, %r12d
	rorl      $5, %r10d
	addl      %eax, %edx
	palignr   $4, %xmm11, %xmm4
	movl      %edx, 68(%rsp)
	movdqa    %xmm4, %xmm1
	leal      (%esi,%r10d), %r15d
	rorl      $8, %r10d
	pslld     $3, %xmm1
	movl      %edx, %eax
	sall      $5, %eax
	movdqa    %xmm4, %xmm7
	psrld     $29, %xmm7
	movl      %eax, -28(%rsp)              # last eax
	movdqa    56(%rsp), %xmm3
	por       %xmm1, %xmm7
	paddd     %xmm7, %xmm5
	movdqa    %xmm3, %xmm6
	palignr   $12, %xmm11, %xmm3
	movdqa    %xmm3, %xmm0
	movdqa    %xmm3, %xmm8
	pslld     $7, %xmm8
	psrld     $25, %xmm0
	por       %xmm8, %xmm0
	paddd     %xmm0, %xmm5
	movdqa    %xmm5, 120(%rsp)             # last xmm5, exp[28] - exp[31]
	movdqa    %xmm3, %xmm0
	psrld     $9, %xmm0
	pslld     $16, %xmm8                   # %xmm1 is already <<7
	por       %xmm8, %xmm0                 # last usage of %xmm2
	movdqa    %xmm4, %xmm5
	psrld     $13, %xmm5
	paddd     %xmm0, %xmm15
	pslld     $16, %xmm1
	por       %xmm1, %xmm5
	addl      %r8d, %esi
	paddd     %xmm5, %xmm15
	movdqa    %xmm15, 72(%rsp)
	subl      8(%rsp), %esi
	addl      72(%rsp), %r15d
	psrld     $6, %xmm5
	subl      4(%rsp), %edi
	movl      %esi, %r14d
	pshufb    .LC33(%rip), %xmm3
	addl      80(%rsp), %r14d
	subl      16(%rsp), %esi
	pslld     $13, %xmm4
	por       %xmm4, %xmm5
	paddd     %xmm10, %xmm5
	paddd     %xmm3, %xmm5
	movdqa    %xmm5, 104(%rsp)
	movl      %r8d, %eax
	shrl      %eax
	xorl      %r8d, %eax
	addl      %eax, %r15d
	movl      %edx, %eax
	shrl      $2, %eax
	xorl      %edx, %eax
	addl      %eax, %r15d
	movl      %r15d, 72(%rsp)
	addl      %r12d, %edi
	movl      %r15d, -24(%rsp)
	xorl      %r8d, %r12d
	xorl      %edx, %r12d
	movl      %edi, %r13d
	addl      76(%rsp), %r13d
	rorl      $5, %r8d
	addl      %r8d, %r13d
	movl      %edx, %eax
	shrl      %eax
	xorl      %edx, %eax
	addl      %eax, %r13d
	movl      %r15d, %eax
	shrl      $2, %eax
	xorl      %r15d, %eax
	addl      %eax, %r13d
	movl      %r13d, 76(%rsp)
	movl      %r13d, %eax
	shrl      $6, %eax
	subl      12(%rsp), %edi
	movl      %eax, -20(%rsp)
	addl      %edx, %edi
	rorl      $5, %edx
	addl      %edx, %r14d
	movl      %r15d, %eax
	shrl      %eax
	xorl      %r15d, %eax
	addl      %eax, %r14d
	movl      %r13d, %eax
	rorl      $8, %r8d
	leal      0(%esi,%r15d), %ecx          # last esi
	rorl      $4, %edx
	shrl      $2, %eax
	xorl      %r13d, %eax
	addl      %eax, %r14d
	movl      %edi, %ebx
	xorl      %r15d, %r12d
	movl      %r14d, 80(%rsp)
	rorl      $5, %r15d
	xorl      56(%rsp), %r12d              # r11d
	movl      %r14d, %eax
	sall      $6, %eax
	addl      84(%rsp), %ebx
	movl      %eax, -16(%rsp)
	movl      %r13d, %eax
	addl      %r15d, %ebx
	shrl      %eax
	xorl      %r13d, %eax
	addl      %eax, %ebx
	movl      %r14d, %eax
	shrl      $2, %eax
	xorl      %r14d, %eax
	addl      %eax, %ebx
	xorl      %r13d, %r12d
	xorl      %r14d, %r12d
	xorl      %ebx, %r12d
	movl      %ebx, 84(%rsp)
	rorl      $4, %r15d
	leal      0(,%ebx,4), %eax
	movdqa    72(%rsp), %xmm5
	movdqa    %xmm6, %xmm7
	movl      %eax, -12(%rsp)
	palignr   $12, %xmm5, %xmm7
	movl      %r12d, %esi
	movd      %esi, %xmm0
	subl      20(%rsp), %edi
	addl      %r13d, %edi
	sall      $4, %esi                     # change eax to esi
	pshufd    $0, %xmm0, %xmm0
	pxor      %xmm0, %xmm14
	pxor      %xmm0, %xmm13
	movl      %r14d, %eax
	movl      %esi, -60(%rsp)
	sall      $2, %esi
	shrl      %eax
	xorl      %r14d, %eax
	movl      %esi, -64(%rsp)
	sall      $2, %esi
	movl      %esi, -72(%rsp)              # reuse the stack space for td32[00] - td32[07] (-72 - -44)
	movl      %r12d, %esi
	shrl      $2, %esi
	rorl      $5, %r13d
	movl      %esi, -44(%rsp)
	shrl      $1, %esi
	leal      0(%r15d,%r8d), %r9d
	addl      108(%rsp), %r9d
	addl      %edi, %r9d
	movl      %esi, -56(%rsp)
	shrl      $1, %esi
	movl      %esi, -52(%rsp)
	shrl      $2, %esi
	movl      %esi, -68(%rsp)
	shrl      $1, %esi
	movl      %esi, -48(%rsp)
	leal      0(%edx,%r10d), %esi
	rorl      $6, %r10d
	addl      104(%rsp), %esi
	rorl      $6, %r8d
	addl      120(%rsp), %r10d
	addl      %ecx, %esi
	rorl      $4, %edx                     # carry the rotation of 9
	addl      %r13d, %esi
	addl      %eax, %esi
	rorl      $4, %r13d
	addl      124(%rsp), %r8d
	movl      %ebx, %eax
	shrl      $2, %eax
	xorl      %ebx, %eax
	leal      0(%r13d,%edx), %r11d
	rorl      $4, %r13d
	subl      28(%rsp), %edi
	subl      24(%rsp), %ecx
	addl      %eax, %esi
	addl      %ebx, %edi
	movl      %esi, 104(%rsp)
	movl      %edi, 92(%rsp)
	movl      %ebx, %eax
	addl      %r14d, %ecx
	xorl      %esi, %r12d                  # Inserted from below #  xorl	%r12d, %esi
	shrl      %eax
	rorl      $5, %r14d
	addl      %r14d, %r9d
	xorl      %ebx, %eax
	addl      %ecx, %r11d
	addl      %eax, %r9d
	movl      %esi, %eax
	subl      32(%rsp), %ecx
	addl      112(%rsp), %r11d
	shrl      $2, %eax
	addl      %esi, %ecx
	xorl      %esi, %eax
	rorl      $4, %r14d
	addl      %eax, %r9d
	movl      %esi, %eax
	rorl      $4, %r15d
	xorl      %r9d, %r12d                  # Inserted from below # xorl	%r9d, %esi
	movl      %r9d, 108(%rsp)
	rorl      $5, %ebx
	movl      %ecx, 96(%rsp)               # last ecx
	leal      0(%r14d,%r15d), %edi
	rorl      $3, %r15d
	addl      %ebx, %r11d
	shrl      %eax
	rorl      $3, %edx
	addl      %edx, %r10d
	movl      128(%rsp), %ecx
	rorl      $3, %edx
	addl      %r15d, %r8d
	xorl      %esi, %eax
	rorl      $5, %esi
	addl      116(%rsp), %edi
	addl      %eax, %r11d
	movl      %r9d, %eax
	addl      92(%rsp), %edi
	shrl      $2, %eax
	xorl      %r9d, %eax
	subl      40(%rsp), %ecx
	addl      %eax, %r11d
	addl      %esi, %edi
	addl      %edx, %ecx
	movl      %r11d, 112(%rsp)
	movl      %r9d, %eax
	shrl      %eax
	xorl      %r9d, %eax
	rorl      $3, %r15d
	rorl      $4, %ebx
	addl      %eax, %edi
	movl      %r11d, %eax
	shrl      $2, %eax
	xorl      %r11d, %eax
	addl      %eax, %edi
	movl      %edi, 116(%rsp)
	xorl      %edi, %r12d                  # Inserted from below # xorl	%edi, %esi
	movl      92(%rsp), %eax
	addl      %r13d, %r10d
	subl      36(%rsp), %eax
	addl      %ebx, %r10d
	addl      %r9d, %eax
	movl      %eax, 100(%rsp)
	addl      96(%rsp), %r10d
	movl      %r11d, %eax
	rorl      $5, %r9d
	addl      %r9d, %r10d
	shrl      %eax
	xorl      %r11d, %eax
	addl      %eax, %r10d
	movl      %edi, %eax
	shrl      $2, %eax
	xorl      %edi, %eax
	addl      %eax, %r10d
	movl      %r10d, 120(%rsp)
	movl      132(%rsp), %edx
	rorl      $4, %r9d
	rorl      $4, %ebx
	addl      %edi, %edx
	xorl      %r10d, %r12d                 # Inserted from below # xorl	%r10d, %esi
	rorl      $4, %r14d                    # carry the rotation of 9
	addl      %r14d, %r8d
	xorl      112(%rsp), %r12d             # # Inserted from below # load it
	rorl      $4, %esi
	addl      %esi, %r8d
	addl      100(%rsp), %r8d
	rorl      $5, %r11d
	addl      %r11d, %r8d
	movl      %edi, %eax
	shrl      %eax
	xorl      %edi, %eax
	addl      %eax, %r8d
	movl      %r10d, %eax
	shrl      $2, %eax
	xorl      %r10d, %eax
	addl      %eax, %r8d
	movl      %r8d, 124(%rsp)
	rorl      $3, %r13d
	addl      %r13d, %ecx
	addl      %ebx, %ecx
	addl      96(%rsp), %ecx
	addl      %r9d, %ecx
	addl      112(%rsp), %ecx              # load it
	rorl      $5, %edi
	addl      %edi, %ecx
	rorl      $3, %r14d
	movl      %r10d, %eax
	rorl      $4, %esi                     # carry the rotation of 9
	subl      44(%rsp), %edx
	shrl      %eax
	xorl      %r10d, %eax
	addl      %r15d, %edx
	movdqa    104(%rsp), %xmm1
	rorl      $5, %r10d
	addl      %eax, %ecx
	addl      %r14d, %edx
	movl      %r8d, %eax
	shrl      $2, %eax
	xorl      %r8d, %eax
	addl      %eax, %ecx
	addl      %esi, %edx
	movl      %ecx, 128(%rsp)
	addl      100(%rsp), %edx
	rorl      $4, %r11d
	addl      %r11d, %edx
	addl      %r10d, %edx
	movl      %r8d, %eax
	shrl      %eax
	xorl      %r8d, %eax
	addl      %eax, %edx
	movl      %ecx, %eax
	shrl      $2, %eax
	xorl      %ecx, %eax
	addl      %eax, %edx
	movl      %edx, 132(%rsp)
	xorl      %r12d, %r8d
	xorl      %r8d, %ecx
	xorl      %edx, %ecx
	movd      %ecx, %xmm8
	pshufd    $0, %xmm8, %xmm8
	movl      %ecx, %ebx
	sall      $5, %ecx
	pinsrd    $0, %ecx, %xmm4
	sall      %ecx
	pinsrd    $1, %ecx, %xmm2
	shrl      %ebx
	pinsrd    $3, %ebx, %xmm4
	shrl      $2, %ebx
	pinsrd    $0, %ebx, %xmm2
	shrl      %ebx
	pinsrd    $2, %ebx, %xmm2
	shrl      %ebx
	pinsrd    $2, %ebx, %xmm4
	shrl      $2, %ebx
	pinsrd    $1, %ebx, %xmm4
	shrl      $4, %ebx
	pxor      (%rbp), %xmm4
	pxor      %xmm1, %xmm14
	pinsrd    $3, %ebx, %xmm2
	movdqa    120(%rsp), %xmm3
	pxor      -40(%rsp), %xmm4
	pxor      16(%rbp), %xmm2
	pxor      %xmm3, %xmm13
	paddd     %xmm14, %xmm4
	movdqa    %xmm4, -88(%rsp)
	movl      -88(%rsp), %edi
	pxor      32(%rbp), %xmm1
	rorl      $19, %edi
	pxor      48(%rbp), %xmm3
	addq      $64, %rbp
	pxor      -24(%rsp), %xmm2
	pxor      %xmm7, %xmm12
	pxor      %xmm8, %xmm3
	paddd     %xmm13, %xmm2
	pinsrd    $0, %edi, %xmm0
	pxor      -72(%rsp), %xmm12
	movdqa    %xmm2, -104(%rsp)
	palignr   $12, %xmm6, %xmm5
	movl      -104(%rsp), %eax
	pxor      %xmm5, %xmm11
	pxor      -56(%rsp), %xmm11
	pxor      %xmm8, %xmm1
	paddd     %xmm1, %xmm12
	paddd     %xmm3, %xmm11
	rorl      $23, %eax
	pinsrd    $0, %eax, %xmm1
	movl      -100(%rsp), %ecx
	rorl      $22, %ecx
	pinsrd    $1, %ecx, %xmm1
	movl      -96(%rsp), %ebx
	rorl      $21, %ebx
	movl      -92(%rsp), %esi
	pinsrd    $2, %ebx, %xmm1
	rorl      $20, %esi
	pinsrd    $3, %esi, %xmm1
	movl      -84(%rsp), %eax
	rorl      $18, %eax
	movl      -80(%rsp), %ecx
	pinsrd    $1, %eax, %xmm0
	movl      -76(%rsp), %ebx
	paddd     %xmm12, %xmm1
	rorl      $17, %ecx
	pinsrd    $2, %ecx, %xmm0
	rorl      $16, %ebx
	pinsrd    $3, %ebx, %xmm0
	paddd     %xmm11, %xmm0
	cmpq      -144(%rsp), %rbp
	jb        .L2
#	.align    16
	.p2align   4
	movq      -136(%rsp), %rbx             # hashState pointer
	movdqa    %xmm4, (%rbx)
	movdqa    %xmm2, 16(%rbx)
	movdqa    %xmm1, 32(%rbx)
	movdqa    %xmm0, 48(%rbx)
	addq      $144, %rsp
	popq      %rbx
	popq      %rbp
	popq      %r12
	popq      %r13
	popq      %r14
	popq      %r15
	ret
#.LFE584:
#	.size     Compress256, .-Compress256
	.globl    consts256
#	.section  .rodata
#	.align    16
	.p2align   4
#	.type     consts256, @object
#	.size     consts256, 64
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
	#.globl    negate256
#	.align    16
	.p2align   4
#	.type     negate256, @object
#	.size     negate256, 112
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
#	.section  .rodata.cst16,"aM",@progbits,16
#	.align    16
	.p2align   4
.LC12:
	.quad     6533221836532307280
	.quad     7301836170252517370
#	.align    16
	.p2align   4
.LC13:
	.quad     8070450503972727460
	.quad     8839064837692937550
#	.align    16
	.p2align   4
.LC14:
	.quad     -8839064902296403976
	.quad     -8070450568576193886
#	.align    16
	.p2align   4
.LC15:
	.quad     -7301836234855983796
	.quad     -6533221901135773706
#	.align    16
	.p2align   4
.LC16:
	.quad     -1
	.quad     -4294967295
#	.align    16
	.p2align   4
.LC17:
	.quad     -4294967295
	.quad     -4294967295
#	.align    16
	.p2align   4
.LC18:
	.quad     4294967297
	.quad     -1
#	.align    16
	.p2align   4
.LC19:
	.quad     -4294967295
	.quad     -1
#	.align    16
	.p2align   4
.LC20:
	.quad     4294967297
	.quad     -4294967295
#	.align    16
	.p2align   4
.LC21:
	.quad     8589934591
	.quad     -1
#	.align    16
	.p2align   4
.LC22:
	.quad     8589934591
	.quad     -4294967295
#	.align    16
	.p2align   4
.LC23:
	.quad     8589934591
	.quad     8589934591
#	.align    16
	.p2align   4
.LC24:
	.quad     -4294967295
	.quad     8589934591
#	.align    16
	.p2align   4
.LC33:
	.quad     361421592464458498
	.quad     940142975169071882
#	.section  .eh_frame,"a",@progbits
/*
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
	.long     .LFB584
	.long     .LFE584-.LFB584
	.uleb128  0x0
	.byte     0x4
	.long     .LCFI0-.LFB584
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
	.uleb128  0x238
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
*/
	.ident    "GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
#	.section  .note.GNU-stack,"",@progbits
