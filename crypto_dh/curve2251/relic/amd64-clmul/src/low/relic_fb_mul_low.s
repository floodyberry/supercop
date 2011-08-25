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
# mark_description " -o CMakeFiles/relic_s.dir/low/core2-251/relic_fb_mul_low.c.o -c";
	.file "relic_fb_mul_low.c"
	.text
..TXTST2:
# -- Begin  fb_muld_low
# mark_begin;
       .align    16,0x90
	.globl fb_muld_low
fb_muld_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B1.12:                         # Preds ..B1.0
..___tag_value_fb_muld_low.1:                                   #46.58
        pushq     %r12                                          #46.58
..___tag_value_fb_muld_low.3:                                   #
        pushq     %r13                                          #46.58
..___tag_value_fb_muld_low.5:                                   #
        pushq     %r14                                          #46.58
..___tag_value_fb_muld_low.7:                                   #
        pushq     %r15                                          #46.58
..___tag_value_fb_muld_low.9:                                   #
        pushq     %rbx                                          #46.58
..___tag_value_fb_muld_low.11:                                  #
        pushq     %rbp                                          #46.58
..___tag_value_fb_muld_low.13:                                  #
        subq      $1048, %rsp                                   #46.58
..___tag_value_fb_muld_low.15:                                  #
        movl      %ecx, %ebp                                    #46.58
        movq      %rdx, %r15                                    #46.58
        movq      %rsi, %rbx                                    #46.58
        movq      %rdi, %r13                                    #46.58
        movl      $1008, %eax                                   #47.17
        pxor      %xmm0, %xmm0                                  #47.17
                                # LOE rax rbx r12 r13 r15 ebp xmm0
..B1.38:                        # Preds ..B1.38 ..B1.12
        movaps    %xmm0, (%rsp,%rax)                            #47.17
        movaps    %xmm0, -16(%rsp,%rax)                         #47.17
        movaps    %xmm0, -32(%rsp,%rax)                         #47.17
        movaps    %xmm0, -48(%rsp,%rax)                         #47.17
        movaps    %xmm0, -64(%rsp,%rax)                         #47.17
        movaps    %xmm0, -80(%rsp,%rax)                         #47.17
        movaps    %xmm0, -96(%rsp,%rax)                         #47.17
        subq      $112, %rax                                    #47.17
        jne       ..B1.38       # Prob 88%                      #47.17
                                # LOE rax rbx r12 r13 r15 ebp xmm0
..B1.37:                        # Preds ..B1.38
        movaps    %xmm0, (%rsp)                                 #47.17
                                # LOE rbx r12 r13 r15 ebp xmm0
..B1.2:                         # Preds ..B1.37
        movq      %r13, %rdi                                    #51.2
        lea       (%rbp,%rbp), %r14d                            #51.17
        movl      %r14d, %esi                                   #51.2
        call      dv_zero                                       #51.2
                                # LOE rbx r12 r13 r15 ebp r14d
..B1.3:                         # Preds ..B1.2
        xorl      %edx, %edx                                    #53.7
        lea       1(%rbp), %r10d                                #55.28
        movq      %r15, 1032(%rsp)                              #55.11
        lea       (%rsp), %rax                                  #55.11
        movl      %ebp, 1024(%rsp)                              #55.11
        movq      %rax, %rbp                                    #55.11
        pxor      %xmm0, %xmm0                                  #
        movl      %r14d, %r15d                                  #55.11
        movq      %rdx, %r14                                    #55.11
        movl      %r10d, %r12d                                  #55.11
                                # LOE rbx rbp r13 r14 r12d r15d
..B1.4:                         # Preds ..B1.5 ..B1.3
        movq      %rbp, %rdi                                    #55.3
        movl      %r12d, %esi                                   #55.3
        call      dv_zero                                       #55.3
                                # LOE rbx rbp r13 r14 r12d r15d
..B1.5:                         # Preds ..B1.4
        incq      %r14                                          #53.22
        addq      $64, %rbp                                     #53.22
        cmpq      $16, %r14                                     #53.18
        jl        ..B1.4        # Prob 93%                      #53.18
                                # LOE rbx rbp r13 r14 r12d r15d
..B1.6:                         # Preds ..B1.5
        movl      1024(%rsp), %ebp                              #
        movl      %r12d, %r10d                                  #
        movl      %r15d, %r14d                                  #
        xorl      %r9d, %r9d                                    #58.2
        movq      1032(%rsp), %r15                              #
        pxor      %xmm0, %xmm0                                  #
        testl     %ebp, %ebp                                    #59.18
        jle       ..B1.15       # Prob 50%                      #59.18
                                # LOE rbx rbp r9 r12 r13 r15 ebp r10d r14d bpl xmm0
..B1.7:                         # Preds ..B1.6
        movslq    %ebp, %rcx                                    #59.2
        cmpq      $8, %rcx                                      #59.2
        jl        ..B1.34       # Prob 10%                      #59.2
                                # LOE rcx rbx rbp r9 r12 r13 r15 ebp r10d r14d bpl xmm0
..B1.8:                         # Preds ..B1.7
        movl      %ebp, %edx                                    #59.2
        xorl      %eax, %eax                                    #59.2
        andl      $7, %edx                                      #59.2
        negl      %edx                                          #59.2
        addl      %ebp, %edx                                    #59.2
        movslq    %edx, %rdx                                    #59.2
                                # LOE rax rdx rcx rbx r9 r12 r13 r15 ebp r10d r14d xmm0
..B1.9:                         # Preds ..B1.9 ..B1.8
        movdqa    %xmm0, (%rsp,%rax,8)                          #64.3
        movdqa    %xmm0, 16(%rsp,%rax,8)                        #64.3
        movdqa    %xmm0, 32(%rsp,%rax,8)                        #64.3
        movdqa    %xmm0, 48(%rsp,%rax,8)                        #64.3
        addq      $8, %rax                                      #59.2
        cmpq      %rdx, %rax                                    #59.2
        jb        ..B1.9        # Prob 87%                      #59.2
                                # LOE rax rdx rcx rbx r9 r12 r13 r15 ebp r10d r14d xmm0
..B1.11:                        # Preds ..B1.9 ..B1.34
        cmpq      %rcx, %rdx                                    #59.2
        jae       ..B1.41       # Prob 10%                      #59.2
                                # LOE rdx rcx rbx r9 r12 r13 r15 ebp r10d r14d
..B1.13:                        # Preds ..B1.11 ..B1.13
        movq      $0, (%rsp,%rdx,8)                             #64.3
        incq      %rdx                                          #59.2
        cmpq      %rcx, %rdx                                    #59.2
        jb        ..B1.13       # Prob 87%                      #59.2
                                # LOE rdx rcx rbx r9 r12 r13 r15 ebp r10d r14d
..B1.14:                        # Preds ..B1.13
        testl     %ebp, %ebp                                    #59.18
                                # LOE rbx r9 r12 r13 r15 ebp r10d r14d
..B1.15:                        # Preds ..B1.6 ..B1.41 ..B1.14
        movl      $0, %esi                                      #59.2
        jle       ..B1.20       # Prob 10%                      #59.18
                                # LOE rbx rsi r9 r12 r13 r15 ebp r10d r14d
..B1.16:                        # Preds ..B1.15
        movslq    %ebp, %r8                                     #59.2
        movl      %r14d, 1032(%rsp)                             #59.2
        movl      %ebp, 1024(%rsp)                              #59.2
                                # LOE rbx rsi r8 r9 r13 r15 r10d
..B1.17:                        # Preds ..B1.17 ..B1.16
        movq      (%r15,%rsi,8), %rdi                           #46.6
        movq      %r9, %r11                                     #61.26
        movq      %r9, %r12                                     #62.26
        movq      %rdi, %r14                                    #67.22
        shrq      $63, %r11                                     #61.26
        shrq      $62, %r12                                     #62.26
        lea       (%rdi,%rdi), %rcx                             #61.15
        orq       %r11, %rcx                                    #61.26
        lea       (,%rdi,4), %rdx                               #62.15
        orq       %r12, %rdx                                    #62.26
        lea       (,%rdi,8), %rax                               #63.15
        shrq      $61, %r9                                      #63.26
        xorq      %rcx, %r14                                    #67.22
        movq      %rdi, %r11                                    #69.22
        movq      %rcx, %r12                                    #70.22
        movq      %rdx, %rbp                                    #71.27
        orq       %r9, %rax                                     #63.26
        xorq      %rdx, %r11                                    #69.22
        xorq      %rdx, %r12                                    #70.22
        xorq      %r14, %rbp                                    #71.27
        movq      %rdi, %r9                                     #73.22
        movq      %rcx, 128(%rsp,%rsi,8)                        #66.3
        xorq      %rax, %r9                                     #73.22
        movq      %r14, 192(%rsp,%rsi,8)                        #67.3
        xorq      %rax, %rcx                                    #74.23
        movq      %rdx, 256(%rsp,%rsi,8)                        #68.3
        xorq      %rax, %r14                                    #75.28
        movq      %r11, 320(%rsp,%rsi,8)                        #69.3
        xorq      %rax, %rdx                                    #76.23
        movq      %r12, 384(%rsp,%rsi,8)                        #70.3
        xorq      %rax, %r11                                    #77.28
        movq      %rax, 512(%rsp,%rsi,8)                        #72.3
        xorq      %rax, %r12                                    #78.28
        xorq      %rbp, %rax                                    #79.33
        movq      %rdi, 64(%rsp,%rsi,8)                         #65.3
        movq      %rbp, 448(%rsp,%rsi,8)                        #71.3
        movq      %r9, 576(%rsp,%rsi,8)                         #73.3
        movq      %rdi, %r9                                     #80.3
        movq      %rcx, 640(%rsp,%rsi,8)                        #74.3
        movq      %r14, 704(%rsp,%rsi,8)                        #75.3
        movq      %rdx, 768(%rsp,%rsi,8)                        #76.3
        movq      %r11, 832(%rsp,%rsi,8)                        #77.3
        movq      %r12, 896(%rsp,%rsi,8)                        #78.3
        movq      %rax, 960(%rsp,%rsi,8)                        #79.3
        incq      %rsi                                          #59.2
        cmpq      %r8, %rsi                                     #59.2
        jb        ..B1.17       # Prob 87%                      #59.2
                                # LOE rbx rsi rdi r8 r9 r13 r15 r10d
..B1.18:                        # Preds ..B1.17
        movl      1032(%rsp), %r14d                             #
        testq     %rdi, %rdi                                    #83.10
        movl      1024(%rsp), %ebp                              #
        jbe       ..B1.40       # Prob 50%                      #83.10
                                # LOE rbx rbp rdi r8 r12 r13 r14 ebp r10d r14d bpl r14b
..B1.19:                        # Preds ..B1.18
        movq      %rdi, %rdx                                    #84.13
        movq      %rdi, %rcx                                    #85.13
        shrq      $63, %rdx                                     #84.13
        xorl      %eax, %eax                                    #87.20
        shrq      $62, %rcx                                     #85.13
        movq      %rdx, %rsi                                    #90.42
        shrq      $61, %rdi                                     #86.13
        xorq      %rcx, %rsi                                    #90.42
        movq      %rdx, 192(%rsp,%r8,8)                         #88.20
        movq      %rdx, 128(%rsp,%r8,8)                         #88.3
        xorq      %rdi, %rdx                                    #92.44
        movq      %rcx, 320(%rsp,%r8,8)                         #89.20
        movq      %rcx, 256(%rsp,%r8,8)                         #89.3
        xorq      %rdi, %rcx                                    #93.44
        movq      %rdi, 576(%rsp,%r8,8)                         #91.20
        movq      %rdi, 512(%rsp,%r8,8)                         #91.3
        xorq      %rsi, %rdi                                    #94.49
        movq      %rax, 64(%rsp,%r8,8)                          #87.20
        testl     %ebp, %ebp                                    #94.3
        movq      %rax, (%rsp,%r8,8)                            #87.3
        movq      %rsi, 448(%rsp,%r8,8)                         #90.20
        movq      %rsi, 384(%rsp,%r8,8)                         #90.3
        movq      %rdx, 704(%rsp,%r8,8)                         #92.21
        movq      %rdx, 640(%rsp,%r8,8)                         #92.3
        movq      %rcx, 832(%rsp,%r8,8)                         #93.21
        movq      %rcx, 768(%rsp,%r8,8)                         #93.3
        movq      %rdi, 960(%rsp,%r8,8)                         #94.21
        movq      %rdi, 896(%rsp,%r8,8)                         #94.3
        jmp       ..B1.20       # Prob 100%                     #94.3
                                # LOE rbx r12 r13 ebp r10d r14d
..B1.40:                        # Preds ..B1.18
        testl     %ebp, %ebp                                    #59.18
                                # LOE rbx r12 r13 ebp r10d r14d
..B1.20:                        # Preds ..B1.15 ..B1.40 ..B1.19
        movl      $60, %r15d                                    #97.7
        movl      %ebp, %r12d                                   #97.7
        movl      %r10d, %ebp                                   #97.7
                                # LOE rbx r13 ebp r12d r14d r15d
..B1.21:                        # Preds ..B1.39 ..B1.20
        movq      %rbx, %rcx                                    #98.3
        movq      %r13, %rdx                                    #99.3
        movl      $0, %eax                                      #100.8
        jle       ..B1.26       # Prob 10%                      #100.19
                                # LOE rdx rcx rbx r13 eax ebp r12d r14d r15d
..B1.22:                        # Preds ..B1.21
        movq      %r13, 1040(%rsp)                              #
        movq      %rcx, %r13                                    #
        movq      %rbx, 1024(%rsp)                              #
        movl      %eax, %ebx                                    #
        movl      %r14d, 1032(%rsp)                             #
        movq      %rdx, %r14                                    #
                                # LOE r13 r14 ebx ebp r12d r15d
..B1.23:                        # Preds ..B1.24 ..B1.22
        movl      %r15d, %ecx                                   #101.18
        lea       (%rsp), %r8                                   #102.4
        movq      (%r13), %rdx                                  #101.10
        movq      %r14, %rdi                                    #102.4
        shrq      %cl, %rdx                                     #101.18
        movq      %r14, %rsi                                    #102.4
        andq      $15, %rdx                                     #101.23
        movl      %ebp, %ecx                                    #102.4
        shlq      $6, %rdx                                      #102.28
        addq      %r8, %rdx                                     #102.4
        call      fb_addd_low                                   #102.4
                                # LOE r13 r14 ebx ebp r12d r15d
..B1.24:                        # Preds ..B1.23
        incl      %ebx                                          #100.25
        addq      $8, %r13                                      #100.30
        addq      $8, %r14                                      #100.38
        cmpl      %r12d, %ebx                                   #100.19
        jl        ..B1.23       # Prob 82%                      #100.19
                                # LOE r13 r14 ebx ebp r12d r15d
..B1.25:                        # Preds ..B1.24
        movq      1040(%rsp), %r13                              #
        movq      1024(%rsp), %rbx                              #
        movl      1032(%rsp), %r14d                             #
                                # LOE rbx r13 ebp r12d r14d r15d
..B1.26:                        # Preds ..B1.21 ..B1.25
        movq      %r13, %rdi                                    #104.3
        movq      %r13, %rsi                                    #104.3
        movl      %r14d, %edx                                   #104.3
        movl      $4, %ecx                                      #104.3
        call      bn_lshb_low                                   #104.3
                                # LOE rbx r13 ebp r12d r14d r15d
..B1.27:                        # Preds ..B1.26
        addl      $-4, %r15d                                    #97.32
        jle       ..B1.28       # Prob 7%                       #97.29
                                # LOE rbx r13 ebp r12d r14d r15d
..B1.39:                        # Preds ..B1.27
        testl     %r12d, %r12d                                  #59.18
        jmp       ..B1.21       # Prob 100%                     #59.18
                                # LOE rbx r13 ebp r12d r14d r15d
..B1.28:                        # Preds ..B1.27
        movl      %ebp, %r10d                                   #
        movl      %r12d, %ebp                                   #
        xorl      %r14d, %r14d                                  #106.7
        testl     %ebp, %ebp                                    #106.18
        jle       ..B1.33       # Prob 10%                      #106.18
                                # LOE rbx r12 r13 ebp r10d r14d
..B1.29:                        # Preds ..B1.28
        movl      %ebp, %r12d                                   #
        movl      %r10d, %ebp                                   #
        lea       (%rsp), %r15                                  #
                                # LOE rbx r13 r15 ebp r12d r14d
..B1.30:                        # Preds ..B1.31 ..B1.29
        movq      (%rbx), %rdx                                  #107.8
        movq      %r13, %rdi                                    #108.3
        andq      $15, %rdx                                     #107.12
        movq      %r13, %rsi                                    #108.3
        shlq      $6, %rdx                                      #108.21
        movl      %ebp, %ecx                                    #108.3
        addq      %r15, %rdx                                    #108.3
        call      fb_addd_low                                   #108.3
                                # LOE rbx r13 r15 ebp r12d r14d
..B1.31:                        # Preds ..B1.30
        incl      %r14d                                         #106.24
        addq      $8, %rbx                                      #106.29
        addq      $8, %r13                                      #106.34
        cmpl      %r12d, %r14d                                  #106.18
        jl        ..B1.30       # Prob 82%                      #106.18
                                # LOE rbx r13 r15 ebp r12d r14d
..B1.33:                        # Preds ..B1.31 ..B1.28
        addq      $1048, %rsp                                   #113.1
..___tag_value_fb_muld_low.16:                                  #
        popq      %rbp                                          #113.1
..___tag_value_fb_muld_low.18:                                  #
        popq      %rbx                                          #113.1
..___tag_value_fb_muld_low.20:                                  #
        popq      %r15                                          #113.1
..___tag_value_fb_muld_low.22:                                  #
        popq      %r14                                          #113.1
..___tag_value_fb_muld_low.24:                                  #
        popq      %r13                                          #113.1
..___tag_value_fb_muld_low.26:                                  #
        popq      %r12                                          #113.1
..___tag_value_fb_muld_low.28:                                  #
        ret                                                     #113.1
..___tag_value_fb_muld_low.29:                                  #
                                # LOE
..B1.34:                        # Preds ..B1.7                  # Infreq
        xorl      %edx, %edx                                    #59.2
        jmp       ..B1.11       # Prob 100%                     #59.2
                                # LOE rdx rcx rbx r9 r12 r13 r15 ebp r10d r14d
..B1.41:                        # Preds ..B1.11                 # Infreq
        testl     %ebp, %ebp                                    #59.18
        jmp       ..B1.15       # Prob 100%                     #59.18
        .align    16,0x90
..___tag_value_fb_muld_low.36:                                  #
                                # LOE rbx r9 r12 r13 r15 ebp r10d r14d
# mark_end;
	.type	fb_muld_low,@function
	.size	fb_muld_low,.-fb_muld_low
	.data
# -- End  fb_muld_low
	.text
# -- Begin  fb_rdcn_low2
# mark_begin;
       .align    16,0x90
	.globl fb_rdcn_low2
fb_rdcn_low2:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.10:                         # Preds ..B2.0
..___tag_value_fb_rdcn_low2.37:                                 #92.39
        movq      $0x7ffffffffffffff, %rdx                      #106.17
        movdqa    48(%rsi), %xmm4                               #98.34
        movdqa    %xmm4, %xmm11                                 #100.2
        pslldq    $8, %xmm11                                    #100.2
        movdqa    %xmm11, %xmm2                                 #100.2
        movdqa    %xmm11, %xmm9                                 #100.2
        psrldq    $8, %xmm4                                     #100.2
        psrlq     $59, %xmm2                                    #100.2
        pxor      16(%rsi), %xmm2                               #100.2
        movdqa    %xmm4, %xmm5                                  #100.2
        movdqa    %xmm11, %xmm15                                #100.2
        psrlq     $57, %xmm9                                    #100.2
        movdqa    %xmm11, %xmm10                                #100.2
        psrlq     $59, %xmm5                                    #100.2
        psrldq    $8, %xmm15                                    #100.2
        movdqa    %xmm4, %xmm6                                  #100.2
        pxor      %xmm9, %xmm2                                  #100.2
        psrlq     $55, %xmm10                                   #100.2
        pxor      32(%rsi), %xmm5                               #100.2
        psrlq     $57, %xmm6                                    #100.2
        movdqa    %xmm4, %xmm7                                  #100.2
        pxor      %xmm10, %xmm2                                 #100.2
        psrlq     $52, %xmm11                                   #100.2
        movdqa    %xmm15, %xmm12                                #100.2
        pxor      %xmm6, %xmm5                                  #100.2
        psrlq     $55, %xmm7                                    #100.2
        movdqa    %xmm4, %xmm8                                  #100.2
        pxor      %xmm11, %xmm2                                 #100.2
        psllq     $5, %xmm12                                    #100.2
        movdqa    %xmm15, %xmm13                                #100.2
        pxor      %xmm7, %xmm5                                  #100.2
        psrlq     $52, %xmm8                                    #100.2
        pxor      %xmm12, %xmm2                                 #100.2
        psllq     $7, %xmm13                                    #100.2
        movdqa    %xmm15, %xmm14                                #100.2
        pxor      %xmm8, %xmm5                                  #100.2
        pslldq    $8, %xmm4                                     #100.2
        pxor      %xmm13, %xmm2                                 #100.2
        psllq     $9, %xmm14                                    #100.2
        movdqa    %xmm5, %xmm3                                  #100.2
        pxor      %xmm14, %xmm2                                 #100.2
        psllq     $12, %xmm15                                   #100.2
        movdqa    %xmm4, %xmm0                                  #100.2
        pxor      %xmm15, %xmm2                                 #100.2
        pslldq    $8, %xmm3                                     #100.2
        psllq     $5, %xmm0                                     #100.2
        pxor      %xmm0, %xmm2                                  #100.2
        movdqa    %xmm4, %xmm1                                  #100.2
        movdqa    %xmm3, %xmm0                                  #100.2
        psllq     $7, %xmm1                                     #100.2
        movdqa    %xmm4, %xmm6                                  #100.2
        psrlq     $59, %xmm0                                    #100.2
        movdqa    %xmm3, %xmm10                                 #100.2
        pxor      %xmm1, %xmm2                                  #100.2
        pxor      (%rsi), %xmm0                                 #100.2
        psllq     $9, %xmm6                                     #100.2
        psrlq     $57, %xmm10                                   #100.2
        movdqa    %xmm3, %xmm11                                 #100.2
        psrldq    $8, %xmm5                                     #100.2
        pxor      %xmm6, %xmm2                                  #100.2
        psllq     $12, %xmm4                                    #100.2
        movdqa    %xmm3, %xmm14                                 #100.2
        pxor      %xmm10, %xmm0                                 #100.2
        psrlq     $55, %xmm11                                   #100.2
        psrldq    $8, %xmm14                                    #100.2
        pxor      %xmm4, %xmm2                                  #100.2
        movdqa    %xmm5, %xmm4                                  #100.2
        pxor      %xmm11, %xmm0                                 #100.2
        psrlq     $52, %xmm3                                    #100.2
        psrlq     $59, %xmm4                                    #100.2
        movdqa    %xmm5, %xmm7                                  #100.2
        pxor      %xmm3, %xmm0                                  #100.2
        movdqa    %xmm14, %xmm3                                 #100.2
        pxor      %xmm4, %xmm2                                  #100.2
        psrlq     $57, %xmm7                                    #100.2
        movdqa    %xmm5, %xmm8                                  #100.2
        psllq     $5, %xmm3                                     #100.2
        movdqa    %xmm14, %xmm12                                #100.2
        pxor      %xmm7, %xmm2                                  #100.2
        psrlq     $55, %xmm8                                    #100.2
        movdqa    %xmm5, %xmm9                                  #100.2
        pxor      %xmm3, %xmm0                                  #100.2
        psllq     $7, %xmm12                                    #100.2
        movdqa    %xmm14, %xmm13                                #100.2
        pslldq    $8, %xmm5                                     #100.2
        pxor      %xmm8, %xmm2                                  #100.2
        psrlq     $52, %xmm9                                    #100.2
        pxor      %xmm12, %xmm0                                 #100.2
        psllq     $9, %xmm13                                    #100.2
        pxor      %xmm9, %xmm2                                  #100.2
        pxor      %xmm13, %xmm0                                 #100.2
        psllq     $12, %xmm14                                   #100.2
        movdqa    %xmm5, %xmm3                                  #100.2
        movdqa    %xmm2, %xmm1                                  #100.2
        pxor      %xmm14, %xmm0                                 #100.2
        psllq     $5, %xmm3                                     #100.2
        movdqa    %xmm5, %xmm4                                  #100.2
        pxor      %xmm3, %xmm0                                  #100.2
        psrldq    $8, %xmm1                                     #100.2
        psllq     $7, %xmm4                                     #100.2
        movdqa    %xmm5, %xmm6                                  #100.2
        psrlq     $59, %xmm1                                    #100.2
        pxor      %xmm4, %xmm0                                  #100.2
        psllq     $9, %xmm6                                     #100.2
        psllq     $59, %xmm1                                    #100.2
        pxor      %xmm6, %xmm0                                  #100.2
        psllq     $12, %xmm5                                    #100.2
        movdqa    %xmm1, %xmm3                                  #100.2
        pxor      %xmm5, %xmm0                                  #100.2
        movdqa    %xmm1, %xmm5                                  #100.2
        psrlq     $59, %xmm5                                    #100.2
        psrlq     $57, %xmm3                                    #100.2
        pxor      %xmm5, %xmm0                                  #100.2
        movdqa    %xmm1, %xmm4                                  #100.2
        pxor      %xmm3, %xmm0                                  #100.2
        psrlq     $55, %xmm4                                    #100.2
        movdqa    %xmm2, -24(%rsp)                              #104.30
        pxor      %xmm4, %xmm0                                  #100.2
        psrlq     $52, %xmm1                                    #100.2
        movq      -24(%rsp), %rax                               #105.9
        pxor      %xmm1, %xmm0                                  #100.2
        andq      -16(%rsp), %rdx                               #106.17
        movdqa    %xmm0, (%rdi)                                 #102.29
        movq      %rax, 16(%rdi)                                #105.2
        movq      %rdx, 24(%rdi)                                #106.2
        ret                                                     #107.1
        .align    16,0x90
..___tag_value_fb_rdcn_low2.39:                                 #
                                # LOE
# mark_end;
	.type	fb_rdcn_low2,@function
	.size	fb_rdcn_low2,.-fb_rdcn_low2
	.data
# -- End  fb_rdcn_low2
	.text
# -- Begin  fb_muln_low
# mark_begin;
       .align    16,0x90
	.globl fb_muln_low
fb_muln_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.10:                         # Preds ..B3.0
..___tag_value_fb_muln_low.40:                                  #109.48
        movdqa    (%rsi), %xmm0                                 #112.34
        movdqa    (%rdx), %xmm1                                 #113.34
        movdqa    %xmm0, %xmm6                                  #115.2
        movdqa    %xmm1, %xmm4                                  #115.2
        movdqa    %xmm0, %xmm3                                  #115.2
        psrldq    $8, %xmm6                                     #115.2
        movdqa    %xmm0, %xmm2                                  #115.2
        psrldq    $8, %xmm4                                     #115.2
        pxor      %xmm0, %xmm6                                  #115.2
        movdqa    16(%rdx), %xmm11                              #120.34
        pxor      %xmm1, %xmm4                                  #115.2
        movdqa    16(%rsi), %xmm10                              #119.34
        movdqa    %xmm11, %xmm7                                 #121.2
        pclmulqdq $0, %xmm1, %xmm3                              #115.2
        movdqa    %xmm10, %xmm9                                 #121.2
        pclmulqdq $17, %xmm1, %xmm2                             #115.2
        pxor      %xmm10, %xmm0                                 #125.8
        pclmulqdq $0, %xmm4, %xmm6                              #115.2
        pxor      %xmm11, %xmm1                                 #126.8
        psrldq    $8, %xmm9                                     #121.2
        pxor      %xmm3, %xmm6                                  #115.2
        psrldq    $8, %xmm7                                     #121.2
        movdqa    %xmm0, %xmm14                                 #128.2
        movdqa    %xmm1, %xmm12                                 #128.2
        pxor      %xmm2, %xmm6                                  #115.2
        psrldq    $8, %xmm14                                    #128.2
        pxor      %xmm10, %xmm9                                 #121.2
        psrldq    $8, %xmm12                                    #128.2
        pxor      %xmm11, %xmm7                                 #121.2
        pclmulqdq $0, %xmm7, %xmm9                              #121.2
        movdqa    %xmm6, %xmm5                                  #115.2
        movdqa    %xmm0, %xmm7                                  #128.2
        pxor      %xmm0, %xmm14                                 #128.2
        pxor      %xmm1, %xmm12                                 #128.2
        movdqa    %xmm10, %xmm4                                 #121.2
        pslldq    $8, %xmm5                                     #115.2
        movdqa    %xmm0, %xmm15                                 #128.2
        pclmulqdq $0, %xmm1, %xmm7                              #128.2
        pxor      %xmm5, %xmm3                                  #115.2
        pclmulqdq $0, %xmm12, %xmm14                            #128.2
        movdqa    %xmm10, %xmm5                                 #121.2
        pclmulqdq $0, %xmm11, %xmm4                             #121.2
        pxor      %xmm7, %xmm14                                 #128.2
        pclmulqdq $17, %xmm1, %xmm15                            #128.2
        pxor      %xmm4, %xmm9                                  #121.2
        pclmulqdq $17, %xmm11, %xmm5                            #121.2
        pxor      %xmm15, %xmm14                                #128.2
        pxor      %xmm5, %xmm9                                  #121.2
        movdqa    %xmm14, %xmm13                                #128.2
        psrldq    $8, %xmm6                                     #115.2
        movdqa    %xmm9, %xmm8                                  #121.2
        pslldq    $8, %xmm13                                    #128.2
        pxor      %xmm6, %xmm2                                  #115.2
        psrldq    $8, %xmm14                                    #128.2
        pxor      %xmm13, %xmm7                                 #128.2
        pslldq    $8, %xmm8                                     #121.2
        pxor      %xmm14, %xmm15                                #128.2
        psrldq    $8, %xmm9                                     #121.2
        pxor      %xmm8, %xmm4                                  #121.2
        pxor      %xmm9, %xmm5                                  #121.2
        pxor      %xmm3, %xmm7                                  #132.7
        pxor      %xmm2, %xmm15                                 #133.7
        pxor      %xmm4, %xmm7                                  #134.7
        pxor      %xmm5, %xmm15                                 #135.7
        pxor      %xmm2, %xmm7                                  #137.7
        pxor      %xmm15, %xmm4                                 #138.7
        movdqa    %xmm3, (%rdi)                                 #140.30
        movdqa    %xmm7, 16(%rdi)                               #141.30
        movdqa    %xmm4, 32(%rdi)                               #142.30
        movdqa    %xmm5, 48(%rdi)                               #143.30
        ret                                                     #145.1
        .align    16,0x90
..___tag_value_fb_muln_low.42:                                  #
                                # LOE
# mark_end;
	.type	fb_muln_low,@function
	.size	fb_muln_low,.-fb_muln_low
	.data
# -- End  fb_muln_low
	.text
# -- Begin  fb_mulm_low
# mark_begin;
       .align    16,0x90
	.globl fb_mulm_low
fb_mulm_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B4.10:                         # Preds ..B4.0
..___tag_value_fb_mulm_low.43:                                  #269.48
        movq      $0x7ffffffffffffff, %rcx                      #306.17
        movdqa    16(%rsi), %xmm3                               #279.34
        movdqa    16(%rdx), %xmm2                               #280.34
        movdqa    %xmm3, %xmm1                                  #281.2
        movdqa    %xmm2, %xmm0                                  #281.2
        movdqa    %xmm3, %xmm9                                  #281.2
        psrldq    $8, %xmm1                                     #281.2
        movdqa    %xmm3, %xmm7                                  #281.2
        psrldq    $8, %xmm0                                     #281.2
        pxor      %xmm3, %xmm1                                  #281.2
        movdqa    (%rsi), %xmm10                                #272.34
        pxor      %xmm2, %xmm0                                  #281.2
        pclmulqdq $0, %xmm2, %xmm9                              #281.2
        movdqa    %xmm10, %xmm15                                #275.2
        pclmulqdq $0, %xmm0, %xmm1                              #281.2
        movdqa    %xmm10, %xmm12                                #275.2
        movdqa    (%rdx), %xmm8                                 #273.34
        pxor      %xmm9, %xmm1                                  #281.2
        psrldq    $8, %xmm15                                    #275.2
        movdqa    %xmm10, %xmm11                                #275.2
        pclmulqdq $17, %xmm2, %xmm7                             #281.2
        pxor      %xmm10, %xmm15                                #275.2
        movdqa    %xmm8, %xmm13                                 #275.2
        pxor      %xmm7, %xmm1                                  #281.2
        pxor      %xmm3, %xmm10                                 #285.8
        movdqa    %xmm1, %xmm6                                  #281.2
        psrldq    $8, %xmm13                                    #275.2
        movdqa    %xmm10, %xmm5                                 #288.2
        pclmulqdq $0, %xmm8, %xmm12                             #275.2
        pxor      %xmm8, %xmm13                                 #275.2
        pclmulqdq $17, %xmm8, %xmm11                            #275.2
        pxor      %xmm2, %xmm8                                  #286.8
        pslldq    $8, %xmm6                                     #281.2
        movdqa    %xmm10, %xmm4                                 #288.2
        psrldq    $8, %xmm5                                     #288.2
        pxor      %xmm6, %xmm9                                  #281.2
        movdqa    %xmm10, %xmm6                                 #288.2
        pxor      %xmm10, %xmm5                                 #288.2
        movdqa    %xmm8, %xmm10                                 #288.2
        psrldq    $8, %xmm10                                    #288.2
        pxor      %xmm8, %xmm10                                 #288.2
        pclmulqdq $0, %xmm13, %xmm15                            #275.2
        pclmulqdq $0, %xmm8, %xmm4                              #288.2
        pxor      %xmm12, %xmm15                                #275.2
        pclmulqdq $0, %xmm10, %xmm5                             #288.2
        pxor      %xmm11, %xmm15                                #275.2
        pclmulqdq $17, %xmm8, %xmm6                             #288.2
        pxor      %xmm4, %xmm5                                  #288.2
        pxor      %xmm6, %xmm5                                  #288.2
        movdqa    %xmm15, %xmm14                                #275.2
        psrldq    $8, %xmm1                                     #281.2
        movdqa    %xmm5, %xmm8                                  #288.2
        pslldq    $8, %xmm14                                    #275.2
        pxor      %xmm1, %xmm7                                  #281.2
        psrldq    $8, %xmm15                                    #275.2
        pxor      %xmm14, %xmm12                                #275.2
        psrldq    $8, %xmm8                                     #288.2
        pxor      %xmm15, %xmm11                                #275.2
        pslldq    $8, %xmm5                                     #288.2
        movdqa    %xmm7, %xmm3                                  #302.2
        pxor      %xmm8, %xmm6                                  #288.2
        pxor      %xmm5, %xmm4                                  #288.2
        psrldq    $8, %xmm3                                     #302.2
        movdqa    %xmm7, %xmm2                                  #302.2
        pxor      %xmm11, %xmm6                                 #293.7
        pxor      %xmm12, %xmm4                                 #292.7
        pslldq    $8, %xmm2                                     #302.2
        pxor      %xmm7, %xmm6                                  #295.7
        movdqa    %xmm3, %xmm7                                  #302.2
        pxor      %xmm9, %xmm4                                  #294.7
        pxor      %xmm9, %xmm6                                  #298.7
        psrlq     $59, %xmm7                                    #302.2
        movdqa    %xmm3, %xmm13                                 #302.2
        pxor      %xmm4, %xmm11                                 #297.7
        movdqa    %xmm2, %xmm4                                  #302.2
        pxor      %xmm7, %xmm6                                  #302.2
        psrlq     $57, %xmm13                                   #302.2
        movdqa    %xmm3, %xmm14                                 #302.2
        psrlq     $59, %xmm4                                    #302.2
        movdqa    %xmm2, %xmm5                                  #302.2
        pxor      %xmm13, %xmm6                                 #302.2
        psrlq     $55, %xmm14                                   #302.2
        movdqa    %xmm3, %xmm0                                  #302.2
        movdqa    %xmm2, %xmm7                                  #302.2
        pxor      %xmm4, %xmm11                                 #302.2
        psrlq     $57, %xmm5                                    #302.2
        movdqa    %xmm2, %xmm9                                  #302.2
        pxor      %xmm14, %xmm6                                 #302.2
        psrldq    $8, %xmm7                                     #302.2
        psrlq     $52, %xmm0                                    #302.2
        pxor      %xmm5, %xmm11                                 #302.2
        psrlq     $55, %xmm9                                    #302.2
        pxor      %xmm0, %xmm6                                  #302.2
        pxor      %xmm9, %xmm11                                 #302.2
        psrlq     $52, %xmm2                                    #302.2
        movdqa    %xmm7, %xmm0                                  #302.2
        pxor      %xmm2, %xmm11                                 #302.2
        psllq     $5, %xmm0                                     #302.2
        movdqa    %xmm7, %xmm2                                  #302.2
        pxor      %xmm0, %xmm11                                 #302.2
        psllq     $7, %xmm2                                     #302.2
        movdqa    %xmm7, %xmm4                                  #302.2
        pslldq    $8, %xmm3                                     #302.2
        pxor      %xmm2, %xmm11                                 #302.2
        psllq     $9, %xmm4                                     #302.2
        psllq     $12, %xmm7                                    #302.2
        pxor      %xmm4, %xmm11                                 #302.2
        movdqa    %xmm3, %xmm5                                  #302.2
        pxor      %xmm7, %xmm11                                 #302.2
        psllq     $5, %xmm5                                     #302.2
        movdqa    %xmm3, %xmm8                                  #302.2
        pxor      %xmm5, %xmm11                                 #302.2
        psllq     $7, %xmm8                                     #302.2
        movdqa    %xmm3, %xmm10                                 #302.2
        pxor      %xmm8, %xmm11                                 #302.2
        psllq     $9, %xmm10                                    #302.2
        movdqa    %xmm6, %xmm1                                  #302.2
        pxor      %xmm10, %xmm11                                #302.2
        psrldq    $8, %xmm6                                     #302.2
        psllq     $12, %xmm3                                    #302.2
        pslldq    $8, %xmm1                                     #302.2
        pxor      %xmm3, %xmm11                                 #302.2
        movdqa    %xmm6, %xmm3                                  #302.2
        movdqa    %xmm1, %xmm2                                  #302.2
        psrlq     $59, %xmm3                                    #302.2
        psrlq     $59, %xmm2                                    #302.2
        pxor      %xmm3, %xmm11                                 #302.2
        movdqa    %xmm1, %xmm3                                  #302.2
        pxor      %xmm2, %xmm12                                 #302.2
        psrlq     $57, %xmm3                                    #302.2
        movdqa    %xmm1, %xmm4                                  #302.2
        movdqa    %xmm1, %xmm5                                  #302.2
        pxor      %xmm3, %xmm12                                 #302.2
        psrlq     $55, %xmm4                                    #302.2
        psrldq    $8, %xmm5                                     #302.2
        pxor      %xmm4, %xmm12                                 #302.2
        psrlq     $52, %xmm1                                    #302.2
        movdqa    %xmm6, %xmm13                                 #302.2
        pxor      %xmm1, %xmm12                                 #302.2
        movdqa    %xmm5, %xmm1                                  #302.2
        psrlq     $57, %xmm13                                   #302.2
        movdqa    %xmm6, %xmm14                                 #302.2
        psllq     $5, %xmm1                                     #302.2
        movdqa    %xmm5, %xmm2                                  #302.2
        pxor      %xmm13, %xmm11                                #302.2
        psrlq     $55, %xmm14                                   #302.2
        movdqa    %xmm6, %xmm15                                 #302.2
        pxor      %xmm1, %xmm12                                 #302.2
        psllq     $7, %xmm2                                     #302.2
        movdqa    %xmm5, %xmm3                                  #302.2
        pslldq    $8, %xmm6                                     #302.2
        pxor      %xmm14, %xmm11                                #302.2
        psrlq     $52, %xmm15                                   #302.2
        pxor      %xmm2, %xmm12                                 #302.2
        psllq     $9, %xmm3                                     #302.2
        pxor      %xmm15, %xmm11                                #302.2
        pxor      %xmm3, %xmm12                                 #302.2
        psllq     $12, %xmm5                                    #302.2
        movdqa    %xmm6, %xmm4                                  #302.2
        movdqa    %xmm11, %xmm0                                 #302.2
        pxor      %xmm5, %xmm12                                 #302.2
        psllq     $5, %xmm4                                     #302.2
        movdqa    %xmm6, %xmm7                                  #302.2
        pxor      %xmm4, %xmm12                                 #302.2
        psrldq    $8, %xmm0                                     #302.2
        psllq     $7, %xmm7                                     #302.2
        movdqa    %xmm6, %xmm8                                  #302.2
        psrlq     $59, %xmm0                                    #302.2
        pxor      %xmm7, %xmm12                                 #302.2
        psllq     $9, %xmm8                                     #302.2
        psllq     $59, %xmm0                                    #302.2
        pxor      %xmm8, %xmm12                                 #302.2
        psllq     $12, %xmm6                                    #302.2
        movdqa    %xmm0, %xmm1                                  #302.2
        pxor      %xmm6, %xmm12                                 #302.2
        movdqa    %xmm0, %xmm6                                  #302.2
        psrlq     $59, %xmm6                                    #302.2
        psrlq     $57, %xmm1                                    #302.2
        pxor      %xmm6, %xmm12                                 #302.2
        movdqa    %xmm0, %xmm2                                  #302.2
        pxor      %xmm1, %xmm12                                 #302.2
        psrlq     $55, %xmm2                                    #302.2
        movdqa    %xmm11, -24(%rsp)                             #304.30
        pxor      %xmm2, %xmm12                                 #302.2
        psrlq     $52, %xmm0                                    #302.2
        movq      -24(%rsp), %rax                               #305.9
        pxor      %xmm0, %xmm12                                 #302.2
        andq      -16(%rsp), %rcx                               #306.17
        movdqa    %xmm12, (%rdi)                                #303.30
        movq      %rax, 16(%rdi)                                #305.2
        movq      %rcx, 24(%rdi)                                #306.2
        ret                                                     #307.2
        .align    16,0x90
..___tag_value_fb_mulm_low.45:                                  #
                                # LOE
# mark_end;
	.type	fb_mulm_low,@function
	.size	fb_mulm_low,.-fb_mulm_low
	.data
# -- End  fb_mulm_low
	.text
# -- Begin  fb_mul1_low
# mark_begin;
       .align    16,0x90
	.globl fb_mul1_low
fb_mul1_low:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B5.1:                         # Preds ..B5.0
..___tag_value_fb_mul1_low.46:                                  #313.51
        movdqa    (%rsi), %xmm5                                 #317.33
        pxor      %xmm0, %xmm0                                  #318.7
        movdqa    %xmm5, %xmm6                                  #320.2
        movdqa    16(%rsi), %xmm4                               #324.33
        movd      %edx, %xmm2                                   #318.7
        movdqa    %xmm4, %xmm3                                  #325.2
        punpckldq %xmm0, %xmm2                                  #318.7
        punpcklqdq %xmm0, %xmm2                                 #318.7
        pclmulqdq $1, %xmm2, %xmm6                              #320.2
        pclmulqdq $1, %xmm2, %xmm3                              #325.2
        movdqa    %xmm6, %xmm1                                  #320.2
        pclmulqdq $0, %xmm2, %xmm4                              #325.2
        movdqa    %xmm3, %xmm7                                  #325.2
        pslldq    $8, %xmm3                                     #325.2
        pclmulqdq $0, %xmm2, %xmm5                              #320.2
        pxor      %xmm3, %xmm4                                  #325.2
        pslldq    $8, %xmm1                                     #320.2
        psrldq    $8, %xmm6                                     #320.2
        pxor      %xmm1, %xmm5                                  #320.2
        psrldq    $8, %xmm7                                     #325.2
        pxor      %xmm4, %xmm6                                  #326.7
        movdqa    %xmm5, (%rdi)                                 #329.30
        movdqa    %xmm6, 16(%rdi)                               #330.30
        movdqa    %xmm7, 32(%rdi)                               #331.30
        ret                                                     #332.1
        .align    16,0x90
..___tag_value_fb_mul1_low.48:                                  #
                                # LOE
# mark_end;
	.type	fb_mul1_low,@function
	.size	fb_mul1_low,.-fb_mul1_low
	.data
# -- End  fb_mul1_low
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg2:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x000000bc
	.4byte 0x0000001c
	.8byte ..___tag_value_fb_muld_low.1
	.8byte ..___tag_value_fb_muld_low.36-..___tag_value_fb_muld_low.1
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.3-..___tag_value_fb_muld_low.1
	.4byte 0x070c028c
	.2byte 0x0410
	.4byte ..___tag_value_fb_muld_low.5-..___tag_value_fb_muld_low.3
	.4byte 0x070c038d
	.2byte 0x0418
	.4byte ..___tag_value_fb_muld_low.7-..___tag_value_fb_muld_low.5
	.4byte 0x070c048e
	.2byte 0x0420
	.4byte ..___tag_value_fb_muld_low.9-..___tag_value_fb_muld_low.7
	.4byte 0x070c058f
	.2byte 0x0428
	.4byte ..___tag_value_fb_muld_low.11-..___tag_value_fb_muld_low.9
	.4byte 0x070c0683
	.2byte 0x0430
	.4byte ..___tag_value_fb_muld_low.13-..___tag_value_fb_muld_low.11
	.4byte 0x070c0786
	.2byte 0x0438
	.4byte ..___tag_value_fb_muld_low.15-..___tag_value_fb_muld_low.13
	.4byte 0x08d0070c
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.16-..___tag_value_fb_muld_low.15
	.4byte 0x0938070c
	.2byte 0x0606
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.18-..___tag_value_fb_muld_low.16
	.4byte 0x0930070c
	.2byte 0x0303
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.20-..___tag_value_fb_muld_low.18
	.4byte 0x0928070c
	.2byte 0x0f0f
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.22-..___tag_value_fb_muld_low.20
	.4byte 0x0920070c
	.2byte 0x0e0e
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.24-..___tag_value_fb_muld_low.22
	.4byte 0x0918070c
	.2byte 0x0d0d
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.26-..___tag_value_fb_muld_low.24
	.4byte 0x0910070c
	.2byte 0x0c0c
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.28-..___tag_value_fb_muld_low.26
	.4byte 0x0408070c
	.4byte ..___tag_value_fb_muld_low.29-..___tag_value_fb_muld_low.28
	.8byte 0x0786068308d0070c
	.8byte 0x058f048e038d028c
	.4byte 0x00000000
	.4byte 0x00000014
	.4byte 0x000000dc
	.8byte ..___tag_value_fb_rdcn_low2.37
	.8byte ..___tag_value_fb_rdcn_low2.39-..___tag_value_fb_rdcn_low2.37
	.4byte 0x00000014
	.4byte 0x000000f4
	.8byte ..___tag_value_fb_muln_low.40
	.8byte ..___tag_value_fb_muln_low.42-..___tag_value_fb_muln_low.40
	.4byte 0x00000014
	.4byte 0x0000010c
	.8byte ..___tag_value_fb_mulm_low.43
	.8byte ..___tag_value_fb_mulm_low.45-..___tag_value_fb_mulm_low.43
	.4byte 0x00000014
	.4byte 0x00000124
	.8byte ..___tag_value_fb_mul1_low.46
	.8byte ..___tag_value_fb_mul1_low.48-..___tag_value_fb_mul1_low.46
# End
