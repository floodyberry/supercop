#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_avx
pushq %rbp
movq %rsp, %rbp
pushq %r15
pushq %r14
pushq %r13
pushq %r12
pushq %rbx
movl $64, %ebx
andq $-64, %rsp
addq $8, %rsp
cmpq $64, %rdx
cmovbe %rdx, %rbx
movl 40(%rdi), %eax
testl %eax, %eax
jne blake2s_blocks_avx_33
blake2s_blocks_avx_2:
movl 32(%rdi), %r11d
leaq 32(%rdi), %r12
movl %ebx, %r13d
vmovdqu (%rdi), %xmm9
vmovdqu 16(%rdi), %xmm8
LOAD_VAR_PIC blake2s_constants_ssse3, %r10
vmovdqa 0(%r10), %xmm1
vmovdqa 16(%r10), %xmm0
LOAD_VAR_PIC 160+blake2s_sigma, %r10
vmovdqa 0(%r10), %xmm11
vmovdqa 16(%r10), %xmm10
blake2s_blocks_avx_12:
addl %r13d, %r11d
movl %r11d, %eax
movl %r11d, 32(%rdi)
cmpq %rax, %rbx
jbe blake2s_blocks_avx_8
addl $1, 36(%rdi)
blake2s_blocks_avx_8:
vmovdqu (%r12), %xmm4
vmovdqa %xmm11, %xmm3
vmovdqa %xmm8, %xmm2
LOAD_VAR_PIC blake2s_sigma, %rax
vmovdqa %xmm9, %xmm7
xorl %r8d, %r8d
vpxor %xmm10, %xmm4, %xmm4
jmp blake2s_blocks_avx_10
.p2align 4
blake2s_blocks_avx_34:
movzbl (%r8), %r8d
blake2s_blocks_avx_10:
movzbl 4(%rax), %r15d
movzbl 6(%rax), %r14d
movzbl 2(%rax), %r9d
vmovd (%rsi,%r15), %xmm6
movzbl 5(%rax), %r15d
vpinsrd $1, (%rsi,%r14), %xmm6, %xmm5
vmovd (%rsi,%r8), %xmm6
movzbl 7(%rax), %r14d
vpinsrd $1, (%rsi,%r9), %xmm6, %xmm12
movzbl 1(%rax), %r9d
vpunpcklqdq %xmm5, %xmm12, %xmm5
vpaddd %xmm5, %xmm7, %xmm5
movzbl 3(%rax), %r8d
vpaddd %xmm2, %xmm5, %xmm5
vmovd (%rsi,%r15), %xmm7
vpxor %xmm5, %xmm4, %xmm6
vpshufb %xmm1, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
movzbl 12(%rax), %r15d
vpxor %xmm3, %xmm2, %xmm2
vpslld $20, %xmm2, %xmm4
vpsrld $12, %xmm2, %xmm2
vpor %xmm4, %xmm2, %xmm2
vpinsrd $1, (%rsi,%r14), %xmm7, %xmm4
movzbl 14(%rax), %r14d
vmovd (%rsi,%r9), %xmm7
movzbl 8(%rax), %r9d
vpinsrd $1, (%rsi,%r8), %xmm7, %xmm12
vpunpcklqdq %xmm4, %xmm12, %xmm12
vpaddd %xmm12, %xmm5, %xmm12
vpaddd %xmm2, %xmm12, %xmm12
movzbl 10(%rax), %r8d
vmovd (%rsi,%r15), %xmm7
vpxor %xmm12, %xmm6, %xmm6
vpshufb %xmm0, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
movzbl 13(%rax), %r15d
vpshufd $147, %xmm6, %xmm6
vpxor %xmm3, %xmm2, %xmm2
vpslld $25, %xmm2, %xmm4
vpshufd $78, %xmm3, %xmm3
vpsrld $7, %xmm2, %xmm5
vpinsrd $1, (%rsi,%r14), %xmm7, %xmm2
vmovd (%rsi,%r9), %xmm7
vpor %xmm4, %xmm5, %xmm5
movzbl 9(%rax), %r9d
vpshufd $57, %xmm5, %xmm5
vpinsrd $1, (%rsi,%r8), %xmm7, %xmm4
vpunpcklqdq %xmm2, %xmm4, %xmm4
vpaddd %xmm4, %xmm12, %xmm4
vpaddd %xmm5, %xmm4, %xmm4
movzbl 15(%rax), %r14d
vpxor %xmm4, %xmm6, %xmm6
vpshufb %xmm1, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
vpxor %xmm3, %xmm5, %xmm7
movzbl 11(%rax), %r8d
vpslld $20, %xmm7, %xmm12
vpsrld $12, %xmm7, %xmm5
vmovd (%rsi,%r15), %xmm7
vpor %xmm12, %xmm5, %xmm5
vpinsrd $1, (%rsi,%r14), %xmm7, %xmm2
vmovd (%rsi,%r9), %xmm7
movzbl 16(%rax), %r9d
vpinsrd $1, (%rsi,%r8), %xmm7, %xmm7
movzbl 18(%rax), %r8d
vpunpcklqdq %xmm2, %xmm7, %xmm7
movzbl 20(%rax), %r15d
vpaddd %xmm7, %xmm4, %xmm7
vpaddd %xmm5, %xmm7, %xmm7
movzbl 22(%rax), %r14d
vpxor %xmm7, %xmm6, %xmm6
vpshufb %xmm0, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
vpxor %xmm3, %xmm5, %xmm2
vpslld $25, %xmm2, %xmm4
vpshufd $57, %xmm6, %xmm6
vpsrld $7, %xmm2, %xmm5
vpshufd $78, %xmm3, %xmm3
vpor %xmm4, %xmm5, %xmm5
vmovd (%rsi,%r15), %xmm4
vpshufd $147, %xmm5, %xmm5
movzbl 21(%rax), %r15d
vpinsrd $1, (%rsi,%r14), %xmm4, %xmm2
vmovd (%rsi,%r9), %xmm4
movzbl 23(%rax), %r14d
vpinsrd $1, (%rsi,%r8), %xmm4, %xmm12
vpunpcklqdq %xmm2, %xmm12, %xmm2
vpaddd %xmm2, %xmm7, %xmm2
vpaddd %xmm5, %xmm2, %xmm2
movzbl 17(%rax), %r9d
vpxor %xmm2, %xmm6, %xmm6
vpshufb %xmm1, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
vpxor %xmm3, %xmm5, %xmm5
vpslld $20, %xmm5, %xmm7
movzbl 19(%rax), %r8d
vpsrld $12, %xmm5, %xmm4
vpor %xmm7, %xmm4, %xmm4
vmovd (%rsi,%r15), %xmm7
movzbl 28(%rax), %r15d
vpinsrd $1, (%rsi,%r14), %xmm7, %xmm5
vmovd (%rsi,%r9), %xmm7
movzbl 24(%rax), %r9d
vpinsrd $1, (%rsi,%r8), %xmm7, %xmm12
vpunpcklqdq %xmm5, %xmm12, %xmm12
vpaddd %xmm12, %xmm2, %xmm12
vpaddd %xmm4, %xmm12, %xmm12
movzbl 26(%rax), %r8d
movzbl 30(%rax), %r14d
vpxor %xmm12, %xmm6, %xmm6
vpshufb %xmm0, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
vmovd (%rsi,%r15), %xmm7
vpshufd $147, %xmm6, %xmm6
vpxor %xmm3, %xmm4, %xmm4
vpslld $25, %xmm4, %xmm2
movzbl 29(%rax), %r15d
vpsrld $7, %xmm4, %xmm5
vmovd (%rsi,%r9), %xmm4
vpshufd $78, %xmm3, %xmm3
vpor %xmm2, %xmm5, %xmm5
vpinsrd $1, (%rsi,%r14), %xmm7, %xmm2
vpshufd $57, %xmm5, %xmm5
vpinsrd $1, (%rsi,%r8), %xmm4, %xmm7
vpunpcklqdq %xmm2, %xmm7, %xmm7
vpaddd %xmm7, %xmm12, %xmm7
vpaddd %xmm5, %xmm7, %xmm7
movzbl 25(%rax), %r9d
vpxor %xmm7, %xmm6, %xmm6
movzbl 31(%rax), %r14d
vpshufb %xmm1, %xmm6, %xmm6
vpaddd %xmm6, %xmm3, %xmm3
movzbl 27(%rax), %r8d
vpxor %xmm3, %xmm5, %xmm2
vpslld $20, %xmm2, %xmm4
vpsrld $12, %xmm2, %xmm5
vpor %xmm4, %xmm5, %xmm5
vmovd (%rsi,%r15), %xmm4
vpinsrd $1, (%rsi,%r14), %xmm4, %xmm2
vmovd (%rsi,%r9), %xmm4
vpinsrd $1, (%rsi,%r8), %xmm4, %xmm4
vpunpcklqdq %xmm2, %xmm4, %xmm2
vpaddd %xmm2, %xmm7, %xmm2
leaq 32(%rax), %r8
vpaddd %xmm5, %xmm2, %xmm2
vpxor %xmm2, %xmm6, %xmm4
vpshufb %xmm0, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
vpxor %xmm3, %xmm5, %xmm5
vmovdqa %xmm2, %xmm7
cmpq %r10, %r8
vpslld $25, %xmm5, %xmm2
vpshufd $57, %xmm4, %xmm4
vpshufd $78, %xmm3, %xmm3
vpsrld $7, %xmm5, %xmm5
movq %r8, %rax
vpor %xmm2, %xmm5, %xmm2
vpshufd $147, %xmm2, %xmm2
jb blake2s_blocks_avx_34
cmpq $64, %rdx
vpxor %xmm3, %xmm7, %xmm3
vpxor %xmm4, %xmm2, %xmm2
vpxor %xmm9, %xmm3, %xmm9
vpxor %xmm8, %xmm2, %xmm8
jbe blake2s_blocks_avx_11
addq %rcx, %rsi
subq $64, %rdx
jmp blake2s_blocks_avx_12
blake2s_blocks_avx_11:
vmovdqu %xmm9, (%rdi)
vmovdqu %xmm8, 16(%rdi)
leaq -40(%rbp), %rsp
popq %rbx
popq %r12
popq %r13
popq %r14
popq %r15
popq %rbp
ret
blake2s_blocks_avx_33:
cmpq $64, %rdx
je blake2s_blocks_avx_2
leaq -72(%rsp), %r8
testb $32, %dl
vpxor %xmm0, %xmm0, %xmm0
movq %r8, %rax
vmovdqa %ymm0, -72(%rsp)
vmovdqa %ymm0, -40(%rsp)
jne blake2s_blocks_avx_35
blake2s_blocks_avx_3:
testb $16, %dl
jne blake2s_blocks_avx_36
blake2s_blocks_avx_4:
testb $8, %dl
je blake2s_blocks_avx_5
movq (%rsi), %r9
addq $8, %rax
addq $8, %rsi
movq %r9, -8(%rax)
blake2s_blocks_avx_5:
testb $4, %dl
je blake2s_blocks_avx_6
movl (%rsi), %r9d
addq $4, %rax
addq $4, %rsi
movl %r9d, -4(%rax)
blake2s_blocks_avx_6:
testb $2, %dl
je blake2s_blocks_avx_7
movzwl (%rsi), %r9d
addq $2, %rax
addq $2, %rsi
movw %r9w, -2(%rax)
blake2s_blocks_avx_7:
testb $1, %dl
je blake2s_blocks_avx_14
movzbl (%rsi), %esi
movb %sil, (%rax)
movq %r8, %rsi
vzeroupper
jmp blake2s_blocks_avx_2
blake2s_blocks_avx_14:
movq %r8, %rsi
vzeroupper
jmp blake2s_blocks_avx_2
blake2s_blocks_avx_36:
vmovdqu (%rsi), %xmm0
addq $16, %rax
addq $16, %rsi
vmovdqa %xmm0, -16(%rax)
jmp blake2s_blocks_avx_4
blake2s_blocks_avx_35:
vmovdqu (%rsi), %ymm0
addq $32, %rax
addq $32, %rsi
vmovdqa %ymm0, -72(%rsp)
jmp blake2s_blocks_avx_3
FN_END blake2s_blocks_avx



.p2align 6
blake2s_sigma:
.byte 0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60
.byte 56,40,16,32,36,60,52,24,4,48,0,8,44,28,20,12
.byte 44,32,48,0,20,8,60,52,40,56,12,24,28,4,36,16
.byte 28,36,12,4,52,48,44,56,8,24,20,40,16,0,60,32
.byte 36,0,20,28,8,16,40,60,56,4,44,48,24,32,12,52
.byte 8,48,24,40,0,44,32,12,16,52,28,20,60,56,4,36
.byte 48,20,4,60,56,52,16,40,0,28,24,12,36,8,32,44
.byte 52,44,28,56,48,4,12,36,20,0,60,16,32,24,8,40
.byte 24,60,56,36,44,12,0,32,48,8,52,28,4,16,40,20
.byte 40,8,32,16,28,24,4,20,60,44,36,56,12,48,52,0

blake2s_constants:
.long 0x6a09e667
.long 0xbb67ae85
.long 0x3c6ef372
.long 0xa54ff53a
.long 0x510e527f
.long 0x9b05688c
.long 0x1f83d9ab
.long 0x5be0cd19


.p2align 4
blake2s_constants_ssse3:
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13 /* 32 bit rotate right by 16 */
.byte 1,2,3,0,5,6,7,4,9,10,11,8,13,14,15,12 /* 32 bit rotate right by 8 */



