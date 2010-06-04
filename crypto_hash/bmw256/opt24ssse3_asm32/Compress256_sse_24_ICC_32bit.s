# -- Machine type PW
# mark_description "Intel(R) C++ Compiler for applications running on IA-32, Version 11.1    Build 20100203 %s";
# mark_description "-m32 -O2 -opt-ra-region-strategy=routine -fomit-frame-pointer -mssse3 -w -S";
	.file "Compress256_sse_24.c"
	.text
..TXTST0:
# -- Begin  Compress256
# mark_begin;
       .align    16,0x90
	.globl Compress256
Compress256:
# parameter 1: 8 + %ebx
# parameter 2: 12 + %ebx
# parameter 3: 16 + %ebx
..B1.1:                         # Preds ..B1.0
        pushl     %ebx                                          #269.1
        movl      %esp, %ebx                                    #269.1
        andl      $-128, %esp                                   #269.1
        pushl     %ebp                                          #269.1
        pushl     %ebp                                          #269.1
        movl      4(%ebx), %ebp                                 #269.1
        movl      %ebp, 4(%esp)                                 #269.1
        movl      %esp, %ebp                                    #269.1
        subl      $1016, %esp                                   #269.1
        movl      %edi, -812(%ebp)                              #269.1
        movl      %esi, -816(%ebp)                              #269.1
        movl      8(%ebx), %eax                                 #268.6
        movl      16(%ebx), %edx                                #268.6
        movdqa    16(%edx), %xmm0                               #365.49
        movdqa    32(%edx), %xmm1                               #369.29
        movdqa    48(%edx), %xmm2                               #371.29
        movdqa    64(%edx), %xmm3                               #373.29
        movdqa    48+consts256, %xmm4                           #907.54
        movdqa    32+consts256, %xmm5                           #925.54
        movl      %eax, -132(%ebp)                              #268.6
        movdqa    %xmm0, -760(%ebp)                             #366.19
        movdqa    %xmm1, -744(%ebp)                             #370.19
        movdqa    %xmm2, -728(%ebp)                             #372.19
        movdqa    %xmm3, -712(%ebp)                             #374.19
        movdqa    %xmm4, -792(%ebp)                             #907.54
        movdqa    %xmm5, -808(%ebp)                             #925.54
                                # LOE
..B1.2:                         # Preds ..B1.7 ..B1.1
        movdqa    -760(%ebp), %xmm0                             #407.53
        movl      -132(%ebp), %eax                              #407.80
        movdqa    -728(%ebp), %xmm3                             #418.53
        movdqa    -712(%ebp), %xmm7                             #421.53
        movdqa    (%eax), %xmm6                                 #407.80
        movdqa    16(%eax), %xmm2                               #414.80
        movdqa    32(%eax), %xmm1                               #418.80
        movdqa    48(%eax), %xmm4                               #421.80
        movl      (%eax), %edx                                  #476.3
        movl      4(%eax), %ecx                                 #476.3
        movl      8(%eax), %esi                                 #476.3
        movl      12(%eax), %edi                                #476.3
        movdqa    %xmm0, -600(%ebp)                             #407.53
        pxor      %xmm0, %xmm6                                  #407.23
        movdqa    -744(%ebp), %xmm0                             #414.53
        movdqa    %xmm0, -664(%ebp)                             #414.53
        pxor      %xmm0, %xmm2                                  #414.23
        movdqa    %xmm2, %xmm5                                  #429.23
        palignr   $4, %xmm6, %xmm5                              #429.23
        movdqa    %xmm3, -680(%ebp)                             #418.53
        pxor      %xmm1, %xmm3                                  #418.23
        movdqa    %xmm1, -776(%ebp)                             #418.80
        movdqa    %xmm2, %xmm1                                  #436.23
        palignr   $8, %xmm6, %xmm1                              #436.23
        movdqa    %xmm7, -648(%ebp)                             #421.53
        pxor      %xmm4, %xmm7                                  #421.23
        movdqa    %xmm7, %xmm0                                  #432.23
        palignr   $4, %xmm3, %xmm0                              #432.23
        movdqa    %xmm4, -696(%ebp)                             #421.80
        movdqa    %xmm3, %xmm4                                  #437.23
        palignr   $8, %xmm2, %xmm4                              #437.23
        movdqa    %xmm5, -568(%ebp)                             #429.23
        movdqa    %xmm3, %xmm5                                  #431.23
        palignr   $4, %xmm2, %xmm5                              #431.23
        movdqa    %xmm0, -552(%ebp)                             #432.23
        movdqa    %xmm6, %xmm0                                  #433.23
        palignr   $4, %xmm7, %xmm0                              #433.23
        movdqa    %xmm1, -536(%ebp)                             #436.23
        movdqa    %xmm7, %xmm1                                  #438.23
        palignr   $8, %xmm3, %xmm1                              #438.23
        movdqa    %xmm4, -520(%ebp)                             #437.23
        movdqa    %xmm6, %xmm4                                  #439.23
        palignr   $8, %xmm7, %xmm4                              #439.23
        movdqa    %xmm4, -504(%ebp)                             #439.23
        movdqa    %xmm2, %xmm4                                  #441.23
        palignr   $12, %xmm6, %xmm4                             #441.23
        movdqa    %xmm4, -488(%ebp)                             #441.23
        movdqa    %xmm3, %xmm4                                  #442.23
        palignr   $12, %xmm2, %xmm4                             #442.23
        movdqa    %xmm7, %xmm2                                  #443.23
        palignr   $12, %xmm3, %xmm2                             #443.23
        movdqa    _2il0floatpacket.51, %xmm3                    #506.32
        movl      %edx, -220(%ebp)                              #476.3
        roll      $1, %edx                                      #476.12
        psignd    %xmm3, %xmm1                                  #506.32
        psignd    %xmm3, %xmm4                                  #505.32
        palignr   $12, %xmm7, %xmm6                             #444.23
        psignd    _2il0floatpacket.56, %xmm6                    #539.74
        movl      %edx, -888(%ebp)                              #476.3
        movl      16(%eax), %edx                                #476.3
        movdqa    %xmm5, %xmm7                                  #504.19
        paddd     %xmm0, %xmm7                                  #504.19
        movl      %ecx, -224(%ebp)                              #476.3
        roll      $2, %ecx                                      #476.12
        paddd     %xmm4, %xmm7                                  #505.11
        movdqa    -552(%ebp), %xmm4                             #524.33
        psignd    _2il0floatpacket.53, %xmm4                    #524.33
        movl      %ecx, -884(%ebp)                              #476.3
        movl      20(%eax), %ecx                                #476.3
        psubd     %xmm1, %xmm7                                  #506.11
        psignd    %xmm3, %xmm2                                  #524.73
        movdqa    -568(%ebp), %xmm3                             #526.32
        movl      %esi, -228(%ebp)                              #476.3
        roll      $3, %esi                                      #476.12
        paddd     %xmm2, %xmm4                                  #524.19
        movdqa    _2il0floatpacket.54, %xmm2                    #526.32
        movl      %esi, -880(%ebp)                              #476.3
        movl      24(%eax), %esi                                #476.3
        movl      %edi, -232(%ebp)                              #476.3
        roll      $4, %edi                                      #476.12
        psignd    %xmm2, %xmm3                                  #526.32
        movl      %edi, -876(%ebp)                              #476.3
        movl      36(%eax), %edi                                #476.3
        roll      $10, %edi                                     #476.12
        movl      %edx, -256(%ebp)                              #476.3
        roll      $5, %edx                                      #476.12
        movl      %edx, -872(%ebp)                              #476.3
        movl      28(%eax), %edx                                #476.3
        movl      %ecx, -236(%ebp)                              #476.3
        roll      $6, %ecx                                      #476.12
        movl      %ecx, -868(%ebp)                              #476.3
        movl      32(%eax), %ecx                                #476.3
        roll      $9, %ecx                                      #476.12
        movl      %esi, -252(%ebp)                              #476.3
        roll      $7, %esi                                      #476.12
        movl      %esi, -864(%ebp)                              #476.3
        movl      48(%eax), %esi                                #476.3
        roll      $13, %esi                                     #476.12
        movl      %edx, -240(%ebp)                              #476.3
        roll      $8, %edx                                      #476.12
        movl      %edx, -860(%ebp)                              #476.3
        movl      40(%eax), %edx                                #476.3
        roll      $11, %edx                                     #476.12
        movl      %ecx, -856(%ebp)                              #476.3
        movl      44(%eax), %ecx                                #476.3
        roll      $12, %ecx                                     #476.12
        movl      %edi, -852(%ebp)                              #476.3
        movl      %edx, -848(%ebp)                              #476.3
        movl      52(%eax), %edx                                #476.3
        roll      $14, %edx                                     #476.12
        movl      %ecx, -844(%ebp)                              #476.3
        movl      56(%eax), %ecx                                #476.3
        movl      60(%eax), %eax                                #476.3
        movl      %esi, -840(%ebp)                              #476.3
        roll      $15, %ecx                                     #476.12
        roll      $16, %eax                                     #476.12
        movl      %edx, -836(%ebp)                              #476.3
        movl      %ecx, -832(%ebp)                              #476.3
        movl      %eax, -828(%ebp)                              #476.3
        movdqa    %xmm1, -472(%ebp)                             #506.32
        movdqa    -504(%ebp), %xmm1                             #507.26
        psignd    _2il0floatpacket.52, %xmm1                    #507.26
        paddd     %xmm1, %xmm7                                  #508.11
        movaps    %xmm7, -456(%ebp)                             #508.11
        psubd     %xmm1, %xmm4                                  #525.11
        movdqa    _2il0floatpacket.55, %xmm1                    #527.32
        paddd     %xmm3, %xmm4                                  #526.11
        movdqa    -536(%ebp), %xmm3                             #527.32
        movdqa    %xmm3, %xmm7                                  #527.32
        psignd    %xmm1, %xmm7                                  #527.32
        paddd     %xmm7, %xmm4                                  #527.11
        movdqa    _2il0floatpacket.52, %xmm7                    #541.32
        psignd    %xmm1, %xmm0                                  #539.33
        paddd     %xmm6, %xmm0                                  #539.19
        psignd    %xmm2, %xmm3                                  #540.32
        movdqa    _2il0floatpacket.53, %xmm2                    #542.32
        paddd     %xmm3, %xmm0                                  #540.11
        movdqa    -520(%ebp), %xmm3                             #542.32
        psignd    %xmm7, %xmm5                                  #541.32
        psubd     %xmm5, %xmm0                                  #541.11
        movdqa    -488(%ebp), %xmm5                             #553.74
        movdqa    %xmm3, %xmm6                                  #542.32
        psignd    _2il0floatpacket.57, %xmm3                    #554.32
        psignd    %xmm2, %xmm6                                  #542.32
        psubd     %xmm6, %xmm0                                  #542.11
        movdqa    -568(%ebp), %xmm6                             #553.33
        psignd    %xmm1, %xmm6                                  #553.33
        psignd    %xmm2, %xmm5                                  #553.74
        movdqa    -552(%ebp), %xmm2                             #555.32
        paddd     %xmm5, %xmm6                                  #553.19
        paddd     %xmm3, %xmm6                                  #554.11
        psignd    %xmm7, %xmm2                                  #555.32
        movdqa    %xmm0, %xmm3                                  #599.23
        movdqa    %xmm0, %xmm7                                  #600.23
        psubd     %xmm2, %xmm6                                  #555.11
        psubd     -472(%ebp), %xmm6                             #556.11
        shufps    $148, %xmm6, %xmm3                            #599.23
        shufps    $206, %xmm6, %xmm7                            #600.23
        movaps    -456(%ebp), %xmm6                             #601.23
        movdqa    %xmm6, %xmm2                                  #601.23
        movdqa    %xmm6, %xmm5                                  #602.23
        shufps    $148, %xmm4, %xmm2                            #601.23
        movaps    %xmm2, %xmm1                                  #604.23
        shufps    $206, %xmm4, %xmm5                            #602.23
        shufps    $200, %xmm7, %xmm1                            #604.23
        shufps    $253, %xmm0, %xmm2                            #605.23
        movaps    %xmm1, %xmm0                                  #616.15
        pslld     $3, %xmm0                                     #616.15
        psrld     $1, %xmm1                                     #616.15
        shufps    $172, %xmm7, %xmm5                            #606.23
        shufps    $143, %xmm3, %xmm6                            #607.23
        shufps    $208, %xmm3, %xmm4                            #608.23
        movdqa    %xmm0, %xmm3                                  #616.15
        pxor      %xmm1, %xmm3                                  #616.15
        pslld     $1, %xmm0                                     #616.15
        pxor      %xmm0, %xmm3                                  #616.15
        psrld     $12, %xmm1                                    #616.15
        pxor      %xmm1, %xmm3                                  #616.15
        pslld     $15, %xmm0                                    #616.15
        pxor      %xmm0, %xmm3                                  #616.15
        psrld     $15, %xmm1                                    #616.15
        xorps     %xmm1, %xmm3                                  #616.15
        movaps    %xmm2, %xmm1                                  #624.15
        pslld     $2, %xmm1                                     #624.15
        psrld     $1, %xmm2                                     #624.15
        movdqa    %xmm1, %xmm7                                  #624.15
        pxor      %xmm2, %xmm7                                  #624.15
        pslld     $6, %xmm1                                     #624.15
        pxor      %xmm1, %xmm7                                  #624.15
        psrld     $8, %xmm2                                     #624.15
        pxor      %xmm2, %xmm7                                  #624.15
        pslld     $15, %xmm1                                    #624.15
        pxor      %xmm1, %xmm7                                  #624.15
        psrld     $15, %xmm2                                    #624.15
        pxor      %xmm2, %xmm7                                  #624.15
        movaps    %xmm5, %xmm2                                  #633.15
        pslld     $1, %xmm2                                     #633.15
        psrld     $2, %xmm5                                     #633.15
        movdqa    %xmm2, %xmm0                                  #633.15
        pxor      %xmm5, %xmm0                                  #633.15
        pslld     $11, %xmm2                                    #633.15
        pxor      %xmm2, %xmm0                                  #633.15
        psrld     $5, %xmm5                                     #633.15
        pxor      %xmm5, %xmm0                                  #633.15
        pslld     $13, %xmm2                                    #633.15
        pxor      %xmm2, %xmm0                                  #633.15
        psrld     $13, %xmm5                                    #633.15
        pxor      %xmm5, %xmm0                                  #633.15
        movaps    %xmm6, %xmm5                                  #642.15
        pslld     $2, %xmm5                                     #642.15
        psrld     $2, %xmm6                                     #642.15
        movdqa    %xmm5, %xmm1                                  #642.15
        pxor      %xmm6, %xmm1                                  #642.15
        movaps    %xmm3, %xmm2                                  #655.23
        movlhps   %xmm7, %xmm2                                  #655.23
        shufps    $239, %xmm3, %xmm7                            #656.23
        pslld     $13, %xmm5                                    #642.15
        pxor      %xmm5, %xmm1                                  #642.15
        psrld     $1, %xmm6                                     #642.15
        pxor      %xmm6, %xmm1                                  #642.15
        pslld     $14, %xmm5                                    #642.15
        pxor      %xmm5, %xmm1                                  #642.15
        movdqa    -760(%ebp), %xmm5                             #730.27
        psrld     $14, %xmm6                                    #642.15
        pxor      %xmm6, %xmm1                                  #642.15
        movaps    %xmm4, %xmm6                                  #651.15
        psrld     $1, %xmm6                                     #651.15
        xorps     %xmm4, %xmm6                                  #651.15
        movdqa    %xmm0, %xmm4                                  #658.23
        shufps    $204, %xmm1, %xmm4                            #658.23
        shufps    $197, %xmm6, %xmm0                            #659.23
        shufps    $238, %xmm6, %xmm1                            #660.23
        shufps    $255, %xmm3, %xmm6                            #661.23
        movdqa    -712(%ebp), %xmm3                             #730.27
        shufps    $210, %xmm2, %xmm0                            #664.23
        shufps    $136, %xmm4, %xmm2                            #665.11
        shufps    $40, %xmm7, %xmm1                             #666.11
        movdqa    %xmm5, %xmm7                                  #730.27
        palignr   $4, %xmm3, %xmm7                              #730.27
        movdqa    %xmm7, -440(%ebp)                             #730.27
        movdqa    -728(%ebp), %xmm7                             #731.23
        shufps    $141, %xmm6, %xmm4                            #667.11
        movdqa    -744(%ebp), %xmm6                             #732.23
        paddd     -440(%ebp), %xmm4                             #739.22
        palignr   $4, %xmm7, %xmm3                              #731.23
        paddd     %xmm3, %xmm1                                  #738.22
        movdqa    %xmm1, -984(%ebp)                             #751.20
        shufps    $120, %xmm0, %xmm0                            #668.11
        palignr   $4, %xmm6, %xmm7                              #732.23
        movd      %xmm1, -160(%ebp)                             #752.12
        paddd     %xmm7, %xmm0                                  #737.22
        movaps    %xmm0, %xmm7                                  #745.20
        psrldq    $4, %xmm7                                     #745.20
        palignr   $4, %xmm5, %xmm6                              #733.23
        paddd     %xmm6, %xmm2                                  #736.22
        movdqa    %xmm2, -1016(%ebp)                            #741.20
        movaps    %xmm2, %xmm3                                  #741.20
        psrldq    $12, %xmm3                                    #741.20
        movaps    %xmm2, %xmm5                                  #741.20
        movd      %xmm3, %eax                                   #743.12
        movaps    %xmm0, %xmm3                                  #745.20
        psrldq    $8, %xmm5                                     #741.20
        movd      %xmm5, %edx                                   #742.12
        movdqa    %xmm0, -1000(%ebp)                            #745.20
        movaps    %xmm0, %xmm5                                  #745.20
        movaps    %xmm1, %xmm6                                  #751.20
        psrldq    $12, %xmm5                                    #745.20
        movd      %xmm0, -192(%ebp)                             #746.12
        psrldq    $8, %xmm3                                     #745.20
        movd      %xmm7, -196(%ebp)                             #747.12
        movaps    %xmm1, %xmm7                                  #751.20
        movd      %xmm3, -200(%ebp)                             #748.12
        psrldq    $12, %xmm6                                    #751.20
        movaps    %xmm1, %xmm3                                  #751.20
        movd      %xmm5, -204(%ebp)                             #749.12
        psrldq    $8, %xmm7                                     #751.20
        movaps    %xmm4, %xmm5                                  #757.20
        psrldq    $4, %xmm3                                     #751.20
        movd      %xmm3, -172(%ebp)                             #753.12
        movaps    %xmm4, %xmm3                                  #757.20
        movd      %xmm7, -176(%ebp)                             #754.12
        psrldq    $12, %xmm3                                    #757.20
        movaps    %xmm4, %xmm7                                  #757.20
        movd      %xmm6, -184(%ebp)                             #755.12
        psrldq    $8, %xmm5                                     #757.20
        movdqa    %xmm4, -968(%ebp)                             #757.20
        psrldq    $4, %xmm7                                     #757.20
        movd      %xmm4, -208(%ebp)                             #758.12
        movd      %xmm7, -180(%ebp)                             #759.12
        movd      %xmm5, -124(%ebp)                             #760.12
        pxor      %xmm5, %xmm5                                  #765.33
        punpckhqdq %xmm2, %xmm5                                 #765.33
        paddd     %xmm0, %xmm5                                  #766.24
        paddd     %xmm1, %xmm5                                  #767.24
        movd      %xmm3, -128(%ebp)                             #761.12
        paddd     %xmm4, %xmm5                                  #768.24
        pshufd    $120, %xmm5, %xmm6                            #769.32
        phaddd    %xmm6, %xmm6                                  #770.24
        movq      %xmm6, -264(%ebp)                             #771.3
                                # LOE eax edx xmm0 xmm1 xmm2 xmm4
..B1.3:                         # Preds ..B1.2
        movl      -208(%ebp), %edi                              #1020.12
        movl      %eax, -104(%ebp)                              #
        movl      -124(%ebp), %eax                              #1021.13
        movl      %edx, -100(%ebp)                              #
        movaps    %xmm2, %xmm6                                  #816.26
        punpcklqdq %xmm0, %xmm6                                 #816.26
        movdqa    %xmm6, %xmm7                                  #817.26
        pslld     $2, %xmm7                                     #817.26
        psrld     $1, %xmm6                                     #817.26
        movdqa    %xmm7, %xmm3                                  #817.26
        roll      $19, %edi                                     #1020.12
        movl      %eax, %edx                                    #1021.13
        roll      $23, %edx                                     #1021.13
        addl      %edx, %edi                                    #1021.3
        movl      %eax, %esi                                    #1023.12
        movaps    %xmm4, -424(%ebp)                             #
        pxor      %xmm6, %xmm3                                  #817.26
        pslld     $6, %xmm7                                     #817.26
        pxor      %xmm7, %xmm3                                  #817.26
        psrld     $8, %xmm6                                     #817.26
        pxor      %xmm6, %xmm3                                  #817.26
        roll      $19, %esi                                     #1023.12
        roll      $13, %eax                                     #1029.12
        movaps    %xmm1, -408(%ebp)                             #
        pslld     $15, %xmm7                                    #817.26
        pxor      %xmm7, %xmm3                                  #817.26
        psrld     $15, %xmm6                                    #817.26
        pxor      %xmm6, %xmm3                                  #817.26
        movaps    %xmm2, %xmm5                                  #818.26
        punpckhqdq %xmm0, %xmm5                                 #818.26
        movaps    %xmm0, -392(%ebp)                             #
        movdqa    %xmm5, %xmm7                                  #819.46
        pslld     $2, %xmm7                                     #819.46
        psrld     $2, %xmm5                                     #819.46
        movdqa    %xmm7, %xmm6                                  #819.46
        pxor      %xmm5, %xmm6                                  #819.46
        movaps    %xmm2, -376(%ebp)                             #
        pslld     $13, %xmm7                                    #819.46
        pxor      %xmm7, %xmm6                                  #819.46
        psrld     $1, %xmm5                                     #819.46
        pxor      %xmm5, %xmm6                                  #819.46
        pslld     $14, %xmm7                                    #819.46
        pxor      %xmm7, %xmm6                                  #819.46
        psrld     $14, %xmm5                                    #819.46
        pxor      %xmm5, %xmm6                                  #819.46
        paddd     %xmm6, %xmm3                                  #819.18
        movaps    %xmm1, %xmm6                                  #824.26
        punpcklqdq %xmm4, %xmm6                                 #824.26
        movl      %edi, -96(%ebp)                               #1021.3
        movdqa    %xmm6, %xmm7                                  #825.46
        pslld     $2, %xmm7                                     #825.46
        psrld     $1, %xmm6                                     #825.46
        movdqa    %xmm7, %xmm5                                  #825.46
        pxor      %xmm6, %xmm5                                  #825.46
        movl      %esi, -92(%ebp)                               #1023.12
        movl      -128(%ebp), %esi                              #1044.26
        movl      %esi, %edi                                    #1044.26
        roll      $16, %edi                                     #1044.26
        pslld     $6, %xmm7                                     #825.46
        pxor      %xmm7, %xmm5                                  #825.46
        psrld     $8, %xmm6                                     #825.46
        pxor      %xmm6, %xmm5                                  #825.46
        movl      %eax, -88(%ebp)                               #1029.12
        movl      -180(%ebp), %eax                              #1043.26
        movl      %eax, %ecx                                    #1043.26
        roll      $13, %ecx                                     #1043.26
        lea       (%ecx,%edi), %edx                             #1046.3
        roll      $6, %ecx                                      #1051.16
        pslld     $15, %xmm7                                    #825.46
        pxor      %xmm7, %xmm5                                  #825.46
        psrld     $15, %xmm6                                    #825.46
        pxor      %xmm6, %xmm5                                  #825.46
        paddd     %xmm5, %xmm3                                  #825.18
        movaps    %xmm1, %xmm6                                  #826.26
        punpckhqdq %xmm4, %xmm6                                 #826.26
        movl      %edx, -84(%ebp)                               #1046.3
        roll      $7, %edi                                      #1052.16
        addl      %edi, %ecx                                    #1054.3
        roll      $22, %edi                                     #1058.16
        movl      %eax, %edx                                    #1067.12
        movdqa    %xmm6, %xmm7                                  #827.46
        pslld     $2, %xmm7                                     #827.46
        psrld     $2, %xmm6                                     #827.46
        movdqa    %xmm7, %xmm5                                  #827.46
        pxor      %xmm6, %xmm5                                  #827.46
        movl      %ecx, -80(%ebp)                               #1054.3
        roll      $23, %edx                                     #1067.12
        movl      %esi, %ecx                                    #1068.13
        roll      $27, %ecx                                     #1068.13
        pslld     $13, %xmm7                                    #827.46
        pxor      %xmm7, %xmm5                                  #827.46
        psrld     $1, %xmm6                                     #827.46
        pxor      %xmm6, %xmm5                                  #827.46
        movl      %edi, -76(%ebp)                               #1058.16
        movl      -184(%ebp), %edi                              #1069.13
        roll      $19, %edi                                     #1069.13
        addl      %edx, %edi                                    #1068.3
        addl      %ecx, %edi                                    #1069.3
        movl      %esi, %edx                                    #1073.12
        roll      $19, %edx                                     #1073.12
        pslld     $14, %xmm7                                    #827.46
        pxor      %xmm7, %xmm5                                  #827.46
        psrld     $14, %xmm6                                    #827.46
        pxor      %xmm6, %xmm5                                  #827.46
        paddd     %xmm5, %xmm3                                  #827.18
        movaps    %xmm0, %xmm5                                  #832.22
        palignr   $4, %xmm2, %xmm5                              #832.22
        movl      %edx, -72(%ebp)                               #1073.12
        roll      $3, %eax                                      #1086.12
        roll      $7, %esi                                      #1087.13
        addl      %esi, %eax                                    #1087.3
        movaps    %xmm1, %xmm6                                  #833.22
        palignr   $4, %xmm0, %xmm6                              #833.22
        movdqa    %xmm6, -360(%ebp)                             #833.22
        movdqa    %xmm5, %xmm2                                  #834.26
        punpcklqdq %xmm6, %xmm2                                 #834.26
        movdqa    %xmm2, %xmm0                                  #835.46
        pslld     $1, %xmm0                                     #835.46
        psrld     $2, %xmm2                                     #835.46
        movdqa    %xmm0, %xmm7                                  #835.46
        pxor      %xmm2, %xmm7                                  #835.46
        pslld     $11, %xmm0                                    #835.46
        pxor      %xmm0, %xmm7                                  #835.46
        psrld     $5, %xmm2                                     #835.46
        punpckhqdq %xmm6, %xmm5                                 #836.26
        movl      %eax, -212(%ebp)                              #1087.3
        pxor      %xmm2, %xmm7                                  #835.46
        pslld     $13, %xmm0                                    #835.46
        pxor      %xmm0, %xmm7                                  #835.46
        psrld     $13, %xmm2                                    #835.46
        pxor      %xmm2, %xmm7                                  #835.46
        paddd     %xmm7, %xmm3                                  #835.18
        movdqa    %xmm5, %xmm0                                  #837.46
        pslld     $3, %xmm0                                     #837.46
        psrld     $1, %xmm5                                     #837.46
        movdqa    %xmm0, %xmm6                                  #837.46
        pxor      %xmm5, %xmm6                                  #837.46
        pslld     $1, %xmm0                                     #837.46
        pxor      %xmm0, %xmm6                                  #837.46
        psrld     $12, %xmm5                                    #837.46
        pxor      %xmm5, %xmm6                                  #837.46
        pslld     $15, %xmm0                                    #837.46
        pxor      %xmm0, %xmm6                                  #837.46
        psrld     $15, %xmm5                                    #837.46
        pxor      %xmm5, %xmm6                                  #837.46
        paddd     %xmm6, %xmm3                                  #837.18
        movaps    %xmm4, %xmm6                                  #841.22
        palignr   $4, %xmm1, %xmm6                              #841.22
        pxor      %xmm5, %xmm5                                  #842.22
        palignr   $4, %xmm4, %xmm5                              #842.22
        movdqa    %xmm6, %xmm1                                  #843.26
        punpcklqdq %xmm5, %xmm1                                 #843.26
        movdqa    %xmm1, %xmm4                                  #844.46
        pslld     $1, %xmm4                                     #844.46
        psrld     $2, %xmm1                                     #844.46
        movdqa    %xmm4, %xmm0                                  #844.46
        pxor      %xmm1, %xmm0                                  #844.46
        pslld     $11, %xmm4                                    #844.46
        pxor      %xmm4, %xmm0                                  #844.46
        psrld     $5, %xmm1                                     #844.46
        pxor      %xmm1, %xmm0                                  #844.46
        pslld     $13, %xmm4                                    #844.46
        pxor      %xmm4, %xmm0                                  #844.46
        movdqa    -872(%ebp), %xmm4                             #893.39
        psrld     $13, %xmm1                                    #844.46
        pxor      %xmm1, %xmm0                                  #844.46
        paddd     %xmm0, %xmm3                                  #844.18
        movdqa    -840(%ebp), %xmm0                             #895.39
        movdqa    %xmm6, %xmm2                                  #845.24
        punpckhqdq %xmm5, %xmm2                                 #845.24
        movdqa    %xmm2, %xmm7                                  #846.46
        pslld     $3, %xmm7                                     #846.46
        psrld     $1, %xmm2                                     #846.46
        movdqa    %xmm7, %xmm1                                  #846.46
        pxor      %xmm2, %xmm1                                  #846.46
        pslld     $1, %xmm7                                     #846.46
        pxor      %xmm7, %xmm1                                  #846.46
        psrld     $12, %xmm2                                    #846.46
        pxor      %xmm2, %xmm1                                  #846.46
        pslld     $15, %xmm7                                    #846.46
        pxor      %xmm7, %xmm1                                  #846.46
        psrld     $15, %xmm2                                    #846.46
        pxor      %xmm2, %xmm1                                  #846.46
        movdqa    -888(%ebp), %xmm2                             #892.39
        paddd     %xmm1, %xmm3                                  #846.18
        pshufd    $120, %xmm3, %xmm1                            #852.26
        pxor      %xmm3, %xmm3                                  #853.23
        phaddd    %xmm3, %xmm1                                  #853.23
        movdqa    -856(%ebp), %xmm3                             #899.23
        movdqa    %xmm1, -344(%ebp)                             #853.23
        movdqa    %xmm2, %xmm7                                  #897.23
        palignr   $12, %xmm0, %xmm7                             #897.23
        movdqa    %xmm4, %xmm5                                  #898.23
        movdqa    %xmm3, %xmm1                                  #899.23
        paddd     %xmm0, %xmm7                                  #906.14
        paddd     -792(%ebp), %xmm7                             #907.14
        palignr   $12, %xmm2, %xmm5                             #898.23
        movdqa    %xmm5, -328(%ebp)                             #898.23
        movdqa    %xmm3, %xmm5                                  #901.23
        palignr   $12, %xmm4, %xmm1                             #899.23
        movdqa    %xmm1, -312(%ebp)                             #899.23
        movdqa    -600(%ebp), %xmm1                             #914.24
        palignr   $8, %xmm4, %xmm5                              #901.23
        psubd     %xmm5, %xmm7                                  #910.14
        movdqa    -664(%ebp), %xmm5                             #914.24
        palignr   $12, %xmm1, %xmm5                             #914.24
        pxor      %xmm5, %xmm7                                  #915.14
        movdqa    -648(%ebp), %xmm5                             #931.24
        movdqa    %xmm7, -584(%ebp)                             #915.14
        movdqa    %xmm7, -904(%ebp)                             #916.20
        palignr   $12, %xmm3, %xmm0                             #918.23
        paddd     %xmm3, %xmm0                                  #924.14
        paddd     -808(%ebp), %xmm0                             #925.14
        movdqa    %xmm4, %xmm7                                  #919.23
        movdqa    %xmm6, %xmm3                                  #935.38
        psrld     $29, %xmm3                                    #935.38
        palignr   $8, %xmm2, %xmm7                              #919.23
        psubd     %xmm7, %xmm0                                  #928.14
        movaps    -424(%ebp), %xmm7                             #936.22
        palignr   $12, %xmm5, %xmm1                             #931.24
        pxor      %xmm1, %xmm0                                  #932.14
        movdqa    %xmm6, %xmm1                                  #935.38
        pslld     $3, %xmm1                                     #935.38
        por       %xmm1, %xmm3                                  #935.38
        movaps    -408(%ebp), %xmm1                             #936.22
        paddd     %xmm3, %xmm0                                  #935.14
        palignr   $12, %xmm1, %xmm7                             #936.22
        movdqa    %xmm7, -296(%ebp)                             #936.22
        movdqa    %xmm7, %xmm3                                  #938.38
        psrld     $25, %xmm3                                    #938.38
        pslld     $7, %xmm7                                     #938.38
        por       %xmm7, %xmm3                                  #938.38
        paddd     %xmm3, %xmm0                                  #938.14
        movdqa    -328(%ebp), %xmm3                             #946.14
        paddd     %xmm2, %xmm3                                  #946.14
        movdqa    -680(%ebp), %xmm2                             #957.24
        paddd     _2il0floatpacket.49, %xmm3                    #948.14
        movdqa    %xmm0, -280(%ebp)                             #938.14
        movdqa    %xmm2, %xmm7                                  #957.24
        palignr   $12, -664(%ebp), %xmm7                        #957.24
        movdqa    %xmm0, -920(%ebp)                             #939.20
        movq      -848(%ebp), %xmm0                             #952.57
        movhpd    -840(%ebp), %xmm0                             #952.38
        psubd     %xmm0, %xmm3                                  #952.14
        pxor      %xmm7, %xmm3                                  #958.14
        paddd     -344(%ebp), %xmm3                             #961.14
        movdqa    -312(%ebp), %xmm7                             #982.14
        movdqa    %xmm3, -952(%ebp)                             #962.20
        movdqa    %xmm3, %xmm0                                  #962.20
        psrldq    $4, %xmm0                                     #962.20
        paddd     %xmm4, %xmm7                                  #982.14
        paddd     _2il0floatpacket.50, %xmm7                    #985.14
        palignr   $12, %xmm2, %xmm5                             #992.24
        movq      -832(%ebp), %xmm4                             #988.57
        movhpd    -888(%ebp), %xmm4                             #988.38
        movdqa    -360(%ebp), %xmm2                             #997.38
        psubd     %xmm4, %xmm7                                  #988.14
        pxor      %xmm5, %xmm7                                  #993.14
        movdqa    %xmm2, %xmm5                                  #997.38
        psrld     $29, %xmm5                                    #997.38
        pslld     $3, %xmm2                                     #997.38
        por       %xmm2, %xmm5                                  #997.38
        paddd     %xmm5, %xmm7                                  #997.14
        movaps    %xmm1, %xmm2                                  #998.22
        palignr   $12, -392(%ebp), %xmm2                        #998.22
        movd      %xmm3, %edx                                   #1084.12
        movl      %edx, -164(%ebp)                              #1084.12
        movdqa    %xmm2, %xmm4                                  #1000.38
        psrld     $25, %xmm4                                    #1000.38
        pslld     $7, %xmm2                                     #1000.38
        por       %xmm2, %xmm4                                  #1000.38
        paddd     %xmm4, %xmm7                                  #1000.14
        movaps    -424(%ebp), %xmm4                             #1280.27
        lea       (,%edx,8), %eax                               #1088.12
        movl      %edx, %ecx                                    #1088.12
        roll      $19, %ecx                                     #1088.12
        movl      %edx, %esi                                    #1088.12
        shrl      $1, %esi                                      #1088.12
        movdqa    %xmm6, %xmm2                                  #1002.38
        psrld     $19, %xmm2                                    #1002.38
        pslld     $13, %xmm6                                    #1002.38
        por       %xmm6, %xmm2                                  #1002.38
        movdqa    -296(%ebp), %xmm6                             #1004.38
        pshufb    _2il0floatpacket.58, %xmm6                    #1004.38
        paddd     %xmm2, %xmm7                                  #1002.14
        movl      %eax, -216(%ebp)                              #1088.12
        paddd     %xmm6, %xmm7                                  #1004.14
        movdqa    %xmm7, %xmm2                                  #1006.20
        xorl      %ecx, %eax                                    #1088.12
        xorl      %esi, %eax                                    #1088.12
        movdqa    %xmm7, -936(%ebp)                             #1006.20
        psrldq    $8, %xmm2                                     #1006.20
        movl      %ecx, -68(%ebp)                               #1088.12
        roll      $17, %ecx                                     #1088.12
        xorl      %ecx, %eax                                    #1088.12
        movd      %xmm0, %ecx                                   #1091.13
        addl      %eax, %ecx                                    #1091.3
        movl      -172(%ebp), %eax                              #1103.13
        xorl      %ecx, %edx                                    #1092.3
        roll      $16, %eax                                     #1103.13
        movl      %esi, -64(%ebp)                               #1088.12
        movl      -196(%ebp), %esi                              #1101.13
        roll      $7, %esi                                      #1101.13
        movl      %ecx, -168(%ebp)                              #1091.3
        movl      %edx, -60(%ebp)                               #1092.3
        movl      -104(%ebp), %edx                              #1100.13
        roll      $3, %edx                                      #1100.13
        addl      -944(%ebp), %edx                              #1097.3
        addl      %esi, %edx                                    #1098.3
        movl      -204(%ebp), %esi                              #1102.13
        movl      %ecx, -948(%ebp)                              #1093.3
        roll      $13, %esi                                     #1102.13
        addl      %eax, %esi                                    #1099.3
        addl      %esi, %edx                                    #1100.3
        movl      %ecx, %eax                                    #1099.13
        shrl      $2, %eax                                      #1099.13
        movl      -164(%ebp), %esi                              #1098.13
        xorl      %ecx, %eax                                    #1099.13
        addl      %eax, %edi                                    #1101.3
        movl      -64(%ebp), %eax                               #1098.13
        xorl      %esi, %eax                                    #1098.13
        addl      -264(%ebp), %eax                              #1103.3
        shrl      $5, %esi                                      #1138.13
        movl      %esi, -188(%ebp)                              #1138.13
        addl      %eax, %edi                                    #1102.3
        movl      -192(%ebp), %esi                              #1134.13
        addl      %edi, %edx                                    #1107.3
        xorl      %edx, -60(%ebp)                               #1108.3
        movl      %edx, -136(%ebp)                              #1107.3
        movl      %ecx, %eax                                    #1115.13
        roll      $27, %eax                                     #1115.13
        movd      %xmm7, %edi                                   #1119.13
        roll      $3, %esi                                      #1134.13
        addl      -940(%ebp), %esi                              #1133.3
        movl      %edx, -944(%ebp)                              #1109.3
        addl      %eax, %edi                                    #1115.3
        movl      %edx, %eax                                    #1116.13
        shrl      $1, %eax                                      #1116.13
        xorl      %edx, %eax                                    #1116.13
        addl      -80(%ebp), %eax                               #1116.3
        addl      %eax, %edi                                    #1119.3
        movl      %edi, -140(%ebp)                              #1119.3
        movd      %xmm2, %eax                                   #1128.14
        movaps    -376(%ebp), %xmm2                             #1280.27
        movl      %ecx, %edi                                    #1125.13
        roll      $23, %edi                                     #1125.13
        addl      %edi, %eax                                    #1125.3
        addl      -72(%ebp), %eax                               #1128.3
        movl      -160(%ebp), %edi                              #1136.13
        roll      $13, %edi                                     #1136.13
        movl      %eax, -56(%ebp)                               #1128.3
        movl      -200(%ebp), %eax                              #1135.13
        roll      $7, %eax                                      #1135.13
        addl      %edi, %eax                                    #1134.3
        movl      -176(%ebp), %edi                              #1137.13
        addl      %eax, %esi                                    #1135.3
        roll      $16, %edi                                     #1137.13
        addl      %edi, %esi                                    #1136.3
        movl      -164(%ebp), %edi                              #1138.13
        movl      %ecx, %eax                                    #1139.13
        shrl      $1, %eax                                      #1139.13
        xorl      %ecx, %eax                                    #1139.13
        movl      %edx, %ecx                                    #1140.13
        shrl      $2, %ecx                                      #1140.13
        xorl      %edx, %ecx                                    #1140.13
        movl      %edi, %edx                                    #1138.13
        shll      $27, %edx                                     #1138.13
        orl       -188(%ebp), %edx                              #1138.13
        addl      %edx, %ecx                                    #1138.3
        movl      -100(%ebp), %edx                              #1147.27
        addl      %ecx, %eax                                    #1137.3
        movl      -96(%ebp), %ecx                               #1140.3
        addl      -260(%ebp), %ecx                              #1140.3
        negl      %edx                                          #1147.27
        addl      %edi, %edx                                    #1147.27
        addl      -264(%ebp), %edx                              #1147.27
        addl      %ecx, %eax                                    #1139.3
        movl      -140(%ebp), %ecx                              #1161.3
        addl      %eax, %esi                                    #1143.3
        movl      -60(%ebp), %eax                               #1145.3
        movl      %esi, -144(%ebp)                              #1143.3
        xorl      %esi, %eax                                    #1145.3
        addl      %edx, %ecx                                    #1161.3
        roll      $23, %edi                                     #1172.13
        addl      -92(%ebp), %edi                               #1175.3
        movl      %esi, -940(%ebp)                              #1146.3
        movl      %edx, -100(%ebp)                              #1147.27
        movl      %esi, %edx                                    #1162.13
        shrl      $2, %edx                                      #1162.13
        xorl      %esi, %edx                                    #1162.13
        addl      %edx, %ecx                                    #1162.3
        movl      -104(%ebp), %edx                              #1166.27
        movl      %ecx, -140(%ebp)                              #1162.3
        xorl      %ecx, %eax                                    #1163.3
        negl      %edx                                          #1166.27
        addl      -168(%ebp), %edx                              #1166.27
        addl      -260(%ebp), %edx                              #1166.27
        movl      %eax, -60(%ebp)                               #1163.3
        movl      -932(%ebp), %eax                              #1178.13
        addl      %edx, %eax                                    #1168.3
        movl      %ecx, -936(%ebp)                              #1164.3
        movl      %edx, -104(%ebp)                              #1166.27
        movl      %esi, %edx                                    #1174.13
        shrl      $1, %edx                                      #1174.13
        xorl      %esi, %edx                                    #1174.13
        movl      -136(%ebp), %esi                              #1173.13
        addl      %edx, %eax                                    #1172.3
        movl      %ecx, %edx                                    #1175.13
        shrl      $2, %edx                                      #1175.13
        xorl      %ecx, %edx                                    #1175.13
        movl      %esi, %ecx                                    #1173.13
        roll      $27, %ecx                                     #1173.13
        addl      %ecx, %edx                                    #1173.3
        movl      -144(%ebp), %ecx                              #1185.13
        addl      %edi, %edx                                    #1174.3
        movl      -100(%ebp), %edi                              #1182.29
        subl      -192(%ebp), %edi                              #1182.29
        addl      %edx, %eax                                    #1178.3
        movl      -60(%ebp), %edx                               #1180.3
        movl      %eax, -156(%ebp)                              #1178.3
        xorl      %eax, %edx                                    #1180.3
        addl      %esi, %edi                                    #1182.29
        movl      %ecx, %esi                                    #1185.13
        roll      $27, %esi                                     #1185.13
        movl      %eax, -932(%ebp)                              #1181.3
        addl      %edi, %esi                                    #1184.3
        movl      %edi, -100(%ebp)                              #1182.29
        movl      %eax, %edi                                    #1187.13
        shrl      $2, %edi                                      #1187.13
        xorl      %eax, %edi                                    #1187.13
        addl      %edi, %esi                                    #1185.3
        movl      -140(%ebp), %edi                              #1186.13
        movl      %edi, %eax                                    #1186.13
        shrl      $1, %eax                                      #1186.13
        xorl      %edi, %eax                                    #1186.13
        addl      -56(%ebp), %eax                               #1186.3
        addl      %eax, %esi                                    #1187.3
        movl      %esi, -148(%ebp)                              #1187.3
        xorl      %esi, %edx                                    #1188.3
        movl      %edx, -60(%ebp)                               #1188.3
        movl      -104(%ebp), %edx                              #1190.27
        subl      -196(%ebp), %edx                              #1190.27
        addl      %ecx, %edx                                    #1190.27
        movl      -156(%ebp), %ecx                              #1198.13
        movl      %esi, -928(%ebp)                              #1189.3
        movl      %ecx, %eax                                    #1198.13
        shrl      $1, %eax                                      #1198.13
        xorl      %ecx, %eax                                    #1198.13
        addl      -924(%ebp), %eax                              #1195.3
        movl      %edx, -104(%ebp)                              #1190.27
        movl      %edi, %ecx                                    #1197.13
        roll      $27, %ecx                                     #1197.13
        addl      %ecx, %eax                                    #1196.3
        movl      %esi, %ecx                                    #1199.13
        shrl      $2, %ecx                                      #1199.13
        xorl      %esi, %ecx                                    #1199.13
        movl      -136(%ebp), %esi                              #1196.13
        roll      $23, %esi                                     #1196.13
        addl      %esi, %ecx                                    #1197.3
        movl      -68(%ebp), %esi                               #1199.3
        addl      %edx, %esi                                    #1199.3
        movl      -100(%ebp), %edx                              #1205.29
        subl      -200(%ebp), %edx                              #1205.29
        addl      %esi, %ecx                                    #1198.3
        addl      %ecx, %eax                                    #1202.3
        movl      -60(%ebp), %ecx                               #1203.3
        movl      %eax, -152(%ebp)                              #1202.3
        xorl      %eax, %ecx                                    #1203.3
        addl      %edi, %edx                                    #1205.29
        movl      %ecx, %edi                                    #1213.35
        shll      $4, %edi                                      #1213.35
        movl      %ecx, -60(%ebp)                               #1203.3
        movl      %ecx, %esi                                    #1215.35
        shll      $8, %esi                                      #1215.35
        movl      %eax, -924(%ebp)                              #1204.3
        movl      %edx, -100(%ebp)                              #1205.29
        movl      %ecx, %edx                                    #1214.35
        shll      $6, %edx                                      #1214.35
        movl      %ecx, -248(%ebp)                              #1208.3
        movq      -248(%ebp), %xmm0                             #1209.21
        pshufd    $0, %xmm0, %xmm0                              #1210.13
        movl      %edi, -620(%ebp)                              #1213.3
        movl      %ecx, %edi                                    #1218.35
        shrl      $3, %edi                                      #1218.35
        movl      %edx, -624(%ebp)                              #1214.3
        movl      %ecx, %edx                                    #1217.35
        shrl      $2, %edx                                      #1217.35
        movl      %esi, -632(%ebp)                              #1215.3
        movl      %ecx, %esi                                    #1220.35
        shrl      $6, %esi                                      #1220.35
        movl      %edx, -604(%ebp)                              #1217.3
        movl      %ecx, %edx                                    #1219.35
        shrl      $4, %edx                                      #1219.35
        shrl      $7, %ecx                                      #1221.35
        movl      %edi, -616(%ebp)                              #1218.3
        movl      -144(%ebp), %edi                              #1237.13
        roll      $23, %edi                                     #1237.13
        movl      %edx, -612(%ebp)                              #1219.3
        movl      -280(%ebp), %edx                              #1243.13
        addl      %edi, %edx                                    #1233.3
        movl      -148(%ebp), %edi                              #1239.13
        movl      %esi, -628(%ebp)                              #1220.3
        movl      %edi, %esi                                    #1239.13
        shrl      $1, %esi                                      #1239.13
        xorl      %edi, %esi                                    #1239.13
        roll      $27, %edi                                     #1253.13
        movl      %ecx, -608(%ebp)                              #1221.3
        movl      -156(%ebp), %ecx                              #1238.13
        roll      $27, %ecx                                     #1238.13
        addl      %esi, %ecx                                    #1236.3
        movl      -168(%ebp), %esi                              #1236.13
        addl      %ecx, %edx                                    #1237.3
        roll      $19, %esi                                     #1236.13
        movl      %eax, %ecx                                    #1240.13
        shrl      $2, %ecx                                      #1240.13
        xorl      %eax, %ecx                                    #1240.13
        movl      -84(%ebp), %eax                               #1240.3
        addl      -100(%ebp), %eax                              #1240.3
        addl      %ecx, %esi                                    #1238.3
        addl      %eax, %esi                                    #1239.3
        movl      -156(%ebp), %eax                              #1246.27
        subl      -204(%ebp), %eax                              #1246.27
        addl      -104(%ebp), %eax                              #1246.27
        movl      -916(%ebp), %ecx                              #1258.13
        addl      %esi, %edx                                    #1243.3
        movl      -60(%ebp), %esi                               #1244.16
        movl      %edx, -108(%ebp)                              #1243.3
        xorl      %edx, %esi                                    #1244.16
        addl      %eax, %ecx                                    #1248.3
        movl      %esi, -52(%ebp)                               #1244.16
        movl      %edx, %esi                                    #1255.13
        shrl      $2, %esi                                      #1255.13
        xorl      %edx, %esi                                    #1255.13
        addl      %esi, %ecx                                    #1250.3
        movl      -152(%ebp), %esi                              #1254.13
        movl      %edx, -920(%ebp)                              #1245.3
        movl      -140(%ebp), %edx                              #1252.13
        roll      $23, %edx                                     #1252.13
        addl      %edi, %edx                                    #1251.3
        movl      -136(%ebp), %edi                              #1251.13
        movl      %eax, -120(%ebp)                              #1246.27
        roll      $19, %edi                                     #1251.13
        movl      %esi, %eax                                    #1254.13
        shrl      $1, %eax                                      #1254.13
        xorl      %esi, %eax                                    #1254.13
        addl      %eax, %edi                                    #1253.3
        movl      -160(%ebp), %eax                              #1261.29
        addl      %edi, %edx                                    #1252.3
        addl      %edx, %ecx                                    #1254.3
        movl      -164(%ebp), %edx                              #1250.13
        roll      $16, %edx                                     #1250.13
        addl      -88(%ebp), %edx                               #1255.3
        negl      %eax                                          #1261.29
        addl      -148(%ebp), %eax                              #1261.29
        addl      -100(%ebp), %eax                              #1261.29
        movl      -912(%ebp), %edi                              #1277.13
        addl      %edx, %ecx                                    #1258.3
        movl      -144(%ebp), %edx                              #1270.13
        xorl      %ecx, -52(%ebp)                               #1259.3
        movl      %ecx, -116(%ebp)                              #1258.3
        addl      %eax, %edi                                    #1267.3
        roll      $19, %edx                                     #1270.13
        addl      %edx, %edi                                    #1269.3
        roll      $27, %esi                                     #1272.13
        addl      -76(%ebp), %esi                               #1274.3
        movl      %ecx, -916(%ebp)                              #1260.3
        movl      %ecx, %edx                                    #1274.13
        shrl      $2, %edx                                      #1274.13
        xorl      %ecx, %edx                                    #1274.13
        movl      -108(%ebp), %ecx                              #1273.13
        movl      %eax, -160(%ebp)                              #1261.29
        movl      -156(%ebp), %eax                              #1271.13
        roll      $23, %eax                                     #1271.13
        addl      %edx, %eax                                    #1270.3
        movl      %ecx, %edx                                    #1273.13
        shrl      $1, %edx                                      #1273.13
        xorl      %ecx, %edx                                    #1273.13
        movl      -168(%ebp), %ecx                              #1269.13
        roll      $16, %ecx                                     #1269.13
        addl      %ecx, %edx                                    #1272.3
        addl      %edx, %eax                                    #1271.3
        movl      -52(%ebp), %edx                               #1278.3
        addl      %eax, %edi                                    #1273.3
        movl      -172(%ebp), %eax                              #1280.27
        subl      %eax, -120(%ebp)                              #1280.27
        movl      -60(%ebp), %eax                               #1280.27
        addl      %esi, %edi                                    #1277.3
        movl      %edi, -112(%ebp)                              #1277.3
        xorl      %edi, %edx                                    #1278.3
        movl      %edi, -912(%ebp)                              #1279.3
                                # LOE eax edx al ah xmm0 xmm1 xmm2 xmm4 ymm1 ymm2 ymm4
..B1.7:                         # Preds ..B1.3
        movl      -120(%ebp), %ecx                              #1280.27
        addl      -152(%ebp), %ecx                              #1280.27
        movl      -116(%ebp), %edi                              #1288.13
        movl      %eax, -60(%ebp)                               #
        movl      -908(%ebp), %eax                              #1292.13
        movl      %ecx, -120(%ebp)                              #1280.27
        addl      %ecx, %eax                                    #1283.3
        movl      %edi, %esi                                    #1288.13
        shrl      $1, %esi                                      #1288.13
        xorl      %edi, %esi                                    #1288.13
        pxor      %xmm0, %xmm2                                  #1404.16
        movl      -140(%ebp), %ecx                              #1285.13
        movl      -112(%ebp), %edi                              #1289.13
        addl      %esi, %eax                                    #1284.3
        movl      -108(%ebp), %esi                              #1287.13
        roll      $27, %esi                                     #1287.13
        roll      $19, %ecx                                     #1285.13
        addl      %ecx, %esi                                    #1285.3
        movl      %edi, %ecx                                    #1289.13
        shrl      $2, %ecx                                      #1289.13
        xorl      %edi, %ecx                                    #1289.13
        movl      -148(%ebp), %edi                              #1286.13
        roll      $23, %edi                                     #1286.13
        addl      %edi, %ecx                                    #1287.3
        movl      -156(%ebp), %edi                              #1301.13
        addl      %ecx, %esi                                    #1286.3
        movl      -164(%ebp), %ecx                              #1283.13
        addl      %esi, %eax                                    #1288.3
        movl      -136(%ebp), %esi                              #1284.13
        roll      $16, %esi                                     #1284.13
        roll      $13, %ecx                                     #1283.13
        addl      %ecx, %esi                                    #1289.3
        movl      -160(%ebp), %ecx                              #1296.29
        subl      -176(%ebp), %ecx                              #1296.29
        addl      -108(%ebp), %ecx                              #1296.29
        addl      %esi, %eax                                    #1292.3
        movl      -112(%ebp), %esi                              #1304.13
        movl      %eax, -48(%ebp)                               #1292.3
        xorl      %eax, %edx                                    #1293.3
        roll      $19, %edi                                     #1301.13
        movl      %edx, -52(%ebp)                               #1293.3
        movl      -584(%ebp), %edx                              #1308.13
        addl      %ecx, %edx                                    #1298.3
        movl      %eax, -908(%ebp)                              #1294.3
        movdqa    -920(%ebp), %xmm0                             #1406.30
        pxor      %xmm0, %xmm2                                  #1408.16
        pxor      -776(%ebp), %xmm0                             #1468.24
        movl      %ecx, -160(%ebp)                              #1296.29
        movl      -144(%ebp), %ecx                              #1300.13
        roll      $16, %ecx                                     #1300.13
        addl      %edi, %ecx                                    #1299.3
        movl      -116(%ebp), %edi                              #1303.13
        addl      %ecx, %edx                                    #1300.3
        roll      $27, %edi                                     #1303.13
        movl      %esi, %ecx                                    #1304.13
        shrl      $1, %ecx                                      #1304.13
        xorl      %esi, %ecx                                    #1304.13
        movl      -152(%ebp), %esi                              #1302.13
        addl      %ecx, %edi                                    #1301.3
        movl      -168(%ebp), %ecx                              #1299.13
        roll      $13, %ecx                                     #1299.13
        roll      $23, %esi                                     #1302.13
        addl      %esi, %ecx                                    #1303.3
        movl      -140(%ebp), %esi                              #1319.13
        addl      %ecx, %edi                                    #1302.3
        movl      -148(%ebp), %ecx                              #1320.13
        addl      %edi, %edx                                    #1304.3
        movl      %eax, %edi                                    #1305.13
        shrl      $2, %edi                                      #1305.13
        xorl      %eax, %edi                                    #1305.13
        addl      -212(%ebp), %edi                              #1305.3
        movl      -120(%ebp), %eax                              #1313.27
        subl      -184(%ebp), %eax                              #1313.27
        addl      -116(%ebp), %eax                              #1313.27
        roll      $16, %esi                                     #1319.13
        roll      $19, %ecx                                     #1320.13
        movl      %eax, -120(%ebp)                              #1313.27
        addl      %edi, %edx                                    #1308.3
        movl      -124(%ebp), %edi                              #1316.13
        xorl      %edx, -52(%ebp)                               #1310.3
        movl      %edx, -44(%ebp)                               #1308.3
        roll      $3, %edi                                      #1316.13
        addl      -900(%ebp), %edi                              #1316.3
        movl      %edx, -904(%ebp)                              #1311.3
        addl      %eax, %edi                                    #1317.3
        movl      -108(%ebp), %eax                              #1321.13
        roll      $23, %eax                                     #1321.13
        addl      %esi, %eax                                    #1318.3
        movl      -112(%ebp), %esi                              #1322.13
        roll      $27, %esi                                     #1322.13
        addl      %ecx, %esi                                    #1320.3
        addl      %esi, %eax                                    #1319.3
        addl      %eax, %edi                                    #1321.3
        movl      -136(%ebp), %eax                              #1318.13
        movl      %edx, %esi                                    #1324.13
        shrl      $2, %esi                                      #1324.13
        xorl      %edx, %esi                                    #1324.13
        roll      $13, %eax                                     #1318.13
        addl      %eax, %esi                                    #1322.3
        movl      -48(%ebp), %eax                               #1323.13
        movl      %eax, %ecx                                    #1323.13
        shrl      $1, %ecx                                      #1323.13
        xorl      %eax, %ecx                                    #1323.13
        movl      -164(%ebp), %eax                              #1317.13
        roll      $7, %eax                                      #1317.13
        addl      %eax, %ecx                                    #1324.3
        movl      -116(%ebp), %eax                              #1339.13
        addl      %ecx, %esi                                    #1323.3
        movl      -128(%ebp), %ecx                              #1334.13
        addl      %esi, %edi                                    #1327.3
        movl      -144(%ebp), %esi                              #1336.13
        xorl      %edi, -52(%ebp)                               #1328.3
        movl      %edi, -124(%ebp)                              #1327.3
        roll      $3, %ecx                                      #1334.13
        addl      -896(%ebp), %ecx                              #1334.3
        roll      $13, %esi                                     #1336.13
        addl      %esi, %ecx                                    #1335.3
        movl      -156(%ebp), %esi                              #1337.13
        movl      %edi, -900(%ebp)                              #1329.3
        roll      $16, %esi                                     #1337.13
        roll      $23, %eax                                     #1339.13
        addl      %eax, %esi                                    #1336.3
        movl      %edx, %eax                                    #1341.13
        shrl      $1, %eax                                      #1341.13
        xorl      %edx, %eax                                    #1341.13
        movl      -168(%ebp), %edx                              #1335.13
        roll      $7, %edx                                      #1335.13
        addl      %edx, %eax                                    #1338.3
        addl      %eax, %esi                                    #1337.3
        movl      -160(%ebp), %eax                              #1331.29
        subl      -208(%ebp), %eax                              #1331.29
        addl      -112(%ebp), %eax                              #1331.29
        addl      %esi, %ecx                                    #1339.3
        movl      -152(%ebp), %esi                              #1338.13
        roll      $19, %esi                                     #1338.13
        addl      %eax, %esi                                    #1340.3
        movl      -48(%ebp), %eax                               #1340.13
        roll      $27, %eax                                     #1340.13
        movl      %edi, %edx                                    #1342.13
        shrl      $2, %edx                                      #1342.13
        xorl      %edi, %edx                                    #1342.13
        addl      %edx, %eax                                    #1342.3
        movl      -112(%ebp), %edx                              #1357.13
        addl      %eax, %esi                                    #1341.3
        movl      -148(%ebp), %eax                              #1355.13
        addl      %esi, %ecx                                    #1345.3
        movl      -108(%ebp), %esi                              #1356.13
        xorl      %ecx, -52(%ebp)                               #1346.3
        movl      %ecx, -128(%ebp)                              #1345.3
        roll      $19, %esi                                     #1356.13
        addl      -892(%ebp), %esi                              #1352.3
        roll      $23, %edx                                     #1357.13
        movl      %ecx, -896(%ebp)                              #1347.3
        movl      -140(%ebp), %ecx                              #1354.13
        roll      $13, %ecx                                     #1354.13
        addl      %ecx, %esi                                    #1353.3
        movl      -136(%ebp), %ecx                              #1353.13
        roll      $16, %eax                                     #1355.13
        addl      %eax, %edx                                    #1354.3
        movl      -44(%ebp), %eax                               #1358.13
        roll      $27, %eax                                     #1358.13
        roll      $7, %ecx                                      #1353.13
        addl      %ecx, %eax                                    #1356.3
        movl      -120(%ebp), %ecx                              #1349.27
        subl      -180(%ebp), %ecx                              #1349.27
        addl      -48(%ebp), %ecx                               #1349.27
        addl      %eax, %edx                                    #1355.3
        addl      %edx, %esi                                    #1357.3
        movl      %edi, %edx                                    #1359.13
        shrl      $1, %edx                                      #1359.13
        xorl      %edi, %edx                                    #1359.13
        movl      -128(%ebp), %edi                              #1360.13
        addl      %edx, %ecx                                    #1358.3
        movl      -164(%ebp), %edx                              #1352.13
        movl      %edi, %eax                                    #1360.13
        shrl      $2, %eax                                      #1360.13
        xorl      %edi, %eax                                    #1360.13
        movl      -216(%ebp), %edi                              #1352.13
        shrl      $29, %edx                                     #1352.13
        orl       %edx, %edi                                    #1352.13
        movl      -52(%ebp), %edx                               #1364.3
        addl      %edi, %eax                                    #1360.3
        addl      %eax, %ecx                                    #1359.3
        movl      -168(%ebp), %eax                              #1414.53
        addl      %ecx, %esi                                    #1363.3
        movl      %esi, -108(%ebp)                              #1363.3
        xorl      %esi, %edx                                    #1364.3
        movl      %edx, %ecx                                    #1413.38
        shll      $5, %ecx                                      #1413.38
        xorl      -188(%ebp), %ecx                              #1413.53
        xorl      -220(%ebp), %ecx                              #1413.69
        movl      %esi, -892(%ebp)                              #1365.3
        movdqa    -904(%ebp), %xmm3                             #1407.30
        pxor      -696(%ebp), %xmm3                             #1472.24
        movd      %xmm2, %esi                                   #1413.3
        addl      %ecx, %esi                                    #1413.3
        shll      $8, %eax                                      #1414.53
        movl      %edx, -248(%ebp)                              #1367.3
        movq      -248(%ebp), %xmm6                             #1368.21
        pshufd    $0, %xmm6, %xmm5                              #1369.13
        movdqa    -936(%ebp), %xmm6                             #1457.30
        movdqa    %xmm2, -760(%ebp)                             #1409.20
        movdqa    -952(%ebp), %xmm2                             #1456.30
        movl      %esi, -40(%ebp)                               #1413.3
        movl      %edx, %ecx                                    #1414.38
        shrl      $7, %ecx                                      #1414.38
        xorl      %eax, %ecx                                    #1414.53
        xorl      -224(%ebp), %ecx                              #1414.69
        addl      -756(%ebp), %ecx                              #1414.3
        movl      %esi, -760(%ebp)                              #1413.3
        movl      -136(%ebp), %esi                              #1415.53
        movl      %edx, %edi                                    #1415.38
        shrl      $5, %edi                                      #1415.38
        shll      $5, %esi                                      #1415.53
        xorl      %esi, %edi                                    #1415.53
        xorl      -228(%ebp), %edi                              #1415.69
        addl      -752(%ebp), %edi                              #1415.3
        movl      %ecx, -36(%ebp)                               #1414.3
        movl      %edx, %esi                                    #1416.38
        shrl      $1, %esi                                      #1416.38
        movdqa    %xmm2, %xmm7                                  #1458.26
        palignr   $12, %xmm6, %xmm7                             #1458.26
        pxor      %xmm7, %xmm1                                  #1461.15
        pxor      -632(%ebp), %xmm1                             #1462.15
        movl      %ecx, -756(%ebp)                              #1414.3
        movl      -144(%ebp), %ecx                              #1416.53
        shll      $5, %ecx                                      #1416.53
        xorl      %ecx, %esi                                    #1416.53
        xorl      -232(%ebp), %esi                              #1416.69
        addl      -748(%ebp), %esi                              #1416.3
        movl      -60(%ebp), %ecx                               #1417.97
        movl      %edi, -32(%ebp)                               #1415.3
        movl      %edx, %eax                                    #1417.37
        shrl      $3, %eax                                      #1417.37
        xorl      -140(%ebp), %eax                              #1417.56
        xorl      -256(%ebp), %eax                              #1417.68
        palignr   $12, %xmm2, %xmm6                             #1459.22
        pxor      %xmm6, %xmm4                                  #1463.15
        pxor      -616(%ebp), %xmm4                             #1464.15
        pxor      %xmm5, %xmm0                                  #1469.16
        paddd     %xmm0, %xmm1                                  #1470.16
        movl      %edi, -752(%ebp)                              #1415.3
        movl      -156(%ebp), %edi                              #1418.52
        shrl      $6, %edi                                      #1418.52
        pxor      %xmm5, %xmm3                                  #1473.16
        paddd     %xmm3, %xmm4                                  #1474.16
        movl      %esi, -28(%ebp)                               #1416.3
        movl      %esi, -748(%ebp)                              #1416.3
        movl      -44(%ebp), %esi                               #1417.97
        xorl      %ecx, %esi                                    #1417.97
        xorl      -192(%ebp), %esi                              #1417.106
        addl      %eax, %esi                                    #1417.106
        movl      -124(%ebp), %eax                              #1418.97
        movl      %esi, -44(%ebp)                               #1417.106
        xorl      %ecx, %eax                                    #1418.97
        xorl      -196(%ebp), %eax                              #1418.106
        movl      %esi, -744(%ebp)                              #1417.3
        movl      %edx, %esi                                    #1418.37
        shll      $6, %esi                                      #1418.37
        xorl      %edi, %esi                                    #1418.52
        xorl      -236(%ebp), %esi                              #1418.68
        movl      -148(%ebp), %edi                              #1419.52
        shll      $6, %edi                                      #1419.52
        addl      %esi, %eax                                    #1418.106
        movl      -128(%ebp), %esi                              #1419.97
        movl      %eax, -124(%ebp)                              #1418.106
        xorl      %ecx, %esi                                    #1419.97
        xorl      -200(%ebp), %esi                              #1419.106
        xorl      -108(%ebp), %ecx                              #1420.97
        xorl      -204(%ebp), %ecx                              #1420.106
        movl      %eax, -740(%ebp)                              #1418.3
        movl      %edx, %eax                                    #1419.37
        shrl      $4, %eax                                      #1419.37
        shrl      $11, %edx                                     #1420.37
        xorl      %edi, %eax                                    #1419.52
        xorl      -252(%ebp), %eax                              #1419.68
        movl      -152(%ebp), %edi                              #1420.52
        shll      $2, %edi                                      #1420.52
        addl      %eax, %esi                                    #1419.106
        movl      %esi, -736(%ebp)                              #1419.3
        movd      %xmm1, %eax                                   #1508.3
        roll      $11, %esi                                     #1508.15
        xorl      %edi, %edx                                    #1420.52
        xorl      -240(%ebp), %edx                              #1420.68
        movl      -124(%ebp), %edi                              #1508.15
        movdqa    %xmm4, -712(%ebp)                             #1476.20
        addl      %edx, %ecx                                    #1420.106
        movl      -44(%ebp), %edx                               #1508.15
        movl      %ecx, -732(%ebp)                              #1420.3
        roll      $9, %edx                                      #1508.15
        addl      %edx, %eax                                    #1508.3
        movl      -32(%ebp), %edx                               #1512.15
        movdqa    %xmm1, -728(%ebp)                             #1477.20
        addl      %esi, -720(%ebp)                              #1508.3
        roll      $10, %edi                                     #1508.15
        addl      %edi, -724(%ebp)                              #1508.3
        movl      -132(%ebp), %edi                              #1519.3
        movl      %eax, -728(%ebp)                              #1508.3
        roll      $12, %ecx                                     #1508.15
        movl      -36(%ebp), %eax                               #1512.15
        addl      %ecx, -716(%ebp)                              #1508.3
        movl      -40(%ebp), %ecx                               #1512.15
        roll      $13, %ecx                                     #1512.15
        movd      %xmm4, %esi                                   #1512.3
        addl      %ecx, %esi                                    #1512.3
        movl      -28(%ebp), %ecx                               #1512.15
        movl      %esi, -712(%ebp)                              #1512.3
        roll      $14, %eax                                     #1512.15
        addl      %eax, -708(%ebp)                              #1512.3
        roll      $15, %edx                                     #1512.15
        addl      %edx, -704(%ebp)                              #1512.3
        addl      $64, %edi                                     #1519.3
        roll      $16, %ecx                                     #1512.15
        addl      %ecx, -700(%ebp)                              #1512.3
        cmpl      12(%ebx), %edi                                #1521.18
        movl      %edi, -132(%ebp)                              #1519.3
        jb        ..B1.2        # Prob 82%                      #1521.18
                                # LOE
..B1.4:                         # Preds ..B1.7
        movdqa    -760(%ebp), %xmm0                             #1526.29
        movdqa    -744(%ebp), %xmm1                             #1528.29
        movdqa    -728(%ebp), %xmm2                             #1530.29
        movdqa    -712(%ebp), %xmm3                             #1532.29
        movl      -816(%ebp), %esi                              #1556.1
        movl      -812(%ebp), %edi                              #1556.1
        movl      16(%ebx), %eax                                #1527.19
        movdqa    %xmm0, 16(%eax)                               #1527.19
        movdqa    %xmm1, 32(%eax)                               #1529.19
        movdqa    %xmm2, 48(%eax)                               #1531.19
        movdqa    %xmm3, 64(%eax)                               #1533.19
        movl      %ebp, %esp                                    #1556.1
        popl      %ebp                                          #1556.1
        movl      %ebx, %esp                                    #1556.1
        popl      %ebx                                          #1556.1
        ret                                                     #1556.1
        .align    16,0x90
                                # LOE
# mark_end;
	.type	Compress256,@function
	.size	Compress256,.-Compress256
	.data
# -- End  Compress256
	.section .rodata, "a"
	.align 32
	.align 32
	.globl consts256
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
	.long	2236962125
	.long	2326440610
	.long	2415919095
	.long	2505397580
	.long	2594876065
	.long	2684354550
	.long	2773833035
	.type	consts256,@object
	.size	consts256,64
	.align 32
	.globl negate256
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
	.type	negate256,@object
	.size	negate256,112
	.align 16
_2il0floatpacket.49:
	.long	0x55555550,0x5aaaaaa5,0x5ffffffa,0x6555554f
	.type	_2il0floatpacket.49,@object
	.size	_2il0floatpacket.49,16
	.align 16
_2il0floatpacket.50:
	.long	0x6aaaaaa4,0x6ffffff9,0x7555554e,0x7aaaaaa3
	.type	_2il0floatpacket.50,@object
	.size	_2il0floatpacket.50,16
	.align 16
_2il0floatpacket.51:
	.long	0xffffffff,0xffffffff,0x00000001,0xffffffff
	.type	_2il0floatpacket.51,@object
	.size	_2il0floatpacket.51,16
	.align 16
_2il0floatpacket.52:
	.long	0x00000001,0xffffffff,0x00000001,0xffffffff
	.type	_2il0floatpacket.52,@object
	.size	_2il0floatpacket.52,16
	.align 16
_2il0floatpacket.53:
	.long	0x00000001,0x00000001,0xffffffff,0xffffffff
	.type	_2il0floatpacket.53,@object
	.size	_2il0floatpacket.53,16
	.align 16
_2il0floatpacket.54:
	.long	0x00000001,0xffffffff,0xffffffff,0xffffffff
	.type	_2il0floatpacket.54,@object
	.size	_2il0floatpacket.54,16
	.align 16
_2il0floatpacket.55:
	.long	0x00000001,0x00000001,0x00000001,0xffffffff
	.type	_2il0floatpacket.55,@object
	.size	_2il0floatpacket.55,16
	.align 16
_2il0floatpacket.56:
	.long	0xffffffff,0x00000001,0xffffffff,0xffffffff
	.type	_2il0floatpacket.56,@object
	.size	_2il0floatpacket.56,16
	.align 16
_2il0floatpacket.57:
	.long	0xffffffff,0x00000001,0x00000001,0xffffffff
	.type	_2il0floatpacket.57,@object
	.size	_2il0floatpacket.57,16
	.align 16
_2il0floatpacket.58:
	.long	0x01000302,0x05040706,0x09080b0a,0x0d0c0f0e
	.type	_2il0floatpacket.58,@object
	.size	_2il0floatpacket.58,16
	.data
	.section .note.GNU-stack, ""
# End
