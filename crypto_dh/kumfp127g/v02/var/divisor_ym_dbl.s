//Huseyin Hisil, 2012.

//If you would like to see a fully annotated version of this code please donate.
//All donations will be spent on my student's conference expenses.

.text
.globl kum_fp_dbl_2e127m1_g_ym_x8664_asm
kum_fp_dbl_2e127m1_g_ym_x8664_asm:
	pushq %rbx
	pushq %r13
	pushq %r12
	movq (%rcx), %r12
	subq 16(%rcx), %r12
	movq 8(%rcx), %rsi
	sbbq 24(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	sbbq $0, %rsi
	movq (%rcx), %rdx
	adcq 16(%rcx), %rdx
	movq 8(%rcx), %r13
	adcq 24(%rcx), %r13
	btrq $63, %r13
	adcq $0, %rdx
	adcq $0, %r13
	movq 32(%rcx), %r10
	adcq 48(%rcx), %r10
	movq 40(%rcx), %r11
	adcq 56(%rcx), %r11
	btrq $63, %r11
	adcq $0, %r10
	adcq $0, %r11
	movq %r12, %rbx
	adcq %r10, %rbx
	movq %rsi, %rax
	adcq %r11, %rax
	btrq $63, %rax
	adcq $0, %rbx
	movq %rbx, (%rcx)
	adcq $0, %rax
	movq %rax, 8(%rcx)
	movq 32(%rcx), %rbx
	subq 48(%rcx), %rbx
	movq 40(%rcx), %rax
	sbbq 56(%rcx), %rax
	btrq $63, %rax
	sbbq $0, %rbx
	sbbq $0, %rax
	subq %r12, %r10
	sbbq %rsi, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 16(%rcx)
	sbbq $0, %r11
	movq %r11, 24(%rcx)
	movq %rdx, %r12
	adcq %rbx, %r12
	movq %r13, %rsi
	adcq %rax, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rcx)
	adcq $0, %rsi
	movq %rsi, 40(%rcx)
	subq %rbx, %rdx
	sbbq %rax, %r13
	btrq $63, %r13
	sbbq $0, %rdx
	movq %rdx, 48(%rcx)
	sbbq $0, %r13
	movq %r13, 56(%rcx)
	movq (%rcx), %rax
	mulq 8(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rcx), %rax
	mulq 8(%rcx)
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
	movq 16(%rcx), %rax
	mulq 24(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 16(%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 16(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rcx), %rax
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
	movq 32(%rcx), %rax
	mulq 40(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 32(%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 32(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rcx), %rax
	mulq 40(%rcx)
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
	mulq 56(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 48(%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 48(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rcx), %rax
	mulq 56(%rcx)
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
	movq 16(%rcx), %r12
	addq %r12, %r12
	movq 24(%rcx), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	adcq 16(%rcx), %r12
	adcq 24(%rcx), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rcx)
	adcq $0, %rsi
	movq %rsi, 24(%rcx)
	movq 32(%rcx), %rax
	mulq 24(%r9)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rcx), %rax
	mulq 16(%r9)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%r9), %rax
	mulq 32(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rcx), %rax
	mulq 24(%r9)
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
	mulq 40(%r9)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rcx), %rax
	mulq 32(%r9)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%r9), %rax
	mulq 48(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rcx), %rax
	mulq 40(%r9)
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
	movq (%rcx), %r12
	subq 16(%rcx), %r12
	movq 8(%rcx), %rsi
	sbbq 24(%rcx), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	sbbq $0, %rsi
	movq (%rcx), %rdx
	adcq 16(%rcx), %rdx
	movq 8(%rcx), %r13
	adcq 24(%rcx), %r13
	btrq $63, %r13
	adcq $0, %rdx
	adcq $0, %r13
	movq 32(%rcx), %r10
	adcq 48(%rcx), %r10
	movq 40(%rcx), %r11
	adcq 56(%rcx), %r11
	btrq $63, %r11
	adcq $0, %r10
	adcq $0, %r11
	movq %r12, %rbx
	adcq %r10, %rbx
	movq %rsi, %rax
	adcq %r11, %rax
	btrq $63, %rax
	adcq $0, %rbx
	movq %rbx, (%rcx)
	adcq $0, %rax
	movq %rax, 8(%rcx)
	movq 32(%rcx), %rbx
	subq 48(%rcx), %rbx
	movq 40(%rcx), %rax
	sbbq 56(%rcx), %rax
	btrq $63, %rax
	sbbq $0, %rbx
	sbbq $0, %rax
	subq %r12, %r10
	sbbq %rsi, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 16(%rcx)
	sbbq $0, %r11
	movq %r11, 24(%rcx)
	movq %rdx, %r12
	adcq %rbx, %r12
	movq %r13, %rsi
	adcq %rax, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rcx)
	adcq $0, %rsi
	movq %rsi, 40(%rcx)
	subq %rbx, %rdx
	sbbq %rax, %r13
	btrq $63, %r13
	sbbq $0, %rdx
	movq %rdx, 48(%rcx)
	sbbq $0, %r13
	movq %r13, 56(%rcx)
	movq (%rcx), %rax
	mulq 8(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rcx), %rax
	mulq 8(%rcx)
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
	/The previous 2 movq instructions can be safely removed.
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rcx)
	movq %rsi, 8(%rcx)
	movq 16(%rcx), %rax
	mulq 24(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 16(%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 16(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rcx), %rax
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
	movq 32(%rcx), %rax
	mulq 40(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 32(%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 32(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rcx), %rax
	mulq 40(%rcx)
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
	mulq 56(%rcx)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 48(%rcx), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 48(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rcx), %rax
	mulq 56(%rcx)
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
	movq 32(%rcx), %rax
	mulq 88(%r9)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rcx), %rax
	mulq 80(%r9)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 80(%r9), %rax
	mulq 32(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rcx), %rax
	mulq 88(%r9)
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
	mulq 104(%r9)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rcx), %rax
	mulq 96(%r9)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%r9), %rax
	mulq 48(%rcx)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rcx), %rax
	mulq 104(%r9)
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
	popq %r12
	popq %r13
	popq %rbx
ret
