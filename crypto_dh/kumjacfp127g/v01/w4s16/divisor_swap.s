// Huseyin Hisil, 2014.

.text

.globl kum_fp_swap_2e127m1_g_ym_x8664_asm
kum_fp_swap_2e127m1_g_ym_x8664_asm:
	movq 8*8(%rdi), %r10
	movq 8*9(%rdi), %r11
	xorq 8*16(%rdi), %r10
	xorq 8*17(%rdi), %r11
	andq %rsi, %r10
	andq %rsi, %r11
	xorq %r10, 8*8(%rdi)
	xorq %r11, 8*9(%rdi)
	xorq %r10, 8*16(%rdi)
	xorq %r11, 8*17(%rdi)

	movq 8*10(%rdi), %r10
	movq 8*11(%rdi), %r11
	xorq 8*18(%rdi), %r10
	xorq 8*19(%rdi), %r11
	andq %rsi, %r10
	andq %rsi, %r11
	xorq %r10, 8*10(%rdi)
	xorq %r11, 8*11(%rdi)
	xorq %r10, 8*18(%rdi)
	xorq %r11, 8*19(%rdi)

	movq 8*12(%rdi), %r10
	movq 8*13(%rdi), %r11
	xorq 8*20(%rdi), %r10
	xorq 8*21(%rdi), %r11
	andq %rsi, %r10
	andq %rsi, %r11
	xorq %r10, 8*12(%rdi)
	xorq %r11, 8*13(%rdi)
	xorq %r10, 8*20(%rdi)
	xorq %r11, 8*21(%rdi)

	movq 8*14(%rdi), %r10
	movq 8*15(%rdi), %r11
	xorq 8*22(%rdi), %r10
	xorq 8*23(%rdi), %r11
	andq %rsi, %r10
	andq %rsi, %r11
	xorq %r10, 8*14(%rdi)
	xorq %r11, 8*15(%rdi)
	xorq %r10, 8*22(%rdi)
	xorq %r11, 8*23(%rdi)
ret
