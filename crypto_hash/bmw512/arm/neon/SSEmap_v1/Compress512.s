	.cpu arm9tdmi
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.file	"Compress512.c"
	.text
	.align	2
	.global	Compress512
	.type	Compress512, %function
Compress512:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1504
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	fstmfdd	sp!, {d8, d9, d10, d11, d12, d13, d14, d15}
	sub	sp, sp, #1504
	mov	fp, r0
	str	r1, [sp, #108]
	add	r3, r2, #16
	str	r3, [sp, #112]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1248
	str	r3, [sp, #100]
	vst1.64	{d16-d17}, [r3]
	add	r3, r2, #32
	str	r3, [sp, #116]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1264
	str	r3, [sp, #96]
	vst1.64	{d16-d17}, [r3]
	add	r3, r2, #48
	str	r3, [sp, #120]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1280
	str	r3, [sp, #92]
	vst1.64	{d16-d17}, [r3]
	add	r3, r2, #64
	str	r3, [sp, #124]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1296
	str	r3, [sp, #88]
	vst1.64	{d16-d17}, [r3]
	add	r3, r2, #80
	str	r3, [sp, #128]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1312
	str	r3, [sp, #84]
	vst1.64	{d16-d17}, [r3]
	add	r3, r2, #96
	str	r3, [sp, #132]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1328
	str	r3, [sp, #80]
	vst1.64	{d16-d17}, [r3]
	add	r3, r2, #112
	str	r3, [sp, #136]
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #1344
	str	r3, [sp, #76]
	vst1.64	{d16-d17}, [r3]
	add	r2, r2, #128
	str	r2, [sp, #140]
	vld1.64	{d16-d17}, [r2]
	add	r3, sp, #1360
	str	r3, [sp, #72]
	vst1.64	{d16-d17}, [r3]
	add	r3, sp, #1248
	str	r3, [sp, #68]
	add	r3, sp, #1376
	str	r3, [sp, #64]
	add	r3, sp, #864
	str	r3, [sp, #60]
	add	r3, sp, #1264
	str	r3, [sp, #56]
	add	r3, sp, #1392
	str	r3, [sp, #52]
	add	r3, sp, #880
	str	r3, [sp, #48]
	add	r3, sp, #872
	str	r3, [sp, #44]
	ldr	r9, .L5
.L2:
	add	r3, sp, #1248
	str	r3, [sp, #856]
	ldr	r3, [sp, #68]
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #144]
	vstr	d7, [sp, #152]
	vld1.64	{d6-d7}, [fp]
	vstr	d6, [sp, #160]
	vstr	d7, [sp, #168]
	vldr	d12, [sp, #144]
	vldr	d13, [sp, #152]
	veor	q8, q6, q3
	ldr	r3, [sp, #64]
	vst1.64	{d16-d17}, [r3]
	vshr.u64	q10, q3, #63
	vshl.i64	q8, q3, #1
	vorr	q10, q10, q8
	vmov	d16, d20
	ldr	r3, [sp, #60]
	vst1.64	{d16}, [r3]
	add	r3, sp, #1264
	str	r3, [sp, #860]
	ldr	r3, [sp, #56]
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #176]
	vstr	d7, [sp, #184]
	add	r3, fp, #16
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #192]
	vstr	d7, [sp, #200]
	vldr	d12, [sp, #176]
	vldr	d13, [sp, #184]
	veor	q8, q6, q3
	ldr	r3, [sp, #52]
	vst1.64	{d16-d17}, [r3]
	vshr.u64	q9, q3, #61
	vshl.i64	q8, q3, #3
	vorr	q9, q9, q8
	vmov	d16, d18
	ldr	r3, [sp, #48]
	vst1.64	{d16}, [r3]
	vmov	d17, d21
	vmov	d16, d19
	vswp	d17, d16
	vshr.u64	q9, q8, #63
	vshl.i64	q8, q8, #1
	vorr	q9, q9, q8
	vmov	d16, d18
	ldr	r3, [sp, #44]
	vst1.64	{d16}, [r3]
	vmov	d16, d19
	add	r3, sp, #888
	vst1.64	{d16}, [r3]
	add	r3, sp, #1280
	str	r3, [sp, #40]
	vld1.64	{d26-d27}, [r3]
	add	r3, fp, #32
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #208]
	vstr	d7, [sp, #216]
	veor	q8, q13, q3
	add	r4, sp, #1408
	vst1.64	{d16-d17}, [r4]
	vshr.u64	q10, q3, #59
	vshl.i64	q8, q3, #5
	vorr	q10, q10, q8
	vmov	d16, d20
	add	r3, sp, #896
	vst1.64	{d16}, [r3]
	add	r3, sp, #1296
	str	r3, [sp, #36]
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #224]
	vstr	d7, [sp, #232]
	add	r3, fp, #48
	vld1.64	{d12-d13}, [r3]
	vstr	d12, [sp, #240]
	vstr	d13, [sp, #248]
	veor	q8, q3, q6
	add	r5, sp, #1424
	vst1.64	{d16-d17}, [r5]
	vshr.u64	q9, q6, #57
	vshl.i64	q8, q6, #7
	vorr	q9, q9, q8
	vmov	d16, d18
	add	r3, sp, #912
	vst1.64	{d16}, [r3]
	vmov	d17, d21
	vmov	d16, d19
	vswp	d17, d16
	vshr.u64	q9, q8, #63
	vshl.i64	q8, q8, #1
	vorr	q9, q9, q8
	vmov	d16, d18
	add	r3, sp, #904
	vst1.64	{d16}, [r3]
	vmov	d16, d19
	add	r3, sp, #920
	vst1.64	{d16}, [r3]
	add	r3, sp, #1312
	str	r3, [sp, #32]
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #256]
	vstr	d7, [sp, #264]
	add	r3, fp, #64
	vld1.64	{d12-d13}, [r3]
	vstr	d12, [sp, #272]
	vstr	d13, [sp, #280]
	veor	q8, q3, q6
	add	r0, sp, #1440
	vst1.64	{d16-d17}, [r0]
	vshr.u64	q10, q6, #55
	vshl.i64	q8, q6, #9
	vorr	q10, q10, q8
	vmov	d16, d20
	add	r3, sp, #928
	vst1.64	{d16}, [r3]
	add	r3, sp, #1328
	str	r3, [sp, #28]
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #288]
	vstr	d7, [sp, #296]
	add	r3, fp, #80
	vld1.64	{d12-d13}, [r3]
	vstr	d12, [sp, #304]
	vstr	d13, [sp, #312]
	veor	q8, q3, q6
	add	r1, sp, #1456
	vst1.64	{d16-d17}, [r1]
	vshr.u64	q9, q6, #53
	vshl.i64	q8, q6, #11
	vorr	q9, q9, q8
	vmov	d16, d18
	add	r3, sp, #944
	vst1.64	{d16}, [r3]
	vmov	d17, d21
	vmov	d16, d19
	vswp	d17, d16
	vshr.u64	q9, q8, #63
	vshl.i64	q8, q8, #1
	vorr	q9, q9, q8
	vmov	d16, d18
	add	r3, sp, #936
	vst1.64	{d16}, [r3]
	vmov	d16, d19
	add	r3, sp, #952
	vst1.64	{d16}, [r3]
	add	r3, sp, #1344
	str	r3, [sp, #24]
	vld1.64	{d10-d11}, [r3]
	add	r3, fp, #96
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #320]
	vstr	d7, [sp, #328]
	veor	q8, q5, q3
	add	ip, sp, #1472
	vst1.64	{d16-d17}, [ip]
	vshr.u64	q10, q3, #51
	vshl.i64	q8, q3, #13
	vorr	q10, q10, q8
	vmov	d16, d20
	add	r3, sp, #960
	vst1.64	{d16}, [r3]
	add	r3, sp, #1360
	str	r3, [sp, #20]
	vld1.64	{d6-d7}, [r3]
	vstr	d6, [sp, #336]
	vstr	d7, [sp, #344]
	add	r3, fp, #112
	vld1.64	{d12-d13}, [r3]
	vstr	d12, [sp, #352]
	vstr	d13, [sp, #360]
	veor	q8, q3, q6
	add	r2, sp, #1488
	vst1.64	{d16-d17}, [r2]
	vshr.u64	q9, q6, #49
	vshl.i64	q8, q6, #15
	vorr	q9, q9, q8
	vmov	d16, d18
	add	r3, sp, #976
	vst1.64	{d16}, [r3]
	vmov	d17, d21
	vmov	d16, d19
	vswp	d17, d16
	vshr.u64	q9, q8, #63
	vshl.i64	q8, q8, #1
	vorr	q9, q9, q8
	vmov	d16, d18
	add	r3, sp, #968
	vst1.64	{d16}, [r3]
	vmov	d16, d19
	add	r3, sp, #984
	vst1.64	{d16}, [r3]
	add	r3, sp, #1408
	add	r3, r3, #8
	vld1.64	{d16-d17}, [r3]
	vstr	d16, [sp, #368]
	vstr	d17, [sp, #376]
	add	r3, sp, #1424
	add	r3, r3, #8
	vld1.64	{d18-d19}, [r3]
	vstr	d18, [sp, #384]
	vstr	d19, [sp, #392]
	vsub.i64	q12, q8, q9
	vld1.64	{d28-d29}, [r1]
	vadd.i64	q12, q12, q14
	add	r3, sp, #1472
	add	r3, r3, #8
	vld1.64	{d30-d31}, [r3]
	vadd.i64	q12, q12, q15
	vld1.64	{d20-d21}, [r2]
	vstr	d20, [sp, #400]
	vstr	d21, [sp, #408]
	vadd.i64	q12, q12, q10
	vld1.64	{d22-d23}, [r0]
	vstr	d22, [sp, #416]
	vstr	d23, [sp, #424]
	add	r3, sp, #1376
	add	r3, r3, #8
	vld1.64	{d6-d7}, [r3]
	vsub.i64	q11, q11, q3
	vsub.i64	q1, q3, q10
	ldr	r3, [sp, #64]
	vld1.64	{d0-d1}, [r3]
	vadd.i64	q9, q0, q15
	vadd.i64	q9, q9, q11
	vsub.i64	q9, q9, q14
	vshl.i64	q10, q9, #2
	vshr.u64	q9, q9, #2
	veor	q8, q10, q9
	vshl.i64	q10, q10, #26
	veor	q8, q8, q10
	vshr.u64	q9, q9, #3
	veor	q8, q8, q9
	vshl.i64	q10, q10, #31
	veor	q8, q8, q10
	vshr.u64	q9, q9, #31
	veor	q8, q8, q9
	vadd.i64	q8, q8, q13
	add	r6, sp, #992
	add	r3, sp, #1016
	vst1.64	{d16}, [r3]
	add	r3, sp, #1488
	add	r3, r3, #8
	vld1.64	{d12-d13}, [r3]
	vstr	d12, [sp, #432]
	vstr	d13, [sp, #440]
	vadd.i64	q11, q6, q11
	vld1.64	{d16-d17}, [r4]
	vstr	d16, [sp, #448]
	vstr	d17, [sp, #456]
	vsub.i64	q11, q11, q8
	vldr	d18, [sp, #384]
	vldr	d19, [sp, #392]
	vsub.i64	q11, q11, q9
	vmov	d17, d24
	vmov	d16, d22
	vswp	d17, d16
	vshl.i64	q9, q8, #3
	vshr.u64	q8, q8, #1
	veor	q10, q9, q8
	vshl.i64	q9, q9, #1
	veor	q10, q10, q9
	vshr.u64	q8, q8, #26
	veor	q10, q10, q8
	vshl.i64	q9, q9, #33
	veor	q10, q10, q9
	vshr.u64	q8, q8, #33
	veor	q10, q10, q8
	add	r3, sp, #1248
	add	r3, r3, #8
	str	r3, [sp, #16]
	vld1.64	{d18-d19}, [r3]
	add	r3, sp, #1328
	add	r3, r3, #8
	str	r3, [sp, #12]
	vld1.64	{d16-d17}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vadd.i64	q10, q10, q8
	vmov	d16, d20
	vst1.64	{d16}, [r6]
	vmov	d16, d21
	add	r7, sp, #1072
	vst1.64	{d16}, [r7]
	ldr	r3, [sp, #52]
	vld1.64	{d22-d23}, [r3]
	vldr	d12, [sp, #448]
	vldr	d13, [sp, #456]
	vadd.i64	q12, q11, q6
	vldr	d16, [sp, #384]
	vldr	d17, [sp, #392]
	vadd.i64	q12, q12, q8
	vadd.i64	q12, q12, q14
	add	r3, sp, #1456
	add	r3, r3, #8
	vld1.64	{d26-d27}, [r3]
	vadd.i64	q12, q12, q13
	vld1.64	{d14-d15}, [ip]
	vldr	d18, [sp, #432]
	vldr	d19, [sp, #440]
	vsub.i64	q2, q9, q7
	vadd.i64	q8, q0, q8
	add	r3, sp, #1440
	add	r3, r3, #8
	vld1.64	{d8-d9}, [r3]
	vadd.i64	q8, q8, q4
	vadd.i64	q8, q8, q2
	vshl.i64	q9, q8, #1
	vshr.u64	q8, q8, #2
	veor	q10, q9, q8
	vshl.i64	q9, q9, #18
	veor	q10, q10, q9
	vshr.u64	q8, q8, #9
	veor	q10, q10, q8
	vshl.i64	q9, q9, #34
	veor	q10, q10, q9
	vshr.u64	q8, q8, #34
	veor	q10, q10, q8
	add	r3, sp, #1264
	add	r3, r3, #8
	str	r3, [sp, #8]
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q10, q10, q8
	vmov	d16, d20
	add	r1, sp, #1008
	vst1.64	{d16}, [r1]
	vadd.i64	q8, q11, q4
	vsub.i64	q8, q8, q13
	vadd.i64	q8, q8, q1
	vshr.u64	q9, q8, #1
	veor	q8, q8, q9
	add	r3, sp, #1280
	add	r3, r3, #8
	str	r3, [sp, #4]
	vld1.64	{d18-d19}, [r3]
	vadd.i64	q8, q8, q9
	add	r0, sp, #1024
	vst1.64	{d16}, [r0]
	vldr	d12, [sp, #416]
	vldr	d13, [sp, #424]
	vldr	d16, [sp, #368]
	vldr	d17, [sp, #376]
	vsub.i64	q6, q6, q8
	vstr	d12, [sp, #464]
	vstr	d13, [sp, #472]
	vsub.i64	q9, q4, q0
	vsub.i64	q9, q9, q11
	vadd.i64	q9, q9, q6
	vshl.i64	q10, q9, #2
	vshr.u64	q9, q9, #1
	veor	q8, q10, q9
	vshl.i64	q10, q10, #11
	veor	q8, q8, q10
	vshr.u64	q9, q9, #20
	veor	q8, q8, q9
	vshl.i64	q10, q10, #30
	veor	q8, q8, q10
	vshr.u64	q9, q9, #30
	veor	q8, q8, q9
	vadd.i64	q8, q8, q5
	add	r3, sp, #1072
	add	r3, r3, #8
	vst1.64	{d16}, [r3]
	add	r3, sp, #1392
	add	r3, r3, #8
	vld1.64	{d12-d13}, [r3]
	vadd.i64	q14, q6, q14
	vsub.i64	q2, q2, q11
	vadd.i64	q2, q2, q14
	vld1.64	{d10-d11}, [r5]
	vsub.i64	q3, q3, q5
	vsub.i64	q3, q3, q4
	vadd.i64	q3, q3, q14
	vsub.i64	q14, q15, q5
	vldr	d18, [sp, #368]
	vldr	d19, [sp, #376]
	vsub.i64	q11, q11, q9
	vldr	d20, [sp, #432]
	vldr	d21, [sp, #440]
	vsub.i64	q11, q11, q10
	vadd.i64	q11, q11, q14
	vmov	d17, d22
	vmov	d16, d24
	vswp	d17, d16
	vshl.i64	q9, q8, #2
	vshr.u64	q8, q8, #2
	veor	q10, q9, q8
	vshl.i64	q9, q9, #26
	veor	q10, q10, q9
	vshr.u64	q8, q8, #3
	veor	q10, q10, q8
	vshl.i64	q9, q9, #31
	veor	q10, q10, q9
	vshr.u64	q8, q8, #31
	veor	q10, q10, q8
	add	r8, sp, #1312
	add	r8, r8, #8
	vld1.64	{d16-d17}, [r8]
	vmov	d17, d16
	vldr	d22, [sp, #336]
	vldr	d23, [sp, #344]
	vmov	d16, d22
	vswp	d17, d16
	vadd.i64	q10, q10, q8
	vmov	d16, d20
	add	ip, sp, #1056
	vst1.64	{d16}, [ip]
	vmov	d16, d21
	add	r3, sp, #1088
	add	r3, r3, #8
	vst1.64	{d16}, [r3]
	vldr	d24, [sp, #448]
	vldr	d25, [sp, #456]
	vsub.i64	q8, q7, q12
	vsub.i64	q8, q8, q4
	vadd.i64	q8, q8, q14
	vmov	d18, d4
	vmov	d17, d16
	vmov	d16, d18
	vshl.i64	q9, q8, #3
	vshr.u64	q8, q8, #1
	veor	q10, q9, q8
	vshl.i64	q9, q9, #1
	veor	q10, q10, q9
	vshr.u64	q8, q8, #26
	veor	q10, q10, q8
	vshl.i64	q9, q9, #33
	veor	q10, q10, q9
	vshr.u64	q8, q8, #33
	veor	q10, q10, q8
	vldr	d18, [sp, #224]
	vldr	d19, [sp, #232]
	vmov	d17, d18
	vldr	d22, [sp, #144]
	vldr	d23, [sp, #152]
	vmov	d16, d22
	vswp	d17, d16
	vadd.i64	q10, q10, q8
	vmov	d16, d20
	add	r3, sp, #1024
	add	r3, r3, #8
	vst1.64	{d16}, [r3]
	vmov	d16, d21
	add	r3, sp, #1104
	add	r3, r3, #8
	vst1.64	{d16}, [r3]
	vsub.i64	q1, q1, q12
	vldr	d24, [sp, #368]
	vldr	d25, [sp, #376]
	vsub.i64	q1, q1, q12
	vsub.i64	q1, q1, q7
	vmov	d17, d2
	vmov	d16, d6
	vswp	d17, d16
	vshl.i64	q9, q8, #1
	vshr.u64	q8, q8, #2
	veor	q10, q9, q8
	vshl.i64	q9, q9, #18
	veor	q10, q10, q9
	vshr.u64	q8, q8, #9
	veor	q10, q10, q8
	vshl.i64	q9, q9, #34
	veor	q10, q10, q9
	vshr.u64	q8, q8, #34
	veor	q10, q10, q8
	add	sl, sp, #1344
	add	sl, sl, #8
	vld1.64	{d16-d17}, [sl]
	vldr	d6, [sp, #256]
	vldr	d7, [sp, #264]
	vmov	d18, d6
	vmov	d17, d16
	vmov	d16, d18
	vadd.i64	q10, q10, q8
	vmov	d16, d20
	add	r3, sp, #1040
	add	r3, r3, #8
	vst1.64	{d16}, [r3]
	vmov	d16, d21
	add	r4, sp, #1088
	vst1.64	{d16}, [r4]
	vsub.i64	q11, q6, q13
	vsub.i64	q11, q11, q7
	vldr	d16, [sp, #464]
	vldr	d17, [sp, #472]
	vadd.i64	q11, q11, q8
	vsub.i64	q15, q15, q6
	vldr	d18, [sp, #448]
	vldr	d19, [sp, #456]
	vadd.i64	q15, q15, q9
	vsub.i64	q15, q15, q13
	vsub.i64	q15, q15, q0
	vldr	d20, [sp, #400]
	vldr	d21, [sp, #408]
	vadd.i64	q12, q10, q5
	vldr	d6, [sp, #416]
	vldr	d7, [sp, #424]
	vsub.i64	q13, q13, q3
	vldr	d16, [sp, #432]
	vldr	d17, [sp, #440]
	vsub.i64	q13, q13, q8
	vadd.i64	q13, q13, q12
	vmov	d17, d26
	vmov	d16, d30
	vswp	d17, d16
	vshl.i64	q9, q8, #2
	vshr.u64	q8, q8, #1
	veor	q10, q9, q8
	vshl.i64	q9, q9, #11
	veor	q10, q10, q9
	vshr.u64	q8, q8, #20
	veor	q10, q10, q8
	vshl.i64	q9, q9, #30
	veor	q10, q10, q9
	vshr.u64	q8, q8, #30
	veor	q10, q10, q8
	add	r5, sp, #1296
	add	r5, r5, #8
	vld1.64	{d16-d17}, [r5]
	vldr	d26, [sp, #176]
	vldr	d27, [sp, #184]
	vmov	d18, d26
	vmov	d17, d16
	vmov	d16, d18
	vadd.i64	q10, q10, q8
	vmov	d16, d20
	add	r3, sp, #1000
	vst1.64	{d16}, [r3]
	vmov	d16, d21
	add	r2, sp, #1040
	vst1.64	{d16}, [r2]
	vsub.i64	q0, q0, q6
	vldr	d30, [sp, #384]
	vldr	d31, [sp, #392]
	vsub.i64	q0, q0, q15
	vadd.i64	q0, q0, q12
	vmov	d17, d0
	vmov	d16, d22
	vswp	d17, d16
	vshr.u64	q9, q8, #1
	veor	q8, q8, q9
	add	r3, sp, #1360
	add	r3, r3, #8
	str	r3, [sp, #0]
	vld1.64	{d18-d19}, [r3]
	vldr	d6, [sp, #288]
	vldr	d7, [sp, #296]
	vmov	d20, d6
	vmov	d19, d18
	vmov	d18, d20
	vadd.i64	q8, q8, q9
	vmov	d18, d16
	add	r3, sp, #1056
	add	r3, r3, #8
	vst1.64	{d18}, [r3]
	vmov	d16, d17
	add	r3, sp, #1104
	vst1.64	{d16}, [r3]
	vld1.64	{d12-d13}, [r6]
	vstr	d12, [sp, #480]
	vstr	d13, [sp, #488]
	vshl.i64	q8, q6, #2
	vshr.u64	q9, q6, #1
	veor	q10, q8, q9
	vshl.i64	q8, q8, #11
	veor	q10, q10, q8
	vshr.u64	q9, q9, #20
	veor	q10, q10, q9
	vshl.i64	q8, q8, #30
	veor	q10, q10, q8
	vshr.u64	q9, q9, #30
	veor	q10, q10, q9
	vld1.64	{d24-d25}, [r1]
	vstr	d24, [sp, #496]
	vstr	d25, [sp, #504]
	vshl.i64	q8, q12, #2
	vshr.u64	q9, q12, #2
	veor	q11, q8, q9
	vshl.i64	q8, q8, #26
	veor	q11, q11, q8
	vshr.u64	q9, q9, #3
	veor	q11, q11, q9
	vshl.i64	q8, q8, #31
	veor	q11, q11, q8
	vshr.u64	q9, q9, #31
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d13
	vmov	d17, d16
	vmov	d17, d16
	vmov	d16, d24
	vswp	d17, d16
	vshl.i64	q9, q8, #1
	vshr.u64	q8, q8, #2
	veor	q10, q9, q8
	vshl.i64	q9, q9, #18
	veor	q10, q10, q9
	vshr.u64	q8, q8, #9
	veor	q10, q10, q8
	vshl.i64	q9, q9, #34
	veor	q10, q10, q9
	vshr.u64	q8, q8, #34
	veor	q10, q10, q8
	vadd.i64	q10, q10, q11
	vld1.64	{d26-d27}, [r0]
	vstr	d26, [sp, #512]
	vstr	d27, [sp, #520]
	vadd.i64	q15, q12, q13
	vshl.i64	q8, q13, #2
	vshr.u64	q9, q13, #1
	veor	q11, q8, q9
	vshl.i64	q8, q8, #11
	veor	q11, q11, q8
	vshr.u64	q9, q9, #20
	veor	q11, q11, q9
	vshl.i64	q8, q8, #30
	veor	q11, q11, q8
	vshr.u64	q9, q9, #30
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d25
	vmov	d17, d16
	vmov	d17, d16
	vmov	d16, d26
	vswp	d17, d16
	vmov	q2, q8  @ v2di
	vshl.i64	q9, q8, #3
	vshr.u64	q8, q8, #1
	veor	q10, q9, q8
	vshl.i64	q9, q9, #1
	veor	q10, q10, q9
	vshr.u64	q8, q8, #26
	veor	q10, q10, q8
	vshl.i64	q9, q9, #33
	veor	q10, q10, q9
	vshr.u64	q8, q8, #33
	veor	q10, q10, q8
	vadd.i64	q10, q10, q11
	vld1.64	{d24-d25}, [r2]
	vstr	d24, [sp, #528]
	vstr	d25, [sp, #536]
	vadd.i64	q15, q15, q12
	vshl.i64	q8, q12, #2
	vshr.u64	q9, q12, #2
	veor	q11, q8, q9
	vshl.i64	q8, q8, #26
	veor	q11, q11, q8
	vshr.u64	q9, q9, #3
	veor	q11, q11, q9
	vshl.i64	q8, q8, #31
	veor	q11, q11, q8
	vshr.u64	q9, q9, #31
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d27
	vmov	d17, d16
	vmov	d17, d16
	vmov	d16, d24
	vswp	d17, d16
	vmov	q3, q8  @ v2di
	vshl.i64	q9, q8, #1
	vshr.u64	q8, q8, #2
	veor	q10, q9, q8
	vshl.i64	q9, q9, #18
	veor	q10, q10, q9
	vshr.u64	q8, q8, #9
	veor	q10, q10, q8
	vshl.i64	q9, q9, #34
	veor	q10, q10, q9
	vshr.u64	q8, q8, #34
	veor	q10, q10, q8
	vadd.i64	q10, q10, q11
	vld1.64	{d16-d17}, [ip]
	vstr	d16, [sp, #544]
	vstr	d17, [sp, #552]
	vadd.i64	q15, q15, q8
	vshl.i64	q8, q8, #2
	vldr	d22, [sp, #544]
	vldr	d23, [sp, #552]
	vshr.u64	q9, q11, #1
	veor	q11, q8, q9
	vshl.i64	q8, q8, #11
	veor	q11, q11, q8
	vshr.u64	q9, q9, #20
	veor	q11, q11, q9
	vshl.i64	q8, q8, #30
	veor	q11, q11, q8
	vshr.u64	q9, q9, #30
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d25
	vmov	d17, d16
	vmov	d17, d16
	vldr	d24, [sp, #544]
	vldr	d25, [sp, #552]
	vmov	d16, d24
	vswp	d17, d16
	vmov	q1, q8  @ v2di
	vshl.i64	q9, q8, #3
	vshr.u64	q8, q8, #1
	veor	q10, q9, q8
	vshl.i64	q9, q9, #1
	veor	q10, q10, q9
	vshr.u64	q8, q8, #26
	veor	q10, q10, q8
	vshl.i64	q9, q9, #33
	veor	q10, q10, q9
	vshr.u64	q8, q8, #33
	veor	q10, q10, q8
	vadd.i64	q10, q10, q11
	vld1.64	{d26-d27}, [r7]
	vstr	d26, [sp, #560]
	vstr	d27, [sp, #568]
	vadd.i64	q15, q15, q13
	vshl.i64	q8, q13, #2
	vshr.u64	q9, q13, #2
	veor	q11, q8, q9
	vshl.i64	q8, q8, #26
	veor	q11, q11, q8
	vshr.u64	q9, q9, #3
	veor	q11, q11, q9
	vshl.i64	q8, q8, #31
	veor	q11, q11, q8
	vshr.u64	q9, q9, #31
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d25
	vmov	d17, d16
	vmov	d17, d16
	vmov	d16, d26
	vswp	d17, d16
	vmov	q7, q8  @ v2di
	vshl.i64	q9, q8, #1
	vshr.u64	q8, q8, #2
	veor	q10, q9, q8
	vshl.i64	q9, q9, #18
	veor	q10, q10, q9
	vshr.u64	q8, q8, #9
	veor	q10, q10, q8
	vshl.i64	q9, q9, #34
	veor	q10, q10, q9
	vshr.u64	q8, q8, #34
	veor	q10, q10, q8
	vadd.i64	q10, q10, q11
	vld1.64	{d24-d25}, [r4]
	vstr	d24, [sp, #576]
	vstr	d25, [sp, #584]
	vadd.i64	q15, q15, q12
	vshl.i64	q8, q12, #2
	vshr.u64	q9, q12, #1
	veor	q11, q8, q9
	vshl.i64	q8, q8, #11
	veor	q11, q11, q8
	vshr.u64	q9, q9, #20
	veor	q11, q11, q9
	vshl.i64	q8, q8, #30
	veor	q11, q11, q8
	vshr.u64	q9, q9, #30
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d27
	vmov	d17, d16
	vmov	d17, d16
	vmov	d16, d24
	vswp	d17, d16
	vstr	d16, [sp, #592]
	vstr	d17, [sp, #600]
	vshl.i64	q9, q8, #3
	vshr.u64	q8, q8, #1
	veor	q10, q9, q8
	vshl.i64	q9, q9, #1
	veor	q10, q10, q9
	vshr.u64	q8, q8, #26
	veor	q10, q10, q8
	vshl.i64	q9, q9, #33
	veor	q10, q10, q9
	vshr.u64	q8, q8, #33
	veor	q10, q10, q8
	vadd.i64	q10, q10, q11
	vld1.64	{d12-d13}, [r3]
	vstr	d12, [sp, #608]
	vstr	d13, [sp, #616]
	vadd.i64	q15, q15, q6
	vshl.i64	q8, q6, #2
	vshr.u64	q9, q6, #2
	veor	q11, q8, q9
	vshl.i64	q8, q8, #26
	veor	q11, q11, q8
	vshr.u64	q9, q9, #3
	veor	q11, q11, q9
	vshl.i64	q8, q8, #31
	veor	q11, q11, q8
	vshr.u64	q9, q9, #31
	veor	q11, q11, q9
	vadd.i64	q11, q11, q10
	vmov	d16, d25
	vmov	d17, d16
	vmov	d17, d16
	vmov	d16, d12
	vmov	d10, d17
	vmov	d11, d16
	vshl.i64	q8, q5, #1
	vshr.u64	q9, q5, #2
	veor	q10, q8, q9
	vshl.i64	q8, q8, #18
	veor	q10, q10, q8
	vshr.u64	q9, q9, #9
	veor	q10, q10, q9
	vshl.i64	q8, q8, #34
	veor	q10, q10, q8
	vshr.u64	q9, q9, #34
	veor	q10, q10, q9
	vadd.i64	q10, q10, q11
	ldr	r3, [sp, #60]
	vld1.64	{d16-d17}, [r3]
	vstr	d16, [sp, #624]
	vstr	d17, [sp, #632]
	add	r3, sp, #944
	vld1.64	{d12-d13}, [r3]
	vsub.i64	q11, q8, q6
	add	r3, sp, #888
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #896
	vld1.64	{d18-d19}, [r3]
	vstr	d18, [sp, #640]
	vstr	d19, [sp, #648]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q11, q11, q8
	vld1.64	{d16-d17}, [r9]
	vadd.i64	q11, q11, q8
	vld1.64	{d16-d17}, [r5]
	ldr	r3, [sp, #32]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q11, q11, q8
	vadd.i64	q11, q11, q10
	add	r1, sp, #1104
	add	r1, r1, #8
	vld1.64	{d24-d25}, [r1]
	vshl.i64	q9, q12, #3
	vshr.u64	q10, q12, #1
	veor	q8, q9, q10
	vshl.i64	q9, q9, #1
	veor	q8, q8, q9
	vshr.u64	q10, q10, #26
	veor	q8, q8, q10
	vshl.i64	q9, q9, #33
	veor	q8, q8, q9
	vshr.u64	q10, q10, #33
	veor	q8, q8, q10
	vadd.i64	q8, q11, q8
	vmov	d18, d24
	vmov	d17, d16
	vmov	d16, d18
	vshl.i64	q9, q8, #3
	vshr.u64	q8, q8, #1
	veor	q14, q9, q8
	vshl.i64	q9, q9, #1
	veor	q14, q14, q9
	vshr.u64	q8, q8, #26
	veor	q14, q14, q8
	vshl.i64	q9, q9, #33
	veor	q14, q14, q9
	vshr.u64	q8, q8, #33
	veor	q14, q14, q8
	vadd.i64	q14, q14, q11
	add	r2, sp, #1120
	vst1.64	{d28-d29}, [r2]
	vshr.u64	q10, q14, #1
	veor	q10, q14, q10
	vadd.i64	q10, q15, q10
	vshr.u64	q8, q2, #59
	vshl.i64	q2, q2, #5
	vorr	q8, q8, q2
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q3, #53
	vshl.i64	q9, q3, #11
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q1, #37
	vshl.i64	q9, q1, #27
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q7, #32
	vshl.i64	q9, q7, #32
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vldr	d18, [sp, #592]
	vldr	d19, [sp, #600]
	vshr.u64	q8, q9, #27
	vshl.i64	q9, q9, #37
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q5, #21
	vshl.i64	q9, q5, #43
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	ldr	r3, [sp, #48]
	vld1.64	{d22-d23}, [r3]
	vstr	d22, [sp, #656]
	vstr	d23, [sp, #664]
	add	r3, sp, #960
	vld1.64	{d0-d1}, [r3]
	vsub.i64	q13, q11, q0
	add	r3, sp, #904
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #912
	vld1.64	{d18-d19}, [r3]
	vstr	d18, [sp, #672]
	vstr	d19, [sp, #680]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q13, q13, q8
	ldr	r3, .L5+4
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q13, q13, q8
	vld1.64	{d16-d17}, [r8]
	ldr	r3, [sp, #28]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q13, q13, q8
	vadd.i64	q13, q13, q10
	vld1.64	{d16-d17}, [r1]
	vld1.64	{d18-d19}, [r2]
	vstr	d18, [sp, #688]
	vstr	d19, [sp, #696]
	vmov	d19, d18
	fstd	d19, [sp, #704]	@ int
	vmov	d4, d16
	vmov	d5, d19
	vshr.u64	q8, q2, #11
	vshl.i64	q9, q2, #53
	vorr	q8, q8, q9
	vadd.i64	q13, q13, q8
	add	r2, sp, #1120
	add	r2, r2, #8
	vld1.64	{d18-d19}, [r2]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q13, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q13, q13, q8
	add	r3, sp, #1136
	vst1.64	{d26-d27}, [r3]
	veor	q11, q14, q13
	vshr.u64	q10, q3, #59
	vshl.i64	q3, q3, #5
	vorr	q10, q10, q3
	vshr.u64	q8, q1, #53
	vshl.i64	q9, q1, #11
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q7, #37
	vshl.i64	q9, q7, #27
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vldr	d24, [sp, #592]
	vldr	d25, [sp, #600]
	vshr.u64	q8, q12, #32
	vshl.i64	q9, q12, #32
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q5, #27
	vshl.i64	q9, q5, #37
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q2, #21
	vshl.i64	q9, q2, #43
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	b	.L6
.L7:
	.align	2
.L5:
	.word	consts
	.word	consts+16
.L6:
	vld1.64	{d6-d7}, [r2]
	vstr	d6, [sp, #712]
	vstr	d7, [sp, #720]
	vld1.64	{d16-d17}, [r3]
	vstr	d16, [sp, #728]
	vstr	d17, [sp, #736]
	vmov	d17, d6
	vldr	d18, [sp, #728]
	vldr	d19, [sp, #736]
	vmov	d16, d18
	vmov	d8, d17
	vmov	d9, d16
	vshr.u64	q8, q4, #11
	vshl.i64	q9, q4, #53
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q13, #1
	veor	q8, q13, q8
	vadd.i64	q10, q10, q8
	add	r3, sp, #976
	vld1.64	{d6-d7}, [r3]
	vldr	d16, [sp, #640]
	vldr	d17, [sp, #648]
	vsub.i64	q12, q8, q3
	add	r3, sp, #920
	vld1.64	{d16-d17}, [r3]
	add	r3, sp, #928
	vld1.64	{d18-d19}, [r3]
	vstr	d18, [sp, #744]
	vstr	d19, [sp, #752]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q12, q12, q8
	add	r3, r9, #32
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q12, q12, q8
	ldr	r3, [sp, #12]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #24]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q12, q12, q8
	vadd.i64	q12, q12, q10
	vldr	d16, [sp, #496]
	vldr	d17, [sp, #504]
	vsub.i64	q15, q15, q8
	vadd.i64	q15, q15, q14
	vadd.i64	q12, q15, q12
	add	r1, sp, #1136
	add	r1, r1, #8
	vld1.64	{d18-d19}, [r1]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q12, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q12, q12, q8
	add	r2, sp, #1152
	vst1.64	{d24-d25}, [r2]
	veor	q14, q11, q12
	vshr.u64	q10, q1, #59
	vshl.i64	q1, q1, #5
	vorr	q10, q10, q1
	vshr.u64	q8, q7, #53
	vshl.i64	q9, q7, #11
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vldr	d18, [sp, #592]
	vldr	d19, [sp, #600]
	vshr.u64	q8, q9, #37
	vshl.i64	q9, q9, #27
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q5, #32
	vshl.i64	q9, q5, #32
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q2, #27
	vshl.i64	q9, q2, #37
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q4, #21
	vshl.i64	q9, q4, #43
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vldr	d16, [sp, #672]
	vldr	d17, [sp, #680]
	vldr	d18, [sp, #624]
	vldr	d19, [sp, #632]
	vsub.i64	q11, q8, q9
	add	r3, sp, #936
	vld1.64	{d16-d17}, [r3]
	vmov	d17, d16
	vmov	d16, d12
	vswp	d17, d16
	vadd.i64	q11, q11, q8
	add	r3, r9, #48
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q11, q11, q8
	vld1.64	{d16-d17}, [sl]
	ldr	r3, [sp, #20]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	vldr	d18, [sp, #512]
	vldr	d19, [sp, #520]
	vsub.i64	q15, q15, q9
	vadd.i64	q15, q15, q13
	veor	q11, q11, q8
	vadd.i64	q11, q11, q10
	vadd.i64	q11, q15, q11
	vld1.64	{d16-d17}, [r1]
	vld1.64	{d18-d19}, [r2]
	vmov	d20, d18
	fstd	d20, [sp, #760]	@ int
	vmov	d2, d16
	vmov	d3, d20
	vshr.u64	q8, q1, #11
	vshl.i64	q9, q1, #53
	vorr	q8, q8, q9
	vadd.i64	q11, q11, q8
	vshr.u64	q8, q12, #1
	veor	q8, q12, q8
	vadd.i64	q11, q11, q8
	add	r2, sp, #1152
	add	r2, r2, #8
	vld1.64	{d18-d19}, [r2]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q11, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q11, q11, q8
	add	r3, sp, #1168
	vst1.64	{d22-d23}, [r3]
	veor	q13, q14, q11
	vldr	d16, [sp, #528]
	vldr	d17, [sp, #536]
	vsub.i64	q15, q15, q8
	vadd.i64	q15, q15, q12
	vshr.u64	q10, q7, #59
	vshl.i64	q7, q7, #5
	vorr	q10, q10, q7
	vadd.i64	q10, q15, q10
	vldr	d18, [sp, #592]
	vldr	d19, [sp, #600]
	vshr.u64	q8, q9, #53
	vshl.i64	q9, q9, #11
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q5, #37
	vshl.i64	q9, q5, #27
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q2, #32
	vshl.i64	q9, q2, #32
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q4, #27
	vshl.i64	q9, q4, #37
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q1, #21
	vshl.i64	q9, q1, #43
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vld1.64	{d24-d25}, [r2]
	vstr	d24, [sp, #768]
	vstr	d25, [sp, #776]
	vld1.64	{d16-d17}, [r3]
	vstr	d16, [sp, #784]
	vstr	d17, [sp, #792]
	vmov	d17, d24
	vldr	d18, [sp, #784]
	vldr	d19, [sp, #792]
	vmov	d16, d18
	vmov	d28, d17
	vmov	d29, d16
	vshr.u64	q8, q14, #11
	vshl.i64	q9, q14, #53
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q11, #1
	veor	q8, q11, q8
	vadd.i64	q10, q10, q8
	vldr	d16, [sp, #744]
	vldr	d17, [sp, #752]
	vldr	d18, [sp, #656]
	vldr	d19, [sp, #664]
	vsub.i64	q12, q8, q9
	add	r3, sp, #952
	vld1.64	{d16-d17}, [r3]
	vmov	d17, d16
	vmov	d16, d0
	vswp	d17, d16
	vadd.i64	q12, q12, q8
	add	r3, r9, #64
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q12, q12, q8
	ldr	r3, [sp, #0]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #68]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q12, q12, q8
	vadd.i64	q12, q12, q10
	add	r1, sp, #1168
	add	r1, r1, #8
	vld1.64	{d18-d19}, [r1]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q12, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q12, q12, q8
	add	r2, sp, #1184
	vst1.64	{d24-d25}, [r2]
	vmov	d16, d27
	vmov	d17, d16
	veor	q8, q13, q8
	mov	r3, #0
	mov	r4, #0
	vmov	q9, q8  @ v2di
	vmov	d19, r3, r4  @ v2di
	vstr	d18, [sp, #800]
	vstr	d19, [sp, #808]
	veor	q7, q9, q12
	vldr	d20, [sp, #544]
	vldr	d21, [sp, #552]
	vsub.i64	q15, q15, q10
	vadd.i64	q15, q15, q11
	vldr	d22, [sp, #592]
	vldr	d23, [sp, #600]
	vshr.u64	q10, q11, #59
	vshl.i64	q8, q11, #5
	vorr	q10, q10, q8
	vadd.i64	q10, q15, q10
	vshr.u64	q8, q5, #53
	vshl.i64	q9, q5, #11
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q2, #37
	vshl.i64	q9, q2, #27
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q4, #32
	vshl.i64	q9, q4, #32
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q1, #27
	vshl.i64	q9, q1, #37
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q14, #21
	vshl.i64	q9, q14, #43
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vld1.64	{d26-d27}, [r1]
	vstr	d26, [sp, #816]
	vstr	d27, [sp, #824]
	vld1.64	{d16-d17}, [r2]
	vstr	d16, [sp, #832]
	vstr	d17, [sp, #840]
	vmov	d17, d26
	fstd	d17, [sp, #848]	@ int
	vldr	d18, [sp, #832]
	vldr	d19, [sp, #840]
	vmov	d16, d18
	vmov	d26, d17
	vmov	d27, d16
	vshr.u64	q8, q13, #11
	vshl.i64	q9, q13, #53
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q12, #1
	veor	q8, q12, q8
	vadd.i64	q10, q10, q8
	vldr	d22, [sp, #640]
	vldr	d23, [sp, #648]
	vsub.i64	q6, q6, q11
	add	r3, sp, #968
	vld1.64	{d16-d17}, [r3]
	vmov	d17, d16
	vmov	d16, d6
	vswp	d17, d16
	vadd.i64	q6, q6, q8
	add	r3, r9, #80
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q6, q6, q8
	ldr	r3, [sp, #16]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #56]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q6, q6, q8
	vadd.i64	q6, q6, q10
	add	r2, sp, #1184
	add	r2, r2, #8
	vld1.64	{d18-d19}, [r2]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q6, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q6, q6, q8
	add	r3, sp, #1200
	vst1.64	{d12-d13}, [r3]
	veor	q7, q7, q6
	vldr	d16, [sp, #560]
	vldr	d17, [sp, #568]
	vsub.i64	q15, q15, q8
	vadd.i64	q15, q15, q12
	vshr.u64	q10, q5, #59
	vshl.i64	q5, q5, #5
	vorr	q10, q10, q5
	vadd.i64	q10, q15, q10
	vshr.u64	q8, q2, #53
	vshl.i64	q9, q2, #11
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q4, #37
	vshl.i64	q9, q4, #27
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q1, #32
	vshl.i64	q9, q1, #32
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q14, #27
	vshl.i64	q9, q14, #37
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q13, #21
	vshl.i64	q9, q13, #43
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vld1.64	{d16-d17}, [r2]
	vld1.64	{d10-d11}, [r3]
	vmov	d17, d16
	vmov	d16, d10
	vmov	d22, d17
	vmov	d23, d16
	vshr.u64	q8, q11, #11
	vshl.i64	q9, q11, #53
	vorr	q8, q8, q9
	vadd.i64	q10, q10, q8
	vshr.u64	q8, q6, #1
	veor	q8, q6, q8
	vadd.i64	q10, q10, q8
	vldr	d18, [sp, #672]
	vldr	d19, [sp, #680]
	vsub.i64	q0, q0, q9
	add	r3, sp, #984
	vld1.64	{d16-d17}, [r3]
	vmov	d17, d16
	vldr	d18, [sp, #624]
	vldr	d19, [sp, #632]
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q0, q0, q8
	add	r3, r9, #96
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q0, q0, q8
	ldr	r3, [sp, #8]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #40]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q0, q0, q8
	vadd.i64	q0, q0, q10
	add	r2, sp, #1200
	add	r2, r2, #8
	vld1.64	{d18-d19}, [r2]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q0, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q0, q0, q8
	add	r3, sp, #1216
	vst1.64	{d0-d1}, [r3]
	veor	q7, q7, q0
	vldr	d16, [sp, #576]
	vldr	d17, [sp, #584]
	vsub.i64	q15, q15, q8
	vadd.i64	q15, q15, q6
	vshr.u64	q8, q2, #59
	vshl.i64	q2, q2, #5
	vorr	q8, q8, q2
	vadd.i64	q15, q15, q8
	vshr.u64	q8, q4, #53
	vshl.i64	q9, q4, #11
	vorr	q8, q8, q9
	vadd.i64	q15, q15, q8
	vshr.u64	q8, q1, #37
	vshl.i64	q9, q1, #27
	vorr	q8, q8, q9
	vadd.i64	q15, q15, q8
	vshr.u64	q8, q14, #32
	vshl.i64	q9, q14, #32
	vorr	q8, q8, q9
	vadd.i64	q15, q15, q8
	vshr.u64	q8, q13, #27
	vshl.i64	q13, q13, #37
	vorr	q8, q8, q13
	vadd.i64	q15, q15, q8
	vshr.u64	q8, q11, #21
	vshl.i64	q11, q11, #43
	vorr	q8, q8, q11
	vadd.i64	q15, q15, q8
	vld1.64	{d16-d17}, [r2]
	vld1.64	{d26-d27}, [r3]
	vmov	d17, d16
	vmov	d16, d26
	vswp	d17, d16
	vshr.u64	q9, q8, #11
	vshl.i64	q8, q8, #53
	vorr	q9, q9, q8
	vadd.i64	q15, q15, q9
	vshr.u64	q8, q0, #1
	veor	q8, q0, q8
	vadd.i64	q15, q15, q8
	vldr	d18, [sp, #744]
	vldr	d19, [sp, #752]
	vsub.i64	q3, q3, q9
	ldr	r3, [sp, #44]
	vld1.64	{d16-d17}, [r3]
	vmov	d17, d16
	vldr	d18, [sp, #656]
	vldr	d19, [sp, #664]
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q3, q3, q8
	add	r3, r9, #112
	vld1.64	{d16-d17}, [r3]
	vadd.i64	q3, q3, q8
	ldr	r3, [sp, #4]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #36]
	vld1.64	{d18-d19}, [r3]
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	veor	q3, q3, q8
	vadd.i64	q3, q3, q15
	add	r3, sp, #1216
	add	r3, r3, #8
	vld1.64	{d18-d19}, [r3]
	vshr.u64	q8, q9, #2
	veor	q8, q9, q8
	vadd.i64	q8, q3, q8
	vmov	d17, d16
	vmov	d16, d18
	vshr.u64	q9, q8, #2
	veor	q8, q8, q9
	vadd.i64	q3, q3, q8
	add	r2, sp, #1232
	vst1.64	{d6-d7}, [r2]
	veor	q7, q7, q3
	vmov	d16, d15
	vmov	d17, d16
	veor	q7, q7, q8
	vmov	d16, d14
	vmov	d20, d16
	vmov	d21, d16
	vldr	d18, [sp, #800]
	vldr	d19, [sp, #808]
	vmov	d16, d18
	vmov	d22, d16
	vmov	d23, d16
	vldr	d30, [sp, #480]
	vldr	d31, [sp, #488]
	veor	q8, q11, q15
	veor	q2, q8, q12
	vldr	d18, [sp, #496]
	vldr	d19, [sp, #504]
	veor	q8, q11, q9
	veor	q6, q8, q6
	vldr	d24, [sp, #512]
	vldr	d25, [sp, #520]
	veor	q8, q11, q12
	veor	q7, q8, q0
	vldr	d30, [sp, #528]
	vldr	d31, [sp, #536]
	veor	q12, q11, q15
	veor	q12, q12, q3
	vshl.i64	q8, q10, #5
	vshr.u64	q9, q10, #7
	vmov	d17, d16
	vmov	d16, d18
	vmov	d18, d17
	vmov	d19, d16
	vldr	d6, [sp, #688]
	vldr	d7, [sp, #696]
	vshr.u64	q8, q3, #5
	vldr	d6, [sp, #712]
	vldr	d7, [sp, #720]
	vshl.i64	q15, q3, #8
	vmov	d17, d16
	vmov	d16, d30
	vswp	d17, d16
	vldr	d30, [sp, #160]
	vldr	d31, [sp, #168]
	veor	q8, q8, q15
	veor	q8, q8, q9
	vadd.i64	q0, q2, q8
	ldr	r3, [sp, #100]
	vst1.64	{d0-d1}, [r3]
	vshr.u64	q8, q10, #5
	vshr.u64	q9, q10, #1
	vmov	d17, d16
	vmov	d16, d18
	vswp	d17, d16
	vldr	d6, [sp, #728]
	vldr	d7, [sp, #736]
	vshl.i64	q9, q3, #5
	vldr	d30, [sp, #192]
	vldr	d31, [sp, #200]
	veor	q9, q9, q15
	veor	q8, q9, q8
	vadd.i64	q2, q6, q8
	ldr	r3, [sp, #96]
	vst1.64	{d4-d5}, [r3]
	vshr.u64	q8, q10, #3
	vshl.i64	q9, q10, #6
	vmov	d17, d16
	vmov	d16, d18
	vmov	d18, d17
	vmov	d19, d16
	vldr	d6, [sp, #768]
	vldr	d7, [sp, #776]
	vshr.u64	q8, q3, #6
	fldd	d7, [sp, #760]	@ int
	vmov	d17, d16
	vmov	d16, d7
	vldr	d12, [sp, #208]
	vldr	d13, [sp, #216]
	veor	q8, q8, q6
	veor	q8, q8, q9
	vadd.i64	q3, q7, q8
	ldr	r3, [sp, #92]
	vst1.64	{d6-d7}, [r3]
	vshr.u64	q8, q10, #4
	vshr.u64	q9, q10, #11
	vmov	d17, d16
	vmov	d16, d18
	vmov	d18, d17
	vmov	d19, d16
	vldr	d12, [sp, #784]
	vldr	d13, [sp, #792]
	vshl.i64	q8, q6, #6
	vldr	d12, [sp, #816]
	vldr	d13, [sp, #824]
	vshl.i64	q15, q6, #2
	vmov	d17, d16
	vmov	d16, d30
	vswp	d17, d16
	vldr	d30, [sp, #240]
	vldr	d31, [sp, #248]
	veor	q8, q8, q15
	veor	q8, q8, q9
	vadd.i64	q15, q12, q8
	ldr	r3, [sp, #88]
	vst1.64	{d30-d31}, [r3]
	vshl.i64	q8, q11, #8
	vshr.u64	q9, q11, #6
	vmov	d17, d16
	vmov	d16, d18
	vmov	d18, d17
	vmov	d19, d16
	fldd	d12, [sp, #848]	@ int
	fldd	d13, [sp, #704]	@ int
	vmov	d24, d12
	vmov	d25, d13
	add	r3, sp, #1056
	vld1.64	{d16-d17}, [r3]
	veor	q12, q12, q8
	veor	q12, q12, q9
	vshl.i64	q8, q11, #6
	vshl.i64	q9, q11, #4
	vmov	d17, d16
	vmov	d16, d18
	vmov	d18, d17
	vmov	d19, d16
	add	r3, sp, #1072
	vld1.64	{d16-d17}, [r3]
	veor	q4, q4, q8
	veor	q4, q4, q9
	vshr.u64	q8, q11, #3
	vshr.u64	q9, q11, #4
	vmov	d17, d16
	vmov	d16, d18
	vmov	d18, d17
	vmov	d19, d16
	add	r3, sp, #1088
	vld1.64	{d16-d17}, [r3]
	veor	q1, q1, q8
	veor	q1, q1, q9
	vshr.u64	q8, q11, #7
	vshr.u64	q11, q11, #2
	vmov	d17, d16
	vmov	d16, d22
	vswp	d17, d16
	vldr	d18, [sp, #608]
	vldr	d19, [sp, #616]
	veor	q14, q14, q9
	veor	q14, q14, q8
	vldr	d22, [sp, #832]
	vldr	d23, [sp, #840]
	veor	q8, q10, q11
	vldr	d12, [sp, #272]
	vldr	d13, [sp, #280]
	veor	q8, q8, q6
	vadd.i64	q12, q12, q8
	veor	q5, q10, q5
	vldr	d16, [sp, #304]
	vldr	d17, [sp, #312]
	veor	q5, q5, q8
	vadd.i64	q4, q4, q5
	veor	q13, q10, q13
	vldr	d18, [sp, #320]
	vldr	d19, [sp, #328]
	veor	q13, q13, q9
	vadd.i64	q1, q1, q13
	vld1.64	{d16-d17}, [r2]
	veor	q10, q10, q8
	vldr	d22, [sp, #352]
	vldr	d23, [sp, #360]
	veor	q10, q10, q11
	vadd.i64	q14, q14, q10
	vshr.u64	q10, q3, #55
	vshl.i64	q11, q3, #9
	vorr	q10, q10, q11
	vshr.u64	q11, q15, #53
	vshl.i64	q8, q15, #11
	vorr	q11, q11, q8
	vmov	d17, d21
	vmov	d16, d23
	vswp	d17, d16
	vshr.u64	q9, q8, #63
	vshl.i64	q8, q8, #1
	vorr	q9, q9, q8
	vmov	d17, d20
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q12, q12, q8
	ldr	r3, [sp, #84]
	vst1.64	{d24-d25}, [r3]
	vadd.i64	q9, q4, q9
	ldr	r3, [sp, #80]
	vst1.64	{d18-d19}, [r3]
	vadd.i64	q4, q4, q11
	vmov	d16, d8
	vst1.64	{d16}, [r3]
	vshr.u64	q10, q0, #51
	vshl.i64	q11, q0, #13
	vorr	q10, q10, q11
	vshr.u64	q11, q2, #49
	vshl.i64	q8, q2, #15
	vorr	q11, q11, q8
	vmov	d17, d21
	vmov	d16, d23
	vswp	d17, d16
	vshr.u64	q9, q8, #63
	vshl.i64	q8, q8, #1
	vorr	q9, q9, q8
	vmov	d17, d20
	vmov	d16, d18
	vswp	d17, d16
	vadd.i64	q1, q1, q8
	ldr	r3, [sp, #76]
	vst1.64	{d2-d3}, [r3]
	vadd.i64	q9, q14, q9
	ldr	r3, [sp, #72]
	vst1.64	{d18-d19}, [r3]
	vadd.i64	q14, q14, q11
	vmov	d16, d28
	vst1.64	{d16}, [r3]
	add	fp, fp, #128
	ldr	r3, [sp, #108]
	cmp	fp, r3
	bcc	.L2
	ldr	r3, [sp, #856]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #112]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #860]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #116]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #40]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #120]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #36]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #124]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #32]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #128]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #28]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #132]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #24]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #136]
	vst1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #20]
	vld1.64	{d16-d17}, [r3]
	ldr	r3, [sp, #140]
	vst1.64	{d16-d17}, [r3]
	add	sp, sp, #1504
	fldmfdd	sp!, {d8, d9, d10, d11, d12, d13, d14, d15}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	Compress512, .-Compress512
	.global	consts
	.section	.rodata
	.align	4
	.type	consts, %object
	.size	consts, 128
consts:
	.word	1431655760
	.word	1431655765
	.word	-1431655771
	.word	1521134250
	.word	-6
	.word	1610612735
	.word	1431655759
	.word	1700091221
	.word	-1431655772
	.word	1789569706
	.word	-7
	.word	1879048191
	.word	1431655758
	.word	1968526677
	.word	-1431655773
	.word	2058005162
	.word	-8
	.word	2147483647
	.word	1431655757
	.word	-2058005163
	.word	-1431655774
	.word	-1968526678
	.word	-9
	.word	-1879048193
	.word	1431655756
	.word	-1789569707
	.word	-1431655775
	.word	-1700091222
	.word	-10
	.word	-1610612737
	.word	1431655755
	.word	-1521134251
	.ident	"GCC: (GNU) 4.3.3"
	.section	.note.GNU-stack,"",%progbits
