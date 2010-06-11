
//--------------------------------------------------------------------------\\
// Bit-sliced implementation of Groestl-256 for AMD64/Intel 64              \\
// Author: Stefan Tillich (Stefan.Tillich@iaik.tugraz.at)                   \\
//--------------------------------------------------------------------------\\
// (c) 2009, TU Graz. This file is received from TU Graz for evaluation and \\
// scientific purposes only. The recipient will not modify or distribute    \\
// this implementation of Groestl without the prior consent of TU-Graz. The \\
// recipient is aware that any commercial use requires commercial licensing \\
// from TU Graz or SIC. Additionally, the recipient agrees to put a link to \\
// TU-Graz-IAIK's research web [1] on any publication that is produced from \\
// results using the source code.                                           \\
//                                                                          \\
// [1] http://www.iaik.tugraz.at/content/research/                          \\
//--------------------------------------------------------------------------\\


#include "config.h"


// Include macros for SubBytes from Emilia Käsper
//.include "common_sbox.S"
// Include optimized SubBytes from Emilia Käsper & Peter Schwabe
.include "common_sbox_v2.S"

// Include data and macros for the other Groestl round transformations
// and conversion to and from bitsliced representation.
.include "common_groestl.S"


.data

// Set 16-byte alignment
.p2align 4

// Mask for switching endianness of the 8-byte block count for padding
// (optimized version)
ENDIANM:	.octa 0x0f0f0f0f0f0f0f0f0001020304050607

// Uninitialized data

// Storage for bitsliced chaining value
.lcomm H, 128

// Storage for a complete message block in standard representation.
// Used for holding padded blocks.
.lcomm PADBLK, 64



.text

//
// int crypto_hash_groestl256_bitsliced(unsigned char *out, const unsigned char *in, unsigned long long inlen)
//

#ifdef TARGET_LIN64

// Function naming (symbol name stays at it is) and calling convention
// for 64-bit Linux (AMD64 ABI calling convention)

.globl crypto_hash_groestl256_bitsliced
crypto_hash_groestl256_bitsliced:

// -------------------------------------------------------------------
// AMD64 ABI calling convention
// For details see http://www.x86-64.org/documentation/abi.pdf
// -------------------------------------------------------------------
// Parameters passed in:
// rdi
// rsi
// rdx
// rcx
// r8
// r9
// xmm0-7
//
// Return value put in:
// rax
// rdx
//
// Callee saved registers:
// rbx
// rbp
// r12-r15
// -------------------------------------------------------------------

//
// Parameters:
// %rdi: Address for writing the message digest
// %rsi: Address of input message
// %rdx: Number of bytes of the input message
//
// Results/effects:
// The message digest is written at (%rdi)
// Return value: 0 if hashing was successful, a negative value if an error occurred
//

//
// Temporary values in registers:
// %rax: For various temporary values
// %rbp: Pointer into PADBLK during padding
// %r12: Indicates processing mode for Groestl compression function 
//       (0 - normal, 1 - final block, 2 - penultimate block, 3 - output transformation)
// %r13: The message block count
// %r14: Pointer to current round constants (used in Groestl rounds)
//

// Save callee-saved (volatile) registers
pushq	%rbx
pushq	%rbp
pushq	%r12
pushq	%r13
pushq	%r14
//pushq	%r15


#else


// Function naming (symbol name is prepended with underscore) and 
// calling convention for 64-bit Windows (Windows x64 64-bit 
// calling convention)

.globl _crypto_hash_groestl256_bitsliced
_crypto_hash_groestl256_bitsliced:

// -------------------------------------------------------------------
// Windows x64 64-bit calling convention
// For details see http://msdn.microsoft.com/en-us/library/ms794533.aspx
// -------------------------------------------------------------------
// Integer parameters passed in:
// rcx
// rdx
// r8
// r9
// 
// Return value put in:
// rax
//
// Callee-saved registers:
// rdi
// rsi
// rbx
// rbp
// rsp
// r12-r15
// xmm6-xmm15
// -------------------------------------------------------------------

// Function prolog: Save callee-saved registers
// Note: At entry, the stack pointer (%rsp) is only 8-byte aligned. After
// pushing the nine general-purpose registers (see below) %rsp will again
// be 16-byte aligned (as required for saving the XMM registers with an
// aligned move).
pushq	%rdi
pushq	%rsi
pushq	%rbx
pushq	%rbp
pushq	%rsp
pushq	%r12
pushq	%r13
pushq	%r14
pushq	%r15

subq	$160, %rsp
movdqa	%xmm6, 144(%rsp)
movdqa	%xmm7, 128(%rsp)
movdqa	%xmm8, 112(%rsp)
movdqa	%xmm9, 96(%rsp)
movdqa	%xmm10, 80(%rsp)
movdqa	%xmm11, 64(%rsp)
movdqa	%xmm12, 48(%rsp)
movdqa	%xmm13, 32(%rsp)
movdqa	%xmm14, 16(%rsp)
movdqa	%xmm15, (%rsp)

// Move input paramters where the AMD64 ABI calling convention expects them
movq	%rcx, %rdi
movq	%rdx, %rsi
movq	%r8, %rdx

#endif


// Load the IV as initial chaining value into H
movdqa	IV256, %xmm0
movdqa	%xmm0, H
movdqa	IV256+16, %xmm0
movdqa	%xmm0, H+16
movdqa	IV256+32, %xmm0
movdqa	%xmm0, H+32
movdqa	IV256+48, %xmm0
movdqa	%xmm0, H+48
movdqa	IV256+64, %xmm0
movdqa	%xmm0, H+64
movdqa	IV256+80, %xmm0
movdqa	%xmm0, H+80
movdqa	IV256+96, %xmm0
movdqa	%xmm0, H+96
movdqa	IV256+112, %xmm0
movdqa	%xmm0, H+112


// Start in "normal" processing mode
mov		$0x00, %r12

// Initialize message block count
mov		$0, %r13


msgblk_loop:

// Check if we have another full block available
cmp		$64, %rdx
jge		process_full_block


// We don't have a full block, we need to pad

// Hold pointer into PADBLK in %rbp throughout padding
mov		$PADBLK, %rbp

// Fill PADBLK with all zero
pandn	%xmm0, %xmm0
movdqa	%xmm0, PADBLK
movdqa	%xmm0, PADBLK+16
movdqa	%xmm0, PADBLK+32
movdqa	%xmm0, PADBLK+48


// Process the rest of the input message

// OPTIMIZATION: Unroll writing of quadwords for remaining message into PADBLK

//cmp		$8, %rdx
//jl		pad_no_msg_quadwords
//movq	(%rsi), %rax
//movq	%rax, (%rbp)
//cmp		$16, %rdx
//jl		pad_no_msg_quadwords
//movq	8(%rsi), %rax
//movq	%rax, 8(%rbp)
//cmp		$24, %rdx
//jl		pad_no_msg_quadwords
//movq	16(%rsi), %rax
//movq	%rax, 16(%rbp)
//cmp		$32, %rdx
//jl		pad_no_msg_quadwords
//movq	24(%rsi), %rax
//movq	%rax, 24(%rbp)
//cmp		$48, %rdx
//jl		pad_no_msg_quadwords
//movq	32(%rsi), %rax
//movq	%rax, 32(%rbp)
//cmp		$56, %rdx
//jl		pad_no_msg_quadwords
//movq	48(%rsi), %rax
//movq	%rax, 48(%rbp)

// As long as possible, write quadwords (8 bytes) of the message
pad_write_msg_quadwords:
cmp		$8, %rdx
jl		pad_no_msg_quadwords
movq	(%rsi), %rax
movq	%rax, (%rbp)
addq	$8, %rsi
addq	$8, %rbp
subq	$8, %rdx
jmp		pad_write_msg_quadwords

// END OPTIMIZATION


// Process the rest of the message as individual bytes
pad_no_msg_quadwords:
cmp		$0, %rdx
pad_write_msg_bytes:
jle		pad_write_80_byte
mov		(%rsi), %al
mov		%al, (%rbp)
inc		%rsi
inc		%rbp
dec		%rdx
jmp		pad_write_msg_bytes


// Write the 0x80 byte (this must always work, as we don't have a
// full block)
pad_write_80_byte:
movb	$0x80, (%rbp)
inc		%rbp


// Check whether we can fit the 8-byte block count into the padded block
pad_check_size:
mov		$PADBLK+56, %rax
cmp		%rax, %rbp
jg		hash_penultimate_block


// We can fit in the block count into the current block:
// Just pad out the current block as final block:  Pad with the number of 
// blocks (8 bytes)

mov		$PADBLK+56, %rbp


// OPTIMIZATION: Simplify writing of block count in last padded block

pad_add_block_count:
// Note: The block count is contained in %r13 (needs to be incremented 
// to include the final block)
//inc		%r13
//mov		%r13, %rax
//rol		$8, %rax
//mov		%al, 0(%rbp)
//rol		$8, %rax
//mov		%al, 1(%rbp)
//rol		$8, %rax
//mov		%al, 2(%rbp)
//rol		$8, %rax
//mov		%al, 3(%rbp)
//rol		$8, %rax
//mov		%al, 4(%rbp)
//rol		$8, %rax
//mov		%al, 5(%rbp)
//rol		$8, %rax
//mov		%al, 6(%rbp)
//rol		$8, %rax
//mov		%al, 7(%rbp)

//pad_add_block_count:
// Note: The block count is contained in %r13 (needs to be incremented 
// to include the final block)
movdqa	ENDIANM, %xmm1
inc		%r13
movq	%r13, %xmm0
pshufb	%xmm1, %xmm0
movq	%xmm0, PADBLK+56

// END OPTIMIZATION


// Indicate that the final block is being processed in %r12, then
// enter the normal Groestl compression function
mov		$PADBLK, %rsi
mov		$0x01, %r12
jmp		process_full_block


// Take care of the penultimate block:
// Indicate that the penultimate block is being processed in
// %r12, then enter the normal Groestl compression function
hash_penultimate_block:
mov		$PADBLK, %rsi
mov		$0x02, %r12
jmp		process_full_block





// Process a full 64-byte message block (possibly padded) with the Groestl
// compression function
process_full_block:


// Load message block into %xmm0-%xmm3
#ifdef INPUT_ALIGNMENT_16

movdqa	(%rsi), %xmm0
movdqa	16(%rsi), %xmm1
movdqa	32(%rsi), %xmm2
movdqa	48(%rsi), %xmm3

#else

movdqu	(%rsi), %xmm0
movdqu	16(%rsi), %xmm1
movdqu	32(%rsi), %xmm2
movdqu	48(%rsi), %xmm3

#endif


// %xmm0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
// %xmm1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
// %xmm2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
// %xmm3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30

// Transform state to bitsliced representation stored in %xmm8-%xmm15 (P-state position)
# OPTIMIZATION: Optimize slice_block macro with PUNPCKHBW & PUNPCKLBW (macro slice_block_v2)
#slice_block %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, 1, SWAPM, KEEPM, SHUFM1, SHUFM2, EXTRM
slice_block_v2 %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, 1, SHUFM1_V2, SHUFM2_V2, EXTRM

# END OPTIMIZATION


// Perform input chaining (h xor m) and combine the input to P permutation and
// Q permutation in a single bitsliced state in %xmm8-%xmm15
movdqa	H, %xmm0
xorps	%xmm8, %xmm0
psrlw	$1, %xmm8
orps	%xmm0, %xmm8

movdqa	H+16, %xmm0
xorps	%xmm9, %xmm0
psrlw	$1, %xmm9
orps	%xmm0, %xmm9

movdqa	H+32, %xmm0
xorps	%xmm10, %xmm0
psrlw	$1, %xmm10
orps	%xmm0, %xmm10

movdqa	H+48, %xmm0
xorps	%xmm11, %xmm0
psrlw	$1, %xmm11
orps	%xmm0, %xmm11

movdqa	H+64, %xmm0
xorps	%xmm12, %xmm0
psrlw	$1, %xmm12
orps	%xmm0, %xmm12

movdqa	H+80, %xmm0
xorps	%xmm13, %xmm0
psrlw	$1, %xmm13
orps	%xmm0, %xmm13

movdqa	H+96, %xmm0
xorps	%xmm14, %xmm0
psrlw	$1, %xmm14
orps	%xmm0, %xmm14

movdqa	H+112, %xmm0
xorps	%xmm15, %xmm0
psrlw	$1, %xmm15
orps	%xmm0, %xmm15


// Note: For the output transformation, the block 'x' still resides in %xmm8-%xmm15
perform_output_transformation:


// Initialize address to round constants in %r14
mov		$RCONSTS, %r14
// Initialize round counter
mov		$10, %rbx


// Round loop
round_loop:

// State is in %xmm8-%xmm15


// OPTIMIZATION: Optimize addition of round constant

// Add round constant
//xorps	  0(%r14), %xmm8
//xorps	 16(%r14), %xmm9
//xorps	 32(%r14), %xmm10
//xorps	 48(%r14), %xmm11
//xorps	 64(%r14), %xmm12
//xorps	 80(%r14), %xmm13
//xorps	 96(%r14), %xmm14
//xorps	112(%r14), %xmm15

// Note: As the round counter never goes above 9 (i.e. (00001001)bin), the
// bitsliced round constants for the four most significant bits never change.
xorps	 0(%r14), %xmm8
xorps	16(%r14), %xmm9
xorps	32(%r14), %xmm10
xorps	48(%r14), %xmm11
movdqa	64(%r14), %xmm0
xorps	%xmm0, %xmm12
xorps	%xmm0, %xmm13
xorps	%xmm0, %xmm14
xorps	%xmm0, %xmm15

// END OPTIMIZATION



// Adjust pointer to round constants
add		$128, %r14

// SubBytes
sbox %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7 

// State (output of SubBytes) in %xmm8, %xmm9, %xmm12, %xmm14, %xmm11, %xmm15, %xmm10, %xmm13


#ifdef SSSE3

// ShiftBytes (SSSE3)
ShiftBytes_v2 %xmm8, %xmm7, %xmm0, MDST1, MDST2, SBM
movdqa	MDST1, %xmm8
ShiftBytes_v2 %xmm9, %xmm7, %xmm1, %xmm8, MDST2, SBM
movdqa	MDST2, %xmm9
ShiftBytes_v2 %xmm10, %xmm7, %xmm2, %xmm8, %xmm9, SBM
movdqa	SBM, %xmm10
ShiftBytes_v2 %xmm11, %xmm7, %xmm3, %xmm8, %xmm9, %xmm10
ShiftBytes_v2 %xmm12, %xmm7, %xmm4, %xmm8, %xmm9, %xmm10
ShiftBytes_v2 %xmm13, %xmm7, %xmm5, %xmm8, %xmm9, %xmm10
ShiftBytes_v2 %xmm14, %xmm7, %xmm6, %xmm8, %xmm9, %xmm10
ShiftBytes_v2 %xmm15, %xmm14, %xmm7, %xmm8, %xmm9, %xmm10

#else

// ShiftBytes (SSE4.1)
ShiftBytes_SSE41 %xmm8, %xmm7, %xmm0, SBM
movdqa	SBM, %xmm8
ShiftBytes_SSE41 %xmm9, %xmm7, %xmm1, %xmm8
ShiftBytes_SSE41 %xmm10, %xmm7, %xmm2, %xmm8
ShiftBytes_SSE41 %xmm11, %xmm7, %xmm3, %xmm8
ShiftBytes_SSE41 %xmm12, %xmm7, %xmm4, %xmm8
ShiftBytes_SSE41 %xmm13, %xmm7, %xmm5, %xmm8
ShiftBytes_SSE41 %xmm14, %xmm7, %xmm6, %xmm8
ShiftBytes_SSE41 %xmm15, %xmm14, %xmm7, %xmm8

#endif


// State in %xmm0, %xmm1, %xmm4, %xmm6, %xmm3, %xmm7, %xmm2, %xmm5

// MixBytes
MixBytes_v2 %xmm0, %xmm1, %xmm4, %xmm6, %xmm3, %xmm7, %xmm2, %xmm5, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, MBM, TMP

// State in %xmm8-%xmm15

// Decrement round counter
dec		%rbx

jnz round_loop


// Skip the chaining step for the output transformation
cmp		$0x03, %r12
je		write_message_digest




// Extract result of Q permutation and add it to result of P permutation
// Extract Q state into %xmm0-%xmm7

// OPTIMIZATION: Cache extraction mask for Q state at output chaining

//movaps	%xmm8,  %xmm0
//movaps	%xmm9,  %xmm1
//movaps	%xmm10, %xmm2
//movaps	%xmm11, %xmm3
//movaps	%xmm12, %xmm4
//movaps	%xmm13, %xmm5
//movaps	%xmm14, %xmm6
//movaps	%xmm15, %xmm7
//andps	QSEXTRM, %xmm0
//andps	QSEXTRM, %xmm1
//andps	QSEXTRM, %xmm2
//andps	QSEXTRM, %xmm3
//andps	QSEXTRM, %xmm4
//andps	QSEXTRM, %xmm5
//andps	QSEXTRM, %xmm6
//andps	QSEXTRM, %xmm7

movdqa	QSEXTRM, %xmm0
movaps	%xmm0, %xmm1
movaps	%xmm0, %xmm2
movaps	%xmm0, %xmm3
movaps	%xmm0, %xmm4
movaps	%xmm0, %xmm5
movaps	%xmm0, %xmm6
movaps	%xmm0, %xmm7
andps	%xmm8,  %xmm0
andps	%xmm9,  %xmm1
andps	%xmm10, %xmm2
andps	%xmm11, %xmm3
andps	%xmm12, %xmm4
andps	%xmm13, %xmm5
andps	%xmm14, %xmm6
andps	%xmm15, %xmm7

// END OPTIMIZATION



// Set Q state to all zero in bitsliced representation
xorps	%xmm0, %xmm8
xorps	%xmm1, %xmm9
xorps	%xmm2, %xmm10
xorps	%xmm3, %xmm11
xorps	%xmm4, %xmm12
xorps	%xmm5, %xmm13
xorps	%xmm6, %xmm14
xorps	%xmm7, %xmm15
// Shift Q state into P-state position
psllw	$1, %xmm0
psllw	$1, %xmm1
psllw	$1, %xmm2
psllw	$1, %xmm3
psllw	$1, %xmm4
psllw	$1, %xmm5
psllw	$1, %xmm6
psllw	$1, %xmm7
// Add result of P and Q permutation
xorps	%xmm0, %xmm8
xorps	%xmm1, %xmm9
xorps	%xmm2, %xmm10
xorps	%xmm3, %xmm11
xorps	%xmm4, %xmm12
xorps	%xmm5, %xmm13
xorps	%xmm6, %xmm14
xorps	%xmm7, %xmm15

// Update chaining value
xorps	H, %xmm8
movdqa	%xmm8, H
xorps	H+16, %xmm9
movdqa	%xmm9, H+16
xorps	H+32, %xmm10
movdqa	%xmm10, H+32
xorps	H+48, %xmm11
movdqa	%xmm11, H+48
xorps	H+64, %xmm12
movdqa	%xmm12, H+64
xorps	H+80, %xmm13
movdqa	%xmm13, H+80
xorps	H+96, %xmm14
movdqa	%xmm14, H+96
xorps	H+112, %xmm15
movdqa	%xmm15, H+112


// Increment message block count
inc		%r13

// Adjust pointer to input message and message byte count
subq	$64, %rdx
addq	$64, %rsi


// Check what to do next

cmp		$0x00, %r12
je		msgblk_loop
cmp		$0x02, %r12
je		process_final_block
cmp		$0x01, %r12
je		output_transformation


// We just processed the penultimate block
// -> Create the padded final block
process_final_block:
pandn	%xmm0, %xmm0
movdqa	%xmm0, PADBLK
movdqa	%xmm0, PADBLK+16
movdqa	%xmm0, PADBLK+32
movdqa	%xmm0, PADBLK+48
mov		$PADBLK+56, %rbp
jmp		pad_add_block_count


// We just processed the final block
// -> Do the output transformation
output_transformation:
mov		$0x03, %r12
jmp		perform_output_transformation


// P(x) of the output transformation has been calculated. Finish up with:
// - Perform P(x) + x
// - Transform bitsliced representation back to standard representation
// - Write the message digest to memory
// - Indicate success of hashing with the function's return value
write_message_digest:

// Perform P(x) + x
xorps	H, %xmm8
xorps	H+16, %xmm9
xorps	H+32, %xmm10
xorps	H+48, %xmm11
xorps	H+64, %xmm12
xorps	H+80, %xmm13
xorps	H+96, %xmm14
xorps	H+112, %xmm15


// Transform bitsliced representation back to standard representation
assemble_block %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm4, %xmm5, %xmm0, %xmm1, %xmm2, %xmm3, 1, SWAPM, KEEPM, ASMBL_SHUFM1, ASMBL_SHUFM2, EXTRM


// Write the message digest to memory
#ifdef OUTPUT_ALIGNMENT_16

movdqa	%xmm2, (%rdi)
movdqa	%xmm3, 16(%rdi)

#else

movdqu	%xmm2, (%rdi)
movdqu	%xmm3, 16(%rdi)

#endif


// Indicate success of hashing with the function's return value
// Note: Identical for both 64-bit Linux and Windows
mov		$0, %rax

// Restore callee-saved registers
#ifdef TARGET_LIN64

//popq	%r15
popq	%r14
popq	%r13
popq	%r12
popq	%rbp
popq	%rbx

#else

movdqa	144(%rsp), %xmm6
movdqa	128(%rsp), %xmm7
movdqa	112(%rsp), %xmm8
movdqa	 96(%rsp), %xmm9
movdqa	 80(%rsp), %xmm10
movdqa	 64(%rsp), %xmm11
movdqa	 48(%rsp), %xmm12
movdqa	 32(%rsp), %xmm13
movdqa	 16(%rsp), %xmm14
movdqa	   (%rsp), %xmm15
addq	$160, %rsp

popq	%r15
popq	%r14
popq	%r13
popq	%r12
popq	%rsp
popq	%rbp
popq	%rbx
popq	%rsi
popq	%rdi

#endif


ret

