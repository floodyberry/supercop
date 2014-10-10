#include "arm.inc"

.arch armv7-a
.fpu neon

SECTION_TEXT

GLOBAL_HIDDEN_FN blake2b_blocks_neon
vstmdb sp!, {q4-q7}
stmfd sp!, {r4-r12, r14}
mov r12, sp
sub sp, sp, #320
and sp, sp, #0xffffffe0
str r12, [sp, #288]
sub r3, r3, #128
mov r14, #128
cmp r2, #128
bhs blake2b_blocks_neon_use128
mov r14, r2
blake2b_blocks_neon_use128:
ldr r6, [r0, #80]
ldr r7, [r0, #84]
ands r6, r6, r7
beq blake2b_blocks_neon_nocopymessage
cmp r2, #128
beq blake2b_blocks_neon_nocopymessage
veor q0, q0, q0
veor q1, q1, q1
vst1.64 {q0,q1}, [sp,:256]!
vst1.64 {q0,q1}, [sp,:256]!
vst1.64 {q0,q1}, [sp,:256]!
vst1.64 {q0,q1}, [sp,:256]!
sub sp, sp, #128
mov r8, sp
tst r2, #64
beq blake2b_blocks_neon_skip64
vld1.64 {q0,q1}, [r1]!
vst1.64 {q0,q1}, [r8,:256]!
vld1.64 {q0,q1}, [r1]!
vst1.64 {q0,q1}, [r8,:256]!
blake2b_blocks_neon_skip64:
tst r2, #32
beq blake2b_blocks_neon_skip32
vld1.64 {q0,q1}, [r1]!
vst1.64 {q0,q1}, [r8,:256]!
blake2b_blocks_neon_skip32:
tst r2, #16
beq blake2b_blocks_neon_skip16
vld1.64 {q0}, [r1]!
vst1.64 {q0}, [r8,:128]!
blake2b_blocks_neon_skip16:
tst r2, #8
beq blake2b_blocks_neon_skip8
vld1.64 {d0}, [r1]!
vst1.64 {d0}, [r8,:64]!
blake2b_blocks_neon_skip8:
tst r2, #4
beq blake2b_blocks_neon_skip4
ldr r5, [r1], #4
str r5, [r8], #4
blake2b_blocks_neon_skip4:
tst r2, #2
beq blake2b_blocks_neon_skip2
ldrh r5, [r1], #2
strh r5, [r8], #2
blake2b_blocks_neon_skip2:
tst r2, #1
beq blake2b_blocks_neon_skip1
ldrb r5, [r1]
strb r5, [r8]
blake2b_blocks_neon_skip1:
mov r1, sp
blake2b_blocks_neon_nocopymessage:
mov r5, r0
add r6, sp, #128
vld1.64 {q0,q1}, [r5]!
vld1.64 {q2,q3}, [r5]!
vld1.64 {q4,q5}, [r5]!
vst1.64 {q0,q1}, [r6,:256]!
vst1.64 {q2,q3}, [r6,:256]!
vst1.64 {q4,q5}, [r6,:256]
ldr r12, =blake2b_constants_neon
b blake2b_blocks_neon_mainloop

.p2align 5
blake2b_constants_neon:
.quad 0x6a09e667f3bcc908
.quad 0xbb67ae8584caa73b
.quad 0x3c6ef372fe94f82b
.quad 0xa54ff53a5f1d36f1
.quad 0x510e527fade682d1
.quad 0x9b05688c2b3e6c1f
.quad 0x1f83d9abfb41bd6b
.quad 0x5be0cd19137e2179
.ltorg

blake2b_blocks_neon_mainloop:
ldr r8, [sp, #192]
ldr r9, [sp, #196]
ldr r10, [sp, #200]
ldr r11, [sp, #204]
adds r8, r8, r14
adcs r9, r9, #0
bne blake2b_blocks_neon_nocarry
cmp r8, r14
bhs blake2b_blocks_neon_nocarry
adds r10, r10, #1
adc r11, r11, #0
blake2b_blocks_neon_nocarry:
str r8, [sp, #192]
str r9, [sp, #196]
str r10, [sp, #200]
str r11, [sp, #204]
add r6, sp, #128
mov r4, r12
vst1.64 {q0,q1}, [r6,:256]!
vst1.64 {q2,q3}, [r6,:256]!
vld1.64 {q8,q9}, [r6,:256]
vld1.64 {q4,q5}, [r4,:256]!
vld1.64 {q6,q7}, [r4,:256]
veor q6, q6, q8
veor q7, q7, q9
vld1.64 {q8,q9}, [r1]!
vld1.64 {q10,q11}, [r1]!
vld1.64 {q12,q13}, [r1]!
vld1.64 {q14,q15}, [r1]!
vswp d17, d18
vswp d21, d22
vswp q9, q10
add r4, sp, #256
add r5, sp, #264
add r6, sp, #272
add r7, sp, #280
vst1.64 {q8,q9}, [r4,:256]
vadd.i64 d0, d0, d16
vadd.i64 d1, d1, d17
vadd.i64 d2, d2, d18
vadd.i64 d3, d3, d19
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d20
vadd.i64 d1, d1, d21
vadd.i64 d2, d2, d22
vadd.i64 d3, d3, d23
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vadd.i64 d0, d0, d24
vadd.i64 d1, d1, d26
vadd.i64 d2, d2, d28
vadd.i64 d3, d3, d30
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vadd.i64 d0, d0, d25
vadd.i64 d1, d1, d27
vadd.i64 d2, d2, d29
vadd.i64 d3, d3, d31
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q9}, [r6,:128]
vadd.i64 d0, d0, d30
vadd.i64 d1, d1, d18
vadd.i64 d2, d2, d25
vadd.i64 d3, d3, d29
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vld1.64 {q9}, [r6,:128]
vadd.i64 d0, d0, d26
vadd.i64 d1, d1, d24
vadd.i64 d2, d2, d31
vadd.i64 d3, d3, d19
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d20
vadd.i64 d1, d1, d12
vadd.i64 d2, d2, d27
vadd.i64 d3, d3, d22
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d28
vadd.i64 d1, d1, d13
vadd.i64 d2, d2, d23
vadd.i64 d3, d3, d21
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vadd.i64 d0, d0, d27
vadd.i64 d1, d1, d28
vadd.i64 d2, d2, d22
vadd.i64 d3, d3, d31
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vld1.64 {q8}, [r4,:128]
vadd.i64 d0, d0, d24
vadd.i64 d1, d1, d16
vadd.i64 d2, d2, d17
vadd.i64 d3, d3, d29
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vadd.i64 d0, d0, d26
vadd.i64 d1, d1, d21
vadd.i64 d2, d2, d23
vadd.i64 d3, d3, d25
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q7}, [r6,:128]
vadd.i64 d0, d0, d30
vadd.i64 d1, d1, d15
vadd.i64 d2, d2, d20
vadd.i64 d3, d3, d14
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vadd.i64 d0, d0, d23
vadd.i64 d1, d1, d21
vadd.i64 d2, d2, d29
vadd.i64 d3, d3, d27
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d25
vadd.i64 d1, d1, d20
vadd.i64 d2, d2, d28
vadd.i64 d3, d3, d30
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q6-q7}, [r4,:256]
vadd.i64 d0, d0, d13
vadd.i64 d1, d1, d22
vadd.i64 d2, d2, d14
vadd.i64 d3, d3, d31
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6-q7}, [r4,:256]
vadd.i64 d0, d0, d15
vadd.i64 d1, d1, d26
vadd.i64 d2, d2, d12
vadd.i64 d3, d3, d24
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q8}, [r4,:128]
vadd.i64 d0, d0, d25
vadd.i64 d1, d1, d22
vadd.i64 d2, d2, d17
vadd.i64 d3, d3, d26
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vld1.64 {q8-q9}, [r4,:256]
vadd.i64 d0, d0, d16
vadd.i64 d1, d1, d23
vadd.i64 d2, d2, d18
vadd.i64 d3, d3, d31
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q7}, [r6,:128]
vadd.i64 d0, d0, d30
vadd.i64 d1, d1, d27
vadd.i64 d2, d2, d15
vadd.i64 d3, d3, d21
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vadd.i64 d0, d0, d20
vadd.i64 d1, d1, d28
vadd.i64 d2, d2, d24
vadd.i64 d3, d3, d29
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q8-q9}, [r4,:256]
vadd.i64 d0, d0, d17
vadd.i64 d1, d1, d19
vadd.i64 d2, d2, d16
vadd.i64 d3, d3, d24
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d28
vadd.i64 d1, d1, d26
vadd.i64 d2, d2, d27
vadd.i64 d3, d3, d21
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q7}, [r6,:128]
vadd.i64 d0, d0, d14
vadd.i64 d1, d1, d23
vadd.i64 d2, d2, d31
vadd.i64 d3, d3, d20
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vadd.i64 d0, d0, d29
vadd.i64 d1, d1, d22
vadd.i64 d2, d2, d30
vadd.i64 d3, d3, d25
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q9}, [r6,:128]
vadd.i64 d0, d0, d28
vadd.i64 d1, d1, d20
vadd.i64 d2, d2, d30
vadd.i64 d3, d3, d18
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d22
vadd.i64 d1, d1, d31
vadd.i64 d2, d2, d29
vadd.i64 d3, d3, d26
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q6-q7}, [r4,:256]
vadd.i64 d0, d0, d12
vadd.i64 d1, d1, d15
vadd.i64 d2, d2, d25
vadd.i64 d3, d3, d24
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d23
vadd.i64 d1, d1, d21
vadd.i64 d2, d2, d13
vadd.i64 d3, d3, d27
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vadd.i64 d0, d0, d29
vadd.i64 d1, d1, d23
vadd.i64 d2, d2, d28
vadd.i64 d3, d3, d21
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d27
vadd.i64 d1, d1, d30
vadd.i64 d2, d2, d20
vadd.i64 d3, d3, d25
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d22
vadd.i64 d1, d1, d31
vadd.i64 d2, d2, d24
vadd.i64 d3, d3, d13
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6-q7}, [r4,:256]
vadd.i64 d0, d0, d12
vadd.i64 d1, d1, d14
vadd.i64 d2, d2, d15
vadd.i64 d3, d3, d26
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q8-q9}, [r4,:256]
vadd.i64 d0, d0, d19
vadd.i64 d1, d1, d30
vadd.i64 d2, d2, d27
vadd.i64 d3, d3, d16
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d31
vadd.i64 d1, d1, d25
vadd.i64 d2, d2, d21
vadd.i64 d3, d3, d24
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vadd.i64 d0, d0, d28
vadd.i64 d1, d1, d29
vadd.i64 d2, d2, d20
vadd.i64 d3, d3, d26
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6-q7}, [r4,:256]
vadd.i64 d0, d0, d13
vadd.i64 d1, d1, d23
vadd.i64 d2, d2, d14
vadd.i64 d3, d3, d22
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vadd.i64 d0, d0, d26
vadd.i64 d1, d1, d24
vadd.i64 d2, d2, d23
vadd.i64 d3, d3, d20
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vld1.64 {q8-q9}, [r4,:256]
vadd.i64 d0, d0, d17
vadd.i64 d1, d1, d18
vadd.i64 d2, d2, d19
vadd.i64 d3, d3, d22
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vadd.i64 d0, d0, d31
vadd.i64 d1, d1, d25
vadd.i64 d2, d2, d21
vadd.i64 d3, d3, d29
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d27
vadd.i64 d1, d1, d30
vadd.i64 d2, d2, d28
vadd.i64 d3, d3, d12
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q8-q9}, [r4,:256]
vadd.i64 d0, d0, d16
vadd.i64 d1, d1, d17
vadd.i64 d2, d2, d18
vadd.i64 d3, d3, d19
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vadd.i64 d0, d0, d20
vadd.i64 d1, d1, d21
vadd.i64 d2, d2, d22
vadd.i64 d3, d3, d23
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vadd.i64 d0, d0, d24
vadd.i64 d1, d1, d26
vadd.i64 d2, d2, d28
vadd.i64 d3, d3, d30
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vadd.i64 d0, d0, d25
vadd.i64 d1, d1, d27
vadd.i64 d2, d2, d29
vadd.i64 d3, d3, d31
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
cmp r2, #128
vld1.64 {q9}, [r6,:128]
vadd.i64 d0, d0, d30
vadd.i64 d1, d1, d18
vadd.i64 d2, d2, d25
vadd.i64 d3, d3, d29
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q6, q6, q0
veor q7, q7, q1
vrev64.32 q6, q6
vrev64.32 q7, q7
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q8, q2, q4
veor q9, q3, q5
vext.8 d4, d16, d16, #3
vext.8 d5, d17, d17, #3
vext.8 d6, d18, d18, #3
vext.8 d7, d19, d19, #3
vld1.64 {q9}, [r6,:128]
vadd.i64 d0, d0, d26
vadd.i64 d1, d1, d24
vadd.i64 d2, d2, d31
vadd.i64 d3, d3, d19
vadd.i64 q0, q0, q2
vadd.i64 q1, q1, q3
veor q8, q6, q0
veor q9, q7, q1
vext.8 d12, d16, d16, #2
vext.8 d13, d17, d17, #2
vext.8 d14, d18, d18, #2
vext.8 d15, d19, d19, #2
vadd.i64 q4, q4, q6
vadd.i64 q5, q5, q7
veor q2, q2, q4
veor q3, q3, q5
vadd.i64 q8, q2, q2
vadd.i64 q9, q3, q3
vshr.u64 q2, q2, #63
vshr.u64 q3, q3, #63
vorr q2, q2, q8
vorr q3, q3, q9
vext.64 q8, q2, q3, #1
vext.64 q9, q3, q2, #1
vext.64 q2, q7, q6, #1
vext.64 q3, q6, q7, #1
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d20
vadd.i64 d1, d1, d12
vadd.i64 d2, d2, d27
vadd.i64 d3, d3, d22
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q2, q2, q0
veor q3, q3, q1
vrev64.32 q2, q2
vrev64.32 q3, q3
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q6, q8, q5
veor q7, q9, q4
vext.8 d16, d12, d12, #3
vext.8 d17, d13, d13, #3
vext.8 d18, d14, d14, #3
vext.8 d19, d15, d15, #3
vld1.64 {q6}, [r4,:128]
vadd.i64 d0, d0, d28
vadd.i64 d1, d1, d13
vadd.i64 d2, d2, d23
vadd.i64 d3, d3, d21
vadd.i64 q0, q0, q8
vadd.i64 q1, q1, q9
veor q6, q2, q0
veor q7, q3, q1
vext.8 d4, d12, d12, #2
vext.8 d5, d13, d13, #2
vext.8 d6, d14, d14, #2
vext.8 d7, d15, d15, #2
vadd.i64 q5, q5, q2
vadd.i64 q4, q4, q3
veor q8, q8, q5
veor q9, q9, q4
vadd.i64 q6, q8, q8
vadd.i64 q7, q9, q9
vshr.u64 q8, q8, #63
vshr.u64 q9, q9, #63
vorr q8, q8, q6
vorr q9, q9, q7
add r4, sp, #128
vext.64 q6, q2, q3, #1
vext.64 q7, q3, q2, #1
vext.64 q2, q9, q8, #1
vext.64 q3, q8, q9, #1
vld1.64 {q8,q9}, [r4,:256]!
vld1.64 {q10,q11}, [r4,:256]
veor q0, q0, q4
veor q1, q1, q5
veor q2, q2, q6
veor q3, q3, q7
veor q0, q0, q8
veor q1, q1, q9
veor q2, q2, q10
veor q3, q3, q11
bls blake2b_blocks_neon_done
sub r2, #128
add r1, r3
b blake2b_blocks_neon_mainloop
blake2b_blocks_neon_done:
add r6, sp, #192
vld1.64 {q4-q5}, [r6,:256]
vst1.64 {q0-q1}, [r0]!
vst1.64 {q2-q3}, [r0]!
vst1.64 {q4-q5}, [r0]
ldr sp, [sp, #288]
ldmfd sp!, {r4-r12, r14}
vldm sp!, {q4-q7}
bx lr
FN_END blake2b_blocks_neon

