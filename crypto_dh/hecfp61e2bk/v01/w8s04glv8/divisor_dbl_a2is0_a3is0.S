//Huseyin Hisil, 2013.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0_x8664_asm
hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0_x8664_asm:
	pushq %r12
	pushq %rbx
	pushq %r13
	movq $0x1FFFFFFFFFFFFFFF, %rsi
	movq 16(%r8), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%r8), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%r8), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%r8), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 64(%r8), %rax
	shlq $3, %rax
	mulq 72(%r8)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 64(%r8), %r10
	addq 72(%r8), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 64(%r8), %rax
	subq 72(%r8), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, (%rdi)
	movq %r11, 8(%rdi)
	movq (%r8), %rax
	shlq $3, %rax
	mulq 8(%r8)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq (%r8), %r10
	addq 8(%r8), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq (%r8), %rax
	subq 8(%r8), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 16(%rdi)
	movq %r11, 24(%rdi)
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq 16(%rcx), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rdi)
	movq 24(%rcx), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %rax
	addq 48(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rdi)
	movq 40(%rdi), %r11
	addq 56(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 72(%rdi)
	movq 64(%rdi), %rax
	shlq $3, %rax
	mulq 8(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%rdi), %rax
	shlq $3, %rax
	mulq (%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%rdi), %rax
	shlq $3, %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%rdi), %rax
	shlq $3, %rax
	mulq (%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rdi)
	movq %r11, 72(%rdi)
	movq 32(%r8), %rax
	shlq $3, %rax
	mulq 40(%r8)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 32(%r8), %r10
	addq 40(%r8), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 32(%r8), %rax
	subq 40(%r8), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 64(%rdi), %rax
	subq 80(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 80(%rdi)
	movq 72(%rdi), %r11
	subq 88(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 88(%rdi)
	movq 16(%rdi), %rax
	subq 48(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rdi)
	movq 24(%rdi), %r11
	subq 56(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rdi)
	addq 32(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rdi)
	addq 40(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 56(%rdi)
	movq 48(%r8), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%r8), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%r8), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%r8), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rcx)
	movq %r11, 56(%rcx)
	movq (%r8), %rax
	shlq $3, %rax
	mulq 40(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%r8), %rax
	shlq $3, %rax
	mulq 32(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%r8), %rax
	shlq $3, %rax
	mulq 40(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%r8), %rax
	shlq $3, %rax
	mulq 32(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rdi)
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 24(%rdi)
	movq (%rdi), %rax
	addq 48(%rcx), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rdi)
	movq 8(%rdi), %r11
	addq 56(%rcx), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 8(%rdi)
	movq 16(%rdi), %rax
	subq 48(%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 16(%rdi)
	movq 24(%rdi), %r11
	subq 56(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 24(%rdi)
	movq 32(%rdi), %rax
	addq 16(%rcx), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	movq 40(%rdi), %r11
	addq 24(%rcx), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq 32(%r8), %rax
	shlq $3, %rax
	mulq 40(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%r8), %rax
	shlq $3, %rax
	mulq 32(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%r8), %rax
	shlq $3, %rax
	mulq 40(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%r8), %rax
	shlq $3, %rax
	mulq 32(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rdi)
	movq %r11, 72(%rdi)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 64(%rdi), %rax
	subq 96(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 64(%rdi)
	movq 72(%rdi), %r11
	subq 104(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 72(%rdi)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 40(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 32(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 40(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 32(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 8(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq (%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq (%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rdi)
	movq %r11, 56(%rdi)
	subq 80(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rdi)
	subq 88(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rdi)
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 40(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 32(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 40(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 32(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	movq %r11, 40(%rdi)
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	movq 32(%rdi), %rax
	subq (%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 32(%rdi)
	movq 40(%rdi), %r11
	subq 8(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 40(%rdi)
	movq 64(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%rdi), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%rdi), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rdi)
	movq %r11, 24(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 48(%rdi), %r10
	addq 56(%rdi), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 48(%rdi), %rax
	subq 56(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 8(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq (%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq (%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 32(%rdi), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	movq 40(%rdi), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 40(%rdi)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 32(%rdi), %r10
	addq 40(%rdi), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 32(%rdi), %rax
	subq 40(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 32(%rdi)
	movq %r11, 40(%rdi)
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	movq %r11, 40(%rdi)
	movq 16(%rdi), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rdi)
	movq 24(%rdi), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 24(%rdi)
	movq 16(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 32(%r8), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%r8), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%r8), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%r8), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rcx)
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rcx)
	movq %r11, 56(%rcx)
	movq (%rdi), %rax
	subq 48(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 16(%rdi)
	movq 8(%rdi), %r11
	subq 56(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 24(%rdi)
	movq 64(%rdi), %rax
	shlq $3, %rax
	mulq 72(%rdi)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 64(%rdi), %r10
	addq 72(%rdi), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 64(%rdi), %rax
	subq 72(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 64(%rdi)
	movq %r11, 72(%rdi)
	movq 32(%rdi), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 112(%rdi)
	movq 40(%rdi), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 120(%rdi)
	subq 16(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 112(%rdi)
	subq 24(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 120(%rdi)
	subq (%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 112(%rdi)
	subq 8(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 120(%rdi)
	movq 112(%rdi), %rax
	shlq $3, %rax
	mulq 8(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 120(%rdi), %rax
	shlq $3, %rax
	mulq (%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 120(%rdi), %rax
	shlq $3, %rax
	mulq 8(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 112(%rdi), %rax
	shlq $3, %rax
	mulq (%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 112(%rdi)
	movq %r11, 120(%rdi)
	addq 64(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 112(%rdi)
	addq 72(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 120(%rdi)
	movq 32(%rcx), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rdi)
	movq 40(%rcx), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 72(%rdi)
	movq 112(%rdi), %rax
	addq 64(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 112(%rdi)
	movq 120(%rdi), %r11
	addq 72(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 120(%rdi)
	movq 80(%rdi), %rax
	addq 32(%rcx), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rcx)
	movq 88(%rdi), %r11
	addq 40(%rcx), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rcx)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 80(%rdi)
	movq %r11, 88(%rdi)
	movq 16(%rdi), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rcx)
	movq 24(%rdi), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 8(%rcx)
	subq 32(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rcx)
	subq 40(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rcx)
	subq 16(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 16(%rdi)
	subq 24(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 24(%rdi)
	movq 48(%rdi), %rax
	subq (%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rdi)
	movq 56(%rdi), %r11
	subq 8(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rdi)
	movq %r11, 56(%rdi)
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 64(%r8)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rcx)
	movq %r11, 72(%rcx)
	movq (%rdi), %rax
	subq (%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rdi)
	movq 8(%rdi), %r11
	subq 8(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rdi)
	movq (%rcx), %rax
	shlq $3, %rax
	mulq 72(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 64(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 72(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rcx), %rax
	shlq $3, %rax
	mulq 64(%rcx)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rcx)
	movq %r11, 8(%rcx)
	movq 112(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 120(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 120(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 112(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	subq 112(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 32(%rcx)
	movq 40(%rcx), %r11
	subq 120(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 40(%rcx)
	movq 32(%rcx), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	shlq $3, %rax
	mulq 96(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rcx), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rcx), %rax
	shlq $3, %rax
	mulq 96(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rcx)
	movq %r11, 40(%rcx)
	movq 48(%rdi), %rax
	subq 32(%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 32(%rcx)
	movq 56(%rdi), %r11
	subq 40(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 40(%rcx)
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 96(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq 96(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rcx)
	movq %r11, 56(%rcx)
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	subq 80(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rdi)
	subq 88(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rdi)
	subq 48(%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rcx)
	subq 56(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rcx)
	movq 64(%rcx), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%rcx), %rax
	shlq $3, %rax
	mulq 96(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%rcx), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%rcx), %rax
	shlq $3, %rax
	mulq 96(%rdi)
	subq %r10, %rax
	sbbq %rbx, %rdx
	sbbq $0, %rdx
	andq %rsi, %rdx
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rcx)
	movq %r11, 72(%rcx)
	popq %r13
	popq %rbx
	popq %r12
ret
