/* Assembly Chacha implementations taken from Andrew Moon public-domian      */
/* implementations: https://github.com/floodyberry/chacha-opt                */
/* Accessed 27 July 2015. Listed as "LICENSE Public Domain, or MIT"          */

.macro LOAD_VAR_PIC var, reg
#if defined(__i386__)
	call 1f
	1:
	popl \reg
	leal \var - 1b(\reg), \reg
#else
	leaq \var(%rip), \reg
#endif
.endm

/* ========================================================================= */
#if __amd64__ && __AVX2__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
vzeroupper
pushq %rbx
pushq %rbp
pushq %r12
pushq %r13
pushq %r14
movq %rsp, %rbp
andq $~63, %rsp
subq $512, %rsp
LOAD_VAR_PIC chacha_constants, %rax
vbroadcasti128 0(%rax), %ymm8
vbroadcasti128 16(%rax), %ymm6
vbroadcasti128 32(%rax), %ymm7
vbroadcasti128 0(%rdi), %ymm9
vbroadcasti128 16(%rdi), %ymm10
vbroadcasti128 32(%rdi), %ymm11
movq 32(%rdi), %r14
movq 48(%rdi), %rax
vmovdqa %xmm8, 0(%rsp)
vmovdqa %xmm9, 16(%rsp)
vmovdqa %xmm10, 32(%rsp)
vmovdqa %xmm11, 48(%rsp)
movq %rax, 64(%rsp)
vmovdqa %ymm6, 448(%rsp)
vmovdqa %ymm7, 480(%rsp)
cmp $128, %rcx
jb chacha_blocks_avx2_below128_fixup
cmp $256, %rcx
jb chacha_blocks_avx2_atleast128
cmp $512, %rcx
jb chacha_blocks_avx2_atleast256
.p2align 6,,63
chacha_blocks_avx2_atleast512:
movq %r14, %rax
leaq 1(%r14), %r8
leaq 2(%r14), %r9
leaq 3(%r14), %r10
leaq 4(%r14), %rbx
leaq 5(%r14), %r11
leaq 6(%r14), %r12
leaq 7(%r14), %r13
movl %eax, 128(%rsp)
movl %r8d, 4+128(%rsp)
movl %r9d, 8+128(%rsp)
movl %r10d, 12+128(%rsp)
movl %ebx, 16+128(%rsp)
movl %r11d, 20+128(%rsp)
movl %r12d, 24+128(%rsp)
movl %r13d, 28+128(%rsp)
addq $8, %r14
shrq $32, %rax
shrq $32, %r8
shrq $32, %r9
shrq $32, %r10
shrq $32, %rbx
shrq $32, %r11
shrq $32, %r12
shrq $32, %r13
movl %eax, 160(%rsp)
movl %r8d, 4+160(%rsp)
movl %r9d, 8+160(%rsp)
movl %r10d, 12+160(%rsp)
movl %ebx, 16+160(%rsp)
movl %r11d, 20+160(%rsp)
movl %r12d, 24+160(%rsp)
movl %r13d, 28+160(%rsp)
movq 64(%rsp), %rax
vpbroadcastd 0(%rsp), %ymm0
vpbroadcastd 4+0(%rsp), %ymm1
vpbroadcastd 8+0(%rsp), %ymm2
vpbroadcastd 12+0(%rsp), %ymm3
vpbroadcastd 16(%rsp), %ymm4
vpbroadcastd 4+16(%rsp), %ymm5
vpbroadcastd 8+16(%rsp), %ymm6
vpbroadcastd 12+16(%rsp), %ymm7
vpbroadcastd 32(%rsp), %ymm8
vpbroadcastd 4+32(%rsp), %ymm9
vpbroadcastd 8+32(%rsp), %ymm10
vpbroadcastd 12+32(%rsp), %ymm11
vpbroadcastd 8+48(%rsp), %ymm14
vpbroadcastd 12+48(%rsp), %ymm15
vmovdqa 128(%rsp), %ymm12
vmovdqa 160(%rsp), %ymm13
chacha_blocks_avx2_mainloop1:
vpaddd %ymm0, %ymm4, %ymm0
vpaddd %ymm1, %ymm5, %ymm1
vpxor %ymm12, %ymm0, %ymm12
vpxor %ymm13, %ymm1, %ymm13
vpaddd %ymm2, %ymm6, %ymm2
vpaddd %ymm3, %ymm7, %ymm3
vpxor %ymm14, %ymm2, %ymm14
vpxor %ymm15, %ymm3, %ymm15
vpshufb 448(%rsp), %ymm12, %ymm12
vpshufb 448(%rsp), %ymm13, %ymm13
vpaddd %ymm8, %ymm12, %ymm8
vpaddd %ymm9, %ymm13, %ymm9
vpshufb 448(%rsp), %ymm14, %ymm14
vpshufb 448(%rsp), %ymm15, %ymm15
vpaddd %ymm10, %ymm14, %ymm10
vpaddd %ymm11, %ymm15, %ymm11
vmovdqa %ymm12, 96(%rsp)
vpxor %ymm4, %ymm8, %ymm4
vpxor %ymm5, %ymm9, %ymm5
vpslld $ 12, %ymm4, %ymm12
vpsrld $20, %ymm4, %ymm4
vpxor %ymm4, %ymm12, %ymm4
vpslld $ 12, %ymm5, %ymm12
vpsrld $20, %ymm5, %ymm5
vpxor %ymm5, %ymm12, %ymm5
vpxor %ymm6, %ymm10, %ymm6
vpxor %ymm7, %ymm11, %ymm7
vpslld $ 12, %ymm6, %ymm12
vpsrld $20, %ymm6, %ymm6
vpxor %ymm6, %ymm12, %ymm6
vpslld $ 12, %ymm7, %ymm12
vpsrld $20, %ymm7, %ymm7
vpxor %ymm7, %ymm12, %ymm7
vpaddd %ymm0, %ymm4, %ymm0
vpaddd %ymm1, %ymm5, %ymm1
vpxor 96(%rsp), %ymm0, %ymm12
vpxor %ymm13, %ymm1, %ymm13
vpaddd %ymm2, %ymm6, %ymm2
vpaddd %ymm3, %ymm7, %ymm3
vpxor %ymm14, %ymm2, %ymm14
vpxor %ymm15, %ymm3, %ymm15
vpshufb 480(%rsp), %ymm12, %ymm12
vpshufb 480(%rsp), %ymm13, %ymm13
vpaddd %ymm8, %ymm12, %ymm8
vpaddd %ymm9, %ymm13, %ymm9
vpshufb 480(%rsp), %ymm14, %ymm14
vpshufb 480(%rsp), %ymm15, %ymm15
vpaddd %ymm10, %ymm14, %ymm10
vpaddd %ymm11, %ymm15, %ymm11
vmovdqa %ymm12, 96(%rsp)
vpxor %ymm4, %ymm8, %ymm4
vpxor %ymm5, %ymm9, %ymm5
vpslld $ 7, %ymm4, %ymm12
vpsrld $25, %ymm4, %ymm4
vpxor %ymm4, %ymm12, %ymm4
vpslld $ 7, %ymm5, %ymm12
vpsrld $25, %ymm5, %ymm5
vpxor %ymm5, %ymm12, %ymm5
vpxor %ymm6, %ymm10, %ymm6
vpxor %ymm7, %ymm11, %ymm7
vpslld $ 7, %ymm6, %ymm12
vpsrld $25, %ymm6, %ymm6
vpxor %ymm6, %ymm12, %ymm6
vpslld $ 7, %ymm7, %ymm12
vpsrld $25, %ymm7, %ymm7
vpxor %ymm7, %ymm12, %ymm7
vpaddd %ymm0, %ymm5, %ymm0
vpaddd %ymm1, %ymm6, %ymm1
vpxor %ymm15, %ymm0, %ymm15
vpxor 96(%rsp), %ymm1, %ymm12
vpaddd %ymm2, %ymm7, %ymm2
vpaddd %ymm3, %ymm4, %ymm3
vpxor %ymm13, %ymm2, %ymm13
vpxor %ymm14, %ymm3, %ymm14
vpshufb 448(%rsp), %ymm15, %ymm15
vpshufb 448(%rsp), %ymm12, %ymm12
vpaddd %ymm10, %ymm15, %ymm10
vpaddd %ymm11, %ymm12, %ymm11
vpshufb 448(%rsp), %ymm13, %ymm13
vpshufb 448(%rsp), %ymm14, %ymm14
vpaddd %ymm8, %ymm13, %ymm8
vpaddd %ymm9, %ymm14, %ymm9
vmovdqa %ymm15, 96(%rsp)
vpxor %ymm5, %ymm10, %ymm5
vpxor %ymm6, %ymm11, %ymm6
vpslld $ 12, %ymm5, %ymm15
vpsrld $20, %ymm5, %ymm5
vpxor %ymm5, %ymm15, %ymm5
vpslld $ 12, %ymm6, %ymm15
vpsrld $20, %ymm6, %ymm6
vpxor %ymm6, %ymm15, %ymm6
vpxor %ymm7, %ymm8, %ymm7
vpxor %ymm4, %ymm9, %ymm4
vpslld $ 12, %ymm7, %ymm15
vpsrld $20, %ymm7, %ymm7
vpxor %ymm7, %ymm15, %ymm7
vpslld $ 12, %ymm4, %ymm15
vpsrld $20, %ymm4, %ymm4
vpxor %ymm4, %ymm15, %ymm4
vpaddd %ymm0, %ymm5, %ymm0
vpaddd %ymm1, %ymm6, %ymm1
vpxor 96(%rsp), %ymm0, %ymm15
vpxor %ymm12, %ymm1, %ymm12
vpaddd %ymm2, %ymm7, %ymm2
vpaddd %ymm3, %ymm4, %ymm3
vpxor %ymm13, %ymm2, %ymm13
vpxor %ymm14, %ymm3, %ymm14
vpshufb 480(%rsp), %ymm15, %ymm15
vpshufb 480(%rsp), %ymm12, %ymm12
vpaddd %ymm10, %ymm15, %ymm10
vpaddd %ymm11, %ymm12, %ymm11
vpshufb 480(%rsp), %ymm13, %ymm13
vpshufb 480(%rsp), %ymm14, %ymm14
vpaddd %ymm8, %ymm13, %ymm8
vpaddd %ymm9, %ymm14, %ymm9
vmovdqa %ymm15, 96(%rsp)
vpxor %ymm5, %ymm10, %ymm5
vpxor %ymm6, %ymm11, %ymm6
vpslld $ 7, %ymm5, %ymm15
vpsrld $25, %ymm5, %ymm5
vpxor %ymm5, %ymm15, %ymm5
vpslld $ 7, %ymm6, %ymm15
vpsrld $25, %ymm6, %ymm6
vpxor %ymm6, %ymm15, %ymm6
vpxor %ymm7, %ymm8, %ymm7
vpxor %ymm4, %ymm9, %ymm4
vpslld $ 7, %ymm7, %ymm15
vpsrld $25, %ymm7, %ymm7
vpxor %ymm7, %ymm15, %ymm7
vpslld $ 7, %ymm4, %ymm15
vpsrld $25, %ymm4, %ymm4
vpxor %ymm4, %ymm15, %ymm4
vmovdqa 96(%rsp), %ymm15
subq $2, %rax
jnz chacha_blocks_avx2_mainloop1
vmovdqa %ymm8, 192(%rsp)
vmovdqa %ymm9, 224(%rsp)
vmovdqa %ymm10, 256(%rsp)
vmovdqa %ymm11, 288(%rsp)
vmovdqa %ymm12, 320(%rsp)
vmovdqa %ymm13, 352(%rsp)
vmovdqa %ymm14, 384(%rsp)
vmovdqa %ymm15, 416(%rsp)
vpbroadcastd 0(%rsp), %ymm8
vpbroadcastd 4+0(%rsp), %ymm9
vpbroadcastd 8+0(%rsp), %ymm10
vpbroadcastd 12+0(%rsp), %ymm11
vpbroadcastd 16(%rsp), %ymm12
vpbroadcastd 4+16(%rsp), %ymm13
vpbroadcastd 8+16(%rsp), %ymm14
vpbroadcastd 12+16(%rsp), %ymm15
vpaddd %ymm8, %ymm0, %ymm0
vpaddd %ymm9, %ymm1, %ymm1
vpaddd %ymm10, %ymm2, %ymm2
vpaddd %ymm11, %ymm3, %ymm3
vpaddd %ymm12, %ymm4, %ymm4
vpaddd %ymm13, %ymm5, %ymm5
vpaddd %ymm14, %ymm6, %ymm6
vpaddd %ymm15, %ymm7, %ymm7
vpunpckldq %ymm1, %ymm0, %ymm8
vpunpckldq %ymm3, %ymm2, %ymm9
vpunpckhdq %ymm1, %ymm0, %ymm12
vpunpckhdq %ymm3, %ymm2, %ymm13
vpunpckldq %ymm5, %ymm4, %ymm10
vpunpckldq %ymm7, %ymm6, %ymm11
vpunpckhdq %ymm5, %ymm4, %ymm14
vpunpckhdq %ymm7, %ymm6, %ymm15
vpunpcklqdq %ymm9, %ymm8, %ymm0
vpunpcklqdq %ymm11, %ymm10, %ymm1
vpunpckhqdq %ymm9, %ymm8, %ymm2
vpunpckhqdq %ymm11, %ymm10, %ymm3
vpunpcklqdq %ymm13, %ymm12, %ymm4
vpunpcklqdq %ymm15, %ymm14, %ymm5
vpunpckhqdq %ymm13, %ymm12, %ymm6
vpunpckhqdq %ymm15, %ymm14, %ymm7
vperm2i128 $0x20, %ymm1, %ymm0, %ymm8
vperm2i128 $0x20, %ymm3, %ymm2, %ymm9
vperm2i128 $0x31, %ymm1, %ymm0, %ymm12
vperm2i128 $0x31, %ymm3, %ymm2, %ymm13
vperm2i128 $0x20, %ymm5, %ymm4, %ymm10
vperm2i128 $0x20, %ymm7, %ymm6, %ymm11
vperm2i128 $0x31, %ymm5, %ymm4, %ymm14
vperm2i128 $0x31, %ymm7, %ymm6, %ymm15
andq %rsi, %rsi
jz chacha_blocks_avx2_noinput1
vpxor 0(%rsi), %ymm8, %ymm8
vpxor 64(%rsi), %ymm9, %ymm9
vpxor 128(%rsi), %ymm10, %ymm10
vpxor 192(%rsi), %ymm11, %ymm11
vpxor 256(%rsi), %ymm12, %ymm12
vpxor 320(%rsi), %ymm13, %ymm13
vpxor 384(%rsi), %ymm14, %ymm14
vpxor 448(%rsi), %ymm15, %ymm15
vmovdqu %ymm8, 0(%rdx)
vmovdqu %ymm9, 64(%rdx)
vmovdqu %ymm10, 128(%rdx)
vmovdqu %ymm11, 192(%rdx)
vmovdqu %ymm12, 256(%rdx)
vmovdqu %ymm13, 320(%rdx)
vmovdqu %ymm14, 384(%rdx)
vmovdqu %ymm15, 448(%rdx)
vmovdqa 192(%rsp), %ymm0
vmovdqa 224(%rsp), %ymm1
vmovdqa 256(%rsp), %ymm2
vmovdqa 288(%rsp), %ymm3
vmovdqa 320(%rsp), %ymm4
vmovdqa 352(%rsp), %ymm5
vmovdqa 384(%rsp), %ymm6
vmovdqa 416(%rsp), %ymm7
vpbroadcastd 32(%rsp), %ymm8
vpbroadcastd 4+32(%rsp), %ymm9
vpbroadcastd 8+32(%rsp), %ymm10
vpbroadcastd 12+32(%rsp), %ymm11
vmovdqa 128(%rsp), %ymm12
vmovdqa 160(%rsp), %ymm13
vpbroadcastd 8+48(%rsp), %ymm14
vpbroadcastd 12+48(%rsp), %ymm15
vpaddd %ymm8, %ymm0, %ymm0
vpaddd %ymm9, %ymm1, %ymm1
vpaddd %ymm10, %ymm2, %ymm2
vpaddd %ymm11, %ymm3, %ymm3
vpaddd %ymm12, %ymm4, %ymm4
vpaddd %ymm13, %ymm5, %ymm5
vpaddd %ymm14, %ymm6, %ymm6
vpaddd %ymm15, %ymm7, %ymm7
vpunpckldq %ymm1, %ymm0, %ymm8
vpunpckldq %ymm3, %ymm2, %ymm9
vpunpckhdq %ymm1, %ymm0, %ymm12
vpunpckhdq %ymm3, %ymm2, %ymm13
vpunpckldq %ymm5, %ymm4, %ymm10
vpunpckldq %ymm7, %ymm6, %ymm11
vpunpckhdq %ymm5, %ymm4, %ymm14
vpunpckhdq %ymm7, %ymm6, %ymm15
vpunpcklqdq %ymm9, %ymm8, %ymm0
vpunpcklqdq %ymm11, %ymm10, %ymm1
vpunpckhqdq %ymm9, %ymm8, %ymm2
vpunpckhqdq %ymm11, %ymm10, %ymm3
vpunpcklqdq %ymm13, %ymm12, %ymm4
vpunpcklqdq %ymm15, %ymm14, %ymm5
vpunpckhqdq %ymm13, %ymm12, %ymm6
vpunpckhqdq %ymm15, %ymm14, %ymm7
vperm2i128 $0x20, %ymm1, %ymm0, %ymm8
vperm2i128 $0x20, %ymm3, %ymm2, %ymm9
vperm2i128 $0x31, %ymm1, %ymm0, %ymm12
vperm2i128 $0x31, %ymm3, %ymm2, %ymm13
vperm2i128 $0x20, %ymm5, %ymm4, %ymm10
vperm2i128 $0x20, %ymm7, %ymm6, %ymm11
vperm2i128 $0x31, %ymm5, %ymm4, %ymm14
vperm2i128 $0x31, %ymm7, %ymm6, %ymm15
vpxor 32(%rsi), %ymm8, %ymm8
vpxor 96(%rsi), %ymm9, %ymm9
vpxor 160(%rsi), %ymm10, %ymm10
vpxor 224(%rsi), %ymm11, %ymm11
vpxor 288(%rsi), %ymm12, %ymm12
vpxor 352(%rsi), %ymm13, %ymm13
vpxor 416(%rsi), %ymm14, %ymm14
vpxor 480(%rsi), %ymm15, %ymm15
vmovdqu %ymm8, 32(%rdx)
vmovdqu %ymm9, 96(%rdx)
vmovdqu %ymm10, 160(%rdx)
vmovdqu %ymm11, 224(%rdx)
vmovdqu %ymm12, 288(%rdx)
vmovdqu %ymm13, 352(%rdx)
vmovdqu %ymm14, 416(%rdx)
vmovdqu %ymm15, 480(%rdx)
addq $512, %rsi
jmp chacha_blocks_avx2_mainloop1_cont
chacha_blocks_avx2_noinput1:
vmovdqu %ymm8, 0(%rdx)
vmovdqu %ymm9, 64(%rdx)
vmovdqu %ymm10, 128(%rdx)
vmovdqu %ymm11, 192(%rdx)
vmovdqu %ymm12, 256(%rdx)
vmovdqu %ymm13, 320(%rdx)
vmovdqu %ymm14, 384(%rdx)
vmovdqu %ymm15, 448(%rdx)
vmovdqa 192(%rsp), %ymm0
vmovdqa 224(%rsp), %ymm1
vmovdqa 256(%rsp), %ymm2
vmovdqa 288(%rsp), %ymm3
vmovdqa 320(%rsp), %ymm4
vmovdqa 352(%rsp), %ymm5
vmovdqa 384(%rsp), %ymm6
vmovdqa 416(%rsp), %ymm7
vpbroadcastd 32(%rsp), %ymm8
vpbroadcastd 4+32(%rsp), %ymm9
vpbroadcastd 8+32(%rsp), %ymm10
vpbroadcastd 12+32(%rsp), %ymm11
vmovdqa 128(%rsp), %ymm12
vmovdqa 160(%rsp), %ymm13
vpbroadcastd 8+48(%rsp), %ymm14
vpbroadcastd 12+48(%rsp), %ymm15
vpaddd %ymm8, %ymm0, %ymm0
vpaddd %ymm9, %ymm1, %ymm1
vpaddd %ymm10, %ymm2, %ymm2
vpaddd %ymm11, %ymm3, %ymm3
vpaddd %ymm12, %ymm4, %ymm4
vpaddd %ymm13, %ymm5, %ymm5
vpaddd %ymm14, %ymm6, %ymm6
vpaddd %ymm15, %ymm7, %ymm7
vpunpckldq %ymm1, %ymm0, %ymm8
vpunpckldq %ymm3, %ymm2, %ymm9
vpunpckhdq %ymm1, %ymm0, %ymm12
vpunpckhdq %ymm3, %ymm2, %ymm13
vpunpckldq %ymm5, %ymm4, %ymm10
vpunpckldq %ymm7, %ymm6, %ymm11
vpunpckhdq %ymm5, %ymm4, %ymm14
vpunpckhdq %ymm7, %ymm6, %ymm15
vpunpcklqdq %ymm9, %ymm8, %ymm0
vpunpcklqdq %ymm11, %ymm10, %ymm1
vpunpckhqdq %ymm9, %ymm8, %ymm2
vpunpckhqdq %ymm11, %ymm10, %ymm3
vpunpcklqdq %ymm13, %ymm12, %ymm4
vpunpcklqdq %ymm15, %ymm14, %ymm5
vpunpckhqdq %ymm13, %ymm12, %ymm6
vpunpckhqdq %ymm15, %ymm14, %ymm7
vperm2i128 $0x20, %ymm1, %ymm0, %ymm8
vperm2i128 $0x20, %ymm3, %ymm2, %ymm9
vperm2i128 $0x31, %ymm1, %ymm0, %ymm12
vperm2i128 $0x31, %ymm3, %ymm2, %ymm13
vperm2i128 $0x20, %ymm5, %ymm4, %ymm10
vperm2i128 $0x20, %ymm7, %ymm6, %ymm11
vperm2i128 $0x31, %ymm5, %ymm4, %ymm14
vperm2i128 $0x31, %ymm7, %ymm6, %ymm15
vmovdqu %ymm8, 32(%rdx)
vmovdqu %ymm9, 96(%rdx)
vmovdqu %ymm10, 160(%rdx)
vmovdqu %ymm11, 224(%rdx)
vmovdqu %ymm12, 288(%rdx)
vmovdqu %ymm13, 352(%rdx)
vmovdqu %ymm14, 416(%rdx)
vmovdqu %ymm15, 480(%rdx)
chacha_blocks_avx2_mainloop1_cont:
addq $512, %rdx
subq $512, %rcx
cmp $512, %rcx
jae chacha_blocks_avx2_atleast512
movq %r14, 48(%rsp)
vbroadcasti128 0(%rsp), %ymm8
vbroadcasti128 16(%rsp), %ymm9
vbroadcasti128 32(%rsp), %ymm10
vbroadcasti128 48(%rsp), %ymm11
vbroadcasti128 448(%rsp), %ymm6
vbroadcasti128 480(%rsp), %ymm7
cmp $128, %rcx
jb chacha_blocks_avx2_below128_fixup
cmp $256, %rcx
jb chacha_blocks_avx2_atleast128
chacha_blocks_avx2_atleast256:
movq $1, %r9
movq $2, %r10
vpxor %ymm13, %ymm13, %ymm13
vmovd %r9, %xmm14
vmovd %r10, %xmm15
vinserti128 $1, %xmm14, %ymm13, %ymm4
vinserti128 $1, %xmm15, %ymm15, %ymm5
vmovdqa %ymm8, %ymm0
vmovdqa %ymm9, %ymm1
vmovdqa %ymm10, %ymm2
vpaddq %ymm4, %ymm11, %ymm3
vpaddq %ymm5, %ymm3, %ymm11
vmovdqa %ymm8, 192(%rsp)
vmovdqa %ymm9, 224(%rsp)
vmovdqa %ymm10, 256(%rsp)
vmovdqa %ymm3, 288(%rsp)
vmovdqa %ymm11, 320(%rsp)
movq 64(%rsp), %rax
chacha_blocks_avx2_mainloop2:
vpaddd %ymm0, %ymm1, %ymm0
vpaddd %ymm8, %ymm9, %ymm8
vpxor %ymm3, %ymm0, %ymm3
vpxor %ymm11, %ymm8, %ymm11
vpshufb %ymm6, %ymm3, %ymm3
vpshufb %ymm6, %ymm11, %ymm11
vpaddd %ymm2, %ymm3, %ymm2
vpaddd %ymm10, %ymm11, %ymm10
vpxor %ymm1, %ymm2, %ymm1
vpxor %ymm9, %ymm10, %ymm9
vpslld $ 12, %ymm1, %ymm4
vpsrld $20, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpslld $ 12, %ymm9, %ymm5
vpsrld $20, %ymm9, %ymm9
vpxor %ymm9, %ymm5, %ymm9
vpaddd %ymm0, %ymm1, %ymm0
vpaddd %ymm8, %ymm9, %ymm8
vpxor %ymm3, %ymm0, %ymm3
vpxor %ymm11, %ymm8, %ymm11
vpshufb %ymm7, %ymm3, %ymm3
vpshufb %ymm7, %ymm11, %ymm11
vpshufd $0x93, %ymm0, %ymm0
vpshufd $0x93, %ymm8, %ymm8
vpaddd %ymm2, %ymm3, %ymm2
vpaddd %ymm10, %ymm11, %ymm10
vpshufd $0x4e, %ymm3, %ymm3
vpshufd $0x4e, %ymm11, %ymm11
vpxor %ymm1, %ymm2, %ymm1
vpxor %ymm9, %ymm10, %ymm9
vpshufd $0x39, %ymm2, %ymm2
vpshufd $0x39, %ymm10, %ymm10
vpslld $ 7, %ymm1, %ymm4
vpsrld $25, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpslld $ 7, %ymm9, %ymm5
vpsrld $25, %ymm9, %ymm9
vpxor %ymm9, %ymm5, %ymm9
vpaddd %ymm0, %ymm1, %ymm0
vpaddd %ymm8, %ymm9, %ymm8
vpxor %ymm3, %ymm0, %ymm3
vpxor %ymm11, %ymm8, %ymm11
vpshufb %ymm6, %ymm3, %ymm3
vpshufb %ymm6, %ymm11, %ymm11
vpaddd %ymm2, %ymm3, %ymm2
vpaddd %ymm10, %ymm11, %ymm10
vpxor %ymm1, %ymm2, %ymm1
vpxor %ymm9, %ymm10, %ymm9
vpslld $ 12, %ymm1, %ymm4
vpsrld $20, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpslld $ 12, %ymm9, %ymm5
vpsrld $20, %ymm9, %ymm9
vpxor %ymm9, %ymm5, %ymm9
vpaddd %ymm0, %ymm1, %ymm0
vpaddd %ymm8, %ymm9, %ymm8
vpxor %ymm3, %ymm0, %ymm3
vpxor %ymm11, %ymm8, %ymm11
vpshufb %ymm7, %ymm3, %ymm3
vpshufb %ymm7, %ymm11, %ymm11
vpshufd $0x39, %ymm0, %ymm0
vpshufd $0x39, %ymm8, %ymm8
vpaddd %ymm2, %ymm3, %ymm2
vpaddd %ymm10, %ymm11, %ymm10
vpshufd $0x4e, %ymm3, %ymm3
vpshufd $0x4e, %ymm11, %ymm11
vpxor %ymm1, %ymm2, %ymm1
vpxor %ymm9, %ymm10, %ymm9
vpshufd $0x93, %ymm2, %ymm2
vpshufd $0x93, %ymm10, %ymm10
vpslld $ 7, %ymm1, %ymm4
vpsrld $25, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpslld $ 7, %ymm9, %ymm5
vpsrld $25, %ymm9, %ymm9
vpxor %ymm9, %ymm5, %ymm9
subq $2, %rax
jnz chacha_blocks_avx2_mainloop2
vmovdqa 192(%rsp), %ymm12
vmovdqa 224(%rsp), %ymm13
vmovdqa 256(%rsp), %ymm14
vmovdqa 288(%rsp), %ymm15
vmovdqa 320(%rsp), %ymm5
vpaddd %ymm12, %ymm0, %ymm0
vpaddd %ymm12, %ymm8, %ymm8
vpaddd %ymm13, %ymm1, %ymm1
vpaddd %ymm13, %ymm9, %ymm9
vpaddd %ymm14, %ymm2, %ymm2
vpaddd %ymm14, %ymm10, %ymm10
vpaddd %ymm15, %ymm3, %ymm3
vpaddd %ymm5, %ymm11, %ymm11
vperm2i128 $2, %ymm0, %ymm1, %ymm12
vperm2i128 $2, %ymm2, %ymm3, %ymm13
vperm2i128 $19, %ymm0, %ymm1, %ymm14
vperm2i128 $19, %ymm2, %ymm3, %ymm15
vperm2i128 $2, %ymm8, %ymm9, %ymm0
vperm2i128 $2, %ymm10, %ymm11, %ymm1
vperm2i128 $19, %ymm8, %ymm9, %ymm2
vperm2i128 $19, %ymm10, %ymm11, %ymm3
andq %rsi, %rsi
jz chacha_blocks_avx2_noinput2
vpxor 0(%rsi), %ymm12, %ymm12
vpxor 32(%rsi), %ymm13, %ymm13
vpxor 64(%rsi), %ymm14, %ymm14
vpxor 96(%rsi), %ymm15, %ymm15
vpxor 128(%rsi), %ymm0, %ymm0
vpxor 160(%rsi), %ymm1, %ymm1
vpxor 192(%rsi), %ymm2, %ymm2
vpxor 224(%rsi), %ymm3, %ymm3
addq $256, %rsi
chacha_blocks_avx2_noinput2:
addq $4, %r14
vmovdqu %ymm12, 0(%rdx)
vmovdqu %ymm13, 32(%rdx)
vmovdqu %ymm14, 64(%rdx)
vmovdqu %ymm15, 96(%rdx)
vmovdqu %ymm0, 128(%rdx)
vmovdqu %ymm1, 160(%rdx)
vmovdqu %ymm2, 192(%rdx)
vmovdqu %ymm3, 224(%rdx)
movq %r14, 48(%rsp)
addq $256, %rdx
subq $256, %rcx
vbroadcasti128 0(%rsp), %ymm8
vbroadcasti128 16(%rsp), %ymm9
vbroadcasti128 32(%rsp), %ymm10
vbroadcasti128 48(%rsp), %ymm11
cmp $128, %rcx
jb chacha_blocks_avx2_below128_fixup
chacha_blocks_avx2_atleast128:
movq $1, %r9
vpxor %ymm13, %ymm13, %ymm13
vmovd %r9, %xmm14
vinserti128 $1, %xmm14, %ymm13, %ymm13
vpaddq %ymm13, %ymm11, %ymm11
vmovdqa %ymm8, %ymm0
vmovdqa %ymm9, %ymm1
vmovdqa %ymm10, %ymm2
vmovdqa %ymm11, %ymm3
movq 64(%rsp), %rax
chacha_blocks_avx2_mainloop3:
vpaddd %ymm0, %ymm1, %ymm0
vpxor %ymm3, %ymm0, %ymm3
vpshufb %ymm6, %ymm3, %ymm3
vpaddd %ymm2, %ymm3, %ymm2
vpxor %ymm1, %ymm2, %ymm1
vpslld $ 12, %ymm1, %ymm4
vpsrld $20, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpaddd %ymm0, %ymm1, %ymm0
vpxor %ymm3, %ymm0, %ymm3
vpshufb %ymm7, %ymm3, %ymm3
vpshufd $0x93, %ymm0, %ymm0
vpaddd %ymm2, %ymm3, %ymm2
vpshufd $0x4e, %ymm3, %ymm3
vpxor %ymm1, %ymm2, %ymm1
vpshufd $0x39, %ymm2, %ymm2
vpslld $ 7, %ymm1, %ymm4
vpsrld $25, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpaddd %ymm0, %ymm1, %ymm0
vpxor %ymm3, %ymm0, %ymm3
vpshufb %ymm6, %ymm3, %ymm3
vpaddd %ymm2, %ymm3, %ymm2
vpxor %ymm1, %ymm2, %ymm1
vpslld $ 12, %ymm1, %ymm4
vpsrld $20, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
vpaddd %ymm0, %ymm1, %ymm0
vpxor %ymm3, %ymm0, %ymm3
vpshufb %ymm7, %ymm3, %ymm3
vpshufd $0x39, %ymm0, %ymm0
vpaddd %ymm2, %ymm3, %ymm2
vpshufd $0x4e, %ymm3, %ymm3
vpxor %ymm1, %ymm2, %ymm1
vpshufd $0x93, %ymm2, %ymm2
vpslld $ 7, %ymm1, %ymm4
vpsrld $25, %ymm1, %ymm1
vpxor %ymm1, %ymm4, %ymm1
subq $2, %rax
jnz chacha_blocks_avx2_mainloop3
vpaddd %ymm8, %ymm0, %ymm0
vpaddd %ymm9, %ymm1, %ymm1
vpaddd %ymm10, %ymm2, %ymm2
vpaddd %ymm11, %ymm3, %ymm3
vperm2i128 $2, %ymm0, %ymm1, %ymm12
vperm2i128 $2, %ymm2, %ymm3, %ymm13
vperm2i128 $19, %ymm0, %ymm1, %ymm14
vperm2i128 $19, %ymm2, %ymm3, %ymm15
andq %rsi, %rsi
jz chacha_blocks_avx2_noinput3
vpxor 0(%rsi), %ymm12, %ymm12
vpxor 32(%rsi), %ymm13, %ymm13
vpxor 64(%rsi), %ymm14, %ymm14
vpxor 96(%rsi), %ymm15, %ymm15
addq $128, %rsi
chacha_blocks_avx2_noinput3:
addq $2, %r14
vmovdqu %ymm12, 0(%rdx)
vmovdqu %ymm13, 32(%rdx)
vmovdqu %ymm14, 64(%rdx)
vmovdqu %ymm15, 96(%rdx)
movq $2, %r9
vmovd %r9, %xmm4
addq $128, %rdx
vpaddq %xmm4, %xmm11, %xmm11
subq $128, %rcx
movq %r14, 48(%rsp)
chacha_blocks_avx2_below128_fixup:
movq $1, %r9
vmovd %r9, %xmm5
chacha_blocks_avx2_below128:
andq %rcx, %rcx
jz chacha_blocks_avx2_done
cmpq $64, %rcx
jae chacha_blocks_avx2_above63
movq %rdx, %r9
andq %rsi, %rsi
jz chacha_blocks_avx2_noinput4
movq %rcx, %r10
movq %rsp, %rdx
addq %r10, %rsi
addq %r10, %rdx
negq %r10
chacha_blocks_avx2_copyinput:
movb (%rsi, %r10), %al
movb %al, (%rdx, %r10)
incq %r10
jnz chacha_blocks_avx2_copyinput
movq %rsp, %rsi
chacha_blocks_avx2_noinput4:
movq %rsp, %rdx
chacha_blocks_avx2_above63:
vmovdqa %xmm8, %xmm0
vmovdqa %xmm9, %xmm1
vmovdqa %xmm10, %xmm2
vmovdqa %xmm11, %xmm3
movq 64(%rsp), %rax
chacha_blocks_avx2_mainloop4:
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm6, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vpslld $12, %xmm1, %xmm4
vpsrld $20, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm7, %xmm3, %xmm3
vpshufd $0x93, %xmm0, %xmm0
vpaddd %xmm2, %xmm3, %xmm2
vpshufd $0x4e, %xmm3, %xmm3
vpxor %xmm1, %xmm2, %xmm1
vpshufd $0x39, %xmm2, %xmm2
vpslld $7, %xmm1, %xmm4
vpsrld $25, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm6, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vpslld $12, %xmm1, %xmm4
vpsrld $20, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm7, %xmm3, %xmm3
vpshufd $0x39, %xmm0, %xmm0
vpaddd %xmm2, %xmm3, %xmm2
vpshufd $0x4e, %xmm3, %xmm3
vpxor %xmm1, %xmm2, %xmm1
vpshufd $0x93, %xmm2, %xmm2
vpslld $7, %xmm1, %xmm4
vpsrld $25, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
subq $2, %rax
jnz chacha_blocks_avx2_mainloop4
vpaddd %xmm0, %xmm8, %xmm0
vpaddd %xmm1, %xmm9, %xmm1
vpaddd %xmm2, %xmm10, %xmm2
vpaddd %xmm3, %xmm11, %xmm3
andq %rsi, %rsi
jz chacha_blocks_avx2_noinput5
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 32(%rsi), %xmm2, %xmm2
vpxor 48(%rsi), %xmm3, %xmm3
addq $64, %rsi
chacha_blocks_avx2_noinput5:
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 32(%rdx)
vmovdqu %xmm3, 48(%rdx)
vpaddq %xmm11, %xmm5, %xmm11
addq $1, %r14
cmpq $64, %rcx
jbe chacha_blocks_avx2_mainloop4_finishup
addq $64, %rdx
subq $64, %rcx
jmp chacha_blocks_avx2_below128
chacha_blocks_avx2_mainloop4_finishup:
cmpq $64, %rcx
je chacha_blocks_avx2_done
addq %rcx, %r9
addq %rcx, %rdx
negq %rcx
chacha_blocks_avx2_copyoutput:
movb (%rdx, %rcx), %al
movb %al, (%r9, %rcx)
incq %rcx
jnz chacha_blocks_avx2_copyoutput
chacha_blocks_avx2_done:
movq %r14, 32(%rdi)
movq %rbp, %rsp
popq %r14
popq %r13
popq %r12
popq %rbp
popq %rbx
ret

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __i386__ && __AVX2__ && 0          /* Moon AVX2-32 is currently broken */
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushl %ebp
movl %esp, %ebp
andl $~63, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $3124, %esp
movl $1, %eax
LOAD_VAR_PIC chacha_constants, %esi
movl 16(%ebp), %ebx
movl 20(%ebp), %edx
vmovd %eax, %xmm0
vmovdqu 16(%esi), %ymm1
vmovdqu 32(%esi), %ymm2
vmovdqu %xmm0, 592(%esp)
vmovdqu %ymm1, 1568(%esp)
vmovdqu %ymm2, 1536(%esp)
movl 12(%ebp), %edi
movl %ebx, 1508(%esp)
testl %edx, %edx
je chacha_blocks_avx2_44
chacha_blocks_avx2_2:
movl 8(%ebp), %ecx
vmovdqu 0(%esi), %xmm5
vmovdqu %xmm5, 544(%esp)
vmovdqu 16(%ecx), %xmm0
vmovdqu (%ecx), %xmm1
vmovdqu %xmm0, 576(%esp)
vmovdqu 32(%ecx), %xmm0
movl 48(%ecx), %eax
vmovdqu %xmm1, 560(%esp)
movl %eax, 1516(%esp)
vmovq 8(%esi), %xmm5
vmovq 8(%ecx), %xmm1
vmovdqu %xmm0, 304(%esp)
vpsrldq $4, %xmm0, %xmm2
cmpl $512, %edx
jb chacha_blocks_avx2_10
chacha_blocks_avx2_3:
vpbroadcastd 312(%esp), %ymm7
vmovdqu 576(%esp), %xmm4
vmovdqu %ymm7, 704(%esp)
vmovdqu %xmm4, 288(%esp)
vmovdqu 560(%esp), %xmm6
vmovdqu 544(%esp), %xmm3
vmovdqu %xmm6, 272(%esp)
vpbroadcastd 316(%esp), %ymm7
vmovdqu %ymm7, 672(%esp)
vmovdqu %xmm3, 256(%esp)
vmovd %xmm0, %ecx
vmovd %xmm2, %eax
vpbroadcastd 292(%esp), %ymm7
vmovdqu %ymm7, 800(%esp)
vpbroadcastd %xmm4, %ymm0
vpbroadcastd %xmm1, %ymm1
vpbroadcastd 296(%esp), %ymm7
vmovdqu %ymm0, 832(%esp)
vmovdqu %ymm1, 864(%esp)
vmovdqu %ymm7, 768(%esp)
vpbroadcastd %xmm3, %ymm2
vpbroadcastd %xmm6, %ymm3
vpbroadcastd 260(%esp), %ymm0
vpbroadcastd 276(%esp), %ymm4
vpbroadcastd 284(%esp), %ymm1
vpbroadcastd 300(%esp), %ymm7
vpbroadcastd %xmm5, %ymm6
vpbroadcastd 268(%esp), %ymm5
vmovdqu %ymm7, 736(%esp)
vmovdqu %ymm1, 1088(%esp)
vmovdqu %ymm4, 1056(%esp)
vmovdqu %ymm3, 1024(%esp)
vmovdqu %ymm5, 992(%esp)
vmovdqu %ymm6, 960(%esp)
vmovdqu %ymm0, 928(%esp)
vmovdqu %ymm2, 896(%esp)
movl %edx, 1512(%esp)
movl %esi, 1504(%esp)
chacha_blocks_avx2_4:
movl %ecx, %edx
movl %eax, %esi
addl $1, %edx
movl %edx, 612(%esp)
movl %ecx, %edx
adcl $0, %esi
addl $2, %edx
movl %esi, 644(%esp)
movl %eax, %esi
movl %edx, 616(%esp)
movl %ecx, %edx
adcl $0, %esi
addl $3, %edx
movl %esi, 648(%esp)
movl %eax, %esi
movl %edx, 620(%esp)
movl %ecx, %edx
vmovdqu 864(%esp), %ymm3
adcl $0, %esi
vmovdqu 832(%esp), %ymm7
vmovdqu 896(%esp), %ymm2
vmovdqu 960(%esp), %ymm5
vmovdqu 1056(%esp), %ymm6
vmovdqu %ymm3, 1760(%esp)
vmovdqu 800(%esp), %ymm3
vmovdqu %ymm7, 1248(%esp)
vmovdqu 768(%esp), %ymm7
vmovdqu 928(%esp), %ymm4
vmovdqu %ymm6, 1792(%esp)
vmovdqu %ymm3, 1216(%esp)
vmovdqu 736(%esp), %ymm3
vmovdqu %ymm7, 1728(%esp)
vmovdqu 704(%esp), %ymm7
vmovdqu %ymm5, 1888(%esp)
vmovdqu %ymm2, 1824(%esp)
vmovdqu %ymm3, 1696(%esp)
vmovdqu 672(%esp), %ymm3
vmovdqu 1088(%esp), %ymm6
vmovdqu 1248(%esp), %ymm2
vmovdqu %ymm7, 1632(%esp)
vmovdqu %ymm4, 1856(%esp)
vmovdqu %ymm3, 1600(%esp)
addl $4, %edx
movl %esi, 652(%esp)
movl %eax, %esi
movl %edx, 624(%esp)
movl %ecx, %edx
adcl $0, %esi
addl $5, %edx
movl %esi, 656(%esp)
movl %eax, %esi
movl %edx, 628(%esp)
movl %ecx, %edx
adcl $0, %esi
addl $6, %edx
movl %esi, 660(%esp)
movl %eax, %esi
movl %edx, 632(%esp)
movl %ecx, %edx
adcl $0, %esi
addl $7, %edx
movl %esi, 664(%esp)
movl %eax, %esi
adcl $0, %esi
movl %eax, 640(%esp)
movl %esi, 668(%esp)
vmovdqu 640(%esp), %ymm1
movl %ecx, 608(%esp)
addl $8, %ecx
movl %edx, 636(%esp)
vmovdqu %ymm1, 1120(%esp)
adcl $0, %eax
vmovdqu %ymm1, 1184(%esp)
vmovdqu 608(%esp), %ymm0
vmovdqu 992(%esp), %ymm1
vmovdqu 1184(%esp), %ymm5
vmovdqu %ymm0, 1152(%esp)
vmovdqu %ymm0, 1664(%esp)
vmovdqu %ymm1, 1920(%esp)
vmovdqu 1024(%esp), %ymm0
vmovdqu 1216(%esp), %ymm1
movl 1516(%esp), %edx
movl %ecx, 304(%esp)
movl %eax, 308(%esp)
jmp chacha_blocks_avx2_5
.p2align 6
nop
nop
nop
nop
nop
chacha_blocks_avx2_5:
vmovdqu 1792(%esp), %ymm7
vmovdqu %ymm6, 1952(%esp)
vpaddd 1824(%esp), %ymm0, %ymm3
vpaddd 1920(%esp), %ymm6, %ymm6
vpaddd 1856(%esp), %ymm7, %ymm7
vpxor 1664(%esp), %ymm3, %ymm4
vmovdqu %ymm3, 1984(%esp)
vmovdqu 1568(%esp), %ymm3
vmovdqu %ymm7, 2016(%esp)
vmovdqu %ymm6, 2080(%esp)
vpxor %ymm7, %ymm5, %ymm5
vpxor 1600(%esp), %ymm6, %ymm6
vmovdqu 1760(%esp), %ymm7
vpshufb %ymm3, %ymm4, %ymm4
vpshufb %ymm3, %ymm5, %ymm5
vpshufb %ymm3, %ymm6, %ymm6
vpaddd 1888(%esp), %ymm7, %ymm7
vpaddd %ymm4, %ymm2, %ymm2
vpaddd %ymm5, %ymm1, %ymm1
vmovdqu %ymm6, 2112(%esp)
vmovdqu %ymm7, 2048(%esp)
vmovdqu %ymm2, 2144(%esp)
vmovdqu %ymm1, 2176(%esp)
vpxor 1632(%esp), %ymm7, %ymm7
vpxor %ymm2, %ymm0, %ymm0
vpxor 1792(%esp), %ymm1, %ymm1
vpshufb %ymm3, %ymm7, %ymm7
vpsrld $20, %ymm0, %ymm2
vpslld $12, %ymm0, %ymm3
vpor %ymm3, %ymm2, %ymm0
vpsrld $20, %ymm1, %ymm2
vpslld $12, %ymm1, %ymm1
vpaddd 1696(%esp), %ymm6, %ymm3
vmovdqu %ymm0, 2208(%esp)
vpor %ymm1, %ymm2, %ymm2
vpaddd 1728(%esp), %ymm7, %ymm1
vmovdqu %ymm3, 2272(%esp)
vpxor 1760(%esp), %ymm1, %ymm6
vmovdqu %ymm1, 2240(%esp)
vpxor 1952(%esp), %ymm3, %ymm1
vpsrld $20, %ymm6, %ymm3
vpslld $12, %ymm6, %ymm6
vpor %ymm6, %ymm3, %ymm3
vpsrld $20, %ymm1, %ymm6
vpslld $12, %ymm1, %ymm1
vmovdqu %ymm3, 2304(%esp)
vpor %ymm1, %ymm6, %ymm1
vpaddd 1984(%esp), %ymm0, %ymm6
vpaddd 2016(%esp), %ymm2, %ymm0
vmovdqu %ymm6, 2336(%esp)
vmovdqu %ymm0, 2368(%esp)
vpxor %ymm6, %ymm4, %ymm6
vpxor %ymm0, %ymm5, %ymm5
vpaddd 2048(%esp), %ymm3, %ymm0
vmovdqu 1536(%esp), %ymm4
vpxor %ymm0, %ymm7, %ymm7
vmovdqu %ymm0, 2464(%esp)
vpshufb %ymm4, %ymm6, %ymm6
vpshufb %ymm4, %ymm5, %ymm5
vpshufb %ymm4, %ymm7, %ymm0
vmovdqu %ymm6, 2400(%esp)
vmovdqu %ymm5, 2432(%esp)
vmovdqu %ymm0, 2528(%esp)
vpaddd 2080(%esp), %ymm1, %ymm6
vpaddd 2176(%esp), %ymm5, %ymm5
vpaddd 2240(%esp), %ymm0, %ymm0
vmovdqu %ymm6, 2496(%esp)
vmovdqu %ymm5, 2592(%esp)
vpxor 2112(%esp), %ymm6, %ymm6
vpxor %ymm5, %ymm2, %ymm5
vpshufb %ymm4, %ymm6, %ymm6
vmovdqu 2400(%esp), %ymm4
vpaddd 2144(%esp), %ymm4, %ymm7
vpxor 2208(%esp), %ymm7, %ymm3
vmovdqu %ymm7, 2560(%esp)
vpsrld $25, %ymm3, %ymm2
vpslld $7, %ymm3, %ymm4
vpor %ymm4, %ymm2, %ymm7
vpsrld $25, %ymm5, %ymm2
vpslld $7, %ymm5, %ymm5
vpaddd 2272(%esp), %ymm6, %ymm4
vmovdqu %ymm7, 2624(%esp)
vpor %ymm5, %ymm2, %ymm3
vpxor 2304(%esp), %ymm0, %ymm2
vpxor %ymm4, %ymm1, %ymm1
vmovdqu %ymm4, 2688(%esp)
vmovdqu %ymm3, 2656(%esp)
vpsrld $25, %ymm2, %ymm5
vpslld $7, %ymm2, %ymm2
vpsrld $25, %ymm1, %ymm4
vpslld $7, %ymm1, %ymm1
vpor %ymm2, %ymm5, %ymm2
vpor %ymm1, %ymm4, %ymm5
vpaddd 2336(%esp), %ymm3, %ymm1
vpaddd 2368(%esp), %ymm2, %ymm3
vmovdqu %ymm5, 2720(%esp)
vmovdqu %ymm1, 2752(%esp)
vmovdqu %ymm3, 2784(%esp)
vpxor %ymm1, %ymm6, %ymm4
vpxor 2400(%esp), %ymm3, %ymm3
vmovdqu 1568(%esp), %ymm6
vpshufb %ymm6, %ymm4, %ymm1
vpshufb %ymm6, %ymm3, %ymm3
vpaddd 2464(%esp), %ymm5, %ymm4
vpaddd 2496(%esp), %ymm7, %ymm5
vpaddd %ymm1, %ymm0, %ymm0
vpxor 2432(%esp), %ymm4, %ymm7
vmovdqu %ymm5, 2848(%esp)
vmovdqu %ymm0, 2912(%esp)
vmovdqu %ymm4, 2816(%esp)
vpxor 2528(%esp), %ymm5, %ymm5
vpxor 2656(%esp), %ymm0, %ymm0
vpshufb %ymm6, %ymm7, %ymm7
vpshufb %ymm6, %ymm5, %ymm4
vpaddd 2688(%esp), %ymm3, %ymm6
vpsrld $20, %ymm0, %ymm5
vmovdqu %ymm4, 2880(%esp)
vpxor %ymm6, %ymm2, %ymm2
vmovdqu %ymm6, 2944(%esp)
vpslld $12, %ymm0, %ymm6
vpor %ymm6, %ymm5, %ymm0
vpsrld $20, %ymm2, %ymm5
vpslld $12, %ymm2, %ymm2
vpaddd 2560(%esp), %ymm7, %ymm6
vmovdqu %ymm0, 2976(%esp)
vpor %ymm2, %ymm5, %ymm2
vpaddd 2592(%esp), %ymm4, %ymm5
vpxor 2720(%esp), %ymm6, %ymm4
vpaddd 2752(%esp), %ymm0, %ymm0
vmovdqu %ymm6, 3008(%esp)
vmovdqu %ymm5, 3040(%esp)
vpxor 2624(%esp), %ymm5, %ymm6
vpsrld $20, %ymm4, %ymm5
vpslld $12, %ymm4, %ymm4
vmovdqu %ymm0, 1824(%esp)
vpxor %ymm0, %ymm1, %ymm0
vpor %ymm4, %ymm5, %ymm5
vpsrld $20, %ymm6, %ymm4
vpslld $12, %ymm6, %ymm6
vmovdqu 1536(%esp), %ymm1
vmovdqu %ymm5, 3072(%esp)
vpor %ymm6, %ymm4, %ymm6
vpaddd 2784(%esp), %ymm2, %ymm4
vpaddd 2816(%esp), %ymm5, %ymm5
vpshufb %ymm1, %ymm0, %ymm0
vpxor %ymm4, %ymm3, %ymm3
vpxor %ymm5, %ymm7, %ymm7
vmovdqu %ymm4, 1856(%esp)
vmovdqu %ymm0, 1600(%esp)
vmovdqu %ymm5, 1888(%esp)
vpaddd 2848(%esp), %ymm6, %ymm4
vpaddd 2912(%esp), %ymm0, %ymm0
vpshufb %ymm1, %ymm3, %ymm3
vpshufb %ymm1, %ymm7, %ymm5
vpxor 2880(%esp), %ymm4, %ymm7
vmovdqu %ymm3, 1664(%esp)
vmovdqu %ymm4, 1920(%esp)
vmovdqu %ymm0, 1728(%esp)
vpaddd 2944(%esp), %ymm3, %ymm3
vpxor 2976(%esp), %ymm0, %ymm4
vpshufb %ymm1, %ymm7, %ymm1
vpxor %ymm3, %ymm2, %ymm2
vpsrld $25, %ymm4, %ymm7
vpslld $7, %ymm4, %ymm0
vmovdqu %ymm1, 1632(%esp)
vmovdqu %ymm3, 1696(%esp)
vpsrld $25, %ymm2, %ymm4
vpslld $7, %ymm2, %ymm2
vpor %ymm0, %ymm7, %ymm3
vpaddd 3040(%esp), %ymm1, %ymm1
vpor %ymm2, %ymm4, %ymm2
vmovdqu %ymm3, 1792(%esp)
vpxor %ymm1, %ymm6, %ymm7
vmovdqu %ymm2, 1760(%esp)
vpaddd 3008(%esp), %ymm5, %ymm2
vpsrld $25, %ymm7, %ymm3
vpslld $7, %ymm7, %ymm4
vpxor 3072(%esp), %ymm2, %ymm0
vpsrld $25, %ymm0, %ymm6
vpslld $7, %ymm0, %ymm0
vpor %ymm0, %ymm6, %ymm6
vpor %ymm4, %ymm3, %ymm0
addl $-2, %edx
jne chacha_blocks_avx2_5
chacha_blocks_avx2_6:
vmovdqu %ymm2, 1248(%esp)
vmovdqu 1824(%esp), %ymm2
vmovdqu 1856(%esp), %ymm4
vmovdqu %ymm5, 1184(%esp)
vmovdqu %ymm1, 1216(%esp)
vmovdqu 1888(%esp), %ymm5
vmovdqu 1920(%esp), %ymm1
vmovdqu 1792(%esp), %ymm7
vpaddd 896(%esp), %ymm2, %ymm3
vpaddd 928(%esp), %ymm4, %ymm2
vpaddd 1088(%esp), %ymm6, %ymm6
vpaddd 960(%esp), %ymm5, %ymm4
vpaddd 992(%esp), %ymm1, %ymm5
vpaddd 1056(%esp), %ymm7, %ymm1
vpaddd 1024(%esp), %ymm0, %ymm0
vmovdqu %ymm6, 1312(%esp)
vmovdqu 1760(%esp), %ymm7
vpunpckldq %ymm2, %ymm3, %ymm6
vpunpckhdq %ymm2, %ymm3, %ymm3
vmovdqu 1312(%esp), %ymm2
vpaddd 864(%esp), %ymm7, %ymm7
vmovdqu %ymm6, 1344(%esp)
vpunpckldq %ymm5, %ymm4, %ymm6
vpunpckhdq %ymm5, %ymm4, %ymm4
vpunpckldq %ymm1, %ymm0, %ymm5
vpunpckhdq %ymm1, %ymm0, %ymm0
vpunpckhdq %ymm2, %ymm7, %ymm1
vmovdqu %ymm4, 1376(%esp)
vpunpckldq %ymm2, %ymm7, %ymm4
vmovdqu 1344(%esp), %ymm2
vpunpcklqdq %ymm6, %ymm2, %ymm7
vpunpckhqdq %ymm6, %ymm2, %ymm6
vmovdqu 1376(%esp), %ymm2
vmovdqu %ymm7, 1408(%esp)
vpunpcklqdq %ymm4, %ymm5, %ymm7
vpunpckhqdq %ymm4, %ymm5, %ymm4
vpunpcklqdq %ymm2, %ymm3, %ymm5
vpunpckhqdq %ymm2, %ymm3, %ymm3
vmovdqu %ymm5, 1440(%esp)
vpunpcklqdq %ymm1, %ymm0, %ymm5
vpunpckhqdq %ymm1, %ymm0, %ymm1
vmovdqu 1408(%esp), %ymm0
vperm2i128 $32, %ymm7, %ymm0, %ymm2
vmovdqu %ymm2, 1280(%esp)
vperm2i128 $32, %ymm4, %ymm6, %ymm2
vperm2i128 $49, %ymm7, %ymm0, %ymm0
vperm2i128 $49, %ymm4, %ymm6, %ymm7
vmovdqu 1440(%esp), %ymm4
vperm2i128 $32, %ymm5, %ymm4, %ymm6
vmovdqu %ymm6, 1472(%esp)
vperm2i128 $32, %ymm1, %ymm3, %ymm6
vperm2i128 $49, %ymm5, %ymm4, %ymm4
vperm2i128 $49, %ymm1, %ymm3, %ymm1
vmovdqu 1472(%esp), %ymm5
testl %edi, %edi
je chacha_blocks_avx2_51
chacha_blocks_avx2_7:
vmovdqu 1280(%esp), %ymm3
vpxor 448(%edi), %ymm1, %ymm1
vpxor 384(%edi), %ymm4, %ymm4
vpxor 320(%edi), %ymm7, %ymm7
vpxor 256(%edi), %ymm0, %ymm0
vpxor 192(%edi), %ymm6, %ymm6
vpxor 128(%edi), %ymm5, %ymm5
vpxor 64(%edi), %ymm2, %ymm2
vpxor (%edi), %ymm3, %ymm3
vmovdqu %ymm1, 448(%ebx)
vmovdqu 1184(%esp), %ymm1
vmovdqu %ymm2, 64(%ebx)
vmovdqu %ymm3, (%ebx)
vmovdqu %ymm0, 256(%ebx)
vmovdqu 1248(%esp), %ymm0
vmovdqu 1216(%esp), %ymm2
vmovdqu %ymm5, 128(%ebx)
vmovdqu %ymm7, 320(%ebx)
vmovdqu %ymm6, 192(%ebx)
vmovdqu 1728(%esp), %ymm6
vmovdqu %ymm4, 384(%ebx)
vpaddd 1120(%esp), %ymm1, %ymm3
vpaddd 832(%esp), %ymm0, %ymm5
vpaddd 800(%esp), %ymm2, %ymm7
vpaddd 768(%esp), %ymm6, %ymm6
vmovdqu 1600(%esp), %ymm1
vmovdqu 1696(%esp), %ymm0
vmovdqu 1664(%esp), %ymm2
vpaddd 672(%esp), %ymm1, %ymm1
vpaddd 736(%esp), %ymm0, %ymm4
vpaddd 1152(%esp), %ymm2, %ymm0
vmovdqu 1632(%esp), %ymm2
vmovdqu %ymm1, 224(%esp)
vpunpckldq %ymm7, %ymm5, %ymm1
vpunpckhdq %ymm7, %ymm5, %ymm7
vmovdqu 224(%esp), %ymm5
vpaddd 704(%esp), %ymm2, %ymm2
vmovdqu %ymm1, 320(%esp)
vpunpckldq %ymm4, %ymm6, %ymm1
vpunpckhdq %ymm4, %ymm6, %ymm4
vpunpckldq %ymm5, %ymm2, %ymm6
vmovdqu %ymm4, 352(%esp)
vpunpckldq %ymm3, %ymm0, %ymm4
vpunpckhdq %ymm3, %ymm0, %ymm0
vpunpckhdq %ymm5, %ymm2, %ymm3
vmovdqu 320(%esp), %ymm5
vpunpcklqdq %ymm1, %ymm5, %ymm2
vpunpckhqdq %ymm1, %ymm5, %ymm1
vmovdqu 352(%esp), %ymm5
vmovdqu %ymm2, 384(%esp)
vpunpcklqdq %ymm6, %ymm4, %ymm2
vpunpckhqdq %ymm6, %ymm4, %ymm4
vpunpcklqdq %ymm5, %ymm7, %ymm6
vpunpckhqdq %ymm5, %ymm7, %ymm7
vpunpckhqdq %ymm3, %ymm0, %ymm5
vmovdqu %ymm6, 416(%esp)
vpunpcklqdq %ymm3, %ymm0, %ymm6
vmovdqu 384(%esp), %ymm3
vperm2i128 $32, %ymm2, %ymm3, %ymm0
vpxor 32(%edi), %ymm0, %ymm0
vmovdqu %ymm0, 448(%esp)
vperm2i128 $32, %ymm4, %ymm1, %ymm0
vpxor 96(%edi), %ymm0, %ymm0
vmovdqu %ymm0, 480(%esp)
vperm2i128 $2, 416(%esp), %ymm6, %ymm0
vpxor 160(%edi), %ymm0, %ymm0
vmovdqu %ymm0, 512(%esp)
vperm2i128 $32, %ymm5, %ymm7, %ymm0
vperm2i128 $49, %ymm5, %ymm7, %ymm5
vmovdqu 448(%esp), %ymm7
vpxor 224(%edi), %ymm0, %ymm0
vpxor 480(%edi), %ymm5, %ymm5
vperm2i128 $49, %ymm2, %ymm3, %ymm3
vperm2i128 $49, %ymm4, %ymm1, %ymm4
vperm2i128 $19, 416(%esp), %ymm6, %ymm1
vpxor 288(%edi), %ymm3, %ymm2
vpxor 352(%edi), %ymm4, %ymm4
vpxor 416(%edi), %ymm1, %ymm1
vmovdqu %ymm7, 32(%ebx)
vmovdqu 480(%esp), %ymm7
vmovdqu 512(%esp), %ymm3
vmovdqu %ymm0, 224(%ebx)
vmovdqu %ymm2, 288(%ebx)
vmovdqu %ymm4, 352(%ebx)
vmovdqu %ymm7, 96(%ebx)
vmovdqu %ymm3, 160(%ebx)
vmovdqu %ymm1, 416(%ebx)
vmovdqu %ymm5, 480(%ebx)
addl $512, %edi
chacha_blocks_avx2_8:
movl 1512(%esp), %edx
addl $512, %ebx
addl $-512, %edx
movl %edx, 1512(%esp)
cmpl $512, %edx
jae chacha_blocks_avx2_4
chacha_blocks_avx2_9:
movl 1504(%esp), %esi
vmovdqu 304(%esp), %xmm0
chacha_blocks_avx2_10:
cmpl $256, %edx
jb chacha_blocks_avx2_18
chacha_blocks_avx2_11:
movl $2, %eax
vpxor %ymm3, %ymm3, %ymm3
vinserti128 $1, %xmm0, %ymm0, %ymm5
vinserti128 $1, 592(%esp), %ymm3, %ymm7
vpaddq %ymm7, %ymm5, %ymm0
vmovd %eax, %xmm7
vmovdqu %ymm0, (%esp)
vbroadcasti128 560(%esp), %ymm1
vbroadcasti128 576(%esp), %ymm6
vinserti128 $1, %xmm7, %ymm7, %ymm5
vmovdqu %ymm1, 224(%esp)
vmovdqu %ymm1, 192(%esp)
vmovdqu %ymm6, 160(%esp)
vmovdqu %ymm1, 32(%esp)
vmovdqu %ymm6, 128(%esp)
vmovdqu 224(%esp), %ymm1
vpaddq %ymm5, %ymm0, %ymm7
vbroadcasti128 544(%esp), %ymm2
vmovdqa %ymm2, %ymm4
vmovdqu %ymm2, 320(%esp)
vmovdqu %ymm2, 64(%esp)
vmovdqu %ymm7, 96(%esp)
vmovdqu %ymm7, 352(%esp)
vmovdqu %ymm4, 384(%esp)
vmovdqu 192(%esp), %ymm2
movl 1516(%esp), %eax
vmovdqa %ymm0, %ymm3
vmovdqu 160(%esp), %ymm0
chacha_blocks_avx2_12:
vpaddd 384(%esp), %ymm1, %ymm4
vpaddd 320(%esp), %ymm2, %ymm7
vpxor %ymm4, %ymm3, %ymm5
vmovdqu 1568(%esp), %ymm3
vmovdqu %ymm7, 416(%esp)
vpxor 352(%esp), %ymm7, %ymm7
vpshufb %ymm3, %ymm5, %ymm5
vpshufb %ymm3, %ymm7, %ymm3
vpaddd %ymm5, %ymm6, %ymm6
vpaddd %ymm3, %ymm0, %ymm0
vpxor %ymm6, %ymm1, %ymm1
vpxor %ymm0, %ymm2, %ymm7
vpsrld $20, %ymm1, %ymm2
vpslld $12, %ymm1, %ymm1
vpor %ymm1, %ymm2, %ymm1
vpsrld $20, %ymm7, %ymm2
vpslld $12, %ymm7, %ymm7
vpaddd %ymm1, %ymm4, %ymm4
vpor %ymm7, %ymm2, %ymm2
vmovdqu %ymm4, 448(%esp)
vpxor %ymm4, %ymm5, %ymm5
vpaddd 416(%esp), %ymm2, %ymm7
vmovdqu 1536(%esp), %ymm4
vpxor %ymm7, %ymm3, %ymm3
vpshufd $147, %ymm7, %ymm7
vpshufb %ymm4, %ymm5, %ymm5
vpshufb %ymm4, %ymm3, %ymm4
vpaddd %ymm5, %ymm6, %ymm6
vpaddd %ymm4, %ymm0, %ymm3
vpshufd $78, %ymm5, %ymm5
vpshufd $78, %ymm4, %ymm4
vpxor %ymm6, %ymm1, %ymm0
vpxor %ymm3, %ymm2, %ymm2
vpshufd $57, %ymm6, %ymm6
vpshufd $57, %ymm3, %ymm3
vpsrld $25, %ymm0, %ymm1
vpslld $7, %ymm0, %ymm0
vpor %ymm0, %ymm1, %ymm1
vpsrld $25, %ymm2, %ymm0
vpslld $7, %ymm2, %ymm2
vpor %ymm2, %ymm0, %ymm0
vpshufd $147, 448(%esp), %ymm2
vpaddd %ymm0, %ymm7, %ymm7
vpaddd %ymm1, %ymm2, %ymm2
vpxor %ymm7, %ymm4, %ymm4
vmovdqu %ymm2, 480(%esp)
vpxor %ymm2, %ymm5, %ymm2
vmovdqu 1568(%esp), %ymm5
vpshufb %ymm5, %ymm2, %ymm2
vpshufb %ymm5, %ymm4, %ymm4
vpaddd %ymm2, %ymm6, %ymm6
vpaddd %ymm4, %ymm3, %ymm3
vpxor %ymm6, %ymm1, %ymm5
vpxor %ymm3, %ymm0, %ymm1
vpsrld $20, %ymm5, %ymm0
vpslld $12, %ymm5, %ymm5
vpor %ymm5, %ymm0, %ymm0
vpsrld $20, %ymm1, %ymm5
vpslld $12, %ymm1, %ymm1
vpor %ymm1, %ymm5, %ymm1
vpaddd 480(%esp), %ymm0, %ymm5
vmovdqu %ymm1, 512(%esp)
vpaddd %ymm1, %ymm7, %ymm1
vpxor %ymm5, %ymm2, %ymm7
vmovdqu 1536(%esp), %ymm2
vpxor %ymm1, %ymm4, %ymm4
vpshufb %ymm2, %ymm7, %ymm7
vpshufb %ymm2, %ymm4, %ymm4
vpshufd $57, %ymm5, %ymm2
vpaddd %ymm7, %ymm6, %ymm6
vpshufd $57, %ymm1, %ymm5
vpaddd %ymm4, %ymm3, %ymm1
vpshufd $78, %ymm4, %ymm4
vpshufd $78, %ymm7, %ymm3
vpxor %ymm6, %ymm0, %ymm7
vpshufd $147, %ymm1, %ymm0
vpshufd $147, %ymm6, %ymm6
vmovdqu %ymm4, 352(%esp)
vmovdqu %ymm2, 384(%esp)
vmovdqu %ymm5, 320(%esp)
vpxor 512(%esp), %ymm1, %ymm4
vpsrld $25, %ymm7, %ymm1
vpslld $7, %ymm7, %ymm2
vpsrld $25, %ymm4, %ymm5
vpor %ymm2, %ymm1, %ymm1
vpslld $7, %ymm4, %ymm2
vpor %ymm2, %ymm5, %ymm2
addl $-2, %eax
jne chacha_blocks_avx2_12
chacha_blocks_avx2_13:
vmovdqu %ymm0, 160(%esp)
vmovdqu %ymm2, 192(%esp)
vmovdqu %ymm1, 224(%esp)
vmovdqu (%esp), %ymm0
vmovdqu 32(%esp), %ymm1
vmovdqu 384(%esp), %ymm4
vmovdqu 64(%esp), %ymm2
vpaddd 128(%esp), %ymm6, %ymm6
vpaddd 224(%esp), %ymm1, %ymm5
vpaddd %ymm0, %ymm3, %ymm0
vpaddd %ymm2, %ymm4, %ymm4
vperm2i128 $32, %ymm5, %ymm4, %ymm7
vperm2i128 $32, %ymm0, %ymm6, %ymm3
vperm2i128 $49, %ymm5, %ymm4, %ymm4
vperm2i128 $49, %ymm0, %ymm6, %ymm0
testl %edi, %edi
je chacha_blocks_avx2_15
chacha_blocks_avx2_14:
vpxor (%edi), %ymm7, %ymm7
vpxor 32(%edi), %ymm3, %ymm3
vpxor 64(%edi), %ymm4, %ymm4
vpxor 96(%edi), %ymm0, %ymm0
chacha_blocks_avx2_15:
vmovdqu %ymm3, 32(%ebx)
vmovdqu %ymm4, 64(%ebx)
vmovdqu %ymm0, 96(%ebx)
vmovdqu %ymm7, (%ebx)
vpaddd 320(%esp), %ymm2, %ymm0
vpaddd 192(%esp), %ymm1, %ymm3
vmovdqu 128(%esp), %ymm1
vmovdqu 352(%esp), %ymm2
vpaddd 160(%esp), %ymm1, %ymm4
vpaddd 96(%esp), %ymm2, %ymm5
vperm2i128 $32, %ymm3, %ymm0, %ymm1
vperm2i128 $32, %ymm5, %ymm4, %ymm2
vperm2i128 $49, %ymm3, %ymm0, %ymm0
vperm2i128 $49, %ymm5, %ymm4, %ymm3
je chacha_blocks_avx2_17
chacha_blocks_avx2_16:
vpxor 128(%edi), %ymm1, %ymm1
vpxor 160(%edi), %ymm2, %ymm2
vpxor 192(%edi), %ymm0, %ymm0
vpxor 224(%edi), %ymm3, %ymm3
addl $256, %edi
chacha_blocks_avx2_17:
addl $4, 304(%esp)
vmovdqu %ymm0, 192(%ebx)
vmovdqu %ymm1, 128(%ebx)
vmovdqu %ymm2, 160(%ebx)
vmovdqu %ymm3, 224(%ebx)
adcl $0, 308(%esp)
addl $-256, %edx
vmovdqu 304(%esp), %xmm0
addl $256, %ebx
chacha_blocks_avx2_18:
cmpl $128, %edx
jb chacha_blocks_avx2_24
chacha_blocks_avx2_19:
vpxor %ymm7, %ymm7, %ymm7
vinserti128 $1, %xmm0, %ymm0, %ymm0
vinserti128 $1, 592(%esp), %ymm7, %ymm7
vpaddq %ymm7, %ymm0, %ymm7
vbroadcasti128 560(%esp), %ymm3
vbroadcasti128 576(%esp), %ymm2
vbroadcasti128 544(%esp), %ymm6
vmovdqu %ymm2, 32(%esp)
vmovdqu %ymm3, 64(%esp)
vmovdqu %ymm7, (%esp)
vmovdqu %ymm6, 96(%esp)
vmovdqa %ymm6, %ymm1
vmovdqa %ymm3, %ymm5
vmovdqa %ymm2, %ymm4
vmovdqa %ymm7, %ymm0
movl 1516(%esp), %eax
vmovdqu 1536(%esp), %ymm2
vmovdqu 1568(%esp), %ymm3
chacha_blocks_avx2_20:
vpaddd %ymm5, %ymm1, %ymm6
vpxor %ymm6, %ymm0, %ymm1
vpshufb %ymm3, %ymm1, %ymm0
vpaddd %ymm0, %ymm4, %ymm1
vpxor %ymm1, %ymm5, %ymm4
vpsrld $20, %ymm4, %ymm5
vpslld $12, %ymm4, %ymm7
vpor %ymm7, %ymm5, %ymm7
vpaddd %ymm7, %ymm6, %ymm5
vpxor %ymm5, %ymm0, %ymm0
vpshufd $147, %ymm5, %ymm5
vpshufb %ymm2, %ymm0, %ymm4
vpaddd %ymm4, %ymm1, %ymm6
vpshufd $78, %ymm4, %ymm4
vpxor %ymm6, %ymm7, %ymm1
vpshufd $57, %ymm6, %ymm6
vpsrld $25, %ymm1, %ymm0
vpslld $7, %ymm1, %ymm7
vpor %ymm7, %ymm0, %ymm0
vpaddd %ymm0, %ymm5, %ymm1
vpxor %ymm1, %ymm4, %ymm4
vpshufb %ymm3, %ymm4, %ymm7
vpaddd %ymm7, %ymm6, %ymm5
vpxor %ymm5, %ymm0, %ymm4
vpsrld $20, %ymm4, %ymm0
vpslld $12, %ymm4, %ymm6
vpor %ymm6, %ymm0, %ymm4
vpaddd %ymm4, %ymm1, %ymm0
vpxor %ymm0, %ymm7, %ymm1
vpshufb %ymm2, %ymm1, %ymm7
vpshufd $57, %ymm0, %ymm1
vpaddd %ymm7, %ymm5, %ymm5
vpshufd $78, %ymm7, %ymm0
vpxor %ymm5, %ymm4, %ymm6
vpshufd $147, %ymm5, %ymm4
vpsrld $25, %ymm6, %ymm5
vpslld $7, %ymm6, %ymm7
vpor %ymm7, %ymm5, %ymm5
addl $-2, %eax
jne chacha_blocks_avx2_20
chacha_blocks_avx2_21:
vmovdqu (%esp), %ymm7
vmovdqu 32(%esp), %ymm2
vmovdqu 64(%esp), %ymm3
vmovdqu 96(%esp), %ymm6
vpaddd %ymm7, %ymm0, %ymm0
vpaddd %ymm2, %ymm4, %ymm2
vpaddd %ymm3, %ymm5, %ymm3
vpaddd %ymm6, %ymm1, %ymm1
vperm2i128 $32, %ymm3, %ymm1, %ymm4
vperm2i128 $32, %ymm0, %ymm2, %ymm5
vperm2i128 $49, %ymm3, %ymm1, %ymm1
vperm2i128 $49, %ymm0, %ymm2, %ymm0
testl %edi, %edi
je chacha_blocks_avx2_23
chacha_blocks_avx2_22:
vpxor (%edi), %ymm4, %ymm4
vpxor 32(%edi), %ymm5, %ymm5
vpxor 64(%edi), %ymm1, %ymm1
vpxor 96(%edi), %ymm0, %ymm0
addl $128, %edi
chacha_blocks_avx2_23:
addl $2, 304(%esp)
vmovdqu %ymm0, 96(%ebx)
vmovdqu %ymm4, (%ebx)
vmovdqu %ymm5, 32(%ebx)
vmovdqu %ymm1, 64(%ebx)
adcl $0, 308(%esp)
addl $-128, %edx
vmovdqu 304(%esp), %xmm0
addl $128, %ebx
chacha_blocks_avx2_24:
testl %edx, %edx
jne chacha_blocks_avx2_26
chacha_blocks_avx2_25:
movl 8(%ebp), %ecx
movl 304(%esp), %eax
movl 308(%esp), %edx
movl %eax, 32(%ecx)
movl %edx, 36(%ecx)
vzeroupper
addl $3124, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret
chacha_blocks_avx2_26:
vmovdqu 1568(%esp), %ymm1
vmovdqu 1536(%esp), %ymm2
vmovdqu 576(%esp), %xmm7
vmovdqu 544(%esp), %xmm6
movl 304(%esp), %esi
movl 308(%esp), %ecx
vmovups %xmm1, 16(%esp)
vmovups %xmm2, (%esp)
vmovdqu 560(%esp), %xmm1
jmp chacha_blocks_avx2_27
chacha_blocks_avx2_43:
addl $-64, %edx
addl $64, %ebx
chacha_blocks_avx2_27:
cmpl $64, %edx
jae chacha_blocks_avx2_38
chacha_blocks_avx2_28:
testl %edi, %edi
je chacha_blocks_avx2_37
chacha_blocks_avx2_29:
testl %edx, %edx
jbe chacha_blocks_avx2_36
chacha_blocks_avx2_30:
movl %edx, %eax
shrl $1, %eax
movl %eax, 60(%esp)
testl %eax, %eax
jbe chacha_blocks_avx2_45
chacha_blocks_avx2_31:
movl %esi, 52(%esp)
xorl %eax, %eax
movl %edx, 1512(%esp)
movl %ebx, 56(%esp)
movl 60(%esp), %esi
chacha_blocks_avx2_32:
movzbl (%edi,%eax,2), %edx
movb %dl, 64(%esp,%eax,2)
movzbl 1(%edi,%eax,2), %ebx
movb %bl, 65(%esp,%eax,2)
incl %eax
cmpl %esi, %eax
jb chacha_blocks_avx2_32
chacha_blocks_avx2_33:
movl 52(%esp), %esi
lea 1(%eax,%eax), %eax
movl 1512(%esp), %edx
movl 56(%esp), %ebx
movl %eax, 48(%esp)
chacha_blocks_avx2_34:
lea -1(%eax), %eax
cmpl %edx, %eax
jae chacha_blocks_avx2_36
chacha_blocks_avx2_35:
movzbl (%eax,%edi), %eax
movl 48(%esp), %edi
movb %al, 63(%esp,%edi)
chacha_blocks_avx2_36:
lea 64(%esp), %edi
chacha_blocks_avx2_37:
movl %ebx, 1508(%esp)
lea 64(%esp), %ebx
chacha_blocks_avx2_38:
vmovdqu %xmm0, 32(%esp)
vmovdqa %xmm6, %xmm2
movl 1516(%esp), %eax
vmovdqa %xmm1, %xmm3
vmovups 16(%esp), %xmm1
vmovdqa %xmm7, %xmm4
vmovdqa %xmm0, %xmm5
vmovups (%esp), %xmm0
chacha_blocks_avx2_39:
vpaddd %xmm3, %xmm2, %xmm6
vpxor %xmm6, %xmm5, %xmm2
vpshufb %xmm1, %xmm2, %xmm5
vpaddd %xmm5, %xmm4, %xmm2
vpxor %xmm2, %xmm3, %xmm4
vpsrld $20, %xmm4, %xmm3
vpslld $12, %xmm4, %xmm7
vpxor %xmm7, %xmm3, %xmm7
vpaddd %xmm7, %xmm6, %xmm3
vpxor %xmm3, %xmm5, %xmm5
vpshufb %xmm0, %xmm5, %xmm4
vpaddd %xmm4, %xmm2, %xmm6
vpxor %xmm6, %xmm7, %xmm2
vpsrld $25, %xmm2, %xmm5
vpslld $7, %xmm2, %xmm7
vpshufd $147, %xmm3, %xmm3
vpxor %xmm7, %xmm5, %xmm5
vpshufd $78, %xmm4, %xmm4
vpaddd %xmm5, %xmm3, %xmm2
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm7
vpshufd $57, %xmm6, %xmm6
vpaddd %xmm7, %xmm6, %xmm3
vpxor %xmm3, %xmm5, %xmm4
vpsrld $20, %xmm4, %xmm5
vpslld $12, %xmm4, %xmm6
vpxor %xmm6, %xmm5, %xmm4
vpaddd %xmm4, %xmm2, %xmm5
vpxor %xmm5, %xmm7, %xmm2
vpshufb %xmm0, %xmm2, %xmm7
vpaddd %xmm7, %xmm3, %xmm3
vpxor %xmm3, %xmm4, %xmm6
vpshufd $57, %xmm5, %xmm2
vpshufd $78, %xmm7, %xmm5
vpslld $7, %xmm6, %xmm7
vpshufd $147, %xmm3, %xmm4
vpsrld $25, %xmm6, %xmm3
vpxor %xmm7, %xmm3, %xmm3
addl $-2, %eax
jne chacha_blocks_avx2_39
chacha_blocks_avx2_40:
vmovdqu 576(%esp), %xmm7
vmovdqu 560(%esp), %xmm1
vpaddd %xmm7, %xmm4, %xmm4
vmovdqu 544(%esp), %xmm6
vpaddd %xmm1, %xmm3, %xmm3
vmovdqu 32(%esp), %xmm0
vpaddd %xmm6, %xmm2, %xmm2
vpaddd %xmm0, %xmm5, %xmm5
testl %edi, %edi
je chacha_blocks_avx2_42
chacha_blocks_avx2_41:
vpxor (%edi), %xmm2, %xmm2
vpxor 16(%edi), %xmm3, %xmm3
vpxor 32(%edi), %xmm4, %xmm4
vpxor 48(%edi), %xmm5, %xmm5
addl $64, %edi
chacha_blocks_avx2_42:
addl $1, %esi
vmovdqu %xmm2, (%ebx)
vmovdqu %xmm3, 16(%ebx)
vmovdqu %xmm4, 32(%ebx)
vmovdqu %xmm5, 48(%ebx)
vpaddq 592(%esp), %xmm0, %xmm0
adcl $0, %ecx
cmpl $64, %edx
jbe chacha_blocks_avx2_46
jmp chacha_blocks_avx2_43
chacha_blocks_avx2_44:
vzeroupper
addl $3124, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret
chacha_blocks_avx2_45:
movl $1, %eax
movl %eax, 48(%esp)
jmp chacha_blocks_avx2_34
chacha_blocks_avx2_46:
movl %esi, 304(%esp)
movl %ecx, 308(%esp)
jae chacha_blocks_avx2_25
chacha_blocks_avx2_47:
testl %edx, %edx
jbe chacha_blocks_avx2_25
chacha_blocks_avx2_48:
movl 1508(%esp), %esi
xorl %ecx, %ecx
chacha_blocks_avx2_49:
movzbl (%ecx,%ebx), %eax
movb %al, (%ecx,%esi)
incl %ecx
cmpl %edx, %ecx
jb chacha_blocks_avx2_49
jmp chacha_blocks_avx2_25
chacha_blocks_avx2_51:
vmovdqu %ymm0, 256(%ebx)
vmovdqu 1248(%esp), %ymm0
vmovdqu %ymm6, 192(%ebx)
vmovdqu %ymm7, 320(%ebx)
vmovdqu 1280(%esp), %ymm3
vmovdqu 1216(%esp), %ymm6
vmovdqu %ymm4, 384(%ebx)
vmovdqu %ymm1, 448(%ebx)
vmovdqu 1696(%esp), %ymm4
vmovdqu %ymm3, (%ebx)
vmovdqu %ymm2, 64(%ebx)
vmovdqu %ymm5, 128(%ebx)
vmovdqu 1728(%esp), %ymm5
vpaddd 832(%esp), %ymm0, %ymm7
vpaddd 800(%esp), %ymm6, %ymm1
vpaddd 736(%esp), %ymm4, %ymm2
vpaddd 768(%esp), %ymm5, %ymm5
vmovdqu 1664(%esp), %ymm0
vmovdqu 1184(%esp), %ymm6
vpaddd 1152(%esp), %ymm0, %ymm3
vpaddd 1120(%esp), %ymm6, %ymm4
vmovdqu 1632(%esp), %ymm0
vpaddd 704(%esp), %ymm0, %ymm6
vmovdqu 1600(%esp), %ymm0
vpaddd 672(%esp), %ymm0, %ymm0
vmovdqu %ymm0, (%esp)
vpunpckldq %ymm1, %ymm7, %ymm0
vpunpckhdq %ymm1, %ymm7, %ymm1
vmovdqu (%esp), %ymm7
vmovdqu %ymm0, 32(%esp)
vpunpckldq %ymm2, %ymm5, %ymm0
vpunpckhdq %ymm2, %ymm5, %ymm2
vpunpckldq %ymm7, %ymm6, %ymm5
vpunpckhdq %ymm7, %ymm6, %ymm6
vmovdqu %ymm2, 64(%esp)
vpunpckldq %ymm4, %ymm3, %ymm2
vpunpckhdq %ymm4, %ymm3, %ymm4
vmovdqu 32(%esp), %ymm3
vpunpcklqdq %ymm0, %ymm3, %ymm7
vpunpckhqdq %ymm0, %ymm3, %ymm3
vpunpckhqdq %ymm5, %ymm2, %ymm0
vmovdqu %ymm7, 96(%esp)
vpunpcklqdq %ymm5, %ymm2, %ymm7
vmovdqu 64(%esp), %ymm5
vpunpcklqdq %ymm5, %ymm1, %ymm2
vpunpckhqdq %ymm5, %ymm1, %ymm1
vmovdqu 96(%esp), %ymm5
vmovdqu %ymm2, 128(%esp)
vpunpcklqdq %ymm6, %ymm4, %ymm2
vpunpckhqdq %ymm6, %ymm4, %ymm4
vperm2i128 $32, %ymm7, %ymm5, %ymm6
vmovdqu %ymm6, 160(%esp)
vperm2i128 $32, %ymm0, %ymm3, %ymm6
vperm2i128 $49, %ymm0, %ymm3, %ymm3
vmovdqu 128(%esp), %ymm0
vmovdqu %ymm3, 192(%esp)
vmovdqu %ymm6, 96(%ebx)
vperm2i128 $49, %ymm7, %ymm5, %ymm7
vperm2i128 $32, %ymm2, %ymm0, %ymm3
vperm2i128 $32, %ymm4, %ymm1, %ymm5
vperm2i128 $49, %ymm2, %ymm0, %ymm0
vperm2i128 $49, %ymm4, %ymm1, %ymm2
vmovdqu 160(%esp), %ymm1
vmovdqu %ymm3, 160(%ebx)
vmovdqu %ymm5, 224(%ebx)
vmovdqu %ymm7, 288(%ebx)
vmovdqu %ymm0, 416(%ebx)
vmovdqu %ymm1, 32(%ebx)
vmovdqu 192(%esp), %ymm1
vmovdqu %ymm2, 480(%ebx)
vmovdqu %ymm1, 352(%ebx)
jmp chacha_blocks_avx2_8

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __amd64__ && __AVX__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushq %rbx
pushq %rbp
movq %rsp, %rbp
andq $~63, %rsp
subq $512, %rsp
LOAD_VAR_PIC chacha_constants, %rax
vmovdqa 0(%rax), %xmm8
vmovdqa 16(%rax), %xmm6
vmovdqa 32(%rax), %xmm7
vmovdqu 0(%rdi), %xmm9
vmovdqu 16(%rdi), %xmm10
vmovdqu 32(%rdi), %xmm11
movq 32(%rdi), %rbx
movq 48(%rdi), %rax
movq $1, %r9
vmovdqa %xmm8, 0(%rsp)
vmovdqa %xmm9, 16(%rsp)
vmovdqa %xmm10, 32(%rsp)
vmovdqa %xmm11, 48(%rsp)
vmovdqa %xmm6, 80(%rsp)
vmovdqa %xmm7, 96(%rsp)
movq %rax, 64(%rsp)
cmp $128, %rcx
jb chacha_blocks_avx_below128_fixup
cmp $256, %rcx
jb chacha_blocks_avx_atleast128
chacha_blocks_avx_atleast256_fixup:
vpshufd $0x00, %xmm8, %xmm0
vpshufd $0x55, %xmm8, %xmm1
vpshufd $0xaa, %xmm8, %xmm2
vpshufd $0xff, %xmm8, %xmm3
vmovdqa %xmm0, 128(%rsp)
vmovdqa %xmm1, 144(%rsp)
vmovdqa %xmm2, 160(%rsp)
vmovdqa %xmm3, 176(%rsp)
vpshufd $0x00, %xmm9, %xmm0
vpshufd $0x55, %xmm9, %xmm1
vpshufd $0xaa, %xmm9, %xmm2
vpshufd $0xff, %xmm9, %xmm3
vmovdqa %xmm0, 192(%rsp)
vmovdqa %xmm1, 208(%rsp)
vmovdqa %xmm2, 224(%rsp)
vmovdqa %xmm3, 240(%rsp)
vpshufd $0x00, %xmm10, %xmm0
vpshufd $0x55, %xmm10, %xmm1
vpshufd $0xaa, %xmm10, %xmm2
vpshufd $0xff, %xmm10, %xmm3
vmovdqa %xmm0, 256(%rsp)
vmovdqa %xmm1, 272(%rsp)
vmovdqa %xmm2, 288(%rsp)
vmovdqa %xmm3, 304(%rsp)
vpshufd $0xaa, %xmm11, %xmm0
vpshufd $0xff, %xmm11, %xmm1
vmovdqa %xmm0, 352(%rsp)
vmovdqa %xmm1, 368(%rsp)
jmp chacha_blocks_avx_atleast256
.p2align 6,,63
nop
nop
nop
nop
nop
chacha_blocks_avx_atleast256:
movq %rbx, %rax
leaq 1(%rbx), %r8
leaq 2(%rbx), %r9
leaq 3(%rbx), %r10
movl %eax, 320(%rsp)
movl %r8d, 4+320(%rsp)
movl %r9d, 8+320(%rsp)
movl %r10d, 12+320(%rsp)
shrq $32, %rax
shrq $32, %r8
shrq $32, %r9
shrq $32, %r10
addq $4, %rbx
movl %eax, 336(%rsp)
movl %r8d, 4+336(%rsp)
movl %r9d, 8+336(%rsp)
movl %r10d, 12+336(%rsp)
movq 64(%rsp), %rax
vmovdqa 128(%rsp), %xmm0
vmovdqa 144(%rsp), %xmm1
vmovdqa 160(%rsp), %xmm2
vmovdqa 176(%rsp), %xmm3
vmovdqa 192(%rsp), %xmm4
vmovdqa 208(%rsp), %xmm5
vmovdqa 224(%rsp), %xmm6
vmovdqa 240(%rsp), %xmm7
vmovdqa 256(%rsp), %xmm8
vmovdqa 272(%rsp), %xmm9
vmovdqa 288(%rsp), %xmm10
vmovdqa 304(%rsp), %xmm11
vmovdqa 320(%rsp), %xmm12
vmovdqa 336(%rsp), %xmm13
vmovdqa 352(%rsp), %xmm14
vmovdqa 368(%rsp), %xmm15
chacha_blocks_avx_mainloop1:
vpaddd %xmm0, %xmm4, %xmm0
vpaddd %xmm1, %xmm5, %xmm1
vpxor %xmm12, %xmm0, %xmm12
vpxor %xmm13, %xmm1, %xmm13
vpaddd %xmm2, %xmm6, %xmm2
vpaddd %xmm3, %xmm7, %xmm3
vpxor %xmm14, %xmm2, %xmm14
vpxor %xmm15, %xmm3, %xmm15
vpshufb 80(%rsp), %xmm12, %xmm12
vpshufb 80(%rsp), %xmm13, %xmm13
vpaddd %xmm8, %xmm12, %xmm8
vpaddd %xmm9, %xmm13, %xmm9
vpshufb 80(%rsp), %xmm14, %xmm14
vpshufb 80(%rsp), %xmm15, %xmm15
vpaddd %xmm10, %xmm14, %xmm10
vpaddd %xmm11, %xmm15, %xmm11
vmovdqa %xmm12, 112(%rsp)
vpxor %xmm4, %xmm8, %xmm4
vpxor %xmm5, %xmm9, %xmm5
vpslld $ 12, %xmm4, %xmm12
vpsrld $20, %xmm4, %xmm4
vpxor %xmm4, %xmm12, %xmm4
vpslld $ 12, %xmm5, %xmm12
vpsrld $20, %xmm5, %xmm5
vpxor %xmm5, %xmm12, %xmm5
vpxor %xmm6, %xmm10, %xmm6
vpxor %xmm7, %xmm11, %xmm7
vpslld $ 12, %xmm6, %xmm12
vpsrld $20, %xmm6, %xmm6
vpxor %xmm6, %xmm12, %xmm6
vpslld $ 12, %xmm7, %xmm12
vpsrld $20, %xmm7, %xmm7
vpxor %xmm7, %xmm12, %xmm7
vpaddd %xmm0, %xmm4, %xmm0
vpaddd %xmm1, %xmm5, %xmm1
vpxor 112(%rsp), %xmm0, %xmm12
vpxor %xmm13, %xmm1, %xmm13
vpaddd %xmm2, %xmm6, %xmm2
vpaddd %xmm3, %xmm7, %xmm3
vpxor %xmm14, %xmm2, %xmm14
vpxor %xmm15, %xmm3, %xmm15
vpshufb 96(%rsp), %xmm12, %xmm12
vpshufb 96(%rsp), %xmm13, %xmm13
vpaddd %xmm8, %xmm12, %xmm8
vpaddd %xmm9, %xmm13, %xmm9
vpshufb 96(%rsp), %xmm14, %xmm14
vpshufb 96(%rsp), %xmm15, %xmm15
vpaddd %xmm10, %xmm14, %xmm10
vpaddd %xmm11, %xmm15, %xmm11
vmovdqa %xmm12, 112(%rsp)
vpxor %xmm4, %xmm8, %xmm4
vpxor %xmm5, %xmm9, %xmm5
vpslld $ 7, %xmm4, %xmm12
vpsrld $25, %xmm4, %xmm4
vpxor %xmm4, %xmm12, %xmm4
vpslld $ 7, %xmm5, %xmm12
vpsrld $25, %xmm5, %xmm5
vpxor %xmm5, %xmm12, %xmm5
vpxor %xmm6, %xmm10, %xmm6
vpxor %xmm7, %xmm11, %xmm7
vpslld $ 7, %xmm6, %xmm12
vpsrld $25, %xmm6, %xmm6
vpxor %xmm6, %xmm12, %xmm6
vpslld $ 7, %xmm7, %xmm12
vpsrld $25, %xmm7, %xmm7
vpxor %xmm7, %xmm12, %xmm7
vpaddd %xmm0, %xmm5, %xmm0
vpaddd %xmm1, %xmm6, %xmm1
vpxor %xmm15, %xmm0, %xmm15
vpxor 112(%rsp), %xmm1, %xmm12
vpaddd %xmm2, %xmm7, %xmm2
vpaddd %xmm3, %xmm4, %xmm3
vpxor %xmm13, %xmm2, %xmm13
vpxor %xmm14, %xmm3, %xmm14
vpshufb 80(%rsp), %xmm15, %xmm15
vpshufb 80(%rsp), %xmm12, %xmm12
vpaddd %xmm10, %xmm15, %xmm10
vpaddd %xmm11, %xmm12, %xmm11
vpshufb 80(%rsp), %xmm13, %xmm13
vpshufb 80(%rsp), %xmm14, %xmm14
vpaddd %xmm8, %xmm13, %xmm8
vpaddd %xmm9, %xmm14, %xmm9
vmovdqa %xmm15, 112(%rsp)
vpxor %xmm5, %xmm10, %xmm5
vpxor %xmm6, %xmm11, %xmm6
vpslld $ 12, %xmm5, %xmm15
vpsrld $20, %xmm5, %xmm5
vpxor %xmm5, %xmm15, %xmm5
vpslld $ 12, %xmm6, %xmm15
vpsrld $20, %xmm6, %xmm6
vpxor %xmm6, %xmm15, %xmm6
vpxor %xmm7, %xmm8, %xmm7
vpxor %xmm4, %xmm9, %xmm4
vpslld $ 12, %xmm7, %xmm15
vpsrld $20, %xmm7, %xmm7
vpxor %xmm7, %xmm15, %xmm7
vpslld $ 12, %xmm4, %xmm15
vpsrld $20, %xmm4, %xmm4
vpxor %xmm4, %xmm15, %xmm4
vpaddd %xmm0, %xmm5, %xmm0
vpaddd %xmm1, %xmm6, %xmm1
vpxor 112(%rsp), %xmm0, %xmm15
vpxor %xmm12, %xmm1, %xmm12
vpaddd %xmm2, %xmm7, %xmm2
vpaddd %xmm3, %xmm4, %xmm3
vpxor %xmm13, %xmm2, %xmm13
vpxor %xmm14, %xmm3, %xmm14
vpshufb 96(%rsp), %xmm15, %xmm15
vpshufb 96(%rsp), %xmm12, %xmm12
vpaddd %xmm10, %xmm15, %xmm10
vpaddd %xmm11, %xmm12, %xmm11
vpshufb 96(%rsp), %xmm13, %xmm13
vpshufb 96(%rsp), %xmm14, %xmm14
vpaddd %xmm8, %xmm13, %xmm8
vpaddd %xmm9, %xmm14, %xmm9
vmovdqa %xmm15, 112(%rsp)
vpxor %xmm5, %xmm10, %xmm5
vpxor %xmm6, %xmm11, %xmm6
vpslld $ 7, %xmm5, %xmm15
vpsrld $25, %xmm5, %xmm5
vpxor %xmm5, %xmm15, %xmm5
vpslld $ 7, %xmm6, %xmm15
vpsrld $25, %xmm6, %xmm6
vpxor %xmm6, %xmm15, %xmm6
vpxor %xmm7, %xmm8, %xmm7
vpxor %xmm4, %xmm9, %xmm4
vpslld $ 7, %xmm7, %xmm15
vpsrld $25, %xmm7, %xmm7
vpxor %xmm7, %xmm15, %xmm7
vpslld $ 7, %xmm4, %xmm15
vpsrld $25, %xmm4, %xmm4
vpxor %xmm4, %xmm15, %xmm4
vmovdqa 112(%rsp), %xmm15
subq $2, %rax
jnz chacha_blocks_avx_mainloop1
vpaddd 128(%rsp), %xmm0, %xmm0
vpaddd 144(%rsp), %xmm1, %xmm1
vpaddd 160(%rsp), %xmm2, %xmm2
vpaddd 176(%rsp), %xmm3, %xmm3
vpaddd 192(%rsp), %xmm4, %xmm4
vpaddd 208(%rsp), %xmm5, %xmm5
vpaddd 224(%rsp), %xmm6, %xmm6
vpaddd 240(%rsp), %xmm7, %xmm7
vpaddd 256(%rsp), %xmm8, %xmm8
vpaddd 272(%rsp), %xmm9, %xmm9
vpaddd 288(%rsp), %xmm10, %xmm10
vpaddd 304(%rsp), %xmm11, %xmm11
vpaddd 320(%rsp), %xmm12, %xmm12
vpaddd 336(%rsp), %xmm13, %xmm13
vpaddd 352(%rsp), %xmm14, %xmm14
vpaddd 368(%rsp), %xmm15, %xmm15
vmovdqa %xmm8, 384(%rsp)
vmovdqa %xmm9, 400(%rsp)
vmovdqa %xmm10, 416(%rsp)
vmovdqa %xmm11, 432(%rsp)
vmovdqa %xmm12, 448(%rsp)
vmovdqa %xmm13, 464(%rsp)
vmovdqa %xmm14, 480(%rsp)
vmovdqa %xmm15, 496(%rsp)
vpunpckldq %xmm1, %xmm0, %xmm8
vpunpckldq %xmm3, %xmm2, %xmm9
vpunpckhdq %xmm1, %xmm0, %xmm12
vpunpckhdq %xmm3, %xmm2, %xmm13
vpunpckldq %xmm5, %xmm4, %xmm10
vpunpckldq %xmm7, %xmm6, %xmm11
vpunpckhdq %xmm5, %xmm4, %xmm14
vpunpckhdq %xmm7, %xmm6, %xmm15
vpunpcklqdq %xmm9, %xmm8, %xmm0
vpunpcklqdq %xmm11, %xmm10, %xmm1
vpunpckhqdq %xmm9, %xmm8, %xmm2
vpunpckhqdq %xmm11, %xmm10, %xmm3
vpunpcklqdq %xmm13, %xmm12, %xmm4
vpunpcklqdq %xmm15, %xmm14, %xmm5
vpunpckhqdq %xmm13, %xmm12, %xmm6
vpunpckhqdq %xmm15, %xmm14, %xmm7
andq %rsi, %rsi
jz chacha_blocks_avx_noinput1
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 64(%rsi), %xmm2, %xmm2
vpxor 80(%rsi), %xmm3, %xmm3
vpxor 128(%rsi), %xmm4, %xmm4
vpxor 144(%rsi), %xmm5, %xmm5
vpxor 192(%rsi), %xmm6, %xmm6
vpxor 208(%rsi), %xmm7, %xmm7
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 64(%rdx)
vmovdqu %xmm3, 80(%rdx)
vmovdqu %xmm4, 128(%rdx)
vmovdqu %xmm5, 144(%rdx)
vmovdqu %xmm6, 192(%rdx)
vmovdqu %xmm7, 208(%rdx)
vmovdqa 384(%rsp), %xmm0
vmovdqa 400(%rsp), %xmm1
vmovdqa 416(%rsp), %xmm2
vmovdqa 432(%rsp), %xmm3
vmovdqa 448(%rsp), %xmm4
vmovdqa 464(%rsp), %xmm5
vmovdqa 480(%rsp), %xmm6
vmovdqa 496(%rsp), %xmm7
vpunpckldq %xmm1, %xmm0, %xmm8
vpunpckldq %xmm3, %xmm2, %xmm9
vpunpckhdq %xmm1, %xmm0, %xmm12
vpunpckhdq %xmm3, %xmm2, %xmm13
vpunpckldq %xmm5, %xmm4, %xmm10
vpunpckldq %xmm7, %xmm6, %xmm11
vpunpckhdq %xmm5, %xmm4, %xmm14
vpunpckhdq %xmm7, %xmm6, %xmm15
vpunpcklqdq %xmm9, %xmm8, %xmm0
vpunpcklqdq %xmm11, %xmm10, %xmm1
vpunpckhqdq %xmm9, %xmm8, %xmm2
vpunpckhqdq %xmm11, %xmm10, %xmm3
vpunpcklqdq %xmm13, %xmm12, %xmm4
vpunpcklqdq %xmm15, %xmm14, %xmm5
vpunpckhqdq %xmm13, %xmm12, %xmm6
vpunpckhqdq %xmm15, %xmm14, %xmm7
vpxor 32(%rsi), %xmm0, %xmm0
vpxor 48(%rsi), %xmm1, %xmm1
vpxor 96(%rsi), %xmm2, %xmm2
vpxor 112(%rsi), %xmm3, %xmm3
vpxor 160(%rsi), %xmm4, %xmm4
vpxor 176(%rsi), %xmm5, %xmm5
vpxor 224(%rsi), %xmm6, %xmm6
vpxor 240(%rsi), %xmm7, %xmm7
vmovdqu %xmm0, 32(%rdx)
vmovdqu %xmm1, 48(%rdx)
vmovdqu %xmm2, 96(%rdx)
vmovdqu %xmm3, 112(%rdx)
vmovdqu %xmm4, 160(%rdx)
vmovdqu %xmm5, 176(%rdx)
vmovdqu %xmm6, 224(%rdx)
vmovdqu %xmm7, 240(%rdx)
addq $256, %rsi
jmp chacha_blocks_avx_mainloop1_cont
chacha_blocks_avx_noinput1:
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 64(%rdx)
vmovdqu %xmm3, 80(%rdx)
vmovdqu %xmm4, 128(%rdx)
vmovdqu %xmm5, 144(%rdx)
vmovdqu %xmm6, 192(%rdx)
vmovdqu %xmm7, 208(%rdx)
vmovdqa 384(%rsp), %xmm0
vmovdqa 400(%rsp), %xmm1
vmovdqa 416(%rsp), %xmm2
vmovdqa 432(%rsp), %xmm3
vmovdqa 448(%rsp), %xmm4
vmovdqa 464(%rsp), %xmm5
vmovdqa 480(%rsp), %xmm6
vmovdqa 496(%rsp), %xmm7
vpunpckldq %xmm1, %xmm0, %xmm8
vpunpckldq %xmm3, %xmm2, %xmm9
vpunpckhdq %xmm1, %xmm0, %xmm12
vpunpckhdq %xmm3, %xmm2, %xmm13
vpunpckldq %xmm5, %xmm4, %xmm10
vpunpckldq %xmm7, %xmm6, %xmm11
vpunpckhdq %xmm5, %xmm4, %xmm14
vpunpckhdq %xmm7, %xmm6, %xmm15
vpunpcklqdq %xmm9, %xmm8, %xmm0
vpunpcklqdq %xmm11, %xmm10, %xmm1
vpunpckhqdq %xmm9, %xmm8, %xmm2
vpunpckhqdq %xmm11, %xmm10, %xmm3
vpunpcklqdq %xmm13, %xmm12, %xmm4
vpunpcklqdq %xmm15, %xmm14, %xmm5
vpunpckhqdq %xmm13, %xmm12, %xmm6
vpunpckhqdq %xmm15, %xmm14, %xmm7
vmovdqu %xmm0, 32(%rdx)
vmovdqu %xmm1, 48(%rdx)
vmovdqu %xmm2, 96(%rdx)
vmovdqu %xmm3, 112(%rdx)
vmovdqu %xmm4, 160(%rdx)
vmovdqu %xmm5, 176(%rdx)
vmovdqu %xmm6, 224(%rdx)
vmovdqu %xmm7, 240(%rdx)
chacha_blocks_avx_mainloop1_cont:
addq $256, %rdx
subq $256, %rcx
cmp $256, %rcx
jae chacha_blocks_avx_atleast256
movq %rbx, 48(%rsp)
vmovdqa 80(%rsp), %xmm6
vmovdqa 96(%rsp), %xmm7
vmovdqa 0(%rsp), %xmm8
vmovdqa 16(%rsp), %xmm9
vmovdqa 32(%rsp), %xmm10
vmovdqa 48(%rsp), %xmm11
movq $1, %r9
cmp $128, %rcx
jb chacha_blocks_avx_below128_fixup
chacha_blocks_avx_atleast128:
vmovd %r9, %xmm5
vmovdqa %xmm8, %xmm0
vmovdqa %xmm9, %xmm1
vmovdqa %xmm10, %xmm2
vmovdqa %xmm11, %xmm3
vpaddq %xmm5, %xmm11, %xmm11
vmovdqa %xmm8, 384(%rsp)
vmovdqa %xmm9, 400(%rsp)
vmovdqa %xmm10, 416(%rsp)
vmovdqa %xmm3, 432(%rsp)
vmovdqa %xmm11, 448(%rsp)
movq 64(%rsp), %rax
chacha_blocks_avx_mainloop2:
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vpshufb %xmm6, %xmm3, %xmm3
vpshufb %xmm6, %xmm11, %xmm11
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vpslld $ 12, %xmm1, %xmm4
vpsrld $20, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpslld $ 12, %xmm9, %xmm5
vpsrld $20, %xmm9, %xmm9
vpxor %xmm9, %xmm5, %xmm9
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vpshufb %xmm7, %xmm3, %xmm3
vpshufb %xmm7, %xmm11, %xmm11
vpshufd $0x93, %xmm0, %xmm0
vpshufd $0x93, %xmm8, %xmm8
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x4e, %xmm11, %xmm11
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vpshufd $0x39, %xmm2, %xmm2
vpshufd $0x39, %xmm10, %xmm10
vpslld $ 7, %xmm1, %xmm4
vpsrld $25, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpslld $ 7, %xmm9, %xmm5
vpsrld $25, %xmm9, %xmm9
vpxor %xmm9, %xmm5, %xmm9
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vpshufb %xmm6, %xmm3, %xmm3
vpshufb %xmm6, %xmm11, %xmm11
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vpslld $ 12, %xmm1, %xmm4
vpsrld $20, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpslld $ 12, %xmm9, %xmm5
vpsrld $20, %xmm9, %xmm9
vpxor %xmm9, %xmm5, %xmm9
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vpshufb %xmm7, %xmm3, %xmm3
vpshufb %xmm7, %xmm11, %xmm11
vpshufd $0x39, %xmm0, %xmm0
vpshufd $0x39, %xmm8, %xmm8
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x4e, %xmm11, %xmm11
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vpshufd $0x93, %xmm2, %xmm2
vpshufd $0x93, %xmm10, %xmm10
vpslld $ 7, %xmm1, %xmm4
vpsrld $25, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpslld $ 7, %xmm9, %xmm5
vpsrld $25, %xmm9, %xmm9
vpxor %xmm9, %xmm5, %xmm9
subq $2, %rax
jnz chacha_blocks_avx_mainloop2
vmovdqa 384(%rsp), %xmm12
vmovdqa 400(%rsp), %xmm13
vmovdqa 416(%rsp), %xmm14
vmovdqa 432(%rsp), %xmm15
vmovdqa 448(%rsp), %xmm5
vpaddd %xmm12, %xmm0, %xmm0
vpaddd %xmm13, %xmm1, %xmm1
vpaddd %xmm14, %xmm2, %xmm2
vpaddd %xmm15, %xmm3, %xmm3
vpaddd %xmm12, %xmm8, %xmm8
vpaddd %xmm13, %xmm9, %xmm9
vpaddd %xmm14, %xmm10, %xmm10
vpaddd %xmm5, %xmm11, %xmm11
andq %rsi, %rsi
jz chacha_blocks_avx_noinput2
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 32(%rsi), %xmm2, %xmm2
vpxor 48(%rsi), %xmm3, %xmm3
vpxor 64(%rsi), %xmm8, %xmm8
vpxor 80(%rsi), %xmm9, %xmm9
vpxor 96(%rsi), %xmm10, %xmm10
vpxor 112(%rsi), %xmm11, %xmm11
addq $128, %rsi
chacha_blocks_avx_noinput2:
addq $2, %rbx
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 32(%rdx)
vmovdqu %xmm3, 48(%rdx)
vmovdqu %xmm8, 64(%rdx)
vmovdqu %xmm9, 80(%rdx)
vmovdqu %xmm10, 96(%rdx)
vmovdqu %xmm11, 112(%rdx)
addq $128, %rdx
subq $128, %rcx
movq %rbx, 48(%rsp)
vmovdqa 80(%rsp), %xmm6
vmovdqa 96(%rsp), %xmm7
vmovdqa 0(%rsp), %xmm8
vmovdqa 16(%rsp), %xmm9
vmovdqa 32(%rsp), %xmm10
vmovdqa 48(%rsp), %xmm11
chacha_blocks_avx_below128_fixup:
movq $1, %r9
vmovd %r9, %xmm5
chacha_blocks_avx_below128:
andq %rcx, %rcx
jz chacha_blocks_avx_done
cmpq $64, %rcx
jae chacha_blocks_avx_above63
movq %rdx, %r9
andq %rsi, %rsi
jz chacha_blocks_avx_noinput3
movq %rcx, %r10
movq %rsp, %rdx
addq %r10, %rsi
addq %r10, %rdx
negq %r10
chacha_blocks_avx_copyinput:
movb (%rsi, %r10), %al
movb %al, (%rdx, %r10)
incq %r10
jnz chacha_blocks_avx_copyinput
movq %rsp, %rsi
chacha_blocks_avx_noinput3:
movq %rsp, %rdx
chacha_blocks_avx_above63:
vmovdqa %xmm8, %xmm0
vmovdqa %xmm9, %xmm1
vmovdqa %xmm10, %xmm2
vmovdqa %xmm11, %xmm3
movq 64(%rsp), %rax
chacha_blocks_avx_mainloop3:
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm6, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vpslld $12, %xmm1, %xmm4
vpsrld $20, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm7, %xmm3, %xmm3
vpshufd $0x93, %xmm0, %xmm0
vpaddd %xmm2, %xmm3, %xmm2
vpshufd $0x4e, %xmm3, %xmm3
vpxor %xmm1, %xmm2, %xmm1
vpshufd $0x39, %xmm2, %xmm2
vpslld $7, %xmm1, %xmm4
vpsrld $25, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm6, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vpslld $12, %xmm1, %xmm4
vpsrld $20, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vpshufb %xmm7, %xmm3, %xmm3
vpshufd $0x39, %xmm0, %xmm0
vpaddd %xmm2, %xmm3, %xmm2
vpshufd $0x4e, %xmm3, %xmm3
vpxor %xmm1, %xmm2, %xmm1
vpshufd $0x93, %xmm2, %xmm2
vpslld $7, %xmm1, %xmm4
vpsrld $25, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm1
subq $2, %rax
jnz chacha_blocks_avx_mainloop3
vpaddd %xmm0, %xmm8, %xmm0
vpaddd %xmm1, %xmm9, %xmm1
vpaddd %xmm2, %xmm10, %xmm2
vpaddd %xmm3, %xmm11, %xmm3
andq %rsi, %rsi
jz chacha_blocks_avx_noinput4
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 32(%rsi), %xmm2, %xmm2
vpxor 48(%rsi), %xmm3, %xmm3
addq $64, %rsi
chacha_blocks_avx_noinput4:
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 32(%rdx)
vmovdqu %xmm3, 48(%rdx)
vpaddq %xmm11, %xmm5, %xmm11
addq $1, %rbx
cmpq $64, %rcx
jbe chacha_blocks_avx_mainloop3_finishup
addq $64, %rdx
subq $64, %rcx
jmp chacha_blocks_avx_below128
chacha_blocks_avx_mainloop3_finishup:
cmpq $64, %rcx
je chacha_blocks_avx_done
addq %rcx, %r9
addq %rcx, %rdx
negq %rcx
chacha_blocks_avx_copyoutput:
movb (%rdx, %rcx), %al
movb %al, (%r9, %rcx)
incq %rcx
jnz chacha_blocks_avx_copyoutput
chacha_blocks_avx_done:
movq %rbx, 32(%rdi)
movq %rbp, %rsp
popq %rbp
popq %rbx
ret

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __i386__ && __AVX__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushl %ebp
movl %esp, %ebp
andl $~63, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $1268, %esp
movl $1, %ecx
LOAD_VAR_PIC chacha_constants, %esi
movl 16(%ebp), %edx
movl 20(%ebp), %ebx
vmovd %ecx, %xmm2
vmovdqu 16(%esi), %xmm0
vmovdqu 32(%esi), %xmm1
movl 12(%ebp), %eax
vmovdqu %xmm0, 448(%esp)
vmovdqu %xmm1, 432(%esp)
vmovdqu %xmm2, 96(%esp)
movl %edx, 416(%esp)
testl %ebx, %ebx
je chacha_blocks_avx_36
chacha_blocks_avx_2:
movl 8(%ebp), %ecx
vmovdqu 0(%esi), %xmm0
vmovdqu (%ecx), %xmm1
vmovdqu 16(%ecx), %xmm2
movl 48(%ecx), %edi
vmovdqu %xmm0, 48(%esp)
movl %edi, 424(%esp)
vmovdqu %xmm1, 64(%esp)
vmovdqu %xmm2, 80(%esp)
vmovdqu 32(%ecx), %xmm0
cmpl $256, %ebx
jb chacha_blocks_avx_10
chacha_blocks_avx_3:
vmovdqu 64(%esp), %xmm7
vpshufd $255, %xmm7, %xmm1
vmovdqu %xmm1, 208(%esp)
vmovdqu 80(%esp), %xmm1
vmovdqu 48(%esp), %xmm4
vpshufd $0, %xmm7, %xmm2
vmovdqu %xmm2, 240(%esp)
vpshufd $85, %xmm7, %xmm3
vpshufd $170, %xmm7, %xmm2
vpshufd $0, %xmm1, %xmm7
vmovdqu %xmm7, 192(%esp)
vpshufd $85, %xmm1, %xmm7
vpshufd $85, %xmm4, %xmm5
vmovdqu %xmm7, 176(%esp)
vpshufd $170, %xmm1, %xmm7
vpshufd $255, %xmm1, %xmm1
vpshufd $0, %xmm4, %xmm6
vmovdqu %xmm5, 224(%esp)
vpshufd $170, %xmm4, %xmm5
vpshufd $255, %xmm4, %xmm4
vmovdqu %xmm1, 144(%esp)
vpshufd $170, %xmm0, %xmm1
vpshufd $255, %xmm0, %xmm0
movl 32(%ecx), %edi
movl 36(%ecx), %esi
vmovdqu %xmm7, 160(%esp)
vmovdqu %xmm1, 128(%esp)
vmovdqu %xmm0, 256(%esp)
vmovdqu %xmm2, 336(%esp)
vmovdqu %xmm3, 320(%esp)
vmovdqu %xmm4, 304(%esp)
vmovdqu %xmm5, 288(%esp)
vmovdqu %xmm6, 272(%esp)
movl %ebx, 420(%esp)
chacha_blocks_avx_4:
movl %edi, %ecx
movl %esi, %ebx
addl $1, %ecx
movl %ecx, 36(%esp)
movl %edi, %ecx
adcl $0, %ebx
addl $2, %ecx
movl %ebx, 116(%esp)
movl %esi, %ebx
movl %ecx, 40(%esp)
movl %edi, %ecx
adcl $0, %ebx
addl $3, %ecx
movl %edi, 32(%esp)
movl %ecx, 44(%esp)
vmovdqu 32(%esp), %xmm4
vmovdqu 320(%esp), %xmm7
vmovdqu 240(%esp), %xmm1
movl %ebx, 120(%esp)
movl %esi, %ebx
vmovdqu %xmm4, 368(%esp)
adcl $0, %ebx
vmovdqu %xmm4, 464(%esp)
addl $4, %edi
vmovdqu 304(%esp), %xmm0
vmovdqu 128(%esp), %xmm4
vmovdqu %xmm7, 560(%esp)
vmovdqu %xmm1, 384(%esp)
vmovdqu 160(%esp), %xmm7
vmovdqu 208(%esp), %xmm1
movl %esi, 112(%esp)
adcl $0, %esi
movl %ebx, 124(%esp)
vmovdqu %xmm0, 576(%esp)
vmovdqu %xmm4, 480(%esp)
vmovdqu 272(%esp), %xmm5
vmovdqu 336(%esp), %xmm0
vmovdqu 256(%esp), %xmm4
vmovdqu %xmm7, 528(%esp)
vmovdqu 112(%esp), %xmm6
vmovdqu 224(%esp), %xmm3
vmovdqu 288(%esp), %xmm2
vmovdqu 144(%esp), %xmm7
vmovdqu %xmm1, 592(%esp)
vmovdqu %xmm0, 544(%esp)
vmovdqu %xmm4, 496(%esp)
vmovdqu %xmm5, 608(%esp)
vmovdqu %xmm6, 352(%esp)
vmovdqu 192(%esp), %xmm1
vmovdqu 176(%esp), %xmm0
movl 424(%esp), %ecx
vmovdqu 592(%esp), %xmm5
vmovdqu 384(%esp), %xmm4
vmovdqu %xmm7, 512(%esp)
vmovdqu %xmm2, 640(%esp)
vmovdqu %xmm3, 624(%esp)
jmp chacha_blocks_avx_5
.p2align 5
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
chacha_blocks_avx_5:
vpaddd 608(%esp), %xmm4, %xmm2
vmovdqu 560(%esp), %xmm7
vpxor 464(%esp), %xmm2, %xmm3
vmovdqu %xmm2, 656(%esp)
vpaddd 624(%esp), %xmm7, %xmm7
vmovdqu 448(%esp), %xmm2
vpxor %xmm7, %xmm6, %xmm6
vpshufb %xmm2, %xmm3, %xmm3
vpshufb %xmm2, %xmm6, %xmm6
vmovdqu %xmm7, 672(%esp)
vpaddd %xmm3, %xmm1, %xmm1
vmovdqu 544(%esp), %xmm7
vpaddd %xmm6, %xmm0, %xmm0
vpaddd 640(%esp), %xmm7, %xmm7
vpxor %xmm1, %xmm4, %xmm4
vmovdqu %xmm5, 592(%esp)
vpaddd 576(%esp), %xmm5, %xmm5
vmovdqu %xmm7, 688(%esp)
vpxor 480(%esp), %xmm7, %xmm7
vmovdqu %xmm5, 704(%esp)
vpxor 496(%esp), %xmm5, %xmm5
vpshufb %xmm2, %xmm7, %xmm7
vpshufb %xmm2, %xmm5, %xmm5
vmovdqu %xmm0, 752(%esp)
vpslld $12, %xmm4, %xmm2
vmovdqu %xmm1, 736(%esp)
vpsrld $20, %xmm4, %xmm1
vpxor 560(%esp), %xmm0, %xmm0
vpor %xmm2, %xmm1, %xmm4
vpsrld $20, %xmm0, %xmm1
vpslld $12, %xmm0, %xmm0
vpor %xmm0, %xmm1, %xmm1
vpaddd 528(%esp), %xmm7, %xmm0
vpaddd 512(%esp), %xmm5, %xmm2
vmovdqu %xmm5, 720(%esp)
vpxor 544(%esp), %xmm0, %xmm5
vmovdqu %xmm0, 784(%esp)
vmovdqu %xmm2, 800(%esp)
vpxor 592(%esp), %xmm2, %xmm0
vpsrld $20, %xmm5, %xmm2
vpslld $12, %xmm5, %xmm5
vpor %xmm5, %xmm2, %xmm2
vpsrld $20, %xmm0, %xmm5
vpslld $12, %xmm0, %xmm0
vpor %xmm0, %xmm5, %xmm0
vpaddd 656(%esp), %xmm4, %xmm5
vmovdqu %xmm5, 832(%esp)
vpxor %xmm5, %xmm3, %xmm5
vmovdqu 432(%esp), %xmm3
vpshufb %xmm3, %xmm5, %xmm5
vmovdqu %xmm4, 768(%esp)
vpaddd 672(%esp), %xmm1, %xmm4
vmovdqu %xmm5, 864(%esp)
vpxor %xmm4, %xmm6, %xmm6
vmovdqu %xmm4, 848(%esp)
vpaddd 704(%esp), %xmm0, %xmm5
vpaddd 688(%esp), %xmm2, %xmm4
vpshufb %xmm3, %xmm6, %xmm6
vmovdqu %xmm5, 912(%esp)
vpxor %xmm4, %xmm7, %xmm7
vpxor 720(%esp), %xmm5, %xmm5
vmovdqu %xmm4, 896(%esp)
vpshufb %xmm3, %xmm7, %xmm4
vpshufb %xmm3, %xmm5, %xmm5
vmovdqu 864(%esp), %xmm3
vpaddd 736(%esp), %xmm3, %xmm7
vmovdqu %xmm2, 816(%esp)
vmovdqu %xmm6, 880(%esp)
vpaddd 752(%esp), %xmm6, %xmm6
vpxor 768(%esp), %xmm7, %xmm2
vmovdqu %xmm6, 960(%esp)
vpxor %xmm6, %xmm1, %xmm6
vpsrld $25, %xmm2, %xmm1
vpslld $7, %xmm2, %xmm3
vmovdqu %xmm4, 928(%esp)
vmovdqu %xmm7, 944(%esp)
vpor %xmm3, %xmm1, %xmm7
vpaddd 784(%esp), %xmm4, %xmm4
vpsrld $25, %xmm6, %xmm1
vpslld $7, %xmm6, %xmm6
vpaddd 800(%esp), %xmm5, %xmm3
vpor %xmm6, %xmm1, %xmm2
vpxor 816(%esp), %xmm4, %xmm1
vpxor %xmm3, %xmm0, %xmm0
vpsrld $25, %xmm1, %xmm6
vpslld $7, %xmm1, %xmm1
vmovdqu %xmm3, 1008(%esp)
vpsrld $25, %xmm0, %xmm3
vpslld $7, %xmm0, %xmm0
vpor %xmm1, %xmm6, %xmm1
vpor %xmm0, %xmm3, %xmm6
vpaddd 832(%esp), %xmm2, %xmm0
vmovdqu %xmm2, 992(%esp)
vpxor %xmm0, %xmm5, %xmm3
vpaddd 848(%esp), %xmm1, %xmm2
vmovdqu 448(%esp), %xmm5
vmovdqu %xmm2, 1056(%esp)
vmovdqu %xmm0, 1040(%esp)
vpshufb %xmm5, %xmm3, %xmm0
vpxor 864(%esp), %xmm2, %xmm2
vpaddd %xmm0, %xmm4, %xmm4
vpshufb %xmm5, %xmm2, %xmm2
vpaddd 896(%esp), %xmm6, %xmm3
vmovdqu %xmm6, 1024(%esp)
vpaddd 912(%esp), %xmm7, %xmm6
vmovdqu %xmm7, 976(%esp)
vpxor 880(%esp), %xmm3, %xmm7
vmovdqu %xmm6, 1088(%esp)
vpxor 928(%esp), %xmm6, %xmm6
vpshufb %xmm5, %xmm7, %xmm7
vmovdqu %xmm3, 1072(%esp)
vpshufb %xmm5, %xmm6, %xmm3
vmovdqu %xmm4, 1120(%esp)
vpaddd 1008(%esp), %xmm2, %xmm5
vpxor 992(%esp), %xmm4, %xmm4
vpxor %xmm5, %xmm1, %xmm1
vmovdqu %xmm5, 1136(%esp)
vpsrld $20, %xmm4, %xmm6
vpslld $12, %xmm4, %xmm5
vpor %xmm5, %xmm6, %xmm4
vpsrld $20, %xmm1, %xmm6
vpslld $12, %xmm1, %xmm1
vpaddd 944(%esp), %xmm7, %xmm5
vpor %xmm1, %xmm6, %xmm1
vpaddd 960(%esp), %xmm3, %xmm6
vmovdqu %xmm3, 1104(%esp)
vpxor 1024(%esp), %xmm5, %xmm3
vmovdqu %xmm5, 1168(%esp)
vmovdqu %xmm6, 1184(%esp)
vpxor 976(%esp), %xmm6, %xmm5
vpsrld $20, %xmm3, %xmm6
vpslld $12, %xmm3, %xmm3
vpor %xmm3, %xmm6, %xmm6
vpsrld $20, %xmm5, %xmm3
vpslld $12, %xmm5, %xmm5
vmovdqu %xmm4, 1152(%esp)
vpor %xmm5, %xmm3, %xmm5
vpaddd 1040(%esp), %xmm4, %xmm4
vpaddd 1056(%esp), %xmm1, %xmm3
vmovdqu %xmm4, 608(%esp)
vpxor %xmm4, %xmm0, %xmm4
vmovdqu 432(%esp), %xmm0
vpxor %xmm3, %xmm2, %xmm2
vpshufb %xmm0, %xmm4, %xmm4
vpshufb %xmm0, %xmm2, %xmm2
vmovdqu %xmm6, 1200(%esp)
vpaddd 1072(%esp), %xmm6, %xmm6
vmovdqu %xmm3, 624(%esp)
vpxor %xmm6, %xmm7, %xmm7
vpaddd 1088(%esp), %xmm5, %xmm3
vmovdqu %xmm6, 640(%esp)
vpshufb %xmm0, %xmm7, %xmm6
vpxor 1104(%esp), %xmm3, %xmm7
vmovdqu %xmm2, 464(%esp)
vmovdqu %xmm3, 576(%esp)
vpshufb %xmm0, %xmm7, %xmm0
vpaddd 1120(%esp), %xmm4, %xmm3
vpaddd 1136(%esp), %xmm2, %xmm2
vmovdqu %xmm4, 496(%esp)
vpxor %xmm2, %xmm1, %xmm1
vpxor 1152(%esp), %xmm3, %xmm4
vmovdqu %xmm2, 512(%esp)
vpsrld $25, %xmm4, %xmm7
vpslld $7, %xmm4, %xmm2
vpsrld $25, %xmm1, %xmm4
vpslld $7, %xmm1, %xmm1
vpor %xmm1, %xmm4, %xmm1
vmovdqu %xmm0, 480(%esp)
vmovdqu %xmm1, 544(%esp)
vpaddd 1168(%esp), %xmm6, %xmm1
vpaddd 1184(%esp), %xmm0, %xmm0
vmovdqu %xmm3, 528(%esp)
vpor %xmm2, %xmm7, %xmm3
vpxor 1200(%esp), %xmm1, %xmm2
vpxor %xmm0, %xmm5, %xmm7
vmovdqu %xmm3, 560(%esp)
vpsrld $25, %xmm2, %xmm5
vpslld $7, %xmm2, %xmm2
vpsrld $25, %xmm7, %xmm3
vpslld $7, %xmm7, %xmm4
vpor %xmm2, %xmm5, %xmm5
vpor %xmm4, %xmm3, %xmm4
addl $-2, %ecx
jne chacha_blocks_avx_5
chacha_blocks_avx_6:
vmovdqu 624(%esp), %xmm3
vpaddd 224(%esp), %xmm3, %xmm3
vmovdqu %xmm5, 592(%esp)
vmovdqu %xmm4, 384(%esp)
vmovdqu 640(%esp), %xmm2
vmovdqu 608(%esp), %xmm5
vmovdqu 576(%esp), %xmm4
vmovdqu %xmm3, 400(%esp)
vpaddd 272(%esp), %xmm5, %xmm5
vpaddd 288(%esp), %xmm2, %xmm2
vpaddd 304(%esp), %xmm4, %xmm3
testl %eax, %eax
jne chacha_blocks_avx_7
vmovdqu %xmm0, (%esp)
vmovdqu 400(%esp), %xmm0
vpunpckldq %xmm0, %xmm5, %xmm7
vpunpckldq %xmm3, %xmm2, %xmm4
vmovdqu %xmm6, 16(%esp)
vpunpcklqdq %xmm4, %xmm7, %xmm6
vpunpckhqdq %xmm4, %xmm7, %xmm4
vpunpckhdq %xmm0, %xmm5, %xmm5
vpunpckhdq %xmm3, %xmm2, %xmm2
vpunpcklqdq %xmm2, %xmm5, %xmm3
vpunpckhqdq %xmm2, %xmm5, %xmm5
vmovdqu %xmm6, (%edx)
vmovdqu %xmm4, 64(%edx)
vmovdqu %xmm3, 128(%edx)
vmovdqu %xmm5, 192(%edx)
vmovdqu 544(%esp), %xmm0
vmovdqu 384(%esp), %xmm2
vmovdqu 560(%esp), %xmm4
vmovdqu 592(%esp), %xmm6
vpaddd 336(%esp), %xmm0, %xmm7
vpaddd 240(%esp), %xmm2, %xmm5
vpaddd 320(%esp), %xmm4, %xmm3
vpaddd 208(%esp), %xmm6, %xmm0
vpunpckldq %xmm3, %xmm5, %xmm2
vpunpckldq %xmm0, %xmm7, %xmm4
vpunpckhdq %xmm3, %xmm5, %xmm3
vpunpckhdq %xmm0, %xmm7, %xmm7
vpunpcklqdq %xmm4, %xmm2, %xmm6
vpunpckhqdq %xmm4, %xmm2, %xmm4
vpunpcklqdq %xmm7, %xmm3, %xmm5
vpunpckhqdq %xmm7, %xmm3, %xmm3
vpaddd 192(%esp), %xmm1, %xmm2
vmovdqu (%esp), %xmm1
vmovdqu %xmm4, 80(%edx)
vmovdqu %xmm3, 208(%edx)
vmovdqu %xmm5, 144(%edx)
vmovdqu %xmm6, 16(%edx)
vmovdqu 528(%esp), %xmm3
vmovdqu 512(%esp), %xmm4
vpaddd 176(%esp), %xmm1, %xmm5
vpaddd 160(%esp), %xmm3, %xmm1
vpaddd 144(%esp), %xmm4, %xmm7
vpunpckldq %xmm5, %xmm2, %xmm0
vpunpckldq %xmm7, %xmm1, %xmm6
vpunpckhdq %xmm5, %xmm2, %xmm5
vpunpckhdq %xmm7, %xmm1, %xmm1
vpunpcklqdq %xmm6, %xmm0, %xmm3
vpunpcklqdq %xmm1, %xmm5, %xmm2
vmovdqu %xmm3, 32(%edx)
vmovdqu %xmm2, 160(%edx)
vpunpckhqdq %xmm1, %xmm5, %xmm7
vmovdqu 464(%esp), %xmm3
vmovdqu 16(%esp), %xmm1
vmovdqu 480(%esp), %xmm5
vmovdqu 496(%esp), %xmm2
vpaddd 368(%esp), %xmm3, %xmm4
vpaddd 128(%esp), %xmm5, %xmm5
vpaddd 256(%esp), %xmm2, %xmm2
vpunpckhqdq %xmm6, %xmm0, %xmm6
vpaddd 352(%esp), %xmm1, %xmm0
vmovdqu %xmm6, 96(%edx)
vmovdqu %xmm7, 224(%edx)
vpunpckldq %xmm0, %xmm4, %xmm6
vpunpckldq %xmm2, %xmm5, %xmm7
vpunpckhdq %xmm0, %xmm4, %xmm0
vpunpckhdq %xmm2, %xmm5, %xmm4
vpunpcklqdq %xmm7, %xmm6, %xmm3
vpunpckhqdq %xmm7, %xmm6, %xmm1
vpunpcklqdq %xmm4, %xmm0, %xmm2
vpunpckhqdq %xmm4, %xmm0, %xmm0
vmovdqu %xmm3, 48(%edx)
vmovdqu %xmm1, 112(%edx)
vmovdqu %xmm2, 176(%edx)
vmovdqu %xmm0, 240(%edx)
jmp chacha_blocks_avx_8
chacha_blocks_avx_7:
vmovdqu 400(%esp), %xmm7
vpunpckldq %xmm7, %xmm5, %xmm4
vpunpckhdq %xmm7, %xmm5, %xmm7
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm3, %xmm2, %xmm3
vpunpcklqdq %xmm5, %xmm4, %xmm2
vpunpckhqdq %xmm5, %xmm4, %xmm4
vpxor 64(%eax), %xmm4, %xmm5
vpunpcklqdq %xmm3, %xmm7, %xmm4
vpunpckhqdq %xmm3, %xmm7, %xmm3
vpxor 128(%eax), %xmm4, %xmm4
vpxor 192(%eax), %xmm3, %xmm7
vpxor (%eax), %xmm2, %xmm2
vmovdqu %xmm4, 128(%edx)
vmovdqu %xmm2, (%edx)
vmovdqu %xmm5, 64(%edx)
vmovdqu %xmm7, 192(%edx)
vmovdqu 384(%esp), %xmm4
vpaddd 240(%esp), %xmm4, %xmm3
vmovdqu 560(%esp), %xmm2
vmovdqu 544(%esp), %xmm5
vmovdqu 592(%esp), %xmm4
vpaddd 320(%esp), %xmm2, %xmm2
vpaddd 336(%esp), %xmm5, %xmm7
vpaddd 208(%esp), %xmm4, %xmm4
vpunpckldq %xmm2, %xmm3, %xmm5
vpunpckhdq %xmm2, %xmm3, %xmm2
vpunpckldq %xmm4, %xmm7, %xmm3
vpunpckhdq %xmm4, %xmm7, %xmm4
vpunpcklqdq %xmm3, %xmm5, %xmm7
vpunpckhqdq %xmm3, %xmm5, %xmm5
vpxor 80(%eax), %xmm5, %xmm3
vpunpcklqdq %xmm4, %xmm2, %xmm5
vpunpckhqdq %xmm4, %xmm2, %xmm2
vpxor 16(%eax), %xmm7, %xmm7
vpxor 144(%eax), %xmm5, %xmm5
vpxor 208(%eax), %xmm2, %xmm4
vmovdqu %xmm7, 16(%edx)
vmovdqu %xmm5, 144(%edx)
vmovdqu %xmm3, 80(%edx)
vmovdqu %xmm4, 208(%edx)
vpaddd 176(%esp), %xmm0, %xmm7
vpaddd 192(%esp), %xmm1, %xmm5
vmovdqu 528(%esp), %xmm0
vmovdqu 512(%esp), %xmm1
vpaddd 160(%esp), %xmm0, %xmm3
vpaddd 144(%esp), %xmm1, %xmm0
vpunpckldq %xmm7, %xmm5, %xmm1
vpunpckldq %xmm0, %xmm3, %xmm2
vpunpckhdq %xmm7, %xmm5, %xmm7
vpunpckhdq %xmm0, %xmm3, %xmm4
vpunpcklqdq %xmm2, %xmm1, %xmm3
vpunpckhqdq %xmm2, %xmm1, %xmm1
vpunpcklqdq %xmm4, %xmm7, %xmm2
vpunpckhqdq %xmm4, %xmm7, %xmm7
vpxor 32(%eax), %xmm3, %xmm0
vpxor 96(%eax), %xmm1, %xmm1
vpxor 160(%eax), %xmm2, %xmm3
vpxor 224(%eax), %xmm7, %xmm4
vmovdqu %xmm0, 32(%edx)
vmovdqu %xmm1, 96(%edx)
vmovdqu %xmm3, 160(%edx)
vmovdqu %xmm4, 224(%edx)
vpaddd 352(%esp), %xmm6, %xmm0
vmovdqu 480(%esp), %xmm6
vpaddd 128(%esp), %xmm6, %xmm2
vmovdqu 464(%esp), %xmm5
vmovdqu 496(%esp), %xmm6
vpaddd 368(%esp), %xmm5, %xmm1
vpaddd 256(%esp), %xmm6, %xmm3
vpunpckldq %xmm0, %xmm1, %xmm7
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm0, %xmm1, %xmm1
vpunpckhdq %xmm3, %xmm2, %xmm0
vpunpcklqdq %xmm5, %xmm7, %xmm4
vpunpckhqdq %xmm5, %xmm7, %xmm7
vpunpcklqdq %xmm0, %xmm1, %xmm2
vpunpckhqdq %xmm0, %xmm1, %xmm0
vpxor 48(%eax), %xmm4, %xmm6
vpxor 112(%eax), %xmm7, %xmm3
vpxor 176(%eax), %xmm2, %xmm4
vpxor 240(%eax), %xmm0, %xmm1
addl $256, %eax
vmovdqu %xmm6, 48(%edx)
vmovdqu %xmm3, 112(%edx)
vmovdqu %xmm4, 176(%edx)
vmovdqu %xmm1, 240(%edx)
chacha_blocks_avx_8:
movl 420(%esp), %ecx
addl $256, %edx
addl $-256, %ecx
movl %ecx, 420(%esp)
cmpl $256, %ecx
jae chacha_blocks_avx_4
chacha_blocks_avx_9:
movl 8(%ebp), %ecx
movl %edi, 32(%ecx)
movl %esi, 36(%ecx)
movl 420(%esp), %ebx
vmovdqu 32(%ecx), %xmm0
chacha_blocks_avx_10:
cmpl $128, %ebx
jb chacha_blocks_avx_16
chacha_blocks_avx_11:
vmovdqu 64(%esp), %xmm3
vmovdqa %xmm0, %xmm1
vmovdqu 80(%esp), %xmm4
vmovdqu 48(%esp), %xmm6
vpaddq 96(%esp), %xmm0, %xmm2
vmovdqu %xmm3, 32(%esp)
vmovdqu %xmm4, 16(%esp)
vmovdqu %xmm6, 128(%esp)
vmovdqu %xmm6, 160(%esp)
vmovdqu %xmm2, (%esp)
vmovdqu %xmm2, 144(%esp)
movl 424(%esp), %esi
vmovdqu 16(%esp), %xmm5
vmovdqu 32(%esp), %xmm6
vmovdqu %xmm0, 112(%esp)
chacha_blocks_avx_12:
vpaddd 160(%esp), %xmm3, %xmm0
vpaddd 128(%esp), %xmm6, %xmm2
vpxor %xmm0, %xmm1, %xmm1
vmovdqu 448(%esp), %xmm7
vmovdqu %xmm2, 176(%esp)
vpshufb %xmm7, %xmm1, %xmm1
vpxor 144(%esp), %xmm2, %xmm2
vpaddd %xmm1, %xmm4, %xmm4
vpshufb %xmm7, %xmm2, %xmm2
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm4, %xmm3, %xmm3
vpxor %xmm5, %xmm6, %xmm7
vpsrld $20, %xmm3, %xmm6
vpslld $12, %xmm3, %xmm3
vpor %xmm3, %xmm6, %xmm6
vpsrld $20, %xmm7, %xmm3
vpslld $12, %xmm7, %xmm7
vpaddd %xmm6, %xmm0, %xmm0
vpor %xmm7, %xmm3, %xmm7
vpxor %xmm0, %xmm1, %xmm1
vmovdqu %xmm0, 192(%esp)
vpaddd 176(%esp), %xmm7, %xmm3
vmovdqu 432(%esp), %xmm0
vpxor %xmm3, %xmm2, %xmm2
vpshufb %xmm0, %xmm1, %xmm1
vpshufb %xmm0, %xmm2, %xmm0
vpaddd %xmm1, %xmm4, %xmm4
vpaddd %xmm0, %xmm5, %xmm5
vpxor %xmm4, %xmm6, %xmm6
vpxor %xmm5, %xmm7, %xmm7
vpsrld $25, %xmm6, %xmm2
vpslld $7, %xmm6, %xmm6
vpor %xmm6, %xmm2, %xmm2
vpsrld $25, %xmm7, %xmm6
vpslld $7, %xmm7, %xmm7
vpor %xmm7, %xmm6, %xmm6
vpshufd $147, 192(%esp), %xmm7
vpshufd $147, %xmm3, %xmm3
vpaddd %xmm2, %xmm7, %xmm7
vpshufd $78, %xmm1, %xmm1
vpaddd %xmm6, %xmm3, %xmm3
vmovdqu %xmm7, 208(%esp)
vpxor %xmm7, %xmm1, %xmm7
vmovdqu 448(%esp), %xmm1
vpshufd $78, %xmm0, %xmm0
vpshufb %xmm1, %xmm7, %xmm7
vpxor %xmm3, %xmm0, %xmm0
vpshufb %xmm1, %xmm0, %xmm0
vpshufd $57, %xmm4, %xmm4
vpshufd $57, %xmm5, %xmm5
vpaddd %xmm7, %xmm4, %xmm1
vpaddd %xmm0, %xmm5, %xmm5
vpxor %xmm1, %xmm2, %xmm4
vpxor %xmm5, %xmm6, %xmm2
vpsrld $20, %xmm4, %xmm6
vpslld $12, %xmm4, %xmm4
vpor %xmm4, %xmm6, %xmm4
vpsrld $20, %xmm2, %xmm6
vpslld $12, %xmm2, %xmm2
vpor %xmm2, %xmm6, %xmm2
vpaddd 208(%esp), %xmm4, %xmm6
vpaddd %xmm2, %xmm3, %xmm3
vmovdqu %xmm2, 224(%esp)
vpxor %xmm6, %xmm7, %xmm7
vmovdqu 432(%esp), %xmm2
vpxor %xmm3, %xmm0, %xmm0
vpshufb %xmm2, %xmm7, %xmm7
vpshufb %xmm2, %xmm0, %xmm0
vpshufd $57, %xmm3, %xmm3
vpaddd %xmm0, %xmm5, %xmm5
vmovdqu %xmm3, 128(%esp)
vpaddd %xmm7, %xmm1, %xmm3
vpshufd $78, %xmm0, %xmm0
vpxor %xmm3, %xmm4, %xmm2
vmovdqu %xmm0, 144(%esp)
vpxor 224(%esp), %xmm5, %xmm0
vpshufd $57, %xmm6, %xmm6
vmovdqu %xmm6, 160(%esp)
vpsrld $25, %xmm2, %xmm6
vpshufd $78, %xmm7, %xmm1
vpslld $7, %xmm2, %xmm7
vpsrld $25, %xmm0, %xmm2
vpslld $7, %xmm0, %xmm0
vpshufd $147, %xmm3, %xmm4
vpor %xmm7, %xmm6, %xmm3
vpshufd $147, %xmm5, %xmm5
vpor %xmm0, %xmm2, %xmm6
addl $-2, %esi
jne chacha_blocks_avx_12
chacha_blocks_avx_13:
vmovdqu 64(%esp), %xmm2
vmovdqu %xmm5, 16(%esp)
vpaddd %xmm3, %xmm2, %xmm7
vmovdqu %xmm6, 32(%esp)
vmovdqu 112(%esp), %xmm0
vmovdqu 48(%esp), %xmm5
vpaddd %xmm1, %xmm0, %xmm1
vmovdqu 160(%esp), %xmm6
vmovdqu 80(%esp), %xmm3
vpaddd %xmm6, %xmm5, %xmm6
vpaddd 128(%esp), %xmm5, %xmm0
vpaddd %xmm4, %xmm3, %xmm4
vpaddd 32(%esp), %xmm2, %xmm5
vpaddd 16(%esp), %xmm3, %xmm2
vmovdqu (%esp), %xmm3
vpaddd 144(%esp), %xmm3, %xmm3
testl %eax, %eax
je chacha_blocks_avx_15
chacha_blocks_avx_14:
vpxor (%eax), %xmm6, %xmm6
vpxor 16(%eax), %xmm7, %xmm7
vpxor 32(%eax), %xmm4, %xmm4
vpxor 48(%eax), %xmm1, %xmm1
vpxor 64(%eax), %xmm0, %xmm0
vpxor 80(%eax), %xmm5, %xmm5
vpxor 96(%eax), %xmm2, %xmm2
vpxor 112(%eax), %xmm3, %xmm3
addl $128, %eax
chacha_blocks_avx_15:
vmovdqu %xmm0, 64(%edx)
vmovdqu %xmm6, (%edx)
vmovdqu %xmm7, 16(%edx)
vmovdqu %xmm4, 32(%edx)
vmovdqu %xmm1, 48(%edx)
vmovdqu %xmm5, 80(%edx)
vmovdqu %xmm2, 96(%edx)
vmovdqu %xmm3, 112(%edx)
addl $-128, %ebx
addl $128, %edx
vmovdqu (%esp), %xmm0
vpaddq 96(%esp), %xmm0, %xmm0
chacha_blocks_avx_16:
movl %ebx, %edi
testl %ebx, %ebx
jne chacha_blocks_avx_18
chacha_blocks_avx_17:
vmovdqu %xmm0, 32(%ecx)
addl $1268, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret
chacha_blocks_avx_18:
movl %edi, 20(%esp)
xorl %esi, %esi
movl %ebx, 420(%esp)
vmovdqu 80(%esp), %xmm7
vmovdqu 64(%esp), %xmm1
vmovdqu 48(%esp), %xmm6
jmp chacha_blocks_avx_19
chacha_blocks_avx_35:
movl %ecx, 420(%esp)
addl $64, %edx
chacha_blocks_avx_19:
incl %esi
movl %esi, %ecx
shll $6, %ecx
negl %ecx
addl 20(%esp), %ecx
lea 64(%ecx), %ebx
cmpl $64, %ebx
jae chacha_blocks_avx_30
chacha_blocks_avx_20:
testl %eax, %eax
je chacha_blocks_avx_29
chacha_blocks_avx_21:
testl %ebx, %ebx
je chacha_blocks_avx_28
chacha_blocks_avx_22:
movl %ebx, %edi
shrl $1, %edi
movl %edi, 12(%esp)
testl %edi, %edi
jbe chacha_blocks_avx_37
chacha_blocks_avx_23:
movl %esi, 8(%esp)
xorl %edi, %edi
movl %ecx, 4(%esp)
movl %edx, 16(%esp)
movl 12(%esp), %esi
chacha_blocks_avx_24:
movzbl (%eax,%edi,2), %edx
movb %dl, 128(%esp,%edi,2)
movzbl 1(%eax,%edi,2), %ecx
movb %cl, 129(%esp,%edi,2)
incl %edi
cmpl %esi, %edi
jb chacha_blocks_avx_24
chacha_blocks_avx_25:
movl 4(%esp), %ecx
lea 1(%edi,%edi), %edi
movl 8(%esp), %esi
movl 16(%esp), %edx
movl %edi, (%esp)
chacha_blocks_avx_26:
lea -1(%edi), %edi
cmpl %ebx, %edi
jae chacha_blocks_avx_28
chacha_blocks_avx_27:
movzbl (%edi,%eax), %eax
movl (%esp), %edi
movb %al, 127(%esp,%edi)
chacha_blocks_avx_28:
lea 128(%esp), %eax
chacha_blocks_avx_29:
movl %edx, 416(%esp)
lea 128(%esp), %edx
chacha_blocks_avx_30:
vmovdqu %xmm0, 112(%esp)
vmovdqa %xmm6, %xmm2
movl %edx, 16(%esp)
xorl %edi, %edi
movl %eax, 24(%esp)
vmovdqa %xmm1, %xmm3
vmovdqu 448(%esp), %xmm1
vmovdqa %xmm7, %xmm4
movl 424(%esp), %edx
vmovdqa %xmm0, %xmm5
vmovdqu 432(%esp), %xmm0
chacha_blocks_avx_31:
vpaddd %xmm3, %xmm2, %xmm6
incl %edi
vpxor %xmm6, %xmm5, %xmm2
vpshufb %xmm1, %xmm2, %xmm5
vpaddd %xmm5, %xmm4, %xmm2
lea (%edi,%edi), %eax
vpxor %xmm2, %xmm3, %xmm4
vpsrld $20, %xmm4, %xmm3
vpslld $12, %xmm4, %xmm7
vpor %xmm7, %xmm3, %xmm7
vpaddd %xmm7, %xmm6, %xmm3
vpxor %xmm3, %xmm5, %xmm5
vpshufb %xmm0, %xmm5, %xmm4
vpaddd %xmm4, %xmm2, %xmm6
vpxor %xmm6, %xmm7, %xmm2
vpsrld $25, %xmm2, %xmm5
vpslld $7, %xmm2, %xmm7
vpshufd $147, %xmm3, %xmm3
vpor %xmm7, %xmm5, %xmm5
vpshufd $78, %xmm4, %xmm4
vpaddd %xmm5, %xmm3, %xmm2
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm7
vpshufd $57, %xmm6, %xmm6
vpaddd %xmm7, %xmm6, %xmm3
vpxor %xmm3, %xmm5, %xmm4
vpsrld $20, %xmm4, %xmm5
vpslld $12, %xmm4, %xmm6
vpor %xmm6, %xmm5, %xmm4
vpaddd %xmm4, %xmm2, %xmm5
vpxor %xmm5, %xmm7, %xmm2
vpshufb %xmm0, %xmm2, %xmm7
vpaddd %xmm7, %xmm3, %xmm3
vpxor %xmm3, %xmm4, %xmm6
vpshufd $57, %xmm5, %xmm2
vpshufd $78, %xmm7, %xmm5
vpslld $7, %xmm6, %xmm7
vpshufd $147, %xmm3, %xmm4
vpsrld $25, %xmm6, %xmm3
vpor %xmm7, %xmm3, %xmm3
cmpl %edx, %eax
jne chacha_blocks_avx_31
chacha_blocks_avx_32:
vmovdqu 80(%esp), %xmm7
vmovdqu 64(%esp), %xmm1
vpaddd %xmm7, %xmm4, %xmm4
vmovdqu 48(%esp), %xmm6
vpaddd %xmm1, %xmm3, %xmm3
vmovdqu 112(%esp), %xmm0
vpaddd %xmm6, %xmm2, %xmm2
movl 24(%esp), %eax
vpaddd %xmm0, %xmm5, %xmm5
movl 16(%esp), %edx
testl %eax, %eax
je chacha_blocks_avx_34
chacha_blocks_avx_33:
vpxor (%eax), %xmm2, %xmm2
vpxor 16(%eax), %xmm3, %xmm3
vpxor 32(%eax), %xmm4, %xmm4
vpxor 48(%eax), %xmm5, %xmm5
addl $64, %eax
chacha_blocks_avx_34:
vmovdqu %xmm2, (%edx)
vmovdqu %xmm3, 16(%edx)
vmovdqu %xmm4, 32(%edx)
vmovdqu %xmm5, 48(%edx)
vpaddq 96(%esp), %xmm0, %xmm0
cmpl $64, %ebx
jbe chacha_blocks_avx_38
jmp chacha_blocks_avx_35
chacha_blocks_avx_36:
addl $1268, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret
chacha_blocks_avx_37:
movl $1, %edi
movl %edi, (%esp)
jmp chacha_blocks_avx_26
chacha_blocks_avx_38:
movl 420(%esp), %ebx
movl 8(%ebp), %ecx
cmpl $64, %ebx
jae chacha_blocks_avx_17
chacha_blocks_avx_39:
testl %ebx, %ebx
jbe chacha_blocks_avx_17
chacha_blocks_avx_40:
movl 416(%esp), %edi
xorl %esi, %esi
chacha_blocks_avx_41:
movzbl (%esi,%edx), %eax
movb %al, (%esi,%edi)
incl %esi
cmpl %ebx, %esi
jb chacha_blocks_avx_41
jmp chacha_blocks_avx_17

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __amd64__ && __XOP__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushq %rbx
pushq %rbp
movq %rsp, %rbp
andq $~63, %rsp
subq $512, %rsp
LOAD_VAR_PIC chacha_constants, %rax
vmovdqa 0(%rax), %xmm8
vmovdqu 0(%rdi), %xmm9
vmovdqu 16(%rdi), %xmm10
vmovdqu 32(%rdi), %xmm11
mov 32(%rdi), %rbx
movq 48(%rdi), %rax
movq $1, %r9
vmovdqa %xmm8, 0(%rsp)
vmovdqa %xmm9, 16(%rsp)
vmovdqa %xmm10, 32(%rsp)
vmovdqa %xmm11, 48(%rsp)
movq %rax, 64(%rsp)
cmpq $128, %rcx
jb chacha_blocks_xop_below128_fixup
cmpq $256, %rcx
jb chacha_blocks_xop_atleast128
chacha_blocks_xop_atleast256_fixup:
vpshufd $0x00, %xmm8, %xmm0
vpshufd $0x55, %xmm8, %xmm1
vpshufd $0xaa, %xmm8, %xmm2
vpshufd $0xff, %xmm8, %xmm3
vmovdqa %xmm0, 128(%rsp)
vmovdqa %xmm1, 144(%rsp)
vmovdqa %xmm2, 160(%rsp)
vmovdqa %xmm3, 176(%rsp)
vpshufd $0x00, %xmm9, %xmm0
vpshufd $0x55, %xmm9, %xmm1
vpshufd $0xaa, %xmm9, %xmm2
vpshufd $0xff, %xmm9, %xmm3
vmovdqa %xmm0, 192(%rsp)
vmovdqa %xmm1, 208(%rsp)
vmovdqa %xmm2, 224(%rsp)
vmovdqa %xmm3, 240(%rsp)
vpshufd $0x00, %xmm10, %xmm0
vpshufd $0x55, %xmm10, %xmm1
vpshufd $0xaa, %xmm10, %xmm2
vpshufd $0xff, %xmm10, %xmm3
vmovdqa %xmm0, 256(%rsp)
vmovdqa %xmm1, 272(%rsp)
vmovdqa %xmm2, 288(%rsp)
vmovdqa %xmm3, 304(%rsp)
vpshufd $0xaa, %xmm11, %xmm0
vpshufd $0xff, %xmm11, %xmm1
vmovdqa %xmm0, 352(%rsp)
vmovdqa %xmm1, 368(%rsp)
jmp chacha_blocks_xop_atleast256
.p2align 6,,63
chacha_blocks_xop_atleast256:
movq %rbx, %rax
leaq 1(%rbx), %r8
leaq 2(%rbx), %r9
leaq 3(%rbx), %r10
movl %eax, 320(%rsp)
movl %r8d, 4+320(%rsp)
movl %r9d, 8+320(%rsp)
movl %r10d, 12+320(%rsp)
shrq $32, %rax
shrq $32, %r8
shrq $32, %r9
shrq $32, %r10
addq $4, %rbx
movl %eax, 336(%rsp)
movl %r8d, 4+336(%rsp)
movl %r9d, 8+336(%rsp)
movl %r10d, 12+336(%rsp)
movq 64(%rsp), %rax
vmovdqa 128(%rsp), %xmm0
vmovdqa 144(%rsp), %xmm1
vmovdqa 160(%rsp), %xmm2
vmovdqa 176(%rsp), %xmm3
vmovdqa 192(%rsp), %xmm4
vmovdqa 208(%rsp), %xmm5
vmovdqa 224(%rsp), %xmm6
vmovdqa 240(%rsp), %xmm7
vmovdqa 256(%rsp), %xmm8
vmovdqa 272(%rsp), %xmm9
vmovdqa 288(%rsp), %xmm10
vmovdqa 304(%rsp), %xmm11
vmovdqa 320(%rsp), %xmm12
vmovdqa 336(%rsp), %xmm13
vmovdqa 352(%rsp), %xmm14
vmovdqa 368(%rsp), %xmm15
chacha_blocks_xop_mainloop1:
vpaddd %xmm0, %xmm4, %xmm0
vpaddd %xmm1, %xmm5, %xmm1
vpaddd %xmm2, %xmm6, %xmm2
vpaddd %xmm3, %xmm7, %xmm3
vpxor %xmm12, %xmm0, %xmm12
vpxor %xmm13, %xmm1, %xmm13
vpxor %xmm14, %xmm2, %xmm14
vpxor %xmm15, %xmm3, %xmm15
vprotd $16, %xmm12, %xmm12
vprotd $16, %xmm13, %xmm13
vprotd $16, %xmm14, %xmm14
vprotd $16, %xmm15, %xmm15
vpaddd %xmm8, %xmm12, %xmm8
vpaddd %xmm9, %xmm13, %xmm9
vpaddd %xmm10, %xmm14, %xmm10
vpaddd %xmm11, %xmm15, %xmm11
vpxor %xmm4, %xmm8, %xmm4
vpxor %xmm5, %xmm9, %xmm5
vpxor %xmm6, %xmm10, %xmm6
vpxor %xmm7, %xmm11, %xmm7
vprotd $12, %xmm4, %xmm4
vprotd $12, %xmm5, %xmm5
vprotd $12, %xmm6, %xmm6
vprotd $12, %xmm7, %xmm7
vpaddd %xmm0, %xmm4, %xmm0
vpaddd %xmm1, %xmm5, %xmm1
vpaddd %xmm2, %xmm6, %xmm2
vpaddd %xmm3, %xmm7, %xmm3
vpxor %xmm12, %xmm0, %xmm12
vpxor %xmm13, %xmm1, %xmm13
vpxor %xmm14, %xmm2, %xmm14
vpxor %xmm15, %xmm3, %xmm15
vprotd $8, %xmm12, %xmm12
vprotd $8, %xmm13, %xmm13
vprotd $8, %xmm14, %xmm14
vprotd $8, %xmm15, %xmm15
vpaddd %xmm8, %xmm12, %xmm8
vpaddd %xmm9, %xmm13, %xmm9
vpaddd %xmm10, %xmm14, %xmm10
vpaddd %xmm11, %xmm15, %xmm11
vpxor %xmm4, %xmm8, %xmm4
vpxor %xmm5, %xmm9, %xmm5
vpxor %xmm6, %xmm10, %xmm6
vpxor %xmm7, %xmm11, %xmm7
vprotd $7, %xmm4, %xmm4
vprotd $7, %xmm5, %xmm5
vprotd $7, %xmm6, %xmm6
vprotd $7, %xmm7, %xmm7
vpaddd %xmm0, %xmm5, %xmm0
vpaddd %xmm1, %xmm6, %xmm1
vpaddd %xmm2, %xmm7, %xmm2
vpaddd %xmm3, %xmm4, %xmm3
vpxor %xmm15, %xmm0, %xmm15
vpxor %xmm12, %xmm1, %xmm12
vpxor %xmm13, %xmm2, %xmm13
vpxor %xmm14, %xmm3, %xmm14
vprotd $16, %xmm15, %xmm15
vprotd $16, %xmm12, %xmm12
vprotd $16, %xmm13, %xmm13
vprotd $16, %xmm14, %xmm14
vpaddd %xmm10, %xmm15, %xmm10
vpaddd %xmm11, %xmm12, %xmm11
vpaddd %xmm8, %xmm13, %xmm8
vpaddd %xmm9, %xmm14, %xmm9
vpxor %xmm5, %xmm10, %xmm5
vpxor %xmm6, %xmm11, %xmm6
vpxor %xmm7, %xmm8, %xmm7
vpxor %xmm4, %xmm9, %xmm4
vprotd $12, %xmm5, %xmm5
vprotd $12, %xmm6, %xmm6
vprotd $12, %xmm7, %xmm7
vprotd $12, %xmm4, %xmm4
vpaddd %xmm0, %xmm5, %xmm0
vpaddd %xmm1, %xmm6, %xmm1
vpaddd %xmm2, %xmm7, %xmm2
vpaddd %xmm3, %xmm4, %xmm3
vpxor %xmm15, %xmm0, %xmm15
vpxor %xmm12, %xmm1, %xmm12
vpxor %xmm13, %xmm2, %xmm13
vpxor %xmm14, %xmm3, %xmm14
vprotd $8, %xmm15, %xmm15
vprotd $8, %xmm12, %xmm12
vprotd $8, %xmm13, %xmm13
vprotd $8, %xmm14, %xmm14
vpaddd %xmm10, %xmm15, %xmm10
vpaddd %xmm11, %xmm12, %xmm11
vpaddd %xmm8, %xmm13, %xmm8
vpaddd %xmm9, %xmm14, %xmm9
vpxor %xmm5, %xmm10, %xmm5
vpxor %xmm6, %xmm11, %xmm6
vpxor %xmm7, %xmm8, %xmm7
vpxor %xmm4, %xmm9, %xmm4
vprotd $7, %xmm5, %xmm5
vprotd $7, %xmm6, %xmm6
vprotd $7, %xmm7, %xmm7
vprotd $7, %xmm4, %xmm4
subq $2, %rax
jnz chacha_blocks_xop_mainloop1
vpaddd 128(%rsp), %xmm0, %xmm0
vpaddd 144(%rsp), %xmm1, %xmm1
vpaddd 160(%rsp), %xmm2, %xmm2
vpaddd 176(%rsp), %xmm3, %xmm3
vpaddd 192(%rsp), %xmm4, %xmm4
vpaddd 208(%rsp), %xmm5, %xmm5
vpaddd 224(%rsp), %xmm6, %xmm6
vpaddd 240(%rsp), %xmm7, %xmm7
vpaddd 256(%rsp), %xmm8, %xmm8
vpaddd 272(%rsp), %xmm9, %xmm9
vpaddd 288(%rsp), %xmm10, %xmm10
vpaddd 304(%rsp), %xmm11, %xmm11
vpaddd 320(%rsp), %xmm12, %xmm12
vpaddd 336(%rsp), %xmm13, %xmm13
vpaddd 352(%rsp), %xmm14, %xmm14
vpaddd 368(%rsp), %xmm15, %xmm15
vmovdqa %xmm8, 384(%rsp)
vmovdqa %xmm9, 400(%rsp)
vmovdqa %xmm10, 416(%rsp)
vmovdqa %xmm11, 432(%rsp)
vmovdqa %xmm12, 448(%rsp)
vmovdqa %xmm13, 464(%rsp)
vmovdqa %xmm14, 480(%rsp)
vmovdqa %xmm15, 496(%rsp)
vpunpckldq %xmm1, %xmm0, %xmm8
vpunpckldq %xmm3, %xmm2, %xmm9
vpunpckhdq %xmm1, %xmm0, %xmm12
vpunpckhdq %xmm3, %xmm2, %xmm13
vpunpckldq %xmm5, %xmm4, %xmm10
vpunpckldq %xmm7, %xmm6, %xmm11
vpunpckhdq %xmm5, %xmm4, %xmm14
vpunpckhdq %xmm7, %xmm6, %xmm15
vpunpcklqdq %xmm9, %xmm8, %xmm0
vpunpcklqdq %xmm11, %xmm10, %xmm1
vpunpckhqdq %xmm9, %xmm8, %xmm2
vpunpckhqdq %xmm11, %xmm10, %xmm3
vpunpcklqdq %xmm13, %xmm12, %xmm4
vpunpcklqdq %xmm15, %xmm14, %xmm5
vpunpckhqdq %xmm13, %xmm12, %xmm6
vpunpckhqdq %xmm15, %xmm14, %xmm7
andq %rsi, %rsi
jz chacha_blocks_xop_noinput1
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 64(%rsi), %xmm2, %xmm2
vpxor 80(%rsi), %xmm3, %xmm3
vpxor 128(%rsi), %xmm4, %xmm4
vpxor 144(%rsi), %xmm5, %xmm5
vpxor 192(%rsi), %xmm6, %xmm6
vpxor 208(%rsi), %xmm7, %xmm7
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 64(%rdx)
vmovdqu %xmm3, 80(%rdx)
vmovdqu %xmm4, 128(%rdx)
vmovdqu %xmm5, 144(%rdx)
vmovdqu %xmm6, 192(%rdx)
vmovdqu %xmm7, 208(%rdx)
vmovdqa 384(%rsp), %xmm0
vmovdqa 400(%rsp), %xmm1
vmovdqa 416(%rsp), %xmm2
vmovdqa 432(%rsp), %xmm3
vmovdqa 448(%rsp), %xmm4
vmovdqa 464(%rsp), %xmm5
vmovdqa 480(%rsp), %xmm6
vmovdqa 496(%rsp), %xmm7
vpunpckldq %xmm1, %xmm0, %xmm8
vpunpckldq %xmm3, %xmm2, %xmm9
vpunpckhdq %xmm1, %xmm0, %xmm12
vpunpckhdq %xmm3, %xmm2, %xmm13
vpunpckldq %xmm5, %xmm4, %xmm10
vpunpckldq %xmm7, %xmm6, %xmm11
vpunpckhdq %xmm5, %xmm4, %xmm14
vpunpckhdq %xmm7, %xmm6, %xmm15
vpunpcklqdq %xmm9, %xmm8, %xmm0
vpunpcklqdq %xmm11, %xmm10, %xmm1
vpunpckhqdq %xmm9, %xmm8, %xmm2
vpunpckhqdq %xmm11, %xmm10, %xmm3
vpunpcklqdq %xmm13, %xmm12, %xmm4
vpunpcklqdq %xmm15, %xmm14, %xmm5
vpunpckhqdq %xmm13, %xmm12, %xmm6
vpunpckhqdq %xmm15, %xmm14, %xmm7
vpxor 32(%rsi), %xmm0, %xmm0
vpxor 48(%rsi), %xmm1, %xmm1
vpxor 96(%rsi), %xmm2, %xmm2
vpxor 112(%rsi), %xmm3, %xmm3
vpxor 160(%rsi), %xmm4, %xmm4
vpxor 176(%rsi), %xmm5, %xmm5
vpxor 224(%rsi), %xmm6, %xmm6
vpxor 240(%rsi), %xmm7, %xmm7
vmovdqu %xmm0, 32(%rdx)
vmovdqu %xmm1, 48(%rdx)
vmovdqu %xmm2, 96(%rdx)
vmovdqu %xmm3, 112(%rdx)
vmovdqu %xmm4, 160(%rdx)
vmovdqu %xmm5, 176(%rdx)
vmovdqu %xmm6, 224(%rdx)
vmovdqu %xmm7, 240(%rdx)
addq $256, %rsi
jmp chacha_blocks_xop_mainloop_cont
chacha_blocks_xop_noinput1:
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 64(%rdx)
vmovdqu %xmm3, 80(%rdx)
vmovdqu %xmm4, 128(%rdx)
vmovdqu %xmm5, 144(%rdx)
vmovdqu %xmm6, 192(%rdx)
vmovdqu %xmm7, 208(%rdx)
vmovdqa 384(%rsp), %xmm0
vmovdqa 400(%rsp), %xmm1
vmovdqa 416(%rsp), %xmm2
vmovdqa 432(%rsp), %xmm3
vmovdqa 448(%rsp), %xmm4
vmovdqa 464(%rsp), %xmm5
vmovdqa 480(%rsp), %xmm6
vmovdqa 496(%rsp), %xmm7
vpunpckldq %xmm1, %xmm0, %xmm8
vpunpckldq %xmm3, %xmm2, %xmm9
vpunpckhdq %xmm1, %xmm0, %xmm12
vpunpckhdq %xmm3, %xmm2, %xmm13
vpunpckldq %xmm5, %xmm4, %xmm10
vpunpckldq %xmm7, %xmm6, %xmm11
vpunpckhdq %xmm5, %xmm4, %xmm14
vpunpckhdq %xmm7, %xmm6, %xmm15
vpunpcklqdq %xmm9, %xmm8, %xmm0
vpunpcklqdq %xmm11, %xmm10, %xmm1
vpunpckhqdq %xmm9, %xmm8, %xmm2
vpunpckhqdq %xmm11, %xmm10, %xmm3
vpunpcklqdq %xmm13, %xmm12, %xmm4
vpunpcklqdq %xmm15, %xmm14, %xmm5
vpunpckhqdq %xmm13, %xmm12, %xmm6
vpunpckhqdq %xmm15, %xmm14, %xmm7
vmovdqu %xmm0, 32(%rdx)
vmovdqu %xmm1, 48(%rdx)
vmovdqu %xmm2, 96(%rdx)
vmovdqu %xmm3, 112(%rdx)
vmovdqu %xmm4, 160(%rdx)
vmovdqu %xmm5, 176(%rdx)
vmovdqu %xmm6, 224(%rdx)
vmovdqu %xmm7, 240(%rdx)
chacha_blocks_xop_mainloop_cont:
addq $256, %rdx
subq $256, %rcx
cmp $256, %rcx
jae chacha_blocks_xop_atleast256
movq %rbx, 48(%rsp)
vmovdqa 0(%rsp), %xmm8
vmovdqa 16(%rsp), %xmm9
vmovdqa 32(%rsp), %xmm10
vmovdqa 48(%rsp), %xmm11
movq $1, %r9
cmp $128, %rcx
jb chacha_blocks_xop_below128_fixup
chacha_blocks_xop_atleast128:
vmovd %r9, %xmm5
vmovdqa %xmm8, %xmm0
vmovdqa %xmm9, %xmm1
vmovdqa %xmm10, %xmm2
vmovdqa %xmm11, %xmm3
vpaddq %xmm5, %xmm11, %xmm11
vmovdqa %xmm8, 384(%rsp)
vmovdqa %xmm9, 400(%rsp)
vmovdqa %xmm10, 416(%rsp)
vmovdqa %xmm3, 432(%rsp)
vmovdqa %xmm11, 448(%rsp)
movq 64(%rsp), %rax
chacha_blocks_xop_mainloop2:
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vprotd $16, %xmm3, %xmm3
vprotd $16, %xmm11, %xmm11
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vprotd $12, %xmm1, %xmm1
vprotd $12, %xmm9, %xmm9
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vprotd $8, %xmm3, %xmm3
vprotd $8, %xmm11, %xmm11
vpshufd $0x93, %xmm0, %xmm0
vpshufd $0x93, %xmm8, %xmm8
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x4e, %xmm11, %xmm11
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vpshufd $0x39, %xmm2, %xmm2
vpshufd $0x39, %xmm10, %xmm10
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm9, %xmm9
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vprotd $16, %xmm3, %xmm3
vprotd $16, %xmm11, %xmm11
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vprotd $12, %xmm1, %xmm1
vprotd $12, %xmm9, %xmm9
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm8, %xmm9, %xmm8
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm11, %xmm8, %xmm11
vprotd $8, %xmm3, %xmm3
vprotd $8, %xmm11, %xmm11
vpshufd $0x39, %xmm0, %xmm0
vpshufd $0x39, %xmm8, %xmm8
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm10, %xmm11, %xmm10
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x4e, %xmm11, %xmm11
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm9, %xmm10, %xmm9
vpshufd $0x93, %xmm2, %xmm2
vpshufd $0x93, %xmm10, %xmm10
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm9, %xmm9
subq $2, %rax
jnz chacha_blocks_xop_mainloop2
vmovdqa 384(%rsp), %xmm12
vmovdqa 400(%rsp), %xmm13
vmovdqa 416(%rsp), %xmm14
vmovdqa 432(%rsp), %xmm15
vmovdqa 448(%rsp), %xmm5
vpaddd %xmm12, %xmm0, %xmm0
vpaddd %xmm13, %xmm1, %xmm1
vpaddd %xmm14, %xmm2, %xmm2
vpaddd %xmm15, %xmm3, %xmm3
vpaddd %xmm12, %xmm8, %xmm8
vpaddd %xmm13, %xmm9, %xmm9
vpaddd %xmm14, %xmm10, %xmm10
vpaddd %xmm5, %xmm11, %xmm11
andq %rsi, %rsi
jz chacha_blocks_xop_noinput2
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 32(%rsi), %xmm2, %xmm2
vpxor 48(%rsi), %xmm3, %xmm3
vpxor 64(%rsi), %xmm8, %xmm8
vpxor 80(%rsi), %xmm9, %xmm9
vpxor 96(%rsi), %xmm10, %xmm10
vpxor 112(%rsi), %xmm11, %xmm11
addq $128, %rsi
chacha_blocks_xop_noinput2:
addq $2, %rbx
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 32(%rdx)
vmovdqu %xmm3, 48(%rdx)
vmovdqu %xmm8, 64(%rdx)
vmovdqu %xmm9, 80(%rdx)
vmovdqu %xmm10, 96(%rdx)
vmovdqu %xmm11, 112(%rdx)
addq $128, %rdx
subq $128, %rcx
movq %rbx, 48(%rsp)
vmovdqa 0(%rsp), %xmm8
vmovdqa 16(%rsp), %xmm9
vmovdqa 32(%rsp), %xmm10
vmovdqa 48(%rsp), %xmm11
movq $1, %r9
chacha_blocks_xop_below128_fixup:
vmovd %r9, %xmm5
chacha_blocks_xop_below128:
andq %rcx, %rcx
jz chacha_blocks_xop_done
cmpq $64, %rcx
jae chacha_blocks_xop_above63
movq %rdx, %r9
andq %rsi, %rsi
jz chacha_blocks_xop_noinput3
movq %rcx, %r10
movq %rsp, %rdx
addq %r10, %rsi
addq %r10, %rdx
negq %r10
chacha_blocks_xop_copyinput:
movb (%rsi, %r10), %al
movb %al, (%rdx, %r10)
incq %r10
jnz chacha_blocks_xop_copyinput
movq %rsp, %rsi
chacha_blocks_xop_noinput3:
movq %rsp, %rdx
chacha_blocks_xop_above63:
vmovdqa %xmm8, %xmm0
vmovdqa %xmm9, %xmm1
vmovdqa %xmm10, %xmm2
vmovdqa %xmm11, %xmm3
movq 64(%rsp), %rax
chacha_blocks_xop_mainloop3:
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vprotd $16, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vprotd $12, %xmm1, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vprotd $8, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpshufd $0x93, %xmm0, %xmm0
vpxor %xmm1, %xmm2, %xmm1
vprotd $7, %xmm1, %xmm1
vpshufd $0x4e, %xmm3, %xmm3
vpaddd %xmm0, %xmm1, %xmm0
vpshufd $0x39, %xmm2, %xmm2
vpxor %xmm3, %xmm0, %xmm3
vprotd $16, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vprotd $12, %xmm1, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vprotd $8, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vpshufd $0x39, %xmm0, %xmm0
vprotd $7, %xmm1, %xmm1
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x93, %xmm2, %xmm2
subq $2, %rax
jnz chacha_blocks_xop_mainloop3
vpaddd %xmm0, %xmm8, %xmm0
vpaddd %xmm1, %xmm9, %xmm1
vpaddd %xmm2, %xmm10, %xmm2
vpaddd %xmm3, %xmm11, %xmm3
andq %rsi, %rsi
jz chacha_blocks_xop_noinput4
vpxor 0(%rsi), %xmm0, %xmm0
vpxor 16(%rsi), %xmm1, %xmm1
vpxor 32(%rsi), %xmm2, %xmm2
vpxor 48(%rsi), %xmm3, %xmm3
addq $64, %rsi
chacha_blocks_xop_noinput4:
vmovdqu %xmm0, 0(%rdx)
vmovdqu %xmm1, 16(%rdx)
vmovdqu %xmm2, 32(%rdx)
vmovdqu %xmm3, 48(%rdx)
vpaddq %xmm11, %xmm5, %xmm11
addq $1, %rbx
cmpq $64, %rcx
jbe chacha_blocks_xop_mainloop3_finishup
addq $64, %rdx
subq $64, %rcx
jmp chacha_blocks_xop_below128
chacha_blocks_xop_mainloop3_finishup:
cmpq $64, %rcx
je chacha_blocks_xop_done
addq %rcx, %r9
addq %rcx, %rdx
negq %rcx
chacha_blocks_xop_copyoutput:
movb (%rdx, %rcx), %al
movb %al, (%r9, %rcx)
incq %rcx
jnz chacha_blocks_xop_copyoutput
chacha_blocks_xop_done:
movq %rbx, 32(%rdi)
movq %rbp, %rsp
popq %rbp
popq %rbx
ret

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __i386__ && __XOP__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushl %ebp
movl %esp, %ebp
andl $~63, %esp
sub $704, %esp
movl %ebx, 68(%esp)
movl %esi, 72(%esp)
movl %edi, 76(%esp)
movl 8(%ebp), %ecx
movl %ecx, 84(%esp)
movl 12(%ebp), %esi
movl 16(%ebp), %edx
movl 20(%ebp), %eax
LOAD_VAR_PIC chacha_constants, %ebx
vmovdqa 0(%ebx), %xmm0
vmovdqu 0(%ecx), %xmm1
vmovdqu 16(%ecx), %xmm2
vmovdqu 32(%ecx), %xmm3
vmovdqa %xmm0, 0(%esp)
vmovdqa %xmm1, 16(%esp)
vmovdqa %xmm2, 32(%esp)
vmovdqa %xmm3, 48(%esp)
movl 48(%ecx), %ecx
movl %ecx, 88(%esp)
cmpl $128, %eax
jb chacha_blocks_xop_bytesbetween0and127
cmpl $256, %eax
jb chacha_blocks_xop_bytesatleast128
vpshufd $0x00, %xmm0, %xmm4
vpshufd $0x55, %xmm0, %xmm5
vpshufd $0xaa, %xmm0, %xmm6
vpshufd $0xff, %xmm0, %xmm0
vmovdqa %xmm4, 128(%esp)
vmovdqa %xmm5, 192(%esp)
vmovdqa %xmm6, 288(%esp)
vmovdqa %xmm0, 304(%esp)
vpshufd $0x00, %xmm1, %xmm0
vpshufd $0x55, %xmm1, %xmm4
vpshufd $0xaa, %xmm1, %xmm5
vpshufd $0xff, %xmm1, %xmm1
vmovdqa %xmm0, 144(%esp)
vmovdqa %xmm4, 208(%esp)
vmovdqa %xmm5, 256(%esp)
vmovdqa %xmm1, 272(%esp)
vpshufd $0x00, %xmm2, %xmm0
vpshufd $0x55, %xmm2, %xmm1
vpshufd $0xaa, %xmm2, %xmm4
vpshufd $0xff, %xmm2, %xmm2
vmovdqa %xmm0, 160(%esp)
vmovdqa %xmm1, 224(%esp)
vmovdqa %xmm4, 352(%esp)
vmovdqa %xmm2, 368(%esp)
vpshufd $0xaa, %xmm3, %xmm0
vpshufd $0xff, %xmm3, %xmm1
vmovdqa %xmm0, 320(%esp)
vmovdqa %xmm1, 336(%esp)
jmp chacha_blocks_xop_bytesatleast256
.p2align 6, ,63
chacha_blocks_xop_bytesatleast256:
movl 48(%esp), %ecx
movl 4+48(%esp), %ebx
movl %ecx, 176(%esp)
movl %ebx, 240(%esp)
addl $1, %ecx
adcl $0, %ebx
movl %ecx, 4+176(%esp)
movl %ebx, 4+240(%esp)
addl $1, %ecx
adcl $0, %ebx
movl %ecx, 8+176(%esp)
movl %ebx, 8+240(%esp)
addl $1, %ecx
adcl $0, %ebx
movl %ecx, 12+176(%esp)
movl %ebx, 12+240(%esp)
addl $1, %ecx
adcl $0, %ebx
movl %ecx, 48(%esp)
movl %ebx, 4+48(%esp)
movl %eax, 92(%esp)
movl 88(%esp), %eax
vmovdqa 256(%esp), %xmm0
vmovdqa 272(%esp), %xmm1
vmovdqa 288(%esp), %xmm2
vmovdqa 304(%esp), %xmm3
vmovdqa 320(%esp), %xmm4
vmovdqa 336(%esp), %xmm5
vmovdqa 352(%esp), %xmm6
vmovdqa 368(%esp), %xmm7
vmovdqa %xmm0, 576(%esp)
vmovdqa %xmm1, 592(%esp)
vmovdqa %xmm2, 608(%esp)
vmovdqa %xmm3, 624(%esp)
vmovdqa %xmm4, 640(%esp)
vmovdqa %xmm5, 656(%esp)
vmovdqa %xmm6, 672(%esp)
vmovdqa %xmm7, 688(%esp)
vmovdqa 128(%esp), %xmm0
vmovdqa 144(%esp), %xmm1
vmovdqa 160(%esp), %xmm2
vmovdqa 176(%esp), %xmm3
vmovdqa 192(%esp), %xmm4
vmovdqa 208(%esp), %xmm5
vmovdqa 224(%esp), %xmm6
vmovdqa 240(%esp), %xmm7
chacha_blocks_xop_mainloop1:
vpaddd %xmm1, %xmm0, %xmm0
vpxor %xmm0, %xmm3, %xmm3
vprotd $16, %xmm3, %xmm3
vpaddd %xmm5, %xmm4, %xmm4
vpxor %xmm4, %xmm7, %xmm7
vprotd $16, %xmm7, %xmm7
vpaddd %xmm3, %xmm2, %xmm2
vpaddd %xmm7, %xmm6, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vpxor %xmm6, %xmm5, %xmm5
vprotd $12, %xmm1, %xmm1
vpaddd %xmm1, %xmm0, %xmm0
vprotd $12, %xmm5, %xmm5
vpaddd %xmm5, %xmm4, %xmm4
vpxor %xmm0, %xmm3, %xmm3
vpxor %xmm4, %xmm7, %xmm7
vprotd $8, %xmm3, %xmm3
vprotd $8, %xmm7, %xmm7
vpaddd %xmm3, %xmm2, %xmm2
vpaddd %xmm7, %xmm6, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vpxor %xmm6, %xmm5, %xmm5
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm5, %xmm5
vmovdqa %xmm1, 464(%esp)
vmovdqa 576(%esp), %xmm1
vmovdqa %xmm5, 528(%esp)
vmovdqa 592(%esp), %xmm5
vmovdqa %xmm0, 448(%esp)
vmovdqa %xmm4, 512(%esp)
vmovdqa %xmm2, 480(%esp)
vmovdqa %xmm6, 544(%esp)
vmovdqa %xmm3, 496(%esp)
vmovdqa %xmm7, 560(%esp)
vpaddd 608(%esp), %xmm1, %xmm0
vpaddd 624(%esp), %xmm5, %xmm4
vpxor 640(%esp), %xmm0, %xmm3
vpxor 656(%esp), %xmm4, %xmm7
vprotd $16, %xmm3, %xmm3
vpaddd 672(%esp), %xmm3, %xmm2
vprotd $16, %xmm7, %xmm7
vpaddd 688(%esp), %xmm7, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vpxor %xmm6, %xmm5, %xmm5
vprotd $12, %xmm1, %xmm1
vpaddd %xmm1, %xmm0, %xmm0
vprotd $12, %xmm5, %xmm5
vpaddd %xmm5, %xmm4, %xmm4
vpxor %xmm0, %xmm3, %xmm3
vpxor %xmm4, %xmm7, %xmm7
vprotd $8, %xmm3, %xmm3
vpaddd %xmm3, %xmm2, %xmm2
vprotd $8, %xmm7, %xmm7
vpaddd %xmm7, %xmm6, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vpxor %xmm6, %xmm5, %xmm5
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm5, %xmm5
vmovdqa %xmm3, 640(%esp)
vmovdqa %xmm4, 624(%esp)
vmovdqa %xmm0, 608(%esp)
vmovdqa %xmm5, 592(%esp)
vmovdqa 528(%esp), %xmm5
vpaddd 448(%esp), %xmm5, %xmm4
vpaddd 512(%esp), %xmm1, %xmm0
vpxor %xmm7, %xmm4, %xmm7
vpxor 496(%esp), %xmm0, %xmm3
vprotd $16, %xmm7, %xmm7
vpaddd %xmm7, %xmm2, %xmm2
vprotd $16, %xmm3, %xmm3
vpaddd %xmm3, %xmm6, %xmm6
vpxor %xmm2, %xmm5, %xmm5
vpxor %xmm6, %xmm1, %xmm1
vprotd $12, %xmm5, %xmm5
vpaddd %xmm5, %xmm4, %xmm4
vprotd $12, %xmm1, %xmm1
vpaddd %xmm1, %xmm0, %xmm0
vpxor %xmm4, %xmm7, %xmm7
vpxor %xmm0, %xmm3, %xmm3
vprotd $8, %xmm7, %xmm7
vpaddd %xmm7, %xmm2, %xmm2
vprotd $8, %xmm3, %xmm3
vpaddd %xmm3, %xmm6, %xmm6
vpxor %xmm2, %xmm5, %xmm5
vpxor %xmm6, %xmm1, %xmm1
vprotd $7, %xmm5, %xmm5
vprotd $7, %xmm1, %xmm1
vmovdqa %xmm4, 448(%esp)
vmovdqa %xmm3, 496(%esp)
vmovdqa %xmm0, 512(%esp)
vmovdqa %xmm5, 528(%esp)
vmovdqa %xmm1, 576(%esp)
vmovdqa %xmm7, 656(%esp)
vmovdqa %xmm2, 672(%esp)
vmovdqa %xmm6, 688(%esp)
vmovdqa 592(%esp), %xmm1
vmovdqa 464(%esp), %xmm5
vpaddd 608(%esp), %xmm1, %xmm0
vpaddd 624(%esp), %xmm5, %xmm4
vpxor 560(%esp), %xmm0, %xmm3
vpxor 640(%esp), %xmm4, %xmm7
vprotd $16, %xmm3, %xmm3
vpaddd 480(%esp), %xmm3, %xmm2
vprotd $16, %xmm7, %xmm7
vpaddd 544(%esp), %xmm7, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vpxor %xmm6, %xmm5, %xmm5
vprotd $12, %xmm1, %xmm1
vpaddd %xmm1, %xmm0, %xmm0
vprotd $12, %xmm5, %xmm5
vpaddd %xmm5, %xmm4, %xmm4
vpxor %xmm0, %xmm3, %xmm3
vpxor %xmm4, %xmm7, %xmm7
vprotd $8, %xmm3, %xmm3
vpaddd %xmm3, %xmm2, %xmm2
vprotd $8, %xmm7, %xmm7
vpaddd %xmm7, %xmm6, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vpxor %xmm6, %xmm5, %xmm5
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm5, %xmm5
vmovdqa %xmm7, 640(%esp)
vmovdqa %xmm4, 624(%esp)
vmovdqa %xmm0, 608(%esp)
vmovdqa %xmm1, 592(%esp)
vmovdqa %xmm3, %xmm7
vmovdqa %xmm5, %xmm1
vmovdqa 448(%esp), %xmm0
vmovdqa 496(%esp), %xmm3
vmovdqa 512(%esp), %xmm4
vmovdqa 528(%esp), %xmm5
subl $2, %eax
ja chacha_blocks_xop_mainloop1
vmovdqa %xmm2, 480(%esp)
vmovdqa %xmm6, 544(%esp)
vmovdqa %xmm1, 464(%esp)
vmovdqa %xmm7, 560(%esp)
cmpl $0, %esi
jbe chacha_blocks_xop_noinput1
vmovdqa 448(%esp), %xmm0
vmovdqa 512(%esp), %xmm1
vmovdqa 608(%esp), %xmm2
vmovdqa 624(%esp), %xmm3
vpaddd 128(%esp), %xmm0, %xmm0
vpaddd 192(%esp), %xmm1, %xmm1
vpaddd 288(%esp), %xmm2, %xmm2
vpaddd 304(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vpxor 0(%esi), %xmm0, %xmm0
vpxor 64(%esi), %xmm1, %xmm1
vpxor 128(%esi), %xmm2, %xmm2
vpxor 192(%esi), %xmm3, %xmm3
vmovdqu %xmm0, 0(%edx)
vmovdqu %xmm1, 64(%edx)
vmovdqu %xmm2, 128(%edx)
vmovdqu %xmm3, 192(%edx)
vmovdqa 464(%esp), %xmm0
vmovdqa 528(%esp), %xmm1
vmovdqa 576(%esp), %xmm2
vmovdqa 592(%esp), %xmm3
vpaddd 144(%esp), %xmm0, %xmm0
vpaddd 208(%esp), %xmm1, %xmm1
vpaddd 256(%esp), %xmm2, %xmm2
vpaddd 272(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vpxor 16+0(%esi), %xmm0, %xmm0
vpxor 16+64(%esi), %xmm1, %xmm1
vpxor 16+128(%esi), %xmm2, %xmm2
vpxor 16+192(%esi), %xmm3, %xmm3
vmovdqu %xmm0, 16+0(%edx)
vmovdqu %xmm1, 16+64(%edx)
vmovdqu %xmm2, 16+128(%edx)
vmovdqu %xmm3, 16+192(%edx)
vmovdqa 480(%esp), %xmm0
vmovdqa 544(%esp), %xmm1
vmovdqa 672(%esp), %xmm2
vmovdqa 688(%esp), %xmm3
vpaddd 160(%esp), %xmm0, %xmm0
vpaddd 224(%esp), %xmm1, %xmm1
vpaddd 352(%esp), %xmm2, %xmm2
vpaddd 368(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vpxor 32+0(%esi), %xmm0, %xmm0
vpxor 32+64(%esi), %xmm1, %xmm1
vpxor 32+128(%esi), %xmm2, %xmm2
vpxor 32+192(%esi), %xmm3, %xmm3
vmovdqu %xmm0, 32+0(%edx)
vmovdqu %xmm1, 32+64(%edx)
vmovdqu %xmm2, 32+128(%edx)
vmovdqu %xmm3, 32+192(%edx)
vmovdqa 496(%esp), %xmm0
vmovdqa 560(%esp), %xmm1
vmovdqa 640(%esp), %xmm2
vmovdqa 656(%esp), %xmm3
vpaddd 176(%esp), %xmm0, %xmm0
vpaddd 240(%esp), %xmm1, %xmm1
vpaddd 320(%esp), %xmm2, %xmm2
vpaddd 336(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vpxor 48+0(%esi), %xmm0, %xmm0
vpxor 48+64(%esi), %xmm1, %xmm1
vpxor 48+128(%esi), %xmm2, %xmm2
vpxor 48+192(%esi), %xmm3, %xmm3
vmovdqu %xmm0, 48+0(%edx)
vmovdqu %xmm1, 48+64(%edx)
vmovdqu %xmm2, 48+128(%edx)
vmovdqu %xmm3, 48+192(%edx)
addl $256, %esi
jmp chacha_blocks_xop_mainloop1_cont
chacha_blocks_xop_noinput1:
vmovdqa 448(%esp), %xmm0
vmovdqa 512(%esp), %xmm1
vmovdqa 608(%esp), %xmm2
vmovdqa 624(%esp), %xmm3
vpaddd 128(%esp), %xmm0, %xmm0
vpaddd 192(%esp), %xmm1, %xmm1
vpaddd 288(%esp), %xmm2, %xmm2
vpaddd 304(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vmovdqu %xmm0, 0(%edx)
vmovdqu %xmm1, 64(%edx)
vmovdqu %xmm2, 128(%edx)
vmovdqu %xmm3, 192(%edx)
vmovdqa 464(%esp), %xmm0
vmovdqa 528(%esp), %xmm1
vmovdqa 576(%esp), %xmm2
vmovdqa 592(%esp), %xmm3
vpaddd 144(%esp), %xmm0, %xmm0
vpaddd 208(%esp), %xmm1, %xmm1
vpaddd 256(%esp), %xmm2, %xmm2
vpaddd 272(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vmovdqu %xmm0, 16+0(%edx)
vmovdqu %xmm1, 16+64(%edx)
vmovdqu %xmm2, 16+128(%edx)
vmovdqu %xmm3, 16+192(%edx)
vmovdqa 480(%esp), %xmm0
vmovdqa 544(%esp), %xmm1
vmovdqa 672(%esp), %xmm2
vmovdqa 688(%esp), %xmm3
vpaddd 160(%esp), %xmm0, %xmm0
vpaddd 224(%esp), %xmm1, %xmm1
vpaddd 352(%esp), %xmm2, %xmm2
vpaddd 368(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vmovdqu %xmm0, 32+0(%edx)
vmovdqu %xmm1, 32+64(%edx)
vmovdqu %xmm2, 32+128(%edx)
vmovdqu %xmm3, 32+192(%edx)
vmovdqa 496(%esp), %xmm0
vmovdqa 560(%esp), %xmm1
vmovdqa 640(%esp), %xmm2
vmovdqa 656(%esp), %xmm3
vpaddd 176(%esp), %xmm0, %xmm0
vpaddd 240(%esp), %xmm1, %xmm1
vpaddd 320(%esp), %xmm2, %xmm2
vpaddd 336(%esp), %xmm3, %xmm3
vpunpckldq %xmm1, %xmm0, %xmm4
vpunpckldq %xmm3, %xmm2, %xmm5
vpunpckhdq %xmm1, %xmm0, %xmm6
vpunpckhdq %xmm3, %xmm2, %xmm7
vpunpcklqdq %xmm5, %xmm4, %xmm0
vpunpckhqdq %xmm5, %xmm4, %xmm1
vpunpcklqdq %xmm7, %xmm6, %xmm2
vpunpckhqdq %xmm7, %xmm6, %xmm3
vmovdqu %xmm0, 48+0(%edx)
vmovdqu %xmm1, 48+64(%edx)
vmovdqu %xmm2, 48+128(%edx)
vmovdqu %xmm3, 48+192(%edx)
chacha_blocks_xop_mainloop1_cont:
movl 92(%esp), %eax
subl $256, %eax
addl $256, %edx
cmpl $256, %eax
jae chacha_blocks_xop_bytesatleast256
cmpl $128, %eax
jb chacha_blocks_xop_bytesbetween0and127
chacha_blocks_xop_bytesatleast128:
movl $1, %ecx
vmovdqa 0(%esp), %xmm0
vmovdqa 16(%esp), %xmm1
vmovdqa 32(%esp), %xmm2
vmovdqa 48(%esp), %xmm3
vmovd %ecx, %xmm7
vmovdqa %xmm0, %xmm4
vmovdqa %xmm1, %xmm5
vmovdqa %xmm2, %xmm6
vpaddq %xmm3, %xmm7, %xmm7
movl %eax, 92(%esp)
movl 88(%esp), %eax
vmovdqa %xmm7, 448(%esp)
chacha_blocks_xop_mainloop2:
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm4, %xmm5, %xmm4
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm7, %xmm4, %xmm7
vprotd $16, %xmm3, %xmm3
vprotd $16, %xmm7, %xmm7
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm6, %xmm7, %xmm6
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm5, %xmm6, %xmm5
vprotd $12, %xmm1, %xmm1
vprotd $12, %xmm5, %xmm5
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm4, %xmm5, %xmm4
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm7, %xmm4, %xmm7
vprotd $8, %xmm3, %xmm3
vprotd $8, %xmm7, %xmm7
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm6, %xmm7, %xmm6
vpshufd $0x93, %xmm0, %xmm0
vpshufd $0x93, %xmm4, %xmm4
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm5, %xmm6, %xmm5
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm5, %xmm5
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x4e, %xmm7, %xmm7
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm4, %xmm5, %xmm4
vpshufd $0x39, %xmm2, %xmm2
vpshufd $0x39, %xmm6, %xmm6
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm7, %xmm4, %xmm7
vprotd $16, %xmm3, %xmm3
vprotd $16, %xmm7, %xmm7
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm6, %xmm7, %xmm6
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm5, %xmm6, %xmm5
vprotd $12, %xmm1, %xmm1
vprotd $12, %xmm5, %xmm5
vpaddd %xmm0, %xmm1, %xmm0
vpaddd %xmm4, %xmm5, %xmm4
vpxor %xmm3, %xmm0, %xmm3
vpxor %xmm7, %xmm4, %xmm7
vprotd $8, %xmm3, %xmm3
vprotd $8, %xmm7, %xmm7
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm6, %xmm7, %xmm6
vpxor %xmm1, %xmm2, %xmm1
vpxor %xmm5, %xmm6, %xmm5
vpshufd $0x39, %xmm0, %xmm0
vpshufd $0x39, %xmm4, %xmm4
vprotd $7, %xmm1, %xmm1
vprotd $7, %xmm5, %xmm5
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x4e, %xmm7, %xmm7
vpshufd $0x93, %xmm2, %xmm2
vpshufd $0x93, %xmm6, %xmm6
sub $2, %eax
jnz chacha_blocks_xop_mainloop2
vpaddd 0(%esp), %xmm0, %xmm0
vpaddd 0(%esp), %xmm4, %xmm4
vpaddd 16(%esp), %xmm1, %xmm1
vpaddd 16(%esp), %xmm5, %xmm5
vpaddd 32(%esp), %xmm2, %xmm2
vpaddd 32(%esp), %xmm6, %xmm6
vpaddd 48(%esp), %xmm3, %xmm3
vpaddd 448(%esp), %xmm7, %xmm7
andl %esi, %esi
jz chacha_blocks_xop_noinput2
vpxor 0(%esi), %xmm0, %xmm0
vpxor 16(%esi), %xmm1, %xmm1
vpxor 32(%esi), %xmm2, %xmm2
vpxor 48(%esi), %xmm3, %xmm3
vpxor 64(%esi), %xmm4, %xmm4
vpxor 80(%esi), %xmm5, %xmm5
vpxor 96(%esi), %xmm6, %xmm6
vpxor 112(%esi), %xmm7, %xmm7
addl $128, %esi
chacha_blocks_xop_noinput2:
vmovdqu %xmm0, 0(%edx)
vmovdqu %xmm1, 16(%edx)
vmovdqu %xmm2, 32(%edx)
vmovdqu %xmm3, 48(%edx)
vmovdqu %xmm4, 64(%edx)
vmovdqu %xmm5, 80(%edx)
vmovdqu %xmm6, 96(%edx)
vmovdqu %xmm7, 112(%edx)
movl 92(%esp), %eax
subl $128, %eax
addl $128, %edx
movl 48(%esp), %ecx
movl 4+48(%esp), %ebx
addl $2, %ecx
adcl $0, %ebx
movl %ecx, 48(%esp)
movl %ebx, 4+48(%esp)
chacha_blocks_xop_bytesbetween0and127:
andl %eax, %eax
jz chacha_blocks_xop_done
cmpl $64, %eax
jae chacha_blocks_xop_nocopy
movl %edx, 92(%esp)
cmpl $0, %esi
jbe chacha_blocks_xop_noinput3
leal 128(%esp), %edi
movl %eax, %ecx
rep movsb
leal 128(%esp), %esi
chacha_blocks_xop_noinput3:
leal 128(%esp), %edx
chacha_blocks_xop_nocopy:
movl %eax, 80(%esp)
vmovdqa 0(%esp), %xmm0
vmovdqa 16(%esp), %xmm1
vmovdqa 32(%esp), %xmm2
vmovdqa 48(%esp), %xmm3
movl 88(%esp), %eax
chacha_blocks_xop_mainloop3:
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vprotd $16, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vprotd $12, %xmm1, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vprotd $8, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpshufd $0x93, %xmm0, %xmm0
vpxor %xmm1, %xmm2, %xmm1
vprotd $7, %xmm1, %xmm1
vpshufd $0x4e, %xmm3, %xmm3
vpaddd %xmm0, %xmm1, %xmm0
vpshufd $0x39, %xmm2, %xmm2
vpxor %xmm3, %xmm0, %xmm3
vprotd $16, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vprotd $12, %xmm1, %xmm1
vpaddd %xmm0, %xmm1, %xmm0
vpxor %xmm3, %xmm0, %xmm3
vprotd $8, %xmm3, %xmm3
vpaddd %xmm2, %xmm3, %xmm2
vpxor %xmm1, %xmm2, %xmm1
vpshufd $0x39, %xmm0, %xmm0
vprotd $7, %xmm1, %xmm1
vpshufd $0x4e, %xmm3, %xmm3
vpshufd $0x93, %xmm2, %xmm2
subl $2, %eax
ja chacha_blocks_xop_mainloop3
vpaddd 0(%esp), %xmm0, %xmm0
vpaddd 16(%esp), %xmm1, %xmm1
vpaddd 32(%esp), %xmm2, %xmm2
vpaddd 48(%esp), %xmm3, %xmm3
cmpl $0, %esi
jbe chacha_blocks_xop_noinput4
vpxor 0(%esi), %xmm0, %xmm0
vpxor 16(%esi), %xmm1, %xmm1
vpxor 32(%esi), %xmm2, %xmm2
vpxor 48(%esi), %xmm3, %xmm3
addl $64, %esi
chacha_blocks_xop_noinput4:
vmovdqu %xmm0, 0(%edx)
vmovdqu %xmm1, 16(%edx)
vmovdqu %xmm2, 32(%edx)
vmovdqu %xmm3, 48(%edx)
movl 80(%esp), %eax
movl 48(%esp), %ecx
movl 4+48(%esp), %ebx
addl $1, %ecx
adcl $0, %ebx
movl %ecx, 48(%esp)
movl %ebx, 4+48(%esp)
cmpl $64, %eax
jb chacha_blocks_xop_bytesatmost64
subl $64, %eax
addl $64, %edx
jmp chacha_blocks_xop_bytesbetween0and127
chacha_blocks_xop_bytesatmost64:
jae chacha_blocks_xop_bytesatleast64
movl %edx, %esi
movl 92(%esp), %edi
movl %eax, %ecx
rep movsb
chacha_blocks_xop_bytesatleast64:
chacha_blocks_xop_done:
movl 84(%esp), %eax
vmovdqa 48(%esp), %xmm0
vmovdqu %xmm0, 32(%eax)
movl 64(%esp), %eax
movl 68(%esp), %ebx
movl 72(%esp), %esi
movl 76(%esp), %edi
movl %ebp, %esp
popl %ebp
ret

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __amd64__ && __SSSE3__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushq %rbx
pushq %rbp
movq %rsp, %rbp
andq $~63, %rsp
subq $512, %rsp
LOAD_VAR_PIC chacha_constants, %rax
movdqa 0(%rax), %xmm8
movdqa 16(%rax), %xmm6
movdqa 32(%rax), %xmm7
movdqu 0(%rdi), %xmm9
movdqu 16(%rdi), %xmm10
movdqu 32(%rdi), %xmm11
movq 48(%rdi), %rax
movq $1, %r9
movdqa %xmm8, 0(%rsp)
movdqa %xmm9, 16(%rsp)
movdqa %xmm10, 32(%rsp)
movdqa %xmm11, 48(%rsp)
movdqa %xmm6, 80(%rsp)
movdqa %xmm7, 96(%rsp)
movq %rax, 64(%rsp)
cmpq $256, %rcx
jb chacha_blocks_ssse3_below256
pshufd $0x00, %xmm8, %xmm0
pshufd $0x55, %xmm8, %xmm1
pshufd $0xaa, %xmm8, %xmm2
pshufd $0xff, %xmm8, %xmm3
movdqa %xmm0, 128(%rsp)
movdqa %xmm1, 144(%rsp)
movdqa %xmm2, 160(%rsp)
movdqa %xmm3, 176(%rsp)
pshufd $0x00, %xmm9, %xmm0
pshufd $0x55, %xmm9, %xmm1
pshufd $0xaa, %xmm9, %xmm2
pshufd $0xff, %xmm9, %xmm3
movdqa %xmm0, 192(%rsp)
movdqa %xmm1, 208(%rsp)
movdqa %xmm2, 224(%rsp)
movdqa %xmm3, 240(%rsp)
pshufd $0x00, %xmm10, %xmm0
pshufd $0x55, %xmm10, %xmm1
pshufd $0xaa, %xmm10, %xmm2
pshufd $0xff, %xmm10, %xmm3
movdqa %xmm0, 256(%rsp)
movdqa %xmm1, 272(%rsp)
movdqa %xmm2, 288(%rsp)
movdqa %xmm3, 304(%rsp)
pshufd $0xaa, %xmm11, %xmm0
pshufd $0xff, %xmm11, %xmm1
movdqa %xmm0, 352(%rsp)
movdqa %xmm1, 368(%rsp)
jmp chacha_blocks_ssse3_atleast256
.p2align 6,,63
nop
nop
nop
nop
chacha_blocks_ssse3_atleast256:
movq 48(%rsp), %rax
leaq 1(%rax), %r8
leaq 2(%rax), %r9
leaq 3(%rax), %r10
leaq 4(%rax), %rbx
movl %eax, 320(%rsp)
movl %r8d, 4+320(%rsp)
movl %r9d, 8+320(%rsp)
movl %r10d, 12+320(%rsp)
shrq $32, %rax
shrq $32, %r8
shrq $32, %r9
shrq $32, %r10
movl %eax, 336(%rsp)
movl %r8d, 4+336(%rsp)
movl %r9d, 8+336(%rsp)
movl %r10d, 12+336(%rsp)
movq %rbx, 48(%rsp)
movq 64(%rsp), %rax
movdqa 128(%rsp), %xmm0
movdqa 144(%rsp), %xmm1
movdqa 160(%rsp), %xmm2
movdqa 176(%rsp), %xmm3
movdqa 192(%rsp), %xmm4
movdqa 208(%rsp), %xmm5
movdqa 224(%rsp), %xmm6
movdqa 240(%rsp), %xmm7
movdqa 256(%rsp), %xmm8
movdqa 272(%rsp), %xmm9
movdqa 288(%rsp), %xmm10
movdqa 304(%rsp), %xmm11
movdqa 320(%rsp), %xmm12
movdqa 336(%rsp), %xmm13
movdqa 352(%rsp), %xmm14
movdqa 368(%rsp), %xmm15
chacha_blocks_ssse3_mainloop1:
paddd %xmm4, %xmm0
paddd %xmm5, %xmm1
pxor %xmm0, %xmm12
pxor %xmm1, %xmm13
paddd %xmm6, %xmm2
paddd %xmm7, %xmm3
pxor %xmm2, %xmm14
pxor %xmm3, %xmm15
pshufb 80(%rsp), %xmm12
pshufb 80(%rsp), %xmm13
paddd %xmm12, %xmm8
paddd %xmm13, %xmm9
pshufb 80(%rsp), %xmm14
pshufb 80(%rsp), %xmm15
paddd %xmm14, %xmm10
paddd %xmm15, %xmm11
movdqa %xmm12, 112(%rsp)
pxor %xmm8, %xmm4
pxor %xmm9, %xmm5
movdqa %xmm4, %xmm12
pslld $ 12, %xmm4
psrld $20, %xmm12
pxor %xmm12, %xmm4
movdqa %xmm5, %xmm12
pslld $ 12, %xmm5
psrld $20, %xmm12
pxor %xmm12, %xmm5
pxor %xmm10, %xmm6
pxor %xmm11, %xmm7
movdqa %xmm6, %xmm12
pslld $ 12, %xmm6
psrld $20, %xmm12
pxor %xmm12, %xmm6
movdqa %xmm7, %xmm12
pslld $ 12, %xmm7
psrld $20, %xmm12
pxor %xmm12, %xmm7
movdqa 112(%rsp), %xmm12
paddd %xmm4, %xmm0
paddd %xmm5, %xmm1
pxor %xmm0, %xmm12
pxor %xmm1, %xmm13
paddd %xmm6, %xmm2
paddd %xmm7, %xmm3
pxor %xmm2, %xmm14
pxor %xmm3, %xmm15
pshufb 96(%rsp), %xmm12
pshufb 96(%rsp), %xmm13
paddd %xmm12, %xmm8
paddd %xmm13, %xmm9
pshufb 96(%rsp), %xmm14
pshufb 96(%rsp), %xmm15
paddd %xmm14, %xmm10
paddd %xmm15, %xmm11
movdqa %xmm12, 112(%rsp)
pxor %xmm8, %xmm4
pxor %xmm9, %xmm5
movdqa %xmm4, %xmm12
pslld $ 7, %xmm4
psrld $25, %xmm12
pxor %xmm12, %xmm4
movdqa %xmm5, %xmm12
pslld $ 7, %xmm5
psrld $25, %xmm12
pxor %xmm12, %xmm5
pxor %xmm10, %xmm6
pxor %xmm11, %xmm7
movdqa %xmm6, %xmm12
pslld $ 7, %xmm6
psrld $25, %xmm12
pxor %xmm12, %xmm6
movdqa %xmm7, %xmm12
pslld $ 7, %xmm7
psrld $25, %xmm12
pxor %xmm12, %xmm7
movdqa 112(%rsp), %xmm12
paddd %xmm5, %xmm0
paddd %xmm6, %xmm1
pxor %xmm0, %xmm15
pxor %xmm1, %xmm12
paddd %xmm7, %xmm2
paddd %xmm4, %xmm3
pxor %xmm2, %xmm13
pxor %xmm3, %xmm14
pshufb 80(%rsp), %xmm15
pshufb 80(%rsp), %xmm12
paddd %xmm15, %xmm10
paddd %xmm12, %xmm11
pshufb 80(%rsp), %xmm13
pshufb 80(%rsp), %xmm14
paddd %xmm13, %xmm8
paddd %xmm14, %xmm9
movdqa %xmm15, 112(%rsp)
pxor %xmm10, %xmm5
pxor %xmm11, %xmm6
movdqa %xmm5, %xmm15
pslld $ 12, %xmm5
psrld $20, %xmm15
pxor %xmm15, %xmm5
movdqa %xmm6, %xmm15
pslld $ 12, %xmm6
psrld $20, %xmm15
pxor %xmm15, %xmm6
pxor %xmm8, %xmm7
pxor %xmm9, %xmm4
movdqa %xmm7, %xmm15
pslld $ 12, %xmm7
psrld $20, %xmm15
pxor %xmm15, %xmm7
movdqa %xmm4, %xmm15
pslld $ 12, %xmm4
psrld $20, %xmm15
pxor %xmm15, %xmm4
movdqa 112(%rsp), %xmm15
paddd %xmm5, %xmm0
paddd %xmm6, %xmm1
pxor %xmm0, %xmm15
pxor %xmm1, %xmm12
paddd %xmm7, %xmm2
paddd %xmm4, %xmm3
pxor %xmm2, %xmm13
pxor %xmm3, %xmm14
pshufb 96(%rsp), %xmm15
pshufb 96(%rsp), %xmm12
paddd %xmm15, %xmm10
paddd %xmm12, %xmm11
pshufb 96(%rsp), %xmm13
pshufb 96(%rsp), %xmm14
paddd %xmm13, %xmm8
paddd %xmm14, %xmm9
movdqa %xmm15, 112(%rsp)
pxor %xmm10, %xmm5
pxor %xmm11, %xmm6
movdqa %xmm5, %xmm15
pslld $ 7, %xmm5
psrld $25, %xmm15
pxor %xmm15, %xmm5
movdqa %xmm6, %xmm15
pslld $ 7, %xmm6
psrld $25, %xmm15
pxor %xmm15, %xmm6
pxor %xmm8, %xmm7
pxor %xmm9, %xmm4
movdqa %xmm7, %xmm15
pslld $ 7, %xmm7
psrld $25, %xmm15
pxor %xmm15, %xmm7
movdqa %xmm4, %xmm15
pslld $ 7, %xmm4
psrld $25, %xmm15
pxor %xmm15, %xmm4
subq $2, %rax
movdqa 112(%rsp), %xmm15
jnz chacha_blocks_ssse3_mainloop1
paddd 128(%rsp), %xmm0
paddd 144(%rsp), %xmm1
paddd 160(%rsp), %xmm2
paddd 176(%rsp), %xmm3
paddd 192(%rsp), %xmm4
paddd 208(%rsp), %xmm5
paddd 224(%rsp), %xmm6
paddd 240(%rsp), %xmm7
paddd 256(%rsp), %xmm8
paddd 272(%rsp), %xmm9
paddd 288(%rsp), %xmm10
paddd 304(%rsp), %xmm11
paddd 320(%rsp), %xmm12
paddd 336(%rsp), %xmm13
paddd 352(%rsp), %xmm14
paddd 368(%rsp), %xmm15
movdqa %xmm8, 384(%rsp)
movdqa %xmm9, 400(%rsp)
movdqa %xmm10, 416(%rsp)
movdqa %xmm11, 432(%rsp)
movdqa %xmm12, 448(%rsp)
movdqa %xmm13, 464(%rsp)
movdqa %xmm14, 480(%rsp)
movdqa %xmm15, 496(%rsp)
movdqa %xmm0, %xmm8
movdqa %xmm2, %xmm9
movdqa %xmm4, %xmm10
movdqa %xmm6, %xmm11
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
punpckhdq %xmm5, %xmm4
punpckhdq %xmm7, %xmm6
punpckldq %xmm1, %xmm8
punpckldq %xmm3, %xmm9
punpckldq %xmm5, %xmm10
punpckldq %xmm7, %xmm11
movdqa %xmm0, %xmm1
movdqa %xmm4, %xmm3
movdqa %xmm8, %xmm5
movdqa %xmm10, %xmm7
punpckhqdq %xmm2, %xmm0
punpckhqdq %xmm6, %xmm4
punpckhqdq %xmm9, %xmm8
punpckhqdq %xmm11, %xmm10
punpcklqdq %xmm2, %xmm1
punpcklqdq %xmm6, %xmm3
punpcklqdq %xmm9, %xmm5
punpcklqdq %xmm11, %xmm7
andq %rsi, %rsi
jz chacha_blocks_ssse3_noinput1
movdqu 0(%rsi), %xmm2
movdqu 16(%rsi), %xmm6
movdqu 64(%rsi), %xmm9
movdqu 80(%rsi), %xmm11
movdqu 128(%rsi), %xmm12
movdqu 144(%rsi), %xmm13
movdqu 192(%rsi), %xmm14
movdqu 208(%rsi), %xmm15
pxor %xmm2, %xmm5
pxor %xmm6, %xmm7
pxor %xmm9, %xmm8
pxor %xmm11, %xmm10
pxor %xmm12, %xmm1
pxor %xmm13, %xmm3
pxor %xmm14, %xmm0
pxor %xmm15, %xmm4
movdqu %xmm5, 0(%rdx)
movdqu %xmm7, 16(%rdx)
movdqu %xmm8, 64(%rdx)
movdqu %xmm10, 80(%rdx)
movdqu %xmm1, 128(%rdx)
movdqu %xmm3, 144(%rdx)
movdqu %xmm0, 192(%rdx)
movdqu %xmm4, 208(%rdx)
movdqa 384(%rsp), %xmm0
movdqa 400(%rsp), %xmm1
movdqa 416(%rsp), %xmm2
movdqa 432(%rsp), %xmm3
movdqa 448(%rsp), %xmm4
movdqa 464(%rsp), %xmm5
movdqa 480(%rsp), %xmm6
movdqa 496(%rsp), %xmm7
movdqa %xmm0, %xmm8
movdqa %xmm2, %xmm9
movdqa %xmm4, %xmm10
movdqa %xmm6, %xmm11
punpckldq %xmm1, %xmm8
punpckldq %xmm3, %xmm9
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
punpckldq %xmm5, %xmm10
punpckldq %xmm7, %xmm11
punpckhdq %xmm5, %xmm4
punpckhdq %xmm7, %xmm6
movdqa %xmm8, %xmm1
movdqa %xmm0, %xmm3
movdqa %xmm10, %xmm5
movdqa %xmm4, %xmm7
punpcklqdq %xmm9, %xmm1
punpcklqdq %xmm11, %xmm5
punpckhqdq %xmm9, %xmm8
punpckhqdq %xmm11, %xmm10
punpcklqdq %xmm2, %xmm3
punpcklqdq %xmm6, %xmm7
punpckhqdq %xmm2, %xmm0
punpckhqdq %xmm6, %xmm4
movdqu 32(%rsi), %xmm2
movdqu 48(%rsi), %xmm6
movdqu 96(%rsi), %xmm9
movdqu 112(%rsi), %xmm11
movdqu 160(%rsi), %xmm12
movdqu 176(%rsi), %xmm13
movdqu 224(%rsi), %xmm14
movdqu 240(%rsi), %xmm15
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
pxor %xmm9, %xmm8
pxor %xmm11, %xmm10
pxor %xmm12, %xmm3
pxor %xmm13, %xmm7
pxor %xmm14, %xmm0
pxor %xmm15, %xmm4
movdqu %xmm1, 32(%rdx)
movdqu %xmm5, 48(%rdx)
movdqu %xmm8, 96(%rdx)
movdqu %xmm10, 112(%rdx)
movdqu %xmm3, 160(%rdx)
movdqu %xmm7, 176(%rdx)
movdqu %xmm0, 224(%rdx)
movdqu %xmm4, 240(%rdx)
addq $256, %rsi
jmp chacha_blocks_ssse3_mainloop_cont
chacha_blocks_ssse3_noinput1:
movdqu %xmm5, 0(%rdx)
movdqu %xmm7, 16(%rdx)
movdqu %xmm8, 64(%rdx)
movdqu %xmm10, 80(%rdx)
movdqu %xmm1, 128(%rdx)
movdqu %xmm3, 144(%rdx)
movdqu %xmm0, 192(%rdx)
movdqu %xmm4, 208(%rdx)
movdqa 384(%rsp), %xmm0
movdqa 400(%rsp), %xmm1
movdqa 416(%rsp), %xmm2
movdqa 432(%rsp), %xmm3
movdqa 448(%rsp), %xmm4
movdqa 464(%rsp), %xmm5
movdqa 480(%rsp), %xmm6
movdqa 496(%rsp), %xmm7
movdqa %xmm0, %xmm8
movdqa %xmm2, %xmm9
movdqa %xmm4, %xmm10
movdqa %xmm6, %xmm11
punpckldq %xmm1, %xmm8
punpckldq %xmm3, %xmm9
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
punpckldq %xmm5, %xmm10
punpckldq %xmm7, %xmm11
punpckhdq %xmm5, %xmm4
punpckhdq %xmm7, %xmm6
movdqa %xmm8, %xmm1
movdqa %xmm0, %xmm3
movdqa %xmm10, %xmm5
movdqa %xmm4, %xmm7
punpcklqdq %xmm9, %xmm1
punpcklqdq %xmm11, %xmm5
punpckhqdq %xmm9, %xmm8
punpckhqdq %xmm11, %xmm10
punpcklqdq %xmm2, %xmm3
punpcklqdq %xmm6, %xmm7
punpckhqdq %xmm2, %xmm0
punpckhqdq %xmm6, %xmm4
movdqu %xmm1, 32(%rdx)
movdqu %xmm5, 48(%rdx)
movdqu %xmm8, 96(%rdx)
movdqu %xmm10, 112(%rdx)
movdqu %xmm3, 160(%rdx)
movdqu %xmm7, 176(%rdx)
movdqu %xmm0, 224(%rdx)
movdqu %xmm4, 240(%rdx)
chacha_blocks_ssse3_mainloop_cont:
addq $256, %rdx
subq $256, %rcx
cmp $256, %rcx
jae chacha_blocks_ssse3_atleast256
movdqa 80(%rsp), %xmm6
movdqa 96(%rsp), %xmm7
movdqa 0(%rsp), %xmm8
movdqa 16(%rsp), %xmm9
movdqa 32(%rsp), %xmm10
movdqa 48(%rsp), %xmm11
movq $1, %r9
chacha_blocks_ssse3_below256:
movq %r9, %xmm5
andq %rcx, %rcx
jz chacha_blocks_ssse3_done
cmpq $64, %rcx
jae chacha_blocks_ssse3_above63
movq %rdx, %r9
andq %rsi, %rsi
jz chacha_blocks_ssse3_noinput2
movq %rcx, %r10
movq %rsp, %rdx
addq %r10, %rsi
addq %r10, %rdx
negq %r10
chacha_blocks_ssse3_copyinput:
movb (%rsi, %r10), %al
movb %al, (%rdx, %r10)
incq %r10
jnz chacha_blocks_ssse3_copyinput
movq %rsp, %rsi
chacha_blocks_ssse3_noinput2:
movq %rsp, %rdx
chacha_blocks_ssse3_above63:
movdqa %xmm8, %xmm0
movdqa %xmm9, %xmm1
movdqa %xmm10, %xmm2
movdqa %xmm11, %xmm3
movq 64(%rsp), %rax
chacha_blocks_ssse3_mainloop2:
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm6, %xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1, %xmm4
pslld $12, %xmm4
psrld $20, %xmm1
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm7, %xmm3
pshufd $0x93, %xmm0, %xmm0
paddd %xmm3, %xmm2
pshufd $0x4e, %xmm3, %xmm3
pxor %xmm2, %xmm1
pshufd $0x39, %xmm2, %xmm2
movdqa %xmm1, %xmm4
pslld $7, %xmm4
psrld $25, %xmm1
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm6, %xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1, %xmm4
pslld $12, %xmm4
psrld $20, %xmm1
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm7, %xmm3
pshufd $0x39, %xmm0, %xmm0
paddd %xmm3, %xmm2
pshufd $0x4e, %xmm3, %xmm3
pxor %xmm2, %xmm1
pshufd $0x93, %xmm2, %xmm2
movdqa %xmm1, %xmm4
pslld $7, %xmm4
psrld $25, %xmm1
pxor %xmm4, %xmm1
subq $2, %rax
jnz chacha_blocks_ssse3_mainloop2
paddd %xmm8, %xmm0
paddd %xmm9, %xmm1
paddd %xmm10, %xmm2
paddd %xmm11, %xmm3
andq %rsi, %rsi
jz chacha_blocks_ssse3_noinput3
movdqu 0(%rsi), %xmm12
movdqu 16(%rsi), %xmm13
movdqu 32(%rsi), %xmm14
movdqu 48(%rsi), %xmm15
pxor %xmm12, %xmm0
pxor %xmm13, %xmm1
pxor %xmm14, %xmm2
pxor %xmm15, %xmm3
addq $64, %rsi
chacha_blocks_ssse3_noinput3:
movdqu %xmm0, 0(%rdx)
movdqu %xmm1, 16(%rdx)
movdqu %xmm2, 32(%rdx)
movdqu %xmm3, 48(%rdx)
paddq %xmm5, %xmm11
cmpq $64, %rcx
jbe chacha_blocks_ssse3_mainloop2_finishup
addq $64, %rdx
subq $64, %rcx
jmp chacha_blocks_ssse3_below256
chacha_blocks_ssse3_mainloop2_finishup:
cmpq $64, %rcx
je chacha_blocks_ssse3_done
addq %rcx, %r9
addq %rcx, %rdx
negq %rcx
chacha_blocks_ssse3_copyoutput:
movb (%rdx, %rcx), %al
movb %al, (%r9, %rcx)
incq %rcx
jnz chacha_blocks_ssse3_copyoutput
chacha_blocks_ssse3_done:
movdqu %xmm11, 32(%rdi)
movq %rbp, %rsp
popq %rbp
popq %rbx
ret

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __i386__ && __SSSE3__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushl %ebp
movl %esp, %ebp
andl $~63, %esp
sub $704, %esp
movl %ebx,68(%esp)
movl %esi,72(%esp)
movl %edi,76(%esp)
movl 8(%ebp),%ecx
movl %ecx,84(%esp)
movl 12(%ebp),%esi
movl 16(%ebp),%edx
movl 20(%ebp),%eax
LOAD_VAR_PIC chacha_constants, %ebx
movdqa 0(%ebx), %xmm0
movdqa 16(%ebx), %xmm4
movdqa 32(%ebx), %xmm5
movdqu 0(%ecx),%xmm1
movdqu 16(%ecx),%xmm2
movdqu 32(%ecx),%xmm3
movdqa %xmm0,0(%esp)
movdqa %xmm1,16(%esp)
movdqa %xmm2,32(%esp)
movdqa %xmm3,48(%esp)
movdqa %xmm4,96(%esp)
movdqa %xmm5,112(%esp)
movl 48(%ecx),%ecx
movl %ecx,88(%esp)
cmpl $0,%eax
jbe chacha_blocks_ssse3_done
cmpl $256,%eax
jb chacha_blocks_ssse3_bytesbetween1and255
pshufd $0x00, %xmm0, %xmm4
pshufd $0x55, %xmm0, %xmm5
pshufd $0xaa, %xmm0, %xmm6
pshufd $0xff, %xmm0, %xmm0
movdqa %xmm4,128(%esp)
movdqa %xmm5,144(%esp)
movdqa %xmm6,160(%esp)
movdqa %xmm0,176(%esp)
pshufd $0x00, %xmm1, %xmm0
pshufd $0x55, %xmm1, %xmm4
pshufd $0xaa, %xmm1, %xmm5
pshufd $0xff, %xmm1, %xmm1
movdqa %xmm0,192(%esp)
movdqa %xmm4,208(%esp)
movdqa %xmm5,224(%esp)
movdqa %xmm1,240(%esp)
pshufd $0x00, %xmm2, %xmm0
pshufd $0x55, %xmm2, %xmm1
pshufd $0xaa, %xmm2, %xmm4
pshufd $0xff, %xmm2, %xmm2
movdqa %xmm0,256(%esp)
movdqa %xmm1,272(%esp)
movdqa %xmm4,288(%esp)
movdqa %xmm2,304(%esp)
pshufd $0xaa, %xmm3, %xmm0
pshufd $0xff, %xmm3, %xmm1
movdqa %xmm0,352(%esp)
movdqa %xmm1,368(%esp)
chacha_blocks_ssse3_bytesatleast256:
movl 48(%esp),%ecx
movl 4+48(%esp),%ebx
movl %ecx,320(%esp)
movl %ebx,336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,4+320(%esp)
movl %ebx,4+336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,8+320(%esp)
movl %ebx,8+336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,12+320(%esp)
movl %ebx,12+336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,48(%esp)
movl %ebx,4+48(%esp)
movl %eax,92(%esp)
movl 88(%esp),%eax
movdqa 160(%esp),%xmm0
movdqa 224(%esp),%xmm1
movdqa 288(%esp),%xmm2
movdqa 352(%esp),%xmm3
movdqa 176(%esp),%xmm4
movdqa 240(%esp),%xmm5
movdqa 304(%esp),%xmm6
movdqa 368(%esp),%xmm7
movdqa %xmm0,480(%esp)
movdqa %xmm1,544(%esp)
movdqa %xmm2,608(%esp)
movdqa %xmm3,672(%esp)
movdqa %xmm4,496(%esp)
movdqa %xmm5,560(%esp)
movdqa %xmm6,624(%esp)
movdqa %xmm7,688(%esp)
movdqa 128(%esp),%xmm0
movdqa 192(%esp),%xmm1
movdqa 256(%esp),%xmm2
movdqa 320(%esp),%xmm3
movdqa 144(%esp),%xmm4
movdqa 208(%esp),%xmm5
movdqa 272(%esp),%xmm6
movdqa 336(%esp),%xmm7
jmp chacha_blocks_ssse3_mainloop1
.p2align 6
chacha_blocks_ssse3_mainloop1:
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pshufb 96(%esp), %xmm3
pxor %xmm4, %xmm7
pshufb 96(%esp), %xmm7
paddd %xmm3, %xmm2
paddd %xmm7, %xmm6
movdqa %xmm4, 464(%esp)
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa 464(%esp), %xmm4
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pshufb 112(%esp), %xmm3
pxor %xmm4, %xmm7
pshufb 112(%esp), %xmm7
movdqa %xmm0, 448(%esp)
paddd %xmm3, %xmm2
movdqa %xmm4, 464(%esp)
paddd %xmm7, %xmm6
movdqa %xmm3, 640(%esp)
movdqa %xmm7, 656(%esp)
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm2, 576(%esp)
movdqa %xmm6, 592(%esp)
movdqa %xmm1,%xmm4
pslld $7, %xmm1
movdqa 672(%esp), %xmm3
psrld $25, %xmm4
movdqa 688(%esp), %xmm7
por %xmm4, %xmm1
movdqa %xmm1, 512(%esp)
movdqa %xmm5, %xmm4
pslld $7, %xmm5
movdqa 608(%esp), %xmm2
psrld $25, %xmm4
movdqa 624(%esp), %xmm6
por %xmm4, %xmm5
movdqa %xmm5, 528(%esp)
movdqa 480(%esp), %xmm0
movdqa 496(%esp), %xmm4
movdqa 544(%esp), %xmm1
movdqa 560(%esp), %xmm5
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pshufb 96(%esp), %xmm3
pxor %xmm4, %xmm7
pshufb 96(%esp), %xmm7
paddd %xmm3, %xmm2
paddd %xmm7, %xmm6
movdqa %xmm4, 496(%esp)
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa 496(%esp), %xmm4
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pshufb 112(%esp), %xmm3
pxor %xmm4, %xmm7
pshufb 112(%esp), %xmm7
movdqa %xmm0, 480(%esp)
paddd %xmm3, %xmm2
movdqa %xmm4, 496(%esp)
paddd %xmm7, %xmm6
movdqa %xmm3, 672(%esp)
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
movdqa 640(%esp), %xmm3
por %xmm4, %xmm1
movdqa %xmm5, %xmm4
pslld $7, %xmm5
psrld $25, %xmm4
por %xmm4, %xmm5
movdqa %xmm5, 560(%esp)
movdqa 448(%esp), %xmm0
movdqa 528(%esp), %xmm5
movdqa 464(%esp), %xmm4
# 300 "ssse3.S"
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pshufb 96(%esp), %xmm7
pxor %xmm4, %xmm3
pshufb 96(%esp), %xmm3
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
movdqa %xmm4, 464(%esp)
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa 464(%esp), %xmm4
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pshufb 112(%esp), %xmm7
pxor %xmm4, %xmm3
pshufb 112(%esp), %xmm3
movdqa %xmm0, 448(%esp)
paddd %xmm7, %xmm2
movdqa %xmm4, 464(%esp)
paddd %xmm3, %xmm6
movdqa %xmm7, 688(%esp)
movdqa %xmm3, 640(%esp)
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm2, 608(%esp)
movdqa %xmm6, 624(%esp)
movdqa %xmm5,%xmm4
pslld $7, %xmm5
movdqa 656(%esp), %xmm7
psrld $25, %xmm4
movdqa 672(%esp), %xmm3
por %xmm4, %xmm5
movdqa %xmm5, 528(%esp)
movdqa %xmm1, %xmm4
pslld $7, %xmm1
movdqa 576(%esp), %xmm2
psrld $25, %xmm4
movdqa 592(%esp), %xmm6
por %xmm4, %xmm1
movdqa %xmm1, 544(%esp)
movdqa 480(%esp), %xmm0
movdqa 496(%esp), %xmm4
movdqa 560(%esp), %xmm5
movdqa 512(%esp), %xmm1
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pshufb 96(%esp), %xmm7
pxor %xmm4, %xmm3
pshufb 96(%esp), %xmm3
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
movdqa %xmm4, 496(%esp)
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa 496(%esp), %xmm4
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pshufb 112(%esp), %xmm7
pxor %xmm4, %xmm3
pshufb 112(%esp), %xmm3
movdqa %xmm0, 480(%esp)
movdqa %xmm4, 496(%esp)
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
movdqa %xmm3, 672(%esp)
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm5,%xmm4
pslld $7, %xmm5
psrld $25, %xmm4
movdqa 640(%esp), %xmm3
por %xmm4, %xmm5
movdqa %xmm5, 560(%esp)
movdqa %xmm1, %xmm4
pslld $7, %xmm1
psrld $25, %xmm4
por %xmm4, %xmm1
movdqa 448(%esp), %xmm0
movdqa 464(%esp), %xmm4
movdqa 528(%esp), %xmm5
subl $2,%eax
ja chacha_blocks_ssse3_mainloop1
movdqa %xmm0, 448(%esp)
movdqa %xmm1, 512(%esp)
movdqa %xmm2, 576(%esp)
movdqa %xmm3, 640(%esp)
movdqa %xmm4, 464(%esp)
movdqa %xmm5, 528(%esp)
movdqa %xmm6, 592(%esp)
movdqa %xmm7, 656(%esp)
cmpl $0,%esi
movdqa 448(%esp),%xmm0
movdqa 464(%esp),%xmm1
movdqa 480(%esp),%xmm2
movdqa 496(%esp),%xmm3
paddd 128(%esp), %xmm0
paddd 144(%esp), %xmm1
paddd 160(%esp), %xmm2
paddd 176(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
jbe chacha_blocks_ssse3_noinput1
movdqu 0(%esi), %xmm2
movdqu 64(%esi), %xmm5
movdqu 128(%esi), %xmm6
movdqu 192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 0(%edx)
movdqu %xmm1, 64(%edx)
movdqu %xmm0, 128(%edx)
movdqu %xmm3, 192(%edx)
movdqa 512(%esp),%xmm0
movdqa 528(%esp),%xmm1
movdqa 544(%esp),%xmm2
movdqa 560(%esp),%xmm3
paddd 192(%esp), %xmm0
paddd 208(%esp), %xmm1
paddd 224(%esp), %xmm2
paddd 240(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu 16+0(%esi), %xmm2
movdqu 16+64(%esi), %xmm5
movdqu 16+128(%esi), %xmm6
movdqu 16+192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 16+0(%edx)
movdqu %xmm1, 16+64(%edx)
movdqu %xmm0, 16+128(%edx)
movdqu %xmm3, 16+192(%edx)
movdqa 576(%esp),%xmm0
movdqa 592(%esp),%xmm1
movdqa 608(%esp),%xmm2
movdqa 624(%esp),%xmm3
paddd 256(%esp), %xmm0
paddd 272(%esp), %xmm1
paddd 288(%esp), %xmm2
paddd 304(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu 32+0(%esi), %xmm2
movdqu 32+64(%esi), %xmm5
movdqu 32+128(%esi), %xmm6
movdqu 32+192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 32+0(%edx)
movdqu %xmm1, 32+64(%edx)
movdqu %xmm0, 32+128(%edx)
movdqu %xmm3, 32+192(%edx)
movdqa 640(%esp),%xmm0
movdqa 656(%esp),%xmm1
movdqa 672(%esp),%xmm2
movdqa 688(%esp),%xmm3
paddd 320(%esp), %xmm0
paddd 336(%esp), %xmm1
paddd 352(%esp), %xmm2
paddd 368(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu 48+0(%esi), %xmm2
movdqu 48+64(%esi), %xmm5
movdqu 48+128(%esi), %xmm6
movdqu 48+192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 48+0(%edx)
movdqu %xmm1, 48+64(%edx)
movdqu %xmm0, 48+128(%edx)
movdqu %xmm3, 48+192(%edx)
addl $256,%esi
jmp chacha_blocks_ssse3_mainloop1_cont
chacha_blocks_ssse3_noinput1:
movdqu %xmm4, 0(%edx)
movdqu %xmm1, 64(%edx)
movdqu %xmm0, 128(%edx)
movdqu %xmm3, 192(%edx)
movdqa 512(%esp),%xmm0
movdqa 528(%esp),%xmm1
movdqa 544(%esp),%xmm2
movdqa 560(%esp),%xmm3
paddd 192(%esp), %xmm0
paddd 208(%esp), %xmm1
paddd 224(%esp), %xmm2
paddd 240(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu %xmm4, 16+0(%edx)
movdqu %xmm1, 16+64(%edx)
movdqu %xmm0, 16+128(%edx)
movdqu %xmm3, 16+192(%edx)
movdqa 576(%esp),%xmm0
movdqa 592(%esp),%xmm1
movdqa 608(%esp),%xmm2
movdqa 624(%esp),%xmm3
paddd 256(%esp), %xmm0
paddd 272(%esp), %xmm1
paddd 288(%esp), %xmm2
paddd 304(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu %xmm4, 32+0(%edx)
movdqu %xmm1, 32+64(%edx)
movdqu %xmm0, 32+128(%edx)
movdqu %xmm3, 32+192(%edx)
movdqa 640(%esp),%xmm0
movdqa 656(%esp),%xmm1
movdqa 672(%esp),%xmm2
movdqa 688(%esp),%xmm3
paddd 320(%esp), %xmm0
paddd 336(%esp), %xmm1
paddd 352(%esp), %xmm2
paddd 368(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu %xmm4, 48+0(%edx)
movdqu %xmm1, 48+64(%edx)
movdqu %xmm0, 48+128(%edx)
movdqu %xmm3, 48+192(%edx)
chacha_blocks_ssse3_mainloop1_cont:
movl 92(%esp),%eax
subl $256,%eax
addl $256,%edx
cmpl $256,%eax
jae chacha_blocks_ssse3_bytesatleast256
cmpl $0,%eax
jbe chacha_blocks_ssse3_done
chacha_blocks_ssse3_bytesbetween1and255:
cmpl $64,%eax
jae chacha_blocks_ssse3_nocopy
movl %edx,92(%esp)
cmpl $0,%esi
jbe chacha_blocks_ssse3_noinput2
leal 128(%esp),%edi
movl %eax,%ecx
rep movsb
leal 128(%esp),%esi
chacha_blocks_ssse3_noinput2:
leal 128(%esp),%edx
chacha_blocks_ssse3_nocopy:
movl %eax,80(%esp)
movdqa 0(%esp),%xmm0
movdqa 16(%esp),%xmm1
movdqa 32(%esp),%xmm2
movdqa 48(%esp),%xmm3
movdqa 96(%esp),%xmm5
movdqa 112(%esp),%xmm6
movl 88(%esp),%eax
chacha_blocks_ssse3_mainloop2:
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm5, %xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm6, %xmm3
pshufd $0x93,%xmm0,%xmm0
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x39,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
subl $2, %eax
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm5, %xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm6, %xmm3
pshufd $0x39,%xmm0,%xmm0
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x93,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
ja chacha_blocks_ssse3_mainloop2
paddd 0(%esp), %xmm0
paddd 16(%esp), %xmm1
paddd 32(%esp), %xmm2
paddd 48(%esp), %xmm3
cmpl $0,%esi
jbe chacha_blocks_ssse3_noinput3
movdqu 0(%esi),%xmm4
movdqu 16(%esi),%xmm5
movdqu 32(%esi),%xmm6
movdqu 48(%esi),%xmm7
pxor %xmm4, %xmm0
pxor %xmm5, %xmm1
pxor %xmm6, %xmm2
pxor %xmm7, %xmm3
addl $64,%esi
chacha_blocks_ssse3_noinput3:
movdqu %xmm0,0(%edx)
movdqu %xmm1,16(%edx)
movdqu %xmm2,32(%edx)
movdqu %xmm3,48(%edx)
movl 80(%esp),%eax
movl 48(%esp),%ecx
movl 4+48(%esp),%ebx
addl $1,%ecx
adcl $0,%ebx
movl %ecx,48(%esp)
movl %ebx,4+48(%esp)
cmpl $64,%eax
ja chacha_blocks_ssse3_bytesatleast65
jae chacha_blocks_ssse3_bytesatleast64
movl %edx,%esi
movl 92(%esp),%edi
movl %eax,%ecx
rep movsb
chacha_blocks_ssse3_bytesatleast64:
chacha_blocks_ssse3_done:
movl 84(%esp),%eax
movdqa 48(%esp),%xmm0
movdqu %xmm0,32(%eax)
movl 64(%esp),%eax
movl 68(%esp),%ebx
movl 72(%esp),%esi
movl 76(%esp),%edi
movl %ebp, %esp
popl %ebp
ret
chacha_blocks_ssse3_bytesatleast65:
subl $64,%eax
addl $64,%edx
jmp chacha_blocks_ssse3_bytesbetween1and255

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __amd64__ && __SSE2__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushq %rbx
pushq %rbp
movq %rsp, %rbp
andq $~63, %rsp
subq $512, %rsp
movq $0x3320646e61707865, %rax
movq $0x6b20657479622d32, %r8
movd %rax, %xmm8
movd %r8, %xmm14
punpcklqdq %xmm14, %xmm8
movdqu 0(%rdi), %xmm9
movdqu 16(%rdi), %xmm10
movdqu 32(%rdi), %xmm11
movq 48(%rdi), %rax
movq $1, %r9
movdqa %xmm8, 0(%rsp)
movdqa %xmm9, 16(%rsp)
movdqa %xmm10, 32(%rsp)
movdqa %xmm11, 48(%rsp)
movq %rax, 64(%rsp)
cmpq $256, %rcx
jb chacha_blocks_sse2_below256
pshufd $0x00, %xmm8, %xmm0
pshufd $0x55, %xmm8, %xmm1
pshufd $0xaa, %xmm8, %xmm2
pshufd $0xff, %xmm8, %xmm3
movdqa %xmm0, 128(%rsp)
movdqa %xmm1, 144(%rsp)
movdqa %xmm2, 160(%rsp)
movdqa %xmm3, 176(%rsp)
pshufd $0x00, %xmm9, %xmm0
pshufd $0x55, %xmm9, %xmm1
pshufd $0xaa, %xmm9, %xmm2
pshufd $0xff, %xmm9, %xmm3
movdqa %xmm0, 192(%rsp)
movdqa %xmm1, 208(%rsp)
movdqa %xmm2, 224(%rsp)
movdqa %xmm3, 240(%rsp)
pshufd $0x00, %xmm10, %xmm0
pshufd $0x55, %xmm10, %xmm1
pshufd $0xaa, %xmm10, %xmm2
pshufd $0xff, %xmm10, %xmm3
movdqa %xmm0, 256(%rsp)
movdqa %xmm1, 272(%rsp)
movdqa %xmm2, 288(%rsp)
movdqa %xmm3, 304(%rsp)
pshufd $0xaa, %xmm11, %xmm0
pshufd $0xff, %xmm11, %xmm1
movdqa %xmm0, 352(%rsp)
movdqa %xmm1, 368(%rsp)
jmp chacha_blocks_sse2_atleast256
.p2align 6,,63
chacha_blocks_sse2_atleast256:
movq 48(%rsp), %rax
leaq 1(%rax), %r8
leaq 2(%rax), %r9
leaq 3(%rax), %r10
leaq 4(%rax), %rbx
movl %eax, 320(%rsp)
movl %r8d, 4+320(%rsp)
movl %r9d, 8+320(%rsp)
movl %r10d, 12+320(%rsp)
shrq $32, %rax
shrq $32, %r8
shrq $32, %r9
shrq $32, %r10
movl %eax, 336(%rsp)
movl %r8d, 4+336(%rsp)
movl %r9d, 8+336(%rsp)
movl %r10d, 12+336(%rsp)
movq %rbx, 48(%rsp)
movq 64(%rsp), %rax
movdqa 128(%rsp), %xmm0
movdqa 144(%rsp), %xmm1
movdqa 160(%rsp), %xmm2
movdqa 176(%rsp), %xmm3
movdqa 192(%rsp), %xmm4
movdqa 208(%rsp), %xmm5
movdqa 224(%rsp), %xmm6
movdqa 240(%rsp), %xmm7
movdqa 256(%rsp), %xmm8
movdqa 272(%rsp), %xmm9
movdqa 288(%rsp), %xmm10
movdqa 304(%rsp), %xmm11
movdqa 320(%rsp), %xmm12
movdqa 336(%rsp), %xmm13
movdqa 352(%rsp), %xmm14
movdqa 368(%rsp), %xmm15
chacha_blocks_sse2_mainloop1:
paddd %xmm4, %xmm0
paddd %xmm5, %xmm1
pxor %xmm0, %xmm12
pxor %xmm1, %xmm13
paddd %xmm6, %xmm2
paddd %xmm7, %xmm3
movdqa %xmm6, 96(%rsp)
pxor %xmm2, %xmm14
pxor %xmm3, %xmm15
pshuflw $0xb1,%xmm12,%xmm12
pshufhw $0xb1,%xmm12,%xmm12
pshuflw $0xb1,%xmm13,%xmm13
pshufhw $0xb1,%xmm13,%xmm13
pshuflw $0xb1,%xmm14,%xmm14
pshufhw $0xb1,%xmm14,%xmm14
pshuflw $0xb1,%xmm15,%xmm15
pshufhw $0xb1,%xmm15,%xmm15
paddd %xmm12, %xmm8
paddd %xmm13, %xmm9
paddd %xmm14, %xmm10
paddd %xmm15, %xmm11
movdqa %xmm12, 112(%rsp)
pxor %xmm8, %xmm4
pxor %xmm9, %xmm5
movdqa 96(%rsp), %xmm6
movdqa %xmm4, %xmm12
pslld $ 12, %xmm4
psrld $20, %xmm12
pxor %xmm12, %xmm4
movdqa %xmm5, %xmm12
pslld $ 12, %xmm5
psrld $20, %xmm12
pxor %xmm12, %xmm5
pxor %xmm10, %xmm6
pxor %xmm11, %xmm7
movdqa %xmm6, %xmm12
pslld $ 12, %xmm6
psrld $20, %xmm12
pxor %xmm12, %xmm6
movdqa %xmm7, %xmm12
pslld $ 12, %xmm7
psrld $20, %xmm12
pxor %xmm12, %xmm7
movdqa 112(%rsp), %xmm12
paddd %xmm4, %xmm0
paddd %xmm5, %xmm1
pxor %xmm0, %xmm12
pxor %xmm1, %xmm13
paddd %xmm6, %xmm2
paddd %xmm7, %xmm3
movdqa %xmm6, 96(%rsp)
pxor %xmm2, %xmm14
pxor %xmm3, %xmm15
movdqa %xmm12, %xmm6
pslld $ 8, %xmm12
psrld $24, %xmm6
pxor %xmm6, %xmm12
movdqa %xmm13, %xmm6
pslld $ 8, %xmm13
psrld $24, %xmm6
pxor %xmm6, %xmm13
paddd %xmm12, %xmm8
paddd %xmm13, %xmm9
movdqa %xmm14, %xmm6
pslld $ 8, %xmm14
psrld $24, %xmm6
pxor %xmm6, %xmm14
movdqa %xmm15, %xmm6
pslld $ 8, %xmm15
psrld $24, %xmm6
pxor %xmm6, %xmm15
paddd %xmm14, %xmm10
paddd %xmm15, %xmm11
movdqa %xmm12, 112(%rsp)
pxor %xmm8, %xmm4
pxor %xmm9, %xmm5
movdqa 96(%rsp), %xmm6
movdqa %xmm4, %xmm12
pslld $ 7, %xmm4
psrld $25, %xmm12
pxor %xmm12, %xmm4
movdqa %xmm5, %xmm12
pslld $ 7, %xmm5
psrld $25, %xmm12
pxor %xmm12, %xmm5
pxor %xmm10, %xmm6
pxor %xmm11, %xmm7
movdqa %xmm6, %xmm12
pslld $ 7, %xmm6
psrld $25, %xmm12
pxor %xmm12, %xmm6
movdqa %xmm7, %xmm12
pslld $ 7, %xmm7
psrld $25, %xmm12
pxor %xmm12, %xmm7
movdqa 112(%rsp), %xmm12
paddd %xmm5, %xmm0
paddd %xmm6, %xmm1
pxor %xmm0, %xmm15
pxor %xmm1, %xmm12
paddd %xmm7, %xmm2
paddd %xmm4, %xmm3
movdqa %xmm7, 96(%rsp)
pxor %xmm2, %xmm13
pxor %xmm3, %xmm14
pshuflw $0xb1,%xmm15,%xmm15
pshufhw $0xb1,%xmm15,%xmm15
pshuflw $0xb1,%xmm12,%xmm12
pshufhw $0xb1,%xmm12,%xmm12
pshuflw $0xb1,%xmm13,%xmm13
pshufhw $0xb1,%xmm13,%xmm13
pshuflw $0xb1,%xmm14,%xmm14
pshufhw $0xb1,%xmm14,%xmm14
paddd %xmm15, %xmm10
paddd %xmm12, %xmm11
paddd %xmm13, %xmm8
paddd %xmm14, %xmm9
movdqa %xmm15, 112(%rsp)
pxor %xmm10, %xmm5
pxor %xmm11, %xmm6
movdqa 96(%rsp), %xmm7
movdqa %xmm5, %xmm15
pslld $ 12, %xmm5
psrld $20, %xmm15
pxor %xmm15, %xmm5
movdqa %xmm6, %xmm15
pslld $ 12, %xmm6
psrld $20, %xmm15
pxor %xmm15, %xmm6
pxor %xmm8, %xmm7
pxor %xmm9, %xmm4
movdqa %xmm7, %xmm15
pslld $ 12, %xmm7
psrld $20, %xmm15
pxor %xmm15, %xmm7
movdqa %xmm4, %xmm15
pslld $ 12, %xmm4
psrld $20, %xmm15
pxor %xmm15, %xmm4
movdqa 112(%rsp), %xmm15
paddd %xmm5, %xmm0
paddd %xmm6, %xmm1
pxor %xmm0, %xmm15
pxor %xmm1, %xmm12
paddd %xmm7, %xmm2
paddd %xmm4, %xmm3
movdqa %xmm7, 96(%rsp)
pxor %xmm2, %xmm13
pxor %xmm3, %xmm14
movdqa %xmm15, %xmm7
pslld $ 8, %xmm15
psrld $24, %xmm7
pxor %xmm7, %xmm15
movdqa %xmm12, %xmm7
pslld $ 8, %xmm12
psrld $24, %xmm7
pxor %xmm7, %xmm12
paddd %xmm15, %xmm10
paddd %xmm12, %xmm11
movdqa %xmm13, %xmm7
pslld $ 8, %xmm13
psrld $24, %xmm7
pxor %xmm7, %xmm13
movdqa %xmm14, %xmm7
pslld $ 8, %xmm14
psrld $24, %xmm7
pxor %xmm7, %xmm14
paddd %xmm13, %xmm8
paddd %xmm14, %xmm9
movdqa %xmm15, 112(%rsp)
pxor %xmm10, %xmm5
pxor %xmm11, %xmm6
movdqa 96(%rsp), %xmm7
movdqa %xmm5, %xmm15
pslld $ 7, %xmm5
psrld $25, %xmm15
pxor %xmm15, %xmm5
movdqa %xmm6, %xmm15
pslld $ 7, %xmm6
psrld $25, %xmm15
pxor %xmm15, %xmm6
pxor %xmm8, %xmm7
pxor %xmm9, %xmm4
movdqa %xmm7, %xmm15
pslld $ 7, %xmm7
psrld $25, %xmm15
pxor %xmm15, %xmm7
movdqa %xmm4, %xmm15
pslld $ 7, %xmm4
psrld $25, %xmm15
pxor %xmm15, %xmm4
movdqa 112(%rsp), %xmm15
subq $2, %rax
jnz chacha_blocks_sse2_mainloop1
paddd 128(%rsp), %xmm0
paddd 144(%rsp), %xmm1
paddd 160(%rsp), %xmm2
paddd 176(%rsp), %xmm3
paddd 192(%rsp), %xmm4
paddd 208(%rsp), %xmm5
paddd 224(%rsp), %xmm6
paddd 240(%rsp), %xmm7
paddd 256(%rsp), %xmm8
paddd 272(%rsp), %xmm9
paddd 288(%rsp), %xmm10
paddd 304(%rsp), %xmm11
paddd 320(%rsp), %xmm12
paddd 336(%rsp), %xmm13
paddd 352(%rsp), %xmm14
paddd 368(%rsp), %xmm15
movdqa %xmm8, 384(%rsp)
movdqa %xmm9, 400(%rsp)
movdqa %xmm10, 416(%rsp)
movdqa %xmm11, 432(%rsp)
movdqa %xmm12, 448(%rsp)
movdqa %xmm13, 464(%rsp)
movdqa %xmm14, 480(%rsp)
movdqa %xmm15, 496(%rsp)
movdqa %xmm0, %xmm8
movdqa %xmm2, %xmm9
movdqa %xmm4, %xmm10
movdqa %xmm6, %xmm11
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
punpckhdq %xmm5, %xmm4
punpckhdq %xmm7, %xmm6
punpckldq %xmm1, %xmm8
punpckldq %xmm3, %xmm9
punpckldq %xmm5, %xmm10
punpckldq %xmm7, %xmm11
movdqa %xmm0, %xmm1
movdqa %xmm4, %xmm3
movdqa %xmm8, %xmm5
movdqa %xmm10, %xmm7
punpckhqdq %xmm2, %xmm0
punpckhqdq %xmm6, %xmm4
punpckhqdq %xmm9, %xmm8
punpckhqdq %xmm11, %xmm10
punpcklqdq %xmm2, %xmm1
punpcklqdq %xmm6, %xmm3
punpcklqdq %xmm9, %xmm5
punpcklqdq %xmm11, %xmm7
andq %rsi, %rsi
jz chacha_blocks_sse2_noinput1
movdqu 0(%rsi), %xmm2
movdqu 16(%rsi), %xmm6
movdqu 64(%rsi), %xmm9
movdqu 80(%rsi), %xmm11
movdqu 128(%rsi), %xmm12
movdqu 144(%rsi), %xmm13
movdqu 192(%rsi), %xmm14
movdqu 208(%rsi), %xmm15
pxor %xmm2, %xmm5
pxor %xmm6, %xmm7
pxor %xmm9, %xmm8
pxor %xmm11, %xmm10
pxor %xmm12, %xmm1
pxor %xmm13, %xmm3
pxor %xmm14, %xmm0
pxor %xmm15, %xmm4
movdqu %xmm5, 0(%rdx)
movdqu %xmm7, 16(%rdx)
movdqu %xmm8, 64(%rdx)
movdqu %xmm10, 80(%rdx)
movdqu %xmm1, 128(%rdx)
movdqu %xmm3, 144(%rdx)
movdqu %xmm0, 192(%rdx)
movdqu %xmm4, 208(%rdx)
movdqa 384(%rsp), %xmm0
movdqa 400(%rsp), %xmm1
movdqa 416(%rsp), %xmm2
movdqa 432(%rsp), %xmm3
movdqa 448(%rsp), %xmm4
movdqa 464(%rsp), %xmm5
movdqa 480(%rsp), %xmm6
movdqa 496(%rsp), %xmm7
movdqa %xmm0, %xmm8
movdqa %xmm2, %xmm9
movdqa %xmm4, %xmm10
movdqa %xmm6, %xmm11
punpckldq %xmm1, %xmm8
punpckldq %xmm3, %xmm9
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
punpckldq %xmm5, %xmm10
punpckldq %xmm7, %xmm11
punpckhdq %xmm5, %xmm4
punpckhdq %xmm7, %xmm6
movdqa %xmm8, %xmm1
movdqa %xmm0, %xmm3
movdqa %xmm10, %xmm5
movdqa %xmm4, %xmm7
punpcklqdq %xmm9, %xmm1
punpcklqdq %xmm11, %xmm5
punpckhqdq %xmm9, %xmm8
punpckhqdq %xmm11, %xmm10
punpcklqdq %xmm2, %xmm3
punpcklqdq %xmm6, %xmm7
punpckhqdq %xmm2, %xmm0
punpckhqdq %xmm6, %xmm4
movdqu 32(%rsi), %xmm2
movdqu 48(%rsi), %xmm6
movdqu 96(%rsi), %xmm9
movdqu 112(%rsi), %xmm11
movdqu 160(%rsi), %xmm12
movdqu 176(%rsi), %xmm13
movdqu 224(%rsi), %xmm14
movdqu 240(%rsi), %xmm15
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
pxor %xmm9, %xmm8
pxor %xmm11, %xmm10
pxor %xmm12, %xmm3
pxor %xmm13, %xmm7
pxor %xmm14, %xmm0
pxor %xmm15, %xmm4
movdqu %xmm1, 32(%rdx)
movdqu %xmm5, 48(%rdx)
movdqu %xmm8, 96(%rdx)
movdqu %xmm10, 112(%rdx)
movdqu %xmm3, 160(%rdx)
movdqu %xmm7, 176(%rdx)
movdqu %xmm0, 224(%rdx)
movdqu %xmm4, 240(%rdx)
addq $256, %rsi
jmp chacha_blocks_sse2_mainloop_cont
chacha_blocks_sse2_noinput1:
movdqu %xmm5, 0(%rdx)
movdqu %xmm7, 16(%rdx)
movdqu %xmm8, 64(%rdx)
movdqu %xmm10, 80(%rdx)
movdqu %xmm1, 128(%rdx)
movdqu %xmm3, 144(%rdx)
movdqu %xmm0, 192(%rdx)
movdqu %xmm4, 208(%rdx)
movdqa 384(%rsp), %xmm0
movdqa 400(%rsp), %xmm1
movdqa 416(%rsp), %xmm2
movdqa 432(%rsp), %xmm3
movdqa 448(%rsp), %xmm4
movdqa 464(%rsp), %xmm5
movdqa 480(%rsp), %xmm6
movdqa 496(%rsp), %xmm7
movdqa %xmm0, %xmm8
movdqa %xmm2, %xmm9
movdqa %xmm4, %xmm10
movdqa %xmm6, %xmm11
punpckldq %xmm1, %xmm8
punpckldq %xmm3, %xmm9
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
punpckldq %xmm5, %xmm10
punpckldq %xmm7, %xmm11
punpckhdq %xmm5, %xmm4
punpckhdq %xmm7, %xmm6
movdqa %xmm8, %xmm1
movdqa %xmm0, %xmm3
movdqa %xmm10, %xmm5
movdqa %xmm4, %xmm7
punpcklqdq %xmm9, %xmm1
punpcklqdq %xmm11, %xmm5
punpckhqdq %xmm9, %xmm8
punpckhqdq %xmm11, %xmm10
punpcklqdq %xmm2, %xmm3
punpcklqdq %xmm6, %xmm7
punpckhqdq %xmm2, %xmm0
punpckhqdq %xmm6, %xmm4
movdqu %xmm1, 32(%rdx)
movdqu %xmm5, 48(%rdx)
movdqu %xmm8, 96(%rdx)
movdqu %xmm10, 112(%rdx)
movdqu %xmm3, 160(%rdx)
movdqu %xmm7, 176(%rdx)
movdqu %xmm0, 224(%rdx)
movdqu %xmm4, 240(%rdx)
chacha_blocks_sse2_mainloop_cont:
addq $256, %rdx
subq $256, %rcx
cmp $256, %rcx
jae chacha_blocks_sse2_atleast256
movdqa 0(%rsp), %xmm8
movdqa 16(%rsp), %xmm9
movdqa 32(%rsp), %xmm10
movdqa 48(%rsp), %xmm11
movq $1, %r9
chacha_blocks_sse2_below256:
movq %r9, %xmm5
andq %rcx, %rcx
jz chacha_blocks_sse2_done
cmpq $64, %rcx
jae chacha_blocks_sse2_above63
movq %rdx, %r9
andq %rsi, %rsi
jz chacha_blocks_sse2_noinput2
movq %rcx, %r10
movq %rsp, %rdx
addq %r10, %rsi
addq %r10, %rdx
negq %r10
chacha_blocks_sse2_copyinput:
movb (%rsi, %r10), %al
movb %al, (%rdx, %r10)
incq %r10
jnz chacha_blocks_sse2_copyinput
movq %rsp, %rsi
chacha_blocks_sse2_noinput2:
movq %rsp, %rdx
chacha_blocks_sse2_above63:
movdqa %xmm8, %xmm0
movdqa %xmm9, %xmm1
movdqa %xmm10, %xmm2
movdqa %xmm11, %xmm3
movq 64(%rsp), %rax
chacha_blocks_sse2_mainloop2:
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshuflw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm3,%xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
movdqa %xmm3,%xmm4
pslld $8, %xmm3
psrld $24, %xmm4
pshufd $0x93,%xmm0,%xmm0
pxor %xmm4, %xmm3
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x39,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
subq $2, %rax
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshuflw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm3,%xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
movdqa %xmm3,%xmm4
pslld $8, %xmm3
psrld $24, %xmm4
pshufd $0x39,%xmm0,%xmm0
pxor %xmm4, %xmm3
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x93,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
jnz chacha_blocks_sse2_mainloop2
paddd %xmm8, %xmm0
paddd %xmm9, %xmm1
paddd %xmm10, %xmm2
paddd %xmm11, %xmm3
andq %rsi, %rsi
jz chacha_blocks_sse2_noinput3
movdqu 0(%rsi), %xmm12
movdqu 16(%rsi), %xmm13
movdqu 32(%rsi), %xmm14
movdqu 48(%rsi), %xmm15
pxor %xmm12, %xmm0
pxor %xmm13, %xmm1
pxor %xmm14, %xmm2
pxor %xmm15, %xmm3
addq $64, %rsi
chacha_blocks_sse2_noinput3:
movdqu %xmm0, 0(%rdx)
movdqu %xmm1, 16(%rdx)
movdqu %xmm2, 32(%rdx)
movdqu %xmm3, 48(%rdx)
paddq %xmm5, %xmm11
cmpq $64, %rcx
jbe chacha_blocks_sse2_mainloop2_finishup
addq $64, %rdx
subq $64, %rcx
jmp chacha_blocks_sse2_below256
chacha_blocks_sse2_mainloop2_finishup:
cmpq $64, %rcx
je chacha_blocks_sse2_done
addq %rcx, %r9
addq %rcx, %rdx
negq %rcx
chacha_blocks_sse2_copyoutput:
movb (%rdx, %rcx), %al
movb %al, (%r9, %rcx)
incq %rcx
jnz chacha_blocks_sse2_copyoutput
chacha_blocks_sse2_done:
movdqu %xmm11, 32(%rdi)
movq %rbp, %rsp
popq %rbp
popq %rbx
ret

/* ========================================================================= */
#elif __i386__ && __SSE2__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushl %ebp
movl %esp, %ebp
andl $~63, %esp
sub $704, %esp
movl %ebx,68(%esp)
movl %esi,72(%esp)
movl %edi,76(%esp)
movl 8(%ebp),%ecx
movl %ecx,84(%esp)
movl 12(%ebp),%esi
movl 16(%ebp),%edx
movl 20(%ebp),%eax
LOAD_VAR_PIC chacha_constants, %ebx
movdqa 0(%ebx), %xmm0
movdqu 0(%ecx),%xmm1
movdqu 16(%ecx),%xmm2
movdqu 32(%ecx),%xmm3
movdqa %xmm0,0(%esp)
movdqa %xmm1,16(%esp)
movdqa %xmm2,32(%esp)
movdqa %xmm3,48(%esp)
movl 48(%ecx),%ecx
movl %ecx,88(%esp)
cmpl $0,%eax
jbe chacha_blocks_sse2_done
cmpl $256,%eax
jb chacha_blocks_sse2_bytesbetween1and255
pshufd $0x00, %xmm0, %xmm4
pshufd $0x55, %xmm0, %xmm5
pshufd $0xaa, %xmm0, %xmm6
pshufd $0xff, %xmm0, %xmm0
movdqa %xmm4,128(%esp)
movdqa %xmm5,144(%esp)
movdqa %xmm6,160(%esp)
movdqa %xmm0,176(%esp)
pshufd $0x00, %xmm1, %xmm0
pshufd $0x55, %xmm1, %xmm4
pshufd $0xaa, %xmm1, %xmm5
pshufd $0xff, %xmm1, %xmm1
movdqa %xmm0,192(%esp)
movdqa %xmm4,208(%esp)
movdqa %xmm5,224(%esp)
movdqa %xmm1,240(%esp)
pshufd $0x00, %xmm2, %xmm0
pshufd $0x55, %xmm2, %xmm1
pshufd $0xaa, %xmm2, %xmm4
pshufd $0xff, %xmm2, %xmm2
movdqa %xmm0,256(%esp)
movdqa %xmm1,272(%esp)
movdqa %xmm4,288(%esp)
movdqa %xmm2,304(%esp)
pshufd $0xaa, %xmm3, %xmm0
pshufd $0xff, %xmm3, %xmm1
movdqa %xmm0,352(%esp)
movdqa %xmm1,368(%esp)
chacha_blocks_sse2_bytesatleast256:
movl 48(%esp),%ecx
movl 4+48(%esp),%ebx
movl %ecx,320(%esp)
movl %ebx,336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,4+320(%esp)
movl %ebx,4+336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,8+320(%esp)
movl %ebx,8+336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,12+320(%esp)
movl %ebx,12+336(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,48(%esp)
movl %ebx,4+48(%esp)
movl %eax,92(%esp)
movl 88(%esp),%eax
movdqa 160(%esp),%xmm0
movdqa 224(%esp),%xmm1
movdqa 288(%esp),%xmm2
movdqa 352(%esp),%xmm3
movdqa 176(%esp),%xmm4
movdqa 240(%esp),%xmm5
movdqa 304(%esp),%xmm6
movdqa 368(%esp),%xmm7
movdqa %xmm0,480(%esp)
movdqa %xmm1,544(%esp)
movdqa %xmm2,608(%esp)
movdqa %xmm3,672(%esp)
movdqa %xmm4,496(%esp)
movdqa %xmm5,560(%esp)
movdqa %xmm6,624(%esp)
movdqa %xmm7,688(%esp)
movdqa 128(%esp),%xmm0
movdqa 192(%esp),%xmm1
movdqa 256(%esp),%xmm2
movdqa 320(%esp),%xmm3
movdqa 144(%esp),%xmm4
movdqa 208(%esp),%xmm5
movdqa 272(%esp),%xmm6
movdqa 336(%esp),%xmm7
jmp chacha_blocks_sse2_mainloop1
.p2align 6
chacha_blocks_sse2_mainloop1:
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pxor %xmm4, %xmm7
pshuflw $0xb1,%xmm3,%xmm3
pshuflw $0xb1,%xmm7,%xmm7
pshufhw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm7,%xmm7
movdqa %xmm4, 464(%esp)
paddd %xmm3, %xmm2
paddd %xmm7, %xmm6
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa 464(%esp), %xmm4
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pxor %xmm4, %xmm7
movdqa %xmm0, 448(%esp)
movdqa %xmm4, 464(%esp)
movdqa %xmm3, %xmm4
pslld $8, %xmm3
psrld $24, %xmm4
por %xmm4, %xmm3
movdqa %xmm7, %xmm4
pslld $8, %xmm7
psrld $24, %xmm4
por %xmm4, %xmm7
paddd %xmm3, %xmm2
paddd %xmm7, %xmm6
movdqa %xmm3, 640(%esp)
movdqa %xmm7, 656(%esp)
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm2, 576(%esp)
movdqa %xmm6, 592(%esp)
movdqa %xmm1,%xmm4
pslld $7, %xmm1
movdqa 672(%esp), %xmm3
psrld $25, %xmm4
movdqa 688(%esp), %xmm7
por %xmm4, %xmm1
movdqa %xmm1, 512(%esp)
movdqa %xmm5, %xmm0
pslld $7, %xmm5
movdqa 608(%esp), %xmm2
psrld $25, %xmm0
movdqa 624(%esp), %xmm6
por %xmm0, %xmm5
movdqa %xmm5, 528(%esp)
movdqa 480(%esp), %xmm0
movdqa 496(%esp), %xmm4
movdqa 544(%esp), %xmm1
movdqa 560(%esp), %xmm5
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pxor %xmm4, %xmm7
pshuflw $0xb1,%xmm3,%xmm3
pshuflw $0xb1,%xmm7,%xmm7
pshufhw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm7,%xmm7
movdqa %xmm4, 496(%esp)
paddd %xmm3, %xmm2
paddd %xmm7, %xmm6
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa 496(%esp), %xmm4
paddd %xmm1, %xmm0
paddd %xmm5, %xmm4
pxor %xmm0, %xmm3
pxor %xmm4, %xmm7
movdqa %xmm0, 480(%esp)
movdqa %xmm4, 496(%esp)
movdqa %xmm3, %xmm4
pslld $8, %xmm3
psrld $24, %xmm4
por %xmm4, %xmm3
movdqa %xmm7, %xmm4
pslld $8, %xmm7
psrld $24, %xmm4
por %xmm4, %xmm7
paddd %xmm3, %xmm2
paddd %xmm7, %xmm6
movdqa %xmm3, 672(%esp)
pxor %xmm2, %xmm1
pxor %xmm6, %xmm5
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
movdqa 640(%esp), %xmm3
por %xmm4, %xmm1
movdqa %xmm5, %xmm0
pslld $7, %xmm5
psrld $25, %xmm0
por %xmm0, %xmm5
movdqa %xmm5, 560(%esp)
movdqa 448(%esp), %xmm0
movdqa 528(%esp), %xmm5
movdqa 464(%esp), %xmm4
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pxor %xmm4, %xmm3
pshuflw $0xb1,%xmm7,%xmm7
pshuflw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm7,%xmm7
pshufhw $0xb1,%xmm3,%xmm3
movdqa %xmm4, 464(%esp)
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa 464(%esp), %xmm4
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pxor %xmm4, %xmm3
movdqa %xmm0, 448(%esp)
movdqa %xmm4, 464(%esp)
movdqa %xmm7, %xmm4
pslld $8, %xmm7
psrld $24, %xmm4
por %xmm4, %xmm7
movdqa %xmm3, %xmm4
pslld $8, %xmm3
psrld $24, %xmm4
por %xmm4, %xmm3
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
movdqa %xmm7, 688(%esp)
movdqa %xmm3, 640(%esp)
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm2, 608(%esp)
movdqa %xmm6, 624(%esp)
movdqa %xmm5,%xmm4
pslld $7, %xmm5
movdqa 656(%esp), %xmm7
psrld $25, %xmm4
movdqa 672(%esp), %xmm3
por %xmm4, %xmm5
movdqa %xmm5, 528(%esp)
movdqa %xmm1, %xmm0
pslld $7, %xmm1
movdqa 576(%esp), %xmm2
psrld $25, %xmm0
movdqa 592(%esp), %xmm6
por %xmm0, %xmm1
movdqa %xmm1, 544(%esp)
movdqa 480(%esp), %xmm0
movdqa 496(%esp), %xmm4
movdqa 560(%esp), %xmm5
movdqa 512(%esp), %xmm1
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pxor %xmm4, %xmm3
pshuflw $0xb1,%xmm7,%xmm7
pshuflw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm7,%xmm7
pshufhw $0xb1,%xmm3,%xmm3
movdqa %xmm4, 496(%esp)
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm5, %xmm4
pslld $12, %xmm5
psrld $20, %xmm4
por %xmm4, %xmm5
movdqa %xmm1, %xmm4
pslld $12, %xmm1
psrld $20, %xmm4
por %xmm4, %xmm1
movdqa 496(%esp), %xmm4
paddd %xmm5, %xmm0
paddd %xmm1, %xmm4
pxor %xmm0, %xmm7
pxor %xmm4, %xmm3
movdqa %xmm0, 480(%esp)
movdqa %xmm4, 496(%esp)
movdqa %xmm7, %xmm4
pslld $8, %xmm7
psrld $24, %xmm4
por %xmm4, %xmm7
movdqa %xmm3, %xmm4
pslld $8, %xmm3
psrld $24, %xmm4
por %xmm4, %xmm3
paddd %xmm7, %xmm2
paddd %xmm3, %xmm6
movdqa %xmm3, 672(%esp)
pxor %xmm2, %xmm5
pxor %xmm6, %xmm1
movdqa %xmm5,%xmm4
pslld $7, %xmm5
psrld $25, %xmm4
movdqa 640(%esp), %xmm3
por %xmm4, %xmm5
movdqa %xmm5, 560(%esp)
movdqa %xmm1, %xmm0
pslld $7, %xmm1
psrld $25, %xmm0
por %xmm0, %xmm1
movdqa 448(%esp), %xmm0
movdqa 464(%esp), %xmm4
movdqa 528(%esp), %xmm5
subl $2,%eax
ja chacha_blocks_sse2_mainloop1
movdqa %xmm0, 448(%esp)
movdqa %xmm1, 512(%esp)
movdqa %xmm2, 576(%esp)
movdqa %xmm3, 640(%esp)
movdqa %xmm4, 464(%esp)
movdqa %xmm5, 528(%esp)
movdqa %xmm6, 592(%esp)
movdqa %xmm7, 656(%esp)
cmpl $0,%esi
movdqa 448(%esp),%xmm0
movdqa 464(%esp),%xmm1
movdqa 480(%esp),%xmm2
movdqa 496(%esp),%xmm3
paddd 128(%esp), %xmm0
paddd 144(%esp), %xmm1
paddd 160(%esp), %xmm2
paddd 176(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
jbe chacha_blocks_sse2_noinput1
movdqu 0(%esi), %xmm2
movdqu 64(%esi), %xmm5
movdqu 128(%esi), %xmm6
movdqu 192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 0(%edx)
movdqu %xmm1, 64(%edx)
movdqu %xmm0, 128(%edx)
movdqu %xmm3, 192(%edx)
movdqa 512(%esp),%xmm0
movdqa 528(%esp),%xmm1
movdqa 544(%esp),%xmm2
movdqa 560(%esp),%xmm3
paddd 192(%esp), %xmm0
paddd 208(%esp), %xmm1
paddd 224(%esp), %xmm2
paddd 240(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu 16+0(%esi), %xmm2
movdqu 16+64(%esi), %xmm5
movdqu 16+128(%esi), %xmm6
movdqu 16+192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 16+0(%edx)
movdqu %xmm1, 16+64(%edx)
movdqu %xmm0, 16+128(%edx)
movdqu %xmm3, 16+192(%edx)
movdqa 576(%esp),%xmm0
movdqa 592(%esp),%xmm1
movdqa 608(%esp),%xmm2
movdqa 624(%esp),%xmm3
paddd 256(%esp), %xmm0
paddd 272(%esp), %xmm1
paddd 288(%esp), %xmm2
paddd 304(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu 32+0(%esi), %xmm2
movdqu 32+64(%esi), %xmm5
movdqu 32+128(%esi), %xmm6
movdqu 32+192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 32+0(%edx)
movdqu %xmm1, 32+64(%edx)
movdqu %xmm0, 32+128(%edx)
movdqu %xmm3, 32+192(%edx)
movdqa 640(%esp),%xmm0
movdqa 656(%esp),%xmm1
movdqa 672(%esp),%xmm2
movdqa 688(%esp),%xmm3
paddd 320(%esp), %xmm0
paddd 336(%esp), %xmm1
paddd 352(%esp), %xmm2
paddd 368(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu 48+0(%esi), %xmm2
movdqu 48+64(%esi), %xmm5
movdqu 48+128(%esi), %xmm6
movdqu 48+192(%esi), %xmm7
pxor %xmm2, %xmm4
pxor %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm7, %xmm3
movdqu %xmm4, 48+0(%edx)
movdqu %xmm1, 48+64(%edx)
movdqu %xmm0, 48+128(%edx)
movdqu %xmm3, 48+192(%edx)
addl $256,%esi
jmp chacha_blocks_sse2_mainloop1_cont
chacha_blocks_sse2_noinput1:
movdqu %xmm4, 0(%edx)
movdqu %xmm1, 64(%edx)
movdqu %xmm0, 128(%edx)
movdqu %xmm3, 192(%edx)
movdqa 512(%esp),%xmm0
movdqa 528(%esp),%xmm1
movdqa 544(%esp),%xmm2
movdqa 560(%esp),%xmm3
paddd 192(%esp), %xmm0
paddd 208(%esp), %xmm1
paddd 224(%esp), %xmm2
paddd 240(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu %xmm4, 16+0(%edx)
movdqu %xmm1, 16+64(%edx)
movdqu %xmm0, 16+128(%edx)
movdqu %xmm3, 16+192(%edx)
movdqa 576(%esp),%xmm0
movdqa 592(%esp),%xmm1
movdqa 608(%esp),%xmm2
movdqa 624(%esp),%xmm3
paddd 256(%esp), %xmm0
paddd 272(%esp), %xmm1
paddd 288(%esp), %xmm2
paddd 304(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu %xmm4, 32+0(%edx)
movdqu %xmm1, 32+64(%edx)
movdqu %xmm0, 32+128(%edx)
movdqu %xmm3, 32+192(%edx)
movdqa 640(%esp),%xmm0
movdqa 656(%esp),%xmm1
movdqa 672(%esp),%xmm2
movdqa 688(%esp),%xmm3
paddd 320(%esp), %xmm0
paddd 336(%esp), %xmm1
paddd 352(%esp), %xmm2
paddd 368(%esp), %xmm3
movdqa %xmm0, %xmm4
movdqa %xmm2, %xmm5
punpckldq %xmm1, %xmm4
punpckldq %xmm3, %xmm5
punpckhdq %xmm1, %xmm0
punpckhdq %xmm3, %xmm2
movdqa %xmm4, %xmm1
movdqa %xmm0, %xmm3
punpcklqdq %xmm5, %xmm4
punpckhqdq %xmm5, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm2, %xmm3
movdqu %xmm4, 48+0(%edx)
movdqu %xmm1, 48+64(%edx)
movdqu %xmm0, 48+128(%edx)
movdqu %xmm3, 48+192(%edx)
chacha_blocks_sse2_mainloop1_cont:
movl 92(%esp),%eax
subl $256,%eax
addl $256,%edx
cmpl $256,%eax
jae chacha_blocks_sse2_bytesatleast256
cmpl $0,%eax
jbe chacha_blocks_sse2_done
chacha_blocks_sse2_bytesbetween1and255:
cmpl $64,%eax
jae chacha_blocks_sse2_nocopy
movl %edx,92(%esp)
cmpl $0,%esi
jbe chacha_blocks_sse2_noinput2
leal 128(%esp),%edi
movl %eax,%ecx
rep movsb
leal 128(%esp),%esi
chacha_blocks_sse2_noinput2:
leal 128(%esp),%edx
chacha_blocks_sse2_nocopy:
movl %eax,80(%esp)
movdqa 0(%esp),%xmm0
movdqa 16(%esp),%xmm1
movdqa 32(%esp),%xmm2
movdqa 48(%esp),%xmm3
movl 88(%esp),%eax
chacha_blocks_sse2_mainloop2:
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshuflw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm3,%xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
movdqa %xmm3,%xmm4
pslld $8, %xmm3
psrld $24, %xmm4
pshufd $0x93,%xmm0,%xmm0
pxor %xmm4, %xmm3
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x39,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
subl $2, %eax
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshuflw $0xb1,%xmm3,%xmm3
pshufhw $0xb1,%xmm3,%xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
movdqa %xmm3,%xmm4
pslld $8, %xmm3
psrld $24, %xmm4
pshufd $0x39,%xmm0,%xmm0
pxor %xmm4, %xmm3
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x93,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
ja chacha_blocks_sse2_mainloop2
paddd 0(%esp), %xmm0
paddd 16(%esp), %xmm1
paddd 32(%esp), %xmm2
paddd 48(%esp), %xmm3
cmpl $0,%esi
jbe chacha_blocks_sse2_noinput3
movdqu 0(%esi),%xmm4
movdqu 16(%esi),%xmm5
movdqu 32(%esi),%xmm6
movdqu 48(%esi),%xmm7
pxor %xmm4, %xmm0
pxor %xmm5, %xmm1
pxor %xmm6, %xmm2
pxor %xmm7, %xmm3
addl $64,%esi
chacha_blocks_sse2_noinput3:
movdqu %xmm0,0(%edx)
movdqu %xmm1,16(%edx)
movdqu %xmm2,32(%edx)
movdqu %xmm3,48(%edx)
movl 80(%esp),%eax
movl 48(%esp),%ecx
movl 4+48(%esp),%ebx
addl $1,%ecx
adcl $0,%ebx
movl %ecx,48(%esp)
movl %ebx,4+48(%esp)
cmpl $64,%eax
ja chacha_blocks_sse2_bytesatleast65
jae chacha_blocks_sse2_bytesatleast64
movl %edx,%esi
movl 92(%esp),%edi
movl %eax,%ecx
rep movsb
chacha_blocks_sse2_bytesatleast64:
chacha_blocks_sse2_done:
movl 84(%esp),%eax
movdqa 48(%esp),%xmm0
movdqu %xmm0,32(%eax)
movl 64(%esp),%eax
movl 68(%esp),%ebx
movl 72(%esp),%esi
movl 76(%esp),%edi
movl %ebp, %esp
popl %ebp
ret
chacha_blocks_sse2_bytesatleast65:
subl $64,%eax
addl $64,%edx
jmp chacha_blocks_sse2_bytesbetween1and255

.text

.p2align 4,,15
chacha_constants:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

/* ========================================================================= */
#elif __amd64__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
movq %rsp,%r11
andq $31,%r11
addq $256,%r11
subq %r11,%rsp
movq %rdi,%rdi
movq %rsi,%rsi
movq %rdx,%rdx
movq %rcx,%r8
cmpq $0,%r8
jbe chacha_blocks_x86_done
movq %r11,64(%rsp)
movq %r12,72(%rsp)
movq %r13,80(%rsp)
movq %r14,88(%rsp)
movq %r15,96(%rsp)
movq %rbx,104(%rsp)
movq %rbp,112(%rsp)
movq 0(%rdi),%rcx
movq 8(%rdi),%r9
movq 16(%rdi),%rax
movq 24(%rdi),%r10
movq 32(%rdi),%r11
movq 40(%rdi),%r12
movq 48(%rdi),%r13
movq %rcx,120(%rsp)
movq %r9,128(%rsp)
movq %rax,136(%rsp)
movq %r10,144(%rsp)
movq %r11,152(%rsp)
movq %r12,160(%rsp)
movq %r13,168(%rsp)
movq %rdi,176(%rsp)
chacha_blocks_x86_bytesatleast1:
cmpq $64,%r8
jae chacha_blocks_x86_nocopy
movq %rdx,184(%rsp)
cmpq $0,%rsi
jbe chacha_blocks_x86_noinput1
leaq 0(%rsp),%rdi
movq %r8,%rcx
rep movsb
leaq 0(%rsp),%rsi
chacha_blocks_x86_noinput1:
leaq 0(%rsp),%rdx
chacha_blocks_x86_nocopy:
movq %rdx,192(%rsp)
movq %rsi,200(%rsp)
movq %r8,208(%rsp)
movq $0x3320646e61707865,%rdi
movq %rdi,%rcx
shrq $32,%rdi
movq $0x6b20657479622d32,%rsi
movq %rsi,%r8
shrq $32,%rsi
movq 120(%rsp),%rdx
movq %rdx,%r9
shrq $32,%rdx
movq 128(%rsp),%rax
movq %rax,%r10
shrq $32,%rax
movq 136(%rsp),%r11
movq %r11,%r12
shrq $32,%r11
movq %r11,216(%rsp)
movq 144(%rsp),%r11
movq %r11,%r13
shrq $32,%r11
movq %r11,224(%rsp)
movq 152(%rsp),%r11
movq %r11,%r14
shrq $32,%r11
movq 160(%rsp),%r15
movq %r15,%rbx
shrq $32,%r15
movq 168(%rsp),%rbp
chacha_blocks_x86_mainloop:
movq %rbp,232(%rsp)
movq 216(%rsp),%rbp
addq %r9,%rcx
xorq %rcx,%r14
roll $16,%r14d
addq %rdx,%rdi
xorq %rdi,%r11
roll $16,%r11d
addq %r14,%r12
xorq %r12,%r9
roll $12,%r9d
addq %r11,%rbp
xorq %rbp,%rdx
roll $12,%edx
addq %r9,%rcx
xorq %rcx,%r14
roll $8,%r14d
addq %rdx,%rdi
xorq %rdi,%r11
roll $8,%r11d
addq %r14,%r12
xorq %r12,%r9
roll $7,%r9d
addq %r10,%r8
xorq %r8,%rbx
roll $16,%ebx
addq %r11,%rbp
xorq %rbp,%rdx
roll $7,%edx
movq %rbp,216(%rsp)
movq 224(%rsp),%rbp
addq %rax,%rsi
xorq %rsi,%r15
roll $16,%r15d
addq %rbx,%r13
xorq %r13,%r10
roll $12,%r10d
addq %r15,%rbp
xorq %rbp,%rax
roll $12,%eax
addq %r10,%r8
xorq %r8,%rbx
roll $8,%ebx
addq %rax,%rsi
xorq %rsi,%r15
roll $8,%r15d
addq %rbx,%r13
xorq %r13,%r10
roll $7,%r10d
addq %r15,%rbp
xorq %rbp,%rax
roll $7,%eax
addq %rdx,%rcx
xorq %rcx,%r15
roll $16,%r15d
addq %r10,%rdi
xorq %rdi,%r14
roll $16,%r14d
addq %r15,%r13
xorq %r13,%rdx
roll $12,%edx
addq %r14,%rbp
xorq %rbp,%r10
roll $12,%r10d
addq %rdx,%rcx
xorq %rcx,%r15
roll $8,%r15d
addq %r10,%rdi
xorq %rdi,%r14
roll $8,%r14d
addq %r15,%r13
xorq %r13,%rdx
roll $7,%edx
addq %rax,%r8
xorq %r8,%r11
roll $16,%r11d
addq %r14,%rbp
xorq %rbp,%r10
roll $7,%r10d
movq %rbp,224(%rsp)
movq 216(%rsp),%rbp
addq %r9,%rsi
xorq %rsi,%rbx
roll $16,%ebx
addq %r11,%r12
xorq %r12,%rax
roll $12,%eax
addq %rbx,%rbp
xorq %rbp,%r9
roll $12,%r9d
addq %rax,%r8
xorq %r8,%r11
roll $8,%r11d
addq %r9,%rsi
xorq %rsi,%rbx
roll $8,%ebx
addq %r11,%r12
xorq %r12,%rax
roll $7,%eax
addq %rbx,%rbp
xorq %rbp,%r9
roll $7,%r9d
addq %r9,%rcx
xorq %rcx,%r14
roll $16,%r14d
addq %rdx,%rdi
xorq %rdi,%r11
roll $16,%r11d
addq %r14,%r12
xorq %r12,%r9
roll $12,%r9d
addq %r11,%rbp
xorq %rbp,%rdx
roll $12,%edx
addq %r9,%rcx
xorq %rcx,%r14
roll $8,%r14d
addq %rdx,%rdi
xorq %rdi,%r11
roll $8,%r11d
addq %r14,%r12
xorq %r12,%r9
roll $7,%r9d
addq %r10,%r8
xorq %r8,%rbx
roll $16,%ebx
addq %r11,%rbp
xorq %rbp,%rdx
roll $7,%edx
movq %rbp,216(%rsp)
movq 224(%rsp),%rbp
addq %rax,%rsi
xorq %rsi,%r15
roll $16,%r15d
addq %rbx,%r13
xorq %r13,%r10
roll $12,%r10d
addq %r15,%rbp
xorq %rbp,%rax
roll $12,%eax
addq %r10,%r8
xorq %r8,%rbx
roll $8,%ebx
addq %rax,%rsi
xorq %rsi,%r15
roll $8,%r15d
addq %rbx,%r13
xorq %r13,%r10
roll $7,%r10d
addq %r15,%rbp
xorq %rbp,%rax
roll $7,%eax
addq %rdx,%rcx
xorq %rcx,%r15
roll $16,%r15d
addq %r10,%rdi
xorq %rdi,%r14
roll $16,%r14d
addq %r15,%r13
xorq %r13,%rdx
roll $12,%edx
addq %r14,%rbp
xorq %rbp,%r10
roll $12,%r10d
addq %rdx,%rcx
xorq %rcx,%r15
roll $8,%r15d
addq %r10,%rdi
xorq %rdi,%r14
roll $8,%r14d
addq %r15,%r13
xorq %r13,%rdx
roll $7,%edx
addq %rax,%r8
xorq %r8,%r11
roll $16,%r11d
addq %r14,%rbp
xorq %rbp,%r10
roll $7,%r10d
movq %rbp,224(%rsp)
movq 216(%rsp),%rbp
addq %r9,%rsi
xorq %rsi,%rbx
roll $16,%ebx
addq %r11,%r12
xorq %r12,%rax
roll $12,%eax
addq %rbx,%rbp
xorq %rbp,%r9
roll $12,%r9d
addq %rax,%r8
xorq %r8,%r11
roll $8,%r11d
addq %r9,%rsi
xorq %rsi,%rbx
roll $8,%ebx
addq %r11,%r12
xorq %r12,%rax
roll $7,%eax
addq %rbx,%rbp
xorq %rbp,%r9
roll $7,%r9d
movq %rbp,216(%rsp)
movq 232(%rsp),%rbp
subq $4,%rbp
ja chacha_blocks_x86_mainloop
addl $0x79622d32,%r8d
addl $0x6b206574,%esi
shlq $32,%rsi
addq %rsi,%r8
addl 128(%rsp),%r10d
shlq $32,%rax
addq 128(%rsp),%rax
shrq $32,%rax
shlq $32,%rax
addq %rax,%r10
movq 216(%rsp),%rsi
addl 136(%rsp),%r12d
shlq $32,%rsi
addq 136(%rsp),%rsi
shrq $32,%rsi
shlq $32,%rsi
addq %rsi,%r12
addl 152(%rsp),%r14d
shlq $32,%r11
addq 152(%rsp),%r11
shrq $32,%r11
shlq $32,%r11
addq %r11,%r14
addl $0x61707865,%ecx
addl $0x3320646e,%edi
shlq $32,%rdi
addq %rdi,%rcx
addl 120(%rsp),%r9d
shlq $32,%rdx
addq 120(%rsp),%rdx
shrq $32,%rdx
shlq $32,%rdx
addq %rdx,%r9
movq 224(%rsp),%rdi
addl 144(%rsp),%r13d
shlq $32,%rdi
addq 144(%rsp),%rdi
shrq $32,%rdi
shlq $32,%rdi
addq %rdi,%r13
addl 160(%rsp),%ebx
shlq $32,%r15
addq 160(%rsp),%r15
shrq $32,%r15
shlq $32,%r15
addq %r15,%rbx
movq 192(%rsp),%rdx
movq 200(%rsp),%rsi
cmpq $0,%rsi
jbe chacha_blocks_x86_noinput2
xorq 0(%rsi),%rcx
movq %rcx,0(%rdx)
xorq 8(%rsi),%r8
movq %r8,8(%rdx)
xorq 16(%rsi),%r9
movq %r9,16(%rdx)
xorq 24(%rsi),%r10
movq %r10,24(%rdx)
xorq 32(%rsi),%r12
movq %r12,32(%rdx)
xorq 40(%rsi),%r13
movq %r13,40(%rdx)
xorq 48(%rsi),%r14
movq %r14,48(%rdx)
xorq 56(%rsi),%rbx
movq %rbx,56(%rdx)
addq $64,%rsi
jmp chacha_blocks_x86_mainloop_cont
chacha_blocks_x86_noinput2:
movq %rcx,0(%rdx)
movq %r8,8(%rdx)
movq %r9,16(%rdx)
movq %r10,24(%rdx)
movq %r12,32(%rdx)
movq %r13,40(%rdx)
movq %r14,48(%rdx)
movq %rbx,56(%rdx)
chacha_blocks_x86_mainloop_cont:
movq 208(%rsp),%r8
movq 152(%rsp),%rdi
addq $1,%rdi
movq %rdi,152(%rsp)
cmpq $64,%r8
ja chacha_blocks_x86_bytesatleast65
jae chacha_blocks_x86_bytesatleast64
movq %rdx,%rsi
movq 184(%rsp),%rdi
movq %r8,%rcx
rep movsb
chacha_blocks_x86_bytesatleast64:
movq 176(%rsp),%rdi
movq 152(%rsp),%rsi
movq %rsi,32(%rdi)
movq 64(%rsp),%r11
movq 72(%rsp),%r12
movq 80(%rsp),%r13
movq 88(%rsp),%r14
movq 96(%rsp),%r15
movq 104(%rsp),%rbx
movq 112(%rsp),%rbp
chacha_blocks_x86_done:
addq %r11,%rsp
movq %rdi,%rax
movq %rsi,%rdx
ret
chacha_blocks_x86_bytesatleast65:
subq $64,%r8
addq $64,%rdx
jmp chacha_blocks_x86_bytesatleast1

/* ========================================================================= */
#elif __i386__
/* ========================================================================= */

.text

.align 4, 0x90
.global _chacha_blocks
_chacha_blocks:
.global chacha_blocks
chacha_blocks:
pushl %esi
pushl %edi
pushl %ebx
pushl %ebp
subl $204, %esp
movl 232(%esp), %eax
movl 236(%esp), %edi
testl %edi, %edi
movl 228(%esp), %esi
movl %eax, 76(%esp)
movl %eax, (%esp)
jne chacha_blocks_x86_3
addl $204, %esp
popl %ebp
popl %ebx
popl %edi
popl %esi
ret
chacha_blocks_x86_3:
movl 224(%esp), %ebx
movl 24(%ebx), %ebp
movl %ebp, 120(%esp)
movl 28(%ebx), %ebp
movl %ebp, 108(%esp)
movl 32(%ebx), %ebp
movl %ebp, 80(%esp)
movl (%ebx), %eax
movl 4(%ebx), %edx
movl 8(%ebx), %ecx
movl 36(%ebx), %ebp
movl %eax, 112(%esp)
movl %edx, 116(%esp)
movl %ecx, 124(%esp)
movl %ebp, 84(%esp)
movl 12(%ebx), %ecx
movl 16(%ebx), %edx
movl 20(%ebx), %eax
movl 40(%ebx), %ebp
movl 44(%ebx), %ebx
movl %ebp, 104(%esp)
movl %ebx, 100(%esp)
movl %eax, 96(%esp)
movl %edx, 92(%esp)
movl %ecx, 88(%esp)
jmp chacha_blocks_x86_4
chacha_blocks_x86_22:
movl 76(%esp), %eax
addl $-64, %edi
addl $64, %eax
movl %eax, 76(%esp)
chacha_blocks_x86_4:
cmpl $64, %edi
jae chacha_blocks_x86_15
testl %esi, %esi
je chacha_blocks_x86_14
testl %edi, %edi
jbe chacha_blocks_x86_13
movl %edi, %ecx
shrl $1, %ecx
testl %ecx, %ecx
jbe chacha_blocks_x86_23
xorl %ebx, %ebx
chacha_blocks_x86_9:
movzbl (%esi,%ebx,2), %edx
movb %dl, 4(%esp,%ebx,2)
movzbl 1(%esi,%ebx,2), %eax
movb %al, 5(%esp,%ebx,2)
incl %ebx
cmpl %ecx, %ebx
jb chacha_blocks_x86_9
lea 1(%ebx,%ebx), %edx
chacha_blocks_x86_11:
lea -1(%edx), %eax
cmpl %edi, %eax
jae chacha_blocks_x86_13
movzbl (%eax,%esi), %eax
movb %al, 3(%esp,%edx)
chacha_blocks_x86_13:
lea 4(%esp), %esi
chacha_blocks_x86_14:
movl 76(%esp), %eax
lea 4(%esp), %edx
movl %eax, (%esp)
movl %edx, 76(%esp)
chacha_blocks_x86_15:
movl 96(%esp), %ebp
movl %ebp, 168(%esp)
movl 80(%esp), %ebp
movl 124(%esp), %edx
movl 88(%esp), %ebx
movl %ebp, 180(%esp)
movl 224(%esp), %ebp
movl %edx, 148(%esp)
movl %ebx, 152(%esp)
movl 120(%esp), %edx
movl 108(%esp), %ebx
movl %edx, 136(%esp)
movl 116(%esp), %eax
movl 84(%esp), %edx
movl %ebx, 140(%esp)
movl 100(%esp), %ebx
movl 48(%ebp), %ebp
testl %ebp, %ebp
movl %eax, 144(%esp)
movl %edx, 176(%esp)
movl 112(%esp), %ecx
movl 92(%esp), %eax
movl 104(%esp), %edx
movl %ebx, 132(%esp)
movl $1634760805, %ebx
movl $857760878, 160(%esp)
movl $2036477234, 164(%esp)
movl $1797285236, 172(%esp)
jbe chacha_blocks_x86_19
movl %ebx, 156(%esp)
movl %ebp, 128(%esp)
movl %edi, 72(%esp)
movl %esi, 68(%esp)
chacha_blocks_x86_17:
movl 156(%esp), %ebp
addl %ecx, %ebp
movl 180(%esp), %edi
xorl %ebp, %edi
roll $16, %edi
addl %edi, %eax
xorl %eax, %ecx
roll $12, %ecx
addl %ecx, %ebp
xorl %ebp, %edi
roll $8, %edi
addl %edi, %eax
xorl %eax, %ecx
movl %eax, 184(%esp)
movl 144(%esp), %esi
movl 160(%esp), %eax
addl %esi, %eax
roll $7, %ecx
movl %ecx, 188(%esp)
movl 176(%esp), %ecx
xorl %eax, %ecx
roll $16, %ecx
movl 168(%esp), %ebx
addl %ecx, %ebx
xorl %ebx, %esi
roll $12, %esi
addl %esi, %eax
movl %edi, 180(%esp)
xorl %eax, %ecx
movl %eax, 160(%esp)
movl 148(%esp), %edi
movl 164(%esp), %eax
addl %edi, %eax
xorl %eax, %edx
roll $8, %ecx
roll $16, %edx
addl %ecx, %ebx
movl %ecx, 176(%esp)
xorl %ebx, %esi
movl 136(%esp), %ecx
addl %edx, %ecx
xorl %ecx, %edi
roll $12, %edi
addl %edi, %eax
xorl %eax, %edx
roll $8, %edx
addl %edx, %ecx
xorl %ecx, %edi
movl %ebx, 168(%esp)
movl %edx, 192(%esp)
movl 152(%esp), %edx
movl 172(%esp), %ebx
addl %edx, %ebx
roll $7, %edi
movl %edi, 148(%esp)
movl 132(%esp), %edi
xorl %ebx, %edi
roll $16, %edi
movl %eax, 164(%esp)
movl 140(%esp), %eax
addl %edi, %eax
xorl %eax, %edx
roll $12, %edx
addl %edx, %ebx
roll $7, %esi
xorl %ebx, %edi
roll $8, %edi
addl %esi, %ebp
addl %edi, %eax
xorl %ebp, %edi
roll $16, %edi
xorl %eax, %edx
addl %edi, %ecx
xorl %ecx, %esi
roll $12, %esi
addl %esi, %ebp
xorl %ebp, %edi
roll $8, %edi
addl %edi, %ecx
xorl %ecx, %esi
movl %ebp, 156(%esp)
movl %ecx, 136(%esp)
movl 148(%esp), %ecx
movl 160(%esp), %ebp
addl %ecx, %ebp
roll $7, %esi
movl %esi, 144(%esp)
movl 180(%esp), %esi
xorl %ebp, %esi
roll $16, %esi
addl %esi, %eax
xorl %eax, %ecx
roll $12, %ecx
addl %ecx, %ebp
roll $7, %edx
xorl %ebp, %esi
movl %ebp, 160(%esp)
movl 164(%esp), %ebp
addl %edx, %ebp
movl %edi, 132(%esp)
roll $8, %esi
movl 176(%esp), %edi
addl %esi, %eax
xorl %ebp, %edi
xorl %eax, %ecx
roll $16, %edi
movl %eax, 140(%esp)
movl 184(%esp), %eax
addl %edi, %eax
xorl %eax, %edx
roll $12, %edx
addl %edx, %ebp
xorl %ebp, %edi
roll $8, %edi
addl %edi, %eax
roll $7, %ecx
xorl %eax, %edx
movl %ecx, 148(%esp)
movl 188(%esp), %ecx
addl %ecx, %ebx
roll $7, %edx
movl %edx, 152(%esp)
movl 192(%esp), %edx
xorl %ebx, %edx
roll $16, %edx
movl %ebp, 164(%esp)
movl 168(%esp), %ebp
addl %edx, %ebp
xorl %ebp, %ecx
roll $12, %ecx
addl %ecx, %ebx
xorl %ebx, %edx
roll $8, %edx
addl %edx, %ebp
xorl %ebp, %ecx
movl %ebx, 172(%esp)
roll $7, %ecx
movl 128(%esp), %ebx
movl %esi, 180(%esp)
addl $-2, %ebx
movl %edi, 176(%esp)
movl %ebp, 168(%esp)
movl %ebx, 128(%esp)
jne chacha_blocks_x86_17
movl 156(%esp), %ebx
movl 72(%esp), %edi
movl 68(%esp), %esi
chacha_blocks_x86_19:
addl $1634760805, %ebx
testl %esi, %esi
je chacha_blocks_x86_30
movl (%esi), %ebp
xorl %ebx, %ebp
movl 76(%esp), %ebx
addl 112(%esp), %ecx
addl 92(%esp), %eax
movl %ebp, (%ebx)
movl 160(%esp), %ebp
addl $857760878, %ebp
xorl 4(%esi), %ebp
movl %ebp, 4(%ebx)
movl 164(%esp), %ebp
addl $2036477234, %ebp
xorl 8(%esi), %ebp
movl %ebp, 8(%ebx)
movl 172(%esp), %ebp
addl $1797285236, %ebp
xorl 12(%esi), %ebp
movl %ebp, 12(%ebx)
xorl 16(%esi), %ecx
movl %ecx, 16(%ebx)
movl 144(%esp), %ecx
addl 116(%esp), %ecx
movl 148(%esp), %ebp
xorl 20(%esi), %ecx
movl %ecx, 20(%ebx)
addl 124(%esp), %ebp
movl 152(%esp), %ecx
xorl 24(%esi), %ebp
movl %ebp, 24(%ebx)
addl 88(%esp), %ecx
xorl 28(%esi), %ecx
movl %ecx, 28(%ebx)
xorl 32(%esi), %eax
movl %eax, 32(%ebx)
movl 168(%esp), %eax
addl 96(%esp), %eax
movl 136(%esp), %ecx
xorl 36(%esi), %eax
movl %eax, 36(%ebx)
addl 120(%esp), %ecx
movl 140(%esp), %ebp
xorl 40(%esi), %ecx
movl %ecx, 40(%ebx)
addl 108(%esp), %ebp
movl 180(%esp), %eax
xorl 44(%esi), %ebp
movl %ebp, 44(%ebx)
addl 80(%esp), %eax
movl 176(%esp), %ecx
xorl 48(%esi), %eax
movl %eax, 48(%ebx)
addl 84(%esp), %ecx
xorl 52(%esi), %ecx
movl %ecx, 52(%ebx)
addl 104(%esp), %edx
xorl 56(%esi), %edx
movl %edx, 56(%ebx)
movl 132(%esp), %edx
addl 100(%esp), %edx
xorl 60(%esi), %edx
addl $64, %esi
movl %edx, 60(%ebx)
chacha_blocks_x86_21:
movl 84(%esp), %edx
incl 80(%esp)
lea 1(%edx), %eax
jne ..L2
movl %eax, %edx
..L2:
movl %edx, 84(%esp)
cmpl $64, %edi
jbe chacha_blocks_x86_24
jmp chacha_blocks_x86_22
chacha_blocks_x86_23:
movl $1, %edx
jmp chacha_blocks_x86_11
chacha_blocks_x86_24:
jae chacha_blocks_x86_29
testl %edi, %edi
jbe chacha_blocks_x86_29
movl (%esp), %ecx
xorl %edx, %edx
movl 76(%esp), %ebx
chacha_blocks_x86_27:
movzbl (%edx,%ebx), %eax
movb %al, (%edx,%ecx)
incl %edx
cmpl %edi, %edx
jb chacha_blocks_x86_27
chacha_blocks_x86_29:
movl 224(%esp), %ecx
movl 80(%esp), %eax
movl 84(%esp), %edx
movl %eax, 32(%ecx)
movl %edx, 36(%ecx)
addl $204, %esp
popl %ebp
popl %ebx
popl %edi
popl %esi
ret
chacha_blocks_x86_30:
movl 76(%esp), %ebp
addl 112(%esp), %ecx
addl 92(%esp), %eax
movl %ecx, 16(%ebp)
movl 144(%esp), %ecx
addl 116(%esp), %ecx
movl %ecx, 20(%ebp)
movl 152(%esp), %ecx
movl %ebx, (%ebp)
movl 160(%esp), %ebx
addl $857760878, %ebx
movl %ebx, 4(%ebp)
movl 164(%esp), %ebx
addl 88(%esp), %ecx
addl $2036477234, %ebx
movl %ebx, 8(%ebp)
movl 172(%esp), %ebx
addl $1797285236, %ebx
movl %ebx, 12(%ebp)
movl %ecx, 28(%ebp)
movl %eax, 32(%ebp)
movl 148(%esp), %ebx
movl 168(%esp), %eax
movl 136(%esp), %ecx
addl 124(%esp), %ebx
addl 96(%esp), %eax
addl 120(%esp), %ecx
addl 104(%esp), %edx
movl %ebx, 24(%ebp)
movl %eax, 36(%ebp)
movl %ecx, 40(%ebp)
movl %edx, 56(%ebp)
movl 140(%esp), %ebx
movl 180(%esp), %eax
movl 176(%esp), %ecx
movl 132(%esp), %edx
addl 108(%esp), %ebx
addl 80(%esp), %eax
addl 84(%esp), %ecx
addl 100(%esp), %edx
movl %ebx, 44(%ebp)
movl %eax, 48(%ebp)
movl %ecx, 52(%ebp)
movl %edx, 60(%ebp)
jmp chacha_blocks_x86_21

/* ========================================================================= */
#elif __aarch64__
/* ========================================================================= */

// ====================================================================
// Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
// project. The module is, however, dual licensed under OpenSSL and
// CRYPTOGAMS licenses depending on where you obtain it. For further
// details see http://www.openssl.org/~appro/cryptogams/.
// ====================================================================

#if __BYTE_ORDER__==__ORDER_BIG_ENDIAN__
#define __ARMEB__
#else
#define __ARMEL__
#endif

.text

.align	5
.Lsigma:
.quad	0x3320646e61707865,0x6b20657479622d32		// endian-neutral
.Lone:
.long	1,0,0,0
.byte	67,104,97,67,104,97,50,48,32,102,111,114,32,65,82,77,118,56,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align	2

.globl	ChaCha20_ctr32
.type	ChaCha20_ctr32,%function
.align	5
ChaCha20_ctr32:
	cbz	x2,.Labort
	lsr x18,x5,#1            // x5 (rounds) / 2 because two rounds per iter
	cmp	x2,#192
	b.ge	ChaCha20_neon

.Lshort:
	stp	x29,x30,[sp,#-96]!
	add	x29,sp,#0

	adr	x5,.Lsigma
	stp	x19,x20,[sp,#16]
	stp	x21,x22,[sp,#32]
	stp	x23,x24,[sp,#48]
	stp	x25,x26,[sp,#64]
	stp	x27,x28,[sp,#80]
	sub	sp,sp,#64

	ldp	x22,x23,[x5]		// load sigma
	ldp	x24,x25,[x3]		// load key
	ldp	x26,x27,[x3,#16]
	ldp	x28,x30,[x4]		// load counter
#ifdef	__ARMEB__
	ror	x24,x24,#32
	ror	x25,x25,#32
	ror	x26,x26,#32
	ror	x27,x27,#32
	ror	x28,x28,#32
	ror	x30,x30,#32
#endif

.Loop_outer:
	mov	w5,w22			// unpack key block
	lsr	x6,x22,#32
	mov	w7,w23
	lsr	x8,x23,#32
	mov	w9,w24
	lsr	x10,x24,#32
	mov	w11,w25
	lsr	x12,x25,#32
	mov	w13,w26
	lsr	x14,x26,#32
	mov	w15,w27
	lsr	x16,x27,#32
	mov	w17,w28
	lsr	x19,x28,#32
	mov	w20,w30
	lsr	x21,x30,#32

	mov	x4,x18          // reload number of rounds
	subs	x2,x2,#64
.Loop:
	sub	x4,x4,#1
	add	w5,w5,w9
	add	w6,w6,w10
	add	w7,w7,w11
	add	w8,w8,w12
	eor	w17,w17,w5
	eor	w19,w19,w6
	eor	w20,w20,w7
	eor	w21,w21,w8
	ror	w17,w17,#16
	ror	w19,w19,#16
	ror	w20,w20,#16
	ror	w21,w21,#16
	add	w13,w13,w17
	add	w14,w14,w19
	add	w15,w15,w20
	add	w16,w16,w21
	eor	w9,w9,w13
	eor	w10,w10,w14
	eor	w11,w11,w15
	eor	w12,w12,w16
	ror	w9,w9,#20
	ror	w10,w10,#20
	ror	w11,w11,#20
	ror	w12,w12,#20
	add	w5,w5,w9
	add	w6,w6,w10
	add	w7,w7,w11
	add	w8,w8,w12
	eor	w17,w17,w5
	eor	w19,w19,w6
	eor	w20,w20,w7
	eor	w21,w21,w8
	ror	w17,w17,#24
	ror	w19,w19,#24
	ror	w20,w20,#24
	ror	w21,w21,#24
	add	w13,w13,w17
	add	w14,w14,w19
	add	w15,w15,w20
	add	w16,w16,w21
	eor	w9,w9,w13
	eor	w10,w10,w14
	eor	w11,w11,w15
	eor	w12,w12,w16
	ror	w9,w9,#25
	ror	w10,w10,#25
	ror	w11,w11,#25
	ror	w12,w12,#25
	add	w5,w5,w10
	add	w6,w6,w11
	add	w7,w7,w12
	add	w8,w8,w9
	eor	w21,w21,w5
	eor	w17,w17,w6
	eor	w19,w19,w7
	eor	w20,w20,w8
	ror	w21,w21,#16
	ror	w17,w17,#16
	ror	w19,w19,#16
	ror	w20,w20,#16
	add	w15,w15,w21
	add	w16,w16,w17
	add	w13,w13,w19
	add	w14,w14,w20
	eor	w10,w10,w15
	eor	w11,w11,w16
	eor	w12,w12,w13
	eor	w9,w9,w14
	ror	w10,w10,#20
	ror	w11,w11,#20
	ror	w12,w12,#20
	ror	w9,w9,#20
	add	w5,w5,w10
	add	w6,w6,w11
	add	w7,w7,w12
	add	w8,w8,w9
	eor	w21,w21,w5
	eor	w17,w17,w6
	eor	w19,w19,w7
	eor	w20,w20,w8
	ror	w21,w21,#24
	ror	w17,w17,#24
	ror	w19,w19,#24
	ror	w20,w20,#24
	add	w15,w15,w21
	add	w16,w16,w17
	add	w13,w13,w19
	add	w14,w14,w20
	eor	w10,w10,w15
	eor	w11,w11,w16
	eor	w12,w12,w13
	eor	w9,w9,w14
	ror	w10,w10,#25
	ror	w11,w11,#25
	ror	w12,w12,#25
	ror	w9,w9,#25
	cbnz	x4,.Loop

	add	w5,w5,w22		// accumulate key block
	add	x6,x6,x22,lsr#32
	add	w7,w7,w23
	add	x8,x8,x23,lsr#32
	add	w9,w9,w24
	add	x10,x10,x24,lsr#32
	add	w11,w11,w25
	add	x12,x12,x25,lsr#32
	add	w13,w13,w26
	add	x14,x14,x26,lsr#32
	add	w15,w15,w27
	add	x16,x16,x27,lsr#32
	add	w17,w17,w28
	add	x19,x19,x28,lsr#32
	add	w20,w20,w30
	add	x21,x21,x30,lsr#32

	b.lo	.Ltail

	add	x5,x5,x6,lsl#32	// pack
	add	x7,x7,x8,lsl#32
	ldp	x6,x8,[x1,#0]		// load input
	add	x9,x9,x10,lsl#32
	add	x11,x11,x12,lsl#32
	ldp	x10,x12,[x1,#16]
	add	x13,x13,x14,lsl#32
	add	x15,x15,x16,lsl#32
	ldp	x14,x16,[x1,#32]
	add	x17,x17,x19,lsl#32
	add	x20,x20,x21,lsl#32
	ldp	x19,x21,[x1,#48]
	add	x1,x1,#64
#ifdef	__ARMEB__
	rev	x5,x5
	rev	x7,x7
	rev	x9,x9
	rev	x11,x11
	rev	x13,x13
	rev	x15,x15
	rev	x17,x17
	rev	x20,x20
#endif
	eor	x5,x5,x6
	eor	x7,x7,x8
	eor	x9,x9,x10
	eor	x11,x11,x12
	eor	x13,x13,x14
	eor	x15,x15,x16
	eor	x17,x17,x19
	eor	x20,x20,x21

	stp	x5,x7,[x0,#0]		// store output
	add	x28,x28,#1			// increment counter
	stp	x9,x11,[x0,#16]
	stp	x13,x15,[x0,#32]
	stp	x17,x20,[x0,#48]
	add	x0,x0,#64

	b.hi	.Loop_outer

	ldp	x19,x20,[x29,#16]
	add	sp,sp,#64
	ldp	x21,x22,[x29,#32]
	ldp	x23,x24,[x29,#48]
	ldp	x25,x26,[x29,#64]
	ldp	x27,x28,[x29,#80]
	ldp	x29,x30,[sp],#96
.Labort:
	ret

.align	4
.Ltail:
	add	x2,x2,#64
.Less_than_64:
	sub	x0,x0,#1
	add	x1,x1,x2
	add	x0,x0,x2
	add	x4,sp,x2
	neg	x2,x2

	add	x5,x5,x6,lsl#32	// pack
	add	x7,x7,x8,lsl#32
	add	x9,x9,x10,lsl#32
	add	x11,x11,x12,lsl#32
	add	x13,x13,x14,lsl#32
	add	x15,x15,x16,lsl#32
	add	x17,x17,x19,lsl#32
	add	x20,x20,x21,lsl#32
#ifdef	__ARMEB__
	rev	x5,x5
	rev	x7,x7
	rev	x9,x9
	rev	x11,x11
	rev	x13,x13
	rev	x15,x15
	rev	x17,x17
	rev	x20,x20
#endif
	stp	x5,x7,[sp,#0]
	stp	x9,x11,[sp,#16]
	stp	x13,x15,[sp,#32]
	stp	x17,x20,[sp,#48]

.Loop_tail:
	ldrb	w10,[x1,x2]
	ldrb	w11,[x4,x2]
	add	x2,x2,#1
	eor	w10,w10,w11
	strb	w10,[x0,x2]
	cbnz	x2,.Loop_tail

	stp	xzr,xzr,[sp,#0]
	stp	xzr,xzr,[sp,#16]
	stp	xzr,xzr,[sp,#32]
	stp	xzr,xzr,[sp,#48]

	ldp	x19,x20,[x29,#16]
	add	sp,sp,#64
	ldp	x21,x22,[x29,#32]
	ldp	x23,x24,[x29,#48]
	ldp	x25,x26,[x29,#64]
	ldp	x27,x28,[x29,#80]
	ldp	x29,x30,[sp],#96
	ret
.size	ChaCha20_ctr32,.-ChaCha20_ctr32

.type	ChaCha20_neon,%function
.align	5
ChaCha20_neon:
	stp	x29,x30,[sp,#-96]!
	add	x29,sp,#0

	adr	x5,.Lsigma
	stp	x19,x20,[sp,#16]
	stp	x21,x22,[sp,#32]
	stp	x23,x24,[sp,#48]
	stp	x25,x26,[sp,#64]
	stp	x27,x28,[sp,#80]
	cmp	x2,#512
	b.hs	.L512_or_more_neon

	sub	sp,sp,#64

	ldp	x22,x23,[x5]		// load sigma
	ld1	{v24.4s},[x5],#16
	ldp	x24,x25,[x3]		// load key
	ldp	x26,x27,[x3,#16]
	ld1	{v25.4s,v26.4s},[x3]
	ldp	x28,x30,[x4]		// load counter
	ld1	{v27.4s},[x4]
	ld1	{v31.4s},[x5]
#ifdef	__ARMEB__
	rev64	v24.4s,v24.4s
	ror	x24,x24,#32
	ror	x25,x25,#32
	ror	x26,x26,#32
	ror	x27,x27,#32
	ror	x28,x28,#32
	ror	x30,x30,#32
#endif
	add	v27.4s,v27.4s,v31.4s		// += 1
	add	v28.4s,v27.4s,v31.4s
	add	v29.4s,v28.4s,v31.4s
	shl	v31.4s,v31.4s,#2			// 1 -> 4

.Loop_outer_neon:
	mov	w5,w22			// unpack key block
	lsr	x6,x22,#32
	mov	v0.16b,v24.16b
	mov	w7,w23
	lsr	x8,x23,#32
	mov	v4.16b,v24.16b
	mov	w9,w24
	lsr	x10,x24,#32
	mov	v16.16b,v24.16b
	mov	w11,w25
	mov	v1.16b,v25.16b
	lsr	x12,x25,#32
	mov	v5.16b,v25.16b
	mov	w13,w26
	mov	v17.16b,v25.16b
	lsr	x14,x26,#32
	mov	v3.16b,v27.16b
	mov	w15,w27
	mov	v7.16b,v28.16b
	lsr	x16,x27,#32
	mov	v19.16b,v29.16b
	mov	w17,w28
	mov	v2.16b,v26.16b
	lsr	x19,x28,#32
	mov	v6.16b,v26.16b
	mov	w20,w30
	mov	v18.16b,v26.16b
	lsr	x21,x30,#32

	mov	x4,x18          // reload number of rounds
	subs	x2,x2,#256
.Loop_neon:
	sub	x4,x4,#1
	add	v0.4s,v0.4s,v1.4s
	add	w5,w5,w9
	add	v4.4s,v4.4s,v5.4s
	add	w6,w6,w10
	add	v16.4s,v16.4s,v17.4s
	add	w7,w7,w11
	eor	v3.16b,v3.16b,v0.16b
	add	w8,w8,w12
	eor	v7.16b,v7.16b,v4.16b
	eor	w17,w17,w5
	eor	v19.16b,v19.16b,v16.16b
	eor	w19,w19,w6
	rev32	v3.8h,v3.8h
	eor	w20,w20,w7
	rev32	v7.8h,v7.8h
	eor	w21,w21,w8
	rev32	v19.8h,v19.8h
	ror	w17,w17,#16
	add	v2.4s,v2.4s,v3.4s
	ror	w19,w19,#16
	add	v6.4s,v6.4s,v7.4s
	ror	w20,w20,#16
	add	v18.4s,v18.4s,v19.4s
	ror	w21,w21,#16
	eor	v20.16b,v1.16b,v2.16b
	add	w13,w13,w17
	eor	v21.16b,v5.16b,v6.16b
	add	w14,w14,w19
	eor	v22.16b,v17.16b,v18.16b
	add	w15,w15,w20
	ushr	v1.4s,v20.4s,#20
	add	w16,w16,w21
	ushr	v5.4s,v21.4s,#20
	eor	w9,w9,w13
	ushr	v17.4s,v22.4s,#20
	eor	w10,w10,w14
	sli	v1.4s,v20.4s,#12
	eor	w11,w11,w15
	sli	v5.4s,v21.4s,#12
	eor	w12,w12,w16
	sli	v17.4s,v22.4s,#12
	ror	w9,w9,#20
	add	v0.4s,v0.4s,v1.4s
	ror	w10,w10,#20
	add	v4.4s,v4.4s,v5.4s
	ror	w11,w11,#20
	add	v16.4s,v16.4s,v17.4s
	ror	w12,w12,#20
	eor	v20.16b,v3.16b,v0.16b
	add	w5,w5,w9
	eor	v21.16b,v7.16b,v4.16b
	add	w6,w6,w10
	eor	v22.16b,v19.16b,v16.16b
	add	w7,w7,w11
	ushr	v3.4s,v20.4s,#24
	add	w8,w8,w12
	ushr	v7.4s,v21.4s,#24
	eor	w17,w17,w5
	ushr	v19.4s,v22.4s,#24
	eor	w19,w19,w6
	sli	v3.4s,v20.4s,#8
	eor	w20,w20,w7
	sli	v7.4s,v21.4s,#8
	eor	w21,w21,w8
	sli	v19.4s,v22.4s,#8
	ror	w17,w17,#24
	add	v2.4s,v2.4s,v3.4s
	ror	w19,w19,#24
	add	v6.4s,v6.4s,v7.4s
	ror	w20,w20,#24
	add	v18.4s,v18.4s,v19.4s
	ror	w21,w21,#24
	eor	v20.16b,v1.16b,v2.16b
	add	w13,w13,w17
	eor	v21.16b,v5.16b,v6.16b
	add	w14,w14,w19
	eor	v22.16b,v17.16b,v18.16b
	add	w15,w15,w20
	ushr	v1.4s,v20.4s,#25
	add	w16,w16,w21
	ushr	v5.4s,v21.4s,#25
	eor	w9,w9,w13
	ushr	v17.4s,v22.4s,#25
	eor	w10,w10,w14
	sli	v1.4s,v20.4s,#7
	eor	w11,w11,w15
	sli	v5.4s,v21.4s,#7
	eor	w12,w12,w16
	sli	v17.4s,v22.4s,#7
	ror	w9,w9,#25
	ext	v2.16b,v2.16b,v2.16b,#8
	ror	w10,w10,#25
	ext	v6.16b,v6.16b,v6.16b,#8
	ror	w11,w11,#25
	ext	v18.16b,v18.16b,v18.16b,#8
	ror	w12,w12,#25
	ext	v3.16b,v3.16b,v3.16b,#12
	ext	v7.16b,v7.16b,v7.16b,#12
	ext	v19.16b,v19.16b,v19.16b,#12
	ext	v1.16b,v1.16b,v1.16b,#4
	ext	v5.16b,v5.16b,v5.16b,#4
	ext	v17.16b,v17.16b,v17.16b,#4
	add	v0.4s,v0.4s,v1.4s
	add	w5,w5,w10
	add	v4.4s,v4.4s,v5.4s
	add	w6,w6,w11
	add	v16.4s,v16.4s,v17.4s
	add	w7,w7,w12
	eor	v3.16b,v3.16b,v0.16b
	add	w8,w8,w9
	eor	v7.16b,v7.16b,v4.16b
	eor	w21,w21,w5
	eor	v19.16b,v19.16b,v16.16b
	eor	w17,w17,w6
	rev32	v3.8h,v3.8h
	eor	w19,w19,w7
	rev32	v7.8h,v7.8h
	eor	w20,w20,w8
	rev32	v19.8h,v19.8h
	ror	w21,w21,#16
	add	v2.4s,v2.4s,v3.4s
	ror	w17,w17,#16
	add	v6.4s,v6.4s,v7.4s
	ror	w19,w19,#16
	add	v18.4s,v18.4s,v19.4s
	ror	w20,w20,#16
	eor	v20.16b,v1.16b,v2.16b
	add	w15,w15,w21
	eor	v21.16b,v5.16b,v6.16b
	add	w16,w16,w17
	eor	v22.16b,v17.16b,v18.16b
	add	w13,w13,w19
	ushr	v1.4s,v20.4s,#20
	add	w14,w14,w20
	ushr	v5.4s,v21.4s,#20
	eor	w10,w10,w15
	ushr	v17.4s,v22.4s,#20
	eor	w11,w11,w16
	sli	v1.4s,v20.4s,#12
	eor	w12,w12,w13
	sli	v5.4s,v21.4s,#12
	eor	w9,w9,w14
	sli	v17.4s,v22.4s,#12
	ror	w10,w10,#20
	add	v0.4s,v0.4s,v1.4s
	ror	w11,w11,#20
	add	v4.4s,v4.4s,v5.4s
	ror	w12,w12,#20
	add	v16.4s,v16.4s,v17.4s
	ror	w9,w9,#20
	eor	v20.16b,v3.16b,v0.16b
	add	w5,w5,w10
	eor	v21.16b,v7.16b,v4.16b
	add	w6,w6,w11
	eor	v22.16b,v19.16b,v16.16b
	add	w7,w7,w12
	ushr	v3.4s,v20.4s,#24
	add	w8,w8,w9
	ushr	v7.4s,v21.4s,#24
	eor	w21,w21,w5
	ushr	v19.4s,v22.4s,#24
	eor	w17,w17,w6
	sli	v3.4s,v20.4s,#8
	eor	w19,w19,w7
	sli	v7.4s,v21.4s,#8
	eor	w20,w20,w8
	sli	v19.4s,v22.4s,#8
	ror	w21,w21,#24
	add	v2.4s,v2.4s,v3.4s
	ror	w17,w17,#24
	add	v6.4s,v6.4s,v7.4s
	ror	w19,w19,#24
	add	v18.4s,v18.4s,v19.4s
	ror	w20,w20,#24
	eor	v20.16b,v1.16b,v2.16b
	add	w15,w15,w21
	eor	v21.16b,v5.16b,v6.16b
	add	w16,w16,w17
	eor	v22.16b,v17.16b,v18.16b
	add	w13,w13,w19
	ushr	v1.4s,v20.4s,#25
	add	w14,w14,w20
	ushr	v5.4s,v21.4s,#25
	eor	w10,w10,w15
	ushr	v17.4s,v22.4s,#25
	eor	w11,w11,w16
	sli	v1.4s,v20.4s,#7
	eor	w12,w12,w13
	sli	v5.4s,v21.4s,#7
	eor	w9,w9,w14
	sli	v17.4s,v22.4s,#7
	ror	w10,w10,#25
	ext	v2.16b,v2.16b,v2.16b,#8
	ror	w11,w11,#25
	ext	v6.16b,v6.16b,v6.16b,#8
	ror	w12,w12,#25
	ext	v18.16b,v18.16b,v18.16b,#8
	ror	w9,w9,#25
	ext	v3.16b,v3.16b,v3.16b,#4
	ext	v7.16b,v7.16b,v7.16b,#4
	ext	v19.16b,v19.16b,v19.16b,#4
	ext	v1.16b,v1.16b,v1.16b,#12
	ext	v5.16b,v5.16b,v5.16b,#12
	ext	v17.16b,v17.16b,v17.16b,#12
	cbnz	x4,.Loop_neon

	add	w5,w5,w22		// accumulate key block
	add	v0.4s,v0.4s,v24.4s
	add	x6,x6,x22,lsr#32
	add	v4.4s,v4.4s,v24.4s
	add	w7,w7,w23
	add	v16.4s,v16.4s,v24.4s
	add	x8,x8,x23,lsr#32
	add	v2.4s,v2.4s,v26.4s
	add	w9,w9,w24
	add	v6.4s,v6.4s,v26.4s
	add	x10,x10,x24,lsr#32
	add	v18.4s,v18.4s,v26.4s
	add	w11,w11,w25
	add	v3.4s,v3.4s,v27.4s
	add	x12,x12,x25,lsr#32
	add	w13,w13,w26
	add	v7.4s,v7.4s,v28.4s
	add	x14,x14,x26,lsr#32
	add	w15,w15,w27
	add	v19.4s,v19.4s,v29.4s
	add	x16,x16,x27,lsr#32
	add	w17,w17,w28
	add	v1.4s,v1.4s,v25.4s
	add	x19,x19,x28,lsr#32
	add	w20,w20,w30
	add	v5.4s,v5.4s,v25.4s
	add	x21,x21,x30,lsr#32
	add	v17.4s,v17.4s,v25.4s

	b.lo	.Ltail_neon

	add	x5,x5,x6,lsl#32	// pack
	add	x7,x7,x8,lsl#32
	ldp	x6,x8,[x1,#0]		// load input
	add	x9,x9,x10,lsl#32
	add	x11,x11,x12,lsl#32
	ldp	x10,x12,[x1,#16]
	add	x13,x13,x14,lsl#32
	add	x15,x15,x16,lsl#32
	ldp	x14,x16,[x1,#32]
	add	x17,x17,x19,lsl#32
	add	x20,x20,x21,lsl#32
	ldp	x19,x21,[x1,#48]
	add	x1,x1,#64
#ifdef	__ARMEB__
	rev	x5,x5
	rev	x7,x7
	rev	x9,x9
	rev	x11,x11
	rev	x13,x13
	rev	x15,x15
	rev	x17,x17
	rev	x20,x20
#endif
	ld1	{v20.16b,v21.16b,v22.16b,v23.16b},[x1],#64
	eor	x5,x5,x6
	eor	x7,x7,x8
	eor	x9,x9,x10
	eor	x11,x11,x12
	eor	x13,x13,x14
	eor	v0.16b,v0.16b,v20.16b
	eor	x15,x15,x16
	eor	v1.16b,v1.16b,v21.16b
	eor	x17,x17,x19
	eor	v2.16b,v2.16b,v22.16b
	eor	x20,x20,x21
	eor	v3.16b,v3.16b,v23.16b
	ld1	{v20.16b,v21.16b,v22.16b,v23.16b},[x1],#64

	stp	x5,x7,[x0,#0]		// store output
	add	x28,x28,#4			// increment counter
	stp	x9,x11,[x0,#16]
	add	v27.4s,v27.4s,v31.4s		// += 4
	stp	x13,x15,[x0,#32]
	add	v28.4s,v28.4s,v31.4s
	stp	x17,x20,[x0,#48]
	add	v29.4s,v29.4s,v31.4s
	add	x0,x0,#64

	st1	{v0.16b,v1.16b,v2.16b,v3.16b},[x0],#64
	ld1	{v0.16b,v1.16b,v2.16b,v3.16b},[x1],#64

	eor	v4.16b,v4.16b,v20.16b
	eor	v5.16b,v5.16b,v21.16b
	eor	v6.16b,v6.16b,v22.16b
	eor	v7.16b,v7.16b,v23.16b
	st1	{v4.16b,v5.16b,v6.16b,v7.16b},[x0],#64

	eor	v16.16b,v16.16b,v0.16b
	eor	v17.16b,v17.16b,v1.16b
	eor	v18.16b,v18.16b,v2.16b
	eor	v19.16b,v19.16b,v3.16b
	st1	{v16.16b,v17.16b,v18.16b,v19.16b},[x0],#64

	b.hi	.Loop_outer_neon

	ldp	x19,x20,[x29,#16]
	add	sp,sp,#64
	ldp	x21,x22,[x29,#32]
	ldp	x23,x24,[x29,#48]
	ldp	x25,x26,[x29,#64]
	ldp	x27,x28,[x29,#80]
	ldp	x29,x30,[sp],#96
	ret

.Ltail_neon:
	add	x2,x2,#256
	cmp	x2,#64
	b.lo	.Less_than_64

	add	x5,x5,x6,lsl#32	// pack
	add	x7,x7,x8,lsl#32
	ldp	x6,x8,[x1,#0]		// load input
	add	x9,x9,x10,lsl#32
	add	x11,x11,x12,lsl#32
	ldp	x10,x12,[x1,#16]
	add	x13,x13,x14,lsl#32
	add	x15,x15,x16,lsl#32
	ldp	x14,x16,[x1,#32]
	add	x17,x17,x19,lsl#32
	add	x20,x20,x21,lsl#32
	ldp	x19,x21,[x1,#48]
	add	x1,x1,#64
#ifdef	__ARMEB__
	rev	x5,x5
	rev	x7,x7
	rev	x9,x9
	rev	x11,x11
	rev	x13,x13
	rev	x15,x15
	rev	x17,x17
	rev	x20,x20
#endif
	eor	x5,x5,x6
	eor	x7,x7,x8
	eor	x9,x9,x10
	eor	x11,x11,x12
	eor	x13,x13,x14
	eor	x15,x15,x16
	eor	x17,x17,x19
	eor	x20,x20,x21

	stp	x5,x7,[x0,#0]		// store output
	add	x28,x28,#4			// increment counter
	stp	x9,x11,[x0,#16]
	stp	x13,x15,[x0,#32]
	stp	x17,x20,[x0,#48]
	add	x0,x0,#64
	b.eq	.Ldone_neon
	sub	x2,x2,#64
	cmp	x2,#64
	b.lo	.Less_than_128

	ld1	{v20.16b,v21.16b,v22.16b,v23.16b},[x1],#64
	eor	v0.16b,v0.16b,v20.16b
	eor	v1.16b,v1.16b,v21.16b
	eor	v2.16b,v2.16b,v22.16b
	eor	v3.16b,v3.16b,v23.16b
	st1	{v0.16b,v1.16b,v2.16b,v3.16b},[x0],#64
	b.eq	.Ldone_neon
	sub	x2,x2,#64
	cmp	x2,#64
	b.lo	.Less_than_192

	ld1	{v20.16b,v21.16b,v22.16b,v23.16b},[x1],#64
	eor	v4.16b,v4.16b,v20.16b
	eor	v5.16b,v5.16b,v21.16b
	eor	v6.16b,v6.16b,v22.16b
	eor	v7.16b,v7.16b,v23.16b
	st1	{v4.16b,v5.16b,v6.16b,v7.16b},[x0],#64
	b.eq	.Ldone_neon
	sub	x2,x2,#64

	st1	{v16.16b,v17.16b,v18.16b,v19.16b},[sp]
	b	.Last_neon

.Less_than_128:
	st1	{v0.16b,v1.16b,v2.16b,v3.16b},[sp]
	b	.Last_neon
.Less_than_192:
	st1	{v4.16b,v5.16b,v6.16b,v7.16b},[sp]
	b	.Last_neon

.align	4
.Last_neon:
	sub	x0,x0,#1
	add	x1,x1,x2
	add	x0,x0,x2
	add	x4,sp,x2
	neg	x2,x2

.Loop_tail_neon:
	ldrb	w10,[x1,x2]
	ldrb	w11,[x4,x2]
	add	x2,x2,#1
	eor	w10,w10,w11
	strb	w10,[x0,x2]
	cbnz	x2,.Loop_tail_neon

	stp	xzr,xzr,[sp,#0]
	stp	xzr,xzr,[sp,#16]
	stp	xzr,xzr,[sp,#32]
	stp	xzr,xzr,[sp,#48]

.Ldone_neon:
	ldp	x19,x20,[x29,#16]
	add	sp,sp,#64
	ldp	x21,x22,[x29,#32]
	ldp	x23,x24,[x29,#48]
	ldp	x25,x26,[x29,#64]
	ldp	x27,x28,[x29,#80]
	ldp	x29,x30,[sp],#96
	ret
.size	ChaCha20_neon,.-ChaCha20_neon
.type	ChaCha20_512_neon,%function
.align	5
ChaCha20_512_neon:
	stp	x29,x30,[sp,#-96]!
	add	x29,sp,#0

	adr	x5,.Lsigma
	stp	x19,x20,[sp,#16]
	stp	x21,x22,[sp,#32]
	stp	x23,x24,[sp,#48]
	stp	x25,x26,[sp,#64]
	stp	x27,x28,[sp,#80]

.L512_or_more_neon:
	sub	sp,sp,#128+64

	ldp	x22,x23,[x5]		// load sigma
	ld1	{v24.4s},[x5],#16
	ldp	x24,x25,[x3]		// load key
	ldp	x26,x27,[x3,#16]
	ld1	{v25.4s,v26.4s},[x3]
	ldp	x28,x30,[x4]		// load counter
	ld1	{v27.4s},[x4]
	ld1	{v31.4s},[x5]
#ifdef	__ARMEB__
	rev64	v24.4s,v24.4s
	ror	x24,x24,#32
	ror	x25,x25,#32
	ror	x26,x26,#32
	ror	x27,x27,#32
	ror	x28,x28,#32
	ror	x30,x30,#32
#endif
	add	v27.4s,v27.4s,v31.4s		// += 1
	stp	q24,q25,[sp,#0]		// off-load key block, invariant part
	add	v27.4s,v27.4s,v31.4s		// not typo
	str	q26,[sp,#32]
	add	v28.4s,v27.4s,v31.4s
	add	v29.4s,v28.4s,v31.4s
	add	v30.4s,v29.4s,v31.4s
	shl	v31.4s,v31.4s,#2			// 1 -> 4

	stp	d8,d9,[sp,#128+0]		// meet ABI requirements
	stp	d10,d11,[sp,#128+16]
	stp	d12,d13,[sp,#128+32]
	stp	d14,d15,[sp,#128+48]

	sub	x2,x2,#512			// not typo

.Loop_outer_512_neon:
	mov	v0.16b,v24.16b
	mov	v4.16b,v24.16b
	mov	v8.16b,v24.16b
	mov	v12.16b,v24.16b
	mov	v16.16b,v24.16b
	mov	v20.16b,v24.16b
	mov	v1.16b,v25.16b
	mov	w5,w22			// unpack key block
	mov	v5.16b,v25.16b
	lsr	x6,x22,#32
	mov	v9.16b,v25.16b
	mov	w7,w23
	mov	v13.16b,v25.16b
	lsr	x8,x23,#32
	mov	v17.16b,v25.16b
	mov	w9,w24
	mov	v21.16b,v25.16b
	lsr	x10,x24,#32
	mov	v3.16b,v27.16b
	mov	w11,w25
	mov	v7.16b,v28.16b
	lsr	x12,x25,#32
	mov	v11.16b,v29.16b
	mov	w13,w26
	mov	v15.16b,v30.16b
	lsr	x14,x26,#32
	mov	v2.16b,v26.16b
	mov	w15,w27
	mov	v6.16b,v26.16b
	lsr	x16,x27,#32
	add	v19.4s,v3.4s,v31.4s			// +4
	mov	w17,w28
	add	v23.4s,v7.4s,v31.4s			// +4
	lsr	x19,x28,#32
	mov	v10.16b,v26.16b
	mov	w20,w30
	mov	v14.16b,v26.16b
	lsr	x21,x30,#32
	mov	v18.16b,v26.16b
	stp	q27,q28,[sp,#48]		// off-load key block, variable part
	mov	v22.16b,v26.16b
	str	q29,[sp,#80]

	lsr x4,x18,#1          // reload number of rounds / 2
	subs	x2,x2,#512
.Loop_upper_neon:
	sub	x4,x4,#1
	add	v0.4s,v0.4s,v1.4s
	add	w5,w5,w9
	add	v4.4s,v4.4s,v5.4s
	add	w6,w6,w10
	add	v8.4s,v8.4s,v9.4s
	add	w7,w7,w11
	add	v12.4s,v12.4s,v13.4s
	add	w8,w8,w12
	add	v16.4s,v16.4s,v17.4s
	eor	w17,w17,w5
	add	v20.4s,v20.4s,v21.4s
	eor	w19,w19,w6
	eor	v3.16b,v3.16b,v0.16b
	eor	w20,w20,w7
	eor	v7.16b,v7.16b,v4.16b
	eor	w21,w21,w8
	eor	v11.16b,v11.16b,v8.16b
	ror	w17,w17,#16
	eor	v15.16b,v15.16b,v12.16b
	ror	w19,w19,#16
	eor	v19.16b,v19.16b,v16.16b
	ror	w20,w20,#16
	eor	v23.16b,v23.16b,v20.16b
	ror	w21,w21,#16
	rev32	v3.8h,v3.8h
	add	w13,w13,w17
	rev32	v7.8h,v7.8h
	add	w14,w14,w19
	rev32	v11.8h,v11.8h
	add	w15,w15,w20
	rev32	v15.8h,v15.8h
	add	w16,w16,w21
	rev32	v19.8h,v19.8h
	eor	w9,w9,w13
	rev32	v23.8h,v23.8h
	eor	w10,w10,w14
	add	v2.4s,v2.4s,v3.4s
	eor	w11,w11,w15
	add	v6.4s,v6.4s,v7.4s
	eor	w12,w12,w16
	add	v10.4s,v10.4s,v11.4s
	ror	w9,w9,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w10,w10,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w11,w11,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w12,w12,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w9
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w10
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w11
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w12
	eor	v28.16b,v17.16b,v18.16b
	eor	w17,w17,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w19,w19,w6
	ushr	v1.4s,v24.4s,#20
	eor	w20,w20,w7
	ushr	v5.4s,v25.4s,#20
	eor	w21,w21,w8
	ushr	v9.4s,v26.4s,#20
	ror	w17,w17,#24
	ushr	v13.4s,v27.4s,#20
	ror	w19,w19,#24
	ushr	v17.4s,v28.4s,#20
	ror	w20,w20,#24
	ushr	v21.4s,v29.4s,#20
	ror	w21,w21,#24
	sli	v1.4s,v24.4s,#12
	add	w13,w13,w17
	sli	v5.4s,v25.4s,#12
	add	w14,w14,w19
	sli	v9.4s,v26.4s,#12
	add	w15,w15,w20
	sli	v13.4s,v27.4s,#12
	add	w16,w16,w21
	sli	v17.4s,v28.4s,#12
	eor	w9,w9,w13
	sli	v21.4s,v29.4s,#12
	eor	w10,w10,w14
	add	v0.4s,v0.4s,v1.4s
	eor	w11,w11,w15
	add	v4.4s,v4.4s,v5.4s
	eor	w12,w12,w16
	add	v8.4s,v8.4s,v9.4s
	ror	w9,w9,#25
	add	v12.4s,v12.4s,v13.4s
	ror	w10,w10,#25
	add	v16.4s,v16.4s,v17.4s
	ror	w11,w11,#25
	add	v20.4s,v20.4s,v21.4s
	ror	w12,w12,#25
	eor	v24.16b,v3.16b,v0.16b
	add	w5,w5,w10
	eor	v25.16b,v7.16b,v4.16b
	add	w6,w6,w11
	eor	v26.16b,v11.16b,v8.16b
	add	w7,w7,w12
	eor	v27.16b,v15.16b,v12.16b
	add	w8,w8,w9
	eor	v28.16b,v19.16b,v16.16b
	eor	w21,w21,w5
	eor	v29.16b,v23.16b,v20.16b
	eor	w17,w17,w6
	ushr	v3.4s,v24.4s,#24
	eor	w19,w19,w7
	ushr	v7.4s,v25.4s,#24
	eor	w20,w20,w8
	ushr	v11.4s,v26.4s,#24
	ror	w21,w21,#16
	ushr	v15.4s,v27.4s,#24
	ror	w17,w17,#16
	ushr	v19.4s,v28.4s,#24
	ror	w19,w19,#16
	ushr	v23.4s,v29.4s,#24
	ror	w20,w20,#16
	sli	v3.4s,v24.4s,#8
	add	w15,w15,w21
	sli	v7.4s,v25.4s,#8
	add	w16,w16,w17
	sli	v11.4s,v26.4s,#8
	add	w13,w13,w19
	sli	v15.4s,v27.4s,#8
	add	w14,w14,w20
	sli	v19.4s,v28.4s,#8
	eor	w10,w10,w15
	sli	v23.4s,v29.4s,#8
	eor	w11,w11,w16
	add	v2.4s,v2.4s,v3.4s
	eor	w12,w12,w13
	add	v6.4s,v6.4s,v7.4s
	eor	w9,w9,w14
	add	v10.4s,v10.4s,v11.4s
	ror	w10,w10,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w11,w11,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w12,w12,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w9,w9,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w10
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w11
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w12
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w9
	eor	v28.16b,v17.16b,v18.16b
	eor	w21,w21,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w17,w17,w6
	ushr	v1.4s,v24.4s,#25
	eor	w19,w19,w7
	ushr	v5.4s,v25.4s,#25
	eor	w20,w20,w8
	ushr	v9.4s,v26.4s,#25
	ror	w21,w21,#24
	ushr	v13.4s,v27.4s,#25
	ror	w17,w17,#24
	ushr	v17.4s,v28.4s,#25
	ror	w19,w19,#24
	ushr	v21.4s,v29.4s,#25
	ror	w20,w20,#24
	sli	v1.4s,v24.4s,#7
	add	w15,w15,w21
	sli	v5.4s,v25.4s,#7
	add	w16,w16,w17
	sli	v9.4s,v26.4s,#7
	add	w13,w13,w19
	sli	v13.4s,v27.4s,#7
	add	w14,w14,w20
	sli	v17.4s,v28.4s,#7
	eor	w10,w10,w15
	sli	v21.4s,v29.4s,#7
	eor	w11,w11,w16
	ext	v2.16b,v2.16b,v2.16b,#8
	eor	w12,w12,w13
	ext	v6.16b,v6.16b,v6.16b,#8
	eor	w9,w9,w14
	ext	v10.16b,v10.16b,v10.16b,#8
	ror	w10,w10,#25
	ext	v14.16b,v14.16b,v14.16b,#8
	ror	w11,w11,#25
	ext	v18.16b,v18.16b,v18.16b,#8
	ror	w12,w12,#25
	ext	v22.16b,v22.16b,v22.16b,#8
	ror	w9,w9,#25
	ext	v3.16b,v3.16b,v3.16b,#12
	ext	v7.16b,v7.16b,v7.16b,#12
	ext	v11.16b,v11.16b,v11.16b,#12
	ext	v15.16b,v15.16b,v15.16b,#12
	ext	v19.16b,v19.16b,v19.16b,#12
	ext	v23.16b,v23.16b,v23.16b,#12
	ext	v1.16b,v1.16b,v1.16b,#4
	ext	v5.16b,v5.16b,v5.16b,#4
	ext	v9.16b,v9.16b,v9.16b,#4
	ext	v13.16b,v13.16b,v13.16b,#4
	ext	v17.16b,v17.16b,v17.16b,#4
	ext	v21.16b,v21.16b,v21.16b,#4
	add	v0.4s,v0.4s,v1.4s
	add	w5,w5,w9
	add	v4.4s,v4.4s,v5.4s
	add	w6,w6,w10
	add	v8.4s,v8.4s,v9.4s
	add	w7,w7,w11
	add	v12.4s,v12.4s,v13.4s
	add	w8,w8,w12
	add	v16.4s,v16.4s,v17.4s
	eor	w17,w17,w5
	add	v20.4s,v20.4s,v21.4s
	eor	w19,w19,w6
	eor	v3.16b,v3.16b,v0.16b
	eor	w20,w20,w7
	eor	v7.16b,v7.16b,v4.16b
	eor	w21,w21,w8
	eor	v11.16b,v11.16b,v8.16b
	ror	w17,w17,#16
	eor	v15.16b,v15.16b,v12.16b
	ror	w19,w19,#16
	eor	v19.16b,v19.16b,v16.16b
	ror	w20,w20,#16
	eor	v23.16b,v23.16b,v20.16b
	ror	w21,w21,#16
	rev32	v3.8h,v3.8h
	add	w13,w13,w17
	rev32	v7.8h,v7.8h
	add	w14,w14,w19
	rev32	v11.8h,v11.8h
	add	w15,w15,w20
	rev32	v15.8h,v15.8h
	add	w16,w16,w21
	rev32	v19.8h,v19.8h
	eor	w9,w9,w13
	rev32	v23.8h,v23.8h
	eor	w10,w10,w14
	add	v2.4s,v2.4s,v3.4s
	eor	w11,w11,w15
	add	v6.4s,v6.4s,v7.4s
	eor	w12,w12,w16
	add	v10.4s,v10.4s,v11.4s
	ror	w9,w9,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w10,w10,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w11,w11,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w12,w12,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w9
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w10
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w11
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w12
	eor	v28.16b,v17.16b,v18.16b
	eor	w17,w17,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w19,w19,w6
	ushr	v1.4s,v24.4s,#20
	eor	w20,w20,w7
	ushr	v5.4s,v25.4s,#20
	eor	w21,w21,w8
	ushr	v9.4s,v26.4s,#20
	ror	w17,w17,#24
	ushr	v13.4s,v27.4s,#20
	ror	w19,w19,#24
	ushr	v17.4s,v28.4s,#20
	ror	w20,w20,#24
	ushr	v21.4s,v29.4s,#20
	ror	w21,w21,#24
	sli	v1.4s,v24.4s,#12
	add	w13,w13,w17
	sli	v5.4s,v25.4s,#12
	add	w14,w14,w19
	sli	v9.4s,v26.4s,#12
	add	w15,w15,w20
	sli	v13.4s,v27.4s,#12
	add	w16,w16,w21
	sli	v17.4s,v28.4s,#12
	eor	w9,w9,w13
	sli	v21.4s,v29.4s,#12
	eor	w10,w10,w14
	add	v0.4s,v0.4s,v1.4s
	eor	w11,w11,w15
	add	v4.4s,v4.4s,v5.4s
	eor	w12,w12,w16
	add	v8.4s,v8.4s,v9.4s
	ror	w9,w9,#25
	add	v12.4s,v12.4s,v13.4s
	ror	w10,w10,#25
	add	v16.4s,v16.4s,v17.4s
	ror	w11,w11,#25
	add	v20.4s,v20.4s,v21.4s
	ror	w12,w12,#25
	eor	v24.16b,v3.16b,v0.16b
	add	w5,w5,w10
	eor	v25.16b,v7.16b,v4.16b
	add	w6,w6,w11
	eor	v26.16b,v11.16b,v8.16b
	add	w7,w7,w12
	eor	v27.16b,v15.16b,v12.16b
	add	w8,w8,w9
	eor	v28.16b,v19.16b,v16.16b
	eor	w21,w21,w5
	eor	v29.16b,v23.16b,v20.16b
	eor	w17,w17,w6
	ushr	v3.4s,v24.4s,#24
	eor	w19,w19,w7
	ushr	v7.4s,v25.4s,#24
	eor	w20,w20,w8
	ushr	v11.4s,v26.4s,#24
	ror	w21,w21,#16
	ushr	v15.4s,v27.4s,#24
	ror	w17,w17,#16
	ushr	v19.4s,v28.4s,#24
	ror	w19,w19,#16
	ushr	v23.4s,v29.4s,#24
	ror	w20,w20,#16
	sli	v3.4s,v24.4s,#8
	add	w15,w15,w21
	sli	v7.4s,v25.4s,#8
	add	w16,w16,w17
	sli	v11.4s,v26.4s,#8
	add	w13,w13,w19
	sli	v15.4s,v27.4s,#8
	add	w14,w14,w20
	sli	v19.4s,v28.4s,#8
	eor	w10,w10,w15
	sli	v23.4s,v29.4s,#8
	eor	w11,w11,w16
	add	v2.4s,v2.4s,v3.4s
	eor	w12,w12,w13
	add	v6.4s,v6.4s,v7.4s
	eor	w9,w9,w14
	add	v10.4s,v10.4s,v11.4s
	ror	w10,w10,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w11,w11,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w12,w12,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w9,w9,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w10
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w11
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w12
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w9
	eor	v28.16b,v17.16b,v18.16b
	eor	w21,w21,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w17,w17,w6
	ushr	v1.4s,v24.4s,#25
	eor	w19,w19,w7
	ushr	v5.4s,v25.4s,#25
	eor	w20,w20,w8
	ushr	v9.4s,v26.4s,#25
	ror	w21,w21,#24
	ushr	v13.4s,v27.4s,#25
	ror	w17,w17,#24
	ushr	v17.4s,v28.4s,#25
	ror	w19,w19,#24
	ushr	v21.4s,v29.4s,#25
	ror	w20,w20,#24
	sli	v1.4s,v24.4s,#7
	add	w15,w15,w21
	sli	v5.4s,v25.4s,#7
	add	w16,w16,w17
	sli	v9.4s,v26.4s,#7
	add	w13,w13,w19
	sli	v13.4s,v27.4s,#7
	add	w14,w14,w20
	sli	v17.4s,v28.4s,#7
	eor	w10,w10,w15
	sli	v21.4s,v29.4s,#7
	eor	w11,w11,w16
	ext	v2.16b,v2.16b,v2.16b,#8
	eor	w12,w12,w13
	ext	v6.16b,v6.16b,v6.16b,#8
	eor	w9,w9,w14
	ext	v10.16b,v10.16b,v10.16b,#8
	ror	w10,w10,#25
	ext	v14.16b,v14.16b,v14.16b,#8
	ror	w11,w11,#25
	ext	v18.16b,v18.16b,v18.16b,#8
	ror	w12,w12,#25
	ext	v22.16b,v22.16b,v22.16b,#8
	ror	w9,w9,#25
	ext	v3.16b,v3.16b,v3.16b,#4
	ext	v7.16b,v7.16b,v7.16b,#4
	ext	v11.16b,v11.16b,v11.16b,#4
	ext	v15.16b,v15.16b,v15.16b,#4
	ext	v19.16b,v19.16b,v19.16b,#4
	ext	v23.16b,v23.16b,v23.16b,#4
	ext	v1.16b,v1.16b,v1.16b,#12
	ext	v5.16b,v5.16b,v5.16b,#12
	ext	v9.16b,v9.16b,v9.16b,#12
	ext	v13.16b,v13.16b,v13.16b,#12
	ext	v17.16b,v17.16b,v17.16b,#12
	ext	v21.16b,v21.16b,v21.16b,#12
	cbnz	x4,.Loop_upper_neon

	add	w5,w5,w22		// accumulate key block
	add	x6,x6,x22,lsr#32
	add	w7,w7,w23
	add	x8,x8,x23,lsr#32
	add	w9,w9,w24
	add	x10,x10,x24,lsr#32
	add	w11,w11,w25
	add	x12,x12,x25,lsr#32
	add	w13,w13,w26
	add	x14,x14,x26,lsr#32
	add	w15,w15,w27
	add	x16,x16,x27,lsr#32
	add	w17,w17,w28
	add	x19,x19,x28,lsr#32
	add	w20,w20,w30
	add	x21,x21,x30,lsr#32

	add	x5,x5,x6,lsl#32	// pack
	add	x7,x7,x8,lsl#32
	ldp	x6,x8,[x1,#0]		// load input
	add	x9,x9,x10,lsl#32
	add	x11,x11,x12,lsl#32
	ldp	x10,x12,[x1,#16]
	add	x13,x13,x14,lsl#32
	add	x15,x15,x16,lsl#32
	ldp	x14,x16,[x1,#32]
	add	x17,x17,x19,lsl#32
	add	x20,x20,x21,lsl#32
	ldp	x19,x21,[x1,#48]
	add	x1,x1,#64
#ifdef	__ARMEB__
	rev	x5,x5
	rev	x7,x7
	rev	x9,x9
	rev	x11,x11
	rev	x13,x13
	rev	x15,x15
	rev	x17,x17
	rev	x20,x20
#endif
	eor	x5,x5,x6
	eor	x7,x7,x8
	eor	x9,x9,x10
	eor	x11,x11,x12
	eor	x13,x13,x14
	eor	x15,x15,x16
	eor	x17,x17,x19
	eor	x20,x20,x21

	stp	x5,x7,[x0,#0]		// store output
	add	x28,x28,#1			// increment counter
	mov	w5,w22			// unpack key block
	lsr	x6,x22,#32
	stp	x9,x11,[x0,#16]
	mov	w7,w23
	lsr	x8,x23,#32
	stp	x13,x15,[x0,#32]
	mov	w9,w24
	lsr	x10,x24,#32
	stp	x17,x20,[x0,#48]
	add	x0,x0,#64
	mov	w11,w25
	lsr	x12,x25,#32
	mov	w13,w26
	lsr	x14,x26,#32
	mov	w15,w27
	lsr	x16,x27,#32
	mov	w17,w28
	lsr	x19,x28,#32
	mov	w20,w30
	lsr	x21,x30,#32

	lsr x4,x18,#1          // reload number of rounds / 2
.Loop_lower_neon:
	sub	x4,x4,#1
	add	v0.4s,v0.4s,v1.4s
	add	w5,w5,w9
	add	v4.4s,v4.4s,v5.4s
	add	w6,w6,w10
	add	v8.4s,v8.4s,v9.4s
	add	w7,w7,w11
	add	v12.4s,v12.4s,v13.4s
	add	w8,w8,w12
	add	v16.4s,v16.4s,v17.4s
	eor	w17,w17,w5
	add	v20.4s,v20.4s,v21.4s
	eor	w19,w19,w6
	eor	v3.16b,v3.16b,v0.16b
	eor	w20,w20,w7
	eor	v7.16b,v7.16b,v4.16b
	eor	w21,w21,w8
	eor	v11.16b,v11.16b,v8.16b
	ror	w17,w17,#16
	eor	v15.16b,v15.16b,v12.16b
	ror	w19,w19,#16
	eor	v19.16b,v19.16b,v16.16b
	ror	w20,w20,#16
	eor	v23.16b,v23.16b,v20.16b
	ror	w21,w21,#16
	rev32	v3.8h,v3.8h
	add	w13,w13,w17
	rev32	v7.8h,v7.8h
	add	w14,w14,w19
	rev32	v11.8h,v11.8h
	add	w15,w15,w20
	rev32	v15.8h,v15.8h
	add	w16,w16,w21
	rev32	v19.8h,v19.8h
	eor	w9,w9,w13
	rev32	v23.8h,v23.8h
	eor	w10,w10,w14
	add	v2.4s,v2.4s,v3.4s
	eor	w11,w11,w15
	add	v6.4s,v6.4s,v7.4s
	eor	w12,w12,w16
	add	v10.4s,v10.4s,v11.4s
	ror	w9,w9,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w10,w10,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w11,w11,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w12,w12,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w9
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w10
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w11
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w12
	eor	v28.16b,v17.16b,v18.16b
	eor	w17,w17,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w19,w19,w6
	ushr	v1.4s,v24.4s,#20
	eor	w20,w20,w7
	ushr	v5.4s,v25.4s,#20
	eor	w21,w21,w8
	ushr	v9.4s,v26.4s,#20
	ror	w17,w17,#24
	ushr	v13.4s,v27.4s,#20
	ror	w19,w19,#24
	ushr	v17.4s,v28.4s,#20
	ror	w20,w20,#24
	ushr	v21.4s,v29.4s,#20
	ror	w21,w21,#24
	sli	v1.4s,v24.4s,#12
	add	w13,w13,w17
	sli	v5.4s,v25.4s,#12
	add	w14,w14,w19
	sli	v9.4s,v26.4s,#12
	add	w15,w15,w20
	sli	v13.4s,v27.4s,#12
	add	w16,w16,w21
	sli	v17.4s,v28.4s,#12
	eor	w9,w9,w13
	sli	v21.4s,v29.4s,#12
	eor	w10,w10,w14
	add	v0.4s,v0.4s,v1.4s
	eor	w11,w11,w15
	add	v4.4s,v4.4s,v5.4s
	eor	w12,w12,w16
	add	v8.4s,v8.4s,v9.4s
	ror	w9,w9,#25
	add	v12.4s,v12.4s,v13.4s
	ror	w10,w10,#25
	add	v16.4s,v16.4s,v17.4s
	ror	w11,w11,#25
	add	v20.4s,v20.4s,v21.4s
	ror	w12,w12,#25
	eor	v24.16b,v3.16b,v0.16b
	add	w5,w5,w10
	eor	v25.16b,v7.16b,v4.16b
	add	w6,w6,w11
	eor	v26.16b,v11.16b,v8.16b
	add	w7,w7,w12
	eor	v27.16b,v15.16b,v12.16b
	add	w8,w8,w9
	eor	v28.16b,v19.16b,v16.16b
	eor	w21,w21,w5
	eor	v29.16b,v23.16b,v20.16b
	eor	w17,w17,w6
	ushr	v3.4s,v24.4s,#24
	eor	w19,w19,w7
	ushr	v7.4s,v25.4s,#24
	eor	w20,w20,w8
	ushr	v11.4s,v26.4s,#24
	ror	w21,w21,#16
	ushr	v15.4s,v27.4s,#24
	ror	w17,w17,#16
	ushr	v19.4s,v28.4s,#24
	ror	w19,w19,#16
	ushr	v23.4s,v29.4s,#24
	ror	w20,w20,#16
	sli	v3.4s,v24.4s,#8
	add	w15,w15,w21
	sli	v7.4s,v25.4s,#8
	add	w16,w16,w17
	sli	v11.4s,v26.4s,#8
	add	w13,w13,w19
	sli	v15.4s,v27.4s,#8
	add	w14,w14,w20
	sli	v19.4s,v28.4s,#8
	eor	w10,w10,w15
	sli	v23.4s,v29.4s,#8
	eor	w11,w11,w16
	add	v2.4s,v2.4s,v3.4s
	eor	w12,w12,w13
	add	v6.4s,v6.4s,v7.4s
	eor	w9,w9,w14
	add	v10.4s,v10.4s,v11.4s
	ror	w10,w10,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w11,w11,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w12,w12,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w9,w9,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w10
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w11
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w12
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w9
	eor	v28.16b,v17.16b,v18.16b
	eor	w21,w21,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w17,w17,w6
	ushr	v1.4s,v24.4s,#25
	eor	w19,w19,w7
	ushr	v5.4s,v25.4s,#25
	eor	w20,w20,w8
	ushr	v9.4s,v26.4s,#25
	ror	w21,w21,#24
	ushr	v13.4s,v27.4s,#25
	ror	w17,w17,#24
	ushr	v17.4s,v28.4s,#25
	ror	w19,w19,#24
	ushr	v21.4s,v29.4s,#25
	ror	w20,w20,#24
	sli	v1.4s,v24.4s,#7
	add	w15,w15,w21
	sli	v5.4s,v25.4s,#7
	add	w16,w16,w17
	sli	v9.4s,v26.4s,#7
	add	w13,w13,w19
	sli	v13.4s,v27.4s,#7
	add	w14,w14,w20
	sli	v17.4s,v28.4s,#7
	eor	w10,w10,w15
	sli	v21.4s,v29.4s,#7
	eor	w11,w11,w16
	ext	v2.16b,v2.16b,v2.16b,#8
	eor	w12,w12,w13
	ext	v6.16b,v6.16b,v6.16b,#8
	eor	w9,w9,w14
	ext	v10.16b,v10.16b,v10.16b,#8
	ror	w10,w10,#25
	ext	v14.16b,v14.16b,v14.16b,#8
	ror	w11,w11,#25
	ext	v18.16b,v18.16b,v18.16b,#8
	ror	w12,w12,#25
	ext	v22.16b,v22.16b,v22.16b,#8
	ror	w9,w9,#25
	ext	v3.16b,v3.16b,v3.16b,#12
	ext	v7.16b,v7.16b,v7.16b,#12
	ext	v11.16b,v11.16b,v11.16b,#12
	ext	v15.16b,v15.16b,v15.16b,#12
	ext	v19.16b,v19.16b,v19.16b,#12
	ext	v23.16b,v23.16b,v23.16b,#12
	ext	v1.16b,v1.16b,v1.16b,#4
	ext	v5.16b,v5.16b,v5.16b,#4
	ext	v9.16b,v9.16b,v9.16b,#4
	ext	v13.16b,v13.16b,v13.16b,#4
	ext	v17.16b,v17.16b,v17.16b,#4
	ext	v21.16b,v21.16b,v21.16b,#4
	add	v0.4s,v0.4s,v1.4s
	add	w5,w5,w9
	add	v4.4s,v4.4s,v5.4s
	add	w6,w6,w10
	add	v8.4s,v8.4s,v9.4s
	add	w7,w7,w11
	add	v12.4s,v12.4s,v13.4s
	add	w8,w8,w12
	add	v16.4s,v16.4s,v17.4s
	eor	w17,w17,w5
	add	v20.4s,v20.4s,v21.4s
	eor	w19,w19,w6
	eor	v3.16b,v3.16b,v0.16b
	eor	w20,w20,w7
	eor	v7.16b,v7.16b,v4.16b
	eor	w21,w21,w8
	eor	v11.16b,v11.16b,v8.16b
	ror	w17,w17,#16
	eor	v15.16b,v15.16b,v12.16b
	ror	w19,w19,#16
	eor	v19.16b,v19.16b,v16.16b
	ror	w20,w20,#16
	eor	v23.16b,v23.16b,v20.16b
	ror	w21,w21,#16
	rev32	v3.8h,v3.8h
	add	w13,w13,w17
	rev32	v7.8h,v7.8h
	add	w14,w14,w19
	rev32	v11.8h,v11.8h
	add	w15,w15,w20
	rev32	v15.8h,v15.8h
	add	w16,w16,w21
	rev32	v19.8h,v19.8h
	eor	w9,w9,w13
	rev32	v23.8h,v23.8h
	eor	w10,w10,w14
	add	v2.4s,v2.4s,v3.4s
	eor	w11,w11,w15
	add	v6.4s,v6.4s,v7.4s
	eor	w12,w12,w16
	add	v10.4s,v10.4s,v11.4s
	ror	w9,w9,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w10,w10,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w11,w11,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w12,w12,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w9
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w10
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w11
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w12
	eor	v28.16b,v17.16b,v18.16b
	eor	w17,w17,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w19,w19,w6
	ushr	v1.4s,v24.4s,#20
	eor	w20,w20,w7
	ushr	v5.4s,v25.4s,#20
	eor	w21,w21,w8
	ushr	v9.4s,v26.4s,#20
	ror	w17,w17,#24
	ushr	v13.4s,v27.4s,#20
	ror	w19,w19,#24
	ushr	v17.4s,v28.4s,#20
	ror	w20,w20,#24
	ushr	v21.4s,v29.4s,#20
	ror	w21,w21,#24
	sli	v1.4s,v24.4s,#12
	add	w13,w13,w17
	sli	v5.4s,v25.4s,#12
	add	w14,w14,w19
	sli	v9.4s,v26.4s,#12
	add	w15,w15,w20
	sli	v13.4s,v27.4s,#12
	add	w16,w16,w21
	sli	v17.4s,v28.4s,#12
	eor	w9,w9,w13
	sli	v21.4s,v29.4s,#12
	eor	w10,w10,w14
	add	v0.4s,v0.4s,v1.4s
	eor	w11,w11,w15
	add	v4.4s,v4.4s,v5.4s
	eor	w12,w12,w16
	add	v8.4s,v8.4s,v9.4s
	ror	w9,w9,#25
	add	v12.4s,v12.4s,v13.4s
	ror	w10,w10,#25
	add	v16.4s,v16.4s,v17.4s
	ror	w11,w11,#25
	add	v20.4s,v20.4s,v21.4s
	ror	w12,w12,#25
	eor	v24.16b,v3.16b,v0.16b
	add	w5,w5,w10
	eor	v25.16b,v7.16b,v4.16b
	add	w6,w6,w11
	eor	v26.16b,v11.16b,v8.16b
	add	w7,w7,w12
	eor	v27.16b,v15.16b,v12.16b
	add	w8,w8,w9
	eor	v28.16b,v19.16b,v16.16b
	eor	w21,w21,w5
	eor	v29.16b,v23.16b,v20.16b
	eor	w17,w17,w6
	ushr	v3.4s,v24.4s,#24
	eor	w19,w19,w7
	ushr	v7.4s,v25.4s,#24
	eor	w20,w20,w8
	ushr	v11.4s,v26.4s,#24
	ror	w21,w21,#16
	ushr	v15.4s,v27.4s,#24
	ror	w17,w17,#16
	ushr	v19.4s,v28.4s,#24
	ror	w19,w19,#16
	ushr	v23.4s,v29.4s,#24
	ror	w20,w20,#16
	sli	v3.4s,v24.4s,#8
	add	w15,w15,w21
	sli	v7.4s,v25.4s,#8
	add	w16,w16,w17
	sli	v11.4s,v26.4s,#8
	add	w13,w13,w19
	sli	v15.4s,v27.4s,#8
	add	w14,w14,w20
	sli	v19.4s,v28.4s,#8
	eor	w10,w10,w15
	sli	v23.4s,v29.4s,#8
	eor	w11,w11,w16
	add	v2.4s,v2.4s,v3.4s
	eor	w12,w12,w13
	add	v6.4s,v6.4s,v7.4s
	eor	w9,w9,w14
	add	v10.4s,v10.4s,v11.4s
	ror	w10,w10,#20
	add	v14.4s,v14.4s,v15.4s
	ror	w11,w11,#20
	add	v18.4s,v18.4s,v19.4s
	ror	w12,w12,#20
	add	v22.4s,v22.4s,v23.4s
	ror	w9,w9,#20
	eor	v24.16b,v1.16b,v2.16b
	add	w5,w5,w10
	eor	v25.16b,v5.16b,v6.16b
	add	w6,w6,w11
	eor	v26.16b,v9.16b,v10.16b
	add	w7,w7,w12
	eor	v27.16b,v13.16b,v14.16b
	add	w8,w8,w9
	eor	v28.16b,v17.16b,v18.16b
	eor	w21,w21,w5
	eor	v29.16b,v21.16b,v22.16b
	eor	w17,w17,w6
	ushr	v1.4s,v24.4s,#25
	eor	w19,w19,w7
	ushr	v5.4s,v25.4s,#25
	eor	w20,w20,w8
	ushr	v9.4s,v26.4s,#25
	ror	w21,w21,#24
	ushr	v13.4s,v27.4s,#25
	ror	w17,w17,#24
	ushr	v17.4s,v28.4s,#25
	ror	w19,w19,#24
	ushr	v21.4s,v29.4s,#25
	ror	w20,w20,#24
	sli	v1.4s,v24.4s,#7
	add	w15,w15,w21
	sli	v5.4s,v25.4s,#7
	add	w16,w16,w17
	sli	v9.4s,v26.4s,#7
	add	w13,w13,w19
	sli	v13.4s,v27.4s,#7
	add	w14,w14,w20
	sli	v17.4s,v28.4s,#7
	eor	w10,w10,w15
	sli	v21.4s,v29.4s,#7
	eor	w11,w11,w16
	ext	v2.16b,v2.16b,v2.16b,#8
	eor	w12,w12,w13
	ext	v6.16b,v6.16b,v6.16b,#8
	eor	w9,w9,w14
	ext	v10.16b,v10.16b,v10.16b,#8
	ror	w10,w10,#25
	ext	v14.16b,v14.16b,v14.16b,#8
	ror	w11,w11,#25
	ext	v18.16b,v18.16b,v18.16b,#8
	ror	w12,w12,#25
	ext	v22.16b,v22.16b,v22.16b,#8
	ror	w9,w9,#25
	ext	v3.16b,v3.16b,v3.16b,#4
	ext	v7.16b,v7.16b,v7.16b,#4
	ext	v11.16b,v11.16b,v11.16b,#4
	ext	v15.16b,v15.16b,v15.16b,#4
	ext	v19.16b,v19.16b,v19.16b,#4
	ext	v23.16b,v23.16b,v23.16b,#4
	ext	v1.16b,v1.16b,v1.16b,#12
	ext	v5.16b,v5.16b,v5.16b,#12
	ext	v9.16b,v9.16b,v9.16b,#12
	ext	v13.16b,v13.16b,v13.16b,#12
	ext	v17.16b,v17.16b,v17.16b,#12
	ext	v21.16b,v21.16b,v21.16b,#12
	cbnz	x4,.Loop_lower_neon

	add	w5,w5,w22		// accumulate key block
	ldp	q24,q25,[sp,#0]
	add	x6,x6,x22,lsr#32
	ldp	q26,q27,[sp,#32]
	add	w7,w7,w23
	ldp	q28,q29,[sp,#64]
	add	x8,x8,x23,lsr#32
	add	v0.4s,v0.4s,v24.4s
	add	w9,w9,w24
	add	v4.4s,v4.4s,v24.4s
	add	x10,x10,x24,lsr#32
	add	v8.4s,v8.4s,v24.4s
	add	w11,w11,w25
	add	v12.4s,v12.4s,v24.4s
	add	x12,x12,x25,lsr#32
	add	v16.4s,v16.4s,v24.4s
	add	w13,w13,w26
	add	v20.4s,v20.4s,v24.4s
	add	x14,x14,x26,lsr#32
	add	v2.4s,v2.4s,v26.4s
	add	w15,w15,w27
	add	v6.4s,v6.4s,v26.4s
	add	x16,x16,x27,lsr#32
	add	v10.4s,v10.4s,v26.4s
	add	w17,w17,w28
	add	v14.4s,v14.4s,v26.4s
	add	x19,x19,x28,lsr#32
	add	v18.4s,v18.4s,v26.4s
	add	w20,w20,w30
	add	v22.4s,v22.4s,v26.4s
	add	x21,x21,x30,lsr#32
	add	v19.4s,v19.4s,v31.4s			// +4
	add	x5,x5,x6,lsl#32	// pack
	add	v23.4s,v23.4s,v31.4s			// +4
	add	x7,x7,x8,lsl#32
	add	v3.4s,v3.4s,v27.4s
	ldp	x6,x8,[x1,#0]		// load input
	add	v7.4s,v7.4s,v28.4s
	add	x9,x9,x10,lsl#32
	add	v11.4s,v11.4s,v29.4s
	add	x11,x11,x12,lsl#32
	add	v15.4s,v15.4s,v30.4s
	ldp	x10,x12,[x1,#16]
	add	v19.4s,v19.4s,v27.4s
	add	x13,x13,x14,lsl#32
	add	v23.4s,v23.4s,v28.4s
	add	x15,x15,x16,lsl#32
	add	v1.4s,v1.4s,v25.4s
	ldp	x14,x16,[x1,#32]
	add	v5.4s,v5.4s,v25.4s
	add	x17,x17,x19,lsl#32
	add	v9.4s,v9.4s,v25.4s
	add	x20,x20,x21,lsl#32
	add	v13.4s,v13.4s,v25.4s
	ldp	x19,x21,[x1,#48]
	add	v17.4s,v17.4s,v25.4s
	add	x1,x1,#64
	add	v21.4s,v21.4s,v25.4s

#ifdef	__ARMEB__
	rev	x5,x5
	rev	x7,x7
	rev	x9,x9
	rev	x11,x11
	rev	x13,x13
	rev	x15,x15
	rev	x17,x17
	rev	x20,x20
#endif
	ld1	{v24.16b,v25.16b,v26.16b,v27.16b},[x1],#64
	eor	x5,x5,x6
	eor	x7,x7,x8
	eor	x9,x9,x10
	eor	x11,x11,x12
	eor	x13,x13,x14
	eor	v0.16b,v0.16b,v24.16b
	eor	x15,x15,x16
	eor	v1.16b,v1.16b,v25.16b
	eor	x17,x17,x19
	eor	v2.16b,v2.16b,v26.16b
	eor	x20,x20,x21
	eor	v3.16b,v3.16b,v27.16b
	ld1	{v24.16b,v25.16b,v26.16b,v27.16b},[x1],#64

	stp	x5,x7,[x0,#0]		// store output
	add	x28,x28,#7			// increment counter
	stp	x9,x11,[x0,#16]
	stp	x13,x15,[x0,#32]
	stp	x17,x20,[x0,#48]
	add	x0,x0,#64
	st1	{v0.16b,v1.16b,v2.16b,v3.16b},[x0],#64

	ld1	{v0.16b,v1.16b,v2.16b,v3.16b},[x1],#64
	eor	v4.16b,v4.16b,v24.16b
	eor	v5.16b,v5.16b,v25.16b
	eor	v6.16b,v6.16b,v26.16b
	eor	v7.16b,v7.16b,v27.16b
	st1	{v4.16b,v5.16b,v6.16b,v7.16b},[x0],#64

	ld1	{v4.16b,v5.16b,v6.16b,v7.16b},[x1],#64
	eor	v8.16b,v8.16b,v0.16b
	ldp	q24,q25,[sp,#0]
	eor	v9.16b,v9.16b,v1.16b
	ldp	q26,q27,[sp,#32]
	eor	v10.16b,v10.16b,v2.16b
	eor	v11.16b,v11.16b,v3.16b
	st1	{v8.16b,v9.16b,v10.16b,v11.16b},[x0],#64

	ld1	{v8.16b,v9.16b,v10.16b,v11.16b},[x1],#64
	eor	v12.16b,v12.16b,v4.16b
	eor	v13.16b,v13.16b,v5.16b
	eor	v14.16b,v14.16b,v6.16b
	eor	v15.16b,v15.16b,v7.16b
	st1	{v12.16b,v13.16b,v14.16b,v15.16b},[x0],#64

	ld1	{v12.16b,v13.16b,v14.16b,v15.16b},[x1],#64
	eor	v16.16b,v16.16b,v8.16b
	eor	v17.16b,v17.16b,v9.16b
	eor	v18.16b,v18.16b,v10.16b
	eor	v19.16b,v19.16b,v11.16b
	st1	{v16.16b,v17.16b,v18.16b,v19.16b},[x0],#64

	shl	v0.4s,v31.4s,#1			// 4 -> 8
	eor	v20.16b,v20.16b,v12.16b
	eor	v21.16b,v21.16b,v13.16b
	eor	v22.16b,v22.16b,v14.16b
	eor	v23.16b,v23.16b,v15.16b
	st1	{v20.16b,v21.16b,v22.16b,v23.16b},[x0],#64

	add	v27.4s,v27.4s,v0.4s			// += 8
	add	v28.4s,v28.4s,v0.4s
	add	v29.4s,v29.4s,v0.4s
	add	v30.4s,v30.4s,v0.4s

	b.hs	.Loop_outer_512_neon

	adds	x2,x2,#512
	ushr	v0.4s,v31.4s,#2			// 4 -> 1

	ldp	d8,d9,[sp,#128+0]		// meet ABI requirements
	ldp	d10,d11,[sp,#128+16]
	ldp	d12,d13,[sp,#128+32]
	ldp	d14,d15,[sp,#128+48]

	stp	q24,q31,[sp,#0]		// wipe off-load area
	stp	q24,q31,[sp,#32]
	stp	q24,q31,[sp,#64]

	b.eq	.Ldone_512_neon

	cmp	x2,#192
	sub	v27.4s,v27.4s,v0.4s			// -= 1
	sub	v28.4s,v28.4s,v0.4s
	sub	v29.4s,v29.4s,v0.4s
	add	sp,sp,#128
	b.hs	.Loop_outer_neon

	eor	v25.16b,v25.16b,v25.16b
	eor	v26.16b,v26.16b,v26.16b
	eor	v27.16b,v27.16b,v27.16b
	eor	v28.16b,v28.16b,v28.16b
	eor	v29.16b,v29.16b,v29.16b
	eor	v30.16b,v30.16b,v30.16b
	b	.Loop_outer

.Ldone_512_neon:
	ldp	x19,x20,[x29,#16]
	add	sp,sp,#128+64
	ldp	x21,x22,[x29,#32]
	ldp	x23,x24,[x29,#48]
	ldp	x25,x26,[x29,#64]
	ldp	x27,x28,[x29,#80]
	ldp	x29,x30,[sp],#96
	ret
.size	ChaCha20_512_neon,.-ChaCha20_512_neon

/* ========================================================================= */
#elif __ARM_NEON__ || __ARM_NEON
/* ========================================================================= */

.arch armv7-a
.fpu neon

.text

.align 2
.global chacha_blocks
chacha_blocks:
tst r3, r3
beq .Lchacha_blocks_neon_nobytes
vstmdb sp!, {q4,q5,q6,q7}
stmfd sp!, {r4-r12, r14}
mov r8, sp
sub sp, sp, #196
bic sp, sp, #31
str r0, [sp, #60]
str r1, [sp, #48]
str r2, [sp, #40]
str r3, [sp, #52]
str r8, [sp, #192]
add r1, sp, #64
ldr r4, =0x61707865
ldr r5, =0x3320646e
ldr r6, =0x79622d32
ldr r7, =0x6b206574
ldmia r0!, {r8-r11}
stmia r1!, {r4-r11}
ldmia r0!, {r4-r11}
stmia r1!, {r4-r11}
ldr r4, [r0]
str r4, [sp, #44]
cmp r3, #256
blo .Lchacha_blocks_neon_mainloop2
.Lchacha_blocks_neon_mainloop1:
ldr r0, [sp, #44]
str r0, [sp, #0]
add r1, sp, #(64)
mov r2, #1
veor q12, q12
vld1.32 {q0,q1}, [r1,:128]!
vld1.32 {q2,q3}, [r1,:128]
vmov.32 d24[0], r2
vadd.u64 q3, q3, q12
vmov q4, q0
vmov q5, q1
vmov q6, q2
vadd.u64 q7, q3, q12
vmov q8, q0
vmov q9, q1
vmov q10, q2
vadd.u64 q11, q7, q12
add r0, sp, #64
ldm r0, {r0-r12}
ldr r14, [sp, #(64 +60)]
str r6, [sp, #8]
str r11, [sp, #12]
str r14, [sp, #28]
ldr r11, [sp, #(64 +52)]
ldr r14, [sp, #(64 +56)]
.Lchacha_blocks_neon_rounds1:
ldr r6, [sp, #0]
vadd.i32 q0, q0, q1
add r0, r0, r4
vadd.i32 q4, q4, q5
add r1, r1, r5
vadd.i32 q8, q8, q9
eor r12, r12, r0
veor q12, q3, q0
eor r11, r11, r1
veor q13, q7, q4
ror r12, r12, #16
veor q14, q11, q8
ror r11, r11, #16
vrev32.16 q3, q12
subs r6, r6, #2
vrev32.16 q7, q13
add r8, r8, r12
vrev32.16 q11, q14
add r9, r9, r11
vadd.i32 q2, q2, q3
eor r4, r4, r8
vadd.i32 q6, q6, q7
eor r5, r5, r9
vadd.i32 q10, q10, q11
str r6, [sp, #0]
veor q12, q1, q2
ror r4, r4, #20
veor q13, q5, q6
ror r5, r5, #20
veor q14, q9, q10
add r0, r0, r4
vshl.i32 q1, q12, #12
add r1, r1, r5
vshl.i32 q5, q13, #12
ldr r6, [sp, #8]
vshl.i32 q9, q14, #12
eor r12, r12, r0
vsri.u32 q1, q12, #20
eor r11, r11, r1
vsri.u32 q5, q13, #20
ror r12, r12, #24
vsri.u32 q9, q14, #20
ror r11, r11, #24
vadd.i32 q0, q0, q1
add r8, r8, r12
vadd.i32 q4, q4, q5
add r9, r9, r11
vadd.i32 q8, q8, q9
eor r4, r4, r8
veor q12, q3, q0
eor r5, r5, r9
veor q13, q7, q4
str r11, [sp, #20]
veor q14, q11, q8
ror r4, r4, #25
vshl.i32 q3, q12, #8
ror r5, r5, #25
vshl.i32 q7, q13, #8
str r4, [sp, #4]
vshl.i32 q11, q14, #8
ldr r4, [sp, #28]
vsri.u32 q3, q12, #24
add r2, r2, r6
vsri.u32 q7, q13, #24
add r3, r3, r7
vsri.u32 q11, q14, #24
ldr r11, [sp, #12]
vadd.i32 q2, q2, q3
eor r14, r14, r2
vadd.i32 q6, q6, q7
eor r4, r4, r3
vadd.i32 q10, q10, q11
ror r14, r14, #16
veor q12, q1, q2
ror r4, r4, #16
veor q13, q5, q6
add r10, r10, r14
veor q14, q9, q10
add r11, r11, r4
vshl.i32 q1, q12, #7
eor r6, r6, r10
vshl.i32 q5, q13, #7
eor r7, r7, r11
vshl.i32 q9, q14, #7
ror r6, r6, #20
vsri.u32 q1, q12, #25
ror r7, r7, #20
vsri.u32 q5, q13, #25
add r2, r2, r6
vsri.u32 q9, q14, #25
add r3, r3, r7
vext.32 q3, q3, q3, #3
eor r14, r14, r2
vext.32 q7, q7, q7, #3
eor r4, r4, r3
vext.32 q11, q11, q11, #3
ror r14, r14, #24
vext.32 q1, q1, q1, #1
ror r4, r4, #24
vext.32 q5, q5, q5, #1
add r10, r10, r14
vext.32 q9, q9, q9, #1
add r11, r11, r4
vext.32 q2, q2, q2, #2
eor r6, r6, r10
vext.32 q6, q6, q6, #2
eor r7, r7, r11
vext.32 q10, q10, q10, #2
ror r6, r6, #25
vadd.i32 q0, q0, q1
ror r7, r7, #25
vadd.i32 q4, q4, q5
add r0, r0, r5
vadd.i32 q8, q8, q9
add r1, r1, r6
veor q12, q3, q0
eor r4, r4, r0
veor q13, q7, q4
eor r12, r12, r1
veor q14, q11, q8
ror r4, r4, #16
vrev32.16 q3, q12
ror r12, r12, #16
vrev32.16 q7, q13
add r10, r10, r4
vrev32.16 q11, q14
add r11, r11, r12
vadd.i32 q2, q2, q3
eor r5, r5, r10
vadd.i32 q6, q6, q7
eor r6, r6, r11
vadd.i32 q10, q10, q11
ror r5, r5, #20
veor q12, q1, q2
ror r6, r6, #20
veor q13, q5, q6
add r0, r0, r5
veor q14, q9, q10
add r1, r1, r6
vshl.i32 q1, q12, #12
eor r4, r4, r0
vshl.i32 q5, q13, #12
eor r12, r12, r1
vshl.i32 q9, q14, #12
ror r4, r4, #24
vsri.u32 q1, q12, #20
ror r12, r12, #24
vsri.u32 q5, q13, #20
add r10, r10, r4
vsri.u32 q9, q14, #20
add r11, r11, r12
vadd.i32 q0, q0, q1
eor r5, r5, r10
vadd.i32 q4, q4, q5
eor r6, r6, r11
vadd.i32 q8, q8, q9
str r11, [sp, #12]
veor q12, q3, q0
ror r5, r5, #25
veor q13, q7, q4
ror r6, r6, #25
veor q14, q11, q8
str r4, [sp, #28]
vshl.i32 q3, q12, #8
ldr r4, [sp, #4]
vshl.i32 q7, q13, #8
add r2, r2, r7
vshl.i32 q11, q14, #8
add r3, r3, r4
vsri.u32 q3, q12, #24
ldr r11, [sp, #20]
vsri.u32 q7, q13, #24
eor r11, r11, r2
vsri.u32 q11, q14, #24
eor r14, r14, r3
vadd.i32 q2, q2, q3
ror r11, r11, #16
vadd.i32 q6, q6, q7
ror r14, r14, #16
vadd.i32 q10, q10, q11
add r8, r8, r11
veor q12, q1, q2
add r9, r9, r14
veor q13, q5, q6
eor r7, r7, r8
veor q14, q9, q10
eor r4, r4, r9
vshl.i32 q1, q12, #7
ror r7, r7, #20
vshl.i32 q5, q13, #7
ror r4, r4, #20
vshl.i32 q9, q14, #7
str r6, [sp, #8]
vsri.u32 q1, q12, #25
add r2, r2, r7
vsri.u32 q5, q13, #25
add r3, r3, r4
vsri.u32 q9, q14, #25
eor r11, r11, r2
vext.32 q3, q3, q3, #1
eor r14, r14, r3
vext.32 q7, q7, q7, #1
ror r11, r11, #24
vext.32 q11, q11, q11, #1
ror r14, r14, #24
vext.32 q1, q1, q1, #3
add r8, r8, r11
vext.32 q5, q5, q5, #3
add r9, r9, r14
vext.32 q9, q9, q9, #3
eor r7, r7, r8
vext.32 q2, q2, q2, #2
eor r4, r4, r9
vext.32 q6, q6, q6, #2
ror r7, r7, #25
vext.32 q10, q10, q10, #2
ror r4, r4, #25
bne .Lchacha_blocks_neon_rounds1
str r8, [sp, #0]
str r9, [sp, #4]
str r10, [sp, #8]
str r12, [sp, #16]
str r11, [sp, #20]
str r14, [sp, #24]
add r9, sp, #64
vld1.32 {q12,q13}, [r9,:128]!
ldr r12, [sp, #48]
vld1.32 {q14,q15}, [r9,:128]
ldr r14, [sp, #40]
vadd.i32 q0, q0, q12
ldr r8, [sp, #(64 +0)]
vadd.i32 q4, q4, q12
ldr r9, [sp, #(64 +4)]
vadd.i32 q8, q8, q12
ldr r10, [sp, #(64 +8)]
vadd.i32 q1, q1, q13
ldr r11, [sp, #(64 +12)]
vadd.i32 q5, q5, q13
add r0, r0, r8
vadd.i32 q9, q9, q13
add r1, r1, r9
vadd.i32 q2, q2, q14
add r2, r2, r10
vadd.i32 q6, q6, q14
ldr r8, [sp, #(64 +16)]
vadd.i32 q10, q10, q14
add r3, r3, r11
veor q14, q14, q14
ldr r9, [sp, #(64 +20)]
mov r11, #1
add r4, r4, r8
vmov.32 d28[0], r11
ldr r10, [sp, #(64 +24)]
vadd.u64 q12, q14, q15
add r5, r5, r9
vadd.u64 q13, q14, q12
ldr r11, [sp, #(64 +28)]
vadd.u64 q14, q14, q13
add r6, r6, r10
vadd.i32 q3, q3, q12
tst r12, r12
vadd.i32 q7, q7, q13
add r7, r7, r11
vadd.i32 q11, q11, q14
beq .Lchacha_blocks_neon_nomessage11
ldmia r12!, {r8-r11}
eor r0, r0, r8
eor r1, r1, r9
eor r2, r2, r10
ldr r8, [r12, #0]
eor r3, r3, r11
ldr r9, [r12, #4]
eor r4, r4, r8
ldr r10, [r12, #8]
eor r5, r5, r9
ldr r11, [r12, #12]
eor r6, r6, r10
add r12, r12, #16
eor r7, r7, r11
.Lchacha_blocks_neon_nomessage11:
stmia r14!, {r0-r7}
ldm sp, {r0-r7}
ldr r8, [sp, #(64 +32)]
ldr r9, [sp, #(64 +36)]
ldr r10, [sp, #(64 +40)]
ldr r11, [sp, #(64 +44)]
add r0, r0, r8
add r1, r1, r9
add r2, r2, r10
ldr r8, [sp, #(64 +48)]
add r3, r3, r11
ldr r9, [sp, #(64 +52)]
add r4, r4, r8
ldr r10, [sp, #(64 +56)]
add r5, r5, r9
ldr r11, [sp, #(64 +60)]
add r6, r6, r10
adds r8, r8, #4
add r7, r7, r11
adc r9, r9, #0
str r8, [sp, #(64 +48)]
tst r12, r12
str r9, [sp, #(64 +52)]
beq .Lchacha_blocks_neon_nomessage12
ldmia r12!, {r8-r11}
eor r0, r0, r8
eor r1, r1, r9
eor r2, r2, r10
ldr r8, [r12, #0]
eor r3, r3, r11
ldr r9, [r12, #4]
eor r4, r4, r8
ldr r10, [r12, #8]
eor r5, r5, r9
ldr r11, [r12, #12]
eor r6, r6, r10
add r12, r12, #16
eor r7, r7, r11
.Lchacha_blocks_neon_nomessage12:
stmia r14!, {r0-r7}
beq .Lchacha_blocks_neon_nomessage13
vld1.32 {q12,q13}, [r12]!
vld1.32 {q14,q15}, [r12]!
veor q0, q0, q12
veor q1, q1, q13
veor q2, q2, q14
veor q3, q3, q15
.Lchacha_blocks_neon_nomessage13:
vst1.32 {q0,q1}, [r14]!
vst1.32 {q2,q3}, [r14]!
beq .Lchacha_blocks_neon_nomessage14
vld1.32 {q12,q13}, [r12]!
vld1.32 {q14,q15}, [r12]!
veor q4, q4, q12
veor q5, q5, q13
veor q6, q6, q14
veor q7, q7, q15
.Lchacha_blocks_neon_nomessage14:
vst1.32 {q4,q5}, [r14]!
vst1.32 {q6,q7}, [r14]!
beq .Lchacha_blocks_neon_nomessage15
vld1.32 {q12,q13}, [r12]!
vld1.32 {q14,q15}, [r12]!
veor q8, q8, q12
veor q9, q9, q13
veor q10, q10, q14
veor q11, q11, q15
.Lchacha_blocks_neon_nomessage15:
vst1.32 {q8,q9}, [r14]!
vst1.32 {q10,q11}, [r14]!
str r12, [sp, #48]
str r14, [sp, #40]
ldr r3, [sp, #52]
sub r3, r3, #256
cmp r3, #256
str r3, [sp, #52]
bhs .Lchacha_blocks_neon_mainloop1
tst r3, r3
beq .Lchacha_blocks_neon_done
.Lchacha_blocks_neon_mainloop2:
ldr r3, [sp, #52]
ldr r1, [sp, #48]
cmp r3, #64
bhs .Lchacha_blocks_neon_noswap1
add r4, sp, #128
mov r5, r4
tst r1, r1
beq .Lchacha_blocks_neon_nocopy1
.Lchacha_blocks_neon_copyinput1:
subs r3, r3, #1
ldrb r0, [r1], #1
strb r0, [r4], #1
bne .Lchacha_blocks_neon_copyinput1
str r5, [sp, #48]
.Lchacha_blocks_neon_nocopy1:
ldr r4, [sp, #40]
str r5, [sp, #40]
str r4, [sp, #56]
.Lchacha_blocks_neon_noswap1:
ldr r0, [sp, #44]
str r0, [sp, #0]
add r0, sp, #64
ldm r0, {r0-r12}
ldr r14, [sp, #(64 +60)]
str r6, [sp, #8]
str r11, [sp, #12]
str r14, [sp, #28]
ldr r11, [sp, #(64 +52)]
ldr r14, [sp, #(64 +56)]
.Lchacha_blocks_neon_rounds2:
ldr r6, [sp, #0]
add r0, r0, r4
add r1, r1, r5
eor r12, r12, r0
eor r11, r11, r1
ror r12, r12, #16
ror r11, r11, #16
subs r6, r6, #2
add r8, r8, r12
add r9, r9, r11
eor r4, r4, r8
eor r5, r5, r9
str r6, [sp, #0]
ror r4, r4, #20
ror r5, r5, #20
add r0, r0, r4
add r1, r1, r5
ldr r6, [sp, #8]
eor r12, r12, r0
eor r11, r11, r1
ror r12, r12, #24
ror r11, r11, #24
add r8, r8, r12
add r9, r9, r11
eor r4, r4, r8
eor r5, r5, r9
str r11, [sp, #20]
ror r4, r4, #25
ror r5, r5, #25
str r4, [sp, #4]
ldr r4, [sp, #28]
add r2, r2, r6
add r3, r3, r7
ldr r11, [sp, #12]
eor r14, r14, r2
eor r4, r4, r3
ror r14, r14, #16
ror r4, r4, #16
add r10, r10, r14
add r11, r11, r4
eor r6, r6, r10
eor r7, r7, r11
ror r6, r6, #20
ror r7, r7, #20
add r2, r2, r6
add r3, r3, r7
eor r14, r14, r2
eor r4, r4, r3
ror r14, r14, #24
ror r4, r4, #24
add r10, r10, r14
add r11, r11, r4
eor r6, r6, r10
eor r7, r7, r11
ror r6, r6, #25
ror r7, r7, #25
add r0, r0, r5
add r1, r1, r6
eor r4, r4, r0
eor r12, r12, r1
ror r4, r4, #16
ror r12, r12, #16
add r10, r10, r4
add r11, r11, r12
eor r5, r5, r10
eor r6, r6, r11
ror r5, r5, #20
ror r6, r6, #20
add r0, r0, r5
add r1, r1, r6
eor r4, r4, r0
eor r12, r12, r1
ror r4, r4, #24
ror r12, r12, #24
add r10, r10, r4
add r11, r11, r12
eor r5, r5, r10
eor r6, r6, r11
str r11, [sp, #12]
ror r5, r5, #25
ror r6, r6, #25
str r4, [sp, #28]
ldr r4, [sp, #4]
add r2, r2, r7
add r3, r3, r4
ldr r11, [sp, #20]
eor r11, r11, r2
eor r14, r14, r3
ror r11, r11, #16
ror r14, r14, #16
add r8, r8, r11
add r9, r9, r14
eor r7, r7, r8
eor r4, r4, r9
ror r7, r7, #20
ror r4, r4, #20
str r6, [sp, #8]
add r2, r2, r7
add r3, r3, r4
eor r11, r11, r2
eor r14, r14, r3
ror r11, r11, #24
ror r14, r14, #24
add r8, r8, r11
add r9, r9, r14
eor r7, r7, r8
eor r4, r4, r9
ror r7, r7, #25
ror r4, r4, #25
bne .Lchacha_blocks_neon_rounds2
str r8, [sp, #0]
str r9, [sp, #4]
str r10, [sp, #8]
str r12, [sp, #16]
str r11, [sp, #20]
str r14, [sp, #24]
ldr r12, [sp, #48]
ldr r14, [sp, #40]
ldr r8, [sp, #(64 +0)]
ldr r9, [sp, #(64 +4)]
ldr r10, [sp, #(64 +8)]
ldr r11, [sp, #(64 +12)]
add r0, r0, r8
add r1, r1, r9
add r2, r2, r10
ldr r8, [sp, #(64 +16)]
add r3, r3, r11
ldr r9, [sp, #(64 +20)]
add r4, r4, r8
ldr r10, [sp, #(64 +24)]
add r5, r5, r9
ldr r11, [sp, #(64 +28)]
add r6, r6, r10
tst r12, r12
add r7, r7, r11
beq .Lchacha_blocks_neon_nomessage21
ldmia r12!, {r8-r11}
eor r0, r0, r8
eor r1, r1, r9
eor r2, r2, r10
ldr r8, [r12, #0]
eor r3, r3, r11
ldr r9, [r12, #4]
eor r4, r4, r8
ldr r10, [r12, #8]
eor r5, r5, r9
ldr r11, [r12, #12]
eor r6, r6, r10
add r12, r12, #16
eor r7, r7, r11
.Lchacha_blocks_neon_nomessage21:
stmia r14!, {r0-r7}
ldm sp, {r0-r7}
ldr r8, [sp, #(64 +32)]
ldr r9, [sp, #(64 +36)]
ldr r10, [sp, #(64 +40)]
ldr r11, [sp, #(64 +44)]
add r0, r0, r8
add r1, r1, r9
add r2, r2, r10
ldr r8, [sp, #(64 +48)]
add r3, r3, r11
ldr r9, [sp, #(64 +52)]
add r4, r4, r8
ldr r10, [sp, #(64 +56)]
add r5, r5, r9
ldr r11, [sp, #(64 +60)]
add r6, r6, r10
adds r8, r8, #1
add r7, r7, r11
adc r9, r9, #0
str r8, [sp, #(64 +48)]
tst r12, r12
str r9, [sp, #(64 +52)]
beq .Lchacha_blocks_neon_nomessage22
ldmia r12!, {r8-r11}
eor r0, r0, r8
eor r1, r1, r9
eor r2, r2, r10
ldr r8, [r12, #0]
eor r3, r3, r11
ldr r9, [r12, #4]
eor r4, r4, r8
ldr r10, [r12, #8]
eor r5, r5, r9
ldr r11, [r12, #12]
eor r6, r6, r10
add r12, r12, #16
eor r7, r7, r11
.Lchacha_blocks_neon_nomessage22:
stmia r14!, {r0-r7}
str r12, [sp, #48]
str r14, [sp, #40]
ldr r3, [sp, #52]
cmp r3, #64
sub r4, r3, #64
str r4, [sp, #52]
bhi .Lchacha_blocks_neon_mainloop2
cmp r3, #64
beq .Lchacha_blocks_neon_nocopy2
ldr r1, [sp, #56]
sub r14, r14, #64
.Lchacha_blocks_neon_copyinput2:
subs r3, r3, #1
ldrb r0, [r14], #1
strb r0, [r1], #1
bne .Lchacha_blocks_neon_copyinput2
.Lchacha_blocks_neon_nocopy2:
.Lchacha_blocks_neon_done:
ldr r7, [sp, #60]
ldr r8, [sp, #(64 +48)]
ldr r9, [sp, #(64 +52)]
str r8, [r7, #32]
str r9, [r7, #36]
mov r12, sp
stmia r12!, {r0-r7}
add r12, r12, #48
stmia r12!, {r0-r7}
ldr sp, [sp, #192]
ldmfd sp!, {r4-r12, r14}
vldm sp!, {q4-q7}
.Lchacha_blocks_neon_nobytes:
bx lr

.ltorg

/* ========================================================================= */
#elif __ARM_ARCH >= 5
/* ========================================================================= */

.arch armv5

.text

.align 2
.global chacha_blocks
chacha_blocks:
tst r3, r3
beq .Lchacha_blocks_armv6_nobytes
stmfd sp!, {r4-r12, r14}
sub sp, sp, #192
str r0, [sp, #60]
str r1, [sp, #48]
str r2, [sp, #40]
str r3, [sp, #52]
add r1, sp, #64
ldr r4, =0x61707865
ldr r5, =0x3320646e
ldr r6, =0x79622d32
ldr r7, =0x6b206574
ldmia r0!, {r8-r11}
stmia r1!, {r4-r11}
ldmia r0!, {r4-r11}
stmia r1!, {r4-r11}
ldr r4, [r0]
str r4, [sp, #44]
.Lchacha_blocks_armv6_mainloop:
ldr r3, [sp, #52]
ldr r1, [sp, #48]
cmp r3, #64
bhs .Lchacha_blocks_armv6_noswap1
add r4, sp, #128
mov r5, r4
tst r1, r1
beq .Lchacha_blocks_armv6_nocopy1
.Lchacha_blocks_armv6_copyinput1:
subs r3, r3, #1
ldrb r0, [r1], #1
strb r0, [r4], #1
bne .Lchacha_blocks_armv6_copyinput1
str r5, [sp, #48]
.Lchacha_blocks_armv6_nocopy1:
ldr r4, [sp, #40]
str r5, [sp, #40]
str r4, [sp, #56]
.Lchacha_blocks_armv6_noswap1:
ldr r0, [sp, #44]
str r0, [sp, #0]
add r0, sp, #64
ldm r0, {r0-r12}
ldr r14, [sp, #(64 +60)]
str r6, [sp, #8]
str r11, [sp, #12]
str r14, [sp, #28]
ldr r11, [sp, #(64 +52)]
ldr r14, [sp, #(64 +56)]
.Lchacha_blocks_armv6_rounds:
ldr r6, [sp, #0]
add r0, r0, r4
add r1, r1, r5
eor r12, r12, r0
eor r11, r11, r1
ror r12, r12, #16
ror r11, r11, #16
subs r6, r6, #2
add r8, r8, r12
add r9, r9, r11
eor r4, r4, r8
eor r5, r5, r9
str r6, [sp, #0]
ror r4, r4, #20
ror r5, r5, #20
add r0, r0, r4
add r1, r1, r5
ldr r6, [sp, #8]
eor r12, r12, r0
eor r11, r11, r1
ror r12, r12, #24
ror r11, r11, #24
add r8, r8, r12
add r9, r9, r11
eor r4, r4, r8
eor r5, r5, r9
str r11, [sp, #20]
ror r4, r4, #25
ror r5, r5, #25
str r4, [sp, #4]
ldr r4, [sp, #28]
add r2, r2, r6
add r3, r3, r7
ldr r11, [sp, #12]
eor r14, r14, r2
eor r4, r4, r3
ror r14, r14, #16
ror r4, r4, #16
add r10, r10, r14
add r11, r11, r4
eor r6, r6, r10
eor r7, r7, r11
ror r6, r6, #20
ror r7, r7, #20
add r2, r2, r6
add r3, r3, r7
eor r14, r14, r2
eor r4, r4, r3
ror r14, r14, #24
ror r4, r4, #24
add r10, r10, r14
add r11, r11, r4
eor r6, r6, r10
eor r7, r7, r11
ror r6, r6, #25
ror r7, r7, #25
add r0, r0, r5
add r1, r1, r6
eor r4, r4, r0
eor r12, r12, r1
ror r4, r4, #16
ror r12, r12, #16
add r10, r10, r4
add r11, r11, r12
eor r5, r5, r10
eor r6, r6, r11
ror r5, r5, #20
ror r6, r6, #20
add r0, r0, r5
add r1, r1, r6
eor r4, r4, r0
eor r12, r12, r1
ror r4, r4, #24
ror r12, r12, #24
add r10, r10, r4
add r11, r11, r12
eor r5, r5, r10
eor r6, r6, r11
str r11, [sp, #12]
ror r5, r5, #25
ror r6, r6, #25
str r4, [sp, #28]
ldr r4, [sp, #4]
add r2, r2, r7
add r3, r3, r4
ldr r11, [sp, #20]
eor r11, r11, r2
eor r14, r14, r3
ror r11, r11, #16
ror r14, r14, #16
add r8, r8, r11
add r9, r9, r14
eor r7, r7, r8
eor r4, r4, r9
ror r7, r7, #20
ror r4, r4, #20
str r6, [sp, #8]
add r2, r2, r7
add r3, r3, r4
eor r11, r11, r2
eor r14, r14, r3
ror r11, r11, #24
ror r14, r14, #24
add r8, r8, r11
add r9, r9, r14
eor r7, r7, r8
eor r4, r4, r9
ror r7, r7, #25
ror r4, r4, #25
bne .Lchacha_blocks_armv6_rounds
str r8, [sp, #0]
str r9, [sp, #4]
str r10, [sp, #8]
str r12, [sp, #16]
str r11, [sp, #20]
str r14, [sp, #24]
ldr r12, [sp, #48]
ldr r14, [sp, #40]
ldr r8, [sp, #(64 +0)]
ldr r9, [sp, #(64 +4)]
ldr r10, [sp, #(64 +8)]
ldr r11, [sp, #(64 +12)]
add r0, r0, r8
add r1, r1, r9
add r2, r2, r10
ldr r8, [sp, #(64 +16)]
add r3, r3, r11
ldr r9, [sp, #(64 +20)]
add r4, r4, r8
ldr r10, [sp, #(64 +24)]
add r5, r5, r9
ldr r11, [sp, #(64 +28)]
add r6, r6, r10
tst r12, r12
add r7, r7, r11
beq .Lchacha_blocks_armv6_nomessage1
ldmia r12!, {r8-r11}
eor r0, r0, r8
eor r1, r1, r9
eor r2, r2, r10
ldr r8, [r12, #0]
eor r3, r3, r11
ldr r9, [r12, #4]
eor r4, r4, r8
ldr r10, [r12, #8]
eor r5, r5, r9
ldr r11, [r12, #12]
eor r6, r6, r10
add r12, r12, #16
eor r7, r7, r11
.Lchacha_blocks_armv6_nomessage1:
stmia r14!, {r0-r7}
ldm sp, {r0-r7}
ldr r8, [sp, #(64 +32)]
ldr r9, [sp, #(64 +36)]
ldr r10, [sp, #(64 +40)]
ldr r11, [sp, #(64 +44)]
add r0, r0, r8
add r1, r1, r9
add r2, r2, r10
ldr r8, [sp, #(64 +48)]
add r3, r3, r11
ldr r9, [sp, #(64 +52)]
add r4, r4, r8
ldr r10, [sp, #(64 +56)]
add r5, r5, r9
ldr r11, [sp, #(64 +60)]
add r6, r6, r10
adds r8, r8, #1
add r7, r7, r11
adc r9, r9, #0
tst r12, r12
str r8, [sp, #(64 +48)]
str r9, [sp, #(64 +52)]
beq .Lchacha_blocks_armv6_nomessage2
ldmia r12!, {r8-r11}
eor r0, r0, r8
eor r1, r1, r9
eor r2, r2, r10
ldr r8, [r12, #0]
eor r3, r3, r11
ldr r9, [r12, #4]
eor r4, r4, r8
ldr r10, [r12, #8]
eor r5, r5, r9
ldr r11, [r12, #12]
eor r6, r6, r10
add r12, r12, #16
eor r7, r7, r11
.Lchacha_blocks_armv6_nomessage2:
stmia r14!, {r0-r7}
str r12, [sp, #48]
str r14, [sp, #40]
ldr r3, [sp, #52]
cmp r3, #64
sub r4, r3, #64
str r4, [sp, #52]
bhi .Lchacha_blocks_armv6_mainloop
cmp r3, #64
beq .Lchacha_blocks_armv6_nocopy2
ldr r1, [sp, #56]
sub r14, r14, #64
.Lchacha_blocks_armv6_copyinput2:
subs r3, r3, #1
ldrb r0, [r14], #1
strb r0, [r1], #1
bne .Lchacha_blocks_armv6_copyinput2
.Lchacha_blocks_armv6_nocopy2:
ldr r7, [sp, #60]
ldr r8, [sp, #(64 +48)]
ldr r9, [sp, #(64 +52)]
str r8, [r7, #32]
str r9, [r7, #36]
mov r12, sp
stmia r12!, {r0-r7}
add r12, r12, #48
stmia r12!, {r0-r7}
add sp, sp, #192
ldmfd sp!, {r4-r12, r14}
.Lchacha_blocks_armv6_nobytes:
bx lr

.ltorg

/* ========================================================================= */
#endif
/* ========================================================================= */
