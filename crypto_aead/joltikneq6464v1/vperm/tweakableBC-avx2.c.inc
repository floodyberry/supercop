/*
 * Joltik=/=-64-64 Optimized (vperm) C Implementation
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
HIDDEN_ALIGN(32) uint8_t MulBy2to24[]   asm ("MulBy2to24") = {0, 10, 7, 13, 14, 4, 9, 3, 15, 5, 8, 2, 1, 11, 6, 12,    0, 10, 7, 13, 14, 4, 9, 3, 15, 5, 8, 2, 1, 11, 6, 12};

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
HIDDEN_ALIGN(32) uint8_t RC[32*32] asm("RC") = {
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
  0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00,    0x01, 0x23, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
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
/*      tweak:        ymm5                                           */
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
    asm("vpshufb %ymm15, %ymm13, %ymm13");                              \
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
    asm("vpshufb %ymm6, %ymm13, %ymm13");                               \
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
    /* ------------------------------------------------------------- */ \
    /* AddRoundTweakey (tweak in %ymm5, subkeys are precomp. in %r11)*/ \
    asm("add  $32, %r9");                 /* Round counter * 32      */ \
    asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4");                          \
    asm("vpxor %ymm5, %ymm4, %ymm4");                                   \
    } while(0); 



/*********************************************************************/
/* Joltik inverse round function on %ymm4                            */
/* Uses registers:                                                   */
/*      input/output: ymm4                                           */
/*      tweak:        ymm5                                           */
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
    asm("vpshufb %ymm15, %ymm13, %ymm13");                              \
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
    asm("vpshufb %ymm6, %ymm13, %ymm13");                               \
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
    /* ------------------------------------------------------------- */ \
    /* AddRoundTweakey (tweak in %ymm5, subkeys are precomp. in %r11)*/ \
    asm("vmovdqa %ymm5, %ymm0");                                        \
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
__attribute__((noinline)) void TweakeyScheduleTK2(const uint8_t* subkeys) {

  /*      Note (__cdecl calling convention):          */
  /*             subkeys is in %rdi                   */

  /* Avoid warnings */
  (void)subkeys;

  /* Load constants (TBoxes) */
  asm("vmovdqa AndMask(%rip), %ymm7");
  asm("lea RC(%rip), %r10");
  
  /* Load master key */
  asm("vmovdqa (%rdi), %ymm6");
  /***********/asm("vmovdqa     (%r10), %ymm5"); 
  asm("vpxor %ymm5, %ymm6, %ymm10"); 
  asm("vmovdqa %ymm10,    (%rdi)"); /* store K_0  ^ RC[ 0] */
  
  /* Write the 25 subkeys (for 24 rounds)             */ 
  H_AVX2(ymm6) asm("vmovdqa   32(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,  32(%rdi)"); /* store K_1  ^ RC[ 1] */
  H_AVX2(ymm6) asm("vmovdqa   64(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,  64(%rdi)"); /* store K_2  ^ RC[ 2] */
  H_AVX2(ymm6) asm("vmovdqa   96(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,  96(%rdi)"); /* store K_3  ^ RC[ 3] */
  H_AVX2(ymm6) asm("vmovdqa  128(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 128(%rdi)"); /* store K_4  ^ RC[ 4] */
  H_AVX2(ymm6) asm("vmovdqa  160(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 160(%rdi)"); /* store K_5  ^ RC[ 5] */
  H_AVX2(ymm6) asm("vmovdqa  192(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 192(%rdi)"); /* store K_6  ^ RC[ 6] */
  H_AVX2(ymm6) asm("vmovdqa  224(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 224(%rdi)"); /* store K_7  ^ RC[ 7] */
  H_AVX2(ymm6) asm("vmovdqa  256(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 256(%rdi)"); /* store K_8  ^ RC[ 8] */
  H_AVX2(ymm6) asm("vmovdqa  288(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 288(%rdi)"); /* store K_9  ^ RC[ 9] */
  H_AVX2(ymm6) asm("vmovdqa  320(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 320(%rdi)"); /* store K_10 ^ RC[10] */
  H_AVX2(ymm6) asm("vmovdqa  352(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 352(%rdi)"); /* store K_11 ^ RC[11] */
  H_AVX2(ymm6) asm("vmovdqa  384(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 384(%rdi)"); /* store K_12 ^ RC[12] */
  H_AVX2(ymm6) asm("vmovdqa  416(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 416(%rdi)"); /* store K_13 ^ RC[13] */
  H_AVX2(ymm6) asm("vmovdqa  448(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 448(%rdi)"); /* store K_14 ^ RC[14] */
  H_AVX2(ymm6) asm("vmovdqa  480(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 480(%rdi)"); /* store K_15 ^ RC[15] */
  H_AVX2(ymm6) asm("vmovdqa  512(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 512(%rdi)"); /* store K_16 ^ RC[16] */
  H_AVX2(ymm6) asm("vmovdqa  544(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 544(%rdi)"); /* store K_17 ^ RC[17] */
  H_AVX2(ymm6) asm("vmovdqa  576(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 576(%rdi)"); /* store K_18 ^ RC[18] */
  H_AVX2(ymm6) asm("vmovdqa  608(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 608(%rdi)"); /* store K_19 ^ RC[19] */
  H_AVX2(ymm6) asm("vmovdqa  640(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 640(%rdi)"); /* store K_20 ^ RC[20] */
  H_AVX2(ymm6) asm("vmovdqa  672(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 672(%rdi)"); /* store K_21 ^ RC[21] */
  H_AVX2(ymm6) asm("vmovdqa  704(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 704(%rdi)"); /* store K_22 ^ RC[22] */
  H_AVX2(ymm6) asm("vmovdqa  736(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 736(%rdi)"); /* store K_23 ^ RC[23] */
  H_AVX2(ymm6) asm("vmovdqa  768(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 768(%rdi)"); /* store K_24 ^ RC[24] */

}


/*
** Perform the TWEAKEY schedule of Jolitk to produce the 25 subkeys for decryption
*/
__attribute__((noinline)) void TweakeyScheduleTK2_reverse(const uint8_t* subkeys) {

  /*      Note (__cdecl calling convention):          */
  /*             subkeys is in %rdi                   */

  /* Avoid warnings */
  (void)subkeys;

 /* Load constants (tables) */
 asm("vmovdqa AndMask(%rip), %ymm7");
 asm("vmovdqa AndMaskTopHalf(%rip), %ymm8");
 asm("vmovdqa AndMaskBottomHalf(%rip), %ymm9");
 asm("lea RC(%rip), %r10");
  
  /* Load master key */
  asm("vmovdqa (%rdi), %ymm6");
  /***********/asm("vmovdqa     (%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,    (%rdi)"); /* store K_0  ^ RC[ 0] */
  
  /* Write the 25 subkeys (for 24 rounds)             */ 
  H_AVX2(ymm6) asm("vmovdqa   32(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,  32(%rdi)"); /* store K_1  ^ RC[ 1] */
  H_AVX2(ymm6) asm("vmovdqa   64(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,  64(%rdi)"); /* store K_2  ^ RC[ 2] */
  H_AVX2(ymm6) asm("vmovdqa   96(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10,  96(%rdi)"); /* store K_3  ^ RC[ 3] */
  H_AVX2(ymm6) asm("vmovdqa  128(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 128(%rdi)"); /* store K_4  ^ RC[ 4] */
  H_AVX2(ymm6) asm("vmovdqa  160(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 160(%rdi)"); /* store K_5  ^ RC[ 5] */
  H_AVX2(ymm6) asm("vmovdqa  192(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 192(%rdi)"); /* store K_6  ^ RC[ 6] */
  H_AVX2(ymm6) asm("vmovdqa  224(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 224(%rdi)"); /* store K_7  ^ RC[ 7] */
  H_AVX2(ymm6) asm("vmovdqa  256(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 256(%rdi)"); /* store K_8  ^ RC[ 8] */
  H_AVX2(ymm6) asm("vmovdqa  288(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 288(%rdi)"); /* store K_9  ^ RC[ 9] */
  H_AVX2(ymm6) asm("vmovdqa  320(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 320(%rdi)"); /* store K_10 ^ RC[10] */
  H_AVX2(ymm6) asm("vmovdqa  352(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 352(%rdi)"); /* store K_11 ^ RC[11] */
  H_AVX2(ymm6) asm("vmovdqa  384(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 384(%rdi)"); /* store K_12 ^ RC[12] */
  H_AVX2(ymm6) asm("vmovdqa  416(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 416(%rdi)"); /* store K_13 ^ RC[13] */
  H_AVX2(ymm6) asm("vmovdqa  448(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 448(%rdi)"); /* store K_14 ^ RC[14] */
  H_AVX2(ymm6) asm("vmovdqa  480(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 480(%rdi)"); /* store K_15 ^ RC[15] */
  H_AVX2(ymm6) asm("vmovdqa  512(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 512(%rdi)"); /* store K_16 ^ RC[16] */
  H_AVX2(ymm6) asm("vmovdqa  544(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 544(%rdi)"); /* store K_17 ^ RC[17] */
  H_AVX2(ymm6) asm("vmovdqa  576(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 576(%rdi)"); /* store K_18 ^ RC[18] */
  H_AVX2(ymm6) asm("vmovdqa  608(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 608(%rdi)"); /* store K_19 ^ RC[19] */
  H_AVX2(ymm6) asm("vmovdqa  640(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 640(%rdi)"); /* store K_20 ^ RC[20] */
  H_AVX2(ymm6) asm("vmovdqa  672(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 672(%rdi)"); /* store K_21 ^ RC[21] */
  H_AVX2(ymm6) asm("vmovdqa  704(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 704(%rdi)"); /* store K_22 ^ RC[22] */
  H_AVX2(ymm6) asm("vmovdqa  736(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 736(%rdi)"); /* store K_23 ^ RC[23] */
  H_AVX2(ymm6) asm("vmovdqa  768(%r10), %ymm5"); asm("vpxor %ymm5, %ymm6, %ymm10"); asm("vmovdqa %ymm10, 768(%rdi)"); /* store K_24 ^ RC[24] */

  /* The subkeys are used in reversed order.          */
  /* So we reverse the table.                         */
  asm("vmovdqa    (%rdi), %ymm6"); asm("vmovdqa 768(%rdi), %ymm5"); asm("vmovdqa %ymm5,    (%rdi)"); asm("vmovdqa %ymm6, 768(%rdi)");
  asm("vmovdqa  32(%rdi), %ymm6"); asm("vmovdqa 736(%rdi), %ymm5"); asm("vmovdqa %ymm5,  32(%rdi)"); asm("vmovdqa %ymm6, 736(%rdi)");
  asm("vmovdqa  64(%rdi), %ymm6"); asm("vmovdqa 704(%rdi), %ymm5"); asm("vmovdqa %ymm5,  64(%rdi)"); asm("vmovdqa %ymm6, 704(%rdi)");
  asm("vmovdqa  96(%rdi), %ymm6"); asm("vmovdqa 672(%rdi), %ymm5"); asm("vmovdqa %ymm5,  96(%rdi)"); asm("vmovdqa %ymm6, 672(%rdi)");
  asm("vmovdqa 128(%rdi), %ymm6"); asm("vmovdqa 640(%rdi), %ymm5"); asm("vmovdqa %ymm5, 128(%rdi)"); asm("vmovdqa %ymm6, 640(%rdi)");
  asm("vmovdqa 160(%rdi), %ymm6"); asm("vmovdqa 608(%rdi), %ymm5"); asm("vmovdqa %ymm5, 160(%rdi)"); asm("vmovdqa %ymm6, 608(%rdi)");
  asm("vmovdqa 192(%rdi), %ymm6"); asm("vmovdqa 576(%rdi), %ymm5"); asm("vmovdqa %ymm5, 192(%rdi)"); asm("vmovdqa %ymm6, 576(%rdi)");
  asm("vmovdqa 224(%rdi), %ymm6"); asm("vmovdqa 544(%rdi), %ymm5"); asm("vmovdqa %ymm5, 224(%rdi)"); asm("vmovdqa %ymm6, 544(%rdi)");
  asm("vmovdqa 256(%rdi), %ymm6"); asm("vmovdqa 512(%rdi), %ymm5"); asm("vmovdqa %ymm5, 256(%rdi)"); asm("vmovdqa %ymm6, 512(%rdi)");
  asm("vmovdqa 288(%rdi), %ymm6"); asm("vmovdqa 480(%rdi), %ymm5"); asm("vmovdqa %ymm5, 288(%rdi)"); asm("vmovdqa %ymm6, 480(%rdi)");
  asm("vmovdqa 320(%rdi), %ymm6"); asm("vmovdqa 448(%rdi), %ymm5"); asm("vmovdqa %ymm5, 320(%rdi)"); asm("vmovdqa %ymm6, 448(%rdi)");
  asm("vmovdqa 352(%rdi), %ymm6"); asm("vmovdqa 416(%rdi), %ymm5"); asm("vmovdqa %ymm5, 352(%rdi)"); asm("vmovdqa %ymm6, 416(%rdi)");


  /* For decryption using the table-based approach    */
  /* we need to pass K_1, ..., K_24 through invMC.    */
  asm("vmovdqa     (%rdi), %ymm6"); /*MC_AVX2(ymm6);*/ asm("vmovdqa %ymm6,    (%rdi)");
  asm("vmovdqa   32(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6,  32(%rdi)");
  asm("vmovdqa   64(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6,  64(%rdi)");
  asm("vmovdqa   96(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6,  96(%rdi)");
  asm("vmovdqa  128(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 128(%rdi)");
  asm("vmovdqa  160(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 160(%rdi)");
  asm("vmovdqa  192(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 192(%rdi)");
  asm("vmovdqa  224(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 224(%rdi)");
  asm("vmovdqa  256(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 256(%rdi)");
  asm("vmovdqa  288(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 288(%rdi)");
  asm("vmovdqa  320(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 320(%rdi)");
  asm("vmovdqa  352(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 352(%rdi)");
  asm("vmovdqa  384(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 384(%rdi)");
  asm("vmovdqa  416(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 416(%rdi)");
  asm("vmovdqa  448(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 448(%rdi)");
  asm("vmovdqa  480(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 480(%rdi)");
  asm("vmovdqa  512(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 512(%rdi)");
  asm("vmovdqa  544(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 544(%rdi)");
  asm("vmovdqa  576(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 576(%rdi)");
  asm("vmovdqa  608(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 608(%rdi)");
  asm("vmovdqa  640(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 640(%rdi)");
  asm("vmovdqa  672(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 672(%rdi)");
  asm("vmovdqa  704(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 704(%rdi)");
  asm("vmovdqa  736(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 736(%rdi)");
  asm("vmovdqa  768(%rdi), %ymm6");   MC_AVX2(ymm6);   asm("vmovdqa %ymm6, 768(%rdi)");
}


/*
** Perform the encryption of the input message by the Joltik-BC tweakable block cipher.
** The input "message" contains two 64-bit message blocks that are encrypted in parallel.
** The tweakey input "tweakey" contains the key and tweak material as 64-bit elements each.
** The cipher text contains the two encrypted 64-bit block.
*/
__attribute__((noinline)) void aesTweakEncrypt(const uint8_t* message, const uint8_t* subkeys, const uint8_t* tweak, uint8_t* ciphertext) {

  /*      Note (__cdecl calling convention):          */
  /*             message is in %rdi                   */
  /*             subkeys is in %rsi                   */
  /*             tweak in %rdx                        */
  /*             ciphertext in %rcx                   */

  /* Avoid warnings */
  (void)message;
  (void)subkeys;
  (void)tweak;
  (void)ciphertext;

  /* Reset round counter (%r9) */
  asm("xor %r9, %r9");

  /* Load constants (TBoxes) */
  asm("vmovdqa T_1_4(%rip), %ymm0");
  asm("vmovdqa T_9_13(%rip), %ymm1");
  asm("vmovdqa T_4_1(%rip), %ymm2");
  asm("vmovdqa T_13_9(%rip), %ymm3");

  /* Load constants (tables) */
  asm("vmovdqa ShiftRowsT2(%rip), %ymm6");
  asm("vmovdqa AndMask(%rip), %ymm7");
  asm("vmovdqa AndMaskTopHalf(%rip), %ymm8");
  asm("vmovdqa AndMaskBottomHalf(%rip), %ymm9");
  asm("vmovdqa MulBy2(%rip), %ymm14");
  asm("vmovdqa ShiftRowsT1(%rip), %ymm15");

  /* Load tweaks */
  asm("vmovdqa (%rdx), %ymm5");

  /* Load array of subkeys */
  asm("mov %rsi, %r11");

  /* Load state */
  asm("vmovdqu (%rdi), %ymm4");

  /* Initial AddTweakey */
  asm("vpxor %ymm5, %ymm4, %ymm4");
  asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4");

  /* 24 rounds */
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

  asm("vmovdqu %ymm4, (%rcx)");

}


/*
** Perform the decryption of the input message by the Joltik-BC tweakable block cipher.
** The input "message" contains two 64-bit message blocks that are decrypted in parallel.
** The cipher text contains the two decrypted 64-bit block.
*/
__attribute__((noinline)) void aesTweakDecrypt(const uint8_t* message, const uint8_t* subkeys, const uint8_t* tweak, uint8_t* ciphertext) {

  /*      Note (__cdecl calling convention):          */
  /*             message is in %rdi                   */
  /*             subkeys is in %rsi                   */
  /*             tweak in %rdx                        */
  /*             ciphertext in %rcx                   */

  /* Avoid warnings */
  (void)message;
  (void)subkeys;
  (void)tweak;
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

  /* Load constants (tables) */
  asm("vmovdqa ShiftRowsT2(%rip), %ymm6");
  asm("vmovdqa AndMask(%rip), %ymm7");
  asm("vmovdqa AndMaskTopHalf(%rip), %ymm8");
  asm("vmovdqa AndMaskBottomHalf(%rip), %ymm9");
  asm("vmovdqa invShiftRowsT1(%rip), %ymm15");

  /* Apply the 24 TS rounds to the tweak to get the final one.  */
  /* Then, the decryption will get the previous                 */
  /* ones backwards, once at a time.                            */
  /* Note that H^8 = Id so H^24=Id, and multiplication by 2^24  */
  /* in GF(2^4)/0x3 is multiplication by 10.                    */
  asm("vmovdqa MulBy2to24(%rip), %ymm14");
  MUL_AVX2(ymm5, ymm14);

  /* In the rest, we use multication by 2^-1 */
  asm("vmovdqa DivBy2(%rip), %ymm14");

  /* Load array of subkeys */
  asm("mov %rsi, %r11");

  /* Initial AddTweakey */
  asm("vpxor %ymm5, %ymm4, %ymm4");
  asm("vpxor (%r11, %r9, 1), %ymm4, %ymm4");

  /* Pass the state  through MC and then proceed to     */
  /* decryption using the table-based approach.         */
  MC_AVX2(ymm4);

  /* 24 rounds */
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
  asm("vmovdqu %ymm4, (%rcx)");
}

