//Huseyin Hisil, 2013.
.text

.globl fp_cpy_2e061m1e2_x8664_asm
fp_cpy_2e061m1e2_x8664_asm:
	movq 8*1(%rcx), %r9
	movq 8*0(%rcx), %r8
	movq %r9, 8*1(%rdi)
	movq %r8, 8*0(%rdi)
ret

.globl fp_st1_2e061m1e2_x8664_asm
fp_st1_2e061m1e2_x8664_asm:
	movq %rcx, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_neg_2e061m1e2_x8664_asm
fp_neg_2e061m1e2_x8664_asm:
	movq $0, %r10
	subq 8*0+8*0(%rcx), %r10
	shlq $2, %r10
	shrq $2, %r10
	btrq $61, %r10
	sbbq $0, %r10
	movq %r10, 8*0+8*0(%rdi)

	movq $0, %r10
	subq 8*1+8*0(%rcx), %r10
	shlq $2, %r10
	shrq $2, %r10
	btrq $61, %r10
	sbbq $0, %r10
	movq %r10, 8*1+8*0(%rdi)
ret

.globl fp_cjg_2e061m1e2_x8664_asm
fp_cjg_2e061m1e2_x8664_asm:
	movq 8*0+8*0(%rcx), %r10
	movq %r10, 8*0+8*0(%rdi)

	movq $0, %r10
	subq 8*1+8*0(%rcx), %r10
	shlq $2, %r10
	shrq $2, %r10
	btrq $61, %r10
	sbbq $0, %r10
	movq %r10, 8*1+8*0(%rdi)
ret

.globl fp_mld_2e061m1e2_x8664_asm
fp_mld_2e061m1e2_x8664_asm:
	pushq %r13
	pushq %r12

	//Imaginary
	movq 8*1+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*0+8*0(%r8)
	movq %rax, %r10
	movq %rdx, %r11

	shrq $3, %r10
	btrq $61, %r11
	adcq %r11, %r10
	btrq $61, %r10
	adcq $0, %r10

	//Real
	movq 8*0+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*0+8*0(%r8)
	movq %rax, %r12
	movq %rdx, %r11

	shrq $3, %r12
	btrq $61, %r11
	adcq %r11, %r12
	btrq $61, %r12
	adcq $0, %r12

	movq %r12, 8*0+8*0(%rdi)
	movq %r10, 8*1+8*0(%rdi)

	popq %r12
	popq %r13
ret

.globl fp_mul_2e061m1e2_x8664_asm
fp_mul_2e061m1e2_x8664_asm:
	pushq %r13
	pushq %r12

	//Imaginary
	movq 8*0+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*1+8*0(%r8)
	movq %rax, %r10
	movq %rdx, %r11

	movq 8*1+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*0+8*0(%r8)
	addq %rax, %r10
	adcq %rdx, %r11

	shrq $3, %r10
	btrq $61, %r11
	//adcq $0, %r10
	adcq %r11, %r10
	btrq $61, %r10
	adcq $0, %r10

	//Real
	movq 8*0+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*0+8*0(%r8)
	movq %rax, %r12
	movq %rdx, %r11

	movq 8*1+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*1+8*0(%r8)
	subq %rax, %r12
	sbbq %rdx, %r11

	shrq $3, %r12
	btrq $61, %r11
	//sbbq $0, %r12
	sbbq $0, %r11
	movq $0x1FFFFFFFFFFFFFFF, %r13
	andq %r13, %r11

	addq %r11, %r12
	btrq $61, %r12
	adcq $0, %r12

	movq %r12, 8*0+8*0(%rdi)
	movq %r10, 8*1+8*0(%rdi)

	popq %r12
	popq %r13
ret
