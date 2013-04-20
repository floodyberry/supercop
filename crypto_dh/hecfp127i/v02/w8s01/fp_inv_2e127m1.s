//Huseyin Hisil, 2012.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl fp_inv_2e127m1_x8664_asm
fp_inv_2e127m1_x8664_asm:
	pushq %r12
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
	movq 16(%rdi), %rax
	mulq 8(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rdi), %rax
	mulq (%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%r8), %rax
	mulq 16(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rdi), %rax
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
	movq 16(%rdi), %rax
	mulq 24(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 16(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 16(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rdi), %rax
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
	movq %r12, 32(%rdi)
	adcq $0, %rsi
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
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
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
	movq %r12, 32(%rdi)
	adcq $0, %rsi
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
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
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
	movq 48(%rdi), %rax
	mulq 40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq 32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%rdi), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
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
	movq %r12, 48(%rdi)
	adcq $0, %rsi
	movq %rsi, 56(%rdi)
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
	movq %r12, 64(%rdi)
	adcq $0, %rsi
	movq %rsi, 72(%rdi)
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
	movq %r12, 64(%rdi)
	adcq $0, %rsi
	movq %rsi, 72(%rdi)
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
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq 80(%rdi), %rax
	mulq 72(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq 64(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%rdi), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
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
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 80(%rdi), %rax
	mulq 88(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 88(%rdi)
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 88(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 80(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 80(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
	mulq 88(%rdi)
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 88(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 80(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 80(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
	mulq 88(%rdi)
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 72(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 64(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 64(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 48(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq (%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%r8), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq (%rdi), %rax
	mulq 8(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq (%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%r8), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
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
	movq %r12, (%rcx)
	adcq $0, %rsi
	movq %rsi, 8(%rcx)
	popq %r12
ret
