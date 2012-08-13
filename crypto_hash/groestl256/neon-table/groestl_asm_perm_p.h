/**
 * Groestl implementation of the permutation P using ARM NEON.
 *
 * @file     groestl_core_asm_p.h
 * @author   David Seywald  <d.seywald@student.tugraz.at>
 *           Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
 * 
 */

#define PERM_P(a) {\
  \
  asm volatile (\
    "mov r12, #64 \n"\
    "ldr r11, [%0, #32] \n"\
    "vldm %1, {d0-d7} \n"\
    "vldm r11, {d8-d15} \n"\
    "veor q0, q0, q4 \n"\
    "veor q1, q1, q5 \n"\
    "veor q2, q2, q6 \n"\
    "veor q3, q3, q7 \n"\
    "vstm %1, {d0-d7} \n"\
    \
    "0: \n"\
    \
    "ldr r11, [%0] \n"                 "\n"\
    "ldrb r0, [%1] \n"                 "\n"\
    "ldrb r1, [%1, #8] \n"             "\n"\
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
    "ldr r11, [%0, #4] \n"             "\n"\
    "ldrb r0, [%1, #1] \n"             "\n"\
    "ldrb r1, [%1, #9] \n"             "\n"\
    "ldrb r2, [%1, #17] \n"            "\n"\
    "ldrb r3, [%1, #25] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r4, [%1, #33] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r5, [%1, #41] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r6, [%1, #49] \n"            "add r3, r11, r3, asl #3 \n"\
    "ldrb r7, [%1, #57] \n"            "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d15, [r0, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d8, [r1, :64] \n"         "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d9, [r2, :64] \n"         "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d10, [r3, :64] \n"        "\n"\
    "vld1.64 d11, [r4, :64] \n"        "\n"\
    "vld1.64 d12, [r5, :64] \n"        "\n"\
    "vld1.64 d13, [r6, :64] \n"        "\n"\
    "vld1.64 d14, [r7, :64] \n"        "\n"\
    \
    \
    "ldr r11, [%0, #8] \n"             "\n"\
    "ldrb r0, [%1, #2] \n"             "veor q0, q0, q4 \n"\
    "ldrb r1, [%1, #10] \n"            "veor q1, q1, q5 \n"\
    "ldrb r2, [%1, #18] \n"            "veor q2, q2, q6 \n"\
    "ldrb r3, [%1, #26] \n"            "veor q3, q3, q7 \n"\
    "ldrb r4, [%1, #34] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r5, [%1, #42] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r6, [%1, #50] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r7, [%1, #58] \n"            "add r3, r11, r3, asl #3 \n"\
    "vld1.64 d14, [r0, :64] \n"        "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d15, [r1, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d8, [r2, :64] \n"         "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d9, [r3, :64] \n"         "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d10, [r4, :64] \n"        "\n"\
    "vld1.64 d11, [r5, :64] \n"        "\n"\
    "vld1.64 d12, [r6, :64] \n"        "\n"\
    "vld1.64 d13, [r7, :64] \n"        "\n"\
    \
    \
    "ldr r11, [%0, #12] \n"            "\n"\
    "ldrb r0, [%1, #3] \n"             "veor q0, q0, q4 \n"\
    "ldrb r1, [%1, #11] \n"            "veor q1, q1, q5 \n"\
    "ldrb r2, [%1, #19] \n"            "veor q2, q2, q6 \n"\
    "ldrb r3, [%1, #27] \n"            "veor q3, q3, q7 \n"\
    "ldrb r4, [%1, #35] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r5, [%1, #43] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r6, [%1, #51] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r7, [%1, #59] \n"            "add r3, r11, r3, asl #3 \n"\
    "vld1.64 d13, [r0, :64] \n"        "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d14, [r1, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d15, [r2, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d8, [r3, :64] \n"         "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d9, [r4, :64] \n"         "\n"\
    "vld1.64 d10, [r5, :64] \n"        "\n"\
    "vld1.64 d11, [r6, :64] \n"        "\n"\
    "vld1.64 d12, [r7, :64] \n"        "\n"\
    \
    \
    "ldr r11, [%0, #16] \n"            "\n"\
    "ldrb r0, [%1, #4] \n"             "veor q0, q0, q4 \n"\
    "ldrb r1, [%1, #12] \n"            "veor q1, q1, q5 \n"\
    "ldrb r2, [%1, #20] \n"            "veor q2, q2, q6 \n"\
    "ldrb r3, [%1, #28] \n"            "veor q3, q3, q7 \n"\
    "ldrb r4, [%1, #36] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r5, [%1, #44] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r6, [%1, #52] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r7, [%1, #60] \n"            "add r3, r11, r3, asl #3 \n"\
    "vld1.64 d12, [r0, :64] \n"        "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d13, [r1, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d14, [r2, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d15, [r3, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d8, [r4, :64] \n"         "\n"\
    "vld1.64 d9, [r5, :64] \n"         "\n"\
    "vld1.64 d10, [r6, :64] \n"        "\n"\
    "vld1.64 d11, [r7, :64] \n"        "\n"\
    \
    \
    "ldr r11, [%0, #20] \n"            "\n"\
    "ldrb r0, [%1, #5] \n"             "veor q0, q0, q4 \n"\
    "ldrb r1, [%1, #13] \n"            "veor q1, q1, q5 \n"\
    "ldrb r2, [%1, #21] \n"            "veor q2, q2, q6 \n"\
    "ldrb r3, [%1, #29] \n"            "veor q3, q3, q7 \n"\
    "ldrb r4, [%1, #37] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r5, [%1, #45] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r6, [%1, #53] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r7, [%1, #61] \n"            "add r3, r11, r3, asl #3 \n"\
    "vld1.64 d11, [r0, :64] \n"        "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d12, [r1, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d13, [r2, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d14, [r3, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d15, [r4, :64] \n"        "\n"\
    "vld1.64 d8, [r5, :64] \n"         "\n"\
    "vld1.64 d9, [r6, :64] \n"         "\n"\
    "vld1.64 d10, [r7, :64] \n"        "\n"\
    \
    \
    "ldr r11, [%0, #24] \n"            "\n"\
    "ldrb r0, [%1, #6] \n"             "veor q0, q0, q4 \n"\
    "ldrb r1, [%1, #14] \n"            "veor q1, q1, q5 \n"\
    "ldrb r2, [%1, #22] \n"            "veor q2, q2, q6 \n"\
    "ldrb r3, [%1, #30] \n"            "veor q3, q3, q7 \n"\
    "ldrb r4, [%1, #38] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r5, [%1, #46] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r6, [%1, #54] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r7, [%1, #62] \n"            "add r3, r11, r3, asl #3 \n"\
    "vld1.64 d10, [r0, :64] \n"        "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d11, [r1, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d12, [r2, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d13, [r3, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d14, [r4, :64] \n"        "\n"\
    "vld1.64 d15, [r5, :64] \n"        "\n"\
    "vld1.64 d8, [r6, :64] \n"         "\n"\
    "vld1.64 d9, [r7, :64] \n"         "\n"\
    \
    \
    "ldr r11, [%0, #28] \n"            "\n"\
    "ldrb r0, [%1, #7] \n"             "veor q0, q0, q4 \n"\
    "ldrb r1, [%1, #15] \n"            "veor q1, q1, q5 \n"\
    "ldrb r2, [%1, #23] \n"            "veor q2, q2, q6 \n"\
    "ldrb r3, [%1, #31] \n"            "veor q3, q3, q7 \n"\
    "ldrb r4, [%1, #39] \n"            "add r0, r11, r0, asl #3 \n"\
    "ldrb r5, [%1, #47] \n"            "add r1, r11, r1, asl #3 \n"\
    "ldrb r6, [%1, #55] \n"            "add r2, r11, r2, asl #3 \n"\
    "ldrb r7, [%1, #63] \n"            "add r3, r11, r3, asl #3 \n"\
    "vld1.64 d9, [r0, :64] \n"         "add r4, r11, r4, asl #3 \n"\
    "vld1.64 d10, [r1, :64] \n"        "add r5, r11, r5, asl #3 \n"\
    "vld1.64 d11, [r2, :64] \n"        "add r6, r11, r6, asl #3 \n"\
    "vld1.64 d12, [r3, :64] \n"        "add r7, r11, r7, asl #3 \n"\
    "vld1.64 d13, [r4, :64] \n"        "veor q1, q1, q5 \n"\
    "vld1.64 d14, [r5, :64] \n"        "veor q2, q2, q6 \n"\
    "vld1.64 d15, [r6, :64] \n"        "veor q3, q3, q7 \n"\
    "vld1.64 d8, [r7, :64] \n"         "veor q0, q0, q4 \n"\
    \
    \
    "ldr r11, [%0, #32] \n"\
    "cmp r12, #640 \n"\
    "beq 1f \n"\
    \
    "add r11, r11, r12 \n"\
    "vldm r11, {d8-d15} \n"\
    "veor q0, q0, q4 \n"\
    "veor q1, q1, q5 \n"\
    "veor q2, q2, q6 \n"\
    "veor q3, q3, q7 \n"\
    \
    "1: \n"\
    \
    "vstm %1, {d0-d7} \n"\
    "addne r12, r12, #64 \n"\
    "bne 0b \n"\
    \
    : : "r"(tables), "r"(a) : \
    "d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","d10","d11","d12","d13","d14",\
    "d15","r0","r1","r2","r3","r4","r5","r6","r7","r11","r12","memory");\
}
