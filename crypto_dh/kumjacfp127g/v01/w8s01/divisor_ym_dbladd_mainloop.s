//Huseyin Hisil, 2014.


.text
.globl kum_fp_dbladd_2e127m1_g_ym_mainloop_x8664_asm
kum_fp_dbladd_2e127m1_g_ym_mainloop_x8664_asm:
	pushq %rbx
	pushq %r13
	pushq %r12
MAINLOOP:
	movq %rcx, %r10
	shrq $6, %r10
	movq (%r9,%r10,8), %r11
	btq  %rcx, %r11
	movq $0, %rax
	sbbq $0, %rax
	movq 8*24(%rdi), %rbx
	movq %rax, 8*24(%rdi)
	xorq %rax, %rbx
	movq 8*8(%rdi), %r12
	movq 8*9(%rdi), %r13
	xorq 8*16(%rdi), %r12
	xorq 8*17(%rdi), %r13
	andq %rbx, %r12
	andq %rbx, %r13
	xorq %r12, 8*8(%rdi)
	xorq %r13, 8*9(%rdi)
	xorq %r12, 8*16(%rdi)
	xorq %r13, 8*17(%rdi)
	movq 8*10(%rdi), %r12
	movq 8*11(%rdi), %r13
	xorq 8*18(%rdi), %r12
	xorq 8*19(%rdi), %r13
	andq %rbx, %r12
	andq %rbx, %r13
	xorq %r12, 8*10(%rdi)
	xorq %r13, 8*11(%rdi)
	xorq %r12, 8*18(%rdi)
	xorq %r13, 8*19(%rdi)
	movq 8*12(%rdi), %r12
	movq 8*13(%rdi), %r13
	xorq 8*20(%rdi), %r12
	xorq 8*21(%rdi), %r13
	andq %rbx, %r12
	andq %rbx, %r13
	xorq %r12, 8*12(%rdi)
	xorq %r13, 8*13(%rdi)
	xorq %r12, 8*20(%rdi)
	xorq %r13, 8*21(%rdi)
	movq 8*14(%rdi), %r12
	movq 8*15(%rdi), %r13
	xorq 8*22(%rdi), %r12
	xorq 8*23(%rdi), %r13
	andq %rbx, %r12
	andq %rbx, %r13
	xorq %r12, 8*14(%rdi)
	xorq %r13, 8*15(%rdi)
	xorq %r12, 8*22(%rdi)
	xorq %r13, 8*23(%rdi)
	movq 64(%rdi), %r12
	subq 80(%rdi), %r12
	movq 72(%rdi), %rsi
	sbbq 88(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	sbbq $0, %rsi
	movq 64(%rdi), %rdx
	adcq 80(%rdi), %rdx
	movq 72(%rdi), %r13
	adcq 88(%rdi), %r13
	btrq $63, %r13
	adcq $0, %rdx
	adcq $0, %r13
	movq 96(%rdi), %r10
	adcq 112(%rdi), %r10
	movq 104(%rdi), %r11
	adcq 120(%rdi), %r11
	btrq $63, %r11
	adcq $0, %r10
	adcq $0, %r11
	movq %r12, %rbx
	adcq %r10, %rbx
	movq %rsi, %rax
	adcq %r11, %rax
	btrq $63, %rax
	adcq $0, %rbx
	movq %rbx, 64(%rdi)
	adcq $0, %rax
	movq %rax, 72(%rdi)
	movq 96(%rdi), %rbx
	subq 112(%rdi), %rbx
	movq 104(%rdi), %rax
	sbbq 120(%rdi), %rax
	btrq $63, %rax
	sbbq $0, %rbx
	sbbq $0, %rax
	subq %r12, %r10
	sbbq %rsi, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 80(%rdi)
	sbbq $0, %r11
	movq %r11, 88(%rdi)
	movq %rdx, %r12
	adcq %rbx, %r12
	movq %r13, %rsi
	adcq %rax, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	subq %rbx, %rdx
	sbbq %rax, %r13
	btrq $63, %r13
	sbbq $0, %rdx
	movq %rdx, 112(%rdi)
	sbbq $0, %r13
	movq %r13, 120(%rdi)
	movq 128(%rdi), %r12
	subq 144(%rdi), %r12
	movq 136(%rdi), %rsi
	sbbq 152(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	sbbq $0, %rsi
	movq 128(%rdi), %rdx
	adcq 144(%rdi), %rdx
	movq 136(%rdi), %r13
	adcq 152(%rdi), %r13
	btrq $63, %r13
	adcq $0, %rdx
	adcq $0, %r13
	movq 160(%rdi), %r10
	adcq 176(%rdi), %r10
	movq 168(%rdi), %r11
	adcq 184(%rdi), %r11
	btrq $63, %r11
	adcq $0, %r10
	adcq $0, %r11
	movq %r12, %rbx
	adcq %r10, %rbx
	movq %rsi, %rax
	adcq %r11, %rax
	btrq $63, %rax
	adcq $0, %rbx
	movq %rbx, 128(%rdi)
	adcq $0, %rax
	movq %rax, 136(%rdi)
	movq 160(%rdi), %rbx
	subq 176(%rdi), %rbx
	movq 168(%rdi), %rax
	sbbq 184(%rdi), %rax
	btrq $63, %rax
	sbbq $0, %rbx
	sbbq $0, %rax
	subq %r12, %r10
	sbbq %rsi, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 144(%rdi)
	sbbq $0, %r11
	movq %r11, 152(%rdi)
	movq %rdx, %r12
	adcq %rbx, %r12
	movq %r13, %rsi
	adcq %rax, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 160(%rdi)
	adcq $0, %rsi
	movq %rsi, 168(%rdi)
	subq %rbx, %rdx
	sbbq %rax, %r13
	btrq $63, %r13
	sbbq $0, %rdx
	movq %rdx, 176(%rdi)
	sbbq $0, %r13
	movq %r13, 184(%rdi)
	movq 80(%rdi), %r12
	addq %r12, %r12
	movq 88(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	adcq 80(%rdi), %r12
	adcq 88(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	movq 96(%rdi), %rax
	mulq 24(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 104(%rdi), %rax
	mulq 16(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%r8), %rax
	mulq 96(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rdi), %rax
	mulq 24(%r8)
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
	movq 112(%rdi), %rax
	mulq 40(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 120(%rdi), %rax
	mulq 32(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%r8), %rax
	mulq 112(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 120(%rdi), %rax
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
	movq 144(%rdi), %rax
	mulq 8(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 152(%rdi), %rax
	mulq (%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rdi), %rax
	mulq 144(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 152(%rdi), %rax
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
	movq %r12, 144(%rdi)
	adcq $0, %rsi
	movq %rsi, 152(%rdi)
	movq 160(%rdi), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 168(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 160(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 168(%rdi), %rax
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
	movq %r12, 160(%rdi)
	adcq $0, %rsi
	movq %rsi, 168(%rdi)
	movq 176(%rdi), %rax
	mulq 40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 184(%rdi), %rax
	mulq 32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%rdi), %rax
	mulq 176(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 184(%rdi), %rax
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
	movq %r12, 176(%rdi)
	adcq $0, %rsi
	movq %rsi, 184(%rdi)
	movq 64(%rdi), %rax
	mulq 136(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 72(%rdi), %rax
	mulq 128(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 128(%rdi), %rax
	mulq 64(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rdi), %rax
	mulq 136(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 128(%rdi)
	adcq $0, %rsi
	movq %rsi, 136(%rdi)
	subq 144(%rdi), %r12
	sbbq 152(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	sbbq $0, %rsi
	movq 128(%rdi), %rdx
	adcq 144(%rdi), %rdx
	movq 136(%rdi), %r13
	adcq 152(%rdi), %r13
	btrq $63, %r13
	adcq $0, %rdx
	adcq $0, %r13
	movq 160(%rdi), %r10
	adcq 176(%rdi), %r10
	movq 168(%rdi), %r11
	adcq 184(%rdi), %r11
	btrq $63, %r11
	adcq $0, %r10
	adcq $0, %r11
	movq %r12, %rbx
	adcq %r10, %rbx
	movq %rsi, %rax
	adcq %r11, %rax
	btrq $63, %rax
	adcq $0, %rbx
	movq %rbx, 128(%rdi)
	adcq $0, %rax
	movq %rax, 136(%rdi)
	movq 160(%rdi), %rbx
	subq 176(%rdi), %rbx
	movq 168(%rdi), %rax
	sbbq 184(%rdi), %rax
	btrq $63, %rax
	sbbq $0, %rbx
	sbbq $0, %rax
	subq %r12, %r10
	sbbq %rsi, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 144(%rdi)
	sbbq $0, %r11
	movq %r11, 152(%rdi)
	movq %rdx, %r12
	adcq %rbx, %r12
	movq %r13, %rsi
	adcq %rax, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 160(%rdi)
	adcq $0, %rsi
	movq %rsi, 168(%rdi)
	subq %rbx, %rdx
	sbbq %rax, %r13
	btrq $63, %r13
	sbbq $0, %rdx
	movq %rdx, 176(%rdi)
	sbbq $0, %r13
	movq %r13, 184(%rdi)
	movq 80(%rdi), %rax
	mulq 8(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq (%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rdi), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
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
	movq %r12, 80(%rdi)
	adcq $0, %rsi
	movq %rsi, 88(%rdi)
	movq 96(%rdi), %rax
	mulq 24(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 104(%rdi), %rax
	mulq 16(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rdi), %rax
	mulq 96(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rdi), %rax
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
	movq 112(%rdi), %rax
	mulq 40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 120(%rdi), %rax
	mulq 32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%rdi), %rax
	mulq 112(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 120(%rdi), %rax
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
	movq %r12, 112(%rdi)
	adcq $0, %rsi
	movq %rsi, 120(%rdi)
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
	subq 80(%rdi), %r12
	sbbq 88(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	sbbq $0, %rsi
	movq 64(%rdi), %rdx
	adcq 80(%rdi), %rdx
	movq 72(%rdi), %r13
	adcq 88(%rdi), %r13
	btrq $63, %r13
	adcq $0, %rdx
	adcq $0, %r13
	movq 96(%rdi), %r10
	adcq 112(%rdi), %r10
	movq 104(%rdi), %r11
	adcq 120(%rdi), %r11
	btrq $63, %r11
	adcq $0, %r10
	adcq $0, %r11
	movq %r12, %rbx
	adcq %r10, %rbx
	movq %rsi, %rax
	adcq %r11, %rax
	btrq $63, %rax
	adcq $0, %rbx
	movq %rbx, 64(%rdi)
	adcq $0, %rax
	movq %rax, 72(%rdi)
	movq 96(%rdi), %rbx
	subq 112(%rdi), %rbx
	movq 104(%rdi), %rax
	sbbq 120(%rdi), %rax
	btrq $63, %rax
	sbbq $0, %rbx
	sbbq $0, %rax
	subq %r12, %r10
	sbbq %rsi, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 80(%rdi)
	sbbq $0, %r11
	movq %r11, 88(%rdi)
	movq %rdx, %r12
	adcq %rbx, %r12
	movq %r13, %rsi
	adcq %rax, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	subq %rbx, %rdx
	sbbq %rax, %r13
	btrq $63, %r13
	sbbq $0, %rdx
	movq %rdx, 112(%rdi)
	sbbq $0, %r13
	movq %r13, 120(%rdi)
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
	adcq $0, %rsi
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 64(%rdi)
	movq %rsi, 72(%rdi)
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
	movq 96(%rdi), %rax
	mulq 104(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 96(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 96(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rdi), %rax
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
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	movq 128(%rdi), %rax
	mulq 136(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 128(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 128(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 136(%rdi), %rax
	mulq 136(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 128(%rdi)
	adcq $0, %rsi
	movq %rsi, 136(%rdi)
	movq 112(%rdi), %rax
	mulq 120(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 112(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 112(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 120(%rdi), %rax
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
	movq %r12, 112(%rdi)
	adcq $0, %rsi
	movq %rsi, 120(%rdi)
	movq 144(%rdi), %rax
	mulq 152(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 144(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 144(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 152(%rdi), %rax
	mulq 152(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 144(%rdi)
	adcq $0, %rsi
	movq %rsi, 152(%rdi)
	movq 160(%rdi), %rax
	mulq 168(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 160(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 160(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 168(%rdi), %rax
	mulq 168(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 160(%rdi)
	adcq $0, %rsi
	movq %rsi, 168(%rdi)
	movq 96(%rdi), %rax
	mulq 88(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 104(%rdi), %rax
	mulq 80(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 80(%r8), %rax
	mulq 96(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rdi), %rax
	mulq 88(%r8)
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
	movq 176(%rdi), %rax
	mulq 184(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 176(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 176(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 184(%rdi), %rax
	mulq 184(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 176(%rdi)
	adcq $0, %rsi
	movq %rsi, 184(%rdi)
	movq 112(%rdi), %rax
	mulq 104(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 120(%rdi), %rax
	mulq 96(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%r8), %rax
	mulq 112(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 120(%rdi), %rax
	mulq 104(%r8)
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
	movq 144(%rdi), %rax
	mulq 120(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 152(%rdi), %rax
	mulq 112(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 112(%r8), %rax
	mulq 144(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 152(%rdi), %rax
	mulq 120(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 144(%rdi)
	adcq $0, %rsi
	movq %rsi, 152(%rdi)
	movq 160(%rdi), %rax
	mulq 136(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 168(%rdi), %rax
	mulq 128(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 128(%r8), %rax
	mulq 160(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 168(%rdi), %rax
	mulq 136(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 160(%rdi)
	adcq $0, %rsi
	movq %rsi, 168(%rdi)
	movq 176(%rdi), %rax
	mulq 152(%r8)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 184(%rdi), %rax
	mulq 144(%r8)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 144(%r8), %rax
	mulq 176(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 184(%rdi), %rax
	mulq 152(%r8)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 176(%rdi)
	adcq $0, %rsi
	movq %rsi, 184(%rdi)
	decq %rcx
	cmp $-1, %rcx
	jne MAINLOOP
	popq %r12
	popq %r13
	popq %rbx
ret
