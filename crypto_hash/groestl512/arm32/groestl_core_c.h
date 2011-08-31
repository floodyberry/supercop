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
 * @file     groestl_core_c.h
 * @author   Wolfgang Wieser <w.wieser@student.tugraz.at>
 *
 * This code is based on works of Thomas Pornin and Projet RNRT SAPHIR
 * and was adapted to tweaks of GROESTL for third round of SHA-3 competition.
 * It is part of a collection of header files, which implements GROESTL's
 * functions in C and assembler, optimized for 32-Bit ARM processors.
 */

//#############################################################################
//###########  FUNCTIONS FOR TWEAKED GROESTL ##################################
//#############################################################################

#define RSTT(d0, d1, t, a, b0, b1, b2, b3, b4, b5, b6, b7) {  \
    t[d0] = T0up[B32_0(a[b0])]                                \
          ^ T1up[B32_1(a[b1])]                                \
          ^ T2up[B32_2(a[b2])]                                \
          ^ T3up[B32_3(a[b3])]                                \
          ^ T0dn[B32_0(a[b4])]                                \
          ^ T1dn[B32_1(a[b5])]                                \
          ^ T2dn[B32_2(a[b6])]                                \
          ^ T3dn[B32_3(a[b7])];                               \
    t[d1] = T0dn[B32_0(a[b0])]                                \
          ^ T1dn[B32_1(a[b1])]                                \
          ^ T2dn[B32_2(a[b2])]                                \
          ^ T3dn[B32_3(a[b3])]                                \
          ^ T0up[B32_0(a[b4])]                                \
          ^ T1up[B32_1(a[b5])]                                \
          ^ T2up[B32_2(a[b6])]                                \
          ^ T3up[B32_3(a[b7])];                               \
}

//=============================================================================
//===========  FUNCTIONS FOR SMALL GROESTL ====================================
//=============================================================================

#define ROUND_SMALL_P(a, r)   {                             \
    a[ 0] ^= 0x00+r;                                        \
    a[ 2] ^= 0x10+r;                                        \
    a[ 4] ^= 0x20+r;                                        \
    a[ 6] ^= 0x30+r;                                        \
    a[ 8] ^= 0x40+r;                                        \
    a[10] ^= 0x50+r;                                        \
    a[12] ^= 0x60+r;                                        \
    a[14] ^= 0x70+r;                                        \
    RSTT(0x0, 0x1, t, a,  0,  2,  4,  6,  9, 11, 13, 15);   \
    RSTT(0x2, 0x3, t, a,  2,  4,  6,  8, 11, 13, 15,  1);   \
    RSTT(0x4, 0x5, t, a,  4,  6,  8, 10, 13, 15,  1,  3);   \
    RSTT(0x6, 0x7, t, a,  6,  8, 10, 12, 15,  1,  3,  5);   \
    RSTT(0x8, 0x9, t, a,  8, 10, 12, 14,  1,  3,  5,  7);   \
    RSTT(0xA, 0xB, t, a, 10, 12, 14,  0,  3,  5,  7,  9);   \
    RSTT(0xC, 0xD, t, a, 12, 14,  0,  2,  5,  7,  9, 11);   \
    RSTT(0xE, 0xF, t, a, 14,  0,  2,  4,  7,  9, 11, 13);   \
    memcpy(a, t, 64);                                       \
}

#define PERM_SMALL_P(a) {    \
    int r;                   \
    for (r = 0; r < 10; r++) \
        ROUND_SMALL_P(a, r); \
}

#define ROUND_SMALL_Q(a, r)   {                             \
    sph_u32 rc = r<<24;                                     \
    a[ 0] = ~a[ 0];                                         \
    a[ 2] = ~a[ 2];                                         \
    a[ 4] = ~a[ 4];                                         \
    a[ 6] = ~a[ 6];                                         \
    a[ 8] = ~a[ 8];                                         \
    a[10] = ~a[10];                                         \
    a[12] = ~a[12];                                         \
    a[14] = ~a[14];                                         \
    a[ 1] ^= 0xffffffff-rc;                                 \
    a[ 3] ^= 0xefffffff-rc;                                 \
    a[ 5] ^= 0xdfffffff-rc;                                 \
    a[ 7] ^= 0xcfffffff-rc;                                 \
    a[ 9] ^= 0xbfffffff-rc;                                 \
    a[11] ^= 0xafffffff-rc;                                 \
    a[13] ^= 0x9fffffff-rc;                                 \
    a[15] ^= 0x8fffffff-rc;                                 \
    RSTT(0x0, 0x1, t, a,  2,  6, 10, 14,  1,  5,  9, 13);   \
    RSTT(0x2, 0x3, t, a,  4,  8, 12,  0,  3,  7, 11, 15);   \
    RSTT(0x4, 0x5, t, a,  6, 10, 14,  2,  5,  9, 13,  1);   \
    RSTT(0x6, 0x7, t, a,  8, 12,  0,  4,  7, 11, 15,  3);   \
    RSTT(0x8, 0x9, t, a, 10, 14,  2,  6,  9, 13,  1,  5);   \
    RSTT(0xA, 0xB, t, a, 12,  0,  4,  8, 11, 15,  3,  7);   \
    RSTT(0xC, 0xD, t, a, 14,  2,  6, 10, 13,  1,  5,  9);   \
    RSTT(0xE, 0xF, t, a,  0,  4,  8, 12, 15,  3,  7, 11);   \
    memcpy(a, t, 64);                                       \
}

#define PERM_SMALL_Q(a) {    \
    int r;                   \
    for (r = 0; r < 10; r++) \
        ROUND_SMALL_Q(a, r); \
}

#define PERM_SMALL_F(a) PERM_SMALL_P(a)

//=============================================================================
//===========  FUNCTIONS FOR BIG GROESTL   ====================================
//=============================================================================


#define ROUND_BIG_P(a, r) {                                   \
    a[ 0] ^= 0x00+r;                                          \
    a[ 2] ^= 0x10+r;                                          \
    a[ 4] ^= 0x20+r;                                          \
    a[ 6] ^= 0x30+r;                                          \
    a[ 8] ^= 0x40+r;                                          \
    a[10] ^= 0x50+r;                                          \
    a[12] ^= 0x60+r;                                          \
    a[14] ^= 0x70+r;                                          \
    a[16] ^= 0x80+r;                                          \
    a[18] ^= 0x90+r;                                          \
    a[20] ^= 0xA0+r;                                          \
    a[22] ^= 0xB0+r;                                          \
    a[24] ^= 0xC0+r;                                          \
    a[26] ^= 0xD0+r;                                          \
    a[28] ^= 0xE0+r;                                          \
    a[30] ^= 0xF0+r;                                          \
    RSTT(0x00, 0x01, t, a,  0,  2,  4,  6,  9, 11, 13, 23);   \
    RSTT(0x02, 0x03, t, a,  2,  4,  6,  8, 11, 13, 15, 25);   \
    RSTT(0x04, 0x05, t, a,  4,  6,  8, 10, 13, 15, 17, 27);   \
    RSTT(0x06, 0x07, t, a,  6,  8, 10, 12, 15, 17, 19, 29);   \
    RSTT(0x08, 0x09, t, a,  8, 10, 12, 14, 17, 19, 21, 31);   \
    RSTT(0x0A, 0x0B, t, a, 10, 12, 14, 16, 19, 21, 23,  1);   \
    RSTT(0x0C, 0x0D, t, a, 12, 14, 16, 18, 21, 23, 25,  3);   \
    RSTT(0x0E, 0x0F, t, a, 14, 16, 18, 20, 23, 25, 27,  5);   \
    RSTT(0x10, 0x11, t, a, 16, 18, 20, 22, 25, 27, 29,  7);   \
    RSTT(0x12, 0x13, t, a, 18, 20, 22, 24, 27, 29, 31,  9);   \
    RSTT(0x14, 0x15, t, a, 20, 22, 24, 26, 29, 31,  1, 11);   \
    RSTT(0x16, 0x17, t, a, 22, 24, 26, 28, 31,  1,  3, 13);   \
    RSTT(0x18, 0x19, t, a, 24, 26, 28, 30,  1,  3,  5, 15);   \
    RSTT(0x1A, 0x1B, t, a, 26, 28, 30,  0,  3,  5,  7, 17);   \
    RSTT(0x1C, 0x1D, t, a, 28, 30,  0,  2,  5,  7,  9, 19);   \
    RSTT(0x1E, 0x1F, t, a, 30,  0,  2,  4,  7,  9, 11, 21);   \
    memcpy(a, t, 128);                                        \
}

#define PERM_BIG_P(a) {        \
    int r;                     \
    for (r = 0; r < 14; r++)   \
        ROUND_BIG_P(a,  r);    \
}

#define ROUND_BIG_Q(a, r) {                                    \
    sph_u32 rc = r<<24;                                       \
    a[ 0] = ~a[ 0];                                           \
    a[ 2] = ~a[ 2];                                           \
    a[ 4] = ~a[ 4];                                           \
    a[ 6] = ~a[ 6];                                           \
    a[ 8] = ~a[ 8];                                           \
    a[10] = ~a[10];                                           \
    a[12] = ~a[12];                                           \
    a[14] = ~a[14];                                           \
    a[16] = ~a[16];                                           \
    a[18] = ~a[18];                                           \
    a[20] = ~a[20];                                           \
    a[22] = ~a[22];                                           \
    a[24] = ~a[24];                                           \
    a[26] = ~a[26];                                           \
    a[28] = ~a[28];                                           \
    a[30] = ~a[30];                                           \
    a[ 1] ^= 0xffffffff-rc;                                   \
    a[ 3] ^= 0xefffffff-rc;                                   \
    a[ 5] ^= 0xdfffffff-rc;                                   \
    a[ 7] ^= 0xcfffffff-rc;                                   \
    a[ 9] ^= 0xbfffffff-rc;                                   \
    a[11] ^= 0xafffffff-rc;                                   \
    a[13] ^= 0x9fffffff-rc;                                   \
    a[15] ^= 0x8fffffff-rc;                                   \
    a[17] ^= 0x7fffffff-rc;                                   \
    a[19] ^= 0x6fffffff-rc;                                   \
    a[21] ^= 0x5fffffff-rc;                                   \
    a[23] ^= 0x4fffffff-rc;                                   \
    a[25] ^= 0x3fffffff-rc;                                   \
    a[27] ^= 0x2fffffff-rc;                                   \
    a[29] ^= 0x1fffffff-rc;                                   \
    a[31] ^= 0x0fffffff-rc;                                   \
    RSTT(0x00, 0x01, t, a,  2,  6, 10, 22,  1,  5,  9, 13);   \
    RSTT(0x02, 0x03, t, a,  4,  8, 12, 24,  3,  7, 11, 15);   \
    RSTT(0x04, 0x05, t, a,  6, 10, 14, 26,  5,  9, 13, 17);   \
    RSTT(0x06, 0x07, t, a,  8, 12, 16, 28,  7, 11, 15, 19);   \
    RSTT(0x08, 0x09, t, a, 10, 14, 18, 30,  9, 13, 17, 21);   \
    RSTT(0x0A, 0x0B, t, a, 12, 16, 20,  0, 11, 15, 19, 23);   \
    RSTT(0x0C, 0x0D, t, a, 14, 18, 22,  2, 13, 17, 21, 25);   \
    RSTT(0x0E, 0x0F, t, a, 16, 20, 24,  4, 15, 19, 23, 27);   \
    RSTT(0x10, 0x11, t, a, 18, 22, 26,  6, 17, 21, 25, 29);   \
    RSTT(0x12, 0x13, t, a, 20, 24, 28,  8, 19, 23, 27, 31);   \
    RSTT(0x14, 0x15, t, a, 22, 26, 30, 10, 21, 25, 29,  1);   \
    RSTT(0x16, 0x17, t, a, 24, 28,  0, 12, 23, 27, 31,  3);   \
    RSTT(0x18, 0x19, t, a, 26, 30,  2, 14, 25, 29,  1,  5);   \
    RSTT(0x1A, 0x1B, t, a, 28,  0,  4, 16, 27, 31,  3,  7);   \
    RSTT(0x1C, 0x1D, t, a, 30,  2,  6, 18, 29,  1,  5,  9);   \
    RSTT(0x1E, 0x1F, t, a,  0,  4,  8, 20, 31,  3,  7, 11);   \
    memcpy(a, t, 128);                                        \
}

#define PERM_BIG_Q(a) {        \
    int r;                     \
    for (r = 0; r < 14; r++)   \
        ROUND_BIG_Q(a, r);     \
}

#define PERM_BIG_F(a) PERM_BIG_P(a)
