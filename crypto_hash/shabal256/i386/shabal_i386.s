# Implementation of Shabal-256: i386
#
# This code should run on any x86-compatible system which runs in
# 32-bit mode (including the original Intel 80386).
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

	.file   "shabal_i386.s"
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

# shabal_inner(sc, buf, num)
#    sc    pointer to context structure
#    buf   pointer to data
#    num   number of 64-byte blocks in data (1 or more)
#
	.type   shabal_inner, @function
shabal_inner:
	pushl   %ebx
	pushl   %edi
	pushl   %esi
	pushl   %ebp
	subl    $256, %esp

	# %ebp will point to the context structure throughout the function.
	movl    276(%esp), %ebp

	# %esi points to the current data block.
	movl    280(%esp), %esi

Lm0:
	# Read the B words and M words, add, rotate, store in Bx[].
	# %esp points to Bx[0].

	movl    0(%esi), %eax
	movl    4(%esi), %ebx
	movl    8(%esi), %ecx
	movl    12(%esi), %edx
	addl    116(%ebp), %eax
	addl    120(%ebp), %ebx
	addl    124(%ebp), %ecx
	addl    128(%ebp), %edx
	roll    $17, %eax
	roll    $17, %ebx
	roll    $17, %ecx
	roll    $17, %edx
	movl    %eax, 0(%esp)
	movl    %ebx, 4(%esp)
	movl    %ecx, 8(%esp)
	movl    %edx, 12(%esp)

	movl    16(%esi), %eax
	movl    20(%esi), %ebx
	movl    24(%esi), %ecx
	movl    28(%esi), %edx
	addl    132(%ebp), %eax
	addl    136(%ebp), %ebx
	addl    140(%ebp), %ecx
	addl    144(%ebp), %edx
	roll    $17, %eax
	roll    $17, %ebx
	roll    $17, %ecx
	roll    $17, %edx
	movl    %eax, 16(%esp)
	movl    %ebx, 20(%esp)
	movl    %ecx, 24(%esp)
	movl    %edx, 28(%esp)

	movl    32(%esi), %eax
	movl    36(%esi), %ebx
	movl    40(%esi), %ecx
	movl    44(%esi), %edx
	addl    148(%ebp), %eax
	addl    152(%ebp), %ebx
	addl    156(%ebp), %ecx
	addl    160(%ebp), %edx
	roll    $17, %eax
	roll    $17, %ebx
	roll    $17, %ecx
	roll    $17, %edx
	movl    %eax, 32(%esp)
	movl    %ebx, 36(%esp)
	movl    %ecx, 40(%esp)
	movl    %edx, 44(%esp)

	movl    48(%esi), %eax
	movl    52(%esi), %ebx
	movl    56(%esi), %ecx
	movl    60(%esi), %edx
	addl    164(%ebp), %eax
	addl    168(%ebp), %ebx
	addl    172(%ebp), %ecx
	addl    176(%ebp), %edx
	roll    $17, %eax
	roll    $17, %ebx
	roll    $17, %ecx
	roll    $17, %edx
	movl    %eax, 48(%esp)
	movl    %ebx, 52(%esp)
	movl    %ecx, 56(%esp)
	movl    %edx, 60(%esp)

	# Xor W into A[0]/A[1]

	movl    68(%ebp), %ebx
	movl    72(%ebp), %ecx
	xorl    244(%ebp), %ebx
	xorl    248(%ebp), %ecx
	movl    %ebx, 68(%ebp)
	movl    %ecx, 72(%ebp)

	# Next loop is unrolled over 16 rounds, and performed 3 times.
	#   %eax   previous A word, accumulator
	#   %edi   points to Bx[u]
	#   %ebp   points to context structure (already set)
	#   %esi   points to data block (already set)
	#   %edx   index for current A word

	movl    %esp, %edi
	xorl    %edx, %edx
	movl    112(%ebp), %eax

	# AUTO BEGIN

Lm1:
	# u = 0 mod 16.
	roll    $15, %eax
	movl    24(%edi), %ebx
	movl    52(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    68(%ebp, %edx), %eax
	xorl    0(%esi), %ecx
	andl    36(%edi), %ebx
	xorl    212(%ebp), %eax
	xorl    %ecx, %ebx
	movl    0(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 68(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 64(%edi)

	# u = 1 mod 16.
	roll    $15, %eax
	movl    28(%edi), %ebx
	movl    56(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    72(%ebp, %edx), %eax
	xorl    4(%esi), %ecx
	andl    40(%edi), %ebx
	xorl    208(%ebp), %eax
	xorl    %ecx, %ebx
	movl    4(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 72(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 68(%edi)

	# u = 2 mod 16.
	roll    $15, %eax
	movl    32(%edi), %ebx
	movl    60(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    76(%ebp, %edx), %eax
	xorl    8(%esi), %ecx
	andl    44(%edi), %ebx
	xorl    204(%ebp), %eax
	xorl    %ecx, %ebx
	movl    8(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 76(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 72(%edi)

	# u = 3 mod 16.
	roll    $15, %eax
	movl    36(%edi), %ebx
	movl    64(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    80(%ebp, %edx), %eax
	xorl    12(%esi), %ecx
	andl    48(%edi), %ebx
	xorl    200(%ebp), %eax
	xorl    %ecx, %ebx
	movl    12(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 80(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 76(%edi)

	# Update %edx
	addl    $16, %edx
	cmpl    $48, %edx
	jnz     Lm2
	xorl    %edx, %edx

Lm2:
	# u = 4 mod 16.
	roll    $15, %eax
	movl    40(%edi), %ebx
	movl    68(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    68(%ebp, %edx), %eax
	xorl    16(%esi), %ecx
	andl    52(%edi), %ebx
	xorl    196(%ebp), %eax
	xorl    %ecx, %ebx
	movl    16(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 68(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 80(%edi)

	# u = 5 mod 16.
	roll    $15, %eax
	movl    44(%edi), %ebx
	movl    72(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    72(%ebp, %edx), %eax
	xorl    20(%esi), %ecx
	andl    56(%edi), %ebx
	xorl    192(%ebp), %eax
	xorl    %ecx, %ebx
	movl    20(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 72(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 84(%edi)

	# u = 6 mod 16.
	roll    $15, %eax
	movl    48(%edi), %ebx
	movl    76(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    76(%ebp, %edx), %eax
	xorl    24(%esi), %ecx
	andl    60(%edi), %ebx
	xorl    188(%ebp), %eax
	xorl    %ecx, %ebx
	movl    24(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 76(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 88(%edi)

	# u = 7 mod 16.
	roll    $15, %eax
	movl    52(%edi), %ebx
	movl    80(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    80(%ebp, %edx), %eax
	xorl    28(%esi), %ecx
	andl    64(%edi), %ebx
	xorl    184(%ebp), %eax
	xorl    %ecx, %ebx
	movl    28(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 80(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 92(%edi)

	# Update %edx
	addl    $16, %edx
	cmpl    $48, %edx
	jnz     Lm3
	xorl    %edx, %edx

Lm3:
	# u = 8 mod 16.
	roll    $15, %eax
	movl    56(%edi), %ebx
	movl    84(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    68(%ebp, %edx), %eax
	xorl    32(%esi), %ecx
	andl    68(%edi), %ebx
	xorl    180(%ebp), %eax
	xorl    %ecx, %ebx
	movl    32(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 68(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 96(%edi)

	# u = 9 mod 16.
	roll    $15, %eax
	movl    60(%edi), %ebx
	movl    88(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    72(%ebp, %edx), %eax
	xorl    36(%esi), %ecx
	andl    72(%edi), %ebx
	xorl    240(%ebp), %eax
	xorl    %ecx, %ebx
	movl    36(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 72(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 100(%edi)

	# u = 10 mod 16.
	roll    $15, %eax
	movl    64(%edi), %ebx
	movl    92(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    76(%ebp, %edx), %eax
	xorl    40(%esi), %ecx
	andl    76(%edi), %ebx
	xorl    236(%ebp), %eax
	xorl    %ecx, %ebx
	movl    40(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 76(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 104(%edi)

	# u = 11 mod 16.
	roll    $15, %eax
	movl    68(%edi), %ebx
	movl    96(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    80(%ebp, %edx), %eax
	xorl    44(%esi), %ecx
	andl    80(%edi), %ebx
	xorl    232(%ebp), %eax
	xorl    %ecx, %ebx
	movl    44(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 80(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 108(%edi)

	# Update %edx
	addl    $16, %edx
	cmpl    $48, %edx
	jnz     Lm4
	xorl    %edx, %edx

Lm4:
	# u = 12 mod 16.
	roll    $15, %eax
	movl    72(%edi), %ebx
	movl    100(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    68(%ebp, %edx), %eax
	xorl    48(%esi), %ecx
	andl    84(%edi), %ebx
	xorl    228(%ebp), %eax
	xorl    %ecx, %ebx
	movl    48(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 68(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 112(%edi)

	# u = 13 mod 16.
	roll    $15, %eax
	movl    76(%edi), %ebx
	movl    104(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    72(%ebp, %edx), %eax
	xorl    52(%esi), %ecx
	andl    88(%edi), %ebx
	xorl    224(%ebp), %eax
	xorl    %ecx, %ebx
	movl    52(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 72(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 116(%edi)

	# u = 14 mod 16.
	roll    $15, %eax
	movl    80(%edi), %ebx
	movl    108(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    76(%ebp, %edx), %eax
	xorl    56(%esi), %ecx
	andl    92(%edi), %ebx
	xorl    220(%ebp), %eax
	xorl    %ecx, %ebx
	movl    56(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 76(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 120(%edi)

	# u = 15 mod 16.
	roll    $15, %eax
	movl    84(%edi), %ebx
	movl    112(%edi), %ecx
	leal    (%eax, %eax, 4), %eax
	notl    %ebx
	xorl    80(%ebp, %edx), %eax
	xorl    60(%esi), %ecx
	andl    96(%edi), %ebx
	xorl    216(%ebp), %eax
	xorl    %ecx, %ebx
	movl    60(%edi), %ecx
	leal    (%eax, %eax, 2), %eax
	notl    %ecx
	xorl    %ebx, %eax
	roll    $1, %ecx
	movl    %eax, 80(%ebp, %edx)
	xorl    %eax, %ecx
	movl    %ecx, 124(%edi)

	# Update %edx
	addl    $16, %edx
	addl    $64, %edi
	cmpl    $48, %edx
	jnz     Lm1

	# AUTO END

	# Add C words to A words.

	movl    192(%ebp), %eax        # Load C[3].
	movl    196(%ebp), %ebx        # Load C[4].
	movl    200(%ebp), %ecx        # Load C[5].
	movl    204(%ebp), %edx        # Load C[6].
	addl    224(%ebp), %eax        # Compute C[11] + C[3].
	addl    228(%ebp), %ebx        # Compute C[12] + C[4].
	addl    232(%ebp), %ecx        # Compute C[13] + C[5].
	addl    236(%ebp), %edx        # Compute C[14] + C[6].
	addl    %eax, 68(%ebp)         # Add C[11] + C[3] to A[0].
	addl    %ebx, 72(%ebp)         # Add C[12] + C[4] to A[1].
	addl    %ecx, 76(%ebp)         # Add C[13] + C[5] to A[2].
	addl    %edx, 80(%ebp)         # Add C[14] + C[6] to A[3].
	addl    %eax, 100(%ebp)        # Add C[11] + C[3] to A[8].
	addl    %ebx, 104(%ebp)        # Add C[12] + C[4] to A[9].
	addl    %ecx, 108(%ebp)        # Add C[13] + C[5] to A[10].
	addl    %edx, 112(%ebp)        # Add C[14] + C[6] to A[11].
	movl    208(%ebp), %eax        # Load C[7].
	movl    212(%ebp), %ebx        # Load C[8].
	movl    216(%ebp), %ecx        # Load C[9].
	movl    220(%ebp), %edx        # Load C[10].
	addl    %eax, 100(%ebp)        # Add C[7] to A[8].
	addl    %ebx, 104(%ebp)        # Add C[8] to A[9].
	addl    %ecx, 108(%ebp)        # Add C[9] to A[10].
	addl    %edx, 112(%ebp)        # Add C[10] to A[11].
	addl    192(%ebp), %eax        # Compute C[3] + C[7].
	addl    196(%ebp), %ebx        # Compute C[4] + C[8].
	addl    200(%ebp), %ecx        # Compute C[5] + C[9].
	addl    204(%ebp), %edx        # Compute C[6] + C[10].
	addl    %eax, 84(%ebp)         # Add C[3] + C[7] to A[4].
	addl    %ebx, 88(%ebp)         # Add C[4] + C[8] to A[5].
	addl    %ecx, 92(%ebp)         # Add C[5] + C[9] to A[6].
	addl    %edx, 96(%ebp)         # Add C[6] + C[10] to A[7].
	movl    240(%ebp), %eax        # Load C[15].
	movl    180(%ebp), %ebx        # Load C[0].
	movl    184(%ebp), %ecx        # Load C[1].
	movl    188(%ebp), %edx        # Load C[2].
	addl    %eax, 68(%ebp)         # Add C[15] to A[0].
	addl    %ebx, 72(%ebp)         # Add C[0] to A[1].
	addl    %ecx, 76(%ebp)         # Add C[1] to A[2].
	addl    %edx, 80(%ebp)         # Add C[2] to A[3].
	addl    %eax, 84(%ebp)         # Add C[15] to A[4].
	addl    %ebx, 88(%ebp)         # Add C[0] to A[5].
	addl    %ecx, 92(%ebp)         # Add C[1] to A[6].
	addl    %edx, 96(%ebp)         # Add C[2] to A[7].

	# Subtract M words from C words, and store in B.

	movl    180(%ebp), %eax
	movl    184(%ebp), %ebx
	movl    188(%ebp), %ecx
	movl    192(%ebp), %edx
	subl    0(%esi), %eax
	subl    4(%esi), %ebx
	subl    8(%esi), %ecx
	subl    12(%esi), %edx
	movl    %eax, 116(%ebp)
	movl    %ebx, 120(%ebp)
	movl    %ecx, 124(%ebp)
	movl    %edx, 128(%ebp)

	movl    196(%ebp), %eax
	movl    200(%ebp), %ebx
	movl    204(%ebp), %ecx
	movl    208(%ebp), %edx
	subl    16(%esi), %eax
	subl    20(%esi), %ebx
	subl    24(%esi), %ecx
	subl    28(%esi), %edx
	movl    %eax, 132(%ebp)
	movl    %ebx, 136(%ebp)
	movl    %ecx, 140(%ebp)
	movl    %edx, 144(%ebp)

	movl    212(%ebp), %eax
	movl    216(%ebp), %ebx
	movl    220(%ebp), %ecx
	movl    224(%ebp), %edx
	subl    32(%esi), %eax
	subl    36(%esi), %ebx
	subl    40(%esi), %ecx
	subl    44(%esi), %edx
	movl    %eax, 148(%ebp)
	movl    %ebx, 152(%ebp)
	movl    %ecx, 156(%ebp)
	movl    %edx, 160(%ebp)

	movl    228(%ebp), %eax
	movl    232(%ebp), %ebx
	movl    236(%ebp), %ecx
	movl    240(%ebp), %edx
	subl    48(%esi), %eax
	subl    52(%esi), %ebx
	subl    56(%esi), %ecx
	subl    60(%esi), %edx
	movl    %eax, 164(%ebp)
	movl    %ebx, 168(%ebp)
	movl    %ecx, 172(%ebp)
	movl    %edx, 176(%ebp)

	# Store new C words (from Bx[48:63]).

	pushl   %esi
	movl    %edi, %esi
	leal    180(%ebp), %edi
	movl    $16, %ecx
	rep movsl
	popl    %esi

	# Increment W.
	addl    $1, 244(%ebp)
	adcl    $0, 248(%ebp)

	# Update data pointer and decrement block counter; if not zero, loop.
	addl    $64, %esi
	decl    284(%esp)
	jnz     Lm0

	addl    $256, %esp
	popl    %ebp
	popl    %esi
	popl    %edi
	popl    %ebx
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

# crypto_hash_shabal256_i386(out, in, len)
#    out   output buffer
#    in    input data
#    len   input data length (in bytes, 64-bit value)
	.globl  crypto_hash_shabal256_i386
	.type   crypto_hash_shabal256_i386, @function
crypto_hash_shabal256_i386:
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
	addl    $(iv256 - Lz1), %esi
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
	pushl   %ebp
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
	pushl   %ebp
	call    shabal_inner
	addl    $12, %esp
	subl    $1, 244(%ebp)
	sbbl    $0, 248(%ebp)
	decl    %edi
	jnz     Lz3

	# Copy result.
	popl    %edi
	leal    212(%ebp), %esi
	movl    $8, %ecx
	rep movsl

	movl    256(%esp), %eax
	movl    %eax, %esp
	xorl    %eax, %eax
	popl    %edi
	popl    %esi
	popl    %ebp
	ret
	.size   crypto_hash_shabal256_i386, .-crypto_hash_shabal256_i386
