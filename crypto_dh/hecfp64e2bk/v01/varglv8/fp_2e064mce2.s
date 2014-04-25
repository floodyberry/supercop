//Huseyin Hisil, 2013.

.text

.globl fp_cpy_2e064mce2_x8664
fp_cpy_2e064mce2_x8664:
	movq 8*1(%rcx), %r9
	movq 8*0(%rcx), %r8
	movq %r9, 8*1(%rdi)
	movq %r8, 8*0(%rdi)
ret

.globl fp_st1_2e064mce2_x8664
fp_st1_2e064mce2_x8664:
	movq %rcx, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_neg_2e064mce2_x8664
fp_neg_2e064mce2_x8664:
	movq $0, %r10
	subq 8*0(%rcx), %r10
	movq $0, %r11
	cmovc %rsi, %r11
	subq %r11, %r10
	movq %r10, 8*0(%rdi)

	movq $0, %r10
	subq 8*1(%rcx), %r10
	movq $0, %r11
	cmovc %rsi, %r11
	subq %r11, %r10
	movq %r10, 8*1(%rdi)
ret

.globl fp_cjg_2e064mce2_x8664
fp_cjg_2e064mce2_x8664:
	movq 8*0(%rcx), %r10
	movq %r10, 8*0(%rdi)

	movq $0, %r10
	subq 8*1(%rcx), %r10
	movq $0, %r11
	cmovc %rsi, %r11
	subq %r11, %r10
	movq %r10, 8*1(%rdi)
ret

.globl fp_mld_2e064mce2_x8664
fp_mld_2e064mce2_x8664:
	pushq %r13
	pushq %r12

	movq 8*1(%rcx), %rax
	mulq 8*0(%r8)
	movq %rax, %r10
	movq %rdx, %r11

	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	//This final reduction occurs extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11
	addq %r11, %r10
	movq %r10, %r13


	movq 8*0(%rcx), %rax
	mulq 8*0(%r8)
	movq %rax, %r10
	movq %rdx, %r11

	movq %r11, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	//This final reduction occurs extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11
	addq %r11, %r10

	movq %r10, 8*0(%rdi)
	movq %r13, 8*1(%rdi)

	popq %r12
	popq %r13
ret

.globl fp_mul_2e064mce2_x8664
fp_mul_2e064mce2_x8664:
	pushq %r13
	pushq %r12

	movq 8*0(%rcx), %rax
	mulq 8*1(%r8)
	movq %rax, %r10
	movq %rdx, %r11

	movq 8*1(%rcx), %rax
	mulq 8*0(%r8)
	addq %rax, %r10
	adcq %rdx, %r11

	movq $0, %r12
	cmovc %rsi, %r12

	movq %r11, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	//This final reduction occurs extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11
	addq %r11, %r10
	movq %r10, %r13


	movq 8*0(%rcx), %rax
	mulq 8*0(%r8)
	movq %rax, %r10
	movq %rdx, %r11

	movq 8*1(%rcx), %r12
	//Negation of a_1.
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	//Now we can continue.
	mulq 8*1(%r8)
	addq %rax, %r10
	adcq %rdx, %r11

	movq $0, %r12
	cmovc %rsi, %r12

	movq %r11, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	//This final reduction occurs extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11
	addq %r11, %r10

	movq %r10, 8*0(%rdi)
	movq %r13, 8*1(%rdi)

	popq %r12
	popq %r13
ret

