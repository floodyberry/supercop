#include "x86.inc"

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2b_blocks_xop
leal 4(%esp), %ecx
andl $-64, %esp
pushl -4(%ecx)
pushl %ebp
movl %esp, %ebp
pushl %edi
pushl %esi
pushl %ebx
LOAD_VAR_PIC blake2b_constants, %ebx
pushl %ecx
subl $360, %esp
movl 8(%ecx), %eax
movl 12(%ecx), %edx
movl (%ecx), %edi
movl 4(%ecx), %esi
movl $128, %ecx
movl %eax, -188(%ebp)
cmpl $128, %eax
movl %edx, -196(%ebp)
cmovbe %eax, %ecx
movl 84(%edi), %eax
orl 80(%edi), %eax
vmovups 80(%edi), %xmm0
movl %ecx, -192(%ebp)
vxorps 48(%ebx), %xmm0, %xmm1
vmovaps %xmm1, -312(%ebp)
je .Lblake2b_blocks_xop_2
movl -188(%ebp), %eax
cmpl $128, %eax
je .Lblake2b_blocks_xop_2
testb $64, %al
je .Lblake2b_blocks_xop_3
vmovups (%esi), %xmm0
leal -120(%ebp), %eax
addl $64, %esi
vmovaps %xmm0, -184(%ebp)
vmovups -48(%esi), %xmm0
vmovaps %xmm0, -168(%ebp)
vmovups -32(%esi), %xmm0
vmovaps %xmm0, -152(%ebp)
vmovups -16(%esi), %xmm0
vmovaps %xmm0, -136(%ebp)
jmp .Lblake2b_blocks_xop_4
.Lblake2b_blocks_xop_3:
vxorps %xmm0, %xmm0, %xmm0
leal -184(%ebp), %eax
vmovaps %xmm0, -120(%ebp)
vmovaps %xmm0, -104(%ebp)
vmovaps %xmm0, -88(%ebp)
vmovaps %xmm0, -72(%ebp)
.Lblake2b_blocks_xop_4:
testb $32, -188(%ebp)
vxorps %xmm0, %xmm0, %xmm0
vmovaps %xmm0, (%eax)
vmovaps %xmm0, 16(%eax)
vmovaps %xmm0, 32(%eax)
vmovaps %xmm0, 48(%eax)
je .Lblake2b_blocks_xop_5
vmovups (%esi), %xmm0
addl $32, %eax
addl $32, %esi
vmovaps %xmm0, -32(%eax)
vmovups -16(%esi), %xmm0
vmovaps %xmm0, -16(%eax)
.Lblake2b_blocks_xop_5:
testb $16, -188(%ebp)
je .Lblake2b_blocks_xop_6
vmovups (%esi), %xmm0
addl $16, %eax
addl $16, %esi
vmovaps %xmm0, -16(%eax)
.Lblake2b_blocks_xop_6:
testb $8, -188(%ebp)
je .Lblake2b_blocks_xop_7
movl (%esi), %edx
movl 4(%esi), %ecx
addl $8, %eax
addl $8, %esi
movl %edx, -8(%eax)
movl %ecx, -4(%eax)
.Lblake2b_blocks_xop_7:
testb $4, -188(%ebp)
je .Lblake2b_blocks_xop_8
movl (%esi), %edx
addl $4, %eax
addl $4, %esi
movl %edx, -4(%eax)
.Lblake2b_blocks_xop_8:
testb $2, -188(%ebp)
je .Lblake2b_blocks_xop_9
movw (%esi), %dx
addl $2, %eax
addl $2, %esi
movw %dx, -2(%eax)
.Lblake2b_blocks_xop_9:
testb $1, -188(%ebp)
leal -184(%ebp), %edx
je .Lblake2b_blocks_xop_16
movb (%esi), %cl
movb %cl, (%eax)
.Lblake2b_blocks_xop_16:
movl %edx, %esi
.Lblake2b_blocks_xop_2:
vmovups (%edi), %xmm0
movl -192(%ebp), %eax
vmovaps %xmm0, -216(%ebp)
vmovups 16(%edi), %xmm0
vmovaps %xmm0, -232(%ebp)
vmovups 32(%edi), %xmm0
vmovaps %xmm0, -248(%ebp)
vmovups 48(%edi), %xmm0
movl %eax, -336(%ebp)
movl $0, -332(%ebp)
vmovaps %xmm0, -264(%ebp)
.Lblake2b_blocks_xop_15:
movl -336(%ebp), %eax
addl 64(%edi), %eax
movl -332(%ebp), %edx
adcl 68(%edi), %edx
movl %eax, 64(%edi)
cmpl $0, %edx
movl %edx, 68(%edi)
ja .Lblake2b_blocks_xop_10
cmpl -192(%ebp), %eax
jae .Lblake2b_blocks_xop_10
addl $1, 72(%edi)
adcl $0, 76(%edi)
.Lblake2b_blocks_xop_10:
vmovaps 16(%ebx), %xmm1
leal 64(%ebx), %eax
leal 192(%eax), %edx
vmovaps -232(%ebp), %xmm2
vmovaps 0(%ebx), %xmm7
vmovaps -312(%ebp), %xmm3
vmovaps %xmm1, -296(%ebp)
vmovaps -264(%ebp), %xmm0
vmovaps -248(%ebp), %xmm1
vmovups 64(%edi), %xmm4
movl %edx, -200(%ebp)
vmovaps %xmm2, -280(%ebp)
vmovaps -216(%ebp), %xmm2
vxorps 32(%ebx), %xmm4, %xmm4
.Lblake2b_blocks_xop_13:
movzbl (%eax), %ecx
movzbl 2(%eax), %edx
addl $16, %eax
vmovq (%esi,%ecx), %xmm5
movzbl -12(%eax), %ecx
vmovhps (%esi,%edx), %xmm5, %xmm6
movzbl -10(%eax), %edx
vpaddq %xmm6, %xmm2, %xmm6
vmovq (%esi,%ecx), %xmm2
movzbl -15(%eax), %ecx
vpaddq %xmm1, %xmm6, %xmm6
vmovhps (%esi,%edx), %xmm2, %xmm5
vxorps %xmm6, %xmm4, %xmm4
movzbl -13(%eax), %edx
vpaddq -280(%ebp), %xmm5, %xmm5
vprotq $32, %xmm4, %xmm4
vpaddq %xmm4, %xmm7, %xmm2
vxorps %xmm2, %xmm1, %xmm1
vprotq $40, %xmm1, %xmm1
vpaddq %xmm0, %xmm5, %xmm5
vxorps %xmm5, %xmm3, %xmm3
vprotq $32, %xmm3, %xmm3
vpaddq -296(%ebp), %xmm3, %xmm7
vmovaps %xmm7, -280(%ebp)
vxorps %xmm7, %xmm0, %xmm0
vmovq (%esi,%ecx), %xmm7
movzbl -11(%eax), %ecx
vprotq $40, %xmm0, %xmm0
vmovhps (%esi,%edx), %xmm7, %xmm7
movzbl -9(%eax), %edx
vpaddq %xmm7, %xmm6, %xmm7
vmovq (%esi,%ecx), %xmm6
movzbl -8(%eax), %ecx
vpaddq %xmm1, %xmm7, %xmm7
vmovhps (%esi,%edx), %xmm6, %xmm6
vxorps %xmm7, %xmm4, %xmm4
movzbl -6(%eax), %edx
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm0, %xmm5, %xmm6
vprotq $48, %xmm4, %xmm5
vxorps %xmm6, %xmm3, %xmm3
vmovaps %xmm6, -296(%ebp)
vprotq $48, %xmm3, %xmm6
vpaddq %xmm5, %xmm2, %xmm3
vpaddq -280(%ebp), %xmm6, %xmm2
vpalignr $8, %xmm5, %xmm6, %xmm4
vpalignr $8, %xmm6, %xmm5, %xmm6
vmovq (%esi,%ecx), %xmm5
movzbl -4(%eax), %ecx
vxorps %xmm3, %xmm1, %xmm1
vmovaps %xmm3, -280(%ebp)
vxorps %xmm2, %xmm0, %xmm0
vmovaps %xmm2, -328(%ebp)
vprotq $1, %xmm1, %xmm2
vprotq $1, %xmm0, %xmm1
vpalignr $8, %xmm2, %xmm1, %xmm3
vpalignr $8, %xmm1, %xmm2, %xmm1
vmovhps (%esi,%edx), %xmm5, %xmm2
movzbl -2(%eax), %edx
vmovq (%esi,%ecx), %xmm5
vpaddq %xmm2, %xmm7, %xmm2
vpaddq %xmm3, %xmm2, %xmm2
vmovhps (%esi,%edx), %xmm5, %xmm5
vxorps %xmm2, %xmm6, %xmm6
vpaddq -296(%ebp), %xmm5, %xmm5
vprotq $32, %xmm6, %xmm0
vpaddq -328(%ebp), %xmm0, %xmm7
vpaddq %xmm1, %xmm5, %xmm5
vxorps %xmm7, %xmm3, %xmm3
vxorps %xmm5, %xmm4, %xmm4
vprotq $40, %xmm3, %xmm3
vprotq $32, %xmm4, %xmm4
vpaddq -280(%ebp), %xmm4, %xmm6
movzbl -7(%eax), %ecx
movzbl -5(%eax), %edx
vmovaps %xmm6, -328(%ebp)
vxorps %xmm6, %xmm1, %xmm1
vmovq (%esi,%ecx), %xmm6
movzbl -3(%eax), %ecx
vprotq $40, %xmm1, %xmm1
vmovhps (%esi,%edx), %xmm6, %xmm6
movzbl -1(%eax), %edx
cmpl -200(%ebp), %eax
vpaddq %xmm6, %xmm2, %xmm2
vmovq (%esi,%ecx), %xmm6
vpaddq %xmm3, %xmm2, %xmm2
vmovhps (%esi,%edx), %xmm6, %xmm6
vxorps %xmm2, %xmm0, %xmm0
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm1, %xmm5, %xmm5
vxorps %xmm5, %xmm4, %xmm4
vmovaps %xmm5, -280(%ebp)
vprotq $48, %xmm0, %xmm5
vpaddq %xmm5, %xmm7, %xmm7
vprotq $48, %xmm4, %xmm4
vmovaps %xmm7, %xmm0
vmovaps %xmm7, -296(%ebp)
vpaddq -328(%ebp), %xmm4, %xmm7
vxorps %xmm0, %xmm3, %xmm3
vmovaps %xmm0, %xmm6
vprotq $1, %xmm3, %xmm3
vxorps %xmm7, %xmm1, %xmm1
vprotq $1, %xmm1, %xmm0
vpalignr $8, %xmm0, %xmm3, %xmm1
vpalignr $8, %xmm3, %xmm0, %xmm0
vpalignr $8, %xmm4, %xmm5, %xmm3
vpalignr $8, %xmm5, %xmm4, %xmm4
jb .Lblake2b_blocks_xop_13
vxorps %xmm7, %xmm2, %xmm2
vmovaps -280(%ebp), %xmm7
vxorps %xmm4, %xmm1, %xmm4
movl -188(%ebp), %eax
vxorps -216(%ebp), %xmm2, %xmm1
vxorps -248(%ebp), %xmm4, %xmm4
vxorps %xmm6, %xmm7, %xmm7
vxorps %xmm3, %xmm0, %xmm0
cmpl $128, %eax
vmovaps %xmm1, -216(%ebp)
vxorps -232(%ebp), %xmm7, %xmm1
vmovaps %xmm4, -248(%ebp)
vxorps -264(%ebp), %xmm0, %xmm4
vmovaps %xmm1, -232(%ebp)
vmovaps %xmm4, -264(%ebp)
jbe .Lblake2b_blocks_xop_14
addl $-128, %eax
addl -196(%ebp), %esi
movl %eax, -188(%ebp)
jmp .Lblake2b_blocks_xop_15
.Lblake2b_blocks_xop_14:
vmovaps -216(%ebp), %xmm7
vmovups %xmm7, (%edi)
vmovaps -232(%ebp), %xmm2
vmovups %xmm2, 16(%edi)
vmovaps -248(%ebp), %xmm3
vmovups %xmm3, 32(%edi)
vmovaps -264(%ebp), %xmm4
vmovups %xmm4, 48(%edi)
addl $360, %esp
popl %ecx
popl %ebx
popl %esi
popl %edi
popl %ebp
leal -4(%ecx), %esp
ret
FN_END blake2b_blocks_xop


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



