#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_xop
pushq %rbp
movl $64, %r8d
movq %rsp, %rbp
pushq %r12
pushq %rbx
andq $-64, %rsp
addq $32, %rsp
cmpq $64, %rdx
cmovbe %rdx, %r8
cmpl $0, 40(%rdi)
je blake2s_blocks_xop_2
cmpq $64, %rdx
je blake2s_blocks_xop_2
vpxor %xmm0, %xmm0, %xmm0
testb $32, %dl
leaq -96(%rsp), %r9
vmovdqa %ymm0, -96(%rsp)
vmovdqa %ymm0, -64(%rsp)
je blake2s_blocks_xop_13
vmovdqu (%rsi), %ymm0
leaq 32(%r9), %rax
addq $32, %rsi
vmovdqa %ymm0, -96(%rsp)
jmp blake2s_blocks_xop_3
blake2s_blocks_xop_13:
movq %r9, %rax
blake2s_blocks_xop_3:
testb $16, %dl
je blake2s_blocks_xop_4
vmovdqu (%rsi), %xmm0
addq $16, %rax
addq $16, %rsi
vmovdqa %xmm0, -16(%rax)
blake2s_blocks_xop_4:
testb $8, %dl
je blake2s_blocks_xop_5
movq (%rsi), %r10
addq $8, %rax
addq $8, %rsi
movq %r10, -8(%rax)
blake2s_blocks_xop_5:
testb $4, %dl
je blake2s_blocks_xop_6
movl (%rsi), %r10d
addq $4, %rax
addq $4, %rsi
movl %r10d, -4(%rax)
blake2s_blocks_xop_6:
testb $2, %dl
je blake2s_blocks_xop_7
movw (%rsi), %r10w
addq $2, %rax
addq $2, %rsi
movw %r10w, -2(%rax)
blake2s_blocks_xop_7:
testb $1, %dl
je blake2s_blocks_xop_14
movb (%rsi), %sil
movb %sil, (%rax)
blake2s_blocks_xop_14:
movq %r9, %rsi
blake2s_blocks_xop_2:
vmovdqu (%rdi), %xmm1
LOAD_VAR_PIC 160+blake2s_sigma, %r10
vmovdqu 16(%rdi), %xmm0
blake2s_blocks_xop_12:
movl %r8d, %eax
addl 32(%rdi), %eax
cmpq %r8, %rax
movl %eax, 32(%rdi)
jae blake2s_blocks_xop_8
incl 36(%rdi)
blake2s_blocks_xop_8:
vmovdqu 32(%rdi), %xmm3
LOAD_VAR_PIC blake2s_sigma, %rax
vmovdqa %xmm0, %xmm2
xorl %r9d, %r9d
vmovdqa %xmm1, %xmm5
LOAD_VAR_PIC blake2s_sigma, %r12
vmovdqa 160(%r12), %xmm4
vpxor 176(%r12), %xmm3, %xmm3
blake2s_blocks_xop_10:
movzbl 4(%rax), %r12d
movzbl 6(%rax), %ebx
movzbl 2(%rax), %r11d
vmovd (%rsi,%r12), %xmm7
movzbl 5(%rax), %r12d
vpinsrd $1, (%rsi,%rbx), %xmm7, %xmm6
vmovd (%rsi,%r9), %xmm7
movzbl 7(%rax), %ebx
movzbl 3(%rax), %r9d
vpinsrd $1, (%rsi,%r11), %xmm7, %xmm7
movzbl 1(%rax), %r11d
vpunpcklqdq %xmm6, %xmm7, %xmm6
vmovd (%rsi,%r12), %xmm7
movzbl 12(%rax), %r12d
vpaddd %xmm6, %xmm5, %xmm5
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm3, %xmm3
vprotd $16, %xmm3, %xmm6
vpinsrd $1, (%rsi,%rbx), %xmm7, %xmm3
vpaddd %xmm6, %xmm4, %xmm4
vmovd (%rsi,%r11), %xmm7
movzbl 14(%rax), %ebx
movzbl 8(%rax), %r11d
vpxor %xmm4, %xmm2, %xmm2
vpinsrd $1, (%rsi,%r9), %xmm7, %xmm7
movzbl 10(%rax), %r9d
vprotd $20, %xmm2, %xmm2
vpunpcklqdq %xmm3, %xmm7, %xmm7
vpaddd %xmm7, %xmm5, %xmm5
vmovd (%rsi,%r12), %xmm7
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm6, %xmm6
movzbl 13(%rax), %r12d
vpinsrd $1, (%rsi,%rbx), %xmm7, %xmm3
vmovd (%rsi,%r11), %xmm7
movzbl 15(%rax), %ebx
vprotd $24, %xmm6, %xmm6
vpaddd %xmm6, %xmm4, %xmm4
vpxor %xmm4, %xmm2, %xmm2
vpinsrd $1, (%rsi,%r9), %xmm7, %xmm7
movzbl 9(%rax), %r11d
movzbl 11(%rax), %r9d
vprotd $25, %xmm2, %xmm2
vpshufd $57, %xmm2, %xmm2
vpshufd $147, %xmm6, %xmm6
vpshufd $78, %xmm4, %xmm4
vpunpcklqdq %xmm3, %xmm7, %xmm7
vpaddd %xmm7, %xmm5, %xmm5
vpaddd %xmm2, %xmm5, %xmm7
vmovd (%rsi,%r12), %xmm5
vpxor %xmm7, %xmm6, %xmm6
vpinsrd $1, (%rsi,%rbx), %xmm5, %xmm3
vmovd (%rsi,%r11), %xmm5
movzbl 16(%rax), %r11d
vprotd $16, %xmm6, %xmm6
vpaddd %xmm6, %xmm4, %xmm4
vpxor %xmm4, %xmm2, %xmm2
vpinsrd $1, (%rsi,%r9), %xmm5, %xmm5
movzbl 18(%rax), %r9d
movzbl 20(%rax), %r12d
movzbl 22(%rax), %ebx
vprotd $20, %xmm2, %xmm2
vpunpcklqdq %xmm3, %xmm5, %xmm5
vpaddd %xmm5, %xmm7, %xmm5
vmovd (%rsi,%r12), %xmm7
movzbl 21(%rax), %r12d
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm6, %xmm6
vpinsrd $1, (%rsi,%rbx), %xmm7, %xmm3
vmovd (%rsi,%r11), %xmm7
movzbl 17(%rax), %r11d
movzbl 23(%rax), %ebx
vprotd $24, %xmm6, %xmm6
vpaddd %xmm6, %xmm4, %xmm4
vpinsrd $1, (%rsi,%r9), %xmm7, %xmm7
movzbl 19(%rax), %r9d
vpxor %xmm4, %xmm2, %xmm2
vpshufd $57, %xmm6, %xmm6
vpshufd $78, %xmm4, %xmm4
vpunpcklqdq %xmm3, %xmm7, %xmm3
vmovd (%rsi,%r11), %xmm7
vprotd $25, %xmm2, %xmm2
movzbl 24(%rax), %r11d
vpshufd $147, %xmm2, %xmm2
vpinsrd $1, (%rsi,%r9), %xmm7, %xmm7
vpaddd %xmm3, %xmm5, %xmm3
vmovd (%rsi,%r12), %xmm5
movzbl 28(%rax), %r12d
movzbl 26(%rax), %r9d
vpaddd %xmm2, %xmm3, %xmm3
vpxor %xmm3, %xmm6, %xmm6
vpinsrd $1, (%rsi,%rbx), %xmm5, %xmm5
movzbl 30(%rax), %ebx
vprotd $16, %xmm6, %xmm6
vpaddd %xmm6, %xmm4, %xmm4
vpxor %xmm4, %xmm2, %xmm2
vpunpcklqdq %xmm5, %xmm7, %xmm7
vmovd (%rsi,%r11), %xmm5
vprotd $20, %xmm2, %xmm2
movzbl 25(%rax), %r11d
vpinsrd $1, (%rsi,%r9), %xmm5, %xmm5
vpaddd %xmm7, %xmm3, %xmm7
vmovd (%rsi,%r12), %xmm3
vpaddd %xmm2, %xmm7, %xmm7
vpxor %xmm7, %xmm6, %xmm6
movzbl 29(%rax), %r12d
movzbl 27(%rax), %r9d
vpinsrd $1, (%rsi,%rbx), %xmm3, %xmm3
movzbl 31(%rax), %ebx
vprotd $24, %xmm6, %xmm6
vpaddd %xmm6, %xmm4, %xmm4
vpxor %xmm4, %xmm2, %xmm2
vpshufd $147, %xmm6, %xmm6
vpshufd $78, %xmm4, %xmm4
vpunpcklqdq %xmm3, %xmm5, %xmm5
vmovd (%rsi,%r12), %xmm3
vprotd $25, %xmm2, %xmm2
vpshufd $57, %xmm2, %xmm2
vpinsrd $1, (%rsi,%rbx), %xmm3, %xmm3
vpaddd %xmm5, %xmm7, %xmm5
vmovd (%rsi,%r11), %xmm7
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm6, %xmm6
vpinsrd $1, (%rsi,%r9), %xmm7, %xmm7
leaq 32(%rax), %r9
vprotd $16, %xmm6, %xmm6
vpaddd %xmm6, %xmm4, %xmm4
vpxor %xmm4, %xmm2, %xmm2
cmpq %r10, %r9
movq %r9, %rax
vpunpcklqdq %xmm3, %xmm7, %xmm3
vprotd $20, %xmm2, %xmm2
vpaddd %xmm3, %xmm5, %xmm3
vpaddd %xmm2, %xmm3, %xmm3
vmovdqa %xmm3, %xmm5
vpxor %xmm3, %xmm6, %xmm3
vprotd $24, %xmm3, %xmm3
vpaddd %xmm3, %xmm4, %xmm4
vpxor %xmm4, %xmm2, %xmm2
vpshufd $57, %xmm3, %xmm3
vpshufd $78, %xmm4, %xmm4
vprotd $25, %xmm2, %xmm2
vpshufd $147, %xmm2, %xmm2
jae blake2s_blocks_xop_9
movzbl (%r9), %r9d
jmp blake2s_blocks_xop_10
blake2s_blocks_xop_9:
vpxor %xmm4, %xmm5, %xmm4
cmpq $64, %rdx
vpxor %xmm3, %xmm2, %xmm2
vpxor %xmm1, %xmm4, %xmm1
vpxor %xmm0, %xmm2, %xmm0
jbe blake2s_blocks_xop_11
addq %rcx, %rsi
subq $64, %rdx
jmp blake2s_blocks_xop_12
blake2s_blocks_xop_11:
vmovdqu %xmm1, (%rdi)
vmovdqu %xmm0, 16(%rdi)
leaq -16(%rbp), %rsp
popq %rbx
popq %r12
popq %rbp
ret
FN_END blake2s_blocks_xop


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



