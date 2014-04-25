.text
.globl types_cond_copy
.globl types_cond_copy1
.globl types_cond_copy2
.globl types_cond_save

types_cond_copy:
	mov 0(%rdi), %r8
	mov 8(%rdi), %r9
	mov 16(%rdi), %r10
	mov 24(%rdi), %r11

 	cmp $1, %rdx
	cmove 0(%rsi), %r8
	cmove 8(%rsi), %r9
	cmove 16(%rsi), %r10
	cmove 24(%rsi), %r11

	mov %r8, 0(%rdi)
	mov %r9, 8(%rdi)
	mov %r10, 16(%rdi)
	mov %r11, 24(%rdi)
	ret

types_cond_copy1:
	mov 0(%rsi), %r8
	mov 8(%rsi), %r9
	mov 16(%rsi), %r10
	mov 24(%rsi), %r11

.irp i, 1, 2, 3, 4, 5, 6, 7
 	cmp $\i, %rdx
	cmove 8*(4*\i+0)(%rsi), %r8
	cmove 8*(4*\i+1)(%rsi), %r9
	cmove 8*(4*\i+2)(%rsi), %r10
	cmove 8*(4*\i+3)(%rsi), %r11
.endr

	mov %r8, 0(%rdi)
	mov %r9, 8(%rdi)
	mov %r10, 16(%rdi)
	mov %r11, 24(%rdi)
	ret

types_cond_copy2:
	push	%r12
	push	%r13
	push	%r14
	push	%r15

	mov	%r8, %rax
	mov 0(%rdx), %r8
	mov 8(%rdx), %r9
	mov 16(%rdx), %r10
	mov 24(%rdx), %r11
	mov %r8, %r12
	mov %r9, %r13
	mov %r10, %r14
	mov %r11, %r15

.irp i, 1, 2, 3, 4, 5, 6, 7
 	cmp $\i, %rcx
	cmove 8*(4*\i+0)(%rdx), %r8
	cmove 8*(4*\i+1)(%rdx), %r9
	cmove 8*(4*\i+2)(%rdx), %r10
	cmove 8*(4*\i+3)(%rdx), %r11
 	cmp $\i, %rax
	cmove 8*(4*\i+0)(%rdx), %r12
	cmove 8*(4*\i+1)(%rdx), %r13
	cmove 8*(4*\i+2)(%rdx), %r14
	cmove 8*(4*\i+3)(%rdx), %r15
.endr

	mov %r8, 0(%rdi)
	mov %r9, 8(%rdi)
	mov %r10, 16(%rdi)
	mov %r11, 24(%rdi)
	mov %r12, 0(%rsi)
	mov %r13, 8(%rsi)
	mov %r14, 16(%rsi)
	mov %r15, 24(%rsi)

	pop		%r15
	pop		%r14
	pop		%r13
	pop		%r12
	ret

types_cond_save:
	mov 0(%rsi), %r8
	mov 8(%rsi), %r9
	mov 16(%rsi), %r10
	mov 24(%rsi), %r11

.irp i, 0, 1, 2, 3, 4, 5, 6, 7
 	cmp $\i, %rdx
	mov 8*(4*\i+0)(%rdi), %rax
	mov 8*(4*\i+1)(%rdi), %rcx
	cmove %r8, %rax
	cmove %r9, %rcx
	mov %rax, 8*(4*\i+0)(%rdi)
	mov %rcx, 8*(4*\i+1)(%rdi)
	mov 8*(4*\i+2)(%rdi), %rax
	mov 8*(4*\i+3)(%rdi), %rcx
	cmove %r10, %rax
	cmove %r11, %rcx
	mov %rax, 8*(4*\i+2)(%rdi)
	mov %rcx, 8*(4*\i+3)(%rdi)
.endr
	ret

