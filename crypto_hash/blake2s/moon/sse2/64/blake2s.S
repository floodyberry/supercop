#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_sse2
pushq %rbp
movq %rsp, %rbp
andq $-64, %rsp
movq %rdi, %r10
movl $64, %r8d
cmpq $64, %rdx
LOAD_VAR_PIC 160+blake2s_sigma, %r9
cmovbe %rdx, %r8
cmpl $0, 40(%r10)
je blake2s_blocks_sse2_18
blake2s_blocks_sse2_2:
cmpq $64, %rdx
je blake2s_blocks_sse2_18
blake2s_blocks_sse2_4:
testq $32, %rdx
lea -64(%rsp), %rax
pxor %xmm0, %xmm0
movdqa %xmm0, -64(%rsp)
movdqa %xmm0, -48(%rsp)
movdqa %xmm0, -32(%rsp)
movdqa %xmm0, -16(%rsp)
je blake2s_blocks_sse2_6
blake2s_blocks_sse2_5:
movdqu (%rsi), %xmm0
movdqa %xmm0, -64(%rsp)
lea -32(%rsp), %rax
movdqu 16(%rsi), %xmm1
movdqa %xmm1, -48(%rsp)
addq $32, %rsi
blake2s_blocks_sse2_6:
testq $16, %rdx
je blake2s_blocks_sse2_8
blake2s_blocks_sse2_7:
movdqu (%rsi), %xmm0
movdqa %xmm0, (%rax)
addq $16, %rsi
addq $16, %rax
blake2s_blocks_sse2_8:
testq $8, %rdx
je blake2s_blocks_sse2_10
blake2s_blocks_sse2_9:
movq (%rsi), %rdi
addq $8, %rsi
movq %rdi, (%rax)
addq $8, %rax
blake2s_blocks_sse2_10:
testq $4, %rdx
je blake2s_blocks_sse2_12
blake2s_blocks_sse2_11:
movl (%rsi), %edi
addq $4, %rsi
movl %edi, (%rax)
addq $4, %rax
blake2s_blocks_sse2_12:
testq $2, %rdx
je blake2s_blocks_sse2_14
blake2s_blocks_sse2_13:
movzwl (%rsi), %edi
addq $2, %rsi
movw %di, (%rax)
addq $2, %rax
blake2s_blocks_sse2_14:
testq $1, %rdx
je blake2s_blocks_sse2_16
blake2s_blocks_sse2_15:
movb (%rsi), %sil
movb %sil, (%rax)
blake2s_blocks_sse2_16:
lea -64(%rsp), %rsi
blake2s_blocks_sse2_18:
LOAD_VAR_PIC blake2s_constants, %r11
LOAD_VAR_PIC 16+blake2s_constants, %rax
movdqu (%r10), %xmm10
movdqu 16(%r10), %xmm0
movl 32(%r10), %edi
movdqa (%rax), %xmm9
movdqa (%r11), %xmm8
jmp blake2s_blocks_sse2_19
blake2s_blocks_sse2_24:
addq %rcx, %rsi
addq $-64, %rdx
blake2s_blocks_sse2_19:
movl %edi, %edi
movdqa %xmm10, %xmm7
addq %r8, %rdi
movdqa %xmm0, %xmm6
movl %edi, %eax
movl %edi, 32(%r10)
cmpq %r8, %rax
jae blake2s_blocks_sse2_21
blake2s_blocks_sse2_20:
incl 36(%r10)
blake2s_blocks_sse2_21:
movdqu 32(%r10), %xmm2
movdqa %xmm8, %xmm1
pxor %xmm9, %xmm2
LOAD_VAR_PIC blake2s_sigma, %rax
blake2s_blocks_sse2_22:
movzbl (%rax), %r11d
movd (%r11,%rsi), %xmm14
movzbl 2(%rax), %r11d
movd (%r11,%rsi), %xmm11
movzbl 4(%rax), %r11d
punpcklqdq %xmm11, %xmm14
movd (%r11,%rsi), %xmm13
movzbl 6(%rax), %r11d
movd (%r11,%rsi), %xmm12
punpcklqdq %xmm12, %xmm13
shufps $136, %xmm13, %xmm14
paddd %xmm14, %xmm10
paddd %xmm0, %xmm10
pxor %xmm10, %xmm2
pshuflw $177, %xmm2, %xmm15
movzbl 1(%rax), %r11d
pshufhw $177, %xmm15, %xmm5
paddd %xmm5, %xmm1
pxor %xmm1, %xmm0
movd (%r11,%rsi), %xmm4
movdqa %xmm0, %xmm11
movzbl 3(%rax), %r11d
psrld $12, %xmm11
pslld $20, %xmm0
por %xmm0, %xmm11
movd (%r11,%rsi), %xmm0
movzbl 5(%rax), %r11d
punpcklqdq %xmm0, %xmm4
movd (%r11,%rsi), %xmm3
movzbl 7(%rax), %r11d
movd (%r11,%rsi), %xmm2
movzbl 8(%rax), %r11d
punpcklqdq %xmm2, %xmm3
shufps $136, %xmm3, %xmm4
movd (%r11,%rsi), %xmm2
paddd %xmm4, %xmm10
movzbl 10(%rax), %r11d
paddd %xmm11, %xmm10
pxor %xmm10, %xmm5
movdqa %xmm5, %xmm3
pslld $24, %xmm5
movd (%r11,%rsi), %xmm13
psrld $8, %xmm3
movzbl 12(%rax), %r11d
por %xmm5, %xmm3
paddd %xmm3, %xmm1
pxor %xmm1, %xmm11
movd (%r11,%rsi), %xmm0
movdqa %xmm11, %xmm12
movzbl 14(%rax), %r11d
psrld $7, %xmm12
punpcklqdq %xmm13, %xmm2
pslld $25, %xmm11
por %xmm11, %xmm12
movd (%r11,%rsi), %xmm14
movzbl 9(%rax), %r11d
punpcklqdq %xmm14, %xmm0
shufps $136, %xmm0, %xmm2
pshufd $57, %xmm12, %xmm5
paddd %xmm2, %xmm10
pshufd $147, %xmm3, %xmm4
paddd %xmm5, %xmm10
movd (%r11,%rsi), %xmm3
pxor %xmm10, %xmm4
movzbl 11(%rax), %r11d
pshuflw $177, %xmm4, %xmm15
pshufd $78, %xmm1, %xmm4
movd (%r11,%rsi), %xmm1
movzbl 13(%rax), %r11d
pshufhw $177, %xmm15, %xmm11
paddd %xmm11, %xmm4
movd (%r11,%rsi), %xmm2
pxor %xmm4, %xmm5
movzbl 15(%rax), %r11d
movdqa %xmm5, %xmm12
punpcklqdq %xmm1, %xmm3
psrld $12, %xmm12
pslld $20, %xmm5
movd (%r11,%rsi), %xmm0
por %xmm5, %xmm12
movzbl 16(%rax), %r11d
punpcklqdq %xmm0, %xmm2
shufps $136, %xmm2, %xmm3
movd (%r11,%rsi), %xmm15
paddd %xmm3, %xmm10
movzbl 18(%rax), %r11d
paddd %xmm12, %xmm10
pxor %xmm10, %xmm11
movdqa %xmm11, %xmm0
pslld $24, %xmm11
movd (%r11,%rsi), %xmm1
psrld $8, %xmm0
movzbl 20(%rax), %r11d
por %xmm11, %xmm0
paddd %xmm0, %xmm4
pxor %xmm4, %xmm12
movd (%r11,%rsi), %xmm14
movdqa %xmm12, %xmm5
movzbl 22(%rax), %r11d
psrld $7, %xmm5
punpcklqdq %xmm1, %xmm15
pslld $25, %xmm12
por %xmm12, %xmm5
movd (%r11,%rsi), %xmm13
punpcklqdq %xmm13, %xmm14
shufps $136, %xmm14, %xmm15
pshufd $147, %xmm5, %xmm3
paddd %xmm15, %xmm10
pshufd $57, %xmm0, %xmm1
paddd %xmm3, %xmm10
pxor %xmm10, %xmm1
pshuflw $177, %xmm1, %xmm2
pshufhw $177, %xmm2, %xmm5
pshufd $78, %xmm4, %xmm2
paddd %xmm5, %xmm2
pxor %xmm2, %xmm3
movzbl 17(%rax), %r11d
movdqa %xmm3, %xmm11
psrld $12, %xmm11
pslld $20, %xmm3
por %xmm3, %xmm11
movd (%r11,%rsi), %xmm3
movzbl 19(%rax), %r11d
movd (%r11,%rsi), %xmm4
movzbl 21(%rax), %r11d
punpcklqdq %xmm4, %xmm3
movd (%r11,%rsi), %xmm1
movzbl 23(%rax), %r11d
movd (%r11,%rsi), %xmm0
punpcklqdq %xmm0, %xmm1
shufps $136, %xmm1, %xmm3
paddd %xmm3, %xmm10
paddd %xmm11, %xmm10
pxor %xmm10, %xmm5
movzbl 24(%rax), %r11d
movdqa %xmm5, %xmm3
psrld $8, %xmm3
pslld $24, %xmm5
por %xmm5, %xmm3
movd (%r11,%rsi), %xmm5
paddd %xmm3, %xmm2
movzbl 26(%rax), %r11d
pxor %xmm2, %xmm11
movdqa %xmm11, %xmm12
pslld $25, %xmm11
psrld $7, %xmm12
movd (%r11,%rsi), %xmm4
por %xmm11, %xmm12
movzbl 28(%rax), %r11d
punpcklqdq %xmm4, %xmm5
pshufd $57, %xmm12, %xmm1
movd (%r11,%rsi), %xmm0
movzbl 30(%rax), %r11d
pshufd $147, %xmm3, %xmm11
movd (%r11,%rsi), %xmm13
punpcklqdq %xmm13, %xmm0
shufps $136, %xmm0, %xmm5
paddd %xmm5, %xmm10
movzbl 25(%rax), %r11d
paddd %xmm1, %xmm10
pxor %xmm10, %xmm11
pshuflw $177, %xmm11, %xmm14
movd (%r11,%rsi), %xmm3
movzbl 27(%rax), %r11d
pshufhw $177, %xmm14, %xmm4
pshufd $78, %xmm2, %xmm5
paddd %xmm4, %xmm5
pxor %xmm5, %xmm1
movd (%r11,%rsi), %xmm2
movdqa %xmm1, %xmm0
movzbl 29(%rax), %r11d
psrld $12, %xmm0
pslld $20, %xmm1
por %xmm1, %xmm0
movd (%r11,%rsi), %xmm1
movzbl 31(%rax), %r11d
addq $32, %rax
punpcklqdq %xmm2, %xmm3
cmpq %r9, %rax
movd (%r11,%rsi), %xmm15
punpcklqdq %xmm15, %xmm1
shufps $136, %xmm1, %xmm3
paddd %xmm3, %xmm10
paddd %xmm0, %xmm10
pxor %xmm10, %xmm4
movdqa %xmm4, %xmm2
pslld $24, %xmm4
psrld $8, %xmm2
por %xmm4, %xmm2
paddd %xmm2, %xmm5
pxor %xmm5, %xmm0
movdqa %xmm0, %xmm11
pslld $25, %xmm0
psrld $7, %xmm11
por %xmm0, %xmm11
pshufd $57, %xmm2, %xmm2
pshufd $78, %xmm5, %xmm1
pshufd $147, %xmm11, %xmm0
jb blake2s_blocks_sse2_22
blake2s_blocks_sse2_23:
pxor %xmm1, %xmm10
pxor %xmm2, %xmm0
pxor %xmm7, %xmm10
pxor %xmm6, %xmm0
cmpq $64, %rdx
ja blake2s_blocks_sse2_24
blake2s_blocks_sse2_25:
movdqu %xmm10, (%r10)
movdqu %xmm0, 16(%r10)
blake2s_blocks_sse2_28:
movq %rbp, %rsp
popq %rbp
ret
FN_END blake2s_blocks_sse2


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



