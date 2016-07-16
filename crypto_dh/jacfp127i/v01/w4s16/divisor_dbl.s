//Huseyin Hisil, 2014.


.text
.globl hec_fp_dbl_2e127m1_g2i_jac_x8664_asm
hec_fp_dbl_2e127m1_g2i_jac_x8664_asm:
	pushq %r12
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
	movq %r12, 8*0+8*32(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*32(%rdi)
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
	movq %r12, 8*0+8*34(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*34(%rdi)
	movq 8*0+8*32(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*32(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*32(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 8*0+8*36(%rdi), %rax
	mulq 8*1+8*84(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*36(%rdi), %rax
	mulq 8*0+8*84(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*84(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*36(%rdi), %rax
	mulq 8*1+8*84(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*38(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	movq 16(%rdi), %r12
	addq %r12, %r12
	movq 24(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*40(%rdi)
	movq %rsi, 8*1+8*40(%rdi)
	subq 8*0+8*34(%rdi), %r12
	sbbq 8*1+8*34(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	addq 8*0+8*40(%rdi), %r12
	adcq 8*1+8*40(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	movq 8*0+8*32(%rdi), %rax
	mulq 8*1+8*86(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*32(%rdi), %rax
	mulq 8*0+8*86(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*86(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*32(%rdi), %rax
	mulq 8*1+8*86(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*46(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	addq (%rdi), %r12
	adcq 8(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*48(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*48(%rdi)
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
	movq %r12, 8*0+8*50(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*50(%rdi)
	movq 8*0+8*48(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*48(%rdi), %rax
	mulq 8*0+8*38(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*38(%rdi), %rax
	mulq 8*0+8*48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*48(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*52(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*52(%rdi)
	movq (%rdi), %rax
	mulq 8*1+8*44(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 8*0+8*44(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*44(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
	mulq 8*1+8*44(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*54(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*54(%rdi)
	subq 8*0+8*52(%rdi), %r12
	sbbq 8*1+8*52(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*56(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*56(%rdi)
	movq 8*0+8*56(%rdi), %rax
	mulq 104(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*56(%rdi), %rax
	mulq 96(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%rdi), %rax
	mulq 8*0+8*56(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*56(%rdi), %rax
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
	movq %r12, 8*0+8*58(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*58(%rdi)
	subq 8*0+8*50(%rdi), %r12
	sbbq 8*1+8*50(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*60(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*60(%rdi)
	movq 8*0+8*34(%rdi), %r12
	addq %r12, %r12
	movq 8*1+8*34(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*62(%rdi)
	movq %rsi, 8*1+8*62(%rdi)
	subq 8*0+8*42(%rdi), %r12
	sbbq 8*1+8*42(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*32(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*32(%rdi)
	addq 8*0+8*38(%rdi), %r12
	adcq 8*1+8*38(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*34(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*34(%rdi)
	movq 8*0+8*34(%rdi), %rax
	mulq 104(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*34(%rdi), %rax
	mulq 96(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%rdi), %rax
	mulq 8*0+8*34(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*34(%rdi), %rax
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
	movq %r12, 8*0+8*36(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 32(%rdi), %rax
	mulq 8(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq (%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rdi), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
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
	movq %r12, 8*0+8*38(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	subq 48(%rdi), %r12
	sbbq 56(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*40(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*40(%rdi)
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
	movq %r12, 8*0+8*42(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	movq 32(%rdi), %rax
	mulq 8*1+8*60(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 8*0+8*60(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*60(%rdi), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 8*1+8*60(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	movq 48(%rdi), %rax
	mulq 8*1+8*36(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*36(%rdi), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 8*1+8*36(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*46(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	subq 8*0+8*44(%rdi), %r12
	sbbq 8*1+8*44(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*48(%rdi)
	movq 8*0+8*42(%rdi), %rax
	mulq 40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*42(%rdi), %rax
	mulq 32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 32(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*42(%rdi), %rax
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
	movq %r12, 8*0+8*50(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*50(%rdi)
	movq 8*0+8*40(%rdi), %rax
	mulq 56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*40(%rdi), %rax
	mulq 48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 48(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*40(%rdi), %rax
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
	movq %r12, 8*0+8*52(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*52(%rdi)
	subq 8*0+8*50(%rdi), %r12
	sbbq 8*1+8*50(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*54(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*54(%rdi)
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*56(%rdi)
	movq %rsi, 8*1+8*56(%rdi)
	movq 8*0+8*40(%rdi), %rax
	mulq 8*1+8*60(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*40(%rdi), %rax
	mulq 8*0+8*60(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*60(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*40(%rdi), %rax
	mulq 8*1+8*60(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*58(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*58(%rdi)
	movq 8*0+8*42(%rdi), %rax
	mulq 8*1+8*36(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*42(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*36(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*42(%rdi), %rax
	mulq 8*1+8*36(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*60(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*60(%rdi)
	subq 8*0+8*58(%rdi), %r12
	sbbq 8*1+8*58(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*62(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*62(%rdi)
	movq 8*0+8*48(%rdi), %rax
	mulq 8*1+8*48(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*48(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*48(%rdi), %rax
	mulq 8*1+8*48(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*32(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*32(%rdi)
	movq 8*0+8*32(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*32(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*32(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*34(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*34(%rdi)
	movq 64(%rdi), %rax
	mulq 8*1+8*48(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 72(%rdi), %rax
	mulq 8*0+8*48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*48(%rdi), %rax
	mulq 64(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rdi), %rax
	mulq 8*1+8*48(%rdi)
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
	movq 8*0+8*48(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*48(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*32(%rdi), %rax
	mulq 8*0+8*48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*48(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 80(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rdi), %rax
	mulq 8*0+8*56(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*56(%rdi), %rax
	mulq 80(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rdi), %rax
	mulq 8*1+8*56(%rdi)
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
	movq 8*0+8*36(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*36(%rdi), %rax
	mulq 8*0+8*56(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*56(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*36(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*38(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	movq (%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*32(%rdi), %rax
	mulq (%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*40(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*40(%rdi)
	movq 16(%rdi), %rax
	mulq 8*1+8*34(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rdi), %rax
	mulq 8*0+8*34(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*34(%rdi), %rax
	mulq 16(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rdi), %rax
	mulq 8*1+8*34(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
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
	movq %r12, 96(%rdi)
	adcq $0, %rsi
	movq %rsi, 104(%rdi)
	movq 48(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*32(%rdi), %rax
	mulq 48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	movq 96(%rdi), %rax
	mulq 8*1+8*40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 104(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*40(%rdi), %rax
	mulq 96(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rdi), %rax
	mulq 8*1+8*40(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*46(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	movq 8*0+8*44(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*44(%rdi), %rax
	mulq 8*0+8*38(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*38(%rdi), %rax
	mulq 8*0+8*44(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*44(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*50(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*50(%rdi)
	movq 8*0+8*62(%rdi), %rax
	mulq 8*1+8*48(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*62(%rdi), %rax
	mulq 8*0+8*48(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*48(%rdi), %rax
	mulq 8*0+8*62(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*62(%rdi), %rax
	mulq 8*1+8*48(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*52(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*52(%rdi)
	subq 96(%rdi), %r12
	sbbq 104(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*54(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*54(%rdi)
	addq 8*0+8*52(%rdi), %r12
	adcq 8*1+8*52(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rdi)
	adcq $0, %rsi
	movq %rsi, 8(%rdi)
	subq 8*0+8*40(%rdi), %r12
	sbbq 8*1+8*40(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*56(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*56(%rdi)
	movq 32(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rdi), %rax
	mulq 8*0+8*38(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*38(%rdi), %rax
	mulq 32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*58(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*58(%rdi)
	subq 8*0+8*46(%rdi), %r12
	sbbq 8*1+8*46(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*60(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*60(%rdi)
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*32(%rdi)
	movq %rsi, 8*1+8*32(%rdi)
	movq 8*0+8*52(%rdi), %rax
	mulq 8*1+8*52(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*52(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*52(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*52(%rdi), %rax
	mulq 8*1+8*52(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*62(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*62(%rdi)
	subq 8*0+8*32(%rdi), %r12
	sbbq 8*1+8*32(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 16(%rdi)
	sbbq $0, %rsi
	movq %rsi, 24(%rdi)
	subq 8*0+8*42(%rdi), %r12
	sbbq 8*1+8*42(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*34(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*34(%rdi)
	addq 8*0+8*58(%rdi), %r12
	adcq 8*1+8*58(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 8*0+8*54(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*54(%rdi), %rax
	mulq 8*0+8*56(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*56(%rdi), %rax
	mulq 8*0+8*54(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*54(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*38(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	subq 8*0+8*36(%rdi), %r12
	sbbq 8*1+8*36(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 32(%rdi)
	sbbq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 8*0+8*34(%rdi), %rax
	mulq 8*1+8*52(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*34(%rdi), %rax
	mulq 8*0+8*52(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*52(%rdi), %rax
	mulq 8*0+8*34(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*34(%rdi), %rax
	mulq 8*1+8*52(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*40(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*40(%rdi)
	addq 8*0+8*50(%rdi), %r12
	adcq 8*1+8*50(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	movq 16(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rdi), %rax
	mulq 8*0+8*56(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*56(%rdi), %rax
	mulq 16(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rdi), %rax
	mulq 8*1+8*56(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	subq 8*0+8*42(%rdi), %r12
	sbbq 8*1+8*42(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 56(%rdi)
	popq %r12
ret
