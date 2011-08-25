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
# mark_description " -o CMakeFiles/relic_s.dir/low/core2-251/relic_fb_itr_low.c.o -c";
	.file "relic_fb_itr_low.c"
	.text
..TXTST0:
# -- Begin  fb_itrn_low
# mark_begin;
       .align    16,0x90
	.globl fb_itrn_low
fb_itrn_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.10:                         # Preds ..B1.0
..___tag_value_fb_itrn_low.1:                                   #44.48
        pushq     %r15                                          #44.48
..___tag_value_fb_itrn_low.3:                                   #
        pushq     %rbx                                          #44.48
..___tag_value_fb_itrn_low.5:                                   #
        pushq     %rbp                                          #44.48
..___tag_value_fb_itrn_low.7:                                   #
        xorl      %ecx, %ecx                                    #50.2
        pxor      %xmm1, %xmm1                                  #49.12
        xorl      %eax, %eax                                    #
        movq      (%rsi), %r10                                  #53.10
        xorl      %r11d, %r11d                                  #
        movq      8(%rsi), %r9                                  #53.10
        movl      %ecx, %ebx                                    #
        movq      16(%rsi), %r8                                 #53.10
        movdqa    %xmm1, %xmm0                                  #49.12
                                # LOE rdx rsi rdi r8 r9 r10 r11 r12 r13 r14 eax ebx xmm0 xmm1
..B1.200:                        # Preds ..B1.200 ..B1.10
        movq      %r10, %rbp                                    #53.17
        lea       60(%rax), %ecx                                #54.4
        movq      %r9, %r15                                     #53.17
        shrq      %cl, %rbp                                     #53.17
        andq      $15, %rbp                                     #53.22
        incl      %ebx                                          #50.2
        addq      %r11, %rbp                                    #54.4
        addl      $-4, %eax                                     #50.2
        shlq      $5, %rbp                                      #54.9
        shrq      %cl, %r15                                     #53.17
        andq      $15, %r15                                     #53.22
        addq      %r11, %r15                                    #54.4
        pxor      7680(%rbp,%rdx), %xmm0                        #55.9
        pxor      7696(%rbp,%rdx), %xmm1                        #56.9
        movq      %r8, %rbp                                     #53.17
        shrq      %cl, %rbp                                     #53.17
        andq      $15, %rbp                                     #53.22
        shlq      $5, %r15                                      #54.9
        addq      %r11, %rbp                                    #54.4
        shlq      $5, %rbp                                      #54.9
        addq      $-16, %r11                                    #50.2
        cmpl      $16, %ebx                                     #50.2
        pxor      15872(%r15,%rdx), %xmm0                       #55.9
        pxor      15888(%r15,%rdx), %xmm1                       #56.9
        pxor      24064(%rbp,%rdx), %xmm0                       #55.9
        pxor      24080(%rbp,%rdx), %xmm1                       #56.9
        jb        ..B1.200        # Prob 93%                      #50.2
                                # LOE rdx rsi rdi r8 r9 r10 r11 r12 r13 r14 eax ebx xmm0 xmm1
..B1.300:                       # Preds ..B1.200
        movq      24(%rsi), %rax                                #44.6
        movq      %rax, %rcx                                    #61.16
        shrq      $56, %rcx                                     #61.16
        movq      %rax, %rsi                                    #61.16
        andq      $15, %rcx                                     #61.21
        movq      %rax, %r8                                     #61.16
        shlq      $5, %rcx                                      #62.38
        movq      %rax, %r9                                     #61.16
        shrq      $52, %rsi                                     #61.16
        movq      %rax, %r10                                    #61.16
        shrq      $48, %r8                                      #61.16
        andq      $15, %rsi                                     #61.21
        shlq      $5, %rsi                                      #62.38
        andq      $15, %r8                                      #61.21
        shrq      $44, %r9                                      #61.16
        movq      %rax, %r11                                    #61.16
        shlq      $5, %r8                                       #62.38
        andq      $15, %r9                                      #61.21
        movdqa    31744(%rcx,%rdx), %xmm2                       #63.38
        movdqa    31760(%rcx,%rdx), %xmm3                       #64.39
        pxor      %xmm2, %xmm0                                  #63.8
        shrq      $40, %r10                                     #61.16
        movq      %rax, %rcx                                    #61.16
        shlq      $5, %r9                                       #62.38
        andq      $15, %r10                                     #61.21
        shrq      $36, %r11                                     #61.16
        pxor      %xmm3, %xmm1                                  #64.8
        pxor      31232(%rsi,%rdx), %xmm0                       #63.8
        andq      $15, %r11                                     #61.21
        pxor      31248(%rsi,%rdx), %xmm1                       #64.8
        movq      %rax, %rsi                                    #61.16
        shlq      $5, %r10                                      #62.38
        shrq      $32, %rcx                                     #61.16
        pxor      30720(%r8,%rdx), %xmm0                        #63.8
        andq      $15, %rcx                                     #61.21
        pxor      30736(%r8,%rdx), %xmm1                        #64.8
        movq      %rax, %r8                                     #61.16
        shlq      $5, %r11                                      #62.38
        shrq      $28, %rsi                                     #61.16
        shlq      $5, %rcx                                      #62.38
        andq      $15, %rsi                                     #61.21
        shrq      $24, %r8                                      #61.16
        pxor      30208(%r9,%rdx), %xmm0                        #63.8
        andq      $15, %r8                                      #61.21
        pxor      30224(%r9,%rdx), %xmm1                        #64.8
        movq      %rax, %r9                                     #61.16
        shlq      $5, %rsi                                      #62.38
        pxor      29696(%r10,%rdx), %xmm0                       #63.8
        pxor      29712(%r10,%rdx), %xmm1                       #64.8
        movq      %rax, %r10                                    #61.16
        shlq      $5, %r8                                       #62.38
        pxor      29184(%r11,%rdx), %xmm0                       #63.8
        pxor      29200(%r11,%rdx), %xmm1                       #64.8
        shrq      $20, %r9                                      #61.16
        pxor      28672(%rcx,%rdx), %xmm0                       #63.8
        andq      $15, %r9                                      #61.21
        pxor      28688(%rcx,%rdx), %xmm1                       #64.8
        movq      %rax, %rcx                                    #61.16
        shrq      $16, %r10                                     #61.16
        pxor      28160(%rsi,%rdx), %xmm0                       #63.8
        andq      $15, %r10                                     #61.21
        pxor      28176(%rsi,%rdx), %xmm1                       #64.8
        movq      %rax, %rsi                                    #61.16
        shlq      $5, %r9                                       #62.38
        shrq      $12, %rcx                                     #61.16
        pxor      27648(%r8,%rdx), %xmm0                        #63.8
        andq      $15, %rcx                                     #61.21
        pxor      27664(%r8,%rdx), %xmm1                        #64.8
        movq      %rax, %r8                                     #61.16
        shlq      $5, %r10                                      #62.38
        andq      $15, %rax                                     #61.21
        shrq      $8, %rsi                                      #61.16
        shlq      $5, %rcx                                      #62.38
        andq      $15, %rsi                                     #61.21
        shrq      $4, %r8                                       #61.16
        shlq      $5, %rsi                                      #62.38
        andq      $15, %r8                                      #61.21
        pxor      27136(%r9,%rdx), %xmm0                        #63.8
        pxor      27152(%r9,%rdx), %xmm1                        #64.8
        shlq      $5, %r8                                       #62.38
        pxor      26624(%r10,%rdx), %xmm0                       #63.8
        pxor      26640(%r10,%rdx), %xmm1                       #64.8
        shlq      $5, %rax                                      #62.38
        pxor      26112(%rcx,%rdx), %xmm0                       #63.8
        pxor      26128(%rcx,%rdx), %xmm1                       #64.8
        pxor      25600(%rsi,%rdx), %xmm0                       #63.8
        pxor      25616(%rsi,%rdx), %xmm1                       #64.8
        pxor      25088(%r8,%rdx), %xmm0                        #63.8
        pxor      25104(%r8,%rdx), %xmm1                        #64.8
        pxor      24576(%rax,%rdx), %xmm0                       #63.8
        pxor      24592(%rax,%rdx), %xmm1                       #64.8
        movdqa    %xmm0, (%rdi)                                 #67.29
        movdqa    %xmm1, 16(%rdi)                               #68.30
..___tag_value_fb_itrn_low.9:                                   #69.1
        popq      %rbp                                          #69.1
..___tag_value_fb_itrn_low.10:                                  #
        popq      %rbx                                          #69.1
..___tag_value_fb_itrn_low.12:                                  #
        popq      %r15                                          #69.1
..___tag_value_fb_itrn_low.14:                                  #
        ret                                                     #69.1
        .align    16,0x90
..___tag_value_fb_itrn_low.15:                                  #
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
	.4byte 0x0000005c
	.4byte 0x0000001c
	.8byte ..___tag_value_fb_itrn_low.1
	.8byte ..___tag_value_fb_itrn_low.15-..___tag_value_fb_itrn_low.1
	.byte 0x04
	.4byte ..___tag_value_fb_itrn_low.3-..___tag_value_fb_itrn_low.1
	.4byte 0x070c028f
	.2byte 0x0410
	.4byte ..___tag_value_fb_itrn_low.5-..___tag_value_fb_itrn_low.3
	.4byte 0x070c0383
	.2byte 0x0418
	.4byte ..___tag_value_fb_itrn_low.7-..___tag_value_fb_itrn_low.5
	.4byte 0x070c0486
	.2byte 0x0420
	.4byte ..___tag_value_fb_itrn_low.9-..___tag_value_fb_itrn_low.7
	.4byte 0x04060609
	.4byte ..___tag_value_fb_itrn_low.10-..___tag_value_fb_itrn_low.9
	.4byte 0x0918070c
	.2byte 0x0303
	.byte 0x04
	.4byte ..___tag_value_fb_itrn_low.12-..___tag_value_fb_itrn_low.10
	.4byte 0x0910070c
	.2byte 0x0f0f
	.byte 0x04
	.4byte ..___tag_value_fb_itrn_low.14-..___tag_value_fb_itrn_low.12
	.4byte 0x0008070c
	.2byte 0x0000
	.byte 0x00
# End
