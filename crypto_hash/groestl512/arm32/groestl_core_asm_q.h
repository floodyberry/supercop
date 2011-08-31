/**
 * Groestl implementation.
 *
 * ==========================(LICENSE BEGIN)============================
 *
 * Copyright (c) 2007-2010  Projet RNRT SAPHIR
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * ===========================(LICENSE END)=============================
 *
 * @file     groestl_core_asm_q.h
 * @author   Wolfgang Wieser <w.wieser@student.tugraz.at>
 *
 * This code is based on works of Thomas Pornin and Projet RNRT SAPHIR
 * and was adapted to tweaks of GROESTL for third round of SHA-3 competition.
 * It is part of a collection of header files, which implements GROESTL's
 * functions in C and assembler, optimized for 32-Bit ARM processors.
 */

//=============================================================================
//===========  FUNCTIONS FOR SMALL GROESTL ====================================
//=============================================================================
				 
#define PERM_SMALL_Q(a) {                         \
\
    INIT(a);                                      \
\
    asm volatile(                                 \
      "\n b START_Q                              "\
      "\n LIST_Q:                                "\
      "\n        .word T0up                      "\
      "\n START_Q:                               "\
      "\n        ldr ip, LIST_Q+0                "\
      "\n        mov fp, #0                      "\
      "\n        ldrb r0, [sp, #8]               "\
      "\n        add lr, ip, #4096               "\
      "\n        ldrb r1, [sp, #25]              "\
      "\n        ldrb r4, [sp, #4]               "\
\
      "\n LOOP_Q:                                "\
      "\n        ldrb r5, [sp, #21]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #42]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #59]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #38]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #55]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x60             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #16]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #33]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #12]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #64]              "\
      "\n        str  r5, [sp, #68]              "\
\
      "\n        ldrb r5, [sp, #29]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #50]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #3]               "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #46]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #63]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x70             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #24]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #41]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #20]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #72]              "\
      "\n        str  r5, [sp, #76]              "\
\
      "\n        ldrb r5, [sp, #37]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #58]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #11]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #54]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #7]               "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, fp                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #32]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #49]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #28]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #80]              "\
      "\n        str  r5, [sp, #84]              "\
\
      "\n        ldrb r5, [sp, #45]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #2]               "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #19]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #62]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #15]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x10             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #40]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #57]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #36]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #88]              "\
      "\n        str  r5, [sp, #92]              "\
\
      "\n        ldrb r5, [sp, #53]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #10]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #27]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #6]               "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #23]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x20             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #48]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #1]               "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #44]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #96]              "\
      "\n        str  r5, [sp, #100]             "\
\
      "\n        ldrb r5, [sp, #61]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #18]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #35]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #14]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #31]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x30             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #56]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #9]               "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #52]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #104]             "\
      "\n        str  r5, [sp, #108]             "\
\
      "\n        ldrb r5, [sp, #5]               "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #26]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #43]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #22]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #39]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x40             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #0]               "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #17]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #60]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #112]             "\
      "\n        str  r5, [sp, #116]             "\
\
      "\n        ldrb r5, [sp, #13]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #34]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #51]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #30]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #47]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x50             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #72]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #89]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #68]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #120]             "\
      "\n        str  r5, [sp, #124]             "\
\
\
\
\
\
      "\n        ldrb r5, [sp, #85]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #106]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #123]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #102]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #119]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x61             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #80]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #97]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #76]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #0]               "\
      "\n        str  r5, [sp, #4]               "\
\
      "\n        ldrb r5, [sp, #93]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #114]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #67]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #110]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #127]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x71             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #88]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #105]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #84]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #8]               "\
      "\n        str  r5, [sp, #12]              "\
\
      "\n        ldrb r5, [sp, #101]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #122]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #75]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #118]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #71]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x01             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #96]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #113]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #92]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #16]              "\
      "\n        str  r5, [sp, #20]              "\
\
      "\n        ldrb r5, [sp, #109]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #66]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #83]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #126]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #79]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x11             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #104]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #121]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #100]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #24]              "\
      "\n        str  r5, [sp, #28]              "\
\
      "\n        ldrb r5, [sp, #117]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #74]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #91]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #70]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #87]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x21             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #112]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #65]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #108]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #32]              "\
      "\n        str  r5, [sp, #36]              "\
\
      "\n        ldrb r5, [sp, #125]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #82]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #99]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #78]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #95]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x31             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #120]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #73]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #116]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #40]              "\
      "\n        str  r5, [sp, #44]              "\
\
      "\n        ldrb r5, [sp, #69]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #90]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #107]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #86]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #103]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x41             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #64]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #81]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #124]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #48]              "\
      "\n        str  r5, [sp, #52]              "\
\
      "\n        ldrb r5, [sp, #77]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #98]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #115]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #94]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #111]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x51             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #8]               "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #25]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #4]               "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #56]              "\
      "\n        cmp  fp,  #8                    "\
      "\n        str  r5, [sp, #60]              "\
\
      "\n        addne fp, fp, #2                "\
      "\n        bne   LOOP_Q                    "\
      "\n        ldr   sp, [sp, #256]            "\
      :                                           \
      :                                           \
      : "r0", "r1", "r2", "r3", "r4", "r5", "r6", \
        "r7", "r8", "r9", "sl", "fp", "ip", "lr"  \
    );                                            \
}

//=============================================================================
//===========  FUNCTIONS FOR BIG GROESTL   ====================================
//=============================================================================


#define PERM_BIG_Q(a) {                           \
\
    INIT(a); \
\
    asm volatile(                                 \
      "\n b START_QB                             "\
      "\n LIST_QB:                               "\
      "\n        .word T0up                      "\
      "\n START_QB:                              "\
      "\n        ldr ip, LIST_QB+0               "\
      "\n        mov fp, #0                      "\
      "\n        ldrb r0, [sp, #8]               "\
      "\n        add lr, ip, #4096               "\
      "\n        ldrb r1, [sp, #25]              "\
      "\n        ldrb r4, [sp, #4]               "\
\
      "\n LOOP_QB:                               "\
      "\n        ldrb r5, [sp, #21]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #42]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #91]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #38]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #55]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x60             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #16]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #33]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #12]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #128]             "\
      "\n        str  r5, [sp, #132]             "\
\
      "\n        ldrb r5, [sp, #29]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #50]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #99]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #46]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #63]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x70             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #24]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #41]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #20]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #136]             "\
      "\n        str  r5, [sp, #140]             "\
\
      "\n        ldrb r5, [sp, #37]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #58]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #107]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #54]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #71]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x80             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #32]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #49]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #28]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #144]             "\
      "\n        str  r5, [sp, #148]             "\
\
      "\n        ldrb r5, [sp, #45]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #66]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #115]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #62]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #79]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x90             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #40]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #57]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #36]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #152]             "\
      "\n        str  r5, [sp, #156]             "\
\
      "\n        ldrb r5, [sp, #53]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #74]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #123]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #70]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #87]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xA0             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #48]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #65]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #44]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #160]             "\
      "\n        str  r5, [sp, #164]             "\
\
      "\n        ldrb r5, [sp, #61]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #82]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #3]               "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #78]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #95]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xB0             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #56]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #73]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #52]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #168]             "\
      "\n        str  r5, [sp, #172]             "\
\
      "\n        ldrb r5, [sp, #69]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #90]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #11]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #86]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #103]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xC0             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #64]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #81]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #60]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #176]             "\
      "\n        str  r5, [sp, #180]             "\
\
      "\n        ldrb r5, [sp, #77]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #98]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #19]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #94]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #111]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xD0             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #72]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #89]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #68]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #184]             "\
      "\n        str  r5, [sp, #188]             "\
\
      "\n        ldrb r5, [sp, #85]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #106]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #27]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #102]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #119]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xE0             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #80]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #97]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #76]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #192]             "\
      "\n        str  r5, [sp, #196]             "\
\
      "\n        ldrb r5, [sp, #93]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #114]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #35]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #110]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #127]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xF0             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #88]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #105]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #84]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #200]             "\
      "\n        str  r5, [sp, #204]             "\
\
      "\n        ldrb r5, [sp, #101]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #122]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #43]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #118]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #7]               "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, fp                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #96]              "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #113]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #92]              "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #208]             "\
      "\n        str  r5, [sp, #212]             "\
\
      "\n        ldrb r5, [sp, #109]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #2]               "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #51]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #126]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #15]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x10             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #104]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #121]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #100]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #216]             "\
      "\n        str  r5, [sp, #220]             "\
\
      "\n        ldrb r5, [sp, #117]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #10]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #59]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #6]               "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #23]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x20             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #112]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #1]               "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #108]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #224]             "\
      "\n        str  r5, [sp, #228]             "\
\
      "\n        ldrb r5, [sp, #125]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #18]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #67]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #14]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #31]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x30             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #120]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #9]               "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #116]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #232]             "\
      "\n        str  r5, [sp, #236]             "\
\
      "\n        ldrb r5, [sp, #5]               "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #26]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #75]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #22]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #39]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x40             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #0]               "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #17]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #124]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #240]             "\
      "\n        str  r5, [sp, #244]             "\
\
      "\n        ldrb r5, [sp, #13]              "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #34]              "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #83]              "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #30]              "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #47]              "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x50             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #136]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #153]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #132]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #248]             "\
      "\n        str  r5, [sp, #252]             "\
\
\
\
\
\
      "\n        ldrb r5, [sp, #149]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #170]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #219]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #166]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #183]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x61             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #144]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #161]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #140]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #0]               "\
      "\n        str  r5, [sp, #4]               "\
\
      "\n        ldrb r5, [sp, #157]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #178]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #227]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #174]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #191]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x71             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #152]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #169]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #148]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #8]               "\
      "\n        str  r5, [sp, #12]              "\
\
      "\n        ldrb r5, [sp, #165]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #186]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #235]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #182]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #199]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x81             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #160]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #177]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #156]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #16]              "\
      "\n        str  r5, [sp, #20]              "\
\
      "\n        ldrb r5, [sp, #173]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #194]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #243]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #190]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #207]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x91             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #168]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #185]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #164]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #24]              "\
      "\n        str  r5, [sp, #28]              "\
\
      "\n        ldrb r5, [sp, #181]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #202]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #251]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #198]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #215]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xA1             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #176]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #193]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #172]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #32]              "\
      "\n        str  r5, [sp, #36]              "\
\
      "\n        ldrb r5, [sp, #189]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #210]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #131]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #206]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #223]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xB1             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #184]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #201]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #180]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #40]              "\
      "\n        str  r5, [sp, #44]              "\
\
      "\n        ldrb r5, [sp, #197]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #218]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #139]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #214]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #231]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xC1             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #192]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #209]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #188]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #48]              "\
      "\n        str  r5, [sp, #52]              "\
\
      "\n        ldrb r5, [sp, #205]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #226]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #147]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #222]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #239]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xD1             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #200]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #217]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #196]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #56]              "\
      "\n        str  r5, [sp, #60]              "\
\
      "\n        ldrb r5, [sp, #213]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #234]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #155]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #230]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #247]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xE1             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #208]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #225]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #204]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #64]              "\
      "\n        str  r5, [sp, #68]              "\
\
      "\n        ldrb r5, [sp, #221]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #242]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #163]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #238]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #255]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0xF1             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #216]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #233]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #212]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #72]              "\
      "\n        str  r5, [sp, #76]              "\
\
      "\n        ldrb r5, [sp, #229]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #250]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #171]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #246]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #135]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x01             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #224]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #241]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #220]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #80]              "\
      "\n        str  r5, [sp, #84]              "\
\
      "\n        ldrb r5, [sp, #237]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #130]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #179]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #254]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #143]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x11             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #232]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #249]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #228]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #88]              "\
      "\n        str  r5, [sp, #92]              "\
\
      "\n        ldrb r5, [sp, #245]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #138]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #187]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #134]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #151]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x21             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #240]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #129]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #236]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #96]              "\
      "\n        str  r5, [sp, #100]             "\
\
      "\n        ldrb r5, [sp, #253]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #146]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #195]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #142]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #159]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x31             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #248]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #137]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #244]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #104]             "\
      "\n        str  r5, [sp, #108]             "\
\
      "\n        ldrb r5, [sp, #133]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #154]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #203]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #150]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #167]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x41             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #128]             "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #145]             "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #252]             "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #112]             "\
      "\n        str  r5, [sp, #116]             "\
\
      "\n        ldrb r5, [sp, #141]             "\
      "\n        sub  r0,  ip, r0, asl #2        "\
      "\n        ldrb r2, [sp, #162]             "\
      "\n        sub  r1,  ip, r1, asl #2        "\
      "\n        ldrb r3, [sp, #211]             "\
      "\n        sub  r4,  ip, r4, asl #2        "\
      "\n        ldrb r6, [sp, #158]             "\
      "\n        sub  r5,  ip, r5, asl #2        "\
      "\n        ldrb r7, [sp, #175]             "\
      "\n        sub  r2,  lr, r2, asl #2        "\
      "\n        ldr  r8, [r0, #1020]            "\
      "\n        sub  r3,  lr, r3, asl #2        "\
      "\n        ldr  sl, [r1, #3068]            "\
      "\n        sub  r6,  lr, r6, asl #2        "\
      "\n        ldr  r0, [r0, #2044]            "\
      "\n        add  r9,  fp, #0x51             "\
      "\n        ldr  r1, [r1, #4092]            "\
      "\n        eor  r7,  r7, r9                "\
      "\n        ldr  r9, [r4, #2044]            "\
      "\n        sub  r7,  lr, r7, asl #2        "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r5, #4092]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r4, [r4, #1020]            "\
      "\n        ldr  r5, [r5, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r2, #1020]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r3, #3068]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r2, [r2, #2044]            "\
      "\n        eor  r0,  r0, r5                "\
      "\n        ldr  r3, [r3, #4092]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldr  r9, [r6, #2044]            "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldr  sl, [r7, #4092]            "\
      "\n        eor  r5,  r0, r2                "\
      "\n        ldr  r6, [r6, #1020]            "\
      "\n        eor  r5,  r5, r3                "\
      "\n        ldr  r7, [r7, #3068]            "\
      "\n        eor  r8,  r8, r9                "\
      "\n        ldrb r0, [sp, #8]               "\
      "\n        eor  r8,  r8, sl                "\
      "\n        ldrb r1, [sp, #25]              "\
      "\n        eor  r5,  r5, r6                "\
      "\n        ldrb r4, [sp, #4]               "\
      "\n        eor  r5,  r5, r7                "\
      "\n        str  r8, [sp, #120]             "\
      "\n        cmp   fp,  #12                  "\
      "\n        str  r5, [sp, #124]             "\
\
      "\n        addne fp, fp, #2                "\
      "\n        bne   LOOP_QB                   "\
      "\n        ldr   sp, [sp, #256]            "\
      :                                           \
      :                                           \
      : "r0", "r1", "r2", "r3", "r4", "r5", "r6", \
        "r7", "r8", "r9", "sl", "fp", "ip", "lr"  \
    );                                            \
}

