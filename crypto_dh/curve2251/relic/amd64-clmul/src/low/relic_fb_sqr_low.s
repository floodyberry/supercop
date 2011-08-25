/*
 * Copyright (C) 2011 BACKEND Authors
 *
 * This code is legal property of its developers, whose names are not
 * listed here. Please refer to the COPYRIGHT file for contact
 * information.
 *
 * This code is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this code. If not, see <http://www.gnu.org/licenses/>.
 */

# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.0.084 Build 2010100";
# mark_description "6";
# mark_description "-I/home/dfaranha/projects/relic-targets/target-icc/include -I/home/dfaranha/projects/relic-toolkit/include -";
# mark_description "I/home/dfaranha/projects/relic-toolkit/include/low -D_GNU_SOURCE -pipe -std=c99 -Wall -O3 -xSSE4.2 -xHOST -S";
# mark_description " -o CMakeFiles/relic_s.dir/low/core2-251/relic_fb_sqr_low.c.o -c";
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
..B1.130:                         # Preds ..B1.0
..___tag_value_fb_sqrn_low.1:                                   #55.38
        xorl      %edx, %edx                                    #57.8
        movdqa    .L_2il0floatpacket.2(%rip), %xmm5             #63.38
        xorl      %eax, %eax                                    #59.13
        movdqa    .L_2il0floatpacket.3(%rip), %xmm4             #67.38
        pxor      %xmm0, %xmm0                                  #60.8
        movdqa    .L_2il0floatpacket.4(%rip), %xmm3             #71.38
        movdqa    .L_2il0floatpacket.5(%rip), %xmm2             #75.38
        movdqa    .L_2il0floatpacket.6(%rip), %xmm1             #79.38
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.20a:                        # Preds ..B1.2a ..B1.130
        movq      (%rsi,%rax,8), %rcx                           #60.58
        incq      %rax                                          #59.31
        movd      %ecx, %xmm7                                   #60.8
        shrq      $32, %rcx                                     #60.42
        punpcklqdq %xmm0, %xmm7                                 #60.8
        movd      %ecx, %xmm6                                   #60.8
        punpcklqdq %xmm0, %xmm6                                 #60.8
        shufps    $136, %xmm6, %xmm7                            #60.8
        movaps    %xmm7, %xmm8                                  #61.7
        psllq     $16, %xmm8                                    #61.7
        por       %xmm7, %xmm8                                  #62.7
        pand      %xmm5, %xmm8                                  #63.7
        movdqa    %xmm8, %xmm9                                  #65.7
        psllq     $8, %xmm9                                     #65.7
        por       %xmm8, %xmm9                                  #66.7
        pand      %xmm4, %xmm9                                  #67.7
        movdqa    %xmm9, %xmm10                                 #69.7
        psllq     $4, %xmm10                                    #69.7
        por       %xmm9, %xmm10                                 #70.7
        pand      %xmm3, %xmm10                                 #71.7
        movdqa    %xmm10, %xmm11                                #73.7
        psllq     $2, %xmm11                                    #73.7
        por       %xmm10, %xmm11                                #74.7
        pand      %xmm2, %xmm11                                 #75.7
        movdqa    %xmm11, %xmm12                                #77.7
        psllq     $1, %xmm12                                    #77.7
        por       %xmm11, %xmm12                                #78.7
        pand      %xmm1, %xmm12                                 #79.7
        movdqa    %xmm12, (%rdi,%rdx,8)                         #80.31
        addq      $2, %rdx                                      #81.3
        cmpq      $4, %rax                                      #59.22
        jl        ..B1.20a        # Prob 75%                      #59.22
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.30a:                        # Preds ..B1.20a
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
..B2.1a:                         # Preds ..B2.0
..___tag_value_fb_sqrl_low.4:                                   #85.38
        movdqa    (%rsi), %xmm1                                 #92.33
        movdqa    16(%rsi), %xmm5                               #101.34
        movdqa    %xmm1, %xmm0                                  #93.7
        movdqa    .L_2il0floatpacket.10(%rip), %xmm4            #90.9
        movdqa    %xmm5, %xmm3                                  #102.7
        movdqa    .L_2il0floatpacket.9(%rip), %xmm8             #94.7
        pand      %xmm4, %xmm0                                  #93.7
        movdqa    .L_2il0floatpacket.9(%rip), %xmm10            #103.7
        psrlq     $4, %xmm1                                     #95.7
        pand      %xmm4, %xmm3                                  #102.7
        psrlq     $4, %xmm5                                     #104.7
        movdqa    .L_2il0floatpacket.9(%rip), %xmm2             #97.7
        pand      %xmm4, %xmm1                                  #96.7
        movdqa    .L_2il0floatpacket.9(%rip), %xmm6             #106.7
        pand      %xmm4, %xmm5                                  #105.7
        pshufb    %xmm0, %xmm8                                  #94.7
        pshufb    %xmm3, %xmm10                                 #103.7
        pshufb    %xmm1, %xmm2                                  #97.7
        pshufb    %xmm5, %xmm6                                  #106.7
        movdqa    %xmm8, %xmm7                                  #98.7
        movdqa    %xmm10, %xmm9                                 #107.7
        punpcklbw %xmm2, %xmm7                                  #98.7
        punpckhbw %xmm2, %xmm8                                  #99.7
        punpcklbw %xmm6, %xmm9                                  #107.7
        punpckhbw %xmm6, %xmm10                                 #108.7
        movdqa    %xmm7, (%rdi)                                 #110.30
        movdqa    %xmm8, 16(%rdi)                               #111.30
        movdqa    %xmm9, 32(%rdi)                               #112.30
        movdqa    %xmm10, 48(%rdi)                              #113.30
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
..B3.1a:                         # Preds ..B3.0
..___tag_value_fb_sqrm_low.7:                                   #118.38
        movq      $0x7ffffffffffffff, %rdx                      #155.16
        movdqa    16(%rsi), %xmm11                              #137.34
        movdqa    .L_2il0floatpacket.14(%rip), %xmm10           #126.9
        movdqa    %xmm11, %xmm9                                 #138.7
        movdqa    .L_2il0floatpacket.13(%rip), %xmm4            #139.7
        pand      %xmm10, %xmm9                                 #138.7
        psrlq     $4, %xmm11                                    #140.7
        movdqa    .L_2il0floatpacket.13(%rip), %xmm12           #142.7
        pand      %xmm10, %xmm11                                #141.7
        pshufb    %xmm9, %xmm4                                  #139.7
        pshufb    %xmm11, %xmm12                                #142.7
        movdqa    (%rsi), %xmm8                                 #128.33
        movdqa    %xmm4, %xmm3                                  #144.7
        movdqa    %xmm8, %xmm7                                  #129.7
        psrlq     $4, %xmm8                                     #131.7
        movdqa    .L_2il0floatpacket.13(%rip), %xmm6            #130.7
        pand      %xmm10, %xmm7                                 #129.7
        punpckhbw %xmm12, %xmm3                                 #144.7
        pand      %xmm10, %xmm8                                 #132.7
        pshufb    %xmm7, %xmm6                                  #130.7
        movdqa    %xmm3, %xmm7                                  #151.2
        psrldq    $8, %xmm3                                     #151.2
        movdqa    %xmm3, %xmm13                                 #151.2
        movdqa    %xmm3, %xmm14                                 #151.2
        punpcklbw %xmm12, %xmm4                                 #143.7
        psrlq     $59, %xmm13                                   #151.2
        movdqa    .L_2il0floatpacket.13(%rip), %xmm5            #133.7
        pxor      %xmm13, %xmm4                                 #151.2
        psrlq     $57, %xmm14                                   #151.2
        movdqa    %xmm3, %xmm15                                 #151.2
        pshufb    %xmm8, %xmm5                                  #133.7
        pxor      %xmm14, %xmm4                                 #151.2
        psrlq     $55, %xmm15                                   #151.2
        movdqa    %xmm3, %xmm1                                  #151.2
        pxor      %xmm15, %xmm4                                 #151.2
        pslldq    $8, %xmm7                                     #151.2
        psrlq     $52, %xmm1                                    #151.2
        pxor      %xmm1, %xmm4                                  #151.2
        movdqa    %xmm6, %xmm1                                  #135.7
        movdqa    %xmm7, %xmm0                                  #151.2
        movdqa    %xmm7, %xmm12                                 #151.2
        punpckhbw %xmm5, %xmm1                                  #135.7
        psrlq     $59, %xmm0                                    #151.2
        movdqa    %xmm7, %xmm11                                 #151.2
        pxor      %xmm0, %xmm1                                  #151.2
        psrlq     $57, %xmm12                                   #151.2
        movdqa    %xmm7, %xmm13                                 #151.2
        psrldq    $8, %xmm11                                    #151.2
        pxor      %xmm12, %xmm1                                 #151.2
        psrlq     $55, %xmm13                                   #151.2
        psrlq     $52, %xmm7                                    #151.2
        pxor      %xmm13, %xmm1                                 #151.2
        movdqa    %xmm11, %xmm8                                 #151.2
        pxor      %xmm7, %xmm1                                  #151.2
        psllq     $5, %xmm8                                     #151.2
        movdqa    %xmm11, %xmm9                                 #151.2
        pxor      %xmm8, %xmm1                                  #151.2
        psllq     $7, %xmm9                                     #151.2
        movdqa    %xmm11, %xmm10                                #151.2
        pslldq    $8, %xmm3                                     #151.2
        pxor      %xmm9, %xmm1                                  #151.2
        psllq     $9, %xmm10                                    #151.2
        psllq     $12, %xmm11                                   #151.2
        pxor      %xmm10, %xmm1                                 #151.2
        movdqa    %xmm3, %xmm14                                 #151.2
        pxor      %xmm11, %xmm1                                 #151.2
        psllq     $5, %xmm14                                    #151.2
        movdqa    %xmm3, %xmm0                                  #151.2
        pxor      %xmm14, %xmm1                                 #151.2
        psllq     $7, %xmm0                                     #151.2
        movdqa    %xmm3, %xmm7                                  #151.2
        pxor      %xmm0, %xmm1                                  #151.2
        psllq     $9, %xmm7                                     #151.2
        movdqa    %xmm4, %xmm2                                  #151.2
        pxor      %xmm7, %xmm1                                  #151.2
        psrldq    $8, %xmm4                                     #151.2
        psllq     $12, %xmm3                                    #151.2
        pxor      %xmm3, %xmm1                                  #151.2
        movdqa    %xmm4, %xmm3                                  #151.2
        pslldq    $8, %xmm2                                     #151.2
        psrlq     $59, %xmm3                                    #151.2
        movdqa    %xmm4, %xmm0                                  #151.2
        pxor      %xmm3, %xmm1                                  #151.2
        punpcklbw %xmm5, %xmm6                                  #134.7
        psrlq     $57, %xmm0                                    #151.2
        movdqa    %xmm4, %xmm7                                  #151.2
        movdqa    %xmm2, %xmm5                                  #151.2
        pxor      %xmm0, %xmm1                                  #151.2
        psrlq     $55, %xmm7                                    #151.2
        psrlq     $59, %xmm5                                    #151.2
        movdqa    %xmm2, %xmm3                                  #151.2
        pxor      %xmm7, %xmm1                                  #151.2
        pxor      %xmm5, %xmm6                                  #151.2
        psrlq     $57, %xmm3                                    #151.2
        movdqa    %xmm2, %xmm7                                  #151.2
        movdqa    %xmm2, %xmm9                                  #151.2
        pxor      %xmm3, %xmm6                                  #151.2
        psrlq     $55, %xmm7                                    #151.2
        psrlq     $52, %xmm2                                    #151.2
        psrldq    $8, %xmm9                                     #151.2
        pxor      %xmm7, %xmm6                                  #151.2
        pxor      %xmm2, %xmm6                                  #151.2
        movdqa    %xmm9, %xmm2                                  #151.2
        psllq     $5, %xmm2                                     #151.2
        movdqa    %xmm9, %xmm3                                  #151.2
        movdqa    %xmm4, %xmm8                                  #151.2
        pxor      %xmm2, %xmm6                                  #151.2
        psllq     $7, %xmm3                                     #151.2
        movdqa    %xmm9, %xmm5                                  #151.2
        pslldq    $8, %xmm4                                     #151.2
        psrlq     $52, %xmm8                                    #151.2
        pxor      %xmm3, %xmm6                                  #151.2
        psllq     $9, %xmm5                                     #151.2
        pxor      %xmm8, %xmm1                                  #151.2
        pxor      %xmm5, %xmm6                                  #151.2
        psllq     $12, %xmm9                                    #151.2
        movdqa    %xmm4, %xmm7                                  #151.2
        movdqa    %xmm1, %xmm0                                  #151.2
        pxor      %xmm9, %xmm6                                  #151.2
        psllq     $5, %xmm7                                     #151.2
        movdqa    %xmm4, %xmm8                                  #151.2
        psrldq    $8, %xmm0                                     #151.2
        pxor      %xmm7, %xmm6                                  #151.2
        psllq     $7, %xmm8                                     #151.2
        movdqa    %xmm4, %xmm10                                 #151.2
        psrlq     $59, %xmm0                                    #151.2
        pxor      %xmm8, %xmm6                                  #151.2
        psllq     $9, %xmm10                                    #151.2
        psllq     $59, %xmm0                                    #151.2
        pxor      %xmm10, %xmm6                                 #151.2
        psllq     $12, %xmm4                                    #151.2
        pxor      %xmm4, %xmm6                                  #151.2
        movdqa    %xmm0, %xmm4                                  #151.2
        psrlq     $59, %xmm4                                    #151.2
        movdqa    %xmm0, %xmm2                                  #151.2
        pxor      %xmm4, %xmm6                                  #151.2
        psrlq     $57, %xmm2                                    #151.2
        movdqa    %xmm0, %xmm3                                  #151.2
        pxor      %xmm2, %xmm6                                  #151.2
        psrlq     $55, %xmm3                                    #151.2
        psrlq     $52, %xmm0                                    #151.2
        movdqa    %xmm1, -24(%rsp)                              #153.30
        pxor      %xmm3, %xmm6                                  #151.2
        movq      -24(%rsp), %rax                               #154.9
        pxor      %xmm0, %xmm6                                  #151.2
        andq      -16(%rsp), %rdx                               #155.16
        movdqa    %xmm6, (%rdi)                                 #152.30
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
