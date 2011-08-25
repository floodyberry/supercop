# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.0.084 Build 2010100";
# mark_description "6";
# mark_description "-I/home/dfaranha/projects/relic-targets/target-icc/include -I/home/dfaranha/projects/relic-toolkit/include -";
# mark_description "I/home/dfaranha/projects/relic-toolkit/include/low -D_GNU_SOURCE -pipe -std=c99 -Wall -O3 -xAVX -S -o CMakeF";
# mark_description "iles/relic_s.dir/low/corei7-251/relic_fb_add_low.c.o -c";
	.file "relic_fb_add_low.c"
	.text
..TXTST0:
# -- Begin  fb_add1_low
# mark_begin;
       .align    16,0x90
	.globl fb_add1_low
fb_add1_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.1:                         # Preds ..B1.0
..___tag_value_fb_add1_low.1:                                   #39.51
        xorq      (%rsi), %rdx                                  #42.16
        movq      %rdx, (%rdi)                                  #42.4
        movq      8(%rsi), %rax                                 #46.12
        movq      %rax, 8(%rdi)                                 #46.5
        movq      16(%rsi), %rcx                                #46.12
        movq      %rcx, 16(%rdi)                                #46.5
        movq      24(%rsi), %r8                                 #46.12
        movq      %r8, 24(%rdi)                                 #46.5
        ret                                                     #47.1
        .align    16,0x90
..___tag_value_fb_add1_low.3:                                   #
                                # LOE
# mark_end;
	.type	fb_add1_low,@function
	.size	fb_add1_low,.-fb_add1_low
	.data
# -- End  fb_add1_low
	.text
# -- Begin  fb_addn_low
# mark_begin;
       .align    16,0x90
	.globl fb_addn_low
fb_addn_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
..___tag_value_fb_addn_low.4:                                   #49.48
        vmovups   (%rsi), %ymm0                                 #50.41
        vxorps    (%rdx), %ymm0, %ymm1                          #50.17
        vmovups   %ymm1, (%rdi)                                 #50.13
        vzeroupper                                              #51.1
        ret                                                     #51.1
        .align    16,0x90
..___tag_value_fb_addn_low.6:                                   #
                                # LOE
# mark_end;
	.type	fb_addn_low,@function
	.size	fb_addn_low,.-fb_addn_low
	.data
# -- End  fb_addn_low
	.text
# -- Begin  fb_addd_low
# mark_begin;
       .align    16,0x90
	.globl fb_addd_low
fb_addd_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B3.1:                         # Preds ..B3.0
..___tag_value_fb_addd_low.7:                                   #53.58
        vmovups   (%rsi), %ymm0                                 #54.41
        vxorps    (%rdx), %ymm0, %ymm1                          #54.17
        vmovups   %ymm1, (%rdi)                                 #54.13
        vmovups   32(%rsi), %ymm2                               #55.48
        vxorps    32(%rdx), %ymm2, %ymm3                        #55.23
        vmovups   %ymm3, 32(%rdi)                               #55.14
        vzeroupper                                              #56.1
        ret                                                     #56.1
        .align    16,0x90
..___tag_value_fb_addd_low.9:                                   #
                                # LOE
# mark_end;
	.type	fb_addd_low,@function
	.size	fb_addd_low,.-fb_addd_low
	.data
# -- End  fb_addd_low
	.text
# -- Begin  fb_add2_low
# mark_begin;
       .align    16,0x90
	.globl fb_add2_low
fb_add2_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B4.1:                         # Preds ..B4.0
..___tag_value_fb_add2_low.10:                                  #60.48
        movq      $0x7ffffffffffffff, %rcx                      #72.17
        vmovdqu   48(%rsi), %xmm14                              #67.33
        vmovdqu   (%rsi), %xmm11                                #64.32
        vpxor     48(%rdx), %xmm14, %xmm15                      #67.7
        vpxor     (%rdx), %xmm11, %xmm10                        #64.7
        vmovdqu   32(%rsi), %xmm13                              #66.33
        vpsrldq   $8, %xmm15, %xmm11                            #68.2
        vmovdqu   16(%rsi), %xmm12                              #65.33
        vpsrlq    $59, %xmm11, %xmm0                            #68.2
        vpxor     32(%rdx), %xmm13, %xmm3                       #66.7
        vpsrlq    $57, %xmm11, %xmm2                            #68.2
        vpslldq   $8, %xmm15, %xmm8                             #68.2
        vpxor     %xmm0, %xmm3, %xmm1                           #68.2
        vpxor     16(%rdx), %xmm12, %xmm9                       #65.7
        vpsrlq    $59, %xmm8, %xmm13                            #68.2
        vpxor     %xmm2, %xmm1, %xmm7                           #68.2
        vpsrlq    $55, %xmm11, %xmm6                            #68.2
        vpxor     %xmm13, %xmm9, %xmm9                          #68.2
        vpsrlq    $57, %xmm8, %xmm14                            #68.2
        vpxor     %xmm6, %xmm7, %xmm4                           #68.2
        vpsrlq    $52, %xmm11, %xmm5                            #68.2
        vpxor     %xmm14, %xmm9, %xmm15                         #68.2
        vpsrlq    $55, %xmm8, %xmm3                             #68.2
        vpxor     %xmm5, %xmm4, %xmm12                          #68.2
        vpxor     %xmm3, %xmm15, %xmm0                          #68.2
        vpsrldq   $8, %xmm8, %xmm5                              #68.2
        vpsrlq    $52, %xmm8, %xmm8                             #68.2
        vpxor     %xmm8, %xmm0, %xmm3                           #68.2
        vpsllq    $5, %xmm5, %xmm0                              #68.2
        vpxor     %xmm0, %xmm3, %xmm1                           #68.2
        vpsllq    $7, %xmm5, %xmm2                              #68.2
        vpxor     %xmm2, %xmm1, %xmm8                           #68.2
        vpsllq    $9, %xmm5, %xmm9                              #68.2
        vpslldq   $8, %xmm11, %xmm4                             #68.2
        vpxor     %xmm9, %xmm8, %xmm11                          #68.2
        vpsllq    $12, %xmm5, %xmm5                             #68.2
        vpsllq    $5, %xmm4, %xmm13                             #68.2
        vpslldq   $8, %xmm12, %xmm7                             #68.2
        vpsllq    $7, %xmm4, %xmm15                             #68.2
        vpsrldq   $8, %xmm12, %xmm6                             #68.2
        vpxor     %xmm5, %xmm11, %xmm12                         #68.2
        vpxor     %xmm13, %xmm12, %xmm14                        #68.2
        vpsllq    $9, %xmm4, %xmm0                              #68.2
        vpxor     %xmm15, %xmm14, %xmm3                         #68.2
        vpsllq    $12, %xmm4, %xmm4                             #68.2
        vpxor     %xmm0, %xmm3, %xmm1                           #68.2
        vpsrlq    $59, %xmm6, %xmm0                             #68.2
        vpxor     %xmm4, %xmm1, %xmm3                           #68.2
        vpsrlq    $57, %xmm6, %xmm2                             #68.2
        vpxor     %xmm0, %xmm3, %xmm1                           #68.2
        vpsrlq    $55, %xmm6, %xmm5                             #68.2
        vpxor     %xmm2, %xmm1, %xmm4                           #68.2
        vpsrlq    $52, %xmm6, %xmm9                             #68.2
        vpxor     %xmm5, %xmm4, %xmm8                           #68.2
        vpsrlq    $59, %xmm7, %xmm4                             #68.2
        vpxor     %xmm9, %xmm8, %xmm3                           #68.2
        vpxor     %xmm4, %xmm10, %xmm10                         #68.2
        vpslldq   $8, %xmm6, %xmm1                              #68.2
        vpsrlq    $57, %xmm7, %xmm4                             #68.2
        vpsrldq   $8, %xmm3, %xmm6                              #68.2
        vpxor     %xmm4, %xmm10, %xmm5                          #68.2
        vpsrlq    $59, %xmm6, %xmm0                             #68.2
        vpsrlq    $55, %xmm7, %xmm6                             #68.2
        vpsrldq   $8, %xmm7, %xmm2                              #68.2
        vpxor     %xmm6, %xmm5, %xmm8                           #68.2
        vpsrlq    $52, %xmm7, %xmm7                             #68.2
        vpsllq    $5, %xmm2, %xmm10                             #68.2
        vpxor     %xmm7, %xmm8, %xmm9                           #68.2
        vpsllq    $7, %xmm2, %xmm12                             #68.2
        vpxor     %xmm10, %xmm9, %xmm11                         #68.2
        vpsllq    $9, %xmm2, %xmm14                             #68.2
        vpxor     %xmm12, %xmm11, %xmm13                        #68.2
        vpsllq    $12, %xmm2, %xmm2                             #68.2
        vpxor     %xmm14, %xmm13, %xmm15                        #68.2
        vpsllq    $5, %xmm1, %xmm4                              #68.2
        vpxor     %xmm2, %xmm15, %xmm2                          #68.2
        vpsllq    $7, %xmm1, %xmm6                              #68.2
        vpxor     %xmm4, %xmm2, %xmm5                           #68.2
        vpsllq    $9, %xmm1, %xmm8                              #68.2
        vpxor     %xmm6, %xmm5, %xmm7                           #68.2
        vpsllq    $59, %xmm0, %xmm0                             #68.2
        vpxor     %xmm8, %xmm7, %xmm9                           #68.2
        vpsllq    $12, %xmm1, %xmm1                             #68.2
        vpxor     %xmm1, %xmm9, %xmm1                           #68.2
        vpsrlq    $59, %xmm0, %xmm2                             #68.2
        vpxor     %xmm2, %xmm1, %xmm4                           #68.2
        vpsrlq    $57, %xmm0, %xmm5                             #68.2
        vpxor     %xmm5, %xmm4, %xmm6                           #68.2
        vpsrlq    $55, %xmm0, %xmm7                             #68.2
        vmovdqu   %xmm3, -24(%rsp)                              #70.30
        vpxor     %xmm7, %xmm6, %xmm8                           #68.2
        vpsrlq    $52, %xmm0, %xmm0                             #68.2
        movq      -24(%rsp), %rax                               #71.9
        vpxor     %xmm0, %xmm8, %xmm0                           #68.2
        andq      -16(%rsp), %rcx                               #72.17
        vmovdqu   %xmm0, (%rdi)                                 #69.30
        movq      %rax, 16(%rdi)                                #71.2
        movq      %rcx, 24(%rdi)                                #72.2
        ret                                                     #73.1
        .align    16,0x90
..___tag_value_fb_add2_low.12:                                  #
                                # LOE
# mark_end;
	.type	fb_add2_low,@function
	.size	fb_add2_low,.-fb_add2_low
	.data
# -- End  fb_add2_low
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000014
	.4byte 0x0000001c
	.8byte ..___tag_value_fb_add1_low.1
	.8byte ..___tag_value_fb_add1_low.3-..___tag_value_fb_add1_low.1
	.4byte 0x00000014
	.4byte 0x00000034
	.8byte ..___tag_value_fb_addn_low.4
	.8byte ..___tag_value_fb_addn_low.6-..___tag_value_fb_addn_low.4
	.4byte 0x00000014
	.4byte 0x0000004c
	.8byte ..___tag_value_fb_addd_low.7
	.8byte ..___tag_value_fb_addd_low.9-..___tag_value_fb_addd_low.7
	.4byte 0x00000014
	.4byte 0x00000064
	.8byte ..___tag_value_fb_add2_low.10
	.8byte ..___tag_value_fb_add2_low.12-..___tag_value_fb_add2_low.10
# End
