# Implementation of Shabal-256: amd64
#
# This code should run on any x86-compatible system running in 64-bit
# mode. It uses SSE2 opcodes (which are part of the amd64 architecture,
# aka '64-bit x86').
#
# This assembly file uses the GNU binutils syntax and follows the
# ELF call conventions. It was tested with GNU as 2.20.1 on a Linux
# system (Intel Core2 Q6600).
#
# -----------------------------------------------------------------------
# (c) 2010 SAPHIR project. This software is provided 'as-is', without
# any epxress or implied warranty. In no event will the authors be held
# liable for any damages arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to no restriction.
#
# Technical remarks and questions can be addressed to:
# <thomas.pornin@cryptolog.com>
# -----------------------------------------------------------------------

	.file   "shabal_amd64.s"
	.text

# Context structure layout:
#  offset    contents
#     0      buffer for final block (64 bytes)
#    64      'ptr' field (8 bytes)
#    72      A[] (48 bytes)
#   120      B[] (64 bytes)
#   184      C[] (64 bytes)
#   248      W (8 bytes)
#   256      out_size (4 bytes)
# Total size is 264 bytes, with a 8-byte alignment.
#
# The shabal_inner() function expects a pointer to A[0] and accesses
# the A[], B[], C[] and W fields. The pointer to A[0] MUST be 16-byte
# aligned. For optimal performance, it is best if B[0] is 64-byte
# aligned, i.e. address of A[0] is equal to 16 modulo 64 (this ensures
# that A[], B[] and C[] are each on a single L1 cache line, and those
# three cache lines are distinct from each other).
# From the shabal_inner() point of view:
#     0      A[] (48 bytes)
#    48      B[] (64 bytes)
#   112      C[] (64 bytes)
#   176      W (8 bytes)
# No specific alignment for the input data is required, but a 16-byte
# alignment is better.

# shabal_inner(stt, buf, num)
#    stt   pointer to context state (address of A[0], assumed 16-byte aligned)
#    buf   pointer to data (no specific alignment required)
#    num   number of 64-byte blocks in data (1 or more)
#
	.type   shabal_inner, @function
shabal_inner:
	pushq   %rbp

	# Conventions:
	#    %rbp   pointer to state words
	#    %rsi   pointer to current input data block (already set)
	#    %rdi   remaining data length (in blocks)
	movq    %rdi, %rbp
	movq    %rdx, %rdi

	# Reserve a 256-byte stack area for Bx[] (64-byte aligned).
	movq    %rsp, %rax
	subq    $8, %rsp
	andq    $0xFFFFFFFFFFFFFFC0, %rsp
	subq    $256, %rsp
	movq    %rax, 256(%rsp)        # Saved stack pointer.

	.align  8
Lm0:
	# Read the B words and M words, add, rotate, store in Bx[].
	# %rsp points to Bx[0]. The M words are stored in %xmm4:7;
	# since we try to be zero-copy, they may be unaligned, hence
	# the movdqu. We keep those xmm register values for quite some
	# time.

	movdqu  0(%rsi), %xmm4
	movdqu  16(%rsi), %xmm5
	movdqu  32(%rsi), %xmm6
	movdqu  48(%rsi), %xmm7

	movdqa  48(%rbp), %xmm0
	movdqa  64(%rbp), %xmm1
	paddd   %xmm4, %xmm0
	paddd   %xmm5, %xmm1
	movdqa  %xmm0, %xmm2
	movdqa  %xmm1, %xmm3
	psrld   $15, %xmm0
	psrld   $15, %xmm1
	pslld   $17, %xmm2
	pslld   $17, %xmm3
	por     %xmm2, %xmm0
	por     %xmm3, %xmm1
	movdqa  %xmm0, 0(%rsp)
	movdqa  %xmm1, 16(%rsp)

	movdqa  80(%rbp), %xmm0
	movdqa  96(%rbp), %xmm1
	paddd   %xmm6, %xmm0
	paddd   %xmm7, %xmm1
	movdqa  %xmm0, %xmm2
	movdqa  %xmm1, %xmm3
	psrld   $15, %xmm0
	psrld   $15, %xmm1
	pslld   $17, %xmm2
	pslld   $17, %xmm3
	por     %xmm2, %xmm0
	por     %xmm3, %xmm1
	movdqa  %xmm0, 32(%rsp)
	movdqa  %xmm1, 48(%rsp)

	# Xor W into A[0]/A[1]
	movq    176(%rbp), %rax
	xorq    %rax, 0(%rbp)

	# Conventions for the 48 rounds:
	#    %eax      previous A word, accumulator
	#    %rsp      points to Bx[0] (already set)
	#    %rbp      points to state words (already set)
	#    %xmm4:7   data block (already set)

	movl    44(%rbp), %eax

	# AUTO BEGIN

	# u = 0.
	roll    $15, %eax
	movl    24(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm4, %ecx
	xorl    0(%rbp), %eax
	notl    %edx
	xorl    52(%rsp), %ecx
	andl    36(%rsp), %edx
	xorl    144(%rbp), %eax
	xorl    %ecx, %edx
	movl    0(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%rbp)
	xorl    %eax, %ecx

	# u = 1.
	roll    $15, %eax
	movl    %ecx, 64(%rsp) # delayed
	pshufd  $1, %xmm4, %xmm0
	movl    28(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%rbp), %eax
	notl    %edx
	xorl    56(%rsp), %ecx
	andl    40(%rsp), %edx
	xorl    140(%rbp), %eax
	xorl    %ecx, %edx
	movl    4(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%rbp)
	xorl    %eax, %ecx

	# u = 2.
	roll    $15, %eax
	movl    %ecx, 68(%rsp) # delayed
	pshufd  $2, %xmm4, %xmm0
	movl    32(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%rbp), %eax
	notl    %edx
	xorl    60(%rsp), %ecx
	andl    44(%rsp), %edx
	xorl    136(%rbp), %eax
	xorl    %ecx, %edx
	movl    8(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%rbp)
	xorl    %eax, %ecx

	# u = 3.
	roll    $15, %eax
	movl    %ecx, 72(%rsp) # delayed
	pshufd  $3, %xmm4, %xmm0
	movl    36(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%rbp), %eax
	notl    %edx
	xorl    64(%rsp), %ecx
	andl    48(%rsp), %edx
	xorl    132(%rbp), %eax
	xorl    %ecx, %edx
	movl    12(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%rbp)
	xorl    %eax, %ecx

	# u = 4.
	roll    $15, %eax
	movl    %ecx, 76(%rsp) # delayed
	movl    40(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm5, %ecx
	xorl    16(%rbp), %eax
	notl    %edx
	xorl    68(%rsp), %ecx
	andl    52(%rsp), %edx
	xorl    128(%rbp), %eax
	xorl    %ecx, %edx
	movl    16(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%rbp)
	xorl    %eax, %ecx

	# u = 5.
	roll    $15, %eax
	movl    %ecx, 80(%rsp) # delayed
	pshufd  $1, %xmm5, %xmm0
	movl    44(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%rbp), %eax
	notl    %edx
	xorl    72(%rsp), %ecx
	andl    56(%rsp), %edx
	xorl    124(%rbp), %eax
	xorl    %ecx, %edx
	movl    20(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%rbp)
	xorl    %eax, %ecx

	# u = 6.
	roll    $15, %eax
	movl    %ecx, 84(%rsp) # delayed
	pshufd  $2, %xmm5, %xmm0
	movl    48(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%rbp), %eax
	notl    %edx
	xorl    76(%rsp), %ecx
	andl    60(%rsp), %edx
	xorl    120(%rbp), %eax
	xorl    %ecx, %edx
	movl    24(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%rbp)
	xorl    %eax, %ecx

	# u = 7.
	roll    $15, %eax
	movl    %ecx, 88(%rsp) # delayed
	pshufd  $3, %xmm5, %xmm0
	movl    52(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%rbp), %eax
	notl    %edx
	xorl    80(%rsp), %ecx
	andl    64(%rsp), %edx
	xorl    116(%rbp), %eax
	xorl    %ecx, %edx
	movl    28(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%rbp)
	xorl    %eax, %ecx

	# u = 8.
	roll    $15, %eax
	movl    %ecx, 92(%rsp) # delayed
	movl    56(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm6, %ecx
	xorl    32(%rbp), %eax
	notl    %edx
	xorl    84(%rsp), %ecx
	andl    68(%rsp), %edx
	xorl    112(%rbp), %eax
	xorl    %ecx, %edx
	movl    32(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%rbp)
	xorl    %eax, %ecx

	# u = 9.
	roll    $15, %eax
	movl    %ecx, 96(%rsp) # delayed
	pshufd  $1, %xmm6, %xmm0
	movl    60(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%rbp), %eax
	notl    %edx
	xorl    88(%rsp), %ecx
	andl    72(%rsp), %edx
	xorl    172(%rbp), %eax
	xorl    %ecx, %edx
	movl    36(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%rbp)
	xorl    %eax, %ecx

	# u = 10.
	roll    $15, %eax
	movl    %ecx, 100(%rsp) # delayed
	pshufd  $2, %xmm6, %xmm0
	movl    64(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%rbp), %eax
	notl    %edx
	xorl    92(%rsp), %ecx
	andl    76(%rsp), %edx
	xorl    168(%rbp), %eax
	xorl    %ecx, %edx
	movl    40(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%rbp)
	xorl    %eax, %ecx

	# u = 11.
	roll    $15, %eax
	movl    %ecx, 104(%rsp) # delayed
	pshufd  $3, %xmm6, %xmm0
	movl    68(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%rbp), %eax
	notl    %edx
	xorl    96(%rsp), %ecx
	andl    80(%rsp), %edx
	xorl    164(%rbp), %eax
	xorl    %ecx, %edx
	movl    44(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%rbp)
	xorl    %eax, %ecx

	# u = 12.
	roll    $15, %eax
	movl    %ecx, 108(%rsp) # delayed
	movl    72(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm7, %ecx
	xorl    0(%rbp), %eax
	notl    %edx
	xorl    100(%rsp), %ecx
	andl    84(%rsp), %edx
	xorl    160(%rbp), %eax
	xorl    %ecx, %edx
	movl    48(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%rbp)
	xorl    %eax, %ecx

	# u = 13.
	roll    $15, %eax
	movl    %ecx, 112(%rsp) # delayed
	pshufd  $1, %xmm7, %xmm0
	movl    76(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%rbp), %eax
	notl    %edx
	xorl    104(%rsp), %ecx
	andl    88(%rsp), %edx
	xorl    156(%rbp), %eax
	xorl    %ecx, %edx
	movl    52(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%rbp)
	xorl    %eax, %ecx

	# u = 14.
	roll    $15, %eax
	movl    %ecx, 116(%rsp) # delayed
	pshufd  $2, %xmm7, %xmm0
	movl    80(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%rbp), %eax
	notl    %edx
	xorl    108(%rsp), %ecx
	andl    92(%rsp), %edx
	xorl    152(%rbp), %eax
	xorl    %ecx, %edx
	movl    56(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%rbp)
	xorl    %eax, %ecx

	# u = 15.
	roll    $15, %eax
	movl    %ecx, 120(%rsp) # delayed
	pshufd  $3, %xmm7, %xmm0
	movl    84(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%rbp), %eax
	notl    %edx
	xorl    112(%rsp), %ecx
	andl    96(%rsp), %edx
	xorl    148(%rbp), %eax
	xorl    %ecx, %edx
	movl    60(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%rbp)
	xorl    %eax, %ecx

	# u = 16.
	roll    $15, %eax
	movl    %ecx, 124(%rsp) # delayed
	movl    88(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm4, %ecx
	xorl    16(%rbp), %eax
	notl    %edx
	xorl    116(%rsp), %ecx
	andl    100(%rsp), %edx
	xorl    144(%rbp), %eax
	xorl    %ecx, %edx
	movl    64(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%rbp)
	xorl    %eax, %ecx

	# u = 17.
	roll    $15, %eax
	movl    %ecx, 128(%rsp) # delayed
	pshufd  $1, %xmm4, %xmm0
	movl    92(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%rbp), %eax
	notl    %edx
	xorl    120(%rsp), %ecx
	andl    104(%rsp), %edx
	xorl    140(%rbp), %eax
	xorl    %ecx, %edx
	movl    68(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%rbp)
	xorl    %eax, %ecx

	# u = 18.
	roll    $15, %eax
	movl    %ecx, 132(%rsp) # delayed
	pshufd  $2, %xmm4, %xmm0
	movl    96(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%rbp), %eax
	notl    %edx
	xorl    124(%rsp), %ecx
	andl    108(%rsp), %edx
	xorl    136(%rbp), %eax
	xorl    %ecx, %edx
	movl    72(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%rbp)
	xorl    %eax, %ecx

	# u = 19.
	roll    $15, %eax
	movl    %ecx, 136(%rsp) # delayed
	pshufd  $3, %xmm4, %xmm0
	movl    100(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%rbp), %eax
	notl    %edx
	xorl    128(%rsp), %ecx
	andl    112(%rsp), %edx
	xorl    132(%rbp), %eax
	xorl    %ecx, %edx
	movl    76(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%rbp)
	xorl    %eax, %ecx

	# u = 20.
	roll    $15, %eax
	movl    %ecx, 140(%rsp) # delayed
	movl    104(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm5, %ecx
	xorl    32(%rbp), %eax
	notl    %edx
	xorl    132(%rsp), %ecx
	andl    116(%rsp), %edx
	xorl    128(%rbp), %eax
	xorl    %ecx, %edx
	movl    80(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%rbp)
	xorl    %eax, %ecx

	# u = 21.
	roll    $15, %eax
	movl    %ecx, 144(%rsp) # delayed
	pshufd  $1, %xmm5, %xmm0
	movl    108(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%rbp), %eax
	notl    %edx
	xorl    136(%rsp), %ecx
	andl    120(%rsp), %edx
	xorl    124(%rbp), %eax
	xorl    %ecx, %edx
	movl    84(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%rbp)
	xorl    %eax, %ecx

	# u = 22.
	roll    $15, %eax
	movl    %ecx, 148(%rsp) # delayed
	pshufd  $2, %xmm5, %xmm0
	movl    112(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%rbp), %eax
	notl    %edx
	xorl    140(%rsp), %ecx
	andl    124(%rsp), %edx
	xorl    120(%rbp), %eax
	xorl    %ecx, %edx
	movl    88(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%rbp)
	xorl    %eax, %ecx

	# u = 23.
	roll    $15, %eax
	movl    %ecx, 152(%rsp) # delayed
	pshufd  $3, %xmm5, %xmm0
	movl    116(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%rbp), %eax
	notl    %edx
	xorl    144(%rsp), %ecx
	andl    128(%rsp), %edx
	xorl    116(%rbp), %eax
	xorl    %ecx, %edx
	movl    92(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%rbp)
	xorl    %eax, %ecx

	# u = 24.
	roll    $15, %eax
	movl    %ecx, 156(%rsp) # delayed
	movl    120(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm6, %ecx
	xorl    0(%rbp), %eax
	notl    %edx
	xorl    148(%rsp), %ecx
	andl    132(%rsp), %edx
	xorl    112(%rbp), %eax
	xorl    %ecx, %edx
	movl    96(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%rbp)
	xorl    %eax, %ecx

	# u = 25.
	roll    $15, %eax
	movl    %ecx, 160(%rsp) # delayed
	pshufd  $1, %xmm6, %xmm0
	movl    124(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%rbp), %eax
	notl    %edx
	xorl    152(%rsp), %ecx
	andl    136(%rsp), %edx
	xorl    172(%rbp), %eax
	xorl    %ecx, %edx
	movl    100(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%rbp)
	xorl    %eax, %ecx

	# u = 26.
	roll    $15, %eax
	movl    %ecx, 164(%rsp) # delayed
	pshufd  $2, %xmm6, %xmm0
	movl    128(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%rbp), %eax
	notl    %edx
	xorl    156(%rsp), %ecx
	andl    140(%rsp), %edx
	xorl    168(%rbp), %eax
	xorl    %ecx, %edx
	movl    104(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%rbp)
	xorl    %eax, %ecx

	# u = 27.
	roll    $15, %eax
	movl    %ecx, 168(%rsp) # delayed
	pshufd  $3, %xmm6, %xmm0
	movl    132(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%rbp), %eax
	notl    %edx
	xorl    160(%rsp), %ecx
	andl    144(%rsp), %edx
	xorl    164(%rbp), %eax
	xorl    %ecx, %edx
	movl    108(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%rbp)
	xorl    %eax, %ecx

	# u = 28.
	roll    $15, %eax
	movl    %ecx, 172(%rsp) # delayed
	movl    136(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm7, %ecx
	xorl    16(%rbp), %eax
	notl    %edx
	xorl    164(%rsp), %ecx
	andl    148(%rsp), %edx
	xorl    160(%rbp), %eax
	xorl    %ecx, %edx
	movl    112(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%rbp)
	xorl    %eax, %ecx

	# u = 29.
	roll    $15, %eax
	movl    %ecx, 176(%rsp) # delayed
	pshufd  $1, %xmm7, %xmm0
	movl    140(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%rbp), %eax
	notl    %edx
	xorl    168(%rsp), %ecx
	andl    152(%rsp), %edx
	xorl    156(%rbp), %eax
	xorl    %ecx, %edx
	movl    116(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%rbp)
	xorl    %eax, %ecx

	# u = 30.
	roll    $15, %eax
	movl    %ecx, 180(%rsp) # delayed
	pshufd  $2, %xmm7, %xmm0
	movl    144(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%rbp), %eax
	notl    %edx
	xorl    172(%rsp), %ecx
	andl    156(%rsp), %edx
	xorl    152(%rbp), %eax
	xorl    %ecx, %edx
	movl    120(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%rbp)
	xorl    %eax, %ecx

	# u = 31.
	roll    $15, %eax
	movl    %ecx, 184(%rsp) # delayed
	pshufd  $3, %xmm7, %xmm0
	movl    148(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%rbp), %eax
	notl    %edx
	xorl    176(%rsp), %ecx
	andl    160(%rsp), %edx
	xorl    148(%rbp), %eax
	xorl    %ecx, %edx
	movl    124(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%rbp)
	xorl    %eax, %ecx

	# u = 32.
	roll    $15, %eax
	movl    %ecx, 188(%rsp) # delayed
	movl    152(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm4, %ecx
	xorl    32(%rbp), %eax
	notl    %edx
	xorl    180(%rsp), %ecx
	andl    164(%rsp), %edx
	xorl    144(%rbp), %eax
	xorl    %ecx, %edx
	movl    128(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%rbp)
	xorl    %eax, %ecx

	# u = 33.
	roll    $15, %eax
	movl    %ecx, 192(%rsp) # delayed
	pshufd  $1, %xmm4, %xmm0
	movl    156(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%rbp), %eax
	notl    %edx
	xorl    184(%rsp), %ecx
	andl    168(%rsp), %edx
	xorl    140(%rbp), %eax
	xorl    %ecx, %edx
	movl    132(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%rbp)
	xorl    %eax, %ecx

	# u = 34.
	roll    $15, %eax
	movl    %ecx, 196(%rsp) # delayed
	pshufd  $2, %xmm4, %xmm0
	movl    160(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%rbp), %eax
	notl    %edx
	xorl    188(%rsp), %ecx
	andl    172(%rsp), %edx
	xorl    136(%rbp), %eax
	xorl    %ecx, %edx
	movl    136(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%rbp)
	xorl    %eax, %ecx

	# u = 35.
	roll    $15, %eax
	movl    %ecx, 200(%rsp) # delayed
	pshufd  $3, %xmm4, %xmm0
	movl    164(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%rbp), %eax
	notl    %edx
	xorl    192(%rsp), %ecx
	andl    176(%rsp), %edx
	xorl    132(%rbp), %eax
	xorl    %ecx, %edx
	movl    140(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%rbp)
	xorl    %eax, %ecx

	# u = 36.
	roll    $15, %eax
	movl    %ecx, 204(%rsp) # delayed
	movl    168(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm5, %ecx
	xorl    0(%rbp), %eax
	notl    %edx
	xorl    196(%rsp), %ecx
	andl    180(%rsp), %edx
	xorl    128(%rbp), %eax
	xorl    %ecx, %edx
	movl    144(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%rbp)
	xorl    %eax, %ecx

	# u = 37.
	roll    $15, %eax
	movl    %ecx, 208(%rsp) # delayed
	pshufd  $1, %xmm5, %xmm0
	movl    172(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%rbp), %eax
	notl    %edx
	xorl    200(%rsp), %ecx
	andl    184(%rsp), %edx
	xorl    124(%rbp), %eax
	xorl    %ecx, %edx
	movl    148(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%rbp)
	xorl    %eax, %ecx

	# u = 38.
	roll    $15, %eax
	movl    %ecx, 212(%rsp) # delayed
	pshufd  $2, %xmm5, %xmm0
	movl    176(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%rbp), %eax
	notl    %edx
	xorl    204(%rsp), %ecx
	andl    188(%rsp), %edx
	xorl    120(%rbp), %eax
	xorl    %ecx, %edx
	movl    152(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%rbp)
	xorl    %eax, %ecx

	# u = 39.
	roll    $15, %eax
	movl    %ecx, 216(%rsp) # delayed
	pshufd  $3, %xmm5, %xmm0
	movl    180(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%rbp), %eax
	notl    %edx
	xorl    208(%rsp), %ecx
	andl    192(%rsp), %edx
	xorl    116(%rbp), %eax
	xorl    %ecx, %edx
	movl    156(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%rbp)
	xorl    %eax, %ecx

	# u = 40.
	roll    $15, %eax
	movl    %ecx, 220(%rsp) # delayed
	movl    184(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm6, %ecx
	xorl    16(%rbp), %eax
	notl    %edx
	xorl    212(%rsp), %ecx
	andl    196(%rsp), %edx
	xorl    112(%rbp), %eax
	xorl    %ecx, %edx
	movl    160(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%rbp)
	xorl    %eax, %ecx

	# u = 41.
	roll    $15, %eax
	movl    %ecx, 224(%rsp) # delayed
	pshufd  $1, %xmm6, %xmm0
	movl    188(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%rbp), %eax
	notl    %edx
	xorl    216(%rsp), %ecx
	andl    200(%rsp), %edx
	xorl    172(%rbp), %eax
	xorl    %ecx, %edx
	movl    164(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%rbp)
	xorl    %eax, %ecx

	# u = 42.
	roll    $15, %eax
	movl    %ecx, 228(%rsp) # delayed
	pshufd  $2, %xmm6, %xmm0
	movl    192(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%rbp), %eax
	notl    %edx
	xorl    220(%rsp), %ecx
	andl    204(%rsp), %edx
	xorl    168(%rbp), %eax
	xorl    %ecx, %edx
	movl    168(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%rbp)
	xorl    %eax, %ecx

	# u = 43.
	roll    $15, %eax
	movl    %ecx, 232(%rsp) # delayed
	pshufd  $3, %xmm6, %xmm0
	movl    196(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%rbp), %eax
	notl    %edx
	xorl    224(%rsp), %ecx
	andl    208(%rsp), %edx
	xorl    164(%rbp), %eax
	xorl    %ecx, %edx
	movl    172(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%rbp)
	xorl    %eax, %ecx

	# u = 44.
	roll    $15, %eax
	movl    %ecx, 236(%rsp) # delayed
	movl    200(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm7, %ecx
	xorl    32(%rbp), %eax
	notl    %edx
	xorl    228(%rsp), %ecx
	andl    212(%rsp), %edx
	xorl    160(%rbp), %eax
	xorl    %ecx, %edx
	movl    176(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%rbp)
	xorl    %eax, %ecx

	# u = 45.
	roll    $15, %eax
	movl    %ecx, 240(%rsp) # delayed
	pshufd  $1, %xmm7, %xmm0
	movl    204(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%rbp), %eax
	notl    %edx
	xorl    232(%rsp), %ecx
	andl    216(%rsp), %edx
	xorl    156(%rbp), %eax
	xorl    %ecx, %edx
	movl    180(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%rbp)
	xorl    %eax, %ecx

	# u = 46.
	roll    $15, %eax
	movl    %ecx, 244(%rsp) # delayed
	pshufd  $2, %xmm7, %xmm0
	movl    208(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%rbp), %eax
	notl    %edx
	xorl    236(%rsp), %ecx
	andl    220(%rsp), %edx
	xorl    152(%rbp), %eax
	xorl    %ecx, %edx
	movl    184(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%rbp)
	xorl    %eax, %ecx

	# u = 47.
	roll    $15, %eax
	movl    %ecx, 248(%rsp) # delayed
	pshufd  $3, %xmm7, %xmm0
	movl    212(%rsp), %edx
	leal    (%rax, %rax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%rbp), %eax
	notl    %edx
	xorl    240(%rsp), %ecx
	andl    224(%rsp), %edx
	xorl    148(%rbp), %eax
	xorl    %ecx, %edx
	movl    188(%rsp), %ecx
	leal    (%rax, %rax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%rbp)
	xorl    %eax, %ecx
	movl    %ecx, 252(%rsp)

	# AUTO END

	# Subtract M words from C words, and store in B.

	movdqa  112(%rbp), %xmm0       # Load C[0:3].
	movdqa  128(%rbp), %xmm1       # Load C[4:7].
	movdqa  144(%rbp), %xmm2       # Load C[8:11].
	movdqa  160(%rbp), %xmm3       # Load C[12:15].
	psubd   %xmm4, %xmm0           # Subtract M[0:3] from C[0:3].
	psubd   %xmm5, %xmm1           # Subtract M[4:7] from C[4:7].
	psubd   %xmm6, %xmm2           # Subtract M[8:11] from C[8:11].
	psubd   %xmm7, %xmm3           # Subtract M[12:15] from C[12:15].
	movdqa  %xmm0, 48(%rbp)        # Store new B[0:3].
	movdqa  %xmm1, 64(%rbp)        # Store new B[4:7].
	movdqa  %xmm2, 80(%rbp)        # Store new B[8:11].
	movdqa  %xmm3, 96(%rbp)        # Store new B[12:15].

	# Add C words to A words.

	movdqa  112(%rbp), %xmm0       # Load C[0:3].
	movdqu  124(%rbp), %xmm1       # Load C[3:6].
	movdqu  140(%rbp), %xmm2       # Load C[7:10].
	pslldq  $4, %xmm0              # Compute 0|C[0:2].
	movl    172(%rbp), %eax        # Load C[15].
	movdqu  156(%rbp), %xmm3       # Load C[11:14].
	movdqa  0(%rbp), %xmm4         # Load A[0:3].
	movd    %eax, %xmm7            # Put C[15] in xmm register.
	movdqa  16(%rbp), %xmm5        # Load A[4:7].
	movdqa  32(%rbp), %xmm6        # Load A[8:11].
	por     %xmm7, %xmm0           # Compute C[15]|C[0:2].

	paddd   %xmm1, %xmm5           # Add C[3:6] to A[4:7].
	paddd   %xmm3, %xmm1           # Add C[11:14] to C[3:6].
	paddd   %xmm2, %xmm5           # Add C[7:10] to A[4:7].
	paddd   %xmm2, %xmm6           # Add C[7:10] to A[8:11].
	paddd   %xmm1, %xmm4           # Add C[3:6]+C[11:14] to A[0:3].
	paddd   %xmm0, %xmm5           # Add C[15]|C[0:2] to A[4:7].
	paddd   %xmm1, %xmm6           # Add C[3:6]+C[11:14] to A[8:11].
	paddd   %xmm0, %xmm4           # Add C[15]|C[0:2] to A[0:3].

	movdqa  %xmm5, 16(%rbp)        # Store A[4:7].
	movdqa  %xmm6, 32(%rbp)        # Store A[8:11].
	movdqa  %xmm4, 0(%rbp)         # Store A[0:3].

	# Store new C words (from Bx[48:63]).

	movdqa  192(%rsp), %xmm0       # Load B[0:3] (from Bx[]).
	movdqa  208(%rsp), %xmm1       # Load B[4:7] (from Bx[]).
	movdqa  224(%rsp), %xmm2       # Load B[8:11] (from Bx[]).
	movdqa  240(%rsp), %xmm3       # Load B[12:15] (from Bx[]).
	movdqa  %xmm0, 112(%rbp)       # Store new C[0:3].
	movdqa  %xmm1, 128(%rbp)       # Store new C[4:7].
	movdqa  %xmm2, 144(%rbp)       # Store new C[8:11].
	movdqa  %xmm3, 160(%rbp)       # Store new C[12:15].

	# Increment W.
	incq    176(%rbp)

	# Update data pointer and decrement block counter; if not zero, loop.
	addq    $64, %rsi
	decq    %rdi
	jnz     Lm0

	# Remove the local variables, restore the registers and exit.
	movq    256(%rsp), %rax
	movq    %rax, %rsp
	popq    %rbp
	ret
	.size   shabal_inner, .-shabal_inner

	.align  8
iv256:
	.long   0x52F84552, 0xE54B7999, 0x2D8EE3EC, 0xB9645191
	.long   0xE0078B86, 0xBB7C44C9, 0xD2B5C1CA, 0xB0D2EB8C
	.long   0x14CE5A45, 0x22AF50DC, 0xEFFDBC6B, 0xEB21B74A
	.long   0xB555C6EE, 0x3E710596, 0xA72A652F, 0x9301515F
	.long   0xDA28C1FA, 0x696FD868, 0x9CB6BF72, 0x0AFE4002
	.long   0xA6E03615, 0x5138C1D4, 0xBE216306, 0xB38B8890
	.long   0x3EA8B96B, 0x3299ACE4, 0x30924DD4, 0x55CB34A5
	.long   0xB405F031, 0xC4233EBA, 0xB3733979, 0xC0DD9D55
	.long   0xC51C28AE, 0xA327B8E1, 0x56C56167, 0xED614433
	.long   0x88B59D60, 0x60E2CEBA, 0x758B4B8B, 0x83E82A7F
	.long   0xBC968828, 0xE6E00BF7, 0xBA839E55, 0x9B491C60
	.long   0x00000001, 0x00000000

# crypto_hash_shabal256_amd64(out, in, len)
#    out   output buffer
#    in    input data
#    len   input data length (in bytes, 64-bit value)
	.globl  crypto_hash_shabal256_amd64
	.type   crypto_hash_shabal256_amd64, @function
crypto_hash_shabal256_amd64:
	pushq   %rbp
	pushq   %rbx

	# Conventions:
	#    %edi   destination buffer (already set)
	#    %esi   data (already set)
	#    %edx   data length (already set)

	movq    %rsp, %rax
	subq    $148, %rsp
	andq    $0xFFFFFFFFFFFFFFC0, %rsp
	subq    $120, %rsp
	movq    %rax, 260(%rsp)

	# %rbp will point to the stack allocated structure.
	movq    %rsp, %rbp

	pushq   %rdi
	pushq   %rsi

	# Copy initial valule.
	call    Lz1
Lz1:
	popq    %rsi
	addq    $(iv256 - Lz1), %rsi
	leaq    72(%rbp), %rdi
	movl    $23, %ecx
	rep movsq

	# Hash full blocks.
	popq    %rsi
	movq    %rdx, %rax
	shrq    $6, %rax
	andl    $63, %edx
	pushq   %rdx
	movq    %rax, %rdx
	shlq    $6, %rdx
	addq    %rsi, %rdx
	pushq   %rdx

	testq   %rax, %rax
	jz      Lz2
	movq    %rax, %rdx
	leaq    72(%rbp), %rdi
	call    shabal_inner

Lz2:
	# Pad last block.
	popq    %rsi
	popq    %rcx
	movl    %ecx, %edx
	movq    %rbp, %rdi
	pushq   %rcx
	shrl    $3, %ecx
	repnz movsq
	popq    %rcx
	andl    $7, %ecx
	repnz movsb
	movb    $0x80, %al
	stosb
	xorl    %eax, %eax
	movl    $70, %ecx
	subl    %edx, %ecx
	shrl    $3, %ecx
	repnz stosq

	# Call inner function 4 times, cancelling the W increment.
	movl    $4, %ebx
Lz3:
	movl    $1, %edx
	movq    %rbp, %rsi
	leaq    72(%rbp), %rdi
	call    shabal_inner
	decq    248(%rbp)
	decl    %ebx
	jnz     Lz3

	# Copy result.
	popq    %rdi
	leaq    216(%rbp), %rsi
	movl    $4, %ecx
	rep movsq

	movq    260(%rsp), %rax
	movq    %rax, %rsp
	xorl    %eax, %eax
	popq    %rbx
	popq    %rbp
	ret
	.size   crypto_hash_shabal256_amd64, .-crypto_hash_shabal256_amd64
