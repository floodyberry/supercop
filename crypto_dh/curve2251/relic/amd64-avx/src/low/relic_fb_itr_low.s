# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.0.084 Build 2010100";
# mark_description "6";
# mark_description "-I/home/dfaranha/projects/relic-targets/target-icc/include -I/home/dfaranha/projects/relic-toolkit/include -";
# mark_description "I/home/dfaranha/projects/relic-toolkit/include/low -D_GNU_SOURCE -pipe -std=c99 -Wall -O3 -xAVX -S -o CMakeF";
# mark_description "iles/relic_s.dir/low/corei7-251/relic_fb_itr_low.c.o -c";
	.file "relic_fb_itr_low.c"
	.text
..TXTST1:
# -- Begin  fb_itrn_low
# mark_begin;
       .align    16,0x90
	.globl fb_itrn_low
fb_itrn_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.1a:                         # Preds ..B1.0
..___tag_value_fb_itrn_low.1:                                   #43.48
        movq      (%rsi), %r9                                   #52.10
        movq      %r9, %r10                                     #52.17
        movq      8(%rsi), %r8                                  #52.10
        movq      %r8, %r11                                     #52.17
        shrq      $60, %r10                                     #52.17
        movq      16(%rsi), %rcx                                #52.10
        movq      %rcx, %rax                                    #52.17
        shlq      $5, %r10                                      #53.9
        shrq      $60, %r11                                     #52.17
        shlq      $5, %r11                                      #53.9
        shrq      $60, %rax                                     #52.17
        shlq      $5, %rax                                      #53.9
        vxorps    %ymm0, %ymm0, %ymm0                           #48.7
        vxorps    7680(%r10,%rdx), %ymm0, %ymm1                 #54.9
        movq      %r9, %r10                                     #52.17
        vxorps    15872(%r11,%rdx), %ymm1, %ymm2                #54.9
        movq      %rcx, %r11                                    #52.17
        vxorps    24064(%rax,%rdx), %ymm2, %ymm3                #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $56, %r10                                     #52.17
        shrq      $56, %rax                                     #52.17
        andq      $15, %r10                                     #52.22
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $56, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    7168(%r10,%rdx), %ymm3, %ymm4                 #54.9
        movq      %r8, %r10                                     #52.17
        vxorps    15360(%rax,%rdx), %ymm4, %ymm5                #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $52, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $52, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    23552(%r11,%rdx), %ymm5, %ymm6                #54.9
        movq      %r9, %r11                                     #52.17
        vxorps    6656(%rax,%rdx), %ymm6, %ymm7                 #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $52, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $48, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    14848(%r10,%rdx), %ymm7, %ymm8                #54.9
        movq      %rcx, %r10                                    #52.17
        vxorps    23040(%rax,%rdx), %ymm8, %ymm9                #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $48, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $48, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    6144(%r11,%rdx), %ymm9, %ymm10                #54.9
        movq      %r8, %r11                                     #52.17
        vxorps    14336(%rax,%rdx), %ymm10, %ymm11              #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $44, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $44, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    22528(%r10,%rdx), %ymm11, %ymm12              #54.9
        movq      %r9, %r10                                     #52.17
        vxorps    5632(%rax,%rdx), %ymm12, %ymm13               #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $44, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $40, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    13824(%r11,%rdx), %ymm13, %ymm14              #54.9
        movq      %rcx, %r11                                    #52.17
        vxorps    22016(%rax,%rdx), %ymm14, %ymm15              #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $40, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $40, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    5120(%r10,%rdx), %ymm15, %ymm0                #54.9
        movq      %r8, %r10                                     #52.17
        vxorps    13312(%rax,%rdx), %ymm0, %ymm1                #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $36, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $36, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    21504(%r11,%rdx), %ymm1, %ymm2                #54.9
        movq      %r9, %r11                                     #52.17
        vxorps    4608(%rax,%rdx), %ymm2, %ymm3                 #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $36, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $32, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    12800(%r10,%rdx), %ymm3, %ymm4                #54.9
        movq      %rcx, %r10                                    #52.17
        vxorps    20992(%rax,%rdx), %ymm4, %ymm5                #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $32, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $32, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    4096(%r11,%rdx), %ymm5, %ymm6                 #54.9
        movq      %r8, %r11                                     #52.17
        vxorps    12288(%rax,%rdx), %ymm6, %ymm7                #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $28, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $28, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    20480(%r10,%rdx), %ymm7, %ymm8                #54.9
        movq      %r9, %r10                                     #52.17
        vxorps    3584(%rax,%rdx), %ymm8, %ymm9                 #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $28, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $24, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    11776(%r11,%rdx), %ymm9, %ymm10               #54.9
        movq      %rcx, %r11                                    #52.17
        vxorps    19968(%rax,%rdx), %ymm10, %ymm11              #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $24, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $24, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    3072(%r10,%rdx), %ymm11, %ymm12               #54.9
        movq      %r8, %r10                                     #52.17
        vxorps    11264(%rax,%rdx), %ymm12, %ymm13              #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $20, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $20, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    19456(%r11,%rdx), %ymm13, %ymm14              #54.9
        movq      %r9, %r11                                     #52.17
        vxorps    2560(%rax,%rdx), %ymm14, %ymm15               #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $20, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $16, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    10752(%r10,%rdx), %ymm15, %ymm0               #54.9
        movq      %rcx, %r10                                    #52.17
        vxorps    18944(%rax,%rdx), %ymm0, %ymm1                #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $16, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $16, %r10                                     #52.17
        andq      $15, %r10                                     #52.22
        vxorps    2048(%r11,%rdx), %ymm1, %ymm2                 #54.9
        movq      %r8, %r11                                     #52.17
        vxorps    10240(%rax,%rdx), %ymm2, %ymm3                #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $12, %rax                                     #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $12, %r11                                     #52.17
        andq      $15, %r11                                     #52.22
        vxorps    18432(%r10,%rdx), %ymm3, %ymm4                #54.9
        movq      %r9, %r10                                     #52.17
        vxorps    1536(%rax,%rdx), %ymm4, %ymm5                 #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $12, %rax                                     #52.17
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $8, %r10                                      #52.17
        andq      $15, %r10                                     #52.22
        vxorps    9728(%r11,%rdx), %ymm5, %ymm6                 #54.9
        movq      %rcx, %r11                                    #52.17
        vxorps    17920(%rax,%rdx), %ymm6, %ymm7                #54.9
        movq      %r8, %rax                                     #52.17
        shrq      $8, %rax                                      #52.17
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shrq      $8, %r11                                      #52.17
        andq      $15, %r11                                     #52.22
        vxorps    1024(%r10,%rdx), %ymm7, %ymm8                 #54.9
        movq      %r8, %r10                                     #52.17
        vxorps    9216(%rax,%rdx), %ymm8, %ymm9                 #54.9
        movq      %r9, %rax                                     #52.17
        shrq      $4, %rax                                      #52.17
        andq      $15, %r9                                      #52.22
        shlq      $5, %r11                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        andq      $15, %r8                                      #52.22
        shrq      $4, %r10                                      #52.17
        andq      $15, %r10                                     #52.22
        vxorps    17408(%r11,%rdx), %ymm9, %ymm10               #54.9
        vxorps    512(%rax,%rdx), %ymm10, %ymm11                #54.9
        movq      %rcx, %rax                                    #52.17
        shrq      $4, %rax                                      #52.17
        andq      $15, %rcx                                     #52.22
        shlq      $5, %r10                                      #53.9
        andq      $15, %rax                                     #52.22
        shlq      $5, %rax                                      #53.9
        shlq      $5, %r9                                       #53.9
        shlq      $5, %r8                                       #53.9
        vxorps    8704(%r10,%rdx), %ymm11, %ymm12               #54.9
        shlq      $5, %rcx                                      #53.9
        vxorps    16896(%rax,%rdx), %ymm12, %ymm13              #54.9
        vxorps    (%r9,%rdx), %ymm13, %ymm14                    #54.9
        vxorps    8192(%r8,%rdx), %ymm14, %ymm15                #54.9
        movq      24(%rsi), %rax                                #43.6
        movq      %rax, %rsi                                    #59.16
        vxorps    16384(%rcx,%rdx), %ymm15, %ymm0               #54.9
        movq      %rax, %rcx                                    #59.16
        shrq      $56, %rcx                                     #59.16
        movq      %rax, %r8                                     #59.16
        shrq      $52, %rsi                                     #59.16
        andq      $15, %rcx                                     #59.21
        shlq      $5, %rcx                                      #60.38
        andq      $15, %rsi                                     #59.21
        shrq      $48, %r8                                      #59.16
        movq      %rax, %r9                                     #59.16
        shlq      $5, %rsi                                      #60.38
        andq      $15, %r8                                      #59.21
        shlq      $5, %r8                                       #60.38
        movq      %rax, %r10                                    #59.16
        vxorps    31744(%rcx,%rdx), %ymm0, %ymm1                #61.8
        movq      %rax, %rcx                                    #59.16
        shrq      $44, %r9                                      #59.16
        movq      %rax, %r11                                    #59.16
        vxorps    31232(%rsi,%rdx), %ymm1, %ymm2                #61.8
        andq      $15, %r9                                      #59.21
        shrq      $40, %rcx                                     #59.16
        movq      %rax, %rsi                                    #59.16
        vxorps    30720(%r8,%rdx), %ymm2, %ymm3                 #61.8
        andq      $15, %rcx                                     #59.21
        shlq      $5, %r9                                       #60.38
        movq      %rax, %r8                                     #59.16
        shrq      $36, %rsi                                     #59.16
        shlq      $5, %rcx                                      #60.38
        andq      $15, %rsi                                     #59.21
        shrq      $32, %r8                                      #59.16
        shlq      $5, %rsi                                      #60.38
        andq      $15, %r8                                      #59.21
        shlq      $5, %r8                                       #60.38
        shrq      $28, %r10                                     #59.16
        vxorps    30208(%r9,%rdx), %ymm3, %ymm4                 #61.8
        andq      $15, %r10                                     #59.21
        vxorps    29696(%rcx,%rdx), %ymm4, %ymm5                #61.8
        movq      %rax, %rcx                                    #59.16
        shrq      $24, %r11                                     #59.16
        movq      %rax, %r9                                     #59.16
        shlq      $5, %r10                                      #60.38
        andq      $15, %r11                                     #59.21
        vxorps    29184(%rsi,%rdx), %ymm5, %ymm6                #61.8
        movq      %rax, %rsi                                    #59.16
        shrq      $20, %rcx                                     #59.16
        vxorps    28672(%r8,%rdx), %ymm6, %ymm7                 #61.8
        andq      $15, %rcx                                     #59.21
        shlq      $5, %r11                                      #60.38
        movq      %rax, %r8                                     #59.16
        shrq      $16, %rsi                                     #59.16
        shlq      $5, %rcx                                      #60.38
        andq      $15, %rsi                                     #59.21
        shrq      $12, %r8                                      #59.16
        vxorps    28160(%r10,%rdx), %ymm7, %ymm8                #61.8
        andq      $15, %r8                                      #59.21
        shlq      $5, %rsi                                      #60.38
        movq      %rax, %r10                                    #59.16
        shrq      $8, %r9                                       #59.16
        andq      $15, %rax                                     #59.21
        shlq      $5, %r8                                       #60.38
        andq      $15, %r9                                      #59.21
        shrq      $4, %r10                                      #59.16
        vxorps    27648(%r11,%rdx), %ymm8, %ymm9                #61.8
        andq      $15, %r10                                     #59.21
        shlq      $5, %r9                                       #60.38
        vxorps    27136(%rcx,%rdx), %ymm9, %ymm10               #61.8
        shlq      $5, %r10                                      #60.38
        shlq      $5, %rax                                      #60.38
        vxorps    26624(%rsi,%rdx), %ymm10, %ymm11              #61.8
        addq      $24576, %rax                                  #60.8
        vxorps    26112(%r8,%rdx), %ymm11, %ymm12               #61.8
        vxorps    25600(%r9,%rdx), %ymm12, %ymm13               #61.8
        vxorps    25088(%r10,%rdx), %ymm13, %ymm14              #61.8
        vxorps    (%rax,%rdx), %ymm14, %ymm15                   #61.8
        vmovups   %ymm15, (%rdi)                                #64.28
        vzeroupper                                              #65.1
        ret                                                     #65.1
        .align    16,0x90
..___tag_value_fb_itrn_low.3:                                   #
                                # LOE
# mark_end;
	.type	fb_itrn_low,@function
	.size	fb_itrn_low,.-fb_itrn_low
	.data
# -- End  fb_itrn_low
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg1:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000014
	.4byte 0x0000001c
	.8byte ..___tag_value_fb_itrn_low.1
	.8byte ..___tag_value_fb_itrn_low.3-..___tag_value_fb_itrn_low.1
# End
