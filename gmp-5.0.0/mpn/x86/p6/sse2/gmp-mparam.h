/* Intel P6/sse2 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2003, 2008, 2009, 2010 Free
Software Foundation, Inc.

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at your
option) any later version.

The GNU MP Library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
License for more details.

You should have received a copy of the GNU Lesser General Public License
along with the GNU MP Library.  If not, see http://www.gnu.org/licenses/.  */


#define GMP_LIMB_BITS 32
#define BYTES_PER_MP_LIMB 4


/* NOTE: In a fat binary build SQR_TOOM2_THRESHOLD here cannot be more than the
   value in mpn/x86/p6/gmp-mparam.h.  The latter is used as a hard limit in
   mpn/x86/p6/sqr_basecase.asm.  */


/* 1867 MHz P6 model 13 */

#define MOD_1_NORM_THRESHOLD                 3
#define MOD_1_UNNORM_THRESHOLD               5
#define MOD_1N_TO_MOD_1_1_THRESHOLD         10
#define MOD_1U_TO_MOD_1_1_THRESHOLD          5
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         6
#define MOD_1_2_TO_MOD_1_4_THRESHOLD         0
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     23
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           22

#define MUL_TOOM22_THRESHOLD                20
#define MUL_TOOM33_THRESHOLD                77
#define MUL_TOOM44_THRESHOLD               182
#define MUL_TOOM6H_THRESHOLD               252
#define MUL_TOOM8H_THRESHOLD               381

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      75
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     122
#define MUL_TOOM42_TO_TOOM53_THRESHOLD     115
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      79

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 30
#define SQR_TOOM3_THRESHOLD                101
#define SQR_TOOM4_THRESHOLD                154
#define SQR_TOOM6_THRESHOLD                222
#define SQR_TOOM8_THRESHOLD                547

#define MULMOD_BNM1_THRESHOLD               13
#define SQRMOD_BNM1_THRESHOLD               18

#define MUL_FFT_TABLE  { 400, 928, 1664, 3584, 10240, 24576, 163840, 0 }
#define MUL_FFT_MODF_THRESHOLD             720
#define MUL_FFT_THRESHOLD                 7552

#define SQR_FFT_TABLE  { 400, 928, 1664, 3584, 10240, 40960, 163840, 0 }
#define SQR_FFT_MODF_THRESHOLD             592
#define SQR_FFT_THRESHOLD                 5760

#define MULLO_BASECASE_THRESHOLD             0  /* always */
#define MULLO_DC_THRESHOLD                  34
#define MULLO_MUL_N_THRESHOLD            13463

#define DC_DIV_QR_THRESHOLD                 19
#define DC_DIVAPPR_Q_THRESHOLD              56
#define DC_BDIV_QR_THRESHOLD                60
#define DC_BDIV_Q_THRESHOLD                132

#define INV_MULMOD_BNM1_THRESHOLD           83
#define INV_NEWTON_THRESHOLD                81
#define INV_APPR_THRESHOLD                  61

#define BINV_NEWTON_THRESHOLD              276
#define REDC_1_TO_REDC_N_THRESHOLD          63

#define MU_DIV_QR_THRESHOLD               1308
#define MU_DIVAPPR_Q_THRESHOLD             998
#define MUPI_DIV_QR_THRESHOLD               62
#define MU_BDIV_QR_THRESHOLD              1442
#define MU_BDIV_Q_THRESHOLD               1470

#define MATRIX22_STRASSEN_THRESHOLD         17
#define HGCD_THRESHOLD                      60
#define GCD_DC_THRESHOLD                   393
#define GCDEXT_DC_THRESHOLD                303
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                13
#define GET_STR_PRECOMPUTE_THRESHOLD        22
#define SET_STR_DC_THRESHOLD               587
#define SET_STR_PRECOMPUTE_THRESHOLD       983

#define MUL_FFT_TABLE2 {{1,4}, {337,5}, {801,6}, {1601,7}, {3457,8}, {3841,7}, {4481,8}, {4865,7}, {5249,8}, {6913,9}, {7681,8}, {9985,9}, {11777,8}, {13057,10}, {16897,8}, {22273,9}, {28417,10}, {30721,9}, {40961,10}, {48641,9}, {49153,11}, {63489,10}, {64513,9}, {72705,10}, {112641,11}, {129025,10}, {162817,11}, {194561,10}, {196609,12}, {258049,11}, {260097,10}, {278529,11}, {392705,9}, {395265,10}, {407553,11}, {452609,12}, {520193,11}, {522241,10}, {556545,11}, {587777,10}, {622081,11}, {653313,10}, {687105,12}, {782337,11}, {784385,10}, {818177,11}, {819201,13}, {1040385,12}, {1044481,11}, {1244161,12}, {1306625,11}, {1506305,12}, {1568769,11}, {1701889,10}, {1704961,12}, {1830913,11}, {1964033,13}, {2088961,12}, {2093057,11}, {2226177,12}, {2355201,11}, {2488321,12}, {2617345,11}, {2750465,12}, {2879489,11}, {3012609,13}, {3137537,12}, {3141633,11}, {3274753,12}, {3403777,11}, {3536897,12}, {3928065,14}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {337,5}, {801,6}, {1601,7}, {3457,8}, {3841,7}, {4481,8}, {4865,7}, {5249,8}, {5889,7}, {6273,8}, {6913,9}, {7681,8}, {9985,9}, {11777,8}, {13057,10}, {16641,8}, {17153,9}, {20993,7}, {25985,8}, {29697,9}, {40449,10}, {48129,9}, {49153,11}, {63489,10}, {64513,9}, {72705,10}, {97281,11}, {129025,10}, {162817,11}, {194561,10}, {195585,12}, {258049,11}, {260097,10}, {262145,9}, {264705,10}, {265729,9}, {267265,10}, {268289,9}, {269313,10}, {272897,9}, {278273,11}, {325633,10}, {359425,9}, {359937,11}, {391169,10}, {413697,11}, {456705,12}, {520193,11}, {522241,10}, {577537,11}, {581633,10}, {583681,11}, {585729,10}, {622081,11}, {653313,10}, {687617,11}, {718849,10}, {720897,12}, {782337,11}, {784385,10}, {818689,11}, {850945,13}, {1040385,12}, {1044481,11}, {1244161,12}, {1306625,11}, {1506305,12}, {1568769,11}, {1701889,10}, {1703937,12}, {1830913,11}, {1965057,13}, {2088961,12}, {2093057,11}, {2226177,12}, {2355201,11}, {2488321,12}, {2617345,11}, {2750465,12}, {2879489,11}, {3012609,13}, {3137537,12}, {3141633,11}, {3274753,12}, {3403777,11}, {3536897,12}, {3930113,14}, {MP_SIZE_T_MAX, 0}}
