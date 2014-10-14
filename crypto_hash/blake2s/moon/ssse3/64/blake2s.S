#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_ssse3
pushq %rbp
movq %rsp, %rbp
andq $-64, %rsp
LOAD_VAR_PIC blake2s_constants_ssse3, %r8
movq %rdi, %r10
cmpq $64, %rdx
LOAD_VAR_PIC 160+blake2s_sigma, %r9
movdqa 0(%r8), %xmm6
movdqa 16(%r8), %xmm5
movl $64, %r8d
cmovbe %rdx, %r8
cmpl $0, 40(%r10)
je blake2s_blocks_ssse3_18
blake2s_blocks_ssse3_2:
cmpq $64, %rdx
je blake2s_blocks_ssse3_18
blake2s_blocks_ssse3_4:
testq $32, %rdx
lea -64(%rsp), %rax
pxor %xmm0, %xmm0
movdqa %xmm0, -64(%rsp)
movdqa %xmm0, -48(%rsp)
movdqa %xmm0, -32(%rsp)
movdqa %xmm0, -16(%rsp)
je blake2s_blocks_ssse3_6
blake2s_blocks_ssse3_5:
movdqu (%rsi), %xmm0
movdqa %xmm0, -64(%rsp)
lea -32(%rsp), %rax
movdqu 16(%rsi), %xmm1
movdqa %xmm1, -48(%rsp)
addq $32, %rsi
blake2s_blocks_ssse3_6:
testq $16, %rdx
je blake2s_blocks_ssse3_8
blake2s_blocks_ssse3_7:
movdqu (%rsi), %xmm0
movdqa %xmm0, (%rax)
addq $16, %rsi
addq $16, %rax
blake2s_blocks_ssse3_8:
testq $8, %rdx
je blake2s_blocks_ssse3_10
blake2s_blocks_ssse3_9:
movq (%rsi), %rdi
addq $8, %rsi
movq %rdi, (%rax)
addq $8, %rax
blake2s_blocks_ssse3_10:
testq $4, %rdx
je blake2s_blocks_ssse3_12
blake2s_blocks_ssse3_11:
movl (%rsi), %edi
addq $4, %rsi
movl %edi, (%rax)
addq $4, %rax
blake2s_blocks_ssse3_12:
testq $2, %rdx
je blake2s_blocks_ssse3_14
blake2s_blocks_ssse3_13:
movzwl (%rsi), %edi
addq $2, %rsi
movw %di, (%rax)
addq $2, %rax
blake2s_blocks_ssse3_14:
testq $1, %rdx
je blake2s_blocks_ssse3_16
blake2s_blocks_ssse3_15:
movb (%rsi), %sil
movb %sil, (%rax)
blake2s_blocks_ssse3_16:
lea -64(%rsp), %rsi
blake2s_blocks_ssse3_18:
LOAD_VAR_PIC blake2s_constants, %r11
movdqu (%r10), %xmm4
movdqu 16(%r10), %xmm12
movl 32(%r10), %edi
movdqa 0(%r11), %xmm2
movdqa 16(%r11), %xmm3
jmp blake2s_blocks_ssse3_19
blake2s_blocks_ssse3_24:
addq %rcx, %rsi
addq $-64, %rdx
blake2s_blocks_ssse3_19:
movl %edi, %edi
movdqa %xmm4, %xmm1
addq %r8, %rdi
movdqa %xmm12, %xmm0
movl %edi, %eax
movl %edi, 32(%r10)
cmpq %r8, %rax
jae blake2s_blocks_ssse3_21
blake2s_blocks_ssse3_20:
incl 36(%r10)
blake2s_blocks_ssse3_21:
movdqu 32(%r10), %xmm7
movdqa %xmm2, %xmm9
pxor %xmm3, %xmm7
LOAD_VAR_PIC blake2s_sigma, %rax
blake2s_blocks_ssse3_22:
movzbl (%rax), %r11d
movd (%r11,%rsi), %xmm10
movzbl 2(%rax), %r11d
movd (%r11,%rsi), %xmm15
movzbl 4(%rax), %r11d
punpcklqdq %xmm15, %xmm10
movd (%r11,%rsi), %xmm11
movzbl 6(%rax), %r11d
movd (%r11,%rsi), %xmm8
punpcklqdq %xmm8, %xmm11
shufps $136, %xmm11, %xmm10
paddd %xmm10, %xmm4
paddd %xmm12, %xmm4
pxor %xmm4, %xmm7
movzbl 1(%rax), %r11d
pshufb %xmm6, %xmm7
movd (%r11,%rsi), %xmm8
paddd %xmm7, %xmm9
movzbl 3(%rax), %r11d
pxor %xmm9, %xmm12
movdqa %xmm12, %xmm11
pslld $20, %xmm12
psrld $12, %xmm11
movd (%r11,%rsi), %xmm13
por %xmm12, %xmm11
movzbl 5(%rax), %r11d
punpcklqdq %xmm13, %xmm8
movd (%r11,%rsi), %xmm12
movzbl 7(%rax), %r11d
movd (%r11,%rsi), %xmm14
punpcklqdq %xmm14, %xmm12
shufps $136, %xmm12, %xmm8
paddd %xmm8, %xmm4
paddd %xmm11, %xmm4
pxor %xmm4, %xmm7
pshufb %xmm5, %xmm7
paddd %xmm7, %xmm9
pxor %xmm9, %xmm11
movzbl 8(%rax), %r11d
movdqa %xmm11, %xmm10
psrld $7, %xmm10
pslld $25, %xmm11
por %xmm11, %xmm10
movd (%r11,%rsi), %xmm11
movzbl 10(%rax), %r11d
pshufd $57, %xmm10, %xmm12
pshufd $147, %xmm7, %xmm14
movd (%r11,%rsi), %xmm15
movzbl 12(%rax), %r11d
punpcklqdq %xmm15, %xmm11
movd (%r11,%rsi), %xmm13
movzbl 14(%rax), %r11d
movd (%r11,%rsi), %xmm8
movzbl 9(%rax), %r11d
punpcklqdq %xmm8, %xmm13
shufps $136, %xmm13, %xmm11
paddd %xmm11, %xmm4
movd (%r11,%rsi), %xmm11
paddd %xmm12, %xmm4
movzbl 11(%rax), %r11d
pxor %xmm4, %xmm14
pshufb %xmm6, %xmm14
movd (%r11,%rsi), %xmm7
movzbl 13(%rax), %r11d
pshufd $78, %xmm9, %xmm13
paddd %xmm14, %xmm13
movd (%r11,%rsi), %xmm8
pxor %xmm13, %xmm12
movzbl 15(%rax), %r11d
movdqa %xmm12, %xmm10
punpcklqdq %xmm7, %xmm11
psrld $12, %xmm10
pslld $20, %xmm12
movd (%r11,%rsi), %xmm9
por %xmm12, %xmm10
movzbl 16(%rax), %r11d
punpcklqdq %xmm9, %xmm8
shufps $136, %xmm8, %xmm11
paddd %xmm11, %xmm4
movd (%r11,%rsi), %xmm8
paddd %xmm10, %xmm4
movzbl 18(%rax), %r11d
pxor %xmm4, %xmm14
pshufb %xmm5, %xmm14
movd (%r11,%rsi), %xmm9
paddd %xmm14, %xmm13
movzbl 20(%rax), %r11d
pxor %xmm13, %xmm10
movdqa %xmm10, %xmm7
pslld $25, %xmm10
psrld $7, %xmm7
movd (%r11,%rsi), %xmm15
por %xmm10, %xmm7
movzbl 22(%rax), %r11d
punpcklqdq %xmm9, %xmm8
pshufd $147, %xmm7, %xmm10
movd (%r11,%rsi), %xmm12
movzbl 17(%rax), %r11d
punpcklqdq %xmm12, %xmm15
shufps $136, %xmm15, %xmm8
movd (%r11,%rsi), %xmm7
paddd %xmm8, %xmm4
movzbl 19(%rax), %r11d
paddd %xmm10, %xmm4
pshufd $57, %xmm14, %xmm11
pshufd $78, %xmm13, %xmm9
pxor %xmm4, %xmm11
movd (%r11,%rsi), %xmm13
movzbl 21(%rax), %r11d
pshufb %xmm6, %xmm11
movd (%r11,%rsi), %xmm8
paddd %xmm11, %xmm9
movzbl 23(%rax), %r11d
pxor %xmm9, %xmm10
punpcklqdq %xmm13, %xmm7
movdqa %xmm10, %xmm12
psrld $12, %xmm12
pslld $20, %xmm10
movd (%r11,%rsi), %xmm14
por %xmm10, %xmm12
movzbl 24(%rax), %r11d
punpcklqdq %xmm14, %xmm8
shufps $136, %xmm8, %xmm7
movd (%r11,%rsi), %xmm8
paddd %xmm7, %xmm4
movzbl 26(%rax), %r11d
paddd %xmm12, %xmm4
pxor %xmm4, %xmm11
pshufb %xmm5, %xmm11
movd (%r11,%rsi), %xmm13
paddd %xmm11, %xmm9
movzbl 28(%rax), %r11d
pxor %xmm9, %xmm12
movdqa %xmm12, %xmm10
pslld $25, %xmm12
punpcklqdq %xmm13, %xmm8
psrld $7, %xmm10
movd (%r11,%rsi), %xmm15
por %xmm12, %xmm10
movzbl 30(%rax), %r11d
pshufd $57, %xmm10, %xmm7
pshufd $147, %xmm11, %xmm10
movd (%r11,%rsi), %xmm14
punpcklqdq %xmm14, %xmm15
shufps $136, %xmm15, %xmm8
paddd %xmm8, %xmm4
paddd %xmm7, %xmm4
pxor %xmm4, %xmm10
pshufb %xmm6, %xmm10
pshufd $78, %xmm9, %xmm12
paddd %xmm10, %xmm12
pxor %xmm12, %xmm7
movzbl 25(%rax), %r11d
movdqa %xmm7, %xmm8
psrld $12, %xmm8
pslld $20, %xmm7
por %xmm7, %xmm8
movd (%r11,%rsi), %xmm7
movzbl 27(%rax), %r11d
movd (%r11,%rsi), %xmm9
movzbl 29(%rax), %r11d
punpcklqdq %xmm9, %xmm7
movd (%r11,%rsi), %xmm9
movzbl 31(%rax), %r11d
addq $32, %rax
cmpq %r9, %rax
movd (%r11,%rsi), %xmm11
punpcklqdq %xmm11, %xmm9
shufps $136, %xmm9, %xmm7
paddd %xmm7, %xmm4
paddd %xmm8, %xmm4
pxor %xmm4, %xmm10
pshufb %xmm5, %xmm10
paddd %xmm10, %xmm12
pxor %xmm12, %xmm8
movdqa %xmm8, %xmm13
pslld $25, %xmm8
psrld $7, %xmm13
por %xmm8, %xmm13
pshufd $57, %xmm10, %xmm7
pshufd $78, %xmm12, %xmm9
pshufd $147, %xmm13, %xmm12
jb blake2s_blocks_ssse3_22
blake2s_blocks_ssse3_23:
pxor %xmm9, %xmm4
pxor %xmm7, %xmm12
pxor %xmm1, %xmm4
pxor %xmm0, %xmm12
cmpq $64, %rdx
ja blake2s_blocks_ssse3_24
blake2s_blocks_ssse3_25:
movdqu %xmm4, (%r10)
movdqu %xmm12, 16(%r10)
blake2s_blocks_ssse3_28:
movq %rbp, %rsp
popq %rbp
ret
FN_END blake2s_blocks_ssse3


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



