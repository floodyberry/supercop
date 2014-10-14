#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_sse2
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $180, %esp
pushl $64
popl %eax
LOAD_VAR_PIC blake2s_sigma, %ecx
movl 8(%ebp), %edx
movl 16(%ebp), %esi
cmpl $64, %esi
movl 12(%ebp), %ebx
cmovbe %esi, %eax
movl %ecx, 72(%esp)
lea 160(%ecx), %ecx
movl %eax, 68(%esp)
cmpl $0, 40(%edx)
je blake2s_blocks_sse2_18
blake2s_blocks_sse2_2:
cmpl $64, %esi
je blake2s_blocks_sse2_18
blake2s_blocks_sse2_4:
testl $32, %esi
lea (%esp), %eax
pxor %xmm0, %xmm0
movdqa %xmm0, (%eax)
movdqa %xmm0, 16(%esp)
movdqa %xmm0, 32(%esp)
movdqa %xmm0, 48(%esp)
je blake2s_blocks_sse2_6
blake2s_blocks_sse2_5:
movdqu (%ebx), %xmm0
movdqa %xmm0, (%esp)
lea 32(%esp), %eax
movdqu 16(%ebx), %xmm1
movdqa %xmm1, 16(%esp)
addl $32, %ebx
blake2s_blocks_sse2_6:
testl $16, %esi
je blake2s_blocks_sse2_8
blake2s_blocks_sse2_7:
movdqu (%ebx), %xmm0
movdqa %xmm0, (%eax)
addl $16, %ebx
addl $16, %eax
blake2s_blocks_sse2_8:
testl $8, %esi
je blake2s_blocks_sse2_10
blake2s_blocks_sse2_9:
movl (%ebx), %edx
movl 4(%ebx), %edi
addl $8, %ebx
movl %edx, (%eax)
movl %edi, 4(%eax)
addl $8, %eax
blake2s_blocks_sse2_10:
testl $4, %esi
je blake2s_blocks_sse2_12
blake2s_blocks_sse2_11:
movl (%ebx), %edx
addl $4, %ebx
movl %edx, (%eax)
addl $4, %eax
blake2s_blocks_sse2_12:
testl $2, %esi
je blake2s_blocks_sse2_14
blake2s_blocks_sse2_13:
movzwl (%ebx), %edx
addl $2, %ebx
movw %dx, (%eax)
addl $2, %eax
blake2s_blocks_sse2_14:
testl $1, %esi
je blake2s_blocks_sse2_16
blake2s_blocks_sse2_15:
movzbl (%ebx), %edx
movb %dl, (%eax)
blake2s_blocks_sse2_16:
lea (%esp), %ebx
blake2s_blocks_sse2_18:
movl 72(%esp), %edi
movl 8(%ebp), %edx
movdqa 176(%edi), %xmm1
lea 0(%edi), %eax
movdqa 160(%edi), %xmm3
movdqu (%edx), %xmm0
movdqu 16(%edx), %xmm2
movl 32(%edx), %edx
movdqa %xmm1, 112(%esp)
movl %eax, 64(%esp)
movdqa %xmm3, 96(%esp)
jmp blake2s_blocks_sse2_19
blake2s_blocks_sse2_24:
addl 20(%ebp), %ebx
addl $-64, %esi
blake2s_blocks_sse2_19:
movl 8(%ebp), %eax
movdqa %xmm2, %xmm1
movl 68(%esp), %edi
addl %edi, %edx
movdqa %xmm0, 80(%esp)
cmpl %edi, %edx
movl %edx, 32(%eax)
jae blake2s_blocks_sse2_21
blake2s_blocks_sse2_20:
movl 8(%ebp), %eax
incl 36(%eax)
blake2s_blocks_sse2_21:
movl 8(%ebp), %eax
movdqa 96(%esp), %xmm3
movdqu 32(%eax), %xmm4
pxor 112(%esp), %xmm4
movl 64(%esp), %eax
blake2s_blocks_sse2_22:
movzbl (%eax), %edi
movd (%edi,%ebx), %xmm5
movzbl 2(%eax), %edi
movd (%edi,%ebx), %xmm7
movzbl 4(%eax), %edi
punpcklqdq %xmm7, %xmm5
movd (%edi,%ebx), %xmm7
movzbl 6(%eax), %edi
movd (%edi,%ebx), %xmm6
punpcklqdq %xmm6, %xmm7
shufps $136, %xmm7, %xmm5
paddd %xmm5, %xmm0
paddd %xmm2, %xmm0
pxor %xmm0, %xmm4
pshuflw $177, %xmm4, %xmm4
pshufhw $177, %xmm4, %xmm4
paddd %xmm4, %xmm3
pxor %xmm3, %xmm2
movzbl 1(%eax), %edi
movdqa %xmm2, %xmm6
psrld $12, %xmm6
pslld $20, %xmm2
por %xmm2, %xmm6
movd (%edi,%ebx), %xmm2
movzbl 3(%eax), %edi
movd (%edi,%ebx), %xmm5
movzbl 5(%eax), %edi
punpcklqdq %xmm5, %xmm2
movd (%edi,%ebx), %xmm7
movzbl 7(%eax), %edi
movd (%edi,%ebx), %xmm5
punpcklqdq %xmm5, %xmm7
shufps $136, %xmm7, %xmm2
paddd %xmm2, %xmm0
paddd %xmm6, %xmm0
pxor %xmm0, %xmm4
movdqa %xmm4, %xmm7
pslld $24, %xmm4
psrld $8, %xmm7
movzbl 8(%eax), %edi
por %xmm4, %xmm7
paddd %xmm7, %xmm3
pxor %xmm3, %xmm6
movd (%edi,%ebx), %xmm4
movdqa %xmm6, %xmm2
movzbl 10(%eax), %edi
psrld $7, %xmm2
pslld $25, %xmm6
por %xmm6, %xmm2
movd (%edi,%ebx), %xmm6
movzbl 12(%eax), %edi
punpcklqdq %xmm6, %xmm4
pshufd $57, %xmm2, %xmm2
movd (%edi,%ebx), %xmm5
movzbl 14(%eax), %edi
pshufd $78, %xmm3, %xmm3
movd (%edi,%ebx), %xmm6
punpcklqdq %xmm6, %xmm5
shufps $136, %xmm5, %xmm4
paddd %xmm4, %xmm0
pshufd $147, %xmm7, %xmm4
paddd %xmm2, %xmm0
pxor %xmm0, %xmm4
pshuflw $177, %xmm4, %xmm4
movzbl 9(%eax), %edi
pshufhw $177, %xmm4, %xmm4
paddd %xmm4, %xmm3
pxor %xmm3, %xmm2
movd (%edi,%ebx), %xmm5
movdqa %xmm2, %xmm6
movzbl 11(%eax), %edi
psrld $12, %xmm6
pslld $20, %xmm2
por %xmm2, %xmm6
movd (%edi,%ebx), %xmm2
movzbl 13(%eax), %edi
punpcklqdq %xmm2, %xmm5
movd (%edi,%ebx), %xmm2
movzbl 15(%eax), %edi
movd (%edi,%ebx), %xmm7
punpcklqdq %xmm7, %xmm2
shufps $136, %xmm2, %xmm5
paddd %xmm5, %xmm0
paddd %xmm6, %xmm0
pxor %xmm0, %xmm4
movdqa %xmm4, %xmm2
pslld $24, %xmm4
psrld $8, %xmm2
por %xmm4, %xmm2
paddd %xmm2, %xmm3
pxor %xmm3, %xmm6
movzbl 16(%eax), %edi
movdqa %xmm6, %xmm5
psrld $7, %xmm5
pslld $25, %xmm6
por %xmm6, %xmm5
movd (%edi,%ebx), %xmm6
movzbl 18(%eax), %edi
pshufd $147, %xmm5, %xmm5
movd (%edi,%ebx), %xmm4
movzbl 20(%eax), %edi
punpcklqdq %xmm4, %xmm6
movd (%edi,%ebx), %xmm4
movzbl 22(%eax), %edi
movd (%edi,%ebx), %xmm7
punpcklqdq %xmm7, %xmm4
shufps $136, %xmm4, %xmm6
paddd %xmm6, %xmm0
pshufd $57, %xmm2, %xmm6
paddd %xmm5, %xmm0
pxor %xmm0, %xmm6
pshuflw $177, %xmm6, %xmm4
movzbl 17(%eax), %edi
pshufhw $177, %xmm4, %xmm6
pshufd $78, %xmm3, %xmm7
paddd %xmm6, %xmm7
pxor %xmm7, %xmm5
movd (%edi,%ebx), %xmm2
movdqa %xmm5, %xmm3
movzbl 19(%eax), %edi
psrld $12, %xmm3
pslld $20, %xmm5
por %xmm5, %xmm3
movd (%edi,%ebx), %xmm5
movzbl 21(%eax), %edi
punpcklqdq %xmm5, %xmm2
movd (%edi,%ebx), %xmm5
movzbl 23(%eax), %edi
movd (%edi,%ebx), %xmm4
punpcklqdq %xmm4, %xmm5
shufps $136, %xmm5, %xmm2
paddd %xmm2, %xmm0
paddd %xmm3, %xmm0
pxor %xmm0, %xmm6
movdqa %xmm6, %xmm4
pslld $24, %xmm6
psrld $8, %xmm4
por %xmm6, %xmm4
paddd %xmm4, %xmm7
pxor %xmm7, %xmm3
movzbl 24(%eax), %edi
movdqa %xmm3, %xmm2
psrld $7, %xmm2
pslld $25, %xmm3
por %xmm3, %xmm2
movd (%edi,%ebx), %xmm3
movzbl 26(%eax), %edi
pshufd $57, %xmm2, %xmm6
movd (%edi,%ebx), %xmm2
movzbl 28(%eax), %edi
punpcklqdq %xmm2, %xmm3
movd (%edi,%ebx), %xmm2
movzbl 30(%eax), %edi
movd (%edi,%ebx), %xmm5
punpcklqdq %xmm5, %xmm2
shufps $136, %xmm2, %xmm3
paddd %xmm3, %xmm0
pshufd $147, %xmm4, %xmm3
paddd %xmm6, %xmm0
pxor %xmm0, %xmm3
pshuflw $177, %xmm3, %xmm4
movzbl 25(%eax), %edi
pshufhw $177, %xmm4, %xmm5
pshufd $78, %xmm7, %xmm3
paddd %xmm5, %xmm3
pxor %xmm3, %xmm6
movd (%edi,%ebx), %xmm4
movdqa %xmm6, %xmm2
movzbl 27(%eax), %edi
psrld $12, %xmm2
pslld $20, %xmm6
por %xmm6, %xmm2
movd (%edi,%ebx), %xmm6
movzbl 29(%eax), %edi
punpcklqdq %xmm6, %xmm4
movd (%edi,%ebx), %xmm6
movzbl 31(%eax), %edi
movd (%edi,%ebx), %xmm7
punpcklqdq %xmm7, %xmm6
shufps $136, %xmm6, %xmm4
paddd %xmm4, %xmm0
paddd %xmm2, %xmm0
pxor %xmm0, %xmm5
movdqa %xmm5, %xmm7
pslld $24, %xmm5
psrld $8, %xmm7
por %xmm5, %xmm7
paddd %xmm7, %xmm3
pxor %xmm3, %xmm2
movzbl 32(%eax), %edi
movdqa %xmm2, %xmm4
psrld $7, %xmm4
pslld $25, %xmm2
por %xmm2, %xmm4
movd (%edi,%ebx), %xmm2
movzbl 34(%eax), %edi
pshufd $147, %xmm4, %xmm4
pshufd $78, %xmm3, %xmm3
movd (%edi,%ebx), %xmm5
movzbl 36(%eax), %edi
punpcklqdq %xmm5, %xmm2
movd (%edi,%ebx), %xmm5
movzbl 38(%eax), %edi
movd (%edi,%ebx), %xmm6
punpcklqdq %xmm6, %xmm5
shufps $136, %xmm5, %xmm2
paddd %xmm2, %xmm0
pshufd $57, %xmm7, %xmm2
paddd %xmm4, %xmm0
pxor %xmm0, %xmm2
pshuflw $177, %xmm2, %xmm7
pshufhw $177, %xmm7, %xmm2
paddd %xmm2, %xmm3
pxor %xmm3, %xmm4
movzbl 33(%eax), %edi
movdqa %xmm4, %xmm6
psrld $12, %xmm6
pslld $20, %xmm4
por %xmm4, %xmm6
movd (%edi,%ebx), %xmm4
movzbl 35(%eax), %edi
movd (%edi,%ebx), %xmm5
movzbl 37(%eax), %edi
punpcklqdq %xmm5, %xmm4
movd (%edi,%ebx), %xmm5
movzbl 39(%eax), %edi
movd (%edi,%ebx), %xmm7
punpcklqdq %xmm7, %xmm5
shufps $136, %xmm5, %xmm4
paddd %xmm4, %xmm0
paddd %xmm6, %xmm0
pxor %xmm0, %xmm2
movdqa %xmm2, %xmm5
pslld $24, %xmm2
psrld $8, %xmm5
por %xmm2, %xmm5
paddd %xmm5, %xmm3
pxor %xmm3, %xmm6
movzbl 40(%eax), %edi
movdqa %xmm6, %xmm4
psrld $7, %xmm4
pslld $25, %xmm6
por %xmm6, %xmm4
movd (%edi,%ebx), %xmm6
movzbl 42(%eax), %edi
pshufd $57, %xmm4, %xmm4
movd (%edi,%ebx), %xmm2
movzbl 44(%eax), %edi
punpcklqdq %xmm2, %xmm6
movd (%edi,%ebx), %xmm7
movzbl 46(%eax), %edi
movd (%edi,%ebx), %xmm2
punpcklqdq %xmm2, %xmm7
shufps $136, %xmm7, %xmm6
paddd %xmm6, %xmm0
pshufd $147, %xmm5, %xmm6
paddd %xmm4, %xmm0
pxor %xmm0, %xmm6
pshuflw $177, %xmm6, %xmm2
movzbl 41(%eax), %edi
pshufhw $177, %xmm2, %xmm5
pshufd $78, %xmm3, %xmm6
paddd %xmm5, %xmm6
pxor %xmm6, %xmm4
movd (%edi,%ebx), %xmm3
movdqa %xmm4, %xmm7
movzbl 43(%eax), %edi
psrld $12, %xmm7
pslld $20, %xmm4
por %xmm4, %xmm7
movd (%edi,%ebx), %xmm4
movzbl 45(%eax), %edi
punpcklqdq %xmm4, %xmm3
movd (%edi,%ebx), %xmm2
movzbl 47(%eax), %edi
movd (%edi,%ebx), %xmm4
punpcklqdq %xmm4, %xmm2
shufps $136, %xmm2, %xmm3
paddd %xmm3, %xmm0
paddd %xmm7, %xmm0
pxor %xmm0, %xmm5
movdqa %xmm5, %xmm4
pslld $24, %xmm5
psrld $8, %xmm4
por %xmm5, %xmm4
movzbl 48(%eax), %edi
paddd %xmm4, %xmm6
pxor %xmm6, %xmm7
movdqa %xmm7, %xmm3
pslld $25, %xmm7
movd (%edi,%ebx), %xmm2
psrld $7, %xmm3
movzbl 50(%eax), %edi
por %xmm7, %xmm3
pshufd $147, %xmm3, %xmm7
movd (%edi,%ebx), %xmm3
movzbl 52(%eax), %edi
punpcklqdq %xmm3, %xmm2
movd (%edi,%ebx), %xmm3
movzbl 54(%eax), %edi
movd (%edi,%ebx), %xmm5
punpcklqdq %xmm5, %xmm3
shufps $136, %xmm3, %xmm2
paddd %xmm2, %xmm0
pshufd $57, %xmm4, %xmm2
paddd %xmm7, %xmm0
movzbl 49(%eax), %edi
pxor %xmm0, %xmm2
pshuflw $177, %xmm2, %xmm4
pshufhw $177, %xmm4, %xmm5
movd (%edi,%ebx), %xmm4
movzbl 51(%eax), %edi
pshufd $78, %xmm6, %xmm2
paddd %xmm5, %xmm2
movd (%edi,%ebx), %xmm6
pxor %xmm2, %xmm7
movzbl 53(%eax), %edi
movdqa %xmm7, %xmm3
punpcklqdq %xmm6, %xmm4
psrld $12, %xmm3
pslld $20, %xmm7
movd (%edi,%ebx), %xmm6
por %xmm7, %xmm3
movzbl 55(%eax), %edi
movd (%edi,%ebx), %xmm7
punpcklqdq %xmm7, %xmm6
shufps $136, %xmm6, %xmm4
movzbl 56(%eax), %edi
paddd %xmm4, %xmm0
paddd %xmm3, %xmm0
pxor %xmm0, %xmm5
movd (%edi,%ebx), %xmm6
movdqa %xmm5, %xmm4
movzbl 58(%eax), %edi
psrld $8, %xmm4
pslld $24, %xmm5
por %xmm5, %xmm4
movd (%edi,%ebx), %xmm7
paddd %xmm4, %xmm2
movzbl 60(%eax), %edi
pxor %xmm2, %xmm3
movdqa %xmm3, %xmm5
pslld $25, %xmm3
punpcklqdq %xmm7, %xmm6
psrld $7, %xmm5
movd (%edi,%ebx), %xmm7
por %xmm3, %xmm5
movzbl 62(%eax), %edi
pshufd $57, %xmm5, %xmm3
movd (%edi,%ebx), %xmm5
punpcklqdq %xmm5, %xmm7
shufps $136, %xmm7, %xmm6
paddd %xmm6, %xmm0
paddd %xmm3, %xmm0
blake2s_blocks_sse2_28:
pshufd $147, %xmm4, %xmm4
pxor %xmm0, %xmm4
pshuflw $177, %xmm4, %xmm5
movzbl 57(%eax), %edi
pshufhw $177, %xmm5, %xmm4
pshufd $78, %xmm2, %xmm5
paddd %xmm4, %xmm5
pxor %xmm5, %xmm3
movd (%edi,%ebx), %xmm2
movdqa %xmm3, %xmm6
movzbl 59(%eax), %edi
psrld $12, %xmm6
pslld $20, %xmm3
por %xmm3, %xmm6
movd (%edi,%ebx), %xmm3
movzbl 61(%eax), %edi
punpcklqdq %xmm3, %xmm2
movd (%edi,%ebx), %xmm3
movzbl 63(%eax), %edi
movd (%edi,%ebx), %xmm7
punpcklqdq %xmm7, %xmm3
shufps $136, %xmm3, %xmm2
paddd %xmm2, %xmm0
paddd %xmm6, %xmm0
pxor %xmm0, %xmm4
movdqa %xmm4, %xmm7
pslld $24, %xmm4
psrld $8, %xmm7
por %xmm4, %xmm7
paddd %xmm7, %xmm5
pxor %xmm5, %xmm6
movzbl 64(%eax), %edi
movdqa %xmm6, %xmm2
psrld $7, %xmm2
pslld $25, %xmm6
por %xmm6, %xmm2
movd (%edi,%ebx), %xmm6
movzbl 66(%eax), %edi
pshufd $147, %xmm2, %xmm3
movd (%edi,%ebx), %xmm4
movzbl 68(%eax), %edi
punpcklqdq %xmm4, %xmm6
movd (%edi,%ebx), %xmm4
movzbl 70(%eax), %edi
movd (%edi,%ebx), %xmm2
punpcklqdq %xmm2, %xmm4
shufps $136, %xmm4, %xmm6
paddd %xmm6, %xmm0
pshufd $57, %xmm7, %xmm6
paddd %xmm3, %xmm0
pxor %xmm0, %xmm6
pshuflw $177, %xmm6, %xmm7
pshufhw $177, %xmm7, %xmm6
pshufd $78, %xmm5, %xmm7
paddd %xmm6, %xmm7
pxor %xmm7, %xmm3
movzbl 65(%eax), %edi
movdqa %xmm3, %xmm4
psrld $12, %xmm4
pslld $20, %xmm3
por %xmm3, %xmm4
movd (%edi,%ebx), %xmm3
movzbl 67(%eax), %edi
movd (%edi,%ebx), %xmm5
movzbl 69(%eax), %edi
punpcklqdq %xmm5, %xmm3
movd (%edi,%ebx), %xmm5
movzbl 71(%eax), %edi
movd (%edi,%ebx), %xmm2
punpcklqdq %xmm2, %xmm5
shufps $136, %xmm5, %xmm3
paddd %xmm3, %xmm0
paddd %xmm4, %xmm0
pxor %xmm0, %xmm6
movdqa %xmm6, %xmm5
pslld $24, %xmm6
psrld $8, %xmm5
movzbl 72(%eax), %edi
por %xmm6, %xmm5
paddd %xmm5, %xmm7
pxor %xmm7, %xmm4
movd (%edi,%ebx), %xmm2
movdqa %xmm4, %xmm3
movzbl 74(%eax), %edi
psrld $7, %xmm3
pslld $25, %xmm4
por %xmm4, %xmm3
movd (%edi,%ebx), %xmm4
movzbl 76(%eax), %edi
punpcklqdq %xmm4, %xmm2
pshufd $57, %xmm3, %xmm3
movd (%edi,%ebx), %xmm4
movzbl 78(%eax), %edi
movd (%edi,%ebx), %xmm6
punpcklqdq %xmm6, %xmm4
movzbl 73(%eax), %edi
shufps $136, %xmm4, %xmm2
paddd %xmm2, %xmm0
pshufd $147, %xmm5, %xmm2
paddd %xmm3, %xmm0
movd (%edi,%ebx), %xmm6
pxor %xmm0, %xmm2
movzbl 75(%eax), %edi
pshuflw $177, %xmm2, %xmm5
pshufhw $177, %xmm5, %xmm4
pshufd $78, %xmm7, %xmm5
movd (%edi,%ebx), %xmm7
paddd %xmm4, %xmm5
movzbl 77(%eax), %edi
pxor %xmm5, %xmm3
punpcklqdq %xmm7, %xmm6
movdqa %xmm3, %xmm2
psrld $12, %xmm2
pslld $20, %xmm3
movd (%edi,%ebx), %xmm7
por %xmm3, %xmm2
movzbl 79(%eax), %edi
addl $80, %eax
cmpl %ecx, %eax
movd (%edi,%ebx), %xmm3
punpcklqdq %xmm3, %xmm7
shufps $136, %xmm7, %xmm6
paddd %xmm6, %xmm0
paddd %xmm2, %xmm0
pxor %xmm0, %xmm4
movdqa %xmm4, %xmm6
pslld $24, %xmm4
psrld $8, %xmm6
por %xmm4, %xmm6
paddd %xmm6, %xmm5
pxor %xmm5, %xmm2
pshufd $78, %xmm5, %xmm3
movdqa %xmm2, %xmm5
psrld $7, %xmm5
pslld $25, %xmm2
por %xmm2, %xmm5
pshufd $57, %xmm6, %xmm4
pshufd $147, %xmm5, %xmm2
jb blake2s_blocks_sse2_22
blake2s_blocks_sse2_23:
pxor %xmm3, %xmm0
pxor %xmm4, %xmm2
pxor 80(%esp), %xmm0
pxor %xmm1, %xmm2
cmpl $64, %esi
ja blake2s_blocks_sse2_24
blake2s_blocks_sse2_25:
movl 8(%ebp), %eax
movdqu %xmm0, (%eax)
movdqu %xmm2, 16(%eax)
blake2s_blocks_sse2_29:
addl $180, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
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



