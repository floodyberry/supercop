#
#	Assembly implementation of Cheetah-512 for 32-bit processors
#	Author: Ivica Nikolic, University of Luxembourg
#

.section .text

.type Cheetah51232, @function
.globl Cheetah51232
Cheetah51232:

  # Save the registers
  push %ebx
  push %ebp
  push %edi
  push %esi
  push %esp

  # Save the address of the 8x32 tables
  movl 24(%esp), %eax
  movl %eax, tbl32

  # The register ebp holds the begining of the 8-64 lookup tables.
  movl 28(%esp),%ebp
  movl %ebp,tbl64

  # Save the state addresses
  movl 32(%esp),%eax
  movl %eax, statel

  # The register %esi holds the addres of the message. Save the address of the current message array.
  movl 36(%esp),%esi
  movl %esi,message

  # Save the length of the message
  movq 40(%esp), %mm0
  movq %mm0,length

  # Set up the block counter
  movl $0,blccntr


start128:

  movl tbl64,%ebp
  movl message,%esi


  # First produce the message expanstion (with 8x16) and write it into the memory.
  # The registers XMM0-XMM6, reg7, MM0-MM7, r8-r15 hold the 8x16 state

################################################################# FIRST ROUND 8x16 #########################################

  ############################################# s0 ######################################

  movl (%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm3

  movl 4(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm0

  movq const1,%xmm7
  pxor %xmm7,%xmm0

  ############################################# s1 ######################################
  # Put (message+8) into eax
  movl 8(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm4

  movl 12(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm1


  ############################################# s2 ######################################
  # Put (message+16) into eax
  movl 16(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm5

  movl 20(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq 12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16, %eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm2


  ############################################# s3 ######################################

  # Put (message+24) into eax
  movl 24(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm6

  movl 28(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm3


 ############################################# s4 ######################################

  movl 32(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm7


  movl 36(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm4


 ############################################# s5 ######################################

  movl 40(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0

  movl 44(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm5


 ############################################# s6 ######################################

  movl 48(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1

  movl 52(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm6


 ############################################# s7 ######################################

  movl 56(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2

  movl 60(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm7
  movq %xmm7,reg7


 ############################################# s8 ######################################

  movl 64(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3

  movl 68(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm0


 ############################################# s9 ######################################

  movl 72(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4

  movl 76(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm1

 ############################################# s10 ######################################

  movl 80(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5

  movl 84(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm2


 ############################################# s11 ######################################

  movl 88(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6

  movl 92(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm3


 ############################################# s12 ######################################


  movl 96(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6

  movl 100(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm4

 ############################################# s13 ######################################

  movl 104(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm0

  movl 108(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm5


 ############################################# s14 ######################################

  movl 112(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm1

  movl 116(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm6


 ############################################# s15 ######################################

  movl 120(%esi),%eax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm2

  movl 124(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm7


  # Save the values of the state
  movl $expnd,%edi
  movq %mm0,64(%edi)
  movq %xmm0,(%edi)
  movq %mm1,72(%edi)
  movq %xmm1,8(%edi)
  movq %mm2,80(%edi)
  movq %xmm2,16(%edi)
  movq %mm3,88(%edi)
  movq %xmm3,24(%edi)
  movq %mm4,96(%edi)
  movq %xmm4,32(%edi)
  movq %mm5,104(%edi)
  movq %xmm5,40(%edi)
  movq %mm6,112(%edi)
  movq %xmm6,48(%edi)
  movq %mm7,120(%edi)
  movq reg7,%xmm7
  movq %xmm7,56(%edi)



############################################################################################################################

################################################################# SECOND ROUND 8x16 ###########################################################

  # The register %esi holds the addres of the previous state
  movl %edi,%esi

 ############################################# s0 ######################################

  movl (%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm3

  movl 4(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm0

  movq const2,%xmm7
  pxor %xmm7,%xmm0


  ############################################# s1 ######################################
  # Put (message+8) into eax
  movl 8(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm4

  movl 12(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm1


  ############################################# s2 ######################################
  # Put (message+16) into eax
  movl 16(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm5

  movl 20(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq 12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16, %eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm2


  ############################################# s3 ######################################

  # Put (message+24) into eax
  movl 24(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm6

  movl 28(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm3


 ############################################# s4 ######################################

  movl 32(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm7


  movl 36(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm4


 ############################################# s5 ######################################

  movl 40(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0

  movl 44(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm5


 ############################################# s6 ######################################

  movl 48(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1

  movl 52(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm6


 ############################################# s7 ######################################

  movl 56(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2

  movl 60(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm7
  movq %xmm7,reg7


 ############################################# s8 ######################################

  movl 64(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3

  movl 68(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm0


 ############################################# s9 ######################################

  movl 72(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4

  movl 76(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm1

 ############################################# s10 ######################################

  movl 80(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5

  movl 84(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm2


 ############################################# s11 ######################################

  movl 88(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6

  movl 92(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm3


 ############################################# s12 ######################################


  movl 96(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6

  movl 100(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm4

 ############################################# s13 ######################################

  movl 104(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm0

  movl 108(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm5


 ############################################# s14 ######################################

  movl 112(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm1

  movl 116(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm6


 ############################################# s15 ######################################

  movl 120(%esi),%eax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm2

  movl 124(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm7

  # Save the values of the state
  movl $expnd,%edi
  add $128,%edi
  movq %mm0,64(%edi)
  movq %xmm0,(%edi)
  movq %mm1,72(%edi)
  movq %xmm1,8(%edi)
  movq %mm2,80(%edi)
  movq %xmm2,16(%edi)
  movq %mm3,88(%edi)
  movq %xmm3,24(%edi)
  movq %mm4,96(%edi)
  movq %xmm4,32(%edi)
  movq %mm5,104(%edi)
  movq %xmm5,40(%edi)
  movq %mm6,112(%edi)
  movq %xmm6,48(%edi)
  movq %mm7,120(%edi)
  movq reg7,%xmm7
  movq %xmm7,56(%edi)



############################################################################################################################

################################################################# THIRD ROUND 8x16 ##########################################

  # The register %esi holds the addres of the previous state
  movl %edi,%esi

  ############################################# s0 ######################################

  movl (%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm3

  movl 4(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm0

  movq const3,%xmm7
  pxor %xmm7,%xmm0


  ############################################# s1 ######################################
  # Put (message+8) into eax
  movl 8(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm4

  movl 12(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm1


  ############################################# s2 ######################################
  # Put (message+16) into eax
  movl 16(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm5

  movl 20(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq 12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16, %eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm2


  ############################################# s3 ######################################

  # Put (message+24) into eax
  movl 24(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm6

  movl 28(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm3


 ############################################# s4 ######################################

  movl 32(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm7


  movl 36(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm4


 ############################################# s5 ######################################

  movl 40(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0

  movl 44(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm5


 ############################################# s6 ######################################

  movl 48(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1

  movl 52(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm6


 ############################################# s7 ######################################

  movl 56(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2

  movl 60(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm7
  movq %xmm7,reg7


 ############################################# s8 ######################################

  movl 64(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3

  movl 68(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm0


 ############################################# s9 ######################################

  movl 72(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4

  movl 76(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm1

 ############################################# s10 ######################################

  movl 80(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5

  movl 84(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm2


 ############################################# s11 ######################################

  movl 88(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6

  movl 92(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm3


 ############################################# s12 ######################################


  movl 96(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6

  movl 100(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm4

 ############################################# s13 ######################################

  movl 104(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm0

  movl 108(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm5


 ############################################# s14 ######################################

  movl 112(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm1

  movl 116(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm6


 ############################################# s15 ######################################

  movl 120(%esi),%eax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm2

  movl 124(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm7


  # Save the values of the state
  movl $expnd,%edi
  add $256,%edi
  movq %mm0,64(%edi)
  movq %xmm0,(%edi)
  movq %mm1,72(%edi)
  movq %xmm1,8(%edi)
  movq %mm2,80(%edi)
  movq %xmm2,16(%edi)
  movq %mm3,88(%edi)
  movq %xmm3,24(%edi)
  movq %mm4,96(%edi)
  movq %xmm4,32(%edi)
  movq %mm5,104(%edi)
  movq %xmm5,40(%edi)
  movq %mm6,112(%edi)
  movq %xmm6,48(%edi)
  movq %mm7,120(%edi)
  movq reg7,%xmm7
  movq %xmm7,56(%edi)




################################################################# FOURTH ROUND 8x16 ##########################################

  # The register %esi holds the addres of the previous state
  movl %edi,%esi

 ############################################# s0 ######################################

  movl (%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm3

  movl 4(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm0

  movq const4,%xmm7
  pxor %xmm7,%xmm0


  ############################################# s1 ######################################
  # Put (message+8) into eax
  movl 8(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm4

  movl 12(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm1


  ############################################# s2 ######################################
  # Put (message+16) into eax
  movl 16(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm5

  movl 20(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq 12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16, %eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm2


  ############################################# s3 ######################################

  # Put (message+24) into eax
  movl 24(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm6

  movl 28(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm3


 ############################################# s4 ######################################

  movl 32(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm7


  movl 36(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm4


 ############################################# s5 ######################################

  movl 40(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0

  movl 44(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm5


 ############################################# s6 ######################################

  movl 48(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1

  movl 52(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm6


 ############################################# s7 ######################################

  movl 56(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2

  movl 60(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm7
  movq %xmm7,reg7


 ############################################# s8 ######################################

  movl 64(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3

  movl 68(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm0


 ############################################# s9 ######################################

  movl 72(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4

  movl 76(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm1

 ############################################# s10 ######################################

  movl 80(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5

  movl 84(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm2


 ############################################# s11 ######################################

  movl 88(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6

  movl 92(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm3


 ############################################# s12 ######################################


  movl 96(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6

  movl 100(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm4

 ############################################# s13 ######################################

  movl 104(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm0

  movl 108(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm5


 ############################################# s14 ######################################

  movl 112(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm1

  movl 116(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm6


 ############################################# s15 ######################################

  movl 120(%esi),%eax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm2

  movl 124(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm7


  # Save the values of the state
  movl $expnd,%edi
  add $384,%edi
  movq %mm0,64(%edi)
  movq %xmm0,(%edi)
  movq %mm1,72(%edi)
  movq %xmm1,8(%edi)
  movq %mm2,80(%edi)
  movq %xmm2,16(%edi)
  movq %mm3,88(%edi)
  movq %xmm3,24(%edi)
  movq %mm4,96(%edi)
  movq %xmm4,32(%edi)
  movq %mm5,104(%edi)
  movq %xmm5,40(%edi)
  movq %mm6,112(%edi)
  movq %xmm6,48(%edi)
  movq %mm7,120(%edi)
  movq reg7,%xmm7
  movq %xmm7,56(%edi)


################################################################# FIFTH ROUND 8x16 ##########################################

  # The register %esi holds the addres of the previous state
  movl %edi,%esi

  ############################################# s0 ######################################

  movl (%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm3

  movl 4(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm0

  movq const5,%xmm7
  pxor %xmm7,%xmm0


  ############################################# s1 ######################################
  # Put (message+8) into eax
  movl 8(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%mm4

  movl 12(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm1


  ############################################# s2 ######################################
  # Put (message+16) into eax
  movl 16(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm5

  movl 20(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq 12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16, %eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm2


  ############################################# s3 ######################################

  # Put (message+24) into eax
  movl 24(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm6

  movl 28(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm3


 ############################################# s4 ######################################

  movl 32(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm7


  movl 36(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm4


 ############################################# s5 ######################################

  movl 40(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0

  movl 44(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm5


 ############################################# s6 ######################################

  movl 48(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm7
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1

  movl 52(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm6


 ############################################# s7 ######################################

  movl 56(%esi),%eax
  movzbl %al,%ecx
  pxor	6144(%ebp,%ecx,8),%mm7
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm0
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2

  movl 60(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  8192(%ebp,%ebx,8),%xmm7
  movq %xmm7,reg7


 ############################################# s8 ######################################

  movl 64(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm0
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm1
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3

  movl 68(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	10240(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm0


 ############################################# s9 ######################################

  movl 72(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm1
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm2
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4

  movl 76(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  12288(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm1

 ############################################# s10 ######################################

  movl 80(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm2
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm3
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5

  movl 84(%esi),%eax
  movzbl %al,%ecx
  movq	14336(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm2


 ############################################# s11 ######################################

  movl 88(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm3
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm4
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6

  movl 92(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm1
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm3


 ############################################# s12 ######################################


  movl 96(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm4
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm5
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  (%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6

  movl 100(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm2
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm4

 ############################################# s13 ######################################

  movl 104(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm5
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  pxor %xmm7,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  movq	2048(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm0

  movl 108(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm2
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm3
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm5


 ############################################# s14 ######################################

  movl 112(%esi),%eax
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  pxor %xmm7,%xmm6
  movzbl %ah,%ebx
  movq  4096(%ebp,%ebx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm0
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm1

  movl 116(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm3
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm4
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm5
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm6


 ############################################# s15 ######################################

  movl 120(%esi),%eax
  # xor with xmm7
  movzbl %al,%ecx
  movq	6144(%ebp,%ecx,8),%xmm7
  movq %xmm6,reg6
  movq reg7,%xmm6
  pxor %xmm6,%xmm7
  movq %xmm7,reg7
  movq reg6,%xmm6
  movzbl %ah,%ebx
  pxor  4096(%ebp,%ebx,8),%mm0
  shr $16,%eax
  movzbl %al,%ecx
  pxor	2048(%ebp,%ecx,8),%mm1
  movzbl %ah,%ebx
  pxor  (%ebp,%ebx,8),%mm2

  movl 124(%esi),%eax
  movzbl %al,%ecx
  pxor	14336(%ebp,%ecx,8),%mm4
  movzbl %ah,%ebx
  pxor  12288(%ebp,%ebx,8),%mm5
  shr $16,%eax
  movzbl %al,%ecx
  pxor	10240(%ebp,%ecx,8),%mm6
  movzbl %ah,%ebx
  pxor  8192(%ebp,%ebx,8),%mm7



  # Save the values of the state
  movl $expnd,%edi
  add $512,%edi
  movq %mm0,64(%edi)
  movq %xmm0,(%edi)
  movq %mm1,72(%edi)
  movq %xmm1,8(%edi)
  movq %mm2,80(%edi)
  movq %xmm2,16(%edi)
  movq %mm3,88(%edi)
  movq %xmm3,24(%edi)
  movq %mm4,96(%edi)
  movq %xmm4,32(%edi)
  movq %mm5,104(%edi)
  movq %xmm5,40(%edi)
  movq %mm6,112(%edi)
  movq %xmm6,48(%edi)
  movq %mm7,120(%edi)
  movq reg7,%xmm7
  movq %xmm7,56(%edi)



############################################## START OF THE SECOND PHASE - 8X8 RIJNDAEL ###########################################

  # The registers mm0-mm7 hold the state
  # The register ebp holds the begining of the 8-32 lookup tables.
  movl tbl64,%ebp

  # Add the block counter
  movq blccntr,%mm0
  movl statel,%esi
  pxor (%esi),%mm0
  movq %mm0,(%esi)
  movq blccntr,%mm1
  paddq s001s,%mm1
  movq %mm1,blccntr
  #addq $1,%edx
  #movq %edx,blccntr

############################################################## 1 ###############################################################

  movl message,%edi
  movl statel,%esi
  movl 0(%edi),%eax
  xorl 0(%esi),%eax
  movl 8(%edi),%ebx
  xorl 8(%esi),%ebx
  movl 16(%edi),%ecx
  xorl 16(%esi),%ecx
  movl 24(%edi),%edx
  xorl 24(%esi),%edx

  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7

  movl message,%edi
  movl statel,%esi
  movl 4(%edi),%eax
  xorl 4(%esi),%eax
  movl 12(%edi),%ebx
  xorl 12(%esi),%ebx
  movl 20(%edi),%ecx
  xorl 20(%esi),%ecx
  movl 28(%edi),%edx
  xorl 28(%esi),%edx

  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  movq (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movl message,%edi
  movl statel,%esi
  movl 32(%edi),%eax
  xorl 32(%esi),%eax
  movl 40(%edi),%ebx
  xorl 40(%esi),%ebx
  movl 48(%edi),%ecx
  xorl 48(%esi),%ecx
  movl 56(%edi),%edx
  xorl 56(%esi),%edx

  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3

  movl message,%edi
  movl statel,%esi
  movl 36(%edi),%eax
  xorl 36(%esi),%eax
  movl 44(%edi),%ebx
  xorl 44(%esi),%ebx
  movl 52(%edi),%ecx
  xorl 52(%esi),%ecx
  movl 60(%edi),%edx
  xorl 60(%esi),%edx

  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7


############################################################ 1-st ROUND #################################################

# Save the previous state with feedforward from the message expansion

  movl message,%edi
  pxor 64(%edi),%mm0
  pxor 72(%edi),%mm1
  pxor 80(%edi),%mm2
  pxor 88(%edi),%mm3
  pxor 96(%edi),%mm4
  pxor 104(%edi),%mm5
  pxor 112(%edi),%mm6
  pxor 120(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7


  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7



############################################################ 2-st ROUND #################################################

# Save the previous state with feedforward from the message expansion

  movl $expnd,%edi
  pxor 0(%edi),%mm0
  pxor 8(%edi),%mm1
  pxor 16(%edi),%mm2
  pxor 24(%edi),%mm3
  pxor 32(%edi),%mm4
  pxor 40(%edi),%mm5
  pxor 48(%edi),%mm6
  pxor 56(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7


############################################################ 3-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  pxor 64(%edi),%mm0
  pxor 72(%edi),%mm1
  pxor 80(%edi),%mm2
  pxor 88(%edi),%mm3
  pxor 96(%edi),%mm4
  pxor 104(%edi),%mm5
  pxor 112(%edi),%mm6
  pxor 120(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7


  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7

############################################################ 4-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $128,%edi
  pxor 0(%edi),%mm0
  pxor 8(%edi),%mm1
  pxor 16(%edi),%mm2
  pxor 24(%edi),%mm3
  pxor 32(%edi),%mm4
  pxor 40(%edi),%mm5
  pxor 48(%edi),%mm6
  pxor 56(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7


############################################################ 5-st ROUND #################################################

   # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $128,%edi
  pxor 64(%edi),%mm0
  pxor 72(%edi),%mm1
  pxor 80(%edi),%mm2
  pxor 88(%edi),%mm3
  pxor 96(%edi),%mm4
  pxor 104(%edi),%mm5
  pxor 112(%edi),%mm6
  pxor 120(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7

############################################################ 6-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $256,%edi
  pxor 0(%edi),%mm0
  pxor 8(%edi),%mm1
  pxor 16(%edi),%mm2
  pxor 24(%edi),%mm3
  pxor 32(%edi),%mm4
  pxor 40(%edi),%mm5
  pxor 48(%edi),%mm6
  pxor 56(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7


############################################################ 7-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $256,%edi
  pxor 64(%edi),%mm0
  pxor 72(%edi),%mm1
  pxor 80(%edi),%mm2
  pxor 88(%edi),%mm3
  pxor 96(%edi),%mm4
  pxor 104(%edi),%mm5
  pxor 112(%edi),%mm6
  pxor 120(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7


############################################################ 8-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $384,%edi
  pxor 0(%edi),%mm0
  pxor 8(%edi),%mm1
  pxor 16(%edi),%mm2
  pxor 24(%edi),%mm3
  pxor 32(%edi),%mm4
  pxor 40(%edi),%mm5
  pxor 48(%edi),%mm6
  pxor 56(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7

############################################################ 9-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $384,%edi
  pxor 64(%edi),%mm0
  pxor 72(%edi),%mm1
  pxor 80(%edi),%mm2
  pxor 88(%edi),%mm3
  pxor 96(%edi),%mm4
  pxor 104(%edi),%mm5
  pxor 112(%edi),%mm6
  pxor 120(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7

############################################################ 10-st ROUND #################################################

  # Save the previous state with feedforward from the message expansion
  movl $expnd,%edi
  add $512,%edi
  pxor 0(%edi),%mm0
  pxor 8(%edi),%mm1
  pxor 16(%edi),%mm2
  pxor 24(%edi),%mm3
  pxor 32(%edi),%mm4
  pxor 40(%edi),%mm5
  pxor 48(%edi),%mm6
  pxor 56(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7

############################################################ 11-st ROUND #################################################


  movl $expnd,%edi
  add $512,%edi
  pxor 64(%edi),%mm0
  pxor 72(%edi),%mm1
  pxor 80(%edi),%mm2
  pxor 88(%edi),%mm3
  pxor 96(%edi),%mm4
  pxor 104(%edi),%mm5
  pxor 112(%edi),%mm6
  pxor 120(%edi),%mm7
  movq2dq %mm0,%xmm0
  movq2dq %mm1,%xmm1
  movq2dq %mm2,%xmm2
  movq2dq %mm3,%xmm3
  movq2dq %mm4,%xmm4
  movq2dq %mm5,%xmm5
  movq2dq %mm6,%xmm6
  movq2dq %mm7,%xmm7

  movd %xmm0,%eax
  movd %xmm1,%ebx
  movd %xmm2,%ecx
  movd %xmm3,%edx
  movzbl %al,%esi
  movq 14336(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  movq 12288(%ebp,%esi,8),%mm2
  shr $16, %eax
  movzbl %al,%esi
  movq 10240(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  movq 8192(%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm3
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  movq 8192(%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm4
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  movq 8192(%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm5
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  movq 8192(%ebp,%esi,8),%mm7
  pextrw $2, %xmm0, %eax
  pextrw $2, %xmm1, %ebx
  pextrw $2, %xmm2, %ecx
  pextrw $2, %xmm3, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm6
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm7
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  movq 4096(%ebp,%esi,8),%mm0
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm1
  pextrw $3, %xmm0, %eax
  pextrw $3, %xmm1, %ebx
  pextrw $3, %xmm2, %ecx
  pextrw $3, %xmm3, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm3

  movd %xmm4,%eax
  movd %xmm5,%ebx
  movd %xmm6,%ecx
  movd %xmm7,%edx
  movzbl %al,%esi
  pxor 14336(%ebp,%esi,8),%mm5
  movzbl %ah,%esi
  pxor 12288(%ebp,%esi,8),%mm6
  shr $16, %eax
  movzbl %al,%esi
  pxor 10240(%ebp,%esi,8),%mm7
  movzbl %ah,%esi
  pxor 8192(%ebp,%esi,8),%mm0
  movzbl %bl,%esi
  pxor 14336(%ebp,%esi,8),%mm6
  movzbl %bh,%esi
  pxor 12288(%ebp,%esi,8),%mm7
  shr $16, %ebx
  movzbl %bl,%esi
  pxor 10240(%ebp,%esi,8),%mm0
  movzbl %bh,%esi
  pxor 8192(%ebp,%esi,8),%mm1
  movzbl %cl,%esi
  pxor 14336(%ebp,%esi,8),%mm7
  movzbl %ch,%esi
  pxor 12288(%ebp,%esi,8),%mm0
  shr $16, %ecx
  movzbl %cl,%esi
  pxor 10240(%ebp,%esi,8),%mm1
  movzbl %ch,%esi
  pxor 8192(%ebp,%esi,8),%mm2
  movzbl %dl,%esi
  pxor 14336(%ebp,%esi,8),%mm0
  movzbl %dh,%esi
  pxor 12288(%ebp,%esi,8),%mm1
  shr $16, %edx
  movzbl %dl,%esi
  pxor 10240(%ebp,%esi,8),%mm2
  movzbl %dh,%esi
  pxor 8192(%ebp,%esi,8),%mm3
  pextrw $2, %xmm4, %eax
  pextrw $2, %xmm5, %ebx
  pextrw $2, %xmm6, %ecx
  pextrw $2, %xmm7, %edx
  movzbl %al,%esi
  pxor 6144(%ebp,%esi,8),%mm1
  movzbl %ah,%esi
  pxor 4096(%ebp,%esi,8),%mm2
  movzbl %bl,%esi
  pxor 6144(%ebp,%esi,8),%mm2
  movzbl %bh,%esi
  pxor 4096(%ebp,%esi,8),%mm3
  movzbl %cl,%esi
  pxor 6144(%ebp,%esi,8),%mm3
  movzbl %ch,%esi
  pxor 4096(%ebp,%esi,8),%mm4
  movzbl %dl,%esi
  pxor 6144(%ebp,%esi,8),%mm4
  movzbl %dh,%esi
  pxor 4096(%ebp,%esi,8),%mm5
  pextrw $3, %xmm4, %eax
  pextrw $3, %xmm5, %ebx
  pextrw $3, %xmm6, %ecx
  pextrw $3, %xmm7, %edx
  movzbl %al,%esi
  pxor 2048(%ebp,%esi,8),%mm3
  movzbl %ah,%esi
  pxor (%ebp,%esi,8),%mm4
  movzbl %bl,%esi
  pxor 2048(%ebp,%esi,8),%mm4
  movzbl %bh,%esi
  pxor (%ebp,%esi,8),%mm5
  movzbl %cl,%esi
  pxor 2048(%ebp,%esi,8),%mm5
  movzbl %ch,%esi
  pxor (%ebp,%esi,8),%mm6
  movzbl %dl,%esi
  pxor 2048(%ebp,%esi,8),%mm6
  movzbl %dh,%esi
  pxor (%ebp,%esi,8),%mm7


############################################################ 12-st ROUND #################################################


  # Feedforward
  movl statel,%edi

  movq2dq %mm1,%xmm1

  movq (%edi),%mm1
  pxor %mm1,%mm0
  movq %mm0,(%edi)
  movq 16(%edi),%mm1
  pxor %mm1,%mm2
  movq %mm2,16(%edi)
  movq 32(%edi),%mm1
  pxor %mm1,%mm4
  movq %mm4,32(%edi)
  movq 48(%edi),%mm1
  pxor %mm1,%mm6
  movq %mm6,48(%edi)



  movdq2q %xmm1,%mm0
  movq 8(%edi),%mm1
  pxor %mm0,%mm1
  movq %mm1,8(%edi)
  movq 24(%edi),%mm0
  pxor %mm0,%mm3
  movq %mm3,24(%edi)
  movq 40(%edi),%mm0
  pxor %mm0,%mm5
  movq %mm5,40(%edi)
  movq 56(%edi),%mm0
  pxor %mm0,%mm7
  movq %mm7,56(%edi)




# Change the length of the message and the pointer to the message
  movq message, %mm0
  paddd s128s,%mm0
  movq %mm0,message

  movl $length,%ebx
  movl 4(%ebx),%eax
  cmp $0,%eax
  ja finito
  movl (%ebx),%eax
  cmp $256,%eax
  jl end
finito:
  movq length,%mm1
  psubq s128s,%mm1
  movq %mm1,length
  jae start128
end:

  # Pop the old values for the registers
  pop %esp
  pop %esi
  pop %edi
  pop %ebp
  pop %ebx


  emms
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
    .fill 1024
blccntr:
    .quad 0x0
reg6:
    .quad 0,0
reg7:
    .quad 0,0
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
s001s:
    .quad 0x01
s127s:
    .quad 0x7f
s128s:
    .quad 0x80
