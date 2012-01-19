/*
  Skein block functions in ARMv7 assembly code using NEON.
  Optimized for the Cortex-A8 processor.

  Implemented according to ``The Skein Hash Function Family'' version 1.3

  Changes:
    2011-06-24: Released. Skein-256, Skein-512 and Skein-1024 all work.

  Author: Håkon Haugdal Hitland <haakhi@gmail.com>
  Year: 2011

  The author waives all copyright and related or neighbouring rights to
  this code to the extent possible under law.
  Anyone may use, redistribute and modify this code in any way and for any
  purpose, without restrictions.
  This software is distributed without any warranty. No guarantee is given
  for its correctness.
*/


	.arch armv7a
	.fpu neon
	.syntax unified
	.altmacro
	.text

#ifndef SKEIN_USE_ASM
#define SKEIN_USE_ASM (256+512+1024)
#endif

SKEIN_KS_C240_LOW = 0xA9FC1A22
SKEIN_KS_C240_HIGH = 0x1BD11BDA
SKEIN_T1_FIRST_FLAG = (126 - 64)

/* rotation constants for Skein */
RC_256_0_0  = 14
RC_256_0_1  = 16 /**/

RC_256_1_0  = 52
RC_256_1_1  = 57

RC_256_2_0  = 23
RC_256_2_1  = 40 /**/

RC_256_3_0  =  5
RC_256_3_1  = 37

RC_256_4_0  = 25
RC_256_4_1  = 33

RC_256_5_0  = 46
RC_256_5_1  = 12

RC_256_6_0  = 58
RC_256_6_1  = 22

RC_256_7_0  = 32 /**/
RC_256_7_1  = 32 /**/


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
RC_512_3_3  = 56 /**/

RC_512_4_0  = 39
RC_512_4_1  = 30
RC_512_4_2  = 34
RC_512_4_3  = 24 /**/

RC_512_5_0  = 13
RC_512_5_1  = 50
RC_512_5_2  = 10
RC_512_5_3  = 17

RC_512_6_0  = 25
RC_512_6_1  = 29
RC_512_6_2  = 39
RC_512_6_3  = 43

RC_512_7_0  =  8 /**/
RC_512_7_1  = 35
RC_512_7_2  = 56 /**/
RC_512_7_3  = 22


RC_1024_0_0 = 24 /**/
RC_1024_0_1 = 13
RC_1024_0_2 =  8 /**/
RC_1024_0_3 = 47
RC_1024_0_4 =  8 /**/
RC_1024_0_5 = 17
RC_1024_0_6 = 22
RC_1024_0_7 = 37

RC_1024_1_0 = 38
RC_1024_1_1 = 19
RC_1024_1_2 = 10
RC_1024_1_3 = 55
RC_1024_1_4 = 49
RC_1024_1_5 = 18
RC_1024_1_6 = 23
RC_1024_1_7 = 52

RC_1024_2_0 = 33
RC_1024_2_1 =  4
RC_1024_2_2 = 51
RC_1024_2_3 = 13
RC_1024_2_4 = 34
RC_1024_2_5 = 41
RC_1024_2_6 = 59
RC_1024_2_7 = 17

RC_1024_3_0 =  5
RC_1024_3_1 = 20
RC_1024_3_2 = 48 /**/
RC_1024_3_3 = 41
RC_1024_3_4 = 47
RC_1024_3_5 = 28
RC_1024_3_6 = 16 /**/
RC_1024_3_7 = 25

RC_1024_4_0 = 41
RC_1024_4_1 =  9
RC_1024_4_2 = 37
RC_1024_4_3 = 31
RC_1024_4_4 = 12
RC_1024_4_5 = 47
RC_1024_4_6 = 44
RC_1024_4_7 = 30

RC_1024_5_0 = 16 /**/
RC_1024_5_1 = 34
RC_1024_5_2 = 56 /**/
RC_1024_5_3 = 51
RC_1024_5_4 =  4
RC_1024_5_5 = 53
RC_1024_5_6 = 42
RC_1024_5_7 = 41

RC_1024_6_0 = 31
RC_1024_6_1 = 44
RC_1024_6_2 = 47
RC_1024_6_3 = 46
RC_1024_6_4 = 19
RC_1024_6_5 = 42
RC_1024_6_6 = 44
RC_1024_6_7 = 25

RC_1024_7_0 =  9
RC_1024_7_1 = 48 /**/
RC_1024_7_2 = 35
RC_1024_7_3 = 52
RC_1024_7_4 = 23
RC_1024_7_5 = 31
RC_1024_7_6 = 37
RC_1024_7_7 = 20


CTX_TWEAK_OFS = 8

#if SKEIN_USE_ASM & 256

/* Critical path in a round has 8 cycles, vsli -> vsri -> veor -> ... */
.macro S256_EvenRound round
	vsli.64 d27, d31, RC_256_\round\()_1
	vsli.64 d26, d30, RC_256_\round\()_0
	vadd.u64 q14, q15
	vsri.64 d27, d31, 64 - RC_256_\round\()_1 /* v3 -> d27 */
	vsri.64 d26, d30, 64 - RC_256_\round\()_0 /* v1 -> d26 */
	/* xor and permute */
	veor d30, d27, d29 /* v2 -> d30 */
	veor d31, d26, d28 /* v1 -> d31 */
.endm

.macro S256_OddRound round
	vsli.64 d26, d30, RC_256_\round\()_0
	vsli.64 d27, d31, RC_256_\round\()_1
	vadd.u64 q14, q15
	vsri.64 d26, d30, 64 - RC_256_\round\()_0 /* v1 -> d26 */
	vsri.64 d27, d31, 64 - RC_256_\round\()_1 /* v3 -> d27 */
	/* xor and permute */
	veor d31, d26, d28 /* v1 -> d31 */
	veor d30, d27, d29 /* v2 -> d30 */
.endm

.macro S256_InjectKey
	/* Key injection
	 + rotate tweaks */
	vadd.u64 q14, q1
	vadd.u64 q15, q2
	/* Add tweaks */
	vadd.u64 d29, d24 /* v2 += t1 */
	vadd.u64 q15, q0 /* v1 += t0, v3 += s */
.endm


/* Constants */
	.balign 16
.S256C_rol16tbl:
	.quad 0x0504030201000706
.S256C_rol32tbl:
	.quad 0x0302010007060504
.S256C_C240:
	.word SKEIN_KS_C240_LOW, SKEIN_KS_C240_HIGH
.S256C_1:
	.quad 1
.S256C_0:
	.quad 0

/* void Skein_256_Process_Block(Skein_256_Ctxt_t *ctx, const u08b_t *blkPtr, size_t blkCnt, size_t byteCntAdd); */

/*
 * Register usage:
 * r0: Pointer to tweak and state
 * r1: Pointer to plaintext
 * r2: Remaining block counter
 * r3: Round loop counter
 * r12: Temporary addresses
 *
 * d0: Tweak t0
 * d1: Round counter s
 * d2-d6: Key k0, k2, k1, k3, k4
 * d16-d17: Rotation tables 32,16
 * d18-d21: Plaintext p0, p2, p1, p3
 * d22: Temporary constant C240, 1
 * d23: byteCntAdd
 * d24,d25: tweak t1, t2
 * d26,d27: Temporary shift registers, k4 temp
 * d28-d31: state v0, v2, v1, v3
 * Unused: d7, d8-d15
 */

	.balign 4
	.global Skein_256_Process_Block
Skein_256_Process_Block:
	add r0, CTX_TWEAK_OFS
	vldm r0, {d0-d5} /* t0,t1 -> d0,d1; k0-k3 -> d2-d5 */

	/* byteCntAdd -> d23 */
	mov r12, 0
	push {r3, r12}
	vld1.64 d23, [sp,:64]!

	/* Swap key order */
	vswp d3, d4 /* k1, k2 -> d4, d3 */

	/* Load rotation table constants */
	adr r12, .S256C_rol16tbl
	vld1.64 {d16-d17}, [r12,:128]

	vmov d24, d1 /* t1 -> d24 */

0:
	/* Load plaintext */
	vldm r1!, {d18-d21} /* p0-p3 -> d18-d21 */

	vadd.u64 d0, d23 /* Add byteCntAdd to t0 */

	vswp d19, d20 /* p1, p2 -> d20, d19 */

	/* Initial key injection, v0,v2,v1,v3 -> d28-d31
	 + k4 comp */
	veor q13, q1, q2 /* k4 computation */
	adr r12, .S256C_C240
	vld1.64 d22, [r12,:64] /* C240 -> d22 */
	vadd.u64 q14, q1, q9 /* v0, v2 -> d28, d29 */
	veor d6, d26, d27 /* k4 computation */
	vadd.u64 q15, q2, q10 /* v1, v3 -> d30, d31 */
	veor d6, d22 /* k4 -> d6 */

	adr r12, .S256C_0
	vld1.64 d1, [r12,:64] /* s = 0 */

	vadd.u64 d29, d24 /* Add tweak */
	vadd.u64 d30, d0 /* Add tweak */

	/* 1 -> d22 */
	adr r12, .S256C_1
	vld1.64 d22, [r12,:64]

	veor d25, d0, d24 /* t2 -> d25 */


	mov r3, 72
1:
	vswp d2, d4 /* Swap k0 <-> k1 */

	/*S256_EvenRound 0
	 * vtbl rotation. */
	vsli.64 d26, d30, RC_256_0_0
	vtbl.8 d27, {d31}, d16
	vadd.u64 q14, q15
	vsri.64 d26, d30, 64 - RC_256_0_0 /* v1 -> d26 */
	/* xor and permute */
	veor d30, d27, d29 /* v2 -> d30 */
	veor d31, d26, d28 /* v1 -> d31 */

	vswp d4, d3 /* Swap k1 <-> k2 */
	vswp d0, d24 /* Swap t0 <-> t1 */
	S256_OddRound 1
	vswp d3, d5 /* Swap k2 <-> k3 */
	vswp d24, d25 /* Swap t1 <-> t2 */
	S256_EvenRound 2
	vswp d5, d6 /* Swap k3 <-> k4 */
	vadd.u64 d1, d22 /* s += 1 */
	S256_OddRound 3

	S256_InjectKey

	vswp d2, d4 /* Swap k0 <-> k1 */
	S256_EvenRound 4
	vswp d4, d3 /* Swap k1 <-> k2 */
	vswp d0, d24 /* Swap t0 <-> t1 */
	S256_OddRound 5
	vswp d3, d5 /* Swap k2 <-> k3 */
	vswp d24, d25 /* Swap t1 <-> t2 */
	S256_EvenRound 6
	vswp d5, d6 /* Swap k3 <-> k4 */
	vadd.u64 d1, d22 /* s += 1 */

	/*S256_OddRound 7
	 * vtbl rotation. */
	vtbl.8 d27, {d30}, d17
	vadd.u64 q14, q15
	vtbl.8 d26, {d31}, d17
	/* xor and permute */
	veor d31, d27, d28 /* v1 -> d31 */
	veor d30, d26, d29 /* v2 -> d30 */

	S256_InjectKey

	subs r3, 8
	bne 1b


	/* Xor state with plaintext to get new key */
	veor q1, q14, q9 /* k0, k2 -> d2, d3 */
	veor q2, q15, q10 /* k1, k3 -> d4, d5 */

	/* t0 and t1 are in correct position */
	/* Clear 'first' bit from t1 (+ an unused position bit) */
	vbic.i32 d24, 1 << (SKEIN_T1_FIRST_FLAG - 32)

	/* Loop if there are more blocks */
	subs r2, 1 /* blkCnt-- */
	bne 0b


	/* Done
	 * Unswap tweak and key */
	vswp d3, d4
	vswp d24, d1
	vstm r0, {d0-d5} /* save t0,t1, k0-k3 */

	bx lr

#ifdef SKEIN_CODE_SIZE
/* size_t  Skein_256_Process_Block_CodeSize(void);
*/
	.global Skein_256_Process_Block_CodeSize
Skein_256_Process_Block_CodeSize:
	ldr r0, =$(Skein_256_Process_Block_CodeSize - Skein_256_Process_Block)
	bx lr

	.global Skein_256_Unroll_Cnt
Skein_256_Unroll_Cnt:
	mov r0, 0
	bx lr
#endif
#endif /* 256 */


#if SKEIN_USE_ASM & 512

.macro S512_Round round, rot0, rot1, rot2, rot3, interl
	/* This is pretty readable if you remove the vtbl rotations. */
	/* Some stalling in the vtbl rounds. */
	vadd.u64 q12, q14
	.if \round == 3
	adr r7, .S512C_rol56tbl
	vld1.64 d16, [r7,:64]
	.else
	vsli.64 d20, d28, RC_512_\round\()_\rot0
	.endif
	.if (\round && 3) == 0
	vswp d27, d30 /* Swap v3 <-> v6 */
	.endif

	vsli.64 d21, d29, RC_512_\round\()_\rot1
	.if \round == 4
	adr r7, .S512C_rol24tbl
	vld1.64 d16, [r7,:64]
	vsli.64 d22, d30, RC_512_\round\()_\rot2
	\interl
	.elseif \round == 7
	adr r7, .S512C_rol8tbl
	vld1.64 {d16,d17}, [r7,:128]
	\interl
	.else
	vsli.64 d23, d31, RC_512_\round\()_\rot3
	vsli.64 d22, d30, RC_512_\round\()_\rot2
	.endif

	vadd.u64 q13, q15
	.if \round == 3
	vtbl.8 d20, {d28}, d16
	.else
	vsri.64 d20, d28, 64 - RC_512_\round\()_\rot0
	.endif
	.if \round == 4
	vtbl.8 d23, {d31}, d16
	vsri.64 d22, d30, 64 - RC_512_\round\()_\rot2
	.elseif \round == 7
	vtbl.8 d23, {d31}, d17
	vtbl.8 d22, {d30}, d16
	.else
	vsri.64 d23, d31, 64 - RC_512_\round\()_\rot3
	vsri.64 d22, d30, 64 - RC_512_\round\()_\rot2
	\interl
	.endif
	vsri.64 d21, d29, 64 - RC_512_\round\()_\rot1
	.if (\round && 1) == 0
	veor q14, q11, q13
	veor q15, q10, q12
	.else
	veor q14, q11, q13
	vswp d26, d27
	veor q15, q10, q12
	vswp d24, d25
	.endif
.endm

.macro S512_Four_Rounds round
	vswp d2, d6 /* Swap k0 <-> k1 */
	S512_Round %(\round + 0), 0, 2, 1, 3, <vswp d0, d12 /* Swap t0 <-> t1 */>
	vswp d6, d4 /* Swap k1 <-> k2 */
	vswp d12, d11 /* Swap t1 <-> t2 */
	S512_Round %(\round + 1), 3, 1, 0, 2, <vswp d4, d5 /* Swap k2 <-> k3 */>
	vswp d5, d3 /* Swap k3 <-> k4 */
	S512_Round %(\round + 2), 0, 2, 1, 3, <vswp d3, d7 /* Swap k4 <-> k5 */>
	vswp d7, d8 /* Swap k5 <-> k6 */
	S512_Round %(\round + 3), 3, 1, 0, 2, <vswp d8, d9 /* Swap k6 <-> k7 */>

	vswp d9, d10 /* Swap k7 <-> k8 */

	/* Key injection */
	vadd.u64 d13, d14 /* s++ */
	vadd.u64 q12, q1
	vswp d27, d30 /* Swap v3 <-> v6 */
	vadd.u64 q14, q3
	vadd.u64 q15, q4
	vadd.u64 q13, q2
	/* Add tweaks */
	vadd.u64 d29, d0 /* v5 += t0 */
	vadd.u64 q15, q6 /* v6 += t1, v7 += s */
.endm

/* Constants */
	.balign 16
.S512C_rol8tbl:
	.quad 0x0605040302010007
.S512C_rol56tbl:
	.quad 0x0007060504030201
.S512C_rol24tbl:
	.quad 0x0403020100070605
.S512C_C240:
	.word SKEIN_KS_C240_LOW, SKEIN_KS_C240_HIGH
.S512C_1:
	.quad 1
.S512C_0:
	.quad 0


/* void Skein_512_Process_Block(Skein_512_Ctxt_t *ctx, const u08b_t *blkPtr, size_t blkCnt, size_t byteCntAdd); */

/*
 * Register usage:
 * r0: Pointer to tweak and state
 * r1: Pointer to plaintext
 * r2: Remaining block counter
 * r3: Round loop counter
 * r7: Temporary addresses
 * r12: Initial sp
 *
 * d0: Tweak t0
 * d1: byteCntAdd
 * d2-d10: Key k0, k4, k2, k3, k1, k5, k6, k7
 * d11-d12: Tweak t2, t1
 * d13: Round counter s
 * d14: Constant 1
 * d15: Constant C240
 * d16-d17: Rotation tables
 * d20-d23: Temporary shift registers
 * d24-d31: State v0, v4, v2, v3, v1, v5, v6, v7
 * (v3 and v6 are swapped at the entry to the cipher rounds, and then back
 *  again for the key injection)
 * Unused: d18-d19
 */

	.balign 4
	.global Skein_512_Process_Block
Skein_512_Process_Block:
	add r0, CTX_TWEAK_OFS
	vldm r0, {d0-d9} /* t0,t1 -> d0,d1; k0-k7 -> d2-d9 */

	mov r12, sp
	bic sp, 15 /* align the stack to 128 bits */
	push {r4-r7}
	vpush {d8-d15}

	vmov d12, d1 /* t1 -> d12 */

	/* byteCntAdd -> d1 */
	mov r7, 0
	push {r3, r7}
	vld1.64 d1, [sp,:64]!

	/* k0-k9 -> d2, d6, d4, d5, d3, d7, d8, d9 */
	vswp d3, d6

0:
	/* Load plaintext */
	vldm r1, {d24-d31} /* p0-p7 -> d24-d31 */

	/* Inject key + Calculate k8 */
	adr r7, .S512C_C240
	vld1.64 d15, [r7,:64] /* C240 -> d15 */

	vswp d25, d28 /* Swap p1 <-> p5 */

	veor q10, q1, q2 /* k8 computation */
	vadd.u64 q12, q1
	veor q10, q3 /* k8 computation */
	vadd.u64 q13, q2
	veor q10, q4 /* k8 computation */
	vadd.u64 q14, q3
	veor d20, d21 /* k8 computation */
	vadd.u64 q15, q4
	veor d10, d15, d20 /* k8 -> d10 */

	adr r7, .S512C_0
	vld1.64 d13, [r7,:64] /* s = 0 */

	/* Add tweak */
	vadd.u64 d0, d1 /* t0 += byteCntAdd */
	vadd.u64 d30, d12 /* v6 += t1 */
	vadd.u64 d29, d0 /* v5 += t0 */
	veor d11, d0, d12 /* t2 -> d11 */

	adr r7, .S512C_1
	vld1.64 d14, [r7,:64] /* 1 -> d14 */


	mov r3, 72
1:
	S512_Four_Rounds 0
	S512_Four_Rounds 4

	subs r3, 8
	bne 1b


	/* Xor state with plaintext to get new key */
	vldm r1!, {d2-d9} /* p0-p7 -> d2-d9 */
	vswp d3, d6
	veor q1, q12 /* k0, k4 -> d2, d3 */
	veor q2, q13 /* k2, k6 -> d4, d5 */
	veor q3, q14 /* k1, k5 -> d6, d7 */
	veor q4, q15 /* k3, k7 -> d8, d9 */

	/* t0 and t1 are in correct position */
	/* Clear 'first' bit from t1 (+ an unused position bit) */
	vbic.i32 d12, 1 << (SKEIN_T1_FIRST_FLAG - 32)

	/* Loop if there are more blocks */
	subs r2, 1 /* blkCnt-- */
	bne 0b

	/* Unswap key and save */
	vswp d3, d6
	vmov d1, d12 /* t1 -> d1 */
	vstm r0, {d0-d9} /* save t0-t1, k0-k7 */

	vpop {d8-d15}
	pop {r4-r7}
	mov sp, r12
	bx lr

#ifdef SKEIN_CODE_SIZE
/* size_t  Skein_512_Process_Block_CodeSize(void);
*/
	.global Skein_512_Process_Block_CodeSize
Skein_512_Process_Block_CodeSize:
	ldr r0, =$(Skein_512_Process_Block_CodeSize - Skein_512_Process_Block)
	bx lr

	.global Skein_512_Unroll_Cnt
Skein_512_Unroll_Cnt:
	mov r0, 0
	bx lr
#endif
#endif /* 512 */


#if SKEIN_USE_ASM & 1024

/*
 The word permutations form these cycles:
 c1: v4 -> v6 ->
 c2: v3 -> v11 -> v5 -> v13 ->
 c3: v1 -> v15 -> v7 -> v9 ->
 c4: v8 -> v10 -> v12 -> v14 ->
 c4: v8 -> v14 -> v12 -> v10 ->

 c1, c2 and c3 are split across rounds.
 The order at entry including swizzling should thus be:
 v0 v2 v15 v11 v6 v4 v13 v9 v8 v10 v7 v3 v12 v14 v5 v1
 or starting out / after a key injection:
 v0 v2 v1 v11 v6 v4 v5 v9 v8 v10 v7 v3 v12 v14 v13 v15
*/

.macro S1024_Round round, interl1, interl2, interl3
	.if (\round && 3) == 0
	vsli.64 d14, d30, RC_1024_\round\()_6
	vsli.64 d15, d31, RC_1024_\round\()_7
	.else
	vsli.64 d15, d18, RC_1024_\round\()_7
	vswp d18, d31 /* Swap v1 <-> v15  /c3 */
	vsli.64 d14, d22, RC_1024_\round\()_6
	vswp d22, d30 /* Swap v5 <-> v13  /c2 */
	.endif
	vsli.64 d12, d23, RC_1024_\round\()_4
	vswp d23, d26 /* Swap v7 <-> v9  /c3 */
	vsli.64 d13, d19, RC_1024_\round\()_5
	vswp d19, d27 /* Swap v3 <-> v11  /c2 */

	vadd.u64 q12, q13
	\interl1
	vadd.u64 q14, q15
	vsri.64 d12, d26, 64 - RC_1024_\round\()_4
	vsri.64 d13, d27, 64 - RC_1024_\round\()_5
	vsri.64 d14, d30, 64 - RC_1024_\round\()_6
	vswp d20, d21 /* Swap v4 <-> v6  /c1 */
	vsri.64 d15, d31, 64 - RC_1024_\round\()_7
	\interl2
	veor q13, q12, q6
	veor q15, q14, q7
	vswp d24, d28 /* Swap v8 <-> v12  /c4 */
	vadd.u64 q8, q9
	vswp d28, d29 /* Swap v12 <-> v14  /c4 */
	vadd.u64 q10, q11
	vswp d27, d30 /* Swap v11 <-> v13  /c2 */
	vsli.64 d12, d18, RC_1024_\round\()_0
	vswp d25, d24 /* Swap v10 <-> v8  /c4 */
	vsli.64 d13, d19, RC_1024_\round\()_1
	vswp d26, d31 /* Swap v9 <-> v15  /c3 */
	vsli.64 d14, d22, RC_1024_\round\()_2
	vsli.64 d15, d23, RC_1024_\round\()_3
	vsri.64 d12, d18, 64 - RC_1024_\round\()_0
	vsri.64 d13, d19, 64 - RC_1024_\round\()_1
	vsri.64 d14, d22, 64 - RC_1024_\round\()_2
	vsri.64 d15, d23, 64 - RC_1024_\round\()_3
	\interl3
	veor q9, q8, q6
	veor q11, q10, q7
.endm

/*
 The key is ordered like the state, except the swaps that involve the
 last four words of the subkey:
 k0 k2 k1 k11 k6 k4 k5 k9 k8 k10 k7 k3 k12 k14 k13 k15
 */

.macro S1024_InjectKey
	/* Load k12-k15 and increment key position */
	add r7, sp, r4, lsl 3
	cmp r4, 16
	add r4, 1
	vldm r7, {d12-d15}
	moveq r4, 0

	vadd.u64 q8, q0

	vadd.u64 q10, q2
	vswp d13, d14 /* Swap k13 <-> k14 */

	vadd.u64 q14, q6
	vswp d18, d31 /* Swap v1 <-> v15  /c3 */

	vadd.u64 q9, q1 /* Contains v1 */
	vswp d22, d30 /* Swap v5 <-> v13  /c2 */

	vadd.u64 q15, q7 /* Contains v13, v15 */

	/* Load t0-t1 and increment tweak position */
	add r7, sp, r5, lsl 3
	cmp r5, (S1024_SOFS_TWEAKSCHED + 2)
	add r5, 1
	vldm r7, {d13-d14} /* t0-t1 -> d13-d14 */
	moveq r5, S1024_SOFS_TWEAKSCHED

	vadd.u64 q11, q3 /* Contains v5 */
	vmov d15, r3, r6 /* s -> d15 */

	vadd.u64 q12, q4
	vadd.u64 q13, q5

	vadd.u64 d30, d13 /* v13 += t0 */
	vadd.u64 d31, d15 /* v15 += s */
	vadd.u64 d29, d14 /* v14 += t1 */
.endm

.macro S1024_Four_Rounds round
	vswp d0, d12 /* k0 <-> k12 */ 
	S1024_Round %(\round + 0), < vswp d0, d2 /* k0 <-> k1 */ >, < vswp d2, d1 /* k1 <-> k2 */ >, < vswp d1, d11 /* k2 <-> k3 */ >
	S1024_Round %(\round + 1), < vswp d11, d5 /* k3 <-> k4 */ >, < vswp d5, d6 /* k4 <-> k5 */ >, < vswp d6, d4 /* k5 <-> k6 */ >
	S1024_Round %(\round + 2), < vswp d4, d10 /* k6 <-> k7 */ >, < vswp d10, d8 /* k7 <-> k8 */ >, < vswp d8, d7 /* k8 <-> k9 */ >
	add r3, 1 /* s++ */
	S1024_Round %(\round + 3), < vswp d7, d9 /* k9 <-> k10 */ >, < vswp d9, d3 /* k10 <-> k11 */ >, < >

	S1024_InjectKey
.endm


S1024_SOFS_KEYSCHED = 0
S1024_SOFS_TWEAKSCHED = 20
S1024_SOFS_BYTECNTADD = S1024_SOFS_TWEAKSCHED + 4
S1024_STACK_N = S1024_SOFS_BYTECNTADD

/* Constants */
	.balign 16
.S1024C_C240:
	.word SKEIN_KS_C240_LOW, SKEIN_KS_C240_HIGH
.S1024C_1:
	.quad 1


/* void Skein1024_Process_Block(Skein1024_Ctxt_t *ctx, const u08b_t *blkPtr, size_t blkCnt, size_t byteCntAdd); */
/*
 * Register usage:
 * r0: Pointer to tweak and state
 * r1: Pointer to plaintext
 * r2: Remaining block counter
 * r3: Round counter s
 * r4: Key schedule position
 * r5: Tweak schedule position
 * r6: Constant 0
 * r7: Temporary addresses
 * r12: Initial sp
 *
 * d0-d11: Key k0, k2, k1, k11, k6, k4, k5, k9, k8, k10, k7, k3, k12, k14, k13, k15
 * d12-d15: Key/Tweak/Temporary shift registers
 * d16-d31: State v0, v2, v15, v11, v6, v4, v13, v9, v8, v10, v7, v3, v12, v14, v5, v1
 *
 * Stack contents:
 * S1024_SOFS_KEYSCHED (20 * 8): Key schedule k0-k16, k0-k2
 * S1024_SOFS_TWEAKSCHED (4 * 8): Tweak schedule t0-t2, t0
 * S1024_SOFS_BYTECNTADD (1 * 8): byteCntAdd
 * 
 */

	.balign 4
	.global Skein1024_Process_Block
Skein1024_Process_Block:
	add r0, CTX_TWEAK_OFS
	vldm r0, {d0-d9} /* t0,t1 -> d0,d1; k0-k7 -> d2-d9 */

	push {r4-r7}
	vpush {d8-d15}
	mov r12, sp
	bic sp, 15 /* Align the stack to 128 bits */

	mov r6, 0

	sub sp, 8 * (S1024_STACK_N) /* Allocate space for k0-k16,k0-k2, t0-t2,t0, byteCntAdd */

	str r3, [sp, S1024_SOFS_BYTECNTADD * 8]
	str r6, [sp, (S1024_SOFS_BYTECNTADD * 8 + 4)]

	vldm r0, {d16-d17} /* t0,t1 -> d16-d17 */
	add r7, r0, (2 * 8)
	vldm r7, {d0-d15} /* k0-k15 -> d0-d15 */

0:
	mov r3, 0 /* s = 0 */
	mov r4, S1024_SOFS_KEYSCHED + 13 /* Keypos = 13 */
	mov r5, S1024_SOFS_TWEAKSCHED + 1 /* Tweakpos = 1 */

	adr r7, .S1024C_C240
	vld1.64 d31, [r7,:64] /* C240 -> d31 */
	add r7, sp, (S1024_SOFS_BYTECNTADD * 8)
	vld1.64 d29, [r7,:64] /* byteCntAdd -> d29 */

	add r7, sp, (S1024_SOFS_KEYSCHED * 8)

	vstm r7!, {d0-d15}

	/* Calculate k16 and t2 */
	veor q9, q0, q1
	veor q10, q2, q3
	veor q9, q4
	veor q10, q5
	veor q9, q6
	veor q10, q7
	vadd.u64 d16, d29 /* t0 += byteCntAdd */
	veor q9, q10
	veor d30, d16, d17 /* t2 -> d30 */
	veor d18, d19
	veor d18, d31 /* k16 -> d18 */

	vstm r7!, {d18}
	vstm r7!, {d0-d2}
	vstm r7!, {d16-d17}
	vstm r7!, {d30}
	vstm r7!, {d16}

	/* Initial key injection */
	vldm r1, {d16-d31} /* p0-p15 -> d16-d31 */
	vadd.u64 q8, q0
	vadd.u64 q9, q1
	vadd.u64 q15, q7
	vadd.u64 q10, q2
	vadd.u64 q11, q3
	add r7, sp, (S1024_SOFS_TWEAKSCHED * 8)
	vld1.64 {d14, d15}, [r7, :128] /* t0-t1 -> d14-d15 */
	vadd.u64 q12, q4
	vadd.u64 q13, q5
	vadd.u64 q14, q6
	vswp d29, d30 /* Swap v13 <-> v14 */

	vadd.u64 d29, d15 /* v14 += t1 */
	vadd.u64 d30, d14 /* v13 += t2 */

	/* Swizzle keys */
	vswp d1, d2 /* Swap k1, k2 */
	vswp d3, d11 /* Swap k3, k11 */
	vswp d5, d6 /* Swap k5, k6 */
	vswp d7, d9 /* Swap k7, k9 */
	vswp d4, d5 /* Swap k4, k6 */
	vswp d9, d10 /* Swap k7, k10 */

	/* Swizzle state */
	vswp d17, d18 /* Swap v1, v2 */
	vswp d19, d27 /* Swap v3, v11 */
	vswp d21, d22 /* Swap v5, v6 */
	vswp d23, d25 /* Swap v7, v9 */
	vswp d20, d21 /* Swap v4, v6 */
	vswp d25, d26 /* Swap v7, v10 */

1:
	S1024_Four_Rounds 0
	S1024_Four_Rounds 4

	cmp r3, 20 /* Loop until s = 20 */
	bne 1b

	/* Unswap state */
	vswp d29, d30 /* Swap v14, k15 */
	vswp d25, d26 /* Swap v7, v10 */
	vswp d20, d21 /* Swap v4, v6 */
	vswp d23, d25 /* Swap v7, v9 */
	vswp d21, d22 /* Swap v5, v6 */
	vswp d19, d27 /* Swap v3, v11 */
	vswp d17, d18 /* Swap v1, v2 */

	/* Xor state with plaintext to get new key */
	vldm r1!, {d0-d15} /* p0-p15 -> d0-d31 */
	veor q0, q8
	veor q1, q9
	veor q2, q10
	veor q3, q11
	veor q4, q12
	veor q5, q13
	veor q6, q14
	veor q7, q15

	/* Clear 'first' bit from t1 (+ an unused position bit) */
	add r7, sp, (S1024_SOFS_TWEAKSCHED * 8)
	vld1.64 {d16,d17}, [r7,:128] /* t0-t1 -> d16-d17 */
	vbic.i32 d17, 1 << (SKEIN_T1_FIRST_FLAG - 32)

	/* Loop if there are more blocks */
	subs r2, 1 /* blkCnt-- */
	bne 0b

	/* Save new key and tweak */
	vstm r0!, {d16-d17}
	vstm r0, {d0-d15}

	mov sp, r12
	vpop {d8-d15}
	pop {r4-r7}
	bx lr

#ifdef SKEIN_CODE_SIZE
/* size_t  Skein1024_Process_Block_CodeSize(void);
*/
	.global Skein1024_Process_Block_CodeSize
Skein1024_Process_Block_CodeSize:
	ldr r0, =$(Skein1024_Process_Block_CodeSize - Skein1024_Process_Block)
	bx lr

	.global Skein1024_Unroll_Cnt
Skein1024_Unroll_Cnt:
	mov r0, 0
	bx lr
#endif
#endif /* 1024 */
