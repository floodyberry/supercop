	.file     "Compress256_sse_31.c"
	.text
..TXTST0:
	.align    16,0x90
	.globl    Compress256
	Compress256:
..B1.1:                          # Preds ..B1.0
	pushl     %ebx                         #271.1
	movl      %esp, %ebx                   #271.1
	andl      $-128, %esp                  #271.1
	pushl     %ebp                         #271.1
	pushl     %ebp                         #271.1
	movl      8(%ebx), %eax                #270.6
	movl      16(%ebx), %ecx               #270.6
	movdqa    16(%ecx), %xmm7              #373.49
	movl      4(%ebx), %ebp                #271.1
	movl      %ebp, 4(%esp)                #271.1
	movl      %esp, %ebp                   #271.1
	subl      $1016, %esp                  #271.1
	movdqa    %xmm7, -760(%ebp)            #374.19
	movl      %edi, -816(%ebp)             #
	movdqa    32(%ecx), %xmm7              #377.29
	movl      %esi, -812(%ebp)             #
	movdqa    %xmm7, -744(%ebp)            #378.19
	movdqa    48(%ecx), %xmm7              #379.29
	movdqa    %xmm7, -728(%ebp)            #380.19
	movdqa    64(%ecx), %xmm7              #381.29
	movdqa    %xmm7, -712(%ebp)            #382.19
	.align    16
..B1.2:                          # Preds ..B1.8 ..B1.1
	movl      (%eax), %edx                 #401.3
	movdqa    -760(%ebp), %xmm0            #391.53
	movl      12(%eax), %edi               #401.3
	movdqa    -744(%ebp), %xmm1            #392.53
	roll      $4, %edi                     #401.12
	roll      $1, %edx                     #401.12
	movl      %edi, -876(%ebp)             #401.3
	movl      4(%eax), %ecx                #401.3
	movl      36(%eax), %edi               #499.12
	movdqa    (%eax), %xmm4                #391.80
	roll      $2, %ecx                     #401.12
	movl      %ecx, -884(%ebp)             #401.3
	roll      $10, %edi                    #499.12
	movdqa    48(%eax), %xmm6              #394.80
	pxor      %xmm0, %xmm4                 #391.23
	movdqa    16(%eax), %xmm3              #392.80
	movl      %edi, -852(%ebp)             #499.3
	movdqa    %xmm0, -696(%ebp)            #391.53
	movdqa    %xmm4, %xmm2                 #399.23
	movl      20(%eax), %ecx               #412.12
	movl      60(%eax), %edi               #523.12
	movdqa    32(%eax), %xmm5              #393.80
	movl      %eax, -296(%ebp)             #800.3
	movl      %edx, -888(%ebp)             #401.3
	roll      $16, %edi                    #523.12
	movdqa    %xmm1, -776(%ebp)            #392.53
	movl      %edi, -828(%ebp)             #523.3
	movl      8(%eax), %esi                #401.3
	movdqa    -728(%ebp), %xmm0            #393.53
	pxor      %xmm0, %xmm5                 #393.23
	pxor      %xmm1, %xmm3                 #392.23
	movdqa    %xmm0, -792(%ebp)            #393.53
	movl      16(%eax), %edx               #412.12
	movdqa    -712(%ebp), %xmm1            #394.53
	roll      $6, %ecx                     #412.12
	roll      $5, %edx                     #412.12
	movdqa    %xmm5, %xmm0                 #397.23
	movl      %edx, -872(%ebp)             #412.3
	movdqa    %xmm1, -808(%ebp)            #394.53
	pxor      %xmm1, %xmm6                 #394.23
	movl      28(%eax), %edx               #412.12
	movdqa    %xmm3, %xmm1                 #396.23
	palignr   $4, %xmm3, %xmm0             #397.23
	movl      %ecx, -868(%ebp)             #412.3
	movl      32(%eax), %ecx               #499.12
	palignr   $4, %xmm4, %xmm1             #396.23
	roll      $8, %edx                     #412.12
	movl      %edx, -860(%ebp)             #412.3
	roll      $9, %ecx                     #499.12
	movdqa    %xmm6, %xmm7                 #398.23
	movl      40(%eax), %edx               #499.12
	roll      $3, %esi                     #401.12
	movl      %ecx, -856(%ebp)             #499.3
	movdqa    %xmm0, -552(%ebp)            #397.23
	movl      %esi, -880(%ebp)             #401.3
	movl      44(%eax), %ecx               #499.12
	movl      24(%eax), %esi               #412.12
	movdqa    %xmm1, -568(%ebp)            #396.23
	palignr   $4, %xmm5, %xmm7             #398.23
	palignr   $4, %xmm6, %xmm2             #399.23
	movdqa    %xmm2, -520(%ebp)            #399.23
	movdqa    %xmm3, %xmm2                 #405.23
	palignr   $8, %xmm4, %xmm2             #405.23
	movdqa    %xmm7, -536(%ebp)            #398.23
	palignr   $8, %xmm6, %xmm4             #408.23
	roll      $7, %esi                     #412.12
	movdqa    %xmm2, -504(%ebp)            #405.23
	movdqa    %xmm5, %xmm2                 #406.23
	palignr   $8, %xmm3, %xmm2             #406.23
	movdqa    %xmm6, %xmm3                 #407.23
	movdqa    %xmm2, -488(%ebp)            #406.23
	movl      %esi, -864(%ebp)             #412.3
	movdqa    -520(%ebp), %xmm6            #431.23
	movl      48(%eax), %esi               #523.12
	movdqa    .LC59, %xmm2                 #410.26
	palignr   $8, %xmm5, %xmm3             #407.23
	psignd    %xmm2, %xmm3                 #410.26
	movdqa    %xmm7, %xmm5                 #430.23
	movdqa    %xmm4, -472(%ebp)            #408.23
	movdqa    %xmm0, %xmm4                 #429.23
	palignr   $8, %xmm1, %xmm4             #429.23
	palignr   $8, %xmm0, %xmm5             #430.23
	movdqa    %xmm6, %xmm0                 #431.23
	psignd    %xmm2, %xmm5                 #437.19
	psubd     %xmm3, %xmm5                 #441.11
	palignr   $8, %xmm7, %xmm0             #431.23
	movdqa    .LC61, %xmm7                 #436.19
	palignr   $8, %xmm6, %xmm1             #432.23
	psignd    %xmm7, %xmm4                 #436.19
	psignd    .LC64, %xmm1                 #439.19
	psignd    %xmm2, %xmm0                 #438.19
	psubd     %xmm3, %xmm4                 #442.11
	movdqa    -552(%ebp), %xmm3            #516.11
	movdqa    -472(%ebp), %xmm2            #519.26
	roll      $12, %ecx                    #499.12
	movdqa    %xmm4, -456(%ebp)            #442.11
	movdqa    -536(%ebp), %xmm4            #546.32
	paddd     %xmm3, %xmm5                 #516.11
	movl      %ecx, -844(%ebp)             #499.3
	psignd    .LC60, %xmm2                 #519.26
	psignd    %xmm7, %xmm4                 #546.32
	movl      56(%eax), %ecx               #523.12
	paddd     %xmm4, %xmm0                 #546.11
	paddd     %xmm6, %xmm5                 #517.11
	psubd     %xmm2, %xmm0                 #547.11
	roll      $11, %edx                    #499.12
	paddd     %xmm2, %xmm5                 #520.11
	roll      $15, %ecx                    #523.12
	movl      %edx, -848(%ebp)             #499.3
	movdqa    .LC63, %xmm2                 #549.32
	psignd    %xmm2, %xmm6                 #566.33
	movl      52(%eax), %edx               #523.12
	movdqa    -568(%ebp), %xmm7            #548.32
	movdqa    .LC62, %xmm4                 #548.32
	roll      $13, %esi                    #523.12
	movl      %ecx, -832(%ebp)             #523.3
	paddd     %xmm6, %xmm1                 #566.11
	movl      %esi, -840(%ebp)             #523.3
	roll      $14, %edx                    #523.12
	movaps    %xmm5, -440(%ebp)            #520.11
	movl      %edx, -836(%ebp)             #523.3
	psignd    %xmm4, %xmm7                 #548.32
	paddd     %xmm7, %xmm0                 #548.11
	movdqa    -504(%ebp), %xmm7            #549.32
	movdqa    -568(%ebp), %xmm6            #584.32
	movdqa    %xmm7, %xmm5                 #549.32
	psignd    %xmm2, %xmm5                 #549.32
	psignd    %xmm4, %xmm7                 #567.32
	paddd     %xmm7, %xmm1                 #567.11
	paddd     %xmm5, %xmm0                 #549.11
	movdqa    .LC60, %xmm4                 #568.32
	psignd    %xmm2, %xmm6                 #584.32
	movdqa    -456(%ebp), %xmm2            #584.11
	paddd     %xmm6, %xmm2                 #584.11
	movaps    -440(%ebp), %xmm6            #630.23
	movdqa    -488(%ebp), %xmm7            #569.32
	psignd    %xmm4, %xmm3                 #568.32
	psubd     %xmm3, %xmm1                 #568.11
	movdqa    %xmm7, %xmm3                 #569.32
	psignd    .LC65, %xmm7                 #585.32
	paddd     %xmm7, %xmm2                 #585.11
	psignd    .LC61, %xmm3                 #569.32
	psubd     %xmm3, %xmm1                 #569.11
	movdqa    -536(%ebp), %xmm3            #586.32
	psignd    %xmm4, %xmm3                 #586.32
	movdqa    %xmm6, %xmm7                 #631.23
	movl      $0, -308(%ebp)               #1411.3
	movdqa    %xmm1, %xmm5                 #628.23
	shufps    $206, %xmm0, %xmm7           #631.23
	movdqa    %xmm6, %xmm4                 #630.23
	shufps    $148, %xmm0, %xmm4           #630.23
	psubd     %xmm3, %xmm2                 #586.11
	movdqa    %xmm1, %xmm3                 #629.23
	shufps    $148, %xmm2, %xmm5           #628.23
	shufps    $206, %xmm2, %xmm3           #629.23
	movaps    %xmm4, %xmm2                 #633.23
	shufps    $200, %xmm3, %xmm2           #633.23
	shufps    $253, %xmm1, %xmm4           #634.23
	movaps    %xmm2, %xmm1                 #645.15
	pslld     $3, %xmm1                    #645.15
	psrld     $1, %xmm2                    #645.15
	shufps    $172, %xmm3, %xmm7           #635.23
	movdqa    %xmm1, %xmm3                 #645.15
	pslld     $1, %xmm1                    #645.15
	pxor      %xmm2, %xmm3                 #645.15
	pxor      %xmm1, %xmm3                 #645.15
	psrld     $12, %xmm2                   #645.15
	shufps    $143, %xmm5, %xmm6           #636.23
	pslld     $15, %xmm1                   #645.15
	pxor      %xmm2, %xmm3                 #645.15
	pxor      %xmm1, %xmm3                 #645.15
	psrld     $15, %xmm2                   #645.15
	xorps     %xmm2, %xmm3                 #645.15
	movaps    %xmm4, %xmm2                 #653.15
	shufps    $208, %xmm5, %xmm0           #637.23
	pslld     $2, %xmm2                    #653.15
	movdqa    %xmm2, %xmm5                 #653.15
	psrld     $1, %xmm4                    #653.15
	pxor      %xmm4, %xmm5                 #653.15
	pslld     $6, %xmm2                    #653.15
	psrld     $8, %xmm4                    #653.15
	pxor      %xmm2, %xmm5                 #653.15
	pslld     $15, %xmm2                   #653.15
	pxor      %xmm4, %xmm5                 #653.15
	pxor      %xmm2, %xmm5                 #653.15
	psrld     $15, %xmm4                   #653.15
	pxor      %xmm4, %xmm5                 #653.15
	movaps    %xmm7, %xmm4                 #662.15
	psrld     $2, %xmm7                    #662.15
	pslld     $1, %xmm4                    #662.15
	movdqa    %xmm4, %xmm1                 #662.15
	pxor      %xmm7, %xmm1                 #662.15
	psrld     $5, %xmm7                    #662.15
	movaps    %xmm3, %xmm2                 #684.23
	movlhps   %xmm5, %xmm2                 #684.23
	shufps    $239, %xmm3, %xmm5           #685.23
	pslld     $11, %xmm4                   #662.15
	pxor      %xmm4, %xmm1                 #662.15
	pslld     $13, %xmm4                   #662.15
	pxor      %xmm7, %xmm1                 #662.15
	pxor      %xmm4, %xmm1                 #662.15
	psrld     $13, %xmm7                   #662.15
	pxor      %xmm7, %xmm1                 #662.15
	movaps    %xmm6, %xmm7                 #671.15
	psrld     $2, %xmm6                    #671.15
	pslld     $2, %xmm7                    #671.15
	movdqa    %xmm7, %xmm4                 #671.15
	pxor      %xmm6, %xmm4                 #671.15
	pslld     $13, %xmm7                   #671.15
	pxor      %xmm7, %xmm4                 #671.15
	psrld     $1, %xmm6                    #671.15
	pxor      %xmm6, %xmm4                 #671.15
	pslld     $14, %xmm7                   #671.15
	pxor      %xmm7, %xmm4                 #671.15
	movdqa    -712(%ebp), %xmm7            #759.27
	psrld     $14, %xmm6                   #671.15
	pxor      %xmm6, %xmm4                 #671.15
	movaps    %xmm0, %xmm6                 #680.15
	psrld     $1, %xmm6                    #680.15
	xorps     %xmm0, %xmm6                 #680.15
	movdqa    %xmm1, %xmm0                 #687.23
	shufps    $197, %xmm6, %xmm1           #688.23
	shufps    $210, %xmm2, %xmm1           #693.23
	shufps    $204, %xmm4, %xmm0           #687.23
	shufps    $238, %xmm6, %xmm4           #689.23
	shufps    $255, %xmm3, %xmm6           #690.23
	shufps    $136, %xmm0, %xmm2           #694.11
	movl      $0, -308(%ebp)               #1251.3
	shufps    $141, %xmm6, %xmm0           #696.11
	shufps    $40, %xmm5, %xmm4            #695.11
	shufps    $120, %xmm1, %xmm1           #697.11
	movdqa    -760(%ebp), %xmm3            #759.27
	movdqa    -728(%ebp), %xmm6            #760.23
	movdqa    %xmm3, %xmm5                 #759.27
	palignr   $4, %xmm7, %xmm5             #759.27
	movdqa    %xmm5, -424(%ebp)            #759.27
	palignr   $4, %xmm6, %xmm7             #760.23
	movdqa    -744(%ebp), %xmm5            #761.23
	paddd     %xmm7, %xmm4                 #767.22
	palignr   $4, %xmm5, %xmm6             #761.23
	movaps    %xmm4, -584(%ebp)            #800.3
	paddd     %xmm6, %xmm1                 #766.22
	movaps    %xmm1, -664(%ebp)            #800.3
	paddd     -424(%ebp), %xmm0            #768.22
	movdqa    %xmm1, -1000(%ebp)           #774.20
	movdqa    %xmm4, -984(%ebp)            #780.20
	palignr   $4, %xmm3, %xmm5             #762.23
	pxor      %xmm3, %xmm3                 #794.33
	paddd     %xmm5, %xmm2                 #765.22
	movdqa    %xmm0, -968(%ebp)            #786.20
	movdqa    %xmm2, -1016(%ebp)           #770.20
	punpckhqdq    %xmm2, %xmm3             #794.33
	paddd     %xmm1, %xmm3                 #795.24
	paddd     %xmm4, %xmm3                 #796.24
	paddd     %xmm0, %xmm3                 #797.24
	pshufd    $120, %xmm3, %xmm5           #798.32
	phaddd    %xmm5, %xmm5                 #799.24
	movl      -968(%ebp), %edx             #1063.12
	movq      %xmm5, -248(%ebp)            #800.3
	movaps    %xmm1, %xmm4                 #845.26
	movaps    %xmm2, -680(%ebp)            #800.3
	movaps    %xmm0, -648(%ebp)            #800.3
	movaps    %xmm2, %xmm7                 #845.26
	movl      -960(%ebp), %esi             #1064.13
	movaps    %xmm7, %xmm1                 #845.26
	punpcklqdq    %xmm4, %xmm1             #845.26
	movdqa    %xmm1, %xmm5                 #846.26
	pslld     $2, %xmm5                    #846.26
	movl      %edx, -292(%ebp)             #1063.12
	movl      %esi, %ecx                   #1066.12
	movl      %esi, %edi                   #1064.13
	roll      $19, %ecx                    #1066.12
	movl      %esi, -252(%ebp)             #1064.13
	psrld     $1, %xmm1                    #846.26
	roll      $13, %esi                    #1072.12
	movdqa    %xmm5, %xmm3                 #846.26
	pxor      %xmm1, %xmm3                 #846.26
	movl      %ecx, -164(%ebp)             #1066.12
	psrld     $8, %xmm1                    #846.26
	roll      $19, %edx                    #1063.12
	roll      $23, %edi                    #1064.13
	addl      %edi, %edx                   #1064.3
	pslld     $6, %xmm5                    #846.26
	pxor      %xmm5, %xmm3                 #846.26
	pxor      %xmm1, %xmm3                 #846.26
	pslld     $15, %xmm5                   #846.26
	pxor      %xmm5, %xmm3                 #846.26
	movl      %edx, -168(%ebp)             #1064.3
	movaps    %xmm7, %xmm0                 #847.26
	psrld     $15, %xmm1                   #846.26
	punpckhqdq    %xmm4, %xmm0             #847.26
	pxor      %xmm1, %xmm3                 #846.26
	movdqa    %xmm0, %xmm2                 #848.46
	pslld     $2, %xmm2                    #848.46
	psrld     $2, %xmm0                    #848.46
	movdqa    %xmm2, %xmm5                 #848.46
	pslld     $13, %xmm2                   #848.46
	pxor      %xmm0, %xmm5                 #848.46
	movl      -956(%ebp), %ecx             #1087.26
	movl      %ecx, %edx                   #1087.26
	roll      $16, %edx                    #1087.26
	pxor      %xmm2, %xmm5                 #848.46
	psrld     $1, %xmm0                    #848.46
	pxor      %xmm0, %xmm5                 #848.46
	movl      %esi, -160(%ebp)             #1072.12
	movl      -964(%ebp), %esi             #1086.26
	movl      %esi, %eax                   #1086.26
	roll      $13, %eax                    #1086.26
	lea       (%eax,%edx), %edi            #1089.3
	roll      $6, %eax                     #1094.16
	pslld     $14, %xmm2                   #848.46
	pxor      %xmm2, %xmm5                 #848.46
	movaps    -584(%ebp), %xmm2            #853.26
	psrld     $14, %xmm0                   #848.46
	pxor      %xmm0, %xmm5                 #848.46
	movaps    -648(%ebp), %xmm0            #853.26
	paddd     %xmm5, %xmm3                 #848.18
	movaps    %xmm2, %xmm5                 #853.26
	punpcklqdq    %xmm0, %xmm5             #853.26
	movdqa    %xmm5, %xmm6                 #854.46
	pslld     $2, %xmm6                    #854.46
	psrld     $1, %xmm5                    #854.46
	movl      %ecx, -240(%ebp)             #1087.26
	movdqa    %xmm6, %xmm1                 #854.46
	movl      %edi, -156(%ebp)             #1089.3
	pxor      %xmm5, %xmm1                 #854.46
	psrld     $8, %xmm5                    #854.46
	movl      %esi, -268(%ebp)             #1086.26
	roll      $7, %edx                     #1095.16
	addl      %edx, %eax                   #1097.3
	roll      $22, %edx                    #1101.16
	pslld     $6, %xmm6                    #854.46
	pxor      %xmm6, %xmm1                 #854.46
	pxor      %xmm5, %xmm1                 #854.46
	pslld     $15, %xmm6                   #854.46
	pxor      %xmm6, %xmm1                 #854.46
	psrld     $15, %xmm5                   #854.46
	pxor      %xmm5, %xmm1                 #854.46
	paddd     %xmm1, %xmm3                 #854.18
	movaps    %xmm2, %xmm6                 #855.26
	movl      %ecx, %edi                   #1111.13
	punpckhqdq    %xmm0, %xmm6             #855.26
	roll      $27, %edi                    #1111.13
	movdqa    %xmm6, %xmm5                 #856.46
	movl      %edx, -148(%ebp)             #1101.16
	pslld     $2, %xmm5                    #856.46
	psrld     $2, %xmm6                    #856.46
	movdqa    %xmm5, %xmm1                 #856.46
	pxor      %xmm6, %xmm1                 #856.46
	movl      %eax, -152(%ebp)             #1097.3
	pslld     $13, %xmm5                   #856.46
	movl      -972(%ebp), %eax             #1112.13
	pxor      %xmm5, %xmm1                 #856.46
	psrld     $1, %xmm6                    #856.46
	pxor      %xmm6, %xmm1                 #856.46
	movl      %esi, %edx                   #1110.12
	roll      $23, %edx                    #1110.12
	addl      %edi, %edx                   #1111.3
	movl      %ecx, %edi                   #1116.12
	roll      $19, %edi                    #1116.12
	pslld     $14, %xmm5                   #856.46
	pxor      %xmm5, %xmm1                 #856.46
	psrld     $14, %xmm6                   #856.46
	pxor      %xmm6, %xmm1                 #856.46
	paddd     %xmm1, %xmm3                 #856.18
	movaps    %xmm4, %xmm6                 #861.22
	palignr   $4, %xmm7, %xmm6             #861.22
	movl      %eax, -272(%ebp)             #1112.13
	roll      $19, %eax                    #1112.13
	addl      %eax, %edx                   #1112.3
	movl      %edi, -144(%ebp)             #1116.12
	roll      $3, %esi                     #1129.12
	movaps    %xmm2, %xmm5                 #862.22
	palignr   $4, %xmm4, %xmm5             #862.22
	movdqa    %xmm6, %xmm4                 #863.26
	movdqa    %xmm5, -408(%ebp)            #862.22
	punpcklqdq    %xmm5, %xmm4             #863.26
	movdqa    %xmm4, %xmm7                 #864.46
	pslld     $1, %xmm7                    #864.46
	psrld     $2, %xmm4                    #864.46
	roll      $7, %ecx                     #1130.13
	addl      %ecx, %esi                   #1130.3
	movdqa    %xmm7, %xmm1                 #864.46
	pxor      %xmm4, %xmm1                 #864.46
	pslld     $11, %xmm7                   #864.46
	pxor      %xmm7, %xmm1                 #864.46
	psrld     $5, %xmm4                    #864.46
	punpckhqdq    %xmm5, %xmm6             #865.26
	pxor      %xmm4, %xmm1                 #864.46
	pslld     $13, %xmm7                   #864.46
	pxor      %xmm7, %xmm1                 #864.46
	psrld     $13, %xmm4                   #864.46
	pxor      %xmm4, %xmm1                 #864.46
	paddd     %xmm1, %xmm3                 #864.18
	movdqa    %xmm6, %xmm7                 #866.46
	movdqa    -888(%ebp), %xmm1            #921.39
	psrld     $1, %xmm6                    #866.46
	pslld     $3, %xmm7                    #866.46
	movdqa    %xmm7, %xmm5                 #866.46
	movl      %esi, -288(%ebp)             #1130.3
	pxor      %xmm6, %xmm5                 #866.46
	pslld     $1, %xmm7                    #866.46
	pxor      %xmm7, %xmm5                 #866.46
	psrld     $12, %xmm6                   #866.46
	pxor      %xmm6, %xmm5                 #866.46
	pslld     $15, %xmm7                   #866.46
	pxor      %xmm7, %xmm5                 #866.46
	psrld     $15, %xmm6                   #866.46
	pxor      %xmm6, %xmm5                 #866.46
	paddd     %xmm5, %xmm3                 #866.18
	movaps    %xmm0, %xmm5                 #870.22
	palignr   $4, %xmm2, %xmm5             #870.22
	pxor      %xmm7, %xmm7                 #871.22
	palignr   $4, %xmm0, %xmm7             #871.22
	movdqa    %xmm5, %xmm0                 #872.26
	punpcklqdq    %xmm7, %xmm0             #872.26
	movdqa    %xmm0, %xmm2                 #873.46
	pslld     $1, %xmm2                    #873.46
	movdqa    %xmm2, %xmm6                 #873.46
	psrld     $2, %xmm0                    #873.46
	pslld     $11, %xmm2                   #873.46
	pxor      %xmm0, %xmm6                 #873.46
	psrld     $5, %xmm0                    #873.46
	pxor      %xmm2, %xmm6                 #873.46
	pxor      %xmm0, %xmm6                 #873.46
	psrld     $13, %xmm0                   #873.46
	pslld     $13, %xmm2                   #873.46
	pxor      %xmm2, %xmm6                 #873.46
	pxor      %xmm0, %xmm6                 #873.46
	paddd     %xmm6, %xmm3                 #873.18
	movdqa    -872(%ebp), %xmm6            #922.39
	movdqa    %xmm5, %xmm0                 #874.24
	punpckhqdq    %xmm7, %xmm0             #874.24
	movdqa    %xmm0, %xmm2                 #875.46
	psrld     $1, %xmm0                    #875.46
	pslld     $3, %xmm2                    #875.46
	movdqa    %xmm2, %xmm4                 #875.46
	pslld     $1, %xmm2                    #875.46
	pxor      %xmm0, %xmm4                 #875.46
	movdqa    %xmm6, %xmm7                 #927.23
	pxor      %xmm2, %xmm4                 #875.46
	psrld     $12, %xmm0                   #875.46
	pxor      %xmm0, %xmm4                 #875.46
	psrld     $15, %xmm0                   #875.46
	pslld     $15, %xmm2                   #875.46
	pxor      %xmm2, %xmm4                 #875.46
	pxor      %xmm0, %xmm4                 #875.46
	movdqa    -840(%ebp), %xmm0            #924.39
	paddd     %xmm4, %xmm3                 #875.18
	pshufd    $120, %xmm3, %xmm2           #881.26
	pxor      %xmm3, %xmm3                 #882.23
	phaddd    %xmm3, %xmm2                 #882.23
	movdqa    %xmm1, %xmm3                 #926.23
	movdqa    %xmm2, -392(%ebp)            #882.23
	palignr   $12, %xmm1, %xmm7            #927.23
	movdqa    %xmm7, -376(%ebp)            #927.23
	movdqa    -856(%ebp), %xmm7            #928.23
	palignr   $12, %xmm0, %xmm3            #926.23
	movdqa    %xmm7, %xmm4                 #928.23
	paddd     %xmm0, %xmm3                 #935.14
	palignr   $12, %xmm6, %xmm4            #928.23
	movdqa    %xmm4, -360(%ebp)            #928.23
	paddd     .LC58, %xmm3                 #939.14
	palignr   $12, %xmm7, %xmm0            #951.23
	movdqa    -696(%ebp), %xmm4            #947.24
	movdqa    %xmm7, %xmm2                 #930.23
	palignr   $8, %xmm6, %xmm2             #930.23
	psubd     %xmm2, %xmm3                 #943.14
	movdqa    -776(%ebp), %xmm2            #947.24
	palignr   $12, %xmm4, %xmm2            #947.24
	pxor      %xmm2, %xmm3                 #948.14
	movdqa    %xmm3, -600(%ebp)            #948.14
	movdqa    %xmm3, -904(%ebp)            #949.20
	paddd     %xmm7, %xmm0                 #957.14
	paddd     .LC57, %xmm0                 #962.14
	movdqa    %xmm6, %xmm3                 #952.23
	movdqa    %xmm5, %xmm7                 #973.38
	pslld     $3, %xmm7                    #973.38
	palignr   $8, %xmm1, %xmm3             #952.23
	psubd     %xmm3, %xmm0                 #966.14
	movdqa    -808(%ebp), %xmm3            #969.24
	palignr   $12, %xmm3, %xmm4            #969.24
	pxor      %xmm4, %xmm0                 #970.14
	movdqa    %xmm5, %xmm4                 #973.38
	psrld     $29, %xmm4                   #973.38
	por       %xmm7, %xmm4                 #973.38
	paddd     %xmm4, %xmm0                 #973.14
	movaps    -584(%ebp), %xmm4            #974.22
	movaps    -648(%ebp), %xmm7            #974.22
	palignr   $12, %xmm4, %xmm7            #974.22
	palignr   $12, -664(%ebp), %xmm4       #1041.22
	movdqa    %xmm7, -344(%ebp)            #974.22
	movdqa    %xmm7, %xmm2                 #976.38
	pslld     $7, %xmm7                    #976.38
	psrld     $25, %xmm2                   #976.38
	por       %xmm7, %xmm2                 #976.38
	paddd     %xmm2, %xmm0                 #976.14
	movdqa    -376(%ebp), %xmm2            #984.14
	paddd     %xmm1, %xmm2                 #984.14
	movq      -848(%ebp), %xmm1            #992.57
	paddd     .LC55, %xmm2                 #988.14
	movdqa    %xmm0, -328(%ebp)            #976.14
	movdqa    %xmm0, -920(%ebp)            #977.20
	movhpd    -840(%ebp), %xmm1            #992.38
	psubd     %xmm1, %xmm2                 #992.14
	movdqa    -792(%ebp), %xmm1            #997.24
	movdqa    %xmm1, %xmm0                 #997.24
	palignr   $12, -776(%ebp), %xmm0       #997.24
	pxor      %xmm0, %xmm2                 #998.14
	paddd     -392(%ebp), %xmm2            #1001.14
	movdqa    -360(%ebp), %xmm0            #1022.14
	movdqa    %xmm2, -952(%ebp)            #1002.20
	addl      -944(%ebp), %edx             #1140.3
	movdqa    %xmm2, %xmm7                 #1002.20
	movd      %xmm2, %edi                  #1127.12
	movl      %edi, %eax                   #1131.12
	lea       (,%edi,8), %ecx              #1131.12
	roll      $19, %eax                    #1131.12
	paddd     %xmm6, %xmm0                 #1022.14
	psrldq    $4, %xmm7                    #1002.20
	movq      -832(%ebp), %xmm6            #1031.57
	movhpd    -888(%ebp), %xmm6            #1031.38
	paddd     .LC56, %xmm0                 #1027.14
	psubd     %xmm6, %xmm0                 #1031.14
	palignr   $12, %xmm1, %xmm3            #1035.24
	movdqa    -408(%ebp), %xmm1            #1040.38
	pxor      %xmm3, %xmm0                 #1036.14
	movdqa    %xmm1, %xmm3                 #1040.38
	psrld     $29, %xmm3                   #1040.38
	pslld     $3, %xmm1                    #1040.38
	por       %xmm1, %xmm3                 #1040.38
	paddd     %xmm3, %xmm0                 #1040.14
	movl      %edi, %esi                   #1131.12
	movl      %edi, -216(%ebp)             #1127.12
	shrl      $1, %esi                     #1131.12
	movdqa    %xmm4, %xmm1                 #1043.38
	psrld     $25, %xmm1                   #1043.38
	pslld     $7, %xmm4                    #1043.38
	por       %xmm4, %xmm1                 #1043.38
	movaps    -648(%ebp), %xmm4            #1306.3
	paddd     %xmm1, %xmm0                 #1043.14
	movdqa    %xmm5, %xmm3                 #1045.38
	movl      %ecx, -280(%ebp)             #1131.12
	xorl      %eax, %ecx                   #1131.12
	psrld     $19, %xmm3                   #1045.38
	movl      %eax, -140(%ebp)             #1131.12
	pslld     $13, %xmm5                   #1045.38
	xorl      %esi, %ecx                   #1131.12
	roll      $17, %eax                    #1131.12
	xorl      %edi, %esi                   #1141.13
	por       %xmm5, %xmm3                 #1045.38
	movdqa    -344(%ebp), %xmm5            #1047.38
	xorl      %eax, %ecx                   #1131.12
	addl      -248(%ebp), %esi             #1142.3
	paddd     %xmm3, %xmm0                 #1045.14
	pshufb    .LC66, %xmm5                 #1047.38
	paddd     %xmm5, %xmm0                 #1047.14
	movaps    -680(%ebp), %xmm5            #1306.3
	movdqa    %xmm0, -936(%ebp)            #1049.20
	movd      %xmm7, %eax                  #1134.13
	addl      %ecx, %eax                   #1134.3
	movaps    -584(%ebp), %xmm3            #1306.3
	movdqa    %xmm0, %xmm1                 #1049.20
	movl      %edi, %ecx                   #1135.3
	movl      -996(%ebp), %edi             #1144.13
	psrldq    $8, %xmm1                    #1049.20
	roll      $7, %edi                     #1144.13
	movl      %eax, -220(%ebp)             #1134.3
	xorl      %eax, %ecx                   #1135.3
	movl      %ecx, -172(%ebp)             #1135.3
	movl      -996(%ebp), %ecx             #1144.13
	movl      %eax, -948(%ebp)             #1136.3
	movl      %ecx, -232(%ebp)             #1144.13
	movl      -988(%ebp), %ecx             #1145.13
	movl      %ecx, -236(%ebp)             #1145.13
	movl      -980(%ebp), %ecx             #1146.13
	movl      %ecx, -264(%ebp)             #1146.13
	movl      %eax, %ecx                   #1142.13
	shrl      $2, %ecx                     #1142.13
	xorl      %eax, %ecx                   #1142.13
	addl      %ecx, %edx                   #1141.3
	movl      -1004(%ebp), %ecx            #1143.13
	roll      $3, %ecx                     #1143.13
	addl      %edi, %ecx                   #1144.3
	addl      %ecx, %esi                   #1143.3
	movl      -988(%ebp), %ecx             #1145.13
	movl      %eax, %edi                   #1158.13
	roll      $27, %edi                    #1158.13
	addl      %esi, %edx                   #1145.3
	movl      -980(%ebp), %esi             #1146.13
	roll      $16, %esi                    #1146.13
	roll      $13, %ecx                    #1145.13
	addl      %esi, %ecx                   #1146.3
	addl      %ecx, %edx                   #1150.3
	xorl      %edx, -172(%ebp)             #1151.3
	movl      %edx, -188(%ebp)             #1150.3
	movl      %edx, -944(%ebp)             #1152.3
	movd      %xmm0, %esi                  #1162.13
	movl      %edx, %ecx                   #1159.13
	shrl      $1, %ecx                     #1159.13
	addl      %edi, %esi                   #1158.3
	xorl      %edx, %ecx                   #1159.13
	movd      %xmm1, %edi                  #1171.14
	movdqa    -600(%ebp), %xmm1            #1306.3
	addl      -152(%ebp), %ecx             #1159.3
	addl      %ecx, %esi                   #1162.3
	movl      %esi, -196(%ebp)             #1162.3
	movl      %eax, %ecx                   #1168.13
	roll      $23, %ecx                    #1168.13
	movl      -1000(%ebp), %esi            #1177.13
	addl      %ecx, %edi                   #1168.3
	addl      -144(%ebp), %edi             #1171.3
	movl      %esi, -228(%ebp)             #1177.13
	movl      -984(%ebp), %esi             #1179.13
	movl      -992(%ebp), %ecx             #1178.13
	movl      %edi, -136(%ebp)             #1171.3
	movl      %ecx, -224(%ebp)             #1178.13
	movl      %eax, %ecx                   #1182.13
	movl      %esi, -260(%ebp)             #1179.13
	movl      -216(%ebp), %esi             #1181.13
	shrl      $1, %ecx                     #1182.13
	movl      -976(%ebp), %edi             #1180.13
	xorl      %eax, %ecx                   #1182.13
	movl      %edx, %eax                   #1183.13
	shrl      $2, %eax                     #1183.13
	addl      -940(%ebp), %ecx             #1176.3
	xorl      %edx, %eax                   #1183.13
	movl      %esi, %edx                   #1181.13
	movl      %edi, -256(%ebp)             #1180.13
	movl      %esi, %edi                   #1181.13
	shrl      $5, %edi                     #1181.13
	shll      $27, %edx                    #1181.13
	orl       %edi, %edx                   #1181.13
	addl      %edx, %eax                   #1177.3
	movl      -1000(%ebp), %edx            #1177.13
	movl      %edi, -276(%ebp)             #1181.13
	roll      $3, %edx                     #1177.13
	addl      -244(%ebp), %edx             #1179.3
	movl      -984(%ebp), %edi             #1179.13
	addl      %eax, %ecx                   #1178.3
	roll      $13, %edi                    #1179.13
	movl      -992(%ebp), %eax             #1178.13
	roll      $7, %eax                     #1178.13
	addl      %edi, %eax                   #1181.3
	movl      -976(%ebp), %edi             #1180.13
	addl      %eax, %edx                   #1180.3
	addl      %edx, %ecx                   #1182.3
	movl      -196(%ebp), %edx             #1204.3
	roll      $16, %edi                    #1180.13
	addl      -168(%ebp), %edi             #1183.3
	addl      %edi, %ecx                   #1186.3
	movl      -172(%ebp), %eax             #1188.3
	movl      %ecx, -176(%ebp)             #1186.3
	xorl      %ecx, %eax                   #1188.3
	movl      -248(%ebp), %edi             #1190.27
	addl      %esi, %edi                   #1190.27
	subl      -1008(%ebp), %edi            #1190.27
	roll      $23, %esi                    #1215.13
	movl      %ecx, -940(%ebp)             #1189.3
	addl      -164(%ebp), %esi             #1218.3
	addl      %edi, %edx                   #1204.3
	movl      %edi, -132(%ebp)             #1190.27
	movl      %ecx, %edi                   #1205.13
	shrl      $2, %edi                     #1205.13
	xorl      %ecx, %edi                   #1205.13
	addl      %edi, %edx                   #1205.3
	movl      -1004(%ebp), %edi            #1209.27
	xorl      %edx, %eax                   #1206.3
	movl      %eax, -172(%ebp)             #1206.3
	movl      %edx, -196(%ebp)             #1205.3
	negl      %edi                         #1209.27
	addl      -220(%ebp), %edi             #1209.27
	addl      -244(%ebp), %edi             #1209.27
	movl      -932(%ebp), %eax             #1221.13
	addl      %edi, %eax                   #1211.3
	movl      %edx, -936(%ebp)             #1207.3
	movl      %edi, -128(%ebp)             #1209.27
	movl      %ecx, %edi                   #1217.13
	shrl      $1, %edi                     #1217.13
	xorl      %ecx, %edi                   #1217.13
	movl      -188(%ebp), %ecx             #1216.13
	addl      %edi, %eax                   #1215.3
	movl      %edx, %edi                   #1218.13
	shrl      $2, %edi                     #1218.13
	xorl      %edx, %edi                   #1218.13
	movl      %ecx, %edx                   #1216.13
	roll      $27, %edx                    #1216.13
	addl      %edx, %edi                   #1216.3
	movl      -172(%ebp), %edx             #1223.3
	addl      %esi, %edi                   #1217.3
	addl      %edi, %eax                   #1221.3
	movl      %eax, -212(%ebp)             #1221.3
	xorl      %eax, %edx                   #1223.3
	movl      -132(%ebp), %edi             #1225.29
	addl      %ecx, %edi                   #1225.29
	subl      -1000(%ebp), %edi            #1225.29
	movl      %eax, -932(%ebp)             #1224.3
	movl      -176(%ebp), %ecx             #1228.13
	movl      %ecx, %esi                   #1228.13
	roll      $27, %esi                    #1228.13
	movl      %edi, -132(%ebp)             #1225.29
	addl      %edi, %esi                   #1227.3
	movl      %eax, %edi                   #1230.13
	shrl      $2, %edi                     #1230.13
	xorl      %eax, %edi                   #1230.13
	addl      %edi, %esi                   #1228.3
	movl      -196(%ebp), %edi             #1229.13
	movl      %edi, %eax                   #1229.13
	shrl      $1, %eax                     #1229.13
	xorl      %edi, %eax                   #1229.13
	addl      -136(%ebp), %eax             #1229.3
	addl      %eax, %esi                   #1230.3
	xorl      %esi, %edx                   #1231.3
	movl      %esi, -200(%ebp)             #1230.3
	movl      %edx, -172(%ebp)             #1231.3
	movl      -128(%ebp), %edx             #1233.27
	addl      %ecx, %edx                   #1233.27
	subl      -996(%ebp), %edx             #1233.27
	movl      -212(%ebp), %ecx             #1241.13
	movl      %esi, -928(%ebp)             #1232.3
	movl      %ecx, %eax                   #1241.13
	shrl      $1, %eax                     #1241.13
	xorl      %ecx, %eax                   #1241.13
	addl      -924(%ebp), %eax             #1238.3
	movl      %edx, -128(%ebp)             #1233.27
	movl      %edi, %ecx                   #1240.13
	roll      $27, %ecx                    #1240.13
	addl      %ecx, %eax                   #1239.3
	movl      %esi, %ecx                   #1242.13
	shrl      $2, %ecx                     #1242.13
	xorl      %esi, %ecx                   #1242.13
	movl      -188(%ebp), %esi             #1239.13
	roll      $23, %esi                    #1239.13
	addl      %esi, %ecx                   #1240.3
	movl      -140(%ebp), %esi             #1242.3
	addl      %edx, %esi                   #1242.3
	addl      %esi, %ecx                   #1241.3
	addl      %ecx, %eax                   #1245.3
	movl      -132(%ebp), %esi             #1248.29
	movl      -172(%ebp), %ecx             #1246.3
	addl      %edi, %esi                   #1248.29
	movl      %eax, -208(%ebp)             #1245.3
	movl      %eax, -924(%ebp)             #1247.3
	xorl      %eax, %ecx                   #1246.3
	movl      %ecx, -312(%ebp)             #1251.3
	movl      %ecx, -172(%ebp)             #1246.3
	movl      %ecx, %edx                   #1256.35
	subl      -992(%ebp), %esi             #1248.29
	shll      $4, %edx                     #1256.35
	movl      %ecx, %eax                   #1260.35
	shrl      $2, %eax                     #1260.35
	movl      %ecx, %edi                   #1257.35
	movl      %esi, -132(%ebp)             #1248.29
	shll      $6, %edi                     #1257.35
	movl      %edi, -624(%ebp)             #1257.3
	movl      %eax, -604(%ebp)             #1260.3
	movl      %edx, -620(%ebp)             #1256.3
	movl      %ecx, %edx                   #1258.35
	movl      %ecx, %edi                   #1262.35
	movq      -312(%ebp), %xmm0            #1252.21
	shll      $8, %edx                     #1258.35
	shrl      $4, %edi                     #1262.35
	movl      %edx, -632(%ebp)             #1258.3
	pshufd    $0, %xmm0, %xmm0             #1253.13
	pxor      %xmm0, %xmm5                 #1448.16
	movl      %ecx, %edx                   #1261.35
	shrl      $3, %edx                     #1261.35
	movl      %edx, -616(%ebp)             #1261.3
	movl      %edi, -612(%ebp)             #1262.3
	movl      -212(%ebp), %eax             #1281.13
	movl      %ecx, %edx                   #1263.35
	shrl      $6, %edx                     #1263.35
	movl      %eax, %edi                   #1281.13
	shrl      $7, %ecx                     #1264.35
	roll      $27, %edi                    #1281.13
	movl      %ecx, -608(%ebp)             #1264.3
	movl      -176(%ebp), %ecx             #1280.13
	movl      %edx, -628(%ebp)             #1263.3
	movl      %ecx, %edx                   #1280.13
	roll      $19, %ecx                    #1283.13
	roll      $23, %edx                    #1280.13
	addl      %edi, %edx                   #1276.3
	movl      -220(%ebp), %edi             #1279.13
	roll      $19, %edi                    #1279.13
	addl      %edi, %edx                   #1279.3
	movl      -156(%ebp), %edi             #1280.3
	addl      %esi, %edi                   #1280.3
	addl      %edi, %edx                   #1281.3
	movl      %eax, %esi                   #1284.13
	movl      -220(%ebp), %edi             #1282.13
	roll      $23, %esi                    #1284.13
	subl      -988(%ebp), %eax             #1292.27
	addl      -128(%ebp), %eax             #1292.27
	roll      $16, %edi                    #1282.13
	addl      -148(%ebp), %edi             #1283.3
	movl      %eax, -284(%ebp)             #1292.27
	addl      %esi, %ecx                   #1282.3
	addl      %edi, %ecx                   #1284.3
	movl      -328(%ebp), %edi             #1289.13
	movl      %ecx, -192(%ebp)             #1284.3
	addl      %edx, %edi                   #1285.3
	movl      -208(%ebp), %ecx             #1286.13
	movl      -200(%ebp), %edx             #1285.13
	movl      %edx, %esi                   #1285.13
	shrl      $1, %esi                     #1285.13
	xorl      %edx, %esi                   #1285.13
	movl      %ecx, %edx                   #1286.13
	shrl      $2, %edx                     #1286.13
	xorl      %ecx, %edx                   #1286.13
	addl      %edx, %esi                   #1286.3
	movl      -916(%ebp), %edx             #1304.13
	addl      %esi, %edi                   #1289.3
	movl      -172(%ebp), %esi             #1290.16
	movl      %edi, -204(%ebp)             #1289.3
	addl      %eax, %edx                   #1294.3
	xorl      %edi, %esi                   #1290.16
	movl      %ecx, %eax                   #1300.13
	shrl      $1, %eax                     #1300.13
	movl      %esi, -184(%ebp)             #1290.16
	movl      %edi, %esi                   #1301.13
	shrl      $2, %esi                     #1301.13
	xorl      %ecx, %eax                   #1300.13
	movl      -216(%ebp), %ecx             #1296.13
	xorl      %edi, %esi                   #1301.13
	roll      $16, %ecx                    #1296.13
	addl      %esi, %edx                   #1296.3
	movl      -196(%ebp), %esi             #1298.13
	roll      $23, %esi                    #1298.13
	movl      %edi, -920(%ebp)             #1291.3
	movl      -200(%ebp), %edi             #1299.13
	roll      $27, %edi                    #1299.13
	addl      %edi, %esi                   #1297.3
	movl      -188(%ebp), %edi             #1297.13
	roll      $19, %edi                    #1297.13
	addl      %eax, %edi                   #1299.3
	addl      -160(%ebp), %ecx             #1301.3
	movl      -132(%ebp), %eax             #1306.3
	addl      %edi, %esi                   #1298.3
	addl      %esi, %edx                   #1300.3
	movl      -260(%ebp), %esi             #1307.29
	addl      %ecx, %edx                   #1304.3
	negl      %esi                         #1307.29
	addl      -200(%ebp), %esi             #1307.29
	movl      -192(%ebp), %ecx             #1306.3
	xorl      %edx, -184(%ebp)             #1305.3
	addl      %eax, %esi                   #1307.29
	movl      -912(%ebp), %eax             #1321.13
	movl      %esi, -260(%ebp)             #1307.29
	movl      %edx, -180(%ebp)             #1304.3
	movl      %edx, -916(%ebp)             #1306.3
	movl      -184(%ebp), %edx             #1306.3
	addl      %ecx, %eax                   #1313.3
	movl      -180(%ebp), %ecx             #1318.13
	movl      %ecx, %edi                   #1318.13
	shrl      $2, %edi                     #1318.13
	xorl      %ecx, %edi                   #1318.13
	addl      %esi, %edi                   #1316.3
	movl      -208(%ebp), %ecx             #1316.13
	addl      %edi, %eax                   #1317.3
	movl      -204(%ebp), %esi             #1317.13
	movl      %esi, %edi                   #1317.13
	shrl      $1, %edi                     #1317.13
	xorl      %esi, %edi                   #1317.13
	movl      %ecx, %esi                   #1316.13
	roll      $27, %esi                    #1316.13
	addl      %esi, %edi                   #1318.3
	addl      %edi, %eax                   #1321.3
	movl      -284(%ebp), %edi             #1324.27
	addl      %ecx, %edi                   #1324.27
	subl      -264(%ebp), %edi             #1324.27
	movl      %eax, -912(%ebp)             #1323.3
	movl      %edi, -284(%ebp)             #1324.27
	xorl      %eax, %edx                   #1322.3
	movl      %eax, -124(%ebp)             #1321.3
	movl      -908(%ebp), %ecx             #1336.13
	addl      %edi, %ecx                   #1327.3
	movl      -180(%ebp), %edi             #1332.13
	movl      %edi, %esi                   #1332.13
	shrl      $1, %esi                     #1332.13
	xorl      %edi, %esi                   #1332.13
	addl      %esi, %ecx                   #1328.3
	movl      -196(%ebp), %esi             #1329.13
	movl      -204(%ebp), %edi             #1331.13
	roll      $19, %esi                    #1329.13
	roll      $27, %edi                    #1331.13
	addl      %esi, %edi                   #1329.3
	movl      %eax, %esi                   #1333.13
	shrl      $2, %esi                     #1333.13
	xorl      %eax, %esi                   #1333.13
	movl      -200(%ebp), %eax             #1330.13
	roll      $23, %eax                    #1330.13
	addl      %eax, %esi                   #1331.3
	movl      -212(%ebp), %eax             #1345.13
	addl      %esi, %edi                   #1330.3
	movl      -188(%ebp), %esi             #1328.13
	addl      %edi, %ecx                   #1332.3
	roll      $16, %esi                    #1328.13
	movl      -216(%ebp), %edi             #1327.13
	roll      $13, %edi                    #1327.13
	addl      %edi, %esi                   #1333.3
	roll      $19, %eax                    #1345.13
	movl      -260(%ebp), %edi             #1340.29
	addl      %esi, %ecx                   #1336.3
	addl      -204(%ebp), %edi             #1340.29
	xorl      %ecx, %edx                   #1337.3
	movl      %ecx, -908(%ebp)             #1338.3
	subl      -256(%ebp), %edi             #1340.29
	pxor      -920(%ebp), %xmm5            #1452.16
	movl      %edx, -184(%ebp)             #1337.3
	movl      -124(%ebp), %esi             #1348.13
	movl      %ecx, -120(%ebp)             #1336.3
	movdqa    -920(%ebp), %xmm0            #1450.30
	movd      %xmm1, %edx                  #1352.13
	movl      %edi, -260(%ebp)             #1340.29
	addl      %edi, %edx                   #1342.3
	movl      -176(%ebp), %edi             #1344.13
	roll      $16, %edi                    #1344.13
	addl      %eax, %edi                   #1343.3
	movl      %esi, %eax                   #1348.13
	shrl      $1, %eax                     #1348.13
	xorl      %esi, %eax                   #1348.13
	addl      %edi, %edx                   #1344.3
	movl      -180(%ebp), %edi             #1347.13
	roll      $27, %edi                    #1347.13
	movl      -208(%ebp), %esi             #1346.13
	addl      %eax, %edi                   #1345.3
	roll      $23, %esi                    #1346.13
	movl      -220(%ebp), %eax             #1343.13
	roll      $13, %eax                    #1343.13
	addl      %esi, %eax                   #1347.3
	movl      -204(%ebp), %esi             #1365.13
	addl      %eax, %edi                   #1346.3
	addl      %edi, %edx                   #1348.3
	movl      -124(%ebp), %eax             #1366.13
	movl      %ecx, %edi                   #1349.13
	roll      $27, %eax                    #1366.13
	shrl      $2, %edi                     #1349.13
	roll      $23, %esi                    #1365.13
	xorl      %ecx, %edi                   #1349.13
	addl      -288(%ebp), %edi             #1349.3
	movl      -284(%ebp), %ecx             #1357.27
	addl      %edi, %edx                   #1352.3
	movl      %edx, -116(%ebp)             #1352.3
	addl      -180(%ebp), %ecx             #1357.27
	movl      -900(%ebp), %edi             #1371.13
	subl      -272(%ebp), %ecx             #1357.27
	movl      %ecx, -284(%ebp)             #1357.27
	addl      %ecx, %edi                   #1360.3
	movl      %edx, -904(%ebp)             #1355.3
	addl      %esi, %edi                   #1361.3
	xorl      %edx, -184(%ebp)             #1354.3
	movl      -196(%ebp), %esi             #1363.13
	roll      $16, %esi                    #1363.13
	addl      %eax, %esi                   #1362.3
	movl      -200(%ebp), %eax             #1364.13
	roll      $19, %eax                    #1364.13
	movl      %edx, %ecx                   #1368.13
	shrl      $2, %ecx                     #1368.13
	xorl      %edx, %ecx                   #1368.13
	addl      %ecx, %eax                   #1364.3
	movl      -188(%ebp), %ecx             #1362.13
	roll      $13, %ecx                    #1362.13
	addl      %eax, %esi                   #1363.3
	addl      %esi, %edi                   #1365.3
	movl      -120(%ebp), %esi             #1367.13
	movl      %esi, %eax                   #1367.13
	shrl      $1, %eax                     #1367.13
	xorl      %esi, %eax                   #1367.13
	addl      %eax, %ecx                   #1366.3
	movl      -216(%ebp), %esi             #1361.13
	movl      -252(%ebp), %eax             #1360.13
	roll      $3, %eax                     #1360.13
	roll      $7, %esi                     #1361.13
	addl      %esi, %eax                   #1368.3
	movl      -212(%ebp), %esi             #1381.13
	addl      %eax, %ecx                   #1367.3
	movl      %edx, %eax                   #1385.13
	addl      %ecx, %edi                   #1371.3
	movl      -176(%ebp), %ecx             #1380.13
	xorl      %edi, -184(%ebp)             #1372.3
	movl      %edi, -900(%ebp)             #1373.3
	movl      %edi, -112(%ebp)             #1371.3
	roll      $16, %esi                    #1381.13
	shrl      $1, %eax                     #1385.13
	xorl      %edx, %eax                   #1385.13
	roll      $13, %ecx                    #1380.13
	movl      -208(%ebp), %edx             #1382.13
	addl      -896(%ebp), %ecx             #1378.3
	addl      %esi, %ecx                   #1379.3
	movl      -180(%ebp), %esi             #1383.13
	roll      $23, %esi                    #1383.13
	roll      $19, %edx                    #1382.13
	addl      %eax, %esi                   #1380.3
	movl      -220(%ebp), %eax             #1379.13
	roll      $7, %eax                     #1379.13
	addl      %edx, %eax                   #1382.3
	movl      -260(%ebp), %edx             #1375.29
	addl      %eax, %esi                   #1381.3
	addl      %esi, %ecx                   #1383.3
	movl      -120(%ebp), %eax             #1384.13
	movl      -124(%ebp), %esi             #1375.29
	addl      %esi, %edx                   #1375.29
	subl      -292(%ebp), %edx             #1375.29
	roll      $27, %eax                    #1384.13
	roll      $23, %esi                    #1401.13
	addl      %eax, %edx                   #1384.3
	movl      %edi, %eax                   #1386.13
	shrl      $2, %eax                     #1386.13
	xorl      %edi, %eax                   #1386.13
	movl      -240(%ebp), %edi             #1378.13
	roll      $3, %edi                     #1378.13
	addl      %edi, %eax                   #1386.3
	movl      -200(%ebp), %edi             #1399.13
	addl      %eax, %edx                   #1385.3
	addl      %edx, %ecx                   #1389.3
	movl      -204(%ebp), %edx             #1400.13
	movl      %ecx, -896(%ebp)             #1391.3
	movl      -196(%ebp), %eax             #1398.13
	movl      %ecx, -108(%ebp)             #1389.3
	xorl      %ecx, -184(%ebp)             #1390.3
	roll      $19, %edx                    #1400.13
	addl      -892(%ebp), %edx             #1396.3
	roll      $13, %eax                    #1398.13
	addl      %eax, %edx                   #1397.3
	roll      $16, %edi                    #1399.13
	movl      -188(%ebp), %eax             #1397.13
	addl      %edi, %esi                   #1398.3
	roll      $7, %eax                     #1397.13
	movl      -116(%ebp), %edi             #1402.13
	roll      $27, %edi                    #1402.13
	addl      %eax, %edi                   #1400.3
	addl      %edi, %esi                   #1399.3
	movl      -120(%ebp), %edi             #1393.27
	addl      -284(%ebp), %edi             #1393.27
	subl      -268(%ebp), %edi             #1393.27
	addl      %esi, %edx                   #1401.3
	movl      -112(%ebp), %esi             #1403.13
	movl      %esi, %eax                   #1403.13
	shrl      $1, %eax                     #1403.13
	xorl      %esi, %eax                   #1403.13
	addl      %eax, %edi                   #1402.3
	movl      -280(%ebp), %eax             #1396.13
	movl      %ecx, %esi                   #1404.13
	shrl      $2, %esi                     #1404.13
	xorl      %ecx, %esi                   #1404.13
	movl      -216(%ebp), %ecx             #1396.13
	shrl      $29, %ecx                    #1396.13
	orl       %ecx, %eax                   #1396.13
	addl      %eax, %esi                   #1404.3
	addl      %esi, %edi                   #1403.3
	addl      %edi, %edx                   #1407.3
	movl      -220(%ebp), %ecx             #1458.53
	movl      %edx, -892(%ebp)             #1409.3
	movl      -184(%ebp), %esi             #1408.3
	xorl      %edx, %esi                   #1408.3
	movl      -296(%ebp), %edi             #1457.69
	shll      $8, %ecx                     #1458.53
	movl      %esi, -312(%ebp)             #1411.3
	movdqa    -904(%ebp), %xmm1            #1451.30
	pxor      32(%edi), %xmm0              #1512.24
	movq      -312(%ebp), %xmm6            #1412.21
	pxor      48(%edi), %xmm1              #1516.24
	pshufd    $0, %xmm6, %xmm2             #1413.13
	movdqa    -936(%ebp), %xmm6            #1501.30
	pxor      %xmm2, %xmm0                 #1513.16
	movl      %edx, -204(%ebp)             #1407.3
	movd      %xmm5, %eax                  #1457.3
	movl      %esi, %edx                   #1457.38
	shll      $5, %edx                     #1457.38
	xorl      -276(%ebp), %edx             #1457.53
	xorl      (%edi), %edx                 #1457.69
	movdqa    %xmm5, -760(%ebp)            #1453.20
	addl      %edx, %eax                   #1457.3
	movl      -188(%ebp), %edx             #1459.53
	movdqa    -952(%ebp), %xmm5            #1500.30
	shll      $5, %edx                     #1459.53
	movdqa    %xmm5, %xmm7                 #1502.26
	movl      %eax, -104(%ebp)             #1457.3
	palignr   $12, %xmm6, %xmm7            #1502.26
	pxor      %xmm7, %xmm3                 #1505.15
	pxor      -632(%ebp), %xmm3            #1506.15
	movl      %eax, -760(%ebp)             #1457.3
	movl      %esi, %eax                   #1458.38
	shrl      $7, %eax                     #1458.38
	xorl      %ecx, %eax                   #1458.53
	xorl      4(%edi), %eax                #1458.69
	movl      -176(%ebp), %ecx             #1460.53
	addl      -756(%ebp), %eax             #1458.3
	shll      $5, %ecx                     #1460.53
	palignr   $12, %xmm5, %xmm6            #1503.22
	pxor      %xmm6, %xmm4                 #1507.15
	movl      %eax, -100(%ebp)             #1458.3
	pxor      %xmm2, %xmm1                 #1517.16
	pxor      -616(%ebp), %xmm4            #1508.15
	paddd     %xmm1, %xmm4                 #1518.16
	paddd     %xmm0, %xmm3                 #1514.16
	movl      %eax, -756(%ebp)             #1458.3
	movl      %esi, %eax                   #1459.38
	shrl      $5, %eax                     #1459.38
	xorl      %edx, %eax                   #1459.53
	xorl      8(%edi), %eax                #1459.69
	movl      -116(%ebp), %edx             #1461.97
	addl      -752(%ebp), %eax             #1459.3
	movl      %eax, -96(%ebp)              #1459.3
	movl      %eax, -752(%ebp)             #1459.3
	movl      %esi, %eax                   #1460.38
	shrl      $1, %eax                     #1460.38
	xorl      %ecx, %eax                   #1460.53
	xorl      12(%edi), %eax               #1460.69
	movl      -172(%ebp), %ecx             #1461.97
	addl      -748(%ebp), %eax             #1460.3
	xorl      %ecx, %edx                   #1461.97
	xorl      -228(%ebp), %edx             #1461.106
	movl      %eax, -92(%ebp)              #1460.3
	movl      %eax, -748(%ebp)             #1460.3
	movl      %esi, %eax                   #1461.37
	shrl      $3, %eax                     #1461.37
	xorl      -196(%ebp), %eax             #1461.56
	xorl      16(%edi), %eax               #1461.68
	movdqa    %xmm4, -712(%ebp)            #1520.20
	addl      %edx, %eax                   #1461.106
	movl      %eax, -744(%ebp)             #1461.3
	movl      %esi, %edx                   #1462.37
	shll      $6, %edx                     #1462.37
	movl      %eax, -88(%ebp)              #1461.106
	movl      -212(%ebp), %eax             #1462.52
	shrl      $6, %eax                     #1462.52
	xorl      %eax, %edx                   #1462.52
	movl      -112(%ebp), %eax             #1462.97
	xorl      %ecx, %eax                   #1462.97
	xorl      -232(%ebp), %eax             #1462.106
	xorl      20(%edi), %edx               #1462.68
	movdqa    %xmm3, -728(%ebp)            #1521.20
	addl      %eax, %edx                   #1462.106
	movl      %esi, %eax                   #1463.37
	movl      %edx, -84(%ebp)              #1462.106
	shrl      $11, %esi                    #1464.37
	shrl      $4, %eax                     #1463.37
	movl      %edx, -740(%ebp)             #1462.3
	movl      -200(%ebp), %edx             #1463.52
	shll      $6, %edx                     #1463.52
	xorl      %edx, %eax                   #1463.52
	movl      -108(%ebp), %edx             #1463.97
	xorl      24(%edi), %eax               #1463.68
	xorl      %ecx, %edx                   #1463.97
	xorl      -204(%ebp), %ecx             #1464.97
	xorl      -224(%ebp), %edx             #1463.106
	addl      %edx, %eax                   #1463.106
	xorl      -236(%ebp), %ecx             #1464.106
	movl      -208(%ebp), %edx             #1464.52
	movl      %eax, -736(%ebp)             #1463.3
	shll      $2, %edx                     #1464.52
	roll      $11, %eax                    #1546.15
	addl      %eax, -720(%ebp)             #1546.3
	movd      %xmm4, %eax                  #1550.3
	xorl      %edx, %esi                   #1464.52
	xorl      28(%edi), %esi               #1464.68
	addl      %ecx, %esi                   #1464.106
	movl      %esi, -732(%ebp)             #1464.3
	movl      -88(%ebp), %ecx              #1546.15
	roll      $9, %ecx                     #1546.15
	movd      %xmm3, %edx                  #1546.3
	addl      %ecx, %edx                   #1546.3
	roll      $12, %esi                    #1546.15
	movl      -84(%ebp), %ecx              #1546.15
	movl      %edx, -728(%ebp)             #1546.3
	roll      $10, %ecx                    #1546.15
	movl      -100(%ebp), %edx             #1550.15
	addl      %ecx, -724(%ebp)             #1546.3
	movl      -96(%ebp), %ecx              #1550.15
	addl      %esi, -716(%ebp)             #1546.3
	movl      -104(%ebp), %esi             #1550.15
	roll      $13, %esi                    #1550.15
	addl      %esi, %eax                   #1550.3
	movl      %eax, -712(%ebp)             #1550.3
	roll      $14, %edx                    #1550.15
	addl      $64, %edi                    #1557.3
	movl      -92(%ebp), %eax              #1550.15
	addl      %edx, -708(%ebp)             #1550.3
	roll      $15, %ecx                    #1550.15
	addl      %ecx, -704(%ebp)             #1550.3
	roll      $16, %eax                    #1550.15
	addl      %eax, -700(%ebp)             #1550.3
	cmpl      12(%ebx), %edi               #1559.18
	movl      %edi, -296(%ebp)             #1557.3
	jae       ..B1.4                # Prob 18%                      #1559.18
..B1.8:                          # Preds ..B1.7
	movl      %edi, %eax                   #
	jmp       ..B1.2                # Prob 100%                     #
..B1.4:                          # Preds ..B1.7
	movdqa    -728(%ebp), %xmm2            #1565.29
	movl      16(%ebx), %eax               #
	movl      %ebp, %esp                   #1569.1
	movl      -812(%ebp), %esi             #
	movdqa    -760(%ebp), %xmm0            #1561.29
	movdqa    -744(%ebp), %xmm1            #1563.29
	movdqa    %xmm0, 16(%eax)              #1562.19
	movl      -816(%ebp), %edi             #
	movdqa    -712(%ebp), %xmm3            #1567.29
	movdqa    %xmm1, 32(%eax)              #1564.19
	movdqa    %xmm2, 48(%eax)              #1566.19
	movdqa    %xmm3, 64(%eax)              #1568.19
	popl      %ebp                         #1569.1
	movl      %ebx, %esp                   #1569.1
	popl      %ebx                         #1569.1
	ret                                    #1569.1
	.align    16,0x90
	.type     Compress256,@function
	.size     Compress256,.-Compress256
	.data
	.section  .rodata, "a"
	.align    128
	.align    128
	.globl    consts256
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
	.long     2236962125
	.long     2326440610
	.long     2415919095
	.long     2505397580
	.long     2594876065
	.long     2684354550
	.long     2773833035
	.type     consts256,@object
	.size     consts256,64
	.space    64                           # pad
	.align    128
	.globl    negate256
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
	.type     negate256,@object
	.size     negate256,112
	.align    16
.LC55:
	.long     0x55555550,0x5aaaaaa5,0x5ffffffa,0x6555554f
	.type     .LC55,@object
	.size     .LC55,16
	.align    16
.LC56:
	.long     0x6aaaaaa4,0x6ffffff9,0x7555554e,0x7aaaaaa3
	.type     .LC56,@object
	.size     .LC56,16
	.align    16
.LC57:
	.long     0x7ffffff8,0x8555554d,0x8aaaaaa2,0x8ffffff7
	.type     .LC57,@object
	.size     .LC57,16
	.align    16
.LC58:
	.long     0x9555554c,0x9aaaaaa1,0x9ffffff6,0xa555554b
	.type     .LC58,@object
	.size     .LC58,16
	.align    16
.LC59:
	.long     0xffffffff,0xffffffff,0x00000001,0xffffffff
	.type     .LC59,@object
	.size     .LC59,16
	.align    16
.LC60:
	.long     0x00000001,0xffffffff,0x00000001,0xffffffff
	.type     .LC60,@object
	.size     .LC60,16
	.align    16
.LC61:
	.long     0x00000001,0x00000001,0xffffffff,0xffffffff
	.type     .LC61,@object
	.size     .LC61,16
	.align    16
.LC62:
	.long     0x00000001,0xffffffff,0xffffffff,0xffffffff
	.type     .LC62,@object
	.size     .LC62,16
	.align    16
.LC63:
	.long     0x00000001,0x00000001,0x00000001,0xffffffff
	.type     .LC63,@object
	.size     .LC63,16
	.align    16
.LC64:
	.long     0xffffffff,0x00000001,0xffffffff,0xffffffff
	.type     .LC64,@object
	.size     .LC64,16
	.align    16
.LC65:
	.long     0xffffffff,0x00000001,0x00000001,0xffffffff
	.type     .LC65,@object
	.size     .LC65,16
	.align    16
.LC66:
	.long     0x01000302,0x05040706,0x09080b0a,0x0d0c0f0e
	.type     .LC66,@object
	.size     .LC66,16
	.data
	.section  .note.GNU-stack, ""
