#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_avx
pushl %ebp
movl $64, %eax
movl %esp, %ebp
pushl %edi
pushl %esi
pushl %ebx
andl $-64, %esp
addl $-128, %esp
cmpl $64, 16(%ebp)
movl 12(%ebp), %esi
cmovbe 16(%ebp), %eax
movl %eax, 48(%esp)
movl 8(%ebp), %eax
movl 40(%eax), %eax
testl %eax, %eax
jne blake2s_blocks_avx_33
blake2s_blocks_avx_2:
movl 8(%ebp), %eax
LOAD_VAR_PIC blake2s_constants_ssse3, %ebx
vmovdqa 0(%ebx), %xmm1
vmovdqu (%eax), %xmm0
addl $32, %eax
vmovdqa %xmm0, 32(%esp)
vmovdqu -16(%eax), %xmm0
movl %eax, 12(%esp)
movl 8(%ebp), %eax
vmovdqa %xmm0, 16(%esp)
vmovdqa 16(%ebx), %xmm0
movl 32(%eax), %eax
movl %eax, 52(%esp)
blake2s_blocks_avx_12:
LOAD_VAR_PIC blake2s_sigma, %ebx
leal 0(%ebx), %eax
movl %eax, 8(%esp)
leal 160(%ebx), %eax
movl %eax, 56(%esp)
movl 52(%esp), %eax
movl 48(%esp), %edi
movl 8(%ebp), %ecx
addl %edi, %eax
cmpl %eax, %edi
movl %eax, 52(%esp)
movl %eax, 32(%ecx)
jbe blake2s_blocks_avx_8
addl $1, 36(%ecx)
blake2s_blocks_avx_8:
movl 12(%esp), %eax
xorl %ecx, %ecx
movl %esi, %edx
vmovdqa 160(%ebx), %xmm3
vmovdqa 16(%esp), %xmm2
vmovdqa 32(%esp), %xmm5
vmovdqu (%eax), %xmm4
movl %esi, 12(%ebp)
movl 8(%esp), %eax
vpxor 176(%ebx), %xmm4, %xmm4
jmp blake2s_blocks_avx_10
.p2align 4,,10
.p2align 3
blake2s_blocks_avx_34:
movzbl (%edx), %ecx
movl 12(%ebp), %edx
blake2s_blocks_avx_10:
movzbl 2(%eax), %esi
movzbl 4(%eax), %edi
movl %esi, 60(%esp)
movzbl 6(%eax), %esi
vmovd (%edx,%edi), %xmm7
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm7, %xmm6
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %edx
movzbl 1(%eax), %ecx
movzbl 7(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 3(%eax), %edi
vpunpcklqdq %xmm6, %xmm7, %xmm7
movl 12(%ebp), %edx
vpaddd %xmm7, %xmm5, %xmm5
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movzbl 5(%eax), %edi
vpxor %xmm3, %xmm2, %xmm2
vpslld $20, %xmm2, %xmm6
vpsrld $12, %xmm2, %xmm2
vpor %xmm6, %xmm2, %xmm2
vmovd (%edx,%edi), %xmm7
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm7, %xmm6
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %edx
movzbl 8(%eax), %ecx
movzbl 14(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 10(%eax), %edi
vpunpcklqdq %xmm6, %xmm7, %xmm7
movl 12(%ebp), %edx
vpaddd %xmm7, %xmm5, %xmm5
vpaddd %xmm2, %xmm5, %xmm7
vpxor %xmm7, %xmm4, %xmm4
vpshufb %xmm0, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movzbl 12(%eax), %edi
vpxor %xmm3, %xmm2, %xmm2
vpslld $25, %xmm2, %xmm5
vpshufd $147, %xmm4, %xmm4
vpshufd $78, %xmm3, %xmm3
vpsrld $7, %xmm2, %xmm6
vpor %xmm5, %xmm6, %xmm6
vpshufd $57, %xmm6, %xmm6
vmovd (%edx,%edi), %xmm5
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm5, %xmm2
vmovd (%edx,%ecx), %xmm5
movl 60(%esp), %edx
movzbl 9(%eax), %ecx
vpinsrd $1, (%edi,%edx), %xmm5, %xmm5
movzbl 11(%eax), %edi
vpunpcklqdq %xmm2, %xmm5, %xmm5
vpaddd %xmm5, %xmm7, %xmm5
vpaddd %xmm6, %xmm5, %xmm5
vpxor %xmm5, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movl 12(%ebp), %edx
vpxor %xmm3, %xmm6, %xmm6
movzbl 13(%eax), %edi
vpslld $20, %xmm6, %xmm7
movzbl 15(%eax), %esi
vpsrld $12, %xmm6, %xmm2
vpor %xmm7, %xmm2, %xmm2
vmovd (%edx,%ecx), %xmm7
vmovd (%edx,%edi), %xmm6
movl %edx, %edi
movzbl 16(%eax), %ecx
vpinsrd $1, (%edx,%esi), %xmm6, %xmm6
movl 60(%esp), %edx
movzbl 22(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 18(%eax), %edi
vpunpcklqdq %xmm6, %xmm7, %xmm7
movl 12(%ebp), %edx
vpaddd %xmm7, %xmm5, %xmm7
vpaddd %xmm2, %xmm7, %xmm7
vpxor %xmm7, %xmm4, %xmm4
vpshufb %xmm0, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movzbl 20(%eax), %edi
vpxor %xmm3, %xmm2, %xmm2
vpslld $25, %xmm2, %xmm5
vpshufd $57, %xmm4, %xmm4
vpshufd $78, %xmm3, %xmm3
vpsrld $7, %xmm2, %xmm6
vpor %xmm5, %xmm6, %xmm6
vpshufd $147, %xmm6, %xmm6
vmovd (%edx,%edi), %xmm5
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm5, %xmm2
vmovd (%edx,%ecx), %xmm5
movl 60(%esp), %edx
movzbl 17(%eax), %ecx
movzbl 23(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm5, %xmm5
movzbl 19(%eax), %edi
vpunpcklqdq %xmm2, %xmm5, %xmm2
movl 12(%ebp), %edx
vpaddd %xmm2, %xmm7, %xmm2
vpaddd %xmm6, %xmm2, %xmm2
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movzbl 21(%eax), %edi
vpxor %xmm3, %xmm6, %xmm6
vpslld $20, %xmm6, %xmm7
vpsrld $12, %xmm6, %xmm5
vpor %xmm7, %xmm5, %xmm5
vmovd (%edx,%ecx), %xmm7
vmovd (%edx,%edi), %xmm6
movl %edx, %edi
movzbl 24(%eax), %ecx
vpinsrd $1, (%edx,%esi), %xmm6, %xmm6
movl 60(%esp), %edx
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 26(%eax), %edi
vpunpcklqdq %xmm6, %xmm7, %xmm7
vpaddd %xmm7, %xmm2, %xmm7
vpaddd %xmm5, %xmm7, %xmm7
vpxor %xmm7, %xmm4, %xmm4
vpshufb %xmm0, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movzbl 28(%eax), %edi
vpxor %xmm3, %xmm5, %xmm5
movl 12(%ebp), %edx
vpslld $25, %xmm5, %xmm6
vpshufd $147, %xmm4, %xmm4
movzbl 30(%eax), %esi
vpsrld $7, %xmm5, %xmm2
vpshufd $78, %xmm3, %xmm3
vpor %xmm6, %xmm2, %xmm2
vpshufd $57, %xmm2, %xmm2
vmovd (%edx,%edi), %xmm6
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm6, %xmm5
vmovd (%edx,%ecx), %xmm6
movl 60(%esp), %edx
movzbl 25(%eax), %ecx
movzbl 31(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm6, %xmm6
movzbl 27(%eax), %edi
vpunpcklqdq %xmm5, %xmm6, %xmm5
movl 12(%ebp), %edx
vpaddd %xmm5, %xmm7, %xmm5
vpaddd %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
movl %edi, 60(%esp)
movzbl 29(%eax), %edi
vpxor %xmm3, %xmm2, %xmm2
vpslld $20, %xmm2, %xmm7
vpsrld $12, %xmm2, %xmm6
vpor %xmm7, %xmm6, %xmm6
vmovd (%edx,%edi), %xmm7
vpinsrd $1, (%edx,%esi), %xmm7, %xmm2
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %ecx
vpinsrd $1, (%edx,%ecx), %xmm7, %xmm7
leal 32(%eax), %edx
vpunpcklqdq %xmm2, %xmm7, %xmm2
cmpl 56(%esp), %edx
vpaddd %xmm2, %xmm5, %xmm2
movl %edx, %eax
vpaddd %xmm6, %xmm2, %xmm2
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm0, %xmm4, %xmm4
vpaddd %xmm4, %xmm3, %xmm3
vpxor %xmm3, %xmm6, %xmm6
vmovdqa %xmm2, %xmm5
vpslld $25, %xmm6, %xmm2
vpsrld $7, %xmm6, %xmm6
vpshufd $57, %xmm4, %xmm4
vpshufd $78, %xmm3, %xmm3
vpor %xmm2, %xmm6, %xmm2
vpshufd $147, %xmm2, %xmm2
jb blake2s_blocks_avx_34
cmpl $64, 16(%ebp)
vpxor %xmm3, %xmm5, %xmm3
vpxor %xmm4, %xmm2, %xmm2
vpxor 32(%esp), %xmm3, %xmm3
movl 12(%ebp), %esi
vmovdqa %xmm3, 32(%esp)
vpxor 16(%esp), %xmm2, %xmm3
vmovdqa %xmm3, 16(%esp)
jbe blake2s_blocks_avx_11
addl 20(%ebp), %esi
subl $64, 16(%ebp)
jmp blake2s_blocks_avx_12
blake2s_blocks_avx_11:
movl 8(%ebp), %eax
vmovdqa 32(%esp), %xmm1
vmovdqu %xmm1, (%eax)
movl 8(%ebp), %eax
vmovdqa 16(%esp), %xmm1
vmovdqu %xmm1, 16(%eax)
leal -12(%ebp), %esp
popl %ebx
popl %esi
popl %edi
popl %ebp
ret
blake2s_blocks_avx_33:
cmpl $64, 16(%ebp)
je blake2s_blocks_avx_2
testb $32, 16(%ebp)
leal 64(%esp), %edi
vpxor %xmm0, %xmm0, %xmm0
movl %edi, %eax
vmovdqa %ymm0, 64(%esp)
vmovdqa %ymm0, 96(%esp)
jne blake2s_blocks_avx_35
blake2s_blocks_avx_3:
testb $16, 16(%ebp)
jne blake2s_blocks_avx_36
blake2s_blocks_avx_4:
testb $8, 16(%ebp)
je blake2s_blocks_avx_5
movl (%esi), %edx
addl $8, %eax
addl $8, %esi
movl -4(%esi), %ecx
movl %edx, -8(%eax)
movl %ecx, -4(%eax)
blake2s_blocks_avx_5:
testb $4, 16(%ebp)
je blake2s_blocks_avx_6
movl (%esi), %ecx
addl $4, %eax
addl $4, %esi
movl %ecx, -4(%eax)
blake2s_blocks_avx_6:
testb $2, 16(%ebp)
je blake2s_blocks_avx_7
movzwl (%esi), %ecx
addl $2, %eax
addl $2, %esi
movw %cx, -2(%eax)
blake2s_blocks_avx_7:
testb $1, 16(%ebp)
je blake2s_blocks_avx_14
movzbl (%esi), %ecx
movl %edi, %esi
movb %cl, (%eax)
vzeroupper
jmp blake2s_blocks_avx_2
blake2s_blocks_avx_14:
movl %edi, %esi
vzeroupper
jmp blake2s_blocks_avx_2
blake2s_blocks_avx_36:
vmovdqu (%esi), %xmm0
addl $16, %eax
addl $16, %esi
vmovdqa %xmm0, -16(%eax)
jmp blake2s_blocks_avx_4
blake2s_blocks_avx_35:
vmovdqu (%esi), %ymm0
leal 96(%esp), %eax
addl $32, %esi
vmovdqa %ymm0, 64(%esp)
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



