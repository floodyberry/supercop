# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.0.084 Build 2010100";
# mark_description "6";
# mark_description "-I/home/dfaranha/projects/relic-targets/target-icc/include -I/home/dfaranha/projects/relic-toolkit/include -";
# mark_description "I/home/dfaranha/projects/relic-toolkit/include/low -D_GNU_SOURCE -pipe -std=c99 -Wall -O3 -xAVX -S -o CMakeF";
# mark_description "iles/relic_s.dir/low/corei7-251/relic_fb_mul_low.c.o -c";
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
..B1.1b:                         # Preds ..B1.0
..___tag_value_fb_muld_low.1:                                   #45.58
        pushq     %rbp                                          #45.58
..___tag_value_fb_muld_low.3:                                   #
        movq      %rsp, %rbp                                    #45.58
..___tag_value_fb_muld_low.4:                                   #
        andq      $-32, %rsp                                    #45.58
        pushq     %r12                                          #45.58
..___tag_value_fb_muld_low.6:                                   #
        pushq     %r13                                          #45.58
..___tag_value_fb_muld_low.7:                                   #
        pushq     %r14                                          #45.58
..___tag_value_fb_muld_low.8:                                   #
        pushq     %r15                                          #45.58
..___tag_value_fb_muld_low.9:                                   #
        pushq     %rbx                                          #45.58
..___tag_value_fb_muld_low.10:                                  #
        subq      $1080, %rsp                                   #45.58
        movl      %ecx, %r13d                                   #45.58
        movq      %rdx, %r15                                    #45.58
        movq      %rsi, %r12                                    #45.58
        movq      %rdi, %r14                                    #45.58
        movl      $1008, %eax                                   #46.17
        vpxor     %xmm0, %xmm0, %xmm0                           #46.17
                                # LOE rax r12 r14 r15 r13d xmm0
..B1.42:                        # Preds ..B1.42 ..B1.1
        vmovups   %xmm0, (%rsp,%rax)                            #46.17
        vmovups   %xmm0, -16(%rsp,%rax)                         #46.17
        vmovups   %xmm0, -32(%rsp,%rax)                         #46.17
        vmovups   %xmm0, -48(%rsp,%rax)                         #46.17
        vmovups   %xmm0, -64(%rsp,%rax)                         #46.17
        vmovups   %xmm0, -80(%rsp,%rax)                         #46.17
        vmovups   %xmm0, -96(%rsp,%rax)                         #46.17
        subq      $112, %rax                                    #46.17
        jne       ..B1.42       # Prob 88%                      #46.17
                                # LOE rax r12 r14 r15 r13d xmm0
..B1.41:                        # Preds ..B1.42
        vmovups   %xmm0, (%rsp)                                 #46.17
                                # LOE r12 r14 r15 r13d xmm0
..B1.2b:                         # Preds ..B1.41
        movq      %r14, %rdi                                    #50.2
        lea       (%r13,%r13), %ebx                             #50.17
        movl      %ebx, %esi                                    #50.2
        call      dv_zero                                       #50.2
                                # LOE r12 r14 r15 ebx r13d
..B1.3b:                         # Preds ..B1.2
        xorl      %ecx, %ecx                                    #52.7
        lea       1(%r13), %edx                                 #54.28
        movl      %ebx, 1032(%rsp)                              #54.11
        lea       (%rsp), %rax                                  #54.11
        movq      %r15, 1024(%rsp)                              #54.11
        movq      %rax, %rbx                                    #54.11
        movl      %r13d, 1056(%rsp)                             #54.11
        movl      %edx, %r13d                                   #54.11
        vpxor     %xmm0, %xmm0, %xmm0                           #
        movq      %rcx, %r15                                    #54.11
                                # LOE rbx r12 r14 r15 r13d
..B1.4:                         # Preds ..B1.5 ..B1.3
        movq      %rbx, %rdi                                    #54.3
        movl      %r13d, %esi                                   #54.3
        call      dv_zero                                       #54.3
                                # LOE rbx r12 r14 r15 r13d
..B1.5:                         # Preds ..B1.4
        incq      %r15                                          #52.22
        addq      $64, %rbx                                     #52.22
        cmpq      $16, %r15                                     #52.18
        jl        ..B1.4        # Prob 93%                      #52.18
                                # LOE rbx r12 r14 r15 r13d
..B1.6:                         # Preds ..B1.5
        movl      %r13d, %edx                                   #
        xorl      %r9d, %r9d                                    #57.2
        movl      1056(%rsp), %r13d                             #
        vpxor     %xmm0, %xmm0, %xmm0                           #
        movl      1032(%rsp), %ebx                              #
        testl     %r13d, %r13d                                  #58.18
        movq      1024(%rsp), %r15                              #
        jle       ..B1.19       # Prob 50%                      #58.18
                                # LOE rbx r9 r12 r13 r14 r15 edx ebx r13d bl r13b bh xmm0
..B1.7:                         # Preds ..B1.6
        movslq    %r13d, %rax                                   #58.2
        lea       (%rsp), %rdi                                  #58.2
        andq      $31, %rdi                                     #58.2
        movl      %edi, %esi                                    #58.2
        negl      %esi                                          #58.2
        addl      $32, %esi                                     #58.2
        shrl      $3, %esi                                      #58.2
        testl     %edi, %edi                                    #58.2
        cmovne    %esi, %edi                                    #58.2
        movl      %edi, %esi                                    #58.2
        lea       8(%rsi), %rcx                                 #58.2
        cmpq      %rcx, %rax                                    #58.2
        jl        ..B1.38       # Prob 10%                      #58.2
                                # LOE rax rbx rsi r9 r12 r13 r14 r15 edx ebx edi r13d bl r13b bh xmm0
..B1.8:                         # Preds ..B1.7
        negl      %edi                                          #58.2
        xorl      %ecx, %ecx                                    #58.2
        addl      %r13d, %edi                                   #58.2
        andl      $7, %edi                                      #58.2
        negl      %edi                                          #58.2
        addl      %r13d, %edi                                   #58.2
        movslq    %edi, %rdi                                    #58.2
        testq     %rsi, %rsi                                    #58.2
        jbe       ..B1.13       # Prob 10%                      #58.2
                                # LOE rax rcx rbx rsi rdi r9 r12 r13 r14 r15 edx ebx r13d bl r13b bh xmm0
..B1.10:                        # Preds ..B1.8 ..B1.10
        movq      $0, (%rsp,%rcx,8)                             #63.3
        incq      %rcx                                          #58.2
        cmpq      %rsi, %rcx                                    #58.2
        jb        ..B1.10       # Prob 87%                      #58.2
                                # LOE rax rcx rsi rdi r9 r12 r14 r15 edx ebx r13d xmm0
..B1.13:                        # Preds ..B1.8 ..B1.10 ..B1.13
        vmovdqu   %xmm0, (%rsp,%rsi,8)                          #63.3
        vmovdqu   %xmm0, 16(%rsp,%rsi,8)                        #63.3
        vmovdqu   %xmm0, 32(%rsp,%rsi,8)                        #63.3
        vmovdqu   %xmm0, 48(%rsp,%rsi,8)                        #63.3
        addq      $8, %rsi                                      #58.2
        cmpq      %rdi, %rsi                                    #58.2
        jb        ..B1.13       # Prob 87%                      #58.2
                                # LOE rax rsi rdi r9 r12 r14 r15 edx ebx r13d xmm0
..B1.15:                        # Preds ..B1.13 ..B1.38
        cmpq      %rax, %rdi                                    #58.2
        jae       ..B1.45       # Prob 10%                      #58.2
                                # LOE rax rdi r9 r12 r14 r15 edx ebx r13d
..B1.17:                        # Preds ..B1.15 ..B1.17
        movq      $0, (%rsp,%rdi,8)                             #63.3
        incq      %rdi                                          #58.2
        cmpq      %rax, %rdi                                    #58.2
        jb        ..B1.17       # Prob 87%                      #58.2
                                # LOE rax rdi r9 r12 r14 r15 edx ebx r13d
..B1.18:                        # Preds ..B1.17
        testl     %r13d, %r13d                                  #58.18
                                # LOE r9 r12 r14 r15 edx ebx r13d
..B1.19:                        # Preds ..B1.6 ..B1.45 ..B1.18
        movl      $0, %esi                                      #58.2
        jle       ..B1.24       # Prob 10%                      #58.18
                                # LOE rsi r9 r12 r14 r15 edx ebx r13d
..B1.20:                        # Preds ..B1.19
        movslq    %r13d, %r8                                    #58.2
        movl      %edx, 1024(%rsp)                              #58.2
        movl      %ebx, 1032(%rsp)                              #58.2
        movl      %r13d, 1056(%rsp)                             #58.2
                                # LOE rsi r8 r9 r12 r14 r15
..B1.21:                        # Preds ..B1.21 ..B1.20
        movq      (%r15,%rsi,8), %rdi                           #45.6
        movq      %r9, %rbx                                     #60.26
        movq      %r9, %r10                                     #61.26
        movq      %rdi, %r11                                    #66.22
        shrq      $63, %rbx                                     #60.26
        movq      %rdi, %r13                                    #68.22
        shrq      $62, %r10                                     #61.26
        lea       (%rdi,%rdi), %rcx                             #60.15
        orq       %rbx, %rcx                                    #60.26
        lea       (,%rdi,4), %rdx                               #61.15
        orq       %r10, %rdx                                    #61.26
        lea       (,%rdi,8), %rax                               #62.15
        shrq      $61, %r9                                      #62.26
        xorq      %rcx, %r11                                    #66.22
        movq      %rcx, %rbx                                    #69.22
        movq      %rdx, %r10                                    #70.27
        orq       %r9, %rax                                     #62.26
        xorq      %rdx, %r13                                    #68.22
        xorq      %rdx, %rbx                                    #69.22
        xorq      %r11, %r10                                    #70.27
        movq      %rdi, %r9                                     #72.22
        movq      %rcx, 128(%rsp,%rsi,8)                        #65.3
        xorq      %rax, %r9                                     #72.22
        movq      %r11, 192(%rsp,%rsi,8)                        #66.3
        xorq      %rax, %rcx                                    #73.23
        movq      %rdx, 256(%rsp,%rsi,8)                        #67.3
        xorq      %rax, %r11                                    #74.28
        movq      %r13, 320(%rsp,%rsi,8)                        #68.3
        xorq      %rax, %rdx                                    #75.23
        movq      %rbx, 384(%rsp,%rsi,8)                        #69.3
        xorq      %rax, %r13                                    #76.28
        movq      %rax, 512(%rsp,%rsi,8)                        #71.3
        xorq      %rax, %rbx                                    #77.28
        xorq      %r10, %rax                                    #78.33
        movq      %rdi, 64(%rsp,%rsi,8)                         #64.3
        movq      %r10, 448(%rsp,%rsi,8)                        #70.3
        movq      %r9, 576(%rsp,%rsi,8)                         #72.3
        movq      %rdi, %r9                                     #79.3
        movq      %rcx, 640(%rsp,%rsi,8)                        #73.3
        movq      %r11, 704(%rsp,%rsi,8)                        #74.3
        movq      %rdx, 768(%rsp,%rsi,8)                        #75.3
        movq      %r13, 832(%rsp,%rsi,8)                        #76.3
        movq      %rbx, 896(%rsp,%rsi,8)                        #77.3
        movq      %rax, 960(%rsp,%rsi,8)                        #78.3
        incq      %rsi                                          #58.2
        cmpq      %r8, %rsi                                     #58.2
        jb        ..B1.21       # Prob 87%                      #58.2
                                # LOE rsi rdi r8 r9 r12 r14 r15
..B1.22:                        # Preds ..B1.21
        movl      1024(%rsp), %edx                              #
        testq     %rdi, %rdi                                    #82.10
        movl      1032(%rsp), %ebx                              #
        movl      1056(%rsp), %r13d                             #
        jbe       ..B1.44       # Prob 50%                      #82.10
                                # LOE rdx rbx rdi r8 r12 r13 r14 edx ebx r13d dl bl r13b dh bh
..B1.23:                        # Preds ..B1.22
        movq      %rdi, %rcx                                    #83.13
        movq      %rdi, %rsi                                    #84.13
        shrq      $63, %rcx                                     #83.13
        xorl      %eax, %eax                                    #86.20
        shrq      $62, %rsi                                     #84.13
        movq      %rcx, %r9                                     #89.42
        shrq      $61, %rdi                                     #85.13
        xorq      %rsi, %r9                                     #89.42
        movq      %rcx, 192(%rsp,%r8,8)                         #87.20
        movq      %rcx, 128(%rsp,%r8,8)                         #87.3
        xorq      %rdi, %rcx                                    #91.44
        movq      %rsi, 320(%rsp,%r8,8)                         #88.20
        movq      %rsi, 256(%rsp,%r8,8)                         #88.3
        xorq      %rdi, %rsi                                    #92.44
        movq      %rdi, 576(%rsp,%r8,8)                         #90.20
        movq      %rdi, 512(%rsp,%r8,8)                         #90.3
        xorq      %r9, %rdi                                     #93.49
        movq      %rax, 64(%rsp,%r8,8)                          #86.20
        testl     %r13d, %r13d                                  #93.3
        movq      %rax, (%rsp,%r8,8)                            #86.3
        movq      %r9, 448(%rsp,%r8,8)                          #89.20
        movq      %r9, 384(%rsp,%r8,8)                          #89.3
        movq      %rcx, 704(%rsp,%r8,8)                         #91.21
        movq      %rcx, 640(%rsp,%r8,8)                         #91.3
        movq      %rsi, 832(%rsp,%r8,8)                         #92.21
        movq      %rsi, 768(%rsp,%r8,8)                         #92.3
        movq      %rdi, 960(%rsp,%r8,8)                         #93.21
        movq      %rdi, 896(%rsp,%r8,8)                         #93.3
        jmp       ..B1.24       # Prob 100%                     #93.3
                                # LOE r12 r14 edx ebx r13d
..B1.44:                        # Preds ..B1.22
        testl     %r13d, %r13d                                  #58.18
                                # LOE r12 r14 edx ebx r13d
..B1.24:                        # Preds ..B1.19 ..B1.44 ..B1.23
        movl      %edx, 1024(%rsp)                              #96.7
        movl      $60, %r15d                                    #96.7
                                # LOE r12 r14 ebx r13d r15d
..B1.25:                        # Preds ..B1.43 ..B1.24
        movq      %r12, %rcx                                    #97.3
        movq      %r14, %rdx                                    #98.3
        movl      $0, %eax                                      #99.8
        jle       ..B1.30       # Prob 10%                      #99.19
                                # LOE rdx rcx r12 r14 eax ebx r13d r15d
..B1.26:                        # Preds ..B1.25
        movl      %ebx, 1032(%rsp)                              #
        movq      %r14, 1048(%rsp)                              #
        movq      %rcx, %r14                                    #
        movq      %r12, 1040(%rsp)                              #
        movq      %rdx, %r12                                    #
        movl      %r13d, 1056(%rsp)                             #
        movl      %eax, %r13d                                   #
        movl      1024(%rsp), %ebx                              #
                                # LOE r12 r14 ebx r13d r15d
..B1.27:                        # Preds ..B1.28 ..B1.26
        movl      %r15d, %ecx                                   #100.18
        lea       (%rsp), %r8                                   #101.4
        movq      (%r14), %rdx                                  #100.10
        movq      %r12, %rdi                                    #101.4
        shrq      %cl, %rdx                                     #100.18
        movq      %r12, %rsi                                    #101.4
        andq      $15, %rdx                                     #100.23
        movl      %ebx, %ecx                                    #101.4
        shlq      $6, %rdx                                      #101.28
        addq      %r8, %rdx                                     #101.4
        call      fb_addd_low                                   #101.4
                                # LOE r12 r14 ebx r13d r15d
..B1.28:                        # Preds ..B1.27
        incl      %r13d                                         #99.25
        addq      $8, %r14                                      #99.30
        addq      $8, %r12                                      #99.38
        cmpl      1056(%rsp), %r13d                             #99.19
        jl        ..B1.27       # Prob 82%                      #99.19
                                # LOE r12 r14 ebx r13d r15d
..B1.29:                        # Preds ..B1.28
        movq      1048(%rsp), %r14                              #
        movq      1040(%rsp), %r12                              #
        movl      1032(%rsp), %ebx                              #
        movl      1056(%rsp), %r13d                             #
                                # LOE r12 r14 ebx r13d r15d
..B1.30:                        # Preds ..B1.29 ..B1.25
        movq      %r14, %rdi                                    #103.3
        movq      %r14, %rsi                                    #103.3
        movl      %ebx, %edx                                    #103.3
        movl      $4, %ecx                                      #103.3
        call      bn_lshb_low                                   #103.3
                                # LOE r12 r14 ebx r13d r15d
..B1.31:                        # Preds ..B1.30
        addl      $-4, %r15d                                    #96.32
        jle       ..B1.32       # Prob 7%                       #96.29
                                # LOE r12 r14 ebx r13d r15d
..B1.43:                        # Preds ..B1.31
        testl     %r13d, %r13d                                  #58.18
        jmp       ..B1.25       # Prob 100%                     #58.18
                                # LOE r12 r14 ebx r13d r15d
..B1.32:                        # Preds ..B1.31
        movl      1024(%rsp), %edx                              #
        xorl      %ebx, %ebx                                    #105.7
        testl     %r13d, %r13d                                  #105.18
        jle       ..B1.37       # Prob 10%                      #105.18
                                # LOE rdx r12 r14 edx ebx r13d dl dh
..B1.33:                        # Preds ..B1.32
        movl      %r13d, %r15d                                  #
        movl      %edx, %r13d                                   #
                                # LOE r12 r14 ebx r13d r15d
..B1.34:                        # Preds ..B1.35 ..B1.33
        movq      (%r12), %rdx                                  #106.8
        lea       (%rsp), %rax                                  #107.3
        andq      $15, %rdx                                     #106.12
        movq      %r14, %rdi                                    #107.3
        shlq      $6, %rdx                                      #107.21
        movq      %r14, %rsi                                    #107.3
        addq      %rax, %rdx                                    #107.3
        movl      %r13d, %ecx                                   #107.3
        call      fb_addd_low                                   #107.3
                                # LOE r12 r14 ebx r13d r15d
..B1.35:                        # Preds ..B1.34
        incl      %ebx                                          #105.24
        addq      $8, %r12                                      #105.29
        addq      $8, %r14                                      #105.34
        cmpl      %r15d, %ebx                                   #105.18
        jl        ..B1.34       # Prob 82%                      #105.18
                                # LOE r12 r14 ebx r13d r15d
..B1.37:                        # Preds ..B1.35 ..B1.32
        addq      $1080, %rsp                                   #112.1
..___tag_value_fb_muld_low.11:                                  #112.1
        popq      %rbx                                          #112.1
..___tag_value_fb_muld_low.12:                                  #112.1
        popq      %r15                                          #112.1
..___tag_value_fb_muld_low.13:                                  #112.1
        popq      %r14                                          #112.1
..___tag_value_fb_muld_low.14:                                  #112.1
        popq      %r13                                          #112.1
..___tag_value_fb_muld_low.15:                                  #112.1
        popq      %r12                                          #112.1
        movq      %rbp, %rsp                                    #112.1
        popq      %rbp                                          #112.1
..___tag_value_fb_muld_low.16:                                  #
        ret                                                     #112.1
..___tag_value_fb_muld_low.18:                                  #
                                # LOE
..B1.38:                        # Preds ..B1.7                  # Infreq
        xorl      %edi, %edi                                    #58.2
        jmp       ..B1.15       # Prob 100%                     #58.2
                                # LOE rax rdi r9 r12 r14 r15 edx ebx r13d
..B1.45:                        # Preds ..B1.15                 # Infreq
        testl     %r13d, %r13d                                  #58.18
        jmp       ..B1.19       # Prob 100%                     #58.18
        .align    16,0x90
..___tag_value_fb_muld_low.25:                                  #
                                # LOE r9 r12 r14 r15 edx ebx r13d
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
..B2.1b:                         # Preds ..B2.0
..___tag_value_fb_rdcn_low2.26:                                 #92.39
        movq      $0x7ffffffffffffff, %rdx                      #106.17
        vmovdqu   48(%rsi), %xmm9                               #98.34
        vpslldq   $8, %xmm9, %xmm8                              #100.2
        vpsrldq   $8, %xmm9, %xmm0                              #100.2
        vpsrlq    $59, %xmm8, %xmm2                             #100.2
        vpsrlq    $59, %xmm0, %xmm10                            #100.2
        vpsrlq    $57, %xmm0, %xmm12                            #100.2
        vpxor     32(%rsi), %xmm10, %xmm11                      #100.2
        vpsrlq    $57, %xmm8, %xmm10                            #100.2
        vpxor     16(%rsi), %xmm2, %xmm9                        #100.2
        vpxor     %xmm12, %xmm11, %xmm13                        #100.2
        vpsrlq    $55, %xmm0, %xmm14                            #100.2
        vpxor     %xmm10, %xmm9, %xmm11                         #100.2
        vpsrlq    $55, %xmm8, %xmm12                            #100.2
        vpxor     %xmm14, %xmm13, %xmm15                        #100.2
        vpsrldq   $8, %xmm8, %xmm5                              #100.2
        vpsrlq    $52, %xmm0, %xmm3                             #100.2
        vpxor     %xmm12, %xmm11, %xmm13                        #100.2
        vpsrlq    $52, %xmm8, %xmm8                             #100.2
        vpxor     %xmm3, %xmm15, %xmm1                          #100.2
        vpxor     %xmm8, %xmm13, %xmm14                         #100.2
        vpsllq    $5, %xmm5, %xmm15                             #100.2
        vpsllq    $9, %xmm5, %xmm2                              #100.2
        vpslldq   $8, %xmm0, %xmm4                              #100.2
        vpxor     %xmm15, %xmm14, %xmm3                         #100.2
        vpsllq    $7, %xmm5, %xmm0                              #100.2
        vpsllq    $12, %xmm5, %xmm5                             #100.2
        vpslldq   $8, %xmm1, %xmm7                              #100.2
        vpsrldq   $8, %xmm1, %xmm6                              #100.2
        vpxor     %xmm0, %xmm3, %xmm1                           #100.2
        vpxor     %xmm2, %xmm1, %xmm8                           #100.2
        vpsllq    $5, %xmm4, %xmm0                              #100.2
        vpxor     %xmm5, %xmm8, %xmm3                           #100.2
        vpsllq    $7, %xmm4, %xmm2                              #100.2
        vpxor     %xmm0, %xmm3, %xmm1                           #100.2
        vpsllq    $9, %xmm4, %xmm8                              #100.2
        vpxor     %xmm2, %xmm1, %xmm5                           #100.2
        vpsllq    $12, %xmm4, %xmm4                             #100.2
        vpxor     %xmm8, %xmm5, %xmm9                           #100.2
        vpsrlq    $59, %xmm6, %xmm0                             #100.2
        vpxor     %xmm4, %xmm9, %xmm3                           #100.2
        vpsrlq    $57, %xmm6, %xmm2                             #100.2
        vpxor     %xmm0, %xmm3, %xmm1                           #100.2
        vpsrlq    $55, %xmm6, %xmm5                             #100.2
        vpxor     %xmm2, %xmm1, %xmm4                           #100.2
        vpsrlq    $52, %xmm6, %xmm9                             #100.2
        vpxor     %xmm5, %xmm4, %xmm8                           #100.2
        vpsrlq    $59, %xmm7, %xmm4                             #100.2
        vpxor     %xmm9, %xmm8, %xmm3                           #100.2
        vpsrlq    $55, %xmm7, %xmm9                             #100.2
        vpslldq   $8, %xmm6, %xmm1                              #100.2
        vpsrldq   $8, %xmm3, %xmm6                              #100.2
        vpsllq    $5, %xmm1, %xmm12                             #100.2
        vpxor     (%rsi), %xmm4, %xmm5                          #100.2
        vpsrlq    $59, %xmm6, %xmm0                             #100.2
        vpsrlq    $57, %xmm7, %xmm6                             #100.2
        vpsllq    $7, %xmm1, %xmm14                             #100.2
        vpxor     %xmm6, %xmm5, %xmm8                           #100.2
        vpsllq    $59, %xmm0, %xmm0                             #100.2
        vpsrldq   $8, %xmm7, %xmm2                              #100.2
        vpxor     %xmm9, %xmm8, %xmm10                          #100.2
        vpsrlq    $52, %xmm7, %xmm7                             #100.2
        vpsllq    $5, %xmm2, %xmm5                              #100.2
        vpxor     %xmm7, %xmm10, %xmm4                          #100.2
        vpsllq    $7, %xmm2, %xmm7                              #100.2
        vpxor     %xmm5, %xmm4, %xmm6                           #100.2
        vpsllq    $9, %xmm2, %xmm9                              #100.2
        vpxor     %xmm7, %xmm6, %xmm8                           #100.2
        vpsllq    $12, %xmm2, %xmm2                             #100.2
        vpxor     %xmm9, %xmm8, %xmm10                          #100.2
        vpsrlq    $57, %xmm0, %xmm5                             #100.2
        vpxor     %xmm2, %xmm10, %xmm11                         #100.2
        vpsllq    $9, %xmm1, %xmm2                              #100.2
        vpxor     %xmm12, %xmm11, %xmm13                        #100.2
        vpsllq    $12, %xmm1, %xmm1                             #100.2
        vpxor     %xmm14, %xmm13, %xmm15                        #100.2
        vpsrlq    $55, %xmm0, %xmm7                             #100.2
        vpxor     %xmm2, %xmm15, %xmm4                          #100.2
        vpsrlq    $59, %xmm0, %xmm2                             #100.2
        vpxor     %xmm1, %xmm4, %xmm1                           #100.2
        vpsrlq    $52, %xmm0, %xmm0                             #100.2
        vpxor     %xmm2, %xmm1, %xmm4                           #100.2
        vpxor     %xmm5, %xmm4, %xmm6                           #100.2
        vmovdqu   %xmm3, -24(%rsp)                              #104.30
        vpxor     %xmm7, %xmm6, %xmm8                           #100.2
        movq      -24(%rsp), %rax                               #105.9
        vpxor     %xmm0, %xmm8, %xmm0                           #100.2
        andq      -16(%rsp), %rdx                               #106.17
        vmovdqu   %xmm0, (%rdi)                                 #102.29
        movq      %rax, 16(%rdi)                                #105.2
        movq      %rdx, 24(%rdi)                                #106.2
        ret                                                     #107.1
        .align    16,0x90
..___tag_value_fb_rdcn_low2.28:                                 #
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
..B3.1b:                         # Preds ..B3.0
..___tag_value_fb_muln_low.29:                                  #109.48
        vmovdqu   (%rsi), %xmm9                                 #112.34
        vmovdqu   (%rdx), %xmm8                                 #113.34
        vpsrldq   $8, %xmm9, %xmm10                             #115.2
        vpsrldq   $8, %xmm8, %xmm11                             #115.2
        vpxor     %xmm9, %xmm10, %xmm12                         #115.2
        vpxor     %xmm8, %xmm11, %xmm13                         #115.2
        vpclmulqdq $0, %xmm8, %xmm9, %xmm7                      #115.2
        vpclmulqdq $0, %xmm13, %xmm12, %xmm14                   #115.2
        vmovdqu   16(%rdx), %xmm5                               #120.34
        vpxor     %xmm7, %xmm14, %xmm15                         #115.2
        vpclmulqdq $17, %xmm8, %xmm9, %xmm6                     #115.2
        vpxor     %xmm5, %xmm8, %xmm8                           #126.8
        vmovdqu   16(%rsi), %xmm4                               #119.34
        vpxor     %xmm6, %xmm15, %xmm2                          #115.2
        vpsrldq   $8, %xmm4, %xmm10                             #121.2
        vpsrldq   $8, %xmm5, %xmm11                             #121.2
        vpxor     %xmm4, %xmm10, %xmm12                         #121.2
        vpslldq   $8, %xmm2, %xmm1                              #115.2
        vpxor     %xmm5, %xmm11, %xmm13                         #121.2
        vpclmulqdq $0, %xmm13, %xmm12, %xmm14                   #121.2
        vpxor     %xmm1, %xmm7, %xmm7                           #115.2
        vpclmulqdq $0, %xmm5, %xmm4, %xmm1                      #121.2
        vpsrldq   $8, %xmm2, %xmm0                              #115.2
        vpxor     %xmm1, %xmm14, %xmm15                         #121.2
        vpclmulqdq $17, %xmm5, %xmm4, %xmm3                     #121.2
        vpxor     %xmm0, %xmm6, %xmm6                           #115.2
        vpxor     %xmm3, %xmm15, %xmm0                          #121.2
        vpslldq   $8, %xmm0, %xmm2                              #121.2
        vpsrldq   $8, %xmm0, %xmm10                             #121.2
        vpxor     %xmm2, %xmm1, %xmm2                           #121.2
        vpxor     %xmm10, %xmm3, %xmm1                          #121.2
        vpxor     %xmm4, %xmm9, %xmm3                           #125.8
        vpsrldq   $8, %xmm3, %xmm5                              #128.2
        vpsrldq   $8, %xmm8, %xmm4                              #128.2
        vpxor     %xmm3, %xmm5, %xmm9                           #128.2
        vpclmulqdq $0, %xmm8, %xmm3, %xmm10                     #128.2
        vpclmulqdq $17, %xmm8, %xmm3, %xmm0                     #128.2
        vpxor     %xmm8, %xmm4, %xmm3                           #128.2
        vpclmulqdq $0, %xmm3, %xmm9, %xmm4                      #128.2
        vpxor     %xmm10, %xmm4, %xmm5                          #128.2
        vpxor     %xmm0, %xmm5, %xmm13                          #128.2
        vpslldq   $8, %xmm13, %xmm8                             #128.2
        vpxor     %xmm8, %xmm10, %xmm9                          #128.2
        vpsrldq   $8, %xmm13, %xmm14                            #128.2
        vpxor     %xmm7, %xmm9, %xmm11                          #132.7
        vpxor     %xmm2, %xmm11, %xmm12                         #134.7
        vpxor     %xmm14, %xmm0, %xmm0                          #128.2
        vpxor     %xmm12, %xmm6, %xmm3                          #137.7
        vpxor     %xmm6, %xmm0, %xmm6                           #133.7
        vpxor     %xmm1, %xmm6, %xmm15                          #135.7
        vpxor     %xmm15, %xmm2, %xmm2                          #138.7
        vmovdqu   %xmm7, (%rdi)                                 #140.30
        vmovdqu   %xmm3, 16(%rdi)                               #141.30
        vmovdqu   %xmm2, 32(%rdi)                               #142.30
        vmovdqu   %xmm1, 48(%rdi)                               #143.30
        ret                                                     #145.1
        .align    16,0x90
..___tag_value_fb_muln_low.31:                                  #
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
..B4.1b:                         # Preds ..B4.0
..___tag_value_fb_mulm_low.32:                                  #269.48
        movq      $0x7ffffffffffffff, %rcx                      #306.17
        vmovdqu   (%rsi), %xmm9                                 #272.34
        vmovdqu   (%rdx), %xmm10                                #273.34
        vpsrldq   $8, %xmm9, %xmm2                              #275.2
        vpsrldq   $8, %xmm10, %xmm7                             #275.2
        vpxor     %xmm9, %xmm2, %xmm8                           #275.2
        vpxor     %xmm10, %xmm7, %xmm12                         #275.2
        vpclmulqdq $0, %xmm10, %xmm9, %xmm11                    #275.2
        vpclmulqdq $0, %xmm12, %xmm8, %xmm0                     #275.2
        vmovdqu   16(%rdx), %xmm5                               #280.34
        vpxor     %xmm11, %xmm0, %xmm1                          #275.2
        vpclmulqdq $17, %xmm10, %xmm9, %xmm14                   #275.2
        vpxor     %xmm5, %xmm10, %xmm10                         #286.8
        vmovdqu   16(%rsi), %xmm4                               #279.34
        vpxor     %xmm14, %xmm1, %xmm15                         #275.2
        vpsrldq   $8, %xmm4, %xmm7                              #281.2
        vpsrldq   $8, %xmm5, %xmm8                              #281.2
        vpxor     %xmm4, %xmm7, %xmm12                          #281.2
        vpslldq   $8, %xmm15, %xmm13                            #275.2
        vpxor     %xmm5, %xmm8, %xmm1                           #281.2
        vpsrldq   $8, %xmm15, %xmm6                             #275.2
        vpxor     %xmm13, %xmm11, %xmm2                         #275.2
        vpclmulqdq $0, %xmm5, %xmm4, %xmm15                     #281.2
        vpxor     %xmm6, %xmm14, %xmm0                          #275.2
        vpclmulqdq $0, %xmm1, %xmm12, %xmm11                    #281.2
        vpclmulqdq $17, %xmm5, %xmm4, %xmm3                     #281.2
        vpxor     %xmm15, %xmm11, %xmm13                        #281.2
        vpxor     %xmm3, %xmm13, %xmm6                          #281.2
        vpxor     %xmm4, %xmm9, %xmm4                           #285.8
        vpslldq   $8, %xmm6, %xmm14                             #281.2
        vpsrldq   $8, %xmm6, %xmm7                              #281.2
        vpxor     %xmm14, %xmm15, %xmm1                         #281.2
        vpsrldq   $8, %xmm10, %xmm5                             #288.2
        vpxor     %xmm7, %xmm3, %xmm15                          #281.2
        vpsrldq   $8, %xmm4, %xmm3                              #288.2
        vpxor     %xmm4, %xmm3, %xmm9                           #288.2
        vpxor     %xmm10, %xmm5, %xmm3                          #288.2
        vpclmulqdq $0, %xmm10, %xmm4, %xmm6                     #288.2
        vpclmulqdq $17, %xmm10, %xmm4, %xmm14                   #288.2
        vpclmulqdq $0, %xmm3, %xmm9, %xmm4                      #288.2
        vpxor     %xmm6, %xmm4, %xmm5                           #288.2
        vpxor     %xmm14, %xmm5, %xmm13                         #288.2
        vpsrldq   $8, %xmm13, %xmm10                            #288.2
        vpxor     %xmm10, %xmm14, %xmm9                         #288.2
        vpxor     %xmm0, %xmm9, %xmm7                           #293.7
        vpsrldq   $8, %xmm15, %xmm11                            #302.2
        vpxor     %xmm15, %xmm7, %xmm8                          #295.7
        vpslldq   $8, %xmm15, %xmm12                            #302.2
        vpxor     %xmm8, %xmm1, %xmm14                          #298.7
        vpsrlq    $59, %xmm11, %xmm15                           #302.2
        vpsrlq    $57, %xmm11, %xmm4                            #302.2
        vpxor     %xmm15, %xmm14, %xmm3                         #302.2
        vpsrlq    $55, %xmm11, %xmm10                           #302.2
        vpxor     %xmm4, %xmm3, %xmm5                           #302.2
        vpsrlq    $52, %xmm11, %xmm7                            #302.2
        vpxor     %xmm10, %xmm5, %xmm9                          #302.2
        vpsrlq    $57, %xmm12, %xmm4                            #302.2
        vpxor     %xmm7, %xmm9, %xmm14                          #302.2
        vpslldq   $8, %xmm11, %xmm7                             #302.2
        vpslldq   $8, %xmm13, %xmm11                            #288.2
        vpxor     %xmm11, %xmm6, %xmm6                          #288.2
        vpsrlq    $52, %xmm12, %xmm11                           #302.2
        vpxor     %xmm2, %xmm6, %xmm13                          #292.7
        vpsrlq    $59, %xmm12, %xmm6                            #302.2
        vpxor     %xmm1, %xmm13, %xmm1                          #294.7
        vpxor     %xmm1, %xmm0, %xmm0                           #297.7
        vpxor     %xmm6, %xmm0, %xmm3                           #302.2
        vpsrlq    $55, %xmm12, %xmm0                            #302.2
        vpxor     %xmm4, %xmm3, %xmm5                           #302.2
        vpsrldq   $8, %xmm12, %xmm8                             #302.2
        vpxor     %xmm0, %xmm5, %xmm1                           #302.2
        vpxor     %xmm11, %xmm1, %xmm12                         #302.2
        vpsllq    $5, %xmm8, %xmm13                             #302.2
        vpslldq   $8, %xmm14, %xmm10                            #302.2
        vpsllq    $7, %xmm8, %xmm15                             #302.2
        vpsrldq   $8, %xmm14, %xmm9                             #302.2
        vpxor     %xmm13, %xmm12, %xmm14                        #302.2
        vpxor     %xmm15, %xmm14, %xmm6                         #302.2
        vpsllq    $9, %xmm8, %xmm3                              #302.2
        vpxor     %xmm3, %xmm6, %xmm4                           #302.2
        vpsllq    $12, %xmm8, %xmm8                             #302.2
        vpxor     %xmm8, %xmm4, %xmm6                           #302.2
        vpsllq    $5, %xmm7, %xmm3                              #302.2
        vpxor     %xmm3, %xmm6, %xmm4                           #302.2
        vpsllq    $7, %xmm7, %xmm5                              #302.2
        vpxor     %xmm5, %xmm4, %xmm0                           #302.2
        vpsllq    $9, %xmm7, %xmm1                              #302.2
        vpxor     %xmm1, %xmm0, %xmm8                           #302.2
        vpsllq    $12, %xmm7, %xmm7                             #302.2
        vpxor     %xmm7, %xmm8, %xmm6                           #302.2
        vpsrlq    $59, %xmm9, %xmm3                             #302.2
        vpxor     %xmm3, %xmm6, %xmm4                           #302.2
        vpsrlq    $57, %xmm9, %xmm5                             #302.2
        vpxor     %xmm5, %xmm4, %xmm0                           #302.2
        vpsrlq    $55, %xmm9, %xmm1                             #302.2
        vpxor     %xmm1, %xmm0, %xmm7                           #302.2
        vpsrlq    $59, %xmm10, %xmm0                            #302.2
        vpsrlq    $52, %xmm9, %xmm8                             #302.2
        vpxor     %xmm0, %xmm2, %xmm2                           #302.2
        vpsrlq    $57, %xmm10, %xmm0                            #302.2
        vpxor     %xmm8, %xmm7, %xmm6                           #302.2
        vpxor     %xmm0, %xmm2, %xmm1                           #302.2
        vpsrlq    $55, %xmm10, %xmm2                            #302.2
        vpsrldq   $8, %xmm10, %xmm5                             #302.2
        vpxor     %xmm2, %xmm1, %xmm7                           #302.2
        vpslldq   $8, %xmm9, %xmm4                              #302.2
        vpsrlq    $52, %xmm10, %xmm8                            #302.2
        vpsrldq   $8, %xmm6, %xmm9                              #302.2
        vpsllq    $5, %xmm5, %xmm10                             #302.2
        vpsrlq    $59, %xmm9, %xmm3                             #302.2
        vpxor     %xmm8, %xmm7, %xmm9                           #302.2
        vpxor     %xmm10, %xmm9, %xmm11                         #302.2
        vpsllq    $7, %xmm5, %xmm12                             #302.2
        vpxor     %xmm12, %xmm11, %xmm13                        #302.2
        vpsllq    $9, %xmm5, %xmm14                             #302.2
        vpxor     %xmm14, %xmm13, %xmm15                        #302.2
        vpsllq    $12, %xmm5, %xmm5                             #302.2
        vpxor     %xmm5, %xmm15, %xmm0                          #302.2
        vpsllq    $5, %xmm4, %xmm1                              #302.2
        vpxor     %xmm1, %xmm0, %xmm2                           #302.2
        vpsllq    $7, %xmm4, %xmm5                              #302.2
        vpxor     %xmm5, %xmm2, %xmm7                           #302.2
        vpsllq    $9, %xmm4, %xmm8                              #302.2
        vpsllq    $59, %xmm3, %xmm3                             #302.2
        vpxor     %xmm8, %xmm7, %xmm9                           #302.2
        vpsllq    $12, %xmm4, %xmm4                             #302.2
        vpsrlq    $59, %xmm3, %xmm1                             #302.2
        vpxor     %xmm4, %xmm9, %xmm0                           #302.2
        vpsrlq    $57, %xmm3, %xmm4                             #302.2
        vpxor     %xmm1, %xmm0, %xmm2                           #302.2
        vpsrlq    $55, %xmm3, %xmm7                             #302.2
        vpxor     %xmm4, %xmm2, %xmm5                           #302.2
        vpsrlq    $52, %xmm3, %xmm3                             #302.2
        vmovdqu   %xmm6, -24(%rsp)                              #304.30
        vpxor     %xmm7, %xmm5, %xmm8                           #302.2
        movq      -24(%rsp), %rax                               #305.9
        vpxor     %xmm3, %xmm8, %xmm0                           #302.2
        andq      -16(%rsp), %rcx                               #306.17
        vmovdqu   %xmm0, (%rdi)                                 #303.30
        movq      %rax, 16(%rdi)                                #305.2
        movq      %rcx, 24(%rdi)                                #306.2
        ret                                                     #307.2
        .align    16,0x90
..___tag_value_fb_mulm_low.34:                                  #
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
..___tag_value_fb_mul1_low.35:                                  #313.51
        vmovdqu   16(%rsi), %xmm7                               #324.33
        vpxor     %xmm2, %xmm2, %xmm2                           #318.7
        vmovdqu   (%rsi), %xmm3                                 #317.33
        vmovd     %edx, %xmm0                                   #318.7
        vpunpckldq %xmm2, %xmm0, %xmm1                          #318.7
        vpunpcklqdq %xmm2, %xmm1, %xmm8                         #318.7
        vpclmulqdq $1, %xmm8, %xmm7, %xmm9                      #325.2
        vpclmulqdq $1, %xmm8, %xmm3, %xmm6                      #320.2
        vpclmulqdq $0, %xmm8, %xmm7, %xmm10                     #325.2
        vpslldq   $8, %xmm9, %xmm11                             #325.2
        vpclmulqdq $0, %xmm8, %xmm3, %xmm4                      #320.2
        vpxor     %xmm11, %xmm10, %xmm13                        #325.2
        vpslldq   $8, %xmm6, %xmm5                              #320.2
        vpsrldq   $8, %xmm6, %xmm12                             #320.2
        vpxor     %xmm5, %xmm4, %xmm14                          #320.2
        vpsrldq   $8, %xmm9, %xmm0                              #325.2
        vpxor     %xmm13, %xmm12, %xmm15                        #326.7
        vmovdqu   %xmm14, (%rdi)                                #329.30
        vmovdqu   %xmm15, 16(%rdi)                              #330.30
        vmovdqu   %xmm0, 32(%rdi)                               #331.30
        ret                                                     #332.1
        .align    16,0x90
..___tag_value_fb_mul1_low.37:                                  #
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
	.4byte 0x0000012c
	.4byte 0x0000001c
	.8byte ..___tag_value_fb_muld_low.1
	.8byte ..___tag_value_fb_muld_low.25-..___tag_value_fb_muld_low.1
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.3-..___tag_value_fb_muld_low.1
	.4byte 0x0410070c
	.4byte ..___tag_value_fb_muld_low.4-..___tag_value_fb_muld_low.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_fb_muld_low.6-..___tag_value_fb_muld_low.4
	.8byte 0xffe00d1c380e0c10
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_fb_muld_low.7-..___tag_value_fb_muld_low.6
	.8byte 0xffe00d1c380e0d10
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_fb_muld_low.8-..___tag_value_fb_muld_low.7
	.8byte 0xffe00d1c380e0e10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_fb_muld_low.9-..___tag_value_fb_muld_low.8
	.8byte 0xffe00d1c380e0f10
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_fb_muld_low.10-..___tag_value_fb_muld_low.9
	.8byte 0xffe00d1c380e0310
	.8byte 0xffffffd80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_fb_muld_low.11-..___tag_value_fb_muld_low.10
	.4byte 0x04030309
	.4byte ..___tag_value_fb_muld_low.12-..___tag_value_fb_muld_low.11
	.4byte 0x040f0f09
	.4byte ..___tag_value_fb_muld_low.13-..___tag_value_fb_muld_low.12
	.4byte 0x040e0e09
	.4byte ..___tag_value_fb_muld_low.14-..___tag_value_fb_muld_low.13
	.4byte 0x040d0d09
	.4byte ..___tag_value_fb_muld_low.15-..___tag_value_fb_muld_low.14
	.4byte 0x040c0c09
	.4byte ..___tag_value_fb_muld_low.16-..___tag_value_fb_muld_low.15
	.4byte 0x0908070c
	.2byte 0x0606
	.byte 0x04
	.4byte ..___tag_value_fb_muld_low.18-..___tag_value_fb_muld_low.16
	.8byte 0x1c380e031010060c
	.8byte 0xd80d1affffffe00d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffffe00d1c380e
	.8byte 0x1022fffffff80d1a
	.8byte 0xffffe00d1c380e0d
	.8byte 0x22fffffff00d1aff
	.8byte 0xffe00d1c380e0e10
	.8byte 0xffffffe80d1affff
	.8byte 0xe00d1c380e0f1022
	.8byte 0xffffe00d1affffff
	.8byte 0x00000000000022ff
	.4byte 0x00000014
	.4byte 0x0000014c
	.8byte ..___tag_value_fb_rdcn_low2.26
	.8byte ..___tag_value_fb_rdcn_low2.28-..___tag_value_fb_rdcn_low2.26
	.4byte 0x00000014
	.4byte 0x00000164
	.8byte ..___tag_value_fb_muln_low.29
	.8byte ..___tag_value_fb_muln_low.31-..___tag_value_fb_muln_low.29
	.4byte 0x00000014
	.4byte 0x0000017c
	.8byte ..___tag_value_fb_mulm_low.32
	.8byte ..___tag_value_fb_mulm_low.34-..___tag_value_fb_mulm_low.32
	.4byte 0x00000014
	.4byte 0x00000194
	.8byte ..___tag_value_fb_mul1_low.35
	.8byte ..___tag_value_fb_mul1_low.37-..___tag_value_fb_mul1_low.35
# End
