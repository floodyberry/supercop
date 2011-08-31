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
 * @file     groestl_core_asm_p.h
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

#define PERM_SMALL_P(a) {                         \
\
    INIT(a); \
\
    asm volatile(                                 \
      "\n b START_P                              "\
      "\n LIST_P:                                "\
      "\n        .word T0up                      "\
      "\n START_P:                               "\
      "\n        ldr ip, LIST_P+0                "\
      "\n        mov fp, #0                      "\
      "\n        ldrb r0, [sp, #18]              "\
      "\n        add lr, ip, #4096               "\
      "\n        ldrb r1, [sp, #27]              "\
      "\n        ldrb r2, [sp, #54]              "\
\
      "\n LOOP_P:                                "\
      "\n        ldrb r3, [sp, #63]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #0]               "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #9]               "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #36]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #45]              "\
      "\n        add  r8,  fp, #0x00             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #26]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #35]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #62]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #64]              "\
      "\n        str  r4, [sp, #68]              "\
\
      "\n        ldrb r3, [sp, #7]               "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #8]               "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #17]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #44]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #53]              "\
      "\n        add  r8,  fp, #0x10             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #34]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #43]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #6]               "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #72]              "\
      "\n        str  r4, [sp, #76]              "\
\
      "\n        ldrb r3, [sp, #15]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #16]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #25]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #52]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #61]              "\
      "\n        add  r8,  fp, #0x20             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #42]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #51]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #14]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #80]              "\
      "\n        str  r4, [sp, #84]              "\
\
      "\n        ldrb r3, [sp, #23]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #24]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #33]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #60]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #5]               "\
      "\n        add  r8,  fp, #0x30             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #50]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #59]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #22]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #88]              "\
      "\n        str  r4, [sp, #92]              "\
\
      "\n        ldrb r3, [sp, #31]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #32]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #41]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #4]               "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #13]              "\
      "\n        add  r8,  fp, #0x40             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #58]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #3]               "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #30]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #96]              "\
      "\n        str  r4, [sp, #100]             "\
\
      "\n        ldrb r3, [sp, #39]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #40]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #49]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #12]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #21]              "\
      "\n        add  r8,  fp, #0x50             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #2]               "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #11]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #38]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #104]             "\
      "\n        str  r4, [sp, #108]             "\
\
      "\n        ldrb r3, [sp, #47]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #48]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #57]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #20]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #29]              "\
      "\n        add  r8,  fp, #0x60             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #10]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #19]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #46]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #112]             "\
      "\n        str  r4, [sp, #116]             "\
\
      "\n        ldrb r3, [sp, #55]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #56]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #1]               "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #28]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #37]              "\
      "\n        add  r8,  fp, #0x70             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #82]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #91]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #118]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #120]             "\
      "\n        str  r4, [sp, #124]             "\
\
\
\
\
\
      "\n        ldrb r3, [sp, #127]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #64]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #73]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #100]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #109]             "\
      "\n        add  r8,  fp, #0x01             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #90]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #99]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #126]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #0]               "\
      "\n        str  r4, [sp, #4]               "\
\
      "\n        ldrb r3, [sp, #71]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #72]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #81]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #108]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #117]             "\
      "\n        add  r8,  fp, #0x11             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #98]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #107]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #70]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #8]               "\
      "\n        str  r4, [sp, #12]              "\
\
      "\n        ldrb r3, [sp, #79]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #80]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #89]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #116]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #125]             "\
      "\n        add  r8,  fp, #0x21             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #106]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #115]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #78]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #16]              "\
      "\n        str  r4, [sp, #20]              "\
\
      "\n        ldrb r3, [sp, #87]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #88]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #97]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #124]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #69]              "\
      "\n        add  r8,  fp, #0x31             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #114]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #123]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #86]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #24]              "\
      "\n        str  r4, [sp, #28]              "\
\
      "\n        ldrb r3, [sp, #95]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #96]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #105]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #68]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #77]              "\
      "\n        add  r8,  fp, #0x41             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #122]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #67]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #94]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #32]              "\
      "\n        str  r4, [sp, #36]              "\
\
      "\n        ldrb r3, [sp, #103]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #104]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #113]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #76]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #85]              "\
      "\n        add  r8,  fp, #0x51             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #66]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #75]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #102]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #40]              "\
      "\n        str  r4, [sp, #44]              "\
\
      "\n        ldrb r3, [sp, #111]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #112]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #121]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #84]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #93]              "\
      "\n        add  r8,  fp, #0x61             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #74]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #83]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #110]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #48]              "\
      "\n        str  r4, [sp, #52]              "\
\
      "\n        ldrb r3, [sp, #119]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #120]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #65]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #92]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #101]             "\
      "\n        add  r8,  fp, #0x71             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #18]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #27]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #54]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #56]              "\
      "\n        cmp  fp,  #8                    "\
      "\n        str  r4, [sp, #60]              "\
\
      "\n        addne fp, fp, #2                "\
      "\n        bne   LOOP_P                    "\
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

#define PERM_BIG_P(a) {                           \
\
    INIT(a); \
\
    asm volatile(                                 \
      "\n b START_PB                             "\
      "\n LIST_PB:                               "\
      "\n        .word T0up                      "\
      "\n START_PB:                              "\
      "\n        ldr ip, LIST_PB+0               "\
      "\n        mov fp, #0                      "\
      "\n        ldrb r0, [sp, #18]              "\
      "\n        add lr, ip, #4096               "\
      "\n        ldrb r1, [sp, #27]              "\
      "\n        ldrb r2, [sp, #54]              "\
\
      "\n LOOP_PB:                               "\
      "\n        ldrb r3, [sp, #95]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #0]               "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #9]               "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #36]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #45]              "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, fp                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #26]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #35]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #62]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #128]             "\
      "\n        str  r4, [sp, #132]             "\
\
      "\n        ldrb r3, [sp, #103]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #8]               "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #17]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #44]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #53]              "\
      "\n        add  r8,  fp, #0x10             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #34]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #43]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #70]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #136]             "\
      "\n        str  r4, [sp, #140]             "\
\
      "\n        ldrb r3, [sp, #111]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #16]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #25]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #52]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #61]              "\
      "\n        add  r8,  fp, #0x20             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #42]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #51]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #78]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #144]             "\
      "\n        str  r4, [sp, #148]             "\
\
      "\n        ldrb r3, [sp, #119]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #24]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #33]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #60]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #69]              "\
      "\n        add  r8,  fp, #0x30             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #50]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #59]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #86]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #152]             "\
      "\n        str  r4, [sp, #156]             "\
\
      "\n        ldrb r3, [sp, #127]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #32]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #41]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #68]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #77]              "\
      "\n        add  r8,  fp, #0x40             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #58]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #67]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #94]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #160]             "\
      "\n        str  r4, [sp, #164]             "\
\
      "\n        ldrb r3, [sp, #7]               "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #40]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #49]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #76]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #85]              "\
      "\n        add  r8,  fp, #0x50             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #66]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #75]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #102]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #168]             "\
      "\n        str  r4, [sp, #172]             "\
\
      "\n        ldrb r3, [sp, #15]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #48]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #57]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #84]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #93]              "\
      "\n        add  r8,  fp, #0x60             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #74]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #83]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #110]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #176]             "\
      "\n        str  r4, [sp, #180]             "\
\
      "\n        ldrb r3, [sp, #23]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #56]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #65]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #92]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #101]             "\
      "\n        add  r8,  fp, #0x70             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #82]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #91]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #118]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #184]             "\
      "\n        str  r4, [sp, #188]             "\
\
      "\n        ldrb r3, [sp, #31]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #64]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #73]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #100]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #109]             "\
      "\n        add  r8,  fp, #0x80             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #90]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #99]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #126]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #192]             "\
      "\n        str  r4, [sp, #196]             "\
\
      "\n        ldrb r3, [sp, #39]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #72]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #81]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #108]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #117]             "\
      "\n        add  r8,  fp, #0x90             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #98]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #107]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #6]               "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #200]             "\
      "\n        str  r4, [sp, #204]             "\
\
      "\n        ldrb r3, [sp, #47]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #80]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #89]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #116]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #125]             "\
      "\n        add  r8,  fp, #0xA0             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #106]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #115]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #14]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #208]             "\
      "\n        str  r4, [sp, #212]             "\
\
      "\n        ldrb r3, [sp, #55]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #88]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #97]              "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #124]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #5]               "\
      "\n        add  r8,  fp, #0xB0             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #114]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #123]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #22]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #216]             "\
      "\n        str  r4, [sp, #220]             "\
\
      "\n        ldrb r3, [sp, #63]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #96]              "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #105]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #4]               "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #13]              "\
      "\n        add  r8,  fp, #0xC0             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #122]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #3]               "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #30]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #224]             "\
      "\n        str  r4, [sp, #228]             "\
\
      "\n        ldrb r3, [sp, #71]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #104]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #113]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #12]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #21]              "\
      "\n        add  r8,  fp, #0xD0             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #2]               "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #11]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #38]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #232]             "\
      "\n        str  r4, [sp, #236]             "\
\
      "\n        ldrb r3, [sp, #79]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #112]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #121]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #20]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #29]              "\
      "\n        add  r8,  fp, #0xE0             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #10]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #19]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #46]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #240]             "\
      "\n        str  r4, [sp, #244]             "\
\
      "\n        ldrb r3, [sp, #87]              "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #120]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #1]               "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #28]              "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #37]              "\
      "\n        add  r8,  fp, #0xF0             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #146]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #155]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #182]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #248]             "\
      "\n        str  r4, [sp, #252]             "\
\
\
\
\
\
      "\n        ldrb r3, [sp, #223]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #128]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #137]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #164]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #173]             "\
      "\n        add  r8,  fp, #0x01             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #154]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #163]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #190]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #0]               "\
      "\n        str  r4, [sp, #4]               "\
\
      "\n        ldrb r3, [sp, #231]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #136]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #145]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #172]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #181]             "\
      "\n        add  r8,  fp, #0x11             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #162]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #171]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #198]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #8]               "\
      "\n        str  r4, [sp, #12]              "\
\
      "\n        ldrb r3, [sp, #239]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #144]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #153]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #180]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #189]             "\
      "\n        add  r8,  fp, #0x21             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #170]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #179]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #206]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #16]              "\
      "\n        str  r4, [sp, #20]              "\
\
      "\n        ldrb r3, [sp, #247]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #152]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #161]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #188]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #197]             "\
      "\n        add  r8,  fp, #0x31             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #178]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #187]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #214]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #24]              "\
      "\n        str  r4, [sp, #28]              "\
\
      "\n        ldrb r3, [sp, #255]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #160]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #169]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #196]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #205]             "\
      "\n        add  r8,  fp, #0x41             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #186]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #195]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #222]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #32]              "\
      "\n        str  r4, [sp, #36]              "\
\
      "\n        ldrb r3, [sp, #135]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #168]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #177]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #204]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #213]             "\
      "\n        add  r8,  fp, #0x51             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #194]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #203]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #230]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #40]              "\
      "\n        str  r4, [sp, #44]              "\
\
      "\n        ldrb r3, [sp, #143]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #176]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #185]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #212]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #221]             "\
      "\n        add  r8,  fp, #0x61             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #202]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #211]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #238]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #48]              "\
      "\n        str  r4, [sp, #52]              "\
\
      "\n        ldrb r3, [sp, #151]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #184]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #193]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #220]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #229]             "\
      "\n        add  r8,  fp, #0x71             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #210]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #219]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #246]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #56]              "\
      "\n        str  r4, [sp, #60]              "\
\
      "\n        ldrb r3, [sp, #159]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #192]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #201]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #228]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #237]             "\
      "\n        add  r8,  fp, #0x81             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #218]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #227]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #254]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #64]              "\
      "\n        str  r4, [sp, #68]              "\
\
      "\n        ldrb r3, [sp, #167]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #200]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #209]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #236]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #245]             "\
      "\n        add  r8,  fp, #0x91             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #226]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #235]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #134]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #72]              "\
      "\n        str  r4, [sp, #76]              "\
\
      "\n        ldrb r3, [sp, #175]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #208]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #217]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #244]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #253]             "\
      "\n        add  r8,  fp, #0xA1             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #234]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #243]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #142]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #80]              "\
      "\n        str  r4, [sp, #84]              "\
\
      "\n        ldrb r3, [sp, #183]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #216]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #225]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #252]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #133]             "\
      "\n        add  r8,  fp, #0xB1             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #242]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #251]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #150]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #88]              "\
      "\n        str  r4, [sp, #92]              "\
\
      "\n        ldrb r3, [sp, #191]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #224]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #233]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #132]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #141]             "\
      "\n        add  r8,  fp, #0xC1             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #250]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #131]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #158]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #96]              "\
      "\n        str  r4, [sp, #100]             "\
\
      "\n        ldrb r3, [sp, #199]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #232]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #241]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #140]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #149]             "\
      "\n        add  r8,  fp, #0xD1             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #130]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #139]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #166]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #104]             "\
      "\n        str  r4, [sp, #108]             "\
\
      "\n        ldrb r3, [sp, #207]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #240]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #249]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #148]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #157]             "\
      "\n        add  r8,  fp, #0xE1             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #138]             "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #147]             "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #174]             "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #112]             "\
      "\n        str  r4, [sp, #116]             "\
\
      "\n        ldrb r3, [sp, #215]             "\
      "\n        add  r0,  lr, r0, asl #2        "\
      "\n        ldrb r4, [sp, #248]             "\
      "\n        add  r1,  lr, r1, asl #2        "\
      "\n        ldrb r5, [sp, #129]             "\
      "\n        add  r2,  lr, r2, asl #2        "\
      "\n        ldrb r6, [sp, #156]             "\
      "\n        add  r3,  lr, r3, asl #2        "\
      "\n        ldrb r7, [sp, #165]             "\
      "\n        add  r8,  fp, #0xF1             "\
      "\n        ldr  r9, [r0, # 0]              "\
      "\n        eor  r4,  r4, r8                "\
      "\n        ldr  r8, [r1, #2048]            "\
      "\n        add  r4,  ip, r4, asl #2        "\
      "\n        ldr  r0, [r0, #1024]            "\
      "\n        add  r5,  ip, r5, asl #2        "\
      "\n        ldr  r1, [r1, #3072]            "\
      "\n        add  r6,  ip, r6, asl #2        "\
      "\n        ldr  sl, [r2, #1024]            "\
      "\n        add  r7,  ip, r7, asl #2        "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r3, #3072]            "\
      "\n        ldr  r2, [r2, #0   ]            "\
      "\n        eor  r0,  r0, r1                "\
      "\n        ldr  r3, [r3, #2048]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r4, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r5, #2048]            "\
      "\n        eor  r0,  r0, r2                "\
      "\n        ldr  r4, [r4, #1024]            "\
      "\n        eor  r0,  r0, r3                "\
      "\n        ldr  r5, [r5, #3072]            "\
      "\n        eor  r9,  r9, sl                "\
      "\n        ldr  sl, [r6, #0   ]            "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldr  r8, [r7, #3072]            "\
      "\n        eor  r0,  r0, r4                "\
      "\n        ldr  r6, [r6, #1024]            "\
      "\n        eor  r4,  r0, r5                "\
      "\n        ldr  r7, [r7, #2048]            "\
      "\n        eor  r4,  r4, sl                "\
      "\n        ldrb r0, [sp, #18]              "\
      "\n        eor  r9,  r9, r8                "\
      "\n        ldrb r1, [sp, #27]              "\
      "\n        eor  r9,  r9, r6                "\
      "\n        ldrb r2, [sp, #54]              "\
      "\n        eor  r4,  r4, r7                "\
      "\n        str  r9, [sp, #120]             "\
      "\n        cmp   fp,  #12                  "\
      "\n        str  r4, [sp, #124]             "\
\
      "\n        addne fp, fp, #2                "\
      "\n        bne   LOOP_PB                   "\
      "\n        ldr   sp, [sp, #256]            "\
      :                                           \
      :                                           \
      : "r0", "r1", "r2", "r3", "r4", "r5", "r6", \
        "r7", "r8", "r9", "sl", "fp", "ip", "lr"  \
    );                                            \
}

