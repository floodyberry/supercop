#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2b_blocks_avx
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $1268, %esp
movl 8(%ebp), %ebx
movl 80(%ebx), %edi
vmovdqu 80(%ebx), %xmm1
LOAD_VAR_PIC blake2b_constants_ssse3, %ecx
vmovdqu 0(%ecx), %xmm4
vmovdqa 16(%ecx), %xmm0
LOAD_VAR_PIC blake2b_constants, %ecx
lea 160+64(%ecx), %eax
movl 12(%ebp), %edx
movl 16(%ebp), %esi
vmovdqu %xmm0, 1120(%esp)
vpxor 48(%ecx), %xmm1, %xmm3
movl %eax, 1040(%esp)
orl 84(%ebx), %edi
jne blake2b_blocks_avx_L2
blake2b_blocks_avx_L31:
cmpl $128, %esi
jmp blake2b_blocks_avx_L21
blake2b_blocks_avx_L2:
cmpl $128, %esi
je blake2b_blocks_avx_L21
blake2b_blocks_avx_L3:
lea (%esp), %eax
testl $64, %esi
je blake2b_blocks_avx_L5
blake2b_blocks_avx_L4:
vmovdqu (%edx), %xmm0
vmovdqu %xmm0, (%esp)
lea 64(%esp), %eax
vmovdqu 16(%edx), %xmm1
vmovdqu %xmm1, 16(%esp)
vpxor %xmm0, %xmm0, %xmm0
vmovdqu 32(%edx), %xmm2
vmovdqu %xmm2, 32(%esp)
vmovdqu 48(%edx), %xmm5
vmovdqu %xmm5, 48(%esp)
addl $64, %edx
jmp blake2b_blocks_avx_L6
blake2b_blocks_avx_L5:
vpxor %xmm0, %xmm0, %xmm0
vmovdqu %xmm0, 64(%esp)
vmovdqu %xmm0, 80(%esp)
vmovdqu %xmm0, 96(%esp)
vmovdqu %xmm0, 112(%esp)
blake2b_blocks_avx_L6:
vmovdqu %xmm0, (%eax)
vmovdqu %xmm0, 16(%eax)
vmovdqu %xmm0, 32(%eax)
vmovdqu %xmm0, 48(%eax)
testl $32, %esi
je blake2b_blocks_avx_L8
blake2b_blocks_avx_L7:
vmovdqu (%edx), %xmm0
vmovdqu %xmm0, (%eax)
vmovdqu 16(%edx), %xmm1
vmovdqu %xmm1, 16(%eax)
addl $32, %edx
addl $32, %eax
blake2b_blocks_avx_L8:
testl $16, %esi
je blake2b_blocks_avx_L10
blake2b_blocks_avx_L9:
vmovdqu (%edx), %xmm0
vmovdqu %xmm0, (%eax)
addl $16, %edx
addl $16, %eax
blake2b_blocks_avx_L10:
testl $8, %esi
je blake2b_blocks_avx_L12
blake2b_blocks_avx_L11:
movl (%edx), %ebx
movl 4(%edx), %edi
addl $8, %edx
movl %ebx, (%eax)
movl %edi, 4(%eax)
addl $8, %eax
blake2b_blocks_avx_L12:
testl $4, %esi
je blake2b_blocks_avx_L14
blake2b_blocks_avx_L13:
movl (%edx), %ebx
addl $4, %edx
movl %ebx, (%eax)
addl $4, %eax
blake2b_blocks_avx_L14:
testl $2, %esi
je blake2b_blocks_avx_L16
blake2b_blocks_avx_L15:
movzwl (%edx), %ebx
addl $2, %edx
movw %bx, (%eax)
addl $2, %eax
blake2b_blocks_avx_L16:
testl $1, %esi
je blake2b_blocks_avx_L18
blake2b_blocks_avx_L17:
movzbl (%edx), %edx
movb %dl, (%eax)
blake2b_blocks_avx_L18:
cmpl $128, %esi
lea (%esp), %edx
blake2b_blocks_avx_L21:
movl 8(%ebp), %eax
movl $128, %ebx
vmovdqu 32(%ecx), %xmm7
cmovbe %esi, %ebx
vmovdqu 0(%ecx), %xmm6
vmovdqu (%eax), %xmm0
vmovdqu %xmm0, 192(%esp)
vmovdqu 16(%eax), %xmm0
vmovdqu 32(%eax), %xmm1
vmovdqu 48(%eax), %xmm2
vmovdqu 16(%ecx), %xmm5
lea 64+64(%ecx), %ecx
movl 64(%eax), %edi
movl 68(%eax), %eax
vmovdqu %xmm5, 240(%esp)
vmovdqu %xmm6, 128(%esp)
vmovdqu %xmm7, 144(%esp)
vmovdqu %xmm2, 208(%esp)
vmovdqu %xmm1, 224(%esp)
vmovdqu %xmm0, 176(%esp)
vmovdqu %xmm3, 160(%esp)
vmovdqu %xmm4, 1056(%esp)
movl %ecx, 1032(%esp)
movl %ebx, 1036(%esp)
jmp blake2b_blocks_avx_L22
# align to 5 mod 64
.p2align 6
nop
nop
nop
nop
nop
blake2b_blocks_avx_L27:
addl 20(%ebp), %edx
addl $-128, %esi
blake2b_blocks_avx_L22:
movl 8(%ebp), %ebx
movl 1036(%esp), %ecx
addl %ecx, %edi
adcl $0, %eax
movl %edi, 64(%ebx)
movl %eax, 68(%ebx)
movl %edi, %ebx
subl %ecx, %ebx
movl $0, %ecx
movl %eax, %ebx
sbbl %ecx, %ebx
jae blake2b_blocks_avx_L24
blake2b_blocks_avx_L23:
movl 8(%ebp), %ecx
addl $1, 72(%ecx)
adcl $0, 76(%ecx)
blake2b_blocks_avx_L24:
movl 8(%ebp), %ecx
vmovdqu 144(%esp), %xmm3
vmovdqu 16(%edx), %xmm6
vmovdqu 32(%edx), %xmm1
vpxor 64(%ecx), %xmm3, %xmm4
vmovdqu (%edx), %xmm3
vpunpcklqdq %xmm6, %xmm3, %xmm5
vmovhpd 48(%edx), %xmm1, %xmm0
vpaddq 192(%esp), %xmm5, %xmm7
vpaddq 176(%esp), %xmm0, %xmm5
vmovdqu 224(%esp), %xmm2
vmovdqu 208(%esp), %xmm0
vpaddq %xmm2, %xmm7, %xmm7
vpaddq %xmm0, %xmm5, %xmm5
vmovdqu %xmm5, 256(%esp)
vpxor %xmm7, %xmm4, %xmm4
vpxor 160(%esp), %xmm5, %xmm5
vpshufd $177, %xmm4, %xmm4
vpshufd $177, %xmm5, %xmm5
vmovdqu %xmm4, 272(%esp)
vmovdqu %xmm5, 288(%esp)
vpaddq 128(%esp), %xmm4, %xmm4
vpaddq 240(%esp), %xmm5, %xmm5
vmovdqu %xmm4, 304(%esp)
vpxor %xmm4, %xmm2, %xmm4
vmovdqu 1120(%esp), %xmm2
vpxor %xmm5, %xmm0, %xmm0
vpshufb %xmm2, %xmm4, %xmm4
vpshufb %xmm2, %xmm0, %xmm2
vpunpckhqdq %xmm6, %xmm3, %xmm6
vpunpckhqdq 48(%edx), %xmm1, %xmm1
vpaddq %xmm6, %xmm7, %xmm3
vpaddq 256(%esp), %xmm1, %xmm0
vpaddq %xmm4, %xmm3, %xmm6
vpaddq %xmm2, %xmm0, %xmm3
vpxor 272(%esp), %xmm6, %xmm7
vmovdqu 1056(%esp), %xmm0
vpxor 288(%esp), %xmm3, %xmm1
vpshufb %xmm0, %xmm7, %xmm7
vpshufb %xmm0, %xmm1, %xmm0
vpaddq 304(%esp), %xmm7, %xmm1
vpaddq %xmm0, %xmm5, %xmm5
vmovdqu %xmm0, 320(%esp)
vpxor %xmm1, %xmm4, %xmm4
vpxor %xmm5, %xmm2, %xmm0
vpsrlq $63, %xmm4, %xmm2
vmovdqu %xmm1, 336(%esp)
vmovdqu %xmm5, 352(%esp)
vpsrlq $63, %xmm0, %xmm5
vpaddq %xmm4, %xmm4, %xmm1
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm1, %xmm2, %xmm1
vpor %xmm0, %xmm5, %xmm2
vpalignr $8, %xmm1, %xmm2, %xmm4
vpalignr $8, %xmm2, %xmm1, %xmm0
vmovdqu 96(%edx), %xmm1
vmovhpd 112(%edx), %xmm1, %xmm5
vmovdqu 64(%edx), %xmm1
vpaddq %xmm5, %xmm3, %xmm3
vmovhpd 80(%edx), %xmm1, %xmm2
vpaddq %xmm2, %xmm6, %xmm6
vpaddq %xmm0, %xmm3, %xmm3
vpaddq %xmm4, %xmm6, %xmm6
vmovdqu 320(%esp), %xmm2
vmovdqu %xmm5, 368(%esp)
vpalignr $8, %xmm2, %xmm7, %xmm5
vpalignr $8, %xmm7, %xmm2, %xmm7
vpxor %xmm6, %xmm5, %xmm5
vpxor %xmm3, %xmm7, %xmm7
vpshufd $177, %xmm5, %xmm5
vpshufd $177, %xmm7, %xmm2
vmovdqu %xmm5, 384(%esp)
vpaddq 352(%esp), %xmm5, %xmm7
vpaddq 336(%esp), %xmm2, %xmm5
vmovdqu %xmm7, 400(%esp)
vpxor %xmm7, %xmm4, %xmm4
vmovdqu 1120(%esp), %xmm7
vpxor %xmm5, %xmm0, %xmm0
vpunpckhqdq 80(%edx), %xmm1, %xmm1
vpshufb %xmm7, %xmm4, %xmm4
vpaddq %xmm1, %xmm6, %xmm6
vmovdqu 112(%edx), %xmm1
vpaddq %xmm4, %xmm6, %xmm6
vpshufb %xmm7, %xmm0, %xmm0
vmovdqu 96(%edx), %xmm7
vpunpckhqdq %xmm1, %xmm7, %xmm7
vpaddq %xmm7, %xmm3, %xmm3
vmovdqu %xmm6, 416(%esp)
vpaddq %xmm0, %xmm3, %xmm3
vpxor 384(%esp), %xmm6, %xmm6
vpxor %xmm3, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm7
vpshufb %xmm7, %xmm6, %xmm6
vpshufb %xmm7, %xmm2, %xmm2
vpaddq 400(%esp), %xmm6, %xmm7
vpaddq %xmm2, %xmm5, %xmm5
vmovdqu %xmm7, 432(%esp)
vpxor %xmm7, %xmm4, %xmm7
vpsrlq $63, %xmm7, %xmm4
vpxor %xmm5, %xmm0, %xmm0
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm4, %xmm7
vpsrlq $63, %xmm0, %xmm4
vpaddq %xmm0, %xmm0, %xmm0
vmovhpd 32(%edx), %xmm1, %xmm1
vpor %xmm0, %xmm4, %xmm4
vpaddq 416(%esp), %xmm1, %xmm1
vpalignr $8, %xmm4, %xmm7, %xmm0
vmovdqu %xmm0, 448(%esp)
vpaddq %xmm0, %xmm1, %xmm0
vmovdqu 64(%edx), %xmm1
vpalignr $8, %xmm7, %xmm4, %xmm4
vpunpckhqdq 96(%edx), %xmm1, %xmm7
vpaddq %xmm7, %xmm3, %xmm3
vpaddq %xmm4, %xmm3, %xmm3
vpalignr $8, %xmm6, %xmm2, %xmm7
vpalignr $8, %xmm2, %xmm6, %xmm6
vpxor %xmm0, %xmm7, %xmm7
vpxor %xmm3, %xmm6, %xmm2
vpshufd $177, %xmm7, %xmm7
vpshufd $177, %xmm2, %xmm6
vpaddq %xmm7, %xmm5, %xmm5
vpaddq 432(%esp), %xmm6, %xmm2
vmovdqu %xmm6, 464(%esp)
vpxor %xmm2, %xmm4, %xmm4
vmovdqu %xmm5, 480(%esp)
vpxor 448(%esp), %xmm5, %xmm6
vmovdqu 1120(%esp), %xmm5
vpshufb %xmm5, %xmm6, %xmm6
vpshufb %xmm5, %xmm4, %xmm5
vmovdqu 80(%edx), %xmm4
vpunpcklqdq %xmm1, %xmm4, %xmm1
vpaddq %xmm1, %xmm0, %xmm0
vpaddq %xmm6, %xmm0, %xmm4
vmovdqu 48(%edx), %xmm0
vpalignr $8, 112(%edx), %xmm0, %xmm1
vpaddq %xmm1, %xmm3, %xmm3
vpaddq %xmm5, %xmm3, %xmm1
vmovdqu 1056(%esp), %xmm0
vpxor %xmm4, %xmm7, %xmm3
vpshufb %xmm0, %xmm3, %xmm7
vpxor 464(%esp), %xmm1, %xmm3
vpshufb %xmm0, %xmm3, %xmm3
vpaddq 480(%esp), %xmm7, %xmm0
vpaddq %xmm3, %xmm2, %xmm2
vmovdqu %xmm0, 496(%esp)
vpxor %xmm0, %xmm6, %xmm0
vpxor %xmm2, %xmm5, %xmm6
vpsrlq $63, %xmm0, %xmm5
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm0, %xmm5, %xmm0
vpsrlq $63, %xmm6, %xmm5
vpaddq %xmm6, %xmm6, %xmm6
vpor %xmm6, %xmm5, %xmm5
vpalignr $8, %xmm0, %xmm5, %xmm6
vpalignr $8, %xmm5, %xmm0, %xmm0
vpshufd $78, (%edx), %xmm5
vpaddq %xmm5, %xmm4, %xmm4
vmovdqu 80(%edx), %xmm5
vmovdqu %xmm6, 512(%esp)
vpaddq %xmm6, %xmm4, %xmm6
vpunpckhqdq 32(%edx), %xmm5, %xmm4
vpaddq %xmm4, %xmm1, %xmm1
vpaddq %xmm0, %xmm1, %xmm5
vpalignr $8, %xmm3, %xmm7, %xmm1
vpalignr $8, %xmm7, %xmm3, %xmm7
vpxor %xmm6, %xmm1, %xmm4
vpxor %xmm5, %xmm7, %xmm1
vpshufd $177, %xmm4, %xmm4
vpshufd $177, %xmm1, %xmm3
vpaddq %xmm4, %xmm2, %xmm2
vpaddq 496(%esp), %xmm3, %xmm7
vmovdqu %xmm3, 528(%esp)
vpxor %xmm7, %xmm0, %xmm0
vmovdqu %xmm2, 544(%esp)
vmovdqu %xmm7, 560(%esp)
vpxor 512(%esp), %xmm2, %xmm3
vmovdqu 16(%edx), %xmm2
vmovdqu 48(%edx), %xmm7
vmovdqu 1120(%esp), %xmm1
vpshufb %xmm1, %xmm3, %xmm3
vpshufb %xmm1, %xmm0, %xmm0
vpunpckhqdq %xmm2, %xmm7, %xmm1
vmovdqu 96(%edx), %xmm7
vpunpcklqdq %xmm2, %xmm7, %xmm2
vpaddq %xmm2, %xmm6, %xmm6
vmovdqu %xmm1, 576(%esp)
vpaddq %xmm1, %xmm5, %xmm1
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm0, %xmm1, %xmm5
vmovdqu 1056(%esp), %xmm1
vpxor %xmm6, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm2
vpxor 528(%esp), %xmm5, %xmm4
vpshufb %xmm1, %xmm4, %xmm4
vmovdqu %xmm2, 592(%esp)
vpaddq 544(%esp), %xmm2, %xmm2
vpaddq 560(%esp), %xmm4, %xmm1
vpxor %xmm2, %xmm3, %xmm3
vmovdqu %xmm2, 608(%esp)
vpxor %xmm1, %xmm0, %xmm2
vpsrlq $63, %xmm3, %xmm0
vpaddq %xmm3, %xmm3, %xmm3
vpor %xmm3, %xmm0, %xmm0
vpsrlq $63, %xmm2, %xmm3
vpaddq %xmm2, %xmm2, %xmm2
vpalignr $8, 80(%edx), %xmm7, %xmm7
vpor %xmm2, %xmm3, %xmm3
vpaddq %xmm7, %xmm6, %xmm6
vpalignr $8, %xmm3, %xmm0, %xmm2
vpalignr $8, %xmm0, %xmm3, %xmm0
vpaddq %xmm2, %xmm6, %xmm3
vmovdqu 32(%edx), %xmm6
vpunpckhqdq 112(%edx), %xmm6, %xmm7
vpaddq %xmm7, %xmm5, %xmm5
vpaddq %xmm0, %xmm5, %xmm7
vmovdqu 592(%esp), %xmm5
vpalignr $8, %xmm5, %xmm4, %xmm6
vpalignr $8, %xmm4, %xmm5, %xmm5
vpxor %xmm3, %xmm6, %xmm6
vpxor %xmm7, %xmm5, %xmm4
vpshufd $177, %xmm6, %xmm6
vpshufd $177, %xmm4, %xmm5
vpaddq 608(%esp), %xmm5, %xmm4
vpaddq %xmm6, %xmm1, %xmm1
vmovdqu %xmm1, 624(%esp)
vpxor %xmm1, %xmm2, %xmm1
vmovdqu 1120(%esp), %xmm2
vpxor %xmm4, %xmm0, %xmm0
vpshufb %xmm2, %xmm1, %xmm1
vpshufb %xmm2, %xmm0, %xmm2
vmovdqu 64(%edx), %xmm0
vmovdqu %xmm4, 640(%esp)
vmovhpd (%edx), %xmm0, %xmm4
vpaddq %xmm4, %xmm3, %xmm3
vmovdqu 16(%edx), %xmm4
vpaddq %xmm1, %xmm3, %xmm3
vpblendw $240, 96(%edx), %xmm4, %xmm0
vpxor %xmm3, %xmm6, %xmm6
vpaddq %xmm0, %xmm7, %xmm7
vpaddq %xmm2, %xmm7, %xmm0
vmovdqu 1056(%esp), %xmm7
vpxor %xmm0, %xmm5, %xmm5
vpshufb %xmm7, %xmm6, %xmm6
vpshufb %xmm7, %xmm5, %xmm5
vpaddq 624(%esp), %xmm6, %xmm7
vmovdqu %xmm6, 656(%esp)
vpxor %xmm7, %xmm1, %xmm1
vpaddq 640(%esp), %xmm5, %xmm6
vmovdqu %xmm7, 672(%esp)
vpxor %xmm6, %xmm2, %xmm7
vpsrlq $63, %xmm1, %xmm2
vpaddq %xmm1, %xmm1, %xmm1
vpor %xmm1, %xmm2, %xmm1
vpsrlq $63, %xmm7, %xmm2
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm2, %xmm7
vpalignr $8, %xmm1, %xmm7, %xmm2
vpalignr $8, %xmm7, %xmm1, %xmm1
vmovdqu 80(%edx), %xmm7
vpblendw $240, %xmm4, %xmm7, %xmm4
vpaddq %xmm4, %xmm3, %xmm3
vpaddq %xmm2, %xmm3, %xmm4
vmovdqu 48(%edx), %xmm3
vpunpckhqdq 64(%edx), %xmm3, %xmm7
vpaddq %xmm7, %xmm0, %xmm0
vmovdqu 656(%esp), %xmm7
vpaddq %xmm1, %xmm0, %xmm0
vpalignr $8, %xmm5, %xmm7, %xmm3
vpalignr $8, %xmm7, %xmm5, %xmm5
vpxor %xmm4, %xmm3, %xmm3
vpxor %xmm0, %xmm5, %xmm5
vpshufd $177, %xmm3, %xmm3
vpshufd $177, %xmm5, %xmm7
vpaddq 672(%esp), %xmm7, %xmm5
vpaddq %xmm3, %xmm6, %xmm6
vmovdqu %xmm6, 688(%esp)
vpxor %xmm6, %xmm2, %xmm2
vmovdqu 1120(%esp), %xmm6
vpxor %xmm5, %xmm1, %xmm1
vpshufb %xmm6, %xmm2, %xmm2
vpshufb %xmm6, %xmm1, %xmm1
vmovdqu 112(%edx), %xmm6
vmovdqu %xmm5, 704(%esp)
vmovhpd 48(%edx), %xmm6, %xmm5
vmovdqu 32(%edx), %xmm6
vpaddq %xmm5, %xmm4, %xmm4
vpalignr $8, (%edx), %xmm6, %xmm5
vpaddq %xmm5, %xmm0, %xmm0
vpaddq %xmm2, %xmm4, %xmm4
vpaddq %xmm1, %xmm0, %xmm0
vmovdqu 1056(%esp), %xmm6
vpxor %xmm4, %xmm3, %xmm3
vpshufb %xmm6, %xmm3, %xmm3
vpxor %xmm0, %xmm7, %xmm7
vpshufb %xmm6, %xmm7, %xmm6
vpaddq 688(%esp), %xmm3, %xmm7
vpaddq 704(%esp), %xmm6, %xmm5
vpxor %xmm7, %xmm2, %xmm2
vmovdqu %xmm7, 720(%esp)
vpxor %xmm5, %xmm1, %xmm7
vpsrlq $63, %xmm2, %xmm1
vpaddq %xmm2, %xmm2, %xmm2
vpor %xmm2, %xmm1, %xmm1
vpsrlq $63, %xmm7, %xmm2
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm2, %xmm7
vpalignr $8, %xmm7, %xmm1, %xmm2
vpalignr $8, %xmm1, %xmm7, %xmm7
vpaddq 576(%esp), %xmm4, %xmm1
vmovdqu 96(%edx), %xmm4
vpaddq %xmm2, %xmm1, %xmm1
vmovdqu %xmm2, 736(%esp)
vpunpckhqdq 80(%edx), %xmm4, %xmm2
vpaddq %xmm2, %xmm0, %xmm0
vpaddq %xmm7, %xmm0, %xmm0
vpalignr $8, %xmm3, %xmm6, %xmm4
vpalignr $8, %xmm6, %xmm3, %xmm6
vpxor %xmm1, %xmm4, %xmm2
vpxor %xmm0, %xmm6, %xmm3
vpshufd $177, %xmm2, %xmm4
vpshufd $177, %xmm3, %xmm3
vpaddq %xmm4, %xmm5, %xmm5
vpaddq 720(%esp), %xmm3, %xmm2
vpaddq 368(%esp), %xmm0, %xmm0
vmovdqu %xmm5, 752(%esp)
vpxor %xmm2, %xmm7, %xmm7
vpxor 736(%esp), %xmm5, %xmm5
vmovdqu 1120(%esp), %xmm6
vpshufb %xmm6, %xmm5, %xmm5
vpshufb %xmm6, %xmm7, %xmm7
vmovdqu 64(%edx), %xmm6
vmovdqu %xmm2, 768(%esp)
vpunpckhqdq (%edx), %xmm6, %xmm2
vpaddq %xmm2, %xmm1, %xmm1
vpaddq %xmm7, %xmm0, %xmm2
vpaddq %xmm5, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm0
vpxor %xmm2, %xmm3, %xmm3
vmovdqu 1056(%esp), %xmm4
vpshufb %xmm4, %xmm0, %xmm6
vpshufb %xmm4, %xmm3, %xmm4
vpaddq 752(%esp), %xmm6, %xmm0
vpaddq 768(%esp), %xmm4, %xmm3
vmovdqu %xmm0, 784(%esp)
vpxor %xmm0, %xmm5, %xmm0
vpxor %xmm3, %xmm7, %xmm7
vpsrlq $63, %xmm0, %xmm5
vmovdqu %xmm3, 800(%esp)
vpaddq %xmm0, %xmm0, %xmm3
vpsrlq $63, %xmm7, %xmm0
vpor %xmm3, %xmm5, %xmm3
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm0, %xmm5
vpalignr $8, %xmm3, %xmm5, %xmm7
vpalignr $8, %xmm5, %xmm3, %xmm3
vmovdqu 16(%edx), %xmm5
vmovdqu 32(%edx), %xmm0
vpblendw $240, %xmm0, %xmm5, %xmm5
vpaddq %xmm5, %xmm1, %xmm1
vpblendw $240, 112(%edx), %xmm0, %xmm0
vpaddq %xmm0, %xmm2, %xmm2
vpaddq %xmm7, %xmm1, %xmm5
vpaddq %xmm3, %xmm2, %xmm2
vpalignr $8, %xmm4, %xmm6, %xmm1
vpalignr $8, %xmm6, %xmm4, %xmm4
vpxor %xmm5, %xmm1, %xmm0
vpshufd $177, %xmm0, %xmm1
vpxor %xmm2, %xmm4, %xmm0
vpshufd $177, %xmm0, %xmm6
vpaddq 800(%esp), %xmm1, %xmm4
vpaddq 784(%esp), %xmm6, %xmm0
vmovdqu %xmm4, 816(%esp)
vpxor %xmm4, %xmm7, %xmm7
vmovdqu 1120(%esp), %xmm4
vpxor %xmm0, %xmm3, %xmm3
vpshufb %xmm4, %xmm7, %xmm7
vpshufb %xmm4, %xmm3, %xmm3
vmovdqu 48(%edx), %xmm4
vmovhpd 80(%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vmovdqu (%edx), %xmm4
vpaddq %xmm7, %xmm5, %xmm5
vmovhpd 64(%edx), %xmm4, %xmm4
vpxor %xmm5, %xmm1, %xmm1
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm3, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm4
vpxor %xmm2, %xmm6, %xmm6
vpshufb %xmm4, %xmm1, %xmm1
vpshufb %xmm4, %xmm6, %xmm6
vmovdqu %xmm5, 1088(%esp)
vpaddq 816(%esp), %xmm1, %xmm5
vpaddq %xmm6, %xmm0, %xmm0
vmovdqu %xmm2, 1104(%esp)
vpxor %xmm5, %xmm7, %xmm2
vpxor %xmm0, %xmm3, %xmm3
vpsrlq $63, %xmm2, %xmm4
vpaddq %xmm2, %xmm2, %xmm7
vpsrlq $63, %xmm3, %xmm2
vpaddq %xmm3, %xmm3, %xmm3
vmovdqu %xmm5, 1072(%esp)
vpor %xmm7, %xmm4, %xmm5
vpor %xmm3, %xmm2, %xmm4
vpalignr $8, %xmm4, %xmm5, %xmm3
vpalignr $8, %xmm5, %xmm4, %xmm4
vpalignr $8, %xmm1, %xmm6, %xmm2
vpalignr $8, %xmm6, %xmm1, %xmm1
movl 1032(%esp), %ebx
movl 1040(%esp), %ecx
movl %edi, 1028(%esp)
movl %esi, 1024(%esp)
blake2b_blocks_avx_L25:
movzbl (%ebx), %esi
movzbl 2(%ebx), %edi
vmovq (%esi,%edx), %xmm5
movzbl 4(%ebx), %esi
vmovhpd (%edi,%edx), %xmm5, %xmm7
vpaddq 1088(%esp), %xmm7, %xmm5
vmovq (%esi,%edx), %xmm6
movzbl 6(%ebx), %esi
vpaddq %xmm3, %xmm5, %xmm5
vmovhpd (%esi,%edx), %xmm6, %xmm6
vpxor %xmm5, %xmm2, %xmm2
vpaddq 1104(%esp), %xmm6, %xmm7
vpaddq %xmm4, %xmm7, %xmm6
vpxor %xmm6, %xmm1, %xmm1
vpshufd $177, %xmm2, %xmm2
vpshufd $177, %xmm1, %xmm1
vpaddq %xmm2, %xmm0, %xmm7
vpaddq 1072(%esp), %xmm1, %xmm0
movzbl 1(%ebx), %edi
vpxor %xmm7, %xmm3, %xmm3
vmovdqu %xmm7, 1136(%esp)
vpxor %xmm0, %xmm4, %xmm4
vmovdqu 1120(%esp), %xmm7
vmovdqu %xmm0, 1152(%esp)
vpshufb %xmm7, %xmm4, %xmm0
vpshufb %xmm7, %xmm3, %xmm3
vmovq (%edi,%edx), %xmm4
movzbl 5(%ebx), %edi
movzbl 3(%ebx), %esi
vmovq (%edi,%edx), %xmm7
movzbl 7(%ebx), %edi
vmovhpd (%esi,%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vmovhpd (%edi,%edx), %xmm7, %xmm7
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm3, %xmm5, %xmm5
vpaddq %xmm0, %xmm6, %xmm7
vpxor %xmm5, %xmm2, %xmm4
vpxor %xmm7, %xmm1, %xmm1
vmovdqu 1056(%esp), %xmm2
vpshufb %xmm2, %xmm4, %xmm4
vpshufb %xmm2, %xmm1, %xmm1
vpaddq 1136(%esp), %xmm4, %xmm2
vpaddq 1152(%esp), %xmm1, %xmm6
vmovdqu %xmm2, 1168(%esp)
vpxor %xmm2, %xmm3, %xmm2
vmovdqu %xmm6, 1184(%esp)
vpxor %xmm6, %xmm0, %xmm6
vpsrlq $63, %xmm2, %xmm0
vpaddq %xmm2, %xmm2, %xmm2
movzbl 8(%ebx), %esi
vpor %xmm2, %xmm0, %xmm3
vpsrlq $63, %xmm6, %xmm0
vpaddq %xmm6, %xmm6, %xmm6
vpor %xmm6, %xmm0, %xmm2
vmovq (%esi,%edx), %xmm6
movzbl 12(%ebx), %esi
vpalignr $8, %xmm3, %xmm2, %xmm0
vpalignr $8, %xmm2, %xmm3, %xmm3
vmovq (%esi,%edx), %xmm2
movzbl 10(%ebx), %edi
movzbl 14(%ebx), %esi
vmovhpd (%edi,%edx), %xmm6, %xmm6
vmovhpd (%esi,%edx), %xmm2, %xmm2
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm2, %xmm7, %xmm7
vpaddq %xmm0, %xmm5, %xmm6
vpaddq %xmm3, %xmm7, %xmm2
vpalignr $8, %xmm1, %xmm4, %xmm5
vpalignr $8, %xmm4, %xmm1, %xmm4
vpxor %xmm6, %xmm5, %xmm7
vpxor %xmm2, %xmm4, %xmm1
vpshufd $177, %xmm7, %xmm7
vpshufd $177, %xmm1, %xmm4
vpaddq 1184(%esp), %xmm7, %xmm1
vpaddq 1168(%esp), %xmm4, %xmm5
movzbl 9(%ebx), %edi
vpxor %xmm5, %xmm3, %xmm3
vmovdqu %xmm1, 1200(%esp)
vpxor %xmm1, %xmm0, %xmm1
vmovdqu 1120(%esp), %xmm0
vpshufb %xmm0, %xmm1, %xmm1
vpshufb %xmm0, %xmm3, %xmm3
vmovq (%edi,%edx), %xmm0
movzbl 11(%ebx), %esi
movzbl 13(%ebx), %edi
vmovdqu %xmm5, 1216(%esp)
vmovhpd (%esi,%edx), %xmm0, %xmm0
vmovq (%edi,%edx), %xmm5
movzbl 15(%ebx), %edi
addl $16, %ebx
vpaddq %xmm0, %xmm6, %xmm6
vpaddq %xmm1, %xmm6, %xmm0
vmovhpd (%edi,%edx), %xmm5, %xmm6
vpxor %xmm0, %xmm7, %xmm7
vpaddq %xmm6, %xmm2, %xmm2
vmovdqu %xmm0, 1088(%esp)
vpaddq %xmm3, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm0
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm0, %xmm7, %xmm7
vmovdqu %xmm2, 1104(%esp)
vpshufb %xmm0, %xmm4, %xmm2
vpaddq 1200(%esp), %xmm7, %xmm5
vpaddq 1216(%esp), %xmm2, %xmm0
vpxor %xmm5, %xmm1, %xmm4
vpxor %xmm0, %xmm3, %xmm6
vpaddq %xmm4, %xmm4, %xmm1
vpsrlq $63, %xmm4, %xmm3
vpor %xmm1, %xmm3, %xmm4
vpsrlq $63, %xmm6, %xmm3
vpaddq %xmm6, %xmm6, %xmm1
vmovdqu %xmm5, 1072(%esp)
vpor %xmm1, %xmm3, %xmm5
vpalignr $8, %xmm5, %xmm4, %xmm3
vpalignr $8, %xmm4, %xmm5, %xmm4
vpalignr $8, %xmm2, %xmm7, %xmm1
vpalignr $8, %xmm7, %xmm2, %xmm2
cmpl %ecx, %ebx
jb blake2b_blocks_avx_L25
blake2b_blocks_avx_L26:
vmovq (%edx), %xmm6
vmovhpd 16(%edx), %xmm6, %xmm7
vmovq 32(%edx), %xmm5
vpaddq 1088(%esp), %xmm7, %xmm6
vmovhpd 48(%edx), %xmm5, %xmm5
vpaddq %xmm3, %xmm6, %xmm7
vpaddq 1104(%esp), %xmm5, %xmm6
vpaddq %xmm4, %xmm6, %xmm6
vpxor %xmm7, %xmm2, %xmm2
vpxor %xmm6, %xmm1, %xmm1
vpshufd $177, %xmm2, %xmm5
vpshufd $177, %xmm1, %xmm2
vpaddq 1072(%esp), %xmm2, %xmm1
vpaddq %xmm5, %xmm0, %xmm0
vmovdqu %xmm0, 832(%esp)
vpxor %xmm0, %xmm3, %xmm3
vmovdqu 1120(%esp), %xmm0
vpxor %xmm1, %xmm4, %xmm4
vpshufb %xmm0, %xmm3, %xmm3
vpshufb %xmm0, %xmm4, %xmm0
vmovq 8(%edx), %xmm4
vmovhpd 24(%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm7, %xmm7
vmovdqu %xmm3, 848(%esp)
vpaddq %xmm3, %xmm7, %xmm7
vmovq 40(%edx), %xmm3
vpxor %xmm7, %xmm5, %xmm5
vmovhpd 56(%edx), %xmm3, %xmm4
vpaddq %xmm4, %xmm6, %xmm6
vpaddq %xmm0, %xmm6, %xmm3
vmovdqu 1056(%esp), %xmm6
vpxor %xmm3, %xmm2, %xmm2
vpshufb %xmm6, %xmm5, %xmm4
vpshufb %xmm6, %xmm2, %xmm5
vpaddq 832(%esp), %xmm4, %xmm2
vpaddq %xmm5, %xmm1, %xmm1
vmovdqu %xmm2, 864(%esp)
vmovdqu %xmm1, 880(%esp)
vpxor %xmm1, %xmm0, %xmm1
vpxor 848(%esp), %xmm2, %xmm2
vpsrlq $63, %xmm1, %xmm6
vpaddq %xmm1, %xmm1, %xmm1
vpsrlq $63, %xmm2, %xmm0
vpaddq %xmm2, %xmm2, %xmm2
vpor %xmm2, %xmm0, %xmm2
vpor %xmm1, %xmm6, %xmm0
vpalignr $8, %xmm2, %xmm0, %xmm6
vpalignr $8, %xmm0, %xmm2, %xmm0
vmovq 64(%edx), %xmm2
vmovhpd 80(%edx), %xmm2, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vmovq 96(%edx), %xmm2
vpaddq %xmm6, %xmm7, %xmm1
vmovhpd 112(%edx), %xmm2, %xmm7
vpaddq %xmm7, %xmm3, %xmm3
vpaddq %xmm0, %xmm3, %xmm2
vpalignr $8, %xmm5, %xmm4, %xmm7
vpalignr $8, %xmm4, %xmm5, %xmm4
vpxor %xmm1, %xmm7, %xmm3
vpxor %xmm2, %xmm4, %xmm5
vpshufd $177, %xmm3, %xmm3
vpshufd $177, %xmm5, %xmm4
vpaddq 880(%esp), %xmm3, %xmm7
vpaddq 864(%esp), %xmm4, %xmm5
vmovdqu %xmm7, 896(%esp)
vpxor %xmm7, %xmm6, %xmm6
vmovdqu 1120(%esp), %xmm7
vpxor %xmm5, %xmm0, %xmm0
vmovdqu %xmm5, 912(%esp)
vmovq 72(%edx), %xmm5
vpshufb %xmm7, %xmm6, %xmm6
vpshufb %xmm7, %xmm0, %xmm7
vmovhpd 88(%edx), %xmm5, %xmm0
vpaddq %xmm0, %xmm1, %xmm1
vpaddq %xmm6, %xmm1, %xmm0
vmovq 104(%edx), %xmm1
vmovhpd 120(%edx), %xmm1, %xmm5
vpaddq %xmm5, %xmm2, %xmm2
vpaddq %xmm7, %xmm2, %xmm2
vpxor %xmm0, %xmm3, %xmm5
vpxor %xmm2, %xmm4, %xmm4
vmovdqu 1056(%esp), %xmm3
vpshufb %xmm3, %xmm5, %xmm5
vpshufb %xmm3, %xmm4, %xmm4
vmovdqu %xmm5, 928(%esp)
vpaddq 896(%esp), %xmm5, %xmm5
vpaddq 912(%esp), %xmm4, %xmm3
vpxor %xmm5, %xmm6, %xmm6
vpxor %xmm3, %xmm7, %xmm7
vmovdqu %xmm5, 944(%esp)
vpsrlq $63, %xmm6, %xmm5
vpaddq %xmm6, %xmm6, %xmm6
vpor %xmm6, %xmm5, %xmm5
vpsrlq $63, %xmm7, %xmm6
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm6, %xmm7
vpalignr $8, %xmm7, %xmm5, %xmm6
vpalignr $8, %xmm5, %xmm7, %xmm5
vmovq 112(%edx), %xmm7
vmovhpd 32(%edx), %xmm7, %xmm7
vpaddq %xmm7, %xmm0, %xmm0
vpaddq %xmm6, %xmm0, %xmm7
vmovq 72(%edx), %xmm0
vpunpcklqdq %xmm1, %xmm0, %xmm1
vpaddq %xmm1, %xmm2, %xmm2
vmovdqu 928(%esp), %xmm0
vpaddq %xmm5, %xmm2, %xmm2
vpalignr $8, %xmm0, %xmm4, %xmm1
vpalignr $8, %xmm4, %xmm0, %xmm4
vpxor %xmm7, %xmm1, %xmm1
vpxor %xmm2, %xmm4, %xmm4
vpshufd $177, %xmm1, %xmm1
vpshufd $177, %xmm4, %xmm4
vpaddq 944(%esp), %xmm4, %xmm0
vpaddq %xmm1, %xmm3, %xmm3
vmovdqu %xmm3, 960(%esp)
vpxor %xmm3, %xmm6, %xmm3
vmovdqu 1120(%esp), %xmm6
vpxor %xmm0, %xmm5, %xmm5
vpshufb %xmm6, %xmm3, %xmm3
vpshufb %xmm6, %xmm5, %xmm6
vmovq 80(%edx), %xmm5
vmovhpd 64(%edx), %xmm5, %xmm5
vpaddq %xmm5, %xmm7, %xmm7
vpaddq %xmm3, %xmm7, %xmm5
vmovq 120(%edx), %xmm7
vpxor %xmm5, %xmm1, %xmm1
vmovhpd 48(%edx), %xmm7, %xmm7
vpaddq %xmm7, %xmm2, %xmm2
vpaddq %xmm6, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm7
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm7, %xmm1, %xmm1
vpshufb %xmm7, %xmm4, %xmm7
vpaddq 960(%esp), %xmm1, %xmm4
vpaddq %xmm7, %xmm0, %xmm0
vmovdqu %xmm4, 976(%esp)
vpxor %xmm4, %xmm3, %xmm4
vpxor %xmm0, %xmm6, %xmm3
vpsrlq $63, %xmm4, %xmm6
vpaddq %xmm4, %xmm4, %xmm4
vpor %xmm4, %xmm6, %xmm4
vpsrlq $63, %xmm3, %xmm6
vpaddq %xmm3, %xmm3, %xmm3
vpor %xmm3, %xmm6, %xmm3
vpalignr $8, %xmm4, %xmm3, %xmm6
vpalignr $8, %xmm3, %xmm4, %xmm3
vmovq 8(%edx), %xmm4
vmovhpd (%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vmovq 88(%edx), %xmm4
vmovhpd 40(%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm3, %xmm2, %xmm4
vpalignr $8, %xmm7, %xmm1, %xmm2
vpalignr $8, %xmm1, %xmm7, %xmm1
vpxor %xmm5, %xmm2, %xmm2
vpxor %xmm4, %xmm1, %xmm7
vpshufd $177, %xmm2, %xmm2
vpshufd $177, %xmm7, %xmm1
vpaddq %xmm2, %xmm0, %xmm0
vpaddq 976(%esp), %xmm1, %xmm7
vmovdqu %xmm0, 992(%esp)
vpxor %xmm0, %xmm6, %xmm0
vmovdqu 1120(%esp), %xmm6
vpxor %xmm7, %xmm3, %xmm3
vpshufb %xmm6, %xmm0, %xmm0
vpshufb %xmm6, %xmm3, %xmm3
vmovq 96(%edx), %xmm6
vmovhpd 16(%edx), %xmm6, %xmm6
vpaddq %xmm6, %xmm5, %xmm5
vmovq 56(%edx), %xmm6
vmovhpd 24(%edx), %xmm6, %xmm6
vpaddq %xmm0, %xmm5, %xmm5
vpaddq %xmm6, %xmm4, %xmm4
vpaddq %xmm3, %xmm4, %xmm4
vmovdqu 1056(%esp), %xmm6
vpxor %xmm5, %xmm2, %xmm2
vpshufb %xmm6, %xmm2, %xmm2
vpxor %xmm4, %xmm1, %xmm1
vpshufb %xmm6, %xmm1, %xmm6
vpaddq 992(%esp), %xmm2, %xmm1
vpaddq %xmm6, %xmm7, %xmm7
vpxor %xmm1, %xmm0, %xmm0
vpxor %xmm7, %xmm3, %xmm3
vmovdqu %xmm6, 1008(%esp)
vpsrlq $63, %xmm0, %xmm6
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm0, %xmm6, %xmm0
vpsrlq $63, %xmm3, %xmm6
vpaddq %xmm3, %xmm3, %xmm3
vpxor %xmm1, %xmm4, %xmm4
vpor %xmm3, %xmm6, %xmm6
vpxor 176(%esp), %xmm4, %xmm1
vpxor %xmm7, %xmm5, %xmm5
vmovdqu 1008(%esp), %xmm4
vpxor 192(%esp), %xmm5, %xmm7
vpalignr $8, %xmm6, %xmm0, %xmm3
vpalignr $8, %xmm2, %xmm4, %xmm5
vpalignr $8, %xmm0, %xmm6, %xmm0
vpalignr $8, %xmm4, %xmm2, %xmm2
vmovdqu %xmm7, 192(%esp)
vpxor %xmm5, %xmm3, %xmm7
vpxor %xmm2, %xmm0, %xmm6
vmovdqu %xmm1, 176(%esp)
vpxor 224(%esp), %xmm7, %xmm1
vpxor 208(%esp), %xmm6, %xmm0
movl 1024(%esp), %esi
movl 1028(%esp), %edi
vmovdqu %xmm1, 224(%esp)
vmovdqu %xmm0, 208(%esp)
cmpl $128, %esi
ja blake2b_blocks_avx_L27
blake2b_blocks_avx_L28:
movl 8(%ebp), %eax
vmovdqu 208(%esp), %xmm2
vmovdqu 224(%esp), %xmm1
vmovdqu 176(%esp), %xmm0
vmovdqu 192(%esp), %xmm3
vmovdqu %xmm3, (%eax)
vmovdqu %xmm0, 16(%eax)
vmovdqu %xmm1, 32(%eax)
vmovdqu %xmm2, 48(%eax)
addl $1268, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret
FN_END blake2b_blocks_avx


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


