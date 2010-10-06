# Implementation of Shabal-512: PowerPC, big-endian, 64-bit.
#
# This code should run on any platform compatible with the 64-bit PowerPC
# specification, when the system convention is big-endian.
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

	.file      "ppc64eb.s"
	.section   ".toc","aw"
	.section   ".text"

# The shabal_inner() function expects a pointer to A[0] and accesses
# the A[], B[], C[] and W fields. It also expects a pointer to the data.
#
# From the shabal_inner() point of view:
#     0      A[] (48 bytes)
#    48      B[] (64 bytes)
#   112      C[] (64 bytes)
#   176      W (8 bytes)

# shabal_inner(stt, buf, num)
#    stt   pointer to context state (address of A[0])
#    buf   pointer to data (no specific alignment required)
#    num   number of 64-byte blocks in data (1 or more)
#
	.align  2
	.type   shabal_inner, @function
shabal_inner:
	# Reserve some stack space for the buffer which receives a
	# copy of the input block (byteswapped words). That buffer has
	# size 64 and begins at address r1+16.
	#
	# We save registers 16 to 31 on the stack; they will contain
	# a cached copy of the B words.
	#
	# Note: this is not a fully compliant stack frame, with regards to
	# ELF standard. But this is allowed since this function is leaf
	# (it calls no other function).
	stdu    1, -208(1)
	std     16, 80(1)
	std     17, 88(1)
	std     18, 96(1)
	std     19, 104(1)
	std     20, 112(1)
	std     21, 120(1)
	std     22, 128(1)
	std     23, 136(1)
	std     24, 144(1)
	std     25, 152(1)
	std     26, 160(1)
	std     27, 168(1)
	std     28, 176(1)
	std     29, 184(1)
	std     30, 192(1)
	std     31, 200(1)

	# Conventions:
	#    r3   pointer to A[0]
	#    r4   pointer to current data block
	#    r5   data block counter
	# B words are cached in r16:31

	lwz     16, 48(3)
	lwz     17, 52(3)
	lwz     18, 56(3)
	lwz     19, 60(3)
	lwz     20, 64(3)
	lwz     21, 68(3)
	lwz     22, 72(3)
	lwz     23, 76(3)
	lwz     24, 80(3)
	lwz     25, 84(3)
	lwz     26, 88(3)
	lwz     27, 92(3)
	lwz     28, 96(3)
	lwz     29, 100(3)
	lwz     30, 104(3)
	lwz     31, 108(3)

.L0m1:
	# Read M words, add to B words, rotate B words. M words are
	# byteswapped upon reading, and then cached into the stack buffer
	# (the stack buffer is guaranteed aligned, and this avoids having
	# to byteswap again).

	# AUTO1 BEGIN

	li      9, 4
	lwbrx   6, 0, 4
	add     16, 16, 6
	lwbrx   8, 9, 4
	rotlwi  16, 16, 17
	stw     6, 16(1)
	add     17, 17, 8
	li      7, 8
	stw     8, 20(1)
	li      9, 12
	lwbrx   6, 7, 4
	rotlwi  17, 17, 17
	add     18, 18, 6
	lwbrx   8, 9, 4
	rotlwi  18, 18, 17
	stw     6, 24(1)
	add     19, 19, 8
	li      7, 16
	stw     8, 28(1)
	li      9, 20
	lwbrx   6, 7, 4
	rotlwi  19, 19, 17
	add     20, 20, 6
	lwbrx   8, 9, 4
	rotlwi  20, 20, 17
	stw     6, 32(1)
	add     21, 21, 8
	li      7, 24
	stw     8, 36(1)
	li      9, 28
	lwbrx   6, 7, 4
	rotlwi  21, 21, 17
	add     22, 22, 6
	lwbrx   8, 9, 4
	rotlwi  22, 22, 17
	stw     6, 40(1)
	add     23, 23, 8
	li      7, 32
	stw     8, 44(1)
	li      9, 36
	lwbrx   6, 7, 4
	rotlwi  23, 23, 17
	add     24, 24, 6
	lwbrx   8, 9, 4
	rotlwi  24, 24, 17
	stw     6, 48(1)
	add     25, 25, 8
	li      7, 40
	stw     8, 52(1)
	li      9, 44
	lwbrx   6, 7, 4
	rotlwi  25, 25, 17
	add     26, 26, 6
	lwbrx   8, 9, 4
	rotlwi  26, 26, 17
	stw     6, 56(1)
	add     27, 27, 8
	li      7, 48
	stw     8, 60(1)
	li      9, 52
	lwbrx   6, 7, 4
	rotlwi  27, 27, 17
	add     28, 28, 6
	lwbrx   8, 9, 4
	rotlwi  28, 28, 17
	stw     6, 64(1)
	add     29, 29, 8
	li      7, 56
	stw     8, 68(1)
	li      9, 60
	lwbrx   6, 7, 4
	rotlwi  29, 29, 17
	add     30, 30, 6
	lwbrx   8, 9, 4
	rotlwi  30, 30, 17
	stw     6, 72(1)
	add     31, 31, 8
	rotlwi  31, 31, 17
	stw     8, 76(1)

	# AUTO1 END

	# Xor W into A[0]/A[1].
	ld      6, 0(3)
	ld      8, 176(3)
	xor     6, 6, 8
	std     6, 0(3)

	# Conventions for the unrolled 48 rounds:
	#    r6   previous A word, accumulator

	lwz     6, 44(3)

	# AUTO2 BEGIN

	# u = 0.
	rotlwi  6, 6, 15
	lwz     8, 0(3)
	slwi    7, 6, 2
	lwz     9, 144(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 16(1)
	xor     6, 6, 8
	andc    11, 25, 22
	slwi    7, 6, 1
	xor     11, 29, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  16, 16, 1
	stw     6, 0(3)
	eqv     16, 6, 16

	# u = 1.
	rotlwi  6, 6, 15
	lwz     8, 4(3)
	slwi    7, 6, 2
	lwz     9, 140(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 20(1)
	xor     6, 6, 8
	andc    11, 26, 23
	slwi    7, 6, 1
	xor     11, 30, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  17, 17, 1
	stw     6, 4(3)
	eqv     17, 6, 17

	# u = 2.
	rotlwi  6, 6, 15
	lwz     8, 8(3)
	slwi    7, 6, 2
	lwz     9, 136(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 24(1)
	xor     6, 6, 8
	andc    11, 27, 24
	slwi    7, 6, 1
	xor     11, 31, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  18, 18, 1
	stw     6, 8(3)
	eqv     18, 6, 18

	# u = 3.
	rotlwi  6, 6, 15
	lwz     8, 12(3)
	slwi    7, 6, 2
	lwz     9, 132(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 28(1)
	xor     6, 6, 8
	andc    11, 28, 25
	slwi    7, 6, 1
	xor     11, 16, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  19, 19, 1
	stw     6, 12(3)
	eqv     19, 6, 19

	# u = 4.
	rotlwi  6, 6, 15
	lwz     8, 16(3)
	slwi    7, 6, 2
	lwz     9, 128(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 32(1)
	xor     6, 6, 8
	andc    11, 29, 26
	slwi    7, 6, 1
	xor     11, 17, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  20, 20, 1
	stw     6, 16(3)
	eqv     20, 6, 20

	# u = 5.
	rotlwi  6, 6, 15
	lwz     8, 20(3)
	slwi    7, 6, 2
	lwz     9, 124(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 36(1)
	xor     6, 6, 8
	andc    11, 30, 27
	slwi    7, 6, 1
	xor     11, 18, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  21, 21, 1
	stw     6, 20(3)
	eqv     21, 6, 21

	# u = 6.
	rotlwi  6, 6, 15
	lwz     8, 24(3)
	slwi    7, 6, 2
	lwz     9, 120(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 40(1)
	xor     6, 6, 8
	andc    11, 31, 28
	slwi    7, 6, 1
	xor     11, 19, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  22, 22, 1
	stw     6, 24(3)
	eqv     22, 6, 22

	# u = 7.
	rotlwi  6, 6, 15
	lwz     8, 28(3)
	slwi    7, 6, 2
	lwz     9, 116(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 44(1)
	xor     6, 6, 8
	andc    11, 16, 29
	slwi    7, 6, 1
	xor     11, 20, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  23, 23, 1
	stw     6, 28(3)
	eqv     23, 6, 23

	# u = 8.
	rotlwi  6, 6, 15
	lwz     8, 32(3)
	slwi    7, 6, 2
	lwz     9, 112(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 48(1)
	xor     6, 6, 8
	andc    11, 17, 30
	slwi    7, 6, 1
	xor     11, 21, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  24, 24, 1
	stw     6, 32(3)
	eqv     24, 6, 24

	# u = 9.
	rotlwi  6, 6, 15
	lwz     8, 36(3)
	slwi    7, 6, 2
	lwz     9, 172(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 52(1)
	xor     6, 6, 8
	andc    11, 18, 31
	slwi    7, 6, 1
	xor     11, 22, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  25, 25, 1
	stw     6, 36(3)
	eqv     25, 6, 25

	# u = 10.
	rotlwi  6, 6, 15
	lwz     8, 40(3)
	slwi    7, 6, 2
	lwz     9, 168(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 56(1)
	xor     6, 6, 8
	andc    11, 19, 16
	slwi    7, 6, 1
	xor     11, 23, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  26, 26, 1
	stw     6, 40(3)
	eqv     26, 6, 26

	# u = 11.
	rotlwi  6, 6, 15
	lwz     8, 44(3)
	slwi    7, 6, 2
	lwz     9, 164(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 60(1)
	xor     6, 6, 8
	andc    11, 20, 17
	slwi    7, 6, 1
	xor     11, 24, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  27, 27, 1
	stw     6, 44(3)
	eqv     27, 6, 27

	# u = 12.
	rotlwi  6, 6, 15
	lwz     8, 0(3)
	slwi    7, 6, 2
	lwz     9, 160(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 64(1)
	xor     6, 6, 8
	andc    11, 21, 18
	slwi    7, 6, 1
	xor     11, 25, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  28, 28, 1
	stw     6, 0(3)
	eqv     28, 6, 28

	# u = 13.
	rotlwi  6, 6, 15
	lwz     8, 4(3)
	slwi    7, 6, 2
	lwz     9, 156(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 68(1)
	xor     6, 6, 8
	andc    11, 22, 19
	slwi    7, 6, 1
	xor     11, 26, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  29, 29, 1
	stw     6, 4(3)
	eqv     29, 6, 29

	# u = 14.
	rotlwi  6, 6, 15
	lwz     8, 8(3)
	slwi    7, 6, 2
	lwz     9, 152(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 72(1)
	xor     6, 6, 8
	andc    11, 23, 20
	slwi    7, 6, 1
	xor     11, 27, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  30, 30, 1
	stw     6, 8(3)
	eqv     30, 6, 30

	# u = 15.
	rotlwi  6, 6, 15
	lwz     8, 12(3)
	slwi    7, 6, 2
	lwz     9, 148(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 76(1)
	xor     6, 6, 8
	andc    11, 24, 21
	slwi    7, 6, 1
	xor     11, 28, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  31, 31, 1
	stw     6, 12(3)
	eqv     31, 6, 31

	# u = 16.
	rotlwi  6, 6, 15
	lwz     8, 16(3)
	slwi    7, 6, 2
	lwz     9, 144(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 16(1)
	xor     6, 6, 8
	andc    11, 25, 22
	slwi    7, 6, 1
	xor     11, 29, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  16, 16, 1
	stw     6, 16(3)
	eqv     16, 6, 16

	# u = 17.
	rotlwi  6, 6, 15
	lwz     8, 20(3)
	slwi    7, 6, 2
	lwz     9, 140(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 20(1)
	xor     6, 6, 8
	andc    11, 26, 23
	slwi    7, 6, 1
	xor     11, 30, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  17, 17, 1
	stw     6, 20(3)
	eqv     17, 6, 17

	# u = 18.
	rotlwi  6, 6, 15
	lwz     8, 24(3)
	slwi    7, 6, 2
	lwz     9, 136(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 24(1)
	xor     6, 6, 8
	andc    11, 27, 24
	slwi    7, 6, 1
	xor     11, 31, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  18, 18, 1
	stw     6, 24(3)
	eqv     18, 6, 18

	# u = 19.
	rotlwi  6, 6, 15
	lwz     8, 28(3)
	slwi    7, 6, 2
	lwz     9, 132(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 28(1)
	xor     6, 6, 8
	andc    11, 28, 25
	slwi    7, 6, 1
	xor     11, 16, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  19, 19, 1
	stw     6, 28(3)
	eqv     19, 6, 19

	# u = 20.
	rotlwi  6, 6, 15
	lwz     8, 32(3)
	slwi    7, 6, 2
	lwz     9, 128(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 32(1)
	xor     6, 6, 8
	andc    11, 29, 26
	slwi    7, 6, 1
	xor     11, 17, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  20, 20, 1
	stw     6, 32(3)
	eqv     20, 6, 20

	# u = 21.
	rotlwi  6, 6, 15
	lwz     8, 36(3)
	slwi    7, 6, 2
	lwz     9, 124(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 36(1)
	xor     6, 6, 8
	andc    11, 30, 27
	slwi    7, 6, 1
	xor     11, 18, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  21, 21, 1
	stw     6, 36(3)
	eqv     21, 6, 21

	# u = 22.
	rotlwi  6, 6, 15
	lwz     8, 40(3)
	slwi    7, 6, 2
	lwz     9, 120(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 40(1)
	xor     6, 6, 8
	andc    11, 31, 28
	slwi    7, 6, 1
	xor     11, 19, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  22, 22, 1
	stw     6, 40(3)
	eqv     22, 6, 22

	# u = 23.
	rotlwi  6, 6, 15
	lwz     8, 44(3)
	slwi    7, 6, 2
	lwz     9, 116(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 44(1)
	xor     6, 6, 8
	andc    11, 16, 29
	slwi    7, 6, 1
	xor     11, 20, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  23, 23, 1
	stw     6, 44(3)
	eqv     23, 6, 23

	# u = 24.
	rotlwi  6, 6, 15
	lwz     8, 0(3)
	slwi    7, 6, 2
	lwz     9, 112(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 48(1)
	xor     6, 6, 8
	andc    11, 17, 30
	slwi    7, 6, 1
	xor     11, 21, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  24, 24, 1
	stw     6, 0(3)
	eqv     24, 6, 24

	# u = 25.
	rotlwi  6, 6, 15
	lwz     8, 4(3)
	slwi    7, 6, 2
	lwz     9, 172(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 52(1)
	xor     6, 6, 8
	andc    11, 18, 31
	slwi    7, 6, 1
	xor     11, 22, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  25, 25, 1
	stw     6, 4(3)
	eqv     25, 6, 25

	# u = 26.
	rotlwi  6, 6, 15
	lwz     8, 8(3)
	slwi    7, 6, 2
	lwz     9, 168(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 56(1)
	xor     6, 6, 8
	andc    11, 19, 16
	slwi    7, 6, 1
	xor     11, 23, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  26, 26, 1
	stw     6, 8(3)
	eqv     26, 6, 26

	# u = 27.
	rotlwi  6, 6, 15
	lwz     8, 12(3)
	slwi    7, 6, 2
	lwz     9, 164(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 60(1)
	xor     6, 6, 8
	andc    11, 20, 17
	slwi    7, 6, 1
	xor     11, 24, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  27, 27, 1
	stw     6, 12(3)
	eqv     27, 6, 27

	# u = 28.
	rotlwi  6, 6, 15
	lwz     8, 16(3)
	slwi    7, 6, 2
	lwz     9, 160(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 64(1)
	xor     6, 6, 8
	andc    11, 21, 18
	slwi    7, 6, 1
	xor     11, 25, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  28, 28, 1
	stw     6, 16(3)
	eqv     28, 6, 28

	# u = 29.
	rotlwi  6, 6, 15
	lwz     8, 20(3)
	slwi    7, 6, 2
	lwz     9, 156(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 68(1)
	xor     6, 6, 8
	andc    11, 22, 19
	slwi    7, 6, 1
	xor     11, 26, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  29, 29, 1
	stw     6, 20(3)
	eqv     29, 6, 29

	# u = 30.
	rotlwi  6, 6, 15
	lwz     8, 24(3)
	slwi    7, 6, 2
	lwz     9, 152(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 72(1)
	xor     6, 6, 8
	andc    11, 23, 20
	slwi    7, 6, 1
	xor     11, 27, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  30, 30, 1
	stw     6, 24(3)
	eqv     30, 6, 30

	# u = 31.
	rotlwi  6, 6, 15
	lwz     8, 28(3)
	slwi    7, 6, 2
	lwz     9, 148(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 76(1)
	xor     6, 6, 8
	andc    11, 24, 21
	slwi    7, 6, 1
	xor     11, 28, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  31, 31, 1
	stw     6, 28(3)
	eqv     31, 6, 31

	# u = 32.
	rotlwi  6, 6, 15
	lwz     8, 32(3)
	slwi    7, 6, 2
	lwz     9, 144(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 16(1)
	xor     6, 6, 8
	andc    11, 25, 22
	slwi    7, 6, 1
	xor     11, 29, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  16, 16, 1
	stw     6, 32(3)
	eqv     16, 6, 16

	# u = 33.
	rotlwi  6, 6, 15
	lwz     8, 36(3)
	slwi    7, 6, 2
	lwz     9, 140(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 20(1)
	xor     6, 6, 8
	andc    11, 26, 23
	slwi    7, 6, 1
	xor     11, 30, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  17, 17, 1
	stw     6, 36(3)
	eqv     17, 6, 17

	# u = 34.
	rotlwi  6, 6, 15
	lwz     8, 40(3)
	slwi    7, 6, 2
	lwz     9, 136(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 24(1)
	xor     6, 6, 8
	andc    11, 27, 24
	slwi    7, 6, 1
	xor     11, 31, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  18, 18, 1
	stw     6, 40(3)
	eqv     18, 6, 18

	# u = 35.
	rotlwi  6, 6, 15
	lwz     8, 44(3)
	slwi    7, 6, 2
	lwz     9, 132(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 28(1)
	xor     6, 6, 8
	andc    11, 28, 25
	slwi    7, 6, 1
	xor     11, 16, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  19, 19, 1
	stw     6, 44(3)
	eqv     19, 6, 19

	# u = 36.
	rotlwi  6, 6, 15
	lwz     8, 0(3)
	slwi    7, 6, 2
	lwz     9, 128(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 32(1)
	xor     6, 6, 8
	andc    11, 29, 26
	slwi    7, 6, 1
	xor     11, 17, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  20, 20, 1
	stw     6, 0(3)
	eqv     20, 6, 20

	# u = 37.
	rotlwi  6, 6, 15
	lwz     8, 4(3)
	slwi    7, 6, 2
	lwz     9, 124(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 36(1)
	xor     6, 6, 8
	andc    11, 30, 27
	slwi    7, 6, 1
	xor     11, 18, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  21, 21, 1
	stw     6, 4(3)
	eqv     21, 6, 21

	# u = 38.
	rotlwi  6, 6, 15
	lwz     8, 8(3)
	slwi    7, 6, 2
	lwz     9, 120(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 40(1)
	xor     6, 6, 8
	andc    11, 31, 28
	slwi    7, 6, 1
	xor     11, 19, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  22, 22, 1
	stw     6, 8(3)
	eqv     22, 6, 22

	# u = 39.
	rotlwi  6, 6, 15
	lwz     8, 12(3)
	slwi    7, 6, 2
	lwz     9, 116(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 44(1)
	xor     6, 6, 8
	andc    11, 16, 29
	slwi    7, 6, 1
	xor     11, 20, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  23, 23, 1
	stw     6, 12(3)
	eqv     23, 6, 23

	# u = 40.
	rotlwi  6, 6, 15
	lwz     8, 16(3)
	slwi    7, 6, 2
	lwz     9, 112(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 48(1)
	xor     6, 6, 8
	andc    11, 17, 30
	slwi    7, 6, 1
	xor     11, 21, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  24, 24, 1
	stw     6, 16(3)
	eqv     24, 6, 24

	# u = 41.
	rotlwi  6, 6, 15
	lwz     8, 20(3)
	slwi    7, 6, 2
	lwz     9, 172(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 52(1)
	xor     6, 6, 8
	andc    11, 18, 31
	slwi    7, 6, 1
	xor     11, 22, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  25, 25, 1
	stw     6, 20(3)
	eqv     25, 6, 25

	# u = 42.
	rotlwi  6, 6, 15
	lwz     8, 24(3)
	slwi    7, 6, 2
	lwz     9, 168(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 56(1)
	xor     6, 6, 8
	andc    11, 19, 16
	slwi    7, 6, 1
	xor     11, 23, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  26, 26, 1
	stw     6, 24(3)
	eqv     26, 6, 26

	# u = 43.
	rotlwi  6, 6, 15
	lwz     8, 28(3)
	slwi    7, 6, 2
	lwz     9, 164(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 60(1)
	xor     6, 6, 8
	andc    11, 20, 17
	slwi    7, 6, 1
	xor     11, 24, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  27, 27, 1
	stw     6, 28(3)
	eqv     27, 6, 27

	# u = 44.
	rotlwi  6, 6, 15
	lwz     8, 32(3)
	slwi    7, 6, 2
	lwz     9, 160(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 64(1)
	xor     6, 6, 8
	andc    11, 21, 18
	slwi    7, 6, 1
	xor     11, 25, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  28, 28, 1
	stw     6, 32(3)
	eqv     28, 6, 28

	# u = 45.
	rotlwi  6, 6, 15
	lwz     8, 36(3)
	slwi    7, 6, 2
	lwz     9, 156(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 68(1)
	xor     6, 6, 8
	andc    11, 22, 19
	slwi    7, 6, 1
	xor     11, 26, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  29, 29, 1
	stw     6, 36(3)
	eqv     29, 6, 29

	# u = 46.
	rotlwi  6, 6, 15
	lwz     8, 40(3)
	slwi    7, 6, 2
	lwz     9, 152(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 72(1)
	xor     6, 6, 8
	andc    11, 23, 20
	slwi    7, 6, 1
	xor     11, 27, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  30, 30, 1
	stw     6, 40(3)
	eqv     30, 6, 30

	# u = 47.
	rotlwi  6, 6, 15
	lwz     8, 44(3)
	slwi    7, 6, 2
	lwz     9, 148(3)
	add     6, 6, 7
	xor     8, 8, 9
	lwz     10, 76(1)
	xor     6, 6, 8
	andc    11, 24, 21
	slwi    7, 6, 1
	xor     11, 28, 11
	add     6, 6, 7
	xor     10, 10, 11
	xor     6, 6, 10
	rotlwi  31, 31, 1
	stw     6, 44(3)
	eqv     31, 6, 31

	# AUTO2 END

	# We swap B and C words. The B words are in r16:31, and become
	# the new C words. We still need the previous C words, hence we
	# load them in r16:31.

	# AUTO3 BEGIN

	lwz     6, 112(3)
	stw     16, 112(3)
	mr      16, 6
	lwz     6, 116(3)
	stw     17, 116(3)
	mr      17, 6
	lwz     6, 120(3)
	stw     18, 120(3)
	mr      18, 6
	lwz     6, 124(3)
	stw     19, 124(3)
	mr      19, 6
	lwz     6, 128(3)
	stw     20, 128(3)
	mr      20, 6
	lwz     6, 132(3)
	stw     21, 132(3)
	mr      21, 6
	lwz     6, 136(3)
	stw     22, 136(3)
	mr      22, 6
	lwz     6, 140(3)
	stw     23, 140(3)
	mr      23, 6
	lwz     6, 144(3)
	stw     24, 144(3)
	mr      24, 6
	lwz     6, 148(3)
	stw     25, 148(3)
	mr      25, 6
	lwz     6, 152(3)
	stw     26, 152(3)
	mr      26, 6
	lwz     6, 156(3)
	stw     27, 156(3)
	mr      27, 6
	lwz     6, 160(3)
	stw     28, 160(3)
	mr      28, 6
	lwz     6, 164(3)
	stw     29, 164(3)
	mr      29, 6
	lwz     6, 168(3)
	stw     30, 168(3)
	mr      30, 6
	lwz     6, 172(3)
	stw     31, 172(3)
	mr      31, 6

	# AUTO3 END

	# Add the C words (now in r16:31) to the A words.

	add     6, 19, 27              # Compute C[3]+C[11].
	add     7, 20, 28              # Compute C[4]+C[12].
	lwz     10, 0(3)               # Load A[0].
	lwz     11, 4(3)               # Load A[1].
	add     10, 6, 10              # Add C[3]+C[11] to A[0].
	add     11, 7, 11              # Add C[4]+C[12] to A[1].
	add     10, 31, 10             # Add C[15] to A[0].
	add     11, 16, 11             # Add C[0] to A[1].
	stw     10, 0(3)               # Store A[0].
	stw     11, 4(3)               # Store A[1].

	add     8, 21, 29              # Compute C[5]+C[13].
	add     9, 22, 30              # Compute C[6]+C[14].
	lwz     10, 8(3)               # Load A[2].
	lwz     11, 12(3)              # Load A[3].
	add     10, 8, 10              # Add C[5]+C[13] to A[2].
	add     11, 9, 11              # Add C[6]+C[14] to A[3].
	add     10, 17, 10             # Add C[1] to A[2].
	add     11, 18, 11             # Add C[2] to A[3].
	stw     10, 8(3)               # Store A[2].
	stw     11, 12(3)              # Store A[3].

	lwz     10, 32(3)              # Load A[8].
	lwz     11, 36(3)              # Load A[9].
	add     10, 6, 10              # Add C[3]+C[11] to A[8].
	add     11, 7, 11              # Add C[4]+C[12] to A[9].
	add     10, 23, 10             # Add C[7] to A[8].
	add     11, 24, 11             # Add C[8] to A[9].
	stw     10, 32(3)              # Store A[8].
	stw     11, 36(3)              # Store A[9].

	lwz     10, 40(3)              # Load A[10].
	lwz     11, 44(3)              # Load A[11].
	add     10, 8, 10              # Add C[5]+C[13] to A[8].
	add     11, 9, 11              # Add C[6]+C[14] to A[9].
	add     10, 25, 10             # Add C[9] to A[8].
	add     11, 26, 11             # Add C[10] to A[9].
	stw     10, 40(3)              # Store A[10].
	stw     11, 44(3)              # Store A[11].

	lwz     10, 16(3)              # Load A[4].
	lwz     11, 20(3)              # Load A[5].
	add     10, 31, 10             # Add C[15] to A[4].
	add     11, 16, 11             # Add C[0] to A[5].
	add     6, 19, 23              # Compute C[3]+C[7].
	add     7, 20, 24              # Compute C[4]+C[8].
	add     10, 6, 10              # Add C[3]+C[7] to A[4].
	add     11, 7, 11              # Add C[4]+C[8] to A[5].
	stw     10, 16(3)              # Store A[4].
	stw     11, 20(3)              # Store A[5].

	lwz     10, 24(3)              # Load A[6].
	lwz     11, 28(3)              # Load A[7].
	add     10, 17, 10             # Add C[1] to A[6].
	add     11, 18, 11             # Add C[2] to A[7].
	add     8, 21, 25              # Compute C[5]+C[9].
	add     9, 22, 26              # Compute C[6]+C[10].
	add     10, 8, 10              # Add C[5]+C[9] to A[6].
	add     11, 9, 11              # Add C[6]+C[10] to A[7].
	stw     10, 24(3)              # Store A[6].
	stw     11, 28(3)              # Store A[7].

	# Subtract M words from C words.

	# AUTO4 BEGIN

	lwz     6, 16(1)
	lwz     7, 20(1)
	subf    16, 6, 16
	lwz     6, 24(1)
	subf    17, 7, 17
	lwz     7, 28(1)
	subf    18, 6, 18
	lwz     6, 32(1)
	subf    19, 7, 19
	lwz     7, 36(1)
	subf    20, 6, 20
	lwz     6, 40(1)
	subf    21, 7, 21
	lwz     7, 44(1)
	subf    22, 6, 22
	lwz     6, 48(1)
	subf    23, 7, 23
	lwz     7, 52(1)
	subf    24, 6, 24
	lwz     6, 56(1)
	subf    25, 7, 25
	lwz     7, 60(1)
	subf    26, 6, 26
	lwz     6, 64(1)
	subf    27, 7, 27
	lwz     7, 68(1)
	subf    28, 6, 28
	lwz     6, 72(1)
	subf    29, 7, 29
	lwz     7, 76(1)
	subf    30, 6, 30
	subf    31, 7, 31

	# AUTO4 END

	# Increment W.
	ld      7, 176(3)
	rotldi  7, 7, 32
	addi    7, 7, 1
	rotldi  7, 7, 32
	std     7, 176(3)

	# Increment data pointer, decrement block counter. Loop until
	# the block counter reaches 0.

	addic.  5, 5, -1
	addi    4, 4, 64
	bne     .L0m1

	# Flush cached B words to structure.

	stw     16, 48(3)
	stw     17, 52(3)
	stw     18, 56(3)
	stw     19, 60(3)
	stw     20, 64(3)
	stw     21, 68(3)
	stw     22, 72(3)
	stw     23, 76(3)
	stw     24, 80(3)
	stw     25, 84(3)
	stw     26, 88(3)
	stw     27, 92(3)
	stw     28, 96(3)
	stw     29, 100(3)
	stw     30, 104(3)
	stw     31, 108(3)

	# Restore registers and exit.
	ld      16, 80(1)
	ld      17, 88(1)
	ld      18, 96(1)
	ld      19, 104(1)
	ld      20, 112(1)
	ld      21, 120(1)
	ld      22, 128(1)
	ld      23, 136(1)
	ld      24, 144(1)
	ld      25, 152(1)
	ld      26, 160(1)
	ld      27, 168(1)
	ld      28, 176(1)
	ld      29, 184(1)
	ld      30, 192(1)
	ld      31, 200(1)
	addi    1, 1, 208
	blr
	.size   shabal_inner, .-shabal_inner

# internal_memcpy(dst, src, len)
#    dst   destination pointer
#    src   source pointer
#    len   length (in bytes)
# This is similar to the standard memcpy(). This is included to avoid
# complications with PIC code.
	.type   internal_memcpy, @function
internal_memcpy:
	li      11, 7
	andc.   6, 5, 11
	beq     .L0im2
	add     3, 3, 6
	add     4, 4, 6
	neg     6, 6
.L0im1:
	ldx     7, 4, 6
	stdx    7, 3, 6
	addic.  6, 6, 8
	bne     .L0im1
.L0im2:
	andi.   6, 5, 7
	beq     .L0im4
	add     3, 3, 6
	add     4, 4, 6
	neg     6, 6
.L0im3:
	lbzx    7, 4, 6
	stbx    7, 3, 6
	addic.  6, 6, 1
	bne     .L0im3
.L0im4:
	blr
	.size   internal_memcpy, .-internal_memcpy

# bzero(dst, len)
#    dst   destination pointer
#    len   length (in bytes)
# Zeroes out 'len' consecutive bytes, beginning at address 'dst'.
	.type   bzero, @function
bzero:
	li      7, 0
	li      11, 7
	andc.   6, 4, 11
	beq     .L0zb2
	add     3, 3, 6
	neg     6, 6
.L0zb1:
	stdx    7, 3, 6
	addic.  6, 6, 8
	bne     .L0zb1
.L0zb2:
	andi.   6, 4, 7
	beq     .L0zb4
	add     3, 3, 6
	neg     6, 6
.L0zb3:
	stbx    7, 3, 6
	addic.  6, 6, 1
	bne     .L0zb3
.L0zb4:
	blr
	.size   bzero, .-bzero

	.align  3
	.type   iv512, @object
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
	.size   iv512, .-iv512

# crypto_hash_shabal512_ppc64eb(out, in, len)
#    out   output buffer
#    in    input data
#    len   input data length (in bytes)
#
	.globl  crypto_hash_shabal512_ppc64eb
	.section   ".opd","aw"
	.align  3
crypto_hash_shabal512_ppc64eb:
	.quad   .L.crypto_hash_shabal512_ppc64eb,.TOC.@tocbase,0
	.previous
	.align  2
	.type   crypto_hash_shabal512_ppc64eb, @function
.L.crypto_hash_shabal512_ppc64eb:
	stdu    1, -352(1)
	mflr    0
	std     28, 48(1)
	std     29, 56(1)
	std     30, 64(1)
	std     0, 368(1)

	# Conventions:
	#    r28   output buffer
	#    r29   input data
	#    r30   input data length
	# State words are at address r1+80
	# Buffer for the final block begins at offset r1+288
	mr      28, 3
	mr      29, 4
	mr      30, 5

	# Initialize the state words.
	addi    3, 1, 80
	bl      .L0h1
.L0h1:
	mflr    4
	addi    4, 4, iv512 - .L0h1
	li      5, 184
	bl      internal_memcpy

	# Process full blocks.
	addi    3, 1, 80
	mr      4, 29
	srdi    5, 30, 6
	cmpldi  5, 0
	beq     .L0h2
	sldi    6, 5, 6
	add     29, 29, 6
	sub     30, 30, 6
	bl      shabal_inner

.L0h2:
	# Pad last block.
	addi    3, 1, 288
	mr      4, 29
	mr      5, 30
	bl      internal_memcpy
	addi    3, 1, 288
	li      6, 0x80
	stbux   6, 3, 30
	addi    3, 3, 1
	subfic  4, 30, 63
	bl      bzero

	# Process last block and finalize.
	li      30, 4
.L0h3:
	addi    3, 1, 80
	addi    4, 1, 288
	li      5, 1
	bl      shabal_inner
	ld      7, 256(1)
	rotldi  7, 7, 32
	addi    7, 7, -1
	rotldi  7, 7, 32
	std     7, 256(1)
	addic.  30, 30, -1
	bne     .L0h3

	# Copy C words to output (with byteswapping).
	addi    3, 1, 192
	li      6, 64
.L0h4:
	addic.  6, 6, -4
	lwbrx   7, 3, 6
	stwx    7, 28, 6
	bne     .L0h4

	# Return.
	li      3, 0
	ld      28, 48(1)
	ld      29, 56(1)
	ld      30, 64(1)
	ld      0, 368(1)
	addi    1, 1, 352
	mtlr    0
	blr
	.size   crypto_hash_shabal512_ppc64eb, .-crypto_hash_shabal512_ppc64eb
