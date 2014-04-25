//Huseyin Hisil, 2013.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl hec_fp_madd_2e061m1e2_g2i_x8664_asm
hec_fp_madd_2e061m1e2_g2i_x8664_asm:
	pushq %r12
	pushq %rbx
	pushq %r13
	movq $0x1FFFFFFFFFFFFFFF, %rsi
	movq 48(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%r9), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%r9), %rax
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
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	movq 48(%r8), %rax
	subq (%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rcx)
	movq 56(%r8), %r11
	subq 8(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rcx)
	movq 32(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%r9), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%r9), %rax
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
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	addq 32(%r8), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 16(%rdi)
	addq 40(%r8), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 24(%rdi)
	movq (%rdi), %rax
	subq 32(%r8), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rdi)
	movq 8(%rdi), %r11
	subq 40(%r8), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rdi)
	movq (%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%r9), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%r9), %rax
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
	movq %rax, 32(%rcx)
	movq %r11, 40(%rcx)
	addq (%r8), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	addq 8(%r8), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq 16(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%r9), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%r9), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%r9), %rax
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
	movq 32(%rcx), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	shlq $3, %rax
	mulq 48(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rcx), %rax
	shlq $3, %rax
	mulq 56(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rcx), %rax
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
	movq (%r8), %rax
	shlq $3, %rax
	mulq 24(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%r8), %rax
	shlq $3, %rax
	mulq 16(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%r8), %rax
	shlq $3, %rax
	mulq 24(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%r8), %rax
	shlq $3, %rax
	mulq 16(%r8)
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
	subq 64(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 80(%rdi)
	subq 72(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 88(%rdi)
	movq 16(%r8), %rax
	subq 48(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 16(%rcx)
	movq 24(%r8), %r11
	subq 56(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 24(%rcx)
	movq 32(%rcx), %rax
	shlq $3, %rax
	mulq 40(%rcx)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 32(%rcx), %r10
	addq 40(%rcx), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 32(%rcx), %rax
	subq 40(%rcx), %rax
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
	movq %r10, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 32(%rcx), %rax
	subq (%r8), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rcx)
	movq 40(%rcx), %r11
	subq 8(%r8), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rcx)
	movq 64(%rdi), %rax
	subq 96(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 112(%rdi)
	movq 72(%rdi), %r11
	subq 104(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 120(%rdi)
	movq 64(%rdi), %rax
	addq 96(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 64(%rdi)
	movq 72(%rdi), %r11
	addq 104(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 72(%rdi)
	movq 64(%r8), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%r8), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%r8), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%r8), %rax
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
	movq %rax, 96(%rdi)
	movq %r11, 104(%rdi)
	addq 112(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 112(%rdi)
	addq 120(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 120(%rdi)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 8(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq (%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
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
	movq %rax, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 8(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq (%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 8(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
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
	movq %rax, (%rdi)
	movq %r11, 8(%rdi)
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
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
	movq %rax, 16(%rcx)
	movq %r11, 24(%rcx)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 8(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq (%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 8(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq (%rcx)
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
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq 8(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq (%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 8(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq (%rcx)
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
	movq 48(%rcx), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rcx), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rcx), %rax
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
	movq %rax, 112(%rdi)
	movq %r11, 120(%rdi)
	movq 96(%rdi), %rax
	subq 112(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 96(%rdi)
	movq 104(%rdi), %r11
	subq 120(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 104(%rdi)
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
	movq 16(%rcx), %rax
	subq 80(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 16(%rcx)
	movq 24(%rcx), %r11
	subq 88(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 24(%rcx)
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 16(%rcx), %r10
	addq 24(%rcx), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 16(%rcx), %rax
	subq 24(%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 112(%rdi)
	movq %r11, 120(%rdi)
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
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
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 80(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 80(%rdi)
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
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 80(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 80(%rdi)
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
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 40(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 32(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 40(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 32(%rcx)
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
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 72(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 64(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 72(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 64(%rdi)
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
	movq 96(%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 104(%rdi), %rax
	shlq $3, %rax
	mulq 80(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 104(%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 96(%rdi), %rax
	shlq $3, %rax
	mulq 80(%rdi)
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
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 80(%rdi), %r10
	addq 88(%rdi), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 80(%rdi), %rax
	subq 88(%rdi), %rax
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
	movq 96(%rdi), %rax
	shlq $3, %rax
	mulq 104(%rdi)
	addq %rax, %rax
	adcq %rdx, %rdx
	shrq $3, %rax
	btrq $61, %rdx
	adcq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r11
	movq 96(%rdi), %r10
	addq 104(%rdi), %r10
	btrq $61, %r10
	adcq $0, %r10
	shlq $3, %r10
	movq 96(%rdi), %rax
	subq 104(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	mulq %r10
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, %r10
	movq %r10, 96(%rdi)
	movq %r11, 104(%rdi)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 80(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 80(%rdi)
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
	mulq 88(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 80(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 80(%rdi)
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
	movq 48(%rcx), %rax
	addq %rax, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rcx)
	movq 56(%rcx), %r11
	addq %r11, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 8(%rcx)
	subq 112(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rcx)
	subq 120(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rcx)
	movq 16(%rcx), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 16(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 24(%rcx), %rax
	shlq $3, %rax
	mulq 24(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 16(%rcx), %rax
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
	movq %rax, 16(%rdi)
	movq %r11, 24(%rdi)
	movq 96(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 104(%rdi), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 104(%rdi), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 96(%rdi), %rax
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
	addq 16(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 96(%rdi)
	addq 24(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 104(%rdi)
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 40(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 32(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 40(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
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
	movq %rax, 16(%rdi)
	movq %r11, 24(%rdi)
	movq (%rcx), %rax
	subq 16(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, (%rcx)
	movq 8(%rcx), %r11
	subq 24(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 8(%rcx)
	subq 112(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 112(%rdi)
	subq 120(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 120(%rdi)
	movq 32(%rdi), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rdi), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rdi), %rax
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
	movq %rax, 32(%rdi)
	movq %r11, 40(%rdi)
	addq 64(%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rdi)
	addq 72(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rdi)
	movq $0x1000000000000000, %rbx
	movq $0, %r10
	shrq $1, %rax
	cmovc %rbx, %r10
	addq %r10, %rax
	movq %rax, 32(%rdi)
	movq $0, %r10
	shrq $1, %r11
	cmovc %rbx, %r10
	addq %r10, %r11
	movq %r11, 40(%rdi)
	movq 96(%rdi), %rax
	subq 32(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 96(%rdi)
	movq 104(%rdi), %r11
	subq 40(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 104(%rdi)
	movq 32(%rcx), %rax
	subq 48(%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 112(%rdi)
	movq 40(%rcx), %r11
	subq 56(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 120(%rdi)
	movq 48(%rcx), %rax
	subq (%rcx), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rcx)
	movq 56(%rcx), %r11
	subq 8(%rcx), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rcx)
	movq 96(%rdi), %rax
	subq 48(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 64(%rdi)
	movq 104(%rdi), %r11
	subq 56(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 72(%rdi)
	movq 32(%rcx), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 40(%rcx), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 40(%rcx), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 32(%rcx), %rax
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
	movq %rax, 32(%rcx)
	movq %r11, 40(%rcx)
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 72(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 64(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rdi), %rax
	shlq $3, %rax
	mulq 72(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rdi), %rax
	shlq $3, %rax
	mulq 64(%rdi)
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
	addq 32(%rcx), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, (%rdi)
	addq 40(%rcx), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 8(%rdi)
	movq (%rcx), %rax
	shlq $3, %rax
	mulq 56(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 48(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 56(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rcx), %rax
	shlq $3, %rax
	mulq 48(%rcx)
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
	addq (%rdi), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 32(%rcx)
	addq 8(%rdi), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 40(%rcx)
	movq 48(%rdi), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 112(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 56(%rdi), %rax
	shlq $3, %rax
	mulq 120(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 48(%rdi), %rax
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
	movq %rax, 48(%rdi)
	movq %r11, 56(%rdi)
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
	movq 48(%rdi), %rax
	addq 48(%rcx), %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 48(%rcx)
	movq 56(%rdi), %r11
	addq 56(%rcx), %r11
	btrq $61, %r11
	adcq $0, %r11
	movq %r11, 56(%rcx)
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 40(%r9)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 32(%r9)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 88(%rdi), %rax
	shlq $3, %rax
	mulq 40(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 80(%rdi), %rax
	shlq $3, %rax
	mulq 32(%r9)
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
	movq 32(%rcx), %rax
	subq 48(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 32(%rcx)
	movq 40(%rcx), %r11
	subq 56(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 40(%rcx)
	movq (%rcx), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 64(%r8)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 72(%r8)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rcx), %rax
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
	movq %rax, (%rcx)
	movq %r11, 8(%rcx)
	movq (%rcx), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 8(%rcx), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq (%rcx), %rax
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
	movq %rax, (%rcx)
	movq %r11, 8(%rcx)
	movq 96(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 104(%rdi), %rax
	shlq $3, %rax
	mulq 16(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 104(%rdi), %rax
	shlq $3, %rax
	mulq 24(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 96(%rdi), %rax
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
	movq 64(%r8), %rax
	shlq $3, %rax
	mulq 40(%rcx)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%r8), %rax
	shlq $3, %rax
	mulq 32(%rcx)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%r8), %rax
	shlq $3, %rax
	mulq 40(%rcx)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%r8), %rax
	shlq $3, %rax
	mulq 32(%rcx)
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
	movq 64(%r8), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%r8), %rax
	shlq $3, %rax
	mulq 80(%rdi)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%r8), %rax
	shlq $3, %rax
	mulq 88(%rdi)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%r8), %rax
	shlq $3, %rax
	mulq 80(%rdi)
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
	movq 64(%rcx), %rax
	shlq $3, %rax
	mulq 56(%r9)
	movq %rax, %r11
	movq %rdx, %rbx
	movq 72(%rcx), %rax
	shlq $3, %rax
	mulq 48(%r9)
	addq %rax, %r11
	adcq %rdx, %rbx
	shrq $3, %r11
	btrq $61, %rbx
	adcq %rbx, %r11
	btrq $61, %r11
	adcq $0, %r11
	movq 72(%rcx), %rax
	shlq $3, %rax
	mulq 56(%r9)
	movq %rax, %r10
	movq %rdx, %rbx
	movq 64(%rcx), %rax
	shlq $3, %rax
	mulq 48(%r9)
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
	movq 48(%rcx), %rax
	subq 96(%rdi), %rax
	sbbq $0, %rax
	andq %rsi, %rax
	movq %rax, 48(%rcx)
	movq 56(%rcx), %r11
	subq 104(%rdi), %r11
	sbbq $0, %r11
	andq %rsi, %r11
	movq %r11, 56(%rcx)
	popq %r13
	popq %rbx
	popq %r12
ret
