/* Core 2 gmp-mparam.h -- Compiler/machine parameter header file.

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

/* 2133 MHz Core 2 (65nm) */

#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD          5
#define MOD_1U_TO_MOD_1_1_THRESHOLD          4
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        14
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     10
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           26

#define MUL_TOOM22_THRESHOLD                23
#define MUL_TOOM33_THRESHOLD                65
#define MUL_TOOM44_THRESHOLD               183
#define MUL_TOOM6H_THRESHOLD               254
#define MUL_TOOM8H_THRESHOLD               381

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      69
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     122
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      73
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      74

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 26
#define SQR_TOOM3_THRESHOLD                 97
#define SQR_TOOM4_THRESHOLD                148
#define SQR_TOOM6_THRESHOLD                270
#define SQR_TOOM8_THRESHOLD                296

#define MULMOD_BNM1_THRESHOLD               12
#define SQRMOD_BNM1_THRESHOLD               14

#define MUL_FFT_TABLE  { 336, 800, 1600, 3328, 7168, 20480, 81920, 196608, 0 }
#define MUL_FFT_MODF_THRESHOLD             400
#define MUL_FFT_THRESHOLD                 4736

#define SQR_FFT_TABLE  { 336, 672, 1728, 2816, 7168, 20480, 81920, 327680, 786432, 0 }
#define SQR_FFT_MODF_THRESHOLD             352
#define SQR_FFT_THRESHOLD                 3712

#define MULLO_BASECASE_THRESHOLD             3
#define MULLO_DC_THRESHOLD                  20
#define MULLO_MUL_N_THRESHOLD             8648

#define DC_DIV_QR_THRESHOLD                 52
#define DC_DIVAPPR_Q_THRESHOLD             167
#define DC_BDIV_QR_THRESHOLD                57
#define DC_BDIV_Q_THRESHOLD                156

#define INV_MULMOD_BNM1_THRESHOLD          126
#define INV_NEWTON_THRESHOLD               198
#define INV_APPR_THRESHOLD                 178

#define BINV_NEWTON_THRESHOLD              260
#define REDC_1_TO_REDC_2_THRESHOLD          10
#define REDC_2_TO_REDC_N_THRESHOLD          63

#define MU_DIV_QR_THRESHOLD               1334
#define MU_DIVAPPR_Q_THRESHOLD            1334
#define MUPI_DIV_QR_THRESHOLD               81
#define MU_BDIV_QR_THRESHOLD              1037
#define MU_BDIV_Q_THRESHOLD               1334

#define MATRIX22_STRASSEN_THRESHOLD         18
#define HGCD_THRESHOLD                     138
#define GCD_DC_THRESHOLD                   465
#define GCDEXT_DC_THRESHOLD                365
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                 9
#define GET_STR_PRECOMPUTE_THRESHOLD        20
#define SET_STR_DC_THRESHOLD               552
#define SET_STR_PRECOMPUTE_THRESHOLD      1790

#define MUL_FFT_TABLE2 {{1,4}, {273,5}, {545,6}, {1345,7}, {3201,8}, {6913,9}, {7681,8}, {8961,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {28161,11}, {30721,10}, {31745,9}, {34305,10}, {56321,11}, {61441,10}, {80897,11}, {96257,12}, {104449,10}, {105985,12}, {126977,11}, {129025,10}, {141313,11}, {163841,10}, {165889,11}, {194561,10}, {204801,11}, {227329,12}, {258049,11}, {261633,10}, {274433,11}, {292865,10}, {296961,11}, {299009,10}, {308225,11}, {326657,12}, {389121,11}, {424961,13}, {516097,12}, {520193,11}, {620545,12}, {651265,11}, {752641,12}, {782337,11}, {849921,12}, {913409,11}, {937985,13}, {944129,11}, {980993,13}, {1040385,12}, {1044481,11}, {1112065,12}, {1175553,11}, {1243137,12}, {1306625,11}, {1374209,12}, {1437697,11}, {1447937,13}, {1564673,12}, {1961985,14}, {2080769,13}, {2088961,12}, {2486273,13}, {2613249,12}, {3012609,13}, {3137537,12}, {3403777,13}, {3661825,12}, {3928065,14}, {4177921,13}, {4349953,12}, {4354049,13}, {4362241,12}, {4370433,13}, {4407297,12}, {4415489,13}, {4431873,12}, {4440065,13}, {4710401,12}, {4976641,13}, {5758977,12}, {5763073,14}, {6275073,13}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {273,5}, {545,6}, {1345,7}, {3201,8}, {3329,7}, {3457,8}, {6913,9}, {7681,8}, {8961,9}, {9729,8}, {10497,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {28161,11}, {30721,10}, {48129,11}, {63489,10}, {80897,11}, {96257,10}, {97281,12}, {102401,11}, {104449,12}, {126977,11}, {129025,10}, {138241,11}, {163329,10}, {179201,9}, {179713,11}, {210945,10}, {211969,11}, {221185,12}, {258049,10}, {262145,9}, {262657,10}, {274945,11}, {279553,9}, {280577,11}, {285697,10}, {286721,11}, {292865,10}, {293889,9}, {295937,10}, {296961,11}, {299009,10}, {309249,9}, {310785,11}, {331777,10}, {332801,11}, {339969,12}, {348161,11}, {352257,12}, {389121,11}, {391169,10}, {393217,11}, {402433,10}, {405505,11}, {425985,13}, {516097,11}, {528385,10}, {529409,11}, {565249,10}, {566273,11}, {622593,12}, {651265,11}, {718849,12}, {765953,11}, {768001,12}, {782337,11}, {849921,12}, {913409,11}, {930817,13}, {942081,11}, {980993,13}, {1040385,12}, {1044481,11}, {1112065,12}, {1175553,11}, {1243137,12}, {1437697,13}, {1564673,12}, {1961985,14}, {2080769,13}, {2088961,12}, {2486273,13}, {2613249,12}, {2879489,13}, {3137537,12}, {3272705,13}, {3661825,12}, {3665921,14}, {4177921,13}, {4235265,12}, {4276225,13}, {4710401,12}, {4849665,13}, {4866049,12}, {4964353,13}, {5263361,12}, {5300225,13}, {5324801,12}, {5332993,13}, {5349377,11}, {5353473,12}, {5357569,13}, {5369857,14}, {5373953,13}, {5423105,12}, {5455873,13}, {5603329,12}, {5611521,13}, {5664769,14}, {5668865,13}, {5758977,14}, {6275073,13}, {MP_SIZE_T_MAX, 0}}
