##########################################################################################
#	Assembler implementation of one round of Cheetah-256					
#	Author: Ivica Nikolic, University of Luxembourg					
##########################################################################################


.section .text
.type Cheetah25664, @function
.globl Cheetah25664
Cheetah25664:

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

  # Save the address of the 8x32 tables
  movq %rdi,tbl32

  # The register rbp holds the begining of the 8-64 lookup tables.
  movq %rsi,%rbp
  movq %rsi,tbl64

  # Save the state addresses
  movq %rdx,statel

  # The register %rsi holds the addres of the message. Save the address of the current message array.
  movq %rcx,message
  movq %rcx,%rsi

  # Save the length of the message
  movq %r8,length

  # Set up the block counter
  movq $0,blccntr




start128:

  movq tbl64,%rbp
  movq message,%rsi



  # First produce the message expanstion (with 8x16) and write it into the memory.
  # The registers XMM0-XMM7, r8-r15 hold the 8x16 state

################################################################# FIRST ROUND 8x16 #########################################

  ############################################# s0 ######################################
  # Put (message+0) into rax
  movq (%rsi),%rax
  # Get (message+0)&0xff
  movzbl %al,%ecx
  # Put s8=Tb3((message+0) & 0xff)
  movq	6144(%rbp,%rcx,8),%r8
  # Get ((message+0)>>8)&0xff
  movzbl %ah,%ebx
  # Put s9=Tb2( ((message+0)>>8)&0xff )
  movq  4096(%rbp,%rbx,8),%r9
  # Get ((message+0)>>16)&0xff
  shr $16,%rax
  movzbl %al,%ecx
  # Put s10=Tb1( ((message+0)>>16)&0xff )
  movq	2048(%rbp,%rcx,8),%r10
  # Get ((message+0)>>24)&0xff
  movzbl %ah,%ebx
  # Put s11=Tb0( ((message+0)>>24)&0xff )
  movq  (%rbp,%rbx,8),%r11
  # Get ((message+0)>>32)&0xff
  shr $16,%rax
  movzbl %al,%ecx
  # Put s13=Tb7( ((message+0)>>32)&0xff )
  movq	14336(%rbp,%rcx,8),%r13
  # Get ((message+0)>>40)&0xff
  movzbl %ah,%ebx
  # Put s14=Tb6( ((message+0)>>40)&0xff )
  movq  12288(%rbp,%rbx,8),%r14
  # Get ((message+0)>>48)&0xff
  shr $16,%rax
  movzbl %al,%ecx
  # Put s15=Tb5( ((message+0)>>48)&0xff )
  movq	10240(%rbp,%rcx,8),%r15
  # Get ((message+0)>>56)&0xff
  movzbl %ah,%ebx
  # Put s0=Tb6( ((message+0)>>56)&0xff )
  movq  8192(%rbp,%rbx,8),%xmm0

  movq const1,%xmm8
  pxor %xmm8,%xmm0

  ############################################# s1 ######################################
  # Put (message+8) into rax
  movq 8(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r15
  shr $16,%rax
  movzbl %al,%ecx
  # xor with xmm0
  movq	10240(%rbp,%rcx,8),%xmm8
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm1
  pxor %xmm8,%xmm0

  ############################################# s2 ######################################
  # Put (message+16) into rax
  movq 16(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm8
  # xor with xmm1
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm9
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm2
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1


  ############################################# s3 ######################################
  # Put (message+24) into rax
  movq 24(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r14
  shr $16,%rax
  #xor with xmm0
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm9
  # xor with xmm2
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm10
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm3
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2

 ############################################# s4 ######################################
  movq 32(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r15
  shr $16,%rax
  #xor with xmm1
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm10
  # xor with xmm3
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm11
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm4
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3


 ############################################# s5 ######################################
  movq 40(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r14
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm8
  shr $16,%rax
  #xor with xmm2
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm11
  # xor with xmm4
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm12
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm5
  pxor %xmm8,%xmm0
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4

 ############################################# s6 ######################################
  movq 48(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r15
  # xor with xmm0
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm9
  shr $16,%rax
  #xor with xmm3
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm12
  # xor with xmm5
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm13
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm6
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5

 ############################################# s7 ######################################
  movq 56(%rsi),%rax

  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm8
  # xor with xmm1
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm10
  shr $16,%rax
  #xor with xmm4
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm13
  # xor with xmm6
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm14
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm7
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6

 ############################################# s8 ######################################
  movq 64(%rsi),%rax

  # xor with xmm0
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm9
  # xor with xmm2
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm11
  shr $16,%rax
  #xor with xmm5
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm14
  # xor with xmm7
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r8
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s9 ######################################
  movq 72(%rsi),%rax

  # xor with xmm1
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm10
  # xor with xmm3
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm12
  shr $16,%rax
  #xor with xmm6
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r9
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s10 ######################################
  movq 80(%rsi),%rax

  # xor with xmm2
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm11
  # xor with xmm4
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm13
  shr $16,%rax
  #xor with xmm7
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r10
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm15,%xmm7

 ############################################# s11 ######################################
  movq 88(%rsi),%rax

  # xor with xmm3
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm12
  # xor with xmm5
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm14
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r11
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6

 ############################################# s12 ######################################
  movq 96(%rsi),%rax

  # xor with xmm4
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm13
  # xor with xmm6
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r12
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s13 ######################################
  movq 104(%rsi),%rax

  # xor with xmm5
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm14
  # xor with xmm7
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r13
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s14 ######################################
  movq 112(%rsi),%rax

  # xor with xmm6
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r14
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s15 ######################################
  movq 120(%rsi),%rax

  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r15
  pxor %xmm15,%xmm7

  # Save the values of the state
  movq $expnd,%rdi
  movq %r8,64(%rdi)
  movq %xmm0,(%rdi)
  movq %r9,72(%rdi)
  movq %xmm1,8(%rdi)
  movq %r10,80(%rdi)
  movq %xmm2,16(%rdi)
  movq %r11,88(%rdi)
  movq %xmm3,24(%rdi)
  movq %r12,96(%rdi)
  movq %xmm4,32(%rdi)
  movq %r13,104(%rdi)
  movq %xmm5,40(%rdi)
  movq %r14,112(%rdi)
  movq %xmm6,48(%rdi)
  movq %r15,120(%rdi)
  movq %xmm7,56(%rdi)

############################################################################################################################

################################################################# SECOND ROUND 8x16 ###########################################################

  # The register %rsi holds the addres of the previous state
  movq %rdi,%rsi

  ############################################# s0 ######################################
  movq (%rsi),%rax
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%r14
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%r15
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm0

  movq const2,%xmm8
  pxor %xmm8,%xmm0

  ############################################# s1 ######################################
  movq 8(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r15
  shr $16,%rax
  movzbl %al,%ecx
  # xor with xmm0
  movq	10240(%rbp,%rcx,8),%xmm8
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm1
  pxor %xmm8,%xmm0

  ############################################# s2 ######################################
  movq 16(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm8
  # xor with xmm1
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm9
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm2
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1


  ############################################# s3 ######################################
  movq 24(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r14
  shr $16,%rax
  #xor with xmm0
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm9
  # xor with xmm2
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm10
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm3
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2

 ############################################# s4 ######################################
  movq 32(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r15
  shr $16,%rax
  #xor with xmm1
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm10
  # xor with xmm3
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm11
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm4
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3


 ############################################# s5 ######################################
  movq 40(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r14
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm8
  shr $16,%rax
  #xor with xmm2
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm11
  # xor with xmm4
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm12
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm5
  pxor %xmm8,%xmm0
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4

 ############################################# s6 ######################################
  movq 48(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r15
  # xor with xmm0
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm9
  shr $16,%rax
  #xor with xmm3
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm12
  # xor with xmm5
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm13
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm6
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5

 ############################################# s7 ######################################
  movq 56(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm8
  # xor with xmm1
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm10
  shr $16,%rax
  #xor with xmm4
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm13
  # xor with xmm6
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm14
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm7
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6

 ############################################# s8 ######################################
  movq 64(%rsi),%rax
  # xor with xmm0
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm9
  # xor with xmm2
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm11
  shr $16,%rax
  #xor with xmm5
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm14
  # xor with xmm7
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r8
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s9 ######################################
  movq 72(%rsi),%rax
  # xor with xmm1
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm10
  # xor with xmm3
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm12
  shr $16,%rax
  #xor with xmm6
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r9
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s10 ######################################
  movq 80(%rsi),%rax
  # xor with xmm2
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm11
  # xor with xmm4
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm13
  shr $16,%rax
  #xor with xmm7
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r10
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm15,%xmm7

 ############################################# s11 ######################################
  movq 88(%rsi),%rax
  # xor with xmm3
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm12
  # xor with xmm5
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm14
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r11
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6

 ############################################# s12 ######################################
  movq 96(%rsi),%rax
  # xor with xmm4
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm13
  # xor with xmm6
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r12
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s13 ######################################
  movq 104(%rsi),%rax
  # xor with xmm5
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm14
  # xor with xmm7
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r13
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s14 ######################################
  movq 112(%rsi),%rax
  # xor with xmm6
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r14
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s15 ######################################
  movq 120(%rsi),%rax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r15
  pxor %xmm15,%xmm7


  # Save the values of the state
  movq %rsi,%rdi
  add $128,%rdi
  movq %r8,64(%rdi)
  movq %xmm0,(%rdi)
  movq %r9,72(%rdi)
  movq %xmm1,8(%rdi)
  movq %r10,80(%rdi)
  movq %xmm2,16(%rdi)
  movq %r11,88(%rdi)
  movq %xmm3,24(%rdi)
  movq %r12,96(%rdi)
  movq %xmm4,32(%rdi)
  movq %r13,104(%rdi)
  movq %xmm5,40(%rdi)
  movq %r14,112(%rdi)
  movq %xmm6,48(%rdi)
  movq %r15,120(%rdi)
  movq %xmm7,56(%rdi)

############################################################################################################################

################################################################# THIRD ROUND 8x16 ##########################################

  # The register %rsi holds the addres of the previous state
  movq %rdi,%rsi

  ############################################# s0 ######################################
  movq (%rsi),%rax
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%r14
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%r15
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm0

  movq const3,%xmm8
  pxor %xmm8,%xmm0

  ############################################# s1 ######################################
  movq 8(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r15
  shr $16,%rax
  movzbl %al,%ecx
  # xor with xmm0
  movq	10240(%rbp,%rcx,8),%xmm8
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm1
  pxor %xmm8,%xmm0

  ############################################# s2 ######################################
  movq 16(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm8
  # xor with xmm1
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm9
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm2
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1


  ############################################# s3 ######################################
  movq 24(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r14
  shr $16,%rax
  #xor with xmm0
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm9
  # xor with xmm2
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm10
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm3
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2

 ############################################# s4 ######################################
  movq 32(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r15
  shr $16,%rax
  #xor with xmm1
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm10
  # xor with xmm3
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm11
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm4
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3


 ############################################# s5 ######################################
  movq 40(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r14
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm8
  shr $16,%rax
  #xor with xmm2
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm11
  # xor with xmm4
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm12
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm5
  pxor %xmm8,%xmm0
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4

 ############################################# s6 ######################################
  movq 48(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r15
  # xor with xmm0
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm9
  shr $16,%rax
  #xor with xmm3
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm12
  # xor with xmm5
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm13
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm6
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5

 ############################################# s7 ######################################
  movq 56(%rsi),%rax
  movzbl %al,%ecx
  xorq	6144(%rbp,%rcx,8),%r15
  # xor with xmm0
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm8
  # xor with xmm1
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm10
  shr $16,%rax
  #xor with xmm4
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm13
  # xor with xmm6
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm14
  movzbl %ah,%ebx
  movq  8192(%rbp,%rbx,8),%xmm7
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6

 ############################################# s8 ######################################
  movq 64(%rsi),%rax
  # xor with xmm0
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm8
  # xor with xmm1
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm9
  # xor with xmm2
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm11
  shr $16,%rax
  #xor with xmm5
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm14
  # xor with xmm7
  shr $16,%rax
  movzbl %al,%ecx
  movq	10240(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r8
  pxor %xmm8,%xmm0
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s9 ######################################
  movq 72(%rsi),%rax
  # xor with xmm1
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm9
  # xor with xmm2
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm10
  # xor with xmm3
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm12
  shr $16,%rax
  #xor with xmm6
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  12288(%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r9
  pxor %xmm9,%xmm1
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s10 ######################################
  movq 80(%rsi),%rax
  # xor with xmm2
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm10
  # xor with xmm3
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm11
  # xor with xmm4
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm13
  shr $16,%rax
  #xor with xmm7
  movzbl %al,%ecx
  movq	14336(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r10
  pxor %xmm10,%xmm2
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm15,%xmm7

 ############################################# s11 ######################################
  movq 88(%rsi),%rax
  # xor with xmm3
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm11
  # xor with xmm4
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm12
  # xor with xmm5
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm14
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r11
  pxor %xmm11,%xmm3
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6

 ############################################# s12 ######################################
  movq 96(%rsi),%rax
  # xor with xmm4
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm12
  # xor with xmm5
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm13
  # xor with xmm6
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  (%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r12
  pxor %xmm12,%xmm4
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s13 ######################################
  movq 104(%rsi),%rax
  # xor with xmm5
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm13
  # xor with xmm6
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm14
  # xor with xmm7
  shr $16,%rax
  movzbl %al,%ecx
  movq	2048(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r10
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r11
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r13
  pxor %xmm13,%xmm5
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s14 ######################################
  movq 112(%rsi),%rax
  # xor with xmm6
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm14
  # xor with xmm7
  movzbl %ah,%ebx
  movq  4096(%rbp,%rbx,8),%xmm15
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r8
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r9
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r11
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r12
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r13
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r14
  pxor %xmm14,%xmm6
  pxor %xmm15,%xmm7

 ############################################# s15 ######################################
  movq 120(%rsi),%rax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%rbp,%rcx,8),%xmm15
  movzbl %ah,%ebx
  xorq  4096(%rbp,%rbx,8),%r8
  shr $16,%rax
  movzbl %al,%ecx
  xorq	2048(%rbp,%rcx,8),%r9
  movzbl %ah,%ebx
  xorq  (%rbp,%rbx,8),%r10
  shr $16,%rax
  movzbl %al,%ecx
  xorq	14336(%rbp,%rcx,8),%r12
  movzbl %ah,%ebx
  xorq  12288(%rbp,%rbx,8),%r13
  shr $16,%rax
  movzbl %al,%ecx
  xorq	10240(%rbp,%rcx,8),%r14
  movzbl %ah,%ebx
  xorq  8192(%rbp,%rbx,8),%r15
  pxor %xmm15,%xmm7


  # Save the values of the state
  movq %rsi,%rdi
  add $128,%rdi
  movq %r8,64(%rdi)
  movq %xmm0,(%rdi)
  movq %r9,72(%rdi)
  movq %xmm1,8(%rdi)
  movq %r10,80(%rdi)
  movq %xmm2,16(%rdi)
  movq %r11,88(%rdi)
  movq %xmm3,24(%rdi)
  movq %r12,96(%rdi)
  movq %xmm4,32(%rdi)
  movq %r13,104(%rdi)
  movq %xmm5,40(%rdi)
  movq %r14,112(%rdi)
  movq %xmm6,48(%rdi)
  movq %r15,120(%rdi)
  movq %xmm7,56(%rdi)


############################################## START OF THE SECOND PHASE - 4X8 RIJNDAEL ###########################################

  # The registers r8-r15 hold the state
  # The register rbp holds the begining of the 8-32 lookup tables.
  movq tbl32,%rbp

  # Add the block counter
  movq blccntr,%rdx
  movq statel,%rsi
  xorl %edx,4(%rsi)
  rolq $32,%rdx
  xorl %edx,(%rsi)
  rorq $32,%rdx
  addq $1,%rdx
  movq %rdx,blccntr

############################################################## 1 ###############################################################

  movq message,%rdi
  movq statel,%rsi
  movl 4(%rdi),%eax
  xorl (%rsi),%eax
  movl 12(%rdi),%ebx
  xorl 4(%rsi),%ebx
  movl 20(%rdi),%ecx
  xorl 8(%rsi),%ecx
  movl 28(%rdi),%edx
  xorl 12(%rsi),%edx

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

  movq message,%rdi
  movq statel,%rsi
  movl 36(%rdi),%eax
  movl 44(%rdi),%ebx
  movl 52(%rdi),%ecx
  movl 60(%rdi),%edx

  xorl 16(%rsi),%eax
  xorl 20(%rsi),%ebx
  xorl 24(%rsi),%ecx
  xorl 28(%rsi),%edx

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

############################################################ 1-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq message,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 68(%rdi),%eax
  xorl 76(%rdi),%ebx
  xorl 84(%rdi),%ecx
  xorl 92(%rdi),%edx

  movd 100(%rdi),%xmm8
  movd 108(%rdi),%xmm9
  movd 116(%rdi),%xmm10
  movd 124(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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


############################################################ 2-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq message,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 0(%rdi),%eax
  xorl 8(%rdi),%ebx
  xorl 16(%rdi),%ecx
  xorl 24(%rdi),%edx

  movd 32(%rdi),%xmm8
  movd 40(%rdi),%xmm9
  movd 48(%rdi),%xmm10
  movd 56(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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


############################################################ 3-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq message,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 64(%rdi),%eax
  xorl 72(%rdi),%ebx
  xorl 80(%rdi),%ecx
  xorl 88(%rdi),%edx

  movd 96(%rdi),%xmm8
  movd 104(%rdi),%xmm9
  movd 112(%rdi),%xmm10
  movd 120(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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


############################################################ 4-st ROUND #################################################


  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 4(%rdi),%eax
  xorl 12(%rdi),%ebx
  xorl 20(%rdi),%ecx
  xorl 28(%rdi),%edx

  movd 36(%rdi),%xmm8
  movd 44(%rdi),%xmm9
  movd 52(%rdi),%xmm10
  movd 60(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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


############################################################ 5-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 68(%rdi),%eax
  xorl 76(%rdi),%ebx
  xorl 84(%rdi),%ecx
  xorl 92(%rdi),%edx

  movd 100(%rdi),%xmm8
  movd 108(%rdi),%xmm9
  movd 116(%rdi),%xmm10
  movd 124(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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




############################################################ 6-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 0(%rdi),%eax
  xorl 8(%rdi),%ebx
  xorl 16(%rdi),%ecx
  xorl 24(%rdi),%edx

  movd 32(%rdi),%xmm8
  movd 40(%rdi),%xmm9
  movd 48(%rdi),%xmm10
  movd 56(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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


############################################################ 7-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 64(%rdi),%eax
  xorl 72(%rdi),%ebx
  xorl 80(%rdi),%ecx
  xorl 88(%rdi),%edx

  movd 96(%rdi),%xmm8
  movd 104(%rdi),%xmm9
  movd 112(%rdi),%xmm10
  movd 120(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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


############################################################ 8-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $128,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 4(%rdi),%eax
  xorl 12(%rdi),%ebx
  xorl 20(%rdi),%ecx
  xorl 28(%rdi),%edx

  movd 36(%rdi),%xmm8
  movd 44(%rdi),%xmm9
  movd 52(%rdi),%xmm10
  movd 60(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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





############################################################ 9-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $128,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 68(%rdi),%eax
  xorl 76(%rdi),%ebx
  xorl 84(%rdi),%ecx
  xorl 92(%rdi),%edx

  movd 100(%rdi),%xmm8
  movd 108(%rdi),%xmm9
  movd 116(%rdi),%xmm10
  movd 124(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15



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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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





############################################################ 10-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $128,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 0(%rdi),%eax
  xorl 8(%rdi),%ebx
  xorl 16(%rdi),%ecx
  xorl 24(%rdi),%edx

  movd 32(%rdi),%xmm8
  movd 40(%rdi),%xmm9
  movd 48(%rdi),%xmm10
  movd 56(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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





############################################################ 11-st ROUND #################################################


  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $128,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 64(%rdi),%eax
  xorl 72(%rdi),%ebx
  xorl 80(%rdi),%ecx
  xorl 88(%rdi),%edx

  movd 96(%rdi),%xmm8
  movd 104(%rdi),%xmm9
  movd 112(%rdi),%xmm10
  movd 120(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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





############################################################ 12-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $256,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 4(%rdi),%eax
  xorl 12(%rdi),%ebx
  xorl 20(%rdi),%ecx
  xorl 28(%rdi),%edx

  movd 36(%rdi),%xmm8
  movd 44(%rdi),%xmm9
  movd 52(%rdi),%xmm10
  movd 60(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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





############################################################ 13-st ROUND #################################################


  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $256,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 68(%rdi),%eax
  xorl 76(%rdi),%ebx
  xorl 84(%rdi),%ecx
  xorl 92(%rdi),%edx

  movd 100(%rdi),%xmm8
  movd 108(%rdi),%xmm9
  movd 116(%rdi),%xmm10
  movd 124(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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




############################################################ 14-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $256,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 0(%rdi),%eax
  xorl 8(%rdi),%ebx
  xorl 16(%rdi),%ecx
  xorl 24(%rdi),%edx

  movd 32(%rdi),%xmm8
  movd 40(%rdi),%xmm9
  movd 48(%rdi),%xmm10
  movd 56(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15


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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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




############################################################ 15-st ROUND #################################################


  # Save the previous state with feedforward from the message expansion
  movq $expnd,%rdi
  add $256,%rdi
  mov %r8,%rax
  mov %r9,%rbx
  mov %r10,%rcx
  mov %r11,%rdx
  xorl 64(%rdi),%eax
  xorl 72(%rdi),%ebx
  xorl 80(%rdi),%ecx
  xorl 88(%rdi),%edx

  movd 96(%rdi),%xmm8
  movd 104(%rdi),%xmm9
  movd 112(%rdi),%xmm10
  movd 120(%rdi),%xmm11
  movq %r12,%xmm12
  movq %r13,%xmm13
  movq %r14,%xmm14
  movq %r15,%xmm15
  pxor %xmm8,%xmm12
  pxor %xmm9,%xmm13
  pxor %xmm10,%xmm14
  pxor %xmm11,%xmm15

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

  movq %xmm12,%rax
  movq %xmm13,%rbx
  movq %xmm14,%rcx
  movq %xmm15,%rdx

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

############################################################ 16-st ROUND #################################################


  # Feedforward
  movq statel,%rdi
  xorl %r8d,(%rdi)
  xorl %r9d,4(%rdi)
  xorl %r10d,8(%rdi)
  xorl %r11d,12(%rdi)
  xorl %r12d,16(%rdi)
  xorl %r13d,20(%rdi)
  xorl %r14d,24(%rdi)
  xorl %r15d,28(%rdi)



  movq message,%rcx
  add $128,%rcx
  movq %rcx, message
  movq length,%rax
  sub $128,%rax
  cmp $127,%rax
  movq %rax,length
  ja start128






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
statel:
    .quad 0x0
tbl32:
    .quad 0x0
tbl64:
    .quad 0x0
expnd:
    .fill 512
blccntr:
    .quad 0x0
const1:
    .quad 0xf26b6fc500000000
const2:
    .quad 0x3001672b00000000
const3:
    .quad 0xfed7ab7600000000
const4:
    .quad 0xca82c97d00000000
const5:
    .quad 0xfa5947f000000000
