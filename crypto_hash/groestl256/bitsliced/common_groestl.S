
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


.ifndef COMMON_GROESTL_S
COMMON_GROESTL_S:


.data

// Set 16-byte alignment
.p2align 4


// Note: Required for sbox macro in common_sbox.s
ONE:	.octa 0xffffffffffffffffffffffffffffffff

// Mask and shuffle control words for conversion from standard to bitsliced representation
SWAPM:	.octa 0xffffffffffffffff0000000000000000
KEEPM:	.octa 0x0000000000000000ffffffffffffffff
SHUFM1:	.octa 0x00080109020a030b040c050d060e070f
SHUFM2:	.octa 0x080009010a020b030c040d050e060f07
EXTRM:	.octa 0x01010101010101010101010101010101

// Modified shuffle control words for slice_block_v2 macro
SHUFM1_V2:	.octa 0x000102030405060708090a0b0c0d0e0f
SHUFM2_V2:	.octa 0x010003020504070609080b0a0d0c0f0e

// Mask and shuffle control words for conversion from bitsliced to standard representation
ASMBL_SHUFM1: .octa 0x00020406080a0c0e01030507090b0d0f
ASMBL_SHUFM2: .octa 0x01030507090b0d0f00020406080a0c0e

// Masks and shuffle control words for ShiftBytes (shift distances 1, 2, and 4)
MDST1:	.octa 0x0000ffff0000ffff0000ffff0000ffff
MDST2:	.octa 0x00000000ffffffff00000000ffffffff
SBM:	.octa 0x0f0e0d0c0b0a09080607040502030001

// PSHUFB mask for MixBytes (for rotating state by one column)
MBM:	.octa 0x0d0c0b0a090807060504030201000f0e

// Mask for extracting Q state from bitsliced representation
QSEXTRM:	.octa 0x55555555555555555555555555555555


// Uninitialized data

// Temporary storage for MixBytes (for a single XMM register)
.lcomm TMP, 16



.text


//-----------------------------------------------------------------------
// Extract a specific bit from the correctly formatted standard
// representation into a row-wise bitsliced representation.
// x0-x3: Formatted standard representation, containing the byte
//        sequence 00-3f of the input block in the following order:
//        x0: 00 20 01 21 02 22 03 23 04 24 05 25 06 26 07 27
//        x1: 08 28 90 29 0a 2a 0b 2b 0c 2c 0d 2d 0e 2e 0f 2f
//        x2: 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37
//        x3: 18 38 19 39 1a 3a 1b 3b 1c 3c 1d 3d 1e 3e 1f 3f
// t0: Temporary register.
// r0: Result register for the extracted bit.
// srdist: The distance to shift the input registers right, which
//         indicates the bit position of the bit to extract (0 for LSB,
//         7 for MSB)
// offset: Indicates to which position in the bitsliced representation
//         the result should be written. If offset is 1, the result
//         will be written to the P-state position, if offset is 0,
//         the result will be written to the Q-state position.
// EXTRM: Mask for extracting the LSB of each byte of an XMM register.
// Output in r0
//-----------------------------------------------------------------------
.macro extract_bit x0, x1, x2, x3, t0, r0, srdist, offset, EXTRM

movaps	\x0, \t0
psrlw	$\srdist, \t0
andps	\EXTRM, \t0
psllw	$6+\offset, \t0
movaps	\t0, \r0

movaps	\x1, \t0
psrlw	$\srdist, \t0
andps	\EXTRM, \t0
psllw	$4+\offset, \t0
orps	\t0, \r0

movaps	\x2, \t0
psrlw	$\srdist, \t0
andps	\EXTRM, \t0
psllw	$2+\offset, \t0
orps	\t0, \r0

movaps	\x3, \t0
psrlw	$\srdist, \t0
andps	\EXTRM, \t0
psllw	$0+\offset, \t0
orps	\t0, \r0

.endm


//-----------------------------------------------------------------------
// Convert block in formatted standard representation to bitsliced 
// representation.
// x0-x3: Input block, containing the bytes of the byte sequence 00-3f of
//        the block in the following way:
//        x0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
//        x1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
//        x2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
//        x3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30
// t0-t3: Temporary registers
// r0-r7: Result registers
// SWAPM, KEEPM, SHUFM1, SHUFM2, EXTRM: Diverse masks and
//   shuffle control words.
// Output in r0-r7 (LSB-MSB)
//-----------------------------------------------------------------------
.macro slice_block x0, x1, x2, x3, t0, t1, t2, t3, r0, r1, r2, r3, r4, r5, r6, r7, offset, SWAPM, KEEPM, SHUFM1, SHUFM2, EXTRM

// x0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
// x1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
// x2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
// x3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30

pshufd	$0x4E, \x2, \x2
pshufd	$0x4E, \x3, \x3

// x0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
// x1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 
// x2: 27 26 25 24 23 22 21 20 2f 2e 2d 2c 2b 2a 29 28 
// x3: 37 36 35 34 33 32 31 30 3f 3e 3d 3c 3b 3a 39 38 


// Note: Could be implemented more efficiently with PBLENDW (SSE 4.1)

movaps	\x0, \t0
movaps	\x1, \t1
movaps	\x2, \t2
movaps	\x3, \t3

andps	\SWAPM, \t0
andps	\SWAPM, \t1
andps	\SWAPM, \t2
andps	\SWAPM, \t3

// t0: 0f 0e 0d 0c 0b 0a 09 08 -- -- -- -- -- -- -- --
// t1: 1f 1e 1d 1c 1b 1a 19 18 -- -- -- -- -- -- -- -- 
// t2: 27 26 25 24 23 22 21 20 -- -- -- -- -- -- -- --
// t3: 37 36 35 34 33 32 31 30 -- -- -- -- -- -- -- -- 

andps	\KEEPM, \x0
andps	\KEEPM, \x1
andps	\KEEPM, \x2
andps	\KEEPM, \x3

// x0: -- -- -- -- -- -- -- -- 07 06 05 04 03 02 01 00
// x1: -- -- -- -- -- -- -- -- 17 16 15 14 13 12 11 10 
// x2: -- -- -- -- -- -- -- -- 2f 2e 2d 2c 2b 2a 29 28
// x3: -- -- -- -- -- -- -- -- 3f 3e 3d 3c 3b 3a 39 38 

orps	\t2, \x0
orps	\t3, \x1
orps	\t0, \x2
orps	\t1, \x3

// x0: 27 26 25 24 23 22 21 20 07 06 05 04 03 02 01 00
// x1: 37 36 35 34 33 32 31 30 17 16 15 14 13 12 11 10
// x2: 0f 0e 0d 0c 0b 0a 09 08 2f 2e 2d 2c 2b 2a 29 28
// x3: 1f 1e 1d 1c 1b 1a 19 18 3f 3e 3d 3c 3b 3a 39 38

pshufb	\SHUFM1, \x0
pshufb	\SHUFM1, \x1
pshufb	\SHUFM2, \x2
pshufb	\SHUFM2, \x3

// x0: 00 20 01 21 02 22 03 23 04 24 05 25 06 26 07 27
// x1: 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37
// x2: 08 28 90 29 0a 2a 0b 2b 0c 2c 0d 2d 0e 2e 0f 2f
// x3: 18 38 19 39 1a 3a 1b 3b 1c 3c 1d 3d 1e 3e 1f 3f


// Extract bit 0 (LSB)

movaps	\x0, \t0
//psrlw	$0, \t0
andps	\EXTRM, \t0
psllw	$6+\offset, \t0
movaps	\t0, \r0

movaps	\x2, \t0
andps	\EXTRM, \t0
psllw	$4+\offset, \t0
orps	\t0, \r0

movaps	\x1, \t0
andps	\EXTRM, \t0
psllw	$2+\offset, \t0
orps	\t0, \r0

movaps	\x3, \t0
andps	\EXTRM, \t0
psllw	$0+\offset, \t0
orps	\t0, \r0

// Cache extract mask for extract_bit macro in register
movdqa	\EXTRM, \t1

extract_bit \x0, \x2, \x1, \x3, \t0, \r1, 1, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r2, 2, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r3, 3, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r4, 4, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r5, 5, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r6, 6, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r7, 7, \offset, \t1

.endm



//-----------------------------------------------------------------------
// Convert block in formatted standard representation to bitsliced 
// representation.
// x0-x3: Input block, containing the bytes of the byte sequence 00-3f of
//        the block in the following way:
//        x0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
//        x1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
//        x2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
//        x3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30
// t0-t3: Temporary registers
// r0-r7: Result registers
// SHUFM1_V2, SHUFM2_V2, EXTRM: Diverse masks and shuffle control words.
// Output in r0-r7 (LSB-MSB)
//-----------------------------------------------------------------------
.macro slice_block_v2 x0, x1, x2, x3, t0, t1, t2, t3, r0, r1, r2, r3, r4, r5, r6, r7, offset, SHUFM1_V2, SHUFM2_V2, EXTRM

// x0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
// x1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
// x2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
// x3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30

movaps	\x0, \t0
movaps	\x1, \t1

punpcklbw	\x2, \x0

// x0: 27 07 26 06 25 05 24 04 23 03 22 02 21 01 20 00

punpcklbw	\x3, \x1

// x1: 37 17 36 16 35 15 34 14 33 13 32 12 31 11 30 10

punpckhbw	\t0, \x2

// x2: 0f 2f 0e 2e 0d 2d 0c 2c 0b 2b 0a 2a 09 29 08 28

punpckhbw	\t1, \x3

// x3: 1f 3f 1e 3e 1d 3d 1c 3c 1b 3b 1a 3a 19 39 18 38


// x0: 27 07 26 06 25 05 24 04 23 03 22 02 21 01 20 00
// x1: 37 17 36 16 35 15 34 14 33 13 32 12 31 11 30 10
// x2: 0f 2f 0e 2e 0d 2d 0c 2c 0b 2b 0a 2a 09 29 08 28
// x3: 1f 3f 1e 3e 1d 3d 1c 3c 1b 3b 1a 3a 19 39 18 38

pshufb	\SHUFM1_V2, \x0
pshufb	\SHUFM1_V2, \x1
pshufb	\SHUFM2_V2, \x2
pshufb	\SHUFM2_V2, \x3

// x0: 00 20 01 21 02 22 03 23 04 24 05 25 06 26 07 27
// x1: 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37
// x2: 08 28 90 29 0a 2a 0b 2b 0c 2c 0d 2d 0e 2e 0f 2f
// x3: 18 38 19 39 1a 3a 1b 3b 1c 3c 1d 3d 1e 3e 1f 3f


// Extract bit 0 (LSB)

movaps	\x0, \t0
//psrlw	$0, \t0
andps	\EXTRM, \t0
psllw	$6+\offset, \t0
movaps	\t0, \r0

movaps	\x2, \t0
andps	\EXTRM, \t0
psllw	$4+\offset, \t0
orps	\t0, \r0

movaps	\x1, \t0
andps	\EXTRM, \t0
psllw	$2+\offset, \t0
orps	\t0, \r0

movaps	\x3, \t0
andps	\EXTRM, \t0
psllw	$0+\offset, \t0
orps	\t0, \r0

// Cache extract mask for extract_bit macro in register
movdqa	\EXTRM, \t1

extract_bit \x0, \x2, \x1, \x3, \t0, \r1, 1, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r2, 2, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r3, 3, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r4, 4, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r5, 5, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r6, 6, \offset, \t1
extract_bit \x0, \x2, \x1, \x3, \t0, \r7, 7, \offset, \t1

.endm




//-----------------------------------------------------------------------
// Take a bitsliced representation and assemble 16 bytes from it into
// standard representation.
// x0-x7: Row-wise bitsliced representation (x0: LSB, x7: MSB)
// t0: Temporary register
// r0: Result register, where the 16 assembled bytes are written
// bitpos: The bitposition of the bytes to assemble within the
//         bitsliced representation (in range from 7 to 0). If bitpos is
//         odd, then a part of the P state is asssembled, if bitpos is
//         even, a part of the Q state is assembled. Depending on the 
//         concrete value, the following bytes are extracted:
//         bitpos == 7:
//         r0: 00 20 01 21 02 22 03 23 04 24 05 25 06 26 07 27 (P state)
//         bitpos == 6:
//         r0: 00 20 01 21 02 22 03 23 04 24 05 25 06 26 07 27 (Q state)
//         bitpos == 5:
//         r0: 08 28 90 29 0a 2a 0b 2b 0c 2c 0d 2d 0e 2e 0f 2f (P state)
//         bitpos == 4:
//         r0: 08 28 90 29 0a 2a 0b 2b 0c 2c 0d 2d 0e 2e 0f 2f (Q state)
//         bitpos == 3:
//         r0: 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37 (P state)
//         bitpos == 2:
//         r0: 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37 (Q state)
//         bitpos == 1:
//         r0: 18 38 19 39 1a 3a 1b 3b 1c 3c 1d 3d 1e 3e 1f 3f (P state)
//         bitpos == 0:
//         r0: 18 38 19 39 1a 3a 1b 3b 1c 3c 1d 3d 1e 3e 1f 3f (Q state)
// EXTRM: Mask for extracting the LSB of each byte of an XMM register.
// Output in r0
//-----------------------------------------------------------------------
.macro assemble_bytes x0, x1, x2, x3, x4, x5, x6, x7, t0, r0, bitpos, EXTRM

movaps	\x0, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
//psllw	$0, \t0
movaps	\t0, \r0

movaps	\x1, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$1, \t0
orps	\t0, \r0

movaps	\x2, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$2, \t0
orps	\t0, \r0

movaps	\x3, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$3, \t0
orps	\t0, \r0

movaps	\x4, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$4, \t0
orps	\t0, \r0

movaps	\x5, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$5, \t0
orps	\t0, \r0

movaps	\x6, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$6, \t0
orps	\t0, \r0

movaps	\x7, \t0
psrlw	$\bitpos, \t0
andps	\EXTRM, \t0
psllw	$7, \t0
orps	\t0, \r0

.endm


//-----------------------------------------------------------------------
// Take a bitsliced representation (containing both P state and Q state)
// and assemble either the P state or Q state into a formatted standard
// representation as indicated below. In this representation, the
// respective state can be written directly to memory with movdqa/movdqu
// instructions, resulting in the standard byte sequence representation
// in memory.
// x0-x7: Row-wise bitsliced representation (x0: LSB, x7: MSB)
// t0-t1: Temporary registers
// r0-r3: Result registers, receiving the assembled state in the
//        following format:
//        r0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
//        r1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
//        r2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
//        r3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30
// offset: If set to 1, the P state is assembled, if set to 0, the
//         Q state is assembled.
// SWAPM, KEEPM, ASMBL_SHUFM1, ASMBL_SHUFM2, EXTRM: Diverse masks and
//   shuffle control words.
// Output in r0-r3
//-----------------------------------------------------------------------
.macro assemble_block x0, x1, x2, x3, x4, x5, x6, x7, t0, t1, r0, r1, r2, r3, offset, SWAPM, KEEPM, ASMBL_SHUFM1, ASMBL_SHUFM2, EXTRM

// Cache extract mask for assemble_bytes macro in register
movdqa	\EXTRM, \t1

assemble_bytes \x0, \x1, \x2, \x3, \x4, \x5, \x6, \x7, \t0, \r0, 6+\offset, \t1
assemble_bytes \x0, \x1, \x2, \x3, \x4, \x5, \x6, \x7, \t0, \r2, 4+\offset, \t1
assemble_bytes \x0, \x1, \x2, \x3, \x4, \x5, \x6, \x7, \t0, \r1, 2+\offset, \t1
assemble_bytes \x0, \x1, \x2, \x3, \x4, \x5, \x6, \x7, \t0, \r3, 0+\offset, \t1

// r0: 00 20 01 21 02 22 03 23 04 24 05 25 06 26 07 27
// r1: 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37
// r2: 08 28 90 29 0a 2a 0b 2b 0c 2c 0d 2d 0e 2e 0f 2f
// r3: 18 38 19 39 1a 3a 1b 3b 1c 3c 1d 3d 1e 3e 1f 3f

pshufb	\ASMBL_SHUFM1, \r0
pshufb	\ASMBL_SHUFM1, \r1
pshufb	\ASMBL_SHUFM2, \r2
pshufb	\ASMBL_SHUFM2, \r3

// r0: 27 26 25 24 23 22 21 20 07 06 05 04 03 02 01 00
// r1: 37 36 35 34 33 32 31 30 17 16 15 14 13 12 11 10
// r2: 0f 0e 0d 0c 0b 0a 09 08 2f 2e 2d 2c 2b 2a 29 28
// r3: 1f 1e 1d 1c 1b 1a 19 18 3f 3e 3d 3c 3b 3a 39 38

movaps	\r0, \x0
movaps	\r2, \x1
movaps	\r1, \x2
movaps	\r3, \x3

// x0: 27 26 25 24 23 22 21 20 07 06 05 04 03 02 01 00
// x1: 0f 0e 0d 0c 0b 0a 09 08 2f 2e 2d 2c 2b 2a 29 28
// x2: 37 36 35 34 33 32 31 30 17 16 15 14 13 12 11 10
// x3: 1f 1e 1d 1c 1b 1a 19 18 3f 3e 3d 3c 3b 3a 39 38

andps	\SWAPM, \x0
andps	\SWAPM, \x1
andps	\SWAPM, \x2
andps	\SWAPM, \x3

// x0: 27 26 25 24 23 22 21 20 -- -- -- -- -- -- -- --
// x1: 0f 0e 0d 0c 0b 0a 09 08 -- -- -- -- -- -- -- --
// x2: 37 36 35 34 33 32 31 30 -- -- -- -- -- -- -- --
// x3: 1f 1e 1d 1c 1b 1a 19 18 -- -- -- -- -- -- -- --

andps	\KEEPM, \r0
andps	\KEEPM, \r1
andps	\KEEPM, \r2
andps	\KEEPM, \r3

// r0: -- -- -- -- -- -- -- -- 07 06 05 04 03 02 01 00
// r1: -- -- -- -- -- -- -- -- 17 16 15 14 13 12 11 10
// r2: -- -- -- -- -- -- -- -- 2f 2e 2d 2c 2b 2a 29 28
// r3: -- -- -- -- -- -- -- -- 3f 3e 3d 3c 3b 3a 39 38

orps	\x1, \r0
orps	\x3, \r1
orps	\x0, \r2
orps	\x2, \r3

// r0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
// r1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
// r2: 27 26 25 24 23 22 21 20 2f 2e 2d 2c 2b 2a 29 28
// r3: 37 36 35 34 33 32 31 30 3f 3e 3d 3c 3b 3a 39 38

pshufd	$0x4E, \r2, \r2
pshufd	$0x4E, \r3, \r3

// r0: 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
// r1: 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10
// r2: 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20
// r3: 3f 3e 3d 3c 3b 3a 39 38 37 36 35 34 33 32 31 30

.endm




//-----------------------------------------------------------------------
// Groestl ShiftBytes for a single bitsliced register.
// Requires SSSE3
// x0: Bitsliced input register
// t0: Temporary value
// r0: Result register
// Output in r0
//-----------------------------------------------------------------------
.macro ShiftBytes_v2 x0, t0, r0, MDST1, MDST2, SBM

// Shift distance 1
movaps	\x0, \t0
andps	\MDST1, \t0
movaps	\t0, \r0
xorps	\t0, \x0
psrlw	$14, \r0
psllw	$2, \t0
orps	\t0, \r0
orps	\x0, \r0

// Shift distance 2
movaps	\r0, \t0
andps	\MDST2, \t0
xorps	\t0, \r0
movaps	\t0, \x0
psllw	$4, \t0
psrlw	$12, \x0
orps	\t0, \r0
orps	\x0, \r0

// Shift distance 4
pshufb	\SBM, \r0

.endm


//-----------------------------------------------------------------------
// Groestl ShiftBytes for a single bitsliced register.
// Requires SSE4.1
// x0: Bitsliced input register
// t0: Temporary value
// r0: Result register
// Output in r0
//-----------------------------------------------------------------------
.macro ShiftBytes_SSE41 x0, t0, r0, SBM

// Shift distance 1
pblendw	$0x55, \x0, \t0
movaps	\t0, \r0
psrlw	$14, \t0
psllw	$2, \r0
orps	\r0, \t0
pblendw	$0x55, \t0, \x0

// Shift distance 2
pblendw	$0x33, \x0, \t0
movaps	\t0, \r0
psrlw	$12, \t0
psllw	$4, \r0
orps	\t0, \r0
pblendw	$0xCC, \x0, \r0

// Shift distance 4
pshufb	\SBM, \r0

.endm



//-----------------------------------------------------------------------
// Groestl MixBytes
// x0-x7: Bitsliced input (LSB-MSB)
// t0-t7: Temporary values
// MBM: Byte shuffe control word
// TMP: Temporary storage
// Output in t0-t7 (LSB-MSB)
//-----------------------------------------------------------------------
.macro MixBytes_v2 x0, x1, x2, x3, x4, x5, x6, x7, t0, t1, t2, t3, t4, t5, t6, t7, MBM, TMP

// Put i+2 into t
// Keep x7 in place
// i+2
pshufd	$0x93, \x6, \t6
movaps	\t6, \t7
pshufd	$0x93, \x5, \t5
xorps	\t5, \t6
pshufd	$0x93, \x4, \t4
xorps	\t4, \t5
pshufd	$0x93, \x3, \t3
xorps	\t3, \t4
pshufd	$0x93, \x2, \t2
xorps	\t2, \t3
pshufd	$0x93, \x1, \t1
xorps	\t1, \t2
pshufd	$0x93, \x0, \t0
xorps	\t0, \t1
pshufd	$0x93, \x7, \x7
xorps	\x7, \t0
xorps	\x7, \t1
xorps	\x7, \t3
xorps	\x7, \t4
xorps	\x7, \t7

// Restore x7 to i
pshufd	$0x39, \x7, \x7

// i
// Switch to i+4
xorps	\x0, \t1
pshufd	$0x4E, \x0, \x0
xorps	\x1, \t2
pshufd	$0x4E, \x1, \x1
xorps	\x2, \t3
pshufd	$0x4E, \x2, \x2
xorps	\x3, \t4
pshufd	$0x4E, \x3, \x3
xorps	\x4, \t5
pshufd	$0x4E, \x4, \x4
xorps	\x5, \t6
pshufd	$0x4E, \x5, \x5
xorps	\x6, \t7
pshufd	$0x4E, \x6, \x6
xorps	\x7, \t0
xorps	\x7, \t1
xorps	\x7, \t3
xorps	\x7, \t4
pshufd	$0x4E, \x7, \x7

// i+4
// Switch to i+6
xorps	\x0, \t0
xorps	\x0, \t2
pshufd	$0x93, \x0, \x0
xorps	\x1, \t1
xorps	\x1, \t3
pshufd	$0x93, \x1, \x1
xorps	\x2, \t2
xorps	\x2, \t4
pshufd	$0x93, \x2, \x2
xorps	\x3, \t3
xorps	\x3, \t5
pshufd	$0x93, \x3, \x3
xorps	\x4, \t4
xorps	\x4, \t6
pshufd	$0x93, \x4, \x4
xorps	\x5, \t5
xorps	\x5, \t7
pshufd	$0x93, \x5, \x5
xorps	\x6, \t0
xorps	\x6, \t1
xorps	\x6, \t3
xorps	\x6, \t4
xorps	\x6, \t6
pshufd	$0x93, \x6, \x6
xorps	\x7, \t1
xorps	\x7, \t2
xorps	\x7, \t4
xorps	\x7, \t5
xorps	\x7, \t7
pshufd	$0x93, \x7, \x7

// i+6
// Switch to i+7
xorps	\x0, \t0
xorps	\x0, \t2

// Cache PSHUFB mask
pshufb	\MBM, \x0
movdqa	\x0, \TMP
movdqa	\MBM, \x0

xorps	\x1, \t1
xorps	\x1, \t3
pshufb	\x0, \x1
xorps	\x2, \t2
xorps	\x2, \t4
pshufb	\x0, \x2
xorps	\x3, \t3
xorps	\x3, \t5
pshufb	\x0, \x3
xorps	\x4, \t4
xorps	\x4, \t6
pshufb	\x0, \x4
xorps	\x5, \t5
xorps	\x5, \t7
pshufb	\x0, \x5
xorps	\x6, \t0
xorps	\x6, \t1
xorps	\x6, \t3
xorps	\x6, \t4
xorps	\x6, \t6
pshufb	\x0, \x6
xorps	\x7, \t1
xorps	\x7, \t2
xorps	\x7, \t4
xorps	\x7, \t5
xorps	\x7, \t7
pshufb	\x0, \x7

// Restore register
movdqa	\TMP, \x0


// i+7
// Switch to i+1
//xorps	\x0, \t0
//xorps	\x0, \t1
//xorps	\x0, \t2
//pshufd	$0x93, \x0, \x0
//xorps	\x1, \t1
//xorps	\x1, \t2
//xorps	\x1, \t3
//pshufd	$0x93, \x1, \x1
//xorps	\x2, \t2
//xorps	\x2, \t3
//xorps	\x2, \t4
//pshufd	$0x93, \x2, \x2
//xorps	\x3, \t3
//xorps	\x3, \t4
//xorps	\x3, \t5
//pshufd	$0x93, \x3, \x3
//xorps	\x4, \t4
//xorps	\x4, \t5
//xorps	\x4, \t6
//pshufd	$0x93, \x4, \x4
//xorps	\x5, \t5
//xorps	\x5, \t6
//xorps	\x5, \t7
//pshufd	$0x93, \x5, \x5
//xorps	\x6, \t0
//xorps	\x6, \t1
//xorps	\x6, \t3
//xorps	\x6, \t4
//xorps	\x6, \t6
//xorps	\x6, \t7
//pshufd	$0x93, \x6, \x6
//xorps	\x7, \t0
//xorps	\x7, \t2
//xorps	\x7, \t3
//xorps	\x7, \t5
//xorps	\x7, \t7
//pshufd	$0x93, \x7, \x7

// OPTIMIZATION: Reuse common triple-term in i+7
// i+7
// Switch to i+1

// Prepare t3 for reuse of common triple-term with t2
xorps	\t2, \t3

xorps	\x1, \t1
xorps	\x1, \t2
//xorps	\x1, \t3
pshufd	$0x93, \x1, \x1
xorps	\x2, \t2
//xorps	\x2, \t3
xorps	\x2, \t4
pshufd	$0x93, \x2, \x2
xorps	\x3, \t3
xorps	\x3, \t4
xorps	\x3, \t5
pshufd	$0x93, \x3, \x3
xorps	\x4, \t4
xorps	\x4, \t5
xorps	\x4, \t6
pshufd	$0x93, \x4, \x4
xorps	\x5, \t5
xorps	\x5, \t6
xorps	\x5, \t7
pshufd	$0x93, \x5, \x5
xorps	\x6, \t0
xorps	\x6, \t1
xorps	\x6, \t3
xorps	\x6, \t4
xorps	\x6, \t6
xorps	\x6, \t7
pshufd	$0x93, \x6, \x6
xorps	\x7, \t0
xorps	\x7, \t2
//xorps	\x7, \t3

// Add common triple-term to t3
xorps	\t2, \t3

xorps	\x0, \t0
xorps	\x0, \t1
xorps	\x0, \t2
pshufd	$0x93, \x0, \x0

xorps	\x7, \t5
xorps	\x7, \t7
pshufd	$0x93, \x7, \x7


// i+1
// Switch to i+3
xorps	\x0, \t1
pshufd	$0x93, \x0, \x0
xorps	\x1, \t2
pshufd	$0x93, \x1, \x1
xorps	\x2, \t3
pshufd	$0x93, \x2, \x2
xorps	\x3, \t4
pshufd	$0x93, \x3, \x3
xorps	\x4, \t5
pshufd	$0x93, \x4, \x4
xorps	\x5, \t6
pshufd	$0x93, \x5, \x5
xorps	\x6, \t7
pshufd	$0x93, \x6, \x6
xorps	\x7, \t0
xorps	\x7, \t1
xorps	\x7, \t3
xorps	\x7, \t4
pshufd	$0x93, \x7, \x7

// i+3
// Switch to i+5
xorps	\x0, \t2
pshufd	$0x93, \x0, \x0
xorps	\x1, \t3
pshufd	$0x93, \x1, \x1
xorps	\x2, \t4
pshufd	$0x93, \x2, \x2
xorps	\x3, \t5
pshufd	$0x93, \x3, \x3
xorps	\x4, \t6
pshufd	$0x93, \x4, \x4
xorps	\x5, \t7
pshufd	$0x93, \x5, \x5
xorps	\x6, \t0
xorps	\x6, \t1
xorps	\x6, \t3
xorps	\x6, \t4
pshufd	$0x93, \x6, \x6
xorps	\x7, \t1
xorps	\x7, \t2
xorps	\x7, \t4
xorps	\x7, \t5
pshufd	$0x93, \x7, \x7

// i+5
xorps	\x0, \t0
xorps	\x0, \t1
xorps	\x1, \t2
xorps	\x2, \t3
xorps	\x3, \t4
xorps	\x4, \t5
xorps	\x5, \t6
xorps	\x6, \t7
xorps	\x7, \t0
xorps	\x1, \t1
xorps	\x2, \t2
xorps	\x3, \t3
xorps	\x4, \t4
xorps	\x5, \t5
xorps	\x6, \t6
xorps	\x7, \t7
xorps	\x7, \t1
xorps	\x7, \t3
xorps	\x7, \t4

.endm


.endif
