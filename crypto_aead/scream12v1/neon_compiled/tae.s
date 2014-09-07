	.syntax unified
	.cpu cortex-a15
	.eabi_attribute 27, 3	@ Tag_ABI_HardFP_use
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.fpu neon
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"tae.c"
@ GNU C (Debian 4.7.2-5) version 4.7.2 (arm-linux-gnueabihf)
@	compiled by GNU C version 4.7.2, GMP version 5.0.5, MPFR version 3.1.0-p10, MPC version 0.9
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -imultilib . -imultiarch arm-linux-gnueabihf
@ crypto_aead/scream12v1/neon/tae.c -mcpu=cortex-a15 -mtune=cortex-a15
@ -mfpu=neon -mfloat-abi=hard -mthumb -mtls-dialect=gnu
@ -auxbase-strip crypto_aead/scream12v1/neon/tae.s -g -O3 -Wall -Wextra
@ -std=c99 -fno-schedule-insns -fomit-frame-pointer -funroll-loops
@ -fpeel-loops -fverbose-asm
@ options enabled:  -fauto-inc-dec -fbranch-count-reg -fcaller-saves
@ -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
@ -fcrossjumping -fcse-follow-jumps -fdebug-types-section -fdefer-pop
@ -fdelete-null-pointer-checks -fdevirtualize -fdwarf2-cfi-asm
@ -fearly-inlining -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm
@ -fgnu-runtime -fguess-branch-probability -fident -fif-conversion
@ -fif-conversion2 -findirect-inlining -finline -finline-atomics
@ -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
@ -fipa-pure-const -fipa-reference -fipa-sra -fira-share-save-slots
@ -fira-share-spill-slots -fivopts -fkeep-static-consts
@ -fleading-underscore -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-register-move
@ -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining
@ -fpeel-loops -fpeephole -fpeephole2 -fpredictive-commoning
@ -fprefetch-loop-arrays -freg-struct-return -fregmove -frename-registers
@ -freorder-blocks -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
@ -fsched-stalled-insns-dep -fschedule-insns2 -fsection-anchors
@ -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fstrict-aliasing -fstrict-overflow
@ -fstrict-volatile-bitfields -fthread-jumps -ftoplevel-reorder
@ -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
@ -ftree-ch -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
@ -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
@ -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
@ -ftree-sink -ftree-slp-vectorize -ftree-sra -ftree-switch-conversion
@ -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vectorize
@ -ftree-vrp -funit-at-a-time -funroll-loops -funswitch-loops
@ -fvar-tracking -fvar-tracking-assignments -fverbose-asm -fweb
@ -fzero-initialized-in-bss -mglibc -mlittle-endian -msched-prolog -mthumb
@ -munaligned-access -mvectorize-with-neon-quad

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	crypto_aead_encrypt
	.thumb
	.thumb_func
	.type	crypto_aead_encrypt, %function
crypto_aead_encrypt:
.LFB1882:
	.file 1 "crypto_aead/scream12v1/neon/tae.c"
	.loc 1 16 0
	.cfi_startproc
	@ args = 36, pretend = 0, frame = 1872
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}	@
.LCFI0:
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	fstmfdd	sp!, {d8}	@,
.LCFI1:
	.cfi_def_cfa_offset 44
	.cfi_offset 80, -44
	mov	r8, r0	@ c, c
	.loc 1 22 0
	movs	r4, #15	@ tmp426,
	movs	r5, #0	@,
	.loc 1 16 0
	subw	sp, sp, #1892	@,,
.LCFI2:
	.cfi_def_cfa_offset 1936
	.loc 1 18 0
	add	r6, sp, #96	@ tmp725,,
	.loc 1 26 0
	add	r9, sp, #1952	@,,
	.loc 1 16 0
	str	r1, [sp, #52]	@ clen, %sfp
	.loc 1 18 0
	mov	r0, r6	@, tmp725
.LVL1:
	movs	r1, #0	@,
.LVL2:
	.loc 1 16 0
	str	r2, [sp, #48]	@ m, %sfp
	.loc 1 18 0
	mov	r2, #256	@,
.LVL3:
	bl	memset	@
.LVL4:
	.loc 1 23 0
	vmov.i32	q8, #0  @ v16qi	@ tmp437,
	vstr	d16, [sp, #80]	@, auth
	vstr	d17, [sp, #88]	@, auth
.LVL5:
	.loc 1 22 0
	add	r2, sp, #1936	@,,
	ldrd	r0, [r2]	@ tmp425, mlen
	adds	r0, r0, r4	@ tmp425, tmp425, tmp426
	adc	r1, r1, r5	@,,
	lsrs	r3, r0, #4	@ tmp428, tmp425,
	orr	r7, r3, r1, lsl #28	@, tmp428, tmp428,,
	.loc 1 26 0
	ldrd	r2, [r9]	@, adlen
	.loc 1 22 0
	ands	r4, r4, r7	@, tmp430, tmp426, tmp428
	add	r5, r6, r4, lsl #4	@, checksum, tmp725, tmp430,
.LVL6:
.LBB16:
	.loc 1 28 0
	add	r4, sp, #608	@ tmp722,,
.LBE16:
	.loc 1 26 0
	orrs	r1, r2, r3	@,
	bne	.L186	@,
.LVL7:
.L2:
	.loc 1 52 0
	ldr	r0, [sp, #1968]	@, k
	movs	r2, #0	@,
	mov	r3, r4	@, tmp722
	ldr	r1, [sp, #1964]	@, npub
	.loc 1 54 0
	add	sl, sp, #1936	@,,
	.loc 1 52 0
	bl	tweakey_schedule	@
.LVL8:
	.loc 1 54 0
	ldrd	r0, [sl]	@, mlen
	orrs	r1, r0, r1	@,
	beq	.L29	@,
	.loc 1 56 0 discriminator 1
	add	ip, sp, #1936	@,,
	mov	r2, #256	@ tmp498,
	ldrd	sl, [ip]	@, mlen
	movs	r3, #0	@,
	cmp	r3, fp	@ tmp498,
	it eq
	cmpeq	r2, sl	@ tmp498,
	bcs	.L30	@,
	.loc 1 56 0 is_stmt 0
	movs	r7, #0	@ idx,
	mov	fp, #256	@ idx,
	.loc 1 57 0 is_stmt 1
	mov	sl, #16	@ tmp726,
	mov	r9, r7	@ tmp727, idx
	b	.L9	@
.LVL9:
.L31:
	.loc 1 56 0
	mov	fp, lr	@ idx, idx
.LVL10:
.L9:
	.loc 1 57 0 discriminator 2
	ldr	r1, [sp, #48]	@, %sfp
	movs	r2, #16	@,
	mov	r3, r4	@, tmp722
	stmia	sp, {r5, sl}	@,,
	str	r9, [sp, #8]	@ tmp727,
	str	r9, [sp, #12]	@ tmp727,
	adds	r0, r1, r7	@,, idx
	add	r1, r8, r7	@, c, idx
	bl	encrypt_bloc128	@
.LVL11:
	.loc 1 58 0 discriminator 2
	mov	r1, r7	@, idx
	mov	r0, r4	@, tmp722
	bl	tweakey_increment	@
.LVL12:
	.loc 1 56 0 discriminator 2
	add	r0, sp, #1936	@,,
	add	lr, fp, #256	@ idx, idx,
	ldrd	r0, [r0]	@, mlen
	mov	r2, lr	@ D.14225, idx
	movs	r3, #0	@ D.14225,
	mov	r7, fp	@ idx, idx
	cmp	r3, r1	@ D.14225,
	it eq
	cmpeq	r2, r0	@ D.14225,
	bcc	.L31	@,
	add	r9, fp, #240	@ prephitmp.68, idx,
	str	fp, [sp, #16]	@ tmp2, %sfp
	str	r3, [sp, #20]	@, %sfp
	str	r9, [sp, #24]	@ tmp1, %sfp
	str	r3, [sp, #28]	@, %sfp
.LVL13:
.L8:
	.loc 1 62 0
	add	ip, sp, #1936	@,,
	fldd	d6, .L201+8	@ int	@ tmp506,
	ldrd	r0, [ip]	@, mlen
	.loc 1 63 0
	fldd	d19, .L201	@ int	@ tmp507,
	.loc 1 62 0
	fmdrr	d7, r0, r1	@ int	@,
	vand	d18, d7, d6	@,, tmp506
	fmrrd	r2, r3, d18	@ int	@,
	fstd	d18, [sp, #40]	@ int	@, %sfp
	orrs	r1, r2, r3	@,
	bne	.L10	@,
	.loc 1 63 0
	ldrd	r2, [ip]	@, mlen
	fldd	d26, [sp, #16]	@ int	@, %sfp
	fmdrr	d24, r2, r3	@ int	@,
	movs	r2, #12	@,
	vadd.i64	d25, d24, d19	@,, tmp507
	vsub.i64	d27, d25, d26	@,,
	fstd	d27, [sp, #32]	@ int	@, %sfp
	ldr	r0, [sp, #32]	@, %sfp
	fstd	d25, [sp, #56]	@ int	@, %sfp
	ldr	r3, [sp, #36]	@, %sfp
	lsrs	r7, r0, #4	@ tmp707,,
	mov	r0, r4	@, tmp722
	orr	sl, r7, r3, lsl #28	@, prephitmp.71, tmp707,,
	movs	r3, #192	@,
	mov	r1, sl	@, prephitmp.71
	bl	tweakey_set	@
.LVL14:
.L11:
	.loc 1 67 0
	movs	r2, #13	@,
	movs	r3, #0	@,
	mov	r0, r4	@, tmp722
	mov	r1, sl	@, prephitmp.71
	bl	tweakey_set	@
.LVL15:
	.loc 1 68 0
	movs	r2, #14	@,
	movs	r3, #0	@,
	mov	r0, r4	@, tmp722
	mov	r1, sl	@, prephitmp.71
	bl	tweakey_set	@
.LVL16:
	.loc 1 69 0
	movs	r2, #15	@,
	movs	r3, #0	@,
	mov	r0, r4	@, tmp722
	mov	r1, sl	@, prephitmp.71
	bl	tweakey_set	@
.LVL17:
	.loc 1 71 0
	add	ip, sp, #1936	@,,
	ldrd	r2, [sp, #24]	@,,
	ldrd	r0, [ip]	@, mlen
	cmp	r3, r1	@,
	it eq
	cmpeq	r2, r0	@,
	bcs	.L12	@,
.LBB17:
	.loc 1 73 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #352	@,,
	bl	memset	@
.LVL18:
	.loc 1 74 0
	ldr	r7, [sp, #48]	@, %sfp
	movs	r2, #240	@,
	add	r0, sp, #352	@,,
	add	r1, r7, fp	@,, idx
	.loc 1 78 0
	add	r9, r7, r9	@ D.14245,, prephitmp.68
	.loc 1 74 0
	bl	memcpy	@
.LVL19:
	.loc 1 75 0
	ldr	r2, [sp, #56]	@, %sfp
	.loc 1 77 0
	movs	r0, #15	@ tmp543,
	str	r5, [sp, #0]	@ checksum,
	str	r0, [sp, #4]	@ tmp543,
	add	r0, sp, #352	@,,
	.loc 1 75 0
	lsls	r3, r2, #3	@ tmp533,,
	.loc 1 77 0
	movs	r2, #0	@ tmp544,
	.loc 1 75 0
	and	r1, r3, #120	@ tmp535, tmp533,
	.loc 1 77 0
	str	r2, [sp, #8]	@ tmp544,
	mov	r3, r4	@, tmp722
	.loc 1 75 0
	adds	r1, r1, #8	@ tmp538, tmp535,
	.loc 1 77 0
	str	r2, [sp, #12]	@ tmp544,
	movs	r2, #16	@,
	.loc 1 75 0
	strb	r1, [sp, #607]	@ tmp538, buffer2
	.loc 1 77 0
	mov	r1, r0	@,
	bl	encrypt_bloc128	@
.LVL20:
	.loc 1 78 0
	ldr	sl, [sp, #1936]	@ idx, mlen
	sub	r7, sl, #240	@ tmp546, idx,
.LVL21:
.LBB18:
.LBB19:
	.loc 1 222 0
	subs	lr, r7, fp	@ D.14248, tmp546, idx
.LVL22:
	beq	.L15	@,
	.loc 1 223 0
	ldrb	ip, [r5, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	add	r3, lr, #-1	@ tmp741, D.14248,
	ldrb	r1, [r9, #0]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	and	r0, r3, #7	@ tmp743, tmp741,
	.loc 1 222 0
	movs	r3, #1	@ i,
.LVL23:
	cmp	r3, lr	@ i, D.14248
	.loc 1 223 0
	eor	r2, ip, r1	@ tmp566, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [r5, #0]	@ tmp566, *D.14330_266
	.loc 1 222 0
	beq	.L15	@,
	cmp	r0, #0	@ tmp743
	beq	.L13	@
	cmp	r0, #1	@ tmp743,
	beq	.L146	@,
	cmp	r0, #2	@ tmp743,
	beq	.L147	@,
	cmp	r0, #3	@ tmp743,
	beq	.L148	@,
	cmp	r0, #4	@ tmp743,
	beq	.L149	@,
	cmp	r0, #5	@ tmp743,
	beq	.L150	@,
	cmp	r0, #6	@ tmp743,
	.loc 1 223 0
	itttt	ne
	ldrbne	ip, [r5, #1]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	ldrbne	r0, [r9, #1]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	eorne	r0, ip, r0	@ tmp991, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strbne	r0, [r5, #1]	@ tmp991, *D.14330_266
	.loc 1 222 0
	it	ne
	movne	r3, #2	@ i,
	.loc 1 223 0
	and	r7, r3, #15	@ tmp992, i,
	ldrb	r1, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r5, r7	@ D.14330, checksum, tmp992
	ldrb	r0, [ip, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r2, r0, r1	@ tmp996, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [ip, #0]	@ tmp996, *D.14330_266
.L150:
	and	r7, r3, #15	@ tmp997, i,
	ldrb	r1, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r5, r7	@ D.14330, checksum, tmp997
	ldrb	r0, [ip, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r2, r0, r1	@ tmp1001, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [ip, #0]	@ tmp1001, *D.14330_266
.L149:
	and	r7, r3, #15	@ tmp1002, i,
	ldrb	r1, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r5, r7	@ D.14330, checksum, tmp1002
	ldrb	r0, [ip, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r2, r0, r1	@ tmp1006, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [ip, #0]	@ tmp1006, *D.14330_266
.L148:
	and	r7, r3, #15	@ tmp1007, i,
	ldrb	r1, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r5, r7	@ D.14330, checksum, tmp1007
	ldrb	r0, [ip, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r2, r0, r1	@ tmp1011, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [ip, #0]	@ tmp1011, *D.14330_266
.L147:
	and	r7, r3, #15	@ tmp1012, i,
	ldrb	r1, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r5, r7	@ D.14330, checksum, tmp1012
	ldrb	r0, [ip, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r2, r0, r1	@ tmp1016, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [ip, #0]	@ tmp1016, *D.14330_266
.L146:
	and	r7, r3, #15	@ tmp1017, i,
	ldrb	r1, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r5, r7	@ D.14330, checksum, tmp1017
	.loc 1 222 0
	cmp	r3, lr	@ i, D.14248
	.loc 1 223 0
	ldrb	r0, [ip, #0]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r2, r0, r1	@ tmp1021, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r2, [ip, #0]	@ tmp1021, *D.14330_266
	.loc 1 222 0
	beq	.L15	@,
.L13:
	.loc 1 223 0
	and	r7, r3, #15	@ tmp757, i,
	ldrb	r0, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r2, r3, #1	@ tmp744, i,
	.loc 1 223 0
	ldrb	ip, [r5, r7]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, ip, r0	@ tmp761, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	and	ip, r2, #15	@ tmp763, tmp744,
	ldrb	r0, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r2, r3, #2	@ i, i,
	.loc 1 223 0
	strb	r1, [r5, r7]	@ tmp761, *D.14330_266
	ldrb	r7, [r5, ip]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, r7, r0	@ tmp767, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	and	r7, r2, #15	@ tmp769, i,
	ldrb	r0, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, ip]	@ tmp767, *D.14330_266
	ldrb	ip, [r5, r7]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, ip, r0	@ tmp773, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, r7]	@ tmp773, *D.14330_266
	.loc 1 222 0
	adds	r7, r3, #3	@ i, i,
	.loc 1 223 0
	and	r2, r7, #15	@ tmp775, i,
	ldrb	r0, [r9, r7]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	.loc 1 222 0
	adds	r7, r3, #4	@ i, i,
	.loc 1 223 0
	ldrb	ip, [r5, r2]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, ip, r0	@ tmp779, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	ldrb	r0, [r9, r7]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, r2]	@ tmp779, *D.14330_266
	and	r2, r7, #15	@ tmp781, i,
	.loc 1 222 0
	adds	r7, r3, #5	@ i, i,
	.loc 1 223 0
	ldrb	ip, [r5, r2]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, ip, r0	@ tmp785, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	ldrb	r0, [r9, r7]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, r2]	@ tmp785, *D.14330_266
	and	r2, r7, #15	@ tmp787, i,
	.loc 1 222 0
	adds	r7, r3, #6	@ i, i,
	.loc 1 223 0
	ldrb	ip, [r5, r2]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, ip, r0	@ tmp791, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	ldrb	r0, [r9, r7]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, r2]	@ tmp791, *D.14330_266
	and	r2, r7, #15	@ tmp793, i,
	.loc 1 222 0
	adds	r7, r3, #7	@ i, i,
	.loc 1 223 0
	ldrb	ip, [r5, r2]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	.loc 1 222 0
	adds	r3, r3, #8	@ i, i,
	cmp	r3, lr	@ i, D.14248
	.loc 1 223 0
	eor	r1, ip, r0	@ tmp797, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	ldrb	r0, [r9, r7]	@ zero_extendqisi2	@ MEM[base: D.14245_103, index: i_141, offset: 0B], MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, r2]	@ tmp797, *D.14330_266
	and	r2, r7, #15	@ tmp799, i,
	ldrb	ip, [r5, r2]	@ zero_extendqisi2	@ *D.14330_266, *D.14330_266
	eor	r1, ip, r0	@ tmp803, *D.14330_266, MEM[base: D.14245_103, index: i_141, offset: 0B]
	strb	r1, [r5, r2]	@ tmp803, *D.14330_266
	.loc 1 222 0
	bne	.L13	@,
.L15:
.LBE19:
.LBE18:
	.loc 1 79 0
	mov	r1, fp	@, idx
	mov	r0, r4	@, tmp722
	bl	tweakey_increment	@
.LVL24:
	.loc 1 81 0
	add	r9, sp, #592	@ tmp559,,
.LVL25:
	.loc 1 80 0
	add	r0, r8, fp	@, c, idx
	add	r1, sp, #352	@,,
	movs	r2, #240	@,
	bl	memcpy	@
.LVL26:
	.loc 1 81 0
	ldmia	r9, {r0, r1, r2, r3}	@ tmp559,,,,
	add	fp, sp, #64	@ tmp723,,
.LVL27:
	movs	r7, #0	@,
	str	r7, [sp, #20]	@, %sfp
	stmia	fp, {r0, r1, r2, r3}	@ tmp723,,,,
.LVL28:
	ldr	r3, [sp, #1936]	@, mlen
	str	r3, [sp, #16]	@, %sfp
.LVL29:
.L14:
.LBE17:
	.loc 1 94 0
	ldrd	r2, [sp, #40]	@,,
	orrs	r1, r2, r3	@,
	beq	.L199	@,
.LVL30:
	.loc 1 95 0 discriminator 1
	add	ip, sp, #1936	@,,
	fldd	d5, [sp, #16]	@ int	@, %sfp
	ldrd	r2, [ip]	@, mlen
	fldd	d7, .L201	@ int	@ tmp602,
	.loc 1 98 0 discriminator 1
	fldd	d19, .L201+8	@ int	@ tmp607,
	.loc 1 95 0 discriminator 1
	fmdrr	d4, r2, r3	@ int	@,
	vsub.i64	d6, d4, d5	@ D.14230,,
	vadd.i64	d18, d6, d7	@, D.14230, tmp602
	fmrrd	r2, r3, d18	@ int	@ tmp601,
	.loc 1 98 0 discriminator 1
	vadd.i64	d20, d6, d19	@, D.14230, tmp607
	.loc 1 95 0 discriminator 1
	lsr	r0, r2, #4	@ tmp711, tmp601,
	orr	r9, r0, r3, lsl #28	@, fullblocks, tmp711,,
.LVL31:
	.loc 1 98 0 discriminator 1
	fmrrd	r2, r3, d20	@ int	@ tmp606,
	mov	r0, r4	@, tmp722
	lsrs	r1, r2, #4	@ tmp713, tmp606,
	movs	r2, #15	@,
	orr	fp, r1, r3, lsl #28	@, tmp852, tmp713,,
	movs	r3, #0	@,
	mov	r1, fp	@, tmp852
	bl	tweakey_set	@
.LVL32:
	.loc 1 99 0 discriminator 1
	mov	r1, fp	@, tmp852
	mov	r0, r4	@, tmp722
	movs	r2, #14	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL33:
	.loc 1 100 0 discriminator 1
	mov	r1, fp	@, tmp852
	mov	r0, r4	@, tmp722
	movs	r2, #13	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL34:
	.loc 1 102 0 discriminator 1
	mov	r1, fp	@, tmp852
	mov	r0, r4	@, tmp722
	movs	r2, #12	@,
	movs	r3, #232	@,
	bl	tweakey_set	@
.LVL35:
	ldr	fp, [sp, #40]	@ prephitmp.59, %sfp
	b	.L25	@
.L202:
	.align	3
.L201:
	.word	-1
	.word	-1
	.word	15
	.word	0
.LVL36:
.L29:
	.loc 1 54 0
	add	lr, sp, #1936	@,,
	mov	fp, #0	@ prephitmp.59,
	ldrd	r2, [lr]	@, mlen
	.loc 1 51 0
	mov	sl, fp	@ idx, prephitmp.59
.LVL37:
	fmdrr	d31, r2, r3	@ int	@,
	.loc 1 54 0
	strd	r2, [sp, #16]	@,,
.LVL38:
.L7:
	.loc 1 95 0
	add	lr, sp, #1936	@,,
	fldd	d17, .L201	@ int	@ tmp684,
	ldrd	r0, [lr]	@, mlen
	.loc 1 98 0
	fldd	d2, .L201+8	@ int	@ tmp689,
	.loc 1 95 0
	fmdrr	d16, r0, r1	@ int	@,
	.loc 1 98 0
	mov	r0, r4	@, tmp722
	.loc 1 95 0
	vsub.i64	d0, d16, d31	@ D.14230,,
	vadd.i64	d1, d0, d17	@, D.14230, tmp684
	fmrrd	r2, r3, d1	@ int	@ tmp683,
	.loc 1 98 0
	vadd.i64	d3, d0, d2	@, D.14230, tmp689
	.loc 1 95 0
	lsr	r1, r2, #4	@ tmp717, tmp683,
	orr	r9, r1, r3, lsl #28	@, fullblocks, tmp717,,
.LVL39:
	.loc 1 98 0
	fmrrd	r2, r3, d3	@ int	@ tmp688,
	lsrs	r7, r2, #4	@ tmp719, tmp688,
	movs	r2, #15	@,
	orr	r7, r7, r3, lsl #28	@, tmp944, tmp719,,
	movs	r3, #0	@,
	mov	r1, r7	@, tmp944
	bl	tweakey_set	@
.LVL40:
	.loc 1 99 0
	mov	r0, r4	@, tmp722
	mov	r1, r7	@, tmp944
	movs	r2, #14	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL41:
	.loc 1 100 0
	mov	r0, r4	@, tmp722
	mov	r1, r7	@, tmp944
	movs	r2, #13	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL42:
	.loc 1 104 0
	mov	r0, r4	@, tmp722
	mov	r1, r7	@, tmp944
	movs	r2, #12	@,
	movs	r3, #224	@,
	bl	tweakey_set	@
.LVL43:
.L25:
	.loc 1 107 0
	movs	r3, #0	@ tmp618,
	movs	r2, #16	@,
	mov	r0, r6	@, tmp725
	mov	r1, r6	@, tmp725
	str	r3, [sp, #0]	@ tmp618,
	str	r3, [sp, #4]	@ tmp618,
	str	r3, [sp, #8]	@ tmp618,
	str	r3, [sp, #12]	@ tmp618,
	mov	r3, r4	@, tmp722
	bl	encrypt_bloc128	@
.LVL44:
	.loc 1 108 0
	vldmia	r5, {d24-d25}	@ *checksum_12,
	vldr	d22, [sp, #80]	@, auth
	vldr	d23, [sp, #88]	@, auth
	.loc 1 110 0
	ldr	r4, [sp, #1936]	@, mlen
	.loc 1 108 0
	veor	q13, q12, q11	@ tmp624,, auth
	vstmia	r5, {d26-d27}	@ *checksum_12, tmp624
	.loc 1 110 0
	ldr	r0, [r5, #0]	@ unaligned	@ tmp628,* checksum
	.loc 1 112 0
	add	ip, sp, #1936	@,,
	.loc 1 110 0
	ldr	r1, [r5, #4]	@ unaligned	@ tmp629,
	ldr	r2, [r5, #8]	@ unaligned	@ tmp630,
	add	r7, r8, r4	@ tmp627, c,
	ldr	r4, [r5, #12]	@ unaligned	@ tmp631,
	str	r0, [r7, #0]	@ unaligned	@ tmp628,
	str	r1, [r7, #4]	@ unaligned	@ tmp629,
	str	r2, [r7, #8]	@ unaligned	@ tmp630,
	str	r4, [r7, #12]	@ unaligned	@ tmp631,
	.loc 1 112 0
	ldrd	r2, [ip]	@, mlen
	ldrd	r0, [sp, #16]	@,,
	cmp	r3, r1	@,
	it eq
	cmpeq	r2, r0	@,
	beq	.L18	@,
	.loc 1 113 0
	lsl	r9, r9, #4	@ D.14277, fullblocks,
.LVL45:
	mov	r1, r6	@, tmp725
	add	r0, r8, sl	@, c, idx
	mov	r2, r9	@, D.14277
	bl	memcpy	@
.LVL46:
	.loc 1 114 0
	add	r0, sp, #64	@,,
	add	r1, r6, r9	@, tmp725, D.14277
	mov	r2, fp	@, prephitmp.59
	bl	memcpy	@
.LVL47:
.L18:
	.loc 1 118 0 discriminator 1
	cmp	fp, #0	@ prephitmp.59
	beq	.L24	@
	ldr	r9, [sp, #1936]	@, mlen
	ldr	r3, [sp, #48]	@, %sfp
	add	r6, r9, #-1	@ pretmp.63,,
	bic	sl, r6, #15	@ pretmp.64, pretmp.63,
	lsr	r6, fp, #4	@ bnd.97, prephitmp.59,
	add	r0, r3, sl	@ batmp.90,, pretmp.64
	add	r8, r8, sl	@ batmp.93, c, pretmp.64
	.loc 1 11 0
	add	r1, r0, #16	@ tmp658, batmp.90,
	add	r2, r8, #16	@ tmp661, batmp.93,
	lsl	sl, r6, #4	@ i, bnd.97,
	cmp	r0, r2	@ batmp.90, tmp661
	it	cc	@
	cmpcc	r8, r1	@, batmp.93, tmp658
	ite	cc	@
	movcc	r4, #0	@, tmp664
	movcs	r4, #1	@, tmp664
	cmp	fp, #15	@ prephitmp.59,
	ite	ls	@
	movls	r4, #0	@, tmp666
	andhi	r4, r4, #1	@,, tmp666, tmp664
	eor	r7, r4, #1	@ tmp668, tmp666,
	cmp	r6, #0	@ bnd.97,
	it	eq	@
	orreq	r7, r7, #1	@,, tmp672, tmp668
	cmp	r7, #0	@ tmp672
	bne	.L34	@
	subs	r5, r6, #1	@ tmp734, bnd.97,
	.loc 1 119 0
	vld1.8	{q14}, [r0]	@ tmp673, MEM[(const unsigned char *)vect_p.100_438]
.LBB20:
.LBB21:
	.loc 1 11 0
	add	r4, sp, #64	@ tmp855,,
	and	r7, r5, #7	@ tmp736, tmp734,
	movs	r5, #1	@ ivtmp.135,
.LBE21:
.LBE20:
	.loc 1 119 0
	vldmia	r4, {d30-d31}	@ MEM[base: vect_ppad.105_442, offset: 0B],
	cmp	r6, r5	@ bnd.97,
	veor	q8, q14, q15	@ tmp674, tmp673,
	add	r3, sp, #80	@ vect_ppad.105,,
	vst1.8	{q8}, [r8]	@ tmp674, MEM[(unsigned char *)vect_p.111_449]
.LVL48:
	bls	.L188	@,
	cmp	r7, #0	@ tmp736
	beq	.L21	@
	cmp	r7, #1	@ tmp736,
	beq	.L140	@,
	cmp	r7, #2	@ tmp736,
	beq	.L141	@,
	cmp	r7, #3	@ tmp736,
	beq	.L142	@,
	cmp	r7, #4	@ tmp736,
	beq	.L143	@,
	cmp	r7, #5	@ tmp736,
	beq	.L144	@,
	cmp	r7, #6	@ tmp736,
	beq	.L145	@,
	movs	r5, #2	@ ivtmp.135,
	vld1.8	{q0}, [r1]!	@ tmp966, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d2-d3}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q2, q0, q1	@ tmp968, tmp966, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q2}, [r2]!	@ tmp968, MEM[(unsigned char *)vect_p.111_449]
.L145:
	adds	r5, r5, #1	@ ivtmp.135, ivtmp.135,
	vld1.8	{q3}, [r1]!	@ tmp969, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d18-d19}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q10, q3, q9	@ tmp971, tmp969, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q10}, [r2]!	@ tmp971, MEM[(unsigned char *)vect_p.111_449]
.L144:
	adds	r5, r5, #1	@ ivtmp.135, ivtmp.135,
	vld1.8	{q11}, [r1]!	@ tmp972, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d24-d25}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q13, q11, q12	@ tmp974, tmp972, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q13}, [r2]!	@ tmp974, MEM[(unsigned char *)vect_p.111_449]
.L143:
	adds	r5, r5, #1	@ ivtmp.135, ivtmp.135,
	vld1.8	{q14}, [r1]!	@ tmp975, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d30-d31}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q8, q14, q15	@ tmp977, tmp975, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q8}, [r2]!	@ tmp977, MEM[(unsigned char *)vect_p.111_449]
.L142:
	adds	r5, r5, #1	@ ivtmp.135, ivtmp.135,
	vld1.8	{q0}, [r1]!	@ tmp978, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d2-d3}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q2, q0, q1	@ tmp980, tmp978, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q2}, [r2]!	@ tmp980, MEM[(unsigned char *)vect_p.111_449]
.L141:
	adds	r5, r5, #1	@ ivtmp.135, ivtmp.135,
	vld1.8	{q3}, [r1]!	@ tmp981, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d18-d19}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q10, q3, q9	@ tmp983, tmp981, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q10}, [r2]!	@ tmp983, MEM[(unsigned char *)vect_p.111_449]
.L140:
	adds	r5, r5, #1	@ ivtmp.135, ivtmp.135,
	vld1.8	{q11}, [r1]!	@ tmp984, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	r3!, {d24-d25}	@ vect_ppad.105, MEM[base: vect_ppad.105_442, offset: 0B]
	cmp	r6, r5	@ bnd.97, ivtmp.135
	veor	q13, q11, q12	@ tmp986, tmp984, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q13}, [r2]!	@ tmp986, MEM[(unsigned char *)vect_p.111_449]
	bls	.L188	@,
.L21:
	adds	r5, r5, #8	@ ivtmp.135, ivtmp.135,
	.loc 1 119 0 is_stmt 0 discriminator 2
	mov	ip, r2	@ tmp740, ivtmp.141
	mov	r9, r1	@ tmp739, ivtmp.136
	mov	lr, r3	@ tmp737, vect_ppad.105
	vld1.8	{q14}, [r9]!	@ tmp860, MEM[(const unsigned char *)vect_p.100_438]
	vldmia	lr!, {d30-d31}	@ tmp737, MEM[base: vect_ppad.105_442, offset: 0B]
	add	r7, r2, #48	@ ivtmp.141, ivtmp.141,
	veor	q8, q14, q15	@ tmp862, tmp860, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q8}, [ip]!	@ tmp862, MEM[(unsigned char *)vect_p.111_449]
	vld1.8	{q0}, [r9]!	@ tmp867, MEM[(const unsigned char *)vect_p.100_438]
	vldr	d2, [r3, #16]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d3, [r3, #24]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	veor	q2, q0, q1	@ tmp869, tmp867,
	vst1.8	{q2}, [ip]!	@ tmp869, MEM[(unsigned char *)vect_p.111_449]
	vld1.8	{q3}, [r9]	@ tmp874, MEM[(const unsigned char *)vect_p.100_438]
	vldr	d18, [lr, #16]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d19, [lr, #24]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	add	lr, r1, #48	@ ivtmp.136, ivtmp.136,
	veor	q10, q3, q9	@ tmp876, tmp874, MEM[base: vect_ppad.105_442, offset: 0B]
	vst1.8	{q10}, [ip]	@ tmp876, MEM[(unsigned char *)vect_p.111_449]
	add	ip, r1, #64	@ ivtmp.136, ivtmp.136,
	vld1.8	{q11}, [lr]	@ tmp881, MEM[(const unsigned char *)vect_p.100_438]
	vldr	d24, [r3, #48]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d25, [r3, #56]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	add	lr, r2, #64	@ ivtmp.141, ivtmp.141,
	veor	q13, q11, q12	@ tmp883, tmp881,
	vst1.8	{q13}, [r7]	@ tmp883, MEM[(unsigned char *)vect_p.111_449]
	add	r7, r2, #80	@ ivtmp.141, ivtmp.141,
	vld1.8	{q14}, [ip]	@ tmp888, MEM[(const unsigned char *)vect_p.100_438]
	vldr	d30, [r3, #64]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d31, [r3, #72]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	add	ip, r1, #80	@ ivtmp.136, ivtmp.136,
	veor	q8, q14, q15	@ tmp890, tmp888,
	vst1.8	{q8}, [lr]	@ tmp890, MEM[(unsigned char *)vect_p.111_449]
	add	lr, r1, #96	@ ivtmp.136, ivtmp.136,
	vld1.8	{q0}, [ip]	@ tmp895, MEM[(const unsigned char *)vect_p.100_438]
	vldr	d2, [r3, #80]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d3, [r3, #88]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	add	ip, r2, #96	@ ivtmp.141, ivtmp.141,
	veor	q2, q0, q1	@ tmp897, tmp895,
	vst1.8	{q2}, [r7]	@ tmp897, MEM[(unsigned char *)vect_p.111_449]
	add	r7, r2, #112	@ ivtmp.141, ivtmp.141,
	vld1.8	{q3}, [lr]	@ tmp902, MEM[(const unsigned char *)vect_p.100_438]
	vldr	d18, [r3, #96]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d19, [r3, #104]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	add	lr, r1, #112	@ ivtmp.136, ivtmp.136,
	veor	q10, q3, q9	@ tmp904, tmp902,
	adds	r1, r1, #128	@ ivtmp.136, ivtmp.136,
	vst1.8	{q10}, [ip]	@ tmp904, MEM[(unsigned char *)vect_p.111_449]
	adds	r2, r2, #128	@ ivtmp.141, ivtmp.141,
	vldr	d24, [r3, #112]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	vldr	d25, [r3, #120]	@, MEM[base: vect_ppad.105_442, offset: 0B]
	adds	r3, r3, #128	@ vect_ppad.105, vect_ppad.105,
	cmp	r6, r5	@ bnd.97, ivtmp.135
	vld1.8	{q11}, [lr]	@ tmp909, MEM[(const unsigned char *)vect_p.100_438]
	veor	q13, q11, q12	@ tmp911, tmp909,
	vst1.8	{q13}, [r7]	@ tmp911, MEM[(unsigned char *)vect_p.111_449]
	bhi	.L21	@,
.L188:
	cmp	sl, fp	@ i, prephitmp.59
	beq	.L24	@,
.L189:
	mvn	r1, sl	@ tmp731, i
	.loc 1 119 0
	ldrb	r7, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	add	r2, r1, fp	@ tmp730, tmp731, prephitmp.59
	ldrb	r1, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	and	r3, r2, #7	@ tmp732, tmp730,
	eor	ip, r7, r1	@ tmp681, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	ip, [r8, sl]	@ tmp681, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0 is_stmt 1
	add	sl, sl, #1	@ i, i,
.LVL49:
	cmp	sl, fp	@ i, prephitmp.59
	bcs	.L24	@,
	cmp	r3, #0	@ tmp732
	beq	.L37	@
	cmp	r3, #1	@ tmp732,
	beq	.L134	@,
	cmp	r3, #2	@ tmp732,
	beq	.L135	@,
	cmp	r3, #3	@ tmp732,
	beq	.L136	@,
	cmp	r3, #4	@ tmp732,
	beq	.L137	@,
	cmp	r3, #5	@ tmp732,
	beq	.L138	@,
	cmp	r3, #6	@ tmp732,
	.loc 1 119 0
	itttt	ne
	ldrbne	r3, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	ldrbne	ip, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	eorne	r3, ip, r3	@ tmp947, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strbne	r3, [r8, sl]	@ tmp947, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	it	ne
	addne	sl, sl, #1	@ i, i,
.LVL50:
	.loc 1 119 0
	ldrb	lr, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r2, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r3, lr, r2	@ tmp950, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r3, [r8, sl]	@ tmp950, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #1	@ i, i,
.L138:
	.loc 1 119 0
	ldrb	r7, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r1, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r2, r7, r1	@ tmp953, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r2, [r8, sl]	@ tmp953, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #1	@ i, i,
.L137:
	.loc 1 119 0
	ldrb	r7, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	ip, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	lr, r7, ip	@ tmp956, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	lr, [r8, sl]	@ tmp956, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #1	@ i, i,
.L136:
	.loc 1 119 0
	ldrb	r1, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r3, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r2, r1, r3	@ tmp959, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r2, [r8, sl]	@ tmp959, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #1	@ i, i,
.L135:
	.loc 1 119 0
	ldrb	r7, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r1, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	ip, r7, r1	@ tmp962, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	ip, [r8, sl]	@ tmp962, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #1	@ i, i,
.L134:
	.loc 1 119 0
	ldrb	lr, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r3, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r2, lr, r3	@ tmp965, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r2, [r8, sl]	@ tmp965, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #1	@ i, i,
	cmp	sl, fp	@ i, prephitmp.59
	bcs	.L24	@,
.L37:
	.loc 1 119 0
	ldrb	r7, [r4, sl]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	.loc 1 118 0
	add	lr, sl, #1	@ tmp733, i,
	.loc 1 119 0
	ldrb	r1, [r0, sl]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	ip, r7, r1	@ tmp915, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	ip, [r8, sl]	@ tmp915, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	ldrb	r3, [r4, lr]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	.loc 1 118 0
	add	ip, sl, #2	@ i, i,
	.loc 1 119 0
	ldrb	r2, [r0, lr]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r7, r3, r2	@ tmp919, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r7, [r8, lr]	@ tmp919, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	ldrb	r1, [r4, ip]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	.loc 1 118 0
	add	r7, sl, #3	@ i, i,
	.loc 1 119 0
	ldrb	r3, [r0, ip]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	lr, r1, r3	@ tmp923, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	.loc 1 118 0
	add	r3, sl, #4	@ i, i,
	.loc 1 119 0
	strb	lr, [r8, ip]	@ tmp923, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	ldrb	ip, [r4, r7]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r2, [r0, r7]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r1, ip, r2	@ tmp927, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r1, [r8, r7]	@ tmp927, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	ldrb	r7, [r4, r3]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	lr, [r0, r3]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	ip, r7, lr	@ tmp931, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	.loc 1 118 0
	add	lr, sl, #6	@ i, i,
	.loc 1 119 0
	strb	ip, [r8, r3]	@ tmp931, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	add	r3, sl, #5	@ i, i,
	.loc 1 119 0
	ldrb	r1, [r4, r3]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r7, r1, r2	@ tmp935, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r7, [r8, r3]	@ tmp935, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	ldrb	r3, [r4, lr]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	.loc 1 118 0
	add	r7, sl, #7	@ i, i,
	.loc 1 119 0
	ldrb	r1, [r0, lr]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	.loc 1 118 0
	add	sl, sl, #8	@ i, i,
	cmp	sl, fp	@ i, prephitmp.59
	.loc 1 119 0
	eor	ip, r3, r1	@ tmp939, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	ip, [r8, lr]	@ tmp939, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	ldrb	r3, [r4, r7]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_95, offset: 0B], MEM[symbol: pad, index: i_95, offset: 0B]
	ldrb	r2, [r0, r7]	@ zero_extendqisi2	@ MEM[base: batmp.90_430, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	eor	r1, r3, r2	@ tmp943, MEM[symbol: pad, index: i_95, offset: 0B], MEM[base: batmp.90_430, index: i_95, offset: 0B]
	strb	r1, [r8, r7]	@ tmp943, MEM[base: batmp.93_180, index: i_95, offset: 0B]
	.loc 1 118 0
	bcc	.L37	@,
.L24:
	.loc 1 121 0
	add	r0, sp, #1936	@,,
	fldd	d21, .L203	@ int	@ tmp648,
	ldr	r7, [sp, #52]	@, %sfp
	ldrd	r2, [r0]	@, mlen
	.loc 1 124 0
	movs	r0, #0	@,
	.loc 1 121 0
	fmdrr	d23, r2, r3	@ int	@,
	vadd.i64	d25, d23, d21	@ tmp647,, tmp648
	fstd	d25, [r7, #0]	@ int	@ tmp647, *clen_200(D)
	.loc 1 124 0
	add	sp, sp, #868	@,,
	add	sp, sp, #1024	@,
	fldmfdd	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL51:
.L186:
.LBB24:
	.loc 1 28 0
	movs	r2, #128	@,
	ldr	r0, [sp, #1968]	@, k
	mov	r3, r4	@, tmp722
	ldr	r1, [sp, #1964]	@, npub
	.loc 1 30 0
	add	sl, sp, #1952	@,,
	.loc 1 28 0
	bl	tweakey_schedule	@
.LVL52:
	.loc 1 30 0
	ldrd	r0, [sl]	@, adlen
	mov	r2, #256	@ tmp439,
	movs	r3, #0	@,
	cmp	r3, r1	@ tmp439,
	it eq
	cmpeq	r2, r0	@ tmp439,
	bcs	.L27	@,
	str	r5, [sp, #56]	@ checksum, %sfp
	mov	r7, #256	@ idx,
	mov	sl, #0	@ idx,
	.loc 1 31 0
	mov	fp, #16	@ tmp729,
	str	r8, [sp, #16]	@ c, %sfp
	ldr	r5, [sp, #1944]	@ ad, ad
.LVL53:
	b	.L4	@
.LVL54:
.L28:
	.loc 1 30 0
	mov	r7, ip	@ idx, idx
.LVL55:
.L4:
	.loc 1 31 0 discriminator 2
	movs	r2, #0	@,
	add	r1, sp, #80	@,,
	str	fp, [sp, #12]	@ tmp729,
	add	r0, r5, sl	@, ad, idx
	mov	r3, r4	@, tmp722
	str	r2, [sp, #0]	@,
	.loc 1 30 0 discriminator 2
	add	r8, sp, #1952	@,,
	.loc 1 31 0 discriminator 2
	str	r2, [sp, #4]	@,
	str	r1, [sp, #8]	@,
	mov	r1, r2	@,
	bl	encrypt_bloc128	@
.LVL56:
	.loc 1 32 0 discriminator 2
	mov	r1, sl	@, idx
	mov	r0, r4	@, tmp722
	bl	tweakey_increment	@
.LVL57:
	.loc 1 30 0 discriminator 2
	ldrd	r0, [r8]	@, adlen
	add	ip, r7, #256	@ idx, idx,
	movs	r3, #0	@ D.14205,
	mov	r2, ip	@ D.14205, idx
	mov	sl, r7	@ idx, idx
	cmp	r3, r1	@ D.14205,
	it eq
	cmpeq	r2, r0	@ D.14205,
	bcc	.L28	@,
	ldr	r5, [sp, #56]	@ checksum, %sfp
	mov	fp, r3	@ prephitmp.72, D.14205
	ldr	r8, [sp, #16]	@ c, %sfp
.LVL58:
.L3:
	.loc 1 36 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #352	@,,
	.loc 1 38 0
	add	r9, sp, #1952	@,,
	.loc 1 36 0
	bl	memset	@
.LVL59:
	.loc 1 37 0
	ldr	r3, [sp, #1944]	@, ad
	add	r0, sp, #352	@,,
	ldr	r2, [sp, #1952]	@, adlen
	adds	r1, r3, r7	@,, idx
	subs	r2, r2, r7	@,, idx
	bl	memcpy	@
.LVL60:
	.loc 1 38 0
	fldd	d0, .L203+8	@ int	@ tmp460,
	ldrd	r0, [r9]	@, adlen
	fmdrr	d17, r0, r1	@ int	@,
	vand	d1, d17, d0	@,, tmp460
	fmrrd	r2, r3, d1	@ int	@ tmp459,
	orrs	r9, r2, r3	@, tmp459
	beq	.L200	@,
	.loc 1 41 0
	fldd	d2, .L203+16	@ int	@ tmp473,
	add	lr, sp, #1952	@,,
	ldrd	r0, [lr]	@, adlen
	fmrrd	r2, r3, d2	@ int	@ tmp472, tmp473
	subs	sl, r0, sl	@ prephitmp.72,, prephitmp.72
	sbc	fp, r1, fp	@ prephitmp.72,, prephitmp.72
	mov	r0, r4	@, tmp722
	adds	r7, r2, sl	@ tmp472, tmp472, prephitmp.72
	adc	r1, r3, fp	@,, prephitmp.72
	lsrs	r3, r7, #4	@ tmp703, tmp472,
	movs	r2, #12	@,
	orr	r7, r3, r1, lsl #28	@, prephitmp.86, tmp703,,
	movs	r3, #216	@,
	mov	r1, r7	@, prephitmp.86
	bl	tweakey_set	@
.LVL61:
	.loc 1 42 0
	add	ip, sp, #352	@,,
	movs	r2, #128	@ tmp481,
	add	r9, ip, sl	@ tmp480,, prephitmp.72
	strb	r2, [r9, #0]	@ tmp481, buffer2
.L6:
	.loc 1 44 0
	mov	r0, r4	@, tmp722
	mov	r1, r7	@, prephitmp.86
	movs	r2, #13	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL62:
	.loc 1 45 0
	mov	r0, r4	@, tmp722
	mov	r1, r7	@, prephitmp.86
	movs	r2, #14	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL63:
	.loc 1 46 0
	mov	r0, r4	@, tmp722
	mov	r1, r7	@, prephitmp.86
	movs	r2, #15	@,
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL64:
	.loc 1 48 0
	fldd	d5, .L203+8	@ int	@ tmp492,
	movs	r1, #0	@ tmp488,
	add	r0, sp, #80	@,,
	str	r1, [sp, #0]	@ tmp488,
	fmrrd	r2, r3, d5	@ int	@, tmp492
	str	r0, [sp, #8]	@,
	add	r0, sp, #352	@,,
	str	r1, [sp, #4]	@ tmp488,
	adds	r2, sl, r2	@ tmp491, prephitmp.72,
	adc	r7, fp, r3	@, prephitmp.72,
	lsr	fp, r2, #4	@ tmp705, tmp491,
	mov	r2, r1	@,
	orr	r3, fp, r7, lsl #28	@, tmp754, tmp705,,
	str	r3, [sp, #12]	@ tmp754,
	mov	r3, r4	@, tmp722
	bl	encrypt_bloc128	@
.LVL65:
	b	.L2	@
.LVL66:
.L10:
.LBE24:
	.loc 1 65 0
	add	sl, sp, #1936	@,,
	fldd	d22, [sp, #16]	@ int	@, %sfp
	movs	r2, #12	@,
	ldrd	r0, [sl]	@, mlen
	fmdrr	d20, r0, r1	@ int	@,
	mov	r0, r4	@, tmp722
	vadd.i64	d21, d20, d19	@,, tmp512
	vsub.i64	d23, d21, d22	@,,
	fstd	d23, [sp, #32]	@ int	@, %sfp
	ldr	r7, [sp, #32]	@, %sfp
	fstd	d21, [sp, #56]	@ int	@, %sfp
	ldr	r1, [sp, #36]	@, %sfp
	lsrs	r3, r7, #4	@ tmp709,,
	orr	sl, r3, r1, lsl #28	@, prephitmp.71, tmp709,,
	movs	r3, #200	@,
	mov	r1, sl	@, prephitmp.71
	bl	tweakey_set	@
.LVL67:
	b	.L11	@
.L204:
	.align	3
.L203:
	.word	16
	.word	0
	.word	15
	.word	0
	.word	-1
	.word	-1
.LVL68:
.L12:
	.loc 1 85 0
	ldr	r1, [sp, #1936]	@, mlen
	mov	r0, r6	@, tmp725
	ldr	r9, [sp, #48]	@, %sfp
	rsb	r7, fp, r1	@ D.14247, idx,
	mov	r2, r7	@, D.14247
	add	r1, r9, fp	@,, idx
	bl	memcpy	@
.LVL69:
.LBB25:
.LBB22:
	.loc 1 222 0
	cmp	r7, #0	@ D.14247
	beq	.L17	@
	.loc 1 223 0
	ldrb	r0, [r5, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	subs	r3, r7, #1	@ tmp745, D.14247,
	ldrb	r1, [r6, #0]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	and	r2, r3, #7	@ tmp747, tmp745,
	eor	r3, r0, r1	@ tmp599, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r3, [r5, #0]	@ tmp599, *D.14340_274
	.loc 1 222 0
	movs	r3, #1	@ i,
.LVL70:
	cmp	r3, r7	@ i, D.14247
	beq	.L17	@,
	cmp	r2, #0	@ tmp747
	beq	.L16	@
	cmp	r2, #1	@ tmp747,
	beq	.L152	@,
	cmp	r2, #2	@ tmp747,
	beq	.L153	@,
	cmp	r2, #3	@ tmp747,
	beq	.L154	@,
	cmp	r2, #4	@ tmp747,
	beq	.L155	@,
	cmp	r2, #5	@ tmp747,
	beq	.L156	@,
	cmp	r2, #6	@ tmp747,
	.loc 1 223 0
	itttt	ne
	ldrbne	r0, [r5, #1]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrbne	r2, [r6, #1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	eorne	r2, r0, r2	@ tmp1026, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strbne	r2, [r5, #1]	@ tmp1026, *D.14340_274
	.loc 1 222 0
	it	ne
	movne	r3, #2	@ i,
	.loc 1 223 0
	and	lr, r3, #15	@ tmp1027, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	sl, r5, lr	@ D.14340, checksum, tmp1027
	ldrb	r2, [sl, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp1031, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r1, [sl, #0]	@ tmp1031, *D.14340_274
.L156:
	and	ip, r3, #15	@ tmp1032, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r9, r5, ip	@ D.14340, checksum, tmp1032
	ldrb	r2, [r9, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp1036, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r1, [r9, #0]	@ tmp1036, *D.14340_274
.L155:
	and	lr, r3, #15	@ tmp1037, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	sl, r5, lr	@ D.14340, checksum, tmp1037
	ldrb	r2, [sl, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp1041, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r1, [sl, #0]	@ tmp1041, *D.14340_274
.L154:
	and	ip, r3, #15	@ tmp1042, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r9, r5, ip	@ D.14340, checksum, tmp1042
	ldrb	r2, [r9, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp1046, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r1, [r9, #0]	@ tmp1046, *D.14340_274
.L153:
	and	lr, r3, #15	@ tmp1047, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	sl, r5, lr	@ D.14340, checksum, tmp1047
	ldrb	r2, [sl, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp1051, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r1, [sl, #0]	@ tmp1051, *D.14340_274
.L152:
	and	ip, r3, #15	@ tmp1052, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r9, r5, ip	@ D.14340, checksum, tmp1052
	.loc 1 222 0
	cmp	r3, r7	@ i, D.14247
	.loc 1 223 0
	ldrb	r2, [r9, #0]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp1056, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r1, [r9, #0]	@ tmp1056, *D.14340_274
	.loc 1 222 0
	beq	.L17	@,
.L16:
	.loc 1 223 0
	and	lr, r3, #15	@ tmp805, i,
	ldrb	r0, [r6, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	ldrb	r2, [r5, lr]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	eor	r1, r2, r0	@ tmp809, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r2, r3, #1	@ tmp748, i,
	.loc 1 223 0
	and	sl, r2, #15	@ tmp811, tmp748,
	strb	r1, [r5, lr]	@ tmp809, *D.14340_274
	ldrb	r1, [r5, sl]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrb	ip, [r6, r2]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r2, r3, #2	@ i, i,
	.loc 1 223 0
	and	r9, r2, #15	@ tmp817, i,
	eor	r0, r1, ip	@ tmp815, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r0, [r5, sl]	@ tmp815, *D.14340_274
	ldrb	r1, [r5, r9]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrb	r0, [r6, r2]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	eor	r2, r1, r0	@ tmp821, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r1, r3, #3	@ i, i,
	.loc 1 223 0
	and	lr, r1, #15	@ tmp823, i,
	strb	r2, [r5, r9]	@ tmp821, *D.14340_274
	ldrb	sl, [r5, lr]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrb	r0, [r6, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r1, r3, #4	@ i, i,
	.loc 1 223 0
	and	ip, r1, #15	@ tmp829, i,
	eor	r2, sl, r0	@ tmp827, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r2, [r5, lr]	@ tmp827, *D.14340_274
	ldrb	r9, [r5, ip]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrb	r0, [r6, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r1, r3, #5	@ i, i,
	.loc 1 223 0
	and	lr, r1, #15	@ tmp835, i,
	eor	r2, r9, r0	@ tmp833, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r2, [r5, ip]	@ tmp833, *D.14340_274
	ldrb	sl, [r5, lr]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrb	r0, [r6, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r1, r3, #6	@ i, i,
	.loc 1 223 0
	and	ip, r1, #15	@ tmp841, i,
	eor	r2, sl, r0	@ tmp839, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r2, [r5, lr]	@ tmp839, *D.14340_274
	ldrb	r0, [r6, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	.loc 1 222 0
	adds	r1, r3, #7	@ i, i,
	.loc 1 223 0
	ldrb	r9, [r5, ip]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	and	lr, r1, #15	@ tmp847, i,
	.loc 1 222 0
	adds	r3, r3, #8	@ i, i,
	cmp	r3, r7	@ i, D.14247
	.loc 1 223 0
	eor	r2, r9, r0	@ tmp845, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r2, [r5, ip]	@ tmp845, *D.14340_274
	ldrb	sl, [r5, lr]	@ zero_extendqisi2	@ *D.14340_274, *D.14340_274
	ldrb	r0, [r6, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_5, offset: 0B], MEM[symbol: buffer, index: i_5, offset: 0B]
	eor	r2, sl, r0	@ tmp851, *D.14340_274, MEM[symbol: buffer, index: i_5, offset: 0B]
	strb	r2, [r5, lr]	@ tmp851, *D.14340_274
	.loc 1 222 0
	bne	.L16	@,
.L17:
.LBE22:
.LBE25:
	.loc 1 89 0
	movs	r0, #15	@,
	movs	r1, #0	@,
	fldd	d28, [sp, #32]	@ int	@, %sfp
	.loc 1 90 0
	mov	sl, fp	@ idx, idx
	.loc 1 89 0
	fmdrr	d29, r0, r1	@ int	@,
	fmrrd	r2, r3, d29	@ int	@,
	vorr	d30, d28, d29	@,,
	fmrrd	r0, r1, d30	@ int	@ tmp576,
	fstd	d30, [sp, #24]	@ int	@, %sfp
	subs	r0, r0, r2	@ tmp576, tmp576,
	sbc	r1, r1, r3	@ tmp576, tmp576,
	movs	r1, #0	@,
	movs	r2, #16	@,
	adds	r0, r6, r0	@, tmp725, tmp576
	bl	memset	@
.LVL71:
	.loc 1 90 0
	ldrd	r2, [sp, #56]	@ tmp586,,
	movs	r3, #15	@,
	ldr	r7, [sp, #24]	@, %sfp
.LVL72:
	and	r1, r2, r3	@ tmp586, tmp586,
	lsls	r0, r1, #3	@ tmp588, tmp586,
	add	ip, r6, r7	@ tmp585, tmp725,
	adds	r0, r0, #8	@ tmp591, tmp588,
	strb	r0, [ip, #0]	@ tmp591, buffer
	b	.L14	@
.LVL73:
.L200:
.LBB26:
	.loc 1 39 0
	fldd	d8, .L203+16	@ int	@ tmp463,
	mov	r0, r4	@, tmp722
	vadd.i64	d4, d17, d8	@ tmp462, tmp69, tmp463
	fmrrd	r2, r3, d4	@ int	@ tmp464, tmp462
	subs	r2, r2, sl	@ tmp464, tmp464, prephitmp.72
	sbc	r3, r3, fp	@ tmp464, tmp464, prephitmp.72
	lsrs	r1, r2, #4	@ tmp699, tmp464,
	movs	r2, #12	@,
	orr	r1, r1, r3, lsl #28	@,, tmp699,,
	movs	r3, #208	@,
	bl	tweakey_set	@
.LVL74:
	add	r0, sp, #1952	@,,
	ldrd	r2, [r0]	@, adlen
	subs	sl, r2, sl	@ prephitmp.72,, prephitmp.72
	sbc	fp, r3, fp	@ prephitmp.72,, prephitmp.72
	fmrrd	r2, r3, d8	@ int	@ pretmp.84, tmp463
	adds	r7, r2, sl	@ pretmp.84, pretmp.84, prephitmp.72
	adc	r3, r3, fp	@ pretmp.84, pretmp.84, prephitmp.72
	lsrs	r1, r7, #4	@ tmp701, pretmp.84,
	orr	r7, r1, r3, lsl #28	@, prephitmp.86, tmp701, pretmp.84,
	b	.L6	@
.LVL75:
.L30:
.LBE26:
	.loc 1 56 0
	movs	r2, #240	@,
	movs	r3, #0	@,
	movs	r0, #0	@,
	movs	r1, #0	@,
	strd	r2, [sp, #24]	@,,
	mov	r9, #240	@ prephitmp.68,
	mov	fp, #0	@ idx,
	strd	r0, [sp, #16]	@,,
	b	.L8	@
.LVL76:
.L27:
.LBB27:
	.loc 1 30 0
	mov	sl, #0	@ prephitmp.72,
	mov	fp, #0	@ prephitmp.72,
	movs	r7, #0	@ idx,
	b	.L3	@
.LVL77:
.L34:
.LBE27:
.LBB28:
.LBB23:
	.loc 1 11 0
	mov	sl, #0	@ i,
	add	r4, sp, #64	@ tmp855,,
	b	.L189	@
.LVL78:
.L199:
.LBE23:
.LBE28:
	.loc 1 94 0
	mov	fp, #16	@ prephitmp.59,
	fldd	d31, [sp, #16]	@ int	@, %sfp
	b	.L7	@
	.cfi_endproc
.LFE1882:
	.size	crypto_aead_encrypt, .-crypto_aead_encrypt
	.align	2
	.global	crypto_aead_decrypt
	.thumb
	.thumb_func
	.type	crypto_aead_decrypt, %function
crypto_aead_decrypt:
.LFB1883:
	.loc 1 131 0
	.cfi_startproc
	@ args = 32, pretend = 0, frame = 1848
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL79:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}	@
.LCFI3:
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	fstmfdd	sp!, {d8}	@,
.LCFI4:
	.cfi_def_cfa_offset 44
	.cfi_offset 80, -44
	mov	r9, r1	@ outputmlen, outputmlen
	.loc 1 132 0
	mov	r2, #256	@,
.LVL80:
	movs	r1, #0	@,
.LVL81:
	.loc 1 131 0
	mov	sl, r0	@ m, m
	mov	fp, r3	@ c, c
	subw	sp, sp, #1868	@,,
.LCFI5:
	.cfi_def_cfa_offset 1912
	.loc 1 132 0
	add	r0, sp, #72	@,,
.LVL82:
	.loc 1 134 0
	add	r4, sp, #1912	@,,
	.loc 1 131 0
	ldr	r8, [sp, #1920]	@ ad, ad
	.loc 1 132 0
	bl	memset	@
.LVL83:
	.loc 1 134 0
	fldd	d16, .L300	@ int	@ tmp333,
	.loc 1 136 0
	vmov.i32	q1, #0  @ v16qi	@ tmp336,
	.loc 1 134 0
	ldrd	r0, [r4]	@, clen
	.loc 1 136 0
	vstr	d2, [sp, #40]	@, auth
	vstr	d3, [sp, #48]	@, auth
.LVL84:
	.loc 1 137 0
	vstr	d2, [sp, #56]	@, checksum
	vstr	d3, [sp, #64]	@, checksum
.LVL85:
	.loc 1 134 0
	fmdrr	d17, r0, r1	@ int	@,
	.loc 1 140 0
	add	r1, sp, #1928	@,,
	ldrd	r6, [r1]	@, adlen
	.loc 1 134 0
	vadd.i64	d0, d17, d16	@,, tmp333
	fmrrd	r2, r3, d0	@ int	@ prephitmp.208,
	.loc 1 140 0
	orrs	r1, r6, r7	@,
	.loc 1 134 0
	fstd	d0, [r9, #0]	@ int	@ prephitmp.208, *outputmlen_9(D)
	.loc 1 140 0
	bne	.L289	@,
	add	r3, sp, #584	@,,
	str	r3, [sp, #24]	@, %sfp
.LVL86:
.L206:
.LBB29:
.LBB30:
	.file 2 "/usr/lib/gcc/arm-linux-gnueabihf/4.7/include/arm_neon.h"
	.loc 2 7926 0
	add	lr, fp, r2	@ tmp399, c, prephitmp.208
.LBE30:
.LBE29:
	.loc 1 168 0
	ldr	r0, [sp, #1940]	@, k
	movs	r2, #0	@,
.LVL87:
	ldr	r1, [sp, #1936]	@, npub
	.loc 1 164 0
	vldr	d22, [sp, #40]	@, auth
	vldr	d23, [sp, #48]	@, auth
.LBB32:
.LBB31:
	.loc 2 7926 0
	vld1.8	{d20-d21}, [lr]	@ D.14304, MEM[(const __builtin_neon_qi[16] *)D.14130_59]
.LBE31:
.LBE32:
	.loc 1 164 0
	veor	q12, q10, q11	@ tmp404, D.14304,
	vstr	d24, [sp, #40]	@, auth
	vstr	d25, [sp, #48]	@, auth
.LVL88:
	.loc 1 168 0
	bl	tweakey_schedule	@
.LVL89:
	.loc 1 169 0
	ldrd	r2, [r9]	@ D.14128, *outputmlen_9(D)
	mov	r0, #256	@ tmp407,
	movs	r1, #0	@,
	cmp	r1, r3	@ tmp407, D.14128
	it eq
	cmpeq	r0, r2	@ tmp407, D.14128
	bcs	.L229	@,
	mov	r8, #256	@ idx,
	movs	r6, #0	@ idx,
	mov	r7, r8	@ idx, idx
	.loc 1 170 0
	mov	r4, r6	@ tmp517, idx
	ldr	r8, [sp, #24]	@ tmp512, %sfp
	movs	r5, #16	@ tmp518,
	b	.L212	@
.L301:
	.align	3
.L300:
	.word	-16
	.word	-1
	.word	15
	.word	0
.LVL90:
.L230:
	.loc 1 169 0
	mov	r7, lr	@ idx, idx
.LVL91:
.L212:
	.loc 1 170 0 discriminator 2
	add	r1, sp, #56	@,,
	movs	r2, #16	@,
	str	r4, [sp, #0]	@ tmp517,
	add	r0, fp, r6	@, c, idx
	mov	r3, r8	@, tmp512
	str	r4, [sp, #4]	@ tmp517,
	str	r1, [sp, #8]	@,
	add	r1, sl, r6	@, m, idx
	str	r5, [sp, #12]	@ tmp518,
	bl	decrypt_bloc128	@
.LVL92:
	.loc 1 171 0 discriminator 2
	mov	r1, r6	@, idx
	mov	r0, r8	@, tmp512
	bl	tweakey_increment	@
.LVL93:
	.loc 1 169 0 discriminator 2
	ldrd	r2, [r9]	@ D.14128, *outputmlen_9(D)
	add	lr, r7, #256	@ idx, idx,
	movs	r1, #0	@ D.14137,
	mov	r0, lr	@ D.14137, idx
	mov	r6, r7	@ idx, idx
	cmp	r1, r3	@ D.14137, D.14128
	it eq
	cmpeq	r0, r2	@ D.14137, D.14128
	bcc	.L230	@,
	mov	ip, r7	@ idx, idx
	mov	r4, r7	@ prephitmp.208, idx
	mov	r5, r1	@ prephitmp.208, D.14137
.LVL94:
.L211:
	.loc 1 174 0
	fldd	d19, .L300+8	@ int	@ tmp416,
	fmrrd	r0, r1, d19	@ int	@, tmp416
	and	r6, r2, r0	@ prephitmp.208, D.14128,
	and	r7, r3, r1	@ prephitmp.208, D.14128,
	orrs	r1, r6, r7	@, prephitmp.208
	it	ne
	movne	r8, r6	@ l, prephitmp.208
	bne	.L214	@,
	.loc 1 174 0 is_stmt 0 discriminator 2
	orrs	r0, r2, r3	@, D.14128
	it	eq
	moveq	r8, #0	@ l,
	bne	.L296	@,
.L214:
.LVL95:
	.loc 1 175 0 is_stmt 1 discriminator 6
	subs	r2, r2, r6	@ tmp417, D.14128, prephitmp.208
	sbc	r3, r3, r7	@ tmp417, D.14128, prephitmp.208
	.loc 1 179 0 discriminator 6
	ldr	r0, [sp, #24]	@, %sfp
	str	ip, [sp, #20]	@,
	.loc 1 175 0 discriminator 6
	subs	r4, r2, r4	@ tmp418, tmp417, prephitmp.208
	sbc	r5, r3, r5	@ tmp418, tmp417, prephitmp.208
	.loc 1 179 0 discriminator 6
	movs	r2, #13	@,
	.loc 1 175 0 discriminator 6
	lsrs	r3, r4, #4	@ tmp509, tmp418,
	orr	r6, r3, r5, lsl #28	@, fullblocks, tmp509,,
.LVL96:
	.loc 1 179 0 discriminator 6
	movs	r3, #0	@,
	mov	r1, r6	@, fullblocks
	lsls	r7, r6, #4	@ prephitmp.223, fullblocks,
	bl	tweakey_set	@
.LVL97:
	.loc 1 180 0 discriminator 6
	movs	r2, #14	@,
	movs	r3, #0	@,
	ldr	r0, [sp, #24]	@, %sfp
	mov	r1, r6	@, fullblocks
	bl	tweakey_set	@
.LVL98:
	.loc 1 181 0 discriminator 6
	movs	r2, #15	@,
	movs	r3, #0	@,
	ldr	r0, [sp, #24]	@, %sfp
	mov	r1, r6	@, fullblocks
	bl	tweakey_set	@
.LVL99:
	.loc 1 183 0 discriminator 6
	ldrd	r2, [r9]	@ D.14128, *outputmlen_9(D)
	ldr	ip, [sp, #20]	@,
	orrs	r1, r2, r3	@, D.14128
	beq	.L216	@,
.LBB33:
	.loc 1 184 0
	fldd	d21, .L300+8	@ int	@ tmp426,
	.loc 1 185 0
	ldr	r0, [sp, #24]	@, %sfp
	mov	r1, r6	@, fullblocks
	.loc 1 184 0
	fmrrd	r4, r5, d21	@ int	@, tmp426
	ands	r2, r2, r4	@, tmp425, D.14128,
	ands	r3, r3, r5	@,, D.14128,
	orrs	r5, r2, r3	@, tmp425
	.loc 1 185 0
	mov	r2, #12	@,
	.loc 1 184 0
	bne	.L297	@,
	.loc 1 187 0
	movs	r3, #192	@,
	str	ip, [sp, #20]	@,
	bl	tweakey_set	@
.LVL100:
	ldr	ip, [sp, #20]	@,
.L218:
	.loc 1 190 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	str	ip, [sp, #20]	@,
	add	r0, sp, #328	@,,
	.loc 1 191 0
	lsls	r7, r6, #4	@ D.14158, fullblocks,
	.loc 1 193 0
	movs	r4, #0	@ tmp443,
	.loc 1 190 0
	bl	memset	@
.LVL101:
	.loc 1 191 0
	add	r0, sp, #328	@,,
	lsl	r2, r8, #3	@ tmp438, l,
	.loc 1 193 0
	ldr	r3, [sp, #24]	@, %sfp
	.loc 1 191 0
	adds	r5, r0, r7	@ tmp436,, D.14158
	.loc 1 193 0
	mov	r1, r0	@,
	.loc 1 191 0
	strb	r2, [r5, #15]	@ tmp438, buffer2
	.loc 1 193 0
	movs	r2, #16	@,
	str	r4, [sp, #0]	@ tmp443,
	str	r4, [sp, #4]	@ tmp443,
	str	r4, [sp, #8]	@ tmp443,
	str	r4, [sp, #12]	@ tmp443,
	bl	encrypt_bloc128	@
.LVL102:
	.loc 1 195 0
	ldr	ip, [sp, #20]	@,
	cmp	r8, #0	@ l
	beq	.L216	@
	.loc 1 196 0
	ldr	r1, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	add	r0, r8, #-1	@ tmp525, l,
	ldrb	r4, [r5, #0]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	and	r2, r0, #3	@ tmp527, tmp525,
	rsb	lr, r8, r1	@ tmp447, l, *outputmlen_9(D)
	ldrb	r3, [fp, lr]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	r0, r3, r4	@ tmp455, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	.loc 1 195 0
	movs	r3, #1	@ i,
.LVL103:
	cmp	r3, r8	@ i, l
	.loc 1 196 0
	strb	r0, [sl, lr]	@ tmp455, *D.14166_103
	.loc 1 195 0
	beq	.L290	@,
	cbz	r2, .L221	@ tmp527,
	cmp	r2, #1	@ tmp527,
	beq	.L277	@,
	cmp	r2, #2	@ tmp527,
	beq	.L278	@,
	.loc 1 196 0
	ldr	r2, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	ldrb	r0, [r5, #1]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	rsb	r1, r8, r2	@ tmp650, l, *outputmlen_9(D)
	adds	r3, r1, #1	@ D.14165, tmp650,
	ldrb	r4, [fp, r3]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	lr, r4, r0	@ tmp655, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	strb	lr, [sl, r3]	@ tmp655, *D.14166_103
	.loc 1 195 0
	movs	r3, #2	@ i,
.L278:
	.loc 1 196 0
	ldr	r2, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	rsb	r1, r8, r2	@ tmp657, l, *outputmlen_9(D)
	ldrb	r2, [r5, r3]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	adds	r4, r1, r3	@ D.14165, tmp657, i
	.loc 1 195 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 196 0
	ldrb	r0, [fp, r4]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	lr, r0, r2	@ tmp662, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	strb	lr, [sl, r4]	@ tmp662, *D.14166_103
.L277:
	ldr	r1, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	ldrb	lr, [r5, r3]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	rsb	r4, r8, r1	@ tmp664, l, *outputmlen_9(D)
	adds	r2, r4, r3	@ D.14165, tmp664, i
	.loc 1 195 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 196 0
	ldrb	r0, [fp, r2]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	.loc 1 195 0
	cmp	r3, r8	@ i, l
	.loc 1 196 0
	eor	r1, r0, lr	@ tmp669, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	strb	r1, [sl, r2]	@ tmp669, *D.14166_103
	.loc 1 195 0
	beq	.L290	@,
.L221:
	.loc 1 196 0 discriminator 2
	ldr	r4, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	ldrb	lr, [r5, r3]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	rsb	r2, r8, r4	@ tmp536, l, *outputmlen_9(D)
	adds	r4, r2, r3	@ D.14165, tmp536, i
	.loc 1 195 0 discriminator 2
	adds	r2, r3, #1	@ tmp528, i,
	.loc 1 196 0 discriminator 2
	ldrb	r0, [fp, r4]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	r1, r0, lr	@ tmp541, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	strb	r1, [sl, r4]	@ tmp541, *D.14166_103
	ldr	r4, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	rsb	r0, r8, r4	@ tmp544, l, *outputmlen_9(D)
	add	lr, r0, r2	@ D.14165, tmp544, tmp528
	ldrb	r2, [r5, r2]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	ldrb	r1, [fp, lr]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	r4, r1, r2	@ tmp549, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	.loc 1 195 0 discriminator 2
	adds	r2, r3, #2	@ i, i,
	.loc 1 196 0 discriminator 2
	strb	r4, [sl, lr]	@ tmp549, *D.14166_103
	ldr	r0, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	rsb	lr, r8, r0	@ tmp552, l, *outputmlen_9(D)
	add	r1, lr, r2	@ D.14165, tmp552, i
	ldrb	r2, [r5, r2]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	ldrb	r4, [fp, r1]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	r0, r4, r2	@ tmp557, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	strb	r0, [sl, r1]	@ tmp557, *D.14166_103
	ldr	r4, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	.loc 1 195 0 discriminator 2
	adds	r1, r3, #3	@ i, i,
	adds	r3, r3, #4	@ i, i,
	cmp	r3, r8	@ i, l
	.loc 1 196 0 discriminator 2
	rsb	lr, r8, r4	@ tmp560, l, *outputmlen_9(D)
	add	r2, lr, r1	@ D.14165, tmp560, i
	ldrb	r1, [r5, r1]	@ zero_extendqisi2	@ MEM[base: D.14640_344, index: i_231, offset: 0B], MEM[base: D.14640_344, index: i_231, offset: 0B]
	ldrb	r0, [fp, r2]	@ zero_extendqisi2	@ *D.14167_109, *D.14167_109
	eor	r4, r0, r1	@ tmp565, *D.14167_109, MEM[base: D.14640_344, index: i_231, offset: 0B]
	strb	r4, [sl, r2]	@ tmp565, *D.14166_103
	.loc 1 195 0 discriminator 2
	bne	.L221	@,
.L290:
	.loc 1 197 0
	ldr	r5, [r9, #0]	@ *outputmlen_9(D), *outputmlen_9(D)
	add	r2, r8, #-1	@ tmp521, l,
.LBB34:
.LBB35:
	.loc 1 223 0
	ldrb	r0, [sp, #56]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	and	r1, r2, #7	@ tmp523, tmp521,
.LBE35:
.LBE34:
	.loc 1 197 0
	rsb	r3, r8, r5	@ tmp499, l, *outputmlen_9(D)
	add	lr, sl, r3	@ D.14175, m, tmp499
.LVL104:
.LBB37:
.LBB36:
	.loc 1 222 0
	movs	r3, #1	@ i,
.LVL105:
	.loc 1 223 0
	ldrb	r4, [lr, #0]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	.loc 1 222 0
	cmp	r3, r8	@ i, l
	.loc 1 223 0
	eor	r5, r0, r4	@ tmp613, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r5, [sp, #56]	@ tmp613, *D.14314_202
	.loc 1 222 0
	beq	.L216	@,
	cmp	r1, #0	@ tmp523
	beq	.L223	@
	cmp	r1, #1	@ tmp523,
	beq	.L271	@,
	cmp	r1, #2	@ tmp523,
	beq	.L272	@,
	cmp	r1, #3	@ tmp523,
	beq	.L273	@,
	cmp	r1, #4	@ tmp523,
	beq	.L274	@,
	cmp	r1, #5	@ tmp523,
	beq	.L275	@,
	cmp	r1, #6	@ tmp523,
	beq	.L276	@,
	.loc 1 223 0
	add	r2, sp, #56	@,,
.LVL106:
	ldrb	r1, [lr, #1]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r3, r2, r3	@ D.14314,, i
.LVL107:
	ldrb	r0, [r3, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r4, r0, r1	@ tmp618, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r4, [r3, #0]	@ tmp618, *D.14314_202
	.loc 1 222 0
	movs	r3, #2	@ i,
.LVL108:
.L276:
	.loc 1 223 0
	and	r2, r3, #15	@ tmp619, i,
	add	r5, sp, #56	@,,
.LVL109:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r1, r5, r2	@ D.14314,, tmp619
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
.LVL110:
	.loc 1 223 0
	ldrb	r4, [r1, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r2, r4, r0	@ tmp623, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r2, [r1, #0]	@ tmp623, *D.14314_202
.LVL111:
.L275:
	and	r5, r3, #15	@ tmp624, i,
	add	r1, sp, #56	@,,
.LVL112:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r2, r1, r5	@ D.14314,, tmp624
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
.LVL113:
	.loc 1 223 0
	ldrb	r4, [r2, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r5, r4, r0	@ tmp628, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r5, [r2, #0]	@ tmp628, *D.14314_202
.LVL114:
.L274:
	and	r1, r3, #15	@ tmp629, i,
	add	r2, sp, #56	@,,
.LVL115:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r5, r2, r1	@ D.14314,, tmp629
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
.LVL116:
	.loc 1 223 0
	ldrb	r4, [r5, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r1, r4, r0	@ tmp633, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r1, [r5, #0]	@ tmp633, *D.14314_202
.LVL117:
.L273:
	and	r2, r3, #15	@ tmp634, i,
	add	r5, sp, #56	@,,
.LVL118:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r1, r5, r2	@ D.14314,, tmp634
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
.LVL119:
	.loc 1 223 0
	ldrb	r4, [r1, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r2, r4, r0	@ tmp638, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r2, [r1, #0]	@ tmp638, *D.14314_202
.LVL120:
.L272:
	and	r5, r3, #15	@ tmp639, i,
	add	r1, sp, #56	@,,
.LVL121:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r2, r1, r5	@ D.14314,, tmp639
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
.LVL122:
	.loc 1 223 0
	ldrb	r4, [r2, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r5, r4, r0	@ tmp643, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r5, [r2, #0]	@ tmp643, *D.14314_202
.LVL123:
.L271:
	and	r1, r3, #15	@ tmp644, i,
	add	r2, sp, #56	@,,
.LVL124:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	adds	r5, r2, r1	@ D.14314,, tmp644
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
.LVL125:
	.loc 1 223 0
	ldrb	r4, [r5, #0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	.loc 1 222 0
	cmp	r3, r8	@ i, l
	.loc 1 223 0
	eor	r1, r4, r0	@ tmp648, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r1, [r5, #0]	@ tmp648, *D.14314_202
	.loc 1 222 0
	beq	.L216	@,
.LVL126:
.L223:
	.loc 1 223 0
	and	r2, r3, #15	@ tmp458, i,
	add	r5, sp, #56	@,,
.LVL127:
	ldrb	r0, [lr, r3]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r5, r2]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r1, r4, r0	@ tmp463, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r1, [r5, r2]	@ tmp463, *D.14314_202
	.loc 1 222 0
	adds	r2, r3, #1	@ tmp524, i,
	.loc 1 223 0
	and	r0, r2, #15	@ tmp567, tmp524,
	ldrb	r4, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	add	r2, sp, #56	@,,
	ldrb	r5, [r5, r0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
.LVL128:
	eor	r1, r5, r4	@ tmp571, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	.loc 1 222 0
	adds	r5, r3, #2	@ i, i,
	.loc 1 223 0
	strb	r1, [r2, r0]	@ tmp571, *D.14314_202
	and	r0, r5, #15	@ tmp573, i,
	ldrb	r1, [lr, r5]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r2, r0]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r5, r4, r1	@ tmp577, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r5, [r2, r0]	@ tmp577, *D.14314_202
	.loc 1 222 0
	adds	r0, r3, #3	@ i, i,
	.loc 1 223 0
	and	r1, r0, #15	@ tmp579, i,
	ldrb	r5, [lr, r0]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r2, r1]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r0, r4, r5	@ tmp583, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	.loc 1 222 0
	adds	r5, r3, #4	@ i, i,
	.loc 1 223 0
	strb	r0, [r2, r1]	@ tmp583, *D.14314_202
	and	r1, r5, #15	@ tmp585, i,
	ldrb	r0, [lr, r5]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r2, r1]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r5, r4, r0	@ tmp589, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	.loc 1 222 0
	adds	r0, r3, #5	@ i, i,
	.loc 1 223 0
	strb	r5, [r2, r1]	@ tmp589, *D.14314_202
	and	r1, r0, #15	@ tmp591, i,
	ldrb	r5, [lr, r0]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r2, r1]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r0, r4, r5	@ tmp595, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	.loc 1 222 0
	adds	r5, r3, #6	@ i, i,
	.loc 1 223 0
	strb	r0, [r2, r1]	@ tmp595, *D.14314_202
	and	r1, r5, #15	@ tmp597, i,
	ldrb	r0, [lr, r5]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r2, r1]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	eor	r5, r4, r0	@ tmp601, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	.loc 1 222 0
	adds	r0, r3, #7	@ i, i,
	adds	r3, r3, #8	@ i, i,
.LVL129:
	.loc 1 223 0
	strb	r5, [r2, r1]	@ tmp601, *D.14314_202
	and	r1, r0, #15	@ tmp603, i,
	ldrb	r5, [lr, r0]	@ zero_extendqisi2	@ MEM[base: D.14175_3, index: i_228, offset: 0B], MEM[base: D.14175_3, index: i_228, offset: 0B]
	ldrb	r4, [r2, r1]	@ zero_extendqisi2	@ *D.14314_202, *D.14314_202
	.loc 1 222 0
	cmp	r3, r8	@ i, l
	.loc 1 223 0
	eor	r0, r4, r5	@ tmp607, *D.14314_202, MEM[base: D.14175_3, index: i_228, offset: 0B]
	strb	r0, [r2, r1]	@ tmp607, *D.14314_202
	.loc 1 222 0
	bne	.L223	@,
.LVL130:
.L216:
.LBE36:
.LBE37:
.LBE33:
	.loc 1 201 0
	add	r1, fp, ip	@, c, idx
	mov	r2, r7	@, prephitmp.223
	str	ip, [sp, #20]	@,
	add	r0, sp, #72	@,,
	bl	memcpy	@
.LVL131:
	.loc 1 203 0
	fldd	d23, .L302	@ int	@ tmp477,
.LBB38:
.LBB39:
	.loc 2 8322 0
	vldr	d26, [sp, #40]	@, auth
	vldr	d27, [sp, #48]	@, auth
.LBE39:
.LBE38:
	.loc 1 203 0
	fldd	d25, [r9, #0]	@ int	@, *outputmlen_9(D)
	.loc 1 202 0
	add	r3, sp, #72	@,,
	.loc 1 204 0
	mov	r1, r6	@, fullblocks
	.loc 1 202 0
	adds	r4, r3, r7	@ D.14179,, prephitmp.223
.LVL132:
.LBB41:
.LBB40:
	.loc 2 8322 0
	vst1.8	{d26-d27}, [r4]	@ auth, MEM[(__builtin_neon_qi[16] *)D.14179_128]
.LBE40:
.LBE41:
	.loc 1 203 0
	ldr	ip, [sp, #20]	@,
	vand	d27, d25, d23	@,, tmp477
	fmrrd	r2, r3, d27	@ int	@ tmp475,
	orrs	r0, r2, r3	@, tmp475
	.loc 1 204 0
	ldr	r0, [sp, #24]	@, %sfp
	mov	r2, #12	@,
	.loc 1 203 0
	beq	.L224	@,
.LVL133:
	.loc 1 204 0
	movs	r3, #232	@,
	bl	tweakey_set	@
.LVL134:
	ldr	ip, [sp, #20]	@,
.L225:
	.loc 1 208 0
	movs	r5, #0	@ tmp484,
	add	r1, sp, #56	@,,
	ldr	r3, [sp, #24]	@, %sfp
	add	r0, sp, #72	@,,
	adds	r2, r6, #1	@, fullblocks,
	str	r6, [sp, #12]	@ fullblocks,
	str	r1, [sp, #8]	@,
	mov	r1, r0	@,
	str	r5, [sp, #0]	@ tmp484,
	str	r5, [sp, #4]	@ tmp484,
	str	ip, [sp, #20]	@,
	bl	decrypt_bloc128	@
.LVL135:
	.loc 1 209 0
	ldr	ip, [sp, #20]	@,
	add	r1, sp, #72	@,,
	mov	r2, r7	@, prephitmp.223
	add	r0, sl, ip	@, m, idx
	bl	memcpy	@
.LVL136:
	.loc 1 212 0
	add	r0, sp, #56	@,,
	mov	r1, r4	@, D.14179
	movs	r2, #16	@,
	bl	memcmp	@
.LVL137:
	cmp	r0, #0	@ tmp494
	bne	.L298	@
.L291:
	.loc 1 218 0
	add	sp, sp, #844	@,,
	add	sp, sp, #1024	@,
	fldmfdd	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL138:
.L224:
	.loc 1 206 0
	movs	r3, #224	@,
	str	ip, [sp, #20]	@,
	bl	tweakey_set	@
.LVL139:
	ldr	ip, [sp, #20]	@,
	b	.L225	@
.LVL140:
.L297:
.LBB42:
	.loc 1 185 0
	movs	r3, #200	@,
	str	ip, [sp, #20]	@,
	bl	tweakey_set	@
.LVL141:
	ldr	ip, [sp, #20]	@,
	b	.L218	@
.LVL142:
.L296:
.LBE42:
	.loc 1 174 0
	movs	r6, #16	@ prephitmp.208,
	movs	r7, #0	@ prephitmp.208,
	mov	r8, #16	@ l,
	b	.L214	@
.LVL143:
.L289:
.LBB43:
	.loc 1 142 0
	add	r5, sp, #584	@,,
	movs	r2, #128	@,
	ldr	r0, [sp, #1940]	@, k
	ldr	r1, [sp, #1936]	@, npub
	mov	r3, r5	@,
	.loc 1 144 0
	add	r7, sp, #1928	@,,
	.loc 1 142 0
	str	r5, [sp, #24]	@, %sfp
	bl	tweakey_schedule	@
.LVL144:
	.loc 1 144 0
	ldrd	r0, [r7]	@, adlen
	mov	r2, #256	@ tmp341,
	movs	r3, #0	@,
	cmp	r3, r1	@ tmp341,
	it eq
	cmpeq	r2, r0	@ tmp341,
	bcs	.L227	@,
	mov	r2, #256	@ idx,
	movs	r7, #0	@ idx,
	str	sl, [sp, #28]	@ m, %sfp
	str	r9, [sp, #32]	@ outputmlen, %sfp
	.loc 1 145 0
	mov	r5, r7	@ tmp519, idx
	movs	r6, #16	@ tmp520,
	str	fp, [sp, #36]	@ c, %sfp
	mov	r9, r2	@ idx, idx
.LVL145:
	mov	sl, r0	@ adlen,
.LVL146:
	mov	fp, r1	@ adlen,
.LVL147:
	ldr	r4, [sp, #24]	@ tmp512, %sfp
.LVL148:
	b	.L208	@
.LVL149:
.L228:
	.loc 1 144 0
	mov	r9, ip	@ idx, idx
.LVL150:
.L208:
	.loc 1 145 0 discriminator 2
	add	r0, sp, #40	@,,
	movs	r1, #0	@,
	str	r5, [sp, #0]	@ tmp519,
	mov	r2, r1	@,
	mov	r3, r4	@, tmp512
	str	r5, [sp, #4]	@ tmp519,
	str	r0, [sp, #8]	@,
	add	r0, r8, r7	@, ad, idx
	str	r6, [sp, #12]	@ tmp520,
	bl	encrypt_bloc128	@
.LVL151:
	.loc 1 146 0 discriminator 2
	mov	r1, r7	@, idx
	mov	r0, r4	@, tmp512
	bl	tweakey_increment	@
.LVL152:
	.loc 1 144 0 discriminator 2
	add	ip, r9, #256	@ idx, idx,
	movs	r3, #0	@ D.14113,
	mov	r2, ip	@ D.14113, idx
	mov	r7, r9	@ idx, idx
	cmp	r3, fp	@ D.14113, adlen
	it eq
	cmpeq	r2, sl	@ D.14113, adlen
	bcc	.L228	@,
	mov	r4, r9	@ idx, idx
	ldr	sl, [sp, #28]	@ m, %sfp
	mov	r6, r7	@ prephitmp.232, idx
	ldr	r9, [sp, #32]	@ outputmlen, %sfp
.LVL153:
	mov	r7, r3	@ prephitmp.232, D.14113
	ldr	fp, [sp, #36]	@ c, %sfp
.LVL154:
.L207:
	.loc 1 150 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #328	@,,
	bl	memset	@
.LVL155:
	.loc 1 151 0
	ldr	r3, [sp, #1928]	@, adlen
	add	r1, r8, r4	@, ad, idx
	add	r0, sp, #328	@,,
	subs	r2, r3, r4	@,, idx
	bl	memcpy	@
.LVL156:
	.loc 1 152 0
	fldd	d1, .L302	@ int	@ tmp362,
	add	r1, sp, #1928	@,,
	ldrd	r0, [r1]	@, adlen
	fmdrr	d3, r0, r1	@ int	@,
	vand	d4, d3, d1	@,, tmp362
	fmrrd	r4, r5, d4	@ int	@ tmp361,
	orrs	r5, r4, r5	@, tmp361
	beq	.L299	@,
	.loc 1 155 0
	add	lr, sp, #1928	@,,
	fldd	d5, .L302+8	@ int	@ tmp375,
	ldr	r0, [sp, #24]	@, %sfp
	ldrd	r2, [lr]	@, adlen
	subs	r6, r2, r6	@ prephitmp.232,, prephitmp.232
	sbc	r7, r3, r7	@ prephitmp.232,, prephitmp.232
	fmrrd	r2, r3, d5	@ int	@ tmp374, tmp375
	adds	r5, r2, r6	@ tmp374, tmp374, prephitmp.232
	adc	ip, r3, r7	@,, prephitmp.232
	lsrs	r3, r5, #4	@ tmp505, tmp374,
	movs	r2, #12	@,
	orr	r4, r3, ip, lsl #28	@, prephitmp.234, tmp505,,
	movs	r3, #216	@,
	mov	r1, r4	@, prephitmp.234
	bl	tweakey_set	@
.LVL157:
	.loc 1 156 0
	add	r1, sp, #328	@,,
	movs	r2, #128	@ tmp383,
	adds	r0, r1, r6	@ tmp382,, prephitmp.232
	strb	r2, [r0, #0]	@ tmp383, buffer2
.L210:
	.loc 1 158 0
	mov	r1, r4	@, prephitmp.234
	movs	r2, #13	@,
	ldr	r0, [sp, #24]	@, %sfp
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL158:
	.loc 1 159 0
	mov	r1, r4	@, prephitmp.234
	movs	r2, #14	@,
	ldr	r0, [sp, #24]	@, %sfp
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL159:
	.loc 1 160 0
	mov	r1, r4	@, prephitmp.234
	movs	r2, #15	@,
	ldr	r0, [sp, #24]	@, %sfp
	movs	r3, #0	@,
	bl	tweakey_set	@
.LVL160:
	.loc 1 161 0
	fldd	d18, .L302	@ int	@ tmp394,
	movs	r1, #0	@ tmp390,
	add	r2, sp, #40	@,,
	ldr	r3, [sp, #24]	@, %sfp
	add	r0, sp, #328	@,,
	str	r2, [sp, #8]	@,
	mov	r2, r1	@,
	fmrrd	r4, r5, d18	@ int	@, tmp394
	str	r1, [sp, #0]	@ tmp390,
	str	r1, [sp, #4]	@ tmp390,
	adds	r6, r6, r4	@ tmp393, prephitmp.232,
	adc	r7, r7, r5	@, prephitmp.232,
	lsrs	r5, r6, #4	@ tmp507, tmp393,
	orr	r4, r5, r7, lsl #28	@, tmp532, tmp507,,
	str	r4, [sp, #12]	@ tmp532,
	bl	encrypt_bloc128	@
.LVL161:
	ldrd	r2, [r9]	@ prephitmp.208, *outputmlen_9(D)
	ldr	r3, [sp, #24]	@, %sfp
	b	.L206	@
.L299:
	.loc 1 153 0
	fldd	d8, .L302+8	@ int	@ tmp365,
	ldr	r0, [sp, #24]	@, %sfp
	vadd.i64	d7, d3, d8	@ tmp364, tmp75, tmp365
	fmrrd	r2, r3, d7	@ int	@ tmp366, tmp364
	subs	r2, r2, r6	@ tmp366, tmp366, prephitmp.232
	sbc	r3, r3, r7	@ tmp366, tmp366, prephitmp.232
	lsrs	r5, r2, #4	@ tmp501, tmp366,
	movs	r2, #12	@,
	orr	r1, r5, r3, lsl #28	@,, tmp501,,
	movs	r3, #208	@,
	bl	tweakey_set	@
.LVL162:
	fmrrd	r2, r3, d8	@ int	@ pretmp.231, tmp365
	add	ip, sp, #1928	@,,
	ldrd	r4, [ip]	@, adlen
	subs	r6, r4, r6	@ prephitmp.232,, prephitmp.232
	sbc	r7, r5, r7	@ prephitmp.232,, prephitmp.232
	adds	r1, r2, r6	@ pretmp.231, pretmp.231, prephitmp.232
	adc	r3, r3, r7	@ pretmp.231, pretmp.231, prephitmp.232
	lsrs	r0, r1, #4	@ tmp503, pretmp.231,
	orr	r4, r0, r3, lsl #28	@, prephitmp.234, tmp503, pretmp.231,
	b	.L210	@
.LVL163:
.L229:
.LBE43:
	.loc 1 169 0
	movs	r4, #0	@ prephitmp.208,
	movs	r5, #0	@ prephitmp.208,
	mov	ip, #0	@ idx,
	b	.L211	@
.LVL164:
.L227:
.LBB44:
	.loc 1 144 0
	movs	r6, #0	@ prephitmp.232,
	movs	r7, #0	@ prephitmp.232,
	movs	r4, #0	@ idx,
	b	.L207	@
.LVL165:
.L298:
.LBE44:
	.loc 1 213 0
	mov	r0, sl	@, m
	mov	r1, r5	@, tmp484
	ldr	r2, [r9, #0]	@, *outputmlen_9(D)
	bl	memset	@
.LVL166:
	.loc 1 214 0
	mov	r0, #-1	@ D.14189,
	b	.L291	@
.L303:
	.align	3
.L302:
	.word	15
	.word	0
	.word	-1
	.word	-1
	.cfi_endproc
.LFE1883:
	.size	crypto_aead_decrypt, .-crypto_aead_decrypt
	.align	2
	.global	update_checksum
	.thumb
	.thumb_func
	.type	update_checksum, %function
update_checksum:
.LFB1884:
	.loc 1 220 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL167:
	push	{r4, r5, r6, r7}	@
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 7, -4
	.loc 1 222 0
	cmp	r2, #0	@ len
	beq	.L304	@
	.loc 1 223 0
	ldrb	r5, [r1, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	subs	r4, r2, #1	@ tmp160, len,
	ldrb	r3, [r0, #0]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	and	r4, r4, #7	@ tmp162, tmp160,
	eors	r3, r3, r5	@, tmp158, MEM[base: in8_10(D), index: i_20, offset: 0B], *D.14103_8
	strb	r3, [r1, #0]	@ tmp158, *D.14103_8
	.loc 1 222 0
	movs	r3, #1	@ i,
.LVL168:
	cmp	r3, r2	@ i, len
	beq	.L304	@,
	cmp	r4, #0	@ tmp162
	beq	.L305	@
	cmp	r4, #1	@ tmp162,
	beq	.L332	@,
	cmp	r4, #2	@ tmp162,
	beq	.L333	@,
	cmp	r4, #3	@ tmp162,
	beq	.L334	@,
	cmp	r4, #4	@ tmp162,
	beq	.L335	@,
	cmp	r4, #5	@ tmp162,
	beq	.L336	@,
	cmp	r4, #6	@ tmp162,
	beq	.L337	@,
	.loc 1 223 0
	adds	r6, r1, r3	@ D.14103, cksum, i
	ldrb	ip, [r0, #1]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	movs	r3, #2	@ i,
	.loc 1 223 0
	ldrb	r5, [r6, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r4, r5, ip	@ tmp217, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r4, [r6, #0]	@ tmp217, *D.14103_8
.L337:
	and	r6, r3, #15	@ tmp218, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	ip, r1, r6	@ D.14103, cksum, tmp218
	ldrb	r4, [ip, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r6, r4, r5	@ tmp222, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [ip, #0]	@ tmp222, *D.14103_8
.L336:
	and	ip, r3, #15	@ tmp223, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r4, r1, ip	@ D.14103, cksum, tmp223
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eors	r6, r6, r5	@, tmp227, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp227, *D.14103_8
.L335:
	and	ip, r3, #15	@ tmp228, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r4, r1, ip	@ D.14103, cksum, tmp228
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eors	r6, r6, r5	@, tmp232, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp232, *D.14103_8
.L334:
	and	ip, r3, #15	@ tmp233, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r4, r1, ip	@ D.14103, cksum, tmp233
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eors	r6, r6, r5	@, tmp237, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp237, *D.14103_8
.L333:
	and	ip, r3, #15	@ tmp238, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r4, r1, ip	@ D.14103, cksum, tmp238
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eors	r6, r6, r5	@, tmp242, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp242, *D.14103_8
.L332:
	and	ip, r3, #15	@ tmp243, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 223 0
	add	r4, r1, ip	@ D.14103, cksum, tmp243
	.loc 1 222 0
	cmp	r3, r2	@ i, len
	.loc 1 223 0
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r6, r5	@ tmp247, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r4, #0]	@ tmp247, *D.14103_8
	.loc 1 222 0
	beq	.L304	@,
.L305:
	.loc 1 223 0 discriminator 2
	and	r7, r3, #15	@ tmp166, i,
	ldrb	r6, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r4, [r1, r7]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r4, r6	@ tmp170, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0 discriminator 2
	adds	r4, r3, #1	@ tmp163, i,
	.loc 1 223 0 discriminator 2
	and	ip, r4, #15	@ tmp172, tmp163,
	strb	r5, [r1, r7]	@ tmp170, *D.14103_8
	ldrb	r6, [r0, r4]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0 discriminator 2
	adds	r4, r3, #2	@ i, i,
	.loc 1 223 0 discriminator 2
	ldrb	r7, [r1, ip]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r7, r6	@ tmp176, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp176, *D.14103_8
	and	ip, r4, #15	@ tmp178, i,
	ldrb	r5, [r0, r4]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r4, r6, r5	@ tmp182, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0 discriminator 2
	adds	r5, r3, #3	@ i, i,
	.loc 1 223 0 discriminator 2
	strb	r4, [r1, ip]	@ tmp182, *D.14103_8
	and	ip, r5, #15	@ tmp184, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r6, r4	@ tmp188, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp188, *D.14103_8
	.loc 1 222 0 discriminator 2
	adds	r5, r3, #4	@ i, i,
	.loc 1 223 0 discriminator 2
	and	ip, r5, #15	@ tmp190, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r6, r4	@ tmp194, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp194, *D.14103_8
	.loc 1 222 0 discriminator 2
	adds	r5, r3, #5	@ i, i,
	.loc 1 223 0 discriminator 2
	and	ip, r5, #15	@ tmp196, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r6, r4	@ tmp200, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp200, *D.14103_8
	.loc 1 222 0 discriminator 2
	adds	r5, r3, #6	@ i, i,
	.loc 1 223 0 discriminator 2
	and	ip, r5, #15	@ tmp202, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r6, r4	@ tmp206, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp206, *D.14103_8
	.loc 1 222 0 discriminator 2
	adds	r5, r3, #7	@ i, i,
	adds	r3, r3, #8	@ i, i,
	.loc 1 223 0 discriminator 2
	and	r4, r5, #15	@ tmp208, i,
	ldrb	ip, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 222 0 discriminator 2
	cmp	r3, r2	@ i, len
	.loc 1 223 0 discriminator 2
	ldrb	r6, [r1, r4]	@ zero_extendqisi2	@ *D.14103_8, *D.14103_8
	eor	r5, r6, ip	@ tmp212, *D.14103_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, r4]	@ tmp212, *D.14103_8
	.loc 1 222 0 discriminator 2
	bne	.L305	@,
.L304:
	.loc 1 224 0
	pop	{r4, r5, r6, r7}
	bx	lr
	.cfi_endproc
.LFE1884:
	.size	update_checksum, .-update_checksum
.Letext0:
	.file 3 "/usr/lib/gcc/arm-linux-gnueabihf/4.7/include/stddef.h"
	.file 4 "/usr/include/stdint.h"
	.file 5 "crypto_aead/scream12v1/neon/tae.h"
	.file 6 "/usr/include/string.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1177
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x1
	.4byte	.LASF58
	.4byte	.LASF59
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x3
	.byte	0xd5
	.4byte	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x4
	.byte	0x31
	.4byte	0x3e
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF14
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.4byte	.LASF15
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF16
	.uleb128 0x3
	.byte	0x1
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF18
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF20
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x2
	.byte	0x34
	.4byte	0xd2
	.uleb128 0x5
	.byte	0x1
	.4byte	0x7a
	.4byte	0xdf
	.uleb128 0x6
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x2
	.byte	0x3b
	.4byte	0xea
	.uleb128 0x5
	.byte	0x1
	.4byte	0xab
	.4byte	0xf7
	.uleb128 0x6
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF23
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x5
	.byte	0xd
	.4byte	0xdf
	.uleb128 0x7
	.4byte	.LASF60
	.byte	0x4
	.byte	0x5
	.byte	0x2d
	.4byte	0x14d
	.uleb128 0x8
	.4byte	.LASF25
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF26
	.sleb128 192
	.uleb128 0x8
	.4byte	.LASF27
	.sleb128 200
	.uleb128 0x8
	.4byte	.LASF28
	.sleb128 128
	.uleb128 0x8
	.4byte	.LASF29
	.sleb128 208
	.uleb128 0x8
	.4byte	.LASF30
	.sleb128 216
	.uleb128 0x8
	.4byte	.LASF31
	.sleb128 224
	.uleb128 0x8
	.4byte	.LASF32
	.sleb128 232
	.byte	0
	.uleb128 0x9
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x1ef4
	.byte	0x1
	.4byte	0xdf
	.byte	0x3
	.4byte	0x16c
	.uleb128 0xa
	.ascii	"__a\000"
	.byte	0x2
	.2byte	0x1ef4
	.4byte	0x16c
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x172
	.uleb128 0xc
	.4byte	0x61
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF48
	.byte	0x1
	.byte	0xdc
	.byte	0x1
	.byte	0x1
	.4byte	0x1b0
	.uleb128 0xe
	.ascii	"in8\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x16c
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0xdc
	.4byte	0x1b0
	.uleb128 0xe
	.ascii	"len\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x25
	.uleb128 0x10
	.ascii	"i\000"
	.byte	0x1
	.byte	0xdd
	.4byte	0x25
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xfe
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x2080
	.byte	0x1
	.byte	0x3
	.4byte	0x1dd
	.uleb128 0xa
	.ascii	"__a\000"
	.byte	0x2
	.2byte	0x2080
	.4byte	0x1dd
	.uleb128 0xa
	.ascii	"__b\000"
	.byte	0x2
	.2byte	0x2080
	.4byte	0xdf
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x61
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF45
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.4byte	0x53
	.4byte	.LFB1882
	.4byte	.LFE1882
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x985
	.uleb128 0x13
	.ascii	"c\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x985
	.4byte	.LLST1
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x1
	.byte	0xb
	.4byte	0x98b
	.4byte	.LLST2
	.uleb128 0x13
	.ascii	"m\000"
	.byte	0x1
	.byte	0xc
	.4byte	0x991
	.4byte	.LLST3
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0xc
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii	"ad\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xd
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x15
	.4byte	.LASF37
	.byte	0x1
	.byte	0xe
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x15
	.4byte	.LASF38
	.byte	0x1
	.byte	0xf
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x16
	.ascii	"k\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x12
	.4byte	0x99c
	.byte	0x3
	.byte	0x91
	.sleb128 -1840
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x13
	.4byte	0x9ac
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0x18
	.ascii	"pad\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x9bc
	.byte	0x3
	.byte	0x91
	.sleb128 -1872
	.uleb128 0x19
	.4byte	.LASF41
	.byte	0x1
	.byte	0x16
	.4byte	0x1b0
	.4byte	.LLST4
	.uleb128 0x17
	.4byte	.LASF42
	.byte	0x1
	.byte	0x17
	.4byte	0xfe
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x25
	.4byte	.LLST5
	.uleb128 0x1a
	.ascii	"l\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x53
	.4byte	.LLST6
	.uleb128 0x19
	.4byte	.LASF43
	.byte	0x1
	.byte	0x5f
	.4byte	0x53
	.4byte	.LLST7
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.byte	0x75
	.4byte	0x30
	.4byte	.LLST8
	.uleb128 0x1b
	.4byte	.Ldebug_ranges0+0
	.4byte	0x4e9
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x25
	.4byte	.LLST9
	.uleb128 0x17
	.4byte	.LASF44
	.byte	0x1
	.byte	0x24
	.4byte	0x99c
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1c
	.4byte	.LVL52
	.4byte	0x1044
	.4byte	0x34d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x9
	.byte	0x80
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 28
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 32
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL56
	.4byte	0x1067
	.4byte	0x38f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x75
	.sleb128 0
	.byte	0x7a
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL57
	.4byte	0x109e
	.4byte	0x3a9
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL59
	.4byte	0x10b7
	.4byte	0x3cb
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL60
	.4byte	0x10da
	.4byte	0x3f4
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x6
	.byte	0x79
	.sleb128 0
	.byte	0x6
	.byte	0x77
	.sleb128 0
	.byte	0x1c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL61
	.4byte	0x1102
	.4byte	0x419
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xd8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL62
	.4byte	0x1102
	.4byte	0x43e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL63
	.4byte	0x1102
	.4byte	0x463
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL64
	.4byte	0x1102
	.4byte	0x488
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL65
	.4byte	0x1067
	.4byte	0x4cd
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x7
	.byte	0x77
	.sleb128 0
	.byte	0x4c
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x21
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL74
	.4byte	0x1102
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xd0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	0x607
	.uleb128 0x17
	.4byte	.LASF44
	.byte	0x1
	.byte	0x49
	.4byte	0x99c
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x20
	.4byte	0x177
	.4byte	.LBB18
	.4byte	.LBE18
	.byte	0x1
	.byte	0x4e
	.4byte	0x547
	.uleb128 0x21
	.4byte	0x19b
	.4byte	.LLST10
	.uleb128 0x21
	.4byte	0x190
	.4byte	.LLST11
	.uleb128 0x21
	.4byte	0x185
	.4byte	.LLST12
	.uleb128 0x22
	.4byte	.LBB19
	.4byte	.LBE19
	.uleb128 0x23
	.4byte	0x1a6
	.4byte	.LLST13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL18
	.4byte	0x10b7
	.4byte	0x568
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL19
	.4byte	0x10da
	.4byte	0x58c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x8
	.byte	0xf0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x77
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL20
	.4byte	0x1067
	.4byte	0x5cc
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL24
	.4byte	0x109e
	.4byte	0x5e6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL26
	.4byte	0x10da
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x8
	.byte	0xf0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x78
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	0x177
	.4byte	.LBB20
	.4byte	.Ldebug_ranges0+0x28
	.byte	0x1
	.byte	0x56
	.4byte	0x645
	.uleb128 0x21
	.4byte	0x19b
	.4byte	.LLST14
	.uleb128 0x21
	.4byte	0x190
	.4byte	.LLST15
	.uleb128 0x21
	.4byte	0x185
	.4byte	.LLST16
	.uleb128 0x25
	.4byte	.Ldebug_ranges0+0x48
	.uleb128 0x23
	.4byte	0x1a6
	.4byte	.LLST17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL4
	.4byte	0x10b7
	.4byte	0x666
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL8
	.4byte	0x1044
	.4byte	0x68d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 28
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 32
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL11
	.4byte	0x1067
	.4byte	0x6d7
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x78
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x7
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL12
	.4byte	0x109e
	.4byte	0x6f1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL14
	.4byte	0x1102
	.4byte	0x716
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xc0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL15
	.4byte	0x1102
	.4byte	0x73a
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL16
	.4byte	0x1102
	.4byte	0x75e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL17
	.4byte	0x1102
	.4byte	0x782
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL32
	.4byte	0x1102
	.4byte	0x7a6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL33
	.4byte	0x1102
	.4byte	0x7ca
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL34
	.4byte	0x1102
	.4byte	0x7ee
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL35
	.4byte	0x1102
	.4byte	0x813
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xe8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL40
	.4byte	0x1102
	.4byte	0x837
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL41
	.4byte	0x1102
	.4byte	0x85b
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL42
	.4byte	0x1102
	.4byte	0x87f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL43
	.4byte	0x1102
	.4byte	0x8a4
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xe0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL44
	.4byte	0x1067
	.4byte	0x8e1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL46
	.4byte	0x10da
	.4byte	0x904
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x78
	.sleb128 0
	.byte	0x7a
	.sleb128 0
	.byte	0x22
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL47
	.4byte	0x10da
	.4byte	0x928
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x76
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1872
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL67
	.4byte	0x1102
	.4byte	0x94d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xc8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL69
	.4byte	0x10da
	.4byte	0x970
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x79
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL71
	.4byte	0x10b7
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x3e
	.uleb128 0xb
	.byte	0x4
	.4byte	0x73
	.uleb128 0xb
	.byte	0x4
	.4byte	0x997
	.uleb128 0xc
	.4byte	0x3e
	.uleb128 0x26
	.4byte	0x61
	.4byte	0x9ac
	.uleb128 0x27
	.4byte	0x37
	.byte	0xff
	.byte	0
	.uleb128 0x26
	.4byte	0xfe
	.4byte	0x9bc
	.uleb128 0x27
	.4byte	0x37
	.byte	0x4f
	.byte	0
	.uleb128 0x26
	.4byte	0x61
	.4byte	0x9cc
	.uleb128 0x27
	.4byte	0x37
	.byte	0xf
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF46
	.byte	0x1
	.byte	0x7e
	.byte	0x1
	.4byte	0x53
	.4byte	.LFB1883
	.4byte	.LFE1883
	.4byte	.LLST18
	.byte	0x1
	.4byte	0x100f
	.uleb128 0x13
	.ascii	"m\000"
	.byte	0x1
	.byte	0x7e
	.4byte	0x985
	.4byte	.LLST19
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.byte	0x7e
	.4byte	0x98b
	.4byte	.LLST20
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x1
	.byte	0x7f
	.4byte	0x985
	.4byte	.LLST21
	.uleb128 0x13
	.ascii	"c\000"
	.byte	0x1
	.byte	0x80
	.4byte	0x991
	.4byte	.LLST22
	.uleb128 0x15
	.4byte	.LASF34
	.byte	0x1
	.byte	0x80
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii	"ad\000"
	.byte	0x1
	.byte	0x81
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x81
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x15
	.4byte	.LASF38
	.byte	0x1
	.byte	0x82
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x16
	.ascii	"k\000"
	.byte	0x1
	.byte	0x83
	.4byte	0x991
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x84
	.4byte	0x99c
	.byte	0x3
	.byte	0x91
	.sleb128 -1840
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x85
	.4byte	0x9ac
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0x19
	.4byte	.LASF42
	.byte	0x1
	.byte	0x88
	.4byte	0xfe
	.4byte	.LLST23
	.uleb128 0x17
	.4byte	.LASF41
	.byte	0x1
	.byte	0x89
	.4byte	0xfe
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0xa7
	.4byte	0x25
	.4byte	.LLST24
	.uleb128 0x1a
	.ascii	"l\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x53
	.4byte	.LLST25
	.uleb128 0x19
	.4byte	.LASF43
	.byte	0x1
	.byte	0xaf
	.4byte	0x53
	.4byte	.LLST26
	.uleb128 0x24
	.4byte	0x14d
	.4byte	.LBB29
	.4byte	.Ldebug_ranges0+0x68
	.byte	0x1
	.byte	0xa4
	.4byte	0xae9
	.uleb128 0x21
	.4byte	0x15f
	.4byte	.LLST27
	.byte	0
	.uleb128 0x1b
	.4byte	.Ldebug_ranges0+0x80
	.4byte	0xbeb
	.uleb128 0x17
	.4byte	.LASF44
	.byte	0x1
	.byte	0xbe
	.4byte	0x99c
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.byte	0xc2
	.4byte	0x30
	.4byte	.LLST28
	.uleb128 0x24
	.4byte	0x177
	.4byte	.LBB34
	.4byte	.Ldebug_ranges0+0x98
	.byte	0x1
	.byte	0xc5
	.4byte	0xb4c
	.uleb128 0x21
	.4byte	0x19b
	.4byte	.LLST29
	.uleb128 0x21
	.4byte	0x190
	.4byte	.LLST30
	.uleb128 0x21
	.4byte	0x185
	.4byte	.LLST31
	.uleb128 0x25
	.4byte	.Ldebug_ranges0+0xb0
	.uleb128 0x23
	.4byte	0x1a6
	.4byte	.LLST32
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL100
	.4byte	0x1102
	.4byte	0xb73
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xc0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL101
	.4byte	0x10b7
	.4byte	0xb95
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL102
	.4byte	0x1067
	.4byte	0xbda
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL141
	.4byte	0x1102
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xc8
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	0x1b6
	.4byte	.LBB38
	.4byte	.Ldebug_ranges0+0xc8
	.byte	0x1
	.byte	0xca
	.4byte	0xc11
	.uleb128 0x21
	.4byte	0x1d0
	.4byte	.LLST33
	.uleb128 0x21
	.4byte	0x1c4
	.4byte	.LLST34
	.byte	0
	.uleb128 0x1b
	.4byte	.Ldebug_ranges0+0xe0
	.4byte	0xe06
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x25
	.4byte	.LLST35
	.uleb128 0x17
	.4byte	.LASF44
	.byte	0x1
	.byte	0x96
	.4byte	0x99c
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1c
	.4byte	.LVL144
	.4byte	0x1044
	.4byte	0xc60
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x9
	.byte	0x80
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x74
	.sleb128 28
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL151
	.4byte	0x1067
	.4byte	0xca6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x78
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1872
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL152
	.4byte	0x109e
	.4byte	0xcc0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL155
	.4byte	0x10b7
	.4byte	0xce2
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL156
	.4byte	0x10da
	.4byte	0xd0a
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x6
	.byte	0x91
	.sleb128 16
	.byte	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x78
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL157
	.4byte	0x1102
	.4byte	0xd31
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xd8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL158
	.4byte	0x1102
	.4byte	0xd58
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL159
	.4byte	0x1102
	.4byte	0xd7f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL160
	.4byte	0x1102
	.4byte	0xda6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL161
	.4byte	0x1067
	.4byte	0xde8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1872
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL162
	.4byte	0x1102
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xd0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL83
	.4byte	0x10b7
	.4byte	0xe27
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x74
	.sleb128 -1840
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL89
	.4byte	0x1044
	.4byte	0xe48
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 24
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 28
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL92
	.4byte	0x1125
	.4byte	0xe91
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x7a
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x7b
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL93
	.4byte	0x109e
	.4byte	0xeab
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL97
	.4byte	0x1102
	.4byte	0xed2
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL98
	.4byte	0x1102
	.4byte	0xef9
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL99
	.4byte	0x1102
	.4byte	0xf20
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL131
	.4byte	0x10da
	.4byte	0xf3b
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1840
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL134
	.4byte	0x1102
	.4byte	0xf62
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xe8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL135
	.4byte	0x1125
	.4byte	0xfa9
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 -1840
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1840
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL136
	.4byte	0x10da
	.4byte	0xfc4
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 -1840
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL137
	.4byte	0x115c
	.4byte	0xfe4
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1856
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL139
	.4byte	0x1102
	.4byte	0xff8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x9
	.byte	0xe0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL166
	.4byte	0x10b7
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	0x177
	.4byte	.LFB1884
	.4byte	.LFE1884
	.4byte	.LLST36
	.byte	0x1
	.4byte	0x1044
	.uleb128 0x29
	.4byte	0x185
	.byte	0x1
	.byte	0x50
	.uleb128 0x29
	.4byte	0x190
	.byte	0x1
	.byte	0x51
	.uleb128 0x29
	.4byte	0x19b
	.byte	0x1
	.byte	0x52
	.uleb128 0x23
	.4byte	0x1a6
	.4byte	.LLST37
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF49
	.byte	0x5
	.byte	0x1d
	.byte	0x1
	.byte	0x1
	.4byte	0x1067
	.uleb128 0x2b
	.4byte	0x16c
	.uleb128 0x2b
	.4byte	0x16c
	.uleb128 0x2b
	.4byte	0x61
	.uleb128 0x2b
	.4byte	0x1b0
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF50
	.byte	0x5
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.4byte	0x109e
	.uleb128 0x2b
	.4byte	0x991
	.uleb128 0x2b
	.4byte	0x985
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x53
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF51
	.byte	0x5
	.byte	0x1e
	.byte	0x1
	.byte	0x1
	.4byte	0x10b7
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x25
	.byte	0
	.uleb128 0x2c
	.byte	0x1
	.4byte	.LASF52
	.byte	0x1
	.4byte	0x10d8
	.byte	0x1
	.byte	0x1
	.4byte	0x10d8
	.uleb128 0x2b
	.4byte	0x10d8
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x37
	.byte	0
	.uleb128 0x2d
	.byte	0x4
	.uleb128 0x2c
	.byte	0x1
	.4byte	.LASF53
	.byte	0x1
	.4byte	0x10d8
	.byte	0x1
	.byte	0x1
	.4byte	0x10fb
	.uleb128 0x2b
	.4byte	0x10d8
	.uleb128 0x2b
	.4byte	0x10fb
	.uleb128 0x2b
	.4byte	0x37
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1101
	.uleb128 0x2e
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF54
	.byte	0x5
	.byte	0x22
	.byte	0x1
	.byte	0x1
	.4byte	0x1125
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x61
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF55
	.byte	0x5
	.byte	0x17
	.byte	0x1
	.byte	0x1
	.4byte	0x115c
	.uleb128 0x2b
	.4byte	0x991
	.uleb128 0x2b
	.4byte	0x985
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x1b0
	.uleb128 0x2b
	.4byte	0x53
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF56
	.byte	0x6
	.byte	0x44
	.byte	0x1
	.4byte	0x53
	.byte	0x1
	.uleb128 0x2b
	.4byte	0x10fb
	.uleb128 0x2b
	.4byte	0x10fb
	.uleb128 0x2b
	.4byte	0x25
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x2107
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB1882-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI1-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 44
	.4byte	.LCFI2-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 1936
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1920
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL77-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1884
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.sleb128 -1884
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x3
	.byte	0x7e
	.sleb128 -1884
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1884
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL67-1-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.sleb128 -1884
	.4byte	.LVL67-1-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1884
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-1-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.sleb128 -1884
	.4byte	.LVL69-1-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1884
	.4byte	.LVL75-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.sleb128 -1884
	.4byte	.LVL76-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1884
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1888
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.sleb128 -1888
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x3
	.byte	0x7e
	.sleb128 -1888
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1888
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL67-1-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.sleb128 -1888
	.4byte	.LVL67-1-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1888
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-1-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.sleb128 -1888
	.4byte	.LVL69-1-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1888
	.4byte	.LVL75-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x3
	.byte	0x7c
	.sleb128 -1888
	.4byte	.LVL76-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1888
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1880
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL75-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL78-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1896
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL78-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x6
	.byte	0x77
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL24-1-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x9
	.byte	0x7a
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0xf0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL72-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x7
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x7b
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LFB1883-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI3-.Ltext0
	.4byte	.LCFI4-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI4-.Ltext0
	.4byte	.LCFI5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 44
	.4byte	.LCFI5-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 1912
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL143-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL143-.Ltext0
	.4byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL146-.Ltext0
	.4byte	.LVL148-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -1884
	.4byte	.LVL148-.Ltext0
	.4byte	.LVL154-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1884
	.4byte	.LVL154-.Ltext0
	.4byte	.LVL164-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL164-.Ltext0
	.4byte	.LVL165-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL81-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL143-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL143-.Ltext0
	.4byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL145-.Ltext0
	.4byte	.LVL148-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -1880
	.4byte	.LVL148-.Ltext0
	.4byte	.LVL154-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1880
	.4byte	.LVL154-.Ltext0
	.4byte	.LVL164-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL164-.Ltext0
	.4byte	.LVL165-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL80-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL83-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL83-1-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL143-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	.LVL143-.Ltext0
	.4byte	.LVL147-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL147-.Ltext0
	.4byte	.LVL148-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -1876
	.4byte	.LVL148-.Ltext0
	.4byte	.LVL154-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1876
	.4byte	.LVL154-.Ltext0
	.4byte	.LVL164-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	.LVL164-.Ltext0
	.4byte	.LVL165-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL138-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1872
	.4byte	.LVL138-.Ltext0
	.4byte	.LVL139-1-.Ltext0
	.2byte	0xa
	.byte	0x90
	.uleb128 0x11a
	.byte	0x93
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x11b
	.byte	0x93
	.uleb128 0x8
	.4byte	.LVL139-1-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1872
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL88-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL90-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL93-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL163-.Ltext0
	.4byte	.LVL164-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL95-.Ltext0
	.4byte	.LVL142-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL133-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL133-.Ltext0
	.4byte	.LVL134-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL134-1-.Ltext0
	.4byte	.LVL138-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL138-.Ltext0
	.4byte	.LVL139-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL139-1-.Ltext0
	.4byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL140-.Ltext0
	.4byte	.LVL141-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL141-1-.Ltext0
	.4byte	.LVL142-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x6
	.byte	0x7b
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL102-.Ltext0
	.4byte	.LVL103-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL104-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL104-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL108-.Ltext0
	.4byte	.LVL109-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL111-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL111-.Ltext0
	.4byte	.LVL112-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL112-.Ltext0
	.4byte	.LVL114-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL114-.Ltext0
	.4byte	.LVL115-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL115-.Ltext0
	.4byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL117-.Ltext0
	.4byte	.LVL118-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL118-.Ltext0
	.4byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL120-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL123-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL123-.Ltext0
	.4byte	.LVL124-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL124-.Ltext0
	.4byte	.LVL126-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL126-.Ltext0
	.4byte	.LVL127-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1856
	.byte	0x9f
	.4byte	.LVL127-.Ltext0
	.4byte	.LVL128-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL128-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL104-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL104-.Ltext0
	.4byte	.LVL105-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL107-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL107-.Ltext0
	.4byte	.LVL108-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL108-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL132-.Ltext0
	.4byte	.LVL134-1-.Ltext0
	.2byte	0xa
	.byte	0x90
	.uleb128 0x11a
	.byte	0x93
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x11b
	.byte	0x93
	.uleb128 0x8
	.4byte	.LVL138-.Ltext0
	.4byte	.LVL139-1-.Ltext0
	.2byte	0xa
	.byte	0x90
	.uleb128 0x11a
	.byte	0x93
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x11b
	.byte	0x93
	.uleb128 0x8
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL132-.Ltext0
	.4byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL143-.Ltext0
	.4byte	.LVL149-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL149-.Ltext0
	.4byte	.LVL150-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL152-.Ltext0
	.4byte	.LVL153-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL153-.Ltext0
	.4byte	.LVL154-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL164-.Ltext0
	.4byte	.LVL165-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LFB1884-.Ltext0
	.4byte	.LCFI6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI6-.Ltext0
	.4byte	.LFE1884-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL167-.Ltext0
	.4byte	.LVL168-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB16-.Ltext0
	.4byte	.LBE16-.Ltext0
	.4byte	.LBB24-.Ltext0
	.4byte	.LBE24-.Ltext0
	.4byte	.LBB26-.Ltext0
	.4byte	.LBE26-.Ltext0
	.4byte	.LBB27-.Ltext0
	.4byte	.LBE27-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB20-.Ltext0
	.4byte	.LBE20-.Ltext0
	.4byte	.LBB25-.Ltext0
	.4byte	.LBE25-.Ltext0
	.4byte	.LBB28-.Ltext0
	.4byte	.LBE28-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB21-.Ltext0
	.4byte	.LBE21-.Ltext0
	.4byte	.LBB22-.Ltext0
	.4byte	.LBE22-.Ltext0
	.4byte	.LBB23-.Ltext0
	.4byte	.LBE23-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB29-.Ltext0
	.4byte	.LBE29-.Ltext0
	.4byte	.LBB32-.Ltext0
	.4byte	.LBE32-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB33-.Ltext0
	.4byte	.LBE33-.Ltext0
	.4byte	.LBB42-.Ltext0
	.4byte	.LBE42-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB34-.Ltext0
	.4byte	.LBE34-.Ltext0
	.4byte	.LBB37-.Ltext0
	.4byte	.LBE37-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB35-.Ltext0
	.4byte	.LBE35-.Ltext0
	.4byte	.LBB36-.Ltext0
	.4byte	.LBE36-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB38-.Ltext0
	.4byte	.LBE38-.Ltext0
	.4byte	.LBB41-.Ltext0
	.4byte	.LBE41-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB43-.Ltext0
	.4byte	.LBE43-.Ltext0
	.4byte	.LBB44-.Ltext0
	.4byte	.LBE44-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF60:
	.ascii	"tweak_count\000"
.LASF6:
	.ascii	"size_t\000"
.LASF41:
	.ascii	"checksum\000"
.LASF30:
	.ascii	"TWEAK_AD_LAST_PARTIAL\000"
.LASF11:
	.ascii	"__builtin_neon_hi\000"
.LASF51:
	.ascii	"tweakey_increment\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF40:
	.ascii	"tweakey\000"
.LASF18:
	.ascii	"__builtin_neon_uhi\000"
.LASF42:
	.ascii	"auth\000"
.LASF54:
	.ascii	"tweakey_set\000"
.LASF59:
	.ascii	"/home/gaetan/implem/CAESAR\000"
.LASF26:
	.ascii	"TWEAK_MESSAGE_LAST_FULL\000"
.LASF5:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF27:
	.ascii	"TWEAK_MESSAGE_LAST_PARTIAL\000"
.LASF53:
	.ascii	"memcpy\000"
.LASF58:
	.ascii	"crypto_aead/scream12v1/neon/tae.c\000"
.LASF44:
	.ascii	"buffer2\000"
.LASF10:
	.ascii	"__builtin_neon_qi\000"
.LASF61:
	.ascii	"vld1q_u8\000"
.LASF17:
	.ascii	"__builtin_neon_uqi\000"
.LASF21:
	.ascii	"int8x16_t\000"
.LASF22:
	.ascii	"uint8x16_t\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF29:
	.ascii	"TWEAK_AD_LAST_FULL\000"
.LASF50:
	.ascii	"encrypt_bloc128\000"
.LASF49:
	.ascii	"tweakey_schedule\000"
.LASF37:
	.ascii	"nsec\000"
.LASF36:
	.ascii	"adlen\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF45:
	.ascii	"crypto_aead_encrypt\000"
.LASF16:
	.ascii	"__builtin_neon_poly16\000"
.LASF34:
	.ascii	"clen\000"
.LASF14:
	.ascii	"__builtin_neon_sf\000"
.LASF1:
	.ascii	"sizetype\000"
.LASF12:
	.ascii	"__builtin_neon_si\000"
.LASF31:
	.ascii	"TWEAK_TAG_LAST_FULL\000"
.LASF13:
	.ascii	"__builtin_neon_di\000"
.LASF55:
	.ascii	"decrypt_bloc128\000"
.LASF19:
	.ascii	"__builtin_neon_usi\000"
.LASF57:
	.ascii	"GNU C 4.7.2\000"
.LASF20:
	.ascii	"__builtin_neon_udi\000"
.LASF23:
	.ascii	"float\000"
.LASF35:
	.ascii	"mlen\000"
.LASF62:
	.ascii	"vst1q_u8\000"
.LASF48:
	.ascii	"update_checksum\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF47:
	.ascii	"outputmlen\000"
.LASF4:
	.ascii	"short int\000"
.LASF38:
	.ascii	"npub\000"
.LASF33:
	.ascii	"cksum\000"
.LASF32:
	.ascii	"TWEAK_TAG_LAST_PARTIAL\000"
.LASF15:
	.ascii	"__builtin_neon_poly8\000"
.LASF39:
	.ascii	"buffer\000"
.LASF56:
	.ascii	"memcmp\000"
.LASF25:
	.ascii	"TWEAK_MESSAGE\000"
.LASF28:
	.ascii	"TWEAK_AD\000"
.LASF24:
	.ascii	"v16qu\000"
.LASF52:
	.ascii	"memset\000"
.LASF7:
	.ascii	"uint8_t\000"
.LASF46:
	.ascii	"crypto_aead_decrypt\000"
.LASF43:
	.ascii	"fullblocks\000"
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
