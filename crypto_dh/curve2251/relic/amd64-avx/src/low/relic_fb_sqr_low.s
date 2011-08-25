# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.0.084 Build 2010100";
# mark_description "6";
# mark_description "-I/home/dfaranha/projects/relic-targets/target-icc/include -I/home/dfaranha/projects/relic-toolkit/include -";
# mark_description "I/home/dfaranha/projects/relic-toolkit/include/low -D_GNU_SOURCE -pipe -std=c99 -Wall -O3 -xAVX -S -o CMakeF";
# mark_description "iles/relic_s.dir/low/corei7-251/relic_fb_sqr_low.c.o -c";
	.file "relic_fb_sqr_low.c"
	.text
..TXTST3:
# -- Begin  fb_sqrn_low
# mark_begin;
       .align    16,0x90
	.globl fb_sqrn_low
fb_sqrn_low:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1c:                         # Preds ..B1.0
..___tag_value_fb_sqrn_low.1:                                   #55.38
        xorl      %edx, %edx                                    #57.8
        vmovdqu   .L_2il0floatpacket.2(%rip), %xmm5             #63.38
        xorl      %eax, %eax                                    #59.13
        vmovdqu   .L_2il0floatpacket.3(%rip), %xmm4             #67.38
        vpxor     %xmm0, %xmm0, %xmm0                           #60.8
        vmovdqu   .L_2il0floatpacket.4(%rip), %xmm3             #71.38
        vmovdqu   .L_2il0floatpacket.5(%rip), %xmm2             #75.38
        vmovdqu   .L_2il0floatpacket.6(%rip), %xmm1             #79.38
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.2:                         # Preds ..B1.2 ..B1.1
        movq      (%rsi,%rax,8), %rcx                           #60.58
        incq      %rax                                          #59.31
        vmovd     %ecx, %xmm6                                   #60.8
        shrq      $32, %rcx                                     #60.42
        vpunpcklqdq %xmm0, %xmm6, %xmm8                         #60.8
        vmovd     %ecx, %xmm7                                   #60.8
        vpunpcklqdq %xmm0, %xmm7, %xmm9                         #60.8
        vshufps   $136, %xmm9, %xmm8, %xmm11                    #60.8
        vpsllq    $16, %xmm11, %xmm10                           #61.7
        vpor      %xmm11, %xmm10, %xmm12                        #62.7
        vpand     %xmm5, %xmm12, %xmm14                         #63.7
        vpsllq    $8, %xmm14, %xmm13                            #65.7
        vpor      %xmm14, %xmm13, %xmm15                        #66.7
        vpand     %xmm4, %xmm15, %xmm7                          #67.7
        vpsllq    $4, %xmm7, %xmm6                              #69.7
        vpor      %xmm7, %xmm6, %xmm8                           #70.7
        vpand     %xmm3, %xmm8, %xmm10                          #71.7
        vpsllq    $2, %xmm10, %xmm9                             #73.7
        vpor      %xmm10, %xmm9, %xmm11                         #74.7
        vpand     %xmm2, %xmm11, %xmm13                         #75.7
        vpsllq    $1, %xmm13, %xmm12                            #77.7
        vpor      %xmm13, %xmm12, %xmm14                        #78.7
        vpand     %xmm1, %xmm14, %xmm15                         #79.7
        vmovdqu   %xmm15, (%rdi,%rdx,8)                         #80.31
        addq      $2, %rdx                                      #81.3
        cmpq      $4, %rax                                      #59.22
        jl        ..B1.2        # Prob 75%                      #59.22
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.3:                         # Preds ..B1.2
        ret                                                     #83.1
        .align    16,0x90
..___tag_value_fb_sqrn_low.3:                                   #
                                # LOE
# mark_end;
	.type	fb_sqrn_low,@function
	.size	fb_sqrn_low,.-fb_sqrn_low
	.data
# -- End  fb_sqrn_low
	.text
# -- Begin  fb_sqrl_low
# mark_begin;
       .align    16,0x90
	.globl fb_sqrl_low
fb_sqrl_low:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.1c:                         # Preds ..B2.0
..___tag_value_fb_sqrl_low.4:                                   #85.38
        vmovdqu   (%rsi), %xmm1                                 #92.33
        vmovdqu   16(%rsi), %xmm7                               #101.34
        vpsrlq    $4, %xmm1, %xmm2                              #95.7
        vmovdqu   .L_2il0floatpacket.10(%rip), %xmm9            #90.9
        vpsrlq    $4, %xmm7, %xmm8                              #104.7
        vmovdqu   .L_2il0floatpacket.9(%rip), %xmm10            #89.7
        vpand     %xmm9, %xmm1, %xmm0                           #93.7
        vpand     %xmm9, %xmm2, %xmm3                           #96.7
        vpand     %xmm9, %xmm7, %xmm6                           #102.7
        vpand     %xmm9, %xmm8, %xmm11                          #105.7
        vpshufb   %xmm0, %xmm10, %xmm4                          #94.7
        vpshufb   %xmm3, %xmm10, %xmm5                          #97.7
        vpshufb   %xmm6, %xmm10, %xmm12                         #103.7
        vpshufb   %xmm11, %xmm10, %xmm13                        #106.7
        vpunpcklbw %xmm5, %xmm4, %xmm14                         #98.7
        vpunpckhbw %xmm5, %xmm4, %xmm15                         #99.7
        vpunpcklbw %xmm13, %xmm12, %xmm0                        #107.7
        vpunpckhbw %xmm13, %xmm12, %xmm1                        #108.7
        vmovdqu   %xmm14, (%rdi)                                #110.30
        vmovdqu   %xmm15, 16(%rdi)                              #111.30
        vmovdqu   %xmm0, 32(%rdi)                               #112.30
        vmovdqu   %xmm1, 48(%rdi)                               #113.30
        ret                                                     #114.1
        .align    16,0x90
..___tag_value_fb_sqrl_low.6:                                   #
                                # LOE
# mark_end;
	.type	fb_sqrl_low,@function
	.size	fb_sqrl_low,.-fb_sqrl_low
	.data
# -- End  fb_sqrl_low
	.text
# -- Begin  fb_sqrm_low
# mark_begin;
       .align    16,0x90
	.globl fb_sqrm_low
fb_sqrm_low:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.1c:                         # Preds ..B3.0
..___tag_value_fb_sqrm_low.7:                                   #118.38
        movq      $0x7ffffffffffffff, %rdx                      #155.16
        vmovdqu   16(%rsi), %xmm3                               #137.34
        vmovdqu   .L_2il0floatpacket.14(%rip), %xmm1            #126.9
        vpsrlq    $4, %xmm3, %xmm0                              #140.7
        vmovdqu   .L_2il0floatpacket.13(%rip), %xmm2            #125.7
        vpand     %xmm1, %xmm3, %xmm15                          #138.7
        vpand     %xmm1, %xmm0, %xmm7                           #141.7
        vmovdqu   (%rsi), %xmm12                                #128.33
        vpshufb   %xmm15, %xmm2, %xmm4                          #139.7
        vpshufb   %xmm7, %xmm2, %xmm5                           #142.7
        vpsrlq    $4, %xmm12, %xmm13                            #131.7
        vpand     %xmm1, %xmm12, %xmm11                         #129.7
        vpand     %xmm1, %xmm13, %xmm14                         #132.7
        vpshufb   %xmm11, %xmm2, %xmm10                         #130.7
        vpshufb   %xmm14, %xmm2, %xmm9                          #133.7
        vpunpckhbw %xmm5, %xmm4, %xmm6                          #144.7
        vpsrldq   $8, %xmm6, %xmm2                              #151.2
        vpslldq   $8, %xmm6, %xmm8                              #151.2
        vpsrlq    $59, %xmm2, %xmm12                            #151.2
        vpunpcklbw %xmm5, %xmm4, %xmm11                         #143.7
        vpsrlq    $57, %xmm2, %xmm14                            #151.2
        vpxor     %xmm12, %xmm11, %xmm13                        #151.2
        vpsrlq    $59, %xmm8, %xmm12                            #151.2
        vpunpckhbw %xmm9, %xmm10, %xmm11                        #135.7
        vpxor     %xmm14, %xmm13, %xmm15                        #151.2
        vpsrlq    $55, %xmm2, %xmm3                             #151.2
        vpxor     %xmm12, %xmm11, %xmm13                        #151.2
        vpsrlq    $57, %xmm8, %xmm14                            #151.2
        vpxor     %xmm3, %xmm15, %xmm0                          #151.2
        vpsrlq    $52, %xmm2, %xmm1                             #151.2
        vpxor     %xmm14, %xmm13, %xmm15                        #151.2
        vpsrlq    $55, %xmm8, %xmm3                             #151.2
        vpxor     %xmm1, %xmm0, %xmm6                           #151.2
        vpsrldq   $8, %xmm8, %xmm5                              #151.2
        vpxor     %xmm3, %xmm15, %xmm0                          #151.2
        vpsrlq    $52, %xmm8, %xmm8                             #151.2
        vpsllq    $9, %xmm5, %xmm11                             #151.2
        vpxor     %xmm8, %xmm0, %xmm3                           #151.2
        vpsllq    $5, %xmm5, %xmm0                              #151.2
        vpslldq   $8, %xmm2, %xmm4                              #151.2
        vpxor     %xmm0, %xmm3, %xmm1                           #151.2
        vpsllq    $7, %xmm5, %xmm2                              #151.2
        vpsllq    $12, %xmm5, %xmm5                             #151.2
        vpxor     %xmm2, %xmm1, %xmm8                           #151.2
        vpsllq    $5, %xmm4, %xmm14                             #151.2
        vpxor     %xmm11, %xmm8, %xmm12                         #151.2
        vpsllq    $7, %xmm4, %xmm3                              #151.2
        vpxor     %xmm5, %xmm12, %xmm13                         #151.2
        vpsllq    $9, %xmm4, %xmm1                              #151.2
        vpxor     %xmm14, %xmm13, %xmm15                        #151.2
        vpsllq    $12, %xmm4, %xmm4                             #151.2
        vpxor     %xmm3, %xmm15, %xmm0                          #151.2
        vpslldq   $8, %xmm6, %xmm7                              #151.2
        vpxor     %xmm1, %xmm0, %xmm2                           #151.2
        vpsrldq   $8, %xmm6, %xmm6                              #151.2
        vpxor     %xmm4, %xmm2, %xmm3                           #151.2
        vpsrlq    $59, %xmm6, %xmm0                             #151.2
        vpsrlq    $57, %xmm6, %xmm2                             #151.2
        vpxor     %xmm0, %xmm3, %xmm1                           #151.2
        vpsrlq    $55, %xmm6, %xmm5                             #151.2
        vpxor     %xmm2, %xmm1, %xmm4                           #151.2
        vpsrlq    $52, %xmm6, %xmm11                            #151.2
        vpxor     %xmm5, %xmm4, %xmm8                           #151.2
        vpsrlq    $57, %xmm7, %xmm5                             #151.2
        vpunpcklbw %xmm9, %xmm10, %xmm9                         #134.7
        vpxor     %xmm11, %xmm8, %xmm3                          #151.2
        vpsrlq    $59, %xmm7, %xmm10                            #151.2
        vpsrlq    $55, %xmm7, %xmm8                             #151.2
        vpslldq   $8, %xmm6, %xmm1                              #151.2
        vpxor     %xmm10, %xmm9, %xmm4                          #151.2
        vpsrldq   $8, %xmm3, %xmm6                              #151.2
        vpsrlq    $59, %xmm6, %xmm0                             #151.2
        vpxor     %xmm5, %xmm4, %xmm6                           #151.2
        vpsrldq   $8, %xmm7, %xmm2                              #151.2
        vpxor     %xmm8, %xmm6, %xmm9                           #151.2
        vpsrlq    $52, %xmm7, %xmm7                             #151.2
        vpsllq    $5, %xmm2, %xmm11                             #151.2
        vpxor     %xmm7, %xmm9, %xmm10                          #151.2
        vpsllq    $7, %xmm2, %xmm13                             #151.2
        vpxor     %xmm11, %xmm10, %xmm12                        #151.2
        vpsllq    $9, %xmm2, %xmm15                             #151.2
        vpxor     %xmm13, %xmm12, %xmm14                        #151.2
        vpsllq    $12, %xmm2, %xmm2                             #151.2
        vpxor     %xmm15, %xmm14, %xmm4                         #151.2
        vpsllq    $7, %xmm1, %xmm6                              #151.2
        vpxor     %xmm2, %xmm4, %xmm2                           #151.2
        vpsllq    $5, %xmm1, %xmm4                              #151.2
        vpxor     %xmm4, %xmm2, %xmm5                           #151.2
        vpsllq    $9, %xmm1, %xmm8                              #151.2
        vpxor     %xmm6, %xmm5, %xmm7                           #151.2
        vpsllq    $59, %xmm0, %xmm0                             #151.2
        vpxor     %xmm8, %xmm7, %xmm9                           #151.2
        vpsllq    $12, %xmm1, %xmm1                             #151.2
        vpxor     %xmm1, %xmm9, %xmm1                           #151.2
        vpsrlq    $59, %xmm0, %xmm2                             #151.2
        vpxor     %xmm2, %xmm1, %xmm4                           #151.2
        vpsrlq    $57, %xmm0, %xmm5                             #151.2
        vpxor     %xmm5, %xmm4, %xmm6                           #151.2
        vpsrlq    $55, %xmm0, %xmm7                             #151.2
        vmovdqu   %xmm3, -24(%rsp)                              #153.30
        vpxor     %xmm7, %xmm6, %xmm8                           #151.2
        vpsrlq    $52, %xmm0, %xmm0                             #151.2
        movq      -24(%rsp), %rax                               #154.9
        vpxor     %xmm0, %xmm8, %xmm0                           #151.2
        andq      -16(%rsp), %rdx                               #155.16
        vmovdqu   %xmm0, (%rdi)                                 #152.30
        movq      %rax, 16(%rdi)                                #154.2
        movq      %rdx, 24(%rdi)                                #155.2
        ret                                                     #156.1
        .align    16,0x90
..___tag_value_fb_sqrm_low.9:                                   #
                                # LOE
# mark_end;
	.type	fb_sqrm_low,@function
	.size	fb_sqrm_low,.-fb_sqrm_low
	.data
# -- End  fb_sqrm_low
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.2:
	.long	0x0000ffff,0x0000ffff,0x0000ffff,0x0000ffff
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,16
	.align 16
.L_2il0floatpacket.3:
	.long	0x00ff00ff,0x00ff00ff,0x00ff00ff,0x00ff00ff
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,16
	.align 16
.L_2il0floatpacket.4:
	.long	0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,16
	.align 16
.L_2il0floatpacket.5:
	.long	0x33333333,0x33333333,0x33333333,0x33333333
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,16
	.align 16
.L_2il0floatpacket.6:
	.long	0x55555555,0x55555555,0x55555555,0x55555555
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,16
	.align 16
.L_2il0floatpacket.9:
	.long	0x05040100,0x15141110,0x45444140,0x55545150
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,16
	.align 16
.L_2il0floatpacket.10:
	.long	0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,16
	.align 16
.L_2il0floatpacket.13:
	.long	0x05040100,0x15141110,0x45444140,0x55545150
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,16
	.align 16
.L_2il0floatpacket.14:
	.long	0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f,0x0f0f0f0f
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,16
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg3:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000014
	.4byte 0x0000001c
	.8byte ..___tag_value_fb_sqrn_low.1
	.8byte ..___tag_value_fb_sqrn_low.3-..___tag_value_fb_sqrn_low.1
	.4byte 0x00000014
	.4byte 0x00000034
	.8byte ..___tag_value_fb_sqrl_low.4
	.8byte ..___tag_value_fb_sqrl_low.6-..___tag_value_fb_sqrl_low.4
	.4byte 0x00000014
	.4byte 0x0000004c
	.8byte ..___tag_value_fb_sqrm_low.7
	.8byte ..___tag_value_fb_sqrm_low.9-..___tag_value_fb_sqrm_low.7
# End
