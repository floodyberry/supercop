#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN_EXT blake2b_blocks_avx2, 4, 16
pushq %rbp
movl $128, %r10d
movq %rsp, %rbp
pushq %r13
pushq %r12
pushq %rbx
andq $-64, %rsp
subq $72, %rsp
cmpq $128, %rdx
cmovbe %rdx, %r10
movq 80(%rdi), %rax
movq 64(%rdi), %r8
movq 72(%rdi), %r9
movq 88(%rdi), %r11
testq %rax, %rax
movq %rax, -64(%rsp)
je .Lblake2b_blocks_avx2_2
cmpq $128, %rdx
je .Lblake2b_blocks_avx2_2
vpxor %xmm0, %xmm0, %xmm0
testb $64, %dl
vmovdqa %ymm0, -56(%rsp)
vmovdqa %ymm0, -24(%rsp)
leaq -56(%rsp), %rax
vmovdqa %ymm0, 8(%rsp)
vmovdqa %ymm0, 40(%rsp)
je .Lblake2b_blocks_avx2_3
vmovdqu (%rsi), %ymm0
leaq 8(%rsp), %rax
addq $64, %rsi
vmovdqa %ymm0, -56(%rsp)
vmovdqu -32(%rsi), %ymm0
vmovdqa %ymm0, -24(%rsp)
.Lblake2b_blocks_avx2_3:
testb $32, %dl
je .Lblake2b_blocks_avx2_4
vmovdqu (%rsi), %ymm0
addq $32, %rax
addq $32, %rsi
vmovdqa %ymm0, -32(%rax)
.Lblake2b_blocks_avx2_4:
testb $16, %dl
je .Lblake2b_blocks_avx2_5
vmovdqu (%rsi), %xmm0
addq $16, %rax
addq $16, %rsi
vmovdqa %xmm0, -16(%rax)
.Lblake2b_blocks_avx2_5:
testb $8, %dl
je .Lblake2b_blocks_avx2_6
movq (%rsi), %rbx
addq $8, %rax
addq $8, %rsi
movq %rbx, -8(%rax)
.Lblake2b_blocks_avx2_6:
testb $4, %dl
je .Lblake2b_blocks_avx2_7
movl (%rsi), %ebx
addq $4, %rax
addq $4, %rsi
movl %ebx, -4(%rax)
.Lblake2b_blocks_avx2_7:
testb $2, %dl
je .Lblake2b_blocks_avx2_8
movw (%rsi), %bx
addq $2, %rax
addq $2, %rsi
movw %bx, -2(%rax)
.Lblake2b_blocks_avx2_8:
testb $1, %dl
je .Lblake2b_blocks_avx2_15
movb (%rsi), %sil
movb %sil, (%rax)
.Lblake2b_blocks_avx2_15:
leaq -56(%rsp), %rsi
.Lblake2b_blocks_avx2_2:
vmovq -64(%rsp), %xmm7
vmovdqu (%rdi), %ymm1
vpinsrq $1, %r11, %xmm7, %xmm11
vmovdqu 32(%rdi), %ymm0
LOAD_VAR_PIC blake2b_constants, %r12
LOAD_VAR_PIC blake2b_constants_ssse3, %r13
vmovdqu 0(%r12), %ymm9
vmovdqu 32(%r12), %ymm10
vbroadcasti128 0(%r13), %ymm8
vbroadcasti128 16(%r13), %ymm7
.Lblake2b_blocks_avx2_13:
addq %r10, %r8
vmovdqa %ymm0, %ymm2
vmovdqa %ymm1, %ymm3
vmovq %r8, %xmm5
adcq $0, %r9
movl $blake2b_sigma, %eax
vpinsrq $1, %r9, %xmm5, %xmm4
vmovdqa %ymm9, %ymm5
vinserti128 $0x1, %xmm11, %ymm4, %ymm4
vpxor %ymm10, %ymm4, %ymm4
jmp .Lblake2b_blocks_avx2_11
.p2align 6
.Lblake2b_blocks_avx2_11:
movzbl (%rax), %ebx
addq $16, %rax
movzbl -12(%rax), %r13d
movzbl -14(%rax), %r11d
movzbl -10(%rax), %r12d
vmovq (%rsi,%rbx), %xmm14
vmovq (%rsi,%r13), %xmm6
movzbl -15(%rax), %ebx
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm13
movzbl -11(%rax), %r13d
vpinsrq $1, (%rsi,%r12), %xmm6, %xmm6
vinserti128 $0x1, %xmm6, %ymm13, %ymm13
movzbl -13(%rax), %r11d
vpaddq %ymm13, %ymm3, %ymm3
movzbl -9(%rax), %r12d
vpaddq %ymm2, %ymm3, %ymm3
vmovq (%rsi,%rbx), %xmm15
vpxor %ymm3, %ymm4, %ymm4
vpshufd $177, %ymm4, %ymm4
vmovq (%rsi,%r13), %xmm6
vpaddq %ymm4, %ymm5, %ymm5
movzbl -4(%rax), %r13d
vpinsrq $1, (%rsi,%r11), %xmm15, %xmm13
vpxor %ymm5, %ymm2, %ymm2
vpinsrq $1, (%rsi,%r12), %xmm6, %xmm6
vinserti128 $0x1, %xmm6, %ymm13, %ymm13
vpaddq %ymm13, %ymm3, %ymm3
vpshufb %ymm7, %ymm2, %ymm2
vpaddq %ymm2, %ymm3, %ymm13
movzbl -8(%rax), %ebx
movzbl -2(%rax), %r12d
vpxor %ymm4, %ymm13, %ymm4
vpshufb %ymm8, %ymm4, %ymm4
vpaddq %ymm4, %ymm5, %ymm5
movzbl -6(%rax), %r11d
vpermq $147, %ymm4, %ymm4
vpxor %ymm2, %ymm5, %ymm2
vpaddq %ymm2, %ymm2, %ymm3
vpsrlq $63, %ymm2, %ymm6
vpor %ymm3, %ymm6, %ymm6
vmovq (%rsi,%r13), %xmm3
vpermq $57, %ymm6, %ymm6
movzbl -3(%rax), %r13d
vpermq $78, %ymm5, %ymm5
vpinsrq $1, (%rsi,%r12), %xmm3, %xmm2
vmovq (%rsi,%rbx), %xmm3
movzbl -7(%rax), %ebx
vpinsrq $1, (%rsi,%r11), %xmm3, %xmm12
movzbl -1(%rax), %r12d
vinserti128 $0x1, %xmm2, %ymm12, %ymm12
movzbl -5(%rax), %r11d
vpaddq %ymm12, %ymm13, %ymm12
cmpq $blake2b_sigma+192, %rax
vmovq (%rsi,%r13), %xmm2
vpaddq %ymm6, %ymm12, %ymm12
vmovq (%rsi,%rbx), %xmm3
vpxor %ymm12, %ymm4, %ymm4
vpshufd $177, %ymm4, %ymm4
vpinsrq $1, (%rsi,%r12), %xmm2, %xmm2
vpaddq %ymm4, %ymm5, %ymm5
vpinsrq $1, (%rsi,%r11), %xmm3, %xmm3
vinserti128 $0x1, %xmm2, %ymm3, %ymm3
vpaddq %ymm3, %ymm12, %ymm3
vpxor %ymm5, %ymm6, %ymm6
vpshufb %ymm7, %ymm6, %ymm6
vpaddq %ymm6, %ymm3, %ymm3
vpxor %ymm4, %ymm3, %ymm4
vpshufb %ymm8, %ymm4, %ymm4
vpaddq %ymm4, %ymm5, %ymm5
vpxor %ymm6, %ymm5, %ymm6
vpaddq %ymm6, %ymm6, %ymm12
vpermq $57, %ymm4, %ymm4
vpsrlq $63, %ymm6, %ymm2
vpermq $78, %ymm5, %ymm5
vpor %ymm12, %ymm2, %ymm2
vpermq $147, %ymm2, %ymm2
jb .Lblake2b_blocks_avx2_11
cmpq $128, %rdx
vpxor %ymm5, %ymm3, %ymm3
vpxor %ymm4, %ymm2, %ymm2
vpxor %ymm1, %ymm3, %ymm1
vpxor %ymm0, %ymm2, %ymm0
jbe .Lblake2b_blocks_avx2_12
addq %rcx, %rsi
addq $-128, %rdx
jmp .Lblake2b_blocks_avx2_13
.Lblake2b_blocks_avx2_12:
vmovdqu %ymm1, (%rdi)
vmovdqu %ymm0, 32(%rdi)
movq %r8, 64(%rdi)
movq %r9, 72(%rdi)
leaq -24(%rbp), %rsp
popq %rbx
popq %r12
popq %r13
popq %rbp
ret
FN_END blake2b_blocks_avx2


.p2align 6
blake2b_constants:
.quad 0x6a09e667f3bcc908
.quad 0xbb67ae8584caa73b
.quad 0x3c6ef372fe94f82b
.quad 0xa54ff53a5f1d36f1
.quad 0x510e527fade682d1
.quad 0x9b05688c2b3e6c1f
.quad 0x1f83d9abfb41bd6b
.quad 0x5be0cd19137e2179

blake2b_sigma:
.byte 0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120
.byte 112,80,32,64,72,120,104,48,8,96,0,16,88,56,40,24
.byte 88,64,96,0,40,16,120,104,80,112,24,48,56,8,72,32
.byte 56,72,24,8,104,96,88,112,16,48,40,80,32,0,120,64
.byte 72,0,40,56,16,32,80,120,112,8,88,96,48,64,24,104
.byte 16,96,48,80,0,88,64,24,32,104,56,40,120,112,8,72
.byte 96,40,8,120,112,104,32,80,0,56,48,24,72,16,64,88
.byte 104,88,56,112,96,8,24,72,40,0,120,32,64,48,16,80
.byte 48,120,112,72,88,24,0,64,96,16,104,56,8,32,80,40
.byte 80,16,64,32,56,48,8,40,120,88,72,112,24,96,104,0
.byte 0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120
.byte 112,80,32,64,72,120,104,48,8,96,0,16,88,56,40,24


.p2align 4
blake2b_constants_ssse3:
.byte 2,3,4,5,6,7,0,1,10,11,12,13,14,15,8,9 /* 64 bit rotate right by 16 */
.byte 3,4,5,6,7,0,1,2,11,12,13,14,15,8,9,10 /* 64 bit rotate right by 24 */


