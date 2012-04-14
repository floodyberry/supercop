	.syntax unified
	.cpu cortex-a8
	.fpu neon
	.file	"vector-llvm.o"
	.text
	.globl	v16_broadcast_cst_128
	.align	4
	.type	v16_broadcast_cst_128,%function
v16_broadcast_cst_128:                  @ @v16_broadcast_cst_128
@ BB#0:
	vmov.i16	q8, #0x80
	vmov	r0, r1, d16
	vmov	r2, r3, d17
	bx	lr
.Ltmp0:
	.size	v16_broadcast_cst_128, .Ltmp0-v16_broadcast_cst_128

	.globl	v16_broadcast_cst_255
	.align	4
	.type	v16_broadcast_cst_255,%function
v16_broadcast_cst_255:                  @ @v16_broadcast_cst_255
@ BB#0:
	vmov.i16	q8, #0xFF
	vmov	r0, r1, d16
	vmov	r2, r3, d17
	bx	lr
.Ltmp1:
	.size	v16_broadcast_cst_255, .Ltmp1-v16_broadcast_cst_255

	.globl	v16_broadcast_cst_257
	.align	4
	.type	v16_broadcast_cst_257,%function
v16_broadcast_cst_257:                  @ @v16_broadcast_cst_257
@ BB#0:
	vmov.i8	q8, #0x1
	vmov	r0, r1, d16
	vmov	r2, r3, d17
	bx	lr
.Ltmp2:
	.size	v16_broadcast_cst_257, .Ltmp2-v16_broadcast_cst_257

	.globl	v8_broadcast_cst_0
	.align	4
	.type	v8_broadcast_cst_0,%function
v8_broadcast_cst_0:                     @ @v8_broadcast_cst_0
@ BB#0:
	vmov.i32	q8, #0x0
	vmov	r0, r1, d16
	vmov	r2, r3, d17
	bx	lr
.Ltmp3:
	.size	v8_broadcast_cst_0, .Ltmp3-v8_broadcast_cst_0

	.globl	print_m32
	.align	4
	.type	print_m32,%function
print_m32:                              @ @print_m32
@ BB#0:
	bx	lr
.Ltmp4:
	.size	print_m32, .Ltmp4-print_m32

	.globl	print_m64
	.align	4
	.type	print_m64,%function
print_m64:                              @ @print_m64
@ BB#0:
	bx	lr
.Ltmp5:
	.size	print_m64, .Ltmp5-print_m64

	.globl	round512
	.align	4
	.type	round512,%function
round512:                               @ @round512
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	add	r11, sp, #28
	vpush	{d8, d9, d10, d11}
	sub	sp, sp, #588
	sub	sp, sp, #1024
	bic	sp, sp, #15
	add	r7, sp, #1472
	mov	r6, #0
.LBB6_1:                                @ =>This Inner Loop Header: Depth=1
	add	r4, r0, r6
	add	r5, r7, r6
	cmp	r6, #120
	vldr.64	d16, [r4]
	vrev64.8	d16, d16
	vstr.64	d16, [r5]
	add	r5, r6, #8
	mov	r6, r5
	bne	.LBB6_1
@ BB#2:
	add	r6, r1, #32
	add	r5, r1, #16
	add	r0, r1, #48
	str	r6, [sp, #184]          @ 4-byte Spill
	str	r5, [sp, #180]          @ 4-byte Spill
	add	r12, sp, #192
	str	r0, [sp, #188]          @ 4-byte Spill
	vmov.i32	d0[0], r2
	vld1.16	{d16, d17}, [r6, :128]
	movw	r6, :lower16:round512.SConst
	movt	r6, :upper16:round512.SConst
	vmov.i32	d0[1], r3
	vld1.16	{d20, d21}, [r1, :128]
	vmov.f32	s2, s0
	vmov.f32	s3, s1
	add	r8, r12, #720
	vld1.16	{d18, d19}, [r0, :128]
	add	r0, r6, #16
	add	lr, r12, #736
	add	r9, r12, #752
	vld1.16	{d22, d23}, [r5, :128]
	add	r10, r12, #1024
	vldr.64	d24, [r7]
	vldr.64	d25, [r7, #16]
	vld1.16	{d26, d27}, [r6, :128]
	veor	q12, q12, q13
	vst1.16	{d24, d25}, [r12, :128]
	vldr.64	d24, [r7, #32]
	vldr.64	d25, [r7, #48]
	vld1.16	{d26, d27}, [r0, :128]
	add	r0, r12, #16
	veor	q12, q12, q13
	str	r0, [sp, #176]          @ 4-byte Spill
	mov	r5, r0
	vst1.16	{d24, d25}, [r0, :128]
	add	r0, r6, #32
	vldr.64	d24, [r7, #8]
	vldr.64	d25, [r7, #24]
	vld1.16	{d26, d27}, [r0, :128]
	add	r0, r12, #32
	veor	q12, q12, q13
	str	r0, [sp, #172]          @ 4-byte Spill
	mov	r4, r0
	vst1.16	{d24, d25}, [r0, :128]
	add	r0, r6, #48
	vldr.64	d24, [r7, #40]
	vldr.64	d25, [r7, #56]
	vld1.16	{d26, d27}, [r0, :128]
	add	r0, r12, #48
	veor	q12, q12, q13
	str	r0, [sp, #168]          @ 4-byte Spill
	mov	r2, r0
	vst1.16	{d24, d25}, [r0, :128]
	adr	r0, .LCPI6_7
	vld1.16	{d24, d25}, [r0, :128]
	veor	q12, q0, q12
	vld1.16	{d26, d27}, [r5, :128]
	adr	r0, .LCPI6_8
	vadd.i64	q11, q11, q13
	vorr	d27, d24, d24
	vorr	d30, d25, d25
	vldr.64	d26, [r0, #8]
	vadd.i64	q11, q11, q9
	vldr.64	d31, .LCPI6_9
	veor	d29, d23, d26
	veor	d28, d22, d31
	vrev64.32	q12, q14
	vld1.16	{d28, d29}, [r12, :128]
	adr	r0, .LCPI6_10
	vadd.i64	q10, q10, q14
	vadd.i64	q14, q10, q8
	vld1.16	{d20, d21}, [r0, :128]
	veor	d1, d29, d30
	adr	r0, .LCPI6_11
	veor	d0, d28, d27
	vadd.i64	q10, q12, q10
	vrev64.32	q2, q0
	veor	q15, q9, q10
	vld1.16	{d18, d19}, [r0, :128]
	add	r0, r6, #64
	vadd.i64	q13, q2, q9
	vldr.64	d0, [r7, #64]
	vshr.u64	q9, q15, #25
	veor	q8, q8, q13
	vldr.64	d1, [r7, #80]
	vshl.i64	q15, q15, #39
	vld1.16	{d2, d3}, [r0, :128]
	add	r0, r12, #64
	veor	q0, q0, q1
	vorr	q1, q15, q9
	str	r0, [sp, #160]          @ 4-byte Spill
	vshr.u64	q9, q8, #25
	vst1.16	{d0, d1}, [r0, :128]
	vshl.i64	q8, q8, #39
	mov	r3, r0
	vld1.16	{d30, d31}, [r2, :128]
	add	r0, r6, #80
	vorr	q0, q8, q9
	vld1.16	{d16, d17}, [r4, :128]
	vadd.i64	q11, q11, q15
	vadd.i64	q8, q14, q8
	vadd.i64	q9, q11, q1
	vadd.i64	q15, q8, q0
	vldr.64	d16, .LCPI6_12
	veor	q12, q12, q9
	vldr.64	d17, .LCPI6_13
	veor	q14, q2, q15
	vldr.64	d4, [r7, #96]
	vldr.64	d5, [r7, #112]
	vtbl.8	d23, {d24, d25}, d16
	vtbl.8	d22, {d24, d25}, d17
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q2, q12
	add	r0, r12, #80
	vtbl.8	d25, {d28, d29}, d16
	mov	r2, r0
	vtbl.8	d24, {d28, d29}, d17
	veor	q14, q1, q10
	str	r0, [sp, #164]          @ 4-byte Spill
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #96
	vshr.u64	q1, q14, #11
	veor	q3, q0, q13
	vldr.64	d8, [r7, #72]
	vshl.i64	q2, q14, #53
	vldr.64	d9, [r7, #88]
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #96
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #152]          @ 4-byte Spill
	vorr	d29, d4, d2
	mov	r5, r0
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #112
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r3, :128]
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #104]
	vldr.64	d3, [r7, #120]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r12, #112
	veor	q1, q1, q3
	str	r0, [sp, #156]          @ 4-byte Spill
	veor	d7, d5, d22
	vst1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	mov	r2, r0
	veor	d6, d4, d25
	add	r0, r6, #128
	veor	d30, d2, d23
	vldr.64	d18, [r7, #112]
	vldr.64	d19, [r7, #32]
	vld1.16	{d22, d23}, [r0, :128]
	add	r0, r12, #128
	veor	q4, q9, q11
	vrev64.32	q11, q15
	str	r0, [sp, #140]          @ 4-byte Spill
	mov	r3, r0
	vrev64.32	q12, q3
	vadd.i64	q9, q10, q11
	vadd.i64	q15, q13, q12
	vst1.16	{d8, d9}, [r0, :128]
	veor	q10, q14, q9
	add	r0, r6, #144
	veor	q13, q0, q15
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshr.u64	q0, q13, #25
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r5, :128]
	vorr	q0, q13, q0
	vld1.16	{d26, d27}, [r2, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #72]
	vldr.64	d27, [r7, #104]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #144
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	str	r0, [sp, #148]          @ 4-byte Spill
	vadd.i64	q10, q1, q0
	vst1.16	{d4, d5}, [r0, :128]
	veor	q2, q11, q13
	mov	r2, r0
	veor	q1, q12, q10
	vldr.64	d24, [r7, #80]
	add	r0, r6, #160
	vldr.64	d25, [r7, #64]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r0, r12, #160
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	mov	r5, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #136]          @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #176
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #120]
	vldr.64	d9, [r7, #48]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #176
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #144]          @ 4-byte Spill
	veor	q4, q4, q5
	mov	r4, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #192
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r3, :128]
	vadd.i64	q13, q13, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #8]
	veor	d7, d5, d22
	vldr.64	d21, [r7]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #192
	vrev64.32	q11, q13
	str	r0, [sp, #132]          @ 4-byte Spill
	mov	r2, r0
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	add	r0, r6, #208
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r5, :128]
	vshl.i64	q9, q9, #39
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r4, :128]
	vadd.i64	q15, q2, q15
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #88]
	vldr.64	d25, [r7, #40]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r0, r12, #208
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	mov	r5, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #128]          @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #224
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #96]
	vldr.64	d9, [r7, #16]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #224
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #124]          @ 4-byte Spill
	veor	q4, q4, q5
	mov	r3, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #240
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r5, :128]
	b	.LBB6_10
@ BB#3:
	.align	4
.LCPI6_7:
	.long	953160567               @ 0x38d01377
	.long	1160258022              @ 0x452821e6
	.long	887688300               @ 0x34e90c6c
	.long	3193202383              @ 0xbe5466cf
@ BB#4:
	.align	4
.LCPI6_8:
	.zero	4
	.zero	4
	.long	3041331479              @ 0xb5470917
	.long	1065670069              @ 0x3f84d5b5
@ BB#5:
	.align	4
.LCPI6_9:
	.long	3380367581              @ 0xc97c50dd
	.long	3232508343              @ 0xc0ac29b7
	.zero	4
	.zero	4
@ BB#6:
	.align	4
.LCPI6_10:
	.long	698298832               @ 0x299f31d0
	.long	2752067618              @ 0xa4093822
	.long	3964562569              @ 0xec4e6c89
	.long	137296536               @ 0x82efa98
@ BB#7:
	.align	4
.LCPI6_11:
	.long	2242054355              @ 0x85a308d3
	.long	608135816               @ 0x243f6a88
	.long	57701188                @ 0x3707344
	.long	320440878               @ 0x13198a2e
@ BB#8:
	.align	4
.LCPI6_12:
	.byte	10                      @ 0xa
	.byte	11                      @ 0xb
	.byte	12                      @ 0xc
	.byte	13                      @ 0xd
	.byte	14                      @ 0xe
	.byte	15                      @ 0xf
	.byte	8                       @ 0x8
	.byte	9                       @ 0x9
@ BB#9:
	.align	4
.LCPI6_13:
	.byte	2                       @ 0x2
	.byte	3                       @ 0x3
	.byte	4                       @ 0x4
	.byte	5                       @ 0x5
	.byte	6                       @ 0x6
	.byte	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	1                       @ 0x1
.LBB6_10:
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #56]
	vldr.64	d3, [r7, #24]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r12, #240
	veor	q1, q1, q3
	str	r0, [sp, #120]          @ 4-byte Spill
	veor	d7, d5, d22
	vst1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	mov	r5, r0
	veor	d6, d4, d25
	add	r0, r6, #256
	veor	d30, d2, d23
	vldr.64	d18, [r7, #88]
	vldr.64	d19, [r7, #96]
	vld1.16	{d22, d23}, [r0, :128]
	add	r0, r12, #256
	veor	q4, q9, q11
	vrev64.32	q11, q15
	str	r0, [sp, #116]          @ 4-byte Spill
	mov	r2, r0
	vrev64.32	q12, q3
	vadd.i64	q9, q10, q11
	vadd.i64	q15, q13, q12
	vst1.16	{d8, d9}, [r0, :128]
	veor	q10, q14, q9
	add	r0, r6, #272
	veor	q13, q0, q15
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshr.u64	q0, q13, #25
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r5, :128]
	vorr	q0, q13, q0
	vld1.16	{d26, d27}, [r3, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #40]
	vldr.64	d27, [r7, #120]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #272
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	str	r0, [sp, #108]          @ 4-byte Spill
	vadd.i64	q10, q1, q0
	vst1.16	{d4, d5}, [r0, :128]
	veor	q2, q11, q13
	mov	r5, r0
	veor	q1, q12, q10
	vldr.64	d24, [r7, #64]
	add	r0, r6, #288
	vldr.64	d25, [r7]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r0, r12, #288
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	mov	r3, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #112]          @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #304
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #16]
	vldr.64	d9, [r7, #104]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #304
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #104]          @ 4-byte Spill
	veor	q4, q4, q5
	mov	r4, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #320
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r5, :128]
	vadd.i64	q13, q13, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #80]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #24]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #320
	vrev64.32	q11, q13
	str	r0, [sp, #96]           @ 4-byte Spill
	mov	r2, r0
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	add	r0, r6, #336
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r4, :128]
	vshl.i64	q9, q9, #39
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r3, :128]
	vadd.i64	q15, q2, q15
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #56]
	vldr.64	d25, [r7, #72]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r0, r12, #336
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	mov	r3, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #100]          @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #352
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #112]
	vldr.64	d9, [r7, #48]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #352
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #88]           @ 4-byte Spill
	veor	q4, q4, q5
	mov	r5, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #368
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r2, :128]
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r3, :128]
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #8]
	vldr.64	d3, [r7, #32]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r12, #368
	veor	q1, q1, q3
	str	r0, [sp, #92]           @ 4-byte Spill
	veor	d7, d5, d22
	vst1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	mov	r2, r0
	veor	d6, d4, d25
	add	r0, r6, #384
	veor	d30, d2, d23
	vldr.64	d18, [r7, #56]
	vldr.64	d19, [r7, #24]
	vld1.16	{d22, d23}, [r0, :128]
	add	r0, r12, #384
	veor	q4, q9, q11
	vrev64.32	q11, q15
	str	r0, [sp, #76]           @ 4-byte Spill
	mov	r3, r0
	vrev64.32	q12, q3
	vadd.i64	q9, q10, q11
	vadd.i64	q15, q13, q12
	vst1.16	{d8, d9}, [r0, :128]
	veor	q10, q14, q9
	add	r0, r6, #400
	veor	q13, q0, q15
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshr.u64	q0, q13, #25
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r5, :128]
	vorr	q0, q13, q0
	vld1.16	{d26, d27}, [r2, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #104]
	vldr.64	d27, [r7, #88]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #400
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	str	r0, [sp, #84]           @ 4-byte Spill
	vadd.i64	q10, q1, q0
	vst1.16	{d4, d5}, [r0, :128]
	veor	q2, q11, q13
	mov	r2, r0
	veor	q1, q12, q10
	vldr.64	d24, [r7, #72]
	add	r0, r6, #416
	vldr.64	d25, [r7, #8]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r0, r12, #416
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	mov	r5, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #72]           @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #432
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #96]
	vldr.64	d9, [r7, #112]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #432
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #80]           @ 4-byte Spill
	veor	q4, q4, q5
	mov	r4, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #448
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r3, :128]
	vadd.i64	q13, q13, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #16]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #40]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #448
	vrev64.32	q11, q13
	str	r0, [sp, #68]           @ 4-byte Spill
	mov	r2, r0
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	add	r0, r6, #464
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r5, :128]
	vshl.i64	q9, q9, #39
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r4, :128]
	vadd.i64	q15, q2, q15
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #32]
	vldr.64	d25, [r7, #120]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r0, r12, #464
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	mov	r5, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #64]           @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #480
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #48]
	vldr.64	d9, [r7, #80]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #480
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #60]           @ 4-byte Spill
	veor	q4, q4, q5
	mov	r3, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #496
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r5, :128]
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7]
	vldr.64	d3, [r7, #64]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r12, #496
	veor	q1, q1, q3
	str	r0, [sp, #56]           @ 4-byte Spill
	veor	d7, d5, d22
	vst1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	mov	r5, r0
	veor	d6, d4, d25
	add	r0, r6, #512
	veor	d30, d2, d23
	vldr.64	d18, [r7, #72]
	vldr.64	d19, [r7, #40]
	vld1.16	{d22, d23}, [r0, :128]
	add	r0, r12, #512
	veor	q4, q9, q11
	vrev64.32	q11, q15
	str	r0, [sp, #52]           @ 4-byte Spill
	mov	r2, r0
	vrev64.32	q12, q3
	vadd.i64	q9, q10, q11
	vadd.i64	q15, q13, q12
	vst1.16	{d8, d9}, [r0, :128]
	veor	q10, q14, q9
	add	r0, r6, #528
	veor	q13, q0, q15
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshr.u64	q0, q13, #25
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r5, :128]
	vorr	q0, q13, q0
	vld1.16	{d26, d27}, [r3, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #16]
	vldr.64	d27, [r7, #80]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #528
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	str	r0, [sp, #44]           @ 4-byte Spill
	vadd.i64	q10, q1, q0
	vst1.16	{d4, d5}, [r0, :128]
	veor	q2, q11, q13
	mov	r5, r0
	veor	q1, q12, q10
	vldr.64	d24, [r7]
	add	r0, r6, #544
	vldr.64	d25, [r7, #56]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r0, r12, #544
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	mov	r3, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #48]           @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #560
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #32]
	vldr.64	d9, [r7, #120]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #560
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #40]           @ 4-byte Spill
	veor	q4, q4, q5
	mov	r4, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #576
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r5, :128]
	vadd.i64	q13, q13, q1
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #112]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #88]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #576
	vrev64.32	q11, q13
	str	r0, [sp, #32]           @ 4-byte Spill
	mov	r2, r0
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	add	r0, r6, #592
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r4, :128]
	vshl.i64	q9, q9, #39
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r3, :128]
	vadd.i64	q15, q2, q15
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #48]
	vldr.64	d25, [r7, #24]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r0, r12, #592
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	mov	r3, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #36]           @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #608
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #8]
	vldr.64	d9, [r7, #96]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r12, #608
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	str	r0, [sp, #24]           @ 4-byte Spill
	veor	q4, q4, q5
	mov	r5, r0
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r0, :128]
	vorr	d1, d6, d0
	add	r0, r6, #624
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r2, :128]
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r3, :128]
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #64]
	vldr.64	d3, [r7, #104]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r12, #624
	veor	q1, q1, q3
	str	r0, [sp, #28]           @ 4-byte Spill
	veor	d7, d5, d22
	vst1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	mov	r2, r0
	veor	d6, d4, d25
	add	r0, r6, #640
	veor	d30, d2, d23
	vldr.64	d18, [r7, #16]
	vldr.64	d19, [r7, #48]
	vld1.16	{d22, d23}, [r0, :128]
	add	r0, r12, #640
	veor	q4, q9, q11
	vrev64.32	q11, q15
	str	r0, [sp, #16]           @ 4-byte Spill
	mov	r3, r0
	vrev64.32	q12, q3
	vadd.i64	q9, q10, q11
	vadd.i64	q15, q13, q12
	vst1.16	{d8, d9}, [r0, :128]
	veor	q10, q14, q9
	add	r0, r6, #656
	veor	q13, q0, q15
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshr.u64	q0, q13, #25
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r5, :128]
	vorr	q0, q13, q0
	add	r5, r12, #688
	vld1.16	{d26, d27}, [r2, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7]
	vldr.64	d27, [r7, #64]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #656
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	str	r0, [sp, #20]           @ 4-byte Spill
	vadd.i64	q10, q1, q0
	vst1.16	{d4, d5}, [r0, :128]
	veor	q2, q11, q13
	mov	r2, r0
	veor	q1, q12, q10
	vldr.64	d24, [r7, #96]
	add	r0, r6, #672
	vldr.64	d25, [r7, #80]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r0, r12, #672
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	mov	r4, r0
	vtbl.8	d24, {d2, d3}, d17
	str	r0, [sp, #12]           @ 4-byte Spill
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #688
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #88]
	vldr.64	d9, [r7, #24]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r6, #704
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r5, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r3, :128]
	vadd.i64	q13, q13, q1
	add	r3, r12, #768
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #32]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #56]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #704
	vrev64.32	q11, q13
	str	r0, [sp, #8]            @ 4-byte Spill
	mov	r2, r0
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	add	r0, r6, #720
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r4, :128]
	vshl.i64	q9, q9, #39
	add	r4, r6, #816
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r5, :128]
	vadd.i64	q15, q2, q15
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #120]
	vldr.64	d25, [r7, #8]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r0, r6, #736
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r8, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #104]
	vldr.64	d9, [r7, #40]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r0, :128]
	add	r0, r6, #752
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [lr, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r8, :128]
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r2, :128]
	add	r2, r12, #784
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #112]
	vldr.64	d3, [r7, #72]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r6, #768
	veor	q1, q1, q3
	vst1.16	{d2, d3}, [r9, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	veor	d7, d5, d22
	vldr.64	d18, [r7, #96]
	veor	d6, d4, d25
	vldr.64	d19, [r7, #8]
	veor	d30, d2, d23
	vld1.16	{d22, d23}, [r0, :128]
	veor	q4, q9, q11
	add	r0, r6, #784
	vrev64.32	q12, q3
	vrev64.32	q11, q15
	vadd.i64	q15, q13, q12
	vadd.i64	q9, q10, q11
	vst1.16	{d8, d9}, [r3, :128]
	veor	q13, q0, q15
	veor	q10, q14, q9
	vshr.u64	q0, q13, #25
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r9, :128]
	vorr	q0, q13, q0
	vld1.16	{d26, d27}, [lr, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #112]
	vldr.64	d27, [r7, #32]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #800
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	vst1.16	{d4, d5}, [r2, :128]
	vadd.i64	q10, q1, q0
	veor	q2, q11, q13
	veor	q1, q12, q10
	vldr.64	d24, [r7, #40]
	vldr.64	d25, [r7, #120]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r0, r12, #800
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r0, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #104]
	vldr.64	d9, [r7, #80]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r4, :128]
	add	r4, r12, #816
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r4, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r2, :128]
	vadd.i64	q13, q13, q1
	add	r2, r6, #832
	vld1.16	{d4, d5}, [r3, :128]
	add	r3, r12, #832
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #48]
	vld1.16	{d22, d23}, [r2, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r2, r6, #864
	vrev64.32	q11, q13
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r3, :128]
	vadd.i64	q13, q9, q12
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r4, :128]
	vshl.i64	q9, q9, #39
	add	r4, r12, #864
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r0, :128]
	vadd.i64	q15, q2, q15
	add	r0, r6, #848
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #72]
	vldr.64	d25, [r7, #64]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r0, r12, #848
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r0, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #56]
	vldr.64	d9, [r7, #24]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r2, :128]
	add	r2, r12, #880
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r4, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r3, :128]
	vadd.i64	q15, q15, q1
	add	r3, r12, #928
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #880
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #16]
	vldr.64	d3, [r7, #88]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r6, #896
	veor	q1, q1, q3
	vst1.16	{d2, d3}, [r2, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	veor	d7, d5, d22
	vldr.64	d18, [r7, #104]
	veor	d6, d4, d25
	vldr.64	d19, [r7, #56]
	veor	d30, d2, d23
	vld1.16	{d22, d23}, [r0, :128]
	veor	q4, q9, q11
	add	r0, r12, #896
	vrev64.32	q12, q3
	vrev64.32	q11, q15
	vadd.i64	q15, q13, q12
	vadd.i64	q9, q10, q11
	vst1.16	{d8, d9}, [r0, :128]
	veor	q13, q0, q15
	veor	q10, q14, q9
	vshr.u64	q0, q13, #25
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r4, :128]
	vorr	q0, q13, q0
	add	r4, r12, #912
	vld1.16	{d26, d27}, [r2, :128]
	add	r2, r6, #912
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #96]
	vldr.64	d27, [r7, #24]
	vld1.16	{d4, d5}, [r2, :128]
	add	r2, r6, #928
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	vst1.16	{d4, d5}, [r4, :128]
	vadd.i64	q10, q1, q0
	veor	q2, q11, q13
	veor	q1, q12, q10
	vldr.64	d24, [r7, #88]
	vldr.64	d25, [r7, #112]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r2, r6, #944
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r3, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #8]
	vldr.64	d9, [r7, #72]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r2, :128]
	add	r2, r12, #944
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r2, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q13, q13, q1
	add	r0, r6, #960
	vld1.16	{d4, d5}, [r4, :128]
	add	r4, r12, #1168
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #40]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #120]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #960
	vrev64.32	q11, q13
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r3, :128]
	vshl.i64	q9, q9, #39
	add	r3, r6, #992
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r2, :128]
	vadd.i64	q15, q2, q15
	add	r2, r6, #976
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #64]
	vldr.64	d25, [r7, #16]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r2, r12, #976
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r2, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7]
	vldr.64	d9, [r7, #32]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r3, :128]
	add	r3, r12, #992
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r3, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r2, :128]
	vadd.i64	q15, q15, q1
	add	r2, r6, #1024
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r6, #1008
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #48]
	vldr.64	d3, [r7, #80]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r12, #1008
	veor	q1, q1, q3
	vst1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	veor	d7, d5, d22
	vldr.64	d18, [r7, #48]
	veor	d6, d4, d25
	vldr.64	d19, [r7, #112]
	veor	d30, d2, d23
	vld1.16	{d22, d23}, [r2, :128]
	veor	q4, q9, q11
	add	r2, r6, #1056
	vrev64.32	q12, q3
	vrev64.32	q11, q15
	vadd.i64	q15, q13, q12
	vadd.i64	q9, q10, q11
	vst1.16	{d8, d9}, [r10, :128]
	veor	q13, q0, q15
	veor	q10, q14, q9
	vshr.u64	q0, q13, #25
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r0, :128]
	vorr	q0, q13, q0
	add	r0, r6, #1040
	vld1.16	{d26, d27}, [r3, :128]
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	add	r3, r12, #1056
	vldr.64	d26, [r7, #88]
	vldr.64	d27, [r7]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #1040
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	vst1.16	{d4, d5}, [r0, :128]
	vadd.i64	q10, q1, q0
	veor	q2, q11, q13
	veor	q1, q12, q10
	vldr.64	d24, [r7, #120]
	vldr.64	d25, [r7, #72]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r2, r6, #1072
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r3, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #24]
	vldr.64	d9, [r7, #64]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r2, :128]
	add	r2, r12, #1072
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r2, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q13, q13, q1
	add	r0, r6, #1088
	vld1.16	{d4, d5}, [r10, :128]
	vadd.i64	q1, q13, q14
	veor	d27, d3, d24
	vadd.i64	q10, q10, q2
	veor	d26, d2, d23
	vadd.i64	q2, q10, q0
	vldr.64	d20, [r7, #96]
	veor	d7, d5, d22
	vldr.64	d21, [r7, #104]
	vld1.16	{d22, d23}, [r0, :128]
	veor	d6, d4, d25
	veor	q4, q10, q11
	add	r0, r12, #1088
	vrev64.32	q11, q13
	vadd.i64	q10, q15, q11
	vrev64.32	q12, q3
	veor	q14, q14, q10
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q9, q12
	veor	q9, q0, q13
	vshr.u64	q15, q14, #25
	vshl.i64	q14, q14, #39
	vshr.u64	q0, q9, #25
	vorr	q14, q14, q15
	vld1.16	{d30, d31}, [r2, :128]
	vshl.i64	q9, q9, #39
	add	r2, r6, #1104
	vadd.i64	q15, q1, q15
	vorr	q0, q9, q0
	vadd.i64	q9, q15, q14
	vld1.16	{d30, d31}, [r3, :128]
	vadd.i64	q15, q2, q15
	add	r3, r6, #1120
	veor	q2, q11, q9
	vadd.i64	q15, q15, q0
	veor	q1, q12, q15
	vldr.64	d24, [r7, #8]
	vldr.64	d25, [r7, #80]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q10, q10, q11
	veor	q2, q12, q2
	add	r2, r12, #1104
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q10
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q13, q13, q12
	vst1.16	{d4, d5}, [r2, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q13
	vldr.64	d8, [r7, #16]
	vldr.64	d9, [r7, #56]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r3, :128]
	add	r3, r12, #1120
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r3, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	add	r0, r6, #1136
	vadd.i64	q15, q15, q1
	vld1.16	{d4, d5}, [r2, :128]
	add	r2, r12, #1136
	vadd.i64	q9, q9, q2
	vldr.64	d2, [r7, #32]
	vldr.64	d3, [r7, #40]
	vadd.i64	q2, q9, q0
	vld1.16	{d6, d7}, [r0, :128]
	add	r0, r6, #1152
	veor	q1, q1, q3
	vst1.16	{d2, d3}, [r2, :128]
	vadd.i64	q1, q15, q14
	veor	d31, d3, d24
	veor	d7, d5, d22
	vldr.64	d18, [r7, #80]
	veor	d6, d4, d25
	vldr.64	d19, [r7, #64]
	veor	d30, d2, d23
	vld1.16	{d22, d23}, [r0, :128]
	veor	q4, q9, q11
	add	r0, r12, #1152
	vrev64.32	q12, q3
	vrev64.32	q11, q15
	vadd.i64	q15, q13, q12
	vadd.i64	q9, q10, q11
	vst1.16	{d8, d9}, [r0, :128]
	veor	q13, q0, q15
	veor	q10, q14, q9
	vshr.u64	q0, q13, #25
	vshr.u64	q14, q10, #25
	vshl.i64	q10, q10, #39
	vshl.i64	q13, q13, #39
	vorr	q14, q10, q14
	vld1.16	{d20, d21}, [r3, :128]
	vorr	q0, q13, q0
	add	r3, r12, #1184
	vld1.16	{d26, d27}, [r2, :128]
	add	r2, r6, #1168
	vadd.i64	q10, q1, q10
	vadd.i64	q1, q2, q13
	vldr.64	d26, [r7, #56]
	vldr.64	d27, [r7, #8]
	vld1.16	{d4, d5}, [r2, :128]
	add	r2, r6, #1184
	veor	q2, q13, q2
	vadd.i64	q13, q10, q14
	vst1.16	{d4, d5}, [r4, :128]
	vadd.i64	q10, q1, q0
	veor	q2, q11, q13
	veor	q1, q12, q10
	vldr.64	d24, [r7, #16]
	vldr.64	d25, [r7, #32]
	vtbl.8	d23, {d4, d5}, d16
	vtbl.8	d22, {d4, d5}, d17
	vld1.16	{d4, d5}, [r2, :128]
	vadd.i64	q9, q9, q11
	veor	q2, q12, q2
	add	r2, r6, #1200
	vtbl.8	d25, {d2, d3}, d16
	veor	q14, q14, q9
	vtbl.8	d24, {d2, d3}, d17
	vshr.u64	q1, q14, #11
	vadd.i64	q15, q15, q12
	vst1.16	{d4, d5}, [r3, :128]
	vshl.i64	q2, q14, #53
	veor	q3, q0, q15
	vldr.64	d8, [r7, #48]
	vldr.64	d9, [r7, #40]
	vorr	d29, d4, d2
	vld1.16	{d10, d11}, [r2, :128]
	add	r2, r12, #1200
	vshr.u64	q0, q3, #11
	vshl.i64	q3, q3, #53
	veor	q4, q4, q5
	vorr	d28, d7, d1
	vst1.16	{d8, d9}, [r2, :128]
	vorr	d1, d6, d0
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q13, q13, q1
	add	r0, r6, #1216
	vld1.16	{d4, d5}, [r4, :128]
	vadd.i64	q10, q10, q2
	vadd.i64	q13, q13, q14
	veor	d3, d27, d24
	vadd.i64	q10, q10, q0
	veor	d2, d26, d23
	veor	d23, d21, d22
	veor	d22, d20, d25
	vldr.64	d24, [r7, #120]
	vldr.64	d25, [r7, #72]
	vld1.16	{d4, d5}, [r0, :128]
	add	r0, r12, #1216
	veor	q4, q12, q2
	vrev64.32	q2, q1
	vadd.i64	q1, q15, q2
	vrev64.32	q3, q11
	veor	q12, q14, q1
	vst1.16	{d8, d9}, [r0, :128]
	vadd.i64	q11, q9, q3
	vshr.u64	q14, q12, #25
	vshl.i64	q12, q12, #39
	veor	q9, q0, q11
	vorr	q14, q12, q14
	vld1.16	{d24, d25}, [r3, :128]
	vadd.i64	q12, q13, q12
	add	r3, r6, #1248
	vshr.u64	q13, q9, #25
	vshl.i64	q9, q9, #39
	vadd.i64	q12, q12, q14
	vorr	q0, q9, q13
	vld1.16	{d18, d19}, [r2, :128]
	vadd.i64	q9, q10, q9
	add	r2, r6, #1232
	veor	q10, q2, q12
	vldr.64	d4, [r7, #24]
	vadd.i64	q15, q9, q0
	vldr.64	d5, [r7, #104]
	vtbl.8	d19, {d20, d21}, d16
	veor	q13, q3, q15
	vtbl.8	d18, {d20, d21}, d17
	vld1.16	{d20, d21}, [r2, :128]
	add	r2, r12, #1232
	veor	q2, q2, q10
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	vadd.i64	q13, q1, q9
	vadd.i64	q11, q11, q10
	vst1.16	{d4, d5}, [r2, :128]
	veor	q14, q14, q13
	vldr.64	d8, [r7, #88]
	veor	q3, q0, q11
	vldr.64	d9, [r7, #112]
	vld1.16	{d10, d11}, [r3, :128]
	add	r3, r12, #1248
	veor	q4, q4, q5
	vshr.u64	q1, q14, #11
	vst1.16	{d8, d9}, [r3, :128]
	vshl.i64	q2, q14, #53
	vshr.u64	q0, q3, #11
	vld1.16	{d8, d9}, [r2, :128]
	vorr	d29, d4, d2
	vshl.i64	q3, q3, #53
	vorr	d28, d7, d1
	vadd.i64	q15, q15, q4
	vorr	d1, d6, d0
	vadd.i64	q15, q15, q14
	veor	d9, d31, d20
	vorr	d0, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	veor	d8, d30, d19
	add	r0, r6, #1264
	vldr.64	d4, [r7, #96]
	vadd.i64	q1, q12, q1
	vldr.64	d5, [r7]
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q1, q1, q0
	veor	q3, q2, q12
	add	r0, r12, #1264
	vrev64.32	q2, q4
	veor	d19, d3, d18
	veor	d18, d2, d21
	vadd.i64	q12, q13, q2
	vst1.16	{d6, d7}, [r0, :128]
	vadd.i64	q10, q15, q3
	veor	q14, q14, q12
	vrev64.32	q15, q9
	vadd.i64	q3, q11, q15
	vshr.u64	q13, q14, #25
	vshl.i64	q14, q14, #39
	veor	q11, q0, q3
	vorr	q14, q14, q13
	vadd.i64	q13, q10, q14
	vshr.u64	q9, q11, #25
	veor	q2, q2, q13
	vshl.i64	q11, q11, #39
	vtbl.8	d21, {d4, d5}, d16
	vtbl.8	d20, {d4, d5}, d17
	vorr	q4, q11, q9
	vld1.16	{d18, d19}, [r3, :128]
	vadd.i64	q11, q1, q9
	vadd.i64	q9, q12, q10
	vadd.i64	q12, q11, q4
	veor	q14, q14, q9
	veor	q15, q15, q12
	vtbl.8	d23, {d30, d31}, d16
	vshr.u64	q0, q14, #11
	vtbl.8	d22, {d30, d31}, d17
	ldr	r0, [sp, #176]          @ 4-byte Reload
	vshl.i64	q2, q14, #53
	vadd.i64	q1, q3, q11
	vorr	d31, d4, d0
	veor	q3, q4, q1
	vld1.16	{d8, d9}, [r0, :128]
	vadd.i64	q13, q13, q4
	vshr.u64	q14, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d29
	vadd.i64	q13, q13, q15
	veor	d9, d27, d22
	veor	d8, d26, d21
	vorr	d29, d6, d28
	vorr	d28, d5, d1
	vld1.16	{d0, d1}, [r12, :128]
	vadd.i64	q0, q12, q0
	vrev64.32	q2, q4
	ldr	r0, [sp, #168]          @ 4-byte Reload
	vadd.i64	q0, q0, q14
	vadd.i64	q12, q1, q2
	veor	d21, d1, d20
	veor	q1, q15, q12
	veor	d20, d0, d23
	vld1.16	{d22, d23}, [r0, :128]
	vadd.i64	q11, q13, q11
	vshr.u64	q15, q1, #25
	vshl.i64	q1, q1, #39
	vorr	q15, q1, q15
	vrev64.32	q1, q10
	vadd.i64	q11, q11, q15
	vadd.i64	q9, q9, q1
	veor	q13, q2, q11
	veor	q14, q14, q9
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	ldr	r0, [sp, #172]          @ 4-byte Reload
	vshr.u64	q13, q14, #25
	vshl.i64	q14, q14, #39
	vorr	q3, q14, q13
	vld1.16	{d26, d27}, [r0, :128]
	vadd.i64	q14, q0, q13
	vadd.i64	q13, q12, q10
	vadd.i64	q14, q14, q3
	veor	q15, q15, q13
	veor	q0, q1, q14
	vtbl.8	d25, {d0, d1}, d16
	vshr.u64	q1, q15, #11
	vtbl.8	d24, {d0, d1}, d17
	ldr	r0, [sp, #160]          @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q9, q9, q12
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d1, d4, d2
	veor	q3, q3, q9
	vadd.i64	q14, q14, q4
	ldr	r0, [sp, #164]          @ 4-byte Reload
	vshr.u64	q15, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d0, d7, d31
	vadd.i64	q14, q14, q0
	veor	d9, d29, d24
	veor	d8, d28, d21
	vorr	d31, d6, d30
	vorr	d30, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q11, q1
	vrev64.32	q2, q4
	ldr	r0, [sp, #152]          @ 4-byte Reload
	vadd.i64	q1, q1, q15
	vadd.i64	q11, q13, q2
	veor	d21, d3, d20
	veor	q0, q0, q11
	veor	d20, d2, d25
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q12, q14, q12
	vshr.u64	q13, q0, #25
	vshl.i64	q0, q0, #39
	vorr	q0, q0, q13
	vadd.i64	q13, q12, q0
	veor	q12, q2, q13
	vrev64.32	q2, q10
	vadd.i64	q14, q9, q2
	vtbl.8	d21, {d24, d25}, d16
	vtbl.8	d20, {d24, d25}, d17
	veor	q12, q15, q14
	ldr	r0, [sp, #156]          @ 4-byte Reload
	vshr.u64	q9, q12, #25
	vshl.i64	q12, q12, #39
	vorr	q3, q12, q9
	vld1.16	{d18, d19}, [r0, :128]
	vadd.i64	q12, q1, q9
	vadd.i64	q9, q11, q10
	vadd.i64	q12, q12, q3
	veor	q15, q0, q9
	veor	q1, q2, q12
	vtbl.8	d23, {d2, d3}, d16
	vshr.u64	q0, q15, #11
	vtbl.8	d22, {d2, d3}, d17
	ldr	r0, [sp, #140]          @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q1, q14, q11
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d31, d4, d0
	veor	q3, q3, q1
	vadd.i64	q13, q13, q4
	ldr	r0, [sp, #148]          @ 4-byte Reload
	vshr.u64	q14, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d29
	vadd.i64	q13, q13, q15
	veor	d9, d27, d22
	veor	d8, d26, d21
	vorr	d29, d6, d28
	vorr	d28, d5, d1
	vld1.16	{d0, d1}, [r0, :128]
	vadd.i64	q0, q12, q0
	vrev64.32	q2, q4
	ldr	r0, [sp, #136]          @ 4-byte Reload
	vadd.i64	q0, q0, q14
	vadd.i64	q12, q1, q2
	veor	d21, d1, d20
	veor	q1, q15, q12
	veor	d20, d0, d23
	vld1.16	{d22, d23}, [r0, :128]
	vadd.i64	q11, q13, q11
	vshr.u64	q15, q1, #25
	vshl.i64	q1, q1, #39
	vorr	q15, q1, q15
	vrev64.32	q1, q10
	vadd.i64	q11, q11, q15
	vadd.i64	q9, q9, q1
	veor	q13, q2, q11
	veor	q14, q14, q9
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	ldr	r0, [sp, #144]          @ 4-byte Reload
	vshr.u64	q13, q14, #25
	vshl.i64	q14, q14, #39
	vorr	q3, q14, q13
	vld1.16	{d26, d27}, [r0, :128]
	vadd.i64	q14, q0, q13
	vadd.i64	q13, q12, q10
	vadd.i64	q14, q14, q3
	veor	q15, q15, q13
	veor	q0, q1, q14
	vtbl.8	d25, {d0, d1}, d16
	vshr.u64	q1, q15, #11
	vtbl.8	d24, {d0, d1}, d17
	ldr	r0, [sp, #128]          @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q9, q9, q12
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d1, d4, d2
	veor	q3, q3, q9
	vadd.i64	q14, q14, q4
	ldr	r0, [sp, #132]          @ 4-byte Reload
	vshr.u64	q15, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d0, d7, d31
	vadd.i64	q14, q14, q0
	veor	d9, d29, d24
	veor	d8, d28, d21
	vorr	d31, d6, d30
	vorr	d30, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q11, q1
	vrev64.32	q2, q4
	ldr	r0, [sp, #120]          @ 4-byte Reload
	vadd.i64	q1, q1, q15
	vadd.i64	q11, q13, q2
	veor	d21, d3, d20
	veor	q0, q0, q11
	veor	d20, d2, d25
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q12, q14, q12
	vshr.u64	q13, q0, #25
	vshl.i64	q0, q0, #39
	vorr	q0, q0, q13
	vadd.i64	q13, q12, q0
	veor	q12, q2, q13
	vrev64.32	q2, q10
	vadd.i64	q14, q9, q2
	vtbl.8	d21, {d24, d25}, d16
	vtbl.8	d20, {d24, d25}, d17
	veor	q12, q15, q14
	ldr	r0, [sp, #124]          @ 4-byte Reload
	vshr.u64	q9, q12, #25
	vshl.i64	q12, q12, #39
	vorr	q3, q12, q9
	vld1.16	{d18, d19}, [r0, :128]
	vadd.i64	q12, q1, q9
	vadd.i64	q9, q11, q10
	vadd.i64	q12, q12, q3
	veor	q15, q0, q9
	veor	q1, q2, q12
	vtbl.8	d23, {d2, d3}, d16
	vshr.u64	q0, q15, #11
	vtbl.8	d22, {d2, d3}, d17
	ldr	r0, [sp, #108]          @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q1, q14, q11
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d31, d4, d0
	veor	q3, q3, q1
	vadd.i64	q13, q13, q4
	ldr	r0, [sp, #116]          @ 4-byte Reload
	vshr.u64	q14, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d29
	vadd.i64	q13, q13, q15
	veor	d9, d27, d22
	veor	d8, d26, d21
	vorr	d29, d6, d28
	vorr	d28, d5, d1
	vld1.16	{d0, d1}, [r0, :128]
	vadd.i64	q0, q12, q0
	vrev64.32	q2, q4
	ldr	r0, [sp, #104]          @ 4-byte Reload
	vadd.i64	q0, q0, q14
	vadd.i64	q12, q1, q2
	veor	d21, d1, d20
	veor	q1, q15, q12
	veor	d20, d0, d23
	vld1.16	{d22, d23}, [r0, :128]
	vadd.i64	q11, q13, q11
	vshr.u64	q15, q1, #25
	vshl.i64	q1, q1, #39
	vorr	q15, q1, q15
	vrev64.32	q1, q10
	vadd.i64	q11, q11, q15
	vadd.i64	q9, q9, q1
	veor	q13, q2, q11
	veor	q14, q14, q9
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	ldr	r0, [sp, #112]          @ 4-byte Reload
	vshr.u64	q13, q14, #25
	vshl.i64	q14, q14, #39
	vorr	q3, q14, q13
	vld1.16	{d26, d27}, [r0, :128]
	vadd.i64	q14, q0, q13
	vadd.i64	q13, q12, q10
	vadd.i64	q14, q14, q3
	veor	q15, q15, q13
	veor	q0, q1, q14
	vtbl.8	d25, {d0, d1}, d16
	vshr.u64	q1, q15, #11
	vtbl.8	d24, {d0, d1}, d17
	ldr	r0, [sp, #96]           @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q9, q9, q12
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d1, d4, d2
	veor	q3, q3, q9
	vadd.i64	q14, q14, q4
	ldr	r0, [sp, #100]          @ 4-byte Reload
	vshr.u64	q15, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d0, d7, d31
	vadd.i64	q14, q14, q0
	veor	d9, d29, d24
	veor	d8, d28, d21
	vorr	d31, d6, d30
	vorr	d30, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q11, q1
	vrev64.32	q2, q4
	ldr	r0, [sp, #88]           @ 4-byte Reload
	vadd.i64	q1, q1, q15
	vadd.i64	q11, q13, q2
	veor	d21, d3, d20
	veor	q0, q0, q11
	veor	d20, d2, d25
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q12, q14, q12
	vshr.u64	q13, q0, #25
	vshl.i64	q0, q0, #39
	vorr	q0, q0, q13
	vadd.i64	q13, q12, q0
	veor	q12, q2, q13
	vrev64.32	q2, q10
	vadd.i64	q14, q9, q2
	vtbl.8	d21, {d24, d25}, d16
	vtbl.8	d20, {d24, d25}, d17
	veor	q12, q15, q14
	ldr	r0, [sp, #92]           @ 4-byte Reload
	vshr.u64	q9, q12, #25
	vshl.i64	q12, q12, #39
	vorr	q3, q12, q9
	vld1.16	{d18, d19}, [r0, :128]
	vadd.i64	q12, q1, q9
	vadd.i64	q9, q11, q10
	vadd.i64	q12, q12, q3
	veor	q15, q0, q9
	veor	q1, q2, q12
	vtbl.8	d23, {d2, d3}, d16
	vshr.u64	q0, q15, #11
	vtbl.8	d22, {d2, d3}, d17
	ldr	r0, [sp, #76]           @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q1, q14, q11
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d31, d4, d0
	veor	q3, q3, q1
	vadd.i64	q13, q13, q4
	ldr	r0, [sp, #84]           @ 4-byte Reload
	vshr.u64	q14, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d29
	vadd.i64	q13, q13, q15
	veor	d9, d27, d22
	veor	d8, d26, d21
	vorr	d29, d6, d28
	vorr	d28, d5, d1
	vld1.16	{d0, d1}, [r0, :128]
	vadd.i64	q0, q12, q0
	vrev64.32	q2, q4
	ldr	r0, [sp, #72]           @ 4-byte Reload
	vadd.i64	q0, q0, q14
	vadd.i64	q12, q1, q2
	veor	d21, d1, d20
	veor	q1, q15, q12
	veor	d20, d0, d23
	vld1.16	{d22, d23}, [r0, :128]
	vadd.i64	q11, q13, q11
	vshr.u64	q15, q1, #25
	vshl.i64	q1, q1, #39
	vorr	q15, q1, q15
	vrev64.32	q1, q10
	vadd.i64	q11, q11, q15
	vadd.i64	q9, q9, q1
	veor	q13, q2, q11
	veor	q14, q14, q9
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	ldr	r0, [sp, #80]           @ 4-byte Reload
	vshr.u64	q13, q14, #25
	vshl.i64	q14, q14, #39
	vorr	q3, q14, q13
	vld1.16	{d26, d27}, [r0, :128]
	vadd.i64	q14, q0, q13
	vadd.i64	q13, q12, q10
	vadd.i64	q14, q14, q3
	veor	q15, q15, q13
	veor	q0, q1, q14
	vtbl.8	d25, {d0, d1}, d16
	vshr.u64	q1, q15, #11
	vtbl.8	d24, {d0, d1}, d17
	ldr	r0, [sp, #64]           @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q9, q9, q12
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d1, d4, d2
	veor	q3, q3, q9
	vadd.i64	q14, q14, q4
	ldr	r0, [sp, #68]           @ 4-byte Reload
	vshr.u64	q15, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d0, d7, d31
	vadd.i64	q14, q14, q0
	veor	d9, d29, d24
	veor	d8, d28, d21
	vorr	d31, d6, d30
	vorr	d30, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q11, q1
	vrev64.32	q2, q4
	ldr	r0, [sp, #56]           @ 4-byte Reload
	vadd.i64	q1, q1, q15
	vadd.i64	q11, q13, q2
	veor	d21, d3, d20
	veor	q0, q0, q11
	veor	d20, d2, d25
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q12, q14, q12
	vshr.u64	q13, q0, #25
	vshl.i64	q0, q0, #39
	vorr	q0, q0, q13
	vadd.i64	q13, q12, q0
	veor	q12, q2, q13
	vrev64.32	q2, q10
	vadd.i64	q14, q9, q2
	vtbl.8	d21, {d24, d25}, d16
	vtbl.8	d20, {d24, d25}, d17
	veor	q12, q15, q14
	ldr	r0, [sp, #60]           @ 4-byte Reload
	vshr.u64	q9, q12, #25
	vshl.i64	q12, q12, #39
	vorr	q3, q12, q9
	vld1.16	{d18, d19}, [r0, :128]
	vadd.i64	q12, q1, q9
	vadd.i64	q9, q11, q10
	vadd.i64	q12, q12, q3
	veor	q15, q0, q9
	veor	q1, q2, q12
	vtbl.8	d23, {d2, d3}, d16
	vshr.u64	q0, q15, #11
	vtbl.8	d22, {d2, d3}, d17
	ldr	r0, [sp, #44]           @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q1, q14, q11
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d31, d4, d0
	veor	q3, q3, q1
	vadd.i64	q13, q13, q4
	ldr	r0, [sp, #52]           @ 4-byte Reload
	vshr.u64	q14, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d29
	vadd.i64	q13, q13, q15
	veor	d9, d27, d22
	veor	d8, d26, d21
	vorr	d29, d6, d28
	vorr	d28, d5, d1
	vld1.16	{d0, d1}, [r0, :128]
	vadd.i64	q0, q12, q0
	vrev64.32	q2, q4
	ldr	r0, [sp, #40]           @ 4-byte Reload
	vadd.i64	q0, q0, q14
	vadd.i64	q12, q1, q2
	veor	d21, d1, d20
	veor	q1, q15, q12
	veor	d20, d0, d23
	vld1.16	{d22, d23}, [r0, :128]
	vadd.i64	q11, q13, q11
	vshr.u64	q15, q1, #25
	vshl.i64	q1, q1, #39
	vorr	q15, q1, q15
	vrev64.32	q1, q10
	vadd.i64	q11, q11, q15
	vadd.i64	q9, q9, q1
	veor	q13, q2, q11
	veor	q14, q14, q9
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	ldr	r0, [sp, #48]           @ 4-byte Reload
	vshr.u64	q13, q14, #25
	vshl.i64	q14, q14, #39
	vorr	q3, q14, q13
	vld1.16	{d26, d27}, [r0, :128]
	vadd.i64	q14, q0, q13
	vadd.i64	q13, q12, q10
	vadd.i64	q14, q14, q3
	veor	q15, q15, q13
	veor	q0, q1, q14
	vtbl.8	d25, {d0, d1}, d16
	vshr.u64	q1, q15, #11
	vtbl.8	d24, {d0, d1}, d17
	ldr	r0, [sp, #32]           @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q9, q9, q12
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d1, d4, d2
	veor	q3, q3, q9
	vadd.i64	q14, q14, q4
	ldr	r0, [sp, #36]           @ 4-byte Reload
	vshr.u64	q15, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d0, d7, d31
	vadd.i64	q14, q14, q0
	veor	d9, d29, d24
	veor	d8, d28, d21
	vorr	d31, d6, d30
	vorr	d30, d5, d3
	vld1.16	{d2, d3}, [r0, :128]
	vadd.i64	q1, q11, q1
	vrev64.32	q2, q4
	ldr	r0, [sp, #24]           @ 4-byte Reload
	vadd.i64	q1, q1, q15
	vadd.i64	q11, q13, q2
	veor	d21, d3, d20
	veor	q0, q0, q11
	veor	d20, d2, d25
	vld1.16	{d24, d25}, [r0, :128]
	vadd.i64	q12, q14, q12
	vshr.u64	q13, q0, #25
	vshl.i64	q0, q0, #39
	vorr	q0, q0, q13
	vadd.i64	q13, q12, q0
	veor	q12, q2, q13
	vrev64.32	q2, q10
	vadd.i64	q14, q9, q2
	vtbl.8	d21, {d24, d25}, d16
	vtbl.8	d20, {d24, d25}, d17
	veor	q12, q15, q14
	ldr	r0, [sp, #28]           @ 4-byte Reload
	vshr.u64	q9, q12, #25
	vshl.i64	q12, q12, #39
	vorr	q3, q12, q9
	vld1.16	{d18, d19}, [r0, :128]
	vadd.i64	q12, q1, q9
	vadd.i64	q9, q11, q10
	vadd.i64	q12, q12, q3
	veor	q15, q0, q9
	veor	q1, q2, q12
	vtbl.8	d23, {d2, d3}, d16
	vshr.u64	q0, q15, #11
	vtbl.8	d22, {d2, d3}, d17
	ldr	r0, [sp, #16]           @ 4-byte Reload
	vshl.i64	q2, q15, #53
	vadd.i64	q1, q14, q11
	vld1.16	{d8, d9}, [r0, :128]
	vorr	d31, d4, d0
	veor	q3, q3, q1
	vadd.i64	q13, q13, q4
	ldr	r0, [sp, #20]           @ 4-byte Reload
	vshr.u64	q14, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d29
	vadd.i64	q13, q13, q15
	veor	d9, d27, d22
	veor	d8, d26, d21
	vorr	d29, d6, d28
	vorr	d28, d5, d1
	vld1.16	{d0, d1}, [r0, :128]
	vadd.i64	q0, q12, q0
	vrev64.32	q2, q4
	ldr	r0, [sp, #12]           @ 4-byte Reload
	vadd.i64	q0, q0, q14
	vadd.i64	q12, q1, q2
	veor	d21, d1, d20
	veor	q1, q15, q12
	veor	d20, d0, d23
	vld1.16	{d22, d23}, [r0, :128]
	vadd.i64	q11, q13, q11
	vshr.u64	q15, q1, #25
	vshl.i64	q1, q1, #39
	vorr	q15, q1, q15
	vadd.i64	q11, q11, q15
	veor	q13, q2, q11
	vrev64.32	q2, q10
	vadd.i64	q1, q9, q2
	vtbl.8	d21, {d26, d27}, d16
	vtbl.8	d20, {d26, d27}, d17
	veor	q13, q14, q1
	vshr.u64	q9, q13, #25
	vshl.i64	q13, q13, #39
	vorr	q3, q13, q9
	vld1.16	{d18, d19}, [r5, :128]
	vadd.i64	q9, q0, q9
	vadd.i64	q13, q12, q10
	vadd.i64	q14, q9, q3
	veor	q12, q15, q13
	veor	q0, q2, q14
	vtbl.8	d19, {d0, d1}, d16
	vshl.i64	q2, q12, #53
	vtbl.8	d18, {d0, d1}, d17
	vshr.u64	q0, q12, #11
	vorr	d31, d4, d0
	vadd.i64	q12, q1, q9
	vld1.16	{d8, d9}, [r8, :128]
	vadd.i64	q14, q14, q4
	veor	q3, q3, q12
	ldr	r0, [sp, #8]            @ 4-byte Reload
	vshr.u64	q1, q3, #11
	vshl.i64	q3, q3, #53
	vorr	d30, d7, d3
	vadd.i64	q14, q14, q15
	veor	d9, d29, d18
	veor	d8, d28, d21
	vorr	d3, d6, d2
	vorr	d2, d5, d1
	vld1.16	{d0, d1}, [r0, :128]
	vadd.i64	q2, q11, q0
	vrev64.32	q0, q4
	vadd.i64	q11, q13, q0
	veor	q15, q15, q11
	vshr.u64	q13, q15, #25
	vshl.i64	q15, q15, #39
	vorr	q13, q15, q13
	vadd.i64	q15, q2, q1
	veor	d5, d31, d20
	veor	d4, d30, d19
	vld1.16	{d18, d19}, [r9, :128]
	vadd.i64	q9, q14, q9
	vrev64.32	q2, q2
	vadd.i64	q10, q9, q13
	vadd.i64	q12, q12, q2
	veor	q0, q0, q10
	veor	q9, q1, q12
	vshr.u64	q14, q9, #25
	vshl.i64	q9, q9, #39
	vorr	q14, q9, q14
	vld1.16	{d18, d19}, [lr, :128]
	vadd.i64	q15, q15, q9
	vtbl.8	d19, {d0, d1}, d16
	vadd.i64	q15, q15, q14
	vtbl.8	d18, {d0, d1}, d17
	veor	q1, q2, q15
	vadd.i64	q0, q11, q9
	vtbl.8	d23, {d2, d3}, d16
	vtbl.8	d22, {d2, d3}, d17
	veor	q8, q15, q0
	veor	q13, q13, q0
	vadd.i64	q15, q12, q11
	vld1.16	{d24, d25}, [r1, :128]
	veor	q12, q12, q8
	vst1.16	{d24, d25}, [r1, :128]
	veor	q14, q14, q15
	veor	q10, q10, q15
	ldr	r0, [sp, #180]          @ 4-byte Reload
	vshr.u64	q8, q13, #11
	vshr.u64	q12, q14, #11
	vshl.i64	q14, q14, #53
	vld1.16	{d30, d31}, [r0, :128]
	vshl.i64	q13, q13, #53
	veor	q10, q15, q10
	vst1.16	{d20, d21}, [r0, :128]
	vorr	d1, d28, d24
	vorr	d21, d18, d18
	vorr	d0, d27, d17
	ldr	r0, [sp, #184]          @ 4-byte Reload
	vorr	d20, d23, d23
	vorr	d17, d26, d16
	veor	q10, q0, q10
	vld1.16	{d30, d31}, [r0, :128]
	vorr	d16, d29, d25
	veor	q10, q15, q10
	vst1.16	{d20, d21}, [r0, :128]
	vorr	d21, d22, d22
	vorr	d20, d19, d19
	ldr	r0, [sp, #188]          @ 4-byte Reload
	veor	q8, q8, q10
	vld1.16	{d18, d19}, [r0, :128]
	veor	q8, q9, q8
	vst1.16	{d16, d17}, [r0, :128]
	sub	sp, r11, #60
	vpop	{d8, d9, d10, d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
@ BB#11:
.Ltmp6:
	.size	round512, .Ltmp6-round512

	.globl	Blake_Compress
	.align	4
	.type	Blake_Compress,%function
Blake_Compress:                         @ @Blake_Compress
@ BB#0:
	push	{r4, r5, r11, lr}
	add	r11, sp, #8
	sub	sp, sp, #16
	sub	r2, r11, #24
	b	.LBB7_2
.LBB7_1:                                @ %.lr.ph
                                        @   in Loop: Header=BB7_2 Depth=1
	sub	r2, sp, #8
	mov	sp, r2
.LBB7_2:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	tst	r2, #15
	bne	.LBB7_1
@ BB#3:                                 @ %._crit_edge
	ldr	r2, [r0]
	cmp	r2, #256
	bls	.LBB7_5
@ BB#4:
	add	r12, r0, #16
	mov	r0, r1
	ldm	r12, {r2, r3, r12}
	mov	r1, r12
	bl	round512
.LBB7_5:
	sub	sp, r11, #8
	pop	{r4, r5, r11, pc}
.Ltmp7:
	.size	Blake_Compress, .Ltmp7-Blake_Compress

	.globl	blake512_init
	.align	4
	.type	blake512_init,%function
blake512_init:                          @ @blake512_init
@ BB#0:
	push	{r11, lr}
	mvn	r1, #67
	add	r2, r0, #68
	sub	r1, r1, r0
	and	r3, r1, #15
	add	r3, r2, r3
	str	r3, [r0, #64]
	mov	r3, #8
	bfi	r1, r3, #4, #28
	movw	r3, #51464
	movt	r3, #62396
	add	r12, r2, r1
	str	r12, [r0]
	str	r3, [r2, r1]
	movw	r1, #58983
	movt	r1, #27145
	str	r1, [r12, #4]
	movw	r3, #44677
	ldr	r1, [r0]
	movw	r2, #42811
	movt	r3, #47975
	movt	r2, #33994
	strd	r2, r3, [r1, #8]
	movw	r3, #62322
	ldr	r1, [r0]
	movw	r2, #63531
	movt	r3, #15470
	movt	r2, #65172
	strd	r2, r3, [r1, #16]
	movw	r3, #62778
	ldr	r1, [r0]
	movw	r2, #14065
	movt	r3, #42319
	movt	r2, #24349
	strd	r2, r3, [r1, #24]
	movw	r3, #21119
	ldr	r1, [r0]
	movw	r2, #33489
	movt	r3, #20750
	movt	r2, #44518
	strd	r2, r3, [r1, #32]
	movw	r3, #26764
	ldr	r1, [r0]
	movw	r2, #27679
	movt	r3, #39685
	movt	r2, #11070
	strd	r2, r3, [r1, #40]
	movw	r3, #55723
	ldr	r1, [r0]
	movw	r2, #48491
	movt	r3, #8067
	movt	r2, #64321
	strd	r2, r3, [r1, #48]
	movw	r3, #52505
	ldr	r1, [r0]
	movw	r2, #8569
	movt	r3, #23520
	movt	r2, #4990
	add	r0, r0, #8
	strd	r2, r3, [r1, #56]
	mov	r1, #56
	mov	r2, #0
	bl	__aeabi_memset
	pop	{r11, pc}
.Ltmp8:
	.size	blake512_init, .Ltmp8-blake512_init

	.globl	blake512_update
	.align	4
	.type	blake512_update,%function
blake512_update:                        @ @blake512_update
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #4
	mov	r10, r0
	mov	r7, r3
	ldr	r0, [r10, #56]
	mov	r11, #0
	mov	r5, r2
	mov	r6, r1
	cmp	r11, r0, asr #3
	beq	.LBB9_3
@ BB#1:
	mov	r1, #128
	sub	r8, r1, r0, asr #3
	mov	r9, #0
	asr	r2, r0, #3
	cmp	r9, r8, asr #31
	mov	r0, #1
	ubfx	r1, r5, #3, #7
	asreq	r0, r8, #31
	cmp	r1, r8
	mov	r1, #0
	movlo	r1, #1
	cmp	r9, r8, asr #31
	moveq	r0, r1
	cmp	r0, #0
	bne	.LBB9_4
@ BB#2:
	ldr	r0, [r10, #64]
	mov	r1, r6
	add	r6, r6, r8
	add	r0, r0, r2
	mov	r2, r8
	bl	__aeabi_memcpy
	ldr	r1, [r10, #40]
	ldr	r0, [r10, #44]
	adds	r2, r1, #1024
	str	r2, [r10, #40]
	adc	r4, r0, #0
	str	r4, [r10, #44]
	ldr	r3, [r10, #60]
	ldr	r1, [r10]
	cmp	r3, #0
	mov	r3, r9
	ldr	r0, [r10, #64]
	ldreq	r3, [r10, #48]
	moveq	r9, r2
	mov	r2, r9
	addeq	r3, r3, r4
	bl	round512
	subs	r5, r5, r8, lsl #3
	lsl	r0, r8, #3
	sbc	r7, r7, r0, asr #31
.LBB9_3:
	mov	r2, #0
.LBB9_4:                                @ %.preheader
	cmp	r5, #1024
	str	r2, [sp]                @ 4-byte Spill
	movlo	r11, #1
	cmp	r7, #0
	movne	r11, #0
	cmp	r11, #0
	bne	.LBB9_7
@ BB#5:                                 @ %.lr.ph
	add	r8, r10, #48
	add	r9, r10, #40
.LBB9_6:                                @ =>This Inner Loop Header: Depth=1
	ldrd	r0, r1, [r9]
	mov	r3, #0
	adds	r0, r0, #1024
	adc	r4, r1, #0
	stm	r9, {r0, r4}
	ldr	r2, [r10, #60]
	ldr	r1, [r10]
	cmp	r2, #0
	mov	r2, #0
	ldreq	r2, [r8]
	addeq	r3, r2, r4
	moveq	r2, r0
	mov	r0, r6
	add	r6, r6, #128
	bl	round512
	subs	r5, r5, #1024
	mov	r0, #0
	sbc	r7, r7, #0
	cmp	r5, #1024
	movhs	r0, #1
	cmp	r7, #0
	mov	r1, r7
	movne	r1, #1
	moveq	r1, r0
	cmp	r1, #0
	bne	.LBB9_6
.LBB9_7:                                @ %._crit_edge
	orrs	r0, r5, r7
	mov	r0, #0
	beq	.LBB9_9
@ BB#8:
	ldr	r0, [r10, #64]
	mov	r1, r6
	ldr	r4, [sp]                @ 4-byte Reload
	ubfx	r2, r5, #3, #7
	add	r0, r0, r4
	bl	__aeabi_memcpy
	add	r0, r5, r4, lsl #3
.LBB9_9:
	str	r0, [r10, #56]
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp9:
	.size	blake512_update, .Ltmp9-blake512_update

	.globl	blake512_final
	.align	4
	.type	blake512_final,%function
blake512_final:                         @ @blake512_final
@ BB#0:
	push	{r4, r5, r6, r7, r11, lr}
	sub	sp, sp, #24
	mov	r5, r0
	mov	r0, #1
	strb	r0, [sp, #7]
	mvn	r0, #126
	strb	r0, [sp, #6]
	mov	r7, r5
	ldr	lr, [r5, #44]
	mov	r4, r1
	ldr	r2, [r5, #48]
	ldr	r3, [r5, #52]
	ldr	r0, [r5, #56]
	ldr	r6, [r7, #40]!
	adds	r12, r6, r0
	adc	r1, lr, r0, asr #31
	cmp	r12, r6
	mov	r6, #0
	mov	r0, #0
	movlo	r6, #1
	cmp	r1, lr
	movlo	r0, #1
	moveq	r0, r6
	cmp	r0, #0
	beq	.LBB10_2
@ BB#1:
	adds	r2, r2, #1
	adc	r3, r3, #0
.LBB10_2:
	lsr	r0, r3, #24
	strb	r0, [sp, #8]
	lsr	r0, r3, #16
	strb	r0, [sp, #9]
	lsr	r0, r3, #8
	strb	r0, [sp, #10]
	lsr	r0, r2, #24
	strb	r3, [sp, #11]
	strb	r0, [sp, #12]
	lsr	r0, r2, #16
	strb	r0, [sp, #13]
	lsr	r0, r2, #8
	strb	r0, [sp, #14]
	lsr	r0, r1, #24
	strb	r2, [sp, #15]
	strb	r0, [sp, #16]
	lsr	r0, r1, #16
	strb	r0, [sp, #17]
	lsr	r0, r1, #8
	strb	r0, [sp, #18]
	lsr	r0, r12, #24
	strb	r1, [sp, #19]
	strb	r0, [sp, #20]
	lsr	r0, r12, #16
	strb	r0, [sp, #21]
	lsr	r0, r12, #8
	strb	r0, [sp, #22]
	strb	r12, [sp, #23]
	ldr	r0, [r5, #56]
	cmp	r0, #888
	bne	.LBB10_4
@ BB#3:
	ldrd	r0, r1, [r7]
	mov	r2, #8
	mov	r3, #0
	subs	r0, r0, #8
	sbc	r1, r1, #0
	strd	r0, r1, [r7]
	add	r1, sp, #6
	mov	r0, r5
	bl	blake512_update
	b	.LBB10_8
.LBB10_4:
	cmp	r0, #888
	bge	.LBB10_6
@ BB#5:
	cmp	r0, #0
	moveq	r0, #1
	streq	r0, [r5, #60]
	ldrd	r0, r1, [r7]
	ldr	r2, [r5, #56]
	rsb	r2, r2, #888
	subs	r0, r0, r2
	sbc	r1, r1, r2, asr #31
	strd	r0, r1, [r7]
	movw	r1, :lower16:padding
	ldr	r0, [r5, #56]
	movt	r1, :upper16:padding
	rsb	r2, r0, #888
	mov	r0, r5
	asr	r3, r2, #31
	bl	blake512_update
	b	.LBB10_7
.LBB10_6:
	ldr	r6, [r7]
	rsb	r2, r0, #1024
	ldr	r1, [r7, #4]
	subs	r0, r6, r2
	movw	r6, :lower16:padding
	movt	r6, :upper16:padding
	sbc	r1, r1, r2, asr #31
	strd	r0, r1, [r7]
	mov	r1, r6
	ldr	r0, [r5, #56]
	rsb	r2, r0, #1024
	mov	r0, r5
	asr	r3, r2, #31
	bl	blake512_update
	ldrd	r0, r1, [r7]
	mov	r2, #888
	mov	r3, #0
	subs	r0, r0, #888
	sbc	r1, r1, #0
	strd	r0, r1, [r7]
	add	r1, r6, #1
	mov	r0, r5
	bl	blake512_update
	mov	r0, #1
	str	r0, [r5, #60]
.LBB10_7:
	add	r1, sp, #7
	mov	r0, r5
	mov	r2, #8
	mov	r3, #0
	bl	blake512_update
	ldrd	r0, r1, [r7]
	subs	r0, r0, #8
	sbc	r1, r1, #0
	strd	r0, r1, [r7]
.LBB10_8:
	ldrd	r0, r1, [r7]
	mov	r2, #128
	mov	r3, #0
	subs	r0, r0, #128
	sbc	r1, r1, #0
	strd	r0, r1, [r7]
	add	r1, sp, #8
	mov	r0, r5
	bl	blake512_update
	ldr	r0, [r5]
	ldrb	r0, [r0, #7]
	strb	r0, [r4]
	ldr	r0, [r5]
	ldrb	r0, [r0, #6]
	strb	r0, [r4, #1]
	ldr	r0, [r5]
	ldrb	r0, [r0, #5]
	strb	r0, [r4, #2]
	ldr	r0, [r5]
	ldrb	r0, [r0, #4]
	strb	r0, [r4, #3]
	ldr	r0, [r5]
	ldrb	r0, [r0, #3]
	strb	r0, [r4, #4]
	ldr	r0, [r5]
	ldrh	r0, [r0, #2]
	strb	r0, [r4, #5]
	ldr	r0, [r5]
	ldr	r0, [r0]
	lsr	r0, r0, #8
	strb	r0, [r4, #6]
	ldr	r0, [r5]
	ldrb	r0, [r0]
	strb	r0, [r4, #7]
	ldr	r0, [r5]
	ldrb	r0, [r0, #15]
	strb	r0, [r4, #8]
	ldr	r0, [r5]
	ldrb	r0, [r0, #14]
	strb	r0, [r4, #9]
	ldr	r0, [r5]
	ldrb	r0, [r0, #13]
	strb	r0, [r4, #10]
	ldr	r0, [r5]
	ldrb	r0, [r0, #12]
	strb	r0, [r4, #11]
	ldr	r0, [r5]
	ldrb	r0, [r0, #11]
	strb	r0, [r4, #12]
	ldr	r0, [r5]
	ldrh	r0, [r0, #10]
	strb	r0, [r4, #13]
	ldr	r0, [r5]
	ldr	r0, [r0, #8]
	lsr	r0, r0, #8
	strb	r0, [r4, #14]
	ldr	r0, [r5]
	ldrb	r0, [r0, #8]
	strb	r0, [r4, #15]
	ldr	r0, [r5]
	ldrb	r0, [r0, #23]
	strb	r0, [r4, #16]
	ldr	r0, [r5]
	ldrb	r0, [r0, #22]
	strb	r0, [r4, #17]
	ldr	r0, [r5]
	ldrb	r0, [r0, #21]
	strb	r0, [r4, #18]
	ldr	r0, [r5]
	ldrb	r0, [r0, #20]
	strb	r0, [r4, #19]
	ldr	r0, [r5]
	ldrb	r0, [r0, #19]
	strb	r0, [r4, #20]
	ldr	r0, [r5]
	ldrh	r0, [r0, #18]
	strb	r0, [r4, #21]
	ldr	r0, [r5]
	ldr	r0, [r0, #16]
	lsr	r0, r0, #8
	strb	r0, [r4, #22]
	ldr	r0, [r5]
	ldrb	r0, [r0, #16]
	strb	r0, [r4, #23]
	ldr	r0, [r5]
	ldrb	r0, [r0, #31]
	strb	r0, [r4, #24]
	ldr	r0, [r5]
	ldrb	r0, [r0, #30]
	strb	r0, [r4, #25]
	ldr	r0, [r5]
	ldrb	r0, [r0, #29]
	strb	r0, [r4, #26]
	ldr	r0, [r5]
	ldrb	r0, [r0, #28]
	strb	r0, [r4, #27]
	ldr	r0, [r5]
	ldrb	r0, [r0, #27]
	strb	r0, [r4, #28]
	ldr	r0, [r5]
	ldrh	r0, [r0, #26]
	strb	r0, [r4, #29]
	ldr	r0, [r5]
	ldr	r0, [r0, #24]
	lsr	r0, r0, #8
	strb	r0, [r4, #30]
	ldr	r0, [r5]
	ldrb	r0, [r0, #24]
	strb	r0, [r4, #31]
	ldr	r0, [r5]
	ldrb	r0, [r0, #39]
	strb	r0, [r4, #32]
	ldr	r0, [r5]
	ldrb	r0, [r0, #38]
	strb	r0, [r4, #33]
	ldr	r0, [r5]
	ldrb	r0, [r0, #37]
	strb	r0, [r4, #34]
	ldr	r0, [r5]
	ldrb	r0, [r0, #36]
	strb	r0, [r4, #35]
	ldr	r0, [r5]
	ldrb	r0, [r0, #35]
	strb	r0, [r4, #36]
	ldr	r0, [r5]
	ldrh	r0, [r0, #34]
	strb	r0, [r4, #37]
	ldr	r0, [r5]
	ldr	r0, [r0, #32]
	lsr	r0, r0, #8
	strb	r0, [r4, #38]
	ldr	r0, [r5]
	ldrb	r0, [r0, #32]
	strb	r0, [r4, #39]
	ldr	r0, [r5]
	ldrb	r0, [r0, #47]
	strb	r0, [r4, #40]
	ldr	r0, [r5]
	ldrb	r0, [r0, #46]
	strb	r0, [r4, #41]
	ldr	r0, [r5]
	ldrb	r0, [r0, #45]
	strb	r0, [r4, #42]
	ldr	r0, [r5]
	ldrb	r0, [r0, #44]
	strb	r0, [r4, #43]
	ldr	r0, [r5]
	ldrb	r0, [r0, #43]
	strb	r0, [r4, #44]
	ldr	r0, [r5]
	ldrh	r0, [r0, #42]
	strb	r0, [r4, #45]
	ldr	r0, [r5]
	ldr	r0, [r0, #40]
	lsr	r0, r0, #8
	strb	r0, [r4, #46]
	ldr	r0, [r5]
	ldrb	r0, [r0, #40]
	strb	r0, [r4, #47]
	ldr	r0, [r5]
	ldrb	r0, [r0, #55]
	strb	r0, [r4, #48]
	ldr	r0, [r5]
	ldrb	r0, [r0, #54]
	strb	r0, [r4, #49]
	ldr	r0, [r5]
	ldrb	r0, [r0, #53]
	strb	r0, [r4, #50]
	ldr	r0, [r5]
	ldrb	r0, [r0, #52]
	strb	r0, [r4, #51]
	ldr	r0, [r5]
	ldrb	r0, [r0, #51]
	strb	r0, [r4, #52]
	ldr	r0, [r5]
	ldrh	r0, [r0, #50]
	strb	r0, [r4, #53]
	ldr	r0, [r5]
	ldr	r0, [r0, #48]
	lsr	r0, r0, #8
	strb	r0, [r4, #54]
	ldr	r0, [r5]
	ldrb	r0, [r0, #48]
	strb	r0, [r4, #55]
	ldr	r0, [r5]
	ldrb	r0, [r0, #63]
	strb	r0, [r4, #56]
	ldr	r0, [r5]
	ldrb	r0, [r0, #62]
	strb	r0, [r4, #57]
	ldr	r0, [r5]
	ldrb	r0, [r0, #61]
	strb	r0, [r4, #58]
	ldr	r0, [r5]
	ldrb	r0, [r0, #60]
	strb	r0, [r4, #59]
	ldr	r0, [r5]
	ldrb	r0, [r0, #59]
	strb	r0, [r4, #60]
	ldr	r0, [r5]
	ldrh	r0, [r0, #58]
	strb	r0, [r4, #61]
	ldr	r0, [r5]
	ldr	r0, [r0, #56]
	lsr	r0, r0, #8
	strb	r0, [r4, #62]
	ldr	r0, [r5]
	ldrb	r0, [r0, #56]
	strb	r0, [r4, #63]
	add	sp, sp, #24
	pop	{r4, r5, r6, r7, r11, pc}
.Ltmp10:
	.size	blake512_final, .Ltmp10-blake512_final

	.globl	crypto_hash_blake512_vect128_neon
	.align	4
	.type	crypto_hash_blake512_vect128_neon,%function
crypto_hash_blake512_vect128_neon:      @ @crypto_hash_blake512_vect128_neon
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #280
	mov	r5, sp
	mov	r8, r0
	mov	r0, r5
	mov	r4, r3
	mov	r7, r2
	mov	r6, r1
	bl	blake512_init
	lsl	r0, r4, #3
	orr	r3, r0, r7, lsr #29
	lsl	r2, r7, #3
	mov	r0, r5
	mov	r1, r6
	bl	blake512_update
	mov	r0, r5
	mov	r1, r8
	bl	blake512_final
	mov	r0, #0
	add	sp, sp, #280
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.Ltmp11:
	.size	crypto_hash_blake512_vect128_neon, .Ltmp11-crypto_hash_blake512_vect128_neon

	.type	round512.SConst,%object @ @round512.SConst
	.section	.rodata,"a",%progbits
	.align	4
round512.SConst:
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.size	round512.SConst, 1280

	.type	cst,%object             @ @cst
	.globl	cst
	.align	3
cst:
	.long	2242054355              @ 0x243f6a8885a308d3
	.long	608135816
	.long	57701188                @ 0x13198a2e03707344
	.long	320440878
	.long	698298832               @ 0xa4093822299f31d0
	.long	2752067618
	.long	3964562569              @ 0x82efa98ec4e6c89
	.long	137296536
	.long	953160567               @ 0x452821e638d01377
	.long	1160258022
	.long	887688300               @ 0xbe5466cf34e90c6c
	.long	3193202383
	.long	3380367581              @ 0xc0ac29b7c97c50dd
	.long	3232508343
	.long	3041331479              @ 0x3f84d5b5b5470917
	.long	1065670069
	.long	2306472731              @ 0x9216d5d98979fb1b
	.long	2450970073
	.long	2564797868              @ 0xd1310ba698dfb5ac
	.long	3509652390
	.long	3491422135              @ 0x2ffd72dbd01adfb7
	.long	805139163
	.long	1780907670              @ 0xb8e1afed6a267e96
	.long	3101798381
	.long	4046225305              @ 0xba7c9045f12c7f99
	.long	3128725573
	.long	3012652279              @ 0x24a19947b3916cf7
	.long	614570311
	.long	2240740374              @ 0x801f2e2858efc16
	.long	134345442
	.long	1901547113              @ 0x636920d871574e69
	.long	1667834072
	.size	cst, 128

	.type	padding,%object         @ @padding
padding:
	.asciz	 "\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	padding, 129


