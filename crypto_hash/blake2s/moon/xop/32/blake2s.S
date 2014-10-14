#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2s_blocks_xop
pushl %ebp
movl $64, %eax
movl %esp, %ebp
pushl %edi
pushl %esi
pushl %ebx
andl $-64, %esp
addl $-128, %esp
movl 12(%ebp), %esi
LOAD_VAR_PIC blake2s_sigma, %ebx
cmpl $64, 16(%ebp)
cmovbe 16(%ebp), %eax
movl %eax, 48(%esp)
movl 8(%ebp), %eax
movl 40(%eax), %eax
testl %eax, %eax
jne blake2s_blocks_xop_33
blake2s_blocks_xop_2:
movl 8(%ebp), %eax
vmovdqu (%eax), %xmm5
vmovdqu 16(%eax), %xmm4
addl $32, %eax
movl %eax, 44(%esp)
movl 8(%ebp), %eax
movl 32(%eax), %eax
movl %eax, 52(%esp)
leal 0(%ebx), %eax
movl %eax, 40(%esp)
leal 160(%ebx), %eax
movl %eax, 56(%esp)
blake2s_blocks_xop_12:
movl 52(%esp), %eax
movl 48(%esp), %edi
movl 8(%ebp), %ecx
addl %edi, %eax
cmpl %eax, %edi
movl %eax, 52(%esp)
movl %eax, 32(%ecx)
jbe blake2s_blocks_xop_8
addl $1, 36(%ecx)
blake2s_blocks_xop_8:
movl 44(%esp), %eax
vmovdqa 160(%ebx), %xmm1
vmovdqa %xmm4, %xmm0
vmovdqa %xmm5, %xmm3
xorl %ecx, %ecx
movl %esi, %edx
vmovdqu (%eax), %xmm2
movl 40(%esp), %eax
vpxor 176(%ebx), %xmm2, %xmm2
movl %esi, 12(%ebp)
jmp blake2s_blocks_xop_10
.p2align 4
blake2s_blocks_xop_34:
movzbl (%edx), %ecx
movl 12(%ebp), %edx
blake2s_blocks_xop_10:
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
vpunpcklqdq %xmm6, %xmm7, %xmm6
movl 12(%ebp), %edx
vpaddd %xmm6, %xmm3, %xmm3
vpaddd %xmm0, %xmm3, %xmm3
vpxor %xmm3, %xmm2, %xmm6
vprotd $16, %xmm6, %xmm6
movl %edi, 60(%esp)
movzbl 5(%eax), %edi
vpaddd %xmm6, %xmm1, %xmm1
vpxor %xmm1, %xmm0, %xmm0
vprotd $20, %xmm0, %xmm0
vmovd (%edx,%edi), %xmm7
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm7, %xmm2
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %edx
movzbl 8(%eax), %ecx
movzbl 14(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 10(%eax), %edi
vpunpcklqdq %xmm2, %xmm7, %xmm2
movl 12(%ebp), %edx
vpaddd %xmm2, %xmm3, %xmm3
vpaddd %xmm0, %xmm3, %xmm3
vpxor %xmm3, %xmm6, %xmm6
vprotd $24, %xmm6, %xmm6
movl %edi, 60(%esp)
movzbl 12(%eax), %edi
vpaddd %xmm6, %xmm1, %xmm1
vpxor %xmm1, %xmm0, %xmm0
vprotd $25, %xmm0, %xmm0
vpshufd $147, %xmm6, %xmm6
vpshufd $57, %xmm0, %xmm0
vpshufd $78, %xmm1, %xmm1
vmovd (%edx,%edi), %xmm7
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm7, %xmm2
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %edx
movzbl 9(%eax), %ecx
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 11(%eax), %edi
vpunpcklqdq %xmm2, %xmm7, %xmm2
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm0, %xmm2, %xmm2
vpxor %xmm2, %xmm6, %xmm6
vprotd $16, %xmm6, %xmm6
movl %edi, 60(%esp)
movl 12(%ebp), %edx
vpaddd %xmm6, %xmm1, %xmm1
movzbl 13(%eax), %edi
vpxor %xmm1, %xmm0, %xmm0
vprotd $20, %xmm0, %xmm0
movzbl 15(%eax), %esi
vmovd (%edx,%ecx), %xmm7
movzbl 16(%eax), %ecx
vmovd (%edx,%edi), %xmm3
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm3, %xmm3
movl 60(%esp), %edx
movzbl 22(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 18(%eax), %edi
vpunpcklqdq %xmm3, %xmm7, %xmm3
movl 12(%ebp), %edx
vpaddd %xmm3, %xmm2, %xmm2
vpaddd %xmm0, %xmm2, %xmm3
vpxor %xmm3, %xmm6, %xmm6
vprotd $24, %xmm6, %xmm6
movl %edi, 60(%esp)
movzbl 20(%eax), %edi
vpaddd %xmm6, %xmm1, %xmm1
vpxor %xmm1, %xmm0, %xmm0
vprotd $25, %xmm0, %xmm0
vpshufd $57, %xmm6, %xmm6
vpshufd $147, %xmm0, %xmm0
vpshufd $78, %xmm1, %xmm1
vmovd (%edx,%edi), %xmm7
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm7, %xmm2
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %edx
movzbl 17(%eax), %ecx
movzbl 23(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 19(%eax), %edi
vpunpcklqdq %xmm2, %xmm7, %xmm2
movl 12(%ebp), %edx
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm0, %xmm2, %xmm2
vpxor %xmm2, %xmm6, %xmm6
vprotd $16, %xmm6, %xmm6
movl %edi, 60(%esp)
movzbl 21(%eax), %edi
vpaddd %xmm6, %xmm1, %xmm1
vmovd (%edx,%ecx), %xmm7
movzbl 24(%eax), %ecx
vpxor %xmm1, %xmm0, %xmm0
vprotd $20, %xmm0, %xmm0
vmovd (%edx,%edi), %xmm3
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm3, %xmm3
movl 60(%esp), %edx
vpinsrd $1, (%edi,%edx), %xmm7, %xmm7
movzbl 26(%eax), %edi
vpunpcklqdq %xmm3, %xmm7, %xmm7
vpaddd %xmm7, %xmm2, %xmm7
vpaddd %xmm0, %xmm7, %xmm7
vpxor %xmm7, %xmm6, %xmm6
vprotd $24, %xmm6, %xmm6
movl %edi, 60(%esp)
movzbl 28(%eax), %edi
vpaddd %xmm6, %xmm1, %xmm1
movl 12(%ebp), %edx
vpxor %xmm1, %xmm0, %xmm0
vprotd $25, %xmm0, %xmm0
movzbl 30(%eax), %esi
vpshufd $57, %xmm0, %xmm0
vpshufd $147, %xmm6, %xmm6
vpshufd $78, %xmm1, %xmm1
vmovd (%edx,%edi), %xmm3
movl %edx, %edi
vpinsrd $1, (%edx,%esi), %xmm3, %xmm2
vmovd (%edx,%ecx), %xmm3
movl 60(%esp), %edx
movzbl 25(%eax), %ecx
movzbl 31(%eax), %esi
vpinsrd $1, (%edi,%edx), %xmm3, %xmm3
movzbl 27(%eax), %edi
vpunpcklqdq %xmm2, %xmm3, %xmm3
movl 12(%ebp), %edx
vpaddd %xmm3, %xmm7, %xmm3
vpaddd %xmm0, %xmm3, %xmm3
vpxor %xmm3, %xmm6, %xmm6
vprotd $16, %xmm6, %xmm6
movl %edi, 60(%esp)
movzbl 29(%eax), %edi
vpaddd %xmm6, %xmm1, %xmm1
vpxor %xmm1, %xmm0, %xmm0
vprotd $20, %xmm0, %xmm0
vmovd (%edx,%edi), %xmm7
vpinsrd $1, (%edx,%esi), %xmm7, %xmm2
vmovd (%edx,%ecx), %xmm7
movl 60(%esp), %ecx
vpinsrd $1, (%edx,%ecx), %xmm7, %xmm7
vpunpcklqdq %xmm2, %xmm7, %xmm2
vpaddd %xmm2, %xmm3, %xmm2
vpaddd %xmm0, %xmm2, %xmm2
leal 32(%eax), %edx
vmovdqa %xmm2, %xmm3
vpxor %xmm2, %xmm6, %xmm2
cmpl 56(%esp), %edx
vprotd $24, %xmm2, %xmm2
vpaddd %xmm2, %xmm1, %xmm1
movl %edx, %eax
vpshufd $57, %xmm2, %xmm2
vpxor %xmm1, %xmm0, %xmm0
vprotd $25, %xmm0, %xmm0
vpshufd $78, %xmm1, %xmm1
vpshufd $147, %xmm0, %xmm0
jb blake2s_blocks_xop_34
cmpl $64, 16(%ebp)
vpxor %xmm1, %xmm3, %xmm1
vpxor %xmm2, %xmm0, %xmm0
movl 12(%ebp), %esi
vpxor %xmm5, %xmm1, %xmm5
vpxor %xmm4, %xmm0, %xmm4
jbe blake2s_blocks_xop_11
addl 20(%ebp), %esi
subl $64, 16(%ebp)
jmp blake2s_blocks_xop_12
blake2s_blocks_xop_11:
movl 8(%ebp), %eax
vmovdqu %xmm5, (%eax)
movl 8(%ebp), %eax
vmovdqu %xmm4, 16(%eax)
leal -12(%ebp), %esp
popl %ebx
popl %esi
popl %edi
popl %ebp
ret
blake2s_blocks_xop_33:
cmpl $64, 16(%ebp)
je blake2s_blocks_xop_2
testb $32, 16(%ebp)
vpxor %xmm0, %xmm0, %xmm0
vmovdqa %ymm0, 64(%esp)
leal 64(%esp), %edi
vmovdqa %ymm0, 96(%esp)
movl %edi, %eax
jne blake2s_blocks_xop_35
blake2s_blocks_xop_3:
testb $16, 16(%ebp)
jne blake2s_blocks_xop_36
blake2s_blocks_xop_4:
testb $8, 16(%ebp)
je blake2s_blocks_xop_5
movl (%esi), %edx
addl $8, %eax
addl $8, %esi
movl -4(%esi), %ecx
movl %edx, -8(%eax)
movl %ecx, -4(%eax)
blake2s_blocks_xop_5:
testb $4, 16(%ebp)
je blake2s_blocks_xop_6
movl (%esi), %ecx
addl $4, %eax
addl $4, %esi
movl %ecx, -4(%eax)
blake2s_blocks_xop_6:
testb $2, 16(%ebp)
je blake2s_blocks_xop_7
movzwl (%esi), %ecx
addl $2, %eax
addl $2, %esi
movw %cx, -2(%eax)
blake2s_blocks_xop_7:
testb $1, 16(%ebp)
je blake2s_blocks_xop_14
movzbl (%esi), %ecx
movl %edi, %esi
movb %cl, (%eax)
vzeroupper
jmp blake2s_blocks_xop_2
blake2s_blocks_xop_14:
movl %edi, %esi
vzeroupper
jmp blake2s_blocks_xop_2
blake2s_blocks_xop_36:
vmovdqu (%esi), %xmm0
addl $16, %eax
vmovdqa %xmm0, -16(%eax)
addl $16, %esi
jmp blake2s_blocks_xop_4
blake2s_blocks_xop_35:
vmovdqu (%esi), %ymm0
leal 96(%esp), %eax
vmovdqa %ymm0, 64(%esp)
addl $32, %esi
jmp blake2s_blocks_xop_3
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



