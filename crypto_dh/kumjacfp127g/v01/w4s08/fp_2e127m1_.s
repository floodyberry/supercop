//Huseyin Hisil, 2012.

// For each function, the inputs must be in reduced form [0, 2^127 - 1).
// If so, the output is guaranteed to be in reduced form [0, 2^127 - 1).

.text

.globl fp_dv2_2e127m1_x8664_asm
fp_dv2_2e127m1_x8664_asm:
	movq 8*0(%rcx), %r10
	movq 8*1(%rcx), %r11
	movq %r10, %rax
	shlq $63, %rax
	addq %rax, %r11
	rcrq $1, %r11
	rcrq $1, %r10
	movq %r10, 8*0(%rdi)
	movq %r11, 8*1(%rdi)
ret

.globl fp_ml2_2e127m1_x8664_asm
fp_ml2_2e127m1_x8664_asm:
	//May look like incomplete reduction but the result is always safely reduced!
	movq 8*0(%rcx), %r10
	addq %r10, %r10
	movq 8*1(%rcx), %r11
	adcq %r11, %r11
	btrq $63, %r11
	adcq $0, %r10
	movq %r10, 8*0(%rdi)
	//(2 times (63 bit) + 1) cannot produce a carry.
	//adcq $0, %r11
	movq %r11, 8*1(%rdi)
ret

.globl fp_ml3_2e127m1_x8664_asm
fp_ml3_2e127m1_x8664_asm:
	//May look like incomplete reduction but the result is always safely reduced!
	movq 8*0(%rcx), %r10
	addq %r10, %r10
	movq 8*1(%rcx), %r11
	adcq %r11, %r11
	btrq $63, %r11
	adcq $0, %r10
	//(2 times (63 bit) + 1) cannot produce a carry.
	//adcq $0, %r11

	stc
	adcq 8*0(%rcx), %r10
	adcq 8*1(%rcx), %r11
	btrq $63, %r11
	cmc
	sbbq $0, %r10
	movq %r10, 8*0(%rdi)
	sbbq $0, %r11
	movq %r11, 8*1(%rdi)
ret

.globl fp_ad1_2e127m1_x8664_asm
fp_ad1_2e127m1_x8664_asm:
	stc
	adcq 8*0(%rcx), %r8
	movq 8*1(%rcx), %r11
	adcq $0, %r11
	btrq $63, %r11
	cmc
	sbbq $0, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r11
	movq %r11, 8*1(%rdi)
ret


.globl fp_sub_2e127m1_x8664_asm
fp_sub_2e127m1_x8664_asm:
	movq 8*0(%rcx), %r10
	subq 8*0(%r8), %r10
	movq 8*1(%rcx), %r11
	sbbq 8*1(%r8), %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 8*0(%rdi)
	sbbq $0, %r11
	movq %r11, 8*1(%rdi)
ret



.globl fp_hdm_2e127m1_x8664_asm
fp_hdm_2e127m1_x8664_asm:
	//All of these pushs and pops are eliminated in GENERATED_ASM mode.
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15

	//n01:=X1+Y1;
	stc
	movq 8*0(%rdi), %r8
	adcq 8*0(%rsi), %r8
	movq 8*1(%rdi), %r9
	adcq 8*1(%rsi), %r9
	btrq $63, %r9
	cmc
	sbbq $0, %r8
	sbbq $0, %r9

	//n02:=Z1+T1;
	stc
	movq 8*0(%rdx), %r10
	adcq 8*0(%rcx), %r10
	movq 8*1(%rdx), %r11
	adcq 8*1(%rcx), %r11
	btrq $63, %r11
	cmc
	sbbq $0, %r10
	sbbq $0, %r11

	//n03:=X1-Y1;
	movq 8*0(%rdi), %r12
	subq 8*0(%rsi), %r12
	movq 8*1(%rdi), %r13
	sbbq 8*1(%rsi), %r13
	btrq $63, %r13
	sbbq $0, %r12
	sbbq $0, %r13

	//n04:=Z1-T1;
	movq 8*0(%rdx), %r14
	subq 8*0(%rcx), %r14
	movq 8*1(%rdx), %r15
	sbbq 8*1(%rcx), %r15
	btrq $63, %r15
	sbbq $0, %r14
	sbbq $0, %r15

	//X1:=n01+n02;
	stc
	movq %r8, %rax
	adcq %r10, %rax
	movq %r9, %rbx
	adcq %r11, %rbx
	btrq $63, %rbx
	cmc
	sbbq $0, %rax
	movq %rax, 8*0(%rdi)
	sbbq $0, %rbx
	movq %rbx, 8*1(%rdi)

	//Y1:=n01-n02;
	subq %r10, %r8
	sbbq %r11, %r9
	btrq $63, %r9
	sbbq $0, %r8
	movq %r8, 8*0(%rsi)
	sbbq $0, %r9
	movq %r9, 8*1(%rsi)

	//Z1:=n04+n03;
	stc
	movq %r12, %rax
	adcq %r14, %rax
	movq %r13, %rbx
	adcq %r15, %rbx
	btrq $63, %rbx
	cmc
	sbbq $0, %rax
	movq %rax, 8*0(%rdx)
	sbbq $0, %rbx
	movq %rbx, 8*1(%rdx)

	//T1:=n03-n04;
	subq %r14, %r12
	sbbq %r15, %r13
	btrq $63, %r13
	sbbq $0, %r12
	movq %r12, 8*0(%rcx)
	sbbq $0, %r13
	movq %r13, 8*1(%rcx)

	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
ret

.globl fp_hdy_2e127m1_x8664_asm
fp_hdy_2e127m1_x8664_asm:
	//All of these pushs and pops are eliminated in GENERATED_ASM mode.
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15

	//n01:=X1-(-Y1);
	movq 8*0(%rdi), %r8
	subq 8*0(%rsi), %r8
	movq 8*1(%rdi), %r9
	sbbq 8*1(%rsi), %r9
	btrq $63, %r9
	sbbq $0, %r8
	sbbq $0, %r9

	//n02:=Z1+T1;
	stc
	movq 8*0(%rdx), %r10
	adcq 8*0(%rcx), %r10
	movq 8*1(%rdx), %r11
	adcq 8*1(%rcx), %r11
	btrq $63, %r11
	cmc
	sbbq $0, %r10
	sbbq $0, %r11

	//n03:=X1-(Y1);
	stc
	movq 8*0(%rdi), %r12
	adcq 8*0(%rsi), %r12
	movq 8*1(%rdi), %r13
	adcq 8*1(%rsi), %r13
	btrq $63, %r13
	cmc
	sbbq $0, %r12
	sbbq $0, %r13

	//n04:=Z1-T1;
	movq 8*0(%rdx), %r14
	subq 8*0(%rcx), %r14
	movq 8*1(%rdx), %r15
	sbbq 8*1(%rcx), %r15
	btrq $63, %r15
	sbbq $0, %r14
	sbbq $0, %r15

	//X1:=n01+n02;
	stc
	movq %r8, %rax
	adcq %r10, %rax
	movq %r9, %rbx
	adcq %r11, %rbx
	btrq $63, %rbx
	cmc
	sbbq $0, %rax
	movq %rax, 8*0(%rdi)
	sbbq $0, %rbx
	movq %rbx, 8*1(%rdi)

	//-Y1:=n02-n01;
	subq %r8, %r10
	sbbq %r9, %r11
	btrq $63, %r11
	sbbq $0, %r10
	movq %r10, 8*0(%rsi)
	sbbq $0, %r11
	movq %r11, 8*1(%rsi)

	//Z1:=n04+n03;
	stc
	movq %r12, %rax
	adcq %r14, %rax
	movq %r13, %rbx
	adcq %r15, %rbx
	btrq $63, %rbx
	cmc
	sbbq $0, %rax
	movq %rax, 8*0(%rdx)
	sbbq $0, %rbx
	movq %rbx, 8*1(%rdx)

	//T1:=n03-n04;
	subq %r14, %r12
	sbbq %r15, %r13
	btrq $63, %r13
	sbbq $0, %r12
	movq %r12, 8*0(%rcx)
	sbbq $0, %r13
	movq %r13, 8*1(%rcx)

	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
ret

//.globl fp_mld_2e127m1_x8664_asm
//fp_mld_2e127m1_x8664_asm:
//	movq 8*0(%rcx), %rax
//	mulq %r8
//	movq %rax, %r10
//	movq %rdx, %r11
//
//	movq 8*1(%rcx), %rax
//	mulq %r8
//	addq %rax, %r11
//	adcq $0, %rdx
//
//	rclq $1, %r11
//	rclq $1, %rdx
//	shrq $1, %r11
//	addq %rdx, %r10
//	adcq $0, %r11
//
//	btrq $63, %r11
//	adcq $0, %r10
//	movq %r10, 8*0(%rdi)
//	adcq $0, %r11
//	movq %r11, 8*1(%rdi)
//ret
