/*
 * Joltik=/=-96-96 Optimized (vperm) C Implementation
 * 
 * Copyright 2014:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 * 
 */

#include <stdint.h>
#include <inttypes.h>
#include <emmintrin.h>

#define ALIGN(n) 	__attribute__ ((aligned ((n))))
#define HIDDEN_ALIGN(n) __attribute__ ((visibility("hidden"),aligned(n)))

/* Joltik four TBoxes */ 
HIDDEN_ALIGN(16) uint8_t T_1_4[]  asm ("T_1_4")  = {0xed, 0x43, 0xba, 0x28, 0x3c, 0x86, 0x00, 0x92, 0x14, 0xae, 0x7f, 0xf9, 0x6b, 0xc5, 0x57, 0xd1};
HIDDEN_ALIGN(16) uint8_t T_9_13[] asm ("T_9_13") = {0x7a, 0x21, 0xc6, 0x19, 0x84, 0x42, 0x00, 0xdf, 0x9d, 0x5b, 0xa5, 0xe7, 0x38, 0x63, 0xbc, 0xfe};
HIDDEN_ALIGN(16) uint8_t T_4_1[]  asm ("T_4_1")  = {0xde, 0x34, 0xab, 0x82, 0xc3, 0x68, 0x00, 0x29, 0x41, 0xea, 0xf7, 0x9f, 0xb6, 0x5c, 0x75, 0x1d};
HIDDEN_ALIGN(16) uint8_t T_13_9[] asm ("T_13_9") = {0xa7, 0x12, 0x6c, 0x91, 0x48, 0x24, 0x00, 0xfd, 0xd9, 0xb5, 0x5a, 0x7e, 0x83, 0x36, 0xcb, 0xef};

HIDDEN_ALIGN(16) uint8_t invT_1_4[]  asm ("invT_1_4")  = {0x6b, 0x86, 0x3c, 0x43, 0x14, 0xed, 0xc5, 0xae, 0x57, 0x7f, 0x92, 0x28, 0xd1, 0xf9, 0x00, 0xba};
HIDDEN_ALIGN(16) uint8_t invT_9_13[] asm ("invT_9_13") = {0x38, 0x42, 0x84, 0x21, 0x9d, 0x7a, 0x63, 0x5b, 0xbc, 0xa5, 0xdf, 0x19, 0xfe, 0xe7, 0x00, 0xc6};
HIDDEN_ALIGN(16) uint8_t invT_4_1[]  asm ("invT_4_1")  = {0xb6, 0x68, 0xc3, 0x34, 0x41, 0xde, 0x5c, 0xea, 0x75, 0xf7, 0x29, 0x82, 0x1d, 0x9f, 0x00, 0xab};
HIDDEN_ALIGN(16) uint8_t invT_13_9[] asm ("invT_13_9") = {0x83, 0x24, 0x48, 0x12, 0xd9, 0xa7, 0x36, 0xb5, 0xcb, 0x5a, 0xfd, 0x91, 0xef, 0x7e, 0x00, 0x6c};

/* MC tables for decryption */
HIDDEN_ALIGN(16) uint8_t MC_4_1[]  asm ("MC_4_1")  = {0x00, 0x41, 0x82, 0xc3, 0x34, 0x75, 0xb6, 0xf7, 0x68, 0x29, 0xea, 0xab, 0x5c, 0x1d, 0xde, 0x9f};
HIDDEN_ALIGN(16) uint8_t MC_13_9[] asm ("MC_13_9") = {0x00, 0xd9, 0x91, 0x48, 0x12, 0xcb, 0x83, 0x5a, 0x24, 0xfd, 0xb5, 0x6c, 0x36, 0xef, 0xa7, 0x7e};
HIDDEN_ALIGN(16) uint8_t MC_1_4[]  asm ("MC_1_4")  = {0x00, 0x14, 0x28, 0x3c, 0x43, 0x57, 0x6b, 0x7f, 0x86, 0x92, 0xae, 0xba, 0xc5, 0xd1, 0xed, 0xf9};
HIDDEN_ALIGN(16) uint8_t MC_9_13[] asm ("MC_9_13") = {0x00, 0x9d, 0x19, 0x84, 0x21, 0xbc, 0x38, 0xa5, 0x42, 0xdf, 0x5b, 0xc6, 0x63, 0xfe, 0x7a, 0xe7};

/* Mutliplication tables x2 in GF(2^4)/0x3 */ 
HIDDEN_ALIGN(16) uint8_t MulBy2[]     asm ("MulBy2")     = {0, 2, 4, 6, 8, 10, 12, 14, 3, 1, 7, 5, 11, 9, 15, 13};
HIDDEN_ALIGN(16) uint8_t DivBy2[]     asm ("DivBy2")     = {0, 9, 1, 8, 2, 11, 3, 10, 4, 13, 5, 12, 6, 15, 7, 14};
HIDDEN_ALIGN(16) uint8_t MulBy4to32[] asm ("MulBy4to32") = {0, 3, 6, 5, 12, 15, 10, 9, 11, 8, 13, 14, 7, 4, 1, 2};

/* Mutliplication table x4 in GF(2^4)/0x3 */
HIDDEN_ALIGN(16) uint8_t MulBy4[] asm ("MulBy4") = {0, 4, 8, 12, 3, 7, 11, 15, 6, 2, 14, 10, 5, 1, 13, 9};
HIDDEN_ALIGN(16) uint8_t DivBy4[] asm ("DivBy4") = {0, 13, 9, 4, 1, 12, 8, 5, 2, 15, 11, 6, 3, 14, 10, 7};

/* Masks */
HIDDEN_ALIGN(16) uint8_t AndMask[]           asm("AndMask")            = {0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f};
HIDDEN_ALIGN(16) uint8_t AndMaskTopHalf[]    asm("AndMaskTopHalf")     = {0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00};
HIDDEN_ALIGN(16) uint8_t AndMaskBottomHalf[] asm("AndMaskBottomHalf")  = {0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff};

/* Shuffling for ShiftRows */
HIDDEN_ALIGN(16) uint8_t ShiftRowsT1[] asm("ShiftRowsT1")  = {2,7,4,1,6,3,0,5,  10,15,12,9,14,11,8,13};
HIDDEN_ALIGN(16) uint8_t ShiftRowsT2[] asm("ShiftRowsT2")  = {0,5,2,7,4,1,6,3,  8,13,10,15,12,9,14,11};

/* Shuffling for invShiftRows */
HIDDEN_ALIGN(16) uint8_t invShiftRowsT1[] asm("invShiftRowsT1")  = {6,3,0,5,2,7,4,1,  14,11,8,13,10,15,12,9};

/* Shuffling for the tweakey schedule (H) */
HIDDEN_ALIGN(16) uint8_t Tweakey_H1[] asm("Tweakey_H1")  = {3,6,5,0,7,2,1,4,  11,14,13,8,15,10,9,12};
HIDDEN_ALIGN(16) uint8_t Tweakey_H2[] asm("Tweakey_H2")  = {0,5,2,7,4,1,6,3,  8,13,10,15,12,9,14,11};

/* Round constants for Joltik (same as LED) */
HIDDEN_ALIGN(16) const uint8_t RC[16*(1+32)] asm("RC") = {
  0x01, 0x23, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x76, 0x76, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x76, 0x76, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x75, 0x75, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x75, 0x75, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x73, 0x73, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x73, 0x73, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x67, 0x67, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x67, 0x67, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x57, 0x57, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x57, 0x57, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x74, 0x74, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x74, 0x74, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x71, 0x71, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x71, 0x71, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x47, 0x47, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x47, 0x47, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x35, 0x35, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x35, 0x35, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x72, 0x72, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x72, 0x72, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x65, 0x65, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x65, 0x65, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x53, 0x53, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x53, 0x53, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x56, 0x56, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x56, 0x56, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x34, 0x34, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x34, 0x34, 0x00, 0x00, 0x00, 0x00, 
  0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00
};

/*********************************************************************/
/* Multiply all the nibbles in vectors "in" by 2 in the field, and   */
/* then apply the H permutation from the Joltik design.              */
/* Uses registers:                                                   */
/*      input/output: #in, #table (MultiplicationTable)              */
/*      tables:       xmm7(AndMask)                                  */
/*      temporary:    xmm12, xmm13                                   */
/*********************************************************************/
#define MUL_AND_H_SSE(in, table) do {                   \
    asm("movdqa %"#in", %xmm13");                       \
    asm("pand %xmm7, %"#in);                            \
    asm("psrlw $4, %xmm13");                            \
    asm("pshufb Tweakey_H1(%rip), %"#in);               \
    asm("pand %xmm7, %xmm13");                          \
    asm("movdqa %"#table", %xmm12");                    \
    asm("pshufb Tweakey_H2(%rip), %xmm13");             \
    asm("pshufb %xmm13, %xmm12");                       \
    asm("movdqa %"#table", %xmm13");                    \
                                                        \
    asm("pshufb %"#in", %xmm13");                       \
    asm("psllw $4, %xmm13");                            \
    asm("pxor %xmm12, %xmm13");                         \
                                                        \
    asm("movdqa %xmm13, %"#in);                         \
 } while(0);

/*********************************************************************/
/* Multiply all the nibbles in vectors "in" by 2 in the field, and   */
/* then apply the inverse of H permutation from the Joltik design.   */
/* Uses registers:                                                   */
/*      input/output: #in, #table (MultiplicationTable)              */
/*      tables:       xmm7(AndMask)                                  */
/*      temporary:    xmm12, xmm13                                   */
/*********************************************************************/
#define MUL_AND_INVH_SSE(in, table) do {                \
    asm("movdqa %"#in", %xmm13");                       \
    asm("pand %xmm7, %"#in);                            \
    asm("psrlw $4, %xmm13");                            \
    asm("pshufb Tweakey_H2(%rip), %"#in);               \
    asm("pand %xmm7, %xmm13");                          \
    asm("movdqa %"#table", %xmm12");                    \
    asm("pshufb Tweakey_H1(%rip), %xmm13");             \
    asm("pshufb %xmm13, %xmm12");                       \
    asm("movdqa %"#table", %xmm13");                    \
                                                        \
    asm("pshufb %"#in", %xmm13");                       \
    asm("psllw $4, %xmm13");                            \
    asm("pxor %xmm12, %xmm13");                         \
                                                        \
    asm("movdqa %xmm13, %"#in);                         \
 } while(0);


/*********************************************************************/
/* Multiply all the nibbles in vectors "in" by 2 in the field        */
/* Uses registers:                                                   */
/*      input/output: #in, #table (MultiplicationTable)              */
/*      tables:       xmm7(AndMask)                                  */
/*      temporary:    xmm12, xmm13                                   */
/*********************************************************************/
#define MUL_SSE(in, table) do {                                 \
  /* Move state to temp register */                             \
  asm("movdqa %"#in", %xmm12");                                 \
                                                                \
  /* Consider high nibbles */                                   \
  asm("movdqa %"#table", %xmm13");                              \
  asm("psrlw $4, %xmm12");                                      \
  asm("psllw $4, %xmm13");                                      \
  asm("pand %xmm7, %xmm12");                                    \
  asm("pshufb %xmm12, %xmm13");                                 \
                                                                \
  /* Consider low nibbles */                                    \
  asm("movdqa %"#in", %xmm12");                                 \
  asm("movdqa %"#table", %"#in);                                \
  asm("pand %xmm7, %xmm12");                                    \
  asm("pshufb %xmm12, %"#in);                                   \
                                                                \
  asm("pxor %xmm13, %"#in);                                     \
 } while(0);


/*********************************************************************/
/* Consider the register "in" as two 64-bit elements, each of        */
/* the 16 nibbles.                                                   */
/* Then, apply the H permutation from Joltik to the two elements.    */
/* Uses registers:                                                   */
/*      input/output: #in                                            */
/*      tables:       xmm7, Tweakey_H1, Tweakey_H2                   */
/*      temporary:    xmm13                                          */
/*********************************************************************/
#define H_SSE(in) do {                                  \
    asm("movdqa %"#in", %xmm13");                       \
    asm("pand %xmm7, %"#in);                            \
    asm("psrlw $4, %xmm13");                            \
    asm("pshufb Tweakey_H1(%rip), %"#in);               \
    asm("pand %xmm7, %xmm13");                          \
    asm("psllw $4, %"#in);                              \
    asm("pshufb Tweakey_H2(%rip), %xmm13");             \
    asm("pxor %xmm13, %"#in);                           \
  } while(0);

/*********************************************************************/
/* Consider the register "in" as two 64-bit elements, each of        */
/* the 16 nibbles.                                                   */
/* Then, apply the H permutation from Joltik to the two elements.    */
/* Uses registers:                                                   */
/*      input/output: #in                                            */
/*      tables:       xmm7, Tweakey_H1, Tweakey_H2                   */
/*      temporary:    xmm13                                          */
/*********************************************************************/
#define INVH_SSE(in) do {                               \
    asm("movdqa %"#in", %xmm13");                       \
    asm("pand %xmm7, %"#in);                            \
    asm("psrlw $4, %xmm13");                            \
    asm("pshufb Tweakey_H2(%rip), %"#in);               \
    asm("pand %xmm7, %xmm13");                          \
    asm("pshufb Tweakey_H1(%rip), %xmm13");             \
    asm("psllw $4, %"#in);                              \
    asm("pxor %xmm13, %"#in);                           \
  } while(0);

/*********************************************************************/
/* Consider the register "in" as two 64-bit elements, each of the    */
/* 16 nibbles.                                                       */
/* Then, apply the MC involution transformation of Joltik            */
/* Uses registers:                                                   */
/*      input/output: #in                                            */
/*      tweak:        xmm5                                           */
/*      T-tables:     MC_4_1, MC_13_9, MC_1_4, MC_9_13               */
/*      tables:       xmm7, xmm8, xmm9                               */
/*      temporary:    xmm10, xmm11, xmm12, xmm13                     */
/*********************************************************************/
#define MC_SSE(in) do {                                                 \
  /* --------------------------------------------------------------- */ \
  /* First lookup*/                                                     \
                                                                        \
  /* Save state */                                                      \
  asm("movdqa %"#in", %xmm13");                                         \
                                                                        \
  /* Apply AND mask to isolate the nibbles we want */                   \
  asm("pand %xmm7, %xmm13");                                            \
                                                                        \
  /* Get MC_4_1[] for the first nibble */                               \
  asm("movdqa MC_4_1(%rip), %xmm11");                                   \
  asm("pshufb %xmm13, %xmm11");                                         \
                                                                        \
  /* Get the nibbles from the top half */                               \
  asm("movdqa %xmm11, %xmm10");                                         \
  asm("pand %xmm8, %xmm10");                                            \
                                                                        \
  /* Get MC_13_9[] for the second nibble */                             \
  asm("movdqa MC_13_9(%rip), %xmm12");                                  \
  asm("pshufb %xmm13, %xmm12");                                         \
                                                                        \
  /* Get the nibbles from the top half */                               \
  asm("movdqa %xmm12, %xmm13");                                         \
  asm("pand %xmm8, %xmm13");                                            \
  asm("psllw  $8, %xmm13");                                             \
                                                                        \
  /* Accumulate in the output register */                               \
  asm("pxor  %xmm13, %xmm10");                                          \
                                                                        \
  /* Get the nibbles from the bottom half */                            \
  asm("pand %xmm9, %xmm11");                                            \
  asm("pand %xmm9, %xmm12");                                            \
  asm("psrlw  $8, %xmm12");                                             \
                                                                        \
  /* Accumulate in the output register */                               \
  asm("pxor  %xmm11, %xmm10");                                          \
  asm("pxor  %xmm12, %xmm10");                                          \
  /* The output register is xmm10 */                                    \
                                                                        \
  /* ------------------------------------------------------------- */   \
  /* Second lookup*/                                                    \
                                                                        \
  /* Save state */                                                      \
  asm("movdqa %"#in", %xmm13");                                         \
  asm("psrlw  $4, %xmm13");                                             \
                                                                        \
  /* Apply AND mask to isolate the nibbles we want */                   \
  asm("pand %xmm7, %xmm13");                                            \
                                                                        \
  /* Get MC_1_4[] for the first nibble */                               \
  asm("movdqa MC_1_4(%rip), %xmm11");                                   \
  asm("pshufb %xmm13, %xmm11");                                         \
                                                                        \
  /* Get the nibbles from the top half */                               \
  asm("movdqa %xmm11, %"#in);                                           \
  asm("pand %xmm8, %"#in);                                              \
                                                                        \
  /* Accumulate in the function output register (in) */                 \
  asm("pxor  %xmm10, %"#in);                                            \
                                                                        \
  /* Get MC_9_13[] for the second nibble */                             \
  asm("movdqa MC_9_13(%rip), %xmm12");                                  \
  asm("pshufb %xmm13, %xmm12");                                         \
                                                                        \
  asm("movdqa %xmm12, %xmm13");                                         \
  asm("pand %xmm8, %xmm13");                                            \
  asm("psllw $8, %xmm13");                                              \
                                                                        \
  /* Accumulate in the output register */                               \
  asm("pxor  %xmm13, %"#in);                                            \
                                                                        \
  /* Get the nibbles from the bottom half */                            \
  asm("pand %xmm9, %xmm11");                                            \
  asm("pand %xmm9, %xmm12");                                            \
  asm("psrlw  $8, %xmm12");                                             \
                                                                        \
  /* Accumulate in the output register */                               \
  asm("pxor %xmm11, %"#in);                                             \
  asm("pxor %xmm12, %"#in);                                             \
  } while(0);


/*********************************************************************/
/* Joltik round function on %xmm4                                    */
/* Uses registers:                                                   */
/*      input/output: xmm4                                           */
/*      tweak:        xmm5, xmm6                                     */
/*      T-tables:     xmm0, xmm1, xmm2, xmm3                         */
/*      tables:       xmm7, xmm8, xmm9, xmm14                        */
/*      temporary:    xmm10, xmm11, xmm12, xmm13                     */
/*********************************************************************/
#define JOLTIKROUND_SSE() do {                                          \
                                                                        \
    /* ------------------------------------------------------------- */ \
    /* First lookup*/                                                   \
                                                                        \
    /* Save state */                                                    \
    asm("movdqa %xmm4, %xmm13");                                        \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("pand %xmm7, %xmm13");                                          \
                                                                        \
    /* Perform the ShiftRows for two lines (second and last lines)   */ \
    asm("pshufb ShiftRowsT1(%rip), %xmm13");                            \
                                                                        \
    /* Get T_1_4[] for the first nibble                              */ \
    asm("movdqa %xmm2, %xmm11");                                        \
    asm("movdqa %xmm3, %xmm12");                                        \
                                                                        \
    /* Get T_9_13[] for the second nibble                            */ \
    asm("pshufb %xmm13, %xmm12");                                       \
    asm("pshufb %xmm13, %xmm11");                                       \
                                                                        \
    asm("movdqa %xmm12, %xmm13");                                       \
                                                                        \
    asm("pand %xmm8, %xmm13");   /* Get the nibbles in    top half   */ \
    asm("pand %xmm9, %xmm12");   /* Get the nibbles in bottom half   */ \
                                                                        \
    asm("psllw  $8, %xmm13");    /* Shift back                       */ \
    asm("psrlw  $8, %xmm12");    /* Shift back                       */ \
                                                                        \
    asm("movdqa %xmm11, %xmm10");                                       \
    asm("pand %xmm9, %xmm11");   /* Get the nibbles in bottom half   */ \
    asm("pand %xmm8, %xmm10");   /* Get the nibbles in    top half   */ \
                                                                        \
    /* Accumulate in the output register                             */ \
    asm("pxor  %xmm11, %xmm10"); /* Accumulate in xmm10              */ \
    asm("pxor  %xmm12, %xmm13");                                        \
    asm("pxor  %xmm13, %xmm10");                                        \
    /* The output register is xmm10                                  */ \
                                                                        \
    /* ------------------------------------------------------------- */ \
    /* Second lookup                                                 */ \
                                                                        \
    /* Save state */                                                    \
    asm("movdqa %xmm4, %xmm13");                                        \
    asm("psrlw  $4, %xmm13");                                           \
    asm("movdqa %xmm0, %xmm11");                                        \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("pand %xmm7, %xmm13");                                          \
                                                                        \
    /* Perform the ShiftRows for two lines (second and last lines)   */ \
    asm("pshufb ShiftRowsT2(%rip), %xmm13");                            \
                                                                        \
    /* Get T_1_4[] for the first nibble                              */ \
    asm("pshufb %xmm13, %xmm11");                                       \
                                                                        \
    /* Get T_9_13[] for the second nibble                            */ \
    asm("movdqa %xmm1, %xmm12");                                        \
    asm("pshufb %xmm13, %xmm12");                                       \
                                                                        \
    asm("movdqa %xmm12, %xmm13");                                       \
    asm("movdqa %xmm11, %xmm4");                                        \
                                                                        \
    asm("pand %xmm8, %xmm13");    /* Get the nibbles in    top half  */ \
    asm("pand %xmm9, %xmm12");    /* Get the nibbles in bottom half  */ \
    asm("psllw $8, %xmm13");      /* Shift back                      */ \
    asm("psrlw $8, %xmm12");      /* Shift back                      */ \
                                                                        \
    asm("pand %xmm8, %xmm4");     /* Get the nibbles in    top half  */ \
    asm("pand %xmm9, %xmm11");    /* Get the nibbles in bottom half  */ \
                                                                        \
    /* Accumulate in the function output register (xmm4)             */ \
    asm("pxor %xmm11, %xmm10");   /* Accumulate in xmm4              */ \
    asm("pxor %xmm12, %xmm13");   /* Accumulate in xmm4              */ \
    asm("pxor %xmm10, %xmm4");    /* Accumulate in xmm4              */ \
    asm("pxor %xmm13, %xmm4");    /* Accumulate in xmm4              */ \
    /* ------------------------------------------------------------- */ \
    /* Tweakey schedule on the tweak input */                           \
    MUL_AND_H_SSE(xmm5, xmm14)                                          \
    MUL_AND_H_SSE(xmm6, xmm15)                                          \
    /* ------------------------------------------------------------- */ \
    /* AddRoundTweakey (tweak in %xmm5, subkeys are precomp. in %r11)*/ \
    asm("add  $16, %r9");                 /* Round counter * 16      */ \
    asm("pxor (%r11, %r9, 1), %xmm4");                                  \
    asm("pxor %xmm5, %xmm4");                                           \
    asm("pxor %xmm6, %xmm4");                                           \
  } while(0);

/*********************************************************************/
/* Joltik inverse round function on %xmm4                            */
/* Uses registers:                                                   */
/*      input/output: xmm4                                           */
/*      tweak:        xmm5, xmm6                                     */
/*      T-tables:     xmm0, xmm1, xmm2, xmm3                         */
/*      tables:       xmm7, xmm8, xmm9, xmm14                        */
/*      temporary:    xmm10, xmm11, xmm12, xmm13                     */
/*********************************************************************/
#define JOLTIKROUND_INVERSE_SSE() do {                                  \
    /* ------------------------------------------------------------- */ \
    /* First lookup*/                                                   \
    /* Save state */                                                    \
    asm("movdqa %xmm4, %xmm13");                                        \
    /* Apply AND mask to isolate the nibbles we want */                 \
    asm("pand %xmm7, %xmm13");                                          \
    /* Perform the ShiftRows for two lines (second and last lines) */   \
    asm("pshufb invShiftRowsT1(%rip), %xmm13");                         \
    /* Get T_1_4[] for the first nibble */                              \
    asm("movdqa %xmm2, %xmm11");                                        \
    asm("pshufb %xmm13, %xmm11");                                       \
    /* Get the nibbles from the top half */                             \
    asm("movdqa %xmm11, %xmm10");                                       \
    asm("pand %xmm8, %xmm10");                                          \
    /* Get T_9_13[] for the second nibble */                            \
    asm("movdqa %xmm3, %xmm12");                                        \
    asm("pshufb %xmm13, %xmm12");                                       \
    /* Get the nibbles from the top half */                             \
    asm("movdqa %xmm12, %xmm13");                                       \
    asm("pand %xmm8, %xmm13");                                          \
    asm("psllw  $8, %xmm13");                                           \
    /* Accumulate in the output register */                             \
    asm("pxor  %xmm13, %xmm10");                                        \
    /* Get the nibbles from the bottom half */                          \
    asm("pand %xmm9, %xmm11");                                          \
    asm("pand %xmm9, %xmm12");                                          \
    asm("psrlw  $8, %xmm12");                                           \
    /* Accumulate in the output register */                             \
    asm("pxor  %xmm11, %xmm10");                                        \
    asm("pxor  %xmm12, %xmm10");                                        \
    /* The output register is xmm10 */                                  \
    /* ------------------------------------------------------------- */ \
    /* Second lookup*/                                                  \
    /* Save state */                                                    \
    asm("movdqa %xmm4, %xmm13");                                        \
    asm("psrlw  $4, %xmm13");                                           \
    /* Apply AND mask to isolate the nibbles we want */                 \
    asm("pand %xmm7, %xmm13");                                          \
    /* Perform the ShiftRows for two lines (first and third lines) */   \
    asm("pshufb ShiftRowsT2(%rip), %xmm13");                            \
    /* Get T_1_4[] for the first nibble */                              \
    asm("movdqa %xmm0, %xmm11");                                        \
    asm("pshufb %xmm13, %xmm11");                                       \
    /* Get the nibbles from the top half */                             \
    asm("movdqa %xmm11, %xmm4");                                        \
    asm("pand %xmm8, %xmm4");                                           \
    /* Accumulate in the function output register (xmm4) */             \
    asm("pxor  %xmm10, %xmm4");                                         \
    /* Get T_9_13[] for the second nibble */                            \
    asm("movdqa %xmm1, %xmm12");                                        \
    asm("pshufb %xmm13, %xmm12");                                       \
    asm("movdqa %xmm12, %xmm13");                                       \
    asm("pand %xmm8, %xmm13");                                          \
    asm("psllw $8, %xmm13");                                            \
    /* Accumulate in the output register */                             \
    asm("pxor  %xmm13, %xmm4");                                         \
    /* Get the nibbles from the bottom half */                          \
    asm("pand %xmm9, %xmm11");                                          \
    asm("pand %xmm9, %xmm12");                                          \
    asm("psrlw  $8, %xmm12");                                           \
    /* Accumulate in the output register */                             \
    asm("pxor %xmm11, %xmm4");                                          \
    asm("pxor %xmm12, %xmm4");                                          \
    /* Tweakey schedule on the tweak input */                           \
    MUL_AND_INVH_SSE(xmm5,xmm14) /* xmm14 containts mult. by 2^-1 */    \
    MUL_AND_INVH_SSE(xmm6,xmm15) /* xmm14 containts mult. by 4^-1 */    \
    /* ------------------------------------------------------------- */ \
    /* AddRoundTweakey (tweak in %xmm5, subkeys are precomp. in %r11)*/ \
    asm("movdqa %xmm5, %xmm0");                                         \
    asm("pxor %xmm6, %xmm0");                                           \
    MC_SSE(xmm0);                                                       \
    asm("pxor %xmm0, %xmm4");            /* XOR invMC(tweak)   */       \
    asm("movdqa invT_1_4(%rip), %xmm0");                                \
    asm("add  $16, %r9");                 /* Round counter * 16 */      \
    asm("pxor (%r11, %r9, 1), %xmm4");    /* Subkeys            */      \
  } while(0);

/*********************************************************************/
/* Perform the TWEAKEY schedule of Jolitk,                           */
/* to produce the 25 subkeys for encryption                          */
/*********************************************************************/
__attribute__((noinline)) void TweakeyScheduleTK2(const uint8_t* subkeys, const uint8_t* subkeys2) {

  /*      Note (__cdecl calling convention):          */
  /*             subkeys  is in %rdi                  */
  /*             subkeys2 is in %rsi                  */

  /* Avoid warnings */
  (void)subkeys;
  (void)subkeys2;

  /* Load constant tables */
  asm("movdqa AndMask(%rip), %xmm7");
  asm("movdqa MulBy2(%rip), %xmm14");
  asm("lea RC(%rip), %r10");

  /* Load first half of the master key (K^1)  */
  asm("movdqa (%rdi), %xmm6");

  /* Load second half of the master key (K^2) */
  asm("movdqa (%rsi), %xmm4");

  /* Write the 33 subkeys (for 32 rounds) */ 
  /***************************************/asm("movdqa     (%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,    (%rdi)"); /* store K^1_0  ^ K^2_0  ^ RC[ 0] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   16(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  16(%rdi)"); /* store K^1_1  ^ K^2_1  ^ RC[ 1] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   32(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  32(%rdi)"); /* store K^1_2  ^ K^2_2  ^ RC[ 2] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   48(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  48(%rdi)"); /* store K^1_3  ^ K^2_3  ^ RC[ 3] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   64(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  64(%rdi)"); /* store K^1_4  ^ K^2_4  ^ RC[ 4] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   80(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  80(%rdi)"); /* store K^1_5  ^ K^2_5  ^ RC[ 5] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   96(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  96(%rdi)"); /* store K^1_6  ^ K^2_6  ^ RC[ 6] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  112(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 112(%rdi)"); /* store K^1_7  ^ K^2_7  ^ RC[ 7] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  128(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 128(%rdi)"); /* store K^1_8  ^ K^2_8  ^ RC[ 8] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  144(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 144(%rdi)"); /* store K^1_9  ^ K^2_9  ^ RC[ 9] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  160(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 160(%rdi)"); /* store K^1_10 ^ K^2_10 ^ RC[10] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  176(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 176(%rdi)"); /* store K^1_11 ^ K^2_11 ^ RC[11] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  192(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 192(%rdi)"); /* store K^1_12 ^ K^2_12 ^ RC[12] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  208(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 208(%rdi)"); /* store K^1_13 ^ K^2_13 ^ RC[13] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  224(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 224(%rdi)"); /* store K^1_14 ^ K^2_14 ^ RC[14] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  240(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 240(%rdi)"); /* store K^1_15 ^ K^2_15 ^ RC[15] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  256(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 256(%rdi)"); /* store K^1_16 ^ K^2_16 ^ RC[16] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  272(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 272(%rdi)"); /* store K^1_17 ^ K^2_17 ^ RC[17] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  288(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 288(%rdi)"); /* store K^1_18 ^ K^2_18 ^ RC[18] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  304(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 304(%rdi)"); /* store K^1_19 ^ K^2_19 ^ RC[19] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  320(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 320(%rdi)"); /* store K^1_20 ^ K^2_20 ^ RC[20] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  336(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 336(%rdi)"); /* store K^1_21 ^ K^2_21 ^ RC[21] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  352(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 352(%rdi)"); /* store K^1_22 ^ K^2_22 ^ RC[22] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  368(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 368(%rdi)"); /* store K^1_23 ^ K^2_23 ^ RC[23] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  384(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 384(%rdi)"); /* store K^1_24 ^ K^2_24 ^ RC[24] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  400(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 400(%rdi)"); /* store K^1_25 ^ K^2_25 ^ RC[25] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  416(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 416(%rdi)"); /* store K^1_26 ^ K^2_26 ^ RC[26] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  432(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 432(%rdi)"); /* store K^1_27 ^ K^2_27 ^ RC[27] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  448(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 448(%rdi)"); /* store K^1_28 ^ K^2_28 ^ RC[28] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  464(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 464(%rdi)"); /* store K^1_29 ^ K^2_29 ^ RC[29] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  480(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 480(%rdi)"); /* store K^1_30 ^ K^2_30 ^ RC[30] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  496(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 496(%rdi)"); /* store K^1_31 ^ K^2_31 ^ RC[31] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  512(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 512(%rdi)"); /* store K^1_32 ^ K^2_32 ^ RC[32] */
}


/*********************************************************************/
/* Perform the TWEAKEY inverse schedule of Joltik,                   */
/* to produce the 25 subkeys for decryption                          */
/*********************************************************************/
__attribute__((noinline)) void TweakeyScheduleTK2_reverse(const uint8_t* subkeys, const uint8_t* subkeys2) {

  /*      Note (__cdecl calling convention):          */
  /*             subkeys  is in %rdi                  */
  /*             subkeys2 is in %rsi                  */

  /* Avoid warnings */
  (void)subkeys;
  (void)subkeys2;

  /* Load constants (tables) */
  asm("movdqa AndMask(%rip), %xmm7");
  asm("movdqa AndMaskTopHalf(%rip), %xmm8");
  asm("movdqa AndMaskBottomHalf(%rip), %xmm9");
  asm("movdqa MulBy2(%rip), %xmm14");
  asm("lea RC(%rip), %r10");

  asm("movdqa (%rdi), %xmm6");

  /* Load second half of the master key (K^2) */
  asm("movdqa (%rsi), %xmm4");

  /* Write the 33 subkeys (for 32 rounds) */ 
  /***************************************/asm("movdqa     (%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,    (%rdi)"); /* store K^1_0  ^ K^2_0  ^ RC[ 0] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   16(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  16(%rdi)"); /* store K^1_1  ^ K^2_1  ^ RC[ 1] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   32(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  32(%rdi)"); /* store K^1_2  ^ K^2_2  ^ RC[ 2] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   48(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  48(%rdi)"); /* store K^1_3  ^ K^2_3  ^ RC[ 3] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   64(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  64(%rdi)"); /* store K^1_4  ^ K^2_4  ^ RC[ 4] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   80(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  80(%rdi)"); /* store K^1_5  ^ K^2_5  ^ RC[ 5] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa   96(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5,  96(%rdi)"); /* store K^1_6  ^ K^2_6  ^ RC[ 6] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  112(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 112(%rdi)"); /* store K^1_7  ^ K^2_7  ^ RC[ 7] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  128(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 128(%rdi)"); /* store K^1_8  ^ K^2_8  ^ RC[ 8] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  144(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 144(%rdi)"); /* store K^1_9  ^ K^2_9  ^ RC[ 9] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  160(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 160(%rdi)"); /* store K^1_10 ^ K^2_10 ^ RC[10] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  176(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 176(%rdi)"); /* store K^1_11 ^ K^2_11 ^ RC[11] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  192(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 192(%rdi)"); /* store K^1_12 ^ K^2_12 ^ RC[12] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  208(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 208(%rdi)"); /* store K^1_13 ^ K^2_13 ^ RC[13] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  224(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 224(%rdi)"); /* store K^1_14 ^ K^2_14 ^ RC[14] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  240(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 240(%rdi)"); /* store K^1_15 ^ K^2_15 ^ RC[15] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  256(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 256(%rdi)"); /* store K^1_16 ^ K^2_16 ^ RC[16] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  272(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 272(%rdi)"); /* store K^1_17 ^ K^2_17 ^ RC[17] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  288(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 288(%rdi)"); /* store K^1_18 ^ K^2_18 ^ RC[18] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  304(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 304(%rdi)"); /* store K^1_19 ^ K^2_19 ^ RC[19] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  320(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 320(%rdi)"); /* store K^1_20 ^ K^2_20 ^ RC[20] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  336(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 336(%rdi)"); /* store K^1_21 ^ K^2_21 ^ RC[21] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  352(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 352(%rdi)"); /* store K^1_22 ^ K^2_22 ^ RC[22] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  368(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 368(%rdi)"); /* store K^1_23 ^ K^2_23 ^ RC[23] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  384(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 384(%rdi)"); /* store K^1_24 ^ K^2_24 ^ RC[24] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  400(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 400(%rdi)"); /* store K^1_25 ^ K^2_25 ^ RC[25] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  416(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 416(%rdi)"); /* store K^1_26 ^ K^2_26 ^ RC[26] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  432(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 432(%rdi)"); /* store K^1_27 ^ K^2_27 ^ RC[27] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  448(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 448(%rdi)"); /* store K^1_28 ^ K^2_28 ^ RC[28] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  464(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 464(%rdi)"); /* store K^1_29 ^ K^2_29 ^ RC[29] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  480(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 480(%rdi)"); /* store K^1_30 ^ K^2_30 ^ RC[30] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  496(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 496(%rdi)"); /* store K^1_31 ^ K^2_31 ^ RC[31] */
  H_SSE(xmm6); MUL_AND_H_SSE(xmm4, xmm14); asm("movdqa  512(%r10), %xmm5"); asm("pxor %xmm6, %xmm5"); asm("pxor %xmm4, %xmm5"); asm("movdqa %xmm5, 512(%rdi)"); /* store K^1_32 ^ K^2_32 ^ RC[32] */

  /* The subkeys are used in reversed order.          */
  /* So we reverse the table.                         */
  asm("movdqa    (%rdi), %xmm6"); asm("movdqa 512(%rdi), %xmm5"); asm("movdqa %xmm5,    (%rdi)"); asm("movdqa %xmm6, 512(%rdi)");
  asm("movdqa  16(%rdi), %xmm6"); asm("movdqa 496(%rdi), %xmm5"); asm("movdqa %xmm5,  16(%rdi)"); asm("movdqa %xmm6, 496(%rdi)");
  asm("movdqa  32(%rdi), %xmm6"); asm("movdqa 480(%rdi), %xmm5"); asm("movdqa %xmm5,  32(%rdi)"); asm("movdqa %xmm6, 480(%rdi)");
  asm("movdqa  48(%rdi), %xmm6"); asm("movdqa 464(%rdi), %xmm5"); asm("movdqa %xmm5,  48(%rdi)"); asm("movdqa %xmm6, 464(%rdi)");
  asm("movdqa  64(%rdi), %xmm6"); asm("movdqa 448(%rdi), %xmm5"); asm("movdqa %xmm5,  64(%rdi)"); asm("movdqa %xmm6, 448(%rdi)");
  asm("movdqa  80(%rdi), %xmm6"); asm("movdqa 432(%rdi), %xmm5"); asm("movdqa %xmm5,  80(%rdi)"); asm("movdqa %xmm6, 432(%rdi)");
  asm("movdqa  96(%rdi), %xmm6"); asm("movdqa 416(%rdi), %xmm5"); asm("movdqa %xmm5,  96(%rdi)"); asm("movdqa %xmm6, 416(%rdi)");
  asm("movdqa 112(%rdi), %xmm6"); asm("movdqa 400(%rdi), %xmm5"); asm("movdqa %xmm5, 112(%rdi)"); asm("movdqa %xmm6, 400(%rdi)");
  asm("movdqa 128(%rdi), %xmm6"); asm("movdqa 384(%rdi), %xmm5"); asm("movdqa %xmm5, 128(%rdi)"); asm("movdqa %xmm6, 384(%rdi)");
  asm("movdqa 144(%rdi), %xmm6"); asm("movdqa 368(%rdi), %xmm5"); asm("movdqa %xmm5, 144(%rdi)"); asm("movdqa %xmm6, 368(%rdi)");
  asm("movdqa 160(%rdi), %xmm6"); asm("movdqa 352(%rdi), %xmm5"); asm("movdqa %xmm5, 160(%rdi)"); asm("movdqa %xmm6, 352(%rdi)");
  asm("movdqa 176(%rdi), %xmm6"); asm("movdqa 336(%rdi), %xmm5"); asm("movdqa %xmm5, 176(%rdi)"); asm("movdqa %xmm6, 336(%rdi)");
  asm("movdqa 192(%rdi), %xmm6"); asm("movdqa 320(%rdi), %xmm5"); asm("movdqa %xmm5, 192(%rdi)"); asm("movdqa %xmm6, 320(%rdi)");
  asm("movdqa 208(%rdi), %xmm6"); asm("movdqa 304(%rdi), %xmm5"); asm("movdqa %xmm5, 208(%rdi)"); asm("movdqa %xmm6, 304(%rdi)");
  asm("movdqa 224(%rdi), %xmm6"); asm("movdqa 288(%rdi), %xmm5"); asm("movdqa %xmm5, 224(%rdi)"); asm("movdqa %xmm6, 288(%rdi)");
  asm("movdqa 240(%rdi), %xmm6"); asm("movdqa 272(%rdi), %xmm5"); asm("movdqa %xmm5, 240(%rdi)"); asm("movdqa %xmm6, 272(%rdi)");

  /* For decryption using the table-based approach,            */
  /* we need to pass K_1, ..., K_32 through invMC (not K_0)    */
  asm("movdqa   16(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6,  16(%rdi)"); /* MC^(-1){K^1_1  ^ K^2_1  ^ RC[ 1]} */
  asm("movdqa   32(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6,  32(%rdi)"); /* MC^(-1){K^1_2  ^ K^2_2  ^ RC[ 2]} */
  asm("movdqa   48(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6,  48(%rdi)"); /* MC^(-1){K^1_3  ^ K^2_3  ^ RC[ 3]} */
  asm("movdqa   64(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6,  64(%rdi)"); /* MC^(-1){K^1_4  ^ K^2_4  ^ RC[ 4]} */
  asm("movdqa   80(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6,  80(%rdi)"); /* MC^(-1){K^1_5  ^ K^2_5  ^ RC[ 5]} */
  asm("movdqa   96(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6,  96(%rdi)"); /* MC^(-1){K^1_6  ^ K^2_6  ^ RC[ 6]} */
  asm("movdqa  112(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 112(%rdi)"); /* MC^(-1){K^1_7  ^ K^2_7  ^ RC[ 7]} */
  asm("movdqa  128(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 128(%rdi)"); /* MC^(-1){K^1_8  ^ K^2_8  ^ RC[ 8]} */
  asm("movdqa  144(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 144(%rdi)"); /* MC^(-1){K^1_9  ^ K^2_9  ^ RC[ 9]} */
  asm("movdqa  160(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 160(%rdi)"); /* MC^(-1){K^1_10 ^ K^2_10 ^ RC[10]} */
  asm("movdqa  176(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 176(%rdi)"); /* MC^(-1){K^1_11 ^ K^2_11 ^ RC[11]} */
  asm("movdqa  192(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 192(%rdi)"); /* MC^(-1){K^1_12 ^ K^2_12 ^ RC[12]} */
  asm("movdqa  208(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 208(%rdi)"); /* MC^(-1){K^1_13 ^ K^2_13 ^ RC[13]} */
  asm("movdqa  224(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 224(%rdi)"); /* MC^(-1){K^1_14 ^ K^2_14 ^ RC[14]} */
  asm("movdqa  240(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 240(%rdi)"); /* MC^(-1){K^1_15 ^ K^2_15 ^ RC[15]} */
  asm("movdqa  256(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 256(%rdi)"); /* MC^(-1){K^1_16 ^ K^2_16 ^ RC[16]} */
  asm("movdqa  272(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 272(%rdi)"); /* MC^(-1){K^1_17 ^ K^2_17 ^ RC[17]} */
  asm("movdqa  288(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 288(%rdi)"); /* MC^(-1){K^1_18 ^ K^2_18 ^ RC[18]} */
  asm("movdqa  304(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 304(%rdi)"); /* MC^(-1){K^1_19 ^ K^2_19 ^ RC[19]} */
  asm("movdqa  320(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 320(%rdi)"); /* MC^(-1){K^1_20 ^ K^2_20 ^ RC[20]} */
  asm("movdqa  336(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 336(%rdi)"); /* MC^(-1){K^1_21 ^ K^2_21 ^ RC[21]} */
  asm("movdqa  352(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 352(%rdi)"); /* MC^(-1){K^1_22 ^ K^2_22 ^ RC[22]} */
  asm("movdqa  368(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 368(%rdi)"); /* MC^(-1){K^1_23 ^ K^2_23 ^ RC[23]} */
  asm("movdqa  384(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 384(%rdi)"); /* MC^(-1){K^1_24 ^ K^2_24 ^ RC[24]} */
  asm("movdqa  400(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 400(%rdi)"); /* MC^(-1){K^1_25 ^ K^2_25 ^ RC[25]} */
  asm("movdqa  416(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 416(%rdi)"); /* MC^(-1){K^1_26 ^ K^2_26 ^ RC[26]} */
  asm("movdqa  432(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 432(%rdi)"); /* MC^(-1){K^1_27 ^ K^2_27 ^ RC[27]} */
  asm("movdqa  448(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 448(%rdi)"); /* MC^(-1){K^1_28 ^ K^2_28 ^ RC[28]} */
  asm("movdqa  464(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 464(%rdi)"); /* MC^(-1){K^1_29 ^ K^2_29 ^ RC[29]} */
  asm("movdqa  480(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 480(%rdi)"); /* MC^(-1){K^1_30 ^ K^2_30 ^ RC[30]} */
  asm("movdqa  496(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 496(%rdi)"); /* MC^(-1){K^1_31 ^ K^2_31 ^ RC[31]} */
  asm("movdqa  512(%rdi), %xmm6"); MC_SSE(xmm6); asm("movdqa %xmm6, 512(%rdi)"); /* MC^(-1){K^1_32 ^ K^2_32 ^ RC[32]} */
}

/*********************************************************************/
/* Perform the encryption of the input message by the Joltik-BC      */
/* tweakable block cipher.                                           */
/*  - The input "message" contains two 64-bit message blocks         */
/*    that are encrypted in parallel.                                */
/*  - The tweakey input "tweakey" contains the key and tweak         */
/*    material as 64-bit elements each.                              */
/*  - The ciphertext contains the two encrypted 64-bit block.        */
/*********************************************************************/
__attribute__((noinline)) void aesTweakEncrypt(const uint8_t* message, const uint8_t* subkeys, const uint8_t* tweak, const uint8_t* tweak2, uint8_t* ciphertext) {

  /*      Note (__cdecl calling convention):          */
  /*             message is in %rdi                   */
  /*             subkeys is in %rsi                   */
  /*             tweak in %rdx                        */
  /*             tweak2 in %rcx                       */
  /*             ciphertext in %r8                    */

  /* Avoid warnings */
  (void)message;
  (void)subkeys;
  (void)tweak;
  (void)tweak2;
  (void)ciphertext;        

  /* Callee-saved registers: r12, r13, r14, r15, rbx, rsp, rbp */

  /* Reset round counter (%r9) and store base pointer in %r10 */
  asm("xor %r9, %r9");  

  /* Load constants (TBoxes) */
  asm("movdqa T_1_4(%rip), %xmm0");
  asm("movdqa T_9_13(%rip), %xmm1");
  asm("movdqa T_4_1(%rip), %xmm2");
  asm("movdqa T_13_9(%rip), %xmm3");

  /*asm("movdqa ShiftRowsT2(%rip), %xmm6");*/
  /*asm("movdqa ShiftRowsT1(%rip), %xmm15");*/
  asm("movdqa AndMask(%rip), %xmm7");  
  asm("movdqa AndMaskTopHalf(%rip), %xmm8");  
  asm("movdqa AndMaskBottomHalf(%rip), %xmm9");  
  asm("movdqa MulBy2(%rip), %xmm14");
  asm("movdqa MulBy4(%rip), %xmm15");

  /* Load state */
  asm("movdqu (%rdi), %xmm4");

  /* Load tweaks */
  asm("movdqa (%rdx), %xmm5"); /* mul2 */
  asm("movdqa (%rcx), %xmm6"); /* mul4 */

  /* Load array of subkeys */
  asm("mov %rsi, %r11"); 

  /* Initial AddTweakey */
  asm("pxor (%r11, %r9, 1), %xmm4");
  asm("pxor %xmm5, %xmm4");
  asm("pxor %xmm6, %xmm4");

  /* 32 rounds */
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  JOLTIKROUND_SSE();
  /* The output register is xmm4 */

  asm("movdqu %xmm4, (%r8)");

}

/*********************************************************************/
/* Perform the decryption of the input message by the Joltik-BC      */
/* tweakable block cipher.                                           */
/*  - The input "message" contains two 64-bit message blocks         */
/*    that are decrypted in parallel.                                */
/*  - The tweakey input "tweakey" contains the key and tweak         */
/*    material as 64-bit elements each.                              */
/*  - The ciphertext contains the two decrypted 64-bit block.        */
/*********************************************************************/
__attribute__((noinline)) void aesTweakDecrypt(const uint8_t* message, const uint8_t* subkeys, const uint8_t* tweak, const uint8_t* tweak2, uint8_t* ciphertext) {

  /*      Note (__cdecl calling convention):          */
  /*             message is in %rdi                   */
  /*             subkeys is in %rsi                   */
  /*             tweak in %rdx                        */
  /*             tweak2 in %rcx                       */
  /*             ciphertext in %r8                    */

  /* Avoid warnings */
  (void)message;
  (void)subkeys;
  (void)tweak;
  (void)tweak2;
  (void)ciphertext;

  /* Reset round counter (%r9) */
  asm("xor %r9, %r9");

  /* Load constants (TBoxes) */
  asm("movdqa invT_1_4(%rip), %xmm0");
  asm("movdqa invT_9_13(%rip), %xmm1");
  asm("movdqa invT_4_1(%rip), %xmm2");
  asm("movdqa invT_13_9(%rip), %xmm3");

  /* Load state */
  asm("movdqu (%rdi), %xmm4");

  /* Load tweaks */
  asm("movdqa (%rdx), %xmm5"); /* mul2^-1 */
  asm("movdqa (%rcx), %xmm6"); /* mul4^-1 */

  /* Load constants (tables) */
  /*asm("movdqa ShiftRowsT2(%rip), %xmm6");*/
  /*asm("movdqa invShiftRowsT1(%rip), %xmm15");*/
  asm("movdqa AndMask(%rip), %xmm7");
  asm("movdqa AndMaskTopHalf(%rip), %xmm8");
  asm("movdqa AndMaskBottomHalf(%rip), %xmm9");

 /* Apply the 32 TS rounds to the tweak to get the final one.  */
  /* Then, the decryption will get the previous                 */
  /* ones backwards, once at a time.                            */
  /* Note that H^8 = Id so H^32=Id, and multiplication by 4^32  */
  /* in GF(2^4)/0x3 is multiplication by 3.                     */
  asm("movdqa MulBy4(%rip), %xmm14");   /* 2^32 = 4 in GF(16)/3 */
  asm("movdqa MulBy4to32(%rip), %xmm15");
  MUL_SSE(xmm5, xmm14);
  MUL_SSE(xmm6, xmm15);

  /* In the rest, we use multiplication by 2 */
  asm("movdqa DivBy2(%rip), %xmm14");
  asm("movdqa DivBy4(%rip), %xmm15");  

  /* Load array of subkeys */
  asm("mov %rsi, %r11");

  /* Initial AddTweakey */
  asm("pxor %xmm5, %xmm4");
  asm("pxor %xmm6, %xmm4");
  asm("pxor (%r11, %r9, 1), %xmm4");

  /* Pass the state  through MC and then proceed to     */
  /* decryption using the table-based approach.         */
  MC_SSE(xmm4);  

  /* 32 rounds */
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  JOLTIKROUND_INVERSE_SSE();
  /* The output register is xmm4 */

  /* Apply the MixColums to invert the last one performed in the table */
  MC_SSE(xmm4);

  asm("movdqu %xmm4, (%r8)");

}

