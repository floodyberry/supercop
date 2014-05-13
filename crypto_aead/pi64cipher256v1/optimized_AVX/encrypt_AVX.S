#define crypto_aead_encrypt crypto_aead_pi64cipher256v1_optimized_AVX_encrypt
#define crypto_aead_decrypt crypto_aead_pi64cipher256v1_optimized_AVX_decrypt

# AVX version made by Rune E. Jensen
# Version 1
# CRYPTO_KEYBYTES 32
# CRYPTO_NSECBYTES 64
# CRYPTO_NPUBBYTES 16
# CRYPTO_ABYTES 64
	.file	"encrypt_AVX.s"
	.text
	.p2align 4,,15
	.globl	crypto_aead_encrypt
	.type	crypto_aead_encrypt, @function
crypto_aead_encrypt:
.LFB2571:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-128, %rsp
	subq	$1416, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, -96(%rsp)
	movq	%rdx, -80(%rsp)
	leaq	776(%rsp), %rdx
	movq	32(%rbp), %rsi
	movq	%rdi, 96(%rsp)
	movq	%rcx, (%rsp)
	movq	%rdx, %rdi
	movl	$8, %ecx
	rep stosq
	vmovdqa	%xmm0, 1032(%rsp)
	leaq	32(%rsi), %rax
	movq	%r8, -88(%rsp)
	movq	%r9, -72(%rsp)
	vmovdqa	%xmm0, 1048(%rsp)
	cmpq	$InternalState, %rax
	vmovdqa	%xmm0, 1064(%rsp)
	vmovdqa	%xmm0, 1080(%rsp)
	vmovdqa	%xmm0, 1096(%rsp)
	vmovdqa	%xmm0, 1112(%rsp)
	vmovdqa	%xmm0, 1128(%rsp)
	vmovdqa	%xmm0, 1144(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	24(%rbp), %r8
	vmovdqa	%ymm0, InternalState(%rip)
	vmovdqa	%ymm0, InternalState+32(%rip)
	vmovdqa	%ymm0, InternalState+64(%rip)
	vmovdqa	%ymm0, InternalState+96(%rip)
	ja	.L47
.L33:
	vmovdqu	(%rsi), %xmm0
	vinsertf128	$0x1, 16(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, InternalState(%rip)
.L4:
	leaq	16(%r8), %rax
	cmpq	$InternalState+32, %rax
	ja	.L48
.L34:
	vmovdqu	(%r8), %xmm0
	vmovdqa	%xmm0, InternalState+32(%rip)
.L7:
	movq	InternalState(%rip), %rdx
	movq	InternalState+8(%rip), %r10
	movabsq	$-8247349341179448980, %rcx
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %r9
	movabsq	$7667772426219706969, %rsi
	movabsq	$4195444129992158507, %rbx
	movabsq	$-1376848230519552085, %r11
	movabsq	$-6792583489299504353, %r12
	leaq	(%r10,%rdx), %r8
	addq	%rcx, %rdx
	addq	%rsi, %r10
	leaq	(%r9,%rdi), %rax
	addq	%rbx, %r9
	movq	InternalState+56(%rip), %r14
	leaq	(%r9,%r8), %rbx
	movb	$1, InternalState+48(%rip)
	movabsq	$-3329063056561552456, %r15
	addq	%rax, %rdx
	addq	%rax, %r10
	movabsq	$6220970056051541820, %rax
	addq	%rax, %rdi
	rolq	$23, %r10
	rolq	$59, %rbx
	addq	%r8, %rdi
	rolq	$11, %rdx
	movq	%rbx, %r8
	rolq	$37, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r8
	xorq	%rdx, %r9
	xorq	%r8, %r10
	xorq	%r8, %rdx
	xorq	%r9, %rbx
	movabsq	$-9209400399786843361, %r8
	addq	%r11, %rdx
	xorq	%rdi, %r9
	addq	%r8, %rbx
	movabsq	$-3463520432737951897, %r11
	movabsq	$-369815132508846929, %r8
	leaq	(%rbx,%rdx), %rdi
	addq	%r8, %r9
	addq	%r10, %r11
	movabsq	$-1087367646907149102, %r8
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%r8, %r9
	leaq	(%r10,%rdi), %r13
	addq	%rdi, %r9
	movabsq	$-5426079245872290139, %rdi
	addq	%rdi, %rdx
	rolq	$7, %r9
	rolq	$19, %r13
	leaq	(%rdx,%r11), %r10
	movabsq	$-6657276164713376882, %rdx
	addq	%rdx, %rbx
	rolq	$31, %r10
	addq	%rbx, %r11
	movq	%r9, %rbx
	rolq	$53, %r11
	movq	%r10, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r12
	xorq	%rbx, %r11
	xorq	%r10, %rbx
	xorq	%r12, %r13
	xorq	%r9, %r12
	movq	InternalState+32(%rip), %r10
	movq	%r13, 712(%rsp)
	movq	InternalState+48(%rip), %r13
	movq	%r12, 680(%rsp)
	movq	InternalState+40(%rip), %r12
	movq	%rbx, 488(%rsp)
	movq	%r11, 696(%rsp)
	leaq	(%r14,%r13), %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rsi), %r10
	movabsq	$4195444129992158507, %r12
	addq	%r14, %r12
	movq	InternalState+88(%rip), %r14
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	addq	%rbx, %r12
	rolq	$23, %r10
	rolq	$59, %r12
	rolq	$11, %r11
	addq	%rbx, %r9
	movq	%r12, %r13
	movq	%r10, %rbx
	rolq	$37, %r9
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r12
	xorq	%rbx, %r9
	xorq	%r13, %r11
	addq	680(%rsp), %r9
	addq	488(%rsp), %r11
	addq	712(%rsp), %r12
	xorq	%r10, %r13
	addq	696(%rsp), %r13
	leaq	(%r11,%r12), %r10
	leaq	0(%r13,%r9), %rbx
	addq	%rdi, %r11
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r10
	addq	%rdx, %r12
	movq	%r10, %r13
	addq	%r12, %rbx
	xorq	%r9, %r13
	movq	%r11, %r12
	rolq	$53, %rbx
	xorq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	movq	%r13, 552(%rsp)
	xorq	%r9, %r12
	movq	InternalState+80(%rip), %r13
	movq	%r10, 648(%rsp)
	movq	%r12, 504(%rsp)
	movq	InternalState+64(%rip), %r10
	movq	InternalState+72(%rip), %r12
	movq	%rbx, 536(%rsp)
	leaq	(%r14,%r13), %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rsi), %r10
	movabsq	$4195444129992158507, %r12
	addq	%r14, %r12
	movq	InternalState+120(%rip), %r14
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	addq	%rbx, %r12
	rolq	$23, %r10
	rolq	$59, %r12
	rolq	$11, %r11
	addq	%rbx, %r9
	movq	%r12, %r13
	movq	%r10, %rbx
	rolq	$37, %r9
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r12
	addq	648(%rsp), %r12
	xorq	%r13, %r11
	addq	552(%rsp), %r11
	xorq	%rbx, %r9
	xorq	%r10, %r13
	addq	504(%rsp), %r9
	addq	536(%rsp), %r13
	leaq	(%r12,%r11), %r10
	leaq	0(%r13,%r9), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$19, %r10
	addq	%rdx, %r12
	addq	%rdi, %r11
	movq	%r10, %r13
	addq	%rbx, %r11
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 520(%rsp)
	movq	InternalState+112(%rip), %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 600(%rsp)
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	movq	InternalState+96(%rip), %r10
	movq	InternalState+104(%rip), %r12
	leaq	(%r14,%r13), %r9
	leaq	(%r12,%r10), %r11
	addq	%rcx, %r10
	leaq	(%r9,%r10), %rbx
	leaq	(%r12,%rsi), %r10
	movabsq	$4195444129992158507, %r12
	addq	%r14, %r12
	addq	%r10, %r9
	leaq	0(%r13,%rax), %r10
	rolq	$11, %rbx
	rolq	$23, %r9
	addq	%r11, %r10
	addq	%r12, %r11
	movq	%r9, %r13
	rolq	$59, %r11
	rolq	$37, %r10
	xorq	%rbx, %r13
	movq	%r11, %r12
	xorq	%r13, %r11
	addq	632(%rsp), %r11
	xorq	%r10, %r12
	xorq	%r13, %r10
	movq	600(%rsp), %r13
	xorq	%r12, %rbx
	addq	520(%rsp), %rbx
	addq	728(%rsp), %r10
	xorq	%r12, %r9
	addq	%r9, %r13
	leaq	(%r11,%rbx), %r12
	leaq	0(%r13,%r10), %r9
	addq	%r8, %r10
	leaq	(%r10,%r12), %r14
	leaq	(%rbx,%rdi), %r10
	rolq	$7, %r14
	addq	%r15, %r13
	addq	%rdx, %r11
	addq	%r13, %r12
	leaq	(%r11,%r9), %rbx
	addq	%r9, %r10
	rolq	$19, %r12
	rolq	$31, %r10
	movq	%r12, %r11
	rolq	$53, %rbx
	xorq	%r14, %r11
	movq	%rbx, %r9
	movq	%r11, %r13
	xorq	%r10, %r9
	xorq	%r10, %r11
	xorq	%rbx, %r13
	movabsq	$-7999569951748836447, %rbx
	xorq	%r9, %r12
	addq	%rbx, %r11
	xorq	%r14, %r9
	movabsq	$-1568322642145848418, %rbx
	addq	%rbx, %r9
	movabsq	$-4849728007900573903, %r10
	movabsq	$-1642314245251606934, %rbx
	addq	%r10, %r12
	addq	%r13, %rbx
	movabsq	$4195444129992158507, %r14
	addq	%r9, %rbx
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r12, %rbx
	movabsq	$2553129884740551573, %r12
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r13
	movq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r9, %r12
	xorq	%r12, %rbx
	xorq	%r13, %r10
	xorq	%r9, %r13
	movq	%rbx, 616(%rsp)
	xorq	%r12, %r11
	movq	%r13, 584(%rsp)
	movq	%rbx, %r12
	movq	584(%rsp), %r9
	addq	600(%rsp), %r12
	addq	728(%rsp), %r9
	movq	%r11, 744(%rsp)
	movq	%r10, %r13
	addq	520(%rsp), %r11
	addq	632(%rsp), %r13
	movq	%r10, 664(%rsp)
	leaq	(%r12,%r9), %rbx
	addq	%rax, %r9
	leaq	(%r11,%r13), %r10
	addq	%rsi, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$4195444129992158507, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$11, %r11
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$23, %rbx
	rolq	$59, %r10
	movq	%r11, %r12
	movq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r12, 424(%rsp)
	movq	%r12, %r9
	movq	%rbx, %r12
	addq	504(%rsp), %r9
	addq	536(%rsp), %r12
	movq	%r11, 472(%rsp)
	movq	%r10, %r13
	addq	552(%rsp), %r11
	addq	648(%rsp), %r13
	movq	%rbx, 568(%rsp)
	movq	%r10, 456(%rsp)
	leaq	(%r12,%r9), %rbx
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rbx, %r11
	rolq	$11, %r11
	addq	%rsi, %r13
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r13, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$23, %rbx
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %r11
	xorq	%r13, %rbx
	movq	%r12, %r9
	movq	%rbx, 600(%rsp)
	addq	680(%rsp), %r9
	movq	%r11, %rbx
	movq	%r11, 520(%rsp)
	addq	488(%rsp), %rbx
	movq	%r10, %r13
	movq	600(%rsp), %r11
	addq	712(%rsp), %r13
	addq	696(%rsp), %r11
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%rbx), %r10
	addq	%rsi, %r13
	addq	%rcx, %rbx
	leaq	(%r11,%r9), %r12
	addq	%r14, %r11
	addq	%rax, %r9
	addq	%r10, %r11
	addq	%r10, %r9
	movabsq	$-2292595471992902602, %r14
	addq	%r12, %r13
	addq	%r12, %rbx
	rolq	$59, %r11
	rolq	$23, %r13
	rolq	$11, %rbx
	rolq	$37, %r9
	movq	%r11, %r12
	movq	%r13, %r10
	xorq	%rbx, %r10
	xorq	%r9, %r12
	xorq	%r12, %r13
	xorq	%r12, %rbx
	xorq	%r10, %r11
	movabsq	$8467826889434979867, %r12
	addq	%r14, %rbx
	xorq	%r10, %r9
	addq	%r12, %r11
	movabsq	$6028102484886760763, %r10
	movabsq	$-5006043190370284386, %r12
	addq	%r12, %r9
	addq	%r13, %r10
	leaq	(%rbx,%r11), %r12
	movabsq	$2699039428325208307, %r14
	addq	%r9, %r10
	addq	%rdi, %rbx
	addq	%r14, %r13
	addq	%r8, %r9
	addq	%rdx, %r11
	addq	%r12, %r9
	addq	%r10, %rbx
	addq	%r13, %r12
	rolq	$31, %rbx
	rolq	$19, %r12
	addq	%r11, %r10
	rolq	$7, %r9
	rolq	$53, %r10
	movq	%r12, %r13
	movq	%rbx, %r11
	xorq	%r9, %r13
	xorq	%r10, %r11
	xorq	%r13, %r10
	xorq	%rbx, %r13
	xorq	%r11, %r12
	xorq	%r9, %r11
	movq	%r13, 504(%rsp)
	movq	%r11, 696(%rsp)
	movq	%r12, 488(%rsp)
	movq	%r13, %r11
	addq	632(%rsp), %r12
	addq	520(%rsp), %r11
	movq	696(%rsp), %r9
	movq	600(%rsp), %r13
	addq	728(%rsp), %r9
	movq	%r10, 440(%rsp)
	addq	%r10, %r13
	leaq	(%r12,%r11), %r10
	leaq	(%r9,%r13), %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	rolq	$7, %r9
	addq	%r15, %r13
	addq	%rdi, %r11
	addq	%rdx, %r12
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$31, %r11
	rolq	$19, %r10
	addq	%r12, %rbx
	rolq	$53, %rbx
	movq	%r10, %r13
	movq	%r11, %r12
	xorq	%r9, %r13
	xorq	%rbx, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r11, %r13
	movq	%rbx, 680(%rsp)
	movq	%r12, 536(%rsp)
	movq	%r13, 648(%rsp)
	movq	%r13, %r11
	movq	%r10, %r12
	addq	472(%rsp), %r11
	addq	456(%rsp), %r12
	movq	%rbx, %r13
	movq	536(%rsp), %r9
	addq	568(%rsp), %r13
	addq	424(%rsp), %r9
	movq	%r10, 552(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rdx, %r12
	addq	%rdi, %r11
	leaq	0(%r13,%r9), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r10, 632(%rsp)
	movq	%r13, %r11
	addq	664(%rsp), %r10
	addq	744(%rsp), %r11
	movq	%r13, 520(%rsp)
	movq	%r12, 728(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	584(%rsp), %r13
	addq	616(%rsp), %r12
	movq	%rbx, 600(%rsp)
	leaq	(%r10,%r11), %rbx
	addq	%rdx, %r10
	addq	%rdi, %r11
	leaq	(%r12,%r13), %r9
	addq	%r15, %r12
	addq	%r8, %r13
	addq	%rbx, %r13
	addq	%r12, %rbx
	rolq	$19, %rbx
	rolq	$7, %r13
	addq	%r9, %r10
	movq	%rbx, %r12
	rolq	$53, %r10
	addq	%r9, %r11
	xorq	%r13, %r12
	rolq	$31, %r11
	movq	%r10, %r9
	movq	%r12, %r14
	xorq	%r11, %r9
	xorq	%r12, %r11
	xorq	%r10, %r14
	movabsq	$5953845371152580681, %r10
	xorq	%r9, %rbx
	addq	%r10, %r11
	movabsq	$-7646712092252898442, %r10
	xorq	%r13, %r9
	leaq	(%rbx,%r10), %r12
	movabsq	$-2842268575306187841, %r10
	movabsq	$-7946738593435294165, %rbx
	addq	%r10, %r9
	addq	%r14, %rbx
	addq	%r9, %rbx
	leaq	(%r11,%r12), %r10
	addq	%rcx, %r11
	addq	%rbx, %r11
	rolq	$11, %r11
	addq	%rsi, %r12
	addq	%rax, %r9
	addq	%r12, %rbx
	movabsq	$-3751294463443135658, %r12
	addq	%r10, %r9
	addq	%r14, %r12
	rolq	$37, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	movq	%r11, %r13
	movabsq	$4195444129992158507, %r14
	rolq	$59, %r10
	xorq	%rbx, %r13
	movq	%r10, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r9, %r12
	movq	%r13, 568(%rsp)
	movq	568(%rsp), %r9
	xorq	%r12, %rbx
	xorq	%r12, %r11
	addq	728(%rsp), %r9
	movq	%rbx, %r12
	addq	600(%rsp), %r12
	movq	%r11, 664(%rsp)
	movq	%r10, %r13
	addq	520(%rsp), %r11
	addq	632(%rsp), %r13
	movq	%rbx, 744(%rsp)
	movq	%r10, 584(%rsp)
	leaq	(%r12,%r9), %rbx
	addq	%rax, %r9
	leaq	(%r11,%r13), %r10
	addq	%rsi, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$4195444129992158507, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$11, %r11
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$23, %rbx
	rolq	$59, %r10
	movq	%r11, %r12
	movq	%r10, %r13
	xorq	%r9, %r13
	xorq	%rbx, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 456(%rsp)
	movq	%r10, %r13
	addq	648(%rsp), %r11
	addq	552(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 616(%rsp)
	addq	536(%rsp), %r9
	movq	%rbx, %r12
	addq	680(%rsp), %r12
	movq	%rbx, 712(%rsp)
	movq	%r10, 424(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rsi, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r13, %rbx
	xorq	%r9, %r12
	movq	%rbx, 600(%rsp)
	movq	%r11, 520(%rsp)
	movq	%r11, %rbx
	movq	%r12, %r9
	movq	600(%rsp), %r11
	addq	696(%rsp), %r9
	addq	440(%rsp), %r11
	movq	%r10, %r13
	addq	504(%rsp), %rbx
	addq	488(%rsp), %r13
	movq	%r12, 728(%rsp)
	movq	%r10, 632(%rsp)
	leaq	(%r11,%r9), %r12
	leaq	0(%r13,%rbx), %r10
	addq	%rcx, %rbx
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rsi, %r13
	addq	%r14, %r11
	addq	%r12, %r13
	addq	%rax, %r9
	addq	%r10, %r11
	rolq	$23, %r13
	addq	%r10, %r9
	rolq	$59, %r11
	rolq	$37, %r9
	movq	%r11, %r12
	movq	%r13, %r10
	xorq	%r9, %r12
	xorq	%rbx, %r10
	movabsq	$-824919486193887165, %r14
	xorq	%r12, %r13
	xorq	%r12, %rbx
	xorq	%r10, %r11
	movabsq	$-1914029582460860148, %r12
	addq	%r14, %rbx
	xorq	%r10, %r9
	addq	%r12, %r11
	movabsq	$-7632797540959622777, %r10
	movabsq	$6609752215332129920, %r12
	addq	%r12, %r9
	addq	%r13, %r10
	leaq	(%r11,%rbx), %r12
	movabsq	$7484883476188376383, %r14
	addq	%r9, %r10
	addq	%rdi, %rbx
	addq	%r14, %r13
	addq	%r8, %r9
	addq	%rdx, %r11
	addq	%r12, %r9
	addq	%r10, %rbx
	addq	%r13, %r12
	rolq	$31, %rbx
	rolq	$19, %r12
	addq	%r11, %r10
	rolq	$7, %r9
	rolq	$53, %r10
	movq	%r12, %r13
	movq	%rbx, %r11
	xorq	%r9, %r13
	movq	%rcx, %r14
	xorq	%r10, %r11
	xorq	%r13, %r10
	xorq	%rbx, %r13
	xorq	%r11, %r12
	xorq	%r9, %r11
	movq	%r13, 408(%rsp)
	movq	%r11, 472(%rsp)
	movq	%r12, 648(%rsp)
	movq	%r13, %r11
	addq	632(%rsp), %r12
	addq	520(%rsp), %r11
	movq	%r10, %r13
	movq	472(%rsp), %r9
	addq	600(%rsp), %r13
	addq	728(%rsp), %r9
	movq	%r10, 488(%rsp)
	leaq	(%r12,%r11), %r10
	addq	%rdx, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r13, %r11
	addq	456(%rsp), %r11
	movq	%r12, 440(%rsp)
	movq	%r10, %r12
	addq	424(%rsp), %r12
	movq	%r13, 680(%rsp)
	movq	440(%rsp), %r9
	movq	%rbx, %r13
	addq	616(%rsp), %r9
	addq	712(%rsp), %r13
	movq	%r10, 504(%rsp)
	movq	%rbx, 696(%rsp)
	leaq	(%r12,%r11), %r10
	leaq	(%r9,%r13), %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r15, %r13
	addq	%rdx, %r12
	addq	%rdi, %r11
	addq	%r13, %r10
	rolq	$7, %r9
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	movq	%r13, %r11
	xorq	%r9, %r12
	addq	664(%rsp), %r11
	movq	%r10, 632(%rsp)
	addq	584(%rsp), %r10
	movq	%r13, 520(%rsp)
	movq	%r12, %r13
	movq	%r12, 728(%rsp)
	addq	568(%rsp), %r13
	movq	%rbx, %r12
	addq	744(%rsp), %r12
	movq	%rbx, 600(%rsp)
	leaq	(%r10,%r11), %rbx
	addq	%rdx, %r10
	addq	%rdi, %r11
	leaq	(%r12,%r13), %r9
	addq	%r15, %r12
	addq	%r8, %r13
	addq	%rbx, %r12
	addq	%rbx, %r13
	rolq	$19, %r12
	rolq	$7, %r13
	addq	%r9, %r11
	movq	%r12, %rbx
	addq	%r10, %r9
	rolq	$31, %r11
	rolq	$53, %r9
	xorq	%r13, %rbx
	movq	%r9, %r10
	xorq	%rbx, %r9
	movq	%r9, 712(%rsp)
	xorq	%r11, %r10
	movabsq	$-1139829817207230181, %r9
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r13, %r10
	addq	%r11, %r9
	movabsq	$3054837738180890943, %r11
	movabsq	$4195444129992158507, %r13
	addq	%r11, %r12
	movabsq	$2588290990126348949, %r11
	leaq	(%r9,%rcx), %rcx
	leaq	(%r10,%r11), %rbx
	movabsq	$-938319195649413462, %r10
	addq	712(%rsp), %r10
	leaq	(%r12,%r9), %r11
	movq	%rsi, %r9
	leaq	(%r12,%rsi), %rsi
	addq	%rbx, %r10
	addq	%r10, %rcx
	addq	%r10, %rsi
	movq	%rax, %r10
	leaq	(%rbx,%rax), %rax
	movabsq	$3257124934342745045, %rbx
	addq	712(%rsp), %rbx
	rolq	$11, %rcx
	rolq	$23, %rsi
	addq	%r11, %rax
	rolq	$37, %rax
	addq	%rbx, %r11
	movq	%rcx, %rbx
	rolq	$59, %r11
	xorq	%rsi, %rbx
	movq	%r11, %r12
	xorq	%rbx, %r11
	xorq	%rax, %rbx
	xorq	%rax, %r12
	movq	%r11, 536(%rsp)
	movq	%rbx, 456(%rsp)
	xorq	%r12, %rsi
	xorq	%r12, %rcx
	movq	%r11, %r12
	movq	%rsi, 568(%rsp)
	movq	%rbx, %r11
	addq	600(%rsp), %rsi
	addq	728(%rsp), %r11
	addq	632(%rsp), %r12
	movq	%rcx, %rax
	addq	520(%rsp), %rax
	movq	%rcx, 552(%rsp)
	leaq	(%r11,%rsi), %rbx
	leaq	(%rax,%r12), %rcx
	addq	%r14, %rax
	addq	%r9, %r12
	addq	%rbx, %rax
	rolq	$11, %rax
	addq	%r12, %rbx
	addq	%r13, %rsi
	addq	%r10, %r11
	rolq	$23, %rbx
	addq	%rcx, %r11
	addq	%rsi, %rcx
	movq	%rbx, %r12
	rolq	$59, %rcx
	rolq	$37, %r11
	xorq	%rax, %r12
	movq	%rcx, %rsi
	xorq	%r12, %rcx
	xorq	%r11, %r12
	xorq	%r11, %rsi
	movq	%r12, 584(%rsp)
	movq	%rcx, %r12
	xorq	%rsi, %rbx
	xorq	%rsi, %rax
	addq	504(%rsp), %r12
	movq	%rbx, 616(%rsp)
	movq	%rax, 744(%rsp)
	movq	%rax, %rsi
	addq	696(%rsp), %rbx
	addq	680(%rsp), %rsi
	movq	584(%rsp), %rax
	addq	440(%rsp), %rax
	movq	%rcx, 664(%rsp)
	leaq	(%rsi,%r12), %rcx
	addq	%r9, %r12
	addq	%r14, %rsi
	leaq	(%rbx,%rax), %r11
	addq	%r13, %rbx
	addq	%r10, %rax
	addq	%rcx, %rax
	addq	%rbx, %rcx
	addq	%r11, %rsi
	addq	%r12, %r11
	rolq	$59, %rcx
	rolq	$23, %r11
	rolq	$37, %rax
	rolq	$11, %rsi
	movq	%rcx, %r12
	movq	%r11, %rbx
	xorq	%rax, %r12
	xorq	%rsi, %rbx
	xorq	%r12, %r11
	xorq	%r12, %rsi
	xorq	%rbx, %rcx
	movq	%r11, 600(%rsp)
	xorq	%rax, %rbx
	movq	%rsi, %r11
	movq	%rcx, %r12
	addq	408(%rsp), %r11
	addq	648(%rsp), %r12
	movq	%rsi, 520(%rsp)
	movq	%rbx, %rax
	movq	600(%rsp), %rsi
	addq	472(%rsp), %rax
	addq	488(%rsp), %rsi
	movq	%rcx, 632(%rsp)
	movq	%rbx, 728(%rsp)
	leaq	(%r12,%r11), %rcx
	addq	%r9, %r12
	addq	%r14, %r11
	leaq	(%rsi,%rax), %rbx
	addq	%r13, %rsi
	addq	%r10, %rax
	addq	%rcx, %rsi
	addq	%rcx, %rax
	addq	%rbx, %r12
	rolq	$59, %rsi
	addq	%rbx, %r11
	rolq	$23, %r12
	rolq	$37, %rax
	movq	%rsi, %rbx
	xorq	%rax, %rbx
	rolq	$11, %r11
	movq	%r12, %rcx
	xorq	%r11, %rcx
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	movabsq	$-6097248013946911484, %rbx
	xorq	%rcx, %rsi
	xorq	%rcx, %rax
	addq	%rbx, %r11
	movabsq	$3174302594670681997, %rbx
	movabsq	$-8739574512844769069, %rcx
	addq	%rbx, %rsi
	movabsq	$-496885038275669880, %rbx
	addq	%r12, %rcx
	addq	%rbx, %rax
	leaq	(%r11,%rsi), %rbx
	movq	%r12, 712(%rsp)
	addq	%rax, %rcx
	addq	%r8, %rax
	movabsq	$6378106504303230091, %r12
	addq	%rbx, %rax
	rolq	$7, %rax
	addq	712(%rsp), %r12
	addq	%rdx, %rsi
	addq	%rdi, %r11
	addq	%rcx, %r11
	addq	%rsi, %rcx
	rolq	$53, %rcx
	rolq	$31, %r11
	addq	%r12, %rbx
	movq	%rcx, %rsi
	rolq	$19, %rbx
	xorq	%r11, %rsi
	movq	%rbx, %r12
	xorq	%rsi, %rbx
	xorq	%rax, %rsi
	xorq	%rax, %r12
	movq	%rbx, 488(%rsp)
	xorq	%r12, %rcx
	xorq	%r11, %r12
	movq	%rcx, 440(%rsp)
	movq	%r12, 472(%rsp)
	movq	%rsi, 648(%rsp)
	addq	632(%rsp), %rbx
	movq	%r12, %rsi
	movq	648(%rsp), %rax
	addq	520(%rsp), %rsi
	movq	%rcx, %r12
	addq	728(%rsp), %rax
	addq	600(%rsp), %r12
	leaq	(%rsi,%rbx), %rcx
	addq	%rdx, %rbx
	addq	%rdi, %rsi
	leaq	(%rax,%r12), %r11
	addq	%r15, %r12
	addq	%r8, %rax
	addq	%rcx, %rax
	addq	%r12, %rcx
	addq	%r11, %rsi
	addq	%rbx, %r11
	rolq	$19, %rcx
	rolq	$53, %r11
	rolq	$7, %rax
	rolq	$31, %rsi
	movq	%rcx, %r12
	movq	%r11, %rbx
	xorq	%rsi, %rbx
	xorq	%rax, %r12
	xorq	%r12, %r11
	xorq	%rbx, %rcx
	xorq	%rsi, %r12
	xorq	%rax, %rbx
	movq	%r12, 712(%rsp)
	movq	%r12, %rsi
	movq	%rbx, 696(%rsp)
	addq	744(%rsp), %rsi
	movq	%rcx, %rbx
	movq	696(%rsp), %rax
	addq	664(%rsp), %rbx
	movq	%r11, %r12
	addq	584(%rsp), %rax
	addq	616(%rsp), %r12
	movq	%r11, 504(%rsp)
	movq	%rcx, 680(%rsp)
	leaq	(%rbx,%rsi), %rcx
	addq	%rdx, %rbx
	addq	%rdi, %rsi
	leaq	(%r12,%rax), %r11
	addq	%r15, %r12
	addq	%r8, %rax
	addq	%rcx, %rax
	addq	%r12, %rcx
	addq	%r11, %rsi
	addq	%rbx, %r11
	rolq	$19, %rcx
	rolq	$53, %r11
	rolq	$7, %rax
	rolq	$31, %rsi
	movq	%rcx, %r12
	movq	%r11, %rbx
	xorq	%rax, %r12
	xorq	%rsi, %rbx
	xorq	%r12, %r11
	xorq	%rbx, %rcx
	xorq	%rsi, %r12
	xorq	%rax, %rbx
	movq	%rcx, 632(%rsp)
	movq	%r12, %rsi
	addq	536(%rsp), %rcx
	addq	552(%rsp), %rsi
	movq	%r12, 520(%rsp)
	movq	%rbx, %r12
	addq	456(%rsp), %r12
	movq	%rbx, 728(%rsp)
	movq	%r11, %rbx
	addq	568(%rsp), %rbx
	movq	%r11, 600(%rsp)
	leaq	(%rcx,%rsi), %r11
	addq	%r12, %r8
	addq	%r11, %r8
	leaq	(%rbx,%r12), %rax
	rolq	$7, %r8
	addq	%r15, %rbx
	addq	%rcx, %rdx
	addq	%rbx, %r11
	addq	%rdi, %rsi
	rolq	$19, %r11
	addq	%rax, %rsi
	addq	%rdx, %rax
	rolq	$53, %rax
	movq	%r11, %rcx
	rolq	$31, %rsi
	xorq	%r8, %rcx
	movq	%rax, %rdx
	xorq	%rsi, %rdx
	movq	%rcx, %rbx
	xorq	%rcx, %rsi
	xorq	%rax, %rbx
	xorq	%rdx, %r8
	movabsq	$853475092736589577, %rax
	movabsq	$-4925106476758491821, %rcx
	addq	%rax, %rsi
	xorq	%rdx, %r11
	leaq	(%r8,%rcx), %rdi
	movabsq	$-5486504877919021346, %rax
	movabsq	$1906713845121804688, %rcx
	addq	%r11, %rax
	addq	%rbx, %rcx
	movq	%rsi, InternalState+96(%rip)
	leaq	(%rsi,%rax), %rdx
	movq	%rax, InternalState+104(%rip)
	movq	%rcx, InternalState+120(%rip)
	addq	%r9, %rax
	addq	%rdi, %rcx
	addq	%r14, %rsi
	addq	%rcx, %rsi
	movq	%rdi, InternalState+112(%rip)
	addq	%rax, %rcx
	leaq	(%rdi,%r10), %rax
	movabsq	$6102157975113963195, %rdi
	rolq	$23, %rcx
	addq	%rbx, %rdi
	rolq	$11, %rsi
	movq	%rcx, %r8
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	632(%rsp), %rdi
	rolq	$59, %rdx
	rolq	$37, %rax
	xorq	%rsi, %r8
	movq	%rdx, %r11
	xorq	%rax, %r11
	xorq	%r11, %rcx
	xorq	%rsi, %r11
	xorq	%r8, %rdx
	addq	520(%rsp), %r11
	addq	%rdx, %rdi
	addq	600(%rsp), %rcx
	movq	728(%rsp), %rdx
	xorq	%r8, %rax
	movq	%rdi, InternalState+72(%rip)
	addq	%rax, %rdx
	leaq	(%r11,%rdi), %rsi
	movq	%r11, InternalState+64(%rip)
	leaq	(%rcx,%rdx), %r8
	movq	%rdx, InternalState+80(%rip)
	leaq	(%r11,%r14), %rax
	movq	%rcx, InternalState+88(%rip)
	addq	%r13, %rcx
	addq	%r9, %rdi
	leaq	(%rcx,%rsi), %r11
	addq	%r8, %rax
	addq	%r10, %rdx
	addq	%rdi, %r8
	addq	%rsi, %rdx
	rolq	$11, %rax
	rolq	$23, %r8
	rolq	$59, %r11
	rolq	$37, %rdx
	movq	%r11, %rsi
	movq	%r8, %rcx
	movq	-72(%rsp), %r15
	xorq	%rdx, %rsi
	xorq	%rax, %rcx
	xorq	%rsi, %r8
	xorq	%rsi, %rax
	addq	504(%rsp), %r8
	addq	712(%rsp), %rax
	xorq	%rcx, %rdx
	addq	696(%rsp), %rdx
	xorq	%rcx, %r11
	addq	680(%rsp), %r11
	movq	%r8, InternalState+56(%rip)
	leaq	(%rdx,%r8), %rdi
	leaq	(%rax,%r14), %rsi
	movq	%rdx, InternalState+48(%rip)
	leaq	(%r11,%rax), %rcx
	movq	%r11, InternalState+40(%rip)
	addq	%r9, %r11
	addq	%rdi, %rsi
	addq	%r10, %rdx
	addq	%r11, %rdi
	rolq	$11, %rsi
	rolq	$23, %rdi
	addq	%rcx, %rdx
	addq	%r13, %r8
	rolq	$37, %rdx
	movq	%rax, InternalState+32(%rip)
	addq	%r8, %rcx
	movq	%rdi, %r8
	shrq	$6, %r15
	rolq	$59, %rcx
	xorq	%rsi, %r8
	movq	%rax, 520(%rsp)
	movq	%rcx, %r11
	xorq	%r8, %rcx
	addq	488(%rsp), %rcx
	xorq	%rdx, %r11
	xorq	%r8, %rdx
	addq	648(%rsp), %rdx
	xorq	%r11, %rdi
	xorq	%r11, %rsi
	addq	440(%rsp), %rdi
	addq	472(%rsp), %rsi
	testq	%r15, %r15
	movq	%r15, -64(%rsp)
	movq	%rcx, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	%rdi, InternalState+24(%rip)
	movq	%rsi, InternalState(%rip)
	vmovdqa	InternalState(%rip), %ymm0
	vmovdqa	%ymm0, 904(%rsp)
	vmovdqa	InternalState+32(%rip), %ymm0
	vmovdqa	%ymm0, 936(%rsp)
	vmovdqa	InternalState+64(%rip), %ymm0
	vmovdqa	%ymm0, 968(%rsp)
	vmovdqa	InternalState+96(%rip), %ymm0
	vmovdqa	%ymm0, 1000(%rsp)
	je	.L49
	movq	912(%rsp), %r12
	movq	920(%rsp), %r8
	movq	928(%rsp), %r11
	movq	792(%rsp), %rdx
	movq	800(%rsp), %rcx
	movq	808(%rsp), %rbx
	movq	%r12, %rax
	movq	%r8, -56(%rsp)
	movq	816(%rsp), %rsi
	movq	%r11, -48(%rsp)
	addq	%r9, %rax
	addq	%r8, %r11
	addq	%r11, %rax
	movq	-48(%rsp), %r15
	addq	%r10, %r8
	rorq	$41, %rax
	movq	824(%rsp), %rdi
	movq	%r11, 328(%rsp)
	movq	%rax, 504(%rsp)
	movq	832(%rsp), %rax
	addq	%r13, %r15
	movq	784(%rsp), %r11
	movq	%r12, 360(%rsp)
	movq	%r8, 296(%rsp)
	movq	904(%rsp), %r12
	movq	776(%rsp), %r8
	movq	%r15, 280(%rsp)
	movq	%rax, 488(%rsp)
	movq	936(%rsp), %r15
	movq	944(%rsp), %rax
	movq	%rdx, 456(%rsp)
	movq	952(%rsp), %rdx
	movq	%rcx, 440(%rsp)
	movq	%rbx, 424(%rsp)
	movq	%rsi, 376(%rsp)
	movq	%rdi, 408(%rsp)
	movq	%r8, 392(%rsp)
	movq	%r11, 472(%rsp)
	movq	%r12, 344(%rsp)
	movq	%r15, -32(%rsp)
	movq	%rax, 8(%rsp)
	movq	%rdx, -8(%rsp)
	movq	960(%rsp), %rcx
	movq	1024(%rsp), %rax
	movq	976(%rsp), %rsi
	movq	992(%rsp), %r8
	movq	984(%rsp), %rdi
	movq	%rcx, -16(%rsp)
	addq	%rdx, %rcx
	movq	8(%rsp), %rdx
	movq	%rax, -40(%rsp)
	addq	-32(%rsp), %rdx
	movq	-8(%rsp), %rax
	movq	%rsi, 80(%rsp)
	movq	8(%rsp), %rsi
	movq	%rcx, 56(%rsp)
	movq	-32(%rsp), %rcx
	movq	%r8, 64(%rsp)
	addq	%r10, %rax
	movq	%rdx, 40(%rsp)
	movq	%rdi, 72(%rsp)
	addq	%rdx, %rax
	movq	-16(%rsp), %rdx
	addq	%r9, %rsi
	addq	56(%rsp), %rsi
	addq	%r14, %rcx
	addq	56(%rsp), %rcx
	rorq	$27, %rax
	movq	968(%rsp), %rbx
	movq	1000(%rsp), %r11
	addq	%r13, %rdx
	addq	40(%rsp), %rdx
	movq	1016(%rsp), %r15
	movq	1008(%rsp), %r12
	rorq	$41, %rsi
	rorq	$53, %rcx
	movq	%rbx, 88(%rsp)
	movq	%rsi, %rdi
	movq	%r11, -24(%rsp)
	movq	%r15, 16(%rsp)
	rorq	$5, %rdx
	xorq	%rcx, %rdi
	movq	%r12, 24(%rsp)
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	64(%rsp), %rax
	addq	72(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	%rbx, %rcx
	movq	%rsi, 128(%rsp)
	movq	80(%rsp), %rsi
	addq	%r14, %rcx
	movq	%rdx, 120(%rsp)
	movq	%rdi, 248(%rsp)
	addq	%rax, %rcx
	movq	80(%rsp), %rdx
	movq	64(%rsp), %rdi
	addq	%r9, %rsi
	rorq	$53, %rcx
	movq	%r8, 264(%rsp)
	addq	%rax, %rsi
	movq	72(%rsp), %rax
	addq	%rbx, %rdx
	rorq	$41, %rsi
	addq	%r13, %rdi
	addq	%r11, %r12
	addq	%r10, %rax
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rsi, %rdi
	rorq	$5, %rdx
	rorq	$27, %rax
	xorq	%rcx, %rdi
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	%r15, %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	addq	%r10, %rax
	movq	%rsi, 232(%rsp)
	movq	-40(%rsp), %rcx
	addq	%r12, %rax
	movq	24(%rsp), %rsi
	movq	%rdx, 200(%rsp)
	rorq	$27, %rax
	movq	-40(%rsp), %rdx
	movq	%r8, 216(%rsp)
	addq	%r15, %rcx
	movq	%rdi, 184(%rsp)
	movq	-88(%rsp), %rbx
	movq	%rcx, 32(%rsp)
	addq	%r9, %rsi
	movq	%r11, %rcx
	addq	32(%rsp), %rsi
	addq	%r14, %rcx
	addq	%r13, %rdx
	addq	32(%rsp), %rcx
	addq	%r12, %rdx
	movq	%r12, 48(%rsp)
	rorq	$5, %rdx
	movq	%rbx, 600(%rsp)
	movq	%rdx, %r8
	rorq	$41, %rsi
	xorq	%rax, %r8
	rorq	$53, %rcx
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%rcx, %rdi
	xorq	%rcx, %r8
	movq	%rsi, 168(%rsp)
	xorq	%rdi, %rdx
	movq	-64(%rsp), %rsi
	xorq	%rax, %rdi
	addq	520(%rsp), %rsi
	movq	%r8, 152(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rdi, 112(%rsp)
	movq	%rsi, 312(%rsp)
	.p2align 4,,10
	.p2align 3
.L10:
	addq	$1, 520(%rsp)
	movq	344(%rsp), %rcx
	movabsq	$-8247349341179448980, %rdi
	xorq	520(%rsp), %rcx
	movq	360(%rsp), %rsi
	movabsq	$7860495443403156170, %r9
	movq	296(%rsp), %rax
	movq	504(%rsp), %rdx
	movabsq	$-6792583489299504353, %r12
	movabsq	$-3833335565246798826, %r10
	movabsq	$2580067509209331373, %r14
	movabsq	$-1457182779415996031, %r11
	movabsq	$-6802927476391842224, %r13
	addq	%rcx, %rsi
	addq	328(%rsp), %rcx
	addq	%rsi, %rax
	addq	280(%rsp), %rsi
	rolq	$37, %rax
	addq	%rdi, %rcx
	movq	504(%rsp), %rdi
	rolq	$59, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r8
	xorq	%rcx, %rdx
	xorq	%rax, %r8
	xorq	%rdx, %rsi
	xorq	%rdx, %rax
	xorq	%r8, %rcx
	xorq	%r8, %rdi
	leaq	(%rcx,%rsi), %r8
	leaq	(%rdi,%rax), %rdx
	addq	%r12, %rdi
	addq	%r14, %rsi
	addq	%r11, %rax
	addq	%r13, %rcx
	addq	%r9, %r8
	addq	%r10, %rdx
	movabsq	$-6657276164713376882, %r9
	leaq	(%rdi,%r8), %r15
	addq	%rdx, %rsi
	addq	%r8, %rax
	addq	%rdx, %rcx
	rolq	$53, %rsi
	rolq	$7, %rax
	rolq	$19, %r15
	rolq	$31, %rcx
	movq	%rsi, %rdx
	movq	%r15, %rdi
	xorq	%rcx, %rdx
	movabsq	$-5426079245872290139, %r8
	xorq	%rax, %rdi
	movq	232(%rsp), %r10
	movabsq	$-3329063056561552456, %r11
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	%r15, %r12
	addq	120(%rsp), %r12
	movq	%rdx, 696(%rsp)
	movq	%rdi, %rdx
	addq	264(%rsp), %rdx
	movq	696(%rsp), %rax
	movq	%rsi, %rbx
	addq	248(%rsp), %rax
	addq	128(%rsp), %rbx
	movq	%rsi, 632(%rsp)
	movabsq	$-5426079245872290139, %r14
	movq	%rdi, 728(%rsp)
	movabsq	$-3329063056561552456, %rdi
	movq	%r15, 712(%rsp)
	leaq	(%r12,%rdx), %rsi
	movabsq	$-1087367646907149102, %r15
	addq	%r9, %r12
	addq	%r8, %rdx
	movq	200(%rsp), %r8
	leaq	(%rbx,%rax), %rcx
	addq	%rdi, %rbx
	addq	%r15, %rax
	addq	%rsi, %rbx
	addq	%rsi, %rax
	rolq	$19, %rbx
	addq	%rcx, %r12
	rolq	$7, %rax
	addq	%rcx, %rdx
	rolq	$53, %r12
	movq	%rbx, %r13
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r12, %rdi
	xorq	%rdx, %rdi
	xorq	%r13, %r12
	xorq	%rdx, %r13
	movq	216(%rsp), %rdx
	xorq	%rdi, %rbx
	xorq	%rax, %rdi
	movq	184(%rsp), %rax
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r13, %rdx
	leaq	(%r8,%rdx), %rsi
	addq	%rdi, %rax
	leaq	(%r10,%rax), %rcx
	addq	%r15, %rax
	addq	%r11, %r10
	addq	%rsi, %rax
	addq	%rsi, %r10
	movq	168(%rsp), %r15
	rolq	$7, %rax
	rolq	$19, %r10
	addq	%r9, %r8
	addq	%r14, %rdx
	addq	%rcx, %r8
	movq	%r10, %r11
	addq	%rcx, %rdx
	rolq	$53, %r8
	xorq	%rax, %r11
	rolq	$31, %rdx
	movq	%r8, %r9
	movq	152(%rsp), %rcx
	xorq	%r11, %r8
	xorq	%rdx, %r9
	xorq	%rdx, %r11
	movq	136(%rsp), %rdx
	addq	%r8, %r15
	movq	112(%rsp), %rsi
	movq	%r15, 744(%rsp)
	xorq	%r9, %r10
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	addq	%r9, %rsi
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rsi
	xorq	%r14, %rax
	movabsq	$-3210636887397455352, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 680(%rsp)
	addq	%r8, %rsi
	movq	%r15, 648(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 616(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 744(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	712(%rsp), %r14
	rolq	$37, %rax
	addq	%rsi, %r10
	xorq	%rdx, %r9
	addq	%rcx, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r9, %r10
	xorq	%rax, %r9
	xorq	%rax, %r11
	leaq	(%r9,%rdi), %rax
	leaq	(%r10,%rbx), %rsi
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movabsq	$7667772426219706969, %rbx
	leaq	(%r11,%r13), %rdx
	addq	%r8, %r12
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%rax), %rdi
	addq	%r13, %r12
	leaq	(%rsi,%rdx), %rcx
	addq	%rbx, %rsi
	addq	%r15, %rdx
	addq	%rdi, %rdx
	addq	%rsi, %rdi
	movabsq	$6220970056051541820, %rsi
	rolq	$23, %rdi
	addq	%rsi, %rax
	addq	%rcx, %r12
	rolq	$11, %rdx
	addq	%rcx, %rax
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	movq	%r12, %r13
	xorq	%rdx, %rbx
	xorq	%rax, %r13
	movq	632(%rsp), %rsi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	696(%rsp), %rax
	movq	728(%rsp), %r15
	addq	%r12, %r14
	xorq	%r13, %rdi
	movq	%r14, 728(%rsp)
	xorq	%rdx, %r13
	movq	728(%rsp), %rdx
	addq	%rbx, %rax
	addq	%rdi, %rsi
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r13, %r15
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	728(%rsp), %r15
	rolq	$11, %rcx
	addq	%r14, %r15
	movabsq	$6220970056051541820, %r14
	addq	%r14, %rax
	movabsq	$4195444129992158507, %r14
	rolq	$23, %r15
	addq	%r14, %rsi
	addq	%rdx, %rax
	movq	%r15, %r14
	addq	%rdx, %rsi
	rolq	$37, %rax
	xorq	%rcx, %r14
	rolq	$59, %rsi
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	rolq	$31, %rcx
	xorq	%rcx, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	addq	%rsi, %rdi
	addq	%r12, %rcx
	movq	%r15, 728(%rsp)
	movq	%rdx, 712(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 632(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 696(%rsp)
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	movabsq	$-5426079245872290139, %r14
	addq	%rbx, %rdi
	leaq	(%rdi,%rdx), %r12
	movabsq	$-5426079245872290139, %rdi
	rolq	$7, %rax
	addq	%rdi, %r13
	movabsq	$-6657276164713376882, %rdi
	addq	%rcx, %rdi
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %rdi
	movq	%r12, %r13
	rolq	$53, %rdi
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%rdi, %rbx
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r11
	addq	%rdi, %r8
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r10), %rcx
	addq	%rbx, %r9
	leaq	(%r8,%r9), %rsi
	addq	%r15, %r9
	movq	680(%rsp), %r15
	leaq	(%rcx,%r11), %rdx
	addq	%r14, %r11
	leaq	(%r9,%rdx), %rax
	movabsq	$-3329063056561552456, %r9
	addq	%r9, %r8
	leaq	(%r8,%rdx), %r10
	leaq	(%r11,%rsi), %rdx
	movabsq	$-6657276164713376882, %r8
	addq	%rcx, %r8
	rolq	$7, %rax
	movq	648(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	744(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	616(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 744(%rsp)
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	addq	%r9, %rsi
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 680(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 648(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 616(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r9
	addq	%rsi, %r10
	rolq	$23, %r8
	leaq	(%r9,%rcx), %rax
	addq	%rcx, %r10
	rolq	$11, %rdx
	rolq	$59, %r10
	movq	%r8, %r9
	movq	%r14, 744(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	712(%rsp), %r14
	xorq	%r11, %r8
	xorq	%rdx, %r11
	xorq	%r9, %r10
	leaq	(%r8,%rdi), %rsi
	xorq	%rax, %r9
	addq	%r10, %r12
	addq	%r11, %r13
	addq	%r9, %rbx
	movabsq	$7667772426219706969, %rdi
	leaq	(%rsi,%rbx), %rax
	leaq	(%r12,%r13), %rcx
	addq	%r12, %rdi
	movabsq	$6220970056051541820, %r12
	addq	%r15, %r13
	movq	728(%rsp), %r15
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %rdi
	addq	%rsi, %r12
	leaq	(%rbx,%rcx), %rax
	rolq	$23, %rdi
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	632(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	696(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 728(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	728(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	rolq	$23, %r15
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 632(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 728(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 712(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 696(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rsi, %r13
	addq	%rbx, %rdi
	addq	%rdx, %rdi
	leaq	0(%r13,%rcx), %rdx
	movabsq	$-6657276164713376882, %r13
	addq	%r13, %r12
	rolq	$19, %rdi
	rolq	$7, %rax
	addq	%r12, %rcx
	rolq	$31, %rdx
	movq	%rdi, %r12
	rolq	$53, %rcx
	xorq	%rax, %r12
	movq	%rcx, %rsi
	xorq	%r12, %rcx
	xorq	%rdx, %r12
	xorq	%rdx, %rsi
	addq	%r12, %r11
	addq	%rcx, %r8
	xorq	%rsi, %rdi
	xorq	%rax, %rsi
	addq	%rdi, %r10
	addq	%rsi, %r9
	leaq	(%r10,%r11), %rdx
	leaq	(%r8,%r9), %rbx
	addq	%r14, %r8
	addq	%r15, %r9
	movabsq	$-5426079245872290139, %r15
	leaq	(%r8,%rdx), %r14
	movq	%r13, %r8
	addq	%r15, %r11
	addq	%r10, %r8
	leaq	(%r9,%rdx), %rax
	leaq	(%r11,%rbx), %rdx
	addq	%rbx, %r8
	rolq	$19, %r14
	movq	616(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	744(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	680(%rsp), %rax
	movq	648(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 744(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	744(%rsp), %r11
	rolq	$7, %rax
	addq	%rbx, %r11
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r9
	addq	%r10, %rdx
	movq	%r11, %rbx
	addq	%r10, %r9
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%rbx, %r9
	xorq	%rdx, %r10
	xorq	%rbx, %rdx
	xorq	%r10, %rax
	xorq	%r10, %r11
	movabsq	$1649971794476935487, %r10
	leaq	(%r9,%rax), %rbx
	addq	%r10, %rbx
	leaq	(%rdx,%r11), %r10
	movq	%r10, 744(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	744(%rsp), %r10
	movq	%r10, 744(%rsp)
	movabsq	$9059564915322872455, %r10
	addq	%r10, %rdx
	movabsq	$-7724133909308953704, %r10
	addq	%rbx, %rdx
	addq	%r10, %r11
	movabsq	$3257124934342745045, %r10
	rolq	$11, %rdx
	addq	%rbx, %r11
	addq	%r10, %r9
	movabsq	$8809261046177890769, %rbx
	addq	744(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	744(%rsp), %rax
	movq	%r11, %r10
	xorq	%rdx, %r10
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%rax, %rbx
	xorq	%rax, %r10
	addq	%r9, %r14
	xorq	%rbx, %r11
	xorq	%rdx, %rbx
	addq	%r10, %r13
	addq	%rbx, %r15
	addq	%r11, %r8
	movq	%r11, 680(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 648(%rsp)
	movq	%r9, 616(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 744(%rsp)
	movabsq	$-8247349341179448980, %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$7667772426219706969, %r9
	addq	%rbx, %r13
	addq	%r10, %r8
	addq	%rdx, %r15
	addq	%r14, %r9
	leaq	(%r15,%rax), %rdx
	movabsq	$-8247349341179448980, %r14
	addq	%rax, %r9
	leaq	0(%r13,%r11), %rax
	addq	%r8, %r11
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$11, %rdx
	rolq	$37, %rax
	movq	%r11, %r8
	movq	%r9, %r10
	xorq	%rax, %r8
	xorq	%rdx, %r10
	movabsq	$7667772426219706969, %r15
	xorq	%r8, %r9
	xorq	%r10, %r11
	xorq	%rdx, %r8
	xorq	%rax, %r10
	addq	%r9, %rcx
	addq	%r8, %r12
	leaq	(%r10,%rsi), %rax
	addq	%r11, %rdi
	leaq	(%rdi,%r12), %r13
	addq	%r14, %r12
	addq	%r15, %rdi
	leaq	(%rcx,%rax), %rsi
	addq	%rbx, %rax
	movabsq	$4195444129992158507, %rbx
	addq	%rbx, %rcx
	addq	%r13, %rax
	movq	728(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	addq	%rcx, %r13
	rolq	$23, %rsi
	movq	712(%rsp), %r12
	rolq	$59, %r13
	rolq	$11, %rdx
	movq	%rsi, %rbx
	movq	%r13, %rdi
	xorq	%rdx, %rbx
	rolq	$37, %rax
	xorq	%rbx, %r13
	xorq	%rax, %rdi
	xorq	%rax, %rbx
	addq	%r13, %r12
	xorq	%rdi, %rsi
	xorq	%rdx, %rdi
	movq	%r12, 728(%rsp)
	movq	696(%rsp), %rax
	addq	%rdi, %r15
	movq	632(%rsp), %r12
	movq	728(%rsp), %r14
	movabsq	$-8247349341179448980, %rdx
	addq	%rbx, %rax
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%rdx, %r15
	leaq	(%r12,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	728(%rsp), %r15
	rolq	$11, %rdx
	addq	%rcx, %r15
	movabsq	$6220970056051541820, %rcx
	addq	%rcx, %rax
	rolq	$23, %r15
	leaq	(%rax,%r14), %rcx
	movabsq	$4195444129992158507, %rax
	rolq	$37, %rcx
	addq	%rax, %r12
	addq	%r14, %r12
	movq	%r15, %r14
	rolq	$59, %r12
	xorq	%rdx, %r14
	movq	%r12, %rax
	xorq	%r14, %r12
	xorq	%rcx, %rax
	xorq	%r14, %rcx
	movabsq	$-2922945419276229487, %r14
	xorq	%rax, %rdx
	xorq	%rax, %r15
	leaq	(%rdx,%r12), %rax
	addq	%r14, %rax
	leaq	(%r15,%rcx), %r14
	movq	%r14, 728(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1584252685182818982, %r14
	addq	%r14, %rcx
	movabsq	$6378106504303230091, %r14
	addq	%r14, %r15
	movabsq	$-3482973570042694885, %r14
	addq	%rax, %rcx
	addq	%r14, %r12
	addq	%r15, %rax
	addq	728(%rsp), %r12
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	728(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r12
	movq	%r12, %r14
	xorq	%r15, %r12
	rolq	$31, %rdx
	addq	%r12, %rsi
	movq	%r12, 632(%rsp)
	xorq	%rdx, %r14
	xorq	%r15, %rdx
	movq	%r12, preCompInternalState(%rip)
	xorq	%r14, %rax
	movq	%r14, %r15
	addq	%rdx, %rdi
	xorq	%rcx, %r15
	addq	%rax, %r13
	movabsq	$-1087367646907149102, %rcx
	leaq	0(%r13,%rdi), %r14
	addq	%r15, %rbx
	movq	%rdx, preCompInternalState+8(%rip)
	leaq	(%rsi,%rbx), %r12
	addq	%rcx, %rbx
	movq	%rax, preCompInternalState+16(%rip)
	leaq	(%rbx,%r14), %rcx
	movabsq	$-3329063056561552456, %rbx
	movq	%r15, preCompInternalState+24(%rip)
	addq	%rbx, %rsi
	movabsq	$-6657276164713376882, %rbx
	addq	%rbx, %r13
	addq	%r14, %rsi
	movabsq	$-5426079245872290139, %r14
	leaq	0(%r13,%r12), %rbx
	addq	%r14, %rdi
	rolq	$19, %rsi
	addq	%r12, %rdi
	rolq	$7, %rcx
	movq	%rsi, %r14
	rolq	$53, %rbx
	rolq	$31, %rdi
	xorq	%rcx, %r14
	movq	%rbx, %r12
	xorq	%r14, %rbx
	xorq	%rdi, %r14
	xorq	%rdi, %r12
	addq	%rbx, %r9
	addq	%r14, %r8
	xorq	%r12, %rsi
	xorq	%rcx, %r12
	movabsq	$-3329063056561552456, %rdi
	addq	%r12, %r10
	addq	%rsi, %r11
	movq	%rsi, 568(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 664(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r14, 584(%rsp)
	addq	%rbx, %rdi
	addq	%r11, %rcx
	addq	%rbx, %rsi
	rolq	$19, %rdi
	rolq	$53, %rcx
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r10
	movq	%rcx, %r9
	xorq	%rsi, %r10
	xorq	%r8, %r9
	movq	648(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	616(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	744(%rsp), %r10
	addq	680(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 536(%rsp)
	movabsq	$-1087367646907149102, %r14
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	movq	%r12, 552(%rsp)
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	rolq	$19, %r11
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$7, %r10
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %r9
	xorq	%r13, %rbx
	xorq	%r12, %r11
	xorq	%r12, %r10
	movabsq	$-5486504877919021346, %r13
	movabsq	$853475092736589577, %r12
	movabsq	$-4925106476758491821, %r14
	movabsq	$1906713845121804688, %rcx
	addq	%r11, %r13
	addq	%r9, %rcx
	addq	%r10, %r14
	addq	%rbx, %r12
	movq	%r13, InternalState+104(%rip)
	movq	%r14, InternalState+112(%rip)
	movq	%r12, InternalState+96(%rip)
	addq	%rcx, %r14
	addq	%r13, %r12
	movq	%rcx, InternalState+120(%rip)
	movabsq	$2181267548300685623, %r13
	movabsq	$-7393874248442859403, %rcx
	addq	%rcx, %rbx
	addq	%r13, %r11
	movabsq	$1295863579293049999, %rcx
	addq	%r14, %rbx
	addq	%r11, %r14
	movabsq	$6102157975113963195, %r11
	addq	%r11, %r9
	addq	%rcx, %r10
	rolq	$23, %r14
	addq	%r12, %r10
	addq	%r9, %r12
	rolq	$11, %rbx
	rolq	$59, %r12
	rolq	$37, %r10
	movq	%r14, %r9
	movq	%r12, %r11
	xorq	%rbx, %r9
	xorq	%r10, %r11
	xorq	%r9, %r12
	xorq	%r10, %r9
	xorq	%r11, %r14
	xorq	%rbx, %r11
	movq	%r12, 696(%rsp)
	movq	%r14, 728(%rsp)
	movq	%r14, preCompInternalState+96(%rip)
	movq	%r14, %rcx
	movq	%r11, 712(%rsp)
	movq	%r11, preCompInternalState+104(%rip)
	addq	%r9, %rsi
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r9, 680(%rsp)
	addq	%r11, %r8
	addq	536(%rsp), %rcx
	addq	%r12, %rdi
	movq	%r9, preCompInternalState+120(%rip)
	movabsq	$-8247349341179448980, %r11
	movabsq	$7667772426219706969, %rbx
	leaq	(%rdi,%r8), %r10
	addq	%r8, %r11
	addq	%rdi, %rbx
	movabsq	$4195444129992158507, %r12
	movq	%r8, InternalState+64(%rip)
	movq	%rdi, InternalState+72(%rip)
	leaq	(%rcx,%rsi), %r9
	addq	%rcx, %r12
	movq	%rsi, InternalState+80(%rip)
	movq	%rcx, InternalState+88(%rip)
	addq	%r9, %r11
	addq	%r9, %rbx
	movabsq	$6220970056051541820, %r9
	addq	%rsi, %r9
	rolq	$11, %r11
	rolq	$23, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$37, %r9
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r13
	xorq	%r12, %r9
	movq	552(%rsp), %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%rbx, preCompInternalState+64(%rip)
	addq	664(%rsp), %rbx
	movabsq	$-8247349341179448980, %r13
	movq	%r11, preCompInternalState+72(%rip)
	addq	568(%rsp), %r10
	addq	%r9, %r12
	addq	584(%rsp), %r11
	movq	%r9, preCompInternalState+88(%rip)
	movq	%r12, InternalState+48(%rip)
	leaq	(%rbx,%r12), %r9
	movq	%rbx, InternalState+56(%rip)
	movq	%r10, InternalState+40(%rip)
	movq	%r11, InternalState+32(%rip)
	leaq	(%r10,%r11), %r14
	addq	%r13, %r11
	leaq	(%r11,%r9), %r13
	movabsq	$7667772426219706969, %r11
	addq	%r11, %r10
	movabsq	$4195444129992158507, %r11
	addq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$6220970056051541820, %r10
	rolq	$23, %r9
	addq	%r12, %r10
	addq	%r14, %r11
	rolq	$11, %r13
	addq	%r14, %r10
	rolq	$59, %r11
	movq	%r9, %r12
	rolq	$37, %r10
	movq	%r11, %rbx
	xorq	%r13, %r12
	xorq	%r10, %rbx
	movq	600(%rsp), %r14
	xorq	%r12, %r11
	xorq	%r12, %r10
	movq	632(%rsp), %r12
	xorq	%rbx, %r9
	xorq	%r13, %rbx
	leaq	(%r10,%r15), %r13
	addq	%rbx, %rdx
	addq	%r11, %rax
	movq	%r9, preCompInternalState+32(%rip)
	addq	%r9, %r12
	movq	%rbx, preCompInternalState+40(%rip)
	movq	%r11, preCompInternalState+48(%rip)
	movq	%r10, preCompInternalState+56(%rip)
	movq	%rdx, InternalState(%rip)
	movq	%rax, InternalState+8(%rip)
	movq	%r12, InternalState+24(%rip)
	movq	%r13, InternalState+16(%rip)
	xorq	(%r14), %rdx
	movq	%rdx, InternalState(%rip)
	xorq	8(%r14), %rax
	movq	%rax, InternalState+8(%rip)
	xorq	16(%r14), %r13
	movq	%rax, 664(%rsp)
	movq	%r13, InternalState+16(%rip)
	xorq	24(%r14), %r12
	movq	%r12, InternalState+24(%rip)
	xorq	32(%r14), %r8
	leaq	0(%r13,%r12), %r15
	movq	%r8, InternalState+64(%rip)
	xorq	40(%r14), %rdi
	movq	%rdi, InternalState+72(%rip)
	xorq	48(%r14), %rsi
	movq	%rsi, InternalState+80(%rip)
	xorq	56(%r14), %rcx
	movq	%rax, %r14
	movabsq	$-8247349341179448980, %rax
	addq	%rdx, %r14
	addq	%rdx, %rax
	leaq	(%rax,%r15), %rdx
	movabsq	$7667772426219706969, %rax
	addq	664(%rsp), %rax
	rolq	$11, %rdx
	addq	%rax, %r15
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r13
	movabsq	$4195444129992158507, %rax
	rolq	$23, %r15
	addq	%rax, %r12
	addq	%r14, %r13
	movq	%r15, %rax
	addq	%r12, %r14
	rolq	$37, %r13
	xorq	%rdx, %rax
	rolq	$59, %r14
	movq	%r14, %r12
	xorq	%rax, %r14
	xorq	%r13, %rax
	xorq	%r13, %r12
	xorq	%r12, %rdx
	xorq	%r12, %r15
	movabsq	$7860495443403156170, %r12
	leaq	(%rdx,%r14), %r13
	addq	%r12, %r13
	leaq	(%r15,%rax), %r12
	movq	%r12, 744(%rsp)
	movabsq	$-3833335565246798826, %r12
	addq	744(%rsp), %r12
	movq	%r12, 744(%rsp)
	movabsq	$-1457182779415996031, %r12
	addq	%r12, %rax
	movabsq	$-6792583489299504353, %r12
	addq	%r12, %r15
	addq	%r13, %rax
	movabsq	$2580067509209331373, %r12
	addq	%r13, %r15
	movabsq	$-6802927476391842224, %r13
	rolq	$7, %rax
	rolq	$19, %r15
	addq	%r13, %rdx
	addq	744(%rsp), %rdx
	addq	%r12, %r14
	movq	744(%rsp), %r12
	addq	%r14, %r12
	movq	%r15, %r14
	rolq	$31, %rdx
	rolq	$53, %r12
	xorq	%rax, %r14
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rdx, %r14
	xorq	%rdx, %r13
	movq	%r12, 632(%rsp)
	addq	632(%rsp), %r9
	xorq	%r13, %r15
	addq	%r14, %rbx
	xorq	%rax, %r13
	movq	%r15, %r12
	addq	%r13, %r10
	movq	%r14, 648(%rsp)
	addq	%r11, %r12
	movq	%r15, 616(%rsp)
	movabsq	$-1087367646907149102, %r14
	leaq	(%r12,%rbx), %rdx
	movabsq	$-3329063056561552456, %r15
	movq	%r13, 744(%rsp)
	leaq	(%r9,%r10), %r13
	addq	%r14, %r10
	addq	%r15, %r9
	leaq	(%r10,%rdx), %rax
	leaq	(%r9,%rdx), %r11
	movabsq	$-5426079245872290139, %rdx
	addq	%rdx, %rbx
	movabsq	$-8247349341179448980, %r9
	movabsq	$7667772426219706969, %r10
	leaq	(%rbx,%r13), %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r12
	rolq	$7, %rax
	movq	%r11, %rbx
	addq	%r12, %r13
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r13
	movabsq	$4195444129992158507, %r14
	movabsq	$6220970056051541820, %r12
	movq	%r13, %r15
	xorq	%rbx, %r13
	xorq	%rdx, %rbx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	xorq	%r15, %r11
	xorq	%rax, %r15
	leaq	(%rdi,%r8), %rax
	addq	%r9, %r8
	addq	%rdx, %r8
	rolq	$11, %r8
	addq	%r10, %rdi
	addq	%r14, %rcx
	addq	%r12, %rsi
	addq	%rax, %rcx
	addq	%rdx, %rdi
	addq	%rax, %rsi
	rolq	$59, %rcx
	rolq	$23, %rdi
	rolq	$37, %rsi
	movq	%rcx, %r9
	movq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%r8, %r10
	movabsq	$-1087367646907149102, %rax
	xorq	%r9, %r8
	xorq	%r9, %rdi
	xorq	%r10, %rcx
	leaq	(%rbx,%r8), %rdx
	leaq	0(%r13,%rdi), %r9
	xorq	%r10, %rsi
	addq	%r11, %rcx
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %rdi
	leaq	(%rcx,%rdx), %r14
	leaq	(%r9,%rsi), %r12
	addq	%rsi, %rax
	addq	%rdi, %rdx
	movabsq	$-3329063056561552456, %rsi
	movabsq	$-6657276164713376882, %rdi
	addq	%rsi, %r9
	addq	%rcx, %rdi
	addq	%r14, %rax
	addq	%r14, %r9
	addq	%r12, %rdi
	addq	%r12, %rdx
	rolq	$53, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	xorq	%rdx, %r8
	movq	712(%rsp), %rcx
	xorq	%r10, %rdi
	movq	696(%rsp), %r12
	xorq	%rdx, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	movq	728(%rsp), %rax
	movq	680(%rsp), %r14
	addq	%r10, %rcx
	addq	%r9, %r12
	addq	%rdi, %rax
	leaq	(%r12,%rcx), %rsi
	movq	%rax, 728(%rsp)
	addq	%r8, %r14
	movq	%rax, %rdx
	movabsq	$-1087367646907149102, %rax
	addq	%r14, %rdx
	addq	%rax, %r14
	leaq	(%r14,%rsi), %rax
	movabsq	$-3329063056561552456, %r14
	addq	728(%rsp), %r14
	rolq	$7, %rax
	addq	%r14, %rsi
	movabsq	$-5426079245872290139, %r14
	addq	%r14, %rcx
	movabsq	$-6657276164713376882, %r14
	rolq	$19, %rsi
	addq	%r14, %r12
	addq	%rdx, %rcx
	movq	%rsi, %r14
	addq	%r12, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r14
	rolq	$53, %rdx
	movq	%rdx, %r12
	xorq	%r14, %rdx
	xorq	%rcx, %r12
	xorq	%r14, %rcx
	xorq	%r12, %rax
	xorq	%r12, %rsi
	movabsq	$-3210636887397455352, %r12
	leaq	(%rdx,%rax), %r14
	addq	%r12, %r14
	leaq	(%rcx,%rsi), %r12
	movq	%r12, 728(%rsp)
	movabsq	$5597446114060141266, %r12
	addq	728(%rsp), %r12
	movq	%r12, 728(%rsp)
	movabsq	$2199824780781266189, %r12
	addq	%r12, %rcx
	movabsq	$2818044418319133066, %r12
	addq	%r12, %rsi
	addq	%r14, %rcx
	movabsq	$2553129884740551573, %r12
	addq	%r14, %rsi
	movabsq	$4652647413905693402, %r14
	rolq	$11, %rcx
	rolq	$23, %rsi
	addq	%r14, %rax
	addq	728(%rsp), %rax
	addq	%r12, %rdx
	addq	728(%rsp), %rdx
	movq	%rsi, %r12
	xorq	%rcx, %r12
	rolq	$37, %rax
	rolq	$59, %rdx
	movq	%rdx, %r14
	xorq	%r12, %rdx
	xorq	%rax, %r12
	xorq	%rax, %r14
	addq	%r12, %r8
	addq	%rdx, %r9
	xorq	%r14, %rsi
	xorq	%rcx, %r14
	movq	%rsi, 728(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r14, 712(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r14
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r14, %r10
	movq	%rdx, 696(%rsp)
	addq	%rax, %rdi
	leaq	(%r10,%rax), %rdx
	movabsq	$4195444129992158507, %r9
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r8
	addq	%rsi, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	addq	%rcx, %r9
	rolq	$11, %rdx
	rolq	$59, %r9
	movq	%rdi, %r8
	movq	%r12, 680(%rsp)
	rolq	$37, %rax
	movq	%r9, %r10
	xorq	%rdx, %r8
	xorq	%rax, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	addq	%r9, %r11
	addq	%r10, %rbx
	addq	%r8, %r15
	addq	%rdi, %r13
	leaq	0(%r13,%r15), %rax
	leaq	(%r11,%rbx), %rcx
	addq	%r14, %rbx
	movabsq	$6220970056051541820, %rsi
	movabsq	$4195444129992158507, %r12
	movq	616(%rsp), %r14
	leaq	(%rbx,%rax), %rdx
	movabsq	$7667772426219706969, %rbx
	addq	%rsi, %r15
	addq	%rbx, %r11
	addq	%r13, %r12
	movq	632(%rsp), %rsi
	addq	%rax, %r11
	addq	%rcx, %r12
	leaq	(%r15,%rcx), %rax
	rolq	$23, %r11
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%r11, %rbx
	rolq	$37, %rax
	movq	%r12, %r13
	xorq	%rdx, %rbx
	xorq	%rax, %r13
	movq	648(%rsp), %r15
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	744(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r12, %r14
	addq	%r11, %rsi
	addq	%r13, %r15
	movabsq	$-8247349341179448980, %rcx
	addq	%rbx, %rax
	movq	%r14, 664(%rsp)
	addq	%r15, %r14
	leaq	(%rsi,%rax), %rdx
	addq	%rcx, %r15
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	664(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 744(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	744(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	744(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 632(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 648(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 616(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 744(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	rolq	$7, %rax
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r12
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r13
	movabsq	$-6657276164713376882, %r11
	addq	%rcx, %r11
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %r11
	movq	%r12, %r13
	rolq	$53, %r11
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r11, %rbx
	xorq	%r13, %r11
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r10
	addq	%r11, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r9), %rcx
	addq	%rbx, %r8
	leaq	(%rdi,%r8), %rsi
	addq	%r14, %rdi
	addq	%r15, %r8
	leaq	(%rcx,%r10), %rdx
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %r10
	leaq	(%rdi,%rdx), %r9
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r8,%rdx), %rax
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %rdx
	movq	712(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	680(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	696(%rsp), %rdx
	xorq	%rax, %r8
	movq	728(%rsp), %rax
	addq	%r10, %rcx
	addq	%r9, %rdx
	addq	%r8, %rsi
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 728(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	728(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r14, %rsi
	addq	%r15, %rcx
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	movabsq	$3378701480745353979, %r15
	addq	%r14, %rdx
	addq	%r15, %rax
	addq	728(%rsp), %rdx
	addq	728(%rsp), %rax
	rolq	$11, %rcx
	rolq	$23, %rsi
	movq	%rsi, %r14
	rolq	$37, %rax
	rolq	$59, %rdx
	xorq	%rcx, %r14
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r8
	addq	%rdx, %r9
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rdx, 696(%rsp)
	movq	%rsi, 728(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 712(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r9
	leaq	(%r10,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	addq	%rsi, %r9
	addq	%rax, %r8
	addq	%rcx, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	rolq	$59, %r9
	rolq	$11, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	movq	%r14, 680(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	616(%rsp), %r14
	xorq	%rax, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%r10, %rdi
	addq	%r8, %rbx
	xorq	%rdx, %r10
	leaq	(%rdi,%r11), %rsi
	addq	%r9, %r12
	addq	%r10, %r13
	leaq	(%r12,%r13), %rcx
	addq	%r15, %r13
	movabsq	$7667772426219706969, %r11
	leaq	(%rsi,%rbx), %rax
	addq	%r12, %r11
	movabsq	$6220970056051541820, %r12
	movq	648(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	rolq	$11, %rdx
	addq	%rax, %r11
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	rolq	$23, %r11
	leaq	(%rbx,%rcx), %rax
	addq	%rsi, %r12
	movq	%r11, %rbx
	addq	%rcx, %r12
	xorq	%rdx, %rbx
	rolq	$37, %rax
	rolq	$59, %r12
	movabsq	$-8247349341179448980, %rcx
	movq	%r12, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	addq	%r12, %r14
	xorq	%rax, %r13
	movq	%r14, 664(%rsp)
	movq	744(%rsp), %rax
	xorq	%r13, %r11
	movq	632(%rsp), %rsi
	xorq	%rdx, %r13
	addq	%r13, %r15
	addq	%rbx, %rax
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%r11, %rsi
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	664(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%rax, %rdx
	xorq	%rdx, %r15
	xorq	%rdx, %rcx
	xorq	%r14, %rsi
	leaq	(%rcx,%rsi), %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	744(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	744(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 632(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 648(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 616(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 744(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r12
	movabsq	$-5426079245872290139, %r11
	rolq	$7, %rax
	addq	%r11, %r13
	movabsq	$-6657276164713376882, %r11
	leaq	0(%r13,%rsi), %rdx
	addq	%rcx, %r11
	rolq	$19, %r12
	movq	%r12, %r13
	rolq	$31, %rdx
	addq	%rsi, %r11
	xorq	%rax, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %r11
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r10
	addq	%r11, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r9), %rcx
	addq	%rbx, %r8
	leaq	(%rdi,%r8), %rsi
	addq	%r14, %rdi
	addq	%r15, %r8
	leaq	(%rcx,%r10), %rdx
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %r10
	leaq	(%rdi,%rdx), %r9
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r8,%rdx), %rax
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %rdx
	movq	712(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	680(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	696(%rsp), %rdx
	xorq	%rax, %r8
	movq	728(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 728(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	rolq	$7, %rax
	addq	728(%rsp), %rsi
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$1649971794476935487, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1915007920973660762, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$9059564915322872455, %r14
	addq	%r14, %rcx
	movabsq	$-7724133909308953704, %r14
	addq	%r14, %rsi
	movabsq	$3257124934342745045, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$8809261046177890769, %r15
	addq	728(%rsp), %rdx
	addq	%r15, %rax
	addq	728(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%rax, %r15
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	movq	%rsi, 728(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r8
	addq	%rdx, %r9
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 712(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movq	%rdx, 696(%rsp)
	movabsq	$4195444129992158507, %r9
	leaq	(%r10,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r8
	addq	%rsi, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	addq	%rcx, %r9
	rolq	$11, %rdx
	rolq	$59, %r9
	movq	%rdi, %r8
	movq	%r14, 680(%rsp)
	rolq	$37, %rax
	movq	%r9, %r10
	xorq	%rdx, %r8
	xorq	%rax, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	addq	%r9, %r12
	leaq	(%rdi,%r11), %rsi
	addq	%r10, %r13
	addq	%r8, %rbx
	movabsq	$7667772426219706969, %r11
	leaq	(%r12,%r13), %rcx
	addq	%r15, %r13
	leaq	(%rsi,%rbx), %rax
	addq	%r12, %r11
	movabsq	$6220970056051541820, %r12
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	movq	648(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %r11
	leaq	(%rbx,%rcx), %rax
	addq	%rsi, %r12
	rolq	$23, %r11
	movq	632(%rsp), %rsi
	rolq	$11, %rdx
	rolq	$37, %rax
	addq	%rcx, %r12
	rolq	$59, %r12
	movq	%r11, %rbx
	movq	616(%rsp), %r14
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movabsq	$-8247349341179448980, %rcx
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	744(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movq	%r14, 664(%rsp)
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	664(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2922945419276229487, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 744(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1584252685182818982, %r14
	addq	%r14, %rax
	movabsq	$6378106504303230091, %r14
	addq	%rdx, %rax
	addq	%r14, %r15
	movabsq	$-3482973570042694885, %r14
	addq	%r15, %rdx
	movabsq	$6923416813890349993, %r15
	addq	%r14, %rsi
	addq	%r15, %rcx
	addq	744(%rsp), %rsi
	addq	744(%rsp), %rcx
	rolq	$19, %rdx
	rolq	$7, %rax
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$31, %rcx
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%r15, 648(%rsp)
	addq	648(%rsp), %r13
	xorq	%rcx, %r14
	xorq	%r14, %rdx
	movq	%r14, %r15
	addq	%rsi, %r11
	xorq	%rax, %r15
	addq	%rdx, %r12
	movq	%rdx, 616(%rsp)
	addq	%r15, %rbx
	movabsq	$-1087367646907149102, %rax
	movq	%rsi, 632(%rsp)
	leaq	(%r12,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%rax, %rbx
	movabsq	$-3329063056561552456, %rax
	movabsq	$-1087367646907149102, %r14
	leaq	(%rbx,%rdx), %rcx
	addq	%r11, %rax
	movabsq	$-6657276164713376882, %rbx
	addq	%rdx, %rax
	addq	%rbx, %r12
	movabsq	$-5426079245872290139, %rdx
	addq	%r13, %rdx
	addq	%rsi, %r12
	rolq	$19, %rax
	addq	%rsi, %rdx
	rolq	$53, %r12
	rolq	$7, %rcx
	rolq	$31, %rdx
	movq	%rax, %r11
	movq	%r12, %rsi
	xorq	%rcx, %r11
	xorq	%rdx, %rsi
	xorq	%rsi, %rax
	xorq	%r11, %r12
	xorq	%rcx, %rsi
	addq	%rsi, %r8
	addq	%r12, %rdi
	movq	%rsi, 664(%rsp)
	movabsq	$-1087367646907149102, %rsi
	xorq	%r11, %rdx
	leaq	(%rdi,%r8), %rcx
	addq	%r8, %rsi
	movabsq	$-3329063056561552456, %r8
	addq	%rdx, %r10
	addq	%rax, %r9
	addq	%r8, %rdi
	movabsq	$-5426079245872290139, %r8
	leaq	(%r9,%r10), %r11
	addq	%r10, %r8
	addq	%rbx, %r9
	addq	%rcx, %r8
	addq	%r9, %rcx
	movq	712(%rsp), %rbx
	addq	%r11, %rdi
	rolq	$53, %rcx
	addq	%r11, %rsi
	rolq	$19, %rdi
	rolq	$31, %r8
	movq	%rcx, %r9
	xorq	%r8, %r9
	rolq	$7, %rsi
	movq	%rdi, %r10
	xorq	%rsi, %r10
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	696(%rsp), %r9
	xorq	%r10, %rcx
	xorq	%r10, %r8
	movq	728(%rsp), %r11
	movq	680(%rsp), %r10
	addq	%r8, %rbx
	movq	%r12, 744(%rsp)
	addq	%rdi, %r9
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	addq	%rcx, %r11
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	movabsq	$-3329063056561552456, %r14
	addq	%r13, %r10
	rolq	$7, %r10
	addq	%r14, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$19, %r11
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r9
	xorq	%r12, %r11
	xorq	%r12, %r10
	movabsq	$853475092736589577, %r12
	addq	%rbx, %r12
	movabsq	$-4925106476758491821, %r14
	movabsq	$-5486504877919021346, %r13
	movq	%r12, 712(%rsp)
	movabsq	$1906713845121804688, %r12
	addq	%r10, %r14
	addq	%r9, %r12
	addq	%r11, %r13
	addq	%r12, %r14
	movq	712(%rsp), %r12
	addq	%r13, %r12
	movabsq	$-7393874248442859403, %r13
	addq	%r13, %rbx
	movabsq	$2181267548300685623, %r13
	addq	%r13, %r11
	addq	%r14, %rbx
	movabsq	$6102157975113963195, %r13
	addq	%r11, %r14
	movabsq	$1295863579293049999, %r11
	addq	%r13, %r9
	addq	%r11, %r10
	rolq	$11, %rbx
	rolq	$23, %r14
	addq	%r12, %r10
	addq	%r9, %r12
	movq	%r14, %r9
	rolq	$37, %r10
	rolq	$59, %r12
	xorq	%rbx, %r9
	movq	%r12, %r13
	xorq	%r9, %r12
	movabsq	$-8247349341179448980, %r11
	xorq	%r10, %r13
	xorq	%r9, %r10
	addq	%r12, %rdi
	xorq	%r13, %r14
	addq	%r10, %rsi
	xorq	%r13, %rbx
	addq	%r14, %rcx
	addq	%rbx, %r8
	movabsq	$7667772426219706969, %rbx
	leaq	(%rcx,%rsi), %r9
	addq	%r8, %r11
	addq	%rdi, %rbx
	leaq	(%rdi,%r8), %r10
	movabsq	$4195444129992158507, %r12
	movabsq	$-8247349341179448980, %r14
	addq	%r9, %r11
	addq	%r9, %rbx
	movabsq	$6220970056051541820, %r9
	addq	%rcx, %r12
	addq	%rsi, %r9
	rolq	$23, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$11, %r11
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r9
	addq	664(%rsp), %r9
	xorq	%r13, %rbx
	addq	744(%rsp), %rbx
	xorq	%r13, %r11
	xorq	%r12, %r10
	addq	%rdx, %r11
	movabsq	$6220970056051541820, %rdx
	addq	%rax, %r10
	movabsq	$7667772426219706969, %rax
	leaq	(%r10,%r11), %r13
	addq	%r14, %r11
	addq	%rax, %r10
	leaq	(%rbx,%r9), %r12
	addq	%rdx, %r9
	addq	%r8, 424(%rsp)
	addq	%r13, %r9
	addq	%rdi, 376(%rsp)
	addq	%r12, %r11
	addq	%r12, %r10
	movabsq	$4195444129992158507, %r12
	addq	%r12, %rbx
	rolq	$23, %r10
	rolq	$11, %r11
	addq	%rbx, %r13
	rolq	$37, %r9
	movq	%r10, %rax
	rolq	$59, %r13
	xorq	%r11, %rax
	movq	%r13, %rdx
	xorq	%rax, %r13
	addq	616(%rsp), %r13
	xorq	%r9, %rdx
	xorq	%rax, %r9
	addq	%r13, 472(%rsp)
	xorq	%rdx, %r10
	xorq	%rdx, %r11
	addq	632(%rsp), %r10
	addq	648(%rsp), %r11
	addq	%r15, %r9
	addq	%r10, 440(%rsp)
	addq	%r11, 392(%rsp)
	addq	%r9, 456(%rsp)
	addq	%rsi, 408(%rsp)
	addq	%rcx, 488(%rsp)
	addq	$64, 600(%rsp)
	movq	312(%rsp), %r13
	cmpq	%r13, 520(%rsp)
	jne	.L10
	vmovq	456(%rsp), %xmm8
	movq	-64(%rsp), %rdx
	vmovq	392(%rsp), %xmm9
	vpinsrq	$1, 472(%rsp), %xmm9, %xmm1
	vmovq	408(%rsp), %xmm11
	salq	$3, %rdx
	vpinsrq	$1, 440(%rsp), %xmm8, %xmm0
	vmovq	424(%rsp), %xmm13
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 376(%rsp), %xmm13, %xmm1
	vmovdqa	%ymm0, 776(%rsp)
	vpinsrq	$1, 488(%rsp), %xmm11, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 808(%rsp)
.L9:
	movq	-72(%rsp), %rax
	andl	$63, %eax
	jne	.L11
	movq	824(%rsp), %rdx
	movq	832(%rsp), %rdi
	movq	784(%rsp), %rax
	movq	792(%rsp), %rcx
	movq	776(%rsp), %rbx
	movq	800(%rsp), %rsi
	movq	808(%rsp), %r9
	movq	816(%rsp), %r8
	movq	%rdx, 312(%rsp)
	movq	%rdi, 328(%rsp)
	movq	%rcx, %rdi
	movq	312(%rsp), %r11
	movq	328(%rsp), %r12
	movq	%rbx, %rdx
	movq	%r9, 280(%rsp)
	movq	%rax, 648(%rsp)
	movq	%rax, %r9
	movq	%rcx, 680(%rsp)
	movq	%rbx, 616(%rsp)
	movq	%rsi, %r10
	movq	%rsi, 696(%rsp)
	movq	%r8, 296(%rsp)
.L12:
	xorq	-56(%rsp), %rdi
	xorq	-48(%rsp), %r10
	movabsq	$-8247349341179448980, %rcx
	xorq	344(%rsp), %rdx
	xorq	360(%rsp), %r9
	movabsq	$-1376848230519552085, %r13
	xorq	80(%rsp), %r8
	movq	280(%rsp), %rsi
	movabsq	$-9209400399786843361, %r14
	xorq	88(%rsp), %rsi
	xorq	72(%rsp), %r11
	movabsq	$-369815132508846929, %r15
	leaq	(%r10,%rdi), %rax
	xorq	64(%rsp), %r12
	movabsq	$-3463520432737951897, %rbx
	vpxor	%xmm2, %xmm2, %xmm2
	movq	%r8, 80(%rsp)
	leaq	(%rdx,%r9), %r8
	addq	%rcx, %rdx
	movq	%rsi, 88(%rsp)
	leaq	(%rdx,%rax), %rsi
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %r9
	movq	%r11, 72(%rsp)
	movq	%r12, 64(%rsp)
	leaq	(%r9,%rax), %r11
	movabsq	$4195444129992158507, %r9
	movabsq	$6220970056051541820, %rax
	addq	%r9, %r10
	addq	%rax, %rdi
	rolq	$11, %rsi
	leaq	(%r10,%r8), %r12
	rolq	$23, %r11
	addq	%r8, %rdi
	rolq	$37, %rdi
	movq	%r11, %r10
	rolq	$59, %r12
	xorq	%rsi, %r10
	movq	%r12, %r8
	xorq	%r10, %r12
	xorq	%rdi, %r10
	xorq	%rdi, %r8
	addq	%r14, %r12
	addq	%r15, %r10
	xorq	%r8, %rsi
	xorq	%r8, %r11
	movabsq	$-1087367646907149102, %r8
	addq	%r13, %rsi
	movabsq	$-6792583489299504353, %r13
	addq	%r11, %rbx
	leaq	(%rsi,%r12), %rdi
	addq	%r13, %r11
	addq	%r10, %rbx
	addq	%r8, %r10
	movabsq	$-3329063056561552456, %r15
	leaq	(%r11,%rdi), %r14
	addq	%rdi, %r10
	movabsq	$-5426079245872290139, %rdi
	rolq	$7, %r10
	vpxor	%xmm1, %xmm1, %xmm1
	rolq	$19, %r14
	addq	%rdi, %rsi
	leaq	(%rsi,%rbx), %r11
	movabsq	$-6657276164713376882, %rsi
	addq	%rsi, %r12
	vpxor	%xmm7, %xmm7, %xmm7
	addq	%rbx, %r12
	rolq	$31, %r11
	movq	%r14, %rbx
	rolq	$53, %r12
	xorq	%r10, %rbx
	movq	%r12, %r13
	xorq	%rbx, %r12
	xorq	%r11, %rbx
	xorq	%r11, %r13
	movq	8(%rsp), %r11
	movq	%rbx, 664(%rsp)
	xorq	%r13, %r14
	xorq	%r10, %r13
	movq	-32(%rsp), %rbx
	movq	%r13, 568(%rsp)
	movq	-16(%rsp), %r13
	movq	-8(%rsp), %r10
	addq	%rdx, %r11
	addq	56(%rsp), %r11
	addq	%rcx, %rbx
	addq	56(%rsp), %rbx
	movq	%r12, 744(%rsp)
	addq	%r9, %r13
	addq	40(%rsp), %r13
	movq	%r14, 584(%rsp)
	addq	%rax, %r10
	addq	40(%rsp), %r10
	rolq	$23, %r11
	vpxor	%xmm6, %xmm6, %xmm6
	rolq	$11, %rbx
	movq	%r11, %r12
	rolq	$59, %r13
	xorq	%rbx, %r12
	rolq	$37, %r10
	movq	%r13, %r14
	xorq	%r12, %r13
	xorq	%r10, %r14
	xorq	%r12, %r10
	addq	568(%rsp), %r10
	xorq	%r14, %rbx
	xorq	%r11, %r14
	addq	744(%rsp), %r14
	addq	664(%rsp), %rbx
	addq	584(%rsp), %r13
	vpxor	%xmm5, %xmm5, %xmm5
	vpxor	%xmm4, %xmm4, %xmm4
	leaq	(%r10,%r14), %r12
	addq	%r8, %r10
	addq	%r15, %r14
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r12, %rbx
	addq	%r13, %r12
	addq	%r11, %r10
	rolq	$53, %r12
	addq	%r14, %r11
	rolq	$31, %rbx
	rolq	$19, %r11
	movq	%r12, %r13
	rolq	$7, %r10
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	movq	%r11, 504(%rsp)
	xorq	%rbx, %r14
	movq	64(%rsp), %r10
	movq	88(%rsp), %rbx
	addq	72(%rsp), %r10
	movq	80(%rsp), %r11
	movq	%r12, 552(%rsp)
	movq	%r13, 488(%rsp)
	addq	%rcx, %rbx
	movq	80(%rsp), %r12
	movq	64(%rsp), %r13
	addq	88(%rsp), %r12
	addq	%rdx, %r11
	movq	%r14, 536(%rsp)
	addq	%r10, %rbx
	addq	%r10, %r11
	movq	72(%rsp), %r10
	addq	%r9, %r13
	rolq	$23, %r11
	rolq	$11, %rbx
	vpxor	%xmm3, %xmm3, %xmm3
	addq	%rax, %r10
	addq	%r12, %r13
	addq	%r12, %r10
	rolq	$59, %r13
	movq	%r11, %r12
	rolq	$37, %r10
	movq	%r13, %r14
	xorq	%r10, %r14
	xorq	%rbx, %r12
	xorq	%r12, %r13
	xorq	%r14, %rbx
	addq	504(%rsp), %r13
	addq	536(%rsp), %rbx
	xorq	%r12, %r10
	xorq	%r11, %r14
	addq	488(%rsp), %r10
	addq	552(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	rolq	$19, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$7, %r10
	rolq	$53, %r12
	movq	%r11, %r14
	rolq	$31, %rbx
	xorq	%r10, %r14
	movq	%r12, %r13
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	movq	%r12, 600(%rsp)
	xorq	%r13, %r11
	movq	-24(%rsp), %r12
	xorq	%r10, %r13
	movq	24(%rsp), %r10
	movq	%r11, 728(%rsp)
	movq	-40(%rsp), %rbx
	movq	16(%rsp), %r11
	addq	%rcx, %r12
	addq	32(%rsp), %r12
	movq	%r13, 712(%rsp)
	addq	%rdx, %r10
	addq	32(%rsp), %r10
	movq	%r14, 632(%rsp)
	rolq	$11, %r12
	rolq	$23, %r10
	addq	%rax, %r11
	addq	%r9, %rbx
	addq	48(%rsp), %rbx
	addq	48(%rsp), %r11
	movq	%r10, %r14
	xorq	%r12, %r14
	rolq	$59, %rbx
	rolq	$37, %r11
	movq	%rbx, %r13
	xorq	%r14, %rbx
	addq	728(%rsp), %rbx
	xorq	%r11, %r13
	xorq	%r14, %r11
	movq	600(%rsp), %r14
	xorq	%r13, %r12
	addq	632(%rsp), %r12
	addq	712(%rsp), %r11
	xorq	%r13, %r10
	addq	%r10, %r14
	movq	%r12, %r13
	leaq	(%r14,%r11), %r10
	addq	%r8, %r11
	addq	%rbx, %r13
	movq	%r12, 472(%rsp)
	addq	%rsi, %rbx
	leaq	(%r11,%r13), %r12
	movq	472(%rsp), %r11
	addq	%r15, %r14
	addq	%r13, %r14
	leaq	(%rbx,%r10), %r13
	rolq	$19, %r14
	rolq	$7, %r12
	addq	%rdi, %r11
	rolq	$53, %r13
	movq	%r14, %rbx
	addq	%r10, %r11
	xorq	%r12, %rbx
	movq	%r13, %r10
	rolq	$31, %r11
	xorq	%rbx, %r13
	xorq	%r11, %r10
	xorq	%r11, %rbx
	movabsq	$-7999569951748836447, %r11
	addq	%r11, %rbx
	xorq	%r10, %r14
	movabsq	$-4849728007900573903, %r11
	addq	%r11, %r14
	xorq	%r12, %r10
	movabsq	$-1568322642145848418, %r12
	addq	%r12, %r10
	movabsq	$-1642314245251606934, %r12
	leaq	(%rbx,%r14), %r11
	addq	%r13, %r12
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r10, %r12
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$2553129884740551573, %r14
	addq	%r14, %r13
	addq	%r11, %r10
	rolq	$23, %r12
	addq	%r13, %r11
	rolq	$37, %r10
	rolq	$11, %rbx
	rolq	$59, %r11
	movq	%r12, %r14
	movq	%r11, %r13
	xorq	%rbx, %r14
	xorq	%r10, %r13
	xorq	%r14, %r11
	xorq	%r10, %r14
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r14, 424(%rsp)
	movq	%r12, %r13
	movq	424(%rsp), %r10
	addq	600(%rsp), %r13
	addq	712(%rsp), %r10
	movq	%rbx, 456(%rsp)
	movq	%r11, %r14
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r14
	movq	%r12, 472(%rsp)
	movq	%r11, 440(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$11, %rbx
	rolq	$23, %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	rolq	$37, %r10
	movq	%r12, %r13
	rolq	$59, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r10, %r14
	movq	%r13, 360(%rsp)
	movq	%r13, %r10
	xorq	%r14, %r12
	xorq	%r14, %rbx
	addq	488(%rsp), %r10
	movq	%rbx, 392(%rsp)
	movq	%r11, %r14
	addq	536(%rsp), %rbx
	addq	504(%rsp), %r14
	movq	%r12, %r13
	addq	552(%rsp), %r13
	movq	%r12, 408(%rsp)
	movq	%r11, 376(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rax, %r10
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r9, %r13
	addq	%r12, %rbx
	addq	%r11, %r10
	addq	%r14, %r12
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$11, %rbx
	rolq	$59, %r11
	rolq	$37, %r10
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%r11, %r14
	addq	744(%rsp), %r12
	addq	584(%rsp), %r14
	movq	%rbx, 632(%rsp)
	movq	%r13, %r10
	addq	664(%rsp), %rbx
	addq	568(%rsp), %r10
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	leaq	(%r14,%rbx), %r11
	leaq	(%r12,%r10), %r13
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r9, %r12
	addq	%rax, %r10
	addq	%r13, %rbx
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$11, %rbx
	rolq	$59, %r13
	rolq	$37, %r10
	movq	%r14, %r11
	movq	%r13, %r12
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-2292595471992902602, %r12
	movq	%r14, 744(%rsp)
	addq	%r12, %rbx
	movabsq	$8467826889434979867, %r14
	movabsq	$6028102484886760763, %r12
	addq	744(%rsp), %r12
	addq	%r14, %r13
	movabsq	$2699039428325208307, %r14
	addq	744(%rsp), %r14
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	rolq	$7, %r10
	rolq	$19, %r11
	addq	%rdi, %rbx
	addq	%rsi, %r13
	addq	%r12, %rbx
	movq	%r11, %r14
	addq	%r13, %r12
	rolq	$31, %rbx
	xorq	%r10, %r14
	rolq	$53, %r12
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%rbx, %r13
	movq	%r14, 584(%rsp)
	movq	%r14, %rbx
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	632(%rsp), %rbx
	movq	%r13, 552(%rsp)
	movq	%r12, %r14
	movq	%r11, %r13
	addq	600(%rsp), %r14
	addq	728(%rsp), %r13
	movq	552(%rsp), %r10
	addq	712(%rsp), %r10
	movq	%r12, 664(%rsp)
	movq	%r11, 568(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	rolq	$7, %r10
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	xorq	%r10, %r13
	movq	%r14, 504(%rsp)
	movq	%r14, %rbx
	movq	%r13, 344(%rsp)
	addq	392(%rsp), %rbx
	movq	%r11, %r13
	movq	344(%rsp), %r10
	addq	376(%rsp), %r13
	movq	%r12, %r14
	addq	360(%rsp), %r10
	addq	408(%rsp), %r14
	movq	%r12, 536(%rsp)
	movq	%r11, 488(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	movq	%r11, 728(%rsp)
	movq	%r14, %r11
	movq	728(%rsp), %rbx
	addq	456(%rsp), %r11
	addq	440(%rsp), %rbx
	xorq	%r10, %r13
	movq	%r14, 632(%rsp)
	movq	%r13, 712(%rsp)
	movq	%r13, %r14
	movq	%r12, %r13
	addq	424(%rsp), %r14
	addq	472(%rsp), %r13
	movq	%r12, 600(%rsp)
	leaq	(%rbx,%r11), %r10
	movq	%r10, 744(%rsp)
	movq	744(%rsp), %r12
	leaq	0(%r13,%r14), %r10
	addq	%r8, %r14
	addq	%r15, %r13
	addq	%r14, %r12
	movq	744(%rsp), %r14
	rolq	$7, %r12
	addq	%r13, %r14
	rolq	$19, %r14
	addq	%rdi, %r11
	addq	%rsi, %rbx
	leaq	(%rbx,%r10), %r13
	addq	%r10, %r11
	movq	%r14, %rbx
	rolq	$31, %r11
	xorq	%r12, %rbx
	rolq	$53, %r13
	movq	%r13, %r10
	xorq	%rbx, %r13
	xorq	%r11, %rbx
	xorq	%r11, %r10
	movabsq	$5953845371152580681, %r11
	xorq	%r10, %r14
	xorq	%r12, %r10
	movabsq	$-2842268575306187841, %r12
	addq	%r11, %rbx
	addq	%r12, %r10
	movabsq	$-7646712092252898442, %r11
	movabsq	$-7946738593435294165, %r12
	addq	%r11, %r14
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%r10, %r12
	addq	%rcx, %rbx
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$-3751294463443135658, %r14
	addq	%r14, %r13
	addq	%r11, %r10
	rolq	$23, %r12
	addq	%r13, %r11
	rolq	$11, %rbx
	rolq	$37, %r10
	rolq	$59, %r11
	movq	%r12, %r14
	movq	%r11, %r13
	xorq	%rbx, %r14
	xorq	%r10, %r13
	xorq	%r14, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	xorq	%r10, %r14
	movq	%r14, 440(%rsp)
	movq	%rbx, 472(%rsp)
	movq	%r11, %r14
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r14
	movq	%r12, %r13
	movq	440(%rsp), %r10
	addq	600(%rsp), %r13
	addq	712(%rsp), %r10
	movq	%r12, 744(%rsp)
	movq	%r11, 456(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %rbx
	movq	%r13, 376(%rsp)
	movq	%r13, %r10
	movq	%r12, %r13
	addq	344(%rsp), %r10
	addq	536(%rsp), %r13
	movq	%rbx, 408(%rsp)
	movq	%r11, %r14
	addq	504(%rsp), %rbx
	addq	488(%rsp), %r14
	movq	%r12, 424(%rsp)
	movq	%r11, 392(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$11, %rbx
	rolq	$23, %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	rolq	$37, %r10
	movq	%r12, %r13
	rolq	$59, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r10, %r14
	movq	%r13, %r10
	addq	552(%rsp), %r10
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r11, %r14
	movq	%r12, 600(%rsp)
	addq	568(%rsp), %r14
	addq	664(%rsp), %r12
	movq	%rbx, 632(%rsp)
	addq	584(%rsp), %rbx
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	leaq	(%r12,%r10), %r13
	addq	%r9, %r12
	addq	%rax, %r10
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r13, %rbx
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r14, %r11
	rolq	$59, %r13
	xorq	%rbx, %r11
	movq	%r13, %r12
	xorq	%r11, %r13
	xorq	%r10, %r12
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-824919486193887165, %r12
	movq	%r14, 664(%rsp)
	movabsq	$-1914029582460860148, %r14
	addq	%r12, %rbx
	addq	%r14, %r13
	movabsq	$-7632797540959622777, %r12
	addq	664(%rsp), %r12
	movabsq	$7484883476188376383, %r14
	addq	664(%rsp), %r14
	xorq	%r11, %r10
	movabsq	$6609752215332129920, %r11
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%r10, %r12
	addq	%rdi, %rbx
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r12, %rbx
	addq	%r14, %r11
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$7, %r10
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r12, 664(%rsp)
	movq	%r14, 584(%rsp)
	movq	%r11, 568(%rsp)
	movq	%r14, %rbx
	movq	%r13, 552(%rsp)
	addq	632(%rsp), %rbx
	movq	%r11, %r13
	addq	728(%rsp), %r13
	movq	552(%rsp), %r10
	movq	%r12, %r14
	addq	712(%rsp), %r10
	addq	600(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	rolq	$7, %r10
	rolq	$19, %r11
	addq	%rdi, %rbx
	addq	%rsi, %r13
	addq	%r12, %rbx
	movq	%r11, %r14
	addq	%r13, %r12
	rolq	$31, %rbx
	xorq	%r10, %r14
	rolq	$53, %r12
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%rbx, %r13
	movq	%r14, 504(%rsp)
	movq	%r14, %rbx
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	408(%rsp), %rbx
	movq	%r13, 360(%rsp)
	movq	%r12, %r14
	movq	%r11, %r13
	addq	424(%rsp), %r14
	addq	392(%rsp), %r13
	movq	360(%rsp), %r10
	addq	376(%rsp), %r10
	movq	%r12, 536(%rsp)
	movq	%r11, 488(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	rolq	$7, %r10
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	movq	%r11, 728(%rsp)
	xorq	%r10, %r13
	movq	%r14, %r11
	movq	728(%rsp), %rbx
	addq	472(%rsp), %r11
	addq	456(%rsp), %rbx
	movq	%r14, 632(%rsp)
	movq	%r13, %r14
	movq	%r13, 712(%rsp)
	addq	440(%rsp), %r14
	movq	%r12, %r13
	addq	744(%rsp), %r13
	movq	%r12, 600(%rsp)
	leaq	(%rbx,%r11), %r10
	addq	%rsi, %rbx
	addq	%rdi, %r11
	movq	%r10, 744(%rsp)
	movq	744(%rsp), %r12
	leaq	0(%r13,%r14), %r10
	addq	%r8, %r14
	addq	%r15, %r13
	addq	%r10, %r11
	addq	%r14, %r12
	movq	744(%rsp), %r14
	rolq	$31, %r11
	rolq	$7, %r12
	addq	%r13, %r14
	leaq	(%rbx,%r10), %r13
	rolq	$19, %r14
	rolq	$53, %r13
	movq	%r14, %rbx
	movq	%r13, %r10
	xorq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%rbx, %r13
	xorq	%r11, %rbx
	xorq	%r10, %r14
	movabsq	$-1139829817207230181, %r11
	xorq	%r12, %r10
	movabsq	$2588290990126348949, %r12
	addq	%r11, %rbx
	movabsq	$3054837738180890943, %r11
	addq	%r12, %r10
	movabsq	$-938319195649413462, %r12
	addq	%r11, %r14
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%r10, %r12
	addq	%rcx, %rbx
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$3257124934342745045, %r14
	rolq	$11, %rbx
	rolq	$23, %r12
	addq	%rax, %r10
	addq	%r14, %r13
	addq	%r11, %r10
	movq	%r12, %r14
	addq	%r13, %r11
	rolq	$37, %r10
	xorq	%rbx, %r14
	rolq	$59, %r11
	movq	%r11, %r13
	xorq	%r14, %r11
	xorq	%r10, %r14
	xorq	%r10, %r13
	movq	%r14, 424(%rsp)
	movq	%r11, %r14
	xorq	%r13, %r12
	xorq	%r13, %rbx
	addq	728(%rsp), %r14
	movq	%rbx, 456(%rsp)
	movq	424(%rsp), %r10
	movq	%r12, %r13
	addq	632(%rsp), %rbx
	addq	712(%rsp), %r10
	addq	600(%rsp), %r13
	movq	%r12, 472(%rsp)
	movq	%r11, 440(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$11, %rbx
	rolq	$37, %r10
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r12, 744(%rsp)
	movq	%r11, %r14
	movq	%rbx, 408(%rsp)
	addq	488(%rsp), %r14
	movq	%r13, %r10
	addq	504(%rsp), %rbx
	addq	360(%rsp), %r10
	movq	%r13, 376(%rsp)
	movq	%r12, %r13
	addq	536(%rsp), %r13
	movq	%r11, 392(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r10, %r13
	xorq	%r14, %rbx
	movq	%r12, 600(%rsp)
	movq	%r13, %r10
	addq	664(%rsp), %r12
	addq	552(%rsp), %r10
	movq	%r11, %r14
	movq	%rbx, 632(%rsp)
	addq	568(%rsp), %r14
	addq	584(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%r12,%r10), %r13
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r13, %rbx
	addq	%r13, %r14
	rolq	$11, %rbx
	rolq	$23, %r14
	addq	%rax, %r10
	addq	%r9, %r12
	addq	%r11, %r10
	leaq	(%r12,%r11), %r13
	rolq	$37, %r10
	movq	%r14, %r11
	xorq	%rbx, %r11
	rolq	$59, %r13
	movq	%r13, %r12
	xorq	%r11, %r13
	xorq	%r10, %r12
	xorq	%r11, %r10
	movabsq	$-496885038275669880, %r11
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-6097248013946911484, %r12
	movq	%r14, 664(%rsp)
	addq	%r12, %rbx
	movabsq	$3174302594670681997, %r14
	movabsq	$-8739574512844769069, %r12
	addq	664(%rsp), %r12
	addq	%r14, %r13
	movabsq	$6378106504303230091, %r14
	addq	664(%rsp), %r14
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r12, %rbx
	addq	%r14, %r11
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$31, %rbx
	rolq	$53, %r12
	rolq	$7, %r10
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r12, 584(%rsp)
	movq	%r14, 568(%rsp)
	movq	%r14, %rbx
	movq	%r11, %r12
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r12
	movq	%r13, %r10
	movq	584(%rsp), %r14
	addq	712(%rsp), %r10
	addq	600(%rsp), %r14
	movq	%r11, 552(%rsp)
	movq	%r13, 536(%rsp)
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r11
	addq	%r8, %r10
	addq	%r15, %r14
	addq	%r13, %r10
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	rolq	$19, %r14
	addq	%r11, %rbx
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r14, %r12
	rolq	$53, %r13
	xorq	%r10, %r12
	movq	%r13, %r11
	xorq	%r12, %r13
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	movq	%r13, 504(%rsp)
	movq	%r12, %rbx
	xorq	%r11, %r14
	addq	408(%rsp), %rbx
	xorq	%r10, %r11
	movq	%r14, %r13
	addq	392(%rsp), %r13
	movq	%r14, 360(%rsp)
	movq	%r11, %r10
	movq	504(%rsp), %r14
	addq	376(%rsp), %r10
	addq	744(%rsp), %r14
	movq	%r11, 344(%rsp)
	movq	%r12, 488(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	rolq	$7, %r10
	rolq	$19, %r11
	addq	%r12, %rbx
	addq	%rsi, %r13
	rolq	$31, %rbx
	movq	%r11, %r14
	addq	%r13, %r12
	xorq	%r10, %r14
	rolq	$53, %r12
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%rbx, %r13
	movq	%r12, 632(%rsp)
	movq	%r14, %rbx
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	456(%rsp), %rbx
	movq	%r14, 728(%rsp)
	movq	%r11, 712(%rsp)
	movq	%r13, %r14
	addq	440(%rsp), %r11
	addq	424(%rsp), %r14
	movq	%r13, 744(%rsp)
	movq	%r12, %r13
	addq	472(%rsp), %r13
	leaq	(%r11,%rbx), %r12
	addq	%rsi, %r11
	addq	%rdi, %rbx
	leaq	0(%r13,%r14), %r10
	addq	%r15, %r13
	addq	%r8, %r14
	addq	%r12, %r14
	addq	%r13, %r12
	movabsq	$1906713845121804688, %r13
	addq	%r10, %r11
	rolq	$7, %r14
	rolq	$19, %r12
	addq	%r10, %rbx
	rolq	$53, %r11
	movq	%r14, 600(%rsp)
	rolq	$31, %rbx
	xorq	%r12, %r14
	movq	%r11, %r10
	xorq	%rbx, %r10
	xorq	%r14, %r11
	xorq	%rbx, %r14
	movq	%r11, 664(%rsp)
	xorq	%r10, %r12
	movabsq	$853475092736589577, %rbx
	movabsq	$-5486504877919021346, %r11
	addq	%rbx, %r14
	addq	%r12, %r11
	xorq	600(%rsp), %r10
	addq	664(%rsp), %r13
	movabsq	$-4925106476758491821, %r12
	leaq	(%r14,%r11), %rbx
	movq	%r14, InternalState+96(%rip)
	movq	%r11, InternalState+104(%rip)
	addq	%rdx, %r11
	addq	%r12, %r10
	leaq	(%r14,%rcx), %r12
	movabsq	$6102157975113963195, %r14
	addq	664(%rsp), %r14
	movq	%r13, InternalState+120(%rip)
	addq	%r10, %r13
	addq	%r13, %r12
	movq	%r10, InternalState+112(%rip)
	addq	%r11, %r13
	addq	%rax, %r10
	rolq	$23, %r13
	rolq	$11, %r12
	addq	%rbx, %r10
	movq	%r13, %r11
	addq	%rbx, %r14
	rolq	$37, %r10
	xorq	%r12, %r11
	rolq	$59, %r14
	movq	%r14, %rbx
	xorq	%r11, %r14
	xorq	%r10, %r11
	xorq	%r10, %rbx
	addq	744(%rsp), %r11
	addq	712(%rsp), %r14
	xorq	%rbx, %r12
	xorq	%r13, %rbx
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r12
	movq	%r14, InternalState+72(%rip)
	movq	%r11, InternalState+80(%rip)
	leaq	(%r11,%rbx), %r10
	addq	%rax, %r11
	movq	%rbx, InternalState+88(%rip)
	leaq	(%r12,%r14), %r13
	movq	%r12, InternalState+64(%rip)
	addq	%rdx, %r14
	addq	%rcx, %r12
	addq	%r10, %r12
	addq	%r14, %r10
	rolq	$23, %r10
	rolq	$11, %r12
	addq	%r13, %r11
	addq	%r9, %rbx
	rolq	$37, %r11
	leaq	(%rbx,%r13), %r14
	movq	%r10, %rbx
	xorq	%r12, %rbx
	rolq	$59, %r14
	movq	%r14, %r13
	xorq	%rbx, %r14
	addq	360(%rsp), %r14
	xorq	%r11, %r13
	xorq	%rbx, %r11
	addq	344(%rsp), %r11
	xorq	%r13, %r12
	xorq	%r10, %r13
	addq	504(%rsp), %r13
	addq	488(%rsp), %r12
	movq	%r14, InternalState+40(%rip)
	movq	%r11, InternalState+48(%rip)
	leaq	(%r11,%r13), %r10
	movq	%r13, InternalState+56(%rip)
	addq	%rax, %r11
	leaq	(%r12,%r14), %rbx
	movq	%r12, InternalState+32(%rip)
	addq	%rdx, %r14
	addq	%rcx, %r12
	addq	%r9, %r13
	addq	%r10, %r12
	addq	%r14, %r10
	addq	%rbx, %r11
	rolq	$23, %r10
	rolq	$11, %r12
	addq	%r13, %rbx
	movq	%r10, %r14
	rolq	$59, %rbx
	rolq	$37, %r11
	xorq	%r12, %r14
	movq	%rbx, %r13
	xorq	%r14, %rbx
	addq	552(%rsp), %rbx
	xorq	%r11, %r13
	xorq	%r13, %r12
	xorq	%r14, %r11
	addq	568(%rsp), %r12
	movq	%rbx, InternalState+8(%rip)
	addq	536(%rsp), %r11
	xorq	%r13, %r10
	movq	520(%rsp), %r13
	addq	584(%rsp), %r10
	movq	InternalState+8(%rip), %r14
	addq	$1, %r13
	movq	%r13, %rbx
	movq	%r10, InternalState+24(%rip)
	movq	%r13, 112(%rsp)
	xorq	%r12, %rbx
	addq	%r11, %r10
	movq	%r11, %r13
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	leaq	(%r10,%rcx), %r12
	addq	%r10, %r14
	leaq	0(%r13,%rax), %r10
	movq	InternalState+24(%rip), %r13
	addq	%r12, %rbx
	rolq	$23, %r14
	addq	%r11, %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$37, %r10
	addq	%r11, %r13
	movq	%rbx, %r11
	rolq	$59, %r13
	xorq	%r14, %r11
	movq	%r13, %r12
	xorq	%r11, %r13
	xorq	%r10, %r12
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-9209400399786843361, %r12
	movq	%r14, 744(%rsp)
	movabsq	$-1376848230519552085, %r14
	addq	%r12, %r13
	addq	%r14, %rbx
	movabsq	$-3463520432737951897, %r12
	movabsq	$-369815132508846929, %r14
	addq	744(%rsp), %r12
	addq	%r14, %r10
	movabsq	$-6792583489299504353, %r14
	addq	744(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	rolq	$7, %r10
	rolq	$19, %r11
	addq	%rdi, %rbx
	addq	%rsi, %r13
	addq	%r12, %rbx
	movq	%r11, %r14
	addq	%r13, %r12
	rolq	$31, %rbx
	xorq	%r10, %r14
	rolq	$53, %r12
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%rbx, %r13
	movq	%r14, 584(%rsp)
	movq	InternalState+48(%rip), %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	InternalState+56(%rip), %r10
	movq	%r11, 568(%rsp)
	movq	%r13, 552(%rsp)
	movq	InternalState+32(%rip), %r11
	movq	InternalState+40(%rip), %r13
	addq	%r14, %r10
	movq	%r12, 664(%rsp)
	leaq	0(%r13,%r11), %r12
	addq	%rcx, %r11
	leaq	(%r10,%r11), %rbx
	leaq	0(%r13,%rdx), %r11
	movq	InternalState+56(%rip), %r13
	addq	%r10, %r11
	leaq	(%r14,%rax), %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$23, %r11
	addq	%r12, %r13
	addq	%r12, %r10
	movq	%r11, %r12
	rolq	$59, %r13
	rolq	$37, %r10
	xorq	%rbx, %r12
	movq	%r13, %r14
	xorq	%r12, %r13
	addq	568(%rsp), %r13
	xorq	%r10, %r14
	xorq	%r12, %r10
	addq	552(%rsp), %r10
	xorq	%r14, %rbx
	addq	584(%rsp), %rbx
	xorq	%r11, %r14
	addq	664(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	leaq	(%r10,%r14), %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r15, %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r14, %r11
	rolq	$7, %r10
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r14, 504(%rsp)
	movq	%r11, 488(%rsp)
	movq	InternalState+80(%rip), %r14
	movq	%r13, 472(%rsp)
	movq	InternalState+64(%rip), %r11
	movq	InternalState+72(%rip), %r13
	movq	InternalState+88(%rip), %r10
	movq	%r12, 536(%rsp)
	addq	%r14, %r10
	leaq	0(%r13,%r11), %r12
	addq	%rcx, %r11
	leaq	(%r10,%r11), %rbx
	leaq	0(%r13,%rdx), %r11
	movq	InternalState+88(%rip), %r13
	addq	%r10, %r11
	leaq	(%r14,%rax), %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$23, %r11
	addq	%r12, %r13
	addq	%r12, %r10
	movq	%r11, %r12
	rolq	$59, %r13
	rolq	$37, %r10
	xorq	%rbx, %r12
	movq	%r13, %r14
	xorq	%r12, %r13
	addq	488(%rsp), %r13
	xorq	%r10, %r14
	xorq	%r14, %rbx
	addq	504(%rsp), %rbx
	xorq	%r12, %r10
	xorq	%r11, %r14
	addq	472(%rsp), %r10
	addq	536(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	movq	InternalState+112(%rip), %r14
	movq	InternalState+104(%rip), %r13
	movq	InternalState+96(%rip), %r11
	movq	InternalState+120(%rip), %r10
	leaq	0(%r13,%r11), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	leaq	(%r10,%r11), %rbx
	leaq	0(%r13,%rdx), %r11
	movq	InternalState+120(%rip), %r13
	addq	%r10, %r11
	leaq	(%r14,%rax), %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$23, %r11
	addq	%r12, %r10
	addq	%r13, %r12
	movq	%r11, %r13
	rolq	$59, %r12
	rolq	$37, %r10
	movq	%r12, %r14
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r12
	xorq	%r14, %rbx
	addq	728(%rsp), %r12
	addq	632(%rsp), %rbx
	xorq	%r13, %r10
	xorq	%r11, %r14
	addq	712(%rsp), %r10
	addq	600(%rsp), %r14
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rdi, %rbx
	leaq	(%r14,%r10), %r11
	addq	%r8, %r10
	addq	%r15, %r14
	addq	%r13, %r10
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	rolq	$19, %r14
	rolq	$7, %r10
	addq	%r11, %rbx
	movq	%r14, %r12
	rolq	$53, %r13
	xorq	%r10, %r12
	rolq	$31, %rbx
	movq	%r13, %r11
	xorq	%r12, %r13
	xorq	%rbx, %r11
	xorq	%r12, %rbx
	movabsq	$-7999569951748836447, %r12
	addq	%r12, %rbx
	xorq	%r11, %r14
	movabsq	$-4849728007900573903, %r12
	addq	%r12, %r14
	xorq	%r11, %r10
	movabsq	$-1642314245251606934, %r12
	movabsq	$-1568322642145848418, %r11
	addq	%r13, %r12
	addq	%r11, %r10
	leaq	(%rbx,%r14), %r11
	addq	%rcx, %rbx
	addq	%r10, %r12
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r14, %r12
	movabsq	$2553129884740551573, %r14
	addq	%r11, %r10
	addq	%r14, %r13
	rolq	$23, %r12
	rolq	$37, %r10
	addq	%r13, %r11
	movq	%r12, %r13
	rolq	$59, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r10, %r14
	movq	%r13, 424(%rsp)
	movq	%r13, %r10
	xorq	%r14, %r12
	xorq	%r14, %rbx
	addq	712(%rsp), %r10
	movq	%rbx, 456(%rsp)
	movq	%r11, %r14
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r14
	movq	%r12, %r13
	addq	600(%rsp), %r13
	movq	%r12, 744(%rsp)
	movq	%r11, 440(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rax, %r10
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r9, %r13
	addq	%r12, %rbx
	addq	%r11, %r10
	addq	%r14, %r12
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	rolq	$11, %rbx
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	xorq	%r10, %r13
	movq	%rbx, 392(%rsp)
	movq	%r11, %r14
	addq	504(%rsp), %rbx
	addq	488(%rsp), %r14
	movq	%r13, %r10
	movq	%r13, 360(%rsp)
	addq	472(%rsp), %r10
	movq	%r12, %r13
	addq	536(%rsp), %r13
	movq	%r12, 408(%rsp)
	movq	%r11, 376(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r10, %r13
	xorq	%r14, %rbx
	movq	%r12, 600(%rsp)
	movq	%r13, %r10
	addq	664(%rsp), %r12
	addq	552(%rsp), %r10
	movq	%r11, %r14
	movq	%rbx, 632(%rsp)
	addq	568(%rsp), %r14
	addq	584(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%r12,%r10), %r13
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%r13, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%r9, %r12
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%rax, %r10
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$59, %r13
	rolq	$37, %r10
	movq	%r14, %r11
	movq	%r13, %r12
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-2292595471992902602, %r12
	movq	%r14, 664(%rsp)
	addq	%r12, %rbx
	movabsq	$8467826889434979867, %r14
	movabsq	$6028102484886760763, %r12
	addq	664(%rsp), %r12
	addq	%r14, %r13
	movabsq	$2699039428325208307, %r14
	addq	664(%rsp), %r14
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r12, %rbx
	addq	%r14, %r11
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$7, %r10
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r14, 584(%rsp)
	movq	%r13, 552(%rsp)
	movq	%r14, %rbx
	movq	%r11, %r13
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r13
	movq	%r12, %r14
	movq	552(%rsp), %r10
	addq	600(%rsp), %r14
	addq	712(%rsp), %r10
	movq	%r12, 664(%rsp)
	movq	%r11, 568(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	xorq	%r10, %r13
	movq	%r14, %rbx
	addq	392(%rsp), %rbx
	movq	%r13, 472(%rsp)
	movq	%r11, %r13
	addq	376(%rsp), %r13
	movq	%r14, 504(%rsp)
	movq	472(%rsp), %r10
	movq	%r12, %r14
	addq	360(%rsp), %r10
	addq	408(%rsp), %r14
	movq	%r11, 488(%rsp)
	movq	%r12, 536(%rsp)
	leaq	(%rbx,%r13), %r11
	leaq	(%r10,%r14), %r12
	addq	%r8, %r10
	addq	%r11, %r10
	rolq	$7, %r10
	addq	%r15, %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r14, %rbx
	movq	%r11, %r12
	addq	456(%rsp), %rbx
	addq	440(%rsp), %r12
	movq	%r13, %r10
	movq	600(%rsp), %r14
	addq	424(%rsp), %r10
	addq	744(%rsp), %r14
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rdi, %rbx
	leaq	(%r14,%r10), %r11
	addq	%r8, %r10
	addq	%r15, %r14
	addq	%r13, %r10
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	rolq	$19, %r14
	rolq	$7, %r10
	addq	%r11, %rbx
	movq	%r14, %r12
	rolq	$53, %r13
	xorq	%r10, %r12
	rolq	$31, %rbx
	movq	%r13, %r11
	xorq	%rbx, %r11
	xorq	%r12, %r13
	xorq	%r12, %rbx
	movabsq	$5953845371152580681, %r12
	xorq	%r11, %r14
	xorq	%r11, %r10
	addq	%r12, %rbx
	movabsq	$-7646712092252898442, %r12
	movabsq	$-2842268575306187841, %r11
	addq	%r12, %r14
	movabsq	$-7946738593435294165, %r12
	addq	%r11, %r10
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%r10, %r12
	addq	%rcx, %rbx
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$-3751294463443135658, %r14
	addq	%r14, %r13
	addq	%r11, %r10
	rolq	$23, %r12
	addq	%r13, %r11
	rolq	$37, %r10
	rolq	$11, %rbx
	rolq	$59, %r11
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, 424(%rsp)
	movq	%r13, %r10
	movq	%r12, %r13
	addq	712(%rsp), %r10
	addq	600(%rsp), %r13
	movq	%rbx, 456(%rsp)
	movq	%r11, %r14
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r14
	movq	%r12, 744(%rsp)
	movq	%r11, 440(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rcx, %rbx
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r14, %r12
	addq	%r11, %r10
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, %r10
	movq	%r12, 408(%rsp)
	movq	%r11, %r14
	addq	472(%rsp), %r10
	addq	488(%rsp), %r14
	movq	%rbx, 392(%rsp)
	movq	%r13, 360(%rsp)
	addq	504(%rsp), %rbx
	movq	%r12, %r13
	addq	536(%rsp), %r13
	movq	%r11, 376(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%rbx, 632(%rsp)
	addq	664(%rsp), %r12
	addq	584(%rsp), %rbx
	movq	%r11, %r14
	movq	%r13, %r10
	addq	568(%rsp), %r14
	addq	552(%rsp), %r10
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	leaq	(%r14,%rbx), %r11
	leaq	(%r12,%r10), %r13
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r9, %r12
	addq	%rax, %r10
	addq	%r13, %rbx
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$11, %rbx
	rolq	$59, %r13
	rolq	$37, %r10
	movq	%r14, %r11
	movq	%r13, %r12
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-824919486193887165, %r12
	movq	%r14, 664(%rsp)
	addq	%r12, %rbx
	movabsq	$-7632797540959622777, %r12
	addq	664(%rsp), %r12
	movabsq	$-1914029582460860148, %r14
	movabsq	$6609752215332129920, %r11
	addq	%r14, %r13
	addq	%r11, %r10
	movabsq	$7484883476188376383, %r14
	leaq	(%rbx,%r13), %r11
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	rolq	$7, %r10
	addq	664(%rsp), %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$53, %r12
	rolq	$31, %rbx
	addq	%r14, %r11
	movq	%r12, %r13
	rolq	$19, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r10, %r14
	movq	%r13, 488(%rsp)
	movq	%r11, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	addq	728(%rsp), %r13
	movq	%r14, 536(%rsp)
	movq	%r14, %rbx
	movq	488(%rsp), %r10
	addq	632(%rsp), %rbx
	addq	712(%rsp), %r10
	movq	%r12, %r14
	addq	600(%rsp), %r14
	movq	%r12, 552(%rsp)
	movq	%r11, 504(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r14
	movq	%r13, 472(%rsp)
	movq	%r11, %r13
	movq	%r14, 584(%rsp)
	addq	376(%rsp), %r13
	movq	%r14, %rbx
	movq	472(%rsp), %r10
	addq	392(%rsp), %rbx
	movq	%r12, %r14
	addq	360(%rsp), %r10
	addq	408(%rsp), %r14
	movq	%r12, 664(%rsp)
	movq	%r11, 568(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%rbx, %r14
	movq	%r12, 600(%rsp)
	xorq	%r10, %r13
	movq	%r14, %rbx
	movq	%r11, %r12
	addq	456(%rsp), %rbx
	addq	440(%rsp), %r12
	movq	%r14, 632(%rsp)
	movq	%r13, %r10
	movq	600(%rsp), %r14
	addq	424(%rsp), %r10
	addq	744(%rsp), %r14
	movq	%r13, 712(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%r12,%rbx), %r13
	leaq	(%r14,%r10), %r11
	addq	%r8, %r10
	addq	%r13, %r10
	rolq	$7, %r10
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%rdi, %rbx
	rolq	$19, %r14
	addq	%r11, %rbx
	rolq	$53, %r13
	movq	%r14, %r12
	rolq	$31, %rbx
	xorq	%r10, %r12
	movq	%r13, %r11
	xorq	%rbx, %r11
	xorq	%r12, %r13
	xorq	%r12, %rbx
	movabsq	$-1139829817207230181, %r12
	xorq	%r11, %r14
	xorq	%r11, %r10
	addq	%r12, %rbx
	movabsq	$3054837738180890943, %r12
	movabsq	$2588290990126348949, %r11
	addq	%r12, %r14
	movabsq	$-938319195649413462, %r12
	addq	%r11, %r10
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%r10, %r12
	addq	%rcx, %rbx
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$3257124934342745045, %r14
	addq	%r14, %r13
	addq	%r11, %r10
	rolq	$23, %r12
	addq	%r13, %r11
	rolq	$37, %r10
	rolq	$11, %rbx
	rolq	$59, %r11
	movq	%r12, %r14
	movq	%r11, %r13
	xorq	%r10, %r13
	xorq	%rbx, %r14
	xorq	%r14, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	xorq	%r10, %r14
	movq	%rbx, 440(%rsp)
	movq	%r12, %r13
	addq	632(%rsp), %rbx
	addq	600(%rsp), %r13
	movq	%r14, 408(%rsp)
	movq	%r11, %r14
	movq	408(%rsp), %r10
	addq	728(%rsp), %r14
	addq	712(%rsp), %r10
	movq	%r12, 456(%rsp)
	movq	%r11, 424(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rax, %r10
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r9, %r13
	addq	%r12, %rbx
	addq	%r11, %r10
	addq	%r14, %r12
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	rolq	$11, %rbx
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, 344(%rsp)
	movq	%r13, %r10
	movq	%r12, %r13
	addq	472(%rsp), %r10
	addq	664(%rsp), %r13
	movq	%rbx, 376(%rsp)
	movq	%r11, %r14
	addq	584(%rsp), %rbx
	addq	568(%rsp), %r14
	movq	%r12, 392(%rsp)
	movq	%r11, 360(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rcx, %rbx
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r14, %r12
	addq	%r11, %r10
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, %r10
	movq	%r12, 744(%rsp)
	addq	488(%rsp), %r10
	movq	%r11, %r14
	addq	552(%rsp), %r12
	addq	504(%rsp), %r14
	movq	%rbx, 664(%rsp)
	addq	536(%rsp), %rbx
	movq	%r11, 584(%rsp)
	movq	%r13, 568(%rsp)
	leaq	(%r12,%r10), %r13
	addq	%r9, %r12
	addq	%rax, %r10
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r13, %rbx
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r14, %r11
	rolq	$59, %r13
	xorq	%rbx, %r11
	movq	%r13, %r12
	xorq	%r10, %r12
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-6097248013946911484, %r12
	movq	%r14, 728(%rsp)
	addq	%r12, %rbx
	xorq	%r11, %r13
	movabsq	$3174302594670681997, %r14
	movabsq	$-8739574512844769069, %r12
	addq	728(%rsp), %r12
	addq	%r14, %r13
	movabsq	$6378106504303230091, %r14
	addq	728(%rsp), %r14
	xorq	%r11, %r10
	movabsq	$-496885038275669880, %r11
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%r10, %r12
	addq	%rdi, %rbx
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r12, %rbx
	addq	%r14, %r11
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$7, %r10
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	movq	%r12, 600(%rsp)
	xorq	%r10, %r13
	movq	%r11, 728(%rsp)
	movq	%r12, preCompInternalState(%rip)
	movq	%r13, %r10
	movq	%r11, preCompInternalState+16(%rip)
	movq	728(%rsp), %r12
	movq	%r14, %r11
	addq	584(%rsp), %r12
	addq	664(%rsp), %r11
	addq	568(%rsp), %r10
	movq	%r14, 632(%rsp)
	movq	%r14, preCompInternalState+8(%rip)
	movq	600(%rsp), %r14
	addq	744(%rsp), %r14
	movq	%r13, 712(%rsp)
	movq	%r13, preCompInternalState+24(%rip)
	leaq	(%r11,%r12), %r13
	leaq	(%r10,%r14), %rbx
	addq	%r8, %r10
	addq	%r13, %r10
	rolq	$7, %r10
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%r13, %r14
	leaq	(%r12,%rbx), %r13
	addq	%rdi, %r11
	rolq	$19, %r14
	addq	%rbx, %r11
	rolq	$53, %r13
	rolq	$31, %r11
	movq	%r14, %rbx
	movq	%r13, %r12
	xorq	%r10, %rbx
	xorq	%r11, %r12
	xorq	%rbx, %r13
	xorq	%r11, %rbx
	xorq	%r12, %r14
	xorq	%r10, %r12
	movq	%rbx, %r11
	movq	%r12, 472(%rsp)
	addq	376(%rsp), %r11
	movq	%r14, %r12
	movq	%r14, 488(%rsp)
	addq	360(%rsp), %r12
	movq	%r13, %r14
	movq	472(%rsp), %r10
	addq	392(%rsp), %r14
	addq	344(%rsp), %r10
	movq	%r13, 536(%rsp)
	movq	%rbx, 504(%rsp)
	leaq	(%r11,%r12), %r13
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r10,%r14), %rbx
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r13, %r14
	addq	%r13, %r10
	addq	%rbx, %r12
	rolq	$19, %r14
	addq	%rbx, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %r11
	movq	%r14, %rbx
	movq	%r12, %r13
	xorq	%r11, %r13
	xorq	%r10, %rbx
	xorq	%rbx, %r12
	xorq	%r13, %r14
	xorq	%r11, %rbx
	movq	%rbx, 664(%rsp)
	movq	%rbx, %r11
	movq	%r14, %rbx
	addq	440(%rsp), %r11
	addq	424(%rsp), %rbx
	xorq	%r10, %r13
	movq	%r14, 584(%rsp)
	movq	%r13, 568(%rsp)
	movq	%r13, %r14
	movq	%r12, %r13
	addq	408(%rsp), %r14
	addq	456(%rsp), %r13
	movq	%r12, 744(%rsp)
	leaq	(%rbx,%r11), %r10
	addq	%rsi, %rbx
	addq	%rdi, %r11
	movq	%r10, 552(%rsp)
	movq	552(%rsp), %r12
	leaq	0(%r13,%r14), %r10
	addq	%r8, %r14
	addq	%r15, %r13
	addq	%r10, %r11
	addq	%r14, %r12
	movq	552(%rsp), %r14
	rolq	$31, %r11
	rolq	$7, %r12
	addq	%r13, %r14
	leaq	(%rbx,%r10), %r13
	rolq	$19, %r14
	rolq	$53, %r13
	movq	%r14, %rbx
	movq	%r13, %r10
	xorq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%rbx, %r13
	xorq	%r11, %rbx
	xorq	%r10, %r14
	movabsq	$853475092736589577, %r11
	xorq	%r12, %r10
	movabsq	$-4925106476758491821, %r12
	addq	%r11, %rbx
	movabsq	$-5486504877919021346, %r11
	addq	%r12, %r10
	movabsq	$1906713845121804688, %r12
	addq	%r11, %r14
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	movq	%rbx, InternalState+96(%rip)
	movq	%r12, InternalState+120(%rip)
	addq	%rcx, %rbx
	addq	%r10, %r12
	addq	%r12, %rbx
	movq	%r14, InternalState+104(%rip)
	movq	%r10, InternalState+112(%rip)
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r14, %r12
	movabsq	$6102157975113963195, %r14
	addq	%r11, %r10
	addq	%r14, %r13
	rolq	$23, %r12
	rolq	$37, %r10
	addq	%r13, %r11
	movq	%r12, %r13
	rolq	$59, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r14
	xorq	%r13, %r10
	movq	%r11, preCompInternalState+112(%rip)
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r10, preCompInternalState+120(%rip)
	movq	%r12, preCompInternalState+96(%rip)
	addq	568(%rsp), %r10
	addq	744(%rsp), %r12
	movq	%rbx, preCompInternalState+104(%rip)
	movq	584(%rsp), %r14
	addq	664(%rsp), %rbx
	movq	%r10, InternalState+80(%rip)
	addq	%r11, %r14
	leaq	(%r10,%r12), %r13
	movq	%r12, InternalState+88(%rip)
	leaq	(%rbx,%r14), %r11
	addq	%rax, %r10
	addq	%r9, %r12
	movq	%rbx, InternalState+64(%rip)
	movq	%r14, InternalState+72(%rip)
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r13, %rbx
	addq	%r11, %r10
	addq	%r14, %r13
	addq	%r12, %r11
	rolq	$11, %rbx
	rolq	$59, %r11
	rolq	$23, %r13
	rolq	$37, %r10
	movq	%r11, %r14
	movq	%r13, %r12
	xorq	%rbx, %r12
	xorq	%r10, %r14
	xorq	%r14, %r13
	xorq	%r14, %rbx
	xorq	%r12, %r10
	movq	%r13, preCompInternalState+64(%rip)
	movq	%rbx, preCompInternalState+72(%rip)
	xorq	%r12, %r11
	addq	504(%rsp), %rbx
	addq	536(%rsp), %r13
	movq	%r10, preCompInternalState+88(%rip)
	movq	488(%rsp), %r14
	addq	472(%rsp), %r10
	movq	%r11, preCompInternalState+80(%rip)
	addq	%r11, %r14
	movq	%rbx, InternalState+32(%rip)
	movq	%r13, InternalState+56(%rip)
	leaq	(%rbx,%r14), %r11
	movq	%r14, InternalState+40(%rip)
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rdx, %r14
	addq	%r9, %r13
	movq	%r10, InternalState+48(%rip)
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r11, %r10
	addq	%r14, %r12
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$11, %rbx
	rolq	$59, %r11
	rolq	$37, %r10
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r13, %r10
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r11, preCompInternalState+48(%rip)
	movq	%r12, preCompInternalState+32(%rip)
	movq	%rbx, preCompInternalState+40(%rip)
	movq	%r10, preCompInternalState+56(%rip)
	addq	712(%rsp), %r10
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r11
	addq	600(%rsp), %r12
	movq	%r10, InternalState+16(%rip)
	movq	16(%rbp), %r10
	movq	%r11, InternalState+8(%rip)
	movq	%rbx, InternalState(%rip)
	movq	%r12, InternalState+24(%rip)
	movq	96(%rsp), %r11
	xorq	(%r10), %rbx
	movq	%r10, %r12
	movq	%rbx, InternalState(%rip)
	movq	%rbx, (%r11)
	movq	8(%r10), %r10
	xorq	InternalState+8(%rip), %r10
	movq	%r10, InternalState+8(%rip)
	movq	%r10, 8(%r11)
	movq	16(%r12), %r10
	xorq	InternalState+16(%rip), %r10
	movq	%r10, InternalState+16(%rip)
	movq	%r10, 16(%r11)
	movq	24(%r12), %r10
	xorq	InternalState+24(%rip), %r10
	movq	%r10, InternalState+24(%rip)
	movq	%r10, 24(%r11)
	movq	32(%r12), %r10
	xorq	InternalState+64(%rip), %r10
	movq	%r10, InternalState+64(%rip)
	movq	%r10, 32(%r11)
	movq	40(%r12), %r10
	xorq	InternalState+72(%rip), %r10
	movq	%r10, InternalState+72(%rip)
	movq	%r10, 40(%r11)
	movq	48(%r12), %r10
	xorq	InternalState+80(%rip), %r10
	movq	%r10, InternalState+80(%rip)
	movq	%r10, 48(%r11)
	movq	56(%r12), %r10
	xorq	InternalState+88(%rip), %r10
	movq	%r10, InternalState+88(%rip)
	movq	%r10, 56(%r11)
	movq	InternalState+16(%rip), %r12
	movq	InternalState+24(%rip), %r13
	movq	InternalState(%rip), %rbx
	movq	InternalState+8(%rip), %r14
	leaq	0(%r13,%r12), %r10
	addq	%r9, %r13
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r10, %rbx
	addq	%r10, %r14
	leaq	(%r12,%rax), %r10
	addq	%r11, %r13
	rolq	$23, %r14
	rolq	$11, %rbx
	addq	%r11, %r10
	rolq	$59, %r13
	movq	%r14, %r11
	rolq	$37, %r10
	movq	%r13, %r12
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-9209400399786843361, %r12
	movq	%r14, 744(%rsp)
	movabsq	$-1376848230519552085, %r14
	addq	%r12, %r13
	addq	%r14, %rbx
	movabsq	$-3463520432737951897, %r12
	movabsq	$-369815132508846929, %r14
	addq	744(%rsp), %r12
	addq	%r14, %r10
	movabsq	$-6792583489299504353, %r14
	addq	744(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	rolq	$7, %r10
	rolq	$19, %r11
	addq	%rdi, %rbx
	addq	%rsi, %r13
	addq	%r12, %rbx
	movq	%r11, %r14
	addq	%r13, %r12
	rolq	$31, %rbx
	xorq	%r10, %r14
	rolq	$53, %r12
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%rbx, %r13
	movq	%r14, 584(%rsp)
	movq	InternalState+48(%rip), %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	InternalState+56(%rip), %r10
	movq	%r11, 568(%rsp)
	movq	%r13, 552(%rsp)
	movq	InternalState+32(%rip), %r11
	movq	InternalState+40(%rip), %r13
	addq	%r14, %r10
	movq	%r12, 664(%rsp)
	leaq	0(%r13,%r11), %r12
	addq	%rcx, %r11
	leaq	(%r10,%r11), %rbx
	leaq	0(%r13,%rdx), %r11
	movq	InternalState+56(%rip), %r13
	addq	%r10, %r11
	leaq	(%r14,%rax), %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$23, %r11
	addq	%r12, %r13
	addq	%r12, %r10
	movq	%r11, %r12
	rolq	$59, %r13
	rolq	$37, %r10
	xorq	%rbx, %r12
	movq	%r13, %r14
	xorq	%r12, %r13
	addq	568(%rsp), %r13
	xorq	%r10, %r14
	xorq	%r12, %r10
	addq	552(%rsp), %r10
	xorq	%r14, %rbx
	addq	584(%rsp), %rbx
	xorq	%r11, %r14
	addq	664(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	leaq	(%r10,%r14), %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r15, %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r14, %r11
	rolq	$7, %r10
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r14, 504(%rsp)
	movq	%r11, 488(%rsp)
	movq	InternalState+80(%rip), %r14
	movq	%r13, 472(%rsp)
	movq	InternalState+64(%rip), %r11
	movq	InternalState+72(%rip), %r13
	movq	InternalState+88(%rip), %r10
	movq	%r12, 536(%rsp)
	addq	%r14, %r10
	leaq	0(%r13,%r11), %r12
	addq	%rcx, %r11
	leaq	(%r10,%r11), %rbx
	leaq	0(%r13,%rdx), %r11
	movq	InternalState+88(%rip), %r13
	addq	%r10, %r11
	leaq	(%r14,%rax), %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$23, %r11
	addq	%r12, %r13
	addq	%r12, %r10
	movq	%r11, %r12
	rolq	$59, %r13
	rolq	$37, %r10
	xorq	%rbx, %r12
	movq	%r13, %r14
	xorq	%r12, %r13
	addq	488(%rsp), %r13
	xorq	%r10, %r14
	xorq	%r14, %rbx
	addq	504(%rsp), %rbx
	xorq	%r12, %r10
	xorq	%r11, %r14
	addq	472(%rsp), %r10
	addq	536(%rsp), %r14
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	movq	InternalState+112(%rip), %r14
	movq	InternalState+104(%rip), %r13
	movq	InternalState+96(%rip), %r11
	movq	InternalState+120(%rip), %r10
	leaq	0(%r13,%r11), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	leaq	(%r10,%r11), %rbx
	leaq	0(%r13,%rdx), %r11
	movq	InternalState+120(%rip), %r13
	addq	%r10, %r11
	leaq	(%r14,%rax), %r10
	rolq	$11, %rbx
	addq	%r9, %r13
	rolq	$23, %r11
	addq	%r12, %r10
	addq	%r13, %r12
	movq	%r11, %r13
	rolq	$59, %r12
	rolq	$37, %r10
	movq	%r12, %r14
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r12
	xorq	%r14, %rbx
	addq	728(%rsp), %r12
	addq	632(%rsp), %rbx
	xorq	%r13, %r10
	xorq	%r11, %r14
	addq	712(%rsp), %r10
	addq	600(%rsp), %r14
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rdi, %rbx
	leaq	(%r14,%r10), %r11
	addq	%r8, %r10
	addq	%r15, %r14
	addq	%r13, %r10
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	rolq	$19, %r14
	rolq	$7, %r10
	addq	%r11, %rbx
	movq	%r14, %r12
	rolq	$53, %r13
	xorq	%r10, %r12
	rolq	$31, %rbx
	movq	%r13, %r11
	xorq	%r12, %r13
	xorq	%rbx, %r11
	xorq	%r12, %rbx
	movabsq	$-7999569951748836447, %r12
	addq	%r12, %rbx
	xorq	%r11, %r14
	movabsq	$-4849728007900573903, %r12
	addq	%r12, %r14
	xorq	%r11, %r10
	movabsq	$-1642314245251606934, %r12
	movabsq	$-1568322642145848418, %r11
	addq	%r13, %r12
	addq	%r11, %r10
	leaq	(%rbx,%r14), %r11
	addq	%rcx, %rbx
	addq	%r10, %r12
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r14, %r12
	movabsq	$2553129884740551573, %r14
	addq	%r11, %r10
	addq	%r14, %r13
	rolq	$23, %r12
	rolq	$37, %r10
	addq	%r13, %r11
	movq	%r12, %r13
	rolq	$59, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r10, %r14
	movq	%r13, 424(%rsp)
	movq	%r13, %r10
	xorq	%r14, %r12
	xorq	%r14, %rbx
	addq	712(%rsp), %r10
	movq	%rbx, 456(%rsp)
	movq	%r11, %r14
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r14
	movq	%r12, %r13
	addq	600(%rsp), %r13
	movq	%r12, 744(%rsp)
	movq	%r11, 440(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rax, %r10
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r9, %r13
	addq	%r12, %rbx
	addq	%r11, %r10
	addq	%r14, %r12
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	rolq	$11, %rbx
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	xorq	%r10, %r13
	movq	%rbx, 392(%rsp)
	movq	%r11, %r14
	addq	504(%rsp), %rbx
	addq	488(%rsp), %r14
	movq	%r13, %r10
	movq	%r13, 360(%rsp)
	addq	472(%rsp), %r10
	movq	%r12, %r13
	addq	536(%rsp), %r13
	movq	%r12, 408(%rsp)
	movq	%r11, 376(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r10, %r13
	xorq	%r14, %rbx
	movq	%r12, 600(%rsp)
	movq	%r13, %r10
	addq	664(%rsp), %r12
	addq	552(%rsp), %r10
	movq	%r11, %r14
	movq	%rbx, 632(%rsp)
	addq	568(%rsp), %r14
	addq	584(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%r12,%r10), %r13
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%r13, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%r9, %r12
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%rax, %r10
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$59, %r13
	rolq	$37, %r10
	movq	%r14, %r11
	movq	%r13, %r12
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-2292595471992902602, %r12
	movq	%r14, 664(%rsp)
	addq	%r12, %rbx
	movabsq	$8467826889434979867, %r14
	movabsq	$6028102484886760763, %r12
	addq	664(%rsp), %r12
	addq	%r14, %r13
	movabsq	$2699039428325208307, %r14
	addq	664(%rsp), %r14
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r12, %rbx
	addq	%r14, %r11
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$7, %r10
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r14, 584(%rsp)
	movq	%r13, 552(%rsp)
	movq	%r14, %rbx
	movq	%r11, %r13
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r13
	movq	%r12, %r14
	movq	552(%rsp), %r10
	addq	600(%rsp), %r14
	addq	712(%rsp), %r10
	movq	%r12, 664(%rsp)
	movq	%r11, 568(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%rbx, %r14
	xorq	%r10, %r13
	movq	%r14, %rbx
	addq	392(%rsp), %rbx
	movq	%r13, 472(%rsp)
	movq	%r11, %r13
	addq	376(%rsp), %r13
	movq	%r14, 504(%rsp)
	movq	472(%rsp), %r10
	movq	%r12, %r14
	addq	360(%rsp), %r10
	addq	408(%rsp), %r14
	movq	%r11, 488(%rsp)
	movq	%r12, 536(%rsp)
	leaq	(%rbx,%r13), %r11
	leaq	(%r10,%r14), %r12
	addq	%r8, %r10
	addq	%r11, %r10
	rolq	$7, %r10
	addq	%r15, %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r14, %rbx
	movq	%r11, %r12
	addq	456(%rsp), %rbx
	addq	440(%rsp), %r12
	movq	%r13, %r10
	movq	600(%rsp), %r14
	addq	424(%rsp), %r10
	addq	744(%rsp), %r14
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rdi, %rbx
	leaq	(%r14,%r10), %r11
	addq	%r8, %r10
	addq	%r15, %r14
	addq	%r13, %r10
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	rolq	$19, %r14
	rolq	$7, %r10
	addq	%r11, %rbx
	movq	%r14, %r12
	rolq	$53, %r13
	xorq	%r10, %r12
	rolq	$31, %rbx
	movq	%r13, %r11
	xorq	%rbx, %r11
	xorq	%r12, %r13
	xorq	%r12, %rbx
	movabsq	$5953845371152580681, %r12
	xorq	%r11, %r14
	xorq	%r11, %r10
	addq	%r12, %rbx
	movabsq	$-7646712092252898442, %r12
	movabsq	$-2842268575306187841, %r11
	addq	%r12, %r14
	movabsq	$-7946738593435294165, %r12
	addq	%r11, %r10
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%r10, %r12
	addq	%rcx, %rbx
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$-3751294463443135658, %r14
	addq	%r14, %r13
	addq	%r11, %r10
	rolq	$23, %r12
	addq	%r13, %r11
	rolq	$37, %r10
	rolq	$11, %rbx
	rolq	$59, %r11
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, 424(%rsp)
	movq	%r13, %r10
	movq	%r12, %r13
	addq	712(%rsp), %r10
	addq	600(%rsp), %r13
	movq	%rbx, 456(%rsp)
	movq	%r11, %r14
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r14
	movq	%r12, 744(%rsp)
	movq	%r11, 440(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rcx, %rbx
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r14, %r12
	addq	%r11, %r10
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, %r10
	movq	%r12, 408(%rsp)
	movq	%r11, %r14
	addq	472(%rsp), %r10
	addq	488(%rsp), %r14
	movq	%rbx, 392(%rsp)
	movq	%r13, 360(%rsp)
	addq	504(%rsp), %rbx
	movq	%r12, %r13
	addq	536(%rsp), %r13
	movq	%r11, 376(%rsp)
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%rcx, %rbx
	leaq	(%r10,%r13), %r12
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r11, %r10
	addq	%r13, %r11
	addq	%r12, %rbx
	addq	%r14, %r12
	rolq	$59, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	xorq	%r10, %r13
	movq	%r12, 600(%rsp)
	movq	%rbx, 632(%rsp)
	addq	664(%rsp), %r12
	addq	584(%rsp), %rbx
	movq	%r11, %r14
	movq	%r13, %r10
	addq	568(%rsp), %r14
	addq	552(%rsp), %r10
	movq	%r11, 728(%rsp)
	movq	%r13, 712(%rsp)
	leaq	(%r14,%rbx), %r11
	leaq	(%r12,%r10), %r13
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r9, %r12
	addq	%rax, %r10
	addq	%r13, %rbx
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$11, %rbx
	rolq	$59, %r13
	rolq	$37, %r10
	movq	%r14, %r11
	movq	%r13, %r12
	xorq	%rbx, %r11
	xorq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r11, %r10
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-824919486193887165, %r12
	movq	%r14, 664(%rsp)
	addq	%r12, %rbx
	movabsq	$-7632797540959622777, %r12
	addq	664(%rsp), %r12
	movabsq	$-1914029582460860148, %r14
	movabsq	$6609752215332129920, %r11
	addq	%r14, %r13
	addq	%r11, %r10
	movabsq	$7484883476188376383, %r14
	leaq	(%rbx,%r13), %r11
	addq	%r10, %r12
	addq	%r8, %r10
	addq	%r11, %r10
	rolq	$7, %r10
	addq	664(%rsp), %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$53, %r12
	rolq	$31, %rbx
	addq	%r14, %r11
	movq	%r12, %r13
	rolq	$19, %r11
	xorq	%rbx, %r13
	movq	%r11, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r10, %r14
	movq	%r13, 488(%rsp)
	movq	%r11, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	addq	728(%rsp), %r13
	movq	%r14, 536(%rsp)
	movq	%r14, %rbx
	movq	488(%rsp), %r10
	addq	632(%rsp), %rbx
	addq	712(%rsp), %r10
	movq	%r12, %r14
	addq	600(%rsp), %r14
	movq	%r12, 552(%rsp)
	movq	%r11, 504(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r14
	movq	%r13, 472(%rsp)
	movq	%r11, %r13
	movq	%r14, 584(%rsp)
	addq	376(%rsp), %r13
	movq	%r14, %rbx
	movq	472(%rsp), %r10
	addq	392(%rsp), %rbx
	movq	%r12, %r14
	addq	360(%rsp), %r10
	addq	408(%rsp), %r14
	movq	%r12, 664(%rsp)
	movq	%r11, 568(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%rbx, %r14
	movq	%r12, 600(%rsp)
	xorq	%r10, %r13
	movq	%r14, %rbx
	movq	%r11, %r12
	addq	456(%rsp), %rbx
	addq	440(%rsp), %r12
	movq	%r14, 632(%rsp)
	movq	%r13, %r10
	movq	600(%rsp), %r14
	addq	424(%rsp), %r10
	addq	744(%rsp), %r14
	movq	%r13, 712(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%r12,%rbx), %r13
	leaq	(%r14,%r10), %r11
	addq	%r8, %r10
	addq	%r13, %r10
	rolq	$7, %r10
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%rdi, %rbx
	rolq	$19, %r14
	addq	%r11, %rbx
	rolq	$53, %r13
	movq	%r14, %r12
	rolq	$31, %rbx
	xorq	%r10, %r12
	movq	%r13, %r11
	xorq	%rbx, %r11
	xorq	%r12, %r13
	xorq	%r12, %rbx
	movabsq	$-1139829817207230181, %r12
	xorq	%r11, %r14
	xorq	%r11, %r10
	addq	%r12, %rbx
	movabsq	$3054837738180890943, %r12
	movabsq	$2588290990126348949, %r11
	addq	%r12, %r14
	movabsq	$-938319195649413462, %r12
	addq	%r11, %r10
	addq	%r13, %r12
	leaq	(%rbx,%r14), %r11
	addq	%rdx, %r14
	addq	%r10, %r12
	addq	%rcx, %rbx
	addq	%rax, %r10
	addq	%r12, %rbx
	addq	%r14, %r12
	movabsq	$3257124934342745045, %r14
	addq	%r14, %r13
	addq	%r11, %r10
	rolq	$23, %r12
	addq	%r13, %r11
	rolq	$37, %r10
	rolq	$11, %rbx
	rolq	$59, %r11
	movq	%r12, %r14
	movq	%r11, %r13
	xorq	%r10, %r13
	xorq	%rbx, %r14
	xorq	%r14, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	xorq	%r10, %r14
	movq	%rbx, 440(%rsp)
	movq	%r12, %r13
	addq	632(%rsp), %rbx
	addq	600(%rsp), %r13
	movq	%r14, 408(%rsp)
	movq	%r11, %r14
	movq	408(%rsp), %r10
	addq	728(%rsp), %r14
	addq	712(%rsp), %r10
	movq	%r12, 456(%rsp)
	movq	%r11, 424(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rax, %r10
	addq	%rdx, %r14
	addq	%rcx, %rbx
	addq	%r9, %r13
	addq	%r12, %rbx
	addq	%r11, %r10
	addq	%r14, %r12
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	rolq	$11, %rbx
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, 344(%rsp)
	movq	%r13, %r10
	movq	%r12, %r13
	addq	472(%rsp), %r10
	addq	664(%rsp), %r13
	movq	%rbx, 376(%rsp)
	movq	%r11, %r14
	addq	584(%rsp), %rbx
	addq	568(%rsp), %r14
	movq	%r12, 392(%rsp)
	movq	%r11, 360(%rsp)
	leaq	(%r10,%r13), %r12
	leaq	(%rbx,%r14), %r11
	addq	%rcx, %rbx
	addq	%r12, %rbx
	rolq	$11, %rbx
	addq	%rdx, %r14
	addq	%rax, %r10
	addq	%r9, %r13
	addq	%r14, %r12
	addq	%r11, %r10
	addq	%r13, %r11
	rolq	$23, %r12
	rolq	$37, %r10
	rolq	$59, %r11
	movq	%r12, %r13
	movq	%r11, %r14
	xorq	%rbx, %r13
	xorq	%r10, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r14, %r12
	xorq	%r14, %rbx
	movq	%r13, %r10
	movq	%r12, 744(%rsp)
	addq	488(%rsp), %r10
	movq	%r11, %r14
	addq	552(%rsp), %r12
	addq	504(%rsp), %r14
	movq	%rbx, 664(%rsp)
	addq	536(%rsp), %rbx
	movq	%r11, 584(%rsp)
	movq	%r13, 568(%rsp)
	leaq	(%r12,%r10), %r13
	addq	%r9, %r12
	addq	%rax, %r10
	leaq	(%r14,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r14
	addq	%r13, %rbx
	addq	%r13, %r14
	leaq	(%r12,%r11), %r13
	addq	%r11, %r10
	rolq	$23, %r14
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r14, %r11
	rolq	$59, %r13
	xorq	%rbx, %r11
	movq	%r13, %r12
	xorq	%r10, %r12
	xorq	%r12, %r14
	xorq	%r12, %rbx
	movabsq	$-6097248013946911484, %r12
	movq	%r14, 728(%rsp)
	addq	%r12, %rbx
	xorq	%r11, %r13
	movabsq	$3174302594670681997, %r14
	movabsq	$-8739574512844769069, %r12
	addq	728(%rsp), %r12
	addq	%r14, %r13
	movabsq	$6378106504303230091, %r14
	addq	728(%rsp), %r14
	xorq	%r11, %r10
	movabsq	$-496885038275669880, %r11
	addq	%r11, %r10
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%r10, %r12
	addq	%rdi, %rbx
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r12, %rbx
	addq	%r14, %r11
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$7, %r10
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r14, %rbx
	movq	%r13, 712(%rsp)
	addq	664(%rsp), %rbx
	movq	%r13, preCompInternalState+24(%rip)
	movq	%r11, %r13
	addq	584(%rsp), %r13
	movq	%r14, 632(%rsp)
	movq	%r14, preCompInternalState+8(%rip)
	movq	%r12, %r14
	movq	712(%rsp), %r10
	addq	744(%rsp), %r14
	addq	568(%rsp), %r10
	movq	%r11, 728(%rsp)
	movq	%r11, preCompInternalState+16(%rip)
	leaq	(%rbx,%r13), %r11
	movq	%r12, 600(%rsp)
	movq	%r12, preCompInternalState(%rip)
	leaq	(%r10,%r14), %r12
	addq	%r8, %r10
	addq	%r11, %r10
	rolq	$7, %r10
	addq	%r15, %r14
	addq	%rsi, %r13
	addq	%rdi, %rbx
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r13, %r11
	xorq	%r10, %r13
	movq	%r14, 536(%rsp)
	movq	%r13, 488(%rsp)
	movq	%r14, %rbx
	movq	%r11, %r13
	addq	376(%rsp), %rbx
	addq	360(%rsp), %r13
	movq	%r12, %r14
	movq	488(%rsp), %r10
	addq	392(%rsp), %r14
	addq	344(%rsp), %r10
	movq	%r12, 552(%rsp)
	movq	%r11, 504(%rsp)
	leaq	(%rbx,%r13), %r11
	addq	%rsi, %r13
	addq	%rdi, %rbx
	leaq	(%r10,%r14), %r12
	addq	%r15, %r14
	addq	%r8, %r10
	addq	%r11, %r10
	addq	%r14, %r11
	addq	%r12, %rbx
	addq	%r13, %r12
	rolq	$19, %r11
	rolq	$53, %r12
	rolq	$7, %r10
	rolq	$31, %rbx
	movq	%r11, %r14
	movq	%r12, %r13
	xorq	%r10, %r14
	xorq	%rbx, %r13
	xorq	%r13, %r11
	xorq	%r14, %r12
	xorq	%rbx, %r14
	xorq	%r10, %r13
	movq	%r11, 584(%rsp)
	movq	%r14, %rbx
	addq	424(%rsp), %r11
	addq	440(%rsp), %rbx
	movq	%r14, 664(%rsp)
	movq	%r13, 568(%rsp)
	movq	%r13, %r14
	movq	%r12, %r13
	addq	408(%rsp), %r14
	addq	456(%rsp), %r13
	movq	%r12, 744(%rsp)
	leaq	(%r11,%rbx), %r12
	addq	%r11, %rsi
	addq	%rbx, %rdi
	movabsq	$1906713845121804688, %r11
	movabsq	$-4925106476758491821, %rbx
	leaq	0(%r13,%r14), %r10
	addq	%r14, %r8
	addq	%r15, %r13
	leaq	(%r8,%r12), %r14
	addq	%r13, %r12
	movabsq	$853475092736589577, %r15
	rolq	$19, %r12
	addq	%r10, %rdi
	addq	%rsi, %r10
	rolq	$7, %r14
	rolq	$53, %r10
	movq	%r12, %r8
	xorq	%r14, %r8
	rolq	$31, %rdi
	movq	%r10, %rsi
	xorq	%rdi, %rsi
	movq	%r8, %r13
	xorq	%r8, %rdi
	xorq	%r10, %r13
	xorq	%rsi, %r12
	movabsq	$-5486504877919021346, %r10
	xorq	%r14, %rsi
	addq	%r15, %rdi
	addq	%r12, %r10
	addq	%rbx, %rsi
	addq	%r13, %r11
	leaq	(%rdi,%r10), %r8
	movq	%rdi, InternalState+96(%rip)
	movq	%r10, InternalState+104(%rip)
	addq	%rcx, %rdi
	movq	%r11, InternalState+120(%rip)
	addq	%rsi, %r11
	movq	%rsi, InternalState+112(%rip)
	addq	%r11, %rdi
	rolq	$11, %rdi
	addq	%rdx, %r10
	addq	%rax, %rsi
	leaq	(%r11,%r10), %r15
	movabsq	$6102157975113963195, %r10
	addq	%r8, %rsi
	addq	%r10, %r13
	rolq	$37, %rsi
	addq	%r8, %r13
	rolq	$23, %r15
	rolq	$59, %r13
	movq	%r15, %r14
	movq	%r13, %r12
	xorq	%rdi, %r14
	xorq	%rsi, %r12
	xorq	%r14, %r13
	xorq	%rsi, %r14
	xorq	%r12, %r15
	xorq	%rdi, %r12
	movq	%r13, preCompInternalState+112(%rip)
	movq	%r15, preCompInternalState+96(%rip)
	addq	584(%rsp), %r13
	addq	744(%rsp), %r15
	movq	%r12, preCompInternalState+104(%rip)
	movq	%r14, preCompInternalState+120(%rip)
	addq	664(%rsp), %r12
	addq	568(%rsp), %r14
	leaq	0(%r13,%rdx), %r10
	movq	%r13, InternalState+72(%rip)
	leaq	(%r15,%r9), %r11
	movq	%r15, InternalState+88(%rip)
	leaq	(%r12,%rcx), %r8
	leaq	(%r12,%r13), %rdi
	movq	%r12, InternalState+64(%rip)
	leaq	(%r14,%r15), %rsi
	movq	%r14, InternalState+80(%rip)
	addq	%rsi, %r8
	addq	%rsi, %r10
	leaq	(%r14,%rax), %rsi
	rolq	$23, %r10
	rolq	$11, %r8
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movq	%r10, %r11
	rolq	$59, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r11
	movq	%rdi, %rbx
	xorq	%r11, %rdi
	xorq	%rsi, %rbx
	movq	%rdi, preCompInternalState+80(%rip)
	xorq	%r11, %rsi
	xorq	%rbx, %r10
	xorq	%r8, %rbx
	movq	504(%rsp), %r8
	movq	%rbx, preCompInternalState+72(%rip)
	addq	536(%rsp), %rbx
	movq	%rsi, preCompInternalState+88(%rip)
	movq	%r10, preCompInternalState+64(%rip)
	addq	%rdi, %r8
	movq	488(%rsp), %rdi
	addq	%r8, %rdx
	movq	%r8, InternalState+40(%rip)
	addq	%rbx, %rcx
	movq	%rbx, InternalState+32(%rip)
	addq	%rsi, %rdi
	movq	552(%rsp), %rsi
	addq	%rdi, %rax
	movq	%rdi, InternalState+48(%rip)
	addq	%r10, %rsi
	leaq	(%rbx,%r8), %r10
	leaq	(%rdi,%rsi), %r11
	movq	%rsi, InternalState+56(%rip)
	addq	%r9, %rsi
	addq	%r10, %rax
	addq	%rsi, %r10
	addq	%r11, %rdx
	addq	%r11, %rcx
	rolq	$59, %r10
	rolq	$23, %rdx
	rolq	$11, %rcx
	rolq	$37, %rax
	movq	%r10, %rdi
	movq	%rdx, %rsi
	xorq	%rax, %rdi
	xorq	%rcx, %rsi
	xorq	%rsi, %r10
	xorq	%rdi, %rcx
	xorq	%rdi, %rdx
	movq	%rcx, preCompInternalState+40(%rip)
	movq	%r10, preCompInternalState+48(%rip)
	xorq	%rsi, %rax
	addq	632(%rsp), %rcx
	addq	728(%rsp), %r10
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%r10, InternalState+8(%rip)
	addq	712(%rsp), %rax
	addq	600(%rsp), %rdx
	addq	616(%rsp), %rcx
	addq	296(%rsp), %r13
	addq	648(%rsp), %r10
	addq	280(%rsp), %r12
	addq	312(%rsp), %r14
	movq	%rax, InternalState+16(%rip)
	movq	%rdx, InternalState+24(%rip)
	vmovdqa	InternalState(%rip), %ymm0
	addq	680(%rsp), %rax
	addq	696(%rsp), %rdx
	addq	328(%rsp), %r15
	vmovdqa	%ymm0, 904(%rsp)
	vpinsrq	$0, %rcx, %xmm2, %xmm2
	vmovdqa	InternalState+32(%rip), %ymm0
	vpinsrq	$0, %r13, %xmm5, %xmm5
	vpinsrq	$0, %r10, %xmm1, %xmm1
	movq	%rcx, 776(%rsp)
	vmovdqa	%ymm0, 936(%rsp)
	vpinsrq	$0, %rdx, %xmm7, %xmm7
	vmovdqa	InternalState+64(%rip), %ymm0
	vpinsrq	$0, %r12, %xmm6, %xmm6
	movq	%rax, 792(%rsp)
	vpinsrq	$0, %r14, %xmm4, %xmm4
	vmovdqa	%ymm0, 968(%rsp)
	movq	%rdx, 800(%rsp)
	movq	%r13, 816(%rsp)
	vmovdqa	InternalState+96(%rip), %ymm0
	movq	%r14, 824(%rsp)
	movq	%r15, 832(%rsp)
	vpinsrq	$0, %r15, %xmm3, %xmm3
	vmovdqa	%ymm0, 1000(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r10, 784(%rsp)
	movq	%r12, 808(%rsp)
	vmovdqa	%xmm2, 1032(%rsp)
	vpinsrq	$0, %rax, %xmm0, %xmm0
	vmovdqa	%xmm1, 1048(%rsp)
	vmovdqa	%xmm0, 1064(%rsp)
	vmovdqa	%xmm7, 1080(%rsp)
	vmovdqa	%xmm6, 1096(%rsp)
	vmovdqa	%xmm5, 1112(%rsp)
	vmovdqa	%xmm4, 1128(%rsp)
	vmovdqa	%xmm3, 1144(%rsp)
	vmovq	520(%rsp), %xmm8
	movq	904(%rsp), %rax
	vpinsrq	$1, 112(%rsp), %xmm8, %xmm8
	movq	920(%rsp), %r11
	movq	928(%rsp), %r13
	movq	%rax, 120(%rsp)
	movq	912(%rsp), %rax
	movq	936(%rsp), %r14
	movq	944(%rsp), %r15
	movq	%r11, -104(%rsp)
	vmovdqa	%xmm8, 600(%rsp)
	vmovddup	120(%rsp), %xmm8
	movq	%rax, 128(%rsp)
	vmovq	-104(%rsp), %xmm9
	movq	%r13, -104(%rsp)
	vpunpcklqdq	%xmm9, %xmm9, %xmm9
	vmovq	-104(%rsp), %xmm11
	movq	%r14, -104(%rsp)
	vmovdqa	%xmm8, 264(%rsp)
	vpunpcklqdq	%xmm11, %xmm11, %xmm11
	vmovdqa	%xmm8, 1160(%rsp)
	vmovddup	128(%rsp), %xmm8
	vmovdqa	%xmm9, 408(%rsp)
	vmovdqa	%xmm9, 1192(%rsp)
	vmovdqa	%xmm8, 504(%rsp)
	vmovdqa	%xmm8, 1176(%rsp)
	vmovdqa	%xmm11, 392(%rsp)
	vmovdqa	%xmm11, 1208(%rsp)
	vmovq	-104(%rsp), %xmm13
	movq	%r15, -104(%rsp)
	vmovq	-104(%rsp), %xmm9
	vpunpcklqdq	%xmm13, %xmm13, %xmm13
	vpunpcklqdq	%xmm9, %xmm9, %xmm8
	vmovdqa	%xmm13, 376(%rsp)
	vmovdqa	%xmm13, 1224(%rsp)
	vmovdqa	%xmm8, 1240(%rsp)
	movq	952(%rsp), %rax
	movq	968(%rsp), %rcx
	movq	960(%rsp), %rdx
	movq	%rax, 80(%rsp)
	movq	976(%rsp), %rax
	movq	%rcx, 64(%rsp)
	movq	1000(%rsp), %rcx
	vmovddup	64(%rsp), %xmm11
	movq	%rdx, 72(%rsp)
	movq	992(%rsp), %rdx
	movq	%rax, 56(%rsp)
	movq	984(%rsp), %rax
	movq	%rcx, 32(%rsp)
	vmovddup	80(%rsp), %xmm9
	vmovddup	32(%rsp), %xmm13
	movq	%rdx, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	1008(%rsp), %rax
	vmovdqa	%xmm11, 360(%rsp)
	vmovddup	72(%rsp), %xmm10
	vmovdqa	%xmm11, 1288(%rsp)
	vmovddup	56(%rsp), %xmm11
	vmovddup	40(%rsp), %xmm12
	vmovdqa	%xmm13, 328(%rsp)
	movq	%rax, 24(%rsp)
	vmovdqa	%xmm11, 344(%rsp)
	vmovdqa	%xmm11, 1304(%rsp)
	vmovddup	48(%rsp), %xmm11
	vmovdqa	%xmm13, 1352(%rsp)
	vmovddup	24(%rsp), %xmm13
	vmovdqa	%xmm9, 1256(%rsp)
	vmovdqa	%xmm10, 1272(%rsp)
	vmovdqa	%xmm11, 1320(%rsp)
	vmovdqa	%xmm12, 1336(%rsp)
	vmovdqa	%xmm13, 312(%rsp)
	vmovdqa	%xmm13, 1368(%rsp)
	movq	1016(%rsp), %rax
	movq	(%rsp), %rcx
	movq	%rax, 16(%rsp)
	movq	1024(%rsp), %rax
	shrq	$7, %rcx
	vmovddup	16(%rsp), %xmm13
	testq	%rcx, %rcx
	movq	%rax, 8(%rsp)
	vmovdqa	%xmm13, 296(%rsp)
	vmovdqa	%xmm13, 1384(%rsp)
	vmovddup	8(%rsp), %xmm13
	vmovdqa	%xmm13, 280(%rsp)
	vmovdqa	%xmm13, 1400(%rsp)
	je	.L50
	vmovdqa	%xmm0, 648(%rsp)
	vpaddq	%xmm10, %xmm9, %xmm0
	movq	-80(%rsp), %rdx
	movq	96(%rsp), %rax
	xorl	%esi, %esi
	vmovdqa	%xmm0, 248(%rsp)
	vmovdqa	%xmm3, 712(%rsp)
	vmovdqa	%xmm2, 696(%rsp)
	vpaddq	%xmm12, %xmm11, %xmm2
	vmovdqa	%xmm2, 472(%rsp)
	vpaddq	.LC2(%rip), %xmm8, %xmm2
	vpaddq	248(%rsp), %xmm2, %xmm2
	vmovdqa	%xmm1, 680(%rsp)
	vpaddq	376(%rsp), %xmm8, %xmm1
	vmovdqa	%xmm7, 520(%rsp)
	vmovdqa	%xmm5, 616(%rsp)
	vmovdqa	%xmm4, 728(%rsp)
	vmovdqa	%xmm6, 632(%rsp)
	vmovdqa	360(%rsp), %xmm3
	vpaddq	344(%rsp), %xmm3, %xmm0
	vpsrlq	$41, %xmm2, %xmm3
	vpsllq	$23, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm2
	vmovdqa	408(%rsp), %xmm13
	vmovdqa	%xmm2, 232(%rsp)
	vpaddq	.LC3(%rip), %xmm1, %xmm2
	vpaddq	%xmm9, %xmm2, %xmm2
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm2
	vpaddq	.LC4(%rip), %xmm1, %xmm1
	vpaddq	%xmm10, %xmm1, %xmm1
	vpaddq	392(%rsp), %xmm13, %xmm13
	vmovdqa	%xmm13, 488(%rsp)
	vmovdqa	%xmm2, 216(%rsp)
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vmovdqa	216(%rsp), %xmm7
	vpxor	%xmm1, %xmm7, %xmm7
	vmovdqa	296(%rsp), %xmm4
	vpxor	232(%rsp), %xmm7, %xmm8
	vpaddq	280(%rsp), %xmm4, %xmm4
	vmovdqa	328(%rsp), %xmm5
	vmovdqa	%xmm1, 200(%rsp)
	vpaddq	312(%rsp), %xmm5, %xmm5
	vmovdqa	%xmm4, 440(%rsp)
	vmovdqa	%xmm5, 456(%rsp)
	vmovdqa	%xmm7, 184(%rsp)
	vmovdqa	%xmm8, 136(%rsp)
	vpaddq	.LC3(%rip), %xmm0, %xmm1
	vpaddq	%xmm11, %xmm1, %xmm1
	vpsrlq	$27, %xmm1, %xmm2
	vpsllq	$37, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm0
	vmovdqa	%xmm1, 168(%rsp)
	vpsrlq	$5, %xmm0, %xmm1
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm0
	vmovdqa	168(%rsp), %xmm9
	vpxor	%xmm0, %xmm9, %xmm9
	vmovdqa	%xmm0, 152(%rsp)
	vmovdqa	%xmm9, 424(%rsp)
	.p2align 4,,10
	.p2align 3
.L20:
	vmovdqa	600(%rsp), %xmm11
	addq	$1, %rsi
	vmovdqa	264(%rsp), %xmm13
	vpaddq	.LC0(%rip), %xmm11, %xmm11
	vpxor	%xmm11, %xmm13, %xmm2
	vmovdqa	.LC2(%rip), %xmm3
	vpaddq	504(%rsp), %xmm2, %xmm0
	vpaddq	.LC1(%rip), %xmm2, %xmm2
	vpaddq	488(%rsp), %xmm2, %xmm2
	vpsrlq	$53, %xmm2, %xmm1
	vpsllq	$11, %xmm2, %xmm2
	vpor	%xmm1, %xmm2, %xmm1
	vpaddq	504(%rsp), %xmm3, %xmm2
	vpaddq	488(%rsp), %xmm2, %xmm2
	vpsrlq	$41, %xmm2, %xmm3
	vpsllq	$23, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm3
	vpaddq	.LC3(%rip), %xmm0, %xmm2
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	408(%rsp), %xmm2, %xmm2
	vpaddq	392(%rsp), %xmm0, %xmm0
	vpsrlq	$27, %xmm2, %xmm4
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm4, %xmm2, %xmm5
	vpsrlq	$5, %xmm0, %xmm2
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm2, %xmm0, %xmm2
	vpxor	%xmm3, %xmm1, %xmm0
	vmovdqa	.LC2(%rip), %xmm8
	vpxor	%xmm2, %xmm5, %xmm4
	vpxor	%xmm0, %xmm2, %xmm2
	vpxor	%xmm0, %xmm5, %xmm5
	vpxor	%xmm3, %xmm4, %xmm3
	vpxor	%xmm1, %xmm4, %xmm1
	vpaddq	_ZL14preCompConstV2+32(%rip), %xmm2, %xmm2
	vpaddq	_ZL14preCompConstV2+48(%rip), %xmm5, %xmm5
	vmovdqa	%xmm11, 600(%rsp)
	vpaddq	_ZL14preCompConstV2(%rip), %xmm3, %xmm3
	vpaddq	%xmm3, %xmm5, %xmm0
	vpaddq	_ZL14preCompConstV2+16(%rip), %xmm1, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm4
	vpaddq	.LC7(%rip), %xmm1, %xmm1
	vpaddq	.LC5(%rip), %xmm4, %xmm6
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	.LC6(%rip), %xmm4, %xmm4
	vpaddq	%xmm3, %xmm4, %xmm3
	vpsrlq	$45, %xmm3, %xmm4
	vpsllq	$19, %xmm3, %xmm3
	vpor	%xmm4, %xmm3, %xmm14
	vpaddq	%xmm0, %xmm1, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm0
	vpsrlq	$33, %xmm3, %xmm1
	vpsrlq	$11, %xmm0, %xmm2
	vpsllq	$31, %xmm3, %xmm3
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm3, %xmm1
	vpaddq	%xmm5, %xmm6, %xmm5
	vpor	%xmm2, %xmm0, %xmm9
	vpsrlq	$57, %xmm5, %xmm6
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm13
	vmovdqa	.LC1(%rip), %xmm4
	vpxor	%xmm9, %xmm1, %xmm0
	vpxor	%xmm14, %xmm13, %xmm15
	vpxor	%xmm0, %xmm14, %xmm14
	vpxor	%xmm0, %xmm13, %xmm0
	vmovdqa	.LC1(%rip), %xmm13
	vpxor	%xmm9, %xmm15, %xmm9
	vpxor	%xmm1, %xmm15, %xmm15
	vmovdqa	%xmm0, 584(%rsp)
	vpaddq	376(%rsp), %xmm4, %xmm0
	vpaddq	248(%rsp), %xmm0, %xmm0
	vpsrlq	$53, %xmm0, %xmm1
	vpsllq	$11, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpaddq	136(%rsp), %xmm9, %xmm3
	vmovdqa	%xmm9, 744(%rsp)
	vmovdqa	%xmm14, 664(%rsp)
	vpxor	232(%rsp), %xmm1, %xmm5
	vpxor	184(%rsp), %xmm1, %xmm1
	vpxor	200(%rsp), %xmm5, %xmm2
	vpxor	216(%rsp), %xmm5, %xmm5
	vpaddq	%xmm1, %xmm15, %xmm1
	vpaddq	%xmm14, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm4
	vpaddq	.LC7(%rip), %xmm1, %xmm1
	vpaddq	.LC5(%rip), %xmm4, %xmm6
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	.LC6(%rip), %xmm4, %xmm4
	vpaddq	584(%rsp), %xmm5, %xmm5
	vpaddq	%xmm3, %xmm5, %xmm0
	vpaddq	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm3, %xmm4, %xmm3
	vpsrlq	$57, %xmm5, %xmm6
	vpsrlq	$45, %xmm3, %xmm4
	vpsllq	$7, %xmm5, %xmm5
	vpsllq	$19, %xmm3, %xmm3
	vpor	%xmm6, %xmm5, %xmm6
	vpor	%xmm4, %xmm3, %xmm9
	vpaddq	%xmm0, %xmm1, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm0
	vpsrlq	$33, %xmm3, %xmm1
	vpsrlq	$11, %xmm0, %xmm2
	vpsllq	$31, %xmm3, %xmm3
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm3, %xmm1
	vpor	%xmm2, %xmm0, %xmm7
	vmovdqa	.LC1(%rip), %xmm5
	vpxor	%xmm9, %xmm6, %xmm11
	vpxor	%xmm7, %xmm1, %xmm0
	vpxor	%xmm7, %xmm11, %xmm7
	vpxor	%xmm1, %xmm11, %xmm11
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm6, %xmm6
	vpaddq	360(%rsp), %xmm5, %xmm0
	vpaddq	472(%rsp), %xmm0, %xmm0
	vpsrlq	$53, %xmm0, %xmm1
	vpsllq	$11, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpaddq	344(%rsp), %xmm8, %xmm0
	vpaddq	472(%rsp), %xmm0, %xmm0
	vpsrlq	$41, %xmm0, %xmm2
	vpsllq	$23, %xmm0, %xmm4
	vpor	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm1, %xmm2
	vpxor	424(%rsp), %xmm4, %xmm4
	vpxor	152(%rsp), %xmm2, %xmm3
	vpxor	424(%rsp), %xmm1, %xmm1
	vpaddq	%xmm4, %xmm7, %xmm4
	vpxor	168(%rsp), %xmm2, %xmm2
	vpaddq	%xmm3, %xmm9, %xmm3
	vpaddq	%xmm1, %xmm11, %xmm1
	vpaddq	%xmm3, %xmm1, %xmm5
	vpaddq	.LC7(%rip), %xmm1, %xmm1
	vpaddq	.LC5(%rip), %xmm5, %xmm8
	vpaddq	.LC8(%rip), %xmm3, %xmm3
	vpaddq	.LC6(%rip), %xmm5, %xmm5
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm4, %xmm2, %xmm0
	vpaddq	%xmm2, %xmm8, %xmm8
	vpaddq	%xmm4, %xmm5, %xmm4
	vpsrlq	$57, %xmm8, %xmm2
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$7, %xmm8, %xmm8
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm2, %xmm8, %xmm2
	vpor	%xmm5, %xmm4, %xmm5
	vpaddq	%xmm0, %xmm1, %xmm4
	vpaddq	%xmm0, %xmm3, %xmm0
	vpsrlq	$33, %xmm4, %xmm1
	vpsrlq	$11, %xmm0, %xmm3
	vpsllq	$31, %xmm4, %xmm4
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm4, %xmm1
	vpor	%xmm3, %xmm0, %xmm3
	vmovdqa	.LC3(%rip), %xmm4
	vpxor	%xmm5, %xmm2, %xmm10
	vpxor	%xmm3, %xmm1, %xmm0
	vpxor	%xmm3, %xmm10, %xmm3
	vpxor	%xmm1, %xmm10, %xmm10
	vpxor	%xmm0, %xmm5, %xmm5
	vpxor	%xmm0, %xmm2, %xmm2
	vpaddq	328(%rsp), %xmm13, %xmm0
	vmovdqa	.LC4(%rip), %xmm13
	vpaddq	440(%rsp), %xmm0, %xmm0
	vpsrlq	$53, %xmm0, %xmm1
	vpsllq	$11, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm8
	vmovdqa	.LC2(%rip), %xmm1
	vpaddq	312(%rsp), %xmm1, %xmm0
	vpaddq	440(%rsp), %xmm0, %xmm0
	vpsrlq	$41, %xmm0, %xmm1
	vpsllq	$23, %xmm0, %xmm12
	vpaddq	456(%rsp), %xmm4, %xmm0
	vpor	%xmm1, %xmm12, %xmm12
	vpaddq	296(%rsp), %xmm0, %xmm0
	vpsrlq	$27, %xmm0, %xmm1
	vpsllq	$37, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm4
	vpaddq	456(%rsp), %xmm13, %xmm0
	vpaddq	280(%rsp), %xmm0, %xmm0
	vpsrlq	$5, %xmm0, %xmm1
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm12, %xmm8, %xmm0
	vpxor	%xmm1, %xmm4, %xmm13
	vpxor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm0, %xmm4, %xmm4
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm4, %xmm2, %xmm4
	vpaddq	%xmm12, %xmm3, %xmm12
	vpaddq	%xmm12, %xmm4, %xmm0
	vpaddq	%xmm8, %xmm10, %xmm8
	vpaddq	%xmm1, %xmm8, %xmm13
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	.LC5(%rip), %xmm13, %xmm14
	vpaddq	.LC8(%rip), %xmm1, %xmm1
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm4, %xmm14, %xmm4
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm4, %xmm14
	vpsrlq	$45, %xmm12, %xmm13
	vpsllq	$7, %xmm4, %xmm4
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm14, %xmm4, %xmm4
	vpor	%xmm13, %xmm12, %xmm13
	vpaddq	%xmm0, %xmm8, %xmm12
	vpaddq	%xmm0, %xmm1, %xmm0
	vpsrlq	$33, %xmm12, %xmm8
	vpsrlq	$11, %xmm0, %xmm1
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm8, %xmm12, %xmm8
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm13, %xmm4, %xmm0
	vpxor	%xmm1, %xmm8, %xmm12
	vpxor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm8, %xmm0, %xmm0
	vpxor	%xmm12, %xmm13, %xmm13
	vpxor	%xmm12, %xmm4, %xmm4
	vpaddq	_ZL14preCompConstV2+64(%rip), %xmm1, %xmm1
	vpaddq	_ZL14preCompConstV2+80(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+96(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm0, %xmm8
	vpaddq	.LC1(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+112(%rip), %xmm4, %xmm4
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	%xmm1, %xmm4, %xmm12
	vpaddq	%xmm12, %xmm0, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm0
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm0, %xmm14, %xmm0
	vpor	%xmm13, %xmm12, %xmm13
	vpaddq	.LC3(%rip), %xmm8, %xmm12
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpaddq	%xmm4, %xmm12, %xmm4
	vpaddq	%xmm1, %xmm8, %xmm1
	vpsrlq	$27, %xmm4, %xmm12
	vpsrlq	$5, %xmm1, %xmm8
	vpsllq	$37, %xmm4, %xmm4
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm12, %xmm4, %xmm4
	vpor	%xmm8, %xmm1, %xmm8
	vpxor	%xmm13, %xmm0, %xmm1
	vpxor	%xmm8, %xmm4, %xmm12
	vpxor	%xmm1, %xmm8, %xmm8
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm13, %xmm12, %xmm13
	vpxor	%xmm0, %xmm12, %xmm0
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	%xmm1, %xmm2, %xmm2
	vmovdqa	%xmm13, 568(%rsp)
	vpaddq	%xmm13, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm10, %xmm10
	vmovdqa	%xmm8, 552(%rsp)
	vpaddq	%xmm5, %xmm10, %xmm8
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm5, %xmm5
	vmovdqa	%xmm1, 536(%rsp)
	vpaddq	%xmm3, %xmm2, %xmm1
	vpaddq	%xmm1, %xmm10, %xmm10
	vpaddq	%xmm1, %xmm5, %xmm5
	vpsrlq	$53, %xmm10, %xmm4
	vpsllq	$23, %xmm5, %xmm1
	vpsllq	$11, %xmm10, %xmm10
	vpor	%xmm4, %xmm10, %xmm4
	vpsrlq	$41, %xmm5, %xmm10
	vpaddq	.LC3(%rip), %xmm8, %xmm5
	vpor	%xmm10, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm5, %xmm2
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpsrlq	$27, %xmm2, %xmm5
	vpaddq	%xmm3, %xmm8, %xmm8
	vpsllq	$37, %xmm2, %xmm2
	vpsllq	$59, %xmm8, %xmm3
	vpor	%xmm5, %xmm2, %xmm5
	vpsrlq	$5, %xmm8, %xmm2
	vpor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm3, %xmm5, %xmm8
	vpxor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm2, %xmm5, %xmm2
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm3, %xmm9, %xmm9
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm6, %xmm5
	vpaddq	%xmm4, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm11, %xmm10
	vpaddq	.LC1(%rip), %xmm11, %xmm11
	vpaddq	.LC2(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm11, %xmm11
	vpaddq	%xmm5, %xmm9, %xmm9
	vpsrlq	$53, %xmm11, %xmm8
	vpsllq	$23, %xmm9, %xmm5
	vpsllq	$11, %xmm11, %xmm11
	vpor	%xmm8, %xmm11, %xmm8
	vpsrlq	$41, %xmm9, %xmm11
	vpaddq	.LC3(%rip), %xmm10, %xmm9
	vpor	%xmm11, %xmm5, %xmm5
	vpaddq	%xmm6, %xmm9, %xmm6
	vpaddq	.LC4(%rip), %xmm10, %xmm10
	vpsrlq	$27, %xmm6, %xmm9
	vpaddq	%xmm7, %xmm10, %xmm10
	vpsllq	$37, %xmm6, %xmm6
	vpsllq	$59, %xmm10, %xmm7
	vpor	%xmm9, %xmm6, %xmm9
	vpsrlq	$5, %xmm10, %xmm6
	vpor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm7, %xmm9, %xmm10
	vpxor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpxor	%xmm5, %xmm10, %xmm5
	vpxor	%xmm8, %xmm10, %xmm8
	vpaddq	664(%rsp), %xmm7, %xmm14
	vpaddq	584(%rsp), %xmm6, %xmm13
	vpaddq	744(%rsp), %xmm5, %xmm9
	vpaddq	%xmm9, %xmm13, %xmm12
	vpaddq	%xmm8, %xmm15, %xmm15
	vpaddq	%xmm14, %xmm15, %xmm10
	vpaddq	.LC1(%rip), %xmm15, %xmm15
	vpaddq	.LC2(%rip), %xmm14, %xmm14
	vpaddq	%xmm12, %xmm15, %xmm15
	vpaddq	%xmm12, %xmm14, %xmm14
	vpsrlq	$53, %xmm15, %xmm11
	vpsllq	$23, %xmm14, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpor	%xmm11, %xmm15, %xmm11
	vpsrlq	$41, %xmm14, %xmm15
	vpaddq	.LC3(%rip), %xmm10, %xmm14
	vpor	%xmm15, %xmm12, %xmm12
	vpaddq	.LC4(%rip), %xmm10, %xmm10
	vpaddq	%xmm13, %xmm14, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$27, %xmm13, %xmm14
	vpsrlq	$5, %xmm9, %xmm10
	vpsllq	$37, %xmm13, %xmm13
	vpsllq	$59, %xmm9, %xmm9
	vpor	%xmm14, %xmm13, %xmm14
	vpor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm12, %xmm11, %xmm9
	vpxor	%xmm10, %xmm14, %xmm13
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm9, %xmm14, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm11, %xmm13, %xmm11
	vpaddq	_ZL14preCompConstV2+160(%rip), %xmm10, %xmm10
	vpaddq	_ZL14preCompConstV2+176(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+128(%rip), %xmm12, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm9
	vpaddq	_ZL14preCompConstV2+144(%rip), %xmm11, %xmm11
	vpaddq	%xmm10, %xmm11, %xmm13
	vpaddq	.LC7(%rip), %xmm11, %xmm11
	vpaddq	.LC5(%rip), %xmm13, %xmm15
	vpaddq	.LC8(%rip), %xmm10, %xmm10
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm14, %xmm15, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm14, %xmm15
	vpsrlq	$45, %xmm12, %xmm13
	vpsllq	$7, %xmm14, %xmm14
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	%xmm9, %xmm11, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$33, %xmm13, %xmm11
	vpsrlq	$11, %xmm9, %xmm10
	vpsllq	$31, %xmm13, %xmm13
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm11, %xmm13, %xmm11
	vpor	%xmm10, %xmm9, %xmm13
	vpxor	%xmm12, %xmm14, %xmm10
	vpxor	%xmm13, %xmm11, %xmm9
	vpxor	%xmm13, %xmm10, %xmm13
	vpxor	%xmm11, %xmm10, %xmm10
	vpxor	%xmm9, %xmm12, %xmm12
	vpxor	%xmm9, %xmm14, %xmm9
	vpaddq	%xmm13, %xmm5, %xmm5
	vpaddq	%xmm8, %xmm10, %xmm8
	vmovdqa	%xmm13, 744(%rsp)
	vpaddq	%xmm12, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm6, %xmm6
	vpaddq	.LC8(%rip), %xmm7, %xmm7
	vmovdqa	%xmm12, 664(%rsp)
	vpaddq	%xmm5, %xmm6, %xmm12
	vmovdqa	%xmm9, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$57, %xmm6, %xmm9
	vpsllq	$7, %xmm6, %xmm6
	vpor	%xmm9, %xmm6, %xmm9
	vpsrlq	$45, %xmm5, %xmm6
	vpsllq	$19, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm11
	vpaddq	%xmm12, %xmm8, %xmm5
	vpaddq	%xmm12, %xmm7, %xmm12
	vpsrlq	$33, %xmm5, %xmm6
	vpsllq	$31, %xmm5, %xmm8
	vpsrlq	$11, %xmm12, %xmm5
	vpor	%xmm6, %xmm8, %xmm8
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm5, %xmm12, %xmm5
	vpxor	%xmm11, %xmm9, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm5, %xmm7, %xmm5
	vpxor	%xmm8, %xmm7, %xmm8
	vpxor	%xmm6, %xmm11, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC7(%rip), %xmm4, %xmm4
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm1, %xmm2, %xmm12
	vpaddq	.LC8(%rip), %xmm3, %xmm3
	vpaddq	%xmm1, %xmm11, %xmm1
	vpaddq	%xmm2, %xmm9, %xmm2
	vpsrlq	$57, %xmm2, %xmm9
	vpsllq	$7, %xmm2, %xmm2
	vpor	%xmm9, %xmm2, %xmm9
	vpsrlq	$45, %xmm1, %xmm2
	vpsllq	$19, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm11
	vpaddq	%xmm12, %xmm4, %xmm1
	vpaddq	%xmm12, %xmm3, %xmm12
	vpsrlq	$33, %xmm1, %xmm2
	vpsllq	$31, %xmm1, %xmm4
	vpsrlq	$11, %xmm12, %xmm1
	vpor	%xmm2, %xmm4, %xmm4
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm1, %xmm12, %xmm1
	vpxor	%xmm11, %xmm9, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm1, %xmm3, %xmm1
	vpxor	%xmm4, %xmm3, %xmm4
	vpxor	%xmm2, %xmm11, %xmm3
	vpxor	%xmm2, %xmm9, %xmm2
	vpaddq	568(%rsp), %xmm1, %xmm13
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	552(%rsp), %xmm3, %xmm12
	vpaddq	%xmm12, %xmm0, %xmm14
	vpaddq	.LC8(%rip), %xmm12, %xmm12
	vpaddq	536(%rsp), %xmm2, %xmm11
	vpaddq	.LC5(%rip), %xmm14, %xmm15
	vpaddq	%xmm13, %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm14, %xmm14
	vpaddq	%xmm11, %xmm15, %xmm11
	vpaddq	%xmm13, %xmm14, %xmm13
	vpsrlq	$57, %xmm11, %xmm15
	vpsrlq	$45, %xmm13, %xmm14
	vpaddq	.LC7(%rip), %xmm0, %xmm0
	vpsllq	$7, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm0, %xmm0
	vpor	%xmm15, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm12, %xmm9
	vpsllq	$19, %xmm13, %xmm13
	vpor	%xmm14, %xmm13, %xmm13
	vpsrlq	$33, %xmm0, %xmm14
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm14, %xmm0, %xmm14
	vpsrlq	$11, %xmm9, %xmm0
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm13, %xmm11, %xmm12
	vpxor	%xmm0, %xmm14, %xmm9
	vpxor	%xmm0, %xmm12, %xmm0
	vpxor	%xmm14, %xmm12, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+192(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+208(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+224(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+240(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm4, %xmm4
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC1(%rip), %xmm4, %xmm4
	vmovdqa	%xmm9, 552(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 536(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm4, %xmm4
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm4, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm4, %xmm4
	vpor	%xmm9, %xmm4, %xmm9
	vpsrlq	$41, %xmm3, %xmm4
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm4, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm4
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm4, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm7, %xmm7
	vpaddq	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm0, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm6, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm8
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vpaddq	.LC2(%rip), %xmm7, %xmm7
	vpaddq	%xmm4, %xmm8, %xmm8
	vpaddq	%xmm4, %xmm7, %xmm7
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm7, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm7, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm7
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm7, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$27, %xmm6, %xmm7
	vpsllq	$37, %xmm6, %xmm6
	vpor	%xmm7, %xmm6, %xmm8
	vpsrlq	$5, %xmm5, %xmm6
	vpsllq	$59, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpxor	%xmm4, %xmm9, %xmm5
	vpxor	%xmm6, %xmm8, %xmm7
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm7, %xmm4
	vpxor	%xmm9, %xmm7, %xmm7
	vpaddq	664(%rsp), %xmm6, %xmm12
	vpaddq	584(%rsp), %xmm5, %xmm9
	vpaddq	744(%rsp), %xmm4, %xmm13
	vpaddq	%xmm13, %xmm9, %xmm11
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm12, %xmm10, %xmm8
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$53, %xmm15, %xmm10
	vpsrlq	$41, %xmm11, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpsllq	$23, %xmm11, %xmm11
	vpor	%xmm10, %xmm15, %xmm10
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	.LC3(%rip), %xmm8, %xmm12
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm12, %xmm9
	vpaddq	%xmm13, %xmm8, %xmm13
	vpsrlq	$27, %xmm9, %xmm12
	vpsrlq	$5, %xmm13, %xmm8
	vpsllq	$37, %xmm9, %xmm9
	vpsllq	$59, %xmm13, %xmm13
	vpor	%xmm12, %xmm9, %xmm12
	vpor	%xmm8, %xmm13, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm12, %xmm13
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm11, %xmm13, %xmm11
	vpxor	%xmm10, %xmm13, %xmm10
	vpaddq	_ZL14preCompConstV2+288(%rip), %xmm9, %xmm9
	vpxor	%xmm8, %xmm12, %xmm13
	vpaddq	_ZL14preCompConstV2+256(%rip), %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+272(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	_ZL14preCompConstV2+304(%rip), %xmm13, %xmm13
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vmovdqa	%xmm11, 664(%rsp)
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	536(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	552(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+320(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+336(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+352(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+368(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm8, %xmm8
	vpaddq	%xmm3, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vmovdqa	%xmm9, 552(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 536(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm8, %xmm8
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm3, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm8, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm8
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm8, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm9
	vpaddq	%xmm9, %xmm5, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm7
	vpaddq	%xmm6, %xmm7, %xmm11
	vpaddq	.LC1(%rip), %xmm7, %xmm7
	vpaddq	.LC2(%rip), %xmm6, %xmm6
	vpaddq	%xmm4, %xmm7, %xmm8
	vpaddq	%xmm4, %xmm6, %xmm6
	vpsrlq	$53, %xmm8, %xmm7
	vpsllq	$23, %xmm6, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm7, %xmm8, %xmm7
	vpsrlq	$41, %xmm6, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm6
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$27, %xmm5, %xmm6
	vpsllq	$37, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm8
	vpsrlq	$5, %xmm9, %xmm5
	vpsllq	$59, %xmm9, %xmm6
	vpor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm6, %xmm8, %xmm9
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm9, %xmm4
	vpxor	%xmm7, %xmm9, %xmm7
	vpaddq	664(%rsp), %xmm6, %xmm11
	vpaddq	584(%rsp), %xmm5, %xmm8
	vpaddq	744(%rsp), %xmm4, %xmm12
	vpaddq	%xmm12, %xmm8, %xmm9
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm9, %xmm10, %xmm13
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$53, %xmm13, %xmm10
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$11, %xmm13, %xmm13
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm10, %xmm13, %xmm10
	vpor	%xmm11, %xmm9, %xmm11
	vpaddq	.LC3(%rip), %xmm15, %xmm9
	vpaddq	.LC4(%rip), %xmm15, %xmm15
	vpaddq	%xmm8, %xmm9, %xmm8
	vpaddq	%xmm12, %xmm15, %xmm12
	vpsrlq	$27, %xmm8, %xmm9
	vpsllq	$37, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm13
	vpsrlq	$5, %xmm12, %xmm8
	vpsllq	$59, %xmm12, %xmm12
	vpor	%xmm8, %xmm12, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm13, %xmm12
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm8, %xmm13, %xmm13
	vpxor	%xmm11, %xmm12, %xmm11
	vpxor	%xmm10, %xmm12, %xmm10
	vpaddq	_ZL14preCompConstV2+416(%rip), %xmm9, %xmm9
	vpaddq	_ZL14preCompConstV2+432(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+384(%rip), %xmm11, %xmm11
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	_ZL14preCompConstV2+400(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vmovdqa	%xmm11, 664(%rsp)
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	536(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	552(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+448(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+464(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+480(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+496(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm15
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm15, %xmm8, %xmm8
	vpaddq	.LC1(%rip), %xmm8, %xmm11
	vmovdqa	%xmm9, 552(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm9
	vpaddq	%xmm9, %xmm11, %xmm11
	vpsrlq	$53, %xmm11, %xmm12
	vpsllq	$11, %xmm11, %xmm11
	vpor	%xmm12, %xmm11, %xmm12
	vmovdqa	%xmm0, 536(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm11
	vpaddq	%xmm3, %xmm8, %xmm0
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm11, %xmm9, %xmm14
	vpaddq	.LC3(%rip), %xmm0, %xmm11
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm2, %xmm11, %xmm11
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$27, %xmm11, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpor	%xmm9, %xmm11, %xmm9
	vpsrlq	$5, %xmm0, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpxor	%xmm14, %xmm12, %xmm0
	vpxor	%xmm11, %xmm9, %xmm13
	vpxor	%xmm0, %xmm11, %xmm11
	vpxor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm14, %xmm13, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm11, %xmm6, %xmm11
	vpaddq	%xmm0, %xmm5, %xmm5
	vpaddq	%xmm14, %xmm4, %xmm14
	vpaddq	%xmm14, %xmm5, %xmm0
	vpaddq	%xmm12, %xmm7, %xmm12
	vpaddq	%xmm11, %xmm12, %xmm9
	vpaddq	.LC1(%rip), %xmm12, %xmm12
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm0, %xmm12, %xmm4
	vpaddq	%xmm0, %xmm11, %xmm11
	vpsrlq	$53, %xmm4, %xmm6
	vpsllq	$23, %xmm11, %xmm0
	vpsllq	$11, %xmm4, %xmm4
	vpor	%xmm6, %xmm4, %xmm12
	vpsrlq	$41, %xmm11, %xmm4
	vpor	%xmm4, %xmm0, %xmm0
	vpaddq	.LC3(%rip), %xmm9, %xmm4
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm4, %xmm5
	vpaddq	%xmm14, %xmm9, %xmm14
	vpsrlq	$27, %xmm5, %xmm4
	vpsllq	$37, %xmm5, %xmm5
	vpor	%xmm4, %xmm5, %xmm7
	vpsrlq	$5, %xmm14, %xmm4
	vpsllq	$59, %xmm14, %xmm5
	vpor	%xmm4, %xmm5, %xmm5
	vmovq	(%rdx), %xmm9
	vpxor	%xmm0, %xmm12, %xmm4
	vpxor	%xmm5, %xmm7, %xmm6
	vpxor	%xmm4, %xmm5, %xmm5
	vpxor	%xmm4, %xmm7, %xmm4
	vpinsrq	$1, 64(%rdx), %xmm9, %xmm7
	vpaddq	664(%rsp), %xmm5, %xmm11
	vpxor	%xmm0, %xmm6, %xmm0
	vpaddq	584(%rsp), %xmm4, %xmm13
	vpxor	%xmm12, %xmm6, %xmm6
	vpaddq	744(%rsp), %xmm0, %xmm12
	vpaddq	%xmm6, %xmm10, %xmm10
	vpxor	%xmm7, %xmm10, %xmm10
	vmovdqu	%xmm10, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 64(%rax)
	vmovdqu	%xmm10, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 128(%rax)
	vmovq	8(%rdx), %xmm9
	vpinsrq	$1, 72(%rdx), %xmm9, %xmm7
	vpxor	%xmm7, %xmm11, %xmm11
	vmovdqu	%xmm11, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 72(%rax)
	vmovdqu	%xmm11, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 136(%rax)
	vmovq	16(%rdx), %xmm7
	vpinsrq	$1, 80(%rdx), %xmm7, %xmm9
	vpxor	%xmm9, %xmm13, %xmm9
	vmovdqu	%xmm9, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 80(%rax)
	vmovdqu	%xmm9, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 144(%rax)
	vmovq	24(%rdx), %xmm13
	vpinsrq	$1, 88(%rdx), %xmm13, %xmm7
	vpxor	%xmm7, %xmm12, %xmm7
	vmovdqu	%xmm7, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 88(%rax)
	vmovdqu	%xmm7, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 152(%rax)
	vmovq	32(%rdx), %xmm13
	vpinsrq	$1, 96(%rdx), %xmm13, %xmm12
	vpxor	%xmm12, %xmm8, %xmm8
	vmovdqu	%xmm8, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 96(%rax)
	vmovdqu	%xmm8, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 160(%rax)
	vmovq	40(%rdx), %xmm13
	vpinsrq	$1, 104(%rdx), %xmm13, %xmm12
	vpxor	%xmm12, %xmm3, %xmm3
	vmovdqu	%xmm3, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 104(%rax)
	vmovdqu	%xmm3, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 168(%rax)
	vmovq	48(%rdx), %xmm13
	vpinsrq	$1, 112(%rdx), %xmm13, %xmm12
	vpxor	%xmm12, %xmm2, %xmm2
	vmovdqu	%xmm2, 760(%rsp)
	movq	760(%rsp), %rdi
	movq	%rdi, 112(%rax)
	vmovdqu	%xmm2, 760(%rsp)
	movq	768(%rsp), %rdi
	movq	%rdi, 176(%rax)
	vmovq	56(%rdx), %xmm13
	vpinsrq	$1, 120(%rdx), %xmm13, %xmm12
	vpaddq	%xmm7, %xmm9, %xmm13
	subq	$-128, %rdx
	vpxor	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm11, %xmm10, %xmm12
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm13, %xmm10, %xmm14
	vpaddq	%xmm13, %xmm11, %xmm13
	vpsrlq	$53, %xmm14, %xmm10
	vpsrlq	$41, %xmm13, %xmm11
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm13, %xmm13
	vpor	%xmm10, %xmm14, %xmm10
	vpor	%xmm11, %xmm13, %xmm11
	vpaddq	.LC3(%rip), %xmm12, %xmm13
	vpaddq	.LC4(%rip), %xmm12, %xmm12
	vpaddq	%xmm9, %xmm13, %xmm9
	vpaddq	%xmm7, %xmm12, %xmm7
	vpsrlq	$27, %xmm9, %xmm13
	vpsllq	$37, %xmm9, %xmm9
	vpor	%xmm13, %xmm9, %xmm13
	vpsrlq	$5, %xmm7, %xmm9
	vpsllq	$59, %xmm7, %xmm7
	vpor	%xmm9, %xmm7, %xmm9
	vpxor	%xmm11, %xmm10, %xmm7
	vmovdqu	%xmm1, 760(%rsp)
	vpxor	%xmm9, %xmm13, %xmm12
	movq	760(%rsp), %rdi
	vpxor	%xmm7, %xmm9, %xmm9
	vpxor	%xmm7, %xmm13, %xmm13
	vpxor	%xmm11, %xmm12, %xmm11
	movq	%rdi, 120(%rax)
	vpxor	%xmm10, %xmm12, %xmm10
	vpaddq	_ZL14preCompConstV2+32(%rip), %xmm9, %xmm9
	vpaddq	_ZL14preCompConstV2+48(%rip), %xmm13, %xmm13
	vmovdqu	%xmm1, 760(%rsp)
	vpaddq	_ZL14preCompConstV2(%rip), %xmm11, %xmm11
	vpaddq	%xmm11, %xmm13, %xmm7
	movq	768(%rsp), %rdi
	vpaddq	_ZL14preCompConstV2+16(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm14
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm13, %xmm14, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm14
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm14, %xmm13, %xmm13
	movq	%rdi, 184(%rax)
	vpor	%xmm12, %xmm11, %xmm14
	vpaddq	%xmm7, %xmm10, %xmm11
	vpaddq	%xmm7, %xmm9, %xmm7
	vpsrlq	$33, %xmm11, %xmm10
	vpsrlq	$11, %xmm7, %xmm9
	vpsllq	$31, %xmm11, %xmm11
	vpsllq	$53, %xmm7, %xmm7
	vpor	%xmm10, %xmm11, %xmm10
	subq	$-128, %rax
	vpor	%xmm9, %xmm7, %xmm9
	cmpq	%rcx, %rsi
	vpxor	%xmm14, %xmm13, %xmm11
	vpxor	%xmm9, %xmm10, %xmm7
	vpxor	%xmm9, %xmm11, %xmm9
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm7, %xmm14, %xmm14
	vpxor	%xmm7, %xmm13, %xmm7
	vpaddq	%xmm9, %xmm0, %xmm0
	vpaddq	%xmm6, %xmm11, %xmm6
	vmovdqa	%xmm9, 744(%rsp)
	vpaddq	%xmm14, %xmm5, %xmm5
	vpaddq	%xmm7, %xmm4, %xmm4
	vmovdqa	%xmm7, 584(%rsp)
	vpaddq	%xmm0, %xmm4, %xmm9
	vpaddq	%xmm5, %xmm6, %xmm7
	vpaddq	.LC7(%rip), %xmm6, %xmm6
	vpaddq	.LC5(%rip), %xmm7, %xmm10
	vpaddq	.LC8(%rip), %xmm5, %xmm5
	vpaddq	.LC6(%rip), %xmm7, %xmm7
	vpaddq	%xmm4, %xmm10, %xmm10
	vpaddq	%xmm0, %xmm7, %xmm0
	vpsrlq	$57, %xmm10, %xmm4
	vpsrlq	$45, %xmm0, %xmm7
	vpsllq	$7, %xmm10, %xmm10
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm4, %xmm10, %xmm4
	vpor	%xmm7, %xmm0, %xmm7
	vpaddq	%xmm9, %xmm6, %xmm0
	vpaddq	%xmm9, %xmm5, %xmm9
	vpsrlq	$33, %xmm0, %xmm6
	vpsllq	$53, %xmm9, %xmm5
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm6, %xmm0, %xmm6
	vpsrlq	$11, %xmm9, %xmm0
	vpaddq	%xmm1, %xmm2, %xmm9
	vpor	%xmm0, %xmm5, %xmm5
	vpxor	%xmm7, %xmm4, %xmm10
	vmovdqa	%xmm14, 664(%rsp)
	vpxor	%xmm5, %xmm6, %xmm0
	vpxor	%xmm5, %xmm10, %xmm5
	vpxor	%xmm6, %xmm10, %xmm10
	vpxor	%xmm0, %xmm7, %xmm7
	vpxor	%xmm0, %xmm4, %xmm6
	vpaddq	%xmm3, %xmm8, %xmm0
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm8, %xmm8
	vpaddq	%xmm9, %xmm3, %xmm9
	vpsrlq	$53, %xmm8, %xmm4
	vpsrlq	$41, %xmm9, %xmm3
	vpsllq	$11, %xmm8, %xmm8
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm4, %xmm8, %xmm4
	vpaddq	.LC3(%rip), %xmm0, %xmm8
	vpor	%xmm3, %xmm9, %xmm3
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm2, %xmm8, %xmm2
	vpaddq	%xmm1, %xmm0, %xmm1
	vpsrlq	$27, %xmm2, %xmm8
	vpsrlq	$5, %xmm1, %xmm0
	vpsllq	$37, %xmm2, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm8, %xmm2, %xmm2
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm3, %xmm4, %xmm0
	vpxor	%xmm1, %xmm2, %xmm8
	vpxor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm0, %xmm2, %xmm2
	vpxor	%xmm3, %xmm8, %xmm3
	vpxor	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm1, %xmm7, %xmm1
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm3, %xmm5, %xmm3
	vpaddq	%xmm3, %xmm2, %xmm0
	vpaddq	%xmm4, %xmm10, %xmm4
	vpaddq	%xmm1, %xmm4, %xmm8
	vpaddq	.LC7(%rip), %xmm4, %xmm4
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	.LC8(%rip), %xmm1, %xmm1
	vpaddq	%xmm2, %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpsrlq	$57, %xmm9, %xmm2
	vpaddq	%xmm3, %xmm8, %xmm8
	vpsllq	$7, %xmm9, %xmm9
	vpsllq	$19, %xmm8, %xmm3
	vpor	%xmm2, %xmm9, %xmm2
	vpsrlq	$45, %xmm8, %xmm9
	vpaddq	%xmm0, %xmm4, %xmm8
	vpor	%xmm9, %xmm3, %xmm3
	vpsrlq	$33, %xmm8, %xmm4
	vpaddq	%xmm0, %xmm1, %xmm0
	vpsllq	$31, %xmm8, %xmm8
	vpsrlq	$11, %xmm0, %xmm1
	vpor	%xmm4, %xmm8, %xmm4
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm3, %xmm2, %xmm8
	vpxor	%xmm1, %xmm4, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm4, %xmm8, %xmm4
	vpxor	%xmm0, %xmm3, %xmm3
	vpxor	%xmm0, %xmm2, %xmm2
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm15, %xmm4, %xmm15
	vpaddq	552(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm15, %xmm13
	vpaddq	.LC7(%rip), %xmm15, %xmm15
	vpaddq	536(%rsp), %xmm2, %xmm0
	vpaddq	.LC5(%rip), %xmm13, %xmm14
	vpaddq	%xmm12, %xmm0, %xmm8
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm8, %xmm15, %xmm15
	vpaddq	%xmm0, %xmm14, %xmm0
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm0, %xmm14
	vpsrlq	$45, %xmm12, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpsllq	$19, %xmm12, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm9
	vpsllq	$7, %xmm0, %xmm0
	vpsllq	$53, %xmm9, %xmm8
	vpor	%xmm14, %xmm0, %xmm0
	vpor	%xmm13, %xmm12, %xmm14
	vpsrlq	$11, %xmm9, %xmm13
	vpsrlq	$33, %xmm15, %xmm12
	vpor	%xmm13, %xmm8, %xmm8
	vpsllq	$31, %xmm15, %xmm15
	vpor	%xmm12, %xmm15, %xmm12
	vpxor	%xmm14, %xmm0, %xmm15
	vpxor	%xmm8, %xmm12, %xmm9
	vpxor	%xmm8, %xmm15, %xmm8
	vpxor	%xmm12, %xmm15, %xmm15
	vpxor	%xmm9, %xmm14, %xmm14
	vpxor	%xmm9, %xmm0, %xmm9
	vpaddq	_ZL14preCompConstV2+64(%rip), %xmm8, %xmm8
	vpaddq	_ZL14preCompConstV2+80(%rip), %xmm15, %xmm15
	vpaddq	_ZL14preCompConstV2+96(%rip), %xmm14, %xmm14
	vpaddq	%xmm14, %xmm15, %xmm12
	vpaddq	.LC2(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+112(%rip), %xmm9, %xmm9
	vpaddq	.LC1(%rip), %xmm15, %xmm15
	vpaddq	%xmm8, %xmm9, %xmm13
	vpaddq	%xmm13, %xmm15, %xmm15
	vpaddq	%xmm13, %xmm14, %xmm13
	vpsrlq	$53, %xmm15, %xmm0
	vpsrlq	$41, %xmm13, %xmm14
	vpsllq	$11, %xmm15, %xmm15
	vpsllq	$23, %xmm13, %xmm13
	vpor	%xmm0, %xmm15, %xmm0
	vpor	%xmm14, %xmm13, %xmm14
	vpaddq	.LC3(%rip), %xmm12, %xmm13
	vpaddq	.LC4(%rip), %xmm12, %xmm12
	vpaddq	%xmm9, %xmm13, %xmm9
	vpaddq	%xmm8, %xmm12, %xmm8
	vpsrlq	$27, %xmm9, %xmm13
	vpsrlq	$5, %xmm8, %xmm12
	vpsllq	$37, %xmm9, %xmm9
	vpsllq	$59, %xmm8, %xmm8
	vpor	%xmm13, %xmm9, %xmm9
	vpor	%xmm12, %xmm8, %xmm12
	vpxor	%xmm14, %xmm0, %xmm8
	vpxor	%xmm12, %xmm9, %xmm13
	vpxor	%xmm8, %xmm12, %xmm12
	vpxor	%xmm8, %xmm9, %xmm8
	vpxor	%xmm14, %xmm13, %xmm14
	vpxor	%xmm0, %xmm13, %xmm0
	vpaddq	%xmm12, %xmm3, %xmm3
	vpaddq	%xmm8, %xmm2, %xmm2
	vmovdqa	%xmm14, 568(%rsp)
	vpaddq	%xmm14, %xmm1, %xmm9
	vpaddq	%xmm9, %xmm2, %xmm1
	vpaddq	%xmm0, %xmm4, %xmm4
	vmovdqa	%xmm12, 552(%rsp)
	vpaddq	%xmm3, %xmm4, %xmm12
	vpaddq	.LC1(%rip), %xmm4, %xmm4
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vpaddq	%xmm1, %xmm3, %xmm3
	vmovdqa	%xmm8, 536(%rsp)
	vpaddq	%xmm1, %xmm4, %xmm8
	vpsllq	$23, %xmm3, %xmm1
	vpsrlq	$53, %xmm8, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm4, %xmm8, %xmm4
	vpsrlq	$41, %xmm3, %xmm8
	vpaddq	.LC3(%rip), %xmm12, %xmm3
	vpor	%xmm8, %xmm1, %xmm1
	vpaddq	.LC4(%rip), %xmm12, %xmm12
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm9, %xmm12, %xmm9
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm8
	vpsrlq	$5, %xmm9, %xmm2
	vpsllq	$59, %xmm9, %xmm3
	vpor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm3, %xmm8, %xmm9
	vpxor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm2, %xmm8, %xmm2
	vpxor	%xmm1, %xmm9, %xmm1
	vpxor	%xmm4, %xmm9, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm7
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm12
	vpaddq	%xmm12, %xmm6, %xmm5
	vpaddq	%xmm4, %xmm10, %xmm10
	vpaddq	%xmm7, %xmm10, %xmm13
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm7, %xmm7
	vpaddq	%xmm5, %xmm10, %xmm10
	vpaddq	%xmm5, %xmm7, %xmm7
	vpsrlq	$53, %xmm10, %xmm8
	vpsrlq	$41, %xmm7, %xmm9
	vpsllq	$11, %xmm10, %xmm10
	vpsllq	$23, %xmm7, %xmm5
	vpor	%xmm8, %xmm10, %xmm8
	vpaddq	.LC3(%rip), %xmm13, %xmm7
	vpor	%xmm9, %xmm5, %xmm5
	vpaddq	.LC4(%rip), %xmm13, %xmm13
	vpaddq	%xmm6, %xmm7, %xmm6
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$27, %xmm6, %xmm7
	vpsllq	$37, %xmm6, %xmm6
	vpor	%xmm7, %xmm6, %xmm9
	vpsrlq	$5, %xmm12, %xmm6
	vpsllq	$59, %xmm12, %xmm7
	vpor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm7, %xmm9, %xmm10
	vpxor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpxor	%xmm5, %xmm10, %xmm5
	vpxor	%xmm8, %xmm10, %xmm8
	vpaddq	664(%rsp), %xmm7, %xmm14
	vpaddq	584(%rsp), %xmm6, %xmm13
	vpaddq	744(%rsp), %xmm5, %xmm9
	vpaddq	%xmm9, %xmm13, %xmm12
	vpaddq	%xmm8, %xmm11, %xmm15
	vpaddq	%xmm14, %xmm15, %xmm10
	vpaddq	.LC1(%rip), %xmm15, %xmm15
	vpaddq	.LC2(%rip), %xmm14, %xmm14
	vpaddq	%xmm12, %xmm15, %xmm15
	vpaddq	%xmm12, %xmm14, %xmm14
	vpsrlq	$53, %xmm15, %xmm11
	vpsllq	$23, %xmm14, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpor	%xmm11, %xmm15, %xmm11
	vpsrlq	$41, %xmm14, %xmm15
	vpaddq	.LC3(%rip), %xmm10, %xmm14
	vpor	%xmm15, %xmm12, %xmm12
	vpaddq	.LC4(%rip), %xmm10, %xmm10
	vpaddq	%xmm13, %xmm14, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$27, %xmm13, %xmm14
	vpsrlq	$5, %xmm9, %xmm10
	vpsllq	$37, %xmm13, %xmm13
	vpsllq	$59, %xmm9, %xmm9
	vpor	%xmm14, %xmm13, %xmm14
	vpor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm12, %xmm11, %xmm9
	vpxor	%xmm10, %xmm14, %xmm13
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm9, %xmm14, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm11, %xmm13, %xmm11
	vpaddq	_ZL14preCompConstV2+160(%rip), %xmm10, %xmm10
	vpaddq	_ZL14preCompConstV2+176(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+128(%rip), %xmm12, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm9
	vpaddq	_ZL14preCompConstV2+144(%rip), %xmm11, %xmm11
	vpaddq	%xmm10, %xmm11, %xmm13
	vpaddq	.LC7(%rip), %xmm11, %xmm11
	vpaddq	.LC5(%rip), %xmm13, %xmm15
	vpaddq	.LC8(%rip), %xmm10, %xmm10
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm14, %xmm15, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm14, %xmm15
	vpsrlq	$45, %xmm12, %xmm13
	vpsllq	$7, %xmm14, %xmm14
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	%xmm9, %xmm11, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$33, %xmm13, %xmm11
	vpsrlq	$11, %xmm9, %xmm10
	vpsllq	$31, %xmm13, %xmm13
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm11, %xmm13, %xmm11
	vpor	%xmm10, %xmm9, %xmm13
	vpxor	%xmm12, %xmm14, %xmm10
	vpxor	%xmm13, %xmm11, %xmm9
	vpxor	%xmm13, %xmm10, %xmm13
	vpxor	%xmm11, %xmm10, %xmm10
	vpxor	%xmm9, %xmm12, %xmm12
	vpxor	%xmm9, %xmm14, %xmm9
	vpaddq	%xmm13, %xmm5, %xmm5
	vpaddq	%xmm8, %xmm10, %xmm8
	vmovdqa	%xmm13, 744(%rsp)
	vpaddq	%xmm12, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm6, %xmm6
	vpaddq	.LC8(%rip), %xmm7, %xmm7
	vmovdqa	%xmm12, 664(%rsp)
	vpaddq	%xmm5, %xmm6, %xmm12
	vmovdqa	%xmm9, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$57, %xmm6, %xmm9
	vpsllq	$7, %xmm6, %xmm6
	vpor	%xmm9, %xmm6, %xmm9
	vpsrlq	$45, %xmm5, %xmm6
	vpsllq	$19, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm11
	vpaddq	%xmm12, %xmm8, %xmm5
	vpaddq	%xmm12, %xmm7, %xmm12
	vpsrlq	$33, %xmm5, %xmm6
	vpsllq	$31, %xmm5, %xmm8
	vpsrlq	$11, %xmm12, %xmm5
	vpor	%xmm6, %xmm8, %xmm8
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm5, %xmm12, %xmm5
	vpxor	%xmm11, %xmm9, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm5, %xmm7, %xmm5
	vpxor	%xmm8, %xmm7, %xmm8
	vpxor	%xmm6, %xmm11, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC7(%rip), %xmm4, %xmm4
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm1, %xmm2, %xmm12
	vpaddq	.LC8(%rip), %xmm3, %xmm3
	vpaddq	%xmm1, %xmm11, %xmm1
	vpaddq	%xmm2, %xmm9, %xmm2
	vpsrlq	$57, %xmm2, %xmm9
	vpsllq	$7, %xmm2, %xmm2
	vpor	%xmm9, %xmm2, %xmm9
	vpsrlq	$45, %xmm1, %xmm2
	vpsllq	$19, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm11
	vpaddq	%xmm12, %xmm4, %xmm1
	vpaddq	%xmm12, %xmm3, %xmm12
	vpsrlq	$33, %xmm1, %xmm2
	vpsllq	$31, %xmm1, %xmm4
	vpsrlq	$11, %xmm12, %xmm1
	vpor	%xmm2, %xmm4, %xmm4
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm1, %xmm12, %xmm1
	vpxor	%xmm11, %xmm9, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm1, %xmm3, %xmm1
	vpxor	%xmm4, %xmm3, %xmm4
	vpxor	%xmm2, %xmm11, %xmm3
	vpxor	%xmm2, %xmm9, %xmm2
	vpaddq	568(%rsp), %xmm1, %xmm13
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	552(%rsp), %xmm3, %xmm12
	vpaddq	%xmm12, %xmm0, %xmm14
	vpaddq	.LC8(%rip), %xmm12, %xmm12
	vpaddq	536(%rsp), %xmm2, %xmm11
	vpaddq	.LC5(%rip), %xmm14, %xmm15
	vpaddq	%xmm13, %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm14, %xmm14
	vpaddq	%xmm11, %xmm15, %xmm11
	vpaddq	%xmm13, %xmm14, %xmm13
	vpsrlq	$57, %xmm11, %xmm15
	vpsrlq	$45, %xmm13, %xmm14
	vpaddq	.LC7(%rip), %xmm0, %xmm0
	vpsllq	$7, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm0, %xmm0
	vpor	%xmm15, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm12, %xmm9
	vpsllq	$19, %xmm13, %xmm13
	vpor	%xmm14, %xmm13, %xmm13
	vpsrlq	$33, %xmm0, %xmm14
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm14, %xmm0, %xmm14
	vpsrlq	$11, %xmm9, %xmm0
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm13, %xmm11, %xmm12
	vpxor	%xmm0, %xmm14, %xmm9
	vpxor	%xmm0, %xmm12, %xmm0
	vpxor	%xmm14, %xmm12, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+192(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+208(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+224(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+240(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm4, %xmm4
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC1(%rip), %xmm4, %xmm4
	vmovdqa	%xmm9, 552(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 536(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm4, %xmm4
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm4, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm4, %xmm4
	vpor	%xmm9, %xmm4, %xmm9
	vpsrlq	$41, %xmm3, %xmm4
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm4, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm4
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm4, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm7, %xmm7
	vpaddq	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm0, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm6, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm8
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vpaddq	.LC2(%rip), %xmm7, %xmm7
	vpaddq	%xmm4, %xmm8, %xmm8
	vpaddq	%xmm4, %xmm7, %xmm7
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm7, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm7, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm7
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm7, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$27, %xmm6, %xmm7
	vpsllq	$37, %xmm6, %xmm6
	vpor	%xmm7, %xmm6, %xmm8
	vpsrlq	$5, %xmm5, %xmm6
	vpsllq	$59, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpxor	%xmm4, %xmm9, %xmm5
	vpxor	%xmm6, %xmm8, %xmm7
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm7, %xmm4
	vpxor	%xmm9, %xmm7, %xmm7
	vpaddq	664(%rsp), %xmm6, %xmm12
	vpaddq	584(%rsp), %xmm5, %xmm9
	vpaddq	744(%rsp), %xmm4, %xmm13
	vpaddq	%xmm13, %xmm9, %xmm11
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm12, %xmm10, %xmm8
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$53, %xmm15, %xmm10
	vpsrlq	$41, %xmm11, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpsllq	$23, %xmm11, %xmm11
	vpor	%xmm10, %xmm15, %xmm10
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	.LC3(%rip), %xmm8, %xmm12
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm12, %xmm9
	vpaddq	%xmm13, %xmm8, %xmm13
	vpsrlq	$27, %xmm9, %xmm12
	vpsrlq	$5, %xmm13, %xmm8
	vpsllq	$37, %xmm9, %xmm9
	vpsllq	$59, %xmm13, %xmm13
	vpor	%xmm12, %xmm9, %xmm12
	vpor	%xmm8, %xmm13, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm12, %xmm13
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm11, %xmm13, %xmm11
	vpxor	%xmm10, %xmm13, %xmm10
	vpaddq	_ZL14preCompConstV2+288(%rip), %xmm9, %xmm9
	vpxor	%xmm8, %xmm12, %xmm13
	vpaddq	_ZL14preCompConstV2+256(%rip), %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+272(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	_ZL14preCompConstV2+304(%rip), %xmm13, %xmm13
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vmovdqa	%xmm11, 664(%rsp)
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	536(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	552(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+320(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+336(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+352(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+368(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm8, %xmm8
	vpaddq	%xmm3, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vmovdqa	%xmm9, 552(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 536(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm8, %xmm8
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm3, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm8, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm8
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm8, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm9
	vpaddq	%xmm9, %xmm5, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm7
	vpaddq	%xmm6, %xmm7, %xmm11
	vpaddq	.LC1(%rip), %xmm7, %xmm7
	vpaddq	.LC2(%rip), %xmm6, %xmm6
	vpaddq	%xmm4, %xmm7, %xmm8
	vpaddq	%xmm4, %xmm6, %xmm6
	vpsrlq	$53, %xmm8, %xmm7
	vpsllq	$23, %xmm6, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm7, %xmm8, %xmm7
	vpsrlq	$41, %xmm6, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm6
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$27, %xmm5, %xmm6
	vpsllq	$37, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm8
	vpsrlq	$5, %xmm9, %xmm5
	vpsllq	$59, %xmm9, %xmm6
	vpor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm6, %xmm8, %xmm9
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm9, %xmm4
	vpxor	%xmm7, %xmm9, %xmm7
	vpaddq	664(%rsp), %xmm6, %xmm11
	vpaddq	584(%rsp), %xmm5, %xmm8
	vpaddq	744(%rsp), %xmm4, %xmm12
	vpaddq	%xmm12, %xmm8, %xmm9
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm9, %xmm10, %xmm13
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$53, %xmm13, %xmm10
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$11, %xmm13, %xmm13
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm10, %xmm13, %xmm10
	vpor	%xmm11, %xmm9, %xmm11
	vpaddq	.LC3(%rip), %xmm15, %xmm9
	vpaddq	.LC4(%rip), %xmm15, %xmm15
	vpaddq	%xmm8, %xmm9, %xmm8
	vpaddq	%xmm12, %xmm15, %xmm12
	vpsrlq	$27, %xmm8, %xmm9
	vpsllq	$37, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm13
	vpsrlq	$5, %xmm12, %xmm8
	vpsllq	$59, %xmm12, %xmm12
	vpor	%xmm8, %xmm12, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm13, %xmm12
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm8, %xmm13, %xmm13
	vpxor	%xmm11, %xmm12, %xmm11
	vpxor	%xmm10, %xmm12, %xmm10
	vpaddq	_ZL14preCompConstV2+416(%rip), %xmm9, %xmm9
	vpaddq	_ZL14preCompConstV2+432(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+384(%rip), %xmm11, %xmm11
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	_ZL14preCompConstV2+400(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vmovdqa	%xmm11, 664(%rsp)
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	536(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	552(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+448(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+464(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+480(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+496(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm2, %xmm9
	vpaddq	%xmm14, %xmm8, %xmm8
	vpaddq	%xmm3, %xmm8, %xmm0
	vpaddq	.LC1(%rip), %xmm8, %xmm11
	vpaddq	%xmm9, %xmm11, %xmm11
	vpsrlq	$53, %xmm11, %xmm12
	vpsllq	$11, %xmm11, %xmm11
	vpor	%xmm12, %xmm11, %xmm12
	vpaddq	.LC2(%rip), %xmm3, %xmm11
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm11, %xmm9, %xmm14
	vpaddq	.LC3(%rip), %xmm0, %xmm11
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm2, %xmm11, %xmm11
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$27, %xmm11, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpor	%xmm9, %xmm11, %xmm9
	vpsrlq	$5, %xmm0, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpxor	%xmm14, %xmm12, %xmm0
	vpxor	%xmm11, %xmm9, %xmm13
	vpxor	%xmm0, %xmm11, %xmm11
	vpxor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm14, %xmm13, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm11, %xmm6, %xmm11
	vpaddq	%xmm0, %xmm5, %xmm0
	vpaddq	%xmm14, %xmm4, %xmm14
	vpaddq	%xmm14, %xmm0, %xmm5
	vpaddq	%xmm12, %xmm7, %xmm12
	vpaddq	%xmm11, %xmm12, %xmm4
	vpaddq	.LC1(%rip), %xmm12, %xmm12
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm5, %xmm12, %xmm12
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$53, %xmm12, %xmm6
	vpsllq	$11, %xmm12, %xmm12
	vpor	%xmm6, %xmm12, %xmm12
	vpsrlq	$41, %xmm5, %xmm6
	vpsllq	$23, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpaddq	.LC3(%rip), %xmm4, %xmm5
	vpaddq	.LC4(%rip), %xmm4, %xmm4
	vpaddq	%xmm0, %xmm5, %xmm0
	vpaddq	%xmm14, %xmm4, %xmm14
	vpsrlq	$27, %xmm0, %xmm5
	vpsllq	$37, %xmm0, %xmm0
	vpor	%xmm5, %xmm0, %xmm5
	vpsrlq	$5, %xmm14, %xmm0
	vpsllq	$59, %xmm14, %xmm14
	vpor	%xmm0, %xmm14, %xmm4
	vpxor	%xmm6, %xmm12, %xmm0
	vpxor	%xmm4, %xmm5, %xmm7
	vpxor	%xmm0, %xmm4, %xmm4
	vpxor	%xmm0, %xmm5, %xmm0
	vpxor	%xmm6, %xmm7, %xmm6
	vpxor	%xmm12, %xmm7, %xmm12
	vpaddq	664(%rsp), %xmm4, %xmm4
	vpaddq	584(%rsp), %xmm0, %xmm0
	vpaddq	744(%rsp), %xmm6, %xmm6
	vpaddq	%xmm12, %xmm10, %xmm10
	vpaddq	696(%rsp), %xmm10, %xmm10
	vmovdqa	%xmm10, 696(%rsp)
	vpaddq	680(%rsp), %xmm4, %xmm4
	vpaddq	648(%rsp), %xmm0, %xmm0
	vpaddq	520(%rsp), %xmm6, %xmm6
	vpaddq	632(%rsp), %xmm8, %xmm8
	vpaddq	616(%rsp), %xmm3, %xmm3
	vpaddq	728(%rsp), %xmm2, %xmm2
	vpaddq	712(%rsp), %xmm1, %xmm1
	vmovdqa	%xmm10, 1032(%rsp)
	vmovdqa	%xmm4, 680(%rsp)
	vmovdqa	%xmm4, 1048(%rsp)
	vmovdqa	%xmm0, 648(%rsp)
	vmovdqa	%xmm0, 1064(%rsp)
	vmovdqa	%xmm6, 520(%rsp)
	vmovdqa	%xmm6, 1080(%rsp)
	vmovdqa	%xmm8, 632(%rsp)
	vmovdqa	%xmm8, 1096(%rsp)
	vmovdqa	%xmm3, 616(%rsp)
	vmovdqa	%xmm3, 1112(%rsp)
	vmovdqa	%xmm2, 728(%rsp)
	vmovdqa	%xmm2, 1128(%rsp)
	vmovdqa	%xmm1, 712(%rsp)
	vmovdqa	%xmm1, 1144(%rsp)
	jne	.L20
	movq	112(%rsp), %rdx
	movq	%rcx, %rax
	salq	$4, %rax
	movq	%rax, 104(%rsp)
	leaq	(%rdx,%rcx,2), %rdx
	movq	%rdx, 112(%rsp)
.L21:
	vpshufd	$14, 1032(%rsp), %xmm0
	addq	%rcx, %rcx
	movq	%rcx, 88(%rsp)
	movq	(%rsp), %rcx
	vpaddq	1032(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rbx
	vpshufd	$14, 1048(%rsp), %xmm0
	shrq	$6, %rcx
	movq	%rcx, 136(%rsp)
	movq	%rbx, 776(%rsp)
	vpaddq	1048(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %r8
	vpshufd	$14, 1064(%rsp), %xmm0
	movq	%r8, 784(%rsp)
	vpaddq	1064(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rdi
	vpshufd	$14, 1080(%rsp), %xmm0
	movq	%rdi, 792(%rsp)
	vpaddq	1080(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rsi
	vpshufd	$14, 1096(%rsp), %xmm0
	movq	%rsi, 800(%rsp)
	vpaddq	1096(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %r12
	vpshufd	$14, 1112(%rsp), %xmm0
	movq	%r12, 808(%rsp)
	vpaddq	1112(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	vpshufd	$14, 1128(%rsp), %xmm0
	movq	%rax, 816(%rsp)
	vpaddq	1128(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rdx
	vpshufd	$14, 1144(%rsp), %xmm0
	movq	%rdx, 824(%rsp)
	vpaddq	1144(%rsp), %xmm0, %xmm0
	vmovq	%xmm0, 552(%rsp)
	movq	552(%rsp), %r9
	movq	%r9, 832(%rsp)
	movq	88(%rsp), %r9
	cmpq	%r9, %rcx
	jbe	.L19
	leaq	0(%r13,%r11), %rcx
	movabsq	$7667772426219706969, %r9
	movq	%rax, 488(%rsp)
	movq	80(%rsp), %rax
	addq	72(%rsp), %rax
	movabsq	$6220970056051541820, %r10
	movq	%rcx, 392(%rsp)
	movq	128(%rsp), %rcx
	addq	%r10, %r11
	movq	%rbx, 408(%rsp)
	movabsq	$-8247349341179448980, %rbx
	movq	%rsi, 472(%rsp)
	leaq	(%r15,%r9), %rsi
	movq	%rdi, 456(%rsp)
	movq	72(%rsp), %rdi
	addq	%r9, %rcx
	addq	392(%rsp), %rcx
	movq	%r11, 264(%rsp)
	addq	%rax, %rsi
	movabsq	$4195444129992158507, %r11
	movq	%rdx, 504(%rsp)
	leaq	(%r14,%r15), %rdx
	addq	%r11, %rdi
	movq	%r8, 440(%rsp)
	rorq	$41, %rsi
	addq	%r11, %r13
	rorq	$41, %rcx
	movq	%r13, 248(%rsp)
	movq	%rcx, 536(%rsp)
	leaq	(%r14,%rbx), %rcx
	addq	%rax, %rcx
	movq	80(%rsp), %rax
	rorq	$53, %rcx
	addq	%r10, %rax
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rcx, %rdi
	rorq	$5, %rdx
	rorq	$27, %rax
	xorq	%rsi, %rdi
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	40(%rsp), %rax
	addq	48(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	64(%rsp), %rcx
	movq	%rsi, 184(%rsp)
	movq	56(%rsp), %rsi
	movq	%rdx, 216(%rsp)
	movq	56(%rsp), %rdx
	addq	%rbx, %rcx
	addq	64(%rsp), %rdx
	movq	%rdi, 360(%rsp)
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	40(%rsp), %rdi
	addq	%rax, %rsi
	movq	48(%rsp), %rax
	rorq	$53, %rcx
	rorq	$41, %rsi
	movq	%r8, 200(%rsp)
	addq	%r10, %rax
	addq	%rdx, %rax
	rorq	$27, %rax
	addq	%r11, %rdi
	addq	%rdi, %rdx
	movq	%rcx, %rdi
	rorq	$5, %rdx
	xorq	%rsi, %rdi
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	8(%rsp), %rax
	addq	16(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	32(%rsp), %rcx
	movq	%rsi, 232(%rsp)
	movq	24(%rsp), %rsi
	movq	%rdx, 376(%rsp)
	movq	24(%rsp), %rdx
	addq	%rbx, %rcx
	addq	32(%rsp), %rdx
	movq	%rdi, 168(%rsp)
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	8(%rsp), %rdi
	addq	%rax, %rsi
	movq	16(%rsp), %rax
	movq	%r8, 344(%rsp)
	rorq	$41, %rsi
	rorq	$53, %rcx
	addq	%r11, %rdi
	addq	%r10, %rax
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rsi, %rdi
	rorq	$27, %rax
	rorq	$5, %rdx
	xorq	%rcx, %rdi
	movq	%rax, %r8
	xorq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	%rsi, 280(%rsp)
	movq	104(%rsp), %rax
	movq	%rdx, 312(%rsp)
	movq	-80(%rsp), %rdx
	movq	112(%rsp), %rcx
	movq	%r8, 296(%rsp)
	salq	$3, %rax
	movq	%rdi, 328(%rsp)
	movq	%r12, 424(%rsp)
	addq	%rax, %rdx
	addq	96(%rsp), %rax
	movq	%rdx, 600(%rsp)
	movq	%rcx, 632(%rsp)
	movq	%rax, 520(%rsp)
	movq	136(%rsp), %rax
	subq	88(%rsp), %rax
	addq	112(%rsp), %rax
	movq	%rax, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	addq	$1, 632(%rsp)
	movq	120(%rsp), %rcx
	movabsq	$-8247349341179448980, %rbx
	xorq	632(%rsp), %rcx
	movq	128(%rsp), %rsi
	movabsq	$7860495443403156170, %r9
	movq	264(%rsp), %rax
	movq	536(%rsp), %rdx
	movabsq	$-6792583489299504353, %r12
	movq	536(%rsp), %rdi
	movabsq	$-3833335565246798826, %r10
	movabsq	$2580067509209331373, %r14
	movabsq	$-1457182779415996031, %r11
	movabsq	$-6802927476391842224, %r13
	addq	%rcx, %rsi
	addq	392(%rsp), %rcx
	addq	%rsi, %rax
	addq	248(%rsp), %rsi
	rolq	$37, %rax
	addq	%rbx, %rcx
	rolq	$59, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r8
	xorq	%rcx, %rdx
	xorq	%rax, %r8
	xorq	%rdx, %rsi
	xorq	%rdx, %rax
	xorq	%r8, %rcx
	xorq	%r8, %rdi
	leaq	(%rcx,%rsi), %r8
	leaq	(%rdi,%rax), %rdx
	addq	%r12, %rdi
	addq	%r14, %rsi
	addq	%r11, %rax
	addq	%r13, %rcx
	addq	%r9, %r8
	addq	%r10, %rdx
	movabsq	$-6657276164713376882, %r9
	leaq	(%rdi,%r8), %r15
	addq	%rdx, %rsi
	addq	%r8, %rax
	addq	%rdx, %rcx
	rolq	$53, %rsi
	rolq	$7, %rax
	rolq	$19, %r15
	rolq	$31, %rcx
	movq	%rsi, %rdx
	movq	%r15, %rdi
	xorq	%rcx, %rdx
	movabsq	$-5426079245872290139, %r8
	xorq	%rax, %rdi
	movq	232(%rsp), %r10
	movabsq	$-3329063056561552456, %r11
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	%r15, %r12
	addq	216(%rsp), %r12
	movq	%rdx, 680(%rsp)
	movq	%rdi, %rdx
	addq	200(%rsp), %rdx
	movq	680(%rsp), %rax
	movq	%rsi, %rbx
	addq	360(%rsp), %rax
	addq	184(%rsp), %rbx
	movq	%rsi, 728(%rsp)
	movabsq	$-5426079245872290139, %r14
	movq	%rdi, 712(%rsp)
	movabsq	$-3329063056561552456, %rdi
	movq	%r15, 696(%rsp)
	leaq	(%r12,%rdx), %rsi
	movabsq	$-1087367646907149102, %r15
	addq	%r9, %r12
	addq	%r8, %rdx
	movq	376(%rsp), %r8
	leaq	(%rbx,%rax), %rcx
	addq	%rdi, %rbx
	addq	%r15, %rax
	addq	%rsi, %rbx
	addq	%rsi, %rax
	rolq	$19, %rbx
	addq	%rcx, %r12
	rolq	$7, %rax
	addq	%rcx, %rdx
	rolq	$53, %r12
	movq	%rbx, %r13
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r12, %rdi
	xorq	%rdx, %rdi
	xorq	%r13, %r12
	xorq	%rdx, %r13
	movq	344(%rsp), %rdx
	xorq	%rdi, %rbx
	xorq	%rax, %rdi
	movq	168(%rsp), %rax
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r13, %rdx
	leaq	(%r8,%rdx), %rsi
	addq	%rdi, %rax
	leaq	(%r10,%rax), %rcx
	addq	%r15, %rax
	addq	%r11, %r10
	addq	%rsi, %rax
	addq	%rsi, %r10
	movq	280(%rsp), %r15
	rolq	$7, %rax
	rolq	$19, %r10
	addq	%r9, %r8
	addq	%r14, %rdx
	addq	%rcx, %r8
	movq	%r10, %r11
	addq	%rcx, %rdx
	rolq	$53, %r8
	xorq	%rax, %r11
	rolq	$31, %rdx
	movq	%r8, %r9
	movq	296(%rsp), %rcx
	xorq	%r11, %r8
	xorq	%rdx, %r9
	xorq	%rdx, %r11
	movq	312(%rsp), %rdx
	addq	%r8, %r15
	movq	328(%rsp), %rsi
	movq	%r15, 744(%rsp)
	xorq	%r9, %r10
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	addq	%r9, %rsi
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rsi
	xorq	%r14, %rax
	movabsq	$-3210636887397455352, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 648(%rsp)
	addq	%r8, %rsi
	movq	%r15, 616(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 744(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 664(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	696(%rsp), %r14
	rolq	$37, %rax
	addq	%rsi, %r10
	xorq	%rdx, %r9
	addq	%rcx, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r9, %r10
	xorq	%rax, %r9
	xorq	%rax, %r11
	leaq	(%r9,%rdi), %rax
	leaq	(%r10,%rbx), %rsi
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movabsq	$7667772426219706969, %rbx
	leaq	(%r11,%r13), %rdx
	addq	%r8, %r12
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%rax), %rdi
	addq	%r13, %r12
	leaq	(%rsi,%rdx), %rcx
	addq	%rbx, %rsi
	addq	%r15, %rdx
	addq	%rdi, %rdx
	addq	%rsi, %rdi
	movabsq	$6220970056051541820, %rsi
	rolq	$23, %rdi
	addq	%rsi, %rax
	addq	%rcx, %r12
	rolq	$11, %rdx
	addq	%rcx, %rax
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	movq	%r12, %r13
	xorq	%rdx, %rbx
	movq	728(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	680(%rsp), %rax
	movq	712(%rsp), %r15
	addq	%r12, %r14
	xorq	%r13, %rdi
	movq	%r14, 712(%rsp)
	xorq	%rdx, %r13
	movq	712(%rsp), %rdx
	addq	%rbx, %rax
	addq	%rdi, %rsi
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r13, %r15
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rcx
	addq	%r14, %r15
	movabsq	$6220970056051541820, %r14
	addq	%r14, %rax
	movabsq	$4195444129992158507, %r14
	rolq	$23, %r15
	addq	%r14, %rsi
	addq	%rdx, %rax
	movq	%r15, %r14
	addq	%rdx, %rsi
	rolq	$37, %rax
	xorq	%rcx, %r14
	rolq	$59, %rsi
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	rolq	$31, %rcx
	xorq	%rcx, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	addq	%rsi, %rdi
	addq	%r12, %rcx
	movq	%r15, 712(%rsp)
	movq	%rdx, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 728(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 680(%rsp)
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	movabsq	$-5426079245872290139, %r14
	addq	%rbx, %rdi
	leaq	(%rdi,%rdx), %r12
	movabsq	$-5426079245872290139, %rdi
	rolq	$7, %rax
	addq	%rdi, %r13
	movabsq	$-6657276164713376882, %rdi
	addq	%rcx, %rdi
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %rdi
	movq	%r12, %r13
	rolq	$53, %rdi
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%rdi, %rbx
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r11
	addq	%rdi, %r8
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r10), %rcx
	addq	%rbx, %r9
	leaq	(%r8,%r9), %rsi
	addq	%r15, %r9
	movq	648(%rsp), %r15
	leaq	(%rcx,%r11), %rdx
	addq	%r14, %r11
	leaq	(%r9,%rdx), %rax
	movabsq	$-3329063056561552456, %r9
	addq	%r9, %r8
	leaq	(%r8,%rdx), %r10
	leaq	(%r11,%rsi), %rdx
	movabsq	$-6657276164713376882, %r8
	addq	%rcx, %r8
	rolq	$7, %rax
	movq	616(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	664(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	744(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 744(%rsp)
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	addq	%r9, %rsi
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 648(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 616(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 744(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r9
	addq	%rsi, %r10
	rolq	$23, %r8
	leaq	(%r9,%rcx), %rax
	addq	%rcx, %r10
	rolq	$11, %rdx
	rolq	$59, %r10
	movq	%r8, %r9
	movq	%r14, 664(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	696(%rsp), %r14
	xorq	%r11, %r8
	xorq	%rdx, %r11
	xorq	%r9, %r10
	leaq	(%r8,%rdi), %rsi
	xorq	%rax, %r9
	addq	%r10, %r12
	addq	%r11, %r13
	addq	%r9, %rbx
	movabsq	$7667772426219706969, %rdi
	leaq	(%rsi,%rbx), %rax
	leaq	(%r12,%r13), %rcx
	addq	%r12, %rdi
	movabsq	$6220970056051541820, %r12
	addq	%r15, %r13
	movq	712(%rsp), %r15
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %rdi
	addq	%rsi, %r12
	leaq	(%rbx,%rcx), %rax
	rolq	$23, %rdi
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	728(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	680(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 712(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	rolq	$23, %r15
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 712(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 680(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rsi, %r13
	addq	%rbx, %rdi
	addq	%rdx, %rdi
	leaq	0(%r13,%rcx), %rdx
	movabsq	$-6657276164713376882, %r13
	addq	%r13, %r12
	rolq	$19, %rdi
	rolq	$7, %rax
	addq	%r12, %rcx
	rolq	$31, %rdx
	movq	%rdi, %r12
	rolq	$53, %rcx
	xorq	%rax, %r12
	movq	%rcx, %rsi
	xorq	%r12, %rcx
	xorq	%rdx, %r12
	xorq	%rdx, %rsi
	addq	%r12, %r11
	addq	%rcx, %r8
	xorq	%rsi, %rdi
	xorq	%rax, %rsi
	addq	%rdi, %r10
	addq	%rsi, %r9
	leaq	(%r10,%r11), %rdx
	leaq	(%r8,%r9), %rbx
	addq	%r14, %r8
	addq	%r15, %r9
	movabsq	$-5426079245872290139, %r15
	leaq	(%r8,%rdx), %r14
	movq	%r13, %r8
	addq	%r15, %r11
	addq	%r10, %r8
	leaq	(%r9,%rdx), %rax
	leaq	(%r11,%rbx), %rdx
	addq	%rbx, %r8
	rolq	$19, %r14
	movq	744(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	664(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	648(%rsp), %rax
	movq	616(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 744(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	744(%rsp), %r11
	rolq	$7, %rax
	addq	%rbx, %r11
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r9
	addq	%r10, %rdx
	movq	%r11, %rbx
	addq	%r10, %r9
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%rbx, %r9
	xorq	%rdx, %r10
	xorq	%rbx, %rdx
	xorq	%r10, %rax
	xorq	%r10, %r11
	movabsq	$1649971794476935487, %r10
	leaq	(%r9,%rax), %rbx
	addq	%r10, %rbx
	leaq	(%rdx,%r11), %r10
	movq	%r10, 744(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	744(%rsp), %r10
	movq	%r10, 744(%rsp)
	movabsq	$9059564915322872455, %r10
	addq	%r10, %rdx
	movabsq	$-7724133909308953704, %r10
	addq	%rbx, %rdx
	addq	%r10, %r11
	movabsq	$3257124934342745045, %r10
	rolq	$11, %rdx
	addq	%rbx, %r11
	addq	%r10, %r9
	movabsq	$8809261046177890769, %rbx
	addq	744(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	744(%rsp), %rax
	movq	%r11, %r10
	xorq	%rdx, %r10
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%rax, %rbx
	xorq	%rax, %r10
	addq	%r9, %r14
	xorq	%rbx, %r11
	xorq	%rdx, %rbx
	addq	%r10, %r13
	addq	%rbx, %r15
	addq	%r11, %r8
	movq	%r11, 648(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 616(%rsp)
	movq	%r9, 744(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 664(%rsp)
	movabsq	$-8247349341179448980, %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$7667772426219706969, %r9
	addq	%rbx, %r13
	addq	%r10, %r8
	addq	%rdx, %r15
	addq	%r14, %r9
	leaq	(%r15,%rax), %rdx
	movabsq	$-8247349341179448980, %r14
	addq	%rax, %r9
	leaq	0(%r13,%r11), %rax
	addq	%r8, %r11
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$11, %rdx
	rolq	$37, %rax
	movq	%r11, %r8
	movq	%r9, %r10
	xorq	%rax, %r8
	xorq	%rdx, %r10
	movabsq	$7667772426219706969, %r15
	xorq	%r8, %r9
	xorq	%r10, %r11
	xorq	%rdx, %r8
	xorq	%rax, %r10
	addq	%r9, %rcx
	addq	%r8, %r12
	leaq	(%r10,%rsi), %rax
	addq	%r11, %rdi
	leaq	(%rdi,%r12), %r13
	addq	%r14, %r12
	addq	%r15, %rdi
	leaq	(%rcx,%rax), %rsi
	addq	%rbx, %rax
	movabsq	$4195444129992158507, %rbx
	addq	%rbx, %rcx
	addq	%r13, %rax
	movq	712(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	leaq	(%rcx,%r13), %r12
	rolq	$23, %rsi
	movq	696(%rsp), %r13
	rolq	$37, %rax
	rolq	$11, %rdx
	movq	%rsi, %rbx
	rolq	$59, %r12
	xorq	%rdx, %rbx
	movq	%r12, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rdi
	xorq	%rax, %rbx
	addq	%r12, %r13
	xorq	%rdi, %rsi
	xorq	%rdx, %rdi
	movq	%r13, 712(%rsp)
	movq	728(%rsp), %r14
	addq	%rdi, %r15
	movq	680(%rsp), %rax
	movabsq	$-8247349341179448980, %rdx
	addq	%r15, %r13
	addq	%rdx, %r15
	addq	%rsi, %r14
	addq	%rbx, %rax
	leaq	(%r14,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rdx
	addq	%rcx, %r15
	movabsq	$6220970056051541820, %rcx
	addq	%rcx, %rax
	rolq	$23, %r15
	leaq	(%rax,%r13), %rcx
	movabsq	$4195444129992158507, %rax
	addq	%rax, %r14
	rolq	$37, %rcx
	addq	%r13, %r14
	movq	%r15, %r13
	rolq	$59, %r14
	xorq	%rdx, %r13
	movq	%r14, %rax
	xorq	%r13, %r14
	xorq	%rcx, %rax
	xorq	%r13, %rcx
	movabsq	$-2922945419276229487, %r13
	xorq	%rax, %rdx
	xorq	%rax, %r15
	leaq	(%rdx,%r14), %rax
	addq	%r13, %rax
	leaq	(%r15,%rcx), %r13
	movq	%r13, 728(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	728(%rsp), %r13
	movq	%r13, 728(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r15
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r14
	addq	%r15, %rax
	addq	728(%rsp), %r14
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	728(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r14
	movq	%r14, %r13
	xorq	%r15, %r14
	rolq	$31, %rdx
	addq	%r14, %rsi
	movq	%r14, 728(%rsp)
	xorq	%rdx, %r13
	xorq	%r15, %rdx
	movq	%r14, preCompInternalState(%rip)
	xorq	%r13, %rax
	movq	%r13, %r15
	addq	%rdx, %rdi
	xorq	%rcx, %r15
	addq	%rax, %r12
	movabsq	$-1087367646907149102, %rcx
	leaq	(%r12,%rdi), %r14
	addq	%r15, %rbx
	movq	%rdx, preCompInternalState+8(%rip)
	leaq	(%rsi,%rbx), %r13
	addq	%rcx, %rbx
	movq	%rax, preCompInternalState+16(%rip)
	leaq	(%rbx,%r14), %rcx
	movabsq	$-3329063056561552456, %rbx
	movq	%r15, preCompInternalState+24(%rip)
	rolq	$7, %rcx
	addq	%rbx, %rsi
	movabsq	$-6657276164713376882, %rbx
	addq	%r14, %rsi
	movabsq	$-5426079245872290139, %r14
	addq	%rbx, %r12
	addq	%r14, %rdi
	rolq	$19, %rsi
	addq	%r13, %rdi
	addq	%r12, %r13
	movq	%rsi, %r14
	rolq	$53, %r13
	rolq	$31, %rdi
	xorq	%rcx, %r14
	movq	%r13, %rbx
	xorq	%r14, %r13
	xorq	%rdi, %r14
	xorq	%rdi, %rbx
	addq	%r13, %r9
	addq	%r14, %r8
	xorq	%rbx, %rsi
	xorq	%rcx, %rbx
	movabsq	$-3329063056561552456, %rdi
	addq	%rbx, %r10
	addq	%rsi, %r11
	movq	%rsi, 680(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 584(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r13, 712(%rsp)
	addq	%rbx, %rdi
	addq	%r11, %rcx
	addq	%rbx, %rsi
	rolq	$19, %rdi
	rolq	$53, %rcx
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r10
	movq	%rcx, %r9
	xorq	%rsi, %r10
	xorq	%r8, %r9
	movq	616(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	744(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	664(%rsp), %r10
	addq	648(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 568(%rsp)
	movq	%r14, 696(%rsp)
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	movabsq	$-1087367646907149102, %r14
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	rolq	$19, %r11
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$7, %r10
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %r9
	xorq	%r13, %rbx
	xorq	%r12, %r11
	xorq	%r12, %r10
	movabsq	$-5486504877919021346, %r13
	movabsq	$853475092736589577, %r12
	movabsq	$-4925106476758491821, %r14
	movabsq	$1906713845121804688, %rcx
	addq	%r11, %r13
	addq	%r9, %rcx
	addq	%r10, %r14
	addq	%rbx, %r12
	movq	%r13, InternalState+104(%rip)
	movq	%r14, InternalState+112(%rip)
	movq	%r12, InternalState+96(%rip)
	addq	%rcx, %r14
	addq	%r13, %r12
	movq	%rcx, InternalState+120(%rip)
	movabsq	$2181267548300685623, %r13
	movabsq	$-7393874248442859403, %rcx
	addq	%rcx, %rbx
	addq	%r13, %r11
	movabsq	$1295863579293049999, %rcx
	addq	%r14, %rbx
	addq	%r11, %r14
	movabsq	$6102157975113963195, %r11
	addq	%r11, %r9
	addq	%rcx, %r10
	rolq	$23, %r14
	addq	%r12, %r10
	addq	%r9, %r12
	movq	%r14, %r9
	rolq	$59, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r12, %r13
	xorq	%rbx, %r9
	movabsq	$7667772426219706969, %r11
	xorq	%r10, %r13
	xorq	%r9, %r12
	xorq	%r9, %r10
	xorq	%r13, %r14
	xorq	%r13, %rbx
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r14, preCompInternalState+96(%rip)
	addq	568(%rsp), %r14
	addq	%rdi, %r12
	movq	%rbx, preCompInternalState+104(%rip)
	movq	%r10, preCompInternalState+120(%rip)
	addq	%r8, %rbx
	addq	%rsi, %r10
	leaq	(%r12,%rbx), %r9
	movabsq	$-8247349341179448980, %r13
	movabsq	$4195444129992158507, %r8
	movabsq	$7667772426219706969, %rsi
	movabsq	$6220970056051541820, %rdi
	leaq	(%r14,%r10), %rcx
	movq	%rbx, InternalState+64(%rip)
	movq	%r12, InternalState+72(%rip)
	addq	%r13, %rbx
	addq	%rsi, %r12
	movq	%r10, InternalState+80(%rip)
	movq	%r14, InternalState+88(%rip)
	addq	%rdi, %r10
	addq	%r8, %r14
	addq	%rcx, %rbx
	addq	%r9, %r10
	addq	%r12, %rcx
	addq	%r14, %r9
	rolq	$11, %rbx
	rolq	$23, %rcx
	rolq	$37, %r10
	rolq	$59, %r9
	movq	%rcx, %rsi
	movq	%r9, %rdi
	xorq	%rbx, %rsi
	movabsq	$6220970056051541820, %r12
	xorq	%r10, %rdi
	xorq	%rsi, %r9
	xorq	%rsi, %r10
	xorq	%rdi, %rbx
	movq	%r9, preCompInternalState+80(%rip)
	xorq	%rdi, %rcx
	movq	%rbx, preCompInternalState+72(%rip)
	addq	680(%rsp), %r9
	addq	696(%rsp), %rbx
	movq	%rcx, preCompInternalState+64(%rip)
	movq	%r10, preCompInternalState+88(%rip)
	addq	712(%rsp), %rcx
	addq	584(%rsp), %r10
	movq	520(%rsp), %r14
	movq	%r9, InternalState+40(%rip)
	leaq	(%r9,%rbx), %rsi
	movq	%rbx, InternalState+32(%rip)
	addq	%r11, %r9
	movq	%rcx, InternalState+56(%rip)
	addq	%r13, %rbx
	movq	600(%rsp), %r13
	movq	%r10, InternalState+48(%rip)
	leaq	(%rcx,%r10), %rdi
	addq	%r8, %rcx
	addq	%r12, %r10
	addq	%rsi, %r10
	addq	%rcx, %rsi
	addq	%rdi, %rbx
	rolq	$59, %rsi
	addq	%r9, %rdi
	rolq	$37, %r10
	movq	%rsi, %rcx
	rolq	$23, %rdi
	rolq	$11, %rbx
	xorq	%r10, %rcx
	movq	%rdi, %r8
	movabsq	$7860495443403156170, %r9
	xorq	%rcx, %rdi
	xorq	%rbx, %r8
	xorq	%rcx, %rbx
	movq	%rdi, preCompInternalState+32(%rip)
	addq	728(%rsp), %rdi
	xorq	%r8, %rsi
	xorq	%r8, %r10
	movq	%rbx, preCompInternalState+40(%rip)
	movq	%rsi, preCompInternalState+48(%rip)
	movq	%r10, preCompInternalState+56(%rip)
	addq	%rax, %rsi
	addq	%r15, %r10
	addq	%rdx, %rbx
	movq	%rsi, InternalState+8(%rip)
	movq	%r10, InternalState+16(%rip)
	movq	%rbx, InternalState(%rip)
	movq	%rdi, InternalState+24(%rip)
	movabsq	$-8247349341179448980, %r15
	xorq	0(%r13), %rbx
	movabsq	$-3833335565246798826, %r10
	movq	%rbx, InternalState(%rip)
	movq	%rbx, 64(%r14)
	movabsq	$4195444129992158507, %rbx
	movq	8(%r13), %rax
	xorq	InternalState+8(%rip), %rax
	movq	%rax, InternalState+8(%rip)
	movq	%rax, 72(%r14)
	movq	16(%r13), %rax
	xorq	InternalState+16(%rip), %rax
	movq	%rax, InternalState+16(%rip)
	movq	%rax, 80(%r14)
	movq	24(%r13), %rax
	xorq	InternalState+24(%rip), %rax
	movq	%rax, InternalState+24(%rip)
	movq	%rax, 88(%r14)
	movq	32(%r13), %rax
	xorq	InternalState+64(%rip), %rax
	movq	%rax, InternalState+64(%rip)
	movq	%rax, 96(%r14)
	movq	40(%r13), %rax
	xorq	InternalState+72(%rip), %rax
	movq	%rax, InternalState+72(%rip)
	movq	%rax, 104(%r14)
	movq	48(%r13), %rax
	xorq	InternalState+80(%rip), %rax
	movq	%rax, InternalState+80(%rip)
	movq	%rax, 112(%r14)
	movq	56(%r13), %rax
	xorq	InternalState+88(%rip), %rax
	movabsq	$-6802927476391842224, %r13
	movq	%rax, InternalState+88(%rip)
	movq	%rax, 120(%r14)
	movabsq	$2580067509209331373, %r14
	movq	InternalState(%rip), %rcx
	movq	InternalState+8(%rip), %rdi
	movq	InternalState+16(%rip), %rax
	movq	InternalState+24(%rip), %rsi
	leaq	(%rdi,%rcx), %rdx
	addq	%r11, %rdi
	addq	%r15, %rcx
	leaq	(%rsi,%rax), %r8
	addq	%rbx, %rsi
	addq	%r12, %rax
	addq	%rdx, %rsi
	addq	%rdx, %rax
	movabsq	$-6792583489299504353, %r12
	addq	%r8, %rdi
	addq	%r8, %rcx
	rolq	$59, %rsi
	rolq	$23, %rdi
	rolq	$11, %rcx
	rolq	$37, %rax
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movabsq	$-1457182779415996031, %r11
	xorq	%rax, %r8
	xorq	%rcx, %rdx
	movabsq	$-8247349341179448980, %rbx
	xorq	%rdx, %rsi
	xorq	%r8, %rcx
	xorq	%r8, %rdi
	leaq	(%rcx,%rsi), %r8
	xorq	%rdx, %rax
	leaq	(%rdi,%rax), %rdx
	addq	%r12, %rdi
	addq	%r11, %rax
	addq	%r9, %r8
	movabsq	$6220970056051541820, %r9
	movabsq	$-3329063056561552456, %r12
	leaq	(%rdi,%r8), %r15
	addq	%r8, %rax
	addq	%r10, %rdx
	rolq	$7, %rax
	movabsq	$7667772426219706969, %r8
	movabsq	$4195444129992158507, %r10
	rolq	$19, %r15
	addq	%r13, %rcx
	addq	%r14, %rsi
	addq	%rdx, %rsi
	addq	%rdx, %rcx
	movq	%r15, %rdi
	rolq	$53, %rsi
	rolq	$31, %rcx
	xorq	%rax, %rdi
	movq	%rsi, %rdx
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rcx, %rdx
	movq	InternalState+40(%rip), %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	InternalState+48(%rip), %rax
	movq	%r15, 696(%rsp)
	movq	%rdx, 680(%rsp)
	movabsq	$-1087367646907149102, %r11
	movq	InternalState+32(%rip), %rdx
	movq	InternalState+56(%rip), %r15
	movabsq	$-5426079245872290139, %r14
	movq	%rdi, 712(%rsp)
	leaq	(%rcx,%rdx), %rsi
	leaq	(%r15,%rax), %rdi
	addq	%r8, %rcx
	addq	%r10, %r15
	addq	%rbx, %rdx
	addq	%r9, %rax
	addq	%rdi, %rcx
	addq	%rsi, %r15
	addq	%rdi, %rdx
	rolq	$23, %rcx
	addq	%rsi, %rax
	rolq	$59, %r15
	rolq	$11, %rdx
	rolq	$37, %rax
	movq	%r15, %r13
	movq	%rcx, %rsi
	xorq	%rax, %r13
	movabsq	$-6657276164713376882, %rbx
	xorq	%rdx, %rsi
	xorq	%r13, %rdx
	xorq	%rcx, %r13
	addq	712(%rsp), %rdx
	xorq	%rsi, %r15
	xorq	%rsi, %rax
	addq	696(%rsp), %r15
	addq	680(%rsp), %rax
	movabsq	$7667772426219706969, %r10
	addq	728(%rsp), %r13
	movq	InternalState+88(%rip), %rdi
	movabsq	$-8247349341179448980, %r9
	leaq	(%r15,%rdx), %rsi
	addq	%rbx, %r15
	addq	%r14, %rdx
	leaq	0(%r13,%rax), %rcx
	addq	%r12, %r13
	addq	%r11, %rax
	addq	%rsi, %r13
	addq	%rsi, %rax
	movabsq	$4195444129992158507, %rbx
	addq	%rcx, %r15
	rolq	$19, %r13
	addq	%rcx, %rdx
	rolq	$53, %r15
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r13, %r12
	movq	%r15, %r14
	movq	InternalState+72(%rip), %rcx
	xorq	%rax, %r12
	xorq	%rdx, %r14
	movabsq	$6220970056051541820, %r11
	xorq	%r12, %r15
	xorq	%r14, %r13
	xorq	%rdx, %r12
	xorq	%rax, %r14
	movq	InternalState+64(%rip), %rdx
	movq	InternalState+80(%rip), %rax
	leaq	(%rcx,%rdx), %rsi
	leaq	(%rdi,%rax), %r8
	addq	%r10, %rcx
	addq	%rbx, %rdi
	addq	%r9, %rdx
	addq	%r11, %rax
	addq	%r8, %rcx
	addq	%rsi, %rdi
	addq	%r8, %rdx
	rolq	$23, %rcx
	addq	%rsi, %rax
	rolq	$59, %rdi
	rolq	$37, %rax
	rolq	$11, %rdx
	movq	%rdi, %r9
	movq	%rcx, %rsi
	xorq	%rax, %r9
	movabsq	$-6657276164713376882, %rbx
	xorq	%rdx, %rsi
	xorq	%r9, %rdx
	xorq	%rcx, %r9
	xorq	%rsi, %rax
	addq	%r15, %r9
	xorq	%rsi, %rdi
	addq	%r14, %rax
	addq	%r12, %rdx
	addq	%r13, %rdi
	leaq	(%r9,%rax), %rcx
	leaq	(%rdi,%rdx), %rsi
	movabsq	$-3329063056561552456, %r10
	addq	%rbx, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r10, %r9
	addq	%r11, %rdx
	addq	%rcx, %rdi
	movabsq	$-1087367646907149102, %r8
	addq	%r8, %rax
	addq	%rsi, %r9
	addq	%rcx, %rdx
	rolq	$53, %rdi
	rolq	$31, %rdx
	addq	%rsi, %rax
	rolq	$19, %r9
	movq	%rdi, %r8
	rolq	$7, %rax
	xorq	%rdx, %r8
	movq	InternalState+96(%rip), %rcx
	movq	InternalState+104(%rip), %rsi
	movq	%r9, %r10
	movq	InternalState+120(%rip), %rbx
	xorq	%r8, %r9
	xorq	%rax, %r10
	xorq	%rax, %r8
	movq	InternalState+112(%rip), %rax
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	movabsq	$-8247349341179448980, %rdx
	leaq	(%rsi,%rcx), %r11
	addq	%rdx, %rcx
	movabsq	$7667772426219706969, %rdx
	addq	%rax, %rbx
	addq	%rdx, %rsi
	movabsq	$4195444129992158507, %rdx
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	movabsq	$6220970056051541820, %rbx
	rolq	$11, %rcx
	rolq	$23, %rsi
	addq	%rbx, %rax
	addq	InternalState+120(%rip), %rdx
	addq	%r11, %rax
	movq	%rsi, %rbx
	rolq	$37, %rax
	xorq	%rcx, %rbx
	addq	%r11, %rdx
	rolq	$59, %rdx
	movq	%rdx, %r11
	xorq	%rbx, %rdx
	xorq	%rax, %r11
	addq	%r9, %rdx
	xorq	%rbx, %rax
	xorq	%r11, %rcx
	xorq	%r11, %rsi
	addq	%r8, %rax
	addq	%rdi, %rsi
	addq	%r10, %rcx
	movq	%rsi, 664(%rsp)
	leaq	(%rdx,%rcx), %rbx
	movq	%rsi, %r11
	movabsq	$-1087367646907149102, %rsi
	addq	%rax, %r11
	addq	%rax, %rsi
	leaq	(%rsi,%rbx), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	664(%rsp), %rsi
	rolq	$7, %rax
	addq	%rbx, %rsi
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rcx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %rsi
	addq	%rbx, %rdx
	addq	%r11, %rcx
	movq	%rsi, %rbx
	addq	%r11, %rdx
	rolq	$31, %rcx
	xorq	%rax, %rbx
	rolq	$53, %rdx
	movq	%rdx, %r11
	xorq	%rbx, %rdx
	xorq	%rcx, %r11
	xorq	%rbx, %rcx
	xorq	%r11, %rsi
	xorq	%r11, %rax
	movabsq	$-3210636887397455352, %r11
	leaq	(%rdx,%rax), %rbx
	addq	%r11, %rbx
	leaq	(%rcx,%rsi), %r11
	movq	%r11, 744(%rsp)
	movabsq	$5597446114060141266, %r11
	addq	744(%rsp), %r11
	movq	%r11, 744(%rsp)
	movabsq	$2199824780781266189, %r11
	addq	%r11, %rcx
	movabsq	$2818044418319133066, %r11
	addq	%r11, %rsi
	movabsq	$2553129884740551573, %r11
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	addq	%r11, %rdx
	movabsq	$4652647413905693402, %rbx
	addq	744(%rsp), %rdx
	addq	%rbx, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r11
	xorq	%rcx, %r11
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %rbx
	xorq	%r11, %rdx
	xorq	%rax, %r11
	xorq	%rax, %rbx
	addq	%rdx, %r9
	addq	%r11, %r8
	xorq	%rbx, %rsi
	xorq	%rcx, %rbx
	movq	%rdx, 744(%rsp)
	addq	%rbx, %r10
	movq	%rsi, 648(%rsp)
	addq	%rdi, %rsi
	leaq	(%rsi,%r8), %rax
	leaq	(%r9,%r10), %rcx
	movq	%rbx, 616(%rsp)
	movabsq	$-8247349341179448980, %rdx
	movabsq	$6220970056051541820, %rbx
	movabsq	$7667772426219706969, %rdi
	addq	%rbx, %r8
	addq	%rdx, %r10
	addq	%r9, %rdi
	leaq	(%r10,%rax), %rdx
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r9
	leaq	(%r8,%rcx), %rax
	addq	%rsi, %r9
	rolq	$23, %rdi
	rolq	$11, %rdx
	movq	%rdi, %r8
	movq	%r11, 664(%rsp)
	rolq	$37, %rax
	addq	%rcx, %r9
	xorq	%rdx, %r8
	rolq	$59, %r9
	movq	%r9, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%rax, %r10
	leaq	(%r8,%r14), %rax
	leaq	(%r9,%r13), %r11
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	movabsq	$-8247349341179448980, %r13
	leaq	(%rdi,%r15), %rsi
	addq	%r10, %r12
	movabsq	$7667772426219706969, %r14
	leaq	(%r11,%r12), %rcx
	addq	%r13, %r12
	addq	%r14, %r11
	leaq	(%rsi,%rax), %rbx
	movabsq	$6220970056051541820, %r15
	addq	%r15, %rax
	movq	712(%rsp), %r15
	leaq	(%r12,%rbx), %rdx
	movabsq	$4195444129992158507, %r12
	addq	%rbx, %r11
	addq	%rsi, %r12
	rolq	$23, %r11
	addq	%rcx, %rax
	addq	%rcx, %r12
	rolq	$11, %rdx
	movq	%r11, %rbx
	rolq	$59, %r12
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	xorq	%rax, %r13
	movq	696(%rsp), %rax
	movq	728(%rsp), %rsi
	xorq	%r13, %r11
	xorq	%rdx, %r13
	movabsq	$-8247349341179448980, %rcx
	addq	%r13, %r15
	addq	%r12, %rax
	addq	%r11, %rsi
	movq	%rax, 712(%rsp)
	movq	680(%rsp), %rax
	movq	712(%rsp), %rdx
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %r14
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	rolq	$11, %rcx
	addq	712(%rsp), %r15
	addq	%r14, %r15
	movabsq	$6220970056051541820, %r14
	addq	%r14, %rax
	movabsq	$4195444129992158507, %r14
	rolq	$23, %r15
	addq	%r14, %rsi
	addq	%rdx, %rax
	movq	%r15, %r14
	addq	%rdx, %rsi
	rolq	$37, %rax
	xorq	%rcx, %r14
	rolq	$59, %rsi
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	addq	%r15, %r13
	movq	%rdx, %rcx
	addq	%r14, %rbx
	addq	%rsi, %r11
	addq	%r12, %rcx
	movq	%r15, 712(%rsp)
	movq	%rdx, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 680(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r12
	movabsq	$-5426079245872290139, %r11
	rolq	$7, %rax
	addq	%r11, %r13
	movabsq	$-6657276164713376882, %r11
	addq	%rcx, %r11
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %r11
	movq	%r12, %r13
	rolq	$53, %r11
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r11, %rbx
	xorq	%r13, %r11
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r10
	addq	%r11, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r9), %rcx
	addq	%rbx, %r8
	leaq	(%rdi,%r8), %rsi
	addq	%r14, %rdi
	addq	%r15, %r8
	leaq	(%rcx,%r10), %rdx
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %r10
	leaq	(%rdi,%rdx), %r9
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r8,%rdx), %rax
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %rdx
	movq	616(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	664(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	744(%rsp), %rdx
	xorq	%rax, %r8
	movq	648(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 744(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	rolq	$11, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r8
	addq	%rdx, %r9
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rdx, 744(%rsp)
	movq	%rsi, 648(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 616(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r9
	leaq	(%r10,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	addq	%rsi, %r9
	addq	%rax, %r8
	addq	%rcx, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	rolq	$59, %r9
	rolq	$11, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	movq	%r14, 664(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	696(%rsp), %r14
	xorq	%rax, %r10
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	leaq	(%rdi,%r11), %rsi
	xorq	%rax, %r8
	addq	%r9, %r12
	addq	%r10, %r13
	addq	%r8, %rbx
	movabsq	$7667772426219706969, %r11
	leaq	(%rsi,%rbx), %rax
	leaq	(%r12,%r13), %rcx
	addq	%r12, %r11
	movabsq	$6220970056051541820, %r12
	addq	%r15, %r13
	movq	712(%rsp), %r15
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %r11
	addq	%rsi, %r12
	leaq	(%rbx,%rcx), %rax
	rolq	$23, %r11
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%r11, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	728(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	680(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 712(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%r14, %rax
	rolq	$37, %rax
	addq	%rdx, %rsi
	addq	%r14, %rsi
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	addq	%r14, %rbx
	movq	%r15, 712(%rsp)
	addq	%rsi, %r11
	movq	%rdx, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%r11,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 680(%rsp)
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rsi, %r13
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r14
	movabsq	$-6657276164713376882, %r11
	leaq	0(%r13,%rcx), %rdx
	addq	%r11, %r12
	rolq	$7, %rax
	addq	%rcx, %r12
	rolq	$19, %r14
	rolq	$31, %rdx
	rolq	$53, %r12
	movq	%r14, %r15
	movq	%r12, %r13
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r15, %r12
	xorq	%rdx, %r15
	xorq	%r13, %r14
	addq	%r15, %r10
	xorq	%rax, %r13
	addq	%r14, %r9
	addq	%r13, %r8
	addq	%r12, %rdi
	leaq	(%r9,%r10), %rdx
	movabsq	$-1087367646907149102, %rax
	leaq	(%rdi,%r8), %rcx
	addq	%rax, %r8
	addq	%rbx, %rdi
	addq	%rsi, %r10
	addq	%r11, %r9
	leaq	(%r8,%rdx), %rax
	addq	%rdx, %rdi
	rolq	$19, %rdi
	leaq	(%r10,%rcx), %rdx
	addq	%r9, %rcx
	rolq	$7, %rax
	rolq	$53, %rcx
	movq	%rdi, %r8
	movq	648(%rsp), %rbx
	rolq	$31, %rdx
	xorq	%rax, %r8
	movq	%rcx, %rsi
	movq	744(%rsp), %r9
	xorq	%r8, %rcx
	xorq	%rdx, %rsi
	xorq	%rdx, %r8
	movq	616(%rsp), %rdx
	addq	%rcx, %rbx
	movq	664(%rsp), %r11
	xorq	%rsi, %rdi
	movq	%rbx, 744(%rsp)
	movq	744(%rsp), %r10
	xorq	%rax, %rsi
	addq	%r8, %rdx
	addq	%rdi, %r9
	movabsq	$-1087367646907149102, %rax
	leaq	(%r9,%rdx), %rbx
	addq	%rsi, %r11
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	744(%rsp), %r11
	rolq	$7, %rax
	addq	%rbx, %r11
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r9
	addq	%r10, %rdx
	movq	%r11, %rbx
	addq	%r10, %r9
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%rbx, %r9
	xorq	%rdx, %r10
	xorq	%rbx, %rdx
	xorq	%r10, %rax
	xorq	%r10, %r11
	movabsq	$1649971794476935487, %r10
	leaq	(%r9,%rax), %rbx
	addq	%r10, %rbx
	leaq	(%rdx,%r11), %r10
	movq	%r10, 744(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	744(%rsp), %r10
	movq	%r10, 744(%rsp)
	movabsq	$9059564915322872455, %r10
	addq	%r10, %rdx
	movabsq	$-7724133909308953704, %r10
	addq	%r10, %r11
	addq	%rbx, %rdx
	movabsq	$3257124934342745045, %r10
	addq	%rbx, %r11
	movabsq	$8809261046177890769, %rbx
	rolq	$11, %rdx
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	%r10, %r9
	addq	744(%rsp), %r9
	addq	744(%rsp), %rax
	movq	%r11, %r10
	xorq	%rdx, %r10
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%rax, %r10
	xorq	%rax, %rbx
	addq	%r10, %rsi
	addq	%r9, %rdi
	xorq	%rbx, %r11
	xorq	%rdx, %rbx
	addq	%r11, %rcx
	movq	%r11, 648(%rsp)
	addq	%rbx, %r8
	leaq	(%rcx,%rsi), %rax
	movabsq	$-8247349341179448980, %r11
	movq	%r9, 744(%rsp)
	movq	%r10, 664(%rsp)
	leaq	(%rdi,%r8), %r9
	movabsq	$4195444129992158507, %r10
	addq	%r11, %r8
	addq	%r10, %rcx
	movq	%rbx, 616(%rsp)
	leaq	(%r8,%rax), %rdx
	movabsq	$7667772426219706969, %rbx
	movabsq	$6220970056051541820, %r8
	addq	%r8, %rsi
	addq	%rbx, %rdi
	leaq	(%rcx,%r9), %r11
	addq	%rax, %rdi
	leaq	(%rsi,%r9), %rax
	rolq	$11, %rdx
	rolq	$23, %rdi
	rolq	$59, %r11
	movq	%rbx, %r10
	rolq	$37, %rax
	movq	%r11, %r8
	movq	%rdi, %rsi
	xorq	%rax, %r8
	xorq	%rdx, %rsi
	movabsq	$6220970056051541820, %rbx
	xorq	%rsi, %r11
	xorq	%r8, %rdi
	xorq	%rax, %rsi
	xorq	%rdx, %r8
	addq	%r11, %r14
	movabsq	$-8247349341179448980, %rdx
	addq	%r8, %r15
	addq	%rsi, %r13
	addq	%rdi, %r12
	leaq	(%r12,%r13), %rax
	leaq	(%r14,%r15), %rcx
	addq	%rbx, %r13
	addq	%rdx, %r15
	addq	%r14, %r10
	movabsq	$4195444129992158507, %rbx
	leaq	(%r15,%rax), %rdx
	addq	%rax, %r10
	addq	%r12, %rbx
	rolq	$23, %r10
	leaq	0(%r13,%rcx), %rax
	addq	%rcx, %rbx
	rolq	$11, %rdx
	rolq	$59, %rbx
	movq	%r10, %r9
	rolq	$37, %rax
	xorq	%rdx, %r9
	movq	%rbx, %r12
	movq	728(%rsp), %r15
	xorq	%rax, %r12
	xorq	%r9, %rbx
	xorq	%rax, %r9
	movq	680(%rsp), %rax
	movq	712(%rsp), %r14
	movq	696(%rsp), %r13
	xorq	%r12, %r10
	xorq	%rdx, %r12
	addq	%r10, %r15
	movabsq	$-8247349341179448980, %rdx
	addq	%r9, %rax
	addq	%r12, %r14
	leaq	(%r15,%rax), %rcx
	addq	%rbx, %r13
	movq	%r13, 712(%rsp)
	addq	%r14, %r13
	addq	%rdx, %r14
	leaq	(%r14,%rcx), %rdx
	movabsq	$7667772426219706969, %r14
	addq	712(%rsp), %r14
	rolq	$11, %rdx
	addq	%rcx, %r14
	movabsq	$6220970056051541820, %rcx
	addq	%rcx, %rax
	rolq	$23, %r14
	leaq	(%rax,%r13), %rcx
	movabsq	$4195444129992158507, %rax
	addq	%rax, %r15
	addq	%r13, %r15
	rolq	$37, %rcx
	movq	%r14, %r13
	rolq	$59, %r15
	movq	%r15, %rax
	xorq	%rcx, %rax
	xorq	%rdx, %r13
	xorq	%r13, %r15
	xorq	%rax, %rdx
	xorq	%rax, %r14
	leaq	(%rdx,%r15), %rax
	xorq	%r13, %rcx
	movabsq	$-2922945419276229487, %r13
	addq	%r13, %rax
	leaq	(%r14,%rcx), %r13
	movq	%r13, 728(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	728(%rsp), %r13
	movq	%r13, 728(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r14
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r15
	addq	%r14, %rax
	addq	728(%rsp), %r15
	movabsq	$6923416813890349993, %r14
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r14, %rdx
	addq	728(%rsp), %rdx
	movq	%rax, %r14
	xorq	%rcx, %r14
	rolq	$53, %r15
	movq	%r15, %r13
	xorq	%r14, %r15
	rolq	$31, %rdx
	addq	%r15, %r10
	movq	%r15, preCompInternalState(%rip)
	xorq	%rdx, %r13
	xorq	%r14, %rdx
	movabsq	$-1087367646907149102, %r14
	xorq	%r13, %rax
	xorq	%rcx, %r13
	addq	%rdx, %r12
	addq	%rax, %rbx
	movq	%r13, %rcx
	movq	%r13, 728(%rsp)
	addq	%r9, %rcx
	movq	%r13, preCompInternalState+24(%rip)
	leaq	(%rbx,%r12), %r13
	leaq	(%r10,%rcx), %r9
	addq	%r14, %rcx
	movabsq	$-3329063056561552456, %r14
	addq	%r13, %rcx
	movq	%rdx, preCompInternalState+8(%rip)
	movq	%rax, preCompInternalState+16(%rip)
	rolq	$7, %rcx
	addq	%r14, %r10
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r14, %rbx
	movabsq	$-5426079245872290139, %r13
	addq	%r13, %r12
	addq	%r9, %rbx
	rolq	$19, %r10
	addq	%r9, %r12
	rolq	$53, %rbx
	movq	%r10, %r13
	rolq	$31, %r12
	movq	%rbx, %r9
	xorq	%rcx, %r13
	xorq	%r12, %r9
	xorq	%r13, %rbx
	xorq	%r12, %r13
	xorq	%r9, %r10
	xorq	%rcx, %r9
	addq	%r13, %r8
	movq	%r10, %rcx
	addq	%rbx, %rdi
	addq	%r9, %rsi
	addq	%r11, %rcx
	movq	%r10, 680(%rsp)
	movq	%r9, 584(%rsp)
	leaq	(%rcx,%r8), %r10
	leaq	(%rdi,%rsi), %r9
	movabsq	$-3329063056561552456, %r11
	addq	%r11, %rdi
	addq	%r14, %rcx
	movq	%rbx, 712(%rsp)
	movabsq	$-5426079245872290139, %r12
	movabsq	$-1087367646907149102, %rbx
	addq	%r10, %rdi
	addq	%rbx, %rsi
	addq	%r12, %r8
	addq	%r9, %rcx
	addq	%r10, %rsi
	rolq	$19, %rdi
	addq	%r9, %r8
	rolq	$53, %rcx
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r10
	movq	%rcx, %r9
	movq	616(%rsp), %rbx
	xorq	%r8, %r9
	xorq	%rsi, %r10
	movq	%r13, 696(%rsp)
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	744(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	664(%rsp), %r10
	addq	648(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 568(%rsp)
	movabsq	$-1087367646907149102, %r14
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	rolq	$19, %r11
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$7, %r10
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %r9
	movabsq	$-4925106476758491821, %r14
	xorq	%r12, %r10
	movabsq	$1906713845121804688, %rcx
	xorq	%r13, %rbx
	addq	%r9, %rcx
	xorq	%r12, %r11
	addq	%r10, %r14
	movabsq	$853475092736589577, %r12
	movabsq	$-5486504877919021346, %r13
	movq	%r14, InternalState+112(%rip)
	addq	%r11, %r13
	addq	%rbx, %r12
	addq	%rcx, %r14
	movq	%rcx, InternalState+120(%rip)
	movabsq	$-7393874248442859403, %rcx
	movq	%r12, InternalState+96(%rip)
	movq	%r13, InternalState+104(%rip)
	addq	%r13, %r12
	addq	%rcx, %rbx
	movabsq	$2181267548300685623, %r13
	addq	%r14, %rbx
	movabsq	$1295863579293049999, %rcx
	addq	%r13, %r11
	addq	%rcx, %r10
	rolq	$11, %rbx
	addq	%r11, %r14
	movabsq	$6102157975113963195, %r11
	addq	%r12, %r10
	addq	%r11, %r9
	rolq	$23, %r14
	rolq	$37, %r10
	addq	%r9, %r12
	movq	%r14, %r9
	movabsq	$-8247349341179448980, %r11
	rolq	$59, %r12
	xorq	%rbx, %r9
	movq	%r12, %r13
	xorq	%r9, %r12
	xorq	%r10, %r13
	xorq	%r9, %r10
	addq	%r12, %rdi
	xorq	%r13, %r14
	xorq	%r13, %rbx
	addq	%r10, %rsi
	movq	%r14, preCompInternalState+96(%rip)
	movq	%rbx, preCompInternalState+104(%rip)
	addq	%rbx, %r8
	movq	568(%rsp), %rcx
	movabsq	$7667772426219706969, %rbx
	addq	%r8, %r11
	addq	%rdi, %rbx
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r10, preCompInternalState+120(%rip)
	movabsq	$4195444129992158507, %r12
	leaq	(%rdi,%r8), %r10
	movq	%r8, InternalState+64(%rip)
	addq	%r14, %rcx
	movabsq	$-8247349341179448980, %r14
	movq	%rdi, InternalState+72(%rip)
	leaq	(%rcx,%rsi), %r9
	addq	%rcx, %r12
	movq	%rsi, InternalState+80(%rip)
	movq	%rcx, InternalState+88(%rip)
	addq	%r9, %r11
	addq	%r9, %rbx
	movabsq	$6220970056051541820, %r9
	addq	%rsi, %r9
	rolq	$23, %rbx
	rolq	$11, %r11
	addq	%r10, %r9
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%r10, %r13
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r12, %r9
	movq	%rbx, preCompInternalState+64(%rip)
	movq	%r11, preCompInternalState+72(%rip)
	addq	712(%rsp), %rbx
	addq	696(%rsp), %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%r9, preCompInternalState+88(%rip)
	addq	680(%rsp), %r10
	addq	584(%rsp), %r9
	movq	%r11, InternalState+32(%rip)
	movq	%rbx, InternalState+56(%rip)
	leaq	(%rbx,%r9), %r13
	leaq	(%r10,%r11), %r12
	addq	%r14, %r11
	movabsq	$7667772426219706969, %r14
	movq	%r10, InternalState+40(%rip)
	movq	%r9, InternalState+48(%rip)
	addq	%r14, %r10
	addq	%r13, %r11
	movabsq	$4195444129992158507, %r14
	addq	%r13, %r10
	movabsq	$6220970056051541820, %r13
	addq	%r14, %rbx
	addq	%r13, %r9
	rolq	$23, %r10
	rolq	$11, %r11
	addq	%r12, %r9
	addq	%rbx, %r12
	movq	%r10, %r14
	rolq	$59, %r12
	xorq	%r11, %r14
	rolq	$37, %r9
	movq	%r12, %rbx
	xorq	%r14, %r12
	xorq	%r9, %rbx
	xorq	%r14, %r9
	movq	%r12, preCompInternalState+48(%rip)
	movq	%r9, preCompInternalState+56(%rip)
	addq	728(%rsp), %r9
	xorq	%rbx, %r10
	xorq	%rbx, %r11
	movq	%r10, preCompInternalState+32(%rip)
	addq	%rax, %r12
	addq	%r15, %r10
	movq	%r11, preCompInternalState+40(%rip)
	addq	%rdx, %r11
	movq	%r11, InternalState(%rip)
	addq	%r11, 408(%rsp)
	movq	%r12, InternalState+8(%rip)
	addq	%r12, 440(%rsp)
	movq	%r9, InternalState+16(%rip)
	addq	%r9, 456(%rsp)
	movq	%r10, InternalState+24(%rip)
	addq	%r10, 472(%rsp)
	addq	%r8, 424(%rsp)
	movq	152(%rsp), %r15
	addq	%rdi, 488(%rsp)
	addq	%rsi, 504(%rsp)
	addq	%rcx, 552(%rsp)
	addq	$64, 600(%rsp)
	addq	$64, 520(%rsp)
	cmpq	%r15, 632(%rsp)
	jne	.L22
	vmovq	456(%rsp), %xmm1
	movq	88(%rsp), %rax
	vmovq	408(%rsp), %xmm2
	movq	136(%rsp), %rcx
	vpinsrq	$1, 472(%rsp), %xmm1, %xmm0
	vmovq	504(%rsp), %xmm3
	movq	104(%rsp), %rbx
	notq	%rax
	vpinsrq	$1, 440(%rsp), %xmm2, %xmm1
	leaq	1(%rcx,%rax), %rdx
	vmovq	424(%rsp), %xmm4
	addq	%rcx, %rax
	addq	%rdx, 112(%rsp)
	leaq	8(%rbx,%rax,8), %rbx
	movq	%rbx, 104(%rsp)
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 488(%rsp), %xmm4, %xmm1
	vmovdqa	%ymm0, 776(%rsp)
	vpinsrq	$1, 552(%rsp), %xmm3, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 808(%rsp)
.L19:
	movq	(%rsp), %rax
	andl	$63, %eax
	je	.L23
	vmovdqa	904(%rsp), %ymm0
	movq	112(%rsp), %rcx
	movabsq	$-8247349341179448980, %rsi
	movq	104(%rsp), %r8
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %rbx
	addq	$1, %rcx
	xorq	InternalState(%rip), %rcx
	movq	InternalState+8(%rip), %r10
	salq	$3, %r8
	vmovdqa	936(%rsp), %ymm0
	leaq	(%rbx,%rdi), %rdx
	movq	%r8, 696(%rsp)
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rdx,%rsi), %r9
	leaq	(%rcx,%r10), %r8
	vmovdqa	968(%rsp), %ymm0
	addq	%rcx, %r9
	movabsq	$7667772426219706969, %rcx
	vmovdqa	%ymm0, InternalState+64(%rip)
	addq	%rcx, %r10
	rolq	$11, %r9
	vmovdqa	1000(%rsp), %ymm0
	leaq	(%r10,%rdx), %r11
	movabsq	$6220970056051541820, %rdx
	movabsq	$4195444129992158507, %r10
	addq	%rdx, %rdi
	addq	%r10, %rbx
	vmovdqa	%ymm0, InternalState+96(%rip)
	addq	%r8, %rdi
	addq	%rbx, %r8
	rolq	$23, %r11
	rolq	$59, %r8
	rolq	$37, %rdi
	movq	%r9, %rbx
	movq	%r8, %r12
	xorq	%r11, %rbx
	xorq	%rdi, %r12
	xorq	%rbx, %r8
	xorq	%rbx, %rdi
	movq	%r12, %r13
	xorq	%r12, %r9
	xorq	%r11, %r13
	movabsq	$-1376848230519552085, %r11
	leaq	(%r9,%r11), %r14
	movabsq	$-9209400399786843361, %r9
	movabsq	$-6792583489299504353, %r11
	leaq	(%r8,%r9), %r12
	movabsq	$-369815132508846929, %r8
	movabsq	$-3463520432737951897, %r9
	addq	%rdi, %r8
	addq	%r13, %r9
	addq	%r13, %r11
	leaq	(%r14,%r12), %rdi
	leaq	(%r9,%r8), %rbx
	movabsq	$-1087367646907149102, %r9
	addq	%r9, %r8
	leaq	(%r8,%rdi), %r15
	addq	%rdi, %r11
	movabsq	$-5426079245872290139, %r8
	movabsq	$-6657276164713376882, %rdi
	addq	%r8, %r14
	rolq	$19, %r11
	addq	%rdi, %r12
	addq	%rbx, %r14
	rolq	$7, %r15
	addq	%r12, %rbx
	rolq	$31, %r14
	movq	%r11, %r12
	rolq	$53, %rbx
	xorq	%r15, %r12
	movq	%rbx, %r13
	xorq	%r14, %r13
	xorq	%r12, %rbx
	xorq	%r14, %r12
	xorq	%r13, %r11
	xorq	%r15, %r13
	movq	%rbx, 616(%rsp)
	movq	%r11, 664(%rsp)
	movq	%r13, 584(%rsp)
	movq	InternalState+40(%rip), %rbx
	movq	InternalState+32(%rip), %r13
	movq	InternalState+48(%rip), %r14
	movq	InternalState+56(%rip), %r11
	movq	%r12, 744(%rsp)
	leaq	(%rbx,%r13), %r12
	addq	%rcx, %rbx
	addq	%rsi, %r13
	addq	%r14, %r11
	addq	%rdx, %r14
	addq	%r11, %r13
	leaq	(%r11,%rbx), %r15
	movq	InternalState+56(%rip), %r11
	addq	%r12, %r14
	rolq	$11, %r13
	rolq	$23, %r15
	rolq	$37, %r14
	addq	%r10, %r11
	addq	%r12, %r11
	movq	%r15, %r12
	rolq	$59, %r11
	xorq	%r13, %r12
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	addq	584(%rsp), %r12
	addq	664(%rsp), %r11
	xorq	%rbx, %r13
	xorq	%r15, %rbx
	addq	616(%rsp), %rbx
	addq	744(%rsp), %r13
	movq	%r11, 600(%rsp)
	leaq	(%r12,%rbx), %r14
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r14, 520(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%r11, %r12
	addq	%r14, %rbx
	rolq	$7, %r12
	leaq	(%rbx,%r11), %r15
	movq	600(%rsp), %r11
	rolq	$19, %r15
	addq	%r8, %r13
	addq	520(%rsp), %r13
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 520(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 552(%rsp)
	movq	%rbx, 536(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%r11, 568(%rsp)
	movq	InternalState+64(%rip), %rbx
	movq	InternalState+88(%rip), %r11
	addq	InternalState+80(%rip), %r11
	movq	%r13, 520(%rsp)
	leaq	(%r15,%rbx), %r12
	addq	%rsi, %rbx
	leaq	(%r11,%rbx), %r13
	leaq	(%r15,%rcx), %rbx
	addq	%r11, %rbx
	movq	InternalState+80(%rip), %r11
	rolq	$11, %r13
	rolq	$23, %rbx
	addq	%rdx, %r11
	leaq	(%r11,%r12), %r15
	movq	InternalState+88(%rip), %r11
	rolq	$37, %r15
	addq	%r10, %r11
	addq	%r12, %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%r15, %r12
	movq	%r12, 600(%rsp)
	movq	%rbx, %r12
	xorq	600(%rsp), %rbx
	xorq	%r13, %r12
	addq	568(%rsp), %rbx
	xorq	600(%rsp), %r13
	xorq	%r12, %r11
	xorq	%r15, %r12
	addq	536(%rsp), %r12
	addq	520(%rsp), %r13
	addq	552(%rsp), %r11
	leaq	(%r12,%rbx), %r15
	movq	%r11, 632(%rsp)
	addq	%r13, %r11
	addq	%r9, %r12
	addq	%r14, %rbx
	movq	%r15, 600(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	632(%rsp), %r11
	addq	%r8, %r13
	addq	600(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	600(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 600(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	600(%rsp), %r11
	xorq	%r13, %rbx
	xorq	600(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 712(%rsp)
	movq	%rbx, 680(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %rbx
	movq	%r11, 728(%rsp)
	movq	InternalState+120(%rip), %r11
	addq	InternalState+112(%rip), %r11
	movq	%r13, 600(%rsp)
	leaq	(%r15,%rbx), %r12
	addq	%rsi, %rbx
	leaq	(%r11,%rbx), %r13
	leaq	(%r15,%rcx), %rbx
	addq	%r11, %rbx
	movq	InternalState+112(%rip), %r11
	rolq	$11, %r13
	rolq	$23, %rbx
	addq	%rdx, %r11
	leaq	(%r11,%r12), %r15
	movq	InternalState+120(%rip), %r11
	rolq	$37, %r15
	addq	%r10, %r11
	addq	%r12, %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%r15, %r12
	movq	%r12, 632(%rsp)
	movq	%rbx, %r12
	xorq	%r13, %r12
	xorq	632(%rsp), %r13
	addq	600(%rsp), %r13
	xorq	%r12, %r11
	addq	712(%rsp), %r11
	xorq	%r15, %r12
	xorq	632(%rsp), %rbx
	addq	680(%rsp), %r12
	addq	728(%rsp), %rbx
	movq	%r11, 504(%rsp)
	addq	%r13, %r11
	addq	%r8, %r13
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r11, %r12
	movq	%r15, 648(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	504(%rsp), %r11
	addq	648(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 632(%rsp)
	addq	%rdi, %r11
	addq	648(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 648(%rsp)
	movabsq	$-7999569951748836447, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	632(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-4849728007900573903, %r12
	addq	%r11, %r12
	movabsq	$-1568322642145848418, %r11
	addq	%rbx, %r11
	leaq	(%r12,%r13), %rbx
	movq	%r11, 504(%rsp)
	movabsq	$-1642314245251606934, %r11
	addq	648(%rsp), %r11
	addq	504(%rsp), %r11
	movq	%rbx, 632(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	504(%rsp), %r11
	movq	632(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$2553129884740551573, %r11
	addq	648(%rsp), %r11
	addq	632(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 632(%rsp)
	movq	%r13, %r12
	xorq	632(%rsp), %r13
	xorq	%r15, %r12
	xorq	632(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	addq	712(%rsp), %rbx
	movq	%r13, 504(%rsp)
	movq	472(%rsp), %r13
	addq	680(%rsp), %r13
	movq	%r15, %r12
	addq	600(%rsp), %r12
	movq	%r15, 632(%rsp)
	movq	%r11, 488(%rsp)
	movq	%r13, 600(%rsp)
	movq	504(%rsp), %r15
	movq	%r13, %r11
	addq	728(%rsp), %r15
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 712(%rsp)
	addq	%r15, %r11
	movq	%r15, 728(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	600(%rsp), %r11
	movq	712(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	728(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	712(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 728(%rsp)
	movq	%r13, %r12
	xorq	728(%rsp), %r13
	xorq	%r15, %r12
	xorq	728(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 424(%rsp)
	movq	%r11, %rbx
	addq	552(%rsp), %rbx
	movq	%r13, 456(%rsp)
	movq	424(%rsp), %r13
	movq	%r15, %r12
	addq	536(%rsp), %r13
	addq	520(%rsp), %r12
	movq	%r15, 728(%rsp)
	movq	456(%rsp), %r15
	addq	568(%rsp), %r15
	movq	%r11, 440(%rsp)
	movq	%r13, 520(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 712(%rsp)
	movq	%r13, 600(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	520(%rsp), %r11
	movq	600(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	712(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	600(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 520(%rsp)
	movq	%r13, %r12
	xorq	520(%rsp), %r13
	xorq	%r15, %r12
	xorq	520(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r13, 712(%rsp)
	movq	%r15, 520(%rsp)
	movq	%r11, 680(%rsp)
	movq	%r12, 648(%rsp)
	movq	%r15, %r12
	movq	712(%rsp), %r15
	addq	616(%rsp), %r15
	addq	744(%rsp), %r12
	addq	664(%rsp), %rbx
	movq	648(%rsp), %r13
	addq	584(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 600(%rsp)
	movq	%r13, 744(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 616(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	744(%rsp), %r11
	movq	616(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	600(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	616(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 744(%rsp)
	movq	%r13, %r12
	xorq	%r15, %r12
	xorq	744(%rsp), %r13
	movq	%r12, 600(%rsp)
	movq	744(%rsp), %r12
	xorq	600(%rsp), %rbx
	movq	%r13, 616(%rsp)
	xorq	%r15, %r12
	movabsq	$-2292595471992902602, %r13
	addq	%r12, %r13
	movq	600(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$8467826889434979867, %r11
	addq	%r12, %r11
	movabsq	$6028102484886760763, %r12
	addq	616(%rsp), %r12
	movq	%r11, 744(%rsp)
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %rbx
	movq	744(%rsp), %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	addq	%r11, %rbx
	addq	%r12, %r13
	rolq	$7, %rbx
	rolq	$31, %r13
	movq	%rbx, 600(%rsp)
	movabsq	$2699039428325208307, %rbx
	addq	616(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	movq	744(%rsp), %r11
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	600(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	600(%rsp), %rbx
	xorq	%r12, %r11
	movq	%r15, 584(%rsp)
	addq	680(%rsp), %r15
	xorq	%r13, %r12
	movq	%r11, 744(%rsp)
	movq	%r12, 664(%rsp)
	movq	%r12, %r13
	addq	520(%rsp), %r13
	movq	%rbx, 600(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r15, 520(%rsp)
	addq	712(%rsp), %rbx
	movq	%r15, %r11
	addq	648(%rsp), %r12
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r11, %r12
	addq	%r14, %rbx
	addq	%r8, %r13
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	520(%rsp), %r11
	addq	712(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	712(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 712(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	712(%rsp), %r11
	xorq	%r13, %rbx
	xorq	712(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 552(%rsp)
	movq	%rbx, 536(%rsp)
	movq	%rbx, %r12
	addq	440(%rsp), %r15
	addq	424(%rsp), %r12
	movq	%r11, %rbx
	addq	456(%rsp), %rbx
	movq	%r13, 712(%rsp)
	addq	728(%rsp), %r13
	movq	%r11, 568(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 520(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	728(%rsp), %r11
	addq	520(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	xorq	%r12, %rbx
	movq	%rbx, 520(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	520(%rsp), %r11
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 680(%rsp)
	movq	%rbx, 648(%rsp)
	movq	%rbx, %r12
	addq	488(%rsp), %r15
	addq	472(%rsp), %r12
	movq	%r11, %rbx
	addq	504(%rsp), %rbx
	movq	%r13, 520(%rsp)
	addq	632(%rsp), %r13
	movq	%r11, 728(%rsp)
	movq	%r15, 488(%rsp)
	movq	%r15, %r11
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 616(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	488(%rsp), %r11
	addq	616(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 632(%rsp)
	xorq	%r15, %r12
	addq	%rdi, %r11
	addq	616(%rsp), %r11
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 616(%rsp)
	movabsq	$5953845371152580681, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	632(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-7646712092252898442, %r12
	addq	%r11, %r12
	movabsq	$-2842268575306187841, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 504(%rsp)
	movabsq	$-7946738593435294165, %r11
	addq	616(%rsp), %r11
	addq	504(%rsp), %r11
	movq	%rbx, 632(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	504(%rsp), %r11
	movq	632(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$-3751294463443135658, %r11
	addq	616(%rsp), %r11
	addq	632(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 632(%rsp)
	movq	%r13, %r12
	xorq	632(%rsp), %r13
	xorq	%r15, %r12
	xorq	632(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	addq	680(%rsp), %rbx
	movq	%r13, 504(%rsp)
	movq	472(%rsp), %r13
	movq	%r15, %r12
	addq	648(%rsp), %r13
	addq	520(%rsp), %r12
	movq	%r15, 632(%rsp)
	movq	504(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r11, 488(%rsp)
	movq	%r13, 520(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r13, 680(%rsp)
	movq	%r15, 728(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	520(%rsp), %r11
	movq	680(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	728(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	680(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 728(%rsp)
	movq	%r13, %r12
	xorq	728(%rsp), %r13
	xorq	%r15, %r12
	xorq	728(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 424(%rsp)
	movq	%r11, %rbx
	movq	%r11, 440(%rsp)
	movq	%r13, 456(%rsp)
	movq	424(%rsp), %r13
	movq	%r15, %r12
	addq	712(%rsp), %r12
	addq	536(%rsp), %r13
	addq	552(%rsp), %rbx
	movq	%r15, 728(%rsp)
	movq	456(%rsp), %r15
	addq	568(%rsp), %r15
	movq	%r13, 712(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r15, 680(%rsp)
	movq	%r13, 520(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	712(%rsp), %r11
	movq	520(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	680(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	520(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 520(%rsp)
	movq	%r13, %r12
	xorq	520(%rsp), %r13
	xorq	%r15, %r12
	xorq	520(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 648(%rsp)
	movq	%r11, %rbx
	addq	584(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	648(%rsp), %r13
	movq	%r15, 520(%rsp)
	movq	%r15, %r12
	movq	712(%rsp), %r15
	addq	744(%rsp), %r15
	addq	664(%rsp), %r12
	addq	600(%rsp), %r13
	movq	%r11, 680(%rsp)
	movq	%r15, %r11
	addq	%r13, %r11
	movq	%r13, 664(%rsp)
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 600(%rsp)
	movq	%r13, 616(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	664(%rsp), %r11
	movq	616(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	600(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	616(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 744(%rsp)
	movq	%r13, %r12
	xorq	744(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 600(%rsp)
	movq	744(%rsp), %r12
	xorq	600(%rsp), %rbx
	movq	%r13, 616(%rsp)
	movabsq	$-824919486193887165, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	600(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$-1914029582460860148, %r11
	addq	%r12, %r11
	movabsq	$-7632797540959622777, %r12
	addq	616(%rsp), %r12
	movq	%r11, 744(%rsp)
	movabsq	$6609752215332129920, %r11
	addq	%r11, %rbx
	movq	744(%rsp), %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	addq	%r11, %rbx
	addq	%r12, %r13
	rolq	$7, %rbx
	rolq	$31, %r13
	movq	%rbx, 600(%rsp)
	movabsq	$7484883476188376383, %rbx
	addq	616(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	movq	744(%rsp), %r11
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	600(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	600(%rsp), %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	movq	%r15, 552(%rsp)
	movq	%r11, 584(%rsp)
	movq	%r12, 568(%rsp)
	movq	%r12, %r13
	addq	520(%rsp), %r13
	addq	680(%rsp), %r15
	movq	%rbx, 600(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	648(%rsp), %r12
	addq	712(%rsp), %rbx
	movq	%r15, 520(%rsp)
	movq	%r15, %r11
	addq	%r13, %r11
	addq	%r8, %r13
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r11, %r12
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	520(%rsp), %r11
	addq	712(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	712(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 712(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	712(%rsp), %r11
	xorq	%r13, %rbx
	xorq	712(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 664(%rsp)
	movq	%rbx, 536(%rsp)
	movq	%rbx, %r12
	addq	440(%rsp), %r15
	addq	424(%rsp), %r12
	movq	%r11, %rbx
	addq	456(%rsp), %rbx
	movq	%r13, 712(%rsp)
	addq	728(%rsp), %r13
	movq	%r11, 744(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 520(%rsp)
	addq	520(%rsp), %r13
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	728(%rsp), %r11
	rolq	$7, %r12
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 520(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 680(%rsp)
	movq	%rbx, 648(%rsp)
	movq	%rbx, %r12
	addq	488(%rsp), %r15
	addq	472(%rsp), %r12
	movq	%r11, %rbx
	addq	504(%rsp), %rbx
	movq	%r13, 520(%rsp)
	addq	632(%rsp), %r13
	movq	%r11, 728(%rsp)
	movq	%r15, 488(%rsp)
	movq	%r15, %r11
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 616(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	488(%rsp), %r11
	addq	616(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 632(%rsp)
	xorq	%r15, %r12
	addq	%rdi, %r11
	addq	616(%rsp), %r11
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 616(%rsp)
	movabsq	$-1139829817207230181, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	632(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$3054837738180890943, %r12
	addq	%r11, %r12
	movabsq	$2588290990126348949, %r11
	addq	%rbx, %r11
	leaq	(%r12,%r13), %rbx
	movq	%r11, 504(%rsp)
	movabsq	$-938319195649413462, %r11
	addq	616(%rsp), %r11
	addq	504(%rsp), %r11
	movq	%rbx, 632(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	504(%rsp), %r11
	movq	632(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$3257124934342745045, %r11
	addq	616(%rsp), %r11
	addq	632(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 632(%rsp)
	movq	%r13, %r12
	xorq	632(%rsp), %r13
	xorq	%r15, %r12
	xorq	632(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	addq	680(%rsp), %rbx
	movq	%r13, 504(%rsp)
	movq	472(%rsp), %r13
	movq	%r15, %r12
	addq	648(%rsp), %r13
	addq	520(%rsp), %r12
	movq	%r15, 632(%rsp)
	movq	504(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r11, 488(%rsp)
	movq	%r13, 520(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r15, 728(%rsp)
	movq	%r13, 680(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	520(%rsp), %r11
	movq	680(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	728(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	680(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 728(%rsp)
	movq	%r13, %r12
	xorq	%r15, %r12
	xorq	728(%rsp), %r13
	xorq	728(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, 440(%rsp)
	movq	%r11, %rbx
	movq	%r13, 456(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r12, 424(%rsp)
	addq	664(%rsp), %rbx
	movq	%r15, %r12
	movq	424(%rsp), %r13
	addq	712(%rsp), %r12
	addq	536(%rsp), %r13
	movq	456(%rsp), %r15
	addq	744(%rsp), %r15
	movq	%r13, 712(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 520(%rsp)
	movq	%r15, 680(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	712(%rsp), %r11
	movq	520(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	680(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	520(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 520(%rsp)
	movq	%r13, %r12
	xorq	520(%rsp), %r13
	xorq	%r15, %r12
	xorq	520(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 664(%rsp)
	movq	%r11, %rbx
	addq	552(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	664(%rsp), %r13
	movq	%r15, 520(%rsp)
	movq	%r15, %r12
	movq	712(%rsp), %r15
	addq	584(%rsp), %r15
	addq	600(%rsp), %r13
	addq	568(%rsp), %r12
	movq	%r11, 744(%rsp)
	movq	%r15, %r11
	movq	%r13, 648(%rsp)
	movq	%r15, 600(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	leaq	(%r12,%r11), %r15
	movq	%r13, 680(%rsp)
	rolq	$11, %r15
	addq	%rcx, %rbx
	leaq	(%rbx,%r11), %r13
	movq	648(%rsp), %r11
	movq	680(%rsp), %rbx
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	600(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	680(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 648(%rsp)
	movq	%r13, %r12
	xorq	648(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 600(%rsp)
	movq	648(%rsp), %r12
	xorq	600(%rsp), %rbx
	movq	%r13, 680(%rsp)
	movabsq	$-6097248013946911484, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	600(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$3174302594670681997, %r11
	addq	%r12, %r11
	movabsq	$-8739574512844769069, %r12
	addq	680(%rsp), %r12
	movq	%r11, 648(%rsp)
	movabsq	$-496885038275669880, %r11
	addq	%r11, %rbx
	movq	648(%rsp), %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	addq	%r11, %rbx
	addq	%r12, %r13
	rolq	$7, %rbx
	rolq	$31, %r13
	movq	%rbx, 600(%rsp)
	movabsq	$6378106504303230091, %rbx
	addq	680(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	movq	648(%rsp), %r11
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	600(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%r12, %r11
	xorq	%rbx, %r15
	xorq	600(%rsp), %rbx
	xorq	%r13, %r12
	movq	%r15, 616(%rsp)
	movq	%r15, preCompInternalState+16(%rip)
	movq	%r12, 648(%rsp)
	addq	744(%rsp), %r15
	movq	%r12, %r13
	movq	%r12, preCompInternalState+8(%rip)
	addq	520(%rsp), %r13
	movq	%rbx, 600(%rsp)
	movq	%rbx, preCompInternalState+24(%rip)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	664(%rsp), %r12
	addq	712(%rsp), %rbx
	movq	%r15, 520(%rsp)
	movq	%r11, 680(%rsp)
	movq	%r11, preCompInternalState(%rip)
	movq	%r15, %r11
	addq	%r13, %r11
	addq	%r8, %r13
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r11, %r12
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	520(%rsp), %r11
	rolq	$7, %r12
	addq	712(%rsp), %r13
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	712(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 712(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	712(%rsp), %r11
	xorq	%r13, %rbx
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%rbx, %r12
	movq	%r11, 584(%rsp)
	xorq	712(%rsp), %r13
	movq	%r15, 568(%rsp)
	addq	440(%rsp), %r15
	addq	424(%rsp), %r12
	movq	%rbx, 552(%rsp)
	movq	%r11, %rbx
	addq	456(%rsp), %rbx
	movq	%r13, 712(%rsp)
	addq	728(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 728(%rsp)
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r13, %r11
	addq	%r11, %r12
	movq	%r15, 520(%rsp)
	rolq	$7, %r12
	addq	%r14, %rbx
	addq	%r8, %r13
	leaq	(%rbx,%r11), %r15
	movq	728(%rsp), %r11
	addq	520(%rsp), %r13
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	rolq	$31, %r13
	movq	%rbx, 520(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 744(%rsp)
	addq	488(%rsp), %r15
	movq	%rbx, %r12
	movq	%rbx, 664(%rsp)
	addq	472(%rsp), %r12
	movq	%r11, %rbx
	movq	%r13, 520(%rsp)
	addq	504(%rsp), %rbx
	addq	632(%rsp), %r13
	movq	%r11, 728(%rsp)
	movq	%r15, 536(%rsp)
	movq	%r15, %r11
	addq	536(%rsp), %rdi
	addq	%r12, %r9
	leaq	(%rbx,%r12), %r15
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r13, %r8
	addq	%r11, %r9
	addq	%rbx, %r11
	addq	%r15, %rdi
	rolq	$19, %r11
	rolq	$7, %r9
	rolq	$53, %rdi
	movq	%r11, %rbx
	addq	%r15, %r8
	movq	%rdi, %r12
	xorq	%r9, %rbx
	rolq	$31, %r8
	movq	%rbx, %r13
	xorq	%r8, %r12
	xorq	%rbx, %r8
	xorq	%rdi, %r13
	movabsq	$853475092736589577, %rdi
	xorq	%r12, %r11
	addq	%rdi, %r8
	movabsq	$-5486504877919021346, %rdi
	xorq	%r12, %r9
	addq	%rdi, %r11
	movabsq	$-4925106476758491821, %rdi
	movq	%r8, InternalState+96(%rip)
	addq	%r9, %rdi
	movabsq	$1906713845121804688, %r9
	leaq	(%r11,%r8), %rbx
	addq	%r13, %r9
	movq	%rdi, InternalState+112(%rip)
	addq	%rsi, %r8
	movq	%r9, InternalState+120(%rip)
	addq	%rdi, %r9
	addq	%rdx, %rdi
	leaq	(%rdi,%rbx), %r12
	movabsq	$6102157975113963195, %rdi
	movq	%r11, InternalState+104(%rip)
	addq	%r13, %rdi
	addq	%rcx, %r11
	addq	%r9, %r8
	addq	%rbx, %rdi
	addq	%r11, %r9
	rolq	$37, %r12
	rolq	$23, %r9
	rolq	$59, %rdi
	rolq	$11, %r8
	movq	%rdi, %rbx
	movq	%r9, %r11
	xorq	%r12, %rbx
	xorq	%r8, %r11
	xorq	%rbx, %r9
	xorq	%r11, %rdi
	xorq	%rbx, %r8
	xorq	%r12, %r11
	movq	%r9, preCompInternalState+96(%rip)
	movq	%r8, preCompInternalState+104(%rip)
	movq	%rdi, preCompInternalState+112(%rip)
	movq	%r11, preCompInternalState+120(%rip)
	movq	744(%rsp), %rbx
	addq	664(%rsp), %r11
	addq	520(%rsp), %r8
	addq	%rdi, %rbx
	movq	728(%rsp), %rdi
	movq	%rbx, InternalState+72(%rip)
	movq	%r11, InternalState+80(%rip)
	leaq	(%r8,%rbx), %r13
	movq	%r8, InternalState+64(%rip)
	addq	%rsi, %r8
	addq	%r9, %rdi
	leaq	(%r11,%rdi), %r9
	movq	%rdi, InternalState+88(%rip)
	addq	%r9, %r8
	rolq	$11, %r8
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r10, %rdi
	addq	%rbx, %r9
	leaq	(%r11,%r13), %r12
	addq	%r13, %rdi
	rolq	$23, %r9
	rolq	$59, %rdi
	rolq	$37, %r12
	movq	%r9, %r11
	movq	%rdi, %rbx
	movq	%r9, %r13
	movq	568(%rsp), %r9
	xorq	%r12, %rbx
	xorq	%r8, %r11
	xorq	%r11, %rdi
	xorq	%rbx, %r13
	xorq	%r8, %rbx
	addq	%rdi, %r9
	movq	%rbx, preCompInternalState+72(%rip)
	movq	%rdi, preCompInternalState+80(%rip)
	addq	712(%rsp), %rbx
	movq	552(%rsp), %r8
	xorq	%r12, %r11
	movq	584(%rsp), %rdi
	movq	%r11, preCompInternalState+88(%rip)
	addq	%r9, %rcx
	movq	%r9, InternalState+40(%rip)
	movq	%r13, preCompInternalState+64(%rip)
	addq	%r11, %r8
	addq	%r13, %rdi
	leaq	(%rbx,%r9), %r12
	addq	%r8, %rdx
	leaq	(%r8,%rdi), %r11
	movq	%rdi, InternalState+56(%rip)
	addq	%r10, %rdi
	addq	%rbx, %rsi
	addq	%r12, %rdi
	addq	%r12, %rdx
	addq	%r11, %rcx
	rolq	$59, %rdi
	addq	%r11, %rsi
	rolq	$23, %rcx
	rolq	$11, %rsi
	rolq	$37, %rdx
	movq	%rdi, %r9
	movq	%r8, InternalState+48(%rip)
	movq	%rcx, %r8
	xorq	%rsi, %r8
	xorq	%rdx, %r9
	movq	%rbx, InternalState+32(%rip)
	xorq	%r9, %rcx
	xorq	%r9, %rsi
	xorq	%r8, %rdi
	xorq	%r8, %rdx
	movq	%rcx, preCompInternalState+32(%rip)
	movq	%rsi, preCompInternalState+40(%rip)
	addq	680(%rsp), %rcx
	addq	648(%rsp), %rsi
	movq	%rdi, preCompInternalState+48(%rip)
	movq	%rdx, preCompInternalState+56(%rip)
	addq	616(%rsp), %rdi
	addq	600(%rsp), %rdx
	testq	%rax, %rax
	movq	%rsi, InternalState(%rip)
	movq	%rcx, InternalState+24(%rip)
	movq	%rdi, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	je	.L25
	movq	-80(%rsp), %rdi
	addq	696(%rsp), %rdi
	movl	$1, %ecx
	movq	96(%rsp), %r9
	movq	696(%rsp), %r8
	movzbl	(%rdi), %edx
	xorb	InternalState(%rip), %dl
	movb	%dl, InternalState(%rip)
	movb	%dl, 64(%r9,%r8)
	movq	%r9, %r8
	xorl	%edx, %edx
	addq	696(%rsp), %r8
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L27:
	movzbl	InternalState(%rcx), %esi
	xorb	(%rdi,%rdx), %sil
	movb	%sil, InternalState(%rcx)
	movb	%sil, 64(%r8,%rdx)
	leaq	1(%rcx), %rsi
	addq	$33, %rcx
	testb	$31, %sil
	cmovne	%rsi, %rcx
.L43:
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jne	.L27
.L25:
	xorb	$1, InternalState(%rax)
	movabsq	$-8247349341179448980, %rcx
	movabsq	$4195444129992158507, %r14
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %r9
	movabsq	$-1376848230519552085, %r11
	movq	InternalState(%rip), %rdx
	movq	InternalState+8(%rip), %r10
	movabsq	$-3463520432737951897, %rbx
	leaq	(%r9,%rdi), %rax
	addq	%r14, %r9
	leaq	(%r10,%rdx), %r8
	addq	%rcx, %rdx
	leaq	(%rdx,%rax), %rsi
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %r10
	leaq	(%r9,%r8), %r12
	addq	%rax, %r10
	movabsq	$6220970056051541820, %rax
	rolq	$11, %rsi
	addq	%rax, %rdi
	rolq	$23, %r10
	rolq	$59, %r12
	addq	%r8, %rdi
	movq	%r12, %r9
	movq	%r10, %r8
	rolq	$37, %rdi
	xorq	%rsi, %r8
	xorq	%rdi, %r9
	xorq	%r8, %r12
	xorq	%r8, %rdi
	xorq	%r9, %r10
	xorq	%r9, %rsi
	movabsq	$-9209400399786843361, %r9
	addq	%r11, %rsi
	addq	%r9, %r12
	movabsq	$-369815132508846929, %r9
	movabsq	$-1087367646907149102, %r8
	addq	%rdi, %r9
	addq	%r10, %rbx
	leaq	(%r12,%rsi), %rdi
	movabsq	$-6792583489299504353, %r11
	addq	%r9, %rbx
	addq	%r11, %r10
	addq	%r8, %r9
	addq	%rdi, %r9
	addq	%rdi, %r10
	movabsq	$-5426079245872290139, %rdi
	addq	%rdi, %rsi
	rolq	$19, %r10
	rolq	$7, %r9
	leaq	(%rsi,%rbx), %r11
	movabsq	$-6657276164713376882, %rsi
	movq	%r10, %r13
	addq	%rsi, %r12
	addq	%r12, %rbx
	rolq	$31, %r11
	rolq	$53, %rbx
	xorq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%rbx, 696(%rsp)
	movq	InternalState+56(%rip), %rbx
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r13, 680(%rsp)
	movq	%r12, 616(%rsp)
	movq	InternalState+48(%rip), %r12
	movq	%r10, 648(%rsp)
	movq	InternalState+40(%rip), %r13
	movq	InternalState+32(%rip), %r10
	leaq	(%rbx,%r12), %r9
	addq	%rax, %r12
	leaq	0(%r13,%r10), %r11
	addq	%rcx, %r10
	addq	%rdx, %r13
	addq	%r9, %r10
	addq	%r9, %r13
	leaq	(%rbx,%r14), %r9
	rolq	$23, %r13
	rolq	$11, %r10
	addq	%r11, %r12
	addq	%r11, %r9
	movq	%r13, %rbx
	rolq	$37, %r12
	rolq	$59, %r9
	xorq	%r10, %rbx
	movq	%r9, %r11
	xorq	%rbx, %r9
	addq	648(%rsp), %r9
	xorq	%r12, %r11
	xorq	%r12, %rbx
	xorq	%r11, %r10
	addq	680(%rsp), %r10
	xorq	%r13, %r11
	addq	696(%rsp), %r11
	movq	%r9, 520(%rsp)
	movq	616(%rsp), %r9
	movq	%r10, 600(%rsp)
	addq	520(%rsp), %r10
	addq	%rbx, %r9
	movq	600(%rsp), %r12
	leaq	(%r9,%r11), %rbx
	addq	%r8, %r9
	leaq	(%r9,%r10), %r15
	movabsq	$-3329063056561552456, %r9
	addq	%rdi, %r12
	addq	%r9, %r11
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rbx, %r12
	addq	%rsi, %r10
	rolq	$31, %r12
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 664(%rsp)
	movq	InternalState+88(%rip), %rbx
	xorq	%r11, %r13
	movq	InternalState+64(%rip), %r12
	xorq	%r15, %r11
	movq	%r13, 584(%rsp)
	movq	InternalState+80(%rip), %r13
	movq	InternalState+72(%rip), %r15
	movq	%r10, 744(%rsp)
	movq	%r11, 568(%rsp)
	leaq	(%rbx,%r13), %r10
	addq	%rax, %r13
	leaq	(%r15,%r12), %r11
	addq	%rcx, %r12
	addq	%rdx, %r15
	addq	%r10, %r12
	addq	%r10, %r15
	leaq	(%rbx,%r14), %r10
	rolq	$23, %r15
	rolq	$11, %r12
	addq	%r11, %r13
	addq	%r11, %r10
	movq	%r15, %rbx
	rolq	$37, %r13
	xorq	%r12, %rbx
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	addq	584(%rsp), %r10
	xorq	%r13, %r11
	xorq	%r13, %rbx
	xorq	%r11, %r12
	addq	664(%rsp), %r12
	xorq	%r15, %r11
	movq	%r10, 520(%rsp)
	movq	568(%rsp), %r10
	addq	%rbx, %r10
	movq	744(%rsp), %rbx
	addq	%r11, %rbx
	movq	520(%rsp), %r11
	leaq	(%r10,%rbx), %r13
	addq	%r12, %r11
	addq	%r8, %r10
	movq	%r13, 600(%rsp)
	leaq	(%r10,%r11), %r15
	movq	520(%rsp), %r10
	addq	%r9, %rbx
	addq	%rdi, %r12
	addq	600(%rsp), %r12
	leaq	(%rbx,%r11), %r13
	rolq	$7, %r15
	addq	%rsi, %r10
	addq	600(%rsp), %r10
	rolq	$19, %r13
	movq	%r13, %rbx
	rolq	$31, %r12
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 520(%rsp)
	movq	InternalState+120(%rip), %rbx
	xorq	%r11, %r13
	movq	InternalState+96(%rip), %r12
	xorq	%r15, %r11
	movq	%r13, 632(%rsp)
	movq	InternalState+112(%rip), %r13
	movq	InternalState+104(%rip), %r15
	movq	%r10, 600(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%rbx,%r13), %r10
	addq	%rax, %r13
	leaq	(%r15,%r12), %r11
	addq	%rcx, %r12
	addq	%rdx, %r15
	addq	%r10, %r12
	addq	%r10, %r15
	leaq	(%rbx,%r14), %r10
	rolq	$23, %r15
	rolq	$11, %r12
	addq	%r11, %r13
	addq	%r11, %r10
	movq	%r15, %rbx
	rolq	$37, %r13
	rolq	$59, %r10
	xorq	%r12, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	addq	632(%rsp), %r10
	xorq	%r13, %r11
	xorq	%r11, %r12
	addq	520(%rsp), %r12
	xorq	%r13, %rbx
	xorq	%r15, %r11
	movq	%r10, 552(%rsp)
	movq	728(%rsp), %r10
	addq	%rbx, %r10
	movq	600(%rsp), %rbx
	addq	%r11, %rbx
	movq	552(%rsp), %r11
	leaq	(%rbx,%r10), %r15
	addq	%r8, %r10
	addq	%r9, %rbx
	addq	%r12, %r11
	movq	%r15, 712(%rsp)
	addq	%rdi, %r12
	leaq	(%r10,%r11), %r15
	movq	552(%rsp), %r10
	leaq	(%rbx,%r11), %r13
	addq	712(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 712(%rsp)
	movabsq	$-7999569951748836447, %r10
	addq	%r10, %rbx
	xorq	%r11, %r13
	movabsq	$-4849728007900573903, %r10
	leaq	0(%r13,%r10), %r12
	xorq	%r15, %r11
	movabsq	$-1568322642145848418, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-1642314245251606934, %r10
	addq	712(%rsp), %r10
	leaq	(%r12,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r12
	addq	%r15, %r10
	addq	%rax, %r15
	leaq	(%r10,%rbx), %r13
	addq	%r10, %r12
	movabsq	$2553129884740551573, %r10
	addq	712(%rsp), %r10
	addq	%r11, %r15
	rolq	$23, %r12
	rolq	$37, %r15
	rolq	$11, %r13
	addq	%r11, %r10
	movq	%r12, %r11
	rolq	$59, %r10
	xorq	%r13, %r11
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 488(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	632(%rsp), %r11
	movq	%r12, 552(%rsp)
	movq	%r13, %rbx
	addq	600(%rsp), %r12
	addq	520(%rsp), %rbx
	movq	488(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r13, 536(%rsp)
	movq	%r10, 504(%rsp)
	movq	%r12, 600(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r12, 520(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	movq	600(%rsp), %r10
	addq	520(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	520(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 424(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	584(%rsp), %r11
	movq	%r12, 472(%rsp)
	movq	%r13, %rbx
	addq	744(%rsp), %r12
	addq	664(%rsp), %rbx
	movq	424(%rsp), %r15
	addq	568(%rsp), %r15
	movq	%r13, 456(%rsp)
	movq	%r10, 440(%rsp)
	movq	%r12, %r10
	movq	%r12, 520(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%r15, %r10
	addq	%rcx, %rbx
	addq	%rdx, %r11
	movq	%r13, 600(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	movq	520(%rsp), %r10
	addq	%rax, %r15
	addq	600(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	600(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 728(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	648(%rsp), %r11
	movq	%r12, 600(%rsp)
	movq	%r13, %rbx
	addq	696(%rsp), %r12
	addq	680(%rsp), %rbx
	movq	%r13, 520(%rsp)
	movq	728(%rsp), %r13
	addq	616(%rsp), %r13
	movq	%r10, 632(%rsp)
	movq	%r12, %r10
	movq	%r12, 712(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	addq	%rax, %r13
	movq	%r15, 696(%rsp)
	addq	%r13, %r15
	movq	712(%rsp), %r13
	leaq	(%rbx,%r10), %r12
	rolq	$37, %r15
	addq	%r11, %r10
	rolq	$23, %r10
	addq	%r14, %r13
	addq	696(%rsp), %r13
	rolq	$11, %r12
	movq	%r10, %r11
	rolq	$59, %r13
	movq	%r13, %rbx
	xorq	%r15, %rbx
	xorq	%r12, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r11, %r13
	movq	%r10, 712(%rsp)
	movabsq	$-2292595471992902602, %r10
	xorq	%r15, %r11
	leaq	(%rbx,%r10), %r12
	movabsq	$8467826889434979867, %r10
	movabsq	$6028102484886760763, %rbx
	addq	%r13, %r10
	addq	712(%rsp), %rbx
	movabsq	$2699039428325208307, %r13
	movq	%r10, 696(%rsp)
	movabsq	$-5006043190370284386, %r10
	addq	712(%rsp), %r13
	addq	%r10, %r11
	movq	696(%rsp), %r10
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	696(%rsp), %r10
	rolq	$19, %r13
	addq	%rbx, %r12
	rolq	$7, %r15
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 696(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 680(%rsp)
	movq	%r13, 648(%rsp)
	movq	%r11, 616(%rsp)
	movq	%r11, %rbx
	addq	632(%rsp), %r13
	addq	728(%rsp), %rbx
	movq	%r10, %r11
	addq	600(%rsp), %r11
	addq	520(%rsp), %r12
	movq	%r13, %r10
	movq	%r13, 520(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 600(%rsp)
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	addq	600(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	600(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 664(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	456(%rsp), %r12
	movq	%r13, 584(%rsp)
	movq	%r11, 568(%rsp)
	movq	%r11, %rbx
	addq	440(%rsp), %r13
	addq	424(%rsp), %rbx
	movq	%r10, %r11
	addq	472(%rsp), %r11
	movq	%r10, 744(%rsp)
	movq	%r13, %r10
	movq	%r13, 520(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 600(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	520(%rsp), %r10
	addq	600(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	600(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%r12, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 520(%rsp)
	movq	%r13, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	%rbx, %r12
	addq	504(%rsp), %r13
	movq	%r11, %rbx
	movq	%r10, %r11
	addq	488(%rsp), %rbx
	addq	552(%rsp), %r11
	addq	536(%rsp), %r12
	movq	%r10, 600(%rsp)
	movq	%r13, 536(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	movq	%r13, 712(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	536(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 712(%rsp)
	movabsq	$5953845371152580681, %r10
	addq	%r10, %rbx
	xorq	%r11, %r13
	movabsq	$-7646712092252898442, %r10
	leaq	0(%r13,%r10), %r12
	xorq	%r15, %r11
	movabsq	$-2842268575306187841, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-7946738593435294165, %r10
	addq	712(%rsp), %r10
	leaq	(%r12,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r12
	addq	%r15, %r10
	leaq	(%r10,%rbx), %r13
	addq	%r10, %r12
	movabsq	$-3751294463443135658, %r10
	rolq	$23, %r12
	rolq	$11, %r13
	addq	%rax, %r15
	addq	712(%rsp), %r10
	addq	%r11, %r15
	rolq	$37, %r15
	addq	%r11, %r10
	movq	%r12, %r11
	rolq	$59, %r10
	xorq	%r13, %r11
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 488(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	632(%rsp), %r11
	movq	%r12, 552(%rsp)
	movq	%r13, %rbx
	addq	600(%rsp), %r12
	addq	520(%rsp), %rbx
	movq	488(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r10, 504(%rsp)
	movq	%r13, 536(%rsp)
	movq	%r12, 600(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r12, 520(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	movq	600(%rsp), %r10
	addq	520(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	520(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 424(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	movq	424(%rsp), %r15
	movq	%r12, 472(%rsp)
	movq	%r13, %rbx
	addq	664(%rsp), %rbx
	addq	744(%rsp), %r12
	addq	584(%rsp), %r11
	addq	568(%rsp), %r15
	movq	%r13, 456(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	addq	%rdx, %r11
	movq	%r12, 520(%rsp)
	movq	%r13, 600(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	movq	520(%rsp), %r10
	addq	%rax, %r15
	addq	600(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	600(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	movq	%r12, 600(%rsp)
	movq	%r13, %rbx
	addq	696(%rsp), %r12
	addq	680(%rsp), %rbx
	movq	%r11, 728(%rsp)
	movq	%r10, %r11
	addq	648(%rsp), %r11
	movq	%r13, 520(%rsp)
	movq	728(%rsp), %r13
	addq	616(%rsp), %r13
	movq	%r10, 632(%rsp)
	movq	%r12, %r10
	movq	%r12, 712(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	addq	%rax, %r13
	movq	%r15, 696(%rsp)
	addq	%r13, %r15
	movq	712(%rsp), %r13
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	rolq	$23, %r10
	rolq	$11, %r12
	rolq	$37, %r15
	addq	%r14, %r13
	addq	696(%rsp), %r13
	movq	%r10, %r11
	xorq	%r12, %r11
	rolq	$59, %r13
	movq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r15, %r11
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 712(%rsp)
	movabsq	$-824919486193887165, %r10
	leaq	(%rbx,%r10), %r12
	movabsq	$-1914029582460860148, %r10
	movabsq	$-7632797540959622777, %rbx
	addq	%r13, %r10
	addq	712(%rsp), %rbx
	movabsq	$7484883476188376383, %r13
	movq	%r10, 696(%rsp)
	movabsq	$6609752215332129920, %r10
	addq	712(%rsp), %r13
	addq	%r10, %r11
	movq	696(%rsp), %r10
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	696(%rsp), %r10
	rolq	$19, %r13
	addq	%rbx, %r12
	rolq	$7, %r15
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 744(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	520(%rsp), %r12
	movq	%r13, 664(%rsp)
	movq	%r11, 584(%rsp)
	movq	%r11, %rbx
	addq	632(%rsp), %r13
	movq	%r10, %r11
	addq	728(%rsp), %rbx
	addq	600(%rsp), %r11
	movq	%r10, 616(%rsp)
	movq	%r13, 520(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 600(%rsp)
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	addq	600(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	600(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 696(%rsp)
	movq	%rbx, 680(%rsp)
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, %r12
	movq	%r13, 648(%rsp)
	movq	%r11, %rbx
	movq	%r11, 568(%rsp)
	addq	424(%rsp), %rbx
	movq	%r10, %r11
	addq	472(%rsp), %r11
	addq	440(%rsp), %r13
	addq	456(%rsp), %r12
	leaq	(%rbx,%r11), %r15
	addq	%r8, %rbx
	addq	%r9, %r11
	movq	%r13, %r10
	movq	%r13, 520(%rsp)
	movq	%r15, 600(%rsp)
	addq	%r12, %r10
	addq	%rdi, %r12
	addq	600(%rsp), %r12
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	movq	%r13, %rbx
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	600(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 520(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	536(%rsp), %r12
	movq	%r13, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	%r11, %rbx
	addq	504(%rsp), %r13
	addq	488(%rsp), %rbx
	movq	%r10, %r11
	addq	552(%rsp), %r11
	movq	%r10, 600(%rsp)
	movq	%r13, 536(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 712(%rsp)
	leaq	(%r11,%r10), %r13
	movq	536(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 712(%rsp)
	movabsq	$-1139829817207230181, %r10
	addq	%r10, %rbx
	xorq	%r11, %r13
	movabsq	$3054837738180890943, %r10
	leaq	0(%r13,%r10), %r12
	xorq	%r15, %r11
	movabsq	$2588290990126348949, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-938319195649413462, %r10
	addq	712(%rsp), %r10
	leaq	(%r12,%rbx), %r11
	addq	%rcx, %rbx
	addq	%r15, %r10
	leaq	(%r10,%rbx), %r13
	rolq	$11, %r13
	addq	%rdx, %r12
	addq	%rax, %r15
	addq	%r10, %r12
	movabsq	$3257124934342745045, %r10
	addq	712(%rsp), %r10
	rolq	$23, %r12
	addq	%r11, %r15
	rolq	$37, %r15
	addq	%r11, %r10
	movq	%r12, %r11
	rolq	$59, %r10
	xorq	%r13, %r11
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 488(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	632(%rsp), %r11
	movq	%r12, 552(%rsp)
	movq	%r13, %rbx
	addq	600(%rsp), %r12
	addq	520(%rsp), %rbx
	movq	488(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r13, 536(%rsp)
	movq	%r10, 504(%rsp)
	movq	%r12, 600(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r12, 520(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	movq	600(%rsp), %r10
	addq	520(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	520(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r15, %rbx
	xorq	%rbx, %r12
	xorq	%r11, %r10
	xorq	%rbx, %r13
	xorq	%r15, %r11
	movq	%r12, 472(%rsp)
	movq	%r13, %rbx
	addq	696(%rsp), %r12
	addq	680(%rsp), %rbx
	movq	%r11, 424(%rsp)
	movq	%r10, %r11
	addq	648(%rsp), %r11
	movq	424(%rsp), %r15
	addq	568(%rsp), %r15
	movq	%r13, 456(%rsp)
	movq	%r10, 440(%rsp)
	movq	%r12, %r10
	movq	%r12, 520(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r13, 600(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	movq	520(%rsp), %r10
	addq	600(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	600(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 648(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	664(%rsp), %r11
	movq	%r12, 712(%rsp)
	addq	616(%rsp), %r12
	movq	%r13, %rbx
	movq	%r13, 696(%rsp)
	addq	744(%rsp), %rbx
	movq	648(%rsp), %r13
	addq	584(%rsp), %r13
	movq	%r10, 680(%rsp)
	movq	%r12, %r10
	movq	%r12, 600(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r15, 520(%rsp)
	rolq	$11, %r12
	addq	%r11, %r10
	addq	%rax, %r13
	addq	%r13, %r15
	movq	600(%rsp), %r13
	rolq	$23, %r10
	rolq	$37, %r15
	movq	%r10, %r11
	xorq	%r12, %r11
	addq	%r14, %r13
	addq	520(%rsp), %r13
	rolq	$59, %r13
	movq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r15, %r11
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 600(%rsp)
	movabsq	$-6097248013946911484, %r10
	leaq	(%rbx,%r10), %r12
	movabsq	$3174302594670681997, %r10
	movabsq	$-8739574512844769069, %rbx
	addq	%r13, %r10
	addq	600(%rsp), %rbx
	movabsq	$6378106504303230091, %r13
	movq	%r10, 520(%rsp)
	movabsq	$-496885038275669880, %r10
	addq	600(%rsp), %r13
	addq	%r10, %r11
	movq	520(%rsp), %r10
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	520(%rsp), %r10
	rolq	$19, %r13
	addq	%rbx, %r12
	rolq	$7, %r15
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %r11
	xorq	%r12, %rbx
	movq	%r10, 600(%rsp)
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 520(%rsp)
	movq	%rbx, preCompInternalState+8(%rip)
	movq	%r13, 632(%rsp)
	movq	%rbx, %r12
	movq	%r13, preCompInternalState+16(%rip)
	movq	%r11, 728(%rsp)
	movq	%r11, %rbx
	addq	680(%rsp), %r13
	addq	648(%rsp), %rbx
	movq	%r11, preCompInternalState+24(%rip)
	movq	%r10, %r11
	addq	712(%rsp), %r11
	addq	696(%rsp), %r12
	movq	%r10, preCompInternalState(%rip)
	movq	%r13, 696(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	movq	%r13, 712(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	696(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %r11
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	xorq	%r15, %r11
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r12, %r11
	xorq	%r12, %rbx
	movq	%r11, 744(%rsp)
	movq	%r11, %r12
	xorq	%rbx, %r13
	xorq	%r15, %rbx
	addq	456(%rsp), %r12
	movq	%r13, 664(%rsp)
	movq	%rbx, 584(%rsp)
	movq	%r10, %r11
	addq	440(%rsp), %r13
	addq	424(%rsp), %rbx
	addq	472(%rsp), %r11
	movq	%r10, 616(%rsp)
	leaq	(%r12,%r13), %r10
	leaq	(%rbx,%r11), %r15
	addq	%r8, %rbx
	addq	%r9, %r11
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %rbx
	leaq	(%r12,%rdi), %r11
	addq	712(%rsp), %r11
	rolq	$7, %r15
	rolq	$19, %rbx
	movq	%rbx, %r10
	rolq	$31, %r11
	addq	%rsi, %r13
	addq	712(%rsp), %r13
	xorq	%r15, %r10
	rolq	$53, %r13
	movq	%r13, %r12
	xorq	%r10, %r13
	xorq	%r11, %r10
	xorq	%r11, %r12
	movq	%r13, 712(%rsp)
	movq	712(%rsp), %r11
	xorq	%r12, %rbx
	xorq	%r15, %r12
	addq	552(%rsp), %r11
	movq	%r12, 648(%rsp)
	movq	%rbx, %r13
	movq	%r10, %r12
	addq	504(%rsp), %r13
	addq	536(%rsp), %r12
	movq	%rbx, 680(%rsp)
	movq	648(%rsp), %rbx
	addq	488(%rsp), %rbx
	movq	%r10, 696(%rsp)
	addq	%r11, %r9
	leaq	0(%r13,%r12), %r10
	addq	%r13, %rsi
	addq	%r12, %rdi
	addq	%rbx, %r8
	leaq	(%r11,%rbx), %r15
	addq	%r10, %r8
	addq	%r9, %r10
	rolq	$19, %r10
	rolq	$7, %r8
	addq	%r15, %rsi
	movq	%r10, %r9
	rolq	$53, %rsi
	addq	%r15, %rdi
	xorq	%r8, %r9
	rolq	$31, %rdi
	movq	%rsi, %r11
	movq	%r9, %rbx
	xorq	%rdi, %r11
	xorq	%r9, %rdi
	xorq	%rsi, %rbx
	movabsq	$853475092736589577, %rsi
	xorq	%r11, %r10
	addq	%rsi, %rdi
	movabsq	$-5486504877919021346, %rsi
	xorq	%r11, %r8
	leaq	(%r10,%rsi), %r9
	movabsq	$-4925106476758491821, %rsi
	movq	%rdi, InternalState+96(%rip)
	addq	%r8, %rsi
	movabsq	$1906713845121804688, %r8
	leaq	(%r9,%rdi), %r10
	addq	%rbx, %r8
	addq	%rcx, %rdi
	movq	%r9, InternalState+104(%rip)
	movq	%rsi, InternalState+112(%rip)
	addq	%rdx, %r9
	movq	%r8, InternalState+120(%rip)
	addq	%rsi, %r8
	addq	%rax, %rsi
	addq	%r8, %rdi
	leaq	(%r8,%r9), %r13
	leaq	(%rsi,%r10), %r8
	movabsq	$6102157975113963195, %rsi
	rolq	$11, %rdi
	addq	%rbx, %rsi
	rolq	$23, %r13
	rolq	$37, %r8
	addq	%r10, %rsi
	movq	%r13, %r12
	rolq	$59, %rsi
	xorq	%rdi, %r12
	movq	%rsi, %r9
	xorq	%r12, %rsi
	xorq	%r8, %r12
	xorq	%r8, %r9
	movq	%rsi, preCompInternalState+112(%rip)
	movq	%r12, preCompInternalState+120(%rip)
	xorq	%r9, %r13
	xorq	%r9, %rdi
	addq	680(%rsp), %rsi
	addq	648(%rsp), %r12
	movq	%r13, preCompInternalState+96(%rip)
	movq	%rdi, preCompInternalState+104(%rip)
	addq	712(%rsp), %r13
	addq	696(%rsp), %rdi
	leaq	(%rsi,%rdx), %r9
	movq	%rsi, InternalState+72(%rip)
	leaq	(%r12,%rax), %r15
	movq	%r12, InternalState+80(%rip)
	leaq	(%r12,%r13), %r8
	leaq	0(%r13,%r14), %rbx
	movq	%r13, InternalState+88(%rip)
	leaq	(%rdi,%rsi), %r11
	leaq	(%rdi,%rcx), %r10
	movq	%rdi, InternalState+64(%rip)
	addq	%r8, %r10
	addq	%r11, %rbx
	addq	%r9, %r8
	rolq	$59, %rbx
	addq	%r11, %r15
	rolq	$23, %r8
	rolq	$11, %r10
	rolq	$37, %r15
	movq	%rbx, %r11
	movq	%r8, %r9
	xorq	%r15, %r11
	xorq	%r10, %r9
	xorq	%r11, %r8
	xorq	%r10, %r11
	movq	%r9, %r10
	xorq	%r15, %r9
	movq	%r8, preCompInternalState+64(%rip)
	xorq	%rbx, %r10
	addq	616(%rsp), %r8
	movq	%r11, preCompInternalState+72(%rip)
	movq	%r10, preCompInternalState+80(%rip)
	addq	744(%rsp), %r11
	addq	664(%rsp), %r10
	movq	%r9, preCompInternalState+88(%rip)
	addq	584(%rsp), %r9
	movq	%r8, InternalState+56(%rip)
	addq	%r11, %rcx
	movq	%r11, InternalState+32(%rip)
	leaq	(%r11,%r10), %r15
	addq	%r10, %rdx
	movq	%r10, InternalState+40(%rip)
	leaq	(%r9,%r8), %rbx
	addq	%r14, %r8
	addq	%r9, %rax
	addq	%r15, %r8
	addq	%r15, %rax
	movq	%r9, InternalState+48(%rip)
	addq	%rbx, %rdx
	rolq	$59, %r8
	addq	%rbx, %rcx
	rolq	$23, %rdx
	rolq	$11, %rcx
	rolq	$37, %rax
	movq	%r8, %r10
	movq	%rdx, %r9
	xorq	%rax, %r10
	xorq	%rcx, %r9
	xorq	%r9, %r8
	xorq	%r10, %rcx
	xorq	%r10, %rdx
	movq	%rcx, preCompInternalState+40(%rip)
	movq	%r8, preCompInternalState+48(%rip)
	xorq	%r9, %rax
	addq	520(%rsp), %rcx
	addq	632(%rsp), %r8
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%r8, InternalState+8(%rip)
	addq	728(%rsp), %rax
	addq	600(%rsp), %rdx
	addq	%rcx, 776(%rsp)
	addq	%r8, 784(%rsp)
	addq	%rax, 792(%rsp)
	addq	%rdx, 800(%rsp)
	addq	%rdi, 808(%rsp)
	addq	%rsi, 816(%rsp)
	movq	%rax, InternalState+16(%rip)
	movq	%rdx, InternalState+24(%rip)
	addq	%r12, 824(%rsp)
	addq	%r13, 832(%rsp)
.L23:
	movq	96(%rsp), %rax
	addq	(%rsp), %rax
	vmovdqa	776(%rsp), %ymm0
	movq	-96(%rsp), %rsi
	vmovdqu	%xmm0, 64(%rax)
	vextractf128	$0x1, %ymm0, 80(%rax)
	vmovdqa	808(%rsp), %ymm0
	vmovdqu	%xmm0, 96(%rax)
	vextractf128	$0x1, %ymm0, 112(%rax)
	movq	(%rsp), %rax
	subq	$-128, %rax
	movq	%rax, (%rsi)
	xorl	%eax, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	vmovdqa	904(%rsp), %ymm0
	salq	$3, %rdx
	addq	$1, 520(%rsp)
	movq	%rdx, 408(%rsp)
	movq	520(%rsp), %rcx
	movabsq	$-8247349341179448980, %rsi
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %r9
	movq	InternalState+24(%rip), %r12
	xorq	InternalState(%rip), %rcx
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%r9), %rdx
	movq	InternalState+8(%rip), %r8
	vmovdqa	936(%rsp), %ymm0
	leaq	(%rdx,%rsi), %rdi
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rcx,%r8), %r11
	vmovdqa	968(%rsp), %ymm0
	leaq	(%rdi,%rcx), %r10
	movabsq	$7667772426219706969, %rcx
	leaq	(%r8,%rcx), %rdi
	vmovdqa	%ymm0, InternalState+64(%rip)
	rolq	$11, %r10
	vmovdqa	1000(%rsp), %ymm0
	leaq	(%rdi,%rdx), %r8
	movabsq	$6220970056051541820, %rdx
	leaq	(%r9,%rdx), %rdi
	vmovdqa	%ymm0, InternalState+96(%rip)
	rolq	$23, %r8
	leaq	(%rdi,%r11), %rbx
	leaq	(%r12,%r13), %rdi
	addq	%rdi, %r11
	rolq	$37, %rbx
	movq	%r10, %rdi
	rolq	$59, %r11
	xorq	%r8, %rdi
	movq	%r11, %r9
	xorq	%rbx, %r9
	movq	%r9, %r12
	xorq	%r10, %r9
	xorq	%r8, %r12
	movabsq	$-1376848230519552085, %r8
	leaq	(%r9,%r8), %r10
	movq	%rdi, %r9
	movabsq	$-9209400399786843361, %r8
	xorq	%r11, %r9
	xorq	%rbx, %rdi
	movabsq	$-1087367646907149102, %r11
	addq	%r8, %r9
	movabsq	$-369815132508846929, %r8
	movabsq	$-5426079245872290139, %rbx
	addq	%r8, %rdi
	movabsq	$-3463520432737951897, %r8
	leaq	(%r10,%r9), %r14
	addq	%r12, %r8
	addq	%rdi, %r8
	addq	%r11, %rdi
	leaq	(%rdi,%r14), %r15
	movabsq	$-6792583489299504353, %rdi
	addq	%r12, %rdi
	movabsq	$-6657276164713376882, %r12
	addq	%rdi, %r14
	leaq	(%r10,%rbx), %rdi
	rolq	$7, %r15
	rolq	$19, %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r9,%r12), %rdi
	movq	%r14, %r9
	xorq	%r15, %r9
	addq	%r8, %rdi
	rolq	$31, %r10
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 552(%rsp)
	movq	InternalState+56(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+48(%rip), %rdi
	movq	%r14, 488(%rsp)
	movq	%r8, 472(%rsp)
	movq	InternalState+40(%rip), %r14
	movq	InternalState+32(%rip), %r8
	movq	%r9, 504(%rsp)
	leaq	(%r14,%r8), %r9
	addq	%rsi, %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r14,%rcx), %r8
	leaq	(%rdi,%r8), %r15
	movq	InternalState+48(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r15
	addq	%rdx, %rdi
	leaq	(%rdi,%r9), %r14
	movq	InternalState+56(%rip), %rdi
	rolq	$37, %r14
	addq	%r13, %rdi
	addq	%r9, %rdi
	movq	%r15, %r9
	rolq	$59, %rdi
	xorq	%r10, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r14, %r9
	xorq	%r14, %r8
	addq	472(%rsp), %r9
	addq	488(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	552(%rsp), %r8
	addq	504(%rsp), %r10
	movq	%rdi, 632(%rsp)
	leaq	(%r8,%r9), %r14
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r14, 600(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%rdi, %r9
	addq	%r14, %r8
	rolq	$7, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	600(%rsp), %r10
	rolq	$19, %r15
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	movq	%r15, %r8
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	600(%rsp), %rdi
	movq	%r8, 728(%rsp)
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	728(%rsp), %rdi
	xorq	%r10, %r8
	xorq	728(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 584(%rsp)
	movq	%r8, 568(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%rdi, 648(%rsp)
	movq	InternalState+64(%rip), %r8
	movq	InternalState+88(%rip), %rdi
	addq	InternalState+80(%rip), %rdi
	movq	%r10, 728(%rsp)
	leaq	(%r15,%r8), %r9
	addq	%rsi, %r8
	leaq	(%r8,%rdi), %r10
	leaq	(%r15,%rcx), %r8
	addq	%rdi, %r8
	movq	InternalState+80(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r8
	addq	%rdx, %rdi
	leaq	(%rdi,%r9), %r15
	movq	InternalState+88(%rip), %rdi
	rolq	$37, %r15
	addq	%r13, %rdi
	addq	%r9, %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r15, %r9
	movq	%r9, 600(%rsp)
	movq	%r8, %r9
	xorq	600(%rsp), %r8
	xorq	%r10, %r9
	addq	648(%rsp), %r8
	xorq	600(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r15, %r9
	addq	568(%rsp), %r9
	addq	728(%rsp), %r10
	addq	584(%rsp), %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	movq	%rdi, 632(%rsp)
	addq	%r10, %rdi
	movq	%r15, 600(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	600(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	xorq	%r9, %r8
	movq	%r8, 600(%rsp)
	movq	%rdi, %r8
	xorq	600(%rsp), %rdi
	xorq	%r10, %r8
	xorq	600(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 680(%rsp)
	movq	%r8, 616(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %r8
	movq	%rdi, 696(%rsp)
	movq	InternalState+120(%rip), %rdi
	addq	InternalState+112(%rip), %rdi
	movq	%r10, 600(%rsp)
	leaq	(%r15,%r8), %r9
	addq	%rsi, %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rcx), %r8
	addq	%rdi, %r8
	movq	InternalState+112(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r8
	addq	%rdx, %rdi
	leaq	(%rdi,%r9), %r15
	movq	InternalState+120(%rip), %rdi
	rolq	$37, %r15
	addq	%r13, %rdi
	addq	%r9, %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r15, %r9
	movq	%r9, 632(%rsp)
	movq	%r8, %r9
	xorq	632(%rsp), %r8
	xorq	%r10, %r9
	addq	696(%rsp), %r8
	xorq	632(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r15, %r9
	addq	616(%rsp), %r9
	addq	600(%rsp), %r10
	addq	680(%rsp), %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	movq	%rdi, 744(%rsp)
	addq	%r10, %rdi
	movq	%r15, 712(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	712(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r9, 632(%rsp)
	addq	%rdi, %r10
	movq	744(%rsp), %rdi
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%r12, %rdi
	addq	712(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	movq	%rdi, 712(%rsp)
	xorq	%r10, %r8
	movabsq	$-7999569951748836447, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	xorq	632(%rsp), %r8
	xorq	%r15, %rdi
	movabsq	$-4849728007900573903, %r9
	addq	%rdi, %r9
	movabsq	$-1568322642145848418, %rdi
	addq	%r8, %rdi
	leaq	(%r10,%r9), %r8
	movq	%rdi, 744(%rsp)
	movabsq	$-1642314245251606934, %rdi
	addq	712(%rsp), %rdi
	addq	744(%rsp), %rdi
	movq	%r8, 632(%rsp)
	leaq	(%r10,%rsi), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r9,%rcx), %r8
	leaq	(%r8,%rdi), %r10
	movq	744(%rsp), %rdi
	movq	632(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movabsq	$2553129884740551573, %rdi
	addq	712(%rsp), %rdi
	addq	632(%rsp), %rdi
	rolq	$37, %r8
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 712(%rsp)
	movq	%r10, %r9
	xorq	712(%rsp), %r10
	xorq	%r15, %r9
	xorq	712(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 536(%rsp)
	movq	%rdi, %r8
	addq	680(%rsp), %r8
	movq	%r10, 744(%rsp)
	movq	536(%rsp), %r10
	addq	616(%rsp), %r10
	movq	%r15, %r9
	addq	600(%rsp), %r9
	movq	%r15, 712(%rsp)
	movq	%rdi, 664(%rsp)
	movq	%r10, 600(%rsp)
	movq	744(%rsp), %r15
	movq	%r10, %rdi
	addq	696(%rsp), %r15
	leaq	(%r9,%r8), %r10
	movq	%r10, 696(%rsp)
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r15, 632(%rsp)
	leaq	(%r8,%rdi), %r10
	leaq	(%r9,%rdi), %r15
	movq	600(%rsp), %rdi
	movq	696(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	632(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	696(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 632(%rsp)
	movq	%r10, %r9
	xorq	632(%rsp), %r10
	xorq	%r15, %r9
	xorq	632(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 680(%rsp)
	movq	%rdi, %r8
	addq	584(%rsp), %r8
	movq	%r10, 616(%rsp)
	movq	680(%rsp), %r10
	movq	%r15, %r9
	addq	568(%rsp), %r10
	addq	728(%rsp), %r9
	movq	%r15, 632(%rsp)
	movq	616(%rsp), %r15
	addq	648(%rsp), %r15
	movq	%rdi, 696(%rsp)
	movq	%r10, 600(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	addq	%r15, %rdi
	movq	%r15, 728(%rsp)
	movq	%r10, 648(%rsp)
	leaq	(%rdi,%r9), %r15
	leaq	(%rdi,%r8), %r10
	movq	600(%rsp), %rdi
	movq	648(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	728(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	648(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 728(%rsp)
	movq	%r10, %r9
	xorq	%r15, %r9
	xorq	728(%rsp), %r10
	xorq	728(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%rdi, %r8
	movq	%r10, 456(%rsp)
	movq	%r15, 728(%rsp)
	movq	%rdi, 440(%rsp)
	movq	%r9, 424(%rsp)
	movq	%r15, %r9
	movq	456(%rsp), %r15
	addq	552(%rsp), %r15
	addq	504(%rsp), %r9
	addq	488(%rsp), %r8
	movq	424(%rsp), %r10
	addq	472(%rsp), %r10
	movq	%r15, %rdi
	movq	%r15, 600(%rsp)
	movq	%r10, 584(%rsp)
	addq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 648(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	584(%rsp), %rdi
	movq	648(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	600(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	648(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 584(%rsp)
	movq	%r10, %r9
	xorq	584(%rsp), %r10
	xorq	%r15, %r9
	movq	%r9, 600(%rsp)
	movq	584(%rsp), %r9
	xorq	600(%rsp), %r8
	movq	%r10, 648(%rsp)
	movabsq	$-2292595471992902602, %r10
	xorq	%r15, %r9
	addq	%r9, %r10
	movq	600(%rsp), %r9
	xorq	%rdi, %r9
	movabsq	$8467826889434979867, %rdi
	addq	%r9, %rdi
	movabsq	$6028102484886760763, %r9
	addq	648(%rsp), %r9
	movq	%rdi, 584(%rsp)
	movabsq	$-5006043190370284386, %rdi
	addq	%rdi, %r8
	movq	584(%rsp), %rdi
	addq	%r8, %r9
	addq	%r11, %r8
	addq	%r10, %rdi
	addq	%rdi, %r8
	rolq	$7, %r8
	movq	%r8, 600(%rsp)
	movabsq	$2699039428325208307, %r8
	addq	648(%rsp), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	leaq	(%rdi,%r9), %r10
	movq	584(%rsp), %rdi
	rolq	$19, %r15
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	600(%rsp), %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %r8
	xorq	%r15, %r9
	xorq	%r8, %r15
	xorq	600(%rsp), %r8
	xorq	%r9, %rdi
	movq	%r15, 568(%rsp)
	addq	440(%rsp), %r15
	xorq	%r10, %r9
	movq	%rdi, 648(%rsp)
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	addq	728(%rsp), %r10
	movq	%r8, 600(%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%r15, 552(%rsp)
	addq	456(%rsp), %r8
	movq	%r15, %rdi
	addq	424(%rsp), %r9
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%rdi, %r9
	movq	%r15, 728(%rsp)
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	728(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	552(%rsp), %rdi
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	728(%rsp), %rdi
	movq	%r8, 728(%rsp)
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	728(%rsp), %rdi
	xorq	%r10, %r8
	xorq	728(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 504(%rsp)
	movq	%r8, 456(%rsp)
	movq	%r8, %r9
	addq	696(%rsp), %r15
	addq	680(%rsp), %r9
	movq	616(%rsp), %r8
	movq	%r10, 728(%rsp)
	addq	632(%rsp), %r10
	movq	%rdi, 552(%rsp)
	addq	%rdi, %r8
	movq	%r15, 696(%rsp)
	movq	%r15, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r15, 632(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	632(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	696(%rsp), %rdi
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	movq	%r8, 632(%rsp)
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	632(%rsp), %rdi
	xorq	%r10, %r8
	xorq	632(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 680(%rsp)
	movq	%r8, 616(%rsp)
	movq	%r8, %r9
	addq	664(%rsp), %r15
	addq	536(%rsp), %r9
	movq	%rdi, %r8
	addq	744(%rsp), %r8
	movq	%r10, 632(%rsp)
	addq	712(%rsp), %r10
	movq	%rdi, 696(%rsp)
	movq	%r15, 664(%rsp)
	movq	%r15, %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r15, 744(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	744(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r9, 712(%rsp)
	addq	%rdi, %r10
	movq	664(%rsp), %rdi
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%r12, %rdi
	addq	744(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	movq	%rdi, 744(%rsp)
	xorq	%r10, %r8
	movabsq	$5953845371152580681, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	xorq	712(%rsp), %r8
	xorq	%r15, %rdi
	movabsq	$-7646712092252898442, %r9
	addq	%rdi, %r9
	movabsq	$-2842268575306187841, %rdi
	addq	%r8, %rdi
	leaq	(%r10,%r9), %r8
	movq	%rdi, 664(%rsp)
	movabsq	$-7946738593435294165, %rdi
	addq	744(%rsp), %rdi
	addq	664(%rsp), %rdi
	movq	%r8, 712(%rsp)
	leaq	(%r10,%rsi), %r8
	leaq	(%rdi,%r8), %r15
	leaq	(%r9,%rcx), %r8
	leaq	(%rdi,%r8), %r10
	movq	664(%rsp), %rdi
	movq	712(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movabsq	$-3751294463443135658, %rdi
	addq	744(%rsp), %rdi
	addq	712(%rsp), %rdi
	rolq	$37, %r8
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 712(%rsp)
	movq	%r10, %r9
	xorq	712(%rsp), %r10
	xorq	%r15, %r9
	xorq	712(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 664(%rsp)
	movq	%rdi, %r8
	addq	680(%rsp), %r8
	movq	%r10, 744(%rsp)
	movq	664(%rsp), %r10
	movq	%r15, %r9
	addq	616(%rsp), %r10
	addq	632(%rsp), %r9
	movq	%r15, 712(%rsp)
	movq	744(%rsp), %r15
	addq	696(%rsp), %r15
	movq	%rdi, 472(%rsp)
	movq	%r10, 632(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 680(%rsp)
	movq	%r15, 696(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r15
	movq	632(%rsp), %rdi
	movq	680(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	680(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 632(%rsp)
	movq	%r15, %r9
	xorq	632(%rsp), %r15
	xorq	%r10, %r9
	xorq	632(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 616(%rsp)
	movq	%rdi, %r8
	addq	504(%rsp), %r8
	movq	%r15, %r9
	addq	728(%rsp), %r9
	movq	%r15, 632(%rsp)
	movq	%r10, 488(%rsp)
	movq	616(%rsp), %r10
	addq	456(%rsp), %r10
	movq	488(%rsp), %r15
	addq	552(%rsp), %r15
	movq	%rdi, 696(%rsp)
	movq	%r10, 728(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r15, 680(%rsp)
	movq	%r10, 552(%rsp)
	leaq	(%rdi,%r9), %r15
	leaq	(%rdi,%r8), %r10
	movq	728(%rsp), %rdi
	movq	552(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	680(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	552(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 728(%rsp)
	movq	%r10, %r9
	xorq	%r15, %r9
	xorq	728(%rsp), %r10
	xorq	728(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 504(%rsp)
	movq	%rdi, %r8
	addq	568(%rsp), %r8
	movq	%rdi, 536(%rsp)
	movq	%r10, 680(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %r9
	movq	680(%rsp), %r15
	addq	648(%rsp), %r15
	addq	584(%rsp), %r9
	movq	504(%rsp), %r10
	addq	600(%rsp), %r10
	movq	%r15, %rdi
	addq	%r10, %rdi
	movq	%r10, 584(%rsp)
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r15, 600(%rsp)
	movq	%r10, 648(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	584(%rsp), %rdi
	movq	648(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	600(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	648(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 584(%rsp)
	movq	%r10, %r9
	xorq	584(%rsp), %r10
	xorq	%r15, %r9
	movq	%r9, 600(%rsp)
	movq	584(%rsp), %r9
	xorq	600(%rsp), %r8
	movq	%r10, 648(%rsp)
	movabsq	$-824919486193887165, %r10
	xorq	%r15, %r9
	addq	%r9, %r10
	movq	600(%rsp), %r9
	xorq	%rdi, %r9
	movabsq	$-1914029582460860148, %rdi
	addq	%r9, %rdi
	movabsq	$-7632797540959622777, %r9
	addq	648(%rsp), %r9
	movq	%rdi, 584(%rsp)
	movabsq	$6609752215332129920, %rdi
	addq	%rdi, %r8
	movq	584(%rsp), %rdi
	addq	%r8, %r9
	addq	%r11, %r8
	addq	%r10, %rdi
	addq	%rdi, %r8
	rolq	$7, %r8
	movq	%r8, 600(%rsp)
	movabsq	$7484883476188376383, %r8
	addq	648(%rsp), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	leaq	(%rdi,%r9), %r10
	movq	584(%rsp), %rdi
	rolq	$19, %r15
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	600(%rsp), %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %r8
	xorq	%r15, %r9
	xorq	%r8, %r15
	xorq	600(%rsp), %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	movq	%r15, 440(%rsp)
	addq	536(%rsp), %r15
	movq	%r9, 552(%rsp)
	movq	%r9, %r10
	addq	728(%rsp), %r10
	movq	%rdi, 568(%rsp)
	movq	%r8, 600(%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	addq	504(%rsp), %r9
	addq	680(%rsp), %r8
	movq	%r15, %rdi
	movq	%r15, 648(%rsp)
	addq	%r10, %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%rdi, %r9
	movq	%r15, 728(%rsp)
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	728(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	648(%rsp), %rdi
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	728(%rsp), %rdi
	movq	%r8, 728(%rsp)
	movq	%r10, %r8
	xorq	728(%rsp), %r10
	rolq	$53, %rdi
	xorq	%rdi, %r8
	xorq	728(%rsp), %rdi
	movq	%r10, 728(%rsp)
	xorq	%r8, %r15
	xorq	%r9, %r8
	addq	632(%rsp), %r10
	movq	%r15, 504(%rsp)
	movq	%r8, 648(%rsp)
	movq	%r8, %r9
	addq	696(%rsp), %r15
	addq	616(%rsp), %r9
	movq	%rdi, %r8
	addq	488(%rsp), %r8
	movq	%rdi, 680(%rsp)
	movq	%r15, 632(%rsp)
	movq	%r15, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%r14, %r8
	addq	%r11, %r9
	movq	%r15, 696(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	696(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r9, %r8
	movq	%r8, 632(%rsp)
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	632(%rsp), %rdi
	xorq	%r10, %r8
	xorq	632(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 616(%rsp)
	movq	%r8, 536(%rsp)
	movq	%r8, %r9
	addq	472(%rsp), %r15
	addq	664(%rsp), %r9
	movq	%rdi, %r8
	addq	744(%rsp), %r8
	movq	%r10, 632(%rsp)
	addq	712(%rsp), %r10
	movq	%rdi, 696(%rsp)
	movq	%r15, 584(%rsp)
	movq	%r15, %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r15, 744(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	744(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r9, 712(%rsp)
	addq	%rdi, %r10
	movq	584(%rsp), %rdi
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%r12, %rdi
	addq	744(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 744(%rsp)
	movabsq	$-1139829817207230181, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	xorq	712(%rsp), %r8
	xorq	%r15, %rdi
	movabsq	$3054837738180890943, %r9
	addq	%rdi, %r9
	movabsq	$2588290990126348949, %rdi
	addq	%r8, %rdi
	leaq	(%r10,%r9), %r8
	movq	%rdi, 664(%rsp)
	movabsq	$-938319195649413462, %rdi
	addq	744(%rsp), %rdi
	addq	664(%rsp), %rdi
	movq	%r8, 712(%rsp)
	leaq	(%r10,%rsi), %r8
	leaq	(%rdi,%r8), %r15
	leaq	(%r9,%rcx), %r8
	leaq	(%rdi,%r8), %r10
	movq	664(%rsp), %rdi
	movq	712(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movabsq	$3257124934342745045, %rdi
	addq	744(%rsp), %rdi
	addq	712(%rsp), %rdi
	rolq	$37, %r8
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 712(%rsp)
	movq	%r15, %r9
	xorq	712(%rsp), %r15
	xorq	%r10, %r9
	xorq	712(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 456(%rsp)
	movq	%rdi, %r8
	addq	616(%rsp), %r8
	movq	%r15, 712(%rsp)
	movq	%r15, %r9
	addq	632(%rsp), %r9
	movq	%r10, 664(%rsp)
	movq	664(%rsp), %r15
	addq	696(%rsp), %r15
	movq	456(%rsp), %r10
	addq	536(%rsp), %r10
	movq	%rdi, 584(%rsp)
	movq	%r15, %rdi
	movq	%r15, 632(%rsp)
	addq	%r10, %rdi
	movq	%r10, 616(%rsp)
	leaq	(%r9,%r8), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 696(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	616(%rsp), %rdi
	movq	696(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	632(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	696(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 632(%rsp)
	movq	%r10, %r9
	xorq	632(%rsp), %r10
	xorq	%r15, %r9
	xorq	632(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%rdi, 744(%rsp)
	movq	%rdi, %r8
	movq	%r10, 616(%rsp)
	movq	%r15, 632(%rsp)
	movq	%r9, 472(%rsp)
	movq	%r15, %r9
	movq	616(%rsp), %r15
	addq	680(%rsp), %r15
	addq	728(%rsp), %r9
	addq	504(%rsp), %r8
	movq	472(%rsp), %r10
	addq	648(%rsp), %r10
	movq	%r15, %rdi
	movq	%r15, 728(%rsp)
	addq	%r10, %rdi
	movq	%r10, 648(%rsp)
	leaq	(%r9,%r8), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 696(%rsp)
	leaq	(%rdi,%r9), %r15
	leaq	(%rdi,%r8), %r10
	movq	648(%rsp), %rdi
	movq	696(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	728(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	696(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 728(%rsp)
	movq	%r10, %r9
	xorq	%r15, %r9
	xorq	728(%rsp), %r10
	xorq	728(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 488(%rsp)
	movq	%rdi, %r8
	addq	440(%rsp), %r8
	movq	%rdi, 504(%rsp)
	movq	%r10, 536(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %r9
	movq	536(%rsp), %r15
	addq	568(%rsp), %r15
	addq	552(%rsp), %r9
	movq	488(%rsp), %r10
	addq	600(%rsp), %r10
	movq	%r15, %rdi
	movq	%r15, 600(%rsp)
	addq	%r10, %rdi
	movq	%r10, 680(%rsp)
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 696(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	680(%rsp), %rdi
	movq	696(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	600(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	696(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 680(%rsp)
	movq	%r10, %r9
	xorq	680(%rsp), %r10
	xorq	%r15, %r9
	movq	%r9, 600(%rsp)
	movq	680(%rsp), %r9
	xorq	600(%rsp), %r8
	movq	%r10, 696(%rsp)
	movabsq	$-6097248013946911484, %r10
	xorq	%r15, %r9
	addq	%r9, %r10
	movq	600(%rsp), %r9
	xorq	%rdi, %r9
	movabsq	$3174302594670681997, %rdi
	addq	%r9, %rdi
	movabsq	$-8739574512844769069, %r9
	addq	696(%rsp), %r9
	movq	%rdi, 680(%rsp)
	movabsq	$-496885038275669880, %rdi
	addq	%rdi, %r8
	movq	680(%rsp), %rdi
	addq	%r8, %r9
	addq	%r11, %r8
	addq	%r10, %rdi
	addq	%rdi, %r8
	rolq	$7, %r8
	movq	%r8, 600(%rsp)
	movabsq	$6378106504303230091, %r8
	addq	696(%rsp), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	leaq	(%rdi,%r9), %r10
	movq	680(%rsp), %rdi
	rolq	$19, %r15
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	600(%rsp), %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %r8
	xorq	%r15, %r9
	xorq	%r8, %r15
	xorq	600(%rsp), %r8
	xorq	%r9, %rdi
	movq	%r15, 648(%rsp)
	xorq	%r10, %r9
	movq	%r15, preCompInternalState+16(%rip)
	addq	504(%rsp), %r15
	movq	%r9, 680(%rsp)
	movq	%r9, %r10
	movq	%r9, preCompInternalState+8(%rip)
	addq	728(%rsp), %r10
	movq	%r8, 600(%rsp)
	movq	%r8, preCompInternalState+24(%rip)
	movq	%r8, %r9
	movq	%rdi, %r8
	addq	488(%rsp), %r9
	addq	536(%rsp), %r8
	movq	%rdi, 696(%rsp)
	movq	%rdi, preCompInternalState(%rip)
	movq	%r15, %rdi
	addq	%r10, %rdi
	movq	%r15, 568(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r11, %r9
	addq	%r14, %r8
	addq	%rdi, %r9
	rolq	$7, %r9
	movq	%r15, 552(%rsp)
	leaq	(%r8,%rdi), %r15
	movq	%r9, 728(%rsp)
	movq	552(%rsp), %r9
	leaq	(%r10,%rbx), %rdi
	movq	728(%rsp), %r10
	rolq	$19, %r15
	addq	%rdi, %r9
	movq	568(%rsp), %rdi
	rolq	$31, %r9
	xorq	%r15, %r10
	addq	%r12, %rdi
	addq	552(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r9, %r8
	movq	%rdi, 552(%rsp)
	movq	%r10, 536(%rsp)
	xorq	%r8, %r15
	xorq	728(%rsp), %r8
	addq	632(%rsp), %r10
	movq	%r15, 504(%rsp)
	addq	744(%rsp), %r15
	movq	%r8, 728(%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	addq	472(%rsp), %r9
	addq	616(%rsp), %r8
	movq	%r15, %rdi
	addq	%r10, %rdi
	movq	%r15, 744(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r11, %r9
	addq	%r14, %r8
	addq	%rdi, %r9
	rolq	$7, %r9
	movq	%r15, 616(%rsp)
	leaq	(%r8,%rdi), %r15
	movq	%r9, 632(%rsp)
	movq	616(%rsp), %r9
	leaq	(%r10,%rbx), %rdi
	movq	632(%rsp), %r10
	rolq	$19, %r15
	addq	%rdi, %r9
	movq	744(%rsp), %rdi
	rolq	$31, %r9
	xorq	%r15, %r10
	addq	%r12, %rdi
	addq	616(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r9, %r8
	movq	%rdi, 616(%rsp)
	movq	%r10, 744(%rsp)
	xorq	%r8, %r15
	xorq	632(%rsp), %r8
	movq	%r15, 568(%rsp)
	movq	%r10, %r15
	movq	568(%rsp), %rdi
	addq	712(%rsp), %r15
	addq	584(%rsp), %rdi
	movq	%r8, 632(%rsp)
	movq	%r8, %r9
	movq	616(%rsp), %r8
	addq	456(%rsp), %r9
	addq	664(%rsp), %r8
	movq	%rdi, 584(%rsp)
	addq	%r15, %rbx
	addq	%r15, %rdi
	leaq	(%r8,%r9), %r10
	addq	%r11, %r9
	addq	%r14, %r8
	movq	%r10, 712(%rsp)
	addq	712(%rsp), %rbx
	leaq	(%r9,%rdi), %r10
	leaq	(%r8,%rdi), %r9
	movq	584(%rsp), %rdi
	rolq	$7, %r10
	rolq	$19, %r9
	rolq	$31, %rbx
	addq	%r12, %rdi
	addq	712(%rsp), %rdi
	movq	%r9, %r8
	xorq	%r10, %r8
	movq	%r8, %r14
	xorq	%rbx, %r8
	rolq	$53, %rdi
	movq	%rdi, %r11
	xorq	%rdi, %r14
	movabsq	$853475092736589577, %rdi
	xorq	%rbx, %r11
	addq	%rdi, %r8
	movq	%r11, %rdi
	movq	%r8, InternalState+96(%rip)
	xorq	%r9, %rdi
	movabsq	$-5486504877919021346, %r9
	leaq	(%rdi,%r9), %rbx
	movq	%r11, %r9
	movabsq	$-4925106476758491821, %rdi
	xorq	%r10, %r9
	leaq	(%r9,%rdi), %r10
	movabsq	$1906713845121804688, %rdi
	leaq	(%r8,%rbx), %r12
	addq	%r14, %rdi
	addq	%rsi, %r8
	movq	%rbx, InternalState+104(%rip)
	movq	%r10, InternalState+112(%rip)
	movq	%rdi, InternalState+120(%rip)
	addq	%r10, %rdi
	leaq	(%rdi,%r8), %r11
	leaq	(%rbx,%rcx), %r8
	leaq	(%rdi,%r8), %r9
	leaq	(%r10,%rdx), %rdi
	rolq	$11, %r11
	leaq	(%rdi,%r12), %rbx
	movabsq	$6102157975113963195, %rdi
	rolq	$23, %r9
	addq	%r14, %rdi
	movq	%r9, %r8
	addq	%r12, %rdi
	rolq	$37, %rbx
	xorq	%r11, %r8
	rolq	$59, %rdi
	movq	%r9, %r12
	movq	%r8, %r9
	movq	%rdi, %r10
	xorq	%rbx, %r8
	xorq	%rdi, %r9
	xorq	%rbx, %r10
	movq	%r8, preCompInternalState+120(%rip)
	movq	616(%rsp), %rdi
	xorq	%r10, %r12
	addq	632(%rsp), %r8
	xorq	%r11, %r10
	movq	%r10, preCompInternalState+104(%rip)
	movq	%r9, preCompInternalState+112(%rip)
	addq	744(%rsp), %r10
	addq	568(%rsp), %r9
	addq	%r12, %rdi
	movq	%r12, preCompInternalState+96(%rip)
	movq	%rdi, InternalState+88(%rip)
	leaq	(%r8,%rdi), %r11
	movq	%r8, InternalState+80(%rip)
	leaq	(%r10,%r9), %r12
	movq	%r10, InternalState+64(%rip)
	addq	%rsi, %r10
	leaq	(%r11,%r10), %rbx
	movq	%r9, InternalState+72(%rip)
	addq	%rcx, %r9
	rolq	$11, %rbx
	addq	%r11, %r9
	addq	%rdx, %r8
	addq	%r13, %rdi
	rolq	$23, %r9
	leaq	(%r8,%r12), %r11
	addq	%r12, %rdi
	movq	%r9, %r8
	movq	%r9, %r12
	rolq	$59, %rdi
	rolq	$37, %r11
	xorq	%rbx, %r8
	movq	%rdi, %r10
	movq	%r8, %r9
	xorq	%r11, %r8
	xorq	%r11, %r10
	xorq	%rdi, %r9
	movq	%r8, preCompInternalState+88(%rip)
	xorq	%r10, %r12
	addq	728(%rsp), %r8
	xorq	%rbx, %r10
	movq	552(%rsp), %rdi
	movq	%r10, preCompInternalState+72(%rip)
	movq	%r9, preCompInternalState+80(%rip)
	addq	536(%rsp), %r10
	addq	504(%rsp), %r9
	movq	%r12, preCompInternalState+64(%rip)
	addq	%r12, %rdi
	addq	%r8, %rdx
	movq	%r8, InternalState+48(%rip)
	leaq	(%r8,%rdi), %r11
	movq	%rdi, InternalState+56(%rip)
	addq	%r13, %rdi
	addq	%r10, %rsi
	movq	%r10, InternalState+32(%rip)
	leaq	(%r10,%r9), %rbx
	addq	%r9, %rcx
	leaq	(%r11,%rsi), %r10
	addq	%r11, %rcx
	movq	%r9, InternalState+40(%rip)
	rolq	$23, %rcx
	leaq	(%rdx,%rbx), %r8
	addq	%rbx, %rdi
	rolq	$11, %r10
	rolq	$59, %rdi
	movq	%rcx, %rdx
	rolq	$37, %r8
	xorq	%r10, %rdx
	movq	%rdi, %rsi
	xorq	%r8, %rsi
	movq	%rcx, %r11
	movq	%rdx, %rcx
	xorq	%rsi, %r11
	xorq	%rdi, %rcx
	xorq	%r8, %rdx
	xorq	%r10, %rsi
	movq	%rcx, preCompInternalState+48(%rip)
	movq	%rdx, preCompInternalState+56(%rip)
	movq	%rsi, preCompInternalState+40(%rip)
	addq	680(%rsp), %rsi
	addq	648(%rsp), %rcx
	addq	600(%rsp), %rdx
	movq	%r11, preCompInternalState+32(%rip)
	movq	%rsi, InternalState(%rip)
	movq	%rcx, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	696(%rsp), %rdx
	addq	%r11, %rdx
	testq	%rax, %rax
	movq	%rdx, InternalState+24(%rip)
	je	.L14
	movq	-88(%rsp), %rdi
	addq	408(%rsp), %rdi
	xorl	%ecx, %ecx
	movzbl	(%rdi), %edx
	xorb	%dl, InternalState(%rip)
	movl	$1, %edx
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L16:
	movzbl	(%rdi,%rcx), %esi
	xorb	%sil, InternalState(%rdx)
	leaq	1(%rdx), %rsi
	addq	$33, %rdx
	testb	$31, %sil
	cmovne	%rsi, %rdx
.L44:
	addq	$1, %rcx
	cmpq	%rax, %rcx
	jne	.L16
.L14:
	xorb	$1, InternalState(%rax)
	movabsq	$-8247349341179448980, %rcx
	movabsq	$4195444129992158507, %r12
	movq	InternalState+16(%rip), %r8
	movq	InternalState+24(%rip), %rbx
	movq	InternalState(%rip), %rdx
	movq	InternalState+8(%rip), %rsi
	leaq	(%rbx,%r8), %rax
	leaq	(%rsi,%rdx), %r10
	addq	%rcx, %rdx
	leaq	(%rdx,%rax), %r9
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %rsi
	leaq	(%rsi,%rax), %rdi
	movabsq	$6220970056051541820, %rax
	rolq	$11, %r9
	leaq	(%r8,%rax), %rsi
	rolq	$23, %rdi
	leaq	(%rsi,%r10), %r11
	leaq	(%rbx,%r12), %rsi
	addq	%rsi, %r10
	rolq	$37, %r11
	movq	%rdi, %rsi
	rolq	$59, %r10
	xorq	%r9, %rsi
	movq	%r10, %r8
	xorq	%r11, %r8
	movq	%r8, %rbx
	xorq	%r9, %r8
	xorq	%rdi, %rbx
	movabsq	$-1376848230519552085, %rdi
	leaq	(%r8,%rdi), %r9
	movq	%rsi, %r8
	movabsq	$-9209400399786843361, %rdi
	xorq	%r10, %r8
	xorq	%r11, %rsi
	movabsq	$-5426079245872290139, %r11
	addq	%rdi, %r8
	movabsq	$-369815132508846929, %rdi
	addq	%rsi, %rdi
	movabsq	$-3463520432737951897, %rsi
	leaq	(%r9,%r8), %r13
	addq	%rbx, %rsi
	leaq	(%rsi,%rdi), %r15
	movabsq	$-1087367646907149102, %rsi
	addq	%rsi, %rdi
	leaq	(%rdi,%r13), %r14
	movabsq	$-6792583489299504353, %rdi
	addq	%rbx, %rdi
	movabsq	$-6657276164713376882, %rbx
	addq	%rdi, %r13
	leaq	(%r9,%r11), %rdi
	rolq	$7, %r14
	rolq	$19, %r13
	leaq	(%rdi,%r15), %r10
	leaq	(%r8,%rbx), %rdi
	movq	%r13, %r9
	xorq	%r14, %r9
	addq	%r15, %rdi
	rolq	$31, %r10
	movq	InternalState+48(%rip), %r15
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 648(%rsp)
	movq	InternalState+56(%rip), %rdi
	xorq	%r8, %r13
	xorq	%r14, %r8
	movq	%r9, 616(%rsp)
	movq	%r13, 744(%rsp)
	movq	%r8, 664(%rsp)
	movq	InternalState+40(%rip), %r13
	movq	InternalState+32(%rip), %r8
	addq	%r15, %rdi
	leaq	0(%r13,%r8), %r9
	addq	%rcx, %r8
	leaq	(%rdi,%r8), %r10
	leaq	0(%r13,%rdx), %r8
	leaq	(%rdi,%r8), %r14
	leaq	(%r15,%rax), %rdi
	rolq	$11, %r10
	leaq	(%rdi,%r9), %r13
	movq	InternalState+56(%rip), %rdi
	rolq	$23, %r14
	rolq	$37, %r13
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$59, %rdi
	xorq	%r10, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r13, %r9
	xorq	%r13, %r8
	addq	664(%rsp), %r9
	addq	744(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r14, %r8
	addq	648(%rsp), %r8
	addq	616(%rsp), %r10
	movq	%rdi, 600(%rsp)
	leaq	(%r9,%r8), %r13
	addq	%rsi, %r9
	addq	%r10, %rdi
	movq	%r13, 632(%rsp)
	movabsq	$-3329063056561552456, %r13
	leaq	(%r9,%rdi), %r15
	addq	%r13, %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	632(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	addq	%rdi, %r10
	movq	600(%rsp), %rdi
	movq	%r14, %r9
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%rbx, %rdi
	addq	632(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 584(%rsp)
	movq	InternalState+88(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+80(%rip), %rdi
	movq	%r14, 552(%rsp)
	movq	%r8, 536(%rsp)
	movq	InternalState+72(%rip), %r14
	movq	InternalState+64(%rip), %r8
	movq	%r9, 568(%rsp)
	leaq	(%r14,%r8), %r9
	addq	%rcx, %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r14,%rdx), %r8
	leaq	(%rdi,%r8), %r15
	movq	InternalState+80(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r15
	addq	%rax, %rdi
	leaq	(%rdi,%r9), %r14
	movq	InternalState+88(%rip), %rdi
	rolq	$37, %r14
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	%r15, %r9
	xorq	%r10, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	addq	552(%rsp), %rdi
	xorq	%r14, %r8
	xorq	%r14, %r9
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	568(%rsp), %r10
	movq	%rdi, 632(%rsp)
	addq	536(%rsp), %r9
	addq	584(%rsp), %r8
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r14
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 600(%rsp)
	movq	InternalState+120(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+112(%rip), %rdi
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	InternalState+104(%rip), %r14
	movq	InternalState+96(%rip), %r8
	movq	%r9, 632(%rsp)
	leaq	(%r14,%r8), %r9
	addq	%rcx, %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r14,%rdx), %r8
	leaq	(%rdi,%r8), %r15
	movq	InternalState+112(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r15
	addq	%rax, %rdi
	leaq	(%rdi,%r9), %r14
	movq	InternalState+120(%rip), %rdi
	rolq	$37, %r14
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	%r15, %r9
	rolq	$59, %rdi
	xorq	%r10, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r14, %r9
	xorq	%r14, %r8
	addq	712(%rsp), %r9
	addq	728(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	600(%rsp), %r8
	addq	632(%rsp), %r10
	movq	%rdi, 680(%rsp)
	leaq	(%r8,%r9), %r15
	addq	%rsi, %r9
	addq	%r13, %r8
	addq	%r10, %rdi
	movq	%r15, 696(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	696(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	680(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r8
	movq	%rdi, 696(%rsp)
	xorq	%r10, %r9
	movabsq	$-7999569951748836447, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	movabsq	$-4849728007900573903, %r9
	xorq	%r14, %rdi
	xorq	%r15, %r8
	addq	%rdi, %r9
	movabsq	$-1568322642145848418, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$-1642314245251606934, %rdi
	addq	696(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 680(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	680(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$2553129884740551573, %rdi
	addq	696(%rsp), %rdi
	addq	680(%rsp), %rdi
	rolq	$37, %r15
	movq	%r10, %r9
	xorq	%r14, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 504(%rsp)
	movq	%r14, 488(%rsp)
	movq	%rdi, 472(%rsp)
	addq	600(%rsp), %r10
	addq	728(%rsp), %r8
	movq	%r9, 456(%rsp)
	movq	%r14, %r9
	addq	632(%rsp), %r9
	movq	456(%rsp), %r15
	addq	712(%rsp), %r15
	movq	%r10, 600(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r10, 632(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	632(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	600(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 440(%rsp)
	movq	%rdi, %r8
	addq	584(%rsp), %r10
	addq	552(%rsp), %r8
	movq	%r9, 392(%rsp)
	movq	%r14, %r9
	addq	568(%rsp), %r9
	movq	392(%rsp), %r15
	addq	536(%rsp), %r15
	movq	%r14, 424(%rsp)
	movq	%rdi, 408(%rsp)
	movq	%r10, %rdi
	movq	%r10, 632(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r14, 600(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	600(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	632(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	600(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 712(%rsp)
	movq	712(%rsp), %r15
	xorq	%r8, %r10
	xorq	%r8, %r14
	addq	664(%rsp), %r15
	movq	%r10, 600(%rsp)
	addq	648(%rsp), %r10
	movq	%r14, %r9
	movq	%rdi, %r8
	addq	616(%rsp), %r9
	addq	744(%rsp), %r8
	movq	%rdi, 728(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r10, %rdi
	movq	%r10, 696(%rsp)
	addq	%r15, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rcx, %r9
	leaq	(%r9,%rdi), %r14
	movq	%r10, 680(%rsp)
	rolq	$11, %r14
	addq	%rdx, %r8
	leaq	(%r8,%rdi), %r10
	movq	680(%rsp), %r8
	leaq	(%r15,%rax), %rdi
	movq	680(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 696(%rsp)
	movabsq	$-2292595471992902602, %rdi
	xorq	%r8, %r9
	xorq	696(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 680(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	696(%rsp), %r9
	movabsq	$8467826889434979867, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$6028102484886760763, %r9
	addq	680(%rsp), %r9
	movq	%rdi, 648(%rsp)
	movabsq	$-5006043190370284386, %rdi
	addq	%rdi, %r8
	movq	648(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$2699039428325208307, %r8
	addq	680(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	648(%rsp), %rdi
	rolq	$19, %r14
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 648(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	632(%rsp), %r10
	movq	%r14, 616(%rsp)
	movq	%r8, 744(%rsp)
	movq	%r8, %r9
	addq	728(%rsp), %r14
	movq	%rdi, %r8
	addq	712(%rsp), %r9
	addq	600(%rsp), %r8
	movq	%rdi, 680(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	424(%rsp), %r10
	movq	%r14, 568(%rsp)
	movq	%r8, 552(%rsp)
	movq	%r8, %r9
	addq	408(%rsp), %r14
	addq	392(%rsp), %r9
	movq	%rdi, %r8
	addq	440(%rsp), %r8
	movq	%rdi, 664(%rsp)
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 632(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	488(%rsp), %r10
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	%r8, %r9
	addq	472(%rsp), %r14
	addq	456(%rsp), %r9
	movq	%rdi, %r8
	addq	504(%rsp), %r8
	movq	%rdi, 600(%rsp)
	movq	%r14, 536(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 696(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	696(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	536(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 696(%rsp)
	movabsq	$5953845371152580681, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	movabsq	$-7646712092252898442, %r9
	xorq	%r14, %rdi
	xorq	%r15, %r8
	addq	%rdi, %r9
	movabsq	$-2842268575306187841, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$-7946738593435294165, %rdi
	addq	696(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 536(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	536(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$-3751294463443135658, %rdi
	movq	%r10, %r9
	rolq	$37, %r15
	addq	696(%rsp), %rdi
	xorq	%r14, %r9
	addq	536(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 472(%rsp)
	movq	472(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 536(%rsp)
	addq	728(%rsp), %r8
	movq	%r14, %r9
	addq	600(%rsp), %r10
	addq	632(%rsp), %r9
	addq	712(%rsp), %r15
	movq	%rdi, 488(%rsp)
	movq	%r14, 504(%rsp)
	movq	%r10, 600(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 632(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	632(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	600(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 456(%rsp)
	addq	664(%rsp), %r10
	addq	568(%rsp), %r8
	movq	%r9, 408(%rsp)
	movq	%r14, %r9
	addq	584(%rsp), %r9
	movq	408(%rsp), %r15
	addq	552(%rsp), %r15
	movq	%r14, 440(%rsp)
	movq	%rdi, 424(%rsp)
	movq	%r10, %rdi
	movq	%r10, 632(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r14, 600(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	600(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	632(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	600(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 712(%rsp)
	movq	712(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 600(%rsp)
	addq	616(%rsp), %r8
	movq	%r14, %r9
	addq	680(%rsp), %r10
	addq	648(%rsp), %r9
	addq	744(%rsp), %r15
	movq	%rdi, 728(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r10, 696(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%r15, %rdi
	addq	%rdx, %r8
	addq	%rcx, %r9
	movq	%r10, 680(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	680(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	680(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 696(%rsp)
	movabsq	$-824919486193887165, %rdi
	xorq	%r8, %r9
	xorq	%r9, %r10
	xorq	%r14, %r9
	xorq	696(%rsp), %r8
	movq	%r10, 680(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	696(%rsp), %r9
	movabsq	$-1914029582460860148, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-7632797540959622777, %r9
	addq	680(%rsp), %r9
	movq	%rdi, 648(%rsp)
	movabsq	$6609752215332129920, %rdi
	addq	%rdi, %r8
	movq	648(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$7484883476188376383, %r8
	addq	680(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	648(%rsp), %rdi
	rolq	$19, %r14
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 680(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r9, 648(%rsp)
	movq	%r14, 616(%rsp)
	movq	%r8, 744(%rsp)
	movq	%r8, %r9
	addq	728(%rsp), %r14
	addq	712(%rsp), %r9
	movq	%rdi, %r8
	addq	600(%rsp), %r8
	addq	632(%rsp), %r10
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	440(%rsp), %r10
	movq	%r14, 568(%rsp)
	movq	%r8, 552(%rsp)
	movq	%r8, %r9
	addq	424(%rsp), %r14
	addq	408(%rsp), %r9
	movq	%rdi, %r8
	addq	456(%rsp), %r8
	movq	%rdi, 664(%rsp)
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 632(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	504(%rsp), %r10
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	%r8, %r9
	addq	488(%rsp), %r14
	addq	472(%rsp), %r9
	movq	%rdi, %r8
	addq	536(%rsp), %r8
	movq	%rdi, 600(%rsp)
	movq	%r14, 504(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 696(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	696(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	504(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 696(%rsp)
	movabsq	$-1139829817207230181, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	movabsq	$3054837738180890943, %r9
	xorq	%r14, %rdi
	xorq	%r15, %r8
	addq	%rdi, %r9
	movabsq	$2588290990126348949, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$-938319195649413462, %rdi
	addq	696(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 536(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	536(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$3257124934342745045, %rdi
	addq	696(%rsp), %rdi
	addq	536(%rsp), %rdi
	rolq	$37, %r15
	movq	%r10, %r9
	xorq	%r14, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 472(%rsp)
	movq	472(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 536(%rsp)
	movq	%r14, %r9
	addq	632(%rsp), %r9
	addq	728(%rsp), %r8
	addq	600(%rsp), %r10
	addq	712(%rsp), %r15
	movq	%rdi, 488(%rsp)
	movq	%r14, 504(%rsp)
	movq	%r10, 600(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 632(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	632(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	600(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 408(%rsp)
	movq	408(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 456(%rsp)
	addq	568(%rsp), %r8
	movq	%r14, %r9
	addq	664(%rsp), %r10
	addq	584(%rsp), %r9
	addq	552(%rsp), %r15
	movq	%r14, 440(%rsp)
	movq	%rdi, 424(%rsp)
	leaq	(%r9,%r8), %r14
	movq	%r10, %rdi
	addq	%rcx, %r9
	addq	%r15, %rdi
	addq	%rdx, %r8
	movq	%r10, 632(%rsp)
	movq	%r14, 600(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	600(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	632(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	600(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 600(%rsp)
	movq	%rdi, %r8
	addq	680(%rsp), %r10
	movq	%r9, 712(%rsp)
	movq	%r14, %r9
	addq	616(%rsp), %r8
	addq	648(%rsp), %r9
	movq	712(%rsp), %r15
	addq	744(%rsp), %r15
	movq	%rdi, 728(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r10, 696(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rdx, %r8
	addq	%rcx, %r9
	addq	%r15, %rdi
	movq	%r10, 680(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	680(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	680(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 696(%rsp)
	movabsq	$-6097248013946911484, %rdi
	xorq	%r8, %r9
	xorq	696(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 680(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	696(%rsp), %r9
	movabsq	$3174302594670681997, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-8739574512844769069, %r9
	addq	680(%rsp), %r9
	movq	%rdi, 648(%rsp)
	movabsq	$-496885038275669880, %rdi
	addq	%rdi, %r8
	movq	648(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$6378106504303230091, %r8
	rolq	$7, %r15
	addq	680(%rsp), %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	648(%rsp), %rdi
	rolq	$19, %r14
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 680(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	632(%rsp), %r10
	movq	%r14, 648(%rsp)
	movq	%r8, 664(%rsp)
	movq	%r8, %r9
	addq	728(%rsp), %r14
	addq	712(%rsp), %r9
	movq	%rdi, %r8
	addq	600(%rsp), %r8
	movq	%rdi, 744(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	440(%rsp), %r10
	movq	%r14, 568(%rsp)
	movq	%r8, 552(%rsp)
	movq	%r8, %r9
	addq	424(%rsp), %r14
	movq	%rdi, %r8
	addq	408(%rsp), %r9
	addq	456(%rsp), %r8
	movq	%rdi, 616(%rsp)
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 600(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	600(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	600(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 632(%rsp)
	movq	%rdi, 600(%rsp)
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	%r9, %r14
	movq	728(%rsp), %r15
	addq	504(%rsp), %r14
	movq	%r8, %r9
	addq	488(%rsp), %r15
	addq	472(%rsp), %r9
	movq	%rdi, %r8
	addq	536(%rsp), %r8
	addq	%r14, %r11
	leaq	(%r15,%r14), %rdi
	addq	%r9, %rsi
	movq	728(%rsp), %r14
	leaq	(%r8,%r9), %r10
	addq	%r13, %r8
	addq	%rdi, %r8
	movq	%r10, 696(%rsp)
	leaq	(%rsi,%rdi), %r10
	addq	696(%rsp), %r11
	leaq	(%r15,%rbx), %rsi
	addq	696(%rsp), %rsi
	rolq	$19, %r8
	rolq	$7, %r10
	movq	%r8, %rdi
	movq	712(%rsp), %r15
	rolq	$31, %r11
	rolq	$53, %rsi
	xorq	%r10, %rdi
	movq	%rsi, %r9
	movq	%rdi, %r13
	xorq	%r11, %rdi
	xorq	%rsi, %r13
	xorq	%r11, %r9
	movabsq	$853475092736589577, %rsi
	leaq	(%rdi,%rsi), %r11
	movq	%r9, %rdi
	movabsq	$-5486504877919021346, %rsi
	xorq	%r8, %rdi
	xorq	%r10, %r9
	leaq	(%rdi,%rsi), %r8
	movabsq	$-4925106476758491821, %rdi
	movabsq	$1906713845121804688, %rsi
	leaq	(%r9,%rdi), %r10
	addq	%r13, %rsi
	leaq	(%r11,%rcx), %rdi
	leaq	(%r11,%r8), %rbx
	addq	%r10, %rsi
	leaq	(%rsi,%rdi), %r9
	leaq	(%r8,%rdx), %rdi
	leaq	(%rsi,%rdi), %r11
	leaq	(%r10,%rax), %rsi
	rolq	$11, %r9
	leaq	(%rsi,%rbx), %r10
	movabsq	$6102157975113963195, %rsi
	rolq	$23, %r11
	addq	%r13, %rsi
	movq	%r11, %r8
	movq	632(%rsp), %r13
	addq	%rbx, %rsi
	rolq	$37, %r10
	xorq	%r9, %r8
	rolq	$59, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r10, %r8
	xorq	%r10, %rdi
	addq	%rsi, %r14
	addq	%r8, %r15
	xorq	%rdi, %r9
	xorq	%r11, %rdi
	addq	600(%rsp), %rdi
	addq	%r9, %r13
	leaq	0(%r13,%r14), %r8
	movq	%rdi, 600(%rsp)
	movq	%rdi, %rsi
	leaq	0(%r13,%rcx), %rdi
	addq	%r15, %rsi
	leaq	(%rsi,%rdi), %r10
	leaq	(%r14,%rdx), %rdi
	leaq	(%rsi,%rdi), %rbx
	leaq	(%r15,%rax), %rsi
	rolq	$11, %r10
	movq	%r10, %rdi
	leaq	(%rsi,%r8), %r11
	movq	600(%rsp), %rsi
	rolq	$23, %rbx
	movq	%rbx, %r9
	rolq	$37, %r11
	xorq	%r10, %r9
	movq	568(%rsp), %r10
	addq	%r12, %rsi
	addq	%r8, %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%r11, %r8
	xorq	%r8, %rdi
	addq	584(%rsp), %rdi
	xorq	%r9, %rsi
	xorq	%r11, %r9
	addq	552(%rsp), %r9
	movq	616(%rsp), %r11
	addq	%rsi, %r10
	xorq	%rbx, %r8
	addq	%r10, %rdx
	leaq	(%rdi,%r10), %rbx
	addq	%r8, %r11
	addq	%rdi, %rcx
	addq	%r9, %rax
	leaq	(%r9,%r11), %rsi
	leaq	(%rax,%rbx), %rdi
	leaq	(%r11,%r12), %rax
	movq	776(%rsp), %r11
	leaq	(%rsi,%rdx), %r8
	addq	%rsi, %rcx
	addq	%rbx, %rax
	rolq	$37, %rdi
	rolq	$11, %rcx
	rolq	$59, %rax
	rolq	$23, %r8
	movq	%rax, %rdx
	movq	%r8, %rsi
	xorq	%rdi, %rdx
	xorq	%rcx, %rsi
	xorq	%rdx, %rcx
	addq	680(%rsp), %rcx
	xorq	%rsi, %rax
	addq	648(%rsp), %rax
	xorq	%rdi, %rsi
	xorq	%r8, %rdx
	addq	664(%rsp), %rsi
	addq	744(%rsp), %rdx
	addq	%r11, %rcx
	movq	%rcx, 616(%rsp)
	movq	784(%rsp), %r12
	movq	800(%rsp), %rcx
	addq	816(%rsp), %r14
	addq	808(%rsp), %r13
	movq	600(%rsp), %rbx
	addq	%r12, %rax
	movq	%rax, 648(%rsp)
	movq	792(%rsp), %rax
	addq	%rcx, %rdx
	movq	%rdx, 696(%rsp)
	movq	%r14, 296(%rsp)
	movq	%r14, %r8
	movq	%r13, 280(%rsp)
	movq	616(%rsp), %rdx
	addq	%rax, %rsi
	addq	824(%rsp), %r15
	addq	832(%rsp), %rbx
	movq	%rsi, 680(%rsp)
	movq	648(%rsp), %r9
	movq	%rsi, %rdi
	movq	696(%rsp), %r10
	movq	%r15, 312(%rsp)
	movq	%rbx, 328(%rsp)
	movq	%r15, %r11
	movq	%rbx, %r12
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L48:
	cmpq	$InternalState+48, %r8
	jae	.L34
	movzbl	(%r8), %eax
	movb	%al, InternalState+32(%rip)
	movzbl	1(%r8), %eax
	movb	%al, InternalState+33(%rip)
	movzbl	2(%r8), %eax
	movb	%al, InternalState+34(%rip)
	movzbl	3(%r8), %eax
	movb	%al, InternalState+35(%rip)
	movzbl	4(%r8), %eax
	movb	%al, InternalState+36(%rip)
	movzbl	5(%r8), %eax
	movb	%al, InternalState+37(%rip)
	movzbl	6(%r8), %eax
	movb	%al, InternalState+38(%rip)
	movzbl	7(%r8), %eax
	movb	%al, InternalState+39(%rip)
	movzbl	8(%r8), %eax
	movb	%al, InternalState+40(%rip)
	movzbl	9(%r8), %eax
	movb	%al, InternalState+41(%rip)
	movzbl	10(%r8), %eax
	movb	%al, InternalState+42(%rip)
	movzbl	11(%r8), %eax
	movb	%al, InternalState+43(%rip)
	movzbl	12(%r8), %eax
	movb	%al, InternalState+44(%rip)
	movzbl	13(%r8), %eax
	movb	%al, InternalState+45(%rip)
	movzbl	14(%r8), %eax
	movb	%al, InternalState+46(%rip)
	movzbl	15(%r8), %eax
	movb	%al, InternalState+47(%rip)
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L47:
	cmpq	$InternalState+32, %rsi
	jae	.L33
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movzbl	(%rsi,%rax), %edx
	movb	%dl, InternalState(%rax)
	addq	$1, %rax
	cmpq	$32, %rax
	jne	.L2
	jmp	.L4
.L50:
	movq	$0, 104(%rsp)
	jmp	.L21
.L49:
	movq	904(%rsp), %rax
	movq	912(%rsp), %rdx
	movq	936(%rsp), %rsi
	movq	944(%rsp), %rdi
	movq	920(%rsp), %rcx
	movq	928(%rsp), %rbx
	movq	952(%rsp), %r8
	movq	960(%rsp), %r9
	movq	1000(%rsp), %r14
	movq	1008(%rsp), %r15
	movq	%rax, 344(%rsp)
	movq	%rdx, 360(%rsp)
	movq	1016(%rsp), %rax
	movq	1024(%rsp), %rdx
	movq	968(%rsp), %r10
	movq	976(%rsp), %r11
	movq	984(%rsp), %r12
	movq	992(%rsp), %r13
	movq	%rcx, -56(%rsp)
	movq	%rbx, -48(%rsp)
	leaq	(%r9,%r8), %rcx
	leaq	(%rdi,%rsi), %rbx
	movq	%rsi, -32(%rsp)
	movq	%rdi, 8(%rsp)
	movq	%rdx, -40(%rsp)
	movq	%r8, -8(%rsp)
	leaq	(%r15,%r14), %rdi
	movq	%r9, -16(%rsp)
	movq	%r10, 88(%rsp)
	xorl	%edx, %edx
	movq	%r11, 80(%rsp)
	movq	%r12, 72(%rsp)
	movq	%r13, 64(%rsp)
	movq	%r14, -24(%rsp)
	movq	%r15, 24(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%rbx, 40(%rsp)
	movq	-40(%rsp), %rsi
	movq	%rdi, 48(%rsp)
	addq	%rax, %rsi
	movq	%rsi, 32(%rsp)
	jmp	.L9
	.cfi_endproc
.LFE2571:
	.size	crypto_aead_encrypt, .-crypto_aead_encrypt
	.p2align 4,,15
	.globl	crypto_aead_decrypt
	.type	crypto_aead_decrypt, @function
crypto_aead_decrypt:
.LFB2572:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-128, %rsp
	subq	$1416, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rcx, 96(%rsp)
	movq	32(%rbp), %rcx
	vmovdqa	%ymm0, InternalState(%rip)
	movq	%rsi, -96(%rsp)
	movq	%rdi, -80(%rsp)
	vmovdqa	%ymm0, InternalState+32(%rip)
	movq	%rdx, 80(%rsp)
	vmovdqa	%ymm0, InternalState+64(%rip)
	leaq	32(%rcx), %rax
	movq	%r8, 24(%rsp)
	vmovdqa	%ymm0, InternalState+96(%rip)
	movq	%r9, -88(%rsp)
	cmpq	$InternalState, %rax
	movq	24(%rbp), %rsi
	ja	.L106
.L88:
	vmovdqu	(%rcx), %xmm0
	vinsertf128	$0x1, 16(%rcx), %ymm0, %ymm0
	vmovdqa	%ymm0, InternalState(%rip)
.L54:
	leaq	16(%rsi), %rax
	cmpq	$InternalState+32, %rax
	ja	.L107
.L89:
	vmovdqu	(%rsi), %xmm0
	vmovdqa	%xmm0, InternalState+32(%rip)
.L57:
	movq	InternalState(%rip), %rax
	movq	InternalState+8(%rip), %r10
	movabsq	$4195444129992158507, %rbx
	movq	InternalState+16(%rip), %rdx
	movq	InternalState+24(%rip), %r8
	movabsq	$7667772426219706969, %rsi
	movabsq	$-8247349341179448980, %rcx
	movabsq	$6220970056051541820, %r14
	movq	InternalState+56(%rip), %r13
	leaq	(%r10,%rax), %rdi
	addq	%rsi, %r10
	addq	%rcx, %rax
	leaq	(%r8,%rdx), %r9
	addq	%rbx, %r8
	addq	%r14, %rdx
	leaq	(%r8,%rdi), %r11
	addq	%rdi, %rdx
	movabsq	$-6792583489299504353, %rbx
	addq	%r9, %rax
	addq	%r10, %r9
	rolq	$37, %rdx
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$11, %rax
	movq	%r11, %rdi
	movq	%r9, %r8
	movabsq	$-1376848230519552085, %r10
	xorq	%rdx, %rdi
	xorq	%rax, %r8
	movb	$1, InternalState+48(%rip)
	xorq	%rdi, %r9
	xorq	%rdi, %rax
	xorq	%r8, %r11
	movabsq	$-9209400399786843361, %rdi
	addq	%r10, %rax
	xorq	%rdx, %r8
	addq	%rdi, %r11
	movabsq	$-3463520432737951897, %r10
	movabsq	$-369815132508846929, %rdi
	leaq	(%rax,%r11), %rdx
	addq	%rdi, %r8
	addq	%r9, %r10
	movabsq	$-1087367646907149102, %rdi
	addq	%r8, %r10
	addq	%rbx, %r9
	addq	%rdi, %r8
	leaq	(%r9,%rdx), %r12
	movabsq	$-3329063056561552456, %r15
	addq	%rdx, %r8
	movabsq	$-5426079245872290139, %rdx
	addq	%rdx, %rax
	rolq	$19, %r12
	rolq	$7, %r8
	leaq	(%rax,%r10), %r9
	movabsq	$-6657276164713376882, %rax
	addq	%rax, %r11
	vpxor	%xmm0, %xmm0, %xmm0
	rolq	$31, %r9
	addq	%r11, %r10
	movq	%r12, %r11
	rolq	$53, %r10
	movq	%r9, %rbx
	xorq	%r8, %r11
	xorq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r9, %r11
	xorq	%rbx, %r12
	xorq	%r8, %rbx
	movq	InternalState+32(%rip), %r9
	movq	%r12, 504(%rsp)
	movq	InternalState+48(%rip), %r12
	vmovdqa	%ymm0, 776(%rsp)
	movq	%rbx, 488(%rsp)
	movq	InternalState+40(%rip), %rbx
	vmovdqa	%ymm0, 808(%rsp)
	movq	%r11, 552(%rsp)
	leaq	(%r12,%r13), %r8
	movq	%r10, 536(%rsp)
	leaq	(%rbx,%r9), %r11
	addq	%rcx, %r9
	leaq	(%r8,%r9), %r10
	leaq	(%rbx,%rsi), %r9
	movabsq	$4195444129992158507, %rbx
	addq	%r13, %rbx
	movq	InternalState+88(%rip), %r13
	addq	%r8, %r9
	leaq	(%r12,%r14), %r8
	addq	%r11, %rbx
	rolq	$11, %r10
	rolq	$59, %rbx
	rolq	$23, %r9
	addq	%r11, %r8
	movq	%rbx, %r12
	movq	%r10, %r11
	rolq	$37, %r8
	xorq	%r9, %r11
	xorq	%r8, %r12
	xorq	%r11, %rbx
	xorq	%r11, %r8
	xorq	%r12, %r10
	addq	488(%rsp), %r8
	addq	552(%rsp), %r10
	addq	504(%rsp), %rbx
	xorq	%r9, %r12
	addq	536(%rsp), %r12
	leaq	(%rbx,%r10), %r9
	leaq	(%r8,%r12), %r11
	addq	%rdx, %r10
	addq	%rdi, %r8
	addq	%r15, %r12
	addq	%r9, %r8
	addq	%r11, %r10
	addq	%r12, %r9
	rolq	$7, %r8
	rolq	$31, %r10
	rolq	$19, %r9
	addq	%rax, %rbx
	movq	%r9, %r12
	addq	%rbx, %r11
	xorq	%r8, %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r10, %r12
	xorq	%r10, %rbx
	movq	%r12, 456(%rsp)
	movq	InternalState+80(%rip), %r12
	xorq	%rbx, %r9
	xorq	%r8, %rbx
	movq	%r11, 584(%rsp)
	movq	%r9, 744(%rsp)
	movq	%rbx, 680(%rsp)
	movq	InternalState+64(%rip), %r9
	movq	InternalState+72(%rip), %rbx
	leaq	0(%r13,%r12), %r8
	leaq	(%rbx,%r9), %r11
	addq	%rcx, %r9
	leaq	(%r9,%r8), %r10
	leaq	(%rbx,%rsi), %r9
	movabsq	$4195444129992158507, %rbx
	addq	%r13, %rbx
	addq	%r8, %r9
	leaq	(%r12,%r14), %r8
	addq	%r11, %rbx
	rolq	$23, %r9
	rolq	$11, %r10
	rolq	$59, %rbx
	addq	%r11, %r8
	movq	%r9, %r11
	rolq	$37, %r8
	xorq	%r10, %r11
	movq	%r8, %r12
	xorq	%r11, %r8
	addq	680(%rsp), %r8
	xorq	%rbx, %r12
	xorq	%r11, %rbx
	addq	744(%rsp), %rbx
	xorq	%r12, %r10
	addq	456(%rsp), %r10
	xorq	%r9, %r12
	addq	584(%rsp), %r12
	leaq	(%rbx,%r10), %r9
	leaq	(%r12,%r8), %r11
	addq	%rdi, %r8
	addq	%r15, %r12
	addq	%r9, %r8
	addq	%r12, %r9
	rolq	$7, %r8
	rolq	$19, %r9
	addq	%rax, %rbx
	addq	%rdx, %r10
	movq	%r9, %r12
	addq	%r11, %r10
	addq	%rbx, %r11
	xorq	%r8, %r12
	rolq	$53, %r11
	rolq	$31, %r10
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r10, %r12
	xorq	%r10, %rbx
	movq	%r11, 648(%rsp)
	movq	%r12, 520(%rsp)
	xorq	%rbx, %r9
	xorq	%r8, %rbx
	movq	%r9, 632(%rsp)
	movq	InternalState+112(%rip), %r12
	movq	InternalState+120(%rip), %r13
	movq	%rbx, 728(%rsp)
	movq	InternalState+96(%rip), %r9
	movq	InternalState+104(%rip), %rbx
	leaq	0(%r13,%r12), %r8
	leaq	(%rbx,%r9), %r10
	addq	%rcx, %r9
	leaq	(%r8,%r9), %r11
	leaq	(%rbx,%rsi), %r9
	movabsq	$4195444129992158507, %rbx
	addq	%r13, %rbx
	addq	%r9, %r8
	leaq	(%r12,%r14), %r9
	rolq	$11, %r11
	rolq	$23, %r8
	addq	%r10, %r9
	addq	%rbx, %r10
	movq	%r8, %r12
	rolq	$59, %r10
	rolq	$37, %r9
	xorq	%r11, %r12
	movq	%r10, %rbx
	xorq	%r12, %r10
	addq	632(%rsp), %r10
	xorq	%r9, %rbx
	xorq	%r12, %r9
	movq	648(%rsp), %r12
	xorq	%rbx, %r11
	addq	520(%rsp), %r11
	addq	728(%rsp), %r9
	xorq	%rbx, %r8
	addq	%r8, %r12
	leaq	(%r10,%r11), %rbx
	leaq	(%r12,%r9), %r8
	addq	%rdi, %r9
	leaq	(%r9,%rbx), %r13
	leaq	(%r11,%rdx), %r9
	rolq	$7, %r13
	addq	%r15, %r12
	addq	%rax, %r10
	addq	%r12, %rbx
	leaq	(%r10,%r8), %r11
	addq	%r8, %r9
	rolq	$19, %rbx
	rolq	$31, %r9
	movq	%rbx, %r10
	rolq	$53, %r11
	xorq	%r13, %r10
	movq	%r11, %r8
	movq	%r10, %r12
	xorq	%r9, %r8
	xorq	%r9, %r10
	xorq	%r11, %r12
	movabsq	$-7999569951748836447, %r11
	xorq	%r8, %rbx
	addq	%r11, %r10
	xorq	%r13, %r8
	movabsq	$-1568322642145848418, %r11
	addq	%r11, %r8
	movabsq	$-4849728007900573903, %r9
	movabsq	$-1642314245251606934, %r11
	addq	%r9, %rbx
	addq	%r12, %r11
	movabsq	$4195444129992158507, %r13
	addq	%r8, %r11
	leaq	(%r10,%rbx), %r9
	addq	%rsi, %rbx
	addq	%rcx, %r10
	addq	%r14, %r8
	addq	%r11, %r10
	addq	%rbx, %r11
	movabsq	$2553129884740551573, %rbx
	addq	%r12, %rbx
	addq	%r9, %r8
	rolq	$11, %r10
	addq	%rbx, %r9
	rolq	$37, %r8
	rolq	$23, %r11
	rolq	$59, %r9
	movq	%r10, %r12
	movq	%r9, %rbx
	xorq	%r11, %r12
	xorq	%r8, %rbx
	xorq	%rbx, %r11
	xorq	%r12, %r9
	xorq	%r8, %r12
	xorq	%rbx, %r10
	movq	%r12, 424(%rsp)
	movq	%r11, %rbx
	movq	424(%rsp), %r8
	addq	648(%rsp), %rbx
	movq	%r9, %r12
	addq	728(%rsp), %r8
	addq	632(%rsp), %r12
	movq	%r10, 600(%rsp)
	addq	520(%rsp), %r10
	movq	%r11, 472(%rsp)
	movq	%r9, 568(%rsp)
	leaq	(%r8,%rbx), %r11
	addq	%r14, %r8
	leaq	(%r12,%r10), %r9
	addq	%rsi, %r12
	addq	%rcx, %r10
	addq	%r11, %r10
	addq	%r12, %r11
	movabsq	$4195444129992158507, %r12
	addq	%r12, %rbx
	addq	%r9, %r8
	rolq	$23, %r11
	addq	%rbx, %r9
	rolq	$37, %r8
	rolq	$11, %r10
	rolq	$59, %r9
	movq	%r11, %rbx
	movq	%r9, %r12
	xorq	%r10, %rbx
	xorq	%r8, %r12
	xorq	%rbx, %r9
	xorq	%r8, %rbx
	xorq	%r12, %r11
	xorq	%r12, %r10
	movq	%rbx, 616(%rsp)
	movq	%rbx, %r8
	movq	%r11, %rbx
	addq	680(%rsp), %r8
	addq	584(%rsp), %rbx
	movq	%r10, 696(%rsp)
	movq	%r9, %r12
	addq	456(%rsp), %r10
	addq	744(%rsp), %r12
	movq	%r11, 712(%rsp)
	movq	%r9, 664(%rsp)
	leaq	(%r8,%rbx), %r11
	leaq	(%r12,%r10), %r9
	addq	%rcx, %r10
	addq	%r11, %r10
	rolq	$11, %r10
	addq	%rsi, %r12
	addq	%r13, %rbx
	addq	%r14, %r8
	addq	%r12, %r11
	addq	%r9, %r8
	addq	%rbx, %r9
	rolq	$23, %r11
	rolq	$59, %r9
	rolq	$37, %r8
	movq	%r11, %rbx
	movq	%r9, %r12
	xorq	%r10, %rbx
	xorq	%r8, %r12
	xorq	%rbx, %r9
	xorq	%r8, %rbx
	xorq	%r12, %r10
	xorq	%r12, %r11
	movq	%rbx, %r8
	movq	%r11, 648(%rsp)
	addq	488(%rsp), %r8
	movq	%r10, %r11
	movq	%r10, 520(%rsp)
	addq	552(%rsp), %r11
	movq	%r9, %r12
	movq	648(%rsp), %r10
	addq	504(%rsp), %r12
	addq	536(%rsp), %r10
	movq	%r9, 632(%rsp)
	movq	%rbx, 728(%rsp)
	leaq	(%r12,%r11), %r9
	addq	%rsi, %r12
	addq	%rcx, %r11
	leaq	(%r10,%r8), %rbx
	addq	%r13, %r10
	addq	%r14, %r8
	addq	%r9, %r10
	addq	%r9, %r8
	movabsq	$-2292595471992902602, %r13
	addq	%rbx, %r12
	addq	%rbx, %r11
	rolq	$59, %r10
	rolq	$23, %r12
	rolq	$11, %r11
	rolq	$37, %r8
	movq	%r10, %rbx
	movq	%r12, %r9
	xorq	%r11, %r9
	xorq	%r8, %rbx
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	xorq	%r9, %r10
	movabsq	$8467826889434979867, %rbx
	addq	%r13, %r11
	xorq	%r9, %r8
	addq	%rbx, %r10
	movabsq	$6028102484886760763, %r9
	movabsq	$-5006043190370284386, %rbx
	addq	%rbx, %r8
	addq	%r12, %r9
	leaq	(%r11,%r10), %rbx
	movabsq	$2699039428325208307, %r13
	addq	%r8, %r9
	addq	%rdx, %r11
	addq	%r13, %r12
	addq	%rdi, %r8
	addq	%rax, %r10
	addq	%rbx, %r8
	addq	%r9, %r11
	addq	%r12, %rbx
	rolq	$31, %r11
	rolq	$19, %rbx
	addq	%r10, %r9
	rolq	$7, %r8
	rolq	$53, %r9
	movq	%rbx, %r12
	movq	%r11, %r10
	xorq	%r8, %r12
	xorq	%r9, %r10
	xorq	%r12, %r9
	xorq	%r11, %r12
	xorq	%r10, %rbx
	xorq	%r8, %r10
	movq	%r9, 680(%rsp)
	movq	%r10, 440(%rsp)
	movq	%rbx, 584(%rsp)
	movq	%r12, %r10
	addq	632(%rsp), %rbx
	addq	520(%rsp), %r10
	movq	%r12, 456(%rsp)
	movq	440(%rsp), %r8
	movq	%r9, %r12
	addq	728(%rsp), %r8
	addq	648(%rsp), %r12
	leaq	(%r10,%rbx), %r9
	leaq	(%r8,%r12), %r11
	addq	%rdi, %r8
	addq	%r9, %r8
	rolq	$7, %r8
	addq	%r15, %r12
	addq	%rdx, %r10
	addq	%rax, %rbx
	addq	%r12, %r9
	addq	%r11, %r10
	rolq	$31, %r10
	rolq	$19, %r9
	addq	%rbx, %r11
	rolq	$53, %r11
	movq	%r9, %r12
	movq	%r10, %rbx
	xorq	%r8, %r12
	xorq	%r11, %rbx
	xorq	%rbx, %r9
	xorq	%r12, %r11
	xorq	%r8, %rbx
	xorq	%r10, %r12
	movq	%rbx, 552(%rsp)
	movq	%r9, %rbx
	movq	%r12, 488(%rsp)
	addq	664(%rsp), %rbx
	movq	%r12, %r10
	movq	552(%rsp), %r8
	addq	696(%rsp), %r10
	movq	%r11, %r12
	addq	616(%rsp), %r8
	addq	712(%rsp), %r12
	movq	%r11, 744(%rsp)
	movq	%r9, 504(%rsp)
	leaq	(%rbx,%r10), %r9
	addq	%rax, %rbx
	addq	%rdx, %r10
	leaq	(%r8,%r12), %r11
	addq	%rdi, %r8
	addq	%r15, %r12
	addq	%r9, %r8
	addq	%r12, %r9
	addq	%r11, %r10
	addq	%rbx, %r11
	rolq	$19, %r9
	rolq	$53, %r11
	rolq	$7, %r8
	rolq	$31, %r10
	movq	%r9, %r12
	movq	%r11, %rbx
	xorq	%r8, %r12
	xorq	%r10, %rbx
	xorq	%rbx, %r9
	xorq	%r12, %r11
	xorq	%r10, %r12
	xorq	%r8, %rbx
	movq	%r9, 632(%rsp)
	movq	%r12, %r10
	addq	568(%rsp), %r9
	addq	600(%rsp), %r10
	movq	%r12, 520(%rsp)
	movq	%rbx, 728(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	424(%rsp), %r12
	addq	472(%rsp), %rbx
	movq	%r11, 648(%rsp)
	leaq	(%r9,%r10), %r11
	addq	%rax, %r9
	addq	%rdx, %r10
	leaq	(%rbx,%r12), %r8
	addq	%rdi, %r12
	addq	%r15, %rbx
	addq	%r11, %r12
	addq	%rbx, %r11
	rolq	$19, %r11
	rolq	$7, %r12
	addq	%r8, %r9
	movq	%r11, %rbx
	rolq	$53, %r9
	addq	%r8, %r10
	xorq	%r12, %rbx
	rolq	$31, %r10
	movq	%r9, %r8
	movq	%rbx, %r13
	xorq	%r10, %r8
	xorq	%rbx, %r10
	xorq	%r9, %r13
	movabsq	$5953845371152580681, %r9
	xorq	%r8, %r11
	addq	%r9, %r10
	movabsq	$-7646712092252898442, %r9
	xorq	%r12, %r8
	leaq	(%r11,%r9), %rbx
	movabsq	$-2842268575306187841, %r9
	movabsq	$-7946738593435294165, %r11
	addq	%r9, %r8
	addq	%r13, %r11
	addq	%r8, %r11
	leaq	(%rbx,%r10), %r9
	addq	%rcx, %r10
	addq	%r11, %r10
	rolq	$11, %r10
	addq	%rsi, %rbx
	addq	%r14, %r8
	addq	%rbx, %r11
	movabsq	$-3751294463443135658, %rbx
	addq	%r9, %r8
	addq	%r13, %rbx
	rolq	$37, %r8
	rolq	$23, %r11
	addq	%rbx, %r9
	movq	%r10, %r12
	movq	%r8, %rbx
	rolq	$59, %r9
	xorq	%r11, %r12
	movabsq	$4195444129992158507, %r13
	xorq	%r9, %rbx
	xorq	%r12, %r9
	xorq	%r8, %r12
	xorq	%rbx, %r11
	xorq	%rbx, %r10
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	movq	472(%rsp), %r8
	addq	648(%rsp), %rbx
	addq	728(%rsp), %r8
	movq	%r10, 664(%rsp)
	movq	%r9, %r12
	addq	520(%rsp), %r10
	addq	632(%rsp), %r12
	movq	%r11, 600(%rsp)
	movq	%r9, 568(%rsp)
	leaq	(%rbx,%r8), %r11
	addq	%r14, %r8
	leaq	(%r12,%r10), %r9
	addq	%rsi, %r12
	addq	%rcx, %r10
	addq	%r11, %r10
	addq	%r12, %r11
	movabsq	$4195444129992158507, %r12
	addq	%r12, %rbx
	addq	%r9, %r8
	rolq	$23, %r11
	addq	%rbx, %r9
	rolq	$37, %r8
	rolq	$11, %r10
	rolq	$59, %r9
	movq	%r11, %rbx
	movq	%r9, %r12
	xorq	%r8, %r12
	xorq	%r10, %rbx
	xorq	%rbx, %r9
	xorq	%r12, %r11
	xorq	%r12, %r10
	xorq	%r8, %rbx
	movq	%r11, 536(%rsp)
	movq	%r9, %r12
	movq	%r10, 712(%rsp)
	addq	504(%rsp), %r12
	movq	%rbx, %r8
	addq	488(%rsp), %r10
	addq	552(%rsp), %r8
	movq	%rbx, 616(%rsp)
	movq	%r11, %rbx
	addq	744(%rsp), %rbx
	movq	%r9, 696(%rsp)
	leaq	(%r12,%r10), %r9
	addq	%rsi, %r12
	addq	%rcx, %r10
	leaq	(%r8,%rbx), %r11
	addq	%r13, %rbx
	addq	%r14, %r8
	addq	%r9, %r8
	addq	%rbx, %r9
	addq	%r11, %r10
	addq	%r12, %r11
	rolq	$59, %r9
	rolq	$23, %r11
	rolq	$37, %r8
	rolq	$11, %r10
	movq	%r9, %r12
	movq	%r11, %rbx
	xorq	%r8, %r12
	xorq	%r10, %rbx
	xorq	%rbx, %r9
	xorq	%r12, %r10
	xorq	%r12, %r11
	xorq	%r8, %rbx
	movq	%r11, 648(%rsp)
	movq	%r10, 520(%rsp)
	movq	%r10, %r11
	movq	%rbx, %r8
	movq	648(%rsp), %r10
	addq	440(%rsp), %r8
	addq	680(%rsp), %r10
	movq	%r9, %r12
	addq	456(%rsp), %r11
	addq	584(%rsp), %r12
	movq	%rbx, 728(%rsp)
	movq	%r9, 632(%rsp)
	leaq	(%r10,%r8), %rbx
	leaq	(%r12,%r11), %r9
	addq	%rcx, %r11
	addq	%rbx, %r11
	rolq	$11, %r11
	addq	%rsi, %r12
	addq	%r13, %r10
	addq	%rbx, %r12
	addq	%r9, %r10
	addq	%r14, %r8
	rolq	$23, %r12
	addq	%r9, %r8
	rolq	$59, %r10
	rolq	$37, %r8
	movq	%r10, %rbx
	movq	%r12, %r9
	xorq	%r8, %rbx
	xorq	%r11, %r9
	movabsq	$-824919486193887165, %r13
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	xorq	%r9, %r10
	movabsq	$-1914029582460860148, %rbx
	addq	%r13, %r11
	xorq	%r9, %r8
	addq	%rbx, %r10
	movabsq	$-7632797540959622777, %r9
	movabsq	$6609752215332129920, %rbx
	addq	%rbx, %r8
	addq	%r12, %r9
	leaq	(%r10,%r11), %rbx
	addq	%r8, %r9
	addq	%rax, %r10
	addq	%rdi, %r8
	addq	%rdx, %r11
	movabsq	$7484883476188376383, %r13
	addq	%rbx, %r8
	addq	%r13, %r12
	addq	%r9, %r11
	addq	%r10, %r9
	rolq	$7, %r8
	addq	%r12, %rbx
	rolq	$53, %r9
	rolq	$31, %r11
	rolq	$19, %rbx
	movq	%r8, %r12
	movq	%r9, %r10
	xorq	%rbx, %r12
	movq	%rcx, %r13
	xorq	%r11, %r10
	xorq	%r12, %r9
	xorq	%r11, %r12
	xorq	%r10, %rbx
	xorq	%r8, %r10
	movq	%r12, 552(%rsp)
	movq	%r10, 488(%rsp)
	movq	%rbx, 504(%rsp)
	movq	%r12, %r10
	addq	632(%rsp), %rbx
	addq	520(%rsp), %r10
	movq	%r9, %r12
	movq	488(%rsp), %r8
	addq	648(%rsp), %r12
	addq	728(%rsp), %r8
	movq	%r9, 584(%rsp)
	leaq	(%r10,%rbx), %r9
	addq	%rdx, %r10
	addq	%rax, %rbx
	leaq	(%r12,%r8), %r11
	addq	%rdi, %r8
	addq	%r15, %r12
	addq	%r9, %r8
	addq	%r12, %r9
	addq	%r11, %r10
	rolq	$7, %r8
	addq	%rbx, %r11
	rolq	$31, %r10
	rolq	$19, %r9
	rolq	$53, %r11
	movq	%r8, %r12
	movq	%r10, %rbx
	xorq	%r9, %r12
	xorq	%r11, %rbx
	xorq	%rbx, %r9
	xorq	%r12, %r11
	xorq	%r8, %rbx
	xorq	%r10, %r12
	movq	%rbx, 680(%rsp)
	movq	%r9, %rbx
	movq	%r12, %r10
	addq	696(%rsp), %rbx
	addq	712(%rsp), %r10
	movq	%r12, 424(%rsp)
	movq	680(%rsp), %r8
	movq	%r11, %r12
	addq	616(%rsp), %r8
	addq	536(%rsp), %r12
	movq	%r9, 744(%rsp)
	movq	%r11, 408(%rsp)
	leaq	(%r10,%rbx), %r9
	leaq	(%r8,%r12), %r11
	addq	%rdi, %r8
	addq	%r9, %r8
	addq	%rax, %rbx
	addq	%r15, %r12
	addq	%rdx, %r10
	addq	%r12, %r9
	rolq	$7, %r8
	addq	%r11, %r10
	addq	%rbx, %r11
	rolq	$19, %r9
	rolq	$53, %r11
	rolq	$31, %r10
	movq	%r9, %r12
	movq	%r11, %rbx
	xorq	%r8, %r12
	xorq	%r10, %rbx
	xorq	%r12, %r11
	xorq	%r10, %r12
	xorq	%rbx, %r9
	movq	%r11, 648(%rsp)
	xorq	%r8, %rbx
	movq	%r9, 632(%rsp)
	movq	%r12, %r10
	addq	568(%rsp), %r9
	addq	664(%rsp), %r10
	movq	%r12, 520(%rsp)
	movq	%rbx, %r12
	movq	%rbx, 728(%rsp)
	addq	472(%rsp), %r12
	movq	%r11, %rbx
	addq	600(%rsp), %rbx
	leaq	(%r9,%r10), %r11
	addq	%rdx, %r10
	addq	%rax, %r9
	leaq	(%rbx,%r12), %r8
	addq	%rdi, %r12
	addq	%r15, %rbx
	addq	%r11, %r12
	addq	%rbx, %r11
	rolq	$19, %r11
	leaq	(%r10,%r8), %rbx
	addq	%r9, %r8
	rolq	$7, %r12
	rolq	$53, %r8
	movq	%r11, %r9
	xorq	%r12, %r9
	rolq	$31, %rbx
	movq	%r8, %r10
	xorq	%rbx, %r10
	xorq	%r9, %r8
	xorq	%rbx, %r9
	movq	%r8, 712(%rsp)
	movabsq	$-1139829817207230181, %r8
	xorq	%r10, %r11
	addq	%r8, %r9
	movabsq	$3054837738180890943, %r8
	xorq	%r12, %r10
	leaq	(%r11,%r8), %rbx
	movabsq	$-938319195649413462, %r11
	addq	712(%rsp), %r11
	movabsq	$2588290990126348949, %r8
	leaq	(%r9,%rcx), %rcx
	movabsq	$4195444129992158507, %r12
	addq	%r8, %r10
	leaq	(%r9,%rbx), %r8
	movq	%rsi, %r9
	addq	%rsi, %rbx
	leaq	(%r10,%r14), %rsi
	addq	%r10, %r11
	movabsq	$3257124934342745045, %r10
	addq	712(%rsp), %r10
	addq	%r11, %rcx
	addq	%r8, %rsi
	addq	%rbx, %r11
	rolq	$11, %rcx
	rolq	$37, %rsi
	rolq	$23, %r11
	movq	%rcx, %rbx
	addq	%r10, %r8
	xorq	%r11, %rbx
	rolq	$59, %r8
	movq	%r8, %r10
	xorq	%rbx, %r8
	xorq	%rsi, %rbx
	xorq	%rsi, %r10
	movq	%r8, 616(%rsp)
	movq	%rbx, 600(%rsp)
	xorq	%r10, %rcx
	xorq	%r10, %r11
	movq	616(%rsp), %rbx
	movq	%r11, 440(%rsp)
	movq	%rcx, 472(%rsp)
	movq	%rcx, %r8
	addq	648(%rsp), %r11
	movq	600(%rsp), %rcx
	addq	728(%rsp), %rcx
	addq	520(%rsp), %r8
	addq	632(%rsp), %rbx
	leaq	(%rcx,%r11), %r10
	leaq	(%r8,%rbx), %rsi
	addq	%r13, %r8
	addq	%r9, %rbx
	addq	%r10, %r8
	rolq	$11, %r8
	addq	%rbx, %r10
	addq	%r14, %rcx
	addq	%rsi, %rcx
	addq	%r12, %r11
	rolq	$23, %r10
	rolq	$37, %rcx
	addq	%r11, %rsi
	movq	%r8, %r11
	rolq	$59, %rsi
	movq	%rcx, %rbx
	xorq	%r10, %r11
	xorq	%rsi, %rbx
	xorq	%r11, %rsi
	xorq	%rcx, %r11
	xorq	%rbx, %r10
	xorq	%rbx, %r8
	movq	%r11, 536(%rsp)
	movq	%r8, 456(%rsp)
	movq	%rsi, %rbx
	addq	424(%rsp), %r8
	addq	744(%rsp), %rbx
	movq	%r11, %rcx
	movq	%r10, %r11
	addq	680(%rsp), %rcx
	addq	408(%rsp), %r11
	movq	%r10, 568(%rsp)
	movq	%rsi, 696(%rsp)
	leaq	(%rbx,%r8), %rsi
	addq	%r9, %rbx
	addq	%r13, %r8
	leaq	(%rcx,%r11), %r10
	addq	%r12, %r11
	addq	%r14, %rcx
	addq	%rsi, %rcx
	addq	%r11, %rsi
	addq	%r10, %r8
	addq	%rbx, %r10
	rolq	$59, %rsi
	rolq	$23, %r10
	rolq	$37, %rcx
	rolq	$11, %r8
	movq	%rsi, %rbx
	movq	%r10, %r11
	xorq	%rcx, %rbx
	xorq	%r8, %r11
	xorq	%rbx, %r10
	xorq	%rbx, %r8
	xorq	%r11, %rsi
	movq	%r10, 648(%rsp)
	xorq	%rcx, %r11
	movq	%r8, %r10
	movq	%rsi, %rbx
	addq	552(%rsp), %r10
	addq	504(%rsp), %rbx
	movq	%r8, 520(%rsp)
	movq	%r11, %rcx
	movq	648(%rsp), %r8
	addq	488(%rsp), %rcx
	addq	584(%rsp), %r8
	movq	%rsi, 632(%rsp)
	movq	%r11, 728(%rsp)
	leaq	(%rbx,%r10), %rsi
	addq	%r9, %rbx
	addq	%r13, %r10
	leaq	(%r8,%rcx), %r11
	addq	%r12, %r8
	addq	%r14, %rcx
	addq	%rsi, %r8
	addq	%rsi, %rcx
	addq	%r11, %rbx
	rolq	$59, %r8
	addq	%r11, %r10
	rolq	$23, %rbx
	rolq	$37, %rcx
	movq	%r8, %r11
	xorq	%rcx, %r11
	rolq	$11, %r10
	movq	%rbx, %rsi
	xorq	%r10, %rsi
	xorq	%r11, %rbx
	xorq	%r11, %r10
	movabsq	$-6097248013946911484, %r11
	xorq	%rsi, %r8
	xorq	%rsi, %rcx
	addq	%r11, %r10
	movabsq	$3174302594670681997, %r11
	movabsq	$-8739574512844769069, %rsi
	addq	%r11, %r8
	movabsq	$-496885038275669880, %r11
	addq	%rbx, %rsi
	addq	%r11, %rcx
	leaq	(%r10,%r8), %r11
	movq	%rbx, 744(%rsp)
	addq	%rcx, %rsi
	addq	%rdi, %rcx
	movabsq	$6378106504303230091, %rbx
	addq	%r11, %rcx
	rolq	$7, %rcx
	addq	744(%rsp), %rbx
	addq	%rax, %r8
	addq	%rdx, %r10
	addq	%rsi, %r10
	addq	%r8, %rsi
	rolq	$53, %rsi
	rolq	$31, %r10
	addq	%rbx, %r11
	movq	%rsi, %r8
	rolq	$19, %r11
	xorq	%r10, %r8
	movq	%r11, %rbx
	xorq	%r8, %r11
	xorq	%rcx, %r8
	xorq	%rcx, %rbx
	movq	%r8, 664(%rsp)
	movq	%r11, 488(%rsp)
	xorq	%rbx, %rsi
	xorq	%r10, %rbx
	addq	632(%rsp), %r11
	movq	%rbx, 504(%rsp)
	movq	%rbx, %r8
	movq	664(%rsp), %rcx
	addq	520(%rsp), %r8
	addq	728(%rsp), %rcx
	movq	%rsi, %rbx
	addq	648(%rsp), %rbx
	movq	%rsi, 552(%rsp)
	leaq	(%r11,%r8), %rsi
	addq	%rax, %r11
	addq	%rdx, %r8
	leaq	(%rcx,%rbx), %r10
	addq	%rdi, %rcx
	addq	%r15, %rbx
	addq	%rsi, %rcx
	addq	%rbx, %rsi
	addq	%r10, %r8
	addq	%r11, %r10
	rolq	$7, %rcx
	rolq	$53, %r10
	rolq	$31, %r8
	rolq	$19, %rsi
	movq	%rcx, %rbx
	movq	%r10, %r11
	xorq	%r8, %r11
	xorq	%rsi, %rbx
	xorq	%rbx, %r10
	xorq	%r11, %rsi
	xorq	%r8, %rbx
	xorq	%rcx, %r11
	movq	%rbx, 712(%rsp)
	movq	%rbx, %r8
	movq	%r11, 584(%rsp)
	addq	456(%rsp), %r8
	movq	%rsi, %r11
	movq	584(%rsp), %rcx
	addq	696(%rsp), %r11
	movq	%r10, %rbx
	addq	536(%rsp), %rcx
	addq	568(%rsp), %rbx
	movq	%r10, 744(%rsp)
	movq	%rsi, 680(%rsp)
	leaq	(%r8,%r11), %rsi
	addq	%rax, %r11
	addq	%rdx, %r8
	leaq	(%rbx,%rcx), %r10
	addq	%rdi, %rcx
	addq	%r15, %rbx
	addq	%rsi, %rcx
	addq	%rbx, %rsi
	addq	%r10, %r8
	addq	%r11, %r10
	rolq	$19, %rsi
	rolq	$53, %r10
	rolq	$7, %rcx
	rolq	$31, %r8
	movq	%rsi, %rbx
	movq	%r10, %r11
	xorq	%rcx, %rbx
	xorq	%r8, %r11
	xorq	%rbx, %r10
	xorq	%r11, %rsi
	xorq	%r8, %rbx
	xorq	%rcx, %r11
	movq	%rsi, 632(%rsp)
	movq	%rbx, %r8
	addq	616(%rsp), %rsi
	addq	472(%rsp), %r8
	movq	%rbx, 520(%rsp)
	movq	%r11, %rbx
	addq	600(%rsp), %rbx
	movq	%r11, 728(%rsp)
	movq	%r10, %r11
	addq	440(%rsp), %r11
	movq	%r10, 648(%rsp)
	leaq	(%rsi,%r8), %r10
	addq	%rbx, %rdi
	addq	%r10, %rdi
	leaq	(%r11,%rbx), %rcx
	rolq	$7, %rdi
	addq	%r15, %r11
	addq	%rsi, %rax
	addq	%r11, %r10
	addq	%r8, %rdx
	rolq	$19, %r10
	addq	%rcx, %rdx
	addq	%rax, %rcx
	rolq	$53, %rcx
	movq	%r10, %r8
	rolq	$31, %rdx
	xorq	%rdi, %r8
	movq	%rcx, %rsi
	movabsq	$853475092736589577, %rax
	xorq	%rdx, %rsi
	movq	%r8, %r11
	xorq	%rdx, %r8
	addq	%rax, %r8
	xorq	%rcx, %r11
	xorq	%rsi, %r10
	xorq	%rsi, %rdi
	movabsq	$-4925106476758491821, %rdx
	movabsq	$-5486504877919021346, %rax
	movabsq	$1906713845121804688, %rcx
	addq	%rdx, %rdi
	addq	%r10, %rax
	addq	%r11, %rcx
	leaq	(%r8,%r13), %rsi
	leaq	(%r8,%rax), %rdx
	movq	%rax, InternalState+104(%rip)
	movq	%rcx, InternalState+120(%rip)
	addq	%r9, %rax
	addq	%rdi, %rcx
	movq	%rdi, InternalState+112(%rip)
	movq	%r8, InternalState+96(%rip)
	addq	%rcx, %rsi
	addq	%rax, %rcx
	leaq	(%rdi,%r14), %rax
	movabsq	$6102157975113963195, %rdi
	rolq	$23, %rcx
	rolq	$11, %rsi
	addq	%rdx, %rax
	addq	%r11, %rdi
	movq	%rcx, %r8
	rolq	$37, %rax
	addq	%rdi, %rdx
	xorq	%rsi, %r8
	rolq	$59, %rdx
	movq	%rax, %r10
	movq	632(%rsp), %rdi
	xorq	%rdx, %r10
	xorq	%r10, %rcx
	xorq	%rsi, %r10
	addq	520(%rsp), %r10
	xorq	%r8, %rdx
	xorq	%r8, %rax
	addq	%rdx, %rdi
	movq	%r10, InternalState+64(%rip)
	movq	%rdi, InternalState+72(%rip)
	leaq	(%r10,%rdi), %rsi
	addq	648(%rsp), %rcx
	movq	728(%rsp), %rdx
	addq	%r9, %rdi
	addq	%rax, %rdx
	leaq	(%r10,%r13), %rax
	leaq	(%rdx,%rcx), %r8
	movq	%rcx, InternalState+88(%rip)
	addq	%r12, %rcx
	leaq	(%rcx,%rsi), %r10
	movq	%rdx, InternalState+80(%rip)
	addq	%r14, %rdx
	addq	%r8, %rax
	addq	%rsi, %rdx
	addq	%rdi, %r8
	rolq	$11, %rax
	rolq	$59, %r10
	rolq	$23, %r8
	rolq	$37, %rdx
	movq	%r10, %rsi
	movq	%rax, %rcx
	xorq	%rdx, %rsi
	xorq	%r8, %rcx
	xorq	%rsi, %rax
	xorq	%rsi, %r8
	addq	712(%rsp), %rax
	addq	744(%rsp), %r8
	xorq	%rcx, %rdx
	addq	584(%rsp), %rdx
	xorq	%rcx, %r10
	addq	680(%rsp), %r10
	leaq	(%rax,%r13), %rsi
	movq	%rax, InternalState+32(%rip)
	movq	%rax, 520(%rsp)
	leaq	(%rdx,%r8), %rdi
	movq	%rdx, InternalState+48(%rip)
	addq	%r14, %rdx
	leaq	(%rax,%r10), %rcx
	movq	%r10, InternalState+40(%rip)
	addq	%r9, %r10
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r8, InternalState+56(%rip)
	rolq	$11, %rsi
	rolq	$23, %rdi
	addq	%rcx, %rdx
	addq	%r12, %r8
	rolq	$37, %rdx
	addq	%r8, %rcx
	movq	%rdi, %r8
	rolq	$59, %rcx
	xorq	%rsi, %r8
	movq	%rcx, %r10
	xorq	%r8, %rcx
	addq	488(%rsp), %rcx
	xorq	%rdx, %r10
	xorq	%r8, %rdx
	addq	664(%rsp), %rdx
	xorq	%r10, %rdi
	xorq	%r10, %rsi
	addq	552(%rsp), %rdi
	addq	504(%rsp), %rsi
	movq	%rcx, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	%rdi, InternalState+24(%rip)
	movq	%rsi, InternalState(%rip)
	movq	16(%rbp), %rsi
	vmovdqa	InternalState(%rip), %ymm0
	vmovdqa	%ymm0, 904(%rsp)
	shrq	$6, %rsi
	vmovdqa	InternalState+32(%rip), %ymm0
	testq	%rsi, %rsi
	movq	%rsi, -72(%rsp)
	vmovdqa	%ymm0, 936(%rsp)
	vmovdqa	InternalState+64(%rip), %ymm0
	vmovdqa	%ymm0, 968(%rsp)
	vmovdqa	InternalState+96(%rip), %ymm0
	vmovdqa	%ymm0, 1000(%rsp)
	je	.L108
	movq	920(%rsp), %r15
	movq	928(%rsp), %rax
	movq	912(%rsp), %rdx
	movq	808(%rsp), %rbx
	movq	816(%rsp), %rsi
	movq	824(%rsp), %rdi
	movq	%rax, -64(%rsp)
	addq	%r15, %rax
	movq	-64(%rsp), %rcx
	movq	%rax, 344(%rsp)
	movq	%rdx, %rax
	movq	%r15, -56(%rsp)
	addq	%r9, %rax
	addq	344(%rsp), %rax
	addq	%r14, %r15
	addq	%r12, %rcx
	movq	832(%rsp), %r8
	movq	776(%rsp), %r10
	movq	792(%rsp), %r11
	movq	%rdx, 360(%rsp)
	movq	%r15, 128(%rsp)
	movq	904(%rsp), %rdx
	rorq	$41, %rax
	movq	784(%rsp), %r15
	movq	%rcx, 312(%rsp)
	movq	%rax, 504(%rsp)
	movq	936(%rsp), %rcx
	movq	800(%rsp), %rax
	movq	%rbx, 408(%rsp)
	movq	944(%rsp), %rbx
	movq	%rsi, 488(%rsp)
	movq	%rdi, 472(%rsp)
	movq	%r8, 456(%rsp)
	movq	%r10, 392(%rsp)
	movq	%r11, 424(%rsp)
	movq	%r15, 440(%rsp)
	movq	%rax, 376(%rsp)
	movq	%rdx, 296(%rsp)
	movq	%rcx, -32(%rsp)
	movq	%rbx, -40(%rsp)
	movq	952(%rsp), %rsi
	movq	960(%rsp), %rdi
	movq	1008(%rsp), %rdx
	movq	1000(%rsp), %rax
	movq	1016(%rsp), %rcx
	movq	%rsi, -16(%rsp)
	movq	968(%rsp), %r8
	movq	%rdi, -24(%rsp)
	addq	%rsi, %rdi
	movq	-40(%rsp), %rsi
	addq	-32(%rsp), %rsi
	movq	%rdx, (%rsp)
	movq	-24(%rsp), %rdx
	movq	%rax, 8(%rsp)
	movq	-16(%rsp), %rax
	movq	%rcx, -8(%rsp)
	movq	-32(%rsp), %rcx
	movq	976(%rsp), %r10
	movq	%rsi, 32(%rsp)
	movq	-40(%rsp), %rsi
	addq	%r12, %rdx
	addq	32(%rsp), %rdx
	addq	%r14, %rax
	addq	32(%rsp), %rax
	addq	%r13, %rcx
	movq	984(%rsp), %r11
	movq	992(%rsp), %r15
	addq	%r9, %rsi
	addq	%rdi, %rcx
	movq	1024(%rsp), %rbx
	addq	%rdi, %rsi
	rorq	$53, %rcx
	movq	%r8, -48(%rsp)
	rorq	$41, %rsi
	rorq	$5, %rdx
	rorq	$27, %rax
	movq	%rdi, 40(%rsp)
	movq	%rdx, %r8
	movq	%rsi, %rdi
	xorq	%rax, %r8
	xorq	%rcx, %rdi
	movq	%rbx, 16(%rsp)
	xorq	%r8, %rsi
	xorq	%rdi, %rdx
	xorq	%rcx, %r8
	xorq	%rax, %rdi
	movq	%rsi, 280(%rsp)
	movq	%r8, 264(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%r10, 72(%rsp)
	movq	%r15, %rax
	movq	%r11, 64(%rsp)
	movq	%r15, 88(%rsp)
	movq	%r10, %rdx
	movq	%rdi, 248(%rsp)
	movq	-48(%rsp), %rcx
	movq	%r10, %rsi
	addq	-48(%rsp), %rdx
	addq	%r11, %rax
	addq	%r9, %rsi
	addq	%rax, %rsi
	movq	%r15, %rdi
	addq	%r13, %rcx
	addq	%rax, %rcx
	movq	%r11, %rax
	rorq	$53, %rcx
	rorq	$41, %rsi
	addq	%r12, %rdi
	addq	%r14, %rax
	addq	-8(%rsp), %rbx
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rsi, %rdi
	rorq	$5, %rdx
	rorq	$27, %rax
	xorq	%rcx, %rdi
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	%rdx, 200(%rsp)
	movq	%rdi, 184(%rsp)
	xorq	%r8, %rsi
	movq	(%rsp), %rdi
	xorq	%rcx, %r8
	addq	8(%rsp), %rdi
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	%rsi, 232(%rsp)
	movq	-8(%rsp), %rax
	movq	(%rsp), %rsi
	addq	%r13, %rcx
	movq	%r8, 216(%rsp)
	movq	%rbx, 56(%rsp)
	addq	%r12, %rdx
	addq	%rbx, %rcx
	movq	%rdi, 48(%rsp)
	addq	%r9, %rsi
	addq	%rdi, %rdx
	addq	%r14, %rax
	rorq	$53, %rcx
	addq	%rdi, %rax
	rorq	$5, %rdx
	addq	%rbx, %rsi
	rorq	$27, %rax
	movq	%rdx, %r8
	rorq	$41, %rsi
	movq	%rcx, %rdi
	xorq	%rax, %r8
	xorq	%rsi, %rdi
	movq	-72(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%rdi, %rdx
	xorq	%rcx, %r8
	xorq	%rax, %rdi
	addq	520(%rsp), %r9
	movq	%r8, 152(%rsp)
	movq	-88(%rsp), %r8
	movq	%rsi, 168(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rdi, 104(%rsp)
	movq	%r8, 648(%rsp)
	movq	%r9, 328(%rsp)
	.p2align 4,,10
	.p2align 3
.L60:
	addq	$1, 520(%rsp)
	movq	296(%rsp), %rcx
	movabsq	$-8247349341179448980, %r10
	xorq	520(%rsp), %rcx
	movq	360(%rsp), %rsi
	movabsq	$7860495443403156170, %r11
	movq	128(%rsp), %rax
	movq	504(%rsp), %rdx
	movabsq	$-6792583489299504353, %r14
	movq	504(%rsp), %rdi
	movabsq	$-3833335565246798826, %r12
	movabsq	$-1457182779415996031, %r13
	movabsq	$-6802927476391842224, %rbx
	movabsq	$-3329063056561552456, %r9
	addq	%rcx, %rsi
	addq	344(%rsp), %rcx
	addq	%rsi, %rax
	addq	312(%rsp), %rsi
	rolq	$37, %rax
	addq	%r10, %rcx
	movabsq	$-5426079245872290139, %r10
	rolq	$59, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r8
	xorq	%rcx, %rdx
	xorq	%rax, %r8
	xorq	%rdx, %rsi
	xorq	%rdx, %rax
	xorq	%r8, %rcx
	xorq	%r8, %rdi
	leaq	(%rcx,%rsi), %r8
	leaq	(%rdi,%rax), %rdx
	addq	%r14, %rdi
	addq	%r13, %rax
	addq	%rbx, %rcx
	movabsq	$-1087367646907149102, %r14
	addq	%r11, %r8
	addq	%r12, %rdx
	movabsq	$-6657276164713376882, %r11
	leaq	(%rdi,%r8), %r15
	movabsq	$2580067509209331373, %rdi
	addq	%r8, %rax
	addq	%rdi, %rsi
	addq	%rdx, %rcx
	rolq	$7, %rax
	addq	%rdx, %rsi
	rolq	$19, %r15
	rolq	$31, %rcx
	rolq	$53, %rsi
	movq	%r15, %rdi
	movabsq	$-1087367646907149102, %r8
	movq	%rsi, %rdx
	xorq	%rax, %rdi
	xorq	%rcx, %rdx
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	%rsi, %rbx
	movq	%rdx, 696(%rsp)
	movq	%r15, %r12
	movq	%rdi, %rdx
	addq	120(%rsp), %r12
	addq	264(%rsp), %rdx
	addq	280(%rsp), %rbx
	movq	696(%rsp), %rax
	addq	248(%rsp), %rax
	movq	%rsi, 632(%rsp)
	movq	%rdi, 728(%rsp)
	movq	%r15, 712(%rsp)
	movabsq	$-5426079245872290139, %r15
	leaq	(%r12,%rdx), %rsi
	addq	%r11, %r12
	addq	%r10, %rdx
	movq	232(%rsp), %r10
	leaq	(%rbx,%rax), %rcx
	addq	%r9, %rbx
	addq	%r8, %rax
	addq	%rsi, %rbx
	addq	%rsi, %rax
	movq	200(%rsp), %r8
	rolq	$19, %rbx
	addq	%rcx, %r12
	rolq	$7, %rax
	addq	%rcx, %rdx
	rolq	$53, %r12
	movq	%rbx, %r13
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r12, %rdi
	xorq	%rdx, %rdi
	xorq	%r13, %r12
	xorq	%rdx, %r13
	movq	216(%rsp), %rdx
	xorq	%rdi, %rbx
	xorq	%rax, %rdi
	movq	184(%rsp), %rax
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r13, %rdx
	leaq	(%r8,%rdx), %rsi
	addq	%rdi, %rax
	leaq	(%r10,%rax), %rcx
	addq	%r14, %rax
	addq	%r9, %r10
	addq	%rsi, %rax
	addq	%rsi, %r10
	movq	104(%rsp), %rsi
	rolq	$7, %rax
	rolq	$19, %r10
	addq	%r11, %r8
	addq	%r15, %rdx
	addq	%rcx, %r8
	movq	%r10, %r11
	addq	%rcx, %rdx
	rolq	$53, %r8
	xorq	%rax, %r11
	rolq	$31, %rdx
	movq	%r8, %r9
	movq	152(%rsp), %rcx
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	xorq	%r9, %r10
	movq	136(%rsp), %rdx
	xorq	%rax, %r9
	movq	168(%rsp), %rax
	addq	%r11, %rcx
	addq	%r9, %rsi
	addq	%r10, %rdx
	addq	%r8, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 744(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rsi
	xorq	%r14, %rax
	movabsq	$-3210636887397455352, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 664(%rsp)
	addq	%r8, %rsi
	movq	%r15, 616(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 600(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 744(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	712(%rsp), %r14
	rolq	$37, %rax
	addq	%rsi, %r10
	xorq	%rdx, %r9
	addq	%rcx, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r9, %r10
	xorq	%rax, %r9
	xorq	%rax, %r11
	leaq	(%r9,%rdi), %rax
	leaq	(%r10,%rbx), %rsi
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movabsq	$7667772426219706969, %rbx
	leaq	(%r11,%r13), %rdx
	addq	%r8, %r12
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%rax), %rdi
	addq	%r13, %r12
	leaq	(%rsi,%rdx), %rcx
	addq	%rbx, %rsi
	addq	%r15, %rdx
	addq	%rdi, %rdx
	addq	%rsi, %rdi
	movabsq	$6220970056051541820, %rsi
	rolq	$23, %rdi
	addq	%rsi, %rax
	addq	%rcx, %r12
	rolq	$11, %rdx
	addq	%rcx, %rax
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	movq	%r12, %r13
	xorq	%rdx, %rbx
	xorq	%rax, %r13
	movq	632(%rsp), %rsi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	696(%rsp), %rax
	movq	728(%rsp), %r15
	addq	%r12, %r14
	xorq	%r13, %rdi
	movq	%r14, 728(%rsp)
	xorq	%rdx, %r13
	movq	728(%rsp), %rdx
	addq	%rbx, %rax
	addq	%rdi, %rsi
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r13, %r15
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	728(%rsp), %r15
	rolq	$11, %rcx
	addq	%r14, %r15
	movabsq	$6220970056051541820, %r14
	addq	%r14, %rax
	movabsq	$4195444129992158507, %r14
	rolq	$23, %r15
	addq	%r14, %rsi
	addq	%rdx, %rax
	movq	%r15, %r14
	addq	%rdx, %rsi
	rolq	$37, %rax
	xorq	%rcx, %r14
	rolq	$59, %rsi
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	rolq	$31, %rcx
	xorq	%rcx, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	addq	%rsi, %rdi
	addq	%r12, %rcx
	movq	%r15, 728(%rsp)
	movq	%rdx, 712(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 632(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 696(%rsp)
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	movabsq	$-5426079245872290139, %r14
	addq	%rbx, %rdi
	leaq	(%rdi,%rdx), %r12
	movabsq	$-5426079245872290139, %rdi
	rolq	$7, %rax
	addq	%rdi, %r13
	movabsq	$-6657276164713376882, %rdi
	addq	%rcx, %rdi
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %rdi
	movq	%r12, %r13
	rolq	$53, %rdi
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%rdi, %rbx
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r11
	addq	%rdi, %r8
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r10), %rcx
	addq	%rbx, %r9
	leaq	(%r8,%r9), %rsi
	addq	%r15, %r9
	movq	664(%rsp), %r15
	leaq	(%rcx,%r11), %rdx
	addq	%r14, %r11
	leaq	(%r9,%rdx), %rax
	movabsq	$-3329063056561552456, %r9
	addq	%r9, %r8
	leaq	(%r8,%rdx), %r10
	leaq	(%r11,%rsi), %rdx
	movabsq	$-6657276164713376882, %r8
	addq	%rcx, %r8
	rolq	$7, %rax
	movq	616(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	744(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	600(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 744(%rsp)
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	addq	%r9, %rsi
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 664(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 616(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 600(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r9
	addq	%rsi, %r10
	rolq	$23, %r8
	leaq	(%r9,%rcx), %rax
	addq	%rcx, %r10
	rolq	$11, %rdx
	rolq	$59, %r10
	movq	%r8, %r9
	movq	%r14, 744(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	712(%rsp), %r14
	xorq	%r11, %r8
	xorq	%rdx, %r11
	xorq	%r9, %r10
	leaq	(%r8,%rdi), %rsi
	xorq	%rax, %r9
	addq	%r10, %r12
	addq	%r11, %r13
	addq	%r9, %rbx
	movabsq	$7667772426219706969, %rdi
	leaq	(%rsi,%rbx), %rax
	leaq	(%r12,%r13), %rcx
	addq	%r12, %rdi
	movabsq	$6220970056051541820, %r12
	addq	%r15, %r13
	movq	728(%rsp), %r15
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %rdi
	addq	%rsi, %r12
	leaq	(%rbx,%rcx), %rax
	rolq	$23, %rdi
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	632(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	696(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 728(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	728(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	rolq	$23, %r15
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 632(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 728(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 712(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 696(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rsi, %r13
	addq	%rbx, %rdi
	addq	%rdx, %rdi
	leaq	0(%r13,%rcx), %rdx
	movabsq	$-6657276164713376882, %r13
	addq	%r13, %r12
	rolq	$19, %rdi
	rolq	$7, %rax
	addq	%r12, %rcx
	rolq	$31, %rdx
	movq	%rdi, %r12
	rolq	$53, %rcx
	xorq	%rax, %r12
	movq	%rcx, %rsi
	xorq	%r12, %rcx
	xorq	%rdx, %r12
	xorq	%rdx, %rsi
	addq	%r12, %r11
	addq	%rcx, %r8
	xorq	%rsi, %rdi
	xorq	%rax, %rsi
	addq	%rdi, %r10
	addq	%rsi, %r9
	leaq	(%r10,%r11), %rdx
	leaq	(%r8,%r9), %rbx
	addq	%r14, %r8
	addq	%r15, %r9
	movabsq	$-5426079245872290139, %r15
	leaq	(%r8,%rdx), %r14
	movq	%r13, %r8
	addq	%r15, %r11
	addq	%r10, %r8
	leaq	(%r9,%rdx), %rax
	leaq	(%r11,%rbx), %rdx
	addq	%rbx, %r8
	rolq	$19, %r14
	movq	600(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	744(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	664(%rsp), %rax
	movq	616(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 744(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	744(%rsp), %r11
	rolq	$7, %rax
	addq	%rbx, %r11
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r9
	addq	%r10, %rdx
	movq	%r11, %rbx
	addq	%r10, %r9
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%rbx, %r9
	xorq	%rdx, %r10
	xorq	%rbx, %rdx
	xorq	%r10, %rax
	xorq	%r10, %r11
	movabsq	$1649971794476935487, %r10
	leaq	(%r9,%rax), %rbx
	addq	%r10, %rbx
	leaq	(%rdx,%r11), %r10
	movq	%r10, 744(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	744(%rsp), %r10
	movq	%r10, 744(%rsp)
	movabsq	$9059564915322872455, %r10
	addq	%r10, %rdx
	movabsq	$-7724133909308953704, %r10
	addq	%rbx, %rdx
	addq	%r10, %r11
	movabsq	$3257124934342745045, %r10
	rolq	$11, %rdx
	addq	%rbx, %r11
	addq	%r10, %r9
	movabsq	$8809261046177890769, %rbx
	addq	744(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	744(%rsp), %rax
	movq	%r11, %r10
	xorq	%rdx, %r10
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%rax, %rbx
	xorq	%rax, %r10
	addq	%r9, %r14
	xorq	%rbx, %r11
	xorq	%rdx, %rbx
	addq	%r10, %r13
	addq	%rbx, %r15
	addq	%r11, %r8
	movq	%r11, 664(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 616(%rsp)
	movq	%r9, 600(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 744(%rsp)
	movabsq	$-8247349341179448980, %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$7667772426219706969, %r9
	addq	%rbx, %r13
	addq	%r10, %r8
	addq	%rdx, %r15
	addq	%r14, %r9
	leaq	(%r15,%rax), %rdx
	movabsq	$-8247349341179448980, %r14
	addq	%rax, %r9
	leaq	0(%r13,%r11), %rax
	addq	%r8, %r11
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$11, %rdx
	rolq	$37, %rax
	movq	%r11, %r8
	movq	%r9, %r10
	xorq	%rax, %r8
	xorq	%rdx, %r10
	movabsq	$7667772426219706969, %r15
	xorq	%r8, %r9
	xorq	%r10, %r11
	xorq	%rdx, %r8
	xorq	%rax, %r10
	addq	%r9, %rcx
	addq	%r8, %r12
	leaq	(%r10,%rsi), %rax
	addq	%r11, %rdi
	leaq	(%rdi,%r12), %r13
	addq	%r14, %r12
	addq	%r15, %rdi
	leaq	(%rcx,%rax), %rsi
	addq	%rbx, %rax
	movabsq	$4195444129992158507, %rbx
	addq	%rbx, %rcx
	addq	%r13, %rax
	movq	728(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	addq	%rcx, %r13
	rolq	$23, %rsi
	movq	712(%rsp), %r12
	rolq	$59, %r13
	rolq	$11, %rdx
	movq	%rsi, %rbx
	movq	%r13, %rdi
	xorq	%rdx, %rbx
	rolq	$37, %rax
	xorq	%rbx, %r13
	xorq	%rax, %rdi
	xorq	%rax, %rbx
	addq	%r13, %r12
	xorq	%rdi, %rsi
	xorq	%rdx, %rdi
	movq	%r12, 728(%rsp)
	movq	696(%rsp), %rax
	addq	%rdi, %r15
	movq	632(%rsp), %r12
	movq	728(%rsp), %r14
	movabsq	$-8247349341179448980, %rdx
	addq	%rbx, %rax
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%rdx, %r15
	leaq	(%r12,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	728(%rsp), %r15
	rolq	$11, %rdx
	addq	%rcx, %r15
	movabsq	$6220970056051541820, %rcx
	addq	%rcx, %rax
	rolq	$23, %r15
	leaq	(%rax,%r14), %rcx
	movabsq	$4195444129992158507, %rax
	rolq	$37, %rcx
	addq	%rax, %r12
	addq	%r14, %r12
	movq	%r15, %r14
	rolq	$59, %r12
	xorq	%rdx, %r14
	movq	%r12, %rax
	xorq	%r14, %r12
	xorq	%rcx, %rax
	xorq	%r14, %rcx
	movabsq	$-2922945419276229487, %r14
	xorq	%rax, %rdx
	xorq	%rax, %r15
	leaq	(%rdx,%r12), %rax
	addq	%r14, %rax
	leaq	(%r15,%rcx), %r14
	movq	%r14, 728(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1584252685182818982, %r14
	addq	%r14, %rcx
	movabsq	$6378106504303230091, %r14
	addq	%r14, %r15
	movabsq	$-3482973570042694885, %r14
	addq	%rax, %rcx
	addq	%r14, %r12
	addq	%r15, %rax
	addq	728(%rsp), %r12
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	728(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r12
	movq	%r12, %r14
	xorq	%r15, %r12
	rolq	$31, %rdx
	addq	%r12, %rsi
	movq	%r12, 632(%rsp)
	xorq	%rdx, %r14
	xorq	%r15, %rdx
	movq	%r12, preCompInternalState(%rip)
	xorq	%r14, %rax
	movq	%r14, %r15
	addq	%rdx, %rdi
	xorq	%rcx, %r15
	addq	%rax, %r13
	movabsq	$-1087367646907149102, %rcx
	leaq	0(%r13,%rdi), %r14
	addq	%r15, %rbx
	movq	%rdx, preCompInternalState+8(%rip)
	leaq	(%rsi,%rbx), %r12
	addq	%rcx, %rbx
	movq	%rax, preCompInternalState+16(%rip)
	leaq	(%rbx,%r14), %rcx
	movabsq	$-3329063056561552456, %rbx
	movq	%r15, preCompInternalState+24(%rip)
	addq	%rbx, %rsi
	movabsq	$-6657276164713376882, %rbx
	addq	%rbx, %r13
	addq	%r14, %rsi
	movabsq	$-5426079245872290139, %r14
	leaq	0(%r13,%r12), %rbx
	addq	%r14, %rdi
	rolq	$19, %rsi
	addq	%r12, %rdi
	rolq	$7, %rcx
	movq	%rsi, %r14
	rolq	$53, %rbx
	rolq	$31, %rdi
	xorq	%rcx, %r14
	movq	%rbx, %r12
	xorq	%r14, %rbx
	xorq	%rdi, %r14
	xorq	%rdi, %r12
	addq	%rbx, %r9
	addq	%r14, %r8
	xorq	%r12, %rsi
	xorq	%rcx, %r12
	movabsq	$-3329063056561552456, %rdi
	addq	%r12, %r10
	addq	%rsi, %r11
	movq	%rsi, 568(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 680(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r14, 584(%rsp)
	addq	%rbx, %rdi
	addq	%r11, %rcx
	addq	%rbx, %rsi
	rolq	$19, %rdi
	rolq	$53, %rcx
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r10
	movq	%rcx, %r9
	xorq	%rsi, %r10
	xorq	%r8, %r9
	movq	616(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	600(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	744(%rsp), %r10
	addq	664(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 552(%rsp)
	movabsq	$-1087367646907149102, %r14
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	movq	%r12, 536(%rsp)
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	rolq	$19, %r11
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$7, %r10
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %r9
	xorq	%r13, %rbx
	xorq	%r12, %r11
	xorq	%r12, %r10
	movabsq	$-5486504877919021346, %r13
	movabsq	$853475092736589577, %r12
	movabsq	$-4925106476758491821, %r14
	movabsq	$1906713845121804688, %rcx
	addq	%r11, %r13
	addq	%r9, %rcx
	addq	%r10, %r14
	addq	%rbx, %r12
	movq	%r13, InternalState+104(%rip)
	movq	%r14, InternalState+112(%rip)
	movq	%r12, InternalState+96(%rip)
	addq	%rcx, %r14
	addq	%r13, %r12
	movq	%rcx, InternalState+120(%rip)
	movabsq	$2181267548300685623, %r13
	movabsq	$-7393874248442859403, %rcx
	addq	%rcx, %rbx
	addq	%r13, %r11
	movabsq	$1295863579293049999, %rcx
	addq	%r14, %rbx
	addq	%r11, %r14
	movabsq	$6102157975113963195, %r11
	addq	%r11, %r9
	addq	%rcx, %r10
	rolq	$23, %r14
	addq	%r12, %r10
	addq	%r9, %r12
	rolq	$11, %rbx
	rolq	$59, %r12
	rolq	$37, %r10
	movq	%r14, %r9
	movq	%r12, %r11
	xorq	%rbx, %r9
	xorq	%r10, %r11
	xorq	%r9, %r12
	xorq	%r10, %r9
	xorq	%r11, %r14
	xorq	%rbx, %r11
	movq	%r12, 696(%rsp)
	movq	%r14, 728(%rsp)
	movq	%r14, preCompInternalState+96(%rip)
	movq	%r14, %rcx
	movq	%r11, 712(%rsp)
	movq	%r11, preCompInternalState+104(%rip)
	addq	%r9, %rsi
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r9, 664(%rsp)
	addq	%r11, %r8
	addq	552(%rsp), %rcx
	addq	%r12, %rdi
	movq	%r9, preCompInternalState+120(%rip)
	movabsq	$-8247349341179448980, %r11
	movabsq	$7667772426219706969, %rbx
	leaq	(%rdi,%r8), %r10
	addq	%r8, %r11
	addq	%rdi, %rbx
	movabsq	$4195444129992158507, %r12
	movq	%r8, InternalState+64(%rip)
	movq	%rdi, InternalState+72(%rip)
	leaq	(%rcx,%rsi), %r9
	addq	%rcx, %r12
	movq	%rsi, InternalState+80(%rip)
	movq	%rcx, InternalState+88(%rip)
	addq	%r9, %r11
	addq	%r9, %rbx
	movabsq	$6220970056051541820, %r9
	addq	%rsi, %r9
	rolq	$11, %r11
	rolq	$23, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$37, %r9
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r13
	xorq	%r12, %r9
	movq	536(%rsp), %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%rbx, preCompInternalState+64(%rip)
	addq	680(%rsp), %rbx
	movabsq	$-8247349341179448980, %r13
	movq	%r11, preCompInternalState+72(%rip)
	addq	568(%rsp), %r10
	addq	%r9, %r12
	addq	584(%rsp), %r11
	movq	%r9, preCompInternalState+88(%rip)
	movq	%r12, InternalState+48(%rip)
	leaq	(%rbx,%r12), %r9
	movq	%rbx, InternalState+56(%rip)
	movq	%r10, InternalState+40(%rip)
	movq	%r11, InternalState+32(%rip)
	leaq	(%r10,%r11), %r14
	addq	%r13, %r11
	leaq	(%r11,%r9), %r13
	movabsq	$7667772426219706969, %r11
	addq	%r11, %r10
	movabsq	$4195444129992158507, %r11
	addq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$6220970056051541820, %r10
	rolq	$23, %r9
	addq	%r12, %r10
	addq	%r14, %r11
	rolq	$11, %r13
	addq	%r14, %r10
	rolq	$59, %r11
	movq	%r9, %r12
	rolq	$37, %r10
	movq	%r11, %rbx
	xorq	%r13, %r12
	xorq	%r10, %rbx
	movq	648(%rsp), %r14
	xorq	%r12, %r11
	xorq	%r12, %r10
	movq	632(%rsp), %r12
	xorq	%rbx, %r9
	xorq	%r13, %rbx
	leaq	(%r10,%r15), %r13
	addq	%rbx, %rdx
	addq	%r11, %rax
	movq	%r9, preCompInternalState+32(%rip)
	addq	%r9, %r12
	movq	%rbx, preCompInternalState+40(%rip)
	movq	%r11, preCompInternalState+48(%rip)
	movq	%r10, preCompInternalState+56(%rip)
	movq	%rdx, InternalState(%rip)
	movq	%rax, InternalState+8(%rip)
	movq	%r12, InternalState+24(%rip)
	movq	%r13, InternalState+16(%rip)
	xorq	(%r14), %rdx
	movq	%rdx, InternalState(%rip)
	xorq	8(%r14), %rax
	movq	%rax, InternalState+8(%rip)
	xorq	16(%r14), %r13
	movq	%rax, 744(%rsp)
	movq	%r13, InternalState+16(%rip)
	xorq	24(%r14), %r12
	movq	%r12, InternalState+24(%rip)
	xorq	32(%r14), %r8
	leaq	(%r12,%r13), %r15
	movq	%r8, InternalState+64(%rip)
	xorq	40(%r14), %rdi
	movq	%rdi, InternalState+72(%rip)
	xorq	48(%r14), %rsi
	movq	%rsi, InternalState+80(%rip)
	xorq	56(%r14), %rcx
	movq	%rdx, %r14
	addq	%rax, %r14
	movabsq	$-8247349341179448980, %rax
	addq	%rdx, %rax
	leaq	(%rax,%r15), %rdx
	movabsq	$7667772426219706969, %rax
	addq	744(%rsp), %rax
	rolq	$11, %rdx
	addq	%rax, %r15
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r13
	movabsq	$4195444129992158507, %rax
	rolq	$23, %r15
	addq	%rax, %r12
	addq	%r14, %r13
	movq	%r15, %rax
	addq	%r12, %r14
	rolq	$37, %r13
	xorq	%rdx, %rax
	rolq	$59, %r14
	movq	%r14, %r12
	xorq	%rax, %r14
	xorq	%r13, %rax
	xorq	%r13, %r12
	xorq	%r12, %rdx
	xorq	%r12, %r15
	movabsq	$7860495443403156170, %r12
	leaq	(%rdx,%r14), %r13
	addq	%r12, %r13
	leaq	(%r15,%rax), %r12
	movq	%r12, 744(%rsp)
	movabsq	$-3833335565246798826, %r12
	addq	744(%rsp), %r12
	movq	%r12, 744(%rsp)
	movabsq	$-1457182779415996031, %r12
	addq	%r12, %rax
	movabsq	$-6792583489299504353, %r12
	addq	%r12, %r15
	addq	%r13, %rax
	movabsq	$2580067509209331373, %r12
	addq	%r13, %r15
	movabsq	$-6802927476391842224, %r13
	rolq	$7, %rax
	rolq	$19, %r15
	addq	%r13, %rdx
	addq	744(%rsp), %rdx
	addq	%r12, %r14
	movq	744(%rsp), %r12
	addq	%r14, %r12
	movq	%r15, %r14
	rolq	$31, %rdx
	rolq	$53, %r12
	xorq	%rax, %r14
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rdx, %r14
	xorq	%rdx, %r13
	movq	%r12, 632(%rsp)
	addq	632(%rsp), %r9
	xorq	%r13, %r15
	addq	%r14, %rbx
	xorq	%rax, %r13
	movq	%r15, %r12
	addq	%r13, %r10
	movq	%r14, 616(%rsp)
	addq	%r11, %r12
	movq	%r15, 600(%rsp)
	movabsq	$-1087367646907149102, %r14
	leaq	(%r12,%rbx), %rdx
	movabsq	$-3329063056561552456, %r15
	movq	%r13, 744(%rsp)
	leaq	(%r9,%r10), %r13
	addq	%r14, %r10
	addq	%r15, %r9
	leaq	(%r10,%rdx), %rax
	leaq	(%r9,%rdx), %r11
	movabsq	$-5426079245872290139, %rdx
	addq	%rdx, %rbx
	movabsq	$-8247349341179448980, %r9
	movabsq	$7667772426219706969, %r10
	leaq	(%rbx,%r13), %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r12
	rolq	$7, %rax
	movq	%r11, %rbx
	addq	%r12, %r13
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r13
	movabsq	$4195444129992158507, %r14
	movabsq	$6220970056051541820, %r12
	movq	%r13, %r15
	xorq	%rbx, %r13
	xorq	%rdx, %rbx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	xorq	%r15, %r11
	xorq	%rax, %r15
	leaq	(%rdi,%r8), %rax
	addq	%r9, %r8
	addq	%rdx, %r8
	rolq	$11, %r8
	addq	%r10, %rdi
	addq	%r14, %rcx
	addq	%r12, %rsi
	addq	%rax, %rcx
	addq	%rdx, %rdi
	addq	%rax, %rsi
	rolq	$59, %rcx
	rolq	$23, %rdi
	rolq	$37, %rsi
	movq	%rcx, %r9
	movq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%r8, %r10
	movabsq	$-1087367646907149102, %rax
	xorq	%r9, %r8
	xorq	%r9, %rdi
	xorq	%r10, %rcx
	leaq	(%rbx,%r8), %rdx
	leaq	0(%r13,%rdi), %r9
	xorq	%r10, %rsi
	addq	%r11, %rcx
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %rdi
	leaq	(%rcx,%rdx), %r14
	leaq	(%r9,%rsi), %r12
	addq	%rsi, %rax
	addq	%rdi, %rdx
	movabsq	$-3329063056561552456, %rsi
	movabsq	$-6657276164713376882, %rdi
	addq	%rsi, %r9
	addq	%rcx, %rdi
	addq	%r14, %rax
	addq	%r14, %r9
	addq	%r12, %rdi
	addq	%r12, %rdx
	rolq	$53, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	xorq	%rdx, %r8
	movq	712(%rsp), %rcx
	xorq	%r10, %rdi
	movq	696(%rsp), %r12
	xorq	%rdx, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	movq	728(%rsp), %rax
	movq	664(%rsp), %r14
	addq	%r10, %rcx
	addq	%r9, %r12
	addq	%rdi, %rax
	leaq	(%r12,%rcx), %rsi
	movq	%rax, 728(%rsp)
	addq	%r8, %r14
	movq	%rax, %rdx
	movabsq	$-1087367646907149102, %rax
	addq	%r14, %rdx
	addq	%rax, %r14
	leaq	(%r14,%rsi), %rax
	movabsq	$-3329063056561552456, %r14
	addq	728(%rsp), %r14
	rolq	$7, %rax
	addq	%r14, %rsi
	movabsq	$-5426079245872290139, %r14
	addq	%r14, %rcx
	movabsq	$-6657276164713376882, %r14
	rolq	$19, %rsi
	addq	%r14, %r12
	addq	%rdx, %rcx
	movq	%rsi, %r14
	addq	%r12, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r14
	rolq	$53, %rdx
	movq	%rdx, %r12
	xorq	%r14, %rdx
	xorq	%rcx, %r12
	xorq	%r14, %rcx
	xorq	%r12, %rax
	xorq	%r12, %rsi
	movabsq	$-3210636887397455352, %r12
	leaq	(%rdx,%rax), %r14
	addq	%r12, %r14
	leaq	(%rcx,%rsi), %r12
	movq	%r12, 728(%rsp)
	movabsq	$5597446114060141266, %r12
	addq	728(%rsp), %r12
	movq	%r12, 728(%rsp)
	movabsq	$2199824780781266189, %r12
	addq	%r12, %rcx
	movabsq	$2818044418319133066, %r12
	addq	%r12, %rsi
	addq	%r14, %rcx
	movabsq	$2553129884740551573, %r12
	addq	%r14, %rsi
	movabsq	$4652647413905693402, %r14
	rolq	$11, %rcx
	rolq	$23, %rsi
	addq	%r14, %rax
	addq	728(%rsp), %rax
	addq	%r12, %rdx
	addq	728(%rsp), %rdx
	movq	%rsi, %r12
	xorq	%rcx, %r12
	rolq	$37, %rax
	rolq	$59, %rdx
	movq	%rdx, %r14
	xorq	%r12, %rdx
	xorq	%rax, %r12
	xorq	%rax, %r14
	addq	%r12, %r8
	addq	%rdx, %r9
	xorq	%r14, %rsi
	xorq	%rcx, %r14
	movq	%rsi, 728(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r14, 712(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r14
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r14, %r10
	movq	%rdx, 696(%rsp)
	addq	%rax, %rdi
	leaq	(%r10,%rax), %rdx
	movabsq	$4195444129992158507, %r9
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r8
	addq	%rsi, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	addq	%rcx, %r9
	rolq	$11, %rdx
	rolq	$59, %r9
	movq	%rdi, %r8
	movq	%r12, 664(%rsp)
	rolq	$37, %rax
	movq	%r9, %r10
	xorq	%rdx, %r8
	xorq	%rax, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	addq	%r9, %r11
	addq	%r10, %rbx
	addq	%r8, %r15
	addq	%rdi, %r13
	leaq	0(%r13,%r15), %rax
	leaq	(%r11,%rbx), %rcx
	addq	%r14, %rbx
	movabsq	$6220970056051541820, %rsi
	movabsq	$4195444129992158507, %r12
	movq	600(%rsp), %r14
	leaq	(%rbx,%rax), %rdx
	movabsq	$7667772426219706969, %rbx
	addq	%rsi, %r15
	addq	%rbx, %r11
	addq	%r13, %r12
	movq	632(%rsp), %rsi
	addq	%rax, %r11
	addq	%rcx, %r12
	leaq	(%r15,%rcx), %rax
	rolq	$23, %r11
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%r11, %rbx
	rolq	$37, %rax
	movq	%r12, %r13
	xorq	%rdx, %rbx
	xorq	%rax, %r13
	movq	616(%rsp), %r15
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	744(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r12, %r14
	addq	%r11, %rsi
	addq	%r13, %r15
	movabsq	$-8247349341179448980, %rcx
	addq	%rbx, %rax
	movq	%r14, 680(%rsp)
	addq	%r15, %r14
	leaq	(%rsi,%rax), %rdx
	addq	%rcx, %r15
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	680(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 744(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	744(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	744(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 632(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 616(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 600(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 744(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	rolq	$7, %rax
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r12
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r13
	movabsq	$-6657276164713376882, %r11
	addq	%rcx, %r11
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %r11
	movq	%r12, %r13
	rolq	$53, %r11
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r11, %rbx
	xorq	%r13, %r11
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r10
	addq	%r11, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r9), %rcx
	addq	%rbx, %r8
	leaq	(%rdi,%r8), %rsi
	addq	%r14, %rdi
	addq	%r15, %r8
	leaq	(%rcx,%r10), %rdx
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %r10
	leaq	(%rdi,%rdx), %r9
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r8,%rdx), %rax
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %rdx
	movq	712(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	664(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	696(%rsp), %rdx
	xorq	%rax, %r8
	movq	728(%rsp), %rax
	addq	%r10, %rcx
	addq	%r9, %rdx
	addq	%r8, %rsi
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 728(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	728(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r14, %rsi
	addq	%r15, %rcx
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	movabsq	$3378701480745353979, %r15
	addq	%r14, %rdx
	addq	%r15, %rax
	addq	728(%rsp), %rdx
	addq	728(%rsp), %rax
	rolq	$11, %rcx
	rolq	$23, %rsi
	movq	%rsi, %r14
	rolq	$37, %rax
	rolq	$59, %rdx
	xorq	%rcx, %r14
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r8
	addq	%rdx, %r9
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rdx, 696(%rsp)
	movq	%rsi, 728(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 712(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r9
	leaq	(%r10,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	addq	%rsi, %r9
	addq	%rax, %r8
	addq	%rcx, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	rolq	$59, %r9
	rolq	$11, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	movq	%r14, 664(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	600(%rsp), %r14
	xorq	%rax, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%r10, %rdi
	addq	%r8, %rbx
	xorq	%rdx, %r10
	leaq	(%rdi,%r11), %rsi
	addq	%r9, %r12
	addq	%r10, %r13
	leaq	(%r12,%r13), %rcx
	addq	%r15, %r13
	movabsq	$7667772426219706969, %r11
	leaq	(%rsi,%rbx), %rax
	addq	%r12, %r11
	movabsq	$6220970056051541820, %r12
	movq	616(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	rolq	$11, %rdx
	addq	%rax, %r11
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	rolq	$23, %r11
	leaq	(%rbx,%rcx), %rax
	addq	%rsi, %r12
	movq	%r11, %rbx
	addq	%rcx, %r12
	xorq	%rdx, %rbx
	rolq	$37, %rax
	rolq	$59, %r12
	movabsq	$-8247349341179448980, %rcx
	movq	%r12, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	addq	%r12, %r14
	xorq	%rax, %r13
	movq	%r14, 680(%rsp)
	movq	744(%rsp), %rax
	xorq	%r13, %r11
	movq	632(%rsp), %rsi
	xorq	%rdx, %r13
	addq	%r13, %r15
	addq	%rbx, %rax
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%r11, %rsi
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	680(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%rax, %rdx
	xorq	%rdx, %r15
	xorq	%rdx, %rcx
	xorq	%r14, %rsi
	leaq	(%rcx,%rsi), %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	744(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	744(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 632(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 616(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 600(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 744(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r12
	movabsq	$-5426079245872290139, %r11
	rolq	$7, %rax
	addq	%r11, %r13
	movabsq	$-6657276164713376882, %r11
	leaq	0(%r13,%rsi), %rdx
	addq	%rcx, %r11
	rolq	$19, %r12
	movq	%r12, %r13
	rolq	$31, %rdx
	addq	%rsi, %r11
	xorq	%rax, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %r11
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r10
	addq	%r11, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r9), %rcx
	addq	%rbx, %r8
	leaq	(%rdi,%r8), %rsi
	addq	%r14, %rdi
	addq	%r15, %r8
	leaq	(%rcx,%r10), %rdx
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %r10
	leaq	(%rdi,%rdx), %r9
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r8,%rdx), %rax
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %rdx
	movq	712(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	664(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	696(%rsp), %rdx
	xorq	%rax, %r8
	movq	728(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 728(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	rolq	$7, %rax
	addq	728(%rsp), %rsi
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$1649971794476935487, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1915007920973660762, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$9059564915322872455, %r14
	addq	%r14, %rcx
	movabsq	$-7724133909308953704, %r14
	addq	%r14, %rsi
	movabsq	$3257124934342745045, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$8809261046177890769, %r15
	addq	728(%rsp), %rdx
	addq	%r15, %rax
	addq	728(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%rax, %r15
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	movq	%rsi, 728(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r8
	addq	%rdx, %r9
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 712(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movq	%rdx, 696(%rsp)
	movabsq	$4195444129992158507, %r9
	leaq	(%r10,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r8
	addq	%rsi, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	addq	%rcx, %r9
	rolq	$11, %rdx
	rolq	$59, %r9
	movq	%rdi, %r8
	movq	%r14, 664(%rsp)
	rolq	$37, %rax
	movq	%r9, %r10
	xorq	%rdx, %r8
	xorq	%rax, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	addq	%r9, %r12
	leaq	(%rdi,%r11), %rsi
	addq	%r10, %r13
	addq	%r8, %rbx
	movabsq	$7667772426219706969, %r11
	leaq	(%r12,%r13), %rcx
	addq	%r15, %r13
	leaq	(%rsi,%rbx), %rax
	addq	%r12, %r11
	movabsq	$6220970056051541820, %r12
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	movq	616(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %r11
	leaq	(%rbx,%rcx), %rax
	addq	%rsi, %r12
	rolq	$23, %r11
	movq	632(%rsp), %rsi
	rolq	$11, %rdx
	rolq	$37, %rax
	addq	%rcx, %r12
	rolq	$59, %r12
	movq	%r11, %rbx
	movq	600(%rsp), %r14
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movabsq	$-8247349341179448980, %rcx
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	744(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movq	%r14, 680(%rsp)
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	680(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2922945419276229487, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 744(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1584252685182818982, %r14
	addq	%r14, %rax
	movabsq	$6378106504303230091, %r14
	addq	%rdx, %rax
	addq	%r14, %r15
	movabsq	$-3482973570042694885, %r14
	addq	%r15, %rdx
	movabsq	$6923416813890349993, %r15
	addq	%r14, %rsi
	addq	%r15, %rcx
	addq	744(%rsp), %rsi
	addq	744(%rsp), %rcx
	rolq	$19, %rdx
	rolq	$7, %rax
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$31, %rcx
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%r15, 616(%rsp)
	addq	616(%rsp), %r13
	xorq	%rcx, %r14
	xorq	%r14, %rdx
	movq	%r14, %r15
	addq	%rsi, %r11
	xorq	%rax, %r15
	addq	%rdx, %r12
	movq	%rdx, 600(%rsp)
	addq	%r15, %rbx
	movabsq	$-1087367646907149102, %rax
	movq	%rsi, 632(%rsp)
	leaq	(%r12,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%rax, %rbx
	movabsq	$-3329063056561552456, %rax
	movabsq	$-1087367646907149102, %r14
	leaq	(%rbx,%rdx), %rcx
	addq	%r11, %rax
	movabsq	$-6657276164713376882, %rbx
	addq	%rdx, %rax
	addq	%rbx, %r12
	movabsq	$-5426079245872290139, %rdx
	addq	%r13, %rdx
	addq	%rsi, %r12
	rolq	$19, %rax
	addq	%rsi, %rdx
	rolq	$53, %r12
	rolq	$7, %rcx
	rolq	$31, %rdx
	movq	%rax, %r11
	movq	%r12, %rsi
	xorq	%rcx, %r11
	xorq	%rdx, %rsi
	xorq	%rsi, %rax
	xorq	%r11, %r12
	xorq	%rcx, %rsi
	addq	%rsi, %r8
	addq	%r12, %rdi
	movq	%rsi, 680(%rsp)
	movabsq	$-1087367646907149102, %rsi
	xorq	%r11, %rdx
	leaq	(%rdi,%r8), %rcx
	addq	%r8, %rsi
	movabsq	$-3329063056561552456, %r8
	addq	%rdx, %r10
	addq	%rax, %r9
	addq	%r8, %rdi
	movabsq	$-5426079245872290139, %r8
	leaq	(%r9,%r10), %r11
	addq	%r10, %r8
	addq	%rbx, %r9
	addq	%rcx, %r8
	addq	%r9, %rcx
	movq	712(%rsp), %rbx
	addq	%r11, %rdi
	rolq	$53, %rcx
	addq	%r11, %rsi
	rolq	$19, %rdi
	rolq	$31, %r8
	movq	%rcx, %r9
	xorq	%r8, %r9
	rolq	$7, %rsi
	movq	%rdi, %r10
	xorq	%rsi, %r10
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	696(%rsp), %r9
	xorq	%r10, %rcx
	xorq	%r10, %r8
	movq	728(%rsp), %r11
	movq	664(%rsp), %r10
	addq	%r8, %rbx
	movq	%r12, 744(%rsp)
	addq	%rdi, %r9
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	addq	%rcx, %r11
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	movabsq	$-3329063056561552456, %r14
	addq	%r13, %r10
	rolq	$7, %r10
	addq	%r14, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$19, %r11
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r9
	xorq	%r12, %r11
	xorq	%r12, %r10
	movabsq	$853475092736589577, %r12
	addq	%rbx, %r12
	movabsq	$-4925106476758491821, %r14
	movabsq	$-5486504877919021346, %r13
	movq	%r12, 712(%rsp)
	movabsq	$1906713845121804688, %r12
	addq	%r10, %r14
	addq	%r9, %r12
	addq	%r11, %r13
	addq	%r12, %r14
	movq	712(%rsp), %r12
	addq	%r13, %r12
	movabsq	$-7393874248442859403, %r13
	addq	%r13, %rbx
	movabsq	$2181267548300685623, %r13
	addq	%r13, %r11
	addq	%r14, %rbx
	movabsq	$6102157975113963195, %r13
	addq	%r11, %r14
	movabsq	$1295863579293049999, %r11
	addq	%r13, %r9
	addq	%r11, %r10
	rolq	$11, %rbx
	rolq	$23, %r14
	addq	%r12, %r10
	addq	%r9, %r12
	movq	%r14, %r9
	rolq	$37, %r10
	rolq	$59, %r12
	xorq	%rbx, %r9
	movq	%r12, %r13
	xorq	%r9, %r12
	movabsq	$-8247349341179448980, %r11
	xorq	%r10, %r13
	xorq	%r9, %r10
	addq	%r12, %rdi
	xorq	%r13, %r14
	addq	%r10, %rsi
	xorq	%r13, %rbx
	addq	%r14, %rcx
	addq	%rbx, %r8
	movabsq	$7667772426219706969, %rbx
	leaq	(%rcx,%rsi), %r9
	addq	%r8, %r11
	addq	%rdi, %rbx
	leaq	(%rdi,%r8), %r10
	movabsq	$4195444129992158507, %r12
	movabsq	$-8247349341179448980, %r14
	addq	%r9, %r11
	addq	%r9, %rbx
	movabsq	$6220970056051541820, %r9
	addq	%rcx, %r12
	addq	%rsi, %r9
	rolq	$23, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$11, %r11
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r9
	addq	680(%rsp), %r9
	xorq	%r13, %rbx
	addq	744(%rsp), %rbx
	xorq	%r13, %r11
	xorq	%r12, %r10
	addq	%rdx, %r11
	movabsq	$6220970056051541820, %rdx
	addq	%rax, %r10
	movabsq	$7667772426219706969, %rax
	leaq	(%r10,%r11), %r13
	addq	%r14, %r11
	addq	%rax, %r10
	leaq	(%rbx,%r9), %r12
	addq	%rdx, %r9
	addq	%r8, 408(%rsp)
	addq	%r13, %r9
	addq	%rdi, 488(%rsp)
	addq	%r12, %r11
	addq	%r12, %r10
	movabsq	$4195444129992158507, %r12
	addq	%r12, %rbx
	rolq	$23, %r10
	rolq	$11, %r11
	addq	%rbx, %r13
	rolq	$37, %r9
	movq	%r10, %rax
	rolq	$59, %r13
	xorq	%r11, %rax
	movq	%r13, %rdx
	xorq	%rax, %r13
	addq	600(%rsp), %r13
	xorq	%r9, %rdx
	xorq	%rax, %r9
	addq	%r13, 440(%rsp)
	xorq	%rdx, %r10
	xorq	%rdx, %r11
	addq	632(%rsp), %r10
	addq	616(%rsp), %r11
	addq	%r15, %r9
	addq	%r10, 376(%rsp)
	addq	%r11, 392(%rsp)
	addq	%r9, 424(%rsp)
	addq	%rsi, 472(%rsp)
	addq	%rcx, 456(%rsp)
	addq	$64, 648(%rsp)
	movq	328(%rsp), %r13
	cmpq	%r13, 520(%rsp)
	jne	.L60
	vmovq	424(%rsp), %xmm8
	movq	-72(%rsp), %rdx
	vmovq	392(%rsp), %xmm9
	vpinsrq	$1, 440(%rsp), %xmm9, %xmm1
	vmovq	472(%rsp), %xmm11
	salq	$3, %rdx
	vpinsrq	$1, 376(%rsp), %xmm8, %xmm0
	vmovq	408(%rsp), %xmm2
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 488(%rsp), %xmm2, %xmm1
	vmovdqa	%ymm0, 776(%rsp)
	vpinsrq	$1, 456(%rsp), %xmm11, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 808(%rsp)
.L59:
	movq	16(%rbp), %rax
	andl	$63, %eax
	jne	.L61
	movq	776(%rsp), %r11
	movq	792(%rsp), %r10
	movq	832(%rsp), %r13
	movq	784(%rsp), %r8
	movq	824(%rsp), %r9
	movq	800(%rsp), %r12
	movq	816(%rsp), %r14
	movq	808(%rsp), %r15
	movq	%r11, %rdx
	movq	%r10, 664(%rsp)
	movq	%r11, 600(%rsp)
	movq	%r8, %r10
	movq	%r13, 344(%rsp)
	movq	664(%rsp), %rdi
	movq	344(%rsp), %r11
	movq	%r9, 328(%rsp)
	movq	%r14, %rsi
	movq	%r8, 616(%rsp)
	movq	%r12, 696(%rsp)
	movq	%r12, %r9
	movq	%r14, 128(%rsp)
	movq	%r15, 312(%rsp)
.L62:
	xorq	-56(%rsp), %rdi
	xorq	-64(%rsp), %r9
	movabsq	$-8247349341179448980, %rcx
	xorq	296(%rsp), %rdx
	xorq	360(%rsp), %r10
	movabsq	$4195444129992158507, %r14
	movq	328(%rsp), %r8
	xorq	64(%rsp), %r8
	movabsq	$-1376848230519552085, %r13
	xorq	72(%rsp), %rsi
	xorq	88(%rsp), %r11
	movabsq	$-9209400399786843361, %rbx
	leaq	(%r9,%rdi), %rax
	addq	%r14, %r9
	xorq	-48(%rsp), %r15
	movq	%r8, 64(%rsp)
	leaq	(%rdx,%r10), %r8
	addq	%rcx, %rdx
	movq	%rsi, 72(%rsp)
	leaq	(%rdx,%rax), %rsi
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %r10
	leaq	(%r9,%r8), %r12
	movq	%r11, 88(%rsp)
	addq	%rax, %r10
	movabsq	$6220970056051541820, %rax
	rolq	$11, %rsi
	addq	%rax, %rdi
	rolq	$23, %r10
	rolq	$59, %r12
	addq	%r8, %rdi
	movq	%r10, %r9
	movq	%r12, %r8
	rolq	$37, %rdi
	xorq	%rsi, %r9
	movabsq	$-6792583489299504353, %r11
	xorq	%rdi, %r8
	xorq	%r9, %r12
	xorq	%rdi, %r9
	xorq	%r8, %rsi
	xorq	%r8, %r10
	addq	%rbx, %r12
	addq	%r13, %rsi
	movabsq	$-369815132508846929, %rdi
	movabsq	$-3463520432737951897, %rbx
	movabsq	$-1087367646907149102, %r8
	addq	%rdi, %r9
	addq	%r10, %rbx
	leaq	(%rsi,%r12), %rdi
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r11, %r10
	addq	%rdi, %r9
	rolq	$7, %r9
	addq	%rdi, %r10
	movabsq	$-5426079245872290139, %rdi
	addq	%rdi, %rsi
	rolq	$19, %r10
	leaq	(%rsi,%rbx), %r11
	movabsq	$-6657276164713376882, %rsi
	movq	%r10, %r13
	addq	%rsi, %r12
	xorq	%r9, %r13
	addq	%r12, %rbx
	rolq	$31, %r11
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	-32(%rsp), %r11
	movq	%rbx, 744(%rsp)
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	-16(%rsp), %r9
	movq	%r10, 584(%rsp)
	movq	%r12, 568(%rsp)
	movq	-40(%rsp), %r10
	movq	-24(%rsp), %r12
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	40(%rsp), %r11
	addq	32(%rsp), %r9
	movq	%r13, 680(%rsp)
	addq	%rdx, %r10
	addq	%r14, %r12
	addq	40(%rsp), %r10
	addq	32(%rsp), %r12
	rolq	$11, %r11
	rolq	$37, %r9
	rolq	$23, %r10
	rolq	$59, %r12
	movq	%r10, %rbx
	movq	%r12, %r13
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r12
	xorq	%rbx, %r9
	addq	584(%rsp), %r12
	addq	568(%rsp), %r9
	xorq	%r13, %r11
	addq	680(%rsp), %r11
	xorq	%r10, %r13
	addq	744(%rsp), %r13
	movq	%r13, 728(%rsp)
	movq	%r13, %rbx
	movabsq	$-3329063056561552456, %r13
	addq	728(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%r9, %rbx
	addq	%rsi, %r12
	addq	%r8, %r9
	addq	%rdi, %r11
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	addq	%r13, %r10
	movq	%rbx, %r12
	rolq	$19, %r10
	xorq	%r11, %r12
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r10, 504(%rsp)
	xorq	%r13, %rbx
	xorq	%r11, %r13
	leaq	(%r15,%rcx), %r11
	movq	%rbx, 536(%rsp)
	movq	%r13, 552(%rsp)
	movq	%r12, 488(%rsp)
	movq	88(%rsp), %r9
	movq	72(%rsp), %r10
	addq	64(%rsp), %r9
	movq	72(%rsp), %rbx
	movq	88(%rsp), %r12
	addq	%rdx, %r10
	addq	%r9, %r11
	addq	%r9, %r10
	movq	64(%rsp), %r9
	addq	%r15, %rbx
	addq	%r14, %r12
	rolq	$23, %r10
	addq	%rbx, %r12
	rolq	$11, %r11
	movabsq	$-3329063056561552456, %r15
	addq	%rax, %r9
	addq	%rbx, %r9
	movq	%r10, %rbx
	rolq	$37, %r9
	rolq	$59, %r12
	xorq	%r11, %rbx
	movq	%r12, %r13
	xorq	%rbx, %r12
	addq	504(%rsp), %r12
	xorq	%r9, %r13
	xorq	%rbx, %r9
	addq	488(%rsp), %r9
	xorq	%r13, %r11
	addq	552(%rsp), %r11
	xorq	%r10, %r13
	addq	536(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	rolq	$19, %r10
	rolq	$7, %r9
	addq	%rbx, %r11
	movq	%r10, %r13
	addq	%r12, %rbx
	rolq	$31, %r11
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	movq	%rbx, 648(%rsp)
	movq	8(%rsp), %rbx
	xorq	%r11, %r12
	xorq	%r12, %r10
	movq	16(%rsp), %r11
	xorq	%r9, %r12
	movq	(%rsp), %r9
	movq	%r10, 728(%rsp)
	addq	%rcx, %rbx
	addq	56(%rsp), %rbx
	movq	-8(%rsp), %r10
	movq	%r13, 632(%rsp)
	movq	%r12, 712(%rsp)
	addq	%rdx, %r9
	rolq	$11, %rbx
	addq	56(%rsp), %r9
	addq	%r14, %r11
	addq	48(%rsp), %r11
	addq	%rax, %r10
	addq	48(%rsp), %r10
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$37, %r10
	movq	%r9, %r13
	movq	%r11, %r12
	xorq	%rbx, %r13
	xorq	%r10, %r12
	xorq	%r13, %r11
	addq	728(%rsp), %r11
	xorq	%r12, %rbx
	addq	632(%rsp), %rbx
	xorq	%r13, %r10
	movq	648(%rsp), %r13
	addq	712(%rsp), %r10
	xorq	%r12, %r9
	addq	%r9, %r13
	leaq	(%r11,%rbx), %r12
	addq	%rsi, %r11
	leaq	0(%r13,%r10), %r9
	addq	%r8, %r10
	leaq	(%r10,%r12), %r15
	movabsq	$-3329063056561552456, %r10
	addq	%r10, %r13
	leaq	(%rbx,%rdi), %r10
	movabsq	$-7999569951748836447, %rbx
	addq	%r12, %r13
	leaq	(%r11,%r9), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%r9, %r10
	rolq	$53, %r12
	rolq	$31, %r10
	movq	%r13, %r11
	movq	%r12, %r9
	xorq	%r15, %r11
	xorq	%r10, %r9
	xorq	%r11, %r12
	xorq	%r10, %r11
	xorq	%r9, %r13
	movabsq	$-4849728007900573903, %r10
	addq	%rbx, %r11
	addq	%r10, %r13
	movabsq	$-1642314245251606934, %rbx
	xorq	%r15, %r9
	movabsq	$-1568322642145848418, %r15
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	addq	%r15, %r9
	addq	%rdx, %r13
	addq	%rcx, %r11
	addq	%r9, %rbx
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$2553129884740551573, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r13
	movq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r9, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r13, 424(%rsp)
	movq	%rbx, %r12
	movq	424(%rsp), %r9
	addq	648(%rsp), %r12
	addq	712(%rsp), %r9
	movq	%r11, 456(%rsp)
	movq	%r10, %r13
	addq	632(%rsp), %r11
	addq	728(%rsp), %r13
	movq	%rbx, 472(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%r9,%r12), %rbx
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$11, %r11
	rolq	$23, %rbx
	addq	%rax, %r9
	addq	%r14, %r12
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$37, %r9
	movq	%rbx, %r12
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r10, %r13
	movq	%rbx, 712(%rsp)
	addq	504(%rsp), %r13
	addq	488(%rsp), %r9
	movq	%r11, 408(%rsp)
	movq	%r12, 376(%rsp)
	addq	552(%rsp), %r11
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%r10, 392(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$11, %r11
	rolq	$37, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	movq	%r11, %r15
	xorq	%r9, %r13
	xorq	%r11, %r12
	movq	680(%rsp), %r11
	xorq	%r13, %r15
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 648(%rsp)
	movq	%r10, %r13
	addq	744(%rsp), %rbx
	addq	584(%rsp), %r13
	movq	%r12, %r9
	addq	568(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%r10, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-2292595471992902602, %rbx
	addq	%rbx, %r11
	movabsq	$-5006043190370284386, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r9
	movabsq	$8467826889434979867, %r13
	movabsq	$6028102484886760763, %rbx
	addq	744(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$2699039428325208307, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$19, %r10
	addq	%rdi, %r11
	addq	%rsi, %r12
	addq	%rbx, %r11
	movq	%r10, %r13
	addq	%r12, %rbx
	rolq	$31, %r11
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 680(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, %r13
	movq	%r12, 568(%rsp)
	addq	648(%rsp), %r13
	movq	%r10, %r12
	movq	568(%rsp), %r9
	addq	632(%rsp), %r12
	addq	%r15, %r11
	addq	728(%rsp), %r9
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 744(%rsp)
	movq	%r10, 584(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$31, %r11
	rolq	$7, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r13, 552(%rsp)
	movq	%r13, %r11
	movq	%r12, 488(%rsp)
	addq	408(%rsp), %r11
	movq	%r10, %r12
	movq	488(%rsp), %r9
	addq	392(%rsp), %r12
	movq	%rbx, %r13
	addq	376(%rsp), %r9
	addq	712(%rsp), %r13
	movq	%rbx, 536(%rsp)
	movq	%r10, 504(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	movq	%rbx, 648(%rsp)
	xorq	%r9, %r12
	movq	%r10, 728(%rsp)
	movq	%r13, %r10
	movq	728(%rsp), %r11
	addq	456(%rsp), %r10
	addq	440(%rsp), %r11
	movq	%r13, 632(%rsp)
	movq	%r12, %r13
	movq	%r12, 712(%rsp)
	addq	424(%rsp), %r13
	movq	%rbx, %r12
	addq	472(%rsp), %r12
	leaq	(%r11,%r10), %rbx
	addq	%rdi, %r10
	leaq	(%r12,%r13), %r9
	addq	%r8, %r13
	leaq	0(%r13,%rbx), %r15
	movabsq	$-3329063056561552456, %r13
	addq	%r13, %r12
	addq	%r9, %r10
	leaq	(%r12,%rbx), %r13
	rolq	$7, %r15
	movabsq	$5953845371152580681, %rbx
	rolq	$19, %r13
	rolq	$31, %r10
	addq	%rsi, %r11
	leaq	(%r11,%r9), %r12
	movq	%r13, %r11
	xorq	%r15, %r11
	rolq	$53, %r12
	movq	%r12, %r9
	xorq	%r11, %r12
	xorq	%r10, %r11
	xorq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$-7646712092252898442, %r10
	xorq	%r9, %r13
	movabsq	$-7946738593435294165, %rbx
	xorq	%r15, %r9
	movabsq	$-2842268575306187841, %r15
	addq	%r10, %r13
	addq	%r12, %rbx
	addq	%r15, %r9
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$-3751294463443135658, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r13
	movq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r9, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r13, 424(%rsp)
	movq	%r11, 456(%rsp)
	movq	%r10, %r13
	addq	632(%rsp), %r11
	movq	424(%rsp), %r9
	addq	728(%rsp), %r13
	movq	%rbx, %r12
	addq	712(%rsp), %r9
	addq	648(%rsp), %r12
	movq	%rbx, 472(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 408(%rsp)
	movq	%r10, %r13
	addq	552(%rsp), %r11
	addq	504(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 376(%rsp)
	addq	488(%rsp), %r9
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%rbx, 712(%rsp)
	movq	%r10, 392(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$11, %r11
	rolq	$23, %rbx
	rolq	$37, %r9
	addq	%r14, %r12
	movq	%r11, %r15
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	680(%rsp), %r11
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	addq	568(%rsp), %r9
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r10, %r13
	movq	%rbx, 648(%rsp)
	addq	584(%rsp), %r13
	addq	%r15, %r11
	addq	744(%rsp), %rbx
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r12
	xorq	%r10, %r9
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-824919486193887165, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r11
	movabsq	$-1914029582460860148, %r13
	movabsq	$6609752215332129920, %rbx
	addq	%r13, %r12
	movabsq	$7484883476188376383, %r13
	addq	%rbx, %r9
	movabsq	$-7632797540959622777, %rbx
	addq	744(%rsp), %rbx
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$7, %r9
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 744(%rsp)
	movq	%r13, %r11
	movq	%r12, 568(%rsp)
	movq	%r13, 680(%rsp)
	movq	%r10, %r12
	movq	568(%rsp), %r9
	addq	632(%rsp), %r12
	addq	728(%rsp), %r9
	movq	%rbx, %r13
	addq	648(%rsp), %r13
	addq	%r15, %r11
	movq	%r10, 584(%rsp)
	movabsq	$-3329063056561552456, %r15
	leaq	(%r11,%r12), %r10
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$7, %r9
	rolq	$19, %r10
	rolq	$31, %r11
	addq	%rsi, %r12
	movq	%r10, %r13
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 552(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	addq	408(%rsp), %r11
	movq	%r12, 488(%rsp)
	movq	%rbx, %r13
	movq	%r10, %r12
	addq	712(%rsp), %r13
	addq	392(%rsp), %r12
	movq	488(%rsp), %r9
	addq	376(%rsp), %r9
	movq	%rbx, 536(%rsp)
	movq	%r10, 504(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r10, 728(%rsp)
	movq	%r13, %r10
	movq	728(%rsp), %r11
	addq	456(%rsp), %r10
	addq	440(%rsp), %r11
	movq	%r13, 632(%rsp)
	movq	%r12, %r13
	movq	%r12, 712(%rsp)
	addq	424(%rsp), %r13
	movq	%rbx, %r12
	addq	472(%rsp), %r12
	movq	%rbx, 648(%rsp)
	leaq	(%r11,%r10), %rbx
	addq	%rsi, %r11
	addq	%rdi, %r10
	leaq	(%r12,%r13), %r9
	addq	%r8, %r13
	leaq	0(%r13,%rbx), %r15
	movabsq	$-3329063056561552456, %r13
	addq	%r13, %r12
	addq	%r9, %r10
	leaq	(%r12,%rbx), %r13
	leaq	(%r11,%r9), %r12
	rolq	$7, %r15
	rolq	$31, %r10
	movabsq	$-1139829817207230181, %rbx
	rolq	$19, %r13
	rolq	$53, %r12
	movq	%r13, %r11
	movq	%r12, %r9
	xorq	%r15, %r11
	xorq	%r10, %r9
	xorq	%r11, %r12
	xorq	%r10, %r11
	xorq	%r9, %r13
	addq	%rbx, %r11
	xorq	%r15, %r9
	movabsq	$3054837738180890943, %r10
	movabsq	$2588290990126348949, %r15
	movabsq	$-938319195649413462, %rbx
	addq	%r10, %r13
	addq	%r15, %r9
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	addq	%r9, %rbx
	addq	%rdx, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%rax, %r9
	addq	%r13, %rbx
	movabsq	$3257124934342745045, %r13
	addq	%r10, %r9
	rolq	$11, %r11
	addq	%r13, %r12
	rolq	$37, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	movq	%rbx, %r13
	rolq	$59, %r10
	xorq	%r11, %r13
	movq	%r10, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r9, %r12
	movq	%r13, 424(%rsp)
	movq	%r10, %r13
	xorq	%r12, %rbx
	xorq	%r12, %r11
	addq	728(%rsp), %r13
	movq	%r11, 456(%rsp)
	movq	424(%rsp), %r9
	movq	%rbx, %r12
	addq	632(%rsp), %r11
	addq	712(%rsp), %r9
	addq	648(%rsp), %r12
	movq	%rbx, 472(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%rbx, 712(%rsp)
	movq	%r10, %r13
	movq	%r11, 408(%rsp)
	addq	504(%rsp), %r13
	movq	%r12, %r9
	addq	552(%rsp), %r11
	addq	488(%rsp), %r9
	movq	%r12, 376(%rsp)
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%r10, 392(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$11, %r11
	rolq	$37, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	movq	%r11, %r15
	xorq	%r9, %r13
	xorq	%r11, %r12
	movq	680(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r13, %r15
	movq	%rbx, 648(%rsp)
	movq	%r10, %r13
	addq	744(%rsp), %rbx
	addq	584(%rsp), %r13
	movq	%r12, %r9
	addq	568(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$11, %r11
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%r10, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-6097248013946911484, %rbx
	addq	%rbx, %r11
	movabsq	$-496885038275669880, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r9
	movabsq	$3174302594670681997, %r13
	movabsq	$-8739574512844769069, %rbx
	addq	744(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$6378106504303230091, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$19, %r10
	addq	%r12, %rbx
	rolq	$7, %r9
	rolq	$53, %rbx
	movq	%r10, %r13
	rolq	$31, %r11
	xorq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	movq	%r13, %r11
	xorq	%r9, %r12
	addq	%r15, %r11
	movq	%rbx, 680(%rsp)
	movq	%r13, 584(%rsp)
	movq	%r10, %rbx
	movq	%r12, %r9
	addq	632(%rsp), %rbx
	addq	728(%rsp), %r9
	movq	680(%rsp), %r13
	movabsq	$-3329063056561552456, %r15
	addq	648(%rsp), %r13
	movq	%r10, 568(%rsp)
	movq	%r12, 536(%rsp)
	leaq	(%r11,%rbx), %r12
	addq	%rsi, %rbx
	addq	%rdi, %r11
	leaq	(%r9,%r13), %r10
	addq	%r8, %r9
	addq	%r15, %r13
	addq	%r12, %r9
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$19, %r13
	addq	%r10, %r11
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r13, %rbx
	rolq	$53, %r12
	xorq	%r9, %rbx
	movq	%r12, %r10
	xorq	%rbx, %r12
	xorq	%r11, %rbx
	xorq	%r11, %r10
	movq	%r12, 552(%rsp)
	movq	%rbx, %r11
	xorq	%r10, %r13
	xorq	%r9, %r10
	addq	408(%rsp), %r11
	movq	%r13, 488(%rsp)
	movq	%r13, %r12
	movq	%r10, %r9
	addq	392(%rsp), %r12
	addq	376(%rsp), %r9
	movq	552(%rsp), %r13
	addq	712(%rsp), %r13
	movq	%rbx, 504(%rsp)
	movq	%r10, 360(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r10
	rolq	$53, %rbx
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	movq	%rbx, 648(%rsp)
	xorq	%r9, %r12
	movq	%r10, 728(%rsp)
	movq	%r13, %r11
	addq	440(%rsp), %r10
	addq	456(%rsp), %r11
	movq	%r13, 632(%rsp)
	movq	%r12, 712(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	424(%rsp), %r13
	addq	472(%rsp), %r12
	leaq	(%r10,%r11), %rbx
	addq	%rsi, %r10
	addq	%rdi, %r11
	leaq	(%r12,%r13), %r9
	addq	%r15, %r12
	addq	%r8, %r13
	addq	%rbx, %r13
	addq	%r12, %rbx
	movabsq	$1906713845121804688, %r12
	rolq	$19, %rbx
	rolq	$7, %r13
	addq	%r9, %r10
	movq	%rbx, %r15
	rolq	$53, %r10
	addq	%r9, %r11
	xorq	%r13, %r15
	movq	%r10, %r9
	rolq	$31, %r11
	xorq	%r15, %r10
	xorq	%r11, %r9
	xorq	%r11, %r15
	movq	%r10, 744(%rsp)
	addq	744(%rsp), %r12
	xorq	%r9, %rbx
	movabsq	$853475092736589577, %r10
	xorq	%r13, %r9
	movabsq	$-4925106476758491821, %r11
	addq	%r10, %r15
	addq	%r11, %r9
	movabsq	$-5486504877919021346, %r10
	addq	%rbx, %r10
	movabsq	$6102157975113963195, %r13
	leaq	(%r15,%rcx), %rbx
	movq	%r12, InternalState+120(%rip)
	addq	%r9, %r12
	addq	744(%rsp), %r13
	leaq	(%r15,%r10), %r11
	movq	%r10, InternalState+104(%rip)
	addq	%rdx, %r10
	addq	%r12, %rbx
	movq	%r9, InternalState+112(%rip)
	addq	%r10, %r12
	addq	%rax, %r9
	rolq	$23, %r12
	rolq	$11, %rbx
	addq	%r11, %r13
	addq	%r11, %r9
	movq	%r12, %r10
	rolq	$59, %r13
	rolq	$37, %r9
	xorq	%rbx, %r10
	movq	%r13, %r11
	xorq	%r10, %r13
	xorq	%r9, %r10
	xorq	%r9, %r11
	addq	728(%rsp), %r13
	addq	712(%rsp), %r10
	xorq	%r11, %rbx
	xorq	%r12, %r11
	addq	632(%rsp), %rbx
	addq	648(%rsp), %r11
	movq	%r15, InternalState+96(%rip)
	movq	%r13, InternalState+72(%rip)
	movq	%r10, InternalState+80(%rip)
	leaq	(%rbx,%r13), %r12
	movq	%rbx, InternalState+64(%rip)
	addq	%rdx, %r13
	leaq	(%r10,%r11), %r9
	addq	%rcx, %rbx
	movq	%r11, InternalState+88(%rip)
	addq	%r14, %r11
	addq	%rax, %r10
	addq	%r9, %rbx
	addq	%r13, %r9
	leaq	(%r11,%r12), %r13
	rolq	$23, %r9
	addq	%r12, %r10
	rolq	$11, %rbx
	rolq	$59, %r13
	rolq	$37, %r10
	movq	%r9, %r11
	movq	%r13, %r12
	xorq	%r10, %r12
	xorq	%rbx, %r11
	xorq	%r11, %r13
	xorq	%r12, %rbx
	addq	488(%rsp), %r13
	addq	504(%rsp), %rbx
	xorq	%r11, %r10
	xorq	%r9, %r12
	addq	360(%rsp), %r10
	addq	552(%rsp), %r12
	movq	%r13, InternalState+40(%rip)
	leaq	(%rbx,%r13), %r11
	movq	%rbx, InternalState+32(%rip)
	addq	%rdx, %r13
	leaq	(%r10,%r12), %r9
	addq	%rcx, %rbx
	movq	%r10, InternalState+48(%rip)
	movq	%r12, InternalState+56(%rip)
	addq	%rax, %r10
	addq	%r14, %r12
	addq	%r9, %rbx
	addq	%r11, %r10
	addq	%r13, %r9
	addq	%r12, %r11
	rolq	$23, %r9
	rolq	$11, %rbx
	rolq	$59, %r11
	rolq	$37, %r10
	movq	%r9, %r13
	movq	%r11, %r12
	xorq	%rbx, %r13
	xorq	%r10, %r12
	xorq	%r13, %r11
	addq	568(%rsp), %r11
	xorq	%r12, %rbx
	xorq	%r12, %r9
	movq	520(%rsp), %r12
	addq	680(%rsp), %r9
	addq	584(%rsp), %rbx
	xorq	%r13, %r10
	addq	536(%rsp), %r10
	addq	$1, %r12
	movq	%r11, InternalState+8(%rip)
	movq	%r12, 88(%rsp)
	movq	InternalState+8(%rip), %r13
	movq	%r12, %r11
	xorq	%rbx, %r11
	movq	%r9, %r15
	leaq	(%r9,%r10), %r9
	movq	%r10, %r12
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	leaq	(%r9,%rcx), %rbx
	addq	%r9, %r13
	leaq	(%r12,%rax), %r9
	leaq	(%r15,%r14), %r12
	rolq	$23, %r13
	movabsq	$-1376848230519552085, %r15
	addq	%rbx, %r11
	addq	%r10, %r9
	addq	%r10, %r12
	rolq	$11, %r11
	rolq	$37, %r9
	rolq	$59, %r12
	movq	%r11, %r10
	movq	%r12, %rbx
	xorq	%r13, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r12
	xorq	%r10, %r9
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-9209400399786843361, %rbx
	addq	%r15, %r11
	addq	%rbx, %r12
	movabsq	$-369815132508846929, %r10
	movabsq	$-3463520432737951897, %rbx
	addq	%r10, %r9
	movabsq	$-6792583489299504353, %r15
	leaq	(%r11,%r12), %r10
	addq	%r13, %rbx
	addq	%r15, %r13
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%rsi, %r12
	addq	%r10, %r9
	addq	%rdi, %r11
	addq	%r13, %r10
	rolq	$19, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$7, %r9
	rolq	$53, %rbx
	movq	%r10, %r13
	rolq	$31, %r11
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r13, %rbx
	xorq	%r11, %r12
	xorq	%r11, %r13
	xorq	%r12, %r10
	movq	InternalState+56(%rip), %r15
	xorq	%r9, %r12
	movq	%r13, 680(%rsp)
	movq	InternalState+48(%rip), %r13
	movq	%r10, 584(%rsp)
	movq	%r12, 568(%rsp)
	movq	InternalState+32(%rip), %r10
	movq	InternalState+40(%rip), %r12
	leaq	(%r15,%r13), %r9
	movq	%rbx, 744(%rsp)
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rdx), %r10
	leaq	(%r15,%r14), %r12
	movabsq	$-3329063056561552456, %r15
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	addq	%rbx, %r12
	rolq	$23, %r10
	rolq	$59, %r12
	rolq	$11, %r11
	addq	%rbx, %r9
	movq	%r12, %r13
	movq	%r10, %rbx
	rolq	$37, %r9
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r12
	xorq	%rbx, %r9
	xorq	%r13, %r11
	addq	568(%rsp), %r9
	addq	680(%rsp), %r11
	addq	584(%rsp), %r12
	xorq	%r10, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	leaq	(%r9,%r13), %rbx
	addq	%rdi, %r11
	addq	%r15, %r13
	addq	%r8, %r9
	movq	InternalState+88(%rip), %r15
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r10
	addq	%rsi, %r12
	movq	%r10, %r13
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 552(%rsp)
	movq	InternalState+80(%rip), %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 536(%rsp)
	movq	%r10, 504(%rsp)
	movq	%r12, 488(%rsp)
	movq	InternalState+64(%rip), %r10
	movq	InternalState+72(%rip), %r12
	leaq	(%r15,%r13), %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rdx), %r10
	leaq	(%r15,%r14), %r12
	movabsq	$-3329063056561552456, %r15
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	addq	%rbx, %r12
	rolq	$23, %r10
	rolq	$59, %r12
	rolq	$11, %r11
	addq	%rbx, %r9
	movq	%r12, %r13
	movq	%r10, %rbx
	rolq	$37, %r9
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r12
	addq	504(%rsp), %r12
	xorq	%r13, %r11
	addq	552(%rsp), %r11
	xorq	%rbx, %r9
	xorq	%r10, %r13
	addq	488(%rsp), %r9
	addq	536(%rsp), %r13
	leaq	(%r11,%r12), %r10
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$19, %r10
	addq	%rdi, %r11
	addq	%rsi, %r12
	addq	%rbx, %r11
	movq	%r10, %r13
	addq	%r12, %rbx
	rolq	$31, %r11
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%r13, %r15
	movq	%rbx, %r12
	xorq	%r13, %rbx
	movq	InternalState+112(%rip), %r13
	xorq	%r11, %r12
	movq	%rbx, 648(%rsp)
	xorq	%r11, %r15
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	InternalState+120(%rip), %r9
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	movq	InternalState+96(%rip), %r10
	movq	InternalState+104(%rip), %r12
	addq	%r13, %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rdx), %r10
	movq	InternalState+120(%rip), %r12
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	rolq	$11, %r11
	addq	%r14, %r12
	rolq	$23, %r10
	addq	%rbx, %r9
	addq	%r12, %rbx
	movq	%r10, %r12
	rolq	$59, %rbx
	rolq	$37, %r9
	xorq	%r11, %r12
	movq	%rbx, %r13
	xorq	%r12, %rbx
	addq	632(%rsp), %rbx
	xorq	%r9, %r13
	xorq	%r12, %r9
	addq	728(%rsp), %r9
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	648(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	movq	%r13, %r10
	movq	%r13, 712(%rsp)
	movabsq	$-3329063056561552456, %r13
	addq	%r9, %r10
	addq	%r8, %r9
	addq	712(%rsp), %r13
	addq	%rsi, %rbx
	addq	%r12, %r9
	addq	%rdi, %r11
	rolq	$7, %r9
	addq	%r10, %r11
	rolq	$31, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$19, %r13
	rolq	$53, %r12
	movq	%r13, %rbx
	xorq	%r9, %rbx
	movq	%r12, %r10
	xorq	%r11, %r10
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	movabsq	$-7999569951748836447, %rbx
	xorq	%r10, %r13
	xorq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$-4849728007900573903, %rbx
	movabsq	$-1568322642145848418, %r10
	addq	%rbx, %r13
	movabsq	$-1642314245251606934, %rbx
	addq	%r10, %r9
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$2553129884740551573, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$11, %r11
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$23, %rbx
	rolq	$59, %r10
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r12, 440(%rsp)
	movq	%r10, %r13
	movq	%r12, %r9
	addq	632(%rsp), %r13
	addq	728(%rsp), %r9
	movq	%rbx, %r12
	addq	648(%rsp), %r12
	movq	%r11, 472(%rsp)
	addq	%r15, %r11
	movq	%rbx, 712(%rsp)
	movq	%r10, 456(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 408(%rsp)
	movq	%r10, %r13
	addq	552(%rsp), %r11
	addq	504(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 376(%rsp)
	addq	488(%rsp), %r9
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%rbx, 424(%rsp)
	movq	%r10, 392(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$11, %r11
	rolq	$37, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	movq	%r11, %r15
	xorq	%r9, %r13
	xorq	%r11, %r12
	movq	680(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r13, %r15
	movq	%rbx, 648(%rsp)
	movq	%r10, %r13
	addq	744(%rsp), %rbx
	addq	584(%rsp), %r13
	movq	%r12, %r9
	addq	568(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r9, %rbx
	xorq	%r11, %r10
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-2292595471992902602, %rbx
	addq	%rbx, %r11
	xorq	%r10, %r9
	movabsq	$-5006043190370284386, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r9
	xorq	%r10, %r12
	movabsq	$8467826889434979867, %r13
	movabsq	$6028102484886760763, %rbx
	addq	744(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$2699039428325208307, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$7, %r9
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r13, 680(%rsp)
	movq	%r12, 568(%rsp)
	movq	%r13, %r11
	movq	%r10, %r12
	movq	568(%rsp), %r9
	addq	632(%rsp), %r12
	movq	%rbx, %r13
	addq	728(%rsp), %r9
	addq	648(%rsp), %r13
	addq	%r15, %r11
	movq	%rbx, 744(%rsp)
	movabsq	$-3329063056561552456, %r15
	movq	%r10, 584(%rsp)
	leaq	(%r11,%r12), %r10
	leaq	(%r9,%r13), %rbx
	addq	%r8, %r9
	addq	%r15, %r13
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%rbx, 536(%rsp)
	movq	%r13, %r11
	movq	%r12, 488(%rsp)
	addq	408(%rsp), %r11
	movq	%r10, %r12
	movq	%r13, 552(%rsp)
	addq	392(%rsp), %r12
	movq	%rbx, %r13
	movq	488(%rsp), %r9
	addq	424(%rsp), %r13
	addq	376(%rsp), %r9
	movq	%r10, 504(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r10
	rolq	$53, %rbx
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	movq	%r13, %r15
	movq	%rbx, 648(%rsp)
	movq	%r10, 632(%rsp)
	movq	%r10, %rbx
	movq	648(%rsp), %r10
	addq	712(%rsp), %r10
	xorq	%r11, %r15
	addq	456(%rsp), %rbx
	xorq	%r9, %r12
	movq	472(%rsp), %r11
	movq	%r12, %r9
	addq	440(%rsp), %r9
	movabsq	$-3329063056561552456, %r13
	movq	%r12, 728(%rsp)
	movq	%r10, 712(%rsp)
	addq	712(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	addq	%rsi, %rbx
	addq	%rdi, %r11
	addq	%r9, %r10
	addq	%r8, %r9
	addq	%r12, %r9
	addq	%r10, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$7, %r9
	rolq	$19, %r13
	rolq	$31, %r11
	rolq	$53, %r12
	movq	%r13, %rbx
	xorq	%r9, %rbx
	movq	%r12, %r10
	xorq	%r11, %r10
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	movabsq	$5953845371152580681, %rbx
	xorq	%r10, %r13
	xorq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$-7646712092252898442, %rbx
	movabsq	$-2842268575306187841, %r10
	addq	%rbx, %r13
	movabsq	$-7946738593435294165, %rbx
	addq	%r10, %r9
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	addq	%r9, %rbx
	addq	%rdx, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$-3751294463443135658, %r13
	addq	%r13, %r12
	addq	%rax, %r9
	rolq	$23, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$11, %r11
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r12, 440(%rsp)
	movq	%r10, %r13
	movq	%r12, %r9
	addq	632(%rsp), %r13
	addq	728(%rsp), %r9
	movq	%rbx, %r12
	addq	648(%rsp), %r12
	movq	%r11, 472(%rsp)
	addq	%r15, %r11
	movq	%rbx, 712(%rsp)
	movq	%r10, 456(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	addq	%r14, %r12
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$59, %r10
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %r11
	xorq	%r13, %rbx
	movq	%r10, %r13
	movq	%r11, 408(%rsp)
	addq	504(%rsp), %r13
	movq	%r12, %r9
	addq	552(%rsp), %r11
	addq	488(%rsp), %r9
	movq	%r12, 376(%rsp)
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%r10, 392(%rsp)
	movq	%rbx, 424(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$59, %r10
	rolq	$37, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movq	%r10, %r13
	rolq	$11, %r11
	xorq	%r9, %r13
	rolq	$23, %rbx
	movq	%r11, %r15
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%rbx, 648(%rsp)
	xorq	%r11, %r12
	movq	680(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r10, %r13
	movq	%r12, %r9
	addq	584(%rsp), %r13
	addq	568(%rsp), %r9
	addq	%r15, %r11
	addq	744(%rsp), %rbx
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%r10, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-824919486193887165, %rbx
	addq	%rbx, %r11
	movabsq	$6609752215332129920, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r9
	movabsq	$-1914029582460860148, %r13
	movabsq	$-7632797540959622777, %rbx
	addq	744(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$7484883476188376383, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rdi, %r11
	addq	%rsi, %r12
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r10
	addq	%r12, %rbx
	movq	%r10, %r13
	rolq	$53, %rbx
	xorq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 536(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, %r13
	movq	%r12, 504(%rsp)
	addq	648(%rsp), %r13
	movq	%r10, %r12
	movq	504(%rsp), %r9
	addq	632(%rsp), %r12
	addq	%r15, %r11
	addq	728(%rsp), %r9
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 568(%rsp)
	movq	%r10, 552(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r13, 680(%rsp)
	movq	%r13, %r11
	movq	%r12, 488(%rsp)
	addq	408(%rsp), %r11
	movq	%r10, %r12
	movq	488(%rsp), %r9
	addq	392(%rsp), %r12
	movq	%rbx, %r13
	addq	376(%rsp), %r9
	addq	424(%rsp), %r13
	movq	%rbx, 744(%rsp)
	movq	%r10, 584(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	movq	%r13, %r15
	movq	%rbx, 648(%rsp)
	movq	%r10, 632(%rsp)
	movq	%r10, %rbx
	movq	648(%rsp), %r10
	addq	712(%rsp), %r10
	xorq	%r11, %r15
	xorq	%r9, %r12
	addq	456(%rsp), %rbx
	movq	472(%rsp), %r11
	movq	%r12, %r9
	addq	440(%rsp), %r9
	movq	%r12, 728(%rsp)
	movabsq	$-3329063056561552456, %r13
	movq	%r10, 712(%rsp)
	addq	712(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	addq	%rdi, %r11
	addq	%r9, %r10
	addq	%r8, %r9
	addq	%r12, %r9
	addq	%r10, %r11
	addq	%r12, %r13
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r13
	addq	%rsi, %rbx
	leaq	(%rbx,%r10), %r12
	movq	%r13, %rbx
	xorq	%r9, %rbx
	rolq	$53, %r12
	movq	%r12, %r10
	xorq	%rbx, %r12
	xorq	%r11, %r10
	xorq	%rbx, %r11
	movabsq	$-1139829817207230181, %rbx
	addq	%rbx, %r11
	xorq	%r10, %r13
	movabsq	$3054837738180890943, %rbx
	addq	%rbx, %r13
	xorq	%r10, %r9
	movabsq	$-938319195649413462, %rbx
	movabsq	$2588290990126348949, %r10
	addq	%r12, %rbx
	addq	%r10, %r9
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$3257124934342745045, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r13
	movq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r9, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r13, 424(%rsp)
	movq	%r11, 456(%rsp)
	movq	%r10, %r13
	addq	%r15, %r11
	addq	632(%rsp), %r13
	movq	424(%rsp), %r9
	movq	%rbx, %r12
	addq	728(%rsp), %r9
	addq	648(%rsp), %r12
	movq	%rbx, 472(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 392(%rsp)
	movq	%r10, %r13
	addq	680(%rsp), %r11
	addq	584(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 360(%rsp)
	addq	488(%rsp), %r9
	movq	%rbx, %r12
	addq	744(%rsp), %r12
	movq	%rbx, 408(%rsp)
	movq	%r10, 376(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$23, %rbx
	addq	%r14, %r12
	addq	%r12, %r10
	movq	%rbx, %r12
	movq	%r11, %r15
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	536(%rsp), %r11
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	addq	504(%rsp), %r9
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r10, %r13
	movq	%rbx, 744(%rsp)
	addq	552(%rsp), %r13
	addq	%r15, %r11
	addq	568(%rsp), %rbx
	movq	%r10, 680(%rsp)
	movq	%r12, 584(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r12
	xorq	%r10, %r9
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-6097248013946911484, %rbx
	movq	%r13, 728(%rsp)
	addq	%rbx, %r11
	movabsq	$3174302594670681997, %r13
	movabsq	$-496885038275669880, %rbx
	addq	%r13, %r12
	movabsq	$6378106504303230091, %r13
	addq	%rbx, %r9
	movabsq	$-8739574512844769069, %rbx
	addq	728(%rsp), %rbx
	addq	728(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$7, %r9
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 648(%rsp)
	movq	%rbx, preCompInternalState(%rip)
	movq	%r13, 632(%rsp)
	movq	%r12, %r9
	movq	%r13, preCompInternalState+8(%rip)
	movq	%r10, 728(%rsp)
	movq	%r10, preCompInternalState+16(%rip)
	movq	%r12, 712(%rsp)
	movq	%r13, %r10
	addq	584(%rsp), %r9
	movq	728(%rsp), %rbx
	addq	%r15, %r10
	addq	680(%rsp), %rbx
	movq	648(%rsp), %r13
	movabsq	$-3329063056561552456, %r15
	addq	744(%rsp), %r13
	movq	%r12, preCompInternalState+24(%rip)
	leaq	(%r10,%rbx), %r12
	addq	%rdi, %r10
	leaq	(%r9,%r13), %r11
	addq	%r8, %r9
	addq	%r15, %r13
	addq	%r12, %r9
	addq	%r12, %r13
	addq	%r11, %r10
	rolq	$7, %r9
	rolq	$19, %r13
	rolq	$31, %r10
	addq	%rsi, %rbx
	leaq	(%rbx,%r11), %r12
	movq	%r13, %r11
	xorq	%r9, %r11
	rolq	$53, %r12
	movq	%r12, %rbx
	xorq	%r11, %r12
	xorq	%r10, %r11
	xorq	%r10, %rbx
	movq	%r11, %r10
	addq	392(%rsp), %r10
	xorq	%rbx, %r13
	xorq	%r9, %rbx
	movq	%r12, 536(%rsp)
	movq	%rbx, 488(%rsp)
	movq	%r13, 504(%rsp)
	movq	%r13, %rbx
	movq	488(%rsp), %r9
	addq	376(%rsp), %rbx
	movq	%r12, %r13
	addq	360(%rsp), %r9
	addq	408(%rsp), %r13
	movq	%r11, 552(%rsp)
	leaq	(%r10,%rbx), %r12
	addq	%rsi, %rbx
	addq	%rdi, %r10
	leaq	(%r9,%r13), %r11
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r12, %r13
	addq	%r12, %r9
	addq	%r11, %rbx
	rolq	$19, %r13
	addq	%r11, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r10
	movq	%r13, %r11
	movq	%rbx, %r12
	xorq	%r9, %r11
	xorq	%r10, %r12
	xorq	%r11, %rbx
	xorq	%r12, %r13
	xorq	%r10, %r11
	xorq	%r9, %r12
	movq	%r11, 680(%rsp)
	movq	%r11, %r10
	movq	%r13, %r11
	addq	456(%rsp), %r10
	addq	440(%rsp), %r11
	movq	%r13, 584(%rsp)
	movq	%r12, 568(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	424(%rsp), %r13
	addq	472(%rsp), %r12
	movq	%rbx, 744(%rsp)
	leaq	(%r11,%r10), %rbx
	addq	%rsi, %r11
	addq	%rdi, %r10
	leaq	(%r12,%r13), %r9
	addq	%r8, %r13
	leaq	0(%r13,%rbx), %r15
	movabsq	$-3329063056561552456, %r13
	addq	%r13, %r12
	addq	%r9, %r10
	leaq	(%r12,%rbx), %r13
	leaq	(%r11,%r9), %r12
	rolq	$7, %r15
	rolq	$31, %r10
	movabsq	$853475092736589577, %rbx
	rolq	$19, %r13
	rolq	$53, %r12
	movq	%r13, %r11
	movq	%r12, %r9
	xorq	%r15, %r11
	xorq	%r10, %r9
	xorq	%r11, %r12
	xorq	%r10, %r11
	xorq	%r9, %r13
	addq	%rbx, %r11
	xorq	%r15, %r9
	movabsq	$-5486504877919021346, %r10
	movabsq	$-4925106476758491821, %r15
	movabsq	$1906713845121804688, %rbx
	addq	%r10, %r13
	addq	%r15, %r9
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	movq	%r11, InternalState+96(%rip)
	movq	%r13, InternalState+104(%rip)
	addq	%rcx, %r11
	addq	%rdx, %r13
	movq	%rbx, InternalState+120(%rip)
	addq	%r9, %rbx
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$6102157975113963195, %r13
	addq	%r13, %r12
	movq	%r9, InternalState+112(%rip)
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$23, %rbx
	rolq	$59, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %r11
	xorq	%r13, %rbx
	movq	584(%rsp), %r13
	movq	%r11, preCompInternalState+104(%rip)
	addq	680(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r12, %r9
	movq	%rbx, preCompInternalState+96(%rip)
	movq	%r10, preCompInternalState+112(%rip)
	addq	%r10, %r13
	movq	%r9, preCompInternalState+120(%rip)
	movq	%r11, InternalState+64(%rip)
	movq	%r13, InternalState+72(%rip)
	leaq	(%r11,%r13), %r10
	addq	568(%rsp), %r9
	addq	744(%rsp), %rbx
	addq	%rdx, %r13
	addq	%rcx, %r11
	movq	96(%rsp), %r15
	leaq	(%r9,%rbx), %r12
	movq	%r9, InternalState+80(%rip)
	movq	%rbx, InternalState+88(%rip)
	addq	%rax, %r9
	addq	%r14, %rbx
	addq	%r12, %r11
	addq	%r10, %r9
	addq	%r13, %r12
	addq	%rbx, %r10
	rolq	$23, %r12
	rolq	$11, %r11
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%r12, %rbx
	movq	%r10, %r13
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r9
	xorq	%rbx, %r10
	xorq	%r13, %r12
	movq	%r9, preCompInternalState+88(%rip)
	xorq	%r13, %r11
	movq	%r12, preCompInternalState+64(%rip)
	addq	488(%rsp), %r9
	addq	536(%rsp), %r12
	movq	%r11, preCompInternalState+72(%rip)
	movq	504(%rsp), %r13
	addq	552(%rsp), %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%r9, InternalState+48(%rip)
	addq	%r10, %r13
	leaq	(%r9,%r12), %rbx
	movq	%r12, InternalState+56(%rip)
	movq	%r11, InternalState+32(%rip)
	leaq	(%r11,%r13), %r10
	addq	%rcx, %r11
	addq	%rbx, %r11
	movq	%r13, InternalState+40(%rip)
	addq	%r14, %r12
	addq	%rdx, %r13
	addq	%rax, %r9
	rolq	$11, %r11
	addq	%r13, %rbx
	addq	%r10, %r9
	addq	%r12, %r10
	rolq	$23, %rbx
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r12, %r9
	movq	%rbx, preCompInternalState+32(%rip)
	movq	%r11, preCompInternalState+40(%rip)
	movq	%r10, preCompInternalState+48(%rip)
	movq	%r9, preCompInternalState+56(%rip)
	addq	632(%rsp), %r11
	addq	728(%rsp), %r10
	addq	712(%rsp), %r9
	addq	648(%rsp), %rbx
	movq	%r10, InternalState+8(%rip)
	movq	%r11, InternalState(%rip)
	movq	%rbx, InternalState+24(%rip)
	movq	%r9, InternalState+16(%rip)
	xorq	(%r15), %r11
	movq	80(%rsp), %rbx
	movq	%r11, (%rbx)
	movq	8(%r15), %r9
	xorq	InternalState+8(%rip), %r9
	movq	(%r15), %r11
	movq	%r9, 8(%rbx)
	movq	16(%r15), %r9
	xorq	InternalState+16(%rip), %r9
	movq	8(%r15), %r13
	movq	80(%rsp), %r10
	movq	%r9, 16(%rbx)
	movq	24(%r15), %r9
	xorq	InternalState+24(%rip), %r9
	movq	16(%r15), %rbx
	movq	%r9, 24(%r10)
	movq	32(%r15), %r9
	xorq	InternalState+64(%rip), %r9
	movq	24(%r15), %r12
	movq	%r9, 32(%r10)
	movq	32(%r15), %r9
	movq	%r9, InternalState+64(%rip)
	movq	40(%r15), %r9
	xorq	InternalState+72(%rip), %r9
	movq	%r9, 40(%r10)
	movq	40(%r15), %r9
	movq	%r9, InternalState+72(%rip)
	movq	48(%r15), %r9
	xorq	InternalState+80(%rip), %r9
	movq	%r9, 48(%r10)
	movq	48(%r15), %r9
	movq	%r9, InternalState+80(%rip)
	movq	56(%r15), %r9
	xorq	InternalState+88(%rip), %r9
	movq	%r9, 56(%r10)
	leaq	(%r12,%rbx), %r9
	leaq	(%r11,%r13), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	movq	56(%r15), %r15
	addq	%r9, %r11
	rolq	$11, %r11
	addq	%r9, %r13
	leaq	(%rbx,%rax), %r9
	addq	%r14, %r12
	rolq	$23, %r13
	movq	%r15, -104(%rsp)
	addq	%r10, %r12
	addq	%r10, %r9
	movq	%r13, %r10
	rolq	$59, %r12
	rolq	$37, %r9
	xorq	%r11, %r10
	movq	%r12, %rbx
	movabsq	$-9209400399786843361, %r15
	xorq	%r10, %r12
	xorq	%r9, %rbx
	xorq	%r10, %r9
	addq	%r15, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-1376848230519552085, %rbx
	addq	%rbx, %r11
	movabsq	$-369815132508846929, %rbx
	movabsq	$-6792583489299504353, %r15
	addq	%rbx, %r9
	movabsq	$-3463520432737951897, %rbx
	leaq	(%r11,%r12), %r10
	addq	%r13, %rbx
	addq	%rsi, %r12
	addq	%r15, %r13
	addq	%r9, %rbx
	addq	%rdi, %r11
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$7, %r9
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 744(%rsp)
	movq	%r13, 680(%rsp)
	movq	%r10, 584(%rsp)
	movq	%r12, 568(%rsp)
	movq	InternalState+48(%rip), %r13
	movq	InternalState+56(%rip), %r15
	movq	InternalState+40(%rip), %r12
	movq	InternalState+32(%rip), %r10
	leaq	(%r15,%r13), %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rdx), %r10
	leaq	(%r15,%r14), %r12
	movabsq	$-3329063056561552456, %r15
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	addq	%rbx, %r12
	rolq	$23, %r10
	rolq	$59, %r12
	rolq	$11, %r11
	addq	%rbx, %r9
	movq	%r12, %r13
	movq	%r10, %rbx
	rolq	$37, %r9
	xorq	%r11, %rbx
	xorq	%r9, %r13
	xorq	%rbx, %r12
	xorq	%rbx, %r9
	addq	584(%rsp), %r12
	addq	568(%rsp), %r9
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	680(%rsp), %r11
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	leaq	(%r9,%r13), %rbx
	addq	%rsi, %r12
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%rdi, %r11
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$31, %r11
	rolq	$53, %rbx
	rolq	$7, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	InternalState+64(%rip), %r11
	movq	%r10, 504(%rsp)
	movq	%r12, 488(%rsp)
	movq	InternalState+72(%rip), %r10
	movq	InternalState+80(%rip), %r12
	movq	-104(%rsp), %r9
	movq	%rbx, 536(%rsp)
	movq	%r13, 552(%rsp)
	leaq	(%r10,%r11), %rbx
	addq	%rcx, %r11
	addq	%rdx, %r10
	addq	%r12, %r9
	addq	%r9, %r11
	addq	%r9, %r10
	leaq	(%r12,%rax), %r9
	movq	-104(%rsp), %r12
	rolq	$23, %r10
	rolq	$11, %r11
	addq	%rbx, %r9
	rolq	$37, %r9
	addq	%r14, %r12
	addq	%rbx, %r12
	movq	%r10, %rbx
	rolq	$59, %r12
	xorq	%r11, %rbx
	movq	%r12, %r13
	xorq	%rbx, %r12
	addq	504(%rsp), %r12
	xorq	%r9, %r13
	xorq	%rbx, %r9
	addq	488(%rsp), %r9
	xorq	%r13, %r11
	addq	552(%rsp), %r11
	xorq	%r10, %r13
	addq	536(%rsp), %r13
	leaq	(%r11,%r12), %r10
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$19, %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	movq	%r10, %r13
	addq	%rbx, %r11
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r13, %r15
	movq	%rbx, %r12
	xorq	%r13, %rbx
	movq	InternalState+112(%rip), %r13
	xorq	%r11, %r12
	movq	%rbx, 648(%rsp)
	xorq	%r11, %r15
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	InternalState+120(%rip), %r9
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	movq	InternalState+96(%rip), %r10
	movq	InternalState+104(%rip), %r12
	addq	%r13, %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r9,%r10), %r11
	leaq	(%r12,%rdx), %r10
	movq	InternalState+120(%rip), %r12
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	rolq	$11, %r11
	addq	%r14, %r12
	rolq	$23, %r10
	addq	%rbx, %r9
	addq	%r12, %rbx
	movq	%r10, %r12
	rolq	$59, %rbx
	rolq	$37, %r9
	xorq	%r11, %r12
	movq	%rbx, %r13
	xorq	%r12, %rbx
	addq	632(%rsp), %rbx
	xorq	%r9, %r13
	xorq	%r12, %r9
	addq	728(%rsp), %r9
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	648(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	movq	%r13, %r10
	movq	%r13, 712(%rsp)
	movabsq	$-3329063056561552456, %r13
	addq	%r9, %r10
	addq	712(%rsp), %r13
	addq	%rsi, %rbx
	addq	%r8, %r9
	addq	%rdi, %r11
	addq	%r12, %r9
	addq	%r10, %r11
	rolq	$7, %r9
	rolq	$31, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$19, %r13
	rolq	$53, %r12
	movq	%r13, %rbx
	xorq	%r9, %rbx
	movq	%r12, %r10
	xorq	%r11, %r10
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	movabsq	$-7999569951748836447, %rbx
	xorq	%r10, %r13
	xorq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$-4849728007900573903, %rbx
	movabsq	$-1568322642145848418, %r10
	addq	%rbx, %r13
	movabsq	$-1642314245251606934, %rbx
	addq	%r10, %r9
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$2553129884740551573, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$11, %r11
	rolq	$37, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$59, %r10
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r12, %r9
	movq	%rbx, 712(%rsp)
	movq	%r10, %r13
	addq	728(%rsp), %r9
	addq	632(%rsp), %r13
	movq	%r12, 440(%rsp)
	movq	%rbx, %r12
	addq	648(%rsp), %r12
	movq	%r11, 472(%rsp)
	addq	%r15, %r11
	movq	%r10, 456(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 408(%rsp)
	movq	%r10, %r13
	addq	552(%rsp), %r11
	addq	504(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 376(%rsp)
	addq	488(%rsp), %r9
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%rbx, 424(%rsp)
	movq	%r10, 392(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$11, %r11
	rolq	$37, %r9
	movq	%r10, %r13
	movq	%rbx, %r12
	movq	%r11, %r15
	xorq	%r9, %r13
	xorq	%r11, %r12
	movq	680(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r13, %r15
	movq	%rbx, 648(%rsp)
	movq	%r10, %r13
	addq	744(%rsp), %rbx
	addq	584(%rsp), %r13
	movq	%r12, %r9
	addq	568(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 632(%rsp)
	movq	%r12, 728(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$11, %r11
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%r10, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-2292595471992902602, %rbx
	addq	%rbx, %r11
	movabsq	$-5006043190370284386, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r9
	movabsq	$8467826889434979867, %r13
	movabsq	$6028102484886760763, %rbx
	addq	744(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$2699039428325208307, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$19, %r10
	addq	%r12, %rbx
	rolq	$7, %r9
	rolq	$53, %rbx
	movq	%r10, %r13
	rolq	$31, %r11
	xorq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	movq	%r13, %r11
	xorq	%r9, %r12
	addq	%r15, %r11
	movq	%r12, 568(%rsp)
	movq	%r13, 680(%rsp)
	movq	%r10, %r12
	movq	568(%rsp), %r9
	addq	632(%rsp), %r12
	addq	728(%rsp), %r9
	movq	%rbx, %r13
	addq	648(%rsp), %r13
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 744(%rsp)
	movq	%r10, 584(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%rbx, 536(%rsp)
	movq	%r13, %r11
	movq	%r13, 552(%rsp)
	addq	408(%rsp), %r11
	movq	%rbx, %r13
	movq	%r12, 488(%rsp)
	addq	424(%rsp), %r13
	movq	%r10, %r12
	movq	488(%rsp), %r9
	addq	392(%rsp), %r12
	addq	376(%rsp), %r9
	movq	%r10, 504(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rdi, %r11
	addq	%rsi, %r12
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$7, %r9
	rolq	$19, %r10
	rolq	$31, %r11
	addq	%r12, %rbx
	movq	%r10, %r13
	rolq	$53, %rbx
	xorq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r13, %rbx
	movq	%r13, %r15
	xorq	%r11, %r12
	movq	%rbx, 648(%rsp)
	xorq	%r11, %r15
	xorq	%r12, %r10
	movq	472(%rsp), %r11
	xorq	%r9, %r12
	movq	%r10, 632(%rsp)
	movq	%r10, %rbx
	movq	648(%rsp), %r10
	addq	712(%rsp), %r10
	addq	456(%rsp), %rbx
	movq	%r12, %r9
	addq	440(%rsp), %r9
	movabsq	$-3329063056561552456, %r13
	addq	%r15, %r11
	movq	%r12, 728(%rsp)
	movq	%r10, 712(%rsp)
	addq	712(%rsp), %r13
	leaq	(%rbx,%r11), %r12
	addq	%r9, %r10
	addq	%rsi, %rbx
	addq	%r8, %r9
	addq	%r12, %r9
	addq	%rdi, %r11
	rolq	$7, %r9
	addq	%r10, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$31, %r11
	rolq	$19, %r13
	rolq	$53, %r12
	movq	%r13, %rbx
	xorq	%r9, %rbx
	movq	%r12, %r10
	xorq	%r11, %r10
	xorq	%rbx, %r12
	xorq	%rbx, %r11
	movabsq	$5953845371152580681, %rbx
	xorq	%r10, %r13
	xorq	%r10, %r9
	addq	%rbx, %r11
	movabsq	$-7646712092252898442, %rbx
	movabsq	$-2842268575306187841, %r10
	addq	%rbx, %r13
	movabsq	$-7946738593435294165, %rbx
	addq	%r10, %r9
	addq	%r12, %rbx
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$-3751294463443135658, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r12, 440(%rsp)
	movq	%r10, %r13
	movq	%r12, %r9
	addq	632(%rsp), %r13
	addq	728(%rsp), %r9
	movq	%rbx, %r12
	addq	648(%rsp), %r12
	movq	%r11, 472(%rsp)
	addq	%r15, %r11
	movq	%rbx, 712(%rsp)
	movq	%r10, 456(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$23, %rbx
	addq	%r14, %r12
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, 376(%rsp)
	movq	%r12, %r9
	xorq	%r13, %rbx
	xorq	%r13, %r11
	addq	488(%rsp), %r9
	movq	%r11, 408(%rsp)
	movq	%r10, %r13
	addq	552(%rsp), %r11
	addq	504(%rsp), %r13
	movq	%rbx, %r12
	addq	536(%rsp), %r12
	movq	%rbx, 424(%rsp)
	movq	%r10, 392(%rsp)
	leaq	(%r9,%r12), %rbx
	leaq	(%r11,%r13), %r10
	addq	%r14, %r12
	addq	%rdx, %r13
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r10, %r9
	addq	%r13, %rbx
	addq	%r12, %r10
	rolq	$23, %rbx
	rolq	$11, %r11
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r11, %r12
	movq	%r11, %r15
	xorq	%r9, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r12, %r9
	movq	%rbx, 648(%rsp)
	movq	%r10, 632(%rsp)
	movq	%r10, %r13
	movq	680(%rsp), %r11
	addq	584(%rsp), %r13
	movq	%r12, 728(%rsp)
	addq	%r15, %r11
	addq	568(%rsp), %r9
	addq	744(%rsp), %rbx
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%r10, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-824919486193887165, %rbx
	addq	%rbx, %r11
	movabsq	$6609752215332129920, %rbx
	movq	%r13, 744(%rsp)
	addq	%rbx, %r9
	movabsq	$-1914029582460860148, %r13
	movabsq	$-7632797540959622777, %rbx
	addq	744(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$7484883476188376383, %r13
	addq	744(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	rolq	$7, %r9
	rolq	$31, %r11
	rolq	$19, %r10
	addq	%rsi, %r12
	movq	%r10, %r13
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 536(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, %r13
	movq	%r12, 504(%rsp)
	addq	648(%rsp), %r13
	movq	%r10, %r12
	movq	504(%rsp), %r9
	addq	632(%rsp), %r12
	addq	%r15, %r11
	addq	728(%rsp), %r9
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 568(%rsp)
	movq	%r10, 552(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r13, 680(%rsp)
	movq	%r13, %r11
	movq	%r12, 488(%rsp)
	addq	408(%rsp), %r11
	movq	%r10, %r12
	movq	488(%rsp), %r9
	addq	392(%rsp), %r12
	movq	%rbx, %r13
	addq	376(%rsp), %r9
	addq	424(%rsp), %r13
	movq	%rbx, 744(%rsp)
	movq	%r10, 584(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	movq	%r13, %r15
	movq	%rbx, 648(%rsp)
	movq	%r10, 632(%rsp)
	movq	%r10, %rbx
	movq	648(%rsp), %r10
	addq	712(%rsp), %r10
	xorq	%r11, %r15
	xorq	%r9, %r12
	addq	456(%rsp), %rbx
	movq	472(%rsp), %r11
	movq	%r12, %r9
	addq	440(%rsp), %r9
	movq	%r12, 728(%rsp)
	movabsq	$-3329063056561552456, %r13
	movq	%r10, 712(%rsp)
	addq	712(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	addq	%rdi, %r11
	addq	%r9, %r10
	addq	%r8, %r9
	addq	%r12, %r9
	addq	%r10, %r11
	addq	%r12, %r13
	rolq	$7, %r9
	rolq	$19, %r13
	rolq	$31, %r11
	addq	%rsi, %rbx
	leaq	(%rbx,%r10), %r12
	movq	%r13, %rbx
	xorq	%r9, %rbx
	rolq	$53, %r12
	movq	%r12, %r10
	xorq	%rbx, %r12
	xorq	%r11, %r10
	xorq	%rbx, %r11
	movabsq	$-1139829817207230181, %rbx
	addq	%rbx, %r11
	xorq	%r10, %r13
	movabsq	$3054837738180890943, %rbx
	addq	%rbx, %r13
	xorq	%r10, %r9
	movabsq	$-938319195649413462, %rbx
	movabsq	$2588290990126348949, %r10
	addq	%r12, %rbx
	addq	%r10, %r9
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$3257124934342745045, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r13
	movq	%r10, %r12
	xorq	%r11, %r13
	xorq	%r9, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r13, 424(%rsp)
	movq	%r11, 456(%rsp)
	movq	%r10, %r13
	addq	%r15, %r11
	movq	424(%rsp), %r9
	addq	632(%rsp), %r13
	movq	%rbx, %r12
	addq	728(%rsp), %r9
	addq	648(%rsp), %r12
	movq	%rbx, 472(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%r14, %r12
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r10
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$59, %r10
	rolq	$23, %rbx
	rolq	$37, %r9
	rolq	$11, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 392(%rsp)
	movq	%r10, %r13
	addq	680(%rsp), %r11
	addq	584(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 360(%rsp)
	addq	488(%rsp), %r9
	movq	%rbx, %r12
	addq	744(%rsp), %r12
	movq	%rbx, 408(%rsp)
	movq	%r10, 376(%rsp)
	leaq	(%r11,%r13), %r10
	addq	%rdx, %r13
	addq	%rcx, %r11
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %rbx
	rolq	$11, %r11
	rolq	$23, %rbx
	rolq	$37, %r9
	addq	%r14, %r12
	movq	%r11, %r15
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$59, %r10
	xorq	%r11, %r12
	movq	536(%rsp), %r11
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	addq	504(%rsp), %r9
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r10, %r13
	movq	%rbx, 744(%rsp)
	addq	552(%rsp), %r13
	addq	%r15, %r11
	addq	568(%rsp), %rbx
	movq	%r10, 680(%rsp)
	movq	%r12, 584(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rcx, %r11
	addq	%rdx, %r13
	leaq	(%rbx,%r9), %r12
	addq	%r14, %rbx
	addq	%rax, %r9
	addq	%r10, %r9
	addq	%r12, %r11
	addq	%r12, %r13
	leaq	(%rbx,%r10), %r12
	rolq	$23, %r13
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r10
	movq	%r12, %rbx
	xorq	%r11, %r10
	xorq	%r9, %rbx
	xorq	%r10, %r12
	xorq	%r10, %r9
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movabsq	$-6097248013946911484, %rbx
	movq	%r13, 728(%rsp)
	addq	%rbx, %r11
	movabsq	$3174302594670681997, %r13
	movabsq	$-496885038275669880, %rbx
	addq	%r13, %r12
	movabsq	$6378106504303230091, %r13
	addq	%rbx, %r9
	movabsq	$-8739574512844769069, %rbx
	addq	728(%rsp), %rbx
	addq	728(%rsp), %r13
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	addq	%r9, %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%rbx, %r11
	addq	%r13, %r10
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$7, %r9
	rolq	$53, %rbx
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 648(%rsp)
	movq	%rbx, preCompInternalState(%rip)
	movq	%r13, 632(%rsp)
	movq	%r13, %r11
	movq	%r13, preCompInternalState+8(%rip)
	movq	%r10, 728(%rsp)
	movq	%rbx, %r13
	movq	%r10, preCompInternalState+16(%rip)
	movq	%r12, 712(%rsp)
	addq	%r15, %r11
	addq	744(%rsp), %r13
	movq	%r12, preCompInternalState+24(%rip)
	movq	%r10, %r12
	movq	712(%rsp), %r9
	addq	680(%rsp), %r12
	movabsq	$-3329063056561552456, %r15
	addq	584(%rsp), %r9
	leaq	(%r11,%r12), %r10
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$7, %r9
	rolq	$19, %r10
	rolq	$31, %r11
	addq	%rsi, %r12
	movq	%r10, %r13
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 552(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	addq	392(%rsp), %r11
	movq	%r12, 488(%rsp)
	movq	%rbx, %r13
	movq	%r10, %r12
	addq	408(%rsp), %r13
	addq	376(%rsp), %r12
	movq	488(%rsp), %r9
	addq	360(%rsp), %r9
	movq	%rbx, 536(%rsp)
	movq	%r10, 504(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rsi, %r12
	addq	%rdi, %r11
	leaq	(%r9,%r13), %rbx
	addq	%r15, %r13
	addq	%r8, %r9
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	addq	%r12, %rbx
	rolq	$19, %r10
	rolq	$53, %rbx
	rolq	$7, %r9
	rolq	$31, %r11
	movq	%r10, %r13
	movq	%rbx, %r12
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r11, %r13
	xorq	%r9, %r12
	movq	%r10, 584(%rsp)
	movq	%r13, %r11
	addq	456(%rsp), %r11
	addq	440(%rsp), %r10
	movq	%r13, 680(%rsp)
	movq	%r12, 568(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	424(%rsp), %r13
	addq	472(%rsp), %r12
	movq	%rbx, 744(%rsp)
	leaq	(%r10,%r11), %rbx
	addq	%r10, %rsi
	addq	%r11, %rdi
	leaq	(%r12,%r13), %r9
	addq	%r13, %r8
	addq	%r15, %r12
	addq	%rbx, %r8
	addq	%r12, %rbx
	rolq	$19, %rbx
	addq	%r9, %rdi
	addq	%rsi, %r9
	rolq	$53, %r9
	rolq	$7, %r8
	movq	%rbx, %rsi
	xorq	%r8, %rsi
	rolq	$31, %rdi
	movq	%r9, %r10
	xorq	%rdi, %r10
	movq	%rsi, %r12
	xorq	%rsi, %rdi
	movabsq	$853475092736589577, %rsi
	xorq	%r10, %rbx
	xorq	%r10, %r8
	addq	%rsi, %rdi
	xorq	%r9, %r12
	movabsq	$-5486504877919021346, %rsi
	movabsq	$-4925106476758491821, %r9
	movabsq	$1906713845121804688, %r10
	addq	%rbx, %rsi
	addq	%r8, %r9
	addq	%r12, %r10
	leaq	(%rdi,%rsi), %r8
	movq	%rsi, InternalState+104(%rip)
	movq	%r10, InternalState+120(%rip)
	addq	%rdx, %rsi
	addq	%r9, %r10
	movq	%rdi, InternalState+96(%rip)
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %r15
	leaq	(%r9,%rax), %rsi
	addq	%r10, %rdi
	movq	%r9, InternalState+112(%rip)
	movabsq	$6102157975113963195, %r9
	rolq	$11, %rdi
	addq	%r8, %rsi
	rolq	$23, %r15
	rolq	$37, %rsi
	addq	%r9, %r12
	movq	%r15, %r13
	addq	%r8, %r12
	xorq	%rdi, %r13
	rolq	$59, %r12
	movq	%r12, %rbx
	xorq	%r13, %r12
	xorq	%rsi, %r13
	xorq	%rsi, %rbx
	movq	%r12, preCompInternalState+112(%rip)
	addq	584(%rsp), %r12
	xorq	%rbx, %r15
	xorq	%rdi, %rbx
	movq	%r13, preCompInternalState+120(%rip)
	movq	%rbx, preCompInternalState+104(%rip)
	addq	680(%rsp), %rbx
	movq	%r15, preCompInternalState+96(%rip)
	leaq	(%r12,%rdx), %r9
	movq	%rbx, InternalState+64(%rip)
	movq	%r12, InternalState+72(%rip)
	leaq	(%rbx,%rcx), %r8
	addq	568(%rsp), %r13
	addq	744(%rsp), %r15
	leaq	(%rbx,%r12), %rdi
	leaq	0(%r13,%r15), %rsi
	leaq	(%r15,%r14), %r10
	movq	%r13, InternalState+80(%rip)
	movq	%r15, InternalState+88(%rip)
	addq	%rsi, %r8
	addq	%rsi, %r9
	leaq	0(%r13,%rax), %rsi
	rolq	$23, %r9
	rolq	$11, %r8
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$59, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r10
	movq	%rdi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r11
	movq	%rdi, preCompInternalState+80(%rip)
	xorq	%r10, %rsi
	xorq	%r11, %r9
	xorq	%r8, %r11
	movq	504(%rsp), %r8
	movq	%rsi, preCompInternalState+88(%rip)
	movq	%r11, preCompInternalState+72(%rip)
	addq	552(%rsp), %r11
	movq	%r9, preCompInternalState+64(%rip)
	addq	%rdi, %r8
	movq	488(%rsp), %rdi
	movq	%r8, InternalState+40(%rip)
	addq	%rsi, %rdi
	movq	536(%rsp), %rsi
	addq	%r11, %rcx
	movq	%rdi, InternalState+48(%rip)
	movq	%r11, InternalState+32(%rip)
	addq	%r9, %rsi
	leaq	(%r11,%r8), %r9
	leaq	(%rdi,%rsi), %r10
	movq	%rsi, InternalState+56(%rip)
	addq	%r10, %rcx
	rolq	$11, %rcx
	addq	%r14, %rsi
	addq	%rdi, %rax
	addq	%r8, %rdx
	addq	%r9, %rax
	addq	%rsi, %r9
	addq	%r10, %rdx
	rolq	$59, %r9
	rolq	$37, %rax
	rolq	$23, %rdx
	movq	%r9, %rdi
	movq	%rdx, %rsi
	xorq	%rax, %rdi
	xorq	%rcx, %rsi
	xorq	%rdi, %rdx
	xorq	%rdi, %rcx
	xorq	%rsi, %r9
	xorq	%rsi, %rax
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rcx, preCompInternalState+40(%rip)
	addq	648(%rsp), %rdx
	addq	632(%rsp), %rcx
	movq	%r9, preCompInternalState+48(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	addq	728(%rsp), %r9
	addq	712(%rsp), %rax
	movq	%rdx, InternalState+24(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%r9, InternalState+8(%rip)
	movq	%rax, InternalState+16(%rip)
	vmovdqa	InternalState(%rip), %ymm0
	vmovdqa	%ymm0, 904(%rsp)
	vmovdqa	InternalState+32(%rip), %ymm0
	vmovdqa	%ymm0, 936(%rsp)
	vmovdqa	InternalState+64(%rip), %ymm0
	vmovdqa	%ymm0, 968(%rsp)
	addq	664(%rsp), %rax
	addq	696(%rsp), %rdx
	vmovq	520(%rsp), %xmm8
	addq	600(%rsp), %rcx
	vmovdqa	InternalState+96(%rip), %ymm0
	vpinsrq	$1, 88(%rsp), %xmm8, %xmm8
	movq	%rax, 792(%rsp)
	movq	904(%rsp), %rax
	vmovdqa	%ymm0, 1000(%rsp)
	addq	312(%rsp), %rbx
	addq	128(%rsp), %r12
	addq	328(%rsp), %r13
	addq	344(%rsp), %r15
	addq	616(%rsp), %r9
	movq	%rax, 120(%rsp)
	movq	%rdx, 800(%rsp)
	vmovdqa	%xmm8, 520(%rsp)
	vmovddup	120(%rsp), %xmm0
	movq	912(%rsp), %rdx
	vpxor	%xmm8, %xmm8, %xmm8
	movq	%rcx, 776(%rsp)
	movq	%rbx, 808(%rsp)
	movq	%r12, 816(%rsp)
	movq	%r13, 824(%rsp)
	movq	%r15, 832(%rsp)
	movq	%r9, 784(%rsp)
	vmovdqa	%xmm8, 1032(%rsp)
	vmovdqa	%xmm8, 1048(%rsp)
	vmovdqa	%xmm8, 1064(%rsp)
	vmovdqa	%xmm8, 1080(%rsp)
	vmovdqa	%xmm8, 1096(%rsp)
	vmovdqa	%xmm8, 1112(%rsp)
	vmovdqa	%xmm8, 1128(%rsp)
	vmovdqa	%xmm8, 1144(%rsp)
	vmovdqa	%xmm0, 1160(%rsp)
	movq	%rdx, 128(%rsp)
	movq	920(%rsp), %rdx
	movq	928(%rsp), %rcx
	movq	936(%rsp), %r12
	movq	944(%rsp), %r13
	movq	952(%rsp), %r14
	movq	%rdx, -112(%rsp)
	movq	968(%rsp), %rax
	vmovq	-112(%rsp), %xmm2
	movq	%rcx, -112(%rsp)
	vmovq	-112(%rsp), %xmm5
	movq	%r12, -112(%rsp)
	vmovq	-112(%rsp), %xmm6
	movq	%r13, -112(%rsp)
	vmovq	-112(%rsp), %xmm7
	movq	960(%rsp), %r15
	movq	%r14, -112(%rsp)
	movq	%rax, 64(%rsp)
	vmovq	-112(%rsp), %xmm9
	movq	976(%rsp), %rax
	vpunpcklqdq	%xmm5, %xmm5, %xmm4
	movq	%r15, -112(%rsp)
	vpunpcklqdq	%xmm6, %xmm6, %xmm5
	vmovq	-112(%rsp), %xmm11
	vpunpcklqdq	%xmm9, %xmm9, %xmm6
	movq	%rax, 56(%rsp)
	vmovddup	64(%rsp), %xmm9
	vmovddup	128(%rsp), %xmm1
	vpunpcklqdq	%xmm2, %xmm2, %xmm3
	vmovdqa	%xmm9, 392(%rsp)
	vpunpcklqdq	%xmm7, %xmm7, %xmm2
	vmovdqa	%xmm9, 1288(%rsp)
	vpunpcklqdq	%xmm11, %xmm11, %xmm7
	vmovddup	56(%rsp), %xmm9
	vmovdqa	%xmm1, 1176(%rsp)
	vmovdqa	%xmm3, 1192(%rsp)
	vmovdqa	%xmm4, 1208(%rsp)
	vmovdqa	%xmm5, 1224(%rsp)
	vmovdqa	%xmm2, 1240(%rsp)
	vmovdqa	%xmm6, 1256(%rsp)
	vmovdqa	%xmm7, 1272(%rsp)
	vmovdqa	%xmm9, 376(%rsp)
	vmovdqa	%xmm9, 1304(%rsp)
	movq	984(%rsp), %rax
	movq	1000(%rsp), %rsi
	movq	992(%rsp), %rbx
	movq	%rax, 48(%rsp)
	movq	1008(%rsp), %rax
	movq	%rsi, 32(%rsp)
	movq	%rbx, 40(%rsp)
	vmovddup	32(%rsp), %xmm11
	movq	%rax, 16(%rsp)
	movq	1016(%rsp), %rax
	vmovddup	48(%rsp), %xmm9
	vmovdqa	%xmm11, 360(%rsp)
	movq	%rax, 8(%rsp)
	movq	1024(%rsp), %rax
	vmovdqa	%xmm11, 1352(%rsp)
	vmovddup	16(%rsp), %xmm11
	vmovddup	40(%rsp), %xmm10
	vmovdqa	%xmm9, 1320(%rsp)
	movq	%rax, (%rsp)
	movq	24(%rsp), %rax
	vmovdqa	%xmm11, 296(%rsp)
	vmovdqa	%xmm11, 1368(%rsp)
	vmovddup	8(%rsp), %xmm11
	addq	$-128, %rax
	movq	%rax, %rsi
	shrq	$7, %rsi
	vmovdqa	%xmm11, 344(%rsp)
	testq	%rsi, %rsi
	movq	%rax, 72(%rsp)
	vmovdqa	%xmm11, 1384(%rsp)
	vmovddup	(%rsp), %xmm11
	vmovdqa	%xmm10, 1336(%rsp)
	vmovdqa	%xmm11, 328(%rsp)
	vmovdqa	%xmm11, 1400(%rsp)
	je	.L109
	vmovdqa	%xmm8, 648(%rsp)
	vpaddq	%xmm7, %xmm6, %xmm11
	movq	96(%rsp), %rdi
	movq	-80(%rsp), %rax
	xorl	%r8d, %r8d
	vmovdqa	%xmm8, 632(%rsp)
	vmovdqa	%xmm8, 728(%rsp)
	vmovdqa	%xmm8, 712(%rsp)
	vmovdqa	%xmm8, 696(%rsp)
	vmovdqa	%xmm8, 664(%rsp)
	vmovdqa	%xmm8, 616(%rsp)
	vmovdqa	%xmm8, 600(%rsp)
	vpaddq	%xmm4, %xmm3, %xmm8
	vmovdqa	%xmm3, 264(%rsp)
	vmovdqa	%xmm1, 488(%rsp)
	vpaddq	%xmm5, %xmm2, %xmm1
	vpaddq	.LC2(%rip), %xmm2, %xmm2
	vpaddq	%xmm11, %xmm2, %xmm2
	vmovdqa	%xmm0, 136(%rsp)
	vpaddq	%xmm10, %xmm9, %xmm0
	vmovdqa	%xmm0, 456(%rsp)
	vmovdqa	%xmm5, 312(%rsp)
	vmovdqa	%xmm4, 280(%rsp)
	vmovdqa	%xmm8, 472(%rsp)
	vmovdqa	%xmm11, 248(%rsp)
	vmovdqa	392(%rsp), %xmm3
	vpaddq	376(%rsp), %xmm3, %xmm0
	vpsrlq	$41, %xmm2, %xmm3
	vpsllq	$23, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm2
	vmovdqa	344(%rsp), %xmm4
	vmovdqa	%xmm2, 232(%rsp)
	vpaddq	.LC3(%rip), %xmm1, %xmm2
	vpaddq	%xmm6, %xmm2, %xmm2
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm2
	vpaddq	.LC4(%rip), %xmm1, %xmm1
	vpaddq	%xmm7, %xmm1, %xmm1
	vpaddq	328(%rsp), %xmm4, %xmm4
	vmovdqa	%xmm4, 424(%rsp)
	vmovdqa	%xmm2, 216(%rsp)
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vmovdqa	216(%rsp), %xmm6
	vpxor	%xmm1, %xmm6, %xmm6
	vmovdqa	360(%rsp), %xmm5
	vmovdqa	%xmm1, 200(%rsp)
	vpaddq	296(%rsp), %xmm5, %xmm5
	vmovdqa	%xmm5, 440(%rsp)
	vmovdqa	%xmm6, 184(%rsp)
	vpaddq	.LC3(%rip), %xmm0, %xmm1
	vpaddq	%xmm9, %xmm1, %xmm1
	vpsrlq	$27, %xmm1, %xmm2
	vpsllq	$37, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm10, %xmm0, %xmm0
	vmovdqa	%xmm1, 168(%rsp)
	vpsrlq	$5, %xmm0, %xmm1
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm0
	vpxor	232(%rsp), %xmm6, %xmm7
	vmovdqa	168(%rsp), %xmm8
	vpxor	%xmm0, %xmm8, %xmm8
	vmovdqa	%xmm0, 152(%rsp)
	vmovdqa	%xmm7, 104(%rsp)
	vmovdqa	%xmm8, 408(%rsp)
	.p2align 4,,10
	.p2align 3
.L70:
	vmovdqa	520(%rsp), %xmm9
	addq	$1, %r8
	vmovdqa	136(%rsp), %xmm11
	vpaddq	.LC0(%rip), %xmm9, %xmm9
	vpxor	%xmm9, %xmm11, %xmm2
	vmovdqa	.LC2(%rip), %xmm3
	vpaddq	488(%rsp), %xmm2, %xmm0
	vpaddq	.LC1(%rip), %xmm2, %xmm2
	vpaddq	472(%rsp), %xmm2, %xmm2
	vpsrlq	$53, %xmm2, %xmm1
	vpsllq	$11, %xmm2, %xmm2
	vpor	%xmm1, %xmm2, %xmm1
	vpaddq	488(%rsp), %xmm3, %xmm2
	vpaddq	472(%rsp), %xmm2, %xmm2
	vpsrlq	$41, %xmm2, %xmm3
	vpsllq	$23, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm3
	vpaddq	.LC3(%rip), %xmm0, %xmm2
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	264(%rsp), %xmm2, %xmm2
	vpaddq	280(%rsp), %xmm0, %xmm0
	vpsrlq	$27, %xmm2, %xmm4
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm4, %xmm2, %xmm5
	vpsrlq	$5, %xmm0, %xmm2
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm2, %xmm0, %xmm2
	vpxor	%xmm3, %xmm1, %xmm0
	vmovdqa	.LC2(%rip), %xmm8
	vpxor	%xmm2, %xmm5, %xmm4
	vpxor	%xmm0, %xmm2, %xmm2
	vpxor	%xmm0, %xmm5, %xmm5
	vpxor	%xmm3, %xmm4, %xmm3
	vpxor	%xmm1, %xmm4, %xmm1
	vpaddq	_ZL14preCompConstV2+32(%rip), %xmm2, %xmm2
	vpaddq	_ZL14preCompConstV2+48(%rip), %xmm5, %xmm5
	vmovdqa	%xmm9, 520(%rsp)
	vpaddq	_ZL14preCompConstV2(%rip), %xmm3, %xmm3
	vpaddq	%xmm3, %xmm5, %xmm0
	vpaddq	_ZL14preCompConstV2+16(%rip), %xmm1, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm4
	vpaddq	.LC7(%rip), %xmm1, %xmm1
	vpaddq	.LC5(%rip), %xmm4, %xmm6
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	.LC6(%rip), %xmm4, %xmm4
	vpaddq	%xmm3, %xmm4, %xmm3
	vpsrlq	$45, %xmm3, %xmm4
	vpsllq	$19, %xmm3, %xmm3
	vpor	%xmm4, %xmm3, %xmm14
	vpaddq	%xmm0, %xmm1, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm0
	vpsrlq	$33, %xmm3, %xmm1
	vpsrlq	$11, %xmm0, %xmm2
	vpsllq	$31, %xmm3, %xmm3
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm3, %xmm1
	vpaddq	%xmm5, %xmm6, %xmm5
	vpor	%xmm2, %xmm0, %xmm9
	vpsrlq	$57, %xmm5, %xmm6
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm13
	vmovdqa	.LC1(%rip), %xmm4
	vpxor	%xmm9, %xmm1, %xmm0
	vpxor	%xmm14, %xmm13, %xmm15
	vpxor	%xmm0, %xmm14, %xmm14
	vpxor	%xmm0, %xmm13, %xmm0
	vpxor	%xmm9, %xmm15, %xmm9
	vpxor	%xmm1, %xmm15, %xmm15
	vmovdqa	%xmm0, 584(%rsp)
	vpaddq	312(%rsp), %xmm4, %xmm0
	vpaddq	248(%rsp), %xmm0, %xmm0
	vpsrlq	$53, %xmm0, %xmm1
	vpsllq	$11, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpaddq	104(%rsp), %xmm9, %xmm3
	vmovdqa	%xmm9, 744(%rsp)
	vmovdqa	%xmm14, 680(%rsp)
	vpxor	232(%rsp), %xmm1, %xmm5
	vpxor	184(%rsp), %xmm1, %xmm1
	vpxor	200(%rsp), %xmm5, %xmm2
	vpxor	216(%rsp), %xmm5, %xmm5
	vpaddq	%xmm1, %xmm15, %xmm1
	vpaddq	%xmm14, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm4
	vpaddq	.LC7(%rip), %xmm1, %xmm1
	vpaddq	.LC5(%rip), %xmm4, %xmm6
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	.LC6(%rip), %xmm4, %xmm4
	vpaddq	584(%rsp), %xmm5, %xmm5
	vpaddq	%xmm3, %xmm5, %xmm0
	vpaddq	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm3, %xmm4, %xmm3
	vpsrlq	$57, %xmm5, %xmm6
	vpsrlq	$45, %xmm3, %xmm4
	vpsllq	$7, %xmm5, %xmm5
	vpsllq	$19, %xmm3, %xmm3
	vpor	%xmm6, %xmm5, %xmm6
	vpor	%xmm4, %xmm3, %xmm9
	vpaddq	%xmm0, %xmm1, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm0
	vpsrlq	$33, %xmm3, %xmm1
	vpsrlq	$11, %xmm0, %xmm2
	vpsllq	$31, %xmm3, %xmm3
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm3, %xmm1
	vpor	%xmm2, %xmm0, %xmm7
	vmovdqa	.LC1(%rip), %xmm5
	vpxor	%xmm9, %xmm6, %xmm11
	vpxor	%xmm7, %xmm1, %xmm0
	vpxor	%xmm7, %xmm11, %xmm7
	vpxor	%xmm1, %xmm11, %xmm11
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm6, %xmm6
	vpaddq	392(%rsp), %xmm5, %xmm0
	vpaddq	456(%rsp), %xmm0, %xmm0
	vpsrlq	$53, %xmm0, %xmm1
	vpsllq	$11, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpaddq	376(%rsp), %xmm8, %xmm0
	vpaddq	456(%rsp), %xmm0, %xmm0
	vpsrlq	$41, %xmm0, %xmm2
	vpsllq	$23, %xmm0, %xmm4
	vpor	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm1, %xmm2
	vpxor	408(%rsp), %xmm4, %xmm4
	vpxor	152(%rsp), %xmm2, %xmm3
	vpxor	408(%rsp), %xmm1, %xmm1
	vpaddq	%xmm4, %xmm7, %xmm4
	vpxor	168(%rsp), %xmm2, %xmm2
	vpaddq	%xmm3, %xmm9, %xmm3
	vpaddq	%xmm1, %xmm11, %xmm1
	vpaddq	%xmm3, %xmm1, %xmm5
	vpaddq	.LC5(%rip), %xmm5, %xmm8
	vpaddq	.LC6(%rip), %xmm5, %xmm5
	vpaddq	.LC7(%rip), %xmm1, %xmm1
	vpaddq	.LC8(%rip), %xmm3, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm4, %xmm2, %xmm0
	vpaddq	%xmm2, %xmm8, %xmm8
	vpaddq	%xmm4, %xmm5, %xmm4
	vpsrlq	$57, %xmm8, %xmm2
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$7, %xmm8, %xmm8
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm2, %xmm8, %xmm2
	vpor	%xmm5, %xmm4, %xmm5
	vpaddq	%xmm0, %xmm1, %xmm4
	vpaddq	%xmm0, %xmm3, %xmm0
	vpsrlq	$33, %xmm4, %xmm1
	vpsrlq	$11, %xmm0, %xmm3
	vpsllq	$31, %xmm4, %xmm4
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm4, %xmm1
	vpor	%xmm3, %xmm0, %xmm3
	vmovdqa	.LC2(%rip), %xmm4
	vpxor	%xmm5, %xmm2, %xmm10
	vpxor	%xmm3, %xmm1, %xmm0
	vpxor	%xmm3, %xmm10, %xmm3
	vpxor	%xmm1, %xmm10, %xmm10
	vmovdqa	.LC1(%rip), %xmm1
	vpxor	%xmm0, %xmm5, %xmm5
	vpxor	%xmm0, %xmm2, %xmm2
	vpaddq	360(%rsp), %xmm1, %xmm0
	vpaddq	424(%rsp), %xmm0, %xmm0
	vpsrlq	$53, %xmm0, %xmm1
	vpsllq	$11, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm8
	vpaddq	296(%rsp), %xmm4, %xmm0
	vpaddq	424(%rsp), %xmm0, %xmm0
	vpsrlq	$41, %xmm0, %xmm1
	vpsllq	$23, %xmm0, %xmm12
	vpor	%xmm1, %xmm12, %xmm12
	vmovdqa	.LC3(%rip), %xmm1
	vpaddq	440(%rsp), %xmm1, %xmm0
	vpaddq	344(%rsp), %xmm0, %xmm0
	vpsrlq	$27, %xmm0, %xmm1
	vpsllq	$37, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm4
	vmovdqa	.LC4(%rip), %xmm1
	vpaddq	440(%rsp), %xmm1, %xmm0
	vpaddq	328(%rsp), %xmm0, %xmm0
	vpsrlq	$5, %xmm0, %xmm1
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm12, %xmm8, %xmm0
	vpxor	%xmm1, %xmm4, %xmm13
	vpxor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm0, %xmm4, %xmm4
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm4, %xmm2, %xmm4
	vpaddq	%xmm12, %xmm3, %xmm12
	vpaddq	%xmm12, %xmm4, %xmm0
	vpaddq	%xmm8, %xmm10, %xmm8
	vpaddq	%xmm1, %xmm8, %xmm13
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	.LC5(%rip), %xmm13, %xmm14
	vpaddq	.LC8(%rip), %xmm1, %xmm1
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm4, %xmm14, %xmm4
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm4, %xmm14
	vpsrlq	$45, %xmm12, %xmm13
	vpsllq	$7, %xmm4, %xmm4
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm14, %xmm4, %xmm4
	vpor	%xmm13, %xmm12, %xmm13
	vpaddq	%xmm0, %xmm8, %xmm12
	vpaddq	%xmm0, %xmm1, %xmm0
	vpsrlq	$33, %xmm12, %xmm8
	vpsrlq	$11, %xmm0, %xmm1
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm8, %xmm12, %xmm8
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm13, %xmm4, %xmm0
	vpxor	%xmm1, %xmm8, %xmm12
	vpxor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm8, %xmm0, %xmm0
	vpxor	%xmm12, %xmm13, %xmm13
	vpxor	%xmm12, %xmm4, %xmm4
	vpaddq	_ZL14preCompConstV2+64(%rip), %xmm1, %xmm1
	vpaddq	_ZL14preCompConstV2+80(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+96(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm0, %xmm8
	vpaddq	.LC1(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+112(%rip), %xmm4, %xmm4
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	%xmm1, %xmm4, %xmm12
	vpaddq	%xmm12, %xmm0, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm0
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm0, %xmm14, %xmm0
	vpor	%xmm13, %xmm12, %xmm13
	vpaddq	.LC3(%rip), %xmm8, %xmm12
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpaddq	%xmm4, %xmm12, %xmm4
	vpaddq	%xmm1, %xmm8, %xmm1
	vpsrlq	$27, %xmm4, %xmm12
	vpsrlq	$5, %xmm1, %xmm8
	vpsllq	$37, %xmm4, %xmm4
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm12, %xmm4, %xmm4
	vpor	%xmm8, %xmm1, %xmm8
	vpxor	%xmm13, %xmm0, %xmm1
	vpxor	%xmm8, %xmm4, %xmm12
	vpxor	%xmm1, %xmm8, %xmm8
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm13, %xmm12, %xmm13
	vpxor	%xmm0, %xmm12, %xmm0
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	%xmm1, %xmm2, %xmm2
	vmovdqa	%xmm13, 568(%rsp)
	vpaddq	%xmm13, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm10, %xmm10
	vmovdqa	%xmm8, 536(%rsp)
	vpaddq	%xmm5, %xmm10, %xmm8
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm5, %xmm5
	vmovdqa	%xmm1, 552(%rsp)
	vpaddq	%xmm3, %xmm2, %xmm1
	vpaddq	%xmm1, %xmm10, %xmm10
	vpaddq	%xmm1, %xmm5, %xmm5
	vpsrlq	$53, %xmm10, %xmm4
	vpsllq	$23, %xmm5, %xmm1
	vpsllq	$11, %xmm10, %xmm10
	vpor	%xmm4, %xmm10, %xmm4
	vpsrlq	$41, %xmm5, %xmm10
	vpaddq	.LC3(%rip), %xmm8, %xmm5
	vpor	%xmm10, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm5, %xmm2
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpsrlq	$27, %xmm2, %xmm5
	vpaddq	%xmm3, %xmm8, %xmm8
	vpsllq	$37, %xmm2, %xmm2
	vpsllq	$59, %xmm8, %xmm3
	vpor	%xmm5, %xmm2, %xmm5
	vpsrlq	$5, %xmm8, %xmm2
	vpor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm3, %xmm5, %xmm8
	vpxor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm2, %xmm5, %xmm2
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm3, %xmm9, %xmm9
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm6, %xmm5
	vpaddq	%xmm4, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm11, %xmm10
	vpaddq	.LC1(%rip), %xmm11, %xmm11
	vpaddq	.LC2(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm11, %xmm11
	vpaddq	%xmm5, %xmm9, %xmm9
	vpsrlq	$53, %xmm11, %xmm8
	vpsllq	$23, %xmm9, %xmm5
	vpsllq	$11, %xmm11, %xmm11
	vpor	%xmm8, %xmm11, %xmm8
	vpsrlq	$41, %xmm9, %xmm11
	vpaddq	.LC3(%rip), %xmm10, %xmm9
	vpor	%xmm11, %xmm5, %xmm5
	vpaddq	%xmm6, %xmm9, %xmm6
	vpaddq	.LC4(%rip), %xmm10, %xmm10
	vpsrlq	$27, %xmm6, %xmm9
	vpaddq	%xmm7, %xmm10, %xmm10
	vpsllq	$37, %xmm6, %xmm6
	vpsllq	$59, %xmm10, %xmm7
	vpor	%xmm9, %xmm6, %xmm9
	vpsrlq	$5, %xmm10, %xmm6
	vpor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm7, %xmm9, %xmm10
	vpxor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpxor	%xmm5, %xmm10, %xmm5
	vpxor	%xmm8, %xmm10, %xmm8
	vpaddq	680(%rsp), %xmm7, %xmm14
	vpaddq	584(%rsp), %xmm6, %xmm13
	vpaddq	744(%rsp), %xmm5, %xmm9
	vpaddq	%xmm9, %xmm13, %xmm12
	vpaddq	%xmm8, %xmm15, %xmm15
	vpaddq	%xmm14, %xmm15, %xmm10
	vpaddq	.LC1(%rip), %xmm15, %xmm15
	vpaddq	.LC2(%rip), %xmm14, %xmm14
	vpaddq	%xmm12, %xmm15, %xmm15
	vpaddq	%xmm12, %xmm14, %xmm14
	vpsrlq	$53, %xmm15, %xmm11
	vpsllq	$23, %xmm14, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpor	%xmm11, %xmm15, %xmm11
	vpsrlq	$41, %xmm14, %xmm15
	vpaddq	.LC3(%rip), %xmm10, %xmm14
	vpor	%xmm15, %xmm12, %xmm12
	vpaddq	.LC4(%rip), %xmm10, %xmm10
	vpaddq	%xmm13, %xmm14, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$27, %xmm13, %xmm14
	vpsrlq	$5, %xmm9, %xmm10
	vpsllq	$37, %xmm13, %xmm13
	vpsllq	$59, %xmm9, %xmm9
	vpor	%xmm14, %xmm13, %xmm14
	vpor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm12, %xmm11, %xmm9
	vpxor	%xmm10, %xmm14, %xmm13
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm9, %xmm14, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm11, %xmm13, %xmm11
	vpaddq	_ZL14preCompConstV2+160(%rip), %xmm10, %xmm10
	vpaddq	_ZL14preCompConstV2+176(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+128(%rip), %xmm12, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm9
	vpaddq	_ZL14preCompConstV2+144(%rip), %xmm11, %xmm11
	vpaddq	%xmm10, %xmm11, %xmm13
	vpaddq	.LC7(%rip), %xmm11, %xmm11
	vpaddq	.LC5(%rip), %xmm13, %xmm15
	vpaddq	.LC8(%rip), %xmm10, %xmm10
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm14, %xmm15, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm14, %xmm15
	vpsrlq	$45, %xmm12, %xmm13
	vpsllq	$7, %xmm14, %xmm14
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	%xmm9, %xmm11, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$33, %xmm13, %xmm11
	vpsrlq	$11, %xmm9, %xmm10
	vpsllq	$31, %xmm13, %xmm13
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm11, %xmm13, %xmm11
	vpor	%xmm10, %xmm9, %xmm13
	vpxor	%xmm12, %xmm14, %xmm10
	vpxor	%xmm13, %xmm11, %xmm9
	vpxor	%xmm13, %xmm10, %xmm13
	vpxor	%xmm11, %xmm10, %xmm10
	vpxor	%xmm9, %xmm12, %xmm12
	vpxor	%xmm9, %xmm14, %xmm9
	vpaddq	%xmm13, %xmm5, %xmm5
	vpaddq	%xmm8, %xmm10, %xmm8
	vmovdqa	%xmm13, 744(%rsp)
	vpaddq	%xmm12, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm6, %xmm6
	vpaddq	.LC8(%rip), %xmm7, %xmm7
	vmovdqa	%xmm12, 680(%rsp)
	vpaddq	%xmm5, %xmm6, %xmm12
	vmovdqa	%xmm9, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$57, %xmm6, %xmm9
	vpsllq	$7, %xmm6, %xmm6
	vpor	%xmm9, %xmm6, %xmm9
	vpsrlq	$45, %xmm5, %xmm6
	vpsllq	$19, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm11
	vpaddq	%xmm12, %xmm8, %xmm5
	vpaddq	%xmm12, %xmm7, %xmm12
	vpsrlq	$33, %xmm5, %xmm6
	vpsllq	$31, %xmm5, %xmm8
	vpsrlq	$11, %xmm12, %xmm5
	vpor	%xmm6, %xmm8, %xmm8
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm5, %xmm12, %xmm5
	vpxor	%xmm11, %xmm9, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm5, %xmm7, %xmm5
	vpxor	%xmm8, %xmm7, %xmm8
	vpxor	%xmm6, %xmm11, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC7(%rip), %xmm4, %xmm4
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm1, %xmm2, %xmm12
	vpaddq	.LC8(%rip), %xmm3, %xmm3
	vpaddq	%xmm1, %xmm11, %xmm1
	vpaddq	%xmm2, %xmm9, %xmm2
	vpsrlq	$57, %xmm2, %xmm9
	vpsllq	$7, %xmm2, %xmm2
	vpor	%xmm9, %xmm2, %xmm9
	vpsrlq	$45, %xmm1, %xmm2
	vpsllq	$19, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm11
	vpaddq	%xmm12, %xmm4, %xmm1
	vpaddq	%xmm12, %xmm3, %xmm12
	vpsrlq	$33, %xmm1, %xmm2
	vpsllq	$31, %xmm1, %xmm4
	vpsrlq	$11, %xmm12, %xmm1
	vpor	%xmm2, %xmm4, %xmm4
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm1, %xmm12, %xmm1
	vpxor	%xmm11, %xmm9, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm1, %xmm3, %xmm1
	vpxor	%xmm4, %xmm3, %xmm4
	vpxor	%xmm2, %xmm11, %xmm3
	vpxor	%xmm2, %xmm9, %xmm2
	vpaddq	568(%rsp), %xmm1, %xmm13
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	536(%rsp), %xmm3, %xmm12
	vpaddq	%xmm12, %xmm0, %xmm14
	vpaddq	.LC8(%rip), %xmm12, %xmm12
	vpaddq	552(%rsp), %xmm2, %xmm11
	vpaddq	.LC5(%rip), %xmm14, %xmm15
	vpaddq	%xmm13, %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm14, %xmm14
	vpaddq	%xmm11, %xmm15, %xmm11
	vpaddq	%xmm13, %xmm14, %xmm13
	vpsrlq	$57, %xmm11, %xmm15
	vpsrlq	$45, %xmm13, %xmm14
	vpaddq	.LC7(%rip), %xmm0, %xmm0
	vpsllq	$7, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm0, %xmm0
	vpor	%xmm15, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm12, %xmm9
	vpsllq	$19, %xmm13, %xmm13
	vpor	%xmm14, %xmm13, %xmm13
	vpsrlq	$33, %xmm0, %xmm14
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm14, %xmm0, %xmm14
	vpsrlq	$11, %xmm9, %xmm0
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm13, %xmm11, %xmm12
	vpxor	%xmm0, %xmm14, %xmm9
	vpxor	%xmm0, %xmm12, %xmm0
	vpxor	%xmm14, %xmm12, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+192(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+208(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+224(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+240(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm4, %xmm4
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC1(%rip), %xmm4, %xmm4
	vmovdqa	%xmm9, 536(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 552(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm4, %xmm4
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm4, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm4, %xmm4
	vpor	%xmm9, %xmm4, %xmm9
	vpsrlq	$41, %xmm3, %xmm4
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm4, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm4
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm4, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm7, %xmm7
	vpaddq	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm0, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm6, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm8
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vpaddq	.LC2(%rip), %xmm7, %xmm7
	vpaddq	%xmm4, %xmm8, %xmm8
	vpaddq	%xmm4, %xmm7, %xmm7
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm7, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm7, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm7
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm7, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$27, %xmm6, %xmm7
	vpsllq	$37, %xmm6, %xmm6
	vpor	%xmm7, %xmm6, %xmm8
	vpsrlq	$5, %xmm5, %xmm6
	vpsllq	$59, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpxor	%xmm4, %xmm9, %xmm5
	vpxor	%xmm6, %xmm8, %xmm7
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm7, %xmm4
	vpxor	%xmm9, %xmm7, %xmm7
	vpaddq	680(%rsp), %xmm6, %xmm12
	vpaddq	584(%rsp), %xmm5, %xmm9
	vpaddq	744(%rsp), %xmm4, %xmm13
	vpaddq	%xmm13, %xmm9, %xmm11
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm12, %xmm10, %xmm8
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$53, %xmm15, %xmm10
	vpsrlq	$41, %xmm11, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpsllq	$23, %xmm11, %xmm11
	vpor	%xmm10, %xmm15, %xmm10
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	.LC3(%rip), %xmm8, %xmm12
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm12, %xmm9
	vpaddq	%xmm13, %xmm8, %xmm13
	vpsrlq	$27, %xmm9, %xmm12
	vpsrlq	$5, %xmm13, %xmm8
	vpsllq	$37, %xmm9, %xmm9
	vpsllq	$59, %xmm13, %xmm13
	vpor	%xmm12, %xmm9, %xmm12
	vpor	%xmm8, %xmm13, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm12, %xmm13
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm11, %xmm13, %xmm11
	vpxor	%xmm10, %xmm13, %xmm10
	vpaddq	_ZL14preCompConstV2+288(%rip), %xmm9, %xmm9
	vpxor	%xmm8, %xmm12, %xmm13
	vpaddq	_ZL14preCompConstV2+256(%rip), %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+272(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	_ZL14preCompConstV2+304(%rip), %xmm13, %xmm13
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vmovdqa	%xmm11, 680(%rsp)
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	552(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	536(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+320(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+336(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+352(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+368(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm8, %xmm8
	vpaddq	%xmm3, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vmovdqa	%xmm9, 536(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 552(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm8, %xmm8
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm3, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm8, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm8
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm8, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm9
	vpaddq	%xmm9, %xmm5, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm7
	vpaddq	%xmm6, %xmm7, %xmm11
	vpaddq	.LC1(%rip), %xmm7, %xmm7
	vpaddq	.LC2(%rip), %xmm6, %xmm6
	vpaddq	%xmm4, %xmm7, %xmm8
	vpaddq	%xmm4, %xmm6, %xmm6
	vpsrlq	$53, %xmm8, %xmm7
	vpsllq	$23, %xmm6, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm7, %xmm8, %xmm7
	vpsrlq	$41, %xmm6, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm6
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$27, %xmm5, %xmm6
	vpsllq	$37, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm8
	vpsrlq	$5, %xmm9, %xmm5
	vpsllq	$59, %xmm9, %xmm6
	vpor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm6, %xmm8, %xmm9
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm9, %xmm4
	vpxor	%xmm7, %xmm9, %xmm7
	vpaddq	680(%rsp), %xmm6, %xmm11
	vpaddq	584(%rsp), %xmm5, %xmm8
	vpaddq	744(%rsp), %xmm4, %xmm12
	vpaddq	%xmm12, %xmm8, %xmm9
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm9, %xmm10, %xmm13
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$53, %xmm13, %xmm10
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$11, %xmm13, %xmm13
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm10, %xmm13, %xmm10
	vpor	%xmm11, %xmm9, %xmm11
	vpaddq	.LC3(%rip), %xmm15, %xmm9
	vpaddq	.LC4(%rip), %xmm15, %xmm15
	vpaddq	%xmm8, %xmm9, %xmm8
	vpaddq	%xmm12, %xmm15, %xmm12
	vpsrlq	$27, %xmm8, %xmm9
	vpsllq	$37, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm13
	vpsrlq	$5, %xmm12, %xmm8
	vpsllq	$59, %xmm12, %xmm12
	vpor	%xmm8, %xmm12, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm13, %xmm12
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm8, %xmm13, %xmm13
	vpxor	%xmm11, %xmm12, %xmm11
	vpxor	%xmm10, %xmm12, %xmm10
	vpaddq	_ZL14preCompConstV2+416(%rip), %xmm9, %xmm9
	vpaddq	_ZL14preCompConstV2+432(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+384(%rip), %xmm11, %xmm11
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	_ZL14preCompConstV2+400(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vmovdqa	%xmm11, 680(%rsp)
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	552(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	536(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+448(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+464(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+480(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+496(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm13
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm13, %xmm8, %xmm8
	vpaddq	.LC1(%rip), %xmm8, %xmm11
	vmovdqa	%xmm9, 552(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm9
	vpaddq	%xmm9, %xmm11, %xmm11
	vpsrlq	$53, %xmm11, %xmm12
	vpsllq	$11, %xmm11, %xmm11
	vpor	%xmm12, %xmm11, %xmm12
	vmovdqa	%xmm0, 504(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm11
	vpaddq	%xmm3, %xmm8, %xmm0
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm11, %xmm9, %xmm14
	vpaddq	.LC3(%rip), %xmm0, %xmm11
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm2, %xmm11, %xmm11
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$27, %xmm11, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpor	%xmm9, %xmm11, %xmm9
	vpsrlq	$5, %xmm0, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vmovdqa	%xmm13, 536(%rsp)
	vpxor	%xmm14, %xmm12, %xmm0
	vpxor	%xmm11, %xmm9, %xmm13
	vpxor	%xmm0, %xmm11, %xmm11
	vpxor	%xmm14, %xmm13, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm0, %xmm9, %xmm0
	vpaddq	%xmm11, %xmm6, %xmm11
	vpaddq	%xmm14, %xmm4, %xmm14
	vpaddq	%xmm12, %xmm7, %xmm12
	vpaddq	%xmm11, %xmm12, %xmm4
	vpaddq	.LC1(%rip), %xmm12, %xmm12
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm0, %xmm5, %xmm0
	vpaddq	%xmm14, %xmm0, %xmm5
	vpaddq	%xmm5, %xmm12, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$53, %xmm6, %xmm7
	vpsllq	$11, %xmm6, %xmm12
	vpsrlq	$41, %xmm5, %xmm6
	vpor	%xmm7, %xmm12, %xmm12
	vpsllq	$23, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpaddq	.LC3(%rip), %xmm4, %xmm5
	vpaddq	.LC4(%rip), %xmm4, %xmm4
	vpaddq	%xmm0, %xmm5, %xmm0
	vpaddq	%xmm14, %xmm4, %xmm14
	vpsrlq	$27, %xmm0, %xmm5
	vpsllq	$59, %xmm14, %xmm11
	vpsllq	$37, %xmm0, %xmm0
	vpor	%xmm5, %xmm0, %xmm7
	vpsrlq	$5, %xmm14, %xmm0
	vpor	%xmm0, %xmm11, %xmm11
	vmovq	64(%rdi), %xmm5
	vpinsrq	$1, 128(%rdi), %xmm5, %xmm15
	vpxor	%xmm11, %xmm7, %xmm4
	vpxor	%xmm6, %xmm12, %xmm0
	vpxor	%xmm12, %xmm4, %xmm12
	vpxor	%xmm0, %xmm11, %xmm11
	vpxor	%xmm6, %xmm4, %xmm6
	vpaddq	%xmm12, %xmm10, %xmm10
	vpxor	%xmm15, %xmm10, %xmm10
	vpaddq	680(%rsp), %xmm11, %xmm4
	vpxor	%xmm0, %xmm7, %xmm7
	vpaddq	744(%rsp), %xmm6, %xmm0
	vmovdqu	%xmm10, 760(%rsp)
	movq	760(%rsp), %r9
	vpaddq	584(%rsp), %xmm7, %xmm13
	movq	%r9, (%rax)
	vmovdqu	%xmm10, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 64(%rax)
	vmovq	72(%rdi), %xmm9
	vpinsrq	$1, 136(%rdi), %xmm9, %xmm14
	vpxor	%xmm14, %xmm4, %xmm4
	vmovdqu	%xmm4, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 8(%rax)
	vmovdqu	%xmm4, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 72(%rax)
	vmovq	80(%rdi), %xmm4
	vpinsrq	$1, 144(%rdi), %xmm4, %xmm10
	vpxor	%xmm10, %xmm13, %xmm13
	vmovdqu	%xmm13, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 16(%rax)
	vmovdqu	%xmm13, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 80(%rax)
	vmovq	88(%rdi), %xmm5
	vpinsrq	$1, 152(%rdi), %xmm5, %xmm9
	vpxor	%xmm9, %xmm0, %xmm0
	vmovdqu	%xmm0, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 24(%rax)
	vmovdqu	%xmm0, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 88(%rax)
	vmovq	96(%rdi), %xmm0
	vpinsrq	$1, 160(%rdi), %xmm0, %xmm5
	vpxor	%xmm5, %xmm8, %xmm8
	vmovdqu	%xmm8, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 32(%rax)
	vmovdqu	%xmm8, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 96(%rax)
	vmovq	104(%rdi), %xmm8
	vpinsrq	$1, 168(%rdi), %xmm8, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 40(%rax)
	vmovdqu	%xmm3, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 104(%rax)
	vmovq	112(%rdi), %xmm0
	vpinsrq	$1, 176(%rdi), %xmm0, %xmm3
	vpxor	%xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 48(%rax)
	vmovdqu	%xmm2, 760(%rsp)
	movq	768(%rsp), %r9
	movq	%r9, 112(%rax)
	vmovq	120(%rdi), %xmm2
	vpinsrq	$1, 184(%rdi), %xmm2, %xmm0
	vpaddq	%xmm9, %xmm10, %xmm2
	subq	$-128, %rdi
	vpxor	%xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 760(%rsp)
	movq	760(%rsp), %r9
	movq	%r9, 56(%rax)
	vmovdqu	%xmm1, 760(%rsp)
	vpaddq	%xmm14, %xmm15, %xmm1
	vpaddq	.LC2(%rip), %xmm14, %xmm14
	vpaddq	.LC1(%rip), %xmm15, %xmm15
	vpaddq	%xmm2, %xmm15, %xmm15
	vpaddq	%xmm2, %xmm14, %xmm2
	vpsrlq	$53, %xmm15, %xmm8
	vpsrlq	$41, %xmm2, %xmm13
	vpsllq	$11, %xmm15, %xmm15
	vpsllq	$23, %xmm2, %xmm2
	vpor	%xmm8, %xmm15, %xmm8
	vpor	%xmm13, %xmm2, %xmm14
	vpaddq	.LC3(%rip), %xmm1, %xmm2
	vpaddq	.LC4(%rip), %xmm1, %xmm1
	vpaddq	%xmm10, %xmm2, %xmm10
	vpaddq	%xmm9, %xmm1, %xmm9
	vpsrlq	$27, %xmm10, %xmm2
	vpsrlq	$5, %xmm9, %xmm1
	vpsllq	$37, %xmm10, %xmm10
	vpsllq	$59, %xmm9, %xmm9
	vpor	%xmm2, %xmm10, %xmm13
	movq	768(%rsp), %r9
	vpor	%xmm1, %xmm9, %xmm2
	vpxor	%xmm14, %xmm8, %xmm1
	movq	%r9, 120(%rax)
	subq	$-128, %rax
	cmpq	%rsi, %r8
	vpxor	%xmm2, %xmm13, %xmm10
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm13, %xmm13
	vpxor	%xmm14, %xmm10, %xmm9
	vpxor	%xmm8, %xmm10, %xmm8
	vpaddq	_ZL14preCompConstV2+32(%rip), %xmm2, %xmm2
	vpaddq	_ZL14preCompConstV2+48(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2(%rip), %xmm9, %xmm9
	vpaddq	%xmm9, %xmm13, %xmm1
	vpaddq	_ZL14preCompConstV2+16(%rip), %xmm8, %xmm8
	vpaddq	%xmm2, %xmm8, %xmm10
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	.LC5(%rip), %xmm10, %xmm14
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	.LC6(%rip), %xmm10, %xmm10
	vpaddq	%xmm13, %xmm14, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$57, %xmm13, %xmm14
	vpsrlq	$45, %xmm9, %xmm10
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm9, %xmm9
	vpor	%xmm14, %xmm13, %xmm13
	vpor	%xmm10, %xmm9, %xmm14
	vpaddq	%xmm1, %xmm8, %xmm9
	vpaddq	%xmm1, %xmm2, %xmm1
	vpsrlq	$33, %xmm9, %xmm8
	vpsrlq	$11, %xmm1, %xmm2
	vpsllq	$31, %xmm9, %xmm9
	vpsllq	$53, %xmm1, %xmm1
	vpor	%xmm8, %xmm9, %xmm8
	vpor	%xmm2, %xmm1, %xmm9
	vpxor	%xmm14, %xmm13, %xmm15
	vpxor	%xmm9, %xmm8, %xmm1
	vpxor	%xmm9, %xmm15, %xmm9
	vpxor	%xmm8, %xmm15, %xmm15
	vpxor	%xmm1, %xmm14, %xmm14
	vpxor	%xmm1, %xmm13, %xmm1
	vpaddq	%xmm9, %xmm6, %xmm6
	vpaddq	%xmm12, %xmm15, %xmm12
	vmovdqa	%xmm9, 744(%rsp)
	vpaddq	%xmm14, %xmm11, %xmm11
	vpaddq	%xmm11, %xmm12, %xmm2
	vpaddq	.LC8(%rip), %xmm11, %xmm11
	vpaddq	%xmm1, %xmm7, %xmm7
	vpaddq	.LC5(%rip), %xmm2, %xmm8
	vmovdqa	%xmm1, 584(%rsp)
	vpaddq	.LC6(%rip), %xmm2, %xmm2
	vpaddq	%xmm6, %xmm7, %xmm1
	vpaddq	%xmm7, %xmm8, %xmm8
	vpaddq	%xmm6, %xmm2, %xmm6
	vpsrlq	$57, %xmm8, %xmm7
	vpsrlq	$45, %xmm6, %xmm2
	vpsllq	$7, %xmm8, %xmm8
	vpsllq	$19, %xmm6, %xmm6
	vpor	%xmm7, %xmm8, %xmm7
	vpaddq	.LC7(%rip), %xmm12, %xmm12
	vpor	%xmm2, %xmm6, %xmm8
	vpaddq	%xmm1, %xmm12, %xmm12
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$33, %xmm12, %xmm2
	vpsrlq	$11, %xmm1, %xmm6
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm1, %xmm1
	vpor	%xmm2, %xmm12, %xmm2
	vpor	%xmm6, %xmm1, %xmm6
	vpxor	%xmm8, %xmm7, %xmm10
	vmovdqa	%xmm14, 680(%rsp)
	vpxor	%xmm6, %xmm2, %xmm1
	vpxor	%xmm6, %xmm10, %xmm6
	vpxor	%xmm2, %xmm10, %xmm10
	vpaddq	%xmm0, %xmm3, %xmm2
	vpxor	%xmm1, %xmm8, %xmm8
	vpxor	%xmm1, %xmm7, %xmm7
	vpaddq	%xmm4, %xmm5, %xmm1
	vpaddq	.LC1(%rip), %xmm5, %xmm5
	vpaddq	.LC2(%rip), %xmm4, %xmm4
	vpaddq	%xmm2, %xmm5, %xmm9
	vpaddq	%xmm2, %xmm4, %xmm2
	vpsrlq	$53, %xmm9, %xmm5
	vpsrlq	$41, %xmm2, %xmm4
	vpsllq	$11, %xmm9, %xmm9
	vpsllq	$23, %xmm2, %xmm2
	vpor	%xmm5, %xmm9, %xmm5
	vpor	%xmm4, %xmm2, %xmm9
	vpaddq	.LC3(%rip), %xmm1, %xmm2
	vpaddq	.LC4(%rip), %xmm1, %xmm1
	vpaddq	%xmm3, %xmm2, %xmm3
	vpaddq	%xmm0, %xmm1, %xmm0
	vpsrlq	$27, %xmm3, %xmm2
	vpsrlq	$5, %xmm0, %xmm1
	vpsllq	$37, %xmm3, %xmm3
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm2, %xmm3, %xmm2
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm9, %xmm5, %xmm0
	vpxor	%xmm1, %xmm2, %xmm4
	vpxor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm0, %xmm2, %xmm2
	vpxor	%xmm9, %xmm4, %xmm3
	vpxor	%xmm5, %xmm4, %xmm4
	vpaddq	%xmm1, %xmm8, %xmm1
	vpaddq	%xmm2, %xmm7, %xmm2
	vpaddq	%xmm3, %xmm6, %xmm3
	vpaddq	%xmm3, %xmm2, %xmm0
	vpaddq	%xmm4, %xmm10, %xmm4
	vpaddq	%xmm1, %xmm4, %xmm5
	vpaddq	.LC7(%rip), %xmm4, %xmm4
	vpaddq	.LC5(%rip), %xmm5, %xmm9
	vpaddq	.LC8(%rip), %xmm1, %xmm1
	vpaddq	%xmm2, %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm5, %xmm5
	vpsrlq	$57, %xmm9, %xmm2
	vpaddq	%xmm3, %xmm5, %xmm5
	vpsllq	$7, %xmm9, %xmm9
	vpsllq	$19, %xmm5, %xmm3
	vpor	%xmm2, %xmm9, %xmm2
	vpsrlq	$45, %xmm5, %xmm9
	vpaddq	%xmm0, %xmm4, %xmm5
	vpor	%xmm9, %xmm3, %xmm3
	vpsrlq	$33, %xmm5, %xmm4
	vpaddq	%xmm0, %xmm1, %xmm0
	vpsllq	$31, %xmm5, %xmm5
	vpsrlq	$11, %xmm0, %xmm1
	vpor	%xmm4, %xmm5, %xmm4
	vpsllq	$53, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm1
	vpxor	%xmm3, %xmm2, %xmm5
	vpxor	%xmm1, %xmm4, %xmm0
	vpxor	%xmm1, %xmm5, %xmm1
	vpxor	%xmm4, %xmm5, %xmm4
	vpxor	%xmm0, %xmm3, %xmm3
	vpxor	%xmm0, %xmm2, %xmm2
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	536(%rsp), %xmm4, %xmm14
	vpaddq	552(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	504(%rsp), %xmm2, %xmm0
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	%xmm12, %xmm0, %xmm5
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm5, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm0, %xmm11, %xmm0
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpsrlq	$57, %xmm0, %xmm11
	vpaddq	%xmm5, %xmm9, %xmm9
	vpsllq	$7, %xmm0, %xmm0
	vpsllq	$53, %xmm9, %xmm5
	vpor	%xmm11, %xmm0, %xmm0
	vpsrlq	$45, %xmm12, %xmm11
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm11, %xmm12, %xmm13
	vpsrlq	$11, %xmm9, %xmm12
	vpsrlq	$33, %xmm14, %xmm11
	vpor	%xmm12, %xmm5, %xmm5
	vpsllq	$31, %xmm14, %xmm14
	vpor	%xmm11, %xmm14, %xmm11
	vpxor	%xmm13, %xmm0, %xmm14
	vpxor	%xmm5, %xmm11, %xmm9
	vpxor	%xmm5, %xmm14, %xmm5
	vpxor	%xmm11, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm0, %xmm9
	vpaddq	_ZL14preCompConstV2+64(%rip), %xmm5, %xmm5
	vpaddq	_ZL14preCompConstV2+80(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+96(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm11
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+112(%rip), %xmm9, %xmm9
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm5, %xmm9, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm0
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm0, %xmm14, %xmm0
	vpor	%xmm13, %xmm12, %xmm13
	vpaddq	.LC3(%rip), %xmm11, %xmm12
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm9, %xmm12, %xmm9
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$27, %xmm9, %xmm12
	vpsrlq	$5, %xmm5, %xmm11
	vpsllq	$37, %xmm9, %xmm9
	vpsllq	$59, %xmm5, %xmm5
	vpor	%xmm12, %xmm9, %xmm9
	vpor	%xmm11, %xmm5, %xmm11
	vpxor	%xmm13, %xmm0, %xmm5
	vpxor	%xmm11, %xmm9, %xmm12
	vpxor	%xmm5, %xmm11, %xmm11
	vpxor	%xmm5, %xmm9, %xmm5
	vpxor	%xmm13, %xmm12, %xmm13
	vpxor	%xmm0, %xmm12, %xmm0
	vpaddq	%xmm11, %xmm3, %xmm3
	vpaddq	%xmm5, %xmm2, %xmm2
	vmovdqa	%xmm13, 568(%rsp)
	vpaddq	%xmm13, %xmm1, %xmm9
	vpaddq	%xmm9, %xmm2, %xmm1
	vpaddq	%xmm0, %xmm4, %xmm4
	vmovdqa	%xmm11, 536(%rsp)
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC1(%rip), %xmm4, %xmm4
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vpaddq	%xmm1, %xmm3, %xmm3
	vmovdqa	%xmm5, 552(%rsp)
	vpaddq	%xmm1, %xmm4, %xmm5
	vpsllq	$23, %xmm3, %xmm1
	vpsrlq	$53, %xmm5, %xmm4
	vpsllq	$11, %xmm5, %xmm5
	vpor	%xmm4, %xmm5, %xmm4
	vpsrlq	$41, %xmm3, %xmm5
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm5, %xmm1, %xmm1
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm5
	vpsrlq	$5, %xmm9, %xmm2
	vpsllq	$59, %xmm9, %xmm3
	vpor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm3, %xmm5, %xmm9
	vpxor	%xmm2, %xmm3, %xmm3
	vpxor	%xmm2, %xmm5, %xmm2
	vpxor	%xmm1, %xmm9, %xmm1
	vpxor	%xmm4, %xmm9, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm8
	vpaddq	%xmm2, %xmm7, %xmm7
	vpaddq	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm5
	vpaddq	%xmm4, %xmm10, %xmm10
	vpaddq	%xmm8, %xmm10, %xmm11
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm8, %xmm8
	vpaddq	%xmm5, %xmm10, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm8
	vpsrlq	$53, %xmm9, %xmm10
	vpsllq	$23, %xmm8, %xmm5
	vpsllq	$11, %xmm9, %xmm9
	vpor	%xmm10, %xmm9, %xmm10
	vpsrlq	$41, %xmm8, %xmm9
	vpaddq	.LC3(%rip), %xmm11, %xmm8
	vpor	%xmm9, %xmm5, %xmm5
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm7, %xmm8, %xmm7
	vpaddq	%xmm6, %xmm11, %xmm6
	vpsrlq	$27, %xmm7, %xmm8
	vpsllq	$37, %xmm7, %xmm7
	vpor	%xmm8, %xmm7, %xmm9
	vpsrlq	$5, %xmm6, %xmm7
	vpsllq	$59, %xmm6, %xmm6
	vpor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm10, %xmm6
	vpxor	%xmm7, %xmm9, %xmm8
	vpxor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm10, %xmm8, %xmm8
	vpaddq	680(%rsp), %xmm7, %xmm14
	vpaddq	584(%rsp), %xmm6, %xmm13
	vpaddq	744(%rsp), %xmm5, %xmm9
	vpaddq	%xmm9, %xmm13, %xmm12
	vpaddq	%xmm8, %xmm15, %xmm15
	vpaddq	%xmm14, %xmm15, %xmm10
	vpaddq	.LC1(%rip), %xmm15, %xmm15
	vpaddq	.LC2(%rip), %xmm14, %xmm14
	vpaddq	%xmm12, %xmm15, %xmm15
	vpaddq	%xmm12, %xmm14, %xmm14
	vpsrlq	$53, %xmm15, %xmm11
	vpsllq	$23, %xmm14, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpor	%xmm11, %xmm15, %xmm11
	vpsrlq	$41, %xmm14, %xmm15
	vpaddq	.LC3(%rip), %xmm10, %xmm14
	vpor	%xmm15, %xmm12, %xmm12
	vpaddq	.LC4(%rip), %xmm10, %xmm10
	vpaddq	%xmm13, %xmm14, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$27, %xmm13, %xmm14
	vpsrlq	$5, %xmm9, %xmm10
	vpsllq	$37, %xmm13, %xmm13
	vpsllq	$59, %xmm9, %xmm9
	vpor	%xmm14, %xmm13, %xmm14
	vpor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm12, %xmm11, %xmm9
	vpxor	%xmm10, %xmm14, %xmm13
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm9, %xmm14, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm11, %xmm13, %xmm11
	vpaddq	_ZL14preCompConstV2+160(%rip), %xmm10, %xmm10
	vpaddq	_ZL14preCompConstV2+176(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+128(%rip), %xmm12, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm9
	vpaddq	_ZL14preCompConstV2+144(%rip), %xmm11, %xmm11
	vpaddq	%xmm10, %xmm11, %xmm13
	vpaddq	.LC7(%rip), %xmm11, %xmm11
	vpaddq	.LC5(%rip), %xmm13, %xmm15
	vpaddq	.LC8(%rip), %xmm10, %xmm10
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm14, %xmm15, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$57, %xmm14, %xmm15
	vpsrlq	$45, %xmm12, %xmm13
	vpsllq	$7, %xmm14, %xmm14
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	%xmm9, %xmm11, %xmm13
	vpaddq	%xmm9, %xmm10, %xmm9
	vpsrlq	$33, %xmm13, %xmm11
	vpsrlq	$11, %xmm9, %xmm10
	vpsllq	$31, %xmm13, %xmm13
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm11, %xmm13, %xmm11
	vpor	%xmm10, %xmm9, %xmm13
	vpxor	%xmm12, %xmm14, %xmm10
	vpxor	%xmm13, %xmm11, %xmm9
	vpxor	%xmm13, %xmm10, %xmm13
	vpxor	%xmm11, %xmm10, %xmm10
	vpxor	%xmm9, %xmm12, %xmm12
	vpxor	%xmm9, %xmm14, %xmm9
	vpaddq	%xmm13, %xmm5, %xmm5
	vpaddq	%xmm8, %xmm10, %xmm8
	vmovdqa	%xmm13, 744(%rsp)
	vpaddq	%xmm12, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC7(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm6, %xmm6
	vpaddq	.LC8(%rip), %xmm7, %xmm7
	vmovdqa	%xmm12, 680(%rsp)
	vpaddq	%xmm5, %xmm6, %xmm12
	vmovdqa	%xmm9, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$57, %xmm6, %xmm9
	vpsllq	$7, %xmm6, %xmm6
	vpor	%xmm9, %xmm6, %xmm9
	vpsrlq	$45, %xmm5, %xmm6
	vpsllq	$19, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm11
	vpaddq	%xmm12, %xmm8, %xmm5
	vpaddq	%xmm12, %xmm7, %xmm12
	vpsrlq	$33, %xmm5, %xmm6
	vpsllq	$31, %xmm5, %xmm8
	vpsrlq	$11, %xmm12, %xmm5
	vpor	%xmm6, %xmm8, %xmm8
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm5, %xmm12, %xmm5
	vpxor	%xmm11, %xmm9, %xmm7
	vpxor	%xmm5, %xmm8, %xmm6
	vpxor	%xmm5, %xmm7, %xmm5
	vpxor	%xmm8, %xmm7, %xmm8
	vpxor	%xmm6, %xmm11, %xmm7
	vpxor	%xmm6, %xmm9, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm4, %xmm8, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC7(%rip), %xmm4, %xmm4
	vpaddq	.LC5(%rip), %xmm11, %xmm9
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	.LC6(%rip), %xmm11, %xmm11
	vpaddq	%xmm1, %xmm2, %xmm12
	vpaddq	.LC8(%rip), %xmm3, %xmm3
	vpaddq	%xmm1, %xmm11, %xmm1
	vpaddq	%xmm2, %xmm9, %xmm2
	vpsrlq	$57, %xmm2, %xmm9
	vpsllq	$7, %xmm2, %xmm2
	vpor	%xmm9, %xmm2, %xmm9
	vpsrlq	$45, %xmm1, %xmm2
	vpsllq	$19, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm11
	vpaddq	%xmm12, %xmm4, %xmm1
	vpaddq	%xmm12, %xmm3, %xmm12
	vpsrlq	$33, %xmm1, %xmm2
	vpsllq	$31, %xmm1, %xmm4
	vpsrlq	$11, %xmm12, %xmm1
	vpor	%xmm2, %xmm4, %xmm4
	vpsllq	$53, %xmm12, %xmm12
	vpor	%xmm1, %xmm12, %xmm1
	vpxor	%xmm11, %xmm9, %xmm3
	vpxor	%xmm1, %xmm4, %xmm2
	vpxor	%xmm1, %xmm3, %xmm1
	vpxor	%xmm4, %xmm3, %xmm4
	vpxor	%xmm2, %xmm11, %xmm3
	vpxor	%xmm2, %xmm9, %xmm2
	vpaddq	568(%rsp), %xmm1, %xmm13
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	536(%rsp), %xmm3, %xmm12
	vpaddq	%xmm12, %xmm0, %xmm14
	vpaddq	.LC8(%rip), %xmm12, %xmm12
	vpaddq	552(%rsp), %xmm2, %xmm11
	vpaddq	.LC5(%rip), %xmm14, %xmm15
	vpaddq	%xmm13, %xmm11, %xmm9
	vpaddq	.LC6(%rip), %xmm14, %xmm14
	vpaddq	%xmm11, %xmm15, %xmm11
	vpaddq	%xmm13, %xmm14, %xmm13
	vpsrlq	$57, %xmm11, %xmm15
	vpsrlq	$45, %xmm13, %xmm14
	vpaddq	.LC7(%rip), %xmm0, %xmm0
	vpsllq	$7, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm0, %xmm0
	vpor	%xmm15, %xmm11, %xmm11
	vpaddq	%xmm9, %xmm12, %xmm9
	vpsllq	$19, %xmm13, %xmm13
	vpor	%xmm14, %xmm13, %xmm13
	vpsrlq	$33, %xmm0, %xmm14
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm14, %xmm0, %xmm14
	vpsrlq	$11, %xmm9, %xmm0
	vpsllq	$53, %xmm9, %xmm9
	vpor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm13, %xmm11, %xmm12
	vpxor	%xmm0, %xmm14, %xmm9
	vpxor	%xmm0, %xmm12, %xmm0
	vpxor	%xmm14, %xmm12, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+192(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+208(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+224(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+240(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm4, %xmm4
	vpaddq	%xmm3, %xmm4, %xmm11
	vpaddq	.LC1(%rip), %xmm4, %xmm4
	vmovdqa	%xmm9, 536(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 552(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm4, %xmm4
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm4, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm4, %xmm4
	vpor	%xmm9, %xmm4, %xmm9
	vpsrlq	$41, %xmm3, %xmm4
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm4, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm4
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm4, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm7, %xmm7
	vpaddq	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm0, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm6, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm8
	vpaddq	%xmm7, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vpaddq	.LC2(%rip), %xmm7, %xmm7
	vpaddq	%xmm4, %xmm8, %xmm8
	vpaddq	%xmm4, %xmm7, %xmm7
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm7, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm7, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm7
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm6, %xmm7, %xmm6
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$27, %xmm6, %xmm7
	vpsllq	$37, %xmm6, %xmm6
	vpor	%xmm7, %xmm6, %xmm8
	vpsrlq	$5, %xmm5, %xmm6
	vpsllq	$59, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpxor	%xmm4, %xmm9, %xmm5
	vpxor	%xmm6, %xmm8, %xmm7
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm7, %xmm4
	vpxor	%xmm9, %xmm7, %xmm7
	vpaddq	680(%rsp), %xmm6, %xmm12
	vpaddq	584(%rsp), %xmm5, %xmm9
	vpaddq	744(%rsp), %xmm4, %xmm13
	vpaddq	%xmm13, %xmm9, %xmm11
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm12, %xmm10, %xmm8
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$53, %xmm15, %xmm10
	vpsrlq	$41, %xmm11, %xmm12
	vpsllq	$11, %xmm15, %xmm15
	vpsllq	$23, %xmm11, %xmm11
	vpor	%xmm10, %xmm15, %xmm10
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	.LC3(%rip), %xmm8, %xmm12
	vpaddq	.LC4(%rip), %xmm8, %xmm8
	vpaddq	%xmm9, %xmm12, %xmm9
	vpaddq	%xmm13, %xmm8, %xmm13
	vpsrlq	$27, %xmm9, %xmm12
	vpsrlq	$5, %xmm13, %xmm8
	vpsllq	$37, %xmm9, %xmm9
	vpsllq	$59, %xmm13, %xmm13
	vpor	%xmm12, %xmm9, %xmm12
	vpor	%xmm8, %xmm13, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm12, %xmm13
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm11, %xmm13, %xmm11
	vpxor	%xmm10, %xmm13, %xmm10
	vpaddq	_ZL14preCompConstV2+288(%rip), %xmm9, %xmm9
	vpxor	%xmm8, %xmm12, %xmm13
	vpaddq	_ZL14preCompConstV2+256(%rip), %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+272(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	_ZL14preCompConstV2+304(%rip), %xmm13, %xmm13
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vmovdqa	%xmm11, 680(%rsp)
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	552(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	536(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+320(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+336(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+352(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+368(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vmovdqa	%xmm12, 568(%rsp)
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm14, %xmm8, %xmm8
	vpaddq	%xmm3, %xmm8, %xmm11
	vpaddq	.LC1(%rip), %xmm8, %xmm8
	vmovdqa	%xmm9, 536(%rsp)
	vpaddq	.LC2(%rip), %xmm3, %xmm3
	vmovdqa	%xmm0, 552(%rsp)
	vpaddq	%xmm1, %xmm2, %xmm0
	vpaddq	%xmm0, %xmm8, %xmm8
	vpaddq	%xmm0, %xmm3, %xmm3
	vpsrlq	$53, %xmm8, %xmm9
	vpsllq	$23, %xmm3, %xmm0
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm9
	vpsrlq	$41, %xmm3, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm3
	vpor	%xmm8, %xmm0, %xmm0
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm2, %xmm3, %xmm2
	vpaddq	%xmm1, %xmm11, %xmm1
	vpsrlq	$27, %xmm2, %xmm3
	vpsllq	$37, %xmm2, %xmm2
	vpor	%xmm3, %xmm2, %xmm8
	vpsrlq	$5, %xmm1, %xmm2
	vpsllq	$59, %xmm1, %xmm1
	vpor	%xmm2, %xmm1, %xmm2
	vpxor	%xmm0, %xmm9, %xmm1
	vpxor	%xmm2, %xmm8, %xmm3
	vpxor	%xmm1, %xmm2, %xmm2
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm0, %xmm3, %xmm0
	vpxor	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm6
	vpaddq	%xmm1, %xmm5, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm9
	vpaddq	%xmm9, %xmm5, %xmm4
	vpaddq	%xmm3, %xmm7, %xmm7
	vpaddq	%xmm6, %xmm7, %xmm11
	vpaddq	.LC1(%rip), %xmm7, %xmm7
	vpaddq	.LC2(%rip), %xmm6, %xmm6
	vpaddq	%xmm4, %xmm7, %xmm8
	vpaddq	%xmm4, %xmm6, %xmm6
	vpsrlq	$53, %xmm8, %xmm7
	vpsllq	$23, %xmm6, %xmm4
	vpsllq	$11, %xmm8, %xmm8
	vpor	%xmm7, %xmm8, %xmm7
	vpsrlq	$41, %xmm6, %xmm8
	vpaddq	.LC3(%rip), %xmm11, %xmm6
	vpor	%xmm8, %xmm4, %xmm4
	vpaddq	.LC4(%rip), %xmm11, %xmm11
	vpaddq	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$27, %xmm5, %xmm6
	vpsllq	$37, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm8
	vpsrlq	$5, %xmm9, %xmm5
	vpsllq	$59, %xmm9, %xmm6
	vpor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm6, %xmm8, %xmm9
	vpxor	%xmm5, %xmm6, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpxor	%xmm4, %xmm9, %xmm4
	vpxor	%xmm7, %xmm9, %xmm7
	vpaddq	680(%rsp), %xmm6, %xmm11
	vpaddq	584(%rsp), %xmm5, %xmm8
	vpaddq	744(%rsp), %xmm4, %xmm12
	vpaddq	%xmm12, %xmm8, %xmm9
	vpaddq	%xmm7, %xmm10, %xmm10
	vpaddq	%xmm11, %xmm10, %xmm15
	vpaddq	.LC1(%rip), %xmm10, %xmm10
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm9, %xmm10, %xmm13
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$53, %xmm13, %xmm10
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$11, %xmm13, %xmm13
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm10, %xmm13, %xmm10
	vpor	%xmm11, %xmm9, %xmm11
	vpaddq	.LC3(%rip), %xmm15, %xmm9
	vpaddq	.LC4(%rip), %xmm15, %xmm15
	vpaddq	%xmm8, %xmm9, %xmm8
	vpaddq	%xmm12, %xmm15, %xmm12
	vpsrlq	$27, %xmm8, %xmm9
	vpsllq	$37, %xmm8, %xmm8
	vpor	%xmm9, %xmm8, %xmm13
	vpsrlq	$5, %xmm12, %xmm8
	vpsllq	$59, %xmm12, %xmm12
	vpor	%xmm8, %xmm12, %xmm9
	vpxor	%xmm11, %xmm10, %xmm8
	vpxor	%xmm9, %xmm13, %xmm12
	vpxor	%xmm8, %xmm9, %xmm9
	vpxor	%xmm8, %xmm13, %xmm13
	vpxor	%xmm11, %xmm12, %xmm11
	vpxor	%xmm10, %xmm12, %xmm10
	vpaddq	_ZL14preCompConstV2+416(%rip), %xmm9, %xmm9
	vpaddq	_ZL14preCompConstV2+432(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+384(%rip), %xmm11, %xmm11
	vpaddq	%xmm11, %xmm13, %xmm8
	vpaddq	_ZL14preCompConstV2+400(%rip), %xmm10, %xmm10
	vpaddq	%xmm9, %xmm10, %xmm12
	vpaddq	.LC7(%rip), %xmm10, %xmm10
	vpaddq	.LC5(%rip), %xmm12, %xmm15
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC6(%rip), %xmm12, %xmm12
	vpaddq	%xmm13, %xmm15, %xmm13
	vpaddq	%xmm11, %xmm12, %xmm11
	vpsrlq	$57, %xmm13, %xmm15
	vpsrlq	$45, %xmm11, %xmm12
	vpsllq	$7, %xmm13, %xmm13
	vpsllq	$19, %xmm11, %xmm11
	vpor	%xmm15, %xmm13, %xmm13
	vpor	%xmm12, %xmm11, %xmm11
	vpaddq	%xmm8, %xmm10, %xmm12
	vpaddq	%xmm8, %xmm9, %xmm8
	vpsrlq	$33, %xmm12, %xmm10
	vpsrlq	$11, %xmm8, %xmm9
	vpsllq	$31, %xmm12, %xmm12
	vpsllq	$53, %xmm8, %xmm8
	vpor	%xmm10, %xmm12, %xmm10
	vpor	%xmm9, %xmm8, %xmm12
	vpxor	%xmm11, %xmm13, %xmm9
	vpxor	%xmm12, %xmm10, %xmm8
	vpxor	%xmm12, %xmm9, %xmm12
	vpxor	%xmm10, %xmm9, %xmm10
	vpxor	%xmm8, %xmm11, %xmm11
	vpxor	%xmm8, %xmm13, %xmm8
	vpaddq	%xmm12, %xmm4, %xmm4
	vpaddq	%xmm7, %xmm10, %xmm7
	vmovdqa	%xmm12, 744(%rsp)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm9
	vpaddq	.LC7(%rip), %xmm7, %xmm7
	vmovdqa	%xmm11, 680(%rsp)
	vpaddq	%xmm8, %xmm5, %xmm5
	vpaddq	.LC8(%rip), %xmm6, %xmm6
	vpaddq	%xmm4, %xmm5, %xmm11
	vmovdqa	%xmm8, 584(%rsp)
	vpaddq	.LC5(%rip), %xmm9, %xmm8
	vpaddq	.LC6(%rip), %xmm9, %xmm9
	vpaddq	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm4, %xmm9, %xmm4
	vpsrlq	$57, %xmm5, %xmm8
	vpsllq	$7, %xmm5, %xmm5
	vpor	%xmm8, %xmm5, %xmm8
	vpsrlq	$45, %xmm4, %xmm5
	vpsllq	$19, %xmm4, %xmm4
	vpor	%xmm5, %xmm4, %xmm9
	vpaddq	%xmm11, %xmm7, %xmm4
	vpaddq	%xmm11, %xmm6, %xmm11
	vpsrlq	$33, %xmm4, %xmm5
	vpsllq	$31, %xmm4, %xmm7
	vpsrlq	$11, %xmm11, %xmm4
	vpor	%xmm5, %xmm7, %xmm7
	vpsllq	$53, %xmm11, %xmm11
	vpor	%xmm4, %xmm11, %xmm4
	vpxor	%xmm9, %xmm8, %xmm6
	vpxor	%xmm4, %xmm7, %xmm5
	vpxor	%xmm4, %xmm6, %xmm4
	vpxor	%xmm7, %xmm6, %xmm7
	vpxor	%xmm5, %xmm9, %xmm6
	vpxor	%xmm5, %xmm8, %xmm5
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm3, %xmm7, %xmm3
	vpaddq	%xmm2, %xmm6, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm8
	vpaddq	.LC7(%rip), %xmm3, %xmm3
	vpaddq	.LC5(%rip), %xmm8, %xmm9
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	.LC6(%rip), %xmm8, %xmm8
	vpaddq	%xmm0, %xmm1, %xmm12
	vpaddq	.LC8(%rip), %xmm2, %xmm2
	vpaddq	%xmm0, %xmm8, %xmm0
	vpaddq	%xmm1, %xmm9, %xmm1
	vpsrlq	$57, %xmm1, %xmm9
	vpsllq	$7, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm9
	vpsrlq	$45, %xmm0, %xmm1
	vpsllq	$19, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm0
	vpaddq	%xmm12, %xmm2, %xmm12
	vpsrlq	$33, %xmm0, %xmm1
	vpsllq	$31, %xmm0, %xmm0
	vpor	%xmm1, %xmm0, %xmm3
	vpsrlq	$11, %xmm12, %xmm0
	vpsllq	$53, %xmm12, %xmm1
	vpor	%xmm0, %xmm1, %xmm1
	vpxor	%xmm11, %xmm9, %xmm8
	vpxor	%xmm1, %xmm3, %xmm0
	vpxor	%xmm1, %xmm8, %xmm1
	vpxor	%xmm3, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm2
	vpxor	%xmm0, %xmm11, %xmm3
	vpaddq	568(%rsp), %xmm1, %xmm12
	vpaddq	%xmm14, %xmm8, %xmm14
	vpaddq	552(%rsp), %xmm2, %xmm0
	vpaddq	%xmm12, %xmm0, %xmm15
	vpaddq	536(%rsp), %xmm3, %xmm9
	vpaddq	%xmm9, %xmm14, %xmm13
	vpaddq	.LC8(%rip), %xmm9, %xmm9
	vpaddq	.LC5(%rip), %xmm13, %xmm11
	vpaddq	.LC7(%rip), %xmm14, %xmm14
	vpaddq	.LC6(%rip), %xmm13, %xmm13
	vpaddq	%xmm15, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm15, %xmm9, %xmm15
	vpaddq	%xmm0, %xmm11, %xmm0
	vpsrlq	$57, %xmm0, %xmm11
	vpsllq	$7, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpsrlq	$45, %xmm12, %xmm0
	vpsllq	$19, %xmm12, %xmm12
	vpor	%xmm0, %xmm12, %xmm13
	vpsrlq	$33, %xmm14, %xmm0
	vpsllq	$31, %xmm14, %xmm12
	vpor	%xmm0, %xmm12, %xmm12
	vpsrlq	$11, %xmm15, %xmm0
	vpsllq	$53, %xmm15, %xmm15
	vpor	%xmm0, %xmm15, %xmm0
	vpxor	%xmm13, %xmm11, %xmm14
	vpxor	%xmm0, %xmm12, %xmm9
	vpxor	%xmm0, %xmm14, %xmm0
	vpxor	%xmm12, %xmm14, %xmm14
	vpxor	%xmm9, %xmm13, %xmm13
	vpxor	%xmm9, %xmm11, %xmm11
	vpaddq	_ZL14preCompConstV2+448(%rip), %xmm0, %xmm0
	vpaddq	_ZL14preCompConstV2+464(%rip), %xmm14, %xmm14
	vpaddq	_ZL14preCompConstV2+480(%rip), %xmm13, %xmm13
	vpaddq	%xmm13, %xmm14, %xmm9
	vpaddq	.LC2(%rip), %xmm13, %xmm13
	vpaddq	_ZL14preCompConstV2+496(%rip), %xmm11, %xmm11
	vpaddq	.LC1(%rip), %xmm14, %xmm14
	vpaddq	%xmm0, %xmm11, %xmm12
	vpaddq	%xmm12, %xmm14, %xmm14
	vpaddq	%xmm12, %xmm13, %xmm12
	vpsrlq	$53, %xmm14, %xmm15
	vpsrlq	$41, %xmm12, %xmm13
	vpsllq	$11, %xmm14, %xmm14
	vpsllq	$23, %xmm12, %xmm12
	vpor	%xmm15, %xmm14, %xmm14
	vpor	%xmm13, %xmm12, %xmm12
	vpaddq	.LC3(%rip), %xmm9, %xmm13
	vpaddq	.LC4(%rip), %xmm9, %xmm9
	vpaddq	%xmm11, %xmm13, %xmm11
	vpaddq	%xmm0, %xmm9, %xmm0
	vpsrlq	$27, %xmm11, %xmm13
	vpsrlq	$5, %xmm0, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm13, %xmm11, %xmm11
	vpor	%xmm9, %xmm0, %xmm9
	vpxor	%xmm12, %xmm14, %xmm0
	vpxor	%xmm9, %xmm11, %xmm13
	vpxor	%xmm0, %xmm9, %xmm9
	vpxor	%xmm0, %xmm11, %xmm0
	vpxor	%xmm12, %xmm13, %xmm12
	vpxor	%xmm14, %xmm13, %xmm14
	vpaddq	%xmm9, %xmm3, %xmm3
	vpaddq	%xmm0, %xmm2, %xmm2
	vpaddq	%xmm12, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm2, %xmm9
	vpaddq	%xmm14, %xmm8, %xmm8
	vpaddq	%xmm3, %xmm8, %xmm0
	vpaddq	.LC1(%rip), %xmm8, %xmm11
	vpaddq	%xmm9, %xmm11, %xmm11
	vpsrlq	$53, %xmm11, %xmm12
	vpsllq	$11, %xmm11, %xmm11
	vpor	%xmm12, %xmm11, %xmm12
	vpaddq	.LC2(%rip), %xmm3, %xmm11
	vpaddq	%xmm9, %xmm11, %xmm9
	vpsrlq	$41, %xmm9, %xmm11
	vpsllq	$23, %xmm9, %xmm9
	vpor	%xmm11, %xmm9, %xmm14
	vpaddq	.LC3(%rip), %xmm0, %xmm11
	vpaddq	.LC4(%rip), %xmm0, %xmm0
	vpaddq	%xmm2, %xmm11, %xmm11
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$27, %xmm11, %xmm9
	vpsllq	$37, %xmm11, %xmm11
	vpor	%xmm9, %xmm11, %xmm9
	vpsrlq	$5, %xmm0, %xmm11
	vpsllq	$59, %xmm0, %xmm0
	vpor	%xmm11, %xmm0, %xmm11
	vpxor	%xmm14, %xmm12, %xmm0
	vpxor	%xmm11, %xmm9, %xmm13
	vpxor	%xmm0, %xmm11, %xmm11
	vpxor	%xmm0, %xmm9, %xmm0
	vpxor	%xmm14, %xmm13, %xmm14
	vpxor	%xmm12, %xmm13, %xmm12
	vpaddq	%xmm11, %xmm6, %xmm11
	vpaddq	%xmm0, %xmm5, %xmm0
	vpaddq	%xmm14, %xmm4, %xmm14
	vpaddq	%xmm14, %xmm0, %xmm5
	vpaddq	%xmm12, %xmm7, %xmm12
	vpaddq	%xmm11, %xmm12, %xmm4
	vpaddq	.LC1(%rip), %xmm12, %xmm12
	vpaddq	.LC2(%rip), %xmm11, %xmm11
	vpaddq	%xmm5, %xmm12, %xmm12
	vpaddq	%xmm5, %xmm11, %xmm5
	vpsrlq	$53, %xmm12, %xmm6
	vpsllq	$11, %xmm12, %xmm12
	vpor	%xmm6, %xmm12, %xmm12
	vpsrlq	$41, %xmm5, %xmm6
	vpsllq	$23, %xmm5, %xmm5
	vpor	%xmm6, %xmm5, %xmm6
	vpaddq	.LC3(%rip), %xmm4, %xmm5
	vpaddq	.LC4(%rip), %xmm4, %xmm4
	vpaddq	%xmm0, %xmm5, %xmm0
	vpaddq	%xmm14, %xmm4, %xmm14
	vpsrlq	$27, %xmm0, %xmm5
	vpsllq	$37, %xmm0, %xmm0
	vpor	%xmm5, %xmm0, %xmm5
	vpsrlq	$5, %xmm14, %xmm0
	vpsllq	$59, %xmm14, %xmm14
	vpor	%xmm0, %xmm14, %xmm4
	vpxor	%xmm6, %xmm12, %xmm0
	vpxor	%xmm4, %xmm5, %xmm7
	vpxor	%xmm0, %xmm4, %xmm4
	vpxor	%xmm0, %xmm5, %xmm0
	vpxor	%xmm6, %xmm7, %xmm6
	vpxor	%xmm12, %xmm7, %xmm12
	vpaddq	680(%rsp), %xmm4, %xmm4
	vpaddq	584(%rsp), %xmm0, %xmm0
	vpaddq	744(%rsp), %xmm6, %xmm6
	vpaddq	%xmm12, %xmm10, %xmm10
	vpaddq	648(%rsp), %xmm10, %xmm10
	vmovdqa	%xmm10, 648(%rsp)
	vpaddq	632(%rsp), %xmm4, %xmm4
	vpaddq	728(%rsp), %xmm0, %xmm0
	vpaddq	712(%rsp), %xmm6, %xmm6
	vpaddq	696(%rsp), %xmm8, %xmm8
	vpaddq	664(%rsp), %xmm3, %xmm3
	vpaddq	616(%rsp), %xmm2, %xmm2
	vpaddq	600(%rsp), %xmm1, %xmm1
	vmovdqa	%xmm10, 1032(%rsp)
	vmovdqa	%xmm4, 632(%rsp)
	vmovdqa	%xmm4, 1048(%rsp)
	vmovdqa	%xmm0, 728(%rsp)
	vmovdqa	%xmm0, 1064(%rsp)
	vmovdqa	%xmm6, 712(%rsp)
	vmovdqa	%xmm6, 1080(%rsp)
	vmovdqa	%xmm8, 696(%rsp)
	vmovdqa	%xmm8, 1096(%rsp)
	vmovdqa	%xmm3, 664(%rsp)
	vmovdqa	%xmm3, 1112(%rsp)
	vmovdqa	%xmm2, 616(%rsp)
	vmovdqa	%xmm2, 1128(%rsp)
	vmovdqa	%xmm1, 600(%rsp)
	vmovdqa	%xmm1, 1144(%rsp)
	jne	.L70
	movq	88(%rsp), %r9
	movq	%rsi, %r8
	salq	$4, %r8
	movq	%r8, 104(%rsp)
	leaq	(%r9,%rsi,2), %r9
	movq	%r9, 88(%rsp)
.L71:
	vpshufd	$14, 1032(%rsp), %xmm0
	movq	832(%rsp), %rbx
	addq	%rsi, %rsi
	vpaddq	1032(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 776(%rsp)
	vpshufd	$14, 1048(%rsp), %xmm0
	vpaddq	1048(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 784(%rsp)
	vpshufd	$14, 1064(%rsp), %xmm0
	vpaddq	1064(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 792(%rsp)
	vpshufd	$14, 1080(%rsp), %xmm0
	vpaddq	1080(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 800(%rsp)
	vpshufd	$14, 1096(%rsp), %xmm0
	vpaddq	1096(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 808(%rsp)
	vpshufd	$14, 1112(%rsp), %xmm0
	vpaddq	1112(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 816(%rsp)
	vpshufd	$14, 1128(%rsp), %xmm0
	vpaddq	1128(%rsp), %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rax
	addq	%rax, 824(%rsp)
	vpshufd	$14, 1144(%rsp), %xmm0
	vpaddq	1144(%rsp), %xmm0, %xmm0
	vmovq	%xmm0, 536(%rsp)
	addq	%rbx, 536(%rsp)
	movq	536(%rsp), %rdi
	movq	%rdi, 832(%rsp)
	movq	72(%rsp), %r8
	movq	%rsi, 80(%rsp)
	shrq	$6, %r8
	cmpq	%rsi, %r8
	movq	%r8, 136(%rsp)
	jbe	.L69
	movq	128(%rsp), %rax
	leaq	(%rcx,%rdx), %r10
	movabsq	$7667772426219706969, %r9
	movabsq	$4195444129992158507, %r11
	movq	816(%rsp), %rbx
	movq	784(%rsp), %rsi
	addq	%r11, %rcx
	movq	%r10, 392(%rsp)
	movq	776(%rsp), %rdi
	addq	%r9, %rax
	movq	%rcx, 248(%rsp)
	movq	792(%rsp), %rcx
	addq	%r10, %rax
	movabsq	$6220970056051541820, %r10
	movq	%rbx, 488(%rsp)
	rorq	$41, %rax
	addq	%r10, %rdx
	movabsq	$-8247349341179448980, %rbx
	movq	%rax, 552(%rsp)
	movq	808(%rsp), %rax
	movq	%rdx, 264(%rsp)
	movq	824(%rsp), %rdx
	movq	%rcx, 408(%rsp)
	movq	%rsi, 440(%rsp)
	leaq	(%r12,%rbx), %rcx
	movq	%rax, 504(%rsp)
	leaq	0(%r13,%r9), %rsi
	leaq	(%r15,%r14), %rax
	movq	%rdx, 472(%rsp)
	movq	%rdi, 424(%rsp)
	leaq	0(%r13,%r12), %rdx
	addq	%rax, %rcx
	addq	%rax, %rsi
	leaq	(%r15,%r11), %rdi
	leaq	(%r14,%r10), %rax
	rorq	$41, %rsi
	rorq	$53, %rcx
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rsi, %rdi
	rorq	$5, %rdx
	rorq	$27, %rax
	xorq	%rcx, %rdi
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	40(%rsp), %rax
	addq	48(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	64(%rsp), %rcx
	movq	%rsi, 376(%rsp)
	movq	56(%rsp), %rsi
	movq	%rdx, 296(%rsp)
	movq	56(%rsp), %rdx
	addq	%rbx, %rcx
	addq	64(%rsp), %rdx
	movq	%rdi, 344(%rsp)
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	40(%rsp), %rdi
	addq	%rax, %rsi
	movq	48(%rsp), %rax
	rorq	$53, %rcx
	movq	%r8, 360(%rsp)
	rorq	$41, %rsi
	addq	%r11, %rdi
	addq	%r10, %rax
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rcx, %rdi
	rorq	$27, %rax
	rorq	$5, %rdx
	movq	%rax, %r8
	xorq	%rdx, %r8
	xorq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%rdi, %rdx
	xorq	%rcx, %r8
	xorq	%rax, %rdi
	movq	%rsi, 200(%rsp)
	movq	(%rsp), %rax
	movq	32(%rsp), %rcx
	addq	8(%rsp), %rax
	movq	16(%rsp), %rsi
	movq	%rdx, 232(%rsp)
	movq	32(%rsp), %rdx
	addq	16(%rsp), %rdx
	addq	%rbx, %rcx
	movq	%rdi, 280(%rsp)
	movq	(%rsp), %rdi
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	%r8, 216(%rsp)
	addq	%rax, %rsi
	movq	8(%rsp), %rax
	rorq	$53, %rcx
	addq	%r11, %rdi
	rorq	$41, %rsi
	addq	%r10, %rax
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	%rsi, %rdi
	rorq	$27, %rax
	rorq	$5, %rdx
	xorq	%rcx, %rdi
	movq	%rax, %r8
	xorq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	%rsi, 168(%rsp)
	movq	104(%rsp), %rax
	movq	96(%rsp), %rcx
	movq	%r8, 184(%rsp)
	movq	88(%rsp), %rsi
	movq	800(%rsp), %r8
	salq	$3, %rax
	movq	%rdx, 312(%rsp)
	movq	%rdi, 328(%rsp)
	addq	%rax, %rcx
	addq	-80(%rsp), %rax
	movq	%r8, 456(%rsp)
	movq	%rcx, 648(%rsp)
	movq	%rsi, 632(%rsp)
	movq	%rax, 520(%rsp)
	movq	136(%rsp), %rax
	subq	80(%rsp), %rax
	addq	88(%rsp), %rax
	movq	%rax, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L72:
	addq	$1, 632(%rsp)
	movq	120(%rsp), %rcx
	movabsq	$-8247349341179448980, %rdi
	xorq	632(%rsp), %rcx
	movq	128(%rsp), %rsi
	movabsq	$7860495443403156170, %r9
	movq	264(%rsp), %rax
	movq	552(%rsp), %rdx
	movabsq	$-6792583489299504353, %r12
	movabsq	$-3833335565246798826, %r10
	movabsq	$2580067509209331373, %r14
	movabsq	$-1457182779415996031, %r11
	movabsq	$-6802927476391842224, %r13
	movabsq	$-3329063056561552456, %rbx
	addq	%rcx, %rsi
	addq	392(%rsp), %rcx
	addq	%rsi, %rax
	addq	248(%rsp), %rsi
	rolq	$37, %rax
	addq	%rdi, %rcx
	movq	552(%rsp), %rdi
	rolq	$59, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r8
	xorq	%rcx, %rdx
	xorq	%rax, %r8
	xorq	%rdx, %rsi
	xorq	%rdx, %rax
	xorq	%r8, %rcx
	xorq	%r8, %rdi
	leaq	(%rcx,%rsi), %r8
	leaq	(%rdi,%rax), %rdx
	addq	%r12, %rdi
	addq	%r14, %rsi
	addq	%r11, %rax
	addq	%r13, %rcx
	addq	%r9, %r8
	addq	%r10, %rdx
	movq	200(%rsp), %r10
	leaq	(%rdi,%r8), %r15
	addq	%rdx, %rsi
	addq	%r8, %rax
	addq	%rdx, %rcx
	rolq	$53, %rsi
	rolq	$7, %rax
	rolq	$19, %r15
	rolq	$31, %rcx
	movq	%rsi, %rdx
	movq	%r15, %rdi
	xorq	%rcx, %rdx
	movabsq	$-6657276164713376882, %r8
	xorq	%rax, %rdi
	movabsq	$-3329063056561552456, %r9
	movabsq	$-6657276164713376882, %r14
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	%rdi, 712(%rsp)
	movq	%rsi, %r12
	movq	%rdx, 664(%rsp)
	movq	%rdi, %rdx
	movq	%r15, %rdi
	addq	360(%rsp), %rdx
	addq	296(%rsp), %rdi
	movabsq	$-5426079245872290139, %r11
	addq	376(%rsp), %r12
	movq	664(%rsp), %rax
	addq	344(%rsp), %rax
	movq	%rsi, 728(%rsp)
	movq	%r15, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rdi,%rdx), %rsi
	addq	%r8, %rdi
	movq	232(%rsp), %r8
	leaq	(%r12,%rax), %rcx
	addq	%r15, %rax
	addq	%rbx, %r12
	addq	%rsi, %rax
	addq	%rsi, %r12
	movabsq	$-5426079245872290139, %rsi
	rolq	$19, %r12
	addq	%rsi, %rdx
	addq	%rcx, %rdi
	rolq	$7, %rax
	addq	%rcx, %rdx
	rolq	$53, %rdi
	movq	%r12, %r13
	rolq	$31, %rdx
	movq	%rdi, %rbx
	xorq	%rax, %r13
	xorq	%rdx, %rbx
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	movq	216(%rsp), %rdx
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	280(%rsp), %rax
	addq	%r12, %r8
	addq	%rdi, %r10
	addq	%r13, %rdx
	leaq	(%r8,%rdx), %rsi
	addq	%rbx, %rax
	leaq	(%r10,%rax), %rcx
	addq	%r15, %rax
	addq	%r9, %r10
	addq	%rsi, %rax
	addq	%rsi, %r10
	movq	168(%rsp), %r15
	rolq	$7, %rax
	rolq	$19, %r10
	addq	%r14, %r8
	addq	%r11, %rdx
	addq	%rcx, %r8
	movq	%r10, %r11
	addq	%rcx, %rdx
	rolq	$53, %r8
	xorq	%rax, %r11
	rolq	$31, %rdx
	movq	%r8, %r9
	movq	184(%rsp), %rcx
	xorq	%r11, %r8
	xorq	%rdx, %r9
	xorq	%rdx, %r11
	movq	312(%rsp), %rdx
	addq	%r8, %r15
	movq	328(%rsp), %rsi
	movq	%r15, 744(%rsp)
	xorq	%r9, %r10
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	addq	%r9, %rsi
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rsi
	xorq	%r14, %rax
	movabsq	$-3210636887397455352, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 616(%rsp)
	addq	%r8, %rsi
	movq	%r15, 600(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 744(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 680(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	696(%rsp), %r14
	rolq	$37, %rax
	addq	%rsi, %r10
	xorq	%rdx, %r9
	addq	%rcx, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r9, %r10
	xorq	%rax, %r9
	xorq	%rax, %r11
	addq	%r10, %r12
	addq	%r9, %rbx
	xorq	%r11, %r8
	xorq	%rdx, %r11
	leaq	(%r8,%rdi), %rsi
	addq	%r11, %r13
	movabsq	$7667772426219706969, %rdi
	leaq	(%r12,%r13), %rcx
	addq	%r12, %rdi
	movabsq	$6220970056051541820, %r12
	leaq	(%rsi,%rbx), %rax
	addq	%r15, %r13
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	movq	712(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %rdi
	addq	%rsi, %r12
	rolq	$23, %rdi
	leaq	(%rbx,%rcx), %rax
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	728(%rsp), %rsi
	xorq	%rbx, %r12
	xorq	%rax, %r13
	xorq	%rax, %rbx
	movq	664(%rsp), %rax
	addq	%r12, %r14
	movq	%r14, 712(%rsp)
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	movq	712(%rsp), %rdx
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%rbx, %rax
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rcx
	addq	%r14, %r15
	movabsq	$6220970056051541820, %r14
	addq	%r14, %rax
	movabsq	$4195444129992158507, %r14
	rolq	$23, %r15
	addq	%r14, %rsi
	addq	%rdx, %rax
	movq	%r15, %r14
	addq	%rdx, %rsi
	rolq	$37, %rax
	xorq	%rcx, %r14
	rolq	$59, %rsi
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	rolq	$31, %rcx
	xorq	%rcx, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	addq	%rsi, %rdi
	addq	%r12, %rcx
	movq	%r15, 712(%rsp)
	movq	%rdx, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 728(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 664(%rsp)
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	movabsq	$-5426079245872290139, %r14
	addq	%rbx, %rdi
	leaq	(%rdi,%rdx), %r12
	movabsq	$-5426079245872290139, %rdi
	rolq	$7, %rax
	addq	%rdi, %r13
	movabsq	$-6657276164713376882, %rdi
	addq	%rcx, %rdi
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %rdi
	movq	%r12, %r13
	rolq	$53, %rdi
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%rdi, %rbx
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r11
	addq	%rdi, %r8
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r10), %rcx
	addq	%rbx, %r9
	leaq	(%r8,%r9), %rsi
	addq	%r15, %r9
	movq	616(%rsp), %r15
	leaq	(%rcx,%r11), %rdx
	addq	%r14, %r11
	leaq	(%r9,%rdx), %rax
	movabsq	$-3329063056561552456, %r9
	addq	%r9, %r8
	leaq	(%r8,%rdx), %r10
	leaq	(%r11,%rsi), %rdx
	movabsq	$-6657276164713376882, %r8
	addq	%rcx, %r8
	rolq	$7, %rax
	movq	600(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	680(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	744(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 744(%rsp)
	movq	744(%rsp), %r14
	xorq	%rax, %r9
	addq	%r11, %rcx
	addq	%r9, %rsi
	movabsq	$-1087367646907149102, %rax
	addq	%r10, %rdx
	leaq	(%rdx,%rcx), %r15
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r9
	addq	%rdx, %r10
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rsi, 616(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 600(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 744(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$6220970056051541820, %rax
	addq	%rax, %r9
	addq	%rsi, %r10
	rolq	$23, %r8
	leaq	(%r9,%rcx), %rax
	addq	%rcx, %r10
	rolq	$11, %rdx
	rolq	$59, %r10
	movq	%r8, %r9
	movq	%r14, 680(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	696(%rsp), %r14
	xorq	%r11, %r8
	xorq	%rdx, %r11
	xorq	%r9, %r10
	leaq	(%r8,%rdi), %rsi
	xorq	%rax, %r9
	addq	%r10, %r12
	addq	%r11, %r13
	addq	%r9, %rbx
	movabsq	$7667772426219706969, %rdi
	leaq	(%rsi,%rbx), %rax
	leaq	(%r12,%r13), %rcx
	addq	%r12, %rdi
	movabsq	$6220970056051541820, %r12
	addq	%r15, %r13
	movq	712(%rsp), %r15
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %rdi
	addq	%rsi, %r12
	leaq	(%rbx,%rcx), %rax
	rolq	$23, %rdi
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%rdi, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	728(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	664(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 712(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	rolq	$23, %r15
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	addq	%rdx, %rsi
	addq	%r14, %rax
	addq	%r14, %rsi
	rolq	$37, %rax
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 712(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 696(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 664(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rsi, %r13
	addq	%rbx, %rdi
	addq	%rdx, %rdi
	leaq	0(%r13,%rcx), %rdx
	movabsq	$-6657276164713376882, %r13
	addq	%r13, %r12
	rolq	$19, %rdi
	rolq	$7, %rax
	addq	%r12, %rcx
	rolq	$31, %rdx
	movq	%rdi, %r12
	rolq	$53, %rcx
	xorq	%rax, %r12
	movq	%rcx, %rsi
	xorq	%r12, %rcx
	xorq	%rdx, %r12
	xorq	%rdx, %rsi
	addq	%r12, %r11
	addq	%rcx, %r8
	xorq	%rsi, %rdi
	xorq	%rax, %rsi
	addq	%rdi, %r10
	addq	%rsi, %r9
	leaq	(%r10,%r11), %rdx
	leaq	(%r8,%r9), %rbx
	addq	%r14, %r8
	addq	%r15, %r9
	movabsq	$-5426079245872290139, %r15
	leaq	(%r8,%rdx), %r14
	movq	%r13, %r8
	addq	%r15, %r11
	addq	%r10, %r8
	leaq	(%r9,%rdx), %rax
	leaq	(%r11,%rbx), %rdx
	addq	%rbx, %r8
	rolq	$19, %r14
	movq	744(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	680(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	616(%rsp), %rax
	movq	600(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 744(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	744(%rsp), %r11
	rolq	$7, %rax
	addq	%rbx, %r11
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r9
	addq	%r10, %rdx
	movq	%r11, %rbx
	addq	%r10, %r9
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%rbx, %r9
	xorq	%rdx, %r10
	xorq	%rbx, %rdx
	xorq	%r10, %rax
	xorq	%r10, %r11
	movabsq	$1649971794476935487, %r10
	leaq	(%r9,%rax), %rbx
	addq	%r10, %rbx
	leaq	(%rdx,%r11), %r10
	movq	%r10, 744(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	744(%rsp), %r10
	movq	%r10, 744(%rsp)
	movabsq	$9059564915322872455, %r10
	addq	%r10, %rdx
	movabsq	$-7724133909308953704, %r10
	addq	%rbx, %rdx
	addq	%r10, %r11
	movabsq	$3257124934342745045, %r10
	rolq	$11, %rdx
	addq	%rbx, %r11
	addq	%r10, %r9
	movabsq	$8809261046177890769, %rbx
	addq	744(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	744(%rsp), %rax
	movq	%r11, %r10
	xorq	%rdx, %r10
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%rax, %rbx
	xorq	%rax, %r10
	addq	%r9, %r14
	xorq	%rbx, %r11
	xorq	%rdx, %rbx
	addq	%r10, %r13
	addq	%rbx, %r15
	addq	%r11, %r8
	movq	%r11, 616(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 600(%rsp)
	movq	%r9, 744(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 680(%rsp)
	movabsq	$-8247349341179448980, %rdx
	movabsq	$4195444129992158507, %r10
	movabsq	$7667772426219706969, %r9
	addq	%rbx, %r13
	addq	%r10, %r8
	addq	%rdx, %r15
	addq	%r14, %r9
	leaq	(%r15,%rax), %rdx
	movabsq	$-8247349341179448980, %r14
	addq	%rax, %r9
	leaq	0(%r13,%r11), %rax
	addq	%r8, %r11
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$11, %rdx
	rolq	$37, %rax
	movq	%r11, %r8
	movq	%r9, %r10
	xorq	%rax, %r8
	xorq	%rdx, %r10
	movabsq	$7667772426219706969, %r15
	xorq	%r8, %r9
	xorq	%r10, %r11
	xorq	%rdx, %r8
	xorq	%rax, %r10
	addq	%r9, %rcx
	addq	%r8, %r12
	leaq	(%r10,%rsi), %rax
	addq	%r11, %rdi
	leaq	(%rdi,%r12), %r13
	addq	%r14, %r12
	addq	%r15, %rdi
	leaq	(%rcx,%rax), %rsi
	addq	%rbx, %rax
	movabsq	$4195444129992158507, %rbx
	addq	%rbx, %rcx
	addq	%r13, %rax
	movq	712(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	leaq	(%rcx,%r13), %r12
	rolq	$23, %rsi
	movq	696(%rsp), %r13
	rolq	$37, %rax
	rolq	$11, %rdx
	movq	%rsi, %rbx
	rolq	$59, %r12
	xorq	%rdx, %rbx
	movq	%r12, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rdi
	xorq	%rax, %rbx
	addq	%r12, %r13
	xorq	%rdi, %rsi
	xorq	%rdx, %rdi
	movq	%r13, 712(%rsp)
	movq	728(%rsp), %r14
	addq	%rdi, %r15
	movq	664(%rsp), %rax
	movabsq	$-8247349341179448980, %rdx
	addq	%r15, %r13
	addq	%rdx, %r15
	addq	%rsi, %r14
	addq	%rbx, %rax
	leaq	(%r14,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rdx
	addq	%rcx, %r15
	movabsq	$6220970056051541820, %rcx
	addq	%rcx, %rax
	rolq	$23, %r15
	leaq	(%rax,%r13), %rcx
	movabsq	$4195444129992158507, %rax
	addq	%rax, %r14
	rolq	$37, %rcx
	addq	%r13, %r14
	movq	%r15, %r13
	rolq	$59, %r14
	xorq	%rdx, %r13
	movq	%r14, %rax
	xorq	%r13, %r14
	xorq	%rcx, %rax
	xorq	%r13, %rcx
	movabsq	$-2922945419276229487, %r13
	xorq	%rax, %rdx
	xorq	%rax, %r15
	leaq	(%rdx,%r14), %rax
	addq	%r13, %rax
	leaq	(%r15,%rcx), %r13
	movq	%r13, 728(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	728(%rsp), %r13
	movq	%r13, 728(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r15
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r14
	addq	%r15, %rax
	addq	728(%rsp), %r14
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	728(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r14
	movq	%r14, %r13
	xorq	%r15, %r14
	rolq	$31, %rdx
	addq	%r14, %rsi
	movq	%r14, 728(%rsp)
	xorq	%rdx, %r13
	xorq	%r15, %rdx
	movq	%r14, preCompInternalState(%rip)
	xorq	%r13, %rax
	movq	%r13, %r15
	addq	%rdx, %rdi
	xorq	%rcx, %r15
	addq	%rax, %r12
	movabsq	$-1087367646907149102, %rcx
	leaq	(%r12,%rdi), %r14
	addq	%r15, %rbx
	movq	%rdx, preCompInternalState+8(%rip)
	leaq	(%rsi,%rbx), %r13
	addq	%rcx, %rbx
	movq	%rax, preCompInternalState+16(%rip)
	leaq	(%rbx,%r14), %rcx
	movabsq	$-3329063056561552456, %rbx
	movq	%r15, preCompInternalState+24(%rip)
	rolq	$7, %rcx
	addq	%rbx, %rsi
	movabsq	$-6657276164713376882, %rbx
	addq	%r14, %rsi
	movabsq	$-5426079245872290139, %r14
	addq	%rbx, %r12
	addq	%r14, %rdi
	rolq	$19, %rsi
	addq	%r13, %rdi
	addq	%r12, %r13
	movq	%rsi, %r14
	rolq	$53, %r13
	rolq	$31, %rdi
	xorq	%rcx, %r14
	movq	%r13, %rbx
	xorq	%r14, %r13
	xorq	%rdi, %r14
	xorq	%rdi, %rbx
	addq	%r13, %r9
	addq	%r14, %r8
	xorq	%rbx, %rsi
	xorq	%rcx, %rbx
	movabsq	$-3329063056561552456, %rdi
	addq	%rbx, %r10
	addq	%rsi, %r11
	movq	%rsi, 664(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 584(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r13, 712(%rsp)
	addq	%rbx, %rdi
	addq	%r11, %rcx
	addq	%rbx, %rsi
	rolq	$19, %rdi
	rolq	$53, %rcx
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r10
	movq	%rcx, %r9
	xorq	%rsi, %r10
	xorq	%r8, %r9
	movq	600(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	744(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	680(%rsp), %r10
	addq	616(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 568(%rsp)
	movq	%r14, 696(%rsp)
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	movabsq	$-1087367646907149102, %r14
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	rolq	$19, %r11
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$7, %r10
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %r9
	xorq	%r13, %rbx
	xorq	%r12, %r11
	xorq	%r12, %r10
	movabsq	$-5486504877919021346, %r13
	movabsq	$853475092736589577, %r12
	movabsq	$-4925106476758491821, %r14
	movabsq	$1906713845121804688, %rcx
	addq	%r11, %r13
	addq	%r9, %rcx
	addq	%r10, %r14
	addq	%rbx, %r12
	movq	%r13, InternalState+104(%rip)
	movq	%r14, InternalState+112(%rip)
	movq	%r12, InternalState+96(%rip)
	addq	%rcx, %r14
	addq	%r13, %r12
	movq	%rcx, InternalState+120(%rip)
	movabsq	$2181267548300685623, %r13
	movabsq	$-7393874248442859403, %rcx
	addq	%rcx, %rbx
	addq	%r13, %r11
	movabsq	$1295863579293049999, %rcx
	addq	%r14, %rbx
	addq	%r11, %r14
	movabsq	$6102157975113963195, %r11
	addq	%r11, %r9
	addq	%rcx, %r10
	rolq	$23, %r14
	addq	%r12, %r10
	addq	%r9, %r12
	movq	%r14, %r9
	rolq	$59, %r12
	rolq	$37, %r10
	rolq	$11, %rbx
	movq	%r12, %r13
	xorq	%rbx, %r9
	movabsq	$7667772426219706969, %r11
	xorq	%r10, %r13
	xorq	%r9, %r12
	xorq	%r9, %r10
	xorq	%r13, %r14
	xorq	%r13, %rbx
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r14, preCompInternalState+96(%rip)
	addq	568(%rsp), %r14
	addq	%rdi, %r12
	movq	%rbx, preCompInternalState+104(%rip)
	movq	%r10, preCompInternalState+120(%rip)
	addq	%r8, %rbx
	addq	%rsi, %r10
	leaq	(%r12,%rbx), %r9
	movabsq	$-8247349341179448980, %r13
	movabsq	$4195444129992158507, %r8
	movabsq	$7667772426219706969, %rsi
	movabsq	$6220970056051541820, %rdi
	leaq	(%r14,%r10), %rcx
	movq	%rbx, InternalState+64(%rip)
	movq	%r12, InternalState+72(%rip)
	addq	%r13, %rbx
	addq	%rsi, %r12
	movq	%r10, InternalState+80(%rip)
	movq	%r14, InternalState+88(%rip)
	addq	%rdi, %r10
	addq	%r8, %r14
	addq	%rcx, %rbx
	addq	%r9, %r10
	addq	%r12, %rcx
	addq	%r14, %r9
	rolq	$11, %rbx
	rolq	$23, %rcx
	rolq	$37, %r10
	rolq	$59, %r9
	movq	%rcx, %rsi
	movq	%r9, %rdi
	xorq	%rbx, %rsi
	movabsq	$6220970056051541820, %r12
	xorq	%r10, %rdi
	xorq	%rsi, %r9
	xorq	%rsi, %r10
	xorq	%rdi, %rbx
	movq	%r9, preCompInternalState+80(%rip)
	xorq	%rdi, %rcx
	movq	%rbx, preCompInternalState+72(%rip)
	addq	664(%rsp), %r9
	addq	696(%rsp), %rbx
	movq	%rcx, preCompInternalState+64(%rip)
	movq	%r10, preCompInternalState+88(%rip)
	addq	712(%rsp), %rcx
	addq	584(%rsp), %r10
	movq	520(%rsp), %r14
	movq	%r9, InternalState+40(%rip)
	leaq	(%r9,%rbx), %rsi
	movq	%rbx, InternalState+32(%rip)
	addq	%r11, %r9
	movq	%rcx, InternalState+56(%rip)
	addq	%r13, %rbx
	movq	648(%rsp), %r13
	movq	%r10, InternalState+48(%rip)
	leaq	(%rcx,%r10), %rdi
	addq	%r8, %rcx
	addq	%r12, %r10
	addq	%rsi, %r10
	addq	%rcx, %rsi
	addq	%rdi, %rbx
	rolq	$59, %rsi
	addq	%r9, %rdi
	rolq	$37, %r10
	movq	%rsi, %rcx
	rolq	$23, %rdi
	rolq	$11, %rbx
	xorq	%r10, %rcx
	movq	%rdi, %r8
	xorq	%rcx, %rdi
	xorq	%rbx, %r8
	xorq	%rcx, %rbx
	movq	%rdi, preCompInternalState+32(%rip)
	addq	728(%rsp), %rdi
	xorq	%r8, %rsi
	xorq	%r8, %r10
	movq	%rbx, preCompInternalState+40(%rip)
	movq	%rsi, preCompInternalState+48(%rip)
	movq	%r10, preCompInternalState+56(%rip)
	addq	%rax, %rsi
	addq	%r15, %r10
	addq	%rdx, %rbx
	movq	%rsi, InternalState+8(%rip)
	movq	%r10, InternalState+16(%rip)
	movq	%rbx, InternalState(%rip)
	movq	%rdi, InternalState+24(%rip)
	movabsq	$-8247349341179448980, %r15
	xorq	64(%r13), %rbx
	movabsq	$7860495443403156170, %r10
	movq	%rbx, (%r14)
	movq	64(%r13), %rax
	movabsq	$4195444129992158507, %rbx
	movq	%rax, InternalState(%rip)
	movq	72(%r13), %rax
	xorq	InternalState+8(%rip), %rax
	movq	%rax, 8(%r14)
	movq	72(%r13), %rax
	movq	%rax, InternalState+8(%rip)
	movq	80(%r13), %rax
	xorq	InternalState+16(%rip), %rax
	movq	%rax, 16(%r14)
	movq	80(%r13), %rax
	movq	%rax, InternalState+16(%rip)
	movq	88(%r13), %rax
	xorq	InternalState+24(%rip), %rax
	movq	%rax, 24(%r14)
	movq	88(%r13), %rax
	movq	%rax, InternalState+24(%rip)
	movq	96(%r13), %rax
	xorq	InternalState+64(%rip), %rax
	movq	%rax, 32(%r14)
	movq	96(%r13), %rax
	movq	%rax, InternalState+64(%rip)
	movq	104(%r13), %rax
	xorq	InternalState+72(%rip), %rax
	movq	%rax, 40(%r14)
	movq	104(%r13), %rax
	movq	%rax, InternalState+72(%rip)
	movq	112(%r13), %rax
	xorq	InternalState+80(%rip), %rax
	movq	%rax, 48(%r14)
	movq	112(%r13), %rax
	movq	%rax, InternalState+80(%rip)
	movq	120(%r13), %rax
	xorq	InternalState+88(%rip), %rax
	movq	%rax, 56(%r14)
	movq	InternalState(%rip), %rcx
	movabsq	$-6802927476391842224, %r14
	movq	InternalState+8(%rip), %rdi
	movq	InternalState+16(%rip), %rax
	movq	InternalState+24(%rip), %rsi
	movq	120(%r13), %r9
	movabsq	$-6792583489299504353, %r13
	leaq	(%rdi,%rcx), %rdx
	addq	%r11, %rdi
	addq	%r15, %rcx
	leaq	(%rsi,%rax), %r8
	addq	%rbx, %rsi
	addq	%r12, %rax
	addq	%rdx, %rsi
	addq	%rdx, %rax
	movabsq	$-1457182779415996031, %r12
	addq	%r8, %rdi
	addq	%r8, %rcx
	rolq	$59, %rsi
	rolq	$23, %rdi
	rolq	$11, %rcx
	rolq	$37, %rax
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movabsq	$-3833335565246798826, %r11
	xorq	%rax, %r8
	xorq	%rcx, %rdx
	movabsq	$2580067509209331373, %rbx
	xorq	%rdx, %rsi
	xorq	%r8, %rcx
	xorq	%r8, %rdi
	leaq	(%rcx,%rsi), %r8
	xorq	%rdx, %rax
	leaq	(%rdi,%rax), %rdx
	addq	%r13, %rdi
	addq	%r12, %rax
	addq	%r10, %r8
	movabsq	$4195444129992158507, %r12
	movabsq	$7667772426219706969, %r10
	leaq	(%rdi,%r8), %r15
	addq	%r8, %rax
	addq	%r11, %rdx
	rolq	$7, %rax
	movabsq	$-8247349341179448980, %r8
	movabsq	$6220970056051541820, %r11
	rolq	$19, %r15
	addq	%r14, %rcx
	addq	%rbx, %rsi
	addq	%rdx, %rsi
	addq	%rdx, %rcx
	movq	%r15, %rdi
	rolq	$53, %rsi
	rolq	$31, %rcx
	xorq	%rax, %rdi
	movq	%rsi, %rdx
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rcx, %rdx
	movq	%rsi, 728(%rsp)
	movq	%rdi, 712(%rsp)
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movabsq	$-3329063056561552456, %rbx
	movq	%r15, 696(%rsp)
	movq	%rdx, 664(%rsp)
	movabsq	$-1087367646907149102, %r14
	movq	InternalState+32(%rip), %rdx
	movq	InternalState+40(%rip), %rcx
	movq	InternalState+48(%rip), %rax
	movq	InternalState+56(%rip), %r15
	leaq	(%rcx,%rdx), %rsi
	addq	%r10, %rcx
	addq	%r8, %rdx
	leaq	(%r15,%rax), %rdi
	addq	%r12, %r15
	addq	%r11, %rax
	addq	%rsi, %r15
	addq	%rsi, %rax
	addq	%rdi, %rcx
	addq	%rdi, %rdx
	rolq	$59, %r15
	rolq	$23, %rcx
	rolq	$11, %rdx
	rolq	$37, %rax
	movq	%r15, %r13
	movq	%rcx, %rsi
	movabsq	$-6657276164713376882, %rdi
	xorq	%rdx, %rsi
	xorq	%rax, %r13
	xorq	%r13, %rdx
	xorq	%rsi, %r15
	addq	712(%rsp), %rdx
	addq	696(%rsp), %r15
	xorq	%rsi, %rax
	xorq	%rcx, %r13
	addq	664(%rsp), %rax
	addq	728(%rsp), %r13
	leaq	(%r15,%rdx), %rsi
	addq	%rdi, %r15
	leaq	0(%r13,%rax), %rcx
	addq	%r14, %rax
	addq	%rbx, %r13
	addq	%rsi, %rax
	addq	%rsi, %r13
	movabsq	$-5426079245872290139, %rsi
	rolq	$19, %r13
	addq	%rsi, %rdx
	addq	%rcx, %r15
	rolq	$7, %rax
	addq	%rcx, %rdx
	rolq	$53, %r15
	movq	%r13, %r12
	rolq	$31, %rdx
	movq	%r15, %r14
	xorq	%rax, %r12
	xorq	%rdx, %r14
	movq	InternalState+72(%rip), %rcx
	xorq	%r12, %r15
	xorq	%rdx, %r12
	movq	InternalState+64(%rip), %rdx
	xorq	%r14, %r13
	xorq	%rax, %r14
	movq	InternalState+80(%rip), %rax
	leaq	(%rcx,%rdx), %rdi
	addq	%r8, %rdx
	movabsq	$4195444129992158507, %r8
	leaq	(%r9,%rax), %rsi
	addq	%r11, %rax
	addq	%r10, %rcx
	addq	%rdi, %rax
	addq	%r8, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%rsi, %rcx
	addq	%r9, %rdi
	addq	%rsi, %rdx
	rolq	$23, %rcx
	rolq	$59, %rdi
	rolq	$37, %rax
	rolq	$11, %rdx
	movq	%rdi, %r9
	movq	%rcx, %rsi
	xorq	%rdx, %rsi
	xorq	%rax, %r9
	movabsq	$-1087367646907149102, %r10
	xorq	%r9, %rdx
	xorq	%rsi, %rax
	xorq	%rcx, %r9
	addq	%r14, %rax
	addq	%r15, %r9
	xorq	%rsi, %rdi
	leaq	(%rax,%r9), %rcx
	addq	%r12, %rdx
	addq	%r13, %rdi
	addq	%rbx, %r9
	movabsq	$-6657276164713376882, %rbx
	leaq	(%rdi,%rdx), %rsi
	addq	%rbx, %rdi
	addq	%r11, %rdx
	addq	%r10, %rax
	addq	%rcx, %rdi
	addq	%rsi, %r9
	addq	%rcx, %rdx
	rolq	$53, %rdi
	rolq	$31, %rdx
	addq	%rsi, %rax
	rolq	$19, %r9
	movq	%rdi, %r8
	rolq	$7, %rax
	xorq	%rdx, %r8
	movq	InternalState+96(%rip), %rcx
	movq	InternalState+104(%rip), %rsi
	movq	%r9, %r10
	movq	InternalState+120(%rip), %rbx
	xorq	%r8, %r9
	xorq	%rax, %r10
	xorq	%rax, %r8
	movq	InternalState+112(%rip), %rax
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	movabsq	$-8247349341179448980, %rdx
	leaq	(%rsi,%rcx), %r11
	addq	%rdx, %rcx
	movabsq	$7667772426219706969, %rdx
	addq	%rax, %rbx
	addq	%rdx, %rsi
	movabsq	$4195444129992158507, %rdx
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	movabsq	$6220970056051541820, %rbx
	rolq	$11, %rcx
	rolq	$23, %rsi
	addq	%rbx, %rax
	addq	InternalState+120(%rip), %rdx
	addq	%r11, %rax
	movq	%rsi, %rbx
	rolq	$37, %rax
	xorq	%rcx, %rbx
	addq	%r11, %rdx
	rolq	$59, %rdx
	movq	%rdx, %r11
	xorq	%rbx, %rdx
	xorq	%rax, %r11
	addq	%r9, %rdx
	xorq	%rbx, %rax
	xorq	%r11, %rcx
	xorq	%r11, %rsi
	addq	%r8, %rax
	addq	%rdi, %rsi
	addq	%r10, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rsi, 680(%rsp)
	movq	%rsi, %r11
	movabsq	$-1087367646907149102, %rsi
	addq	%rax, %r11
	addq	%rax, %rsi
	leaq	(%rsi,%rbx), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	680(%rsp), %rsi
	rolq	$7, %rax
	addq	%rbx, %rsi
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rcx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %rsi
	addq	%rbx, %rdx
	addq	%r11, %rcx
	movq	%rsi, %rbx
	addq	%r11, %rdx
	rolq	$31, %rcx
	xorq	%rax, %rbx
	rolq	$53, %rdx
	movq	%rdx, %r11
	xorq	%rbx, %rdx
	xorq	%rcx, %r11
	xorq	%rbx, %rcx
	xorq	%r11, %rsi
	xorq	%r11, %rax
	movabsq	$-3210636887397455352, %r11
	leaq	(%rdx,%rax), %rbx
	addq	%r11, %rbx
	leaq	(%rcx,%rsi), %r11
	movq	%r11, 744(%rsp)
	movabsq	$5597446114060141266, %r11
	addq	744(%rsp), %r11
	movq	%r11, 744(%rsp)
	movabsq	$2199824780781266189, %r11
	addq	%r11, %rcx
	movabsq	$2818044418319133066, %r11
	addq	%r11, %rsi
	movabsq	$2553129884740551573, %r11
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	addq	%r11, %rdx
	movabsq	$4652647413905693402, %rbx
	addq	744(%rsp), %rdx
	addq	%rbx, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	rolq	$11, %rcx
	movq	%rsi, %r11
	xorq	%rcx, %r11
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %rbx
	xorq	%r11, %rdx
	xorq	%rax, %r11
	xorq	%rax, %rbx
	addq	%rdx, %r9
	addq	%r11, %r8
	xorq	%rbx, %rsi
	xorq	%rcx, %rbx
	movq	%rdx, 744(%rsp)
	addq	%rbx, %r10
	movq	%rsi, 616(%rsp)
	addq	%rdi, %rsi
	leaq	(%rsi,%r8), %rax
	leaq	(%r9,%r10), %rcx
	movq	%rbx, 600(%rsp)
	movabsq	$-8247349341179448980, %rdx
	movabsq	$6220970056051541820, %rbx
	movabsq	$7667772426219706969, %rdi
	addq	%rbx, %r8
	addq	%rdx, %r10
	addq	%r9, %rdi
	leaq	(%r10,%rax), %rdx
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r9
	leaq	(%r8,%rcx), %rax
	addq	%rsi, %r9
	rolq	$23, %rdi
	rolq	$11, %rdx
	movq	%rdi, %r8
	movq	%r11, 680(%rsp)
	rolq	$37, %rax
	addq	%rcx, %r9
	xorq	%rdx, %r8
	rolq	$59, %r9
	movq	%r9, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	xorq	%rax, %r10
	leaq	(%r8,%r14), %rax
	leaq	(%r9,%r13), %r11
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	movabsq	$7667772426219706969, %r14
	leaq	(%r10,%r12), %rdx
	leaq	(%rdi,%r15), %r12
	movabsq	$-8247349341179448980, %r13
	movabsq	$4195444129992158507, %r15
	leaq	(%r12,%rax), %rsi
	leaq	(%r11,%rdx), %rcx
	addq	%r14, %r11
	addq	%r13, %rdx
	addq	%r15, %r12
	addq	%rbx, %rax
	addq	%rsi, %r11
	addq	%rsi, %rdx
	addq	%rcx, %r12
	rolq	$23, %r11
	rolq	$11, %rdx
	addq	%rcx, %rax
	rolq	$59, %r12
	movq	%r11, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	712(%rsp), %r15
	xorq	%rbx, %r12
	xorq	%rax, %r13
	xorq	%rax, %rbx
	movq	696(%rsp), %rax
	movq	728(%rsp), %rsi
	xorq	%r13, %r11
	xorq	%rdx, %r13
	movabsq	$-8247349341179448980, %rcx
	addq	%r13, %r15
	addq	%r12, %rax
	addq	%r11, %rsi
	movq	%rax, 712(%rsp)
	movq	664(%rsp), %rax
	movq	712(%rsp), %rdx
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %r14
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	rolq	$11, %rcx
	addq	712(%rsp), %r15
	addq	%r14, %r15
	movabsq	$6220970056051541820, %r14
	addq	%r14, %rax
	movabsq	$4195444129992158507, %r14
	rolq	$23, %r15
	addq	%r14, %rsi
	addq	%rdx, %rax
	movq	%r15, %r14
	addq	%rdx, %rsi
	rolq	$37, %rax
	xorq	%rcx, %r14
	rolq	$59, %rsi
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$6175231417442077265, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	addq	%r15, %r13
	movq	%rdx, %rcx
	movq	%r15, 712(%rsp)
	addq	%r14, %rbx
	addq	%r12, %rcx
	movq	%rdx, 696(%rsp)
	addq	%rsi, %r11
	leaq	(%rcx,%r13), %rdx
	movabsq	$-1087367646907149102, %r15
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 664(%rsp)
	movabsq	$-3329063056561552456, %r14
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r12
	movabsq	$-5426079245872290139, %r11
	rolq	$7, %rax
	addq	%r11, %r13
	movabsq	$-6657276164713376882, %r11
	addq	%rcx, %r11
	leaq	0(%r13,%rsi), %rdx
	rolq	$19, %r12
	addq	%rsi, %r11
	movq	%r12, %r13
	rolq	$53, %r11
	rolq	$31, %rdx
	xorq	%rax, %r13
	movq	%r11, %rbx
	xorq	%r13, %r11
	xorq	%rdx, %r13
	xorq	%rdx, %rbx
	addq	%r13, %r10
	addq	%r11, %rdi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	leaq	(%r12,%r9), %rcx
	addq	%rbx, %r8
	leaq	(%rdi,%r8), %rsi
	addq	%r14, %rdi
	addq	%r15, %r8
	leaq	(%rcx,%r10), %rdx
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %r10
	leaq	(%rdi,%rdx), %r9
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r8,%rdx), %rax
	addq	%rcx, %rdi
	leaq	(%r10,%rsi), %rdx
	movq	600(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	680(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	744(%rsp), %rdx
	xorq	%rax, %r8
	movq	616(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 744(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	744(%rsp), %rsi
	rolq	$7, %rax
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r15
	addq	%r15, %rcx
	movabsq	$-6657276164713376882, %r15
	rolq	$19, %rsi
	addq	%r15, %rdx
	addq	%r14, %rcx
	movq	%rsi, %r15
	addq	%r14, %rdx
	rolq	$31, %rcx
	xorq	%rax, %r15
	rolq	$53, %rdx
	movq	%rdx, %r14
	xorq	%r15, %rdx
	xorq	%rcx, %r14
	xorq	%r15, %rcx
	xorq	%r14, %rax
	xorq	%r14, %rsi
	movabsq	$7657736904968069610, %r14
	leaq	(%rdx,%rax), %r15
	addq	%r14, %r15
	leaq	(%rcx,%rsi), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	744(%rsp), %r14
	movq	%r14, 744(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	rolq	$11, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	744(%rsp), %rdx
	addq	%r15, %rax
	addq	744(%rsp), %rax
	rolq	$23, %rsi
	movq	%rsi, %r14
	xorq	%rcx, %r14
	rolq	$59, %rdx
	rolq	$37, %rax
	movq	%rdx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	xorq	%rax, %r15
	addq	%r14, %r8
	addq	%rdx, %r9
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%rdx, 744(%rsp)
	movq	%rsi, 616(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 600(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r9
	leaq	(%r10,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	addq	%rsi, %r9
	addq	%rax, %r8
	addq	%rcx, %r9
	rolq	$23, %rdi
	leaq	(%r8,%rcx), %rax
	rolq	$59, %r9
	rolq	$11, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	movq	%r14, 680(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	696(%rsp), %r14
	xorq	%rax, %r10
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	leaq	(%rdi,%r11), %rsi
	xorq	%rax, %r8
	addq	%r9, %r12
	addq	%r10, %r13
	addq	%r8, %rbx
	movabsq	$7667772426219706969, %r11
	leaq	(%rsi,%rbx), %rax
	leaq	(%r12,%r13), %rcx
	addq	%r12, %r11
	movabsq	$6220970056051541820, %r12
	addq	%r15, %r13
	movq	712(%rsp), %r15
	addq	%r12, %rbx
	movabsq	$4195444129992158507, %r12
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %r11
	addq	%rsi, %r12
	leaq	(%rbx,%rcx), %rax
	rolq	$23, %r11
	addq	%rcx, %r12
	rolq	$11, %rdx
	rolq	$59, %r12
	movq	%r11, %rbx
	rolq	$37, %rax
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movq	728(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	664(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 712(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	712(%rsp), %r15
	rolq	$11, %rcx
	addq	%rdx, %r15
	movabsq	$6220970056051541820, %rdx
	addq	%rdx, %rax
	movabsq	$4195444129992158507, %rdx
	rolq	$23, %r15
	addq	%r14, %rax
	rolq	$37, %rax
	addq	%rdx, %rsi
	addq	%r14, %rsi
	movq	%r15, %r14
	rolq	$59, %rsi
	xorq	%rcx, %r14
	movq	%rsi, %rdx
	xorq	%r14, %rsi
	xorq	%rax, %rdx
	xorq	%r14, %rax
	movabsq	$-2738949068654747313, %r14
	xorq	%rdx, %rcx
	xorq	%rdx, %r15
	leaq	(%rcx,%rsi), %rdx
	addq	%r14, %rdx
	leaq	(%r15,%rax), %r14
	movq	%r14, 728(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	728(%rsp), %r14
	movq	%r14, 728(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	728(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	728(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 728(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 712(%rsp)
	addq	%r14, %rbx
	movq	%rdx, 696(%rsp)
	addq	%rsi, %r11
	leaq	(%r12,%r13), %rdx
	movabsq	$-1087367646907149102, %r15
	leaq	(%r11,%rbx), %rcx
	movq	%r14, 664(%rsp)
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	leaq	(%rbx,%rdx), %rax
	movabsq	$-3329063056561552456, %rbx
	addq	%rsi, %r13
	addq	%rbx, %r11
	leaq	(%r11,%rdx), %r14
	movabsq	$-6657276164713376882, %r11
	leaq	0(%r13,%rcx), %rdx
	addq	%r11, %r12
	rolq	$7, %rax
	addq	%rcx, %r12
	rolq	$19, %r14
	rolq	$31, %rdx
	rolq	$53, %r12
	movq	%r14, %r15
	movq	%r12, %r13
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r15, %r12
	xorq	%rdx, %r15
	xorq	%r13, %r14
	addq	%r15, %r10
	xorq	%rax, %r13
	addq	%r14, %r9
	addq	%r13, %r8
	addq	%r12, %rdi
	leaq	(%r9,%r10), %rdx
	movabsq	$-1087367646907149102, %rax
	leaq	(%rdi,%r8), %rcx
	addq	%rax, %r8
	addq	%rbx, %rdi
	addq	%rsi, %r10
	addq	%r11, %r9
	leaq	(%r8,%rdx), %rax
	addq	%rdx, %rdi
	rolq	$19, %rdi
	leaq	(%r10,%rcx), %rdx
	addq	%r9, %rcx
	rolq	$7, %rax
	rolq	$53, %rcx
	movq	616(%rsp), %rbx
	movq	%rdi, %r8
	rolq	$31, %rdx
	movq	%rcx, %rsi
	xorq	%rax, %r8
	movq	744(%rsp), %r9
	xorq	%rdx, %rsi
	xorq	%r8, %rcx
	xorq	%rdx, %r8
	movq	600(%rsp), %rdx
	addq	%rcx, %rbx
	movq	680(%rsp), %r11
	xorq	%rsi, %rdi
	movq	%rbx, 744(%rsp)
	movq	744(%rsp), %r10
	xorq	%rax, %rsi
	addq	%r8, %rdx
	addq	%rdi, %r9
	movabsq	$-1087367646907149102, %rax
	leaq	(%r9,%rdx), %rbx
	addq	%rsi, %r11
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	744(%rsp), %r11
	rolq	$7, %rax
	addq	%rbx, %r11
	movabsq	$-5426079245872290139, %rbx
	addq	%rbx, %rdx
	movabsq	$-6657276164713376882, %rbx
	rolq	$19, %r11
	addq	%rbx, %r9
	addq	%r10, %rdx
	movq	%r11, %rbx
	addq	%r10, %r9
	rolq	$31, %rdx
	xorq	%rax, %rbx
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%rbx, %r9
	xorq	%rdx, %r10
	xorq	%rbx, %rdx
	xorq	%r10, %rax
	xorq	%r10, %r11
	movabsq	$1649971794476935487, %r10
	leaq	(%r9,%rax), %rbx
	addq	%r10, %rbx
	leaq	(%rdx,%r11), %r10
	movq	%r10, 744(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	744(%rsp), %r10
	movq	%r10, 744(%rsp)
	movabsq	$9059564915322872455, %r10
	addq	%r10, %rdx
	movabsq	$-7724133909308953704, %r10
	addq	%r10, %r11
	addq	%rbx, %rdx
	movabsq	$3257124934342745045, %r10
	addq	%rbx, %r11
	movabsq	$8809261046177890769, %rbx
	rolq	$11, %rdx
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	%r10, %r9
	addq	744(%rsp), %r9
	addq	744(%rsp), %rax
	movq	%r11, %r10
	xorq	%rdx, %r10
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%r9, %rbx
	xorq	%r10, %r9
	xorq	%rax, %r10
	xorq	%rax, %rbx
	addq	%r10, %rsi
	addq	%r9, %rdi
	xorq	%rbx, %r11
	xorq	%rdx, %rbx
	movq	%r9, 744(%rsp)
	addq	%r11, %rcx
	addq	%rbx, %r8
	movq	%r11, 616(%rsp)
	leaq	(%rcx,%rsi), %rax
	movabsq	$-8247349341179448980, %r11
	leaq	(%rdi,%r8), %r9
	movq	%r10, 680(%rsp)
	addq	%r11, %r8
	movabsq	$4195444129992158507, %r10
	addq	%r10, %rcx
	leaq	(%r8,%rax), %rdx
	movq	%rbx, 600(%rsp)
	movabsq	$6220970056051541820, %r8
	movabsq	$7667772426219706969, %rbx
	leaq	(%rcx,%r9), %r11
	addq	%r8, %rsi
	addq	%rbx, %rdi
	rolq	$11, %rdx
	addq	%rax, %rdi
	leaq	(%rsi,%r9), %rax
	rolq	$59, %r11
	rolq	$23, %rdi
	movq	%r11, %r8
	movq	%rbx, %r10
	rolq	$37, %rax
	movq	%rdi, %rsi
	movabsq	$6220970056051541820, %rbx
	xorq	%rax, %r8
	xorq	%rdx, %rsi
	xorq	%rsi, %r11
	xorq	%r8, %rdi
	xorq	%rax, %rsi
	xorq	%rdx, %r8
	addq	%r11, %r14
	movabsq	$-8247349341179448980, %rdx
	addq	%r8, %r15
	addq	%rsi, %r13
	addq	%rdi, %r12
	leaq	(%r12,%r13), %rax
	leaq	(%r14,%r15), %rcx
	addq	%rbx, %r13
	addq	%rdx, %r15
	addq	%r14, %r10
	movabsq	$4195444129992158507, %rbx
	leaq	(%r15,%rax), %rdx
	addq	%rax, %r10
	addq	%r12, %rbx
	rolq	$23, %r10
	leaq	0(%r13,%rcx), %rax
	addq	%rcx, %rbx
	rolq	$11, %rdx
	rolq	$59, %rbx
	movq	%r10, %r9
	rolq	$37, %rax
	xorq	%rdx, %r9
	movq	%rbx, %r12
	xorq	%rax, %r12
	xorq	%r9, %rbx
	movq	728(%rsp), %r15
	xorq	%rax, %r9
	movq	664(%rsp), %rax
	movq	712(%rsp), %r14
	movq	696(%rsp), %r13
	xorq	%r12, %r10
	xorq	%rdx, %r12
	addq	%r10, %r15
	movabsq	$-8247349341179448980, %rdx
	addq	%r9, %rax
	addq	%r12, %r14
	leaq	(%r15,%rax), %rcx
	addq	%rbx, %r13
	movq	%r13, 712(%rsp)
	addq	%r14, %r13
	addq	%rdx, %r14
	leaq	(%r14,%rcx), %rdx
	movabsq	$7667772426219706969, %r14
	addq	712(%rsp), %r14
	rolq	$11, %rdx
	addq	%rcx, %r14
	movabsq	$6220970056051541820, %rcx
	addq	%rcx, %rax
	rolq	$23, %r14
	leaq	(%rax,%r13), %rcx
	movabsq	$4195444129992158507, %rax
	addq	%rax, %r15
	addq	%r13, %r15
	rolq	$37, %rcx
	movq	%r14, %r13
	rolq	$59, %r15
	movq	%r15, %rax
	xorq	%rcx, %rax
	xorq	%rdx, %r13
	xorq	%r13, %r15
	xorq	%rax, %rdx
	xorq	%rax, %r14
	leaq	(%rdx,%r15), %rax
	xorq	%r13, %rcx
	movabsq	$-2922945419276229487, %r13
	addq	%r13, %rax
	leaq	(%r14,%rcx), %r13
	movq	%r13, 728(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	728(%rsp), %r13
	movq	%r13, 728(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r14
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r15
	addq	%r14, %rax
	addq	728(%rsp), %r15
	movabsq	$6923416813890349993, %r14
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r14, %rdx
	addq	728(%rsp), %rdx
	movq	%rax, %r14
	xorq	%rcx, %r14
	rolq	$53, %r15
	movq	%r15, %r13
	xorq	%r14, %r15
	rolq	$31, %rdx
	addq	%r15, %r10
	movq	%r15, preCompInternalState(%rip)
	xorq	%rdx, %r13
	xorq	%r14, %rdx
	movabsq	$-1087367646907149102, %r14
	xorq	%r13, %rax
	xorq	%rcx, %r13
	addq	%rdx, %r12
	addq	%rax, %rbx
	movq	%r13, %rcx
	movq	%rdx, preCompInternalState+8(%rip)
	addq	%r9, %rcx
	movq	%rax, preCompInternalState+16(%rip)
	movq	%r13, 728(%rsp)
	movq	%r13, preCompInternalState+24(%rip)
	leaq	(%rbx,%r12), %r13
	leaq	(%r10,%rcx), %r9
	addq	%r14, %rcx
	movabsq	$-3329063056561552456, %r14
	addq	%r13, %rcx
	rolq	$7, %rcx
	addq	%r14, %r10
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r14, %rbx
	movabsq	$-5426079245872290139, %r13
	addq	%r13, %r12
	addq	%r9, %rbx
	rolq	$19, %r10
	addq	%r9, %r12
	rolq	$53, %rbx
	movq	%r10, %r13
	rolq	$31, %r12
	movq	%rbx, %r9
	xorq	%rcx, %r13
	xorq	%r12, %r9
	xorq	%r13, %rbx
	xorq	%r12, %r13
	xorq	%r9, %r10
	xorq	%rcx, %r9
	addq	%r13, %r8
	movq	%r10, %rcx
	addq	%rbx, %rdi
	addq	%r9, %rsi
	addq	%r11, %rcx
	movq	%r10, 664(%rsp)
	movq	%r9, 584(%rsp)
	leaq	(%rcx,%r8), %r10
	leaq	(%rdi,%rsi), %r9
	movabsq	$-3329063056561552456, %r11
	movq	%rbx, 712(%rsp)
	addq	%r11, %rdi
	addq	%r14, %rcx
	movabsq	$-1087367646907149102, %rbx
	movabsq	$-5426079245872290139, %r12
	addq	%r10, %rdi
	addq	%rbx, %rsi
	addq	%r12, %r8
	addq	%r9, %rcx
	addq	%r10, %rsi
	rolq	$19, %rdi
	addq	%r9, %r8
	rolq	$53, %rcx
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r10
	movq	%rcx, %r9
	movq	600(%rsp), %rbx
	xorq	%r8, %r9
	xorq	%rsi, %r10
	movq	%r13, 696(%rsp)
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	744(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	680(%rsp), %r10
	addq	616(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 568(%rsp)
	movabsq	$-1087367646907149102, %r14
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	leaq	(%r9,%rbx), %r13
	addq	%rsi, %r10
	leaq	(%r11,%r10), %r12
	addq	%r14, %r10
	addq	%rcx, %r11
	movabsq	$-6657276164713376882, %r14
	addq	%r13, %r10
	addq	%r13, %r11
	addq	%r14, %r9
	movabsq	$-5426079245872290139, %r13
	rolq	$19, %r11
	addq	%r13, %rbx
	addq	%r12, %r9
	rolq	$7, %r10
	addq	%r12, %rbx
	rolq	$53, %r9
	movq	%r11, %r13
	rolq	$31, %rbx
	movq	%r9, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r13, %r9
	movabsq	$-4925106476758491821, %r14
	xorq	%r12, %r10
	movabsq	$1906713845121804688, %rcx
	xorq	%r13, %rbx
	addq	%r9, %rcx
	xorq	%r12, %r11
	addq	%r10, %r14
	movabsq	$853475092736589577, %r12
	movabsq	$-5486504877919021346, %r13
	movq	%r14, InternalState+112(%rip)
	addq	%r11, %r13
	addq	%rbx, %r12
	addq	%rcx, %r14
	movq	%rcx, InternalState+120(%rip)
	movabsq	$-7393874248442859403, %rcx
	movq	%r12, InternalState+96(%rip)
	movq	%r13, InternalState+104(%rip)
	addq	%r13, %r12
	addq	%rcx, %rbx
	movabsq	$2181267548300685623, %r13
	addq	%r14, %rbx
	movabsq	$1295863579293049999, %rcx
	addq	%r13, %r11
	addq	%rcx, %r10
	rolq	$11, %rbx
	addq	%r11, %r14
	movabsq	$6102157975113963195, %r11
	addq	%r12, %r10
	addq	%r11, %r9
	rolq	$23, %r14
	rolq	$37, %r10
	addq	%r9, %r12
	movq	568(%rsp), %rcx
	movq	%r14, %r9
	rolq	$59, %r12
	xorq	%rbx, %r9
	movabsq	$-8247349341179448980, %r11
	movq	%r12, %r13
	xorq	%r9, %r12
	xorq	%r10, %r13
	xorq	%r9, %r10
	addq	%r12, %rdi
	xorq	%r13, %r14
	addq	%r10, %rsi
	xorq	%r13, %rbx
	addq	%r14, %rcx
	addq	%rbx, %r8
	movq	%rbx, preCompInternalState+104(%rip)
	leaq	(%rcx,%rsi), %r9
	movabsq	$7667772426219706969, %rbx
	addq	%r8, %r11
	addq	%rdi, %rbx
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r10, preCompInternalState+120(%rip)
	addq	%r9, %r11
	addq	%r9, %rbx
	leaq	(%rdi,%r8), %r10
	movabsq	$6220970056051541820, %r9
	movabsq	$4195444129992158507, %r12
	rolq	$23, %rbx
	addq	%rcx, %r12
	addq	%rsi, %r9
	rolq	$11, %r11
	addq	%r10, %r9
	addq	%r12, %r10
	movq	%rbx, %r12
	rolq	$59, %r10
	rolq	$37, %r9
	movq	%r14, preCompInternalState+96(%rip)
	movq	%r10, %r13
	movabsq	$-8247349341179448980, %r14
	movq	%r8, InternalState+64(%rip)
	xorq	%r9, %r13
	xorq	%r11, %r12
	movq	%rdi, InternalState+72(%rip)
	xorq	%r13, %rbx
	xorq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r12, %r9
	movq	%rbx, preCompInternalState+64(%rip)
	movq	%r11, preCompInternalState+72(%rip)
	addq	712(%rsp), %rbx
	addq	696(%rsp), %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%r9, preCompInternalState+88(%rip)
	addq	664(%rsp), %r10
	addq	584(%rsp), %r9
	movq	%rsi, InternalState+80(%rip)
	movq	%rcx, InternalState+88(%rip)
	movq	%r11, InternalState+32(%rip)
	leaq	(%rbx,%r9), %r13
	leaq	(%r10,%r11), %r12
	addq	%r14, %r11
	movabsq	$7667772426219706969, %r14
	movq	%r10, InternalState+40(%rip)
	movq	%r9, InternalState+48(%rip)
	addq	%r14, %r10
	addq	%r13, %r11
	movabsq	$4195444129992158507, %r14
	addq	%r10, %r13
	movabsq	$6220970056051541820, %r10
	movq	%rbx, InternalState+56(%rip)
	addq	%r10, %r9
	addq	%r14, %rbx
	rolq	$23, %r13
	addq	%r12, %r9
	addq	%rbx, %r12
	rolq	$11, %r11
	rolq	$59, %r12
	movq	%r13, %r14
	rolq	$37, %r9
	xorq	%r11, %r14
	movq	%r12, %rbx
	xorq	%r9, %rbx
	xorq	%r14, %r9
	xorq	%r14, %r12
	xorq	%rbx, %r13
	xorq	%rbx, %r11
	movq	%r9, preCompInternalState+56(%rip)
	addq	728(%rsp), %r9
	movq	%r13, preCompInternalState+32(%rip)
	addq	%r15, %r13
	movq	%r11, preCompInternalState+40(%rip)
	movq	%r12, preCompInternalState+48(%rip)
	addq	%rdx, %r11
	addq	%rax, %r12
	addq	%r11, 424(%rsp)
	movq	152(%rsp), %r15
	addq	%r12, 440(%rsp)
	movq	%r11, InternalState(%rip)
	addq	%r9, 408(%rsp)
	movq	%r12, InternalState+8(%rip)
	addq	%r13, 456(%rsp)
	addq	%r8, 504(%rsp)
	addq	%rdi, 488(%rsp)
	movq	%r9, InternalState+16(%rip)
	addq	%rsi, 472(%rsp)
	movq	%r13, InternalState+24(%rip)
	addq	%rcx, 536(%rsp)
	addq	$64, 648(%rsp)
	addq	$64, 520(%rsp)
	cmpq	%r15, 632(%rsp)
	jne	.L72
	vmovq	408(%rsp), %xmm1
	movq	80(%rsp), %rax
	vmovq	424(%rsp), %xmm2
	movq	136(%rsp), %rcx
	vpinsrq	$1, 456(%rsp), %xmm1, %xmm0
	vmovq	472(%rsp), %xmm3
	movq	104(%rsp), %rbx
	notq	%rax
	vpinsrq	$1, 440(%rsp), %xmm2, %xmm1
	leaq	1(%rcx,%rax), %rdx
	vmovq	504(%rsp), %xmm4
	addq	%rcx, %rax
	addq	%rdx, 88(%rsp)
	leaq	8(%rbx,%rax,8), %rbx
	movq	%rbx, 104(%rsp)
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 488(%rsp), %xmm4, %xmm1
	vmovdqa	%ymm0, 776(%rsp)
	vpinsrq	$1, 536(%rsp), %xmm3, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 808(%rsp)
.L69:
	movq	24(%rsp), %rax
	andl	$63, %eax
	je	.L73
	vmovdqa	904(%rsp), %ymm0
	movq	88(%rsp), %rcx
	movabsq	$-8247349341179448980, %rsi
	movq	104(%rsp), %r8
	movabsq	$-6792583489299504353, %r14
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %rbx
	addq	$1, %rcx
	xorq	InternalState(%rip), %rcx
	movq	InternalState+8(%rip), %r10
	salq	$3, %r8
	vmovdqa	936(%rsp), %ymm0
	leaq	(%rbx,%rdi), %rdx
	movq	%r8, 600(%rsp)
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rdx,%rsi), %r9
	leaq	(%rcx,%r10), %r8
	vmovdqa	968(%rsp), %ymm0
	addq	%rcx, %r9
	movabsq	$7667772426219706969, %rcx
	vmovdqa	%ymm0, InternalState+64(%rip)
	addq	%rcx, %r10
	rolq	$11, %r9
	vmovdqa	1000(%rsp), %ymm0
	leaq	(%r10,%rdx), %r11
	movabsq	$6220970056051541820, %rdx
	movabsq	$4195444129992158507, %r10
	addq	%rdx, %rdi
	addq	%r10, %rbx
	vmovdqa	%ymm0, InternalState+96(%rip)
	addq	%r8, %rdi
	addq	%rbx, %r8
	rolq	$23, %r11
	rolq	$59, %r8
	rolq	$37, %rdi
	movq	%r9, %rbx
	movq	%r8, %r12
	xorq	%r11, %rbx
	xorq	%rdi, %r12
	xorq	%rbx, %r8
	xorq	%rbx, %rdi
	movq	%r12, %r13
	xorq	%r12, %r9
	xorq	%r11, %r13
	movabsq	$-1376848230519552085, %r11
	addq	%r9, %r11
	movabsq	$-9209400399786843361, %r9
	addq	%r13, %r14
	leaq	(%r8,%r9), %r12
	movabsq	$-369815132508846929, %r8
	movabsq	$-3463520432737951897, %r9
	addq	%rdi, %r8
	addq	%r13, %r9
	leaq	(%r11,%r12), %rdi
	leaq	(%r9,%r8), %rbx
	movabsq	$-1087367646907149102, %r9
	addq	%r9, %r8
	leaq	(%r8,%rdi), %r15
	addq	%rdi, %r14
	movabsq	$-5426079245872290139, %r8
	movabsq	$-6657276164713376882, %rdi
	leaq	(%r11,%r8), %r13
	rolq	$19, %r14
	leaq	(%r12,%rdi), %r11
	rolq	$7, %r15
	movq	%r14, %r12
	addq	%rbx, %r13
	xorq	%r15, %r12
	addq	%rbx, %r11
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%rbx, %r14
	xorq	%r15, %rbx
	movq	%r11, 616(%rsp)
	movq	%r14, 680(%rsp)
	movq	%rbx, 584(%rsp)
	movq	InternalState+40(%rip), %r14
	movq	InternalState+32(%rip), %rbx
	movq	InternalState+56(%rip), %r11
	addq	InternalState+48(%rip), %r11
	movq	%r12, 744(%rsp)
	leaq	(%r14,%rbx), %r12
	addq	%rsi, %rbx
	leaq	(%r11,%rbx), %r13
	leaq	(%r14,%rcx), %rbx
	leaq	(%r11,%rbx), %r15
	movq	InternalState+48(%rip), %r11
	rolq	$11, %r13
	rolq	$23, %r15
	addq	%rdx, %r11
	leaq	(%r11,%r12), %r14
	movq	InternalState+56(%rip), %r11
	rolq	$37, %r14
	addq	%r10, %r11
	addq	%r12, %r11
	movq	%r15, %r12
	rolq	$59, %r11
	xorq	%r13, %r12
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r14, %r12
	xorq	%r14, %rbx
	addq	584(%rsp), %r12
	addq	680(%rsp), %r11
	xorq	%rbx, %r13
	xorq	%r15, %rbx
	addq	616(%rsp), %rbx
	addq	744(%rsp), %r13
	movq	%r11, 648(%rsp)
	leaq	(%r12,%rbx), %r14
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r14, 520(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%r11, %r12
	addq	%r14, %rbx
	rolq	$7, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	520(%rsp), %r13
	rolq	$19, %r15
	addq	%r11, %r13
	movq	648(%rsp), %r11
	movq	%r15, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 520(%rsp)
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 536(%rsp)
	movq	%rbx, 552(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%r11, 568(%rsp)
	movq	InternalState+64(%rip), %rbx
	movq	InternalState+88(%rip), %r11
	addq	InternalState+80(%rip), %r11
	movq	%r13, 520(%rsp)
	leaq	(%r15,%rbx), %r12
	addq	%rsi, %rbx
	leaq	(%r11,%rbx), %r13
	leaq	(%r15,%rcx), %rbx
	addq	%r11, %rbx
	movq	InternalState+80(%rip), %r11
	rolq	$11, %r13
	rolq	$23, %rbx
	addq	%rdx, %r11
	leaq	(%r11,%r12), %r15
	movq	InternalState+88(%rip), %r11
	rolq	$37, %r15
	addq	%r10, %r11
	addq	%r12, %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%r15, %r12
	movq	%r12, 648(%rsp)
	movq	%rbx, %r12
	xorq	648(%rsp), %rbx
	xorq	%r13, %r12
	addq	568(%rsp), %rbx
	xorq	648(%rsp), %r13
	xorq	%r12, %r11
	xorq	%r15, %r12
	addq	552(%rsp), %r12
	addq	520(%rsp), %r13
	addq	536(%rsp), %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	movq	%r11, 632(%rsp)
	addq	%r13, %r11
	movq	%r15, 648(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	648(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	632(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	648(%rsp), %r11
	movq	%rbx, 648(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	648(%rsp), %r11
	xorq	%r13, %rbx
	xorq	648(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 712(%rsp)
	movq	%rbx, 696(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %rbx
	movq	%r11, 728(%rsp)
	movq	InternalState+120(%rip), %r11
	addq	InternalState+112(%rip), %r11
	movq	%r13, 648(%rsp)
	leaq	(%r15,%rbx), %r12
	addq	%rsi, %rbx
	leaq	(%r11,%rbx), %r13
	leaq	(%r15,%rcx), %rbx
	addq	%r11, %rbx
	movq	InternalState+112(%rip), %r11
	rolq	$11, %r13
	rolq	$23, %rbx
	addq	%rdx, %r11
	leaq	(%r11,%r12), %r15
	movq	InternalState+120(%rip), %r11
	rolq	$37, %r15
	addq	%r10, %r11
	addq	%r12, %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%r15, %r12
	movq	%r12, 632(%rsp)
	movq	%rbx, %r12
	xorq	632(%rsp), %rbx
	xorq	%r13, %r12
	xorq	632(%rsp), %r13
	addq	728(%rsp), %rbx
	addq	648(%rsp), %r13
	xorq	%r12, %r11
	xorq	%r15, %r12
	addq	712(%rsp), %r11
	addq	696(%rsp), %r12
	movq	%r11, 504(%rsp)
	leaq	(%rbx,%r12), %r15
	addq	%r13, %r11
	addq	%r9, %r12
	addq	%r11, %r12
	addq	%r14, %rbx
	movq	%r15, 664(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	664(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 632(%rsp)
	addq	%r11, %r13
	movq	504(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	664(%rsp), %r11
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 664(%rsp)
	movabsq	$-7999569951748836447, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	632(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-4849728007900573903, %r12
	addq	%r11, %r12
	movabsq	$-1568322642145848418, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 504(%rsp)
	movabsq	$-1642314245251606934, %r11
	addq	664(%rsp), %r11
	addq	504(%rsp), %r11
	movq	%rbx, 632(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	504(%rsp), %r11
	movq	632(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$2553129884740551573, %r11
	addq	664(%rsp), %r11
	addq	632(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 632(%rsp)
	movq	%r13, %r12
	xorq	632(%rsp), %r13
	xorq	%r15, %r12
	xorq	632(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	movq	%r11, 488(%rsp)
	movq	%r13, 504(%rsp)
	movq	472(%rsp), %r13
	movq	%r15, %r12
	addq	648(%rsp), %r12
	addq	696(%rsp), %r13
	addq	712(%rsp), %rbx
	movq	%r15, 632(%rsp)
	movq	%r13, 648(%rsp)
	movq	504(%rsp), %r15
	movq	%r13, %r11
	addq	728(%rsp), %r15
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 712(%rsp)
	addq	%r15, %r11
	movq	%r15, 728(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	648(%rsp), %r11
	movq	712(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	728(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	712(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 728(%rsp)
	movq	%r13, %r12
	xorq	728(%rsp), %r13
	xorq	%r15, %r12
	xorq	728(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 424(%rsp)
	movq	%r11, %rbx
	addq	536(%rsp), %rbx
	movq	%r13, 456(%rsp)
	movq	424(%rsp), %r13
	movq	%r15, %r12
	addq	552(%rsp), %r13
	addq	520(%rsp), %r12
	movq	%r15, 728(%rsp)
	movq	456(%rsp), %r15
	addq	568(%rsp), %r15
	movq	%r11, 440(%rsp)
	movq	%r13, 520(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r15, 712(%rsp)
	movq	%r13, 648(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	520(%rsp), %r11
	movq	648(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	712(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	648(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 520(%rsp)
	movq	%r13, %r12
	xorq	520(%rsp), %r13
	xorq	%r15, %r12
	xorq	520(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r13, 712(%rsp)
	movq	%r15, 520(%rsp)
	movq	%r11, 696(%rsp)
	movq	%r12, 664(%rsp)
	movq	%r15, %r12
	movq	712(%rsp), %r15
	addq	616(%rsp), %r15
	addq	744(%rsp), %r12
	addq	680(%rsp), %rbx
	movq	664(%rsp), %r13
	addq	584(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 648(%rsp)
	movq	%r13, 744(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 616(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	744(%rsp), %r11
	movq	616(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	648(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	616(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 744(%rsp)
	movq	%r13, %r12
	xorq	744(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 648(%rsp)
	movq	744(%rsp), %r12
	xorq	648(%rsp), %rbx
	movq	%r13, 616(%rsp)
	movabsq	$-2292595471992902602, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	648(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$8467826889434979867, %r11
	addq	%r12, %r11
	movabsq	$6028102484886760763, %r12
	movq	%r11, 744(%rsp)
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %rbx
	addq	616(%rsp), %r12
	movq	744(%rsp), %r11
	addq	%r13, %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r11, %rbx
	rolq	$7, %rbx
	movq	%rbx, 648(%rsp)
	movabsq	$2699039428325208307, %rbx
	addq	616(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	leaq	(%r11,%r12), %r13
	movq	744(%rsp), %r11
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	648(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	648(%rsp), %rbx
	xorq	%r12, %r11
	movq	%r15, 584(%rsp)
	addq	696(%rsp), %r15
	xorq	%r13, %r12
	movq	%r11, 744(%rsp)
	movq	%r12, 680(%rsp)
	movq	%r12, %r13
	addq	520(%rsp), %r13
	movq	%rbx, 648(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r15, 520(%rsp)
	addq	712(%rsp), %rbx
	movq	%r15, %r11
	addq	664(%rsp), %r12
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r11, %r12
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	712(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	520(%rsp), %r11
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	712(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 712(%rsp)
	movq	%r11, %rbx
	xorq	712(%rsp), %r11
	xorq	%r13, %rbx
	xorq	712(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 536(%rsp)
	movq	%rbx, 552(%rsp)
	movq	%rbx, %r12
	addq	440(%rsp), %r15
	addq	424(%rsp), %r12
	movq	%r11, %rbx
	addq	456(%rsp), %rbx
	movq	%r13, 712(%rsp)
	addq	728(%rsp), %r13
	movq	%r11, 568(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r15, 520(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	520(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	728(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	movq	%rbx, 520(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 696(%rsp)
	addq	488(%rsp), %r15
	movq	%rbx, %r12
	movq	%rbx, 664(%rsp)
	addq	472(%rsp), %r12
	movq	%r11, %rbx
	movq	%r13, 520(%rsp)
	addq	504(%rsp), %rbx
	addq	632(%rsp), %r13
	movq	%r11, 728(%rsp)
	movq	%r15, %r11
	movq	%r15, 488(%rsp)
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r13, %r11
	addq	%r11, %r12
	addq	%r14, %rbx
	movq	%r15, 616(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	616(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 632(%rsp)
	addq	%r11, %r13
	movq	488(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	616(%rsp), %r11
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 616(%rsp)
	movabsq	$5953845371152580681, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	632(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-7646712092252898442, %r12
	addq	%r11, %r12
	movabsq	$-2842268575306187841, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 504(%rsp)
	movabsq	$-7946738593435294165, %r11
	addq	616(%rsp), %r11
	addq	504(%rsp), %r11
	movq	%rbx, 632(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	504(%rsp), %r11
	movq	632(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$-3751294463443135658, %r11
	addq	616(%rsp), %r11
	addq	632(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 632(%rsp)
	movq	%r13, %r12
	xorq	632(%rsp), %r13
	xorq	%r15, %r12
	xorq	632(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	movq	%r11, 488(%rsp)
	movq	%r13, 504(%rsp)
	movq	472(%rsp), %r13
	movq	%r15, %r12
	addq	520(%rsp), %r12
	addq	696(%rsp), %rbx
	addq	664(%rsp), %r13
	movq	%r15, 632(%rsp)
	movq	504(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r13, 520(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 696(%rsp)
	movq	%r15, 728(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	520(%rsp), %r11
	movq	696(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	728(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	696(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 728(%rsp)
	movq	%r13, %r12
	xorq	728(%rsp), %r13
	xorq	%r15, %r12
	xorq	728(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 424(%rsp)
	movq	%r11, %rbx
	addq	536(%rsp), %rbx
	movq	%r13, 456(%rsp)
	movq	424(%rsp), %r13
	movq	%r15, %r12
	addq	552(%rsp), %r13
	addq	712(%rsp), %r12
	movq	%r15, 728(%rsp)
	movq	456(%rsp), %r15
	addq	568(%rsp), %r15
	movq	%r11, 440(%rsp)
	movq	%r13, 712(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r13, 520(%rsp)
	movq	%r15, 696(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	712(%rsp), %r11
	movq	520(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	696(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	520(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 520(%rsp)
	movq	%r13, %r12
	xorq	520(%rsp), %r13
	xorq	%r15, %r12
	xorq	520(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 664(%rsp)
	movq	%r11, %rbx
	addq	584(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	664(%rsp), %r13
	movq	%r15, 520(%rsp)
	movq	%r15, %r12
	movq	712(%rsp), %r15
	addq	744(%rsp), %r15
	addq	680(%rsp), %r12
	addq	648(%rsp), %r13
	movq	%r11, 696(%rsp)
	movq	%r15, %r11
	addq	%r13, %r11
	movq	%r13, 680(%rsp)
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 648(%rsp)
	movq	%r13, 616(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	680(%rsp), %r11
	movq	616(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	648(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	616(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 744(%rsp)
	movq	%r13, %r12
	xorq	744(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 648(%rsp)
	movq	744(%rsp), %r12
	xorq	648(%rsp), %rbx
	movq	%r13, 616(%rsp)
	movabsq	$-824919486193887165, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	648(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$-1914029582460860148, %r11
	addq	%r12, %r11
	movabsq	$-7632797540959622777, %r12
	movq	%r11, 744(%rsp)
	movabsq	$6609752215332129920, %r11
	addq	%r11, %rbx
	movq	744(%rsp), %r11
	addq	%r13, %r11
	addq	616(%rsp), %r12
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r11, %rbx
	rolq	$7, %rbx
	movq	%rbx, 648(%rsp)
	movabsq	$7484883476188376383, %rbx
	addq	616(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	leaq	(%r11,%r12), %r13
	movq	744(%rsp), %r11
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	648(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	648(%rsp), %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	movq	%r15, 536(%rsp)
	addq	696(%rsp), %r15
	movq	%r12, 568(%rsp)
	movq	%r12, %r13
	addq	520(%rsp), %r13
	movq	%r11, 584(%rsp)
	movq	%rbx, 648(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	664(%rsp), %r12
	addq	712(%rsp), %rbx
	movq	%r15, %r11
	movq	%r15, 520(%rsp)
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r11, %r12
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	712(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	520(%rsp), %r11
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	712(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 712(%rsp)
	movq	%r11, %rbx
	xorq	712(%rsp), %r11
	xorq	%r13, %rbx
	xorq	712(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 680(%rsp)
	movq	%rbx, 552(%rsp)
	movq	%rbx, %r12
	addq	440(%rsp), %r15
	addq	424(%rsp), %r12
	movq	%r11, %rbx
	addq	456(%rsp), %rbx
	movq	%r13, 712(%rsp)
	addq	728(%rsp), %r13
	movq	%r11, 744(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r15, 520(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	520(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	728(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	movq	%rbx, 520(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 696(%rsp)
	addq	488(%rsp), %r15
	movq	%rbx, %r12
	movq	%rbx, 664(%rsp)
	addq	472(%rsp), %r12
	movq	%r11, %rbx
	movq	%r13, 520(%rsp)
	addq	504(%rsp), %rbx
	addq	632(%rsp), %r13
	movq	%r11, 728(%rsp)
	movq	%r15, %r11
	movq	%r15, 488(%rsp)
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r13, %r11
	addq	%r11, %r12
	addq	%r14, %rbx
	movq	%r15, 616(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	616(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 632(%rsp)
	addq	%r11, %r13
	movq	488(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	616(%rsp), %r11
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 616(%rsp)
	movabsq	$-1139829817207230181, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	632(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$3054837738180890943, %r12
	addq	%r11, %r12
	movabsq	$2588290990126348949, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 504(%rsp)
	movabsq	$-938319195649413462, %r11
	addq	616(%rsp), %r11
	addq	504(%rsp), %r11
	movq	%rbx, 632(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	504(%rsp), %r11
	movq	632(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$3257124934342745045, %r11
	addq	616(%rsp), %r11
	addq	632(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 632(%rsp)
	movq	%r13, %r12
	xorq	632(%rsp), %r13
	xorq	%r15, %r12
	xorq	632(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 472(%rsp)
	movq	%r11, %rbx
	movq	%r11, 488(%rsp)
	movq	%r13, 504(%rsp)
	movq	472(%rsp), %r13
	movq	%r15, %r12
	addq	520(%rsp), %r12
	addq	696(%rsp), %rbx
	addq	664(%rsp), %r13
	movq	%r15, 632(%rsp)
	movq	504(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r13, 520(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 728(%rsp)
	movq	%r13, 696(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	520(%rsp), %r11
	movq	696(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	728(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	696(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 728(%rsp)
	movq	%r13, %r12
	xorq	728(%rsp), %r13
	xorq	%r15, %r12
	xorq	728(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, 440(%rsp)
	movq	%r11, %rbx
	movq	%r13, 456(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r12, 424(%rsp)
	movq	%r15, %r12
	addq	680(%rsp), %rbx
	addq	712(%rsp), %r12
	movq	424(%rsp), %r13
	addq	552(%rsp), %r13
	movq	456(%rsp), %r15
	addq	744(%rsp), %r15
	movq	%r13, 712(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 520(%rsp)
	movq	%r15, 696(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	712(%rsp), %r11
	movq	520(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	696(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	520(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 520(%rsp)
	movq	%r13, %r12
	xorq	520(%rsp), %r13
	xorq	%r15, %r12
	xorq	520(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 680(%rsp)
	movq	%r11, %rbx
	addq	536(%rsp), %rbx
	movq	%r13, 712(%rsp)
	movq	680(%rsp), %r13
	movq	%r15, 520(%rsp)
	movq	%r15, %r12
	movq	712(%rsp), %r15
	addq	584(%rsp), %r15
	addq	648(%rsp), %r13
	addq	568(%rsp), %r12
	movq	%r11, 744(%rsp)
	movq	%r15, %r11
	movq	%r13, 664(%rsp)
	movq	%r15, 648(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	leaq	(%r12,%r11), %r15
	movq	%r13, 696(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	664(%rsp), %r11
	movq	696(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	648(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	696(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 664(%rsp)
	movq	%r13, %r12
	xorq	664(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 648(%rsp)
	movq	664(%rsp), %r12
	xorq	648(%rsp), %rbx
	movq	%r13, 696(%rsp)
	movabsq	$-6097248013946911484, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	648(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$3174302594670681997, %r11
	addq	%r12, %r11
	movabsq	$-8739574512844769069, %r12
	movq	%r11, 664(%rsp)
	movabsq	$-496885038275669880, %r11
	addq	%r11, %rbx
	movq	664(%rsp), %r11
	addq	%r13, %r11
	addq	696(%rsp), %r12
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r11, %rbx
	rolq	$7, %rbx
	movq	%rbx, 648(%rsp)
	movabsq	$6378106504303230091, %rbx
	addq	696(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	leaq	(%r11,%r12), %r13
	movq	664(%rsp), %r11
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	648(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	648(%rsp), %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	movq	%r15, 616(%rsp)
	movq	%r15, preCompInternalState+16(%rip)
	movq	%r12, 664(%rsp)
	addq	744(%rsp), %r15
	movq	%r12, %r13
	movq	%r12, preCompInternalState+8(%rip)
	addq	520(%rsp), %r13
	movq	%rbx, 648(%rsp)
	movq	%rbx, preCompInternalState+24(%rip)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	680(%rsp), %r12
	addq	712(%rsp), %rbx
	movq	%r15, 520(%rsp)
	movq	%r11, 696(%rsp)
	movq	%r11, preCompInternalState(%rip)
	movq	%r15, %r11
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r11, %r12
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	712(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	520(%rsp), %r11
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	712(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 712(%rsp)
	movq	%r11, %rbx
	xorq	712(%rsp), %r11
	xorq	%r13, %rbx
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%rbx, %r12
	movq	%r11, 584(%rsp)
	xorq	712(%rsp), %r13
	addq	424(%rsp), %r12
	movq	%r15, 568(%rsp)
	movq	%rbx, 536(%rsp)
	addq	440(%rsp), %r15
	movq	%r11, %rbx
	addq	456(%rsp), %rbx
	movq	%r13, 712(%rsp)
	addq	728(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 728(%rsp)
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r15, 520(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	520(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	728(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	520(%rsp), %r11
	movq	%rbx, 520(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	520(%rsp), %r11
	xorq	%r13, %rbx
	xorq	520(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 744(%rsp)
	addq	488(%rsp), %r15
	movq	%rbx, %r12
	addq	472(%rsp), %r12
	movq	%rbx, 680(%rsp)
	movq	%r11, %rbx
	movq	%r13, 520(%rsp)
	addq	632(%rsp), %r13
	addq	504(%rsp), %rbx
	movq	%r11, 728(%rsp)
	movq	%r15, %r11
	movq	%r15, 552(%rsp)
	addq	%r12, %r9
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r15
	leaq	(%r9,%r11), %r12
	rolq	$7, %r12
	addq	552(%rsp), %rdi
	addq	%r14, %rbx
	addq	%rbx, %r11
	addq	%r13, %r8
	rolq	$19, %r11
	addq	%r15, %r8
	movq	%r11, %r9
	rolq	$31, %r8
	addq	%r15, %rdi
	xorq	%r12, %r9
	rolq	$53, %rdi
	movq	%r9, %r14
	movq	%rdi, %rbx
	xorq	%rdi, %r14
	movabsq	$853475092736589577, %rdi
	xorq	%r8, %rbx
	xorq	%r9, %r8
	addq	%r8, %rdi
	xorq	%rbx, %r11
	movabsq	$-5486504877919021346, %r8
	addq	%r8, %r11
	xorq	%rbx, %r12
	movabsq	$-4925106476758491821, %r8
	leaq	(%r12,%r8), %r9
	movabsq	$1906713845121804688, %r8
	leaq	(%r11,%rdi), %r13
	addq	%r14, %r8
	movq	%rdi, InternalState+96(%rip)
	movq	%r11, InternalState+104(%rip)
	addq	%rsi, %rdi
	addq	%rcx, %r11
	movq	%r8, InternalState+120(%rip)
	movabsq	$6102157975113963195, %rbx
	addq	%r9, %r8
	movq	%r9, InternalState+112(%rip)
	addq	%r8, %rdi
	addq	%rdx, %r9
	addq	%r11, %r8
	addq	%r14, %rbx
	rolq	$23, %r8
	leaq	(%r9,%r13), %r12
	addq	%r13, %rbx
	rolq	$11, %rdi
	movq	%r8, %r9
	rolq	$59, %rbx
	rolq	$37, %r12
	xorq	%rdi, %r9
	movq	%rbx, %r11
	movq	%r8, %r13
	movq	%r9, %r8
	xorq	%r12, %r11
	xorq	%r11, %r13
	xorq	%r11, %rdi
	xorq	%rbx, %r8
	xorq	%r12, %r9
	movq	%r13, preCompInternalState+96(%rip)
	movq	%rdi, preCompInternalState+104(%rip)
	movq	%r8, preCompInternalState+112(%rip)
	movq	%r9, preCompInternalState+120(%rip)
	movq	520(%rsp), %r11
	addq	680(%rsp), %r9
	addq	%rdi, %r11
	movq	744(%rsp), %rdi
	movq	%r11, InternalState+64(%rip)
	movq	%r9, InternalState+80(%rip)
	addq	%r8, %rdi
	movq	728(%rsp), %r8
	movq	%rdi, InternalState+72(%rip)
	addq	%r13, %r8
	leaq	(%r11,%rdi), %r13
	addq	%rsi, %r11
	leaq	(%r9,%r8), %rbx
	addq	%rcx, %rdi
	movq	%r8, InternalState+88(%rip)
	addq	%r10, %r8
	addq	%rdx, %r9
	addq	%rbx, %r11
	addq	%rbx, %rdi
	leaq	(%r8,%r13), %rbx
	leaq	(%r9,%r13), %r12
	rolq	$23, %rdi
	rolq	$11, %r11
	rolq	$59, %rbx
	movq	%rdi, %r8
	rolq	$37, %r12
	movq	%rbx, %r9
	xorq	%r11, %r8
	xorq	%r12, %r9
	xorq	%r9, %rdi
	xorq	%r9, %r11
	movq	%r8, %r9
	xorq	%r12, %r8
	xorq	%rbx, %r9
	movq	%rdi, preCompInternalState+64(%rip)
	movq	%r8, preCompInternalState+88(%rip)
	addq	584(%rsp), %rdi
	addq	536(%rsp), %r8
	movq	%r11, preCompInternalState+72(%rip)
	movq	%r9, preCompInternalState+80(%rip)
	addq	712(%rsp), %r11
	addq	568(%rsp), %r9
	movq	%rdi, InternalState+56(%rip)
	leaq	(%r8,%rdi), %rbx
	movq	%r8, InternalState+48(%rip)
	addq	%r11, %rsi
	movq	%r11, InternalState+32(%rip)
	addq	%r9, %rcx
	leaq	(%r11,%r9), %r12
	addq	%rbx, %rsi
	addq	%rbx, %rcx
	rolq	$11, %rsi
	movq	%r9, InternalState+40(%rip)
	rolq	$23, %rcx
	addq	%r10, %rdi
	addq	%r8, %rdx
	addq	%r12, %rdi
	addq	%r12, %rdx
	movq	%rcx, %r8
	rolq	$59, %rdi
	rolq	$37, %rdx
	xorq	%rsi, %r8
	movq	%rdi, %r9
	xorq	%r8, %rdi
	xorq	%rdx, %r9
	xorq	%r8, %rdx
	movq	%rdi, preCompInternalState+48(%rip)
	xorq	%r9, %rcx
	xorq	%r9, %rsi
	addq	616(%rsp), %rdi
	movq	%rcx, preCompInternalState+32(%rip)
	movq	%rsi, preCompInternalState+40(%rip)
	addq	696(%rsp), %rcx
	addq	664(%rsp), %rsi
	movq	%rdx, preCompInternalState+56(%rip)
	addq	648(%rsp), %rdx
	testq	%rax, %rax
	movq	%rdi, InternalState+8(%rip)
	movq	%rsi, InternalState(%rip)
	movq	%rcx, InternalState+24(%rip)
	movq	%rdx, InternalState+16(%rip)
	je	.L74
	movq	600(%rsp), %rbx
	movq	96(%rsp), %rsi
	xorl	%edx, %edx
	movq	-80(%rsp), %r9
	xorl	%ecx, %ecx
	leaq	(%rsi,%rbx), %rdi
	leaq	(%r9,%rbx), %r8
	.p2align 4,,10
	.p2align 3
.L77:
	movzbl	InternalState(%rdx), %esi
	xorb	64(%rdi,%rcx), %sil
	movb	%sil, (%r8,%rcx)
	movzbl	64(%rdi,%rcx), %esi
	movb	%sil, InternalState(%rdx)
	leaq	1(%rdx), %rsi
	addq	$33, %rdx
	testb	$31, %sil
	cmovne	%rsi, %rdx
	addq	$1, %rcx
	cmpq	%rax, %rcx
	jne	.L77
.L74:
	xorb	$1, InternalState(%rax)
	movabsq	$-8247349341179448980, %rcx
	movabsq	$4195444129992158507, %r14
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %r9
	movabsq	$-1376848230519552085, %r11
	movq	InternalState(%rip), %rdx
	movq	InternalState+8(%rip), %r10
	movabsq	$-3463520432737951897, %rbx
	leaq	(%r9,%rdi), %rax
	addq	%r14, %r9
	leaq	(%r10,%rdx), %r8
	addq	%rcx, %rdx
	leaq	(%rdx,%rax), %rsi
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %r10
	leaq	(%r9,%r8), %r12
	addq	%rax, %r10
	movabsq	$6220970056051541820, %rax
	rolq	$11, %rsi
	addq	%rax, %rdi
	rolq	$23, %r10
	rolq	$59, %r12
	addq	%r8, %rdi
	movq	%r10, %r9
	movq	%r12, %r8
	rolq	$37, %rdi
	xorq	%rsi, %r9
	xorq	%rdi, %r8
	xorq	%r9, %r12
	xorq	%rdi, %r9
	xorq	%r8, %r10
	xorq	%r8, %rsi
	movabsq	$-9209400399786843361, %r8
	addq	%r11, %rsi
	addq	%r8, %r12
	movabsq	$-369815132508846929, %r8
	leaq	(%r12,%rsi), %rdi
	addq	%r8, %r9
	addq	%r10, %rbx
	movabsq	$-1087367646907149102, %r8
	movabsq	$-6792583489299504353, %r11
	addq	%r9, %rbx
	addq	%r11, %r10
	addq	%r8, %r9
	addq	%rdi, %r9
	addq	%rdi, %r10
	movabsq	$-5426079245872290139, %rdi
	addq	%rdi, %rsi
	rolq	$19, %r10
	rolq	$7, %r9
	leaq	(%rsi,%rbx), %r11
	movabsq	$-6657276164713376882, %rsi
	movq	%r10, %r13
	addq	%rsi, %r12
	addq	%r12, %rbx
	rolq	$31, %r11
	rolq	$53, %rbx
	xorq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	InternalState+56(%rip), %r11
	movq	%rbx, 696(%rsp)
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r13, 664(%rsp)
	movq	%r12, 600(%rsp)
	movq	InternalState+48(%rip), %r12
	movq	InternalState+32(%rip), %rbx
	movq	InternalState+40(%rip), %r13
	movq	%r10, 616(%rsp)
	leaq	(%r11,%r12), %r9
	addq	%rax, %r12
	leaq	0(%r13,%rbx), %r10
	addq	%rcx, %rbx
	addq	%rdx, %r13
	addq	%r9, %rbx
	addq	%r9, %r13
	leaq	(%r11,%r14), %r9
	rolq	$23, %r13
	rolq	$11, %rbx
	addq	%r10, %r12
	addq	%r10, %r9
	movq	%r13, %r10
	rolq	$37, %r12
	xorq	%rbx, %r10
	rolq	$59, %r9
	movq	%r9, %r11
	xorq	%r10, %r9
	addq	616(%rsp), %r9
	xorq	%r12, %r11
	xorq	%r12, %r10
	xorq	%r11, %rbx
	xorq	%r13, %r11
	addq	664(%rsp), %rbx
	addq	696(%rsp), %r11
	movq	%r9, 648(%rsp)
	movq	600(%rsp), %r9
	addq	%r10, %r9
	movq	648(%rsp), %r10
	leaq	(%r9,%r11), %r12
	addq	%r8, %r9
	addq	%rbx, %r10
	movq	%r12, 520(%rsp)
	leaq	(%rbx,%rdi), %r12
	leaq	(%r9,%r10), %r15
	movabsq	$-3329063056561552456, %r9
	addq	520(%rsp), %r12
	addq	%r9, %r11
	leaq	(%r11,%r10), %r13
	movq	648(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	520(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 744(%rsp)
	movq	InternalState+64(%rip), %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	InternalState+88(%rip), %r10
	movq	%r13, 584(%rsp)
	movq	%r11, 568(%rsp)
	movq	InternalState+80(%rip), %r13
	movq	InternalState+72(%rip), %r11
	movq	%rbx, 680(%rsp)
	addq	%r13, %r10
	leaq	(%r11,%r12), %rbx
	addq	%rdx, %r11
	addq	%rcx, %r12
	leaq	(%r10,%r11), %r15
	addq	%rax, %r13
	addq	%r10, %r12
	movq	InternalState+88(%rip), %r10
	addq	%rbx, %r13
	rolq	$23, %r15
	rolq	$11, %r12
	rolq	$37, %r13
	addq	%r14, %r10
	addq	%rbx, %r10
	movq	%r15, %rbx
	xorq	%r12, %rbx
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	addq	584(%rsp), %r10
	xorq	%r13, %r11
	xorq	%r13, %rbx
	xorq	%r11, %r12
	xorq	%r15, %r11
	addq	680(%rsp), %r12
	movq	%r10, 520(%rsp)
	addq	744(%rsp), %r11
	addq	568(%rsp), %rbx
	addq	%r12, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 648(%rsp)
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	addq	648(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	648(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 648(%rsp)
	movq	InternalState+96(%rip), %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	InternalState+120(%rip), %r10
	movq	%r13, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	InternalState+112(%rip), %r13
	movq	InternalState+104(%rip), %r11
	movq	%rbx, 520(%rsp)
	addq	%r13, %r10
	leaq	(%r11,%r12), %rbx
	addq	%rdx, %r11
	addq	%rcx, %r12
	leaq	(%r10,%r11), %r15
	addq	%rax, %r13
	addq	%r10, %r12
	movq	InternalState+120(%rip), %r10
	addq	%rbx, %r13
	rolq	$23, %r15
	rolq	$37, %r13
	rolq	$11, %r12
	addq	%r14, %r10
	addq	%rbx, %r10
	movq	%r15, %rbx
	rolq	$59, %r10
	xorq	%r12, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r13, %r11
	xorq	%r11, %r12
	addq	520(%rsp), %r12
	addq	632(%rsp), %r10
	xorq	%r13, %rbx
	xorq	%r15, %r11
	addq	728(%rsp), %rbx
	addq	648(%rsp), %r11
	movq	%r10, 536(%rsp)
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%rbx), %r15
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%r11,%r10), %r13
	movq	%r15, 712(%rsp)
	leaq	(%rbx,%r10), %r15
	movq	536(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 712(%rsp)
	movabsq	$-7999569951748836447, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %r10
	movabsq	$-4849728007900573903, %rbx
	xorq	%r13, %r10
	xorq	%r15, %r11
	addq	%r10, %rbx
	movabsq	$-1568322642145848418, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-1642314245251606934, %r10
	addq	712(%rsp), %r10
	leaq	(%r12,%rbx), %r11
	addq	%rcx, %r12
	addq	%r15, %r10
	leaq	(%r10,%r12), %r13
	leaq	(%rbx,%rdx), %r12
	addq	%r10, %r12
	leaq	(%r15,%rax), %r10
	rolq	$11, %r13
	rolq	$23, %r12
	leaq	(%r10,%r11), %r15
	movabsq	$2553129884740551573, %r10
	addq	712(%rsp), %r10
	movq	%r12, %rbx
	rolq	$37, %r15
	addq	%r11, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r15, %r11
	xorq	%r13, %rbx
	xorq	%rbx, %r10
	xorq	%r11, %r13
	xorq	%r11, %r12
	xorq	%r15, %rbx
	movq	%r12, 536(%rsp)
	movq	%r10, %r11
	addq	648(%rsp), %r12
	addq	632(%rsp), %r11
	movq	%rbx, 488(%rsp)
	movq	%r13, %rbx
	addq	520(%rsp), %rbx
	movq	488(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r13, 552(%rsp)
	movq	%r10, 504(%rsp)
	movq	%r12, 648(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	movq	%r12, 520(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	520(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	648(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	520(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 424(%rsp)
	movq	424(%rsp), %r15
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r10, %r11
	movq	%r12, 472(%rsp)
	addq	584(%rsp), %r11
	movq	%r13, %rbx
	addq	744(%rsp), %r12
	addq	680(%rsp), %rbx
	addq	568(%rsp), %r15
	movq	%r13, 456(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	movq	%r12, 520(%rsp)
	movq	%r13, 648(%rsp)
	leaq	(%r10,%rbx), %r13
	rolq	$11, %r13
	addq	%rdx, %r11
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	648(%rsp), %r15
	rolq	$23, %r12
	addq	%r10, %r15
	movq	520(%rsp), %r10
	movq	%r12, %rbx
	rolq	$37, %r15
	xorq	%r13, %rbx
	addq	%r14, %r10
	addq	648(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 728(%rsp)
	movq	%r10, 632(%rsp)
	xorq	%r11, %r12
	xorq	%r11, %r13
	movq	%r10, %r11
	movq	%r12, 648(%rsp)
	addq	696(%rsp), %r12
	movq	%r13, %rbx
	addq	616(%rsp), %r11
	addq	664(%rsp), %rbx
	movq	%r13, 520(%rsp)
	movq	728(%rsp), %r13
	addq	600(%rsp), %r13
	movq	%r12, %r10
	movq	%r12, 712(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	movq	%r15, 696(%rsp)
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	leaq	0(%r13,%rax), %r11
	movq	696(%rsp), %r13
	rolq	$23, %r10
	addq	%r11, %r15
	movq	712(%rsp), %r11
	rolq	$11, %r12
	rolq	$37, %r15
	addq	%r14, %r11
	addq	%r11, %r13
	movq	%r10, %r11
	rolq	$59, %r13
	xorq	%r12, %r11
	movq	%r13, %rbx
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 712(%rsp)
	movabsq	$-2292595471992902602, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %rbx
	movabsq	$8467826889434979867, %r10
	xorq	%r13, %rbx
	movabsq	$2699039428325208307, %r13
	addq	%rbx, %r10
	xorq	%r15, %r11
	movabsq	$6028102484886760763, %rbx
	movq	%r10, 696(%rsp)
	addq	712(%rsp), %rbx
	movabsq	$-5006043190370284386, %r10
	addq	%r10, %r11
	addq	712(%rsp), %r13
	movq	696(%rsp), %r10
	addq	%r11, %rbx
	addq	%r12, %r10
	addq	%r8, %r11
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	696(%rsp), %r10
	addq	%rdi, %r12
	rolq	$19, %r13
	addq	%rbx, %r12
	rolq	$7, %r15
	addq	%rsi, %r10
	rolq	$31, %r12
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 696(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 664(%rsp)
	movq	%r13, 616(%rsp)
	movq	%r11, 600(%rsp)
	movq	%r11, %rbx
	addq	632(%rsp), %r13
	addq	728(%rsp), %rbx
	movq	%r10, %r11
	addq	648(%rsp), %r11
	addq	520(%rsp), %r12
	movq	%r13, %r10
	movq	%r13, 520(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 648(%rsp)
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	addq	648(%rsp), %r12
	addq	%rsi, %r10
	addq	648(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 680(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	456(%rsp), %r12
	movq	%r13, 584(%rsp)
	movq	%r11, 568(%rsp)
	movq	%r11, %rbx
	addq	440(%rsp), %r13
	addq	424(%rsp), %rbx
	movq	%r10, %r11
	addq	472(%rsp), %r11
	movq	%r10, 744(%rsp)
	movq	%r13, %r10
	movq	%r13, 520(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 648(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	520(%rsp), %r10
	addq	648(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	648(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 520(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	552(%rsp), %r12
	movq	%r13, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	%r11, %rbx
	addq	504(%rsp), %r13
	movq	%r10, %r11
	addq	488(%rsp), %rbx
	addq	536(%rsp), %r11
	movq	%r10, 648(%rsp)
	movq	%r13, 552(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 712(%rsp)
	leaq	(%r11,%r10), %r13
	movq	552(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 712(%rsp)
	movabsq	$5953845371152580681, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %r10
	movabsq	$-7646712092252898442, %rbx
	xorq	%r13, %r10
	xorq	%r15, %r11
	addq	%r10, %rbx
	movabsq	$-2842268575306187841, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-7946738593435294165, %r10
	addq	712(%rsp), %r10
	leaq	(%rbx,%r12), %r11
	addq	%rcx, %r12
	addq	%r15, %r10
	leaq	(%r10,%r12), %r13
	leaq	(%rbx,%rdx), %r12
	addq	%r10, %r12
	leaq	(%r15,%rax), %r10
	rolq	$11, %r13
	rolq	$23, %r12
	leaq	(%r10,%r11), %r15
	movabsq	$-3751294463443135658, %r10
	addq	712(%rsp), %r10
	movq	%r12, %rbx
	rolq	$37, %r15
	xorq	%r13, %rbx
	addq	%r11, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r15, %r11
	xorq	%r11, %r12
	xorq	%r11, %r13
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	movq	%r12, 536(%rsp)
	movq	%r10, %r11
	addq	648(%rsp), %r12
	addq	632(%rsp), %r11
	movq	%rbx, 488(%rsp)
	movq	%r13, %rbx
	addq	520(%rsp), %rbx
	movq	488(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r10, 504(%rsp)
	movq	%r13, 552(%rsp)
	movq	%r12, 648(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	movq	%r12, 520(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	520(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	648(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	520(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 424(%rsp)
	movq	424(%rsp), %r15
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r10, %r11
	movq	%r12, 472(%rsp)
	addq	584(%rsp), %r11
	movq	%r13, %rbx
	addq	744(%rsp), %r12
	addq	680(%rsp), %rbx
	addq	568(%rsp), %r15
	movq	%r13, 456(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	addq	%rdx, %r11
	movq	%r12, 520(%rsp)
	movq	%r13, 648(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	leaq	(%r15,%rax), %r10
	movq	648(%rsp), %r15
	rolq	$11, %r13
	rolq	$23, %r12
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	520(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	648(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	xorq	%r11, %r12
	xorq	%r11, %r13
	movq	%r10, %r11
	movq	%r12, 648(%rsp)
	addq	696(%rsp), %r12
	movq	%r13, 520(%rsp)
	movq	%rbx, 728(%rsp)
	movq	%r13, %rbx
	addq	616(%rsp), %r11
	addq	664(%rsp), %rbx
	movq	728(%rsp), %r13
	addq	600(%rsp), %r13
	movq	%r10, 632(%rsp)
	movq	%r12, %r10
	movq	%r12, 712(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	leaq	0(%r13,%rax), %r11
	movq	%r15, 696(%rsp)
	movq	696(%rsp), %r13
	rolq	$23, %r10
	addq	%r11, %r15
	movq	712(%rsp), %r11
	rolq	$11, %r12
	rolq	$37, %r15
	addq	%r14, %r11
	addq	%r11, %r13
	movq	%r10, %r11
	rolq	$59, %r13
	xorq	%r12, %r11
	movq	%r13, %rbx
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 712(%rsp)
	movabsq	$-824919486193887165, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %rbx
	movabsq	$-1914029582460860148, %r10
	xorq	%r13, %rbx
	xorq	%r15, %r11
	movabsq	$7484883476188376383, %r13
	addq	%rbx, %r10
	movabsq	$-7632797540959622777, %rbx
	movq	%r10, 696(%rsp)
	movabsq	$6609752215332129920, %r10
	addq	%r10, %r11
	addq	712(%rsp), %rbx
	movq	696(%rsp), %r10
	addq	712(%rsp), %r13
	addq	%r12, %r10
	addq	%rdi, %r12
	addq	%r11, %rbx
	addq	%r8, %r11
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	696(%rsp), %r10
	rolq	$19, %r13
	addq	%rbx, %r12
	rolq	$7, %r15
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 744(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	520(%rsp), %r12
	movq	%r13, 680(%rsp)
	movq	%r11, 584(%rsp)
	movq	%r11, %rbx
	addq	632(%rsp), %r13
	addq	728(%rsp), %rbx
	movq	%r10, %r11
	addq	648(%rsp), %r11
	movq	%r10, 600(%rsp)
	movq	%r13, 520(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	leaq	(%rbx,%r10), %r15
	movq	%r13, 648(%rsp)
	addq	648(%rsp), %r12
	leaq	(%r11,%r10), %r13
	movq	520(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	movq	%r13, %rbx
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	648(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 696(%rsp)
	movq	%rbx, 664(%rsp)
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, %r12
	movq	%r13, 616(%rsp)
	movq	%r11, %rbx
	addq	440(%rsp), %r13
	addq	424(%rsp), %rbx
	movq	%r11, 568(%rsp)
	movq	%r10, %r11
	addq	472(%rsp), %r11
	addq	456(%rsp), %r12
	movq	%r13, %r10
	movq	%r13, 520(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 648(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	520(%rsp), %r10
	addq	648(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	648(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 520(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	552(%rsp), %r12
	movq	%r13, 632(%rsp)
	movq	%r11, 728(%rsp)
	movq	%r11, %rbx
	addq	504(%rsp), %r13
	addq	488(%rsp), %rbx
	movq	%r10, %r11
	addq	536(%rsp), %r11
	movq	%r10, 648(%rsp)
	movq	%r13, 552(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 712(%rsp)
	leaq	(%r11,%r10), %r13
	movq	552(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 712(%rsp)
	movabsq	$-1139829817207230181, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %r10
	movabsq	$3054837738180890943, %rbx
	xorq	%r13, %r10
	xorq	%r15, %r11
	addq	%r10, %rbx
	movabsq	$2588290990126348949, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-938319195649413462, %r10
	addq	712(%rsp), %r10
	leaq	(%rbx,%r12), %r11
	addq	%rcx, %r12
	addq	%r15, %r10
	leaq	(%r10,%r12), %r13
	leaq	(%rbx,%rdx), %r12
	addq	%r10, %r12
	leaq	(%r15,%rax), %r10
	rolq	$11, %r13
	rolq	$23, %r12
	leaq	(%r10,%r11), %r15
	movabsq	$3257124934342745045, %r10
	addq	712(%rsp), %r10
	movq	%r12, %rbx
	rolq	$37, %r15
	xorq	%r13, %rbx
	addq	%r11, %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%r15, %r11
	xorq	%r11, %r13
	xorq	%r11, %r12
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	movq	%r12, 536(%rsp)
	movq	%r10, %r11
	addq	648(%rsp), %r12
	addq	632(%rsp), %r11
	movq	%rbx, 488(%rsp)
	movq	%r13, %rbx
	addq	520(%rsp), %rbx
	movq	488(%rsp), %r15
	addq	728(%rsp), %r15
	movq	%r13, 552(%rsp)
	movq	%r10, 504(%rsp)
	movq	%r12, 648(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	movq	%r12, 520(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	520(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	648(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	520(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 424(%rsp)
	movq	424(%rsp), %r15
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r10, %r11
	movq	%r12, 472(%rsp)
	addq	616(%rsp), %r11
	movq	%r13, %rbx
	addq	696(%rsp), %r12
	addq	664(%rsp), %rbx
	addq	568(%rsp), %r15
	movq	%r13, 456(%rsp)
	movq	%r10, 440(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	addq	%rdx, %r11
	movq	%r12, 520(%rsp)
	movq	%r13, 648(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	leaq	(%r15,%rax), %r10
	movq	648(%rsp), %r15
	rolq	$11, %r13
	rolq	$23, %r12
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	520(%rsp), %r10
	rolq	$37, %r15
	addq	%r14, %r10
	addq	648(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 616(%rsp)
	movq	%r10, 664(%rsp)
	xorq	%r11, %r12
	xorq	%r11, %r13
	movq	%r10, %r11
	movq	%r12, 712(%rsp)
	addq	600(%rsp), %r12
	movq	%r13, %rbx
	addq	680(%rsp), %r11
	addq	744(%rsp), %rbx
	movq	%r13, 696(%rsp)
	movq	616(%rsp), %r13
	addq	584(%rsp), %r13
	movq	%r12, %r10
	movq	%r12, 648(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	movq	%r15, 520(%rsp)
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	leaq	0(%r13,%rax), %r11
	movq	520(%rsp), %r13
	rolq	$23, %r10
	addq	%r11, %r15
	movq	648(%rsp), %r11
	rolq	$11, %r12
	rolq	$37, %r15
	addq	%r14, %r11
	addq	%r11, %r13
	movq	%r10, %r11
	rolq	$59, %r13
	xorq	%r12, %r11
	movq	%r13, %rbx
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 648(%rsp)
	movabsq	$-6097248013946911484, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %rbx
	movabsq	$3174302594670681997, %r10
	xorq	%r13, %rbx
	xorq	%r15, %r11
	movabsq	$6378106504303230091, %r13
	addq	%rbx, %r10
	movabsq	$-8739574512844769069, %rbx
	movq	%r10, 520(%rsp)
	movabsq	$-496885038275669880, %r10
	addq	%r10, %r11
	movq	520(%rsp), %r10
	addq	%r12, %r10
	addq	648(%rsp), %rbx
	addq	648(%rsp), %r13
	addq	%rdi, %r12
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r10, %r13
	leaq	(%r11,%r10), %r15
	movq	520(%rsp), %r10
	rolq	$19, %r13
	addq	%rbx, %r12
	rolq	$7, %r15
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	%rbx, %r10
	movq	%r13, %rbx
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 648(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 520(%rsp)
	movq	%rbx, preCompInternalState+8(%rip)
	movq	%r13, 632(%rsp)
	movq	%r11, %rbx
	movq	%r13, preCompInternalState+16(%rip)
	addq	616(%rsp), %rbx
	addq	664(%rsp), %r13
	movq	%r11, 728(%rsp)
	movq	%r11, preCompInternalState+24(%rip)
	movq	%r10, %r11
	addq	712(%rsp), %r11
	addq	696(%rsp), %r12
	movq	%r10, preCompInternalState(%rip)
	movq	%r13, 696(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	movq	%r13, 712(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	696(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	rolq	$31, %r12
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 744(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	456(%rsp), %r12
	movq	%r13, 680(%rsp)
	movq	%r11, 584(%rsp)
	movq	%r11, %rbx
	addq	440(%rsp), %r13
	addq	424(%rsp), %rbx
	movq	%r10, %r11
	addq	472(%rsp), %r11
	movq	%r10, 600(%rsp)
	movq	%r13, %r10
	movq	%r13, 696(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 712(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	696(%rsp), %r10
	addq	712(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	712(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, %r12
	addq	552(%rsp), %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 696(%rsp)
	movq	%r13, 664(%rsp)
	addq	504(%rsp), %r13
	movq	%r11, %rbx
	addq	488(%rsp), %rbx
	movq	%r11, 616(%rsp)
	movq	%r10, %r11
	addq	536(%rsp), %r11
	movq	%r10, 712(%rsp)
	leaq	0(%r13,%r12), %r10
	addq	%rbx, %r8
	addq	%r10, %r8
	addq	%r11, %r9
	leaq	(%r11,%rbx), %r15
	addq	%r9, %r10
	addq	%r13, %rsi
	rolq	$7, %r8
	rolq	$19, %r10
	addq	%r12, %rdi
	addq	%r15, %rsi
	movq	%r10, %r9
	rolq	$53, %rsi
	addq	%r15, %rdi
	xorq	%r8, %r9
	rolq	$31, %rdi
	movq	%rsi, %r11
	movq	%r9, %r12
	xorq	%rdi, %r11
	xorq	%r9, %rdi
	xorq	%rsi, %r12
	movabsq	$853475092736589577, %rsi
	xorq	%r11, %r10
	addq	%rdi, %rsi
	movabsq	$-5486504877919021346, %rdi
	xorq	%r11, %r8
	leaq	(%r10,%rdi), %r9
	movabsq	$-4925106476758491821, %rdi
	movq	%rsi, InternalState+96(%rip)
	addq	%r8, %rdi
	movabsq	$1906713845121804688, %r8
	movabsq	$6102157975113963195, %rbx
	addq	%r12, %r8
	leaq	(%r9,%rsi), %r10
	movq	%r9, InternalState+104(%rip)
	movq	%r8, InternalState+120(%rip)
	addq	%rdx, %r9
	addq	%rdi, %r8
	leaq	(%r8,%r9), %r13
	addq	%r12, %rbx
	addq	%rcx, %rsi
	addq	%r10, %rbx
	movq	%rdi, InternalState+112(%rip)
	addq	%rax, %rdi
	addq	%r8, %rsi
	rolq	$23, %r13
	addq	%r10, %rdi
	rolq	$59, %rbx
	rolq	$37, %rdi
	rolq	$11, %rsi
	movq	%rbx, %r8
	movq	%r13, %r12
	xorq	%rdi, %r8
	xorq	%rsi, %r12
	xorq	%r12, %rbx
	xorq	%r8, %r13
	xorq	%r8, %rsi
	xorq	%rdi, %r12
	movq	%r13, preCompInternalState+96(%rip)
	movq	%rsi, preCompInternalState+104(%rip)
	addq	712(%rsp), %r13
	addq	696(%rsp), %rsi
	movq	%rbx, preCompInternalState+112(%rip)
	movq	%r12, preCompInternalState+120(%rip)
	addq	664(%rsp), %rbx
	addq	616(%rsp), %r12
	leaq	(%rsi,%rcx), %r9
	movq	%rsi, InternalState+64(%rip)
	movq	%r13, InternalState+88(%rip)
	leaq	(%rbx,%rdx), %r8
	leaq	(%r12,%r13), %rdi
	leaq	(%rsi,%rbx), %r11
	movq	%rbx, InternalState+72(%rip)
	movq	%r12, InternalState+80(%rip)
	addq	%rdi, %r9
	addq	%r8, %rdi
	leaq	(%r12,%rax), %r8
	rolq	$23, %rdi
	rolq	$11, %r9
	leaq	(%r8,%r11), %r15
	leaq	0(%r13,%r14), %r8
	addq	%r8, %r11
	rolq	$37, %r15
	movq	%rdi, %r8
	rolq	$59, %r11
	xorq	%r9, %r8
	movq	%r11, %r10
	xorq	%r15, %r10
	xorq	%r10, %rdi
	xorq	%r9, %r10
	movq	%r8, %r9
	xorq	%r15, %r8
	xorq	%r11, %r9
	movq	%rdi, preCompInternalState+64(%rip)
	movq	%r8, preCompInternalState+88(%rip)
	addq	600(%rsp), %rdi
	addq	584(%rsp), %r8
	movq	%r10, preCompInternalState+72(%rip)
	movq	%r9, preCompInternalState+80(%rip)
	addq	744(%rsp), %r10
	addq	680(%rsp), %r9
	movq	%rdi, InternalState+56(%rip)
	leaq	(%r8,%rdi), %r11
	addq	%r8, %rax
	movq	%r8, InternalState+48(%rip)
	addq	%r10, %rcx
	movq	%r10, InternalState+32(%rip)
	leaq	(%r10,%r9), %r15
	addq	%r9, %rdx
	addq	%r11, %rcx
	addq	%r11, %rdx
	rolq	$11, %rcx
	movq	%r9, InternalState+40(%rip)
	rolq	$23, %rdx
	addq	%r15, %rax
	addq	%r14, %rdi
	addq	%r15, %rdi
	rolq	$37, %rax
	movq	%rdx, %r8
	rolq	$59, %rdi
	xorq	%rcx, %r8
	movq	%rdi, %r9
	xorq	%r8, %rdi
	xorq	%rax, %r9
	movq	%rdi, preCompInternalState+48(%rip)
	addq	632(%rsp), %rdi
	xorq	%r9, %rcx
	xorq	%r9, %rdx
	xorq	%r8, %rax
	movq	%rcx, preCompInternalState+40(%rip)
	addq	520(%rsp), %rcx
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%rdi, InternalState+8(%rip)
	addq	728(%rsp), %rax
	addq	648(%rsp), %rdx
	addq	%rcx, 776(%rsp)
	addq	%rdi, 784(%rsp)
	addq	%rax, 792(%rsp)
	addq	%rdx, 800(%rsp)
	addq	%rsi, 808(%rsp)
	addq	%rbx, 816(%rsp)
	movq	%rax, InternalState+16(%rip)
	movq	%rdx, InternalState+24(%rip)
	addq	%r12, 824(%rsp)
	addq	%r13, 832(%rsp)
.L73:
	movq	24(%rsp), %rdx
	movq	72(%rsp), %rdi
	movq	-96(%rsp), %rsi
	subq	$64, %rdx
	cmpq	%rdx, 24(%rsp)
	movq	%rdi, (%rsi)
	jbe	.L85
	movq	96(%rsp), %rsi
	movq	24(%rsp), %rbx
	movl	$-1, %eax
	movzbl	776(%rsp), %ecx
	cmpb	%cl, -64(%rsi,%rbx)
	jne	.L94
	leaq	776(%rsp), %rax
	subq	24(%rsp), %rax
	movq	%rbx, %rcx
	.p2align 4,,10
	.p2align 3
.L103:
	addq	$1, %rdx
	cmpq	%rdx, %rcx
	jbe	.L85
	movzbl	64(%rdx,%rax), %ebx
	cmpb	%bl, (%rsi,%rdx)
	je	.L103
	movl	$-1, %eax
.L94:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
	vmovdqa	904(%rsp), %ymm0
	salq	$3, %rdx
	addq	$1, 520(%rsp)
	movq	%rdx, 424(%rsp)
	movq	520(%rsp), %rdx
	movabsq	$-8247349341179448980, %rcx
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %rbx
	movq	InternalState+24(%rip), %r12
	xorq	InternalState(%rip), %rdx
	movabsq	$6220970056051541820, %r11
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%rbx), %rsi
	movq	InternalState+8(%rip), %r8
	vmovdqa	936(%rsp), %ymm0
	leaq	(%rsi,%rcx), %rdi
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rdx,%r8), %r10
	vmovdqa	968(%rsp), %ymm0
	leaq	(%rdi,%rdx), %r9
	movabsq	$7667772426219706969, %rdx
	leaq	(%r8,%rdx), %rdi
	vmovdqa	%ymm0, InternalState+64(%rip)
	rolq	$11, %r9
	vmovdqa	1000(%rsp), %ymm0
	addq	%rsi, %rdi
	leaq	(%rbx,%r11), %rsi
	rolq	$23, %rdi
	vmovdqa	%ymm0, InternalState+96(%rip)
	leaq	(%rsi,%r10), %rbx
	leaq	(%r12,%r13), %rsi
	addq	%rsi, %r10
	rolq	$37, %rbx
	movq	%r9, %rsi
	rolq	$59, %r10
	xorq	%rdi, %rsi
	movq	%r10, %r8
	xorq	%rbx, %r8
	movq	%r8, %r12
	xorq	%r9, %r8
	xorq	%rdi, %r12
	movabsq	$-1376848230519552085, %rdi
	leaq	(%r8,%rdi), %r9
	movq	%rsi, %r8
	movabsq	$-9209400399786843361, %rdi
	xorq	%r10, %r8
	xorq	%rbx, %rsi
	movabsq	$-1087367646907149102, %r10
	addq	%rdi, %r8
	movabsq	$-369815132508846929, %rdi
	movabsq	$-5426079245872290139, %rbx
	addq	%rdi, %rsi
	movabsq	$-3463520432737951897, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r12, %rdi
	addq	%rsi, %rdi
	addq	%r10, %rsi
	leaq	(%rsi,%r14), %r15
	movabsq	$-6792583489299504353, %rsi
	addq	%r12, %rsi
	movabsq	$-6657276164713376882, %r12
	addq	%rsi, %r14
	leaq	(%r9,%rbx), %rsi
	rolq	$7, %r15
	rolq	$19, %r14
	leaq	(%rsi,%rdi), %r9
	leaq	(%r8,%r12), %rsi
	movq	%r14, %r8
	xorq	%r15, %r8
	addq	%rdi, %rsi
	rolq	$31, %r9
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	xorq	%r9, %rdi
	movq	%rsi, 536(%rsp)
	movq	InternalState+56(%rip), %rsi
	xorq	%rdi, %r14
	xorq	%r15, %rdi
	addq	InternalState+48(%rip), %rsi
	movq	%r14, 504(%rsp)
	movq	%rdi, 568(%rsp)
	movq	InternalState+40(%rip), %r14
	movq	InternalState+32(%rip), %rdi
	movq	%r8, 552(%rsp)
	leaq	(%r14,%rdi), %r8
	addq	%rcx, %rdi
	leaq	(%rdi,%rsi), %r9
	leaq	(%r14,%rdx), %rdi
	leaq	(%rdi,%rsi), %r15
	movq	InternalState+48(%rip), %rsi
	rolq	$11, %r9
	rolq	$23, %r15
	addq	%r11, %rsi
	leaq	(%rsi,%r8), %r14
	movq	InternalState+56(%rip), %rsi
	rolq	$37, %r14
	addq	%r13, %rsi
	addq	%r8, %rsi
	movq	%r15, %r8
	rolq	$59, %rsi
	xorq	%r9, %r8
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r14, %r8
	xorq	%r14, %rdi
	addq	568(%rsp), %r8
	addq	504(%rsp), %rsi
	xorq	%rdi, %r9
	xorq	%r15, %rdi
	addq	536(%rsp), %rdi
	addq	552(%rsp), %r9
	movq	%rsi, 632(%rsp)
	leaq	(%r8,%rdi), %r14
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r14, 648(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%rsi, %r8
	addq	%r14, %rdi
	rolq	$7, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	648(%rsp), %r9
	movq	%r8, %rdi
	rolq	$19, %r15
	addq	%rsi, %r9
	movq	632(%rsp), %rsi
	xorq	%r15, %rdi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	648(%rsp), %rsi
	movq	%rdi, 648(%rsp)
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	648(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	648(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 488(%rsp)
	movq	%rdi, 600(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%rsi, 616(%rsp)
	movq	InternalState+64(%rip), %rdi
	movq	InternalState+88(%rip), %rsi
	addq	InternalState+80(%rip), %rsi
	movq	%r9, 648(%rsp)
	leaq	(%r15,%rdi), %r8
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r9
	leaq	(%r15,%rdx), %rdi
	addq	%rsi, %rdi
	movq	InternalState+80(%rip), %rsi
	rolq	$11, %r9
	rolq	$23, %rdi
	addq	%r11, %rsi
	leaq	(%rsi,%r8), %r15
	movq	InternalState+88(%rip), %rsi
	rolq	$37, %r15
	addq	%r13, %rsi
	addq	%r8, %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%r15, %r8
	movq	%r8, 632(%rsp)
	movq	%rdi, %r8
	xorq	632(%rsp), %rdi
	xorq	%r9, %r8
	addq	616(%rsp), %rdi
	xorq	632(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%r15, %r8
	addq	600(%rsp), %r8
	addq	648(%rsp), %r9
	addq	488(%rsp), %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	movq	%rsi, 728(%rsp)
	addq	%r9, %rsi
	movq	%r15, 632(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	632(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	728(%rsp), %rsi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	632(%rsp), %rsi
	rolq	$53, %rsi
	xorq	%r8, %rdi
	movq	%rdi, 632(%rsp)
	movq	%rsi, %rdi
	xorq	632(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	632(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 664(%rsp)
	movq	%rdi, 744(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %rdi
	movq	%rsi, 696(%rsp)
	movq	InternalState+120(%rip), %rsi
	addq	InternalState+112(%rip), %rsi
	movq	%r9, 632(%rsp)
	leaq	(%r15,%rdi), %r8
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r9
	leaq	(%r15,%rdx), %rdi
	addq	%rsi, %rdi
	movq	InternalState+112(%rip), %rsi
	rolq	$11, %r9
	rolq	$23, %rdi
	addq	%r11, %rsi
	leaq	(%rsi,%r8), %r15
	movq	InternalState+120(%rip), %rsi
	rolq	$37, %r15
	addq	%r13, %rsi
	addq	%r8, %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%r15, %r8
	movq	%r8, 728(%rsp)
	movq	%rdi, %r8
	xorq	728(%rsp), %rdi
	xorq	%r9, %r8
	addq	696(%rsp), %rdi
	xorq	728(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%r15, %r8
	addq	744(%rsp), %r8
	addq	632(%rsp), %r9
	addq	664(%rsp), %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	movq	%rsi, 680(%rsp)
	addq	%r9, %rsi
	movq	%r15, 712(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	712(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r8, 728(%rsp)
	addq	%rsi, %r9
	movq	680(%rsp), %rsi
	xorq	%r15, %r8
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	712(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	movq	%rsi, 712(%rsp)
	xorq	%r9, %rdi
	movabsq	$-7999569951748836447, %rsi
	leaq	(%r8,%rsi), %r9
	movq	%rdi, %rsi
	xorq	728(%rsp), %rdi
	xorq	%r15, %rsi
	movabsq	$-4849728007900573903, %r8
	addq	%rsi, %r8
	movabsq	$-1568322642145848418, %rsi
	addq	%rdi, %rsi
	leaq	(%r9,%r8), %rdi
	movq	%rsi, 680(%rsp)
	movabsq	$-1642314245251606934, %rsi
	addq	712(%rsp), %rsi
	addq	680(%rsp), %rsi
	movq	%rdi, 728(%rsp)
	leaq	(%r9,%rcx), %rdi
	leaq	(%rsi,%rdi), %r15
	leaq	(%r8,%rdx), %rdi
	leaq	(%rsi,%rdi), %r9
	movq	680(%rsp), %rsi
	movq	728(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movabsq	$2553129884740551573, %rsi
	addq	712(%rsp), %rsi
	addq	728(%rsp), %rsi
	rolq	$37, %rdi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 712(%rsp)
	movq	%r15, %r8
	xorq	712(%rsp), %r15
	xorq	%r9, %r8
	xorq	712(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 584(%rsp)
	movq	%rsi, %rdi
	addq	664(%rsp), %rdi
	movq	%r15, %r8
	addq	632(%rsp), %r8
	movq	%r15, 712(%rsp)
	movq	%r9, 680(%rsp)
	movq	584(%rsp), %r9
	addq	744(%rsp), %r9
	movq	%rsi, 456(%rsp)
	movq	%r9, 632(%rsp)
	movq	680(%rsp), %r15
	movq	%r9, %rsi
	addq	696(%rsp), %r15
	leaq	(%r8,%rdi), %r9
	movq	%r9, 696(%rsp)
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r15, 728(%rsp)
	leaq	(%rsi,%rdi), %r9
	leaq	(%rsi,%r8), %r15
	movq	632(%rsp), %rsi
	movq	696(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	728(%rsp), %rsi
	rolq	$37, %rdi
	movq	%rdi, %r8
	addq	%r13, %rsi
	addq	696(%rsp), %rsi
	rolq	$59, %rsi
	xorq	%rsi, %r8
	movq	%r8, 728(%rsp)
	movq	%r9, %r8
	xorq	728(%rsp), %r9
	xorq	%r15, %r8
	xorq	728(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 744(%rsp)
	movq	%rsi, %rdi
	addq	488(%rsp), %rdi
	movq	%r9, 696(%rsp)
	movq	744(%rsp), %r9
	movq	%r15, 728(%rsp)
	movq	%r15, %r8
	movq	696(%rsp), %r15
	addq	616(%rsp), %r15
	addq	648(%rsp), %r8
	addq	600(%rsp), %r9
	movq	%rsi, 664(%rsp)
	movq	%r15, %rsi
	movq	%r15, 648(%rsp)
	addq	%r9, %rsi
	movq	%r9, 600(%rsp)
	leaq	(%r8,%rdi), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 632(%rsp)
	leaq	(%rsi,%r8), %r15
	leaq	(%rsi,%rdi), %r9
	movq	600(%rsp), %rsi
	movq	632(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	648(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	632(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 632(%rsp)
	movq	%r9, %r8
	xorq	%r15, %r8
	xorq	632(%rsp), %r9
	xorq	632(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%rsi, %rdi
	movq	%r9, 616(%rsp)
	movq	%r15, 632(%rsp)
	movq	%rsi, 600(%rsp)
	movq	%r8, 472(%rsp)
	movq	%r15, %r8
	movq	616(%rsp), %r15
	addq	536(%rsp), %r15
	addq	552(%rsp), %r8
	addq	504(%rsp), %rdi
	movq	472(%rsp), %r9
	addq	568(%rsp), %r9
	movq	%r15, %rsi
	movq	%r15, 648(%rsp)
	movq	%r9, 552(%rsp)
	addq	%r9, %rsi
	leaq	(%rdi,%r8), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 568(%rsp)
	leaq	(%r8,%rsi), %r15
	leaq	(%rdi,%rsi), %r9
	movq	552(%rsp), %rsi
	movq	568(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	648(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	568(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 552(%rsp)
	movq	%r9, %r8
	xorq	552(%rsp), %r9
	xorq	%r15, %r8
	movq	%r8, 648(%rsp)
	movq	552(%rsp), %r8
	xorq	648(%rsp), %rdi
	movq	%r9, 568(%rsp)
	movabsq	$-2292595471992902602, %r9
	xorq	%r15, %r8
	addq	%r8, %r9
	movq	648(%rsp), %r8
	xorq	%rsi, %r8
	movabsq	$8467826889434979867, %rsi
	addq	%r8, %rsi
	movabsq	$6028102484886760763, %r8
	addq	568(%rsp), %r8
	movq	%rsi, 536(%rsp)
	movabsq	$-5006043190370284386, %rsi
	addq	%rsi, %rdi
	movq	536(%rsp), %rsi
	addq	%rdi, %r8
	addq	%r10, %rdi
	addq	%r9, %rsi
	addq	%rsi, %rdi
	rolq	$7, %rdi
	movq	%rdi, 648(%rsp)
	movabsq	$2699039428325208307, %rdi
	addq	568(%rsp), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	leaq	(%rsi,%r8), %r9
	movq	536(%rsp), %rsi
	rolq	$19, %r15
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	%r8, %rsi
	movq	648(%rsp), %r8
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rdi
	xorq	%r15, %r8
	xorq	%rdi, %r15
	xorq	648(%rsp), %rdi
	xorq	%r8, %rsi
	movq	%r15, 488(%rsp)
	addq	600(%rsp), %r15
	xorq	%r9, %r8
	movq	%rsi, 552(%rsp)
	movq	%r8, 504(%rsp)
	movq	%r8, %r9
	addq	632(%rsp), %r9
	movq	%rdi, 648(%rsp)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	movq	%r15, 600(%rsp)
	addq	616(%rsp), %rdi
	movq	%r15, %rsi
	addq	472(%rsp), %r8
	addq	%r9, %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%rsi, %r8
	movq	%r15, 632(%rsp)
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	632(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	600(%rsp), %rsi
	xorq	%r8, %rdi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	632(%rsp), %rsi
	movq	%rdi, 632(%rsp)
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	632(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	632(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 600(%rsp)
	movq	%rdi, 536(%rsp)
	movq	%rdi, %r8
	addq	664(%rsp), %r15
	addq	744(%rsp), %r8
	movq	%rsi, %rdi
	addq	696(%rsp), %rdi
	movq	%r9, 632(%rsp)
	addq	728(%rsp), %r9
	movq	%rsi, 616(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 696(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	696(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	728(%rsp), %rsi
	xorq	%r8, %rdi
	movq	%rdi, 728(%rsp)
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	696(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	728(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	728(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 696(%rsp)
	movq	%rdi, 744(%rsp)
	movq	%rdi, %r8
	addq	456(%rsp), %r15
	addq	584(%rsp), %r8
	movq	%rsi, %rdi
	addq	680(%rsp), %rdi
	movq	%r9, 728(%rsp)
	addq	712(%rsp), %r9
	movq	%rsi, 664(%rsp)
	movq	%r15, 568(%rsp)
	movq	%r15, %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 680(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	680(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r8, 712(%rsp)
	addq	%rsi, %r9
	movq	568(%rsp), %rsi
	xorq	%r15, %r8
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	680(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	movq	%rsi, 680(%rsp)
	xorq	%r9, %rdi
	movabsq	$5953845371152580681, %rsi
	leaq	(%r8,%rsi), %r9
	movq	%rdi, %rsi
	xorq	712(%rsp), %rdi
	xorq	%r15, %rsi
	movabsq	$-7646712092252898442, %r8
	addq	%rsi, %r8
	movabsq	$-2842268575306187841, %rsi
	addq	%rdi, %rsi
	leaq	(%r9,%r8), %rdi
	movq	%rsi, 584(%rsp)
	movabsq	$-7946738593435294165, %rsi
	addq	680(%rsp), %rsi
	addq	584(%rsp), %rsi
	movq	%rdi, 712(%rsp)
	leaq	(%r9,%rcx), %rdi
	leaq	(%rsi,%rdi), %r15
	leaq	(%r8,%rdx), %rdi
	leaq	(%rdi,%rsi), %r9
	movq	584(%rsp), %rsi
	movq	712(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movabsq	$-3751294463443135658, %rsi
	addq	680(%rsp), %rsi
	addq	712(%rsp), %rsi
	rolq	$37, %rdi
	movq	%rdi, %r8
	rolq	$59, %rsi
	xorq	%rsi, %r8
	movq	%r8, 712(%rsp)
	movq	%r9, %r8
	xorq	712(%rsp), %r9
	xorq	%r15, %r8
	xorq	712(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 568(%rsp)
	movq	%rsi, %rdi
	addq	696(%rsp), %rdi
	movq	%r9, 680(%rsp)
	movq	568(%rsp), %r9
	movq	%r15, %r8
	addq	744(%rsp), %r9
	addq	728(%rsp), %r8
	movq	%r15, 712(%rsp)
	movq	680(%rsp), %r15
	addq	664(%rsp), %r15
	movq	%rsi, 584(%rsp)
	movq	%r9, 696(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 728(%rsp)
	movq	%r15, 664(%rsp)
	leaq	(%rdi,%rsi), %r9
	leaq	(%r8,%rsi), %r15
	movq	696(%rsp), %rsi
	movq	728(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	664(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	728(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 728(%rsp)
	movq	%r9, %r8
	xorq	728(%rsp), %r9
	xorq	%r15, %r8
	xorq	728(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 744(%rsp)
	movq	%rsi, %rdi
	addq	600(%rsp), %rdi
	movq	%r9, 696(%rsp)
	movq	744(%rsp), %r9
	movq	%r15, 728(%rsp)
	movq	%r15, %r8
	movq	696(%rsp), %r15
	addq	616(%rsp), %r15
	addq	632(%rsp), %r8
	addq	536(%rsp), %r9
	movq	%rsi, 664(%rsp)
	movq	%r15, %rsi
	movq	%r15, 632(%rsp)
	addq	%r9, %rsi
	movq	%r9, 600(%rsp)
	leaq	(%r8,%rdi), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 616(%rsp)
	leaq	(%rsi,%r8), %r15
	leaq	(%rsi,%rdi), %r9
	movq	600(%rsp), %rsi
	movq	616(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	632(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	616(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 632(%rsp)
	movq	%r9, %r8
	xorq	%r15, %r8
	xorq	632(%rsp), %r9
	xorq	632(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 536(%rsp)
	movq	%rsi, %rdi
	addq	488(%rsp), %rdi
	movq	%rsi, 600(%rsp)
	movq	%r9, 616(%rsp)
	movq	%r15, 632(%rsp)
	movq	%r15, %r8
	movq	616(%rsp), %r15
	addq	552(%rsp), %r15
	addq	504(%rsp), %r8
	movq	536(%rsp), %r9
	addq	648(%rsp), %r9
	movq	%r15, %rsi
	addq	%r9, %rsi
	movq	%r9, 504(%rsp)
	leaq	(%rdi,%r8), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r15, 648(%rsp)
	movq	%r9, 552(%rsp)
	leaq	(%r8,%rsi), %r15
	leaq	(%rdi,%rsi), %r9
	movq	504(%rsp), %rsi
	movq	552(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	648(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	552(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 504(%rsp)
	movq	%r9, %r8
	xorq	504(%rsp), %r9
	xorq	%r15, %r8
	movq	%r8, 648(%rsp)
	movq	504(%rsp), %r8
	xorq	648(%rsp), %rdi
	movq	%r9, 552(%rsp)
	movabsq	$-824919486193887165, %r9
	xorq	%r15, %r8
	addq	%r8, %r9
	movq	648(%rsp), %r8
	xorq	%rsi, %r8
	movabsq	$-1914029582460860148, %rsi
	addq	%r8, %rsi
	movabsq	$-7632797540959622777, %r8
	addq	552(%rsp), %r8
	movq	%rsi, 504(%rsp)
	movabsq	$6609752215332129920, %rsi
	addq	%rsi, %rdi
	movq	504(%rsp), %rsi
	addq	%rdi, %r8
	addq	%r10, %rdi
	addq	%r9, %rsi
	addq	%rsi, %rdi
	rolq	$7, %rdi
	movq	%rdi, 648(%rsp)
	movabsq	$7484883476188376383, %rdi
	addq	552(%rsp), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	leaq	(%rsi,%r8), %r9
	movq	504(%rsp), %rsi
	rolq	$19, %r15
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	%r8, %rsi
	movq	648(%rsp), %r8
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rdi
	xorq	%r15, %r8
	xorq	%rdi, %r15
	xorq	648(%rsp), %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	movq	%r15, 472(%rsp)
	addq	600(%rsp), %r15
	movq	%r8, 488(%rsp)
	movq	%r8, %r9
	addq	632(%rsp), %r9
	movq	%rsi, 440(%rsp)
	movq	%rdi, 648(%rsp)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	addq	536(%rsp), %r8
	addq	616(%rsp), %rdi
	movq	%r15, %rsi
	movq	%r15, 632(%rsp)
	addq	%r9, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%rsi, %r8
	movq	%r15, 616(%rsp)
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	616(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	632(%rsp), %rsi
	xorq	%r8, %rdi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	616(%rsp), %rsi
	movq	%rdi, 632(%rsp)
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	632(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	632(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 504(%rsp)
	movq	%rdi, 616(%rsp)
	movq	%rdi, %r8
	addq	664(%rsp), %r15
	addq	744(%rsp), %r8
	movq	%rsi, %rdi
	addq	696(%rsp), %rdi
	movq	%r9, 632(%rsp)
	addq	728(%rsp), %r9
	movq	%rsi, 600(%rsp)
	movq	%r15, 728(%rsp)
	movq	%r15, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 696(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	696(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	728(%rsp), %rsi
	xorq	%r8, %rdi
	movq	%rdi, 728(%rsp)
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	696(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	728(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	728(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 696(%rsp)
	movq	%rdi, 744(%rsp)
	movq	%rdi, %r8
	addq	584(%rsp), %r15
	addq	568(%rsp), %r8
	movq	%rsi, %rdi
	addq	680(%rsp), %rdi
	movq	%r9, 728(%rsp)
	addq	712(%rsp), %r9
	movq	%rsi, 664(%rsp)
	movq	%r15, 584(%rsp)
	movq	%r15, %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 680(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	680(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r8, 712(%rsp)
	addq	%rsi, %r9
	movq	584(%rsp), %rsi
	xorq	%r15, %r8
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	680(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	xorq	%r9, %rdi
	movq	%rsi, 680(%rsp)
	movabsq	$-1139829817207230181, %rsi
	leaq	(%r8,%rsi), %r9
	movq	%rdi, %rsi
	xorq	712(%rsp), %rdi
	xorq	%r15, %rsi
	movabsq	$3054837738180890943, %r8
	addq	%rsi, %r8
	movabsq	$2588290990126348949, %rsi
	addq	%rdi, %rsi
	leaq	(%r9,%r8), %rdi
	movq	%rsi, 584(%rsp)
	movabsq	$-938319195649413462, %rsi
	addq	680(%rsp), %rsi
	addq	584(%rsp), %rsi
	movq	%rdi, 712(%rsp)
	leaq	(%r9,%rcx), %rdi
	leaq	(%rsi,%rdi), %r15
	leaq	(%r8,%rdx), %rdi
	leaq	(%rsi,%rdi), %r9
	movq	584(%rsp), %rsi
	movq	712(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movabsq	$3257124934342745045, %rsi
	addq	680(%rsp), %rsi
	addq	712(%rsp), %rsi
	rolq	$37, %rdi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 712(%rsp)
	movq	%r15, %r8
	xorq	712(%rsp), %r15
	xorq	%r9, %r8
	xorq	712(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 552(%rsp)
	movq	%rsi, %rdi
	addq	696(%rsp), %rdi
	movq	%r15, %r8
	addq	728(%rsp), %r8
	movq	%r15, 712(%rsp)
	movq	%r9, 568(%rsp)
	movq	552(%rsp), %r9
	addq	744(%rsp), %r9
	movq	568(%rsp), %r15
	addq	664(%rsp), %r15
	movq	%rsi, 536(%rsp)
	movq	%r9, 696(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 728(%rsp)
	movq	%r15, 664(%rsp)
	leaq	(%rsi,%rdi), %r9
	leaq	(%rsi,%r8), %r15
	movq	696(%rsp), %rsi
	movq	728(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	664(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	728(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 696(%rsp)
	movq	%r9, %r8
	xorq	696(%rsp), %r9
	xorq	%r15, %r8
	xorq	696(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%rsi, 680(%rsp)
	movq	%rsi, %rdi
	movq	%r9, 744(%rsp)
	movq	%r15, 696(%rsp)
	movq	%r8, 584(%rsp)
	movq	%r15, %r8
	addq	504(%rsp), %rdi
	addq	632(%rsp), %r8
	movq	584(%rsp), %r9
	addq	616(%rsp), %r9
	movq	744(%rsp), %r15
	addq	600(%rsp), %r15
	movq	%r9, 632(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 664(%rsp)
	movq	%r15, 728(%rsp)
	leaq	(%rsi,%rdi), %r9
	leaq	(%rsi,%r8), %r15
	movq	632(%rsp), %rsi
	movq	664(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	728(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	664(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 632(%rsp)
	movq	%r9, %r8
	xorq	%r15, %r8
	xorq	632(%rsp), %r9
	xorq	632(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 456(%rsp)
	movq	%rsi, %rdi
	addq	472(%rsp), %rdi
	movq	%rsi, 504(%rsp)
	movq	%r9, 728(%rsp)
	movq	%r15, 632(%rsp)
	movq	%r15, %r8
	movq	728(%rsp), %r15
	addq	440(%rsp), %r15
	addq	488(%rsp), %r8
	movq	456(%rsp), %r9
	addq	648(%rsp), %r9
	movq	%r15, %rsi
	movq	%r15, 648(%rsp)
	addq	%r9, %rsi
	movq	%r9, 616(%rsp)
	leaq	(%rdi,%r8), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 664(%rsp)
	leaq	(%r8,%rsi), %r15
	leaq	(%rdi,%rsi), %r9
	movq	616(%rsp), %rsi
	movq	664(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	648(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	664(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 616(%rsp)
	movq	%r9, %r8
	xorq	616(%rsp), %r9
	xorq	%r15, %r8
	movq	%r8, 648(%rsp)
	movq	616(%rsp), %r8
	xorq	648(%rsp), %rdi
	movq	%r9, 664(%rsp)
	movabsq	$-6097248013946911484, %r9
	xorq	%r15, %r8
	addq	%r8, %r9
	movq	648(%rsp), %r8
	xorq	%rsi, %r8
	movabsq	$3174302594670681997, %rsi
	addq	%r8, %rsi
	movabsq	$-8739574512844769069, %r8
	addq	664(%rsp), %r8
	movq	%rsi, 616(%rsp)
	movabsq	$-496885038275669880, %rsi
	addq	%rsi, %rdi
	movq	616(%rsp), %rsi
	addq	%rdi, %r8
	addq	%r10, %rdi
	addq	%r9, %rsi
	addq	%rsi, %rdi
	rolq	$7, %rdi
	movq	%rdi, 648(%rsp)
	movabsq	$6378106504303230091, %rdi
	addq	664(%rsp), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	leaq	(%rsi,%r8), %r9
	movq	616(%rsp), %rsi
	rolq	$19, %r15
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	%r8, %rsi
	movq	648(%rsp), %r8
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rdi
	xorq	%r15, %r8
	xorq	%rdi, %r15
	xorq	648(%rsp), %rdi
	xorq	%r8, %rsi
	movq	%r15, 616(%rsp)
	xorq	%r9, %r8
	movq	%r15, preCompInternalState+16(%rip)
	addq	504(%rsp), %r15
	movq	%r8, 600(%rsp)
	movq	%r8, %r9
	movq	%r8, preCompInternalState+8(%rip)
	addq	632(%rsp), %r9
	movq	%rdi, 648(%rsp)
	movq	%rdi, preCompInternalState+24(%rip)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	addq	456(%rsp), %r8
	addq	728(%rsp), %rdi
	movq	%rsi, 664(%rsp)
	movq	%rsi, preCompInternalState(%rip)
	movq	%r15, %rsi
	addq	%r9, %rsi
	movq	%r15, 632(%rsp)
	leaq	(%r8,%rdi), %r15
	addq	%r10, %r8
	addq	%r14, %rdi
	addq	%rsi, %r8
	rolq	$7, %r8
	movq	%r15, 504(%rsp)
	leaq	(%rdi,%rsi), %r15
	movq	%r8, 728(%rsp)
	movq	504(%rsp), %r8
	leaq	(%r9,%rbx), %rsi
	movq	728(%rsp), %r9
	rolq	$19, %r15
	addq	%rsi, %r8
	movq	632(%rsp), %rsi
	rolq	$31, %r8
	xorq	%r15, %r9
	addq	%r12, %rsi
	addq	504(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rsi
	xorq	%r8, %r9
	xorq	%r8, %rdi
	movq	%rsi, 504(%rsp)
	movq	%r9, 488(%rsp)
	xorq	%rdi, %r15
	xorq	728(%rsp), %rdi
	addq	696(%rsp), %r9
	movq	%r15, 472(%rsp)
	addq	680(%rsp), %r15
	movq	%rdi, 728(%rsp)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	addq	584(%rsp), %r8
	addq	744(%rsp), %rdi
	movq	%r15, %rsi
	movq	%r15, 680(%rsp)
	addq	%r9, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r10, %r8
	addq	%r14, %rdi
	addq	%rsi, %r8
	rolq	$7, %r8
	movq	%r15, 696(%rsp)
	leaq	(%rdi,%rsi), %r15
	movq	%r8, 632(%rsp)
	movq	696(%rsp), %r8
	leaq	(%r9,%rbx), %rsi
	movq	632(%rsp), %r9
	rolq	$19, %r15
	addq	%rsi, %r8
	movq	680(%rsp), %rsi
	rolq	$31, %r8
	xorq	%r15, %r9
	addq	%r12, %rsi
	addq	696(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rsi
	xorq	%r8, %r9
	xorq	%r8, %rdi
	movq	%rsi, 696(%rsp)
	movq	%r9, 744(%rsp)
	xorq	%rdi, %r15
	xorq	632(%rsp), %rdi
	movq	%r15, 680(%rsp)
	movq	%r9, %r15
	movq	680(%rsp), %rsi
	addq	712(%rsp), %r15
	addq	536(%rsp), %rsi
	movq	%rdi, 632(%rsp)
	movq	%rdi, %r8
	movq	696(%rsp), %rdi
	addq	552(%rsp), %r8
	addq	568(%rsp), %rdi
	movq	%rsi, 584(%rsp)
	addq	%r15, %rsi
	addq	%r15, %rbx
	leaq	(%rdi,%r8), %r9
	addq	%r10, %r8
	addq	%r14, %rdi
	movq	%r9, 712(%rsp)
	leaq	(%r8,%rsi), %r9
	leaq	(%rdi,%rsi), %r8
	movq	584(%rsp), %rsi
	rolq	$7, %r9
	rolq	$19, %r8
	addq	712(%rsp), %rbx
	movq	%r8, %rdi
	addq	%r12, %rsi
	addq	712(%rsp), %rsi
	xorq	%r9, %rdi
	movq	%rdi, %r14
	rolq	$31, %rbx
	xorq	%rbx, %rdi
	rolq	$53, %rsi
	movq	%rsi, %r10
	xorq	%rsi, %r14
	movabsq	$853475092736589577, %rsi
	xorq	%rbx, %r10
	addq	%rsi, %rdi
	movq	%r10, %rsi
	movq	%rdi, InternalState+96(%rip)
	xorq	%r8, %rsi
	movabsq	$-5486504877919021346, %r8
	leaq	(%rsi,%r8), %rbx
	movq	%r10, %r8
	movabsq	$-4925106476758491821, %rsi
	xorq	%r9, %r8
	leaq	(%r8,%rsi), %r9
	movabsq	$1906713845121804688, %rsi
	leaq	(%rdi,%rbx), %r12
	addq	%r14, %rsi
	addq	%rcx, %rdi
	movq	%rbx, InternalState+104(%rip)
	movq	%r9, InternalState+112(%rip)
	movq	%rsi, InternalState+120(%rip)
	addq	%r9, %rsi
	leaq	(%rsi,%rdi), %r10
	leaq	(%rbx,%rdx), %rdi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r9,%r11), %rsi
	rolq	$11, %r10
	leaq	(%rsi,%r12), %rbx
	movabsq	$6102157975113963195, %rsi
	rolq	$23, %r8
	addq	%r14, %rsi
	movq	%r8, %rdi
	addq	%r12, %rsi
	rolq	$37, %rbx
	xorq	%r10, %rdi
	rolq	$59, %rsi
	movq	%r8, %r12
	movq	%rdi, %r8
	movq	%rsi, %r9
	xorq	%rbx, %rdi
	xorq	%rsi, %r8
	xorq	%rbx, %r9
	movq	%rdi, preCompInternalState+120(%rip)
	movq	696(%rsp), %rsi
	xorq	%r9, %r12
	addq	632(%rsp), %rdi
	xorq	%r10, %r9
	movq	%r9, preCompInternalState+104(%rip)
	movq	%r8, preCompInternalState+112(%rip)
	addq	744(%rsp), %r9
	addq	680(%rsp), %r8
	addq	%r12, %rsi
	movq	%r12, preCompInternalState+96(%rip)
	movq	%rsi, InternalState+88(%rip)
	leaq	(%rdi,%rsi), %r10
	movq	%rdi, InternalState+80(%rip)
	leaq	(%r9,%r8), %r12
	movq	%r9, InternalState+64(%rip)
	addq	%rcx, %r9
	leaq	(%r10,%r9), %rbx
	movq	%r8, InternalState+72(%rip)
	rolq	$11, %rbx
	addq	%rdx, %r8
	addq	%r11, %rdi
	addq	%r10, %r8
	addq	%r13, %rsi
	leaq	(%rdi,%r12), %r10
	rolq	$23, %r8
	addq	%r12, %rsi
	rolq	$59, %rsi
	movq	%r8, %rdi
	rolq	$37, %r10
	xorq	%rbx, %rdi
	movq	%rsi, %r9
	movq	%r8, %r12
	xorq	%r10, %r9
	movq	%rdi, %r8
	xorq	%r10, %rdi
	xorq	%r9, %r12
	xorq	%rsi, %r8
	xorq	%rbx, %r9
	movq	%r9, preCompInternalState+72(%rip)
	movq	%r8, preCompInternalState+80(%rip)
	addq	488(%rsp), %r9
	addq	472(%rsp), %r8
	movq	%rdi, preCompInternalState+88(%rip)
	movq	504(%rsp), %rsi
	addq	728(%rsp), %rdi
	movq	%r12, preCompInternalState+64(%rip)
	addq	%r12, %rsi
	leaq	(%r9,%r8), %rbx
	addq	%r9, %rcx
	addq	%r8, %rdx
	movq	%rsi, InternalState+56(%rip)
	movq	%r9, InternalState+32(%rip)
	leaq	(%rdi,%rsi), %r10
	addq	%r13, %rsi
	movq	%rdi, InternalState+48(%rip)
	addq	%rbx, %rsi
	addq	%r11, %rdi
	movq	%r8, InternalState+40(%rip)
	leaq	(%r10,%rcx), %r9
	addq	%rdx, %r10
	addq	%rbx, %rdi
	rolq	$23, %r10
	rolq	$59, %rsi
	rolq	$37, %rdi
	rolq	$11, %r9
	movq	%rsi, %rcx
	movq	%r10, %rdx
	xorq	%rdi, %rcx
	xorq	%r9, %rdx
	xorq	%rcx, %r10
	xorq	%r9, %rcx
	xorq	%rdx, %rsi
	xorq	%rdi, %rdx
	movq	%rcx, preCompInternalState+40(%rip)
	movq	%rsi, preCompInternalState+48(%rip)
	addq	600(%rsp), %rcx
	addq	616(%rsp), %rsi
	movq	%rdx, preCompInternalState+56(%rip)
	addq	648(%rsp), %rdx
	movq	%r10, preCompInternalState+32(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%rsi, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	664(%rsp), %rdx
	addq	%r10, %rdx
	testq	%rax, %rax
	movq	%rdx, InternalState+24(%rip)
	je	.L64
	movq	-88(%rsp), %rdi
	addq	424(%rsp), %rdi
	xorl	%ecx, %ecx
	movzbl	(%rdi), %edx
	xorb	%dl, InternalState(%rip)
	movl	$1, %edx
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L66:
	movzbl	(%rdi,%rcx), %esi
	xorb	%sil, InternalState(%rdx)
	leaq	1(%rdx), %rsi
	addq	$33, %rdx
	testb	$31, %sil
	cmovne	%rsi, %rdx
.L104:
	addq	$1, %rcx
	cmpq	%rax, %rcx
	jne	.L66
.L64:
	xorb	$1, InternalState(%rax)
	movabsq	$-8247349341179448980, %rcx
	movabsq	$4195444129992158507, %r12
	movq	InternalState+16(%rip), %r8
	movq	InternalState+24(%rip), %rbx
	movq	InternalState(%rip), %rdx
	movq	InternalState+8(%rip), %rsi
	leaq	(%rbx,%r8), %rax
	leaq	(%rsi,%rdx), %r10
	addq	%rcx, %rdx
	leaq	(%rdx,%rax), %r9
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %rsi
	leaq	(%rsi,%rax), %rdi
	movabsq	$6220970056051541820, %rax
	rolq	$11, %r9
	leaq	(%r8,%rax), %rsi
	rolq	$23, %rdi
	leaq	(%rsi,%r10), %r11
	leaq	(%rbx,%r12), %rsi
	addq	%rsi, %r10
	rolq	$37, %r11
	movq	%rdi, %rsi
	rolq	$59, %r10
	xorq	%r9, %rsi
	movq	%r10, %r8
	xorq	%r11, %r8
	movq	%r8, %rbx
	xorq	%r9, %r8
	xorq	%rdi, %rbx
	movabsq	$-1376848230519552085, %rdi
	leaq	(%r8,%rdi), %r9
	movq	%rsi, %r8
	movabsq	$-9209400399786843361, %rdi
	xorq	%r10, %r8
	xorq	%r11, %rsi
	movabsq	$-5426079245872290139, %r11
	addq	%rdi, %r8
	movabsq	$-369815132508846929, %rdi
	addq	%rsi, %rdi
	movabsq	$-3463520432737951897, %rsi
	leaq	(%r9,%r8), %r13
	addq	%rbx, %rsi
	leaq	(%rsi,%rdi), %r15
	movabsq	$-1087367646907149102, %rsi
	addq	%rsi, %rdi
	leaq	(%rdi,%r13), %r14
	movabsq	$-6792583489299504353, %rdi
	addq	%rbx, %rdi
	movabsq	$-6657276164713376882, %rbx
	addq	%rdi, %r13
	leaq	(%r9,%r11), %rdi
	rolq	$7, %r14
	rolq	$19, %r13
	leaq	(%rdi,%r15), %r10
	leaq	(%r8,%rbx), %rdi
	movq	%r13, %r9
	xorq	%r14, %r9
	addq	%r15, %rdi
	rolq	$31, %r10
	movq	InternalState+48(%rip), %r15
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 616(%rsp)
	movq	InternalState+56(%rip), %rdi
	xorq	%r8, %r13
	xorq	%r14, %r8
	movq	%r9, 600(%rsp)
	movq	%r13, 744(%rsp)
	movq	%r8, 680(%rsp)
	movq	InternalState+40(%rip), %r13
	movq	InternalState+32(%rip), %r8
	addq	%r15, %rdi
	leaq	0(%r13,%r8), %r9
	addq	%rcx, %r8
	leaq	(%rdi,%r8), %r10
	leaq	0(%r13,%rdx), %r8
	leaq	(%rdi,%r8), %r14
	leaq	(%r15,%rax), %rdi
	rolq	$11, %r10
	leaq	(%rdi,%r9), %r13
	movq	InternalState+56(%rip), %rdi
	rolq	$23, %r14
	rolq	$37, %r13
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$59, %rdi
	xorq	%r10, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r13, %r9
	xorq	%r13, %r8
	addq	680(%rsp), %r9
	addq	744(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r14, %r8
	addq	616(%rsp), %r8
	addq	600(%rsp), %r10
	movq	%rdi, 648(%rsp)
	leaq	(%r9,%r8), %r13
	addq	%rsi, %r9
	addq	%r10, %rdi
	movq	%r13, 632(%rsp)
	movabsq	$-3329063056561552456, %r13
	leaq	(%r9,%rdi), %r15
	addq	%r13, %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	632(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	addq	%rdi, %r10
	movq	648(%rsp), %rdi
	movq	%r14, %r9
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%rbx, %rdi
	addq	632(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 584(%rsp)
	movq	InternalState+88(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+80(%rip), %rdi
	movq	%r14, 536(%rsp)
	movq	%r8, 552(%rsp)
	movq	InternalState+72(%rip), %r14
	movq	InternalState+64(%rip), %r8
	movq	%r9, 568(%rsp)
	leaq	(%r14,%r8), %r9
	addq	%rcx, %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r14,%rdx), %r8
	leaq	(%rdi,%r8), %r15
	movq	InternalState+80(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r15
	addq	%rax, %rdi
	leaq	(%rdi,%r9), %r14
	movq	InternalState+88(%rip), %rdi
	rolq	$37, %r14
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	%r15, %r9
	xorq	%r10, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	addq	536(%rsp), %rdi
	xorq	%r14, %r8
	xorq	%r14, %r9
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	568(%rsp), %r10
	movq	%rdi, 632(%rsp)
	addq	552(%rsp), %r9
	addq	584(%rsp), %r8
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r14
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 648(%rsp)
	movq	InternalState+120(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+112(%rip), %rdi
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	InternalState+104(%rip), %r14
	movq	InternalState+96(%rip), %r8
	movq	%r9, 632(%rsp)
	leaq	(%r14,%r8), %r9
	addq	%rcx, %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r14,%rdx), %r8
	leaq	(%rdi,%r8), %r15
	movq	InternalState+112(%rip), %rdi
	rolq	$11, %r10
	rolq	$23, %r15
	addq	%rax, %rdi
	leaq	(%rdi,%r9), %r14
	movq	InternalState+120(%rip), %rdi
	rolq	$37, %r14
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	%r15, %r9
	rolq	$59, %rdi
	xorq	%r10, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r14, %r9
	xorq	%r14, %r8
	addq	712(%rsp), %r9
	addq	728(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	648(%rsp), %r8
	addq	632(%rsp), %r10
	movq	%rdi, 664(%rsp)
	leaq	(%r8,%r9), %r15
	addq	%rsi, %r9
	addq	%r13, %r8
	addq	%r10, %rdi
	movq	%r15, 696(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	696(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	664(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r8
	movq	%rdi, 696(%rsp)
	xorq	%r10, %r9
	movabsq	$-7999569951748836447, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	movabsq	$-4849728007900573903, %r9
	xorq	%r14, %rdi
	xorq	%r15, %r8
	addq	%rdi, %r9
	movabsq	$-1568322642145848418, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$-1642314245251606934, %rdi
	addq	696(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 664(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	664(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$2553129884740551573, %rdi
	addq	696(%rsp), %rdi
	addq	664(%rsp), %rdi
	rolq	$37, %r15
	movq	%r10, %r9
	xorq	%r14, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 504(%rsp)
	movq	%r14, 488(%rsp)
	movq	%rdi, 472(%rsp)
	addq	648(%rsp), %r10
	addq	728(%rsp), %r8
	movq	%r9, 456(%rsp)
	movq	%r14, %r9
	addq	632(%rsp), %r9
	movq	456(%rsp), %r15
	addq	712(%rsp), %r15
	movq	%r10, 648(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r10, 632(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	632(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	648(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 440(%rsp)
	movq	%rdi, %r8
	addq	584(%rsp), %r10
	addq	536(%rsp), %r8
	movq	%r9, 392(%rsp)
	movq	%r14, %r9
	addq	568(%rsp), %r9
	movq	392(%rsp), %r15
	addq	552(%rsp), %r15
	movq	%r14, 424(%rsp)
	movq	%rdi, 408(%rsp)
	movq	%r10, %rdi
	movq	%r10, 632(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r14, 648(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	648(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	632(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	648(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 712(%rsp)
	movq	712(%rsp), %r15
	xorq	%r8, %r10
	xorq	%r8, %r14
	addq	680(%rsp), %r15
	movq	%r10, 648(%rsp)
	addq	616(%rsp), %r10
	movq	%r14, %r9
	movq	%rdi, %r8
	addq	600(%rsp), %r9
	addq	744(%rsp), %r8
	movq	%rdi, 728(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r10, %rdi
	movq	%r10, 696(%rsp)
	addq	%r15, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rcx, %r9
	leaq	(%r9,%rdi), %r14
	movq	%r10, 664(%rsp)
	rolq	$11, %r14
	addq	%rdx, %r8
	leaq	(%r8,%rdi), %r10
	movq	664(%rsp), %r8
	leaq	(%r15,%rax), %rdi
	movq	664(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 696(%rsp)
	movabsq	$-2292595471992902602, %rdi
	xorq	%r8, %r9
	xorq	696(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 664(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	696(%rsp), %r9
	movabsq	$8467826889434979867, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$6028102484886760763, %r9
	addq	664(%rsp), %r9
	movq	%rdi, 616(%rsp)
	movabsq	$-5006043190370284386, %rdi
	addq	%rdi, %r8
	movq	616(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$2699039428325208307, %r8
	addq	664(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	616(%rsp), %rdi
	rolq	$19, %r14
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 616(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	632(%rsp), %r10
	movq	%r14, 600(%rsp)
	movq	%r8, 744(%rsp)
	movq	%r8, %r9
	addq	728(%rsp), %r14
	movq	%rdi, %r8
	addq	712(%rsp), %r9
	addq	648(%rsp), %r8
	movq	%rdi, 664(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	424(%rsp), %r10
	movq	%r14, 568(%rsp)
	movq	%r8, 536(%rsp)
	movq	%r8, %r9
	addq	408(%rsp), %r14
	addq	392(%rsp), %r9
	movq	%rdi, %r8
	addq	440(%rsp), %r8
	movq	%rdi, 680(%rsp)
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 632(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	488(%rsp), %r10
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	%r8, %r9
	addq	472(%rsp), %r14
	addq	456(%rsp), %r9
	movq	%rdi, %r8
	addq	504(%rsp), %r8
	movq	%rdi, 648(%rsp)
	movq	%r14, 552(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 696(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	696(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	552(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 696(%rsp)
	movabsq	$5953845371152580681, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	movabsq	$-7646712092252898442, %r9
	xorq	%r14, %rdi
	xorq	%r15, %r8
	addq	%rdi, %r9
	movabsq	$-2842268575306187841, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$-7946738593435294165, %rdi
	addq	696(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 552(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	552(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$-3751294463443135658, %rdi
	movq	%r10, %r9
	rolq	$37, %r15
	addq	696(%rsp), %rdi
	xorq	%r14, %r9
	addq	552(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 472(%rsp)
	movq	472(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 552(%rsp)
	addq	728(%rsp), %r8
	movq	%r14, %r9
	addq	648(%rsp), %r10
	addq	632(%rsp), %r9
	addq	712(%rsp), %r15
	movq	%rdi, 488(%rsp)
	movq	%r14, 504(%rsp)
	movq	%r10, 648(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 632(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	632(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	648(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 456(%rsp)
	addq	680(%rsp), %r10
	addq	568(%rsp), %r8
	movq	%r9, 408(%rsp)
	movq	%r14, %r9
	addq	584(%rsp), %r9
	movq	408(%rsp), %r15
	addq	536(%rsp), %r15
	movq	%r14, 440(%rsp)
	movq	%rdi, 424(%rsp)
	movq	%r10, %rdi
	movq	%r10, 632(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r14, 648(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	648(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	632(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	648(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 712(%rsp)
	movq	712(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 648(%rsp)
	addq	600(%rsp), %r8
	movq	%r14, %r9
	addq	664(%rsp), %r10
	addq	616(%rsp), %r9
	addq	744(%rsp), %r15
	movq	%rdi, 728(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r10, 696(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%r15, %rdi
	addq	%rdx, %r8
	addq	%rcx, %r9
	movq	%r10, 664(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	664(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	664(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 696(%rsp)
	movabsq	$-824919486193887165, %rdi
	xorq	%r8, %r9
	xorq	%r9, %r10
	xorq	%r14, %r9
	xorq	696(%rsp), %r8
	movq	%r10, 664(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	696(%rsp), %r9
	movabsq	$-1914029582460860148, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-7632797540959622777, %r9
	addq	664(%rsp), %r9
	movq	%rdi, 616(%rsp)
	movabsq	$6609752215332129920, %rdi
	addq	%rdi, %r8
	movq	616(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$7484883476188376383, %r8
	addq	664(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	616(%rsp), %rdi
	rolq	$19, %r14
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 664(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r9, 616(%rsp)
	movq	%r14, 600(%rsp)
	movq	%r8, 744(%rsp)
	movq	%r8, %r9
	addq	728(%rsp), %r14
	addq	712(%rsp), %r9
	movq	%rdi, %r8
	addq	648(%rsp), %r8
	addq	632(%rsp), %r10
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	440(%rsp), %r10
	movq	%r14, 568(%rsp)
	movq	%r8, 536(%rsp)
	movq	%r8, %r9
	addq	424(%rsp), %r14
	addq	408(%rsp), %r9
	movq	%rdi, %r8
	addq	456(%rsp), %r8
	movq	%rdi, 680(%rsp)
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 632(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	504(%rsp), %r10
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	%r8, %r9
	addq	488(%rsp), %r14
	addq	472(%rsp), %r9
	movq	%rdi, %r8
	addq	552(%rsp), %r8
	movq	%rdi, 648(%rsp)
	movq	%r14, 504(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 696(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	696(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	504(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	696(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 696(%rsp)
	movabsq	$-1139829817207230181, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	movabsq	$3054837738180890943, %r9
	xorq	%r14, %rdi
	xorq	%r15, %r8
	addq	%rdi, %r9
	movabsq	$2588290990126348949, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$-938319195649413462, %rdi
	addq	696(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 552(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	552(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$3257124934342745045, %rdi
	addq	696(%rsp), %rdi
	addq	552(%rsp), %rdi
	rolq	$37, %r15
	movq	%r10, %r9
	xorq	%r14, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 472(%rsp)
	movq	472(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 552(%rsp)
	movq	%r14, %r9
	addq	632(%rsp), %r9
	addq	728(%rsp), %r8
	addq	648(%rsp), %r10
	addq	712(%rsp), %r15
	movq	%rdi, 488(%rsp)
	movq	%r14, 504(%rsp)
	movq	%r10, 648(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 632(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	632(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	648(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	632(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 408(%rsp)
	movq	408(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 456(%rsp)
	addq	568(%rsp), %r8
	movq	%r14, %r9
	addq	680(%rsp), %r10
	addq	584(%rsp), %r9
	addq	536(%rsp), %r15
	movq	%r14, 440(%rsp)
	movq	%rdi, 424(%rsp)
	leaq	(%r9,%r8), %r14
	movq	%r10, %rdi
	addq	%rcx, %r9
	addq	%r15, %rdi
	addq	%rdx, %r8
	movq	%r10, 632(%rsp)
	movq	%r14, 648(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	648(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	632(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	648(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 648(%rsp)
	movq	%rdi, %r8
	addq	664(%rsp), %r10
	movq	%r9, 712(%rsp)
	movq	%r14, %r9
	addq	600(%rsp), %r8
	addq	616(%rsp), %r9
	movq	712(%rsp), %r15
	addq	744(%rsp), %r15
	movq	%rdi, 728(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r10, 696(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rdx, %r8
	addq	%rcx, %r9
	addq	%r15, %rdi
	movq	%r10, 664(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	664(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	664(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	696(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 696(%rsp)
	movabsq	$-6097248013946911484, %rdi
	xorq	%r8, %r9
	xorq	696(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 664(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	696(%rsp), %r9
	movabsq	$3174302594670681997, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-8739574512844769069, %r9
	addq	664(%rsp), %r9
	movq	%rdi, 616(%rsp)
	movabsq	$-496885038275669880, %rdi
	addq	%rdi, %r8
	movq	616(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$6378106504303230091, %r8
	rolq	$7, %r15
	addq	664(%rsp), %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	616(%rsp), %rdi
	rolq	$19, %r14
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	%r9, %rdi
	movq	%r14, %r9
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 664(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	632(%rsp), %r10
	movq	%r14, 616(%rsp)
	movq	%r8, 680(%rsp)
	movq	%r8, %r9
	addq	728(%rsp), %r14
	addq	712(%rsp), %r9
	movq	%rdi, %r8
	addq	648(%rsp), %r8
	movq	%rdi, 744(%rsp)
	movq	%r14, 632(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 584(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	440(%rsp), %r10
	movq	%r14, 568(%rsp)
	movq	%r8, 536(%rsp)
	movq	%r8, %r9
	addq	424(%rsp), %r14
	movq	%rdi, %r8
	addq	408(%rsp), %r9
	addq	456(%rsp), %r8
	movq	%rdi, 600(%rsp)
	movq	%r14, %rdi
	movq	%r14, 632(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 648(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	648(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	632(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	648(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 632(%rsp)
	movq	%rdi, 648(%rsp)
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r14, 728(%rsp)
	movq	%r8, 712(%rsp)
	movq	%r9, %r14
	movq	728(%rsp), %r15
	addq	504(%rsp), %r14
	movq	%r8, %r9
	addq	488(%rsp), %r15
	addq	472(%rsp), %r9
	movq	%rdi, %r8
	addq	552(%rsp), %r8
	addq	%r14, %r11
	leaq	(%r15,%r14), %rdi
	addq	%r9, %rsi
	movq	728(%rsp), %r14
	leaq	(%r8,%r9), %r10
	addq	%r13, %r8
	addq	%rdi, %r8
	movq	%r10, 696(%rsp)
	leaq	(%rsi,%rdi), %r10
	addq	696(%rsp), %r11
	leaq	(%r15,%rbx), %rsi
	addq	696(%rsp), %rsi
	rolq	$19, %r8
	rolq	$7, %r10
	movq	%r8, %rdi
	movq	712(%rsp), %r15
	rolq	$31, %r11
	rolq	$53, %rsi
	xorq	%r10, %rdi
	movq	%rsi, %r9
	movq	%rdi, %r13
	xorq	%r11, %rdi
	xorq	%rsi, %r13
	xorq	%r11, %r9
	movabsq	$853475092736589577, %rsi
	leaq	(%rdi,%rsi), %r11
	movq	%r9, %rdi
	movabsq	$-5486504877919021346, %rsi
	xorq	%r8, %rdi
	xorq	%r10, %r9
	leaq	(%rdi,%rsi), %r8
	movabsq	$-4925106476758491821, %rdi
	movabsq	$1906713845121804688, %rsi
	leaq	(%r9,%rdi), %r10
	addq	%r13, %rsi
	leaq	(%r11,%rcx), %rdi
	leaq	(%r11,%r8), %rbx
	addq	%r10, %rsi
	leaq	(%rsi,%rdi), %r9
	leaq	(%r8,%rdx), %rdi
	leaq	(%rsi,%rdi), %r11
	leaq	(%r10,%rax), %rsi
	rolq	$11, %r9
	leaq	(%rsi,%rbx), %r10
	movabsq	$6102157975113963195, %rsi
	rolq	$23, %r11
	addq	%r13, %rsi
	movq	%r11, %r8
	movq	632(%rsp), %r13
	addq	%rbx, %rsi
	rolq	$37, %r10
	xorq	%r9, %r8
	rolq	$59, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r10, %r8
	xorq	%r10, %rdi
	addq	%rsi, %r14
	addq	%r8, %r15
	xorq	%rdi, %r9
	xorq	%r11, %rdi
	addq	648(%rsp), %rdi
	addq	%r9, %r13
	leaq	0(%r13,%r14), %r8
	movq	%rdi, 648(%rsp)
	movq	%rdi, %rsi
	leaq	0(%r13,%rcx), %rdi
	addq	%r15, %rsi
	leaq	(%rsi,%rdi), %r10
	leaq	(%r14,%rdx), %rdi
	leaq	(%rsi,%rdi), %rbx
	leaq	(%r15,%rax), %rsi
	rolq	$11, %r10
	movq	%r10, %rdi
	leaq	(%rsi,%r8), %r11
	movq	648(%rsp), %rsi
	rolq	$23, %rbx
	movq	%rbx, %r9
	rolq	$37, %r11
	xorq	%r10, %r9
	movq	568(%rsp), %r10
	addq	%r12, %rsi
	addq	%r8, %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%r11, %r8
	xorq	%r8, %rdi
	addq	584(%rsp), %rdi
	xorq	%r9, %rsi
	xorq	%r11, %r9
	addq	536(%rsp), %r9
	movq	600(%rsp), %r11
	addq	%rsi, %r10
	xorq	%rbx, %r8
	addq	%r10, %rdx
	leaq	(%rdi,%r10), %rbx
	addq	%r8, %r11
	addq	%rdi, %rcx
	addq	%r9, %rax
	leaq	(%r9,%r11), %rsi
	leaq	(%rax,%rbx), %rdi
	leaq	(%r11,%r12), %rax
	movq	776(%rsp), %r11
	leaq	(%rsi,%rdx), %r8
	addq	%rsi, %rcx
	addq	%rbx, %rax
	rolq	$37, %rdi
	rolq	$11, %rcx
	rolq	$59, %rax
	rolq	$23, %r8
	movq	%rax, %rdx
	movq	%r8, %rsi
	xorq	%rdi, %rdx
	xorq	%rcx, %rsi
	xorq	%rdx, %rcx
	addq	664(%rsp), %rcx
	xorq	%rsi, %rax
	addq	616(%rsp), %rax
	xorq	%rdi, %rsi
	xorq	%r8, %rdx
	addq	680(%rsp), %rsi
	addq	744(%rsp), %rdx
	addq	%r11, %rcx
	movq	%rcx, 600(%rsp)
	movq	784(%rsp), %r12
	movq	800(%rsp), %rcx
	addq	808(%rsp), %r13
	addq	816(%rsp), %r14
	movq	648(%rsp), %rbx
	addq	%r12, %rax
	movq	%rax, 616(%rsp)
	movq	792(%rsp), %rax
	addq	%rcx, %rdx
	movq	%rdx, 696(%rsp)
	movq	%r13, 312(%rsp)
	movq	%r14, 128(%rsp)
	movq	600(%rsp), %rdx
	addq	%rax, %rsi
	addq	824(%rsp), %r15
	addq	832(%rsp), %rbx
	movq	%rsi, 664(%rsp)
	movq	%rsi, %rdi
	movq	616(%rsp), %r10
	movq	696(%rsp), %r9
	movq	128(%rsp), %rsi
	movq	%r15, 328(%rsp)
	movq	%rbx, 344(%rsp)
	movq	%r13, %r15
	movq	%rbx, %r11
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L85:
	xorl	%eax, %eax
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L107:
	cmpq	$InternalState+48, %rsi
	jae	.L89
	movzbl	(%rsi), %eax
	movb	%al, InternalState+32(%rip)
	movzbl	1(%rsi), %eax
	movb	%al, InternalState+33(%rip)
	movzbl	2(%rsi), %eax
	movb	%al, InternalState+34(%rip)
	movzbl	3(%rsi), %eax
	movb	%al, InternalState+35(%rip)
	movzbl	4(%rsi), %eax
	movb	%al, InternalState+36(%rip)
	movzbl	5(%rsi), %eax
	movb	%al, InternalState+37(%rip)
	movzbl	6(%rsi), %eax
	movb	%al, InternalState+38(%rip)
	movzbl	7(%rsi), %eax
	movb	%al, InternalState+39(%rip)
	movzbl	8(%rsi), %eax
	movb	%al, InternalState+40(%rip)
	movzbl	9(%rsi), %eax
	movb	%al, InternalState+41(%rip)
	movzbl	10(%rsi), %eax
	movb	%al, InternalState+42(%rip)
	movzbl	11(%rsi), %eax
	movb	%al, InternalState+43(%rip)
	movzbl	12(%rsi), %eax
	movb	%al, InternalState+44(%rip)
	movzbl	13(%rsi), %eax
	movb	%al, InternalState+45(%rip)
	movzbl	14(%rsi), %eax
	movb	%al, InternalState+46(%rip)
	movzbl	15(%rsi), %eax
	movb	%al, InternalState+47(%rip)
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L106:
	cmpq	$InternalState+32, %rcx
	jae	.L88
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L52:
	movzbl	(%rcx,%rax), %edx
	movb	%dl, InternalState(%rax)
	addq	$1, %rax
	cmpq	$32, %rax
	jne	.L52
	jmp	.L54
.L109:
	movq	$0, 104(%rsp)
	jmp	.L71
.L108:
	movq	904(%rsp), %rdi
	movq	912(%rsp), %r8
	movq	936(%rsp), %r11
	movq	944(%rsp), %r12
	movq	920(%rsp), %r9
	movq	928(%rsp), %r10
	movq	952(%rsp), %r13
	movq	960(%rsp), %r14
	movq	1000(%rsp), %rbx
	movq	1008(%rsp), %rsi
	movq	%rdi, 296(%rsp)
	movq	%r8, 360(%rsp)
	movq	1016(%rsp), %rdi
	movq	1024(%rsp), %r8
	movq	984(%rsp), %rdx
	movq	968(%rsp), %r15
	movq	976(%rsp), %rax
	movq	992(%rsp), %rcx
	movq	%r9, -56(%rsp)
	movq	%r10, -64(%rsp)
	leaq	(%r14,%r13), %r9
	leaq	(%r12,%r11), %r10
	movq	%r11, -32(%rsp)
	movq	%r12, -40(%rsp)
	leaq	(%r8,%rdi), %r11
	leaq	(%rsi,%rbx), %r12
	movq	%rdx, 64(%rsp)
	movq	%r13, -16(%rsp)
	movq	%r14, -24(%rsp)
	xorl	%edx, %edx
	movq	%r15, -48(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rcx, 88(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	%rdi, -8(%rsp)
	movq	%r8, 16(%rsp)
	movq	%r9, 40(%rsp)
	movq	%r10, 32(%rsp)
	movq	%r11, 56(%rsp)
	movq	%r12, 48(%rsp)
	jmp	.L59
	.cfi_endproc
.LFE2572:
	.size	crypto_aead_decrypt, .-crypto_aead_decrypt
	.globl	preCompInternalState
	.bss
	.align 128
	.type	preCompInternalState, @object
	.size	preCompInternalState, 128
preCompInternalState:
	.zero	128
	.globl	InternalState
	.align 128
	.type	InternalState, @object
	.size	InternalState, 128
InternalState:
	.zero	128
	.section	.rodata
	.align 128
	.type	_ZL14preCompConstV2, @object
	.size	_ZL14preCompConstV2, 512
_ZL14preCompConstV2:
	.quad	-3463520432737951897
	.quad	-3463520432737951897
	.quad	-1376848230519552085
	.quad	-1376848230519552085
	.quad	-9209400399786843361
	.quad	-9209400399786843361
	.quad	-369815132508846929
	.quad	-369815132508846929
	.quad	-1642314245251606934
	.quad	-1642314245251606934
	.quad	-7999569951748836447
	.quad	-7999569951748836447
	.quad	-4849728007900573903
	.quad	-4849728007900573903
	.quad	-1568322642145848418
	.quad	-1568322642145848418
	.quad	6028102484886760763
	.quad	6028102484886760763
	.quad	-2292595471992902602
	.quad	-2292595471992902602
	.quad	8467826889434979867
	.quad	8467826889434979867
	.quad	-5006043190370284386
	.quad	-5006043190370284386
	.quad	-7946738593435294165
	.quad	-7946738593435294165
	.quad	5953845371152580681
	.quad	5953845371152580681
	.quad	-7646712092252898442
	.quad	-7646712092252898442
	.quad	-2842268575306187841
	.quad	-2842268575306187841
	.quad	-7632797540959622777
	.quad	-7632797540959622777
	.quad	-824919486193887165
	.quad	-824919486193887165
	.quad	-1914029582460860148
	.quad	-1914029582460860148
	.quad	6609752215332129920
	.quad	6609752215332129920
	.quad	-938319195649413462
	.quad	-938319195649413462
	.quad	-1139829817207230181
	.quad	-1139829817207230181
	.quad	3054837738180890943
	.quad	3054837738180890943
	.quad	2588290990126348949
	.quad	2588290990126348949
	.quad	-8739574512844769069
	.quad	-8739574512844769069
	.quad	-6097248013946911484
	.quad	-6097248013946911484
	.quad	3174302594670681997
	.quad	3174302594670681997
	.quad	-496885038275669880
	.quad	-496885038275669880
	.quad	1906713845121804688
	.quad	1906713845121804688
	.quad	853475092736589577
	.quad	853475092736589577
	.quad	-5486504877919021346
	.quad	-5486504877919021346
	.quad	-4925106476758491821
	.quad	-4925106476758491821
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	2
	.quad	2
	.align 16
.LC1:
	.quad	-8247349341179448980
	.quad	-8247349341179448980
	.align 16
.LC2:
	.quad	7667772426219706969
	.quad	7667772426219706969
	.align 16
.LC3:
	.quad	6220970056051541820
	.quad	6220970056051541820
	.align 16
.LC4:
	.quad	4195444129992158507
	.quad	4195444129992158507
	.align 16
.LC5:
	.quad	-1087367646907149102
	.quad	-1087367646907149102
	.align 16
.LC6:
	.quad	-3329063056561552456
	.quad	-3329063056561552456
	.align 16
.LC7:
	.quad	-5426079245872290139
	.quad	-5426079245872290139
	.align 16
.LC8:
	.quad	-6657276164713376882
	.quad	-6657276164713376882
	.ident	"GCC: (GNU) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
