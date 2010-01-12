/* ultrasparc3/4 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2004, 2006, 2008, 2009,
2010 Free Software Foundation, Inc.

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

/* 1593 MHz ultrasparc3 running Solaris 10 (swift.nada.kth.se) */

#define DIVREM_1_NORM_THRESHOLD              0  /* always */
#define DIVREM_1_UNNORM_THRESHOLD            0  /* always */
#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX  /* never */
#define MOD_1U_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX
#define MOD_1_1_TO_MOD_1_2_THRESHOLD     MP_SIZE_T_MAX
#define MOD_1_2_TO_MOD_1_4_THRESHOLD     MP_SIZE_T_MAX
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD  MP_SIZE_T_MAX  /* never */
#define USE_PREINV_DIVREM_1                  1
#define DIVREM_2_THRESHOLD                   0  /* always */
#define DIVEXACT_1_THRESHOLD                 0  /* always */
#define BMOD_1_TO_MOD_1_THRESHOLD        MP_SIZE_T_MAX  /* never */

#define MUL_TOOM22_THRESHOLD                30
#define MUL_TOOM33_THRESHOLD                93
#define MUL_TOOM44_THRESHOLD               143
#define MUL_TOOM6H_THRESHOLD               165
#define MUL_TOOM8H_THRESHOLD               303

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      93
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      95
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      85
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      50

#define SQR_BASECASE_THRESHOLD              10
#define SQR_TOOM2_THRESHOLD                 72
#define SQR_TOOM3_THRESHOLD                 97
#define SQR_TOOM4_THRESHOLD                179
#define SQR_TOOM6_THRESHOLD                191
#define SQR_TOOM8_THRESHOLD                339

#define MULMOD_BNM1_THRESHOLD               14
#define SQRMOD_BNM1_THRESHOLD                9

#define MUL_FFT_TABLE  { 240, 480, 1344, 2304, 5120, 12288, 81920, 327680, 0 }
#define MUL_FFT_MODF_THRESHOLD             256
#define MUL_FFT_THRESHOLD                 2240

#define SQR_FFT_TABLE  { 304, 608, 1344, 2304, 7168, 12288, 81920, 327680, 0 }
#define SQR_FFT_MODF_THRESHOLD             248
#define SQR_FFT_THRESHOLD                 1984

#define MULLO_BASECASE_THRESHOLD            26
#define MULLO_DC_THRESHOLD                   0  /* never mpn_mullo_basecase */
#define MULLO_MUL_N_THRESHOLD             4392

#define DC_DIV_QR_THRESHOLD                 16
#define DC_DIVAPPR_Q_THRESHOLD              66
#define DC_BDIV_QR_THRESHOLD                26
#define DC_BDIV_Q_THRESHOLD                 92

#define INV_MULMOD_BNM1_THRESHOLD           76
#define INV_NEWTON_THRESHOLD                17
#define INV_APPR_THRESHOLD                  17

#define BINV_NEWTON_THRESHOLD              134
#define REDC_1_TO_REDC_2_THRESHOLD          10
#define REDC_2_TO_REDC_N_THRESHOLD         117

#define MU_DIV_QR_THRESHOLD                748
#define MU_DIVAPPR_Q_THRESHOLD             630
#define MUPI_DIV_QR_THRESHOLD                0  /* always */
#define MU_BDIV_QR_THRESHOLD               748
#define MU_BDIV_Q_THRESHOLD                807

#define MATRIX22_STRASSEN_THRESHOLD         12
#define HGCD_THRESHOLD                      39
#define GCD_DC_THRESHOLD                   130
#define GCDEXT_DC_THRESHOLD                134
#define JACOBI_BASE_METHOD                   2

#define GET_STR_DC_THRESHOLD                18
#define GET_STR_PRECOMPUTE_THRESHOLD        27
#define SET_STR_DC_THRESHOLD               315
#define SET_STR_PRECOMPUTE_THRESHOLD      1037

#define MUL_FFT_TABLE2 {{1,4}, {177,5}, {417,6}, {1089,7}, {2561,8}, {4865,9}, {5633,8}, {6401,10}, {7169,9}, {7681,8}, {8449,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {24065,11}, {30721,10}, {31745,9}, {34305,10}, {39937,9}, {42497,10}, {56321,11}, {63489,10}, {81921,11}, {96257,10}, {106241,12}, {126977,11}, {129025,10}, {146945,11}, {161793,10}, {179713,11}, {180737,9}, {181249,10}, {182273,11}, {194561,10}, {212993,11}, {228353,12}, {258049,11}, {359425,12}, {389121,11}, {456705,13}, {516097,12}, {520193,11}, {588801,12}, {651265,11}, {714753,12}, {782337,11}, {850945,12}, {913409,11}, {915457,13}, {1040385,12}, {1439745,13}, {1564673,12}, {1830913,14}, {1884161,12}, {1900545,14}, {1921025,12}, {1961985,14}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {241,5}, {481,6}, {1217,7}, {2561,8}, {6401,9}, {11777,10}, {15361,9}, {19969,10}, {23553,9}, {24065,11}, {30721,10}, {56321,11}, {63489,10}, {81665,11}, {96257,10}, {105473,9}, {114433,11}, {114689,12}, {126977,11}, {129025,10}, {130049,9}, {139009,10}, {146945,11}, {161793,10}, {179969,11}, {194561,10}, {228865,12}, {258049,11}, {260097,10}, {278017,11}, {458753,13}, {516097,12}, {520193,11}, {587777,10}, {589313,12}, {651265,11}, {719873,12}, {782337,11}, {850945,12}, {913409,11}, {982017,13}, {1040385,12}, {1044481,11}, {1113089,12}, {1187841,11}, {1191937,12}, {1196033,11}, {1212417,12}, {1220609,11}, {1224705,12}, {1439745,13}, {1564673,12}, {1961985,14}, {MP_SIZE_T_MAX, 0}}
