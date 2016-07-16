//Huseyin Hisil, 2012.

// For each function, the inputs must be in reduced form [0, 2^128 - c).
// If so, the output is guaranteed to be in reduced form [0, 2^128 - c).

.text

.globl fp_cpy_2e128mc_x8664_asm
fp_cpy_2e128mc_x8664_asm:
	movq 8*1(%rcx), %r9
	movq 8*0(%rcx), %r8
	movq %r9, 8*1(%rdi)
	movq %r8, 8*0(%rdi)
ret

.globl fp_st1_2e128mc_x8664_asm
fp_st1_2e128mc_x8664_asm:
	movq %rcx, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_neg_2e128mc_x8664_asm
fp_neg_2e128mc_x8664_asm:
	movq $0, %r10
	subq 8*0(%rcx), %r10
	movq $0, %r11
	sbbq 8*1(%rcx), %r11
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 8*0(%rdi)
	sbbq $0, %r11
	movq %r11, 8*1(%rdi)
ret

.globl fp_sub_2e128mc_x8664_asm
fp_sub_2e128mc_x8664_asm:
	movq 8*0(%rcx), %r10
	subq 8*0(%r8), %r10
	movq 8*1(%rcx), %r11
	sbbq 8*1(%r8), %r11
	movq $0, %rdx
	cmovc %rsi, %rdx
	subq %rdx, %r10
	movq %r10, 8*0(%rdi)
	sbbq $0, %r11
	movq %r11, 8*1(%rdi)
ret

.globl fp_mul_2e128mc_x8664_asm
fp_mul_2e128mc_x8664_asm:
	push %r12

	movq 8*0(%rcx), %rax
	mulq 8*0(%r8)
	movq %rax, %r12
	movq 8*1(%rcx), %rax
	movq %rdx, %r9

	mulq 8*1(%r8)
	movq %rax, %r10
	movq 8*0(%rcx), %rax
	movq %rdx, %r11

	mulq 8*1(%r8)
	addq %rax, %r9
	adcq %rdx, %r10
	movq 8*1(%rcx), %rax
	adcq $0, %r11

	mulq 8*0(%r8)
	addq %rax, %r9
	adcq %rdx, %r10
	adcq $0, %r11

	movq %r11, %rax
	mulq %rsi
	addq %rax, %r9
	movq %rdx, %r11
	adcq $0, %r11

	movq %r10, %rax
	mulq %rsi
	addq %rax, %r12
	adcq %rdx, %r9
	adcq $0, %r11

	movq %r11, %rax
	mulq %rsi
	addq %rax, %r12
	adcq %rdx, %r9

	// This final reduction happens extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11

	addq %r11, %r12
	movq %r12, 8*0(%rdi)
	adcq $0, %r9
	movq %r9, 8*1(%rdi)

	pop %r12
ret

.globl fp_sqr_2e128mc_x8664_asm
fp_sqr_2e128mc_x8664_asm:
	movq 8*0(%rcx), %rax
	mulq 8*0(%rcx)
	movq %rax, %r8
	movq 8*1(%rcx), %rax
	movq %rdx, %r9

	mulq 8*1(%rcx)
	movq %rax, %r10
	movq 8*0(%rcx), %rax
	movq %rdx, %r11

	mulq 8*1(%rcx)
	addq %rax, %r9
	adcq %rdx, %r10
	adcq $0, %r11
	addq %rax, %r9
	adcq %rdx, %r10
	adcq $0, %r11

	movq %r11, %rax
	mulq %rsi
	addq %rax, %r9
	movq %rdx, %r11
	adcq $0, %r11

	movq %r10, %rax
	mulq %rsi
	addq %rax, %r8
	adcq %rdx, %r9
	adcq $0, %r11

	movq %r11, %rax
	mulq %rsi
	addq %rax, %r8
	adcq %rdx, %r9

	// This final reduction happens extremely rarely.
	movq $0, %r11
	cmovc %rsi, %r11

	addq %r11, %r8
	movq %r8, 8*0(%rdi)
	adcq $0, %r9
	movq %r9, 8*1(%rdi)
ret
