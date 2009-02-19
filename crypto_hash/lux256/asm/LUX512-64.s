##########################################################################################
#	Assembler implementation of 16 rounds of LUX-512					
#	Author: Ivica Nikolic, University of Luxembourg					
##########################################################################################


.section .text
.type LUX51264, @function
.globl LUX51264
LUX51264:

  # Save the registers
  push %rbx
  push %rbp
  push %rdi
  push %rsi
  push %rsp
  push %r12
  push %r13
  push %r14
  push %r15


  # The register rbp holds the begining of the 8-32 lookup tables.
  movq %rdi,%rbp

  # Save the core and the buffer addresses
  movq %rsi,corel
  movq %rdx,bufferl

  # Save the address of the current message array
  movq %rcx,message

  # Save the length of the message
  movq %r8,length


  # The registers XMM0-XMM11, MM0-MM3 hold the buffer
  # The registers r8-r15 hold the core


  # Annulate all the working registers
  xor %r8,%r8
  xor %r9,%r9
  xor %r10,%r10
  xor %r11,%r11
  xor %r12,%r12
  xor %r13,%r13
  xor %r14,%r14
  xor %r15,%r15
  pxor %xmm0,%xmm0
  pxor %xmm1,%xmm1
  pxor %xmm2,%xmm2
  pxor %xmm3,%xmm3
  pxor %xmm4,%xmm4
  pxor %xmm5,%xmm5
  pxor %xmm6,%xmm6
  pxor %xmm7,%xmm7
  pxor %xmm8,%xmm8
  pxor %xmm9,%xmm9
  pxor %xmm10,%xmm10
  pxor %xmm11,%xmm11
  pxor %xmm12,%xmm12
  pxor %xmm13,%xmm13
  pxor %xmm14,%xmm14
  pxor %xmm15,%xmm15
  pxor %mm0,%mm0
  pxor %mm1,%mm1
  pxor %mm2,%mm2
  pxor %mm3,%mm3
  pxor %mm4,%mm4
  pxor %mm5,%mm5
  pxor %mm6,%mm6
  pxor %mm7,%mm7


start128:

############################################################ 1 ROUND ############################################################

  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm0
  add $8,%rcx
  movq %rcx, message


  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15


  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm3
  pxor %xmm13,%xmm4
  pxor %xmm14,%xmm5
  pxor %xmm15,%xmm6
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm7
  pxor %xmm13,%xmm8
  pxor %xmm14,%xmm9
  pxor %xmm15,%xmm10

  # Feedforward from the buffer to the core
  movq %mm2,%rax
  xor %rax,%r15


############################################################ 2 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm3
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm2
  pxor %xmm13,%xmm3
  pxor %xmm14,%xmm4
  pxor %xmm15,%xmm5
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm6
  pxor %xmm13,%xmm7
  pxor %xmm14,%xmm8
  pxor %xmm15,%xmm9

  # Feedforward from the buffer to the core
  movq %mm1,%rax
  xor %rax,%r15


############################################################ 3 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm2
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm1
  pxor %xmm13,%xmm2
  pxor %xmm14,%xmm3
  pxor %xmm15,%xmm4
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm5
  pxor %xmm13,%xmm6
  pxor %xmm14,%xmm7
  pxor %xmm15,%xmm8

  # Feedforward from the buffer to the core
  movq %mm0,%rax
  xor %rax,%r15


############################################################ 4 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm1
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm0
  pxor %xmm13,%xmm1
  pxor %xmm14,%xmm2
  pxor %xmm15,%xmm3
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

  # Feedforward from the buffer to the core
  movq %xmm11,%rax
  xor %rax,%r15


############################################################ 5 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm0
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%mm4
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %mm4,%mm3
  pxor %xmm13,%xmm0
  pxor %xmm14,%xmm1
  pxor %xmm15,%xmm2
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm3
  pxor %xmm13,%xmm4
  pxor %xmm14,%xmm5
  pxor %xmm15,%xmm6

  # Feedforward from the buffer to the core
  movq %xmm10,%rax
  xor %rax,%r15


############################################################ 6 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm11
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%mm4
  movq %r9,%mm5
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %mm4,%mm2
  pxor %mm5,%mm3
  pxor %xmm14,%xmm0
  pxor %xmm15,%xmm1
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm2
  pxor %xmm13,%xmm3
  pxor %xmm14,%xmm4
  pxor %xmm15,%xmm5

  # Feedforward from the buffer to the core
  movq %xmm9,%rax
  xor %rax,%r15


############################################################ 7 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm10
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%mm4
  movq %r9,%mm5
  movq %r10,%mm6
  movq %r11,%xmm15
  pxor %mm4,%mm1
  pxor %mm5,%mm2
  pxor %mm6,%mm3
  pxor %xmm15,%xmm0
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm1
  pxor %xmm13,%xmm2
  pxor %xmm14,%xmm3
  pxor %xmm15,%xmm4

  # Feedforward from the buffer to the core
  movq %xmm8,%rax
  xor %rax,%r15



############################################################ 8 ROUND ############################################################



  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm9
  add $8,%rcx
  movq %rcx, message

   # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%mm4
  movq %r9,%mm5
  movq %r10,%mm6
  movq %r11,%mm7
  pxor %mm4,%mm0
  pxor %mm5,%mm1
  pxor %mm6,%mm2
  pxor %mm7,%mm3
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm0
  pxor %xmm13,%xmm1
  pxor %xmm14,%xmm2
  pxor %xmm15,%xmm3

  # Feedforward from the buffer to the core
  movq %xmm7,%rax
  xor %rax,%r15


############################################################ 9 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm8
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%mm5
  movq %r10,%mm6
  movq %r11,%mm7
  pxor %xmm12,%xmm11
  pxor %mm5,%mm0
  pxor %mm6,%mm1
  pxor %mm7,%mm2
  movq %r12,%mm4
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %mm4,%mm3
  pxor %xmm13,%xmm0
  pxor %xmm14,%xmm1
  pxor %xmm15,%xmm2

  # Feedforward from the buffer to the core
  movq %xmm6,%rax
  xor %rax,%r15


############################################################ 10 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm7
  add $8,%rcx
  movq %rcx, message

   # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%mm6
  movq %r11,%mm7
  pxor %xmm12,%xmm10
  pxor %xmm13,%xmm11
  pxor %mm6,%mm0
  pxor %mm7,%mm1
  movq %r12,%mm4
  movq %r13,%mm5
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %mm4,%mm2
  pxor %mm5,%mm3
  pxor %xmm14,%xmm0
  pxor %xmm15,%xmm1

  # Feedforward from the buffer to the core
  movq %xmm5,%rax
  xor %rax,%r15


############################################################ 11 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm6
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%mm7
  pxor %xmm12,%xmm9
  pxor %xmm13,%xmm10
  pxor %xmm14,%xmm11
  pxor %mm7,%mm0
  movq %r12,%mm4
  movq %r13,%mm5
  movq %r14,%mm6
  movq %r15,%xmm15
  pxor %mm4,%mm1
  pxor %mm5,%mm2
  pxor %mm6,%mm3
  pxor %xmm15,%xmm0

  # Feedforward from the buffer to the core
  movq %xmm4,%rax
  xor %rax,%r15



############################################################ 12 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm5
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm8
  pxor %xmm13,%xmm9
  pxor %xmm14,%xmm10
  pxor %xmm15,%xmm11
  movq %r12,%mm4
  movq %r13,%mm5
  movq %r14,%mm6
  movq %r15,%mm7
  pxor %mm4,%mm0
  pxor %mm5,%mm1
  pxor %mm6,%mm2
  pxor %mm7,%mm3

  # Feedforward from the buffer to the core
  movq %xmm3,%rax
  xor %rax,%r15



############################################################ 13 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm4
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm7
  pxor %xmm13,%xmm8
  pxor %xmm14,%xmm9
  pxor %xmm15,%xmm10
  movq %r12,%xmm12
  movq %r13,%mm5
  movq %r14,%mm6
  movq %r15,%mm7
  pxor %xmm12,%xmm11
  pxor %mm5,%mm0
  pxor %mm6,%mm1
  pxor %mm7,%mm2

  # Feedforward from the buffer to the core
  movq %xmm2,%rax
  xor %rax,%r15


############################################################ 14 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm3
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm6
  pxor %xmm13,%xmm7
  pxor %xmm14,%xmm8
  pxor %xmm15,%xmm9
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%mm6
  movq %r15,%mm7
  pxor %xmm12,%xmm10
  pxor %xmm13,%xmm11
  pxor %mm6,%mm0
  pxor %mm7,%mm1

  # Feedforward from the buffer to the core
  movq %xmm1,%rax
  xor %rax,%r15


############################################################ 15 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm2
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm5
  pxor %xmm13,%xmm6
  pxor %xmm14,%xmm7
  pxor %xmm15,%xmm8
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%mm7
  pxor %xmm12,%xmm9
  pxor %xmm13,%xmm10
  pxor %xmm14,%xmm11
  pxor %mm7,%mm0

  # Feedforward from the buffer to the core
  movq %xmm0,%rax
  xor %rax,%r15


############################################################ 16 ROUND ############################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movq (%rcx),%rax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm1
  add $8,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  mov %r12,core4
  mov %r13,core5
  mov %r14,core6
  mov %r15,core7

  # One round of AES-256
  movzbl %al,%esi
  movq 14336(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  movq 12288(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  movq 10240(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  movq 8192(%rbp,%rdi,8),%r12
  shr $16, %rax
  movzbl %al,%esi
  movq 6144(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  movq 4096(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  movq 2048(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  movq (%rbp,%rdi,8),%r8

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r13
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r9

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r14
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r10

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r15
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r11

  xor $0x2ad01c64,%r8
  movq core4,%rax
  movq core5,%rbx
  movq core6,%rcx
  movq core7,%rdx

  movzbl %al,%esi
  xorq 14336(%rbp,%rsi,8),%r13
  movzbl %ah,%edi
  xorq 12288(%rbp,%rdi,8),%r14
  shr $16, %rax
  movzbl %al,%esi
  xorq 10240(%rbp,%rsi,8),%r15
  movzbl %ah,%edi
  xorq 8192(%rbp,%rdi,8),%r8
  shr $16, %rax
  movzbl %al,%esi
  xorq 6144(%rbp,%rsi,8),%r9
  movzbl %ah,%edi
  xorq 4096(%rbp,%rdi,8),%r10
  shr $16, %rax
  movzbl %al,%esi
  xorq 2048(%rbp,%rsi,8),%r11
  movzbl %ah,%edi
  xorq (%rbp,%rdi,8),%r12

  movzbl %bl,%esi
  xorq 14336(%rbp,%rsi,8),%r14
  movzbl %bh,%edi
  xorq 12288(%rbp,%rdi,8),%r15
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 10240(%rbp,%rsi,8),%r8
  movzbl %bh,%edi
  xorq 8192(%rbp,%rdi,8),%r9
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 6144(%rbp,%rsi,8),%r10
  movzbl %bh,%edi
  xorq 4096(%rbp,%rdi,8),%r11
  shr $16, %rbx
  movzbl %bl,%esi
  xorq 2048(%rbp,%rsi,8),%r12
  movzbl %bh,%edi
  xorq (%rbp,%rdi,8),%r13

  movzbl %cl,%esi
  xorq 14336(%rbp,%rsi,8),%r15
  movzbl %ch,%edi
  xorq 12288(%rbp,%rdi,8),%r8
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 10240(%rbp,%rsi,8),%r9
  movzbl %ch,%edi
  xorq 8192(%rbp,%rdi,8),%r10
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 6144(%rbp,%rsi,8),%r11
  movzbl %ch,%edi
  xorq 4096(%rbp,%rdi,8),%r12
  shr $16, %rcx
  movzbl %cl,%esi
  xorq 2048(%rbp,%rsi,8),%r13
  movzbl %ch,%edi
  xorq (%rbp,%rdi,8),%r14

  movzbl %dl,%esi
  xorq 14336(%rbp,%rsi,8),%r8
  movzbl %dh,%edi
  xorq 12288(%rbp,%rdi,8),%r9
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 10240(%rbp,%rsi,8),%r10
  movzbl %dh,%edi
  xorq 8192(%rbp,%rdi,8),%r11
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 6144(%rbp,%rsi,8),%r12
  movzbl %dh,%edi
  xorq 4096(%rbp,%rdi,8),%r13
  shr $16, %rdx
  movzbl %dl,%esi
  xorq 2048(%rbp,%rsi,8),%r14
  movzbl %dh,%edi
  xorq (%rbp,%rdi,8),%r15

  # Add the core to the buffer
  movq %r8,%xmm12
  movq %r9,%xmm13
  movq %r10,%xmm14
  movq %r11,%xmm15
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm12,%xmm8
  pxor %xmm13,%xmm9
  pxor %xmm14,%xmm10
  pxor %xmm15,%xmm11

  # Feedforward from the buffer to the core
  movq %mm3,%rax
  xor %rax,%r15


#################################################################################################################################


  movq length,%rax
  sub $128,%rax
  cmp $127,%rax
  movq %rax,length
  ja start128


  # Save the core and the buffer
  movq corel,%rax
  mov %r8,(%rax)
  mov %r9,8(%rax)
  mov %r10,16(%rax)
  mov %r11,24(%rax)
  mov %r12,32(%rax)
  mov %r13,40(%rax)
  mov %r14,48(%rax)
  mov %r15,56(%rax)

  movq bufferl,%rax
  movq %xmm0,%rbx
  movq %rbx,0(%rax)
  movq %xmm1,%rbx
  movq %rbx,8(%rax)
  movq %xmm2,%rbx
  movq %rbx,16(%rax)
  movq %xmm3,%rbx
  movq %rbx,24(%rax)
  movq %xmm4,%rbx
  movq %rbx,32(%rax)
  movq %xmm5,%rbx
  movq %rbx,40(%rax)
  movq %xmm6,%rbx
  movq %rbx,48(%rax)
  movq %xmm7,%rbx
  movq %rbx,56(%rax)
  movq %xmm8,%rbx
  movq %rbx,64(%rax)
  movq %xmm9,%rbx
  movq %rbx,72(%rax)
  movq %xmm10,%rbx
  movq %rbx,80(%rax)
  movq %xmm11,%rbx
  movq %rbx,88(%rax)
  movq %mm0,%rbx
  movq %rbx,96(%rax)
  movq %mm1,%rbx
  movq %rbx,104(%rax)
  movq %mm2,%rbx
  movq %rbx,112(%rax)
  movq %mm3,%rbx
  movq %rbx,120(%rax)





  # Pop the old values for the registers
  pop %r15
  pop %r14
  pop %r13
  pop %r12
  pop %rsp
  pop %rsi
  pop %rdi
  pop %rbp
  pop %rbx



  ret

.section .data
message:
    .quad 0x0
length:
    .quad 0x0
corel:
    .quad 0x0
bufferl:
    .quad 0x0
core4:
    .quad 0x0
core5:
    .quad 0x0
core6:
    .quad 0x0
core7:
    .quad 0x0

