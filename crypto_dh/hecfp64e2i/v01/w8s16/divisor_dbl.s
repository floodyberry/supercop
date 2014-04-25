//Huseyin Hisil, 2013.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl hec_fp_dbl_2e064mce2_g2i_x8664_asm
hec_fp_dbl_2e064mce2_g2i_x8664_asm:
	pushq %r12
	pushq %rbx
	pushq %r13
	movq 16(%r8), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r8), %rax
	mulq 64(%r8)
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
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq 64(%r8), %rax
	mulq 72(%r8)
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
	movq 64(%r8), %r10
	subq 72(%r8), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 64(%r8), %rax
	addq %rsi, %rax
	addq 72(%r8), %rax
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
	movq %r10, (%rdi)
	movq %r11, 8(%rdi)
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
	movq %r10, 16(%rdi)
	movq %r11, 24(%rdi)
	addq %rsi, %r10
	addq 16(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rdi)
	addq %rsi, %r11
	addq 24(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rdi)
	movq 16(%rcx), %r10
	addq %rsi, %r10
	addq 16(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 48(%rdi)
	movq 24(%rcx), %r11
	addq %rsi, %r11
	addq 24(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	addq 48(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 64(%rdi)
	movq 40(%rdi), %r11
	addq %rsi, %r11
	addq 56(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 72(%rdi)
	movq 64(%rdi), %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 72(%rdi), %rax
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
	movq 64(%rdi), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 72(%rdi), %r12
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
	movq %r10, 64(%rdi)
	movq %r11, 72(%rdi)
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
	movq %r10, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 32(%r9), %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r9), %rax
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
	movq 32(%r9), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r9), %r12
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
	movq %r10, 96(%rdi)
	movq %r11, 104(%rdi)
	subq 80(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 80(%rdi)
	subq 88(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 88(%rdi)
	movq 80(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	mulq 64(%r8)
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
	movq 80(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq %r10, 80(%rdi)
	movq %r11, 88(%rdi)
	addq %rsi, %r10
	addq 64(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 80(%rdi)
	addq %rsi, %r11
	addq 72(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 88(%rdi)
	movq 16(%r9), %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r9), %rax
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
	movq 16(%r9), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%r9), %r12
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
	movq %r10, (%rdi)
	movq %r11, 8(%rdi)
	addq %rsi, %r10
	addq 16(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, (%rdi)
	addq %rsi, %r11
	addq 24(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 8(%rdi)
	subq 48(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 48(%rdi)
	subq 56(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 56(%rdi)
	addq %rsi, %r10
	addq 32(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 48(%rdi)
	addq %rsi, %r11
	addq 40(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 56(%rdi)
	movq 48(%r8), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%r8), %rax
	mulq 64(%r8)
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
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq (%r8), %rax
	mulq 40(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%r8), %rax
	mulq 32(%r8)
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
	movq (%r8), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 40(%r8)
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
	addq %rsi, %r10
	addq (%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 16(%rdi)
	addq %rsi, %r11
	addq 8(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 24(%rdi)
	movq (%rdi), %r10
	addq %rsi, %r10
	addq 48(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, (%rdi)
	movq 8(%rdi), %r11
	addq %rsi, %r11
	addq 56(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 8(%rdi)
	movq 16(%rdi), %r10
	subq 48(%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 16(%rdi)
	movq 24(%rdi), %r11
	subq 56(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 24(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	addq 16(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rdi)
	movq 40(%rdi), %r11
	addq %rsi, %r11
	addq 24(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rdi)
	movq 32(%r8), %rax
	mulq 40(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %rax
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
	movq 32(%r8), %rax
	mulq 32(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %r12
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
	movq %r10, 32(%rdi)
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	mulq 48(%rdi)
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
	movq 32(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 56(%rdi)
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
	movq %r10, 64(%rdi)
	movq %r11, 72(%rdi)
	movq 80(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %rax
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
	movq 80(%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %r12
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
	movq %r10, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 64(%rdi), %r10
	subq 96(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 64(%rdi)
	movq 72(%rdi), %r11
	subq 104(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 72(%rdi)
	movq 80(%rdi), %rax
	mulq 40(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	mulq 32(%r8)
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
	movq 80(%rdi), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 40(%r8)
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
	movq %r10, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 48(%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %rax
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
	movq 48(%rdi), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %r12
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
	movq %r10, 48(%rdi)
	movq %r11, 56(%rdi)
	subq 80(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 48(%rdi)
	subq 88(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %rax
	mulq 40(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	mulq 32(%r8)
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
	movq 32(%rdi), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 40(%r8)
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
	movq (%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rdi), %r12
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
	movq %r10, (%rdi)
	movq %r11, 8(%rdi)
	movq 32(%rdi), %r10
	subq (%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rdi)
	movq 40(%rdi), %r11
	subq 8(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rdi)
	movq 64(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 72(%rdi), %rax
	mulq 48(%rdi)
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
	movq 64(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 72(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 56(%rdi)
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
	movq 32(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	mulq 48(%rdi)
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
	movq 32(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 56(%rdi)
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
	movq 48(%rdi), %rax
	mulq 56(%rdi)
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
	movq 48(%rdi), %r10
	subq 56(%rdi), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 48(%rdi), %rax
	addq %rsi, %rax
	addq 56(%rdi), %rax
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
	movq %r10, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 16(%rcx), %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	mulq 48(%rdi)
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
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 56(%rdi)
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
	movq %r10, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 48(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	mulq 64(%r8)
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
	movq 48(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq %r10, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 48(%rdi), %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %rax
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
	movq 48(%rdi), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %r12
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
	movq %r10, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	addq 32(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rdi)
	movq 40(%rdi), %r11
	addq %rsi, %r11
	addq 40(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 40(%rdi)
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
	movq 32(%rdi), %r10
	subq 40(%rdi), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 32(%rdi), %rax
	addq %rsi, %rax
	addq 40(%rdi), %rax
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
	movq %r10, 32(%rdi)
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	mulq 64(%r8)
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
	movq 32(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq 16(%rdi), %r10
	addq %rsi, %r10
	addq 16(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 16(%rdi)
	movq 24(%rdi), %r11
	addq %rsi, %r11
	addq 24(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 24(%rdi)
	movq 16(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rdi), %rax
	mulq 64(%r8)
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
	movq 16(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq 32(%r8), %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %rax
	mulq 16(%rcx)
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
	mulq 16(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%r8), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 24(%rcx)
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
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %rax
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
	movq 48(%rcx), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %r12
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
	movq %r10, 48(%rcx)
	movq %r11, 56(%rcx)
	movq (%rdi), %r10
	subq 48(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 16(%rdi)
	movq 8(%rdi), %r11
	subq 56(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 24(%rdi)
	movq 64(%rdi), %rax
	mulq 72(%rdi)
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
	movq 64(%rdi), %r10
	subq 72(%rdi), %r10
	movq $0, %rbx
	cmovc %rsi, %rbx
	subq %rbx, %r10
	movq 64(%rdi), %rax
	addq %rsi, %rax
	addq 72(%rdi), %rax
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
	movq %r10, 64(%rdi)
	movq %r11, 72(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	addq 32(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 112(%rdi)
	movq 40(%rdi), %r11
	addq %rsi, %r11
	addq 40(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 120(%rdi)
	subq 16(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 112(%rdi)
	subq 24(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 120(%rdi)
	subq (%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 112(%rdi)
	subq 8(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 120(%rdi)
	movq 112(%rdi), %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 120(%rdi), %rax
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
	movq 112(%rdi), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 120(%rdi), %r12
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
	movq %r10, 112(%rdi)
	movq %r11, 120(%rdi)
	addq %rsi, %r10
	addq 64(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 112(%rdi)
	addq %rsi, %r11
	addq 72(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 120(%rdi)
	movq 32(%rcx), %r10
	addq %rsi, %r10
	addq 32(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 64(%rdi)
	movq 40(%rcx), %r11
	addq %rsi, %r11
	addq 40(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 72(%rdi)
	movq 112(%rdi), %r10
	addq %rsi, %r10
	addq 64(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 112(%rdi)
	movq 120(%rdi), %r11
	addq %rsi, %r11
	addq 72(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 120(%rdi)
	movq 80(%rdi), %r10
	addq %rsi, %r10
	addq 32(%rcx), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rcx)
	movq 88(%rdi), %r11
	addq %rsi, %r11
	addq 40(%rcx), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rcx)
	movq 80(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %rax
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
	movq 80(%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 88(%rdi), %r12
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
	movq %r10, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 16(%rdi), %r10
	addq %rsi, %r10
	addq 16(%rdi), %r10
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r10
	movq %r10, (%rcx)
	movq 24(%rdi), %r11
	addq %rsi, %r11
	addq 24(%rdi), %r11
	movq $0, %rax
	cmovnc %rsi, %rax
	subq %rax, %r11
	movq %r11, 8(%rcx)
	subq 32(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, (%rcx)
	subq 40(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 8(%rcx)
	subq 16(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 16(%rdi)
	subq 24(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 24(%rdi)
	movq 48(%rdi), %r10
	subq (%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 48(%rdi)
	movq 56(%rdi), %r11
	subq 8(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 56(%rdi)
	movq 48(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %rax
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
	movq 48(%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %r12
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
	movq %r10, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 48(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	mulq 64(%r8)
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
	movq 48(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq %r10, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 16(%rcx), %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	mulq 64(%r8)
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
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 24(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%r8)
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
	movq %r10, 64(%rcx)
	movq %r11, 72(%rcx)
	movq (%rdi), %r10
	subq (%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, (%rdi)
	movq 8(%rdi), %r11
	subq 8(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 8(%rdi)
	movq (%rcx), %rax
	mulq 72(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	mulq 64(%rcx)
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
	mulq 64(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 72(%rcx)
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
	movq 112(%rdi), %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 120(%rdi), %rax
	mulq 16(%rcx)
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
	movq 112(%rdi), %rax
	mulq 16(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 120(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 24(%rcx)
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
	movq 32(%rcx), %r10
	subq 112(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rcx)
	movq 40(%rcx), %r11
	subq 120(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rcx)
	movq 32(%rcx), %rax
	mulq 104(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	mulq 96(%rdi)
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
	mulq 96(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 40(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 104(%rdi)
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
	movq 48(%rdi), %r10
	subq 32(%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 32(%rcx)
	movq 56(%rdi), %r11
	subq 40(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 104(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	mulq 96(%rdi)
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
	mulq 96(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 56(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 104(%rdi)
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
	movq (%rdi), %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	mulq 112(%rdi)
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
	movq (%rdi), %rax
	mulq 112(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 8(%rdi), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 120(%rdi)
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
	subq 80(%rdi), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, (%rdi)
	subq 88(%rdi), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 8(%rdi)
	subq 48(%rcx), %r10
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r10
	movq %r10, 48(%rcx)
	subq 56(%rcx), %r11
	movq $0, %rax
	cmovc %rsi, %rax
	subq %rax, %r11
	movq %r11, 56(%rcx)
	movq 64(%rcx), %rax
	mulq 104(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 72(%rcx), %rax
	mulq 96(%rdi)
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
	movq 64(%rcx), %rax
	mulq 96(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 72(%rcx), %r12
	movq $0, %rax
	subq %r12, %rax
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %rax
	mulq 104(%rdi)
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
	movq %r10, 64(%rcx)
	movq %r11, 72(%rcx)
	popq %r13
	popq %rbx
	popq %r12
ret
