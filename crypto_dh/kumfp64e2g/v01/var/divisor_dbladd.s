//Huseyin Hisil, 2013.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl kum_fp_dbladd_2e064mce2_g_x8664_asm
kum_fp_dbladd_2e064mce2_g_x8664_asm:
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq %rdx, %r10
	shrq $6, %r10
	movq %r10, %r11
	shlq $6, %r11
	subq %r11, %rdx
	movq (%rsi,%r10,8), %r11
	btq  %rdx, %r11
	movq %rcx, %r11
	movq %r8, %r10
	cmovc %rcx, %r10
	cmovc %r8, %r11
	movq %r11, %r8
	movq %r10, %rcx
	movq 8*0(%r9), %rsi
	movq (%rcx), %r10
	addq %rsi, %r10
	addq 16(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq 8(%rcx), %r11
	addq %rsi, %r11
	addq 24(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq 32(%rcx), %r14
	addq %rsi, %r14
	addq 48(%rcx), %r14
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r14
	movq 40(%rcx), %r15
	addq %rsi, %r15
	addq 56(%rcx), %r15
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r15
	movq (%rcx), %r12
	subq 16(%rcx), %r12
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r12
	movq %r12, %r12
	movq 8(%rcx), %r13
	subq 24(%rcx), %r13
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r13
	movq %r10, %rdx
	addq %rsi, %rdx
	addq %r14, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, (%rcx)
	movq %r11, %rdx
	addq %rsi, %rdx
	addq %r15, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 8(%rcx)
	movq %r10, %rdx
	subq %r14, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 16(%rcx)
	movq %r11, %rdx
	subq %r15, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 24(%rcx)
	movq 32(%rcx), %r10
	subq 48(%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq 40(%rcx), %r11
	subq 56(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r12, %rdx
	addq %rsi, %rdx
	addq %r10, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 32(%rcx)
	movq %r13, %rdx
	addq %rsi, %rdx
	addq %r11, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 40(%rcx)
	movq %r12, %rdx
	subq %r10, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 48(%rcx)
	movq %r13, %rdx
	subq %r11, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 56(%rcx)
	movq (%r8), %r10
	addq %rsi, %r10
	addq 16(%r8), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq 8(%r8), %r11
	addq %rsi, %r11
	addq 24(%r8), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq 32(%r8), %r14
	addq %rsi, %r14
	addq 48(%r8), %r14
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r14
	movq 40(%r8), %r15
	addq %rsi, %r15
	addq 56(%r8), %r15
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r15
	movq (%r8), %r12
	subq 16(%r8), %r12
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r12
	movq %r12, %r12
	movq 8(%r8), %r13
	subq 24(%r8), %r13
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r13
	movq %r10, %rdx
	addq %rsi, %rdx
	addq %r14, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, (%r8)
	movq %r11, %rdx
	addq %rsi, %rdx
	addq %r15, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 8(%r8)
	movq %r10, %rdx
	subq %r14, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 16(%r8)
	movq %r11, %rdx
	subq %r15, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 24(%r8)
	movq 32(%r8), %r10
	subq 48(%r8), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq 40(%r8), %r11
	subq 56(%r8), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r12, %rdx
	addq %rsi, %rdx
	addq %r10, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 32(%r8)
	movq %r13, %rdx
	addq %rsi, %rdx
	addq %r11, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 40(%r8)
	movq %r12, %rdx
	subq %r10, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 48(%r8)
	movq %r13, %rdx
	subq %r11, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 56(%r8)
	movq (%rcx), %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	mulq (%r8)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq (%rcx), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 8(%r8)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, (%r8)
	movq %r11, 8(%r8)
	movq 16(%rcx), %rax
	mulq 24(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	mulq 16(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 16(%rcx), %rax
	mulq 16(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 24(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, (%rdi)
	movq %r11, 8(%rdi)
	movq 32(%rcx), %rax
	mulq 40(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	mulq 32(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 32(%rcx), %rax
	mulq 32(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 40(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%rdi)
	movq %r11, 24(%rdi)
	movq 48(%rcx), %rax
	mulq 56(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	mulq 48(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 48(%rcx), %rax
	mulq 48(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 56(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%rdi)
	movq %r11, 40(%rdi)
	movq (%rcx), %rax
	mulq 8(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq (%rcx), %r10
	subq 8(%rcx), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq (%rcx), %rax
	addq %rsi, %rax
	addq 8(%rcx), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, (%rcx)
	movq %r11, 8(%rcx)
	movq 16(%rcx), %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	mulq (%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 16(%rcx), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 8(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	mulq 16(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 32(%rcx), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 24(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%rcx)
	movq %r11, 40(%rcx)
	movq 16(%r8), %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r8), %rax
	mulq (%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 16(%r8), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 8(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%r8)
	movq %r11, 24(%r8)
	movq 48(%rcx), %rax
	mulq 40(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	mulq 32(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 48(%rcx), %rax
	mulq 32(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 40(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 48(%rcx)
	movq %r11, 56(%rcx)
	movq 32(%r8), %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %rax
	mulq 16(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 32(%r8), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 24(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%r8)
	movq %r11, 40(%r8)
	movq 48(%r8), %rax
	mulq 40(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%r8), %rax
	mulq 32(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 48(%r8), %rax
	mulq 32(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 40(%rdi)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 48(%r8)
	movq %r11, 56(%r8)
	movq (%rcx), %r10
	addq %rsi, %r10
	addq 16(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq 8(%rcx), %r11
	addq %rsi, %r11
	addq 24(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq 32(%rcx), %r14
	addq %rsi, %r14
	addq 48(%rcx), %r14
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r14
	movq 40(%rcx), %r15
	addq %rsi, %r15
	addq 56(%rcx), %r15
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r15
	movq (%rcx), %r12
	subq 16(%rcx), %r12
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r12
	movq %r12, %r12
	movq 8(%rcx), %r13
	subq 24(%rcx), %r13
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r13
	movq %r10, %rdx
	addq %rsi, %rdx
	addq %r14, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, (%rcx)
	movq %r11, %rdx
	addq %rsi, %rdx
	addq %r15, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 8(%rcx)
	movq %r10, %rdx
	subq %r14, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 16(%rcx)
	movq %r11, %rdx
	subq %r15, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 24(%rcx)
	movq 32(%rcx), %r10
	subq 48(%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq 40(%rcx), %r11
	subq 56(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r12, %rdx
	addq %rsi, %rdx
	addq %r10, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 32(%rcx)
	movq %r13, %rdx
	addq %rsi, %rdx
	addq %r11, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 40(%rcx)
	movq %r12, %rdx
	subq %r10, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 48(%rcx)
	movq %r13, %rdx
	subq %r11, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 56(%rcx)
	movq (%r8), %r10
	addq %rsi, %r10
	addq 16(%r8), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq 8(%r8), %r11
	addq %rsi, %r11
	addq 24(%r8), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq 32(%r8), %r14
	addq %rsi, %r14
	addq 48(%r8), %r14
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r14
	movq 40(%r8), %r15
	addq %rsi, %r15
	addq 56(%r8), %r15
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r15
	movq (%r8), %r12
	subq 16(%r8), %r12
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r12
	movq %r12, %r12
	movq 8(%r8), %r13
	subq 24(%r8), %r13
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r13
	movq %r10, %rdx
	addq %rsi, %rdx
	addq %r14, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, (%r8)
	movq %r11, %rdx
	addq %rsi, %rdx
	addq %r15, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 8(%r8)
	movq %r10, %rdx
	subq %r14, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 16(%r8)
	movq %r11, %rdx
	subq %r15, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 24(%r8)
	movq 32(%r8), %r10
	subq 48(%r8), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq 40(%r8), %r11
	subq 56(%r8), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r12, %rdx
	addq %rsi, %rdx
	addq %r10, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 32(%r8)
	movq %r13, %rdx
	addq %rsi, %rdx
	addq %r11, %rdx
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 40(%r8)
	movq %r12, %rdx
	subq %r10, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 48(%r8)
	movq %r13, %rdx
	subq %r11, %rdx
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %rdx
	movq %rdx, 56(%r8)
	movq (%rcx), %rax
	mulq 8(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq (%rcx), %r10
	subq 8(%rcx), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq (%rcx), %rax
	addq %rsi, %rax
	addq 8(%rcx), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, (%rcx)
	movq %r11, 8(%rcx)
	movq 16(%rcx), %rax
	mulq 24(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq 16(%rcx), %r10
	subq 24(%rcx), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 16(%rcx), %rax
	addq %rsi, %rax
	addq 24(%rcx), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 40(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq 32(%rcx), %r10
	subq 40(%rcx), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 32(%rcx), %rax
	addq %rsi, %rax
	addq 40(%rcx), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%rcx)
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 56(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq 48(%rcx), %r10
	subq 56(%rcx), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 48(%rcx), %rax
	addq %rsi, %rax
	addq 56(%rcx), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 48(%rcx)
	movq %r11, 56(%rcx)
	movq (%r8), %rax
	mulq 8(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq (%r8), %r10
	subq 8(%r8), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq (%r8), %rax
	addq %rsi, %rax
	addq 8(%r8), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, (%r8)
	movq %r11, 8(%r8)
	movq 16(%r8), %rax
	mulq 24(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq 16(%r8), %r10
	subq 24(%r8), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 16(%r8), %rax
	addq %rsi, %rax
	addq 24(%r8), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%r8)
	movq %r11, 24(%r8)
	movq 32(%r8), %rax
	mulq 40(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq 32(%r8), %r10
	subq 40(%r8), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 32(%r8), %rax
	addq %rsi, %rax
	addq 40(%r8), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%r8)
	movq %r11, 40(%r8)
	movq 48(%r8), %rax
	mulq 56(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	addq %rax, %r11
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r11
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r11
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r11
	movq 48(%r8), %r10
	subq 56(%r8), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 48(%r8), %rax
	addq %rsi, %rax
	addq 56(%r8), %rax
	movq $0, %rbx
	cmovnc %rsi, %rbx
	subq %rbx, %rax
	mulq %r10
	movq %rax, %r10
	movq %rdx, %rbx
	movq %rbx, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 48(%r8)
	movq %r11, 56(%r8)
	movq (%rcx), %rax
	mulq 72(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	mulq 64(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq (%rcx), %rax
	mulq 64(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, (%rcx)
	movq %r11, 8(%rcx)
	movq 16(%rcx), %rax
	mulq 88(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	mulq 80(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 16(%rcx), %rax
	mulq 80(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 88(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 104(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	mulq 96(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 32(%rcx), %rax
	mulq 96(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 104(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%rcx)
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 120(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	mulq 112(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 48(%rcx), %rax
	mulq 112(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 120(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 48(%rcx)
	movq %r11, 56(%rcx)
	movq 16(%r8), %rax
	mulq 136(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r8), %rax
	mulq 128(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 16(%r8), %rax
	mulq 128(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 136(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 16(%r8)
	movq %r11, 24(%r8)
	movq 32(%r8), %rax
	mulq 152(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %rax
	mulq 144(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 32(%r8), %rax
	mulq 144(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 152(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 32(%r8)
	movq %r11, 40(%r8)
	movq 48(%r8), %rax
	mulq 168(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%r8), %rax
	mulq 160(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, %r11
	movq 48(%r8), %rax
	mulq 160(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 168(%r9)
	addq %rax, %r10
	adcq %rdx, %rbx
	movq $0, %r12
	cmovc %rsi, %r12
	movq %rbx, %rax
	mulq %rsi
	addq %r12, %rdx
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	addq %rbx, %r10
	movq %r10, 48(%r8)
	movq %r11, 56(%r8)
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
ret
