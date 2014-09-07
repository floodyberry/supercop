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
@ crypto_aead/iscream14v2/neon/tae.c -mcpu=cortex-a15 -mtune=cortex-a15
@ -mfpu=neon -mfloat-abi=hard -mthumb -mtls-dialect=gnu
@ -auxbase-strip crypto_aead/iscream14v2/neon/tae.s -g -O3 -Wall -Wextra
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
	.file 1 "crypto_aead/iscream14v2/neon/tae.c"
	.loc 1 14 0
	.cfi_startproc
	@ args = 36, pretend = 0, frame = 1616
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
	subw	sp, sp, #1636	@,,
.LCFI1:
	.cfi_def_cfa_offset 1672
	.loc 1 16 0
	add	r7, sp, #96	@ tmp655,,
	.loc 1 20 0
	add	r6, sp, #1672	@,,
	.loc 1 14 0
	ldr	r9, [sp, #1680]	@ ad, ad
	str	r0, [sp, #52]	@ c, %sfp
	.loc 1 16 0
	mov	r0, r7	@, tmp655
.LVL1:
	.loc 1 24 0
	add	r8, sp, #1688	@,,
	.loc 1 14 0
	str	r1, [sp, #60]	@ clen, %sfp
	.loc 1 16 0
	movs	r1, #0	@,
.LVL2:
	.loc 1 14 0
	str	r2, [sp, #48]	@ m, %sfp
	.loc 1 16 0
	mov	r2, #256	@,
.LVL3:
	bl	memset	@
.LVL4:
	.loc 1 21 0
	vmov.i32	q8, #0  @ v16qi	@ tmp412,
	vstr	d16, [sp, #80]	@, auth
	vstr	d17, [sp, #88]	@, auth
.LVL5:
	.loc 1 20 0
	ldrd	r4, [r6]	@, mlen
	movs	r0, #15	@ tmp400,
	movs	r1, #0	@,
	adds	r4, r4, r0	@,, tmp400
	adc	r5, r5, r1	@,,
	lsrs	r2, r4, #4	@ tmp403,,
	orr	r3, r2, r5, lsl #28	@, tmp403, tmp403,,
	strd	r4, [sp, #32]	@,,
	and	r4, r3, r0	@ tmp405, tmp403, tmp400
	.loc 1 24 0
	ldrd	r0, [r8]	@, adlen
	.loc 1 20 0
	add	r5, r7, r4, lsl #4	@, checksum, tmp655, tmp405,
.LVL6:
.LBB16:
	.loc 1 26 0
	add	r4, sp, #608	@ tmp652,,
.LBE16:
	.loc 1 24 0
	orrs	r1, r0, r1	@,
	bne	.L104	@,
.LVL7:
.L2:
	.loc 1 46 0
	ldr	r0, [sp, #1704]	@, k
	movs	r2, #0	@,
	mov	r3, r4	@, tmp652
	ldr	r1, [sp, #1700]	@, npub
	.loc 1 47 0
	add	r9, sp, #1672	@,,
	.loc 1 46 0
	bl	tweakey_schedule	@
.LVL8:
	.loc 1 47 0
	ldrd	r0, [r9]	@, mlen
	orrs	r1, r0, r1	@,
	beq	.L22	@,
	.loc 1 49 0 discriminator 1
	add	r1, sp, #1672	@,,
	ldrd	r8, [r1]	@, mlen
	cmp	r9, #0	@,
	it eq
	cmpeq	r8, #256	@,
	bcc	.L23	@,
	.loc 1 49 0 is_stmt 0
	mov	sl, #0	@ idx,
	mov	r6, #256	@ idx,
	ldr	fp, [sp, #52]	@ c, %sfp
	.loc 1 50 0 is_stmt 1
	mov	r9, #16	@ tmp657,
	mov	r8, sl	@ tmp658, idx
	b	.L9	@
.LVL9:
.L24:
	.loc 1 49 0
	mov	r6, lr	@ idx, idx
.LVL10:
.L9:
	.loc 1 50 0 discriminator 2
	ldr	ip, [sp, #48]	@, %sfp
	movs	r2, #16	@,
	add	r1, fp, sl	@, c, idx
	mov	r3, r4	@, tmp652
	stmia	sp, {r5, r9}	@,,
	str	r8, [sp, #8]	@ tmp658,
	str	r8, [sp, #12]	@ tmp658,
	add	r0, ip, sl	@,, idx
	bl	encrypt_bloc128	@
.LVL11:
	.loc 1 51 0 discriminator 2
	mov	r1, sl	@, idx
	mov	r0, r4	@, tmp652
	bl	tweakey_increment	@
.LVL12:
	.loc 1 49 0 discriminator 2
	add	r0, sp, #1672	@,,
	add	lr, r6, #256	@ idx, idx,
	ldrd	r0, [r0]	@, mlen
	mov	r2, lr	@ D.14204, idx
	movs	r3, #0	@ D.14204,
	mov	sl, r6	@ idx, idx
	cmp	r1, r3	@, D.14204
	it eq
	cmpeq	r0, r2	@, D.14204
	bcs	.L24	@,
	add	r9, r6, #240	@ prephitmp.63, idx,
	mov	r2, r9	@ prephitmp.65, prephitmp.63
.LVL13:
.L8:
	.loc 1 55 0
	add	r1, sp, #1672	@,,
	ldrd	r0, [r1]	@, mlen
	cmp	r3, r1	@ prephitmp.65,
	it eq
	cmpeq	r2, r0	@ prephitmp.65,
	bcs	.L10	@,
.LBB17:
	.loc 1 58 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #352	@,,
	.loc 1 62 0
	add	fp, sp, #1672	@,,
	.loc 1 58 0
	bl	memset	@
.LVL14:
	.loc 1 59 0
	ldr	r1, [sp, #48]	@, %sfp
	movs	r2, #240	@,
	add	r0, sp, #352	@,,
	adds	r1, r1, r6	@,, idx
	bl	memcpy	@
.LVL15:
	.loc 1 62 0
	fldd	d24, .L115+16	@ int	@ tmp494,
	ldrd	sl, [fp]	@, mlen
	.loc 1 61 0
	movs	r3, #0	@ tmp490,
	.loc 1 63 0
	movs	r2, #15	@ tmp503,
	add	r0, sp, #352	@,,
	str	r5, [sp, #0]	@ checksum,
	.loc 1 61 0
	str	r3, [sp, #604]	@ tmp490, MEM[(void *)&buffer2 + 240B]
	.loc 1 63 0
	mov	r1, r0	@,
	.loc 1 61 0
	str	r3, [sp, #592]	@ tmp490, MEM[(void *)&buffer2 + 240B]
	.loc 1 62 0
	fmdrr	d25, sl, fp	@ int	@,
	.loc 1 61 0
	str	r3, [sp, #596]	@ tmp490, MEM[(void *)&buffer2 + 240B]
	str	r3, [sp, #600]	@ tmp490, MEM[(void *)&buffer2 + 240B]
	.loc 1 63 0
	str	r2, [sp, #4]	@ tmp503,
	movs	r2, #16	@,
	str	r3, [sp, #8]	@ tmp490,
	.loc 1 62 0
	vand	d26, d25, d24	@,, tmp494
	fstd	d26, [sp, #24]	@ int	@, %sfp
	.loc 1 63 0
	str	r3, [sp, #12]	@ tmp490,
	.loc 1 62 0
	ldr	lr, [sp, #24]	@, %sfp
	.loc 1 63 0
	mov	r3, r4	@, tmp652
	.loc 1 62 0
	lsl	r8, lr, #3	@ tmp498,,
	strb	r8, [sp, #607]	@ tmp498, buffer2
	.loc 1 63 0
	bl	encrypt_bloc128	@
.LVL16:
	.loc 1 64 0
	ldr	r1, [sp, #1672]	@, mlen
	ldr	r0, [sp, #48]	@, %sfp
	sub	r3, r1, #240	@ tmp506,,
	str	r1, [sp, #40]	@, %sfp
.LBB18:
.LBB19:
	.loc 1 183 0
	subs	fp, r3, r6	@ D.14216, tmp506, idx
.LBE19:
.LBE18:
	.loc 1 64 0
	add	r9, r0, r9	@ D.14213,, prephitmp.63
.LVL17:
.LBB21:
.LBB20:
	.loc 1 183 0
	beq	.L12	@,
	.loc 1 184 0
	ldrb	ip, [r5, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	add	r2, fp, #-1	@ tmp661, D.14216,
	ldrb	r0, [r9, #0]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	and	r1, r2, #7	@ tmp663, tmp661,
	eor	r3, ip, r0	@ tmp527, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r3, [r5, #0]	@ tmp527, *D.14301_209
	.loc 1 183 0
	movs	r3, #1	@ i,
.LVL18:
	cmp	r3, fp	@ i, D.14216
	beq	.L12	@,
	cmp	r1, #0	@ tmp663
	beq	.L11	@
	cmp	r1, #1	@ tmp663,
	beq	.L78	@,
	cmp	r1, #2	@ tmp663,
	beq	.L79	@,
	cmp	r1, #3	@ tmp663,
	beq	.L80	@,
	cmp	r1, #4	@ tmp663,
	beq	.L81	@,
	cmp	r1, #5	@ tmp663,
	beq	.L82	@,
	cmp	r1, #6	@ tmp663,
	.loc 1 184 0
	itttt	ne
	ldrbne	ip, [r5, #1]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	ldrbne	r1, [r9, #1]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	eorne	r1, ip, r1	@ tmp782, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strbne	r1, [r5, #1]	@ tmp782, *D.14301_209
	.loc 1 183 0
	it	ne
	movne	r3, #2	@ i,
	.loc 1 184 0
	and	r2, r3, #15	@ tmp783, i,
	ldrb	lr, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	sl, r5, r2	@ D.14301, checksum, tmp783
	ldrb	r1, [sl, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, lr	@ tmp787, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [sl, #0]	@ tmp787, *D.14301_209
.L82:
	and	r2, r3, #15	@ tmp788, i,
	ldrb	ip, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r8, r5, r2	@ D.14301, checksum, tmp788
	ldrb	r1, [r8, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, ip	@ tmp792, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r8, #0]	@ tmp792, *D.14301_209
.L81:
	and	r2, r3, #15	@ tmp793, i,
	ldrb	lr, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	sl, r5, r2	@ D.14301, checksum, tmp793
	ldrb	r1, [sl, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, lr	@ tmp797, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [sl, #0]	@ tmp797, *D.14301_209
.L80:
	and	r2, r3, #15	@ tmp798, i,
	ldrb	ip, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r8, r5, r2	@ D.14301, checksum, tmp798
	ldrb	r1, [r8, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, ip	@ tmp802, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r8, #0]	@ tmp802, *D.14301_209
.L79:
	and	r2, r3, #15	@ tmp803, i,
	ldrb	lr, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	sl, r5, r2	@ D.14301, checksum, tmp803
	ldrb	r1, [sl, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, lr	@ tmp807, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [sl, #0]	@ tmp807, *D.14301_209
.L78:
	and	r2, r3, #15	@ tmp808, i,
	ldrb	ip, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r8, r5, r2	@ D.14301, checksum, tmp808
	.loc 1 183 0
	cmp	r3, fp	@ i, D.14216
	.loc 1 184 0
	ldrb	r1, [r8, #0]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, ip	@ tmp812, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r8, #0]	@ tmp812, *D.14301_209
	.loc 1 183 0
	beq	.L12	@,
.L11:
	.loc 1 184 0
	and	r2, r3, #15	@ tmp678, i,
	ldrb	sl, [r9, r3]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	ldrb	r1, [r5, r2]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, sl	@ tmp682, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, r2]	@ tmp682, *D.14301_209
	.loc 1 183 0
	adds	r2, r3, #1	@ tmp664, i,
	.loc 1 184 0
	and	r1, r2, #15	@ tmp684, tmp664,
	ldrb	r2, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	ldrb	r0, [r5, r1]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eors	r0, r0, r2	@, tmp688, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, r1]	@ tmp688, *D.14301_209
	.loc 1 183 0
	adds	r1, r3, #2	@ i, i,
	.loc 1 184 0
	and	r2, r1, #15	@ tmp690, i,
	ldrb	lr, [r9, r1]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	ldrb	r0, [r5, r2]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r1, r0, lr	@ tmp694, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r1, [r5, r2]	@ tmp694, *D.14301_209
	.loc 1 183 0
	adds	r2, r3, #3	@ i, i,
	.loc 1 184 0
	and	r8, r2, #15	@ tmp696, i,
	ldrb	ip, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r2, r3, #4	@ i, i,
	.loc 1 184 0
	ldrb	r1, [r5, r8]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	and	sl, r2, #15	@ tmp702, i,
	ldrb	lr, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	.loc 1 183 0
	adds	r2, r3, #5	@ i, i,
	.loc 1 184 0
	eor	r0, r1, ip	@ tmp700, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	ldrb	ip, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, r8]	@ tmp700, *D.14301_209
	ldrb	r1, [r5, sl]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	and	r8, r2, #15	@ tmp708, i,
	.loc 1 183 0
	adds	r2, r3, #6	@ i, i,
	.loc 1 184 0
	eor	r0, r1, lr	@ tmp706, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	ldrb	lr, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, sl]	@ tmp706, *D.14301_209
	ldrb	r1, [r5, r8]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	and	sl, r2, #15	@ tmp714, i,
	.loc 1 183 0
	adds	r2, r3, #7	@ i, i,
	adds	r3, r3, #8	@ i, i,
	cmp	r3, fp	@ i, D.14216
	.loc 1 184 0
	eor	r0, r1, ip	@ tmp712, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	ldrb	ip, [r9, r2]	@ zero_extendqisi2	@ MEM[base: D.14213_58, index: i_231, offset: 0B], MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, r8]	@ tmp712, *D.14301_209
	ldrb	r1, [r5, sl]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	and	r8, r2, #15	@ tmp720, i,
	eor	r0, r1, lr	@ tmp718, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, sl]	@ tmp718, *D.14301_209
	ldrb	r1, [r5, r8]	@ zero_extendqisi2	@ *D.14301_209, *D.14301_209
	eor	r0, r1, ip	@ tmp724, *D.14301_209, MEM[base: D.14213_58, index: i_231, offset: 0B]
	strb	r0, [r5, r8]	@ tmp724, *D.14301_209
	.loc 1 183 0
	bne	.L11	@,
.L12:
.LBE20:
.LBE21:
	.loc 1 65 0
	mov	r1, r6	@, idx
	mov	r0, r4	@, tmp652
	bl	tweakey_increment	@
.LVL19:
	.loc 1 66 0
	ldr	r3, [sp, #52]	@, %sfp
	add	r1, sp, #352	@,,
	movs	r2, #240	@,
	mov	fp, #0	@ prephitmp.49,
.LVL20:
	mov	r9, fp	@ prephitmp.57, prephitmp.49
.LVL21:
	adds	r0, r3, r6	@,, idx
	.loc 1 67 0
	add	r6, sp, #64	@ tmp653,,
.LVL22:
	.loc 1 66 0
	bl	memcpy	@
.LVL23:
	.loc 1 67 0
	mov	r0, r6	@, tmp653
	add	r1, sp, #592	@,,
	ldr	r2, [sp, #24]	@, %sfp
	bl	memcpy	@
.LVL24:
	ldr	sl, [sp, #1672]	@ prephitmp.49, mlen
	.loc 1 72 0
	str	r7, [sp, #56]	@ tmp655, %sfp
	mov	ip, fp	@ prephitmp.51, prephitmp.57
	mov	lr, sl	@, prephitmp.49
	b	.L7	@
.L116:
	.align	3
.L115:
	.word	16
	.word	0
	.word	-1
	.word	-1
	.word	15
	.word	0
.LVL25:
.L22:
.LBE17:
	.loc 1 47 0
	add	sl, sp, #1672	@,,
	ldr	lr, [sp, #1672]	@, mlen
	mov	r9, #0	@ prephitmp.57,
.LVL26:
	ldrd	r0, [sl]	@, mlen
	mov	ip, r9	@ prephitmp.51, prephitmp.57
	add	r6, sp, #64	@ tmp653,,
	.loc 1 72 0
	str	r7, [sp, #56]	@ tmp655, %sfp
	.loc 1 45 0
	str	r9, [sp, #40]	@ prephitmp.57, %sfp
	.loc 1 47 0
	mov	sl, r0	@ prephitmp.49,
.LVL27:
	mov	fp, r1	@ prephitmp.49,
	strd	r0, [sp, #24]	@,,
.LVL28:
.L7:
	.loc 1 83 0
	ldrd	r2, [sp, #32]	@ tmp564,,
	lsl	r1, lr, #4	@ tmp570,,
	mov	r0, r4	@, tmp652
	str	ip, [sp, #20]	@,
	subs	r2, r2, sl	@ tmp564, tmp564, prephitmp.49
	sbc	r3, r3, fp	@ tmp564, tmp564, prephitmp.49
	lsr	r2, r2, #4	@ tmp643, tmp564,
	orr	r8, r2, r3, lsl #28	@, tmp773, tmp643,,
	adds	r3, r1, #1	@ tmp572, tmp570,
	movs	r2, #15	@,
	mov	r1, r8	@, tmp773
	uxtb	r3, r3	@, tmp572
	bl	tweakey_set	@
.LVL29:
	.loc 1 84 0
	ldr	r0, [sp, #1672]	@, mlen
	ldr	r1, [sp, #1676]	@, mlen
	lsr	r2, r0, #4	@ D.14232,,
	mov	r0, r4	@, tmp652
	orr	sl, r2, r1, lsl #28	@, D.14232, D.14232,,
	mov	r1, r8	@, tmp773
	movs	r2, #14	@,
	uxtb	r3, sl	@, D.14232
	bl	tweakey_set	@
.LVL30:
	.loc 1 85 0
	ldr	lr, [sp, #1672]	@, mlen
	mov	r0, r4	@, tmp652
	mov	r1, r8	@, tmp773
	movs	r2, #13	@,
	ubfx	r3, lr, #12, #8	@,,,
	bl	tweakey_set	@
.LVL31:
	.loc 1 86 0
	ldr	ip, [sp, #1672]	@, mlen
	mov	r0, r4	@, tmp652
	mov	r1, r8	@, tmp773
	movs	r2, #12	@,
	ubfx	r3, ip, #20, #8	@,,,
	bl	tweakey_set	@
.LVL32:
	.loc 1 87 0
	ldr	r3, [sp, #1672]	@, mlen
	mov	r1, r8	@, tmp773
	.loc 1 88 0
	mov	r8, #0	@ tmp595,
	.loc 1 87 0
	ldr	r2, [sp, #1676]	@, mlen
	lsrs	r0, r3, #28	@ tmp649,,
	orr	ip, r0, r2, lsl #4	@, tmp777, tmp649,,
	mov	r0, r4	@, tmp652
	movs	r2, #11	@,
	uxtb	r3, ip	@, tmp777
	bl	tweakey_set	@
.LVL33:
	.loc 1 88 0
	mov	r3, r4	@, tmp652
	movs	r2, #16	@,
	str	r8, [sp, #0]	@ tmp595,
	mov	r0, r7	@, tmp655
	mov	r1, r7	@, tmp655
	str	r8, [sp, #4]	@ tmp595,
	str	r8, [sp, #8]	@ tmp595,
	str	r8, [sp, #12]	@ tmp595,
	bl	encrypt_bloc128	@
.LVL34:
	.loc 1 90 0
	ldr	r4, [sp, #52]	@, %sfp
	mov	r1, r7	@, tmp655
	ldr	lr, [sp, #40]	@, %sfp
	ldr	ip, [sp, #20]	@,
	add	r0, r4, lr	@,,
	mov	r2, ip	@, prephitmp.51
	bl	memcpy	@
.LVL35:
	.loc 1 91 0
	ldr	r1, [sp, #56]	@, %sfp
	mov	r2, r9	@, prephitmp.57
	mov	r0, r6	@, tmp653
	bl	memcpy	@
.LVL36:
	.loc 1 93 0
	vldmia	r5, {d30-d31}	@ *checksum_10,
	vldr	d28, [sp, #80]	@, auth
	vldr	d29, [sp, #88]	@, auth
	.loc 1 95 0
	ldr	r1, [sp, #1672]	@, mlen
	.loc 1 93 0
	veor	q8, q15, q14	@ tmp612,, auth
	vstmia	r5, {d16-d17}	@ *checksum_10, tmp612
	.loc 1 95 0
	ldr	r0, [r5, #4]	@ unaligned	@ tmp617,
	adds	r3, r4, r1	@ tmp615,,
	ldr	r4, [r5, #0]	@ unaligned	@ tmp616,* checksum
	ldr	r1, [r5, #8]	@ unaligned	@ tmp618,
	ldr	r5, [r5, #12]	@ unaligned	@ tmp619,
	str	r0, [r3, #4]	@ unaligned	@ tmp617,
	str	r4, [r3, #0]	@ unaligned	@ tmp616,
	str	r1, [r3, #8]	@ unaligned	@ tmp618,
	str	r5, [r3, #12]	@ unaligned	@ tmp619,
.LVL37:
	.loc 1 98 0
	ldrd	r2, [sp, #24]	@,,
	orrs	r5, r2, r3	@,
	beq	.L19	@,
	ldr	r5, [sp, #48]	@, %sfp
	lsl	r3, sl, #4	@ pretmp.62, D.14232,
	ldr	r4, [sp, #52]	@, %sfp
	ldrd	r0, [sp, #24]	@ prephitmp.59,,
	add	ip, r5, r3	@ batmp.82,, pretmp.62
	add	sl, r4, r3	@ batmp.85,, pretmp.62
.LVL38:
.L18:
	.loc 1 99 0
	ldrb	r2, [ip, r8]	@ zero_extendqisi2	@ MEM[base: batmp.82_84, index: i_140, offset: 0B], MEM[base: batmp.82_84, index: i_140, offset: 0B]
	ldrb	r3, [r6, r8]	@ zero_extendqisi2	@ MEM[symbol: pad, index: i_140, offset: 0B], MEM[symbol: pad, index: i_140, offset: 0B]
	eor	r4, r2, r3	@ tmp630, MEM[base: batmp.82_84, index: i_140, offset: 0B], MEM[symbol: pad, index: i_140, offset: 0B]
	.loc 1 98 0
	movs	r3, #0	@ i,
	.loc 1 99 0
	strb	r4, [sl, r8]	@ tmp630, MEM[base: batmp.85_122, index: i_140, offset: 0B]
	.loc 1 98 0
	add	r8, r8, #1	@ i, i,
.LVL39:
	mov	r2, r8	@ i, i
	cmp	r3, r1	@ i, prephitmp.59
	it eq
	cmpeq	r2, r0	@ i, prephitmp.59
	bcc	.L18	@,
.LVL40:
.L19:
	.loc 1 101 0
	add	r1, sp, #1672	@,,
	fldd	d27, .L115	@ int	@ tmp623,
	ldr	r4, [sp, #60]	@, %sfp
	ldrd	r0, [r1]	@, mlen
	fmdrr	d29, r0, r1	@ int	@,
	.loc 1 104 0
	movs	r0, #0	@,
	.loc 1 101 0
	vadd.i64	d31, d29, d27	@ tmp622,, tmp623
	fstd	d31, [r4, #0]	@ int	@ tmp622, *clen_153(D)
	.loc 1 104 0
	add	sp, sp, #612	@,,
	add	sp, sp, #1024	@,
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL41:
.L104:
.LBB22:
	.loc 1 26 0
	movs	r2, #2	@,
	ldr	r0, [sp, #1704]	@, k
	mov	r3, r4	@, tmp652
	ldr	r1, [sp, #1700]	@, npub
	.loc 1 28 0
	add	sl, sp, #1688	@,,
	.loc 1 26 0
	bl	tweakey_schedule	@
.LVL42:
	.loc 1 28 0
	ldrd	r0, [sl]	@, adlen
	mov	r2, #256	@ tmp414,
	movs	r3, #0	@,
	cmp	r3, r1	@ tmp414,
	it eq
	cmpeq	r2, r0	@ tmp414,
	bcs	.L20	@,
	mov	fp, #0	@ idx,
	mov	r6, #256	@ idx,
.LVL43:
	str	r5, [sp, #24]	@ checksum, %sfp
	.loc 1 29 0
	mov	r8, fp	@ tmp659, idx
	mov	sl, #16	@ tmp660,
	str	r4, [sp, #40]	@ tmp652, %sfp
	mov	r3, r4	@, tmp652
	b	.L4	@
.LVL44:
.L21:
	ldr	r3, [sp, #40]	@, %sfp
	.loc 1 28 0
	mov	r6, ip	@ idx, idx
.LVL45:
.L4:
	.loc 1 29 0 discriminator 2
	add	r5, sp, #80	@,,
	movs	r1, #0	@,
	str	r8, [sp, #0]	@ tmp659,
	mov	r2, r1	@,
	add	r0, r9, fp	@, ad, idx
	str	r8, [sp, #4]	@ tmp659,
	str	r5, [sp, #8]	@,
	str	sl, [sp, #12]	@ tmp660,
	bl	encrypt_bloc128	@
.LVL46:
	.loc 1 30 0 discriminator 2
	mov	r1, fp	@, idx
	ldr	r0, [sp, #40]	@, %sfp
	mov	fp, r6	@ idx, idx
	bl	tweakey_increment	@
.LVL47:
	.loc 1 28 0 discriminator 2
	add	r1, sp, #1688	@,,
	add	ip, r6, #256	@ idx, idx,
	ldrd	r4, [r1]	@, adlen
	mov	r2, ip	@ D.14184, idx
	movs	r3, #0	@ D.14184,
	cmp	r3, r5	@ D.14184,
	it eq
	cmpeq	r2, r4	@ D.14184,
	bcc	.L21	@,
	ldr	r5, [sp, #24]	@ checksum, %sfp
	mov	sl, r6	@ prephitmp.65, idx
	mov	fp, r3	@ prephitmp.65, D.14184
	ldr	r4, [sp, #40]	@ tmp652, %sfp
.LVL48:
.L3:
	.loc 1 34 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #352	@,,
	bl	memset	@
.LVL49:
	.loc 1 35 0
	ldr	lr, [sp, #1688]	@, adlen
	add	r1, r9, r6	@, ad, idx
	add	r0, sp, #352	@,,
	.loc 1 36 0
	add	r9, sp, #1688	@,,
	.loc 1 35 0
	rsb	r2, r6, lr	@, idx,
	bl	memcpy	@
.LVL50:
	.loc 1 36 0
	fldd	d0, .L115+16	@ int	@ tmp435,
	ldrd	r2, [r9]	@, adlen
	fmdrr	d17, r2, r3	@ int	@,
	vand	d1, d17, d0	@,, tmp435
	fmrrd	r0, r1, d1	@ int	@ tmp434,
	orrs	lr, r0, r1	@, tmp434
	beq	.L113	@,
	.loc 1 39 0
	fldd	d2, .L115+8	@ int	@ tmp445,
	add	r3, sp, #1688	@,,
	mov	r0, r4	@, tmp652
	ldrd	r8, [r3]	@ D.14191, adlen
	fmrrd	r2, r3, d2	@ int	@ tmp444, tmp445
	subs	r8, r8, sl	@ D.14191, D.14191, prephitmp.65
	sbc	r9, r9, fp	@ D.14191, D.14191, prephitmp.65
	adds	r6, r2, r8	@ tmp444, tmp444, D.14191
	adc	r2, r3, r9	@,, D.14191
	lsrs	r1, r6, #4	@ tmp639, tmp444,
	movs	r3, #6	@,
	orr	r1, r1, r2, lsl #28	@,, tmp639,,
	movs	r2, #15	@,
	bl	tweakey_set	@
.LVL51:
	.loc 1 40 0
	add	ip, sp, #352	@,,
	movs	r0, #128	@ tmp452,
	add	r8, ip, r8	@ tmp451,, D.14191
	strb	r0, [r8, #0]	@ tmp452, buffer2
.L6:
	.loc 1 42 0
	movs	r1, #0	@ tmp456,
	add	r0, sp, #80	@,,
	fldd	d3, .L115+16	@ int	@ tmp460,
	add	ip, sp, #1688	@,,
	str	r0, [sp, #8]	@,
	add	r0, sp, #352	@,,
	str	r1, [sp, #0]	@ tmp456,
	str	r1, [sp, #4]	@ tmp456,
	ldrd	r8, [ip]	@, adlen
	fmdrr	d4, r8, r9	@ int	@,
	vadd.i64	d5, d4, d3	@ tmp459,, tmp460
	fmrrd	r2, r3, d5	@ int	@, tmp459
	subs	sl, r2, sl	@ tmp461,, prephitmp.65
	sbc	fp, r3, fp	@ tmp461,, prephitmp.65
	mov	r2, r1	@,
	lsr	r6, sl, #4	@ tmp641, tmp461,
	orr	r3, r6, fp, lsl #28	@, tmp673, tmp641,,
	str	r3, [sp, #12]	@ tmp673,
	mov	r3, r4	@, tmp652
	bl	encrypt_bloc128	@
.LVL52:
	b	.L2	@
.LVL53:
.L10:
.LBE22:
	.loc 1 71 0
	ldr	r2, [sp, #1672]	@, mlen
	mov	r0, r7	@, tmp655
	ldr	r8, [sp, #48]	@, %sfp
	rsb	r9, r6, r2	@ D.14215, idx,
	add	r1, r8, r6	@,, idx
.LVL54:
	mov	r2, r9	@, D.14215
	bl	memcpy	@
.LVL55:
.LBB23:
.LBB24:
	.loc 1 183 0
	cmp	r9, #0	@ D.14215
	beq	.L16	@
	.loc 1 184 0
	ldrb	ip, [r5, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	add	r3, r9, #-1	@ tmp665, D.14215,
	ldrb	r1, [r7, #0]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	and	r0, r3, #7	@ tmp667, tmp665,
	.loc 1 183 0
	movs	r3, #1	@ i,
.LVL56:
	cmp	r3, r9	@ i, D.14215
	.loc 1 184 0
	eor	r2, ip, r1	@ tmp542, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r2, [r5, #0]	@ tmp542, *D.14311_217
	.loc 1 183 0
	beq	.L16	@,
	cmp	r0, #0	@ tmp667
	beq	.L13	@
	cmp	r0, #1	@ tmp667,
	beq	.L84	@,
	cmp	r0, #2	@ tmp667,
	beq	.L85	@,
	cmp	r0, #3	@ tmp667,
	beq	.L86	@,
	cmp	r0, #4	@ tmp667,
	beq	.L87	@,
	cmp	r0, #5	@ tmp667,
	beq	.L88	@,
	cmp	r0, #6	@ tmp667,
	.loc 1 184 0
	itttt	ne
	ldrbne	r0, [r7, #1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	ldrbne	ip, [r5, #1]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eorne	r0, ip, r0	@ tmp817, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strbne	r0, [r5, #1]	@ tmp817, *D.14311_217
	.loc 1 183 0
	it	ne
	movne	r3, #2	@ i,
	.loc 1 184 0
	and	r0, r3, #15	@ tmp818, i,
	ldrb	r8, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	lr, r5, r0	@ D.14311, checksum, tmp818
	ldrb	r2, [lr, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r2, r8	@ tmp822, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r1, [lr, #0]	@ tmp822, *D.14311_217
.L88:
	and	r0, r3, #15	@ tmp823, i,
	ldrb	lr, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	ip, r5, r0	@ D.14311, checksum, tmp823
	ldrb	r2, [ip, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r2, lr	@ tmp827, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r1, [ip, #0]	@ tmp827, *D.14311_217
.L87:
	and	r0, r3, #15	@ tmp828, i,
	ldrb	ip, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r8, r5, r0	@ D.14311, checksum, tmp828
	ldrb	r2, [r8, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r2, ip	@ tmp832, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r1, [r8, #0]	@ tmp832, *D.14311_217
.L86:
	and	r0, r3, #15	@ tmp833, i,
	ldrb	r8, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	lr, r5, r0	@ D.14311, checksum, tmp833
	ldrb	r2, [lr, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r2, r8	@ tmp837, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r1, [lr, #0]	@ tmp837, *D.14311_217
.L85:
	and	r0, r3, #15	@ tmp838, i,
	ldrb	lr, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	ip, r5, r0	@ D.14311, checksum, tmp838
	ldrb	r2, [ip, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r2, lr	@ tmp842, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r1, [ip, #0]	@ tmp842, *D.14311_217
.L84:
	and	r0, r3, #15	@ tmp843, i,
	ldrb	ip, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r8, r5, r0	@ D.14311, checksum, tmp843
	.loc 1 183 0
	cmp	r3, r9	@ i, D.14215
	.loc 1 184 0
	ldrb	r2, [r8, #0]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r2, ip	@ tmp847, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r1, [r8, #0]	@ tmp847, *D.14311_217
	.loc 1 183 0
	beq	.L16	@,
.L13:
	.loc 1 184 0
	and	lr, r3, #15	@ tmp726, i,
	ldrb	r2, [r7, r3]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	ldrb	r0, [r5, lr]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r1, r0, r2	@ tmp730, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r0, r3, #1	@ tmp668, i,
	.loc 1 184 0
	and	r2, r0, #15	@ tmp732, tmp668,
	strb	r1, [r5, lr]	@ tmp730, *D.14311_217
	ldrb	r1, [r5, r2]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	ldrb	r8, [r7, r0]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	eor	r0, r1, r8	@ tmp736, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r0, [r5, r2]	@ tmp736, *D.14311_217
	.loc 1 183 0
	adds	r2, r3, #2	@ i, i,
	.loc 1 184 0
	and	ip, r2, #15	@ tmp738, i,
	ldrb	r0, [r7, r2]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	ldrb	r1, [r5, ip]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	eor	r2, r1, r0	@ tmp742, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r1, r3, #3	@ i, i,
	.loc 1 184 0
	and	lr, r1, #15	@ tmp744, i,
	strb	r2, [r5, ip]	@ tmp742, *D.14311_217
	ldrb	r8, [r5, lr]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	ldrb	r0, [r7, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r1, r3, #4	@ i, i,
	.loc 1 184 0
	and	ip, r1, #15	@ tmp750, i,
	eor	r2, r8, r0	@ tmp748, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r2, [r5, lr]	@ tmp748, *D.14311_217
	ldrb	lr, [r5, ip]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	ldrb	r0, [r7, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r1, r3, #5	@ i, i,
	.loc 1 184 0
	and	r8, r1, #15	@ tmp756, i,
	eor	r2, lr, r0	@ tmp754, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r2, [r5, ip]	@ tmp754, *D.14311_217
	ldrb	ip, [r5, r8]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	ldrb	r0, [r7, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r1, r3, #6	@ i, i,
	.loc 1 184 0
	and	lr, r1, #15	@ tmp762, i,
	eor	r2, ip, r0	@ tmp760, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r2, [r5, r8]	@ tmp760, *D.14311_217
	ldrb	r0, [r7, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	.loc 1 183 0
	adds	r1, r3, #7	@ i, i,
	.loc 1 184 0
	ldrb	r8, [r5, lr]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	and	ip, r1, #15	@ tmp768, i,
	.loc 1 183 0
	adds	r3, r3, #8	@ i, i,
	cmp	r3, r9	@ i, D.14215
	.loc 1 184 0
	eor	r2, r8, r0	@ tmp766, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r2, [r5, lr]	@ tmp766, *D.14311_217
	ldrb	lr, [r5, ip]	@ zero_extendqisi2	@ *D.14311_217, *D.14311_217
	ldrb	r0, [r7, r1]	@ zero_extendqisi2	@ MEM[symbol: buffer, index: i_245, offset: 0B], MEM[symbol: buffer, index: i_245, offset: 0B]
	eor	r2, lr, r0	@ tmp772, *D.14311_217, MEM[symbol: buffer, index: i_245, offset: 0B]
	strb	r2, [r5, ip]	@ tmp772, *D.14311_217
	.loc 1 183 0
	bne	.L13	@,
.L16:
.LBE24:
.LBE23:
	.loc 1 74 0
	add	r3, sp, #1672	@,,
	fldd	d6, .L117	@ int	@ tmp535,
	ldrd	r0, [r3]	@, mlen
	fmdrr	d7, r0, r1	@ int	@,
	vand	d18, d7, d6	@,, tmp535
	fmrrd	r2, r3, d18	@ int	@,
	fstd	d18, [sp, #24]	@ int	@, %sfp
	orrs	r1, r2, r3	@,
	itt	eq
	moveq	sl, r6	@ prephitmp.49, idx
	moveq	fp, #0	@ prephitmp.49,
	bne	.L114	@,
.L111:
	bic	ip, r9, #15	@ prephitmp.51, D.14215,
	.loc 1 77 0
	str	r6, [sp, #40]	@ idx, %sfp
	and	r9, r9, #15	@ prephitmp.57, D.14215,
.LVL57:
	add	r0, r7, ip	@, tmp655, prephitmp.51
	add	r6, sp, #64	@ tmp653,,
.LVL58:
	ldr	lr, [sp, #1672]	@, mlen
	str	r0, [sp, #56]	@, %sfp
	b	.L7	@
.LVL59:
.L113:
.LBB25:
	.loc 1 37 0
	ldrd	r0, [r9]	@, adlen
	mvn	r6, sl	@ tmp437, prephitmp.65
	mvn	lr, fp	@, prephitmp.65
	adds	r2, r6, r0	@ tmp439, tmp437,
	mov	r0, r4	@, tmp652
	adc	r3, lr, r1	@,,
	lsrs	r1, r2, #4	@ tmp637, tmp439,
	movs	r2, #15	@,
	orr	r1, r1, r3, lsl #28	@,, tmp637,,
	movs	r3, #4	@,
	bl	tweakey_set	@
.LVL60:
	b	.L6	@
.LVL61:
.L114:
.LBE25:
	.loc 1 76 0
	add	r8, sp, #1672	@,,
	mov	fp, #0	@ prephitmp.49,
	ldrd	r0, [r8]	@, mlen
	mov	sl, r6	@ prephitmp.49, idx
	movs	r2, #16	@,
	fmdrr	d19, sl, fp	@ int	@, prephitmp.49
	fmdrr	d20, r0, r1	@ int	@,
	vsub.i64	d21, d20, d19	@ tmp546,,
	vorr	d22, d21, d6	@, tmp546, tmp535
	vsub.i64	d23, d22, d6	@,, tmp535
	fmrrd	r0, r1, d23	@ int	@ tmp549,
	mov	r1, fp	@, prephitmp.49
	fstd	d22, [sp, #40]	@ int	@, %sfp
	adds	r0, r7, r0	@, tmp655, tmp549
	bl	memset	@
.LVL62:
	.loc 1 77 0
	ldr	r3, [sp, #24]	@, %sfp
	ldr	r1, [sp, #40]	@, %sfp
	lsls	r2, r3, #3	@ tmp560,,
	add	ip, r7, r1	@ tmp558, tmp655,
	strb	r2, [ip, #0]	@ tmp560, buffer
	b	.L111	@
.LVL63:
.L23:
	.loc 1 49 0
	movs	r2, #240	@ prephitmp.65,
	movs	r3, #0	@ prephitmp.65,
	mov	r9, #240	@ prephitmp.63,
	movs	r6, #0	@ idx,
	b	.L8	@
.LVL64:
.L20:
.LBB26:
	.loc 1 28 0
	mov	sl, #0	@ prephitmp.65,
	mov	fp, #0	@ prephitmp.65,
	movs	r6, #0	@ idx,
.LVL65:
	b	.L3	@
.L118:
	.align	3
.L117:
	.word	15
	.word	0
.LBE26:
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
	.loc 1 111 0
	.cfi_startproc
	@ args = 32, pretend = 0, frame = 1592
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL66:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}	@
.LCFI2:
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
.LCFI3:
	.cfi_def_cfa_offset 44
	.cfi_offset 80, -44
	mov	r8, r1	@ outputmlen, outputmlen
	.loc 1 112 0
	mov	r2, #256	@,
.LVL67:
	movs	r1, #0	@,
.LVL68:
	.loc 1 111 0
	mov	sl, r0	@ m, m
	mov	r9, r3	@ c, c
	subw	sp, sp, #1612	@,,
.LCFI4:
	.cfi_def_cfa_offset 1656
	.loc 1 114 0
	add	r4, sp, #1656	@,,
	.loc 1 112 0
	add	r0, sp, #72	@,,
.LVL69:
	.loc 1 111 0
	ldr	r6, [sp, #1664]	@ ad, ad
	.loc 1 112 0
	bl	memset	@
.LVL70:
	.loc 1 114 0
	fldd	d16, .L231	@ int	@ tmp316,
	.loc 1 116 0
	vmov.i32	q1, #0  @ v16qi	@ tmp319,
	.loc 1 114 0
	ldrd	r0, [r4]	@, clen
	.loc 1 116 0
	vstr	d2, [sp, #40]	@, auth
	vstr	d3, [sp, #48]	@, auth
.LVL71:
	.loc 1 117 0
	vstr	d2, [sp, #56]	@, checksum
	vstr	d3, [sp, #64]	@, checksum
.LVL72:
	.loc 1 114 0
	fmdrr	d17, r0, r1	@ int	@,
	.loc 1 120 0
	add	r1, sp, #1672	@,,
	ldrd	r4, [r1]	@, adlen
	.loc 1 114 0
	vadd.i64	d0, d17, d16	@,, tmp316
	fmrrd	r2, r3, d0	@ int	@ prephitmp.197,
	.loc 1 120 0
	orrs	r1, r4, r5	@,
	.loc 1 114 0
	fstd	d0, [r8, #0]	@ int	@ prephitmp.197, *outputmlen_7(D)
	.loc 1 120 0
	bne	.L223	@,
	add	r3, sp, #584	@,,
	str	r3, [sp, #24]	@, %sfp
.LVL73:
.L120:
.LBB27:
.LBB28:
	.file 2 "/usr/lib/gcc/arm-linux-gnueabihf/4.7/include/arm_neon.h"
	.loc 2 7926 0
	add	fp, r9, r2	@ tmp376, c, prephitmp.197
.LBE28:
.LBE27:
	.loc 1 145 0
	ldr	r0, [sp, #1684]	@, k
	movs	r2, #0	@,
.LVL74:
	ldr	r1, [sp, #1680]	@, npub
	.loc 1 141 0
	vldr	d22, [sp, #40]	@, auth
	vldr	d23, [sp, #48]	@, auth
.LBB30:
.LBB29:
	.loc 2 7926 0
	vld1.8	{d20-d21}, [fp]	@ D.14274, MEM[(const __builtin_neon_qi[16] *)D.14124_42]
.LBE29:
.LBE30:
	.loc 1 141 0
	veor	q12, q10, q11	@ tmp381, D.14274,
	vstr	d24, [sp, #40]	@, auth
	vstr	d25, [sp, #48]	@, auth
.LVL75:
	.loc 1 145 0
	bl	tweakey_schedule	@
.LVL76:
	.loc 1 146 0
	ldrd	r0, [r8]	@ D.14122, *outputmlen_7(D)
	cmp	r1, #0	@ D.14122,
	it eq
	cmpeq	r0, #256	@ D.14122,
	bcc	.L139	@,
	movs	r7, #0	@ idx,
	mov	fp, #256	@ idx,
	ldr	r4, [sp, #24]	@ tmp503, %sfp
	.loc 1 147 0
	mov	r5, r7	@ tmp508, idx
	movs	r6, #16	@ tmp509,
	b	.L126	@
.LVL77:
.L140:
	.loc 1 146 0
	mov	fp, lr	@ idx, idx
.LVL78:
.L126:
	.loc 1 147 0 discriminator 2
	add	r0, sp, #56	@,,
	movs	r2, #16	@,
	str	r5, [sp, #0]	@ tmp508,
	add	r1, sl, r7	@, m, idx
	mov	r3, r4	@, tmp503
	str	r5, [sp, #4]	@ tmp508,
	str	r0, [sp, #8]	@,
	add	r0, r9, r7	@, c, idx
	str	r6, [sp, #12]	@ tmp509,
	bl	decrypt_bloc128	@
.LVL79:
	.loc 1 148 0 discriminator 2
	mov	r1, r7	@, idx
	mov	r0, r4	@, tmp503
	bl	tweakey_increment	@
.LVL80:
	.loc 1 146 0 discriminator 2
	ldrd	r0, [r8]	@ D.14122, *outputmlen_7(D)
	add	lr, fp, #256	@ idx, idx,
	movs	r3, #0	@ D.14131,
	mov	r2, lr	@ D.14131, idx
	mov	r7, fp	@ idx, idx
	cmp	r1, r3	@ D.14122, D.14131
	it eq
	cmpeq	r0, r2	@ D.14122, D.14131
	bcs	.L140	@,
	mov	r2, fp	@ prephitmp.197, idx
.LVL81:
.L125:
	.loc 1 151 0
	subs	r2, r0, r2	@ tmp393, D.14122, prephitmp.197
	sbc	r3, r1, r3	@ tmp393, D.14122, prephitmp.197
	.loc 1 154 0
	fldd	d8, .L231+8	@ int	@ tmp397,
	.loc 1 151 0
	lsrs	r6, r2, #4	@ tmp494, tmp393,
	orr	r3, r6, r3, lsl #28	@,, tmp494,,
	str	r3, [sp, #20]	@, %sfp
.LVL82:
	.loc 1 154 0
	fmrrd	r2, r3, d8	@ int	@, tmp397
	and	r4, r0, r2	@ D.14135, D.14122,
	and	r5, r1, r3	@ D.14135, D.14122,
	orrs	r3, r4, r5	@, D.14135
.LVL83:
	bne	.L127	@,
	ldr	r1, [sp, #20]	@, %sfp
	lsls	r5, r1, #4	@,,
	str	r5, [sp, #28]	@, %sfp
.L128:
	.loc 1 166 0
	add	r1, r9, fp	@, c, idx
	ldr	r2, [sp, #28]	@, %sfp
	add	r0, sp, #72	@,,
	bl	memcpy	@
.LVL84:
.LBB31:
.LBB32:
	.loc 2 8322 0
	vldr	d28, [sp, #40]	@, auth
	vldr	d29, [sp, #48]	@, auth
.LBE32:
.LBE31:
	.loc 1 168 0
	ldrb	r2, [r8, #0]	@ zero_extendqisi2	@ *outputmlen_7(D), *outputmlen_7(D)
	.loc 1 167 0
	add	r7, sp, #72	@,,
	ldr	r3, [sp, #28]	@, %sfp
	.loc 1 168 0
	ldr	r0, [sp, #24]	@, %sfp
	ldr	r1, [sp, #20]	@, %sfp
	lsls	r6, r2, #4	@ tmp465, *outputmlen_7(D),
	movs	r2, #15	@,
	.loc 1 167 0
	adds	r4, r7, r3	@ D.14160,,
.LVL85:
.LBB34:
.LBB33:
	.loc 2 8322 0
	vst1.8	{d28-d29}, [r4]	@ auth, MEM[(__builtin_neon_qi[16] *)D.14160_104]
.LBE33:
.LBE34:
	.loc 1 168 0
	adds	r5, r6, #1	@ tmp467, tmp465,
	.loc 1 169 0
	add	r7, sp, #56	@,,
	.loc 1 168 0
	uxtb	r3, r5	@, tmp467
	.loc 1 169 0
	movs	r5, #0	@ tmp473,
	.loc 1 168 0
	bl	tweakey_set	@
.LVL86:
	.loc 1 169 0
	ldr	r6, [sp, #20]	@, %sfp
	add	r0, sp, #72	@,,
	str	r5, [sp, #0]	@ tmp473,
	mov	r1, r0	@,
	ldr	r3, [sp, #24]	@, %sfp
	str	r5, [sp, #4]	@ tmp473,
	str	r7, [sp, #8]	@,
	adds	r2, r6, #1	@,,
	str	r6, [sp, #12]	@,
	bl	decrypt_bloc128	@
.LVL87:
	.loc 1 170 0
	add	r1, sp, #72	@,,
	ldr	r2, [sp, #28]	@, %sfp
	add	r0, sl, fp	@, m, idx
	bl	memcpy	@
.LVL88:
	.loc 1 173 0
	add	r0, sp, #56	@,,
	mov	r1, r4	@, D.14160
	movs	r2, #16	@,
	bl	memcmp	@
.LVL89:
	cmp	r0, #0	@ tmp483
	bne	.L229	@
.L136:
	.loc 1 179 0
	add	sp, sp, #588	@,,
	add	sp, sp, #1024	@,
	fldmfdd	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL90:
.L223:
.LBB35:
	.loc 1 122 0
	add	r5, sp, #584	@,,
	movs	r2, #2	@,
	ldr	r0, [sp, #1684]	@, k
	ldr	r1, [sp, #1680]	@, npub
	mov	r3, r5	@,
	.loc 1 124 0
	add	r7, sp, #1672	@,,
	.loc 1 122 0
	str	r5, [sp, #24]	@, %sfp
	bl	tweakey_schedule	@
.LVL91:
	.loc 1 124 0
	ldrd	r0, [r7]	@, adlen
	mov	r2, #256	@ tmp324,
	movs	r3, #0	@,
	cmp	r3, r1	@ tmp324,
	it eq
	cmpeq	r2, r0	@ tmp324,
	bcs	.L137	@,
	mov	r2, #256	@ idx,
	mov	fp, #0	@ idx,
	str	r8, [sp, #32]	@ outputmlen, %sfp
	.loc 1 125 0
	mov	r4, fp	@ tmp510, idx
	mov	r8, r2	@ idx, idx
.LVL92:
	str	r6, [sp, #20]	@ ad, %sfp
	ldr	r7, [sp, #24]	@ tmp503, %sfp
	b	.L122	@
.LVL93:
.L138:
	ldr	r6, [sp, #20]	@, %sfp
	.loc 1 124 0
	mov	r8, ip	@ idx, idx
.LVL94:
.L122:
	.loc 1 125 0 discriminator 2
	add	r1, sp, #40	@,,
	movs	r3, #16	@,
	str	r4, [sp, #0]	@ tmp510,
	add	r0, r6, fp	@,, idx
	str	r4, [sp, #4]	@ tmp510,
	.loc 1 124 0 discriminator 2
	add	r6, sp, #1672	@,,
	.loc 1 125 0 discriminator 2
	str	r1, [sp, #8]	@,
	movs	r1, #0	@,
	mov	r2, r1	@,
	str	r3, [sp, #12]	@,
	mov	r3, r7	@, tmp503
	bl	encrypt_bloc128	@
.LVL95:
	.loc 1 126 0 discriminator 2
	mov	r1, fp	@, idx
	mov	r0, r7	@, tmp503
	bl	tweakey_increment	@
.LVL96:
	.loc 1 124 0 discriminator 2
	ldrd	r0, [r6]	@, adlen
	add	ip, r8, #256	@ idx, idx,
	movs	r3, #0	@ D.14107,
	mov	r2, ip	@ D.14107, idx
	mov	fp, r8	@ idx, idx
	cmp	r3, r1	@ D.14107,
	it eq
	cmpeq	r2, r0	@ D.14107,
	bcc	.L138	@,
	ldr	r6, [sp, #20]	@ ad, %sfp
	mov	r4, r8	@ idx, idx
	str	r3, [sp, #36]	@ tmp7, %sfp
	ldr	r8, [sp, #32]	@ outputmlen, %sfp
.LVL97:
	str	fp, [sp, #32]	@ tmp5, %sfp
.LVL98:
.L121:
	.loc 1 130 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #328	@,,
	bl	memset	@
.LVL99:
	.loc 1 131 0
	ldr	r2, [sp, #1672]	@, adlen
	adds	r1, r6, r4	@, ad, idx
	add	r0, sp, #328	@,,
	subs	r2, r2, r4	@,, idx
	.loc 1 132 0
	add	r4, sp, #1672	@,,
	.loc 1 131 0
	bl	memcpy	@
.LVL100:
	.loc 1 132 0
	fldd	d1, .L231+8	@ int	@ tmp345,
	ldrd	r0, [r4]	@, adlen
	fmdrr	d3, r0, r1	@ int	@,
	vand	d4, d3, d1	@,, tmp345
	fmrrd	r6, r7, d4	@ int	@ tmp344,
	orrs	r5, r6, r7	@, tmp344
	beq	.L230	@,
	.loc 1 135 0
	fldd	d5, .L231+16	@ int	@ tmp355,
	add	lr, sp, #1672	@,,
	ldrd	r0, [sp, #32]	@,,
	ldrd	r4, [lr]	@ D.14114, adlen
	fmrrd	r2, r3, d5	@ int	@ tmp354, tmp355
	subs	r4, r4, r0	@ D.14114, D.14114,
	sbc	r5, r5, r1	@ D.14114, D.14114,
	ldr	r0, [sp, #24]	@, %sfp
	adds	r1, r2, r4	@ tmp354, tmp354, D.14114
	adc	r3, r3, r5	@,, D.14114
	lsrs	r5, r1, #4	@ tmp490, tmp354,
	movs	r2, #15	@,
	orr	r1, r5, r3, lsl #28	@,, tmp490,,
	movs	r3, #6	@,
	.loc 1 136 0
	movs	r7, #128	@ tmp362,
	.loc 1 135 0
	bl	tweakey_set	@
.LVL101:
	.loc 1 136 0
	add	ip, sp, #328	@,,
	add	fp, ip, r4	@ tmp361,, D.14114
	strb	r7, [fp, #0]	@ tmp362, buffer2
.L124:
	.loc 1 138 0
	movs	r1, #0	@ tmp366,
	add	r5, sp, #40	@,,
	fldd	d6, .L231+8	@ int	@ tmp370,
	add	ip, sp, #1672	@,,
	fldd	d18, [sp, #32]	@ int	@, %sfp
	add	r0, sp, #328	@,,
	str	r1, [sp, #0]	@ tmp366,
	str	r1, [sp, #4]	@ tmp366,
	str	r5, [sp, #8]	@,
	ldrd	r2, [ip]	@, adlen
	fmdrr	d7, r2, r3	@ int	@,
	vadd.i64	d8, d7, d6	@ tmp369,, tmp370
	vsub.i64	d19, d8, d18	@, tmp369,
	fmrrd	r2, r3, d19	@ int	@ tmp371,
	lsrs	r7, r2, #4	@ tmp492, tmp371,
	mov	r2, r1	@,
	orr	r4, r7, r3, lsl #28	@, tmp527, tmp492,,
	ldr	r3, [sp, #24]	@, %sfp
	str	r4, [sp, #12]	@ tmp527,
	bl	encrypt_bloc128	@
.LVL102:
	ldrd	r2, [r8]	@ prephitmp.197, *outputmlen_7(D)
	ldr	r3, [sp, #24]	@, %sfp
	b	.L120	@
.L232:
	.align	3
.L231:
	.word	-16
	.word	-1
	.word	15
	.word	0
	.word	-1
	.word	-1
.LVL103:
.L127:
.LBE35:
.LBB36:
	.loc 1 156 0
	movs	r1, #0	@,
	mov	r2, #256	@,
	add	r0, sp, #328	@,,
	.loc 1 157 0
	lsls	r4, r4, #3	@ tmp407, D.14135,
	.loc 1 158 0
	movs	r5, #0	@ tmp412,
	.loc 1 156 0
	bl	memset	@
.LVL104:
	.loc 1 157 0
	ldr	r2, [sp, #20]	@, %sfp
	add	r0, sp, #328	@,,
	.loc 1 158 0
	mov	r1, r0	@,
	ldr	r3, [sp, #24]	@, %sfp
	.loc 1 157 0
	lsls	r7, r2, #4	@ D.14138,,
	.loc 1 158 0
	movs	r2, #16	@,
	.loc 1 157 0
	adds	r6, r0, r7	@ tmp405,, D.14138
	strb	r4, [r6, #15]	@ tmp407, buffer2
	.loc 1 158 0
	str	r5, [sp, #0]	@ tmp412,
	str	r5, [sp, #4]	@ tmp412,
	str	r5, [sp, #8]	@ tmp412,
	str	r5, [sp, #12]	@ tmp412,
	bl	encrypt_bloc128	@
.LVL105:
	.loc 1 160 0
	ldrd	r2, [r8]	@ D.14122, *outputmlen_7(D)
	str	r7, [sp, #28]	@ D.14138, %sfp
	fmdrr	d21, r2, r3	@ int	@, D.14122
	vand	d23, d21, d8	@,, tmp397
	fmrrd	r0, r1, d23	@ int	@,
	orrs	r1, r0, r1	@,
	beq	.L128	@,
	movs	r0, #1	@ ivtmp.275,
	movs	r1, #0	@ ivtmp.275,
	.loc 1 106 0
	mov	ip, r6	@ tmp505, tmp405
	.loc 1 160 0
	mov	lr, r5	@ i, tmp412
	fmrrd	r6, r7, d8	@ int	@ tmp506, tmp397
	fmdrr	d27, r0, r1	@ int	@ tmp507, ivtmp.275
	b	.L131	@
.LVL106:
.L141:
	fmrrd	r0, r1, d26	@ int	@ ivtmp.275, ivtmp.275
.LVL107:
.L131:
	.loc 1 161 0 discriminator 2
	bic	r3, r2, #15	@ tmp421, D.14122,
	ldrb	r5, [ip, lr]	@ zero_extendqisi2	@ MEM[base: D.14659_300, index: i_196, offset: 0B], MEM[base: D.14659_300, index: i_196, offset: 0B]
	fmdrr	d25, r0, r1	@ int	@, ivtmp.275
	add	r2, lr, r3	@ D.14146, i, tmp421
	.loc 1 160 0 discriminator 2
	add	lr, lr, #1	@ i, i,
.LVL108:
	.loc 1 161 0 discriminator 2
	ldrb	r4, [r9, r2]	@ zero_extendqisi2	@ *D.14148_83, *D.14148_83
	vadd.i64	d26, d25, d27	@ ivtmp.275,, tmp507
	eor	r3, r4, r5	@ tmp428, *D.14148_83, MEM[base: D.14659_300, index: i_196, offset: 0B]
	strb	r3, [sl, r2]	@ tmp428, *D.14147_77
	.loc 1 160 0 discriminator 2
	ldrd	r2, [r8]	@ D.14122, *outputmlen_7(D)
	and	r4, r2, r6	@ D.14135, D.14122, tmp506
	and	r5, r3, r7	@ D.14135, D.14122,
	cmp	r1, r5	@ ivtmp.275, D.14135
	it eq
	cmpeq	r0, r4	@ ivtmp.275, D.14135
	bcc	.L141	@,
.LBB37:
.LBB38:
	.loc 1 183 0
	subs	r7, r4, #0	@ D.14157, D.14135
.LBE38:
.LBE37:
	.loc 1 162 0
	bic	r1, r2, #15	@ tmp435, D.14122,
	add	lr, sl, r1	@ D.14155, m, tmp435
.LVL109:
.LBB40:
.LBB39:
	.loc 1 183 0
	beq	.L128	@,
	lsrs	r6, r7, #4	@ bnd.217, D.14157,
	cmp	r6, #0	@ bnd.217,
	it	ne	@
	cmpne	r7, #15	@, D.14157,
	.loc 1 106 0
	lsl	ip, r6, #4	@ i, bnd.217,
	bls	.L142	@,
	subs	r0, r6, #1	@ tmp517, bnd.217,
	.loc 1 184 0
	vldr	d30, [sp, #56]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d31, [sp, #64]	@, MEM[base: D.14647_302, offset: 4294967280B]
	mov	r2, lr	@ ivtmp.257, D.14155
	and	r4, r0, #7	@ tmp519, tmp517,
.LVL110:
	movs	r0, #1	@ ivtmp.253,
	vld1.8	{q14}, [r2]!	@ tmp444, MEM[(const uint8_t *)vect_p.225_292]
	cmp	r0, r6	@ ivtmp.253, bnd.217
	veor	q8, q15, q14	@ tmp445,, tmp444
	add	r3, sp, #88	@ ivtmp.256,,
	vstr	d16, [sp, #56]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d17, [sp, #64]	@, MEM[base: D.14647_302, offset: 4294967280B]
.LVL111:
	bcs	.L224	@,
	cmp	r4, #0	@ tmp519
	beq	.L133	@
	cmp	r4, #1	@ tmp519,
	beq	.L202	@,
	cmp	r4, #2	@ tmp519,
	beq	.L203	@,
	cmp	r4, #3	@ tmp519,
	beq	.L204	@,
	cmp	r4, #4	@ tmp519,
	beq	.L205	@,
	cmp	r4, #5	@ tmp519,
	beq	.L206	@,
	cmp	r4, #6	@ tmp519,
	beq	.L207	@,
	vldr	d2, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d3, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q0}, [r2]!	@ tmp640, MEM[(const uint8_t *)vect_p.225_292]
	movs	r0, #2	@ ivtmp.253,
	veor	q2, q1, q0	@ tmp642,, tmp640
	vstr	d4, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d5, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
.L207:
	vldr	d18, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d19, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q3}, [r2]!	@ tmp643, MEM[(const uint8_t *)vect_p.225_292]
	adds	r0, r0, #1	@ ivtmp.253, ivtmp.253,
	veor	q10, q9, q3	@ tmp645,, tmp643
	vstr	d20, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d21, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
.L206:
	vldr	d24, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d25, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q11}, [r2]!	@ tmp646, MEM[(const uint8_t *)vect_p.225_292]
	adds	r0, r0, #1	@ ivtmp.253, ivtmp.253,
	veor	q13, q12, q11	@ tmp648,, tmp646
	vstr	d26, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d27, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
.L205:
	vldr	d30, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d31, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q14}, [r2]!	@ tmp649, MEM[(const uint8_t *)vect_p.225_292]
	adds	r0, r0, #1	@ ivtmp.253, ivtmp.253,
	veor	q8, q15, q14	@ tmp651,, tmp649
	vstr	d16, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d17, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
.L204:
	vldr	d2, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d3, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q0}, [r2]!	@ tmp652, MEM[(const uint8_t *)vect_p.225_292]
	adds	r0, r0, #1	@ ivtmp.253, ivtmp.253,
	veor	q2, q1, q0	@ tmp654,, tmp652
	vstr	d4, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d5, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
.L203:
	vldr	d18, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d19, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q3}, [r2]!	@ tmp655, MEM[(const uint8_t *)vect_p.225_292]
	adds	r0, r0, #1	@ ivtmp.253, ivtmp.253,
	veor	q10, q9, q3	@ tmp657,, tmp655
	vstr	d20, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d21, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
.L202:
	adds	r0, r0, #1	@ ivtmp.253, ivtmp.253,
	vldr	d24, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d25, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q11}, [r2]!	@ tmp658, MEM[(const uint8_t *)vect_p.225_292]
	veor	q13, q12, q11	@ tmp660,, tmp658
	vstr	d26, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d27, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #16	@ ivtmp.256, ivtmp.256,
	cmp	r0, r6	@ ivtmp.253, bnd.217
	bcs	.L224	@,
.L133:
	adds	r0, r0, #8	@ ivtmp.253, ivtmp.253,
	vldr	d30, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d31, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	mov	r1, r3	@ tmp521, ivtmp.256
	mov	r5, r2	@ tmp522, ivtmp.257
	add	r4, r2, #48	@ ivtmp.257, ivtmp.257,
	vld1.8	{q14}, [r5]!	@ tmp534, MEM[(const uint8_t *)vect_p.225_292]
	vld1.8	{q11}, [r4]	@ tmp552, MEM[(const uint8_t *)vect_p.225_292]
	veor	q8, q15, q14	@ tmp536,, tmp534
	vld1.8	{q0}, [r5]!	@ tmp540, MEM[(const uint8_t *)vect_p.225_292]
	vstr	d16, [r3, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d17, [r3, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q3}, [r5]	@ tmp546, MEM[(const uint8_t *)vect_p.225_292]
	vldmia	r1!, {d2-d3}	@ tmp521, MEM[base: D.14647_302, offset: 4294967280B]
	add	r5, r2, #64	@ ivtmp.257, ivtmp.257,
	veor	q2, q1, q0	@ tmp542, MEM[base: D.14647_302, offset: 4294967280B], tmp540
	vld1.8	{q14}, [r5]	@ tmp558, MEM[(const uint8_t *)vect_p.225_292]
	vstr	d4, [r1, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d5, [r1, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	add	r4, r2, #96	@ ivtmp.257, ivtmp.257,
	vldmia	r1!, {d18-d19}	@ ivtmp.256, MEM[base: D.14647_302, offset: 4294967280B]
	add	r5, r2, #112	@ ivtmp.257, ivtmp.257,
	veor	q10, q9, q3	@ tmp548, MEM[base: D.14647_302, offset: 4294967280B], tmp546
	vld1.8	{q3}, [r4]	@ tmp570, MEM[(const uint8_t *)vect_p.225_292]
	vstr	d20, [r1, #-16]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d21, [r1, #-8]	@, MEM[base: D.14647_302, offset: 4294967280B]
	add	r1, r2, #80	@ ivtmp.257, ivtmp.257,
	vldr	d24, [r3, #32]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d25, [r3, #40]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d30, [r3, #48]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d31, [r3, #56]	@, MEM[base: D.14647_302, offset: 4294967280B]
	veor	q13, q12, q11	@ tmp554,, tmp552
	vldr	d2, [r3, #64]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d3, [r3, #72]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d18, [r3, #80]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d19, [r3, #88]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d24, [r3, #96]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vldr	d25, [r3, #104]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d26, [r3, #32]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d27, [r3, #40]	@, MEM[base: D.14647_302, offset: 4294967280B]
	veor	q8, q15, q14	@ tmp560,, tmp558
	vld1.8	{q0}, [r1]	@ tmp564, MEM[(const uint8_t *)vect_p.225_292]
	vstr	d16, [r3, #48]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d17, [r3, #56]	@, MEM[base: D.14647_302, offset: 4294967280B]
	veor	q2, q1, q0	@ tmp566,, tmp564
	veor	q10, q9, q3	@ tmp572,, tmp570
	vstr	d4, [r3, #64]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d5, [r3, #72]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d20, [r3, #80]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d21, [r3, #88]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vld1.8	{q11}, [r5]	@ tmp576, MEM[(const uint8_t *)vect_p.225_292]
	adds	r2, r2, #128	@ ivtmp.257, ivtmp.257,
	veor	q13, q12, q11	@ tmp578,, tmp576
	vstr	d26, [r3, #96]	@, MEM[base: D.14647_302, offset: 4294967280B]
	vstr	d27, [r3, #104]	@, MEM[base: D.14647_302, offset: 4294967280B]
	adds	r3, r3, #128	@ ivtmp.256, ivtmp.256,
	cmp	r0, r6	@ ivtmp.253, bnd.217
	bcc	.L133	@,
.L224:
	cmp	r7, ip	@ D.14157, i
	beq	.L128	@,
.L132:
	.loc 1 106 0
	add	r6, sp, #56	@,,
.LVL112:
	.loc 1 184 0
	ldrb	r5, [lr, ip]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	mvn	r2, ip	@ tmp513, i
	.loc 1 106 0
	add	r3, r6, ip	@ ivtmp.241,, i
	adds	r0, r2, r7	@ tmp512, tmp513, D.14157
	.loc 1 184 0
	ldrb	r4, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	.loc 1 183 0
	add	r2, ip, #1	@ i, i,
	and	r1, r0, #7	@ tmp514, tmp512,
	cmp	r7, r2	@ D.14157, i
	.loc 1 184 0
	eor	r6, r4, r5	@ tmp450, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
.LVL113:
	strb	r6, [r3], #1	@ tmp450, MEM[base: D.14631_169, offset: 4294967295B]
.LVL114:
	.loc 1 183 0
	bls	.L128	@,
	cmp	r1, #0	@ tmp514
	beq	.L135	@
	cmp	r1, #1	@ tmp514,
	beq	.L196	@,
	cmp	r1, #2	@ tmp514,
	beq	.L197	@,
	cmp	r1, #3	@ tmp514,
	beq	.L198	@,
	cmp	r1, #4	@ tmp514,
	beq	.L199	@,
	cmp	r1, #5	@ tmp514,
	beq	.L200	@,
	cmp	r1, #6	@ tmp514,
	.loc 1 184 0
	itttt	ne
	ldrbne	r4, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrbne	r1, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	eorne	r1, r4, r1	@ tmp621, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strbne	r1, [r3], #1	@ tmp621, MEM[base: D.14631_169, offset: 4294967295B]
	.loc 1 183 0
	it	ne
	addne	r2, r2, #1	@ i, i,
.LVL115:
	.loc 1 184 0
	ldrb	r1, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	ip, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r2, r2, #1	@ i, i,
	.loc 1 184 0
	eor	r0, r1, ip	@ tmp624, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r0, [r3], #1	@ tmp624, MEM[base: D.14631_169, offset: 4294967295B]
.L200:
	ldrb	r4, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	r5, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r2, r2, #1	@ i, i,
	.loc 1 184 0
	eor	r6, r4, r5	@ tmp627, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r6, [r3], #1	@ tmp627, MEM[base: D.14631_169, offset: 4294967295B]
.L199:
	ldrb	r1, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	ip, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r2, r2, #1	@ i, i,
	.loc 1 184 0
	eor	r0, r1, ip	@ tmp630, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r0, [r3], #1	@ tmp630, MEM[base: D.14631_169, offset: 4294967295B]
.L198:
	ldrb	r4, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	r5, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r2, r2, #1	@ i, i,
	.loc 1 184 0
	eor	r6, r4, r5	@ tmp633, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r6, [r3], #1	@ tmp633, MEM[base: D.14631_169, offset: 4294967295B]
.L197:
	ldrb	r1, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	ip, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r2, r2, #1	@ i, i,
	.loc 1 184 0
	eor	r0, r1, ip	@ tmp636, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r0, [r3], #1	@ tmp636, MEM[base: D.14631_169, offset: 4294967295B]
.L196:
	ldrb	r4, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	r5, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r2, r2, #1	@ i, i,
	cmp	r7, r2	@ D.14157, i
	.loc 1 184 0
	eor	r6, r4, r5	@ tmp639, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r6, [r3], #1	@ tmp639, MEM[base: D.14631_169, offset: 4294967295B]
	.loc 1 183 0
	bls	.L128	@,
.L135:
	.loc 1 184 0
	ldrb	r1, [r3, #0]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	mov	ip, r3	@ tmp515, ivtmp.241
	.loc 1 183 0
	adds	r5, r2, #1	@ tmp516, i,
	.loc 1 184 0
	ldrb	r0, [lr, r2]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	eor	r4, r1, r0	@ tmp584, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	r1, [lr, r5]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r4, [ip], #1	@ tmp584, MEM[base: D.14631_169, offset: 4294967295B]
	ldrb	r6, [r3, #1]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	.loc 1 183 0
	adds	r4, r2, #2	@ i, i,
	.loc 1 184 0
	ldrb	r5, [lr, r4]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	eor	r0, r6, r1	@ tmp589, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r1, r2, #3	@ i, i,
	.loc 1 184 0
	strb	r0, [ip, #0]	@ tmp589, MEM[base: D.14631_169, offset: 4294967295B]
	ldrb	ip, [ip, #1]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	r4, [r3, #3]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	ldrb	r0, [lr, r1]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	r1, [r3, #4]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	eor	r6, ip, r5	@ tmp594, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	ip, [r3, #7]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	strb	r6, [r3, #2]	@ tmp594, MEM[base: D.14631_169, offset: 4294967295B]
	.loc 1 183 0
	adds	r6, r2, #4	@ i, i,
	.loc 1 184 0
	eor	r5, r4, r0	@ tmp599, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	r4, [lr, r6]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r5, [r3, #3]	@ tmp599, MEM[base: D.14631_169, offset: 4294967295B]
	.loc 1 183 0
	adds	r5, r2, #5	@ i, i,
	.loc 1 184 0
	ldrb	r6, [r3, #5]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	eor	r0, r1, r4	@ tmp604, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	r1, [lr, r5]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	r5, [r3, #6]	@ zero_extendqisi2	@ D.14283, MEM[base: D.14630_39, offset: 0B]
	strb	r0, [r3, #4]	@ tmp604, MEM[base: D.14631_169, offset: 4294967295B]
	.loc 1 183 0
	adds	r0, r2, #6	@ i, i,
	.loc 1 184 0
	eor	r4, r6, r1	@ tmp609, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	ldrb	r6, [lr, r0]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	.loc 1 183 0
	adds	r0, r2, #7	@ i, i,
	adds	r2, r2, #8	@ i, i,
	.loc 1 184 0
	strb	r4, [r3, #5]	@ tmp609, MEM[base: D.14631_169, offset: 4294967295B]
	ldrb	r4, [lr, r0]	@ zero_extendqisi2	@ MEM[base: D.14155_95, index: i_34, offset: 0B], MEM[base: D.14155_95, index: i_34, offset: 0B]
	eor	r1, r5, r6	@ tmp614, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	eor	r5, ip, r4	@ tmp618, D.14283, MEM[base: D.14155_95, index: i_34, offset: 0B]
	strb	r1, [r3, #6]	@ tmp614, MEM[base: D.14631_169, offset: 4294967295B]
	adds	r3, r3, #8	@ ivtmp.241, ivtmp.241,
	.loc 1 183 0
	cmp	r7, r2	@ D.14157, i
	.loc 1 184 0
	strb	r5, [r3, #-1]	@ tmp618, MEM[base: D.14631_169, offset: 4294967295B]
	.loc 1 183 0
	bhi	.L135	@,
	b	.L128	@
.LVL116:
.L230:
.LBE39:
.LBE40:
.LBE36:
.LBB41:
	.loc 1 133 0
	ldrd	r2, [sp, #32]	@ tmp347,,
	mvns	r2, r2	@ tmp347, tmp347
	mvns	r4, r3	@,
	adds	r0, r2, r0	@ tmp349, tmp347, tmp6
	adc	r3, r4, r1	@,, tmp14
	lsrs	r1, r0, #4	@ tmp488, tmp349,
	ldr	r0, [sp, #24]	@, %sfp
	movs	r2, #15	@,
	orr	r1, r1, r3, lsl #28	@,, tmp488,,
	movs	r3, #4	@,
	bl	tweakey_set	@
.LVL117:
	b	.L124	@
.LVL118:
.L139:
.LBE41:
	.loc 1 146 0
	movs	r2, #0	@ prephitmp.197,
	movs	r3, #0	@ prephitmp.197,
	mov	fp, #0	@ idx,
	b	.L125	@
.LVL119:
.L137:
.LBB42:
	.loc 1 124 0
	movs	r4, #0	@,
	movs	r5, #0	@,
	strd	r4, [sp, #32]	@,,
	movs	r4, #0	@ idx,
	b	.L121	@
.LVL120:
.L229:
.LBE42:
	.loc 1 174 0
	mov	r0, sl	@, m
	mov	r1, r5	@, tmp473
	ldr	r2, [r8, #0]	@, *outputmlen_7(D)
	bl	memset	@
.LVL121:
	.loc 1 175 0
	mov	r0, #-1	@ D.14168,
	b	.L136	@
.LVL122:
.L142:
.LBB43:
	.loc 1 183 0
	mov	ip, #0	@ i,
	b	.L132	@
.LBE43:
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
	.loc 1 181 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL123:
	push	{r4, r5, r6, r7}	@
.LCFI5:
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 7, -4
	.loc 1 183 0
	cmp	r2, #0	@ len
	beq	.L233	@
	.loc 1 184 0
	ldrb	r5, [r1, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	subs	r4, r2, #1	@ tmp160, len,
	ldrb	r3, [r0, #0]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	and	r4, r4, #7	@ tmp162, tmp160,
	eors	r3, r3, r5	@, tmp158, MEM[base: in8_10(D), index: i_20, offset: 0B], *D.14097_8
	strb	r3, [r1, #0]	@ tmp158, *D.14097_8
	.loc 1 183 0
	movs	r3, #1	@ i,
.LVL124:
	cmp	r3, r2	@ i, len
	beq	.L233	@,
	cmp	r4, #0	@ tmp162
	beq	.L234	@
	cmp	r4, #1	@ tmp162,
	beq	.L261	@,
	cmp	r4, #2	@ tmp162,
	beq	.L262	@,
	cmp	r4, #3	@ tmp162,
	beq	.L263	@,
	cmp	r4, #4	@ tmp162,
	beq	.L264	@,
	cmp	r4, #5	@ tmp162,
	beq	.L265	@,
	cmp	r4, #6	@ tmp162,
	beq	.L266	@,
	.loc 1 184 0
	adds	r6, r1, r3	@ D.14097, cksum, i
	ldrb	ip, [r0, #1]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	movs	r3, #2	@ i,
	.loc 1 184 0
	ldrb	r5, [r6, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r4, r5, ip	@ tmp217, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r4, [r6, #0]	@ tmp217, *D.14097_8
.L266:
	and	r6, r3, #15	@ tmp218, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	ip, r1, r6	@ D.14097, cksum, tmp218
	ldrb	r4, [ip, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r6, r4, r5	@ tmp222, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [ip, #0]	@ tmp222, *D.14097_8
.L265:
	and	ip, r3, #15	@ tmp223, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r4, r1, ip	@ D.14097, cksum, tmp223
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eors	r6, r6, r5	@, tmp227, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp227, *D.14097_8
.L264:
	and	ip, r3, #15	@ tmp228, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r4, r1, ip	@ D.14097, cksum, tmp228
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eors	r6, r6, r5	@, tmp232, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp232, *D.14097_8
.L263:
	and	ip, r3, #15	@ tmp233, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r4, r1, ip	@ D.14097, cksum, tmp233
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eors	r6, r6, r5	@, tmp237, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp237, *D.14097_8
.L262:
	and	ip, r3, #15	@ tmp238, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r4, r1, ip	@ D.14097, cksum, tmp238
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eors	r6, r6, r5	@, tmp242, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r6, [r4, #0]	@ tmp242, *D.14097_8
.L261:
	and	ip, r3, #15	@ tmp243, i,
	ldrb	r5, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0
	adds	r3, r3, #1	@ i, i,
	.loc 1 184 0
	add	r4, r1, ip	@ D.14097, cksum, tmp243
	.loc 1 183 0
	cmp	r3, r2	@ i, len
	.loc 1 184 0
	ldrb	r6, [r4, #0]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r6, r5	@ tmp247, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r4, #0]	@ tmp247, *D.14097_8
	.loc 1 183 0
	beq	.L233	@,
.L234:
	.loc 1 184 0 discriminator 2
	and	r7, r3, #15	@ tmp166, i,
	ldrb	r6, [r0, r3]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r4, [r1, r7]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r4, r6	@ tmp170, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0 discriminator 2
	adds	r4, r3, #1	@ tmp163, i,
	.loc 1 184 0 discriminator 2
	and	ip, r4, #15	@ tmp172, tmp163,
	strb	r5, [r1, r7]	@ tmp170, *D.14097_8
	ldrb	r6, [r0, r4]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0 discriminator 2
	adds	r4, r3, #2	@ i, i,
	.loc 1 184 0 discriminator 2
	ldrb	r7, [r1, ip]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r7, r6	@ tmp176, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp176, *D.14097_8
	and	ip, r4, #15	@ tmp178, i,
	ldrb	r5, [r0, r4]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r4, r6, r5	@ tmp182, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0 discriminator 2
	adds	r5, r3, #3	@ i, i,
	.loc 1 184 0 discriminator 2
	strb	r4, [r1, ip]	@ tmp182, *D.14097_8
	and	ip, r5, #15	@ tmp184, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r6, r4	@ tmp188, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp188, *D.14097_8
	.loc 1 183 0 discriminator 2
	adds	r5, r3, #4	@ i, i,
	.loc 1 184 0 discriminator 2
	and	ip, r5, #15	@ tmp190, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r6, r4	@ tmp194, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp194, *D.14097_8
	.loc 1 183 0 discriminator 2
	adds	r5, r3, #5	@ i, i,
	.loc 1 184 0 discriminator 2
	and	ip, r5, #15	@ tmp196, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r6, r4	@ tmp200, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp200, *D.14097_8
	.loc 1 183 0 discriminator 2
	adds	r5, r3, #6	@ i, i,
	.loc 1 184 0 discriminator 2
	and	ip, r5, #15	@ tmp202, i,
	ldrb	r4, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	ldrb	r6, [r1, ip]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r6, r4	@ tmp206, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, ip]	@ tmp206, *D.14097_8
	.loc 1 183 0 discriminator 2
	adds	r5, r3, #7	@ i, i,
	adds	r3, r3, #8	@ i, i,
	.loc 1 184 0 discriminator 2
	and	r4, r5, #15	@ tmp208, i,
	ldrb	ip, [r0, r5]	@ zero_extendqisi2	@ MEM[base: in8_10(D), index: i_20, offset: 0B], MEM[base: in8_10(D), index: i_20, offset: 0B]
	.loc 1 183 0 discriminator 2
	cmp	r3, r2	@ i, len
	.loc 1 184 0 discriminator 2
	ldrb	r6, [r1, r4]	@ zero_extendqisi2	@ *D.14097_8, *D.14097_8
	eor	r5, r6, ip	@ tmp212, *D.14097_8, MEM[base: in8_10(D), index: i_20, offset: 0B]
	strb	r5, [r1, r4]	@ tmp212, *D.14097_8
	.loc 1 183 0 discriminator 2
	bne	.L234	@,
.L233:
	.loc 1 185 0
	pop	{r4, r5, r6, r7}
	bx	lr
	.cfi_endproc
.LFE1884:
	.size	update_checksum, .-update_checksum
.Letext0:
	.file 3 "/usr/lib/gcc/arm-linux-gnueabihf/4.7/include/stddef.h"
	.file 4 "/usr/include/stdint.h"
	.file 5 "crypto_aead/iscream14v2/neon/tae.h"
	.file 6 "/usr/include/string.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xe75
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x1
	.4byte	.LASF55
	.4byte	.LASF56
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
	.4byte	.LASF57
	.byte	0x4
	.byte	0x5
	.byte	0x23
	.4byte	0x134
	.uleb128 0x8
	.4byte	.LASF25
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF26
	.sleb128 2
	.uleb128 0x8
	.4byte	.LASF27
	.sleb128 4
	.uleb128 0x8
	.4byte	.LASF28
	.sleb128 6
	.uleb128 0x8
	.4byte	.LASF29
	.sleb128 1
	.byte	0
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x1ef4
	.byte	0x1
	.4byte	0xdf
	.byte	0x3
	.4byte	0x153
	.uleb128 0xa
	.ascii	"__a\000"
	.byte	0x2
	.2byte	0x1ef4
	.4byte	0x153
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x159
	.uleb128 0xc
	.4byte	0x61
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF45
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.byte	0x1
	.4byte	0x197
	.uleb128 0xe
	.ascii	"in8\000"
	.byte	0x1
	.byte	0xb5
	.4byte	0x153
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x1
	.byte	0xb5
	.4byte	0x197
	.uleb128 0xe
	.ascii	"len\000"
	.byte	0x1
	.byte	0xb5
	.4byte	0x25
	.uleb128 0x10
	.ascii	"i\000"
	.byte	0x1
	.byte	0xb6
	.4byte	0x25
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xfe
	.uleb128 0x11
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x2080
	.byte	0x1
	.byte	0x3
	.4byte	0x1c4
	.uleb128 0xa
	.ascii	"__a\000"
	.byte	0x2
	.2byte	0x2080
	.4byte	0x1c4
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
	.4byte	.LASF41
	.byte	0x1
	.byte	0x9
	.byte	0x1
	.4byte	0x53
	.4byte	.LFB1882
	.4byte	.LFE1882
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x7db
	.uleb128 0x13
	.ascii	"c\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x7db
	.4byte	.LLST1
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0x1
	.byte	0x9
	.4byte	0x7e1
	.4byte	.LLST2
	.uleb128 0x13
	.ascii	"m\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x7e7
	.4byte	.LLST3
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0xa
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii	"ad\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.4byte	.LASF33
	.byte	0x1
	.byte	0xb
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x15
	.4byte	.LASF34
	.byte	0x1
	.byte	0xc
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0xd
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x16
	.ascii	"k\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.4byte	.LASF36
	.byte	0x1
	.byte	0x10
	.4byte	0x7f2
	.byte	0x3
	.byte	0x91
	.sleb128 -1576
	.uleb128 0x17
	.4byte	.LASF37
	.byte	0x1
	.byte	0x11
	.4byte	0x802
	.byte	0x3
	.byte	0x91
	.sleb128 -1064
	.uleb128 0x18
	.ascii	"pad\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x812
	.byte	0x3
	.byte	0x91
	.sleb128 -1608
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x1
	.byte	0x14
	.4byte	0x197
	.4byte	.LLST4
	.uleb128 0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x15
	.4byte	0xfe
	.byte	0x3
	.byte	0x91
	.sleb128 -1592
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x25
	.4byte	.LLST5
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x30
	.4byte	.LLST6
	.uleb128 0x1b
	.4byte	.Ldebug_ranges0+0
	.4byte	0x439
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x25
	.4byte	.LLST7
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x22
	.4byte	0x7f2
	.byte	0x3
	.byte	0x91
	.sleb128 -1320
	.uleb128 0x1c
	.4byte	.LVL42
	.4byte	0xd42
	.4byte	0x317
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
	.byte	0x32
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x76
	.sleb128 28
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x76
	.sleb128 32
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL46
	.4byte	0xd65
	.4byte	0x356
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x79
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL47
	.4byte	0xd9c
	.4byte	0x36c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL49
	.4byte	0xdb5
	.4byte	0x38e
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
	.sleb128 -1320
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL50
	.4byte	0xdd8
	.4byte	0x3b7
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x6
	.byte	0x79
	.sleb128 0
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1320
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL51
	.4byte	0xe00
	.4byte	0x3d5
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x36
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL52
	.4byte	0xd65
	.4byte	0x41e
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
	.byte	0x7b
	.sleb128 0
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
	.sleb128 -1320
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x7
	.byte	0x7b
	.sleb128 0
	.byte	0x4c
	.byte	0x24
	.byte	0x76
	.sleb128 0
	.byte	0x21
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1592
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL60
	.4byte	0xe00
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x34
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
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
	.4byte	0x56f
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x3a
	.4byte	0x7f2
	.byte	0x3
	.byte	0x91
	.sleb128 -1320
	.uleb128 0x20
	.4byte	0x15e
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0x28
	.byte	0x1
	.byte	0x40
	.4byte	0x493
	.uleb128 0x21
	.4byte	0x182
	.4byte	.LLST8
	.uleb128 0x21
	.4byte	0x177
	.4byte	.LLST9
	.uleb128 0x21
	.4byte	0x16c
	.4byte	.LLST10
	.uleb128 0x22
	.4byte	.Ldebug_ranges0+0x40
	.uleb128 0x23
	.4byte	0x18d
	.4byte	.LLST11
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL14
	.4byte	0xdb5
	.4byte	0x4b4
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
	.sleb128 -1320
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL15
	.4byte	0xdd8
	.4byte	0x4da
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x8
	.byte	0xf0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x7
	.byte	0x91
	.sleb128 -1624
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1320
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL16
	.4byte	0xd65
	.4byte	0x51a
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
	.sleb128 -1320
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1320
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
	.4byte	.LVL19
	.4byte	0xd9c
	.4byte	0x534
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
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL23
	.4byte	0xdd8
	.4byte	0x54f
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
	.sleb128 -1320
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL24
	.4byte	0xdd8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x4
	.byte	0x91
	.sleb128 -1648
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0x91
	.sleb128 -1080
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	0x15e
	.4byte	.LBB23
	.4byte	.LBE23
	.byte	0x1
	.byte	0x48
	.4byte	0x5b1
	.uleb128 0x21
	.4byte	0x182
	.4byte	.LLST12
	.uleb128 0x21
	.4byte	0x177
	.4byte	.LLST13
	.uleb128 0x21
	.4byte	0x16c
	.4byte	.LLST14
	.uleb128 0x25
	.4byte	.LBB24
	.4byte	.LBE24
	.uleb128 0x23
	.4byte	0x18d
	.4byte	.LLST15
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL4
	.4byte	0xdb5
	.4byte	0x5d1
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
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL8
	.4byte	0xd42
	.4byte	0x5f8
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
	.4byte	0xd65
	.4byte	0x642
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
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x7b
	.sleb128 0
	.byte	0x7a
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x7
	.byte	0x91
	.sleb128 -1624
	.byte	0x6
	.byte	0x7a
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x79
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
	.4byte	0xd9c
	.4byte	0x65c
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
	.4byte	.LVL29
	.4byte	0xe00
	.4byte	0x67b
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL30
	.4byte	0xe00
	.4byte	0x6a0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x7a
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
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL31
	.4byte	0xe00
	.4byte	0x6cc
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x9
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x9
	.byte	0xf0
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x25
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x78
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
	.4byte	0xe00
	.4byte	0x6f8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x9
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x9
	.byte	0xe8
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x25
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x78
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
	.4byte	0xe00
	.4byte	0x720
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0xb
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0x34
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x4c
	.byte	0x25
	.byte	0x21
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3b
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL34
	.4byte	0xd65
	.4byte	0x761
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
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL35
	.4byte	0xdd8
	.4byte	0x780
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x91
	.sleb128 -1632
	.byte	0x6
	.byte	0x22
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL36
	.4byte	0xdd8
	.4byte	0x7a2
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x4
	.byte	0x91
	.sleb128 -1616
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL55
	.4byte	0xdd8
	.4byte	0x7c5
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x78
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL62
	.4byte	0xdb5
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
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
	.4byte	0x7ed
	.uleb128 0xc
	.4byte	0x3e
	.uleb128 0x26
	.4byte	0x61
	.4byte	0x802
	.uleb128 0x27
	.4byte	0x37
	.byte	0xff
	.byte	0
	.uleb128 0x26
	.4byte	0xfe
	.4byte	0x812
	.uleb128 0x27
	.4byte	0x37
	.byte	0x3f
	.byte	0
	.uleb128 0x26
	.4byte	0x61
	.4byte	0x822
	.uleb128 0x27
	.4byte	0x37
	.byte	0xf
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF42
	.byte	0x1
	.byte	0x6a
	.byte	0x1
	.4byte	0x53
	.4byte	.LFB1883
	.4byte	.LFE1883
	.4byte	.LLST16
	.byte	0x1
	.4byte	0xd0d
	.uleb128 0x13
	.ascii	"m\000"
	.byte	0x1
	.byte	0x6a
	.4byte	0x7db
	.4byte	.LLST17
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x6a
	.4byte	0x7e1
	.4byte	.LLST18
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x1
	.byte	0x6b
	.4byte	0x7db
	.4byte	.LLST19
	.uleb128 0x13
	.ascii	"c\000"
	.byte	0x1
	.byte	0x6c
	.4byte	0x7e7
	.4byte	.LLST20
	.uleb128 0x15
	.4byte	.LASF31
	.byte	0x1
	.byte	0x6c
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii	"ad\000"
	.byte	0x1
	.byte	0x6d
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.4byte	.LASF33
	.byte	0x1
	.byte	0x6d
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0x6e
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x16
	.ascii	"k\000"
	.byte	0x1
	.byte	0x6f
	.4byte	0x7e7
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x17
	.4byte	.LASF36
	.byte	0x1
	.byte	0x70
	.4byte	0x7f2
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0x17
	.4byte	.LASF37
	.byte	0x1
	.byte	0x71
	.4byte	0x802
	.byte	0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x74
	.4byte	0xfe
	.byte	0x3
	.byte	0x91
	.sleb128 -1616
	.uleb128 0x17
	.4byte	.LASF38
	.byte	0x1
	.byte	0x75
	.4byte	0xfe
	.byte	0x3
	.byte	0x91
	.sleb128 -1600
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x90
	.4byte	0x25
	.4byte	.LLST21
	.uleb128 0x19
	.4byte	.LASF44
	.byte	0x1
	.byte	0x97
	.4byte	0x53
	.4byte	.LLST22
	.uleb128 0x20
	.4byte	0x134
	.4byte	.LBB27
	.4byte	.Ldebug_ranges0+0x58
	.byte	0x1
	.byte	0x8d
	.4byte	0x932
	.uleb128 0x21
	.4byte	0x146
	.4byte	.LLST23
	.byte	0
	.uleb128 0x20
	.4byte	0x19d
	.4byte	.LBB31
	.4byte	.Ldebug_ranges0+0x70
	.byte	0x1
	.byte	0xa7
	.4byte	0x958
	.uleb128 0x21
	.4byte	0x1b7
	.4byte	.LLST24
	.uleb128 0x21
	.4byte	0x1ab
	.4byte	.LLST25
	.byte	0
	.uleb128 0x1b
	.4byte	.Ldebug_ranges0+0x88
	.4byte	0xab0
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x79
	.4byte	0x25
	.4byte	.LLST26
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x82
	.4byte	0x7f2
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0x1c
	.4byte	.LVL91
	.4byte	0xd42
	.4byte	0x9a6
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
	.byte	0x32
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
	.4byte	.LVL95
	.4byte	0xd65
	.4byte	0x9e2
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x1
	.byte	0x40
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -1616
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
	.4byte	.LVL96
	.4byte	0xd9c
	.4byte	0x9fc
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
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL99
	.4byte	0xdb5
	.4byte	0xa1d
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
	.sleb128 -1328
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL100
	.4byte	0xdd8
	.4byte	0xa32
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL101
	.4byte	0xe00
	.4byte	0xa52
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x36
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL102
	.4byte	0xd65
	.4byte	0xa93
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
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
	.sleb128 -1328
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
	.byte	0x75
	.sleb128 0
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
	.4byte	.LVL117
	.4byte	0xe00
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x34
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.Ldebug_ranges0+0xa8
	.4byte	0xb77
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x9c
	.4byte	0x7f2
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9f
	.4byte	0x30
	.4byte	.LLST27
	.uleb128 0x20
	.4byte	0x15e
	.4byte	.LBB37
	.4byte	.Ldebug_ranges0+0xc0
	.byte	0x1
	.byte	0xa2
	.4byte	0xb13
	.uleb128 0x21
	.4byte	0x182
	.4byte	.LLST28
	.uleb128 0x21
	.4byte	0x177
	.4byte	.LLST29
	.uleb128 0x21
	.4byte	0x16c
	.4byte	.LLST30
	.uleb128 0x22
	.4byte	.Ldebug_ranges0+0xd8
	.uleb128 0x23
	.4byte	0x18d
	.4byte	.LLST31
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL104
	.4byte	0xdb5
	.4byte	0xb35
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
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL105
	.4byte	0xd65
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
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
	.sleb128 -1328
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -1328
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
	.byte	0x2
	.byte	0x75
	.sleb128 0
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
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL70
	.4byte	0xdb5
	.4byte	0xb98
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
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL76
	.4byte	0xd42
	.4byte	0xbb9
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
	.4byte	.LVL79
	.4byte	0xe23
	.4byte	0xc02
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
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.byte	0x7a
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x79
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
	.sleb128 -1600
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
	.4byte	.LVL80
	.4byte	0xd9c
	.4byte	0xc1c
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
	.4byte	.LVL84
	.4byte	0xdd8
	.4byte	0xc42
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x4
	.byte	0x91
	.sleb128 -1628
	.byte	0x6
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
	.byte	0x3
	.byte	0x91
	.sleb128 -1584
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL86
	.4byte	0xe00
	.4byte	0xc6b
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x76
	.sleb128 1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x3f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x4
	.byte	0x91
	.sleb128 -1636
	.byte	0x6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL87
	.4byte	0xe23
	.4byte	0xcb1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.byte	0x91
	.sleb128 -1632
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
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x77
	.sleb128 0
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
	.4byte	.LVL88
	.4byte	0xdd8
	.4byte	0xcd7
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x4
	.byte	0x91
	.sleb128 -1628
	.byte	0x6
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
	.byte	0x7a
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL89
	.4byte	0xe5a
	.4byte	0xcf6
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
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL121
	.4byte	0xdb5
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
	.4byte	0x15e
	.4byte	.LFB1884
	.4byte	.LFE1884
	.4byte	.LLST32
	.byte	0x1
	.4byte	0xd42
	.uleb128 0x29
	.4byte	0x16c
	.byte	0x1
	.byte	0x50
	.uleb128 0x29
	.4byte	0x177
	.byte	0x1
	.byte	0x51
	.uleb128 0x29
	.4byte	0x182
	.byte	0x1
	.byte	0x52
	.uleb128 0x23
	.4byte	0x18d
	.4byte	.LLST33
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF46
	.byte	0x5
	.byte	0x1d
	.byte	0x1
	.byte	0x1
	.4byte	0xd65
	.uleb128 0x2b
	.4byte	0x153
	.uleb128 0x2b
	.4byte	0x153
	.uleb128 0x2b
	.4byte	0x61
	.uleb128 0x2b
	.4byte	0x197
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF47
	.byte	0x5
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.4byte	0xd9c
	.uleb128 0x2b
	.4byte	0x7e7
	.uleb128 0x2b
	.4byte	0x7db
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x53
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF48
	.byte	0x5
	.byte	0x1e
	.byte	0x1
	.byte	0x1
	.4byte	0xdb5
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x25
	.byte	0
	.uleb128 0x2c
	.byte	0x1
	.4byte	.LASF49
	.byte	0x1
	.4byte	0xdd6
	.byte	0x1
	.byte	0x1
	.4byte	0xdd6
	.uleb128 0x2b
	.4byte	0xdd6
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x37
	.byte	0
	.uleb128 0x2d
	.byte	0x4
	.uleb128 0x2c
	.byte	0x1
	.4byte	.LASF50
	.byte	0x1
	.4byte	0xdd6
	.byte	0x1
	.byte	0x1
	.4byte	0xdf9
	.uleb128 0x2b
	.4byte	0xdd6
	.uleb128 0x2b
	.4byte	0xdf9
	.uleb128 0x2b
	.4byte	0x37
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xdff
	.uleb128 0x2e
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF51
	.byte	0x5
	.byte	0x1f
	.byte	0x1
	.byte	0x1
	.4byte	0xe23
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x61
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.4byte	.LASF52
	.byte	0x5
	.byte	0x17
	.byte	0x1
	.byte	0x1
	.4byte	0xe5a
	.uleb128 0x2b
	.4byte	0x7e7
	.uleb128 0x2b
	.4byte	0x7db
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x53
	.uleb128 0x2b
	.4byte	0x197
	.uleb128 0x2b
	.4byte	0x53
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF53
	.byte	0x6
	.byte	0x44
	.byte	0x1
	.4byte	0x53
	.byte	0x1
	.uleb128 0x2b
	.4byte	0xdf9
	.uleb128 0x2b
	.4byte	0xdf9
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
	.uleb128 0x55
	.uleb128 0x6
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
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 1672
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1620
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1620
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x3
	.byte	0x79
	.sleb128 -1620
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.sleb128 -1620
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1620
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1620
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1620
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1620
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1620
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-1-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 -1620
	.4byte	.LVL62-1-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x3
	.byte	0x78
	.sleb128 -1620
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1620
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1620
	.4byte	.LVL65-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1620
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1612
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1612
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x3
	.byte	0x79
	.sleb128 -1612
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.sleb128 -1612
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1612
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1612
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1612
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1612
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1612
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-1-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 -1612
	.4byte	.LVL62-1-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x3
	.byte	0x78
	.sleb128 -1612
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1612
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1612
	.4byte	.LVL65-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1612
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1624
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1624
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x3
	.byte	0x79
	.sleb128 -1624
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.sleb128 -1624
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1624
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1624
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1624
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1624
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1624
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-1-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 -1624
	.4byte	.LVL62-1-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x3
	.byte	0x78
	.sleb128 -1624
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1624
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 -1624
	.4byte	.LVL65-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1624
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1648
	.4byte	.LVL64-.Ltext0
	.4byte	.LFE1882-.Ltext0
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
	.byte	0x56
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1632
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1632
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL64-.Ltext0
	.4byte	.LFE1882-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0xa
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0xf0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x7
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x9
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x91
	.sleb128 -1632
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LFB1883-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI2-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI3-.Ltext0
	.4byte	.LCFI4-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 44
	.4byte	.LCFI4-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 1656
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL69-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL90-.Ltext0
	.4byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL92-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1624
	.4byte	.LVL98-.Ltext0
	.4byte	.LVL119-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL120-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL67-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL70-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL70-1-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL75-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL118-.Ltext0
	.4byte	.LVL119-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL83-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1636
	.4byte	.LVL103-.Ltext0
	.4byte	.LVL116-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1636
	.4byte	.LVL120-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -1636
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x6
	.byte	0x79
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL85-.Ltext0
	.4byte	.LVL86-1-.Ltext0
	.2byte	0xa
	.byte	0x90
	.uleb128 0x11c
	.byte	0x93
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x11d
	.byte	0x93
	.uleb128 0x8
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL85-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL120-.Ltext0
	.4byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL90-.Ltext0
	.4byte	.LVL93-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL93-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL97-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL97-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL120-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL107-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL108-.Ltext0
	.4byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL122-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL112-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1600
	.byte	0x9f
	.4byte	.LVL112-.Ltext0
	.4byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL113-.Ltext0
	.4byte	.LVL116-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1600
	.byte	0x9f
	.4byte	.LVL122-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -1600
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL122-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL111-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL114-.Ltext0
	.4byte	.LVL115-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL122-.Ltext0
	.4byte	.LFE1883-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LFB1884-.Ltext0
	.4byte	.LCFI5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI5-.Ltext0
	.4byte	.LFE1884-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL123-.Ltext0
	.4byte	.LVL124-.Ltext0
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
	.4byte	.LBB22-.Ltext0
	.4byte	.LBE22-.Ltext0
	.4byte	.LBB25-.Ltext0
	.4byte	.LBE25-.Ltext0
	.4byte	.LBB26-.Ltext0
	.4byte	.LBE26-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB18-.Ltext0
	.4byte	.LBE18-.Ltext0
	.4byte	.LBB21-.Ltext0
	.4byte	.LBE21-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB19-.Ltext0
	.4byte	.LBE19-.Ltext0
	.4byte	.LBB20-.Ltext0
	.4byte	.LBE20-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB27-.Ltext0
	.4byte	.LBE27-.Ltext0
	.4byte	.LBB30-.Ltext0
	.4byte	.LBE30-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB31-.Ltext0
	.4byte	.LBE31-.Ltext0
	.4byte	.LBB34-.Ltext0
	.4byte	.LBE34-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB35-.Ltext0
	.4byte	.LBE35-.Ltext0
	.4byte	.LBB41-.Ltext0
	.4byte	.LBE41-.Ltext0
	.4byte	.LBB42-.Ltext0
	.4byte	.LBE42-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB36-.Ltext0
	.4byte	.LBE36-.Ltext0
	.4byte	.LBB43-.Ltext0
	.4byte	.LBE43-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB37-.Ltext0
	.4byte	.LBE37-.Ltext0
	.4byte	.LBB40-.Ltext0
	.4byte	.LBE40-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB38-.Ltext0
	.4byte	.LBE38-.Ltext0
	.4byte	.LBB39-.Ltext0
	.4byte	.LBE39-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF57:
	.ascii	"tweak_count\000"
.LASF6:
	.ascii	"size_t\000"
.LASF38:
	.ascii	"checksum\000"
.LASF28:
	.ascii	"TWEAK_AD_LAST_PARTIAL\000"
.LASF11:
	.ascii	"__builtin_neon_hi\000"
.LASF48:
	.ascii	"tweakey_increment\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF37:
	.ascii	"tweakey\000"
.LASF18:
	.ascii	"__builtin_neon_uhi\000"
.LASF39:
	.ascii	"auth\000"
.LASF51:
	.ascii	"tweakey_set\000"
.LASF56:
	.ascii	"/home/gaetan/implem/CAESAR\000"
.LASF5:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF50:
	.ascii	"memcpy\000"
.LASF40:
	.ascii	"buffer2\000"
.LASF10:
	.ascii	"__builtin_neon_qi\000"
.LASF58:
	.ascii	"vld1q_u8\000"
.LASF17:
	.ascii	"__builtin_neon_uqi\000"
.LASF21:
	.ascii	"int8x16_t\000"
.LASF29:
	.ascii	"TWEAK_TAG\000"
.LASF22:
	.ascii	"uint8x16_t\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"TWEAK_AD_LAST_FULL\000"
.LASF47:
	.ascii	"encrypt_bloc128\000"
.LASF46:
	.ascii	"tweakey_schedule\000"
.LASF34:
	.ascii	"nsec\000"
.LASF33:
	.ascii	"adlen\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF41:
	.ascii	"crypto_aead_encrypt\000"
.LASF16:
	.ascii	"__builtin_neon_poly16\000"
.LASF31:
	.ascii	"clen\000"
.LASF14:
	.ascii	"__builtin_neon_sf\000"
.LASF1:
	.ascii	"sizetype\000"
.LASF12:
	.ascii	"__builtin_neon_si\000"
.LASF13:
	.ascii	"__builtin_neon_di\000"
.LASF52:
	.ascii	"decrypt_bloc128\000"
.LASF19:
	.ascii	"__builtin_neon_usi\000"
.LASF54:
	.ascii	"GNU C 4.7.2\000"
.LASF20:
	.ascii	"__builtin_neon_udi\000"
.LASF23:
	.ascii	"float\000"
.LASF32:
	.ascii	"mlen\000"
.LASF55:
	.ascii	"crypto_aead/iscream14v2/neon/tae.c\000"
.LASF59:
	.ascii	"vst1q_u8\000"
.LASF45:
	.ascii	"update_checksum\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF43:
	.ascii	"outputmlen\000"
.LASF4:
	.ascii	"short int\000"
.LASF35:
	.ascii	"npub\000"
.LASF30:
	.ascii	"cksum\000"
.LASF15:
	.ascii	"__builtin_neon_poly8\000"
.LASF36:
	.ascii	"buffer\000"
.LASF53:
	.ascii	"memcmp\000"
.LASF25:
	.ascii	"TWEAK_MESSAGE\000"
.LASF26:
	.ascii	"TWEAK_AD\000"
.LASF24:
	.ascii	"v16qu\000"
.LASF49:
	.ascii	"memset\000"
.LASF7:
	.ascii	"uint8_t\000"
.LASF42:
	.ascii	"crypto_aead_decrypt\000"
.LASF44:
	.ascii	"fullblocks\000"
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
