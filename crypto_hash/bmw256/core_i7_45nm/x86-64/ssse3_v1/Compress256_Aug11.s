        .file     "Compress256_sse_29_v3.c"
        .text
        .globl    Compress256
        .type     Compress256, @function
        .align    16
        Compress256:
# Modified version of Compress256_sse_29_v3.c, originaly compiled with GCC 4.3.3.
# Tuned by Rune E. Jensen, July 2010 (11 Aug version) - Core i7 45nm.
.LFB584:
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
        subq      $512, %rsp
.LCFI6:
        leaq      16(%rdx), %rbx
        movq      %rbx, -32(%rsp)                               # = 16(%rdx)
        movdqa    32(%rbx), %xmm2
        movq      %rsi, -40(%rsp)
        movdqa    48(%rbx), %xmm3
        movdqa    16(%rbx), %xmm1
        movq      %rdi, %rbp
        movdqa    (%rbx), %xmm0
        movdqa    %xmm0, 312(%rsp)
        movdqa    %xmm2, 344(%rsp)
        movdqa    %xmm3, 360(%rsp)
        movdqa    %xmm1, 328(%rsp)
        .align    16
.L2:
        movdqa    328(%rsp), %xmm2
        movl      16(%rbp), %esi
        rorl      $27, %esi
        movdqa    .LC16(%rip), %xmm3
        movdqa    312(%rsp), %xmm4
        movl      4(%rbp), %ebx
        movl      8(%rbp), %ecx
        movl      20(%rbp), %edi
        movl      %esi, 248(%rsp)
        rorl      $30, %ebx
        movl      12(%rbp), %edx
        movl      (%rbp), %eax
        pxor      (%rbp), %xmm4
        movdqa    %xmm2, -104(%rsp)
        pxor      16(%rbp), %xmm2
        movdqa    344(%rsp), %xmm1
        movdqa    %xmm1, -120(%rsp)
        rorl      $26, %edi
        pxor      32(%rbp), %xmm1
        movl      40(%rbp), %esi
        rorl      $28, %edx
        rorl      $21, %esi
        movdqa    %xmm1, %xmm12
        movdqa    %xmm4, %xmm8
        movl      %esi, 272(%rsp)
        rorl      $31, %eax
        rorl      $29, %ecx
        movdqa    %xmm2, %xmm10
        movl      %ebx, 236(%rsp)
        movdqa    360(%rsp), %xmm15
        movdqa    %xmm1, %xmm14
        movl      %eax, 232(%rsp)
        movdqa    %xmm15, %xmm0
        movl      %edx, 244(%rsp)
        palignr   $4, %xmm4, %xmm10
        movl      28(%rbp), %ebx
        palignr   $8, %xmm2, %xmm14
        pxor      48(%rbp), %xmm0
        movl      36(%rbp), %edx
        palignr   $4, %xmm2, %xmm12
        rorl      $22, %edx
        movl      %ecx, 240(%rsp)
        movdqa    %xmm0, %xmm11
        palignr   $4, %xmm1, %xmm11
        palignr   $4, %xmm0, %xmm8
        palignr   $8, %xmm4, %xmm2
        palignr   $8, %xmm0, %xmm4
        palignr   $8, %xmm1, %xmm0
        movl      %edi, 252(%rsp)
        movl      24(%rbp), %eax
        rorl      $25, %eax
        movl      %eax, 256(%rsp)
        rorl      $24, %ebx
        movl      %ebx, 260(%rsp)
        movdqa    %xmm12, %xmm6
        palignr   $8, %xmm10, %xmm6
        movdqa    %xmm11, %xmm5
        palignr   $8, %xmm12, %xmm5
        movdqa    %xmm8, %xmm7
        palignr   $8, %xmm11, %xmm7
        movdqa    %xmm10, %xmm1
        palignr   $8, %xmm8, %xmm1
        psignd    .LC18(%rip), %xmm6
        psignd    %xmm3, %xmm5
        psignd    %xmm3, %xmm7
        psignd    .LC21(%rip), %xmm1
        psignd    %xmm3, %xmm0                                  # last xmm3
        psubd     %xmm0, %xmm5
        psubd     %xmm0, %xmm6                                  # last xmm0
        movl      32(%rbp), %ecx
        psignd    .LC18(%rip), %xmm11
        paddd     %xmm12, %xmm5                                 # last xmm12
        movl      52(%rbp), %ebx
        movdqa    .LC20(%rip), %xmm13
        movl      %edx, 268(%rsp)
        movl      44(%rbp), %edi
        paddd     %xmm11, %xmm7
        paddd     %xmm8, %xmm5
        movdqa    %xmm10, %xmm0
        psignd    .LC17(%rip), %xmm4
        psignd    .LC17(%rip), %xmm12
        movdqa    .LC19(%rip), %xmm3
        psignd    .LC22(%rip), %xmm14
        rorl      $20, %edi
        movl      %edi, 276(%rsp)
        rorl      $23, %ecx
        psubd     %xmm12, %xmm1                                 # last xmm12
        psignd    %xmm3, %xmm0                                  # TODO: replace sign data, remove the movdqa
        psubd     %xmm4, %xmm7
        paddd     %xmm4, %xmm5
        movl      %ecx, 264(%rsp)
        paddd     %xmm0, %xmm7
        movdqa    %xmm2, %xmm0
        psignd    %xmm3, %xmm2
        paddd     %xmm2, %xmm1                                  # TODO: replace sign data, remove the movdqa # last xmm2
        psignd    %xmm13, %xmm0
        paddd     %xmm0, %xmm7
        psignd    %xmm13, %xmm8
        paddd     %xmm8, %xmm1                                  # last usage xmm8
        paddd     %xmm14, %xmm6
        psignd    .LC24(%rip), %xmm11
        psignd    .LC23(%rip), %xmm14                           # Done: replace sign data, remove the movdqa
        movaps    %xmm5, %xmm8
        movl      48(%rbp), %eax
        movl      56(%rbp), %ecx
        movaps    %xmm5, %xmm3
        rorl      $17, %ecx
        psubd     %xmm14, %xmm1                                 # last xmm14
        shufps    $148, %xmm7, %xmm8
        movl      %ecx, 288(%rsp)
        movaps    %xmm8, %xmm0
        rorl      $18, %ebx
        rorl      $19, %eax
        movl      %eax, 280(%rsp)
        movl      %ebx, 284(%rsp)
        movl      60(%rbp), %edx
        shufps    $253, %xmm1, %xmm8
        psignd    %xmm13, %xmm10                                # TODO: replace sign data, remove the movdqa
        paddd     %xmm10, %xmm6                                 # last xmm10
        movdqa    %xmm8, %xmm9
        psubd     %xmm11, %xmm6
        movaps    %xmm1, %xmm4
        pslld     $2, %xmm9
        shufps    $206, %xmm7, %xmm3
        rorl      $16, %edx
        shufps    $206, %xmm6, %xmm4
        shufps    $200, %xmm4, %xmm0
        movdqa    %xmm0, %xmm14
        psrld     $1, %xmm0
        pslld     $3, %xmm14
        shufps    $172, %xmm4, %xmm3                            # last xmm4
        shufps    $148, %xmm6, %xmm1                            # last xmm6
        shufps    $143, %xmm1, %xmm5
        shufps    $208, %xmm1, %xmm7                            # last xmm1
        movdqa    %xmm7, %xmm11
        psrld     $1, %xmm7
        movdqa    %xmm14, %xmm10
        pxor      %xmm11, %xmm7                                 # last xmm7
        pxor      %xmm0, %xmm10
        psrld     $1, %xmm8
        movdqa    %xmm9, %xmm6
        pslld     $1, %xmm14
        pslld     $6, %xmm9
        psrld     $12, %xmm0
        pxor      %xmm8, %xmm6
        pxor      %xmm14, %xmm10
        pslld     $15, %xmm14
        psrld     $8, %xmm8
        pxor      %xmm9, %xmm6
        pxor      %xmm8, %xmm6
        psrld     $15, %xmm8
        pxor      %xmm0, %xmm10
        pslld     $15, %xmm9
        pxor      %xmm9, %xmm6                                  # last xmm9
        movdqa    %xmm3, %xmm4
        movl      %edx, 292(%rsp)
        pxor      %xmm14, %xmm10                                # last xmm14
        pxor      %xmm8, %xmm6                                  # last xmm8
        pxor      %xmm9, %xmm9
        pslld     $1, %xmm4
        psrld     $15, %xmm0
        pxor      %xmm0, %xmm10
        psrld     $2, %xmm3
        movdqa    %xmm4, %xmm2
        pxor      %xmm3, %xmm2
        pslld     $11, %xmm4
        pxor      %xmm4, %xmm2
        movdqa    312(%rsp), %xmm11
        palignr   $4, %xmm15, %xmm11
        psrld     $5, %xmm3
        pxor      %xmm3, %xmm2
        pslld     $13, %xmm4
        movdqa    %xmm5, %xmm0
        pxor      %xmm4, %xmm2                                  # last xmm4
        psrld     $13, %xmm3
        pxor      %xmm3, %xmm2                                  # last xmm3
        pslld     $2, %xmm0
        psrld     $2, %xmm5
        movdqa    -120(%rsp), %xmm4
        movdqa    %xmm0, %xmm1
        movaps    %xmm6, %xmm8
        pslld     $13, %xmm0
        pxor      %xmm5, %xmm1
        psrld     $1, %xmm5
        shufps    $239, %xmm10, %xmm6
        movaps    %xmm2, %xmm3
        pxor      %xmm0, %xmm1
        shufps    $197, %xmm7, %xmm3
        palignr   $4, -104(%rsp), %xmm4
        pxor      %xmm5, %xmm1
        pslld     $14, %xmm0
        pxor      %xmm0, %xmm1                                  # last xmm0
        psrld     $14, %xmm5
        pxor      %xmm5, %xmm1                                  # last xmm5
        movaps    %xmm1, %xmm12
        shufps    $238, %xmm7, %xmm12
        movdqa    -104(%rsp), %xmm0
        shufps    $40, %xmm6, %xmm12                            # last xmm6
        palignr   $4, 312(%rsp), %xmm0
        movdqa    %xmm15, %xmm5
        palignr   $4, -120(%rsp), %xmm5
        shufps    $204, %xmm1, %xmm2                            # last xmm1
        shufps    $255, %xmm10, %xmm7
        movlhps   %xmm8, %xmm10                                 # last xmm8
        paddd     %xmm5, %xmm12                                 # last xmm5
        movaps    %xmm10, %xmm1
        shufps    $210, %xmm10, %xmm3                           # last xmm10
        shufps    $136, %xmm2, %xmm1
        shufps    $141, %xmm7, %xmm2                            # last xmm7
        paddd     %xmm0, %xmm1                                  # last xmm0
        shufps    $120, %xmm3, %xmm3
        movdqa    %xmm1, 104(%rsp)
        paddd     %xmm2, %xmm11                                 # last xmm2
        movdqa    %xmm11, 152(%rsp)
        punpckhqdq    %xmm1, %xmm9
        movl      156(%rsp), %r8d
        movl      152(%rsp), %r12d
        rorl      $9, %r8d
        rorl      $13, %r12d
        movdqa    %xmm1, %xmm14
        movdqa    %xmm14, %xmm6
        paddd     %xmm4, %xmm3                                  # last xmm4
        movdqa    %xmm12, 136(%rsp)
        movdqa    %xmm12, %xmm5
        punpcklqdq    %xmm11, %xmm5
        movdqa    %xmm5, %xmm10
        punpckhqdq    %xmm3, %xmm6
        movdqa    %xmm3, 120(%rsp)
        movdqa    %xmm6, %xmm7
        movl      128(%rsp), %ebx
        paddd     %xmm3, %xmm9
        movl      120(%rsp), %r15d
        movl      136(%rsp), %ecx
        pslld     $2, %xmm10
        movdqa    %xmm3, %xmm13
        paddd     %xmm12, %xmm9
        paddd     %xmm11, %xmm9
        pshufd    $120, %xmm9, %xmm9
        psrld     $1, %xmm5
        rorl      $19, %ecx
        pslld     $2, %xmm7
        rorl      $29, %r15d
        rorl      $25, %ebx
        addl      %ebx, %r15d
        psrld     $2, %xmm6
        phaddd    %xmm9, %xmm9
        movq      %xmm9, 488(%rsp)                              # last xmm9
        punpcklqdq    %xmm3, %xmm1
        movdqa    %xmm1, %xmm8
        pslld     $2, %xmm8
        movl      140(%rsp), %r9d
        addl      %ecx, %r15d
        psrld     $1, %xmm1
        movl      160(%rsp), %ebx
        movdqa    %xmm7, %xmm0
        rorl      $16, %r9d
        movdqa    %xmm8, %xmm4
        pslld     $6, %xmm8
        movdqa    %xmm12, %xmm9
        movl      164(%rsp), %esi
        pslld     $13, %xmm7
        movdqa    %xmm10, %xmm2
        palignr   $4, %xmm3, %xmm9
        pxor      %xmm5, %xmm2
        movl      144(%rsp), %edx
        pxor      %xmm1, %xmm4
        palignr   $4, %xmm14, %xmm3
        pxor      %xmm6, %xmm0
        psrld     $8, %xmm5
        pxor      %xmm7, %xmm0
        rorl      $9, %ebx
        psrld     $1, %xmm6
        psrld     $8, %xmm1
        pslld     $6, %xmm10
        pxor      %xmm10, %xmm2
        movl      148(%rsp), %ecx
        pxor      %xmm6, %xmm0
        rorl      $5, %esi
        addl      %esi, %r8d
        pslld     $14, %xmm7
        pxor      %xmm5, %xmm2
        rorl      $16, %edx
        pxor      %xmm8, %xmm4
        pxor      %xmm1, %xmm4
        pslld     $15, %xmm8
        pxor      %xmm8, %xmm4                                  # last xmm8
        movdqa    %xmm12, %xmm8
        punpckhqdq    %xmm11, %xmm8
        psrld     $15, %xmm1
        pslld     $15, %xmm10
        addl      %edx, %r15d
        movl      488(%rsp), %esi
        addl      %esi, %r8d
        movl      116(%rsp), %edx
        pxor      %xmm10, %xmm2                                 # last xmm10
        pxor      %xmm7, %xmm0                                  # last xmm7
        rorl      $29, %edx
        rorl      $13, %ecx
        psrld     $14, %xmm6
        psrld     $15, %xmm5
        pxor      %xmm1, %xmm4                                  # last xmm1
        pxor      %xmm6, %xmm0                                  # last xmm6
        paddd     %xmm0, %xmm4                                  # last xmm0
        pxor      %xmm5, %xmm2                                  # last xmm5
        paddd     %xmm2, %xmm4                                  # last xmm2
        movdqa    %xmm8, %xmm1
        pslld     $2, %xmm1
        psrld     $2, %xmm8
        movdqa    %xmm1, %xmm7
        pxor      %xmm8, %xmm7
        pslld     $13, %xmm1
        psrld     $1, %xmm8
        pxor      %xmm1, %xmm7
        movdqa    %xmm3, %xmm0
        punpcklqdq    %xmm9, %xmm0
        pxor      %xmm8, %xmm7
        punpckhqdq    %xmm9, %xmm3
        pslld     $14, %xmm1
        pxor      %xmm1, %xmm7                                  # last xmm1
        psrld     $14, %xmm8
        pxor      %xmm8, %xmm7                                  # last xmm8
        paddd     %xmm7, %xmm4                                  # last xmm7
        movdqa    %xmm0, %xmm6
        psrld     $2, %xmm0
        movdqa    %xmm3, %xmm5
        pslld     $1, %xmm6
        movdqa    %xmm6, %xmm10
        movdqa    %xmm11, %xmm8
        pslld     $3, %xmm5
        psrld     $1, %xmm3
        pslld     $11, %xmm6
        movdqa    %xmm5, %xmm1
        palignr   $4, %xmm12, %xmm8
        pslld     $1, %xmm5
        pxor      %xmm0, %xmm10
        pxor      %xmm6, %xmm10
        psrld     $5, %xmm0
        pxor      %xmm0, %xmm10
        pslld     $13, %xmm6
        pxor      %xmm6, %xmm10                                 # last xmm6
        psrld     $13, %xmm0
        pxor      %xmm0, %xmm10                                 # last xmm0
        paddd     %xmm10, %xmm4                                 # last xmm10
        pxor      %xmm3, %xmm1
        pxor      %xmm5, %xmm1
        psrld     $12, %xmm3
        pxor      %xmm3, %xmm1
        pslld     $15, %xmm5
        pxor      %xmm5, %xmm1                                  # last xmm5
        psrld     $15, %xmm3
        pxor      %xmm3, %xmm1                                  # last xmm3
        paddd     %xmm1, %xmm4                                  # last xmm1
        pxor      %xmm10, %xmm10                                # TODO: change register
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
        movdqa    %xmm8, %xmm0
        punpckhqdq    %xmm10, %xmm0                             # last xmm10
        pxor      %xmm6, %xmm2                                  # last xmm6
        movdqa    248(%rsp), %xmm10
        movdqa    %xmm0, %xmm1
        psrld     $1, %xmm0
        psrld     $13, %xmm7
        pslld     $3, %xmm1
        pxor      %xmm7, %xmm2                                  # last xmm7
        movdqa    %xmm1, %xmm5
        pxor      %xmm0, %xmm5
        paddd     %xmm2, %xmm4                                  # last xmm2
        pslld     $1, %xmm1
        pxor      %xmm1, %xmm5
        psrld     $12, %xmm0
        pxor      %xmm0, %xmm5
        pslld     $15, %xmm1
        pxor      %xmm1, %xmm5                                  # last xmm1
        psrld     $15, %xmm0
        pxor      %xmm0, %xmm5                                  # last xmm0
        paddd     %xmm5, %xmm4                                  # last xmm5
        pshufd    $120, %xmm4, %xmm4
        pxor      %xmm2, %xmm2
        phaddd    %xmm2, %xmm4                                  # last xmm2
        movdqa    232(%rsp), %xmm7
        movdqa    280(%rsp), %xmm1
        movdqa    264(%rsp), %xmm5
        movdqa    %xmm7, %xmm0
        palignr   $12, %xmm1, %xmm0
        movdqa    %xmm10, %xmm3                                 # ok 3
        palignr   $12, %xmm7, %xmm3
        movdqa    %xmm5, %xmm6
        palignr   $12, %xmm10, %xmm6
        paddd     %xmm7, %xmm3
        paddd     %xmm1, %xmm0
        palignr   $12, %xmm5, %xmm1
        paddd     %xmm5, %xmm1
        palignr   $8, %xmm10, %xmm5
        paddd     .LC15(%rip), %xmm0
        psubd     %xmm5, %xmm0
        movdqa    -104(%rsp), %xmm5
        movdqa    312(%rsp), %xmm2
        palignr   $12, %xmm15, %xmm2
        palignr   $12, 312(%rsp), %xmm5
        paddd     .LC12(%rip), %xmm3
        palignr   $12, -120(%rsp), %xmm15
        pxor      %xmm0, %xmm5
        paddd     %xmm10, %xmm6
        palignr   $8, %xmm7, %xmm10                             # last xmm7
        paddd     .LC14(%rip), %xmm1
        psubd     %xmm10, %xmm1                                 # last xmm10
        movdqa    %xmm8, %xmm0
        psrld     $29, %xmm0
        movdqa    %xmm8, %xmm7
        psrld     $19, %xmm8
        pxor      %xmm1, %xmm2
        pslld     $3, %xmm7
        por       %xmm7, %xmm0
        paddd     %xmm0, %xmm2
        pslld     $10, %xmm7
        por       %xmm7, %xmm8
        movdqa    %xmm11, %xmm7
        palignr   $12, %xmm12, %xmm7
        movdqa    %xmm7, %xmm0
        movdqa    %xmm7, %xmm1
        psrld     $25, %xmm1
        pslld     $7, %xmm0
        por       %xmm0, %xmm1
        paddd     %xmm2, %xmm1
        movdqa    %xmm1, 72(%rsp)
        movq      272(%rsp), %xmm0
        punpcklqdq    280(%rsp), %xmm0
        psubd     %xmm0, %xmm3
        movdqa    -120(%rsp), %xmm0
        palignr   $12, -104(%rsp), %xmm0
        pxor      %xmm3, %xmm0
        paddd     %xmm0, %xmm4
        movdqa    %xmm4, 168(%rsp)
        paddd     .LC13(%rip), %xmm6
        movq      288(%rsp), %xmm0
        punpcklqdq    232(%rsp), %xmm0
        psubd     %xmm0, %xmm6
        pxor      %xmm6, %xmm15                                 # last xmm6
        paddd     %xmm8, %xmm15                                 # last xmm8, xmm7
        movdqa    %xmm9, %xmm0
        psrld     $29, %xmm0
        pslld     $3, %xmm9
        por       %xmm9, %xmm0                                  # last xmm10
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
        movl      168(%rsp), %edi
        leal      0(,%edi,8), %r10d
        movl      %edi, %r11d
        shrl      %edi
        xorl      %edi, %r10d
        addl      %r11d, %esi
        subl      112(%rsp), %esi
        movl      %r11d, %eax
        rorl      $13, %eax
        xorl      %eax, %r10d
        shrl      $5, %r11d
        movl      %r11d, 376(%rsp)
        rorl      $15, %eax
        xorl      %eax, %r10d
        movl      124(%rsp), %r14d
        movl      132(%rsp), %r11d
        rorl      $25, %r14d
        addl      176(%rsp), %r8d
        addl      172(%rsp), %r10d
        xorl      168(%rsp), %edi
        addl      %ecx, %r8d
        movl      %r10d, 172(%rsp)
        movl      %r10d, %eax
        sall      $8, %eax
        movl      %eax, 380(%rsp)
        addl      %edx, %r8d                                    # last edx
        addl      %r14d, %r8d                                   # last r14
        rorl      $19, %r11d
        addl      %r11d, %r8d                                   # last r11
        addl      %r9d, %r8d                                    # last r9
        addl      %edi, %r8d
        movl      %r10d, %eax
        shrl      $2, %eax
        xorl      %r10d, %eax
        addl      %eax, %r8d
        movl      %r8d, 176(%rsp)
        movl      %r8d, %eax
        sall      $5, %eax
        movl      %eax, 384(%rsp)
        movl      492(%rsp), %edi
        leal      0(%edi,%r12d), %edx
        addl      180(%rsp), %edx
        addl      %ebx, %edx
        addl      %r15d, %edx
        movl      168(%rsp), %r14d
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
        movl      %edx, 180(%rsp)
        movl      %edx, %eax
        sall      $5, %eax
        movl      %eax, 388(%rsp)                               # last eax
        palignr   $4, %xmm11, %xmm4
        movdqa    %xmm4, %xmm7
        psrld     $29, %xmm7
        movdqa    %xmm4, %xmm1
        pslld     $3, %xmm1
        por       %xmm1, %xmm7
        paddd     %xmm7, %xmm5
        movdqa    168(%rsp), %xmm3
        movdqa    %xmm3, %xmm6
        palignr   $12, %xmm11, %xmm3
        movdqa    %xmm3, %xmm0
        psrld     $25, %xmm0
        movdqa    %xmm3, %xmm8
        pslld     $7, %xmm8
        por       %xmm8, %xmm0
        pslld     $16, %xmm1
        pslld     $16, %xmm8                                    # %xmm1 is already <<7
        movl      %r10d, %r12d
        subl      116(%rsp), %edi
        rorl      $5, %r10d
        movl      %r8d, %eax
        leal      (%esi,%r10d), %r15d
        addl      %r8d, %esi
        movdqa    %xmm6, %xmm7
        shrl      %eax
        rorl      $8, %r10d
        paddd     %xmm0, %xmm5
        movdqa    %xmm5, 216(%rsp)                              # last xmm5
        xorl      %r8d, %eax
        movdqa    %xmm4, %xmm5
        subl      120(%rsp), %esi
        pslld     $13, %xmm4
        movdqa    %xmm3, %xmm0
        psrld     $9, %xmm0
        por       %xmm8, %xmm0                                  # last usage of %xmm2
        psrld     $13, %xmm5
        por       %xmm1, %xmm5
        paddd     %xmm0, %xmm15
        paddd     %xmm5, %xmm15
        movl      %esi, %r14d
        subl      128(%rsp), %esi
        pshufb    .LC33(%rip), %xmm3
        addl      %r12d, %edi
        movl      %edi, %r13d
        xorl      %r8d, %r12d
        psrld     $6, %xmm5
        movdqa    %xmm15, 184(%rsp)
        por       %xmm4, %xmm5
        paddd     72(%rsp), %xmm5
        paddd     %xmm3, %xmm5
        movdqa    %xmm5, 200(%rsp)
        xorl      %edx, %r12d
        addl      184(%rsp), %r15d
        addl      %eax, %r15d
        addl      188(%rsp), %r13d
        addl      192(%rsp), %r14d
        movl      %edx, %eax
        subl      124(%rsp), %edi
        shrl      $2, %eax
        rorl      $5, %r8d
        addl      %edx, %edi
        addl      %r8d, %r13d
        rorl      $8, %r8d
        xorl      %edx, %eax
        addl      %eax, %r15d
        movl      %r15d, 184(%rsp)
        movl      %r15d, 392(%rsp)
        movl      %edx, %eax
        shrl      %eax
        xorl      %edx, %eax
        rorl      $5, %edx
        addl      %edx, %r14d
        xorl      %r15d, %r12d
        xorl      168(%rsp), %r12d                              # r11d
        movl      %edi, %ebx
        rorl      $4, %edx
        addl      %eax, %r13d
        movl      %r15d, %eax
        shrl      $2, %eax
        xorl      %r15d, %eax
        addl      %eax, %r13d
        subl      132(%rsp), %edi
        movl      %r13d, %eax
        shrl      $6, %eax
        leal      0(%esi,%r15d), %ecx                           # last esi
        movl      %r13d, 188(%rsp)
        leal      0(%edx,%r10d), %esi
        movl      %eax, 396(%rsp)
        movl      %r15d, %eax
        shrl      %eax
        xorl      %r15d, %eax
        addl      %eax, %r14d
        movl      %r13d, %eax
        rorl      $4, %edx                                      # carry the rotation of 9
        addl      196(%rsp), %ebx
        addl      200(%rsp), %esi
        xorl      %r13d, %r12d
        rorl      $6, %r10d
        addl      %r13d, %edi
        shrl      $2, %eax
        xorl      %r13d, %eax
        addl      %eax, %r14d
        movl      %r14d, 192(%rsp)
        movl      %r14d, %eax
        sall      $6, %eax
        movl      %eax, 400(%rsp)
        rorl      $5, %r15d
        addl      %r15d, %ebx
        movl      %r13d, %eax
        shrl      %eax
        xorl      %r13d, %eax
        xorl      %r14d, %r12d
        rorl      $4, %r15d
        rorl      $5, %r13d
        addl      %eax, %ebx
        movl      %r14d, %eax
        leal      0(%r15d,%r8d), %r9d
        addl      %ecx, %esi
        addl      %r13d, %esi
        rorl      $4, %r13d
        rorl      $4, %r15d
        leal      0(%r13d,%edx), %r11d
        rorl      $6, %r8d
        addl      220(%rsp), %r8d
        addl      204(%rsp), %r9d
        shrl      $2, %eax
        xorl      %r14d, %eax
        addl      %eax, %ebx
        xorl      %ebx, %r12d
        rorl      $3, %edx
        leal      0(,%ebx,4), %eax
        movl      %ebx, 196(%rsp)
        movl      %eax, 404(%rsp)
        addl      216(%rsp), %r10d
        addl      %edx, %r10d
        rorl      $3, %edx
        movl      %r12d, %eax
        addl      %edi, %r9d
        subl      140(%rsp), %edi
        movq      %rax, 472(%rsp)
        sall      $4, %eax
        rorl      $4, %r13d
        movdqa    392(%rsp), %xmm1
        movq      472(%rsp), %xmm0
        pshufd    $0, %xmm0, %xmm0
        pxor      %xmm0, %xmm14
        pxor      %xmm0, %xmm13
        movl      %eax, 452(%rsp)
        sall      $2, %eax
        movl      %eax, 448(%rsp)
        sall      $2, %eax
        movl      %eax, 440(%rsp)
        movl      %r12d, %eax
        shrl      $2, %eax
        movl      %eax, 468(%rsp)
        shrl      $1, %eax
        movl      %eax, 456(%rsp)
        shrl      $1, %eax
        movl      %eax, 460(%rsp)
        shrl      $2, %eax
        movl      %eax, 444(%rsp)
        shrl      $1, %eax
        movl      %eax, 464(%rsp)
        movl      %r14d, %eax
        shrl      %eax
        xorl      %r14d, %eax
        addl      %eax, %esi
        movl      %ebx, %eax
        shrl      $2, %eax
        xorl      %ebx, %eax
        addl      %eax, %esi
        movl      %esi, 200(%rsp)
        xorl      %esi, %r12d                                   # Inserted from below #  xorl	%r12d, %esi
        subl      136(%rsp), %ecx
        addl      %r14d, %ecx
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
        movl      %r9d, 204(%rsp)
        xorl      %r9d, %r12d                                   # Inserted from below # xorl	%r9d, %esi
        addl      %ebx, %edi
        movl      %edi, 92(%rsp)
        addl      %ecx, %r11d
        addl      208(%rsp), %r11d
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
        movl      %r11d, 208(%rsp)
        rorl      $4, %r14d
        leal      0(%r14d,%r15d), %edi
        addl      212(%rsp), %edi
        subl      144(%rsp), %ecx
        addl      %esi, %ecx
        movl      %ecx, 96(%rsp)                                # last ecx
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
        movl      %edi, 212(%rsp)
        xorl      %edi, %r12d                                   # Inserted from below # xorl	%edi, %esi
        addl      %r13d, %r10d
        movl      92(%rsp), %eax
        subl      148(%rsp), %eax
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
        movl      %r10d, 216(%rsp)
        xorl      %r10d, %r12d                                  # Inserted from below # xorl	%r10d, %esi
        rorl      $3, %r15d
        addl      %r15d, %r8d
        rorl      $4, %r14d                                     # carry the rotation of 9
        addl      %r14d, %r8d
        xorl      208(%rsp), %r12d                              # # Inserted from below # load it
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
        movl      %r8d, 220(%rsp)
        movl      224(%rsp), %ecx
        subl      152(%rsp), %ecx
        addl      %edx, %ecx
        rorl      $3, %r13d
        addl      %r13d, %ecx
        rorl      $4, %ebx
        addl      %ebx, %ecx
        addl      96(%rsp), %ecx
        rorl      $4, %r9d
        addl      %r9d, %ecx
        addl      208(%rsp), %ecx                               # load it
        movl      228(%rsp), %edx
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
        movl      %ecx, 224(%rsp)
        subl      156(%rsp), %edx
        rorl      $3, %r15d
        addl      %r15d, %edx
        rorl      $3, %r14d
        addl      %r14d, %edx
        rorl      $4, %esi                                      # carry the rotation of 9
        addl      %esi, %edx
        addl      100(%rsp), %edx
        movdqa    184(%rsp), %xmm5
        rorl      $5, %r10d
        rorl      $4, %r11d
        addl      %r11d, %edx
        movdqa    376(%rsp), %xmm0                              # 376(%rsp)
        addl      %r10d, %edx
        movl      %r8d, %eax
        shrl      %eax
        xorl      %r8d, %eax
        addl      %eax, %edx
        movl      %ecx, %eax
        shrl      $2, %eax
        pxor      (%rbp), %xmm0
        palignr   $12, %xmm5, %xmm7
        xorl      %ecx, %eax
        addl      %eax, %edx
        movl      %edx, 228(%rsp)
        xorl      %r12d, %r8d
        xorl      %r8d, %ecx
        xorl      %edx, %ecx
        movq      %rcx, 472(%rsp)
        movq      472(%rsp), %xmm4
        pshufd    $0, %xmm4, %xmm4
        movl      %ecx, %ebx
        sall      $5, %ecx
        movl      %ecx, 408(%rsp)
        sall      %ecx
        movl      %ecx, 428(%rsp)
        shrl      %ebx
        movl      %ebx, 420(%rsp)
        shrl      $2, %ebx
        movl      %ebx, 424(%rsp)
        shrl      %ebx
        movl      %ebx, 432(%rsp)
        shrl      %ebx
        movl      %ebx, 416(%rsp)
        pxor      16(%rbp), %xmm1
        movdqa    200(%rsp), %xmm2
        pxor      %xmm2, %xmm14
        shrl      $2, %ebx
        movl      %ebx, 412(%rsp)
        shrl      $4, %ebx
        movl      %ebx, 436(%rsp)
        pxor      408(%rsp), %xmm0
        movdqa    216(%rsp), %xmm3
        paddd     %xmm14, %xmm0
        pxor      %xmm3, %xmm13
        movdqa    %xmm0, 312(%rsp)
        pxor      424(%rsp), %xmm1
        pxor      32(%rbp), %xmm2
        pxor      %xmm7, %xmm12
        pxor      440(%rsp), %xmm12
        movl      312(%rsp), %edi
        paddd     %xmm13, %xmm1
        pxor      48(%rbp), %xmm3
        pxor      %xmm4, %xmm2
        movdqa    %xmm1, 328(%rsp)
        paddd     %xmm2, %xmm12
        addq      $64, %rbp
        palignr   $12, %xmm6, %xmm5
        movl      336(%rsp), %ebx
        movdqa    %xmm12, 344(%rsp)
        movl      328(%rsp), %eax
        pxor      %xmm5, %xmm11
        pxor      456(%rsp), %xmm11
        pxor      %xmm4, %xmm3
        paddd     %xmm3, %xmm11
        movdqa    %xmm11, 360(%rsp)
        rorl      $23, %eax
        addl      %eax, 344(%rsp)
        movl      332(%rsp), %ecx
        rorl      $22, %ecx
        addl      %ecx, 348(%rsp)
        rorl      $21, %ebx
        addl      %ebx, 352(%rsp)
        movl      340(%rsp), %esi
        rorl      $20, %esi
        addl      %esi, 356(%rsp)
        rorl      $19, %edi
        addl      %edi, 360(%rsp)
        movl      316(%rsp), %ecx
        rorl      $18, %ecx
        addl      %ecx, 364(%rsp)
        movl      320(%rsp), %ebx
        rorl      $17, %ebx
        addl      %ebx, 368(%rsp)
        movl      324(%rsp), %esi
        rorl      $16, %esi
        addl      %esi, 372(%rsp)
        cmpq      -40(%rsp), %rbp
        jb        .L2
        .align    16
        movdqa    344(%rsp), %xmm2
        movdqa    328(%rsp), %xmm1
        movdqa    360(%rsp), %xmm3
        movdqa    312(%rsp), %xmm0
        movq      -32(%rsp), %rbx                               # = 16(%rdx)
        movdqa    %xmm0, (%rbx)
        movdqa    %xmm1, 16(%rbx)
        movdqa    %xmm2, 32(%rbx)
        movdqa    %xmm3, 48(%rbx)
        addq      $512, %rsp
        popq      %rbx
        popq      %rbp
        popq      %r12
        popq      %r13
        popq      %r14
        popq      %r15
        ret
.LFE584:
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
.LC12:
        .quad     6533221836532307280
        .quad     7301836170252517370
        .align    16
.LC13:
        .quad     8070450503972727460
        .quad     8839064837692937550
        .align    16
.LC14:
        .quad     -8839064902296403976
        .quad     -8070450568576193886
        .align    16
.LC15:
        .quad     -7301836234855983796
        .quad     -6533221901135773706
        .align    16
.LC16:
        .quad     -1
        .quad     -4294967295
        .align    16
.LC17:
        .quad     -4294967295
        .quad     -4294967295
        .align    16
.LC18:
        .quad     4294967297
        .quad     -1
        .align    16
.LC19:
        .quad     -4294967295
        .quad     -1
        .align    16
.LC20:
        .quad     4294967297
        .quad     -4294967295
        .align    16
.LC21:
        .quad     8589934591
        .quad     -1
        .align    16
.LC22:
        .quad     8589934591
        .quad     -4294967295
        .align    16
.LC23:
        .quad     8589934591
        .quad     8589934591
        .align    16
.LC24:
        .quad     -4294967295
        .quad     8589934591
        .align    16
.LC33:
        .quad     361421592464458498
        .quad     940142975169071882
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
        .ident    "GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
        .section  .note.GNU-stack,"",@progbits
