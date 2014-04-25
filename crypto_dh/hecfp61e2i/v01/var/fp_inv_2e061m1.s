//Huseyin Hisil, 2013.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl fp_inv_2e061m1_x8664_asm
fp_inv_2e061m1_x8664_asm:
	pushq %r14
	pushq %r13
	pushq %r12
	movq 8*0(%r8), %rax
	shlq $3, %rax
	mulq 8*0(%r8)
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq %r11, %rax
	shlq $3, %rax
	mulq 8*0(%r8)
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq %r11, %rax
	shlq $3, %rax
	mulq %r11
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %rsi
	movq %rsi, %rax
	shlq $3, %rax
	mulq %rsi
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %rsi
	movq %rsi, %rax
	shlq $3, %rax
	mulq %r11
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %rsi
	movq %rsi, %rax
	shlq $3, %rax
	mulq %rsi
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r12
	movq %r12, %rax
	shlq $3, %rax
	mulq %r12
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r12
	movq %r12, %rax
	shlq $3, %rax
	mulq %r12
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r12
	movq %r12, %rax
	shlq $3, %rax
	mulq %r12
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r12
	movq %r12, %rax
	shlq $3, %rax
	mulq %rsi
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r12
	movq %r12, %rax
	shlq $3, %rax
	mulq %r12
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r12
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r13
	movq %r13, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r14
	movq %r14, %rax
	shlq $3, %rax
	mulq %r14
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r13
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r12
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r11
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq 8*0(%r8)
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, %rax
	shlq $3, %rax
	mulq 8*0(%r8)
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 8*0(%rcx)
	popq %r12
	popq %r13
	popq %r14
ret
