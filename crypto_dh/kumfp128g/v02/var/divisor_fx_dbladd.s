//Huseyin Hisil, 2012.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl kum_fp_dbladd_2e128mc_g_fixed_x8664_asm
kum_fp_dbladd_2e128mc_g_fixed_x8664_asm:
	pushq %rbx
	pushq %r15
	pushq %r14
	pushq %r13
	pushq %r12
	movq %rdx, %r10
	shrq $6, %r10
	movq %r10, %r11
	shlq $6, %r11
	subq %r11, %rdx
	movq (%rsi,%r10,8), %r11
	bt %rdx, %r11
	movq %rcx, %r11
	movq %r8, %r10
	cmovc %rcx, %r10
	cmovc %r8, %r11
	movq %r11, %r8
	movq %r10, %rcx
	movq 8*0(%r9), %rsi
	movq (%rcx), %r10
	addq %rsi, %r10
	movq 8(%rcx), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rcx), %r10
	adcq 24(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	sbbq $0, %r11
	movq (%rcx), %r12
	movq $0, %rdx
	subq 16(%rcx), %r12
	movq 8(%rcx), %r13
	sbbq 24(%rcx), %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	sbbq $0, %r13
	movq 32(%rcx), %r14
	addq %rsi, %r14
	movq 40(%rcx), %r15
	adcq $0, %r15
	movq $0, %rdx
	addq 48(%rcx), %r14
	adcq 56(%rcx), %r15
	cmovnc %rsi, %rdx
	subq %rdx, %r14
	sbbq $0, %r15
	movq %r10, %rax
	addq %r14, %rax
	movq %r11, %rbx
	adcq %r15, %rbx
	movq $0, %rdx
	cmovc %rsi, %rdx
	addq %rdx, %rax
	movq %rax, (%rcx)
	adcq $0, %rbx
	movq %rbx, 8(%rcx)
	movq 32(%rcx), %rax
	movq $0, %rdx
	subq 48(%rcx), %rax
	movq 40(%rcx), %rbx
	sbbq 56(%rcx), %rbx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	sbbq $0, %rbx
	subq %r14, %r10
	movq $0, %rdx
	sbbq %r15, %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rcx)
	sbbq $0, %r11
	movq %r11, 24(%rcx)
	movq $0, %rdx
	movq %rax, %r10
	addq %r12, %r10
	movq %rbx, %r11
	adcq %r13, %r11
	cmovc %rsi, %rdx
	addq %rdx, %r10
	movq %r10, 32(%rcx)
	adcq $0, %r11
	movq %r11, 40(%rcx)
	
	movq $0, %rdx
	subq %rax, %r12
	sbbq %rbx, %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	movq %r12, 48(%rcx)
	sbbq $0, %r13
	movq %r13, 56(%rcx)
	movq (%r8), %r10
	addq %rsi, %r10
	movq 8(%r8), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%r8), %r10
	adcq 24(%r8), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	sbbq $0, %r11
	movq (%r8), %r12
	movq $0, %rdx
	subq 16(%r8), %r12
	movq 8(%r8), %r13
	sbbq 24(%r8), %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	sbbq $0, %r13
	movq 32(%r8), %r14
	addq %rsi, %r14
	movq 40(%r8), %r15
	adcq $0, %r15
	movq $0, %rdx
	addq 48(%r8), %r14
	adcq 56(%r8), %r15
	cmovnc %rsi, %rdx
	subq %rdx, %r14
	sbbq $0, %r15
	movq %r10, %rax
	addq %r14, %rax
	movq %r11, %rbx
	adcq %r15, %rbx
	movq $0, %rdx
	cmovc %rsi, %rdx
	addq %rdx, %rax
	movq %rax, (%r8)
	adcq $0, %rbx
	movq %rbx, 8(%r8)
	movq 32(%r8), %rax
	movq $0, %rdx
	subq 48(%r8), %rax
	movq 40(%r8), %rbx
	sbbq 56(%r8), %rbx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	sbbq $0, %rbx
	subq %r14, %r10
	movq $0, %rdx
	sbbq %r15, %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%r8)
	sbbq $0, %r11
	movq %r11, 24(%r8)
	movq $0, %rdx
	movq %rax, %r10
	addq %r12, %r10
	movq %rbx, %r11
	adcq %r13, %r11
	cmovc %rsi, %rdx
	addq %rdx, %r10
	movq %r10, 32(%r8)
	adcq $0, %r11
	movq %r11, 40(%r8)
	
	movq $0, %rdx
	subq %rax, %r12
	sbbq %rbx, %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	movq %r12, 48(%r8)
	sbbq $0, %r13
	movq %r13, 56(%r8)
	movq (%rcx), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rcx), %rax
	mulq 8(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rcx), %rax
	mulq 8(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 8(%rcx), %rax
	mulq (%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, (%r8)
	adcq $0, %r11
	movq %r11, 8(%r8)
	movq 16(%rcx), %rax
	mulq 16(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rcx), %rax
	mulq 24(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rcx), %rax
	mulq 24(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rcx), %rax
	mulq 16(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, (%rdi)
	adcq $0, %r11
	movq %r11, 8(%rdi)
	movq 32(%rcx), %rax
	mulq 32(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rcx), %rax
	mulq 40(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rcx), %rax
	mulq 40(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rcx), %rax
	mulq 32(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 16(%rdi)
	adcq $0, %r11
	movq %r11, 24(%rdi)
	movq 48(%rcx), %rax
	mulq 48(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rcx), %rax
	mulq 56(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rcx), %rax
	mulq 56(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rcx), %rax
	mulq 48(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 32(%rdi)
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq (%rcx), %rax
	mulq (%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rcx), %rax
	mulq 8(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rcx), %rax
	mulq 8(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, (%rcx)
	adcq $0, %r11
	movq %r11, 8(%rcx)
	movq 16(%rcx), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rcx), %rax
	mulq 8(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rcx), %rax
	mulq 8(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rcx), %rax
	mulq (%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 16(%rcx)
	adcq $0, %r11
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rcx), %rax
	mulq 24(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rcx), %rax
	mulq 24(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rcx), %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 32(%rcx)
	adcq $0, %r11
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 32(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rcx), %rax
	mulq 40(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rcx), %rax
	mulq 40(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rcx), %rax
	mulq 32(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 48(%rcx)
	adcq $0, %r11
	movq %r11, 56(%rcx)
	movq (%rdi), %rax
	mulq 16(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rdi), %rax
	mulq 24(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rdi), %rax
	mulq 24(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 8(%rdi), %rax
	mulq 16(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 16(%r8)
	adcq $0, %r11
	movq %r11, 24(%r8)
	movq 16(%rdi), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rdi), %rax
	mulq 40(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rdi), %rax
	mulq 40(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rdi), %rax
	mulq 32(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 32(%r8)
	adcq $0, %r11
	movq %r11, 40(%r8)
	movq 32(%rdi), %rax
	mulq 48(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rdi), %rax
	mulq 56(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rdi), %rax
	mulq 56(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rdi), %rax
	mulq 48(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 48(%r8)
	adcq $0, %r11
	movq %r11, 56(%r8)
	movq (%rcx), %r10
	addq %rsi, %r10
	movq 8(%rcx), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rcx), %r10
	adcq 24(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	sbbq $0, %r11
	movq (%rcx), %r12
	movq $0, %rdx
	subq 16(%rcx), %r12
	movq 8(%rcx), %r13
	sbbq 24(%rcx), %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	sbbq $0, %r13
	movq 32(%rcx), %r14
	addq %rsi, %r14
	movq 40(%rcx), %r15
	adcq $0, %r15
	movq $0, %rdx
	addq 48(%rcx), %r14
	adcq 56(%rcx), %r15
	cmovnc %rsi, %rdx
	subq %rdx, %r14
	sbbq $0, %r15
	movq %r10, %rax
	addq %r14, %rax
	movq %r11, %rbx
	adcq %r15, %rbx
	movq $0, %rdx
	cmovc %rsi, %rdx
	addq %rdx, %rax
	movq %rax, (%rcx)
	adcq $0, %rbx
	movq %rbx, 8(%rcx)
	movq 32(%rcx), %rax
	movq $0, %rdx
	subq 48(%rcx), %rax
	movq 40(%rcx), %rbx
	sbbq 56(%rcx), %rbx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	sbbq $0, %rbx
	subq %r14, %r10
	movq $0, %rdx
	sbbq %r15, %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rcx)
	sbbq $0, %r11
	movq %r11, 24(%rcx)
	movq $0, %rdx
	movq %rax, %r10
	addq %r12, %r10
	movq %rbx, %r11
	adcq %r13, %r11
	cmovc %rsi, %rdx
	addq %rdx, %r10
	movq %r10, 32(%rcx)
	adcq $0, %r11
	movq %r11, 40(%rcx)
	
	movq $0, %rdx
	subq %rax, %r12
	sbbq %rbx, %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	movq %r12, 48(%rcx)
	sbbq $0, %r13
	movq %r13, 56(%rcx)
	movq (%r8), %r10
	addq %rsi, %r10
	movq 8(%r8), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%r8), %r10
	adcq 24(%r8), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	sbbq $0, %r11
	movq (%r8), %r12
	movq $0, %rdx
	subq 16(%r8), %r12
	movq 8(%r8), %r13
	sbbq 24(%r8), %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	sbbq $0, %r13
	movq 32(%r8), %r14
	addq %rsi, %r14
	movq 40(%r8), %r15
	adcq $0, %r15
	movq $0, %rdx
	addq 48(%r8), %r14
	adcq 56(%r8), %r15
	cmovnc %rsi, %rdx
	subq %rdx, %r14
	sbbq $0, %r15
	movq %r10, %rax
	addq %r14, %rax
	movq %r11, %rbx
	adcq %r15, %rbx
	movq $0, %rdx
	cmovc %rsi, %rdx
	addq %rdx, %rax
	movq %rax, (%r8)
	adcq $0, %rbx
	movq %rbx, 8(%r8)
	movq 32(%r8), %rax
	movq $0, %rdx
	subq 48(%r8), %rax
	movq 40(%r8), %rbx
	sbbq 56(%r8), %rbx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	sbbq $0, %rbx
	subq %r14, %r10
	movq $0, %rdx
	sbbq %r15, %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%r8)
	sbbq $0, %r11
	movq %r11, 24(%r8)
	movq $0, %rdx
	movq %rax, %r10
	addq %r12, %r10
	movq %rbx, %r11
	adcq %r13, %r11
	cmovc %rsi, %rdx
	addq %rdx, %r10
	movq %r10, 32(%r8)
	adcq $0, %r11
	movq %r11, 40(%r8)
	
	movq $0, %rdx
	subq %rax, %r12
	sbbq %rbx, %r13
	cmovc %rsi, %rdx
	subq %rdx, %r12
	movq %r12, 48(%r8)
	sbbq $0, %r13
	movq %r13, 56(%r8)
	movq (%rcx), %rax
	mulq (%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rcx), %rax
	mulq 8(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rcx), %rax
	mulq 8(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, (%rcx)
	adcq $0, %r11
	movq %r11, 8(%rcx)
	movq 16(%rcx), %rax
	mulq 16(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rcx), %rax
	mulq 24(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rcx), %rax
	mulq 24(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 16(%rcx)
	adcq $0, %r11
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 32(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rcx), %rax
	mulq 40(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rcx), %rax
	mulq 40(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 32(%rcx)
	adcq $0, %r11
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 48(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rcx), %rax
	mulq 56(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rcx), %rax
	mulq 56(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 48(%rcx)
	adcq $0, %r11
	movq %r11, 56(%rcx)
	movq (%r8), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%r8), %rax
	mulq 8(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%r8), %rax
	mulq 8(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, (%r8)
	adcq $0, %r11
	movq %r11, 8(%r8)
	movq 16(%r8), %rax
	mulq 16(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%r8), %rax
	mulq 24(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%r8), %rax
	mulq 24(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 16(%r8)
	adcq $0, %r11
	movq %r11, 24(%r8)
	movq 32(%r8), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%r8), %rax
	mulq 40(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%r8), %rax
	mulq 40(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 32(%r8)
	adcq $0, %r11
	movq %r11, 40(%r8)
	movq 48(%r8), %rax
	mulq 48(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%r8), %rax
	mulq 56(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%r8), %rax
	mulq 56(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 48(%r8)
	adcq $0, %r11
	movq %r11, 56(%r8)
	movq 16(%rcx), %rax
	mulq 80(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rcx), %rax
	mulq 88(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rcx), %rax
	mulq 88(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rcx), %rax
	mulq 80(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 16(%rcx)
	adcq $0, %r11
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 96(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rcx), %rax
	mulq 104(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rcx), %rax
	mulq 104(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rcx), %rax
	mulq 96(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 32(%rcx)
	adcq $0, %r11
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 112(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rcx), %rax
	mulq 120(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rcx), %rax
	mulq 120(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rcx), %rax
	mulq 112(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 48(%rcx)
	adcq $0, %r11
	movq %r11, 56(%rcx)
	movq 48(%r8), %rax
	mulq 160(%r9)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%r8), %rax
	mulq 168(%r9)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%r8), %rax
	mulq 168(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%r8), %rax
	mulq 160(%r9)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r11
	movq %rdx, %r13
	adcq $0, %r13
	movq %r12, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	adcq $0, %r13
	movq %r13, %rax
	mulq %rsi
	addq %rax, %r10
	adcq %rdx, %r11
	movq $0, %r13
	cmovc %rsi, %r13
	addq %r13, %r10
	movq %r10, 48(%r8)
	adcq $0, %r11
	movq %r11, 56(%r8)
	popq %r12
	popq %r13
	popq %r14
	popq %r15
	popq %rbx
ret
