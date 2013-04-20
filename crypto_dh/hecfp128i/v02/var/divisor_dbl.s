//Huseyin Hisil, 2012.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl hec_fp_dbl_2e128mc_g2i_x8664_asm
hec_fp_dbl_2e128mc_g2i_x8664_asm:
	pushq %r12
	pushq %rbx
	pushq %r13
	movq 16(%r8), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%r8), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%r8), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%r8), %rax
	mulq 64(%r8)
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
	movq 64(%r8), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 72(%r8), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 64(%r8), %rax
	mulq 72(%r8)
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
	movq %r10, (%rdi)
	adcq $0, %r11
	movq %r11, 8(%rdi)
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
	movq %r10, 16(%rdi)
	adcq $0, %r11
	movq %r11, 24(%rdi)
	addq %rsi, %r10
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rdi), %r10
	adcq 24(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rdi)
	sbbq $0, %r11
	movq %r11, 40(%rdi)
	movq 16(%rcx), %r10
	addq %rsi, %r10
	movq 24(%rcx), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rcx), %r10
	adcq 24(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 48(%rdi)
	sbbq $0, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	movq 40(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 48(%rdi), %r10
	adcq 56(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 64(%rdi)
	sbbq $0, %r11
	movq %r11, 72(%rdi)
	movq 64(%rdi), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 72(%rdi), %rax
	mulq 8(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 64(%rdi), %rax
	mulq 8(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 72(%rdi), %rax
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
	movq %r10, 64(%rdi)
	adcq $0, %r11
	movq %r11, 72(%rdi)
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
	movq %r10, 80(%rdi)
	adcq $0, %r11
	movq %r11, 88(%rdi)
	movq 32(%r9), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%r9), %rax
	mulq 8(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%r9), %rax
	mulq 8(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%r9), %rax
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
	movq %r10, 96(%rdi)
	adcq $0, %r11
	movq %r11, 104(%rdi)
	movq $0, %rdx
	subq 80(%rdi), %r10
	sbbq 88(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 80(%rdi)
	sbbq $0, %r11
	movq %r11, 88(%rdi)
	movq 80(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 88(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 80(%rdi), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 88(%rdi), %rax
	mulq 64(%r8)
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
	movq %r10, 80(%rdi)
	adcq $0, %r11
	movq %r11, 88(%rdi)
	addq %rsi, %r10
	adcq $0, %r11
	movq $0, %rdx
	addq 64(%rdi), %r10
	adcq 72(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 80(%rdi)
	sbbq $0, %r11
	movq %r11, 88(%rdi)
	movq 16(%r9), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%r9), %rax
	mulq 8(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%r9), %rax
	mulq 8(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%r9), %rax
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
	movq %r10, (%rdi)
	adcq $0, %r11
	movq %r11, 8(%rdi)
	addq %rsi, %r10
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rdi), %r10
	adcq 24(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, (%rdi)
	sbbq $0, %r11
	movq %r11, 8(%rdi)
	movq $0, %rdx
	subq 48(%rdi), %r10
	sbbq 56(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 48(%rdi)
	sbbq $0, %r11
	movq %r11, 56(%rdi)
	addq %rsi, %r10
	adcq $0, %r11
	movq $0, %rdx
	addq 32(%rdi), %r10
	adcq 40(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 48(%rdi)
	sbbq $0, %r11
	movq %r11, 56(%rdi)
	movq 48(%r8), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%r8), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%r8), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%r8), %rax
	mulq 64(%r8)
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
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%r8), %rax
	mulq 40(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%r8), %rax
	mulq 40(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 8(%r8), %rax
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
	movq %r10, (%rdi)
	adcq $0, %r11
	movq %r11, 8(%rdi)
	addq %rsi, %r10
	adcq $0, %r11
	movq $0, %rdx
	addq (%rdi), %r10
	adcq 8(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rdi)
	sbbq $0, %r11
	movq %r11, 24(%rdi)
	movq (%rdi), %r10
	addq %rsi, %r10
	movq 8(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 48(%rcx), %r10
	adcq 56(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, (%rdi)
	sbbq $0, %r11
	movq %r11, 8(%rdi)
	movq 16(%rdi), %r10
	movq $0, %rdx
	subq 48(%rcx), %r10
	movq 24(%rdi), %r11
	sbbq 56(%rcx), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rdi)
	sbbq $0, %r11
	movq %r11, 24(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	movq 40(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rcx), %r10
	adcq 24(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rdi)
	sbbq $0, %r11
	movq %r11, 40(%rdi)
	movq 32(%r8), %rax
	mulq 32(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%r8), %rax
	mulq 40(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%r8), %rax
	mulq 40(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%r8), %rax
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
	movq %r10, 32(%rdi)
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rdi), %rax
	mulq 56(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rdi), %rax
	mulq 48(%rdi)
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
	movq %r10, 64(%rdi)
	adcq $0, %r11
	movq %r11, 72(%rdi)
	movq 80(%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 88(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 80(%rdi), %rax
	mulq 24(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 88(%rdi), %rax
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
	movq %r10, 96(%rdi)
	adcq $0, %r11
	movq %r11, 104(%rdi)
	movq 64(%rdi), %r10
	movq $0, %rdx
	subq 96(%rdi), %r10
	movq 72(%rdi), %r11
	sbbq 104(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 64(%rdi)
	sbbq $0, %r11
	movq %r11, 72(%rdi)
	movq 80(%rdi), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 88(%rdi), %rax
	mulq 40(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 80(%rdi), %rax
	mulq 40(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 88(%rdi), %rax
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
	movq %r10, 80(%rdi)
	adcq $0, %r11
	movq %r11, 88(%rdi)
	movq 48(%rdi), %rax
	mulq (%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rdi), %rax
	mulq 8(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rdi), %rax
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
	movq %r10, 48(%rdi)
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq $0, %rdx
	subq 80(%rdi), %r10
	sbbq 88(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 48(%rdi)
	sbbq $0, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %rax
	mulq 32(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rdi), %rax
	mulq 40(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rdi), %rax
	mulq 40(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rdi), %rax
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
	movq %r10, 32(%rdi)
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq (%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rdi), %rax
	mulq 24(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 8(%rdi), %rax
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
	movq %r10, (%rdi)
	adcq $0, %r11
	movq %r11, 8(%rdi)
	movq 32(%rdi), %r10
	movq $0, %rdx
	subq (%rdi), %r10
	movq 40(%rdi), %r11
	sbbq 8(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rdi)
	sbbq $0, %r11
	movq %r11, 40(%rdi)
	movq 64(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 72(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 64(%rdi), %rax
	mulq 56(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 72(%rdi), %rax
	mulq 48(%rdi)
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
	movq 32(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rdi), %rax
	mulq 56(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rdi), %rax
	mulq 48(%rdi)
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
	movq 48(%rdi), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rdi), %rax
	mulq 56(%rdi)
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
	movq %r10, 48(%rdi)
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq 16(%rcx), %rax
	mulq 48(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rcx), %rax
	mulq 56(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rcx), %rax
	mulq 56(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rcx), %rax
	mulq 48(%rdi)
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
	movq %r10, 80(%rdi)
	adcq $0, %r11
	movq %r11, 88(%rdi)
	movq 48(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rdi), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rdi), %rax
	mulq 64(%r8)
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
	movq %r10, 96(%rdi)
	adcq $0, %r11
	movq %r11, 104(%rdi)
	movq 48(%rdi), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rdi), %rax
	mulq 8(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rdi), %rax
	mulq 8(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rdi), %rax
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
	movq %r10, 48(%rdi)
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	movq 40(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 32(%rdi), %r10
	adcq 40(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rdi)
	sbbq $0, %r11
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 32(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rdi), %rax
	mulq 40(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rdi), %rax
	mulq 40(%rdi)
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
	movq %r10, 32(%rdi)
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rdi), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rdi), %rax
	mulq 64(%r8)
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
	movq 16(%rdi), %r10
	addq %rsi, %r10
	movq 24(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rdi), %r10
	adcq 24(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rdi)
	sbbq $0, %r11
	movq %r11, 24(%rdi)
	movq 16(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rdi), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rdi), %rax
	mulq 64(%r8)
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
	movq 32(%r8), %rax
	mulq 16(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%r8), %rax
	mulq 24(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%r8), %rax
	mulq 24(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%r8), %rax
	mulq 16(%rcx)
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
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rcx), %rax
	mulq 24(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rcx), %rax
	mulq 24(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rcx), %rax
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
	movq %r10, 48(%rcx)
	adcq $0, %r11
	movq %r11, 56(%rcx)
	movq (%rdi), %r10
	movq $0, %rdx
	subq 48(%rdi), %r10
	movq 8(%rdi), %r11
	sbbq 56(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rdi)
	sbbq $0, %r11
	movq %r11, 24(%rdi)
	movq 64(%rdi), %rax
	mulq 64(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 72(%rdi), %rax
	mulq 72(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 64(%rdi), %rax
	mulq 72(%rdi)
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
	movq %r10, 64(%rdi)
	adcq $0, %r11
	movq %r11, 72(%rdi)
	movq 32(%rdi), %r10
	addq %rsi, %r10
	movq 40(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 32(%rdi), %r10
	adcq 40(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 112(%rdi)
	sbbq $0, %r11
	movq %r11, 120(%rdi)
	movq $0, %rdx
	subq 16(%rdi), %r10
	sbbq 24(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 112(%rdi)
	sbbq $0, %r11
	movq %r11, 120(%rdi)
	movq $0, %rdx
	subq (%rdi), %r10
	sbbq 8(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 112(%rdi)
	sbbq $0, %r11
	movq %r11, 120(%rdi)
	movq 112(%rdi), %rax
	mulq (%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 120(%rdi), %rax
	mulq 8(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 112(%rdi), %rax
	mulq 8(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 120(%rdi), %rax
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
	movq %r10, 112(%rdi)
	adcq $0, %r11
	movq %r11, 120(%rdi)
	addq %rsi, %r10
	adcq $0, %r11
	movq $0, %rdx
	addq 64(%rdi), %r10
	adcq 72(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 112(%rdi)
	sbbq $0, %r11
	movq %r11, 120(%rdi)
	movq 32(%rcx), %r10
	addq %rsi, %r10
	movq 40(%rcx), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 32(%rcx), %r10
	adcq 40(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 64(%rdi)
	sbbq $0, %r11
	movq %r11, 72(%rdi)
	movq 112(%rdi), %r10
	addq %rsi, %r10
	movq 120(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 64(%rdi), %r10
	adcq 72(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 112(%rdi)
	sbbq $0, %r11
	movq %r11, 120(%rdi)
	movq 80(%rdi), %r10
	addq %rsi, %r10
	movq 88(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 32(%rcx), %r10
	adcq 40(%rcx), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rcx)
	sbbq $0, %r11
	movq %r11, 40(%rcx)
	movq 80(%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 88(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 80(%rdi), %rax
	mulq 24(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 88(%rdi), %rax
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
	movq %r10, 80(%rdi)
	adcq $0, %r11
	movq %r11, 88(%rdi)
	movq 16(%rdi), %r10
	addq %rsi, %r10
	movq 24(%rdi), %r11
	adcq $0, %r11
	movq $0, %rdx
	addq 16(%rdi), %r10
	adcq 24(%rdi), %r11
	cmovnc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, (%rcx)
	sbbq $0, %r11
	movq %r11, 8(%rcx)
	movq $0, %rdx
	subq 32(%rdi), %r10
	sbbq 40(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, (%rcx)
	sbbq $0, %r11
	movq %r11, 8(%rcx)
	movq $0, %rdx
	subq 16(%rdi), %r10
	sbbq 24(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 16(%rdi)
	sbbq $0, %r11
	movq %r11, 24(%rdi)
	movq 48(%rdi), %r10
	movq $0, %rdx
	subq (%rcx), %r10
	movq 56(%rdi), %r11
	sbbq 8(%rcx), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 48(%rdi)
	sbbq $0, %r11
	movq %r11, 56(%rdi)
	movq 48(%rdi), %rax
	mulq 16(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rdi), %rax
	mulq 24(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rdi), %rax
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
	movq %r10, 48(%rdi)
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq 48(%rdi), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rdi), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rdi), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rdi), %rax
	mulq 64(%r8)
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
	movq %r10, 48(%rdi)
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq 16(%rcx), %rax
	mulq 64(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq 24(%rcx), %rax
	mulq 72(%r8)
	movq %rax, %r12
	movq %rdx, %r13
	movq 16(%rcx), %rax
	mulq 72(%r8)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 24(%rcx), %rax
	mulq 64(%r8)
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
	movq %r10, 64(%rcx)
	adcq $0, %r11
	movq %r11, 72(%rcx)
	movq (%rdi), %r10
	movq $0, %rdx
	subq (%rcx), %r10
	movq 8(%rdi), %r11
	sbbq 8(%rcx), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, (%rdi)
	sbbq $0, %r11
	movq %r11, 8(%rdi)
	movq (%rcx), %rax
	mulq 64(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rcx), %rax
	mulq 72(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rcx), %rax
	mulq 72(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 8(%rcx), %rax
	mulq 64(%rcx)
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
	movq 112(%rdi), %rax
	mulq 16(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq 120(%rdi), %rax
	mulq 24(%rcx)
	movq %rax, %r12
	movq %rdx, %r13
	movq 112(%rdi), %rax
	mulq 24(%rcx)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 120(%rdi), %rax
	mulq 16(%rcx)
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
	movq 32(%rcx), %r10
	movq $0, %rdx
	subq 112(%rdi), %r10
	movq 40(%rcx), %r11
	sbbq 120(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rcx)
	sbbq $0, %r11
	movq %r11, 40(%rcx)
	movq 32(%rcx), %rax
	mulq 96(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 40(%rcx), %rax
	mulq 104(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 32(%rcx), %rax
	mulq 104(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 40(%rcx), %rax
	mulq 96(%rdi)
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
	movq 48(%rdi), %r10
	movq $0, %rdx
	subq 32(%rcx), %r10
	movq 56(%rdi), %r11
	sbbq 40(%rcx), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 32(%rcx)
	sbbq $0, %r11
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 96(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 56(%rcx), %rax
	mulq 104(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 48(%rcx), %rax
	mulq 104(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 56(%rcx), %rax
	mulq 96(%rdi)
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
	mulq 112(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 8(%rdi), %rax
	mulq 120(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq (%rdi), %rax
	mulq 120(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 8(%rdi), %rax
	mulq 112(%rdi)
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
	movq $0, %rdx
	subq 80(%rdi), %r10
	sbbq 88(%rdi), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, (%rdi)
	sbbq $0, %r11
	movq %r11, 8(%rdi)
	movq $0, %rdx
	subq 48(%rcx), %r10
	sbbq 56(%rcx), %r11
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 48(%rcx)
	sbbq $0, %r11
	movq %r11, 56(%rcx)
	movq 64(%rcx), %rax
	mulq 96(%rdi)
	movq %rax, %r10
	movq %rdx, %r11
	movq 72(%rcx), %rax
	mulq 104(%rdi)
	movq %rax, %r12
	movq %rdx, %r13
	movq 64(%rcx), %rax
	mulq 104(%rdi)
	addq %rax, %r11
	adcq %rdx, %r12
	adcq $0, %r13
	movq 72(%rcx), %rax
	mulq 96(%rdi)
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
	movq %r10, 64(%rcx)
	adcq $0, %r11
	movq %r11, 72(%rcx)
	popq %r13
	popq %rbx
	popq %r12
ret
