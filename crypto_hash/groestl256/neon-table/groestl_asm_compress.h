/**
 * Groestl implementation of the compression function using ARM NEON.
 *
 * @file     groestl_asm_compress.h
 * @author   David Seywald  <d.seywald@student.tugraz.at>
 *           Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
 *
 */

#define COMPRESS(h,m) {\
  \
  asm volatile (\
    "mov r12, #64 \n"\
    \
    "ldr r11, [%0, #32] \n"    /* address of round 1 constant of P */ \
    "vldm %1, {q12-q15} \n"    /* loading chaining value H */ \
    "vldm %2, {q8-q11} \n"     /* loading message block M */ \
    "veor q0, q8, q12 \n"\
    "veor q1, q9, q13 \n"      /* P = H + M */ \
    "veor q2, q10, q14 \n"\
    "veor q3, q11, q15 \n"\
    "vldm r11, {q4-q7} \n"     /* loading round 1 constant of P */ \
    "veor q0, q0, q4 \n"\
    "veor q1, q1, q5 \n"\
    "veor q2, q2, q6 \n"\
    "veor q3, q3, q7 \n"\
    "vstm %1, {q0-q3} \n"      /* storing P state */ \
    \
    "ldr r11, [%0, #36] \n"    /* address of round 1 constant of Q */ \
    "vldm r11, {q4-q7} \n"     /* loading round 1 constant of Q */ \
    "add r11, %1, #64 \n"\
    "veor q8, q8, q4 \n"\
    "veor q9, q9, q5 \n"\
    "veor q10, q10, q6 \n"\
    "veor q11, q11, q7 \n"\
    "vstm r11, {q8-q11} \n"      /* storing Q state */ \
    \
    "0: \n"\
    \
    "ldr r11, [%0] \n"                 "\n"\
    "ldrb r0, [%1, #0 ] \n"            "\n"\
    "ldrb r1, [%1, #8 ] \n"            "\n"\
    "ldrb r2, [%1, #16] \n"            "\n"\
    "ldrb r3, [%1, #24] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #32] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #40] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #48] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #56] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d0, [r0, :64] \n"         "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d1, [r1, :64] \n"         "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d2, [r2, :64] \n"         "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d3, [r3, :64] \n"         "\n"\
    "vld1.64 d4, [r4, :64] \n"         "\n"\
    "vld1.64 d5, [r5, :64] \n"         "\n"\
    "vld1.64 d6, [r6, :64] \n"         "\n"\
    "vld1.64 d7, [r7, :64] \n"         "\n"\
    \
    \
    "ldrb r0, [%1, #9 ] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #17] \n"            "\n"\
    "ldrb r2, [%1, #25] \n"            "\n"\
    "ldrb r3, [%1, #33] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #41] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #49] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #57] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #1 ] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #18] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #26] \n"            "\n"\
    "ldrb r2, [%1, #34] \n"            "\n"\
    "ldrb r3, [%1, #42] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #50] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #58] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #2 ] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #10] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #27] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #35] \n"            "\n"\
    "ldrb r2, [%1, #43] \n"            "\n"\
    "ldrb r3, [%1, #51] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #59] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #3 ] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #11] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #19] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #36] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #44] \n"            "\n"\
    "ldrb r2, [%1, #52] \n"            "\n"\
    "ldrb r3, [%1, #60] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #4 ] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #12] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #20] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #28] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #45] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #53] \n"            "\n"\
    "ldrb r2, [%1, #61] \n"            "\n"\
    "ldrb r3, [%1, #5 ] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #13] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #21] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #29] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #37] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #54] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #62] \n"            "\n"\
    "ldrb r2, [%1, #6 ] \n"            "\n"\
    "ldrb r3, [%1, #14] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #22] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #30] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #38] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #46] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #63] \n"            "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #7 ] \n"            "\n"\
    "ldrb r2, [%1, #15] \n"            "\n"\
    "ldrb r3, [%1, #23] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #31] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #39] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #47] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #55] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldr r11, [%0, #32] \n"\
    "cmp r12, #640 \n"\
    "beq 1f \n"\
    \
    "add r11, r11, r12 \n"\
    "vldm r11, {q4-q7} \n"\
    "veor q0, q0, q4 \n"\
    "veor q1, q1, q5 \n"\
    "veor q2, q2, q6 \n"\
    "veor q3, q3, q7 \n"\
    \
    "1: \n"\
    \
    "vstm %1, {q0-q3} \n"\
    \
    \
    \
    \
    \
    \
    "ldr r11, [%0] \n"                 "\n"\
    "ldrb r0, [%1, #72 ] \n"           "\n"\
    "ldrb r1, [%1, #80 ] \n"           "\n"\
    "ldrb r2, [%1, #88 ] \n"           "\n"\
    "ldrb r3, [%1, #96 ] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #104] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #112] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #120] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #64 ] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d0, [r0, :64] \n"         "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d1, [r1, :64] \n"         "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d2, [r2, :64] \n"         "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d3, [r3, :64] \n"         "\n"\
    "vld1.64 d4, [r4, :64] \n"         "\n"\
    "vld1.64 d5, [r5, :64] \n"         "\n"\
    "vld1.64 d6, [r6, :64] \n"         "\n"\
    "vld1.64 d7, [r7, :64] \n"         "\n"\
    \
    \
    "ldrb r0, [%1, #89 ] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #97 ] \n"           "\n"\
    "ldrb r2, [%1, #105] \n"           "\n"\
    "ldrb r3, [%1, #113] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #121] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #65 ] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #73 ] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #81 ] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #106] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #114] \n"           "\n"\
    "ldrb r2, [%1, #122] \n"           "\n"\
    "ldrb r3, [%1, #66 ] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #74 ] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #82 ] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #90 ] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #98 ] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #123] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #67 ] \n"           "\n"\
    "ldrb r2, [%1, #75 ] \n"           "\n"\
    "ldrb r3, [%1, #83 ] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #91 ] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #99 ] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #107] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #115] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #68 ] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #76 ] \n"           "\n"\
    "ldrb r2, [%1, #84 ] \n"           "\n"\
    "ldrb r3, [%1, #92 ] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #100] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #108] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #116] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #124] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #85 ] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #93 ] \n"           "\n"\
    "ldrb r2, [%1, #101] \n"           "\n"\
    "ldrb r3, [%1, #109] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #117] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #125] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #69 ] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #77 ] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #102] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #110] \n"           "\n"\
    "ldrb r2, [%1, #118] \n"           "\n"\
    "ldrb r3, [%1, #126] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #70 ] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #78 ] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #86 ] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #94 ] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldrb r0, [%1, #119] \n"           "add r11, r11, #2048 \n"\
    "ldrb r1, [%1, #127] \n"           "\n"\
    "ldrb r2, [%1, #71 ] \n"           "\n"\
    "ldrb r3, [%1, #79 ] \n"           "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #87 ] \n"           "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #95 ] \n"           "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #103] \n"           "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #111] \n"           "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d8,  [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d9,  [r1, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d10, [r2, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d11, [r3, :64] \n"        "\n"\
    "vld1.64 d12, [r4, :64] \n"        "veor q0, q0, q4 \n"\
    "vld1.64 d13, [r5, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r6, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r7, :64] \n"        "veor q3, q3, q7 \n"\
    \
    \
    "ldr r11, [%0, #36] \n"\
    "cmp r12, #640 \n"\
    "beq 2f \n"\
    \
    "add r11, r11, r12 \n"\
    "vldm r11, {q4-q7} \n"\
    "veor q0, q0, q4 \n"\
    "veor q1, q1, q5 \n"\
    "veor q2, q2, q6 \n"\
    "veor q3, q3, q7 \n"\
    \
    "2: \n"\
    \
    "add r11, %1, #64 \n"\
    "vstm r11, {q0-q3} \n"\
    "addne r12, r12, #64 \n"\
    "bne 0b \n"\
    \
    "vldm %1, {q8-q11} \n"\
    "veor q4, q0, q8 \n"\
    "veor q5, q1, q9 \n"\
    "veor q6, q2, q10 \n"\
    "veor q7, q3, q11 \n"\
    "veor q4, q4, q12 \n"\
    "veor q5, q5, q13 \n"\
    "veor q6, q6, q14 \n"\
    "veor q7, q7, q15 \n"\
    "vstm %1, {q4-q7} \n"\
    \
    : : "r"(tables), "r"(h), "r"(m) : \
    "d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","d10","d11","d12","d13","d14","d15",\
    "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29","d30","d31",\
    "r0","r1","r2","r3","r4","r5","r6","r7","r11","r12","memory");\
}
