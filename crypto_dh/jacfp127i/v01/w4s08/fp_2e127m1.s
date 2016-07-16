//Huseyin Hisil, 2012. Last update 2013.

.text

.globl fp_cpy_2e127m1_x8664_asm
fp_cpy_2e127m1_x8664_asm:
	movq 8*1(%rcx), %r11
	movq 8*0(%rcx), %r10
	movq %r11, 8*1(%rdi)
	movq %r10, 8*0(%rdi)
ret

.globl fp_st1_2e127m1_x8664_asm
fp_st1_2e127m1_x8664_asm:
	movq %rcx, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_neg_2e127m1_x8664_asm
fp_neg_2e127m1_x8664_asm:
	movq $0, %r10
	subq 8*0(%rcx), %r10
	movq $0, %r11
	sbbq 8*1(%rcx), %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 8*0(%rdi)
	sbbq $0, %r11
	movq %r11, 8*1(%rdi)
ret

.globl fp_sb2_2e127m1_x8664_asm
fp_sb2_2e127m1_x8664_asm:
	movq %rcx, %r10
	subq 8*0(%r8), %r10
	movq $0, %r11
	sbbq 8*1(%r8), %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r11, 8*1(%rdi)
	sbbq $0, %r11
	movq %r10, 8*0(%rdi)
ret

.globl fp_add_2e127m1_x8664_asm
fp_add_2e127m1_x8664_asm:
	movq 8*0(%r8), %r10
	addq 8*0(%rcx), %r10
	movq 8*1(%r8), %r11
	adcq 8*1(%rcx), %r11
	btrq $63, %r11
	adcq $0, %r10
	movq %r10, 8*0(%rdi)
	adcq $0, %r11
	movq %r11, 8*1(%rdi)
ret

.globl fp_sqr_2e127m1_x8664_asm
fp_sqr_2e127m1_x8664_asm:
	push %rbx

	movq 8*0+8*0(%rcx), %rax
	mulq 8*1+8*0(%rcx)
	movq %rax, %r11
	addq %r11, %r11
	movq %rdx, %rbx
	adcq %rbx, %rbx
	movq 8*0+8*0(%rcx), %rax
	mulq 8*0+8*0(%rcx)
	addq %rdx, %r11
	movq %rax, %r10
	adcq $0, %rbx
	movq 8*1+8*0(%rcx), %rax
	mulq 8*1+8*0(%rcx)
	addq %rbx, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %r11
	adcq %rax, %r10
	adcq %rdx, %r11
	btrq $63, %r11
	adcq $0, %r10
	movq %r10, 8*0(%rdi)
	adcq $0, %r11
	movq %r11, 8*1(%rdi)

	pop %rbx
ret

.globl fp_mul_2e127m1_x8664_asm
fp_mul_2e127m1_x8664_asm:
	push %rbx

	movq 8*0+8*0(%r8), %rax
	mulq 8*1+8*0(%rcx)
	movq %rdx, %rbx
	movq %rax, %r11
	movq 8*1+8*0(%r8), %rax
	mulq 8*0+8*0(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	movq 8*0+8*0(%rcx), %rax
	mulq 8*0+8*0(%r8)
	addq %rdx, %r11
	movq %rax, %r10
	adcq $0, %rbx
	movq 8*1+8*0(%r8), %rax
	mulq 8*1+8*0(%rcx)
	addq %rbx, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %r11
	adcq %rax, %r10
	adcq %rdx, %r11
	btrq $63, %r11
	adcq $0, %r10
	movq %r10, 8*0(%rdi)
	adcq $0, %r11
	movq %r11, 8*1(%rdi)

	pop %rbx
ret
