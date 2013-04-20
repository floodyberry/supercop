//Huseyin Hisil, 2012.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl hec_fp_dbl_2e127m1_g2i_x8664_asm
hec_fp_dbl_2e127m1_g2i_x8664_asm:
	pushq %r12
	movq 16(%r8), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%r8), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 16(%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%r8), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rcx)
	adcq $0, %rsi
	movq %rsi, 24(%rcx)
	movq 64(%r8), %rax
	mulq 72(%r8)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 64(%r8), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 64(%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%r8), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq (%r8), %rax
	mulq 8(%r8)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%r8), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%r8), %rax
	mulq 8(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rdi)
	adcq $0, %rsi
	movq %rsi, 24(%rdi)
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	movq %rsi, 40(%rdi)
	movq 16(%rcx), %r12
	addq %r12, %r12
	movq 24(%rcx), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	movq %rsi, 56(%rdi)
	movq 32(%rdi), %r12
	addq 48(%rdi), %r12
	movq 40(%rdi), %rsi
	adcq 56(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rdi)
	adcq $0, %rsi
	movq %rsi, 72(%rdi)
	movq 64(%rdi), %rax
	mulq 8(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 72(%rdi), %rax
	mulq (%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%r8), %rax
	mulq 64(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rdi), %rax
	mulq 8(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rdi)
	adcq $0, %rsi
	movq %rsi, 72(%rdi)
	movq 32(%r8), %rax
	mulq 40(%r8)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 32(%r8), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 32(%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%r8), %rax
	mulq 40(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 16(%r9), %rax
	mulq 8(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%r9), %rax
	mulq (%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rdi), %rax
	mulq 16(%r9)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%r9), %rax
	mulq 8(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	subq 80(%rdi), %r12
	sbbq 88(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 80(%rdi)
	sbbq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 80(%rdi), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	addq 64(%rdi), %r12
	adcq 72(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq (%r9), %rax
	mulq 8(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%r9), %rax
	mulq (%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rdi), %rax
	mulq (%r9)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%r9), %rax
	mulq 8(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	addq 16(%rdi), %r12
	adcq 24(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	subq 48(%rdi), %r12
	sbbq 56(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 56(%rdi)
	addq 32(%rdi), %r12
	adcq 40(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 48(%r8), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%r8), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 48(%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%r8), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rcx)
	adcq $0, %rsi
	movq %rsi, 56(%rcx)
	movq (%r8), %rax
	mulq 40(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%r8), %rax
	mulq 32(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%r8), %rax
	mulq (%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%r8), %rax
	mulq 40(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rdi)
	movq %rsi, 24(%rdi)
	movq (%rdi), %r12
	addq 48(%rcx), %r12
	movq 8(%rdi), %rsi
	adcq 56(%rcx), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq 16(%rdi), %r12
	subq 48(%rcx), %r12
	movq 24(%rdi), %rsi
	sbbq 56(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 16(%rdi)
	sbbq $0, %rsi
	movq %rsi, 24(%rdi)
	movq 32(%rdi), %r12
	addq 16(%rcx), %r12
	movq 40(%rdi), %rsi
	adcq 24(%rcx), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	adcq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 32(%r8), %rax
	mulq 40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%r8), %rax
	mulq 32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%rdi), %rax
	mulq 32(%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%r8), %rax
	mulq 40(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	adcq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 48(%rdi), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rdi)
	adcq $0, %rsi
	movq %rsi, 72(%rdi)
	movq 80(%rdi), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 24(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	movq 64(%rdi), %r12
	subq 96(%rdi), %r12
	movq 72(%rdi), %rsi
	sbbq 104(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 64(%rdi)
	sbbq $0, %rsi
	movq %rsi, 72(%rdi)
	movq 80(%rdi), %rax
	mulq 40(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq 32(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%r8), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 40(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 48(%rdi), %rax
	mulq 8(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq (%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rdi), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 8(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
	subq 80(%rdi), %r12
	sbbq 88(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 32(%rdi), %rax
	mulq 40(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 32(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%r8), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 40(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	adcq $0, %rsi
	movq %rsi, 40(%rdi)
	movq (%rdi), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
	mulq 24(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq 32(%rdi), %r12
	subq (%rdi), %r12
	movq 40(%rdi), %rsi
	sbbq 8(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 32(%rdi)
	sbbq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 64(%rdi), %rax
	mulq 56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 72(%rdi), %rax
	mulq 48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 48(%rdi), %rax
	mulq 64(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rdi), %rax
	mulq 56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq 32(%rdi), %rax
	mulq 56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 48(%rdi), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rdi)
	adcq $0, %rsi
	movq %rsi, 24(%rdi)
	movq 48(%rdi), %rax
	mulq 56(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 48(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 16(%rcx), %rax
	mulq 56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rcx), %rax
	mulq 48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 48(%rdi), %rax
	mulq 16(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rcx), %rax
	mulq 56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 48(%rdi), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	movq 48(%rdi), %rax
	mulq 8(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq (%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%r8), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 8(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 32(%rdi), %r12
	addq %r12, %r12
	movq 40(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	movq %rsi, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 40(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 32(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 40(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	adcq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 32(%rdi), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	adcq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 16(%rdi), %r12
	addq %r12, %r12
	movq 24(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rdi)
	movq %rsi, 24(%rdi)
	movq 16(%rdi), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rdi), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 16(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rdi), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rcx)
	adcq $0, %rsi
	movq %rsi, 24(%rcx)
	movq 32(%r8), %rax
	mulq 24(%rcx)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%r8), %rax
	mulq 16(%rcx)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rcx), %rax
	mulq 32(%r8)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%r8), %rax
	mulq 24(%rcx)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rcx)
	adcq $0, %rsi
	movq %rsi, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rcx), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 48(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rcx), %rax
	mulq 24(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rcx)
	adcq $0, %rsi
	movq %rsi, 56(%rcx)
	movq (%rdi), %r12
	subq 48(%rdi), %r12
	movq 8(%rdi), %rsi
	sbbq 56(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 16(%rdi)
	sbbq $0, %rsi
	movq %rsi, 24(%rdi)
	movq 64(%rdi), %rax
	mulq 72(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 64(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 64(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rdi), %rax
	mulq 72(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rdi)
	adcq $0, %rsi
	movq %rsi, 72(%rdi)
	movq 32(%rdi), %r12
	addq %r12, %r12
	movq 40(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 112(%rdi)
	movq %rsi, 120(%rdi)
	subq 16(%rdi), %r12
	sbbq 24(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 112(%rdi)
	sbbq $0, %rsi
	movq %rsi, 120(%rdi)
	subq (%rdi), %r12
	sbbq 8(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 112(%rdi)
	sbbq $0, %rsi
	movq %rsi, 120(%rdi)
	movq 112(%rdi), %rax
	mulq 8(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 120(%rdi), %rax
	mulq (%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%r8), %rax
	mulq 112(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 120(%rdi), %rax
	mulq 8(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 112(%rdi)
	adcq $0, %rsi
	movq %rsi, 120(%rdi)
	addq 64(%rdi), %r12
	adcq 72(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 112(%rdi)
	adcq $0, %rsi
	movq %rsi, 120(%rdi)
	movq 32(%rcx), %r12
	addq %r12, %r12
	movq 40(%rcx), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rdi)
	movq %rsi, 72(%rdi)
	movq 112(%rdi), %r12
	addq 64(%rdi), %r12
	movq 120(%rdi), %rsi
	adcq 72(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 112(%rdi)
	adcq $0, %rsi
	movq %rsi, 120(%rdi)
	movq 80(%rdi), %r12
	addq 32(%rcx), %r12
	movq 88(%rdi), %rsi
	adcq 40(%rcx), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rcx)
	adcq $0, %rsi
	movq %rsi, 40(%rcx)
	movq 80(%rdi), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 24(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 16(%rdi), %r12
	addq %r12, %r12
	movq 24(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rcx)
	movq %rsi, 8(%rcx)
	subq 32(%rdi), %r12
	sbbq 40(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, (%rcx)
	sbbq $0, %rsi
	movq %rsi, 8(%rcx)
	subq 16(%rdi), %r12
	sbbq 24(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 16(%rdi)
	sbbq $0, %rsi
	movq %rsi, 24(%rdi)
	movq 48(%rdi), %r12
	subq (%rcx), %r12
	movq 56(%rdi), %rsi
	sbbq 8(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 48(%rdi), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 24(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 48(%rdi), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
	movq 16(%rcx), %rax
	mulq 72(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rcx), %rax
	mulq 64(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%r8), %rax
	mulq 16(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rcx), %rax
	mulq 72(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rcx)
	adcq $0, %rsi
	movq %rsi, 72(%rcx)
	movq (%rdi), %r12
	subq (%rcx), %r12
	movq 8(%rdi), %rsi
	sbbq 8(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, (%rdi)
	sbbq $0, %rsi
	movq %rsi, 8(%rdi)
	movq (%rcx), %rax
	mulq 72(%rcx)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rcx), %rax
	mulq 64(%rcx)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%rcx), %rax
	mulq (%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rcx), %rax
	mulq 72(%rcx)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rcx)
	adcq $0, %rsi
	movq %rsi, 8(%rcx)
	movq 112(%rdi), %rax
	mulq 24(%rcx)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 120(%rdi), %rax
	mulq 16(%rcx)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rcx), %rax
	mulq 112(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 120(%rdi), %rax
	mulq 24(%rcx)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rcx)
	adcq $0, %rsi
	movq %rsi, 24(%rcx)
	movq 32(%rcx), %r12
	subq 112(%rdi), %r12
	movq 40(%rcx), %rsi
	sbbq 120(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 32(%rcx)
	sbbq $0, %rsi
	movq %rsi, 40(%rcx)
	movq 32(%rcx), %rax
	mulq 104(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rcx), %rax
	mulq 96(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%rdi), %rax
	mulq 32(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rcx), %rax
	mulq 104(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rcx)
	adcq $0, %rsi
	movq %rsi, 40(%rcx)
	movq 48(%rdi), %r12
	subq 32(%rcx), %r12
	movq 56(%rdi), %rsi
	sbbq 40(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 32(%rcx)
	sbbq $0, %rsi
	movq %rsi, 40(%rcx)
	movq 48(%rcx), %rax
	mulq 104(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rcx), %rax
	mulq 96(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%rdi), %rax
	mulq 48(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rcx), %rax
	mulq 104(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 48(%rcx)
	adcq $0, %rsi
	movq %rsi, 56(%rcx)
	movq (%rdi), %rax
	mulq 120(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 112(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 112(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
	mulq 120(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	subq 80(%rdi), %r12
	sbbq 88(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, (%rdi)
	sbbq $0, %rsi
	movq %rsi, 8(%rdi)
	subq 48(%rcx), %r12
	sbbq 56(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 48(%rcx)
	sbbq $0, %rsi
	movq %rsi, 56(%rcx)
	movq 64(%rcx), %rax
	mulq 104(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 72(%rcx), %rax
	mulq 96(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%rdi), %rax
	mulq 64(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rcx), %rax
	mulq 104(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rcx)
	adcq $0, %rsi
	movq %rsi, 72(%rcx)
	popq %r12
ret
