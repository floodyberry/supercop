/* Intel Atom/64 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007,
2008, 2009, 2010 Free Software Foundation, Inc.

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

#define GMP_LIMB_BITS 64
#define BYTES_PER_MP_LIMB 8

#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         19
#define MOD_1U_TO_MOD_1_1_THRESHOLD          8
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        16
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     69
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           32

#define MUL_TOOM22_THRESHOLD                10
#define MUL_TOOM33_THRESHOLD                66
#define MUL_TOOM44_THRESHOLD               118
#define MUL_TOOM6H_THRESHOLD               157
#define MUL_TOOM8H_THRESHOLD               236

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      65
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      76
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      73
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      66

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 16
#define SQR_TOOM3_THRESHOLD                 65
#define SQR_TOOM4_THRESHOLD                166
#define SQR_TOOM6_THRESHOLD                226
#define SQR_TOOM8_THRESHOLD                333

#define MULMOD_BNM1_THRESHOLD                9
#define SQRMOD_BNM1_THRESHOLD                9

#define MUL_FFT_TABLE  { 272, 544, 1088, 1792, 5120, 12288, 49152, 196608, 786432, 0 }
#define MUL_FFT_MODF_THRESHOLD             240
#define MUL_FFT_THRESHOLD                 1856

#define SQR_FFT_TABLE  { 272, 544, 1088, 1792, 5120, 12288, 49152, 196608, 786432, 0 }
#define SQR_FFT_MODF_THRESHOLD             216
#define SQR_FFT_THRESHOLD                 1600

#define MULLO_BASECASE_THRESHOLD             2
#define MULLO_DC_THRESHOLD                  22
#define MULLO_MUL_N_THRESHOLD             4141

#define DC_DIV_QR_THRESHOLD                 26
#define DC_DIVAPPR_Q_THRESHOLD              93
#define DC_BDIV_QR_THRESHOLD                27
#define DC_BDIV_Q_THRESHOLD                 62

#define INV_MULMOD_BNM1_THRESHOLD          100
#define INV_NEWTON_THRESHOLD               147
#define INV_APPR_THRESHOLD                 108

#define BINV_NEWTON_THRESHOLD              165
#define REDC_1_TO_REDC_2_THRESHOLD          12
#define REDC_2_TO_REDC_N_THRESHOLD          36

#define MU_DIV_QR_THRESHOLD                792
#define MU_DIVAPPR_Q_THRESHOLD             807
#define MUPI_DIV_QR_THRESHOLD               58
#define MU_BDIV_QR_THRESHOLD               654
#define MU_BDIV_Q_THRESHOLD                792

#define MATRIX22_STRASSEN_THRESHOLD         13
#define HGCD_THRESHOLD                      83
#define GCD_DC_THRESHOLD                   198
#define GCDEXT_DC_THRESHOLD                198
#define JACOBI_BASE_METHOD                   2

#define GET_STR_DC_THRESHOLD                15
#define GET_STR_PRECOMPUTE_THRESHOLD        27
#define SET_STR_DC_THRESHOLD               254
#define SET_STR_PRECOMPUTE_THRESHOLD      1122

#define MUL_FFT_TABLE2 {{1,4}, {177,5}, {353,6}, {833,7}, {2177,8}, {4865,9}, {5633,8}, {6401,10}, {7169,9}, {11777,10}, {15361,9}, {19969,10}, {23553,9}, {24065,11}, {30721,10}, {48129,11}, {63489,10}, {80897,11}, {96257,10}, {97281,9}, {114177,11}, {114689,12}, {126977,11}, {129025,10}, {146945,11}, {161793,10}, {179969,11}, {194561,10}, {228353,12}, {258049,11}, {359937,12}, {389121,11}, {456705,13}, {516097,12}, {520193,11}, {588801,12}, {651265,11}, {719873,12}, {782337,11}, {849921,12}, {913409,11}, {980993,13}, {1040385,12}, {1439745,13}, {1564673,12}, {1961985,13}, {2088961,12}, {2357249,13}, {2613249,12}, {2881537,13}, {3137537,12}, {3403777,13}, {3661825,14}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {177,5}, {353,6}, {833,7}, {2177,8}, {4865,9}, {5633,8}, {6401,10}, {7169,9}, {11777,10}, {15361,9}, {19969,10}, {23553,9}, {24065,11}, {30721,10}, {48129,11}, {63489,10}, {72705,9}, {81665,11}, {96257,9}, {97793,8}, {105473,10}, {106497,12}, {126977,11}, {129025,10}, {195585,9}, {212481,11}, {228353,12}, {258049,11}, {391169,10}, {424961,11}, {457729,13}, {516097,12}, {520193,11}, {588801,12}, {651265,11}, {719873,12}, {782337,11}, {849921,12}, {916481,13}, {1040385,12}, {1439745,13}, {1564673,12}, {1830913,14}, {2080769,13}, {2088961,12}, {2355201,13}, {2613249,12}, {2879489,13}, {3137537,12}, {3162113,13}, {3227649,12}, {3395585,13}, {3661825,14}, {MP_SIZE_T_MAX, 0}}
