# Implementation of Shabal-512: i386 with SSE2
#
# This code should run on any x86-compatible system which offers the
# SSE2 opcodes and runs in 32-bit mode.
#
# This assembly file uses the GNU binutils syntax and follows the
# ELF call conventions. It was tested with GNU as 2.20.1 on Linux
# systems (Intel Core2 Q6600 and VIA C7).
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

	.file   "shabal_i386sse2.s"
	.text

# Context structure layout:
#  offset    contents
#     0      buffer for final block (64 bytes)
#    64      'ptr' field (4 bytes)
#    68      A[] (48 bytes)
#   116      B[] (64 bytes)
#   180      C[] (64 bytes)
#   244      W (8 bytes)
#   252      out_size (4 bytes)
# Total size is 256 bytes, with a 4-byte alignment.
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
	pushl   %esi
	pushl   %ebp

	# Read parameters and reserve the 256-byte array for Bx[]. We
	# make sure that Bx[] is 64-byte aligned.
	#
	# Throughout the function, %ebp points to A[0], and %esi points
	# to the current data block.
	movl    12(%esp), %ebp
	movl    16(%esp), %esi
	movl    20(%esp), %ecx
	movl    %esp, %edx
	subl    $8, %esp
	andl    $0xFFFFFFC0, %esp
	subl    $256, %esp
	movl    %ecx, 260(%esp)        # Data block counter.
	movl    %edx, 256(%esp)        # Saved stack pointer.

	.align  8
Lm0:
	# Read the B words and M words, add, rotate, store in Bx[].
	# %esp points to Bx[0]. The M words are stored in %xmm4:7;
	# since we try to be zero-copy, they may be unaligned, hence
	# the movdqu. We keep those xmm register values for quite some
	# time.

	movdqu  0(%esi), %xmm4
	movdqu  16(%esi), %xmm5
	movdqu  32(%esi), %xmm6
	movdqu  48(%esi), %xmm7

	movdqa  48(%ebp), %xmm0
	movdqa  64(%ebp), %xmm1
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
	movdqa  %xmm0, 0(%esp)
	movdqa  %xmm1, 16(%esp)

	movdqa  80(%ebp), %xmm0
	movdqa  96(%ebp), %xmm1
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
	movdqa  %xmm0, 32(%esp)
	movdqa  %xmm1, 48(%esp)

	# Xor W into A[0]/A[1]
	movq    0(%ebp), %xmm2
	movq    176(%ebp), %xmm3
	pxor    %xmm2, %xmm3
	movq    %xmm3, 0(%ebp)

	# Conventions for the 48 rounds:
	#    %eax      previous A word, accumulator
	#    %esp      points to Bx[0] (already set)
	#    %ebp      points to state words (already set)
	#    %xmm4:7   data block (already set)

	movl    44(%ebp), %eax

	# AUTO BEGIN

	# u = 0.
	roll    $15, %eax
	movl    24(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm4, %ecx
	xorl    0(%ebp), %eax
	notl    %edx
	xorl    52(%esp), %ecx
	andl    36(%esp), %edx
	xorl    144(%ebp), %eax
	xorl    %ecx, %edx
	movl    0(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%ebp)
	xorl    %eax, %ecx

	# u = 1.
	roll    $15, %eax
	movl    %ecx, 64(%esp) # delayed
	pshufd  $1, %xmm4, %xmm0
	movl    28(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%ebp), %eax
	notl    %edx
	xorl    56(%esp), %ecx
	andl    40(%esp), %edx
	xorl    140(%ebp), %eax
	xorl    %ecx, %edx
	movl    4(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%ebp)
	xorl    %eax, %ecx

	# u = 2.
	roll    $15, %eax
	movl    %ecx, 68(%esp) # delayed
	pshufd  $2, %xmm4, %xmm0
	movl    32(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%ebp), %eax
	notl    %edx
	xorl    60(%esp), %ecx
	andl    44(%esp), %edx
	xorl    136(%ebp), %eax
	xorl    %ecx, %edx
	movl    8(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%ebp)
	xorl    %eax, %ecx

	# u = 3.
	roll    $15, %eax
	movl    %ecx, 72(%esp) # delayed
	pshufd  $3, %xmm4, %xmm0
	movl    36(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%ebp), %eax
	notl    %edx
	xorl    64(%esp), %ecx
	andl    48(%esp), %edx
	xorl    132(%ebp), %eax
	xorl    %ecx, %edx
	movl    12(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%ebp)
	xorl    %eax, %ecx

	# u = 4.
	roll    $15, %eax
	movl    %ecx, 76(%esp) # delayed
	movl    40(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm5, %ecx
	xorl    16(%ebp), %eax
	notl    %edx
	xorl    68(%esp), %ecx
	andl    52(%esp), %edx
	xorl    128(%ebp), %eax
	xorl    %ecx, %edx
	movl    16(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%ebp)
	xorl    %eax, %ecx

	# u = 5.
	roll    $15, %eax
	movl    %ecx, 80(%esp) # delayed
	pshufd  $1, %xmm5, %xmm0
	movl    44(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%ebp), %eax
	notl    %edx
	xorl    72(%esp), %ecx
	andl    56(%esp), %edx
	xorl    124(%ebp), %eax
	xorl    %ecx, %edx
	movl    20(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%ebp)
	xorl    %eax, %ecx

	# u = 6.
	roll    $15, %eax
	movl    %ecx, 84(%esp) # delayed
	pshufd  $2, %xmm5, %xmm0
	movl    48(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%ebp), %eax
	notl    %edx
	xorl    76(%esp), %ecx
	andl    60(%esp), %edx
	xorl    120(%ebp), %eax
	xorl    %ecx, %edx
	movl    24(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%ebp)
	xorl    %eax, %ecx

	# u = 7.
	roll    $15, %eax
	movl    %ecx, 88(%esp) # delayed
	pshufd  $3, %xmm5, %xmm0
	movl    52(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%ebp), %eax
	notl    %edx
	xorl    80(%esp), %ecx
	andl    64(%esp), %edx
	xorl    116(%ebp), %eax
	xorl    %ecx, %edx
	movl    28(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%ebp)
	xorl    %eax, %ecx

	# u = 8.
	roll    $15, %eax
	movl    %ecx, 92(%esp) # delayed
	movl    56(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm6, %ecx
	xorl    32(%ebp), %eax
	notl    %edx
	xorl    84(%esp), %ecx
	andl    68(%esp), %edx
	xorl    112(%ebp), %eax
	xorl    %ecx, %edx
	movl    32(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%ebp)
	xorl    %eax, %ecx

	# u = 9.
	roll    $15, %eax
	movl    %ecx, 96(%esp) # delayed
	pshufd  $1, %xmm6, %xmm0
	movl    60(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%ebp), %eax
	notl    %edx
	xorl    88(%esp), %ecx
	andl    72(%esp), %edx
	xorl    172(%ebp), %eax
	xorl    %ecx, %edx
	movl    36(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%ebp)
	xorl    %eax, %ecx

	# u = 10.
	roll    $15, %eax
	movl    %ecx, 100(%esp) # delayed
	pshufd  $2, %xmm6, %xmm0
	movl    64(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%ebp), %eax
	notl    %edx
	xorl    92(%esp), %ecx
	andl    76(%esp), %edx
	xorl    168(%ebp), %eax
	xorl    %ecx, %edx
	movl    40(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%ebp)
	xorl    %eax, %ecx

	# u = 11.
	roll    $15, %eax
	movl    %ecx, 104(%esp) # delayed
	pshufd  $3, %xmm6, %xmm0
	movl    68(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%ebp), %eax
	notl    %edx
	xorl    96(%esp), %ecx
	andl    80(%esp), %edx
	xorl    164(%ebp), %eax
	xorl    %ecx, %edx
	movl    44(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%ebp)
	xorl    %eax, %ecx

	# u = 12.
	roll    $15, %eax
	movl    %ecx, 108(%esp) # delayed
	movl    72(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm7, %ecx
	xorl    0(%ebp), %eax
	notl    %edx
	xorl    100(%esp), %ecx
	andl    84(%esp), %edx
	xorl    160(%ebp), %eax
	xorl    %ecx, %edx
	movl    48(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%ebp)
	xorl    %eax, %ecx

	# u = 13.
	roll    $15, %eax
	movl    %ecx, 112(%esp) # delayed
	pshufd  $1, %xmm7, %xmm0
	movl    76(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%ebp), %eax
	notl    %edx
	xorl    104(%esp), %ecx
	andl    88(%esp), %edx
	xorl    156(%ebp), %eax
	xorl    %ecx, %edx
	movl    52(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%ebp)
	xorl    %eax, %ecx

	# u = 14.
	roll    $15, %eax
	movl    %ecx, 116(%esp) # delayed
	pshufd  $2, %xmm7, %xmm0
	movl    80(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%ebp), %eax
	notl    %edx
	xorl    108(%esp), %ecx
	andl    92(%esp), %edx
	xorl    152(%ebp), %eax
	xorl    %ecx, %edx
	movl    56(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%ebp)
	xorl    %eax, %ecx

	# u = 15.
	roll    $15, %eax
	movl    %ecx, 120(%esp) # delayed
	pshufd  $3, %xmm7, %xmm0
	movl    84(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%ebp), %eax
	notl    %edx
	xorl    112(%esp), %ecx
	andl    96(%esp), %edx
	xorl    148(%ebp), %eax
	xorl    %ecx, %edx
	movl    60(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%ebp)
	xorl    %eax, %ecx

	# u = 16.
	roll    $15, %eax
	movl    %ecx, 124(%esp) # delayed
	movl    88(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm4, %ecx
	xorl    16(%ebp), %eax
	notl    %edx
	xorl    116(%esp), %ecx
	andl    100(%esp), %edx
	xorl    144(%ebp), %eax
	xorl    %ecx, %edx
	movl    64(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%ebp)
	xorl    %eax, %ecx

	# u = 17.
	roll    $15, %eax
	movl    %ecx, 128(%esp) # delayed
	pshufd  $1, %xmm4, %xmm0
	movl    92(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%ebp), %eax
	notl    %edx
	xorl    120(%esp), %ecx
	andl    104(%esp), %edx
	xorl    140(%ebp), %eax
	xorl    %ecx, %edx
	movl    68(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%ebp)
	xorl    %eax, %ecx

	# u = 18.
	roll    $15, %eax
	movl    %ecx, 132(%esp) # delayed
	pshufd  $2, %xmm4, %xmm0
	movl    96(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%ebp), %eax
	notl    %edx
	xorl    124(%esp), %ecx
	andl    108(%esp), %edx
	xorl    136(%ebp), %eax
	xorl    %ecx, %edx
	movl    72(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%ebp)
	xorl    %eax, %ecx

	# u = 19.
	roll    $15, %eax
	movl    %ecx, 136(%esp) # delayed
	pshufd  $3, %xmm4, %xmm0
	movl    100(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%ebp), %eax
	notl    %edx
	xorl    128(%esp), %ecx
	andl    112(%esp), %edx
	xorl    132(%ebp), %eax
	xorl    %ecx, %edx
	movl    76(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%ebp)
	xorl    %eax, %ecx

	# u = 20.
	roll    $15, %eax
	movl    %ecx, 140(%esp) # delayed
	movl    104(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm5, %ecx
	xorl    32(%ebp), %eax
	notl    %edx
	xorl    132(%esp), %ecx
	andl    116(%esp), %edx
	xorl    128(%ebp), %eax
	xorl    %ecx, %edx
	movl    80(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%ebp)
	xorl    %eax, %ecx

	# u = 21.
	roll    $15, %eax
	movl    %ecx, 144(%esp) # delayed
	pshufd  $1, %xmm5, %xmm0
	movl    108(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%ebp), %eax
	notl    %edx
	xorl    136(%esp), %ecx
	andl    120(%esp), %edx
	xorl    124(%ebp), %eax
	xorl    %ecx, %edx
	movl    84(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%ebp)
	xorl    %eax, %ecx

	# u = 22.
	roll    $15, %eax
	movl    %ecx, 148(%esp) # delayed
	pshufd  $2, %xmm5, %xmm0
	movl    112(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%ebp), %eax
	notl    %edx
	xorl    140(%esp), %ecx
	andl    124(%esp), %edx
	xorl    120(%ebp), %eax
	xorl    %ecx, %edx
	movl    88(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%ebp)
	xorl    %eax, %ecx

	# u = 23.
	roll    $15, %eax
	movl    %ecx, 152(%esp) # delayed
	pshufd  $3, %xmm5, %xmm0
	movl    116(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%ebp), %eax
	notl    %edx
	xorl    144(%esp), %ecx
	andl    128(%esp), %edx
	xorl    116(%ebp), %eax
	xorl    %ecx, %edx
	movl    92(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%ebp)
	xorl    %eax, %ecx

	# u = 24.
	roll    $15, %eax
	movl    %ecx, 156(%esp) # delayed
	movl    120(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm6, %ecx
	xorl    0(%ebp), %eax
	notl    %edx
	xorl    148(%esp), %ecx
	andl    132(%esp), %edx
	xorl    112(%ebp), %eax
	xorl    %ecx, %edx
	movl    96(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%ebp)
	xorl    %eax, %ecx

	# u = 25.
	roll    $15, %eax
	movl    %ecx, 160(%esp) # delayed
	pshufd  $1, %xmm6, %xmm0
	movl    124(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%ebp), %eax
	notl    %edx
	xorl    152(%esp), %ecx
	andl    136(%esp), %edx
	xorl    172(%ebp), %eax
	xorl    %ecx, %edx
	movl    100(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%ebp)
	xorl    %eax, %ecx

	# u = 26.
	roll    $15, %eax
	movl    %ecx, 164(%esp) # delayed
	pshufd  $2, %xmm6, %xmm0
	movl    128(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%ebp), %eax
	notl    %edx
	xorl    156(%esp), %ecx
	andl    140(%esp), %edx
	xorl    168(%ebp), %eax
	xorl    %ecx, %edx
	movl    104(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%ebp)
	xorl    %eax, %ecx

	# u = 27.
	roll    $15, %eax
	movl    %ecx, 168(%esp) # delayed
	pshufd  $3, %xmm6, %xmm0
	movl    132(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%ebp), %eax
	notl    %edx
	xorl    160(%esp), %ecx
	andl    144(%esp), %edx
	xorl    164(%ebp), %eax
	xorl    %ecx, %edx
	movl    108(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%ebp)
	xorl    %eax, %ecx

	# u = 28.
	roll    $15, %eax
	movl    %ecx, 172(%esp) # delayed
	movl    136(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm7, %ecx
	xorl    16(%ebp), %eax
	notl    %edx
	xorl    164(%esp), %ecx
	andl    148(%esp), %edx
	xorl    160(%ebp), %eax
	xorl    %ecx, %edx
	movl    112(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%ebp)
	xorl    %eax, %ecx

	# u = 29.
	roll    $15, %eax
	movl    %ecx, 176(%esp) # delayed
	pshufd  $1, %xmm7, %xmm0
	movl    140(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%ebp), %eax
	notl    %edx
	xorl    168(%esp), %ecx
	andl    152(%esp), %edx
	xorl    156(%ebp), %eax
	xorl    %ecx, %edx
	movl    116(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%ebp)
	xorl    %eax, %ecx

	# u = 30.
	roll    $15, %eax
	movl    %ecx, 180(%esp) # delayed
	pshufd  $2, %xmm7, %xmm0
	movl    144(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%ebp), %eax
	notl    %edx
	xorl    172(%esp), %ecx
	andl    156(%esp), %edx
	xorl    152(%ebp), %eax
	xorl    %ecx, %edx
	movl    120(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%ebp)
	xorl    %eax, %ecx

	# u = 31.
	roll    $15, %eax
	movl    %ecx, 184(%esp) # delayed
	pshufd  $3, %xmm7, %xmm0
	movl    148(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%ebp), %eax
	notl    %edx
	xorl    176(%esp), %ecx
	andl    160(%esp), %edx
	xorl    148(%ebp), %eax
	xorl    %ecx, %edx
	movl    124(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%ebp)
	xorl    %eax, %ecx

	# u = 32.
	roll    $15, %eax
	movl    %ecx, 188(%esp) # delayed
	movl    152(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm4, %ecx
	xorl    32(%ebp), %eax
	notl    %edx
	xorl    180(%esp), %ecx
	andl    164(%esp), %edx
	xorl    144(%ebp), %eax
	xorl    %ecx, %edx
	movl    128(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%ebp)
	xorl    %eax, %ecx

	# u = 33.
	roll    $15, %eax
	movl    %ecx, 192(%esp) # delayed
	pshufd  $1, %xmm4, %xmm0
	movl    156(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%ebp), %eax
	notl    %edx
	xorl    184(%esp), %ecx
	andl    168(%esp), %edx
	xorl    140(%ebp), %eax
	xorl    %ecx, %edx
	movl    132(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%ebp)
	xorl    %eax, %ecx

	# u = 34.
	roll    $15, %eax
	movl    %ecx, 196(%esp) # delayed
	pshufd  $2, %xmm4, %xmm0
	movl    160(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%ebp), %eax
	notl    %edx
	xorl    188(%esp), %ecx
	andl    172(%esp), %edx
	xorl    136(%ebp), %eax
	xorl    %ecx, %edx
	movl    136(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%ebp)
	xorl    %eax, %ecx

	# u = 35.
	roll    $15, %eax
	movl    %ecx, 200(%esp) # delayed
	pshufd  $3, %xmm4, %xmm0
	movl    164(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%ebp), %eax
	notl    %edx
	xorl    192(%esp), %ecx
	andl    176(%esp), %edx
	xorl    132(%ebp), %eax
	xorl    %ecx, %edx
	movl    140(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%ebp)
	xorl    %eax, %ecx

	# u = 36.
	roll    $15, %eax
	movl    %ecx, 204(%esp) # delayed
	movl    168(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm5, %ecx
	xorl    0(%ebp), %eax
	notl    %edx
	xorl    196(%esp), %ecx
	andl    180(%esp), %edx
	xorl    128(%ebp), %eax
	xorl    %ecx, %edx
	movl    144(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 0(%ebp)
	xorl    %eax, %ecx

	# u = 37.
	roll    $15, %eax
	movl    %ecx, 208(%esp) # delayed
	pshufd  $1, %xmm5, %xmm0
	movl    172(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    4(%ebp), %eax
	notl    %edx
	xorl    200(%esp), %ecx
	andl    184(%esp), %edx
	xorl    124(%ebp), %eax
	xorl    %ecx, %edx
	movl    148(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 4(%ebp)
	xorl    %eax, %ecx

	# u = 38.
	roll    $15, %eax
	movl    %ecx, 212(%esp) # delayed
	pshufd  $2, %xmm5, %xmm0
	movl    176(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    8(%ebp), %eax
	notl    %edx
	xorl    204(%esp), %ecx
	andl    188(%esp), %edx
	xorl    120(%ebp), %eax
	xorl    %ecx, %edx
	movl    152(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 8(%ebp)
	xorl    %eax, %ecx

	# u = 39.
	roll    $15, %eax
	movl    %ecx, 216(%esp) # delayed
	pshufd  $3, %xmm5, %xmm0
	movl    180(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    12(%ebp), %eax
	notl    %edx
	xorl    208(%esp), %ecx
	andl    192(%esp), %edx
	xorl    116(%ebp), %eax
	xorl    %ecx, %edx
	movl    156(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 12(%ebp)
	xorl    %eax, %ecx

	# u = 40.
	roll    $15, %eax
	movl    %ecx, 220(%esp) # delayed
	movl    184(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm6, %ecx
	xorl    16(%ebp), %eax
	notl    %edx
	xorl    212(%esp), %ecx
	andl    196(%esp), %edx
	xorl    112(%ebp), %eax
	xorl    %ecx, %edx
	movl    160(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 16(%ebp)
	xorl    %eax, %ecx

	# u = 41.
	roll    $15, %eax
	movl    %ecx, 224(%esp) # delayed
	pshufd  $1, %xmm6, %xmm0
	movl    188(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    20(%ebp), %eax
	notl    %edx
	xorl    216(%esp), %ecx
	andl    200(%esp), %edx
	xorl    172(%ebp), %eax
	xorl    %ecx, %edx
	movl    164(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 20(%ebp)
	xorl    %eax, %ecx

	# u = 42.
	roll    $15, %eax
	movl    %ecx, 228(%esp) # delayed
	pshufd  $2, %xmm6, %xmm0
	movl    192(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    24(%ebp), %eax
	notl    %edx
	xorl    220(%esp), %ecx
	andl    204(%esp), %edx
	xorl    168(%ebp), %eax
	xorl    %ecx, %edx
	movl    168(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 24(%ebp)
	xorl    %eax, %ecx

	# u = 43.
	roll    $15, %eax
	movl    %ecx, 232(%esp) # delayed
	pshufd  $3, %xmm6, %xmm0
	movl    196(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    28(%ebp), %eax
	notl    %edx
	xorl    224(%esp), %ecx
	andl    208(%esp), %edx
	xorl    164(%ebp), %eax
	xorl    %ecx, %edx
	movl    172(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 28(%ebp)
	xorl    %eax, %ecx

	# u = 44.
	roll    $15, %eax
	movl    %ecx, 236(%esp) # delayed
	movl    200(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm7, %ecx
	xorl    32(%ebp), %eax
	notl    %edx
	xorl    228(%esp), %ecx
	andl    212(%esp), %edx
	xorl    160(%ebp), %eax
	xorl    %ecx, %edx
	movl    176(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 32(%ebp)
	xorl    %eax, %ecx

	# u = 45.
	roll    $15, %eax
	movl    %ecx, 240(%esp) # delayed
	pshufd  $1, %xmm7, %xmm0
	movl    204(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    36(%ebp), %eax
	notl    %edx
	xorl    232(%esp), %ecx
	andl    216(%esp), %edx
	xorl    156(%ebp), %eax
	xorl    %ecx, %edx
	movl    180(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 36(%ebp)
	xorl    %eax, %ecx

	# u = 46.
	roll    $15, %eax
	movl    %ecx, 244(%esp) # delayed
	pshufd  $2, %xmm7, %xmm0
	movl    208(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    40(%ebp), %eax
	notl    %edx
	xorl    236(%esp), %ecx
	andl    220(%esp), %edx
	xorl    152(%ebp), %eax
	xorl    %ecx, %edx
	movl    184(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 40(%ebp)
	xorl    %eax, %ecx

	# u = 47.
	roll    $15, %eax
	movl    %ecx, 248(%esp) # delayed
	pshufd  $3, %xmm7, %xmm0
	movl    212(%esp), %edx
	leal    (%eax, %eax, 4), %eax
	movd    %xmm0, %ecx
	xorl    44(%ebp), %eax
	notl    %edx
	xorl    240(%esp), %ecx
	andl    224(%esp), %edx
	xorl    148(%ebp), %eax
	xorl    %ecx, %edx
	movl    188(%esp), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %edx, %eax
	roll    $1, %ecx
	movl    %eax, 44(%ebp)
	xorl    %eax, %ecx
	movl    %ecx, 252(%esp)

	# AUTO END

	# Subtract M words from C words, and store in B.

	movdqa  112(%ebp), %xmm0       # Load C[0:3].
	movdqa  128(%ebp), %xmm1       # Load C[4:7].
	movdqa  144(%ebp), %xmm2       # Load C[8:11].
	movdqa  160(%ebp), %xmm3       # Load C[12:15].
	psubd   %xmm4, %xmm0           # Subtract M[0:3] from C[0:3].
	psubd   %xmm5, %xmm1           # Subtract M[4:7] from C[4:7].
	psubd   %xmm6, %xmm2           # Subtract M[8:11] from C[8:11].
	psubd   %xmm7, %xmm3           # Subtract M[12:15] from C[12:15].
	movdqa  %xmm0, 48(%ebp)        # Store new B[0:3].
	movdqa  %xmm1, 64(%ebp)        # Store new B[4:7].
	movdqa  %xmm2, 80(%ebp)        # Store new B[8:11].
	movdqa  %xmm3, 96(%ebp)        # Store new B[12:15].

	# Add C words to A words.

	movdqa  112(%ebp), %xmm0       # Load C[0:3].
	movdqu  124(%ebp), %xmm1       # Load C[3:6].
	movdqu  140(%ebp), %xmm2       # Load C[7:10].
	pslldq  $4, %xmm0              # Compute 0|C[0:2].
	movl    172(%ebp), %eax        # Load C[15].
	movdqu  156(%ebp), %xmm3       # Load C[11:14].
	movdqa  0(%ebp), %xmm4         # Load A[0:3].
	movd    %eax, %xmm7            # Put C[15] in xmm register.
	movdqa  16(%ebp), %xmm5        # Load A[4:7].
	movdqa  32(%ebp), %xmm6        # Load A[8:11].
	por     %xmm7, %xmm0           # Compute C[15]|C[0:2].

	paddd   %xmm1, %xmm5           # Add C[3:6] to A[4:7].
	paddd   %xmm3, %xmm1           # Add C[11:14] to C[3:6].
	paddd   %xmm2, %xmm5           # Add C[7:10] to A[4:7].
	paddd   %xmm2, %xmm6           # Add C[7:10] to A[8:11].
	paddd   %xmm1, %xmm4           # Add C[3:6]+C[11:14] to A[0:3].
	paddd   %xmm0, %xmm5           # Add C[15]|C[0:2] to A[4:7].
	paddd   %xmm1, %xmm6           # Add C[3:6]+C[11:14] to A[8:11].
	paddd   %xmm0, %xmm4           # Add C[15]|C[0:2] to A[0:3].

	movdqa  %xmm5, 16(%ebp)        # Store A[4:7].
	movdqa  %xmm6, 32(%ebp)        # Store A[8:11].
	movdqa  %xmm4, 0(%ebp)         # Store A[0:3].

	# Store new C words (from Bx[48:63]).

	movdqa  192(%esp), %xmm0       # Load B[0:3] (from Bx[]).
	movdqa  208(%esp), %xmm1       # Load B[4:7] (from Bx[]).
	movdqa  224(%esp), %xmm2       # Load B[8:11] (from Bx[]).
	movdqa  240(%esp), %xmm3       # Load B[12:15] (from Bx[]).
	movdqa  %xmm0, 112(%ebp)       # Store new C[0:3].
	movdqa  %xmm1, 128(%ebp)       # Store new C[4:7].
	movdqa  %xmm2, 144(%ebp)       # Store new C[8:11].
	movdqa  %xmm3, 160(%ebp)       # Store new C[12:15].

	# Increment W.
	addl    $1, 176(%ebp)
	adcl    $0, 180(%ebp)

	# Update data pointer and decrement block counter; if not zero, loop.
	addl    $64, %esi
	decl    260(%esp)
	jnz     Lm0

	# Remove the local variables, restore the registers and exit.
	movl    256(%esp), %eax
	movl    %eax, %esp
	popl    %ebp
	popl    %esi
	ret
	.size   shabal_inner, .-shabal_inner

	.align  8
iv512:
	.long   0x20728DFD, 0x46C0BD53, 0xE782B699, 0x55304632
	.long   0x71B4EF90, 0x0EA9E82C, 0xDBB930F1, 0xFAD06B8B
	.long   0xBE0CAE40, 0x8BD14410, 0x76D2ADAC, 0x28ACAB7F
	.long   0xC1099CB7, 0x07B385F3, 0xE7442C26, 0xCC8AD640
	.long   0xEB6F56C7, 0x1EA81AA9, 0x73B9D314, 0x1DE85D08
	.long   0x48910A5A, 0x893B22DB, 0xC5A0DF44, 0xBBC4324E
	.long   0x72D2F240, 0x75941D99, 0x6D8BDE82, 0xA1A7502B
	.long   0xD9BF68D1, 0x58BAD750, 0x56028CB2, 0x8134F359
	.long   0xB5D469D8, 0x941A8CC2, 0x418B2A6E, 0x04052780
	.long   0x7F07D787, 0x5194358F, 0x3C60D665, 0xBE97D79A
	.long   0x950C3434, 0xAED9A06D, 0x2537DC8D, 0x7CDB5969
	.long   0x00000001, 0x00000000

# crypto_hash_shabal512_i386sse2(out, in, len)
#    out   output buffer
#    in    input data
#    len   input data length (in bytes, 64-bit value)
	.globl  crypto_hash_shabal512_i386sse2
	.type   crypto_hash_shabal512_i386sse2, @function
crypto_hash_shabal512_i386sse2:
	pushl   %ebp
	pushl   %esi
	pushl   %edi

	# Conventions:
	#    %edi   destination buffer
	#    %esi   data
	#    %edx   data length
	movl    16(%esp), %edi
	movl    20(%esp), %esi
	movl    24(%esp), %edx

	movl    %esp, %eax
	subl    $144, %esp
	andl    $0xFFFFFFC0, %esp
	subl    $116, %esp
	movl    %eax, 256(%esp)

	# %ebp will point to the stack allocated structure.
	movl    %esp, %ebp

	pushl   %edi
	pushl   %esi

	# Copy initial valule.
	call    Lz1
Lz1:
	popl    %esi
	addl    $(iv512 - Lz1), %esi
	leal    68(%ebp), %edi
	movl    $46, %ecx
	rep movsl

	# Hash full blocks.
	popl    %esi
	movl    %edx, %eax
	shrl    $6, %eax
	andl    $63, %edx
	pushl   %edx
	movl    %eax, %edx
	shll    $6, %edx
	addl    %esi, %edx
	pushl   %edx

	testl   %eax, %eax
	jz      Lz2
	pushl   %eax
	pushl   %esi
	leal    68(%ebp), %eax
	pushl   %eax
	call    shabal_inner
	addl    $12, %esp

Lz2:
	# Pad last block.
	popl    %esi
	popl    %ecx
	movl    %ecx, %edx
	movl    %ebp, %edi
	pushl   %ecx
	shrl    $2, %ecx
	repnz movsl
	popl    %ecx
	andl    $3, %ecx
	repnz movsb
	movb    $0x80, %al
	stosb
	xorl    %eax, %eax
	movl    $66, %ecx
	subl    %edx, %ecx
	shrl    $2, %ecx
	repnz stosl

	# Call inner function 4 times, cancelling the W increment.
	movl    $4, %edi
Lz3:
	pushl   $1
	pushl   %ebp
	leal    68(%ebp), %eax
	pushl   %eax
	call    shabal_inner
	addl    $12, %esp
	subl    $1, 244(%ebp)
	sbbl    $0, 248(%ebp)
	decl    %edi
	jnz     Lz3

	# Copy result.
	popl    %edi
	leal    180(%ebp), %esi
	movl    $16, %ecx
	rep movsl

	movl    256(%esp), %eax
	movl    %eax, %esp
	xorl    %eax, %eax
	popl    %edi
	popl    %esi
	popl    %ebp
	ret
	.size   crypto_hash_shabal512_i386sse2, .-crypto_hash_shabal512_i386sse2
