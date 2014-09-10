.align 5
.data
_rijndael256_mask:
.byte 0x0, 0x1, 0x6, 0x7
.byte 0x4, 0x5, 0xa, 0xb
.byte 0x8, 0x9, 0xe, 0xf
.byte 0xc, 0xd, 0x2, 0x3

_sel2:
.byte 0, 0xff, 0xff, 0xff
.byte 0,    0, 0xff, 0xff
.byte 0,    0, 0xff, 0xff
.byte 0,    0,    0, 0xff

.align 5
.text
.global _Rijndael_k32b32_encrypt_x4
_Rijndael_k32b32_encrypt_x4:
	vzeroupper
	movq	%rdi, %r10
	movq	%rsi, %r11
	vmovdqu	0x00(%rdi), %xmm1
	vmovdqu	0x10(%rdi), %xmm0
	vpxor	0x00(%rdx), %xmm1, %xmm2
	vpxor	0x10(%rdx), %xmm0, %xmm3
	vpxor	0x20(%rdx), %xmm1, %xmm4
	vpxor	0x30(%rdx), %xmm0, %xmm5
	vpxor	0x40(%rdx), %xmm1, %xmm6
	vpxor	0x50(%rdx), %xmm0, %xmm7
	vpxor	0x60(%rdx), %xmm1, %xmm8
	vpxor	0x70(%rdx), %xmm0, %xmm9
	movq	$0x1, %r8
	movq	%r10, %rdi

	.align 4
	Rijndael_k32b32_encrypt_x4._rounds:
	  addq	$0x20, %rdi
	  vpxor	%xmm3, %xmm2, %xmm0
	  vpand	_sel2(%rip), %xmm0, %xmm0
	  vpxor	%xmm0, %xmm2, %xmm2
	  vpxor	%xmm0, %xmm3, %xmm3
	  vpshufb	_rijndael256_mask(%rip), %xmm3, %xmm3
	  vpshufb	_rijndael256_mask(%rip), %xmm2, %xmm2
	  vaesenc	0x10(%rdi), %xmm3, %xmm3
	  vaesenc	0x00(%rdi), %xmm2, %xmm2
	  vpxor	%xmm5, %xmm4, %xmm0
	  vpand	_sel2(%rip), %xmm0, %xmm0
	  vpxor	%xmm0, %xmm4, %xmm4
	  vpxor	%xmm0, %xmm5, %xmm5
	  vpshufb	_rijndael256_mask(%rip), %xmm5, %xmm5
	  vpshufb	_rijndael256_mask(%rip), %xmm4, %xmm4
	  vaesenc	0x10(%rdi), %xmm5, %xmm5
	  vaesenc	0x00(%rdi), %xmm4, %xmm4
	  vpxor	%xmm7, %xmm6, %xmm0
	  vpand	_sel2(%rip), %xmm0, %xmm0
	  vpxor	%xmm0, %xmm6, %xmm6
	  vpxor	%xmm0, %xmm7, %xmm7
	  vpshufb	_rijndael256_mask(%rip), %xmm7, %xmm7
	  vpshufb	_rijndael256_mask(%rip), %xmm6, %xmm6
	  vaesenc	0x10(%rdi), %xmm7, %xmm7
	  vaesenc	0x00(%rdi), %xmm6, %xmm6
	  vpxor	%xmm9, %xmm8, %xmm0
	  vpand	_sel2(%rip), %xmm0, %xmm0
	  vpxor	%xmm0, %xmm8, %xmm8
	  vpxor	%xmm0, %xmm9, %xmm9
	  vpshufb	_rijndael256_mask(%rip), %xmm9, %xmm9
	  vpshufb	_rijndael256_mask(%rip), %xmm8, %xmm8
	  vaesenc	0x10(%rdi), %xmm9, %xmm9
	  vaesenc	0x00(%rdi), %xmm8, %xmm8
	incq	%r8
	cmpq	$0xe, %r8
	jne	Rijndael_k32b32_encrypt_x4._rounds
	vpxor	%xmm3, %xmm2, %xmm0
	vpand	_sel2(%rip), %xmm0, %xmm0
	vpxor	%xmm0, %xmm2, %xmm2
	vpxor	%xmm0, %xmm3, %xmm3
	vpshufb	_rijndael256_mask(%rip), %xmm3, %xmm3
	vpshufb	_rijndael256_mask(%rip), %xmm2, %xmm2
	vaesenclast	0x1d0(%r10), %xmm3, %xmm3
	vaesenclast	0x1c0(%r10), %xmm2, %xmm2
	movdqu	%xmm3, 0x10(%rsi)
	movdqu	%xmm2, 0x00(%rsi)
	vpxor	%xmm5, %xmm4, %xmm0
	vpand	_sel2(%rip), %xmm0, %xmm0
	vpxor	%xmm0, %xmm4, %xmm4
	vpxor	%xmm0, %xmm5, %xmm5
	vpshufb	_rijndael256_mask(%rip), %xmm5, %xmm5
	vpshufb	_rijndael256_mask(%rip), %xmm4, %xmm4
	vaesenclast	0x1d0(%r10), %xmm5, %xmm5
	vaesenclast	0x1c0(%r10), %xmm4, %xmm4
	movdqu	%xmm5, 0x30(%rsi)
	movdqu	%xmm4, 0x20(%rsi)
	vpxor	%xmm7, %xmm6, %xmm0
	vpand	_sel2(%rip), %xmm0, %xmm0
	vpxor	%xmm0, %xmm6, %xmm6
	vpxor	%xmm0, %xmm7, %xmm7
	vpshufb	_rijndael256_mask(%rip), %xmm7, %xmm7
	vpshufb	_rijndael256_mask(%rip), %xmm6, %xmm6
	vaesenclast	0x1d0(%r10), %xmm7, %xmm7
	vaesenclast	0x1c0(%r10), %xmm6, %xmm6
	movdqu	%xmm7, 0x50(%rsi)
	movdqu	%xmm6, 0x40(%rsi)
	vpxor	%xmm9, %xmm8, %xmm0
	vpand	_sel2(%rip), %xmm0, %xmm0
	vpxor	%xmm0, %xmm8, %xmm8
	vpxor	%xmm0, %xmm9, %xmm9
	vpshufb	_rijndael256_mask(%rip), %xmm9, %xmm9
	vpshufb	_rijndael256_mask(%rip), %xmm8, %xmm8
	vaesenclast	0x1d0(%r10), %xmm9, %xmm9
	vaesenclast	0x1c0(%r10), %xmm8, %xmm8
	movdqu	%xmm9, 0x70(%rsi)
	movdqu	%xmm8, 0x60(%rsi)

	vzeroall
	ret
