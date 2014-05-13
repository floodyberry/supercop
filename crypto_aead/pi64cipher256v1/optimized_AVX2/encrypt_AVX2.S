#define crypto_aead_encrypt crypto_aead_pi64cipher256v1_optimized_AVX2_encrypt
#define crypto_aead_decrypt crypto_aead_pi64cipher256v1_optimized_AVX2_decrypt

# AVX2 version made by Rune E. Jensen
# Version 1
# CRYPTO_KEYBYTES 32
# CRYPTO_NSECBYTES 64
# CRYPTO_NPUBBYTES 16
# CRYPTO_ABYTES 64

	.file	"encrypt.s"
	.text
	.p2align 4,,15
	.globl	crypto_aead_encrypt
	.type	crypto_aead_encrypt, @function
crypto_aead_encrypt:
.LFB2782:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-128, %rsp
	subq	$2568, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, -88(%rsp)
	movq	%rdx, -72(%rsp)
	leaq	1544(%rsp), %rdx
	movq	32(%rbp), %rsi
	movq	%rdi, 192(%rsp)
	vmovdqa	%ymm0, 1800(%rsp)
	movq	%rcx, 104(%rsp)
	movq	%rdx, %rdi
	movl	$8, %ecx
	rep stosq
	leaq	32(%rsi), %rax
	movq	%r8, -80(%rsp)
	movq	%r9, -64(%rsp)
	movq	24(%rbp), %r8
	vmovdqa	%ymm0, 1832(%rsp)
	cmpq	$InternalState, %rax
	vmovdqa	%ymm0, 1864(%rsp)
	vmovdqa	%ymm0, 1896(%rsp)
	vmovdqa	%ymm0, 1928(%rsp)
	vmovdqa	%ymm0, 1960(%rsp)
	vmovdqa	%ymm0, 1992(%rsp)
	vmovdqa	%ymm0, 2024(%rsp)
	vmovdqa	%ymm0, InternalState(%rip)
	vmovdqa	%ymm0, InternalState+32(%rip)
	vmovdqa	%ymm0, InternalState+64(%rip)
	vmovdqa	%ymm0, InternalState+96(%rip)
	ja	.L47
.L33:
	vmovdqu	(%rsi), %xmm0
	vinserti128	$0x1, 16(%rsi), %ymm0, %ymm0
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
	leaq	(%rdx,%rbx), %rdi
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
	rolq	$19, %r13
	rolq	$7, %r9
	leaq	(%rdx,%r11), %r10
	movabsq	$-6657276164713376882, %rdx
	addq	%rdx, %rbx
	addq	%rbx, %r11
	rolq	$31, %r10
	movq	%r13, %rbx
	rolq	$53, %r11
	xorq	%r9, %rbx
	movq	%r11, %r12
	xorq	%r10, %r12
	xorq	%rbx, %r11
	xorq	%r10, %rbx
	xorq	%r12, %r13
	xorq	%r9, %r12
	movq	InternalState+32(%rip), %r10
	movq	%r13, 904(%rsp)
	movq	InternalState+48(%rip), %r13
	movq	%r12, 872(%rsp)
	movq	InternalState+40(%rip), %r12
	movq	%rbx, 1384(%rsp)
	movq	%r11, 1416(%rsp)
	leaq	0(%r13,%r14), %r9
	leaq	(%r12,%r10), %rbx
	addq	%rcx, %r10
	leaq	(%r10,%r9), %r11
	leaq	(%r12,%rsi), %r10
	movabsq	$4195444129992158507, %r12
	addq	%r14, %r12
	movq	InternalState+88(%rip), %r14
	addq	%r9, %r10
	leaq	0(%r13,%rax), %r9
	rolq	$11, %r11
	addq	%rbx, %r12
	rolq	$23, %r10
	addq	%rbx, %r9
	rolq	$59, %r12
	movq	%r11, %rbx
	rolq	$37, %r9
	xorq	%r10, %rbx
	movq	%r9, %r13
	xorq	%rbx, %r9
	addq	872(%rsp), %r9
	xorq	%r12, %r13
	xorq	%rbx, %r12
	addq	904(%rsp), %r12
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	1384(%rsp), %r11
	addq	1416(%rsp), %r13
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
	addq	%rdx, %r12
	movq	%r10, %r13
	addq	%r12, %rbx
	xorq	%r9, %r13
	rolq	$53, %rbx
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r13, 1480(%rsp)
	movq	InternalState+80(%rip), %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 1096(%rsp)
	movq	%r10, 1288(%rsp)
	movq	%r12, 936(%rsp)
	movq	InternalState+64(%rip), %r10
	movq	InternalState+72(%rip), %r12
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
	addq	1288(%rsp), %r12
	xorq	%r13, %r11
	addq	1480(%rsp), %r11
	xorq	%rbx, %r9
	xorq	%r10, %r13
	addq	936(%rsp), %r9
	addq	1096(%rsp), %r13
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
	movq	%r13, 1032(%rsp)
	movq	InternalState+112(%rip), %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 1160(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	addq	1224(%rsp), %r11
	xorq	%r10, %r12
	xorq	%r13, %r10
	movq	1160(%rsp), %r13
	xorq	%r12, %rbx
	addq	1032(%rsp), %rbx
	addq	1448(%rsp), %r10
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
	leaq	(%r12,%r11), %r10
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
	movq	%rbx, 1064(%rsp)
	xorq	%r12, %r11
	movq	%r13, 1000(%rsp)
	movq	%rbx, %r12
	movq	1000(%rsp), %r9
	addq	1160(%rsp), %r12
	addq	1448(%rsp), %r9
	movq	%r11, 1256(%rsp)
	movq	%r10, %r13
	addq	1032(%rsp), %r11
	addq	1224(%rsp), %r13
	movq	%r10, 968(%rsp)
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	leaq	(%r11,%r13), %r10
	addq	%rsi, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$4195444129992158507, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	rolq	$37, %r9
	addq	%r12, %r10
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%r9, %r13
	movq	%rbx, %r12
	xorq	%r10, %r13
	xorq	%r11, %r12
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r13, %r11
	movq	%r12, 1128(%rsp)
	movq	%r12, %r9
	movq	%rbx, %r12
	addq	936(%rsp), %r9
	addq	1096(%rsp), %r12
	movq	%r11, 1352(%rsp)
	movq	%r10, %r13
	addq	1480(%rsp), %r11
	addq	1288(%rsp), %r13
	movq	%rbx, 1320(%rsp)
	movq	%r10, 1192(%rsp)
	leaq	(%r9,%r12), %rbx
	leaq	(%r11,%r13), %r10
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
	movq	%rbx, 1160(%rsp)
	addq	872(%rsp), %r9
	movq	%r11, %rbx
	movq	%r11, 1032(%rsp)
	addq	1384(%rsp), %rbx
	movq	%r10, %r13
	movq	1160(%rsp), %r11
	addq	904(%rsp), %r13
	addq	1416(%rsp), %r11
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	addq	%rdx, %r11
	addq	%r14, %r13
	addq	%r8, %r9
	addq	%rdi, %rbx
	addq	%r12, %r9
	addq	%r10, %rbx
	addq	%r13, %r12
	addq	%r11, %r10
	rolq	$19, %r12
	rolq	$7, %r9
	rolq	$53, %r10
	rolq	$31, %rbx
	movq	%r12, %r13
	movq	%r10, %r11
	xorq	%r9, %r13
	xorq	%rbx, %r11
	xorq	%r13, %r10
	xorq	%rbx, %r13
	xorq	%r11, %r12
	xorq	%r9, %r11
	movq	%r13, 1288(%rsp)
	movq	%r11, 808(%rsp)
	movq	%r12, 776(%rsp)
	movq	%r13, %r11
	addq	1224(%rsp), %r12
	addq	1032(%rsp), %r11
	movq	808(%rsp), %r9
	movq	1160(%rsp), %r13
	addq	1448(%rsp), %r9
	movq	%r10, 1096(%rsp)
	addq	%r10, %r13
	leaq	(%r11,%r12), %r10
	leaq	(%r9,%r13), %rbx
	addq	%r8, %r9
	addq	%r10, %r9
	rolq	$7, %r9
	addq	%r15, %r13
	addq	%rdx, %r12
	addq	%rdi, %r11
	addq	%r13, %r10
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
	xorq	%r9, %r12
	movq	%rbx, 1416(%rsp)
	movq	%r13, %r11
	movq	%r12, 1384(%rsp)
	addq	1352(%rsp), %r11
	movq	%r13, 1480(%rsp)
	movq	%r10, %r12
	movq	1384(%rsp), %r9
	addq	1192(%rsp), %r12
	addq	1128(%rsp), %r9
	movq	%rbx, %r13
	addq	1320(%rsp), %r13
	movq	%r10, 840(%rsp)
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
	movq	%r10, 1224(%rsp)
	movq	%r13, %r11
	addq	968(%rsp), %r10
	addq	1256(%rsp), %r11
	movq	%r13, 1032(%rsp)
	movq	%r12, 1448(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	1000(%rsp), %r13
	addq	1064(%rsp), %r12
	movq	%rbx, 1160(%rsp)
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
	leaq	(%r12,%r11), %r10
	addq	%rcx, %r11
	addq	%rbx, %r11
	rolq	$11, %r11
	addq	%rsi, %r12
	addq	%rax, %r9
	addq	%r12, %rbx
	movabsq	$-3751294463443135658, %r12
	addq	%r10, %r9
	addq	%r14, %r12
	rolq	$23, %rbx
	rolq	$37, %r9
	addq	%r12, %r10
	movq	%rbx, %r13
	movabsq	$4195444129992158507, %r14
	rolq	$59, %r10
	xorq	%r11, %r13
	movq	%r10, %r12
	xorq	%r13, %r10
	xorq	%r9, %r13
	xorq	%r9, %r12
	movq	%r13, 1352(%rsp)
	movq	1352(%rsp), %r9
	xorq	%r12, %rbx
	xorq	%r12, %r11
	addq	1448(%rsp), %r9
	movq	%rbx, %r12
	addq	1160(%rsp), %r12
	movq	%r11, 904(%rsp)
	movq	%r10, %r13
	addq	1032(%rsp), %r11
	addq	1224(%rsp), %r13
	movq	%rbx, 936(%rsp)
	movq	%r10, 872(%rsp)
	leaq	(%r9,%r12), %rbx
	addq	%rax, %r9
	leaq	(%r11,%r13), %r10
	addq	%rsi, %r13
	addq	%rcx, %r11
	addq	%rbx, %r11
	addq	%r13, %rbx
	movabsq	$4195444129992158507, %r13
	addq	%r13, %r12
	addq	%r10, %r9
	rolq	$23, %rbx
	addq	%r12, %r10
	rolq	$37, %r9
	rolq	$11, %r11
	rolq	$59, %r10
	movq	%rbx, %r12
	movq	%r10, %r13
	xorq	%r9, %r13
	xorq	%r11, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r13, %r11
	xorq	%r9, %r12
	movq	%r11, 1128(%rsp)
	movq	%r10, %r13
	addq	1480(%rsp), %r11
	addq	840(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 968(%rsp)
	addq	1384(%rsp), %r9
	movq	%rbx, %r12
	addq	1416(%rsp), %r12
	movq	%rbx, 1192(%rsp)
	movq	%r10, 1000(%rsp)
	leaq	0(%r13,%r11), %r10
	addq	%rsi, %r13
	addq	%rcx, %r11
	leaq	(%r12,%r9), %rbx
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
	movq	%rbx, 1160(%rsp)
	movq	%r11, 1032(%rsp)
	movq	%r11, %rbx
	movq	%r12, %r9
	movq	1160(%rsp), %r11
	addq	808(%rsp), %r9
	addq	1096(%rsp), %r11
	movq	%r10, %r13
	addq	1288(%rsp), %rbx
	addq	776(%rsp), %r13
	movq	%r12, 1448(%rsp)
	movq	%r10, 1224(%rsp)
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
	addq	%r9, %r10
	addq	%rdi, %rbx
	addq	%r8, %r9
	movabsq	$7484883476188376383, %r14
	addq	%rdx, %r11
	addq	%r12, %r9
	addq	%r14, %r13
	addq	%r10, %rbx
	rolq	$7, %r9
	rolq	$31, %rbx
	addq	%r13, %r12
	addq	%r11, %r10
	rolq	$53, %r10
	rolq	$19, %r12
	movq	%r9, %r13
	movq	%rbx, %r11
	xorq	%r12, %r13
	movq	%rcx, %r14
	xorq	%r10, %r11
	xorq	%r13, %r10
	xorq	%rbx, %r13
	xorq	%r11, %r12
	xorq	%r9, %r11
	movq	%r13, 1288(%rsp)
	movq	%r11, 1480(%rsp)
	movq	%r12, 1256(%rsp)
	movq	%r13, %r11
	addq	1224(%rsp), %r12
	addq	1032(%rsp), %r11
	movq	%r10, %r13
	movq	1480(%rsp), %r9
	addq	1160(%rsp), %r13
	addq	1448(%rsp), %r9
	movq	%r10, 1096(%rsp)
	leaq	(%r11,%r12), %r10
	addq	%rdi, %r11
	addq	%rdx, %r12
	leaq	(%r9,%r13), %rbx
	addq	%r8, %r9
	addq	%r15, %r13
	addq	%r10, %r9
	addq	%r13, %r10
	addq	%rbx, %r11
	rolq	$7, %r9
	addq	%r12, %rbx
	rolq	$31, %r11
	rolq	$19, %r10
	rolq	$53, %rbx
	movq	%r9, %r13
	movq	%r11, %r12
	xorq	%r10, %r13
	xorq	%rbx, %r12
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r11, %r13
	movq	%r12, 1384(%rsp)
	movq	%r10, %r12
	movq	%r13, %r11
	addq	1000(%rsp), %r12
	addq	1128(%rsp), %r11
	movq	%r13, 1064(%rsp)
	movq	1384(%rsp), %r9
	movq	%rbx, %r13
	addq	968(%rsp), %r9
	addq	1192(%rsp), %r13
	movq	%r10, 840(%rsp)
	movq	%rbx, 1320(%rsp)
	leaq	(%r11,%r12), %r10
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
	addq	904(%rsp), %r11
	movq	%r10, 1224(%rsp)
	addq	872(%rsp), %r10
	movq	%r13, 1032(%rsp)
	movq	%r12, %r13
	movq	%r12, 1448(%rsp)
	addq	1352(%rsp), %r13
	movq	%rbx, %r12
	addq	936(%rsp), %r12
	movq	%rbx, 1160(%rsp)
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
	movq	%r9, 1416(%rsp)
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
	addq	1416(%rsp), %r10
	leaq	(%r12,%r9), %r11
	movq	%rsi, %r9
	leaq	(%r12,%rsi), %rsi
	addq	%rbx, %r10
	addq	%r10, %rcx
	addq	%r10, %rsi
	movq	%rax, %r10
	leaq	(%rbx,%rax), %rax
	movabsq	$3257124934342745045, %rbx
	addq	1416(%rsp), %rbx
	rolq	$23, %rsi
	rolq	$11, %rcx
	addq	%r11, %rax
	rolq	$37, %rax
	addq	%rbx, %r11
	movq	%rsi, %rbx
	rolq	$59, %r11
	xorq	%rcx, %rbx
	movq	%r11, %r12
	xorq	%rbx, %r11
	xorq	%rax, %rbx
	xorq	%rax, %r12
	movq	%r11, 872(%rsp)
	movq	%rbx, 1352(%rsp)
	xorq	%r12, %rsi
	xorq	%r12, %rcx
	movq	%r11, %r12
	movq	%rsi, 1416(%rsp)
	movq	%rbx, %r11
	addq	1160(%rsp), %rsi
	addq	1448(%rsp), %r11
	addq	1224(%rsp), %r12
	movq	%rcx, %rax
	addq	1032(%rsp), %rax
	movq	%rcx, 1128(%rsp)
	leaq	(%r11,%rsi), %rbx
	leaq	(%r12,%rax), %rcx
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
	movq	%r12, 936(%rsp)
	movq	%rcx, %r12
	xorq	%rsi, %rbx
	xorq	%rsi, %rax
	addq	840(%rsp), %r12
	movq	%rbx, 1000(%rsp)
	movq	%rax, 968(%rsp)
	movq	%rax, %rsi
	addq	1320(%rsp), %rbx
	addq	1064(%rsp), %rsi
	movq	936(%rsp), %rax
	addq	1384(%rsp), %rax
	movq	%rcx, 904(%rsp)
	leaq	(%r12,%rsi), %rcx
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
	movq	%r11, 1160(%rsp)
	xorq	%rax, %rbx
	movq	%rsi, %r11
	movq	%rcx, %r12
	addq	1288(%rsp), %r11
	addq	1256(%rsp), %r12
	movq	%rsi, 1032(%rsp)
	movq	%rbx, %rax
	movq	1160(%rsp), %rsi
	addq	1480(%rsp), %rax
	addq	1096(%rsp), %rsi
	movq	%rcx, 1224(%rsp)
	movq	%rbx, 1448(%rsp)
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
	movq	%r12, 1480(%rsp)
	addq	%rax, %rcx
	addq	%r8, %rax
	movabsq	$6378106504303230091, %r12
	addq	%rbx, %rax
	rolq	$7, %rax
	addq	1480(%rsp), %r12
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
	movq	%rbx, 1256(%rsp)
	xorq	%r12, %rcx
	xorq	%r11, %r12
	movq	%rcx, 1384(%rsp)
	movq	%r12, 1288(%rsp)
	movq	%rsi, 1480(%rsp)
	addq	1224(%rsp), %rbx
	movq	%r12, %rsi
	movq	1480(%rsp), %rax
	addq	1032(%rsp), %rsi
	movq	%rcx, %r12
	addq	1448(%rsp), %rax
	addq	1160(%rsp), %r12
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
	movq	%r12, 1192(%rsp)
	movq	%r12, %rsi
	movq	%rbx, 1064(%rsp)
	addq	968(%rsp), %rsi
	movq	%rcx, %rbx
	movq	1064(%rsp), %rax
	addq	904(%rsp), %rbx
	movq	%r11, %r12
	addq	936(%rsp), %rax
	addq	1000(%rsp), %r12
	movq	%r11, 1320(%rsp)
	movq	%rcx, 1096(%rsp)
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
	xorq	%rax, %r12
	xorq	%rsi, %rbx
	xorq	%r12, %r11
	xorq	%rbx, %rcx
	xorq	%rsi, %r12
	xorq	%rax, %rbx
	movq	%rcx, 1224(%rsp)
	movq	%r12, %rsi
	addq	872(%rsp), %rcx
	addq	1128(%rsp), %rsi
	movq	%r12, 1032(%rsp)
	movq	%rbx, %r12
	addq	1352(%rsp), %r12
	movq	%rbx, 1448(%rsp)
	movq	%r11, %rbx
	addq	1416(%rsp), %rbx
	movq	%r11, 1160(%rsp)
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
	rolq	$11, %rsi
	addq	%rbx, %rdi
	rolq	$23, %rcx
	movq	%rsi, %r8
	addq	%rdx, %rax
	addq	%rdi, %rdx
	movq	1224(%rsp), %rdi
	rolq	$59, %rdx
	rolq	$37, %rax
	xorq	%rcx, %r8
	movq	%rdx, %r11
	xorq	%rax, %r11
	xorq	%r11, %rcx
	xorq	%rsi, %r11
	xorq	%r8, %rdx
	addq	1032(%rsp), %r11
	addq	%rdx, %rdi
	addq	1160(%rsp), %rcx
	movq	1448(%rsp), %rdx
	xorq	%r8, %rax
	movq	%rdi, InternalState+72(%rip)
	addq	%rax, %rdx
	leaq	(%rdi,%r11), %rsi
	movq	%r11, InternalState+64(%rip)
	leaq	(%rdx,%rcx), %r8
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
	movq	-64(%rsp), %r15
	xorq	%rdx, %rsi
	xorq	%rax, %rcx
	xorq	%rsi, %r8
	xorq	%rsi, %rax
	addq	1320(%rsp), %r8
	addq	1192(%rsp), %rax
	xorq	%rcx, %rdx
	addq	1064(%rsp), %rdx
	xorq	%rcx, %r11
	addq	1096(%rsp), %r11
	movq	%r8, InternalState+56(%rip)
	leaq	(%rdx,%r8), %rdi
	leaq	(%rax,%r14), %rsi
	movq	%rdx, InternalState+48(%rip)
	leaq	(%rax,%r11), %rcx
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
	movq	%rax, 1032(%rsp)
	movq	%rcx, %r11
	xorq	%r8, %rcx
	addq	1256(%rsp), %rcx
	xorq	%rdx, %r11
	xorq	%r8, %rdx
	addq	1480(%rsp), %rdx
	xorq	%r11, %rdi
	xorq	%r11, %rsi
	addq	1384(%rsp), %rdi
	addq	1288(%rsp), %rsi
	testq	%r15, %r15
	movq	%r15, -56(%rsp)
	movq	%rcx, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	%rdi, InternalState+24(%rip)
	movq	%rsi, InternalState(%rip)
	vmovdqa	InternalState(%rip), %ymm0
	vmovdqa	%ymm0, 1672(%rsp)
	vmovdqa	InternalState+32(%rip), %ymm0
	vmovdqa	%ymm0, 1704(%rsp)
	vmovdqa	InternalState+64(%rip), %ymm0
	vmovdqa	%ymm0, 1736(%rsp)
	vmovdqa	InternalState+96(%rip), %ymm0
	vmovdqa	%ymm0, 1768(%rsp)
	je	.L49
	movq	1680(%rsp), %r12
	movq	1688(%rsp), %r8
	movq	1696(%rsp), %r11
	movq	1600(%rsp), %rdx
	movq	1544(%rsp), %rcx
	movq	1552(%rsp), %rbx
	movq	%r12, %rax
	movq	%r8, 40(%rsp)
	movq	1560(%rsp), %rsi
	movq	%r11, 8(%rsp)
	addq	%r9, %rax
	addq	%r8, %r11
	addq	%r11, %rax
	movq	8(%rsp), %r15
	addq	%r10, %r8
	rorq	$41, %rax
	movq	1568(%rsp), %rdi
	movq	%r11, 648(%rsp)
	movq	%rax, 1000(%rsp)
	movq	1592(%rsp), %rax
	addq	%r13, %r15
	movq	1584(%rsp), %r11
	movq	%r12, 712(%rsp)
	movq	%r8, 552(%rsp)
	movq	1672(%rsp), %r12
	movq	1576(%rsp), %r8
	movq	%r15, 520(%rsp)
	movq	%rax, 968(%rsp)
	movq	1704(%rsp), %r15
	movq	1712(%rsp), %rax
	movq	%rdx, 936(%rsp)
	movq	1720(%rsp), %rdx
	movq	%rcx, 904(%rsp)
	movq	%rbx, 872(%rsp)
	movq	%rsi, 840(%rsp)
	movq	%rdi, 808(%rsp)
	movq	%r8, 776(%rsp)
	movq	%r11, 744(%rsp)
	movq	%r12, 680(%rsp)
	movq	%r15, 144(%rsp)
	movq	%rax, 136(%rsp)
	movq	%rdx, 160(%rsp)
	movq	1728(%rsp), %rcx
	movq	1792(%rsp), %rax
	movq	1744(%rsp), %rsi
	movq	1760(%rsp), %r8
	movq	1752(%rsp), %rdi
	movq	%rcx, 152(%rsp)
	addq	%rdx, %rcx
	movq	136(%rsp), %rdx
	movq	%rax, 72(%rsp)
	addq	144(%rsp), %rdx
	movq	160(%rsp), %rax
	movq	%rsi, -32(%rsp)
	movq	136(%rsp), %rsi
	movq	%rcx, 176(%rsp)
	movq	144(%rsp), %rcx
	movq	%r8, -48(%rsp)
	addq	%r10, %rax
	movq	%rdx, 168(%rsp)
	movq	%rdi, -40(%rsp)
	addq	%rdx, %rax
	movq	152(%rsp), %rdx
	addq	%r9, %rsi
	addq	176(%rsp), %rsi
	addq	%r14, %rcx
	addq	176(%rsp), %rcx
	rorq	$27, %rax
	movq	1736(%rsp), %rbx
	movq	1768(%rsp), %r11
	addq	%r13, %rdx
	addq	168(%rsp), %rdx
	movq	1784(%rsp), %r15
	movq	1776(%rsp), %r12
	rorq	$41, %rsi
	rorq	$53, %rcx
	movq	%rbx, -24(%rsp)
	movq	%rsi, %rdi
	movq	%r11, 128(%rsp)
	movq	%r15, 112(%rsp)
	rorq	$5, %rdx
	xorq	%rcx, %rdi
	movq	%r12, 120(%rsp)
	movq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%rax, %r8
	movq	-48(%rsp), %rax
	addq	-40(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	%rbx, %rcx
	movq	%rsi, 256(%rsp)
	movq	-32(%rsp), %rsi
	addq	%r14, %rcx
	movq	%rdx, 248(%rsp)
	movq	%rdi, 456(%rsp)
	addq	%rax, %rcx
	movq	-32(%rsp), %rdx
	movq	-48(%rsp), %rdi
	addq	%r9, %rsi
	rorq	$53, %rcx
	movq	%r8, 488(%rsp)
	addq	%rax, %rsi
	movq	-40(%rsp), %rax
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
	movq	%rsi, 424(%rsp)
	movq	72(%rsp), %rcx
	addq	%r12, %rax
	movq	120(%rsp), %rsi
	movq	%rdx, 360(%rsp)
	rorq	$27, %rax
	movq	72(%rsp), %rdx
	movq	%r8, 392(%rsp)
	movq	%rax, %r8
	addq	%r15, %rcx
	movq	%rdi, 328(%rsp)
	movq	-80(%rsp), %rbx
	movq	%rcx, 184(%rsp)
	addq	%r9, %rsi
	movq	%r11, %rcx
	addq	184(%rsp), %rsi
	addq	%r14, %rcx
	addq	184(%rsp), %rcx
	addq	%r13, %rdx
	movq	%r12, 240(%rsp)
	movq	%rbx, 1160(%rsp)
	addq	%r12, %rdx
	rorq	$5, %rdx
	rorq	$41, %rsi
	xorq	%rdx, %r8
	rorq	$53, %rcx
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	xorq	%rcx, %rdi
	movq	%rsi, 584(%rsp)
	movq	-56(%rsp), %rsi
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	addq	1032(%rsp), %rsi
	movq	%r8, 296(%rsp)
	movq	%rdx, 264(%rsp)
	movq	%rdi, 200(%rsp)
	movq	%rsi, 616(%rsp)
	.p2align 4,,10
	.p2align 3
.L10:
	addq	$1, 1032(%rsp)
	movq	680(%rsp), %rcx
	movabsq	$-8247349341179448980, %rdi
	xorq	1032(%rsp), %rcx
	movq	712(%rsp), %rsi
	movabsq	$7860495443403156170, %r9
	movq	552(%rsp), %rax
	movq	1000(%rsp), %rdx
	movabsq	$-6792583489299504353, %r12
	movabsq	$-3833335565246798826, %r10
	movabsq	$2580067509209331373, %r14
	movabsq	$-1457182779415996031, %r11
	movabsq	$-6802927476391842224, %r13
	addq	%rcx, %rsi
	addq	648(%rsp), %rcx
	addq	%rsi, %rax
	addq	520(%rsp), %rsi
	rolq	$37, %rax
	addq	%rdi, %rcx
	movq	1000(%rsp), %rdi
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
	movq	424(%rsp), %r10
	movabsq	$-3329063056561552456, %r11
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	%r15, %r12
	addq	248(%rsp), %r12
	movq	%rdx, 1384(%rsp)
	movq	%rdi, %rdx
	addq	488(%rsp), %rdx
	movq	1384(%rsp), %rax
	movq	%rsi, %rbx
	addq	456(%rsp), %rax
	addq	256(%rsp), %rbx
	movq	%rsi, 1224(%rsp)
	movabsq	$-5426079245872290139, %r14
	movq	%rdi, 1448(%rsp)
	movabsq	$-3329063056561552456, %rdi
	movq	%r15, 1416(%rsp)
	leaq	(%r12,%rdx), %rsi
	movabsq	$-1087367646907149102, %r15
	addq	%r9, %r12
	addq	%r8, %rdx
	movq	360(%rsp), %r8
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
	movq	392(%rsp), %rdx
	xorq	%rdi, %rbx
	xorq	%rax, %rdi
	movq	328(%rsp), %rax
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
	movq	584(%rsp), %r15
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
	movq	264(%rsp), %rdx
	addq	%r8, %r15
	movq	200(%rsp), %rsi
	movq	%r15, 1480(%rsp)
	xorq	%r9, %r10
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1352(%rsp)
	addq	%r8, %rsi
	movq	%r15, 1288(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1256(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 1480(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	1416(%rsp), %r14
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
	movq	1224(%rsp), %rsi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1384(%rsp), %rax
	movq	1448(%rsp), %r15
	addq	%r12, %r14
	xorq	%r13, %rdi
	movq	%r14, 1448(%rsp)
	xorq	%rdx, %r13
	movq	1448(%rsp), %rdx
	addq	%rbx, %rax
	addq	%rdi, %rsi
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r13, %r15
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1448(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
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
	movq	%r15, 1448(%rsp)
	movq	%rdx, 1416(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 1224(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1384(%rsp)
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
	movq	1352(%rsp), %r15
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
	movq	1288(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	1480(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	1256(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 1480(%rsp)
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1352(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 1288(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1256(%rsp)
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
	movq	%r14, 1480(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	1416(%rsp), %r14
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
	movq	1448(%rsp), %r15
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
	movq	1224(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1384(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 1448(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1448(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1224(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 1448(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 1416(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 1384(%rsp)
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
	movq	1256(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	1480(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	1352(%rsp), %rax
	movq	1288(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 1480(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	1480(%rsp), %r11
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
	movq	%r10, 1480(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	1480(%rsp), %r10
	movq	%r10, 1480(%rsp)
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
	addq	1480(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	1480(%rsp), %rax
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
	movq	%r11, 1352(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 1288(%rsp)
	movq	%r9, 1256(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 1480(%rsp)
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
	movq	1448(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	addq	%rcx, %r13
	rolq	$23, %rsi
	movq	1416(%rsp), %r12
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
	movq	%r12, 1448(%rsp)
	movq	1384(%rsp), %rax
	addq	%rdi, %r15
	movq	1224(%rsp), %r12
	movq	1448(%rsp), %r14
	movabsq	$-8247349341179448980, %rdx
	addq	%rbx, %rax
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%rdx, %r15
	leaq	(%r12,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	1448(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-1584252685182818982, %r14
	addq	%r14, %rcx
	movabsq	$6378106504303230091, %r14
	addq	%r14, %r15
	movabsq	$-3482973570042694885, %r14
	addq	%rax, %rcx
	addq	%r14, %r12
	addq	%r15, %rax
	addq	1448(%rsp), %r12
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	1448(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r12
	movq	%r12, %r14
	xorq	%r15, %r12
	rolq	$31, %rdx
	addq	%r12, %rsi
	movq	%r12, 1224(%rsp)
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
	movq	%rsi, 1128(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 1320(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r14, 1192(%rsp)
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
	movq	1288(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	1256(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	1480(%rsp), %r10
	addq	1352(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 1064(%rsp)
	movabsq	$-1087367646907149102, %r14
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	movq	%r12, 1096(%rsp)
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
	movq	%r12, 1384(%rsp)
	movq	%r14, 1448(%rsp)
	movq	%r14, preCompInternalState+96(%rip)
	movq	%r14, %rcx
	movq	%r11, 1416(%rsp)
	movq	%r11, preCompInternalState+104(%rip)
	addq	%r9, %rsi
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r9, 1352(%rsp)
	addq	%r11, %r8
	addq	1064(%rsp), %rcx
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
	movq	1096(%rsp), %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%rbx, preCompInternalState+64(%rip)
	addq	1320(%rsp), %rbx
	movabsq	$-8247349341179448980, %r13
	movq	%r11, preCompInternalState+72(%rip)
	addq	1128(%rsp), %r10
	addq	%r9, %r12
	addq	1192(%rsp), %r11
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
	movq	1160(%rsp), %r14
	xorq	%r12, %r11
	xorq	%r12, %r10
	movq	1224(%rsp), %r12
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
	movq	%rax, 1320(%rsp)
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
	movq	%rax, %r14
	movabsq	$-8247349341179448980, %rax
	addq	%rdx, %r14
	addq	%rdx, %rax
	leaq	(%rax,%r15), %rdx
	movabsq	$7667772426219706969, %rax
	addq	1320(%rsp), %rax
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
	movq	%r12, 1480(%rsp)
	movabsq	$-3833335565246798826, %r12
	addq	1480(%rsp), %r12
	movq	%r12, 1480(%rsp)
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
	addq	1480(%rsp), %rdx
	addq	%r12, %r14
	movq	1480(%rsp), %r12
	addq	%r14, %r12
	movq	%r15, %r14
	rolq	$31, %rdx
	rolq	$53, %r12
	xorq	%rax, %r14
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rdx, %r14
	xorq	%rdx, %r13
	movq	%r12, 1224(%rsp)
	addq	1224(%rsp), %r9
	xorq	%r13, %r15
	addq	%r14, %rbx
	xorq	%rax, %r13
	movq	%r15, %r12
	addq	%r13, %r10
	movq	%r14, 1288(%rsp)
	addq	%r11, %r12
	movq	%r15, 1256(%rsp)
	movabsq	$-1087367646907149102, %r14
	leaq	(%r12,%rbx), %rdx
	movabsq	$-3329063056561552456, %r15
	movq	%r13, 1480(%rsp)
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
	movq	1416(%rsp), %rcx
	xorq	%r10, %rdi
	movq	1384(%rsp), %r12
	xorq	%rdx, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	movq	1448(%rsp), %rax
	movq	1352(%rsp), %r14
	addq	%r10, %rcx
	addq	%r9, %r12
	addq	%rdi, %rax
	leaq	(%r12,%rcx), %rsi
	movq	%rax, 1448(%rsp)
	addq	%r8, %r14
	movq	%rax, %rdx
	movabsq	$-1087367646907149102, %rax
	addq	%r14, %rdx
	addq	%rax, %r14
	leaq	(%r14,%rsi), %rax
	movabsq	$-3329063056561552456, %r14
	addq	1448(%rsp), %r14
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
	movq	%r12, 1448(%rsp)
	movabsq	$5597446114060141266, %r12
	addq	1448(%rsp), %r12
	movq	%r12, 1448(%rsp)
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
	addq	1448(%rsp), %rax
	addq	%r12, %rdx
	addq	1448(%rsp), %rdx
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
	movq	%rsi, 1448(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r14, 1416(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r14
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r14, %r10
	movq	%rdx, 1384(%rsp)
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
	movq	%r12, 1352(%rsp)
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
	movq	1256(%rsp), %r14
	leaq	(%rbx,%rax), %rdx
	movabsq	$7667772426219706969, %rbx
	addq	%rsi, %r15
	addq	%rbx, %r11
	addq	%r13, %r12
	movq	1224(%rsp), %rsi
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
	movq	1288(%rsp), %r15
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1480(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r12, %r14
	addq	%r11, %rsi
	addq	%r13, %r15
	movabsq	$-8247349341179448980, %rcx
	addq	%rbx, %rax
	movq	%r14, 1320(%rsp)
	addq	%r15, %r14
	leaq	(%rsi,%rax), %rdx
	addq	%rcx, %r15
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1320(%rsp), %r15
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
	movq	%r14, 1480(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1480(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1480(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 1224(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 1288(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 1256(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1480(%rsp)
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
	movq	1416(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	1352(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	1384(%rsp), %rdx
	xorq	%rax, %r8
	movq	1448(%rsp), %rax
	addq	%r10, %rcx
	addq	%r9, %rdx
	addq	%r8, %rsi
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1448(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1448(%rsp), %rsi
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
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
	addq	1448(%rsp), %rdx
	addq	1448(%rsp), %rax
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
	movq	%rdx, 1384(%rsp)
	movq	%rsi, 1448(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 1416(%rsp)
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
	movq	%r14, 1352(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	1256(%rsp), %r14
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
	movq	1288(%rsp), %r15
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
	movq	%r14, 1320(%rsp)
	movq	1480(%rsp), %rax
	xorq	%r13, %r11
	movq	1224(%rsp), %rsi
	xorq	%rdx, %r13
	addq	%r13, %r15
	addq	%rbx, %rax
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%r11, %rsi
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1320(%rsp), %r15
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1480(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1480(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 1224(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 1288(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 1256(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1480(%rsp)
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
	movq	1416(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	1352(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	1384(%rsp), %rdx
	xorq	%rax, %r8
	movq	1448(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1448(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	rolq	$7, %rax
	addq	1448(%rsp), %rsi
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
	movq	%r14, 1448(%rsp)
	movabsq	$1915007920973660762, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$9059564915322872455, %r14
	addq	%r14, %rcx
	movabsq	$-7724133909308953704, %r14
	addq	%r14, %rsi
	movabsq	$3257124934342745045, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$8809261046177890769, %r15
	addq	1448(%rsp), %rdx
	addq	%r15, %rax
	addq	1448(%rsp), %rax
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
	movq	%rsi, 1448(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r8
	addq	%rdx, %r9
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 1416(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movq	%rdx, 1384(%rsp)
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
	movq	%r14, 1352(%rsp)
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
	movq	1288(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %r11
	leaq	(%rbx,%rcx), %rax
	addq	%rsi, %r12
	rolq	$23, %r11
	movq	1224(%rsp), %rsi
	rolq	$11, %rdx
	rolq	$37, %rax
	addq	%rcx, %r12
	rolq	$59, %r12
	movq	%r11, %rbx
	movq	1256(%rsp), %r14
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movabsq	$-8247349341179448980, %rcx
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1480(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movq	%r14, 1320(%rsp)
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1320(%rsp), %r15
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
	movq	%r14, 1480(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
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
	addq	1480(%rsp), %rsi
	addq	1480(%rsp), %rcx
	rolq	$19, %rdx
	rolq	$7, %rax
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$31, %rcx
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%r15, 1288(%rsp)
	addq	1288(%rsp), %r13
	xorq	%rcx, %r14
	xorq	%r14, %rdx
	movq	%r14, %r15
	addq	%rsi, %r11
	xorq	%rax, %r15
	addq	%rdx, %r12
	movq	%rdx, 1256(%rsp)
	addq	%r15, %rbx
	movabsq	$-1087367646907149102, %rax
	movq	%rsi, 1224(%rsp)
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
	movq	%rsi, 1320(%rsp)
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
	movq	1416(%rsp), %rbx
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
	movq	1384(%rsp), %r9
	xorq	%r10, %rcx
	xorq	%r10, %r8
	movq	1448(%rsp), %r11
	movq	1352(%rsp), %r10
	addq	%r8, %rbx
	movq	%r12, 1480(%rsp)
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
	movq	%r12, 1416(%rsp)
	movabsq	$1906713845121804688, %r12
	addq	%r10, %r14
	addq	%r9, %r12
	addq	%r11, %r13
	addq	%r12, %r14
	movq	1416(%rsp), %r12
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
	addq	1320(%rsp), %r9
	xorq	%r13, %rbx
	addq	1480(%rsp), %rbx
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
	addq	%r8, 776(%rsp)
	addq	%r13, %r9
	addq	%rdi, 744(%rsp)
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
	addq	1256(%rsp), %r13
	xorq	%r9, %rdx
	xorq	%rax, %r9
	addq	%r13, 872(%rsp)
	xorq	%rdx, %r10
	xorq	%rdx, %r11
	addq	1224(%rsp), %r10
	addq	1288(%rsp), %r11
	addq	%r15, %r9
	addq	%r10, 808(%rsp)
	addq	%r11, 904(%rsp)
	addq	%r9, 840(%rsp)
	addq	%rsi, 968(%rsp)
	addq	%rcx, 936(%rsp)
	addq	$64, 1160(%rsp)
	movq	616(%rsp), %r13
	cmpq	%r13, 1032(%rsp)
	jne	.L10
	vmovq	840(%rsp), %xmm9
	movq	-56(%rsp), %rdx
	vmovq	904(%rsp), %xmm11
	vpinsrq	$1, 872(%rsp), %xmm11, %xmm1
	vmovq	968(%rsp), %xmm13
	salq	$3, %rdx
	vpinsrq	$1, 808(%rsp), %xmm9, %xmm0
	vmovq	776(%rsp), %xmm14
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 744(%rsp), %xmm14, %xmm1
	vmovdqa	%ymm0, 1544(%rsp)
	vpinsrq	$1, 936(%rsp), %xmm13, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 1576(%rsp)
.L9:
	movq	-64(%rsp), %rax
	andl	$63, %eax
	jne	.L11
	movq	1544(%rsp), %rbx
	movq	1592(%rsp), %rdx
	movq	1576(%rsp), %r9
	movq	1552(%rsp), %rax
	movq	1560(%rsp), %rcx
	movq	1568(%rsp), %rsi
	movq	1600(%rsp), %rdi
	movq	1584(%rsp), %r8
	movq	%rdx, 552(%rsp)
	movq	%rbx, 1320(%rsp)
	movq	%rbx, %rdx
	movq	%r9, 256(%rsp)
	movq	256(%rsp), %rbx
	movq	%rax, %r10
	movq	%rsi, 1288(%rsp)
	movq	%rax, 1480(%rsp)
	movq	%rcx, %rsi
	movq	%rcx, 1256(%rsp)
	movq	%rdi, 584(%rsp)
	movq	%r8, %r12
	movq	%r8, 520(%rsp)
	movq	%rdi, %r14
.L12:
	xorq	40(%rsp), %rsi
	movq	1288(%rsp), %r9
	movabsq	$-8247349341179448980, %rcx
	xorq	8(%rsp), %r9
	xorq	680(%rsp), %rdx
	movabsq	$-9209400399786843361, %r15
	xorq	712(%rsp), %r10
	xorq	-24(%rsp), %rbx
	xorq	-32(%rsp), %r12
	xorq	-48(%rsp), %r14
	movq	552(%rsp), %r13
	xorq	-40(%rsp), %r13
	leaq	(%r9,%rsi), %rax
	vpxor	%xmm5, %xmm5, %xmm5
	leaq	(%rdx,%r10), %r8
	addq	%rcx, %rdx
	leaq	(%rdx,%rax), %rdi
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %r10
	vpxor	%xmm4, %xmm4, %xmm4
	leaq	(%r10,%rax), %r11
	movabsq	$4195444129992158507, %r10
	movabsq	$6220970056051541820, %rax
	addq	%r10, %r9
	addq	%rax, %rsi
	rolq	$11, %rdi
	addq	%r8, %r9
	rolq	$23, %r11
	addq	%r8, %rsi
	rolq	$59, %r9
	rolq	$37, %rsi
	movq	%r11, %r8
	movq	%r9, %r10
	xorq	%rdi, %r8
	xorq	%rsi, %r10
	xorq	%r8, %r9
	xorq	%r8, %rsi
	xorq	%r10, %r11
	movabsq	$-369815132508846929, %r8
	xorq	%r10, %rdi
	movq	%r11, 1448(%rsp)
	addq	%r8, %rsi
	movabsq	$-3463520432737951897, %r8
	addq	1448(%rsp), %r8
	movabsq	$-1376848230519552085, %r11
	addq	%r15, %r9
	addq	%r11, %rdi
	movabsq	$-6792583489299504353, %r11
	addq	1448(%rsp), %r11
	movabsq	$-1087367646907149102, %r15
	leaq	(%rdi,%r9), %r10
	vpxor	%xmm10, %xmm10, %xmm10
	addq	%rsi, %r8
	addq	%r15, %rsi
	addq	%r10, %rsi
	vpxor	%xmm8, %xmm8, %xmm8
	rolq	$7, %rsi
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %rdi
	movabsq	$-6657276164713376882, %r10
	rolq	$19, %r11
	addq	%r10, %r9
	addq	%r8, %rdi
	addq	%r8, %r9
	movq	%r11, %r8
	rolq	$31, %rdi
	rolq	$53, %r9
	xorq	%rsi, %r8
	movq	%r9, %r10
	xorq	%r8, %r9
	xorq	%rdi, %r8
	xorq	%rdi, %r10
	movq	136(%rsp), %rdi
	movq	%r8, 1448(%rsp)
	xorq	%r10, %r11
	movq	144(%rsp), %r8
	xorq	%rsi, %r10
	movq	160(%rsp), %rsi
	movq	%r10, 1384(%rsp)
	movabsq	$4195444129992158507, %r10
	addq	152(%rsp), %r10
	addq	%rdx, %rdi
	addq	176(%rsp), %rdi
	addq	168(%rsp), %r10
	addq	%rcx, %r8
	addq	176(%rsp), %r8
	addq	%rax, %rsi
	addq	168(%rsp), %rsi
	movq	%r9, 1224(%rsp)
	movq	%r11, 1416(%rsp)
	vpxor	%xmm7, %xmm7, %xmm7
	rolq	$23, %rdi
	vpxor	%xmm12, %xmm12, %xmm12
	rolq	$59, %r10
	rolq	$11, %r8
	movq	%rdi, %r9
	rolq	$37, %rsi
	movq	%r10, %r11
	xorq	%r8, %r9
	xorq	%rsi, %r11
	xorq	%r9, %r10
	xorq	%r9, %rsi
	addq	1416(%rsp), %r10
	xorq	%r11, %r8
	addq	1448(%rsp), %r8
	addq	1384(%rsp), %rsi
	xorq	%rdi, %r11
	addq	1224(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	movq	%r11, 1352(%rsp)
	movq	%r11, %r9
	movabsq	$-3329063056561552456, %r11
	addq	1352(%rsp), %r11
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	rolq	$7, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$19, %rdi
	addq	%r11, %r10
	addq	%r9, %r8
	movq	%rdi, %r11
	addq	%r10, %r9
	rolq	$31, %r8
	xorq	%rsi, %r11
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r9, 1352(%rsp)
	leaq	(%rbx,%rcx), %r8
	xorq	%r10, %rdi
	movq	%r11, 1192(%rsp)
	xorq	%rsi, %r10
	movq	%rdi, 1128(%rsp)
	leaq	(%r14,%r13), %rsi
	leaq	(%r12,%rdx), %rdi
	leaq	(%r12,%rbx), %r9
	movq	%r10, 1096(%rsp)
	movabsq	$4195444129992158507, %r10
	addq	%rsi, %r8
	addq	%rsi, %rdi
	addq	%r14, %r10
	leaq	0(%r13,%rax), %rsi
	addq	%r9, %r10
	rolq	$23, %rdi
	rolq	$59, %r10
	rolq	$11, %r8
	movabsq	$-3329063056561552456, %r12
	addq	%r9, %rsi
	movq	%r10, %r11
	movq	%rdi, %r9
	rolq	$37, %rsi
	xorq	%r8, %r9
	movabsq	$-5426079245872290139, %r13
	xorq	%rsi, %r11
	movabsq	$-6657276164713376882, %r14
	xorq	%r11, %r8
	xorq	%r9, %r10
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r10
	xorq	%r9, %rsi
	xorq	%rdi, %r11
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	movq	%r10, %r14
	movq	%r10, %r13
	movq	%r9, 1160(%rsp)
	xorq	%rsi, %r14
	movq	128(%rsp), %r9
	movq	120(%rsp), %rsi
	xorq	%rdi, %r13
	movq	112(%rsp), %rdi
	movq	%r11, %r12
	addq	%rcx, %r9
	addq	184(%rsp), %r9
	xorq	%r8, %r12
	addq	%rdx, %rsi
	addq	184(%rsp), %rsi
	addq	%rax, %rdi
	movabsq	$4195444129992158507, %r8
	rolq	$11, %r9
	rolq	$23, %rsi
	addq	240(%rsp), %rdi
	addq	72(%rsp), %r8
	addq	240(%rsp), %r8
	movq	%rsi, %r11
	xorq	%r9, %r11
	rolq	$37, %rdi
	rolq	$59, %r8
	movq	%r8, %r10
	xorq	%r11, %r8
	xorq	%rdi, %r10
	xorq	%r11, %rdi
	movq	1160(%rsp), %r11
	xorq	%r10, %r9
	addq	%r13, %r8
	xorq	%r10, %rsi
	addq	%r12, %r9
	addq	%r14, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r11
	leaq	(%r11,%rdi), %rsi
	addq	%r15, %rdi
	leaq	(%rdi,%r10), %rbx
	movabsq	$-3329063056561552456, %rdi
	addq	%rdi, %r11
	movabsq	$-5426079245872290139, %rdi
	addq	%r9, %rdi
	movabsq	$-6657276164713376882, %r9
	addq	%r10, %r11
	addq	%r9, %r8
	addq	%rsi, %rdi
	rolq	$19, %r11
	leaq	(%r8,%rsi), %r10
	rolq	$31, %rdi
	rolq	$7, %rbx
	movq	%r11, %r8
	movabsq	$-4849728007900573903, %r9
	rolq	$53, %r10
	xorq	%rbx, %r8
	movq	%r10, %rsi
	xorq	%r8, %r10
	xorq	%rdi, %r8
	xorq	%rdi, %rsi
	movabsq	$-7999569951748836447, %rdi
	xorq	%rsi, %r11
	xorq	%rbx, %rsi
	movabsq	$-1568322642145848418, %rbx
	addq	%r9, %r11
	movabsq	$-1642314245251606934, %r9
	addq	%rdi, %r8
	addq	%rbx, %rsi
	addq	%r10, %r9
	leaq	(%r8,%r11), %rdi
	addq	%rsi, %r9
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$2553129884740551573, %r11
	addq	%r11, %r10
	addq	%rax, %rsi
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	rolq	$11, %r8
	rolq	$59, %rdi
	rolq	$37, %rsi
	movq	%r9, %r11
	movq	%rdi, %r10
	xorq	%r8, %r11
	xorq	%rsi, %r10
	xorq	%r11, %rdi
	xorq	%rsi, %r11
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r11, 936(%rsp)
	movq	%r9, %r10
	movq	936(%rsp), %rsi
	addq	1160(%rsp), %r10
	movq	%rdi, %r11
	movq	%r8, 1000(%rsp)
	addq	%r12, %r8
	addq	%r13, %r11
	movq	%r9, 1064(%rsp)
	movq	%rdi, 968(%rsp)
	addq	%r14, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	leaq	(%rsi,%r10), %r9
	addq	%rcx, %r8
	addq	%rax, %rsi
	movabsq	$4195444129992158507, %r12
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$11, %r8
	rolq	$23, %r9
	rolq	$37, %rsi
	addq	%r12, %r10
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$59, %rdi
	xorq	%r8, %r10
	movq	%rdi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%rsi, %r11
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	xorq	%r11, %r9
	xorq	%r11, %r8
	addq	1096(%rsp), %rsi
	movq	%r9, %r10
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 1160(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	addq	%r12, %r10
	addq	%rax, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	rolq	$11, %r8
	rolq	$59, %rdi
	movq	%r9, %r10
	xorq	%r8, %r10
	rolq	$37, %rsi
	movq	%rdi, %r11
	xorq	%rsi, %r11
	movq	%r9, %r14
	movq	%r8, %rbx
	movq	%r10, %r13
	xorq	%r11, %r14
	xorq	%r11, %rbx
	xorq	%rsi, %r13
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	1384(%rsp), %rsi
	movq	1224(%rsp), %r9
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%rbx, %r8
	addq	%r12, %r11
	addq	%r13, %rsi
	addq	%r14, %r9
	leaq	(%r11,%r8), %rdi
	leaq	(%r9,%rsi), %r10
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%rax, %rsi
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rdi, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	rolq	$37, %rsi
	rolq	$11, %r8
	movq	%r11, %rdi
	rolq	$59, %r10
	xorq	%r8, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$8467826889434979867, %r9
	movq	%r11, 1448(%rsp)
	movabsq	$-2292595471992902602, %r11
	addq	%r9, %r10
	addq	%r11, %r8
	movabsq	$6028102484886760763, %r9
	movabsq	$-5006043190370284386, %r11
	addq	1448(%rsp), %r9
	addq	%r11, %rsi
	movabsq	$2699039428325208307, %r11
	addq	1448(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$7, %rsi
	addq	%r9, %r8
	rolq	$19, %rdi
	rolq	$31, %r8
	addq	%r11, %r10
	movq	%rdi, %r11
	addq	%r10, %r9
	xorq	%rsi, %r11
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1448(%rsp)
	movq	%r11, %r8
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r9, %r11
	movq	%r10, 1384(%rsp)
	movq	1384(%rsp), %rsi
	movq	%rdi, %r10
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r14, %r11
	movq	%r9, 1224(%rsp)
	movq	%rdi, 1416(%rsp)
	movabsq	$-3329063056561552456, %r12
	addq	%r13, %rsi
	leaq	(%r8,%r10), %rdi
	movabsq	$-5426079245872290139, %r13
	leaq	(%rsi,%r11), %r9
	movabsq	$-6657276164713376882, %r14
	addq	%r12, %r11
	addq	%r14, %r10
	addq	%r15, %rsi
	addq	%r13, %r8
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %rdi
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$7, %rsi
	rolq	$53, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r11, 1192(%rsp)
	movq	%r10, 1096(%rsp)
	movq	%r11, %r8
	movq	%rdi, %r10
	addq	904(%rsp), %r8
	movq	1096(%rsp), %rsi
	movq	%r9, %r11
	addq	872(%rsp), %r10
	addq	1160(%rsp), %r11
	addq	840(%rsp), %rsi
	movq	%r9, 1352(%rsp)
	movq	%rdi, 1128(%rsp)
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	movq	%r11, %r12
	movq	%r10, %r13
	xorq	%r11, %r9
	xorq	%r8, %r12
	xorq	%rdi, %r13
	movq	968(%rsp), %r8
	movq	1000(%rsp), %rdi
	movq	936(%rsp), %r11
	movq	%r10, %r14
	movq	%r9, %r10
	addq	1064(%rsp), %r10
	xorq	%rsi, %r14
	addq	%r13, %r8
	movq	%r9, 1160(%rsp)
	addq	%r12, %rdi
	addq	%r14, %r11
	leaq	(%r8,%rdi), %r9
	leaq	(%r10,%r11), %rsi
	addq	%r15, %r11
	leaq	(%r11,%r9), %rbx
	movabsq	$-3329063056561552456, %r11
	addq	%r11, %r10
	leaq	(%r10,%r9), %r11
	movabsq	$-6657276164713376882, %r10
	movabsq	$-5426079245872290139, %r9
	addq	%r10, %r8
	addq	%r9, %rdi
	rolq	$7, %rbx
	leaq	(%r8,%rsi), %r10
	addq	%rsi, %rdi
	rolq	$19, %r11
	rolq	$31, %rdi
	movq	%r11, %r8
	movabsq	$-7646712092252898442, %r9
	rolq	$53, %r10
	xorq	%rbx, %r8
	movq	%r10, %rsi
	xorq	%r8, %r10
	xorq	%rdi, %r8
	xorq	%rdi, %rsi
	movabsq	$5953845371152580681, %rdi
	xorq	%rsi, %r11
	xorq	%rbx, %rsi
	movabsq	$-2842268575306187841, %rbx
	addq	%r9, %r11
	movabsq	$-7946738593435294165, %r9
	addq	%rbx, %rsi
	addq	%rdi, %r8
	addq	%r10, %r9
	addq	%rsi, %r9
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$-3751294463443135658, %r11
	addq	%r11, %r10
	rolq	$23, %r9
	rolq	$11, %r8
	addq	%rdi, %rsi
	movq	%r9, %r11
	addq	%r10, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r11
	rolq	$59, %rdi
	movq	%rdi, %r10
	xorq	%r11, %rdi
	xorq	%rsi, %r11
	xorq	%rsi, %r10
	movq	%r11, 936(%rsp)
	movq	936(%rsp), %rsi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, %r11
	addq	%r13, %r11
	movq	%r8, 1000(%rsp)
	movq	%r9, %r10
	addq	%r12, %r8
	addq	%r14, %rsi
	addq	1160(%rsp), %r10
	movabsq	$4195444129992158507, %r12
	movq	%r9, 1064(%rsp)
	movq	%rdi, 968(%rsp)
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	leaq	(%rsi,%r10), %r9
	addq	%r12, %r10
	addq	%rax, %rsi
	addq	%rdi, %rsi
	addq	%r10, %rdi
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$59, %rdi
	rolq	$23, %r9
	rolq	$37, %rsi
	rolq	$11, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r8
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 1160(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	addq	%rax, %rsi
	addq	%r12, %r10
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$23, %r9
	addq	%rdi, %rsi
	rolq	$11, %r8
	rolq	$37, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	xorq	%r8, %r10
	rolq	$59, %rdi
	movq	%r9, %r14
	movq	%rdi, %r11
	movq	%r10, %r13
	movq	%r8, %rbx
	xorq	%rsi, %r11
	xorq	%rsi, %r13
	movq	1224(%rsp), %r9
	movq	1384(%rsp), %rsi
	xorq	%r11, %r14
	xorq	%r11, %rbx
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%r14, %r9
	addq	%r13, %rsi
	leaq	(%r9,%rsi), %r10
	addq	%rbx, %r8
	addq	%r12, %r11
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rax, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	addq	%rdi, %rsi
	rolq	$11, %r8
	rolq	$37, %rsi
	movq	%r11, %rdi
	rolq	$59, %r10
	xorq	%r8, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$-1914029582460860148, %r9
	movq	%r11, 1448(%rsp)
	addq	%r9, %r10
	movabsq	$-7632797540959622777, %r9
	addq	1448(%rsp), %r9
	movabsq	$-824919486193887165, %r11
	addq	%r11, %r8
	movabsq	$6609752215332129920, %r11
	addq	%r11, %rsi
	movabsq	$7484883476188376383, %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	1448(%rsp), %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	rolq	$7, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$19, %rdi
	addq	%r11, %r10
	addq	%r9, %r8
	movq	%rdi, %r11
	addq	%r10, %r9
	rolq	$31, %r8
	xorq	%rsi, %r11
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1448(%rsp)
	movq	%r11, %r8
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r9, %r11
	movq	%r10, 1384(%rsp)
	movq	1384(%rsp), %rsi
	movq	%rdi, %r10
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r14, %r11
	movq	%r9, 1224(%rsp)
	movq	%rdi, 1416(%rsp)
	movabsq	$-3329063056561552456, %r12
	addq	%r13, %rsi
	leaq	(%r8,%r10), %rdi
	movabsq	$-5426079245872290139, %r13
	leaq	(%rsi,%r11), %r9
	addq	%r13, %r8
	addq	%r12, %r11
	addq	%r15, %rsi
	movabsq	$-6657276164713376882, %r14
	addq	%rdi, %rsi
	addq	%r14, %r10
	addq	%r11, %rdi
	addq	%r9, %r8
	rolq	$7, %rsi
	rolq	$19, %rdi
	rolq	$31, %r8
	addq	%r10, %r9
	movq	%rdi, %r11
	rolq	$53, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1192(%rsp)
	movq	%r11, %r8
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	addq	904(%rsp), %r8
	movq	%r10, 1096(%rsp)
	movq	%r9, %r11
	movq	%rdi, %r10
	addq	1160(%rsp), %r11
	addq	872(%rsp), %r10
	movq	1096(%rsp), %rsi
	addq	840(%rsp), %rsi
	movq	%r9, 1352(%rsp)
	movq	%rdi, 1128(%rsp)
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	movq	%r11, %r12
	movq	%r10, %r13
	xorq	%r11, %r9
	xorq	%r8, %r12
	xorq	%rdi, %r13
	movq	968(%rsp), %r8
	movq	1000(%rsp), %rdi
	movq	936(%rsp), %r11
	movq	%r10, %r14
	xorq	%rsi, %r14
	movq	%r9, %r10
	movq	%r9, 1160(%rsp)
	addq	%r13, %r8
	addq	%r12, %rdi
	addq	%r14, %r11
	addq	1064(%rsp), %r10
	leaq	(%r8,%rdi), %r9
	leaq	(%r10,%r11), %rsi
	addq	%r15, %r11
	leaq	(%r11,%r9), %rbx
	movabsq	$-3329063056561552456, %r11
	addq	%r11, %r10
	leaq	(%r10,%r9), %r11
	movabsq	$-6657276164713376882, %r10
	movabsq	$-5426079245872290139, %r9
	addq	%r10, %r8
	addq	%r9, %rdi
	rolq	$7, %rbx
	leaq	(%r8,%rsi), %r10
	addq	%rsi, %rdi
	rolq	$19, %r11
	rolq	$31, %rdi
	movq	%r11, %r8
	movabsq	$3054837738180890943, %r9
	rolq	$53, %r10
	xorq	%rbx, %r8
	movq	%r10, %rsi
	xorq	%r8, %r10
	xorq	%rdi, %r8
	xorq	%rdi, %rsi
	movabsq	$-1139829817207230181, %rdi
	xorq	%rsi, %r11
	xorq	%rbx, %rsi
	movabsq	$2588290990126348949, %rbx
	addq	%r9, %r11
	movabsq	$-938319195649413462, %r9
	addq	%rbx, %rsi
	addq	%rdi, %r8
	addq	%r10, %r9
	addq	%rsi, %r9
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$3257124934342745045, %r11
	addq	%r11, %r10
	addq	%rdi, %rsi
	rolq	$23, %r9
	addq	%r10, %rdi
	rolq	$11, %r8
	rolq	$37, %rsi
	rolq	$59, %rdi
	movq	%r9, %r11
	movq	%rdi, %r10
	xorq	%rsi, %r10
	xorq	%r8, %r11
	xorq	%r11, %rdi
	xorq	%r10, %r9
	xorq	%rsi, %r11
	xorq	%r10, %r8
	movq	%r11, 936(%rsp)
	movq	%r9, %r10
	movq	936(%rsp), %rsi
	addq	1160(%rsp), %r10
	movq	%rdi, %r11
	addq	%r13, %r11
	movq	%r8, 1000(%rsp)
	addq	%r12, %r8
	movq	%r9, 1064(%rsp)
	movabsq	$4195444129992158507, %r12
	movq	%rdi, 968(%rsp)
	addq	%r14, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	leaq	(%rsi,%r10), %r9
	addq	%rcx, %r8
	addq	%r12, %r10
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%rdi, %rsi
	addq	%r11, %r9
	addq	%r10, %rdi
	rolq	$23, %r9
	rolq	$37, %rsi
	rolq	$59, %rdi
	rolq	$11, %r8
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 1160(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%rdx, %r11
	addq	%r12, %r10
	addq	%r11, %r9
	addq	%rax, %rsi
	rolq	$11, %r8
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$59, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r10
	movq	%rdi, %r11
	movq	%r9, %r14
	movq	%r10, %r13
	xorq	%rsi, %r11
	movq	%r8, %rbx
	xorq	%rsi, %r13
	movq	1224(%rsp), %r9
	movq	1384(%rsp), %rsi
	xorq	%r11, %r14
	xorq	%r11, %rbx
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%r13, %rsi
	addq	%r14, %r9
	leaq	(%r9,%rsi), %r10
	addq	%rbx, %r8
	addq	%rax, %rsi
	addq	%r12, %r11
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rdi, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	rolq	$37, %rsi
	rolq	$11, %r8
	movq	%r11, %rdi
	rolq	$59, %r10
	movq	%r10, %r9
	xorq	%rsi, %r9
	xorq	%r8, %rdi
	xorq	%r9, %r11
	xorq	%r8, %r9
	xorq	%rdi, %r10
	movq	%r11, 1448(%rsp)
	movabsq	$-6097248013946911484, %r11
	xorq	%rsi, %rdi
	addq	%r11, %r9
	movabsq	$-8739574512844769069, %rsi
	movabsq	$-496885038275669880, %r11
	addq	1448(%rsp), %rsi
	addq	%r11, %rdi
	movabsq	$3174302594670681997, %r8
	movabsq	$6378106504303230091, %r11
	addq	1448(%rsp), %r11
	addq	%r8, %r10
	leaq	(%r9,%r10), %r8
	addq	%rdi, %rsi
	addq	%r15, %rdi
	addq	%r8, %rdi
	addq	%r11, %r8
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r9
	movabsq	$-6657276164713376882, %r11
	rolq	$19, %r8
	addq	%r11, %r10
	addq	%rsi, %r9
	rolq	$7, %rdi
	addq	%r10, %rsi
	movq	%r8, %r11
	rolq	$31, %r9
	rolq	$53, %rsi
	xorq	%rdi, %r11
	movq	%rsi, %r10
	xorq	%r11, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r10
	movq	%rsi, 1096(%rsp)
	movq	%r11, 808(%rsp)
	xorq	%r10, %r8
	xorq	%rdi, %r10
	movq	%r11, %rdi
	movq	1096(%rsp), %r11
	movq	%r8, %r9
	addq	%rbx, %rdi
	addq	%r12, %r9
	movq	%r10, %rsi
	movq	%r10, 744(%rsp)
	addq	%r13, %rsi
	leaq	(%rdi,%r9), %r10
	movq	%r8, 776(%rsp)
	addq	%r14, %r11
	movabsq	$-3329063056561552456, %r12
	movabsq	$-6657276164713376882, %r14
	leaq	(%rsi,%r11), %r8
	addq	%r15, %rsi
	movabsq	$-5426079245872290139, %r13
	addq	%r10, %rsi
	addq	%r12, %r11
	addq	%r14, %r9
	leaq	(%r11,%r10), %rbx
	leaq	(%r9,%r8), %r10
	addq	%r13, %rdi
	addq	%r8, %rdi
	rolq	$7, %rsi
	rolq	$19, %rbx
	rolq	$53, %r10
	rolq	$31, %rdi
	movq	%rbx, %r12
	movq	%r10, %r11
	xorq	%rsi, %r12
	xorq	%rdi, %r11
	xorq	%r11, %rbx
	xorq	%r12, %r10
	xorq	%rsi, %r11
	xorq	%rdi, %r12
	movq	%r10, 712(%rsp)
	movq	%r11, 616(%rsp)
	movq	%r12, %r8
	movq	%rbx, %r10
	addq	904(%rsp), %r8
	addq	872(%rsp), %r10
	movq	%r11, %rsi
	movq	712(%rsp), %r11
	addq	840(%rsp), %rsi
	addq	1160(%rsp), %r11
	movq	%rbx, 648(%rsp)
	movabsq	$-3329063056561552456, %rbx
	movq	%r12, 680(%rsp)
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%rbx, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%r8, %r10
	xorq	%rsi, %r11
	movq	%r11, %r12
	movq	%r10, %r13
	xorq	%r11, %r9
	xorq	%r8, %r12
	xorq	%rdi, %r13
	movq	1000(%rsp), %r8
	movq	968(%rsp), %rdi
	movq	%r10, %r14
	movq	936(%rsp), %r11
	movq	%r9, %r10
	addq	1064(%rsp), %r10
	xorq	%rsi, %r14
	addq	%r12, %r8
	movq	%r9, 1192(%rsp)
	addq	%r13, %rdi
	addq	%r14, %r11
	leaq	(%rdi,%r8), %r9
	leaq	(%r10,%r11), %rsi
	addq	%r15, %r11
	leaq	(%r11,%r9), %rbx
	movabsq	$-3329063056561552456, %r11
	addq	%r11, %r10
	movabsq	$-6657276164713376882, %r11
	addq	%r11, %rdi
	addq	%r10, %r9
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %r8
	leaq	(%rdi,%rsi), %r10
	rolq	$19, %r9
	rolq	$7, %rbx
	addq	%rsi, %r8
	movq	%r9, %r11
	rolq	$53, %r10
	xorq	%rbx, %r11
	rolq	$31, %r8
	movq	%r10, %rdi
	movabsq	$853475092736589577, %rsi
	xorq	%r11, %r10
	xorq	%r8, %rdi
	xorq	%r11, %r8
	movabsq	$1906713845121804688, %r11
	addq	%r8, %rsi
	xorq	%rdi, %r9
	movabsq	$-5486504877919021346, %r8
	addq	%r10, %r11
	addq	%r9, %r8
	xorq	%rbx, %rdi
	movabsq	$-4925106476758491821, %r9
	movq	%rsi, 1768(%rsp)
	movq	%r11, %rsi
	addq	%rdi, %r9
	movq	%r8, 1776(%rsp)
	movq	1776(%rsp), %rdi
	addq	%r9, %rsi
	movq	%r9, 1784(%rsp)
	movq	1768(%rsp), %r9
	movq	1768(%rsp), %r8
	addq	1776(%rsp), %r8
	movabsq	$6102157975113963195, %rbx
	movq	%r11, 1792(%rsp)
	addq	%rcx, %r9
	addq	%rsi, %r9
	rolq	$11, %r9
	addq	%rdx, %rdi
	addq	%rbx, %r10
	addq	%rdi, %rsi
	movq	1784(%rsp), %rdi
	movabsq	$4195444129992158507, %rbx
	rolq	$23, %rsi
	movq	%rsi, %r11
	addq	%rax, %rdi
	xorq	%r9, %r11
	addq	%r8, %rdi
	addq	%r10, %r8
	rolq	$59, %r8
	rolq	$37, %rdi
	movq	%r8, %r10
	xorq	%r11, %r8
	xorq	%rdi, %r10
	xorq	%r11, %rdi
	addq	%r13, %r8
	addq	%r14, %rdi
	movq	1192(%rsp), %r14
	xorq	%r10, %rsi
	movq	%r8, 1744(%rsp)
	xorq	%r10, %r9
	movq	%rdi, 1752(%rsp)
	addq	%r12, %r9
	movabsq	$4195444129992158507, %r13
	addq	%rsi, %r14
	movq	%rdi, %rsi
	movq	1744(%rsp), %rdi
	movq	%r9, %r12
	addq	%r14, %rsi
	movq	%r9, %r8
	addq	%rcx, %r12
	addq	1744(%rsp), %r8
	addq	%r14, %rbx
	addq	%rdx, %rdi
	addq	%rsi, %r12
	movq	%r9, 1736(%rsp)
	addq	%rdi, %rsi
	movq	1752(%rsp), %rdi
	rolq	$11, %r12
	rolq	$23, %rsi
	addq	%r8, %rbx
	movq	%rsi, %r11
	addq	%rax, %rdi
	rolq	$59, %rbx
	addq	%r8, %rdi
	movq	%rbx, %r10
	rolq	$37, %rdi
	xorq	%rdi, %r10
	xorq	%r12, %r11
	xorq	%r11, %rbx
	xorq	%r10, %r12
	addq	648(%rsp), %rbx
	addq	680(%rsp), %r12
	xorq	%rdi, %r11
	xorq	%rsi, %r10
	addq	616(%rsp), %r11
	addq	712(%rsp), %r10
	leaq	(%rbx,%rdx), %rdi
	leaq	(%r12,%rcx), %r9
	leaq	(%r12,%rbx), %r8
	leaq	(%r11,%r10), %rsi
	addq	%r10, %r13
	addq	%rsi, %r9
	addq	%rdi, %rsi
	leaq	(%r11,%rax), %rdi
	rolq	$23, %rsi
	rolq	$11, %r9
	addq	%r8, %rdi
	addq	%r13, %r8
	rolq	$59, %r8
	rolq	$37, %rdi
	movq	%r8, %r13
	xorq	%rdi, %r13
	movq	%r13, 1448(%rsp)
	movq	%rsi, %r13
	xorq	1448(%rsp), %rsi
	xorq	%r9, %r13
	xorq	1448(%rsp), %r9
	addq	1096(%rsp), %rsi
	addq	808(%rsp), %r9
	xorq	%r13, %r8
	xorq	%r13, %rdi
	addq	776(%rsp), %r8
	addq	744(%rsp), %rdi
	movabsq	$-6792583489299504353, %r13
	movq	%r14, 1760(%rsp)
	movq	1032(%rsp), %r14
	movq	%rsi, 1696(%rsp)
	movq	%rbx, 1712(%rsp)
	movq	%r9, 1672(%rsp)
	movq	%r10, 1728(%rsp)
	movq	%r8, 1680(%rsp)
	movq	%rdi, 1688(%rsp)
	addq	$1, %r14
	vmovdqa	1672(%rsp), %ymm0
	movq	%r14, %r8
	movq	%r11, 1720(%rsp)
	movq	%r12, 1704(%rsp)
	movabsq	$-369815132508846929, %r12
	movq	%r14, 240(%rsp)
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %r10
	movq	InternalState+24(%rip), %rbx
	xorq	InternalState(%rip), %r8
	movq	InternalState+8(%rip), %r11
	movabsq	$-5426079245872290139, %r14
	vmovdqa	1704(%rsp), %ymm0
	leaq	(%rbx,%r10), %rsi
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rsi,%rcx), %r9
	leaq	(%r8,%r11), %rdi
	vmovdqa	1736(%rsp), %ymm0
	addq	%r9, %r8
	vmovdqa	%ymm0, InternalState+64(%rip)
	rolq	$11, %r8
	addq	%rdx, %r11
	vmovdqa	1768(%rsp), %ymm0
	addq	%rsi, %r11
	leaq	(%r10,%rax), %rsi
	movabsq	$4195444129992158507, %r10
	addq	%rbx, %r10
	rolq	$23, %r11
	movabsq	$-1376848230519552085, %rbx
	addq	%rdi, %r10
	addq	%rdi, %rsi
	movq	%r8, %rdi
	rolq	$59, %r10
	rolq	$37, %rsi
	xorq	%r11, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r10
	vmovdqa	%ymm0, InternalState+96(%rip)
	xorq	%rsi, %r9
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$-9209400399786843361, %r9
	addq	%rbx, %r8
	addq	%r9, %r10
	movabsq	$-3463520432737951897, %r9
	addq	%r12, %rsi
	leaq	(%r8,%r10), %rdi
	addq	%r11, %r9
	addq	%rsi, %r9
	addq	%r13, %r11
	addq	%r15, %rsi
	movabsq	$-6657276164713376882, %rbx
	addq	%rdi, %rsi
	addq	%r14, %r8
	addq	%rbx, %r10
	addq	%r11, %rdi
	addq	%r9, %r8
	rolq	$19, %rdi
	addq	%r10, %r9
	rolq	$7, %rsi
	rolq	$53, %r9
	movq	%rdi, %r11
	rolq	$31, %r8
	xorq	%rsi, %r11
	movq	%r9, %r10
	movq	InternalState+56(%rip), %rbx
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r10, %rdi
	movq	%r11, 1448(%rsp)
	xorq	%rsi, %r10
	movq	InternalState+48(%rip), %r11
	movq	%rdi, 1416(%rsp)
	movabsq	$-3329063056561552456, %r12
	movq	%r10, 1384(%rsp)
	movq	InternalState+32(%rip), %rdi
	movabsq	$-6657276164713376882, %r13
	movq	InternalState+40(%rip), %r10
	movq	%r9, 1224(%rsp)
	leaq	(%rbx,%r11), %rsi
	leaq	(%r10,%rdi), %r9
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r10,%rdx), %rdi
	movabsq	$4195444129992158507, %r10
	addq	%rbx, %r10
	addq	%rsi, %rdi
	leaq	(%r11,%rax), %rsi
	addq	%r9, %r10
	rolq	$23, %rdi
	rolq	$59, %r10
	rolq	$11, %r8
	addq	%r9, %rsi
	movq	%r10, %r11
	movq	%rdi, %r9
	rolq	$37, %rsi
	xorq	%r8, %r9
	xorq	%rsi, %r11
	xorq	%r9, %r10
	xorq	%r9, %rsi
	addq	1416(%rsp), %r10
	addq	1384(%rsp), %rsi
	xorq	%r11, %r8
	xorq	%rdi, %r11
	addq	1448(%rsp), %r8
	addq	1224(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	leaq	(%rsi,%r11), %r9
	addq	%r14, %r8
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%r13, %r10
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %rdi
	rolq	$7, %rsi
	rolq	$31, %r8
	rolq	$19, %rdi
	addq	%r10, %r9
	movq	%rdi, %r11
	rolq	$53, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r9, 1352(%rsp)
	movq	%r11, 1192(%rsp)
	xorq	%r10, %rdi
	movq	InternalState+80(%rip), %r11
	xorq	%rsi, %r10
	movq	InternalState+88(%rip), %rbx
	movq	%rdi, 1128(%rsp)
	movq	%r10, 1096(%rsp)
	movq	InternalState+64(%rip), %rdi
	movq	InternalState+72(%rip), %r10
	leaq	(%rbx,%r11), %rsi
	leaq	(%r10,%rdi), %r9
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r10,%rdx), %rdi
	movabsq	$4195444129992158507, %r10
	addq	%rbx, %r10
	addq	%rsi, %rdi
	leaq	(%r11,%rax), %rsi
	addq	%r9, %r10
	rolq	$23, %rdi
	rolq	$59, %r10
	rolq	$11, %r8
	addq	%r9, %rsi
	movq	%r10, %r11
	movq	%rdi, %r9
	rolq	$37, %rsi
	xorq	%r8, %r9
	xorq	%rsi, %r11
	xorq	%r9, %r10
	addq	1128(%rsp), %r10
	xorq	%r11, %r8
	addq	1192(%rsp), %r8
	xorq	%r9, %rsi
	xorq	%rdi, %r11
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	rolq	$7, %rsi
	rolq	$19, %rdi
	addq	%r14, %r8
	addq	%r13, %r10
	addq	%r9, %r8
	movq	%rdi, %r11
	addq	%r10, %r9
	rolq	$31, %r8
	xorq	%rsi, %r11
	rolq	$53, %r9
	movq	%r11, %r14
	movq	%r11, %rbx
	movq	%r9, %r10
	movq	InternalState+112(%rip), %r11
	xorq	%r9, %r14
	xorq	%r8, %r10
	xorq	%r8, %rbx
	movq	%r10, %r12
	movq	%r10, %r13
	movq	InternalState+104(%rip), %r10
	xorq	%rdi, %r12
	xorq	%rsi, %r13
	movq	InternalState+96(%rip), %rdi
	movq	InternalState+120(%rip), %rsi
	leaq	(%r10,%rdi), %r9
	addq	%rcx, %rdi
	addq	%r11, %rsi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r10,%rdx), %rdi
	movabsq	$4195444129992158507, %r10
	addq	InternalState+120(%rip), %r10
	addq	%rsi, %rdi
	leaq	(%r11,%rax), %rsi
	rolq	$11, %r8
	rolq	$23, %rdi
	addq	%r9, %rsi
	addq	%r10, %r9
	rolq	$37, %rsi
	movq	%rdi, %r10
	rolq	$59, %r9
	xorq	%r8, %r10
	movq	%r9, %r11
	xorq	%r10, %r9
	xorq	%rsi, %r11
	xorq	%r10, %rsi
	addq	%r12, %r9
	xorq	%r11, %r8
	xorq	%rdi, %r11
	addq	%r13, %rsi
	addq	%r14, %r11
	addq	%rbx, %r8
	movq	%r11, %rdi
	movq	%r11, 1160(%rsp)
	movabsq	$-3329063056561552456, %r11
	addq	%rsi, %rdi
	addq	%r15, %rsi
	addq	1160(%rsp), %r11
	leaq	(%r9,%r8), %r10
	addq	%r10, %rsi
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	rolq	$7, %rsi
	addq	%r10, %r8
	movabsq	$-6657276164713376882, %r10
	rolq	$19, %r11
	addq	%r10, %r9
	addq	%rdi, %r8
	leaq	(%r9,%rdi), %r10
	movq	%r11, %r9
	rolq	$31, %r8
	xorq	%rsi, %r9
	rolq	$53, %r10
	movq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r8, %rdi
	xorq	%r9, %r8
	movabsq	$-7999569951748836447, %r9
	addq	%r9, %r8
	xorq	%rdi, %r11
	movabsq	$-4849728007900573903, %r9
	addq	%r9, %r11
	xorq	%rdi, %rsi
	movabsq	$-1642314245251606934, %r9
	movabsq	$-1568322642145848418, %rdi
	addq	%r10, %r9
	addq	%rdi, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rsi, %r9
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$2553129884740551573, %r11
	addq	%r11, %r10
	addq	%rdi, %rsi
	rolq	$11, %r8
	addq	%r10, %rdi
	rolq	$37, %rsi
	rolq	$23, %r9
	rolq	$59, %rdi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 968(%rsp)
	movq	%rdi, %r11
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	%r12, %r11
	addq	%r13, %rsi
	addq	%r14, %r10
	movq	%r8, 1064(%rsp)
	addq	%rbx, %r8
	movabsq	$4195444129992158507, %r12
	movq	%r9, 1160(%rsp)
	movq	%rdi, 1000(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%r12, %r10
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%rdi, %rsi
	addq	%r11, %r9
	addq	%r10, %rdi
	rolq	$23, %r9
	rolq	$37, %rsi
	rolq	$59, %rdi
	rolq	$11, %r8
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 936(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r9, %r8
	addq	%r11, %r9
	addq	%r12, %r10
	rolq	$23, %r9
	addq	%rax, %rsi
	rolq	$11, %r8
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	xorq	%r8, %r10
	rolq	$59, %rdi
	rolq	$37, %rsi
	movq	%rdi, %r11
	movq	%r10, %r13
	movq	%r9, %r14
	xorq	%rsi, %r11
	xorq	%rsi, %r13
	movq	%r8, %rbx
	movq	1384(%rsp), %rsi
	movq	1224(%rsp), %r9
	xorq	%r11, %r14
	xorq	%r11, %rbx
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%r13, %rsi
	addq	%r14, %r9
	leaq	(%r9,%rsi), %r10
	addq	%rbx, %r8
	addq	%r12, %r11
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rax, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	addq	%rdi, %rsi
	rolq	$11, %r8
	rolq	$37, %rsi
	movq	%r11, %rdi
	rolq	$59, %r10
	movq	%r10, %r9
	xorq	%rsi, %r9
	xorq	%r8, %rdi
	xorq	%r9, %r11
	xorq	%r9, %r8
	xorq	%rdi, %r10
	movq	%r11, 1448(%rsp)
	movabsq	$8467826889434979867, %r9
	movabsq	$-2292595471992902602, %r11
	addq	%r11, %r8
	addq	%r9, %r10
	xorq	%rdi, %rsi
	movabsq	$-5006043190370284386, %r11
	movabsq	$6028102484886760763, %r9
	addq	1448(%rsp), %r9
	addq	%r11, %rsi
	movabsq	$2699039428325208307, %r11
	addq	1448(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$7, %rsi
	addq	%r11, %r10
	addq	%r9, %r8
	rolq	$19, %rdi
	addq	%r10, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	rolq	$53, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1448(%rsp)
	movq	%r11, %r8
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r9, %r11
	movq	%r10, 1384(%rsp)
	movq	1384(%rsp), %rsi
	movq	%rdi, %r10
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r14, %r11
	movq	%r9, 1224(%rsp)
	movq	%rdi, 1416(%rsp)
	movabsq	$-3329063056561552456, %r12
	addq	%r13, %rsi
	leaq	(%r8,%r10), %rdi
	movabsq	$-5426079245872290139, %r13
	leaq	(%rsi,%r11), %r9
	movabsq	$-6657276164713376882, %r14
	addq	%r15, %rsi
	addq	%r12, %r11
	addq	%r14, %r10
	addq	%r13, %r8
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %rdi
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$7, %rsi
	rolq	$53, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r11, 1192(%rsp)
	movq	%r10, 1096(%rsp)
	movq	%r11, %r8
	movq	%rdi, %r10
	addq	904(%rsp), %r8
	addq	872(%rsp), %r10
	movq	%r9, %r11
	movq	1096(%rsp), %rsi
	addq	936(%rsp), %r11
	addq	840(%rsp), %rsi
	movq	%r9, 1352(%rsp)
	movq	%rdi, 1128(%rsp)
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$7, %rsi
	rolq	$19, %rdi
	rolq	$31, %r8
	rolq	$53, %r9
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	movq	%r10, %r12
	movq	%r11, %r14
	movq	%r11, %rbx
	xorq	%rdi, %r12
	movq	1160(%rsp), %rdi
	xorq	%r9, %r14
	xorq	%r8, %rbx
	movq	1000(%rsp), %r9
	movq	1064(%rsp), %r8
	movq	%r10, %r13
	movabsq	$-3329063056561552456, %r11
	xorq	%rsi, %r13
	addq	%r14, %rdi
	movq	968(%rsp), %rsi
	movq	%rdi, 1160(%rsp)
	addq	1160(%rsp), %r11
	addq	%rbx, %r8
	addq	%r12, %r9
	leaq	(%r9,%r8), %r10
	addq	%r13, %rsi
	addq	%rsi, %rdi
	addq	%r15, %rsi
	addq	%r10, %rsi
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %r8
	movabsq	$-6657276164713376882, %r10
	rolq	$19, %r11
	addq	%r10, %r9
	rolq	$7, %rsi
	addq	%rdi, %r8
	leaq	(%r9,%rdi), %r10
	movq	%r11, %r9
	rolq	$31, %r8
	xorq	%rsi, %r9
	rolq	$53, %r10
	movq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r8, %rdi
	xorq	%r9, %r8
	movabsq	$5953845371152580681, %r9
	addq	%r9, %r8
	xorq	%rdi, %r11
	movabsq	$-7646712092252898442, %r9
	addq	%r9, %r11
	xorq	%rdi, %rsi
	movabsq	$-7946738593435294165, %r9
	movabsq	$-2842268575306187841, %rdi
	addq	%r10, %r9
	addq	%rdi, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rsi, %r9
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$-3751294463443135658, %r11
	addq	%r11, %r10
	addq	%rax, %rsi
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	rolq	$11, %r8
	rolq	$59, %rdi
	rolq	$37, %rsi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 968(%rsp)
	movq	%rdi, %r11
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	%r12, %r11
	addq	%r13, %rsi
	addq	%r14, %r10
	movq	%r8, 1064(%rsp)
	addq	%rbx, %r8
	movq	%r9, 1160(%rsp)
	movq	%rdi, 1000(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%rax, %rsi
	addq	%rdx, %r11
	addq	%rcx, %r8
	movabsq	$4195444129992158507, %r12
	addq	%r9, %r8
	addq	%rdi, %rsi
	addq	%r11, %r9
	addq	%r12, %r10
	rolq	$37, %rsi
	rolq	$11, %r8
	rolq	$23, %r9
	addq	%r10, %rdi
	rolq	$59, %rdi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 936(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	addq	%r12, %r10
	addq	%rax, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	rolq	$11, %r8
	rolq	$59, %rdi
	movq	%r9, %r10
	xorq	%r8, %r10
	rolq	$37, %rsi
	movq	%rdi, %r11
	xorq	%rsi, %r11
	movq	%r9, %r14
	movq	%r8, %rbx
	movq	%r10, %r13
	xorq	%r11, %rbx
	xorq	%r11, %r14
	xorq	%rsi, %r13
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	1384(%rsp), %rsi
	movq	1224(%rsp), %r9
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%rbx, %r8
	addq	%r12, %r11
	addq	%r13, %rsi
	addq	%r14, %r9
	leaq	(%r11,%r8), %rdi
	leaq	(%r9,%rsi), %r10
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%rax, %rsi
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rdi, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	rolq	$37, %rsi
	rolq	$11, %r8
	movq	%r11, %rdi
	rolq	$59, %r10
	xorq	%r8, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$-1914029582460860148, %r9
	movq	%r11, 1448(%rsp)
	movabsq	$-824919486193887165, %r11
	addq	%r9, %r10
	addq	%r11, %r8
	movabsq	$-7632797540959622777, %r9
	movabsq	$6609752215332129920, %r11
	addq	1448(%rsp), %r9
	addq	%r11, %rsi
	movabsq	$7484883476188376383, %r11
	addq	1448(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$7, %rsi
	addq	%r11, %r10
	addq	%r9, %r8
	rolq	$19, %rdi
	rolq	$31, %r8
	addq	%r10, %r9
	movq	%rdi, %r11
	rolq	$53, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1352(%rsp)
	movq	%r11, %r8
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r9, %r11
	movq	%r10, 1128(%rsp)
	movq	1128(%rsp), %rsi
	movq	%rdi, %r10
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r14, %r11
	movabsq	$-3329063056561552456, %r12
	movabsq	$-6657276164713376882, %r14
	movq	%r9, 1384(%rsp)
	addq	%r13, %rsi
	movq	%rdi, 1192(%rsp)
	movabsq	$-5426079245872290139, %r13
	leaq	(%r8,%r10), %rdi
	leaq	(%rsi,%r11), %r9
	addq	%r14, %r10
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%r13, %r8
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %rdi
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$7, %rsi
	rolq	$53, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r11, 1448(%rsp)
	movq	%r10, 1096(%rsp)
	movq	%r11, %r8
	movq	%rdi, %r10
	addq	904(%rsp), %r8
	addq	872(%rsp), %r10
	movq	%r9, %r11
	movq	1096(%rsp), %rsi
	addq	840(%rsp), %rsi
	addq	936(%rsp), %r11
	movq	%r9, 1224(%rsp)
	movq	%rdi, 1416(%rsp)
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$31, %r8
	rolq	$7, %rsi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	movq	%r10, %r12
	movq	%r11, %r14
	movq	%r11, %rbx
	xorq	%rdi, %r12
	movq	1160(%rsp), %rdi
	xorq	%r9, %r14
	xorq	%r8, %rbx
	movq	1000(%rsp), %r9
	movq	1064(%rsp), %r8
	movq	%r10, %r13
	movabsq	$-3329063056561552456, %r11
	xorq	%rsi, %r13
	addq	%r14, %rdi
	movq	968(%rsp), %rsi
	movq	%rdi, 1160(%rsp)
	addq	1160(%rsp), %r11
	addq	%rbx, %r8
	addq	%r12, %r9
	leaq	(%r9,%r8), %r10
	addq	%r13, %rsi
	addq	%rsi, %rdi
	addq	%r15, %rsi
	addq	%r10, %rsi
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %r8
	movabsq	$-6657276164713376882, %r10
	rolq	$7, %rsi
	addq	%rdi, %r8
	rolq	$19, %r11
	rolq	$31, %r8
	addq	%r10, %r9
	leaq	(%r9,%rdi), %r10
	movq	%r11, %r9
	xorq	%rsi, %r9
	rolq	$53, %r10
	movq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r8, %rdi
	xorq	%r9, %r8
	movabsq	$-1139829817207230181, %r9
	addq	%r9, %r8
	xorq	%rdi, %r11
	movabsq	$3054837738180890943, %r9
	addq	%r9, %r11
	xorq	%rdi, %rsi
	movabsq	$-938319195649413462, %r9
	movabsq	$2588290990126348949, %rdi
	addq	%r10, %r9
	addq	%rdi, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rsi, %r9
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$3257124934342745045, %r11
	addq	%r11, %r10
	rolq	$23, %r9
	rolq	$11, %r8
	addq	%rdi, %rsi
	movq	%r9, %r11
	addq	%r10, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r11
	rolq	$59, %rdi
	movq	%rdi, %r10
	xorq	%r11, %rdi
	xorq	%rsi, %r11
	xorq	%rsi, %r10
	movq	%r11, 936(%rsp)
	movq	936(%rsp), %rsi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	addq	%r12, %r11
	movq	%r8, 1000(%rsp)
	addq	%rbx, %r8
	addq	%r13, %rsi
	addq	%r14, %r10
	movabsq	$4195444129992158507, %r12
	movq	%r9, 1064(%rsp)
	movq	%rdi, 968(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%r12, %r10
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%rdi, %rsi
	addq	%r11, %r9
	addq	%r10, %rdi
	rolq	$23, %r9
	rolq	$37, %rsi
	rolq	$59, %rdi
	rolq	$11, %r8
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	movabsq	$-6097248013946911484, %r13
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 808(%rsp)
	movq	%r8, 872(%rsp)
	movq	%rdi, %r11
	addq	1448(%rsp), %r8
	addq	1416(%rsp), %r11
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1224(%rsp), %r10
	movabsq	$3174302594670681997, %r14
	movq	%r9, 904(%rsp)
	movq	%rdi, 840(%rsp)
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	leaq	(%rsi,%r10), %r9
	addq	%rax, %rsi
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$37, %rsi
	rolq	$11, %r8
	rolq	$23, %r9
	addq	%r12, %r10
	addq	%r10, %rdi
	movq	%r9, %r10
	movq	%r8, %rbx
	rolq	$59, %rdi
	xorq	%r8, %r10
	movq	%rdi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%rsi, %r11
	movq	%r10, %rsi
	xorq	%r11, %r9
	xorq	%r11, %rbx
	movq	%rdi, %r11
	movq	%r9, 1224(%rsp)
	addq	1192(%rsp), %r11
	addq	1128(%rsp), %rsi
	addq	1384(%rsp), %r9
	movq	1352(%rsp), %r8
	movq	%rdi, 1448(%rsp)
	movq	%r10, 1416(%rsp)
	addq	%rbx, %r8
	leaq	(%r9,%rsi), %r10
	addq	%r12, %r9
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r10, %r8
	addq	%r10, %r11
	addq	%rax, %rsi
	leaq	(%r9,%rdi), %r10
	rolq	$23, %r11
	addq	%rdi, %rsi
	rolq	$11, %r8
	rolq	$37, %rsi
	movq	%r11, %rdi
	rolq	$59, %r10
	xorq	%r8, %rdi
	movabsq	$6378106504303230091, %r12
	movq	%r10, %r9
	xorq	%rdi, %r10
	xorq	%rsi, %r9
	addq	%r14, %r10
	xorq	%rdi, %rsi
	xorq	%r9, %r8
	xorq	%r9, %r11
	movabsq	$-496885038275669880, %rdi
	addq	%r13, %r8
	movabsq	$-8739574512844769069, %r9
	addq	%rdi, %rsi
	addq	%r11, %r9
	leaq	(%r8,%r10), %rdi
	addq	%r12, %r11
	addq	%rsi, %r9
	movabsq	$-5426079245872290139, %r13
	addq	%r15, %rsi
	movabsq	$-6657276164713376882, %r14
	addq	%rdi, %rsi
	addq	%r13, %r8
	addq	%r14, %r10
	addq	%r11, %rdi
	addq	%r9, %r8
	rolq	$19, %rdi
	addq	%r10, %r9
	rolq	$7, %rsi
	rolq	$53, %r9
	movq	%rdi, %r11
	rolq	$31, %r8
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r8, %r10
	xorq	%r11, %r9
	movq	%r11, %r12
	movq	%r9, 1160(%rsp)
	movq	%r9, preCompInternalState(%rip)
	movq	%r10, %r14
	movq	1448(%rsp), %r9
	xorq	%r8, %r12
	xorq	%rsi, %r14
	movq	%r10, %r13
	movq	1416(%rsp), %rsi
	movq	1160(%rsp), %r11
	addq	1224(%rsp), %r11
	xorq	%rdi, %r13
	leaq	(%r12,%rbx), %rdi
	addq	%r13, %r9
	movabsq	$-3329063056561552456, %rbx
	movq	%r12, preCompInternalState+8(%rip)
	leaq	(%rdi,%r9), %r10
	addq	%r14, %rsi
	movq	%r13, preCompInternalState+16(%rip)
	movq	%r14, preCompInternalState+24(%rip)
	leaq	(%rsi,%r11), %r8
	addq	%r15, %rsi
	addq	%rbx, %r11
	movabsq	$-6657276164713376882, %rbx
	addq	%r10, %rsi
	addq	%r10, %r11
	addq	%rbx, %r9
	movabsq	$-5426079245872290139, %r10
	rolq	$7, %rsi
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	rolq	$19, %r11
	addq	%r8, %rdi
	movq	%r11, %r8
	movabsq	$-3329063056561552456, %rbx
	rolq	$31, %rdi
	rolq	$53, %r10
	xorq	%rsi, %r8
	movq	%r10, %r9
	xorq	%r8, %r10
	xorq	%rdi, %r8
	xorq	%rdi, %r9
	movq	%r8, %rdi
	addq	872(%rsp), %rdi
	xorq	%r9, %r11
	xorq	%rsi, %r9
	movq	%r10, 1352(%rsp)
	movq	%r9, 1096(%rsp)
	movq	%r11, %r9
	addq	840(%rsp), %r9
	movq	%r11, 1128(%rsp)
	movq	1096(%rsp), %rsi
	movq	%r10, %r11
	addq	808(%rsp), %rsi
	addq	904(%rsp), %r11
	movq	%r8, 1192(%rsp)
	leaq	(%rdi,%r9), %r10
	leaq	(%rsi,%r11), %r8
	addq	%r15, %rsi
	addq	%rbx, %r11
	movabsq	$-6657276164713376882, %rbx
	addq	%r10, %rsi
	addq	%r10, %r11
	addq	%rbx, %r9
	movabsq	$-5426079245872290139, %r10
	rolq	$19, %r11
	addq	%r10, %rdi
	addq	%r8, %r9
	rolq	$7, %rsi
	addq	%r8, %rdi
	rolq	$53, %r9
	movq	%r11, %r8
	rolq	$31, %rdi
	movq	%r9, %r10
	xorq	%rsi, %r8
	xorq	%rdi, %r10
	xorq	%r8, %r9
	xorq	%rdi, %r8
	xorq	%r10, %r11
	movq	%r8, 1448(%rsp)
	xorq	%rsi, %r10
	movq	%r8, %rdi
	movq	%r11, %r8
	addq	1000(%rsp), %rdi
	addq	968(%rsp), %r8
	movq	%r11, 1416(%rsp)
	movq	%r10, %r11
	movq	%r10, 1384(%rsp)
	addq	936(%rsp), %r11
	movq	%r9, %r10
	addq	1064(%rsp), %r10
	movq	%r9, 1224(%rsp)
	leaq	(%r8,%rdi), %r9
	leaq	(%r10,%r11), %rsi
	addq	%r15, %r11
	leaq	(%r11,%r9), %rbx
	movabsq	$-3329063056561552456, %r11
	addq	%r11, %r10
	leaq	(%r10,%r9), %r11
	movabsq	$-6657276164713376882, %r10
	movabsq	$-5426079245872290139, %r9
	addq	%r10, %r8
	addq	%r9, %rdi
	rolq	$7, %rbx
	leaq	(%r8,%rsi), %r10
	addq	%rsi, %rdi
	rolq	$19, %r11
	rolq	$31, %rdi
	movq	%r11, %r8
	movabsq	$-5486504877919021346, %r9
	rolq	$53, %r10
	xorq	%rbx, %r8
	movq	%r10, %rsi
	xorq	%r8, %r10
	xorq	%rdi, %r8
	xorq	%rdi, %rsi
	movabsq	$853475092736589577, %rdi
	xorq	%rsi, %r11
	xorq	%rbx, %rsi
	movabsq	$-4925106476758491821, %rbx
	addq	%r9, %r11
	movabsq	$1906713845121804688, %r9
	addq	%rbx, %rsi
	addq	%rdi, %r8
	addq	%r10, %r9
	movabsq	$4195444129992158507, %rbx
	leaq	(%r8,%r11), %rdi
	movq	%r8, InternalState+96(%rip)
	movq	%r11, InternalState+104(%rip)
	addq	%rcx, %r8
	addq	%rdx, %r11
	movq	%r9, InternalState+120(%rip)
	addq	%rsi, %r9
	movq	%rsi, InternalState+112(%rip)
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$6102157975113963195, %r11
	addq	%r11, %r10
	addq	%rdi, %rsi
	rolq	$23, %r9
	addq	%r10, %rdi
	rolq	$37, %rsi
	rolq	$11, %r8
	rolq	$59, %rdi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r10, %rsi
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r9, preCompInternalState+96(%rip)
	movq	%r8, preCompInternalState+104(%rip)
	xorq	%r10, %rdi
	addq	1448(%rsp), %r8
	addq	1224(%rsp), %r9
	movq	%rsi, preCompInternalState+120(%rip)
	movq	1416(%rsp), %r11
	addq	1384(%rsp), %rsi
	movq	%rdi, preCompInternalState+112(%rip)
	addq	%rdi, %r11
	movq	%r8, InternalState+64(%rip)
	movq	%r9, InternalState+88(%rip)
	leaq	(%r8,%r11), %rdi
	movq	%r11, InternalState+72(%rip)
	addq	%rcx, %r8
	leaq	(%rsi,%r9), %r10
	addq	%rdx, %r11
	addq	%rbx, %r9
	movq	%rsi, InternalState+80(%rip)
	addq	%rax, %rsi
	addq	%r10, %r8
	addq	%rdi, %rsi
	addq	%r11, %r10
	addq	%r9, %rdi
	rolq	$23, %r10
	rolq	$11, %r8
	rolq	$59, %rdi
	rolq	$37, %rsi
	movq	%r10, %r9
	movq	%rdi, %r11
	xorq	%r8, %r9
	xorq	%rsi, %r11
	xorq	%r9, %rsi
	xorq	%r9, %rdi
	xorq	%r11, %r10
	xorq	%r11, %r8
	movq	%rsi, preCompInternalState+88(%rip)
	movq	%r10, preCompInternalState+64(%rip)
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, preCompInternalState+72(%rip)
	movq	1128(%rsp), %r11
	addq	1192(%rsp), %r8
	movq	%rdi, preCompInternalState+80(%rip)
	movq	%rsi, InternalState+48(%rip)
	addq	%rdi, %r11
	leaq	(%rsi,%r10), %r9
	movq	%r10, InternalState+56(%rip)
	leaq	(%r8,%r11), %rdi
	movq	%r8, InternalState+32(%rip)
	addq	%rcx, %r8
	addq	%r9, %r8
	movq	%r11, InternalState+40(%rip)
	rolq	$11, %r8
	addq	%rbx, %r10
	addq	%rax, %rsi
	addq	%rdi, %rsi
	addq	%r10, %rdi
	addq	%rdx, %r11
	rolq	$59, %rdi
	addq	%r11, %r9
	rolq	$37, %rsi
	movq	%rdi, %r11
	rolq	$23, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r10
	xorq	%r11, %r8
	movq	%r9, preCompInternalState+32(%rip)
	addq	1160(%rsp), %r9
	xorq	%r10, %rdi
	xorq	%r10, %rsi
	movq	%r8, preCompInternalState+40(%rip)
	movq	%rdi, preCompInternalState+48(%rip)
	addq	%r12, %r8
	addq	%r13, %rdi
	movq	%rsi, preCompInternalState+56(%rip)
	addq	%r14, %rsi
	movq	%r8, InternalState(%rip)
	movq	%rdi, InternalState+8(%rip)
	movq	%rsi, InternalState+16(%rip)
	movq	%r9, InternalState+24(%rip)
	movabsq	$-9209400399786843361, %r12
	movq	16(%rbp), %rsi
	movq	192(%rsp), %rdi
	movabsq	$-369815132508846929, %r13
	movabsq	$-6792583489299504353, %r14
	xorq	(%rsi), %r8
	movq	%r8, InternalState(%rip)
	movq	%r8, (%rdi)
	movq	%rsi, %r8
	movq	8(%rsi), %rsi
	xorq	InternalState+8(%rip), %rsi
	movq	%rsi, InternalState+8(%rip)
	movq	%rsi, 8(%rdi)
	movq	16(%r8), %rsi
	xorq	InternalState+16(%rip), %rsi
	movq	%rsi, InternalState+16(%rip)
	movq	%rsi, 16(%rdi)
	movq	24(%r8), %rsi
	xorq	InternalState+24(%rip), %rsi
	movq	%rsi, InternalState+24(%rip)
	movq	%rsi, 24(%rdi)
	movq	32(%r8), %rsi
	xorq	InternalState+64(%rip), %rsi
	movq	%rsi, InternalState+64(%rip)
	movq	%rsi, 32(%rdi)
	movq	40(%r8), %rsi
	xorq	InternalState+72(%rip), %rsi
	movq	%rsi, InternalState+72(%rip)
	movq	%rsi, 40(%rdi)
	movq	48(%r8), %rsi
	xorq	InternalState+80(%rip), %rsi
	movq	%rsi, InternalState+80(%rip)
	movq	%rsi, 48(%rdi)
	movq	56(%r8), %rsi
	xorq	InternalState+88(%rip), %rsi
	movq	%rsi, InternalState+88(%rip)
	movq	%rsi, 56(%rdi)
	movq	InternalState+16(%rip), %r9
	movq	InternalState+24(%rip), %r10
	movq	InternalState(%rip), %r8
	movq	InternalState+8(%rip), %r11
	leaq	(%r10,%r9), %rsi
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%rsi, %r8
	addq	%rsi, %r11
	leaq	(%r9,%rax), %rsi
	rolq	$11, %r8
	rolq	$23, %r11
	addq	%rbx, %r10
	addq	%rdi, %r10
	addq	%rdi, %rsi
	movq	%r11, %rdi
	rolq	$59, %r10
	rolq	$37, %rsi
	xorq	%r8, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r10
	movabsq	$-5426079245872290139, %rbx
	xorq	%rsi, %r9
	addq	%r12, %r10
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$-1376848230519552085, %r9
	addq	%r9, %r8
	movabsq	$-3463520432737951897, %r9
	addq	%r13, %rsi
	leaq	(%r8,%r10), %rdi
	addq	%r11, %r9
	addq	%r14, %r11
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rbx, %r8
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movabsq	$-6657276164713376882, %r11
	addq	%r11, %r10
	addq	%r9, %r8
	rolq	$19, %rdi
	addq	%r10, %r9
	rolq	$7, %rsi
	movq	%rdi, %r11
	rolq	$53, %r9
	rolq	$31, %r8
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r9, 1224(%rsp)
	movq	InternalState+56(%rip), %rbx
	xorq	%r10, %rdi
	movq	%r11, 1448(%rsp)
	xorq	%rsi, %r10
	movq	InternalState+48(%rip), %r11
	movq	%rdi, 1416(%rsp)
	movabsq	$-3329063056561552456, %r12
	movq	%r10, 1384(%rsp)
	movq	InternalState+32(%rip), %rdi
	movabsq	$-5426079245872290139, %r13
	movq	InternalState+40(%rip), %r10
	movabsq	$-6657276164713376882, %r14
	leaq	(%rbx,%r11), %rsi
	leaq	(%r10,%rdi), %r9
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r10,%rdx), %rdi
	movabsq	$4195444129992158507, %r10
	addq	%rbx, %r10
	movq	InternalState+88(%rip), %rbx
	addq	%rsi, %rdi
	leaq	(%r11,%rax), %rsi
	addq	%r9, %r10
	rolq	$23, %rdi
	rolq	$59, %r10
	rolq	$11, %r8
	addq	%r9, %rsi
	movq	%r10, %r11
	movq	%rdi, %r9
	rolq	$37, %rsi
	xorq	%r8, %r9
	xorq	%rsi, %r11
	xorq	%r9, %r10
	addq	1416(%rsp), %r10
	xorq	%r11, %r8
	addq	1448(%rsp), %r8
	xorq	%r9, %rsi
	xorq	%rdi, %r11
	addq	1384(%rsp), %rsi
	addq	1224(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	rolq	$19, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$7, %rsi
	rolq	$53, %r9
	movq	%rdi, %r11
	rolq	$31, %r8
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r11, %r9
	xorq	%r8, %r10
	xorq	%r8, %r11
	xorq	%r10, %rdi
	movq	%r11, 1192(%rsp)
	xorq	%rsi, %r10
	movq	InternalState+80(%rip), %r11
	movq	%rdi, 1128(%rsp)
	movq	%r10, 1096(%rsp)
	movq	InternalState+64(%rip), %rdi
	movq	InternalState+72(%rip), %r10
	movq	%r9, 1352(%rsp)
	leaq	(%rbx,%r11), %rsi
	leaq	(%r10,%rdi), %r9
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r10,%rdx), %rdi
	movabsq	$4195444129992158507, %r10
	addq	%rbx, %r10
	addq	%rsi, %rdi
	leaq	(%r11,%rax), %rsi
	addq	%r9, %r10
	rolq	$23, %rdi
	rolq	$59, %r10
	rolq	$11, %r8
	addq	%r9, %rsi
	movq	%r10, %r11
	movq	%rdi, %r9
	rolq	$37, %rsi
	xorq	%r8, %r9
	xorq	%rsi, %r11
	xorq	%r9, %r10
	xorq	%r9, %rsi
	addq	1128(%rsp), %r10
	addq	1096(%rsp), %rsi
	xorq	%r11, %r8
	xorq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1352(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	leaq	(%rsi,%r11), %r9
	addq	%r13, %r8
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %rdi
	rolq	$7, %rsi
	rolq	$19, %rdi
	rolq	$31, %r8
	addq	%r14, %r10
	movq	%rdi, %r11
	addq	%r10, %r9
	xorq	%rsi, %r11
	rolq	$53, %r9
	movq	%r11, %r14
	movq	%r11, %rbx
	movq	%r9, %r10
	movq	InternalState+112(%rip), %r11
	xorq	%r9, %r14
	xorq	%r8, %r10
	xorq	%r8, %rbx
	movq	%r10, %r12
	movq	%r10, %r13
	movq	InternalState+104(%rip), %r10
	xorq	%rdi, %r12
	xorq	%rsi, %r13
	movq	InternalState+96(%rip), %rdi
	movq	InternalState+120(%rip), %rsi
	leaq	(%r10,%rdi), %r9
	addq	%rcx, %rdi
	addq	%r11, %rsi
	leaq	(%rsi,%rdi), %r8
	leaq	(%r10,%rdx), %rdi
	movabsq	$4195444129992158507, %r10
	addq	InternalState+120(%rip), %r10
	addq	%rsi, %rdi
	leaq	(%r11,%rax), %rsi
	rolq	$11, %r8
	rolq	$23, %rdi
	addq	%r9, %rsi
	addq	%r10, %r9
	rolq	$37, %rsi
	movq	%rdi, %r10
	rolq	$59, %r9
	xorq	%r8, %r10
	movq	%r9, %r11
	xorq	%r10, %r9
	xorq	%rsi, %r11
	addq	%r12, %r9
	xorq	%r10, %rsi
	xorq	%r11, %r8
	xorq	%rdi, %r11
	addq	%r13, %rsi
	addq	%r14, %r11
	addq	%rbx, %r8
	leaq	(%r9,%r8), %r10
	movq	%r11, %rdi
	movq	%r11, 1160(%rsp)
	addq	%rsi, %rdi
	addq	%r15, %rsi
	movabsq	$-3329063056561552456, %r11
	addq	%r10, %rsi
	rolq	$7, %rsi
	addq	1160(%rsp), %r11
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %r8
	movabsq	$-6657276164713376882, %r10
	rolq	$19, %r11
	addq	%r10, %r9
	addq	%rdi, %r8
	leaq	(%r9,%rdi), %r10
	movq	%r11, %r9
	rolq	$31, %r8
	xorq	%rsi, %r9
	rolq	$53, %r10
	movq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r8, %rdi
	xorq	%r9, %r8
	movabsq	$-7999569951748836447, %r9
	addq	%r9, %r8
	xorq	%rdi, %r11
	movabsq	$-4849728007900573903, %r9
	addq	%r9, %r11
	xorq	%rdi, %rsi
	movabsq	$-1642314245251606934, %r9
	movabsq	$-1568322642145848418, %rdi
	addq	%r10, %r9
	addq	%rdi, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rsi, %r9
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$2553129884740551573, %r11
	addq	%r11, %r10
	addq	%rdi, %rsi
	rolq	$23, %r9
	addq	%r10, %rdi
	rolq	$37, %rsi
	rolq	$11, %r8
	rolq	$59, %rdi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r10, %rdi
	xorq	%r11, %r9
	xorq	%r11, %r8
	xorq	%rsi, %r10
	movq	%r9, 1160(%rsp)
	movq	%r8, 1064(%rsp)
	movq	%rdi, 1000(%rsp)
	movq	%rdi, %r11
	movq	%r10, 968(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	%rbx, %r8
	addq	%r12, %r11
	addq	%r13, %rsi
	addq	%r14, %r10
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	movabsq	$4195444129992158507, %r12
	addq	%rdx, %r11
	addq	%r12, %r10
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	rolq	$23, %r9
	rolq	$59, %rdi
	rolq	$37, %rsi
	rolq	$11, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r8
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 936(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%rcx, %r8
	addq	%r9, %r8
	rolq	$11, %r8
	addq	%rdx, %r11
	addq	%r12, %r10
	addq	%r11, %r9
	addq	%rax, %rsi
	movq	%r8, %rbx
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$59, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r10
	movq	%rdi, %r11
	movq	%r9, %r14
	movq	%r10, %r13
	xorq	%rsi, %r11
	movq	1224(%rsp), %r9
	xorq	%rsi, %r13
	movq	1384(%rsp), %rsi
	xorq	%r11, %r14
	xorq	%r11, %rbx
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	%r10, %r12
	addq	%r14, %r9
	xorq	%rdi, %r12
	addq	%r13, %rsi
	leaq	(%r9,%rsi), %r10
	addq	%rbx, %r8
	addq	%r12, %r11
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rax, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	addq	%rdi, %rsi
	rolq	$11, %r8
	rolq	$37, %rsi
	movq	%r11, %rdi
	rolq	$59, %r10
	xorq	%r8, %rdi
	movq	%r10, %r9
	xorq	%rsi, %r9
	xorq	%r9, %r11
	xorq	%r9, %r8
	xorq	%rdi, %r10
	movq	%r11, 1448(%rsp)
	movabsq	$8467826889434979867, %r9
	movabsq	$-2292595471992902602, %r11
	addq	%r11, %r8
	addq	%r9, %r10
	xorq	%rdi, %rsi
	movabsq	$-5006043190370284386, %r11
	movabsq	$6028102484886760763, %r9
	addq	1448(%rsp), %r9
	addq	%r11, %rsi
	movabsq	$2699039428325208307, %r11
	addq	1448(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$19, %rdi
	addq	%r11, %r10
	addq	%r9, %r8
	rolq	$7, %rsi
	addq	%r10, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	rolq	$53, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, %r8
	movq	%r11, 1448(%rsp)
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	addq	%rbx, %r8
	movq	%r10, 1384(%rsp)
	movq	1384(%rsp), %rsi
	movq	%rdi, %r10
	addq	%r12, %r10
	movq	%r9, %r11
	movq	%rdi, 1416(%rsp)
	addq	%r14, %r11
	leaq	(%r8,%r10), %rdi
	movq	%r9, 1224(%rsp)
	addq	%r13, %rsi
	movabsq	$-3329063056561552456, %r12
	movabsq	$-5426079245872290139, %r13
	leaq	(%rsi,%r11), %r9
	addq	%r15, %rsi
	movabsq	$-6657276164713376882, %r14
	addq	%rdi, %rsi
	rolq	$7, %rsi
	addq	%r12, %r11
	addq	%r14, %r10
	addq	%r13, %r8
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r11, 1192(%rsp)
	movq	%r10, 1096(%rsp)
	movq	%r11, %r8
	movq	%rdi, %r10
	addq	904(%rsp), %r8
	addq	872(%rsp), %r10
	movq	%r9, %r11
	movq	1096(%rsp), %rsi
	addq	936(%rsp), %r11
	addq	840(%rsp), %rsi
	movq	%r9, 1352(%rsp)
	movq	%rdi, 1128(%rsp)
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	movq	%r10, %r12
	movq	%r11, %r14
	movq	%r11, %rbx
	xorq	%rdi, %r12
	movq	1160(%rsp), %rdi
	xorq	%r9, %r14
	xorq	%r8, %rbx
	movq	%r10, %r13
	movq	1064(%rsp), %r8
	movq	1000(%rsp), %r9
	xorq	%rsi, %r13
	movq	968(%rsp), %rsi
	addq	%r14, %rdi
	movabsq	$-3329063056561552456, %r11
	movq	%rdi, 1160(%rsp)
	addq	1160(%rsp), %r11
	addq	%rbx, %r8
	addq	%r12, %r9
	addq	%r13, %rsi
	leaq	(%r9,%r8), %r10
	addq	%rsi, %rdi
	addq	%r15, %rsi
	addq	%r10, %rsi
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %r8
	movabsq	$-6657276164713376882, %r10
	rolq	$19, %r11
	addq	%r10, %r9
	rolq	$7, %rsi
	addq	%rdi, %r8
	leaq	(%r9,%rdi), %r10
	movq	%r11, %r9
	rolq	$31, %r8
	xorq	%rsi, %r9
	rolq	$53, %r10
	movq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r8, %rdi
	xorq	%r9, %r8
	movabsq	$5953845371152580681, %r9
	addq	%r9, %r8
	xorq	%rdi, %r11
	movabsq	$-7646712092252898442, %r9
	addq	%r9, %r11
	xorq	%rdi, %rsi
	movabsq	$-7946738593435294165, %r9
	movabsq	$-2842268575306187841, %rdi
	addq	%r10, %r9
	addq	%rdi, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rcx, %r8
	addq	%rsi, %r9
	addq	%r9, %r8
	addq	%rdx, %r11
	addq	%rax, %rsi
	addq	%r11, %r9
	movabsq	$-3751294463443135658, %r11
	addq	%rdi, %rsi
	addq	%r11, %r10
	rolq	$23, %r9
	rolq	$37, %rsi
	addq	%r10, %rdi
	rolq	$11, %r8
	movq	%r9, %r10
	rolq	$59, %rdi
	xorq	%r8, %r10
	movq	%rdi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%rsi, %r11
	movq	%r10, 968(%rsp)
	movq	%r10, %rsi
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	addq	%r12, %r11
	addq	%r13, %rsi
	addq	%r14, %r10
	movq	%r8, 1064(%rsp)
	addq	%rbx, %r8
	movq	%r9, 1160(%rsp)
	movq	%rdi, 1000(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	movabsq	$4195444129992158507, %r12
	addq	%rdx, %r11
	addq	%r12, %r10
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%rdi, %rsi
	addq	%r11, %r9
	addq	%r10, %rdi
	rolq	$23, %r9
	rolq	$11, %r8
	rolq	$59, %rdi
	rolq	$37, %rsi
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r8
	movq	%r10, 840(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 904(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 936(%rsp)
	movq	%rdi, 872(%rsp)
	leaq	(%rsi,%r10), %r9
	addq	%r12, %r10
	addq	%rax, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$23, %r9
	rolq	$11, %r8
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$37, %rsi
	xorq	%r8, %r10
	rolq	$59, %rdi
	movq	%r9, %r14
	movq	%rdi, %r11
	movq	%r10, %r13
	movq	1224(%rsp), %r9
	xorq	%rsi, %r11
	xorq	%rsi, %r13
	movq	%r8, %rbx
	movq	1384(%rsp), %rsi
	xorq	%r11, %r14
	xorq	%r11, %rbx
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%r14, %r9
	addq	%r13, %rsi
	leaq	(%r9,%rsi), %r10
	addq	%rbx, %r8
	addq	%r12, %r11
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%r10, %r8
	addq	%rdx, %r11
	addq	%rax, %rsi
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%rdi, %rsi
	addq	%r10, %r9
	rolq	$23, %r11
	rolq	$37, %rsi
	leaq	(%r9,%rdi), %r10
	rolq	$11, %r8
	movq	%r11, %rdi
	xorq	%r8, %rdi
	rolq	$59, %r10
	movq	%r10, %r9
	xorq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$-1914029582460860148, %r9
	movq	%r11, 1448(%rsp)
	movabsq	$-824919486193887165, %r11
	addq	%r9, %r10
	addq	%r11, %r8
	movabsq	$-7632797540959622777, %r9
	movabsq	$6609752215332129920, %r11
	addq	1448(%rsp), %r9
	addq	%r11, %rsi
	movabsq	$7484883476188376383, %r11
	addq	1448(%rsp), %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$19, %rdi
	addq	%r11, %r10
	addq	%r9, %r8
	rolq	$7, %rsi
	addq	%r10, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	rolq	$53, %r9
	xorq	%rsi, %r11
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1448(%rsp)
	movq	%r11, %r8
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r9, %r11
	movq	%r10, 1384(%rsp)
	movq	1384(%rsp), %rsi
	movq	%rdi, %r10
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r14, %r11
	movabsq	$-3329063056561552456, %r12
	movabsq	$-6657276164713376882, %r14
	movq	%r9, 1224(%rsp)
	addq	%r13, %rsi
	movq	%rdi, 1416(%rsp)
	movabsq	$-5426079245872290139, %r13
	leaq	(%r8,%r10), %rdi
	leaq	(%rsi,%r11), %r9
	addq	%r14, %r10
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%r13, %r8
	addq	%rdi, %rsi
	addq	%r9, %r8
	addq	%r11, %rdi
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$7, %rsi
	rolq	$53, %r9
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r11, %r8
	movq	%r10, 1096(%rsp)
	addq	904(%rsp), %r8
	movq	%rdi, %r10
	addq	872(%rsp), %r10
	movq	%r11, 1192(%rsp)
	movq	%r9, %r11
	movq	1096(%rsp), %rsi
	addq	936(%rsp), %r11
	addq	840(%rsp), %rsi
	movq	%rdi, 1128(%rsp)
	movq	%r9, 1352(%rsp)
	leaq	(%r8,%r10), %rdi
	leaq	(%rsi,%r11), %r9
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r14, %r10
	addq	%r13, %r8
	addq	%r9, %r8
	addq	%r10, %r9
	addq	%r12, %r11
	rolq	$53, %r9
	rolq	$31, %r8
	addq	%r11, %rdi
	movq	%r9, %r10
	rolq	$19, %rdi
	rolq	$7, %rsi
	xorq	%r8, %r10
	movq	%rdi, %r11
	movq	%r10, %r12
	xorq	%rsi, %r11
	movq	%r10, %r13
	xorq	%rdi, %r12
	movq	1160(%rsp), %rdi
	movq	%r11, %r14
	movq	%r11, %rbx
	xorq	%r9, %r14
	movq	1000(%rsp), %r9
	xorq	%r8, %rbx
	movq	1064(%rsp), %r8
	xorq	%rsi, %r13
	addq	%r14, %rdi
	movq	968(%rsp), %rsi
	movabsq	$-3329063056561552456, %r11
	movq	%rdi, 1160(%rsp)
	addq	1160(%rsp), %r11
	addq	%r12, %r9
	addq	%rbx, %r8
	leaq	(%r9,%r8), %r10
	addq	%r13, %rsi
	addq	%rsi, %rdi
	addq	%r15, %rsi
	addq	%r10, %rsi
	addq	%r10, %r11
	movabsq	$-5426079245872290139, %r10
	addq	%r10, %r8
	movabsq	$-6657276164713376882, %r10
	rolq	$19, %r11
	addq	%r10, %r9
	addq	%rdi, %r8
	rolq	$7, %rsi
	leaq	(%r9,%rdi), %r10
	movq	%r11, %r9
	rolq	$31, %r8
	rolq	$53, %r10
	xorq	%rsi, %r9
	movq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r8, %rdi
	xorq	%r9, %r8
	movabsq	$-1139829817207230181, %r9
	addq	%r9, %r8
	xorq	%rdi, %r11
	movabsq	$3054837738180890943, %r9
	addq	%r9, %r11
	xorq	%rdi, %rsi
	movabsq	$-938319195649413462, %r9
	movabsq	$2588290990126348949, %rdi
	addq	%r10, %r9
	addq	%rdi, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rsi, %r9
	addq	%rcx, %r8
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%r11, %r9
	movabsq	$3257124934342745045, %r11
	addq	%r11, %r10
	rolq	$23, %r9
	rolq	$11, %r8
	addq	%rdi, %rsi
	movq	%r9, %r11
	addq	%r10, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r11
	rolq	$59, %rdi
	movq	%rdi, %r10
	xorq	%r11, %rdi
	xorq	%rsi, %r11
	xorq	%rsi, %r10
	movq	%r11, 936(%rsp)
	movq	936(%rsp), %rsi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	addq	%r12, %r11
	movq	%r8, 1000(%rsp)
	addq	%r13, %rsi
	addq	%r14, %r10
	addq	%rbx, %r8
	movabsq	$4195444129992158507, %r12
	movq	%r9, 1064(%rsp)
	movq	%rdi, 968(%rsp)
	leaq	(%rsi,%r10), %r9
	leaq	(%r8,%r11), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r12, %r10
	addq	%rax, %rsi
	addq	%r9, %r8
	addq	%rdi, %rsi
	addq	%r11, %r9
	addq	%r10, %rdi
	rolq	$23, %r9
	rolq	$37, %rsi
	rolq	$59, %rdi
	rolq	$11, %r8
	movq	%r9, %r10
	movq	%rdi, %r11
	xorq	%r8, %r10
	xorq	%rsi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	xorq	%r11, %r9
	xorq	%r11, %r8
	movq	%r10, 808(%rsp)
	movq	%r10, %rsi
	movq	%r9, %r10
	addq	1096(%rsp), %rsi
	addq	1352(%rsp), %r10
	movq	%r8, 872(%rsp)
	movq	%rdi, %r11
	addq	1192(%rsp), %r8
	addq	1128(%rsp), %r11
	movq	%r9, 904(%rsp)
	movq	%rdi, 840(%rsp)
	leaq	(%rsi,%r10), %r9
	addq	%r12, %r10
	addq	%rax, %rsi
	leaq	(%r8,%r11), %rdi
	addq	%rdx, %r11
	addq	%rcx, %r8
	addq	%r9, %r8
	addq	%r11, %r9
	rolq	$23, %r9
	rolq	$11, %r8
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$37, %rsi
	rolq	$59, %rdi
	xorq	%r8, %r10
	movq	%r9, %r14
	movq	%rdi, %r11
	movq	%r10, %r13
	movq	1224(%rsp), %r9
	xorq	%rsi, %r11
	xorq	%rsi, %r13
	movq	%r8, %rbx
	movq	1384(%rsp), %rsi
	xorq	%r11, %r14
	xorq	%r11, %rbx
	movq	1448(%rsp), %r8
	movq	1416(%rsp), %r11
	movq	%r10, %r12
	xorq	%rdi, %r12
	addq	%r14, %r9
	addq	%r13, %rsi
	leaq	(%r9,%rsi), %r10
	addq	%rbx, %r8
	addq	%r12, %r11
	leaq	(%r11,%r8), %rdi
	addq	%rcx, %r8
	addq	%rdx, %r11
	addq	%r10, %r8
	addq	%r10, %r11
	movabsq	$4195444129992158507, %r10
	addq	%r10, %r9
	addq	%rax, %rsi
	rolq	$23, %r11
	leaq	(%r9,%rdi), %r10
	addq	%rdi, %rsi
	rolq	$11, %r8
	rolq	$37, %rsi
	movq	%r11, %rdi
	rolq	$59, %r10
	xorq	%r8, %rdi
	movq	%r10, %r9
	xorq	%rdi, %r10
	xorq	%rsi, %r9
	xorq	%rdi, %rsi
	xorq	%r9, %r11
	xorq	%r9, %r8
	movabsq	$3174302594670681997, %r9
	movq	%r11, 1448(%rsp)
	addq	%r9, %r10
	movabsq	$-8739574512844769069, %r9
	addq	1448(%rsp), %r9
	movabsq	$-6097248013946911484, %r11
	addq	%r11, %r8
	movabsq	$-496885038275669880, %r11
	addq	%r11, %rsi
	movabsq	$6378106504303230091, %r11
	leaq	(%r8,%r10), %rdi
	addq	%rsi, %r9
	addq	%r15, %rsi
	addq	1448(%rsp), %r11
	addq	%rdi, %rsi
	rolq	$7, %rsi
	addq	%r11, %rdi
	movabsq	$-5426079245872290139, %r11
	addq	%r11, %r8
	movabsq	$-6657276164713376882, %r11
	rolq	$19, %rdi
	addq	%r11, %r10
	addq	%r9, %r8
	movq	%rdi, %r11
	addq	%r10, %r9
	rolq	$31, %r8
	xorq	%rsi, %r11
	rolq	$53, %r9
	movq	%r9, %r10
	xorq	%r11, %r9
	xorq	%r8, %r11
	xorq	%r8, %r10
	movq	%r11, 1224(%rsp)
	movq	%r11, preCompInternalState+8(%rip)
	xorq	%r10, %rdi
	xorq	%rsi, %r10
	movq	%r11, %r8
	movq	%r10, 1416(%rsp)
	movq	1416(%rsp), %rsi
	movq	%r9, %r11
	movq	%r10, preCompInternalState+24(%rip)
	movq	%rdi, %r10
	addq	%rbx, %r8
	addq	%r12, %r10
	addq	%r14, %r11
	movabsq	$-3329063056561552456, %r12
	addq	%r13, %rsi
	movabsq	$-6657276164713376882, %r14
	movabsq	$-5426079245872290139, %r13
	movq	%r9, 1160(%rsp)
	movq	%r9, preCompInternalState(%rip)
	leaq	(%rsi,%r11), %r9
	movq	%rdi, 1448(%rsp)
	movq	%rdi, preCompInternalState+16(%rip)
	leaq	(%r8,%r10), %rdi
	addq	%r12, %r11
	addq	%r14, %r10
	addq	%r15, %rsi
	addq	%r13, %r8
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	rolq	$19, %rdi
	rolq	$53, %r9
	movq	%rdi, %r11
	movq	%r9, %r10
	movabsq	$-4925106476758491821, %rbx
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r10, %rdi
	xorq	%r8, %r11
	xorq	%rsi, %r10
	movq	%r9, 1096(%rsp)
	movq	%r11, 776(%rsp)
	movq	%rdi, 744(%rsp)
	movq	%r11, %r8
	movq	%r10, 712(%rsp)
	movq	%r9, %r11
	addq	872(%rsp), %r8
	addq	904(%rsp), %r11
	movq	%rdi, %r10
	movq	712(%rsp), %rsi
	addq	840(%rsp), %r10
	addq	808(%rsp), %rsi
	leaq	(%r8,%r10), %rdi
	addq	%r14, %r10
	addq	%r13, %r8
	leaq	(%rsi,%r11), %r9
	addq	%r12, %r11
	addq	%r15, %rsi
	addq	%rdi, %rsi
	addq	%r11, %rdi
	addq	%r9, %r8
	addq	%r10, %r9
	rolq	$19, %rdi
	rolq	$53, %r9
	rolq	$7, %rsi
	rolq	$31, %r8
	movq	%rdi, %r11
	movq	%r9, %r10
	xorq	%rsi, %r11
	xorq	%r8, %r10
	xorq	%r11, %r9
	xorq	%r10, %rdi
	xorq	%r8, %r11
	xorq	%rsi, %r10
	movq	%r11, 1352(%rsp)
	movq	%rdi, 1192(%rsp)
	movq	%r10, 1128(%rsp)
	addq	968(%rsp), %rdi
	movq	%r11, %r8
	movq	%r10, %r11
	addq	1000(%rsp), %r8
	addq	936(%rsp), %r11
	movq	%r9, %r10
	addq	1064(%rsp), %r10
	movq	%r9, 1384(%rsp)
	leaq	(%rdi,%r8), %r9
	leaq	(%r10,%r11), %rsi
	addq	%r15, %r11
	addq	%r12, %r10
	addq	%r14, %rdi
	addq	%r9, %r11
	addq	%r10, %r9
	leaq	(%rdi,%rsi), %r10
	rolq	$19, %r9
	addq	%r13, %r8
	rolq	$7, %r11
	addq	%rsi, %r8
	movq	%r9, %rdi
	rolq	$53, %r10
	rolq	$31, %r8
	xorq	%r11, %rdi
	movq	%r10, %rsi
	movq	%rdi, %r12
	movabsq	$853475092736589577, %r15
	xorq	%r8, %rsi
	xorq	%r10, %r12
	xorq	%r8, %rdi
	xorq	%rsi, %r9
	movabsq	$-5486504877919021346, %r8
	xorq	%r11, %rsi
	movabsq	$1906713845121804688, %r10
	addq	%r15, %rdi
	addq	%rbx, %rsi
	addq	%r9, %r8
	addq	%r12, %r10
	movq	%rdi, InternalState+96(%rip)
	leaq	(%rdi,%r8), %r9
	movq	%r8, InternalState+104(%rip)
	movq	%r10, InternalState+120(%rip)
	addq	%rdx, %r8
	addq	%rsi, %r10
	addq	%rcx, %rdi
	leaq	(%r10,%r8), %r14
	movabsq	$6102157975113963195, %r8
	movq	%rsi, InternalState+112(%rip)
	addq	%r8, %r12
	addq	%rax, %rsi
	addq	%r10, %rdi
	addq	%r9, %r12
	rolq	$23, %r14
	addq	%r9, %rsi
	rolq	$59, %r12
	rolq	$11, %rdi
	rolq	$37, %rsi
	movq	%r12, %rbx
	movq	%r14, %r13
	movabsq	$4195444129992158507, %r10
	xorq	%rsi, %rbx
	xorq	%rdi, %r13
	xorq	%rbx, %r14
	xorq	%r13, %r12
	xorq	%rdi, %rbx
	xorq	%rsi, %r13
	movq	%r14, preCompInternalState+96(%rip)
	movq	%rbx, preCompInternalState+104(%rip)
	addq	1384(%rsp), %r14
	addq	1352(%rsp), %rbx
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r13, preCompInternalState+120(%rip)
	addq	1192(%rsp), %r12
	addq	1128(%rsp), %r13
	leaq	(%rbx,%rcx), %r8
	addq	%r14, %r10
	movq	%rbx, InternalState+64(%rip)
	movq	%r14, InternalState+88(%rip)
	leaq	0(%r13,%r14), %rsi
	leaq	(%r12,%rdx), %r9
	leaq	(%rbx,%r12), %rdi
	movq	%r12, InternalState+72(%rip)
	movq	%r13, InternalState+80(%rip)
	addq	%rsi, %r8
	addq	%rsi, %r9
	leaq	0(%r13,%rax), %rsi
	rolq	$11, %r8
	rolq	$23, %r9
	addq	%rdi, %rsi
	addq	%r10, %rdi
	movq	%r9, %r10
	rolq	$59, %rdi
	rolq	$37, %rsi
	xorq	%r8, %r10
	movq	%rdi, %r11
	xorq	%r10, %rdi
	xorq	%rsi, %r11
	xorq	%r10, %rsi
	movq	%rdi, preCompInternalState+80(%rip)
	xorq	%r11, %r9
	xorq	%r8, %r11
	movq	%rsi, preCompInternalState+88(%rip)
	movq	%r11, preCompInternalState+72(%rip)
	addq	776(%rsp), %r11
	movq	%r9, preCompInternalState+64(%rip)
	movq	%r11, InternalState+32(%rip)
	movq	744(%rsp), %r8
	addq	%r11, %rcx
	vmovdqa	InternalState+64(%rip), %ymm13
	vmovdqa	InternalState+96(%rip), %ymm14
	addq	%rdi, %r8
	movq	712(%rsp), %rdi
	vmovdqa	%ymm13, 8(%rsp)
	addq	%r8, %rdx
	movq	%r8, InternalState+40(%rip)
	vmovdqa	%ymm13, 1736(%rsp)
	vmovdqa	%ymm14, -24(%rsp)
	addq	%rsi, %rdi
	movq	1096(%rsp), %rsi
	vmovdqa	%ymm14, 1768(%rsp)
	movq	%rdi, InternalState+48(%rip)
	addq	%r9, %rsi
	leaq	(%r11,%r8), %r9
	leaq	(%rdi,%rsi), %r10
	movq	%rsi, InternalState+56(%rip)
	vmovdqa	InternalState+32(%rip), %ymm11
	addq	%r10, %rcx
	rolq	$11, %rcx
	addq	%r10, %rdx
	movabsq	$4195444129992158507, %r10
	addq	%rdi, %rax
	addq	%r10, %rsi
	rolq	$23, %rdx
	addq	%r9, %rax
	addq	%rsi, %r9
	movq	%rdx, %rsi
	rolq	$59, %r9
	rolq	$37, %rax
	xorq	%rcx, %rsi
	movq	%r9, %rdi
	xorq	%rsi, %r9
	vmovdqa	%ymm11, 40(%rsp)
	xorq	%rax, %rdi
	movq	%r9, preCompInternalState+48(%rip)
	xorq	%rsi, %rax
	xorq	%rdi, %rcx
	addq	1448(%rsp), %r9
	xorq	%rdi, %rdx
	movq	%rcx, preCompInternalState+40(%rip)
	addq	1224(%rsp), %rcx
	vmovdqa	%ymm11, 1704(%rsp)
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	addq	1160(%rsp), %rdx
	vpxor	%xmm11, %xmm11, %xmm11
	addq	1416(%rsp), %rax
	movq	%r9, InternalState+8(%rip)
	movq	%rcx, InternalState(%rip)
	addq	1480(%rsp), %r9
	addq	1320(%rsp), %rcx
	movq	%rdx, InternalState+24(%rip)
	movq	%rax, InternalState+16(%rip)
	vmovdqa	InternalState(%rip), %ymm9
	vpinsrq	$0, %r9, %xmm4, %xmm4
	movq	%rcx, 1544(%rsp)
	vpinsrq	$0, %rcx, %xmm5, %xmm5
	vmovdqa	%ymm9, 72(%rsp)
	vmovdqa	%ymm9, 1672(%rsp)
	movq	%r9, 1552(%rsp)
	addq	1256(%rsp), %rax
	addq	1288(%rsp), %rdx
	vpxor	%xmm9, %xmm9, %xmm9
	addq	552(%rsp), %r13
	vmovdqa	%xmm5, %xmm5
	vmovdqa	%xmm4, %xmm4
	addq	584(%rsp), %r14
	addq	256(%rsp), %rbx
	movq	%rax, 1560(%rsp)
	vpinsrq	$0, %rax, %xmm11, %xmm11
	movq	1032(%rsp), %rax
	addq	520(%rsp), %r12
	vmovdqa	%ymm5, 1800(%rsp)
	vmovq	1032(%rsp), %xmm1
	movq	1672(%rsp), %r8
	vpinsrq	$0, %rdx, %xmm10, %xmm10
	vmovdqa	%xmm11, %xmm11
	subq	$2, %rax
	vpinsrq	$1, 240(%rsp), %xmm1, %xmm0
	movq	%rax, 1160(%rsp)
	movq	1032(%rsp), %rax
	vmovdqa	%ymm4, 1832(%rsp)
	vmovq	1160(%rsp), %xmm2
	movq	%r8, 248(%rsp)
	vpinsrq	$0, %r13, %xmm7, %xmm7
	vbroadcastsd	248(%rsp), %ymm13
	subq	$1, %rax
	vpinsrq	$0, %r14, %xmm12, %xmm12
	vpinsrq	$1, %rax, %xmm2, %xmm1
	movq	1680(%rsp), %rax
	vpinsrq	$0, %rbx, %xmm9, %xmm9
	vmovdqa	%xmm10, %xmm10
	vpinsrq	$0, %r12, %xmm8, %xmm8
	vmovdqa	%xmm7, %xmm7
	vinserti128	$0x1, %xmm0, %ymm1, %ymm1
	vmovdqa	%xmm12, %xmm12
	vmovdqa	%xmm9, %xmm9
	movq	%rdx, 1568(%rsp)
	movq	%r13, 1592(%rsp)
	vmovdqa	%xmm8, %xmm8
	movq	%r14, 1600(%rsp)
	vmovdqa	%ymm13, 488(%rsp)
	vmovdqa	%ymm1, 1160(%rsp)
	movq	%rbx, 1576(%rsp)
	movq	%r12, 1584(%rsp)
	vmovdqa	%ymm13, 2056(%rsp)
	vmovdqa	%ymm11, 1864(%rsp)
	vmovdqa	%ymm10, 1896(%rsp)
	vmovdqa	%ymm9, 1928(%rsp)
	vmovdqa	%ymm8, 1960(%rsp)
	vmovdqa	%ymm7, 1992(%rsp)
	vmovdqa	%ymm12, 2024(%rsp)
	movq	%rax, 256(%rsp)
	movq	1688(%rsp), %r11
	movq	1696(%rsp), %r13
	movq	1704(%rsp), %r14
	movq	1712(%rsp), %r15
	movq	%r11, -96(%rsp)
	movq	1720(%rsp), %rax
	vmovq	-96(%rsp), %xmm1
	movq	%r13, -96(%rsp)
	vmovq	-96(%rsp), %xmm2
	movq	%r14, -96(%rsp)
	vmovq	-96(%rsp), %xmm3
	vpunpcklqdq	%xmm2, %xmm2, %xmm2
	movq	%r15, -96(%rsp)
	vpunpcklqdq	%xmm3, %xmm3, %xmm3
	vmovq	-96(%rsp), %xmm13
	movq	1728(%rsp), %rdx
	movq	1736(%rsp), %rcx
	vpunpcklqdq	%xmm13, %xmm13, %xmm6
	vpunpcklqdq	%xmm1, %xmm1, %xmm1
	vbroadcastsd	256(%rsp), %ymm0
	vinserti128	$1, %xmm2, %ymm2, %ymm2
	movq	%rax, 184(%rsp)
	vinserti128	$1, %xmm3, %ymm3, %ymm3
	movq	%rdx, 176(%rsp)
	vinserti128	$1, %xmm1, %ymm1, %ymm1
	movq	%rcx, 168(%rsp)
	vinserti128	$1, %xmm6, %ymm6, %ymm6
	vmovdqa	%ymm0, 968(%rsp)
	vmovdqa	%ymm0, 2088(%rsp)
	vmovdqa	%ymm2, 744(%rsp)
	vbroadcastsd	168(%rsp), %ymm0
	vmovdqa	%ymm2, 2152(%rsp)
	vmovdqa	%ymm3, 712(%rsp)
	vmovdqa	%ymm3, 2184(%rsp)
	vbroadcastsd	176(%rsp), %ymm2
	vbroadcastsd	184(%rsp), %ymm3
	vmovdqa	%ymm1, 776(%rsp)
	vmovdqa	%ymm1, 2120(%rsp)
	vmovdqa	%ymm6, 2216(%rsp)
	vmovdqa	%ymm3, 2248(%rsp)
	vmovdqa	%ymm2, 2280(%rsp)
	vmovdqa	%ymm0, 680(%rsp)
	movq	1752(%rsp), %rax
	movq	1744(%rsp), %r8
	vmovdqa	%ymm0, 2312(%rsp)
	movq	1768(%rsp), %rcx
	movq	%rax, 152(%rsp)
	movq	1776(%rsp), %rax
	movq	%r8, 160(%rsp)
	vbroadcastsd	160(%rsp), %ymm13
	movq	%rcx, 136(%rsp)
	movq	1760(%rsp), %rdx
	vbroadcastsd	152(%rsp), %ymm1
	movq	%rax, 128(%rsp)
	movq	1784(%rsp), %rax
	vmovdqa	%ymm13, 648(%rsp)
	vmovdqa	%ymm13, 2344(%rsp)
	vbroadcastsd	136(%rsp), %ymm13
	movq	%rax, 120(%rsp)
	vmovdqa	%ymm1, 2376(%rsp)
	movq	1792(%rsp), %rax
	vmovdqa	%ymm13, 616(%rsp)
	movq	%rdx, 144(%rsp)
	vmovdqa	%ymm13, 2440(%rsp)
	vbroadcastsd	128(%rsp), %ymm13
	movq	%rax, 112(%rsp)
	vmovdqa	%ymm13, 584(%rsp)
	vmovdqa	%ymm13, 2472(%rsp)
	vbroadcastsd	120(%rsp), %ymm13
	vbroadcastsd	144(%rsp), %ymm0
	vmovdqa	%ymm13, 552(%rsp)
	vmovdqa	%ymm13, 2504(%rsp)
	vbroadcastsd	112(%rsp), %ymm13
	vmovdqa	%ymm0, 2408(%rsp)
	vmovdqa	%ymm13, 520(%rsp)
	vmovdqa	%ymm13, 2536(%rsp)
	movq	104(%rsp), %rax
	shrq	$8, %rax
	testq	%rax, %rax
	je	.L50
	vmovdqa	%ymm7, 1384(%rsp)
	vpaddq	%ymm0, %ymm1, %ymm13
	movq	-72(%rsp), %rcx
	vmovdqa	552(%rsp), %ymm7
	movq	192(%rsp), %rdx
	xorl	%esi, %esi
	vmovdqa	%ymm11, 1224(%rsp)
	vpaddq	%ymm2, %ymm3, %ymm11
	vpaddq	520(%rsp), %ymm7, %ymm7
	vmovdqa	%ymm5, 1352(%rsp)
	vpaddq	712(%rsp), %ymm6, %ymm5
	vmovdqa	%ymm7, 840(%rsp)
	vpaddq	.LC2(%rip), %ymm6, %ymm6
	vpaddq	%ymm11, %ymm6, %ymm6
	vpsrlq	$41, %ymm6, %ymm7
	vpsllq	$23, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vmovdqa	%ymm11, 456(%rsp)
	vmovdqa	%ymm13, 904(%rsp)
	vmovdqa	%ymm6, 424(%rsp)
	vpaddq	.LC3(%rip), %ymm5, %ymm6
	vpaddq	%ymm3, %ymm6, %ymm3
	vpsrlq	$27, %ymm3, %ymm6
	vpsllq	$37, %ymm3, %ymm3
	vpor	%ymm6, %ymm3, %ymm3
	vpaddq	.LC4(%rip), %ymm5, %ymm5
	vpaddq	%ymm2, %ymm5, %ymm2
	vmovdqa	%ymm9, 1256(%rsp)
	vmovdqa	776(%rsp), %ymm9
	vmovdqa	%ymm3, 392(%rsp)
	vpsrlq	$5, %ymm2, %ymm3
	vpsllq	$59, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm2
	vpaddq	744(%rsp), %ymm9, %ymm9
	vmovdqa	680(%rsp), %ymm14
	vmovdqa	392(%rsp), %ymm11
	vmovdqa	%ymm9, 936(%rsp)
	vpxor	%ymm2, %ymm11, %ymm11
	vmovdqa	616(%rsp), %ymm9
	vmovdqa	%ymm4, 1288(%rsp)
	vpaddq	648(%rsp), %ymm14, %ymm4
	vpaddq	584(%rsp), %ymm9, %ymm9
	vmovdqa	%ymm2, 360(%rsp)
	vmovdqa	%ymm12, 1032(%rsp)
	vmovdqa	%ymm10, 1448(%rsp)
	vmovdqa	%ymm8, 1416(%rsp)
	vmovdqa	%ymm9, 872(%rsp)
	vmovdqa	%ymm11, 328(%rsp)
	vpxor	424(%rsp), %ymm11, %ymm13
	vmovdqa	%ymm13, 200(%rsp)
	vpaddq	.LC3(%rip), %ymm4, %ymm2
	vpaddq	%ymm1, %ymm2, %ymm1
	vpsrlq	$27, %ymm1, %ymm2
	vpsllq	$37, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vpaddq	.LC4(%rip), %ymm4, %ymm4
	vpaddq	%ymm0, %ymm4, %ymm0
	vmovdqa	%ymm1, 296(%rsp)
	vpsrlq	$5, %ymm0, %ymm1
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqa	296(%rsp), %ymm14
	vpxor	%ymm0, %ymm14, %ymm14
	vmovdqa	%ymm0, 264(%rsp)
	vmovdqa	%ymm14, 808(%rsp)
	.p2align 4,,10
	.p2align 3
.L20:
	vmovdqa	1160(%rsp), %ymm0
	addq	$1, %rsi
	vmovdqa	488(%rsp), %ymm1
	vpaddq	.LC0(%rip), %ymm0, %ymm0
	vmovdqa	.LC2(%rip), %ymm3
	vpxor	%ymm0, %ymm1, %ymm2
	vmovdqa	%ymm0, 1160(%rsp)
	vpaddq	968(%rsp), %ymm2, %ymm0
	vpaddq	.LC1(%rip), %ymm2, %ymm2
	vpaddq	936(%rsp), %ymm2, %ymm2
	vpsrlq	$53, %ymm2, %ymm1
	vpsllq	$11, %ymm2, %ymm2
	vpor	%ymm1, %ymm2, %ymm1
	vpaddq	968(%rsp), %ymm3, %ymm2
	vpaddq	936(%rsp), %ymm2, %ymm2
	vpsrlq	$41, %ymm2, %ymm3
	vpsllq	$23, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm3
	vpaddq	.LC3(%rip), %ymm0, %ymm2
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	776(%rsp), %ymm2, %ymm2
	vpaddq	744(%rsp), %ymm0, %ymm0
	vpsrlq	$27, %ymm2, %ymm4
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm4, %ymm2, %ymm5
	vpsrlq	$5, %ymm0, %ymm2
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm2, %ymm0, %ymm2
	vpxor	%ymm3, %ymm1, %ymm0
	vpxor	%ymm2, %ymm5, %ymm4
	vpxor	%ymm0, %ymm2, %ymm2
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm3, %ymm4, %ymm3
	vpxor	%ymm1, %ymm4, %ymm1
	vpaddq	_ZL14preCompConstV4+64(%rip), %ymm2, %ymm2
	vpaddq	_ZL14preCompConstV4+96(%rip), %ymm5, %ymm5
	vpaddq	_ZL14preCompConstV4(%rip), %ymm3, %ymm3
	vpaddq	%ymm3, %ymm5, %ymm0
	vpaddq	_ZL14preCompConstV4+32(%rip), %ymm1, %ymm1
	vpaddq	%ymm2, %ymm1, %ymm4
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm4, %ymm6
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	.LC6(%rip), %ymm4, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm3
	vpsrlq	$45, %ymm3, %ymm4
	vpsllq	$19, %ymm3, %ymm3
	vpor	%ymm4, %ymm3, %ymm14
	vpaddq	%ymm0, %ymm1, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm0
	vpsrlq	$33, %ymm3, %ymm1
	vpsrlq	$11, %ymm0, %ymm2
	vpsllq	$31, %ymm3, %ymm3
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm3, %ymm1
	vpaddq	%ymm5, %ymm6, %ymm5
	vpor	%ymm2, %ymm0, %ymm9
	vpsrlq	$57, %ymm5, %ymm6
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm13
	vmovdqa	.LC1(%rip), %ymm4
	vpxor	%ymm9, %ymm1, %ymm0
	vpxor	%ymm14, %ymm13, %ymm15
	vpxor	%ymm0, %ymm14, %ymm14
	vpxor	%ymm0, %ymm13, %ymm0
	vmovdqa	.LC2(%rip), %ymm13
	vpxor	%ymm9, %ymm15, %ymm9
	vpxor	%ymm1, %ymm15, %ymm15
	vmovdqa	%ymm14, 1320(%rsp)
	vmovdqa	%ymm0, 1192(%rsp)
	vpaddq	712(%rsp), %ymm4, %ymm0
	vpaddq	456(%rsp), %ymm0, %ymm0
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpaddq	200(%rsp), %ymm9, %ymm3
	vmovdqa	%ymm9, 1480(%rsp)
	vpxor	424(%rsp), %ymm1, %ymm5
	vpxor	328(%rsp), %ymm1, %ymm1
	vpxor	360(%rsp), %ymm5, %ymm2
	vpxor	392(%rsp), %ymm5, %ymm5
	vpaddq	%ymm1, %ymm15, %ymm1
	vpaddq	%ymm14, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm1, %ymm4
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm4, %ymm6
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	.LC6(%rip), %ymm4, %ymm4
	vpaddq	1192(%rsp), %ymm5, %ymm5
	vpaddq	%ymm3, %ymm5, %ymm0
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm3, %ymm4, %ymm3
	vpsrlq	$57, %ymm5, %ymm6
	vpsrlq	$45, %ymm3, %ymm4
	vpsllq	$7, %ymm5, %ymm5
	vpsllq	$19, %ymm3, %ymm3
	vpor	%ymm6, %ymm5, %ymm6
	vpor	%ymm4, %ymm3, %ymm9
	vpaddq	%ymm0, %ymm1, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm0
	vpsrlq	$33, %ymm3, %ymm1
	vpsrlq	$11, %ymm0, %ymm2
	vpsllq	$31, %ymm3, %ymm3
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm3, %ymm1
	vmovdqa	.LC1(%rip), %ymm5
	vpor	%ymm2, %ymm0, %ymm7
	vmovdqa	.LC1(%rip), %ymm14
	vpxor	%ymm9, %ymm6, %ymm11
	vpxor	%ymm7, %ymm1, %ymm0
	vpxor	%ymm7, %ymm11, %ymm7
	vpxor	%ymm1, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm6, %ymm6
	vpaddq	680(%rsp), %ymm5, %ymm0
	vpaddq	904(%rsp), %ymm0, %ymm0
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpaddq	648(%rsp), %ymm13, %ymm0
	vpaddq	904(%rsp), %ymm0, %ymm0
	vpsrlq	$41, %ymm0, %ymm2
	vpsllq	$23, %ymm0, %ymm4
	vpor	%ymm2, %ymm4, %ymm4
	vpxor	%ymm4, %ymm1, %ymm2
	vpxor	808(%rsp), %ymm4, %ymm4
	vpxor	264(%rsp), %ymm2, %ymm3
	vpxor	808(%rsp), %ymm1, %ymm1
	vpaddq	%ymm4, %ymm7, %ymm4
	vpxor	296(%rsp), %ymm2, %ymm2
	vpaddq	%ymm3, %ymm9, %ymm3
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm3, %ymm1, %ymm5
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm5, %ymm8
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	.LC6(%rip), %ymm5, %ymm5
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm4, %ymm2, %ymm0
	vpaddq	%ymm2, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm5, %ymm4
	vpsrlq	$57, %ymm8, %ymm2
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$7, %ymm8, %ymm8
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm2, %ymm8, %ymm2
	vpor	%ymm5, %ymm4, %ymm5
	vpaddq	%ymm0, %ymm1, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm0
	vpsrlq	$33, %ymm4, %ymm1
	vpsrlq	$11, %ymm0, %ymm3
	vpsllq	$31, %ymm4, %ymm4
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm4, %ymm1
	vpor	%ymm3, %ymm0, %ymm3
	vpxor	%ymm5, %ymm2, %ymm10
	vpxor	%ymm3, %ymm1, %ymm0
	vpxor	%ymm3, %ymm10, %ymm3
	vpxor	%ymm1, %ymm10, %ymm10
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm0, %ymm2, %ymm2
	vpaddq	616(%rsp), %ymm14, %ymm0
	vpaddq	840(%rsp), %ymm0, %ymm0
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm8
	vpaddq	584(%rsp), %ymm13, %ymm0
	vmovdqa	.LC4(%rip), %ymm13
	vpaddq	840(%rsp), %ymm0, %ymm0
	vpsrlq	$41, %ymm0, %ymm1
	vpsllq	$23, %ymm0, %ymm12
	vpor	%ymm1, %ymm12, %ymm12
	vmovdqa	.LC3(%rip), %ymm1
	vpaddq	872(%rsp), %ymm1, %ymm0
	vpaddq	552(%rsp), %ymm0, %ymm0
	vpsrlq	$27, %ymm0, %ymm1
	vpsllq	$37, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm4
	vpaddq	872(%rsp), %ymm13, %ymm0
	vpaddq	520(%rsp), %ymm0, %ymm0
	vpsrlq	$5, %ymm0, %ymm1
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpxor	%ymm12, %ymm8, %ymm0
	vpxor	%ymm1, %ymm4, %ymm13
	vpxor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm0, %ymm4, %ymm4
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm4, %ymm2, %ymm4
	vpaddq	%ymm12, %ymm3, %ymm12
	vpaddq	%ymm12, %ymm4, %ymm0
	vpaddq	%ymm8, %ymm10, %ymm8
	vpaddq	%ymm1, %ymm8, %ymm13
	vpaddq	.LC7(%rip), %ymm8, %ymm8
	vpaddq	.LC5(%rip), %ymm13, %ymm14
	vpaddq	.LC8(%rip), %ymm1, %ymm1
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm4, %ymm14, %ymm4
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$57, %ymm4, %ymm14
	vpsrlq	$45, %ymm12, %ymm13
	vpsllq	$7, %ymm4, %ymm4
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm14, %ymm4, %ymm4
	vpor	%ymm13, %ymm12, %ymm13
	vpaddq	%ymm0, %ymm8, %ymm12
	vpaddq	%ymm0, %ymm1, %ymm0
	vpsrlq	$33, %ymm12, %ymm8
	vpsrlq	$11, %ymm0, %ymm1
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm8, %ymm12, %ymm8
	vpor	%ymm1, %ymm0, %ymm1
	vpxor	%ymm13, %ymm4, %ymm0
	vpxor	%ymm1, %ymm8, %ymm12
	vpxor	%ymm1, %ymm0, %ymm1
	vpxor	%ymm8, %ymm0, %ymm0
	vpxor	%ymm12, %ymm13, %ymm13
	vpxor	%ymm12, %ymm4, %ymm4
	vpaddq	_ZL14preCompConstV4+128(%rip), %ymm1, %ymm1
	vpaddq	_ZL14preCompConstV4+160(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+192(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm0, %ymm8
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+224(%rip), %ymm4, %ymm4
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	%ymm1, %ymm4, %ymm12
	vpaddq	%ymm12, %ymm0, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm0
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm0, %ymm14, %ymm0
	vpor	%ymm13, %ymm12, %ymm13
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm4, %ymm12, %ymm4
	vpaddq	%ymm1, %ymm8, %ymm1
	vpsrlq	$27, %ymm4, %ymm12
	vpsrlq	$5, %ymm1, %ymm8
	vpsllq	$37, %ymm4, %ymm4
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm12, %ymm4, %ymm4
	vpor	%ymm8, %ymm1, %ymm8
	vpxor	%ymm13, %ymm0, %ymm1
	vpxor	%ymm8, %ymm4, %ymm12
	vpxor	%ymm1, %ymm8, %ymm8
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm13, %ymm12, %ymm13
	vpxor	%ymm0, %ymm12, %ymm0
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	%ymm1, %ymm2, %ymm2
	vmovdqa	%ymm13, 1128(%rsp)
	vpaddq	%ymm13, %ymm3, %ymm3
	vmovdqa	%ymm8, 1096(%rsp)
	vpaddq	%ymm0, %ymm10, %ymm10
	vpaddq	%ymm5, %ymm10, %ymm8
	vmovdqa	%ymm1, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	%ymm3, %ymm2, %ymm1
	vpaddq	.LC2(%rip), %ymm5, %ymm5
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm5, %ymm5
	vpsrlq	$53, %ymm10, %ymm4
	vpsllq	$23, %ymm5, %ymm1
	vpsllq	$11, %ymm10, %ymm10
	vpor	%ymm4, %ymm10, %ymm4
	vpsrlq	$41, %ymm5, %ymm10
	vpaddq	.LC3(%rip), %ymm8, %ymm5
	vpor	%ymm10, %ymm1, %ymm1
	vpaddq	%ymm2, %ymm5, %ymm2
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpsrlq	$27, %ymm2, %ymm5
	vpaddq	%ymm3, %ymm8, %ymm8
	vpsllq	$37, %ymm2, %ymm2
	vpsllq	$59, %ymm8, %ymm3
	vpor	%ymm5, %ymm2, %ymm5
	vpsrlq	$5, %ymm8, %ymm2
	vpor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm3, %ymm5, %ymm8
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm5, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm9, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm7, %ymm7
	vpaddq	%ymm7, %ymm6, %ymm5
	vpaddq	%ymm4, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm10
	vpaddq	.LC1(%rip), %ymm11, %ymm11
	vpaddq	.LC2(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm11, %ymm11
	vpaddq	%ymm5, %ymm9, %ymm9
	vpsrlq	$53, %ymm11, %ymm8
	vpsllq	$23, %ymm9, %ymm5
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm8, %ymm11, %ymm8
	vpsrlq	$41, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm10, %ymm9
	vpor	%ymm11, %ymm5, %ymm5
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpsrlq	$27, %ymm6, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpsllq	$37, %ymm6, %ymm6
	vpsllq	$59, %ymm10, %ymm7
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$5, %ymm10, %ymm6
	vpor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm7, %ymm9, %ymm10
	vpxor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpxor	%ymm5, %ymm10, %ymm5
	vpxor	%ymm8, %ymm10, %ymm8
	vpaddq	1320(%rsp), %ymm7, %ymm14
	vpaddq	1192(%rsp), %ymm6, %ymm13
	vpaddq	1480(%rsp), %ymm5, %ymm9
	vpaddq	%ymm9, %ymm13, %ymm12
	vpaddq	%ymm8, %ymm15, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm10
	vpaddq	.LC1(%rip), %ymm15, %ymm15
	vpaddq	.LC2(%rip), %ymm14, %ymm14
	vpaddq	%ymm12, %ymm15, %ymm15
	vpaddq	%ymm12, %ymm14, %ymm14
	vpsrlq	$53, %ymm15, %ymm11
	vpsllq	$23, %ymm14, %ymm12
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm11, %ymm15, %ymm11
	vpsrlq	$41, %ymm14, %ymm15
	vpaddq	.LC3(%rip), %ymm10, %ymm14
	vpor	%ymm15, %ymm12, %ymm12
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpaddq	%ymm13, %ymm14, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$27, %ymm13, %ymm14
	vpsrlq	$5, %ymm9, %ymm10
	vpsllq	$37, %ymm13, %ymm13
	vpsllq	$59, %ymm9, %ymm9
	vpor	%ymm14, %ymm13, %ymm14
	vpor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm12, %ymm11, %ymm9
	vpxor	%ymm10, %ymm14, %ymm13
	vpxor	%ymm9, %ymm10, %ymm10
	vpxor	%ymm9, %ymm14, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm11, %ymm13, %ymm11
	vpaddq	_ZL14preCompConstV4+320(%rip), %ymm10, %ymm10
	vpaddq	_ZL14preCompConstV4+352(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+256(%rip), %ymm12, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm9
	vpaddq	_ZL14preCompConstV4+288(%rip), %ymm11, %ymm11
	vpaddq	%ymm10, %ymm11, %ymm13
	vpaddq	.LC7(%rip), %ymm11, %ymm11
	vpaddq	.LC5(%rip), %ymm13, %ymm15
	vpaddq	.LC8(%rip), %ymm10, %ymm10
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm14, %ymm15, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$57, %ymm14, %ymm15
	vpsrlq	$45, %ymm12, %ymm13
	vpsllq	$7, %ymm14, %ymm14
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	%ymm9, %ymm11, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$33, %ymm13, %ymm11
	vpsrlq	$11, %ymm9, %ymm10
	vpsllq	$31, %ymm13, %ymm13
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm11, %ymm13, %ymm11
	vpor	%ymm10, %ymm9, %ymm13
	vpxor	%ymm12, %ymm14, %ymm10
	vpxor	%ymm13, %ymm11, %ymm9
	vpxor	%ymm13, %ymm10, %ymm13
	vpxor	%ymm11, %ymm10, %ymm10
	vpxor	%ymm9, %ymm12, %ymm12
	vpxor	%ymm9, %ymm14, %ymm9
	vpaddq	%ymm13, %ymm5, %ymm5
	vmovdqa	%ymm13, 1480(%rsp)
	vpaddq	%ymm8, %ymm10, %ymm8
	vpaddq	%ymm12, %ymm7, %ymm7
	vmovdqa	%ymm12, 1320(%rsp)
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	%ymm9, %ymm6, %ymm6
	vpaddq	.LC7(%rip), %ymm8, %ymm8
	vpaddq	%ymm5, %ymm6, %ymm12
	vpaddq	.LC8(%rip), %ymm7, %ymm7
	vmovdqa	%ymm9, 1192(%rsp)
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$57, %ymm6, %ymm9
	vpsllq	$7, %ymm6, %ymm6
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$45, %ymm5, %ymm6
	vpsllq	$19, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm11
	vpaddq	%ymm12, %ymm8, %ymm5
	vpaddq	%ymm12, %ymm7, %ymm12
	vpsrlq	$33, %ymm5, %ymm6
	vpsllq	$31, %ymm5, %ymm8
	vpsrlq	$11, %ymm12, %ymm5
	vpor	%ymm6, %ymm8, %ymm8
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm5, %ymm12, %ymm5
	vpxor	%ymm11, %ymm9, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm5, %ymm7, %ymm5
	vpxor	%ymm8, %ymm7, %ymm8
	vpxor	%ymm6, %ymm11, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm3, %ymm4, %ymm11
	vpaddq	.LC7(%rip), %ymm4, %ymm4
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm12
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm2, %ymm9, %ymm2
	vpsrlq	$57, %ymm2, %ymm9
	vpsllq	$7, %ymm2, %ymm2
	vpor	%ymm9, %ymm2, %ymm9
	vpsrlq	$45, %ymm1, %ymm2
	vpsllq	$19, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm11
	vpaddq	%ymm12, %ymm4, %ymm1
	vpaddq	%ymm12, %ymm3, %ymm12
	vpsrlq	$33, %ymm1, %ymm2
	vpsllq	$31, %ymm1, %ymm4
	vpsrlq	$11, %ymm12, %ymm1
	vpor	%ymm2, %ymm4, %ymm4
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm1, %ymm12, %ymm1
	vpxor	%ymm11, %ymm9, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm1, %ymm3, %ymm1
	vpxor	%ymm4, %ymm3, %ymm4
	vpxor	%ymm2, %ymm11, %ymm3
	vpxor	%ymm2, %ymm9, %ymm2
	vpaddq	1128(%rsp), %ymm1, %ymm13
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	1096(%rsp), %ymm3, %ymm12
	vpaddq	%ymm12, %ymm0, %ymm14
	vpaddq	.LC8(%rip), %ymm12, %ymm12
	vpaddq	1064(%rsp), %ymm2, %ymm11
	vpaddq	.LC5(%rip), %ymm14, %ymm15
	vpaddq	%ymm13, %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm14, %ymm14
	vpaddq	%ymm11, %ymm15, %ymm11
	vpaddq	%ymm13, %ymm14, %ymm13
	vpsrlq	$57, %ymm11, %ymm15
	vpsrlq	$45, %ymm13, %ymm14
	vpaddq	.LC7(%rip), %ymm0, %ymm0
	vpsllq	$7, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm0, %ymm0
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm12, %ymm9
	vpsllq	$19, %ymm13, %ymm13
	vpor	%ymm14, %ymm13, %ymm13
	vpsrlq	$33, %ymm0, %ymm14
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm14, %ymm0, %ymm14
	vpsrlq	$11, %ymm9, %ymm0
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm13, %ymm11, %ymm12
	vpxor	%ymm0, %ymm14, %ymm9
	vpxor	%ymm0, %ymm12, %ymm0
	vpxor	%ymm14, %ymm12, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+384(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+416(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+448(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+480(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm4, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm4, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm4, %ymm4
	vpor	%ymm9, %ymm4, %ymm9
	vpsrlq	$41, %ymm3, %ymm4
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm4, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm4
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm4, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm7, %ymm7
	vpaddq	%ymm1, %ymm6, %ymm6
	vpaddq	%ymm0, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm4
	vpaddq	%ymm3, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	.LC2(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm7, %ymm7
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm7, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm7, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm7
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm7, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$27, %ymm6, %ymm7
	vpsllq	$37, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm8
	vpsrlq	$5, %ymm5, %ymm6
	vpsllq	$59, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm6
	vpxor	%ymm4, %ymm9, %ymm5
	vpxor	%ymm6, %ymm8, %ymm7
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm7, %ymm4
	vpxor	%ymm9, %ymm7, %ymm7
	vpaddq	1320(%rsp), %ymm6, %ymm12
	vpaddq	1192(%rsp), %ymm5, %ymm9
	vpaddq	1480(%rsp), %ymm4, %ymm13
	vpaddq	%ymm13, %ymm9, %ymm11
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm12, %ymm10, %ymm8
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	%ymm11, %ymm12, %ymm12
	vpsrlq	$53, %ymm15, %ymm10
	vpsllq	$23, %ymm12, %ymm11
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm10, %ymm15, %ymm10
	vpsrlq	$41, %ymm12, %ymm15
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm9, %ymm12, %ymm9
	vpaddq	%ymm13, %ymm8, %ymm13
	vpsrlq	$27, %ymm9, %ymm12
	vpsrlq	$5, %ymm13, %ymm8
	vpsllq	$37, %ymm9, %ymm9
	vpsllq	$59, %ymm13, %ymm13
	vpor	%ymm12, %ymm9, %ymm12
	vpor	%ymm8, %ymm13, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm12, %ymm13
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm11, %ymm13, %ymm11
	vpxor	%ymm10, %ymm13, %ymm10
	vpaddq	_ZL14preCompConstV4+576(%rip), %ymm9, %ymm9
	vpxor	%ymm8, %ymm12, %ymm13
	vpaddq	_ZL14preCompConstV4+512(%rip), %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+544(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	_ZL14preCompConstV4+608(%rip), %ymm13, %ymm13
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vpaddq	%ymm11, %ymm6, %ymm6
	vmovdqa	%ymm11, 1320(%rsp)
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vmovdqa	%ymm8, 1192(%rsp)
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+640(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+672(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+704(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+736(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm8, %ymm8
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm3, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm8, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm8
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm8, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm9
	vpaddq	%ymm9, %ymm5, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm7
	vpaddq	%ymm6, %ymm7, %ymm11
	vpaddq	.LC1(%rip), %ymm7, %ymm7
	vpaddq	.LC2(%rip), %ymm6, %ymm6
	vpaddq	%ymm4, %ymm7, %ymm8
	vpaddq	%ymm4, %ymm6, %ymm6
	vpsrlq	$53, %ymm8, %ymm7
	vpsllq	$23, %ymm6, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm7, %ymm8, %ymm7
	vpsrlq	$41, %ymm6, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm6
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$27, %ymm5, %ymm6
	vpsllq	$37, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm8
	vpsrlq	$5, %ymm9, %ymm5
	vpsllq	$59, %ymm9, %ymm6
	vpor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm6, %ymm8, %ymm9
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm9, %ymm4
	vpxor	%ymm7, %ymm9, %ymm7
	vpaddq	1320(%rsp), %ymm6, %ymm11
	vpaddq	1192(%rsp), %ymm5, %ymm8
	vpaddq	1480(%rsp), %ymm4, %ymm12
	vpaddq	%ymm12, %ymm8, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm9, %ymm10, %ymm13
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$53, %ymm13, %ymm10
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$11, %ymm13, %ymm13
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm10, %ymm13, %ymm10
	vpor	%ymm11, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm15, %ymm9
	vpaddq	.LC4(%rip), %ymm15, %ymm15
	vpaddq	%ymm8, %ymm9, %ymm8
	vpaddq	%ymm12, %ymm15, %ymm12
	vpsrlq	$27, %ymm8, %ymm9
	vpsllq	$37, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm13
	vpsrlq	$5, %ymm12, %ymm8
	vpsllq	$59, %ymm12, %ymm12
	vpor	%ymm8, %ymm12, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm13, %ymm12
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm8, %ymm13, %ymm13
	vpxor	%ymm11, %ymm12, %ymm11
	vpxor	%ymm10, %ymm12, %ymm10
	vpaddq	_ZL14preCompConstV4+832(%rip), %ymm9, %ymm9
	vpaddq	_ZL14preCompConstV4+864(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+768(%rip), %ymm11, %ymm11
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	_ZL14preCompConstV4+800(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vpaddq	%ymm11, %ymm6, %ymm6
	vmovdqa	%ymm11, 1320(%rsp)
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vmovdqa	%ymm8, 1192(%rsp)
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+896(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+928(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+960(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+992(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm13
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vpaddq	%ymm13, %ymm8, %ymm8
	vmovdqa	%ymm9, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm8, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm9
	vmovdqa	%ymm0, 1000(%rsp)
	vpaddq	%ymm9, %ymm11, %ymm11
	vpaddq	%ymm3, %ymm8, %ymm0
	vpsrlq	$53, %ymm11, %ymm12
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm12
	vpaddq	.LC2(%rip), %ymm3, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm11, %ymm9, %ymm14
	vpaddq	.LC3(%rip), %ymm0, %ymm11
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	%ymm2, %ymm11, %ymm11
	vpaddq	%ymm1, %ymm0, %ymm0
	vpsrlq	$27, %ymm11, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpor	%ymm9, %ymm11, %ymm9
	vpsrlq	$5, %ymm0, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vmovdqa	%ymm13, 1096(%rsp)
	vpxor	%ymm14, %ymm12, %ymm0
	vpxor	%ymm11, %ymm9, %ymm13
	vpxor	%ymm0, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm14, %ymm13, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm11, %ymm6, %ymm11
	vpaddq	%ymm0, %ymm5, %ymm5
	vpaddq	%ymm14, %ymm4, %ymm14
	vpaddq	%ymm14, %ymm5, %ymm0
	vpaddq	%ymm12, %ymm7, %ymm12
	vpaddq	%ymm11, %ymm12, %ymm9
	vpaddq	.LC1(%rip), %ymm12, %ymm12
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm0, %ymm12, %ymm4
	vpaddq	%ymm0, %ymm11, %ymm11
	vpsrlq	$53, %ymm4, %ymm6
	vpsllq	$23, %ymm11, %ymm0
	vpsllq	$11, %ymm4, %ymm4
	vpor	%ymm6, %ymm4, %ymm12
	vpsrlq	$41, %ymm11, %ymm4
	vpor	%ymm4, %ymm0, %ymm0
	vpaddq	.LC3(%rip), %ymm9, %ymm4
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm4, %ymm5
	vpaddq	%ymm14, %ymm9, %ymm14
	vpsrlq	$27, %ymm5, %ymm4
	vpsllq	$37, %ymm5, %ymm5
	vpor	%ymm4, %ymm5, %ymm7
	vpsrlq	$5, %ymm14, %ymm4
	vpsllq	$59, %ymm14, %ymm5
	vmovq	128(%rcx), %xmm14
	vpor	%ymm4, %ymm5, %ymm5
	vpinsrq	$1, 192(%rcx), %xmm14, %xmm9
	vmovq	(%rcx), %xmm14
	vpinsrq	$1, 64(%rcx), %xmm14, %xmm11
	vpxor	%ymm5, %ymm7, %ymm6
	vpxor	%ymm0, %ymm12, %ymm4
	vinserti128	$0x1, %xmm9, %ymm11, %ymm9
	vpxor	%ymm0, %ymm6, %ymm0
	vpxor	%ymm12, %ymm6, %ymm6
	vpxor	%ymm4, %ymm5, %ymm5
	vpxor	%ymm4, %ymm7, %ymm4
	vpaddq	1480(%rsp), %ymm0, %ymm12
	vpaddq	%ymm6, %ymm10, %ymm10
	vpxor	%ymm9, %ymm10, %ymm10
	vpaddq	1320(%rsp), %ymm5, %ymm7
	vpaddq	1192(%rsp), %ymm4, %ymm13
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 64(%rdx)
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 128(%rdx)
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 192(%rdx)
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 256(%rdx)
	vmovq	136(%rcx), %xmm11
	vmovq	8(%rcx), %xmm14
	vpinsrq	$1, 200(%rcx), %xmm11, %xmm9
	vpinsrq	$1, 72(%rcx), %xmm14, %xmm11
	vinserti128	$0x1, %xmm9, %ymm11, %ymm11
	vpxor	%ymm11, %ymm7, %ymm11
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 72(%rdx)
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 136(%rdx)
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 200(%rdx)
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 264(%rdx)
	vmovq	144(%rcx), %xmm9
	vmovq	16(%rcx), %xmm14
	vpinsrq	$1, 208(%rcx), %xmm9, %xmm7
	vpinsrq	$1, 80(%rcx), %xmm14, %xmm9
	vinserti128	$0x1, %xmm7, %ymm9, %ymm9
	vpxor	%ymm9, %ymm13, %ymm9
	vmovdqu	%ymm9, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 80(%rdx)
	vmovdqu	%ymm9, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 144(%rdx)
	vmovdqu	%ymm9, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 208(%rdx)
	vmovdqu	%ymm9, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 272(%rdx)
	vmovq	152(%rcx), %xmm13
	vmovq	24(%rcx), %xmm14
	vpinsrq	$1, 216(%rcx), %xmm13, %xmm7
	vpinsrq	$1, 88(%rcx), %xmm14, %xmm13
	vinserti128	$0x1, %xmm7, %ymm13, %ymm7
	vpxor	%ymm7, %ymm12, %ymm7
	vmovdqu	%ymm7, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 88(%rdx)
	vmovdqu	%ymm7, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 152(%rdx)
	vmovdqu	%ymm7, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 216(%rdx)
	vmovdqu	%ymm7, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 280(%rdx)
	vmovq	160(%rcx), %xmm13
	vmovq	32(%rcx), %xmm14
	vpinsrq	$1, 224(%rcx), %xmm13, %xmm12
	vpinsrq	$1, 96(%rcx), %xmm14, %xmm13
	vinserti128	$0x1, %xmm12, %ymm13, %ymm12
	vpxor	%ymm12, %ymm8, %ymm8
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 96(%rdx)
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 160(%rdx)
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 224(%rdx)
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 288(%rdx)
	vmovq	168(%rcx), %xmm13
	vmovq	40(%rcx), %xmm14
	vpinsrq	$1, 232(%rcx), %xmm13, %xmm12
	vpinsrq	$1, 104(%rcx), %xmm14, %xmm13
	vinserti128	$0x1, %xmm12, %ymm13, %ymm12
	vpxor	%ymm12, %ymm3, %ymm3
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 104(%rdx)
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 168(%rdx)
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 232(%rdx)
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 296(%rdx)
	vmovq	176(%rcx), %xmm13
	vmovq	48(%rcx), %xmm14
	vpinsrq	$1, 240(%rcx), %xmm13, %xmm12
	vpinsrq	$1, 112(%rcx), %xmm14, %xmm13
	vinserti128	$0x1, %xmm12, %ymm13, %ymm12
	vpxor	%ymm12, %ymm2, %ymm2
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 112(%rdx)
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 176(%rdx)
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 240(%rdx)
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 304(%rdx)
	vmovq	184(%rcx), %xmm13
	vmovq	56(%rcx), %xmm14
	vpinsrq	$1, 248(%rcx), %xmm13, %xmm12
	vpinsrq	$1, 120(%rcx), %xmm14, %xmm13
	addq	$256, %rcx
	vinserti128	$0x1, %xmm12, %ymm13, %ymm12
	vpaddq	%ymm7, %ymm9, %ymm13
	vpxor	%ymm12, %ymm1, %ymm1
	vpaddq	%ymm11, %ymm10, %ymm12
	vmovdqu	%ymm1, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 120(%rdx)
	vmovdqu	%ymm1, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 184(%rdx)
	vmovdqu	%ymm1, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 248(%rdx)
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm13, %ymm10, %ymm14
	vpaddq	%ymm13, %ymm11, %ymm13
	vpsrlq	$53, %ymm14, %ymm10
	vpsrlq	$41, %ymm13, %ymm11
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm13, %ymm13
	vpor	%ymm10, %ymm14, %ymm10
	vmovdqu	%ymm1, 1512(%rsp)
	vpor	%ymm11, %ymm13, %ymm11
	vpaddq	.LC3(%rip), %ymm12, %ymm13
	vpaddq	.LC4(%rip), %ymm12, %ymm12
	vpaddq	%ymm9, %ymm13, %ymm9
	vpaddq	%ymm7, %ymm12, %ymm7
	vpsrlq	$27, %ymm9, %ymm13
	vpsllq	$37, %ymm9, %ymm9
	vpor	%ymm13, %ymm9, %ymm13
	vpsrlq	$5, %ymm7, %ymm9
	vpsllq	$59, %ymm7, %ymm7
	vpor	%ymm9, %ymm7, %ymm9
	movq	1536(%rsp), %rdi
	vpxor	%ymm11, %ymm10, %ymm7
	vpxor	%ymm9, %ymm13, %ymm12
	movq	%rdi, 312(%rdx)
	vpxor	%ymm7, %ymm9, %ymm9
	addq	$256, %rdx
	vpxor	%ymm7, %ymm13, %ymm13
	cmpq	%rax, %rsi
	vpxor	%ymm11, %ymm12, %ymm11
	vpxor	%ymm10, %ymm12, %ymm10
	vpaddq	_ZL14preCompConstV4+64(%rip), %ymm9, %ymm9
	vpaddq	_ZL14preCompConstV4+96(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4(%rip), %ymm11, %ymm11
	vpaddq	%ymm11, %ymm13, %ymm7
	vpaddq	_ZL14preCompConstV4+32(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm14
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm13, %ymm14, %ymm14
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm14, %ymm13
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm14, %ymm14
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm13, %ymm14, %ymm13
	vpor	%ymm12, %ymm11, %ymm14
	vpaddq	%ymm7, %ymm10, %ymm11
	vpaddq	%ymm7, %ymm9, %ymm7
	vpsrlq	$33, %ymm11, %ymm10
	vpsrlq	$11, %ymm7, %ymm9
	vpsllq	$31, %ymm11, %ymm11
	vpsllq	$53, %ymm7, %ymm7
	vpor	%ymm10, %ymm11, %ymm10
	vpor	%ymm9, %ymm7, %ymm9
	vpxor	%ymm14, %ymm13, %ymm15
	vpxor	%ymm9, %ymm10, %ymm7
	vpxor	%ymm9, %ymm15, %ymm9
	vpxor	%ymm10, %ymm15, %ymm15
	vpxor	%ymm7, %ymm14, %ymm14
	vpxor	%ymm7, %ymm13, %ymm7
	vpaddq	%ymm9, %ymm0, %ymm0
	vmovdqa	%ymm9, 1480(%rsp)
	vpaddq	%ymm6, %ymm15, %ymm6
	vpaddq	%ymm14, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm9
	vpaddq	.LC7(%rip), %ymm6, %ymm6
	vpaddq	%ymm7, %ymm4, %ymm4
	vpaddq	.LC5(%rip), %ymm9, %ymm10
	vmovdqa	%ymm7, 1192(%rsp)
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm0, %ymm4, %ymm7
	vpaddq	%ymm4, %ymm10, %ymm10
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$57, %ymm10, %ymm4
	vpsrlq	$45, %ymm0, %ymm9
	vpsllq	$7, %ymm10, %ymm10
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm4, %ymm10, %ymm4
	vpor	%ymm9, %ymm0, %ymm9
	vpaddq	.LC8(%rip), %ymm5, %ymm5
	vpaddq	%ymm7, %ymm6, %ymm0
	vpaddq	%ymm7, %ymm5, %ymm5
	vpsrlq	$33, %ymm0, %ymm6
	vpsllq	$53, %ymm5, %ymm7
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm6, %ymm0, %ymm6
	vpsrlq	$11, %ymm5, %ymm0
	vpor	%ymm0, %ymm7, %ymm7
	vmovdqa	%ymm14, 1320(%rsp)
	vpxor	%ymm9, %ymm4, %ymm11
	vpxor	%ymm7, %ymm6, %ymm0
	vpxor	%ymm7, %ymm11, %ymm7
	vpxor	%ymm6, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm4, %ymm6
	vpaddq	%ymm1, %ymm2, %ymm4
	vpaddq	%ymm3, %ymm8, %ymm0
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm4, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm3, %ymm3
	vpsrlq	$53, %ymm8, %ymm5
	vpsllq	$23, %ymm3, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm5, %ymm8, %ymm5
	vpsrlq	$41, %ymm3, %ymm8
	vpaddq	.LC3(%rip), %ymm0, %ymm3
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm0, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsrlq	$5, %ymm1, %ymm0
	vpsllq	$37, %ymm2, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm3, %ymm2, %ymm2
	vpor	%ymm0, %ymm1, %ymm3
	vpxor	%ymm4, %ymm5, %ymm0
	vpxor	%ymm3, %ymm2, %ymm1
	vpxor	%ymm0, %ymm3, %ymm3
	vpxor	%ymm0, %ymm2, %ymm2
	vpxor	%ymm4, %ymm1, %ymm4
	vpxor	%ymm5, %ymm1, %ymm1
	vpaddq	%ymm3, %ymm9, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm4, %ymm7, %ymm4
	vpaddq	%ymm4, %ymm2, %ymm0
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm3, %ymm1, %ymm5
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm5, %ymm8
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	.LC6(%rip), %ymm5, %ymm5
	vpaddq	%ymm2, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm5, %ymm4
	vpsrlq	$57, %ymm8, %ymm2
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$7, %ymm8, %ymm8
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm2, %ymm8, %ymm2
	vpor	%ymm5, %ymm4, %ymm5
	vpaddq	%ymm0, %ymm1, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm0
	vpsrlq	$33, %ymm4, %ymm1
	vpsrlq	$11, %ymm0, %ymm3
	vpsllq	$31, %ymm4, %ymm4
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm4, %ymm1
	vpor	%ymm3, %ymm0, %ymm3
	vpxor	%ymm5, %ymm2, %ymm10
	vpxor	%ymm3, %ymm1, %ymm0
	vpxor	%ymm3, %ymm10, %ymm3
	vpxor	%ymm1, %ymm10, %ymm10
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm0, %ymm2, %ymm2
	vpaddq	1128(%rsp), %ymm3, %ymm12
	vpaddq	1096(%rsp), %ymm10, %ymm14
	vpaddq	1064(%rsp), %ymm5, %ymm8
	vpaddq	%ymm8, %ymm14, %ymm13
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	1000(%rsp), %ymm2, %ymm0
	vpaddq	.LC5(%rip), %ymm13, %ymm4
	vpaddq	%ymm12, %ymm0, %ymm1
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm1, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	.LC8(%rip), %ymm8, %ymm8
	vpsrlq	$57, %ymm0, %ymm4
	vpaddq	%ymm1, %ymm8, %ymm8
	vpsllq	$7, %ymm0, %ymm0
	vpsllq	$53, %ymm8, %ymm1
	vpor	%ymm4, %ymm0, %ymm0
	vpsrlq	$45, %ymm12, %ymm4
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm4, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm4
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm4, %ymm12, %ymm12
	vpsrlq	$11, %ymm8, %ymm4
	vpor	%ymm4, %ymm1, %ymm1
	vpxor	%ymm13, %ymm0, %ymm14
	vpxor	%ymm1, %ymm12, %ymm4
	vpxor	%ymm1, %ymm14, %ymm1
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm4, %ymm13, %ymm13
	vpxor	%ymm4, %ymm0, %ymm4
	vpaddq	_ZL14preCompConstV4+128(%rip), %ymm1, %ymm1
	vpaddq	_ZL14preCompConstV4+160(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+192(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm8
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+224(%rip), %ymm4, %ymm4
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm1, %ymm4, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm0
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm0, %ymm14, %ymm0
	vpor	%ymm13, %ymm12, %ymm13
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm4, %ymm12, %ymm4
	vpaddq	%ymm1, %ymm8, %ymm1
	vpsrlq	$27, %ymm4, %ymm12
	vpsrlq	$5, %ymm1, %ymm8
	vpsllq	$37, %ymm4, %ymm4
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm12, %ymm4, %ymm4
	vpor	%ymm8, %ymm1, %ymm8
	vpxor	%ymm13, %ymm0, %ymm1
	vpxor	%ymm8, %ymm4, %ymm12
	vpxor	%ymm1, %ymm8, %ymm8
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm13, %ymm12, %ymm13
	vpxor	%ymm0, %ymm12, %ymm0
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	%ymm1, %ymm2, %ymm2
	vmovdqa	%ymm13, 1128(%rsp)
	vpaddq	%ymm13, %ymm3, %ymm3
	vmovdqa	%ymm8, 1096(%rsp)
	vpaddq	%ymm0, %ymm10, %ymm10
	vpaddq	%ymm5, %ymm10, %ymm8
	vmovdqa	%ymm1, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	%ymm3, %ymm2, %ymm1
	vpaddq	.LC2(%rip), %ymm5, %ymm5
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm5, %ymm5
	vpsrlq	$53, %ymm10, %ymm4
	vpsllq	$23, %ymm5, %ymm1
	vpsllq	$11, %ymm10, %ymm10
	vpor	%ymm4, %ymm10, %ymm4
	vpsrlq	$41, %ymm5, %ymm10
	vpaddq	.LC3(%rip), %ymm8, %ymm5
	vpor	%ymm10, %ymm1, %ymm1
	vpaddq	%ymm2, %ymm5, %ymm2
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpsrlq	$27, %ymm2, %ymm5
	vpaddq	%ymm3, %ymm8, %ymm8
	vpsllq	$37, %ymm2, %ymm2
	vpsllq	$59, %ymm8, %ymm3
	vpor	%ymm5, %ymm2, %ymm5
	vpsrlq	$5, %ymm8, %ymm2
	vpor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm3, %ymm5, %ymm8
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm5, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm9, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm7, %ymm7
	vpaddq	%ymm7, %ymm6, %ymm5
	vpaddq	%ymm4, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm10
	vpaddq	.LC1(%rip), %ymm11, %ymm11
	vpaddq	.LC2(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm11, %ymm11
	vpaddq	%ymm5, %ymm9, %ymm9
	vpsrlq	$53, %ymm11, %ymm8
	vpsllq	$23, %ymm9, %ymm5
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm8, %ymm11, %ymm8
	vpsrlq	$41, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm10, %ymm9
	vpor	%ymm11, %ymm5, %ymm5
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpsrlq	$27, %ymm6, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpsllq	$37, %ymm6, %ymm6
	vpsllq	$59, %ymm10, %ymm7
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$5, %ymm10, %ymm6
	vpor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm7, %ymm9, %ymm10
	vpxor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpxor	%ymm5, %ymm10, %ymm5
	vpxor	%ymm8, %ymm10, %ymm8
	vpaddq	1320(%rsp), %ymm7, %ymm14
	vpaddq	1192(%rsp), %ymm6, %ymm13
	vpaddq	1480(%rsp), %ymm5, %ymm9
	vpaddq	%ymm9, %ymm13, %ymm12
	vpaddq	%ymm8, %ymm15, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm10
	vpaddq	.LC1(%rip), %ymm15, %ymm15
	vpaddq	.LC2(%rip), %ymm14, %ymm14
	vpaddq	%ymm12, %ymm15, %ymm15
	vpaddq	%ymm12, %ymm14, %ymm14
	vpsrlq	$53, %ymm15, %ymm11
	vpsllq	$23, %ymm14, %ymm12
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm11, %ymm15, %ymm11
	vpsrlq	$41, %ymm14, %ymm15
	vpaddq	.LC3(%rip), %ymm10, %ymm14
	vpor	%ymm15, %ymm12, %ymm12
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpaddq	%ymm13, %ymm14, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$27, %ymm13, %ymm14
	vpsrlq	$5, %ymm9, %ymm10
	vpsllq	$37, %ymm13, %ymm13
	vpsllq	$59, %ymm9, %ymm9
	vpor	%ymm14, %ymm13, %ymm14
	vpor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm12, %ymm11, %ymm9
	vpxor	%ymm10, %ymm14, %ymm13
	vpxor	%ymm9, %ymm10, %ymm10
	vpxor	%ymm9, %ymm14, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm11, %ymm13, %ymm11
	vpaddq	_ZL14preCompConstV4+320(%rip), %ymm10, %ymm10
	vpaddq	_ZL14preCompConstV4+352(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+256(%rip), %ymm12, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm9
	vpaddq	_ZL14preCompConstV4+288(%rip), %ymm11, %ymm11
	vpaddq	%ymm10, %ymm11, %ymm13
	vpaddq	.LC7(%rip), %ymm11, %ymm11
	vpaddq	.LC5(%rip), %ymm13, %ymm15
	vpaddq	.LC8(%rip), %ymm10, %ymm10
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm14, %ymm15, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$57, %ymm14, %ymm15
	vpsrlq	$45, %ymm12, %ymm13
	vpsllq	$7, %ymm14, %ymm14
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	%ymm9, %ymm11, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$33, %ymm13, %ymm11
	vpsrlq	$11, %ymm9, %ymm10
	vpsllq	$31, %ymm13, %ymm13
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm11, %ymm13, %ymm11
	vpor	%ymm10, %ymm9, %ymm13
	vpxor	%ymm12, %ymm14, %ymm10
	vpxor	%ymm13, %ymm11, %ymm9
	vpxor	%ymm13, %ymm10, %ymm13
	vpxor	%ymm11, %ymm10, %ymm10
	vpxor	%ymm9, %ymm12, %ymm12
	vpxor	%ymm9, %ymm14, %ymm9
	vpaddq	%ymm13, %ymm5, %ymm5
	vmovdqa	%ymm13, 1480(%rsp)
	vpaddq	%ymm8, %ymm10, %ymm8
	vpaddq	%ymm12, %ymm7, %ymm7
	vmovdqa	%ymm12, 1320(%rsp)
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	%ymm9, %ymm6, %ymm6
	vpaddq	.LC7(%rip), %ymm8, %ymm8
	vpaddq	%ymm5, %ymm6, %ymm12
	vpaddq	.LC8(%rip), %ymm7, %ymm7
	vmovdqa	%ymm9, 1192(%rsp)
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$57, %ymm6, %ymm9
	vpsllq	$7, %ymm6, %ymm6
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$45, %ymm5, %ymm6
	vpsllq	$19, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm11
	vpaddq	%ymm12, %ymm8, %ymm5
	vpaddq	%ymm12, %ymm7, %ymm12
	vpsrlq	$33, %ymm5, %ymm6
	vpsllq	$31, %ymm5, %ymm8
	vpsrlq	$11, %ymm12, %ymm5
	vpor	%ymm6, %ymm8, %ymm8
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm5, %ymm12, %ymm5
	vpxor	%ymm11, %ymm9, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm5, %ymm7, %ymm5
	vpxor	%ymm8, %ymm7, %ymm8
	vpxor	%ymm6, %ymm11, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm3, %ymm4, %ymm11
	vpaddq	.LC7(%rip), %ymm4, %ymm4
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm12
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm2, %ymm9, %ymm2
	vpsrlq	$57, %ymm2, %ymm9
	vpsllq	$7, %ymm2, %ymm2
	vpor	%ymm9, %ymm2, %ymm9
	vpsrlq	$45, %ymm1, %ymm2
	vpsllq	$19, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm11
	vpaddq	%ymm12, %ymm4, %ymm1
	vpaddq	%ymm12, %ymm3, %ymm12
	vpsrlq	$33, %ymm1, %ymm2
	vpsllq	$31, %ymm1, %ymm4
	vpsrlq	$11, %ymm12, %ymm1
	vpor	%ymm2, %ymm4, %ymm4
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm1, %ymm12, %ymm1
	vpxor	%ymm11, %ymm9, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm1, %ymm3, %ymm1
	vpxor	%ymm4, %ymm3, %ymm4
	vpxor	%ymm2, %ymm11, %ymm3
	vpxor	%ymm2, %ymm9, %ymm2
	vpaddq	1128(%rsp), %ymm1, %ymm13
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	1096(%rsp), %ymm3, %ymm12
	vpaddq	%ymm12, %ymm0, %ymm14
	vpaddq	.LC8(%rip), %ymm12, %ymm12
	vpaddq	1064(%rsp), %ymm2, %ymm11
	vpaddq	.LC5(%rip), %ymm14, %ymm15
	vpaddq	%ymm13, %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm14, %ymm14
	vpaddq	%ymm11, %ymm15, %ymm11
	vpaddq	%ymm13, %ymm14, %ymm13
	vpsrlq	$57, %ymm11, %ymm15
	vpsrlq	$45, %ymm13, %ymm14
	vpaddq	.LC7(%rip), %ymm0, %ymm0
	vpsllq	$7, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm0, %ymm0
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm12, %ymm9
	vpsllq	$19, %ymm13, %ymm13
	vpor	%ymm14, %ymm13, %ymm13
	vpsrlq	$33, %ymm0, %ymm14
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm14, %ymm0, %ymm14
	vpsrlq	$11, %ymm9, %ymm0
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm13, %ymm11, %ymm12
	vpxor	%ymm0, %ymm14, %ymm9
	vpxor	%ymm0, %ymm12, %ymm0
	vpxor	%ymm14, %ymm12, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+384(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+416(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+448(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+480(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm4, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm4, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm4, %ymm4
	vpor	%ymm9, %ymm4, %ymm9
	vpsrlq	$41, %ymm3, %ymm4
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm4, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm4
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm4, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm7, %ymm7
	vpaddq	%ymm1, %ymm6, %ymm6
	vpaddq	%ymm0, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm4
	vpaddq	%ymm3, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	.LC2(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm7, %ymm7
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm7, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm7, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm7
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm7, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$27, %ymm6, %ymm7
	vpsllq	$37, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm8
	vpsrlq	$5, %ymm5, %ymm6
	vpsllq	$59, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm6
	vpxor	%ymm4, %ymm9, %ymm5
	vpxor	%ymm6, %ymm8, %ymm7
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm7, %ymm4
	vpxor	%ymm9, %ymm7, %ymm7
	vpaddq	1320(%rsp), %ymm6, %ymm12
	vpaddq	1192(%rsp), %ymm5, %ymm9
	vpaddq	1480(%rsp), %ymm4, %ymm13
	vpaddq	%ymm13, %ymm9, %ymm11
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm12, %ymm10, %ymm8
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	%ymm11, %ymm12, %ymm12
	vpsrlq	$53, %ymm15, %ymm10
	vpsllq	$23, %ymm12, %ymm11
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm10, %ymm15, %ymm10
	vpsrlq	$41, %ymm12, %ymm15
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm9, %ymm12, %ymm9
	vpaddq	%ymm13, %ymm8, %ymm13
	vpsrlq	$27, %ymm9, %ymm12
	vpsrlq	$5, %ymm13, %ymm8
	vpsllq	$37, %ymm9, %ymm9
	vpsllq	$59, %ymm13, %ymm13
	vpor	%ymm12, %ymm9, %ymm12
	vpor	%ymm8, %ymm13, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm12, %ymm13
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm11, %ymm13, %ymm11
	vpxor	%ymm10, %ymm13, %ymm10
	vpaddq	_ZL14preCompConstV4+576(%rip), %ymm9, %ymm9
	vpxor	%ymm8, %ymm12, %ymm13
	vpaddq	_ZL14preCompConstV4+512(%rip), %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+544(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	_ZL14preCompConstV4+608(%rip), %ymm13, %ymm13
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vpaddq	%ymm11, %ymm6, %ymm6
	vmovdqa	%ymm11, 1320(%rsp)
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vmovdqa	%ymm8, 1192(%rsp)
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+640(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+672(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+704(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+736(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm8, %ymm8
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm3, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm8, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm8
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm8, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm9
	vpaddq	%ymm9, %ymm5, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm7
	vpaddq	%ymm6, %ymm7, %ymm11
	vpaddq	.LC1(%rip), %ymm7, %ymm7
	vpaddq	.LC2(%rip), %ymm6, %ymm6
	vpaddq	%ymm4, %ymm7, %ymm8
	vpaddq	%ymm4, %ymm6, %ymm6
	vpsrlq	$53, %ymm8, %ymm7
	vpsllq	$23, %ymm6, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm7, %ymm8, %ymm7
	vpsrlq	$41, %ymm6, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm6
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$27, %ymm5, %ymm6
	vpsllq	$37, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm8
	vpsrlq	$5, %ymm9, %ymm5
	vpsllq	$59, %ymm9, %ymm6
	vpor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm6, %ymm8, %ymm9
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm9, %ymm4
	vpxor	%ymm7, %ymm9, %ymm7
	vpaddq	1320(%rsp), %ymm6, %ymm11
	vpaddq	1192(%rsp), %ymm5, %ymm8
	vpaddq	1480(%rsp), %ymm4, %ymm12
	vpaddq	%ymm12, %ymm8, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm9, %ymm10, %ymm13
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$53, %ymm13, %ymm10
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$11, %ymm13, %ymm13
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm10, %ymm13, %ymm10
	vpor	%ymm11, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm15, %ymm9
	vpaddq	.LC4(%rip), %ymm15, %ymm15
	vpaddq	%ymm8, %ymm9, %ymm8
	vpaddq	%ymm12, %ymm15, %ymm12
	vpsrlq	$27, %ymm8, %ymm9
	vpsllq	$37, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm13
	vpsrlq	$5, %ymm12, %ymm8
	vpsllq	$59, %ymm12, %ymm12
	vpor	%ymm8, %ymm12, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm13, %ymm12
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm8, %ymm13, %ymm13
	vpxor	%ymm11, %ymm12, %ymm11
	vpxor	%ymm10, %ymm12, %ymm10
	vpaddq	_ZL14preCompConstV4+832(%rip), %ymm9, %ymm9
	vpaddq	_ZL14preCompConstV4+864(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+768(%rip), %ymm11, %ymm11
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	_ZL14preCompConstV4+800(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vmovdqa	%ymm11, 1320(%rsp)
	vpaddq	%ymm11, %ymm6, %ymm6
	vpaddq	%ymm6, %ymm7, %ymm9
	vmovdqa	%ymm8, 1192(%rsp)
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+896(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+928(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+960(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+992(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vpaddq	%ymm12, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm9
	vpaddq	%ymm14, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm0
	vpaddq	.LC1(%rip), %ymm8, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm11
	vpsrlq	$53, %ymm11, %ymm12
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm12
	vpaddq	.LC2(%rip), %ymm3, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm11, %ymm9, %ymm14
	vpaddq	.LC3(%rip), %ymm0, %ymm11
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	%ymm2, %ymm11, %ymm11
	vpaddq	%ymm1, %ymm0, %ymm0
	vpsrlq	$27, %ymm11, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpor	%ymm9, %ymm11, %ymm9
	vpsrlq	$5, %ymm0, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpxor	%ymm14, %ymm12, %ymm0
	vpxor	%ymm11, %ymm9, %ymm13
	vpxor	%ymm0, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm14, %ymm13, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm11, %ymm6, %ymm11
	vpaddq	%ymm0, %ymm5, %ymm0
	vpaddq	%ymm14, %ymm4, %ymm14
	vpaddq	%ymm14, %ymm0, %ymm5
	vpaddq	%ymm12, %ymm7, %ymm12
	vpaddq	%ymm11, %ymm12, %ymm4
	vpaddq	.LC1(%rip), %ymm12, %ymm12
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm5, %ymm12, %ymm12
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$53, %ymm12, %ymm6
	vpsllq	$11, %ymm12, %ymm12
	vpor	%ymm6, %ymm12, %ymm12
	vpsrlq	$41, %ymm5, %ymm6
	vpsllq	$23, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm6
	vpaddq	.LC3(%rip), %ymm4, %ymm5
	vpaddq	.LC4(%rip), %ymm4, %ymm4
	vpaddq	%ymm0, %ymm5, %ymm0
	vpaddq	%ymm14, %ymm4, %ymm14
	vpsrlq	$27, %ymm0, %ymm5
	vpsllq	$37, %ymm0, %ymm0
	vpor	%ymm5, %ymm0, %ymm5
	vpsrlq	$5, %ymm14, %ymm0
	vpsllq	$59, %ymm14, %ymm14
	vpor	%ymm0, %ymm14, %ymm4
	vpxor	%ymm6, %ymm12, %ymm0
	vpxor	%ymm4, %ymm5, %ymm7
	vpxor	%ymm0, %ymm4, %ymm4
	vpxor	%ymm0, %ymm5, %ymm0
	vpxor	%ymm6, %ymm7, %ymm6
	vpxor	%ymm12, %ymm7, %ymm12
	vpaddq	1320(%rsp), %ymm4, %ymm4
	vpaddq	1192(%rsp), %ymm0, %ymm0
	vpaddq	1480(%rsp), %ymm6, %ymm6
	vpaddq	%ymm12, %ymm10, %ymm10
	vpaddq	1352(%rsp), %ymm10, %ymm10
	vmovdqa	%ymm10, 1352(%rsp)
	vpaddq	1288(%rsp), %ymm4, %ymm4
	vpaddq	1224(%rsp), %ymm0, %ymm0
	vpaddq	1448(%rsp), %ymm6, %ymm6
	vpaddq	1256(%rsp), %ymm8, %ymm8
	vpaddq	1416(%rsp), %ymm3, %ymm3
	vpaddq	1384(%rsp), %ymm2, %ymm2
	vpaddq	1032(%rsp), %ymm1, %ymm1
	vmovdqa	%ymm10, 1800(%rsp)
	vmovdqa	%ymm4, 1288(%rsp)
	vmovdqa	%ymm4, 1832(%rsp)
	vmovdqa	%ymm0, 1224(%rsp)
	vmovdqa	%ymm0, 1864(%rsp)
	vmovdqa	%ymm6, 1448(%rsp)
	vmovdqa	%ymm6, 1896(%rsp)
	vmovdqa	%ymm8, 1256(%rsp)
	vmovdqa	%ymm8, 1928(%rsp)
	vmovdqa	%ymm3, 1416(%rsp)
	vmovdqa	%ymm3, 1960(%rsp)
	vmovdqa	%ymm2, 1384(%rsp)
	vmovdqa	%ymm2, 1992(%rsp)
	vmovdqa	%ymm1, 1032(%rsp)
	vmovdqa	%ymm1, 2024(%rsp)
	jne	.L20
	movq	240(%rsp), %rcx
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	%rdx, 200(%rsp)
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 240(%rsp)
.L21:
	vmovdqa	1800(%rsp), %ymm0
	movq	104(%rsp), %r10
	salq	$2, %rax
	movq	%rax, 232(%rsp)
	vpshufd	$14, %ymm0, %ymm1
	shrq	$6, %r10
	cmpq	%rax, %r10
	movq	%r10, 264(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rbx
	vmovdqa	1832(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rbx, 1544(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %r8
	vmovdqa	1864(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%r8, 1552(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rdi
	vmovdqa	1896(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rdi, 1560(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rsi
	vmovdqa	1928(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rsi, 1568(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %r12
	vmovdqa	1960(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%r12, 1576(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rcx
	vmovdqa	1992(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rcx, 1584(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rdx
	vmovdqa	2024(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rdx, 1592(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 1096(%rsp)
	movq	1096(%rsp), %r9
	movq	%r9, 1600(%rsp)
	jbe	.L19
	leaq	0(%r13,%r11), %r9
	movq	256(%rsp), %rax
	movq	%rbx, 808(%rsp)
	movabsq	$-8247349341179448980, %rbx
	movq	%rcx, 936(%rsp)
	movq	%rsi, 904(%rsp)
	movq	%r9, 776(%rsp)
	movabsq	$7667772426219706969, %r9
	leaq	(%r14,%rbx), %rcx
	addq	%r9, %rax
	addq	776(%rsp), %rax
	leaq	(%r15,%r9), %rsi
	movabsq	$6220970056051541820, %r10
	movq	%rdi, 872(%rsp)
	movq	176(%rsp), %rdi
	addq	%r10, %r11
	movq	%rdx, 1000(%rsp)
	leaq	(%r14,%r15), %rdx
	movq	%r11, 328(%rsp)
	movabsq	$4195444129992158507, %r11
	movq	%r8, 840(%rsp)
	rorq	$41, %rax
	addq	%r11, %rdi
	addq	%r11, %r13
	movq	%rax, 1064(%rsp)
	movq	184(%rsp), %rax
	addq	176(%rsp), %rax
	movq	%r13, 360(%rsp)
	addq	%rax, %rcx
	addq	%rax, %rsi
	movq	184(%rsp), %rax
	rorq	$41, %rsi
	rorq	$53, %rcx
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
	movq	152(%rsp), %rax
	addq	144(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	168(%rsp), %rcx
	movq	%rsi, 552(%rsp)
	movq	160(%rsp), %rsi
	movq	%rdx, 616(%rsp)
	movq	160(%rsp), %rdx
	addq	%rbx, %rcx
	addq	168(%rsp), %rdx
	movq	%rdi, 680(%rsp)
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	144(%rsp), %rdi
	addq	%rax, %rsi
	movq	152(%rsp), %rax
	rorq	$53, %rcx
	rorq	$41, %rsi
	movq	%r8, 584(%rsp)
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
	movq	120(%rsp), %rax
	addq	112(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	136(%rsp), %rcx
	movq	%rsi, 392(%rsp)
	movq	128(%rsp), %rsi
	movq	%rdx, 712(%rsp)
	movq	136(%rsp), %rdx
	addq	%rbx, %rcx
	addq	128(%rsp), %rdx
	movq	%rdi, 456(%rsp)
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	112(%rsp), %rdi
	addq	%rax, %rsi
	movq	120(%rsp), %rax
	movq	%r8, 424(%rsp)
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
	movq	%rsi, 744(%rsp)
	movq	200(%rsp), %rax
	movq	%rdx, 520(%rsp)
	movq	-72(%rsp), %rdx
	movq	240(%rsp), %rcx
	movq	%r8, 488(%rsp)
	salq	$3, %rax
	movq	%rdi, 648(%rsp)
	movq	%r12, 968(%rsp)
	addq	%rax, %rdx
	addq	192(%rsp), %rax
	movq	%rdx, 1160(%rsp)
	movq	%rcx, 1224(%rsp)
	movq	%rax, 1032(%rsp)
	movq	264(%rsp), %rax
	subq	232(%rsp), %rax
	addq	240(%rsp), %rax
	movq	%rax, 296(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	addq	$1, 1224(%rsp)
	movq	256(%rsp), %rsi
	movabsq	$-8247349341179448980, %rbx
	movq	1224(%rsp), %rcx
	xorq	248(%rsp), %rcx
	movabsq	$7860495443403156170, %r9
	movq	328(%rsp), %rax
	movq	1064(%rsp), %rdx
	movabsq	$-6792583489299504353, %r12
	movq	1064(%rsp), %rdi
	movabsq	$-3833335565246798826, %r10
	movabsq	$2580067509209331373, %r14
	movabsq	$-1457182779415996031, %r11
	movabsq	$-6802927476391842224, %r13
	addq	%rcx, %rsi
	addq	776(%rsp), %rcx
	addq	%rsi, %rax
	addq	360(%rsp), %rsi
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
	movq	392(%rsp), %r10
	movabsq	$-3329063056561552456, %r11
	xorq	%rdi, %rsi
	xorq	%rcx, %rdi
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	%r15, %r12
	addq	616(%rsp), %r12
	movq	%rdx, 1352(%rsp)
	movq	%rdi, %rdx
	addq	584(%rsp), %rdx
	movq	1352(%rsp), %rax
	movq	%rsi, %rbx
	addq	680(%rsp), %rax
	addq	552(%rsp), %rbx
	movq	%rsi, 1448(%rsp)
	movabsq	$-5426079245872290139, %r14
	movq	%rdi, 1416(%rsp)
	movabsq	$-3329063056561552456, %rdi
	movq	%r15, 1384(%rsp)
	leaq	(%r12,%rdx), %rsi
	movabsq	$-1087367646907149102, %r15
	addq	%r9, %r12
	addq	%r8, %rdx
	movq	712(%rsp), %r8
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
	movq	424(%rsp), %rdx
	xorq	%rdi, %rbx
	xorq	%rax, %rdi
	movq	456(%rsp), %rax
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
	movq	744(%rsp), %r15
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
	movq	488(%rsp), %rcx
	xorq	%r11, %r8
	xorq	%rdx, %r9
	xorq	%rdx, %r11
	movq	520(%rsp), %rdx
	addq	%r8, %r15
	movq	648(%rsp), %rsi
	movq	%r15, 1480(%rsp)
	xorq	%r9, %r10
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1288(%rsp)
	addq	%r8, %rsi
	movq	%r15, 1256(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1480(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 1320(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	1384(%rsp), %r14
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
	movq	1448(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1352(%rsp), %rax
	movq	1416(%rsp), %r15
	addq	%r12, %r14
	xorq	%r13, %rdi
	movq	%r14, 1416(%rsp)
	xorq	%rdx, %r13
	movq	1416(%rsp), %rdx
	addq	%rbx, %rax
	addq	%rdi, %rsi
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r13, %r15
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
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
	movq	%r15, 1416(%rsp)
	movq	%rdx, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 1448(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1352(%rsp)
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
	movq	1288(%rsp), %r15
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
	movq	1256(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	1320(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	1480(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 1480(%rsp)
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1288(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 1256(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1480(%rsp)
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
	movq	%r14, 1320(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	1384(%rsp), %r14
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
	movq	1416(%rsp), %r15
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
	movq	1448(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1352(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 1416(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1448(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 1416(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 1352(%rsp)
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
	movq	1480(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	1320(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	1288(%rsp), %rax
	movq	1256(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 1480(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	1480(%rsp), %r11
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
	movq	%r10, 1480(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	1480(%rsp), %r10
	movq	%r10, 1480(%rsp)
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
	addq	1480(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	1480(%rsp), %rax
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
	movq	%r11, 1288(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 1256(%rsp)
	movq	%r9, 1480(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 1320(%rsp)
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
	movq	1416(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	leaq	(%rcx,%r13), %r12
	rolq	$23, %rsi
	movq	1384(%rsp), %r13
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
	movq	%r13, 1416(%rsp)
	movq	1448(%rsp), %r14
	addq	%rdi, %r15
	movq	1352(%rsp), %rax
	movabsq	$-8247349341179448980, %rdx
	addq	%r15, %r13
	addq	%rdx, %r15
	addq	%rsi, %r14
	addq	%rbx, %rax
	leaq	(%r14,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r13, 1448(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	1448(%rsp), %r13
	movq	%r13, 1448(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r15
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r14
	addq	%r15, %rax
	addq	1448(%rsp), %r14
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	1448(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r14
	movq	%r14, %r13
	xorq	%r15, %r14
	rolq	$31, %rdx
	addq	%r14, %rsi
	movq	%r14, 1448(%rsp)
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
	movq	%rsi, 1352(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 1192(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r13, 1416(%rsp)
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
	movq	1256(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	1480(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	1320(%rsp), %r10
	addq	1288(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 1128(%rsp)
	movq	%r14, 1384(%rsp)
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
	addq	1128(%rsp), %r14
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
	addq	1352(%rsp), %r9
	addq	1384(%rsp), %rbx
	movq	%rcx, preCompInternalState+64(%rip)
	movq	%r10, preCompInternalState+88(%rip)
	addq	1416(%rsp), %rcx
	addq	1192(%rsp), %r10
	movq	1032(%rsp), %r14
	movq	%r9, InternalState+40(%rip)
	leaq	(%r9,%rbx), %rsi
	movq	%rbx, InternalState+32(%rip)
	addq	%r11, %r9
	movq	%rcx, InternalState+56(%rip)
	addq	%r13, %rbx
	movq	1160(%rsp), %r13
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
	addq	1448(%rsp), %rdi
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
	movq	%rsi, 1448(%rsp)
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movq	InternalState+48(%rip), %rax
	movq	%r15, 1384(%rsp)
	movq	%rdx, 1352(%rsp)
	movabsq	$-1087367646907149102, %r11
	movq	InternalState+32(%rip), %rdx
	movq	InternalState+56(%rip), %r15
	movabsq	$-5426079245872290139, %r14
	movq	%rdi, 1416(%rsp)
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
	addq	1416(%rsp), %rdx
	xorq	%rsi, %r15
	xorq	%rsi, %rax
	addq	1384(%rsp), %r15
	addq	1352(%rsp), %rax
	movabsq	$7667772426219706969, %r10
	addq	1448(%rsp), %r13
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
	movq	%rsi, 1320(%rsp)
	leaq	(%rdx,%rcx), %rbx
	movq	%rsi, %r11
	movabsq	$-1087367646907149102, %rsi
	addq	%rax, %r11
	addq	%rax, %rsi
	leaq	(%rsi,%rbx), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1320(%rsp), %rsi
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
	movq	%r11, 1480(%rsp)
	movabsq	$5597446114060141266, %r11
	addq	1480(%rsp), %r11
	movq	%r11, 1480(%rsp)
	movabsq	$2199824780781266189, %r11
	addq	%r11, %rcx
	movabsq	$2818044418319133066, %r11
	addq	%r11, %rsi
	movabsq	$2553129884740551573, %r11
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	addq	%r11, %rdx
	movabsq	$4652647413905693402, %rbx
	addq	1480(%rsp), %rdx
	addq	%rbx, %rax
	addq	1480(%rsp), %rax
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
	movq	%rdx, 1480(%rsp)
	addq	%rbx, %r10
	movq	%rsi, 1288(%rsp)
	addq	%rdi, %rsi
	leaq	(%rsi,%r8), %rax
	leaq	(%r9,%r10), %rcx
	movq	%rbx, 1256(%rsp)
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
	movq	%r11, 1320(%rsp)
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
	movq	1416(%rsp), %r15
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
	movq	1384(%rsp), %rax
	movq	1448(%rsp), %rsi
	xorq	%r13, %r11
	xorq	%rdx, %r13
	movabsq	$-8247349341179448980, %rcx
	addq	%r13, %r15
	addq	%r12, %rax
	addq	%r11, %rsi
	movq	%rax, 1416(%rsp)
	movq	1352(%rsp), %rax
	movq	1416(%rsp), %rdx
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %r14
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	rolq	$11, %rcx
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1448(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	addq	%r15, %r13
	movq	%rdx, %rcx
	addq	%r14, %rbx
	addq	%rsi, %r11
	addq	%r12, %rcx
	movq	%r15, 1416(%rsp)
	movq	%rdx, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1352(%rsp)
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
	movq	1256(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	1320(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	1480(%rsp), %rdx
	xorq	%rax, %r8
	movq	1288(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1480(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
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
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rdx, 1480(%rsp)
	movq	%rsi, 1288(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 1256(%rsp)
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
	movq	%r14, 1320(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	1384(%rsp), %r14
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
	movq	1416(%rsp), %r15
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
	movq	1448(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1352(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 1416(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1448(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	addq	%r14, %rbx
	movq	%r15, 1416(%rsp)
	addq	%rsi, %r11
	movq	%rdx, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%r11,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 1352(%rsp)
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
	movq	1288(%rsp), %rbx
	rolq	$31, %rdx
	xorq	%rax, %r8
	movq	%rcx, %rsi
	movq	1480(%rsp), %r9
	xorq	%r8, %rcx
	xorq	%rdx, %rsi
	xorq	%rdx, %r8
	movq	1256(%rsp), %rdx
	addq	%rcx, %rbx
	movq	1320(%rsp), %r11
	xorq	%rsi, %rdi
	movq	%rbx, 1480(%rsp)
	movq	1480(%rsp), %r10
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
	addq	1480(%rsp), %r11
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
	movq	%r10, 1480(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	1480(%rsp), %r10
	movq	%r10, 1480(%rsp)
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
	addq	1480(%rsp), %r9
	addq	1480(%rsp), %rax
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
	movq	%r11, 1288(%rsp)
	addq	%rbx, %r8
	leaq	(%rcx,%rsi), %rax
	movabsq	$-8247349341179448980, %r11
	movq	%r9, 1480(%rsp)
	movq	%r10, 1320(%rsp)
	leaq	(%rdi,%r8), %r9
	movabsq	$4195444129992158507, %r10
	addq	%r11, %r8
	addq	%r10, %rcx
	movq	%rbx, 1256(%rsp)
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
	movq	1448(%rsp), %r15
	xorq	%rax, %r12
	xorq	%r9, %rbx
	xorq	%rax, %r9
	movq	1352(%rsp), %rax
	movq	1416(%rsp), %r14
	movq	1384(%rsp), %r13
	xorq	%r12, %r10
	xorq	%rdx, %r12
	addq	%r10, %r15
	movabsq	$-8247349341179448980, %rdx
	addq	%r9, %rax
	addq	%r12, %r14
	leaq	(%r15,%rax), %rcx
	addq	%rbx, %r13
	movq	%r13, 1416(%rsp)
	addq	%r14, %r13
	addq	%rdx, %r14
	leaq	(%r14,%rcx), %rdx
	movabsq	$7667772426219706969, %r14
	addq	1416(%rsp), %r14
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
	movq	%r13, 1448(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	1448(%rsp), %r13
	movq	%r13, 1448(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r14
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r15
	addq	%r14, %rax
	addq	1448(%rsp), %r15
	movabsq	$6923416813890349993, %r14
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r14, %rdx
	addq	1448(%rsp), %rdx
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
	movq	%r13, 1448(%rsp)
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
	movq	%r10, 1352(%rsp)
	movq	%r9, 1192(%rsp)
	leaq	(%rcx,%r8), %r10
	leaq	(%rdi,%rsi), %r9
	movabsq	$-3329063056561552456, %r11
	addq	%r11, %rdi
	addq	%r14, %rcx
	movq	%rbx, 1416(%rsp)
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
	movq	1256(%rsp), %rbx
	xorq	%r8, %r9
	xorq	%rsi, %r10
	movq	%r13, 1384(%rsp)
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	1480(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	1320(%rsp), %r10
	addq	1288(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 1128(%rsp)
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
	movq	1128(%rsp), %rcx
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
	addq	1416(%rsp), %rbx
	addq	1384(%rsp), %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%r9, preCompInternalState+88(%rip)
	addq	1352(%rsp), %r10
	addq	1192(%rsp), %r9
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
	addq	1448(%rsp), %r9
	xorq	%rbx, %r10
	xorq	%rbx, %r11
	movq	%r10, preCompInternalState+32(%rip)
	addq	%rax, %r12
	addq	%r15, %r10
	movq	%r11, preCompInternalState+40(%rip)
	addq	%rdx, %r11
	movq	%r11, InternalState(%rip)
	addq	%r11, 808(%rsp)
	movq	%r12, InternalState+8(%rip)
	addq	%r12, 840(%rsp)
	movq	%r9, InternalState+16(%rip)
	addq	%r9, 872(%rsp)
	movq	%r10, InternalState+24(%rip)
	addq	%r10, 904(%rsp)
	addq	%r8, 968(%rsp)
	movq	296(%rsp), %r15
	addq	%rdi, 936(%rsp)
	addq	%rsi, 1000(%rsp)
	addq	%rcx, 1096(%rsp)
	addq	$64, 1160(%rsp)
	addq	$64, 1032(%rsp)
	cmpq	%r15, 1224(%rsp)
	jne	.L22
	vmovq	872(%rsp), %xmm1
	movq	232(%rsp), %rax
	vmovq	808(%rsp), %xmm2
	movq	264(%rsp), %rcx
	vpinsrq	$1, 904(%rsp), %xmm1, %xmm0
	vmovq	1000(%rsp), %xmm3
	movq	200(%rsp), %rbx
	notq	%rax
	vpinsrq	$1, 840(%rsp), %xmm2, %xmm1
	leaq	1(%rcx,%rax), %rdx
	vmovq	968(%rsp), %xmm4
	addq	%rcx, %rax
	addq	%rdx, 240(%rsp)
	leaq	8(%rbx,%rax,8), %rbx
	movq	%rbx, 200(%rsp)
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 936(%rsp), %xmm4, %xmm1
	vmovdqa	%ymm0, 1544(%rsp)
	vpinsrq	$1, 1096(%rsp), %xmm3, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 1576(%rsp)
.L19:
	movq	104(%rsp), %rax
	andl	$63, %eax
	je	.L23
	vmovdqa	72(%rsp), %ymm9
	movq	240(%rsp), %rcx
	movabsq	$-8247349341179448980, %rsi
	movq	200(%rsp), %r8
	vmovdqa	40(%rsp), %ymm11
	vmovdqa	%ymm9, InternalState(%rip)
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %rbx
	addq	$1, %rcx
	xorq	InternalState(%rip), %rcx
	movq	InternalState+8(%rip), %r10
	salq	$3, %r8
	vmovdqa	%ymm11, InternalState+32(%rip)
	leaq	(%rbx,%rdi), %rdx
	movq	%r8, 1384(%rsp)
	vmovdqa	8(%rsp), %ymm13
	vmovdqa	-24(%rsp), %ymm14
	leaq	(%rdx,%rsi), %r9
	leaq	(%rcx,%r10), %r8
	vmovdqa	%ymm13, InternalState+64(%rip)
	vmovdqa	%ymm14, InternalState+96(%rip)
	addq	%rcx, %r9
	movabsq	$7667772426219706969, %rcx
	addq	%rcx, %r10
	rolq	$11, %r9
	leaq	(%r10,%rdx), %r11
	movabsq	$6220970056051541820, %rdx
	movabsq	$4195444129992158507, %r10
	addq	%rdx, %rdi
	addq	%r10, %rbx
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
	movq	%rbx, 1256(%rsp)
	movq	%r11, 1320(%rsp)
	movq	%r13, 1192(%rsp)
	movq	InternalState+40(%rip), %rbx
	movq	InternalState+32(%rip), %r13
	movq	InternalState+48(%rip), %r14
	movq	InternalState+56(%rip), %r11
	movq	%r12, 1480(%rsp)
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
	addq	1192(%rsp), %r12
	addq	1320(%rsp), %r11
	xorq	%rbx, %r13
	xorq	%r15, %rbx
	addq	1256(%rsp), %rbx
	addq	1480(%rsp), %r13
	movq	%r11, 1160(%rsp)
	leaq	(%r12,%rbx), %r14
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r14, 1032(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%r11, %r12
	addq	%r14, %rbx
	rolq	$7, %r12
	leaq	(%rbx,%r11), %r15
	movq	1160(%rsp), %r11
	rolq	$19, %r15
	addq	%r8, %r13
	addq	1032(%rsp), %r13
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 1032(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1096(%rsp)
	movq	%rbx, 1064(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%r11, 1128(%rsp)
	movq	InternalState+64(%rip), %rbx
	movq	InternalState+88(%rip), %r11
	addq	InternalState+80(%rip), %r11
	movq	%r13, 1032(%rsp)
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
	movq	%r12, 1160(%rsp)
	movq	%rbx, %r12
	xorq	1160(%rsp), %rbx
	xorq	%r13, %r12
	addq	1128(%rsp), %rbx
	xorq	1160(%rsp), %r13
	xorq	%r12, %r11
	xorq	%r15, %r12
	addq	1064(%rsp), %r12
	addq	1032(%rsp), %r13
	addq	1096(%rsp), %r11
	leaq	(%r12,%rbx), %r15
	movq	%r11, 1224(%rsp)
	addq	%r13, %r11
	addq	%r9, %r12
	addq	%r14, %rbx
	movq	%r15, 1160(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	1224(%rsp), %r11
	addq	%r8, %r13
	addq	1160(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	1160(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 1160(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1160(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1160(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1416(%rsp)
	movq	%rbx, 1352(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %rbx
	movq	%r11, 1448(%rsp)
	movq	InternalState+120(%rip), %r11
	addq	InternalState+112(%rip), %r11
	movq	%r13, 1160(%rsp)
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
	movq	%r12, 1224(%rsp)
	movq	%rbx, %r12
	xorq	%r13, %r12
	xorq	1224(%rsp), %r13
	addq	1160(%rsp), %r13
	xorq	%r12, %r11
	addq	1416(%rsp), %r11
	xorq	%r15, %r12
	xorq	1224(%rsp), %rbx
	addq	1352(%rsp), %r12
	addq	1448(%rsp), %rbx
	movq	%r11, 1000(%rsp)
	addq	%r13, %r11
	addq	%r8, %r13
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r11, %r12
	movq	%r15, 1288(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	1000(%rsp), %r11
	addq	1288(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 1224(%rsp)
	addq	%rdi, %r11
	addq	1288(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 1288(%rsp)
	movabsq	$-7999569951748836447, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	1224(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-4849728007900573903, %r12
	addq	%r11, %r12
	movabsq	$-1568322642145848418, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 1000(%rsp)
	movabsq	$-1642314245251606934, %r11
	addq	1288(%rsp), %r11
	addq	1000(%rsp), %r11
	movq	%rbx, 1224(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	1000(%rsp), %r11
	movq	1224(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$2553129884740551573, %r11
	addq	1288(%rsp), %r11
	addq	1224(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1224(%rsp)
	movq	%r13, %r12
	xorq	1224(%rsp), %r13
	xorq	%r15, %r12
	xorq	1224(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 936(%rsp)
	movq	%r11, %rbx
	addq	1416(%rsp), %rbx
	movq	%r13, 1000(%rsp)
	movq	936(%rsp), %r13
	addq	1352(%rsp), %r13
	movq	%r15, %r12
	addq	1160(%rsp), %r12
	movq	%r15, 1224(%rsp)
	movq	%r11, 968(%rsp)
	movq	%r13, 1160(%rsp)
	movq	1000(%rsp), %r15
	movq	%r13, %r11
	addq	1448(%rsp), %r15
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1416(%rsp)
	addq	%r15, %r11
	movq	%r15, 1448(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1160(%rsp), %r11
	movq	1416(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1448(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1416(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1448(%rsp)
	movq	%r13, %r12
	xorq	1448(%rsp), %r13
	xorq	%r15, %r12
	xorq	1448(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 840(%rsp)
	movq	%r11, %rbx
	addq	1096(%rsp), %rbx
	movq	%r13, 904(%rsp)
	movq	840(%rsp), %r13
	movq	%r15, %r12
	addq	1064(%rsp), %r13
	addq	1032(%rsp), %r12
	movq	%r15, 1448(%rsp)
	movq	904(%rsp), %r15
	addq	1128(%rsp), %r15
	movq	%r11, 872(%rsp)
	movq	%r13, 1032(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 1416(%rsp)
	movq	%r13, 1160(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	1032(%rsp), %r11
	movq	1160(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1416(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1160(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1032(%rsp)
	movq	%r13, %r12
	xorq	1032(%rsp), %r13
	xorq	%r15, %r12
	xorq	1032(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r13, 1416(%rsp)
	movq	%r15, 1032(%rsp)
	movq	%r11, 1352(%rsp)
	movq	%r12, 1288(%rsp)
	movq	%r15, %r12
	movq	1416(%rsp), %r15
	addq	1256(%rsp), %r15
	addq	1480(%rsp), %r12
	addq	1320(%rsp), %rbx
	movq	1288(%rsp), %r13
	addq	1192(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 1160(%rsp)
	movq	%r13, 1480(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1256(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	1480(%rsp), %r11
	movq	1256(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1160(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1256(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1480(%rsp)
	movq	%r13, %r12
	xorq	%r15, %r12
	xorq	1480(%rsp), %r13
	movq	%r12, 1160(%rsp)
	movq	1480(%rsp), %r12
	xorq	1160(%rsp), %rbx
	movq	%r13, 1256(%rsp)
	xorq	%r15, %r12
	movabsq	$-2292595471992902602, %r13
	addq	%r12, %r13
	movq	1160(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$8467826889434979867, %r11
	addq	%r12, %r11
	movabsq	$6028102484886760763, %r12
	addq	1256(%rsp), %r12
	movq	%r11, 1480(%rsp)
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %rbx
	movq	1480(%rsp), %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	addq	%r11, %rbx
	addq	%r12, %r13
	rolq	$7, %rbx
	rolq	$31, %r13
	movq	%rbx, 1160(%rsp)
	movabsq	$2699039428325208307, %rbx
	addq	1256(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	movq	1480(%rsp), %r11
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	1160(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	1160(%rsp), %rbx
	xorq	%r12, %r11
	movq	%r15, 1192(%rsp)
	addq	1352(%rsp), %r15
	xorq	%r13, %r12
	movq	%r11, 1480(%rsp)
	movq	%r12, 1320(%rsp)
	movq	%r12, %r13
	addq	1032(%rsp), %r13
	movq	%rbx, 1160(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r15, 1032(%rsp)
	addq	1416(%rsp), %rbx
	movq	%r15, %r11
	addq	1288(%rsp), %r12
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r11, %r12
	addq	%r14, %rbx
	addq	%r8, %r13
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	1032(%rsp), %r11
	addq	1416(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	1416(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 1416(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1416(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1416(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1096(%rsp)
	movq	%rbx, 1064(%rsp)
	movq	%rbx, %r12
	addq	872(%rsp), %r15
	addq	840(%rsp), %r12
	movq	%r11, %rbx
	addq	904(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	addq	1448(%rsp), %r13
	movq	%r11, 1128(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 1032(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	1448(%rsp), %r11
	addq	1032(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	xorq	%r12, %rbx
	movq	%rbx, 1032(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r11
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1352(%rsp)
	movq	%rbx, 1288(%rsp)
	movq	%rbx, %r12
	addq	968(%rsp), %r15
	addq	936(%rsp), %r12
	movq	%r11, %rbx
	addq	1000(%rsp), %rbx
	movq	%r13, 1032(%rsp)
	addq	1224(%rsp), %r13
	movq	%r11, 1448(%rsp)
	movq	%r15, 968(%rsp)
	movq	%r15, %r11
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 1256(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	968(%rsp), %r11
	addq	1256(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 1224(%rsp)
	xorq	%r15, %r12
	addq	%rdi, %r11
	addq	1256(%rsp), %r11
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 1256(%rsp)
	movabsq	$5953845371152580681, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	1224(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-7646712092252898442, %r12
	addq	%r11, %r12
	movabsq	$-2842268575306187841, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 1000(%rsp)
	movabsq	$-7946738593435294165, %r11
	addq	1256(%rsp), %r11
	addq	1000(%rsp), %r11
	movq	%rbx, 1224(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	1000(%rsp), %r11
	movq	1224(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$-3751294463443135658, %r11
	addq	1256(%rsp), %r11
	addq	1224(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1224(%rsp)
	movq	%r13, %r12
	xorq	1224(%rsp), %r13
	xorq	%r15, %r12
	xorq	1224(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 936(%rsp)
	movq	%r11, %rbx
	addq	1352(%rsp), %rbx
	movq	%r13, 1000(%rsp)
	movq	936(%rsp), %r13
	movq	%r15, %r12
	addq	1288(%rsp), %r13
	addq	1032(%rsp), %r12
	movq	%r15, 1224(%rsp)
	movq	1000(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r11, 968(%rsp)
	movq	%r13, 1032(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r13, 1352(%rsp)
	movq	%r15, 1448(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1032(%rsp), %r11
	movq	1352(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1448(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1352(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1448(%rsp)
	movq	%r13, %r12
	xorq	1448(%rsp), %r13
	xorq	%r15, %r12
	xorq	1448(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 840(%rsp)
	movq	%r11, %rbx
	movq	%r11, 872(%rsp)
	movq	%r13, 904(%rsp)
	movq	840(%rsp), %r13
	movq	%r15, %r12
	addq	1416(%rsp), %r12
	addq	1064(%rsp), %r13
	addq	1096(%rsp), %rbx
	movq	%r15, 1448(%rsp)
	movq	904(%rsp), %r15
	addq	1128(%rsp), %r15
	movq	%r13, 1416(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r15, 1352(%rsp)
	movq	%r13, 1032(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	1416(%rsp), %r11
	movq	1032(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1352(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1032(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1032(%rsp)
	movq	%r13, %r12
	xorq	1032(%rsp), %r13
	xorq	%r15, %r12
	xorq	1032(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 1288(%rsp)
	movq	%r11, %rbx
	addq	1192(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	movq	1288(%rsp), %r13
	movq	%r15, 1032(%rsp)
	movq	%r15, %r12
	movq	1416(%rsp), %r15
	addq	1480(%rsp), %r15
	addq	1320(%rsp), %r12
	addq	1160(%rsp), %r13
	movq	%r11, 1352(%rsp)
	movq	%r15, %r11
	addq	%r13, %r11
	movq	%r13, 1320(%rsp)
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 1160(%rsp)
	movq	%r13, 1256(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	1320(%rsp), %r11
	movq	1256(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1160(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1256(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1480(%rsp)
	movq	%r13, %r12
	xorq	1480(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 1160(%rsp)
	movq	1480(%rsp), %r12
	xorq	1160(%rsp), %rbx
	movq	%r13, 1256(%rsp)
	movabsq	$-824919486193887165, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	1160(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$-1914029582460860148, %r11
	addq	%r12, %r11
	movabsq	$-7632797540959622777, %r12
	addq	1256(%rsp), %r12
	movq	%r11, 1480(%rsp)
	movabsq	$6609752215332129920, %r11
	addq	%r11, %rbx
	movq	1480(%rsp), %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	addq	%r11, %rbx
	addq	%r12, %r13
	rolq	$7, %rbx
	rolq	$31, %r13
	movq	%rbx, 1160(%rsp)
	movabsq	$7484883476188376383, %rbx
	addq	1256(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	movq	1480(%rsp), %r11
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	1160(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	1160(%rsp), %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	movq	%r15, 1096(%rsp)
	movq	%r11, 1192(%rsp)
	movq	%r12, 1128(%rsp)
	movq	%r12, %r13
	addq	1032(%rsp), %r13
	addq	1352(%rsp), %r15
	movq	%rbx, 1160(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	1288(%rsp), %r12
	addq	1416(%rsp), %rbx
	movq	%r15, 1032(%rsp)
	movq	%r15, %r11
	addq	%r13, %r11
	addq	%r8, %r13
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r11, %r12
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	1032(%rsp), %r11
	addq	1416(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	1416(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 1416(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1416(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1416(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1320(%rsp)
	movq	%rbx, 1064(%rsp)
	movq	%rbx, %r12
	addq	872(%rsp), %r15
	addq	840(%rsp), %r12
	movq	%r11, %rbx
	addq	904(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	addq	1448(%rsp), %r13
	movq	%r11, 1480(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 1032(%rsp)
	addq	1032(%rsp), %r13
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	1448(%rsp), %r11
	rolq	$7, %r12
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 1032(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1352(%rsp)
	movq	%rbx, 1288(%rsp)
	movq	%rbx, %r12
	addq	968(%rsp), %r15
	addq	936(%rsp), %r12
	movq	%r11, %rbx
	addq	1000(%rsp), %rbx
	movq	%r13, 1032(%rsp)
	addq	1224(%rsp), %r13
	movq	%r11, 1448(%rsp)
	movq	%r15, 968(%rsp)
	movq	%r15, %r11
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	movq	%r15, 1256(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	movq	968(%rsp), %r11
	addq	1256(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 1224(%rsp)
	xorq	%r15, %r12
	addq	%rdi, %r11
	addq	1256(%rsp), %r11
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 1256(%rsp)
	movabsq	$-1139829817207230181, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	1224(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$3054837738180890943, %r12
	addq	%r11, %r12
	movabsq	$2588290990126348949, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 1000(%rsp)
	movabsq	$-938319195649413462, %r11
	addq	1256(%rsp), %r11
	addq	1000(%rsp), %r11
	movq	%rbx, 1224(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	1000(%rsp), %r11
	movq	1224(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$3257124934342745045, %r11
	addq	1256(%rsp), %r11
	addq	1224(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1224(%rsp)
	movq	%r13, %r12
	xorq	1224(%rsp), %r13
	xorq	%r15, %r12
	xorq	1224(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 936(%rsp)
	movq	%r11, %rbx
	addq	1352(%rsp), %rbx
	movq	%r13, 1000(%rsp)
	movq	936(%rsp), %r13
	movq	%r15, %r12
	addq	1288(%rsp), %r13
	addq	1032(%rsp), %r12
	movq	%r15, 1224(%rsp)
	movq	1000(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r11, 968(%rsp)
	movq	%r13, 1032(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r15, 1448(%rsp)
	movq	%r13, 1352(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	1032(%rsp), %r11
	movq	1352(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1448(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1352(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1448(%rsp)
	movq	%r13, %r12
	xorq	%r15, %r12
	xorq	1448(%rsp), %r13
	xorq	1448(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, 872(%rsp)
	movq	%r11, %rbx
	movq	%r13, 904(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r12, 840(%rsp)
	addq	1320(%rsp), %rbx
	movq	%r15, %r12
	movq	840(%rsp), %r13
	addq	1416(%rsp), %r12
	addq	1064(%rsp), %r13
	movq	904(%rsp), %r15
	addq	1480(%rsp), %r15
	movq	%r13, 1416(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1032(%rsp)
	movq	%r15, 1352(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1416(%rsp), %r11
	movq	1032(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1352(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1032(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1032(%rsp)
	movq	%r13, %r12
	xorq	1032(%rsp), %r13
	xorq	%r15, %r12
	xorq	1032(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 1320(%rsp)
	movq	%r11, %rbx
	addq	1096(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	movq	1320(%rsp), %r13
	movq	%r15, 1032(%rsp)
	movq	%r15, %r12
	movq	1416(%rsp), %r15
	addq	1192(%rsp), %r15
	addq	1160(%rsp), %r13
	addq	1128(%rsp), %r12
	movq	%r11, 1480(%rsp)
	movq	%r15, %r11
	movq	%r13, 1288(%rsp)
	movq	%r15, 1160(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	leaq	(%r12,%r11), %r15
	movq	%r13, 1352(%rsp)
	rolq	$11, %r15
	addq	%rcx, %rbx
	leaq	(%rbx,%r11), %r13
	movq	1288(%rsp), %r11
	movq	1352(%rsp), %rbx
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1160(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1352(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1288(%rsp)
	movq	%r13, %r12
	xorq	1288(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 1160(%rsp)
	movq	1288(%rsp), %r12
	xorq	1160(%rsp), %rbx
	movq	%r13, 1352(%rsp)
	movabsq	$-6097248013946911484, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	1160(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$3174302594670681997, %r11
	addq	%r12, %r11
	movabsq	$-8739574512844769069, %r12
	addq	1352(%rsp), %r12
	movq	%r11, 1288(%rsp)
	movabsq	$-496885038275669880, %r11
	addq	%r11, %rbx
	movq	1288(%rsp), %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r13, %r11
	addq	%r8, %r13
	addq	%r11, %rbx
	addq	%r12, %r13
	rolq	$7, %rbx
	rolq	$31, %r13
	movq	%rbx, 1160(%rsp)
	movabsq	$6378106504303230091, %rbx
	addq	1352(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	movq	1288(%rsp), %r11
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	1160(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%r12, %r11
	xorq	%rbx, %r15
	xorq	1160(%rsp), %rbx
	xorq	%r13, %r12
	movq	%r15, 1256(%rsp)
	movq	%r15, preCompInternalState+16(%rip)
	movq	%r12, 1288(%rsp)
	addq	1480(%rsp), %r15
	movq	%r12, %r13
	movq	%r12, preCompInternalState+8(%rip)
	addq	1032(%rsp), %r13
	movq	%rbx, 1160(%rsp)
	movq	%rbx, preCompInternalState+24(%rip)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	1320(%rsp), %r12
	addq	1416(%rsp), %rbx
	movq	%r15, 1032(%rsp)
	movq	%r11, 1352(%rsp)
	movq	%r11, preCompInternalState(%rip)
	movq	%r15, %r11
	addq	%r13, %r11
	addq	%r8, %r13
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r14, %rbx
	addq	%r11, %r12
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r11), %r15
	movq	1032(%rsp), %r11
	rolq	$7, %r12
	addq	1416(%rsp), %r13
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	1416(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	movq	%rbx, 1416(%rsp)
	rolq	$31, %r13
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1416(%rsp), %r11
	xorq	%r13, %rbx
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%rbx, %r12
	movq	%r11, 1192(%rsp)
	xorq	1416(%rsp), %r13
	movq	%r15, 1128(%rsp)
	addq	872(%rsp), %r15
	addq	840(%rsp), %r12
	movq	%rbx, 1096(%rsp)
	movq	%r11, %rbx
	addq	904(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	addq	1448(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 1448(%rsp)
	leaq	(%r12,%rbx), %r15
	addq	%r9, %r12
	addq	%r13, %r11
	addq	%r11, %r12
	movq	%r15, 1032(%rsp)
	rolq	$7, %r12
	addq	%r14, %rbx
	addq	%r8, %r13
	leaq	(%rbx,%r11), %r15
	movq	1448(%rsp), %r11
	addq	1032(%rsp), %r13
	rolq	$19, %r15
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	movq	%r15, %rbx
	xorq	%r12, %rbx
	rolq	$31, %r13
	movq	%rbx, 1032(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1480(%rsp)
	addq	968(%rsp), %r15
	movq	%rbx, %r12
	movq	%rbx, 1320(%rsp)
	addq	936(%rsp), %r12
	movq	%r11, %rbx
	movq	%r13, 1032(%rsp)
	addq	1000(%rsp), %rbx
	addq	1224(%rsp), %r13
	movq	%r11, 1448(%rsp)
	movq	%r15, 1064(%rsp)
	movq	%r15, %r11
	addq	1064(%rsp), %rdi
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
	leaq	(%r8,%r11), %rbx
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
	movq	1480(%rsp), %rbx
	addq	1320(%rsp), %r11
	addq	1032(%rsp), %r8
	addq	%rdi, %rbx
	movq	1448(%rsp), %rdi
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
	movq	1128(%rsp), %r9
	xorq	%r12, %rbx
	xorq	%r8, %r11
	xorq	%r11, %rdi
	xorq	%rbx, %r13
	xorq	%r8, %rbx
	addq	%rdi, %r9
	movq	%rbx, preCompInternalState+72(%rip)
	movq	%rdi, preCompInternalState+80(%rip)
	addq	1416(%rsp), %rbx
	movq	1096(%rsp), %r8
	xorq	%r12, %r11
	movq	1192(%rsp), %rdi
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
	addq	1352(%rsp), %rcx
	addq	1288(%rsp), %rsi
	movq	%rdi, preCompInternalState+48(%rip)
	movq	%rdx, preCompInternalState+56(%rip)
	addq	1256(%rsp), %rdi
	addq	1160(%rsp), %rdx
	testq	%rax, %rax
	movq	%rsi, InternalState(%rip)
	movq	%rcx, InternalState+24(%rip)
	movq	%rdi, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	je	.L25
	movq	-72(%rsp), %rdi
	addq	1384(%rsp), %rdi
	movl	$1, %ecx
	movq	192(%rsp), %r9
	movq	1384(%rsp), %r8
	movzbl	(%rdi), %edx
	xorb	InternalState(%rip), %dl
	movb	%dl, InternalState(%rip)
	movb	%dl, 64(%r9,%r8)
	movq	%r9, %r8
	xorl	%edx, %edx
	addq	1384(%rsp), %r8
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
	movq	%rbx, 1384(%rsp)
	movq	InternalState+56(%rip), %rbx
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r13, 1352(%rsp)
	movq	%r12, 1256(%rsp)
	movq	InternalState+48(%rip), %r12
	movq	%r10, 1288(%rsp)
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
	addq	1288(%rsp), %r9
	xorq	%r12, %r11
	xorq	%r12, %rbx
	xorq	%r11, %r10
	addq	1352(%rsp), %r10
	xorq	%r13, %r11
	addq	1384(%rsp), %r11
	movq	%r9, 1032(%rsp)
	movq	1256(%rsp), %r9
	movq	%r10, 1160(%rsp)
	addq	1032(%rsp), %r10
	addq	%rbx, %r9
	movq	1160(%rsp), %r12
	leaq	(%r9,%r11), %rbx
	addq	%r8, %r9
	leaq	(%r9,%r10), %r15
	movabsq	$-3329063056561552456, %r9
	addq	%rdi, %r12
	addq	%r9, %r11
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
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
	movq	%rbx, 1320(%rsp)
	movq	InternalState+88(%rip), %rbx
	xorq	%r11, %r13
	movq	InternalState+64(%rip), %r12
	xorq	%r15, %r11
	movq	%r13, 1192(%rsp)
	movq	InternalState+80(%rip), %r13
	movq	InternalState+72(%rip), %r15
	movq	%r10, 1480(%rsp)
	movq	%r11, 1128(%rsp)
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
	addq	1192(%rsp), %r10
	xorq	%r13, %r11
	xorq	%r13, %rbx
	xorq	%r11, %r12
	addq	1320(%rsp), %r12
	xorq	%r15, %r11
	movq	%r10, 1032(%rsp)
	movq	1128(%rsp), %r10
	addq	%rbx, %r10
	movq	1480(%rsp), %rbx
	addq	%r11, %rbx
	movq	1032(%rsp), %r11
	leaq	(%r10,%rbx), %r13
	addq	%r12, %r11
	addq	%r8, %r10
	movq	%r13, 1160(%rsp)
	leaq	(%r10,%r11), %r15
	movq	1032(%rsp), %r10
	addq	%r9, %rbx
	addq	%rdi, %r12
	addq	1160(%rsp), %r12
	leaq	(%rbx,%r11), %r13
	rolq	$7, %r15
	addq	%rsi, %r10
	addq	1160(%rsp), %r10
	rolq	$19, %r13
	movq	%r13, %rbx
	rolq	$31, %r12
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1032(%rsp)
	movq	InternalState+120(%rip), %rbx
	xorq	%r11, %r13
	movq	InternalState+96(%rip), %r12
	xorq	%r15, %r11
	movq	%r13, 1224(%rsp)
	movq	InternalState+112(%rip), %r13
	movq	InternalState+104(%rip), %r15
	movq	%r10, 1160(%rsp)
	movq	%r11, 1448(%rsp)
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
	addq	1224(%rsp), %r10
	xorq	%r13, %r11
	xorq	%r11, %r12
	addq	1032(%rsp), %r12
	xorq	%r13, %rbx
	xorq	%r15, %r11
	movq	%r10, 1096(%rsp)
	movq	1448(%rsp), %r10
	addq	%rbx, %r10
	movq	1160(%rsp), %rbx
	addq	%r11, %rbx
	movq	1096(%rsp), %r11
	leaq	(%rbx,%r10), %r15
	addq	%r8, %r10
	addq	%r9, %rbx
	addq	%r12, %r11
	movq	%r15, 1416(%rsp)
	addq	%rdi, %r12
	leaq	(%r10,%r11), %r15
	movq	1096(%rsp), %r10
	leaq	(%rbx,%r11), %r13
	addq	1416(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1416(%rsp)
	movabsq	$-7999569951748836447, %r10
	addq	%r10, %rbx
	xorq	%r11, %r13
	movabsq	$-4849728007900573903, %r10
	leaq	0(%r13,%r10), %r12
	xorq	%r15, %r11
	movabsq	$-1568322642145848418, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-1642314245251606934, %r10
	addq	1416(%rsp), %r10
	leaq	(%r12,%rbx), %r11
	addq	%rcx, %rbx
	addq	%rdx, %r12
	addq	%r15, %r10
	addq	%rax, %r15
	leaq	(%r10,%rbx), %r13
	addq	%r10, %r12
	movabsq	$2553129884740551573, %r10
	addq	1416(%rsp), %r10
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
	movq	%r11, 968(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	1224(%rsp), %r11
	movq	%r12, 1096(%rsp)
	movq	%r13, %rbx
	addq	1160(%rsp), %r12
	addq	1032(%rsp), %rbx
	movq	968(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r13, 1064(%rsp)
	movq	%r10, 1000(%rsp)
	movq	%r12, 1160(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r12, 1032(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	movq	1160(%rsp), %r10
	addq	1032(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	1032(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 840(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	1192(%rsp), %r11
	movq	%r12, 936(%rsp)
	movq	%r13, %rbx
	addq	1480(%rsp), %r12
	addq	1320(%rsp), %rbx
	movq	840(%rsp), %r15
	addq	1128(%rsp), %r15
	movq	%r13, 904(%rsp)
	movq	%r10, 872(%rsp)
	movq	%r12, %r10
	movq	%r12, 1032(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%r15, %r10
	addq	%rcx, %rbx
	addq	%rdx, %r11
	movq	%r13, 1160(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	movq	1032(%rsp), %r10
	addq	%rax, %r15
	addq	1160(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	1160(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 1448(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	1288(%rsp), %r11
	movq	%r12, 1160(%rsp)
	movq	%r13, %rbx
	addq	1384(%rsp), %r12
	addq	1352(%rsp), %rbx
	movq	%r13, 1032(%rsp)
	movq	1448(%rsp), %r13
	addq	1256(%rsp), %r13
	movq	%r10, 1224(%rsp)
	movq	%r12, %r10
	movq	%r12, 1416(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	addq	%rax, %r13
	movq	%r15, 1384(%rsp)
	addq	%r13, %r15
	movq	1416(%rsp), %r13
	leaq	(%rbx,%r10), %r12
	rolq	$37, %r15
	addq	%r11, %r10
	rolq	$23, %r10
	addq	%r14, %r13
	addq	1384(%rsp), %r13
	rolq	$11, %r12
	movq	%r10, %r11
	rolq	$59, %r13
	movq	%r13, %rbx
	xorq	%r15, %rbx
	xorq	%r12, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r11, %r13
	movq	%r10, 1416(%rsp)
	movabsq	$-2292595471992902602, %r10
	xorq	%r15, %r11
	leaq	(%rbx,%r10), %r12
	movabsq	$8467826889434979867, %r10
	movabsq	$6028102484886760763, %rbx
	addq	%r13, %r10
	addq	1416(%rsp), %rbx
	movabsq	$2699039428325208307, %r13
	movq	%r10, 1384(%rsp)
	movabsq	$-5006043190370284386, %r10
	addq	1416(%rsp), %r13
	addq	%r10, %r11
	movq	1384(%rsp), %r10
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	1384(%rsp), %r10
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
	movq	%r10, 1384(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 1352(%rsp)
	movq	%r13, 1288(%rsp)
	movq	%r11, 1256(%rsp)
	movq	%r11, %rbx
	addq	1224(%rsp), %r13
	addq	1448(%rsp), %rbx
	movq	%r10, %r11
	addq	1160(%rsp), %r11
	addq	1032(%rsp), %r12
	movq	%r13, %r10
	movq	%r13, 1032(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1160(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
	addq	1160(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	1160(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1320(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	904(%rsp), %r12
	movq	%r13, 1192(%rsp)
	movq	%r11, 1128(%rsp)
	movq	%r11, %rbx
	addq	872(%rsp), %r13
	addq	840(%rsp), %rbx
	movq	%r10, %r11
	addq	936(%rsp), %r11
	movq	%r10, 1480(%rsp)
	movq	%r13, %r10
	movq	%r13, 1032(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 1160(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	1032(%rsp), %r10
	addq	1160(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1160(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%r12, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 1032(%rsp)
	movq	%r13, 1224(%rsp)
	movq	%r11, 1448(%rsp)
	movq	%rbx, %r12
	addq	1000(%rsp), %r13
	movq	%r11, %rbx
	movq	%r10, %r11
	addq	968(%rsp), %rbx
	addq	1096(%rsp), %r11
	addq	1064(%rsp), %r12
	movq	%r10, 1160(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	movq	%r13, 1416(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	1064(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1416(%rsp)
	movabsq	$5953845371152580681, %r10
	addq	%r10, %rbx
	xorq	%r11, %r13
	movabsq	$-7646712092252898442, %r10
	leaq	0(%r13,%r10), %r12
	xorq	%r15, %r11
	movabsq	$-2842268575306187841, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-7946738593435294165, %r10
	addq	1416(%rsp), %r10
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
	addq	1416(%rsp), %r10
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
	movq	%r11, 968(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	1224(%rsp), %r11
	movq	%r12, 1096(%rsp)
	movq	%r13, %rbx
	addq	1160(%rsp), %r12
	addq	1032(%rsp), %rbx
	movq	968(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r10, 1000(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r12, 1160(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r12, 1032(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	movq	1160(%rsp), %r10
	addq	1032(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	1032(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 840(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	movq	840(%rsp), %r15
	movq	%r12, 936(%rsp)
	movq	%r13, %rbx
	addq	1320(%rsp), %rbx
	addq	1480(%rsp), %r12
	addq	1192(%rsp), %r11
	addq	1128(%rsp), %r15
	movq	%r13, 904(%rsp)
	movq	%r10, 872(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	addq	%rdx, %r11
	movq	%r12, 1032(%rsp)
	movq	%r13, 1160(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	movq	1032(%rsp), %r10
	addq	%rax, %r15
	addq	1160(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	1160(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	movq	%r12, 1160(%rsp)
	movq	%r13, %rbx
	addq	1384(%rsp), %r12
	addq	1352(%rsp), %rbx
	movq	%r11, 1448(%rsp)
	movq	%r10, %r11
	addq	1288(%rsp), %r11
	movq	%r13, 1032(%rsp)
	movq	1448(%rsp), %r13
	addq	1256(%rsp), %r13
	movq	%r10, 1224(%rsp)
	movq	%r12, %r10
	movq	%r12, 1416(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	addq	%rax, %r13
	movq	%r15, 1384(%rsp)
	addq	%r13, %r15
	movq	1416(%rsp), %r13
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	rolq	$23, %r10
	rolq	$11, %r12
	rolq	$37, %r15
	addq	%r14, %r13
	addq	1384(%rsp), %r13
	movq	%r10, %r11
	xorq	%r12, %r11
	rolq	$59, %r13
	movq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r15, %r11
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 1416(%rsp)
	movabsq	$-824919486193887165, %r10
	leaq	(%rbx,%r10), %r12
	movabsq	$-1914029582460860148, %r10
	movabsq	$-7632797540959622777, %rbx
	addq	%r13, %r10
	addq	1416(%rsp), %rbx
	movabsq	$7484883476188376383, %r13
	movq	%r10, 1384(%rsp)
	movabsq	$6609752215332129920, %r10
	addq	1416(%rsp), %r13
	addq	%r10, %r11
	movq	1384(%rsp), %r10
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	1384(%rsp), %r10
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
	movq	%rbx, 1480(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	1032(%rsp), %r12
	movq	%r13, 1320(%rsp)
	movq	%r11, 1192(%rsp)
	movq	%r11, %rbx
	addq	1224(%rsp), %r13
	movq	%r10, %r11
	addq	1448(%rsp), %rbx
	addq	1160(%rsp), %r11
	movq	%r10, 1256(%rsp)
	movq	%r13, 1032(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1160(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
	addq	1160(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	1160(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1384(%rsp)
	movq	%rbx, 1352(%rsp)
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, %r12
	movq	%r13, 1288(%rsp)
	movq	%r11, %rbx
	movq	%r11, 1128(%rsp)
	addq	840(%rsp), %rbx
	movq	%r10, %r11
	addq	936(%rsp), %r11
	addq	872(%rsp), %r13
	addq	904(%rsp), %r12
	leaq	(%rbx,%r11), %r15
	addq	%r8, %rbx
	addq	%r9, %r11
	movq	%r13, %r10
	movq	%r13, 1032(%rsp)
	movq	%r15, 1160(%rsp)
	addq	%r12, %r10
	addq	%rdi, %r12
	addq	1160(%rsp), %r12
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	movq	%r13, %rbx
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	1160(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1032(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	1064(%rsp), %r12
	movq	%r13, 1224(%rsp)
	movq	%r11, 1448(%rsp)
	movq	%r11, %rbx
	addq	1000(%rsp), %r13
	addq	968(%rsp), %rbx
	movq	%r10, %r11
	addq	1096(%rsp), %r11
	movq	%r10, 1160(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1416(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1064(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1416(%rsp)
	movabsq	$-1139829817207230181, %r10
	addq	%r10, %rbx
	xorq	%r11, %r13
	movabsq	$3054837738180890943, %r10
	leaq	0(%r13,%r10), %r12
	xorq	%r15, %r11
	movabsq	$2588290990126348949, %r10
	leaq	(%r11,%r10), %r15
	movabsq	$-938319195649413462, %r10
	addq	1416(%rsp), %r10
	leaq	(%r12,%rbx), %r11
	addq	%rcx, %rbx
	addq	%r15, %r10
	leaq	(%r10,%rbx), %r13
	rolq	$11, %r13
	addq	%rdx, %r12
	addq	%rax, %r15
	addq	%r10, %r12
	movabsq	$3257124934342745045, %r10
	addq	1416(%rsp), %r10
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
	movq	%r11, 968(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	1224(%rsp), %r11
	movq	%r12, 1096(%rsp)
	movq	%r13, %rbx
	addq	1160(%rsp), %r12
	addq	1032(%rsp), %rbx
	movq	968(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r13, 1064(%rsp)
	movq	%r10, 1000(%rsp)
	movq	%r12, 1160(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r12, 1032(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	movq	1160(%rsp), %r10
	addq	1032(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	1032(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r15, %rbx
	xorq	%rbx, %r12
	xorq	%r11, %r10
	xorq	%rbx, %r13
	xorq	%r15, %r11
	movq	%r12, 936(%rsp)
	movq	%r13, %rbx
	addq	1384(%rsp), %r12
	addq	1352(%rsp), %rbx
	movq	%r11, 840(%rsp)
	movq	%r10, %r11
	addq	1288(%rsp), %r11
	movq	840(%rsp), %r15
	addq	1128(%rsp), %r15
	movq	%r13, 904(%rsp)
	movq	%r10, 872(%rsp)
	movq	%r12, %r10
	movq	%r12, 1032(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	addq	%rax, %r15
	movq	%r13, 1160(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	movq	1032(%rsp), %r10
	addq	1160(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %r11
	addq	%r14, %r10
	addq	1160(%rsp), %r10
	xorq	%r13, %r11
	rolq	$37, %r15
	rolq	$59, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r15, %r11
	xorq	%r15, %rbx
	movq	%r11, 1288(%rsp)
	movq	%r10, %r11
	xorq	%rbx, %r12
	xorq	%rbx, %r13
	addq	1320(%rsp), %r11
	movq	%r12, 1416(%rsp)
	addq	1256(%rsp), %r12
	movq	%r13, %rbx
	movq	%r13, 1384(%rsp)
	addq	1480(%rsp), %rbx
	movq	1288(%rsp), %r13
	addq	1192(%rsp), %r13
	movq	%r10, 1352(%rsp)
	movq	%r12, %r10
	movq	%r12, 1160(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r15, 1032(%rsp)
	rolq	$11, %r12
	addq	%r11, %r10
	addq	%rax, %r13
	addq	%r13, %r15
	movq	1160(%rsp), %r13
	rolq	$23, %r10
	rolq	$37, %r15
	movq	%r10, %r11
	xorq	%r12, %r11
	addq	%r14, %r13
	addq	1032(%rsp), %r13
	rolq	$59, %r13
	movq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r15, %r11
	xorq	%r15, %rbx
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	movq	%r10, 1160(%rsp)
	movabsq	$-6097248013946911484, %r10
	leaq	(%rbx,%r10), %r12
	movabsq	$3174302594670681997, %r10
	movabsq	$-8739574512844769069, %rbx
	addq	%r13, %r10
	addq	1160(%rsp), %rbx
	movabsq	$6378106504303230091, %r13
	movq	%r10, 1032(%rsp)
	movabsq	$-496885038275669880, %r10
	addq	1160(%rsp), %r13
	addq	%r10, %r11
	movq	1032(%rsp), %r10
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	1032(%rsp), %r10
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
	movq	%r10, 1160(%rsp)
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 1032(%rsp)
	movq	%rbx, preCompInternalState+8(%rip)
	movq	%r13, 1224(%rsp)
	movq	%rbx, %r12
	movq	%r13, preCompInternalState+16(%rip)
	movq	%r11, 1448(%rsp)
	movq	%r11, %rbx
	addq	1352(%rsp), %r13
	addq	1288(%rsp), %rbx
	movq	%r11, preCompInternalState+24(%rip)
	movq	%r10, %r11
	addq	1416(%rsp), %r11
	addq	1384(%rsp), %r12
	movq	%r10, preCompInternalState(%rip)
	movq	%r13, 1384(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	movq	%r13, 1416(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	1384(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %r11
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	xorq	%r15, %r11
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %rbx
	xorq	%r11, %r10
	xorq	%r12, %r11
	xorq	%r12, %rbx
	movq	%r11, 1480(%rsp)
	movq	%r11, %r12
	xorq	%rbx, %r13
	xorq	%r15, %rbx
	addq	904(%rsp), %r12
	movq	%r13, 1320(%rsp)
	movq	%rbx, 1192(%rsp)
	movq	%r10, %r11
	addq	872(%rsp), %r13
	addq	840(%rsp), %rbx
	addq	936(%rsp), %r11
	movq	%r10, 1256(%rsp)
	leaq	(%r12,%r13), %r10
	leaq	(%rbx,%r11), %r15
	addq	%r8, %rbx
	addq	%r9, %r11
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %rbx
	leaq	(%r12,%rdi), %r11
	addq	1416(%rsp), %r11
	rolq	$7, %r15
	rolq	$19, %rbx
	movq	%rbx, %r10
	rolq	$31, %r11
	addq	%rsi, %r13
	addq	1416(%rsp), %r13
	xorq	%r15, %r10
	rolq	$53, %r13
	movq	%r13, %r12
	xorq	%r10, %r13
	xorq	%r11, %r10
	xorq	%r11, %r12
	movq	%r13, 1416(%rsp)
	movq	1416(%rsp), %r11
	xorq	%r12, %rbx
	xorq	%r15, %r12
	addq	1096(%rsp), %r11
	movq	%r12, 1288(%rsp)
	movq	%rbx, %r13
	movq	%r10, %r12
	addq	1000(%rsp), %r13
	addq	1064(%rsp), %r12
	movq	%rbx, 1352(%rsp)
	movq	1288(%rsp), %rbx
	addq	968(%rsp), %rbx
	movq	%r10, 1384(%rsp)
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
	addq	1352(%rsp), %rsi
	addq	1288(%rsp), %r12
	movq	%r13, preCompInternalState+96(%rip)
	movq	%rdi, preCompInternalState+104(%rip)
	addq	1416(%rsp), %r13
	addq	1384(%rsp), %rdi
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
	addq	1256(%rsp), %r8
	movq	%r11, preCompInternalState+72(%rip)
	movq	%r10, preCompInternalState+80(%rip)
	addq	1480(%rsp), %r11
	addq	1320(%rsp), %r10
	movq	%r9, preCompInternalState+88(%rip)
	addq	1192(%rsp), %r9
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
	addq	1032(%rsp), %rcx
	addq	1224(%rsp), %r8
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%r8, InternalState+8(%rip)
	addq	1448(%rsp), %rax
	addq	1160(%rsp), %rdx
	addq	%rcx, 1544(%rsp)
	addq	%r8, 1552(%rsp)
	addq	%rax, 1560(%rsp)
	addq	%rdx, 1568(%rsp)
	addq	%rdi, 1576(%rsp)
	addq	%rsi, 1584(%rsp)
	movq	%rax, InternalState+16(%rip)
	movq	%rdx, InternalState+24(%rip)
	addq	%r12, 1592(%rsp)
	addq	%r13, 1600(%rsp)
.L23:
	movq	192(%rsp), %rax
	addq	104(%rsp), %rax
	vmovdqa	1544(%rsp), %ymm0
	movq	-88(%rsp), %rsi
	vmovdqu	%xmm0, 64(%rax)
	vextracti128	$0x1, %ymm0, 80(%rax)
	vmovdqa	1576(%rsp), %ymm0
	vmovdqu	%xmm0, 96(%rax)
	vextracti128	$0x1, %ymm0, 112(%rax)
	movq	104(%rsp), %rax
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
	vmovdqa	1672(%rsp), %ymm0
	salq	$3, %rdx
	addq	$1, 1032(%rsp)
	movq	%rdx, 840(%rsp)
	movq	1032(%rsp), %rcx
	movabsq	$-8247349341179448980, %rsi
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %r9
	movq	InternalState+24(%rip), %r12
	xorq	InternalState(%rip), %rcx
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%r9), %rdx
	movq	InternalState+8(%rip), %r8
	vmovdqa	1704(%rsp), %ymm0
	leaq	(%rdx,%rsi), %rdi
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rcx,%r8), %r11
	vmovdqa	1736(%rsp), %ymm0
	leaq	(%rdi,%rcx), %r10
	movabsq	$7667772426219706969, %rcx
	leaq	(%r8,%rcx), %rdi
	vmovdqa	%ymm0, InternalState+64(%rip)
	rolq	$11, %r10
	vmovdqa	1768(%rsp), %ymm0
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
	movq	%r15, %r9
	xorq	%r14, %r9
	addq	%r8, %rdi
	rolq	$31, %r10
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 968(%rsp)
	movq	InternalState+56(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+48(%rip), %rdi
	movq	%r14, 1192(%rsp)
	movq	%r8, 904(%rsp)
	movq	InternalState+40(%rip), %r14
	movq	InternalState+32(%rip), %r8
	movq	%r9, 1256(%rsp)
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
	addq	904(%rsp), %r9
	addq	1192(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	968(%rsp), %r8
	addq	1256(%rsp), %r10
	movq	%rdi, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r14, 1160(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%rdi, %r9
	addq	%r14, %r8
	rolq	$7, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1160(%rsp), %r10
	rolq	$19, %r15
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	movq	%r15, %r8
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	1160(%rsp), %rdi
	movq	%r8, 1160(%rsp)
	movq	%r10, %r8
	xorq	1160(%rsp), %r10
	rolq	$53, %rdi
	xorq	%rdi, %r8
	xorq	1160(%rsp), %rdi
	movq	%r10, 1160(%rsp)
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 1288(%rsp)
	movq	%r8, 1128(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	InternalState+64(%rip), %r8
	movq	%rdi, 1352(%rsp)
	movq	InternalState+88(%rip), %rdi
	addq	InternalState+80(%rip), %rdi
	leaq	(%r15,%r8), %r9
	addq	%rsi, %r8
	leaq	(%rdi,%r8), %r10
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
	movq	%r9, 1224(%rsp)
	movq	%r8, %r9
	xorq	1224(%rsp), %r8
	xorq	%r10, %r9
	addq	1352(%rsp), %r8
	xorq	1224(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r15, %r9
	addq	1128(%rsp), %r9
	addq	1160(%rsp), %r10
	addq	1288(%rsp), %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	movq	%rdi, 1448(%rsp)
	addq	%r10, %rdi
	movq	%r15, 1224(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1224(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	1448(%rsp), %rdi
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$53, %rdi
	xorq	%r9, %r8
	movq	%r8, 1224(%rsp)
	movq	%rdi, %r8
	xorq	1224(%rsp), %rdi
	xorq	%r10, %r8
	xorq	1224(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 1480(%rsp)
	movq	%r8, 1320(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %r8
	movq	%rdi, 1384(%rsp)
	movq	InternalState+120(%rip), %rdi
	addq	InternalState+112(%rip), %rdi
	movq	%r10, 1224(%rsp)
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
	movq	%r9, 1448(%rsp)
	movq	%r8, %r9
	xorq	1448(%rsp), %r8
	xorq	%r10, %r9
	addq	1384(%rsp), %r8
	xorq	1448(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r15, %r9
	addq	1320(%rsp), %r9
	addq	1224(%rsp), %r10
	addq	1480(%rsp), %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	movq	%rdi, 1096(%rsp)
	addq	%r10, %rdi
	movq	%r15, 1416(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1416(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r9, 1448(%rsp)
	addq	%rdi, %r10
	movq	1096(%rsp), %rdi
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%r12, %rdi
	addq	1416(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	movq	%rdi, 1416(%rsp)
	xorq	%r10, %r8
	movabsq	$-7999569951748836447, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	xorq	1448(%rsp), %r8
	xorq	%r15, %rdi
	movabsq	$-4849728007900573903, %r9
	addq	%rdi, %r9
	movabsq	$-1568322642145848418, %rdi
	addq	%r8, %rdi
	leaq	(%r10,%r9), %r8
	movq	%rdi, 1096(%rsp)
	movabsq	$-1642314245251606934, %rdi
	addq	1416(%rsp), %rdi
	addq	1096(%rsp), %rdi
	movq	%r8, 1448(%rsp)
	leaq	(%r10,%rsi), %r8
	leaq	(%rdi,%r8), %r15
	leaq	(%r9,%rcx), %r8
	leaq	(%rdi,%r8), %r10
	movq	1096(%rsp), %rdi
	movq	1448(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movabsq	$2553129884740551573, %rdi
	addq	1416(%rsp), %rdi
	addq	1448(%rsp), %rdi
	rolq	$37, %r8
	movq	%r8, %r9
	rolq	$59, %rdi
	xorq	%rdi, %r9
	movq	%r9, 1416(%rsp)
	movq	%r10, %r9
	xorq	1416(%rsp), %r10
	xorq	%r15, %r9
	xorq	1416(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 936(%rsp)
	movq	%rdi, %r8
	addq	1480(%rsp), %r8
	movq	%r10, 1096(%rsp)
	movq	936(%rsp), %r10
	addq	1320(%rsp), %r10
	movq	%r15, %r9
	addq	1224(%rsp), %r9
	movq	%r15, 1416(%rsp)
	movq	%rdi, 1064(%rsp)
	movq	%r10, 1224(%rsp)
	movq	1096(%rsp), %r15
	movq	%r10, %rdi
	addq	1384(%rsp), %r15
	leaq	(%r9,%r8), %r10
	movq	%r10, 1384(%rsp)
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r15, 1448(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r15
	movq	1224(%rsp), %rdi
	movq	1384(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1448(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1384(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1448(%rsp)
	movq	%r15, %r9
	xorq	1448(%rsp), %r15
	xorq	%r10, %r9
	xorq	1448(%rsp), %r10
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 1000(%rsp)
	movq	%rdi, %r8
	addq	1288(%rsp), %r8
	movq	%r15, %r9
	addq	1160(%rsp), %r9
	movq	%r15, 1448(%rsp)
	movq	%r10, 1480(%rsp)
	movq	1000(%rsp), %r10
	addq	1128(%rsp), %r10
	movq	1480(%rsp), %r15
	addq	1352(%rsp), %r15
	movq	%rdi, 1320(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 1160(%rsp)
	movq	%r15, 1384(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r15
	movq	1224(%rsp), %rdi
	movq	1160(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1160(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1224(%rsp)
	movq	%r10, %r9
	xorq	%r15, %r9
	xorq	1224(%rsp), %r10
	xorq	1224(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%rdi, %r8
	movq	%r10, 1352(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%rdi, 1384(%rsp)
	movq	%r9, 1288(%rsp)
	movq	%r15, %r9
	movq	1352(%rsp), %r15
	addq	968(%rsp), %r15
	addq	1192(%rsp), %r8
	addq	1256(%rsp), %r9
	movq	1288(%rsp), %r10
	addq	904(%rsp), %r10
	movq	%r15, %rdi
	movq	%r15, 1160(%rsp)
	movq	%r10, 1192(%rsp)
	addq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 1256(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	1192(%rsp), %rdi
	movq	1256(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1160(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1256(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1192(%rsp)
	movq	%r10, %r9
	xorq	1192(%rsp), %r10
	xorq	%r15, %r9
	movq	%r9, 1160(%rsp)
	movq	1192(%rsp), %r9
	xorq	1160(%rsp), %r8
	movq	%r10, 1256(%rsp)
	movabsq	$-2292595471992902602, %r10
	xorq	%r15, %r9
	addq	%r9, %r10
	movq	1160(%rsp), %r9
	xorq	%rdi, %r9
	movabsq	$8467826889434979867, %rdi
	addq	%r9, %rdi
	movabsq	$6028102484886760763, %r9
	addq	1256(%rsp), %r9
	movq	%rdi, 1192(%rsp)
	movabsq	$-5006043190370284386, %rdi
	addq	%rdi, %r8
	movq	1192(%rsp), %rdi
	addq	%r8, %r9
	addq	%r11, %r8
	addq	%r10, %rdi
	addq	%rdi, %r8
	rolq	$7, %r8
	movq	%r8, 1160(%rsp)
	movabsq	$2699039428325208307, %r8
	addq	1256(%rsp), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1192(%rsp), %rdi
	rolq	$19, %r15
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	1160(%rsp), %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %r8
	xorq	%r15, %r9
	xorq	%r8, %r15
	xorq	1160(%rsp), %r8
	xorq	%r9, %rdi
	movq	%r15, 968(%rsp)
	addq	1384(%rsp), %r15
	xorq	%r10, %r9
	movq	%rdi, 1192(%rsp)
	movq	%r9, 1128(%rsp)
	movq	%r9, %r10
	addq	1224(%rsp), %r10
	movq	%r8, 1160(%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%r15, 1384(%rsp)
	addq	1288(%rsp), %r9
	movq	%r15, %rdi
	addq	1352(%rsp), %r8
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%rdi, %r9
	movq	%r15, 1224(%rsp)
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1224(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	1384(%rsp), %rdi
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	movq	%r8, 1224(%rsp)
	movq	%r10, %r8
	xorq	1224(%rsp), %r10
	rolq	$53, %rdi
	xorq	%rdi, %r8
	xorq	1224(%rsp), %rdi
	movq	%r10, 1224(%rsp)
	xorq	%r8, %r15
	xorq	%r9, %r8
	addq	1448(%rsp), %r10
	movq	%r15, 1288(%rsp)
	movq	%r8, 1256(%rsp)
	movq	%r8, %r9
	addq	1320(%rsp), %r15
	addq	1000(%rsp), %r9
	movq	%rdi, %r8
	addq	1480(%rsp), %r8
	movq	%rdi, 1352(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%r14, %r8
	addq	%r11, %r9
	movq	%r15, 1384(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1384(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	1448(%rsp), %rdi
	xorq	%r9, %r8
	movq	%r8, 1448(%rsp)
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	1448(%rsp), %rdi
	xorq	%r10, %r8
	xorq	1448(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 1480(%rsp)
	movq	%r8, 1320(%rsp)
	movq	%r8, %r9
	addq	1064(%rsp), %r15
	addq	936(%rsp), %r9
	movq	%rdi, %r8
	addq	1096(%rsp), %r8
	movq	%r10, 1448(%rsp)
	addq	1416(%rsp), %r10
	movq	%rdi, 1384(%rsp)
	movq	%r15, 1064(%rsp)
	movq	%r15, %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r15, 1096(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1096(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r9, 1416(%rsp)
	addq	%rdi, %r10
	movq	1064(%rsp), %rdi
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%r12, %rdi
	addq	1096(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	movq	%rdi, 1096(%rsp)
	xorq	%r10, %r8
	movabsq	$5953845371152580681, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	xorq	1416(%rsp), %r8
	xorq	%r15, %rdi
	movabsq	$-7646712092252898442, %r9
	addq	%rdi, %r9
	movabsq	$-2842268575306187841, %rdi
	addq	%r8, %rdi
	leaq	(%r10,%r9), %r8
	movq	%rdi, 1064(%rsp)
	movabsq	$-7946738593435294165, %rdi
	addq	1096(%rsp), %rdi
	addq	1064(%rsp), %rdi
	movq	%r8, 1416(%rsp)
	leaq	(%r10,%rsi), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r9,%rcx), %r8
	leaq	(%r8,%rdi), %r10
	movq	1064(%rsp), %rdi
	movq	1416(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movabsq	$-3751294463443135658, %rdi
	addq	1096(%rsp), %rdi
	addq	1416(%rsp), %rdi
	rolq	$37, %r8
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1416(%rsp)
	movq	%r10, %r9
	xorq	1416(%rsp), %r10
	xorq	%r15, %r9
	xorq	1416(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 1064(%rsp)
	movq	%rdi, %r8
	addq	1480(%rsp), %r8
	movq	%r10, 1000(%rsp)
	movq	1064(%rsp), %r10
	movq	%r15, 1416(%rsp)
	movq	%r15, %r9
	movq	1000(%rsp), %r15
	addq	1384(%rsp), %r15
	addq	1320(%rsp), %r10
	addq	1448(%rsp), %r9
	movq	%rdi, 1096(%rsp)
	movq	%r15, %rdi
	movq	%r10, 1480(%rsp)
	movq	%r15, 1448(%rsp)
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r10, 1384(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	1480(%rsp), %rdi
	movq	1384(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1448(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1384(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1448(%rsp)
	movq	%r10, %r9
	xorq	1448(%rsp), %r10
	xorq	%r15, %r9
	xorq	1448(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 1320(%rsp)
	movq	%rdi, %r8
	addq	1288(%rsp), %r8
	movq	%r10, 1384(%rsp)
	movq	1320(%rsp), %r10
	movq	%r15, %r9
	addq	1256(%rsp), %r10
	addq	1224(%rsp), %r9
	movq	%r15, 1448(%rsp)
	movq	1384(%rsp), %r15
	addq	1352(%rsp), %r15
	movq	%rdi, 1480(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	addq	%r15, %rdi
	movq	%r10, 1352(%rsp)
	movq	%r15, 1288(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r15
	movq	1224(%rsp), %rdi
	movq	1352(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1288(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1352(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1224(%rsp)
	movq	%r10, %r9
	xorq	%r15, %r9
	xorq	1224(%rsp), %r10
	xorq	1224(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 1256(%rsp)
	movq	%rdi, %r8
	addq	968(%rsp), %r8
	movq	%rdi, 1288(%rsp)
	movq	%r10, 1352(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%r15, %r9
	movq	1352(%rsp), %r15
	addq	1192(%rsp), %r15
	addq	1128(%rsp), %r9
	movq	1256(%rsp), %r10
	addq	1160(%rsp), %r10
	movq	%r15, %rdi
	addq	%r10, %rdi
	movq	%r10, 1128(%rsp)
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r15, 1160(%rsp)
	movq	%r10, 1192(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	1128(%rsp), %rdi
	movq	1192(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1160(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1192(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1128(%rsp)
	movq	%r10, %r9
	xorq	1128(%rsp), %r10
	xorq	%r15, %r9
	movq	%r9, 1160(%rsp)
	movq	1128(%rsp), %r9
	xorq	1160(%rsp), %r8
	movq	%r10, 1192(%rsp)
	movabsq	$-824919486193887165, %r10
	xorq	%r15, %r9
	addq	%r9, %r10
	movq	1160(%rsp), %r9
	xorq	%rdi, %r9
	movabsq	$-1914029582460860148, %rdi
	addq	%r9, %rdi
	movabsq	$-7632797540959622777, %r9
	addq	1192(%rsp), %r9
	movq	%rdi, 1128(%rsp)
	movabsq	$6609752215332129920, %rdi
	addq	%rdi, %r8
	movq	1128(%rsp), %rdi
	addq	%r8, %r9
	addq	%r11, %r8
	addq	%r10, %rdi
	addq	%rdi, %r8
	rolq	$7, %r8
	movq	%r8, 1160(%rsp)
	movabsq	$7484883476188376383, %r8
	addq	1192(%rsp), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1128(%rsp), %rdi
	rolq	$19, %r15
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	1160(%rsp), %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %r8
	xorq	%r15, %r9
	xorq	%r8, %r15
	xorq	1160(%rsp), %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	movq	%r15, 1128(%rsp)
	addq	1288(%rsp), %r15
	movq	%r9, 904(%rsp)
	movq	%r9, %r10
	addq	1224(%rsp), %r10
	movq	%rdi, 1192(%rsp)
	movq	%r8, 1160(%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	addq	1256(%rsp), %r9
	addq	1352(%rsp), %r8
	movq	%r15, %rdi
	movq	%r15, 1224(%rsp)
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%rdi, %r9
	movq	%r15, 1352(%rsp)
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1352(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r9, %r8
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	1352(%rsp), %rdi
	movq	%r8, 1224(%rsp)
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	1224(%rsp), %rdi
	xorq	%r10, %r8
	xorq	1224(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 1288(%rsp)
	movq	%r8, 1256(%rsp)
	movq	%r8, %r9
	addq	1480(%rsp), %r15
	addq	1320(%rsp), %r9
	movq	%rdi, %r8
	addq	1384(%rsp), %r8
	movq	%r10, 1224(%rsp)
	addq	1448(%rsp), %r10
	movq	%rdi, 1352(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %rdi
	leaq	(%r9,%r8), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r15, 1384(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1384(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r15, %r8
	addq	%rdi, %r10
	movq	1448(%rsp), %rdi
	xorq	%r9, %r8
	movq	%r8, 1448(%rsp)
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	1448(%rsp), %rdi
	xorq	%r10, %r8
	xorq	1448(%rsp), %r10
	xorq	%r8, %r15
	xorq	%r9, %r8
	movq	%r15, 968(%rsp)
	movq	%r8, 936(%rsp)
	movq	%r8, %r9
	addq	1096(%rsp), %r15
	addq	1064(%rsp), %r9
	movq	%rdi, %r8
	addq	1000(%rsp), %r8
	movq	%r10, 1448(%rsp)
	addq	1416(%rsp), %r10
	movq	%rdi, 1384(%rsp)
	movq	%r15, 1320(%rsp)
	movq	%r15, %rdi
	leaq	(%r8,%r9), %r15
	addq	%r14, %r8
	addq	%r11, %r9
	addq	%r10, %rdi
	movq	%r15, 1480(%rsp)
	addq	%rdi, %r9
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	movq	1480(%rsp), %r10
	rolq	$7, %r9
	rolq	$19, %r15
	movq	%r9, 1416(%rsp)
	addq	%rdi, %r10
	movq	1320(%rsp), %rdi
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%r12, %rdi
	addq	1480(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1480(%rsp)
	movabsq	$-1139829817207230181, %rdi
	leaq	(%r9,%rdi), %r10
	movq	%r8, %rdi
	xorq	1416(%rsp), %r8
	xorq	%r15, %rdi
	movabsq	$3054837738180890943, %r9
	addq	%rdi, %r9
	movabsq	$2588290990126348949, %rdi
	addq	%r8, %rdi
	leaq	(%r10,%r9), %r8
	movq	%rdi, 1320(%rsp)
	movabsq	$-938319195649413462, %rdi
	addq	1480(%rsp), %rdi
	addq	1320(%rsp), %rdi
	movq	%r8, 1416(%rsp)
	leaq	(%r10,%rsi), %r8
	leaq	(%rdi,%r8), %r15
	leaq	(%r9,%rcx), %r8
	leaq	(%rdi,%r8), %r10
	movq	1320(%rsp), %rdi
	movq	1416(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movabsq	$3257124934342745045, %rdi
	addq	1480(%rsp), %rdi
	addq	1416(%rsp), %rdi
	rolq	$37, %r8
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1416(%rsp)
	movq	%r10, %r9
	xorq	1416(%rsp), %r10
	xorq	%r15, %r9
	xorq	1416(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 1320(%rsp)
	movq	%rdi, %r8
	addq	968(%rsp), %r8
	movq	%r10, 1480(%rsp)
	movq	1320(%rsp), %r10
	movq	%r15, %r9
	addq	936(%rsp), %r10
	addq	1448(%rsp), %r9
	movq	%r15, 1416(%rsp)
	movq	1480(%rsp), %r15
	addq	1384(%rsp), %r15
	movq	%rdi, 1000(%rsp)
	movq	%r10, 1448(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r15, 1384(%rsp)
	movq	%r10, 1096(%rsp)
	leaq	(%rdi,%r9), %r15
	leaq	(%rdi,%r8), %r10
	movq	1448(%rsp), %rdi
	movq	1096(%rsp), %r8
	rolq	$11, %r15
	rolq	$23, %r10
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1096(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1384(%rsp)
	movq	%r10, %r9
	xorq	1384(%rsp), %r10
	xorq	%r15, %r9
	xorq	1384(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%rdi, 936(%rsp)
	movq	%rdi, %r8
	movq	%r10, 968(%rsp)
	movq	%r15, 1384(%rsp)
	movq	%r9, 872(%rsp)
	movq	%r15, %r9
	addq	1288(%rsp), %r8
	addq	1224(%rsp), %r9
	movq	872(%rsp), %r10
	addq	1256(%rsp), %r10
	movq	968(%rsp), %r15
	addq	1352(%rsp), %r15
	movq	%r10, 1448(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 1224(%rsp)
	movq	%r15, 1352(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r15
	movq	1448(%rsp), %rdi
	movq	1224(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1352(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1224(%rsp)
	movq	%r10, %r9
	xorq	%r15, %r9
	xorq	1224(%rsp), %r10
	xorq	1224(%rsp), %r15
	xorq	%r9, %rdi
	xorq	%r8, %r9
	movq	%r9, 1064(%rsp)
	movq	%rdi, %r8
	addq	1128(%rsp), %r8
	movq	%rdi, 1096(%rsp)
	movq	%r10, 1448(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%r15, %r9
	movq	1448(%rsp), %r15
	addq	1192(%rsp), %r15
	addq	904(%rsp), %r9
	movq	1064(%rsp), %r10
	addq	1160(%rsp), %r10
	movq	%r15, %rdi
	movq	%r15, 1160(%rsp)
	addq	%r10, %rdi
	movq	%r10, 1288(%rsp)
	leaq	(%r8,%r9), %r10
	addq	%rsi, %r9
	addq	%rcx, %r8
	movq	%r10, 1352(%rsp)
	leaq	(%r9,%rdi), %r15
	leaq	(%r8,%rdi), %r10
	movq	1288(%rsp), %rdi
	movq	1352(%rsp), %r8
	rolq	$23, %r10
	rolq	$11, %r15
	addq	%rdx, %rdi
	addq	%rdi, %r8
	movq	1160(%rsp), %rdi
	rolq	$37, %r8
	addq	%r13, %rdi
	addq	1352(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r9
	xorq	%r8, %r9
	movq	%r9, 1288(%rsp)
	movq	%r10, %r9
	xorq	1288(%rsp), %r10
	xorq	%r15, %r9
	movq	%r9, 1160(%rsp)
	movq	1288(%rsp), %r9
	xorq	1160(%rsp), %r8
	movq	%r10, 1352(%rsp)
	movabsq	$-6097248013946911484, %r10
	xorq	%r15, %r9
	addq	%r9, %r10
	movq	1160(%rsp), %r9
	xorq	%rdi, %r9
	movabsq	$3174302594670681997, %rdi
	addq	%r9, %rdi
	movabsq	$-8739574512844769069, %r9
	addq	1352(%rsp), %r9
	movq	%rdi, 1288(%rsp)
	movabsq	$-496885038275669880, %rdi
	addq	%rdi, %r8
	movq	1288(%rsp), %rdi
	addq	%r8, %r9
	addq	%r11, %r8
	addq	%r10, %rdi
	addq	%rdi, %r8
	rolq	$7, %r8
	movq	%r8, 1160(%rsp)
	movabsq	$6378106504303230091, %r8
	addq	1352(%rsp), %r8
	leaq	(%r8,%rdi), %r15
	leaq	(%r10,%rbx), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1288(%rsp), %rdi
	rolq	$19, %r15
	rolq	$31, %r10
	addq	%r12, %rdi
	addq	%r9, %rdi
	movq	1160(%rsp), %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %r8
	xorq	%r15, %r9
	xorq	%r8, %r15
	xorq	1160(%rsp), %r8
	xorq	%r9, %rdi
	movq	%r15, 1256(%rsp)
	xorq	%r10, %r9
	movq	%r15, preCompInternalState+16(%rip)
	addq	1096(%rsp), %r15
	movq	%r9, 1288(%rsp)
	movq	%r9, %r10
	movq	%r9, preCompInternalState+8(%rip)
	addq	1224(%rsp), %r10
	movq	%r8, 1160(%rsp)
	movq	%r8, preCompInternalState+24(%rip)
	movq	%r8, %r9
	movq	%rdi, %r8
	addq	1064(%rsp), %r9
	addq	1448(%rsp), %r8
	movq	%rdi, 1352(%rsp)
	movq	%rdi, preCompInternalState(%rip)
	movq	%r15, %rdi
	addq	%r10, %rdi
	movq	%r15, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r11, %r9
	addq	%r14, %r8
	addq	%rdi, %r9
	rolq	$7, %r9
	movq	%r15, 1192(%rsp)
	leaq	(%r8,%rdi), %r15
	movq	%r9, 1448(%rsp)
	movq	1192(%rsp), %r9
	leaq	(%r10,%rbx), %rdi
	movq	1448(%rsp), %r10
	rolq	$19, %r15
	addq	%rdi, %r9
	movq	1224(%rsp), %rdi
	rolq	$31, %r9
	xorq	%r15, %r10
	addq	%r12, %rdi
	addq	1192(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r9, %r8
	movq	%rdi, 1096(%rsp)
	movq	%r10, 1064(%rsp)
	xorq	%r8, %r15
	xorq	1448(%rsp), %r8
	addq	1384(%rsp), %r10
	movq	%r15, 904(%rsp)
	addq	936(%rsp), %r15
	movq	%r8, 1448(%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	addq	872(%rsp), %r9
	addq	968(%rsp), %r8
	movq	%r15, %rdi
	addq	%r10, %rdi
	movq	%r15, 1192(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r11, %r9
	addq	%r14, %r8
	addq	%rdi, %r9
	rolq	$7, %r9
	movq	%r15, 1384(%rsp)
	leaq	(%r8,%rdi), %r15
	movq	%r9, 1224(%rsp)
	movq	1384(%rsp), %r9
	leaq	(%r10,%rbx), %rdi
	movq	1224(%rsp), %r10
	rolq	$19, %r15
	addq	%rdi, %r9
	movq	1192(%rsp), %rdi
	rolq	$31, %r9
	xorq	%r15, %r10
	addq	%r12, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r10, %rdi
	xorq	%r9, %r10
	xorq	%r9, %r8
	movq	%rdi, 1384(%rsp)
	movq	%r10, 1192(%rsp)
	xorq	%r8, %r15
	xorq	1224(%rsp), %r8
	movq	%r15, 1128(%rsp)
	movq	%r10, %r15
	movq	1128(%rsp), %rdi
	addq	1416(%rsp), %r15
	addq	1000(%rsp), %rdi
	movq	%r8, 1224(%rsp)
	movq	%r8, %r9
	movq	1384(%rsp), %r8
	addq	1320(%rsp), %r9
	addq	1480(%rsp), %r8
	movq	%rdi, 1000(%rsp)
	addq	%r15, %rbx
	addq	%r15, %rdi
	leaq	(%r8,%r9), %r10
	addq	%r11, %r9
	addq	%r14, %r8
	movq	%r10, 1416(%rsp)
	addq	1416(%rsp), %rbx
	leaq	(%r9,%rdi), %r10
	leaq	(%r8,%rdi), %r9
	movq	1000(%rsp), %rdi
	rolq	$7, %r10
	rolq	$19, %r9
	rolq	$31, %rbx
	addq	%r12, %rdi
	addq	1416(%rsp), %rdi
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
	movq	1384(%rsp), %rdi
	xorq	%r10, %r12
	addq	1224(%rsp), %r8
	xorq	%r11, %r10
	movq	%r10, preCompInternalState+104(%rip)
	movq	%r9, preCompInternalState+112(%rip)
	addq	1192(%rsp), %r10
	addq	1128(%rsp), %r9
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
	addq	1448(%rsp), %r8
	xorq	%rbx, %r10
	movq	1096(%rsp), %rdi
	movq	%r10, preCompInternalState+72(%rip)
	movq	%r9, preCompInternalState+80(%rip)
	addq	1064(%rsp), %r10
	addq	904(%rsp), %r9
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
	addq	1288(%rsp), %rsi
	addq	1256(%rsp), %rcx
	addq	1160(%rsp), %rdx
	movq	%r11, preCompInternalState+32(%rip)
	movq	%rsi, InternalState(%rip)
	movq	%rcx, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	1352(%rsp), %rdx
	addq	%r11, %rdx
	testq	%rax, %rax
	movq	%rdx, InternalState+24(%rip)
	je	.L14
	movq	-80(%rsp), %rdi
	addq	840(%rsp), %rdi
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
	movq	%rdi, 1288(%rsp)
	movq	InternalState+56(%rip), %rdi
	xorq	%r8, %r13
	xorq	%r14, %r8
	movq	%r9, 1256(%rsp)
	movq	%r13, 1480(%rsp)
	movq	%r8, 1320(%rsp)
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
	addq	1320(%rsp), %r9
	addq	1480(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r14, %r8
	addq	1288(%rsp), %r8
	addq	1256(%rsp), %r10
	movq	%rdi, 1160(%rsp)
	leaq	(%r9,%r8), %r13
	addq	%rsi, %r9
	addq	%r10, %rdi
	movq	%r13, 1224(%rsp)
	movabsq	$-3329063056561552456, %r13
	leaq	(%r9,%rdi), %r15
	addq	%r13, %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1224(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	addq	%rdi, %r10
	movq	1160(%rsp), %rdi
	movq	%r14, %r9
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%rbx, %rdi
	addq	1224(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1192(%rsp)
	movq	InternalState+88(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+80(%rip), %rdi
	movq	%r14, 1096(%rsp)
	movq	%r8, 1064(%rsp)
	movq	InternalState+72(%rip), %r14
	movq	InternalState+64(%rip), %r8
	movq	%r9, 1128(%rsp)
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
	addq	1096(%rsp), %rdi
	xorq	%r14, %r8
	xorq	%r14, %r9
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	1128(%rsp), %r10
	movq	%rdi, 1224(%rsp)
	addq	1064(%rsp), %r9
	addq	1192(%rsp), %r8
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r14
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1160(%rsp)
	movq	InternalState+120(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+112(%rip), %rdi
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	InternalState+104(%rip), %r14
	movq	InternalState+96(%rip), %r8
	movq	%r9, 1224(%rsp)
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
	addq	1416(%rsp), %r9
	addq	1448(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	1160(%rsp), %r8
	addq	1224(%rsp), %r10
	movq	%rdi, 1352(%rsp)
	leaq	(%r8,%r9), %r15
	addq	%rsi, %r9
	addq	%r13, %r8
	addq	%r10, %rdi
	movq	%r15, 1384(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1384(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1352(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r8
	movq	%rdi, 1384(%rsp)
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
	addq	1384(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 1352(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1352(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$2553129884740551573, %rdi
	addq	1384(%rsp), %rdi
	addq	1352(%rsp), %rdi
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
	movq	%r10, 1000(%rsp)
	movq	%r14, 968(%rsp)
	movq	%rdi, 936(%rsp)
	addq	1160(%rsp), %r10
	addq	1448(%rsp), %r8
	movq	%r9, 904(%rsp)
	movq	%r14, %r9
	addq	1224(%rsp), %r9
	movq	904(%rsp), %r15
	addq	1416(%rsp), %r15
	movq	%r10, 1160(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r10, 1224(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1224(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1160(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 872(%rsp)
	movq	%rdi, %r8
	addq	1192(%rsp), %r10
	addq	1096(%rsp), %r8
	movq	%r9, 776(%rsp)
	movq	%r14, %r9
	addq	1128(%rsp), %r9
	movq	776(%rsp), %r15
	addq	1064(%rsp), %r15
	movq	%r14, 840(%rsp)
	movq	%rdi, 808(%rsp)
	movq	%r10, %rdi
	movq	%r10, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r14, 1160(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	1160(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1224(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1160(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 1416(%rsp)
	movq	1416(%rsp), %r15
	xorq	%r8, %r10
	xorq	%r8, %r14
	addq	1320(%rsp), %r15
	movq	%r10, 1160(%rsp)
	addq	1288(%rsp), %r10
	movq	%r14, %r9
	movq	%rdi, %r8
	addq	1256(%rsp), %r9
	addq	1480(%rsp), %r8
	movq	%rdi, 1448(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r10, %rdi
	movq	%r10, 1384(%rsp)
	addq	%r15, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rcx, %r9
	leaq	(%r9,%rdi), %r14
	movq	%r10, 1352(%rsp)
	rolq	$11, %r14
	addq	%rdx, %r8
	leaq	(%r8,%rdi), %r10
	movq	1352(%rsp), %r8
	leaq	(%r15,%rax), %rdi
	movq	1352(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 1384(%rsp)
	movabsq	$-2292595471992902602, %rdi
	xorq	%r8, %r9
	xorq	1384(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 1352(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	1384(%rsp), %r9
	movabsq	$8467826889434979867, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$6028102484886760763, %r9
	addq	1352(%rsp), %r9
	movq	%rdi, 1288(%rsp)
	movabsq	$-5006043190370284386, %rdi
	addq	%rdi, %r8
	movq	1288(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$2699039428325208307, %r8
	addq	1352(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1288(%rsp), %rdi
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
	movq	%r9, 1288(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	1224(%rsp), %r10
	movq	%r14, 1256(%rsp)
	movq	%r8, 1480(%rsp)
	movq	%r8, %r9
	addq	1448(%rsp), %r14
	movq	%rdi, %r8
	addq	1416(%rsp), %r9
	addq	1160(%rsp), %r8
	movq	%rdi, 1352(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1192(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	840(%rsp), %r10
	movq	%r14, 1128(%rsp)
	movq	%r8, 1096(%rsp)
	movq	%r8, %r9
	addq	808(%rsp), %r14
	addq	776(%rsp), %r9
	movq	%rdi, %r8
	addq	872(%rsp), %r8
	movq	%rdi, 1320(%rsp)
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1224(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	968(%rsp), %r10
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	%r8, %r9
	addq	936(%rsp), %r14
	addq	904(%rsp), %r9
	movq	%rdi, %r8
	addq	1000(%rsp), %r8
	movq	%rdi, 1160(%rsp)
	movq	%r14, 1064(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1384(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1384(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1064(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1384(%rsp)
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
	addq	1384(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 1064(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1064(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$-3751294463443135658, %rdi
	movq	%r10, %r9
	rolq	$37, %r15
	addq	1384(%rsp), %rdi
	xorq	%r14, %r9
	addq	1064(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 936(%rsp)
	movq	936(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 1064(%rsp)
	addq	1448(%rsp), %r8
	movq	%r14, %r9
	addq	1160(%rsp), %r10
	addq	1224(%rsp), %r9
	addq	1416(%rsp), %r15
	movq	%rdi, 968(%rsp)
	movq	%r14, 1000(%rsp)
	movq	%r10, 1160(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 1224(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1224(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1160(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 904(%rsp)
	addq	1320(%rsp), %r10
	addq	1128(%rsp), %r8
	movq	%r9, 808(%rsp)
	movq	%r14, %r9
	addq	1192(%rsp), %r9
	movq	808(%rsp), %r15
	addq	1096(%rsp), %r15
	movq	%r14, 872(%rsp)
	movq	%rdi, 840(%rsp)
	movq	%r10, %rdi
	movq	%r10, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r14, 1160(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	1160(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1224(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1160(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 1416(%rsp)
	movq	1416(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 1160(%rsp)
	addq	1256(%rsp), %r8
	movq	%r14, %r9
	addq	1352(%rsp), %r10
	addq	1288(%rsp), %r9
	addq	1480(%rsp), %r15
	movq	%rdi, 1448(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r10, 1384(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%r15, %rdi
	addq	%rdx, %r8
	addq	%rcx, %r9
	movq	%r10, 1352(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	1352(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	1352(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 1384(%rsp)
	movabsq	$-824919486193887165, %rdi
	xorq	%r8, %r9
	xorq	%r9, %r10
	xorq	%r14, %r9
	xorq	1384(%rsp), %r8
	movq	%r10, 1352(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	1384(%rsp), %r9
	movabsq	$-1914029582460860148, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-7632797540959622777, %r9
	addq	1352(%rsp), %r9
	movq	%rdi, 1288(%rsp)
	movabsq	$6609752215332129920, %rdi
	addq	%rdi, %r8
	movq	1288(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$7484883476188376383, %r8
	addq	1352(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1288(%rsp), %rdi
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
	movq	%rdi, 1352(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r9, 1288(%rsp)
	movq	%r14, 1256(%rsp)
	movq	%r8, 1480(%rsp)
	movq	%r8, %r9
	addq	1448(%rsp), %r14
	addq	1416(%rsp), %r9
	movq	%rdi, %r8
	addq	1160(%rsp), %r8
	addq	1224(%rsp), %r10
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1192(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	872(%rsp), %r10
	movq	%r14, 1128(%rsp)
	movq	%r8, 1096(%rsp)
	movq	%r8, %r9
	addq	840(%rsp), %r14
	addq	808(%rsp), %r9
	movq	%rdi, %r8
	addq	904(%rsp), %r8
	movq	%rdi, 1320(%rsp)
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1224(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	1000(%rsp), %r10
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	%r8, %r9
	addq	968(%rsp), %r14
	addq	936(%rsp), %r9
	movq	%rdi, %r8
	addq	1064(%rsp), %r8
	movq	%rdi, 1160(%rsp)
	movq	%r14, 1000(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1384(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1384(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1000(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1384(%rsp)
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
	addq	1384(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 1064(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1064(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$3257124934342745045, %rdi
	addq	1384(%rsp), %rdi
	addq	1064(%rsp), %rdi
	rolq	$37, %r15
	movq	%r10, %r9
	xorq	%r14, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 936(%rsp)
	movq	936(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 1064(%rsp)
	movq	%r14, %r9
	addq	1224(%rsp), %r9
	addq	1448(%rsp), %r8
	addq	1160(%rsp), %r10
	addq	1416(%rsp), %r15
	movq	%rdi, 968(%rsp)
	movq	%r14, 1000(%rsp)
	movq	%r10, 1160(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 1224(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1224(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1160(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 808(%rsp)
	movq	808(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 904(%rsp)
	addq	1128(%rsp), %r8
	movq	%r14, %r9
	addq	1320(%rsp), %r10
	addq	1192(%rsp), %r9
	addq	1096(%rsp), %r15
	movq	%r14, 872(%rsp)
	movq	%rdi, 840(%rsp)
	leaq	(%r9,%r8), %r14
	movq	%r10, %rdi
	addq	%rcx, %r9
	addq	%r15, %rdi
	addq	%rdx, %r8
	movq	%r10, 1224(%rsp)
	movq	%r14, 1160(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	1160(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1224(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1160(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 1160(%rsp)
	movq	%rdi, %r8
	addq	1352(%rsp), %r10
	addq	1256(%rsp), %r8
	movq	%r9, 1416(%rsp)
	movq	%r14, %r9
	addq	1288(%rsp), %r9
	movq	1416(%rsp), %r15
	addq	1480(%rsp), %r15
	movq	%rdi, 1448(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r10, 1384(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rdx, %r8
	addq	%rcx, %r9
	addq	%r15, %rdi
	movq	%r10, 1352(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	1352(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	1352(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 1384(%rsp)
	movabsq	$-6097248013946911484, %rdi
	xorq	%r8, %r9
	xorq	1384(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 1352(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	1384(%rsp), %r9
	movabsq	$3174302594670681997, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-8739574512844769069, %r9
	addq	1352(%rsp), %r9
	movq	%rdi, 1288(%rsp)
	movabsq	$-496885038275669880, %rdi
	addq	%rdi, %r8
	movq	1288(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$6378106504303230091, %r8
	rolq	$7, %r15
	addq	1352(%rsp), %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1288(%rsp), %rdi
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
	movq	%r9, 1288(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	1224(%rsp), %r10
	movq	%r14, 1256(%rsp)
	movq	%r8, 1192(%rsp)
	movq	%r8, %r9
	addq	1448(%rsp), %r14
	addq	1416(%rsp), %r9
	movq	%rdi, %r8
	addq	1160(%rsp), %r8
	movq	%rdi, 1352(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1320(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	872(%rsp), %r10
	movq	%r14, 1128(%rsp)
	movq	%r8, 1096(%rsp)
	movq	%r8, %r9
	addq	840(%rsp), %r14
	movq	%rdi, %r8
	addq	808(%rsp), %r9
	addq	904(%rsp), %r8
	movq	%rdi, 1480(%rsp)
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 1160(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1160(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1160(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1224(%rsp)
	movq	%rdi, 1160(%rsp)
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	%r9, %r14
	movq	1448(%rsp), %r15
	addq	1000(%rsp), %r14
	movq	%r8, %r9
	addq	968(%rsp), %r15
	addq	936(%rsp), %r9
	movq	%rdi, %r8
	addq	1064(%rsp), %r8
	addq	%r14, %r11
	leaq	(%r15,%r14), %rdi
	addq	%r9, %rsi
	movq	1448(%rsp), %r14
	leaq	(%r8,%r9), %r10
	addq	%r13, %r8
	addq	%rdi, %r8
	movq	%r10, 1384(%rsp)
	leaq	(%rsi,%rdi), %r10
	addq	1384(%rsp), %r11
	leaq	(%r15,%rbx), %rsi
	addq	1384(%rsp), %rsi
	rolq	$19, %r8
	rolq	$7, %r10
	movq	%r8, %rdi
	movq	1416(%rsp), %r15
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
	movq	1224(%rsp), %r13
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
	addq	1160(%rsp), %rdi
	addq	%r9, %r13
	leaq	0(%r13,%r14), %r8
	movq	%rdi, 1160(%rsp)
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
	movq	1160(%rsp), %rsi
	rolq	$23, %rbx
	movq	%rbx, %r9
	rolq	$37, %r11
	xorq	%r10, %r9
	movq	1128(%rsp), %r10
	addq	%r12, %rsi
	addq	%r8, %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%r11, %r8
	xorq	%r8, %rdi
	addq	1320(%rsp), %rdi
	xorq	%r9, %rsi
	xorq	%r11, %r9
	addq	1096(%rsp), %r9
	movq	1480(%rsp), %r11
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
	movq	1544(%rsp), %r11
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
	addq	1288(%rsp), %rcx
	xorq	%rsi, %rax
	addq	1256(%rsp), %rax
	xorq	%rdi, %rsi
	xorq	%r8, %rdx
	addq	1192(%rsp), %rsi
	addq	1352(%rsp), %rdx
	addq	%r11, %rcx
	movq	%rcx, 1320(%rsp)
	movq	1552(%rsp), %r12
	movq	1568(%rsp), %rcx
	addq	1584(%rsp), %r14
	addq	1576(%rsp), %r13
	movq	1160(%rsp), %rbx
	addq	%r12, %rax
	movq	%rax, 1480(%rsp)
	movq	1560(%rsp), %rax
	addq	%rcx, %rdx
	movq	%rdx, 1288(%rsp)
	movq	%r14, 520(%rsp)
	movq	%r14, %r12
	movq	%r13, 256(%rsp)
	movq	1320(%rsp), %rdx
	addq	%rax, %rsi
	addq	1592(%rsp), %r15
	addq	1600(%rsp), %rbx
	movq	%rsi, 1256(%rsp)
	movq	1480(%rsp), %r10
	movq	%rbx, 584(%rsp)
	movq	%r15, 552(%rsp)
	movq	%r13, %rbx
	movq	584(%rsp), %r14
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
	movq	$0, 200(%rsp)
	jmp	.L21
.L49:
	movq	1672(%rsp), %rax
	movq	1680(%rsp), %rdx
	movq	1704(%rsp), %rsi
	movq	1712(%rsp), %rdi
	movq	1688(%rsp), %rcx
	movq	1696(%rsp), %rbx
	movq	1720(%rsp), %r8
	movq	1728(%rsp), %r9
	movq	1768(%rsp), %r14
	movq	1776(%rsp), %r15
	movq	%rax, 680(%rsp)
	movq	%rdx, 712(%rsp)
	movq	1784(%rsp), %rax
	movq	1792(%rsp), %rdx
	movq	1736(%rsp), %r10
	movq	1744(%rsp), %r11
	movq	1752(%rsp), %r12
	movq	1760(%rsp), %r13
	movq	%rcx, 40(%rsp)
	movq	%rbx, 8(%rsp)
	leaq	(%r9,%r8), %rcx
	leaq	(%rdi,%rsi), %rbx
	movq	%rsi, 144(%rsp)
	movq	%rdi, 136(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%r8, 160(%rsp)
	leaq	(%r15,%r14), %rdi
	movq	%r9, 152(%rsp)
	movq	%r10, -24(%rsp)
	xorl	%edx, %edx
	movq	%r11, -32(%rsp)
	movq	%r12, -40(%rsp)
	movq	%r13, -48(%rsp)
	movq	%r14, 128(%rsp)
	movq	%r15, 120(%rsp)
	movq	%rax, 112(%rsp)
	movq	%rcx, 176(%rsp)
	movq	%rbx, 168(%rsp)
	movq	72(%rsp), %rsi
	movq	%rdi, 240(%rsp)
	addq	%rax, %rsi
	movq	%rsi, 184(%rsp)
	jmp	.L9
	.cfi_endproc
.LFE2782:
	.size	crypto_aead_encrypt, .-crypto_aead_encrypt
	.p2align 4,,15
	.globl	crypto_aead_decrypt
	.type	crypto_aead_decrypt, @function
crypto_aead_decrypt:
.LFB2783:
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
	subq	$2568, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rcx, 208(%rsp)
	movq	32(%rbp), %rcx
	vmovdqa	%ymm0, InternalState(%rip)
	movq	%rsi, 16(%rsp)
	movq	%rdi, 32(%rsp)
	vmovdqa	%ymm0, InternalState+32(%rip)
	movq	%rdx, 192(%rsp)
	vmovdqa	%ymm0, InternalState+64(%rip)
	leaq	32(%rcx), %rax
	movq	%r8, 136(%rsp)
	vmovdqa	%ymm0, InternalState+96(%rip)
	movq	%r9, 24(%rsp)
	cmpq	$InternalState, %rax
	movq	24(%rbp), %rsi
	ja	.L106
.L88:
	vmovdqu	(%rcx), %xmm0
	vinserti128	$0x1, 16(%rcx), %ymm0, %ymm0
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
	addq	%r11, %r10
	rolq	$31, %r9
	movq	%r12, %r11
	rolq	$53, %r10
	xorq	%r8, %r11
	movq	%r10, %rbx
	vmovdqa	%ymm0, 1544(%rsp)
	xorq	%r9, %rbx
	xorq	%r11, %r10
	xorq	%r9, %r11
	xorq	%rbx, %r12
	xorq	%r8, %rbx
	movq	InternalState+32(%rip), %r9
	movq	%r12, 1064(%rsp)
	movq	InternalState+48(%rip), %r12
	vmovdqa	%ymm0, 1576(%rsp)
	movq	%rbx, 1000(%rsp)
	movq	InternalState+40(%rip), %rbx
	movq	%r11, 1320(%rsp)
	leaq	(%r12,%r13), %r8
	movq	%r10, 1384(%rsp)
	leaq	(%rbx,%r9), %r11
	addq	%rcx, %r9
	leaq	(%r9,%r8), %r10
	leaq	(%rbx,%rsi), %r9
	movabsq	$4195444129992158507, %rbx
	addq	%r13, %rbx
	movq	InternalState+88(%rip), %r13
	addq	%r8, %r9
	leaq	(%r12,%r14), %r8
	addq	%r11, %rbx
	rolq	$23, %r9
	rolq	$59, %rbx
	rolq	$11, %r10
	addq	%r11, %r8
	movq	%rbx, %r12
	movq	%r9, %r11
	rolq	$37, %r8
	xorq	%r10, %r11
	xorq	%r8, %r12
	xorq	%r11, %rbx
	xorq	%r11, %r8
	xorq	%r12, %r10
	addq	1000(%rsp), %r8
	addq	1320(%rsp), %r10
	addq	1064(%rsp), %rbx
	xorq	%r9, %r12
	addq	1384(%rsp), %r12
	leaq	(%rbx,%r10), %r9
	leaq	(%r12,%r8), %r11
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
	movq	%r12, 1192(%rsp)
	movq	InternalState+80(%rip), %r12
	xorq	%rbx, %r9
	xorq	%r8, %rbx
	movq	%r11, 1256(%rsp)
	movq	%r9, 1352(%rsp)
	movq	%rbx, 1160(%rsp)
	movq	InternalState+64(%rip), %r9
	movq	InternalState+72(%rip), %rbx
	leaq	0(%r13,%r12), %r8
	leaq	(%rbx,%r9), %r11
	addq	%rcx, %r9
	leaq	(%r8,%r9), %r10
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
	addq	1160(%rsp), %r8
	xorq	%rbx, %r12
	xorq	%r11, %rbx
	addq	1352(%rsp), %rbx
	xorq	%r12, %r10
	addq	1192(%rsp), %r10
	xorq	%r9, %r12
	addq	1256(%rsp), %r12
	leaq	(%r10,%rbx), %r9
	leaq	(%r8,%r12), %r11
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
	movq	%r11, 1288(%rsp)
	movq	%r12, 1032(%rsp)
	xorq	%rbx, %r9
	xorq	%r8, %rbx
	movq	%r9, 1224(%rsp)
	movq	InternalState+112(%rip), %r12
	movq	InternalState+120(%rip), %r13
	movq	%rbx, 1448(%rsp)
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
	addq	1224(%rsp), %r10
	xorq	%r9, %rbx
	xorq	%r12, %r9
	movq	1288(%rsp), %r12
	xorq	%rbx, %r11
	addq	1032(%rsp), %r11
	addq	1448(%rsp), %r9
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
	rolq	$37, %r8
	addq	%rbx, %r9
	rolq	$23, %r11
	rolq	$59, %r9
	movq	%r8, %rbx
	movq	%r10, %r12
	xorq	%r9, %rbx
	xorq	%r11, %r12
	xorq	%rbx, %r11
	xorq	%r12, %r9
	xorq	%r8, %r12
	xorq	%rbx, %r10
	movq	%r12, 744(%rsp)
	movq	%r11, %rbx
	movq	744(%rsp), %r8
	addq	1288(%rsp), %rbx
	movq	%r9, %r12
	addq	1448(%rsp), %r8
	addq	1224(%rsp), %r12
	movq	%r10, 776(%rsp)
	addq	1032(%rsp), %r10
	movq	%r11, 1128(%rsp)
	movq	%r9, 1096(%rsp)
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
	movq	%rbx, 808(%rsp)
	movq	%rbx, %r8
	movq	%r11, %rbx
	addq	1160(%rsp), %r8
	addq	1256(%rsp), %rbx
	movq	%r10, 1416(%rsp)
	movq	%r9, %r12
	addq	1192(%rsp), %r10
	addq	1352(%rsp), %r12
	movq	%r11, 968(%rsp)
	movq	%r9, 1480(%rsp)
	leaq	(%r8,%rbx), %r11
	leaq	(%r10,%r12), %r9
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
	movq	%r11, 1288(%rsp)
	addq	1000(%rsp), %r8
	movq	%r10, %r11
	movq	%r10, 1032(%rsp)
	addq	1320(%rsp), %r11
	movq	%r9, %r12
	movq	1288(%rsp), %r10
	addq	1064(%rsp), %r12
	addq	1384(%rsp), %r10
	movq	%r9, 1224(%rsp)
	movq	%rbx, 1448(%rsp)
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
	addq	%rax, %r10
	addq	%r13, %r12
	addq	%rdi, %r8
	addq	%rdx, %r11
	addq	%rbx, %r8
	addq	%r9, %r11
	addq	%r12, %rbx
	addq	%r10, %r9
	rolq	$19, %rbx
	rolq	$7, %r8
	rolq	$53, %r9
	rolq	$31, %r11
	movq	%rbx, %r12
	movq	%r9, %r10
	xorq	%r8, %r12
	xorq	%r11, %r10
	xorq	%r12, %r9
	xorq	%r11, %r12
	xorq	%r10, %rbx
	xorq	%r8, %r10
	movq	%r9, 936(%rsp)
	movq	%r10, 840(%rsp)
	movq	%rbx, 872(%rsp)
	movq	%r12, %r10
	addq	1224(%rsp), %rbx
	addq	1032(%rsp), %r10
	movq	%r12, 904(%rsp)
	movq	840(%rsp), %r8
	movq	1288(%rsp), %r12
	addq	1448(%rsp), %r8
	addq	%r9, %r12
	leaq	(%r10,%rbx), %r9
	leaq	(%r12,%r8), %r11
	addq	%rdi, %r8
	addq	%r9, %r8
	rolq	$7, %r8
	addq	%rax, %rbx
	addq	%rdx, %r10
	addq	%r15, %r12
	addq	%r11, %r10
	addq	%rbx, %r11
	addq	%r12, %r9
	rolq	$53, %r11
	rolq	$31, %r10
	rolq	$19, %r9
	movq	%r8, %r12
	movq	%r11, %rbx
	xorq	%r9, %r12
	xorq	%r10, %rbx
	xorq	%r12, %r11
	xorq	%rbx, %r9
	xorq	%r10, %r12
	xorq	%r8, %rbx
	movq	%r12, 1320(%rsp)
	movq	%r12, %r10
	movq	%rbx, 1192(%rsp)
	addq	1416(%rsp), %r10
	movq	%r9, %rbx
	movq	1192(%rsp), %r8
	addq	1480(%rsp), %rbx
	movq	%r11, %r12
	addq	808(%rsp), %r8
	addq	968(%rsp), %r12
	movq	%r11, 1384(%rsp)
	movq	%r9, 1256(%rsp)
	leaq	(%r10,%rbx), %r9
	addq	%rax, %rbx
	addq	%rdx, %r10
	leaq	(%r12,%r8), %r11
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
	movq	%r9, 1224(%rsp)
	movq	%r12, %r10
	addq	1096(%rsp), %r9
	addq	776(%rsp), %r10
	movq	%r12, 1032(%rsp)
	movq	%rbx, 1448(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	744(%rsp), %r12
	addq	1128(%rsp), %rbx
	movq	%r11, 1288(%rsp)
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
	movabsq	$4195444129992158507, %r13
	rolq	$59, %r9
	xorq	%r11, %r12
	movq	%r9, %rbx
	xorq	%r12, %r9
	xorq	%r8, %r12
	xorq	%r8, %rbx
	movq	%r12, 1352(%rsp)
	movq	1352(%rsp), %r8
	xorq	%rbx, %r11
	xorq	%rbx, %r10
	addq	1448(%rsp), %r8
	movq	%r11, %rbx
	addq	1288(%rsp), %rbx
	movq	%r10, 1064(%rsp)
	movq	%r9, %r12
	addq	1032(%rsp), %r10
	addq	1224(%rsp), %r12
	movq	%r11, 1096(%rsp)
	movq	%r9, 1480(%rsp)
	leaq	(%r8,%rbx), %r11
	addq	%r14, %r8
	leaq	(%r10,%r12), %r9
	addq	%rsi, %r12
	addq	%rcx, %r10
	addq	%r11, %r10
	addq	%r12, %r11
	movabsq	$4195444129992158507, %r12
	addq	%r12, %rbx
	addq	%r9, %r8
	rolq	$11, %r10
	rolq	$37, %r8
	addq	%rbx, %r9
	rolq	$23, %r11
	rolq	$59, %r9
	movq	%r8, %r12
	movq	%r10, %rbx
	xorq	%r9, %r12
	xorq	%r11, %rbx
	xorq	%rbx, %r9
	xorq	%r12, %r11
	xorq	%r12, %r10
	xorq	%r8, %rbx
	movq	%r11, 1160(%rsp)
	movq	%r9, %r12
	movq	%r10, 1000(%rsp)
	addq	1256(%rsp), %r12
	movq	%rbx, %r8
	addq	1320(%rsp), %r10
	addq	1192(%rsp), %r8
	movq	%rbx, 1416(%rsp)
	movq	%r11, %rbx
	addq	1384(%rsp), %rbx
	movq	%r9, 968(%rsp)
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
	movq	%r11, 1288(%rsp)
	movq	%r10, 1032(%rsp)
	movq	%r10, %r11
	movq	%rbx, %r8
	movq	1288(%rsp), %r10
	addq	840(%rsp), %r8
	addq	936(%rsp), %r10
	movq	%r9, %r12
	addq	904(%rsp), %r11
	addq	872(%rsp), %r12
	movq	%rbx, 1448(%rsp)
	movq	%r9, 1224(%rsp)
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
	movabsq	$7484883476188376383, %r13
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
	movq	%rcx, %r13
	xorq	%r9, %r10
	xorq	%r12, %r9
	xorq	%r11, %r12
	xorq	%r10, %rbx
	xorq	%r8, %r10
	movq	%r12, 872(%rsp)
	movq	%r10, 1128(%rsp)
	movq	%rbx, 1384(%rsp)
	movq	%r12, %r10
	addq	1224(%rsp), %rbx
	addq	1032(%rsp), %r10
	movq	%r9, %r12
	movq	1128(%rsp), %r8
	addq	1288(%rsp), %r12
	addq	1448(%rsp), %r8
	movq	%r9, 1192(%rsp)
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
	xorq	%r12, %r11
	xorq	%rbx, %r9
	xorq	%r10, %r12
	xorq	%r8, %rbx
	movq	%r12, %r10
	addq	1000(%rsp), %r10
	movq	%rbx, 904(%rsp)
	movq	%r9, %rbx
	addq	968(%rsp), %rbx
	movq	%r12, 1256(%rsp)
	movq	904(%rsp), %r8
	movq	%r11, %r12
	addq	1416(%rsp), %r8
	addq	1160(%rsp), %r12
	movq	%r9, 936(%rsp)
	movq	%r11, 1320(%rsp)
	leaq	(%rbx,%r10), %r9
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
	movq	%r11, 1288(%rsp)
	xorq	%r8, %rbx
	movq	%r9, 1224(%rsp)
	movq	%r12, %r10
	addq	1480(%rsp), %r9
	addq	1064(%rsp), %r10
	movq	%r12, 1032(%rsp)
	movq	%rbx, %r12
	movq	%rbx, 1448(%rsp)
	addq	1352(%rsp), %r12
	movq	%r11, %rbx
	addq	1096(%rsp), %rbx
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
	movq	%r8, 1416(%rsp)
	movabsq	$-1139829817207230181, %r8
	xorq	%r10, %r11
	addq	%r8, %r9
	movabsq	$3054837738180890943, %r8
	xorq	%r12, %r10
	leaq	(%r11,%r8), %rbx
	movabsq	$-938319195649413462, %r11
	addq	1416(%rsp), %r11
	movabsq	$2588290990126348949, %r8
	leaq	(%r9,%rcx), %rcx
	movabsq	$4195444129992158507, %r12
	addq	%r8, %r10
	leaq	(%rbx,%r9), %r8
	movq	%rsi, %r9
	addq	%rsi, %rbx
	leaq	(%r10,%r14), %rsi
	addq	%r10, %r11
	movabsq	$3257124934342745045, %r10
	addq	1416(%rsp), %r10
	addq	%r11, %rcx
	addq	%r8, %rsi
	addq	%rbx, %r11
	rolq	$23, %r11
	rolq	$37, %rsi
	rolq	$11, %rcx
	movq	%r11, %rbx
	addq	%r10, %r8
	xorq	%rcx, %rbx
	rolq	$59, %r8
	movq	%r8, %r10
	xorq	%rbx, %r8
	xorq	%rsi, %rbx
	xorq	%rsi, %r10
	movq	%r8, 1000(%rsp)
	movq	%rbx, 968(%rsp)
	xorq	%r10, %rcx
	xorq	%r10, %r11
	movq	1000(%rsp), %rbx
	movq	%r11, 1096(%rsp)
	movq	%rcx, 1064(%rsp)
	movq	%rcx, %r8
	addq	1288(%rsp), %r11
	movq	968(%rsp), %rcx
	addq	1448(%rsp), %rcx
	addq	1032(%rsp), %r8
	addq	1224(%rsp), %rbx
	leaq	(%rcx,%r11), %r10
	leaq	(%r8,%rbx), %rsi
	addq	%r13, %r8
	addq	%r9, %rbx
	addq	%r10, %r8
	rolq	$11, %r8
	addq	%rbx, %r10
	addq	%r12, %r11
	addq	%r14, %rcx
	rolq	$23, %r10
	addq	%rsi, %rcx
	addq	%r11, %rsi
	movq	%r10, %r11
	rolq	$59, %rsi
	rolq	$37, %rcx
	xorq	%r8, %r11
	movq	%rsi, %rbx
	xorq	%r11, %rsi
	xorq	%rcx, %r11
	xorq	%rcx, %rbx
	movq	%r11, 1160(%rsp)
	movq	%r11, %rcx
	xorq	%rbx, %r10
	xorq	%rbx, %r8
	addq	904(%rsp), %rcx
	movq	%r8, 1352(%rsp)
	movq	%rsi, %rbx
	addq	1256(%rsp), %r8
	addq	936(%rsp), %rbx
	movq	%r10, %r11
	addq	1320(%rsp), %r11
	movq	%r10, 1480(%rsp)
	movq	%rsi, 1416(%rsp)
	leaq	(%rcx,%r11), %r10
	leaq	(%r8,%rbx), %rsi
	addq	%r12, %r11
	addq	%r9, %rbx
	addq	%r13, %r8
	addq	%r14, %rcx
	addq	%r10, %r8
	addq	%rsi, %rcx
	addq	%rbx, %r10
	addq	%r11, %rsi
	rolq	$23, %r10
	rolq	$37, %rcx
	rolq	$59, %rsi
	rolq	$11, %r8
	movq	%r10, %r11
	movq	%rsi, %rbx
	xorq	%r8, %r11
	xorq	%rcx, %rbx
	xorq	%rbx, %r10
	xorq	%rbx, %r8
	xorq	%r11, %rsi
	movq	%r10, 1288(%rsp)
	xorq	%rcx, %r11
	movq	%r8, %r10
	movq	%rsi, %rbx
	addq	872(%rsp), %r10
	addq	1384(%rsp), %rbx
	movq	%r8, 1032(%rsp)
	movq	%r11, %rcx
	movq	1288(%rsp), %r8
	addq	1128(%rsp), %rcx
	addq	1192(%rsp), %r8
	movq	%rsi, 1224(%rsp)
	movq	%r11, 1448(%rsp)
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
	movq	%rbx, 1384(%rsp)
	addq	%rcx, %rsi
	addq	%rdi, %rcx
	movabsq	$6378106504303230091, %rbx
	addq	%r11, %rcx
	rolq	$7, %rcx
	addq	1384(%rsp), %rbx
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
	movq	%r8, 872(%rsp)
	movq	%r11, 1128(%rsp)
	xorq	%rbx, %rsi
	xorq	%r10, %rbx
	addq	1224(%rsp), %r11
	movq	%rbx, 1384(%rsp)
	movq	%rbx, %r8
	movq	872(%rsp), %rcx
	addq	1032(%rsp), %r8
	addq	1448(%rsp), %rcx
	movq	%rsi, %rbx
	addq	1288(%rsp), %rbx
	movq	%rsi, 904(%rsp)
	leaq	(%r8,%r11), %rsi
	addq	%rdx, %r8
	addq	%rax, %r11
	leaq	(%rcx,%rbx), %r10
	addq	%rdi, %rcx
	addq	%r15, %rbx
	addq	%rsi, %rcx
	addq	%rbx, %rsi
	addq	%r10, %r8
	rolq	$19, %rsi
	addq	%r11, %r10
	rolq	$31, %r8
	rolq	$7, %rcx
	rolq	$53, %r10
	movq	%rsi, %rbx
	movq	%r8, %r11
	xorq	%rcx, %rbx
	xorq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r11, %rsi
	xorq	%r8, %rbx
	xorq	%rcx, %r11
	movq	%rbx, 1256(%rsp)
	movq	%rbx, %r8
	movq	%r11, 936(%rsp)
	addq	1352(%rsp), %r8
	movq	%rsi, %r11
	movq	936(%rsp), %rcx
	addq	1416(%rsp), %r11
	movq	%r10, %rbx
	addq	1160(%rsp), %rcx
	addq	1480(%rsp), %rbx
	movq	%r10, 1320(%rsp)
	movq	%rsi, 1192(%rsp)
	leaq	(%r8,%r11), %rsi
	addq	%rax, %r11
	addq	%rdx, %r8
	leaq	(%rcx,%rbx), %r10
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
	movq	%rsi, 1224(%rsp)
	movq	%rbx, %r8
	addq	1000(%rsp), %rsi
	addq	1064(%rsp), %r8
	movq	%rbx, 1032(%rsp)
	movq	%r11, %rbx
	addq	968(%rsp), %rbx
	movq	%r11, 1448(%rsp)
	movq	%r10, %r11
	addq	1096(%rsp), %r11
	movq	%r10, 1288(%rsp)
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
	rolq	$11, %rsi
	rolq	$23, %rcx
	addq	%rdx, %rax
	addq	%r11, %rdi
	movq	%rsi, %r8
	rolq	$37, %rax
	addq	%rdi, %rdx
	xorq	%rcx, %r8
	rolq	$59, %rdx
	movq	%rax, %r10
	movq	1224(%rsp), %rdi
	xorq	%rdx, %r10
	xorq	%r10, %rcx
	xorq	%rsi, %r10
	addq	1032(%rsp), %r10
	xorq	%r8, %rdx
	xorq	%r8, %rax
	addq	%rdx, %rdi
	movq	%r10, InternalState+64(%rip)
	movq	%rdi, InternalState+72(%rip)
	leaq	(%rdi,%r10), %rsi
	addq	1288(%rsp), %rcx
	movq	1448(%rsp), %rdx
	addq	%r9, %rdi
	addq	%rax, %rdx
	leaq	(%r10,%r13), %rax
	leaq	(%rcx,%rdx), %r8
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
	addq	1256(%rsp), %rax
	addq	1320(%rsp), %r8
	xorq	%rcx, %rdx
	addq	936(%rsp), %rdx
	xorq	%rcx, %r10
	addq	1192(%rsp), %r10
	leaq	(%rax,%r13), %rsi
	movq	%rax, InternalState+32(%rip)
	movq	%rax, 1032(%rsp)
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
	addq	1128(%rsp), %rcx
	xorq	%rdx, %r10
	xorq	%r8, %rdx
	addq	872(%rsp), %rdx
	xorq	%r10, %rdi
	xorq	%r10, %rsi
	addq	904(%rsp), %rdi
	addq	1384(%rsp), %rsi
	movq	%rcx, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	%rdi, InternalState+24(%rip)
	movq	%rsi, InternalState(%rip)
	movq	16(%rbp), %rsi
	vmovdqa	InternalState(%rip), %ymm0
	vmovdqa	%ymm0, 1672(%rsp)
	shrq	$6, %rsi
	vmovdqa	InternalState+32(%rip), %ymm0
	testq	%rsi, %rsi
	movq	%rsi, 40(%rsp)
	vmovdqa	%ymm0, 1704(%rsp)
	vmovdqa	InternalState+64(%rip), %ymm0
	vmovdqa	%ymm0, 1736(%rsp)
	vmovdqa	InternalState+96(%rip), %ymm0
	vmovdqa	%ymm0, 1768(%rsp)
	je	.L108
	movq	1688(%rsp), %r15
	movq	1696(%rsp), %rax
	movq	1680(%rsp), %rdx
	movq	1568(%rsp), %rbx
	movq	1576(%rsp), %rsi
	movq	1584(%rsp), %rdi
	movq	%rax, 48(%rsp)
	addq	%r15, %rax
	movq	48(%rsp), %rcx
	movq	%rax, 680(%rsp)
	movq	%rdx, %rax
	movq	%r15, 56(%rsp)
	addq	%r9, %rax
	addq	680(%rsp), %rax
	addq	%r14, %r15
	addq	%r12, %rcx
	movq	1592(%rsp), %r8
	movq	1600(%rsp), %r10
	movq	1552(%rsp), %r11
	movq	%rdx, 712(%rsp)
	movq	%r15, 616(%rsp)
	movq	1672(%rsp), %rdx
	rorq	$41, %rax
	movq	1560(%rsp), %r15
	movq	%rcx, 584(%rsp)
	movq	%rax, 1000(%rsp)
	movq	1704(%rsp), %rcx
	movq	1544(%rsp), %rax
	movq	%rbx, 968(%rsp)
	movq	1712(%rsp), %rbx
	movq	%rsi, 936(%rsp)
	movq	%rdi, 904(%rsp)
	movq	%r8, 872(%rsp)
	movq	%r10, 840(%rsp)
	movq	%r11, 776(%rsp)
	movq	%r15, 744(%rsp)
	movq	%rax, 808(%rsp)
	movq	%rdx, 552(%rsp)
	movq	%rcx, 88(%rsp)
	movq	%rbx, 96(%rsp)
	movq	1720(%rsp), %rsi
	movq	1728(%rsp), %rdi
	movq	1776(%rsp), %rdx
	movq	1768(%rsp), %rax
	movq	1784(%rsp), %rcx
	movq	%rsi, 112(%rsp)
	movq	1736(%rsp), %r8
	movq	%rdi, 104(%rsp)
	addq	%rsi, %rdi
	movq	96(%rsp), %rsi
	addq	88(%rsp), %rsi
	movq	%rdx, 128(%rsp)
	movq	104(%rsp), %rdx
	movq	%rax, 120(%rsp)
	movq	112(%rsp), %rax
	movq	%rcx, 80(%rsp)
	movq	88(%rsp), %rcx
	movq	1744(%rsp), %r10
	movq	%rsi, 144(%rsp)
	movq	96(%rsp), %rsi
	addq	%r12, %rdx
	addq	144(%rsp), %rdx
	addq	%r14, %rax
	addq	144(%rsp), %rax
	addq	%r13, %rcx
	movq	1752(%rsp), %r11
	movq	1760(%rsp), %r15
	addq	%r9, %rsi
	addq	%rdi, %rcx
	movq	1792(%rsp), %rbx
	addq	%rdi, %rsi
	rorq	$53, %rcx
	movq	%r8, 64(%rsp)
	rorq	$41, %rsi
	rorq	$5, %rdx
	rorq	$27, %rax
	movq	%rdi, 152(%rsp)
	movq	%rdx, %r8
	movq	%rsi, %rdi
	xorq	%rax, %r8
	xorq	%rcx, %rdi
	movq	%rbx, 72(%rsp)
	xorq	%r8, %rsi
	xorq	%rdi, %rdx
	xorq	%rcx, %r8
	xorq	%rax, %rdi
	movq	%rsi, 520(%rsp)
	movq	%r8, 224(%rsp)
	movq	%rdx, 488(%rsp)
	movq	%r10, 200(%rsp)
	movq	%r15, %rax
	movq	%r11, 184(%rsp)
	movq	%r15, 176(%rsp)
	movq	%r10, %rdx
	movq	%rdi, 216(%rsp)
	movq	64(%rsp), %rcx
	movq	%r10, %rsi
	addq	64(%rsp), %rdx
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
	addq	80(%rsp), %rbx
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
	movq	%rdx, 392(%rsp)
	movq	%rdi, 360(%rsp)
	xorq	%r8, %rsi
	movq	128(%rsp), %rdi
	movq	72(%rsp), %rdx
	addq	120(%rsp), %rdi
	movq	%rsi, 456(%rsp)
	xorq	%rcx, %r8
	movq	128(%rsp), %rsi
	movq	120(%rsp), %rcx
	movq	80(%rsp), %rax
	addq	%r12, %rdx
	movq	%r8, 424(%rsp)
	movq	%rbx, 168(%rsp)
	addq	%r9, %rsi
	addq	%rdi, %rdx
	addq	%r13, %rcx
	addq	%rbx, %rsi
	addq	%r14, %rax
	rorq	$5, %rdx
	rorq	$41, %rsi
	addq	%rdi, %rax
	addq	%rbx, %rcx
	rorq	$53, %rcx
	rorq	$27, %rax
	movq	%rdx, %r8
	movq	%rdi, 160(%rsp)
	movq	%rsi, %rdi
	xorq	%rax, %r8
	xorq	%rcx, %rdi
	xorq	%r8, %rsi
	movq	40(%rsp), %r9
	xorq	%rcx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	addq	1032(%rsp), %r9
	movq	%r8, 296(%rsp)
	movq	24(%rsp), %r8
	movq	%rsi, 328(%rsp)
	movq	%rdx, 264(%rsp)
	movq	%rdi, 232(%rsp)
	movq	%r8, 1288(%rsp)
	movq	%r9, 648(%rsp)
	.p2align 4,,10
	.p2align 3
.L60:
	addq	$1, 1032(%rsp)
	movq	552(%rsp), %rcx
	movabsq	$-8247349341179448980, %r10
	xorq	1032(%rsp), %rcx
	movq	712(%rsp), %rsi
	movabsq	$7860495443403156170, %r11
	movq	616(%rsp), %rax
	movq	1000(%rsp), %rdx
	movabsq	$-6792583489299504353, %r14
	movq	1000(%rsp), %rdi
	movabsq	$-3833335565246798826, %r12
	movabsq	$-1457182779415996031, %r13
	movabsq	$-6802927476391842224, %rbx
	movabsq	$-3329063056561552456, %r9
	addq	%rcx, %rsi
	addq	680(%rsp), %rcx
	addq	%rsi, %rax
	addq	584(%rsp), %rsi
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
	movq	%rdx, 1384(%rsp)
	movq	%r15, %r12
	movq	%rdi, %rdx
	addq	488(%rsp), %r12
	addq	224(%rsp), %rdx
	addq	520(%rsp), %rbx
	movq	1384(%rsp), %rax
	addq	216(%rsp), %rax
	movq	%rsi, 1224(%rsp)
	movq	%rdi, 1448(%rsp)
	movq	%r15, 1416(%rsp)
	movabsq	$-5426079245872290139, %r15
	leaq	(%r12,%rdx), %rsi
	addq	%r11, %r12
	addq	%r10, %rdx
	movq	456(%rsp), %r10
	leaq	(%rbx,%rax), %rcx
	addq	%r9, %rbx
	addq	%r8, %rax
	addq	%rsi, %rbx
	addq	%rsi, %rax
	movq	392(%rsp), %r8
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
	movq	424(%rsp), %rdx
	xorq	%rdi, %rbx
	xorq	%rax, %rdi
	movq	360(%rsp), %rax
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
	movq	232(%rsp), %rsi
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
	movq	296(%rsp), %rcx
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	xorq	%r9, %r10
	movq	264(%rsp), %rdx
	xorq	%rax, %r9
	movq	328(%rsp), %rax
	addq	%r11, %rcx
	addq	%r9, %rsi
	addq	%r10, %rdx
	addq	%r8, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1480(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1320(%rsp)
	addq	%r8, %rsi
	movq	%r15, 1256(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1192(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 1480(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	1416(%rsp), %r14
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
	movq	1224(%rsp), %rsi
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1384(%rsp), %rax
	movq	1448(%rsp), %r15
	addq	%r12, %r14
	xorq	%r13, %rdi
	movq	%r14, 1448(%rsp)
	xorq	%rdx, %r13
	movq	1448(%rsp), %rdx
	addq	%rbx, %rax
	addq	%rdi, %rsi
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r13, %r15
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1448(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
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
	movq	%r15, 1448(%rsp)
	movq	%rdx, 1416(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 1224(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1384(%rsp)
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
	movq	1320(%rsp), %r15
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
	movq	1256(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	1480(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	1192(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 1480(%rsp)
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1320(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 1256(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1192(%rsp)
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
	movq	%r14, 1480(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	1416(%rsp), %r14
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
	movq	1448(%rsp), %r15
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
	movq	1224(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1384(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 1448(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1448(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1224(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 1448(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 1416(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 1384(%rsp)
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
	movq	1192(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	1480(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	1320(%rsp), %rax
	movq	1256(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 1480(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	1480(%rsp), %r11
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
	movq	%r10, 1480(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	1480(%rsp), %r10
	movq	%r10, 1480(%rsp)
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
	addq	1480(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	1480(%rsp), %rax
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
	movq	%r11, 1320(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 1256(%rsp)
	movq	%r9, 1192(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 1480(%rsp)
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
	movq	1448(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	addq	%rcx, %r13
	rolq	$23, %rsi
	movq	1416(%rsp), %r12
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
	movq	%r12, 1448(%rsp)
	movq	1384(%rsp), %rax
	addq	%rdi, %r15
	movq	1224(%rsp), %r12
	movq	1448(%rsp), %r14
	movabsq	$-8247349341179448980, %rdx
	addq	%rbx, %rax
	addq	%rsi, %r12
	addq	%r15, %r14
	addq	%rdx, %r15
	leaq	(%r12,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	1448(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-1584252685182818982, %r14
	addq	%r14, %rcx
	movabsq	$6378106504303230091, %r14
	addq	%r14, %r15
	movabsq	$-3482973570042694885, %r14
	addq	%rax, %rcx
	addq	%r14, %r12
	addq	%r15, %rax
	addq	1448(%rsp), %r12
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	1448(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r12
	movq	%r12, %r14
	xorq	%r15, %r12
	rolq	$31, %rdx
	addq	%r12, %rsi
	movq	%r12, 1224(%rsp)
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
	movq	%rsi, 1128(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 1352(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r14, 1160(%rsp)
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
	movq	1256(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	1192(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	1480(%rsp), %r10
	addq	1320(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 1064(%rsp)
	movabsq	$-1087367646907149102, %r14
	movabsq	$-3329063056561552456, %rcx
	addq	%rdi, %r9
	movq	%r12, 1096(%rsp)
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
	movq	%r12, 1384(%rsp)
	movq	%r14, 1448(%rsp)
	movq	%r14, preCompInternalState+96(%rip)
	movq	%r14, %rcx
	movq	%r11, 1416(%rsp)
	movq	%r11, preCompInternalState+104(%rip)
	addq	%r9, %rsi
	movq	%r12, preCompInternalState+112(%rip)
	movq	%r9, 1320(%rsp)
	addq	%r11, %r8
	addq	1064(%rsp), %rcx
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
	movq	1096(%rsp), %r12
	xorq	%r13, %rbx
	xorq	%r13, %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%rbx, preCompInternalState+64(%rip)
	addq	1352(%rsp), %rbx
	movabsq	$-8247349341179448980, %r13
	movq	%r11, preCompInternalState+72(%rip)
	addq	1128(%rsp), %r10
	addq	%r9, %r12
	addq	1160(%rsp), %r11
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
	movq	1288(%rsp), %r14
	xorq	%r12, %r11
	xorq	%r12, %r10
	movq	1224(%rsp), %r12
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
	movq	%rax, 1352(%rsp)
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
	movq	%rax, %r14
	movabsq	$-8247349341179448980, %rax
	addq	%rdx, %r14
	addq	%rdx, %rax
	leaq	(%rax,%r15), %rdx
	movabsq	$7667772426219706969, %rax
	addq	1352(%rsp), %rax
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
	movq	%r12, 1480(%rsp)
	movabsq	$-3833335565246798826, %r12
	addq	1480(%rsp), %r12
	movq	%r12, 1480(%rsp)
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
	addq	1480(%rsp), %rdx
	addq	%r12, %r14
	movq	1480(%rsp), %r12
	addq	%r14, %r12
	movq	%r15, %r14
	rolq	$31, %rdx
	rolq	$53, %r12
	xorq	%rax, %r14
	movq	%r12, %r13
	xorq	%r14, %r12
	xorq	%rdx, %r14
	xorq	%rdx, %r13
	movq	%r12, 1224(%rsp)
	addq	1224(%rsp), %r9
	xorq	%r13, %r15
	addq	%r14, %rbx
	xorq	%rax, %r13
	movq	%r15, %r12
	addq	%r13, %r10
	movq	%r14, 1256(%rsp)
	addq	%r11, %r12
	movq	%r15, 1192(%rsp)
	movabsq	$-1087367646907149102, %r14
	leaq	(%r12,%rbx), %rdx
	movabsq	$-3329063056561552456, %r15
	movq	%r13, 1480(%rsp)
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
	leaq	(%r8,%rdi), %rax
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
	movq	1416(%rsp), %rcx
	xorq	%r10, %rdi
	movq	1384(%rsp), %r12
	xorq	%rdx, %r10
	xorq	%r8, %r9
	xorq	%rax, %r8
	movq	1448(%rsp), %rax
	movq	1320(%rsp), %r14
	addq	%r10, %rcx
	addq	%r9, %r12
	addq	%rdi, %rax
	leaq	(%r12,%rcx), %rsi
	movq	%rax, 1448(%rsp)
	addq	%r8, %r14
	movq	%rax, %rdx
	movabsq	$-1087367646907149102, %rax
	addq	%r14, %rdx
	addq	%rax, %r14
	leaq	(%r14,%rsi), %rax
	movabsq	$-3329063056561552456, %r14
	addq	1448(%rsp), %r14
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
	movq	%r12, 1448(%rsp)
	movabsq	$5597446114060141266, %r12
	addq	1448(%rsp), %r12
	movq	%r12, 1448(%rsp)
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
	addq	1448(%rsp), %rax
	addq	%r12, %rdx
	addq	1448(%rsp), %rdx
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
	movq	%rsi, 1448(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r14, 1416(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r14
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r14, %r10
	movq	%rdx, 1384(%rsp)
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
	movq	%r12, 1320(%rsp)
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
	movq	1192(%rsp), %r14
	leaq	(%rbx,%rax), %rdx
	movabsq	$7667772426219706969, %rbx
	addq	%rsi, %r15
	addq	%rbx, %r11
	addq	%r13, %r12
	movq	1224(%rsp), %rsi
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
	movq	1256(%rsp), %r15
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1480(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r12, %r14
	addq	%r11, %rsi
	addq	%r13, %r15
	movabsq	$-8247349341179448980, %rcx
	addq	%rbx, %rax
	movq	%r14, 1352(%rsp)
	addq	%r15, %r14
	leaq	(%rsi,%rax), %rdx
	addq	%rcx, %r15
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1352(%rsp), %r15
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
	movq	%r14, 1480(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1480(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1480(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 1224(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 1256(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 1192(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1480(%rsp)
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
	movq	1416(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	1320(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	1384(%rsp), %rdx
	xorq	%rax, %r8
	movq	1448(%rsp), %rax
	addq	%r10, %rcx
	addq	%r9, %rdx
	addq	%r8, %rsi
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1448(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1448(%rsp), %rsi
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
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
	addq	1448(%rsp), %rdx
	addq	1448(%rsp), %rax
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
	movq	%rdx, 1384(%rsp)
	movq	%rsi, 1448(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 1416(%rsp)
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
	movq	%r14, 1320(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	1192(%rsp), %r14
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
	movq	1256(%rsp), %r15
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
	movq	%r14, 1352(%rsp)
	movq	1480(%rsp), %rax
	xorq	%r13, %r11
	movq	1224(%rsp), %rsi
	xorq	%rdx, %r13
	addq	%r13, %r15
	addq	%rbx, %rax
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%r11, %rsi
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1352(%rsp), %r15
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1480(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1480(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	addq	%rsi, %r11
	movq	%rsi, 1224(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	movq	%rdx, %rcx
	addq	%r14, %rbx
	movq	%r15, 1256(%rsp)
	addq	%r12, %rcx
	movq	%rdx, 1192(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1480(%rsp)
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
	movq	1416(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	1320(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	1384(%rsp), %rdx
	xorq	%rax, %r8
	movq	1448(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1448(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	rolq	$7, %rax
	addq	1448(%rsp), %rsi
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
	movq	%r14, 1448(%rsp)
	movabsq	$1915007920973660762, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$9059564915322872455, %r14
	addq	%r14, %rcx
	movabsq	$-7724133909308953704, %r14
	addq	%r14, %rsi
	movabsq	$3257124934342745045, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$8809261046177890769, %r15
	addq	1448(%rsp), %rdx
	addq	%r15, %rax
	addq	1448(%rsp), %rax
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
	movq	%rsi, 1448(%rsp)
	addq	%rdi, %rsi
	addq	%r14, %r8
	addq	%rdx, %r9
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 1416(%rsp)
	movabsq	$7667772426219706969, %rdi
	movabsq	$-8247349341179448980, %r15
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r15, %r10
	addq	%rax, %rdi
	movq	%rdx, 1384(%rsp)
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
	movq	%r14, 1320(%rsp)
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
	movq	1256(%rsp), %r15
	leaq	0(%r13,%rax), %rdx
	addq	%rax, %r11
	leaq	(%rbx,%rcx), %rax
	addq	%rsi, %r12
	rolq	$23, %r11
	movq	1224(%rsp), %rsi
	rolq	$11, %rdx
	rolq	$37, %rax
	addq	%rcx, %r12
	rolq	$59, %r12
	movq	%r11, %rbx
	movq	1192(%rsp), %r14
	xorq	%rdx, %rbx
	movq	%r12, %r13
	movabsq	$-8247349341179448980, %rcx
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1480(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movq	%r14, 1352(%rsp)
	addq	%r15, %r14
	addq	%rcx, %r15
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1352(%rsp), %r15
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
	movq	%r14, 1480(%rsp)
	movabsq	$9210284522589112667, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
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
	addq	1480(%rsp), %rsi
	addq	1480(%rsp), %rcx
	rolq	$19, %rdx
	rolq	$7, %rax
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$31, %rcx
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	xorq	%rcx, %r15
	movq	%r15, 1256(%rsp)
	addq	1256(%rsp), %r13
	xorq	%rcx, %r14
	xorq	%r14, %rdx
	movq	%r14, %r15
	addq	%rsi, %r11
	xorq	%rax, %r15
	addq	%rdx, %r12
	movq	%rdx, 1192(%rsp)
	addq	%r15, %rbx
	movabsq	$-1087367646907149102, %rax
	movq	%rsi, 1224(%rsp)
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
	movq	%rsi, 1352(%rsp)
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
	movq	1416(%rsp), %rbx
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
	movq	1384(%rsp), %r9
	xorq	%r10, %rcx
	xorq	%r10, %r8
	movq	1448(%rsp), %r11
	movq	1320(%rsp), %r10
	addq	%r8, %rbx
	movq	%r12, 1480(%rsp)
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
	movq	%r12, 1416(%rsp)
	movabsq	$1906713845121804688, %r12
	addq	%r10, %r14
	addq	%r9, %r12
	addq	%r11, %r13
	addq	%r12, %r14
	movq	1416(%rsp), %r12
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
	addq	1352(%rsp), %r9
	xorq	%r13, %rbx
	addq	1480(%rsp), %rbx
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
	addq	%r8, 936(%rsp)
	addq	%r13, %r9
	addq	%rdi, 904(%rsp)
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
	addq	1192(%rsp), %r13
	xorq	%r9, %rdx
	xorq	%rax, %r9
	addq	%r13, 776(%rsp)
	xorq	%rdx, %r10
	xorq	%rdx, %r11
	addq	1224(%rsp), %r10
	addq	1256(%rsp), %r11
	addq	%r15, %r9
	addq	%r10, 968(%rsp)
	addq	%r11, 808(%rsp)
	addq	%r9, 744(%rsp)
	addq	%rsi, 872(%rsp)
	addq	%rcx, 840(%rsp)
	addq	$64, 1288(%rsp)
	movq	648(%rsp), %r13
	cmpq	%r13, 1032(%rsp)
	jne	.L60
	vmovq	744(%rsp), %xmm9
	movq	40(%rsp), %rdx
	vmovq	808(%rsp), %xmm11
	vpinsrq	$1, 776(%rsp), %xmm11, %xmm1
	vmovq	872(%rsp), %xmm12
	salq	$3, %rdx
	vpinsrq	$1, 968(%rsp), %xmm9, %xmm0
	vmovq	936(%rsp), %xmm13
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 904(%rsp), %xmm13, %xmm1
	vmovdqa	%ymm0, 1544(%rsp)
	vpinsrq	$1, 840(%rsp), %xmm12, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 1576(%rsp)
.L59:
	movq	16(%rbp), %rax
	andl	$63, %eax
	jne	.L61
	movq	1600(%rsp), %rdi
	movq	1576(%rsp), %r9
	movq	1552(%rsp), %rax
	movq	1592(%rsp), %rdx
	movq	1560(%rsp), %rcx
	movq	1544(%rsp), %rbx
	movq	1568(%rsp), %rsi
	movq	1584(%rsp), %r8
	movq	%rdi, 680(%rsp)
	movq	%r9, 584(%rsp)
	movq	%rax, %r10
	movq	584(%rsp), %r15
	movq	680(%rsp), %r11
	movq	%rcx, %rdi
	movq	%rdx, 648(%rsp)
	movq	%rax, 1256(%rsp)
	movq	%rbx, %rdx
	movq	%rcx, 1320(%rsp)
	movq	%rbx, 1192(%rsp)
	movq	%rsi, %r9
	movq	%rsi, 1384(%rsp)
	movq	%r8, 616(%rsp)
.L62:
	xorq	56(%rsp), %rdi
	xorq	48(%rsp), %r9
	movabsq	$-8247349341179448980, %rcx
	xorq	552(%rsp), %rdx
	xorq	712(%rsp), %r10
	movabsq	$4195444129992158507, %r14
	movq	648(%rsp), %r8
	xorq	184(%rsp), %r8
	movabsq	$-1376848230519552085, %r13
	movq	616(%rsp), %rsi
	xorq	200(%rsp), %rsi
	movabsq	$-9209400399786843361, %rbx
	leaq	(%r9,%rdi), %rax
	addq	%r14, %r9
	xorq	176(%rsp), %r11
	xorq	64(%rsp), %r15
	vpxor	%xmm8, %xmm8, %xmm8
	movq	%r8, 184(%rsp)
	leaq	(%rdx,%r10), %r8
	addq	%rcx, %rdx
	movq	%rsi, 200(%rsp)
	leaq	(%rdx,%rax), %rsi
	movabsq	$7667772426219706969, %rdx
	addq	%rdx, %r10
	leaq	(%r9,%r8), %r12
	movq	%r11, 176(%rsp)
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
	vpxor	%xmm4, %xmm4, %xmm4
	addq	%rdi, %r9
	vpxor	%xmm7, %xmm7, %xmm7
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
	vpxor	%xmm12, %xmm12, %xmm12
	movq	%rbx, %r12
	xorq	%r13, %rbx
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	88(%rsp), %r11
	movq	%rbx, 1480(%rsp)
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	112(%rsp), %r9
	movq	%r10, 1160(%rsp)
	movq	%r12, 1128(%rsp)
	movq	96(%rsp), %r10
	movq	104(%rsp), %r12
	addq	%rcx, %r11
	addq	%rax, %r9
	addq	152(%rsp), %r11
	addq	144(%rsp), %r9
	movq	%r13, 1352(%rsp)
	vpxor	%xmm5, %xmm5, %xmm5
	addq	%rdx, %r10
	addq	%r14, %r12
	addq	152(%rsp), %r10
	addq	144(%rsp), %r12
	vpxor	%xmm10, %xmm10, %xmm10
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
	addq	1160(%rsp), %r12
	addq	1128(%rsp), %r9
	xorq	%r13, %r11
	addq	1352(%rsp), %r11
	xorq	%r10, %r13
	addq	1480(%rsp), %r13
	movq	%r13, 1448(%rsp)
	movq	%r13, %rbx
	movabsq	$-3329063056561552456, %r13
	addq	1448(%rsp), %r13
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
	xorq	%r13, %rbx
	xorq	%r11, %r13
	leaq	(%r15,%rcx), %r11
	movq	%rbx, 1096(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r10, 1000(%rsp)
	movq	176(%rsp), %r9
	movq	200(%rsp), %r10
	addq	184(%rsp), %r9
	movq	%r12, 968(%rsp)
	movq	200(%rsp), %rbx
	movq	176(%rsp), %r12
	addq	%rdx, %r10
	addq	%r9, %r11
	addq	%r9, %r10
	movq	184(%rsp), %r9
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
	addq	1000(%rsp), %r12
	xorq	%r9, %r13
	xorq	%rbx, %r9
	addq	968(%rsp), %r9
	xorq	%r13, %r11
	addq	1064(%rsp), %r11
	xorq	%r10, %r13
	addq	1096(%rsp), %r13
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
	movq	%rbx, 1288(%rsp)
	movq	120(%rsp), %rbx
	xorq	%r11, %r12
	xorq	%r12, %r10
	movq	72(%rsp), %r11
	xorq	%r9, %r12
	movq	128(%rsp), %r9
	movq	%r10, 1448(%rsp)
	addq	%rcx, %rbx
	addq	168(%rsp), %rbx
	movq	80(%rsp), %r10
	movq	%r13, 1224(%rsp)
	movq	%r12, 1416(%rsp)
	addq	%rdx, %r9
	rolq	$11, %rbx
	addq	168(%rsp), %r9
	addq	%r14, %r11
	addq	160(%rsp), %r11
	addq	%rax, %r10
	addq	160(%rsp), %r10
	rolq	$23, %r9
	rolq	$59, %r11
	rolq	$37, %r10
	movq	%r9, %r13
	movq	%r11, %r12
	xorq	%rbx, %r13
	xorq	%r10, %r12
	xorq	%r13, %r11
	addq	1448(%rsp), %r11
	xorq	%r12, %rbx
	addq	1224(%rsp), %rbx
	xorq	%r13, %r10
	movq	1288(%rsp), %r13
	addq	1416(%rsp), %r10
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
	movq	%r13, 840(%rsp)
	movq	%rbx, %r12
	movq	840(%rsp), %r9
	addq	1288(%rsp), %r12
	addq	1416(%rsp), %r9
	movq	%r11, 904(%rsp)
	movq	%r10, %r13
	addq	1224(%rsp), %r11
	addq	1448(%rsp), %r13
	movq	%rbx, 936(%rsp)
	movq	%r10, 872(%rsp)
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
	movq	%rbx, 1416(%rsp)
	addq	1000(%rsp), %r13
	addq	968(%rsp), %r9
	movq	%r11, 808(%rsp)
	movq	%r12, 744(%rsp)
	addq	1064(%rsp), %r11
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%r10, 776(%rsp)
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
	movq	1352(%rsp), %r11
	xorq	%r13, %r15
	xorq	%r13, %rbx
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 1288(%rsp)
	movq	%r10, %r13
	addq	1480(%rsp), %rbx
	addq	1160(%rsp), %r13
	movq	%r12, %r9
	addq	1128(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r9
	movabsq	$8467826889434979867, %r13
	movabsq	$6028102484886760763, %rbx
	addq	1480(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$2699039428325208307, %r13
	addq	1480(%rsp), %r13
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
	movq	%r13, 1352(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, %r13
	movq	%r12, 1128(%rsp)
	addq	1288(%rsp), %r13
	movq	%r10, %r12
	movq	1128(%rsp), %r9
	addq	1224(%rsp), %r12
	addq	%r15, %r11
	addq	1448(%rsp), %r9
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 1480(%rsp)
	movq	%r10, 1160(%rsp)
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
	movq	%r13, 1064(%rsp)
	movq	%r13, %r11
	movq	%r12, 968(%rsp)
	addq	808(%rsp), %r11
	movq	%r10, %r12
	movq	968(%rsp), %r9
	addq	776(%rsp), %r12
	movq	%rbx, %r13
	addq	744(%rsp), %r9
	addq	1416(%rsp), %r13
	movq	%rbx, 1096(%rsp)
	movq	%r10, 1000(%rsp)
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
	movq	%rbx, 1288(%rsp)
	xorq	%r9, %r12
	movq	%r10, 1448(%rsp)
	movq	%r13, %r10
	movq	1448(%rsp), %r11
	addq	904(%rsp), %r10
	addq	872(%rsp), %r11
	movq	%r13, 1224(%rsp)
	movq	%r12, %r13
	movq	%r12, 1416(%rsp)
	addq	840(%rsp), %r13
	movq	%rbx, %r12
	addq	936(%rsp), %r12
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
	movq	%r13, 840(%rsp)
	movq	%r11, 904(%rsp)
	movq	%r10, %r13
	addq	1224(%rsp), %r11
	movq	840(%rsp), %r9
	addq	1448(%rsp), %r13
	movq	%rbx, %r12
	addq	1416(%rsp), %r9
	addq	1288(%rsp), %r12
	movq	%rbx, 936(%rsp)
	movq	%r10, 872(%rsp)
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
	movq	%r11, 808(%rsp)
	movq	%r10, %r13
	addq	1064(%rsp), %r11
	addq	1000(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 744(%rsp)
	addq	968(%rsp), %r9
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%rbx, 1416(%rsp)
	movq	%r10, 776(%rsp)
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
	movq	1352(%rsp), %r11
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	addq	1128(%rsp), %r9
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r10, %r13
	movq	%rbx, 1288(%rsp)
	addq	1160(%rsp), %r13
	addq	%r15, %r11
	addq	1480(%rsp), %rbx
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r11
	movabsq	$-1914029582460860148, %r13
	movabsq	$6609752215332129920, %rbx
	addq	%r13, %r12
	movabsq	$7484883476188376383, %r13
	addq	%rbx, %r9
	movabsq	$-7632797540959622777, %rbx
	addq	1480(%rsp), %rbx
	addq	1480(%rsp), %r13
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
	movq	%rbx, 1480(%rsp)
	movq	%r13, %r11
	movq	%r12, 1128(%rsp)
	movq	%r13, 1352(%rsp)
	movq	%r10, %r12
	movq	1128(%rsp), %r9
	addq	1224(%rsp), %r12
	addq	1448(%rsp), %r9
	movq	%rbx, %r13
	addq	1288(%rsp), %r13
	addq	%r15, %r11
	movq	%r10, 1160(%rsp)
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
	movq	%r13, 1064(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	addq	808(%rsp), %r11
	movq	%r12, 968(%rsp)
	movq	%rbx, %r13
	movq	%r10, %r12
	addq	1416(%rsp), %r13
	addq	776(%rsp), %r12
	movq	968(%rsp), %r9
	addq	744(%rsp), %r9
	movq	%rbx, 1096(%rsp)
	movq	%r10, 1000(%rsp)
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
	movq	%r10, 1448(%rsp)
	movq	%r13, %r10
	movq	1448(%rsp), %r11
	addq	904(%rsp), %r10
	addq	872(%rsp), %r11
	movq	%r13, 1224(%rsp)
	movq	%r12, %r13
	movq	%r12, 1416(%rsp)
	addq	840(%rsp), %r13
	movq	%rbx, %r12
	addq	936(%rsp), %r12
	movq	%rbx, 1288(%rsp)
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
	movq	%r13, 840(%rsp)
	movq	%r10, %r13
	xorq	%r12, %rbx
	xorq	%r12, %r11
	addq	1448(%rsp), %r13
	movq	%r11, 904(%rsp)
	movq	840(%rsp), %r9
	movq	%rbx, %r12
	addq	1224(%rsp), %r11
	addq	1416(%rsp), %r9
	addq	1288(%rsp), %r12
	movq	%rbx, 936(%rsp)
	movq	%r10, 872(%rsp)
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
	movq	%rbx, 1416(%rsp)
	movq	%r10, %r13
	movq	%r11, 808(%rsp)
	addq	1000(%rsp), %r13
	movq	%r12, %r9
	addq	1064(%rsp), %r11
	addq	968(%rsp), %r9
	movq	%r12, 744(%rsp)
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%r10, 776(%rsp)
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
	movq	1352(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r13, %r15
	movq	%rbx, 1288(%rsp)
	movq	%r10, %r13
	addq	1480(%rsp), %rbx
	addq	1160(%rsp), %r13
	movq	%r12, %r9
	addq	1128(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r9
	movabsq	$3174302594670681997, %r13
	movabsq	$-8739574512844769069, %rbx
	addq	1480(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$6378106504303230091, %r13
	addq	1480(%rsp), %r13
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
	movq	%rbx, 1352(%rsp)
	movq	%r13, 1160(%rsp)
	movq	%r10, %rbx
	movq	%r12, %r9
	addq	1224(%rsp), %rbx
	addq	1448(%rsp), %r9
	movq	1352(%rsp), %r13
	movabsq	$-3329063056561552456, %r15
	addq	1288(%rsp), %r13
	movq	%r10, 1128(%rsp)
	movq	%r12, 1096(%rsp)
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
	movq	%r12, 1064(%rsp)
	movq	%rbx, %r11
	xorq	%r10, %r13
	xorq	%r9, %r10
	addq	808(%rsp), %r11
	movq	%r13, 968(%rsp)
	movq	%r13, %r12
	movq	%r10, %r9
	addq	776(%rsp), %r12
	addq	744(%rsp), %r9
	movq	1064(%rsp), %r13
	addq	1416(%rsp), %r13
	movq	%rbx, 1000(%rsp)
	movq	%r10, 712(%rsp)
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
	movq	%rbx, 1288(%rsp)
	xorq	%r9, %r12
	movq	%r10, 1448(%rsp)
	movq	%r13, %r11
	addq	872(%rsp), %r10
	addq	904(%rsp), %r11
	movq	%r13, 1224(%rsp)
	movq	%r12, 1416(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	840(%rsp), %r13
	addq	936(%rsp), %r12
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
	movq	%r10, 1480(%rsp)
	addq	1480(%rsp), %r12
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
	addq	1480(%rsp), %r13
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
	addq	1448(%rsp), %r13
	addq	1416(%rsp), %r10
	xorq	%r11, %rbx
	xorq	%r12, %r11
	addq	1224(%rsp), %rbx
	addq	1288(%rsp), %r11
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
	addq	968(%rsp), %r13
	addq	1000(%rsp), %rbx
	xorq	%r11, %r10
	xorq	%r9, %r12
	addq	712(%rsp), %r10
	addq	1064(%rsp), %r12
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
	addq	1128(%rsp), %r11
	xorq	%r12, %rbx
	xorq	%r12, %r9
	movq	1032(%rsp), %r12
	addq	1352(%rsp), %r9
	addq	1160(%rsp), %rbx
	xorq	%r13, %r10
	addq	1096(%rsp), %r10
	addq	$1, %r12
	movq	%r11, InternalState+8(%rip)
	movq	%r12, 200(%rsp)
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
	movq	%r13, 1352(%rsp)
	movq	InternalState+48(%rip), %r13
	movq	%r10, 1160(%rsp)
	movq	%r12, 1128(%rsp)
	movq	InternalState+32(%rip), %r10
	movq	InternalState+40(%rip), %r12
	leaq	(%r15,%r13), %r9
	movq	%rbx, 1480(%rsp)
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
	addq	1128(%rsp), %r9
	addq	1352(%rsp), %r11
	addq	1160(%rsp), %r12
	xorq	%r10, %r13
	addq	1480(%rsp), %r13
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
	movq	%r13, 1064(%rsp)
	movq	InternalState+80(%rip), %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, 1096(%rsp)
	movq	%r10, 1000(%rsp)
	movq	%r12, 968(%rsp)
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
	addq	1000(%rsp), %r12
	xorq	%r13, %r11
	addq	1064(%rsp), %r11
	xorq	%rbx, %r9
	xorq	%r10, %r13
	addq	968(%rsp), %r9
	addq	1096(%rsp), %r13
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
	movq	%rbx, 1288(%rsp)
	xorq	%r11, %r15
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	InternalState+120(%rip), %r9
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	addq	1224(%rsp), %rbx
	xorq	%r9, %r13
	xorq	%r12, %r9
	addq	1448(%rsp), %r9
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	1288(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	movq	%r13, %r10
	movq	%r13, 1416(%rsp)
	movabsq	$-3329063056561552456, %r13
	addq	%r9, %r10
	addq	%r8, %r9
	addq	1416(%rsp), %r13
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
	movq	%r12, 872(%rsp)
	movq	%r10, %r13
	movq	%r12, %r9
	addq	1224(%rsp), %r13
	addq	1448(%rsp), %r9
	movq	%rbx, %r12
	addq	1288(%rsp), %r12
	movq	%r11, 936(%rsp)
	addq	%r15, %r11
	movq	%rbx, 1416(%rsp)
	movq	%r10, 904(%rsp)
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
	movq	%r11, 808(%rsp)
	movq	%r10, %r13
	addq	1064(%rsp), %r11
	addq	1000(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 744(%rsp)
	addq	968(%rsp), %r9
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%rbx, 840(%rsp)
	movq	%r10, 776(%rsp)
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
	movq	1352(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r13, %r15
	movq	%rbx, 1288(%rsp)
	movq	%r10, %r13
	addq	1480(%rsp), %rbx
	addq	1160(%rsp), %r13
	movq	%r12, %r9
	addq	1128(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r9
	xorq	%r10, %r12
	movabsq	$8467826889434979867, %r13
	movabsq	$6028102484886760763, %rbx
	addq	1480(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$2699039428325208307, %r13
	addq	1480(%rsp), %r13
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
	movq	%r13, 1352(%rsp)
	movq	%r12, 1128(%rsp)
	movq	%r13, %r11
	movq	%r10, %r12
	movq	1128(%rsp), %r9
	addq	1224(%rsp), %r12
	movq	%rbx, %r13
	addq	1448(%rsp), %r9
	addq	1288(%rsp), %r13
	addq	%r15, %r11
	movq	%rbx, 1480(%rsp)
	movabsq	$-3329063056561552456, %r15
	movq	%r10, 1160(%rsp)
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
	movq	%rbx, 1096(%rsp)
	movq	%r13, %r11
	movq	%r12, 968(%rsp)
	addq	808(%rsp), %r11
	movq	%r10, %r12
	movq	%r13, 1064(%rsp)
	addq	776(%rsp), %r12
	movq	%rbx, %r13
	movq	968(%rsp), %r9
	addq	840(%rsp), %r13
	addq	744(%rsp), %r9
	movq	%r10, 1000(%rsp)
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
	movq	%rbx, 1288(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r10, %rbx
	movq	1288(%rsp), %r10
	addq	1416(%rsp), %r10
	xorq	%r11, %r15
	addq	904(%rsp), %rbx
	xorq	%r9, %r12
	movq	936(%rsp), %r11
	movq	%r12, %r9
	addq	872(%rsp), %r9
	movabsq	$-3329063056561552456, %r13
	movq	%r12, 1448(%rsp)
	movq	%r10, 1416(%rsp)
	addq	1416(%rsp), %r13
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
	movq	%r12, 872(%rsp)
	movq	%r10, %r13
	movq	%r12, %r9
	addq	1224(%rsp), %r13
	addq	1448(%rsp), %r9
	movq	%rbx, %r12
	addq	1288(%rsp), %r12
	movq	%r11, 936(%rsp)
	addq	%r15, %r11
	movq	%rbx, 1416(%rsp)
	movq	%r10, 904(%rsp)
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
	movq	%r11, 808(%rsp)
	addq	1000(%rsp), %r13
	movq	%r12, %r9
	addq	1064(%rsp), %r11
	addq	968(%rsp), %r9
	movq	%r12, 744(%rsp)
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%r10, 776(%rsp)
	movq	%rbx, 840(%rsp)
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
	movq	%rbx, 1288(%rsp)
	xorq	%r11, %r12
	movq	1352(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r10, %r13
	movq	%r12, %r9
	addq	1160(%rsp), %r13
	addq	1128(%rsp), %r9
	addq	%r15, %r11
	addq	1480(%rsp), %rbx
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r9
	movabsq	$-1914029582460860148, %r13
	movabsq	$-7632797540959622777, %rbx
	addq	1480(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$7484883476188376383, %r13
	addq	1480(%rsp), %r13
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
	movq	%r13, 1096(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, %r13
	movq	%r12, 1000(%rsp)
	addq	1288(%rsp), %r13
	movq	%r10, %r12
	movq	1000(%rsp), %r9
	addq	1224(%rsp), %r12
	addq	%r15, %r11
	addq	1448(%rsp), %r9
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 1128(%rsp)
	movq	%r10, 1064(%rsp)
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
	movq	%r13, 1352(%rsp)
	movq	%r13, %r11
	movq	%r12, 968(%rsp)
	addq	808(%rsp), %r11
	movq	%r10, %r12
	movq	968(%rsp), %r9
	addq	776(%rsp), %r12
	movq	%rbx, %r13
	addq	744(%rsp), %r9
	addq	840(%rsp), %r13
	movq	%rbx, 1480(%rsp)
	movq	%r10, 1160(%rsp)
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
	movq	%rbx, 1288(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r10, %rbx
	movq	1288(%rsp), %r10
	addq	1416(%rsp), %r10
	xorq	%r11, %r15
	xorq	%r9, %r12
	addq	904(%rsp), %rbx
	movq	936(%rsp), %r11
	movq	%r12, %r9
	addq	872(%rsp), %r9
	movq	%r12, 1448(%rsp)
	movabsq	$-3329063056561552456, %r13
	movq	%r10, 1416(%rsp)
	addq	1416(%rsp), %r13
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
	movq	%r13, 840(%rsp)
	movq	%r11, 904(%rsp)
	movq	%r10, %r13
	addq	%r15, %r11
	addq	1224(%rsp), %r13
	movq	840(%rsp), %r9
	movq	%rbx, %r12
	addq	1448(%rsp), %r9
	addq	1288(%rsp), %r12
	movq	%rbx, 936(%rsp)
	movq	%r10, 872(%rsp)
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
	movq	%r11, 776(%rsp)
	movq	%r10, %r13
	addq	1352(%rsp), %r11
	addq	1160(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 712(%rsp)
	addq	968(%rsp), %r9
	movq	%rbx, %r12
	addq	1480(%rsp), %r12
	movq	%rbx, 808(%rsp)
	movq	%r10, 744(%rsp)
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
	movq	1096(%rsp), %r11
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	addq	1000(%rsp), %r9
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r10, %r13
	movq	%rbx, 1480(%rsp)
	addq	1064(%rsp), %r13
	addq	%r15, %r11
	addq	1128(%rsp), %rbx
	movq	%r10, 1352(%rsp)
	movq	%r12, 1160(%rsp)
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
	movq	%r13, 1448(%rsp)
	addq	%rbx, %r11
	movabsq	$3174302594670681997, %r13
	movabsq	$-496885038275669880, %rbx
	addq	%r13, %r12
	movabsq	$6378106504303230091, %r13
	addq	%rbx, %r9
	movabsq	$-8739574512844769069, %rbx
	addq	1448(%rsp), %rbx
	addq	1448(%rsp), %r13
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
	movq	%rbx, 1288(%rsp)
	movq	%rbx, preCompInternalState(%rip)
	movq	%r13, 1224(%rsp)
	movq	%r12, %r9
	movq	%r13, preCompInternalState+8(%rip)
	movq	%r10, 1448(%rsp)
	movq	%r10, preCompInternalState+16(%rip)
	movq	%r12, 1416(%rsp)
	movq	%r13, %r10
	addq	1160(%rsp), %r9
	movq	1448(%rsp), %rbx
	addq	%r15, %r10
	addq	1352(%rsp), %rbx
	movq	1288(%rsp), %r13
	movabsq	$-3329063056561552456, %r15
	addq	1480(%rsp), %r13
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
	addq	776(%rsp), %r10
	xorq	%rbx, %r13
	xorq	%r9, %rbx
	movq	%r12, 1096(%rsp)
	movq	%rbx, 968(%rsp)
	movq	%r13, 1000(%rsp)
	movq	%r13, %rbx
	movq	968(%rsp), %r9
	addq	744(%rsp), %rbx
	movq	%r12, %r13
	addq	712(%rsp), %r9
	addq	808(%rsp), %r13
	movq	%r11, 1064(%rsp)
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
	movq	%r11, 1352(%rsp)
	movq	%r11, %r10
	movq	%r13, %r11
	addq	904(%rsp), %r10
	addq	872(%rsp), %r11
	movq	%r13, 1160(%rsp)
	movq	%r12, 1128(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	840(%rsp), %r13
	addq	936(%rsp), %r12
	movq	%rbx, 1480(%rsp)
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
	movq	1160(%rsp), %r13
	movq	%r11, preCompInternalState+104(%rip)
	addq	1352(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r12, %r9
	movq	%rbx, preCompInternalState+96(%rip)
	movq	%r10, preCompInternalState+112(%rip)
	addq	%r10, %r13
	movq	%r9, preCompInternalState+120(%rip)
	movq	%r11, InternalState+64(%rip)
	movq	%r13, InternalState+72(%rip)
	leaq	(%r11,%r13), %r10
	addq	1128(%rsp), %r9
	addq	1480(%rsp), %rbx
	addq	%rdx, %r13
	addq	%rcx, %r11
	movq	208(%rsp), %r15
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
	addq	968(%rsp), %r9
	addq	1096(%rsp), %r12
	movq	%r11, preCompInternalState+72(%rip)
	movq	1000(%rsp), %r13
	addq	1064(%rsp), %r11
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
	addq	1224(%rsp), %r11
	addq	1448(%rsp), %r10
	addq	1416(%rsp), %r9
	addq	1288(%rsp), %rbx
	movq	%r10, InternalState+8(%rip)
	movq	%r11, InternalState(%rip)
	movq	%rbx, InternalState+24(%rip)
	movq	%r9, InternalState+16(%rip)
	xorq	(%r15), %r11
	movq	192(%rsp), %rbx
	movq	%r11, (%rbx)
	movq	8(%r15), %r9
	xorq	InternalState+8(%rip), %r9
	movq	(%r15), %r11
	movq	%r9, 8(%rbx)
	movq	16(%r15), %r9
	xorq	InternalState+16(%rip), %r9
	movq	8(%r15), %r13
	movq	192(%rsp), %r10
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
	movq	%r15, 8(%rsp)
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
	movq	%rbx, 1480(%rsp)
	movq	%r13, 1352(%rsp)
	movq	%r10, 1160(%rsp)
	movq	%r12, 1128(%rsp)
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
	addq	1160(%rsp), %r12
	addq	1128(%rsp), %r9
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	1352(%rsp), %r11
	addq	1480(%rsp), %r13
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
	movq	%r10, 1000(%rsp)
	movq	%r12, 968(%rsp)
	movq	InternalState+72(%rip), %r10
	movq	InternalState+80(%rip), %r12
	movq	8(%rsp), %r9
	movq	%rbx, 1096(%rsp)
	movq	%r13, 1064(%rsp)
	leaq	(%r10,%r11), %rbx
	addq	%rcx, %r11
	addq	%rdx, %r10
	addq	%r12, %r9
	addq	%r9, %r11
	addq	%r9, %r10
	leaq	(%r12,%rax), %r9
	movq	8(%rsp), %r12
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
	addq	1000(%rsp), %r12
	xorq	%r9, %r13
	xorq	%rbx, %r9
	addq	968(%rsp), %r9
	xorq	%r13, %r11
	addq	1064(%rsp), %r11
	xorq	%r10, %r13
	addq	1096(%rsp), %r13
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
	movq	%rbx, 1288(%rsp)
	xorq	%r11, %r15
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	InternalState+120(%rip), %r9
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	addq	1224(%rsp), %rbx
	xorq	%r9, %r13
	xorq	%r12, %r9
	addq	1448(%rsp), %r9
	xorq	%r13, %r11
	xorq	%r10, %r13
	addq	1288(%rsp), %r13
	addq	%r15, %r11
	leaq	(%rbx,%r11), %r12
	movq	%r13, %r10
	movq	%r13, 1416(%rsp)
	movabsq	$-3329063056561552456, %r13
	addq	%r9, %r10
	addq	1416(%rsp), %r13
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
	movq	%rbx, 1416(%rsp)
	movq	%r10, %r13
	addq	1448(%rsp), %r9
	addq	1224(%rsp), %r13
	movq	%r12, 872(%rsp)
	movq	%rbx, %r12
	addq	1288(%rsp), %r12
	movq	%r11, 936(%rsp)
	addq	%r15, %r11
	movq	%r10, 904(%rsp)
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
	movq	%r11, 808(%rsp)
	movq	%r10, %r13
	addq	1064(%rsp), %r11
	addq	1000(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 744(%rsp)
	addq	968(%rsp), %r9
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%rbx, 840(%rsp)
	movq	%r10, 776(%rsp)
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
	movq	1352(%rsp), %r11
	xorq	%r12, %r10
	xorq	%r13, %rbx
	xorq	%r9, %r12
	xorq	%r13, %r15
	movq	%rbx, 1288(%rsp)
	movq	%r10, %r13
	addq	1480(%rsp), %rbx
	addq	1160(%rsp), %r13
	movq	%r12, %r9
	addq	1128(%rsp), %r9
	addq	%r15, %r11
	movq	%r10, 1224(%rsp)
	movq	%r12, 1448(%rsp)
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r9
	movabsq	$8467826889434979867, %r13
	movabsq	$6028102484886760763, %rbx
	addq	1480(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$2699039428325208307, %r13
	addq	1480(%rsp), %r13
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
	movq	%r12, 1128(%rsp)
	movq	%r13, 1352(%rsp)
	movq	%r10, %r12
	movq	1128(%rsp), %r9
	addq	1224(%rsp), %r12
	addq	1448(%rsp), %r9
	movq	%rbx, %r13
	addq	1288(%rsp), %r13
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 1480(%rsp)
	movq	%r10, 1160(%rsp)
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
	movq	%rbx, 1096(%rsp)
	movq	%r13, %r11
	movq	%r13, 1064(%rsp)
	addq	808(%rsp), %r11
	movq	%rbx, %r13
	movq	%r12, 968(%rsp)
	addq	840(%rsp), %r13
	movq	%r10, %r12
	movq	968(%rsp), %r9
	addq	776(%rsp), %r12
	addq	744(%rsp), %r9
	movq	%r10, 1000(%rsp)
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
	movq	%rbx, 1288(%rsp)
	xorq	%r11, %r15
	xorq	%r12, %r10
	movq	936(%rsp), %r11
	xorq	%r9, %r12
	movq	%r10, 1224(%rsp)
	movq	%r10, %rbx
	movq	1288(%rsp), %r10
	addq	1416(%rsp), %r10
	addq	904(%rsp), %rbx
	movq	%r12, %r9
	addq	872(%rsp), %r9
	movabsq	$-3329063056561552456, %r13
	addq	%r15, %r11
	movq	%r12, 1448(%rsp)
	movq	%r10, 1416(%rsp)
	addq	1416(%rsp), %r13
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
	movq	%r12, 872(%rsp)
	movq	%r10, %r13
	movq	%r12, %r9
	addq	1224(%rsp), %r13
	addq	1448(%rsp), %r9
	movq	%rbx, %r12
	addq	1288(%rsp), %r12
	movq	%r11, 936(%rsp)
	addq	%r15, %r11
	movq	%rbx, 1416(%rsp)
	movq	%r10, 904(%rsp)
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
	movq	%r12, 744(%rsp)
	movq	%r12, %r9
	xorq	%r13, %rbx
	xorq	%r13, %r11
	addq	968(%rsp), %r9
	movq	%r11, 808(%rsp)
	movq	%r10, %r13
	addq	1064(%rsp), %r11
	addq	1000(%rsp), %r13
	movq	%rbx, %r12
	addq	1096(%rsp), %r12
	movq	%rbx, 840(%rsp)
	movq	%r10, 776(%rsp)
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
	movq	%rbx, 1288(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r10, %r13
	movq	1352(%rsp), %r11
	addq	1160(%rsp), %r13
	movq	%r12, 1448(%rsp)
	addq	%r15, %r11
	addq	1128(%rsp), %r9
	addq	1480(%rsp), %rbx
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
	movq	%r13, 1480(%rsp)
	addq	%rbx, %r9
	movabsq	$-1914029582460860148, %r13
	movabsq	$-7632797540959622777, %rbx
	addq	1480(%rsp), %rbx
	addq	%r13, %r12
	movabsq	$7484883476188376383, %r13
	addq	1480(%rsp), %r13
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
	movq	%r13, 1096(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%rbx, %r13
	movq	%r12, 1000(%rsp)
	addq	1288(%rsp), %r13
	movq	%r10, %r12
	movq	1000(%rsp), %r9
	addq	1224(%rsp), %r12
	addq	%r15, %r11
	addq	1448(%rsp), %r9
	movabsq	$-3329063056561552456, %r15
	movq	%rbx, 1128(%rsp)
	movq	%r10, 1064(%rsp)
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
	movq	%r13, 1352(%rsp)
	movq	%r13, %r11
	movq	%r12, 968(%rsp)
	addq	808(%rsp), %r11
	movq	%r10, %r12
	movq	968(%rsp), %r9
	addq	776(%rsp), %r12
	movq	%rbx, %r13
	addq	744(%rsp), %r9
	addq	840(%rsp), %r13
	movq	%rbx, 1480(%rsp)
	movq	%r10, 1160(%rsp)
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
	movq	%rbx, 1288(%rsp)
	movq	%r10, 1224(%rsp)
	movq	%r10, %rbx
	movq	1288(%rsp), %r10
	addq	1416(%rsp), %r10
	xorq	%r11, %r15
	xorq	%r9, %r12
	addq	904(%rsp), %rbx
	movq	936(%rsp), %r11
	movq	%r12, %r9
	addq	872(%rsp), %r9
	movq	%r12, 1448(%rsp)
	movabsq	$-3329063056561552456, %r13
	movq	%r10, 1416(%rsp)
	addq	1416(%rsp), %r13
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
	movq	%r13, 840(%rsp)
	movq	%r11, 904(%rsp)
	movq	%r10, %r13
	addq	%r15, %r11
	movq	840(%rsp), %r9
	addq	1224(%rsp), %r13
	movq	%rbx, %r12
	addq	1448(%rsp), %r9
	addq	1288(%rsp), %r12
	movq	%rbx, 936(%rsp)
	movq	%r10, 872(%rsp)
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
	movq	%r11, 776(%rsp)
	movq	%r10, %r13
	addq	1352(%rsp), %r11
	addq	1160(%rsp), %r13
	movq	%r12, %r9
	movq	%r12, 712(%rsp)
	addq	968(%rsp), %r9
	movq	%rbx, %r12
	addq	1480(%rsp), %r12
	movq	%rbx, 808(%rsp)
	movq	%r10, 744(%rsp)
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
	movq	1096(%rsp), %r11
	movq	%r10, %r13
	xorq	%r12, %r10
	xorq	%r9, %r12
	xorq	%r9, %r13
	movq	%r12, %r9
	addq	1000(%rsp), %r9
	xorq	%r13, %rbx
	xorq	%r13, %r15
	movq	%r10, %r13
	movq	%rbx, 1480(%rsp)
	addq	1064(%rsp), %r13
	addq	%r15, %r11
	addq	1128(%rsp), %rbx
	movq	%r10, 1352(%rsp)
	movq	%r12, 1160(%rsp)
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
	movq	%r13, 1448(%rsp)
	addq	%rbx, %r11
	movabsq	$3174302594670681997, %r13
	movabsq	$-496885038275669880, %rbx
	addq	%r13, %r12
	movabsq	$6378106504303230091, %r13
	addq	%rbx, %r9
	movabsq	$-8739574512844769069, %rbx
	addq	1448(%rsp), %rbx
	addq	1448(%rsp), %r13
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
	movq	%rbx, 1288(%rsp)
	movq	%rbx, preCompInternalState(%rip)
	movq	%r13, 1224(%rsp)
	movq	%r13, %r11
	movq	%r13, preCompInternalState+8(%rip)
	movq	%r10, 1448(%rsp)
	movq	%rbx, %r13
	movq	%r10, preCompInternalState+16(%rip)
	movq	%r12, 1416(%rsp)
	addq	%r15, %r11
	addq	1480(%rsp), %r13
	movq	%r12, preCompInternalState+24(%rip)
	movq	%r10, %r12
	movq	1416(%rsp), %r9
	addq	1352(%rsp), %r12
	movabsq	$-3329063056561552456, %r15
	addq	1160(%rsp), %r9
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
	movq	%r13, 1064(%rsp)
	movq	%r13, %r11
	xorq	%r12, %r10
	xorq	%r9, %r12
	addq	776(%rsp), %r11
	movq	%r12, 968(%rsp)
	movq	%rbx, %r13
	movq	%r10, %r12
	addq	808(%rsp), %r13
	addq	744(%rsp), %r12
	movq	968(%rsp), %r9
	addq	712(%rsp), %r9
	movq	%rbx, 1096(%rsp)
	movq	%r10, 1000(%rsp)
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
	movq	%r10, 1160(%rsp)
	movq	%r13, %r11
	addq	904(%rsp), %r11
	addq	872(%rsp), %r10
	movq	%r13, 1352(%rsp)
	movq	%r12, 1128(%rsp)
	movq	%r12, %r13
	movq	%rbx, %r12
	addq	840(%rsp), %r13
	addq	936(%rsp), %r12
	movq	%rbx, 1480(%rsp)
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
	addq	1160(%rsp), %r12
	xorq	%rbx, %r15
	xorq	%rdi, %rbx
	movq	%r13, preCompInternalState+120(%rip)
	movq	%rbx, preCompInternalState+104(%rip)
	addq	1352(%rsp), %rbx
	movq	%r15, preCompInternalState+96(%rip)
	leaq	(%r12,%rdx), %r9
	movq	%rbx, InternalState+64(%rip)
	movq	%r12, InternalState+72(%rip)
	leaq	(%rbx,%rcx), %r8
	addq	1128(%rsp), %r13
	addq	1480(%rsp), %r15
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
	movq	1000(%rsp), %r8
	movq	%rsi, preCompInternalState+88(%rip)
	movq	%r11, preCompInternalState+72(%rip)
	addq	1064(%rsp), %r11
	movq	%r9, preCompInternalState+64(%rip)
	addq	%rdi, %r8
	movq	968(%rsp), %rdi
	movq	%r8, InternalState+40(%rip)
	addq	%rsi, %rdi
	movq	1096(%rsp), %rsi
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
	addq	%r8, %rdx
	addq	%rdi, %rax
	addq	%r10, %rdx
	addq	%r9, %rax
	addq	%rsi, %r9
	rolq	$23, %rdx
	rolq	$59, %r9
	rolq	$37, %rax
	movq	%rdx, %rsi
	movq	%r9, %rdi
	xorq	%rcx, %rsi
	xorq	%rax, %rdi
	xorq	%rsi, %r9
	xorq	%rsi, %rax
	xorq	%rdi, %rdx
	xorq	%rdi, %rcx
	movq	%r9, preCompInternalState+48(%rip)
	movq	%rdx, preCompInternalState+32(%rip)
	addq	1448(%rsp), %r9
	addq	1288(%rsp), %rdx
	movq	%rcx, preCompInternalState+40(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	addq	1224(%rsp), %rcx
	addq	1416(%rsp), %rax
	movq	%r9, InternalState+8(%rip)
	movq	%rdx, InternalState+24(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%rax, InternalState+16(%rip)
	vmovdqa	InternalState(%rip), %ymm0
	vmovdqa	%ymm0, 1672(%rsp)
	vmovdqa	InternalState+32(%rip), %ymm0
	vmovdqa	%ymm0, 1704(%rsp)
	vmovdqa	InternalState+64(%rip), %ymm0
	vmovdqa	%ymm0, 1736(%rsp)
	movq	1032(%rsp), %r10
	movq	1032(%rsp), %rsi
	vmovdqa	InternalState+96(%rip), %ymm0
	addq	1256(%rsp), %r9
	addq	1320(%rsp), %rax
	subq	$2, %r10
	addq	648(%rsp), %r13
	addq	680(%rsp), %r15
	movq	%r10, 1288(%rsp)
	addq	1192(%rsp), %rcx
	subq	$1, %rsi
	addq	1384(%rsp), %rdx
	addq	584(%rsp), %rbx
	vmovdqa	%ymm0, 1768(%rsp)
	addq	616(%rsp), %r12
	vmovq	1288(%rsp), %xmm11
	vmovq	1032(%rsp), %xmm9
	vpinsrq	$1, 200(%rsp), %xmm9, %xmm0
	movq	%rax, 1560(%rsp)
	movq	%r9, 1552(%rsp)
	vpinsrq	$1, %rsi, %xmm11, %xmm1
	movq	%r13, 1592(%rsp)
	movq	%r15, 1600(%rsp)
	vpxor	%xmm9, %xmm9, %xmm9
	movq	%rcx, 1544(%rsp)
	vpxor	%xmm11, %xmm11, %xmm11
	movq	%rdx, 1568(%rsp)
	vpinsrq	$0, %r9, %xmm8, %xmm8
	movq	%rbx, 1576(%rsp)
	vpinsrq	$0, %rax, %xmm4, %xmm4
	movq	1672(%rsp), %rax
	vpinsrq	$0, %r13, %xmm5, %xmm5
	movq	%r12, 1584(%rsp)
	vpinsrq	$0, %r15, %xmm10, %xmm10
	vmovdqa	%xmm8, %xmm8
	vpinsrq	$0, %rcx, %xmm9, %xmm9
	vmovdqa	%xmm4, %xmm4
	vpinsrq	$0, %rdx, %xmm7, %xmm7
	vmovdqa	%xmm5, %xmm5
	vpinsrq	$0, %rbx, %xmm12, %xmm12
	vmovdqa	%xmm10, %xmm10
	vpinsrq	$0, %r12, %xmm11, %xmm11
	vmovdqa	%xmm9, %xmm9
	vinserti128	$0x1, %xmm0, %ymm1, %ymm1
	vmovdqa	%xmm7, %xmm7
	vmovdqa	%xmm12, %xmm12
	vmovdqa	%ymm9, 1800(%rsp)
	vmovdqa	%xmm11, %xmm11
	vmovdqa	%ymm8, 1832(%rsp)
	vmovdqa	%ymm1, 1288(%rsp)
	vmovdqa	%ymm4, 1864(%rsp)
	vmovdqa	%ymm7, 1896(%rsp)
	vmovdqa	%ymm12, 1928(%rsp)
	vmovdqa	%ymm11, 1960(%rsp)
	vmovdqa	%ymm5, 1992(%rsp)
	vmovdqa	%ymm10, 2024(%rsp)
	movq	%rax, 216(%rsp)
	movq	1688(%rsp), %r11
	movq	1696(%rsp), %r13
	vbroadcastsd	216(%rsp), %ymm0
	movq	1704(%rsp), %r14
	movq	%r11, (%rsp)
	movq	1712(%rsp), %r15
	vmovdqa	%ymm0, 488(%rsp)
	movq	1680(%rsp), %r8
	movq	1728(%rsp), %r9
	vmovdqa	%ymm0, 2056(%rsp)
	vmovq	(%rsp), %xmm0
	movq	%r13, (%rsp)
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vmovq	(%rsp), %xmm1
	movq	%r14, (%rsp)
	vmovq	(%rsp), %xmm2
	movq	%r15, (%rsp)
	vpunpcklqdq	%xmm2, %xmm2, %xmm2
	movq	%r8, 224(%rsp)
	vmovq	(%rsp), %xmm3
	movq	1720(%rsp), %r8
	vpunpcklqdq	%xmm3, %xmm3, %xmm6
	movq	%r9, 168(%rsp)
	vpunpcklqdq	%xmm1, %xmm1, %xmm1
	vbroadcastsd	224(%rsp), %ymm13
	vinserti128	$1, %xmm2, %ymm2, %ymm2
	movq	%r8, 176(%rsp)
	vinserti128	$1, %xmm0, %ymm0, %ymm0
	vbroadcastsd	176(%rsp), %ymm3
	vinserti128	$1, %xmm1, %ymm1, %ymm1
	vmovdqa	%ymm13, 968(%rsp)
	vinserti128	$1, %xmm6, %ymm6, %ymm6
	vmovdqa	%ymm2, 712(%rsp)
	vmovdqa	%ymm2, 2184(%rsp)
	vbroadcastsd	168(%rsp), %ymm2
	vmovdqa	%ymm13, 2088(%rsp)
	vmovdqa	%ymm0, 776(%rsp)
	vmovdqa	%ymm0, 2120(%rsp)
	vmovdqa	%ymm1, 744(%rsp)
	vmovdqa	%ymm1, 2152(%rsp)
	vmovdqa	%ymm6, 2216(%rsp)
	vmovdqa	%ymm3, 2248(%rsp)
	vmovdqa	%ymm2, 2280(%rsp)
	movq	1736(%rsp), %r10
	movq	1744(%rsp), %rax
	movq	1752(%rsp), %r8
	movq	%r10, 160(%rsp)
	movq	1768(%rsp), %r10
	movq	%rax, 152(%rsp)
	movq	1776(%rsp), %rax
	vbroadcastsd	160(%rsp), %ymm13
	movq	1760(%rsp), %r9
	movq	%r10, 120(%rsp)
	vbroadcastsd	152(%rsp), %ymm0
	movq	%rax, 112(%rsp)
	vmovdqa	%ymm13, 552(%rsp)
	movq	1784(%rsp), %rax
	vmovdqa	%ymm13, 2312(%rsp)
	movq	%r8, 144(%rsp)
	movq	%r9, 128(%rsp)
	vbroadcastsd	120(%rsp), %ymm13
	movq	%rax, 104(%rsp)
	vmovdqa	%ymm0, 680(%rsp)
	vmovdqa	%ymm13, 648(%rsp)
	movq	1792(%rsp), %rax
	vmovdqa	%ymm13, 2440(%rsp)
	vbroadcastsd	112(%rsp), %ymm13
	vmovdqa	%ymm0, 2344(%rsp)
	vbroadcastsd	144(%rsp), %ymm1
	vbroadcastsd	128(%rsp), %ymm0
	vmovdqa	%ymm13, 616(%rsp)
	vmovdqa	%ymm13, 2472(%rsp)
	vbroadcastsd	104(%rsp), %ymm13
	vmovdqa	%ymm1, 2376(%rsp)
	vmovdqa	%ymm13, 584(%rsp)
	vmovdqa	%ymm13, 2504(%rsp)
	vmovdqa	%ymm0, 2408(%rsp)
	movq	%rax, 96(%rsp)
	movq	136(%rsp), %rax
	vbroadcastsd	96(%rsp), %ymm13
	addq	$-128, %rax
	vmovdqa	%ymm13, 520(%rsp)
	movq	%rax, 184(%rsp)
	shrq	$8, %rax
	vmovdqa	%ymm13, 2536(%rsp)
	testq	%rax, %rax
	je	.L109
	vmovdqa	%ymm7, 1192(%rsp)
	movq	208(%rsp), %rcx
	movq	32(%rsp), %rdx
	vmovdqa	584(%rsp), %ymm7
	xorl	%esi, %esi
	vmovdqa	%ymm11, 1224(%rsp)
	vpaddq	%ymm2, %ymm3, %ymm11
	vpaddq	520(%rsp), %ymm7, %ymm7
	vmovdqa	%ymm5, 1448(%rsp)
	vpaddq	712(%rsp), %ymm6, %ymm5
	vmovdqa	%ymm7, 840(%rsp)
	vpaddq	.LC2(%rip), %ymm6, %ymm6
	vpaddq	%ymm11, %ymm6, %ymm6
	vpsrlq	$41, %ymm6, %ymm7
	vpsllq	$23, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vmovdqa	%ymm11, 456(%rsp)
	vmovdqa	%ymm12, 1032(%rsp)
	vpaddq	%ymm0, %ymm1, %ymm12
	vmovdqa	%ymm6, 424(%rsp)
	vpaddq	.LC3(%rip), %ymm5, %ymm6
	vpaddq	%ymm3, %ymm6, %ymm3
	vpsrlq	$27, %ymm3, %ymm6
	vpsllq	$37, %ymm3, %ymm3
	vpor	%ymm6, %ymm3, %ymm3
	vpaddq	.LC4(%rip), %ymm5, %ymm5
	vpaddq	%ymm2, %ymm5, %ymm2
	vmovdqa	%ymm12, 904(%rsp)
	vmovdqa	%ymm9, 1384(%rsp)
	vmovdqa	%ymm3, 392(%rsp)
	vpsrlq	$5, %ymm2, %ymm3
	vpsllq	$59, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm2
	vmovdqa	776(%rsp), %ymm9
	vmovdqa	392(%rsp), %ymm11
	vpaddq	744(%rsp), %ymm9, %ymm9
	vmovdqa	552(%rsp), %ymm13
	vpxor	%ymm2, %ymm11, %ymm11
	vmovdqa	%ymm9, 936(%rsp)
	vmovdqa	648(%rsp), %ymm9
	vmovdqa	%ymm4, 1256(%rsp)
	vpaddq	680(%rsp), %ymm13, %ymm4
	vpxor	424(%rsp), %ymm11, %ymm12
	vpaddq	616(%rsp), %ymm9, %ymm9
	vmovdqa	%ymm2, 360(%rsp)
	vmovdqa	%ymm10, 1416(%rsp)
	vmovdqa	%ymm8, 1320(%rsp)
	vmovdqa	%ymm9, 872(%rsp)
	vmovdqa	%ymm11, 328(%rsp)
	vmovdqa	%ymm12, 232(%rsp)
	vpaddq	.LC3(%rip), %ymm4, %ymm2
	vpaddq	%ymm1, %ymm2, %ymm1
	vpsrlq	$27, %ymm1, %ymm2
	vpsllq	$37, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vpaddq	.LC4(%rip), %ymm4, %ymm4
	vpaddq	%ymm0, %ymm4, %ymm0
	vmovdqa	%ymm1, 296(%rsp)
	vpsrlq	$5, %ymm0, %ymm1
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqa	296(%rsp), %ymm13
	vpxor	%ymm0, %ymm13, %ymm13
	vmovdqa	%ymm0, 264(%rsp)
	vmovdqa	%ymm13, 808(%rsp)
	.p2align 4,,10
	.p2align 3
.L70:
	vmovdqa	1288(%rsp), %ymm0
	addq	$1, %rsi
	vmovdqa	488(%rsp), %ymm1
	vpaddq	.LC0(%rip), %ymm0, %ymm0
	vmovdqa	.LC2(%rip), %ymm3
	vpxor	%ymm0, %ymm1, %ymm2
	vmovdqa	%ymm0, 1288(%rsp)
	vmovdqa	.LC2(%rip), %ymm12
	vpaddq	968(%rsp), %ymm2, %ymm0
	vpaddq	.LC1(%rip), %ymm2, %ymm2
	vpaddq	936(%rsp), %ymm2, %ymm2
	vpsrlq	$53, %ymm2, %ymm1
	vpsllq	$11, %ymm2, %ymm2
	vpor	%ymm1, %ymm2, %ymm1
	vpaddq	968(%rsp), %ymm3, %ymm2
	vpaddq	936(%rsp), %ymm2, %ymm2
	vpsrlq	$41, %ymm2, %ymm3
	vpsllq	$23, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm3
	vpaddq	.LC3(%rip), %ymm0, %ymm2
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	776(%rsp), %ymm2, %ymm2
	vpaddq	744(%rsp), %ymm0, %ymm0
	vpsrlq	$27, %ymm2, %ymm4
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm4, %ymm2, %ymm5
	vpsrlq	$5, %ymm0, %ymm2
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm2, %ymm0, %ymm2
	vpxor	%ymm3, %ymm1, %ymm0
	vpxor	%ymm2, %ymm5, %ymm4
	vpxor	%ymm0, %ymm2, %ymm2
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm3, %ymm4, %ymm3
	vpxor	%ymm1, %ymm4, %ymm1
	vpaddq	_ZL14preCompConstV4+64(%rip), %ymm2, %ymm2
	vpaddq	_ZL14preCompConstV4+96(%rip), %ymm5, %ymm5
	vpaddq	_ZL14preCompConstV4(%rip), %ymm3, %ymm3
	vpaddq	%ymm3, %ymm5, %ymm0
	vpaddq	_ZL14preCompConstV4+32(%rip), %ymm1, %ymm1
	vpaddq	%ymm2, %ymm1, %ymm4
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm4, %ymm6
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	.LC6(%rip), %ymm4, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm3
	vpsrlq	$45, %ymm3, %ymm4
	vpsllq	$19, %ymm3, %ymm3
	vpor	%ymm4, %ymm3, %ymm14
	vpaddq	%ymm0, %ymm1, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm0
	vpsrlq	$33, %ymm3, %ymm1
	vpsrlq	$11, %ymm0, %ymm2
	vpsllq	$31, %ymm3, %ymm3
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm3, %ymm1
	vpaddq	%ymm5, %ymm6, %ymm5
	vpor	%ymm2, %ymm0, %ymm9
	vpsrlq	$57, %ymm5, %ymm6
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm13
	vmovdqa	.LC1(%rip), %ymm4
	vpxor	%ymm9, %ymm1, %ymm0
	vpxor	%ymm14, %ymm13, %ymm15
	vpxor	%ymm0, %ymm14, %ymm14
	vpxor	%ymm0, %ymm13, %ymm0
	vmovdqa	.LC1(%rip), %ymm13
	vpxor	%ymm9, %ymm15, %ymm9
	vpxor	%ymm1, %ymm15, %ymm15
	vmovdqa	%ymm14, 1352(%rsp)
	vmovdqa	%ymm0, 1160(%rsp)
	vpaddq	712(%rsp), %ymm4, %ymm0
	vpaddq	456(%rsp), %ymm0, %ymm0
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpaddq	232(%rsp), %ymm9, %ymm3
	vmovdqa	%ymm9, 1480(%rsp)
	vpxor	424(%rsp), %ymm1, %ymm5
	vpxor	328(%rsp), %ymm1, %ymm1
	vpxor	360(%rsp), %ymm5, %ymm2
	vpxor	392(%rsp), %ymm5, %ymm5
	vpaddq	%ymm1, %ymm15, %ymm1
	vpaddq	%ymm14, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm1, %ymm4
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm4, %ymm6
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	.LC6(%rip), %ymm4, %ymm4
	vpaddq	1160(%rsp), %ymm5, %ymm5
	vpaddq	%ymm3, %ymm5, %ymm0
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm3, %ymm4, %ymm3
	vpsrlq	$57, %ymm5, %ymm6
	vpsrlq	$45, %ymm3, %ymm4
	vpsllq	$7, %ymm5, %ymm5
	vpsllq	$19, %ymm3, %ymm3
	vpor	%ymm6, %ymm5, %ymm6
	vpor	%ymm4, %ymm3, %ymm9
	vpaddq	%ymm0, %ymm1, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm0
	vpsrlq	$33, %ymm3, %ymm1
	vpsrlq	$11, %ymm0, %ymm2
	vpsllq	$31, %ymm3, %ymm3
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm3, %ymm1
	vmovdqa	.LC1(%rip), %ymm5
	vpor	%ymm2, %ymm0, %ymm7
	vpxor	%ymm9, %ymm6, %ymm11
	vpxor	%ymm7, %ymm1, %ymm0
	vpxor	%ymm7, %ymm11, %ymm7
	vpxor	%ymm1, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm6, %ymm6
	vpaddq	552(%rsp), %ymm5, %ymm0
	vpaddq	904(%rsp), %ymm0, %ymm0
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpaddq	680(%rsp), %ymm12, %ymm0
	vpaddq	904(%rsp), %ymm0, %ymm0
	vpsrlq	$41, %ymm0, %ymm2
	vpsllq	$23, %ymm0, %ymm4
	vpor	%ymm2, %ymm4, %ymm4
	vpxor	%ymm4, %ymm1, %ymm2
	vpxor	808(%rsp), %ymm4, %ymm4
	vpxor	264(%rsp), %ymm2, %ymm3
	vpxor	808(%rsp), %ymm1, %ymm1
	vpaddq	%ymm4, %ymm7, %ymm4
	vpxor	296(%rsp), %ymm2, %ymm2
	vpaddq	%ymm3, %ymm9, %ymm3
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm3, %ymm1, %ymm5
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm5, %ymm8
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	.LC6(%rip), %ymm5, %ymm5
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm4, %ymm2, %ymm0
	vpaddq	%ymm2, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm5, %ymm4
	vpsrlq	$57, %ymm8, %ymm2
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$7, %ymm8, %ymm8
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm2, %ymm8, %ymm2
	vpor	%ymm5, %ymm4, %ymm5
	vpaddq	%ymm0, %ymm1, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm0
	vpsrlq	$33, %ymm4, %ymm1
	vpsrlq	$11, %ymm0, %ymm3
	vpsllq	$31, %ymm4, %ymm4
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm4, %ymm1
	vpor	%ymm3, %ymm0, %ymm3
	vpxor	%ymm5, %ymm2, %ymm10
	vpxor	%ymm3, %ymm1, %ymm0
	vpxor	%ymm3, %ymm10, %ymm3
	vpxor	%ymm1, %ymm10, %ymm10
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm0, %ymm2, %ymm2
	vpaddq	648(%rsp), %ymm13, %ymm0
	vmovdqa	.LC4(%rip), %ymm13
	vpaddq	840(%rsp), %ymm0, %ymm0
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm8
	vpaddq	616(%rsp), %ymm12, %ymm0
	vpaddq	840(%rsp), %ymm0, %ymm0
	vpsrlq	$41, %ymm0, %ymm1
	vpsllq	$23, %ymm0, %ymm12
	vpor	%ymm1, %ymm12, %ymm12
	vmovdqa	.LC3(%rip), %ymm1
	vpaddq	872(%rsp), %ymm1, %ymm0
	vpaddq	584(%rsp), %ymm0, %ymm0
	vpsrlq	$27, %ymm0, %ymm1
	vpsllq	$37, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm4
	vpaddq	872(%rsp), %ymm13, %ymm0
	vpaddq	520(%rsp), %ymm0, %ymm0
	vpsrlq	$5, %ymm0, %ymm1
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpxor	%ymm12, %ymm8, %ymm0
	vpxor	%ymm1, %ymm4, %ymm13
	vpxor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm0, %ymm4, %ymm4
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm4, %ymm2, %ymm4
	vpaddq	%ymm12, %ymm3, %ymm12
	vpaddq	%ymm12, %ymm4, %ymm0
	vpaddq	%ymm8, %ymm10, %ymm8
	vpaddq	%ymm1, %ymm8, %ymm13
	vpaddq	.LC7(%rip), %ymm8, %ymm8
	vpaddq	.LC5(%rip), %ymm13, %ymm14
	vpaddq	.LC8(%rip), %ymm1, %ymm1
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm4, %ymm14, %ymm4
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$57, %ymm4, %ymm14
	vpsrlq	$45, %ymm12, %ymm13
	vpsllq	$7, %ymm4, %ymm4
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm14, %ymm4, %ymm4
	vpor	%ymm13, %ymm12, %ymm13
	vpaddq	%ymm0, %ymm8, %ymm12
	vpaddq	%ymm0, %ymm1, %ymm0
	vpsrlq	$33, %ymm12, %ymm8
	vpsrlq	$11, %ymm0, %ymm1
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm8, %ymm12, %ymm8
	vpor	%ymm1, %ymm0, %ymm1
	vpxor	%ymm13, %ymm4, %ymm0
	vpxor	%ymm1, %ymm8, %ymm12
	vpxor	%ymm1, %ymm0, %ymm1
	vpxor	%ymm8, %ymm0, %ymm0
	vpxor	%ymm12, %ymm13, %ymm13
	vpxor	%ymm12, %ymm4, %ymm4
	vpaddq	_ZL14preCompConstV4+128(%rip), %ymm1, %ymm1
	vpaddq	_ZL14preCompConstV4+160(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+192(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm0, %ymm8
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+224(%rip), %ymm4, %ymm4
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	%ymm1, %ymm4, %ymm12
	vpaddq	%ymm12, %ymm0, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm0
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm0, %ymm14, %ymm0
	vpor	%ymm13, %ymm12, %ymm13
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm4, %ymm12, %ymm4
	vpaddq	%ymm1, %ymm8, %ymm1
	vpsrlq	$27, %ymm4, %ymm12
	vpsrlq	$5, %ymm1, %ymm8
	vpsllq	$37, %ymm4, %ymm4
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm12, %ymm4, %ymm4
	vpor	%ymm8, %ymm1, %ymm8
	vpxor	%ymm13, %ymm0, %ymm1
	vpxor	%ymm8, %ymm4, %ymm12
	vpxor	%ymm1, %ymm8, %ymm8
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm13, %ymm12, %ymm13
	vpxor	%ymm0, %ymm12, %ymm0
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	%ymm1, %ymm2, %ymm2
	vmovdqa	%ymm13, 1128(%rsp)
	vpaddq	%ymm13, %ymm3, %ymm3
	vmovdqa	%ymm8, 1096(%rsp)
	vpaddq	%ymm0, %ymm10, %ymm10
	vpaddq	%ymm5, %ymm10, %ymm8
	vmovdqa	%ymm1, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	%ymm3, %ymm2, %ymm1
	vpaddq	.LC2(%rip), %ymm5, %ymm5
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm5, %ymm5
	vpsrlq	$53, %ymm10, %ymm4
	vpsllq	$23, %ymm5, %ymm1
	vpsllq	$11, %ymm10, %ymm10
	vpor	%ymm4, %ymm10, %ymm4
	vpsrlq	$41, %ymm5, %ymm10
	vpaddq	.LC3(%rip), %ymm8, %ymm5
	vpor	%ymm10, %ymm1, %ymm1
	vpaddq	%ymm2, %ymm5, %ymm2
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpsrlq	$27, %ymm2, %ymm5
	vpaddq	%ymm3, %ymm8, %ymm8
	vpsllq	$37, %ymm2, %ymm2
	vpsllq	$59, %ymm8, %ymm3
	vpor	%ymm5, %ymm2, %ymm5
	vpsrlq	$5, %ymm8, %ymm2
	vpor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm3, %ymm5, %ymm8
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm5, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm9, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm7, %ymm7
	vpaddq	%ymm7, %ymm6, %ymm5
	vpaddq	%ymm4, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm10
	vpaddq	.LC1(%rip), %ymm11, %ymm11
	vpaddq	.LC2(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm11, %ymm11
	vpaddq	%ymm5, %ymm9, %ymm9
	vpsrlq	$53, %ymm11, %ymm8
	vpsllq	$23, %ymm9, %ymm5
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm8, %ymm11, %ymm8
	vpsrlq	$41, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm10, %ymm9
	vpor	%ymm11, %ymm5, %ymm5
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpsrlq	$27, %ymm6, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpsllq	$37, %ymm6, %ymm6
	vpsllq	$59, %ymm10, %ymm7
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$5, %ymm10, %ymm6
	vpor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm7, %ymm9, %ymm10
	vpxor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpxor	%ymm5, %ymm10, %ymm5
	vpxor	%ymm8, %ymm10, %ymm8
	vpaddq	1352(%rsp), %ymm7, %ymm14
	vpaddq	1160(%rsp), %ymm6, %ymm13
	vpaddq	1480(%rsp), %ymm5, %ymm9
	vpaddq	%ymm9, %ymm13, %ymm12
	vpaddq	%ymm8, %ymm15, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm10
	vpaddq	.LC1(%rip), %ymm15, %ymm15
	vpaddq	.LC2(%rip), %ymm14, %ymm14
	vpaddq	%ymm12, %ymm15, %ymm15
	vpaddq	%ymm12, %ymm14, %ymm14
	vpsrlq	$53, %ymm15, %ymm11
	vpsllq	$23, %ymm14, %ymm12
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm11, %ymm15, %ymm11
	vpsrlq	$41, %ymm14, %ymm15
	vpaddq	.LC3(%rip), %ymm10, %ymm14
	vpor	%ymm15, %ymm12, %ymm12
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpaddq	%ymm13, %ymm14, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$27, %ymm13, %ymm14
	vpsrlq	$5, %ymm9, %ymm10
	vpsllq	$37, %ymm13, %ymm13
	vpsllq	$59, %ymm9, %ymm9
	vpor	%ymm14, %ymm13, %ymm14
	vpor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm12, %ymm11, %ymm9
	vpxor	%ymm10, %ymm14, %ymm13
	vpxor	%ymm9, %ymm10, %ymm10
	vpxor	%ymm9, %ymm14, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm11, %ymm13, %ymm11
	vpaddq	_ZL14preCompConstV4+320(%rip), %ymm10, %ymm10
	vpaddq	_ZL14preCompConstV4+352(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+256(%rip), %ymm12, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm9
	vpaddq	_ZL14preCompConstV4+288(%rip), %ymm11, %ymm11
	vpaddq	%ymm10, %ymm11, %ymm13
	vpaddq	.LC7(%rip), %ymm11, %ymm11
	vpaddq	.LC5(%rip), %ymm13, %ymm15
	vpaddq	.LC8(%rip), %ymm10, %ymm10
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm14, %ymm15, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$57, %ymm14, %ymm15
	vpsrlq	$45, %ymm12, %ymm13
	vpsllq	$7, %ymm14, %ymm14
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	%ymm9, %ymm11, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$33, %ymm13, %ymm11
	vpsrlq	$11, %ymm9, %ymm10
	vpsllq	$31, %ymm13, %ymm13
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm11, %ymm13, %ymm11
	vpor	%ymm10, %ymm9, %ymm13
	vpxor	%ymm12, %ymm14, %ymm10
	vpxor	%ymm13, %ymm11, %ymm9
	vpxor	%ymm13, %ymm10, %ymm13
	vpxor	%ymm11, %ymm10, %ymm10
	vpxor	%ymm9, %ymm12, %ymm12
	vpxor	%ymm9, %ymm14, %ymm9
	vpaddq	%ymm13, %ymm5, %ymm5
	vmovdqa	%ymm13, 1480(%rsp)
	vpaddq	%ymm8, %ymm10, %ymm8
	vpaddq	%ymm12, %ymm7, %ymm7
	vmovdqa	%ymm12, 1352(%rsp)
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	%ymm9, %ymm6, %ymm6
	vpaddq	.LC7(%rip), %ymm8, %ymm8
	vpaddq	%ymm5, %ymm6, %ymm12
	vpaddq	.LC8(%rip), %ymm7, %ymm7
	vmovdqa	%ymm9, 1160(%rsp)
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$57, %ymm6, %ymm9
	vpsllq	$7, %ymm6, %ymm6
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$45, %ymm5, %ymm6
	vpsllq	$19, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm11
	vpaddq	%ymm12, %ymm8, %ymm5
	vpaddq	%ymm12, %ymm7, %ymm12
	vpsrlq	$33, %ymm5, %ymm6
	vpsllq	$31, %ymm5, %ymm8
	vpsrlq	$11, %ymm12, %ymm5
	vpor	%ymm6, %ymm8, %ymm8
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm5, %ymm12, %ymm5
	vpxor	%ymm11, %ymm9, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm5, %ymm7, %ymm5
	vpxor	%ymm8, %ymm7, %ymm8
	vpxor	%ymm6, %ymm11, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm3, %ymm4, %ymm11
	vpaddq	.LC7(%rip), %ymm4, %ymm4
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm12
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm2, %ymm9, %ymm2
	vpsrlq	$57, %ymm2, %ymm9
	vpsllq	$7, %ymm2, %ymm2
	vpor	%ymm9, %ymm2, %ymm9
	vpsrlq	$45, %ymm1, %ymm2
	vpsllq	$19, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm11
	vpaddq	%ymm12, %ymm4, %ymm1
	vpaddq	%ymm12, %ymm3, %ymm12
	vpsrlq	$33, %ymm1, %ymm2
	vpsllq	$31, %ymm1, %ymm4
	vpsrlq	$11, %ymm12, %ymm1
	vpor	%ymm2, %ymm4, %ymm4
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm1, %ymm12, %ymm1
	vpxor	%ymm11, %ymm9, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm1, %ymm3, %ymm1
	vpxor	%ymm4, %ymm3, %ymm4
	vpxor	%ymm2, %ymm11, %ymm3
	vpxor	%ymm2, %ymm9, %ymm2
	vpaddq	1128(%rsp), %ymm1, %ymm13
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	1096(%rsp), %ymm3, %ymm12
	vpaddq	%ymm12, %ymm0, %ymm14
	vpaddq	.LC8(%rip), %ymm12, %ymm12
	vpaddq	1064(%rsp), %ymm2, %ymm11
	vpaddq	.LC5(%rip), %ymm14, %ymm15
	vpaddq	%ymm13, %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm14, %ymm14
	vpaddq	%ymm11, %ymm15, %ymm11
	vpaddq	%ymm13, %ymm14, %ymm13
	vpsrlq	$57, %ymm11, %ymm15
	vpsrlq	$45, %ymm13, %ymm14
	vpaddq	.LC7(%rip), %ymm0, %ymm0
	vpsllq	$7, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm0, %ymm0
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm12, %ymm9
	vpsllq	$19, %ymm13, %ymm13
	vpor	%ymm14, %ymm13, %ymm13
	vpsrlq	$33, %ymm0, %ymm14
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm14, %ymm0, %ymm14
	vpsrlq	$11, %ymm9, %ymm0
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm13, %ymm11, %ymm12
	vpxor	%ymm0, %ymm14, %ymm9
	vpxor	%ymm0, %ymm12, %ymm0
	vpxor	%ymm14, %ymm12, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+384(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+416(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+448(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+480(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm4, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm4, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm4, %ymm4
	vpor	%ymm9, %ymm4, %ymm9
	vpsrlq	$41, %ymm3, %ymm4
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm4, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm4
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm4, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm7, %ymm7
	vpaddq	%ymm1, %ymm6, %ymm6
	vpaddq	%ymm0, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm4
	vpaddq	%ymm3, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	.LC2(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm7, %ymm7
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm7, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm7, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm7
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm7, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$27, %ymm6, %ymm7
	vpsllq	$37, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm8
	vpsrlq	$5, %ymm5, %ymm6
	vpsllq	$59, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm6
	vpxor	%ymm4, %ymm9, %ymm5
	vpxor	%ymm6, %ymm8, %ymm7
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm7, %ymm4
	vpxor	%ymm9, %ymm7, %ymm7
	vpaddq	1352(%rsp), %ymm6, %ymm12
	vpaddq	1160(%rsp), %ymm5, %ymm9
	vpaddq	1480(%rsp), %ymm4, %ymm13
	vpaddq	%ymm13, %ymm9, %ymm11
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm12, %ymm10, %ymm8
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	%ymm11, %ymm12, %ymm12
	vpsrlq	$53, %ymm15, %ymm10
	vpsllq	$23, %ymm12, %ymm11
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm10, %ymm15, %ymm10
	vpsrlq	$41, %ymm12, %ymm15
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm9, %ymm12, %ymm9
	vpaddq	%ymm13, %ymm8, %ymm13
	vpsrlq	$27, %ymm9, %ymm12
	vpsrlq	$5, %ymm13, %ymm8
	vpsllq	$37, %ymm9, %ymm9
	vpsllq	$59, %ymm13, %ymm13
	vpor	%ymm12, %ymm9, %ymm12
	vpor	%ymm8, %ymm13, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm12, %ymm13
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm11, %ymm13, %ymm11
	vpxor	%ymm10, %ymm13, %ymm10
	vpaddq	_ZL14preCompConstV4+576(%rip), %ymm9, %ymm9
	vpxor	%ymm8, %ymm12, %ymm13
	vpaddq	_ZL14preCompConstV4+512(%rip), %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+544(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	_ZL14preCompConstV4+608(%rip), %ymm13, %ymm13
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vpaddq	%ymm11, %ymm6, %ymm6
	vmovdqa	%ymm11, 1352(%rsp)
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vmovdqa	%ymm8, 1160(%rsp)
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+640(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+672(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+704(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+736(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm8, %ymm8
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm3, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm8, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm8
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm8, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm9
	vpaddq	%ymm9, %ymm5, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm7
	vpaddq	%ymm6, %ymm7, %ymm11
	vpaddq	.LC1(%rip), %ymm7, %ymm7
	vpaddq	.LC2(%rip), %ymm6, %ymm6
	vpaddq	%ymm4, %ymm7, %ymm8
	vpaddq	%ymm4, %ymm6, %ymm6
	vpsrlq	$53, %ymm8, %ymm7
	vpsllq	$23, %ymm6, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm7, %ymm8, %ymm7
	vpsrlq	$41, %ymm6, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm6
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$27, %ymm5, %ymm6
	vpsllq	$37, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm8
	vpsrlq	$5, %ymm9, %ymm5
	vpsllq	$59, %ymm9, %ymm6
	vpor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm6, %ymm8, %ymm9
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm9, %ymm4
	vpxor	%ymm7, %ymm9, %ymm7
	vpaddq	1352(%rsp), %ymm6, %ymm11
	vpaddq	1160(%rsp), %ymm5, %ymm8
	vpaddq	1480(%rsp), %ymm4, %ymm12
	vpaddq	%ymm12, %ymm8, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm9, %ymm10, %ymm13
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$53, %ymm13, %ymm10
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$11, %ymm13, %ymm13
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm10, %ymm13, %ymm10
	vpor	%ymm11, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm15, %ymm9
	vpaddq	.LC4(%rip), %ymm15, %ymm15
	vpaddq	%ymm8, %ymm9, %ymm8
	vpaddq	%ymm12, %ymm15, %ymm12
	vpsrlq	$27, %ymm8, %ymm9
	vpsllq	$37, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm13
	vpsrlq	$5, %ymm12, %ymm8
	vpsllq	$59, %ymm12, %ymm12
	vpor	%ymm8, %ymm12, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm13, %ymm12
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm8, %ymm13, %ymm13
	vpxor	%ymm11, %ymm12, %ymm11
	vpxor	%ymm10, %ymm12, %ymm10
	vpaddq	_ZL14preCompConstV4+832(%rip), %ymm9, %ymm9
	vpaddq	_ZL14preCompConstV4+864(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+768(%rip), %ymm11, %ymm11
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	_ZL14preCompConstV4+800(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vpaddq	%ymm11, %ymm6, %ymm6
	vmovdqa	%ymm11, 1352(%rsp)
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vmovdqa	%ymm8, 1160(%rsp)
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+896(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+928(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+960(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+992(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm13
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vpaddq	%ymm13, %ymm8, %ymm8
	vmovdqa	%ymm9, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm8, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm9
	vmovdqa	%ymm0, 1000(%rsp)
	vpaddq	%ymm9, %ymm11, %ymm11
	vpaddq	%ymm3, %ymm8, %ymm0
	vpsrlq	$53, %ymm11, %ymm12
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm12
	vpaddq	.LC2(%rip), %ymm3, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm11, %ymm9, %ymm14
	vpaddq	.LC3(%rip), %ymm0, %ymm11
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	%ymm2, %ymm11, %ymm11
	vpaddq	%ymm1, %ymm0, %ymm0
	vpsrlq	$27, %ymm11, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpor	%ymm9, %ymm11, %ymm9
	vpsrlq	$5, %ymm0, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vmovdqa	%ymm13, 1096(%rsp)
	vpxor	%ymm14, %ymm12, %ymm0
	vpxor	%ymm11, %ymm9, %ymm13
	vpxor	%ymm0, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm14, %ymm13, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm11, %ymm6, %ymm11
	vpaddq	%ymm0, %ymm5, %ymm0
	vpaddq	%ymm14, %ymm4, %ymm14
	vpaddq	%ymm14, %ymm0, %ymm4
	vpaddq	%ymm12, %ymm7, %ymm12
	vpaddq	%ymm11, %ymm12, %ymm9
	vpaddq	.LC1(%rip), %ymm12, %ymm12
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm4, %ymm12, %ymm12
	vpaddq	%ymm4, %ymm11, %ymm11
	vpsrlq	$53, %ymm12, %ymm5
	vpsllq	$11, %ymm12, %ymm7
	vpsllq	$23, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsrlq	$41, %ymm11, %ymm5
	vpor	%ymm5, %ymm4, %ymm4
	vpaddq	.LC3(%rip), %ymm9, %ymm5
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm0, %ymm5, %ymm0
	vpaddq	%ymm14, %ymm9, %ymm14
	vpsrlq	$27, %ymm0, %ymm5
	vpsllq	$59, %ymm14, %ymm6
	vpsllq	$37, %ymm0, %ymm0
	vpor	%ymm5, %ymm0, %ymm5
	vpsrlq	$5, %ymm14, %ymm0
	vpor	%ymm0, %ymm6, %ymm6
	vpxor	%ymm4, %ymm7, %ymm0
	vpxor	%ymm6, %ymm5, %ymm9
	vpxor	%ymm0, %ymm6, %ymm6
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm4, %ymm9, %ymm4
	vpxor	%ymm7, %ymm9, %ymm7
	vmovq	192(%rcx), %xmm9
	vpaddq	1352(%rsp), %ymm6, %ymm11
	vpinsrq	$1, 256(%rcx), %xmm9, %xmm0
	vpaddq	1160(%rsp), %ymm5, %ymm13
	vmovq	64(%rcx), %xmm9
	vpaddq	1480(%rsp), %ymm4, %ymm12
	vpinsrq	$1, 128(%rcx), %xmm9, %xmm15
	vpaddq	%ymm7, %ymm10, %ymm10
	vinserti128	$0x1, %xmm0, %ymm15, %ymm15
	vpxor	%ymm15, %ymm10, %ymm10
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, (%rdx)
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 64(%rdx)
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 128(%rdx)
	vmovdqu	%ymm10, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 192(%rdx)
	vmovq	200(%rcx), %xmm9
	vpinsrq	$1, 264(%rcx), %xmm9, %xmm0
	vmovq	72(%rcx), %xmm9
	vpinsrq	$1, 136(%rcx), %xmm9, %xmm14
	vinserti128	$0x1, %xmm0, %ymm14, %ymm14
	vpxor	%ymm14, %ymm11, %ymm11
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 8(%rdx)
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 72(%rdx)
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 136(%rdx)
	vmovdqu	%ymm11, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 200(%rdx)
	vmovq	208(%rcx), %xmm11
	vmovq	80(%rcx), %xmm9
	vpinsrq	$1, 272(%rcx), %xmm11, %xmm0
	vpinsrq	$1, 144(%rcx), %xmm9, %xmm10
	vinserti128	$0x1, %xmm0, %ymm10, %ymm10
	vpxor	%ymm10, %ymm13, %ymm13
	vmovdqu	%ymm13, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 16(%rdx)
	vmovdqu	%ymm13, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 80(%rdx)
	vmovdqu	%ymm13, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 144(%rdx)
	vmovdqu	%ymm13, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 208(%rdx)
	vmovq	216(%rcx), %xmm11
	vmovq	88(%rcx), %xmm13
	vpinsrq	$1, 280(%rcx), %xmm11, %xmm0
	vpinsrq	$1, 152(%rcx), %xmm13, %xmm9
	vinserti128	$0x1, %xmm0, %ymm9, %ymm9
	vpxor	%ymm9, %ymm12, %ymm12
	vmovdqu	%ymm12, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 24(%rdx)
	vmovdqu	%ymm12, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 88(%rdx)
	vmovdqu	%ymm12, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 152(%rdx)
	vmovdqu	%ymm12, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 216(%rdx)
	vmovq	224(%rcx), %xmm11
	vmovq	96(%rcx), %xmm12
	vpinsrq	$1, 288(%rcx), %xmm11, %xmm0
	vpinsrq	$1, 160(%rcx), %xmm12, %xmm11
	vinserti128	$0x1, %xmm0, %ymm11, %ymm0
	vpxor	%ymm0, %ymm8, %ymm8
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 32(%rdx)
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 96(%rdx)
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 160(%rdx)
	vmovdqu	%ymm8, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 224(%rdx)
	vmovq	232(%rcx), %xmm13
	vmovq	104(%rcx), %xmm12
	vpinsrq	$1, 168(%rcx), %xmm12, %xmm11
	vpinsrq	$1, 296(%rcx), %xmm13, %xmm8
	vinserti128	$0x1, %xmm8, %ymm11, %ymm8
	vpxor	%ymm8, %ymm3, %ymm3
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 40(%rdx)
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 104(%rdx)
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 168(%rdx)
	vmovdqu	%ymm3, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 232(%rdx)
	vmovq	240(%rcx), %xmm13
	vmovq	112(%rcx), %xmm12
	vpinsrq	$1, 176(%rcx), %xmm12, %xmm11
	vpinsrq	$1, 304(%rcx), %xmm13, %xmm3
	vinserti128	$0x1, %xmm3, %ymm11, %ymm3
	vpxor	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 48(%rdx)
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 112(%rdx)
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 176(%rdx)
	vmovdqu	%ymm2, 1512(%rsp)
	movq	1536(%rsp), %rdi
	movq	%rdi, 240(%rdx)
	vmovq	248(%rcx), %xmm13
	vmovq	120(%rcx), %xmm12
	vpinsrq	$1, 184(%rcx), %xmm12, %xmm11
	vpinsrq	$1, 312(%rcx), %xmm13, %xmm2
	addq	$256, %rcx
	vinserti128	$0x1, %xmm2, %ymm11, %ymm2
	vpaddq	%ymm9, %ymm10, %ymm11
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqu	%ymm1, 1512(%rsp)
	movq	1512(%rsp), %rdi
	movq	%rdi, 56(%rdx)
	vmovdqu	%ymm1, 1512(%rsp)
	movq	1520(%rsp), %rdi
	movq	%rdi, 120(%rdx)
	vmovdqu	%ymm1, 1512(%rsp)
	movq	1528(%rsp), %rdi
	movq	%rdi, 184(%rdx)
	vmovdqu	%ymm1, 1512(%rsp)
	vpaddq	%ymm14, %ymm15, %ymm1
	vpaddq	.LC2(%rip), %ymm14, %ymm14
	vpaddq	.LC1(%rip), %ymm15, %ymm15
	vpaddq	%ymm11, %ymm15, %ymm15
	vpaddq	%ymm11, %ymm14, %ymm11
	vpsrlq	$53, %ymm15, %ymm12
	vpsrlq	$41, %ymm11, %ymm13
	vpsllq	$11, %ymm15, %ymm15
	vpsllq	$23, %ymm11, %ymm11
	vpor	%ymm12, %ymm15, %ymm12
	vpor	%ymm13, %ymm11, %ymm11
	vpaddq	.LC3(%rip), %ymm1, %ymm13
	vpaddq	.LC4(%rip), %ymm1, %ymm1
	vpaddq	%ymm10, %ymm13, %ymm10
	vpaddq	%ymm9, %ymm1, %ymm1
	vpsrlq	$27, %ymm10, %ymm13
	vpsllq	$59, %ymm1, %ymm9
	vpsllq	$37, %ymm10, %ymm10
	vpor	%ymm13, %ymm10, %ymm13
	vpsrlq	$5, %ymm1, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	movq	1536(%rsp), %rdi
	vpxor	%ymm11, %ymm12, %ymm1
	vpxor	%ymm9, %ymm13, %ymm10
	movq	%rdi, 248(%rdx)
	vpxor	%ymm1, %ymm9, %ymm9
	addq	$256, %rdx
	vpxor	%ymm1, %ymm13, %ymm13
	cmpq	%rax, %rsi
	vpxor	%ymm11, %ymm10, %ymm11
	vpxor	%ymm12, %ymm10, %ymm10
	vpaddq	_ZL14preCompConstV4+64(%rip), %ymm9, %ymm9
	vpaddq	_ZL14preCompConstV4+96(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4(%rip), %ymm11, %ymm11
	vpaddq	%ymm11, %ymm13, %ymm1
	vpaddq	_ZL14preCompConstV4+32(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm14
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm13, %ymm14, %ymm14
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm14, %ymm13
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm14, %ymm14
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm13, %ymm14, %ymm13
	vpor	%ymm12, %ymm11, %ymm14
	vpaddq	%ymm1, %ymm10, %ymm11
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$33, %ymm11, %ymm10
	vpsrlq	$11, %ymm1, %ymm9
	vpsllq	$31, %ymm11, %ymm11
	vpsllq	$53, %ymm1, %ymm1
	vpor	%ymm10, %ymm11, %ymm10
	vpor	%ymm9, %ymm1, %ymm9
	vpxor	%ymm14, %ymm13, %ymm15
	vpxor	%ymm9, %ymm10, %ymm1
	vpxor	%ymm9, %ymm15, %ymm9
	vpxor	%ymm10, %ymm15, %ymm15
	vpxor	%ymm1, %ymm14, %ymm14
	vpxor	%ymm1, %ymm13, %ymm1
	vpaddq	%ymm9, %ymm4, %ymm4
	vmovdqa	%ymm9, 1480(%rsp)
	vpaddq	%ymm7, %ymm15, %ymm7
	vpaddq	%ymm14, %ymm6, %ymm6
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	.LC5(%rip), %ymm9, %ymm10
	vmovdqa	%ymm1, 1160(%rsp)
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm4, %ymm5, %ymm1
	vpaddq	%ymm5, %ymm10, %ymm10
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm10, %ymm5
	vpsrlq	$45, %ymm4, %ymm9
	vpsllq	$7, %ymm10, %ymm10
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm10, %ymm5
	vpor	%ymm9, %ymm4, %ymm9
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm1, %ymm7, %ymm7
	vpaddq	%ymm1, %ymm6, %ymm1
	vpsrlq	$33, %ymm7, %ymm4
	vpsrlq	$11, %ymm1, %ymm6
	vpsllq	$31, %ymm7, %ymm7
	vpsllq	$53, %ymm1, %ymm1
	vpor	%ymm4, %ymm7, %ymm4
	vpor	%ymm6, %ymm1, %ymm7
	vpaddq	%ymm8, %ymm0, %ymm10
	vpaddq	.LC2(%rip), %ymm8, %ymm8
	vpxor	%ymm9, %ymm5, %ymm11
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm14, 1352(%rsp)
	vpxor	%ymm7, %ymm4, %ymm1
	vpxor	%ymm7, %ymm11, %ymm7
	vpxor	%ymm4, %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm4
	vpaddq	%ymm4, %ymm0, %ymm0
	vpxor	%ymm1, %ymm5, %ymm6
	vpaddq	%ymm4, %ymm8, %ymm4
	vpxor	%ymm1, %ymm9, %ymm9
	vpsrlq	$53, %ymm0, %ymm1
	vpsllq	$11, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm1
	vpsrlq	$41, %ymm4, %ymm0
	vpsllq	$23, %ymm4, %ymm4
	vpor	%ymm0, %ymm4, %ymm4
	vpaddq	.LC3(%rip), %ymm10, %ymm0
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpaddq	%ymm3, %ymm0, %ymm3
	vpaddq	%ymm2, %ymm10, %ymm2
	vpsrlq	$27, %ymm3, %ymm0
	vpsllq	$37, %ymm3, %ymm3
	vpor	%ymm0, %ymm3, %ymm5
	vpsrlq	$5, %ymm2, %ymm0
	vpsllq	$59, %ymm2, %ymm2
	vpor	%ymm0, %ymm2, %ymm3
	vpxor	%ymm4, %ymm1, %ymm0
	vpxor	%ymm3, %ymm5, %ymm2
	vpxor	%ymm0, %ymm3, %ymm3
	vpxor	%ymm0, %ymm5, %ymm0
	vpxor	%ymm4, %ymm2, %ymm4
	vpxor	%ymm1, %ymm2, %ymm1
	vpaddq	%ymm3, %ymm9, %ymm3
	vpaddq	%ymm0, %ymm6, %ymm2
	vpaddq	%ymm4, %ymm7, %ymm4
	vpaddq	%ymm4, %ymm2, %ymm0
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm3, %ymm1, %ymm5
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vpaddq	.LC5(%rip), %ymm5, %ymm8
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	.LC6(%rip), %ymm5, %ymm5
	vpaddq	%ymm2, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm5, %ymm4
	vpsrlq	$57, %ymm8, %ymm2
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$7, %ymm8, %ymm8
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm2, %ymm8, %ymm2
	vpor	%ymm5, %ymm4, %ymm5
	vpaddq	%ymm0, %ymm1, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm0
	vpsrlq	$33, %ymm4, %ymm1
	vpsrlq	$11, %ymm0, %ymm3
	vpsllq	$31, %ymm4, %ymm4
	vpsllq	$53, %ymm0, %ymm0
	vpor	%ymm1, %ymm4, %ymm1
	vpor	%ymm3, %ymm0, %ymm3
	vpxor	%ymm5, %ymm2, %ymm10
	vpxor	%ymm3, %ymm1, %ymm0
	vpxor	%ymm3, %ymm10, %ymm3
	vpxor	%ymm1, %ymm10, %ymm10
	vpxor	%ymm0, %ymm5, %ymm5
	vpxor	%ymm0, %ymm2, %ymm2
	vpaddq	1128(%rsp), %ymm3, %ymm12
	vpaddq	1096(%rsp), %ymm10, %ymm14
	vpaddq	1064(%rsp), %ymm5, %ymm8
	vpaddq	%ymm8, %ymm14, %ymm13
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	1000(%rsp), %ymm2, %ymm0
	vpaddq	.LC5(%rip), %ymm13, %ymm4
	vpaddq	%ymm12, %ymm0, %ymm1
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm1, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	.LC8(%rip), %ymm8, %ymm8
	vpsrlq	$57, %ymm0, %ymm4
	vpaddq	%ymm1, %ymm8, %ymm8
	vpsllq	$7, %ymm0, %ymm0
	vpsllq	$53, %ymm8, %ymm1
	vpor	%ymm4, %ymm0, %ymm0
	vpsrlq	$45, %ymm12, %ymm4
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm4, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm4
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm4, %ymm12, %ymm12
	vpsrlq	$11, %ymm8, %ymm4
	vpor	%ymm4, %ymm1, %ymm1
	vpxor	%ymm13, %ymm0, %ymm14
	vpxor	%ymm1, %ymm12, %ymm4
	vpxor	%ymm1, %ymm14, %ymm1
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm4, %ymm13, %ymm13
	vpxor	%ymm4, %ymm0, %ymm4
	vpaddq	_ZL14preCompConstV4+128(%rip), %ymm1, %ymm1
	vpaddq	_ZL14preCompConstV4+160(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+192(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm8
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+224(%rip), %ymm4, %ymm4
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm1, %ymm4, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm0
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm0, %ymm14, %ymm0
	vpor	%ymm13, %ymm12, %ymm13
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm4, %ymm12, %ymm4
	vpaddq	%ymm1, %ymm8, %ymm1
	vpsrlq	$27, %ymm4, %ymm12
	vpsrlq	$5, %ymm1, %ymm8
	vpsllq	$37, %ymm4, %ymm4
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm12, %ymm4, %ymm4
	vpor	%ymm8, %ymm1, %ymm8
	vpxor	%ymm13, %ymm0, %ymm1
	vpxor	%ymm8, %ymm4, %ymm12
	vpxor	%ymm1, %ymm8, %ymm8
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm13, %ymm12, %ymm13
	vpxor	%ymm0, %ymm12, %ymm0
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	%ymm1, %ymm2, %ymm2
	vmovdqa	%ymm13, 1128(%rsp)
	vpaddq	%ymm13, %ymm3, %ymm3
	vmovdqa	%ymm8, 1096(%rsp)
	vpaddq	%ymm0, %ymm10, %ymm10
	vpaddq	%ymm5, %ymm10, %ymm8
	vmovdqa	%ymm1, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	%ymm3, %ymm2, %ymm1
	vpaddq	.LC2(%rip), %ymm5, %ymm5
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm5, %ymm5
	vpsrlq	$53, %ymm10, %ymm4
	vpsllq	$23, %ymm5, %ymm1
	vpsllq	$11, %ymm10, %ymm10
	vpor	%ymm4, %ymm10, %ymm4
	vpsrlq	$41, %ymm5, %ymm10
	vpaddq	.LC3(%rip), %ymm8, %ymm5
	vpor	%ymm10, %ymm1, %ymm1
	vpaddq	%ymm2, %ymm5, %ymm2
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpsrlq	$27, %ymm2, %ymm5
	vpaddq	%ymm3, %ymm8, %ymm8
	vpsllq	$37, %ymm2, %ymm2
	vpsllq	$59, %ymm8, %ymm3
	vpor	%ymm5, %ymm2, %ymm5
	vpsrlq	$5, %ymm8, %ymm2
	vpor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm3, %ymm5, %ymm8
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm5, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm9, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm7, %ymm7
	vpaddq	%ymm7, %ymm6, %ymm5
	vpaddq	%ymm4, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm10
	vpaddq	.LC1(%rip), %ymm11, %ymm11
	vpaddq	.LC2(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm11, %ymm11
	vpaddq	%ymm5, %ymm9, %ymm9
	vpsrlq	$53, %ymm11, %ymm8
	vpsllq	$23, %ymm9, %ymm5
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm8, %ymm11, %ymm8
	vpsrlq	$41, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm10, %ymm9
	vpor	%ymm11, %ymm5, %ymm5
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpsrlq	$27, %ymm6, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpsllq	$37, %ymm6, %ymm6
	vpsllq	$59, %ymm10, %ymm7
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$5, %ymm10, %ymm6
	vpor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm7, %ymm9, %ymm10
	vpxor	%ymm6, %ymm7, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpxor	%ymm5, %ymm10, %ymm5
	vpxor	%ymm8, %ymm10, %ymm8
	vpaddq	1352(%rsp), %ymm7, %ymm14
	vpaddq	1160(%rsp), %ymm6, %ymm13
	vpaddq	1480(%rsp), %ymm5, %ymm9
	vpaddq	%ymm9, %ymm13, %ymm12
	vpaddq	%ymm8, %ymm15, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm10
	vpaddq	.LC1(%rip), %ymm15, %ymm15
	vpaddq	.LC2(%rip), %ymm14, %ymm14
	vpaddq	%ymm12, %ymm15, %ymm15
	vpaddq	%ymm12, %ymm14, %ymm14
	vpsrlq	$53, %ymm15, %ymm11
	vpsllq	$23, %ymm14, %ymm12
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm11, %ymm15, %ymm11
	vpsrlq	$41, %ymm14, %ymm15
	vpaddq	.LC3(%rip), %ymm10, %ymm14
	vpor	%ymm15, %ymm12, %ymm12
	vpaddq	.LC4(%rip), %ymm10, %ymm10
	vpaddq	%ymm13, %ymm14, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$27, %ymm13, %ymm14
	vpsrlq	$5, %ymm9, %ymm10
	vpsllq	$37, %ymm13, %ymm13
	vpsllq	$59, %ymm9, %ymm9
	vpor	%ymm14, %ymm13, %ymm14
	vpor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm12, %ymm11, %ymm9
	vpxor	%ymm10, %ymm14, %ymm13
	vpxor	%ymm9, %ymm10, %ymm10
	vpxor	%ymm9, %ymm14, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm11, %ymm13, %ymm11
	vpaddq	_ZL14preCompConstV4+320(%rip), %ymm10, %ymm10
	vpaddq	_ZL14preCompConstV4+352(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+256(%rip), %ymm12, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm9
	vpaddq	_ZL14preCompConstV4+288(%rip), %ymm11, %ymm11
	vpaddq	%ymm10, %ymm11, %ymm13
	vpaddq	.LC7(%rip), %ymm11, %ymm11
	vpaddq	.LC5(%rip), %ymm13, %ymm15
	vpaddq	.LC8(%rip), %ymm10, %ymm10
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm14, %ymm15, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$57, %ymm14, %ymm15
	vpsrlq	$45, %ymm12, %ymm13
	vpsllq	$7, %ymm14, %ymm14
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	%ymm9, %ymm11, %ymm13
	vpaddq	%ymm9, %ymm10, %ymm9
	vpsrlq	$33, %ymm13, %ymm11
	vpsrlq	$11, %ymm9, %ymm10
	vpsllq	$31, %ymm13, %ymm13
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm11, %ymm13, %ymm11
	vpor	%ymm10, %ymm9, %ymm13
	vpxor	%ymm12, %ymm14, %ymm10
	vpxor	%ymm13, %ymm11, %ymm9
	vpxor	%ymm13, %ymm10, %ymm13
	vpxor	%ymm11, %ymm10, %ymm10
	vpxor	%ymm9, %ymm12, %ymm12
	vpxor	%ymm9, %ymm14, %ymm9
	vpaddq	%ymm13, %ymm5, %ymm5
	vmovdqa	%ymm13, 1480(%rsp)
	vpaddq	%ymm8, %ymm10, %ymm8
	vpaddq	%ymm12, %ymm7, %ymm7
	vmovdqa	%ymm12, 1352(%rsp)
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	%ymm9, %ymm6, %ymm6
	vpaddq	.LC7(%rip), %ymm8, %ymm8
	vpaddq	%ymm5, %ymm6, %ymm12
	vpaddq	.LC8(%rip), %ymm7, %ymm7
	vmovdqa	%ymm9, 1160(%rsp)
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$57, %ymm6, %ymm9
	vpsllq	$7, %ymm6, %ymm6
	vpor	%ymm9, %ymm6, %ymm9
	vpsrlq	$45, %ymm5, %ymm6
	vpsllq	$19, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm11
	vpaddq	%ymm12, %ymm8, %ymm5
	vpaddq	%ymm12, %ymm7, %ymm12
	vpsrlq	$33, %ymm5, %ymm6
	vpsllq	$31, %ymm5, %ymm8
	vpsrlq	$11, %ymm12, %ymm5
	vpor	%ymm6, %ymm8, %ymm8
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm5, %ymm12, %ymm5
	vpxor	%ymm11, %ymm9, %ymm7
	vpxor	%ymm5, %ymm8, %ymm6
	vpxor	%ymm5, %ymm7, %ymm5
	vpxor	%ymm8, %ymm7, %ymm8
	vpxor	%ymm6, %ymm11, %ymm7
	vpxor	%ymm6, %ymm9, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm4, %ymm8, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm3, %ymm4, %ymm11
	vpaddq	.LC7(%rip), %ymm4, %ymm4
	vpaddq	.LC5(%rip), %ymm11, %ymm9
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	.LC6(%rip), %ymm11, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm12
	vpaddq	.LC8(%rip), %ymm3, %ymm3
	vpaddq	%ymm1, %ymm11, %ymm1
	vpaddq	%ymm2, %ymm9, %ymm2
	vpsrlq	$57, %ymm2, %ymm9
	vpsllq	$7, %ymm2, %ymm2
	vpor	%ymm9, %ymm2, %ymm9
	vpsrlq	$45, %ymm1, %ymm2
	vpsllq	$19, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm11
	vpaddq	%ymm12, %ymm4, %ymm1
	vpaddq	%ymm12, %ymm3, %ymm12
	vpsrlq	$33, %ymm1, %ymm2
	vpsllq	$31, %ymm1, %ymm4
	vpsrlq	$11, %ymm12, %ymm1
	vpor	%ymm2, %ymm4, %ymm4
	vpsllq	$53, %ymm12, %ymm12
	vpor	%ymm1, %ymm12, %ymm1
	vpxor	%ymm11, %ymm9, %ymm3
	vpxor	%ymm1, %ymm4, %ymm2
	vpxor	%ymm1, %ymm3, %ymm1
	vpxor	%ymm4, %ymm3, %ymm4
	vpxor	%ymm2, %ymm11, %ymm3
	vpxor	%ymm2, %ymm9, %ymm2
	vpaddq	1128(%rsp), %ymm1, %ymm13
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	1096(%rsp), %ymm3, %ymm12
	vpaddq	%ymm12, %ymm0, %ymm14
	vpaddq	.LC8(%rip), %ymm12, %ymm12
	vpaddq	1064(%rsp), %ymm2, %ymm11
	vpaddq	.LC5(%rip), %ymm14, %ymm15
	vpaddq	%ymm13, %ymm11, %ymm9
	vpaddq	.LC6(%rip), %ymm14, %ymm14
	vpaddq	%ymm11, %ymm15, %ymm11
	vpaddq	%ymm13, %ymm14, %ymm13
	vpsrlq	$57, %ymm11, %ymm15
	vpsrlq	$45, %ymm13, %ymm14
	vpaddq	.LC7(%rip), %ymm0, %ymm0
	vpsllq	$7, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm0, %ymm0
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	%ymm9, %ymm12, %ymm9
	vpsllq	$19, %ymm13, %ymm13
	vpor	%ymm14, %ymm13, %ymm13
	vpsrlq	$33, %ymm0, %ymm14
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm14, %ymm0, %ymm14
	vpsrlq	$11, %ymm9, %ymm0
	vpsllq	$53, %ymm9, %ymm9
	vpor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm13, %ymm11, %ymm12
	vpxor	%ymm0, %ymm14, %ymm9
	vpxor	%ymm0, %ymm12, %ymm0
	vpxor	%ymm14, %ymm12, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+384(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+416(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+448(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+480(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm4, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm4, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm4, %ymm4
	vpor	%ymm9, %ymm4, %ymm9
	vpsrlq	$41, %ymm3, %ymm4
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm4, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm4
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm4, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm4, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm7, %ymm7
	vpaddq	%ymm1, %ymm6, %ymm6
	vpaddq	%ymm0, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm4
	vpaddq	%ymm3, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm11
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	.LC2(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm8, %ymm8
	vpaddq	%ymm4, %ymm7, %ymm7
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm7, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm7, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm7
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm6, %ymm7, %ymm6
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$27, %ymm6, %ymm7
	vpsllq	$37, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm8
	vpsrlq	$5, %ymm5, %ymm6
	vpsllq	$59, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm6
	vpxor	%ymm4, %ymm9, %ymm5
	vpxor	%ymm6, %ymm8, %ymm7
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm7, %ymm4
	vpxor	%ymm9, %ymm7, %ymm7
	vpaddq	1352(%rsp), %ymm6, %ymm12
	vpaddq	1160(%rsp), %ymm5, %ymm9
	vpaddq	1480(%rsp), %ymm4, %ymm13
	vpaddq	%ymm13, %ymm9, %ymm11
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm12, %ymm10, %ymm8
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	%ymm11, %ymm12, %ymm12
	vpsrlq	$53, %ymm15, %ymm10
	vpsllq	$23, %ymm12, %ymm11
	vpsllq	$11, %ymm15, %ymm15
	vpor	%ymm10, %ymm15, %ymm10
	vpsrlq	$41, %ymm12, %ymm15
	vpaddq	.LC3(%rip), %ymm8, %ymm12
	vpor	%ymm15, %ymm11, %ymm11
	vpaddq	.LC4(%rip), %ymm8, %ymm8
	vpaddq	%ymm9, %ymm12, %ymm9
	vpaddq	%ymm13, %ymm8, %ymm13
	vpsrlq	$27, %ymm9, %ymm12
	vpsrlq	$5, %ymm13, %ymm8
	vpsllq	$37, %ymm9, %ymm9
	vpsllq	$59, %ymm13, %ymm13
	vpor	%ymm12, %ymm9, %ymm12
	vpor	%ymm8, %ymm13, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm12, %ymm13
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm11, %ymm13, %ymm11
	vpxor	%ymm10, %ymm13, %ymm10
	vpaddq	_ZL14preCompConstV4+576(%rip), %ymm9, %ymm9
	vpxor	%ymm8, %ymm12, %ymm13
	vpaddq	_ZL14preCompConstV4+512(%rip), %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+544(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	_ZL14preCompConstV4+608(%rip), %ymm13, %ymm13
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vpaddq	%ymm11, %ymm6, %ymm6
	vmovdqa	%ymm11, 1352(%rsp)
	vpaddq	%ymm6, %ymm7, %ymm9
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vmovdqa	%ymm8, 1160(%rsp)
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+640(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+672(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+704(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+736(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm12, 1128(%rsp)
	vpaddq	%ymm12, %ymm1, %ymm1
	vmovdqa	%ymm9, 1096(%rsp)
	vpaddq	%ymm14, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm11
	vmovdqa	%ymm0, 1064(%rsp)
	vpaddq	.LC1(%rip), %ymm8, %ymm8
	vpaddq	%ymm1, %ymm2, %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	vpaddq	%ymm0, %ymm8, %ymm8
	vpaddq	%ymm0, %ymm3, %ymm3
	vpsrlq	$53, %ymm8, %ymm9
	vpsllq	$23, %ymm3, %ymm0
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm9
	vpsrlq	$41, %ymm3, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm3
	vpor	%ymm8, %ymm0, %ymm0
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm1, %ymm11, %ymm1
	vpsrlq	$27, %ymm2, %ymm3
	vpsllq	$37, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm8
	vpsrlq	$5, %ymm1, %ymm2
	vpsllq	$59, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm0, %ymm9, %ymm1
	vpxor	%ymm2, %ymm8, %ymm3
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm0, %ymm3, %ymm0
	vpxor	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm9
	vpaddq	%ymm9, %ymm5, %ymm4
	vpaddq	%ymm3, %ymm7, %ymm7
	vpaddq	%ymm6, %ymm7, %ymm11
	vpaddq	.LC1(%rip), %ymm7, %ymm7
	vpaddq	.LC2(%rip), %ymm6, %ymm6
	vpaddq	%ymm4, %ymm7, %ymm8
	vpaddq	%ymm4, %ymm6, %ymm6
	vpsrlq	$53, %ymm8, %ymm7
	vpsllq	$23, %ymm6, %ymm4
	vpsllq	$11, %ymm8, %ymm8
	vpor	%ymm7, %ymm8, %ymm7
	vpsrlq	$41, %ymm6, %ymm8
	vpaddq	.LC3(%rip), %ymm11, %ymm6
	vpor	%ymm8, %ymm4, %ymm4
	vpaddq	.LC4(%rip), %ymm11, %ymm11
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$27, %ymm5, %ymm6
	vpsllq	$37, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm8
	vpsrlq	$5, %ymm9, %ymm5
	vpsllq	$59, %ymm9, %ymm6
	vpor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm6, %ymm8, %ymm9
	vpxor	%ymm5, %ymm6, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpxor	%ymm4, %ymm9, %ymm4
	vpxor	%ymm7, %ymm9, %ymm7
	vpaddq	1352(%rsp), %ymm6, %ymm11
	vpaddq	1160(%rsp), %ymm5, %ymm8
	vpaddq	1480(%rsp), %ymm4, %ymm12
	vpaddq	%ymm12, %ymm8, %ymm9
	vpaddq	%ymm7, %ymm10, %ymm10
	vpaddq	%ymm11, %ymm10, %ymm15
	vpaddq	.LC1(%rip), %ymm10, %ymm10
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm9, %ymm10, %ymm13
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$53, %ymm13, %ymm10
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$11, %ymm13, %ymm13
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm10, %ymm13, %ymm10
	vpor	%ymm11, %ymm9, %ymm11
	vpaddq	.LC3(%rip), %ymm15, %ymm9
	vpaddq	.LC4(%rip), %ymm15, %ymm15
	vpaddq	%ymm8, %ymm9, %ymm8
	vpaddq	%ymm12, %ymm15, %ymm12
	vpsrlq	$27, %ymm8, %ymm9
	vpsllq	$37, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm13
	vpsrlq	$5, %ymm12, %ymm8
	vpsllq	$59, %ymm12, %ymm12
	vpor	%ymm8, %ymm12, %ymm9
	vpxor	%ymm11, %ymm10, %ymm8
	vpxor	%ymm9, %ymm13, %ymm12
	vpxor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm8, %ymm13, %ymm13
	vpxor	%ymm11, %ymm12, %ymm11
	vpxor	%ymm10, %ymm12, %ymm10
	vpaddq	_ZL14preCompConstV4+832(%rip), %ymm9, %ymm9
	vpaddq	_ZL14preCompConstV4+864(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+768(%rip), %ymm11, %ymm11
	vpaddq	%ymm11, %ymm13, %ymm8
	vpaddq	_ZL14preCompConstV4+800(%rip), %ymm10, %ymm10
	vpaddq	%ymm9, %ymm10, %ymm12
	vpaddq	.LC7(%rip), %ymm10, %ymm10
	vpaddq	.LC5(%rip), %ymm12, %ymm15
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC6(%rip), %ymm12, %ymm12
	vpaddq	%ymm13, %ymm15, %ymm13
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsrlq	$57, %ymm13, %ymm15
	vpsrlq	$45, %ymm11, %ymm12
	vpsllq	$7, %ymm13, %ymm13
	vpsllq	$19, %ymm11, %ymm11
	vpor	%ymm15, %ymm13, %ymm13
	vpor	%ymm12, %ymm11, %ymm11
	vpaddq	%ymm8, %ymm10, %ymm12
	vpaddq	%ymm8, %ymm9, %ymm8
	vpsrlq	$33, %ymm12, %ymm10
	vpsrlq	$11, %ymm8, %ymm9
	vpsllq	$31, %ymm12, %ymm12
	vpsllq	$53, %ymm8, %ymm8
	vpor	%ymm10, %ymm12, %ymm10
	vpor	%ymm9, %ymm8, %ymm12
	vpxor	%ymm11, %ymm13, %ymm9
	vpxor	%ymm12, %ymm10, %ymm8
	vpxor	%ymm12, %ymm9, %ymm12
	vpxor	%ymm10, %ymm9, %ymm10
	vpxor	%ymm8, %ymm11, %ymm11
	vpxor	%ymm8, %ymm13, %ymm8
	vpaddq	%ymm12, %ymm4, %ymm4
	vmovdqa	%ymm12, 1480(%rsp)
	vpaddq	%ymm7, %ymm10, %ymm7
	vmovdqa	%ymm11, 1352(%rsp)
	vpaddq	%ymm11, %ymm6, %ymm6
	vpaddq	%ymm6, %ymm7, %ymm9
	vmovdqa	%ymm8, 1160(%rsp)
	vpaddq	%ymm8, %ymm5, %ymm5
	vpaddq	.LC7(%rip), %ymm7, %ymm7
	vpaddq	%ymm4, %ymm5, %ymm11
	vpaddq	.LC5(%rip), %ymm9, %ymm8
	vpaddq	.LC8(%rip), %ymm6, %ymm6
	vpaddq	.LC6(%rip), %ymm9, %ymm9
	vpaddq	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm4, %ymm9, %ymm4
	vpsrlq	$57, %ymm5, %ymm8
	vpsllq	$7, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm8
	vpsrlq	$45, %ymm4, %ymm5
	vpsllq	$19, %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm9
	vpaddq	%ymm11, %ymm7, %ymm4
	vpaddq	%ymm11, %ymm6, %ymm11
	vpsrlq	$33, %ymm4, %ymm5
	vpsllq	$31, %ymm4, %ymm7
	vpsrlq	$11, %ymm11, %ymm4
	vpor	%ymm5, %ymm7, %ymm7
	vpsllq	$53, %ymm11, %ymm11
	vpor	%ymm4, %ymm11, %ymm4
	vpxor	%ymm9, %ymm8, %ymm6
	vpxor	%ymm4, %ymm7, %ymm5
	vpxor	%ymm4, %ymm6, %ymm4
	vpxor	%ymm7, %ymm6, %ymm7
	vpxor	%ymm5, %ymm9, %ymm6
	vpxor	%ymm5, %ymm8, %ymm5
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm3, %ymm7, %ymm3
	vpaddq	%ymm2, %ymm6, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm8
	vpaddq	.LC7(%rip), %ymm3, %ymm3
	vpaddq	.LC5(%rip), %ymm8, %ymm9
	vpaddq	%ymm1, %ymm5, %ymm1
	vpaddq	.LC6(%rip), %ymm8, %ymm8
	vpaddq	%ymm0, %ymm1, %ymm12
	vpaddq	.LC8(%rip), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm8, %ymm0
	vpaddq	%ymm1, %ymm9, %ymm1
	vpsrlq	$57, %ymm1, %ymm9
	vpsllq	$7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm9
	vpsrlq	$45, %ymm0, %ymm1
	vpsllq	$19, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm11
	vpaddq	%ymm12, %ymm3, %ymm0
	vpaddq	%ymm12, %ymm2, %ymm12
	vpsrlq	$33, %ymm0, %ymm1
	vpsllq	$31, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm3
	vpsrlq	$11, %ymm12, %ymm0
	vpsllq	$53, %ymm12, %ymm1
	vpor	%ymm0, %ymm1, %ymm1
	vpxor	%ymm11, %ymm9, %ymm8
	vpxor	%ymm1, %ymm3, %ymm0
	vpxor	%ymm1, %ymm8, %ymm1
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm0, %ymm9, %ymm2
	vpxor	%ymm0, %ymm11, %ymm3
	vpaddq	1128(%rsp), %ymm1, %ymm12
	vpaddq	%ymm14, %ymm8, %ymm14
	vpaddq	1064(%rsp), %ymm2, %ymm0
	vpaddq	%ymm12, %ymm0, %ymm15
	vpaddq	1096(%rsp), %ymm3, %ymm9
	vpaddq	%ymm9, %ymm14, %ymm13
	vpaddq	.LC8(%rip), %ymm9, %ymm9
	vpaddq	.LC5(%rip), %ymm13, %ymm11
	vpaddq	.LC7(%rip), %ymm14, %ymm14
	vpaddq	.LC6(%rip), %ymm13, %ymm13
	vpaddq	%ymm15, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm15, %ymm9, %ymm15
	vpaddq	%ymm0, %ymm11, %ymm0
	vpsrlq	$57, %ymm0, %ymm11
	vpsllq	$7, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpsrlq	$45, %ymm12, %ymm0
	vpsllq	$19, %ymm12, %ymm12
	vpor	%ymm0, %ymm12, %ymm13
	vpsrlq	$33, %ymm14, %ymm0
	vpsllq	$31, %ymm14, %ymm12
	vpor	%ymm0, %ymm12, %ymm12
	vpsrlq	$11, %ymm15, %ymm0
	vpsllq	$53, %ymm15, %ymm15
	vpor	%ymm0, %ymm15, %ymm0
	vpxor	%ymm13, %ymm11, %ymm14
	vpxor	%ymm0, %ymm12, %ymm9
	vpxor	%ymm0, %ymm14, %ymm0
	vpxor	%ymm12, %ymm14, %ymm14
	vpxor	%ymm9, %ymm13, %ymm13
	vpxor	%ymm9, %ymm11, %ymm11
	vpaddq	_ZL14preCompConstV4+896(%rip), %ymm0, %ymm0
	vpaddq	_ZL14preCompConstV4+928(%rip), %ymm14, %ymm14
	vpaddq	_ZL14preCompConstV4+960(%rip), %ymm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm9
	vpaddq	.LC2(%rip), %ymm13, %ymm13
	vpaddq	_ZL14preCompConstV4+992(%rip), %ymm11, %ymm11
	vpaddq	.LC1(%rip), %ymm14, %ymm14
	vpaddq	%ymm0, %ymm11, %ymm12
	vpaddq	%ymm12, %ymm14, %ymm14
	vpaddq	%ymm12, %ymm13, %ymm12
	vpsrlq	$53, %ymm14, %ymm15
	vpsrlq	$41, %ymm12, %ymm13
	vpsllq	$11, %ymm14, %ymm14
	vpsllq	$23, %ymm12, %ymm12
	vpor	%ymm15, %ymm14, %ymm14
	vpor	%ymm13, %ymm12, %ymm12
	vpaddq	.LC3(%rip), %ymm9, %ymm13
	vpaddq	.LC4(%rip), %ymm9, %ymm9
	vpaddq	%ymm11, %ymm13, %ymm11
	vpaddq	%ymm0, %ymm9, %ymm0
	vpsrlq	$27, %ymm11, %ymm13
	vpsrlq	$5, %ymm0, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm13, %ymm11, %ymm11
	vpor	%ymm9, %ymm0, %ymm9
	vpxor	%ymm12, %ymm14, %ymm0
	vpxor	%ymm9, %ymm11, %ymm13
	vpxor	%ymm0, %ymm9, %ymm9
	vpxor	%ymm0, %ymm11, %ymm0
	vpxor	%ymm12, %ymm13, %ymm12
	vpxor	%ymm14, %ymm13, %ymm14
	vpaddq	%ymm9, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm2
	vpaddq	%ymm12, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm9
	vpaddq	%ymm14, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm0
	vpaddq	.LC1(%rip), %ymm8, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm11
	vpsrlq	$53, %ymm11, %ymm12
	vpsllq	$11, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm12
	vpaddq	.LC2(%rip), %ymm3, %ymm11
	vpaddq	%ymm9, %ymm11, %ymm9
	vpsrlq	$41, %ymm9, %ymm11
	vpsllq	$23, %ymm9, %ymm9
	vpor	%ymm11, %ymm9, %ymm14
	vpaddq	.LC3(%rip), %ymm0, %ymm11
	vpaddq	.LC4(%rip), %ymm0, %ymm0
	vpaddq	%ymm2, %ymm11, %ymm11
	vpaddq	%ymm1, %ymm0, %ymm0
	vpsrlq	$27, %ymm11, %ymm9
	vpsllq	$37, %ymm11, %ymm11
	vpor	%ymm9, %ymm11, %ymm9
	vpsrlq	$5, %ymm0, %ymm11
	vpsllq	$59, %ymm0, %ymm0
	vpor	%ymm11, %ymm0, %ymm11
	vpxor	%ymm14, %ymm12, %ymm0
	vpxor	%ymm11, %ymm9, %ymm13
	vpxor	%ymm0, %ymm11, %ymm11
	vpxor	%ymm0, %ymm9, %ymm0
	vpxor	%ymm14, %ymm13, %ymm14
	vpxor	%ymm12, %ymm13, %ymm12
	vpaddq	%ymm11, %ymm6, %ymm11
	vpaddq	%ymm0, %ymm5, %ymm0
	vpaddq	%ymm14, %ymm4, %ymm14
	vpaddq	%ymm14, %ymm0, %ymm5
	vpaddq	%ymm12, %ymm7, %ymm12
	vpaddq	%ymm11, %ymm12, %ymm4
	vpaddq	.LC1(%rip), %ymm12, %ymm12
	vpaddq	.LC2(%rip), %ymm11, %ymm11
	vpaddq	%ymm5, %ymm12, %ymm12
	vpaddq	%ymm5, %ymm11, %ymm5
	vpsrlq	$53, %ymm12, %ymm6
	vpsllq	$11, %ymm12, %ymm12
	vpor	%ymm6, %ymm12, %ymm12
	vpsrlq	$41, %ymm5, %ymm6
	vpsllq	$23, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm6
	vpaddq	.LC3(%rip), %ymm4, %ymm5
	vpaddq	.LC4(%rip), %ymm4, %ymm4
	vpaddq	%ymm0, %ymm5, %ymm0
	vpaddq	%ymm14, %ymm4, %ymm14
	vpsrlq	$27, %ymm0, %ymm5
	vpsllq	$37, %ymm0, %ymm0
	vpor	%ymm5, %ymm0, %ymm5
	vpsrlq	$5, %ymm14, %ymm0
	vpsllq	$59, %ymm14, %ymm14
	vpor	%ymm0, %ymm14, %ymm4
	vpxor	%ymm6, %ymm12, %ymm0
	vpxor	%ymm4, %ymm5, %ymm7
	vpxor	%ymm0, %ymm4, %ymm4
	vpxor	%ymm0, %ymm5, %ymm0
	vpxor	%ymm6, %ymm7, %ymm6
	vpxor	%ymm12, %ymm7, %ymm12
	vpaddq	1352(%rsp), %ymm4, %ymm4
	vpaddq	1160(%rsp), %ymm0, %ymm0
	vpaddq	1480(%rsp), %ymm6, %ymm6
	vpaddq	%ymm12, %ymm10, %ymm10
	vpaddq	1384(%rsp), %ymm10, %ymm10
	vmovdqa	%ymm10, 1384(%rsp)
	vpaddq	1320(%rsp), %ymm4, %ymm4
	vpaddq	1256(%rsp), %ymm0, %ymm0
	vpaddq	1192(%rsp), %ymm6, %ymm6
	vpaddq	1032(%rsp), %ymm8, %ymm8
	vpaddq	1224(%rsp), %ymm3, %ymm3
	vpaddq	1448(%rsp), %ymm2, %ymm2
	vpaddq	1416(%rsp), %ymm1, %ymm1
	vmovdqa	%ymm10, 1800(%rsp)
	vmovdqa	%ymm4, 1320(%rsp)
	vmovdqa	%ymm4, 1832(%rsp)
	vmovdqa	%ymm0, 1256(%rsp)
	vmovdqa	%ymm0, 1864(%rsp)
	vmovdqa	%ymm6, 1192(%rsp)
	vmovdqa	%ymm6, 1896(%rsp)
	vmovdqa	%ymm8, 1032(%rsp)
	vmovdqa	%ymm8, 1928(%rsp)
	vmovdqa	%ymm3, 1224(%rsp)
	vmovdqa	%ymm3, 1960(%rsp)
	vmovdqa	%ymm2, 1448(%rsp)
	vmovdqa	%ymm2, 1992(%rsp)
	vmovdqa	%ymm1, 1416(%rsp)
	vmovdqa	%ymm1, 2024(%rsp)
	jne	.L70
	movq	200(%rsp), %rcx
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	%rdx, 232(%rsp)
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 200(%rsp)
.L71:
	vmovdqa	1800(%rsp), %ymm0
	movq	184(%rsp), %r10
	salq	$2, %rax
	movq	%rax, 192(%rsp)
	vpshufd	$14, %ymm0, %ymm1
	shrq	$6, %r10
	cmpq	%rax, %r10
	movq	%r10, 264(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rbx
	vmovdqa	1832(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rbx, 1544(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %r8
	vmovdqa	1864(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%r8, 1552(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rsi
	vmovdqa	1896(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rsi, 1560(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %r12
	vmovdqa	1928(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%r12, 1568(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rdx
	vmovdqa	1960(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rdx, 1576(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rdi
	vmovdqa	1992(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rdi, 1584(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$0, %xmm0, %rcx
	vmovdqa	2024(%rsp), %ymm0
	vpshufd	$14, %ymm0, %ymm1
	movq	%rcx, 1592(%rsp)
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 1096(%rsp)
	movq	1096(%rsp), %r9
	movq	%r9, 1600(%rsp)
	jbe	.L69
	leaq	(%r11,%r13), %r9
	movq	224(%rsp), %rax
	movq	%rbx, 840(%rsp)
	movabsq	$-8247349341179448980, %rbx
	movq	%rcx, 904(%rsp)
	movq	%rsi, 808(%rsp)
	movq	%r9, 776(%rsp)
	movabsq	$7667772426219706969, %r9
	leaq	(%r14,%rbx), %rcx
	addq	%r9, %rax
	addq	776(%rsp), %rax
	leaq	(%r15,%r9), %rsi
	movabsq	$6220970056051541820, %r10
	movq	%rdi, 936(%rsp)
	movq	168(%rsp), %rdi
	addq	%r10, %r11
	movq	%rdx, 1000(%rsp)
	leaq	(%r14,%r15), %rdx
	movq	%r11, 616(%rsp)
	movabsq	$4195444129992158507, %r11
	movq	%r8, 968(%rsp)
	rorq	$41, %rax
	addq	%r11, %rdi
	addq	%r11, %r13
	movq	%rax, 1064(%rsp)
	movq	176(%rsp), %rax
	addq	168(%rsp), %rax
	movq	%r13, 744(%rsp)
	addq	%rax, %rcx
	addq	%rax, %rsi
	movq	176(%rsp), %rax
	rorq	$53, %rcx
	rorq	$41, %rsi
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
	movq	144(%rsp), %rax
	addq	128(%rsp), %rax
	xorq	%r8, %rsi
	xorq	%rcx, %r8
	movq	160(%rsp), %rcx
	movq	%rsi, 584(%rsp)
	movq	152(%rsp), %rsi
	movq	%rdx, 712(%rsp)
	movq	160(%rsp), %rdx
	addq	%rbx, %rcx
	addq	152(%rsp), %rdx
	movq	%rdi, 328(%rsp)
	addq	%r9, %rsi
	addq	%rax, %rcx
	movq	128(%rsp), %rdi
	addq	%rax, %rsi
	movq	144(%rsp), %rax
	rorq	$53, %rcx
	rorq	$41, %rsi
	movq	%r8, 552(%rsp)
	addq	%r10, %rax
	addq	%rdx, %rax
	rorq	$27, %rax
	addq	%r11, %rdi
	addq	%rdi, %rdx
	movq	%rax, %r8
	movq	%rsi, %rdi
	rorq	$5, %rdx
	xorq	%rcx, %rdi
	xorq	%rdx, %r8
	xorq	%rdi, %rdx
	xorq	%rax, %rdi
	xorq	%r8, %rsi
	movq	104(%rsp), %rax
	xorq	%rcx, %r8
	addq	96(%rsp), %rax
	movq	%rsi, 424(%rsp)
	movq	120(%rsp), %rcx
	movq	112(%rsp), %rsi
	movq	%rdx, 456(%rsp)
	movq	120(%rsp), %rdx
	addq	112(%rsp), %rdx
	movq	%rdi, 488(%rsp)
	addq	%rbx, %rcx
	addq	%r9, %rsi
	movq	96(%rsp), %rdi
	addq	%rax, %rcx
	addq	%rax, %rsi
	movq	104(%rsp), %rax
	rorq	$41, %rsi
	movq	%r8, 648(%rsp)
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
	movq	%rsi, 360(%rsp)
	movq	232(%rsp), %rax
	movq	208(%rsp), %rcx
	movq	200(%rsp), %rsi
	movq	%r8, 520(%rsp)
	movq	%rdx, 680(%rsp)
	salq	$3, %rax
	movq	%rdi, 392(%rsp)
	movq	%r12, 872(%rsp)
	addq	%rax, %rcx
	addq	32(%rsp), %rax
	movq	%rsi, 1224(%rsp)
	movq	%rcx, 1288(%rsp)
	movq	%rax, 1032(%rsp)
	movq	264(%rsp), %rax
	subq	192(%rsp), %rax
	addq	200(%rsp), %rax
	movq	%rax, 296(%rsp)
	.p2align 4,,10
	.p2align 3
.L72:
	addq	$1, 1224(%rsp)
	movq	216(%rsp), %rcx
	movabsq	$-8247349341179448980, %rdi
	xorq	1224(%rsp), %rcx
	movq	224(%rsp), %rsi
	movabsq	$7860495443403156170, %r9
	movq	616(%rsp), %rax
	movq	1064(%rsp), %rdx
	movabsq	$-6792583489299504353, %r12
	movabsq	$-3833335565246798826, %r10
	movabsq	$2580067509209331373, %r14
	movabsq	$-1457182779415996031, %r11
	movabsq	$-6802927476391842224, %r13
	movabsq	$-3329063056561552456, %rbx
	addq	%rcx, %rsi
	addq	776(%rsp), %rcx
	addq	%rsi, %rax
	addq	744(%rsp), %rsi
	rolq	$37, %rax
	addq	%rdi, %rcx
	movq	1064(%rsp), %rdi
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
	movq	424(%rsp), %r10
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
	movq	%rdi, 1416(%rsp)
	movq	%rsi, %r12
	movq	%rdx, 1320(%rsp)
	movq	%rdi, %rdx
	movq	%r15, %rdi
	addq	552(%rsp), %rdx
	addq	712(%rsp), %rdi
	movabsq	$-5426079245872290139, %r11
	addq	584(%rsp), %r12
	movq	1320(%rsp), %rax
	addq	328(%rsp), %rax
	movq	%rsi, 1448(%rsp)
	movq	%r15, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rdi,%rdx), %rsi
	addq	%r8, %rdi
	movq	456(%rsp), %r8
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
	movq	648(%rsp), %rdx
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	488(%rsp), %rax
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
	movq	360(%rsp), %r15
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
	movq	520(%rsp), %rcx
	xorq	%r11, %r8
	xorq	%rdx, %r9
	xorq	%rdx, %r11
	movq	680(%rsp), %rdx
	addq	%r8, %r15
	movq	392(%rsp), %rsi
	movq	%r15, 1480(%rsp)
	xorq	%r9, %r10
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$5597446114060141266, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$2199824780781266189, %r14
	addq	%r14, %rcx
	movabsq	$2818044418319133066, %r14
	addq	%r14, %rsi
	movabsq	$2553129884740551573, %r14
	addq	%r15, %rcx
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$4652647413905693402, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1256(%rsp)
	addq	%r8, %rsi
	movq	%r15, 1192(%rsp)
	leaq	(%rsi,%r9), %rax
	addq	%r15, %r11
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1480(%rsp)
	addq	%rax, %r8
	leaq	(%r11,%rax), %rdx
	movabsq	$6220970056051541820, %rax
	movabsq	$4195444129992158507, %r10
	addq	%rax, %r9
	rolq	$23, %r8
	movq	%r14, 1352(%rsp)
	leaq	(%r9,%rcx), %rax
	rolq	$11, %rdx
	movq	%r8, %r9
	movq	1384(%rsp), %r14
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
	movq	1416(%rsp), %r15
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
	movq	1448(%rsp), %rsi
	xorq	%rbx, %r12
	xorq	%rax, %r13
	xorq	%rax, %rbx
	movq	1320(%rsp), %rax
	addq	%r12, %r14
	movq	%r14, 1416(%rsp)
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	movq	1416(%rsp), %rdx
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%rbx, %rax
	movabsq	$-8247349341179448980, %rcx
	leaq	(%rsi,%rax), %r14
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
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
	movq	%r15, 1416(%rsp)
	movq	%rdx, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%rcx,%r13), %rdx
	movq	%rsi, 1448(%rsp)
	leaq	(%rdi,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1320(%rsp)
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
	movq	1256(%rsp), %r15
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
	movq	1192(%rsp), %rcx
	rolq	$31, %rdx
	rolq	$19, %r10
	addq	%rsi, %r8
	rolq	$53, %r8
	movq	%r10, %r11
	movq	1352(%rsp), %rsi
	xorq	%rax, %r11
	movq	%r8, %r9
	xorq	%rdx, %r9
	xorq	%r11, %r8
	xorq	%rdx, %r11
	movq	1480(%rsp), %rdx
	addq	%r8, %r15
	xorq	%r9, %r10
	movq	%r15, 1480(%rsp)
	movq	1480(%rsp), %r14
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
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
	movabsq	$-2293503970026868299, %r14
	addq	%r14, %rcx
	movabsq	$21060333966808527, %r14
	addq	%r15, %rcx
	addq	%r14, %rsi
	movabsq	$-3751294463443135658, %r14
	addq	%r15, %rsi
	addq	%r14, %rdx
	movabsq	$3378701480745353979, %r15
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rsi, 1256(%rsp)
	addq	%r8, %rsi
	addq	%r15, %r11
	leaq	(%rsi,%r9), %rax
	movq	%r15, 1192(%rsp)
	movabsq	$7667772426219706969, %r8
	movabsq	$-8247349341179448980, %r15
	leaq	(%r10,%r11), %rcx
	addq	%r10, %r8
	addq	%r15, %r11
	movq	%rdx, 1480(%rsp)
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
	movq	%r14, 1352(%rsp)
	rolq	$37, %rax
	movq	%r10, %r11
	xorq	%rdx, %r9
	xorq	%rax, %r11
	movq	1384(%rsp), %r14
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
	movq	1416(%rsp), %r15
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
	movq	1448(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1320(%rsp), %rax
	xorq	%r13, %rdi
	xorq	%rdx, %r13
	addq	%rdi, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 1416(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1448(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 1416(%rsp)
	addq	%r14, %rbx
	addq	%rsi, %rdi
	movq	%rdx, 1384(%rsp)
	movabsq	$-1087367646907149102, %r15
	leaq	(%r12,%r13), %rdx
	leaq	(%rdi,%rbx), %rcx
	addq	%r15, %rbx
	movabsq	$-5426079245872290139, %rsi
	movq	%r14, 1320(%rsp)
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
	movq	1480(%rsp), %r9
	rolq	$53, %r8
	rolq	$7, %rax
	rolq	$31, %rdx
	movq	%r14, %r15
	movq	%r8, %r13
	movq	1352(%rsp), %r11
	xorq	%rax, %r15
	xorq	%rdx, %r13
	xorq	%r13, %r14
	xorq	%r15, %r8
	xorq	%rax, %r13
	xorq	%rdx, %r15
	movq	1256(%rsp), %rax
	movq	1192(%rsp), %rdx
	addq	%r14, %r9
	addq	%r13, %r11
	addq	%r8, %rax
	addq	%r15, %rdx
	movq	%rax, 1480(%rsp)
	leaq	(%r9,%rdx), %rbx
	movq	%rax, %r10
	movabsq	$-1087367646907149102, %rax
	addq	%r11, %r10
	addq	%rax, %r11
	leaq	(%r11,%rbx), %rax
	movabsq	$-3329063056561552456, %r11
	addq	1480(%rsp), %r11
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
	movq	%r10, 1480(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	1480(%rsp), %r10
	movq	%r10, 1480(%rsp)
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
	addq	1480(%rsp), %r9
	rolq	$23, %r11
	addq	%rbx, %rax
	addq	1480(%rsp), %rax
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
	movq	%r11, 1256(%rsp)
	leaq	(%r8,%r13), %rax
	leaq	(%r14,%r15), %r11
	movq	%rbx, 1192(%rsp)
	movq	%r9, 1480(%rsp)
	movabsq	$6220970056051541820, %rbx
	movq	%r10, 1352(%rsp)
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
	movq	1416(%rsp), %r15
	leaq	(%r12,%rsi), %rdx
	addq	%rdi, %rsi
	leaq	(%rcx,%r13), %r12
	rolq	$23, %rsi
	movq	1384(%rsp), %r13
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
	movq	%r13, 1416(%rsp)
	movq	1448(%rsp), %r14
	addq	%rdi, %r15
	movq	1320(%rsp), %rax
	movabsq	$-8247349341179448980, %rdx
	addq	%r15, %r13
	addq	%rdx, %r15
	addq	%rsi, %r14
	addq	%rbx, %rax
	leaq	(%r14,%rax), %rcx
	leaq	(%r15,%rcx), %rdx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r13, 1448(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	1448(%rsp), %r13
	movq	%r13, 1448(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r15
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r14
	addq	%r15, %rax
	addq	1448(%rsp), %r14
	movabsq	$6923416813890349993, %r15
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r15, %rdx
	addq	1448(%rsp), %rdx
	movq	%rax, %r15
	xorq	%rcx, %r15
	rolq	$53, %r14
	movq	%r14, %r13
	xorq	%r15, %r14
	rolq	$31, %rdx
	addq	%r14, %rsi
	movq	%r14, 1448(%rsp)
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
	movq	%rsi, 1320(%rsp)
	movabsq	$-1087367646907149102, %rsi
	leaq	(%r9,%r10), %rcx
	addq	%r9, %rdi
	addq	%r10, %rsi
	movq	%rbx, 1160(%rsp)
	movabsq	$-5426079245872290139, %r9
	leaq	(%r11,%r8), %rbx
	movabsq	$-6657276164713376882, %r10
	addq	%r9, %r8
	addq	%r10, %r11
	addq	%rcx, %r8
	movq	%r13, 1416(%rsp)
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
	movq	1192(%rsp), %rbx
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	1480(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	1352(%rsp), %r10
	addq	1256(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 1128(%rsp)
	movq	%r14, 1384(%rsp)
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
	addq	1128(%rsp), %r14
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
	addq	1320(%rsp), %r9
	addq	1384(%rsp), %rbx
	movq	%rcx, preCompInternalState+64(%rip)
	movq	%r10, preCompInternalState+88(%rip)
	addq	1416(%rsp), %rcx
	addq	1160(%rsp), %r10
	movq	1032(%rsp), %r14
	movq	%r9, InternalState+40(%rip)
	leaq	(%r9,%rbx), %rsi
	movq	%rbx, InternalState+32(%rip)
	addq	%r11, %r9
	movq	%rcx, InternalState+56(%rip)
	addq	%r13, %rbx
	movq	1288(%rsp), %r13
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
	addq	1448(%rsp), %rdi
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
	movq	%rsi, 1448(%rsp)
	movq	%rdi, 1416(%rsp)
	xorq	%rdx, %r15
	xorq	%rax, %rdx
	movabsq	$-3329063056561552456, %rbx
	movq	%r15, 1384(%rsp)
	movq	%rdx, 1320(%rsp)
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
	addq	1416(%rsp), %rdx
	addq	1384(%rsp), %r15
	xorq	%rsi, %rax
	xorq	%rcx, %r13
	addq	1320(%rsp), %rax
	addq	1448(%rsp), %r13
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
	movq	%rsi, 1352(%rsp)
	movq	%rsi, %r11
	movabsq	$-1087367646907149102, %rsi
	addq	%rax, %r11
	addq	%rax, %rsi
	leaq	(%rsi,%rbx), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1352(%rsp), %rsi
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
	movq	%r11, 1480(%rsp)
	movabsq	$5597446114060141266, %r11
	addq	1480(%rsp), %r11
	movq	%r11, 1480(%rsp)
	movabsq	$2199824780781266189, %r11
	addq	%r11, %rcx
	movabsq	$2818044418319133066, %r11
	addq	%r11, %rsi
	movabsq	$2553129884740551573, %r11
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	addq	%r11, %rdx
	movabsq	$4652647413905693402, %rbx
	addq	1480(%rsp), %rdx
	addq	%rbx, %rax
	addq	1480(%rsp), %rax
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
	movq	%rdx, 1480(%rsp)
	addq	%rbx, %r10
	movq	%rsi, 1256(%rsp)
	addq	%rdi, %rsi
	leaq	(%rsi,%r8), %rax
	leaq	(%r9,%r10), %rcx
	movq	%rbx, 1192(%rsp)
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
	movq	%r11, 1352(%rsp)
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
	movq	1416(%rsp), %r15
	xorq	%rbx, %r12
	xorq	%rax, %r13
	xorq	%rax, %rbx
	movq	1384(%rsp), %rax
	movq	1448(%rsp), %rsi
	xorq	%r13, %r11
	xorq	%rdx, %r13
	movabsq	$-8247349341179448980, %rcx
	addq	%r13, %r15
	addq	%r12, %rax
	addq	%r11, %rsi
	movq	%rax, 1416(%rsp)
	movq	1320(%rsp), %rax
	movq	1416(%rsp), %rdx
	addq	%rbx, %rax
	leaq	(%rsi,%rax), %r14
	addq	%r15, %rdx
	addq	%rcx, %r15
	leaq	(%r15,%r14), %rcx
	movabsq	$7667772426219706969, %r15
	rolq	$11, %rcx
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$1022059294516476377, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$-6093410837277433488, %r14
	addq	%r14, %rax
	movabsq	$2699039428325208307, %r14
	addq	%r14, %r15
	movabsq	$1810550724721602985, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-7718674717865192741, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1448(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	xorq	%rax, %r14
	addq	%r15, %r13
	movq	%rdx, %rcx
	movq	%r15, 1416(%rsp)
	addq	%r14, %rbx
	addq	%r12, %rcx
	movq	%rdx, 1384(%rsp)
	addq	%rsi, %r11
	leaq	(%rcx,%r13), %rdx
	movabsq	$-1087367646907149102, %r15
	leaq	(%r11,%rbx), %rsi
	addq	%r15, %rbx
	movq	%r14, 1320(%rsp)
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
	movq	1192(%rsp), %rcx
	addq	%rsi, %rdi
	rolq	$19, %r9
	rolq	$7, %rax
	rolq	$53, %rdi
	rolq	$31, %rdx
	movq	%r9, %r10
	movq	%rdi, %r8
	xorq	%rax, %r10
	movq	1352(%rsp), %rsi
	xorq	%rdx, %r8
	xorq	%r10, %rdi
	xorq	%rdx, %r10
	xorq	%r8, %r9
	movq	1480(%rsp), %rdx
	xorq	%rax, %r8
	movq	1256(%rsp), %rax
	addq	%r10, %rcx
	addq	%r8, %rsi
	addq	%r9, %rdx
	addq	%rdi, %rax
	leaq	(%rdx,%rcx), %r15
	movq	%rax, 1480(%rsp)
	movq	%rax, %r14
	movabsq	$-1087367646907149102, %rax
	addq	%rsi, %r14
	addq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	movabsq	$-3329063056561552456, %rsi
	addq	1480(%rsp), %rsi
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
	movq	%r14, 1480(%rsp)
	movabsq	$-1692866721100317761, %r14
	addq	1480(%rsp), %r14
	movq	%r14, 1480(%rsp)
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
	addq	1480(%rsp), %rdx
	addq	%r15, %rax
	addq	1480(%rsp), %rax
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
	movq	%rdx, 1480(%rsp)
	movq	%rsi, 1256(%rsp)
	addq	%rdi, %rsi
	addq	%r15, %r10
	leaq	(%rsi,%r8), %rax
	movq	%r15, 1192(%rsp)
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
	movq	%r14, 1352(%rsp)
	rolq	$37, %rax
	xorq	%rdx, %r8
	movq	1384(%rsp), %r14
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
	movq	1416(%rsp), %r15
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
	movq	1448(%rsp), %rsi
	xorq	%rax, %r13
	xorq	%rbx, %r12
	xorq	%rax, %rbx
	movq	1320(%rsp), %rax
	xorq	%r13, %r11
	xorq	%rdx, %r13
	addq	%r11, %rsi
	addq	%r13, %r15
	addq	%r12, %r14
	movabsq	$-8247349341179448980, %rcx
	movq	%r14, 1416(%rsp)
	addq	%r15, %r14
	addq	%rbx, %rax
	addq	%rcx, %r15
	leaq	(%rsi,%rax), %rdx
	leaq	(%r15,%rdx), %rcx
	movabsq	$7667772426219706969, %r15
	addq	1416(%rsp), %r15
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
	movq	%r14, 1448(%rsp)
	movabsq	$-1023045325627492857, %r14
	addq	1448(%rsp), %r14
	movq	%r14, 1448(%rsp)
	movabsq	$5522384568424980818, %r14
	addq	%r14, %rax
	movabsq	$7484883476188376383, %r14
	addq	%r14, %r15
	movabsq	$-8571305747174237030, %r14
	addq	%rdx, %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	addq	1448(%rsp), %rsi
	movabsq	$-6250998732066177304, %r15
	rolq	$19, %rdx
	rolq	$7, %rax
	addq	%r15, %rcx
	addq	1448(%rsp), %rcx
	movq	%rdx, %r15
	xorq	%rax, %r15
	rolq	$53, %rsi
	movq	%rsi, %r14
	xorq	%r15, %rsi
	rolq	$31, %rcx
	movq	%rsi, 1448(%rsp)
	xorq	%rcx, %r14
	xorq	%rcx, %r15
	xorq	%r14, %rdx
	addq	%r15, %r13
	xorq	%rax, %r14
	addq	%rdx, %r12
	movq	%r15, 1416(%rsp)
	addq	%r14, %rbx
	movq	%rdx, 1384(%rsp)
	addq	%rsi, %r11
	leaq	(%r12,%r13), %rdx
	movabsq	$-1087367646907149102, %r15
	leaq	(%r11,%rbx), %rcx
	movq	%r14, 1320(%rsp)
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
	movq	1256(%rsp), %rbx
	movq	%rdi, %r8
	rolq	$31, %rdx
	movq	%rcx, %rsi
	xorq	%rax, %r8
	movq	1480(%rsp), %r9
	xorq	%rdx, %rsi
	xorq	%r8, %rcx
	xorq	%rdx, %r8
	movq	1192(%rsp), %rdx
	addq	%rcx, %rbx
	movq	1352(%rsp), %r11
	xorq	%rsi, %rdi
	movq	%rbx, 1480(%rsp)
	movq	1480(%rsp), %r10
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
	addq	1480(%rsp), %r11
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
	movq	%r10, 1480(%rsp)
	movabsq	$1915007920973660762, %r10
	addq	1480(%rsp), %r10
	movq	%r10, 1480(%rsp)
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
	addq	1480(%rsp), %r9
	addq	1480(%rsp), %rax
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
	movq	%r9, 1480(%rsp)
	addq	%r11, %rcx
	addq	%rbx, %r8
	movq	%r11, 1256(%rsp)
	leaq	(%rcx,%rsi), %rax
	movabsq	$-8247349341179448980, %r11
	leaq	(%rdi,%r8), %r9
	movq	%r10, 1352(%rsp)
	addq	%r11, %r8
	movabsq	$4195444129992158507, %r10
	addq	%r10, %rcx
	leaq	(%r8,%rax), %rdx
	movq	%rbx, 1192(%rsp)
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
	movq	1448(%rsp), %r15
	xorq	%rax, %r9
	movq	1320(%rsp), %rax
	movq	1416(%rsp), %r14
	movq	1384(%rsp), %r13
	xorq	%r12, %r10
	xorq	%rdx, %r12
	addq	%r10, %r15
	movabsq	$-8247349341179448980, %rdx
	addq	%r9, %rax
	addq	%r12, %r14
	leaq	(%r15,%rax), %rcx
	addq	%rbx, %r13
	movq	%r13, 1416(%rsp)
	addq	%r14, %r13
	addq	%rdx, %r14
	leaq	(%r14,%rcx), %rdx
	movabsq	$7667772426219706969, %r14
	addq	1416(%rsp), %r14
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
	movq	%r13, 1448(%rsp)
	movabsq	$9210284522589112667, %r13
	addq	1448(%rsp), %r13
	movq	%r13, 1448(%rsp)
	movabsq	$-1584252685182818982, %r13
	addq	%r13, %rcx
	movabsq	$6378106504303230091, %r13
	addq	%r13, %r14
	movabsq	$-3482973570042694885, %r13
	addq	%rax, %rcx
	addq	%r13, %r15
	addq	%r14, %rax
	addq	1448(%rsp), %r15
	movabsq	$6923416813890349993, %r14
	rolq	$19, %rax
	rolq	$7, %rcx
	addq	%r14, %rdx
	addq	1448(%rsp), %rdx
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
	movq	%r13, 1448(%rsp)
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
	movq	%r10, 1320(%rsp)
	movq	%r9, 1160(%rsp)
	leaq	(%rcx,%r8), %r10
	leaq	(%rdi,%rsi), %r9
	movabsq	$-3329063056561552456, %r11
	movq	%rbx, 1416(%rsp)
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
	movq	1192(%rsp), %rbx
	xorq	%r8, %r9
	xorq	%rsi, %r10
	movq	%r13, 1384(%rsp)
	xorq	%r10, %rcx
	xorq	%r9, %rdi
	xorq	%r9, %rsi
	movq	1480(%rsp), %r9
	xorq	%r10, %r8
	movq	%rcx, %r11
	movq	1352(%rsp), %r10
	addq	1256(%rsp), %r11
	addq	%r8, %rbx
	movq	%rcx, 1128(%rsp)
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
	movq	1128(%rsp), %rcx
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
	addq	1416(%rsp), %rbx
	addq	1384(%rsp), %r11
	movq	%r10, preCompInternalState+80(%rip)
	movq	%r9, preCompInternalState+88(%rip)
	addq	1320(%rsp), %r10
	addq	1160(%rsp), %r9
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
	addq	1448(%rsp), %r9
	movq	%r13, preCompInternalState+32(%rip)
	addq	%r15, %r13
	movq	%r11, preCompInternalState+40(%rip)
	movq	%r12, preCompInternalState+48(%rip)
	addq	%rdx, %r11
	addq	%rax, %r12
	addq	%r11, 840(%rsp)
	movq	296(%rsp), %r15
	addq	%r12, 968(%rsp)
	movq	%r11, InternalState(%rip)
	addq	%r9, 808(%rsp)
	movq	%r12, InternalState+8(%rip)
	addq	%r13, 872(%rsp)
	addq	%r8, 1000(%rsp)
	addq	%rdi, 936(%rsp)
	movq	%r9, InternalState+16(%rip)
	addq	%rsi, 904(%rsp)
	movq	%r13, InternalState+24(%rip)
	addq	%rcx, 1096(%rsp)
	addq	$64, 1288(%rsp)
	addq	$64, 1032(%rsp)
	cmpq	%r15, 1224(%rsp)
	jne	.L72
	vmovq	808(%rsp), %xmm1
	movq	192(%rsp), %rax
	vmovq	840(%rsp), %xmm2
	movq	264(%rsp), %rcx
	vpinsrq	$1, 872(%rsp), %xmm1, %xmm0
	vmovq	904(%rsp), %xmm3
	movq	232(%rsp), %rbx
	notq	%rax
	vpinsrq	$1, 968(%rsp), %xmm2, %xmm1
	leaq	1(%rcx,%rax), %rdx
	vmovq	1000(%rsp), %xmm4
	addq	%rcx, %rax
	addq	%rdx, 200(%rsp)
	leaq	8(%rbx,%rax,8), %rbx
	movq	%rbx, 232(%rsp)
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vpinsrq	$1, 936(%rsp), %xmm4, %xmm1
	vmovdqa	%ymm0, 1544(%rsp)
	vpinsrq	$1, 1096(%rsp), %xmm3, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 1576(%rsp)
.L69:
	movq	136(%rsp), %rax
	andl	$63, %eax
	je	.L73
	vmovdqa	1672(%rsp), %ymm0
	movq	200(%rsp), %rcx
	movabsq	$-8247349341179448980, %rsi
	movq	232(%rsp), %r8
	movabsq	$-6792583489299504353, %r14
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %rdi
	movq	InternalState+24(%rip), %rbx
	addq	$1, %rcx
	xorq	InternalState(%rip), %rcx
	movq	InternalState+8(%rip), %r10
	salq	$3, %r8
	vmovdqa	1704(%rsp), %ymm0
	leaq	(%rbx,%rdi), %rdx
	movq	%r8, 1192(%rsp)
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rdx,%rsi), %r9
	leaq	(%rcx,%r10), %r8
	vmovdqa	1736(%rsp), %ymm0
	addq	%rcx, %r9
	movabsq	$7667772426219706969, %rcx
	vmovdqa	%ymm0, InternalState+64(%rip)
	addq	%rcx, %r10
	rolq	$11, %r9
	vmovdqa	1768(%rsp), %ymm0
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
	leaq	(%r8,%r9), %rbx
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
	movq	%r11, 1256(%rsp)
	movq	%r14, 1352(%rsp)
	movq	%rbx, 1160(%rsp)
	movq	InternalState+40(%rip), %r14
	movq	InternalState+32(%rip), %rbx
	movq	InternalState+56(%rip), %r11
	addq	InternalState+48(%rip), %r11
	movq	%r12, 1480(%rsp)
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
	addq	1160(%rsp), %r12
	addq	1352(%rsp), %r11
	xorq	%rbx, %r13
	xorq	%r15, %rbx
	addq	1256(%rsp), %rbx
	addq	1480(%rsp), %r13
	movq	%r11, 1288(%rsp)
	leaq	(%r12,%rbx), %r14
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r14, 1032(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%r11, %r12
	addq	%r14, %rbx
	rolq	$7, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1032(%rsp), %r13
	rolq	$19, %r15
	addq	%r11, %r13
	movq	1288(%rsp), %r11
	movq	%r15, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 1032(%rsp)
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1096(%rsp)
	movq	%rbx, 1064(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%r11, 1128(%rsp)
	movq	InternalState+64(%rip), %rbx
	movq	InternalState+88(%rip), %r11
	addq	InternalState+80(%rip), %r11
	movq	%r13, 1032(%rsp)
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
	movq	%r12, 1288(%rsp)
	movq	%rbx, %r12
	xorq	1288(%rsp), %rbx
	xorq	%r13, %r12
	addq	1128(%rsp), %rbx
	xorq	1288(%rsp), %r13
	xorq	%r12, %r11
	xorq	%r15, %r12
	addq	1064(%rsp), %r12
	addq	1032(%rsp), %r13
	addq	1096(%rsp), %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	movq	%r11, 1224(%rsp)
	addq	%r13, %r11
	movq	%r15, 1288(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1288(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1224(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1288(%rsp), %r11
	movq	%rbx, 1288(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1288(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1288(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1416(%rsp)
	movq	%rbx, 1384(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %rbx
	movq	%r11, 1448(%rsp)
	movq	InternalState+120(%rip), %r11
	addq	InternalState+112(%rip), %r11
	movq	%r13, 1288(%rsp)
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
	movq	%r12, 1224(%rsp)
	movq	%rbx, %r12
	xorq	1224(%rsp), %rbx
	xorq	%r13, %r12
	xorq	1224(%rsp), %r13
	addq	1448(%rsp), %rbx
	addq	1288(%rsp), %r13
	xorq	%r12, %r11
	xorq	%r15, %r12
	addq	1416(%rsp), %r11
	addq	1384(%rsp), %r12
	movq	%r11, 1000(%rsp)
	leaq	(%rbx,%r12), %r15
	addq	%r13, %r11
	addq	%r9, %r12
	addq	%r11, %r12
	addq	%r14, %rbx
	movq	%r15, 1320(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1320(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 1224(%rsp)
	addq	%r11, %r13
	movq	1000(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1320(%rsp), %r11
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 1320(%rsp)
	movabsq	$-7999569951748836447, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	1224(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-4849728007900573903, %r12
	addq	%r11, %r12
	movabsq	$-1568322642145848418, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 1000(%rsp)
	movabsq	$-1642314245251606934, %r11
	addq	1320(%rsp), %r11
	addq	1000(%rsp), %r11
	movq	%rbx, 1224(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	1000(%rsp), %r11
	movq	1224(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$2553129884740551573, %r11
	addq	1320(%rsp), %r11
	addq	1224(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1224(%rsp)
	movq	%r13, %r12
	xorq	1224(%rsp), %r13
	xorq	%r15, %r12
	xorq	1224(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 936(%rsp)
	movq	%r11, %rbx
	movq	%r11, 968(%rsp)
	movq	%r13, 1000(%rsp)
	movq	936(%rsp), %r13
	movq	%r15, %r12
	addq	1288(%rsp), %r12
	addq	1384(%rsp), %r13
	addq	1416(%rsp), %rbx
	movq	%r15, 1224(%rsp)
	movq	%r13, 1288(%rsp)
	movq	1000(%rsp), %r15
	movq	%r13, %r11
	addq	1448(%rsp), %r15
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1416(%rsp)
	addq	%r15, %r11
	movq	%r15, 1448(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1288(%rsp), %r11
	movq	1416(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1448(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1416(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1448(%rsp)
	movq	%r13, %r12
	xorq	1448(%rsp), %r13
	xorq	%r15, %r12
	xorq	1448(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 840(%rsp)
	movq	%r11, %rbx
	addq	1096(%rsp), %rbx
	movq	%r13, 904(%rsp)
	movq	840(%rsp), %r13
	movq	%r15, %r12
	addq	1064(%rsp), %r13
	addq	1032(%rsp), %r12
	movq	%r15, 1448(%rsp)
	movq	904(%rsp), %r15
	addq	1128(%rsp), %r15
	movq	%r11, 872(%rsp)
	movq	%r13, 1032(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r15, 1416(%rsp)
	movq	%r13, 1288(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	1032(%rsp), %r11
	movq	1288(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1416(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1288(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1032(%rsp)
	movq	%r13, %r12
	xorq	1032(%rsp), %r13
	xorq	%r15, %r12
	xorq	1032(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r13, 1416(%rsp)
	movq	%r15, 1032(%rsp)
	movq	%r11, 1384(%rsp)
	movq	%r12, 1320(%rsp)
	movq	%r15, %r12
	movq	1416(%rsp), %r15
	addq	1256(%rsp), %r15
	addq	1480(%rsp), %r12
	addq	1352(%rsp), %rbx
	movq	1320(%rsp), %r13
	addq	1160(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 1288(%rsp)
	movq	%r13, 1480(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1256(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	1480(%rsp), %r11
	movq	1256(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1288(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1256(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1480(%rsp)
	movq	%r13, %r12
	xorq	1480(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 1288(%rsp)
	movq	1480(%rsp), %r12
	xorq	1288(%rsp), %rbx
	movq	%r13, 1256(%rsp)
	movabsq	$-2292595471992902602, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	1288(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$8467826889434979867, %r11
	addq	%r12, %r11
	movabsq	$6028102484886760763, %r12
	movq	%r11, 1480(%rsp)
	movabsq	$-5006043190370284386, %r11
	addq	%r11, %rbx
	addq	1256(%rsp), %r12
	movq	1480(%rsp), %r11
	addq	%r13, %r11
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r11, %rbx
	rolq	$7, %rbx
	movq	%rbx, 1288(%rsp)
	movabsq	$2699039428325208307, %rbx
	addq	1256(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	leaq	(%r11,%r12), %r13
	movq	1480(%rsp), %r11
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	1288(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	1288(%rsp), %rbx
	xorq	%r12, %r11
	movq	%r15, 1160(%rsp)
	addq	1384(%rsp), %r15
	xorq	%r13, %r12
	movq	%r11, 1480(%rsp)
	movq	%r12, 1352(%rsp)
	movq	%r12, %r13
	addq	1032(%rsp), %r13
	movq	%rbx, 1288(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	movq	%r15, 1032(%rsp)
	addq	1416(%rsp), %rbx
	movq	%r15, %r11
	addq	1320(%rsp), %r12
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r11, %r12
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1416(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1032(%rsp), %r11
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1416(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 1416(%rsp)
	movq	%r11, %rbx
	xorq	1416(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1416(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1096(%rsp)
	movq	%rbx, 1064(%rsp)
	movq	%rbx, %r12
	addq	872(%rsp), %r15
	addq	840(%rsp), %r12
	movq	%r11, %rbx
	addq	904(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	addq	1448(%rsp), %r13
	movq	%r11, 1128(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r15, 1032(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1032(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1448(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	movq	%rbx, 1032(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1384(%rsp)
	addq	968(%rsp), %r15
	movq	%rbx, %r12
	movq	%rbx, 1320(%rsp)
	addq	936(%rsp), %r12
	movq	%r11, %rbx
	movq	%r13, 1032(%rsp)
	addq	1000(%rsp), %rbx
	addq	1224(%rsp), %r13
	movq	%r11, 1448(%rsp)
	movq	%r15, %r11
	movq	%r15, 968(%rsp)
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r13, %r11
	addq	%r11, %r12
	addq	%r14, %rbx
	movq	%r15, 1256(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1256(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 1224(%rsp)
	addq	%r11, %r13
	movq	968(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1256(%rsp), %r11
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 1256(%rsp)
	movabsq	$5953845371152580681, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	1224(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$-7646712092252898442, %r12
	addq	%r11, %r12
	movabsq	$-2842268575306187841, %r11
	addq	%rbx, %r11
	leaq	0(%r13,%r12), %rbx
	movq	%r11, 1000(%rsp)
	movabsq	$-7946738593435294165, %r11
	addq	1256(%rsp), %r11
	addq	1000(%rsp), %r11
	movq	%rbx, 1224(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	1000(%rsp), %r11
	movq	1224(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$-3751294463443135658, %r11
	addq	1256(%rsp), %r11
	addq	1224(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1224(%rsp)
	movq	%r13, %r12
	xorq	1224(%rsp), %r13
	xorq	%r15, %r12
	xorq	1224(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 936(%rsp)
	movq	%r11, %rbx
	movq	%r11, 968(%rsp)
	movq	%r13, 1000(%rsp)
	movq	936(%rsp), %r13
	movq	%r15, %r12
	addq	1032(%rsp), %r12
	addq	1384(%rsp), %rbx
	addq	1320(%rsp), %r13
	movq	%r15, 1224(%rsp)
	movq	1000(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r13, 1032(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1384(%rsp)
	movq	%r15, 1448(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1032(%rsp), %r11
	movq	1384(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1448(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1384(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1448(%rsp)
	movq	%r13, %r12
	xorq	1448(%rsp), %r13
	xorq	%r15, %r12
	xorq	1448(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 840(%rsp)
	movq	%r11, %rbx
	addq	1096(%rsp), %rbx
	movq	%r13, 904(%rsp)
	movq	840(%rsp), %r13
	movq	%r15, %r12
	addq	1064(%rsp), %r13
	addq	1416(%rsp), %r12
	movq	%r15, 1448(%rsp)
	movq	904(%rsp), %r15
	addq	1128(%rsp), %r15
	movq	%r11, 872(%rsp)
	movq	%r13, 1416(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	addq	%r15, %r11
	movq	%r13, 1032(%rsp)
	movq	%r15, 1384(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1416(%rsp), %r11
	movq	1032(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1384(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1032(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1032(%rsp)
	movq	%r13, %r12
	xorq	1032(%rsp), %r13
	xorq	%r15, %r12
	xorq	1032(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 1320(%rsp)
	movq	%r11, %rbx
	addq	1160(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	movq	1320(%rsp), %r13
	movq	%r15, 1032(%rsp)
	movq	%r15, %r12
	movq	1416(%rsp), %r15
	addq	1480(%rsp), %r15
	addq	1352(%rsp), %r12
	addq	1288(%rsp), %r13
	movq	%r11, 1384(%rsp)
	movq	%r15, %r11
	addq	%r13, %r11
	movq	%r13, 1352(%rsp)
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 1288(%rsp)
	movq	%r13, 1256(%rsp)
	leaq	(%r12,%r11), %r15
	leaq	(%rbx,%r11), %r13
	movq	1352(%rsp), %r11
	movq	1256(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1288(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1256(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1480(%rsp)
	movq	%r13, %r12
	xorq	1480(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 1288(%rsp)
	movq	1480(%rsp), %r12
	xorq	1288(%rsp), %rbx
	movq	%r13, 1256(%rsp)
	movabsq	$-824919486193887165, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	1288(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$-1914029582460860148, %r11
	addq	%r12, %r11
	movabsq	$-7632797540959622777, %r12
	movq	%r11, 1480(%rsp)
	movabsq	$6609752215332129920, %r11
	addq	%r11, %rbx
	movq	1480(%rsp), %r11
	addq	%r13, %r11
	addq	1256(%rsp), %r12
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r11, %rbx
	rolq	$7, %rbx
	movq	%rbx, 1288(%rsp)
	movabsq	$7484883476188376383, %rbx
	addq	1256(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	leaq	(%r11,%r12), %r13
	movq	1480(%rsp), %r11
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	1288(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	1288(%rsp), %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	movq	%r15, 1096(%rsp)
	addq	1384(%rsp), %r15
	movq	%r12, 1128(%rsp)
	movq	%r12, %r13
	addq	1032(%rsp), %r13
	movq	%r11, 1160(%rsp)
	movq	%rbx, 1288(%rsp)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	1320(%rsp), %r12
	addq	1416(%rsp), %rbx
	movq	%r15, %r11
	movq	%r15, 1032(%rsp)
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r11, %r12
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1416(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1032(%rsp), %r11
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1416(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 1416(%rsp)
	movq	%r11, %rbx
	xorq	1416(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1416(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1352(%rsp)
	movq	%rbx, 1064(%rsp)
	movq	%rbx, %r12
	addq	872(%rsp), %r15
	addq	840(%rsp), %r12
	movq	%r11, %rbx
	addq	904(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	addq	1448(%rsp), %r13
	movq	%r11, 1480(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r15, 1032(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1032(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1448(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	movq	%rbx, 1032(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1384(%rsp)
	addq	968(%rsp), %r15
	movq	%rbx, %r12
	movq	%rbx, 1320(%rsp)
	addq	936(%rsp), %r12
	movq	%r11, %rbx
	movq	%r13, 1032(%rsp)
	addq	1000(%rsp), %rbx
	addq	1224(%rsp), %r13
	movq	%r11, 1448(%rsp)
	movq	%r15, %r11
	movq	%r15, 968(%rsp)
	leaq	(%rbx,%r12), %r15
	addq	%r9, %r12
	addq	%r13, %r11
	addq	%r11, %r12
	addq	%r14, %rbx
	movq	%r15, 1256(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1256(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r12, 1224(%rsp)
	addq	%r11, %r13
	movq	968(%rsp), %r11
	xorq	%r15, %r12
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1256(%rsp), %r11
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	xorq	%r13, %rbx
	movq	%r11, 1256(%rsp)
	movabsq	$-1139829817207230181, %r11
	leaq	(%r12,%r11), %r13
	movq	%rbx, %r11
	xorq	1224(%rsp), %rbx
	xorq	%r15, %r11
	movabsq	$3054837738180890943, %r12
	addq	%r11, %r12
	movabsq	$2588290990126348949, %r11
	addq	%rbx, %r11
	leaq	(%r12,%r13), %rbx
	movq	%r11, 1000(%rsp)
	movabsq	$-938319195649413462, %r11
	addq	1256(%rsp), %r11
	addq	1000(%rsp), %r11
	movq	%rbx, 1224(%rsp)
	leaq	0(%r13,%rsi), %rbx
	leaq	(%r11,%rbx), %r15
	leaq	(%r12,%rcx), %rbx
	leaq	(%r11,%rbx), %r13
	movq	1000(%rsp), %r11
	movq	1224(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movabsq	$3257124934342745045, %r11
	addq	1256(%rsp), %r11
	addq	1224(%rsp), %r11
	rolq	$37, %rbx
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1224(%rsp)
	movq	%r13, %r12
	xorq	1224(%rsp), %r13
	xorq	%r15, %r12
	xorq	1224(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 936(%rsp)
	movq	%r11, %rbx
	movq	%r11, 968(%rsp)
	movq	%r13, 1000(%rsp)
	movq	936(%rsp), %r13
	movq	%r15, %r12
	addq	1032(%rsp), %r12
	addq	1384(%rsp), %rbx
	addq	1320(%rsp), %r13
	movq	%r15, 1224(%rsp)
	movq	1000(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r13, 1032(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r15, 1448(%rsp)
	movq	%r13, 1384(%rsp)
	leaq	(%r11,%r12), %r15
	leaq	(%r11,%rbx), %r13
	movq	1032(%rsp), %r11
	movq	1384(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1448(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1384(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1448(%rsp)
	movq	%r13, %r12
	xorq	1448(%rsp), %r13
	xorq	%r15, %r12
	xorq	1448(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r11, 872(%rsp)
	movq	%r11, %rbx
	movq	%r13, 904(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r12, 840(%rsp)
	movq	%r15, %r12
	addq	1352(%rsp), %rbx
	addq	1416(%rsp), %r12
	movq	840(%rsp), %r13
	addq	1064(%rsp), %r13
	movq	904(%rsp), %r15
	addq	1480(%rsp), %r15
	movq	%r13, 1416(%rsp)
	movq	%r13, %r11
	leaq	(%r12,%rbx), %r13
	addq	%r15, %r11
	addq	%rsi, %r12
	addq	%rcx, %rbx
	movq	%r13, 1032(%rsp)
	movq	%r15, 1384(%rsp)
	leaq	(%r11,%rbx), %r13
	leaq	(%r11,%r12), %r15
	movq	1416(%rsp), %r11
	movq	1032(%rsp), %rbx
	rolq	$23, %r13
	rolq	$11, %r15
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1384(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1032(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1032(%rsp)
	movq	%r13, %r12
	xorq	1032(%rsp), %r13
	xorq	%r15, %r12
	xorq	1032(%rsp), %r15
	xorq	%r12, %r11
	xorq	%rbx, %r12
	movq	%r12, 1352(%rsp)
	movq	%r11, %rbx
	addq	1096(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	movq	1352(%rsp), %r13
	movq	%r15, 1032(%rsp)
	movq	%r15, %r12
	movq	1416(%rsp), %r15
	addq	1160(%rsp), %r15
	addq	1288(%rsp), %r13
	addq	1128(%rsp), %r12
	movq	%r11, 1480(%rsp)
	movq	%r15, %r11
	movq	%r13, 1320(%rsp)
	movq	%r15, 1288(%rsp)
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r13
	addq	%rsi, %r12
	addq	%rcx, %rbx
	leaq	(%r12,%r11), %r15
	movq	%r13, 1384(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	1320(%rsp), %r11
	movq	1384(%rsp), %rbx
	rolq	$11, %r15
	rolq	$23, %r13
	addq	%rdx, %r11
	addq	%r11, %rbx
	movq	1288(%rsp), %r11
	rolq	$37, %rbx
	addq	%r10, %r11
	addq	1384(%rsp), %r11
	rolq	$59, %r11
	movq	%r11, %r12
	xorq	%rbx, %r12
	movq	%r12, 1320(%rsp)
	movq	%r13, %r12
	xorq	1320(%rsp), %r13
	xorq	%r15, %r12
	movq	%r12, 1288(%rsp)
	movq	1320(%rsp), %r12
	xorq	1288(%rsp), %rbx
	movq	%r13, 1384(%rsp)
	movabsq	$-6097248013946911484, %r13
	xorq	%r15, %r12
	addq	%r12, %r13
	movq	1288(%rsp), %r12
	xorq	%r11, %r12
	movabsq	$3174302594670681997, %r11
	addq	%r12, %r11
	movabsq	$-8739574512844769069, %r12
	movq	%r11, 1320(%rsp)
	movabsq	$-496885038275669880, %r11
	addq	%r11, %rbx
	movq	1320(%rsp), %r11
	addq	%r13, %r11
	addq	1384(%rsp), %r12
	addq	%rbx, %r12
	addq	%r9, %rbx
	addq	%r11, %rbx
	rolq	$7, %rbx
	movq	%rbx, 1288(%rsp)
	movabsq	$6378106504303230091, %rbx
	addq	1384(%rsp), %rbx
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	leaq	(%r11,%r12), %r13
	movq	1320(%rsp), %r11
	rolq	$19, %r15
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	%r12, %r11
	movq	1288(%rsp), %r12
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	%r13, %rbx
	xorq	%r15, %r12
	xorq	%rbx, %r15
	xorq	1288(%rsp), %rbx
	xorq	%r12, %r11
	xorq	%r13, %r12
	movq	%r15, 1256(%rsp)
	movq	%r15, preCompInternalState+16(%rip)
	movq	%r12, 1320(%rsp)
	addq	1480(%rsp), %r15
	movq	%r12, %r13
	movq	%r12, preCompInternalState+8(%rip)
	addq	1032(%rsp), %r13
	movq	%rbx, 1288(%rsp)
	movq	%rbx, preCompInternalState+24(%rip)
	movq	%rbx, %r12
	movq	%r11, %rbx
	addq	1352(%rsp), %r12
	addq	1416(%rsp), %rbx
	movq	%r15, 1032(%rsp)
	movq	%r11, 1384(%rsp)
	movq	%r11, preCompInternalState(%rip)
	movq	%r15, %r11
	addq	%r13, %r11
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r11, %r12
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1416(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1032(%rsp), %r11
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1416(%rsp), %r11
	rolq	$53, %r11
	xorq	%r12, %rbx
	movq	%rbx, 1416(%rsp)
	movq	%r11, %rbx
	xorq	1416(%rsp), %r11
	xorq	%r13, %rbx
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%rbx, %r12
	movq	%r11, 1160(%rsp)
	xorq	1416(%rsp), %r13
	addq	840(%rsp), %r12
	movq	%r15, 1128(%rsp)
	movq	%rbx, 1096(%rsp)
	addq	872(%rsp), %r15
	movq	%r11, %rbx
	addq	904(%rsp), %rbx
	movq	%r13, 1416(%rsp)
	addq	1448(%rsp), %r13
	movq	%r15, %r11
	movq	%r15, 1448(%rsp)
	leaq	(%r12,%rbx), %r15
	addq	%r14, %rbx
	addq	%r9, %r12
	addq	%r13, %r11
	movq	%r15, 1032(%rsp)
	addq	%r11, %r12
	leaq	(%rbx,%r11), %r15
	leaq	0(%r13,%r8), %r11
	movq	1032(%rsp), %r13
	rolq	$7, %r12
	rolq	$19, %r15
	movq	%r15, %rbx
	addq	%r11, %r13
	movq	1448(%rsp), %r11
	xorq	%r12, %rbx
	rolq	$31, %r13
	addq	%rdi, %r11
	addq	1032(%rsp), %r11
	movq	%rbx, 1032(%rsp)
	rolq	$53, %r11
	movq	%r11, %rbx
	xorq	1032(%rsp), %r11
	xorq	%r13, %rbx
	xorq	1032(%rsp), %r13
	xorq	%rbx, %r15
	xorq	%r12, %rbx
	movq	%r15, 1480(%rsp)
	addq	968(%rsp), %r15
	movq	%rbx, %r12
	addq	936(%rsp), %r12
	movq	%rbx, 1352(%rsp)
	movq	%r11, %rbx
	movq	%r13, 1032(%rsp)
	addq	1224(%rsp), %r13
	addq	1000(%rsp), %rbx
	movq	%r11, 1448(%rsp)
	movq	%r15, %r11
	movq	%r15, 1064(%rsp)
	addq	%r12, %r9
	addq	%r13, %r11
	leaq	(%rbx,%r12), %r15
	leaq	(%r9,%r11), %r12
	rolq	$7, %r12
	addq	1064(%rsp), %rdi
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
	leaq	(%rdi,%r11), %r13
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
	movq	1032(%rsp), %r11
	addq	1352(%rsp), %r9
	addq	%rdi, %r11
	movq	1480(%rsp), %rdi
	movq	%r11, InternalState+64(%rip)
	movq	%r9, InternalState+80(%rip)
	addq	%r8, %rdi
	movq	1448(%rsp), %r8
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
	addq	1160(%rsp), %rdi
	addq	1096(%rsp), %r8
	movq	%r11, preCompInternalState+72(%rip)
	movq	%r9, preCompInternalState+80(%rip)
	addq	1416(%rsp), %r11
	addq	1128(%rsp), %r9
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
	addq	1256(%rsp), %rdi
	movq	%rcx, preCompInternalState+32(%rip)
	movq	%rsi, preCompInternalState+40(%rip)
	addq	1384(%rsp), %rcx
	addq	1320(%rsp), %rsi
	movq	%rdx, preCompInternalState+56(%rip)
	addq	1288(%rsp), %rdx
	testq	%rax, %rax
	movq	%rdi, InternalState+8(%rip)
	movq	%rsi, InternalState(%rip)
	movq	%rcx, InternalState+24(%rip)
	movq	%rdx, InternalState+16(%rip)
	je	.L74
	movq	1192(%rsp), %rbx
	movq	208(%rsp), %rsi
	xorl	%edx, %edx
	movq	32(%rsp), %r9
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
	movq	%rbx, 1384(%rsp)
	xorq	%r12, %r10
	xorq	%r9, %r12
	movq	%r13, 1320(%rsp)
	movq	%r12, 1192(%rsp)
	movq	InternalState+48(%rip), %r12
	movq	InternalState+32(%rip), %rbx
	movq	InternalState+40(%rip), %r13
	movq	%r10, 1256(%rsp)
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
	addq	1256(%rsp), %r9
	xorq	%r12, %r11
	xorq	%r12, %r10
	xorq	%r11, %rbx
	xorq	%r13, %r11
	addq	1320(%rsp), %rbx
	addq	1384(%rsp), %r11
	movq	%r9, 1288(%rsp)
	movq	1192(%rsp), %r9
	addq	%r10, %r9
	movq	1288(%rsp), %r10
	leaq	(%r9,%r11), %r12
	addq	%r8, %r9
	addq	%rbx, %r10
	movq	%r12, 1032(%rsp)
	leaq	(%rbx,%rdi), %r12
	leaq	(%r9,%r10), %r15
	movabsq	$-3329063056561552456, %r9
	addq	1032(%rsp), %r12
	addq	%r9, %r11
	leaq	(%r11,%r10), %r13
	movq	1288(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	1032(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1480(%rsp)
	movq	InternalState+64(%rip), %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	InternalState+88(%rip), %r10
	movq	%r13, 1160(%rsp)
	movq	%r11, 1128(%rsp)
	movq	InternalState+80(%rip), %r13
	movq	InternalState+72(%rip), %r11
	movq	%rbx, 1352(%rsp)
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
	addq	1160(%rsp), %r10
	xorq	%r13, %r11
	xorq	%r13, %rbx
	xorq	%r11, %r12
	xorq	%r15, %r11
	addq	1352(%rsp), %r12
	movq	%r10, 1032(%rsp)
	addq	1480(%rsp), %r11
	addq	1128(%rsp), %rbx
	addq	%r12, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1288(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
	addq	1288(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	1288(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1288(%rsp)
	movq	InternalState+96(%rip), %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	InternalState+120(%rip), %r10
	movq	%r13, 1224(%rsp)
	movq	%r11, 1448(%rsp)
	movq	InternalState+112(%rip), %r13
	movq	InternalState+104(%rip), %r11
	movq	%rbx, 1032(%rsp)
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
	addq	1032(%rsp), %r12
	addq	1224(%rsp), %r10
	xorq	%r13, %rbx
	xorq	%r15, %r11
	addq	1448(%rsp), %rbx
	addq	1288(%rsp), %r11
	movq	%r10, 1096(%rsp)
	addq	%r12, %r10
	addq	%rdi, %r12
	leaq	(%r11,%rbx), %r15
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%r11,%r10), %r13
	movq	%r15, 1416(%rsp)
	leaq	(%rbx,%r10), %r15
	movq	1096(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1416(%rsp)
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
	addq	1416(%rsp), %r10
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
	movabsq	$2553129884740551573, %r10
	addq	1416(%rsp), %r10
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
	movq	%r12, 1096(%rsp)
	movq	%r10, %r11
	addq	1288(%rsp), %r12
	addq	1224(%rsp), %r11
	movq	%rbx, 968(%rsp)
	movq	%r13, %rbx
	addq	1032(%rsp), %rbx
	movq	968(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r13, 1064(%rsp)
	movq	%r10, 1000(%rsp)
	movq	%r12, 1288(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	movq	%r12, 1032(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	1032(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	1288(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	1032(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 840(%rsp)
	movq	840(%rsp), %r15
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r10, %r11
	movq	%r12, 936(%rsp)
	addq	1160(%rsp), %r11
	movq	%r13, %rbx
	addq	1480(%rsp), %r12
	addq	1352(%rsp), %rbx
	addq	1128(%rsp), %r15
	movq	%r13, 904(%rsp)
	movq	%r10, 872(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	movq	%r12, 1032(%rsp)
	movq	%r13, 1288(%rsp)
	leaq	(%r10,%rbx), %r13
	rolq	$11, %r13
	addq	%rdx, %r11
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	1288(%rsp), %r15
	rolq	$23, %r12
	addq	%r10, %r15
	movq	1032(%rsp), %r10
	movq	%r12, %rbx
	rolq	$37, %r15
	xorq	%r13, %rbx
	addq	%r14, %r10
	addq	1288(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 1448(%rsp)
	movq	%r10, 1224(%rsp)
	xorq	%r11, %r12
	xorq	%r11, %r13
	movq	%r10, %r11
	movq	%r12, 1288(%rsp)
	addq	1384(%rsp), %r12
	movq	%r13, %rbx
	addq	1256(%rsp), %r11
	addq	1320(%rsp), %rbx
	movq	%r13, 1032(%rsp)
	movq	1448(%rsp), %r13
	addq	1192(%rsp), %r13
	movq	%r12, %r10
	movq	%r12, 1416(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	movq	%r15, 1384(%rsp)
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	leaq	0(%r13,%rax), %r11
	movq	1384(%rsp), %r13
	rolq	$23, %r10
	addq	%r11, %r15
	movq	1416(%rsp), %r11
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
	movq	%r10, 1416(%rsp)
	movabsq	$-2292595471992902602, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %rbx
	movabsq	$8467826889434979867, %r10
	xorq	%r13, %rbx
	movabsq	$2699039428325208307, %r13
	addq	%rbx, %r10
	xorq	%r15, %r11
	movabsq	$6028102484886760763, %rbx
	movq	%r10, 1384(%rsp)
	addq	1416(%rsp), %rbx
	movabsq	$-5006043190370284386, %r10
	addq	%r10, %r11
	addq	1416(%rsp), %r13
	movq	1384(%rsp), %r10
	addq	%r11, %rbx
	addq	%r12, %r10
	addq	%r8, %r11
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	1384(%rsp), %r10
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
	movq	%r10, 1384(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 1320(%rsp)
	movq	%r13, 1256(%rsp)
	movq	%r11, 1192(%rsp)
	movq	%r11, %rbx
	addq	1224(%rsp), %r13
	addq	1448(%rsp), %rbx
	movq	%r10, %r11
	addq	1288(%rsp), %r11
	addq	1032(%rsp), %r12
	movq	%r13, %r10
	movq	%r13, 1032(%rsp)
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1288(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	addq	1288(%rsp), %r12
	addq	%rsi, %r10
	addq	1288(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1352(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	904(%rsp), %r12
	movq	%r13, 1160(%rsp)
	movq	%r11, 1128(%rsp)
	movq	%r11, %rbx
	addq	872(%rsp), %r13
	addq	840(%rsp), %rbx
	movq	%r10, %r11
	addq	936(%rsp), %r11
	movq	%r10, 1480(%rsp)
	movq	%r13, %r10
	movq	%r13, 1032(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 1288(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	1032(%rsp), %r10
	addq	1288(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1288(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1032(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	1064(%rsp), %r12
	movq	%r13, 1224(%rsp)
	movq	%r11, 1448(%rsp)
	movq	%r11, %rbx
	addq	1000(%rsp), %r13
	movq	%r10, %r11
	addq	968(%rsp), %rbx
	addq	1096(%rsp), %r11
	movq	%r10, 1288(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1416(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1064(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1416(%rsp)
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
	addq	1416(%rsp), %r10
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
	movabsq	$-3751294463443135658, %r10
	addq	1416(%rsp), %r10
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
	movq	%r12, 1096(%rsp)
	movq	%r10, %r11
	addq	1288(%rsp), %r12
	addq	1224(%rsp), %r11
	movq	%rbx, 968(%rsp)
	movq	%r13, %rbx
	addq	1032(%rsp), %rbx
	movq	968(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r10, 1000(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r12, 1288(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	movq	%r12, 1032(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	1032(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	1288(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	1032(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 840(%rsp)
	movq	840(%rsp), %r15
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r10, %r11
	movq	%r12, 936(%rsp)
	addq	1160(%rsp), %r11
	movq	%r13, %rbx
	addq	1480(%rsp), %r12
	addq	1352(%rsp), %rbx
	addq	1128(%rsp), %r15
	movq	%r13, 904(%rsp)
	movq	%r10, 872(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	addq	%rdx, %r11
	movq	%r12, 1032(%rsp)
	movq	%r13, 1288(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	leaq	(%r15,%rax), %r10
	movq	1288(%rsp), %r15
	rolq	$11, %r13
	rolq	$23, %r12
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	1032(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	1288(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	xorq	%r11, %r12
	xorq	%r11, %r13
	movq	%r10, %r11
	movq	%r12, 1288(%rsp)
	addq	1384(%rsp), %r12
	movq	%r13, 1032(%rsp)
	movq	%rbx, 1448(%rsp)
	movq	%r13, %rbx
	addq	1256(%rsp), %r11
	addq	1320(%rsp), %rbx
	movq	1448(%rsp), %r13
	addq	1192(%rsp), %r13
	movq	%r10, 1224(%rsp)
	movq	%r12, %r10
	movq	%r12, 1416(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	leaq	0(%r13,%rax), %r11
	movq	%r15, 1384(%rsp)
	movq	1384(%rsp), %r13
	rolq	$23, %r10
	addq	%r11, %r15
	movq	1416(%rsp), %r11
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
	movq	%r10, 1416(%rsp)
	movabsq	$-824919486193887165, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %rbx
	movabsq	$-1914029582460860148, %r10
	xorq	%r13, %rbx
	xorq	%r15, %r11
	movabsq	$7484883476188376383, %r13
	addq	%rbx, %r10
	movabsq	$-7632797540959622777, %rbx
	movq	%r10, 1384(%rsp)
	movabsq	$6609752215332129920, %r10
	addq	%r10, %r11
	addq	1416(%rsp), %rbx
	movq	1384(%rsp), %r10
	addq	1416(%rsp), %r13
	addq	%r12, %r10
	addq	%rdi, %r12
	addq	%r11, %rbx
	addq	%r8, %r11
	leaq	(%r11,%r10), %r15
	addq	%r10, %r13
	movq	1384(%rsp), %r10
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
	movq	%rbx, 1480(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	1032(%rsp), %r12
	movq	%r13, 1352(%rsp)
	movq	%r11, 1160(%rsp)
	movq	%r11, %rbx
	addq	1224(%rsp), %r13
	addq	1448(%rsp), %rbx
	movq	%r10, %r11
	addq	1288(%rsp), %r11
	movq	%r10, 1192(%rsp)
	movq	%r13, 1032(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	leaq	(%rbx,%r10), %r15
	movq	%r13, 1288(%rsp)
	addq	1288(%rsp), %r12
	leaq	(%r11,%r10), %r13
	movq	1032(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r13
	movq	%r13, %rbx
	rolq	$31, %r12
	addq	%rsi, %r10
	addq	1288(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1384(%rsp)
	movq	%rbx, 1320(%rsp)
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, %r12
	movq	%r13, 1256(%rsp)
	movq	%r11, %rbx
	addq	872(%rsp), %r13
	addq	840(%rsp), %rbx
	movq	%r11, 1128(%rsp)
	movq	%r10, %r11
	addq	936(%rsp), %r11
	addq	904(%rsp), %r12
	movq	%r13, %r10
	movq	%r13, 1032(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 1288(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	1032(%rsp), %r10
	addq	1288(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1288(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1032(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	1064(%rsp), %r12
	movq	%r13, 1224(%rsp)
	movq	%r11, 1448(%rsp)
	movq	%r11, %rbx
	addq	1000(%rsp), %r13
	addq	968(%rsp), %rbx
	movq	%r10, %r11
	addq	1096(%rsp), %r11
	movq	%r10, 1288(%rsp)
	movq	%r13, 1064(%rsp)
	movq	%r13, %r10
	leaq	(%r11,%rbx), %r13
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	leaq	(%rbx,%r10), %r15
	addq	%rdi, %r12
	movq	%r13, 1416(%rsp)
	leaq	(%r11,%r10), %r13
	movq	1064(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	movq	%r13, %rbx
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%r10, 1416(%rsp)
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
	addq	1416(%rsp), %r10
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
	movabsq	$3257124934342745045, %r10
	addq	1416(%rsp), %r10
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
	movq	%r12, 1096(%rsp)
	movq	%r10, %r11
	addq	1288(%rsp), %r12
	addq	1224(%rsp), %r11
	movq	%rbx, 968(%rsp)
	movq	%r13, %rbx
	addq	1032(%rsp), %rbx
	movq	968(%rsp), %r15
	addq	1448(%rsp), %r15
	movq	%r13, 1064(%rsp)
	movq	%r10, 1000(%rsp)
	movq	%r12, 1288(%rsp)
	movq	%r12, %r10
	leaq	(%rbx,%r11), %r12
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r15, %r10
	movq	%r12, 1032(%rsp)
	leaq	(%r10,%rbx), %r13
	leaq	(%r10,%r11), %r12
	leaq	(%r15,%rax), %r10
	movq	1032(%rsp), %r15
	rolq	$23, %r12
	rolq	$11, %r13
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	1288(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$37, %r15
	addq	%r14, %r10
	addq	1032(%rsp), %r10
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 840(%rsp)
	movq	840(%rsp), %r15
	xorq	%r11, %r13
	xorq	%r11, %r12
	movq	%r10, %r11
	movq	%r12, 936(%rsp)
	addq	1256(%rsp), %r11
	movq	%r13, %rbx
	addq	1384(%rsp), %r12
	addq	1320(%rsp), %rbx
	addq	1128(%rsp), %r15
	movq	%r13, 904(%rsp)
	movq	%r10, 872(%rsp)
	leaq	(%rbx,%r11), %r13
	movq	%r12, %r10
	addq	%rcx, %rbx
	addq	%r15, %r10
	addq	%rdx, %r11
	movq	%r12, 1032(%rsp)
	movq	%r13, 1288(%rsp)
	leaq	(%r10,%r11), %r12
	leaq	(%r10,%rbx), %r13
	leaq	(%r15,%rax), %r10
	movq	1288(%rsp), %r15
	rolq	$11, %r13
	rolq	$23, %r12
	movq	%r12, %rbx
	addq	%r10, %r15
	movq	1032(%rsp), %r10
	rolq	$37, %r15
	addq	%r14, %r10
	addq	1288(%rsp), %r10
	xorq	%r13, %rbx
	rolq	$59, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r15, %rbx
	xorq	%r15, %r11
	movq	%rbx, 1256(%rsp)
	movq	%r10, 1320(%rsp)
	xorq	%r11, %r12
	xorq	%r11, %r13
	movq	%r10, %r11
	movq	%r12, 1416(%rsp)
	addq	1192(%rsp), %r12
	movq	%r13, %rbx
	addq	1352(%rsp), %r11
	addq	1480(%rsp), %rbx
	movq	%r13, 1384(%rsp)
	movq	1256(%rsp), %r13
	addq	1160(%rsp), %r13
	movq	%r12, %r10
	movq	%r12, 1288(%rsp)
	leaq	(%r11,%rbx), %r15
	addq	%rcx, %rbx
	addq	%rdx, %r11
	addq	%r13, %r10
	movq	%r15, 1032(%rsp)
	leaq	(%rbx,%r10), %r12
	addq	%r11, %r10
	leaq	0(%r13,%rax), %r11
	movq	1032(%rsp), %r13
	rolq	$23, %r10
	addq	%r11, %r15
	movq	1288(%rsp), %r11
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
	movq	%r10, 1288(%rsp)
	movabsq	$-6097248013946911484, %r10
	leaq	(%rbx,%r10), %r12
	movq	%r11, %rbx
	movabsq	$3174302594670681997, %r10
	xorq	%r13, %rbx
	xorq	%r15, %r11
	movabsq	$6378106504303230091, %r13
	addq	%rbx, %r10
	movabsq	$-8739574512844769069, %rbx
	movq	%r10, 1032(%rsp)
	movabsq	$-496885038275669880, %r10
	addq	%r10, %r11
	movq	1032(%rsp), %r10
	addq	%r12, %r10
	addq	1288(%rsp), %rbx
	addq	1288(%rsp), %r13
	addq	%rdi, %r12
	addq	%r11, %rbx
	addq	%r8, %r11
	addq	%r10, %r13
	leaq	(%r11,%r10), %r15
	movq	1032(%rsp), %r10
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
	movq	%r10, 1288(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 1032(%rsp)
	movq	%rbx, preCompInternalState+8(%rip)
	movq	%r13, 1224(%rsp)
	movq	%r11, %rbx
	movq	%r13, preCompInternalState+16(%rip)
	addq	1256(%rsp), %rbx
	addq	1320(%rsp), %r13
	movq	%r11, 1448(%rsp)
	movq	%r11, preCompInternalState+24(%rip)
	movq	%r10, %r11
	addq	1416(%rsp), %r11
	addq	1384(%rsp), %r12
	movq	%r10, preCompInternalState(%rip)
	movq	%r13, 1384(%rsp)
	movq	%r13, %r10
	leaq	(%rbx,%r11), %r13
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%r12, %r10
	addq	%rdi, %r12
	movq	%r13, 1416(%rsp)
	leaq	(%rbx,%r10), %r15
	leaq	(%r11,%r10), %r13
	movq	1384(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$7, %r15
	rolq	$19, %r13
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	rolq	$31, %r12
	rolq	$53, %r10
	xorq	%r15, %rbx
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, 1480(%rsp)
	movq	%rbx, %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	addq	904(%rsp), %r12
	movq	%r13, 1352(%rsp)
	movq	%r11, 1160(%rsp)
	movq	%r11, %rbx
	addq	872(%rsp), %r13
	addq	840(%rsp), %rbx
	movq	%r10, %r11
	addq	936(%rsp), %r11
	movq	%r10, 1192(%rsp)
	movq	%r13, %r10
	movq	%r13, 1384(%rsp)
	leaq	(%rbx,%r11), %r15
	addq	%r12, %r10
	addq	%r8, %rbx
	addq	%r9, %r11
	addq	%rdi, %r12
	movq	%r15, 1416(%rsp)
	leaq	(%r11,%r10), %r13
	leaq	(%rbx,%r10), %r15
	movq	1384(%rsp), %r10
	addq	1416(%rsp), %r12
	rolq	$19, %r13
	rolq	$7, %r15
	movq	%r13, %rbx
	addq	%rsi, %r10
	addq	1416(%rsp), %r10
	xorq	%r15, %rbx
	rolq	$31, %r12
	rolq	$53, %r10
	movq	%r10, %r11
	xorq	%rbx, %r10
	xorq	%r12, %rbx
	xorq	%r12, %r11
	movq	%rbx, %r12
	addq	1064(%rsp), %r12
	xorq	%r11, %r13
	xorq	%r15, %r11
	movq	%rbx, 1384(%rsp)
	movq	%r13, 1320(%rsp)
	addq	1000(%rsp), %r13
	movq	%r11, %rbx
	addq	968(%rsp), %rbx
	movq	%r11, 1256(%rsp)
	movq	%r10, %r11
	addq	1096(%rsp), %r11
	movq	%r10, 1416(%rsp)
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
	addq	1416(%rsp), %r13
	addq	1384(%rsp), %rsi
	movq	%rbx, preCompInternalState+112(%rip)
	movq	%r12, preCompInternalState+120(%rip)
	addq	1320(%rsp), %rbx
	addq	1256(%rsp), %r12
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
	addq	1192(%rsp), %rdi
	addq	1160(%rsp), %r8
	movq	%r10, preCompInternalState+72(%rip)
	movq	%r9, preCompInternalState+80(%rip)
	addq	1480(%rsp), %r10
	addq	1352(%rsp), %r9
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
	addq	1224(%rsp), %rdi
	xorq	%r9, %rcx
	xorq	%r9, %rdx
	xorq	%r8, %rax
	movq	%rcx, preCompInternalState+40(%rip)
	addq	1032(%rsp), %rcx
	movq	%rdx, preCompInternalState+32(%rip)
	movq	%rax, preCompInternalState+56(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%rdi, InternalState+8(%rip)
	addq	1448(%rsp), %rax
	addq	1288(%rsp), %rdx
	addq	%rcx, 1544(%rsp)
	addq	%rdi, 1552(%rsp)
	addq	%rax, 1560(%rsp)
	addq	%rdx, 1568(%rsp)
	addq	%rsi, 1576(%rsp)
	addq	%rbx, 1584(%rsp)
	movq	%rax, InternalState+16(%rip)
	movq	%rdx, InternalState+24(%rip)
	addq	%r12, 1592(%rsp)
	addq	%r13, 1600(%rsp)
.L73:
	movq	136(%rsp), %rdx
	movq	184(%rsp), %rdi
	movq	16(%rsp), %rsi
	subq	$64, %rdx
	cmpq	%rdx, 136(%rsp)
	movq	%rdi, (%rsi)
	jbe	.L85
	movq	208(%rsp), %rsi
	movq	136(%rsp), %rbx
	movl	$-1, %eax
	movzbl	1544(%rsp), %ecx
	cmpb	%cl, -64(%rsi,%rbx)
	jne	.L94
	leaq	1544(%rsp), %rax
	subq	136(%rsp), %rax
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
	vmovdqa	1672(%rsp), %ymm0
	salq	$3, %rdx
	addq	$1, 1032(%rsp)
	movq	%rdx, 808(%rsp)
	movq	1032(%rsp), %rdx
	movabsq	$-8247349341179448980, %rcx
	vmovdqa	%ymm0, InternalState(%rip)
	movq	InternalState+16(%rip), %rbx
	movq	InternalState+24(%rip), %r12
	xorq	InternalState(%rip), %rdx
	movabsq	$6220970056051541820, %r11
	movabsq	$4195444129992158507, %r13
	leaq	(%r12,%rbx), %rsi
	movq	InternalState+8(%rip), %r8
	vmovdqa	1704(%rsp), %ymm0
	leaq	(%rsi,%rcx), %rdi
	vmovdqa	%ymm0, InternalState+32(%rip)
	leaq	(%rdx,%r8), %r10
	vmovdqa	1736(%rsp), %ymm0
	leaq	(%rdi,%rdx), %r9
	movabsq	$7667772426219706969, %rdx
	leaq	(%r8,%rdx), %rdi
	vmovdqa	%ymm0, InternalState+64(%rip)
	rolq	$11, %r9
	vmovdqa	1768(%rsp), %ymm0
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
	movq	%rsi, 1128(%rsp)
	movq	InternalState+56(%rip), %rsi
	xorq	%rdi, %r14
	xorq	%r15, %rdi
	addq	InternalState+48(%rip), %rsi
	movq	%r14, 1064(%rsp)
	movq	%rdi, 1000(%rsp)
	movq	InternalState+40(%rip), %r14
	movq	InternalState+32(%rip), %rdi
	movq	%r8, 1096(%rsp)
	leaq	(%r14,%rdi), %r8
	addq	%rcx, %rdi
	leaq	(%rsi,%rdi), %r9
	leaq	(%r14,%rdx), %rdi
	leaq	(%rsi,%rdi), %r15
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
	addq	1000(%rsp), %r8
	addq	1064(%rsp), %rsi
	xorq	%rdi, %r9
	xorq	%r15, %rdi
	addq	1128(%rsp), %rdi
	addq	1096(%rsp), %r9
	movq	%rsi, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r14, 1224(%rsp)
	movabsq	$-3329063056561552456, %r14
	addq	%rsi, %r8
	addq	%r14, %rdi
	rolq	$7, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1224(%rsp), %r9
	rolq	$19, %r15
	addq	%rsi, %r9
	movq	1288(%rsp), %rsi
	movq	%r15, %rdi
	xorq	%r8, %rdi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1224(%rsp), %rsi
	movq	%rdi, 1288(%rsp)
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	1288(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	1288(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 1256(%rsp)
	movq	%rdi, 1160(%rsp)
	movq	InternalState+72(%rip), %r15
	movq	%rsi, 968(%rsp)
	movq	InternalState+64(%rip), %rdi
	movq	InternalState+88(%rip), %rsi
	addq	InternalState+80(%rip), %rsi
	movq	%r9, 1288(%rsp)
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
	movq	%r8, 1448(%rsp)
	movq	%rdi, %r8
	xorq	1448(%rsp), %rdi
	xorq	%r9, %r8
	addq	968(%rsp), %rdi
	xorq	1448(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%r15, %r8
	addq	1160(%rsp), %r8
	addq	1288(%rsp), %r9
	addq	1256(%rsp), %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	movq	%rsi, 1224(%rsp)
	addq	%r9, %rsi
	movq	%r15, 1448(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1448(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	1224(%rsp), %rsi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1448(%rsp), %rsi
	rolq	$53, %rsi
	xorq	%r8, %rdi
	movq	%rdi, 1224(%rsp)
	movq	%rsi, %rdi
	xorq	1224(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	1224(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 1320(%rsp)
	movq	%rdi, 1192(%rsp)
	movq	InternalState+104(%rip), %r15
	movq	InternalState+96(%rip), %rdi
	movq	%rsi, 1384(%rsp)
	movq	InternalState+120(%rip), %rsi
	addq	InternalState+112(%rip), %rsi
	movq	%r9, 1224(%rsp)
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
	movq	%r8, 1448(%rsp)
	movq	%rdi, %r8
	xorq	1448(%rsp), %rdi
	xorq	%r9, %r8
	addq	1384(%rsp), %rdi
	xorq	1448(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%r15, %r8
	addq	1192(%rsp), %r8
	addq	1224(%rsp), %r9
	addq	1320(%rsp), %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	movq	%rsi, 1480(%rsp)
	addq	%r9, %rsi
	movq	%r15, 1416(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1416(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r8, 1448(%rsp)
	addq	%rsi, %r9
	movq	1480(%rsp), %rsi
	xorq	%r15, %r8
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1416(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	movq	%rsi, 1416(%rsp)
	xorq	%r9, %rdi
	movabsq	$-7999569951748836447, %rsi
	leaq	(%r8,%rsi), %r9
	movq	%rdi, %rsi
	xorq	1448(%rsp), %rdi
	xorq	%r15, %rsi
	movabsq	$-4849728007900573903, %r8
	addq	%rsi, %r8
	movabsq	$-1568322642145848418, %rsi
	addq	%rdi, %rsi
	leaq	(%r9,%r8), %rdi
	movq	%rsi, 1480(%rsp)
	movabsq	$-1642314245251606934, %rsi
	addq	1416(%rsp), %rsi
	addq	1480(%rsp), %rsi
	movq	%rdi, 1448(%rsp)
	leaq	(%r9,%rcx), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r8,%rdx), %rdi
	leaq	(%rdi,%rsi), %r9
	movq	1480(%rsp), %rsi
	movq	1448(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movabsq	$2553129884740551573, %rsi
	addq	1416(%rsp), %rsi
	addq	1448(%rsp), %rsi
	rolq	$37, %rdi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1416(%rsp)
	movq	%r9, %r8
	xorq	1416(%rsp), %r9
	xorq	%r15, %r8
	xorq	1416(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1352(%rsp)
	movq	%rsi, %rdi
	addq	1320(%rsp), %rdi
	movq	%r9, 904(%rsp)
	movq	1352(%rsp), %r9
	addq	1192(%rsp), %r9
	movq	%r15, %r8
	addq	1224(%rsp), %r8
	movq	%r15, 1416(%rsp)
	movq	%rsi, 1480(%rsp)
	movq	%r9, 1224(%rsp)
	movq	904(%rsp), %r15
	movq	%r9, %rsi
	addq	1384(%rsp), %r15
	leaq	(%r8,%rdi), %r9
	movq	%r9, 1384(%rsp)
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r15, 1448(%rsp)
	leaq	(%rdi,%rsi), %r9
	leaq	(%rsi,%r8), %r15
	movq	1224(%rsp), %rsi
	movq	1384(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1448(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1384(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1448(%rsp)
	movq	%r9, %r8
	xorq	1448(%rsp), %r9
	xorq	%r15, %r8
	xorq	1448(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1192(%rsp)
	movq	%rsi, %rdi
	addq	1256(%rsp), %rdi
	movq	%r9, 1384(%rsp)
	movq	1192(%rsp), %r9
	movq	%r15, %r8
	addq	1160(%rsp), %r9
	addq	1288(%rsp), %r8
	movq	%r15, 1448(%rsp)
	movq	1384(%rsp), %r15
	addq	968(%rsp), %r15
	movq	%rsi, 1320(%rsp)
	movq	%r9, 1288(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	addq	%r15, %rsi
	movq	%r9, 1224(%rsp)
	movq	%r15, 1256(%rsp)
	leaq	(%rsi,%rdi), %r9
	leaq	(%rsi,%r8), %r15
	movq	1288(%rsp), %rsi
	movq	1224(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1256(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1224(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1224(%rsp)
	movq	%r9, %r8
	xorq	%r15, %r8
	xorq	1224(%rsp), %r9
	xorq	1224(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%rsi, %rdi
	movq	%r9, 1256(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%rsi, 1160(%rsp)
	movq	%r8, 968(%rsp)
	movq	%r15, %r8
	movq	1256(%rsp), %r15
	addq	1128(%rsp), %r15
	addq	1096(%rsp), %r8
	addq	1064(%rsp), %rdi
	movq	968(%rsp), %r9
	addq	1000(%rsp), %r9
	movq	%r15, %rsi
	movq	%r15, 1288(%rsp)
	movq	%r9, 1096(%rsp)
	addq	%r9, %rsi
	leaq	(%rdi,%r8), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 1128(%rsp)
	leaq	(%r8,%rsi), %r15
	leaq	(%rdi,%rsi), %r9
	movq	1096(%rsp), %rsi
	movq	1128(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1288(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1128(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1096(%rsp)
	movq	%r9, %r8
	xorq	1096(%rsp), %r9
	xorq	%r15, %r8
	movq	%r8, 1288(%rsp)
	movq	1096(%rsp), %r8
	xorq	1288(%rsp), %rdi
	movq	%r9, 1128(%rsp)
	movabsq	$-2292595471992902602, %r9
	xorq	%r15, %r8
	addq	%r8, %r9
	movq	1288(%rsp), %r8
	xorq	%rsi, %r8
	movabsq	$8467826889434979867, %rsi
	addq	%r8, %rsi
	movabsq	$6028102484886760763, %r8
	addq	1128(%rsp), %r8
	movq	%rsi, 1096(%rsp)
	movabsq	$-5006043190370284386, %rsi
	addq	%rsi, %rdi
	movq	1096(%rsp), %rsi
	addq	%rdi, %r8
	addq	%r10, %rdi
	addq	%r9, %rsi
	addq	%rsi, %rdi
	rolq	$7, %rdi
	movq	%rdi, 1288(%rsp)
	movabsq	$2699039428325208307, %rdi
	addq	1128(%rsp), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	leaq	(%rsi,%r8), %r9
	movq	1096(%rsp), %rsi
	rolq	$19, %r15
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	%r8, %rsi
	movq	1288(%rsp), %r8
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rdi
	xorq	%r15, %r8
	xorq	%rdi, %r15
	xorq	1288(%rsp), %rdi
	xorq	%r8, %rsi
	movq	%r15, 840(%rsp)
	addq	1160(%rsp), %r15
	xorq	%r9, %r8
	movq	%rsi, 936(%rsp)
	movq	%r8, 872(%rsp)
	movq	%r8, %r9
	addq	1224(%rsp), %r9
	movq	%rdi, 1288(%rsp)
	movq	%rdi, %r8
	movq	%r15, 1224(%rsp)
	addq	968(%rsp), %r8
	movq	1256(%rsp), %rdi
	addq	%rsi, %rdi
	movq	%r15, %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r9, %rsi
	addq	%r14, %rdi
	addq	%r10, %r8
	movq	%r15, 1256(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1256(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	1224(%rsp), %rsi
	xorq	%r8, %rdi
	movq	%rdi, 1224(%rsp)
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1256(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	1224(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	1224(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 1128(%rsp)
	movq	%rdi, 1256(%rsp)
	movq	%rdi, %r8
	addq	1320(%rsp), %r15
	addq	1192(%rsp), %r8
	movq	1384(%rsp), %rdi
	movq	%r9, 1224(%rsp)
	addq	1448(%rsp), %r9
	movq	%rsi, 1160(%rsp)
	addq	%rsi, %rdi
	movq	%r15, 1448(%rsp)
	movq	%r15, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 1384(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1384(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	1448(%rsp), %rsi
	xorq	%r8, %rdi
	movq	%rdi, 1448(%rsp)
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1384(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	1448(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	1448(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 1384(%rsp)
	movq	%rdi, 1192(%rsp)
	movq	%rdi, %r8
	addq	1480(%rsp), %r15
	addq	1352(%rsp), %r8
	movq	%rsi, %rdi
	addq	904(%rsp), %rdi
	movq	%r9, 1448(%rsp)
	addq	1416(%rsp), %r9
	movq	%rsi, 1320(%rsp)
	movq	%r15, 1096(%rsp)
	movq	%r15, %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 1480(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1480(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r8, 1416(%rsp)
	addq	%rsi, %r9
	movq	1096(%rsp), %rsi
	xorq	%r15, %r8
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1480(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	xorq	%r9, %rdi
	movq	%rsi, 1480(%rsp)
	movabsq	$5953845371152580681, %rsi
	leaq	(%r8,%rsi), %r9
	movq	%rdi, %rsi
	xorq	1416(%rsp), %rdi
	xorq	%r15, %rsi
	movabsq	$-7646712092252898442, %r8
	addq	%rsi, %r8
	movabsq	$-2842268575306187841, %rsi
	addq	%rdi, %rsi
	leaq	(%r9,%r8), %rdi
	movq	%rsi, 1352(%rsp)
	movabsq	$-7946738593435294165, %rsi
	addq	1480(%rsp), %rsi
	addq	1352(%rsp), %rsi
	movq	%rdi, 1416(%rsp)
	leaq	(%r9,%rcx), %rdi
	leaq	(%rsi,%rdi), %r15
	leaq	(%r8,%rdx), %rdi
	leaq	(%rdi,%rsi), %r9
	movq	1352(%rsp), %rsi
	movq	1416(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movabsq	$-3751294463443135658, %rsi
	addq	1480(%rsp), %rsi
	addq	1416(%rsp), %rsi
	rolq	$37, %rdi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1416(%rsp)
	movq	%r15, %r8
	xorq	1416(%rsp), %r15
	xorq	%r9, %r8
	xorq	1416(%rsp), %r9
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1096(%rsp)
	movq	%rsi, %rdi
	addq	1384(%rsp), %rdi
	movq	%r15, %r8
	addq	1448(%rsp), %r8
	movq	%r15, 1416(%rsp)
	movq	%r9, 1000(%rsp)
	movq	1096(%rsp), %r9
	addq	1192(%rsp), %r9
	movq	1000(%rsp), %r15
	addq	1320(%rsp), %r15
	movq	%rsi, 1352(%rsp)
	movq	%r9, 1384(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 1448(%rsp)
	movq	%r15, 1320(%rsp)
	leaq	(%rsi,%rdi), %r9
	leaq	(%rsi,%r8), %r15
	movq	1384(%rsp), %rsi
	movq	1448(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1320(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1448(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1448(%rsp)
	movq	%r9, %r8
	xorq	1448(%rsp), %r9
	xorq	%r15, %r8
	xorq	1448(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1480(%rsp)
	movq	%rsi, %rdi
	addq	1128(%rsp), %rdi
	movq	%r9, 1064(%rsp)
	movq	1480(%rsp), %r9
	movq	%r15, %r8
	addq	1256(%rsp), %r9
	addq	1224(%rsp), %r8
	movq	%r15, 1448(%rsp)
	movq	1064(%rsp), %r15
	addq	1160(%rsp), %r15
	movq	%rsi, 1320(%rsp)
	movq	%r9, 1224(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	addq	%r15, %rsi
	movq	%r15, 1384(%rsp)
	movq	%r9, 1256(%rsp)
	leaq	(%rsi,%r8), %r15
	leaq	(%rsi,%rdi), %r9
	movq	1224(%rsp), %rsi
	movq	1256(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1384(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1256(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1224(%rsp)
	movq	%r9, %r8
	xorq	%r15, %r8
	xorq	1224(%rsp), %r9
	xorq	1224(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1192(%rsp)
	movq	%rsi, %rdi
	addq	840(%rsp), %rdi
	movq	%rsi, 1256(%rsp)
	movq	%r9, 1384(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%r15, %r8
	movq	1384(%rsp), %r15
	addq	936(%rsp), %r15
	addq	872(%rsp), %r8
	movq	1192(%rsp), %r9
	addq	1288(%rsp), %r9
	movq	%r15, %rsi
	addq	%r9, %rsi
	movq	%r9, 1128(%rsp)
	leaq	(%rdi,%r8), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r15, 1288(%rsp)
	movq	%r9, 1160(%rsp)
	leaq	(%r8,%rsi), %r15
	leaq	(%rdi,%rsi), %r9
	movq	1128(%rsp), %rsi
	movq	1160(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1288(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1160(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1128(%rsp)
	movq	%r9, %r8
	xorq	1128(%rsp), %r9
	xorq	%r15, %r8
	movq	%r8, 1288(%rsp)
	movq	1128(%rsp), %r8
	xorq	1288(%rsp), %rdi
	movq	%r9, 1160(%rsp)
	movabsq	$-824919486193887165, %r9
	xorq	%r15, %r8
	addq	%r8, %r9
	movq	1288(%rsp), %r8
	xorq	%rsi, %r8
	movabsq	$-1914029582460860148, %rsi
	addq	%r8, %rsi
	movabsq	$-7632797540959622777, %r8
	addq	1160(%rsp), %r8
	movq	%rsi, 1128(%rsp)
	movabsq	$6609752215332129920, %rsi
	addq	%rsi, %rdi
	movq	1128(%rsp), %rsi
	addq	%rdi, %r8
	addq	%r10, %rdi
	addq	%r9, %rsi
	addq	%rsi, %rdi
	rolq	$7, %rdi
	movq	%rdi, 1288(%rsp)
	movabsq	$7484883476188376383, %rdi
	addq	1160(%rsp), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	leaq	(%rsi,%r8), %r9
	movq	1128(%rsp), %rsi
	rolq	$19, %r15
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	%r8, %rsi
	movq	1288(%rsp), %r8
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rdi
	xorq	%r15, %r8
	xorq	%rdi, %r15
	xorq	1288(%rsp), %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	movq	%r15, 1128(%rsp)
	addq	1256(%rsp), %r15
	movq	%r8, 1160(%rsp)
	movq	%r8, %r9
	addq	1224(%rsp), %r9
	movq	%rsi, 936(%rsp)
	movq	%rdi, 1288(%rsp)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	addq	1192(%rsp), %r8
	addq	1384(%rsp), %rdi
	movq	%r15, %rsi
	movq	%r15, 1224(%rsp)
	addq	%r9, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%rsi, %r8
	movq	%r15, 1384(%rsp)
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1384(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	1224(%rsp), %rsi
	xorq	%r8, %rdi
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1384(%rsp), %rsi
	movq	%rdi, 1224(%rsp)
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	1224(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	1224(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 1192(%rsp)
	movq	%rdi, 968(%rsp)
	movq	%rdi, %r8
	addq	1320(%rsp), %r15
	addq	1480(%rsp), %r8
	movq	%rsi, %rdi
	addq	1064(%rsp), %rdi
	movq	%r9, 1224(%rsp)
	addq	1448(%rsp), %r9
	movq	%rsi, 1256(%rsp)
	movq	%r15, 1448(%rsp)
	movq	%r15, %rsi
	leaq	(%r8,%rdi), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 1384(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1384(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r15, %rdi
	addq	%rsi, %r9
	movq	1448(%rsp), %rsi
	xorq	%r8, %rdi
	movq	%rdi, 1448(%rsp)
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1384(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	1448(%rsp), %rsi
	xorq	%r9, %rdi
	xorq	1448(%rsp), %r9
	xorq	%rdi, %r15
	xorq	%r8, %rdi
	movq	%r15, 1320(%rsp)
	movq	%rdi, 1064(%rsp)
	movq	%rdi, %r8
	addq	1352(%rsp), %r15
	addq	1096(%rsp), %r8
	movq	%rsi, %rdi
	addq	1000(%rsp), %rdi
	movq	%r9, 1448(%rsp)
	addq	1416(%rsp), %r9
	movq	%rsi, 1384(%rsp)
	movq	%r15, 1352(%rsp)
	movq	%r15, %rsi
	leaq	(%rdi,%r8), %r15
	addq	%r14, %rdi
	addq	%r10, %r8
	addq	%r9, %rsi
	movq	%r15, 1480(%rsp)
	addq	%rsi, %r8
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	movq	1480(%rsp), %r9
	rolq	$7, %r8
	rolq	$19, %r15
	movq	%r8, 1416(%rsp)
	addq	%rsi, %r9
	movq	1352(%rsp), %rsi
	xorq	%r15, %r8
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	1480(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r8, %rsi
	xorq	%r9, %r8
	xorq	%r9, %rdi
	movq	%rsi, 1480(%rsp)
	movabsq	$-1139829817207230181, %rsi
	leaq	(%r8,%rsi), %r9
	movq	%rdi, %rsi
	xorq	1416(%rsp), %rdi
	xorq	%r15, %rsi
	movabsq	$3054837738180890943, %r8
	addq	%rsi, %r8
	movabsq	$2588290990126348949, %rsi
	addq	%rdi, %rsi
	leaq	(%r9,%r8), %rdi
	movq	%rsi, 1352(%rsp)
	movabsq	$-938319195649413462, %rsi
	addq	1480(%rsp), %rsi
	addq	1352(%rsp), %rsi
	movq	%rdi, 1416(%rsp)
	leaq	(%r9,%rcx), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r8,%rdx), %rdi
	leaq	(%rdi,%rsi), %r9
	movq	1352(%rsp), %rsi
	movq	1416(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movabsq	$3257124934342745045, %rsi
	addq	1480(%rsp), %rsi
	addq	1416(%rsp), %rsi
	rolq	$37, %rdi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1416(%rsp)
	movq	%r9, %r8
	xorq	1416(%rsp), %r9
	xorq	%r15, %r8
	xorq	1416(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1000(%rsp)
	movq	%rsi, %rdi
	addq	1320(%rsp), %rdi
	movq	%r9, 1480(%rsp)
	movq	1000(%rsp), %r9
	movq	%r15, %r8
	addq	1064(%rsp), %r9
	addq	1448(%rsp), %r8
	movq	%r15, 1416(%rsp)
	movq	1480(%rsp), %r15
	addq	1384(%rsp), %r15
	movq	%rsi, 1352(%rsp)
	movq	%r9, 1448(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r15, 1384(%rsp)
	movq	%r9, 1320(%rsp)
	leaq	(%rsi,%r8), %r15
	leaq	(%rsi,%rdi), %r9
	movq	1448(%rsp), %rsi
	movq	1320(%rsp), %rdi
	rolq	$11, %r15
	rolq	$23, %r9
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1384(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1320(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1384(%rsp)
	movq	%r9, %r8
	xorq	1384(%rsp), %r9
	xorq	%r15, %r8
	xorq	1384(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%rsi, 872(%rsp)
	movq	%rsi, %rdi
	movq	%r9, 904(%rsp)
	movq	%r15, 1384(%rsp)
	movq	%r8, 840(%rsp)
	movq	%r15, %r8
	addq	1192(%rsp), %rdi
	addq	1224(%rsp), %r8
	movq	840(%rsp), %r9
	addq	968(%rsp), %r9
	movq	904(%rsp), %r15
	addq	1256(%rsp), %r15
	movq	%r9, 1448(%rsp)
	movq	%r9, %rsi
	leaq	(%r8,%rdi), %r9
	addq	%r15, %rsi
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 1224(%rsp)
	movq	%r15, 1320(%rsp)
	leaq	(%rsi,%rdi), %r9
	leaq	(%rsi,%r8), %r15
	movq	1448(%rsp), %rsi
	movq	1224(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1320(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1224(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1224(%rsp)
	movq	%r9, %r8
	xorq	%r15, %r8
	xorq	1224(%rsp), %r9
	xorq	1224(%rsp), %r15
	xorq	%r8, %rsi
	xorq	%rdi, %r8
	movq	%r8, 1064(%rsp)
	movq	%rsi, %rdi
	addq	1128(%rsp), %rdi
	movq	%rsi, 1096(%rsp)
	movq	%r9, 1448(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%r15, %r8
	movq	1448(%rsp), %r15
	addq	936(%rsp), %r15
	addq	1160(%rsp), %r8
	movq	1064(%rsp), %r9
	addq	1288(%rsp), %r9
	movq	%r15, %rsi
	movq	%r15, 1288(%rsp)
	addq	%r9, %rsi
	movq	%r9, 1256(%rsp)
	leaq	(%rdi,%r8), %r9
	addq	%rcx, %r8
	addq	%rdx, %rdi
	movq	%r9, 1320(%rsp)
	leaq	(%r8,%rsi), %r15
	leaq	(%rdi,%rsi), %r9
	movq	1256(%rsp), %rsi
	movq	1320(%rsp), %rdi
	rolq	$23, %r9
	rolq	$11, %r15
	addq	%r11, %rsi
	addq	%rsi, %rdi
	movq	1288(%rsp), %rsi
	rolq	$37, %rdi
	addq	%r13, %rsi
	addq	1320(%rsp), %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%rdi, %r8
	movq	%r8, 1256(%rsp)
	movq	%r9, %r8
	xorq	1256(%rsp), %r9
	xorq	%r15, %r8
	movq	%r8, 1288(%rsp)
	movq	1256(%rsp), %r8
	xorq	1288(%rsp), %rdi
	movq	%r9, 1320(%rsp)
	movabsq	$-6097248013946911484, %r9
	xorq	%r15, %r8
	addq	%r8, %r9
	movq	1288(%rsp), %r8
	xorq	%rsi, %r8
	movabsq	$3174302594670681997, %rsi
	addq	%r8, %rsi
	movabsq	$-8739574512844769069, %r8
	addq	1320(%rsp), %r8
	movq	%rsi, 1256(%rsp)
	movabsq	$-496885038275669880, %rsi
	addq	%rsi, %rdi
	movq	1256(%rsp), %rsi
	addq	%rdi, %r8
	addq	%r10, %rdi
	addq	%r9, %rsi
	addq	%rsi, %rdi
	rolq	$7, %rdi
	movq	%rdi, 1288(%rsp)
	movabsq	$6378106504303230091, %rdi
	addq	1320(%rsp), %rdi
	leaq	(%rdi,%rsi), %r15
	leaq	(%r9,%rbx), %rsi
	leaq	(%rsi,%r8), %r9
	movq	1256(%rsp), %rsi
	rolq	$19, %r15
	rolq	$31, %r9
	addq	%r12, %rsi
	addq	%r8, %rsi
	movq	1288(%rsp), %r8
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rdi
	xorq	%r15, %r8
	xorq	%rdi, %r15
	xorq	1288(%rsp), %rdi
	xorq	%r8, %rsi
	movq	%r15, 1192(%rsp)
	xorq	%r9, %r8
	movq	%r15, preCompInternalState+16(%rip)
	addq	1096(%rsp), %r15
	movq	%r8, 1256(%rsp)
	movq	%r8, %r9
	movq	%r8, preCompInternalState+8(%rip)
	addq	1224(%rsp), %r9
	movq	%rdi, 1288(%rsp)
	movq	%rdi, preCompInternalState+24(%rip)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	addq	1064(%rsp), %r8
	addq	1448(%rsp), %rdi
	movq	%rsi, 1320(%rsp)
	movq	%rsi, preCompInternalState(%rip)
	movq	%r15, %rsi
	addq	%r9, %rsi
	movq	%r15, 1224(%rsp)
	leaq	(%r8,%rdi), %r15
	addq	%r10, %r8
	addq	%r14, %rdi
	addq	%rsi, %r8
	rolq	$7, %r8
	movq	%r15, 1160(%rsp)
	leaq	(%rdi,%rsi), %r15
	movq	%r8, 1448(%rsp)
	movq	1160(%rsp), %r8
	leaq	(%r9,%rbx), %rsi
	movq	1448(%rsp), %r9
	rolq	$19, %r15
	addq	%rsi, %r8
	movq	1224(%rsp), %rsi
	rolq	$31, %r8
	xorq	%r15, %r9
	addq	%r12, %rsi
	addq	1160(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rsi
	xorq	%r8, %r9
	xorq	%r8, %rdi
	movq	%rsi, 1096(%rsp)
	movq	%r9, 1064(%rsp)
	xorq	%rdi, %r15
	xorq	1448(%rsp), %rdi
	addq	1384(%rsp), %r9
	movq	%r15, 968(%rsp)
	addq	872(%rsp), %r15
	movq	%rdi, 1448(%rsp)
	movq	%rdi, %r8
	movq	%rsi, %rdi
	addq	840(%rsp), %r8
	addq	904(%rsp), %rdi
	movq	%r15, %rsi
	addq	%r9, %rsi
	movq	%r15, 1160(%rsp)
	leaq	(%r8,%rdi), %r15
	addq	%r10, %r8
	addq	%r14, %rdi
	addq	%rsi, %r8
	rolq	$7, %r8
	movq	%r15, 1384(%rsp)
	leaq	(%rdi,%rsi), %r15
	movq	%r8, 1224(%rsp)
	movq	1384(%rsp), %r8
	leaq	(%r9,%rbx), %rsi
	movq	1224(%rsp), %r9
	rolq	$19, %r15
	addq	%rsi, %r8
	movq	1160(%rsp), %rsi
	rolq	$31, %r8
	xorq	%r15, %r9
	addq	%r12, %rsi
	addq	1384(%rsp), %rsi
	rolq	$53, %rsi
	movq	%rsi, %rdi
	xorq	%r9, %rsi
	xorq	%r8, %r9
	xorq	%r8, %rdi
	movq	%rsi, 1384(%rsp)
	movq	%r9, 1160(%rsp)
	xorq	%rdi, %r15
	xorq	1224(%rsp), %rdi
	movq	%r15, 1128(%rsp)
	movq	%r9, %r15
	movq	1128(%rsp), %rsi
	addq	1416(%rsp), %r15
	addq	1352(%rsp), %rsi
	movq	%rdi, 1224(%rsp)
	movq	%rdi, %r8
	movq	1384(%rsp), %rdi
	addq	1000(%rsp), %r8
	addq	1480(%rsp), %rdi
	movq	%rsi, 1352(%rsp)
	addq	%r15, %rsi
	addq	%r15, %rbx
	leaq	(%rdi,%r8), %r9
	addq	%r10, %r8
	addq	%r14, %rdi
	movq	%r9, 1416(%rsp)
	leaq	(%r8,%rsi), %r9
	leaq	(%rdi,%rsi), %r8
	movq	1352(%rsp), %rsi
	rolq	$7, %r9
	rolq	$19, %r8
	addq	1416(%rsp), %rbx
	movq	%r8, %rdi
	addq	%r12, %rsi
	addq	1416(%rsp), %rsi
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
	movq	1384(%rsp), %rsi
	xorq	%r9, %r12
	addq	1224(%rsp), %rdi
	xorq	%r10, %r9
	movq	%r9, preCompInternalState+104(%rip)
	movq	%r8, preCompInternalState+112(%rip)
	addq	1160(%rsp), %r9
	addq	1128(%rsp), %r8
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
	addq	1064(%rsp), %r9
	addq	968(%rsp), %r8
	movq	%rdi, preCompInternalState+88(%rip)
	movq	1096(%rsp), %rsi
	addq	1448(%rsp), %rdi
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
	addq	1256(%rsp), %rcx
	addq	1192(%rsp), %rsi
	movq	%rdx, preCompInternalState+56(%rip)
	addq	1288(%rsp), %rdx
	movq	%r10, preCompInternalState+32(%rip)
	movq	%rcx, InternalState(%rip)
	movq	%rsi, InternalState+8(%rip)
	movq	%rdx, InternalState+16(%rip)
	movq	1320(%rsp), %rdx
	addq	%r10, %rdx
	testq	%rax, %rax
	movq	%rdx, InternalState+24(%rip)
	je	.L64
	movq	24(%rsp), %rdi
	addq	808(%rsp), %rdi
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
	movq	%rdi, 1256(%rsp)
	movq	InternalState+56(%rip), %rdi
	xorq	%r8, %r13
	xorq	%r14, %r8
	movq	%r9, 1192(%rsp)
	movq	%r13, 1480(%rsp)
	movq	%r8, 1352(%rsp)
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
	addq	1352(%rsp), %r9
	addq	1480(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r14, %r8
	addq	1256(%rsp), %r8
	addq	1192(%rsp), %r10
	movq	%rdi, 1288(%rsp)
	leaq	(%r9,%r8), %r13
	addq	%rsi, %r9
	addq	%r10, %rdi
	movq	%r13, 1224(%rsp)
	movabsq	$-3329063056561552456, %r13
	leaq	(%r9,%rdi), %r15
	addq	%r13, %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1224(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	addq	%rdi, %r10
	movq	1288(%rsp), %rdi
	movq	%r14, %r9
	rolq	$31, %r10
	xorq	%r15, %r9
	addq	%rbx, %rdi
	addq	1224(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1160(%rsp)
	movq	InternalState+88(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+80(%rip), %rdi
	movq	%r14, 1096(%rsp)
	movq	%r8, 1064(%rsp)
	movq	InternalState+72(%rip), %r14
	movq	InternalState+64(%rip), %r8
	movq	%r9, 1128(%rsp)
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
	addq	1096(%rsp), %rdi
	xorq	%r14, %r8
	xorq	%r14, %r9
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	1128(%rsp), %r10
	movq	%rdi, 1224(%rsp)
	addq	1064(%rsp), %r9
	addq	1160(%rsp), %r8
	addq	%r10, %rdi
	leaq	(%r9,%r8), %r14
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1288(%rsp)
	movq	InternalState+120(%rip), %rdi
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	InternalState+112(%rip), %rdi
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	InternalState+104(%rip), %r14
	movq	InternalState+96(%rip), %r8
	movq	%r9, 1224(%rsp)
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
	addq	1416(%rsp), %r9
	addq	1448(%rsp), %rdi
	xorq	%r8, %r10
	xorq	%r15, %r8
	addq	1288(%rsp), %r8
	addq	1224(%rsp), %r10
	movq	%rdi, 1320(%rsp)
	leaq	(%r8,%r9), %r15
	addq	%rsi, %r9
	addq	%r13, %r8
	addq	%r10, %rdi
	movq	%r15, 1384(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1384(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1320(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r8
	movq	%rdi, 1384(%rsp)
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
	addq	1384(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 1320(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1320(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$2553129884740551573, %rdi
	addq	1384(%rsp), %rdi
	addq	1320(%rsp), %rdi
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
	movq	%r10, 1000(%rsp)
	movq	%r14, 968(%rsp)
	movq	%rdi, 936(%rsp)
	addq	1288(%rsp), %r10
	addq	1448(%rsp), %r8
	movq	%r9, 904(%rsp)
	movq	%r14, %r9
	addq	1224(%rsp), %r9
	movq	904(%rsp), %r15
	addq	1416(%rsp), %r15
	movq	%r10, 1288(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r10, 1224(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1224(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1288(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 872(%rsp)
	movq	%rdi, %r8
	addq	1160(%rsp), %r10
	addq	1096(%rsp), %r8
	movq	%r9, 776(%rsp)
	movq	%r14, %r9
	addq	1128(%rsp), %r9
	movq	776(%rsp), %r15
	addq	1064(%rsp), %r15
	movq	%r14, 840(%rsp)
	movq	%rdi, 808(%rsp)
	movq	%r10, %rdi
	movq	%r10, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%rcx, %r9
	addq	%rdx, %r8
	addq	%r15, %rdi
	movq	%r14, 1288(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	1288(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1224(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1288(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 1416(%rsp)
	movq	1416(%rsp), %r15
	xorq	%r8, %r10
	xorq	%r8, %r14
	addq	1352(%rsp), %r15
	movq	%r10, 1288(%rsp)
	addq	1256(%rsp), %r10
	movq	%r14, %r9
	movq	%rdi, %r8
	addq	1192(%rsp), %r9
	addq	1480(%rsp), %r8
	movq	%rdi, 1448(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r10, %rdi
	movq	%r10, 1384(%rsp)
	addq	%r15, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rcx, %r9
	leaq	(%r9,%rdi), %r14
	movq	%r10, 1320(%rsp)
	rolq	$11, %r14
	addq	%rdx, %r8
	leaq	(%r8,%rdi), %r10
	movq	1320(%rsp), %r8
	leaq	(%r15,%rax), %rdi
	movq	1320(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 1384(%rsp)
	movabsq	$-2292595471992902602, %rdi
	xorq	%r8, %r9
	xorq	1384(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 1320(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	1384(%rsp), %r9
	movabsq	$8467826889434979867, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$6028102484886760763, %r9
	addq	1320(%rsp), %r9
	movq	%rdi, 1256(%rsp)
	movabsq	$-5006043190370284386, %rdi
	addq	%rdi, %r8
	movq	1256(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$2699039428325208307, %r8
	addq	1320(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1256(%rsp), %rdi
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
	movq	%r9, 1256(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	1224(%rsp), %r10
	movq	%r14, 1192(%rsp)
	movq	%r8, 1480(%rsp)
	movq	%r8, %r9
	addq	1448(%rsp), %r14
	movq	%rdi, %r8
	addq	1416(%rsp), %r9
	addq	1288(%rsp), %r8
	movq	%rdi, 1320(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1160(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	840(%rsp), %r10
	movq	%r14, 1128(%rsp)
	movq	%r8, 1096(%rsp)
	movq	%r8, %r9
	addq	808(%rsp), %r14
	addq	776(%rsp), %r9
	movq	%rdi, %r8
	addq	872(%rsp), %r8
	movq	%rdi, 1352(%rsp)
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	rolq	$53, %rdi
	xorq	%r15, %r9
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1224(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	968(%rsp), %r10
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	%r8, %r9
	addq	936(%rsp), %r14
	addq	904(%rsp), %r9
	movq	%rdi, %r8
	addq	1000(%rsp), %r8
	movq	%rdi, 1288(%rsp)
	movq	%r14, 1064(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1384(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1384(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1064(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1384(%rsp)
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
	addq	1384(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 1064(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1064(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$-3751294463443135658, %rdi
	movq	%r10, %r9
	rolq	$37, %r15
	addq	1384(%rsp), %rdi
	xorq	%r14, %r9
	addq	1064(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 936(%rsp)
	movq	936(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 1064(%rsp)
	addq	1448(%rsp), %r8
	movq	%r14, %r9
	addq	1288(%rsp), %r10
	addq	1224(%rsp), %r9
	addq	1416(%rsp), %r15
	movq	%rdi, 968(%rsp)
	movq	%r14, 1000(%rsp)
	movq	%r10, 1288(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 1224(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1224(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1288(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 904(%rsp)
	addq	1352(%rsp), %r10
	addq	1128(%rsp), %r8
	movq	%r9, 808(%rsp)
	movq	%r14, %r9
	addq	1160(%rsp), %r9
	movq	808(%rsp), %r15
	addq	1096(%rsp), %r15
	movq	%r14, 872(%rsp)
	movq	%rdi, 840(%rsp)
	movq	%r10, %rdi
	movq	%r10, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r14, 1288(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	1288(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1224(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1288(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 1416(%rsp)
	movq	1416(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 1288(%rsp)
	addq	1192(%rsp), %r8
	movq	%r14, %r9
	addq	1320(%rsp), %r10
	addq	1256(%rsp), %r9
	addq	1480(%rsp), %r15
	movq	%rdi, 1448(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r10, 1384(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%r15, %rdi
	addq	%rdx, %r8
	addq	%rcx, %r9
	movq	%r10, 1320(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	1320(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	1320(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 1384(%rsp)
	movabsq	$-824919486193887165, %rdi
	xorq	%r8, %r9
	xorq	%r9, %r10
	xorq	%r14, %r9
	xorq	1384(%rsp), %r8
	movq	%r10, 1320(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	1384(%rsp), %r9
	movabsq	$-1914029582460860148, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-7632797540959622777, %r9
	addq	1320(%rsp), %r9
	movq	%rdi, 1256(%rsp)
	movabsq	$6609752215332129920, %rdi
	addq	%rdi, %r8
	movq	1256(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$7484883476188376383, %r8
	addq	1320(%rsp), %r8
	rolq	$7, %r15
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1256(%rsp), %rdi
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
	movq	%rdi, 1320(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r9, 1256(%rsp)
	movq	%r14, 1192(%rsp)
	movq	%r8, 1480(%rsp)
	movq	%r8, %r9
	addq	1448(%rsp), %r14
	addq	1416(%rsp), %r9
	movq	%rdi, %r8
	addq	1288(%rsp), %r8
	addq	1224(%rsp), %r10
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1160(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	872(%rsp), %r10
	movq	%r14, 1128(%rsp)
	movq	%r8, 1096(%rsp)
	movq	%r8, %r9
	addq	840(%rsp), %r14
	addq	808(%rsp), %r9
	movq	%rdi, %r8
	addq	904(%rsp), %r8
	movq	%rdi, 1352(%rsp)
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1224(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	1000(%rsp), %r10
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	%r8, %r9
	addq	968(%rsp), %r14
	addq	936(%rsp), %r9
	movq	%rdi, %r8
	addq	1064(%rsp), %r8
	movq	%rdi, 1288(%rsp)
	movq	%r14, 1000(%rsp)
	movq	%r14, %rdi
	leaq	(%r8,%r9), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1384(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1384(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1000(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1384(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%rdi, 1384(%rsp)
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
	addq	1384(%rsp), %rdi
	leaq	(%r10,%r9), %r8
	movq	%r8, 1064(%rsp)
	leaq	(%r10,%rcx), %r8
	addq	%r15, %rdi
	leaq	(%rdi,%r8), %r14
	leaq	(%r9,%rdx), %r8
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1064(%rsp), %r15
	rolq	$11, %r14
	rolq	$23, %r10
	addq	%rdi, %r15
	movabsq	$3257124934342745045, %rdi
	addq	1384(%rsp), %rdi
	addq	1064(%rsp), %rdi
	rolq	$37, %r15
	movq	%r10, %r9
	xorq	%r14, %r9
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 936(%rsp)
	movq	936(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 1064(%rsp)
	movq	%r14, %r9
	addq	1224(%rsp), %r9
	addq	1448(%rsp), %r8
	addq	1288(%rsp), %r10
	addq	1416(%rsp), %r15
	movq	%rdi, 968(%rsp)
	movq	%r14, 1000(%rsp)
	movq	%r10, 1288(%rsp)
	movq	%r10, %rdi
	leaq	(%r9,%r8), %r10
	addq	%r15, %rdi
	addq	%rcx, %r9
	addq	%rdx, %r8
	movq	%r10, 1224(%rsp)
	leaq	(%rdi,%r9), %r14
	leaq	(%rdi,%r8), %r10
	leaq	(%r15,%rax), %rdi
	movq	1224(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1288(%rsp), %rdi
	xorq	%r14, %r9
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1224(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r15, %r9
	xorq	%r15, %r8
	movq	%r9, 808(%rsp)
	movq	808(%rsp), %r15
	xorq	%r8, %r14
	xorq	%r8, %r10
	movq	%rdi, %r8
	movq	%r10, 904(%rsp)
	addq	1128(%rsp), %r8
	movq	%r14, %r9
	addq	1352(%rsp), %r10
	addq	1160(%rsp), %r9
	addq	1096(%rsp), %r15
	movq	%r14, 872(%rsp)
	movq	%rdi, 840(%rsp)
	leaq	(%r9,%r8), %r14
	movq	%r10, %rdi
	addq	%rcx, %r9
	addq	%r15, %rdi
	addq	%rdx, %r8
	movq	%r10, 1224(%rsp)
	movq	%r14, 1288(%rsp)
	leaq	(%rdi,%r8), %r10
	leaq	(%rdi,%r9), %r14
	leaq	(%r15,%rax), %rdi
	movq	1288(%rsp), %r15
	rolq	$23, %r10
	rolq	$11, %r14
	movq	%r10, %r9
	addq	%rdi, %r15
	movq	1224(%rsp), %rdi
	rolq	$37, %r15
	addq	%r12, %rdi
	addq	1288(%rsp), %rdi
	rolq	$59, %rdi
	movq	%rdi, %r8
	xorq	%r15, %r8
	xorq	%r14, %r9
	xorq	%r9, %rdi
	xorq	%r8, %r14
	xorq	%r8, %r10
	xorq	%r15, %r9
	movq	%r10, 1288(%rsp)
	movq	%rdi, %r8
	addq	1320(%rsp), %r10
	movq	%r9, 1416(%rsp)
	movq	%r14, %r9
	addq	1192(%rsp), %r8
	addq	1256(%rsp), %r9
	movq	1416(%rsp), %r15
	addq	1480(%rsp), %r15
	movq	%rdi, 1448(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r10, 1384(%rsp)
	movq	%r10, %rdi
	leaq	(%r8,%r9), %r10
	addq	%rdx, %r8
	addq	%rcx, %r9
	addq	%r15, %rdi
	movq	%r10, 1320(%rsp)
	leaq	(%r8,%rdi), %r10
	movq	1320(%rsp), %r8
	leaq	(%r9,%rdi), %r14
	leaq	(%r15,%rax), %rdi
	movq	1320(%rsp), %r15
	rolq	$23, %r10
	addq	%rdi, %r8
	movq	1384(%rsp), %rdi
	rolq	$11, %r14
	rolq	$37, %r8
	addq	%r12, %rdi
	addq	%rdi, %r15
	movq	%r10, %rdi
	rolq	$59, %r15
	xorq	%r14, %rdi
	movq	%r15, %r9
	movq	%rdi, 1384(%rsp)
	movabsq	$-6097248013946911484, %rdi
	xorq	%r8, %r9
	xorq	1384(%rsp), %r8
	xorq	%r9, %r10
	xorq	%r14, %r9
	movq	%r10, 1320(%rsp)
	leaq	(%r9,%rdi), %r10
	movq	1384(%rsp), %r9
	movabsq	$3174302594670681997, %rdi
	xorq	%r15, %r9
	addq	%r9, %rdi
	movabsq	$-8739574512844769069, %r9
	addq	1320(%rsp), %r9
	movq	%rdi, 1256(%rsp)
	movabsq	$-496885038275669880, %rdi
	addq	%rdi, %r8
	movq	1256(%rsp), %rdi
	addq	%r8, %r9
	addq	%rsi, %r8
	addq	%r10, %rdi
	leaq	(%r8,%rdi), %r15
	movabsq	$6378106504303230091, %r8
	rolq	$7, %r15
	addq	1320(%rsp), %r8
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	leaq	(%rdi,%r9), %r10
	movq	1256(%rsp), %rdi
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
	movq	%r9, 1320(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	1224(%rsp), %r10
	movq	%r14, 1256(%rsp)
	movq	%r8, 1352(%rsp)
	movq	%r8, %r9
	addq	1448(%rsp), %r14
	addq	1416(%rsp), %r9
	movq	%rdi, %r8
	addq	1288(%rsp), %r8
	movq	%rdi, 1480(%rsp)
	movq	%r14, 1224(%rsp)
	movq	%r14, %rdi
	leaq	(%r9,%r8), %r14
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	leaq	(%r9,%rdi), %r15
	movq	%r14, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$7, %r15
	rolq	$19, %r14
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1160(%rsp)
	movq	%r9, %r10
	xorq	%r8, %r14
	xorq	%r15, %r8
	addq	872(%rsp), %r10
	movq	%r14, 1128(%rsp)
	movq	%r8, 1096(%rsp)
	movq	%r8, %r9
	addq	840(%rsp), %r14
	movq	%rdi, %r8
	addq	808(%rsp), %r9
	addq	904(%rsp), %r8
	movq	%rdi, 1192(%rsp)
	movq	%r14, %rdi
	movq	%r14, 1224(%rsp)
	leaq	(%r9,%r8), %r15
	addq	%r10, %rdi
	addq	%rsi, %r9
	addq	%r13, %r8
	movq	%r15, 1288(%rsp)
	leaq	(%r8,%rdi), %r14
	leaq	(%r9,%rdi), %r15
	leaq	(%r10,%r11), %rdi
	movq	1288(%rsp), %r10
	rolq	$19, %r14
	rolq	$7, %r15
	movq	%r14, %r9
	addq	%rdi, %r10
	movq	1224(%rsp), %rdi
	xorq	%r15, %r9
	rolq	$31, %r10
	addq	%rbx, %rdi
	addq	1288(%rsp), %rdi
	rolq	$53, %rdi
	movq	%rdi, %r8
	xorq	%r9, %rdi
	xorq	%r10, %r9
	xorq	%r10, %r8
	movq	%r9, 1224(%rsp)
	movq	%rdi, 1288(%rsp)
	xorq	%r8, %r14
	xorq	%r15, %r8
	movq	%r14, 1448(%rsp)
	movq	%r8, 1416(%rsp)
	movq	%r9, %r14
	movq	1448(%rsp), %r15
	addq	1000(%rsp), %r14
	movq	%r8, %r9
	addq	968(%rsp), %r15
	addq	936(%rsp), %r9
	movq	%rdi, %r8
	addq	1064(%rsp), %r8
	addq	%r14, %r11
	leaq	(%r15,%r14), %rdi
	addq	%r9, %rsi
	movq	1448(%rsp), %r14
	leaq	(%r8,%r9), %r10
	addq	%r13, %r8
	addq	%rdi, %r8
	movq	%r10, 1384(%rsp)
	leaq	(%rsi,%rdi), %r10
	addq	1384(%rsp), %r11
	leaq	(%r15,%rbx), %rsi
	addq	1384(%rsp), %rsi
	rolq	$19, %r8
	rolq	$7, %r10
	movq	%r8, %rdi
	movq	1416(%rsp), %r15
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
	movq	1224(%rsp), %r13
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
	addq	1288(%rsp), %rdi
	addq	%r9, %r13
	leaq	0(%r13,%r14), %r8
	movq	%rdi, 1288(%rsp)
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
	movq	1288(%rsp), %rsi
	rolq	$23, %rbx
	movq	%rbx, %r9
	rolq	$37, %r11
	xorq	%r10, %r9
	movq	1128(%rsp), %r10
	addq	%r12, %rsi
	addq	%r8, %rsi
	rolq	$59, %rsi
	movq	%rsi, %r8
	xorq	%r11, %r8
	xorq	%r8, %rdi
	addq	1160(%rsp), %rdi
	xorq	%r9, %rsi
	xorq	%r11, %r9
	addq	1096(%rsp), %r9
	movq	1192(%rsp), %r11
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
	movq	1544(%rsp), %r11
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
	addq	1320(%rsp), %rcx
	xorq	%rsi, %rax
	addq	1256(%rsp), %rax
	xorq	%rdi, %rsi
	xorq	%r8, %rdx
	addq	1352(%rsp), %rsi
	addq	1480(%rsp), %rdx
	addq	%r11, %rcx
	movq	%rcx, 1192(%rsp)
	movq	1552(%rsp), %r12
	movq	1568(%rsp), %rcx
	addq	1576(%rsp), %r13
	addq	1584(%rsp), %r14
	movq	1288(%rsp), %rbx
	addq	%r12, %rax
	movq	%rax, 1256(%rsp)
	movq	1560(%rsp), %rax
	addq	%rcx, %rdx
	movq	%rdx, 1384(%rsp)
	movq	%r13, 584(%rsp)
	movq	%r14, 616(%rsp)
	movq	1192(%rsp), %rdx
	addq	%rax, %rsi
	addq	1592(%rsp), %r15
	addq	1600(%rsp), %rbx
	movq	%rsi, 1320(%rsp)
	movq	1256(%rsp), %r10
	movq	%rsi, %rdi
	movq	1384(%rsp), %r9
	movq	%r15, 648(%rsp)
	movq	%rbx, 680(%rsp)
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
	movq	$0, 232(%rsp)
	jmp	.L71
.L108:
	movq	1672(%rsp), %rdi
	movq	1680(%rsp), %r8
	movq	1704(%rsp), %r11
	movq	1712(%rsp), %r12
	movq	1688(%rsp), %r9
	movq	1696(%rsp), %r10
	movq	1720(%rsp), %r13
	movq	1728(%rsp), %r14
	movq	1768(%rsp), %rbx
	movq	1776(%rsp), %rsi
	movq	%rdi, 552(%rsp)
	movq	%r8, 712(%rsp)
	movq	1784(%rsp), %rdi
	movq	1792(%rsp), %r8
	movq	1752(%rsp), %rdx
	movq	1736(%rsp), %r15
	movq	1744(%rsp), %rax
	movq	1760(%rsp), %rcx
	movq	%r9, 56(%rsp)
	movq	%r10, 48(%rsp)
	leaq	(%r14,%r13), %r9
	leaq	(%r12,%r11), %r10
	movq	%r11, 88(%rsp)
	movq	%r12, 96(%rsp)
	leaq	(%r8,%rdi), %r11
	leaq	(%rsi,%rbx), %r12
	movq	%rdx, 184(%rsp)
	movq	%r13, 112(%rsp)
	movq	%r14, 104(%rsp)
	xorl	%edx, %edx
	movq	%r15, 64(%rsp)
	movq	%rax, 200(%rsp)
	movq	%rcx, 176(%rsp)
	movq	%rbx, 120(%rsp)
	movq	%rsi, 128(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%r8, 72(%rsp)
	movq	%r9, 152(%rsp)
	movq	%r10, 144(%rsp)
	movq	%r11, 168(%rsp)
	movq	%r12, 160(%rsp)
	jmp	.L59
	.cfi_endproc
.LFE2783:
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
	.type	_ZL14preCompConstV4, @object
	.size	_ZL14preCompConstV4, 1024
_ZL14preCompConstV4:
	.quad	-3463520432737951897
	.quad	-3463520432737951897
	.quad	-3463520432737951897
	.quad	-3463520432737951897
	.quad	-1376848230519552085
	.quad	-1376848230519552085
	.quad	-1376848230519552085
	.quad	-1376848230519552085
	.quad	-9209400399786843361
	.quad	-9209400399786843361
	.quad	-9209400399786843361
	.quad	-9209400399786843361
	.quad	-369815132508846929
	.quad	-369815132508846929
	.quad	-369815132508846929
	.quad	-369815132508846929
	.quad	-1642314245251606934
	.quad	-1642314245251606934
	.quad	-1642314245251606934
	.quad	-1642314245251606934
	.quad	-7999569951748836447
	.quad	-7999569951748836447
	.quad	-7999569951748836447
	.quad	-7999569951748836447
	.quad	-4849728007900573903
	.quad	-4849728007900573903
	.quad	-4849728007900573903
	.quad	-4849728007900573903
	.quad	-1568322642145848418
	.quad	-1568322642145848418
	.quad	-1568322642145848418
	.quad	-1568322642145848418
	.quad	6028102484886760763
	.quad	6028102484886760763
	.quad	6028102484886760763
	.quad	6028102484886760763
	.quad	-2292595471992902602
	.quad	-2292595471992902602
	.quad	-2292595471992902602
	.quad	-2292595471992902602
	.quad	8467826889434979867
	.quad	8467826889434979867
	.quad	8467826889434979867
	.quad	8467826889434979867
	.quad	-5006043190370284386
	.quad	-5006043190370284386
	.quad	-5006043190370284386
	.quad	-5006043190370284386
	.quad	-7946738593435294165
	.quad	-7946738593435294165
	.quad	-7946738593435294165
	.quad	-7946738593435294165
	.quad	5953845371152580681
	.quad	5953845371152580681
	.quad	5953845371152580681
	.quad	5953845371152580681
	.quad	-7646712092252898442
	.quad	-7646712092252898442
	.quad	-7646712092252898442
	.quad	-7646712092252898442
	.quad	-2842268575306187841
	.quad	-2842268575306187841
	.quad	-2842268575306187841
	.quad	-2842268575306187841
	.quad	-7632797540959622777
	.quad	-7632797540959622777
	.quad	-7632797540959622777
	.quad	-7632797540959622777
	.quad	-824919486193887165
	.quad	-824919486193887165
	.quad	-824919486193887165
	.quad	-824919486193887165
	.quad	-1914029582460860148
	.quad	-1914029582460860148
	.quad	-1914029582460860148
	.quad	-1914029582460860148
	.quad	6609752215332129920
	.quad	6609752215332129920
	.quad	6609752215332129920
	.quad	6609752215332129920
	.quad	-938319195649413462
	.quad	-938319195649413462
	.quad	-938319195649413462
	.quad	-938319195649413462
	.quad	-1139829817207230181
	.quad	-1139829817207230181
	.quad	-1139829817207230181
	.quad	-1139829817207230181
	.quad	3054837738180890943
	.quad	3054837738180890943
	.quad	3054837738180890943
	.quad	3054837738180890943
	.quad	2588290990126348949
	.quad	2588290990126348949
	.quad	2588290990126348949
	.quad	2588290990126348949
	.quad	-8739574512844769069
	.quad	-8739574512844769069
	.quad	-8739574512844769069
	.quad	-8739574512844769069
	.quad	-6097248013946911484
	.quad	-6097248013946911484
	.quad	-6097248013946911484
	.quad	-6097248013946911484
	.quad	3174302594670681997
	.quad	3174302594670681997
	.quad	3174302594670681997
	.quad	3174302594670681997
	.quad	-496885038275669880
	.quad	-496885038275669880
	.quad	-496885038275669880
	.quad	-496885038275669880
	.quad	1906713845121804688
	.quad	1906713845121804688
	.quad	1906713845121804688
	.quad	1906713845121804688
	.quad	853475092736589577
	.quad	853475092736589577
	.quad	853475092736589577
	.quad	853475092736589577
	.quad	-5486504877919021346
	.quad	-5486504877919021346
	.quad	-5486504877919021346
	.quad	-5486504877919021346
	.quad	-4925106476758491821
	.quad	-4925106476758491821
	.quad	-4925106476758491821
	.quad	-4925106476758491821
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	4
	.quad	4
	.quad	4
	.quad	4
	.align 32
.LC1:
	.quad	-8247349341179448980
	.quad	-8247349341179448980
	.quad	-8247349341179448980
	.quad	-8247349341179448980
	.align 32
.LC2:
	.quad	7667772426219706969
	.quad	7667772426219706969
	.quad	7667772426219706969
	.quad	7667772426219706969
	.align 32
.LC3:
	.quad	6220970056051541820
	.quad	6220970056051541820
	.quad	6220970056051541820
	.quad	6220970056051541820
	.align 32
.LC4:
	.quad	4195444129992158507
	.quad	4195444129992158507
	.quad	4195444129992158507
	.quad	4195444129992158507
	.align 32
.LC5:
	.quad	-1087367646907149102
	.quad	-1087367646907149102
	.quad	-1087367646907149102
	.quad	-1087367646907149102
	.align 32
.LC6:
	.quad	-3329063056561552456
	.quad	-3329063056561552456
	.quad	-3329063056561552456
	.quad	-3329063056561552456
	.align 32
.LC7:
	.quad	-5426079245872290139
	.quad	-5426079245872290139
	.quad	-5426079245872290139
	.quad	-5426079245872290139
	.align 32
.LC8:
	.quad	-6657276164713376882
	.quad	-6657276164713376882
	.quad	-6657276164713376882
	.quad	-6657276164713376882
	.ident	"GCC: (GNU) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
