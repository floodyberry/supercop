#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2b_blocks_avx2
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $372, %esp
movl 8(%ebp), %esi
LOAD_VAR_PIC blake2b_constants, %ecx
LOAD_VAR_PIC blake2b_constants_ssse3, %eax
lea 192+64(%ecx), %edx
vbroadcasti128 0(%eax), %ymm3
vbroadcasti128 16(%eax), %ymm1
movl 80(%esi), %edi
movl 12(%ebp), %ebx
movl 16(%ebp), %eax
orl 84(%esi), %edi
je .Lblake2b_blocks_avx2_20
.Lblake2b_blocks_avx2_2:
cmpl $128, %eax
je .Lblake2b_blocks_avx2_20
.Lblake2b_blocks_avx2_3:
testb $64, %al
lea (%esp), %esi
vxorps %ymm0, %ymm0, %ymm0
vmovdqa %ymm0, (%esp)
vmovdqa %ymm0, 32(%esp)
vmovdqa %ymm0, 64(%esp)
vmovdqa %ymm0, 96(%esp)
je .Lblake2b_blocks_avx2_5
.Lblake2b_blocks_avx2_4:
vmovdqu (%ebx), %ymm0
lea 64(%esp), %esi
vmovdqa %ymm0, (%esp)
vmovdqu 32(%ebx), %ymm2
addl $64, %ebx
vmovdqa %ymm2, 32(%esp)
.Lblake2b_blocks_avx2_5:
testb $32, %al
je .Lblake2b_blocks_avx2_7
.Lblake2b_blocks_avx2_6:
vmovdqu (%ebx), %ymm0
addl $32, %ebx
vmovdqa %ymm0, (%esi)
addl $32, %esi
.Lblake2b_blocks_avx2_7:
testb $16, %al
je .Lblake2b_blocks_avx2_9
.Lblake2b_blocks_avx2_8:
vmovdqu (%ebx), %xmm0
vmovdqa %xmm0, (%esi)
addl $16, %ebx
addl $16, %esi
.Lblake2b_blocks_avx2_9:
testb $8, %al
je .Lblake2b_blocks_avx2_11
.Lblake2b_blocks_avx2_10:
movl %edx, 320(%esp)
movl (%ebx), %edx
movl 4(%ebx), %edi
addl $8, %ebx
movl %edx, (%esi)
movl %edi, 4(%esi)
addl $8, %esi
movl 320(%esp), %edx
.Lblake2b_blocks_avx2_11:
testb $4, %al
je .Lblake2b_blocks_avx2_13
.Lblake2b_blocks_avx2_12:
movl (%ebx), %edi
addl $4, %ebx
movl %edi, (%esi)
addl $4, %esi
.Lblake2b_blocks_avx2_13:
testb $2, %al
je .Lblake2b_blocks_avx2_15
.Lblake2b_blocks_avx2_14:
movzwl (%ebx), %edi
addl $2, %ebx
movw %di, (%esi)
addl $2, %esi
.Lblake2b_blocks_avx2_15:
testb $1, %al
je .Lblake2b_blocks_avx2_17
.Lblake2b_blocks_avx2_16:
movzbl (%ebx), %ebx
movb %bl, (%esi)
.Lblake2b_blocks_avx2_17:
lea (%esp), %ebx
.Lblake2b_blocks_avx2_20:
movl 8(%ebp), %esi
movl $128, %edi
cmpl $128, %eax
cmovbe %eax, %edi
movl %edi, 328(%esp)
vmovdqu (%esi), %ymm0
vmovdqu 32(%esi), %ymm2
vmovdqa 0(%ecx), %ymm5
vmovdqa 32(%ecx), %ymm4
vmovdqa %ymm1, 128(%esp)
vmovdqa %ymm3, 160(%esp)
movl 64(%esi), %edi
lea 64(%ecx), %ecx
movl 68(%esi), %esi
movl %esi, 192(%esp)
movl 328(%esp), %esi
movl %ecx, 324(%esp)
movl %edx, 320(%esp)
movl %esi, 328(%esp)
movl 192(%esp), %edx
movl %edi, %ecx
jmp .Lblake2b_blocks_avx2_21
.Lblake2b_blocks_avx2_26:
addl 20(%ebp), %ebx
addl $-128, %eax
.Lblake2b_blocks_avx2_21:
movl 8(%ebp), %edi
movl 328(%esp), %esi
addl %esi, %ecx
vmovdqa %ymm0, %ymm7
adcl $0, %edx
movl %ecx, 64(%edi)
movl %edx, 68(%edi)
movl %ecx, %edi
subl %esi, %edi
movl $0, %esi
movl %edx, %edi
vmovdqa %ymm2, %ymm6
sbbl %esi, %edi
jae .Lblake2b_blocks_avx2_23
.Lblake2b_blocks_avx2_22:
movl 8(%ebp), %esi
addl $1, 72(%esi)
adcl $0, 76(%esi)
.Lblake2b_blocks_avx2_23:
movl 8(%ebp), %esi
vmovdqa %ymm6, 288(%esp)
vmovdqa %ymm5, 192(%esp)
vmovdqa %ymm7, 256(%esp)
vmovdqa %ymm4, 224(%esp)
vmovdqa 160(%esp), %ymm6
vpxor 64(%esi), %ymm4, %ymm1
movl %eax, 332(%esp)
vmovdqa %ymm5, %ymm3
movl 324(%esp), %esi
vmovdqa 128(%esp), %ymm5
movl 320(%esp), %eax
.Lblake2b_blocks_avx2_24:
movzbl (%esi), %edi
vmovq (%edi,%ebx), %xmm4
movzbl 2(%esi), %edi
vmovhpd (%edi,%ebx), %xmm4, %xmm4
movzbl 4(%esi), %edi
vmovq (%edi,%ebx), %xmm7
movzbl 6(%esi), %edi
vmovhpd (%edi,%ebx), %xmm7, %xmm7
vinsertf128 $1, %xmm7, %ymm4, %ymm4
vpaddq %ymm4, %ymm0, %ymm0
vpaddq %ymm2, %ymm0, %ymm0
vpxor %ymm0, %ymm1, %ymm1
vpshufd $177, %ymm1, %ymm1
movzbl 1(%esi), %edi
vpaddq %ymm1, %ymm3, %ymm3
vmovq (%edi,%ebx), %xmm7
movzbl 3(%esi), %edi
vpxor %ymm3, %ymm2, %ymm2
vmovhpd (%edi,%ebx), %xmm7, %xmm7
movzbl 5(%esi), %edi
vpshufb %ymm5, %ymm2, %ymm4
vmovq (%edi,%ebx), %xmm2
movzbl 7(%esi), %edi
vmovhpd (%edi,%ebx), %xmm2, %xmm2
vinsertf128 $1, %xmm2, %ymm7, %ymm7
vpaddq %ymm7, %ymm0, %ymm0
vpaddq %ymm4, %ymm0, %ymm2
vpxor %ymm2, %ymm1, %ymm1
vpshufb %ymm6, %ymm1, %ymm1
vpaddq %ymm1, %ymm3, %ymm7
vpxor %ymm7, %ymm4, %ymm3
vpsrlq $63, %ymm3, %ymm0
vpaddq %ymm3, %ymm3, %ymm3
movzbl 8(%esi), %edi
vpor %ymm3, %ymm0, %ymm4
vmovq (%edi,%ebx), %xmm0
movzbl 10(%esi), %edi
vpermq $57, %ymm4, %ymm3
vpermq $147, %ymm1, %ymm1
vmovhpd (%edi,%ebx), %xmm0, %xmm0
movzbl 12(%esi), %edi
vpermq $78, %ymm7, %ymm7
vmovq (%edi,%ebx), %xmm4
movzbl 14(%esi), %edi
vmovhpd (%edi,%ebx), %xmm4, %xmm4
vinsertf128 $1, %xmm4, %ymm0, %ymm0
vpaddq %ymm0, %ymm2, %ymm2
vpaddq %ymm3, %ymm2, %ymm0
movzbl 9(%esi), %edi
vpxor %ymm0, %ymm1, %ymm1
vmovq (%edi,%ebx), %xmm4
movzbl 11(%esi), %edi
vpshufd $177, %ymm1, %ymm2
vmovhpd (%edi,%ebx), %xmm4, %xmm1
movzbl 13(%esi), %edi
vpaddq %ymm2, %ymm7, %ymm7
vmovq (%edi,%ebx), %xmm4
movzbl 15(%esi), %edi
addl $16, %esi
vpxor %ymm7, %ymm3, %ymm3
cmpl %eax, %esi
vmovhpd (%edi,%ebx), %xmm4, %xmm4
vpshufb %ymm5, %ymm3, %ymm3
vinsertf128 $1, %xmm4, %ymm1, %ymm1
vpaddq %ymm1, %ymm0, %ymm0
vpaddq %ymm3, %ymm0, %ymm0
vpxor %ymm0, %ymm2, %ymm2
vpshufb %ymm6, %ymm2, %ymm1
vpaddq %ymm1, %ymm7, %ymm7
vpxor %ymm7, %ymm3, %ymm4
vpsrlq $63, %ymm4, %ymm2
vpaddq %ymm4, %ymm4, %ymm4
vpermq $78, %ymm7, %ymm3
vpor %ymm4, %ymm2, %ymm7
vpermq $57, %ymm1, %ymm1
vpermq $147, %ymm7, %ymm2
jb .Lblake2b_blocks_avx2_24
.Lblake2b_blocks_avx2_25:
vmovdqa 288(%esp), %ymm6
vmovdqa 256(%esp), %ymm7
vmovdqa 224(%esp), %ymm4
vmovdqa 192(%esp), %ymm5
vpxor %ymm3, %ymm0, %ymm0
vpxor %ymm1, %ymm2, %ymm1
vpxor %ymm7, %ymm0, %ymm0
vpxor %ymm6, %ymm1, %ymm2
movl 332(%esp), %eax
cmpl $128, %eax
ja .Lblake2b_blocks_avx2_26
.Lblake2b_blocks_avx2_27:
movl 8(%ebp), %eax
vmovdqu %ymm0, (%eax)
vmovdqu %ymm2, 32(%eax)
addl $372, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
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



