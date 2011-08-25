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
# mark_description " -o CMakeFiles/relic_s.dir/low/core2-251/relic_fb_add_low.c.o -c";
	.file "relic_fb_add_low.c"
	.text
..TXTST1:
# -- Begin  fb_add1_low
# mark_begin;
       .align    16,0x90
	.globl fb_add1_low
fb_add1_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.1:                         # Preds ..B1.0
..___tag_value_fb_add1_low.1:                                   #43.51
        xorq      (%rsi), %rdx                                  #46.16
        movq      %rdx, (%rdi)                                  #46.4
        movq      8(%rsi), %rax                                 #50.12
        movq      %rax, 8(%rdi)                                 #50.5
        movq      16(%rsi), %rcx                                #50.12
        movq      %rcx, 16(%rdi)                                #50.5
        movq      24(%rsi), %r8                                 #50.12
        movq      %r8, 24(%rdi)                                 #50.5
        ret                                                     #51.1
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
..___tag_value_fb_addn_low.4:                                   #53.48
        movdqa    (%rsi), %xmm0                                 #54.43
        pxor      (%rdx), %xmm0                                 #54.18
        movdqa    %xmm0, (%rdi)                                 #54.14
        movdqa    16(%rsi), %xmm1                               #55.50
        pxor      16(%rdx), %xmm1                               #55.24
        movdqa    %xmm1, 16(%rdi)                               #55.15
        ret                                                     #56.1
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
..___tag_value_fb_addd_low.7:                                   #58.58
        movdqa    (%rsi), %xmm0                                 #61.43
        pxor      (%rdx), %xmm0                                 #61.18
        movdqa    %xmm0, (%rdi)                                 #61.14
        movdqa    16(%rsi), %xmm1                               #62.50
        pxor      16(%rdx), %xmm1                               #62.24
        movdqa    %xmm1, 16(%rdi)                               #62.15
        movdqa    32(%rsi), %xmm2                               #63.50
        pxor      32(%rdx), %xmm2                               #63.24
        movdqa    %xmm2, 32(%rdi)                               #63.15
        movdqa    48(%rsi), %xmm3                               #64.50
        pxor      48(%rdx), %xmm3                               #64.24
        movdqa    %xmm3, 48(%rdi)                               #64.15
        ret                                                     #65.1
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
..___tag_value_fb_add2_low.10:                                  #69.48
        movq      $0x7ffffffffffffff, %rcx                      #81.17
        movdqa    48(%rsi), %xmm2                               #76.33
        pxor      48(%rdx), %xmm2                               #76.7
        movdqa    %xmm2, %xmm13                                 #77.2
        pslldq    $8, %xmm13                                    #77.2
        psrldq    $8, %xmm2                                     #77.2
        movdqa    %xmm13, %xmm10                                #77.2
        movdqa    16(%rsi), %xmm3                               #74.33
        movdqa    %xmm2, %xmm6                                  #77.2
        movdqa    32(%rsi), %xmm4                               #75.33
        psrlq     $59, %xmm6                                    #77.2
        pxor      16(%rdx), %xmm3                               #74.7
        psrlq     $59, %xmm10                                   #77.2
        pxor      32(%rdx), %xmm4                               #75.7
        movdqa    %xmm13, %xmm11                                #77.2
        pxor      %xmm6, %xmm4                                  #77.2
        movdqa    %xmm13, %xmm6                                 #77.2
        pxor      %xmm10, %xmm3                                 #77.2
        psrlq     $57, %xmm11                                   #77.2
        movdqa    %xmm13, %xmm12                                #77.2
        pxor      %xmm11, %xmm3                                 #77.2
        psrldq    $8, %xmm6                                     #77.2
        psrlq     $55, %xmm12                                   #77.2
        pxor      %xmm12, %xmm3                                 #77.2
        psrlq     $52, %xmm13                                   #77.2
        movdqa    %xmm6, %xmm14                                 #77.2
        movdqa    %xmm2, %xmm7                                  #77.2
        pxor      %xmm13, %xmm3                                 #77.2
        psllq     $5, %xmm14                                    #77.2
        movdqa    %xmm6, %xmm15                                 #77.2
        psrlq     $57, %xmm7                                    #77.2
        movdqa    %xmm2, %xmm8                                  #77.2
        pxor      %xmm14, %xmm3                                 #77.2
        psllq     $7, %xmm15                                    #77.2
        movdqa    %xmm6, %xmm0                                  #77.2
        pxor      %xmm7, %xmm4                                  #77.2
        psrlq     $55, %xmm8                                    #77.2
        movdqa    %xmm2, %xmm9                                  #77.2
        pxor      %xmm15, %xmm3                                 #77.2
        pslldq    $8, %xmm2                                     #77.2
        psllq     $9, %xmm0                                     #77.2
        pxor      %xmm8, %xmm4                                  #77.2
        psrlq     $52, %xmm9                                    #77.2
        pxor      %xmm0, %xmm3                                  #77.2
        psllq     $12, %xmm6                                    #77.2
        movdqa    %xmm2, %xmm7                                  #77.2
        pxor      %xmm9, %xmm4                                  #77.2
        pxor      %xmm6, %xmm3                                  #77.2
        psllq     $5, %xmm7                                     #77.2
        movdqa    %xmm2, %xmm8                                  #77.2
        movdqa    %xmm4, %xmm1                                  #77.2
        pxor      %xmm7, %xmm3                                  #77.2
        psllq     $7, %xmm8                                     #77.2
        movdqa    %xmm2, %xmm9                                  #77.2
        pxor      %xmm8, %xmm3                                  #77.2
        pslldq    $8, %xmm1                                     #77.2
        psllq     $9, %xmm9                                     #77.2
        movdqa    (%rsi), %xmm5                                 #73.32
        pxor      %xmm9, %xmm3                                  #77.2
        psrldq    $8, %xmm4                                     #77.2
        psllq     $12, %xmm2                                    #77.2
        movdqa    %xmm1, %xmm13                                 #77.2
        pxor      %xmm2, %xmm3                                  #77.2
        pxor      (%rdx), %xmm5                                 #73.7
        movdqa    %xmm4, %xmm2                                  #77.2
        psrlq     $59, %xmm13                                   #77.2
        movdqa    %xmm1, %xmm14                                 #77.2
        psrlq     $59, %xmm2                                    #77.2
        pxor      %xmm13, %xmm5                                 #77.2
        psrlq     $57, %xmm14                                   #77.2
        movdqa    %xmm1, %xmm13                                 #77.2
        pxor      %xmm2, %xmm3                                  #77.2
        movdqa    %xmm1, %xmm2                                  #77.2
        pxor      %xmm14, %xmm5                                 #77.2
        psrlq     $55, %xmm13                                   #77.2
        psrldq    $8, %xmm2                                     #77.2
        pxor      %xmm13, %xmm5                                 #77.2
        psrlq     $52, %xmm1                                    #77.2
        movdqa    %xmm4, %xmm10                                 #77.2
        pxor      %xmm1, %xmm5                                  #77.2
        movdqa    %xmm2, %xmm1                                  #77.2
        psrlq     $57, %xmm10                                   #77.2
        movdqa    %xmm4, %xmm11                                 #77.2
        psllq     $5, %xmm1                                     #77.2
        movdqa    %xmm2, %xmm13                                 #77.2
        pxor      %xmm10, %xmm3                                 #77.2
        psrlq     $55, %xmm11                                   #77.2
        movdqa    %xmm4, %xmm12                                 #77.2
        pxor      %xmm1, %xmm5                                  #77.2
        psllq     $7, %xmm13                                    #77.2
        movdqa    %xmm2, %xmm14                                 #77.2
        pslldq    $8, %xmm4                                     #77.2
        pxor      %xmm11, %xmm3                                 #77.2
        psrlq     $52, %xmm12                                   #77.2
        pxor      %xmm13, %xmm5                                 #77.2
        psllq     $9, %xmm14                                    #77.2
        pxor      %xmm12, %xmm3                                 #77.2
        pxor      %xmm14, %xmm5                                 #77.2
        psllq     $12, %xmm2                                    #77.2
        movdqa    %xmm4, %xmm6                                  #77.2
        movdqa    %xmm3, %xmm0                                  #77.2
        pxor      %xmm2, %xmm5                                  #77.2
        psllq     $5, %xmm6                                     #77.2
        movdqa    %xmm4, %xmm7                                  #77.2
        pxor      %xmm6, %xmm5                                  #77.2
        psrldq    $8, %xmm0                                     #77.2
        psllq     $7, %xmm7                                     #77.2
        movdqa    %xmm4, %xmm8                                  #77.2
        psrlq     $59, %xmm0                                    #77.2
        pxor      %xmm7, %xmm5                                  #77.2
        psllq     $9, %xmm8                                     #77.2
        psllq     $59, %xmm0                                    #77.2
        pxor      %xmm8, %xmm5                                  #77.2
        psllq     $12, %xmm4                                    #77.2
        movdqa    %xmm0, %xmm1                                  #77.2
        pxor      %xmm4, %xmm5                                  #77.2
        movdqa    %xmm0, %xmm4                                  #77.2
        psrlq     $59, %xmm4                                    #77.2
        psrlq     $57, %xmm1                                    #77.2
        pxor      %xmm4, %xmm5                                  #77.2
        movdqa    %xmm0, %xmm2                                  #77.2
        pxor      %xmm1, %xmm5                                  #77.2
        psrlq     $55, %xmm2                                    #77.2
        movdqa    %xmm3, -24(%rsp)                              #79.30
        pxor      %xmm2, %xmm5                                  #77.2
        psrlq     $52, %xmm0                                    #77.2
        movq      -24(%rsp), %rax                               #80.9
        pxor      %xmm0, %xmm5                                  #77.2
        andq      -16(%rsp), %rcx                               #81.17
        movdqa    %xmm5, (%rdi)                                 #78.30
        movq      %rax, 16(%rdi)                                #80.2
        movq      %rcx, 24(%rdi)                                #81.2
        ret                                                     #82.1
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
.eh_frame_seg0:
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
