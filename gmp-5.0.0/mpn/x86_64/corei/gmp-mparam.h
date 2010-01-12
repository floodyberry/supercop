/* Core i gmp-mparam.h -- Compiler/machine parameter header file.

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

/* 2667 MHz Core i7 */

#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD          6
#define MOD_1U_TO_MOD_1_1_THRESHOLD          5
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        12
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     11
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           18

#define MUL_TOOM22_THRESHOLD                18
#define MUL_TOOM33_THRESHOLD                57
#define MUL_TOOM44_THRESHOLD               166
#define MUL_TOOM6H_THRESHOLD               226
#define MUL_TOOM8H_THRESHOLD               333

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      97
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     108
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      98
#define MUL_TOOM42_TO_TOOM63_THRESHOLD     113

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 30
#define SQR_TOOM3_THRESHOLD                105
#define SQR_TOOM4_THRESHOLD                250
#define SQR_TOOM6_THRESHOLD                366
#define SQR_TOOM8_THRESHOLD                502

#define MULMOD_BNM1_THRESHOLD               11
#define SQRMOD_BNM1_THRESHOLD               16

#define MUL_FFT_TABLE  { 336, 800, 1600, 2816, 7168, 20480, 81920, 196608, 0 }
#define MUL_FFT_MODF_THRESHOLD             400
#define MUL_FFT_THRESHOLD                 4224

#define SQR_FFT_TABLE  { 336, 672, 1728, 2816, 7168, 20480, 49152, 196608, 0 }
#define SQR_FFT_MODF_THRESHOLD             336
#define SQR_FFT_THRESHOLD                 3264

#define MULLO_BASECASE_THRESHOLD             4
#define MULLO_DC_THRESHOLD                  17
#define MULLO_MUL_N_THRESHOLD             8397

#define DC_DIV_QR_THRESHOLD                 36
#define DC_DIVAPPR_Q_THRESHOLD             123
#define DC_BDIV_QR_THRESHOLD                32
#define DC_BDIV_Q_THRESHOLD                 68

#define INV_MULMOD_BNM1_THRESHOLD          124
#define INV_NEWTON_THRESHOLD               199
#define INV_APPR_THRESHOLD                 154

#define BINV_NEWTON_THRESHOLD              250
#define REDC_1_TO_REDC_2_THRESHOLD          10
#define REDC_2_TO_REDC_N_THRESHOLD          59

#define MU_DIV_QR_THRESHOLD               1334
#define MU_DIVAPPR_Q_THRESHOLD            1499
#define MUPI_DIV_QR_THRESHOLD              124
#define MU_BDIV_QR_THRESHOLD              1187
#define MU_BDIV_Q_THRESHOLD               1308

#define MATRIX22_STRASSEN_THRESHOLD         15
#define HGCD_THRESHOLD                     117
#define GCD_DC_THRESHOLD                   396
#define GCDEXT_DC_THRESHOLD                375
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                13
#define GET_STR_PRECOMPUTE_THRESHOLD        23
#define SET_STR_DC_THRESHOLD               226
#define SET_STR_PRECOMPUTE_THRESHOLD      1660

#define MUL_FFT_TABLE2 {{1,4}, {241,5}, {545,6}, {1345,7}, {3073,8}, {6913,9}, {7681,8}, {8449,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {26113,11}, {30721,10}, {31745,9}, {34305,10}, {51201,11}, {63489,10}, {79873,11}, {96257,10}, {98305,12}, {126977,11}, {129025,10}, {138241,11}, {195585,9}, {196097,10}, {196609,12}, {200705,11}, {204801,12}, {210945,11}, {217089,12}, {258049,11}, {261121,10}, {266241,11}, {295425,10}, {295937,9}, {296449,11}, {303105,10}, {305153,9}, {306177,11}, {308225,10}, {315393,11}, {317441,10}, {318465,11}, {323585,10}, {324609,11}, {327169,12}, {389121,11}, {417793,13}, {516097,12}, {520193,10}, {521217,11}, {587777,10}, {588801,12}, {596993,10}, {603137,12}, {651265,11}, {722945,12}, {724993,11}, {776193,12}, {782337,11}, {851969,12}, {913409,11}, {917505,13}, {1040385,12}, {1044481,11}, {1112065,12}, {1175553,11}, {1243137,12}, {1949697,14}, {2080769,13}, {2088961,12}, {2486273,13}, {2613249,12}, {2617345,11}, {2639873,12}, {2641921,11}, {2670593,12}, {2699265,11}, {2703361,12}, {2719745,11}, {2744321,12}, {2879489,13}, {3137537,12}, {3405825,13}, {3661825,12}, {3928065,14}, {4177921,13}, {4186113,12}, {4452353,13}, {4710401,12}, {4978689,13}, {5238785,12}, {5300225,13}, {5308417,12}, {5328897,13}, {5332993,12}, {5443585,13}, {5447681,12}, {5459969,13}, {5468161,12}, {5480449,13}, {5758977,14}, {6275073,13}, {7860225,15}, {8355841,14}, {8372225,13}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {273,5}, {545,6}, {1345,7}, {3073,8}, {6913,9}, {7681,8}, {8449,9}, {9729,8}, {10497,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {26113,11}, {30721,10}, {31745,9}, {34305,10}, {51201,11}, {63489,10}, {80897,11}, {96257,10}, {97281,12}, {126977,11}, {129025,10}, {137217,11}, {194561,10}, {196097,12}, {258049,11}, {261121,9}, {262145,10}, {263169,9}, {263681,10}, {264193,11}, {266241,10}, {274433,9}, {275457,10}, {279041,11}, {290817,9}, {294913,11}, {296961,9}, {300545,8}, {300801,9}, {301057,11}, {309249,9}, {310273,10}, {311297,12}, {315393,10}, {316417,11}, {327681,12}, {350209,10}, {351233,12}, {389121,10}, {392705,11}, {417793,13}, {516097,11}, {522241,10}, {524289,11}, {528385,10}, {529409,11}, {546817,10}, {547841,11}, {587777,10}, {620033,12}, {624641,11}, {653313,10}, {656385,11}, {669697,10}, {671745,11}, {677889,10}, {684033,11}, {720897,12}, {735233,11}, {737281,12}, {761857,11}, {763905,12}, {774145,11}, {776193,12}, {778241,11}, {849921,12}, {851969,11}, {854017,12}, {856065,11}, {860161,12}, {905217,11}, {907265,12}, {913409,11}, {980993,13}, {1040385,12}, {1044481,11}, {1112065,12}, {1175553,11}, {1234945,12}, {1306625,11}, {1323009,12}, {1327105,11}, {1357825,12}, {1439745,13}, {1564673,12}, {1964033,14}, {2080769,13}, {2088961,12}, {2486273,13}, {2613249,12}, {2879489,13}, {3137537,12}, {3403777,13}, {3661825,12}, {3928065,14}, {3932161,13}, {3948545,14}, {4046849,13}, {4079617,14}, {4177921,13}, {4186113,12}, {4452353,13}, {4710401,12}, {4759553,13}, {4767745,12}, {4976641,13}, {5234689,12}, {5378049,13}, {5386241,12}, {5500929,13}, {5758977,14}, {6275073,13}, {7856129,15}, {7897089,14}, {7913473,15}, {7929857,14}, {8077313,15}, {8093697,14}, {8273921,15}, {8323073,14}, {8372225,13}, {MP_SIZE_T_MAX, 0}}
