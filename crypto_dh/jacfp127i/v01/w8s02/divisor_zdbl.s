//Huseyin Hisil, 2014.


.text
.globl hec_fp_zdbl_2e127m1_g2i_jac_x8664_asm
hec_fp_zdbl_2e127m1_g2i_jac_x8664_asm:
	pushq %r12
	pushq %rbp
	movq %rsi, %rbp
	movq 64(%rbp), %rax
	mulq 72(%rbp)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 64(%rbp), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 64(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rbp), %rax
	mulq 72(%rbp)
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
	movq (%rbp), %rax
	mulq 8(%rbp)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq (%rbp), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq (%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rbp), %rax
	mulq 8(%rbp)
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
	movq 8*0+8*86(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*86(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*32(%rdi), %rax
	mulq 8*0+8*86(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*86(%rdi), %rax
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
	addq (%rbp), %r12
	adcq 8(%rbp), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*38(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	movq 16(%rbp), %r12
	addq %r12, %r12
	movq 24(%rbp), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*40(%rdi)
	movq %rsi, 8*1+8*40(%rdi)
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	movq %rsi, 8*1+8*36(%rdi)
	subq 8*0+8*34(%rdi), %r12
	sbbq 8*1+8*34(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
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
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	movq (%rbp), %rax
	mulq 8*1+8*42(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rbp), %rax
	mulq 8*0+8*42(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*42(%rdi), %rax
	mulq (%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rbp), %rax
	mulq 8*1+8*42(%rdi)
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
	mulq 8*1+8*84(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*44(%rdi), %rax
	mulq 8*0+8*84(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*84(%rdi), %rax
	mulq 8*0+8*44(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*44(%rdi), %rax
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
	movq %r12, 8*0+8*32(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*32(%rdi)
	movq 8*0+8*38(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*38(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*32(%rdi), %rax
	mulq 8*0+8*38(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*38(%rdi), %rax
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
	subq 8*0+8*46(%rdi), %r12
	sbbq 8*1+8*46(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	movq 8*0+8*34(%rdi), %r12
	addq %r12, %r12
	movq 8*1+8*34(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	adcq 8*0+8*34(%rdi), %r12
	adcq 8*1+8*34(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	movq 96(%rbp), %rax
	mulq 8*1+8*42(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 104(%rbp), %rax
	mulq 8*0+8*42(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*42(%rdi), %rax
	mulq 96(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rbp), %rax
	mulq 8*1+8*42(%rdi)
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
	movq 8*0+8*40(%rdi), %r12
	subq 8*0+8*44(%rdi), %r12
	movq 8*1+8*40(%rdi), %rsi
	sbbq 8*1+8*44(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*46(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	subq 8*0+8*32(%rdi), %r12
	sbbq 8*1+8*32(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 32(%rbp), %rax
	mulq 40(%rbp)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 32(%rbp), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 32(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rbp), %rax
	mulq 40(%rbp)
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
	addq 8*0+8*38(%rdi), %r12
	adcq 8*1+8*38(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*40(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*40(%rdi)
	movq 32(%rbp), %r12
	addq %r12, %r12
	movq 40(%rbp), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*32(%rdi)
	movq %rsi, 8*1+8*32(%rdi)
	movq 48(%rbp), %r12
	addq %r12, %r12
	movq 56(%rbp), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*34(%rdi)
	movq %rsi, 8*1+8*34(%rdi)
	movq 96(%rbp), %rax
	mulq 8*1+8*36(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 104(%rbp), %rax
	mulq 8*0+8*36(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*36(%rdi), %rax
	mulq 96(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 104(%rbp), %rax
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
	movq %r12, 8*0+8*42(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	movq 8*0+8*32(%rdi), %rax
	mulq 8(%rbp)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*32(%rdi), %rax
	mulq (%rbp)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq (%rbp), %rax
	mulq 8*0+8*32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*32(%rdi), %rax
	mulq 8(%rbp)
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
	subq 8*0+8*34(%rdi), %r12
	sbbq 8*1+8*34(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 8*0+8*32(%rdi), %rax
	mulq 24(%rbp)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*32(%rdi), %rax
	mulq 16(%rbp)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 16(%rbp), %rax
	mulq 8*0+8*32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*32(%rdi), %rax
	mulq 24(%rbp)
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
	movq 8*0+8*44(%rdi), %rax
	mulq 8*1+8*42(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*44(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*42(%rdi), %rax
	mulq 8*0+8*44(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*44(%rdi), %rax
	mulq 8*1+8*42(%rdi)
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
	movq 8*0+8*36(%rdi), %rax
	mulq 8*1+8*40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*36(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*40(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*36(%rdi), %rax
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
	movq %r12, 8*0+8*38(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	subq 8*0+8*46(%rdi), %r12
	sbbq 8*1+8*46(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*48(%rdi)
	movq 8*0+8*44(%rdi), %rax
	mulq 8*1+8*32(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*44(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*32(%rdi), %rax
	mulq 8*0+8*44(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*44(%rdi), %rax
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
	movq %r12, 8*0+8*50(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*50(%rdi)
	movq 8*0+8*36(%rdi), %rax
	mulq 8*1+8*34(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*36(%rdi), %rax
	mulq 8*0+8*34(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*34(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*36(%rdi), %rax
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
	movq %r12, 8*0+8*46(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	subq 8*0+8*50(%rdi), %r12
	sbbq 8*1+8*50(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*38(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*38(%rdi)
	movq 8*0+8*42(%rdi), %rax
	mulq 8*1+8*34(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*42(%rdi), %rax
	mulq 8*0+8*34(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*34(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*42(%rdi), %rax
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
	movq %r12, 8*0+8*46(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	movq 8*0+8*32(%rdi), %rax
	mulq 8*1+8*40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*32(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*40(%rdi), %rax
	mulq 8*0+8*32(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*32(%rdi), %rax
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
	movq %r12, 8*0+8*44(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	subq 8*0+8*46(%rdi), %r12
	sbbq 8*1+8*46(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*36(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*36(%rdi)
	movq 8*0+8*36(%rdi), %rax
	mulq 8*1+8*36(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*36(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*36(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*36(%rdi), %rax
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
	movq %r12, 8*0+8*42(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	movq 80(%rbp), %rax
	mulq 8*1+8*38(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 88(%rbp), %rax
	mulq 8*0+8*38(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*38(%rdi), %rax
	mulq 80(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rbp), %rax
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
	movq %r12, 80(%rbp)
	adcq $0, %rsi
	movq %rsi, 88(%rbp)
	movq %r12, 80(%rdi)
	movq %rsi, 88(%rdi)
	movq 8*0+8*42(%rdi), %rax
	mulq 8*1+8*42(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*42(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*42(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*42(%rdi), %rax
	mulq 8*1+8*42(%rdi)
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
	movq 64(%rbp), %rax
	mulq 8*1+8*36(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 72(%rbp), %rax
	mulq 8*0+8*36(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*36(%rdi), %rax
	mulq 64(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 72(%rbp), %rax
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
	movq %r12, 64(%rbp)
	adcq $0, %rsi
	movq %rsi, 72(%rbp)
	movq %r12, 64(%rdi)
	movq %rsi, 72(%rdi)
	movq 80(%rbp), %rax
	mulq 88(%rbp)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 80(%rbp), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 80(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 88(%rbp), %rax
	mulq 88(%rbp)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 96(%rbp)
	adcq $0, %rsi
	movq %rsi, 104(%rbp)
	movq %r12, 96(%rdi)
	movq %rsi, 104(%rdi)
	movq 8*0+8*36(%rdi), %rax
	mulq 8*1+8*42(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*36(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*42(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*36(%rdi), %rax
	mulq 8*1+8*42(%rdi)
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
	movq 8*0+8*40(%rdi), %rax
	mulq 8*1+8*38(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*40(%rdi), %rax
	mulq 8*0+8*38(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*38(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*40(%rdi), %rax
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
	movq %r12, 8*0+8*46(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	movq (%rbp), %rax
	mulq 8*1+8*42(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8(%rbp), %rax
	mulq 8*0+8*42(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*42(%rdi), %rax
	mulq (%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8(%rbp), %rax
	mulq 8*1+8*42(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, (%rbp)
	adcq $0, %rsi
	movq %rsi, 8(%rbp)
	movq 16(%rbp), %rax
	mulq 8*1+8*34(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rbp), %rax
	mulq 8*0+8*34(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*34(%rdi), %rax
	mulq 16(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rbp), %rax
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
	movq %r12, 16(%rbp)
	adcq $0, %rsi
	movq %rsi, 24(%rbp)
	movq 32(%rbp), %rax
	mulq 8*1+8*46(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 40(%rbp), %rax
	mulq 8*0+8*46(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*46(%rdi), %rax
	mulq 32(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 40(%rbp), %rax
	mulq 8*1+8*46(%rdi)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %rsi
	adcq %rax, %r12
	adcq %rdx, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rbp)
	adcq $0, %rsi
	movq %rsi, 40(%rbp)
	movq 8*0+8*48(%rdi), %rax
	mulq 8*1+8*36(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*48(%rdi), %rax
	mulq 8*0+8*36(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*36(%rdi), %rax
	mulq 8*0+8*48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*48(%rdi), %rax
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
	movq %r12, 8*0+8*40(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*40(%rdi)
	movq 8*0+8*46(%rdi), %rax
	mulq 8*1+8*42(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*46(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*42(%rdi), %rax
	mulq 8*0+8*46(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*46(%rdi), %rax
	mulq 8*1+8*42(%rdi)
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
	movq 8*0+8*40(%rdi), %r12
	addq %r12, %r12
	movq 8*1+8*40(%rdi), %rsi
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*48(%rdi)
	movq %rsi, 8*1+8*48(%rdi)
	movq (%rbp), %r12
	movq 8(%rbp), %rsi
	movq %r12, 8*0+8*52(%rdi)
	movq %rsi, 8*1+8*52(%rdi)
	movq 8*0+8*48(%rdi), %r12
	subq 96(%rbp), %r12
	movq 8*1+8*48(%rdi), %rsi
	sbbq 104(%rbp), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, (%rdi)
	sbbq $0, %rsi
	movq %rsi, 8(%rdi)
	movq 48(%rbp), %rax
	mulq 8*1+8*34(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 56(%rbp), %rax
	mulq 8*0+8*34(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*34(%rdi), %rax
	mulq 48(%rbp)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 56(%rbp), %rax
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
	movq %r12, 48(%rbp)
	adcq $0, %rsi
	movq %rsi, 56(%rbp)
	movq 8*0+8*52(%rdi), %rax
	mulq 104(%rbp)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*52(%rdi), %rax
	mulq 96(%rbp)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 96(%rbp), %rax
	mulq 8*0+8*52(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*52(%rdi), %rax
	mulq 104(%rbp)
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
	subq 32(%rbp), %r12
	sbbq 40(%rbp), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	addq %r12, %r12
	adcq %rsi, %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 8*0+8*34(%rdi)
	movq %rsi, 8*1+8*34(%rdi)
	movq 8*0+8*40(%rdi), %rax
	mulq 8*1+8*40(%rdi)
	movq %rax, %rsi
	addq %rsi, %rsi
	movq 8*0+8*40(%rdi), %rax
	movq %rdx, %r10
	adcq %r10, %r10
	mulq 8*0+8*40(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*40(%rdi), %rax
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
	movq %r12, 8*0+8*48(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*48(%rdi)
	movq 16(%rbp), %r12
	movq 24(%rbp), %rsi
	movq %r12, 8*0+8*54(%rdi)
	movq %rsi, 8*1+8*54(%rdi)
	movq 8*0+8*48(%rdi), %r12
	addq 8*0+8*34(%rdi), %r12
	movq 8*1+8*48(%rdi), %rsi
	adcq 8*1+8*34(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 16(%rdi)
	adcq $0, %rsi
	movq %rsi, 24(%rdi)
	movq 8*0+8*52(%rdi), %r12
	subq (%rdi), %r12
	movq 8*1+8*52(%rdi), %rsi
	sbbq 8(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*46(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*46(%rdi)
	movq 8*0+8*54(%rdi), %r12
	subq 16(%rdi), %r12
	movq 8*1+8*54(%rdi), %rsi
	sbbq 24(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*42(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*42(%rdi)
	movq 8*0+8*40(%rdi), %r12
	subq (%rdi), %r12
	movq 8*1+8*40(%rdi), %rsi
	sbbq 8(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*48(%rdi)
	movq 8*0+8*48(%rdi), %rax
	mulq 8*1+8*46(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*48(%rdi), %rax
	mulq 8*0+8*46(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*46(%rdi), %rax
	mulq 8*0+8*48(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*48(%rdi), %rax
	mulq 8*1+8*46(%rdi)
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
	subq 32(%rbp), %r12
	sbbq 40(%rbp), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*44(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*44(%rdi)
	addq 8*0+8*42(%rdi), %r12
	adcq 8*1+8*42(%rdi), %rsi
	btrq $63, %rsi
	adcq $0, %r12
	movq %r12, 32(%rdi)
	adcq $0, %rsi
	movq %rsi, 40(%rdi)
	movq 16(%rdi), %rax
	mulq 8*1+8*46(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 24(%rdi), %rax
	mulq 8*0+8*46(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*46(%rdi), %rax
	mulq 16(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 24(%rdi), %rax
	mulq 8*1+8*46(%rdi)
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
	movq 8*0+8*42(%rdi), %rax
	mulq 8*1+8*40(%rdi)
	movq %rdx, %r10
	movq %rax, %rsi
	movq 8*1+8*42(%rdi), %rax
	mulq 8*0+8*40(%rdi)
	addq %rax, %rsi
	adcq %rdx, %r10
	movq 8*0+8*40(%rdi), %rax
	mulq 8*0+8*42(%rdi)
	addq %rdx, %rsi
	movq %rax, %r12
	adcq $0, %r10
	movq 8*1+8*42(%rdi), %rax
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
	movq %r12, 8*0+8*48(%rdi)
	adcq $0, %rsi
	movq %rsi, 8*1+8*48(%rdi)
	subq 8*0+8*32(%rdi), %r12
	sbbq 8*1+8*32(%rdi), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 8*0+8*34(%rdi)
	sbbq $0, %rsi
	movq %rsi, 8*1+8*34(%rdi)
	subq 48(%rbp), %r12
	sbbq 56(%rbp), %rsi
	btrq $63, %rsi
	sbbq $0, %r12
	movq %r12, 48(%rdi)
	sbbq $0, %rsi
	movq %rsi, 56(%rdi)
	popq %rbp
	popq %r12
ret
