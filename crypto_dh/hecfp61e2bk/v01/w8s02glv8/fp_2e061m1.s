//Huseyin Hisil, 2013.

// For each function, the inputs must be in reduced form [0, 2^61 - 1).
// If so, the output is guaranteed to be in reduced form [0, 2^61 - 1).

.text

.globl fp_cpy_2e061m1_x8664_asm
fp_cpy_2e061m1_x8664_asm:
	movq 8*0(%rcx), %r8
	movq %r8, 8*0(%rdi)
ret

.globl fp_st1_2e061m1_x8664_asm
fp_st1_2e061m1_x8664_asm:
	movq %rcx, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_neg_2e061m1_x8664_asm
fp_neg_2e061m1_x8664_asm:
	movq $0, %r10
	subq 8*0+8*0(%rcx), %r10
	shlq $2, %r10
	shrq $2, %r10
	btrq $61, %r10
	sbbq $0, %r10
	movq %r10, 8*0+8*0(%rdi)
ret

.globl fp_add_2e061m1_x8664_asm
fp_add_2e061m1_x8664_asm:
	stc
	movq 8*0+8*0(%rcx), %r10
	adcq 8*0+8*0(%r8), %r10
	shlq $2, %r10
	shrq $2, %r10
	btrq $61, %r10
	cmc
	sbbq $0, %r10
	movq %r10, 8*0+8*0(%rdi)
ret

.globl fp_mul_2e061m1_x8664_asm
fp_mul_2e061m1_x8664_asm:
	movq 8*0+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*0+8*0(%r8)
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 8*0+8*0(%rdi)
ret

.globl fp_sqr_2e061m1_x8664_asm
fp_sqr_2e061m1_x8664_asm:
	movq 8*0+8*0(%rcx), %rax
	shlq $3, %rax
	mulq 8*0+8*0(%rcx)
	shrq $3, %rax
	addq %rdx, %rax
	btrq $61, %rax
	adcq $0, %rax
	movq %rax, 8*0+8*0(%rdi)
ret
