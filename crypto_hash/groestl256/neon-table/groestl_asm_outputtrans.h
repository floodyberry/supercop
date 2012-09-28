/**
 * Groestl implementation of the output transformation using ARM NEON.
 *
 * @file     groestl_asm_outputtrans.h
 * @author   David Seywald  <d.seywald@student.tugraz.at>
 *           Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
 * 
 */

#define OUTPUTTRANS(p) {\
  \
  asm volatile (\
    ".arm \n"\
    ".fpu neon \n"\
    ".text \n"\
    ".align 4 \n"\
    \
    \
    "mov r14, #9 \n"\
    "vldm %[P], {q12-q15} \n"          /* load chaining value CTX */ \
    \
    "vld1.8 {q4},[%[C], :128]! \n"     /* load round 1 constant of P */ \
    "vld1.8 {q5},[%[C], :128]! \n"\
    "vld1.8 {q6},[%[C], :128]! \n"\
    "vld1.8 {q7},[%[C], :128]! \n"\
    "add %[C], %[C], #64 \n"           /* add offset for Q constants */ \
    "veor q0, q12, q4 \n"              /* AddRoundConstant of P */ \
    "veor q1, q13, q5 \n"\
    "veor q2, q14, q6 \n"\
    "veor q3, q15, q7 \n"\
    \
    "vstm %[P], {q0-q3} \n"            /* store P state */ \
    \
    \
    \
    \
    "0: \n"\
    \
    /* ROW 0 */ \
    "ldrb r0, [%[P], #0 ] \n"          "\n"\
    "ldrb r1, [%[P], #8 ] \n"          "\n"\
    "ldrb r2, [%[P], #16] \n"          "\n"\
    "ldrb r3, [%[P], #24] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #32] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #40] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #48] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #56] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d0, [r0, :64] \n"         "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d1, [r1, :64] \n"         "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d2, [r2, :64] \n"         "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d3, [r3, :64] \n"         "\n"\
    "vld1.64 d4, [r4, :64] \n"         "\n"\
    "vld1.64 d5, [r5, :64] \n"         "\n"\
    "vld1.64 d6, [r6, :64] \n"         "\n"\
    "vld1.64 d7, [r7, :64] \n"         "\n"\
    \
    \
    /* ROW 1 */ \
    "ldrb r0, [%[P], #9 ] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #17] \n"          "\n"\
    "ldrb r2, [%[P], #25] \n"          "\n"\
    "ldrb r3, [%[P], #33] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #41] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #49] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #57] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #1 ] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    /* ROW 2 */ \
    "ldrb r0, [%[P], #18] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #26] \n"          "\n"\
    "ldrb r2, [%[P], #34] \n"          "\n"\
    "ldrb r3, [%[P], #42] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #50] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #58] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #2 ] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #10] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    /* ROW 3 */ \
    "ldrb r0, [%[P], #27] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #35] \n"          "\n"\
    "ldrb r2, [%[P], #43] \n"          "\n"\
    "ldrb r3, [%[P], #51] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #59] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #3 ] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #11] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #19] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    /* ROW 4 */ \
    "ldrb r0, [%[P], #36] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #44] \n"          "\n"\
    "ldrb r2, [%[P], #52] \n"          "\n"\
    "ldrb r3, [%[P], #60] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #4 ] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #12] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #20] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #28] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    /* ROW 5 */ \
    "ldrb r0, [%[P], #45] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #53] \n"          "\n"\
    "ldrb r2, [%[P], #61] \n"          "\n"\
    "ldrb r3, [%[P], #5 ] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #13] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #21] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #29] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #37] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    /* ROW 6 */ \
    "ldrb r0, [%[P], #54] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #62] \n"          "\n"\
    "ldrb r2, [%[P], #6 ] \n"          "\n"\
    "ldrb r3, [%[P], #14] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #22] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #30] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #38] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #46] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    /* ROW 7 */ \
    "ldrb r0, [%[P], #63] \n"          "add %[T], %[T], #2048 \n"\
    "ldrb r1, [%[P], #7 ] \n"          "\n"\
    "ldrb r2, [%[P], #15] \n"          "\n"\
    "ldrb r3, [%[P], #23] \n"          "add r0, %[T], r0, asl #3 \n"\
    "ldrb r4, [%[P], #31] \n"          "add r1, %[T], r1, asl #3 \n"\
    "ldrb r5, [%[P], #39] \n"          "add r2, %[T], r2, asl #3 \n"\
    "ldrb r6, [%[P], #47] \n"          "add r3, %[T], r3, asl #3 \n"\
    "ldrb r7, [%[P], #55] \n"          "add r4, %[T], r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, %[T], r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, %[T], r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, %[T], r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    \
    \
    "sub %[T], %[T], #14336 \n"        /* restore pointer to tables */ \
    "cmp r14, #0 \n"\
    "beq 1f \n"\
    \
    "vld1.8 {q4},[%[C], :128]! \n"     /* load next round constant of P */ \
    "vld1.8 {q5},[%[C], :128]! \n"\
    "vld1.8 {q6},[%[C], :128]! \n"\
    "vld1.8 {q7},[%[C], :128]! \n"\
    "add %[C], %[C], #64 \n"           /* add offset for Q constants */ \
    "veor q0, q0, q4 \n"\
    "veor q1, q1, q5 \n"               /* AddRoundConstant of P */ \
    "veor q2, q2, q6 \n"\
    "veor q3, q3, q7 \n"\
    \
    "1: \n"\
    \
    "vstmne %[P], {q0-q3} \n"          /* store P state */ \
    "subne r14, r14, #1 \n"\
    "bne 0b \n"\
    \
    \
    \
    \
    "veor q0, q0, q12 \n"\
    "veor q1, q1, q13 \n"              /* CTX = CTX + P */ \
    "veor q2, q2, q14 \n"\
    "veor q3, q3, q15 \n"\
    "vstm %[P], {q0-q3} \n"\
    "sub %[C], %[C], #1280 \n"         /* restore pointer to round constants */ \
    \
    \
    : : [P]"r"(p), [T]"r"(TABLES), [C]"r"(CONSTS) : \
    "d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","d10","d11","d12","d13","d14","d15",\
    "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29","d30","d31",\
    "r0","r1","r2","r3","r4","r5","r6","r7","r14","memory");\
}
