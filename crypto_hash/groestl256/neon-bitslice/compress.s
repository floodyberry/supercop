#
#  Groestl bitslice implementation of the compression function using ARM NEON.
#
#  @file     compress.s
#  @author   Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
#            Peter Schwabe <peter@cryptojedi.org>
#            Wolfgang Wieser <w.wieser@student.tugraz.at>
#
.arm
.fpu neon
.text
.align 4
.global __compress
.global _compress
__compress:
_compress:
vpush {q4,q5,q6,q7}
push {r4-r11}
sub sp,sp,#0
add r4, r3, #32

# r0: ctx
# r1: input
# r2: nblocks
# r3: CONSTS (=SHIFTCONSTANTS)
# r4: ROUNDCONSTANTS
# r5: round counter

# load message block M_i
vldm r1, {q4-q7}

# bitslice message block
veor q0, q0, q0;         veor q1, q1, q1;         veor q2, q2, q2;         veor q3, q3, q3;

vmov.u8 d24, #1;         vmov.u8 d25, #2;         vmov.u8 d26, #4;         vmov.u8 d27, #8;
                                                  vbit q0, q4, q12;        vbit q1, q5, q13;
vshr.u8 q8, q4, #2;      vshr.u8 q9, q5, #2;      vbit q1, q8, q12;        vbit q2, q9, q13;
vshr.u8 q8, q4, #4;      vshr.u8 q9, q5, #4;      vbit q2, q8, q12;        vbit q3, q9, q13;
vshr.u8 q8, q4, #6;      vshl.u8 q9, q5, #2;      vswp d8, d9;             vswp d10, d11;
vbit q3, q8, q12;        vbit q0, q9, q13;        vswp d24, d25;           vswp d26, d27;
vshr.u8 d9, d9, #1;      vshr.u8 d11, d11, #1;
vshl.u8 d8, d8, #1;      vshl.u8 d10, d10, #1;    vbit q0, q4, q12;        vbit q1, q5, q13;
vshr.u8 q8, q4, #2;      vshr.u8 q9, q5, #2;      vbit q1, q8, q12;        vbit q2, q9, q13;
vshr.u8 q8, q4, #4;      vshr.u8 q9, q5, #4;      vbit q2, q8, q12;        vbit q3, q9, q13;
vshr.u8 q8, q4, #6;      vshl.u8 q9, q5, #2;      vbit q3, q8, q12;        vbit q0, q9, q13;

vmov.u8 d28, #16;        vmov.u8 d29, #32;        vmov.u8 d30, #64;        vmov.u8 d31, #128;
                                                  vbit q2, q6, q14;        vbit q3, q7, q15;
vshr.u8 q10, q6, #2;     vshl.u8 q11, q7, #6;     vbit q3, q10, q14;       vbit q0, q11, q15;
vshl.u8 q10, q6, #4;     vshl.u8 q11, q7, #4;     vbit q0, q10, q14;       vbit q1, q11, q15;
vshl.u8 q10, q6, #2;     vshl.u8 q11, q7, #2;     vswp d12, d13;           vswp d14, d15;
vbit q1, q10, q14;       vbit q2, q11, q15;       vswp d28, d29;           vswp d30, d31;
vshr.u8 d13, d13, #1;    vshr.u8 d15, d15, #1;
vshl.u8 d12, d12, #1;    vshl.u8 d14, d14, #1;    vbit q2, q6, q14;        vbit q3, q7, q15;
vshr.u8 q10, q6, #2;     vshl.u8 q11, q7, #6;     vbit q3, q10, q14;       vbit q0, q11, q15;
vshl.u8 q10, q6, #4;     vshl.u8 q11, q7, #4;     vbit q0, q10, q14;       vbit q1, q11, q15;
vshl.u8 q10, q6, #2;     vshl.u8 q11, q7, #2;     vbit q1, q10, q14;       vbit q2, q11, q15;

# load H_{i-1}
vld1.64 {q8},  [r0,:128]!;    vmov q7, q3
vld1.64 {q9},  [r0,:128]!;    vmov q5, q2
vld1.64 {q10}, [r0,:128]!;    vmov q3, q1
vld1.64 {q11}, [r0,:128]!;    vmov q1, q0

# P = H_{i-1} + M_i
veor q6, q11, q7;
veor q4, q10, q5;        vswp d13, d14;
veor q2,  q9, q3;        vswp  d9, d10;
veor q0,  q8, q1;        vswp  d5, d6;
                         vswp  d1, d2;

#       old state:             new state:
#
#        P  |  Q                P  |  Q
#      -----+-----            -----+-----
#  q0=   d0 | d2   =q1          d0 | d1   =q0
#        d1 | d3                d2 | d3   =q1
#  q2=   d4 | d6   =q3          d4 | d5   =q2
#        d5 | d7                d6 | d7   =q3
#  q4=   d8 | d10  =q5          d8 | d9   =q4
#        d9 | d11              d10 | d11  =q5
#  q6=  d12 | d14  =q7         d12 | d13  =q6
#       d13 | d15              d14 | d15  =q7

ldr r5,=10
._roundloop:

# AddRoundConstants
vld1.i8 {q8},  [r4,:128]!
vld1.i8 {q9},  [r4,:128]!
veor q0,q0,q8
veor q1,q1,q9
vld1.i8 {q10}, [r4,:128]!
vld1.i8 {q11}, [r4,:128]!
veor q2,q2,q10
veor q3,q3,q11
vld1.i8 {q12}, [r4,:128]!
vld1.i8 {q13}, [r4,:128]!
veor q4,q4,q12
veor q5,q5,q13
vld1.i8 {q14}, [r4,:128]!
vld1.i8 {q15}, [r4,:128]!
veor q6,q6,q14
veor q7,q7,q15

# SubBytes
veor q5,q5,q6
veor q2,q2,q1
veor q5,q5,q0
veor q6,q6,q2
veor q3,q3,q0
veor q6,q6,q3
veor q3,q3,q7
veor q7,q7,q5
veor q3,q3,q4
veor q4,q4,q5
veor q3,q3,q1
veor q2,q2,q7
veor q1,q1,q5
veor q8,q7,q4
veor q9,q1,q2
veor q10,q5,q3
veor q11,q2,q4
veor q12,q6,q0
vand q13,q9,q10
vand q14,q8,q12
veor q15,q8,q9
vorr q8,q8,q12
veor q12,q12,q10
vorr q9,q9,q10
vand q10,q15,q12
veor q12,q3,q0
veor q8,q8,q10
vand q11,q11,q12
veor q9,q9,q14
veor q8,q8,q11
veor q9,q9,q11
veor q11,q7,q1
veor q12,q5,q6
veor q13,q13,q14
vorr q15,q11,q12
vand q11,q11,q12
veor q10,q15,q10
veor q11,q13,q11
veor q10,q10,q14
vand q12,q2,q3
vand q13,q4,q0
vand q14,q1,q5
vorr q15,q7,q6
veor q8,q8,q12
veor q9,q9,q13
veor q10,q10,q14
veor q11,q11,q15
veor q12,q8,q9
vand q8,q8,q10
veor q13,q10,q11
veor q14,q11,q8
veor q8,q8,q9
vand q15,q12,q14
vand q8,q13,q8
veor q9,q15,q9
veor q8,q8,q11
veor q13,q14,q8
veor q10,q10,q8
vand q11,q13,q11
veor q13,q5,q3
veor q14,q14,q11
veor q10,q10,q11
vand q11,q14,q9
veor q11,q11,q12
veor q12,q6,q0
veor q14,q9,q11
vand q14,q14,q6
veor q6,q6,q5
vand q5,q5,q9
vand q6,q6,q11
veor q11,q11,q10
veor q9,q9,q8
veor q6,q6,q5
veor q15,q9,q11
veor q5,q5,q14
vand q14,q15,q12
veor q12,q12,q13
vand q13,q13,q9
vand q12,q12,q11
veor q15,q8,q10
veor q13,q13,q12
veor q12,q12,q14
vand q14,q15,q0
veor q0,q0,q3
vand q3,q3,q8
vand q0,q0,q10
veor q6,q6,q12
veor q0,q0,q3
veor q3,q3,q14
veor q0,q0,q12
veor q5,q5,q13
veor q3,q3,q13
veor q12,q7,q4
veor q13,q9,q11
veor q14,q1,q2
vand q13,q13,q12
veor q12,q12,q14
vand q14,q14,q9
vand q12,q12,q11
veor q15,q8,q10
veor q14,q14,q12
veor q12,q12,q13
vand q13,q15,q4
veor q4,q4,q2
vand q2,q2,q8
vand q4,q4,q10
veor q8,q9,q8
veor q9,q11,q10
veor q4,q4,q2
veor q10,q8,q9
veor q2,q2,q13
vand q10,q10,q7
veor q7,q7,q1
vand q1,q1,q8
vand q7,q7,q9
veor q4,q4,q12
veor q7,q7,q1
veor q1,q1,q10
veor q7,q7,q12
veor q1,q1,q14
veor q2,q2,q14
veor q7,q7,q0
veor q1,q1,q6
veor q4,q4,q7
veor q6,q6,q0
veor q8,q0,q1
veor q1,q1,q5
veor q15,q5,q2
veor q2,q2,q3
vorn q14,q14,q14
veor q10,q4,q15
veor q12,q3,q15
veor q13,q7,q14;         vld1.i8 {  q4}, [r3,:128]!
veor q8,q8,q14;          vld1.i8 {  q5}, [r3,:128]
veor q11,q6,q12;         sub r3,r3,#16
veor q9,q1,q14;          vst1.i8 { q12}, [r0,:128]!
veor q14,q2,q14;         vst1.i8 { q13}, [r0,:128]
                         sub r0,r0,#16

# ShiftBytes + MixBytes interleaved
vshl.u8   q0,  q8,  q4;
vshl.u8   q8,  q8,  q5;
vorr      q0,  q0,  q8;

vext.8 d24, d0, d0,#1;   vshl.u8   q7, q15,  q4;
vext.8 d25, d1, d1,#1;   vshl.u8  q15, q15,  q5;
vext.8 d26, d0, d0,#6;   vorr      q7,  q7, q15;
vext.8 d27, d1, d1,#6;   veor      q8,  q0, q12;     # b0_i = a0_i + a0_{i+1}
vext.8 d24,d14,d14,#1;   vshl.u8   q2, q10,  q4;
vext.8 d25,d15,d15,#1;   veor      q0,  q8, q13;     # a0_i = b0_i + a0_{i+6}
vext.8 d26,d14,d14,#6;
vext.8 d27,d15,d15,#6;   veor     q15,  q7, q12;     # b7_i = a7_i + a7_{i+1}
vext.8 d24,d16,d16,#2;   vshl.u8   q3, q11,  q4;
vext.8 d25,d17,d17,#2;   veor      q7, q15, q13;     # a7_i = b7_i + a7_{i+6}
vext.8 d26,d30,d30,#2;
vext.8 d27,d31,d31,#2;   veor      q0,  q0, q12;     # a0_i = a0_i + b0_{i+2}
vext.8 d24,d16,d16,#3;   vshl.u8  q10, q10,  q5;
vext.8 d25,d17,d17,#3;   veor      q7,  q7, q13;     # a7_i = a7_i + b7_{i+2}
vext.8 d26,d30,d30,#3;
vext.8 d27,d31,d31,#3;   vshl.u8  q11, q11,  q5;
vext.8  d0, d0, d0,#4;   veor      q8,  q8, q12;     # b0_i = b0_i + b0_{i+3}
vext.8  d1, d1, d1,#4;   vorr      q2,  q2, q10;
vext.8 d14,d14,d14,#4;   veor     q15, q15, q13;     # b7_i = b7_i + b7_{i+3}
vext.8 d15,d15,d15,#4;

vext.8 d24, d4, d4,#1;   vorr      q3,  q3, q11;
vext.8 d25, d5, d5,#1;
vext.8 d26, d6, d6,#1;   vshl.u8   q6, q14,  q4;
vext.8 d27, d7, d7,#1;   veor     q10,  q2, q12;     # b2_i = a2_i + a2_{i+1}
vext.8 d24, d4, d4,#6;
vext.8 d25, d5, d5,#6;   veor     q11,  q3, q13;     # b3_i = a3_i + a3_{i+1}
vext.8 d26, d6, d6,#6;   vshl.u8   q1,  q9,  q4;
vext.8 d27, d7, d7,#6;   veor      q2, q10, q12;     # a2_i = b2_i + a2_{i+6}
vext.8 d24,d20,d20,#2;
vext.8 d25,d21,d21,#2;   veor      q3, q11, q13;     # a3_i = b3_i + a3_{i+6}
vext.8 d26,d22,d22,#2;   vshl.u8  q14, q14,  q5;
vext.8 d27,d23,d23,#2;   veor      q2,  q2, q12;     # a2_i = a2_i + b2_{i+2}
vext.8 d24,d20,d20,#3;
vext.8 d25,d21,d21,#3;   veor      q3,  q3, q13;     # a3_i = a3_i + b3_{i+2}
vext.8 d26,d22,d22,#3;   vshl.u8   q9,  q9,  q5;
vext.8 d27,d23,d23,#3;   veor     q10, q10, q12;     # b2_i = b2_i + b2_{i+3}
vext.8  d4, d4, d4,#4;
vext.8  d5, d5, d5,#4;   veor     q11, q11, q13;     # b3_i = b3_i + b3_{i+3}
vext.8  d6, d6, d6,#4;   vorr      q6,  q6, q14;
vext.8  d7, d7, d7,#4;   vorr      q1,  q1,  q9;

vext.8 d24,d12,d12,#1;   veor      q8,  q8, q15;     # *2: b0_i = b0_i + b7_i
vext.8 d25,d13,d13,#1;
vext.8 d26, d2, d2,#1;   veor     q10, q10, q15;     # *2: b2_i = b2_i + b7_i
vext.8 d27, d3, d3,#1;   veor     q14,  q6, q12;     # b6_i = a6_i + a6_{i+1}
vext.8 d24,d12,d12,#6;   veor     q11, q11, q15;     # *2: b3_i = b3_i + b7_i
vext.8 d25,d13,d13,#6;   veor      q9,  q1, q13;     # b1_i = a1_i + a1_{i+1}
vext.8 d26, d2, d2,#6;   veor     q10, q10,  q3;     # b2_i = b2_i + a3_{i+4}
vext.8 d27, d3, d3,#6;   veor      q6, q14, q12;     # a6_i = b6_i + a6_{i+6}
vext.8 d24,d18,d18,#2;   veor     q15, q15,  q0;     # b7_i = b7_i + a0_{i+4}
vext.8 d25,d19,d19,#2;   veor      q1,  q9, q13;     # a1_i = b1_i + a1_{i+6}
vext.8 d26,d28,d28,#2;
vext.8 d27,d29,d29,#2;   veor      q1,  q1, q12;     # a1_i = a1_i + b1_{i+2}
vext.8 d24,d18,d18,#3;
vext.8 d25,d19,d19,#3;   veor      q6,  q6, q13;     # a6_i = a6_i + b6_{i+2}
vext.8 d26,d28,d28,#3;
vext.8 d27,d29,d29,#3;   veor      q9,  q9, q12;     # b1_i = b1_i + b1_{i+3}
vext.8  d2, d2, d2,#4;   veor      q9,  q9,  q2;     # b1_i = b1_i + a2_{i+4}
vext.8  d3, d3, d3,#4;   veor     q14, q14, q13;     # b6_i = b6_i + b6_{i+3}
vext.8 d12,d12,d12,#4;   veor      q8,  q8,  q1;     # b0_i = b0_i + a1_{i+4}
vext.8 d13,d13,d13,#4;   veor     q14, q14,  q7;     # b6_i = b6_i + a7_{i+4}

vld1.i8 { q12}, [r0,:128]!
vld1.i8 { q13}, [r0,:128]
sub r0,r0,#16;           veor      q9,  q9, q14;     # *2: b1_i = b1_i + b6_i

vld1.i8 {  q4}, [r3,:128]!
vld1.i8 {  q5}, [r3,:128]
sub r3,r3,#16;           veor     q10, q10, q14;     # *2: b2_i = b2_i + b6_i

vext.8 d16,d16,d16,#3;
vext.8 d17,d17,d17,#3;   veor     q15, q15, q14;     # *2: b7_i = b7_i + b6_i
vext.8 d18,d18,d18,#3;   veor      q2,  q8,  q2;     # a2_i = b0_{i+3} + a2_{i+4}
vext.8 d19,d19,d19,#3;   vshl.u8   q8, q12,  q4;
vext.8 d20,d20,d20,#3;   veor      q3,  q9,  q3;     # a3_i = b1_{i+3} + a3_{i+4}
vext.8 d21,d21,d21,#3;   vshl.u8   q9, q13,  q4;
vext.8 d28,d28,d28,#3;   vshl.u8  q12, q12,  q5;
vext.8 d29,d29,d29,#3;   vshl.u8  q13, q13,  q5;
vext.8 d30,d30,d30,#3;   vorr      q4,  q8, q12;
vext.8 d31,d31,d31,#3;   veor      q0, q14,  q0;     # a0_i = b6_{i+3} + a0_{i+4}
vext.8 d16, d8, d8,#1;   vorr      q5,  q9, q13;
vext.8 d17, d9, d9,#1;   veor      q1, q15,  q1;     # a1_i = b7_{i+3} + a1_{i+4}
vext.8 d18,d10,d10,#1;
vext.8 d19,d11,d11,#1;   veor     q12,  q4,  q8;     # b4_i = a4_i + a4_{i+1}
vext.8 d16, d8, d8,#6;
vext.8 d17, d9, d9,#6;   veor     q13,  q5,  q9;     # b5_i = a5_i + a5_{i+1}
vext.8 d18,d10,d10,#6;
vext.8 d19,d11,d11,#6;   veor      q4, q12,  q8;     # a4_i = b4_i + a4_{i+6}
vext.8 d16,d24,d24,#2;
vext.8 d17,d25,d25,#2;   veor      q5, q13,  q9;     # a5_i = b5_i + a5_{i+6}
vext.8 d18,d26,d26,#2;
vext.8 d19,d27,d27,#2;   veor      q4,  q4,  q8;     # a4_i = a4_i + b4_{i+2}
vext.8 d16,d24,d24,#3;
vext.8 d17,d25,d25,#3;   veor      q5,  q5,  q9;     # a5_i = a5_i + b5_{i+2}
vext.8 d18,d26,d26,#3;
vext.8 d19,d27,d27,#3;   veor     q12, q12,  q8;     # b4_i = b4_i + b4_{i+3}
vext.8  d8, d8, d8,#4;
vext.8  d9, d9, d9,#4;   veor     q13, q13,  q9;     # b5_i = b5_i + b5_{i+3}
vext.8 d10,d10,d10,#4;   veor     q11, q11,  q4;     # b3_i = b3_i + a4_{i+4}
vext.8 d11,d11,d11,#4;   veor     q13, q13,  q6;     # b5_i = b5_i + a6_{i+4}
vext.8 d22,d22,d22,#3;   veor     q12, q12,  q5;     # b4_i = b4_i + a5_{i+4}
vext.8 d23,d23,d23,#3;   veor      q4, q10,  q4;     # a4_i = b2_{i+3} + a4_{i+4}
vext.8 d24,d24,d24,#3;   veor      q5, q11,  q5;     # a5_i = b3_{i+3} + a5_{i+4}
vext.8 d25,d25,d25,#3;
vext.8 d26,d26,d26,#3;   veor      q6, q12,  q6;     # a6_i = b4_{i+3} + a6_{i+4}
vext.8 d27,d27,d27,#3;   veor      q7, q13,  q7;     # a7_i = b5_{i+3} + a7_{i+4}

subs r5,r5,#1
bhi ._roundloop
sub r0,r0,#64

# compute (P + Q)
veor  d0,  d0, d1;
veor  d1,  d2, d3;            # load H_{i-1}
veor  d4,  d4, d5;            vld1.64 {q8},  [r0,:128]!
veor  d5,  d6, d7;            vld1.64 {q9},  [r0,:128]!
veor  d8,  d8, d9;            vld1.64 {q10}, [r0,:128]!
veor  d9, d10, d11;           vld1.64 {q11}, [r0,:128]!
veor d12, d12, d13;           sub r0,r0,#64;
veor d13, d14, d15;

# H_i = H_{i-1} + (P + Q)
veor  q8,  q8, q0;            # store H_i
veor  q9,  q9, q2;            vst1.64 {q8},  [r0,:128]!
veor q10, q10, q4;            vst1.64 {q9},  [r0,:128]!
veor q11, q11, q6;            vst1.64 {q10}, [r0,:128]!
                              vst1.64 {q11}, [r0,:128]!
                              sub r0,r0,#64

add sp,sp,#0
pop {r4-r11}
vpop {q4,q5,q6,q7}
bx lr
