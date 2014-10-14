#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_ssse3
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $180, %esp
movl $64, %ebx
LOAD_VAR_PIC blake2s_constants_ssse3, %esi
movdqa 0(%esi), %xmm3
movdqa 16(%esi), %xmm0
movl 8(%ebp), %edi
movl 16(%ebp), %ecx
cmpl $64, %ecx
movl 12(%ebp), %edx
LOAD_VAR_PIC blake2s_sigma, %esi
lea 160(%esi), %eax
cmovbe %ecx, %ebx
movl %eax, 128(%esp)
cmpl $0, 40(%edi)
je blake2s_blocks_ssse3_18
blake2s_blocks_ssse3_2:
cmpl $64, %ecx
je blake2s_blocks_ssse3_18
blake2s_blocks_ssse3_3:
lea (%esp), %eax
movl %eax, 68(%esp)
pxor %xmm1, %xmm1
movdqa %xmm1, (%eax)
movdqa %xmm1, 16(%esp)
movdqa %xmm1, 32(%esp)
movdqa %xmm1, 48(%esp)
testb $32, %cl
je blake2s_blocks_ssse3_5
blake2s_blocks_ssse3_4:
movdqu (%edx), %xmm1
movdqa %xmm1, (%esp)
lea 32(%esp), %eax
movdqu 16(%edx), %xmm2
movdqa %xmm2, 16(%esp)
addl $32, %edx
movl %eax, 68(%esp)
blake2s_blocks_ssse3_5:
testb $16, %cl
je blake2s_blocks_ssse3_7
blake2s_blocks_ssse3_6:
movdqu (%edx), %xmm1
movdqa %xmm1, (%eax)
addl $16, %eax
movl %eax, 68(%esp)
addl $16, %edx
blake2s_blocks_ssse3_7:
testb $8, %cl
je blake2s_blocks_ssse3_9
blake2s_blocks_ssse3_8:
movl %eax, %edi
movl %ebx, 64(%esp)
movl (%edx), %eax
movl 4(%edx), %ebx
addl $8, %edx
movl %eax, (%edi)
movl %ebx, 4(%edi)
addl $8, %edi
movl %edi, 68(%esp)
movl 64(%esp), %ebx
blake2s_blocks_ssse3_9:
testb $4, %cl
je blake2s_blocks_ssse3_11
blake2s_blocks_ssse3_10:
movl 68(%esp), %edi
movl (%edx), %eax
addl $4, %edx
movl %eax, (%edi)
addl $4, %edi
movl %edi, 68(%esp)
blake2s_blocks_ssse3_11:
testb $2, %cl
je blake2s_blocks_ssse3_13
blake2s_blocks_ssse3_12:
movl 68(%esp), %edi
movzwl (%edx), %eax
addl $2, %edx
movw %ax, (%edi)
addl $2, %edi
movl %edi, 68(%esp)
blake2s_blocks_ssse3_13:
testb $1, %cl
je blake2s_blocks_ssse3_15
blake2s_blocks_ssse3_14:
movzbl (%edx), %eax
movl 68(%esp), %edx
movb %al, (%edx)
blake2s_blocks_ssse3_15:
lea (%esp), %edx
blake2s_blocks_ssse3_18:
movl 8(%ebp), %eax
lea 0(%esi), %edi
movl %edi, 136(%esp)
movdqa 176(%esi), %xmm6
movdqu (%eax), %xmm1
movdqu 16(%eax), %xmm2
movl 32(%eax), %eax
movdqa 160(%esi), %xmm5
movdqa %xmm0, 160(%esp)
movdqa %xmm3, 144(%esp)
movl 8(%ebp), %edi
jmp blake2s_blocks_ssse3_19
blake2s_blocks_ssse3_24:
addl 20(%ebp), %edx
addl $-64, %ecx
blake2s_blocks_ssse3_19:
addl %ebx, %eax
movdqa %xmm1, %xmm0
movl %eax, 32(%edi)
movdqa %xmm2, %xmm7
cmpl %ebx, %eax
jae blake2s_blocks_ssse3_21
blake2s_blocks_ssse3_20:
incl 36(%edi)
blake2s_blocks_ssse3_21:
movdqu 32(%edi), %xmm3
movl %ecx, 132(%esp)
movdqa %xmm5, %xmm4
movl 136(%esp), %esi
pxor %xmm6, %xmm3
movl 128(%esp), %ecx
movdqa %xmm7, 112(%esp)
movdqa %xmm0, 96(%esp)
movdqa %xmm5, 80(%esp)
movdqa %xmm6, 64(%esp)
blake2s_blocks_ssse3_22:
movzbl (%esi), %edi
movd (%edi,%edx), %xmm7
movzbl 2(%esi), %edi
movd (%edi,%edx), %xmm0
movzbl 4(%esi), %edi
punpcklqdq %xmm0, %xmm7
movdqa 144(%esp), %xmm0
movd (%edi,%edx), %xmm6
movzbl 6(%esi), %edi
movd (%edi,%edx), %xmm5
punpcklqdq %xmm5, %xmm6
shufps $136, %xmm6, %xmm7
paddd %xmm7, %xmm1
paddd %xmm2, %xmm1
pxor %xmm1, %xmm3
pshufb %xmm0, %xmm3
paddd %xmm3, %xmm4
pxor %xmm4, %xmm2
movzbl 1(%esi), %edi
movdqa %xmm2, %xmm7
psrld $12, %xmm7
pslld $20, %xmm2
por %xmm2, %xmm7
movd (%edi,%edx), %xmm2
movzbl 3(%esi), %edi
movd (%edi,%edx), %xmm5
movzbl 5(%esi), %edi
punpcklqdq %xmm5, %xmm2
movd (%edi,%edx), %xmm5
movzbl 7(%esi), %edi
movd (%edi,%edx), %xmm6
punpcklqdq %xmm6, %xmm5
shufps $136, %xmm5, %xmm2
paddd %xmm2, %xmm1
paddd %xmm7, %xmm1
pxor %xmm1, %xmm3
pshufb 160(%esp), %xmm3
movzbl 8(%esi), %edi
paddd %xmm3, %xmm4
pxor %xmm4, %xmm7
movdqa %xmm7, %xmm2
pslld $25, %xmm7
movd (%edi,%edx), %xmm6
psrld $7, %xmm2
movzbl 10(%esi), %edi
por %xmm7, %xmm2
pshufd $57, %xmm2, %xmm2
pshufd $147, %xmm3, %xmm3
movd (%edi,%edx), %xmm7
movzbl 12(%esi), %edi
punpcklqdq %xmm7, %xmm6
pshufd $78, %xmm4, %xmm4
movd (%edi,%edx), %xmm7
movzbl 14(%esi), %edi
movd (%edi,%edx), %xmm5
punpcklqdq %xmm5, %xmm7
shufps $136, %xmm7, %xmm6
paddd %xmm6, %xmm1
paddd %xmm2, %xmm1
pxor %xmm1, %xmm3
pshufb %xmm0, %xmm3
movzbl 9(%esi), %edi
paddd %xmm3, %xmm4
pxor %xmm4, %xmm2
movdqa %xmm2, %xmm5
pslld $20, %xmm2
movd (%edi,%edx), %xmm7
psrld $12, %xmm5
movzbl 11(%esi), %edi
por %xmm2, %xmm5
movd (%edi,%edx), %xmm2
movzbl 13(%esi), %edi
punpcklqdq %xmm2, %xmm7
movd (%edi,%edx), %xmm2
movzbl 15(%esi), %edi
movd (%edi,%edx), %xmm6
punpcklqdq %xmm6, %xmm2
shufps $136, %xmm2, %xmm7
paddd %xmm7, %xmm1
movzbl 16(%esi), %edi
paddd %xmm5, %xmm1
pxor %xmm1, %xmm3
pshufb 160(%esp), %xmm3
movd (%edi,%edx), %xmm6
paddd %xmm3, %xmm4
movzbl 18(%esi), %edi
pxor %xmm4, %xmm5
movdqa %xmm5, %xmm7
pslld $25, %xmm5
psrld $7, %xmm7
movd (%edi,%edx), %xmm2
por %xmm5, %xmm7
movzbl 20(%esi), %edi
punpcklqdq %xmm2, %xmm6
pshufd $147, %xmm7, %xmm5
movd (%edi,%edx), %xmm2
movzbl 22(%esi), %edi
movd (%edi,%edx), %xmm7
punpcklqdq %xmm7, %xmm2
shufps $136, %xmm2, %xmm6
paddd %xmm6, %xmm1
pshufd $57, %xmm3, %xmm7
paddd %xmm5, %xmm1
pxor %xmm1, %xmm7
pshufb %xmm0, %xmm7
pshufd $78, %xmm4, %xmm6
paddd %xmm7, %xmm6
pxor %xmm6, %xmm5
movzbl 17(%esi), %edi
movdqa %xmm5, %xmm2
psrld $12, %xmm2
pslld $20, %xmm5
por %xmm5, %xmm2
movd (%edi,%edx), %xmm5
movzbl 19(%esi), %edi
movd (%edi,%edx), %xmm3
movzbl 21(%esi), %edi
punpcklqdq %xmm3, %xmm5
movd (%edi,%edx), %xmm3
movzbl 23(%esi), %edi
movd (%edi,%edx), %xmm4
punpcklqdq %xmm4, %xmm3
shufps $136, %xmm3, %xmm5
paddd %xmm5, %xmm1
paddd %xmm2, %xmm1
pxor %xmm1, %xmm7
pshufb 160(%esp), %xmm7
movzbl 24(%esi), %edi
paddd %xmm7, %xmm6
pxor %xmm6, %xmm2
movdqa %xmm2, %xmm5
pslld $25, %xmm2
movd (%edi,%edx), %xmm3
psrld $7, %xmm5
movzbl 26(%esi), %edi
por %xmm2, %xmm5
pshufd $57, %xmm5, %xmm5
pshufd $78, %xmm6, %xmm6
movd (%edi,%edx), %xmm2
movzbl 28(%esi), %edi
punpcklqdq %xmm2, %xmm3
movd (%edi,%edx), %xmm2
movzbl 30(%esi), %edi
movd (%edi,%edx), %xmm4
punpcklqdq %xmm4, %xmm2
shufps $136, %xmm2, %xmm3
paddd %xmm3, %xmm1
pshufd $147, %xmm7, %xmm3
paddd %xmm5, %xmm1
pxor %xmm1, %xmm3
pshufb %xmm0, %xmm3
movzbl 25(%esi), %edi
paddd %xmm3, %xmm6
pxor %xmm6, %xmm5
movdqa %xmm5, %xmm2
pslld $20, %xmm5
movd (%edi,%edx), %xmm4
psrld $12, %xmm2
movzbl 27(%esi), %edi
por %xmm5, %xmm2
movd (%edi,%edx), %xmm5
movzbl 29(%esi), %edi
punpcklqdq %xmm5, %xmm4
movd (%edi,%edx), %xmm5
movzbl 31(%esi), %edi
movd (%edi,%edx), %xmm7
punpcklqdq %xmm7, %xmm5
shufps $136, %xmm5, %xmm4
paddd %xmm4, %xmm1
paddd %xmm2, %xmm1
pxor %xmm1, %xmm3
pshufb 160(%esp), %xmm3
paddd %xmm3, %xmm6
pxor %xmm6, %xmm2
movzbl 32(%esi), %edi
movdqa %xmm2, %xmm4
psrld $7, %xmm4
pslld $25, %xmm2
por %xmm2, %xmm4
movd (%edi,%edx), %xmm2
movzbl 34(%esi), %edi
pshufd $147, %xmm4, %xmm4
pshufd $57, %xmm3, %xmm3
movd (%edi,%edx), %xmm7
movzbl 36(%esi), %edi
punpcklqdq %xmm7, %xmm2
movd (%edi,%edx), %xmm7
movzbl 38(%esi), %edi
movd (%edi,%edx), %xmm5
punpcklqdq %xmm5, %xmm7
shufps $136, %xmm7, %xmm2
paddd %xmm2, %xmm1
paddd %xmm4, %xmm1
pxor %xmm1, %xmm3
pshufb %xmm0, %xmm3
movzbl 33(%esi), %edi
pshufd $78, %xmm6, %xmm2
paddd %xmm3, %xmm2
pxor %xmm2, %xmm4
movd (%edi,%edx), %xmm6
movdqa %xmm4, %xmm7
movzbl 35(%esi), %edi
psrld $12, %xmm7
pslld $20, %xmm4
por %xmm4, %xmm7
movd (%edi,%edx), %xmm4
movzbl 37(%esi), %edi
punpcklqdq %xmm4, %xmm6
movd (%edi,%edx), %xmm4
movzbl 39(%esi), %edi
movd (%edi,%edx), %xmm5
punpcklqdq %xmm5, %xmm4
shufps $136, %xmm4, %xmm6
paddd %xmm6, %xmm1
paddd %xmm7, %xmm1
pxor %xmm1, %xmm3
pshufb 160(%esp), %xmm3
movzbl 40(%esi), %edi
paddd %xmm3, %xmm2
pxor %xmm2, %xmm7
movdqa %xmm7, %xmm6
pslld $25, %xmm7
movd (%edi,%edx), %xmm5
psrld $7, %xmm6
movzbl 42(%esi), %edi
por %xmm7, %xmm6
pshufd $57, %xmm6, %xmm4
movd (%edi,%edx), %xmm6
movzbl 44(%esi), %edi
punpcklqdq %xmm6, %xmm5
movd (%edi,%edx), %xmm6
movzbl 46(%esi), %edi
movd (%edi,%edx), %xmm7
punpcklqdq %xmm7, %xmm6
shufps $136, %xmm6, %xmm5
paddd %xmm5, %xmm1
pshufd $147, %xmm3, %xmm5
paddd %xmm4, %xmm1
pxor %xmm1, %xmm5
movzbl 41(%esi), %edi
pshufb %xmm0, %xmm5
movd (%edi,%edx), %xmm7
movzbl 43(%esi), %edi
pshufd $78, %xmm2, %xmm6
paddd %xmm5, %xmm6
pxor %xmm6, %xmm4
movd (%edi,%edx), %xmm2
movdqa %xmm4, %xmm3
movzbl 45(%esi), %edi
psrld $12, %xmm3
pslld $20, %xmm4
por %xmm4, %xmm3
movd (%edi,%edx), %xmm4
movzbl 47(%esi), %edi
punpcklqdq %xmm2, %xmm7
movd (%edi,%edx), %xmm2
punpcklqdq %xmm2, %xmm4
shufps $136, %xmm4, %xmm7
paddd %xmm7, %xmm1
paddd %xmm3, %xmm1
pxor %xmm1, %xmm5
pshufb 160(%esp), %xmm5
movzbl 48(%esi), %edi
paddd %xmm5, %xmm6
pxor %xmm6, %xmm3
movdqa %xmm3, %xmm7
pslld $25, %xmm3
movd (%edi,%edx), %xmm4
psrld $7, %xmm7
movzbl 50(%esi), %edi
por %xmm3, %xmm7
pshufd $147, %xmm7, %xmm7
pshufd $57, %xmm5, %xmm5
movd (%edi,%edx), %xmm3
movzbl 52(%esi), %edi
punpcklqdq %xmm3, %xmm4
pshufd $78, %xmm6, %xmm6
movd (%edi,%edx), %xmm2
movzbl 54(%esi), %edi
movd (%edi,%edx), %xmm3
punpcklqdq %xmm3, %xmm2
shufps $136, %xmm2, %xmm4
movzbl 49(%esi), %edi
paddd %xmm4, %xmm1
paddd %xmm7, %xmm1
pxor %xmm1, %xmm5
movd (%edi,%edx), %xmm2
movzbl 51(%esi), %edi
pshufb %xmm0, %xmm5
movd (%edi,%edx), %xmm4
paddd %xmm5, %xmm6
movzbl 53(%esi), %edi
pxor %xmm6, %xmm7
punpcklqdq %xmm4, %xmm2
movdqa %xmm7, %xmm3
psrld $12, %xmm3
pslld $20, %xmm7
movd (%edi,%edx), %xmm4
por %xmm7, %xmm3
movzbl 55(%esi), %edi
movd (%edi,%edx), %xmm7
punpcklqdq %xmm7, %xmm4
shufps $136, %xmm4, %xmm2
paddd %xmm2, %xmm1
paddd %xmm3, %xmm1
pxor %xmm1, %xmm5
pshufb 160(%esp), %xmm5
paddd %xmm5, %xmm6
pxor %xmm6, %xmm3
movzbl 56(%esi), %edi
movdqa %xmm3, %xmm2
psrld $7, %xmm2
pslld $25, %xmm3
por %xmm3, %xmm2
movd (%edi,%edx), %xmm3
movzbl 58(%esi), %edi
pshufd $57, %xmm2, %xmm4
pshufd $147, %xmm5, %xmm5
movd (%edi,%edx), %xmm7
movzbl 60(%esi), %edi
punpcklqdq %xmm7, %xmm3
movd (%edi,%edx), %xmm7
movzbl 62(%esi), %edi
movd (%edi,%edx), %xmm2
punpcklqdq %xmm2, %xmm7
shufps $136, %xmm7, %xmm3
paddd %xmm3, %xmm1
paddd %xmm4, %xmm1
pxor %xmm1, %xmm5
movzbl 57(%esi), %edi
pshufb %xmm0, %xmm5
pshufd $78, %xmm6, %xmm2
movd (%edi,%edx), %xmm6
paddd %xmm5, %xmm2
movzbl 59(%esi), %edi
pxor %xmm2, %xmm4
movdqa %xmm4, %xmm3
pslld $20, %xmm4
psrld $12, %xmm3
movd (%edi,%edx), %xmm0
por %xmm4, %xmm3
movzbl 61(%esi), %edi
punpcklqdq %xmm0, %xmm6
movd (%edi,%edx), %xmm4
movzbl 63(%esi), %edi
movl (%edi,%edx), %edi
blake2s_blocks_ssse3_28:
movd %edi, %xmm0
punpcklqdq %xmm0, %xmm4
shufps $136, %xmm4, %xmm6
paddd %xmm6, %xmm1
movzbl 64(%esi), %edi
paddd %xmm3, %xmm1
movdqa 160(%esp), %xmm0
pxor %xmm1, %xmm5
pshufb %xmm0, %xmm5
movd (%edi,%edx), %xmm4
paddd %xmm5, %xmm2
movzbl 66(%esi), %edi
pxor %xmm2, %xmm3
movdqa %xmm3, %xmm7
pslld $25, %xmm3
psrld $7, %xmm7
movd (%edi,%edx), %xmm6
por %xmm3, %xmm7
movzbl 68(%esi), %edi
punpcklqdq %xmm6, %xmm4
pshufd $147, %xmm7, %xmm3
movd (%edi,%edx), %xmm6
movzbl 70(%esi), %edi
pshufd $57, %xmm5, %xmm5
movd (%edi,%edx), %xmm7
punpcklqdq %xmm7, %xmm6
shufps $136, %xmm6, %xmm4
paddd %xmm4, %xmm1
paddd %xmm3, %xmm1
pxor %xmm1, %xmm5
pshufb 144(%esp), %xmm5
movzbl 65(%esi), %edi
pshufd $78, %xmm2, %xmm4
paddd %xmm5, %xmm4
pxor %xmm4, %xmm3
movd (%edi,%edx), %xmm2
movdqa %xmm3, %xmm6
movzbl 67(%esi), %edi
psrld $12, %xmm6
pslld $20, %xmm3
por %xmm3, %xmm6
movd (%edi,%edx), %xmm3
movzbl 69(%esi), %edi
punpcklqdq %xmm3, %xmm2
movd (%edi,%edx), %xmm7
movzbl 71(%esi), %edi
movd (%edi,%edx), %xmm3
punpcklqdq %xmm3, %xmm7
shufps $136, %xmm7, %xmm2
paddd %xmm2, %xmm1
paddd %xmm6, %xmm1
pxor %xmm1, %xmm5
pshufb %xmm0, %xmm5
paddd %xmm5, %xmm4
pxor %xmm4, %xmm6
movzbl 72(%esi), %edi
movdqa %xmm6, %xmm2
psrld $7, %xmm2
pslld $25, %xmm6
por %xmm6, %xmm2
movd (%edi,%edx), %xmm6
movzbl 74(%esi), %edi
pshufd $57, %xmm2, %xmm2
pshufd $78, %xmm4, %xmm4
movd (%edi,%edx), %xmm3
movzbl 76(%esi), %edi
punpcklqdq %xmm3, %xmm6
movd (%edi,%edx), %xmm3
movzbl 78(%esi), %edi
movd (%edi,%edx), %xmm7
punpcklqdq %xmm7, %xmm3
shufps $136, %xmm3, %xmm6
movzbl 73(%esi), %edi
paddd %xmm6, %xmm1
pshufd $147, %xmm5, %xmm3
paddd %xmm2, %xmm1
pxor %xmm1, %xmm3
movd (%edi,%edx), %xmm7
movzbl 75(%esi), %edi
pshufb 144(%esp), %xmm3
movd (%edi,%edx), %xmm5
paddd %xmm3, %xmm4
movzbl 77(%esi), %edi
pxor %xmm4, %xmm2
punpcklqdq %xmm5, %xmm7
movdqa %xmm2, %xmm6
psrld $12, %xmm6
pslld $20, %xmm2
movd (%edi,%edx), %xmm5
por %xmm2, %xmm6
movzbl 79(%esi), %edi
addl $80, %esi
movd (%edi,%edx), %xmm2
punpcklqdq %xmm2, %xmm5
shufps $136, %xmm5, %xmm7
paddd %xmm7, %xmm1
paddd %xmm6, %xmm1
pxor %xmm1, %xmm3
pshufb %xmm0, %xmm3
paddd %xmm3, %xmm4
pxor %xmm4, %xmm6
movdqa %xmm6, %xmm0
pslld $25, %xmm6
psrld $7, %xmm0
por %xmm6, %xmm0
pshufd $57, %xmm3, %xmm3
pshufd $78, %xmm4, %xmm4
pshufd $147, %xmm0, %xmm2
cmpl %ecx, %esi
jb blake2s_blocks_ssse3_22
blake2s_blocks_ssse3_23:
movdqa 112(%esp), %xmm7
pxor %xmm4, %xmm1
movdqa 96(%esp), %xmm0
pxor %xmm3, %xmm2
movl 132(%esp), %ecx
pxor %xmm0, %xmm1
movdqa 80(%esp), %xmm5
pxor %xmm7, %xmm2
movdqa 64(%esp), %xmm6
movl 8(%ebp), %edi
cmpl $64, %ecx
ja blake2s_blocks_ssse3_24
blake2s_blocks_ssse3_25:
movl 8(%ebp), %eax
movdqu %xmm1, (%eax)
movdqu %xmm2, 16(%eax)
addl $180, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
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



