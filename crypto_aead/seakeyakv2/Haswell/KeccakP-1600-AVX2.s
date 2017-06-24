	.file	"KeccakP-1600-AVX2.cpp"
	.text
	.p2align 4,,-1
	.globl	KeccakP1600_StaticInitialize
	.type	KeccakP1600_StaticInitialize, @function
KeccakP1600_StaticInitialize:
.LFB1142:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE1142:
	.size	KeccakP1600_StaticInitialize, .-KeccakP1600_StaticInitialize
	.p2align 4,,-1
	.globl	KeccakP1600_Initialize
	.type	KeccakP1600_Initialize, @function
KeccakP1600_Initialize:
.LFB1143:
	.cfi_startproc
	testb	$1, %dil
	movl	$224, %edx
	jne	.L29
	testb	$2, %dil
	jne	.L30
.L4:
	testb	$4, %dil
	jne	.L31
.L5:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	testb	$4, %dl
	rep stosq
	je	.L6
	movl	$0, (%rdi)
	addq	$4, %rdi
.L6:
	testb	$2, %dl
	je	.L7
	xorl	%eax, %eax
	addq	$2, %rdi
	movw	%ax, -2(%rdi)
.L7:
	andl	$1, %edx
	je	.L27
	movb	$0, (%rdi)
.L27:
	rep ret
	.p2align 4,,10
	.p2align 3
.L29:
	movb	$0, (%rdi)
	addq	$1, %rdi
	movb	$-33, %dl
	testb	$2, %dil
	je	.L4
	.p2align 4,,10
	.p2align 3
.L30:
	xorl	%ecx, %ecx
	addq	$2, %rdi
	subl	$2, %edx
	movw	%cx, -2(%rdi)
	testb	$4, %dil
	je	.L5
	.p2align 4,,10
	.p2align 3
.L31:
	movl	$0, (%rdi)
	subl	$4, %edx
	addq	$4, %rdi
	jmp	.L5
	.cfi_endproc
.LFE1143:
	.size	KeccakP1600_Initialize, .-KeccakP1600_Initialize
	.p2align 4,,-1
	.globl	KeccakP1600_ExtractBytes
	.type	KeccakP1600_ExtractBytes, @function
KeccakP1600_ExtractBytes:
.LFB1148:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r10
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$208, %rsp
	testq	%rdx, %rdx
	jne	.L33
	cmpq	$200, %rcx
	jnb	.L39
.L33:
	movl	$200, %eax
	cmpq	$200, %rcx
	movq	%rsp, %r8
	cmova	%rax, %rcx
	movq	%rsp, %rax
.L35:
	vmovdqa	(%rdi), %ymm0
	cmpq	%r8, %rax
	vmovdqu	%ymm0, (%rax)
	vmovdqa	32(%rdi), %ymm0
	vmovdqu	%ymm0, 40(%rax)
	vmovdqa	64(%rdi), %ymm0
	vmovdqu	%ymm0, 80(%rax)
	vmovdqa	96(%rdi), %ymm0
	vmovdqu	%ymm0, 120(%rax)
	vmovdqa	128(%rdi), %ymm0
	vmovdqu	%ymm0, 160(%rax)
	movq	160(%rdi), %r9
	movq	%r9, 32(%rax)
	movq	168(%rdi), %r9
	movq	%r9, 72(%rax)
	movq	176(%rdi), %r9
	movq	%r9, 112(%rax)
	movq	184(%rdi), %r9
	movq	%r9, 152(%rax)
	movq	192(%rdi), %r9
	movq	%r9, 192(%rax)
	je	.L40
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_restore_state
	movq	%rsi, %rax
	movq	%rsp, %r8
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	(%rax,%rdx), %rsi
	movq	%r10, %rdi
	movq	%rcx, %rdx
	vzeroupper
	call	memcpy
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1148:
	.size	KeccakP1600_ExtractBytes, .-KeccakP1600_ExtractBytes
	.p2align 4,,-1
	.globl	KeccakP1600_AddBytes
	.type	KeccakP1600_AddBytes, @function
KeccakP1600_AddBytes:
.LFB1145:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdx, %r15
	xorl	%edx, %edx
	pushq	%r14
	pushq	%r13
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%rdi, %r13
	pushq	%r12
	.cfi_offset 12, -48
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	andl	$7, %ecx
	shrq	$3, %rbx
	movq	%rcx, %r14
	movl	$200, %ecx
	andq	$-32, %rsp
	subq	$208, %rsp
	movq	%rsp, %rsi
	call	KeccakP1600_ExtractBytes
	testq	%rbx, %rbx
	leaq	(%rsp,%r15), %rdx
	jle	.L47
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%r12,%rax,8), %r8
	xorq	%r8, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L43
.L42:
	testq	%r14, %r14
	je	.L45
	salq	$3, %rbx
	xorl	%eax, %eax
	addq	%rbx, %rdx
	addq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L46:
	movzbl	(%r12,%rax), %r8d
	xorb	%r8b, (%rdx,%rax)
	addq	$1, %rax
	cmpq	%rax, %r14
	jg	.L46
.L45:
	vmovdqu	(%rsp), %ymm0
	vmovq	112(%rsp), %xmm2
	vmovdqa	%ymm0, 0(%r13)
	vmovdqu	40(%rsp), %ymm0
	vmovq	32(%rsp), %xmm3
	vmovdqa	%ymm0, 32(%r13)
	vpinsrq	$1, 72(%rsp), %xmm3, %xmm1
	vmovdqu	80(%rsp), %ymm0
	vmovdqa	%ymm0, 64(%r13)
	vmovdqu	120(%rsp), %ymm0
	vmovdqa	%ymm0, 96(%r13)
	vmovdqu	160(%rsp), %ymm0
	vmovdqa	%ymm0, 128(%r13)
	vpinsrq	$1, 152(%rsp), %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 160(%r13)
	vbroadcastsd	192(%rsp), %ymm0
	vmovdqa	%ymm0, 192(%r13)
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L47:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L42
	.cfi_endproc
.LFE1145:
	.size	KeccakP1600_AddBytes, .-KeccakP1600_AddBytes
	.p2align 4,,-1
	.globl	KeccakP1600_AddByte
	.type	KeccakP1600_AddByte, @function
KeccakP1600_AddByte:
.LFB1144:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, %ecx
	movb	%sil, 15(%rsp)
	leaq	15(%rsp), %rsi
	call	KeccakP1600_AddBytes
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1144:
	.size	KeccakP1600_AddByte, .-KeccakP1600_AddByte
	.p2align 4,,-1
	.globl	KeccakP1600_OverwriteBytes
	.type	KeccakP1600_OverwriteBytes, @function
KeccakP1600_OverwriteBytes:
.LFB1146:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdx, %r15
	xorl	%edx, %edx
	pushq	%r14
	pushq	%r13
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%rdi, %r13
	pushq	%r12
	.cfi_offset 12, -48
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	andl	$7, %ecx
	shrq	$3, %rbx
	movq	%rcx, %r14
	movl	$200, %ecx
	andq	$-32, %rsp
	subq	$208, %rsp
	movq	%rsp, %rsi
	call	KeccakP1600_ExtractBytes
	testq	%rbx, %rbx
	leaq	(%rsp,%r15), %rdx
	jle	.L59
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L55:
	movq	(%r12,%rax,8), %r8
	movq	%r8, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L55
.L54:
	testq	%r14, %r14
	je	.L57
	salq	$3, %rbx
	xorl	%eax, %eax
	addq	%rbx, %rdx
	addq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L58:
	movzbl	(%r12,%rax), %r8d
	movb	%r8b, (%rdx,%rax)
	addq	$1, %rax
	cmpq	%rax, %r14
	jg	.L58
.L57:
	vmovdqu	(%rsp), %ymm0
	vmovq	112(%rsp), %xmm2
	vmovdqa	%ymm0, 0(%r13)
	vmovdqu	40(%rsp), %ymm0
	vmovq	32(%rsp), %xmm3
	vmovdqa	%ymm0, 32(%r13)
	vpinsrq	$1, 72(%rsp), %xmm3, %xmm1
	vmovdqu	80(%rsp), %ymm0
	vmovdqa	%ymm0, 64(%r13)
	vmovdqu	120(%rsp), %ymm0
	vmovdqa	%ymm0, 96(%r13)
	vmovdqu	160(%rsp), %ymm0
	vmovdqa	%ymm0, 128(%r13)
	vpinsrq	$1, 152(%rsp), %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 160(%r13)
	vbroadcastsd	192(%rsp), %ymm0
	vmovdqa	%ymm0, 192(%r13)
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L59:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L54
	.cfi_endproc
.LFE1146:
	.size	KeccakP1600_OverwriteBytes, .-KeccakP1600_OverwriteBytes
	.p2align 4,,-1
	.globl	KeccakP1600_OverwriteWithZeroes
	.type	KeccakP1600_OverwriteWithZeroes, @function
KeccakP1600_OverwriteWithZeroes:
.LFB1147:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$200, %ecx
	xorl	%edx, %edx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$208, %rsp
	movq	%rsp, %rsi
	call	KeccakP1600_ExtractBytes
	movq	%r12, %rdx
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	memset
	vmovdqu	(%rsp), %ymm0
	vmovq	112(%rsp), %xmm2
	vmovdqa	%ymm0, (%rbx)
	vmovdqu	40(%rsp), %ymm0
	vmovq	32(%rsp), %xmm3
	vmovdqa	%ymm0, 32(%rbx)
	vpinsrq	$1, 72(%rsp), %xmm3, %xmm1
	vmovdqu	80(%rsp), %ymm0
	vmovdqa	%ymm0, 64(%rbx)
	vmovdqu	120(%rsp), %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	vmovdqu	160(%rsp), %ymm0
	vmovdqa	%ymm0, 128(%rbx)
	vpinsrq	$1, 152(%rsp), %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	vbroadcastsd	192(%rsp), %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vzeroupper
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1147:
	.size	KeccakP1600_OverwriteWithZeroes, .-KeccakP1600_OverwriteWithZeroes
	.p2align 4,,-1
	.globl	KeccakP1600_ExtractAndAddBytes
	.type	KeccakP1600_ExtractAndAddBytes, @function
KeccakP1600_ExtractAndAddBytes:
.LFB1149:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rcx, %r14
	movl	$200, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	xorl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r8, %rbx
	andl	$7, %r8d
	shrq	$3, %rbx
	movq	%r8, %r13
	subq	$208, %rsp
	.cfi_def_cfa_offset 256
	movq	%rsp, %rsi
	call	KeccakP1600_ExtractBytes
	testq	%rbx, %rbx
	leaq	(%rsp,%r14), %rcx
	jle	.L71
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L67:
	movq	(%rcx,%rax,8), %rdi
	xorq	(%r12,%rax,8), %rdi
	movq	%rdi, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L67
.L66:
	testq	%r13, %r13
	je	.L72
	salq	$3, %rbx
	xorl	%eax, %eax
	addq	%rbx, %rcx
	addq	%rbx, %r12
	addq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L70:
	movzbl	(%rcx,%rax), %edi
	xorb	(%r12,%rax), %dil
	movb	%dil, 0(%rbp,%rax)
	addq	$1, %rax
	cmpq	%rax, %r13
	jg	.L70
.L72:
	addq	$208, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L71:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L66
	.cfi_endproc
.LFE1149:
	.size	KeccakP1600_ExtractAndAddBytes, .-KeccakP1600_ExtractAndAddBytes
	.p2align 4,,-1
	.globl	KeccakP1600_Permute_24rounds
	.type	KeccakP1600_Permute_24rounds, @function
KeccakP1600_Permute_24rounds:
.LFB1150:
	.cfi_startproc
	vmovdqu	(%rdi), %ymm12
	movl	$keccak_rc, %edx
	vmovdqu	32(%rdi), %ymm11
	vmovdqu	64(%rdi), %ymm5
	vmovdqu	96(%rdi), %ymm4
	vmovdqu	128(%rdi), %ymm3
	vmovdqu	160(%rdi), %ymm2
	vmovdqu	192(%rdi), %ymm1
#APP
# 639 "SnP/KeccakP-1600/OptimizedAVX2/KeccakP-1600-AVX2.cpp" 1
	movq           $768, %rax
1:
vpxor          %ymm11, %ymm12, %ymm9
vpxor          %ymm5, %ymm9, %ymm9
vpxor          %ymm4, %ymm9, %ymm9
vpxor          %ymm3, %ymm9, %ymm9
vpermq         $147, %ymm9, %ymm8
vpsrlq         $63, %ymm9, %ymm7
vpsllq         $1, %ymm9, %ymm9
vperm2i128     $17, %ymm2, %ymm2, %ymm0
vpxor          %ymm0, %ymm2, %ymm0
vpunpckhqdq    %ymm0, %ymm0, %ymm6
vpxor          %ymm6, %ymm0, %ymm6
vpxor          %ymm1, %ymm6, %ymm6
vpxor          %ymm7, %ymm9, %ymm7
vpblendd       $3, %ymm6, %ymm8, %ymm0
vpsrlq         $63, %ymm6, %ymm9
vpsllq         $1, %ymm6, %ymm6
vpxor          %ymm9, %ymm6, %ymm6
vpblendd       $3, %ymm6, %ymm7, %ymm6
vpxor          %ymm7, %ymm8, %ymm7
vpxor          %ymm7, %ymm1, %ymm9
vpermq         $57, %ymm6, %ymm6
vpxor          %ymm6, %ymm0, %ymm0
vpxor          %ymm0, %ymm12, %ymm12
vpxor          %ymm0, %ymm11, %ymm11
vpbroadcastq   %xmm7, %ymm7
vpxor          %ymm7, %ymm2, %ymm2
vpxor          %ymm0, %ymm5, %ymm5
vpxor          %ymm0, %ymm4, %ymm4
vpxor          %ymm0, %ymm3, %ymm3
vmovdqa        _ZL7SRLV_A0(%rip), %ymm6
vmovdqa        _ZL7SLLV_A0(%rip), %ymm1
vmovdqa        _ZL7SRLV_A1(%rip), %ymm7
vpsrlvq        %ymm6, %ymm12, %ymm6
vpsllvq        %ymm1, %ymm12, %ymm12
vmovdqa        _ZL7SLLV_A1(%rip), %ymm1
vmovdqa        _ZL7SRLV_A2(%rip), %ymm0
vpsrlvq        %ymm7, %ymm11, %ymm7
vpsllvq        %ymm1, %ymm11, %ymm11
vmovdqa        _ZL7SLLV_A2(%rip), %ymm1
vmovdqa        _ZL7SRLV_A3(%rip), %ymm10
vpsrlvq        %ymm0, %ymm5, %ymm0
vpsllvq        %ymm1, %ymm5, %ymm5
vpxor          %ymm7, %ymm11, %ymm7
vpxor          %ymm6, %ymm12, %ymm6
vpermq         $28, %ymm6, %ymm11
vperm2i128     $17, %ymm6, %ymm6, %ymm6
vpxor          %ymm0, %ymm5, %ymm5
vpsrlvq        %ymm10, %ymm4, %ymm0
vpermq         $114, %ymm5, %ymm5
vmovdqa        _ZL7SLLV_A3(%rip), %ymm10
vpsllvq        %ymm10, %ymm4, %ymm4
vpxor          %ymm0, %ymm4, %ymm10
vpermq         $135, %ymm10, %ymm4
vmovdqa        _ZL7SRLV_A4(%rip), %ymm0
vpsrlvq        %ymm0, %ymm3, %ymm1
vmovdqa        _ZL7SLLV_A4(%rip), %ymm0
vpsllvq        %ymm0, %ymm3, %ymm3
vpxor          %ymm1, %ymm3, %ymm0
vpermq         $201, %ymm0, %ymm12
vpunpckhqdq    %ymm0, %ymm0, %ymm0
vmovdqa        _ZL7SRLV_C4(%rip), %ymm3
vpsrlvq        %ymm3, %ymm2, %ymm1
vmovdqa        _ZL7SLLV_C4(%rip), %ymm3
vpsllvq        %ymm3, %ymm2, %ymm2
vpxor          %ymm1, %ymm2, %ymm3
vpsrlq         $50, %ymm9, %ymm2
vpsllq         $14, %ymm9, %ymm1
vperm2i128     $17, %ymm3, %ymm3, %ymm8
vpxor          %ymm2, %ymm1, %ymm9
vmovdqa        %xmm3, %xmm1
vpunpckhqdq    %ymm3, %ymm3, %ymm2
vpbroadcastq   %xmm9, %ymm9
vpbroadcastq   %xmm1, %ymm1
vpermq         $255, %ymm3, %ymm3
vpblendd       $48, %ymm3, %ymm4, %ymm3
vpblendd       $3, %ymm9, %ymm12, %ymm4
vpblendd       $192, %ymm1, %ymm11, %ymm11
vpermq         $45, %ymm7, %ymm1
vpblendd       $12, %ymm2, %ymm1, %ymm2
vpermq         $255, %ymm7, %ymm7
vpandn         %ymm5, %ymm2, %ymm9
subq           $32, %rax
vpxor          %ymm11, %ymm9, %ymm9
vpandn         %ymm3, %ymm5, %ymm1
vpandn         %ymm4, %ymm3, %ymm12
vpxor          (%rdx, %rax), %ymm9, %ymm9
vpxor          %ymm12, %ymm5, %ymm12
vpxor          %ymm2, %ymm1, %ymm1
vpandn         %ymm11, %ymm4, %ymm5
vpandn         %ymm2, %ymm11, %ymm2
vpxor          %ymm3, %ymm5, %ymm3
vpxor          %ymm4, %ymm2, %ymm2
vpunpcklqdq    %ymm1, %ymm9, %ymm5
vpunpckhqdq    %ymm1, %ymm9, %ymm1
vpunpcklqdq    %ymm3, %ymm12, %ymm9
vpunpckhqdq    %ymm3, %ymm12, %ymm3
vperm2i128     $32, %ymm9, %ymm5, %ymm12
vperm2i128     $32, %ymm3, %ymm1, %ymm11
vperm2i128     $19, %ymm1, %ymm3, %ymm4
vperm2i128     $19, %ymm5, %ymm9, %ymm5
vpandn         %ymm10, %ymm8, %ymm3
vpandn         %ymm0, %ymm10, %ymm1
vpandn         %ymm8, %ymm7, %ymm9
vpxor          %ymm3, %ymm7, %ymm3
vpxor          %ymm1, %ymm8, %ymm8
vpxor          %ymm9, %ymm6, %ymm9
vpandn         %ymm6, %ymm0, %ymm1
vpxor          %ymm1, %ymm10, %ymm10
vpandn         %ymm7, %ymm6, %ymm1
vpunpcklqdq    %ymm3, %ymm9, %ymm9
vpunpcklqdq    %ymm10, %ymm8, %ymm8
vperm2i128     $32, %ymm8, %ymm9, %ymm3
vpxor          %ymm1, %ymm0, %ymm1
jnz            1b

# 0 "" 2
#NO_APP
	vmovdqu	%ymm12, (%rdi)
	vmovdqu	%ymm11, 32(%rdi)
	vmovdqu	%ymm5, 64(%rdi)
	vmovdqu	%ymm4, 96(%rdi)
	vmovdqu	%ymm3, 128(%rdi)
	vmovdqu	%ymm2, 160(%rdi)
	vmovdqu	%ymm1, 192(%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE1150:
	.size	KeccakP1600_Permute_24rounds, .-KeccakP1600_Permute_24rounds
	.p2align 4,,-1
	.globl	KeccakP1600_Permute_12rounds
	.type	KeccakP1600_Permute_12rounds, @function
KeccakP1600_Permute_12rounds:
.LFB1151:
	.cfi_startproc
	vmovdqu	(%rdi), %ymm12
	movl	$keccak_rc, %edx
	vmovdqu	32(%rdi), %ymm11
	vmovdqu	64(%rdi), %ymm5
	vmovdqu	96(%rdi), %ymm4
	vmovdqu	128(%rdi), %ymm3
	vmovdqu	160(%rdi), %ymm2
	vmovdqu	192(%rdi), %ymm1
#APP
# 652 "SnP/KeccakP-1600/OptimizedAVX2/KeccakP-1600-AVX2.cpp" 1
	movq           $384, %rax
1:
vpxor          %ymm11, %ymm12, %ymm9
vpxor          %ymm5, %ymm9, %ymm9
vpxor          %ymm4, %ymm9, %ymm9
vpxor          %ymm3, %ymm9, %ymm9
vpermq         $147, %ymm9, %ymm8
vpsrlq         $63, %ymm9, %ymm7
vpsllq         $1, %ymm9, %ymm9
vperm2i128     $17, %ymm2, %ymm2, %ymm0
vpxor          %ymm0, %ymm2, %ymm0
vpunpckhqdq    %ymm0, %ymm0, %ymm6
vpxor          %ymm6, %ymm0, %ymm6
vpxor          %ymm1, %ymm6, %ymm6
vpxor          %ymm7, %ymm9, %ymm7
vpblendd       $3, %ymm6, %ymm8, %ymm0
vpsrlq         $63, %ymm6, %ymm9
vpsllq         $1, %ymm6, %ymm6
vpxor          %ymm9, %ymm6, %ymm6
vpblendd       $3, %ymm6, %ymm7, %ymm6
vpxor          %ymm7, %ymm8, %ymm7
vpxor          %ymm7, %ymm1, %ymm9
vpermq         $57, %ymm6, %ymm6
vpxor          %ymm6, %ymm0, %ymm0
vpxor          %ymm0, %ymm12, %ymm12
vpxor          %ymm0, %ymm11, %ymm11
vpbroadcastq   %xmm7, %ymm7
vpxor          %ymm7, %ymm2, %ymm2
vpxor          %ymm0, %ymm5, %ymm5
vpxor          %ymm0, %ymm4, %ymm4
vpxor          %ymm0, %ymm3, %ymm3
vmovdqa        _ZL7SRLV_A0(%rip), %ymm6
vmovdqa        _ZL7SLLV_A0(%rip), %ymm1
vmovdqa        _ZL7SRLV_A1(%rip), %ymm7
vpsrlvq        %ymm6, %ymm12, %ymm6
vpsllvq        %ymm1, %ymm12, %ymm12
vmovdqa        _ZL7SLLV_A1(%rip), %ymm1
vmovdqa        _ZL7SRLV_A2(%rip), %ymm0
vpsrlvq        %ymm7, %ymm11, %ymm7
vpsllvq        %ymm1, %ymm11, %ymm11
vmovdqa        _ZL7SLLV_A2(%rip), %ymm1
vmovdqa        _ZL7SRLV_A3(%rip), %ymm10
vpsrlvq        %ymm0, %ymm5, %ymm0
vpsllvq        %ymm1, %ymm5, %ymm5
vpxor          %ymm7, %ymm11, %ymm7
vpxor          %ymm6, %ymm12, %ymm6
vpermq         $28, %ymm6, %ymm11
vperm2i128     $17, %ymm6, %ymm6, %ymm6
vpxor          %ymm0, %ymm5, %ymm5
vpsrlvq        %ymm10, %ymm4, %ymm0
vpermq         $114, %ymm5, %ymm5
vmovdqa        _ZL7SLLV_A3(%rip), %ymm10
vpsllvq        %ymm10, %ymm4, %ymm4
vpxor          %ymm0, %ymm4, %ymm10
vpermq         $135, %ymm10, %ymm4
vmovdqa        _ZL7SRLV_A4(%rip), %ymm0
vpsrlvq        %ymm0, %ymm3, %ymm1
vmovdqa        _ZL7SLLV_A4(%rip), %ymm0
vpsllvq        %ymm0, %ymm3, %ymm3
vpxor          %ymm1, %ymm3, %ymm0
vpermq         $201, %ymm0, %ymm12
vpunpckhqdq    %ymm0, %ymm0, %ymm0
vmovdqa        _ZL7SRLV_C4(%rip), %ymm3
vpsrlvq        %ymm3, %ymm2, %ymm1
vmovdqa        _ZL7SLLV_C4(%rip), %ymm3
vpsllvq        %ymm3, %ymm2, %ymm2
vpxor          %ymm1, %ymm2, %ymm3
vpsrlq         $50, %ymm9, %ymm2
vpsllq         $14, %ymm9, %ymm1
vperm2i128     $17, %ymm3, %ymm3, %ymm8
vpxor          %ymm2, %ymm1, %ymm9
vmovdqa        %xmm3, %xmm1
vpunpckhqdq    %ymm3, %ymm3, %ymm2
vpbroadcastq   %xmm9, %ymm9
vpbroadcastq   %xmm1, %ymm1
vpermq         $255, %ymm3, %ymm3
vpblendd       $48, %ymm3, %ymm4, %ymm3
vpblendd       $3, %ymm9, %ymm12, %ymm4
vpblendd       $192, %ymm1, %ymm11, %ymm11
vpermq         $45, %ymm7, %ymm1
vpblendd       $12, %ymm2, %ymm1, %ymm2
vpermq         $255, %ymm7, %ymm7
vpandn         %ymm5, %ymm2, %ymm9
subq           $32, %rax
vpxor          %ymm11, %ymm9, %ymm9
vpandn         %ymm3, %ymm5, %ymm1
vpandn         %ymm4, %ymm3, %ymm12
vpxor          (%rdx, %rax), %ymm9, %ymm9
vpxor          %ymm12, %ymm5, %ymm12
vpxor          %ymm2, %ymm1, %ymm1
vpandn         %ymm11, %ymm4, %ymm5
vpandn         %ymm2, %ymm11, %ymm2
vpxor          %ymm3, %ymm5, %ymm3
vpxor          %ymm4, %ymm2, %ymm2
vpunpcklqdq    %ymm1, %ymm9, %ymm5
vpunpckhqdq    %ymm1, %ymm9, %ymm1
vpunpcklqdq    %ymm3, %ymm12, %ymm9
vpunpckhqdq    %ymm3, %ymm12, %ymm3
vperm2i128     $32, %ymm9, %ymm5, %ymm12
vperm2i128     $32, %ymm3, %ymm1, %ymm11
vperm2i128     $19, %ymm1, %ymm3, %ymm4
vperm2i128     $19, %ymm5, %ymm9, %ymm5
vpandn         %ymm10, %ymm8, %ymm3
vpandn         %ymm0, %ymm10, %ymm1
vpandn         %ymm8, %ymm7, %ymm9
vpxor          %ymm3, %ymm7, %ymm3
vpxor          %ymm1, %ymm8, %ymm8
vpxor          %ymm9, %ymm6, %ymm9
vpandn         %ymm6, %ymm0, %ymm1
vpxor          %ymm1, %ymm10, %ymm10
vpandn         %ymm7, %ymm6, %ymm1
vpunpcklqdq    %ymm3, %ymm9, %ymm9
vpunpcklqdq    %ymm10, %ymm8, %ymm8
vperm2i128     $32, %ymm8, %ymm9, %ymm3
vpxor          %ymm1, %ymm0, %ymm1
jnz            1b

# 0 "" 2
#NO_APP
	vmovdqu	%ymm12, (%rdi)
	vmovdqu	%ymm11, 32(%rdi)
	vmovdqu	%ymm5, 64(%rdi)
	vmovdqu	%ymm4, 96(%rdi)
	vmovdqu	%ymm3, 128(%rdi)
	vmovdqu	%ymm2, 160(%rdi)
	vmovdqu	%ymm1, 192(%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE1151:
	.size	KeccakP1600_Permute_12rounds, .-KeccakP1600_Permute_12rounds
	.p2align 4,,-1
	.globl	KeccakF1600_FastLoop_Absorb
	.type	KeccakF1600_FastLoop_Absorb, @function
KeccakF1600_FastLoop_Absorb:
.LFB1152:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	32(%rdi), %rax
	leaq	160(%rdi), %r10
	leaq	192(%rdi), %r11
	shrq	$3, %rcx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$112, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	subq	%rsi, %rcx
	vmovdqu	(%rdi), %ymm12
	movq	%rax, 104(%rsp)
	leaq	64(%rdi), %rax
	vmovdqu	32(%rdi), %ymm11
	movq	%rax, 96(%rsp)
	leaq	96(%rdi), %rax
	vmovdqu	64(%rdi), %ymm5
	movq	%rax, 88(%rsp)
	leaq	128(%rdi), %rax
	vmovdqu	96(%rdi), %ymm4
	movq	%rax, 80(%rsp)
	vmovdqu	128(%rdi), %ymm3
	vmovdqu	(%r10), %ymm2
	vmovdqu	(%r11), %ymm1
	js	.L90
	leaq	0(,%rsi,8), %rax
	leaq	-9(%rsi), %r13
	vmovdqa	.LC0(%rip), %ymm13
	movq	%rdx, %r9
	xorl	%r12d, %r12d
	movl	$keccak_rc, %ebx
	movq	%rax, 8(%rsp)
	movq	%rcx, %r15
	movq	%rdi, %r8
	movq	%rsi, %r14
	.p2align 4,,10
	.p2align 3
.L89:
	cmpq	$16, %r13
	leaq	(%r9,%r12,8), %rsi
	ja	.L78
	jmp	*.L80(,%r13,8)
	.section	.rodata
	.align 8
	.align 4
.L80:
	.quad	.L79
	.quad	.L78
	.quad	.L78
	.quad	.L78
	.quad	.L81
	.quad	.L78
	.quad	.L78
	.quad	.L82
	.quad	.L83
	.quad	.L84
	.quad	.L78
	.quad	.L78
	.quad	.L85
	.quad	.L78
	.quad	.L78
	.quad	.L78
	.quad	.L86
	.text
	.p2align 4,,10
	.p2align 3
.L86:
	vmovdqu	(%rsi), %ymm0
	vmovq	112(%rsi), %xmm6
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vmovq	32(%rsi), %xmm7
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqu	80(%rsi), %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
	vmovdqu	120(%rsi), %ymm0
	vpxor	%ymm0, %ymm4, %ymm4
	vmovdqu	160(%rsi), %ymm0
	vpxor	%ymm0, %ymm3, %ymm3
	vpinsrq	$1, 152(%rsi), %xmm6, %xmm0
	vpinsrq	$1, 72(%rsi), %xmm7, %xmm6
	vinserti128	$0x1, %xmm0, %ymm6, %ymm0
	vpxor	%ymm0, %ymm2, %ymm2
	vmovq	192(%rsi), %xmm0
	vpxor	%ymm0, %ymm1, %ymm1
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rbx, %rdx
#APP
# 738 "SnP/KeccakP-1600/OptimizedAVX2/KeccakP-1600-AVX2.cpp" 1
	movq           $768, %rax
1:
vpxor          %ymm11, %ymm12, %ymm9
vpxor          %ymm5, %ymm9, %ymm9
vpxor          %ymm4, %ymm9, %ymm9
vpxor          %ymm3, %ymm9, %ymm9
vpermq         $147, %ymm9, %ymm8
vpsrlq         $63, %ymm9, %ymm7
vpsllq         $1, %ymm9, %ymm9
vperm2i128     $17, %ymm2, %ymm2, %ymm0
vpxor          %ymm0, %ymm2, %ymm0
vpunpckhqdq    %ymm0, %ymm0, %ymm6
vpxor          %ymm6, %ymm0, %ymm6
vpxor          %ymm1, %ymm6, %ymm6
vpxor          %ymm7, %ymm9, %ymm7
vpblendd       $3, %ymm6, %ymm8, %ymm0
vpsrlq         $63, %ymm6, %ymm9
vpsllq         $1, %ymm6, %ymm6
vpxor          %ymm9, %ymm6, %ymm6
vpblendd       $3, %ymm6, %ymm7, %ymm6
vpxor          %ymm7, %ymm8, %ymm7
vpxor          %ymm7, %ymm1, %ymm9
vpermq         $57, %ymm6, %ymm6
vpxor          %ymm6, %ymm0, %ymm0
vpxor          %ymm0, %ymm12, %ymm12
vpxor          %ymm0, %ymm11, %ymm11
vpbroadcastq   %xmm7, %ymm7
vpxor          %ymm7, %ymm2, %ymm2
vpxor          %ymm0, %ymm5, %ymm5
vpxor          %ymm0, %ymm4, %ymm4
vpxor          %ymm0, %ymm3, %ymm3
vmovdqa        _ZL7SRLV_A0(%rip), %ymm6
vmovdqa        _ZL7SLLV_A0(%rip), %ymm1
vmovdqa        _ZL7SRLV_A1(%rip), %ymm7
vpsrlvq        %ymm6, %ymm12, %ymm6
vpsllvq        %ymm1, %ymm12, %ymm12
vmovdqa        _ZL7SLLV_A1(%rip), %ymm1
vmovdqa        _ZL7SRLV_A2(%rip), %ymm0
vpsrlvq        %ymm7, %ymm11, %ymm7
vpsllvq        %ymm1, %ymm11, %ymm11
vmovdqa        _ZL7SLLV_A2(%rip), %ymm1
vmovdqa        _ZL7SRLV_A3(%rip), %ymm10
vpsrlvq        %ymm0, %ymm5, %ymm0
vpsllvq        %ymm1, %ymm5, %ymm5
vpxor          %ymm7, %ymm11, %ymm7
vpxor          %ymm6, %ymm12, %ymm6
vpermq         $28, %ymm6, %ymm11
vperm2i128     $17, %ymm6, %ymm6, %ymm6
vpxor          %ymm0, %ymm5, %ymm5
vpsrlvq        %ymm10, %ymm4, %ymm0
vpermq         $114, %ymm5, %ymm5
vmovdqa        _ZL7SLLV_A3(%rip), %ymm10
vpsllvq        %ymm10, %ymm4, %ymm4
vpxor          %ymm0, %ymm4, %ymm10
vpermq         $135, %ymm10, %ymm4
vmovdqa        _ZL7SRLV_A4(%rip), %ymm0
vpsrlvq        %ymm0, %ymm3, %ymm1
vmovdqa        _ZL7SLLV_A4(%rip), %ymm0
vpsllvq        %ymm0, %ymm3, %ymm3
vpxor          %ymm1, %ymm3, %ymm0
vpermq         $201, %ymm0, %ymm12
vpunpckhqdq    %ymm0, %ymm0, %ymm0
vmovdqa        _ZL7SRLV_C4(%rip), %ymm3
vpsrlvq        %ymm3, %ymm2, %ymm1
vmovdqa        _ZL7SLLV_C4(%rip), %ymm3
vpsllvq        %ymm3, %ymm2, %ymm2
vpxor          %ymm1, %ymm2, %ymm3
vpsrlq         $50, %ymm9, %ymm2
vpsllq         $14, %ymm9, %ymm1
vperm2i128     $17, %ymm3, %ymm3, %ymm8
vpxor          %ymm2, %ymm1, %ymm9
vmovdqa        %xmm3, %xmm1
vpunpckhqdq    %ymm3, %ymm3, %ymm2
vpbroadcastq   %xmm9, %ymm9
vpbroadcastq   %xmm1, %ymm1
vpermq         $255, %ymm3, %ymm3
vpblendd       $48, %ymm3, %ymm4, %ymm3
vpblendd       $3, %ymm9, %ymm12, %ymm4
vpblendd       $192, %ymm1, %ymm11, %ymm11
vpermq         $45, %ymm7, %ymm1
vpblendd       $12, %ymm2, %ymm1, %ymm2
vpermq         $255, %ymm7, %ymm7
vpandn         %ymm5, %ymm2, %ymm9
subq           $32, %rax
vpxor          %ymm11, %ymm9, %ymm9
vpandn         %ymm3, %ymm5, %ymm1
vpandn         %ymm4, %ymm3, %ymm12
vpxor          (%rdx, %rax), %ymm9, %ymm9
vpxor          %ymm12, %ymm5, %ymm12
vpxor          %ymm2, %ymm1, %ymm1
vpandn         %ymm11, %ymm4, %ymm5
vpandn         %ymm2, %ymm11, %ymm2
vpxor          %ymm3, %ymm5, %ymm3
vpxor          %ymm4, %ymm2, %ymm2
vpunpcklqdq    %ymm1, %ymm9, %ymm5
vpunpckhqdq    %ymm1, %ymm9, %ymm1
vpunpcklqdq    %ymm3, %ymm12, %ymm9
vpunpckhqdq    %ymm3, %ymm12, %ymm3
vperm2i128     $32, %ymm9, %ymm5, %ymm12
vperm2i128     $32, %ymm3, %ymm1, %ymm11
vperm2i128     $19, %ymm1, %ymm3, %ymm4
vperm2i128     $19, %ymm5, %ymm9, %ymm5
vpandn         %ymm10, %ymm8, %ymm3
vpandn         %ymm0, %ymm10, %ymm1
vpandn         %ymm8, %ymm7, %ymm9
vpxor          %ymm3, %ymm7, %ymm3
vpxor          %ymm1, %ymm8, %ymm8
vpxor          %ymm9, %ymm6, %ymm9
vpandn         %ymm6, %ymm0, %ymm1
vpxor          %ymm1, %ymm10, %ymm10
vpandn         %ymm7, %ymm6, %ymm1
vpunpcklqdq    %ymm3, %ymm9, %ymm9
vpunpcklqdq    %ymm10, %ymm8, %ymm8
vperm2i128     $32, %ymm8, %ymm9, %ymm3
vpxor          %ymm1, %ymm0, %ymm1
jnz            1b

# 0 "" 2
#NO_APP
	addq	%r14, %r12
	cmpq	%r15, %r12
	jle	.L89
	leaq	0(,%r12,8), %rax
	movq	%r8, %r14
.L77:
	vmovdqu	%ymm12, (%r14)
	vmovdqu	%ymm11, 32(%r14)
	vmovdqu	%ymm5, 64(%r14)
	vmovdqu	%ymm4, 96(%r14)
	vmovdqu	%ymm3, 128(%r14)
	vmovdqu	%ymm2, 160(%r14)
	vmovdqu	%ymm1, 192(%r14)
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	vmovdqu	(%rsi), %ymm0
	vmovq	112(%rsi), %xmm6
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vmovq	32(%rsi), %xmm7
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqu	80(%rsi), %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
	vmovdqu	120(%rsi), %ymm0
	vpxor	%ymm0, %ymm4, %ymm4
	vpmaskmovq	160(%rsi), %ymm13, %ymm0
	vpxor	%ymm0, %ymm3, %ymm3
	vpinsrq	$1, 152(%rsi), %xmm6, %xmm0
	vpinsrq	$1, 72(%rsi), %xmm7, %xmm6
	vinserti128	$0x1, %xmm0, %ymm6, %ymm0
	vpxor	%ymm0, %ymm2, %ymm2
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L84:
	vmovdqu	(%rsi), %ymm0
	vmovdqa	.LC1(%rip), %ymm6
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqu	80(%rsi), %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
	vpmaskmovq	120(%rsi), %ymm6, %ymm0
.L93:
	vpxor	%ymm0, %ymm4, %ymm4
	vmovq	32(%rsi), %xmm7
	vpxor	%xmm0, %xmm0, %xmm0
	vpinsrq	$1, 72(%rsi), %xmm7, %xmm6
	vpinsrq	$0, 112(%rsi), %xmm0, %xmm0
	vinserti128	$0x1, %xmm0, %ymm6, %ymm0
	vpxor	%ymm0, %ymm2, %ymm2
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L83:
	vmovdqu	(%rsi), %ymm0
	vmovdqa	.LC2(%rip), %ymm7
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqu	80(%rsi), %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
.L92:
	vpmaskmovq	120(%rsi), %ymm7, %ymm0
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L82:
	vmovdqu	(%rsi), %ymm0
	vmovdqa	.LC0(%rip), %ymm7
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqu	80(%rsi), %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L81:
	vmovdqu	(%rsi), %ymm0
	vmovq	32(%rsi), %xmm7
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqa	.LC1(%rip), %ymm0
	vpmaskmovq	80(%rsi), %ymm0, %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
	vpinsrq	$1, 72(%rsi), %xmm7, %xmm0
	vmovdqa	%xmm0, %xmm0
	vpxor	%ymm0, %ymm2, %ymm2
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L79:
	vmovdqu	(%rsi), %ymm0
	vpxor	%ymm0, %ymm12, %ymm12
	vmovdqu	40(%rsi), %ymm0
	vpxor	%ymm0, %ymm11, %ymm11
	vmovdqa	.LC0(%rip), %ymm0
	vpmaskmovq	32(%rsi), %ymm0, %ymm0
	vpxor	%ymm0, %ymm2, %ymm2
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L78:
	movq	%r9, 48(%rsp)
	vmovdqa	%ymm13, 16(%rsp)
	vmovdqu	%ymm12, (%r8)
	movq	104(%rsp), %rax
	vmovdqu	%ymm11, (%rax)
	movq	96(%rsp), %rdi
	vmovdqu	%ymm5, (%rdi)
	movq	88(%rsp), %rcx
	movq	%r8, %rdi
	vmovdqu	%ymm4, (%rcx)
	movq	80(%rsp), %rdx
	vmovdqu	%ymm3, (%rdx)
	xorl	%edx, %edx
	vmovdqu	%ymm2, (%r10)
	movq	%r10, 56(%rsp)
	vmovdqu	%ymm1, (%r11)
	movq	8(%rsp), %rcx
	movq	%r11, 64(%rsp)
	movq	%r8, 72(%rsp)
	vzeroupper
	call	KeccakP1600_AddBytes
	movq	72(%rsp), %r8
	movq	104(%rsp), %rax
	movq	96(%rsp), %rdi
	movq	88(%rsp), %rcx
	movq	80(%rsp), %rdx
	movq	56(%rsp), %r10
	movq	64(%rsp), %r11
	vmovdqu	(%r8), %ymm12
	vmovdqu	(%rax), %ymm11
	movq	48(%rsp), %r9
	vmovdqu	(%rdi), %ymm5
	vmovdqu	(%rcx), %ymm4
	vmovdqu	(%rdx), %ymm3
	vmovdqu	(%r10), %ymm2
	vmovdqu	(%r11), %ymm1
	vmovdqa	16(%rsp), %ymm13
	jmp	.L87
.L90:
	xorl	%eax, %eax
	jmp	.L77
	.cfi_endproc
.LFE1152:
	.size	KeccakF1600_FastLoop_Absorb, .-KeccakF1600_FastLoop_Absorb
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.type	_GLOBAL__sub_I_keccak_rc, @function
_GLOBAL__sub_I_keccak_rc:
.LFB1154:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vmovdqa	.LC3(%rip), %ymm11
	vmovdqa	.LC4(%rip), %ymm10
	vmovdqa	.LC5(%rip), %ymm9
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	vmovdqa	.LC6(%rip), %ymm8
	vmovdqa	.LC7(%rip), %ymm7
	vmovdqa	.LC8(%rip), %ymm6
	vmovdqa	.LC9(%rip), %ymm5
	vmovdqa	.LC10(%rip), %ymm4
	vmovdqa	.LC12(%rip), %ymm2
	vmovdqa	.LC13(%rip), %ymm1
	vmovdqa	.LC14(%rip), %ymm0
	vmovdqa	.LC11(%rip), %ymm3
	vmovdqa	%ymm11, _ZL7SLLV_A0(%rip)
	vmovdqa	%ymm11, _ZL6SLLVA0(%rip)
	vmovdqa	%ymm10, _ZL7SRLV_A0(%rip)
	vmovdqa	%ymm10, _ZL6SRLVA0(%rip)
	vmovdqa	%ymm9, _ZL7SLLV_A1(%rip)
	vmovdqa	%ymm9, _ZL6SLLVA1(%rip)
	vmovdqa	%ymm8, _ZL7SRLV_A1(%rip)
	vmovdqa	%ymm8, _ZL6SRLVA1(%rip)
	vmovdqa	%ymm7, _ZL7SLLV_A2(%rip)
	vmovdqa	%ymm7, _ZL6SLLVA2(%rip)
	vmovdqa	%ymm6, _ZL7SRLV_A2(%rip)
	vmovdqa	%ymm6, _ZL6SRLVA2(%rip)
	vmovdqa	%ymm5, _ZL7SLLV_A3(%rip)
	vmovdqa	%ymm5, _ZL6SLLVA3(%rip)
	vmovdqa	%ymm4, _ZL6SRLVA3(%rip)
	vmovdqa	%ymm3, _ZL6SLLVA4(%rip)
	vmovdqa	%ymm2, _ZL6SRLVA4(%rip)
	vmovdqa	%ymm1, _ZL6SLLVC4(%rip)
	vmovdqa	%ymm0, _ZL6SRLVC4(%rip)
	vmovdqa	%ymm4, _ZL7SRLV_A3(%rip)
	vmovdqa	%ymm3, _ZL7SLLV_A4(%rip)
	vmovdqa	%ymm2, _ZL7SRLV_A4(%rip)
	vmovdqa	%ymm1, _ZL7SLLV_C4(%rip)
	vmovdqa	%ymm0, _ZL7SRLV_C4(%rip)
	vzeroupper
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1154:
	.size	_GLOBAL__sub_I_keccak_rc, .-_GLOBAL__sub_I_keccak_rc
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_keccak_rc
	.globl	keccak_rc
	.data
	.align 32
	.type	keccak_rc, @object
	.size	keccak_rc, 768
keccak_rc:
	.quad	-9223372034707259384
	.zero	24
	.quad	2147483649
	.zero	24
	.quad	-9223372036854742912
	.zero	24
	.quad	-9223372034707259263
	.zero	24
	.quad	-9223372034707292150
	.zero	24
	.quad	32778
	.zero	24
	.quad	-9223372036854775680
	.zero	24
	.quad	-9223372036854743038
	.zero	24
	.quad	-9223372036854743037
	.zero	24
	.quad	-9223372036854742903
	.zero	24
	.quad	-9223372036854775669
	.zero	24
	.quad	2147516555
	.zero	24
	.quad	2147483658
	.zero	24
	.quad	2147516425
	.zero	24
	.quad	136
	.zero	24
	.quad	138
	.zero	24
	.quad	-9223372036854743031
	.zero	24
	.quad	-9223372034707259263
	.zero	24
	.quad	2147483649
	.zero	24
	.quad	32907
	.zero	24
	.quad	-9223372034707259392
	.zero	24
	.quad	-9223372036854742902
	.zero	24
	.quad	32898
	.zero	24
	.quad	1
	.zero	24
	.local	_ZL7SRLV_C4
	.comm	_ZL7SRLV_C4,32,32
	.local	_ZL7SLLV_C4
	.comm	_ZL7SLLV_C4,32,32
	.local	_ZL7SRLV_A4
	.comm	_ZL7SRLV_A4,32,32
	.local	_ZL7SLLV_A4
	.comm	_ZL7SLLV_A4,32,32
	.local	_ZL7SRLV_A3
	.comm	_ZL7SRLV_A3,32,32
	.local	_ZL7SLLV_A3
	.comm	_ZL7SLLV_A3,32,32
	.local	_ZL7SRLV_A2
	.comm	_ZL7SRLV_A2,32,32
	.local	_ZL7SLLV_A2
	.comm	_ZL7SLLV_A2,32,32
	.local	_ZL7SRLV_A1
	.comm	_ZL7SRLV_A1,32,32
	.local	_ZL7SLLV_A1
	.comm	_ZL7SLLV_A1,32,32
	.local	_ZL7SRLV_A0
	.comm	_ZL7SRLV_A0,32,32
	.local	_ZL7SLLV_A0
	.comm	_ZL7SLLV_A0,32,32
	.local	_ZL6SRLVC4
	.comm	_ZL6SRLVC4,32,32
	.local	_ZL6SLLVC4
	.comm	_ZL6SLLVC4,32,32
	.local	_ZL6SRLVA4
	.comm	_ZL6SRLVA4,32,32
	.local	_ZL6SLLVA4
	.comm	_ZL6SLLVA4,32,32
	.local	_ZL6SRLVA3
	.comm	_ZL6SRLVA3,32,32
	.local	_ZL6SLLVA3
	.comm	_ZL6SLLVA3,32,32
	.local	_ZL6SRLVA2
	.comm	_ZL6SRLVA2,32,32
	.local	_ZL6SLLVA2
	.comm	_ZL6SLLVA2,32,32
	.local	_ZL6SRLVA1
	.comm	_ZL6SRLVA1,32,32
	.local	_ZL6SLLVA1
	.comm	_ZL6SLLVA1,32,32
	.local	_ZL6SRLVA0
	.comm	_ZL6SRLVA0,32,32
	.local	_ZL6SLLVA0
	.comm	_ZL6SLLVA0,32,32
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	-9223372036854775808
	.quad	0
	.quad	0
	.quad	0
	.align 32
.LC1:
	.quad	-9223372036854775808
	.quad	-9223372036854775808
	.quad	-9223372036854775808
	.quad	0
	.align 32
.LC2:
	.quad	-9223372036854775808
	.quad	-9223372036854775808
	.quad	0
	.quad	0
	.align 32
.LC3:
	.quad	0
	.quad	1
	.quad	62
	.quad	28
	.align 32
.LC4:
	.quad	64
	.quad	63
	.quad	2
	.quad	36
	.align 32
.LC5:
	.quad	36
	.quad	44
	.quad	6
	.quad	55
	.align 32
.LC6:
	.quad	28
	.quad	20
	.quad	58
	.quad	9
	.align 32
.LC7:
	.quad	3
	.quad	10
	.quad	43
	.quad	25
	.align 32
.LC8:
	.quad	61
	.quad	54
	.quad	21
	.quad	39
	.align 32
.LC9:
	.quad	41
	.quad	45
	.quad	15
	.quad	21
	.align 32
.LC10:
	.quad	23
	.quad	19
	.quad	49
	.quad	43
	.align 32
.LC11:
	.quad	18
	.quad	2
	.quad	61
	.quad	56
	.align 32
.LC12:
	.quad	46
	.quad	62
	.quad	3
	.quad	8
	.align 32
.LC13:
	.quad	27
	.quad	20
	.quad	39
	.quad	8
	.align 32
.LC14:
	.quad	37
	.quad	44
	.quad	25
	.quad	56
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
