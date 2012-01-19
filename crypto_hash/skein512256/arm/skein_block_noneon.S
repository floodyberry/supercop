/*
  Skein block functions in ARMv7 assembly code.

  Implemented according to ``The Skein Hash Function Family'' version 1.3

  Changes:
    2011-11-13: Included constants in code size.
    2011-11-13: Implemented Skein-512.
    2011-07-09: Made code ARMv5TE compatible.
    2011-07-09: Implemented Skein-256.

  Author: Håkon Haugdal Hitland <haakhi@gmail.com>
  Year: 2011

  The author waives all copyright and related or neighbouring rights to
  this code to the extent possible under law.
  Anyone may use, redistribute and modify this code in any way and for any
  purpose, without restrictions.
  This software is distributed without any warranty. No guarantee is given
  for its correctness.
*/



#ifdef SKEIN_THUMB
	.arch armv6t2
	.thumb
#else
	.arch armv5te
#endif
	.syntax unified
	.altmacro
	.text

#ifndef SKEIN_USE_ASM
#define SKEIN_USE_ASM (256+512)
#endif

#if SKEIN_USE_ASM & 1024
#error Skein-1024 not implemented.
#endif

SKEIN_KS_C240_LOW = 0xA9FC1A22
SKEIN_KS_C240_HIGH = 0x1BD11BDA
SKEIN_T1_FIRST_FLAG = (126 - 64)

/* rotation constants for Skein */
RC_256_0_0  = 14
RC_256_0_1  = 16

RC_256_1_0  = 52
RC_256_1_1  = 57

RC_256_2_0  = 23
RC_256_2_1  = 40

RC_256_3_0  =  5
RC_256_3_1  = 37

RC_256_4_0  = 25
RC_256_4_1  = 33

RC_256_5_0  = 46
RC_256_5_1  = 12

RC_256_6_0  = 58
RC_256_6_1  = 22

RC_256_7_0  = 32
RC_256_7_1  = 32


RC_512_0_0  = 46
RC_512_0_1  = 36
RC_512_0_2  = 19
RC_512_0_3  = 37

RC_512_1_0  = 33
RC_512_1_1  = 27
RC_512_1_2  = 14
RC_512_1_3  = 42

RC_512_2_0  = 17
RC_512_2_1  = 49
RC_512_2_2  = 36
RC_512_2_3  = 39

RC_512_3_0  = 44
RC_512_3_1  =  9
RC_512_3_2  = 54
RC_512_3_3  = 56

RC_512_4_0  = 39
RC_512_4_1  = 30
RC_512_4_2  = 34
RC_512_4_3  = 24

RC_512_5_0  = 13
RC_512_5_1  = 50
RC_512_5_2  = 10
RC_512_5_3  = 17

RC_512_6_0  = 25
RC_512_6_1  = 29
RC_512_6_2  = 39
RC_512_6_3  = 43

RC_512_7_0  =  8
RC_512_7_1  = 35
RC_512_7_2  = 56
RC_512_7_3  = 22


CTX_TWEAK_OFS = 8


/* Quarter of a 64-bit rotate + xor -- equal sides */
.macro rot_eor1 dest, reg1, reg2, rotation
	.if \rotation < 32
	eor \dest, \reg1, \reg2, lsl \rotation
	.elseif \rotation > 32
	eor \dest, \reg1, \reg2, lsr 64 - \rotation
	.endif
	/* Drop if == 32 */
.endm

/* Quarter of a 64-bit rotate + xor -- opposing sides */
.macro rot_eor2 dest, reg1, reg2, rotation
	.if \rotation < 32
	eor \dest, \reg1, \reg2, lsr 32 - \rotation
	.else
	eor \dest, \reg1, \reg2, lsl \rotation - 32
	.endif
.endm


#if SKEIN_USE_ASM & 256

/*
 * Basic double-MIX round.
 * The instructions are arranged for dual-issuing, doing the MIX computations
 * in parallel.
 * r1:r0 and r5:r4 holds v0 and v2.
 * r3:r2 and r7:r6 are alternatingly v1 and v3.
 */
.macro S256_RoundBase round, even0_0, even0_1, even1_0, even1_1, rot0, rot1
	adds \even0_0, r2

	adc \even0_1, r3 /* v0 / v2 -> even0 */
	adds \even1_0, r6

	rot_eor2 r8, \even0_1, r2, RC_256_\round\()_\rot0
	adc \even1_1, r7 /* v2 / v0 -> even1 */

	rot_eor1 r2, \even0_0, r2, RC_256_\round\()_\rot0
	rot_eor2 r9, \even1_1, r6, RC_256_\round\()_\rot1

	rot_eor2 r2, r2, r3, RC_256_\round\()_\rot0
	rot_eor1 r6, \even1_0, r6, RC_256_\round\()_\rot1

	rot_eor1 r3, r8, r3, RC_256_\round\()_\rot0 /* v1/v3 -> r3:r2 */
	rot_eor2 r6, r6, r7, RC_256_\round\()_\rot1

	rot_eor1 r7, r9, r7, RC_256_\round\()_\rot1 /* v3/v1 -> r7:r6 */
.endm

/*
 * Round seven has rotation constants of 32, which saves a cycle on the
 * rotation. One could probably save another cycle by alternatingly running
 * 8 mirrored rounds with r2<->r3, r6<->r7 swapped.
 */
.macro S256_Round7
	adds r4, r2

	adc r5, r3 /* v0 / v2 -> r5:r4 */
	adds r0, r6

	eor r8, r4, r3
	adc r1, r7 /* v2 / v0 -> r1:r0 */

	eor r3, r2, r5
	eor r9, r0, r7

	mov r2, r8 /* v1/v3 -> r3:r2 */
	eor r7, r6, r1

	mov r6, r9 /* v3/v1 -> r7:r6 */
.endm

.macro S256_Round round
	/* Separate odd and even rounds */
	.if \round == 7
	S256_Round7 /* Special case round 7 */
	.elseif \round && 1
	S256_RoundBase \round, r4, r5, r0, r1, 1, 0
	.else
	S256_RoundBase \round, r0, r1, r4, r5, 0, 1
	.endif
.endm

.macro S256_InjectKey subkey
/* Calculate tweak and key addresses */
TWEAK1_ADR = S256_SOFS_TWEAKSCHED + 8 * ((\subkey + 1) % 3)
KEY0_ADR = S256_SOFS_KEYSCHED + 8 * ((\subkey) % 5)
KEY1_ADR = S256_SOFS_KEYSCHED + 8 * ((\subkey + 1) % 5)
KEY2_ADR = S256_SOFS_KEYSCHED + 8 * ((\subkey + 2) % 5)
KEY3_ADR = S256_SOFS_KEYSCHED + 8 * ((\subkey + 3) % 5)

	/* t0 is left in r11:r10 from previous key round */
	ldr r8, [sp, KEY0_ADR]

	ldr r9, [sp, KEY0_ADR + 4]
	adds r2, r10

	ldr r10, [sp, KEY1_ADR]
	adc r3, r11 /* v1 += t0 */

	ldr r11, [sp, KEY1_ADR + 4] /* k0,k1 -> r9:r8, r11:r10 */
	adds r0, r8

	ldr r8, [sp, KEY2_ADR]
	adc r1, r9 /* v0 += k0 */

	ldr r9, [sp, KEY2_ADR + 4]
	adds r2, r10

	ldr r10, [sp, KEY3_ADR]
	adc r3, r11 /* v1 += k1 */

	ldr r11, [sp, KEY3_ADR + 4] /* k2,k3 -> r9:r8, r11:r10 */
	adds r4, r8

	adc r5, r9 /* v2 += k2 */
	adds r6, r10

	adc r7, r11 /* v3 += k3 */
	ldr r10, [sp, TWEAK1_ADR]

	ldr r11, [sp, TWEAK1_ADR + 4] /* t1 -> r11:r10 */
	adds r6, \subkey

	adc r7, 0 /* v4 += s */
	adds r4, r10

	adc r5, r11 /* v3 += t1 */
.endm

.macro S256_Four_Rounds round
	S256_Round %((\round + 0) % 8)
	S256_Round %((\round + 1) % 8)
	S256_Round %((\round + 2) % 8)
	S256_Round %((\round + 3) % 8)

	S256_InjectKey %(\round / 4 + 1)
.endm

/* Stack offsets */
S256_SOFS_KEYSCHED = 0
S256_SOFS_TWEAKSCHED = S256_SOFS_KEYSCHED + (8 * 5)
S256_SOFS_CTX = S256_SOFS_TWEAKSCHED + (8 * 3)
S256_SOFS_BLKPTR = S256_SOFS_CTX + 4
S256_SOFS_BLKCNT = S256_SOFS_BLKPTR + 4
S256_SOFS_BYTECNTADD = S256_SOFS_BLKCNT + 4

/* Constants */
.S256C_C240:
	.word SKEIN_KS_C240_LOW, SKEIN_KS_C240_HIGH

/* void Skein_256_Process_Block(Skein_256_Ctxt_t *ctx, const u08b_t *blkPtr, size_t blkCnt, size_t byteCntAdd); */
/*
 * Register usage:
 * r0-r7: State v0-v3
 * r8-r11: Temporary registers, keys, plaintext, etc.
 * r12, Temporary values, addresses, blkPtr.
 *
 * Stack contents:
 * S256_SOFS_KEYSCHED (5 * 8): Key schedule k0-k4
 * S256_SOFS_TWEAKSCHED (3 * 8): Tweak schedule t0-t2
 * S256_SOFS_CTX (1 * 4): Pointer to tweak and state
 * S256_SOFS_BLKPTR (1 * 4): Pointer to plaintext
 * S256_SOFS_BLKCNT (1 * 4): Remaining block counter
 * S256_SOFS_BYTECNTADD (1 * 4): byteCntAdd
 */

	.balign 8
	.global Skein_256_Process_Block
#ifdef SKEIN_THUMB
	.thumb_func
#endif
Skein_256_Process_Block:
	add r0, CTX_TWEAK_OFS
	push {r0-r11}
	sub sp, 8 * (5 + 3) /* Locate space for tweak and key schedules */

	ldm r0!, {r8-r11} /* t0,t1 -> r8-r11 */
	ldm r0, {r0-r7} /* k0-k3 -> r0-r7 */

0:
	/* Calculate and store tweaks */
	ldr r12, [sp, S256_SOFS_BYTECNTADD] /* byteCntAdd -> r6 */
	str r10, [sp, S256_SOFS_TWEAKSCHED + 8]
	str r11, [sp, S256_SOFS_TWEAKSCHED + 12] /* Store t1 */
	adds r8, r12
	str r8, [sp, S256_SOFS_TWEAKSCHED]
	adc r9, 0 /* t0 += byteCntAdd */
	str r9, [sp, S256_SOFS_TWEAKSCHED + 4] /* Store t0 */
	eor r8, r10
	eor r9, r11 /* t2 -> r9:r8 */
	str r8, [sp, S256_SOFS_TWEAKSCHED + 16]
	str r9, [sp, S256_SOFS_TWEAKSCHED + 20] /* Store t2 */

	/* Calculate and store key */
	eor r8, r0, r2
	eor r9, r1, r3
	eor r8, r4
	ldr r10, .S256C_C240
	add r12, sp, S256_SOFS_KEYSCHED
	ldr r11, .S256C_C240 + 4 /* C240 -> r11:r10 */
	eor r9, r5
	eor r8, r6
	eor r9, r7
	eor r8, r10
	eor r9, r11 /* k4 -> r9:r8 */
	ldr r11, [sp, S256_SOFS_BLKPTR] /* blkPtr -> r11; Prepare for reading plaintext */
	stm r12, {r0-r9} /* Store k0-k4 */

	/* Initial key injection */
	/* Add plaintext */
	mov r12, r11
	ldr r8, [r11, 0]
	ldr r9, [r11, 4]
	ldr r10, [r11, 8]
	adds r0, r8
	ldr r11, [r11, 12] /* p0,p1 -> r8-r11 */
	adc r1, r9
	ldr r8, [r12, 16]
	adds r2, r10
	ldr r9, [r12, 20]
	adc r3, r11 /* v0,v1 += p0,p1 */
	ldr r10, [r12, 24]
	adds r4, r8
	ldr r11, [r12, 28] /* p2,p3 -> r8-r11 */
	adc r5, r9
	ldr r8, [sp, S256_SOFS_TWEAKSCHED]
	adds r6, r10
	ldr r9, [sp, S256_SOFS_TWEAKSCHED + 4]
	adc r7, r11 /* v2,v3 += p2,p3 */
	ldr r10, [sp, S256_SOFS_TWEAKSCHED + 8]
	adds r2, r8
	ldr r11, [sp, S256_SOFS_TWEAKSCHED + 12]
	adc r3, r9 /* v1 += t0 */
	adds r4, r10
	adc r5, r11 /* v2 += t1 */

	/* Do 72 MIX rounds */
	.irp round, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68
	S256_Four_Rounds \round
	.endr

	/* Xor state with plaintext to get new key */
	ldr r8, [r12]
	ldr r9, [r12, 4]
	ldr r10, [r12, 8]
	eor r0, r8
	ldr r11, [r12, 12] /* p0,p1 -> r8-r11 */
	eor r1, r9
	ldr r8, [r12, 16]
	eor r2, r10
	ldr r9, [r12, 20]
	eor r3, r11 /* v0,v1 ^= p0,p1 */
	ldr r10, [r12, 24]
	eor r4, r8
	ldr r11, [r12, 28]
	eor r5, r9
	add r12, 32 /* blkPtr += 32 */
	eor r6, r10
	str r12, [sp, S256_SOFS_BLKPTR] /* Store new blkPtr */
	eor r7, r11 /* v2,v3 ^= p2,p2 */

	/* Load tweaks */
	ldr r12, [sp, S256_SOFS_BLKCNT] /* blkCnt -> r12 */
	ldrd r10, r11, [sp, S256_SOFS_TWEAKSCHED + 8]
	ldrd r8, r9, [sp, S256_SOFS_TWEAKSCHED] /* t0,t1 -> r8-r11 */
	bic r11, 1 << (SKEIN_T1_FIRST_FLAG - 32) /* Clear 'first' flag from t1 */

	/* Loop if more blocks */
	subs r12, 1
	str r12, [sp, S256_SOFS_BLKCNT]
	bne 0b


	/* Done, save tweak and key */
	ldr r12, [sp, S256_SOFS_CTX]
	stm r12!, {r8-r11} /* Store tweak */
	stm r12, {r0-r7} /* Store key */

	add sp, 4*4 + 8 * (5 + 3)
	pop {r4-r11}
	bx lr

#ifdef SKEIN_CODE_SIZE
/* size_t  Skein_256_Process_Block_CodeSize(void);
*/
	.global Skein_256_Process_Block_CodeSize
#ifdef SKEIN_THUMB
	.thumb_func
#endif
Skein_256_Process_Block_CodeSize:
	ldr r0, .S256_CODE_SIZE
	bx lr

.S256_CODE_SIZE:
	.word Skein_256_Process_Block_CodeSize - .S256C_C240

	.global Skein_256_Unroll_Cnt
#ifdef SKEIN_THUMB
	.thumb_func
#endif
Skein_256_Unroll_Cnt:
	mov r0, 0
	bx lr
#endif
#endif /* 256 */


#if SKEIN_USE_ASM & 512

/*
 * Basic double-MIX round.
 * The instructions are arranged for dual-issuing, doing the MIX computations
 * in parallel.
 */
.macro S512_RoundBase round, a0_0, a0_1, a1_0, a1_1, b0_0, b0_1, b1_0, b1_1, arot, brot, interl1, interl2, interl3, interl4, interl5, interl6, interl7, interl8
	adds \a0_0, \a1_0

	\interl1
	adc \a0_1, \a1_1
	adds \b0_0, \b1_0
	\interl2

	\interl3
	rot_eor2 r12, \a0_1, \a1_0, RC_512_\round\()_\arot
	adc \b0_1, \b1_1
	\interl4

	\interl5
	rot_eor1 \a1_0, \a0_0, \a1_0, RC_512_\round\()_\arot
	rot_eor2 r14, \b0_1, \b1_0, RC_512_\round\()_\brot
	\interl6

	\interl7
	rot_eor2 \a1_0, \a1_0, \a1_1, RC_512_\round\()_\arot
	rot_eor1 \b1_0, \b0_0, \b1_0, RC_512_\round\()_\brot
	\interl8

	rot_eor1 \a1_1, r12, \a1_1, RC_512_\round\()_\arot
	rot_eor2 \b1_0, \b1_0, \b1_1, RC_512_\round\()_\brot

	rot_eor1 \b1_1, r14, \b1_1, RC_512_\round\()_\brot
.endm

/*
 * Do four rounds of Skein 512 and run a key injection
 *
 * Conceptually, a full round of Skein-512 transforms the values in-place
 * like this:
 *
 * |v0|v1| |v2|v3| |v4|v5| |v6|v7|
 *  v   v   v   v   v   v   v   v
 * |v6|v1| |v0|v7| |v2|v5| |v4|v3|
 *
 * The rounds run staggered:
 * round 0 with v0-v3, round 1 with v0-v1 v6-v7,
 * round 0 with v4-v7, round 1 with v2-v5
 * round 2 with v0-v3, round 3 with v0-v1 v6-v7,
 * round 2 with v4-v7, round 3 with v2-v5
 *
 * The values start out as follows:
 * v0 -> reg1:reg0
 * v1 -> reg3:reg2
 * v2 -> reg5:reg4
 * v3 -> reg7:reg6
 * v4 -> reg9:reg8
 * v5 -> TMP0
 * v6 -> reg11:reg10
 * v7 -> TMP1
 */
.macro S512_Four_Rounds round, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, TMP0, TMP1, TMP2, TMP3
	/* Round 0 for v0, v1, v2, v3 */
	S512_RoundBase %((\round + 0) % 8), reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, 0, 1
	/* v0d1 -> reg5:reg4, v1d1 -> reg3:reg2,
	   v6d1 -> reg1:reg0, v7d1 -> reg7:reg6 */

	/* Round 1 for v0, v1, v6, v7 */
	S512_RoundBase %((\round + 1) % 8), reg4, reg5, reg2, reg3, reg0, reg1, reg6, reg7, 0, 3, < str reg4, [sp, TMP3] >, < str reg5, [sp, TMP3 + 4] >, < str reg0, [sp, TMP2] >, <str reg1, [sp, TMP2 + 4]>, < ldr reg5, [sp, TMP0 + 4] >, < ldr reg4, [sp, TMP0] >, <ldr reg1, [sp, TMP1 + 4]>, <ldr reg0, [sp, TMP1] >
	/* v4d2 -> reg1:reg0 -> TMP2, v6d2 -> reg5:reg4 -> TMP3,
	   v1d2 -> reg3:reg2, v3d2 -> reg7:reg6 */
	/* v5d0 -> reg5:reg4, v7d0 -> reg1:reg0 */

	/* Round 0 for v4, v5, v6, v7 */
	S512_RoundBase %((\round + 0) % 8), reg8, reg9, reg4, reg5, reg10, reg11, reg0, reg1, 2, 3
	/* v2d1 -> reg9:reg8, v3d1 -> reg1:reg0,
	   v4d1 -> reg11:reg10, v5d1 -> reg5:reg4 */

	/* Round 1 for v2, v3, v4, v5 */
	S512_RoundBase %((\round + 1) % 8), reg8, reg9, reg0, reg1, reg10, reg11, reg4, reg5, 1, 2
	/* v0d2 -> reg9:reg8, v2d2 -> reg11:reg10,
	   v5d2 -> reg5:reg4, v7d2 -> reg1:reg0 */

	/* Round 2 for v0, v1, v2, v3 */
	S512_RoundBase %((\round + 2) % 8), reg8, reg9, reg2, reg3, reg10, reg11, reg6, reg7, 0, 1
	/* v0d3 -> reg11:reg10, v1d3 -> reg3:reg2,
	   v6d3 -> reg9:reg8, v7d3 -> reg7:reg6 */

	/* Round 3 for v0, v1, v6, v7 */
	S512_RoundBase %((\round + 3) % 8), reg10, reg11, reg2, reg3, reg8, reg9, reg6, reg7, 0, 3, < str reg10, [sp, TMP1] >, < str reg11, [sp, TMP1 + 4] >, < str reg8, [sp, TMP0] >, <str reg9, [sp, TMP0 + 4]>, < ldr reg11, [sp, TMP3 + 4] >, < ldr reg10, [sp, TMP3] >, <ldr reg9, [sp, TMP2 + 4]>, <ldr reg8, [sp, TMP2] >
	/* v4d4 -> reg9:reg8 -> TMP0, v6d4 -> reg11:reg10 -> TMP1,
	   v1d4 -> reg3:reg2, v3d4 -> reg7:reg6 */
	/* v4d2 -> reg9:reg8, v6d2 -> reg11:reg10 */

	/* Round 2 for v4, v5, v6, v7 */
	S512_RoundBase %((\round + 2) % 8), reg8, reg9, reg4, reg5, reg10, reg11, reg0, reg1, 2, 3
	/* v2d3 -> reg9:reg8, v3d3 -> reg1:reg0,
	   v4d3 -> reg11:reg10, v5d3 -> reg5:reg4 */

	/* Round 3 for v2, v3, v4, v5 */
	S512_RoundBase %((\round + 3) % 8), reg8, reg9, reg0, reg1, reg10, reg11, reg4, reg5, 1, 2
	/* v0d4 -> reg9:reg8, v2d4 -> reg11:reg10,
	   v5d4 -> reg5:reg4, v7d4 -> reg1:reg0 */

	/* Run the key injection */
	S512_InjectKey %(\round / 4 + 1), reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, TMP0, TMP1, TMP2, TMP3
.endm

/*
 * Inject key for Skein 512
 *
 * The values at entry are:
 * v0 -> reg9:reg8
 * v1 -> reg3:reg2
 * v2 -> reg11:reg10
 * v3 -> reg7:reg6
 * v4 -> TMP0
 * v5 -> reg5:reg4
 * v6 -> TMP1
 * v7 -> reg1:reg0
 *
 * At exit:
 * v4 -> reg1:reg0
 * v5 -> TMP2
 * v6 -> reg5:reg4
 * v7 -> TMP3
 * t1 -> r14:r12
 */
.macro S512_InjectKey subkey, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, TMP0, TMP1, TMP2, TMP3
/* Calculate tweak and key addresses */
TWEAK0_ADR = S512_SOFS_TWEAKSCHED + 8 * ((\subkey) % 3)
TWEAK1_ADR = S512_SOFS_TWEAKSCHED + 8 * ((\subkey + 1) % 3)
KEY0_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey) % 9)
KEY1_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 1) % 9)
KEY2_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 2) % 9)
KEY3_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 3) % 9)
KEY4_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 4) % 9)
KEY5_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 5) % 9)
KEY6_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 6) % 9)
KEY7_ADR = S512_SOFS_KEYSCHED + 8 * ((\subkey + 7) % 9)

	ldr r12, [sp, TWEAK0_ADR]

	ldr r14, [sp, TWEAK0_ADR + 4]

	adds reg4, r12
	ldr r12, [sp, KEY5_ADR]

	adc reg5, r14 /* v5 += t0 */
	ldr r14, [sp, KEY5_ADR + 4]

	adds reg4, r12
	ldr r12, [sp, KEY7_ADR]

	adc reg5, r14 /* v5 += k5 */
	ldr r14, [sp, KEY7_ADR + 4]

	adds reg0, r12
	str reg4, [sp, TMP2]

	adc reg1, r14 /* v7 += k7 */
	str reg5, [sp, TMP2 + 4] /* TMP2 <- v5 */

	adds reg0, \subkey
	str reg0, [sp, TMP3]

	add reg0, sp, KEY1_ADR /* point reg0 to k1 */
	ldr r12, [sp, KEY0_ADR]

	adc reg1, 0 /* v7 += s */
	str reg1, [sp, TMP3 + 4] /* TMP3 <- v7 */

	ldr r14, [sp, KEY0_ADR + 4]
	adds reg8, r12

	ldm reg0, {reg0, reg1, reg4, reg5} /* reg1:reg0 <- k1, reg5:reg4 <- k2 */
	adc reg9, r14 /* v0 += k0 */

	adds reg2, reg0
	ldr r12, [sp, KEY3_ADR]

	adc reg3, reg1 /* v1 += k1 */
	ldr r14, [sp, KEY3_ADR + 4]

	adds reg10, reg4
	ldr reg0, [sp, TMP0]

	adc reg11, reg5 /* v2 += k2 */
	ldr reg1, [sp, TMP0 + 4] /* reg1:reg0 <- v4 */

	adds reg6, r12
	ldr r12, [sp, KEY4_ADR]

	ldrd reg4, reg5, [sp, TMP1] /* reg5:reg4 <- v6 */

	adc reg7, r14 /* v3 += k3 */
	ldr r14, [sp, KEY4_ADR + 4]

	adds reg0, r12
	ldr r12, [sp, KEY6_ADR]

	adc reg1, r14 /* v4 += k4 */
	ldr r14, [sp, KEY6_ADR + 4]

	adds reg4, r12
	ldr r12, [sp, TWEAK1_ADR]

	adc reg5, r14 /* v6 += k6 */
	ldr r14, [sp, TWEAK1_ADR + 4]

	adds reg4, r12

	adc reg5, r14 /* v6 += t1 */
.endm

/*
 * Run eight rounds of Skein-512
 * The normal Skein word permutation has a period of four, but the extra swap
 * in the key injection makes it eight.
 */
.macro S512_Eight_Rounds round
	S512_Four_Rounds \round, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, S512_SOFS_TMP0, S512_SOFS_TMP1, S512_SOFS_TMP2, S512_SOFS_TMP3

	S512_Four_Rounds %(\round + 4), r8, r9, r2, r3, r10, r11, r6, r7, r0, r1, r4, r5, S512_SOFS_TMP2, S512_SOFS_TMP3, S512_SOFS_TMP0, S512_SOFS_TMP1
.endm

/* Stack offsets */
S512_SOFS_TMP0 = 0
S512_SOFS_TMP1 = S512_SOFS_TMP0 + 8
S512_SOFS_TMP2 = S512_SOFS_TMP1 + 8
S512_SOFS_TMP3 = S512_SOFS_TMP2 + 8
S512_SOFS_TWEAKSCHED = S512_SOFS_TMP3 + 8
S512_SOFS_KEYSCHED = S512_SOFS_TWEAKSCHED + (8 * 3)
S512_SOFS_CTX = S512_SOFS_KEYSCHED + (8 * 10)
S512_SOFS_BLKPTR = S512_SOFS_CTX + 4
S512_SOFS_BLKCNT = S512_SOFS_BLKPTR + 4
S512_SOFS_BYTECNTADD = S512_SOFS_BLKCNT + 4

/* Constants */
.S512C_C240:
	.word SKEIN_KS_C240_LOW, SKEIN_KS_C240_HIGH

/* void Skein_512_Process_Block(Skein_512_Ctxt_t *ctx, const u08b_t *blkPtr, size_t blkCnt, size_t byteCntAdd); */
/*
 * Register usage:
 * r0-r7: State v0-v3 and misc.
 * r8-r11: State v4,v6 or v5,v7 and misc.
 * r12,r14 Temporary values, addresses and misc.
 *
 * Stack contents:
 * S256_SOFS_TMP0-3 (4 * 8): v4,v6 and v5,v7 when swapped out
 * S256_SOFS_TWEAKSCHED (3 * 8): Tweak schedule t0-t2
 * S256_SOFS_KEYSCHED (10 * 8): Key schedule k0-k8, k0
 * S256_SOFS_CTX (1 * 4): Pointer to tweak and state
 *                        Points to first state word, with tweak at negative
                          offset
 * S256_SOFS_BLKPTR (1 * 4): Pointer to plaintext
 * S256_SOFS_BLKCNT (1 * 4): Remaining block counter
 * S256_SOFS_BYTECNTADD (1 * 4): byteCntAdd
 */

	.balign 4
	.global Skein_512_Process_Block
#ifdef SKEIN_THUMB
	.thumb_func
#endif
Skein_512_Process_Block:
	add r12, r0, CTX_TWEAK_OFS + 16
	add r0, CTX_TWEAK_OFS + 16
	push {r0-r11,r12,r14}
	sub sp, S512_SOFS_CTX /* Allocate space for tweaks, keys and tmp */

	add r14, sp, S512_SOFS_KEYSCHED
	ldr r10, .S512C_C240

	ldm r12, {r0-r9} /* Load k0-k4 */

	/* Store extra k0 */
	strd r0, r1, [sp, S512_SOFS_KEYSCHED + 8*9]

	stm r14, {r0-r9} /* Store k0-k4 */
	eor r0, r2

	eor r1, r3 /* k8 = k1 ^ k2 */
	ldr r11, .S512C_C240 + 4 /* C240 -> r11:r10 */

	eor r0, r10
	ldr r2, [r12, 8*5]

	eor r1, r11 /* k8 = k0 ^ C240 */
	ldr r3, [r12, 8*5 + 4] /* k5 -> r3:r2 */

	eor r0, r4
	ldr r10, [r12, 8*6]

	eor r1, r5 /* k8 ^= k2 */
	ldr r11, [r12, 8*6 + 4] /* k6 -> r11:r10 */

	eor r0, r6
	ldr r4, [r12, 8*7]

	eor r1, r7 /* k8 ^= k3 */
	ldr r5, [r12, 8*7 + 4] /* k7 -> r5:r4 */

	eor r0, r8
	ldr r6, [r12, -16]

	eor r1, r9 /* k8 ^= k4 */
	ldr r7, [r12, -12] /* t0 -> r7:r6 */

	eor r0, r2
	ldr r8, [r12, -8]

	eor r1, r3 /* k8 ^= k5 */
	ldr r9, [r12, -4] /* t1 -> r9:r8 */

	eor r0, r10
	ldr r12, [sp, S512_SOFS_BYTECNTADD]

	eor r1, r11 /* k8 ^= k6 */
	ldr r14, [sp, S512_SOFS_BLKPTR]

	eor r0, r4
	str r8, [sp, S512_SOFS_TWEAKSCHED + 8]

	eor r1, r5 /* k8 ^= k7, k8 done */
	str r9, [sp, S512_SOFS_TWEAKSCHED + 12] /* Store t1 */

	strd r2, r3, [sp, S512_SOFS_KEYSCHED + 8*5] /* Store k5 */

	strd r10, r11, [sp, S512_SOFS_KEYSCHED + 8*6] /* Store k6 */

	/* Jump forward to loop entry point */
	b 1f

0:
	/* Between blocks */
	/*
	 * Current state:
	 * v0 -> r1:r0
	 * v1 -> r3:r2
	 * v2 -> r5:r4
	 * v3 -> r7:r6
	 * v4 -> r9:r8
	 * v5 -> TMP0
	 * v6 -> r11:r10
	 * v7 -> TMP1
	 */

	/* Xor state with plaintext to get new key */
	/* store half of v6 in TMP2 to free some space */
	str r11, [sp, S512_SOFS_TMP2]

	ldr r12, [r14, 0]

	ldr r11, [r14, 4]

	eor r0, r12
	ldr r12, [r14, 8]

	eor r1, r11 /* v0 ^= p0 */
	ldr r11, [r14, 12]

	eor r2, r12
	ldr r12, [r14, 16]

	eor r3, r11 /* v1 ^= p1 */
	ldr r11, [r14, 20]

	eor r4, r12
	ldr r12, [r14, 24]

	eor r5, r11 /* v2 ^= p2 */
	ldr r11, [r14, 28]

	eor r6, r12
	ldr r12, [r14, 32]

	eor r7, r11 /* v3 ^= p3 */
	ldr r11, [r14, 36]

	eor r8, r12
	add r12, sp, S512_SOFS_KEYSCHED

	eor r9, r11 /* v4 ^= p4 */
	ldr r11, [sp, S512_SOFS_TMP2] /* Restore v6 -> r11:r10 */

	stm r12, {r0-r9} /* Store k0-k4 */

	/* Store extra k0 */
	strd r0, r1, [sp, S512_SOFS_KEYSCHED + 8*9]

	/* Current r0-r11 state: k0, k1, k2, k3, k4, v6 */
	/* Calculate k8 -> r1:r0 */
	eor r0, r2

	eor r1, r3 /* k8 = k0 ^ k1 */
	ldr r2, [sp, S512_SOFS_TMP0]

	eor r0, r4
	ldr r3, [sp, S512_SOFS_TMP0 + 4] /* v5 -> r3:r2 */

	eor r1, r5 /* k8 ^= k2 */
	ldr r4, [sp, S512_SOFS_TMP1]

	eor r0, r6
	ldr r5, [sp, S512_SOFS_TMP1 + 4] /* v7 -> r5:r4 */

	eor r1, r7 /* k8 ^= k3 */
	ldr r6, .S512C_C240

	eor r0, r8
	ldr r7, .S512C_C240 + 4 /* C240 -> r7:r6 */

	eor r1, r9 /* k8 ^= k4 */
	ldr r8, [r14, 40]

	eor r0, r6
	ldr r9, [r14, 44] /* p5 -> r9:r8 */

	eor r1, r7 /* k8 ^= C240 */
	ldr r6, [sp, S512_SOFS_TWEAKSCHED]

	eor r2, r8
	ldr r7, [sp, S512_SOFS_TWEAKSCHED + 4] /* t0 -> r7:r6 */

	eor r3, r9 /* v5 ^= p5 */
	ldr r8, [r14, 48]

	eor r0, r2
	ldr r9, [r14, 52] /* p6 -> r9:r8 */

	eor r10, r8
	ldr r8, [r14, 56]

	eor r11, r9 /* v6 ^= p6 */
	ldr r9, [r14, 60] /* p7 -> r9:r8 */

	eor r4, r8
	str r2, [sp, S512_SOFS_KEYSCHED + 8*5]

	eor r5, r9 /* v7 ^= p7 */
	str r3, [sp, S512_SOFS_KEYSCHED + 8*5 + 4] /* Store k5 */

	eor r1, r3 /* k8 ^= k5 */
	ldr r8, [sp, S512_SOFS_TWEAKSCHED + 8]

	eor r0, r10
	ldr r9, [sp, S512_SOFS_TWEAKSCHED + 12] /* t1 -> r9:r8 */

	eor r1, r11 /* k8 ^= k6 */
	str r10, [sp, S512_SOFS_KEYSCHED + 8*6]

	eor r0, r4
	str r11, [sp, S512_SOFS_KEYSCHED + 8*6 + 4] /* Store k6 */

	eor r1, r5 /* k8 ^= k7, k8 done */
	ldr r12, [sp, S512_SOFS_BYTECNTADD] /* byteCntAdd -> r12 */

	add r14, 64 /* blkPtr += 64 */
1:
	str r4, [sp, S512_SOFS_KEYSCHED + 8*7]

	/* Loop entry point at start */
	/* Current r0-r11 state: k8, k5, k7, t0, t1, k6 */
	/* r12: byteCntAdd, r14: blkPtr */
	adds r6, r12
	str r5, [sp, S512_SOFS_KEYSCHED + 8*7 + 4] /* Store k7 */

	adc r7, 0 /* t0 += byteCntAdd */
	str r0, [sp, S512_SOFS_KEYSCHED + 8*8]

	eor r0, r6, r8
	str r1, [sp, S512_SOFS_KEYSCHED + 8*8 + 4] /* Store k8 */

	eor r1, r7, r9 /* t2 -> r1:r0 */
	str r0, [sp, S512_SOFS_TWEAKSCHED + 16]

	adds r2, r6
	str r1, [sp, S512_SOFS_TWEAKSCHED + 20] /* Store t2 */

	/* Current r0-r11 state: t2, k5, k7, t0, t1, k6 */
	/* New key and tweak has been stored.
	 * Time to start the key injection
	 */

	adc r3, r7 /* v5 += t0 */
	str r14, [sp, S512_SOFS_BLKPTR] /* Store updated blkPtr */

	adds r10, r8
	str r6, [sp, S512_SOFS_TWEAKSCHED]

	adc r11, r9 /* v6 += t1 */
	str r7, [sp, S512_SOFS_TWEAKSCHED + 4] /* Store t0 */

	ldr r0, [r14, 8*5]

	ldr r1, [r14, 8*5 + 4] /* p5 -> r1:r0 */

	adds r2, r0
	ldr r6, [r14, 8*7]

	adc r3, r1 /* v5 += p5 */
	ldr r7, [r14, 8*7 + 4] /* p7 -> r7:r6 */

	adds r4, r6
	ldr r8, [r14, 8*6]

	adc r5, r7 /* v7 += p7 */
	ldr r9, [r14, 8*6 + 4] /* p6 -> r9:r8 */

	adds r10, r8
	str r2, [sp, S512_SOFS_TMP0]

	adc r11, r9 /* v6 += p6 */
	str r3, [sp, S512_SOFS_TMP0 + 4] /* v5 -> TMP0 */

	str r4, [sp, S512_SOFS_TMP1]

	str r5, [sp, S512_SOFS_TMP1 + 4] /* v7 -> TMP1 */

	ldm r14, {r0-r9} /* Load p0-p4 */
	/* Current r0-r11 state: p0, p1, p2, p3, p4, k6 */

	ldr r12, [sp, S512_SOFS_KEYSCHED]

	ldr r14, [sp, S512_SOFS_KEYSCHED + 4] /* k0 -> r12:r14 */

	adds r0, r12
	ldr r12, [sp, S512_SOFS_KEYSCHED + 8]

	adc r1, r14 /* v0 += k0 */
	ldr r14, [sp, S512_SOFS_KEYSCHED + 12]  /* k1 -> r12:r14 */

	adds r2, r12
	ldr r12, [sp, S512_SOFS_KEYSCHED + 16]

	adc r3, r14 /* v1 += k1 */
	ldr r14, [sp, S512_SOFS_KEYSCHED + 20]  /* k2 -> r12:r14 */

	adds r4, r12
	ldr r12, [sp, S512_SOFS_KEYSCHED + 24]

	adc r5, r14 /* v2 += k2 */
	ldr r14, [sp, S512_SOFS_KEYSCHED + 28]  /* k3 -> r12:r14 */

	adds r6, r12
	ldr r12, [sp, S512_SOFS_KEYSCHED + 32]

	adc r7, r14 /* v3 += k3 */
	ldr r14, [sp, S512_SOFS_KEYSCHED + 36]  /* k4 -> r12:r14 */

	adds r8, r12

	adc r9, r14 /* v4 += k4 */

	.irp round, 0, 8, 16, 24, 32, 40, 48, 56, 64
	S512_Eight_Rounds \round
	.endr

	ldr r12, [sp, S512_SOFS_BLKCNT]

	/* t1 is left in r14:r12 from last key injection */
	bic r14, 1 << (SKEIN_T1_FIRST_FLAG - 32) /* Clear 'first' flag on t1 */
	str r14, [sp, S512_SOFS_TWEAKSCHED + 12] /* Store t1 */

	ldr r14, [sp, S512_SOFS_BLKPTR] /* blkPtr -> r14 */
	subs r12, 1 /* blkCnt-- */

	str r12, [sp, S512_SOFS_BLKCNT]
	bne 0b

	/* End */
	/*
	 * Current state:
	 * v0 -> r1:r0
	 * v1 -> r3:r2
	 * v2 -> r5:r4
	 * v3 -> r7:r6
	 * v4 -> r9:r8
	 * v5 -> TMP0
	 * v6 -> r11:r10
	 * v7 -> TMP1
	 */
	/* Xor state with plaintext to get new key */

	/* store half of v6 in TMP2 to free some space */
	str r11, [sp, S512_SOFS_TMP2]

	ldr r12, [r14, 0]

	ldr r11, [r14, 4]

	eor r0, r12
	ldr r12, [r14, 8]

	eor r1, r11 /* v0 ^= p0 */
	ldr r11, [r14, 12]

	eor r2, r12
	ldr r12, [r14, 16]

	eor r3, r11 /* v1 ^= p1 */
	ldr r11, [r14, 20]

	eor r4, r12
	ldr r12, [r14, 24]

	eor r5, r11 /* v2 ^= p2 */
	ldr r11, [r14, 28]

	eor r6, r12
	ldr r12, [r14, 32]

	eor r7, r11 /* v3 ^= p3 */
	ldr r11, [r14, 36]

	add r14, 40 /* point blkPtr to p5-p7 */

	eor r8, r12
	ldr r12, [sp, S512_SOFS_CTX] /* ctx key pos -> r12 */

	eor r9, r11 /* v4 ^= p4 */
	ldr r11, [sp, S512_SOFS_TMP2] /* Restore v6 -> r11:r10 */

	stm r12, {r0-r9} /* Store k0-k4 */
	add r0, r12, 8*5 /* ctx v5 pos -> r0 */

	ldm r14, {r2-r5,r12,r14} /* p5 -> r3:r2, p6 -> r5:r4, p7 -> r14:r12 */

	eor r10, r4
	ldr r6, [sp, S512_SOFS_TMP0]

	eor r11, r5 /* v6 ^= p6 */
	ldr r7, [sp, S512_SOFS_TMP0 + 4] /* v5 -> r7:r6 */

	eor r2, r6
	ldr r8, [sp, S512_SOFS_TMP1]

	eor r3, r7 /* p5 ^= v5 */
	ldr r9, [sp, S512_SOFS_TMP1 + 4] /* v7 -> r9:r8 */

	eor r12, r8
	ldr r4, [sp, S512_SOFS_TWEAKSCHED + 12] /* t1 -> r4, highest word only */

	ldrd r6, r7, [sp, S512_SOFS_TWEAKSCHED] /* t0 -> r7:r6 */
	eor r14, r9 /* p7 ^= v7 */

	stm r0, {r2,r3,r10,r11,r12,r14} /* Store k5-k7 */

	strd r6, r7, [r0, -8*5 - 8*2] /* Store t0 */
	str r4, [r0, -8*5 - 4] /* Store t1 (highest word) */

	add sp, S512_SOFS_CTX
	pop {r0-r11,r12,r15} /* Pop and return */


#ifdef SKEIN_CODE_SIZE
/* size_t  Skein_512_Process_Block_CodeSize(void);
*/
	.global Skein_512_Process_Block_CodeSize
#ifdef SKEIN_THUMB
	.thumb_func
#endif
Skein_512_Process_Block_CodeSize:
	ldr r0, .S512_CODE_SIZE
	bx lr

.S512_CODE_SIZE:
	.word Skein_512_Process_Block_CodeSize - .S512C_C240

	.global Skein_512_Unroll_Cnt
#ifdef SKEIN_THUMB
	.thumb_func
#endif
Skein_512_Unroll_Cnt:
	mov r0, 0
	bx lr
#endif
#endif /* 512 */
