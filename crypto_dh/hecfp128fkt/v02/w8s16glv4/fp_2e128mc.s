//Huseyin Hisil, 2012.

// For each function, the inputs must be in reduced form [0, 2^128 - c).
// If so, the output is guaranteed to be in reduced form [0, 2^128 - c).

.text

.globl fp_cpy_2e128mc_x8664
fp_cpy_2e128mc_x8664:
	movq 8*1(%rsi), %r9
	movq 8*0(%rsi), %r8
	movq %r9, 8*1(%rdi)
	movq %r8, 8*0(%rdi)
ret

.globl fp_set_1_2e128mc_x8664
fp_set_1_2e128mc_x8664:
	movq %rsi, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_add_1_2e128mc_x8664
fp_add_1_2e128mc_x8664:
	movq %rsi, %r8
	movq $0, %r10
	addq %rcx, %r8
	movq $0, %r9
	adcq $0, %r9
	addq 8*0(%rdx), %r8
	adcq 8*1(%rdx), %r9
	cmovnc %rsi, %r10
	subq %r10, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_sub_2_2e128mc_x8664
fp_sub_2_2e128mc_x8664:
	movq %rdx, %r8
	movq $0, %r10
	subq 8*0(%rcx), %r8
	movq $0, %r9
	sbbq 8*1(%rcx), %r9
	cmovc %rsi, %r10
	subq %r10, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_dv2_2e128mc_x8664
fp_dv2_2e128mc_x8664:
	movq $0, %r10
	movq $0x8000000000000000, %r11
	movq 8*1(%rdx), %r9
	shrq $1, %r9
	movq 8*0(%rdx), %r8
	rcrq $1, %r8
	cmovnc %r10, %r11
	cmovc %rsi, %r10
	sbbq %r10, %r8
	movq %r8, 8*0(%rdi)
	sbbq %r11, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_ml2_2e128mc_x8664
fp_ml2_2e128mc_x8664:
	movq %rsi, %r8
	addq 8*0(%rdx), %r8
	movq $0, %r9
	adcq 8*1(%rdx), %r9
	movq $0, %r10
	addq 8*0(%rdx), %r8
	adcq 8*1(%rdx), %r9
	cmovnc %rsi, %r10
	subq %r10, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_add_2e128mc_x8664
fp_add_2e128mc_x8664:
	movq %rsi, %r8
	addq 8*0(%rcx), %r8
	movq $0, %r9
	adcq 8*1(%rcx), %r9
	movq $0, %r10
	addq 8*0(%rdx), %r8
	adcq 8*1(%rdx), %r9
	cmovnc %rsi, %r10
	subq %r10, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_sub_2e128mc_x8664
fp_sub_2e128mc_x8664:
	movq 8*0(%rdx), %r8
	movq $0, %r10
	subq 8*0(%rcx), %r8
	movq 8*1(%rdx), %r9
	sbbq 8*1(%rcx), %r9
	cmovc %rsi, %r10
	subq %r10, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_mld_2e128mc_x8664
fp_mld_2e128mc_x8664:
	push %r12
	push %r13

	movq 8*0(%r8), %rax
	mulq %rcx
	movq %rax, %r12
	movq %rdx, %rdi

	movq 8*1(%r8), %rax
	mulq %rcx
	addq %rdi, %rax
	movq %rax, %r13
	adcq $0x0, %rdx

	movq %rsi, %rax
	mulq %rdx
	addq %rax, %r12
	adcq $0x0, %r13
	mov $0x0, %cl
	adc $0x0, %cl

	movq %r12, %r10
	addq %rsi, %r12
	movq %r13, %r11
	adcq $0x0, %r13
	adc $0x1, %cl
	shr $0x2, %cl

	cmovnc %r10, %r12
	movq %r12, 8*0(%rdi)
	cmovnc %r11, %r13
	movq %r13, 8*1(%rdi)

	pop %r13
	pop %r12
ret

.globl fp_mul_2e128mc_x8664
fp_mul_2e128mc_x8664:
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

.globl fp_sqr_2e128mc_x8664
fp_sqr_2e128mc_x8664:
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


