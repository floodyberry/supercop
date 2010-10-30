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
	movq      %rbx, -136(%rsp)             # hashState pointer
	movdqa    32(%rbx), %xmm1              # p256_1215
	movdqa    16(%rbx), %xmm2              # p256_0407
	movdqa    (%rbx), %xmm4                # p256_0003
	movdqa    48(%rbx), %xmm0              # p256_0811
	movdqa    %xmm2, -104(%rsp)
	movdqa    %xmm4, -88(%rsp)             # 312(%rsp -> -88(%rsp)
	#.align    16
	.p2align   4
.L2:
	pxor      (%rbp), %xmm4
	movdqa    .LC16(%rip), %xmm3
	movl      20(%rbp), %edi
	rorl      $26, %edi
	movl      4(%rbp), %ebx
	movl      (%rbp), %eax
	pxor      16(%rbp), %xmm2
	movdqa    %xmm0, %xmm15
	movdqa    %xmm4, %xmm8
	movdqa    %xmm2, %xmm10
	movdqa    %xmm1, -120(%rsp)            # p256_0811
	palignr   $4, %xmm4, %xmm10
	pxor      32(%rbp), %xmm1
	rorl      $31, %eax
	rorl      $30, %ebx
	pxor      48(%rbp), %xmm0
	movdqa    %xmm1, %xmm14
	movl      16(%rbp), %esi
	movdqa    %xmm1, %xmm12
	movl      %ebx, -68(%rsp)
	palignr   $4, %xmm2, %xmm12
	palignr   $4, %xmm0, %xmm8
	movl      %eax, -72(%rsp)              # td32_00  (-72(%rsp) - -12(%rsp))
	movdqa    %xmm0, %xmm11
	palignr   $4, %xmm1, %xmm11
	movl      8(%rbp), %ecx
	rorl      $29, %ecx
	movl      %ecx, -64(%rsp)
	movl      12(%rbp), %edx
	rorl      $28, %edx
	movl      %edx, -60(%rsp)
	palignr   $8, %xmm2, %xmm14
	palignr   $8, %xmm4, %xmm2
	palignr   $8, %xmm0, %xmm4
	palignr   $8, %xmm1, %xmm0
	rorl      $27, %esi
	movl      %esi, -56(%rsp)
	movl      %edi, -52(%rsp)
	movl      24(%rbp), %eax
	rorl      $25, %eax
	movl      %eax, -48(%rsp)
	movl      28(%rbp), %ebx
	rorl      $24, %ebx
	movl      %ebx, -44(%rsp)
	movdqa    %xmm8, %xmm7
	movdqa    %xmm12, %xmm6
	palignr   $8, %xmm10, %xmm6
	palignr   $8, %xmm11, %xmm7
	movdqa    %xmm11, %xmm5
	palignr   $8, %xmm12, %xmm5
	movdqa    %xmm10, %xmm1
	palignr   $8, %xmm8, %xmm1
	psignd    .LC18(%rip), %xmm6
	psignd    %xmm3, %xmm5
	psignd    %xmm3, %xmm7
	psignd    .LC21(%rip), %xmm1
	psignd    %xmm3, %xmm0                 # last xmm3
	psubd     %xmm0, %xmm5
	psubd     %xmm0, %xmm6                 # last xmm0
	movl      32(%rbp), %ecx
	rorl      $23, %ecx
	movl      %ecx, -40(%rsp)
	movl      36(%rbp), %edx
	rorl      $22, %edx
	movl      %edx, -36(%rsp)
	movl      40(%rbp), %esi
	rorl      $21, %esi
	movl      %esi, -32(%rsp)
	movl      44(%rbp), %edi
	rorl      $20, %edi
	movl      %edi, -28(%rsp)
	paddd     %xmm12, %xmm5
	psignd    .LC17(%rip), %xmm12
	psubd     %xmm12, %xmm1                # last xmm12
	paddd     %xmm8, %xmm5
	psignd    .LC17(%rip), %xmm4
	paddd     %xmm4, %xmm5
	psignd    .LC18(%rip), %xmm11
	paddd     %xmm11, %xmm7
	psubd     %xmm4, %xmm7
	movdqa    .LC19(%rip), %xmm3
	movdqa    %xmm10, %xmm0
	psignd    %xmm3, %xmm0                 # TODO: replace sign data, remove the movdqa
	paddd     %xmm0, %xmm7
	movdqa    %xmm2, %xmm0
	psignd    %xmm3, %xmm2
	movdqa    .LC20(%rip), %xmm13
	paddd     %xmm2, %xmm1                 # TODO: replace sign data, remove the movdqa # last xmm2
	psignd    %xmm13, %xmm0
	psignd    %xmm13, %xmm8
	paddd     %xmm0, %xmm7
	paddd     %xmm8, %xmm1                 # last usage xmm8
	psignd    .LC22(%rip), %xmm14
	paddd     %xmm14, %xmm6
	psignd    .LC23(%rip), %xmm14          # Done: replace sign data, remove the movdqa
	psubd     %xmm14, %xmm1                # last xmm14
	psignd    %xmm13, %xmm10               # TODO: replace sign data, remove the movdqa
	paddd     %xmm10, %xmm6                # last xmm10
	psignd    .LC24(%rip), %xmm11
	psubd     %xmm11, %xmm6
	movaps    %xmm1, %xmm4
	shufps    $206, %xmm6, %xmm4
	movaps    %xmm5, %xmm3
	shufps    $206, %xmm7, %xmm3
	movaps    %xmm5, %xmm8
	shufps    $148, %xmm7, %xmm8
	movaps    %xmm8, %xmm0
	shufps    $200, %xmm4, %xmm0
	movdqa    %xmm0, %xmm14
	psrld     $1, %xmm0
	shufps    $253, %xmm1, %xmm8
	pslld     $3, %xmm14
	shufps    $172, %xmm4, %xmm3           # last xmm4
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
	psrld     $12, %xmm0
	pxor      %xmm0, %xmm10
	pslld     $15, %xmm14
	pxor      %xmm14, %xmm10               # last xmm14
	psrld     $15, %xmm0
	pxor      %xmm0, %xmm10
	movdqa    %xmm8, %xmm9
	pslld     $2, %xmm9
	psrld     $1, %xmm8
	movdqa    %xmm9, %xmm6
	pxor      %xmm8, %xmm6
	pslld     $6, %xmm9
	pxor      %xmm9, %xmm6
	psrld     $8, %xmm8
	pxor      %xmm8, %xmm6
	pslld     $15, %xmm9
	pxor      %xmm9, %xmm6                 # last xmm9
	psrld     $15, %xmm8
	pxor      %xmm8, %xmm6                 # last xmm8
	movl      48(%rbp), %eax
	rorl      $19, %eax
	movl      %eax, -24(%rsp)
	movl      52(%rbp), %ebx
	rorl      $18, %ebx
	movl      %ebx, -20(%rsp)
	movl      56(%rbp), %ecx
	rorl      $17, %ecx
	movl      %ecx, -16(%rsp)
	movl      60(%rbp), %edx
	rorl      $16, %edx
	movl      %edx, -12(%rsp)
	movdqa    %xmm3, %xmm4
	pslld     $1, %xmm4
	psrld     $2, %xmm3
	movdqa    %xmm4, %xmm2
	pxor      %xmm3, %xmm2
	pslld     $11, %xmm4
	pxor      %xmm4, %xmm2
	psrld     $5, %xmm3
	pxor      %xmm3, %xmm2
	pslld     $13, %xmm4
	pxor      %xmm4, %xmm2                 # last xmm4
	psrld     $13, %xmm3
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
	movaps    %xmm6, %xmm8
	shufps    $239, %xmm10, %xmm6
	movaps    %xmm2, %xmm3
	shufps    $197, %xmm7, %xmm3
	movaps    %xmm1, %xmm12
	shufps    $238, %xmm7, %xmm12
	shufps    $255, %xmm10, %xmm7
	movlhps   %xmm8, %xmm10                # last xmm8
	shufps    $204, %xmm1, %xmm2           # last xmm1
	movaps    %xmm10, %xmm1
	shufps    $136, %xmm2, %xmm1
	shufps    $40, %xmm6, %xmm12           # last xmm6
	shufps    $141, %xmm7, %xmm2           # last xmm7
	shufps    $210, %xmm10, %xmm3          # last xmm10
	shufps    $120, %xmm3, %xmm3
	movdqa    -88(%rsp), %xmm11
	palignr   $4, %xmm15, %xmm11
	movdqa    %xmm15, %xmm5
	palignr   $4, -120(%rsp), %xmm5
	movdqa    -104(%rsp), %xmm0
	movdqa    -120(%rsp), %xmm4
	palignr   $4, -104(%rsp), %xmm4
	palignr   $4, -88(%rsp), %xmm0
	paddd     %xmm4, %xmm3                 # last xmm4
	paddd     %xmm0, %xmm1                 # last xmm0
	movdqa    %xmm1, %xmm14
	movdqa    %xmm3, %xmm13
	paddd     %xmm5, %xmm12                # last xmm5
	paddd     %xmm2, %xmm11                # last xmm2
	movdqa    %xmm1, -8(%rsp)              # exp[00] - exp[03], exp[ 0] - exp[31] lays in -8 - 40
	movdqa    %xmm3, 8(%rsp)
	movdqa    %xmm12, 24(%rsp)
	movdqa    %xmm11, 40(%rsp)
	pxor      %xmm9, %xmm9
	punpckhqdq    %xmm1, %xmm9
	paddd     %xmm3, %xmm9
	paddd     %xmm12, %xmm9
	movl      24(%rsp), %ecx
	movl      52(%rsp), %esi
	movdqa    %xmm12, %xmm5
	paddd     %xmm11, %xmm9
	movl      28(%rsp), %r9d
	pshufd    $120, %xmm9, %xmm9
	movl      32(%rsp), %edx
	punpcklqdq    %xmm11, %xmm5
	movl      40(%rsp), %r12d
	phaddd    %xmm9, %xmm9
	movdqa    %xmm5, %xmm10
	movq      %xmm9, -128(%rsp)            # evenodd ,last xmm9,
	punpcklqdq    %xmm3, %xmm1
	movdqa    %xmm1, %xmm8
	pslld     $2, %xmm8
	psrld     $1, %xmm1
	movdqa    %xmm8, %xmm4
	pxor      %xmm1, %xmm4
	psrld     $1, %xmm5
	pslld     $6, %xmm8
	movl      8(%rsp), %r15d
	movdqa    %xmm12, %xmm9
	rorl      $29, %r15d
	pxor      %xmm8, %xmm4
	movl      44(%rsp), %r8d
	psrld     $8, %xmm1
	palignr   $4, %xmm3, %xmm9
	movl      12(%rsp), %r14d
	movl      16(%rsp), %ebx
	pxor      %xmm1, %xmm4
	pslld     $15, %xmm8
	pxor      %xmm8, %xmm4                 # last xmm8
	psrld     $15, %xmm1
	pxor      %xmm1, %xmm4                 # last xmm1
	movdqa    %xmm14, %xmm6
	punpckhqdq    %xmm3, %xmm6
	movdqa    %xmm6, %xmm7
	pslld     $2, %xmm7
	psrld     $2, %xmm6
	movdqa    %xmm7, %xmm0
	pxor      %xmm6, %xmm0
	pslld     $13, %xmm7
	pxor      %xmm7, %xmm0
	pslld     $14, %xmm7
	psrld     $1, %xmm6
	pxor      %xmm6, %xmm0
	psrld     $14, %xmm6
	pxor      %xmm7, %xmm0                 # last xmm7
	pxor      %xmm6, %xmm0                 # last xmm6
	paddd     %xmm0, %xmm4                 # last xmm0
	rorl      $25, %ebx
	addl      %ebx, %r15d
	rorl      $19, %ecx
	addl      %ecx, %r15d
	rorl      $16, %edx
	addl      %edx, %r15d
	pslld     $2, %xmm10
	movdqa    %xmm10, %xmm2
	pxor      %xmm5, %xmm2
	pslld     $6, %xmm10
	pxor      %xmm10, %xmm2
	psrld     $8, %xmm5
	pxor      %xmm5, %xmm2
	pslld     $15, %xmm10
	pxor      %xmm10, %xmm2                # last xmm10
	psrld     $15, %xmm5
	pxor      %xmm5, %xmm2                 # last xmm5
	paddd     %xmm2, %xmm4                 # last xmm2
	movdqa    %xmm12, %xmm8
	punpckhqdq    %xmm11, %xmm8
	movdqa    %xmm8, %xmm1
	pslld     $2, %xmm1
	psrld     $2, %xmm8
	movdqa    %xmm1, %xmm7
	pxor      %xmm8, %xmm7
	pslld     $13, %xmm1
	pxor      %xmm1, %xmm7
	psrld     $1, %xmm8
	pslld     $14, %xmm1
	pxor      %xmm8, %xmm7
	pxor      %xmm1, %xmm7                 # last xmm1
	psrld     $14, %xmm8
	pxor      %xmm8, %xmm7                 # last xmm8
	paddd     %xmm7, %xmm4                 # last xmm7
	palignr   $4, %xmm14, %xmm3
	movdqa    %xmm3, %xmm0
	punpcklqdq    %xmm9, %xmm0
	movdqa    %xmm0, %xmm6
	pslld     $1, %xmm6
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
	pxor      %xmm0, %xmm10                # last xmm0
	paddd     %xmm10, %xmm4                # last xmm10
	punpckhqdq    %xmm9, %xmm3
	movdqa    %xmm3, %xmm5
	pslld     $3, %xmm5
	psrld     $1, %xmm3
	movdqa    %xmm5, %xmm1
	pxor      %xmm3, %xmm1
	pslld     $1, %xmm5
	pxor      %xmm5, %xmm1
	psrld     $12, %xmm3
	pxor      %xmm3, %xmm1
	pslld     $15, %xmm5
	pxor      %xmm5, %xmm1                 # last xmm5
	psrld     $15, %xmm3
	pxor      %xmm3, %xmm1                 # last xmm3
	paddd     %xmm1, %xmm4                 # last xmm1
	pxor      %xmm10, %xmm10               # TODO: change register
	movdqa    %xmm11, %xmm8
	palignr   $4, %xmm12, %xmm8
	palignr   $4, %xmm11, %xmm10
	movdqa    %xmm8, %xmm7
	punpcklqdq    %xmm10, %xmm7
	movdqa    %xmm7, %xmm6
	pslld     $1, %xmm6
	psrld     $2, %xmm7
	movdqa    %xmm6, %xmm2
	pxor      %xmm7, %xmm2
	pslld     $11, %xmm6
	pxor      %xmm6, %xmm2
	psrld     $5, %xmm7
	pxor      %xmm7, %xmm2
	pslld     $13, %xmm6
	pxor      %xmm6, %xmm2                 # last xmm6
	psrld     $13, %xmm7
	pxor      %xmm7, %xmm2                 # last xmm7
	paddd     %xmm2, %xmm4                 # last xmm2
	movdqa    %xmm8, %xmm0
	punpckhqdq    %xmm10, %xmm0            # last xmm10
	movdqa    %xmm0, %xmm1
	pslld     $3, %xmm1
	psrld     $1, %xmm0
	movdqa    %xmm1, %xmm5
	pxor      %xmm0, %xmm5
	pslld     $1, %xmm1
	pxor      %xmm2, %xmm2
	rorl      $13, %r12d
	rorl      $9, %r8d
	psrld     $12, %xmm0
	movdqa    -56(%rsp), %xmm10
	pxor      %xmm1, %xmm5
	pxor      %xmm0, %xmm5
	pslld     $15, %xmm1
	pxor      %xmm1, %xmm5                 # last xmm1
	psrld     $15, %xmm0
	pxor      %xmm0, %xmm5                 # last xmm0
	paddd     %xmm5, %xmm4                 # last xmm5
	pshufd    $120, %xmm4, %xmm4
	phaddd    %xmm2, %xmm4                 # last xmm2
	movdqa    -24(%rsp), %xmm1
	movdqa    -72(%rsp), %xmm7
	movdqa    -40(%rsp), %xmm5
	movdqa    %xmm7, %xmm0
	movdqa    %xmm5, %xmm6
	palignr   $12, %xmm10, %xmm6
	movdqa    %xmm10, %xmm3                # ok 3
	palignr   $12, %xmm1, %xmm0
	paddd     %xmm10, %xmm6
	palignr   $12, %xmm7, %xmm3
	paddd     %xmm7, %xmm3
	paddd     %xmm1, %xmm0
	palignr   $12, %xmm5, %xmm1
	paddd     %xmm5, %xmm1
	palignr   $8, %xmm10, %xmm5
	paddd     .LC15(%rip), %xmm0
	psubd     %xmm5, %xmm0
	movdqa    -104(%rsp), %xmm5
	movdqa    -88(%rsp), %xmm2
	palignr   $12, %xmm2, %xmm5
	pxor      %xmm0, %xmm5
	palignr   $8, %xmm7, %xmm10            # last xmm7
	paddd     .LC14(%rip), %xmm1
	psubd     %xmm10, %xmm1                # last xmm10
	movdqa    %xmm8, %xmm7
	palignr   $12, %xmm15, %xmm2
	pxor      %xmm1, %xmm2
	movdqa    %xmm8, %xmm0
	psrld     $29, %xmm0
	pslld     $3, %xmm7
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
	paddd     .LC12(%rip), %xmm3
	movq      -32(%rsp), %xmm0
	punpcklqdq    -24(%rsp), %xmm0
	psubd     %xmm0, %xmm3
	movdqa    -120(%rsp), %xmm0
	palignr   $12, -104(%rsp), %xmm0
	pxor      %xmm3, %xmm0
	paddd     %xmm0, %xmm4
	movdqa    %xmm4, 56(%rsp)
	paddd     .LC13(%rip), %xmm6
	movq      -16(%rsp), %xmm0
	punpcklqdq    -72(%rsp), %xmm0
	psubd     %xmm0, %xmm6
	movdqa    %xmm9, %xmm0
	palignr   $12, -120(%rsp), %xmm15
	pxor      %xmm6, %xmm15                # last xmm6
	paddd     %xmm8, %xmm15                # last xmm8
	psrld     $29, %xmm0
	pslld     $3, %xmm9
	por       %xmm9, %xmm0                 # last xmm10
	paddd     %xmm0, %xmm15
	movdqa    %xmm12, %xmm6
	palignr   $12, %xmm13, %xmm6
	movdqa    %xmm6, %xmm1
	psrld     $25, %xmm1
	pslld     $7, %xmm6
	por       %xmm6, %xmm1
	paddd     %xmm1, %xmm15
	pshufb    .LC33(%rip), %xmm7
	paddd     %xmm7, %xmm15
	movl      48(%rsp), %ebx
	rorl      $9, %ebx
	rorl      $5, %esi
	movl      36(%rsp), %ecx
	rorl      $13, %ecx
	addl      %esi, %r8d
	movl      56(%rsp), %edi
	leal      0(,%edi,8), %r10d
	movl      %edi, %r11d
	shrl      %edi
	xorl      %edi, %r10d
	movl      -128(%rsp), %esi             # from xmm9
	addl      %esi, %r8d
	addl      %r11d, %esi
	subl      (%rsp), %esi
	movl      %r11d, %eax
	rorl      $13, %eax
	xorl      %eax, %r10d
	shrl      $5, %r11d
	movl      %r11d, -40(%rsp)             # reuse the stack space for td32[ 8] - td32[15] (-40 - -12)
	rorl      $15, %eax
	xorl      %eax, %r10d
	addl      60(%rsp), %r10d
	movl      %r10d, 60(%rsp)
	movl      %r10d, %eax
	sall      $8, %eax
	movl      %eax, -36(%rsp)
	addl      64(%rsp), %r8d
	addl      %ecx, %r8d
	movl      4(%rsp), %edx
	rorl      $29, %edx
	addl      %edx, %r8d                   # last edx
	rorl      $25, %r14d
	movl      20(%rsp), %r11d
	addl      %r14d, %r8d                  # last r14
	rorl      $19, %r11d
	addl      %r11d, %r8d                  # last r11
	rorl      $16, %r9d
	addl      %r9d, %r8d                   # last r9
	xorl      56(%rsp), %edi
	addl      %edi, %r8d
	movl      %r10d, %eax
	shrl      $2, %eax
	xorl      %r10d, %eax
	addl      %eax, %r8d
	movl      %r8d, %eax
	sall      $5, %eax
	movl      %r8d, 64(%rsp)
	movl      %eax, -32(%rsp)
	movl      -124(%rsp), %edi
	leal      0(%edi,%r12d), %edx
	addl      68(%rsp), %edx
	addl      %ebx, %edx
	addl      %r15d, %edx
	movl      56(%rsp), %r14d
	rorl      $5, %r14d
	addl      %r14d, %edx
	movl      %r10d, %eax
	shrl      %eax
	xorl      %r10d, %eax
	addl      %eax, %edx
	movl      %r8d, %eax
	shrl      $2, %eax
	xorl      %r8d, %eax
	addl      %eax, %edx
	movl      %edx, 68(%rsp)
	movl      %edx, %eax
	sall      $5, %eax
	movl      %eax, -28(%rsp)              # last eax
	palignr   $4, %xmm11, %xmm4
	movdqa    %xmm4, %xmm7
	psrld     $29, %xmm7
	movdqa    %xmm4, %xmm1
	pslld     $3, %xmm1
	por       %xmm1, %xmm7
	paddd     %xmm7, %xmm5
	movdqa    56(%rsp), %xmm3
	movdqa    %xmm3, %xmm6
	palignr   $12, %xmm11, %xmm3
	movdqa    %xmm3, %xmm0
	psrld     $25, %xmm0
	movdqa    %xmm3, %xmm8
	pslld     $7, %xmm8
	por       %xmm8, %xmm0
	paddd     %xmm0, %xmm5
	movdqa    %xmm5, 120(%rsp)             # last xmm5, exp[28] - exp[31]
	movdqa    %xmm3, %xmm0
	psrld     $9, %xmm0
	pslld     $16, %xmm8                   # %xmm1 is already <<7
	por       %xmm8, %xmm0                 # last usage of %xmm2
	paddd     %xmm0, %xmm15
	movdqa    %xmm4, %xmm5
	psrld     $13, %xmm5
	pslld     $16, %xmm1
	por       %xmm1, %xmm5
	paddd     %xmm5, %xmm15
	movdqa    %xmm15, 72(%rsp)
	psrld     $6, %xmm5
	pslld     $13, %xmm4
	por       %xmm4, %xmm5
	paddd     %xmm10, %xmm5
	pshufb    .LC33(%rip), %xmm3
	paddd     %xmm3, %xmm5
	movdqa    %xmm5, 104(%rsp)
	movl      %r10d, %r12d
	rorl      $5, %r10d
	leal      (%esi,%r10d), %r15d
	addl      72(%rsp), %r15d
	movl      %r8d, %eax
	shrl      %eax
	xorl      %r8d, %eax
	addl      %eax, %r15d
	movl      %edx, %eax
	shrl      $2, %eax
	xorl      %edx, %eax
	addl      %eax, %r15d
	movl      %r15d, 72(%rsp)
	subl      4(%rsp), %edi
	movl      %r15d, -24(%rsp)
	addl      %r12d, %edi
	addl      %r8d, %esi
	xorl      %r8d, %r12d
	xorl      %edx, %r12d
	movl      %edi, %r13d
	addl      76(%rsp), %r13d
	movl      %edx, %eax
	rorl      $5, %r8d
	addl      %r8d, %r13d
	shrl      %eax
	xorl      %edx, %eax
	addl      %eax, %r13d
	movl      %r15d, %eax
	shrl      $2, %eax
	xorl      %r15d, %eax
	addl      %eax, %r13d
	movl      %r13d, 76(%rsp)
	movl      %r13d, %eax
	subl      12(%rsp), %edi
	shrl      $6, %eax
	movl      %eax, -20(%rsp)
	subl      8(%rsp), %esi
	addl      %edx, %edi
	movl      %esi, %r14d
	addl      80(%rsp), %r14d
	rorl      $5, %edx
	addl      %edx, %r14d
	movl      %r15d, %eax
	shrl      %eax
	xorl      %r15d, %eax
	addl      %eax, %r14d
	movl      %r13d, %eax
	shrl      $2, %eax
	xorl      %r13d, %eax
	addl      %eax, %r14d
	movl      %r14d, 80(%rsp)
	movl      %r14d, %eax
	sall      $6, %eax
	movl      %edi, %ebx
	movl      %eax, -16(%rsp)
	addl      84(%rsp), %ebx
	xorl      %r15d, %r12d
	subl      16(%rsp), %esi
	leal      0(%esi,%r15d), %ecx          # last esi
	rorl      $5, %r15d
	addl      %r15d, %ebx
	movl      %r13d, %eax
	shrl      %eax
	xorl      %r13d, %eax
	addl      %eax, %ebx
	movl      %r14d, %eax
	shrl      $2, %eax
	xorl      %r14d, %eax
	addl      %eax, %ebx
	xorl      56(%rsp), %r12d              # r11d
	xorl      %r13d, %r12d
	xorl      %r14d, %r12d
	xorl      %ebx, %r12d
	movl      %ebx, 84(%rsp)
	leal      0(,%ebx,4), %eax
	movl      %eax, -12(%rsp)
	movl      %r12d, %esi
	movd      %esi, %xmm0
	pshufd    $0, %xmm0, %xmm0
	pxor      %xmm0, %xmm14
	pxor      %xmm0, %xmm13
	sall      $4, %esi                     # change eax to esi
	movl      %esi, -60(%rsp)
	sall      $2, %esi
	movl      %esi, -64(%rsp)
	sall      $2, %esi
	movl      %esi, -72(%rsp)              # reuse the stack space for td32[00] - td32[07] (-72 - -44)
	movl      %r12d, %esi
	shrl      $2, %esi
	movl      %esi, -44(%rsp)
	shrl      $1, %esi
	movl      %esi, -56(%rsp)
	shrl      $1, %esi
	movl      %esi, -52(%rsp)
	shrl      $2, %esi
	movl      %esi, -68(%rsp)
	shrl      $1, %esi
	movl      %esi, -48(%rsp)
	rorl      $8, %r10d
	rorl      $4, %edx
	leal      0(%edx,%r10d), %esi
	rorl      $4, %edx                     # carry the rotation of 9
	subl      20(%rsp), %edi
	addl      %r13d, %edi
	addl      104(%rsp), %esi
	rorl      $5, %r13d
	addl      %ecx, %esi
	addl      %r13d, %esi
	movl      %r14d, %eax
	shrl      %eax
	xorl      %r14d, %eax
	addl      %eax, %esi
	movl      %ebx, %eax
	shrl      $2, %eax
	xorl      %ebx, %eax
	addl      %eax, %esi
	movl      %esi, 104(%rsp)
	xorl      %esi, %r12d                  # Inserted from below #  xorl	%r12d, %esi
	rorl      $8, %r8d
	rorl      $4, %r15d
	leal      0(%r15d,%r8d), %r9d
	subl      24(%rsp), %ecx
	addl      %r14d, %ecx
	addl      108(%rsp), %r9d
	addl      %edi, %r9d
	rorl      $5, %r14d
	addl      %r14d, %r9d
	movl      %ebx, %eax
	shrl      %eax
	xorl      %ebx, %eax
	addl      %eax, %r9d
	movl      %esi, %eax
	shrl      $2, %eax
	xorl      %esi, %eax
	addl      %eax, %r9d
	movl      %r9d, 108(%rsp)
	xorl      %r9d, %r12d                  # Inserted from below # xorl	%r9d, %esi
	rorl      $4, %r13d
	leal      0(%r13d,%edx), %r11d
	subl      28(%rsp), %edi
	addl      %ebx, %edi
	addl      %ecx, %r11d
	movl      %edi, 92(%rsp)
	addl      112(%rsp), %r11d
	rorl      $5, %ebx
	addl      %ebx, %r11d
	movl      %esi, %eax
	shrl      %eax
	xorl      %esi, %eax
	addl      %eax, %r11d
	movl      %r9d, %eax
	shrl      $2, %eax
	xorl      %r9d, %eax
	addl      %eax, %r11d
	movl      %r11d, 112(%rsp)
	rorl      $4, %r14d
	rorl      $4, %r15d
	leal      0(%r14d,%r15d), %edi
	addl      116(%rsp), %edi
	subl      32(%rsp), %ecx
	addl      %esi, %ecx
	movl      %ecx, 96(%rsp)               # last ecx
	addl      92(%rsp), %edi
	rorl      $5, %esi
	addl      %esi, %edi
	movl      %r9d, %eax
	shrl      %eax
	xorl      %r9d, %eax
	addl      %eax, %edi
	movl      %r11d, %eax
	shrl      $2, %eax
	xorl      %r11d, %eax
	addl      %eax, %edi
	movl      %edi, 116(%rsp)
	xorl      %edi, %r12d                  # Inserted from below # xorl	%edi, %esi
	rorl      $6, %r10d
	addl      120(%rsp), %r10d
	rorl      $3, %edx
	addl      %edx, %r10d
	rorl      $4, %r13d
	addl      %r13d, %r10d
	movl      92(%rsp), %eax
	subl      36(%rsp), %eax
	addl      %r9d, %eax
	movl      %eax, 100(%rsp)
	rorl      $4, %ebx
	addl      %ebx, %r10d
	addl      96(%rsp), %r10d
	rorl      $5, %r9d
	addl      %r9d, %r10d
	movl      %r11d, %eax
	shrl      %eax
	xorl      %r11d, %eax
	addl      %eax, %r10d
	movl      %edi, %eax
	shrl      $2, %eax
	xorl      %edi, %eax
	addl      %eax, %r10d
	movl      %r10d, 120(%rsp)
	xorl      %r10d, %r12d                 # Inserted from below # xorl	%r10d, %esi
	rorl      $6, %r8d
	addl      124(%rsp), %r8d
	rorl      $3, %r15d
	addl      %r15d, %r8d
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
	movl      128(%rsp), %ecx
	subl      40(%rsp), %ecx
	rorl      $3, %edx
	addl      %edx, %ecx
	rorl      $3, %r13d
	addl      %r13d, %ecx
	rorl      $4, %ebx
	addl      %ebx, %ecx
	addl      96(%rsp), %ecx
	rorl      $4, %r9d
	addl      %r9d, %ecx
	addl      112(%rsp), %ecx              # load it
	movl      132(%rsp), %edx
	addl      %edi, %edx
	rorl      $5, %edi
	addl      %edi, %ecx
	movl      %r10d, %eax
	shrl      %eax
	xorl      %r10d, %eax
	addl      %eax, %ecx
	movl      %r8d, %eax
	shrl      $2, %eax
	xorl      %r8d, %eax
	addl      %eax, %ecx
	movl      %ecx, 128(%rsp)
	subl      44(%rsp), %edx
	rorl      $3, %r15d
	addl      %r15d, %edx
	rorl      $3, %r14d
	addl      %r14d, %edx
	rorl      $4, %esi                     # carry the rotation of 9
	addl      %esi, %edx
	addl      100(%rsp), %edx
	rorl      $4, %r11d
	addl      %r11d, %edx
	rorl      $5, %r10d
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
	pinsrd    $3, %ebx, %xmm2
	movdqa    104(%rsp), %xmm1
	movdqa    120(%rsp), %xmm3
	pxor      %xmm1, %xmm14
	pxor      %xmm3, %xmm13
	pxor      (%rbp), %xmm4
	pxor      -40(%rsp), %xmm4
	paddd     %xmm14, %xmm4
	movdqa    %xmm4, -88(%rsp)
	pxor      16(%rbp), %xmm2
	pxor      -24(%rsp), %xmm2
	paddd     %xmm13, %xmm2
	movdqa    %xmm2, -104(%rsp)
	movdqa    72(%rsp), %xmm5
	movdqa    %xmm6, %xmm7
	palignr   $12, %xmm5, %xmm7
	palignr   $12, %xmm6, %xmm5
	pxor      %xmm7, %xmm12
	pxor      -72(%rsp), %xmm12
	pxor      %xmm5, %xmm11
	pxor      -56(%rsp), %xmm11
	pxor      32(%rbp), %xmm1
	pxor      %xmm8, %xmm1
	paddd     %xmm1, %xmm12
	pxor      48(%rbp), %xmm3
	pxor      %xmm8, %xmm3
	paddd     %xmm3, %xmm11
	movl      -104(%rsp), %eax
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
	paddd     %xmm12, %xmm1
	movl      -88(%rsp), %edi
	rorl      $19, %edi
	pinsrd    $0, %edi, %xmm0
	movl      -84(%rsp), %eax
	rorl      $18, %eax
	pinsrd    $1, %eax, %xmm0
	movl      -80(%rsp), %ecx
	rorl      $17, %ecx
	pinsrd    $2, %ecx, %xmm0
	movl      -76(%rsp), %ebx
	rorl      $16, %ebx
	pinsrd    $3, %ebx, %xmm0
	paddd     %xmm11, %xmm0
	addq      $64, %rbp
	cmpq      -144(%rsp), %rbp
	jb        .L2
	#.align    16
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
	#.align    16
	.p2align   7
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
	.globl    negate256
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
/*
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
