##########################################################################################
#	Assembler implementation of 16 rounds of LUX-256					
#	Author: Ivica Nikolic, University of Luxembourg					
##########################################################################################


.section .text
.type LUX25664, @function
.globl LUX25664
LUX25664:

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


  # Save the core and the buffer addresses
  movq %rsi,corel
  movq %rdx,bufferl

  # Save the address of the current message array
  movq %rcx,message

  # Save the length of the message
  movq %r8,length

##########################################################################################################################################################################

  # The registers XMM0-XMM11, MM0-MM3 hold the buffer
  # The registers r8-r15 hold the core

  # The register rbp holds the begining of the 8-32 lookup tables.
  movq %rdi,%rbp

  # Zero all the working registers
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

  xor %rax,%rax
  xor %rbx,%rbx
  xor %rcx,%rcx
  xor %rdx,%rdx


start128:

############################################################ 1 ROUND #################################################

  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm0
  add $4,%rcx
  movq %rcx, message


  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d


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

############################################################ 2 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm3
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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




############################################################ 3 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm2
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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




############################################################ 4 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm1
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 5 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%mm4
  pxor %mm4,%mm0
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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





############################################################ 6 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm11
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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





############################################################ 7 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm10
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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





############################################################ 8 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm9
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 9 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm8
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 10 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm7
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 11 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm6
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 12 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm5
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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





############################################################ 13 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm4
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 14 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm3
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



############################################################ 15 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm2
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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


############################################################ 16 ROUND #################################################


  # Add the message word to the core and the buffer
  movq message,%rcx
  movl (%rcx),%eax
  xor %rax,%r8
  movq %rax,%xmm12
  pxor %xmm12,%xmm1
  add $4,%rcx
  movq %rcx, message

  # Save the previous core in rax, rbx, rcx, and rdx
  mov %r12,%rax
  mov %r13,%rbx
  mov %r14,%rcx
  mov %r15,%rdx
  shlq $32,%rax
  shlq $32,%rbx
  shlq $32,%rcx
  shlq $32,%rdx
  xor %r8,%rax
  xor %r9,%rbx
  xor %r10,%rcx
  xor %r11,%rdx


  # One round of AES-256
  movzbl %al,%esi
  movl 3072(%rbp,%rsi,4),%r12d
  movzbl %ah,%esi
  movl 2048(%ebp,%esi,4),%r13d
  shrq $16, %rax
  movzbl %al,%edi
  movl 1024(%ebp,%edi,4),%r15d
  movzbl %ah,%esi
  movl (%ebp,%esi,4),%r8d

  movzbl %bl,%esi
  xorl 3072(%rbp,%rsi,4),%r13d
  movzbl %bh,%edi
  movl 2048(%rbp,%rdi,4),%r14d
  shrq $16, %rbx
  movzbl %bl,%esi
  xorl 1024(%rbp,%rsi,4),%r8d
  movzbl %bh,%edi
  movl (%rbp,%rdi,4),%r9d

  movzbl %cl,%edi
  xorl 3072(%rbp,%rdi,4),%r14d
  movzbl %ch,%esi
  xorl 2048(%rbp,%rsi,4),%r15d
  shrq $16, %rcx
  movzbl %cl,%edi
  xorl 1024(%rbp,%rdi,4),%r9d
  movzbl %ch,%esi
  movl (%rbp,%rsi,4),%r10d

  movzbl %dl,%esi
  xorl 3072(%rbp,%rsi,4),%r15d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r8d
  shrq $16, %rdx
  movzbl %dl,%esi
  xorl 1024(%rbp,%rsi,4),%r10d
  movzbl %dh,%edi
  movl (%rbp,%rdi,4),%r11d

  xor $0x2ad01c64,%r8
  shrq $16, %rax
  shrq $16, %rbx
  shrq $16, %rcx
  shrq $16, %rdx

  movzbl %al,%esi
  xorl 3072(%rbp,%rsi,4),%r8d
  movzbl %ah,%edi
  xorl 2048(%rbp,%rdi,4),%r9d
  shrq $16, %rax
  movzbl %al,%esi
  xorl 1024(%rbp,%rsi,4),%r11d
  movzbl %ah,%edi
  xorl (%rbp,%rdi,4),%r12d

  movzbl %bl,%edi
  xorl 3072(%rbp,%rdi,4),%r9d
  movzbl %bh,%esi
  xorl 2048(%rbp,%rsi,4),%r10d
  shrq $16, %rbx
  movzbl %bl,%edi
  xorl 1024(%rbp,%rdi,4),%r12d
  movzbl %bh,%esi
  xorl (%rbp,%rsi,4),%r13d

  movzbl %cl,%esi
  xorl 3072(%rbp,%rsi,4),%r10d
  movzbl %ch,%edi
  xorl 2048(%rbp,%rdi,4),%r11d
  shrq $16, %rcx
  movzbl %cl,%esi
  xorl 1024(%rbp,%rsi,4),%r13d
  movzbl %ch,%edi
  xorl (%rbp,%rdi,4),%r14d

  movzbl %dl,%edi
  xorl 3072(%rbp,%rdi,4),%r11d
  movzbl %dh,%edi
  xorl 2048(%rbp,%rdi,4),%r12d
  shrq $16, %rdx
  movzbl %dl,%edi
  xorl 1024(%rbp,%rdi,4),%r14d
  movzbl %dh,%esi
  xorl (%rbp,%rsi,4),%r15d

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



  movq length,%rax
  sub $64,%rax
  cmp $63,%rax
  movq %rax,length
  ja start128



  # Save the core and the buffer
  movq corel,%rax
  movl %r8d,(%rax)
  movl %r9d,4(%rax)
  movl %r10d,8(%rax)
  movl %r11d,12(%rax)
  movl %r12d,16(%rax)
  movl %r13d,20(%rax)
  movl %r14d,24(%rax)
  movl %r15d,28(%rax)

  movq bufferl,%rax
  movq %xmm0,%rbx
  movl %ebx,0(%rax)
  movq %xmm1,%rbx
  movl %ebx,4(%rax)
  movq %xmm2,%rbx
  movl %ebx,8(%rax)
  movq %xmm3,%rbx
  movl %ebx,12(%rax)
  movq %xmm4,%rbx
  movl %ebx,16(%rax)
  movq %xmm5,%rbx
  movl %ebx,20(%rax)
  movq %xmm6,%rbx
  movl %ebx,24(%rax)
  movq %xmm7,%rbx
  movl %ebx,28(%rax)
  movq %xmm8,%rbx
  movl %ebx,32(%rax)
  movq %xmm9,%rbx
  movl %ebx,36(%rax)
  movq %xmm10,%rbx
  movl %ebx,40(%rax)
  movq %xmm11,%rbx
  movl %ebx,44(%rax)
  movq %mm0,%rbx
  movl %ebx,48(%rax)
  movq %mm1,%rbx
  movl %ebx,52(%rax)
  movq %mm2,%rbx
  movl %ebx,56(%rax)
  movq %mm3,%rbx
  movl %ebx,60(%rax)




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

