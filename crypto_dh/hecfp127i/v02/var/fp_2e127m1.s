//Huseyin Hisil, 2012.

.text

.globl fp_cpy_2e127m1_x8664
fp_cpy_2e127m1_x8664:
	movq 8*1(%rsi), %r9
	movq 8*0(%rsi), %r8
	movq %r9, 8*1(%rdi)
	movq %r8, 8*0(%rdi)
ret

.globl fp_set_1_2e127m1_x8664
fp_set_1_2e127m1_x8664:
	movq %rsi, 8*0(%rdi)
	movq $0, 8*1(%rdi)
ret

.globl fp_neg_2e127m1_x8664
fp_neg_2e127m1_x8664:
	movq $0, %r8
	subq 8*0(%rsi), %r8
	movq $0, %r9
	sbbq 8*1(%rsi), %r9
	btrq $63, %r9
	sbbq $0, %r8
	movq %r8, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_add_1_2e127m1_x8664
fp_add_1_2e127m1_x8664:
	stc
	adcq 8*0(%rsi), %rdx
	movq 8*1(%rsi), %r9
	adcq $0, %r9
	btrq $63, %r9
	cmc
	sbbq $0, %rdx
	movq %rdx, 8*0(%rdi)
	sbbq $0, %r9
	movq %r9, 8*1(%rdi)
ret

.globl fp_sub_1_2e127m1_x8664
fp_sub_1_2e127m1_x8664:
	movq 8*0(%rsi), %r8
	subq %rdx, %r8
	movq 8*1(%rsi), %r9
	sbbq $0, %r9
	btrq $63, %r9
	sbbq $0, %r8
	movq %r9, 8*1(%rdi)
	sbbq $0, %r9
	movq %r8, 8*0(%rdi)
ret

.globl fp_sub_2_2e127m1_x8664
fp_sub_2_2e127m1_x8664:
	movq %rsi, %r8
	subq 8*0(%rdx), %r8
	movq $0, %r9
	sbbq 8*1(%rdx), %r9
	btrq $63, %r9
	sbbq $0, %r8
	movq %r9, 8*1(%rdi)
	sbbq $0, %r9
	movq %r8, 8*0(%rdi)
ret

.globl fp_mul_2e127m1_x8664
fp_mul_2e127m1_x8664:
	movq 8*0+8*0(%rsi), %rax
	mulq 8*1+8*0(%rcx)
	movq %rdx, %r10
	movq %rax, %r9
	movq 8*1+8*0(%rsi), %rax
	mulq 8*0+8*0(%rcx)
	addq %rax, %r9
	adcq %rdx, %r10
	movq 8*0+8*0(%rcx), %rax
	mulq 8*0+8*0(%rsi)
	addq %rdx, %r9
	movq %rax, %r8
	adcq $0, %r10
	movq 8*1+8*0(%rsi), %rax
	mulq 8*1+8*0(%rcx)
	addq %r10, %rax
	adcq $0, %rdx
	addq %rax, %rax
	adcq %rdx, %rdx
	btrq $63, %r9
	adcq %rax, %r8
	adcq %rdx, %r9
	btrq $63, %r9
	adcq $0, %r8
	movq %r8, 8*0(%rdi)
	adcq $0, %r9
	movq %r9, 8*1(%rdi)
ret
