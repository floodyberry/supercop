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

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <emmintrin.h>

#define ALIGN(n) 	__attribute__ ((aligned ((n))))
#define HIDDEN_ALIGN(n) __attribute__ ((visibility("hidden"),aligned(n)))

/* Joltik four TBoxes */
HIDDEN_ALIGN(32) uint8_t T_1_4[]     asm ("T_1_4")     = {0xed, 0x43, 0xba, 0x28, 0x3c, 0x86, 0x00, 0x92, 0x14, 0xae, 0x7f, 0xf9, 0x6b, 0xc5, 0x57, 0xd1,        0xed, 0x43, 0xba, 0x28, 0x3c, 0x86, 0x00, 0x92, 0x14, 0xae, 0x7f, 0xf9, 0x6b, 0xc5, 0x57, 0xd1};
HIDDEN_ALIGN(32) uint8_t T_9_13[]    asm ("T_9_13")    = {0x7a, 0x21, 0xc6, 0x19, 0x84, 0x42, 0x00, 0xdf, 0x9d, 0x5b, 0xa5, 0xe7, 0x38, 0x63, 0xbc, 0xfe,        0x7a, 0x21, 0xc6, 0x19, 0x84, 0x42, 0x00, 0xdf, 0x9d, 0x5b, 0xa5, 0xe7, 0x38, 0x63, 0xbc, 0xfe};
HIDDEN_ALIGN(32) uint8_t T_4_1[]     asm ("T_4_1")     = {0xde, 0x34, 0xab, 0x82, 0xc3, 0x68, 0x00, 0x29, 0x41, 0xea, 0xf7, 0x9f, 0xb6, 0x5c, 0x75, 0x1d,        0xde, 0x34, 0xab, 0x82, 0xc3, 0x68, 0x00, 0x29, 0x41, 0xea, 0xf7, 0x9f, 0xb6, 0x5c, 0x75, 0x1d};
HIDDEN_ALIGN(32) uint8_t T_13_9[]    asm ("T_13_9")    = {0xa7, 0x12, 0x6c, 0x91, 0x48, 0x24, 0x00, 0xfd, 0xd9, 0xb5, 0x5a, 0x7e, 0x83, 0x36, 0xcb, 0xef,        0xa7, 0x12, 0x6c, 0x91, 0x48, 0x24, 0x00, 0xfd, 0xd9, 0xb5, 0x5a, 0x7e, 0x83, 0x36, 0xcb, 0xef};

HIDDEN_ALIGN(32) uint8_t invT_1_4[]  asm ("invT_1_4")  = {0x6b, 0x86, 0x3c, 0x43, 0x14, 0xed, 0xc5, 0xae, 0x57, 0x7f, 0x92, 0x28, 0xd1, 0xf9, 0x00, 0xba,        0x6b, 0x86, 0x3c, 0x43, 0x14, 0xed, 0xc5, 0xae, 0x57, 0x7f, 0x92, 0x28, 0xd1, 0xf9, 0x00, 0xba};
HIDDEN_ALIGN(32) uint8_t invT_9_13[] asm ("invT_9_13") = {0x38, 0x42, 0x84, 0x21, 0x9d, 0x7a, 0x63, 0x5b, 0xbc, 0xa5, 0xdf, 0x19, 0xfe, 0xe7, 0x00, 0xc6,        0x38, 0x42, 0x84, 0x21, 0x9d, 0x7a, 0x63, 0x5b, 0xbc, 0xa5, 0xdf, 0x19, 0xfe, 0xe7, 0x00, 0xc6};
HIDDEN_ALIGN(32) uint8_t invT_4_1[]  asm ("invT_4_1")  = {0xb6, 0x68, 0xc3, 0x34, 0x41, 0xde, 0x5c, 0xea, 0x75, 0xf7, 0x29, 0x82, 0x1d, 0x9f, 0x00, 0xab,        0xb6, 0x68, 0xc3, 0x34, 0x41, 0xde, 0x5c, 0xea, 0x75, 0xf7, 0x29, 0x82, 0x1d, 0x9f, 0x00, 0xab};
HIDDEN_ALIGN(32) uint8_t invT_13_9[] asm ("invT_13_9") = {0x83, 0x24, 0x48, 0x12, 0xd9, 0xa7, 0x36, 0xb5, 0xcb, 0x5a, 0xfd, 0x91, 0xef, 0x7e, 0x00, 0x6c,        0x83, 0x24, 0x48, 0x12, 0xd9, 0xa7, 0x36, 0xb5, 0xcb, 0x5a, 0xfd, 0x91, 0xef, 0x7e, 0x00, 0x6c};

/* MC tables for decryption */
HIDDEN_ALIGN(32) uint8_t MC_4_1[]    asm ("MC_4_1")    = {0x00, 0x41, 0x82, 0xc3, 0x34, 0x75, 0xb6, 0xf7, 0x68, 0x29, 0xea, 0xab, 0x5c, 0x1d, 0xde, 0x9f,        0x00, 0x41, 0x82, 0xc3, 0x34, 0x75, 0xb6, 0xf7, 0x68, 0x29, 0xea, 0xab, 0x5c, 0x1d, 0xde, 0x9f};
HIDDEN_ALIGN(32) uint8_t MC_13_9[]   asm ("MC_13_9")   = {0x00, 0xd9, 0x91, 0x48, 0x12, 0xcb, 0x83, 0x5a, 0x24, 0xfd, 0xb5, 0x6c, 0x36, 0xef, 0xa7, 0x7e,        0x00, 0xd9, 0x91, 0x48, 0x12, 0xcb, 0x83, 0x5a, 0x24, 0xfd, 0xb5, 0x6c, 0x36, 0xef, 0xa7, 0x7e};
HIDDEN_ALIGN(32) uint8_t MC_1_4[]    asm ("MC_1_4")    = {0x00, 0x14, 0x28, 0x3c, 0x43, 0x57, 0x6b, 0x7f, 0x86, 0x92, 0xae, 0xba, 0xc5, 0xd1, 0xed, 0xf9,        0x00, 0x14, 0x28, 0x3c, 0x43, 0x57, 0x6b, 0x7f, 0x86, 0x92, 0xae, 0xba, 0xc5, 0xd1, 0xed, 0xf9};
HIDDEN_ALIGN(32) uint8_t MC_9_13[]   asm ("MC_9_13")   = {0x00, 0x9d, 0x19, 0x84, 0x21, 0xbc, 0x38, 0xa5, 0x42, 0xdf, 0x5b, 0xc6, 0x63, 0xfe, 0x7a, 0xe7,        0x00, 0x9d, 0x19, 0x84, 0x21, 0xbc, 0x38, 0xa5, 0x42, 0xdf, 0x5b, 0xc6, 0x63, 0xfe, 0x7a, 0xe7};

/* Mutliplication table x2 in GF(2^4)/0x3 */
HIDDEN_ALIGN(32) uint8_t MulBy2[]       asm ("MulBy2")     = {0, 2, 4, 6, 8, 10, 12, 14, 3, 1, 7, 5, 11, 9, 15, 13,    0, 2, 4, 6, 8, 10, 12, 14, 3, 1, 7, 5, 11, 9, 15, 13};
HIDDEN_ALIGN(32) uint8_t DivBy2[]       asm ("DivBy2")     = {0, 9, 1, 8, 2, 11, 3, 10, 4, 13, 5, 12, 6, 15, 7, 14,    0, 9, 1, 8, 2, 11, 3, 10, 4, 13, 5, 12, 6, 15, 7, 14};
HIDDEN_ALIGN(32) uint8_t MulBy4to32[]   asm ("MulBy4to32") = {0, 3, 6, 5, 12, 15, 10, 9, 11, 8, 13, 14, 7, 4, 1, 2,    0, 3, 6, 5, 12, 15, 10, 9, 11, 8, 13, 14, 7, 4, 1, 2};

/* Mutliplication table x4 in GF(2^4)/0x3 */
HIDDEN_ALIGN(32) uint8_t MulBy4[] asm ("MulBy4") = {0, 4, 8, 12, 3, 7, 11, 15, 6, 2, 14, 10, 5, 1, 13, 9,    0, 4, 8, 12, 3, 7, 11, 15, 6, 2, 14, 10, 5, 1, 13, 9};
HIDDEN_ALIGN(32) uint8_t DivBy4[] asm ("DivBy4") = {0, 13, 9, 4, 1, 12, 8, 5, 2, 15, 11, 6, 3, 14, 10, 7,    0, 13, 9, 4, 1, 12, 8, 5, 2, 15, 11, 6, 3, 14, 10, 7};

/* Masks */
HIDDEN_ALIGN(32) uint8_t AndMask[]           asm("AndMask")            = {0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f,       0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f};
HIDDEN_ALIGN(32) uint8_t AndMaskTopHalf[]    asm("AndMaskTopHalf")     = {0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,       0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00};
HIDDEN_ALIGN(32) uint8_t AndMaskBottomHalf[] asm("AndMaskBottomHalf")  = {0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,       0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff};

/* Shuffling for ShiftRows */
HIDDEN_ALIGN(32) uint8_t ShiftRowsT1[] asm("ShiftRowsT1")  = {2,7,4,1,6,3,0,5,  10,15,12,9,14,11,8,13,    18,23,20,17,22,19,16,21,    26,31,28,25,30,27,24,29};
HIDDEN_ALIGN(32) uint8_t ShiftRowsT2[] asm("ShiftRowsT2")  = {0,5,2,7,4,1,6,3,  8,13,10,15,12,9,14,11,    16,21,18,23,20,17,22,19,    24,29,26,31,28,25,30,27};

/* Shuffling for invShiftRows */
HIDDEN_ALIGN(32) uint8_t invShiftRowsT1[] asm("invShiftRowsT1")  = {6,3,0,5,2,7,4,1,  14,11,8,13,10,15,12,9,  22,19,16,21,18,23,20,17,  30,27,24,29,26,31,28,25};

/* Shuffling for the tweakey schedule */
HIDDEN_ALIGN(32) uint8_t Tweakey_H1[] asm("Tweakey_H1")  = {3,6,5,0,7,2,1,4,  11,14,13,8,15,10,9,12,  19,22,21,16,23,18,17,20,  27,30,29,24,31,26,25,28};
HIDDEN_ALIGN(32) uint8_t Tweakey_H2[] asm("Tweakey_H2")  = {0,5,2,7,4,1,6,3,  8,13,10,15,12,9,14,11,  16,21,18,23,20,17,22,19,  24,29,26,31,28,25,30,27};

/* Round constants for Joltik (same as LED) */
HIDDEN_ALIGN(32) uint8_t RC[32*(1+32)] asm("RC") = {
  0x01, 0x23, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x76, 0x76, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x76, 0x76, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x76, 0x76, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x76, 0x76, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x75, 0x75, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x75, 0x75, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x75, 0x75, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x75, 0x75, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x73, 0x73, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x73, 0x73, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x73, 0x73, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x73, 0x73, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x67, 0x67, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x67, 0x67, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x67, 0x67, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x67, 0x67, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x57, 0x57, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x57, 0x57, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x57, 0x57, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x57, 0x57, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x74, 0x74, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x74, 0x74, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x74, 0x74, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x74, 0x74, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x71, 0x71, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x71, 0x71, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x71, 0x71, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x71, 0x71, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x47, 0x47, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x47, 0x47, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x47, 0x47, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x47, 0x47, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x35, 0x35, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x35, 0x35, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x35, 0x35, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x35, 0x35, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x72, 0x72, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x72, 0x72, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x72, 0x72, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x72, 0x72, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x65, 0x65, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x65, 0x65, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x65, 0x65, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x65, 0x65, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x53, 0x53, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x53, 0x53, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x53, 0x53, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x53, 0x53, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x56, 0x56, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x56, 0x56, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x56, 0x56, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x56, 0x56, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x34, 0x34, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x34, 0x34, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x34, 0x34, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x34, 0x34, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x23, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00
};


/*********************************************************************/
/* Multiply all the nibbles in vectors "in" by 2 in the field, and   */
/* then apply the H permutation from the Joltik design.              */
/* Uses registers:                                                   */
/*      input/output: #in, #table (MultiplicationTable)              */
/*      tables:       ymm7(AndMask)                                  */
/*      temporary:    ymm12, ymm13                                   */
/*********************************************************************/
#define MUL_AND_H_AVX2(in, table) do {                 \
  asm("vpsrlw $4, %"#in", %ymm13");                    \
  asm("vpand %ymm7, %"#in", %"#in"");                  \
  asm("vpshufb Tweakey_H1(%rip), %"#in", %"#in);       \
  asm("vpand %ymm7, %ymm13, %ymm13");                  \
  asm("vpshufb Tweakey_H2(%rip), %ymm13, %ymm13");     \
  asm("vpshufb  %ymm13, %"#table", %ymm12");           \
  asm("vpshufb %"#in", %"#table", %ymm13");            \
  asm("vpsllw $4, %ymm13, %ymm13");                    \
  asm("vpxor %ymm12, %ymm13, %"#in);                   \
 } while(0);

/*********************************************************************/
/* Multiply all the nibbles in vectors "in" by 2 in the field, and   */
/* then apply the inverse of H permutation from the Joltik design.   */
/* Uses registers:                                                   */
/*      input/output: #in, #table (MultiplicationTable)              */
/*      tables:       ymm7(AndMask)                                  */
/*      temporary:    ymm12, ymm13                                   */
/*********************************************************************/
#define MUL_AND_INVH_AVX2(in, table) do {              \
  asm("vpsrlw $4, %"#in", %ymm13");                    \
  asm("vpand %ymm7, %"#in", %"#in"");                  \
  asm("vpshufb Tweakey_H2(%rip), %"#in", %"#in);       \
  asm("vpand %ymm7, %ymm13, %ymm13");                  \
  asm("vpshufb Tweakey_H1(%rip), %ymm13, %ymm13");     \
  asm("vpshufb  %ymm13, %"#table", %ymm12");           \
  asm("vpshufb %"#in", %"#table", %ymm13");            \
  asm("vpsllw $4, %ymm13, %ymm13");                    \
  asm("vpxor %ymm12, %ymm13, %"#in);                   \
 } while(0);


/*********************************************************************/
/* Multiply all the nibbles in vectors "in" by 2 in the field        */
/* Uses registers:                                                   */
/*      input/output: #in, #table (MultiplicationTable)              */
/*      tables:       ymm7(AndMask)                                  */
/*      temporary:    ymm12, ymm13                                   */
/*********************************************************************/
#define MUL_AVX2(in, table) do {                            \
  /* Consider high nibbles */                               \
  asm("vpsrlw $4, %"#in", %ymm12");                         \
  asm("vpand %ymm7, %ymm12, %ymm13");                       \
  asm("vpshufb %ymm13, %"#table", %ymm12");                 \
  asm("vpsllw $4, %ymm12, %ymm12");                         \
                                                            \
  /* Consider low nibbles */                                \
  asm("vpand %ymm7, %"#in", %ymm13");                       \
  asm("vpshufb %ymm13, %"#table", %"#in);                   \
                                                            \
  asm("vpxor %ymm12, %"#in", %"#in);                        \
 } while(0);


/*********************************************************************/
/* Consider the register "in" as two 64-bit elements, each of        */
/* the 16 nibbles.                                                   */
/* Then, apply the H permutation from Joltik to the two elements.    */
/* Uses registers:                                                   */
/*      input/output: #in                                            */
/*      tables:       ymm7, Tweakey_H1, Tweakey_H2                   */
/*      temporary:    ymm13                                          */
/*********************************************************************/
#define H_AVX2(in) do {                                          \
    asm("vpsrlw $4, %"#in", %ymm13");                            \
    asm("vpand %ymm7, %"#in", %"#in);                            \
    asm("vpshufb Tweakey_H1(%rip), %"#in", %"#in);               \
    asm("vpand %ymm7, %ymm13, %ymm13");                          \
    asm("vpsllw $4, %"#in", %"#in);                              \
    asm("vpshufb Tweakey_H2(%rip), %ymm13, %ymm13");             \
    asm("vpxor %ymm13, %"#in", %"#in);                           \
  } while(0);


/*********************************************************************/
/* Consider the register "in" as two 64-bit elements, each of the    */
/* 16 nibbles.                                                       */
/* Then, apply the MC involution transformation of Joltik            */
/* Uses registers:                                                   */
/*      input/output: #in                                            */
/*      tweak:        ymm5                                           */
/*      T-tables:     MC_4_1, MC_13_9, MC_1_4, MC_9_13               */
/*      tables:       ymm7, ymm8, ymm9                               */
/*      temporary:    ymm10, ymm11, ymm12, ymm13                     */
/*********************************************************************/
 #define MC_AVX2(in) do {                                               \
    /* ------------------------------------------------------------- */ \
    /* First lookup*/                                                   \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("vpand %"#in", %ymm7, %ymm13");                                 \
                                                                        \
    /* Get T_1_4[] and T_9_13[]                                      */ \
    asm("vmovdqa MC_4_1(%rip), %ymm11");                                \
    asm("vpshufb %ymm13, %ymm11, %ymm11");                              \
    asm("vmovdqa MC_13_9(%rip), %ymm12");                               \
    asm("vpshufb %ymm13, %ymm12, %ymm12");                              \
                                                                        \
    asm("vpand %ymm9, %ymm12, %ymm10");    /* Get the    top half    */ \
    asm("vpsrlw $8, %ymm10, %ymm10");      /* Shift back             */ \
    asm("vpand %ymm8, %ymm12, %ymm12");    /* Shift back             */ \
    asm("vpsllw $8, %ymm12, %ymm12");      /* Shift back             */ \
    asm("vpxor %ymm12, %ymm10, %ymm13");   /* Accumulate             */ \
    asm("vpxor %ymm13, %ymm11, %ymm10");   /* Accumulate             */ \
    /* ------------------------------------------------------------- */ \
    /* Second lookup                                                 */ \
    asm("vpsrlw $4, %"#in", %ymm13");                                   \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("vpand %ymm7, %ymm13, %ymm13");                                 \
                                                                        \
    /* Get T_1_4[] and T_9_13[]                                      */ \
    asm("vmovdqa MC_1_4(%rip), %ymm11");                                \
    asm("vpshufb %ymm13, %ymm11, %ymm11");                              \
    asm("vmovdqa MC_9_13(%rip), %ymm12");                               \
    asm("vpshufb %ymm13, %ymm12, %ymm12");                              \
                                                                        \
    asm("vpand %ymm9, %ymm12, %"#in"");   /* Get the top half        */ \
    asm("vpsrlw $8, %"#in", %"#in"");     /* Shift back              */ \
    asm("vpand %ymm8, %ymm12, %ymm12");   /* Shift back              */ \
    asm("vpsllw $8, %ymm12, %ymm12");     /* Shift back              */ \
    asm("vpxor %ymm12, %"#in", %ymm13");  /* Accumulate              */ \
    asm("vpxor %ymm13, %ymm11, %"#in);    /* Accumulate              */ \
    asm("vpxor %"#in", %ymm10, %"#in);    /* Accumulate              */ \
    /* ------------------------------------------------------------- */ \
    } while(0); 


/*********************************************************************/
/* Joltik round function on %ymm4                                    */
/* Uses registers:                                                   */
/*      input/output: ymm4                                           */
/*      tweak:        ymm5, ymm6                                      */
/*      T-tables:     ymm0, ymm1, ymm2, ymm3                         */
/*      tables:       ymm7, ymm8, ymm9, ymm14, ymm15                 */
/*      temporary:    ymm10, ymm11, ymm12, ymm13                     */
/*********************************************************************/
#define JOLTIKROUND_AVX2() do {                                         \
    /* ------------------------------------------------------------- */ \
    /* First lookup*/                                                   \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("vpand %ymm4, %ymm7, %ymm13");                                  \
                                                                        \
    /* Perform the ShiftRows for two lines (second and last lines)   */ \
    asm("vpshufb ShiftRowsT1(%rip), %ymm13, %ymm13");                   \
                                                                        \
    /* Get T_1_4[] and T_9_13[]                                      */ \
    asm("vpshufb %ymm13, %ymm2, %ymm11");                               \
    asm("vpshufb %ymm13, %ymm3, %ymm12");                               \
                                                                        \
    asm("vpand %ymm9, %ymm12, %ymm10");    /* Get the    top half    */ \
    asm("vpsrlw $8, %ymm10, %ymm10");      /* Shift back             */ \
    asm("vpand %ymm8, %ymm12, %ymm12");    /* Shift back             */ \
    asm("vpsllw $8, %ymm12, %ymm12");      /* Shift back             */ \
    asm("vpxor %ymm12, %ymm10, %ymm13");   /* Accumulate             */ \
    asm("vpxor %ymm13, %ymm11, %ymm10");   /* Accumulate             */ \
    /* ------------------------------------------------------------- */ \
    /* Second lookup                                                 */ \
                                                                        \
    /* Save state */                                                    \
    asm("vpsrlw  $4, %ymm4, %ymm13");                                   \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("vpand %ymm7, %ymm13, %ymm13");                                 \
                                                                        \
    /* Perform the ShiftRows for two lines (second and last lines)   */ \
    asm("vpshufb ShiftRowsT2(%rip), %ymm13, %ymm13");                   \
                                                                        \
    /* Get T_1_4[] and T_9_13[]                                      */ \
    asm("vpshufb %ymm13, %ymm0, %ymm11");                               \
    asm("vpshufb %ymm13, %ymm1, %ymm12");                               \
                                                                        \
    asm("vpand %ymm9, %ymm12, %ymm4");    /* Get the    top half     */ \
    asm("vpsrlw $8, %ymm4, %ymm4");       /* Shift back              */ \
    asm("vpand %ymm8, %ymm12, %ymm12");   /* Shift back              */ \
    asm("vpsllw $8, %ymm12, %ymm12");     /* Shift back              */ \
    asm("vpxor %ymm12, %ymm4, %ymm13");   /* Accumulate              */ \
    asm("vpxor %ymm13, %ymm11, %ymm4");   /* Accumulate              */ \
    asm("vpxor %ymm4, %ymm10, %ymm4");    /* Accumulate              */ \
    /* ------------------------------------------------------------- */ \
    /* Tweakey schedule on the tweak input                           */ \
    MUL_AND_H_AVX2(ymm5, ymm14)                                         \
    MUL_AND_H_AVX2(ymm6, ymm15)                                         \
    /* ------------------------------------------------------------- */ \
    /* AddRoundTweakey (tweak in %ymm5, subkeys are precomp. in %r11)*/ \
    asm("add  $32, %r9");                 /* Round counter * 32      */ \
    asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4");                          \
    asm("vpxor %ymm5, %ymm4, %ymm4");                                   \
    asm("vpxor %ymm6, %ymm4, %ymm4");                                   \
    } while(0); 



/*********************************************************************/
/* Joltik inverse round function on %ymm4                            */
/* Uses registers:                                                   */
/*      input/output: ymm4                                           */
/*      tweak:        ymm5, ymm6                                      */
/*      T-tables:     ymm0, ymm1, ymm2, ymm3                         */
/*      tables:       ymm7, ymm8, ymm9, ymm14, ymm15                 */
/*      temporary:    ymm10, ymm11, ymm12, ymm13                     */
/*********************************************************************/
#define JOLTIKROUND_INVERSE_AVX2() do {                                 \
    /* ------------------------------------------------------------- */ \
    /* First lookup*/                                                   \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("vpand %ymm4, %ymm7, %ymm13");                                  \
                                                                        \
    /* Perform the ShiftRows for two lines (second and last lines)   */ \
    asm("vpshufb invShiftRowsT1(%rip), %ymm13, %ymm13");                \
                                                                        \
    /* Get T_1_4[] and T_9_13[]                                      */ \
    asm("vpshufb %ymm13, %ymm2, %ymm11");                               \
    asm("vpshufb %ymm13, %ymm3, %ymm12");                               \
                                                                        \
    asm("vpand %ymm9, %ymm12, %ymm10");    /* Get the    top half    */ \
    asm("vpsrlw $8, %ymm10, %ymm10");      /* Shift back             */ \
    asm("vpand %ymm8, %ymm12, %ymm12");    /* Shift back             */ \
    asm("vpsllw $8, %ymm12, %ymm12");      /* Shift back             */ \
    asm("vpxor %ymm12, %ymm10, %ymm13");   /* Accumulate             */ \
    asm("vpxor %ymm13, %ymm11, %ymm10");   /* Accumulate             */ \
    /* ------------------------------------------------------------- */ \
    /* Second lookup                                                 */ \
                                                                        \
    /* Save state */                                                    \
    asm("vpsrlw  $4, %ymm4, %ymm13");                                   \
                                                                        \
    /* Apply AND mask to isolate the nibbles we want                 */ \
    asm("vpand %ymm7, %ymm13, %ymm13");                                 \
                                                                        \
    /* Perform the ShiftRows for two lines (second and last lines)   */ \
    asm("vpshufb ShiftRowsT2(%rip), %ymm13, %ymm13");                \
                                                                        \
    /* Get T_1_4[] and T_9_13[]                                      */ \
    asm("vpshufb %ymm13, %ymm0, %ymm11");                               \
    asm("vpshufb %ymm13, %ymm1, %ymm12");                               \
                                                                        \
    asm("vpand %ymm9, %ymm12, %ymm4");    /* Get the    top half     */ \
    asm("vpsrlw $8, %ymm4, %ymm4");       /* Shift back              */ \
    asm("vpand %ymm8, %ymm12, %ymm12");   /* Shift back              */ \
    asm("vpsllw $8, %ymm12, %ymm12");     /* Shift back              */ \
    asm("vpxor %ymm12, %ymm4, %ymm13");   /* Accumulate              */ \
    asm("vpxor %ymm13, %ymm11, %ymm4");   /* Accumulate              */ \
    asm("vpxor %ymm4, %ymm10, %ymm4");    /* Accumulate              */ \
    /* ------------------------------------------------------------- */ \
    /* Tweakey schedule on the tweak input */                           \
    MUL_AND_INVH_AVX2(ymm5,ymm14) /* ymm14 containts mult. by 2^-1   */ \
    MUL_AND_INVH_AVX2(ymm6,ymm15) /* ymm14 containts mult. by 4^-1   */ \
    /* ------------------------------------------------------------- */ \
    /* AddRoundTweakey (tweak in %ymm5, subkeys are precomp. in %r11)*/ \
    asm("vmovdqa %ymm5, %ymm0");                                        \
    asm("vpxor %ymm6, %ymm0, %ymm0");                                   \
    MC_AVX2(ymm0);                                                      \
    asm("vpxor %ymm0, %ymm4, %ymm4");          /* XOR invMC(tweak)   */ \
    asm("vmovdqa invT_1_4(%rip), %ymm0");                               \
    asm("add  $32, %r9");                      /* Round counter * 16 */ \
    asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4"); /* Subkeys            */ \
    /* ------------------------------------------------------------- */ \
  } while(0);




/*
** Perform the TWEAKEY schedule of Jolitk to produce the 25 subkeys for encryption
*/
__attribute__((noinline)) void TweakeyScheduleTK2(const uint8_t* subkeys, const uint8_t* subkeys2) {

  /*      Note (__cdecl calling convention):          */
  /*             subkeys is in %rdi                   */

  /* Avoid warnings */
  (void)subkeys;
  (void)subkeys2;

  /* Load constants (TBoxes) */
  asm("vmovdqa AndMask(%rip), %ymm7");
  asm("vmovdqa MulBy2(%rip), %ymm14");
  asm("lea RC(%rip), %r10");
  
  /* Load first half of the master key (K^1)  */
  asm("vmovdqa (%rdi), %ymm6");

  /* Load second half of the master key (K^2) */
  asm("vmovdqa (%rsi), %ymm4");

  /* Write the 33 subkeys (for 32 rounds) */ 
  /*****************************************/asm("vmovdqa      (%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,     (%rdi)"); /* store K^1_0  ^ K^2_0  ^ RC[ 0] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa    32(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,   32(%rdi)"); /* store K^1_1  ^ K^2_1  ^ RC[ 1] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa    64(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,   64(%rdi)"); /* store K^1_2  ^ K^2_2  ^ RC[ 2] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa    96(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,   96(%rdi)"); /* store K^1_3  ^ K^2_3  ^ RC[ 3] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   128(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  128(%rdi)"); /* store K^1_4  ^ K^2_4  ^ RC[ 4] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   160(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  160(%rdi)"); /* store K^1_5  ^ K^2_5  ^ RC[ 5] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   192(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  192(%rdi)"); /* store K^1_6  ^ K^2_6  ^ RC[ 6] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   224(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  224(%rdi)"); /* store K^1_7  ^ K^2_7  ^ RC[ 7] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   256(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  256(%rdi)"); /* store K^1_8  ^ K^2_8  ^ RC[ 8] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   288(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  288(%rdi)"); /* store K^1_9  ^ K^2_9  ^ RC[ 9] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   320(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  320(%rdi)"); /* store K^1_10 ^ K^2_10 ^ RC[10] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   352(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  352(%rdi)"); /* store K^1_11 ^ K^2_11 ^ RC[11] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   384(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  384(%rdi)"); /* store K^1_12 ^ K^2_12 ^ RC[12] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   416(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  416(%rdi)"); /* store K^1_13 ^ K^2_13 ^ RC[13] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   448(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  448(%rdi)"); /* store K^1_14 ^ K^2_14 ^ RC[14] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   480(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  480(%rdi)"); /* store K^1_15 ^ K^2_15 ^ RC[15] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   512(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  512(%rdi)"); /* store K^1_16 ^ K^2_16 ^ RC[16] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   544(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  544(%rdi)"); /* store K^1_17 ^ K^2_17 ^ RC[17] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   576(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  576(%rdi)"); /* store K^1_18 ^ K^2_18 ^ RC[18] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   608(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  608(%rdi)"); /* store K^1_19 ^ K^2_19 ^ RC[19] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   640(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  640(%rdi)"); /* store K^1_20 ^ K^2_20 ^ RC[20] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   672(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  672(%rdi)"); /* store K^1_21 ^ K^2_21 ^ RC[21] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   704(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  704(%rdi)"); /* store K^1_22 ^ K^2_22 ^ RC[22] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   736(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  736(%rdi)"); /* store K^1_23 ^ K^2_23 ^ RC[23] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   768(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  768(%rdi)"); /* store K^1_24 ^ K^2_24 ^ RC[24] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   800(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  800(%rdi)"); /* store K^1_25 ^ K^2_25 ^ RC[25] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   832(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  832(%rdi)"); /* store K^1_26 ^ K^2_26 ^ RC[26] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   864(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  864(%rdi)"); /* store K^1_27 ^ K^2_27 ^ RC[27] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   896(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  896(%rdi)"); /* store K^1_28 ^ K^2_28 ^ RC[28] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   928(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  928(%rdi)"); /* store K^1_29 ^ K^2_29 ^ RC[29] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   960(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  960(%rdi)"); /* store K^1_30 ^ K^2_30 ^ RC[30] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   992(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  992(%rdi)"); /* store K^1_31 ^ K^2_31 ^ RC[31] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa  1024(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5, 1024(%rdi)"); /* store K^1_32 ^ K^2_32 ^ RC[32] */

}


/*
** Perform the TWEAKEY schedule of Jolitk to produce the 25 subkeys for decryption
*/
__attribute__((noinline)) void TweakeyScheduleTK2_reverse(const uint8_t* subkeys, const uint8_t* subkeys2) {

  /*      Note (__cdecl calling convention):          */
  /*             subkeys is in %rdi                   */

  /* Avoid warnings */
  (void)subkeys;
  (void)subkeys2;

 /* Load constants (tables) */
 asm("vmovdqa AndMask(%rip), %ymm7");
 asm("vmovdqa AndMaskTopHalf(%rip), %ymm8");
 asm("vmovdqa AndMaskBottomHalf(%rip), %ymm9");
 asm("vmovdqa MulBy2(%rip), %ymm14");
 asm("lea RC(%rip), %r10");
  
  /* Load first half of the master key (K^1)  */
  asm("vmovdqa (%rdi), %ymm6");

  /* Load second half of the master key (K^2) */
  asm("vmovdqa (%rsi), %ymm4");

  /* Write the 33 subkeys (for 32 rounds) */ 
  /*****************************************/asm("vmovdqa      (%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,     (%rdi)"); /* store K^1_0  ^ K^2_0  ^ RC[ 0] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa    32(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,   32(%rdi)"); /* store K^1_1  ^ K^2_1  ^ RC[ 1] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa    64(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,   64(%rdi)"); /* store K^1_2  ^ K^2_2  ^ RC[ 2] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa    96(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,   96(%rdi)"); /* store K^1_3  ^ K^2_3  ^ RC[ 3] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   128(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  128(%rdi)"); /* store K^1_4  ^ K^2_4  ^ RC[ 4] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   160(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  160(%rdi)"); /* store K^1_5  ^ K^2_5  ^ RC[ 5] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   192(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  192(%rdi)"); /* store K^1_6  ^ K^2_6  ^ RC[ 6] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   224(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  224(%rdi)"); /* store K^1_7  ^ K^2_7  ^ RC[ 7] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   256(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  256(%rdi)"); /* store K^1_8  ^ K^2_8  ^ RC[ 8] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   288(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  288(%rdi)"); /* store K^1_9  ^ K^2_9  ^ RC[ 9] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   320(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  320(%rdi)"); /* store K^1_10 ^ K^2_10 ^ RC[10] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   352(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  352(%rdi)"); /* store K^1_11 ^ K^2_11 ^ RC[11] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   384(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  384(%rdi)"); /* store K^1_12 ^ K^2_12 ^ RC[12] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   416(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  416(%rdi)"); /* store K^1_13 ^ K^2_13 ^ RC[13] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   448(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  448(%rdi)"); /* store K^1_14 ^ K^2_14 ^ RC[14] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   480(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  480(%rdi)"); /* store K^1_15 ^ K^2_15 ^ RC[15] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   512(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  512(%rdi)"); /* store K^1_16 ^ K^2_16 ^ RC[16] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   544(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  544(%rdi)"); /* store K^1_17 ^ K^2_17 ^ RC[17] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   576(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  576(%rdi)"); /* store K^1_18 ^ K^2_18 ^ RC[18] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   608(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  608(%rdi)"); /* store K^1_19 ^ K^2_19 ^ RC[19] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   640(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  640(%rdi)"); /* store K^1_20 ^ K^2_20 ^ RC[20] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   672(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  672(%rdi)"); /* store K^1_21 ^ K^2_21 ^ RC[21] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   704(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  704(%rdi)"); /* store K^1_22 ^ K^2_22 ^ RC[22] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   736(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  736(%rdi)"); /* store K^1_23 ^ K^2_23 ^ RC[23] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   768(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  768(%rdi)"); /* store K^1_24 ^ K^2_24 ^ RC[24] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   800(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  800(%rdi)"); /* store K^1_25 ^ K^2_25 ^ RC[25] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   832(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  832(%rdi)"); /* store K^1_26 ^ K^2_26 ^ RC[26] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   864(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  864(%rdi)"); /* store K^1_27 ^ K^2_27 ^ RC[27] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   896(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  896(%rdi)"); /* store K^1_28 ^ K^2_28 ^ RC[28] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   928(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  928(%rdi)"); /* store K^1_29 ^ K^2_29 ^ RC[29] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   960(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  960(%rdi)"); /* store K^1_30 ^ K^2_30 ^ RC[30] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa   992(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5,  992(%rdi)"); /* store K^1_31 ^ K^2_31 ^ RC[31] */
  H_AVX2(ymm6); MUL_AND_H_AVX2(ymm4, ymm14); asm("vmovdqa  1024(%r10), %ymm5"); asm("vpxor %ymm4, %ymm5, %ymm5"); asm("vpxor %ymm6, %ymm5, %ymm5"); asm("vmovdqa %ymm5, 1024(%rdi)"); /* store K^1_32 ^ K^2_32 ^ RC[32] */

  /* The subkeys are used in reversed order.          */
  /* So we reverse the table.                         */
  asm("vmovdqa    (%rdi), %ymm6"); asm("vmovdqa 1024(%rdi), %ymm5"); asm("vmovdqa %ymm5,    (%rdi)"); asm("vmovdqa %ymm6, 1024(%rdi)");
  asm("vmovdqa  32(%rdi), %ymm6"); asm("vmovdqa  992(%rdi), %ymm5"); asm("vmovdqa %ymm5,  32(%rdi)"); asm("vmovdqa %ymm6,  992(%rdi)");
  asm("vmovdqa  64(%rdi), %ymm6"); asm("vmovdqa  960(%rdi), %ymm5"); asm("vmovdqa %ymm5,  64(%rdi)"); asm("vmovdqa %ymm6,  960(%rdi)");
  asm("vmovdqa  96(%rdi), %ymm6"); asm("vmovdqa  928(%rdi), %ymm5"); asm("vmovdqa %ymm5,  96(%rdi)"); asm("vmovdqa %ymm6,  928(%rdi)");
  asm("vmovdqa 128(%rdi), %ymm6"); asm("vmovdqa  896(%rdi), %ymm5"); asm("vmovdqa %ymm5, 128(%rdi)"); asm("vmovdqa %ymm6,  896(%rdi)");
  asm("vmovdqa 160(%rdi), %ymm6"); asm("vmovdqa  864(%rdi), %ymm5"); asm("vmovdqa %ymm5, 160(%rdi)"); asm("vmovdqa %ymm6,  864(%rdi)");
  asm("vmovdqa 192(%rdi), %ymm6"); asm("vmovdqa  832(%rdi), %ymm5"); asm("vmovdqa %ymm5, 192(%rdi)"); asm("vmovdqa %ymm6,  832(%rdi)");
  asm("vmovdqa 224(%rdi), %ymm6"); asm("vmovdqa  800(%rdi), %ymm5"); asm("vmovdqa %ymm5, 224(%rdi)"); asm("vmovdqa %ymm6,  800(%rdi)");
  asm("vmovdqa 256(%rdi), %ymm6"); asm("vmovdqa  768(%rdi), %ymm5"); asm("vmovdqa %ymm5, 256(%rdi)"); asm("vmovdqa %ymm6,  768(%rdi)");
  asm("vmovdqa 288(%rdi), %ymm6"); asm("vmovdqa  736(%rdi), %ymm5"); asm("vmovdqa %ymm5, 288(%rdi)"); asm("vmovdqa %ymm6,  736(%rdi)");
  asm("vmovdqa 320(%rdi), %ymm6"); asm("vmovdqa  704(%rdi), %ymm5"); asm("vmovdqa %ymm5, 320(%rdi)"); asm("vmovdqa %ymm6,  704(%rdi)");
  asm("vmovdqa 352(%rdi), %ymm6"); asm("vmovdqa  672(%rdi), %ymm5"); asm("vmovdqa %ymm5, 352(%rdi)"); asm("vmovdqa %ymm6,  672(%rdi)");
  asm("vmovdqa 384(%rdi), %ymm6"); asm("vmovdqa  640(%rdi), %ymm5"); asm("vmovdqa %ymm5, 384(%rdi)"); asm("vmovdqa %ymm6,  640(%rdi)");
  asm("vmovdqa 416(%rdi), %ymm6"); asm("vmovdqa  608(%rdi), %ymm5"); asm("vmovdqa %ymm5, 416(%rdi)"); asm("vmovdqa %ymm6,  608(%rdi)");
  asm("vmovdqa 448(%rdi), %ymm6"); asm("vmovdqa  576(%rdi), %ymm5"); asm("vmovdqa %ymm5, 448(%rdi)"); asm("vmovdqa %ymm6,  576(%rdi)");
  asm("vmovdqa 480(%rdi), %ymm6"); asm("vmovdqa  544(%rdi), %ymm5"); asm("vmovdqa %ymm5, 480(%rdi)"); asm("vmovdqa %ymm6,  544(%rdi)");

  /* For decryption using the table-based approach,            */
  /* we need to pass K_1, ..., K_32 through invMC (not K_0)    */
  asm("vmovdqa   32(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,   32(%rdi)");
  asm("vmovdqa   64(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,   64(%rdi)");
  asm("vmovdqa   96(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,   96(%rdi)");
  asm("vmovdqa  128(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  128(%rdi)");
  asm("vmovdqa  160(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  160(%rdi)");
  asm("vmovdqa  192(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  192(%rdi)");
  asm("vmovdqa  224(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  224(%rdi)");
  asm("vmovdqa  256(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  256(%rdi)");
  asm("vmovdqa  288(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  288(%rdi)");
  asm("vmovdqa  320(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  320(%rdi)");
  asm("vmovdqa  352(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  352(%rdi)");
  asm("vmovdqa  384(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  384(%rdi)");
  asm("vmovdqa  416(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  416(%rdi)");
  asm("vmovdqa  448(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  448(%rdi)");
  asm("vmovdqa  480(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  480(%rdi)");
  asm("vmovdqa  512(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  512(%rdi)");
  asm("vmovdqa  544(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  544(%rdi)");
  asm("vmovdqa  576(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  576(%rdi)");
  asm("vmovdqa  608(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  608(%rdi)");
  asm("vmovdqa  640(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  640(%rdi)");
  asm("vmovdqa  672(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  672(%rdi)");
  asm("vmovdqa  704(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  704(%rdi)");
  asm("vmovdqa  736(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  736(%rdi)");
  asm("vmovdqa  768(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  768(%rdi)");
  asm("vmovdqa  800(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  800(%rdi)");
  asm("vmovdqa  832(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  832(%rdi)");
  asm("vmovdqa  864(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  864(%rdi)");
  asm("vmovdqa  896(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  896(%rdi)");
  asm("vmovdqa  928(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  928(%rdi)");
  asm("vmovdqa  960(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  960(%rdi)");
  asm("vmovdqa  992(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6,  992(%rdi)");
  asm("vmovdqa 1024(%rdi), %ymm6"); MC_AVX2(ymm6); asm("vmovdqa %ymm6, 1024(%rdi)");
}


/*
** Perform the encryption of the input message by the Joltik-BC tweakable block cipher.
** The input "message" contains two 64-bit message blocks that are encrypted in parallel.
** The tweakey input "tweakey" contains the key and tweak material as 64-bit elements each.
** The cipher text contains the two encrypted 64-bit block.
*/
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

  /* Reset round counter (%r9) */
  asm("xor %r9, %r9");

  /* Load constants (TBoxes) */
  asm("vmovdqa T_1_4(%rip), %ymm0");
  asm("vmovdqa T_9_13(%rip), %ymm1");
  asm("vmovdqa T_4_1(%rip), %ymm2");
  asm("vmovdqa T_13_9(%rip), %ymm3");

  /* Load constants (tables) */
  /*asm("vmovdqa ShiftRowsT2(%rip), %ymm6");*/
  /*asm("vmovdqa ShiftRowsT1(%rip), %ymm15");*/
  asm("vmovdqa AndMask(%rip), %ymm7");
  asm("vmovdqa AndMaskTopHalf(%rip), %ymm8");
  asm("vmovdqa AndMaskBottomHalf(%rip), %ymm9");
  asm("vmovdqa MulBy2(%rip), %ymm14");
  asm("vmovdqa MulBy4(%rip), %ymm15");

  /* Load tweaks */
  asm("vmovdqa (%rdx), %ymm5");
  asm("vmovdqa (%rcx), %ymm6");

  /* Load array of subkeys */
  asm("mov %rsi, %r11");

  /* Load state */
  asm("vmovdqu (%rdi), %ymm4");

  /* Initial AddTweakey */
  asm("vpxor %ymm5, %ymm4, %ymm4");
  asm("vpxor %ymm6, %ymm4, %ymm4");
  asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4");

  /* 32 rounds */
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  JOLTIKROUND_AVX2();
  /* The output register is ymm4 */

  asm("vmovdqu %ymm4, (%r8)");

}


/*
** Perform the decryption of the input message by the Joltik-BC tweakable block cipher.
** The input "message" contains two 64-bit message blocks that are decrypted in parallel.
** The cipher text contains the two decrypted 64-bit block.
*/
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
  asm("vmovdqa invT_1_4(%rip), %ymm0");
  asm("vmovdqa invT_9_13(%rip), %ymm1");
  asm("vmovdqa invT_4_1(%rip), %ymm2");
  asm("vmovdqa invT_13_9(%rip), %ymm3");

  /* Load state */
  asm("vmovdqu (%rdi), %ymm4");

  /* Load tweaks */
  asm("vmovdqa (%rdx), %ymm5");
  asm("vmovdqa (%rcx), %ymm6");

  /* Load constants (tables) */
  /*asm("vmovdqa ShiftRowsT2(%rip), %ymm6");*/
  /*asm("vmovdqa invShiftRowsT1(%rip), %ymm15");*/
  asm("vmovdqa AndMask(%rip), %ymm7");
  asm("vmovdqa AndMaskTopHalf(%rip), %ymm8");
  asm("vmovdqa AndMaskBottomHalf(%rip), %ymm9");

  /* Apply the 24 TS rounds to the tweak to get the final one.  */
  /* Then, the decryption will get the previous                 */
  /* ones backwards, once at a time.                            */
  /* Note that H^8 = Id so H^32=Id, and multiplication by 4^32  */
  /* in GF(2^4)/0x3 is multiplication by 3.                     */
  asm("vmovdqa MulBy4(%rip), %ymm14");  /* 2^32 = 4 in GF(16)/3 */
  asm("vmovdqa MulBy4to32(%rip), %ymm15");
  MUL_AVX2(ymm5, ymm14);
  MUL_AVX2(ymm6, ymm15);

  /* In the rest, we use multication by 2^-1 */
  asm("vmovdqa DivBy2(%rip), %ymm14");
  asm("vmovdqa DivBy4(%rip), %ymm15");

  /* Load array of subkeys */
  asm("mov %rsi, %r11");

  /* Initial AddTweakey */
  asm("vpxor %ymm5, %ymm4, %ymm4");
  asm("vpxor %ymm6, %ymm4, %ymm4");
  asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4");

  /* Pass the state  through MC and then proceed to     */
  /* decryption using the table-based approach.         */
  MC_AVX2(ymm4);

  /* 32 rounds */
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  JOLTIKROUND_INVERSE_AVX2();
  /* The output register is ymm4 */

  /* Apply the MixColums to invert the last one performed in the table */
  MC_AVX2(ymm4);

  /* Write the result back to the function argument */
  asm("vmovdqu %ymm4, (%r8)");
}

