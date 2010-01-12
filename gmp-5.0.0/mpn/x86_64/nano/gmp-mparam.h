/* VIA Nano gmp-mparam.h -- Compiler/machine parameter header file.

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

/* 1600 MHz Nano 2xxx */

#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD          8
#define MOD_1U_TO_MOD_1_1_THRESHOLD          6
#define MOD_1_1_TO_MOD_1_2_THRESHOLD        10
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        14
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     14
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           24

#define MUL_TOOM22_THRESHOLD                28
#define MUL_TOOM33_THRESHOLD                37
#define MUL_TOOM44_THRESHOLD               315
#define MUL_TOOM6H_THRESHOLD               746
#define MUL_TOOM8H_THRESHOLD               866

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      73
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     201
#define MUL_TOOM42_TO_TOOM53_THRESHOLD     211
#define MUL_TOOM42_TO_TOOM63_THRESHOLD     219

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 38
#define SQR_TOOM3_THRESHOLD                 77
#define SQR_TOOM4_THRESHOLD                620
#define SQR_TOOM6_THRESHOLD                996
#define SQR_TOOM8_THRESHOLD               1138

#define MULMOD_BNM1_THRESHOLD               15
#define SQRMOD_BNM1_THRESHOLD               17

#define MUL_FFT_TABLE  { 368, 928, 1856, 2816, 7168, 28672, 81920, 327680, 0 }
#define MUL_FFT_MODF_THRESHOLD             464
#define MUL_FFT_THRESHOLD                 3712

#define SQR_FFT_TABLE  { 400, 864, 1856, 3328, 7168, 20480, 81920, 327680, 0 }
#define SQR_FFT_MODF_THRESHOLD             416
#define SQR_FFT_THRESHOLD                 3712

#define MULLO_BASECASE_THRESHOLD            19
#define MULLO_DC_THRESHOLD                   0  /* never mpn_mullo_basecase */
#define MULLO_MUL_N_THRESHOLD             7246

#define DC_DIV_QR_THRESHOLD                 55
#define DC_DIVAPPR_Q_THRESHOLD             160
#define DC_BDIV_QR_THRESHOLD                51
#define DC_BDIV_Q_THRESHOLD                 80

#define INV_MULMOD_BNM1_THRESHOLD          140
#define INV_NEWTON_THRESHOLD               163
#define INV_APPR_THRESHOLD                 157

#define BINV_NEWTON_THRESHOLD              228
#define REDC_1_TO_REDC_2_THRESHOLD          16
#define REDC_2_TO_REDC_N_THRESHOLD          71

#define MU_DIV_QR_THRESHOLD               1858
#define MU_DIVAPPR_Q_THRESHOLD            2009
#define MUPI_DIV_QR_THRESHOLD               79
#define MU_BDIV_QR_THRESHOLD              1387
#define MU_BDIV_Q_THRESHOLD               1787

#define MATRIX22_STRASSEN_THRESHOLD         21
#define HGCD_THRESHOLD                     118
#define GCD_DC_THRESHOLD                   416
#define GCDEXT_DC_THRESHOLD                511
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                13
#define GET_STR_PRECOMPUTE_THRESHOLD        21
#define SET_STR_DC_THRESHOLD               592
#define SET_STR_PRECOMPUTE_THRESHOLD      2044

#define MUL_FFT_TABLE2 {{1,4}, {273,5}, {673,6}, {1601,7}, {3073,8}, {6913,9}, {7681,8}, {8961,9}, {9729,8}, {11009,9}, {11777,8}, {12545,9}, {13825,10}, {15361,9}, {28161,11}, {30721,10}, {31745,9}, {36353,10}, {48129,9}, {50689,10}, {56321,11}, {63489,10}, {81409,11}, {96257,10}, {105473,12}, {126977,11}, {129025,10}, {146433,11}, {161793,10}, {179201,11}, {194561,10}, {211969,11}, {227329,12}, {258049,11}, {358401,12}, {389121,11}, {391169,10}, {395265,11}, {398337,10}, {405505,11}, {423937,9}, {424449,10}, {441345,11}, {442369,13}, {516097,12}, {520193,11}, {569345,10}, {581633,11}, {620545,12}, {651265,11}, {679937,10}, {720385,12}, {782337,10}, {785409,11}, {817153,10}, {818177,11}, {883713,12}, {913409,11}, {915457,10}, {982529,12}, {983041,13}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {305,5}, {673,6}, {1601,7}, {4097,8}, {8961,9}, {9729,8}, {10497,9}, {13825,10}, {15361,9}, {19969,10}, {31745,9}, {37377,10}, {56321,11}, {63489,10}, {89089,11}, {96257,10}, {105473,12}, {126977,11}, {129025,10}, {143361,11}, {161793,10}, {171009,11}, {194561,10}, {203777,11}, {227329,12}, {258049,11}, {326145,9}, {327425,11}, {327681,10}, {331777,12}, {389121,11}, {391169,10}, {392193,9}, {392961,10}, {402433,9}, {408577,11}, {425473,13}, {516097,12}, {520193,11}, {620545,12}, {651265,10}, {661505,11}, {663553,10}, {666625,9}, {667649,11}, {679937,10}, {719873,9}, {753153,10}, {753665,12}, {782337,10}, {794625,11}, {796673,10}, {870401,12}, {901121,11}, {905217,12}, {913409,11}, {915457,10}, {982529,12}, {983041,13}, {MP_SIZE_T_MAX, 0}}
