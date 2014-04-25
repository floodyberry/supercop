//Huseyin Hisil, 2013.

// For each function, the inputs must be in reduced form [0, 2^64 - c).
// If so, the output is guaranteed to be in reduced form [0, 2^64 - c).

.text

.globl fp_cpy_2e064mc_x8664_asm
fp_cpy_2e064mc_x8664_asm:
	movq 8*0(%rcx), %r10
	movq %r10, 8*0(%rdi)
ret

.globl fp_st1_2e064mc_x8664_asm
fp_st1_2e064mc_x8664_asm:
	movq %rcx, 8*0(%rdi)
ret

.globl fp_neg_2e064mc_x8664_asm
fp_neg_2e064mc_x8664_asm:
	movq $0, %r10
	subq 8*0(%rcx), %r10
	movq $0, %r11
	cmovc %rsi, %r11
	subq %r11, %r10
	movq %r10, 8*0(%rdi)
ret

.globl fp_add_2e064mc_x8664_asm
fp_add_2e064mc_x8664_asm:
	movq 8*0(%rcx), %r10
	addq %rsi, %r10
	addq 8*0(%r8), %r10
	movq $0, %r11
	cmovnc %rsi, %r11
	subq %r11, %r10
	movq %r10, 8*0(%rdi)
ret

.globl fp_mul_2e064mc_x8664_asm
fp_mul_2e064mc_x8664_asm:
	movq 8*0(%rcx), %rax
	mulq 8*0(%r8)
	movq %rax, %r10
	movq %rdx, %r11
	movq %r11, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	//This final reduction occurs extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11
	addq %r11, %r10
	movq %r10, 8*0(%rdi)
ret

.globl fp_sqr_2e064mc_x8664_asm
fp_sqr_2e064mc_x8664_asm:
	movq 8*0(%rcx), %rax
	mulq 8*0(%rcx)
	movq %rax, %r10
	movq %rdx, %r11
	movq %r11, %rax
	mulq %rsi
	addq %rax, %r10
	adcq $0, %rdx
	movq %rdx, %rax
	mulq %rsi
	addq %rax, %r10
	//This final reduction occurs extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11
	addq %r11, %r10
	movq %r10, 8*0(%rdi)
ret
